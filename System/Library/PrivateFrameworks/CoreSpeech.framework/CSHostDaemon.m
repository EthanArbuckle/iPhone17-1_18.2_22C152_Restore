@interface CSHostDaemon
+ (id)sharedDaemon;
- (CESRXPCActivity)cesrXPCActvity;
- (CSAttSiriManager)attSiriManager;
- (CSAudioInjectionXPCListener)audioInjectionXpcListener;
- (CSAudioPowerServiceListener)audioPowerServiceListener;
- (CSBenchmarkXPCListener)benchmarkXpcListener;
- (CSCoreSpeechServicesListener)corespeechServiceListener;
- (CSDarwinVoiceTriggerHandlerPool)darwinVoiceTriggerHandlerPool;
- (CSDeviceActivationXPCListener)activationXpcListener;
- (CSHostDaemon)init;
- (CSPDispatcher)cspDispatcher;
- (CSSpeechManager)speechManager;
- (CSSpeechModelTrainingXPCManager)speechModelTrainingXpcManager;
- (CSSpeechUaapXPCListener)uaapServiceListener;
- (CSVoiceIdXPCListener)voiceIdXpcListener;
- (CSVoiceTriggerXPCListener)voiceTriggerXpcListener;
- (CSXPCActivity)csXPCActivity;
- (CSXPCListener)xpcListener;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)signalSource;
- (SSRRPISamplingXPCListener)samplingXPCLListener;
- (SSRSpeakerProfileEmbeddingServiceListener)speakerProfileEmbeddingServiceListener;
- (SSRVTUITrainingListener)vtuiTrainingListener;
- (SSRVTUITrainingMessageHandler)trainingMessageHandler;
- (void)_daemonDidLaunch;
- (void)_daemonWillShutdown;
- (void)_setupDistnoteHandlers;
- (void)_setupNotifyHandlers;
- (void)didLaunch;
- (void)requestAudioProviderForTrainingWithSyncBlock:(id)a3;
- (void)setActivationXpcListener:(id)a3;
- (void)setAttSiriManager:(id)a3;
- (void)setAudioInjectionXpcListener:(id)a3;
- (void)setAudioPowerServiceListener:(id)a3;
- (void)setBenchmarkXpcListener:(id)a3;
- (void)setCesrXPCActvity:(id)a3;
- (void)setCorespeechServiceListener:(id)a3;
- (void)setCsXPCActivity:(id)a3;
- (void)setCspDispatcher:(id)a3;
- (void)setDarwinVoiceTriggerHandlerPool:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSamplingXPCLListener:(id)a3;
- (void)setSignalSource:(id)a3;
- (void)setSpeakerProfileEmbeddingServiceListener:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)setSpeechModelTrainingXpcManager:(id)a3;
- (void)setTrainingMessageHandler:(id)a3;
- (void)setUaapServiceListener:(id)a3;
- (void)setVoiceIdXpcListener:(id)a3;
- (void)setVoiceTriggerXpcListener:(id)a3;
- (void)setVtuiTrainingListener:(id)a3;
- (void)setXpcListener:(id)a3;
- (void)shutdown;
@end

@implementation CSHostDaemon

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainingMessageHandler, 0);
  objc_storeStrong((id *)&self->_cspDispatcher, 0);
  objc_storeStrong((id *)&self->_csXPCActivity, 0);
  objc_storeStrong((id *)&self->_cesrXPCActvity, 0);
  objc_storeStrong((id *)&self->_darwinVoiceTriggerHandlerPool, 0);
  objc_storeStrong((id *)&self->_signalSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_samplingXPCLListener, 0);
  objc_storeStrong((id *)&self->_speakerProfileEmbeddingServiceListener, 0);
  objc_storeStrong((id *)&self->_vtuiTrainingListener, 0);
  objc_storeStrong((id *)&self->_benchmarkXpcListener, 0);
  objc_storeStrong((id *)&self->_speechModelTrainingXpcManager, 0);
  objc_storeStrong((id *)&self->_uaapServiceListener, 0);
  objc_storeStrong((id *)&self->_audioPowerServiceListener, 0);
  objc_storeStrong((id *)&self->_corespeechServiceListener, 0);
  objc_storeStrong((id *)&self->_attSiriManager, 0);
  objc_storeStrong((id *)&self->_audioInjectionXpcListener, 0);
  objc_storeStrong((id *)&self->_voiceTriggerXpcListener, 0);
  objc_storeStrong((id *)&self->_voiceIdXpcListener, 0);
  objc_storeStrong((id *)&self->_activationXpcListener, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_speechManager, 0);
}

- (void)setTrainingMessageHandler:(id)a3
{
}

- (SSRVTUITrainingMessageHandler)trainingMessageHandler
{
  return self->_trainingMessageHandler;
}

- (void)setCspDispatcher:(id)a3
{
}

- (CSPDispatcher)cspDispatcher
{
  return self->_cspDispatcher;
}

- (void)setCsXPCActivity:(id)a3
{
}

- (CSXPCActivity)csXPCActivity
{
  return self->_csXPCActivity;
}

- (void)setCesrXPCActvity:(id)a3
{
}

- (CESRXPCActivity)cesrXPCActvity
{
  return self->_cesrXPCActvity;
}

- (void)setDarwinVoiceTriggerHandlerPool:(id)a3
{
}

- (CSDarwinVoiceTriggerHandlerPool)darwinVoiceTriggerHandlerPool
{
  return self->_darwinVoiceTriggerHandlerPool;
}

- (void)setSignalSource:(id)a3
{
}

- (OS_dispatch_source)signalSource
{
  return self->_signalSource;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setSamplingXPCLListener:(id)a3
{
}

- (SSRRPISamplingXPCListener)samplingXPCLListener
{
  return self->_samplingXPCLListener;
}

- (void)setSpeakerProfileEmbeddingServiceListener:(id)a3
{
}

- (SSRSpeakerProfileEmbeddingServiceListener)speakerProfileEmbeddingServiceListener
{
  return self->_speakerProfileEmbeddingServiceListener;
}

- (void)setVtuiTrainingListener:(id)a3
{
}

- (SSRVTUITrainingListener)vtuiTrainingListener
{
  return self->_vtuiTrainingListener;
}

- (void)setBenchmarkXpcListener:(id)a3
{
}

- (CSBenchmarkXPCListener)benchmarkXpcListener
{
  return self->_benchmarkXpcListener;
}

- (void)setSpeechModelTrainingXpcManager:(id)a3
{
}

- (CSSpeechModelTrainingXPCManager)speechModelTrainingXpcManager
{
  return self->_speechModelTrainingXpcManager;
}

- (void)setUaapServiceListener:(id)a3
{
}

- (CSSpeechUaapXPCListener)uaapServiceListener
{
  return self->_uaapServiceListener;
}

- (void)setAudioPowerServiceListener:(id)a3
{
}

- (CSAudioPowerServiceListener)audioPowerServiceListener
{
  return self->_audioPowerServiceListener;
}

- (void)setCorespeechServiceListener:(id)a3
{
}

- (CSCoreSpeechServicesListener)corespeechServiceListener
{
  return self->_corespeechServiceListener;
}

- (void)setAttSiriManager:(id)a3
{
}

- (CSAttSiriManager)attSiriManager
{
  return self->_attSiriManager;
}

- (void)setAudioInjectionXpcListener:(id)a3
{
}

- (CSAudioInjectionXPCListener)audioInjectionXpcListener
{
  return self->_audioInjectionXpcListener;
}

- (void)setVoiceTriggerXpcListener:(id)a3
{
}

- (CSVoiceTriggerXPCListener)voiceTriggerXpcListener
{
  return self->_voiceTriggerXpcListener;
}

- (void)setVoiceIdXpcListener:(id)a3
{
}

- (CSVoiceIdXPCListener)voiceIdXpcListener
{
  return self->_voiceIdXpcListener;
}

- (void)setActivationXpcListener:(id)a3
{
}

- (CSDeviceActivationXPCListener)activationXpcListener
{
  return self->_activationXpcListener;
}

- (void)setXpcListener:(id)a3
{
}

- (CSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setSpeechManager:(id)a3
{
}

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)requestAudioProviderForTrainingWithSyncBlock:(id)a3
{
  if (a3)
  {
    v3 = (void (**)(id, id))a3;
    v4 = +[CSSpeechManager sharedManagerForCoreSpeechDaemon];
    v5 = +[CSAudioRecordContext contextForVoiceTriggerTraining];
    id v6 = [v4 audioProviderWithContext:v5 error:0];

    v3[2](v3, v6);
  }
}

- (void)_daemonWillShutdown
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[CSHostDaemon _daemonWillShutdown]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Daemon WillShutdown", (uint8_t *)&v4, 0xCu);
  }
  [(CSDarwinVoiceTriggerHandlerPool *)self->_darwinVoiceTriggerHandlerPool stop];
}

- (void)_setupDistnoteHandlers
{
}

- (void)_setupNotifyHandlers
{
  queue = self->_queue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1001445D4;
  handler[3] = &unk_1002528C0;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", queue, handler);
}

- (void)_daemonDidLaunch
{
  [(CSHostDaemon *)self _setupNotifyHandlers];
  [(CSHostDaemon *)self _setupDistnoteHandlers];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    v14 = "-[CSHostDaemon _daemonDidLaunch]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s CSHostDaemon didLaunch", (uint8_t *)&v13, 0xCu);
  }
  int v4 = objc_alloc_init(CSCoreSpeechDKeepAliveHandler);
  [(CSCoreSpeechDKeepAliveHandler *)v4 start];
  [(CSSpeechManager *)self->_speechManager startManager];
  [(CSAttSiriManager *)self->_attSiriManager setup];
  [(CSXPCListener *)self->_xpcListener listen];
  [(CSDeviceActivationXPCListener *)self->_activationXpcListener listen];
  [(CSVoiceIdXPCListener *)self->_voiceIdXpcListener listen];
  [(CSVoiceTriggerXPCListener *)self->_voiceTriggerXpcListener listen];
  [(CSAudioInjectionXPCListener *)self->_audioInjectionXpcListener listen];
  [(CSAttSiriManager *)self->_attSiriManager setupListeners];
  [(CSCoreSpeechServicesListener *)self->_corespeechServiceListener listen];
  [(CSBenchmarkXPCListener *)self->_benchmarkXpcListener listen];
  [(SSRRPISamplingXPCListener *)self->_samplingXPCLListener listen];
  [(CSAudioPowerServiceListener *)self->_audioPowerServiceListener listen];
  [(CSSpeechUaapXPCListener *)self->_uaapServiceListener listen];
  if (_os_feature_enabled_impl()) {
    sub_100060F34(0, 0, 0);
  }
  [(SSRVTUITrainingListener *)self->_vtuiTrainingListener listen];
  trainingMessageHandler = self->_trainingMessageHandler;
  if (trainingMessageHandler) {
    [(SSRVTUITrainingMessageHandler *)trainingMessageHandler setAudioSessionDelegate:self];
  }
  id v6 = +[CSConnectionListener createSmartSiriVolumeListener];
  v7 = +[CSCoreSpeechDaemonStateMonitor sharedInstance];
  [v7 notifyDaemonStateChanged:1];

  [(CSAttSiriManager *)self->_attSiriManager start];
  [(CSSpeechModelTrainingXPCManager *)self->_speechModelTrainingXpcManager registerXPCActivities];
  [(CESRXPCActivity *)self->_cesrXPCActvity registerXPCActivities];
  v8 = [CSDarwinVoiceTriggerHandlerPool alloc];
  v9 = +[CSVoiceTriggerEventsCoordinator sharedInstance];
  v10 = [(CSDarwinVoiceTriggerHandlerPool *)v8 initWithVoiceTriggerEventsCoordinator:v9];
  darwinVoiceTriggerHandlerPool = self->_darwinVoiceTriggerHandlerPool;
  self->_darwinVoiceTriggerHandlerPool = v10;

  [(CSDarwinVoiceTriggerHandlerPool *)self->_darwinVoiceTriggerHandlerPool start];
  id v12 = +[CSBluetoothManager sharedInstance];
  [(CSXPCActivity *)self->_csXPCActivity registerXPCActivities];
  [(CSPDispatcher *)self->_cspDispatcher registerXPCActivities];
  [(CSPDispatcher *)self->_cspDispatcher setupXPCListeners];
  [(SSRSpeakerProfileEmbeddingServiceListener *)self->_speakerProfileEmbeddingServiceListener resumeConnection];
  dispatch_activate((dispatch_object_t)self->_queue);
}

- (void)shutdown
{
}

- (void)didLaunch
{
}

- (CSHostDaemon)init
{
  v50.receiver = self;
  v50.super_class = (Class)CSHostDaemon;
  id v2 = [(CSHostDaemon *)&v50 init];
  if (v2)
  {
    CSLogInitIfNeeded();
    signal(15, (void (__cdecl *)(int))1);
    v3 = dispatch_get_global_queue(25, 0);
    dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v3);
    v5 = (void *)*((void *)v2 + 17);
    *((void *)v2 + 17) = v4;

    id v6 = *((void *)v2 + 17);
    if (v6)
    {
      dispatch_source_set_event_handler(v6, &stru_100252878);
      dispatch_resume(*((dispatch_object_t *)v2 + 17));
    }
    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v8 = dispatch_queue_attr_make_initially_inactive(v7);

    dispatch_queue_t v9 = dispatch_queue_create("CSHostDaemon", v8);
    v10 = (void *)*((void *)v2 + 16);
    *((void *)v2 + 16) = v9;

    uint64_t v11 = +[CSSpeechManager sharedManagerForCoreSpeechDaemon];
    id v12 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v11;

    int v13 = objc_alloc_init(CSXPCListener);
    v14 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v13;

    id v15 = objc_alloc_init((Class)CSDeviceActivationXPCListener);
    v16 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v15;

    v17 = objc_alloc_init(CSVoiceIdXPCListener);
    v18 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v17;

    v19 = objc_alloc_init(CSVoiceTriggerXPCListener);
    v20 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v19;

    v21 = objc_alloc_init(CSAudioInjectionXPCListener);
    v22 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v21;

    v23 = objc_alloc_init(CSAttSiriManager);
    v24 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v23;

    v25 = objc_alloc_init(CSCoreSpeechServicesListener);
    v26 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v25;

    v27 = objc_alloc_init(CSSpeechModelTrainingXPCManager);
    v28 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v27;

    v29 = objc_alloc_init(CSBenchmarkXPCListener);
    v30 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = v29;

    if (CSIsIOS())
    {
      id v31 = objc_alloc_init((Class)SSRRPISamplingXPCListener);
      v32 = (void *)*((void *)v2 + 15);
      *((void *)v2 + 15) = v31;
    }
    v33 = objc_alloc_init(CSAudioPowerServiceListener);
    v34 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v33;

    v35 = objc_alloc_init(CSSpeechUaapXPCListener);
    v36 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v35;

    if (+[CSUtils isExclaveHardware])
    {
      id v37 = objc_alloc_init((Class)SSRVTUITrainingMessageHandler);
      v38 = (void *)*((void *)v2 + 22);
      *((void *)v2 + 22) = v37;

      id v39 = [objc_alloc((Class)SSRVTUITrainingListener) initWithMessageHandler:*((void *)v2 + 22)];
      v40 = (void *)*((void *)v2 + 13);
      *((void *)v2 + 13) = v39;
    }
    v41 = objc_alloc_init(CESRXPCActivity);
    v42 = (void *)*((void *)v2 + 19);
    *((void *)v2 + 19) = v41;

    v43 = objc_alloc_init(CSXPCActivity);
    v44 = (void *)*((void *)v2 + 20);
    *((void *)v2 + 20) = v43;

    uint64_t v45 = +[CSPDispatcher sharedDispatcher];
    v46 = (void *)*((void *)v2 + 21);
    *((void *)v2 + 21) = v45;

    v47 = objc_alloc_init(CSAssetDownloadingOption);
    [(CSAssetDownloadingOption *)v47 setAllowVoiceTriggerAssetDownloading:1];
    [(CSAssetDownloadingOption *)v47 setAllowVoiceTriggerAccessoryAssetDownloading:1];
    v48 = +[CSAssetManager sharedManager];
    [v48 setAssetDownloadingOption:v47];
  }
  return (CSHostDaemon *)v2;
}

+ (id)sharedDaemon
{
  if (qword_1002A3B78 != -1) {
    dispatch_once(&qword_1002A3B78, &stru_100252858);
  }
  id v2 = (void *)qword_1002A3B70;
  return v2;
}

@end