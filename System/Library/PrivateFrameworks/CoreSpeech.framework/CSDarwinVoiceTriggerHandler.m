@interface CSDarwinVoiceTriggerHandler
- (BOOL)isUserSessionActive;
- (BOOL)selfTriggerEnabled;
- (BOOL)shouldHandleAssetChangeAfterUnlock;
- (BOOL)voiceTriggerEnabled;
- (CSDarwinPreventSystemSleepManager)preventSystemSleepManager;
- (CSDarwinVoiceTriggerHandler)initWithRemoteDevice:(id)a3 voiceTriggerEventsCoordinator:(id)a4 delegate:(id)a5;
- (CSDarwinVoiceTriggerHandler)initWithRemoteDevice:(id)a3 voiceTriggerEventsCoordinator:(id)a4 delegate:(id)a5 testContext:(id)a6;
- (CSDarwinVoiceTriggerHandlerDelegate)delegate;
- (CSPolicy)selfTriggerStartPolicy;
- (CSPolicy)voiceTriggerStartPolicy;
- (CSRemoteControlClient)remoteControlClient;
- (CSVoiceTriggerDarwinHandlerTestContext)testContext;
- (CSVoiceTriggerEventsCoordinator)voiceTriggerEventsCoordinator;
- (CSVoiceTriggerUserSelectedPhrase)multiPhraseSelectedStatus;
- (NSString)remoteDeviceId;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)preventSleepAssertionTimer;
- (OS_dispatch_source)retryTimer;
- (OS_remote_device)remoteDevice;
- (id)_connectRemoteCoreSpeechIfNeeded;
- (id)_getSpeakerProfileForCurrentLanguage;
- (int64_t)_currentSystemUserActiveState;
- (unint64_t)_fetchUserPreferredVoiceTriggerPhraseType;
- (unint64_t)powerState;
- (void)CSBluetoothWirelessSplitterMonitor:(id)a3 didReceiveSplitterStateChange:(unint64_t)a4 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a5;
- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4;
- (void)CSScreenLockMonitor:(id)a3 didReceiveScreenLockStateChanged:(BOOL)a4;
- (void)CSSystemUserActivityMonitor:(id)a3 activeStateChanged:(BOOL)a4;
- (void)CSVoiceTriggerAssetDownloadMonitor:(id)a3 didInstallNewAsset:(BOOL)a4;
- (void)CSVoiceTriggerUserSelectedPhraseDidChange:(BOOL)a3;
- (void)_disableRemoteVoiceTrigger;
- (void)_disconnectRemoteCoreSpeech;
- (void)_enableRemoteVoiceTrigger;
- (void)_handleDeviceDisconnection;
- (void)_handleRemoteCoreSpeechFirstTimeConnected;
- (void)_handleSelfTriggerDetected:(id)a3 myriadHash:(id)a4;
- (void)_handleVoiceTriggerEnabled:(BOOL)a3;
- (void)_invalidateRemoteControlClient;
- (void)_markRemoteVoiceTriggerEnabled;
- (void)_releasePreventSystemSleepPowerAssertion;
- (void)_remoteVoiceTriggerEnabled:(id)a3;
- (void)_retryVoiceTriggerEnable:(id)a3;
- (void)_safeAssetChangeHandler;
- (void)_sendSELFMetricsForCachedVoiceTriggerEvents:(id)a3 secondPassRejectEvents:(id)a4 secondPassCancelledEvents:(id)a5;
- (void)_sendSelfTriggerEnabledToRemote:(BOOL)a3 force:(BOOL)a4;
- (void)_startMonitoringSystemUserActivity;
- (void)_startPreventSleepAssertionTimer;
- (void)_startRetryTimer;
- (void)_stopMonitoringSystemUserActivity;
- (void)_stopPreventSleepAssertionTimer;
- (void)_stopRetryTimer;
- (void)_switchSelfTriggerStatus:(BOOL)a3;
- (void)_switchVoiceTriggerStatus:(BOOL)a3;
- (void)_transferDarwinVoiceTriggerAsset:(id)a3 languageCode:(id)a4;
- (void)_updateRemoteSupportedVoiceTriggerPhraseType:(unint64_t)a3;
- (void)_updateSystemSleepPowerAssertionState;
- (void)_wakeSiriIfNeededFromFullWake:(BOOL)a3 completion:(id)a4;
- (void)_wakeSiriWithVoiceTriggerInfo:(id)a3 myriadPHash:(id)a4 deviceId:(id)a5 isTriggeredFromFullWake:(BOOL)a6;
- (void)_writeMyriadHashFile:(id)a3;
- (void)dealloc;
- (void)didReceiveConnectionInvalidated:(id)a3;
- (void)didReceiveSelfTriggerDetected:(id)a3 myriadHash:(id)a4;
- (void)didReceiveVoiceTriggerAssetsDownloadingRequest:(id)a3 withConfigVersion:(id)a4 languageCode:(id)a5;
- (void)didReceiveVoiceTriggered:(id)a3;
- (void)disconnected:(id)a3;
- (void)handleAssetChange;
- (void)onDaemonExit;
- (void)onDarkWake;
- (void)onEarlyWake;
- (void)onFullWake;
- (void)onSleep;
- (void)onUserSessionActive:(id)a3;
- (void)onUserSessionResign:(id)a3;
- (void)retryVoiceTriggerEnable:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsUserSessionActive:(BOOL)a3;
- (void)setMultiPhraseSelectedStatus:(id)a3;
- (void)setPowerState:(unint64_t)a3;
- (void)setPreventSleepAssertionTimer:(id)a3;
- (void)setPreventSystemSleepManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteControlClient:(id)a3;
- (void)setRemoteDevice:(id)a3;
- (void)setRemoteDeviceId:(id)a3;
- (void)setRetryTimer:(id)a3;
- (void)setSelfTriggerEnabled:(BOOL)a3;
- (void)setSelfTriggerStartPolicy:(id)a3;
- (void)setShouldHandleAssetChangeAfterUnlock:(BOOL)a3;
- (void)setTestContext:(id)a3;
- (void)setVoiceTriggerEnabled:(BOOL)a3;
- (void)setVoiceTriggerEventsCoordinator:(id)a3;
- (void)setVoiceTriggerStartPolicy:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation CSDarwinVoiceTriggerHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiPhraseSelectedStatus, 0);
  objc_storeStrong((id *)&self->_testContext, 0);
  objc_storeStrong((id *)&self->_preventSleepAssertionTimer, 0);
  objc_storeStrong((id *)&self->_preventSystemSleepManager, 0);
  objc_storeStrong((id *)&self->_selfTriggerStartPolicy, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_voiceTriggerEventsCoordinator);
  objc_storeStrong((id *)&self->_voiceTriggerStartPolicy, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_remoteDeviceId, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_remoteControlClient, 0);
}

- (void)setMultiPhraseSelectedStatus:(id)a3
{
}

- (CSVoiceTriggerUserSelectedPhrase)multiPhraseSelectedStatus
{
  return self->_multiPhraseSelectedStatus;
}

- (void)setTestContext:(id)a3
{
}

- (CSVoiceTriggerDarwinHandlerTestContext)testContext
{
  return self->_testContext;
}

- (void)setPreventSleepAssertionTimer:(id)a3
{
}

- (OS_dispatch_source)preventSleepAssertionTimer
{
  return self->_preventSleepAssertionTimer;
}

- (void)setPreventSystemSleepManager:(id)a3
{
}

- (CSDarwinPreventSystemSleepManager)preventSystemSleepManager
{
  return self->_preventSystemSleepManager;
}

- (void)setSelfTriggerEnabled:(BOOL)a3
{
  self->_selfTriggerEnabled = a3;
}

- (BOOL)selfTriggerEnabled
{
  return self->_selfTriggerEnabled;
}

- (void)setSelfTriggerStartPolicy:(id)a3
{
}

- (CSPolicy)selfTriggerStartPolicy
{
  return self->_selfTriggerStartPolicy;
}

- (void)setDelegate:(id)a3
{
}

- (CSDarwinVoiceTriggerHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSDarwinVoiceTriggerHandlerDelegate *)WeakRetained;
}

- (void)setVoiceTriggerEventsCoordinator:(id)a3
{
}

- (CSVoiceTriggerEventsCoordinator)voiceTriggerEventsCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_voiceTriggerEventsCoordinator);
  return (CSVoiceTriggerEventsCoordinator *)WeakRetained;
}

- (void)setShouldHandleAssetChangeAfterUnlock:(BOOL)a3
{
  self->_shouldHandleAssetChangeAfterUnlock = a3;
}

- (BOOL)shouldHandleAssetChangeAfterUnlock
{
  return self->_shouldHandleAssetChangeAfterUnlock;
}

- (void)setVoiceTriggerEnabled:(BOOL)a3
{
  self->_voiceTriggerEnabled = a3;
}

- (BOOL)voiceTriggerEnabled
{
  return self->_voiceTriggerEnabled;
}

- (void)setVoiceTriggerStartPolicy:(id)a3
{
}

- (CSPolicy)voiceTriggerStartPolicy
{
  return self->_voiceTriggerStartPolicy;
}

- (void)setPowerState:(unint64_t)a3
{
  self->_powerState = a3;
}

- (unint64_t)powerState
{
  return self->_powerState;
}

- (void)setIsUserSessionActive:(BOOL)a3
{
  self->_isUserSessionActive = a3;
}

- (BOOL)isUserSessionActive
{
  return self->_isUserSessionActive;
}

- (void)setRetryTimer:(id)a3
{
}

- (OS_dispatch_source)retryTimer
{
  return self->_retryTimer;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setRemoteDeviceId:(id)a3
{
}

- (NSString)remoteDeviceId
{
  return self->_remoteDeviceId;
}

- (void)setRemoteDevice:(id)a3
{
}

- (OS_remote_device)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteControlClient:(id)a3
{
}

- (CSRemoteControlClient)remoteControlClient
{
  return self->_remoteControlClient;
}

- (void)CSBluetoothWirelessSplitterMonitor:(id)a3 didReceiveSplitterStateChange:(unint64_t)a4 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AB90;
  block[3] = &unk_100252F08;
  block[4] = self;
  block[5] = a4;
  BOOL v7 = a5;
  dispatch_async(queue, block);
}

- (void)CSVoiceTriggerUserSelectedPhraseDidChange:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000AC54;
  v4[3] = &unk_100253AB8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)CSScreenLockMonitor:(id)a3 didReceiveScreenLockStateChanged:(BOOL)a4
{
  if (!a4)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000AEB4;
    block[3] = &unk_100253AE0;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)_safeAssetChangeHandler
{
  v3 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    BOOL v5 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
    int v10 = 136315394;
    v11 = "-[CSDarwinVoiceTriggerHandler _safeAssetChangeHandler]";
    __int16 v12 = 2114;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s CSDarwinVTHandler[%{public}@]:Performing _safeAssetChangeHandler", (uint8_t *)&v10, 0x16u);
  }
  unsigned int v6 = [(CSPolicy *)self->_voiceTriggerStartPolicy isEnabled];
  id v7 = [(CSDarwinVoiceTriggerHandler *)self _connectRemoteCoreSpeechIfNeeded];
  remoteControlClient = self->_remoteControlClient;
  v9 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
  [(CSRemoteControlClient *)remoteControlClient notifyVoiceTriggerAssetChangeWithSiriLanguageCode:v9];

  if (v6) {
    [(CSDarwinVoiceTriggerHandler *)self _enableRemoteVoiceTrigger];
  }
  else {
    [(CSDarwinVoiceTriggerHandler *)self _disableRemoteVoiceTrigger];
  }
}

- (void)handleAssetChange
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B170;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  id v5 = a4;
  unsigned int v6 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    v8 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
    int v9 = 136315650;
    int v10 = "-[CSDarwinVoiceTriggerHandler CSLanguageCodeUpdateMonitor:didReceiveLanguageCodeChanged:]";
    __int16 v11 = 2114;
    __int16 v12 = v8;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s CSDarwinVTHandler[%{public}@]:LanguageCode changed to : %{public}@", (uint8_t *)&v9, 0x20u);
  }
  [(CSDarwinVoiceTriggerHandler *)self handleAssetChange];
}

- (void)CSVoiceTriggerAssetDownloadMonitor:(id)a3 didInstallNewAsset:(BOOL)a4
{
  id v5 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = v5;
    id v7 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
    int v8 = 136315394;
    int v9 = "-[CSDarwinVoiceTriggerHandler CSVoiceTriggerAssetDownloadMonitor:didInstallNewAsset:]";
    __int16 v10 = 2114;
    __int16 v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s CSDarwinVTHandler[%{public}@]:Download new asset", (uint8_t *)&v8, 0x16u);
  }
  [(CSDarwinVoiceTriggerHandler *)self handleAssetChange];
}

- (void)_sendSelfTriggerEnabledToRemote:(BOOL)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    *(void *)&v12[4] = "-[CSDarwinVoiceTriggerHandler _sendSelfTriggerEnabledToRemote:force:]";
    if (v5) {
      CFStringRef v9 = @"YES";
    }
    else {
      CFStringRef v9 = @"NO";
    }
    *(_DWORD *)__int16 v12 = 136315650;
    *(void *)&v12[14] = v9;
    *(_WORD *)&v12[12] = 2114;
    if (v4) {
      CFStringRef v8 = @"YES";
    }
    *(_WORD *)&v12[22] = 2114;
    CFStringRef v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s enable : %{public}@, force : %{public}@", v12, 0x20u);
  }
  if (self->_isUserSessionActive || v4)
  {
    id v11 = [(CSDarwinVoiceTriggerHandler *)self _connectRemoteCoreSpeechIfNeeded];
    self->_selfTriggerEnabled = v5;
    [(CSRemoteControlClient *)self->_remoteControlClient setSelfTriggerEnable:v5 withCompletion:&stru_10024E448];
  }
  else
  {
    __int16 v10 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v12 = 136315138;
      *(void *)&v12[4] = "-[CSDarwinVoiceTriggerHandler _sendSelfTriggerEnabledToRemote:force:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Ignore sending remote SelfTrigger enable request since user session is deactivated", v12, 0xCu);
    }
  }
}

- (void)_switchSelfTriggerStatus:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000B7D0;
  v4[3] = &unk_100253AB8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (id)_getSpeakerProfileForCurrentLanguage
{
  v2 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
  v3 = +[SSRVoiceProfileManager sharedInstance];
  BOOL v4 = [v3 provisionedVoiceProfilesForAppDomain:SSRSpeakerRecognitionSiriAppDomain withLocale:v2];
  if ([v4 count])
  {
    BOOL v5 = [v4 objectAtIndexedSubscript:0];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_remoteVoiceTriggerEnabled:(id)a3
{
  id v5 = a3;
  id v4 = [(CSDarwinVoiceTriggerHandler *)self _connectRemoteCoreSpeechIfNeeded];
  [(CSRemoteControlClient *)self->_remoteControlClient voiceTriggerEnabledWithCompletion:v5];
}

- (void)_disableRemoteVoiceTrigger
{
  id v3 = [(CSDarwinVoiceTriggerHandler *)self _connectRemoteCoreSpeechIfNeeded];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  remoteControlClient = self->_remoteControlClient;
  __int16 v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  __int16 v12 = sub_10000BA98;
  CFStringRef v13 = &unk_10024E428;
  id v14 = self;
  unsigned int v6 = v4;
  v15 = v6;
  [(CSRemoteControlClient *)remoteControlClient setVoiceTriggerEnable:0 withCompletion:&v10];
  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    CFStringRef v8 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[CSDarwinVoiceTriggerHandler _disableRemoteVoiceTrigger]";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Disable VoiceTrigger in Darwin timed-out!!", buf, 0xCu);
    }
  }
  [(CSDarwinVoiceTriggerHandler *)self _releasePreventSystemSleepPowerAssertion];
  CFStringRef v9 = +[CSSuddenTerminationProtector sharedInstance];
  [v9 allowSuddenTermination];
}

- (void)_enableRemoteVoiceTrigger
{
  if (self->_isUserSessionActive)
  {
    id v3 = [(CSDarwinVoiceTriggerHandler *)self _connectRemoteCoreSpeechIfNeeded];
    dispatch_semaphore_t v4 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
    id v5 = [(CSDarwinVoiceTriggerHandler *)self _getSpeakerProfileForCurrentLanguage];
    if (v5)
    {
      unsigned int v6 = +[SSRAESKeyManager getVoiceTriggerProfilesAESKey];
      if (!CSIsOSX() || v6)
      {
        id v14 = objc_msgSend(v5, "getEnrollmentUtterancesForModelType:", +[SSRUtils explicitSpIdTypeForSpId:](SSRUtils, "explicitSpIdTypeForSpId:", 1));
        [(CSRemoteControlClient *)self->_remoteControlClient setVoiceTriggerEnable:0 withCompletion:0];
        objc_initWeak((id *)buf, self);
        remoteControlClient = self->_remoteControlClient;
        unsigned int v16 = +[CSConfig EncryptionAudioSampleByteDepth];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_10000C108;
        v24[3] = &unk_10024E400;
        v24[4] = self;
        objc_copyWeak(&v26, (id *)buf);
        v25 = &stru_10024E3D8;
        [(CSRemoteControlClient *)remoteControlClient createRemoteVoiceProfileWithAudioFiles:v14 aesKey:v6 encryptedAudioSampleBypeDepth:v16 languageCode:v4 completion:v24];
        v17 = +[CSSuddenTerminationProtector sharedInstance];
        [v17 disallowSuddenTermiation];

        objc_destroyWeak(&v26);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        dispatch_time_t v7 = (void *)CSLogCategoryVT;
        BOOL v8 = os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR);
        if (v8)
        {
          v21 = v7;
          v22 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
          v23 = [(CSRemoteControlClient *)self->_remoteControlClient description];
          *(_DWORD *)buf = 136315650;
          v28 = "-[CSDarwinVoiceTriggerHandler _enableRemoteVoiceTrigger]";
          __int16 v29 = 2114;
          v30 = v22;
          __int16 v31 = 2114;
          v32 = v23;
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s CSDarwinVTHandler[%{public}@]:ERR: cannot find AES key, remote VoiceTrigger %{public}@ will be turned on without PHS", buf, 0x20u);
        }
        self->_shouldHandleAssetChangeAfterUnlock = 1;
        sub_10000C060((id)v8, self);
      }
    }
    else
    {
      __int16 v12 = (void *)CSLogCategoryVT;
      BOOL v13 = os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR);
      if (v13)
      {
        v18 = v12;
        v19 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
        v20 = [(CSRemoteControlClient *)self->_remoteControlClient description];
        *(_DWORD *)buf = 136315650;
        v28 = "-[CSDarwinVoiceTriggerHandler _enableRemoteVoiceTrigger]";
        __int16 v29 = 2114;
        v30 = v19;
        __int16 v31 = 2114;
        v32 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s CSDarwinVTHandler[%{public}@]:ERR: No Speaker Profile, remote VoiceTrigger %{public}@ will be turned on without PHS", buf, 0x20u);
      }
      self->_shouldHandleAssetChangeAfterUnlock = 1;
      sub_10000C060((id)v13, self);
    }
  }
  else
  {
    CFStringRef v9 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = v9;
      uint64_t v11 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
      *(_DWORD *)buf = 136315394;
      v28 = "-[CSDarwinVoiceTriggerHandler _enableRemoteVoiceTrigger]";
      __int16 v29 = 2114;
      v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s CSDarwinVTHandler[%{public}@]:Does not enable remote Voice Trigger since user session is deactivated", buf, 0x16u);
    }
  }
}

- (void)_markRemoteVoiceTriggerEnabled
{
  id v3 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_semaphore_t v4 = v3;
    id v5 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
    int v8 = 136315394;
    CFStringRef v9 = "-[CSDarwinVoiceTriggerHandler _markRemoteVoiceTriggerEnabled]";
    __int16 v10 = 2114;
    uint64_t v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s CSDarwinVTHandler[%{public}@]:", (uint8_t *)&v8, 0x16u);
  }
  [(CSDarwinVoiceTriggerHandler *)self setVoiceTriggerEnabled:1];
  unsigned int v6 = +[CSRemoteDarwinDeviceInfo sharedInstance];
  dispatch_time_t v7 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
  [v6 notifyVoiceTriggerEnabledWithDeviceUUID:v7];

  [(CSDarwinVoiceTriggerHandler *)self _updateSystemSleepPowerAssertionState];
}

- (void)_transferDarwinVoiceTriggerAsset:(id)a3 languageCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_isUserSessionActive)
  {
    id v8 = [(CSDarwinVoiceTriggerHandler *)self _connectRemoteCoreSpeechIfNeeded];
    [(CSRemoteControlClient *)self->_remoteControlClient setVoiceTriggerEnable:0 withCompletion:0];
    remoteControlClient = self->_remoteControlClient;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000C68C;
    v14[3] = &unk_1002531E0;
    v14[4] = self;
    [(CSRemoteControlClient *)remoteControlClient transferVoiceTriggerAsset:v6 forLanguageCode:v7 completion:v14];
    __int16 v10 = +[CSSuddenTerminationProtector sharedInstance];
    [v10 disallowSuddenTermiation];
  }
  else
  {
    uint64_t v11 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = v11;
      BOOL v13 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
      *(_DWORD *)buf = 136315394;
      unsigned int v16 = "-[CSDarwinVoiceTriggerHandler _transferDarwinVoiceTriggerAsset:languageCode:]";
      __int16 v17 = 2114;
      v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s CSDarwinVTHandler[%{public}@]:Skip transfer since user session became inactive", buf, 0x16u);
    }
  }
}

- (void)_retryVoiceTriggerEnable:(id)a3
{
  id v4 = a3;
  id v5 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
    id v8 = [(CSRemoteControlClient *)self->_remoteControlClient description];
    *(_DWORD *)buf = 136315650;
    __int16 v17 = "-[CSDarwinVoiceTriggerHandler _retryVoiceTriggerEnable:]";
    __int16 v18 = 2114;
    v19 = v7;
    __int16 v20 = 2114;
    v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s CSDarwinVTHandler[%{public}@]:remoteClient : %{public}@", buf, 0x20u);
  }
  if (!self->_isUserSessionActive)
  {
    CFStringRef v9 = (void *)CSLogCategoryVT;
    if (!os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    __int16 v10 = v9;
    uint64_t v11 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
    *(_DWORD *)buf = 136315394;
    __int16 v17 = "-[CSDarwinVoiceTriggerHandler _retryVoiceTriggerEnable:]";
    __int16 v18 = 2114;
    v19 = v11;
    __int16 v12 = "%s CSDarwinVTHandler[%{public}@]:user session is not active on macOS, should stop this timer";
    goto LABEL_10;
  }
  if ([(CSPolicy *)self->_voiceTriggerStartPolicy isEnabled])
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000C968;
    v14[3] = &unk_10024E398;
    v14[4] = self;
    id v15 = v4;
    [(CSDarwinVoiceTriggerHandler *)self _remoteVoiceTriggerEnabled:v14];

    goto LABEL_13;
  }
  BOOL v13 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = v13;
    uint64_t v11 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
    *(_DWORD *)buf = 136315394;
    __int16 v17 = "-[CSDarwinVoiceTriggerHandler _retryVoiceTriggerEnable:]";
    __int16 v18 = 2114;
    v19 = v11;
    __int16 v12 = "%s CSDarwinVTHandler[%{public}@]:VoiceTrigger is disabled on macOS, should stop this timer";
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0x16u);
  }
LABEL_11:
  if (v4) {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
LABEL_13:
}

- (void)retryVoiceTriggerEnable:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000CCD0;
  v7[3] = &unk_1002535D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_handleVoiceTriggerEnabled:(BOOL)a3
{
  if (a3)
  {
    [(CSDarwinVoiceTriggerHandler *)self _enableRemoteVoiceTrigger];
    [(CSDarwinVoiceTriggerHandler *)self _startRetryTimer];
  }
  else
  {
    [(CSDarwinVoiceTriggerHandler *)self _disableRemoteVoiceTrigger];
  }
}

- (void)_switchVoiceTriggerStatus:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000CDB4;
  v4[3] = &unk_100253AB8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)CSSystemUserActivityMonitor:(id)a3 activeStateChanged:(BOOL)a4
{
  BOOL v5 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v10 = "-[CSDarwinVoiceTriggerHandler CSSystemUserActivityMonitor:activeStateChanged:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CF08;
  block[3] = &unk_1002533D0;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(queue, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (void)_releasePreventSystemSleepPowerAssertion
{
  [(CSDarwinPreventSystemSleepManager *)self->_preventSystemSleepManager releasePreventSystemSleepAssertion];
  [(CSDarwinVoiceTriggerHandler *)self _stopPreventSleepAssertionTimer];
}

- (void)_updateSystemSleepPowerAssertionState
{
  int64_t v3 = [(CSDarwinVoiceTriggerHandler *)self _currentSystemUserActiveState];
  id v4 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[CSDarwinVoiceTriggerHandler _updateSystemSleepPowerAssertionState]";
    __int16 v7 = 2048;
    int64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s System User Activity State %ld", (uint8_t *)&v5, 0x16u);
  }
  if (v3)
  {
    if (v3 == 1)
    {
      [(CSDarwinVoiceTriggerHandler *)self _startPreventSleepAssertionTimer];
      [(CSDarwinPreventSystemSleepManager *)self->_preventSystemSleepManager acquireAssertionForActiveUser];
    }
    else
    {
      [(CSDarwinVoiceTriggerHandler *)self _stopPreventSleepAssertionTimer];
      [(CSDarwinPreventSystemSleepManager *)self->_preventSystemSleepManager acquireAssertion];
    }
  }
  else
  {
    [(CSDarwinVoiceTriggerHandler *)self _stopPreventSleepAssertionTimer];
    [(CSDarwinPreventSystemSleepManager *)self->_preventSystemSleepManager acquireAssertionForIdleUser];
  }
}

- (int64_t)_currentSystemUserActiveState
{
  if (CSIsIPad()) {
    return -1;
  }
  int64_t v3 = +[CSSystemUserActivityMonitor sharedInstance];
  id v4 = [v3 systemUserActivityState];

  return (int64_t)v4;
}

- (void)_stopMonitoringSystemUserActivity
{
  if ((CSIsOSX() & 1) != 0
    || [(CSVoiceTriggerDarwinHandlerTestContext *)self->_testContext forceAcquirePowerAssertion])
  {
    id v3 = +[CSSystemUserActivityMonitor sharedInstance];
    [v3 removeObserver:self];
  }
}

- (void)_startMonitoringSystemUserActivity
{
  if ((CSIsOSX() & 1) != 0
    || [(CSVoiceTriggerDarwinHandlerTestContext *)self->_testContext forceAcquirePowerAssertion])
  {
    [(CSDarwinVoiceTriggerHandler *)self _stopMonitoringSystemUserActivity];
    id v3 = +[CSSystemUserActivityMonitor sharedInstance];
    [v3 addObserver:self];
  }
}

- (void)_stopPreventSleepAssertionTimer
{
  if (CSIsAppleSiliconMac() && self->_preventSystemSleepManager
    || [(CSVoiceTriggerDarwinHandlerTestContext *)self->_testContext forceAcquirePowerAssertion])
  {
    preventSleepAssertionTimer = self->_preventSleepAssertionTimer;
    if (preventSleepAssertionTimer && !dispatch_source_testcancel((dispatch_source_t)self->_preventSleepAssertionTimer))
    {
      id v4 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = v4;
        id v6 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
        int v8 = 136315394;
        CFStringRef v9 = "-[CSDarwinVoiceTriggerHandler _stopPreventSleepAssertionTimer]";
        __int16 v10 = 2114;
        uint64_t v11 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s CSDarwinVTHandler[%{public}@]:", (uint8_t *)&v8, 0x16u);

        preventSleepAssertionTimer = self->_preventSleepAssertionTimer;
      }
      dispatch_source_cancel(preventSleepAssertionTimer);
      __int16 v7 = self->_preventSleepAssertionTimer;
      self->_preventSleepAssertionTimer = 0;
    }
  }
}

- (void)_startPreventSleepAssertionTimer
{
  if ((CSIsAppleSiliconMac() & 1) != 0
    || [(CSVoiceTriggerDarwinHandlerTestContext *)self->_testContext forceAcquirePowerAssertion])
  {
    [(CSDarwinVoiceTriggerHandler *)self _stopPreventSleepAssertionTimer];
    id v3 = (void *)CSLogCategoryVT;
    if (self->_preventSystemSleepManager)
    {
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        id v4 = v3;
        int v5 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
        *(_DWORD *)buf = 136315650;
        id v14 = "-[CSDarwinVoiceTriggerHandler _startPreventSleepAssertionTimer]";
        __int16 v15 = 2114;
        unsigned int v16 = v5;
        __int16 v17 = 2048;
        uint64_t v18 = 0x4082C00000000000;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s CSDarwinVTHandler[%{public}@]:Setting PreventSystemSleep timer for %f seconds", buf, 0x20u);
      }
      id v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
      dispatch_time_t v7 = dispatch_time(0, 600000000000);
      dispatch_source_set_timer(v6, v7, 0x8BB2C97000uLL, 0x5F5E100uLL);
      objc_initWeak((id *)buf, self);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10000D5B8;
      handler[3] = &unk_1002533D0;
      objc_copyWeak(&v12, (id *)buf);
      dispatch_source_set_event_handler(v6, handler);
      dispatch_resume(v6);
      preventSleepAssertionTimer = self->_preventSleepAssertionTimer;
      self->_preventSleepAssertionTimer = (OS_dispatch_source *)v6;

      objc_destroyWeak(&v12);
      objc_destroyWeak((id *)buf);
    }
    else if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v9 = v3;
      __int16 v10 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
      *(_DWORD *)buf = 136315394;
      id v14 = "-[CSDarwinVoiceTriggerHandler _startPreventSleepAssertionTimer]";
      __int16 v15 = 2114;
      unsigned int v16 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s CSDarwinVTHandler[%{public}@]:Sleep manager is unavailable.", buf, 0x16u);
    }
  }
}

- (void)didReceiveVoiceTriggerAssetsDownloadingRequest:(id)a3 withConfigVersion:(id)a4 languageCode:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    BOOL v13 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
    id v14 = [v8 description];
    *(_DWORD *)buf = 136315650;
    v24 = "-[CSDarwinVoiceTriggerHandler didReceiveVoiceTriggerAssetsDownloadingRequest:withConfigVersion:languageCode:]";
    __int16 v25 = 2114;
    id v26 = v13;
    __int16 v27 = 2114;
    v28 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s CSDarwinVTHandler[%{public}@]:darwin client : %{public}@", buf, 0x20u);
  }
  queue = self->_queue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000D89C;
  v19[3] = &unk_100252E18;
  v19[4] = self;
  id v20 = v10;
  id v21 = v9;
  id v22 = v8;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  dispatch_async(queue, v19);
}

- (void)_handleSelfTriggerDetected:(id)a3 myriadHash:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000DE80;
  v8[3] = &unk_100253B08;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)_invalidateRemoteControlClient
{
  [(CSRemoteControlClient *)self->_remoteControlClient invalidate];
  remoteControlClient = self->_remoteControlClient;
  self->_remoteControlClient = 0;
}

- (void)didReceiveSelfTriggerDetected:(id)a3 myriadHash:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
    uint64_t v11 = [v6 description];
    int v12 = 136315650;
    BOOL v13 = "-[CSDarwinVoiceTriggerHandler didReceiveSelfTriggerDetected:myriadHash:]";
    __int16 v14 = 2114;
    __int16 v15 = v10;
    __int16 v16 = 2114;
    id v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s CSDarwinVTHandler[%{public}@]:remoteClient : %{public}@", (uint8_t *)&v12, 0x20u);
  }
  [(CSDarwinVoiceTriggerHandler *)self _handleSelfTriggerDetected:v6 myriadHash:v7];
}

- (void)didReceiveVoiceTriggered:(id)a3
{
  id v4 = a3;
  id v5 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
    id v8 = [v4 description];
    *(_DWORD *)buf = 136315650;
    __int16 v15 = "-[CSDarwinVoiceTriggerHandler didReceiveVoiceTriggered:]";
    __int16 v16 = 2114;
    id v17 = v7;
    __int16 v18 = 2114;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s CSDarwinVTHandler[%{public}@]:remoteClient : %{public}@", buf, 0x20u);
  }
  id v9 = +[CSVoiceTriggerEventInfoProvider sharedInstance];
  [v9 setTriggerNotifiedMachTime:mach_absolute_time()];

  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000E330;
  v12[3] = &unk_100253B08;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  dispatch_async(queue, v12);
}

- (void)didReceiveConnectionInvalidated:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E3D4;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)disconnected:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E554;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_updateRemoteSupportedVoiceTriggerPhraseType:(unint64_t)a3
{
  remoteControlClient = self->_remoteControlClient;
  if (remoteControlClient) {
    [(CSRemoteControlClient *)remoteControlClient setUserSelectedVoiceTriggerPhraseType:a3];
  }
}

- (unint64_t)_fetchUserPreferredVoiceTriggerPhraseType
{
  id v3 = +[VTPreferences sharedPreferences];
  id v10 = 0;
  id v4 = [v3 getUserPreferredVoiceTriggerPhraseTypeForDeviceType:3 endpointId:0 error:&v10];
  id v5 = v10;

  if (v5)
  {
    id v6 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      id v8 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
      *(_DWORD *)buf = 136315650;
      int v12 = "-[CSDarwinVoiceTriggerHandler _fetchUserPreferredVoiceTriggerPhraseType]";
      __int16 v13 = 2114;
      __int16 v14 = v8;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s CSDarwinVTHandler[%{public}@]:Failed to fetch user selected phrase type with error %@", buf, 0x20u);
    }
  }

  return (unint64_t)v4;
}

- (void)_sendSELFMetricsForCachedVoiceTriggerEvents:(id)a3 secondPassRejectEvents:(id)a4 secondPassCancelledEvents:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v37 = a5;
  id obj = v7;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v9 = [v7 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v49;
    uint64_t v12 = kCSFSelfLoggingMHUUIDKey;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v49 != v11) {
          objc_enumerationMutation(obj);
        }
        __int16 v14 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        __int16 v15 = [v14 objectForKeyedSubscript:v12];
        if (v15)
        {
          id v16 = +[CSFVoiceTriggerEventInfoSelfLogger sharedLogger];
          id v17 = [objc_alloc((Class)NSUUID) initWithUUIDString:v15];
          [v16 logStartEventWithFirstPassStartedInfo:v14 withMHUUID:v17];
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v10);
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v39 = v8;
  id v18 = [v39 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v45;
    uint64_t v21 = kCSFSelfLoggingMHUUIDKey;
    uint64_t v22 = kCSFSelfLoggingSecondPassResultKey;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v45 != v20) {
          objc_enumerationMutation(v39);
        }
        v24 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
        __int16 v25 = [v24 objectForKeyedSubscript:v21];
        if (v25)
        {
          id v26 = [v24 objectForKeyedSubscript:v22];

          if (v26)
          {
            __int16 v27 = +[CSFVoiceTriggerEventInfoSelfLogger sharedLogger];
            id v28 = [objc_alloc((Class)NSUUID) initWithUUIDString:v25];
            __int16 v29 = [v24 objectForKeyedSubscript:v22];
            objc_msgSend(v27, "logRejectEventWithVTEI:withMHUUID:withSecondPassResult:", v24, v28, objc_msgSend(v29, "unsignedIntegerValue"));
          }
        }
      }
      id v19 = [v39 countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v19);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v30 = v37;
  id v31 = [v30 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v41;
    do
    {
      for (k = 0; k != v32; k = (char *)k + 1)
      {
        if (*(void *)v41 != v33) {
          objc_enumerationMutation(v30);
        }
        id v35 = [objc_alloc((Class)NSUUID) initWithUUIDString:*(void *)(*((void *)&v40 + 1) + 8 * (void)k)];
        if (v35)
        {
          v36 = +[CSFVoiceTriggerEventInfoSelfLogger sharedLogger];
          [v36 logCancelledEventWithMHUUID:v35];
        }
      }
      id v32 = [v30 countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v32);
  }
}

- (void)_writeMyriadHashFile:(id)a3
{
  id v4 = a3;
  id v5 = +[CSFPreferences sharedPreferences];
  id v6 = [v5 myriadHashFilePath];

  if (!v4)
  {
    uint64_t v11 = +[NSFileManager defaultManager];
    [v11 removeItemAtPath:v6 error:0];

    uint64_t v12 = (void *)CSLogCategoryVT;
    if (!os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    id v9 = v12;
    id v10 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
    int v14 = 136315394;
    __int16 v15 = "-[CSDarwinVoiceTriggerHandler _writeMyriadHashFile:]";
    __int16 v16 = 2114;
    id v17 = v10;
    __int16 v13 = "%s CSDarwinVTHandler[%{public}@]:Myriad hash is nil";
LABEL_9:
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v14, 0x16u);
    goto LABEL_10;
  }
  unsigned int v7 = [v4 writeToFile:v6 atomically:0];
  id v8 = (void *)CSLogCategoryVT;
  if (!v7)
  {
    if (!os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    id v9 = v8;
    id v10 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
    int v14 = 136315394;
    __int16 v15 = "-[CSDarwinVoiceTriggerHandler _writeMyriadHashFile:]";
    __int16 v16 = 2114;
    id v17 = v10;
    __int16 v13 = "%s CSDarwinVTHandler[%{public}@]:Cannot write Myriad hash into file";
    goto LABEL_9;
  }
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
    int v14 = 136315394;
    __int16 v15 = "-[CSDarwinVoiceTriggerHandler _writeMyriadHashFile:]";
    __int16 v16 = 2114;
    id v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s CSDarwinVTHandler[%{public}@]:Successfully write Myriad hash", (uint8_t *)&v14, 0x16u);
LABEL_10:
  }
LABEL_11:
}

- (void)_wakeSiriWithVoiceTriggerInfo:(id)a3 myriadPHash:(id)a4 deviceId:(id)a5 isTriggeredFromFullWake:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_initWeak(&location, self);
  __int16 v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_10000ED94;
  id v18 = &unk_1002533D0;
  objc_copyWeak(&v19, &location);
  __int16 v13 = objc_retainBlock(&v15);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_voiceTriggerEventsCoordinator);
  objc_msgSend(WeakRetained, "voiceTriggerDidDetectKeyword:myriadHash:remoteTriggerType:remoteDeviceId:isTriggeredFromFullWake:completion:", v10, v11, 2, v12, v6, v13, v15, v16, v17, v18);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)_wakeSiriIfNeededFromFullWake:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  unsigned int v7 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
    *(_DWORD *)buf = 136315394;
    __int16 v25 = "-[CSDarwinVoiceTriggerHandler _wakeSiriIfNeededFromFullWake:completion:]";
    __int16 v26 = 2114;
    __int16 v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s CSDarwinVTHandler[%{public}@]:", buf, 0x16u);
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000F114;
  v22[3] = &unk_10024F748;
  id v10 = v6;
  id v23 = v10;
  id v11 = objc_retainBlock(v22);
  if (self->_isUserSessionActive)
  {
    id v12 = [(CSDarwinVoiceTriggerHandler *)self _connectRemoteCoreSpeechIfNeeded];
    kdebug_trace();
    remoteControlClient = self->_remoteControlClient;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000F12C;
    v19[3] = &unk_10024E2F8;
    v19[4] = self;
    uint64_t v20 = v11;
    BOOL v21 = a3;
    [(CSRemoteControlClient *)remoteControlClient readAndClearVoiceTriggeredTokenWithCompletion:v19];
    int v14 = self->_remoteControlClient;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000F228;
    v18[3] = &unk_10024E320;
    v18[4] = self;
    [(CSRemoteControlClient *)v14 fetchAndClearCachedVoiceTriggerEventsWithCompletion:v18];
  }
  else
  {
    __int16 v15 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = v15;
      id v17 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
      *(_DWORD *)buf = 136315394;
      __int16 v25 = "-[CSDarwinVoiceTriggerHandler _wakeSiriIfNeededFromFullWake:completion:]";
      __int16 v26 = 2114;
      __int16 v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s CSDarwinVTHandler[%{public}@]:Does not wake Siri since user session is not activated", buf, 0x16u);
    }
    ((void (*)(void *, void))v11[2])(v11, 0);
  }
}

- (void)_handleDeviceDisconnection
{
  id v3 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
    remoteDeviceId = self->_remoteDeviceId;
    int v9 = 136315650;
    id v10 = "-[CSDarwinVoiceTriggerHandler _handleDeviceDisconnection]";
    __int16 v11 = 2114;
    id v12 = v5;
    __int16 v13 = 2114;
    int v14 = remoteDeviceId;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s CSDarwinVTHandler[%{public}@]:Report darwin device(%{public}@) disconnected", (uint8_t *)&v9, 0x20u);
  }
  if (self->_remoteDeviceId)
  {
    unsigned int v7 = +[CSRemoteDarwinDeviceInfo sharedInstance];
    [v7 deviceDisconnectedWithUUID:self->_remoteDeviceId];
  }
  [(CSDarwinVoiceTriggerHandler *)self _disconnectRemoteCoreSpeech];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didReceiveDarwinDeviceDisconnected:self];
}

- (void)_disconnectRemoteCoreSpeech
{
  if (self->_remoteControlClient)
  {
    [(CSDarwinVoiceTriggerHandler *)self _invalidateRemoteControlClient];
  }
  else
  {
    id v3 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      id v5 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
      int v6 = 136315394;
      unsigned int v7 = "-[CSDarwinVoiceTriggerHandler _disconnectRemoteCoreSpeech]";
      __int16 v8 = 2114;
      int v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s CSDarwinVTHandler[%{public}@]:It try to disconnect remote corespeechd connection even though it does not exist", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)_handleRemoteCoreSpeechFirstTimeConnected
{
  BOOL isUserSessionActive = self->_isUserSessionActive;
  id v4 = (void *)CSLogCategoryVT;
  BOOL v5 = os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT);
  if (isUserSessionActive)
  {
    if (v5)
    {
      int v6 = v4;
      unsigned int v7 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
      __int16 v8 = [(CSRemoteControlClient *)self->_remoteControlClient description];
      int v15 = 136315650;
      uint64_t v16 = "-[CSDarwinVoiceTriggerHandler _handleRemoteCoreSpeechFirstTimeConnected]";
      __int16 v17 = 2114;
      id v18 = v7;
      __int16 v19 = 2114;
      uint64_t v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s CSDarwinVTHandler[%{public}@]:darwin client : %{public}@", (uint8_t *)&v15, 0x20u);
    }
    remoteControlClient = self->_remoteControlClient;
    id v10 = +[CSRemoteDeviceProtocolInfo localDeviceProtocolInfo];
    [(CSRemoteControlClient *)remoteControlClient exchangeRemoteDeviceProtocolInfo:v10];

    __int16 v11 = self->_remoteControlClient;
    id v12 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
    [(CSRemoteControlClient *)v11 notifyVoiceTriggerAssetChangeWithSiriLanguageCode:v12];

    [(CSDarwinVoiceTriggerHandler *)self _updateRemoteSupportedVoiceTriggerPhraseType:[(CSDarwinVoiceTriggerHandler *)self _fetchUserPreferredVoiceTriggerPhraseType]];
    if ([(CSPolicy *)self->_voiceTriggerStartPolicy isEnabled])
    {
      [(CSDarwinVoiceTriggerHandler *)self _wakeSiriIfNeededFromFullWake:1 completion:0];
      if (CSIsOSX()) {
        [(CSDarwinVoiceTriggerHandler *)self _enableRemoteVoiceTrigger];
      }
      else {
        [(CSDarwinVoiceTriggerHandler *)self _retryVoiceTriggerEnable:0];
      }
      [(CSDarwinVoiceTriggerHandler *)self _startRetryTimer];
    }
    else
    {
      [(CSDarwinVoiceTriggerHandler *)self _disableRemoteVoiceTrigger];
    }
    [(CSDarwinVoiceTriggerHandler *)self _sendSelfTriggerEnabledToRemote:[(CSPolicy *)self->_selfTriggerStartPolicy isEnabled] force:1];
  }
  else if (v5)
  {
    __int16 v13 = v4;
    int v14 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
    int v15 = 136315394;
    uint64_t v16 = "-[CSDarwinVoiceTriggerHandler _handleRemoteCoreSpeechFirstTimeConnected]";
    __int16 v17 = 2114;
    id v18 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s CSDarwinVTHandler[%{public}@]:Skip handling Darwin connected event since user session is inactive", (uint8_t *)&v15, 0x16u);
  }
}

- (id)_connectRemoteCoreSpeechIfNeeded
{
  if (*(_OWORD *)&self->_remoteDevice == 0)
  {
    int v6 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      id v23 = v6;
      v24 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CSDarwinVoiceTriggerHandler _connectRemoteCoreSpeechIfNeeded]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v24;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s CSDarwinVTHandler[%{public}@]:Invalid darwin device", buf, 0x16u);
    }
    [(CSDarwinVoiceTriggerHandler *)self _handleDeviceDisconnection];
    unsigned int v7 = 0;
  }
  else
  {
    if (self->_remoteControlClient)
    {
      id v3 = 0;
    }
    else
    {
      if (self->_remoteDeviceId)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:self->_remoteDeviceId];
        [v4 getUUIDBytes:buf];
        BOOL v5 = (OS_remote_device *)remote_device_copy_device_with_uuid();
      }
      else
      {
        BOOL v5 = self->_remoteDevice;
      }
      __int16 v8 = [[CSRemoteControlClient alloc] initWithRemoteDevice:v5];
      remoteControlClient = self->_remoteControlClient;
      self->_remoteControlClient = v8;

      id v10 = self->_remoteControlClient;
      id v25 = 0;
      unsigned __int8 v11 = [(CSRemoteControlClient *)v10 waitingForConnection:&v25 error:15.0];
      id v3 = v25;
      id v12 = (void *)CSLogCategoryVT;
      if (v11)
      {
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v13 = v12;
          int v14 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[CSDarwinVoiceTriggerHandler _connectRemoteCoreSpeechIfNeeded]";
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s CSDarwinVTHandler[%{public}@]:Connected remote corespeechd successfully", buf, 0x16u);
        }
        [(CSRemoteControlClient *)self->_remoteControlClient addObserver:self];
        int v15 = [(CSRemoteControlClient *)self->_remoteControlClient deviceId];
        remoteDeviceId = self->_remoteDeviceId;
        self->_remoteDeviceId = v15;

        __int16 v17 = +[CSRemoteDarwinDeviceInfo sharedInstance];
        [v17 deviceConnectedWithUUID:self->_remoteDeviceId];

        remoteDevice = self->_remoteDevice;
        self->_remoteDevice = 0;

        __int16 v19 = +[CSFPreferences sharedPreferences];
        [v19 setRemoteDarwinEverConnectedWithNotifyKey:"com.apple.voicetrigger.remotedarwin.EverConnected"];
      }
      else
      {
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
        {
          BOOL v21 = v12;
          uint64_t v22 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[CSDarwinVoiceTriggerHandler _connectRemoteCoreSpeechIfNeeded]";
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v22;
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s CSDarwinVTHandler[%{public}@]:Connecting to remote corespeechd failed", buf, 0x16u);
        }
        [(CSDarwinVoiceTriggerHandler *)self _invalidateRemoteControlClient];
      }

      if (!self->_remoteControlClient && [v3 code] != (id)302) {
        [(CSDarwinVoiceTriggerHandler *)self _handleDeviceDisconnection];
      }
    }
    unsigned int v7 = self->_remoteControlClient;
  }
  return v7;
}

- (void)onDaemonExit
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010000;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)onSleep
{
  kdebug_trace();
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000100DC;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)onEarlyWake
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010164;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)onDarkWake
{
  kdebug_trace();
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000103CC;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)onFullWake
{
  kdebug_trace();
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000104C8;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)onUserSessionResign:(id)a3
{
  id v4 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = v4;
    int v6 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
    *(_DWORD *)buf = 136315394;
    id v10 = "-[CSDarwinVoiceTriggerHandler onUserSessionResign:]";
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s CSDarwinVTHandler[%{public}@]:Deactivation session", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010614;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)onUserSessionActive:(id)a3
{
  id v4 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = v4;
    int v6 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
    *(_DWORD *)buf = 136315394;
    id v10 = "-[CSDarwinVoiceTriggerHandler onUserSessionActive:]";
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s CSDarwinVTHandler[%{public}@]:Activation session", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001079C;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_stopRetryTimer
{
  id v3 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    BOOL v5 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
    int v8 = 136315394;
    int v9 = "-[CSDarwinVoiceTriggerHandler _stopRetryTimer]";
    __int16 v10 = 2114;
    __int16 v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s CSDarwinVTHandler[%{public}@]:", (uint8_t *)&v8, 0x16u);
  }
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    dispatch_source_cancel(retryTimer);
    unsigned int v7 = self->_retryTimer;
    self->_retryTimer = 0;
  }
}

- (void)_startRetryTimer
{
  [(CSDarwinVoiceTriggerHandler *)self _stopRetryTimer];
  id v3 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    BOOL v5 = [(CSDarwinVoiceTriggerHandler *)self remoteDeviceId];
    *(_DWORD *)buf = 136315394;
    id v12 = "-[CSDarwinVoiceTriggerHandler _startRetryTimer]";
    __int16 v13 = 2114;
    int v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s CSDarwinVTHandler[%{public}@]:Creating VoiceTrigger enable retry timer", buf, 0x16u);
  }
  int v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  dispatch_time_t v7 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v6, v7, 0x6FC23AC00uLL, 0x5F5E100uLL);
  objc_initWeak((id *)buf, self);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100010AC8;
  handler[3] = &unk_1002533D0;
  objc_copyWeak(&v10, (id *)buf);
  dispatch_source_set_event_handler(v6, handler);
  dispatch_resume(v6);
  retryTimer = self->_retryTimer;
  self->_retryTimer = (OS_dispatch_source *)v6;

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)stop
{
  self->_BOOL isUserSessionActive = 0;
  id v3 = +[CSLanguageCodeUpdateMonitor sharedInstance];
  [v3 removeObserver:self];

  id v4 = +[CSVoiceTriggerAssetDownloadMonitor sharedInstance];
  [v4 removeObserver:self];

  BOOL v5 = +[CSScreenLockMonitor sharedInstance];
  [v5 removeObserver:self];

  [(CSVoiceTriggerUserSelectedPhrase *)self->_multiPhraseSelectedStatus setDelegate:0];
  multiPhraseSelectedStatus = self->_multiPhraseSelectedStatus;
  self->_multiPhraseSelectedStatus = 0;

  preventSystemSleepManager = self->_preventSystemSleepManager;
  self->_preventSystemSleepManager = 0;

  [(CSDarwinVoiceTriggerHandler *)self _stopMonitoringSystemUserActivity];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010CD8;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)start
{
  id v3 = +[CSUserSessionActiveMonitor sharedInstance];
  self->_BOOL isUserSessionActive = [v3 isUserActive];

  self->_powerState = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000110B8;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
  [(CSDarwinVoiceTriggerHandler *)self _registerUserSessionNotification];
  BOOL v5 = +[CSVoiceTriggerAssetDownloadMonitor sharedInstance];
  [v5 addObserver:self];

  objc_initWeak(&location, self);
  int v6 = +[CSRemoteXPCVoiceTriggerEnabledPolicy remoteDarwinVoiceTriggerEnabledPolicy];
  voiceTriggerStartPolicy = self->_voiceTriggerStartPolicy;
  self->_voiceTriggerStartPolicy = v6;

  int v8 = +[CSSelfTriggerDetectorEnabledPolicyFactory studioDisplaySelfTriggerEnabledPolicy];
  selfTriggerStartPolicy = self->_selfTriggerStartPolicy;
  self->_selfTriggerStartPolicy = v8;

  id v10 = self->_voiceTriggerStartPolicy;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000110C0;
  v27[3] = &unk_100252EE0;
  objc_copyWeak(&v28, &location);
  [(CSPolicy *)v10 setCallback:v27];
  __int16 v11 = self->_selfTriggerStartPolicy;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000111B4;
  v25[3] = &unk_100252EE0;
  objc_copyWeak(&v26, &location);
  [(CSPolicy *)v11 setCallback:v25];
  id v12 = self->_queue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000112A8;
  v24[3] = &unk_100253AE0;
  v24[4] = self;
  dispatch_async(v12, v24);
  __int16 v13 = +[CSScreenLockMonitor sharedInstance];
  [v13 addObserver:self];

  int v14 = +[CSLanguageCodeUpdateMonitor sharedInstance];
  [v14 addObserver:self];

  int v15 = +[CSBluetoothWirelessSplitterMonitor sharedInstance];
  [v15 addObserver:self];

  uint64_t v16 = [[CSVoiceTriggerUserSelectedPhrase alloc] initWithEndpointId:0];
  multiPhraseSelectedStatus = self->_multiPhraseSelectedStatus;
  self->_multiPhraseSelectedStatus = v16;

  [(CSVoiceTriggerUserSelectedPhrase *)self->_multiPhraseSelectedStatus setDelegate:self];
  id v18 = +[CSBluetoothWirelessSplitterMonitor sharedInstance];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100011300;
  v23[3] = &unk_100252F30;
  v23[4] = self;
  [v18 splitterState:v23];

  if (!self->_preventSystemSleepManager && ((CSIsAppleSiliconMac() & 1) != 0 || CSIsIOS()))
  {
    [(CSVoiceTriggerDarwinHandlerTestContext *)self->_testContext forcedPowerAssertionTimeout];
    double v20 = v19;
    if (v19 < 0.0 || v19 <= 2.22044605e-16)
    {
      if (CSIsAppleSiliconMac()) {
        double v20 = 259200.0;
      }
      else {
        double v20 = 0.0;
      }
    }
    BOOL v21 = [[CSDarwinPreventSystemSleepManager alloc] initWithTimeout:v20];
    preventSystemSleepManager = self->_preventSystemSleepManager;
    self->_preventSystemSleepManager = v21;
  }
  [(CSDarwinVoiceTriggerHandler *)self _startMonitoringSystemUserActivity];
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  id v3 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v6 = "-[CSDarwinVoiceTriggerHandler dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s CSDarwinVoiceTriggerHandler dealloc", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSDarwinVoiceTriggerHandler;
  [(CSDarwinVoiceTriggerHandler *)&v4 dealloc];
}

- (CSDarwinVoiceTriggerHandler)initWithRemoteDevice:(id)a3 voiceTriggerEventsCoordinator:(id)a4 delegate:(id)a5 testContext:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CSDarwinVoiceTriggerHandler;
  int v15 = [(CSDarwinVoiceTriggerHandler *)&v22 init];
  if (v15)
  {
    if (!+[CSUtils supportRemoteDarwinVoiceTrigger])
    {
      double v20 = 0;
      goto LABEL_6;
    }
    dispatch_queue_t v16 = dispatch_queue_create("CSDarwinVoiceTriggerHandler", 0);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v16;

    v15->_voiceTriggerEnabled = 0;
    objc_storeWeak((id *)&v15->_voiceTriggerEventsCoordinator, v12);
    objc_storeWeak((id *)&v15->_delegate, v13);
    objc_storeStrong((id *)&v15->_remoteDevice, a3);
    uint64_t v18 = [v14 preventSystemSleepManager];
    preventSystemSleepManager = v15->_preventSystemSleepManager;
    v15->_preventSystemSleepManager = (CSDarwinPreventSystemSleepManager *)v18;

    objc_storeStrong((id *)&v15->_testContext, a6);
  }
  double v20 = v15;
LABEL_6:

  return v20;
}

- (CSDarwinVoiceTriggerHandler)initWithRemoteDevice:(id)a3 voiceTriggerEventsCoordinator:(id)a4 delegate:(id)a5
{
  return [(CSDarwinVoiceTriggerHandler *)self initWithRemoteDevice:a3 voiceTriggerEventsCoordinator:a4 delegate:a5 testContext:0];
}

@end