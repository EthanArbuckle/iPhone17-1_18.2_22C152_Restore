@interface AVNowPlayingInfoController
+ (id)_avMediaCharacteristics;
+ (id)_mediaRemoteLanguageOptionCharacteristicForAVMediaCharacteristic:(id)a3;
+ (id)_mediaRemoteLanguageOptionCharacteristicsForAVMediaSelectionOption:(id)a3;
+ (void)_createMediaRemoteLanguageOptionGroupWithAVMediaSelectionOptions:(id)a3;
+ (void)_createMediaRemoteLanguageOptionWithAVMediaSelectionOption:(id)a3;
+ (void)sharedNowPlayingInfoControllerWithCompletion:(id)a3;
- (AVNowPlayingInfoController)init;
- (AVPlayerController)playerController;
- (AVPlayerController)playerControllerToActivateAfterDelay;
- (BOOL)isEnabled;
- (BOOL)isSuspended;
- (BOOL)requiresLinearPlayback;
- (NSString)overrideParentApplicationDisplayIdentifier;
- (NSTimer)startNowPlayingUpdatesTimer;
- (id)_availableLanguageOptions;
- (id)_createNowPlayingInfoFromPlaybackInfo:(id)a3;
- (id)_currentLanguageOptions;
- (id)_makeCommandsAndStatesDictionaryForPlayerController:(id)a3;
- (id)_makePlaybackInfoDictionary;
- (unsigned)_handleRemoteCommand:(unsigned int)a3 options:(id)a4;
- (void)_setNowPlayingInfoNeedsUpdate;
- (void)_updateNowPlayingInfo:(id)a3 commandsAndStates:(id)a4;
- (void)_updateNowPlayingInfoIfNeeded;
- (void)_updateRegisteredRemoteCommandEnabledStatesWithCommandsAndStates:(id)a3;
- (void)dealloc;
- (void)setEnabled:(BOOL)a3;
- (void)setOverrideParentApplicationDisplayIdentifier:(id)a3;
- (void)setPlayerController:(id)a3;
- (void)setPlayerControllerToActivateAfterDelay:(id)a3;
- (void)setRequiresLinearPlayback:(BOOL)a3;
- (void)setStartNowPlayingUpdatesTimer:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)startNowPlayingUpdatesForPlayerController:(id)a3 afterDelay:(double)a4;
- (void)stopNowPlayingUpdatesForPlayerController:(id)a3;
@end

@implementation AVNowPlayingInfoController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_startNowPlayingUpdatesTimer);
  objc_destroyWeak((id *)&self->_playerControllerToActivateAfterDelay);
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_overrideParentApplicationDisplayIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_keyValueObservationController, 0);

  objc_storeStrong(&self->_playerControllerCurrentTimeJumpedObserver, 0);
}

- (void)setStartNowPlayingUpdatesTimer:(id)a3
{
}

- (NSTimer)startNowPlayingUpdatesTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_startNowPlayingUpdatesTimer);

  return (NSTimer *)WeakRetained;
}

- (void)setPlayerControllerToActivateAfterDelay:(id)a3
{
}

- (AVPlayerController)playerControllerToActivateAfterDelay
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerControllerToActivateAfterDelay);

  return (AVPlayerController *)WeakRetained;
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (NSString)overrideParentApplicationDisplayIdentifier
{
  return self->_overrideParentApplicationDisplayIdentifier;
}

- (BOOL)requiresLinearPlayback
{
  return self->_requiresLinearPlayback;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (id)_currentLanguageOptions
{
  v2 = [(AVNowPlayingInfoController *)self playerController];
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [v2 currentAudioMediaSelectionOption];
  if (v4)
  {
    uint64_t v5 = [(id)objc_opt_class() _createMediaRemoteLanguageOptionWithAVMediaSelectionOption:v4];
    if (v5)
    {
      v6 = (void *)v5;
      [v3 addObject:v5];
    }
  }
  v7 = [v2 currentLegibleMediaSelectionOption];
  if (v7)
  {
    uint64_t v8 = [(id)objc_opt_class() _createMediaRemoteLanguageOptionWithAVMediaSelectionOption:v7];
    if (v8)
    {
      v9 = (void *)v8;
      [v3 addObject:v8];
    }
  }

  return v3;
}

- (id)_availableLanguageOptions
{
  v2 = [(AVNowPlayingInfoController *)self playerController];
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [v2 audioMediaSelectionOptions];
  if ([v4 count])
  {
    uint64_t v5 = [(id)objc_opt_class() _createMediaRemoteLanguageOptionGroupWithAVMediaSelectionOptions:v4];
    if (v5)
    {
      v6 = (void *)v5;
      [v3 addObject:v5];
    }
  }
  v7 = [v2 legibleMediaSelectionOptions];
  if ([v7 count])
  {
    uint64_t v8 = [(id)objc_opt_class() _createMediaRemoteLanguageOptionGroupWithAVMediaSelectionOptions:v7];
    if (v8)
    {
      v9 = (void *)v8;
      [v3 addObject:v8];
    }
  }

  return v3;
}

- (unsigned)_handleRemoteCommand:(unsigned int)a3 options:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(AVNowPlayingInfoController *)self isEnabled])
  {
    v7 = [(AVNowPlayingInfoController *)self playerController];
    if (v7)
    {
      unsigned int v8 = 0;
      switch(a3)
      {
        case 0u:
          v9 = _AVLog();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "Play command", buf, 2u);
          }

          if (![v7 canPlay]) {
            goto LABEL_85;
          }
          [v7 play:0];
          goto LABEL_102;
        case 1u:
          v10 = _AVLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B05B7000, v10, OS_LOG_TYPE_DEFAULT, "Pause command", buf, 2u);
          }

          if (![v7 canPause]) {
            goto LABEL_85;
          }
          [v7 pause:0];
          goto LABEL_102;
        case 2u:
          v11 = _AVLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B05B7000, v11, OS_LOG_TYPE_DEFAULT, "Toggle play pause command", buf, 2u);
          }

          if (![v7 canTogglePlayback]) {
            goto LABEL_85;
          }
          [v7 togglePlayback:0];
          goto LABEL_102;
        case 3u:
          v12 = _AVLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B05B7000, v12, OS_LOG_TYPE_DEFAULT, "Stop command", buf, 2u);
          }

          if ([v7 canPause])
          {
            [v7 pause:0];
            unsigned int v8 = 0;
          }
          else
          {
            unsigned int v8 = 2;
          }
          v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v20 postNotificationName:@"AVNowPlayingInfoControllerDidReceiveStopCommandEventNotification" object:self];
          goto LABEL_75;
        case 4u:
          v13 = _AVLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B05B7000, v13, OS_LOG_TYPE_DEFAULT, "Next track command", buf, 2u);
          }

          if ([v7 canSeekChapterForward])
          {
            [v7 seekChapterForward:0];
            goto LABEL_102;
          }
          if (![v7 canSeek]) {
            goto LABEL_85;
          }
          v39 = _AVLog();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v73 = 0x4024000000000000;
            _os_log_impl(&dword_1B05B7000, v39, OS_LOG_TYPE_DEFAULT, "Can not seek chapter forward; skipping forward %.2f seconds instead.",
              buf,
              0xCu);
          }

          [v7 seekByTimeInterval:10.0];
          v40 = [MEMORY[0x1E4F28EB8] defaultCenter];
          v70 = @"AVNowPlayingInfoSkipCommandDirectionKey";
          v41 = [NSNumber numberWithInt:1];
          v71 = v41;
          v42 = (void *)MEMORY[0x1E4F1C9E8];
          v43 = &v71;
          v44 = &v70;
          goto LABEL_84;
        case 5u:
          v14 = _AVLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B05B7000, v14, OS_LOG_TYPE_DEFAULT, "Previous track command", buf, 2u);
          }

          if ([v7 canSeekChapterBackward])
          {
            [v7 seekChapterBackward:0];
            goto LABEL_102;
          }
          if (![v7 canSeek])
          {
LABEL_85:
            unsigned int v8 = 2;
            goto LABEL_103;
          }
          v45 = _AVLog();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v73 = 0x4024000000000000;
            _os_log_impl(&dword_1B05B7000, v45, OS_LOG_TYPE_DEFAULT, "Can not seek chapter backward; skipping backward %.2f seconds instead.",
              buf,
              0xCu);
          }

          [v7 seekByTimeInterval:-10.0];
          v40 = [MEMORY[0x1E4F28EB8] defaultCenter];
          v68 = @"AVNowPlayingInfoSkipCommandDirectionKey";
          v41 = [NSNumber numberWithInt:0];
          v69 = v41;
          v42 = (void *)MEMORY[0x1E4F1C9E8];
          v43 = &v69;
          v44 = &v68;
LABEL_84:
          v46 = [v42 dictionaryWithObjects:v43 forKeys:v44 count:1];
          [v40 postNotificationName:@"AVNowPlayingInfoControllerDidReceiveSkipCommandEventNotification" object:self userInfo:v46];

          goto LABEL_102;
        case 8u:
          v15 = _AVLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B05B7000, v15, OS_LOG_TYPE_DEFAULT, "Begin fast forward command", buf, 2u);
          }

          if (![v7 hasContent]) {
            goto LABEL_85;
          }
          [v7 beginScanningForward:0];
          goto LABEL_102;
        case 9u:
          v16 = _AVLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B05B7000, v16, OS_LOG_TYPE_DEFAULT, "End fast forward command", buf, 2u);
          }

          [v7 endScanningForward:0];
          goto LABEL_102;
        case 0xAu:
          v17 = _AVLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B05B7000, v17, OS_LOG_TYPE_DEFAULT, "Begin rewind command", buf, 2u);
          }

          if (![v7 hasContent]) {
            goto LABEL_85;
          }
          [v7 beginScanningBackward:0];
          goto LABEL_102;
        case 0xBu:
          v18 = _AVLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B05B7000, v18, OS_LOG_TYPE_DEFAULT, "End rewind command", buf, 2u);
          }

          [v7 endScanningBackward:0];
          goto LABEL_102;
        case 0x11u:
          v19 = _AVLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B05B7000, v19, OS_LOG_TYPE_DEFAULT, "Skip forward command", buf, 2u);
          }

          v20 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F777A0]];
          unsigned int v8 = 2;
          if (![v7 canSeek] || !v20) {
            goto LABEL_75;
          }
          [v20 doubleValue];
          objc_msgSend(v7, "seekByTimeInterval:");
          v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
          v66 = @"AVNowPlayingInfoSkipCommandDirectionKey";
          v22 = [NSNumber numberWithInt:1];
          v67 = v22;
          v23 = (void *)MEMORY[0x1E4F1C9E8];
          v24 = &v67;
          v25 = &v66;
          goto LABEL_53;
        case 0x12u:
          v26 = _AVLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B05B7000, v26, OS_LOG_TYPE_DEFAULT, "Skip backward command", buf, 2u);
          }

          v20 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F777A0]];
          unsigned int v8 = 2;
          if (![v7 canSeek] || !v20) {
            goto LABEL_75;
          }
          [v20 doubleValue];
          [v7 seekByTimeInterval:-v27];
          v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
          v64 = @"AVNowPlayingInfoSkipCommandDirectionKey";
          v22 = [NSNumber numberWithInt:0];
          v65 = v22;
          v23 = (void *)MEMORY[0x1E4F1C9E8];
          v24 = &v65;
          v25 = &v64;
LABEL_53:
          v28 = [v23 dictionaryWithObjects:v24 forKeys:v25 count:1];
          [v21 postNotificationName:@"AVNowPlayingInfoControllerDidReceiveSkipCommandEventNotification" object:self userInfo:v28];

          unsigned int v8 = 0;
LABEL_75:

          goto LABEL_103;
        case 0x13u:
          v29 = _AVLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B05B7000, v29, OS_LOG_TYPE_DEFAULT, "Change playback rate command", buf, 2u);
          }

          v30 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F776F8]];
          if ([v7 canTogglePlayback])
          {
            [v30 doubleValue];
            objc_msgSend(v7, "setRate:");
LABEL_63:
            unsigned int v8 = 0;
          }
          else
          {
            unsigned int v8 = 2;
          }
          goto LABEL_112;
        case 0x18u:
          v31 = _AVLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B05B7000, v31, OS_LOG_TYPE_DEFAULT, "Seek to playback position command", buf, 2u);
          }

          v30 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F776D8]];
          unsigned int v8 = 2;
          if (![v7 canSeek] || !v30) {
            goto LABEL_112;
          }
          [v30 doubleValue];
          objc_msgSend(v7, "seekToTime:");
          goto LABEL_63;
        case 0x1Bu:
          v32 = _AVLog();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B05B7000, v32, OS_LOG_TYPE_DEFAULT, "Enable language option command", buf, 2u);
          }

          [v6 objectForKeyedSubscript:*MEMORY[0x1E4F776D0]];
          uint64_t v33 = MRLanguageOptionCreateFromExternalRepresentation();
          v30 = MRLanguageOptionCopyIdentifier();
          int v34 = MEMORY[0x1B3E95AA0](v33);
          if (v34 == 1) {
            [v7 legibleMediaSelectionOptions];
          }
          else {
            [v7 audioMediaSelectionOptions];
          }
          long long v61 = 0u;
          long long v62 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          id v47 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v48 = [v47 countByEnumeratingWithState:&v59 objects:v63 count:16];
          if (!v48)
          {
            unsigned int v8 = 2;
            id v55 = v47;
            goto LABEL_110;
          }
          uint64_t v49 = v48;
          int v58 = v34;
          uint64_t v50 = *(void *)v60;
          break;
        case 0x1Cu:
          v35 = _AVLog();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B05B7000, v35, OS_LOG_TYPE_DEFAULT, "Disable language option command", buf, 2u);
          }

          [v6 objectForKeyedSubscript:*MEMORY[0x1E4F776D0]];
          uint64_t v36 = MRLanguageOptionCreateFromExternalRepresentation();
          int v37 = MEMORY[0x1B3E95AA0]();
          if (!v36) {
            goto LABEL_85;
          }
          if (v37 == 1)
          {
            v38 = objc_msgSend(MEMORY[0x1E4F16540], "avkit_offOption");
            [v7 setCurrentLegibleMediaSelectionOption:v38];
          }
          else
          {
            [v7 setCurrentAudioMediaSelectionOption:0];
          }
          goto LABEL_102;
        default:
          goto LABEL_103;
      }
LABEL_90:
      uint64_t v51 = 0;
      while (1)
      {
        if (*(void *)v60 != v50) {
          objc_enumerationMutation(v47);
        }
        v52 = *(void **)(*((void *)&v59 + 1) + 8 * v51);
        v53 = [v52 mediaRemoteIdentifier];
        char v54 = [v53 isEqualToString:v30];

        if (v54) {
          break;
        }
        if (v49 == ++v51)
        {
          uint64_t v49 = [v47 countByEnumeratingWithState:&v59 objects:v63 count:16];
          if (!v49)
          {
            unsigned int v8 = 2;
            id v55 = v47;
            goto LABEL_110;
          }
          goto LABEL_90;
        }
      }
      id v55 = v52;

      if (!v55)
      {
        unsigned int v8 = 2;
        goto LABEL_111;
      }
      if (v58 == 1) {
        [v7 setCurrentLegibleMediaSelectionOption:v55];
      }
      else {
        [v7 setCurrentAudioMediaSelectionOption:v55];
      }
      unsigned int v8 = 0;
LABEL_110:

LABEL_111:
LABEL_112:
    }
    else
    {
LABEL_102:
      unsigned int v8 = 0;
    }
LABEL_103:
  }
  else
  {
    unsigned int v8 = 0;
  }
  v56 = _AVLog();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v73 = v8;
    _os_log_impl(&dword_1B05B7000, v56, OS_LOG_TYPE_DEFAULT, "Remote Command Status: %ld", buf, 0xCu);
  }

  return v8;
}

- (void)_updateRegisteredRemoteCommandEnabledStatesWithCommandsAndStates:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    backgroundQueue = self->_backgroundQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__AVNowPlayingInfoController__updateRegisteredRemoteCommandEnabledStatesWithCommandsAndStates___block_invoke;
    block[3] = &unk_1E5FC3D18;
    block[4] = self;
    id v21 = v4;
    dispatch_async(backgroundQueue, block);
  }
  else
  {
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = [v4 allKeys];
    uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      uint64_t v10 = *MEMORY[0x1E4F772A0];
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
          v13 = (const void *)MRMediaRemoteCommandInfoCreate();
          [v12 unsignedIntValue];
          MRMediaRemoteCommandInfoSetCommand();
          v14 = [v4 objectForKeyedSubscript:v12];
          [v14 BOOLValue];
          MRMediaRemoteCommandInfoSetEnabled();

          if ([v12 unsignedIntegerValue] == 17 || objc_msgSend(v12, "unsignedIntegerValue") == 18)
          {
            uint64_t v22 = v10;
            v23 = &unk_1F094A280;
            [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
            MRMediaRemoteCommandInfoSetOptions();
          }
          CFArrayAppendValue(Mutable, v13);
          CFRelease(v13);
          ++v11;
        }
        while (v8 != v11);
        uint64_t v8 = [obj countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v8);
    }

    MRMediaRemoteGetLocalOrigin();
    MRMediaRemoteSetSupportedCommands();
    CFRelease(Mutable);
  }
}

uint64_t __95__AVNowPlayingInfoController__updateRegisteredRemoteCommandEnabledStatesWithCommandsAndStates___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateRegisteredRemoteCommandEnabledStatesWithCommandsAndStates:*(void *)(a1 + 40)];
}

- (id)_makeCommandsAndStatesDictionaryForPlayerController:(id)a3
{
  v55[16] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = [(AVNowPlayingInfoController *)self requiresLinearPlayback];
  v54[0] = &unk_1F0949DD0;
  v53 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "canPause"));
  v55[0] = v53;
  v54[1] = &unk_1F0949DE8;
  v52 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "canPlay"));
  v55[1] = v52;
  v54[2] = &unk_1F0949E00;
  uint64_t v51 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "canPause"));
  v55[2] = v51;
  v54[3] = &unk_1F0949E18;
  uint64_t v50 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "canTogglePlayback"));
  v55[3] = v50;
  v54[4] = &unk_1F0949E30;
  uint64_t v7 = NSNumber;
  if (v6) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = [v5 hasContent];
  }
  uint64_t v49 = [v7 numberWithInt:v8];
  v55[4] = v49;
  v54[5] = &unk_1F0949E48;
  uint64_t v9 = NSNumber;
  if (v6) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = [v5 hasContent];
  }
  uint64_t v48 = [v9 numberWithInt:v10];
  v55[5] = v48;
  v54[6] = &unk_1F0949E60;
  uint64_t v11 = NSNumber;
  if (v6) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = [v5 hasContent];
  }
  id v47 = [v11 numberWithInt:v12];
  v55[6] = v47;
  v54[7] = &unk_1F0949E78;
  v13 = NSNumber;
  if (v6) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = [v5 hasContent];
  }
  v46 = [v13 numberWithInt:v14];
  v55[7] = v46;
  v54[8] = &unk_1F0949E90;
  v15 = NSNumber;
  if (v6) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = [v5 canTogglePlayback];
  }
  v45 = [v15 numberWithInt:v16];
  v55[8] = v45;
  v54[9] = &unk_1F0949EA8;
  long long v17 = NSNumber;
  if (v6) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = [v5 canSeek];
  }
  v44 = [v17 numberWithInt:v18];
  v55[9] = v44;
  v54[10] = &unk_1F0949EC0;
  long long v19 = NSNumber;
  if (v6)
  {
    uint64_t v20 = 0;
  }
  else if ([v5 canSeekChapterForward])
  {
    uint64_t v20 = 1;
  }
  else
  {
    uint64_t v20 = [v5 canScanForward];
  }
  v43 = [v19 numberWithInt:v20];
  v55[10] = v43;
  v54[11] = &unk_1F0949ED8;
  id v21 = NSNumber;
  if (v6)
  {
    uint64_t v22 = 0;
  }
  else if ([v5 canSeekChapterBackward])
  {
    uint64_t v22 = 1;
  }
  else
  {
    uint64_t v22 = [v5 canScanBackward];
  }
  v42 = [v21 numberWithInt:v22];
  v55[11] = v42;
  v54[12] = &unk_1F0949EF0;
  v23 = NSNumber;
  if (v6) {
    uint64_t v24 = 0;
  }
  else {
    uint64_t v24 = [v5 canSeek];
  }
  v41 = [v23 numberWithInt:v24];
  v55[12] = v41;
  v54[13] = &unk_1F0949F08;
  uint64_t v25 = NSNumber;
  if (v6) {
    uint64_t v26 = 0;
  }
  else {
    uint64_t v26 = [v5 canSeek];
  }
  double v27 = [v25 numberWithInt:v26];
  v55[13] = v27;
  v54[14] = &unk_1F0949F20;
  v28 = NSNumber;
  v29 = [v5 audioMediaSelectionOptions];
  uint64_t v30 = [v29 count];
  if (v30)
  {
    BOOL v31 = 1;
  }
  else
  {
    v40 = [v5 legibleMediaSelectionOptions];
    BOOL v31 = [v40 count] != 0;
  }
  v32 = [v28 numberWithInt:v31];
  v55[14] = v32;
  v54[15] = &unk_1F0949F38;
  uint64_t v33 = NSNumber;
  int v34 = [v5 audioMediaSelectionOptions];
  uint64_t v35 = [v34 count];
  if (v35)
  {
    BOOL v36 = 1;
  }
  else
  {
    v3 = [v5 legibleMediaSelectionOptions];
    BOOL v36 = [v3 count] != 0;
  }
  int v37 = [v33 numberWithInt:v36];
  v55[15] = v37;
  v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:16];

  if (!v35) {
  if (!v30)
  }

  return v38;
}

- (id)_makePlaybackInfoDictionary
{
  if ([(AVNowPlayingInfoController *)self isEnabled])
  {
    v3 = [(AVNowPlayingInfoController *)self playerController];

    if (v3)
    {
      v3 = [MEMORY[0x1E4F1CA60] dictionary];
      id v4 = [(AVNowPlayingInfoController *)self playerController];
      if ([v4 hasContent])
      {
        id v5 = [v4 metadata];
        uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F15C90]];
        if (v6) {
          [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F77430]];
        }
        uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F15C98]];
        if (v7) {
          [v3 setObject:v7 forKeyedSubscript:@"AVNowPlayingInfoMetadataCommonKeyArtworkImage"];
        }
        [v4 contentDurationWithinEndTimes];
        uint64_t v8 = objc_msgSend(NSNumber, "numberWithDouble:");
        [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F774C8]];

        uint64_t v9 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F15CD0]];
        if (v9) {
          [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F775F0]];
        }
        id v10 = (id)*MEMORY[0x1E4F77628];
        BOOL v36 = (void *)v6;
        if (([v4 hasEnabledVideo] & 1) == 0 && objc_msgSend(v4, "hasEnabledAudio"))
        {
          id v11 = (id)*MEMORY[0x1E4F77620];

          id v10 = v11;
        }
        [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F77550]];
        uint64_t v12 = [(AVNowPlayingInfoController *)self _availableLanguageOptions];
        uint64_t v13 = [v12 count];

        if (v13)
        {
          [(AVNowPlayingInfoController *)self _availableLanguageOptions];
          ExternalRepresentation = (const void *)MRLanguageOptionGroupsCreateExternalRepresentation();
          [v3 setObject:ExternalRepresentation forKeyedSubscript:*MEMORY[0x1E4F77470]];
          CFRelease(ExternalRepresentation);
        }
        v15 = [(AVNowPlayingInfoController *)self _currentLanguageOptions];
        uint64_t v16 = [v15 count];

        if (v16)
        {
          [(AVNowPlayingInfoController *)self _currentLanguageOptions];
          long long v17 = (const void *)MRLanguageOptionsCreateExternalRepresentation();
          [v3 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F774A0]];
          CFRelease(v17);
        }
        uint64_t v18 = NSNumber;
        long long v19 = [v4 timing];
        [v19 currentValue];
        double v21 = v20;
        [v4 minTime];
        v23 = [v18 numberWithDouble:v21 - v22];
        [v3 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F774D0]];

        uint64_t v24 = NSNumber;
        [v4 rate];
        uint64_t v25 = objc_msgSend(v24, "numberWithDouble:");
        [v3 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F77560]];

        uint64_t v26 = [v4 currentDate];
        [v3 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F774A8]];

        double v27 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "hasLiveStreamingContent"));
        [v3 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F77508]];

        v28 = [(AVNowPlayingInfoController *)self playerController];
        v29 = [v28 player];
        uint64_t v30 = [v29 currentItem];
        BOOL v31 = [v30 externalMetadata];

        if ([v31 count])
        {
          __57__AVNowPlayingInfoController__makePlaybackInfoDictionary__block_invoke(v3, (uint64_t)v31, @"avkt/ExternalContentIdentifier", *MEMORY[0x1E4F774E0]);
          __57__AVNowPlayingInfoController__makePlaybackInfoDictionary__block_invoke(v3, (uint64_t)v31, @"avkt/ExternalUserProfileIdentifier", *MEMORY[0x1E4F774E8]);
          __57__AVNowPlayingInfoController__makePlaybackInfoDictionary__block_invoke(v3, (uint64_t)v31, @"avkt/ServiceIdentifier", *MEMORY[0x1E4F775B0]);
          __57__AVNowPlayingInfoController__makePlaybackInfoDictionary__block_invoke(v3, (uint64_t)v31, @"avkt/iTunesStoreIdentifier", *MEMORY[0x1E4F77638]);
          __57__AVNowPlayingInfoController__makePlaybackInfoDictionary__block_invoke(v3, (uint64_t)v31, @"avkt/BrandIdentifier", *MEMORY[0x1E4F77478]);
          __57__AVNowPlayingInfoController__makePlaybackInfoDictionary__block_invoke(v3, (uint64_t)v31, @"avkt/PlaybackProgress", *MEMORY[0x1E4F77558]);
          __57__AVNowPlayingInfoController__makePlaybackInfoDictionary__block_invoke(v3, (uint64_t)v31, *MEMORY[0x1E4F15C80], *MEMORY[0x1E4F775F0]);
          v32 = [MEMORY[0x1E4F16558] metadataItemsFromArray:v31 filteredByIdentifier:*MEMORY[0x1E4F15C40]];
          uint64_t v33 = [v32 firstObject];

          int v34 = [v33 dataValue];
          if (v34) {
            [v3 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F77440]];
          }
        }
      }
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __57__AVNowPlayingInfoController__makePlaybackInfoDictionary__block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v10 = a1;
  uint64_t v7 = [MEMORY[0x1E4F16558] metadataItemsFromArray:a2 filteredByIdentifier:a3];
  uint64_t v8 = [v7 firstObject];
  uint64_t v9 = [v8 stringValue];

  if (v9) {
    [v10 setObject:v9 forKeyedSubscript:a4];
  }
}

- (void)_updateNowPlayingInfo:(id)a3 commandsAndStates:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([v7 count]) {
    MRMediaRemoteSetCanBeNowPlayingApplication();
  }
  MRMediaRemoteSetNowPlayingInfoWithMergePolicy();
  [(AVNowPlayingInfoController *)self _updateRegisteredRemoteCommandEnabledStatesWithCommandsAndStates:v6];
}

- (void)_updateNowPlayingInfoIfNeeded
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL nowPlayingInfoNeedsUpdate = self->_nowPlayingInfoNeedsUpdate;
    BOOL suspended = self->_suspended;
    BOOL enabled = self->_enabled;
    *(_DWORD *)buf = 67109632;
    BOOL v17 = nowPlayingInfoNeedsUpdate;
    __int16 v18 = 1024;
    BOOL v19 = suspended;
    __int16 v20 = 1024;
    BOOL v21 = enabled;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "Update now playing info:   needed: %d   suspended: %d   enabled: %d", buf, 0x14u);
  }

  if (self->_nowPlayingInfoNeedsUpdate)
  {
    self->_BOOL nowPlayingInfoNeedsUpdate = 0;
    if (![(AVNowPlayingInfoController *)self isSuspended])
    {
      kdebug_trace();
      self->_BOOL nowPlayingInfoNeedsUpdate = 0;
      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__updateNowPlayingInfoIfNeeded object:0];
      id v7 = [(AVNowPlayingInfoController *)self _makePlaybackInfoDictionary];
      if ([(AVNowPlayingInfoController *)self isEnabled])
      {
        uint64_t v8 = [(AVNowPlayingInfoController *)self playerController];
        uint64_t v9 = [(AVNowPlayingInfoController *)self _makeCommandsAndStatesDictionaryForPlayerController:v8];
      }
      else
      {
        uint64_t v9 = [(AVNowPlayingInfoController *)self _makeCommandsAndStatesDictionaryForPlayerController:0];
      }
      backgroundQueue = self->_backgroundQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59__AVNowPlayingInfoController__updateNowPlayingInfoIfNeeded__block_invoke;
      block[3] = &unk_1E5FC3B98;
      block[4] = self;
      id v14 = v7;
      id v15 = v9;
      id v11 = v9;
      id v12 = v7;
      dispatch_async(backgroundQueue, block);
      kdebug_trace();
    }
  }
}

void __59__AVNowPlayingInfoController__updateNowPlayingInfoIfNeeded__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _createNowPlayingInfoFromPlaybackInfo:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateNowPlayingInfo:v2 commandsAndStates:*(void *)(a1 + 48)];
}

- (void)_setNowPlayingInfoNeedsUpdate
{
  if (!self->_nowPlayingInfoNeedsUpdate && ![(AVNowPlayingInfoController *)self isSuspended])
  {
    self->_BOOL nowPlayingInfoNeedsUpdate = 1;
    [(AVNowPlayingInfoController *)self performSelector:sel__updateNowPlayingInfoIfNeeded withObject:0 afterDelay:0.0];
  }
}

- (id)_createNowPlayingInfoFromPlaybackInfo:(id)a3
{
  if (a3)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:");
    id v4 = [v3 objectForKeyedSubscript:@"AVNowPlayingInfoMetadataCommonKeyArtworkImage"];
    if (v4)
    {
      uint64_t v5 = *MEMORY[0x1E4F77440];
      id v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F77440]];

      if (!v6)
      {
        id v7 = UIImagePNGRepresentation(v4);
        if (v7) {
          [v3 setObject:v7 forKeyedSubscript:v5];
        }
      }
      [v3 removeObjectForKey:@"AVNowPlayingInfoMetadataCommonKeyArtworkImage"];
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)stopNowPlayingUpdatesForPlayerController:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    id v11 = "-[AVNowPlayingInfoController stopNowPlayingUpdatesForPlayerController:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s playerController: %@", (uint8_t *)&v10, 0x16u);
  }

  if (!v4
    || ([(AVNowPlayingInfoController *)self playerController],
        id v6 = (id)objc_claimAutoreleasedReturnValue(),
        v6,
        v6 == v4))
  {
    [(AVNowPlayingInfoController *)self setPlayerController:0];
  }
  id v7 = [(AVNowPlayingInfoController *)self playerControllerToActivateAfterDelay];
  int v8 = [v4 isEqual:v7];

  if (v8)
  {
    uint64_t v9 = [(AVNowPlayingInfoController *)self startNowPlayingUpdatesTimer];
    [v9 invalidate];

    [(AVNowPlayingInfoController *)self setPlayerControllerToActivateAfterDelay:0];
  }
}

- (void)startNowPlayingUpdatesForPlayerController:(id)a3 afterDelay:(double)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _AVLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v20 = "-[AVNowPlayingInfoController startNowPlayingUpdatesForPlayerController:afterDelay:]";
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s playerController: %@", buf, 0x16u);
  }

  int v8 = [(AVNowPlayingInfoController *)self playerController];
  if ([v6 isEqual:v8])
  {
  }
  else
  {
    uint64_t v9 = [(AVNowPlayingInfoController *)self playerControllerToActivateAfterDelay];
    char v10 = [v6 isEqual:v9];

    if ((v10 & 1) == 0)
    {
      [(AVNowPlayingInfoController *)self setPlayerControllerToActivateAfterDelay:v6];
      id v11 = [(AVNowPlayingInfoController *)self playerController];
      [(AVNowPlayingInfoController *)self stopNowPlayingUpdatesForPlayerController:v11];

      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, v6);
      __int16 v12 = [(AVNowPlayingInfoController *)self startNowPlayingUpdatesTimer];
      [v12 invalidate];

      id v13 = (void *)MEMORY[0x1E4F1CB00];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __83__AVNowPlayingInfoController_startNowPlayingUpdatesForPlayerController_afterDelay___block_invoke;
      v15[3] = &unk_1E5FC23D0;
      objc_copyWeak(&v16, (id *)buf);
      objc_copyWeak(&v17, &location);
      uint64_t v14 = [v13 scheduledTimerWithTimeInterval:0 repeats:v15 block:a4];
      [(AVNowPlayingInfoController *)self setStartNowPlayingUpdatesTimer:v14];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __83__AVNowPlayingInfoController_startNowPlayingUpdatesForPlayerController_afterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained playerControllerToActivateAfterDelay];
  int v4 = [v3 isEqual:v2];

  if (v4)
  {
    [WeakRetained setPlayerController:v2];
    [WeakRetained setPlayerControllerToActivateAfterDelay:0];
  }
}

- (void)setRequiresLinearPlayback:(BOOL)a3
{
  if (self->_requiresLinearPlayback != a3)
  {
    self->_requiresLinearPlayback = a3;
    [(AVNowPlayingInfoController *)self _setNowPlayingInfoNeedsUpdate];
  }
}

- (void)setOverrideParentApplicationDisplayIdentifier:(id)a3
{
  id v8 = a3;
  if (!-[NSString isEqualToString:](self->_overrideParentApplicationDisplayIdentifier, "isEqualToString:"))
  {
    int v4 = (NSString *)[v8 copy];
    overrideParentApplicationDisplayIdentifier = self->_overrideParentApplicationDisplayIdentifier;
    self->_overrideParentApplicationDisplayIdentifier = v4;

    MRMediaRemoteGetLocalOrigin();
    if (self->_overrideParentApplicationDisplayIdentifier)
    {
      MRMediaRemoteSetParentApplication();
    }
    else
    {
      id v6 = [MEMORY[0x1E4F28B50] mainBundle];
      id v7 = [v6 bundleIdentifier];
      MRMediaRemoteSetParentApplication();
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_BOOL enabled = a3;
    [(AVNowPlayingInfoController *)self _setNowPlayingInfoNeedsUpdate];
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setSuspended:(BOOL)a3
{
  if (self->_suspended != a3)
  {
    self->_BOOL suspended = a3;
    if (!a3) {
      [(AVNowPlayingInfoController *)self _setNowPlayingInfoNeedsUpdate];
    }
  }
}

- (void)setPlayerController:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (AVPlayerController *)a3;
  if (self->_playerController != v5)
  {
    id v6 = _AVLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v20 = "-[AVNowPlayingInfoController setPlayerController:]";
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s playerController: %@", buf, 0x16u);
    }

    [(AVObservationController *)self->_keyValueObservationController stopAllObservation];
    objc_storeStrong((id *)&self->_playerController, a3);
    if (self->_playerController)
    {
      v18[0] = @"playerController.hasContent";
      v18[1] = @"playerController.contentDuration";
      v18[2] = @"playerController.playing";
      v18[3] = @"playerController.rate";
      v18[4] = @"playerController.metadata";
      v18[5] = @"playerController.hasLiveStreamingContent";
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:6];
      id v8 = [(AVObservationController *)self->_keyValueObservationController startObserving:self keyPaths:v7 observationHandler:&__block_literal_global_50];
      keyValueObservationController = self->_keyValueObservationController;
      char v10 = [(AVNowPlayingInfoController *)self playerController];
      id v11 = [v10 player];
      __int16 v12 = [v11 currentItem];
      [(AVObservationController *)keyValueObservationController startObservingNotificationForName:@"AVPlayerItemAVKitDataDidChangeNotification" object:v12 notificationCenter:0 observationHandler:&__block_literal_global_53];

      [(AVObservationController *)self->_keyValueObservationController startObservingNotificationForName:@"AVPlayerControllerSelectedMediaOptionDidChangeNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_55];
      v17[0] = @"playerController.canPause";
      v17[1] = @"playerController.canPlay";
      v17[2] = @"playerController.canTogglePlayback";
      v17[3] = @"playerController.canSeek";
      v17[4] = @"playerController.canScanForward";
      v17[5] = @"playerController.canScanBackward";
      v17[6] = @"playerController.canSeekChapterForward";
      v17[7] = @"playerController.canSeekChapterBackward";
      v17[8] = @"playerController.audioMediaSelectionOptions";
      v17[9] = @"playerController.legibleMediaSelectionOptions";
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:10];
      uint64_t v14 = self->_keyValueObservationController;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __50__AVNowPlayingInfoController_setPlayerController___block_invoke_4;
      v16[3] = &unk_1E5FC23A8;
      v16[4] = self;
      id v15 = [(AVObservationController *)v14 startObserving:self keyPaths:v13 observationHandler:v16];
    }
    [(AVNowPlayingInfoController *)self _setNowPlayingInfoNeedsUpdate];
  }
}

void __50__AVNowPlayingInfoController_setPlayerController___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 isEnabled] && (objc_msgSend(*(id *)(a1 + 32), "isSuspended") & 1) == 0)
  {
    v3 = [v5 playerController];
    int v4 = [v5 _makeCommandsAndStatesDictionaryForPlayerController:v3];

    [v5 _updateRegisteredRemoteCommandEnabledStatesWithCommandsAndStates:v4];
  }
}

void __50__AVNowPlayingInfoController_setPlayerController___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v5 = [a4 object];
  id v6 = [v7 playerController];

  if (v5 == v6) {
    [v7 _setNowPlayingInfoNeedsUpdate];
  }
}

uint64_t __50__AVNowPlayingInfoController_setPlayerController___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _setNowPlayingInfoNeedsUpdate];
}

uint64_t __50__AVNowPlayingInfoController_setPlayerController___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setNowPlayingInfoNeedsUpdate];
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_commandHandlerIdentifier) {
    MRMediaRemoteRemoveCommandHandlerBlock();
  }
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_playerControllerCurrentTimeJumpedObserver];

  [(AVObservationController *)self->_keyValueObservationController stopAllObservation];
  keyValueObservationController = self->_keyValueObservationController;
  self->_keyValueObservationController = 0;

  [(AVNowPlayingInfoController *)self _updateNowPlayingInfo:0 commandsAndStates:0];
  id v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v8 = "-[AVNowPlayingInfoController dealloc]";
    __int16 v9 = 1024;
    int v10 = 129;
    __int16 v11 = 2048;
    __int16 v12 = self;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  v6.receiver = self;
  v6.super_class = (Class)AVNowPlayingInfoController;
  [(AVNowPlayingInfoController *)&v6 dealloc];
}

- (AVNowPlayingInfoController)init
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v18 = "-[AVNowPlayingInfoController init]";
    __int16 v19 = 1024;
    int v20 = 83;
    __int16 v21 = 2048;
    id v22 = self;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  v16.receiver = self;
  v16.super_class = (Class)AVNowPlayingInfoController;
  int v4 = [(AVNowPlayingInfoController *)&v16 init];
  id v5 = v4;
  if (v4)
  {
    v4->_BOOL suspended = 0;
    v4->_BOOL enabled = 1;
    objc_super v6 = [[AVObservationController alloc] initWithOwner:v4];
    keyValueObservationController = v5->_keyValueObservationController;
    v5->_keyValueObservationController = v6;

    objc_initWeak((id *)buf, v5);
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    __int16 v9 = [MEMORY[0x1E4F28F08] mainQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __34__AVNowPlayingInfoController_init__block_invoke;
    v14[3] = &unk_1E5FC3168;
    objc_copyWeak(&v15, (id *)buf);
    uint64_t v10 = [v8 addObserverForName:@"AVPlayerControllerCurrentTimeJumpedNotification" object:0 queue:v9 usingBlock:v14];
    id playerControllerCurrentTimeJumpedObserver = v5->_playerControllerCurrentTimeJumpedObserver;
    v5->_id playerControllerCurrentTimeJumpedObserver = (id)v10;

    objc_copyWeak(&v13, (id *)buf);
    v5->_commandHandlerIdentifier = (void *)MRMediaRemoteAddCommandHandlerBlock();
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  return v5;
}

void __34__AVNowPlayingInfoController_init__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 object];
  int v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);
  objc_super v6 = [WeakRetained playerController];

  if (v3 == v6)
  {
    id v7 = objc_loadWeakRetained(v4);
    [v7 _setNowPlayingInfoNeedsUpdate];
  }
}

uint64_t __34__AVNowPlayingInfoController_init__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v6 = WeakRetained;
  if (WeakRetained) {
    uint64_t v7 = [WeakRetained _handleRemoteCommand:a2 options:a3];
  }
  else {
    uint64_t v7 = 2;
  }
  id v8 = [NSNumber numberWithUnsignedInt:v7];
  v11[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  return v9;
}

+ (id)_mediaRemoteLanguageOptionCharacteristicForAVMediaCharacteristic:(id)a3
{
  uint64_t v3 = _mediaRemoteLanguageOptionCharacteristicForAVMediaCharacteristic____once;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_mediaRemoteLanguageOptionCharacteristicForAVMediaCharacteristic____once, &__block_literal_global_137_4370);
  }
  id v5 = [(id)_mediaRemoteLanguageOptionCharacteristicForAVMediaCharacteristic____mediaCharacteristicMapping objectForKey:v4];

  return v5;
}

void __95__AVNowPlayingInfoController__mediaRemoteLanguageOptionCharacteristicForAVMediaCharacteristic___block_invoke()
{
  void v17[10] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F15B60];
  uint64_t v1 = *MEMORY[0x1E4F771E0];
  v16[0] = *MEMORY[0x1E4F771E8];
  v16[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F15B58];
  v17[0] = v0;
  v17[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F15B20];
  uint64_t v4 = *MEMORY[0x1E4F771F8];
  v16[2] = *MEMORY[0x1E4F771B8];
  v16[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4F15B90];
  v17[2] = v3;
  v17[3] = v5;
  uint64_t v6 = *MEMORY[0x1E4F15B30];
  uint64_t v7 = *MEMORY[0x1E4F771D8];
  v16[4] = *MEMORY[0x1E4F771C0];
  void v16[5] = v7;
  uint64_t v8 = *MEMORY[0x1E4F15B48];
  v17[4] = v6;
  v17[5] = v8;
  uint64_t v9 = *MEMORY[0x1E4F15B38];
  uint64_t v10 = *MEMORY[0x1E4F771F0];
  v16[6] = *MEMORY[0x1E4F771C8];
  v16[7] = v10;
  uint64_t v11 = *MEMORY[0x1E4F15B78];
  v17[6] = v9;
  v17[7] = v11;
  uint64_t v12 = *MEMORY[0x1E4F77200];
  v16[8] = *MEMORY[0x1E4F771D0];
  v16[9] = v12;
  uint64_t v13 = *MEMORY[0x1E4F15BA0];
  v17[8] = *MEMORY[0x1E4F15B40];
  v17[9] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:10];
  id v15 = (void *)_mediaRemoteLanguageOptionCharacteristicForAVMediaCharacteristic____mediaCharacteristicMapping;
  _mediaRemoteLanguageOptionCharacteristicForAVMediaCharacteristic____mediaCharacteristicMapping = v14;
}

+ (id)_avMediaCharacteristics
{
  if (_avMediaCharacteristics___once != -1) {
    dispatch_once(&_avMediaCharacteristics___once, &__block_literal_global_135_4372);
  }
  uint64_t v2 = (void *)_avMediaCharacteristics___mediaCharacteristics;

  return v2;
}

void __53__AVNowPlayingInfoController__avMediaCharacteristics__block_invoke()
{
  v7[10] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F15B58];
  v7[0] = *MEMORY[0x1E4F15B60];
  v7[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F15B90];
  v7[2] = *MEMORY[0x1E4F15B20];
  v7[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F15B48];
  v7[4] = *MEMORY[0x1E4F15B30];
  v7[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F15B78];
  v7[6] = *MEMORY[0x1E4F15B38];
  v7[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F15BA0];
  v7[8] = *MEMORY[0x1E4F15B40];
  v7[9] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:10];
  uint64_t v6 = (void *)_avMediaCharacteristics___mediaCharacteristics;
  _avMediaCharacteristics___mediaCharacteristics = v5;
}

+ (id)_mediaRemoteLanguageOptionCharacteristicsForAVMediaSelectionOption:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [a1 _avMediaCharacteristics];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v4, "hasMediaCharacteristic:", v11, (void)v16))
        {
          uint64_t v12 = [a1 _mediaRemoteLanguageOptionCharacteristicForAVMediaCharacteristic:v11];
          if (!v12) {
            __assert_rtn("+[AVNowPlayingInfoController _mediaRemoteLanguageOptionCharacteristicsForAVMediaSelectionOption:]", "AVNowPlayingInfoController_Mobile.m", 928, "mediaRemoteMediaCharacteristic");
          }
          uint64_t v13 = (void *)v12;
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  uint64_t v14 = (void *)[v5 copy];

  return v14;
}

+ (void)_createMediaRemoteLanguageOptionWithAVMediaSelectionOption:(id)a3
{
  id v4 = a3;
  [v4 hasMediaCharacteristic:*MEMORY[0x1E4F15B80]];
  id v5 = objc_msgSend(MEMORY[0x1E4F16540], "avkit_offOption");
  char v6 = [v4 isEqual:v5];

  if (v6)
  {
    AutomaticLanguageOptionForType = 0;
  }
  else
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F16540], "avkit_autoOption");
    int v9 = [v4 isEqual:v8];

    if (v9)
    {
      AutomaticLanguageOptionForType = (void *)MRLanguageOptionCreateAutomaticLanguageOptionForType();
    }
    else
    {
      uint64_t v10 = [a1 _mediaRemoteLanguageOptionCharacteristicsForAVMediaSelectionOption:v4];
      uint64_t v11 = [v4 extendedLanguageTag];
      uint64_t v12 = [v4 displayName];
      uint64_t v13 = [v4 mediaRemoteIdentifier];
      AutomaticLanguageOptionForType = (void *)MRLanguageOptionCreate();
    }
  }

  return AutomaticLanguageOptionForType;
}

+ (void)_createMediaRemoteLanguageOptionGroupWithAVMediaSelectionOptions:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    uint64_t v10 = *MEMORY[0x1E4F15B80];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "hasMediaCharacteristic:", v10, (void)v17);
        uint64_t v13 = [a1 _createMediaRemoteLanguageOptionWithAVMediaSelectionOption:v12];
        if (v13)
        {
          uint64_t v14 = (const void *)v13;
          [v5 addObject:v13];
          CFRelease(v14);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  id v15 = (void *)MRLanguageOptionGroupCreate();
  return v15;
}

+ (void)sharedNowPlayingInfoControllerWithCompletion:(id)a3
{
  id v4 = (void *)[a3 copy];
  if (sharedNowPlayingInfoControllerWithCompletion__createQueueOnceToken != -1) {
    dispatch_once(&sharedNowPlayingInfoControllerWithCompletion__createQueueOnceToken, &__block_literal_global_4375);
  }
  id v5 = sharedNowPlayingInfoControllerWithCompletion__nowPlayingInfoCreationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__AVNowPlayingInfoController_sharedNowPlayingInfoControllerWithCompletion___block_invoke_2;
  v7[3] = &unk_1E5FC2310;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __75__AVNowPlayingInfoController_sharedNowPlayingInfoControllerWithCompletion___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__AVNowPlayingInfoController_sharedNowPlayingInfoControllerWithCompletion___block_invoke_3;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 40);
  if (AVNowPlayingInfoSkipCommandDirectionKey_block_invoke_createSharedControllerOnceToken != -1) {
    dispatch_once(&AVNowPlayingInfoSkipCommandDirectionKey_block_invoke_createSharedControllerOnceToken, block);
  }
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __75__AVNowPlayingInfoController_sharedNowPlayingInfoControllerWithCompletion___block_invoke_4;
  v2[3] = &unk_1E5FC41A8;
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

void __75__AVNowPlayingInfoController_sharedNowPlayingInfoControllerWithCompletion___block_invoke_3(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)AVNowPlayingInfoSkipCommandDirectionKey_block_invoke_nowPlayingInfoController;
  AVNowPlayingInfoSkipCommandDirectionKey_block_invoke_nowPlayingInfoController = (uint64_t)v1;

  id v3 = (void *)sharedNowPlayingInfoControllerWithCompletion__nowPlayingInfoCreationQueue;
  id v4 = (id *)(AVNowPlayingInfoSkipCommandDirectionKey_block_invoke_nowPlayingInfoController + 40);

  objc_storeStrong(v4, v3);
}

uint64_t __75__AVNowPlayingInfoController_sharedNowPlayingInfoControllerWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75__AVNowPlayingInfoController_sharedNowPlayingInfoControllerWithCompletion___block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.avkit.sharedNowPlayingInfoController", v2);
  id v1 = (void *)sharedNowPlayingInfoControllerWithCompletion__nowPlayingInfoCreationQueue;
  sharedNowPlayingInfoControllerWithCompletion__nowPlayingInfoCreationQueue = (uint64_t)v0;
}

@end