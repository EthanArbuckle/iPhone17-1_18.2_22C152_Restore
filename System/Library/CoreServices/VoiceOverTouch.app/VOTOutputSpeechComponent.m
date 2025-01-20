@interface VOTOutputSpeechComponent
+ (void)_setOverrideLocale:(id)a3;
- (BOOL)_currentLocaleUsesSpaceAsSeparator;
- (BOOL)_formatDetectedFinnishDates:(id)a3;
- (BOOL)_makeSubstitution:(id)a3 withString:(id)a4 punctuationGroup:(id)a5;
- (BOOL)_processActionForLiteralEmojis:(id)a3;
- (BOOL)_replaceRepeatedPuntuationAndEmoji:(id)a3 newString:(id)a4 charReplacementString:(id)a5 charSequence:(id)a6 charIndex:(int64_t *)a7 speakPunctuationCounts:(BOOL)a8 languageCode:(id)a9;
- (BOOL)_stringMatchesSpecialCases:(id)a3 forSymbol:(id)a4 ranges:(id *)a5 langaugeCode:(id)a6;
- (BOOL)_usingAllChannels;
- (BOOL)isPaused;
- (BOOL)isSpeaking;
- (BOOL)replacesCharacterAsPunctuation:(unsigned __int16)a3;
- (BOOL)stringIsInSupportedCharacters:(id)a3;
- (BSInvalidatable)disableIdleTimerAssertion;
- (NSDictionary)emoticonReplacements;
- (NSNumber)activityBasedAudioDucking;
- (TTSSpeechSynthesizer)synthesizer;
- (TTSSpeechSynthesizer)synthesizerForTelephonyMixin;
- (VOTOutputSpeechComponent)init;
- (double)outputMutedActivityLastToggleTime;
- (double)performSelector:(SEL)a3 withThreadKey:(id)a4 count:(unsigned int)a5 objects:(id)a6;
- (double)performSelector:(SEL)a3 withThreadKey:(id)a4 waitTime:(double)a5 cancelMask:(unsigned int)a6 count:(unsigned int)a7 objects:(id)a8;
- (float)_determineVolume:(id)a3;
- (float)_pauseDelayForType:(int)a3 speechRate:(float)a4 voiceType:(int64_t)a5;
- (float)mapSettingsPitchToSpeechPitch:(float)a3;
- (float)rate;
- (float)volume;
- (id)_determinePunctuationGroupForAction:(id)a3 isDefault:(BOOL *)a4;
- (id)_determineSpeechSourceForAction:(id)a3;
- (id)_determineVoiceIdentifier:(id)a3 languageCode:(id)a4;
- (id)_determineVoiceSelection:(id)a3 languageCode:(id)a4;
- (id)_internalVoiceOverSubstitutions;
- (id)_literalStringMarkupForString:(id)a3 languageCode:(id)a4 action:(id)a5;
- (id)_localeSpecificURLRegexForLanguageCode:(id)a3;
- (id)_localeSpecificURLsForLanguageCode:(id)a3;
- (id)_parseNumberInString:(id)a3 beforeCharacterAtIndex:(int64_t)a4 numberRange:(_NSRange *)a5;
- (id)_preferenceLanguageForLanguage:(id)a3 selectedLanguage:(id)a4;
- (id)_processCaptionTextForMarkup:(id)a3 regex:(id)a4 range:(_NSRange *)a5;
- (id)_replacePunctuation:(id)a3 punctuationGroup:(id)a4 hasMathContext:(BOOL)a5 hasPhoneContext:(BOOL)a6 isText:(BOOL)a7 replaceCommas:(BOOL)a8 languageCode:(id)a9 speakPunctuationCounts:(BOOL)a10;
- (id)_secureTextDescription:(id)a3;
- (id)_spokenTextForRequest:(id)a3 range:(_NSRange *)a4;
- (id)_stringForLiteralText:(id)a3 action:(id)a4 allowChangingLanguageForPunctuation:(BOOL)a5;
- (id)_stringForNormalText:(id)a3 action:(id)a4 allowPausingAtBoundaries:(BOOL)a5 ignoreLeadingCommas:(BOOL)a6;
- (id)_urlRangesInString:(id)a3 languageCode:(id)a4;
- (id)baseTableForPunctuationGroup:(id)a3;
- (id)currentAllPunctuationTable;
- (id)currentNonePunctuationTable;
- (id)currentSomePunctuationTable;
- (id)expectedVoiceIdentifier:(id)a3;
- (id)fileSystemPunctuationGroup;
- (id)outputMutedActivityValue:(id)a3;
- (id)pauseStringForType:(int)a3 voiceIdentifier:(id)a4 rate:(float)a5;
- (id)punctuationReplacement:(id)a3 withGroup:(id)a4 baseTable:(id)a5 languageCode:(id)a6 selectedLanguage:(id)a7 spokenLanguage:(id)a8;
- (id)replacePunctuation:(id)a3 punctuationGroup:(id)a4 replaceCommas:(BOOL)a5 languageCode:(id)a6;
- (id)stringReplacingBrailleDotRanges:(id)a3;
- (int64_t)_ttsVoiceTypeForPauseCalculationWithVoiceIdentifier:(id)a3;
- (void)_appendLiteralCharacterString:(id)a3 toString:(id)a4 hasPhoneContext:(BOOL)a5 hasMathContext:(BOOL)a6 action:(id)a7 punctuationTableLanguageUsed:(BOOL *)a8;
- (void)_applyCamelCaseSeparation:(id)a3;
- (void)_applyTelephoneFormatting:(id)a3 withRanges:(id)a4 languageCode:(id)a5 voiceIdentifier:(id)a6 rate:(float)a7;
- (void)_applyTransliteration:(id)a3 languageCode:(id)a4;
- (void)_audioSessionWasInterrupted:(id)a3;
- (void)_callStatusChanged;
- (void)_capVolumeForLanguage:(id)a3 volume:(float)a4;
- (void)_configureSynthesizerWithPhonemeSubstitutionsFromAction:(id)a3;
- (void)_createTelephonySynthesizer;
- (void)_determineEmojiPreferenceForAction:(id)a3;
- (void)_didFinishSpeaking:(id)a3;
- (void)_didStartSpeakingAction:(id)a3;
- (void)_formatATVStyleMediaDurations:(id)a3;
- (void)_formatDetectedDates:(id)a3 voiceIdentifier:(id)a4 languageCode:(id)a5 rate:(float)a6;
- (void)_formatEthernetMacAddress:(id)a3 voiceIdentifier:(id)a4 rate:(float)a5;
- (void)_formatExplicitTimeDuration:(id)a3 isMMSS:(BOOL)a4 languageCode:(id)a5;
- (void)_formatIPAddress:(id)a3 voiceIdentifier:(id)a4 rate:(float)a5;
- (void)_formatJapaneseYen:(id)a3;
- (void)_formatNumbers:(id)a3 action:(id)a4;
- (void)_formatTelephoneNumber:(id)a3 languageCode:(id)a4 voiceIdentifier:(id)a5 rate:(float)a6;
- (void)_formatTimeDuration:(id)a3 didMatch:(BOOL *)a4 voiceIdentifier:(id)a5 rate:(float)a6;
- (void)_formatUSHeight:(id)a3 voiceIdentifier:(id)a4;
- (void)_handleContinueSpeaking:(id)a3;
- (void)_handlePauseSpeaking:(id)a3;
- (void)_handlePerformAction:(id)a3;
- (void)_handleStopSpeaking:(id)a3;
- (void)_initializePunctuationData;
- (void)_initializeSynthesizer;
- (void)_initializeThread;
- (void)_insertLongerPausesForSymbol:(id)a3 withText:(id)a4 allowPausingAtBoundaries:(BOOL)a5 onlyApplyWhenFollowedBySpace:(BOOL)a6 languageCode:(id)a7 voiceIdentifier:(id)a8 rate:(float)a9;
- (void)_loadNoneTableOverrides;
- (void)_loadPunctuationTable:(id)a3 withLevel:(int64_t)a4 language:(id)a5;
- (void)_loadSpecialPunctuation;
- (void)_notifyDidFinishSpeakingWithFakeRequestForEvent:(id)a3;
- (void)_preprocessActionLanguageAndVoice:(id)a3;
- (void)_processEmoji:(id)a3 action:(id)a4 rate:(float)a5;
- (void)_removeRunsOfNewLines:(id)a3;
- (void)_replaceEmbeddedTTSCommands:(id)a3;
- (void)_replaceEmoticonsWithText:(id)a3;
- (void)_replacePunctuation:(id)a3 withAction:(id)a4 languageCode:(id)a5;
- (void)_replaceRepeatedEmoji:(id)a3;
- (void)_replaceUserSubstitutions:(id)a3 action:(id)a4;
- (void)_resetLanguageDataOnSpeechThread:(id)a3 language:(id)a4;
- (void)_saveSpeechStats;
- (void)_selectedLanguageChanged:(id)a3;
- (void)_setDuckingLevelAlways:(double)a3;
- (void)_setDuckingLevelOnlySpeaking:(double)a3;
- (void)_setDuckingProperties;
- (void)_setRate:(id)a3;
- (void)_setUnDuckingProperties;
- (void)_setVoice:(id)a3;
- (void)_speakAllDigits:(id)a3;
- (void)_speakAsLiteralText:(id)a3;
- (void)_speakAsMixOfLiteralAndNormalText:(id)a3 withLiteralRanges:(id)a4;
- (void)_speakAsNormalText:(id)a3;
- (void)_speakAsPhoneticText:(id)a3;
- (void)_stopSpeakingAfterLongPause:(id)a3;
- (void)_tearDownTelephonySynthesizer;
- (void)_uncapVolume:(float)a3;
- (void)_updateActionWithCanonicalMappings:(id)a3;
- (void)_updateAudioSessionProperties;
- (void)_updateChannelLayout;
- (void)_updateDuckingBasedOnActivity:(id)a3;
- (void)_updatePitch:(id)a3 settingsPitch:(float)a4;
- (void)_updateUserSubstitutions:(id)a3;
- (void)audioSessionWasInterrupted:(id)a3;
- (void)callStatusChanged;
- (void)continueSpeaking;
- (void)dealloc;
- (void)handleEvent:(id)a3;
- (void)pauseSpeakingAtBoundary:(int)a3;
- (void)preprocessAction:(id)a3;
- (void)setActivityBasedAudioDucking:(id)a3;
- (void)setDisableIdleTimerAssertion:(id)a3;
- (void)setDuckingProperties:(id)a3;
- (void)setEmoticonReplacements:(id)a3;
- (void)setRate:(float)a3;
- (void)setShouldOutputToHearingAid:(BOOL)a3;
- (void)setSynthesizerForTelephonyMixin:(id)a3;
- (void)setUnDuckingProperties:(id)a3;
- (void)setVoice:(id)a3;
- (void)speechSynthesizer:(id)a3 didFinishSpeakingRequest:(id)a4 successfully:(BOOL)a5 withError:(id)a6;
- (void)speechSynthesizer:(id)a3 didStartSpeakingRequest:(id)a4;
- (void)speechSynthesizer:(id)a3 willSpeakRangeOfSpeechString:(_NSRange)a4 forRequest:(id)a5;
- (void)stopSpeakingAtBoundary:(int)a3;
- (void)stopSpeakingAtBoundary:(int)a3 allRequests:(BOOL)a4 sessionDeactivationDelay:(id)a5;
- (void)updateAudioSessionProperties:(id)a3;
- (void)updateDuckingMode:(id)a3;
@end

@implementation VOTOutputSpeechComponent

- (double)performSelector:(SEL)a3 withThreadKey:(id)a4 count:(unsigned int)a5 objects:(id)a6
{
  [(SCRCThread *)self->_speechThread performSelector:a3 onTarget:self count:*(void *)&a5 objects:a6];
  return result;
}

- (double)performSelector:(SEL)a3 withThreadKey:(id)a4 waitTime:(double)a5 cancelMask:(unsigned int)a6 count:(unsigned int)a7 objects:(id)a8
{
  if (a6 == -1) {
    *(void *)&a6 = 4289724415;
  }
  else {
    *(void *)&a6 = a6;
  }
  -[SCRCThread performSelector:onTarget:cancelMask:count:objects:](self->_speechThread, "performSelector:onTarget:cancelMask:count:objects:", a3, self, *(void *)&a6, *(void *)&a7, a8, a5);
  return result;
}

- (void)_initializeThread
{
  AXSetThreadPriority();
  id v4 = +[NSThread currentThread];
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  [v4 setName:v3];
}

- (id)_internalVoiceOverSubstitutions
{
  id v2 = [objc_alloc((Class)TTSSubstitution) init];
  v3 = sub_100051804(off_1001EA9E8, @"explict.symbol", 0);
  [v2 setOriginalString:v3];

  id v4 = sub_100051804(off_1001EA9E8, @"explict.symbol.translation", 0);
  [v2 setReplacementString:v4];

  id v7 = v2;
  v5 = +[NSArray arrayWithObjects:&v7 count:1];

  return v5;
}

- (void)_updateUserSubstitutions:(id)a3
{
  id v4 = a3;
  v5 = +[AXSettings sharedInstance];
  v6 = [v5 customPronunciationSubstitutions];

  id v9 = [(VOTOutputSpeechComponent *)self _internalVoiceOverSubstitutions];
  +[NSArray axArrayWithPossiblyNilArrays:](NSArray, "axArrayWithPossiblyNilArrays:", 2, v6, v9);
  id v7 = (NSArray *)objc_claimAutoreleasedReturnValue();

  [v4 setUserSubstitutions:v7];
  userSubstitutions = self->_userSubstitutions;
  self->_userSubstitutions = v7;
}

- (void)_tearDownTelephonySynthesizer
{
  v3 = AXLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Tearing down telephony synthesizer", v5, 2u);
  }

  id v4 = [(VOTOutputSpeechComponent *)self synthesizerForTelephonyMixin];
  [v4 stopSpeakingAtNextBoundary:0 error:0];

  [(VOTOutputSpeechComponent *)self setSynthesizerForTelephonyMixin:0];
}

- (void)_createTelephonySynthesizer
{
  v3 = AXLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Creating a telephony synthesizer", v8, 2u);
  }

  id v4 = [(VOTOutputSpeechComponent *)self synthesizerForTelephonyMixin];

  if (!v4)
  {
    id v5 = [objc_alloc((Class)TTSSpeechSynthesizer) init];
    [(VOTOutputSpeechComponent *)self setSynthesizerForTelephonyMixin:v5];

    v6 = [(VOTOutputSpeechComponent *)self synthesizerForTelephonyMixin];
    [(VOTOutputSpeechComponent *)self _updateUserSubstitutions:v6];

    id v7 = [(VOTOutputSpeechComponent *)self synthesizerForTelephonyMixin];
    [v7 setAudioQueueFlags:320];
  }
}

- (void)_initializeSynthesizer
{
  v3 = (TTSSpeechSynthesizer *)[objc_allocWithZone((Class)TTSSpeechSynthesizer) init];
  synthesizer = self->_synthesizer;
  self->_synthesizer = v3;

  objc_initWeak(&location, self);
  [(VOTOutputSpeechComponent *)self _updateUserSubstitutions:self->_synthesizer];
  [(TTSSpeechSynthesizer *)self->_synthesizer setDelegate:self];
  id v5 = +[AXSettings sharedInstance];
  -[VOTOutputSpeechComponent setShouldOutputToHearingAid:](self, "setShouldOutputToHearingAid:", [v5 voiceOverShouldOutputToHearingAid]);

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"updateAudioSessionProperties:" name:AVAudioSessionMediaServicesWereLostNotification object:0];

  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"updateAudioSessionProperties:" name:AVAudioSessionMediaServicesWereResetNotification object:0];

  v8 = +[NSNotificationCenter defaultCenter];
  id v9 = +[AVAudioSession sharedInstance];
  [v8 addObserver:self selector:"updateAudioSessionProperties:" name:AVAudioSessionRouteChangeNotification object:v9];

  v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"audioSessionWasInterrupted:" name:AVAudioSessionInterruptionNotification object:0];

  [(VOTOutputSpeechComponent *)self _updateAudioSessionProperties];
  v11 = +[AXSettings sharedInstance];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10002BEFC;
  v30[3] = &unk_1001B3AD8;
  objc_copyWeak(&v31, &location);
  v30[4] = self;
  [v11 registerUpdateBlock:v30 forRetrieveSelector:"customPronunciationSubstitutions" withListener:self];

  objc_destroyWeak(&v31);
  v12 = +[AXSettings sharedInstance];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10002BF58;
  v28[3] = &unk_1001B35A8;
  objc_copyWeak(&v29, &location);
  [v12 registerUpdateBlock:v28 forRetrieveSelector:"voiceOverShouldOutputToHearingAid" withListener:self];

  objc_destroyWeak(&v29);
  v13 = +[AXSettings sharedInstance];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10002BFC4;
  v26[3] = &unk_1001B35A8;
  objc_copyWeak(&v27, &location);
  [v13 registerUpdateBlock:v26 forRetrieveSelector:"voiceOverAudioDuckingEnabled" withListener:self];

  objc_destroyWeak(&v27);
  v14 = +[AXSettings sharedInstance];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10002C008;
  v24[3] = &unk_1001B35A8;
  objc_copyWeak(&v25, &location);
  [v14 registerUpdateBlock:v24 forRetrieveSelector:"_audioHardwareChannelLayout" withListener:self];

  objc_destroyWeak(&v25);
  v15 = +[AXSettings sharedInstance];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10002C04C;
  v22[3] = &unk_1001B35A8;
  objc_copyWeak(&v23, &location);
  [v15 registerUpdateBlock:v22 forRetrieveSelector:"voiceOverSpeaksOverTelephoneCalls" withListener:self];

  objc_destroyWeak(&v23);
  v16 = +[AXSettings sharedInstance];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002C08C;
  v20[3] = &unk_1001B35A8;
  objc_copyWeak(&v21, &location);
  [v16 registerUpdateBlock:v20 forRetrieveSelector:"voiceOverMediaDuckingAmount" withListener:self];

  objc_destroyWeak(&v21);
  v17 = +[AXSettings sharedInstance];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002C0D0;
  v18[3] = &unk_1001B35A8;
  objc_copyWeak(&v19, &location);
  [v17 registerUpdateBlock:v18 forRetrieveSelector:"voiceOverMediaDuckingMode" withListener:self];

  objc_destroyWeak(&v19);
  [(VOTOutputSpeechComponent *)self _callStatusChanged];
  objc_destroyWeak(&location);
}

- (void)callStatusChanged
{
}

- (void)_callStatusChanged
{
  v3 = +[AXSettings sharedInstance];
  unsigned int v4 = [v3 voiceOverSpeaksOverTelephoneCalls];

  if (v4)
  {
    unsigned int v5 = [(id)VOTSharedWorkspace telephonyIsActive];
    v6 = VOTLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109120;
      v7[1] = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Call status change to %d for telephony synthesizer", (uint8_t *)v7, 8u);
    }

    if (v5) {
      [(VOTOutputSpeechComponent *)self _createTelephonySynthesizer];
    }
    else {
      [(VOTOutputSpeechComponent *)self _tearDownTelephonySynthesizer];
    }
  }
  else
  {
    [(VOTOutputSpeechComponent *)self _tearDownTelephonySynthesizer];
  }
}

- (BOOL)_usingAllChannels
{
  id v2 = +[AXAudioHardwareManager sharedManager];
  v3 = +[AVAudioSession sharedInstance];
  unsigned int v4 = [v3 currentRoute];
  unsigned int v5 = [v2 savedChannelsForOutput:v4 forSource:1];

  v6 = +[AXAudioHardwareManager defaultPortChannels];
  if (v5)
  {
    if (![v5 isEqualToArray:v6])
    {
      BOOL v17 = 0;
      goto LABEL_16;
    }
    id v7 = +[AXSubsystemAudioRouting sharedInstance];
    unsigned __int8 v8 = [v7 ignoreLogging];

    if ((v8 & 1) == 0)
    {
      id v9 = +[AXSubsystemAudioRouting identifier];
      v10 = AXLoggerForFacility();

      os_log_type_t v11 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v10, v11))
      {
        v12 = AXColorizeFormatLog();
        v13 = _AXStringForArgs();
        if (os_log_type_enabled(v10, v11))
        {
          int v19 = 138543362;
          v20 = v13;
LABEL_11:
          _os_log_impl((void *)&_mh_execute_header, v10, v11, "%{public}@", (uint8_t *)&v19, 0xCu);
          goto LABEL_12;
        }
        goto LABEL_12;
      }
      goto LABEL_13;
    }
  }
  else
  {
    v14 = +[AXSubsystemAudioRouting sharedInstance];
    unsigned __int8 v15 = [v14 ignoreLogging];

    if ((v15 & 1) == 0)
    {
      v16 = +[AXSubsystemAudioRouting identifier];
      v10 = AXLoggerForFacility();

      os_log_type_t v11 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v10, v11))
      {
        v12 = AXColorizeFormatLog();
        v13 = _AXStringForArgs();
        if (os_log_type_enabled(v10, v11))
        {
          int v19 = 138543362;
          v20 = v13;
          goto LABEL_11;
        }
LABEL_12:
      }
LABEL_13:
    }
  }
  BOOL v17 = 1;
LABEL_16:

  return v17;
}

- (void)_audioSessionWasInterrupted:(id)a3
{
  id v4 = a3;
  if ([(VOTOutputSpeechComponent *)self isSpeaking] || self->_currentRequest)
  {
    unsigned int v5 = VOTLogAudio();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [v4 userInfo];
      id v7 = [v6 objectForKey:@"AVAudioSessionInterruptorNameKey"];
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "speech interrupted by %@ Dropping current speech request.", (uint8_t *)&v8, 0xCu);
    }
    self->_userStopped = 0;
    self->_isPaused = 0;
    [(SCRCTargetSelectorTimer *)self->_stopSpeakingAfterLongPauseTimer cancel];
    self->_lastTimeSpeechStarted = -3061152000.0;
    [(TTSSpeechSynthesizer *)self->_synthesizer stopSpeakingAtNextBoundary:0 error:0];
  }
}

- (void)audioSessionWasInterrupted:(id)a3
{
}

- (void)updateAudioSessionProperties:(id)a3
{
}

- (void)setDuckingProperties:(id)a3
{
}

- (void)setUnDuckingProperties:(id)a3
{
}

- (void)updateDuckingMode:(id)a3
{
}

- (void)_updateAudioSessionProperties
{
  if (([(SCRCThread *)self->_speechThread _debug_currentlyRunningOnThisThread] & 1) == 0)_AXAssert(); {
  v3 = VOTLogAudio();
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = +[AXSettings sharedInstance];
    unsigned int v5 = [v4 voiceOverAudioDuckingEnabled];
    unsigned int v6 = [(id)VOTSharedWorkspace audioDestinationRequestExternal];
    id v7 = +[AXSettings sharedInstance];
    *(_DWORD *)buf = 67109632;
    unsigned int v24 = v5;
    __int16 v25 = 1024;
    unsigned int v26 = v6;
    __int16 v27 = 1024;
    unsigned int v28 = [v7 voiceOverAudioFollowsHDMIAudio];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Update audio session properties: ducking:%d, destination external %d. Force VO->HDMI: %d", buf, 0x14u);
  }
  int v8 = +[AXSettings sharedInstance];
  unsigned int v9 = [v8 voiceOverAudioDuckingEnabled];

  if (AXRuntimeCheck_SupportsVoiceoverIndepedentVolume())
  {
    v10 = +[AXSettings sharedInstance];
    unsigned int v9 = [v10 voiceOverMediaDuckingMode] != 0;
  }
  if ([(id)VOTSharedWorkspace speechMuted])
  {
    os_log_type_t v11 = VOTLogAudio();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Not ducking because speech is muted", buf, 2u);
    }

    unsigned int v9 = 0;
  }
  if ([(id)VOTSharedWorkspace duckingTemporarilyDisabled])
  {
    v12 = VOTLogAudio();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Not ducking because the app told us to duck temporarily", buf, 2u);
    }

    unsigned int v9 = 0;
  }
  v13 = [(VOTOutputSpeechComponent *)self activityBasedAudioDucking];

  if (v13)
  {
    v14 = [(VOTOutputSpeechComponent *)self activityBasedAudioDucking];
    unsigned int v9 = [v14 BOOLValue];

    unsigned __int8 v15 = VOTLogAudio();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Ducking status change because the activity determined ducking: %d", buf, 8u);
    }
  }
  if ([(VOTOutputSpeechComponent *)self _usingAllChannels])
  {
    int v16 = AXRuntimeCheck_SupportsVoiceoverIndepedentVolume();
    if (v9)
    {
      if (v16)
      {
        BOOL v17 = +[AXSettings sharedInstance];
        if ([v17 voiceOverMediaDuckingMode] == (id)2) {
          uint64_t v18 = 1;
        }
        else {
          uint64_t v18 = 2;
        }
      }
      else
      {
        uint64_t v18 = 2;
      }
      if (AXRuntimeCheck_SupportsVoiceoverIndepedentVolume()) {
        [(VOTOutputSpeechComponent *)self setDuckingProperties:0];
      }
      goto LABEL_36;
    }
    uint64_t v18 = 1;
    if ((v16 & 1) == 0) {
      goto LABEL_36;
    }
LABEL_35:
    [(VOTOutputSpeechComponent *)self setUnDuckingProperties:0];
    goto LABEL_36;
  }
  int v19 = VOTLogAudio();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Not ducking because we're not using all channels", buf, 2u);
  }

  uint64_t v18 = 1;
  if (AXRuntimeCheck_SupportsVoiceoverIndepedentVolume()) {
    goto LABEL_35;
  }
LABEL_36:
  v20 = +[VOTOutputManager outputManager];
  id v21 = [v20 audioSessionQueue];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10002CB14;
  v22[3] = &unk_1001B35D0;
  void v22[4] = self;
  v22[5] = v18;
  [v21 performSynchronousWritingBlock:v22];

  [(VOTOutputSpeechComponent *)self _updateChannelLayout];
}

- (void)_setDuckingProperties
{
  v3 = +[AXSettings sharedInstance];
  [v3 voiceOverMediaDuckingAmount];
  double v5 = v4;

  unsigned int v6 = +[AXSettings sharedInstance];
  id v7 = [v6 voiceOverMediaDuckingMode];

  int v8 = VOTLogAudio();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = +[AXSettings sharedInstance];
    v10 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v9 voiceOverMediaDuckingMode]);
    os_log_type_t v11 = +[NSNumber numberWithDouble:v5];
    int v12 = 138412546;
    v13 = v10;
    __int16 v14 = 2112;
    unsigned __int8 v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating audio ducking properties: audio ducking mode %@ audio ducking volume %@", (uint8_t *)&v12, 0x16u);
  }
  if (v7 == (id)2)
  {
    [(VOTOutputSpeechComponent *)self _setDuckingLevelAlways:1.0 - v5];
  }
  else
  {
    [(VOTOutputSpeechComponent *)self _setDuckingLevelAlways:1.0];
    [(VOTOutputSpeechComponent *)self _setDuckingLevelOnlySpeaking:1.0 - v5];
  }
}

- (void)_setDuckingLevelAlways:(double)a3
{
  double v4 = +[AVSystemController sharedAVSystemController];
  *(float *)&double v5 = a3;
  int v6 = [v4 setDuckScalarForVoiceOver:v5];
  id v7 = VOTLogAudio();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = +[NSNumber numberWithDouble:a3];
    int v10 = 138412290;
    os_log_type_t v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Setting duck scalar amount vo: %@", (uint8_t *)&v10, 0xCu);
  }
  if (v6)
  {
    unsigned int v9 = VOTLogAudio();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10011CCF0(v6, v9);
    }
  }
}

- (void)_setDuckingLevelOnlySpeaking:(double)a3
{
  double v4 = +[AVAudioSession sharedInstance];
  double v5 = +[NSNumber numberWithDouble:a3];
  id v10 = 0;
  [v4 setDuckToLevelScalar:v5 unduckToLevelScalar:0 error:&v10];
  id v6 = v10;

  id v7 = VOTLogAudio();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = +[NSNumber numberWithDouble:a3];
    *(_DWORD *)buf = 138412290;
    int v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Setting duck to level scalar amount vo: %@", buf, 0xCu);
  }
  if (v6)
  {
    unsigned int v9 = VOTLogAudio();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10011CDA8();
    }
  }
}

- (void)_setUnDuckingProperties
{
  [(VOTOutputSpeechComponent *)self _setDuckingLevelAlways:1.0];

  [(VOTOutputSpeechComponent *)self _setDuckingLevelOnlySpeaking:1.0];
}

- (void)_updateChannelLayout
{
  v3 = +[AVAudioSession sharedInstance];
  double v4 = +[AXAudioHardwareManager sharedManager];
  double v5 = +[AXAudioHardwareManager defaultRouteDescription];
  id v6 = [v4 savedChannelsForOutput:v5 forSource:1];

  id v7 = VOTLogAudio();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [v3 currentRoute];
    unsigned int v9 = [v3 currentRoute];
    id v10 = [v9 outputs];
    int v19 = 138412802;
    v20 = v8;
    __int16 v21 = 2114;
    v22 = v10;
    __int16 v23 = 2114;
    unsigned int v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Route %@: Channel layout %{public}@ and channels %{public}@", (uint8_t *)&v19, 0x20u);
  }
  if (!v6)
  {
    os_log_type_t v11 = +[AXAudioHardwareManager defaultPortChannels];
    int v12 = VOTLogAudio();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Default port channels: %@", (uint8_t *)&v19, 0xCu);
    }

    if ((unint64_t)[v11 count] < 3)
    {
      id v6 = 0;
    }
    else
    {
      [v11 count];
      id v6 = objc_msgSend(v11, "subarrayWithRange:", 0, 2);
      v13 = VOTLogAudio();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138543362;
        v20 = v6;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No selected channels, but we have more than 2 channels so using first 2 [%{public}@]", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  if (+[AXAudioHardwareManager channelsAreWiredHeadphones:v6])
  {
    __int16 v14 = VOTLogAudio();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Our selected channels are the default wired headset channels, so no need to set them explicitly [%{public}@]", (uint8_t *)&v19, 0xCu);
    }

    id v6 = 0;
  }
  unsigned __int8 v15 = [v3 currentRoute];
  unsigned int v16 = +[AXAudioHardwareManager channelsAreAirplay:v6 route:v15];

  if (v16)
  {
    BOOL v17 = VOTLogAudio();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Our selected channels are AirPlay so no need to set selected channels [%{public}@]", (uint8_t *)&v19, 0xCu);
    }

    id v6 = 0;
  }
  uint64_t v18 = VOTLogAudio();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138543362;
    v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Set selected channels on synth: %{public}@", (uint8_t *)&v19, 0xCu);
  }

  [(TTSSpeechSynthesizer *)self->_synthesizer setOutputChannels:v6];
}

- (void)_loadSpecialPunctuation
{
  specialPunctionTable = self->_specialPunctionTable;
  if (!specialPunctionTable)
  {
    double v4 = (AXIndexMap *)[objc_allocWithZone((Class)AXIndexMap) init];
    double v5 = self->_specialPunctionTable;
    self->_specialPunctionTable = v4;

    specialPunctionTable = self->_specialPunctionTable;
  }
  [(AXIndexMap *)specialPunctionTable setObject:@"ff" forIndex:64256];
  [(AXIndexMap *)self->_specialPunctionTable setObject:@"fi" forIndex:64257];
  [(AXIndexMap *)self->_specialPunctionTable setObject:@"fl" forIndex:64258];
  [(AXIndexMap *)self->_specialPunctionTable setObject:@"ffi" forIndex:64259];
  [(AXIndexMap *)self->_specialPunctionTable setObject:@"ffl" forIndex:64260];
  [(AXIndexMap *)self->_specialPunctionTable setObject:@"st" forIndex:64261];
  [(AXIndexMap *)self->_specialPunctionTable setObject:@"st" forIndex:64262];
  [(AXIndexMap *)self->_specialPunctionTable setObject:@"'" forIndex:700];
  [(AXIndexMap *)self->_specialPunctionTable setObject:@"'" forIndex:8242];
  id v6 = self->_specialPunctionTable;

  [(AXIndexMap *)v6 setObject:@"\"" forIndex:8243];
}

- (void)_loadNoneTableOverrides
{
  noneTableOverrides = self->_noneTableOverrides;
  if (!noneTableOverrides)
  {
    double v4 = (AXIndexMap *)[objc_allocWithZone((Class)AXIndexMap) init];
    double v5 = self->_noneTableOverrides;
    self->_noneTableOverrides = v4;

    noneTableOverrides = self->_noneTableOverrides;
  }
  [(AXIndexMap *)noneTableOverrides setObject:@"'" forIndex:8217];
  [(AXIndexMap *)self->_noneTableOverrides setObject:@"'" forIndex:39];
  id v6 = self->_noneTableOverrides;

  [(AXIndexMap *)v6 setObject:@"'" forIndex:65287];
}

- (VOTOutputSpeechComponent)init
{
  v20.receiver = self;
  v20.super_class = (Class)VOTOutputSpeechComponent;
  id v2 = [(VOTOutputComponent *)&v20 init];
  if (v2)
  {
    v3 = (SCRCThread *)[objc_allocWithZone((Class)SCRCThread) init];
    speechThread = v2->_speechThread;
    v2->_speechThread = v3;

    double v5 = v2->_speechThread;
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    [(SCRCThread *)v5 setName:v7];

    [(SCRCThread *)v2->_speechThread performSelector:"_initializeThread" onTarget:v2 count:0 objects:0];
    [(SCRCThread *)v2->_speechThread performSelector:"_initializeSynthesizer" onTarget:v2 count:0 objects:0];
    [(VOTOutputSpeechComponent *)v2 _initializePunctuationData];
    int v8 = +[NSBundle mainBundle];
    unsigned int v9 = [v8 pathForResource:@"VOTLanguageExceptions" ofType:@"plist"];
    uint64_t v10 = +[NSDictionary dictionaryWithContentsOfFile:v9];
    languageExceptions = v2->_languageExceptions;
    v2->_languageExceptions = (NSDictionary *)v10;

    int v12 = [v8 pathForResource:@"VOTEmoticons" ofType:@"plist"];
    uint64_t v13 = +[NSDictionary dictionaryWithContentsOfFile:v12];
    emoticonReplacements = v2->_emoticonReplacements;
    v2->_emoticonReplacements = (NSDictionary *)v13;

    if (!v2->_emoticonReplacements) {
      _AXAssert();
    }
    v2->_lastTimeSpeechStarted = -3061152000.0;
    unsigned __int8 v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v2 selector:"_selectedLanguageChanged:" name:off_1001EA730 object:0];

    [(VOTOutputSpeechComponent *)v2 _selectedLanguageChanged:0];
    unsigned int v16 = (SCRCTargetSelectorTimer *)[objc_allocWithZone((Class)SCRCTargetSelectorTimer) initWithTarget:v2 selector:"_stopSpeakingAfterLongPause:" threadKey:v2->super._threadKey];
    stopSpeakingAfterLongPauseTimer = v2->_stopSpeakingAfterLongPauseTimer;
    v2->_stopSpeakingAfterLongPauseTimer = v16;

    uint64_t v18 = v2;
  }

  return v2;
}

- (void)_initializePunctuationData
{
  v3 = (AXIndexMap *)[objc_allocWithZone((Class)AXIndexMap) init];
  allPunctuationTable = self->_allPunctuationTable;
  self->_allPunctuationTable = v3;

  double v5 = (AXIndexMap *)objc_alloc_init((Class)AXIndexMap);
  selectedLanguageAllPunctuationTable = self->_selectedLanguageAllPunctuationTable;
  self->_selectedLanguageAllPunctuationTable = v5;

  id v7 = (AXIndexMap *)objc_alloc_init((Class)AXIndexMap);
  selectedLanguageSomePunctuationTable = self->_selectedLanguageSomePunctuationTable;
  self->_selectedLanguageSomePunctuationTable = v7;

  unsigned int v9 = (AXIndexMap *)[objc_allocWithZone((Class)AXIndexMap) init];
  somePunctuationTable = self->_somePunctuationTable;
  self->_somePunctuationTable = v9;

  os_log_type_t v11 = (AXIndexMap *)objc_alloc_init((Class)AXIndexMap);
  selectedLanguageNoPunctuationTable = self->_selectedLanguageNoPunctuationTable;
  self->_selectedLanguageNoPunctuationTable = v11;

  uint64_t v13 = (AXIndexMap *)[objc_allocWithZone((Class)AXIndexMap) init];
  noPunctuationTable = self->_noPunctuationTable;
  self->_noPunctuationTable = v13;

  [(VOTOutputSpeechComponent *)self _loadSpecialPunctuation];
  [(VOTOutputSpeechComponent *)self _loadNoneTableOverrides];
  [(VOTOutputSpeechComponent *)self _loadPunctuationTable:self->_allPunctuationTable withLevel:1 language:0];
  [(VOTOutputSpeechComponent *)self _loadPunctuationTable:self->_somePunctuationTable withLevel:2 language:0];
  unsigned __int8 v15 = self->_noPunctuationTable;

  [(VOTOutputSpeechComponent *)self _loadPunctuationTable:v15 withLevel:3 language:0];
}

- (void)_selectedLanguageChanged:(id)a3
{
  id v4 = a3;
  if (qword_1001EB770 != -1) {
    dispatch_once(&qword_1001EB770, &stru_1001B3B40);
  }
  double v5 = [(id)VOTSharedWorkspace selectedLanguage];
  id v6 = [v5 copy];

  id v7 = VOTLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Selected language changed: %@", buf, 0xCu);
  }

  if (v6)
  {
    int v8 = (void *)qword_1001EB760;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10002E464;
    v10[3] = &unk_1001B3448;
    v10[4] = self;
    id v11 = v6;
    [v8 afterDelay:v10 processBlock:0.0];
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002E5B8;
    block[3] = &unk_1001B33B8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)qword_1001EB768, block);
  }
}

- (void)_resetLanguageDataOnSpeechThread:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = +[NSThread currentThread];
  unsigned int v9 = [v8 name];
  uint64_t v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  if (([v9 isEqualToString:v11] & 1) == 0) {
    sub_10011CEB4();
  }

  id v12 = [v6 count];
  id v13 = VOTLogCommon();
  __int16 v14 = v13;
  if (v12 != (id)3)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_10011CE40();
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Reset lang data for %@", buf, 0xCu);
  }

  unsigned __int8 v15 = [v6 objectAtIndexedSubscript:0];
  selectedLanguageAllPunctuationTable = self->_selectedLanguageAllPunctuationTable;
  self->_selectedLanguageAllPunctuationTable = v15;

  BOOL v17 = [v6 objectAtIndexedSubscript:1];
  selectedLanguageSomePunctuationTable = self->_selectedLanguageSomePunctuationTable;
  self->_selectedLanguageSomePunctuationTable = v17;

  int v19 = [v6 objectAtIndexedSubscript:2];
  selectedLanguageNoPunctuationTable = self->_selectedLanguageNoPunctuationTable;
  self->_selectedLanguageNoPunctuationTable = v19;

  unsigned int v21 = [(id)VOTSharedWorkspace inUnitTestMode];
  if (v7 && v21)
  {
    __int16 v14 = +[NSNotificationCenter defaultCenter];
    v23[0] = @"language";
    v23[1] = @"sender";
    v24[0] = v7;
    v24[1] = self;
    v22 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    [v14 postNotificationName:@"VOTLanguageReloaded" object:0 userInfo:v22];

LABEL_10:
  }
}

- (id)currentSomePunctuationTable
{
  v3 = [(id)VOTSharedWorkspace selectedLanguage];

  id v4 = &OBJC_IVAR___VOTOutputSpeechComponent__selectedLanguageSomePunctuationTable;
  if (!v3) {
    id v4 = &OBJC_IVAR___VOTOutputSpeechComponent__somePunctuationTable;
  }
  double v5 = *(Class *)((char *)&self->super.super.isa + *v4);

  return v5;
}

- (id)currentNonePunctuationTable
{
  v3 = [(id)VOTSharedWorkspace selectedLanguage];

  id v4 = &OBJC_IVAR___VOTOutputSpeechComponent__selectedLanguageNoPunctuationTable;
  if (!v3) {
    id v4 = &OBJC_IVAR___VOTOutputSpeechComponent__noPunctuationTable;
  }
  double v5 = *(Class *)((char *)&self->super.super.isa + *v4);

  return v5;
}

- (id)currentAllPunctuationTable
{
  v3 = [(id)VOTSharedWorkspace selectedLanguage];

  id v4 = &OBJC_IVAR___VOTOutputSpeechComponent__selectedLanguageAllPunctuationTable;
  if (!v3) {
    id v4 = &OBJC_IVAR___VOTOutputSpeechComponent__allPunctuationTable;
  }
  double v5 = *(Class *)((char *)&self->super.super.isa + *v4);

  return v5;
}

- (void)_saveSpeechStats
{
  v3 = +[VOTConfiguration rootConfiguration];
  [v3 setPreference:self->_speechStatistics forKey:@"SpeechStats"];

  [(VOTOutputSpeechComponent *)self performSelector:"_saveSpeechStats" withObject:0 afterDelay:10.0];
}

- (void)_loadPunctuationTable:(id)a3 withLevel:(int64_t)a4 language:(id)a5
{
  id v7 = a3;
  AXLoadPunctuationTable();
  [v7 addObjectsFromIndexMap:self->_specialPunctionTable];
  if (a4 == 3) {
    [v7 addObjectsFromIndexMap:self->_noneTableOverrides];
  }
}

- (float)volume
{
  id v2 = +[AXSettings sharedInstance];
  [v2 voiceOverEffectiveSpeakingVolume];
  float v4 = v3;

  return v4;
}

- (void)_setRate:(id)a3
{
  id v4 = a3;
  double v5 = VOTLogSpeech();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "VoiceOver set rate %@", (uint8_t *)&v11, 0xCu);
  }

  synthesizer = self->_synthesizer;
  [v4 floatValue];
  -[TTSSpeechSynthesizer setRate:](synthesizer, "setRate:");
  [v4 floatValue];
  int v8 = v7;
  unsigned int v9 = [(VOTOutputSpeechComponent *)self synthesizerForTelephonyMixin];
  LODWORD(v10) = v8;
  [v9 setRate:v10];
}

- (float)rate
{
  [(TTSSpeechSynthesizer *)self->_synthesizer rate];
  return result;
}

- (void)setRate:(float)a3
{
  speechThread = self->_speechThread;
  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(SCRCThread *)speechThread performSelector:"_setRate:" onTarget:self cancelMask:0x400000 count:1 objects:v5];
}

- (void)_setVoice:(id)a3
{
  id v4 = a3;
  [(TTSSpeechSynthesizer *)self->_synthesizer setVoiceIdentifier:v4];
  id v5 = [(VOTOutputSpeechComponent *)self synthesizerForTelephonyMixin];
  [v5 setVoiceIdentifier:v4];

  id v6 = VOTLogSpeech();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Set voice to %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)setVoice:(id)a3
{
}

- (void)pauseSpeakingAtBoundary:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v7 = [objc_allocWithZone((Class)AXIndexMap) init];
  id v5 = +[NSNumber numberWithUnsignedInt:v3];
  [v7 setObject:v5 forIndex:11];

  id v6 = +[NSNumber numberWithUnsignedInt:8];
  [v7 setObject:v6 forIndex:1];

  [(SCRCThread *)self->_speechThread performSelector:"handleEvent:" onTarget:self cancelMask:0x200000 count:1 objects:v7];
}

- (void)continueSpeaking
{
  id v4 = [objc_allocWithZone((Class)AXIndexMap) init];
  uint64_t v3 = +[NSNumber numberWithUnsignedInt:9];
  [v4 setObject:v3 forIndex:1];

  [(SCRCThread *)self->_speechThread performSelector:"handleEvent:" onTarget:self cancelMask:0x200000 count:1 objects:v4];
}

- (void)stopSpeakingAtBoundary:(int)a3 allRequests:(BOOL)a4 sessionDeactivationDelay:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  id v12 = a5;
  if ([(VOTOutputSpeechComponent *)self isSpeaking] || self->_currentRequest)
  {
    id v8 = [objc_allocWithZone((Class)NSNumber) initWithUnsignedInt:v6];
    id v9 = [objc_allocWithZone((Class)NSNumber) initWithUnsignedInt:7];
    id v10 = [objc_allocWithZone((Class)AXIndexMap) init];
    [v10 setObject:v8 forIndex:11];
    [v10 setObject:v9 forIndex:1];
    int v11 = +[NSNumber numberWithBool:v5];
    [v10 setObject:v11 forIndex:24];

    [v10 setObject:v12 forIndex:84];
    [(SCRCThread *)self->_speechThread performSelector:"handleEvent:" onTarget:self cancelMask:0x200000 count:1 objects:v10];

LABEL_4:
    goto LABEL_5;
  }
  if (v12)
  {
    id v8 = +[VOTOutputManager outputManager];
    [v12 doubleValue];
    objc_msgSend(v8, "disableAudioSession:userDelay:", @"SPEECH");
    goto LABEL_4;
  }
LABEL_5:
}

- (void)stopSpeakingAtBoundary:(int)a3
{
}

- (void)_stopSpeakingAfterLongPause:(id)a3
{
  id v4 = VOTLogSpeech();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Waited max time for pause to continue, interrupting pause state", v6, 2u);
  }

  BOOL v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:off_1001EA738 object:0];

  [(VOTOutputSpeechComponent *)self stopSpeakingAtBoundary:0];
}

- (void)_handlePauseSpeaking:(id)a3
{
  id v9 = a3;
  if ([(VOTOutputSpeechComponent *)self isSpeaking])
  {
    self->_isPaused = 1;
    id v4 = [v9 objectForIndex:11];
    unsigned int v5 = [v4 unsignedIntValue];

    BOOL v6 = v5 == 1;
    [(TTSSpeechSynthesizer *)self->_synthesizer pauseSpeakingAtNextBoundary:v6 error:0];
    id v7 = [(VOTOutputSpeechComponent *)self synthesizerForTelephonyMixin];
    [v7 pauseSpeakingAtNextBoundary:v6 error:0];

    id v8 = +[VOTOutputManager outputManager];
    [v8 disableAudioSession:@"SPEECH"];

    [(SCRCTargetSelectorTimer *)self->_stopSpeakingAfterLongPauseTimer dispatchAfterDelay:90.0];
  }
}

- (void)_handleContinueSpeaking:(id)a3
{
  if (self->_isPaused)
  {
    id v4 = +[VOTOutputManager outputManager];
    [v4 enableAudioSession:@"SPEECH"];
  }
  [(TTSSpeechSynthesizer *)self->_synthesizer continueSpeakingWithError:0];
  unsigned int v5 = [(VOTOutputSpeechComponent *)self synthesizerForTelephonyMixin];
  [v5 continueSpeakingWithError:0];

  self->_isPaused = 0;
  stopSpeakingAfterLongPauseTimer = self->_stopSpeakingAfterLongPauseTimer;

  [(SCRCTargetSelectorTimer *)stopSpeakingAfterLongPauseTimer cancel];
}

- (void)_handleStopSpeaking:(id)a3
{
  id v4 = a3;
  unsigned int v5 = objc_getAssociatedObject(self->_currentRequest, &unk_1001EB778);
  BOOL v6 = [v5 objectForIndex:14];
  if (![(VOTOutputSpeechComponent *)self isSpeaking] && !self->_currentRequest)
  {
LABEL_5:
    id v10 = VOTLogSpeech();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v17 = 138543362;
      uint64_t v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "told to stop, but not stopping because last action was not stoppable: %{public}@", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_12;
  }
  id v7 = [v6 objectForVariant:23];
  if ([v7 BOOLValue])
  {
    id v8 = [v4 objectForIndex:24];
    unsigned int v9 = [v8 BOOLValue];

    if (!v9) {
      goto LABEL_5;
    }
  }
  else
  {
  }
  self->_userStopped = 1;
  self->_isPaused = 0;
  [(SCRCTargetSelectorTimer *)self->_stopSpeakingAfterLongPauseTimer cancel];
  self->_lastTimeSpeechStarted = -3061152000.0;
  int v11 = [v4 objectForIndex:11];
  unsigned int v12 = [v11 unsignedIntValue];

  id v13 = VOTLogSpeech();
  if (os_signpost_enabled(v13))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EndSpeaking", "", (uint8_t *)&v17, 2u);
  }

  BOOL v14 = v12 == 1;
  [(TTSSpeechSynthesizer *)self->_synthesizer stopSpeakingAtNextBoundary:v14 error:0];
  unsigned __int8 v15 = [(VOTOutputSpeechComponent *)self synthesizerForTelephonyMixin];
  [v15 stopSpeakingAtNextBoundary:v14 error:0];

  id v10 = [v4 objectForIndex:84];
  if (v10)
  {
    unsigned int v16 = +[VOTOutputManager outputManager];
    [v10 doubleValue];
    objc_msgSend(v16, "disableAudioSession:userDelay:", @"SPEECH");
  }
LABEL_12:
}

- (void)dealloc
{
  [(SCRCTargetSelectorTimer *)self->_stopSpeakingAfterLongPauseTimer invalidate];
  [(BSInvalidatable *)self->_disableIdleTimerAssertion invalidate];
  [(SCRCThread *)self->_speechThread setIsInvalid:1];
  v3.receiver = self;
  v3.super_class = (Class)VOTOutputSpeechComponent;
  [(VOTOutputSpeechComponent *)&v3 dealloc];
}

- (void)handleEvent:(id)a3
{
  id v6 = a3;
  id v4 = [v6 objectForIndex:1];
  unsigned int v5 = [v4 unsignedIntValue];

  switch(v5)
  {
    case 6u:
      [(VOTOutputSpeechComponent *)self _handlePerformAction:v6];
      break;
    case 7u:
      [(VOTOutputSpeechComponent *)self _handleStopSpeaking:v6];
      break;
    case 8u:
      [(VOTOutputSpeechComponent *)self _handlePauseSpeaking:v6];
      break;
    case 9u:
      [(VOTOutputSpeechComponent *)self _handleContinueSpeaking:v6];
      break;
    default:
      break;
  }
}

- (void)_speakAllDigits:(id)a3
{
  id v9 = a3;
  objc_super v3 = +[NSCharacterSet decimalDigitCharacterSet];
  if ([v9 length])
  {
    uint64_t v4 = 0;
    do
    {
      id v5 = [v9 characterAtIndex:v4];
      if ([v3 characterIsMember:v5])
      {
        if (v4 >= 1 && [v9 characterAtIndex:v4 - 1] == 32)
        {
          CFStringRef v6 = @"%C ";
          uint64_t v7 = 1;
        }
        else
        {
          CFStringRef v6 = @" %C ";
          uint64_t v7 = 2;
        }
        id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v5);
        objc_msgSend(v9, "replaceCharactersInRange:withString:", v4, 1, v8);
        v4 += v7;
      }
      ++v4;
    }
    while (v4 < (unint64_t)[v9 length]);
  }
}

- (void)_replaceEmbeddedTTSCommands:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"[[", @"[ [", 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"]]", @"] ]", 0, 0, objc_msgSend(v3, "length"));
}

- (id)_secureTextDescription:(id)a3
{
  id v3 = [a3 length];
  uint64_t v4 = sub_100051804(off_1001EA9E8, @"secure.character.count", &stru_1001B7888);
  id v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, v3);

  return v5;
}

- (id)_localeSpecificURLsForLanguageCode:(id)a3
{
  if ([a3 hasPrefix:@"fi"]) {
    return &off_1001C6C38;
  }
  else {
    return 0;
  }
}

- (id)_localeSpecificURLRegexForLanguageCode:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (([0 isEqualToString:v4] & 1) == 0)
    {
      id v5 = (void *)qword_1001EB780;
      qword_1001EB780 = 0;
    }
    CFStringRef v6 = (void *)qword_1001EB780;
    if (!qword_1001EB780)
    {
      uint64_t v7 = [(VOTOutputSpeechComponent *)self _localeSpecificURLsForLanguageCode:v4];
      uint64_t v8 = (uint64_t)[v7 count];
      uint64_t v9 = v8 - 1;
      if (v8 >= 1)
      {
        uint64_t v10 = v8;
        int v11 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", @"(");
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (v9 == i)
          {
            id v13 = [v7 objectAtIndexedSubscript:v9];
            [v11 appendString:v13];
          }
          else
          {
            id v13 = [v7 objectAtIndexedSubscript:i];
            [v11 appendFormat:@"%@|", v13];
          }
        }
        [v11 appendString:@""]);
        BOOL v14 = [@"(http:\\/\\/|www\\.)?(\\S*)\\.(com|net|org|edu|gov|mil|uk|fi)(\\/\\S*)?\\b" stringByReplacingOccurrencesOfString:@"(com|net|org|edu|gov|mil|uk)" withString:v11];
        uint64_t v15 = +[NSRegularExpression regularExpressionWithPattern:v14 options:0 error:0];
        unsigned int v16 = (void *)qword_1001EB780;
        qword_1001EB780 = v15;
      }
      CFStringRef v6 = (void *)qword_1001EB780;
    }
    id v17 = v6;
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (BOOL)_stringMatchesSpecialCases:(id)a3 forSymbol:(id)a4 ranges:(id *)a5 langaugeCode:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (!v11)
  {
    id v11 = [(id)VOTSharedWorkspace systemSpokenLanguage];
  }
  if ([v10 isEqualToString:@"."])
  {
    id v36 = v11;
    v37 = a5;
    id v38 = v10;
    unsigned int v12 = +[NSMutableArray array];
    id v13 = VOTLogSpeech();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10011CEE0();
    }

    BOOL v14 = (void *)qword_1001EB788;
    if (!qword_1001EB788)
    {
      uint64_t v15 = +[NSRegularExpression regularExpressionWithPattern:@"\\b([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,5})\\b" options:0 error:0];
      unsigned int v16 = (void *)qword_1001EB788;
      qword_1001EB788 = v15;

      BOOL v14 = (void *)qword_1001EB788;
    }
    id v39 = v9;
    objc_msgSend(v14, "matchesInString:options:range:", v9, 0, 0, objc_msgSend(v9, "length"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v42 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v42)
    {
      uint64_t v41 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v42; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v44 != v41) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          id v19 = [v18 range];
          NSUInteger v21 = v20;
          uint64_t v22 = (uint64_t)[v12 count];
          if (v22 < 1)
          {
LABEL_17:
            id v29 = [v18 range];
            __int16 v25 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v29, v30);
            [v12 addObject:v25];
          }
          else
          {
            uint64_t v23 = v22;
            uint64_t v24 = 0;
            while (1)
            {
              __int16 v25 = [v12 objectAtIndex:v24];
              id v26 = [v25 rangeValue];
              NSUInteger v28 = v27;
              v48.id location = (NSUInteger)v19;
              v48.length = v21;
              v50.id location = (NSUInteger)v26;
              v50.length = v28;
              if (NSIntersectionRange(v48, v50).length) {
                break;
              }

              if (v23 == ++v24) {
                goto LABEL_17;
              }
            }
            v49.id location = (NSUInteger)v19;
            v49.length = v21;
            v51.id location = (NSUInteger)v26;
            v51.length = v28;
            NSRange v31 = NSUnionRange(v49, v51);
            v32 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v31.location, v31.length);
            [v12 replaceObjectAtIndex:v24 withObject:v32];
          }
        }
        id v42 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v42);
    }
    [v12 sortUsingSelector:"compare:"];
    id v33 = v12;
    id *v37 = v33;
    BOOL v34 = [v33 count] != 0;

    id v10 = v38;
    id v9 = v39;
    id v11 = v36;
  }
  else
  {
    BOOL v34 = 0;
  }

  return v34;
}

- (id)expectedVoiceIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[AXSubsystemVoiceOver sharedInstance];
  unsigned __int8 v5 = [v4 ignoreLogging];

  if ((v5 & 1) == 0)
  {
    CFStringRef v6 = +[AXSubsystemVoiceOver identifier];
    uint64_t v7 = AXLoggerForFacility();

    os_log_type_t v8 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v7, v8))
    {
      id v9 = AXColorizeFormatLog();
      id v18 = v3;
      id v10 = _AXStringForArgs();
      if (os_log_type_enabled(v7, v8))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v10;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "%{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_10002D13C;
  __int16 v25 = sub_10002D14C;
  id v26 = 0;
  id v12 = v3;
  id v13 = v12;
  if (!v12)
  {
    id v13 = [(id)VOTSharedWorkspace selectedLanguage];
    if (!v13)
    {
      id v13 = [(id)VOTSharedWorkspace systemSpokenLanguage];
    }
  }
  BOOL v14 = objc_msgSend((id)VOTSharedWorkspace, "votSettings", v18);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000300D8;
  v19[3] = &unk_1001B3B68;
  p_long long buf = &buf;
  uint64_t v15 = v11;
  NSUInteger v20 = v15;
  [v14 voiceSelectionWithLanguageCode:v13 withActivity:0 completionHandler:v19];

  dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  unsigned int v16 = [*(id *)(*((void *)&buf + 1) + 40) voiceId];

  _Block_object_dispose(&buf, 8);

  return v16;
}

- (float)_pauseDelayForType:(int)a3 speechRate:(float)a4 voiceType:(int64_t)a5
{
  double v6 = 0.0;
  if ((a3 - 1) <= 6) {
    LODWORD(v6) = *(_DWORD *)&aPp[4 * a3];
  }
  sub_100050BA4(v6, a4);
  return result;
}

- (int64_t)_ttsVoiceTypeForPauseCalculationWithVoiceIdentifier:(id)a3
{
  id v3 = a3;
  if (+[TTSAlternativeVoices isNeuralSiriVoiceIdentifier:v3])
  {
    int64_t v4 = 5;
  }
  else if (+[TTSAlternativeVoices isSiriVoiceIdentifier:v3])
  {
    int64_t v4 = 4;
  }
  else if (+[TTSAlternativeVoices isOldSiriVoiceIdentifier:v3])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 1;
  }

  return v4;
}

- (id)pauseStringForType:(int)a3 voiceIdentifier:(id)a4 rate:(float)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  int64_t v9 = [(VOTOutputSpeechComponent *)self _ttsVoiceTypeForPauseCalculationWithVoiceIdentifier:v8];
  *(float *)&double v10 = a5;
  [(VOTOutputSpeechComponent *)self _pauseDelayForType:v6 speechRate:v9 voiceType:v10];
  float v12 = v11;
  if ([v8 hasPrefix:kTTSMacinTalkVoiceIdentifierPrefix]) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = [v8 isEqualToString:AVSpeechSynthesisVoiceIdentifierAlex] ^ 1;
  }
  if (v6 == 2 && !v13
    || (v6 & 0xFFFFFFFE) == 2
    && ([v8 containsString:@"com.apple.ttsbundle.Carmit"] & 1) != 0)
  {
    BOOL v14 = &stru_1001B7888;
    goto LABEL_16;
  }
  uint64_t v15 = +[TTSSpeechSynthesizer speechMarkupStringForType:0 forIdentifier:v8 string:0];
  uint64_t v22 = v15;
  if (v6 == 8)
  {
    uint64_t v23 = v15;
  }
  else
  {
    if (!v15)
    {
      BOOL v14 = &stru_1001B7888;
      goto LABEL_15;
    }
    sub_10002B424(v15, @"%d", v16, v17, v18, v19, v20, v21, (int)v12);
    uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  BOOL v14 = v23;
LABEL_15:

LABEL_16:

  return v14;
}

- (void)_insertLongerPausesForSymbol:(id)a3 withText:(id)a4 allowPausingAtBoundaries:(BOOL)a5 onlyApplyWhenFollowedBySpace:(BOOL)a6 languageCode:(id)a7 voiceIdentifier:(id)a8 rate:(float)a9
{
  BOOL v12 = a6;
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v89 = a8;
  id v18 = [v16 length];
  if (!v18) {
    goto LABEL_7;
  }
  uint64_t v19 = (uint64_t)v18;
  id v86 = v17;
  unsigned int v20 = [v15 characterAtIndex:0];
  if (v19 < 1) {
    goto LABEL_6;
  }
  unsigned int v21 = v20;
  unint64_t v22 = 0;
  while ([v16 characterAtIndex:v22] == v21)
  {
    if (v19 == ++v22) {
      goto LABEL_6;
    }
  }
  id v17 = v86;
  if (v19 == v22) {
    goto LABEL_7;
  }
  if (v22 >= 2)
  {
    objc_msgSend(v16, "replaceCharactersInRange:withString:", 0, v22, &stru_1001B7888);
    uint64_t v19 = (uint64_t)[v16 length];
  }
  if (v19 < 2) {
    goto LABEL_7;
  }
  id v114 = 0;
  unsigned int v23 = [(VOTOutputSpeechComponent *)self _stringMatchesSpecialCases:v16 forSymbol:v15 ranges:&v114 langaugeCode:v86];
  id v24 = v114;
  __int16 v25 = v24;
  if (v23)
  {
    if (!v24)
    {
LABEL_6:
      id v17 = v86;
      goto LABEL_7;
    }
  }
  BOOL v97 = v12;
  BOOL v101 = a5;
  if ([v24 count])
  {
    id v104 = v16;
    v91 = +[NSMutableArray array];
    long long v110 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    id v26 = v25;
    id v27 = [v26 countByEnumeratingWithState:&v110 objects:v124 count:16];
    if (v27)
    {
      id v28 = v27;
      id v29 = 0;
      uint64_t v30 = *(void *)v111;
      do
      {
        for (uint64_t i = 0; i != v28; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v111 != v30) {
            objc_enumerationMutation(v26);
          }
          v32 = (char *)[*(id *)(*((void *)&v110 + 1) + 8 * i) rangeValue];
          uint64_t v34 = v33;
          if (v32 - v29 >= 1)
          {
            v35 = +[NSValue valueWithRange:v29];
            [v91 addObject:v35];
          }
          id v29 = &v32[v34];
        }
        id v28 = [v26 countByEnumeratingWithState:&v110 objects:v124 count:16];
      }
      while (v28);
    }
    else
    {
      id v29 = 0;
    }

    if (v19 <= (uint64_t)v29)
    {
      id v16 = v104;
      BOOL v36 = v97;
      a5 = v101;
      goto LABEL_31;
    }
    __int16 v25 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v29, v19 - (void)v29);
    [v91 addObject:v25];
    id v16 = v104;
    a5 = v101;
  }
  else
  {
    +[NSValue valueWithRange:](NSValue, "valueWithRange:", 0, v19);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    v91 = +[NSArray arrayWithObject:v26];
  }

  BOOL v36 = v97;
LABEL_31:

  if (!qword_1001EB790)
  {
    id v37 = [objc_allocWithZone((Class)NSMutableCharacterSet) init];
    id v38 = (void *)qword_1001EB790;
    qword_1001EB790 = (uint64_t)v37;

    id v39 = (void *)qword_1001EB790;
    v40 = +[NSCharacterSet symbolCharacterSet];
    [v39 formUnionWithCharacterSet:v40];

    uint64_t v41 = (void *)qword_1001EB790;
    id v42 = +[NSCharacterSet decimalDigitCharacterSet];
    [v41 formUnionWithCharacterSet:v42];
  }
  long long v43 = +[NSCharacterSet uppercaseLetterCharacterSet];
  v98 = +[NSCharacterSet whitespaceCharacterSet];
  id v44 = +[NSMutableString string];
  if ([v91 count])
  {
    v93 = v43;
    if (sub_1000519BC(v15))
    {
      uint64_t v45 = 2;
    }
    else if (([v15 isEqualToString:@"."] & 1) != 0 {
           || [v15 isEqualToString:@"?"])
    }
    {
      uint64_t v45 = 3;
    }
    else
    {
      uint64_t v45 = 6;
    }
    v47 = [(AXIndexMap *)self->_currentActionVariants objectForIndex:63];
    unsigned int v48 = [v47 BOOLValue];

    if (v48)
    {
      if ([v15 isEqualToString:@"."]) {
        uint64_t v45 = v45;
      }
      else {
        uint64_t v45 = 3;
      }
    }
    uint64_t v49 = (uint64_t)v86;
    if (v86
      || ([(id)VOTSharedWorkspace systemSpokenLanguage], (uint64_t v49 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      NSRange v51 = +[AXLanguageManager sharedInstance];
      v87 = (void *)v49;
      v52 = [v51 dialectForLanguageID:v49];
      v53 = [v52 langMap];
      unsigned int v103 = [v53 isRTL] ^ 1;
    }
    else
    {
      v87 = 0;
      unsigned int v103 = 1;
    }
    *(float *)&double v50 = a9;
    long long v46 = [(VOTOutputSpeechComponent *)self pauseStringForType:v45 voiceIdentifier:v89 rate:v50];
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id obj = v91;
    id v96 = [obj countByEnumeratingWithState:&v106 objects:v123 count:16];
    unint64_t v54 = 0;
    if (v96)
    {
      uint64_t v94 = *(void *)v107;
      v105 = v46;
      id v92 = v15;
      v95 = v44;
      do
      {
        uint64_t v55 = 0;
        do
        {
          if (*(void *)v107 != v94) {
            objc_enumerationMutation(obj);
          }
          uint64_t v100 = v55;
          v56 = (char *)[*(id *)(*((void *)&v106 + 1) + 8 * v55) rangeValue];
          unint64_t v102 = v57;
          if (v56 != (char *)v54)
          {
            [v44 appendFormat:@"%@ ", v46];
            v58 = objc_msgSend(v16, "substringWithRange:", v54, &v56[-v54]);
            [v44 appendString:v58];

            [v44 appendFormat:@" %@", v46];
          }
          v99 = v56;
          v59 = objc_msgSend(v16, "substringWithRange:", v56, v102);
          v60 = (char *)[v59 mutableCopyWithZone:0];

          if (v102 <= (unint64_t)[v60 length])
          {
            unint64_t v61 = 0;
            v62 = (char *)v102;
            while (1)
            {
              id v63 = v46;
              v64 = objc_msgSend(v60, "rangeOfString:options:range:", v15, 2, v61, v62);
              uint64_t v66 = v65;
              v67 = VOTLogSpeech();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)long long buf = 138478595;
                unint64_t v116 = (unint64_t)v15;
                __int16 v117 = 2113;
                v118 = v60;
                __int16 v119 = 2048;
                v120 = v64;
                __int16 v121 = 2048;
                uint64_t v122 = v66;
                _os_log_debug_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEBUG, "range of %{private}@ in %{private}@ is %lu %lu", buf, 0x2Au);
              }

              if (v64 == (unsigned char *)0x7FFFFFFFFFFFFFFFLL)
              {

                goto LABEL_96;
              }
              if (!a5 && !v64) {
                break;
              }
              if (!a5 && v64 == (char *)[v16 length] - 1) {
                goto LABEL_67;
              }
              if (!v64)
              {
                int v69 = 1;
                goto LABEL_68;
              }
              id v70 = v16;
              id v71 = [v60 characterAtIndex:v64 - 1];
              unsigned int v72 = [(id)qword_1001EB790 characterIsMember:v71];
              char v73 = v72;
              int v69 = v72 ^ 1;
              if (v64 + 1 >= [v60 length])
              {
                id v16 = v70;
                BOOL v36 = v97;
                a5 = v101;
                goto LABEL_68;
              }
              id v74 = [v60 characterAtIndex:v64 + 1];
              if (![v93 characterIsMember:v71])
              {
                id v16 = v70;
                BOOL v36 = v97;
                a5 = v101;
                id v15 = v92;
                goto LABEL_68;
              }
              unsigned int v75 = [v93 characterIsMember:v74];
              id v16 = v70;
              BOOL v36 = v97;
              a5 = v101;
              id v15 = v92;
              if (!v75) {
                goto LABEL_68;
              }
              *(float *)&double v76 = a9;
              uint64_t v77 = [(VOTOutputSpeechComponent *)self pauseStringForType:7 voiceIdentifier:v89 rate:v76];

              id v63 = (id)v77;
              a5 = v101;
              if ((v73 & 1) == 0)
              {
LABEL_73:
                if (v103) {
                  +[NSString stringWithFormat:@"%@%@", v15, v63, v85];
                }
                else {
                uint64_t v78 = +[NSString stringWithFormat:@"%C%@%@", 8207, v15, v63];
                }

                objc_msgSend(v60, "replaceOccurrencesOfString:withString:options:range:", v15, v78, 0, v64, v66);
                id v63 = (id)v78;
              }
LABEL_83:
              v79 = VOTLogSpeech();
              unint64_t v61 = (unint64_t)&v64[v66];
              if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
              {
                v81 = (char *)[v60 length];
                *(_DWORD *)long long buf = 134218240;
                unint64_t v116 = v61;
                __int16 v117 = 2048;
                v118 = v81;
                _os_log_debug_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEBUG, "old info %lu -- %lu", buf, 0x16u);
              }

              if (v61 >= (unint64_t)[v60 length])
              {
                v62 = 0;
                unint64_t v61 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else
              {
                v62 = (char *)[v60 length] - v61;
              }
              v80 = VOTLogSpeech();
              if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)long long buf = 134218240;
                unint64_t v116 = v61;
                __int16 v117 = 2048;
                v118 = v62;
                _os_log_debug_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEBUG, "new text range: %lu, %lu", buf, 0x16u);
              }

              long long v46 = v105;
              if (&v62[v61] > [v60 length]) {
                goto LABEL_96;
              }
            }
            if ((unint64_t)[v16 length] < 2
              || (id v68 = [v60 characterAtIndex:1],
                  ([(id)qword_1001EB790 characterIsMember:v68] & 1) == 0))
            {
              objc_msgSend(v60, "replaceOccurrencesOfString:withString:options:range:", v15, &stru_1001B7888, 0, 0, v66);
            }
LABEL_67:
            int v69 = 0;
LABEL_68:
            if (v36 && v64 + 1 < [v60 length])
            {
              if (objc_msgSend(v98, "characterIsMember:", objc_msgSend(v60, "characterAtIndex:", v64 + 1)) & v69)goto LABEL_73; {
            }
              }
            else if (v69)
            {
              goto LABEL_73;
            }
            goto LABEL_83;
          }
LABEL_96:
          unint64_t v54 = (unint64_t)&v99[v102];
          id v44 = v95;
          [v95 appendString:v60];

          uint64_t v55 = v100 + 1;
        }
        while ((id)(v100 + 1) != v96);
        id v96 = [obj countByEnumeratingWithState:&v106 objects:v123 count:16];
      }
      while (v96);
    }

    if (v54 < (unint64_t)[v16 length])
    {
      *(float *)&double v82 = a9;
      v83 = [(VOTOutputSpeechComponent *)self pauseStringForType:6 voiceIdentifier:v89 rate:v82];
      v84 = [v16 substringFromIndex:v54];
      [v44 appendFormat:@"%@ %@", v83, v84];
    }
    id v17 = v87;
    long long v43 = v93;
  }
  else
  {
    long long v46 = v44;
    id v44 = v16;
    id v17 = v86;
  }

  [v16 setString:v44];
LABEL_7:
}

+ (void)_setOverrideLocale:(id)a3
{
}

- (BOOL)_currentLocaleUsesSpaceAsSeparator
{
  if (qword_1001EBE18)
  {
    id v2 = objc_alloc_init((Class)NSNumberFormatter);
    [v2 setLocale:qword_1001EBE18];
    [v2 setNumberStyle:1];
    id v3 = [v2 stringFromNumber:&off_1001C4F38];
  }
  else
  {
    id v3 = +[NSNumberFormatter localizedStringFromNumber:&off_1001C4F38 numberStyle:1];
  }
  BOOL v4 = [v3 rangeOfString:@" "] != (id)0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (void)_applyCamelCaseSeparation:(id)a3
{
  id v3 = a3;
  if (qword_1001EB7A0 != -1) {
    dispatch_once(&qword_1001EB7A0, &stru_1001B3B88);
  }
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_10002D13C;
  uint64_t v30 = sub_10002D14C;
  id v31 = 0;
  uint64_t v22 = 0;
  unsigned int v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  BOOL v4 = (void *)qword_1001EB798;
  id v5 = [v3 length];
  BOOL v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  BOOL v14 = sub_1000311A4;
  id v15 = &unk_1001B3BB0;
  id v17 = &v26;
  id v6 = v3;
  id v16 = v6;
  id v18 = &v22;
  uint64_t v19 = v20;
  objc_msgSend(v4, "enumerateMatchesInString:options:range:usingBlock:", v6, 0, 0, v5, &v12);
  if (v27[5])
  {
    unint64_t v7 = v23[3];
    if (v7 < (unint64_t)objc_msgSend(v6, "length", v12, v13, v14, v15))
    {
      id v8 = (void *)v27[5];
      uint64_t v9 = v23[3];
      double v10 = (char *)[v6 length];
      float v11 = objc_msgSend(v6, "substringWithRange:", v9, &v10[-v23[3]]);
      [v8 appendString:v11];
    }
    [v6 setString:v27[5]];
  }

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
}

- (void)_applyTelephoneFormatting:(id)a3 withRanges:(id)a4 languageCode:(id)a5 voiceIdentifier:(id)a6 rate:(float)a7
{
  id v12 = a3;
  id v13 = a4;
  id v41 = a5;
  id v14 = a6;
  if (!qword_1001EB7A8)
  {
    uint64_t v15 = +[NSRegularExpression regularExpressionWithPattern:@"[0-9]{1,3}([  ][0-9]{3})+\\s*$" options:0 error:0];
    id v16 = (void *)qword_1001EB7A8;
    qword_1001EB7A8 = v15;
  }
  v40 = (char *)[v12 length];
  id v44 = +[NSMutableString string];
  id v42 = +[NSCharacterSet decimalDigitCharacterSet];
  *(float *)&double v17 = a7;
  uint64_t v49 = [(VOTOutputSpeechComponent *)self pauseStringForType:6 voiceIdentifier:v14 rate:v17];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v13;
  id v48 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v48)
  {
    v47 = 0;
    uint64_t v18 = *(void *)v51;
    uint64_t v43 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v48; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v51 != v18) {
          objc_enumerationMutation(obj);
        }
        unsigned int v20 = (char *)[*(id *)(*((void *)&v50 + 1) + 8 * i) rangeValue];
        uint64_t v22 = v21;
        unsigned int v23 = objc_msgSend(v12, "substringWithRange:", v20, v21);
        id v24 = [v23 rangeOfString:@"\n"];

        if (v24 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v25 = objc_msgSend(v12, "substringWithRange:", v20, v22);
          if (!-[VOTOutputSpeechComponent _currentLocaleUsesSpaceAsSeparator](self, "_currentLocaleUsesSpaceAsSeparator")|| (objc_msgSend((id)qword_1001EB7A8, "matchesInString:options:range:", v25, 0, 0, objc_msgSend(v25, "length")), id v27 = objc_claimAutoreleasedReturnValue(), v28 = objc_msgSend(v27, "count"), v27, !v28))
          {
            long long v46 = v25;
            if (v20 != v47)
            {
              id v29 = objc_msgSend(v12, "substringWithRange:", v47, v20 - v47);
              [v44 appendString:v29];
            }
            id v30 = v14;
            *(float *)&double v26 = a7;
            id v31 = [(VOTOutputSpeechComponent *)self pauseStringForType:6 voiceIdentifier:v14 rate:v26];
            v32 = +[NSMutableString stringWithString:v31];

            v47 = &v20[v22];
            if ((uint64_t)v20 < (uint64_t)&v20[v22])
            {
              do
              {
                id v33 = [v12 characterAtIndex:v20];
                if ([v42 characterIsMember:v33])
                {
                  *(float *)&double v34 = a7;
                  v35 = [(VOTOutputSpeechComponent *)self pauseStringForType:4 voiceIdentifier:v30 rate:v34];
                  [v32 appendFormat:@"%C%@ ", v33, v35];
                }
                else if (((unsigned __int16)v33 & 0xFFFE) != 0x28)
                {
                  if (v33 == 32 || v33 == 45)
                  {
                    [v32 appendString:v49];
                  }
                  else
                  {
                    BOOL v36 = [(VOTOutputSpeechComponent *)self currentAllPunctuationTable];
                    id v37 = [v36 objectForIndex:v33];

                    if (v37)
                    {
                      [v32 appendFormat:@"%@ %@ ", v37, v49];
                    }
                    else
                    {
                      id v38 = objc_msgSend(v12, "substringWithRange:", v20, 1);
                      [v32 appendFormat:@"%@", v38];
                    }
                  }
                }
                ++v20;
                --v22;
              }
              while (v22);
            }
            [v32 appendString:v49];
            [v44 appendString:v32];

            id v14 = v30;
            uint64_t v25 = v46;
          }

          uint64_t v18 = v43;
        }
      }
      id v48 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
    }
    while (v48);
  }
  else
  {
    v47 = 0;
  }

  if ((uint64_t)v47 < (uint64_t)v40)
  {
    id v39 = objc_msgSend(v12, "substringFromIndex:");
    [v44 appendString:v39];
  }
  [v12 setString:v44];
}

- (void)_formatTelephoneNumber:(id)a3 languageCode:(id)a4 voiceIdentifier:(id)a5 rate:(float)a6
{
  id v18 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)qword_1001EB7B0;
  if (!qword_1001EB7B0)
  {
    uint64_t v13 = +[NSRegularExpression regularExpressionWithPattern:@"([+0-9]{6,15}|(((\\s?|\\b)([0-9]{2,3}\\s)?(\\(?[0-9]{3}\\)?)?(\\s|-))|\\s)?([0-9]{2,7})(-|\\s)([0-9]{3,7}))(\\s|\\b)" options:0 error:0];
    id v14 = (void *)qword_1001EB7B0;
    qword_1001EB7B0 = v13;

    id v12 = (void *)qword_1001EB7B0;
  }
  uint64_t v15 = objc_msgSend(v12, "matchesInString:options:range:", v18, 0, 0, objc_msgSend(v18, "length"));
  if ([v15 count])
  {
    id v16 = [v15 axMapObjectsUsingBlock:&stru_1001B3BF0];
    *(float *)&double v17 = a6;
    [(VOTOutputSpeechComponent *)self _applyTelephoneFormatting:v18 withRanges:v16 languageCode:v10 voiceIdentifier:v11 rate:v17];
  }
}

- (BOOL)_formatDetectedFinnishDates:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)qword_1001EB7B8;
  if (!qword_1001EB7B8)
  {
    uint64_t v5 = +[NSRegularExpression regularExpressionWithPattern:@"(?<!\\.)\\b([0-9]{1,2})[\\.]([0-9]{1,2})[\\.](?:((?:[0-9]{2})|(?:[0-9]{4}))\\b)(?!\\.?[0-9])" options:0 error:0];
    id v6 = (void *)qword_1001EB7B8;
    qword_1001EB7B8 = v5;

    BOOL v4 = (void *)qword_1001EB7B8;
  }
  unint64_t v7 = objc_msgSend(v4, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  if ([v7 count])
  {
    id v39 = v3;
    id v8 = [v3 copy];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v35 = v7;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v10)
    {
      id v11 = v10;
      id v41 = 0;
      uint64_t v12 = *(void *)v43;
      id v37 = v9;
      id v38 = v8;
      uint64_t v36 = *(void *)v43;
      do
      {
        uint64_t v13 = 0;
        id v40 = v11;
        do
        {
          if (*(void *)v43 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v13);
          if ([v14 numberOfRanges] == (id)4)
          {
            id v15 = [v14 rangeAtIndex:1];
            double v17 = objc_msgSend(v8, "substringWithRange:", v15, v16);
            id v18 = [v14 rangeAtIndex:2];
            unsigned int v20 = objc_msgSend(v8, "substringWithRange:", v18, v19);
            if ((uint64_t)[v20 integerValue] <= 12 && (uint64_t)objc_msgSend(v17, "integerValue") <= 31)
            {
              [v14 rangeAtIndex:3];
              if (v21)
              {
                id v22 = [v14 rangeAtIndex:3];
                id v24 = objc_msgSend(v8, "substringWithRange:", v22, v23);
              }
              else
              {
                id v24 = 0;
              }
              id v25 = objc_alloc_init((Class)NSDateComponents);
              objc_msgSend(v25, "setMonth:", (int)objc_msgSend(v20, "intValue"));
              objc_msgSend(v25, "setDay:", (int)objc_msgSend(v17, "intValue"));
              if ([v24 length]) {
                objc_msgSend(v25, "setYear:", (int)objc_msgSend(v24, "intValue"));
              }
              double v26 = +[NSCalendar currentCalendar];
              id v27 = [v26 dateFromComponents:v25];

              [v24 length];
              id v28 = AXDateStringForFormat();
              id v29 = &v41[(void)[v14 range]];
              [v14 range];
              objc_msgSend(v39, "replaceCharactersInRange:withString:", v29, v30, v28);
              id v31 = (char *)[v28 length];
              [v14 range];
              id v41 = &v41[(void)v31 - v32];

              id v9 = v37;
              id v8 = v38;
              uint64_t v12 = v36;
              id v11 = v40;
            }
          }
          uint64_t v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v11);
    }

    BOOL v33 = [v9 count] != 0;
    id v3 = v39;
    unint64_t v7 = v35;
  }
  else
  {
    BOOL v33 = 0;
  }

  return v33;
}

- (void)_formatDetectedDates:(id)a3 voiceIdentifier:(id)a4 languageCode:(id)a5 rate:(float)a6
{
  id v9 = a3;
  id v53 = a4;
  id v10 = a5;
  if (!qword_1001EB7C0)
  {
    uint64_t v11 = +[NSRegularExpression regularExpressionWithPattern:@"\\b([0-9]{1,4}(/|-|\\.)[0-9]{1,2}((/|-|\\.)[0-9]{2,4})?)\\b" options:0 error:0];
    uint64_t v12 = (void *)qword_1001EB7C0;
    qword_1001EB7C0 = v11;

    if (!qword_1001EB7C0)
    {
      uint64_t v13 = VOTLogSpeech();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10011D018(v13);
      }
    }
  }
  if (![v10 hasPrefix:@"fi"]
    || ![(VOTOutputSpeechComponent *)self _formatDetectedFinnishDates:v9])
  {
    id v14 = objc_msgSend((id)qword_1001EB7C0, "matchesInString:options:range:", v9, 0, 0, objc_msgSend(v9, "length"));
    if ([v14 count])
    {
      id v50 = v10;
      id v15 = +[NSMutableString string];
      id v48 = [v9 length];
      uint64_t v49 = v14;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id obj = v14;
      id v16 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
      if (v16)
      {
        id v17 = v16;
        unint64_t v18 = 0;
        uint64_t v19 = *(void *)v57;
        id v51 = v9;
        do
        {
          unsigned int v20 = 0;
          id v54 = v17;
          do
          {
            if (*(void *)v57 != v19) {
              objc_enumerationMutation(obj);
            }
            uint64_t v21 = (char *)[*(id *)(*((void *)&v56 + 1) + 8 * (void)v20) range];
            uint64_t v23 = v22;
            id v24 = &v21[-v18];
            if (v21 != (char *)v18)
            {
              id v25 = objc_msgSend(v9, "substringWithRange:", v18, v24);
              [v15 appendString:v25];
            }
            if (v21)
            {
              double v26 = 0;
              int v27 = 0;
              do
              {
                unsigned int v28 = objc_msgSend(v9, "characterAtIndex:", v26, v24);
                unsigned int v29 = v28 - 162;
                if (v28 == 36) {
                  int v30 = 1;
                }
                else {
                  int v30 = v27;
                }
                if (v29 > 3 || v29 == 2) {
                  int v27 = v30;
                }
                else {
                  int v27 = 1;
                }
                if (v29 <= 3 && v28 != 164) {
                  break;
                }
                if (v28 == 36) {
                  break;
                }
                ++v26;
              }
              while (v21 != v26);
            }
            else
            {
              int v27 = 0;
            }
            unint64_t v18 = (unint64_t)&v21[v23];
            uint64_t v32 = objc_msgSend(v9, "substringWithRange:", v21, v23);
            if ((unint64_t)[v32 length] < 4) {
              int v33 = 1;
            }
            else {
              int v33 = v27;
            }
            BOOL v35 = v18 < (unint64_t)[v9 length]
               && [v9 characterAtIndex:v18] == 37;
            if (((v33 | v35) & 1) == 0)
            {
              *(float *)&double v34 = a6;
              uint64_t v36 = [(VOTOutputSpeechComponent *)self pauseStringForType:6 voiceIdentifier:v53 rate:v34];
              id v37 = +[NSString stringWithFormat:@" %@ ", v36];

              id v38 = [v32 stringByReplacingOccurrencesOfString:@"-" withString:v37];

              [v38 stringByReplacingOccurrencesOfString:@"/" withString:v37];
              id v39 = v15;
              id v41 = v40 = v19;

              long long v42 = [(id)VOTSharedWorkspace selectedLanguage];
              uint64_t v43 = sub_10005215C(46, @"UnicodeHex.Alternate1.", @"VOTOutputPunctuation", v42);

              if (v43) {
                long long v44 = (__CFString *)v43;
              }
              else {
                long long v44 = @".";
              }
              long long v45 = +[NSString stringWithFormat:@" %@ ", v44];
              uint64_t v32 = [v41 stringByReplacingOccurrencesOfString:@"." withString:v45];

              uint64_t v19 = v40;
              id v15 = v39;
              id v9 = v51;
              id v17 = v54;
            }
            [v15 appendString:v32];

            unsigned int v20 = (char *)v20 + 1;
          }
          while (v20 != v17);
          id v17 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
        }
        while (v17);
      }
      else
      {
        unint64_t v18 = 0;
      }

      if ((uint64_t)v18 < (uint64_t)v48)
      {
        long long v46 = [v9 substringFromIndex:v18];
        [v15 appendString:v46];
      }
      v47 = VOTLogSpeech();
      id v14 = v49;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
        sub_10011CFB0();
      }

      [v9 setString:v15];
      id v10 = v50;
    }
  }
}

- (void)_formatJapaneseYen:(id)a3
{
  id v3 = a3;
  if (qword_1001EB7D0 != -1) {
    dispatch_once(&qword_1001EB7D0, &stru_1001B3C10);
  }
  BOOL v4 = objc_msgSend((id)qword_1001EB7C8, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) range];
        objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"JP", &stru_1001B7888, 0, v9, v10);
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_applyTransliteration:(id)a3 languageCode:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  id v6 = +[AXLanguageManager sharedInstance];
  uint64_t v7 = v6;
  if (v5)
  {
    id v8 = [v6 dialectForLanguageID:v5];
  }
  else
  {
    id v9 = [(id)VOTSharedWorkspace systemSpokenLanguage];
    id v8 = [v7 dialectForLanguageID:v9];
  }
  if ([v8 speakingRequiresTransliteration])
  {
    uint64_t v10 = [v8 transliteratedStringForString:v11];
    objc_msgSend(v11, "replaceCharactersInRange:withString:", 0, objc_msgSend(v11, "length"), v10);
  }
}

- (void)_formatEthernetMacAddress:(id)a3 voiceIdentifier:(id)a4 rate:(float)a5
{
  id v8 = a3;
  id v9 = a4;
  id v36 = 0;
  uint64_t v10 = +[NSRegularExpression regularExpressionWithPattern:@"\\b(\\S\\S)\\s?:\\s?(\\S\\S)\\s?:\\s?(\\S\\S)\\s?:\\s?(\\S\\S)\\s?:\\s?(\\S\\S)\\s?:\\s?(\\S\\S)\\b" options:1 error:&v36];
  id v11 = v36;
  if (v10)
  {
    long long v12 = +[NSMutableString string];
    long long v13 = objc_msgSend(v10, "matchesInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));
    if ([v13 count])
    {
      id v31 = v10;
      BOOL v35 = v8;
      unsigned int v29 = v13;
      double v34 = [v13 firstObject];
      id v14 = [v34 numberOfRanges];
      *(float *)&double v15 = a5;
      [(VOTOutputSpeechComponent *)self pauseStringForType:6 voiceIdentifier:v9 rate:v15];
      int v33 = v32 = v9;
      *(float *)&double v16 = a5;
      id v17 = [(VOTOutputSpeechComponent *)self pauseStringForType:4 voiceIdentifier:v9 rate:v16];
      unint64_t v18 = v14 != (id)6;
      id v30 = v11;
      if ((unint64_t)v14 <= v18)
      {
        NSUInteger location = 0;
        NSUInteger length = 0;
      }
      else
      {
        NSUInteger v19 = 0;
        NSUInteger v20 = 0;
        do
        {
          id v21 = [v34 rangeAtIndex:v18];
          NSUInteger v23 = v22;
          NSUInteger location = (NSUInteger)v21;
          NSUInteger length = v22;
          if (v20)
          {
            v37.NSUInteger location = v19;
            v37.NSUInteger length = v20;
            v38.NSUInteger location = (NSUInteger)v21;
            v38.NSUInteger length = v23;
            NSRange v26 = NSUnionRange(v37, v38);
            NSUInteger location = v26.location;
            NSUInteger length = v26.length;
          }
          int v27 = objc_msgSend(v35, "substringWithRange:", v21, v23);
          unsigned int v28 = [v27 uppercaseString];

          [v12 appendFormat:@"%C%@%C%@", objc_msgSend(v28, "characterAtIndex:", 0), v17, objc_msgSend(v28, "characterAtIndex:", 1), v33];
          ++v18;
          NSUInteger v19 = location;
          NSUInteger v20 = length;
        }
        while (v14 != (id)v18);
      }
      id v8 = v35;
      uint64_t v10 = v31;
      if ([v12 length]) {
        objc_msgSend(v35, "replaceCharactersInRange:withString:", location, length, v12);
      }

      id v9 = v32;
      long long v13 = v29;
      id v11 = v30;
    }
  }
  else
  {
    _AXLogWithFacility();
  }
}

- (void)_formatNumbers:(id)a3 action:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(VOTOutputComponent *)self determineActivityForAction:a4];
  id v8 = [(id)VOTSharedWorkspace numberFeedback];
  id v9 = [v7 numberFeedback];

  if (v9)
  {
    uint64_t v10 = [v7 numberFeedback];
    id v8 = [v10 integerValue];
  }
  if (v8 == (id)2)
  {
    if (qword_1001EB7E0 != -1) {
      dispatch_once(&qword_1001EB7E0, &stru_1001B3C30);
    }
    objc_msgSend((id)qword_1001EB7D8, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v11 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = 0;
      uint64_t v14 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(obj);
          }
          double v16 = (char *)[*(id *)(*((void *)&v25 + 1) + 8 * i) range];
          uint64_t v18 = v17;
          NSUInteger v19 = &v16[v13];
          NSUInteger v20 = objc_opt_new();
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          void v23[2] = sub_100032B24;
          v23[3] = &unk_1001B3C58;
          id v24 = v20;
          id v21 = v20;
          objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", v19, v18, 2, v23);
          objc_msgSend(v6, "replaceCharactersInRange:withString:", v19, v18, v21);
          v13 += (uint64_t)[v21 length] - v18;
        }
        id v12 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v12);
    }
  }
}

- (void)_formatUSHeight:(id)a3 voiceIdentifier:(id)a4
{
  id v37 = a3;
  id v5 = +[AVSpeechSynthesisVoice _voiceFromInternalVoiceListWithIdentifier:a4];
  id v6 = [v5 language];
  unsigned int v7 = [v6 isEqualToString:@"en-US"];

  if (v7)
  {
    id v8 = v37;
    if (qword_1001EB7F0 != -1)
    {
      dispatch_once(&qword_1001EB7F0, &stru_1001B3C78);
      id v8 = v37;
    }
    id v9 = objc_msgSend((id)qword_1001EB7E8, "matchesInString:options:range:", v37, 0, 0, objc_msgSend(v8, "length"));
    uint64_t v10 = [v9 firstObject];
    if ([v10 numberOfRanges] == (id)5)
    {
      id v11 = [v10 rangeAtIndex:1];
      uint64_t v13 = objc_msgSend(v37, "substringWithRange:", v11, v12);
      int v14 = [v13 intValue];

      id v15 = [v10 rangeAtIndex:3];
      uint64_t v17 = objc_msgSend(v37, "substringWithRange:", v15, v16);
      int v18 = [v17 intValue];

      id v19 = objc_alloc_init((Class)NSMeasurementFormatter);
      [v19 setUnitStyle:3];
      [v19 setUnitOptions:1];
      NSUInteger v20 = +[AXLanguageManager sharedInstance];
      id v21 = [(id)VOTSharedWorkspace selectedLanguage];
      NSUInteger v22 = [v20 dialectForLanguageID:v21];
      NSUInteger v23 = [v22 locale];
      [v19 setLocale:v23];

      id v24 = objc_alloc((Class)NSMeasurement);
      double v25 = (double)v14;
      long long v26 = +[NSUnitLength feet];
      id v27 = [v24 initWithDoubleValue:v26 unit:v25];
      long long v28 = [v19 stringFromMeasurement:v27];
      id v29 = objc_alloc((Class)NSMeasurement);
      id v30 = +[NSUnitLength inches];
      id v31 = [v29 initWithDoubleValue:v30 unit:(double)v18];
      id v36 = [v19 stringFromMeasurement:v31];
      id v32 = __AXStringForVariables();

      if (objc_msgSend(v32, "length", v36, @"__AXStringForVariablesSentinel"))
      {
        id v33 = [v10 rangeAtIndex:0];
        BOOL v35 = objc_msgSend(v37, "substringWithRange:", v33, v34);
        objc_msgSend(v37, "replaceOccurrencesOfString:withString:options:range:", v35, v32, 0, 0, objc_msgSend(v37, "length"));
      }
    }
  }
}

- (void)_formatATVStyleMediaDurations:(id)a3
{
  id v3 = a3;
  id v22 = v3;
  if (qword_1001EB800 != -1)
  {
    dispatch_once(&qword_1001EB800, &stru_1001B3C98);
    id v3 = v22;
  }
  BOOL v4 = objc_msgSend((id)qword_1001EB7F8, "matchesInString:options:range:", v22, 0, 0, objc_msgSend(v3, "length"));
  id v5 = [v4 firstObject];
  if ([v5 numberOfRanges] == (id)5)
  {
    double v6 = 0.0;
    if ([v5 rangeAtIndex:2] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = [v5 rangeAtIndex:2];
      id v9 = objc_msgSend(v22, "substringWithRange:", v7, v8);
      [v9 floatValue];
      double v11 = v10;

      double v6 = v11 * 60.0;
    }
    id v12 = [v5 rangeAtIndex:3];
    int v14 = objc_msgSend(v22, "substringWithRange:", v12, v13);
    [v14 floatValue];
    double v16 = v15;

    uint64_t v17 = [(id)VOTSharedWorkspace selectedLanguage];
    int v18 = sub_100051A14(0, v17, v16 * 60.0 + v6 * 60.0);

    if ([v18 length])
    {
      id v19 = [v5 rangeAtIndex:0];
      id v21 = objc_msgSend(v22, "substringWithRange:", v19, v20);
      objc_msgSend(v22, "replaceOccurrencesOfString:withString:options:range:", v21, v18, 0, 0, objc_msgSend(v22, "length"));
    }
  }
}

- (void)_formatIPAddress:(id)a3 voiceIdentifier:(id)a4 rate:(float)a5
{
  id v7 = a3;
  id v43 = a4;
  uint64_t v8 = (void *)qword_1001EB808;
  if (!qword_1001EB808)
  {
    uint64_t v9 = +[NSRegularExpression regularExpressionWithPattern:@"\\b([0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3})\\b" options:0 error:0];
    float v10 = (void *)qword_1001EB808;
    qword_1001EB808 = v9;

    uint64_t v11 = +[NSRegularExpression regularExpressionWithPattern:@"\\b((?:[0-9a-fA-F]{0,4}:){5,7}[0-9A-Fa-f]{0,4})\\b" options:0 error:0];
    id v12 = (void *)qword_1001EB810;
    qword_1001EB810 = v11;

    uint64_t v8 = (void *)qword_1001EB808;
  }
  uint64_t v13 = objc_msgSend(v8, "matchesInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
  int v14 = objc_msgSend((id)qword_1001EB810, "matchesInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
  float v15 = [v13 arrayByAddingObjectsFromArray:v14];
  if ([v15 count])
  {
    NSRange v38 = v14;
    id v39 = v13;
    double v16 = +[NSMutableString string];
    long long v42 = v7;
    id v36 = (char *)[v7 length];
    id v37 = v15;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = v15;
    id v17 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v17)
    {
      id v18 = v17;
      id v19 = 0;
      uint64_t v20 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v18; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v45 != v20) {
            objc_enumerationMutation(obj);
          }
          id v22 = (char *)[*(id *)(*((void *)&v44 + 1) + 8 * i) range];
          uint64_t v24 = v23;
          if (v22 > v19)
          {
            double v25 = objc_msgSend(v42, "substringWithRange:", v19, v22 - v19);
            [v16 appendString:v25];
          }
          id v19 = &v22[v24];
          long long v26 = objc_msgSend(v42, "substringWithRange:", v22, v24);
          id v27 = [v26 mutableCopyWithZone:0];

          long long v28 = [(id)VOTSharedWorkspace selectedLanguage];
          uint64_t v29 = sub_10005215C(46, @"UnicodeHex.Alternate1.", @"VOTOutputPunctuation", v28);

          if (v29) {
            id v31 = (__CFString *)v29;
          }
          else {
            id v31 = @".";
          }
          *(float *)&double v30 = a5;
          id v32 = [(VOTOutputSpeechComponent *)self pauseStringForType:6 voiceIdentifier:v43 rate:v30];
          id v33 = +[NSString stringWithFormat:@"%@ %@ %@", v32, v31, v32];
          objc_msgSend(v27, "replaceOccurrencesOfString:withString:options:range:", @".", v33, 1, 0, objc_msgSend(v27, "length"));

          objc_msgSend(v27, "replaceOccurrencesOfString:withString:options:range:", @":", @" : ", 1, 0, objc_msgSend(v27, "length"));
          [v16 appendString:v27];
        }
        id v18 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v18);
    }
    else
    {
      id v19 = 0;
    }

    id v7 = v42;
    if ((uint64_t)v19 < (uint64_t)v36)
    {
      uint64_t v34 = [v42 substringFromIndex:v19];
      [v16 appendString:v34];
    }
    BOOL v35 = VOTLogSpeech();
    int v14 = v38;
    uint64_t v13 = v39;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      sub_10011D05C();
    }

    [v42 setString:v16];
    float v15 = v37;
  }
}

- (void)_formatExplicitTimeDuration:(id)a3 isMMSS:(BOOL)a4 languageCode:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = +[NSCharacterSet characterSetWithCharactersInString:@","];
  float v10 = [v7 stringByTrimmingCharactersInSet:v9];

  [v7 setString:v10];
  uint64_t v11 = [v7 componentsSeparatedByString:@":"];
  id v12 = [v11 count];
  int v13 = v12 == (id)3 || v6;
  if (v13 == 1)
  {
    if (v12 == (id)3)
    {
      int v14 = [v11 objectAtIndex:0];
      uint64_t v15 = 3600 * (void)[v14 integerValue];
      double v16 = [v11 objectAtIndex:1];
      float v17 = (float)(v15 + 60 * (uint64_t)[v16 integerValue]);
      id v18 = [v11 objectAtIndex:2];
      [v18 floatValue];
      double v20 = (float)(v19 + v17);
    }
    else
    {
      if (v12 == (id)1)
      {
        int v14 = [v11 objectAtIndex:0];
        [v14 floatValue];
        double v20 = v24;
        goto LABEL_16;
      }
      double v20 = -1.0;
      if (v12 != (id)2) {
        goto LABEL_17;
      }
      int v14 = [v11 objectAtIndex:0];
      float v22 = (float)(60 * (uint64_t)[v14 integerValue]);
      double v16 = [v11 objectAtIndex:1];
      [v16 floatValue];
      double v20 = (float)(v23 + v22);
    }
  }
  else
  {
    if (v12 == (id)1)
    {
      int v14 = [v11 objectAtIndex:0];
      double v20 = (double)(60 * (uint64_t)[v14 integerValue]);
      goto LABEL_16;
    }
    double v20 = -1.0;
    if (v12 != (id)2) {
      goto LABEL_17;
    }
    int v14 = [v11 objectAtIndex:0];
    uint64_t v21 = 3600 * (void)[v14 integerValue];
    double v16 = [v11 objectAtIndex:1];
    double v20 = (double)(v21 + 60 * (uint64_t)[v16 integerValue]);
  }

LABEL_16:
LABEL_17:
  double v25 = VOTLogSpeech();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    sub_10011D12C((uint64_t)v7, v25, v20);
  }

  if (v20 != -1.0)
  {
    long long v26 = sub_100051A14(v13 ^ 1, v8, v20);
    [v7 setString:v26];
  }
  id v27 = VOTLogSpeech();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    sub_10011D0C4();
  }
}

- (void)_formatTimeDuration:(id)a3 didMatch:(BOOL *)a4 voiceIdentifier:(id)a5 rate:(float)a6
{
  id v9 = a3;
  id v63 = a5;
  *a4 = 0;
  float v10 = (void *)qword_1001EB818;
  if (!qword_1001EB818)
  {
    uint64_t v11 = +[NSRegularExpression regularExpressionWithPattern:@"\\b((?<!:)[0-9]{1,2}:[0-9]{2}(?!:))\\s?(am|pm|AM|PM|[:cntrl:])?" options:0 error:0];
    id v12 = (void *)qword_1001EB818;
    qword_1001EB818 = v11;

    float v10 = (void *)qword_1001EB818;
  }
  int v13 = objc_msgSend(v10, "matchesInString:options:range:", v9, 0, 0, objc_msgSend(v9, "length"));
  int v14 = (void *)qword_1001EB820;
  if (!qword_1001EB820)
  {
    uint64_t v15 = +[NSRegularExpression regularExpressionWithPattern:@"\\b([0-9]{1,2}:[0-9]{2})\\s?(-|–)\\s?([0-9]{1,2}:[0-9]{2})" options:0 error:0];
    double v16 = (void *)qword_1001EB820;
    qword_1001EB820 = v15;

    int v14 = (void *)qword_1001EB820;
  }
  int v69 = objc_msgSend(v14, "matchesInString:options:range:", v9, 0, 0, objc_msgSend(v9, "length"));
  id v67 = v9;
  if ([v69 count])
  {
    id v70 = a4;
    id v65 = [v13 mutableCopy];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id obj = v13;
    id v17 = [obj countByEnumeratingWithState:&v82 objects:v88 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v83;
      do
      {
        for (uint64_t i = 0; i != v18; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v83 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void **)(*((void *)&v82 + 1) + 8 * i);
          id v22 = [v21 range];
          NSUInteger v24 = v23;
          long long v78 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          id v25 = v69;
          id v26 = [v25 countByEnumeratingWithState:&v78 objects:v87 count:16];
          if (v26)
          {
            id v27 = v26;
            uint64_t v28 = *(void *)v79;
            while (2)
            {
              for (j = 0; j != v27; j = (char *)j + 1)
              {
                if (*(void *)v79 != v28) {
                  objc_enumerationMutation(v25);
                }
                v89.NSUInteger location = (NSUInteger)[*(id *)(*((void *)&v78 + 1) + 8 * (void)j) range];
                v90.NSUInteger location = (NSUInteger)v22;
                v90.NSUInteger length = v24;
                if (NSIntersectionRange(v89, v90).length)
                {
                  [v65 removeObject:v21];
                  goto LABEL_21;
                }
              }
              id v27 = [v25 countByEnumeratingWithState:&v78 objects:v87 count:16];
              if (v27) {
                continue;
              }
              break;
            }
          }
LABEL_21:
        }
        id v18 = [obj countByEnumeratingWithState:&v82 objects:v88 count:16];
      }
      while (v18);
    }

    double v30 = v65;
    id v9 = v67;
    a4 = v70;
  }
  else
  {
    double v30 = v13;
  }
  if (![v30 count]) {
    goto LABEL_56;
  }
  *a4 = 1;
  id obja = +[NSMutableString string];
  unint64_t v61 = (char *)[v9 length];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v66 = v30;
  id v64 = v30;
  id v71 = [v64 countByEnumeratingWithState:&v74 objects:v86 count:16];
  id v31 = 0;
  if (!v71) {
    goto LABEL_51;
  }
  id v32 = &objc_release_x25_ptr;
  uint64_t v68 = *(void *)v75;
  do
  {
    for (k = 0; k != v71; k = (char *)k + 1)
    {
      if (*(void *)v75 != v68) {
        objc_enumerationMutation(v64);
      }
      uint64_t v34 = (char *)[*(id *)(*((void *)&v74 + 1) + 8 * (void)k) range];
      uint64_t v36 = v35;
      if (v34 != v31)
      {
        id v37 = objc_msgSend(v9, "substringWithRange:", v31, v34 - v31);
        [obja appendString:v37];
      }
      NSRange v38 = objc_msgSend(v9, "substringWithRange:", v34, v36);
      id v39 = [v32[306] currentCalendar];
      uint64_t v40 = [v39 AMSymbol];
      if ([v38 rangeOfString:v40 options:1] != (id)0x7FFFFFFFFFFFFFFFLL)
      {

LABEL_40:
        [obja appendString:v38];
        goto LABEL_49;
      }
      id v41 = [v32[306] currentCalendar];
      long long v42 = [v41 PMSymbol];
      id v43 = [v38 rangeOfString:v42 options:1];

      id v32 = &objc_release_x25_ptr;
      id v9 = v67;

      if (v43 != (id)0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_40;
      }
      long long v44 = (char *)[v38 rangeOfString:@":"];
      long long v45 = [v38 substringToIndex:v44];
      long long v46 = [v38 substringFromIndex:v44 + 1];
      long long v47 = +[NSCharacterSet decimalDigitCharacterSet];
      id v48 = [v45 rangeOfCharacterFromSet:v47];

      if (v48 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v49 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d", [v45 intValue]);

        long long v45 = (void *)v49;
      }
      id v50 = +[NSCharacterSet decimalDigitCharacterSet];
      id v51 = [v46 rangeOfCharacterFromSet:v50];

      if (v51 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        id v32 = &objc_release_x25_ptr;
      }
      else
      {
        id v53 = [v46 integerValue];
        id v32 = &objc_release_x25_ptr;
        if (v53)
        {
          uint64_t v54 = (uint64_t)v53;
          id v55 = [v46 intValue];
          if (v54 >= 10) {
            CFStringRef v56 = @"%d";
          }
          else {
            CFStringRef v56 = @"0%d";
          }
          +[NSString stringWithFormat:](NSString, "stringWithFormat:", v56, v55);
          CFStringRef v57 = (const __CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          CFStringRef v57 = &stru_1001B7888;
        }

        long long v46 = (void *)v57;
        id v9 = v67;
      }
      *(float *)&double v52 = a6;
      long long v58 = [(VOTOutputSpeechComponent *)self pauseStringForType:6 voiceIdentifier:v63 rate:v52];
      [obja appendFormat:@" %@ %@ %@ ", v45, v58, v46];

LABEL_49:
      id v31 = &v34[v36];
    }
    id v71 = [v64 countByEnumeratingWithState:&v74 objects:v86 count:16];
  }
  while (v71);
LABEL_51:

  if ((uint64_t)v31 < (uint64_t)v61)
  {
    long long v59 = [v9 substringFromIndex:v31];
    [obja appendString:v59];
  }
  v60 = VOTLogSpeech();
  double v30 = v66;
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
    sub_10011D1B0();
  }

  [v9 setString:obja];
LABEL_56:
}

- (void)_appendLiteralCharacterString:(id)a3 toString:(id)a4 hasPhoneContext:(BOOL)a5 hasMathContext:(BOOL)a6 action:(id)a7 punctuationTableLanguageUsed:(BOOL *)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = [v16 objectForVariant:58];
  unsigned __int8 v18 = [v17 BOOLValue];

  uint64_t v19 = [v16 objectForVariant:57];
  unsigned int v20 = [v19 BOOLValue];

  uint64_t v21 = [v16 objectForVariant:17];
  if ((unint64_t)[v14 length] > 2)
  {
    BOOL v26 = 0;
    goto LABEL_25;
  }
  uint64_t v22 = AXUnicodeCodePointForCharacterString();
  unsigned int v80 = v22;
  if (v11)
  {
    NSUInteger v23 = sub_10005215C(v22, @"UnicodeHex.PhoneContext.", @"VOTOutputPunctuation", v21);
    id v24 = v23;
    if (v23) {
      id v25 = v23;
    }

    if (!v24) {
      goto LABEL_41;
    }
LABEL_16:
    BOOL v29 = 0;
    if (v21) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (v10)
  {
    id v27 = @"UnicodeHex.Math.";
    goto LABEL_12;
  }
  if (v20)
  {
    id v27 = @"UnicodeHex.TypingContext.";
LABEL_12:
    uint64_t v28 = sub_10005215C(v22, v27, @"VOTOutputPunctuation", v21);
    if ([v28 length]) {
      id v24 = v28;
    }
    else {
      id v24 = 0;
    }

    if (!v24) {
      goto LABEL_41;
    }
    goto LABEL_16;
  }
  long long v42 = [v16 objectForVariant:42];

  if (v42)
  {
    v81[1] = 0;
    objc_opt_class();
    id v43 = [v16 objectForVariant:42];
    long long v44 = __UIAccessibilityCastAsClass();

    if (v44)
    {
      long long v45 = +[NSString stringWithFormat:@"UnicodeHex.%@.", v44];
      long long v46 = sub_10005215C(v80, v45, @"VOTOutputPunctuation", v21);
      id v24 = v46;
      if (v46) {
        id v47 = v46;
      }
    }
    else
    {
      id v24 = 0;
    }

    if (v24) {
      goto LABEL_16;
    }
  }
LABEL_41:
  v81[0] = 0;
  id v48 = [(VOTOutputSpeechComponent *)self _determinePunctuationGroupForAction:v16 isDefault:v81];
  uint64_t v49 = v48;
  if (v81[0]) {
    char v50 = 1;
  }
  else {
    char v50 = v18;
  }
  if (v50)
  {
    id v24 = 0;
  }
  else
  {
    [v48 entries];
    id v51 = v77 = v49;
    double v52 = objc_msgSend(v51, "ax_filteredArrayUsingBlock:", &stru_1001B3CD8);
    BOOL v53 = [v52 count] != 0;

    uint64_t v49 = v77;
    LOBYTE(v74) = 0;
    id v24 = [(VOTOutputSpeechComponent *)self _replacePunctuation:v14 punctuationGroup:v77 hasMathContext:0 hasPhoneContext:0 isText:0 replaceCommas:v53 languageCode:v21 speakPunctuationCounts:v74];
    if ([v24 length] && (objc_msgSend(v24, "isEqualToString:", v14) & 1) == 0)
    {
      if (!sub_1000EC880((uint64_t)[v24 characterAtIndex:0], (uint64_t)objc_msgSend(v14, "characterAtIndex:", 0)))
      {
        BOOL v29 = 1;
        uint64_t v49 = v77;
        goto LABEL_82;
      }
      uint64_t v49 = v77;
    }
  }
  if (v80 >= 0x10000)
  {
    sub_10005215C(v80, @"UnicodeHex.", @"VOTOutputPunctuation", v21);
    long long v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
    BOOL v29 = 0;
  }
  else
  {
    if ([v14 length] != (id)1)
    {
      [v16 objectForVariant:28];
      long long v78 = a8;
      uint64_t v54 = self;
      v56 = id v55 = v49;
      unsigned int v57 = [v56 BOOLValue];

      uint64_t v49 = v55;
      self = v54;
      a8 = v78;
      if (!v57) {
        goto LABEL_57;
      }
    }
    unsigned __int8 v58 = v21 ? v18 : 0;
    if (v58)
    {
LABEL_57:
      BOOL v29 = 0;
      goto LABEL_82;
    }
    long long v79 = v49;
    uint64_t v60 = [(id)VOTSharedWorkspace selectedLanguage];
    uint64_t v61 = [(id)VOTSharedWorkspace systemSpokenLanguage];
    v62 = [(VOTOutputSpeechComponent *)self currentAllPunctuationTable];
    long long v75 = (void *)v61;
    long long v76 = (void *)v60;
    long long v59 = [(VOTOutputSpeechComponent *)self punctuationReplacement:v14 withGroup:0 baseTable:v62 languageCode:v21 selectedLanguage:v60 spokenLanguage:v61];

    if ([(__CFString *)v59 length] == (id)1)
    {
      id v63 = +[NSCharacterSet whitespaceCharacterSet];
      unsigned int v64 = objc_msgSend(v63, "characterIsMember:", -[__CFString characterAtIndex:](v59, "characterAtIndex:", 0));

      if (v64)
      {
        id v65 = v76;
        if (!v65 && v21)
        {
          uint64_t v66 = AXCLanguageCanonicalFormToGeneralLanguage();
          id v67 = AXCLanguageCanonicalFormToGeneralLanguage();
          unsigned __int8 v68 = [v66 isEqualToString:v67];

          if (v68) {
            id v65 = 0;
          }
          else {
            id v65 = v21;
          }
        }
        uint64_t v69 = sub_10005215C(v80, @"UnicodeHex.", @"VOTOutputPunctuation", v65);

        if (v69) {
          long long v59 = (__CFString *)v69;
        }
        else {
          long long v59 = @" ";
        }
      }
    }
    BOOL v29 = v59 != 0;
    uint64_t v49 = v79;
    if (!v59)
    {
      id v70 = +[AXLanguageManager sharedInstance];
      id v71 = v70;
      if (v21)
      {
        unsigned int v72 = [v70 dialectForLanguageID:v21];
      }
      else
      {
        char v73 = [(id)VOTSharedWorkspace systemSpokenLanguage];
        unsigned int v72 = [v71 dialectForLanguageID:v73];
      }
      if (v72
        && [v72 hasSpeakableCharacters]
        && ([v72 canSpeakCharacter:(unsigned __int16)v80] & 1) == 0)
      {
        AXVOLocalizedStringForCharacter();
        long long v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v59) {
          long long v59 = (__CFString *)AXCopyUnicodeDescriptionStringForCharacter();
        }
      }
      else
      {
        long long v59 = 0;
      }

      uint64_t v49 = v79;
    }

    id v24 = v76;
  }

  id v24 = v59;
LABEL_82:

  if (!v21)
  {
LABEL_17:
    uint64_t v21 = [(id)VOTSharedWorkspace systemSpokenLanguage];
  }
LABEL_18:
  if ([v14 length] == (id)1)
  {
    double v30 = sub_1000346E0((uint64_t)[v14 characterAtIndex:0]);
    id v31 = v30;
    if (v30)
    {
      id v32 = v30;

      id v24 = v32;
    }
  }
  BOOL v26 = v29;
  if (v24)
  {
    [v16 removeObjectForVariant:15];
    [v15 appendString:@" "];
    [v15 appendString:v24];
    [v15 appendString:@" "];

    if (!a8) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_25:
  unsigned int v33 = sub_100050EB4(v14);
  uint64_t v34 = [(VOTOutputSpeechComponent *)self _literalStringMarkupForString:v14 languageCode:v21 action:v16];

  [v15 appendString:v34];
  if (!v33) {
    goto LABEL_31;
  }
  uint64_t v35 = +[AXSettings sharedInstance];
  id v36 = [v35 voiceOverCapitalLetterFeedback];

  if (v36 == (id)2)
  {
    CFStringRef v37 = @"Sounds/Capitals.aiff";
    NSRange v38 = v16;
    uint64_t v39 = 75;
  }
  else
  {
    uint64_t v40 = +[AXSettings sharedInstance];
    id v41 = [v40 voiceOverCapitalLetterFeedback];

    if (v41 != (id)1) {
      goto LABEL_31;
    }
    CFStringRef v37 = (const __CFString *)&off_1001C4EB8;
    NSRange v38 = v16;
    uint64_t v39 = 32;
  }
  [v38 setObject:v37 forVariant:v39];
LABEL_31:
  id v14 = (id)v34;
  if (a8) {
LABEL_32:
  }
    *a8 = v26;
LABEL_33:
}

- (id)_literalStringMarkupForString:(id)a3 languageCode:(id)a4 action:(id)a5
{
  synthesizer = self->_synthesizer;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(TTSSpeechSynthesizer *)synthesizer voiceIdentifier];
  [(TTSSpeechSynthesizer *)self->_synthesizer setVoiceIdentifier:0];
  int v13 = [(VOTOutputSpeechComponent *)self _determineVoiceIdentifier:v9 languageCode:v10];

  id v14 = sub_100050F30(v11, v13);

  [(TTSSpeechSynthesizer *)self->_synthesizer setVoiceIdentifier:v12];

  return v14;
}

- (id)_stringForLiteralText:(id)a3 action:(id)a4 allowChangingLanguageForPunctuation:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 length];
  id v10 = [v8 objectForVariant:55];
  id v11 = [v10 BOOLValue];

  id v12 = [v8 objectForVariant:56];
  id v13 = [v12 BOOLValue];

  id v14 = [v8 objectForVariant:66];
  id v15 = [v14 BOOLValue];

  if ((unint64_t)[v7 length] >= 2 && v9 == (id)1)
  {
    id v16 = [(VOTOutputSpeechComponent *)self _stringForNormalText:v7 action:v8 allowPausingAtBoundaries:0 ignoreLeadingCommas:v15];
  }
  else
  {
    id v36 = v8;
    if (v5
      && [v7 length]
      && ([v7 rangeOfComposedCharacterSequenceAtIndex:0], v17 == objc_msgSend(v7, "length")))
    {
      char v38 = 0;
      unsigned __int8 v18 = +[NSMutableString string];
      [(VOTOutputSpeechComponent *)self _appendLiteralCharacterString:v7 toString:v18 hasPhoneContext:v11 hasMathContext:v13 action:v8 punctuationTableLanguageUsed:&v38];
      id v16 = v18;
      if (v38)
      {
        uint64_t v19 = [(id)VOTSharedWorkspace selectedLanguage];

        if (!v19)
        {
          unsigned int v20 = [v8 objectForVariant:17];
          if (!v20)
          {
            uint64_t v21 = [(id)VOTSharedWorkspace systemSpokenLanguage];
            unsigned int v20 = AXLanguageCanonicalFormToGeneralLanguage();
          }
          uint64_t v22 = [(VOTOutputSpeechComponent *)self _determineVoiceIdentifier:v8 languageCode:v20];
          NSUInteger v23 = +[TTSSpeechSynthesizer voiceForIdentifier:v22];
          id v24 = [v23 language];

          id v25 = VOTLogSpeech();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412546;
            uint64_t v40 = v24;
            __int16 v41 = 2112;
            long long v42 = v22;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Language rotor was set to default, and punctuation table language was used. Replacing with language %@ and voice %@.", buf, 0x16u);
          }

          [v36 setObject:v24 forVariant:17];
          [v36 setObject:v22 forVariant:74];

          id v8 = v36;
        }
      }
    }
    else
    {
      id v16 = +[NSMutableString string];
      uint64_t v26 = (uint64_t)[v7 length];
      if (v26 >= 1)
      {
        uint64_t v27 = v26;
        uint64_t v28 = 0;
        do
        {
          BOOL v29 = (char *)[v7 rangeOfComposedCharacterSequenceAtIndex:v28];
          uint64_t v31 = v30;
          id v32 = objc_msgSend(v7, "substringWithRange:", v29, v30);
          if ([v16 length])
          {
            unsigned int v33 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
            unsigned __int8 v34 = objc_msgSend(v33, "characterIsMember:", objc_msgSend(v16, "characterAtIndex:", (char *)objc_msgSend(v16, "length") - 1));

            id v8 = v36;
            if ((v34 & 1) == 0) {
              [v16 appendString:@" "];
            }
          }
          [(VOTOutputSpeechComponent *)self _appendLiteralCharacterString:v32 toString:v16 hasPhoneContext:v11 hasMathContext:v13 action:v8 punctuationTableLanguageUsed:0];
          uint64_t v28 = &v29[v31];
        }
        while ((uint64_t)v28 < v27);
      }
    }
  }

  return v16;
}

- (void)_speakAsLiteralText:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 string];
  BOOL v6 = VOTLogSpeech();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10011D280();
  }

  id v7 = [(VOTOutputSpeechComponent *)self _stringForLiteralText:v5 action:v4 allowChangingLanguageForPunctuation:1];
  id v8 = VOTLogSpeech();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10011D218();
  }

  [v4 setString:v7];
}

- (void)_speakAsPhoneticText:(id)a3
{
  id v3 = a3;
  id v4 = VOTLogSpeech();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10011D2E8(v3);
  }
}

- (id)fileSystemPunctuationGroup
{
  fileSystemPunctuationGroup = self->_fileSystemPunctuationGroup;
  if (!fileSystemPunctuationGroup)
  {
    id v4 = (AXSSPunctuationGroup *)objc_opt_new();
    BOOL v5 = self->_fileSystemPunctuationGroup;
    self->_fileSystemPunctuationGroup = v4;

    [(AXSSPunctuationGroup *)self->_fileSystemPunctuationGroup setBasePunctuationUUID:AXSSVoiceOverPunctuationGroupAll];
    BOOL v6 = objc_opt_new();
    [v6 setRule:1];
    [v6 setPunctuation:@"."];
    [v6 setDynamicReplacement:&stru_1001B3D18];
    id v9 = v6;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [(AXSSPunctuationGroup *)self->_fileSystemPunctuationGroup setEntries:v7];

    fileSystemPunctuationGroup = self->_fileSystemPunctuationGroup;
  }

  return fileSystemPunctuationGroup;
}

- (id)punctuationReplacement:(id)a3 withGroup:(id)a4 baseTable:(id)a5 languageCode:(id)a6 selectedLanguage:(id)a7 spokenLanguage:(id)a8
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v40 = a8;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v15 = [a4 entries];
  id v16 = [v15 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v42;
    while (2)
    {
      for (uint64_t i = 0; i != v17; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v42 != v18) {
          objc_enumerationMutation(v15);
        }
        unsigned int v20 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v21 = [v20 punctuation];
        unsigned int v22 = [v21 isEqualToString:v12];

        if (v22)
        {
          id v23 = [v20 rule];
          if (v23 == (id)2)
          {
            uint64_t v26 = &stru_1001B7888;
            goto LABEL_31;
          }
          if (v23 == (id)1)
          {
            uint64_t v27 = [v20 replacement];
            if (v27) {
              uint64_t v26 = (__CFString *)v27;
            }
            else {
              uint64_t v26 = &stru_1001B7888;
            }
            goto LABEL_31;
          }
          if (!v23)
          {
            uint64_t v28 = (__CFString *)v12;
            goto LABEL_30;
          }
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  id v24 = [v12 characterAtIndex:0];
  id v15 = [v13 objectForIndex:v24];
  if ([v15 isEqualToString:v12])
  {
    int v25 = 0;
  }
  else if ([v15 length] == (id)1)
  {
    int v25 = sub_1000EC880((uint64_t)v24, (uint64_t)[v15 characterAtIndex:0]) ^ 1;
  }
  else
  {
    int v25 = 1;
  }
  if (![v15 length]) {
    goto LABEL_29;
  }
  int v29 = a7 ? 0 : v25;
  if (v14
    && v29
    && (AXCLanguageCanonicalFormToGeneralLanguage(),
        uint64_t v30 = objc_claimAutoreleasedReturnValue(),
        AXCLanguageCanonicalFormToGeneralLanguage(),
        uint64_t v31 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v32 = [v30 isEqualToString:v31],
        v31,
        v30,
        (v32 & 1) == 0))
  {
    punctuationFallbacks = self->_punctuationFallbacks;
    if (!punctuationFallbacks)
    {
      uint64_t v35 = +[NSMutableDictionary dictionary];
      id v36 = self->_punctuationFallbacks;
      self->_punctuationFallbacks = v35;

      punctuationFallbacks = self->_punctuationFallbacks;
    }
    CFStringRef v37 = [(NSMutableDictionary *)punctuationFallbacks objectForKeyedSubscript:v14];
    if (!v37)
    {
      CFStringRef v37 = +[NSMutableDictionary dictionary];
      [(NSMutableDictionary *)self->_punctuationFallbacks setObject:v37 forKeyedSubscript:v14];
    }
    uint64_t v26 = [v37 objectForKeyedSubscript:v12];
    if (!v26)
    {
      AXVOLocalizedStringForCharacter();
      uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v26) {
        uint64_t v26 = (__CFString *)AXCopyUnicodeDescriptionStringForCharacter();
      }
      [v37 setObject:v26 forKeyedSubscript:v12];
    }
  }
  else
  {
LABEL_29:
    uint64_t v28 = v15;
    id v15 = v28;
LABEL_30:
    uint64_t v26 = v28;
  }
LABEL_31:

  return v26;
}

- (id)baseTableForPunctuationGroup:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[AXSSPunctuationManager sharedDatabase];
  BOOL v6 = [v5 mostBasePunctuationGroupForGroup:v4];

  if ([v6 isEqual:AXSSVoiceOverPunctuationGroupAll])
  {
    uint64_t v7 = [(VOTOutputSpeechComponent *)self currentAllPunctuationTable];
LABEL_7:
    id v8 = (void *)v7;
    goto LABEL_8;
  }
  if ([v6 isEqual:AXSSVoiceOverPunctuationGroupSome])
  {
    uint64_t v7 = [(VOTOutputSpeechComponent *)self currentSomePunctuationTable];
    goto LABEL_7;
  }
  if ([v6 isEqual:AXSSVoiceOverPunctuationGroupNone])
  {
    uint64_t v7 = [(VOTOutputSpeechComponent *)self currentNonePunctuationTable];
    goto LABEL_7;
  }
  id v8 = 0;
LABEL_8:

  return v8;
}

- (id)_replacePunctuation:(id)a3 punctuationGroup:(id)a4 hasMathContext:(BOOL)a5 hasPhoneContext:(BOOL)a6 isText:(BOOL)a7 replaceCommas:(BOOL)a8 languageCode:(id)a9 speakPunctuationCounts:(BOOL)a10
{
  BOOL v132 = a6;
  BOOL v130 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a9;
  uint64_t v15 = (uint64_t)[v12 length];
  id v16 = [objc_allocWithZone((Class)NSMutableString) init];
  if (qword_1001EB838 != -1) {
    dispatch_once(&qword_1001EB838, &stru_1001B3D38);
  }
  v138 = v13;
  v137 = [(VOTOutputSpeechComponent *)self baseTableForPunctuationGroup:v13];
  id v17 = +[AXSSPunctuationManager sharedDatabase];
  uint64_t v18 = [v17 allPunctuationGroup];
  v136 = [(VOTOutputSpeechComponent *)self baseTableForPunctuationGroup:v18];

  v139 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v19 = [v12 isAXAttributedString];
  id v141 = v16;
  if (v19)
  {
    uint64_t v20 = +[NSMutableArray array];
  }
  else
  {
    uint64_t v20 = 0;
  }
  v140 = self;
  v145 = (void *)v20;
  id v21 = v14;
  unsigned int v22 = v21;
  if (!v21)
  {
    id v21 = [(id)VOTSharedWorkspace systemSpokenLanguage];
  }
  v133 = v21;
  v135 = [(id)VOTSharedWorkspace selectedLanguage];
  v134 = [(id)VOTSharedWorkspace systemSpokenLanguage];
  uint64_t v152 = 0;
  v144 = v22;
  if (v15 >= 1)
  {
    uint64_t v23 = 0;
    id v24 = &objc_release_x25_ptr;
    while (1)
    {
      if (v19)
      {
        while (1)
        {
          uint64_t v150 = 0;
          uint64_t v151 = 0;
          int v25 = [v12 attributesAtIndex:v23 effectiveRange:&v150];
          if (![v25 count]) {
            break;
          }
          uint64_t v26 = v24[351];
          id v27 = [v16 length];
          uint64_t v28 = objc_msgSend(v26, "valueWithRange:", v27, v151);
          id v29 = [v25 mutableCopy];
          [v29 setObject:v28 forKey:@"_VORangeValue"];
          [v145 addObject:v29];
          uint64_t v30 = objc_msgSend(v12, "substringWithRange:", v150, v151);
          [v16 appendString:v30];

          uint64_t v152 = v151 + v150;
          unsigned int v22 = v144;

          uint64_t v23 = v152;
          if (v152 >= v15) {
            goto LABEL_158;
          }
        }

        uint64_t v23 = v152;
      }
      id v31 = [v12 rangeOfComposedCharacterSequenceAtIndex:v23];
      unint64_t v33 = v32;
      v142 = objc_msgSend(v12, "substringWithRange:", v31, v32);
      if (v33 < 2) {
        break;
      }
      [v16 appendString:v142];
      v152 += v33;
LABEL_139:

      uint64_t v23 = v152;
      if (v152 >= v15) {
        goto LABEL_158;
      }
    }
    LOWORD(v150) = 0;
    id v34 = [v142 length];
    id v35 = 0;
    if (v34 == (id)1) {
      id v35 = [v142 characterAtIndex:0];
    }
    LOWORD(v150) = (_WORD)v35;
    if (v132)
    {
      id v36 = @"UnicodeHex.PhoneContext.";
    }
    else
    {
      if (!v130) {
        goto LABEL_27;
      }
      id v36 = @"UnicodeHex.Math.";
    }
    uint64_t v37 = sub_10005215C((uint64_t)v35, v36, @"VOTOutputPunctuation", v22);
    if (v37)
    {
      id v38 = v19;
      CFStringRef v39 = &stru_1001B7888;
      if (v152 > 0) {
        CFStringRef v39 = @" ";
      }
      id v40 = (void *)v37;
      [v16 appendFormat:@"%@%@ ", v39, v37];
      v152 += v33;
      goto LABEL_138;
    }
LABEL_27:
    id v121 = v31;
    id v41 = v19;
    if (v22)
    {
      long long v42 = +[AXLanguageManager sharedInstance];
      [v42 dialectForLanguageID:v22];
    }
    else
    {
      long long v42 = +[VOTOutputManager outputManager];
      [v42 currentLanguageMap];
    long long v43 = };

    v127 = v43;
    unsigned int v44 = sub_10005180C(v43, v22, v142);
    char v45 = v44;
    unint64_t v126 = v33;
    if (v44 && ([(id)qword_1001EB830 characterIsMember:(unsigned __int16)v150] & 1) != 0)
    {
      long long v46 = 0;
      v128 = 0;
      id v47 = v41;
    }
    else
    {
      long long v46 = [(VOTOutputSpeechComponent *)v140 punctuationReplacement:v142 withGroup:v138 baseTable:v137 languageCode:v22 selectedLanguage:v135 spokenLanguage:v134];
      v128 = [(VOTOutputSpeechComponent *)v140 punctuationReplacement:v142 withGroup:0 baseTable:v136 languageCode:v22 selectedLanguage:v135 spokenLanguage:v134];
      if (v45)
      {
        id v47 = v41;
      }
      else
      {
        id v47 = v41;
        if (-[__CFString isEqualToString:](v46, "isEqualToString:", v142) && [v128 length])
        {
          id v48 = [(VOTOutputSpeechComponent *)v140 currentAllPunctuationTable];
          uint64_t v49 = [v48 objectForIndex:(unsigned __int16)v150];

          long long v46 = (__CFString *)v49;
        }
      }
    }
    if (!a8 && (unsigned __int16)v150 == 44)
    {
      id v38 = v47;
      char v50 = objc_msgSend(v12, "substringWithRange:", v152, 1);
      [v16 appendString:v50];

      unsigned int v22 = v144;
      v152 += v33;
LABEL_137:

      id v40 = v127;
      id v24 = &objc_release_x25_ptr;
LABEL_138:

      id v19 = v38;
      goto LABEL_139;
    }
    id v51 = [(__CFString *)v46 length];
    int v52 = (unsigned __int16)v150;
    if (v51 && (unsigned __int16)v150 != 45)
    {
LABEL_84:
      if (v52 != 35)
      {
LABEL_97:
        if (v52 == 186)
        {
          id v82 = [v12 length];
          if ((unint64_t)v82 > v152 + 1)
          {
            unsigned int v83 = objc_msgSend(v12, "characterAtIndex:") - 67;
            if (v83 <= 8 && ((1 << v83) & 0x109) != 0)
            {

              long long v46 = @"°";
LABEL_103:
              if (![(__CFString *)v46 isEqualToString:v142])
              {
                int v86 = 1;
                goto LABEL_110;
              }
LABEL_104:
              long long v84 = sub_1000346E0((unsigned __int16)v150);
              if (v84 && ([v12 rangeOfComposedCharacterSequenceAtIndex:v152], v85 == 1))
              {
                v124 = v84;

                int v86 = 0;
                long long v46 = v124;
              }
              else
              {
                int v86 = 1;
              }

LABEL_110:
              if (!a7 && (unsigned __int16)v150 == 10)
              {
                v87 = v47;
                v88 = v46;
                long long v46 = 0;
LABEL_113:

                NSRange v89 = v46;
                goto LABEL_121;
              }
              v87 = v47;
              if (v46)
              {
                NSRange v90 = [(NSDictionary *)v140->_languageExceptions objectForKey:v133];
                id v91 = [v90 count];

                if (v91)
                {
                  id v92 = [(NSDictionary *)v140->_languageExceptions objectForKey:v133];
                  v93 = +[NSString stringWithCharacters:&v150 length:1];
                  v88 = [v92 objectForKey:v93];

                  if (v88)
                  {
                    v88 = v88;

                    int v86 = 0;
                    long long v46 = v88;
                  }
                  id v16 = v141;
                  unsigned int v22 = v144;
                  goto LABEL_113;
                }
                id v16 = v141;
                unsigned int v22 = v144;
                NSRange v89 = v46;
              }
              else
              {
                NSRange v89 = 0;
              }
LABEL_121:
              if ([(VOTOutputSpeechComponent *)v140 _replaceRepeatedPuntuationAndEmoji:qword_1001EB828 newString:v12 charReplacementString:v16 charSequence:v142 charIndex:&v152 speakPunctuationCounts:a10 languageCode:v22])
              {
                long long v46 = v89;
                id v38 = v87;
                goto LABEL_137;
              }
              uint64_t v94 = [(AXIndexMap *)v140->_noneTableOverrides objectForIndex:(unsigned __int16)v150];
              v95 = [(AXIndexMap *)v140->_specialPunctionTable objectForIndex:(unsigned __int16)v150];
              if (v95)
              {

                goto LABEL_125;
              }
              if (v94 && ([v94 isEqual:v89] & 1) != 0)
              {
LABEL_125:
                id v96 = v87;
                if (v89)
                {
LABEL_126:
                  BOOL v97 = v94;
                  long long v46 = v89;
                  [v16 appendString:v89];
                  unint64_t v98 = v126;
LABEL_136:
                  id v38 = v96;
                  v152 += v98;

                  goto LABEL_137;
                }
                goto LABEL_134;
              }
              id v96 = v87;
              if (!v89)
              {
LABEL_134:
                BOOL v97 = v94;
                long long v46 = v89;
                unint64_t v98 = v126;
                BOOL v101 = objc_msgSend(v12, "substringWithRange:", v121, v126);
                [v16 appendString:v101];

LABEL_135:
                unsigned int v22 = v144;
                goto LABEL_136;
              }
              if (!v86) {
                goto LABEL_126;
              }
              unint64_t v98 = v126;
              if (![(__CFString *)v89 length])
              {
                BOOL v97 = v94;
                long long v46 = v89;
                [v16 appendString:@" "];
                goto LABEL_136;
              }
              v99 = +[NSCharacterSet whitespaceCharacterSet];
              unsigned int v100 = [(__CFString *)v89 isEqualToString:v142];
              if ([(__CFString *)v89 length] == (id)1) {
                unsigned __int8 v122 = objc_msgSend(v99, "characterIsMember:", -[__CFString characterAtIndex:](v89, "characterAtIndex:", 0));
              }
              else {
                unsigned __int8 v122 = 0;
              }
              v125 = v99;
              if ([v16 length]) {
                char v102 = v100;
              }
              else {
                char v102 = 1;
              }
              if ((v102 & 1) == 0)
              {
                unsigned int v103 = v94;
                id v104 = v89;
                v105 = objc_msgSend(v16, "substringFromIndex:", (char *)objc_msgSend(v16, "length") - 1);
                if ([v105 length] == (id)1
                  && (objc_msgSend(v125, "characterIsMember:", objc_msgSend(v105, "characterAtIndex:", 0)) & 1) == 0)
                {
                  [v16 appendString:@" "];
                }

                NSRange v89 = v104;
                uint64_t v94 = v103;
              }
              if (v122)
              {
                BOOL v97 = v94;
                if (!v100) {
                  goto LABEL_157;
                }
              }
              else
              {
                BOOL v97 = v94;
                [v16 appendString:v89];
                if (v100)
                {
LABEL_157:
                  long long v46 = v89;

                  goto LABEL_135;
                }
              }
              [v16 appendString:@" "];
              goto LABEL_157;
            }
          }
        }
LABEL_102:
        if (!v46) {
          goto LABEL_104;
        }
        goto LABEL_103;
      }
      unint64_t v69 = v152 + 1;
      if (v69 < (unint64_t)[v12 length])
      {
        id v70 = v46;
        id v71 = +[NSCharacterSet letterCharacterSet];
        id v72 = [v12 rangeOfComposedCharacterSequenceAtIndex:v152 + 1];
        if (v72 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          id v74 = v72;
          uint64_t v75 = v73;
          if ((objc_msgSend(v71, "characterIsMember:", objc_msgSend(v12, "characterAtIndex:", v72)) & 1) != 0
            || (objc_msgSend(v12, "substringWithRange:", v74, v75),
                long long v76 = objc_claimAutoreleasedReturnValue(),
                char v77 = TTSisSpeakableEmojiString(),
                v76,
                (v77 & 1) != 0))
          {
            uint64_t v78 = sub_10005215C((unsigned __int16)v150, @"UnicodeHex.Alternate1.", @"VOTOutputPunctuation", v22);

            id v16 = v141;
            goto LABEL_94;
          }
        }

        long long v46 = v70;
      }
      unint64_t v79 = v152 + 1;
      if (v79 >= (unint64_t)[v12 length])
      {
        id v16 = v141;
        goto LABEL_96;
      }
      unsigned int v80 = +[NSCharacterSet decimalDigitCharacterSet];
      unsigned int v81 = objc_msgSend(v80, "characterIsMember:", objc_msgSend(v12, "characterAtIndex:", v152 + 1));

      id v16 = v141;
      if (!v81)
      {
LABEL_96:
        int v52 = (unsigned __int16)v150;
        goto LABEL_97;
      }
      uint64_t v78 = sub_10005215C((unsigned __int16)v150, @"UnicodeHex.Alternate2.", @"VOTOutputPunctuation", v22);
      id v71 = v46;
LABEL_94:

      long long v46 = (__CFString *)v78;
      goto LABEL_96;
    }
    if (![(id)qword_1001EB828 characterIsMember:(unsigned __int16)v150])
    {
LABEL_83:
      int v52 = (unsigned __int16)v150;
      goto LABEL_84;
    }
    if (v138)
    {
      BOOL v53 = [v138 basePunctuationUUID];
      if ([v53 isEqual:AXSSVoiceOverPunctuationGroupSome])
      {
        int v54 = (unsigned __int16)v150;
        if ((unsigned __int16)v150 != 44)
        {

          BOOL v55 = v54 == 38;
          id v16 = v141;
          if (v55) {
            goto LABEL_83;
          }
          goto LABEL_52;
        }
        id v16 = v141;
      }
LABEL_80:

      goto LABEL_83;
    }
    if ((unsigned __int16)v150 == 38 || (unsigned __int16)v150 == 44) {
      goto LABEL_102;
    }
LABEL_52:
    id v56 = v47;
    unsigned int v57 = v12;
    uint64_t v58 = (uint64_t)[v12 length];
    uint64_t v59 = v152;
    unint64_t v60 = v152 - 1;
    if (v152 < 1)
    {
      char v123 = 0;
    }
    else
    {
      if (v60 >= 2) {
        uint64_t v61 = 2;
      }
      else {
        uint64_t v61 = v152 - 1;
      }
      do
      {
        unsigned int v62 = objc_msgSend(v139, "characterIsMember:", objc_msgSend(v57, "characterAtIndex:", v60));
        BOOL v64 = v61-- != 0;
        if (!v62) {
          break;
        }
        --v60;
      }
      while (v64);
      char v123 = v62 ^ 1;
      uint64_t v59 = v152;
    }
    if (v59 + 1 < v58)
    {
      unint64_t v65 = 0;
      while (1)
      {
        unint64_t v66 = v59 + v65;
        if ((objc_msgSend(v139, "characterIsMember:", objc_msgSend(v57, "characterAtIndex:", v59 + v65 + 1)) & 1) == 0&& (v66 != v152 || objc_msgSend(v57, "characterAtIndex:", v59 + v65 + 1) != 44))
        {
          break;
        }
        if (v65 <= 1)
        {
          ++v65;
          if ((uint64_t)(v66 + 2) < v58) {
            continue;
          }
        }
        goto LABEL_71;
      }
      id v12 = v57;
      id v16 = v141;
      unsigned int v22 = v144;
      goto LABEL_82;
    }
LABEL_71:
    if ((unsigned __int16)v150 != 46 || v58 <= 2) {
      char v68 = v123;
    }
    else {
      char v68 = 1;
    }
    id v16 = v141;
    unsigned int v22 = v144;
    if (v68)
    {
      id v12 = v57;
LABEL_82:
      id v47 = v56;
      goto LABEL_83;
    }
    BOOL v53 = v46;
    long long v46 = v128;
    id v12 = v57;
    id v47 = v56;
    goto LABEL_80;
  }
LABEL_158:
  [(VOTOutputSpeechComponent *)v140 _replaceRepeatedEmoji:v16];
  long long v106 = v145;
  if (v145)
  {
    id v143 = v12;
    long long v107 = +[AXAttributedString axAttributedStringWithString:v16];
    long long v146 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    id v108 = v145;
    id v109 = [v108 countByEnumeratingWithState:&v146 objects:v153 count:16];
    if (v109)
    {
      id v110 = v109;
      uint64_t v111 = *(void *)v147;
      do
      {
        for (uint64_t i = 0; i != v110; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v147 != v111) {
            objc_enumerationMutation(v108);
          }
          long long v113 = *(void **)(*((void *)&v146 + 1) + 8 * i);
          id v114 = [v113 objectForKey:@"_VORangeValue"];
          id v115 = [v114 rangeValue];
          uint64_t v117 = v116;

          objc_msgSend(v107, "setAttributes:withRange:", v113, v115, v117);
        }
        id v110 = [v108 countByEnumeratingWithState:&v146 objects:v153 count:16];
      }
      while (v110);
    }

    id v118 = v107;
    id v16 = v141;
    id v12 = v143;
    __int16 v119 = v138;
    unsigned int v22 = v144;
    long long v106 = v145;
  }
  else
  {
    id v118 = v16;
    __int16 v119 = v138;
  }

  return v118;
}

- (void)_replaceRepeatedEmoji:(id)a3
{
  id v3 = a3;
  [v3 length];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3010000000;
  v16[4] = 0;
  v16[5] = 0;
  v16[3] = &unk_100168CC9;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000364AC;
  v9[3] = &unk_1001B3D60;
  id v11 = v15;
  id v12 = v14;
  id v13 = v16;
  id v4 = v3;
  id v10 = v4;
  BOOL v5 = objc_retainBlock(v9);
  id v6 = [v4 copy];
  uint64_t v7 = v5;
  CEMEnumerateEmojiTokensInStringWithBlock();
  ((void (*)(void *, uint64_t))v7[2])(v7, v18[3]);
  id v8 = (const void *)v18[3];
  if (v8)
  {
    CFRelease(v8);
    v18[3] = 0;
  }

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v17, 8);
}

- (BOOL)_replaceRepeatedPuntuationAndEmoji:(id)a3 newString:(id)a4 charReplacementString:(id)a5 charSequence:(id)a6 charIndex:(int64_t *)a7 speakPunctuationCounts:(BOOL)a8 languageCode:(id)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  id v38 = self;
  if ([v18 length] == (id)1) {
    id v20 = [v18 characterAtIndex:0];
  }
  else {
    id v20 = 0;
  }
  id v21 = (char *)[v16 length];
  if (![v15 characterIsMember:v20]) {
    goto LABEL_15;
  }
  id v39 = v19;
  int64_t v22 = *a7;
  if (*a7 + 1 >= (uint64_t)v21)
  {
    unsigned int v26 = 1;
  }
  else
  {
    uint64_t v23 = a7;
    unsigned int v36 = v21 - v22;
    id v24 = &v21[-v22];
    uint64_t v25 = 1;
    while ([v16 characterAtIndex:v22 + v25] == v20)
    {
      if (v24 == (char *)++v25)
      {
        a7 = v23;
        id v19 = v39;
        unsigned int v26 = v36;
        goto LABEL_13;
      }
    }
    a7 = v23;
    unsigned int v26 = v25;
  }
  id v19 = v39;
LABEL_13:
  if (v26 > 2 || v9)
  {
    if (v26 != 3
      || v20 != 46
      || (sub_10005215C(8230, @"UnicodeHex.", @"VOTOutputPunctuation", v19),
          (uint64_t v28 = objc_claimAutoreleasedReturnValue()) == 0)
      && (+[NSString stringWithUnichar:8230],
          (uint64_t v28 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v28 = sub_100052260((uint64_t)v20, @"UnicodeHex.", @"VOTOutputPunctuation", v19, v26);
      if (!v28)
      {
        id v29 = [(VOTOutputSpeechComponent *)v38 currentAllPunctuationTable];
        uint64_t v30 = [v29 objectForIndex:v20];

        if (!v30)
        {
          id v31 = objc_msgSend(v16, "substringWithRange:", *a7, 1);
          uint64_t v30 = +[NSString stringWithFormat:@"%@", v31];
        }
        uint64_t v37 = sub_100051804(off_1001EA9E8, @"repeat.filter", 0);
        unint64_t v32 = +[NSNumber numberWithInteger:v26];
        AXFormatNumber();
        v34 = unint64_t v33 = (void *)v30;
        uint64_t v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v37, v34, v33);
      }
    }
    [v17 appendString:@", "];
    [v17 appendString:v28];
    id v19 = v39;
    [v17 appendString:@", "];
    *a7 += v26;

    BOOL v27 = 1;
  }
  else
  {
LABEL_15:
    BOOL v27 = 0;
  }

  return v27;
}

- (id)_parseNumberInString:(id)a3 beforeCharacterAtIndex:(int64_t)a4 numberRange:(_NSRange *)a5
{
  id v6 = a3;
  id v7 = [v6 length];
  id v8 = +[NSMutableCharacterSet decimalDigitCharacterSet];
  BOOL v9 = +[NSCharacterSet whitespaceCharacterSet];
  [v8 addCharactersInString:@"-.."];
  id v10 = +[NSMutableString string];
  int64_t v11 = a4;
  do
  {
    uint64_t v12 = v11;
    BOOL v13 = v11-- < 1;
  }
  while (!v13
       && (uint64_t)v7 >= a4
       && (objc_msgSend(v9, "characterIsMember:", objc_msgSend(v6, "characterAtIndex:", v11)) & 1) != 0);
  if (v12 < 1 || v12 > (uint64_t)v7)
  {
    uint64_t v14 = v12 - 1;
  }
  else
  {
    uint64_t v14 = v12 - 1;
    do
    {
      if (!objc_msgSend(v8, "characterIsMember:", objc_msgSend(v6, "characterAtIndex:", v14))) {
        break;
      }
      id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C", [v6 characterAtIndex:v14]);
      [v10 insertString:v15 atIndex:0];

      BOOL v13 = v14-- < 1;
      if (v13) {
        break;
      }
    }
    while (v12 - 1 <= (uint64_t)v7);
  }
  a5->NSUInteger location = v14 + 1;
  a5->NSUInteger length = a4 - (v14 + 1);
  if ([v10 length])
  {
    objc_msgSend(v10, "replaceOccurrencesOfString:withString:options:range:", @".", @".", 0, 0, objc_msgSend(v10, "length"));
    id v16 = objc_alloc_init((Class)NSNumberFormatter);
    id v17 = [v16 numberFromString:v10];
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (id)replacePunctuation:(id)a3 punctuationGroup:(id)a4 replaceCommas:(BOOL)a5 languageCode:(id)a6
{
  LOBYTE(v7) = 0;
  return [(VOTOutputSpeechComponent *)self _replacePunctuation:a3 punctuationGroup:a4 hasMathContext:0 hasPhoneContext:0 isText:0 replaceCommas:a5 languageCode:a6 speakPunctuationCounts:v7];
}

- (id)_determineVoiceSelection:(id)a3 languageCode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  unsigned int v26 = sub_10002D13C;
  BOOL v27 = sub_10002D14C;
  id v28 = 0;
  id v8 = [(id)VOTSharedWorkspace votSettings];
  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  id v19 = sub_100036F04;
  id v20 = &unk_1001B3B68;
  int64_t v22 = &v23;
  BOOL v9 = v7;
  id v21 = v9;
  [v8 voiceSelectionForAction:v5 languageCode:v6 completionHandler:&v17];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = objc_msgSend((id)v24[5], "voiceId", v17, v18, v19, v20);
  int64_t v11 = +[TTSSpeechSynthesizer voiceForIdentifier:v10];
  uint64_t v12 = [v11 language];

  [v5 setObject:v24[5] forVariant:89];
  [v5 setObject:v12 forVariant:17];
  [v5 setObject:v10 forVariant:74];
  if ([(id)VOTSharedWorkspace inUnitTestMode])
  {
    BOOL v13 = [(id)VOTSharedWorkspace unitTestSpeechRate];

    if (v13)
    {
      uint64_t v14 = [(id)VOTSharedWorkspace unitTestSpeechRate];
      [v5 setObject:v14 forVariant:39];
    }
  }
  id v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);

  return v15;
}

- (id)_determineVoiceIdentifier:(id)a3 languageCode:(id)a4
{
  id v4 = [(VOTOutputSpeechComponent *)self _determineVoiceSelection:a3 languageCode:a4];
  id v5 = [v4 voiceId];

  return v5;
}

- (id)_determineSpeechSourceForAction:(id)a3
{
  id v3 = [(VOTOutputComponent *)self determineActivityForAction:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 uuid];
    id v6 = +[NSString stringWithFormat:@"VOActivity_%@", v5];
  }
  else
  {
    id v6 = AXSpeechSourceKeyVoiceOver;
  }

  return v6;
}

- (id)_determinePunctuationGroupForAction:(id)a3 isDefault:(BOOL *)a4
{
  id v6 = a3;
  dispatch_semaphore_t v7 = (void *)VOTSharedWorkspace;
  id v8 = +[AXSettings sharedInstance];
  BOOL v9 = [v8 voiceOverPunctuationGroup];
  id v10 = [v7 punctuationGroupForUUID:v9];

  int64_t v11 = [(VOTOutputComponent *)self determineActivityForAction:v6];
  uint64_t v12 = v11;
  if (v11)
  {
    BOOL v13 = [v11 punctuationGroup];

    if (v13)
    {
      uint64_t v14 = (void *)VOTSharedWorkspace;
      id v15 = [v12 punctuationGroup];
      uint64_t v16 = [v14 punctuationGroupForUUID:v15];

      id v10 = (void *)v16;
    }
  }
  if (!v10)
  {
    id v10 = [v6 objectForVariant:30];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v10) {
        goto LABEL_5;
      }
    }
    else
    {
    }
    uint64_t v18 = [v6 objectForVariant:79];
    if ([v18 isEqualToString:AXSSVoiceOverTextualContextFileSystem])
    {
      id v10 = [(VOTOutputSpeechComponent *)self fileSystemPunctuationGroup];

      if (v10) {
        goto LABEL_5;
      }
    }
    else
    {
    }
    id v10 = [(id)VOTSharedWorkspace defaultPunctuationGroup];
    if (a4) {
      *a4 = 1;
    }
  }
LABEL_5:

  return v10;
}

- (id)_urlRangesInString:(id)a3 languageCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableArray array];
  BOOL v9 = (void *)qword_1001EB840;
  if (!qword_1001EB840)
  {
    uint64_t v10 = +[NSRegularExpression regularExpressionWithPattern:@"(http:\\/\\/|www\\.)?(\\S*)\\.(com|net|org|edu|gov|mil|uk|fi)(\\/\\S*)?\\b" options:1 error:0];
    int64_t v11 = (void *)qword_1001EB840;
    qword_1001EB840 = v10;

    BOOL v9 = (void *)qword_1001EB840;
  }
  uint64_t v12 = objc_msgSend(v9, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  if ([v12 count])
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v14)
    {
      id v15 = v14;
      id v16 = v7;
      uint64_t v17 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v37 != v17) {
            objc_enumerationMutation(v13);
          }
          id v19 = [*(id *)(*((void *)&v36 + 1) + 8 * i) range];
          id v21 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v19, v20);
          [v8 addObject:v21];
        }
        id v15 = [v13 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v15);
      id v7 = v16;
    }
  }
  else
  {
    id v13 = [(VOTOutputSpeechComponent *)self _localeSpecificURLRegexForLanguageCode:v7];
    if (v13)
    {
      id v31 = v7;
      int64_t v22 = objc_msgSend(v13, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v23 = [v22 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v33;
        do
        {
          for (j = 0; j != v24; j = (char *)j + 1)
          {
            if (*(void *)v33 != v25) {
              objc_enumerationMutation(v22);
            }
            id v27 = [*(id *)(*((void *)&v32 + 1) + 8 * (void)j) range];
            id v29 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v27, v28);
            [v8 addObject:v29];
          }
          id v24 = [v22 countByEnumeratingWithState:&v32 objects:v40 count:16];
        }
        while (v24);
      }

      id v7 = v31;
    }
  }

  return v8;
}

- (void)_replacePunctuation:(id)a3 withAction:(id)a4 languageCode:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t v11 = [v9 objectForVariant:55];
  unsigned int v36 = [v11 BOOLValue];

  uint64_t v12 = [v9 objectForVariant:56];
  unsigned int v35 = [v12 BOOLValue];

  id v13 = [v9 objectForVariant:50];
  unsigned int v34 = [v13 BOOLValue];

  id v14 = [v9 objectForVariant:65];
  unsigned __int8 v33 = [v14 BOOLValue];

  id v31 = v9;
  uint64_t v30 = [(VOTOutputSpeechComponent *)self _determinePunctuationGroupForAction:v9 isDefault:0];
  long long v37 = v10;
  [(VOTOutputSpeechComponent *)self _urlRangesInString:v8 languageCode:v10];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v15 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v15)
  {
    id v16 = v15;
    int64_t v17 = 0;
    uint64_t v18 = *(void *)v39;
    do
    {
      id v19 = 0;
      do
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = (char *)[*(id *)(*((void *)&v38 + 1) + 8 * (void)v19) rangeValue];
        uint64_t v22 = v21;
        id v23 = &v20[v17];
        id v24 = objc_msgSend(v8, "substringWithRange:", &v20[v17], v21);
        uint64_t v25 = [(VOTOutputSpeechComponent *)self fileSystemPunctuationGroup];
        LOBYTE(v29) = v33;
        unsigned int v26 = [(VOTOutputSpeechComponent *)self _replacePunctuation:v24 punctuationGroup:v25 hasMathContext:v35 hasPhoneContext:v36 isText:v34 replaceCommas:1 languageCode:v37 speakPunctuationCounts:v29];

        objc_msgSend(v8, "replaceCharactersInRange:withString:", v23, v22, v26);
        id v27 = [v26 length];
        int64_t v17 = v27 - (unsigned char *)[v24 length];

        id v19 = (char *)v19 + 1;
      }
      while (v16 != v19);
      id v16 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v16);
  }
  LOBYTE(v29) = v33;
  uint64_t v28 = -[VOTOutputSpeechComponent _replacePunctuation:punctuationGroup:hasMathContext:hasPhoneContext:isText:replaceCommas:languageCode:speakPunctuationCounts:](self, "_replacePunctuation:punctuationGroup:hasMathContext:hasPhoneContext:isText:replaceCommas:languageCode:speakPunctuationCounts:", v8, v30, v35, v36, v34, [v30 isAllPunctuationGroup], v37, v29);
  [v8 setString:v28];
}

- (void)_removeRunsOfNewLines:(id)a3
{
  id v14 = a3;
  if ([v14 rangeOfString:@"\n\n\n"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v3 = (uint64_t)[v14 length];
    id v4 = objc_alloc_init((Class)NSMutableString);
    id v5 = v14;
    if (v3 >= 1)
    {
      for (uint64_t i = 0; i < v3; ++i)
      {
        if ([v5 characterAtIndex:i] == 10)
        {
          unint64_t v7 = 0;
          do
          {
            unint64_t v8 = v7;
            uint64_t v9 = i + v7 + 1;
            if (v9 >= v3)
            {
              if (v7 + 1 <= 1) {
                CFStringRef v13 = @"\n";
              }
              else {
                CFStringRef v13 = @"\n\n";
              }
              [v4 appendString:v13];
              i += v7 + 1;
              goto LABEL_19;
            }
            unsigned int v10 = [v14 characterAtIndex:i + v7++ + 1];
          }
          while (v10 == 10);
          if (v7 <= 1) {
            CFStringRef v11 = @"\n";
          }
          else {
            CFStringRef v11 = @"\n\n";
          }
          [v4 appendString:v11];
          if (v9 < v3)
          {
            i += v7;
            goto LABEL_13;
          }
          i += v8 + 1;
        }
        else
        {
LABEL_13:
          uint64_t v12 = objc_msgSend(v14, "substringWithRange:", i, 1);
          [v4 appendFormat:@"%@", v12];
        }
LABEL_19:
        id v5 = v14;
      }
    }
    [v5 setString:v4];
  }
}

- (void)_replaceEmoticonsWithText:(id)a3
{
  id v4 = a3;
  id v5 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  emoticonReplacements = self->_emoticonReplacements;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100037A10;
  v9[3] = &unk_1001B3DB0;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  [(NSDictionary *)emoticonReplacements enumerateKeysAndObjectsUsingBlock:v9];
}

- (void)_processEmoji:(id)a3 action:(id)a4 rate:(float)a5
{
  id v8 = a3;
  id v9 = a4;
  id v21 = v8;
  id v10 = [v9 objectForVariant:17];
  id v11 = [v9 objectForVariant:74];
  uint64_t v12 = [v9 objectForVariant:58];
  unsigned int v13 = [v12 BOOLValue];

  if (v13)
  {
    id v14 = 0;
  }
  else
  {
    id v15 = +[AXSettings sharedInstance];
    id v14 = [v15 voiceOverVerbosityEmojiSuffixEnabled];
  }
  id v16 = [v9 objectForVariant:80];
  unsigned int v17 = [v16 BOOLValue] | v13;

  if (v17 == 1)
  {
    *(float *)&double v18 = a5;
    id v19 = [(VOTOutputSpeechComponent *)self pauseStringForType:6 voiceIdentifier:v11 rate:v18];
    uint64_t v20 = +[TTSEmojiUtilities stringByReplacingEmojiCharactersWithEmojiDescriptions:v21 stringForPauses:v19 language:v10 rangeReplacements:0 appendEmojiSuffix:v14];
  }
  else
  {
    uint64_t v20 = +[TTSEmojiUtilities stringByRemovingEmojiCharacters:v21];
  }
  if (([v21 isEqualToString:v20] & 1) == 0)
  {
    [v9 removeObjectForVariant:28];
    [v21 setString:v20];
  }
}

- (BOOL)_makeSubstitution:(id)a3 withString:(id)a4 punctuationGroup:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v32 = a5;
  unsigned int v9 = [v7 isReplacementTextAllPunctuation];
  id v10 = [v7 phonemes];
  if ([v10 length])
  {
  }
  else
  {
    id v11 = [v7 replacementString];
    id v12 = [v11 length];

    if (!v12) {
      goto LABEL_11;
    }
  }
  uint64_t v30 = [(VOTOutputSpeechComponent *)self baseTableForPunctuationGroup:v32];
  uint64_t v29 = [(id)VOTSharedWorkspace selectedLanguage];
  uint64_t v28 = [(id)VOTSharedWorkspace systemSpokenLanguage];
  unsigned int v13 = (char *)[v8 length];
  id v14 = 0;
  id v15 = v13;
  do
  {
    id v16 = [v7 originalString];
    unsigned int v17 = (char *)objc_msgSend(v8, "rangeOfString:options:range:", v16, objc_msgSend(v7, "ignoreCase"), v14, v15);
    uint64_t v19 = v18;

    if (!v19) {
      break;
    }
    if (v9)
    {
      uint64_t v20 = [v7 replacementString];
      id v21 = [v20 length];

      if (v21 == (id)1)
      {
        __int16 v33 = 0;
        uint64_t v22 = [v7 replacementString];
        [v22 getCharacters:&v33];

        id v23 = [v7 replacementString];
        id v24 = [v7 languages];
        uint64_t v25 = [v24 anyObject];
        unsigned int v26 = [(VOTOutputSpeechComponent *)self punctuationReplacement:v23 withGroup:v32 baseTable:v30 languageCode:v25 selectedLanguage:v29 spokenLanguage:v28];
      }
    }
    id v14 = &v17[v19];
    id v15 = (char *)(v13 - v14);
  }
  while (v17 != (char *)0x7FFFFFFFFFFFFFFFLL);

LABEL_11:
  return 0;
}

- (void)_replaceUserSubstitutions:(id)a3 action:(id)a4
{
  id v21 = a3;
  id v20 = a4;
  id v6 = [v20 objectForVariant:70];
  unsigned __int8 v7 = [v6 BOOLValue];

  if ((v7 & 1) == 0)
  {
    id v8 = [v20 objectForVariant:30];
    unsigned int v9 = [v20 objectForVariant:43];
    if (!v8)
    {
      id v10 = (void *)VOTSharedWorkspace;
      id v11 = +[AXSettings sharedInstance];
      id v12 = [v11 voiceOverPunctuationGroup];
      id v8 = [v10 punctuationGroupForUUID:v12];
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    unsigned int v13 = self->_userSubstitutions;
    id v14 = [(NSArray *)v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v13);
          }
          unsigned int v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v17 appliesToAllApps])
          {
            uint64_t v18 = [v17 bundleIdentifiers];
            unsigned int v19 = [v18 containsObject:v9];

            if (v19) {
              [(VOTOutputSpeechComponent *)self _makeSubstitution:v17 withString:v21 punctuationGroup:v8];
            }
          }
        }
        id v14 = [(NSArray *)v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v14);
    }
  }
}

- (float)_determineVolume:(id)a3
{
  uint64_t v3 = [(VOTOutputComponent *)self determineActivityForAction:a3];
  id v4 = [v3 volume];

  if (v4)
  {
    id v5 = [v3 volume];
    [v5 floatValue];
    float v7 = v6;
  }
  else
  {
    float v7 = 3.4028e38;
  }

  return v7;
}

- (id)_stringForNormalText:(id)a3 action:(id)a4 allowPausingAtBoundaries:(BOOL)a5 ignoreLeadingCommas:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v100 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = [v10 objectForVariant:74];
  id v12 = [v10 objectForVariant:89];
  unsigned int v13 = [v12 rate];
  id v14 = v13;
  if (v13)
  {
    uint64_t v15 = v13;
  }
  else
  {
    uint64_t v16 = [v10 objectForVariant:39];
    unsigned int v17 = (void *)v16;
    uint64_t v18 = &off_1001C4F18;
    if (v16) {
      uint64_t v18 = (_UNKNOWN **)v16;
    }
    uint64_t v15 = v18;
  }
  id v97 = v15;
  [v15 floatValue];
  float v20 = v19;
  if ([v9 length])
  {
    id v21 = VOTLogSpeech();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_10011D4BC();
    }

    long long v22 = (__CFString *)[v9 mutableCopy];
    v99 = v9;
    long long v23 = [v10 objectForVariant:45];
    unsigned int v98 = [v23 BOOLValue];

    long long v24 = [v10 objectForVariant:49];
    unsigned int v91 = [v24 BOOLValue];

    long long v25 = [v10 objectForVariant:46];
    unsigned int v90 = [v25 BOOLValue];

    unsigned int v26 = [v10 objectForVariant:48];
    unsigned int v94 = [v26 BOOLValue];

    id v27 = [v10 objectForVariant:47];
    unsigned int v93 = [v27 BOOLValue];

    uint64_t v28 = [v10 objectForVariant:60];
    unsigned int v92 = [v28 BOOLValue];

    uint64_t v29 = [v10 objectForVariant:44];
    unsigned int v30 = [v29 BOOLValue];

    id v31 = [v10 objectForVariant:50];
    unsigned __int8 v96 = [v31 BOOLValue];

    id v32 = [v10 objectForVariant:59];
    if ([v32 BOOLValue])
    {
      unsigned int v95 = 1;
    }
    else
    {
      char v50 = [v10 objectForVariant:27];
      unsigned int v95 = [v50 BOOLValue];
    }
    id v51 = [v10 objectForVariant:31];
    unsigned int v52 = [v51 BOOLValue];

    BOOL v53 = [v10 objectForVariant:76];
    unsigned __int8 v54 = [v53 BOOLValue];

    id v56 = [v10 objectForVariant:17];
    if ((v6 | v30) == 1)
    {
      id v55 = [(__CFString *)v22 rangeOfString:@","];
      if (!v55) {
        -[__CFString replaceCharactersInRange:withString:](v22, "replaceCharactersInRange:withString:", 0, v57, &stru_1001B7888);
      }
    }
    objc_msgSend(v10, "outputVariants", v55);
    uint64_t v58 = (AXIndexMap *)objc_claimAutoreleasedReturnValue();
    currentActionVariants = self->_currentActionVariants;
    self->_currentActionVariants = v58;

    unint64_t v60 = [v10 objectForVariant:51];
    unsigned int v61 = [v60 BOOLValue];

    if (v61)
    {
      uint64_t v62 = [(VOTOutputSpeechComponent *)self _secureTextDescription:v99];

      v99 = (void *)v62;
      -[__CFString replaceCharactersInRange:withString:](v22, "replaceCharactersInRange:withString:", 0, [(__CFString *)v22 length], v62);
    }
    if (v52) {
      [(VOTOutputSpeechComponent *)self _speakAllDigits:v22];
    }
    [(VOTOutputSpeechComponent *)self _replaceUserSubstitutions:v22 action:v10];
    [(VOTOutputSpeechComponent *)self _replaceEmoticonsWithText:v22];
    if ((v54 & 1) == 0) {
      [(VOTOutputSpeechComponent *)self _replacePunctuation:v22 withAction:v10 languageCode:v56];
    }
    [(VOTOutputSpeechComponent *)self _formatNumbers:v22 action:v10];
    [(VOTOutputSpeechComponent *)self _formatUSHeight:v22 voiceIdentifier:v11];
    *(float *)&double v63 = v20;
    [(VOTOutputSpeechComponent *)self _formatIPAddress:v22 voiceIdentifier:v11 rate:v63];
    *(float *)&double v64 = v20;
    [(VOTOutputSpeechComponent *)self _formatEthernetMacAddress:v22 voiceIdentifier:v11 rate:v64];
    if (((v98 | v30 | v94 | v92 | v93) & 1) == 0)
    {
      id v65 = [v99 mutableCopy];
      *(float *)&double v66 = v20;
      [(VOTOutputSpeechComponent *)self _formatDetectedDates:v65 voiceIdentifier:v11 languageCode:v56 rate:v66];
      if (([v65 isEqualToString:v99] & 1) == 0)
      {
        *(float *)&double v67 = v20;
        [(VOTOutputSpeechComponent *)self _formatDetectedDates:v22 voiceIdentifier:v11 languageCode:v56 rate:v67];
      }
    }
    if (([v56 hasPrefix:@"zh"] & 1) == 0) {
      [(VOTOutputSpeechComponent *)self _formatJapaneseYen:v22];
    }
    [(VOTOutputSpeechComponent *)self _applyTransliteration:v22 languageCode:v56];
    *(float *)&double v68 = v20;
    [(VOTOutputSpeechComponent *)self _processEmoji:v22 action:v10 rate:v68];
    [(VOTOutputSpeechComponent *)self _applyCamelCaseSeparation:v22];
    char v102 = 0;
    if (v30)
    {
      id v70 = +[NSCharacterSet whitespaceCharacterSet];
      id v71 = [(__CFString *)v22 stringByTrimmingCharactersInSet:v70];

      [(__CFString *)v22 setString:v71];
      id v72 = objc_allocWithZone((Class)NSArray);
      uint64_t v73 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", 0, [(__CFString *)v22 length]);
      id v74 = objc_msgSend(v72, "initWithObjects:", v73, 0);

      *(float *)&double v75 = v20;
      [(VOTOutputSpeechComponent *)self _applyTelephoneFormatting:v22 withRanges:v74 languageCode:v56 voiceIdentifier:v11 rate:v75];
    }
    else if ((v94 | v93 | v92) == 1)
    {
      -[VOTOutputSpeechComponent _formatExplicitTimeDuration:isMMSS:languageCode:](self, "_formatExplicitTimeDuration:isMMSS:languageCode:", v22);
      char v102 = 1;
    }
    else if (((v98 | v91) & 1) == 0)
    {
      *(float *)&double v69 = v20;
      [(VOTOutputSpeechComponent *)self _formatTimeDuration:v22 didMatch:&v102 voiceIdentifier:v11 rate:v69];
    }
    if (v98)
    {
      if ([(__CFString *)v22 rangeOfString:@"."] != (id)0x7FFFFFFFFFFFFFFFLL) {
        [(__CFString *)v22 replaceOccurrencesOfString:@".", @":", 0, 0, [(__CFString *)v22 length] withString options range];
      }
    }
    else
    {
      int v76 = v91;
      if (v102) {
        int v76 = 1;
      }
      if (((v76 | v90 | v30) & 1) == 0)
      {
        *(float *)&double v69 = v20;
        [(VOTOutputSpeechComponent *)self _formatTelephoneNumber:v22 languageCode:v56 voiceIdentifier:v11 rate:v69];
      }
    }
    [(VOTOutputSpeechComponent *)self _applyTextualWorkarounds:v22];
    if ((v96 & 1) == 0)
    {
      *(float *)&double v77 = v20;
      [(VOTOutputSpeechComponent *)self _insertLongerPausesForSymbol:@"," withText:v22 allowPausingAtBoundaries:v100 onlyApplyWhenFollowedBySpace:0 languageCode:v56 voiceIdentifier:v11 rate:v77];
      *(float *)&double v78 = v20;
      [(VOTOutputSpeechComponent *)self _insertLongerPausesForSymbol:@"·" withText:v22 allowPausingAtBoundaries:v100 onlyApplyWhenFollowedBySpace:0 languageCode:v56 voiceIdentifier:v11 rate:v78];
      if ((v91 & 1) == 0)
      {
        *(float *)&double v77 = v20;
        [(VOTOutputSpeechComponent *)self _insertLongerPausesForSymbol:@"." withText:v22 allowPausingAtBoundaries:v100 onlyApplyWhenFollowedBySpace:1 languageCode:v56 voiceIdentifier:v11 rate:v77];
      }
    }
    if (v95) {
      [(VOTOutputSpeechComponent *)self _removeRunsOfNewLines:v22];
    }
    if ((v96 & 1) == 0)
    {
      *(float *)&double v77 = v20;
      [(VOTOutputSpeechComponent *)self _insertLongerPausesForSymbol:@"\n\n" withText:v22 allowPausingAtBoundaries:v100 onlyApplyWhenFollowedBySpace:0 languageCode:v56 voiceIdentifier:v11 rate:v77];
      id v79 = v56;
      unsigned int v80 = v79;
      if (!v79)
      {
        unsigned int v80 = [(id)VOTSharedWorkspace systemSpokenLanguage];
      }
      if (([v80 isEqual:@"he-IL"] & 1) == 0)
      {
        *(float *)&double v81 = v20;
        [(VOTOutputSpeechComponent *)self _insertLongerPausesForSymbol:@"/" withText:v22 allowPausingAtBoundaries:v100 onlyApplyWhenFollowedBySpace:0 languageCode:v79 voiceIdentifier:v11 rate:v81];
      }
      *(float *)&double v81 = v20;
      [(VOTOutputSpeechComponent *)self _insertLongerPausesForSymbol:@"?" withText:v22 allowPausingAtBoundaries:v100 onlyApplyWhenFollowedBySpace:0 languageCode:v79 voiceIdentifier:v11 rate:v81];
      *(float *)&double v82 = v20;
      [(VOTOutputSpeechComponent *)self _insertLongerPausesForSymbol:@"\n" withText:v22 allowPausingAtBoundaries:v100 onlyApplyWhenFollowedBySpace:0 languageCode:v79 voiceIdentifier:v11 rate:v82];
      *(float *)&double v83 = v20;
      [(VOTOutputSpeechComponent *)self _insertLongerPausesForSymbol:@"\r" withText:v22 allowPausingAtBoundaries:v100 onlyApplyWhenFollowedBySpace:0 languageCode:v79 voiceIdentifier:v11 rate:v83];
    }
    if (v95)
    {
      __int16 v101 = 8212;
      long long v84 = +[NSString stringWithCharacters:&v101 length:1];
      *(float *)&double v85 = v20;
      [(VOTOutputSpeechComponent *)self _insertLongerPausesForSymbol:v84 withText:v22 allowPausingAtBoundaries:v100 onlyApplyWhenFollowedBySpace:0 languageCode:v56 voiceIdentifier:v11 rate:v85];

      *(float *)&double v86 = v20;
      [(VOTOutputSpeechComponent *)self _insertLongerPausesForSymbol:@"!" withText:v22 allowPausingAtBoundaries:v100 onlyApplyWhenFollowedBySpace:0 languageCode:v56 voiceIdentifier:v11 rate:v86];
      *(float *)&double v87 = v20;
      [(VOTOutputSpeechComponent *)self _insertLongerPausesForSymbol:@"\t" withText:v22 allowPausingAtBoundaries:v100 onlyApplyWhenFollowedBySpace:0 languageCode:v56 voiceIdentifier:v11 rate:v87];
    }

    id v9 = v99;
    goto LABEL_62;
  }
  __int16 v33 = [v10 objectForVariant:38];
  [v33 floatValue];
  float v35 = v34;

  if (v35 <= 0.0)
  {
    long long v22 = 0;
LABEL_62:
    id v48 = v97;
    goto LABEL_63;
  }
  [(VOTOutputSpeechComponent *)self _ttsVoiceTypeForPauseCalculationWithVoiceIdentifier:v11];
  *(float *)&double v36 = v35;
  sub_100050BA4(v36, v20);
  float v38 = v37;
  *(float *)&double v39 = v20;
  long long v40 = [(VOTOutputSpeechComponent *)self pauseStringForType:8 voiceIdentifier:v11 rate:v39];
  id v47 = v40;
  id v48 = v15;
  if (!v40
    || (sub_10002B424(v40, @"%d", v41, v42, v43, v44, v45, v46, (int)(float)(v38 * 1000.0)),
        (long long v22 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v49 = VOTLogCommon();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      sub_10011D3DC();
    }

    long long v22 = &stru_1001B7888;
  }

LABEL_63:
  v88 = VOTLogSpeech();
  if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG)) {
    sub_10011D374();
  }

  return v22;
}

- (void)_speakAsNormalText:(id)a3
{
  id v4 = a3;
  id v8 = [v4 string];
  id v5 = [v4 objectForVariant:66];
  id v6 = [v5 BOOLValue];

  float v7 = [(VOTOutputSpeechComponent *)self _stringForNormalText:v8 action:v4 allowPausingAtBoundaries:0 ignoreLeadingCommas:v6];
  [v4 setString:v7];
}

- (void)_speakAsMixOfLiteralAndNormalText:(id)a3 withLiteralRanges:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 string];
  id v9 = +[NSMutableString string];
  uint64_t v33 = 0;
  float v34 = &v33;
  uint64_t v35 = 0x3010000000;
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  double v36 = &unk_100168CC9;
  id v10 = [v6 objectForVariant:66];
  unsigned int v11 = [v10 BOOLValue];

  long long v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  long long v25 = sub_1000391C8;
  unsigned int v26 = &unk_1001B3E18;
  id v31 = &v33;
  id v12 = v8;
  id v27 = v12;
  uint64_t v28 = self;
  id v13 = v6;
  id v29 = v13;
  char v32 = v11;
  id v14 = v9;
  id v30 = v14;
  [v7 enumerateRangesUsingBlock:&v23];
  uint64_t v15 = v34[4];
  uint64_t v16 = v34[5];
  unsigned int v17 = (char *)objc_msgSend(v12, "length", v23, v24, v25, v26);
  uint64_t v18 = (unsigned char *)(v16 + v15);
  float v19 = (char *)(v17 - v18);
  if (v17 != v18)
  {
    float v20 = objc_msgSend(v12, "substringWithRange:", v18, v19);
    if (v18) {
      uint64_t v21 = 0;
    }
    else {
      uint64_t v21 = v11;
    }
    long long v22 = [(VOTOutputSpeechComponent *)self _stringForNormalText:v20 action:v13 allowPausingAtBoundaries:1 ignoreLeadingCommas:v21];
    [v14 appendString:v22];
  }
  objc_msgSend(v13, "setString:", v14, v19);

  _Block_object_dispose(&v33, 8);
}

- (void)_configureSynthesizerWithPhonemeSubstitutionsFromAction:(id)a3
{
  id v4 = a3;
  id v5 = [v4 string];
  id v6 = +[NSMutableArray array];
  id v7 = [v4 string];
  unsigned int v8 = [v7 isAXAttributedString];

  if (v8)
  {
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100039664;
    v34[3] = &unk_1001B3E40;
    id v35 = v6;
    [v5 enumerateAttributesUsingBlock:v34];
  }
  uint64_t v9 = [v4 objectForVariant:78];
  if (v9)
  {
    id v10 = (void *)v9;
    unsigned int v11 = [v4 string];

    if (v11)
    {
      id v12 = [v4 objectForVariant:78];
      [v6 addObject:v12];
    }
  }
  if ([v6 count])
  {
    unsigned int v26 = v5;
    id v27 = v4;
    id v13 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v14 = v6;
    id v15 = [v14 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v14);
          }
          float v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_1000396D0;
          v28[3] = &unk_1001B3E68;
          id v29 = v13;
          [v19 enumerateKeysAndObjectsUsingBlock:v28];
        }
        id v16 = [v14 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v16);
    }

    transientSubstitutions = self->_transientSubstitutions;
    self->_transientSubstitutions = v13;
    uint64_t v21 = v13;

    long long v22 = [(NSArray *)self->_userSubstitutions arrayByAddingObjectsFromArray:self->_transientSubstitutions];
    [(TTSSpeechSynthesizer *)self->_synthesizer setUserSubstitutions:v22];

    long long v23 = [(NSArray *)self->_userSubstitutions arrayByAddingObjectsFromArray:self->_transientSubstitutions];

    uint64_t v24 = [(VOTOutputSpeechComponent *)self synthesizerForTelephonyMixin];
    [v24 setUserSubstitutions:v23];

    id v5 = v26;
    id v4 = v27;
  }
  else
  {
    long long v25 = self->_transientSubstitutions;
    if (v25)
    {
      self->_transientSubstitutions = 0;

      [(TTSSpeechSynthesizer *)self->_synthesizer setUserSubstitutions:self->_userSubstitutions];
    }
  }
}

- (void)_preprocessActionLanguageAndVoice:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForIndex:14];
  id v6 = [(VOTOutputComponent *)self determineLanguageForEvent:v4];

  if (![v6 length])
  {
    id v7 = [v5 string];
    unsigned __int8 v8 = [(VOTOutputSpeechComponent *)self stringIsInSupportedCharacters:v7];

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = [v5 objectForVariant:28];
      unsigned int v10 = [v9 BOOLValue];

      unsigned int v11 = [v5 objectForVariant:83];
      unsigned __int8 v12 = [v11 BOOLValue];

      if ((v12 & 1) == 0)
      {
        id v13 = [v5 string];
        BOOL v14 = sub_1000517A8(v13);

        if ((!v14 | v10) == 1)
        {
          id v15 = sub_100051804(off_1001EA9E8, @"unpronounceable", &stru_1001B7888);
          id v16 = [v5 string];
          uint64_t v17 = +[NSString stringWithFormat:@"%@, %@", v15, v16];

          uint64_t v18 = VOTLogSpeech();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            float v19 = [v5 string];
            float v20 = [v5 string];
            *(_DWORD *)long long buf = 138412546;
            id v27 = v19;
            __int16 v28 = 1024;
            unsigned int v29 = [v20 characterAtIndex:0];
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Unpronounceable string: %@ %d", buf, 0x12u);
          }
          [v5 setString:v17];
          [v5 removeObjectForVariant:28];
        }
      }
    }
  }
  if (![v6 length])
  {
    uint64_t v21 = [(id)VOTSharedWorkspace systemSpokenLanguage];

    if ([v21 hasPrefix:@"en"]
      && (+[NSLocale currentLocale],
          long long v22 = objc_claimAutoreleasedReturnValue(),
          [v22 languageCode],
          long long v23 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v24 = [v23 hasPrefix:@"en"],
          v23,
          v22,
          (v24 & 1) == 0))
    {

      id v6 = 0;
    }
    else
    {
      id v6 = v21;
    }
  }
  id v25 = [(VOTOutputSpeechComponent *)self _determineVoiceSelection:v5 languageCode:v6];
}

- (void)_determineEmojiPreferenceForAction:(id)a3
{
  id v4 = a3;
  id v7 = [(VOTOutputComponent *)self determineActivityForAction:v4];
  id v5 = [v7 speakEmojis];

  if (v5) {
    [v7 speakEmojis];
  }
  else {
  id v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", ([(id)VOTSharedWorkspace emojiFeedback] >> 1) & 1);
  }
  [v4 setObject:v6 forVariant:80];
}

- (void)preprocessAction:(id)a3
{
  id v45 = a3;
  id v4 = [v45 objectForVariant:48];
  unsigned int v5 = [v4 BOOLValue];

  id v6 = [v45 objectForVariant:47];
  unsigned int v7 = [v6 BOOLValue];

  unsigned __int8 v8 = [v45 objectForVariant:51];
  unsigned int v9 = [v8 BOOLValue];

  unsigned int v10 = [v45 objectForVariant:56];
  unsigned int v11 = [v10 BOOLValue];

  unsigned __int8 v12 = [v45 objectForVariant:59];
  if ([v12 BOOLValue])
  {
    unsigned int v44 = 1;
  }
  else
  {
    id v13 = [v45 objectForVariant:27];
    unsigned int v44 = [v13 BOOLValue];
  }
  [(VOTOutputSpeechComponent *)self _configureSynthesizerWithPhonemeSubstitutionsFromAction:v45];
  [(VOTOutputSpeechComponent *)self _determineEmojiPreferenceForAction:v45];
  BOOL v14 = [v45 objectForVariant:67];

  if (v14)
  {
    id v15 = [v45 objectForVariant:67];
    CFTypeID v16 = CFGetTypeID(v15);
    if (v16 == AXUIElementGetTypeID())
    {
      uint64_t v17 = [v45 objectForVariant:67];
      id v18 = +[AXUIElement uiElementWithAXElement:v17 cache:0];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v18 = v15;
      }
      else {
        id v18 = 0;
      }
    }
    float v19 = [v18 stringWithAXAttribute:2006];
    if ([(__CFString *)v19 length])
    {
      float v20 = v45;
      CFStringRef v21 = v19;
    }
    else
    {
      CFStringRef v21 = &stru_1001B7888;
      float v20 = v45;
    }
    [v20 setString:v21];
  }
  id v22 = [objc_allocWithZone((Class)AXIndexMap) init];
  [v22 setObject:v45 forIndex:14];
  [(VOTOutputSpeechComponent *)self _determineVolume:v45];
  if (fabs(v23 + -3.40282347e38) >= 2.22044605e-16)
  {
    unsigned __int8 v24 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v45 setObject:v24 forVariant:40];
  }
  [(VOTOutputSpeechComponent *)self _preprocessActionLanguageAndVoice:v22];
  id v25 = [v45 objectForVariant:28];
  unsigned int v26 = [v25 BOOLValue];

  id v27 = [v45 objectForVariant:80];
  unsigned int v28 = [v27 BOOLValue];

  unsigned int v29 = v11;
  unsigned int v30 = v9;
  unsigned int v31 = v7;
  unsigned int v32 = v5;
  if ((v26 & 1) == 0)
  {
    float v34 = [v45 string];
    id v35 = [v34 length];

    if (v35 == (id)1) {
      char v36 = v28;
    }
    else {
      char v36 = 0;
    }
    if ((v36 & 1) == 0)
    {
      int v33 = 0;
      unsigned int v28 = 0;
      goto LABEL_25;
    }
LABEL_23:
    unsigned int v28 = [(VOTOutputSpeechComponent *)self _processActionForLiteralEmojis:v45];
    uint64_t v37 = v45;
    int v33 = v26 & ~v28;
    goto LABEL_26;
  }
  if (v28) {
    goto LABEL_23;
  }
  int v33 = 1;
LABEL_25:
  uint64_t v37 = v45;
LABEL_26:
  uint64_t v38 = [v37 string];
  if ([v38 length] == (id)1) {
    int v39 = v32;
  }
  else {
    int v39 = 1;
  }
  if (((v28 | v44 | v39 | v31 | v30 | v29) & 1) == 0 || v33)
  {
  }
  else
  {
    long long v40 = [v45 objectForVariant:42];

    if (!v40)
    {
      uint64_t v41 = [v45 objectForVariant:64];
      unsigned int v42 = [v41 BOOLValue];

      if (v42)
      {
        [(VOTOutputSpeechComponent *)self _speakAsPhoneticText:v45];
      }
      else
      {
        uint64_t v43 = [v45 objectForVariant:29];
        if (v43) {
          [(VOTOutputSpeechComponent *)self _speakAsMixOfLiteralAndNormalText:v45 withLiteralRanges:v43];
        }
        else {
          [(VOTOutputSpeechComponent *)self _speakAsNormalText:v45];
        }
      }
      goto LABEL_36;
    }
  }
  [(VOTOutputSpeechComponent *)self _speakAsLiteralText:v45];
LABEL_36:
}

- (BOOL)_processActionForLiteralEmojis:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableIndexSet indexSet];
  unsigned int v5 = [v3 string];
  id v6 = (char *)[v5 length];

  if (v6)
  {
    unsigned int v7 = [v3 string];
    unsigned __int8 v8 = +[TTSEmojiUtilities emojiRangeFromString:withSearchRange:](TTSEmojiUtilities, "emojiRangeFromString:withSearchRange:", v7, 0, v6);
    uint64_t v10 = v9;

    unsigned int v11 = 0;
    BOOL v12 = v8 != (unsigned char *)0x7FFFFFFFFFFFFFFFLL;
    if (v8 != (unsigned char *)0x7FFFFFFFFFFFFFFFLL)
    {
      unsigned int v11 = 0;
      do
      {
        if (v8 != v11) {
          objc_msgSend(v4, "addIndexesInRange:", v11, v8 - v11);
        }
        unsigned int v11 = &v8[v10];
        BOOL v13 = v6 >= &v8[v10];
        int64_t v14 = v6 - &v8[v10];
        if (v14 == 0 || !v13) {
          break;
        }
        id v15 = [v3 string];
        unsigned __int8 v8 = +[TTSEmojiUtilities emojiRangeFromString:withSearchRange:](TTSEmojiUtilities, "emojiRangeFromString:withSearchRange:", v15, v11, v14);
        uint64_t v10 = v16;
      }
      while (v8 != (unsigned char *)0x7FFFFFFFFFFFFFFFLL);
    }
    if (v6 != v11 && v6 - v11 < (unint64_t)v6) {
      [v4 addIndexesInRange:v11];
    }
  }
  else
  {
    BOOL v12 = 0;
  }
  if ([v4 count]) {
    [v3 setObject:v4 forVariant:29];
  }

  return v12;
}

- (BOOL)stringIsInSupportedCharacters:(id)a3
{
  id v3 = a3;
  id v4 = +[VOTOutputManager outputManager];
  unsigned int v5 = [v4 currentLanguageMap];
  id v6 = [(id)VOTSharedWorkspace selectedLanguage];
  if (v6)
  {
    char v7 = sub_100051640(v5, v6, v3);
  }
  else
  {
    unsigned __int8 v8 = [(id)VOTSharedWorkspace systemSpokenLanguage];
    char v7 = sub_100051640(v5, v8, v3);
  }
  return v7;
}

- (id)stringReplacingBrailleDotRanges:(id)a3
{
  id v3 = a3;
  if (qword_1001EB870 != -1) {
    dispatch_once(&qword_1001EB870, &stru_1001B3E88);
  }
  id v4 = +[NSMutableString string];
  if (![v3 length]) {
    goto LABEL_19;
  }
  char v5 = 0;
  unint64_t v6 = 0;
LABEL_5:
  char v19 = v5;
  do
  {
    id v7 = [v3 characterAtIndex:v6];
    if ([(id)qword_1001EB868 characterIsMember:v7])
    {
      if (v5)
      {
        [v4 appendString:@", "];
      }
      else
      {
        uint64_t v10 = sub_100051804(off_1001EA9E8, @"braille.dot.pattern.leader", &stru_1001B7888);
        [v4 appendString:v10];
        [v4 appendString:@" "];
      }
      unsigned int v11 = +[NSMutableArray array];
      uint64_t v12 = 0;
      do
      {
        uint64_t v13 = v12 + 1;
        if ((v7 >> v12))
        {
          int64_t v14 = +[NSString stringWithFormat:@"%d", v13];
          [v11 addObject:v14];
        }
        uint64_t v12 = v13;
      }
      while (v13 != 8);
      id v15 = [v11 componentsJoinedByString:@" "];
      [v4 appendString:v15];

      ++v6;
      char v5 = 1;
      if (v6 >= (unint64_t)[v3 length])
      {
        uint64_t v16 = v4;
        goto LABEL_20;
      }
      goto LABEL_5;
    }
    unsigned __int8 v8 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    unsigned __int8 v9 = [v8 characterIsMember:v7];

    v5 &= v9;
    objc_msgSend(v4, "appendFormat:", @"%C", v7);
    ++v6;
  }
  while (v6 < (unint64_t)[v3 length]);
  uint64_t v16 = v4;
  if ((v19 & 1) == 0) {
LABEL_19:
  }
    uint64_t v16 = v3;
LABEL_20:
  id v17 = v16;

  return v17;
}

- (void)_notifyDidFinishSpeakingWithFakeRequestForEvent:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)TTSSpeechRequest);
  id currentRequest = self->_currentRequest;
  self->_id currentRequest = v5;
  id object = v5;

  objc_setAssociatedObject(object, &unk_1001EB778, v4, (void *)1);
  [(VOTOutputSpeechComponent *)self speechSynthesizer:self->_synthesizer didFinishSpeakingRequest:object successfully:1 withError:0];
}

- (id)_preferenceLanguageForLanguage:(id)a3 selectedLanguage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  unsigned __int8 v8 = v7;
  if (v7 && !v6)
  {
    AXLanguageCanonicalFormToGeneralLanguage();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [(id)VOTSharedWorkspace systemSpokenLanguage];
    unsigned int v11 = [v10 hasPrefix:v9];

    if (v11)
    {
      id v9 = v9;

      uint64_t v12 = v9;
    }
    else
    {
      uint64_t v12 = v8;
    }
    goto LABEL_9;
  }
  if (!v7
    || ([(id)VOTSharedWorkspace selectedLanguage],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v14 = [v13 isEqualToString:v8],
        v13,
        uint64_t v12 = v8,
        (v14 & 1) == 0))
  {
    uint64_t v12 = AXLanguageCanonicalFormToGeneralLanguage();
    id v9 = v8;
LABEL_9:
  }

  return v12;
}

- (void)_updateActionWithCanonicalMappings:(id)a3
{
  id v3 = a3;
  id v4 = [v3 string];
  id v5 = [v4 precomposedStringWithCanonicalMapping];

  [v3 setString:v5];
}

- (float)mapSettingsPitchToSpeechPitch:(float)a3
{
  if (a3 < 0.5) {
    return (a3 + a3) * 0.5 + 0.5;
  }
  float v3 = 1.0;
  if (a3 > 0.5) {
    return (float)((float)(a3 + -0.5) + (float)(a3 + -0.5)) + 1.0;
  }
  return v3;
}

- (void)_updatePitch:(id)a3 settingsPitch:(float)a4
{
  if (a3)
  {
    [a3 floatValue];
    float v7 = *(float *)&v6 + (float)((float)(2.0 - *(float *)&v6) * (float)((float)(a4 + -0.5) + (float)(a4 + -0.5)));
  }
  else
  {
    [(VOTOutputSpeechComponent *)self mapSettingsPitchToSpeechPitch:*(double *)&a4];
    float v7 = *(float *)&v6;
  }
  *(float *)&double v6 = v7;
  [(TTSSpeechSynthesizer *)self->_synthesizer setPitch:v6];
  id v9 = [(VOTOutputSpeechComponent *)self synthesizerForTelephonyMixin];
  *(float *)&double v8 = v7;
  [v9 setPitch:v8];
}

- (id)outputMutedActivityValue:(id)a3
{
  return [a3 speechMuted];
}

- (double)outputMutedActivityLastToggleTime
{
  _[(id)VOTSharedWorkspace lastSpeechMuteToggleTime];
  return result;
}

- (void)_updateDuckingBasedOnActivity:(id)a3
{
  id v9 = [(VOTOutputComponent *)self determineActivityForAction:a3];
  id v4 = [(VOTOutputSpeechComponent *)self activityBasedAudioDucking];
  unint64_t v5 = (unint64_t)[v4 copy];

  double v6 = [v9 audioDucking];

  if (v6)
  {
    float v7 = [v9 audioDucking];
    [(VOTOutputSpeechComponent *)self setActivityBasedAudioDucking:v7];
  }
  else
  {
    [(VOTOutputSpeechComponent *)self setActivityBasedAudioDucking:0];
  }
  uint64_t v8 = [(VOTOutputSpeechComponent *)self activityBasedAudioDucking];
  if (v5 | v8 && ([(id)v5 isEqual:v8] & 1) == 0) {
    [(VOTOutputSpeechComponent *)self _updateAudioSessionProperties];
  }
}

- (void)_handlePerformAction:(id)a3
{
  id v4 = a3;
  unint64_t v5 = VOTLogSpeech();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VOT-BeginSpeaking", "", buf, 2u);
  }

  if (!self->_lastSetOptions)
  {
    double v6 = VOTLogAudio();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Trying to speak without having set audio session properties, reseting now.", buf, 2u);
    }

    [(VOTOutputSpeechComponent *)self _updateAudioSessionProperties];
  }
  float v7 = [v4 objectForIndex:14];
  unsigned int v8 = [(id)VOTSharedWorkspace speechMuted];
  unsigned int v9 = [(id)VOTSharedWorkspace voiceOverIsIdle];
  unsigned int v10 = [(VOTOutputComponent *)self determineOutputMutedForActivity:v7];
  [(VOTOutputSpeechComponent *)self _updateDuckingBasedOnActivity:v7];
  unsigned int v11 = [v7 objectForVariant:25];
  unsigned int v12 = [v11 BOOLValue];

  uint64_t v13 = +[VOTElement systemAppApplication];
  unsigned int v14 = [v13 isSiriTalkingOrListening];

  if (!v14 && (((v8 | v9 | v10) ^ 1 | v12) & 1) != 0)
  {
    id v15 = [v7 objectForVariant:32];
    self->_userStopped = 0;
    self->_isSpeaking = 1;
    uint64_t v16 = [v7 objectForVariant:74];
    id v17 = [v7 objectForVariant:87];
    id v18 = [v7 string];
    char v19 = [(VOTOutputSpeechComponent *)self stringReplacingBrailleDotRanges:v18];

    float v20 = [v7 string];

    if (v19 != v20) {
      [v7 setString:v19];
    }
    p_synthesizer = &self->_synthesizer;
    [(TTSSpeechSynthesizer *)self->_synthesizer setSpeechSource:v17];
    [(TTSSpeechSynthesizer *)self->_synthesizer setVoiceIdentifier:v16];
    id v22 = [(VOTOutputSpeechComponent *)self synthesizerForTelephonyMixin];
    [v22 setSpeechSource:v17];

    float v23 = [(VOTOutputSpeechComponent *)self synthesizerForTelephonyMixin];
    [v23 setVoiceIdentifier:v16];

    [(VOTOutputSpeechComponent *)self _updateActionWithCanonicalMappings:v7];
    unsigned __int8 v24 = [v7 outputRequest];
    [v24 setStartedRequest:1];

    id v25 = [v7 string];
    if ([v25 length])
    {
      BOOL v130 = v19;
      unsigned int v26 = [v7 outputRequest];
      if (![v26 disableOutput])
      {
        [v7 outputRequest];
        unsigned int v29 = v129 = v17;
        unsigned __int8 v30 = [v29 suppressSpeech];

        id v17 = v129;
        char v19 = v130;
        if ((v30 & 1) == 0)
        {
          unint64_t v126 = v16;
          unsigned int v31 = [v7 objectForVariant:89];
          unsigned int v32 = [v31 rate];
          int v33 = v32;
          if (v32)
          {
            v125 = v32;
          }
          else
          {
            uint64_t v34 = [v7 objectForVariant:39];
            id v35 = (void *)v34;
            if (v34) {
              char v36 = (_UNKNOWN **)v34;
            }
            else {
              char v36 = &off_1001C4F18;
            }
            v125 = v36;
          }
          uint64_t v37 = [v31 pitch];
          uint64_t v38 = (void *)v37;
          if (v37) {
            int v39 = (_UNKNOWN **)v37;
          }
          else {
            int v39 = &off_1001C4F18;
          }
          long long v40 = v39;

          uint64_t v41 = [v31 volume];
          unsigned int v42 = v41;
          v124 = v31;
          if (v41)
          {
            id v43 = v41;
          }
          else
          {
            unsigned int v44 = [v7 objectForVariant:40];
            id v45 = v44;
            if (v44)
            {
              id v43 = v44;
            }
            else
            {
              uint64_t v46 = +[AXSettings sharedInstance];
              [v46 voiceOverEffectiveSpeakingVolume];
              +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
              id v43 = (id)objc_claimAutoreleasedReturnValue();

              unsigned int v31 = v124;
            }
          }
          id v47 = [v31 voiceSettings];
          [(TTSSpeechSynthesizer *)*p_synthesizer setPerVoiceSettings:v47];

          id v48 = [v31 effects];
          [(TTSSpeechSynthesizer *)*p_synthesizer setAudioEffects:v48];

          uint64_t v49 = [v31 voiceSettings];
          char v50 = [(VOTOutputSpeechComponent *)self synthesizerForTelephonyMixin];
          [v50 setPerVoiceSettings:v49];

          [v40 floatValue];
          -[VOTOutputSpeechComponent _updatePitch:settingsPitch:](self, "_updatePitch:settingsPitch:", v15);
          id v51 = *p_synthesizer;
          [v43 floatValue];
          -[TTSSpeechSynthesizer setVolume:](v51, "setVolume:");
          [v43 floatValue];
          int v53 = v52;
          unsigned __int8 v54 = [(VOTOutputSpeechComponent *)self synthesizerForTelephonyMixin];
          LODWORD(v55) = v53;
          [v54 setVolume:v55];

          [v125 floatValue];
          float v57 = v56;

          float v58 = -1.0;
          if (v57 < 0.0)
          {
            uint64_t v59 = v126;
          }
          else
          {
            uint64_t v59 = v126;
            if (fabs(v57 + -3.40282347e38) >= 2.22044605e-16)
            {
              [(TTSSpeechSynthesizer *)*p_synthesizer rate];
              float v58 = v60;
              *(float *)&double v61 = v57;
              [(TTSSpeechSynthesizer *)*p_synthesizer setRate:v61];
              uint64_t v62 = [(VOTOutputSpeechComponent *)self synthesizerForTelephonyMixin];
              *(float *)&double v63 = v57;
              [v62 setRate:v63];

              double v64 = VOTLogSpeech();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 134217984;
                *(double *)v140 = v57;
                _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "Set Rate: %f;", buf, 0xCu);
              }
            }
          }
          id v121 = v43;
          id v65 = +[VOTOutputManager outputManager];
          [v65 enableAudioSession:@"SPEECH"];

          double v66 = VOTLogSpeech();
          if (os_signpost_enabled(v66))
          {
            *(_WORD *)long long buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v66, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "BeginSpeaking", "", buf, 2u);
          }
          unsigned __int8 v122 = v15;

          double v67 = [v7 objectForVariant:70];
          -[TTSSpeechSynthesizer setIgnoreSubstitutions:](*p_synthesizer, "setIgnoreSubstitutions:", [v67 BOOLValue]);

          double v68 = [v7 objectForVariant:43];
          [(TTSSpeechSynthesizer *)*p_synthesizer setBundleIdentifier:v68];

          double v69 = [v7 objectForVariant:70];
          id v70 = [v69 BOOLValue];
          id v71 = [(VOTOutputSpeechComponent *)self synthesizerForTelephonyMixin];
          [v71 setIgnoreSubstitutions:v70];

          id v72 = [v7 objectForVariant:43];
          uint64_t v73 = [(VOTOutputSpeechComponent *)self synthesizerForTelephonyMixin];
          [v73 setBundleIdentifier:v72];

          id v74 = [v7 outputRequest];
          -[TTSSpeechSynthesizer setSynthesizeSilently:](*p_synthesizer, "setSynthesizeSilently:", [v74 synthesizeSilently]);

          v120 = +[TTSSpeechSynthesizer voiceForIdentifier:v59];
          uint64_t v75 = [v120 language];
          char v123 = (void *)v75;
          id v118 = &self->_synthesizer;
          if (v75)
          {
            uint64_t v76 = v75;
            [v7 setObject:v75 forVariant:17];
            double v77 = *p_synthesizer;
            double v78 = [v7 string];
            id v137 = 0;
            id v138 = 0;
            [(TTSSpeechSynthesizer *)v77 startSpeakingString:v78 withLanguageCode:v76 request:&v138 error:&v137];
            id v79 = v138;
            id v80 = v137;

            double v81 = [(VOTOutputSpeechComponent *)self synthesizerForTelephonyMixin];
            double v82 = [v7 string];
            double v83 = v79;
            id v135 = v80;
            id v136 = v79;
            long long v84 = &v136;
            double v85 = &v135;
            double v86 = &v136;
            double v87 = &v135;
            v88 = v81;
            NSRange v89 = v82;
            uint64_t v90 = v76;
          }
          else
          {
            unsigned int v91 = *p_synthesizer;
            unsigned int v92 = [v7 string];
            id v133 = 0;
            id v134 = 0;
            [(TTSSpeechSynthesizer *)v91 startSpeakingString:v92 withLanguageCode:0 request:&v134 error:&v133];
            id v93 = v134;
            id v80 = v133;

            double v81 = [(VOTOutputSpeechComponent *)self synthesizerForTelephonyMixin];
            double v82 = [v7 string];
            double v83 = v93;
            id v131 = v80;
            id v132 = v93;
            long long v84 = &v132;
            double v85 = &v131;
            double v86 = &v132;
            double v87 = &v131;
            v88 = v81;
            NSRange v89 = v82;
            uint64_t v90 = 0;
          }
          [v88 startSpeakingString:v89 withLanguageCode:v90 request:v86 error:v87];
          id v94 = *v84;
          id object = *v84;

          id v127 = *v85;
          uint64_t v95 = [v7 objectForVariant:75];
          id v15 = v122;
          uint64_t v16 = v126;
          id v17 = v129;
          if (v95)
          {
            unsigned __int8 v96 = +[VOTOutputManager outputManager];
            [v96 playSoundFast:v95];

            id v97 = VOTLogAudio();
            if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG)) {
              sub_10011D668();
            }
          }
          unsigned int v98 = VOTLogSpeech();
          __int16 v119 = (void *)v95;
          if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v116 = [(TTSSpeechSynthesizer *)*v118 resolvedVoiceIdentifier];
            uint64_t v117 = [v7 string];
            *(_DWORD *)long long buf = 138478339;
            *(void *)v140 = v123;
            *(_WORD *)&v140[8] = 2113;
            id v141 = v116;
            *(_WORD *)v142 = 2113;
            *(void *)&v142[2] = v117;
            _os_log_debug_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEBUG, "Spoke: [%{private}@:%{private}@]: '%{private}@'", buf, 0x20u);

            id v17 = v129;
          }

          v99 = VOTLogSpeech();
          if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG)) {
            sub_10011D5B8((id *)v118);
          }

          objc_storeStrong(&self->_currentRequest, v94);
          if (object) {
            objc_setAssociatedObject(object, &unk_1001EB778, v4, (void *)1);
          }
          BOOL v100 = [v7 objectForVariant:41];
          unsigned int v101 = [v100 BOOLValue];

          char v102 = +[AXSpringBoardServer server];
          if (![v102 isScreenLockedWithPasscode:0] || v101)
          {

            char v19 = v130;
          }
          else
          {
            double Current = CFAbsoluteTimeGetCurrent();
            id v104 = +[VOTUserEventManager sharedInstance];
            [v104 lastEventOccurred];
            double v106 = Current - v105;

            double v107 = 2.0;
            char v19 = v130;
            if (v106 < 2.0)
            {
              id v108 = [(VOTOutputSpeechComponent *)self disableIdleTimerAssertion];

              if (!v108)
              {
                id v109 = +[AXUserEventTimer sharedInstance];
                id v110 = (objc_class *)objc_opt_class();
                uint64_t v111 = NSStringFromClass(v110);
                long long v112 = [v109 acquireAssertionToDisableIdleTimerWithReason:v111];
                [(VOTOutputSpeechComponent *)self setDisableIdleTimerAssertion:v112];

                id v17 = v129;
                char v19 = v130;
              }
              objc_setAssociatedObject(object, &unk_1001EB878, &__kCFBooleanTrue, (void *)1);
            }
          }
          if (v127)
          {
            long long v113 = VOTLogSpeech();
            if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR)) {
              sub_10011D524(v127, v113);
            }
          }
          if (v58 >= 0.0)
          {
            *(float *)&double v107 = v58;
            [(TTSSpeechSynthesizer *)*v118 setRate:v107];
            id v114 = [(VOTOutputSpeechComponent *)self synthesizerForTelephonyMixin];
            *(float *)&double v115 = v58;
            [v114 setRate:v115];
          }
          self->_lastTimeSpeechStarted = CFAbsoluteTimeGetCurrent();

          goto LABEL_16;
        }
LABEL_15:
        [(VOTOutputSpeechComponent *)self _didStartSpeakingAction:v4];
        [(VOTOutputSpeechComponent *)self _notifyDidFinishSpeakingWithFakeRequestForEvent:v4];
LABEL_16:

        goto LABEL_22;
      }

      char v19 = v130;
    }

    goto LABEL_15;
  }
  id v27 = [v7 outputRequest];
  [v27 setStartedRequest:1];

  unsigned int v28 = VOTLogAudio();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109888;
    *(_DWORD *)v140 = v8;
    *(_WORD *)&v140[4] = 1024;
    *(_DWORD *)&v140[6] = v9;
    LOWORD(v141) = 1024;
    *(_DWORD *)((char *)&v141 + 2) = v10;
    HIWORD(v141) = 1024;
    *(_DWORD *)v142 = v14;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "VO muted for reason: speech muted: %d, vo is idle: %d, activity says so: %d, siri talking: %d", buf, 0x1Au);
  }

  if (([(TTSSpeechSynthesizer *)self->_synthesizer isSpeaking] & 1) == 0) {
    [(VOTOutputSpeechComponent *)self _notifyDidFinishSpeakingWithFakeRequestForEvent:v4];
  }
  [v7 setObject:&__kCFBooleanTrue forVariant:82];
LABEL_22:
}

- (id)_spokenTextForRequest:(id)a3 range:(_NSRange *)a4
{
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v25 = a3;
  double v6 = [v25 outputActions];
  id v7 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v31;
    unsigned int v10 = &stru_1001B7888;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (![v12 component])
        {
          uint64_t v13 = [v12 string];
          id v14 = [v13 length];

          if (v14)
          {
            if ([(__CFString *)v10 length])
            {
              uint64_t v15 = [(__CFString *)v10 stringByAppendingString:@", "];

              unsigned int v10 = (__CFString *)v15;
            }
            uint64_t v16 = [v12 string];
            uint64_t v17 = [(__CFString *)v10 stringByAppendingString:v16];

            unsigned int v10 = (__CFString *)v17;
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v8);
  }
  else
  {
    unsigned int v10 = &stru_1001B7888;
  }

  if (qword_1001EB898 != -1) {
    dispatch_once(&qword_1001EB898, &stru_1001B3EA8);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v34[0] = qword_1001EB880;
  v34[1] = qword_1001EB888;
  v34[2] = qword_1001EB890;
  id v18 = +[NSArray arrayWithObjects:v34 count:3];
  id v19 = [v18 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      id v22 = 0;
      float v23 = v10;
      do
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        unsigned int v10 = [(VOTOutputSpeechComponent *)self _processCaptionTextForMarkup:v23 regex:*(void *)(*((void *)&v26 + 1) + 8 * (void)v22) range:a4];

        id v22 = (char *)v22 + 1;
        float v23 = v10;
      }
      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v20);
  }

  return v10;
}

- (id)_processCaptionTextForMarkup:(id)a3 regex:(id)a4 range:(_NSRange *)a5
{
  id v7 = a3;
  id v23 = a4;
  id v8 = objc_msgSend(v23, "matchesInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
  NSUInteger location = a5->location;
  NSUInteger length = a5->length;
  unsigned __int8 v24 = v7;
  id v10 = [v7 mutableCopy];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ((unint64_t)[v16 range] < a5->location)
        {
          [v16 range];
          location -= v17;
        }
        id v18 = (char *)[v16 range] + v13;
        [v16 range];
        objc_msgSend(v10, "replaceCharactersInRange:withString:", v18, v19, &stru_1001B7888);
        [v16 range];
        v13 -= v20;
      }
      id v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }

  a5->NSUInteger location = location;
  a5->NSUInteger length = length;

  return v10;
}

- (void)_capVolumeForLanguage:(id)a3 volume:(float)a4
{
  if (!self->_isVolumeCapped)
  {
    unsigned int v6 = [a3 isEqualToString:@"zh-CN"];
    if (a4 > 0.94 && v6 != 0)
    {
      -[TTSSpeechSynthesizer setVolume:](self->_synthesizer, "setVolume:");
      self->_isVolumeCapped = 1;
    }
  }
}

- (void)_uncapVolume:(float)a3
{
  if (self->_isVolumeCapped)
  {
    -[TTSSpeechSynthesizer setVolume:](self->_synthesizer, "setVolume:");
    self->_isVolumeCapped = 0;
  }
}

- (void)_didStartSpeakingAction:(id)a3
{
  id v4 = a3;
  unint64_t v5 = VOTLogSpeech();
  if (os_signpost_enabled(v5))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VOT-BeginSpeaking", "", (uint8_t *)&v19, 2u);
  }

  id v7 = [v4 objectForIndex:14];
  if ([(id)VOTSharedWorkspace inPerformanceTestMode])
  {
    id v8 = +[AXPerformanceTestReportingServer server];
    uint64_t v9 = [v7 string];
    [v8 voiceOverDidSpeak:v9];
  }
  id v10 = [v7 outputRequest];
  id v11 = [v10 outputActions];
  id v12 = [v11 firstObject];

  if (v12 == v7)
  {
    if ([(id)VOTSharedWorkspace inUnitTestMode])
    {
      uint64_t v13 = [v7 outputRequest];
      uint64_t v14 = [v13 startBlock];

      if (v14)
      {
        uint64_t v15 = [v7 outputRequest];
        ((void (**)(void, void *))v14)[2](v14, v15);
      }
    }
    uint64_t v20 = 0;
    uint64_t v16 = objc_msgSend(v7, "outputRequest", 0);
    uint64_t v17 = [(VOTOutputSpeechComponent *)self _spokenTextForRequest:v16 range:&v19];

    id v18 = +[VOTDisplayManager displayManager];
    objc_msgSend(v18, "setVoiceOverCaptionText:withRange:language:voice:", v17, v19, v20, 0, 0);
  }
}

- (void)speechSynthesizer:(id)a3 didStartSpeakingRequest:(id)a4
{
  objc_getAssociatedObject(a4, &unk_1001EB778);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(VOTOutputSpeechComponent *)self _didStartSpeakingAction:v5];
}

- (void)speechSynthesizer:(id)a3 willSpeakRangeOfSpeechString:(_NSRange)a4 forRequest:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  _NSRange v41 = a4;
  id v40 = a3;
  id v9 = a5;
  id v10 = objc_getAssociatedObject(v9, &unk_1001EB778);
  id v11 = [v10 objectForIndex:14];
  uint64_t v37 = v10;
  uint64_t v12 = [v10 objectForIndex:13];
  uint64_t v13 = [v11 objectForVariant:18];
  uint64_t v14 = v13;
  if (v13) {
    objc_msgSend(v13, "speechSynthesizer:willSpeakRangeOfSpeechString:forRequest:", 0, location, length, v9);
  }
  long long v33 = v14;
  int v39 = v9;
  uint64_t v15 = [v11 objectForVariant:41];
  unsigned __int8 v16 = [v15 BOOLValue];

  if ((v16 & 1) == 0
    && self->_lastTimeSpeechStarted != -3061152000.0
    && CFAbsoluteTimeGetCurrent() - self->_lastTimeSpeechStarted > 7.0)
  {
    self->_lastTimeSpeechStarted = CFAbsoluteTimeGetCurrent();
    uint64_t v17 = +[VOTUserEventManager sharedInstance];
    [v17 userEventOccurred];
  }
  id v18 = [objc_allocWithZone((Class)AXIndexMap) init];
  [v18 setObject:v11 forIndex:11];
  [v18 setObject:v12 forIndex:13];
  uint64_t v19 = [v11 outputRequest];
  long long v32 = v18;
  -[VOTOutputComponent notifyRangeWillOutput:container:](self, "notifyRangeWillOutput:container:", location, length, v18);
  uint64_t v20 = [v19 outputActions];
  id v21 = [v20 indexOfObject:v11];

  id v35 = (void *)v12;
  char v36 = v11;
  uint64_t v34 = self;
  if (v21 && v21 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    for (unint64_t i = 0; i < (unint64_t)v21; ++i)
    {
      id v23 = [v19 outputActions];
      unsigned __int8 v24 = [v23 objectAtIndexedSubscript:i];

      id v25 = [v24 string];
      id v26 = [v25 length];

      if (v26)
      {
        long long v27 = [v24 string];
        id v28 = [v27 length];
        id v29 = objc_msgSend(@", ", "length");

        location += (NSUInteger)v28 + (void)v29;
      }
    }
  }
  v41.NSUInteger location = location;
  long long v30 = [(VOTOutputSpeechComponent *)v34 _spokenTextForRequest:v19 range:&v41];
  long long v31 = +[VOTDisplayManager displayManager];
  objc_msgSend(v31, "setVoiceOverCaptionText:withRange:language:voice:", v30, v41.location, v41.length, 0, 0);
}

- (void)speechSynthesizer:(id)a3 didFinishSpeakingRequest:(id)a4 successfully:(BOOL)a5 withError:(id)a6
{
  id v8 = a6;
  if (v8)
  {
    id v9 = a4;
    id v10 = [v9 languageCode];
    id v11 = +[TTSSpeechSynthesizer _speechVoiceForIdentifier:0 language:v10 footprint:1];

    uint64_t v12 = VOTLogSpeech();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10011D6D0((uint64_t)v8, v11);
    }

    uint64_t v13 = objc_getAssociatedObject(v9, &unk_1001EB778);

    id v14 = [v13 deepCopyWithZone:0];
    uint64_t v15 = [v14 objectForIndex:14];
    unsigned __int8 v16 = [v11 identifier];
    [v15 setObject:v16 forVariant:74];

    [(VOTOutputSpeechComponent *)self handleEvent:v14];
  }
  else
  {
    speechThread = self->_speechThread;
    id v11 = a4;
    [(SCRCThread *)speechThread performSelector:"_didFinishSpeaking:" onTarget:self cancelMask:0 count:1 objects:v11];
  }
}

- (void)_didFinishSpeaking:(id)a3
{
  id v4 = a3;
  id v5 = objc_getAssociatedObject(v4, &unk_1001EB778);
  unsigned int v6 = [v5 objectForIndex:14];
  id v7 = [v5 objectForIndex:13];
  self->_isPaused = 0;
  [(SCRCTargetSelectorTimer *)self->_stopSpeakingAfterLongPauseTimer cancel];
  id v8 = VOTLogSpeech();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10011D764(v6);
  }

  id v9 = +[AXSettings sharedInstance];
  [v9 voiceOverEffectiveSpeakingVolume];
  -[VOTOutputSpeechComponent _uncapVolume:](self, "_uncapVolume:");

  if (([v6 synchronization] & 2) != 0)
  {
    id v10 = [objc_allocWithZone((Class)AXIndexMap) init];
    [v10 setObject:v6 forIndex:11];
    [v10 setObject:v7 forIndex:13];
    id v11 = +[NSNumber numberWithBool:!self->_userStopped];
    [v10 setObject:v11 forIndex:20];

    [(VOTOutputComponent *)self notifyActionComplete:v10];
  }
  objc_setAssociatedObject(v4, &unk_1001EB778, 0, (void *)1);
  if (self->_currentRequest == v4)
  {
    self->_isSpeaking = 0;
    uint64_t v12 = +[VOTOutputManager outputManager];
    [v12 disableAudioSession:@"SPEECH"];
  }
  uint64_t v13 = objc_getAssociatedObject(v4, &unk_1001EB878);
  unsigned int v14 = [v13 BOOLValue];

  if (v14 && ![(VOTOutputSpeechComponent *)self isSpeaking])
  {
    uint64_t v15 = [(VOTOutputSpeechComponent *)self disableIdleTimerAssertion];
    [v15 invalidate];

    [(VOTOutputSpeechComponent *)self setDisableIdleTimerAssertion:0];
  }
}

- (BOOL)replacesCharacterAsPunctuation:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  id v4 = [(VOTOutputSpeechComponent *)self currentAllPunctuationTable];
  id v5 = [v4 objectForIndex:v3];
  LOBYTE(v3) = v5 != 0;

  return v3;
}

- (void)setShouldOutputToHearingAid:(BOOL)a3
{
}

- (TTSSpeechSynthesizer)synthesizer
{
  return self->_synthesizer;
}

- (BOOL)isSpeaking
{
  return self->_isSpeaking;
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (NSDictionary)emoticonReplacements
{
  return self->_emoticonReplacements;
}

- (void)setEmoticonReplacements:(id)a3
{
}

- (BSInvalidatable)disableIdleTimerAssertion
{
  return self->_disableIdleTimerAssertion;
}

- (void)setDisableIdleTimerAssertion:(id)a3
{
}

- (NSNumber)activityBasedAudioDucking
{
  return self->_activityBasedAudioDucking;
}

- (void)setActivityBasedAudioDucking:(id)a3
{
}

- (TTSSpeechSynthesizer)synthesizerForTelephonyMixin
{
  return self->_synthesizerForTelephonyMixin;
}

- (void)setSynthesizerForTelephonyMixin:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synthesizerForTelephonyMixin, 0);
  objc_storeStrong((id *)&self->_activityBasedAudioDucking, 0);
  objc_storeStrong((id *)&self->_disableIdleTimerAssertion, 0);
  objc_storeStrong((id *)&self->_emoticonReplacements, 0);
  objc_storeStrong((id *)&self->_synthesizer, 0);
  objc_storeStrong((id *)&self->_punctuationFallbacks, 0);
  objc_storeStrong((id *)&self->_lastSelectedLanguage, 0);
  objc_storeStrong((id *)&self->_fileSystemPunctuationGroup, 0);
  objc_storeStrong((id *)&self->_stopSpeakingAfterLongPauseTimer, 0);
  objc_storeStrong((id *)&self->_transientSubstitutions, 0);
  objc_storeStrong((id *)&self->_userSubstitutions, 0);
  objc_storeStrong(&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_currentActionVariants, 0);
  objc_storeStrong((id *)&self->_speechStatistics, 0);
  objc_storeStrong((id *)&self->_languageExceptions, 0);
  objc_storeStrong((id *)&self->_spokenLanguage, 0);
  objc_storeStrong((id *)&self->_noneTableOverrides, 0);
  objc_storeStrong((id *)&self->_specialPunctionTable, 0);
  objc_storeStrong((id *)&self->_selectedLanguageNoPunctuationTable, 0);
  objc_storeStrong((id *)&self->_noPunctuationTable, 0);
  objc_storeStrong((id *)&self->_selectedLanguageSomePunctuationTable, 0);
  objc_storeStrong((id *)&self->_somePunctuationTable, 0);
  objc_storeStrong((id *)&self->_selectedLanguageAllPunctuationTable, 0);
  objc_storeStrong((id *)&self->_allPunctuationTable, 0);

  objc_storeStrong((id *)&self->_speechThread, 0);
}

@end