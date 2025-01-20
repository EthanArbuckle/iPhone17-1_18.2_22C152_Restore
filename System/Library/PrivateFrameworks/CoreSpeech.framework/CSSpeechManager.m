@interface CSSpeechManager
+ (id)sharedManager;
+ (id)sharedManagerForCoreSpeechDaemon;
- (BOOL)_isAVVCRefChannelAvailable;
- (BOOL)_prepareForBluetoothDeviceWithDeviceType:(unint64_t)a3;
- (BOOL)_shouldSetupSelfTrigger;
- (BOOL)isExclaveHardware;
- (CSAudioRecorder)audioRecorder;
- (CSAudioTapProvider)audioTapProvider;
- (CSBuiltInVoiceTrigger)voiceTrigger;
- (CSFallbackAudioSessionReleaseProvider)fallbackAudioSessionReleaseProvider;
- (CSKeywordDetector)keywordDetector;
- (CSMyriadPHash)myriad;
- (CSMyriadSelfTriggerCoordinator)myriadSelfTriggerCoordinator;
- (CSOpportuneSpeakListnerTestService)opportuneSpeakListnerTestService;
- (CSPostBuildInstallService)postBuildInstallService;
- (CSPreMyriadCoordinator)preMyriadCoordinator;
- (CSSelfTriggerController)selfTriggerController;
- (CSSmartSiriVolumeManager)ssvManager;
- (CSSpeechManager)init;
- (CSSpeechManager)initWithExclaveHardware:(BOOL)a3 assetHandler:(id)a4;
- (CSVoiceProfileRetrainManager)voiceTriggerRetrainer;
- (CSVoiceTriggerAssetHandler)assetHandler;
- (CSVoiceTriggerEventsCoordinator)voiceTriggerEventsCoordinator;
- (CSVoiceTriggerFileLogger)voiceTriggerFileLogger;
- (CSVoiceTriggerFirstPassHearst)voiceTriggerFirstPassHearst;
- (CSVoiceTriggerFirstPassHearstAP)voiceTriggerFirstPassHearstAP;
- (CSVoiceTriggerFirstPassJarvis)voiceTriggerFirstPassJarvis;
- (CSVoiceTriggerFirstPassJarvisAP)voiceTriggerFirstPassJarvisAP;
- (CSVoiceTriggerFirstPassRemora)voiceTriggerFirstPassRemora;
- (NSMutableDictionary)audioProviders;
- (OS_dispatch_queue)assetQueryQueue;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)voiceTriggerQueue;
- (OS_dispatch_source)clearLoggingFileTimer;
- (id)_getAudioRecorderWithError:(id *)a3;
- (id)_myriadSelfTriggerCoordinatorIfNeeded:(BOOL)a3;
- (id)_preMyriadCoordinatorCreateIfNeeded:(BOOL)a3;
- (id)_voiceTriggerEventNotifierCreateIfNeeded:(BOOL)a3;
- (id)_voiceTriggerFileLoggerCreateIfNeeded:(BOOL)a3;
- (id)audioProviderWithContext:(id)a3 error:(id *)a4;
- (id)audioProviderWithStreamID:(unint64_t)a3;
- (id)audioProviderWithUUID:(id)a3;
- (id)clientController;
- (id)fetchFallbackAudioSessionReleaseProvider;
- (int64_t)clearLoggingFileTimerCount;
- (void)CSAudioRouteChangeMonitor:(id)a3 didReceiveAudioRouteChangeEvent:(int64_t)a4;
- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3;
- (void)_createClearLoggingFileTimer;
- (void)_getVoiceTriggerAssetIfNeeded:(id)a3;
- (void)_handleClearLoggingFileTimer;
- (void)_prepareRemoraDeviceWithConnectedDeviceIds:(id)a3;
- (void)_reinitializeSmartSiriVolumeWithAsset:(id)a3;
- (void)_reinitializeVoiceTriggerIfNeeded;
- (void)_reinitializeVoiceTriggerWithAsset:(id)a3;
- (void)_setAssetForBuiltInVoiceTrigger:(id)a3 completion:(id)a4;
- (void)_setupForBluetoothDeviceIfNeededWithDeviceType:(unint64_t)a3 prepareCompletion:(id)a4 completion:(id)a5;
- (void)_setupForHearstIfNeededWithPrepareCompletion:(id)a3 completion:(id)a4;
- (void)_setupForJarvisIfNeededWithPrepareCompletion:(id)a3 completion:(id)a4;
- (void)_setupForRemoraIfNeededWithCompletion:(id)a3;
- (void)_setupSpeakerRecognitionWithVTAsset:(id)a3;
- (void)_setupVoiceTriggerWithCompletion:(id)a3;
- (void)_startAllClients;
- (void)_startClearLoggingFilesTimer;
- (void)_startForBluetoothDeviceWithDeviceType:(unint64_t)a3 asset:(id)a4;
- (void)_startVoiceTrigger;
- (void)_teardownForBluetoothDevice;
- (void)activationEventNotificationHandler:(id)a3 event:(id)a4 completion:(id)a5;
- (void)audioProviderInvalidated:(id)a3 streamHandleId:(unint64_t)a4;
- (void)audioRecorderWillBeDestroyed:(id)a3;
- (void)dealloc;
- (void)opportuneSpeakEventMonitor:(id)a3 didStreamStateChanged:(BOOL)a4;
- (void)registerSiriClientProxy:(id)a3;
- (void)registerSpeechController:(id)a3;
- (void)setAssetHandler:(id)a3;
- (void)setAssetQueryQueue:(id)a3;
- (void)setAudioProviders:(id)a3;
- (void)setAudioRecorder:(id)a3;
- (void)setAudioTapProvider:(id)a3;
- (void)setClearLoggingFileTimer:(id)a3;
- (void)setClearLoggingFileTimerCount:(int64_t)a3;
- (void)setClientController:(id)a3;
- (void)setFallbackAudioSessionReleaseProvider:(id)a3;
- (void)setIsExclaveHardware:(BOOL)a3;
- (void)setKeywordDetector:(id)a3;
- (void)setMyriad:(id)a3;
- (void)setMyriadSelfTriggerCoordinator:(id)a3;
- (void)setOpportuneSpeakListnerTestService:(id)a3;
- (void)setPostBuildInstallService:(id)a3;
- (void)setPreMyriadCoordinator:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSelfTriggerController:(id)a3;
- (void)setSsvManager:(id)a3;
- (void)setVoiceTrigger:(id)a3;
- (void)setVoiceTriggerEventsCoordinator:(id)a3;
- (void)setVoiceTriggerFileLogger:(id)a3;
- (void)setVoiceTriggerFirstPassHearst:(id)a3;
- (void)setVoiceTriggerFirstPassHearstAP:(id)a3;
- (void)setVoiceTriggerFirstPassJarvis:(id)a3;
- (void)setVoiceTriggerFirstPassJarvisAP:(id)a3;
- (void)setVoiceTriggerFirstPassRemora:(id)a3;
- (void)setVoiceTriggerQueue:(id)a3;
- (void)setVoiceTriggerRetrainer:(id)a3;
- (void)startManager;
- (void)voiceTriggerAssetHandler:(id)a3 endpointId:(id)a4 didChangeCachedAsset:(id)a5;
@end

@implementation CSSpeechManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssvManager, 0);
  objc_storeStrong((id *)&self->_postBuildInstallService, 0);
  objc_storeStrong((id *)&self->_opportuneSpeakListnerTestService, 0);
  objc_storeStrong((id *)&self->_clearLoggingFileTimer, 0);
  objc_storeStrong((id *)&self->_voiceTriggerRetrainer, 0);
  objc_storeStrong((id *)&self->_voiceTriggerFirstPassRemora, 0);
  objc_storeStrong((id *)&self->_voiceTriggerFirstPassHearstAP, 0);
  objc_storeStrong((id *)&self->_voiceTriggerFirstPassHearst, 0);
  objc_storeStrong((id *)&self->_voiceTriggerFirstPassJarvisAP, 0);
  objc_storeStrong((id *)&self->_voiceTriggerFirstPassJarvis, 0);
  objc_storeStrong((id *)&self->_myriadSelfTriggerCoordinator, 0);
  objc_storeStrong((id *)&self->_myriad, 0);
  objc_storeStrong((id *)&self->_keywordDetector, 0);
  objc_storeStrong((id *)&self->_selfTriggerController, 0);
  objc_storeStrong((id *)&self->_voiceTriggerFileLogger, 0);
  objc_storeStrong((id *)&self->_preMyriadCoordinator, 0);
  objc_storeStrong((id *)&self->_voiceTriggerEventsCoordinator, 0);
  objc_storeStrong((id *)&self->_voiceTrigger, 0);
  objc_storeStrong((id *)&self->_voiceTriggerQueue, 0);
  objc_destroyWeak(&self->_clientController);
  objc_storeStrong((id *)&self->_fallbackAudioSessionReleaseProvider, 0);
  objc_storeStrong((id *)&self->_audioTapProvider, 0);
  objc_storeStrong((id *)&self->_audioProviders, 0);
  objc_storeStrong((id *)&self->_audioRecorder, 0);
  objc_storeStrong((id *)&self->_assetQueryQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setIsExclaveHardware:(BOOL)a3
{
  self->_isExclaveHardware = a3;
}

- (BOOL)isExclaveHardware
{
  return self->_isExclaveHardware;
}

- (void)setAssetHandler:(id)a3
{
  self->_assetHandler = (CSVoiceTriggerAssetHandler *)a3;
}

- (CSVoiceTriggerAssetHandler)assetHandler
{
  return self->_assetHandler;
}

- (void)setSsvManager:(id)a3
{
}

- (CSSmartSiriVolumeManager)ssvManager
{
  return self->_ssvManager;
}

- (void)setPostBuildInstallService:(id)a3
{
}

- (CSPostBuildInstallService)postBuildInstallService
{
  return self->_postBuildInstallService;
}

- (void)setOpportuneSpeakListnerTestService:(id)a3
{
}

- (CSOpportuneSpeakListnerTestService)opportuneSpeakListnerTestService
{
  return self->_opportuneSpeakListnerTestService;
}

- (void)setClearLoggingFileTimerCount:(int64_t)a3
{
  self->_clearLoggingFileTimerCount = a3;
}

- (int64_t)clearLoggingFileTimerCount
{
  return self->_clearLoggingFileTimerCount;
}

- (void)setClearLoggingFileTimer:(id)a3
{
}

- (OS_dispatch_source)clearLoggingFileTimer
{
  return self->_clearLoggingFileTimer;
}

- (void)setVoiceTriggerRetrainer:(id)a3
{
}

- (CSVoiceProfileRetrainManager)voiceTriggerRetrainer
{
  return self->_voiceTriggerRetrainer;
}

- (void)setVoiceTriggerFirstPassRemora:(id)a3
{
}

- (CSVoiceTriggerFirstPassRemora)voiceTriggerFirstPassRemora
{
  return self->_voiceTriggerFirstPassRemora;
}

- (void)setVoiceTriggerFirstPassHearstAP:(id)a3
{
}

- (CSVoiceTriggerFirstPassHearstAP)voiceTriggerFirstPassHearstAP
{
  return self->_voiceTriggerFirstPassHearstAP;
}

- (void)setVoiceTriggerFirstPassHearst:(id)a3
{
}

- (CSVoiceTriggerFirstPassHearst)voiceTriggerFirstPassHearst
{
  return self->_voiceTriggerFirstPassHearst;
}

- (void)setVoiceTriggerFirstPassJarvisAP:(id)a3
{
}

- (CSVoiceTriggerFirstPassJarvisAP)voiceTriggerFirstPassJarvisAP
{
  return self->_voiceTriggerFirstPassJarvisAP;
}

- (void)setVoiceTriggerFirstPassJarvis:(id)a3
{
}

- (CSVoiceTriggerFirstPassJarvis)voiceTriggerFirstPassJarvis
{
  return self->_voiceTriggerFirstPassJarvis;
}

- (void)setMyriadSelfTriggerCoordinator:(id)a3
{
}

- (CSMyriadSelfTriggerCoordinator)myriadSelfTriggerCoordinator
{
  return self->_myriadSelfTriggerCoordinator;
}

- (void)setMyriad:(id)a3
{
}

- (CSMyriadPHash)myriad
{
  return self->_myriad;
}

- (void)setKeywordDetector:(id)a3
{
}

- (CSKeywordDetector)keywordDetector
{
  return self->_keywordDetector;
}

- (void)setSelfTriggerController:(id)a3
{
}

- (CSSelfTriggerController)selfTriggerController
{
  return self->_selfTriggerController;
}

- (void)setVoiceTriggerFileLogger:(id)a3
{
}

- (CSVoiceTriggerFileLogger)voiceTriggerFileLogger
{
  return self->_voiceTriggerFileLogger;
}

- (void)setPreMyriadCoordinator:(id)a3
{
}

- (CSPreMyriadCoordinator)preMyriadCoordinator
{
  return self->_preMyriadCoordinator;
}

- (void)setVoiceTriggerEventsCoordinator:(id)a3
{
}

- (CSVoiceTriggerEventsCoordinator)voiceTriggerEventsCoordinator
{
  return self->_voiceTriggerEventsCoordinator;
}

- (void)setVoiceTrigger:(id)a3
{
}

- (CSBuiltInVoiceTrigger)voiceTrigger
{
  return self->_voiceTrigger;
}

- (void)setVoiceTriggerQueue:(id)a3
{
}

- (OS_dispatch_queue)voiceTriggerQueue
{
  return self->_voiceTriggerQueue;
}

- (void)setClientController:(id)a3
{
}

- (id)clientController
{
  id WeakRetained = objc_loadWeakRetained(&self->_clientController);
  return WeakRetained;
}

- (void)setFallbackAudioSessionReleaseProvider:(id)a3
{
}

- (CSFallbackAudioSessionReleaseProvider)fallbackAudioSessionReleaseProvider
{
  return self->_fallbackAudioSessionReleaseProvider;
}

- (void)setAudioTapProvider:(id)a3
{
}

- (void)setAudioProviders:(id)a3
{
}

- (NSMutableDictionary)audioProviders
{
  return self->_audioProviders;
}

- (void)setAudioRecorder:(id)a3
{
}

- (CSAudioRecorder)audioRecorder
{
  return self->_audioRecorder;
}

- (void)setAssetQueryQueue:(id)a3
{
}

- (OS_dispatch_queue)assetQueryQueue
{
  return self->_assetQueryQueue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)opportuneSpeakEventMonitor:(id)a3 didStreamStateChanged:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100135F00;
  block[3] = &unk_1002537C0;
  BOOL v11 = a4;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
}

- (void)_teardownForBluetoothDevice
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    v9 = "-[CSSpeechManager _teardownForBluetoothDevice]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Teardown VoiceTrigger due to bluetooth device disconnection", (uint8_t *)&v8, 0xCu);
  }
  [(CSVoiceTriggerFirstPassHearst *)self->_voiceTriggerFirstPassHearst setDelegate:0];
  voiceTriggerFirstPassHearst = self->_voiceTriggerFirstPassHearst;
  self->_voiceTriggerFirstPassHearst = 0;

  [(CSVoiceTriggerFirstPassJarvis *)self->_voiceTriggerFirstPassJarvis setDelegate:0];
  voiceTriggerFirstPassJarvis = self->_voiceTriggerFirstPassJarvis;
  self->_voiceTriggerFirstPassJarvis = 0;

  [(CSVoiceTriggerFirstPassHearstAP *)self->_voiceTriggerFirstPassHearstAP setDelegate:0];
  voiceTriggerFirstPassHearstAP = self->_voiceTriggerFirstPassHearstAP;
  self->_voiceTriggerFirstPassHearstAP = 0;

  [(CSVoiceTriggerFirstPassJarvisAP *)self->_voiceTriggerFirstPassJarvisAP setDelegate:0];
  voiceTriggerFirstPassJarvisAP = self->_voiceTriggerFirstPassJarvisAP;
  self->_voiceTriggerFirstPassJarvisAP = 0;
}

- (void)_prepareRemoraDeviceWithConnectedDeviceIds:(id)a3
{
  if (!self->_voiceTriggerFirstPassRemora)
  {
    id v4 = a3;
    v5 = objc_alloc_init(CSVoiceTriggerFirstPassRemora);
    voiceTriggerFirstPassRemora = self->_voiceTriggerFirstPassRemora;
    self->_voiceTriggerFirstPassRemora = v5;

    [(CSVoiceTriggerFirstPassRemora *)self->_voiceTriggerFirstPassRemora start];
    [(CSVoiceTriggerFirstPassRemora *)self->_voiceTriggerFirstPassRemora setConnectedDeviceIds:v4];

    id v7 = [(CSSpeechManager *)self _preMyriadCoordinatorCreateIfNeeded:1];
    [(CSVoiceTriggerFirstPassRemora *)self->_voiceTriggerFirstPassRemora setDelegate:v7];
    [(CSVoiceTriggerFirstPassRemora *)self->_voiceTriggerFirstPassRemora setSecondPassProgressDelegate:v7];
    [v7 setRemoraSecondPassProgressProvider:self->_voiceTriggerFirstPassRemora];
  }
}

- (void)_startForBluetoothDeviceWithDeviceType:(unint64_t)a3 asset:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    uint64_t v7 = 152;
    uint64_t v8 = 144;
  }
  else
  {
    uint64_t v7 = 168;
    uint64_t v8 = 160;
  }
  id v9 = v6;
  [*(id *)((char *)&self->super.isa + v8) setAsset:v6];
  [*(id *)((char *)&self->super.isa + v7) setAsset:v9];
  id v6 = v9;
LABEL_6:
}

- (BOOL)_prepareForBluetoothDeviceWithDeviceType:(unint64_t)a3
{
  id v5 = [(CSSpeechManager *)self _voiceTriggerFileLoggerCreateIfNeeded:1];
  if (a3 == 1)
  {
    voiceTriggerFirstPassJarvis = self->_voiceTriggerFirstPassJarvis;
    LOBYTE(v7) = voiceTriggerFirstPassJarvis == 0;
    if (!voiceTriggerFirstPassJarvis)
    {
      v15 = objc_alloc_init(CSVoiceTriggerFirstPassJarvis);
      v16 = self->_voiceTriggerFirstPassJarvis;
      self->_voiceTriggerFirstPassJarvis = v15;

      [(CSVoiceTriggerFirstPassJarvis *)self->_voiceTriggerFirstPassJarvis start];
      v17 = self->_voiceTriggerFirstPassJarvis;
      v18 = [(CSSpeechManager *)self _voiceTriggerEventNotifierCreateIfNeeded:1];
      [(CSVoiceTriggerFirstPassJarvis *)v17 setDelegate:v18];
    }
    if (!self->_voiceTriggerFirstPassJarvisAP)
    {
      v19 = objc_alloc_init(CSVoiceTriggerFirstPassJarvisAP);
      voiceTriggerFirstPassJarvisAP = self->_voiceTriggerFirstPassJarvisAP;
      self->_voiceTriggerFirstPassJarvisAP = v19;

      [(CSVoiceTriggerFirstPassJarvisAP *)self->_voiceTriggerFirstPassJarvisAP start];
      unint64_t v7 = (unint64_t)self->_voiceTriggerFirstPassJarvisAP;
      goto LABEL_12;
    }
  }
  else
  {
    if (a3)
    {
      LOBYTE(v7) = 0;
      return v7;
    }
    voiceTriggerFirstPassHearst = self->_voiceTriggerFirstPassHearst;
    unint64_t v7 = voiceTriggerFirstPassHearst == 0;
    if (!voiceTriggerFirstPassHearst)
    {
      uint64_t v8 = objc_alloc_init(CSVoiceTriggerFirstPassHearst);
      id v9 = self->_voiceTriggerFirstPassHearst;
      self->_voiceTriggerFirstPassHearst = v8;

      [(CSVoiceTriggerFirstPassHearst *)self->_voiceTriggerFirstPassHearst start];
      id v10 = self->_voiceTriggerFirstPassHearst;
      BOOL v11 = [(CSSpeechManager *)self _voiceTriggerEventNotifierCreateIfNeeded:1];
      [(CSVoiceTriggerFirstPassHearst *)v10 setDelegate:v11];
    }
    if (+[CSUtils supportOpportuneSpeakListener]
      && !self->_voiceTriggerFirstPassHearstAP)
    {
      v12 = objc_alloc_init(CSVoiceTriggerFirstPassHearstAP);
      voiceTriggerFirstPassHearstAP = self->_voiceTriggerFirstPassHearstAP;
      self->_voiceTriggerFirstPassHearstAP = v12;

      [(CSVoiceTriggerFirstPassHearstAP *)self->_voiceTriggerFirstPassHearstAP start];
      unint64_t v7 = (unint64_t)self->_voiceTriggerFirstPassHearstAP;
LABEL_12:
      v21 = [(CSSpeechManager *)self _voiceTriggerEventNotifierCreateIfNeeded:1];
      [(id)v7 setDelegate:v21];

      LOBYTE(v7) = 1;
    }
  }
  return v7;
}

- (void)_setupForBluetoothDeviceIfNeededWithDeviceType:(unint64_t)a3 prepareCompletion:(id)a4 completion:(id)a5
{
  uint64_t v8 = (void (**)(void))a4;
  id v9 = (void (**)(void))a5;
  unsigned int v10 = [(CSSpeechManager *)self _prepareForBluetoothDeviceWithDeviceType:a3];
  if (v8) {
    v8[2](v8);
  }
  if (v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100136644;
    v11[3] = &unk_100252560;
    v11[4] = self;
    unint64_t v13 = a3;
    v12 = v9;
    [(CSSpeechManager *)self _getVoiceTriggerAssetIfNeeded:v11];
  }
  else if (v9)
  {
    v9[2](v9);
  }
}

- (void)_setupForRemoraIfNeededWithCompletion:(id)a3
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[CSSpeechManager _setupForRemoraIfNeededWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s setup VoiceTrigger due to remora connection", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_setupForJarvisIfNeededWithPrepareCompletion:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    unsigned int v10 = "-[CSSpeechManager _setupForJarvisIfNeededWithPrepareCompletion:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s setup VoiceTrigger due to Jarvis connection", (uint8_t *)&v9, 0xCu);
  }
  [(CSSpeechManager *)self _setupForBluetoothDeviceIfNeededWithDeviceType:1 prepareCompletion:v6 completion:v7];
}

- (void)_setupForHearstIfNeededWithPrepareCompletion:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    unsigned int v10 = "-[CSSpeechManager _setupForHearstIfNeededWithPrepareCompletion:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s setup VoiceTrigger due to Hearst connection", (uint8_t *)&v9, 0xCu);
  }
  [(CSSpeechManager *)self _setupForBluetoothDeviceIfNeededWithDeviceType:0 prepareCompletion:v6 completion:v7];
}

- (void)CSAudioRouteChangeMonitor:(id)a3 didReceiveAudioRouteChangeEvent:(int64_t)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100136A48;
  v5[3] = &unk_100253B58;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)activationEventNotificationHandler:(id)a3 event:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100136D54;
  v15[3] = &unk_100252D38;
  id v16 = v9;
  v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, v15);
}

- (void)_startClearLoggingFilesTimer
{
  if (self->_clearLoggingFileTimer)
  {
    v3 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "-[CSSpeechManager _startClearLoggingFilesTimer]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
    }
    if (self->_clearLoggingFileTimerCount < 1)
    {
      dispatch_resume((dispatch_object_t)self->_clearLoggingFileTimer);
      ++self->_clearLoggingFileTimerCount;
    }
    else
    {
      int v4 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v5 = 136315138;
        id v6 = "-[CSSpeechManager _startClearLoggingFilesTimer]";
        _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s Clear logging file timer is already started, ignore startClearLoggingFilesTimer request.", (uint8_t *)&v5, 0xCu);
      }
    }
  }
}

- (void)_createClearLoggingFileTimer
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[CSSpeechManager _createClearLoggingFileTimer]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  self->_clearLoggingFileTimerCount = 0;
  int v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  clearLoggingFileTimer = self->_clearLoggingFileTimer;
  self->_clearLoggingFileTimer = v4;

  dispatch_time_t v6 = dispatch_time(0, 0);
  dispatch_source_set_timer((dispatch_source_t)self->_clearLoggingFileTimer, v6, 0x274A48C00000uLL, 0);
  id v7 = self->_clearLoggingFileTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100137400;
  handler[3] = &unk_100253AE0;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
}

- (void)_handleClearLoggingFileTimer
{
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    int v4 = "-[CSSpeechManager _handleClearLoggingFileTimer]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Trying to start clear logging files", (uint8_t *)&v3, 0xCu);
  }
  if (CSIsHorseman())
  {
    +[CSConfig daysBeforeRemovingLogFiles];
    +[CSAudioFileManager removeLogFilesOlderThanNDays:](CSAudioFileManager, "removeLogFilesOlderThanNDays:");
  }
  else if (CSIsIOS())
  {
    +[CSConfig daysBeforeRemovingLogFiles];
    +[CSAudioFileManager removeOpportunisticAudioLoggingOlderThanNDays:](CSAudioFileManager, "removeOpportunisticAudioLoggingOlderThanNDays:");
    +[CSConfig daysBeforeRemovingLogFiles];
    +[CSAudioFileManager removeRemoteP2PLogFilesOlderThanNDays:](CSAudioFileManager, "removeRemoteP2PLogFilesOlderThanNDays:");
  }
}

- (void)_reinitializeSmartSiriVolumeWithAsset:(id)a3
{
  ssvManager = self->_ssvManager;
  if (ssvManager) {
    [(CSSmartSiriVolumeManager *)ssvManager setAsset:a3];
  }
}

- (void)_reinitializeVoiceTriggerWithAsset:(id)a3
{
  id v4 = a3;
  int v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[CSSpeechManager _reinitializeVoiceTriggerWithAsset:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s new asset available, change to new model", (uint8_t *)&v7, 0xCu);
  }
  if (v4)
  {
    [(CSSpeechManager *)self _setAssetForBuiltInVoiceTrigger:v4 completion:0];
    dispatch_time_t v6 = +[CSVoiceTriggerStatistics sharedInstance];
    [v6 resetVTEstimationStatistics];

    if (+[CSUtils supportBluetoothDeviceVoiceTrigger])
    {
      [(CSVoiceTriggerFirstPassHearstAP *)self->_voiceTriggerFirstPassHearstAP setAsset:v4];
      [(CSVoiceTriggerFirstPassHearst *)self->_voiceTriggerFirstPassHearst setAsset:v4];
      [(CSVoiceTriggerFirstPassJarvis *)self->_voiceTriggerFirstPassJarvis setAsset:v4];
      [(CSVoiceTriggerFirstPassJarvisAP *)self->_voiceTriggerFirstPassJarvisAP setAsset:v4];
    }
    +[CSUtils supportRemoraVoiceTrigger];
    [(CSSelfTriggerController *)self->_selfTriggerController setAsset:v4];
    [(CSKeywordDetector *)self->_keywordDetector setAsset:v4];
    [(CSSpeechManager *)self _reinitializeSmartSiriVolumeWithAsset:v4];
    if ((CSIsCommunalDevice() & 1) == 0) {
      [(CSVoiceProfileRetrainManager *)self->_voiceTriggerRetrainer triggerVoiceProfileRetrainingWithAsset:v4];
    }
  }
}

- (void)_setAssetForBuiltInVoiceTrigger:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100137974;
  v25[3] = &unk_100252480;
  v25[4] = self;
  id v8 = v6;
  id v26 = v8;
  id v9 = v7;
  id v27 = v9;
  id v10 = objc_retainBlock(v25);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1001379E0;
  v22[3] = &unk_100252480;
  v22[4] = self;
  id v11 = v8;
  id v23 = v11;
  id v12 = v9;
  id v24 = v12;
  id v13 = objc_retainBlock(v22);
  id v14 = v13;
  if (self->_isExclaveHardware)
  {
    if (objc_opt_respondsToSelector())
    {
      assetHandler = self->_assetHandler;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100137A48;
      v19[3] = &unk_1002524D0;
      v19[4] = self;
      v20 = v10;
      id v21 = v14;
      [(CSVoiceTriggerAssetHandler *)assetHandler mapAssetToExclaveKit:v11 completion:v19];
    }
    else
    {
      id v16 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        id v18 = self->_assetHandler;
        *(_DWORD *)buf = 136315394;
        v29 = "-[CSSpeechManager _setAssetForBuiltInVoiceTrigger:completion:]";
        __int16 v30 = 2112;
        v31 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Asset handler %@ does not support mapping asset to EK. This is a critical error", buf, 0x16u);
      }
      v17 = +[NSError errorWithDomain:CSErrorDomain code:118 userInfo:0];
      ((void (*)(void *, void *))v10[2])(v10, v17);
    }
  }
  else
  {
    ((void (*)(void *, void))v13[2])(v13, 0);
  }
}

- (void)_reinitializeVoiceTriggerIfNeeded
{
  objc_initWeak(&location, self);
  assetQueryQueue = self->_assetQueryQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100137C9C;
  v4[3] = &unk_1002533D0;
  objc_copyWeak(&v5, &location);
  dispatch_async(assetQueryQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)voiceTriggerAssetHandler:(id)a3 endpointId:(id)a4 didChangeCachedAsset:(id)a5
{
  id v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[CSSpeechManager voiceTriggerAssetHandler:endpointId:didChangeCachedAsset:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Received VoiceTrigger cached asset change notification, let's reinitialize VoiceTrigger", (uint8_t *)&v7, 0xCu);
  }
  [(CSSpeechManager *)self _reinitializeVoiceTriggerIfNeeded];
}

- (void)audioRecorderWillBeDestroyed:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100137FCC;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)audioProviderInvalidated:(id)a3 streamHandleId:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100138154;
  block[3] = &unk_1002532A8;
  id v11 = self;
  unint64_t v12 = a4;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (id)_getAudioRecorderWithError:(id *)a3
{
  if (self->_audioRecorder)
  {
    id v5 = 0;
    if (a3) {
LABEL_3:
    }
      *a3 = v5;
  }
  else
  {
    id v26 = 0;
    id v8 = +[CSAudioRecorderFactory audioRecorderWithQueue:0 error:&v26];
    id v5 = v26;
    if (!v8)
    {
      id v9 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v20 = v9;
        id v21 = [v5 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v29 = "-[CSSpeechManager _getAudioRecorderWithError:]";
        __int16 v30 = 2114;
        v31 = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s Failed to create audio recorder : %{public}@", buf, 0x16u);
      }
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = [(CSSpeechManager *)self audioProviders];
    id v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        id v14 = 0;
        do
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v14);
          id v16 = [(CSSpeechManager *)self audioProviders];
          v17 = [v16 objectForKey:v15];

          [v17 setAudioRecorder:v8];
          id v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v12);
    }

    [(CSFallbackAudioSessionReleaseProvider *)self->_fallbackAudioSessionReleaseProvider setAudioRecorder:v8];
    [v8 registerObserver:self];
    id v18 = +[CSAudioSessionMonitor sharedInstance];
    [v8 setAudioSessionEventDelegate:v18];

    audioRecorder = self->_audioRecorder;
    self->_audioRecorder = (CSAudioRecorder *)v8;

    if (a3) {
      goto LABEL_3;
    }
  }
  id v6 = self->_audioRecorder;

  return v6;
}

- (id)fetchFallbackAudioSessionReleaseProvider
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1001386A8;
  id v10 = sub_1001386B8;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001386C0;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)audioProviderWithStreamID:(unint64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1001386A8;
  id v11 = sub_1001386B8;
  id v12 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10013881C;
  block[3] = &unk_100252430;
  void block[5] = &v7;
  block[6] = a3;
  void block[4] = self;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)audioProviderWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSSpeechManager audioProviderWithContext:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s context = %{public}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  long long v23 = sub_1001386A8;
  long long v24 = sub_1001386B8;
  id v25 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_1001386A8;
  v20 = sub_1001386B8;
  id v21 = 0;
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100138CEC;
  v12[3] = &unk_100252408;
  v12[4] = self;
  id v14 = &v16;
  id v9 = v6;
  id v13 = v9;
  uint64_t v15 = buf;
  dispatch_sync(queue, v12);
  if (a4) {
    *a4 = (id) v17[5];
  }
  id v10 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(buf, 8);

  return v10;
}

- (id)audioProviderWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_1001386A8;
  uint64_t v16 = sub_1001386B8;
  id v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10013934C;
  block[3] = &unk_1002523B8;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)registerSiriClientProxy:(id)a3
{
  id v4 = a3;
  id v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[CSSpeechManager registerSiriClientProxy:]";
    __int16 v9 = 2050;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s xpcListener = %{public}p", (uint8_t *)&v7, 0x16u);
  }
  id v6 = [(CSSpeechManager *)self _voiceTriggerEventNotifierCreateIfNeeded:1];
  [v6 registerObserver:v4];
}

- (void)registerSpeechController:(id)a3
{
  id v4 = a3;
  id v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[CSSpeechManager registerSpeechController:]";
    __int16 v9 = 2050;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s speechController = %{public}p", (uint8_t *)&v7, 0x16u);
  }
  [(CSVoiceTriggerEventsCoordinator *)self->_voiceTriggerEventsCoordinator registerObserver:v4];
  id v6 = [(CSSpeechManager *)self _myriadSelfTriggerCoordinatorIfNeeded:[(CSSpeechManager *)self _shouldSetupSelfTrigger]];
  [v6 setDelegate:v4];
  objc_storeWeak(&self->_clientController, v4);
}

- (void)_startAllClients
{
  id v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[CSSpeechManager _startAllClients]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Starting all clients", (uint8_t *)&v5, 0xCu);
  }
  if (+[CSUtils supportSmartVolume]) {
    [(CSSmartSiriVolumeManager *)self->_ssvManager startSmartSiriVolume];
  }
  [(CSSelfTriggerController *)self->_selfTriggerController start];
  id v4 = +[CSVoiceTriggerRejectReporter sharedInstance];
}

- (void)_startVoiceTrigger
{
  id v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[CSSpeechManager _startVoiceTrigger]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger will be started", (uint8_t *)&v4, 0xCu);
  }
  [(CSVoiceTriggerAssetHandler *)self->_assetHandler registerObserver:self];
  [(CSBuiltInVoiceTrigger *)self->_voiceTrigger start];
}

- (BOOL)_isAVVCRefChannelAvailable
{
  if (+[CSUtils isExclaveHardware]) {
    return 0;
  }
  uint64_t v3 = +[CSConfig inputRecordingNumberOfChannels];
  id v4 = +[CSConfig channelForOutputReference];
  return +[CSUtils supportSelfTriggerSuppression:v3 refChannelIdx:v4];
}

- (BOOL)_shouldSetupSelfTrigger
{
  if ([(CSSpeechManager *)self _isAVVCRefChannelAvailable]) {
    return 1;
  }
  return +[CSUtils supportAudioTappingSelfTrigger];
}

- (void)_setupVoiceTriggerWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[CSSpeechManager _setupVoiceTriggerWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (+[CSUtils isLocalVoiceTriggerAvailable])
  {
    if (CSIsWatch())
    {
      id v6 = +[CSUtils rootQueueWithFixedPriority:kCSDefaultSecondPassFixedPriorityWatch];
      voiceTriggerQueue = self->_voiceTriggerQueue;
      self->_voiceTriggerQueue = v6;
    }
    else
    {
      uint64_t v8 = (OS_dispatch_queue *)dispatch_queue_create("VoiceTrigger Queue", 0);
      __int16 v9 = self->_voiceTriggerQueue;
      self->_voiceTriggerQueue = v8;

      id v10 = self->_voiceTriggerQueue;
      voiceTriggerQueue = dispatch_get_global_queue(33, 0);
      dispatch_set_target_queue(v10, voiceTriggerQueue);
    }

    id v11 = [[CSBuiltInVoiceTrigger alloc] initWithTargetQueue:self->_voiceTriggerQueue withSpeechManager:self];
    voiceTrigger = self->_voiceTrigger;
    self->_voiceTrigger = v11;

    if (+[CSUtils supportHomeKitAccessory])
    {
      id v13 = [(CSSpeechManager *)self _preMyriadCoordinatorCreateIfNeeded:1];
      [(CSBuiltInVoiceTrigger *)self->_voiceTrigger setDelegate:v13];
      [v13 setBuiltInSeconPassProgressProvider:self->_voiceTrigger];
    }
    else
    {
      uint64_t v14 = self->_voiceTrigger;
      id v13 = [(CSSpeechManager *)self _voiceTriggerEventNotifierCreateIfNeeded:1];
      [(CSBuiltInVoiceTrigger *)v14 setDelegate:v13];
    }

    uint64_t v15 = +[CSVoiceTriggerXPCServiceProxy sharedInstance];
    [v15 registerObserver:self->_voiceTrigger];
  }
  [(CSSpeechManager *)self _startVoiceTrigger];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100139B30;
  v17[3] = &unk_1002529B8;
  v17[4] = self;
  id v18 = v4;
  id v16 = v4;
  [(CSSpeechManager *)self _getVoiceTriggerAssetIfNeeded:v17];
}

- (void)_setupSpeakerRecognitionWithVTAsset:(id)a3
{
  id v4 = a3;
  int v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v13 = "-[CSSpeechManager _setupSpeakerRecognitionWithVTAsset:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  int v6 = CSIsIOS();
  if (v4 && v6)
  {
    [(CSVoiceProfileRetrainManager *)self->_voiceTriggerRetrainer triggerVoiceProfileRetrainingWithAsset:v4];
  }
  else
  {
    int v7 = +[CSUtils getSiriLanguageWithFallback:0];
    uint64_t v8 = +[CSVoiceProfileRetrainManager sharedInstance];
    voiceTriggerRetrainer = self->_voiceTriggerRetrainer;
    self->_voiceTriggerRetrainer = v8;

    id v10 = +[SSRAssetManager sharedManager];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10013A648;
    v11[3] = &unk_100252DF0;
    v11[4] = self;
    [v10 getSpeakerRecognitionAssetWithLanguage:v7 completion:v11];
  }
}

- (id)_myriadSelfTriggerCoordinatorIfNeeded:(BOOL)a3
{
  if (a3 && !self->_myriadSelfTriggerCoordinator)
  {
    id v4 = objc_alloc_init(CSMyriadSelfTriggerCoordinator);
    myriadSelfTriggerCoordinator = self->_myriadSelfTriggerCoordinator;
    self->_myriadSelfTriggerCoordinator = v4;
  }
  int v6 = self->_myriadSelfTriggerCoordinator;
  return v6;
}

- (id)_voiceTriggerFileLoggerCreateIfNeeded:(BOOL)a3
{
  if (a3 && !self->_voiceTriggerFileLogger)
  {
    id v4 = objc_alloc_init(CSVoiceTriggerFileLogger);
    voiceTriggerFileLogger = self->_voiceTriggerFileLogger;
    self->_voiceTriggerFileLogger = v4;

    int v6 = [(CSSpeechManager *)self _voiceTriggerEventNotifierCreateIfNeeded:1];
    [v6 registerObserver:self->_voiceTriggerFileLogger];
  }
  int v7 = self->_voiceTriggerFileLogger;
  return v7;
}

- (id)_preMyriadCoordinatorCreateIfNeeded:(BOOL)a3
{
  if (a3 && !self->_preMyriadCoordinator)
  {
    id v4 = objc_alloc_init(CSPreMyriadCoordinator);
    preMyriadCoordinator = self->_preMyriadCoordinator;
    self->_preMyriadCoordinator = v4;

    int v6 = self->_preMyriadCoordinator;
    int v7 = [(CSSpeechManager *)self _voiceTriggerEventNotifierCreateIfNeeded:1];
    [(CSPreMyriadCoordinator *)v6 setDelegate:v7];
  }
  uint64_t v8 = self->_preMyriadCoordinator;
  return v8;
}

- (id)_voiceTriggerEventNotifierCreateIfNeeded:(BOOL)a3
{
  if (a3 && !self->_voiceTriggerEventsCoordinator)
  {
    id v4 = +[CSVoiceTriggerEventsCoordinator sharedInstance];
    voiceTriggerEventsCoordinator = self->_voiceTriggerEventsCoordinator;
    self->_voiceTriggerEventsCoordinator = v4;

    [(CSVoiceTriggerEventsCoordinator *)self->_voiceTriggerEventsCoordinator start];
    int v6 = self->_voiceTriggerEventsCoordinator;
    int v7 = +[CSVoiceTriggerStatistics sharedInstance];
    [(CSVoiceTriggerEventsCoordinator *)v6 registerObserver:v7];

    id WeakRetained = objc_loadWeakRetained(&self->_clientController);
    if (WeakRetained)
    {
      __int16 v9 = self->_voiceTriggerEventsCoordinator;
      id v10 = objc_loadWeakRetained(&self->_clientController);
      [(CSVoiceTriggerEventsCoordinator *)v9 registerObserver:v10];
    }
  }
  id v11 = self->_voiceTriggerEventsCoordinator;
  return v11;
}

- (void)_getVoiceTriggerAssetIfNeeded:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10013AA58;
  v6[3] = &unk_100252C58;
  id v3 = a3;
  id v7 = v3;
  id v4 = objc_retainBlock(v6);
  if ((+[CSUtils isLocalVoiceTriggerAvailable] & 1) != 0
    || +[CSUtils supportBluetoothDeviceVoiceTrigger])
  {
    int v5 = +[CSVoiceTriggerAssetHandler sharedHandler];
    [v5 getVoiceTriggerAssetWithEndpointId:0 completion:v4];
  }
  else
  {
    ((void (*)(void *, void, void))v4[2])(v4, 0, 0);
  }
}

- (CSAudioTapProvider)audioTapProvider
{
  return self->_audioTapProvider;
}

- (void)startManager
{
  id v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v13 = "-[CSSpeechManager startManager]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10013AC80;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_sync(queue, block);
  [(CSSpeechManager *)self _startClearLoggingFilesTimer];
  if (+[CSUtils supportHearstVoiceTrigger])
  {
    int v5 = +[CSDeviceActivationEventNotificationHandler sharedInstance];
    [v5 setDelegate:self forType:2];

    int v6 = +[CSDeviceActivationEventNotificationHandler sharedInstance];
    [v6 setDelegate:self forType:3];
  }
  if (+[CSUtils supportRemoraVoiceTrigger])
  {
    id v7 = +[CSDeviceActivationEventNotificationHandler sharedInstance];
    [v7 setDelegate:self forType:8];
  }
  if (+[CSUtils supportJarvisVoiceTrigger])
  {
    uint64_t v8 = +[CSDeviceActivationEventNotificationHandler sharedInstance];
    [v8 setDelegate:self forType:6];
  }
  __int16 v9 = +[CSOpportuneSpeakEventMonitor sharedInstance];
  [v9 addObserver:self];

  id v10 = +[CSAudioServerCrashMonitor sharedInstance];
  [v10 addObserver:self];

  +[CSAudioRecorder createSharedAudioSession];
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CSSpeechManager;
  [(CSSpeechManager *)&v4 dealloc];
}

- (CSSpeechManager)initWithExclaveHardware:(BOOL)a3 assetHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(CSSpeechManager *)self init];
  [(CSSpeechManager *)v7 setIsExclaveHardware:v4];
  if (v6) {
    [(CSSpeechManager *)v7 setAssetHandler:v6];
  }

  return v7;
}

- (CSSpeechManager)init
{
  kdebug_trace();
  v17.receiver = self;
  v17.super_class = (Class)CSSpeechManager;
  id v3 = [(CSSpeechManager *)&v17 init];
  if (v3)
  {
    CSLogInitIfNeeded();
    id v4 = [(id)objc_opt_class() description];
    int v5 = (const char *)[v4 UTF8String];
    id v6 = dispatch_get_global_queue(33, 0);
    dispatch_queue_t v7 = dispatch_queue_create_with_target_V2(v5, 0, v6);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("CSSpeechManager Asset Query Queue", 0);
    assetQueryQueue = v3->_assetQueryQueue;
    v3->_assetQueryQueue = (OS_dispatch_queue *)v9;

    if ((CSIsHorseman() & 1) != 0 || CSIsIOS()) {
      [(CSSpeechManager *)v3 _createClearLoggingFileTimer];
    }
    uint64_t v11 = +[NSMutableDictionary dictionary];
    audioProviders = v3->_audioProviders;
    v3->_audioProviders = (NSMutableDictionary *)v11;

    audioTapProvider = v3->_audioTapProvider;
    v3->_audioTapProvider = 0;

    uint64_t v14 = +[CSPostBuildInstallService sharedService];
    postBuildInstallService = v3->_postBuildInstallService;
    v3->_postBuildInstallService = (CSPostBuildInstallService *)v14;

    [(CSPostBuildInstallService *)v3->_postBuildInstallService registerPostBuildInstallService];
    v3->_isExclaveHardware = +[CSUtils isExclaveHardware];
    v3->_assetHandler = (CSVoiceTriggerAssetHandler *)+[CSVoiceTriggerAssetHandler sharedHandler];
  }
  kdebug_trace();
  return v3;
}

+ (id)sharedManagerForCoreSpeechDaemon
{
  if (qword_1002A3B30 != -1) {
    dispatch_once(&qword_1002A3B30, &stru_100252328);
  }
  v2 = (void *)qword_1002A3B28;
  return v2;
}

+ (id)sharedManager
{
  return 0;
}

@end