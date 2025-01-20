@interface AXOutputManager
+ (AXOutputManager)sharedOutputManager;
- (AXAccessQueue)outputAccessQueue;
- (AXOutputManager)init;
- (BOOL)_scatLanguage:(id)a3 matchesOverrideLanguage:(id)a4;
- (BOOL)_scatOutputCanSpeakString:(id)a3 withLanguage:(id)a4;
- (BOOL)_usesAVAudioPlayer;
- (BOOL)areSoundEffectsEnabled;
- (BOOL)isSoundAudioSessionActive;
- (BOOL)isSpeechAudioSessionActive;
- (BOOL)isSpeechEnabled;
- (BOOL)scanningInterruptsSpeech;
- (NSMutableArray)cachedRecentSpeechOutputRequests;
- (NSMutableDictionary)registeredSoundIDs;
- (NSMutableDictionary)soundIDsToAudioPlayer;
- (NSMutableSet)activeSoundIDs;
- (NSMutableSet)unfinishedSpeechActionsWithCompletionBlocks;
- (NSNumber)cacheSCVolumeForDuckingOff;
- (TTSSpeechManager)speechManager;
- (float)_volume;
- (id)_scatProcessAttributedString:(id)a3;
- (id)_urlForSoundEffect:(int)a3;
- (id)_voiceOverBundle;
- (id)processAXOutputAction:(id)a3;
- (id)selectionForLanguage:(id)a3;
- (unint64_t)lastSetOptions;
- (void)_applySelectionToAction:(id)a3 selection:(id)a4;
- (void)_audioPlayerFinished:(id)a3;
- (void)_flushSoundIDs;
- (void)_playSoundWithSoundID:(unsigned int)a3;
- (void)_scatAddCompletionBlockToAction:(id)a3 completionBlock:(id)a4;
- (void)_setDuckingLevelAlways:(double)a3;
- (void)_setDuckingLevelOnlySpeaking:(double)a3;
- (void)_setDuckingProperties;
- (void)_setUnDuckingProperties;
- (void)_updateAudioSessionProperties;
- (void)_updateDuckingMode;
- (void)_updateSoundEffect:(int)a3 isActive:(BOOL)a4;
- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4;
- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
- (void)cancelSpeech;
- (void)clearRecentSpeech;
- (void)dealloc;
- (void)dispatchSpeechAction:(id)a3;
- (void)outputScannerAnnouncement:(id)a3 completionBlock:(id)a4;
- (void)outputScannerAttributedString:(id)a3 completionBlock:(id)a4;
- (void)outputScannerFocusContext:(id)a3 completion:(id)a4;
- (void)playMouseClickSound;
- (void)playSound:(int)a3;
- (void)setActiveSoundIDs:(id)a3;
- (void)setCacheSCVolumeForDuckingOff:(id)a3;
- (void)setCachedRecentSpeechOutputRequests:(id)a3;
- (void)setLastSetOptions:(unint64_t)a3;
- (void)setOutputAccessQueue:(id)a3;
- (void)setRecentSpeechOutputStrings:(id)a3;
- (void)setRegisteredSoundIDs:(id)a3;
- (void)setSoundAudioSessionActive:(BOOL)a3;
- (void)setSoundEffectsEnabled:(BOOL)a3;
- (void)setSoundIDsToAudioPlayer:(id)a3;
- (void)setSpeechAudioSessionActive:(BOOL)a3;
- (void)setSpeechEnabled:(BOOL)a3;
- (void)setSpeechManager:(id)a3;
- (void)setUnfinishedSpeechActionsWithCompletionBlocks:(id)a3;
@end

@implementation AXOutputManager

+ (AXOutputManager)sharedOutputManager
{
  if (qword_1001F0BD0 != -1) {
    dispatch_once(&qword_1001F0BD0, &stru_1001AE2E8);
  }
  v2 = (void *)qword_1001F0BC8;

  return (AXOutputManager *)v2;
}

- (AXOutputManager)init
{
  v24.receiver = self;
  v24.super_class = (Class)AXOutputManager;
  v2 = [(AXOutputManager *)&v24 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    soundIDsToAudioPlayer = v2->_soundIDsToAudioPlayer;
    v2->_soundIDsToAudioPlayer = v3;

    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    activeSoundIDs = v2->_activeSoundIDs;
    v2->_activeSoundIDs = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    registeredSoundIDs = v2->_registeredSoundIDs;
    v2->_registeredSoundIDs = v7;

    v9 = (AXAccessQueue *)[objc_alloc((Class)AXAccessQueue) initWithParentClass:objc_opt_class() description:&stru_1001B1E10 appendUUIDToLabel:0];
    outputAccessQueue = v2->_outputAccessQueue;
    v2->_outputAccessQueue = v9;

    uint64_t v11 = +[NSMutableSet set];
    unfinishedSpeechActionsWithCompletionBlocks = v2->_unfinishedSpeechActionsWithCompletionBlocks;
    v2->_unfinishedSpeechActionsWithCompletionBlocks = (NSMutableSet *)v11;

    uint64_t v13 = +[NSMutableArray array];
    cachedRecentSpeechOutputRequests = v2->_cachedRecentSpeechOutputRequests;
    v2->_cachedRecentSpeechOutputRequests = (NSMutableArray *)v13;

    v2->_lastSetOptions = 0;
    LODWORD(v15) = 1.0;
    v2->_cacheSCVolumeForDuckingOff = (NSNumber *)+[NSNumber numberWithFloat:v15];
    objc_initWeak(&location, v2);
    v16 = +[AXSettings sharedInstance];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000C7698;
    v21[3] = &unk_1001AAA68;
    objc_copyWeak(&v22, &location);
    [v16 registerUpdateBlock:v21 forRetrieveSelector:"voiceOverMediaDuckingAmount" withListener:v2];

    objc_destroyWeak(&v22);
    v17 = +[AXSettings sharedInstance];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000C76D8;
    v19[3] = &unk_1001AAA68;
    objc_copyWeak(&v20, &location);
    [v17 registerUpdateBlock:v19 forRetrieveSelector:"voiceOverMediaDuckingMode" withListener:v2];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  [(AXOutputManager *)self _flushSoundIDs];
  v3.receiver = self;
  v3.super_class = (Class)AXOutputManager;
  [(AXOutputManager *)&v3 dealloc];
}

- (void)setSpeechEnabled:(BOOL)a3
{
  if (self->_speechEnabled != a3)
  {
    if (a3)
    {
      if (!self->_speechManager)
      {
        v5 = (TTSSpeechManager *)objc_alloc_init((Class)TTSSpeechManager);
        speechManager = self->_speechManager;
        self->_speechManager = v5;

        [(TTSSpeechManager *)self->_speechManager setSpeechSource:AXSpeechSourceKeySwitchControl];
        [(TTSSpeechManager *)self->_speechManager setAudioSessionCategory:AVAudioSessionCategoryVoiceOver];
        [(TTSSpeechManager *)self->_speechManager setUsesAuxiliarySession:1];
        [(AXOutputManager *)self _updateAudioSessionProperties];
      }
    }
    else
    {
      v7 = [(AXOutputManager *)self unfinishedSpeechActionsWithCompletionBlocks];
      id v8 = [v7 copy];

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v9 = v8;
      id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v22;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            objc_msgSend(v14, "completionCallback", (void)v21);
            double v15 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
            ((void (**)(void, void *, void))v15)[2](v15, v14, 0);
          }
          id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v11);
      }

      v16 = [(AXOutputManager *)self unfinishedSpeechActionsWithCompletionBlocks];
      id v17 = [v16 count];

      if (v17)
      {
        v18 = SWCHLogCommon();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
          sub_100115798(v18);
        }
      }
      v19 = [(AXOutputManager *)self unfinishedSpeechActionsWithCompletionBlocks];
      [v19 removeAllObjects];

      [(TTSSpeechManager *)self->_speechManager tearDown];
      id v20 = self->_speechManager;
      self->_speechManager = 0;

      self->_lastSetOptions = 0;
    }
    self->_speechEnabled = a3;
  }
}

- (void)setSpeechAudioSessionActive:(BOOL)a3
{
  if (self->_speechAudioSessionActive != a3) {
    self->_speechAudioSessionActive = a3;
  }
}

- (void)setSoundAudioSessionActive:(BOOL)a3
{
  if (self->_soundAudioSessionActive != a3) {
    self->_soundAudioSessionActive = a3;
  }
}

- (id)_voiceOverBundle
{
  return +[NSBundle bundleWithPath:@"/System/Library/CoreServices/VoiceOverTouch.app"];
}

- (BOOL)isSpeechEnabled
{
  if (self->_speechEnabled)
  {
    v2 = +[HNDAccessibilityManager sharedManager];
    unsigned int v3 = [v2 isSystemSleeping] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)areSoundEffectsEnabled
{
  if (self->_soundEffectsEnabled)
  {
    v2 = +[HNDAccessibilityManager sharedManager];
    unsigned int v3 = [v2 isSystemSleeping] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)playSound:(int)a3
{
  if ([(AXOutputManager *)self areSoundEffectsEnabled])
  {
    v5 = [(AXOutputManager *)self outputAccessQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000C7B10;
    v6[3] = &unk_1001AE310;
    v6[4] = self;
    int v7 = a3;
    [v5 performAsynchronousWritingBlock:v6];
  }
}

- (void)playMouseClickSound
{
  v2 = +[AXSettings sharedInstance];
  unsigned int v3 = [v2 assistiveTouchMouseClickSoundsEnabled];

  if (v3)
  {
    if (qword_1001F0BE0 != -1) {
      dispatch_once(&qword_1001F0BE0, &stru_1001AE330);
    }
    uint64_t v4 = dword_1001F0BD8;
    _AudioServicesPlaySoundWithBehavior(v4, 1111);
  }
}

- (void)dispatchSpeechAction:(id)a3
{
  id v10 = a3;
  [v10 setShouldProcessEmoji:1];
  [(AXOutputManager *)self _volume];
  [v10 setVolume:v4];
  [(TTSSpeechManager *)self->_speechManager dispatchSpeechAction:v10];
  v5 = [(AXOutputManager *)self cachedRecentSpeechOutputRequests];
  id v6 = [v5 count];

  if (v6 == (id)10)
  {
    int v7 = [(AXOutputManager *)self cachedRecentSpeechOutputRequests];
    [v7 removeObjectAtIndex:0];
  }
  id v8 = [v10 string];
  if ([v8 length])
  {
    id v9 = [(AXOutputManager *)self cachedRecentSpeechOutputRequests];
    [v9 addObject:v8];
  }
}

- (void)cancelSpeech
{
  [(TTSSpeechManager *)self->_speechManager clearSpeechQueue];
  speechManager = self->_speechManager;

  [(TTSSpeechManager *)speechManager stopSpeaking];
}

- (void)clearRecentSpeech
{
  id v2 = [(AXOutputManager *)self cachedRecentSpeechOutputRequests];
  [v2 removeAllObjects];
}

- (void)_playSoundWithSoundID:(unsigned int)a3
{
}

- (void)_flushSoundIDs
{
  unsigned int v3 = [(AXOutputManager *)self outputAccessQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000C80EC;
  v4[3] = &unk_1001AAA90;
  v4[4] = self;
  [v3 performSynchronousWritingBlock:v4];
}

- (id)_urlForSoundEffect:(int)a3
{
  switch(a3)
  {
    case 1000:
      id v4 = objc_allocWithZone((Class)NSURL);
      v5 = [(AXOutputManager *)self _voiceOverBundle];
      id v6 = [v5 resourcePath];
      +[NSString stringWithFormat:@"%@/Sounds/ElementBorder.aiff", v6];
      goto LABEL_10;
    case 1001:
      id v4 = objc_allocWithZone((Class)NSURL);
      v5 = [(AXOutputManager *)self _voiceOverBundle];
      id v6 = [v5 resourcePath];
      +[NSString stringWithFormat:@"%@/Sounds/Select.aiff", v6];
      goto LABEL_10;
    case 1002:
      id v4 = objc_allocWithZone((Class)NSURL);
      v5 = [(AXOutputManager *)self _voiceOverBundle];
      id v6 = [v5 resourcePath];
      +[NSString stringWithFormat:@"%@/Sounds/PopupAppeared.aiff", v6];
      goto LABEL_10;
    case 1003:
      id v4 = objc_allocWithZone((Class)NSURL);
      v5 = [(AXOutputManager *)self _voiceOverBundle];
      id v6 = [v5 resourcePath];
      +[NSString stringWithFormat:@"%@/Sounds/Alert.aiff", v6];
      goto LABEL_10;
    case 1004:
      id v4 = objc_allocWithZone((Class)NSURL);
      v5 = [(AXOutputManager *)self _voiceOverBundle];
      id v6 = [v5 resourcePath];
      +[NSString stringWithFormat:@"%@/Sounds/WrapBoundary.aiff", v6];
      goto LABEL_10;
    case 1005:
      id v4 = objc_allocWithZone((Class)NSURL);
      v5 = [(AXOutputManager *)self _voiceOverBundle];
      id v6 = [v5 resourcePath];
      +[NSString stringWithFormat:@"%@/Sounds/ScreenChange.aiff", v6];
      goto LABEL_10;
    case 1006:
      id v4 = objc_allocWithZone((Class)NSURL);
      v5 = [(AXOutputManager *)self _voiceOverBundle];
      id v6 = [v5 resourcePath];
      +[NSString stringWithFormat:@"%@/Sounds/iOSScreenOff.aiff", v6];
      id v8 = LABEL_10:;
      id v7 = [v4 initFileURLWithPath:v8 isDirectory:0];

      break;
    default:
      _AXLogWithFacility();
      id v7 = 0;
      break;
  }

  return v7;
}

- (void)_updateAudioSessionProperties
{
  if (self->_speechManager)
  {
    unsigned int v3 = SWCHLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = +[AXSettings sharedInstance];
      v5 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v4 voiceOverMediaDuckingMode]);
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Update audio session properties: ducking mode: %@.", buf, 0xCu);
    }
    id v6 = +[AXSettings sharedInstance];
    id v7 = [v6 voiceOverMediaDuckingMode];

    if (v7)
    {
      id v8 = +[AXSettings sharedInstance];
      if ([v8 voiceOverMediaDuckingMode] == (id)2) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = 2;
      }

      [(AXOutputManager *)self _setDuckingProperties];
    }
    else
    {
      [(AXOutputManager *)self _setUnDuckingProperties];
      uint64_t v9 = 1;
    }
    if (v9 == [(AXOutputManager *)self lastSetOptions])
    {
      id v10 = SWCHLogCommon();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
LABEL_18:

        return;
      }
      id v11 = +[NSNumber numberWithUnsignedInteger:self->_lastSetOptions];
      uint64_t v12 = +[NSNumber numberWithUnsignedInteger:v9];
      *(_DWORD *)buf = 138412546;
      v16 = v11;
      __int16 v17 = 2112;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Not updating audio session. New options are the same as current options: (lastSet: %@, newSet: %@)", buf, 0x16u);
    }
    else
    {
      [(AXOutputManager *)self setLastSetOptions:v9];
      [(TTSSpeechManager *)self->_speechManager setAudioSessionCategoryOptions:v9];
      if (![(AXOutputManager *)self _usesAVAudioPlayer]) {
        return;
      }
      uint64_t v13 = +[AVAudioSession sharedInstance];
      id v14 = 0;
      [v13 setCategory:AVAudioSessionCategoryVoiceOver withOptions:v9 error:&v14];
      id v10 = v14;

      if (!v10) {
        goto LABEL_18;
      }
      id v11 = SWCHLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100115870();
      }
    }

    goto LABEL_18;
  }
}

- (void)_setDuckingProperties
{
  if (self->_speechManager)
  {
    unsigned int v3 = SWCHLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = +[AXSettings sharedInstance];
      v5 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v4 voiceOverMediaDuckingMode]);
      int v11 = 138412290;
      uint64_t v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating audio ducking properties for audio ducking mode %@.", (uint8_t *)&v11, 0xCu);
    }
    id v6 = +[AXSettings sharedInstance];
    [v6 voiceOverMediaDuckingAmount];
    double v8 = 1.0 - v7;

    uint64_t v9 = +[AXSettings sharedInstance];
    id v10 = [v9 voiceOverMediaDuckingMode];

    if (v10 == (id)2)
    {
      [(AXOutputManager *)self _setDuckingLevelAlways:1.0 - v8];
    }
    else
    {
      [(AXOutputManager *)self _setDuckingLevelAlways:1.0];
      [(AXOutputManager *)self _setDuckingLevelOnlySpeaking:1.0 - v8];
    }
  }
}

- (void)_setUnDuckingProperties
{
  if (self->_speechManager)
  {
    unsigned int v3 = SWCHLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Resetting ducking levels to default.", v4, 2u);
    }

    [(AXOutputManager *)self _setDuckingLevelAlways:1.0];
    [(AXOutputManager *)self _setDuckingLevelOnlySpeaking:1.0];
  }
}

- (float)_volume
{
  id v2 = +[AXSettings sharedInstance];
  [v2 voiceOverEffectiveSpeakingVolume];
  float v4 = v3;

  return v4;
}

- (void)_updateDuckingMode
{
  if (self->_speechManager)
  {
    float v3 = SWCHLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      float v4 = +[AXSettings sharedInstance];
      v5 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v4 voiceOverMediaDuckingMode]);
      int v6 = 138412290;
      double v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Update Switch Control audio ducking mode: %@.", (uint8_t *)&v6, 0xCu);
    }
    [(AXOutputManager *)self _updateAudioSessionProperties];
  }
}

- (void)_setDuckingLevelAlways:(double)a3
{
  if (self->_speechManager)
  {
    float v4 = SWCHLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = +[NSNumber numberWithDouble:a3];
      int v11 = 138412290;
      uint64_t v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting audio ducking ALWAYS to duckingVolume level %@.", (uint8_t *)&v11, 0xCu);
    }
    int v6 = +[AVSystemController sharedAVSystemController];
    *(float *)&double v7 = a3;
    unsigned int v8 = [v6 setDuckScalarForVoiceOver:v7];
    if (v8)
    {
      int v9 = v8;
      id v10 = SWCHLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001158D8(v9, v10);
      }
    }
  }
}

- (void)_setDuckingLevelOnlySpeaking:(double)a3
{
  if (self->_speechManager)
  {
    v5 = SWCHLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = +[NSNumber numberWithDouble:a3];
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting audio ducking WHEN SPEAKING to ducking amount level %@.", buf, 0xCu);
    }
    double v7 = [(TTSSpeechManager *)self->_speechManager audioSession];
    unsigned int v8 = +[NSNumber numberWithDouble:a3];
    id v14 = 0;
    id v9 = [v7 setDuckToLevelScalar:v8 unduckToLevelScalar:0 error:&v14];
    id v10 = v14;

    if (v10)
    {
      int v11 = SWCHLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100115950();
      }
    }
    uint64_t v12 = SWCHLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = +[NSNumber numberWithBool:v9];
      *(_DWORD *)buf = 138412290;
      v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updated audio ducking level result: %@", buf, 0xCu);
    }
  }
}

- (void)_updateSoundEffect:(int)a3 isActive:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  double v7 = [(AXOutputManager *)self activeSoundIDs];
  unsigned int v8 = +[NSNumber numberWithUnsignedInt:v5];
  if (v4) {
    [v7 addObject:v8];
  }
  else {
    [v7 removeObject:v8];
  }

  id v9 = [(AXOutputManager *)self activeSoundIDs];
  id v10 = [v9 count];

  int v11 = +[AVAudioSession sharedInstance];
  char v12 = (v10 != 0) ^ [v11 isActive];

  if ((v12 & 1) == 0)
  {
    uint64_t v13 = +[AVAudioSession sharedInstance];
    id v16 = 0;
    [v13 setActive:v10 != 0 withOptions:0 error:&v16];
    id v14 = v16;

    if (v14)
    {
      double v15 = SWCHLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1001159B8();
      }
    }
  }
}

- (void)_audioPlayerFinished:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXOutputManager *)self soundIDsToAudioPlayer];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C8F98;
  v7[3] = &unk_1001AE358;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4
{
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
}

- (BOOL)_usesAVAudioPlayer
{
  return 0;
}

- (NSMutableDictionary)registeredSoundIDs
{
  return self->_registeredSoundIDs;
}

- (void)setRegisteredSoundIDs:(id)a3
{
}

- (AXAccessQueue)outputAccessQueue
{
  return self->_outputAccessQueue;
}

- (void)setOutputAccessQueue:(id)a3
{
}

- (TTSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)setSpeechManager:(id)a3
{
}

- (BOOL)isSoundAudioSessionActive
{
  return self->_soundAudioSessionActive;
}

- (BOOL)isSpeechAudioSessionActive
{
  return self->_speechAudioSessionActive;
}

- (void)setSoundEffectsEnabled:(BOOL)a3
{
  self->_soundEffectsEnabled = a3;
}

- (void)setRecentSpeechOutputStrings:(id)a3
{
}

- (NSMutableDictionary)soundIDsToAudioPlayer
{
  return self->_soundIDsToAudioPlayer;
}

- (void)setSoundIDsToAudioPlayer:(id)a3
{
}

- (NSMutableSet)activeSoundIDs
{
  return self->_activeSoundIDs;
}

- (void)setActiveSoundIDs:(id)a3
{
}

- (NSMutableSet)unfinishedSpeechActionsWithCompletionBlocks
{
  return self->_unfinishedSpeechActionsWithCompletionBlocks;
}

- (void)setUnfinishedSpeechActionsWithCompletionBlocks:(id)a3
{
}

- (NSMutableArray)cachedRecentSpeechOutputRequests
{
  return self->_cachedRecentSpeechOutputRequests;
}

- (void)setCachedRecentSpeechOutputRequests:(id)a3
{
}

- (unint64_t)lastSetOptions
{
  return self->_lastSetOptions;
}

- (void)setLastSetOptions:(unint64_t)a3
{
  self->_lastSetOptions = a3;
}

- (NSNumber)cacheSCVolumeForDuckingOff
{
  return self->_cacheSCVolumeForDuckingOff;
}

- (void)setCacheSCVolumeForDuckingOff:(id)a3
{
  self->_cacheSCVolumeForDuckingOff = (NSNumber *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedRecentSpeechOutputRequests, 0);
  objc_storeStrong((id *)&self->_unfinishedSpeechActionsWithCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_activeSoundIDs, 0);
  objc_storeStrong((id *)&self->_soundIDsToAudioPlayer, 0);
  objc_storeStrong((id *)&self->_recentSpeechOutputStrings, 0);
  objc_storeStrong((id *)&self->_speechManager, 0);
  objc_storeStrong((id *)&self->_outputAccessQueue, 0);

  objc_storeStrong((id *)&self->_registeredSoundIDs, 0);
}

- (id)selectionForLanguage:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_1000C92B0;
  id v14 = sub_1000C92C0;
  id v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C92C8;
  v7[3] = &unk_1001AE380;
  id v9 = &v10;
  id v4 = dispatch_semaphore_create(0);
  id v8 = v4;
  +[AXPrefsBridge voiceSelectionForLanguageCode:v3 completionHandler:v7];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v5;
}

- (id)_scatProcessAttributedString:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v27 = 0;
    uint64_t v28 = 0;
    id v26 = [v4 length];
    if (v26)
    {
      unint64_t v6 = 0;
      while (1)
      {
        double v7 = [v4 attributesAtIndex:v6 effectiveRange:&v27];
        id v8 = v7;
        if (v27 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        id v9 = objc_msgSend(v4, "substringWithRange:", v27, v28);
        id v10 = [objc_alloc((Class)AXOutputAction) initWithString:v9];
        int v11 = +[AXOutputRequest addAttributesToAction:v10 fromDictionary:v8];

        uint64_t v12 = [(AXOutputManager *)self processAXOutputAction:v11];
        [v12 setShouldProcessEmoji:1];
        [v9 rangeOfString:v9];
        uint64_t v13 = [v11 objectForVariant:16];

        uint64_t v14 = 16;
        if (v13
          || ([v11 objectForVariant:15],
              id v15 = objc_claimAutoreleasedReturnValue(),
              v15,
              uint64_t v14 = 15,
              v15))
        {
          [v12 setShouldDetectLanguage:1];
          id v16 = [v11 objectForVariant:v14];
          [v12 setLanguage:v16];
        }
        __int16 v17 = +[AXLanguageManager sharedInstance];
        v18 = [v17 systemLanguageID];

        uint64_t v19 = [v12 language];
        id v20 = (void *)v19;
        if (v19) {
          long long v21 = (void *)v19;
        }
        else {
          long long v21 = v18;
        }
        id v22 = v21;

        long long v23 = [(AXOutputManager *)self selectionForLanguage:v22];

        [(AXOutputManager *)self _applySelectionToAction:v12 selection:v23];
        [v5 addObject:v12];

        unint64_t v6 = v28 + v27;
        unint64_t v27 = v6;
        if (v6 >= (unint64_t)v26) {
          goto LABEL_15;
        }
      }
    }
  }
  else
  {
    long long v24 = +[TTSSpeechAction actionWithString:v4 shouldQueue:1];
    [v24 setShouldProcessEmoji:1];
    [v5 addObject:v24];
  }
LABEL_15:

  return v5;
}

- (void)_applySelectionToAction:(id)a3 selection:(id)a4
{
  id v22 = a3;
  id v5 = a4;
  unint64_t v6 = [v5 voiceId];
  [v22 setVoiceIdentifier:v6];

  double v7 = [v5 rate];
  if (v7)
  {
    id v8 = [v5 rate];
    [v8 floatValue];
    [v22 setSpeakingRate:v9];
  }
  else
  {
    [v22 setSpeakingRate:0.5];
  }

  id v10 = [v5 pitch];
  if (v10)
  {
    int v11 = [v5 pitch];
    [v11 floatValue];
    [v22 setPitch:v12];
  }
  else
  {
    [v22 setPitch:0.5];
  }

  [v22 pitch];
  double v14 = v13;
  [v22 pitch];
  if (v15 >= 0.5)
  {
    [v22 pitch];
    double v16 = (v17 + -1.0) * 2.0 + 2.0;
  }
  else
  {
    double v16 = v14 + 0.5;
  }
  float v18 = v16;
  [v22 setPitch:v18];
  uint64_t v19 = [v5 volume];
  if (v19)
  {
    id v20 = [v5 volume];
    [v20 floatValue];
    [v22 setVolume:v21];
  }
  else
  {
    [v22 setVolume:1.0];
  }
}

- (id)processAXOutputAction:(id)a3
{
  id v3 = [a3 string];
  id v4 = +[TTSSpeechAction actionWithString:v3 shouldQueue:1];

  return v4;
}

- (BOOL)_scatLanguage:(id)a3 matchesOverrideLanguage:(id)a4
{
  id v5 = a3;
  id v6 = [a4 lowercaseString];
  id v7 = [v6 rangeOfString:@"-"];
  id v8 = v6;
  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [v6 substringToIndex:v7];
  }
  unsigned __int8 v9 = [v5 hasPrefix:v8];

  return v9;
}

- (BOOL)_scatOutputCanSpeakString:(id)a3 withLanguage:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[AXLanguageManager sharedInstance];
  id v8 = [v7 dialectForLanguageID:v5];

  unsigned __int8 v9 = +[AXLanguageManager sharedInstance];
  id v10 = [v9 dialectsThatCanSpeakString:v6];

  LOBYTE(v6) = [v10 containsObject:v8];
  return (char)v6;
}

- (void)outputScannerFocusContext:(id)a3 completion:(id)a4
{
  id v16 = a3;
  id v6 = (void (**)(id, void))a4;
  if (![(AXOutputManager *)self isSpeechEnabled]) {
    _AXAssert();
  }
  if (![(AXOutputManager *)self isSpeechEnabled])
  {
    v6[2](v6, 0);
    goto LABEL_19;
  }
  if ([v16 selectBehavior] == 4)
  {
    id v7 = @"EXIT_GROUP";
LABEL_11:
    double v14 = sub_100040EC8(v7);
    goto LABEL_14;
  }
  id v8 = [v16 element];
  unsigned __int8 v9 = [v16 menuElement];

  if (v8 == v9)
  {
    id v7 = @"EXIT_MENU";
    goto LABEL_11;
  }
  id v10 = [v16 element];
  char v11 = objc_opt_respondsToSelector();

  float v12 = [v16 element];
  double v13 = v12;
  if (v11) {
    objc_msgSend(v12, "scatSpeakableDescription:", objc_msgSend(v16, "isFirstInSequence"));
  }
  else {
  double v14 = [v12 scatSpeakableDescription];
  }

LABEL_14:
  id v15 = [v14 length];
  if (!v6 || v15) {
    [(AXOutputManager *)self outputScannerAnnouncement:v14 completionBlock:v6];
  }
  else {
    v6[2](v6, 0);
  }

LABEL_19:
}

- (void)outputScannerAnnouncement:(id)a3 completionBlock:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = [(AXOutputManager *)self speechManager];
  [v7 stopSpeaking:0];

  id v8 = [(AXOutputManager *)self speechManager];
  [v8 clearSpeechQueue];

  if ([v15 isAXAttributedString])
  {
    id v9 = [objc_alloc((Class)AXAttributedString) initWithString:v15];
    [(AXOutputManager *)self outputScannerAttributedString:v9 completionBlock:v6];
  }
  else
  {
    id v9 = +[TTSSpeechAction actionWithString:v15 shouldQueue:1];
    [v9 setShouldProcessEmoji:1];
    id v10 = +[AXLanguageManager sharedInstance];
    uint64_t v11 = [v10 systemLanguageID];

    uint64_t v12 = [(AXOutputManager *)self selectionForLanguage:v11];
    [(AXOutputManager *)self _applySelectionToAction:v9 selection:v12];

    [(AXOutputManager *)self _scatAddCompletionBlockToAction:v9 completionBlock:v6];
    double v13 = +[HNDAccessibilityManager sharedManager];
    LOBYTE(v12) = [v13 isOKToSpeak];

    if (v12)
    {
      [(AXOutputManager *)self dispatchSpeechAction:v9];
    }
    else
    {
      double v14 = [v9 completionCallback];
      ((void (**)(void, id, void))v14)[2](v14, v9, 0);
    }
    id v6 = (id)v11;
  }
}

- (void)outputScannerAttributedString:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(AXOutputManager *)self _scatProcessAttributedString:a3];
  id v8 = [v7 lastObject];
  [(AXOutputManager *)self _scatAddCompletionBlockToAction:v8 completionBlock:v6];

  id v9 = +[HNDAccessibilityManager sharedManager];
  unsigned __int8 v10 = [v9 isOKToSpeak];

  if (v10)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = v7;
    id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        id v15 = 0;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          -[AXOutputManager dispatchSpeechAction:](self, "dispatchSpeechAction:", *(void *)(*((void *)&v19 + 1) + 8 * (void)v15), (void)v19);
          id v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }
  }
  else
  {
    id v16 = [v7 lastObject];
    double v17 = [v16 completionCallback];

    if (v17)
    {
      float v18 = [v16 completionCallback];
      ((void (**)(void, void *, void))v18)[2](v18, v16, 0);
    }
  }
}

- (void)_scatAddCompletionBlockToAction:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(AXOutputManager *)self unfinishedSpeechActionsWithCompletionBlocks];
    [v8 addObject:v6];

    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000C9F70;
    v9[3] = &unk_1001AE3D0;
    objc_copyWeak(&v11, &location);
    id v10 = v7;
    [v6 setCompletionCallback:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (BOOL)scanningInterruptsSpeech
{
  id v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 assistiveTouchScannerSpeechIsInterruptedByScanning];

  return v3;
}

@end