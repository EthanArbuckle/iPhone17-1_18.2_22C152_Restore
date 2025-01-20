@interface CSAudioPowerServiceListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)listen;
@end

@implementation CSAudioPowerServiceListener

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
      v16 = "-[CSAudioPowerServiceListener listener:shouldAcceptNewConnection:]";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s we got unknown types of XPC connection request", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_9;
  }
  v9 = CSAudioPowerServiceGetXPCInterface();
  [v7 setExportedInterface:v9];

  if ((+[CSUtils xpcConnection:v7 hasEntitlement:@"siri.audiopowerupdate.xpc"] & 1) == 0)
  {
    [v7 invalidate];
LABEL_9:
    BOOL v13 = 0;
    goto LABEL_10;
  }
  exportedObject = self->_exportedObject;
  if (!exportedObject)
  {
    v11 = +[CSAudioPowerProvider sharedInstance];
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
  id v3 = objc_alloc((Class)NSXPCListener);
  v4 = (NSXPCListener *)[v3 initWithMachServiceName:CSAudioPowerServiceName];
  listener = self->_listener;
  self->_listener = v4;

  [(NSXPCListener *)self->_listener setDelegate:self];
  [(NSXPCListener *)self->_listener resume];
  v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[CSAudioPowerServiceListener listen]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s CSAudioPowerXPCListener start listening", (uint8_t *)&v7, 0xCu);
  }
}

@end