@interface CSAttSiriManager
- (CSAttSiriConnectionManager)connectionManager;
- (CSAttSiriController)attSiriController;
- (CSAttSiriManager)init;
- (CSAttSiriManager)initWithAttSiriController:(id)a3 icRequestHandler:(id)a4 attendingUsecaseManager:(id)a5 attendingServiceListener:(id)a6 attendingStatesServiceListener:(id)a7 attendingConnectionManager:(id)a8 attendingStatesProvidingProxy:(id)a9;
- (CSAttendingServiceListener)attendingServiceListener;
- (CSAttendingStatesMessageHandler)attendingStatesMessageHandler;
- (CSAttendingStatesProvidingProxy)localAttendingStatesProvidingProxy;
- (CSAttendingStatesServiceListener)attendingStatesServiceListener;
- (CSAttendingUsecaseManager)attendingUsecaseManager;
- (CSIntuitiveConvRequestHandler)icRequestHandler;
- (CSLocalAttendingInitiator)localAttendingInitiator;
- (void)_setupAttendingServiceListener;
- (void)_setupAttendingStatesServiceListener;
- (void)setAttSiriController:(id)a3;
- (void)setAttendingServiceListener:(id)a3;
- (void)setAttendingStatesMessageHandler:(id)a3;
- (void)setAttendingStatesServiceListener:(id)a3;
- (void)setAttendingUsecaseManager:(id)a3;
- (void)setConnectionManager:(id)a3;
- (void)setIcRequestHandler:(id)a3;
- (void)setLocalAttendingInitiator:(id)a3;
- (void)setLocalAttendingStatesProvidingProxy:(id)a3;
- (void)setup;
- (void)setupListeners;
- (void)start;
@end

@implementation CSAttSiriManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attendingStatesMessageHandler, 0);
  objc_storeStrong((id *)&self->_localAttendingStatesProvidingProxy, 0);
  objc_storeStrong((id *)&self->_localAttendingInitiator, 0);
  objc_storeStrong((id *)&self->_connectionManager, 0);
  objc_storeStrong((id *)&self->_attendingStatesServiceListener, 0);
  objc_storeStrong((id *)&self->_attendingServiceListener, 0);
  objc_storeStrong((id *)&self->_attendingUsecaseManager, 0);
  objc_storeStrong((id *)&self->_icRequestHandler, 0);
  objc_storeStrong((id *)&self->_attSiriController, 0);
}

- (void)setAttendingStatesMessageHandler:(id)a3
{
}

- (CSAttendingStatesMessageHandler)attendingStatesMessageHandler
{
  return self->_attendingStatesMessageHandler;
}

- (void)setLocalAttendingStatesProvidingProxy:(id)a3
{
}

- (CSAttendingStatesProvidingProxy)localAttendingStatesProvidingProxy
{
  return self->_localAttendingStatesProvidingProxy;
}

- (void)setLocalAttendingInitiator:(id)a3
{
}

- (CSLocalAttendingInitiator)localAttendingInitiator
{
  return self->_localAttendingInitiator;
}

- (void)setConnectionManager:(id)a3
{
}

- (CSAttSiriConnectionManager)connectionManager
{
  return self->_connectionManager;
}

- (void)setAttendingStatesServiceListener:(id)a3
{
}

- (CSAttendingStatesServiceListener)attendingStatesServiceListener
{
  return self->_attendingStatesServiceListener;
}

- (void)setAttendingServiceListener:(id)a3
{
}

- (CSAttendingServiceListener)attendingServiceListener
{
  return self->_attendingServiceListener;
}

- (void)setAttendingUsecaseManager:(id)a3
{
}

- (CSAttendingUsecaseManager)attendingUsecaseManager
{
  return self->_attendingUsecaseManager;
}

- (void)setIcRequestHandler:(id)a3
{
}

- (CSIntuitiveConvRequestHandler)icRequestHandler
{
  return self->_icRequestHandler;
}

- (void)setAttSiriController:(id)a3
{
}

- (CSAttSiriController)attSiriController
{
  return self->_attSiriController;
}

- (void)_setupAttendingStatesServiceListener
{
  if (self->_localAttendingStatesProvidingProxy)
  {
    -[CSAttendingStatesServiceListener registerAttendingStatesProvidingProxy:](self->_attendingStatesServiceListener, "registerAttendingStatesProvidingProxy:");
    attendingStatesServiceListener = self->_attendingStatesServiceListener;
    [(CSAttendingStatesServiceListener *)attendingStatesServiceListener listen];
  }
}

- (void)_setupAttendingServiceListener
{
  if (self->_attendingUsecaseManager)
  {
    -[CSAttendingServiceListener registerAttendingUsecaseManager:](self->_attendingServiceListener, "registerAttendingUsecaseManager:");
    [(CSAttendingServiceListener *)self->_attendingServiceListener registerAttendingStatesProvidingProxy:self->_localAttendingStatesProvidingProxy];
    [(CSAttendingServiceListener *)self->_attendingServiceListener resumeConnection];
    v3 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      attendingServiceListener = self->_attendingServiceListener;
      int v5 = 136315394;
      v6 = "-[CSAttSiriManager _setupAttendingServiceListener]";
      __int16 v7 = 2112;
      v8 = attendingServiceListener;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s AttendingServiceListener xpc connection started listening: _attendingServiceListener=%@", (uint8_t *)&v5, 0x16u);
    }
  }
}

- (void)start
{
  [(CSAttSiriController *)self->_attSiriController start];
  icRequestHandler = self->_icRequestHandler;
  [(CSIntuitiveConvRequestHandler *)icRequestHandler start];
}

- (void)setup
{
}

- (void)setupListeners
{
  attSiriController = self->_attSiriController;
  if (attSiriController)
  {
    v4 = [(CSAttSiriController *)attSiriController getNodeOfType:1];
    int v5 = [(CSAttSiriController *)self->_attSiriController getNodeOfType:2];
    v6 = [(CSAttSiriController *)self->_attSiriController getNodeOfType:10];
    connectionManager = self->_connectionManager;
    v8 = [(CSAttSiriController *)self->_attSiriController rcHandler];
    [(CSAttSiriConnectionManager *)connectionManager setupListenersForEndpointerNode:v4 asrNode:v5 ssrNode:v6 rcHandler:v8];
  }
  icRequestHandler = self->_icRequestHandler;
  if (icRequestHandler)
  {
    v10 = self->_connectionManager;
    v11 = [(CSIntuitiveConvRequestHandler *)icRequestHandler getEndpointerProxyObj];
    v12 = [(CSIntuitiveConvRequestHandler *)self->_icRequestHandler getAsrProxyObj];
    v13 = [(CSIntuitiveConvRequestHandler *)self->_icRequestHandler getSsrProxyObj];
    v14 = [(CSIntuitiveConvRequestHandler *)self->_icRequestHandler getRcHandlerProxyObj];
    [(CSAttSiriConnectionManager *)v10 setupListenersForEndpointerNode:v11 asrNode:v12 ssrNode:v13 rcHandler:v14];

    if (+[CSUtils supportsAudioMessage])
    {
      v15 = self->_connectionManager;
      v16 = [(CSIntuitiveConvRequestHandler *)self->_icRequestHandler getAudioMessageServiceProxyObj];
      [(CSAttSiriConnectionManager *)v15 setupAudioMessageServiceListnerWithProxy:v16];
    }
  }
  if (+[CSUtils isMedocFeatureEnabled])
  {
    [(CSAttSiriManager *)self _setupAttendingServiceListener];
    [(CSAttSiriManager *)self _setupAttendingStatesServiceListener];
  }
  else
  {
    v17 = self->_connectionManager;
    -[CSAttSiriConnectionManager setupAttSiriServiceListenerWithAttSiriController:](v17, "setupAttSiriServiceListenerWithAttSiriController:");
  }
}

- (CSAttSiriManager)init
{
  if (+[CSUtils isAttentiveSiriEnabled])
  {
    self = [(CSAttSiriManager *)self initWithAttSiriController:0 icRequestHandler:0 attendingUsecaseManager:0 attendingServiceListener:0 attendingStatesServiceListener:0 attendingConnectionManager:0 attendingStatesProvidingProxy:0];
    v3 = self;
  }
  else
  {
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v7 = "-[CSAttSiriManager init]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Attentive Siri not supported on device", buf, 0xCu);
    }
    v3 = 0;
  }

  return v3;
}

- (CSAttSiriManager)initWithAttSiriController:(id)a3 icRequestHandler:(id)a4 attendingUsecaseManager:(id)a5 attendingServiceListener:(id)a6 attendingStatesServiceListener:(id)a7 attendingConnectionManager:(id)a8 attendingStatesProvidingProxy:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  v51.receiver = self;
  v51.super_class = (Class)CSAttSiriManager;
  v23 = [(CSAttSiriManager *)&v51 init];
  if (v23)
  {
    CSLogInitIfNeeded();
    if (+[CSUtils isMedocFeatureEnabled])
    {
      v24 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v53 = "-[CSAttSiriManager initWithAttSiriController:icRequestHandler:attendingUsecaseManager:attendingServiceList"
              "ener:attendingStatesServiceListener:attendingConnectionManager:attendingStatesProvidingProxy:]";
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s Medoc feature flag is Enabled, swtich to new request handler", buf, 0xCu);
      }
      if (v18) {
        v25 = (CSAttendingUsecaseManager *)v18;
      }
      else {
        v25 = objc_alloc_init(CSAttendingUsecaseManager);
      }
      attendingUsecaseManager = v23->_attendingUsecaseManager;
      v23->_attendingUsecaseManager = v25;

      v27 = [CSLocalAttendingInitiator alloc];
      v28 = [(CSAttendingUsecaseManager *)v23->_attendingUsecaseManager usecaseForType:0];
      v29 = [(CSLocalAttendingInitiator *)v27 initWithAttendingUsecase:v28];
      localAttendingInitiator = v23->_localAttendingInitiator;
      v23->_localAttendingInitiator = v29;

      v31 = [[CSLocalAttendingHintProvider alloc] initWithAttendingIniting:v23->_localAttendingInitiator];
      v32 = objc_alloc_init(CSAttendingStatesMessageHandler);
      attendingStatesMessageHandler = v23->_attendingStatesMessageHandler;
      v23->_attendingStatesMessageHandler = v32;

      if (v22) {
        v34 = (CSAttendingStatesProvidingProxy *)v22;
      }
      else {
        v34 = objc_alloc_init(CSAttendingStatesProvidingProxy);
      }
      localAttendingStatesProvidingProxy = v23->_localAttendingStatesProvidingProxy;
      v23->_localAttendingStatesProvidingProxy = v34;

      [(CSAttendingStatesProvidingProxy *)v23->_localAttendingStatesProvidingProxy registerAttendingHintProvider:v31];
      [(CSAttendingStatesMessageHandler *)v23->_attendingStatesMessageHandler setDelegate:v23->_localAttendingStatesProvidingProxy];
      [(CSLocalAttendingInitiator *)v23->_localAttendingInitiator setDelegate:v23->_attendingStatesMessageHandler];
      v39 = +[CSSiriClientBehaviorMonitor sharedInstance];
      [v39 registerObserver:v23->_localAttendingInitiator];

      v40 = +[CSIntuitiveConvAudioCaptureMonitor sharedInstance];
      [v40 registerObserver:v23->_localAttendingInitiator];

      if (v17) {
        v41 = (CSIntuitiveConvRequestHandler *)v17;
      }
      else {
        v41 = objc_alloc_init(CSIntuitiveConvRequestHandler);
      }
      icRequestHandler = v23->_icRequestHandler;
      v23->_icRequestHandler = v41;

      [(CSIntuitiveConvRequestHandler *)v23->_icRequestHandler setHintProvider:v31];
      [(CSIntuitiveConvRequestHandler *)v23->_icRequestHandler setAttendingStatesMessageHandler:v23->_attendingStatesMessageHandler];
      [(CSAttendingStatesProvidingProxy *)v23->_localAttendingStatesProvidingProxy addDismissUpdateReceiver:v23->_icRequestHandler];
      [(CSAttendingStatesProvidingProxy *)v23->_localAttendingStatesProvidingProxy addSiriPromptUpdateReceiver:v23->_icRequestHandler];
      [(CSAttendingStatesProvidingProxy *)v23->_localAttendingStatesProvidingProxy addDismissUpdateReceiver:v23->_attendingStatesMessageHandler];
      if (v19) {
        v43 = (CSAttendingServiceListener *)v19;
      }
      else {
        v43 = objc_alloc_init(CSAttendingServiceListener);
      }
      attendingServiceListener = v23->_attendingServiceListener;
      v23->_attendingServiceListener = v43;

      if (v20) {
        v45 = (CSAttendingStatesServiceListener *)v20;
      }
      else {
        v45 = objc_alloc_init(CSAttendingStatesServiceListener);
      }
      attendingStatesServiceListener = v23->_attendingStatesServiceListener;
      v23->_attendingStatesServiceListener = v45;
    }
    else if (v16)
    {
      objc_storeStrong((id *)&v23->_attSiriController, a3);
    }
    else
    {
      v35 = objc_alloc_init(CSAttSiriController);
      attSiriController = v23->_attSiriController;
      v23->_attSiriController = v35;

      v37 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v53 = "-[CSAttSiriManager initWithAttSiriController:icRequestHandler:attendingUsecaseManager:attendingServiceList"
              "ener:attendingStatesServiceListener:attendingConnectionManager:attendingStatesProvidingProxy:]";
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%s Intuitive Conversation Disabled, fallback to attsiri controller", buf, 0xCu);
      }
    }
    if (v21) {
      v47 = (CSAttSiriConnectionManager *)v21;
    }
    else {
      v47 = objc_alloc_init(CSAttSiriConnectionManager);
    }
    connectionManager = v23->_connectionManager;
    v23->_connectionManager = v47;

    v49 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "-[CSAttSiriManager initWithAttSiriController:icRequestHandler:attendingUsecaseManager:attendingServiceListen"
            "er:attendingStatesServiceListener:attendingConnectionManager:attendingStatesProvidingProxy:]";
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
  }

  return v23;
}

@end