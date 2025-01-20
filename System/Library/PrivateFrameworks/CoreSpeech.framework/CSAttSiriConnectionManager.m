@interface CSAttSiriConnectionManager
- (CSAttSiriConnectionManager)init;
- (CSConnectionListener)attSiriSvcListener;
- (CSConnectionListener)audioMessageServiceListener;
- (CSConnectionListener)endpointerListener;
- (CSConnectionListener)localSpeechRecognitionListener;
- (CSConnectionListener)rcProcessingListener;
- (CSConnectionListener)ssrListener;
- (void)_setupEndpointListenerWithEndpointerNode:(id)a3;
- (void)_setupRCProcessingListenerWithRCHandler:(id)a3;
- (void)_setupSSRListenerWithSSRNode:(id)a3;
- (void)setAttSiriSvcListener:(id)a3;
- (void)setAudioMessageServiceListener:(id)a3;
- (void)setEndpointerListener:(id)a3;
- (void)setLocalSpeechRecognitionListener:(id)a3;
- (void)setRcProcessingListener:(id)a3;
- (void)setSsrListener:(id)a3;
- (void)setupAttSiriServiceListenerWithAttSiriController:(id)a3;
- (void)setupAudioMessageServiceListnerWithProxy:(id)a3;
- (void)setupListenersForEndpointerNode:(id)a3 asrNode:(id)a4 ssrNode:(id)a5 rcHandler:(id)a6;
- (void)setupLocalSpeechRecognitionListenerWithXPCListener:(id)a3 machService:(id)a4 asrNode:(id)a5 ssrNode:(id)a6;
@end

@implementation CSAttSiriConnectionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioMessageServiceListener, 0);
  objc_storeStrong((id *)&self->_attSiriSvcListener, 0);
  objc_storeStrong((id *)&self->_rcProcessingListener, 0);
  objc_storeStrong((id *)&self->_ssrListener, 0);
  objc_storeStrong((id *)&self->_localSpeechRecognitionListener, 0);
  objc_storeStrong((id *)&self->_endpointerListener, 0);
}

- (void)setAudioMessageServiceListener:(id)a3
{
}

- (CSConnectionListener)audioMessageServiceListener
{
  return self->_audioMessageServiceListener;
}

- (void)setAttSiriSvcListener:(id)a3
{
}

- (CSConnectionListener)attSiriSvcListener
{
  return self->_attSiriSvcListener;
}

- (void)setRcProcessingListener:(id)a3
{
}

- (CSConnectionListener)rcProcessingListener
{
  return self->_rcProcessingListener;
}

- (void)setSsrListener:(id)a3
{
}

- (CSConnectionListener)ssrListener
{
  return self->_ssrListener;
}

- (void)setLocalSpeechRecognitionListener:(id)a3
{
}

- (CSConnectionListener)localSpeechRecognitionListener
{
  return self->_localSpeechRecognitionListener;
}

- (void)setEndpointerListener:(id)a3
{
}

- (CSConnectionListener)endpointerListener
{
  return self->_endpointerListener;
}

- (void)_setupRCProcessingListenerWithRCHandler:(id)a3
{
  id v4 = a3;
  v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CSRCHandlingXPCService];
  v6 = +[CSUtils getSerialQueue:@"com.apple.CoreSpeech.Connection.Listener.rchandling" qualityOfService:33];
  v7 = [[CSConnectionListener alloc] initWithMachService:@"com.apple.corespeech.corespeechd.rchandling.service" withServiceInterface:v5 withServiceObject:v4 withDelegateInterface:0 queue:v6];

  rcProcessingListener = self->_rcProcessingListener;
  self->_rcProcessingListener = v7;

  [(CSConnectionListener *)self->_rcProcessingListener resumeConnection];
  v9 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    v11 = "-[CSAttSiriConnectionManager _setupRCProcessingListenerWithRCHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s RC Processing xpc connection started listening", (uint8_t *)&v10, 0xCu);
  }
}

- (void)_setupSSRListenerWithSSRNode:(id)a3
{
  id v4 = a3;
  if (CSIsCommunalDevice())
  {
    v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CSSSRXPCService];
    v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CSSSRXPCServiceDelegate];
    v7 = +[CSUtils getSerialQueue:@"com.apple.CoreSpeech.Connection.Listener.ssr" qualityOfService:33];
    v8 = [[CSConnectionListener alloc] initWithMachService:@"com.apple.corespeech.corespeechd.ssr.service" withServiceInterface:v5 withServiceObject:v4 withDelegateInterface:v6 queue:v7];
    ssrListener = self->_ssrListener;
    self->_ssrListener = v8;

    [v4 setSsrListener:self->_ssrListener];
    [(CSConnectionListener *)self->_ssrListener resumeConnection];
    int v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      v13 = "-[CSAttSiriConnectionManager _setupSSRListenerWithSSRNode:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s SSR xpc connection started listening", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      v13 = "-[CSAttSiriConnectionManager _setupSSRListenerWithSSRNode:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Not setting up SSR xpc listener since its not a communal device", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)_setupEndpointListenerWithEndpointerNode:(id)a3
{
  id v4 = a3;
  v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CSEndpointerXPCService];
  v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CSEndpointerXPCServiceDelegate];
  v7 = +[CSUtils getSerialQueue:@"com.apple.CoreSpeech.Connection.Listener.endpointer" qualityOfService:33];
  v8 = [[CSConnectionListener alloc] initWithMachService:@"com.apple.corespeech.corespeechd.endpointer.service" withServiceInterface:v5 withServiceObject:v4 withDelegateInterface:v6 queue:v7];
  endpointerListener = self->_endpointerListener;
  self->_endpointerListener = v8;

  [v4 setEndpointerListener:self->_endpointerListener];
  [(CSConnectionListener *)self->_endpointerListener resumeConnection];
  int v10 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    int v12 = "-[CSAttSiriConnectionManager _setupEndpointListenerWithEndpointerNode:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Endpointer xpc connection started listening", (uint8_t *)&v11, 0xCu);
  }
}

- (void)setupAudioMessageServiceListnerWithProxy:(id)a3
{
  id v4 = a3;
  id v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CSSiriAudioMessageRequestService];
  v5 = +[CSUtils getSerialQueue:@"AudioMessageServiceListener" qualityOfService:33];
  v6 = [[CSConnectionListener alloc] initWithMachService:@"com.apple.siri.audio_message_service.xpc" withServiceInterface:v8 withServiceObject:v4 withDelegateInterface:0 queue:v5];

  audioMessageServiceListener = self->_audioMessageServiceListener;
  self->_audioMessageServiceListener = v6;

  [(CSConnectionListener *)self->_audioMessageServiceListener resumeConnection];
}

- (void)setupLocalSpeechRecognitionListenerWithXPCListener:(id)a3 machService:(id)a4 asrNode:(id)a5 ssrNode:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (+[CSUtils supportsSpeechRecognitionOnDevice](CSUtils, "supportsSpeechRecognitionOnDevice") & 1) != 0|| (+[CSUtils supportsHybridUnderstandingOnDevice](CSUtils, "supportsHybridUnderstandingOnDevice") & 1) != 0|| (+[CSUtils supportVoiceID])
  {
    v14 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___LBLocalSpeechService];
    v15 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___LBLocalSpeechServiceDelegate];
    v16 = +[CSUtils getSerialQueue:@"com.apple.CoreSpeech.Connection.Listener.asr" qualityOfService:33];
    v17 = [CSConnectionListener alloc];
    if (v10) {
      v18 = [(CSConnectionListener *)v17 initWithXpcListener:v10 withMachService:v11 withServiceInterface:v14 withServiceObject:v12 withDelegateInterface:v15 queue:v16];
    }
    else {
      v18 = [(CSConnectionListener *)v17 initWithMachService:v11 withServiceInterface:v14 withServiceObject:v12 withDelegateInterface:v15 queue:v16];
    }
    localSpeechRecognitionListener = self->_localSpeechRecognitionListener;
    self->_localSpeechRecognitionListener = v18;

    [v12 setLocalSRBridgeListener:self->_localSpeechRecognitionListener];
    [v13 setLocalSRBridgeListener:self->_localSpeechRecognitionListener];
    [(CSConnectionListener *)self->_localSpeechRecognitionListener resumeConnection];
    v20 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315138;
      v23 = "-[CSAttSiriConnectionManager setupLocalSpeechRecognitionListenerWithXPCListener:machService:asrNode:ssrNode:]";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s LocalSpeechRecognition xpc connection started listening", (uint8_t *)&v22, 0xCu);
    }
  }
  else
  {
    v21 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315138;
      v23 = "-[CSAttSiriConnectionManager setupLocalSpeechRecognitionListenerWithXPCListener:machService:asrNode:ssrNode:]";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s Doesn't support ASR on Device", (uint8_t *)&v22, 0xCu);
    }
  }
}

- (void)setupAttSiriServiceListenerWithAttSiriController:(id)a3
{
  id v4 = a3;
  v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CSAttSiriServiceProtocol];
  v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CSAttSiriServiceDelegate];
  v7 = [[CSConnectionListener alloc] initWithMachService:@"com.apple.corespeech.corespeechd.attsiri.service" withServiceInterface:v5 withServiceObject:v4 withDelegateInterface:v6];
  attSiriSvcListener = self->_attSiriSvcListener;
  self->_attSiriSvcListener = v7;

  [v4 setAttSiriSvcListener:self->_attSiriSvcListener];
  [(CSConnectionListener *)self->_attSiriSvcListener resumeConnection];
  v9 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = self->_attSiriSvcListener;
    int v11 = 136315394;
    id v12 = "-[CSAttSiriConnectionManager setupAttSiriServiceListenerWithAttSiriController:]";
    __int16 v13 = 2112;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s AttSiriServiceListener xpc connection started listening: _attSiriSvcListener=%@", (uint8_t *)&v11, 0x16u);
  }
}

- (void)setupListenersForEndpointerNode:(id)a3 asrNode:(id)a4 ssrNode:(id)a5 rcHandler:(id)a6
{
  id v12 = a6;
  id v10 = a5;
  id v11 = a4;
  [(CSAttSiriConnectionManager *)self _setupEndpointListenerWithEndpointerNode:a3];
  [(CSAttSiriConnectionManager *)self setupLocalSpeechRecognitionListenerWithXPCListener:0 machService:LBLocalSpeechServiceName asrNode:v11 ssrNode:v10];

  [(CSAttSiriConnectionManager *)self _setupSSRListenerWithSSRNode:v10];
  [(CSAttSiriConnectionManager *)self _setupRCProcessingListenerWithRCHandler:v12];
}

- (CSAttSiriConnectionManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSAttSiriConnectionManager;
  return [(CSAttSiriConnectionManager *)&v3 init];
}

@end