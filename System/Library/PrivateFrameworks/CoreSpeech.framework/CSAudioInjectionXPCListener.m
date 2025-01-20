@interface CSAudioInjectionXPCListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CSAudioInjectionXPCListener)init;
- (void)listen;
@end

@implementation CSAudioInjectionXPCListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = (NSXPCListener *)a3;
  id v7 = a4;
  if (self->_listener != v6)
  {
    v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      v16 = "-[CSAudioInjectionXPCListener listener:shouldAcceptNewConnection:]";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s we got unknown types of XPC connection request", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_9;
  }
  v9 = AudioInjectionXPCGetInterface();
  [v7 setExportedInterface:v9];

  if ((+[CSUtils xpcConnection:v7 hasEntitlement:@"corespeech.audioinjection.xpc"] & 1) == 0)
  {
    [v7 invalidate];
LABEL_9:
    BOOL v13 = 0;
    goto LABEL_10;
  }
  exportedObject = self->_exportedObject;
  if (!exportedObject)
  {
    v11 = (CSAudioInjectionXPC *)objc_opt_new();
    v12 = self->_exportedObject;
    self->_exportedObject = v11;

    exportedObject = self->_exportedObject;
  }
  [v7 setExportedObject:exportedObject];
  [v7 resume];
  BOOL v13 = 1;
LABEL_10:

  return v13;
}

- (void)listen
{
  v3 = +[CSFPreferences sharedPreferences];
  if ([v3 programmableAudioInjectionEnabled])
  {
  }
  else
  {
    v4 = +[CSFPreferences sharedPreferences];
    unsigned int v5 = [v4 exclaveAudioInjectionEnabled];

    if (!v5) {
      return;
    }
  }
  [(NSXPCListener *)self->_listener setDelegate:self];
  [(NSXPCListener *)self->_listener resume];
  v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[CSAudioInjectionXPCListener listen]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionXPCListener start listening", (uint8_t *)&v7, 0xCu);
  }
}

- (CSAudioInjectionXPCListener)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSAudioInjectionXPCListener;
  v2 = [(CSAudioInjectionXPCListener *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)NSXPCListener);
    v4 = (NSXPCListener *)[v3 initWithMachServiceName:CSAudioInjectionXPCServiceNameForCoreSpeechDaemon];
    listener = v2->_listener;
    v2->_listener = v4;
  }
  return v2;
}

@end