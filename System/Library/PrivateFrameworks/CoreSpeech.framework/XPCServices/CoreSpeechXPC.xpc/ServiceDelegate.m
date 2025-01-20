@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CoreSpeechXPCFakeModelMonitor)fakeModelMonitor;
- (ServiceDelegate)init;
- (void)dealloc;
- (void)setFakeModelMonitor:(id)a3;
@end

@implementation ServiceDelegate

- (void).cxx_destruct
{
}

- (void)setFakeModelMonitor:(id)a3
{
}

- (CoreSpeechXPCFakeModelMonitor)fakeModelMonitor
{
  return self->_fakeModelMonitor;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v22 = a4;
  v4 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CoreSpeechXPCProtocol];
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  v30[2] = objc_opt_class();
  v30[3] = objc_opt_class();
  v5 = +[NSArray arrayWithObjects:v30 count:4];
  v6 = +[NSSet setWithArray:v5];
  [v4 setClasses:v6 forSelector:"voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:" argumentIndex:0 ofReply:0];

  *(void *)buf = objc_opt_class();
  *(void *)&buf[8] = objc_opt_class();
  *(void *)&buf[16] = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  v7 = +[NSArray arrayWithObjects:buf count:5];
  v8 = +[NSSet setWithArray:v7];
  [v4 setClasses:v8 forSelector:"voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:" argumentIndex:1 ofReply:0];

  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  v26[2] = objc_opt_class();
  v26[3] = objc_opt_class();
  v26[4] = objc_opt_class();
  v9 = +[NSArray arrayWithObjects:v26 count:5];
  v10 = +[NSSet setWithArray:v9];
  [v4 setClasses:v10 forSelector:"voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:" argumentIndex:2 ofReply:0];

  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v25[2] = objc_opt_class();
  v11 = +[NSArray arrayWithObjects:v25 count:3];
  v12 = +[NSSet setWithArray:v11];
  [v4 setClasses:v12 forSelector:"voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:" argumentIndex:0 ofReply:1];

  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  v24[2] = objc_opt_class();
  v13 = +[NSArray arrayWithObjects:v24 count:3];
  v14 = +[NSSet setWithArray:v13];
  [v4 setClasses:v14 forSelector:"voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:" argumentIndex:1 ofReply:1];

  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v23[2] = objc_opt_class();
  v15 = +[NSArray arrayWithObjects:v23 count:3];
  v16 = +[NSSet setWithArray:v15];
  [v4 setClasses:v16 forSelector:"voiceTriggerJarvisLanguageList:jarvisSelectedLanguage:completion:" argumentIndex:0 ofReply:0];

  [v22 setExportedInterface:v4];
  unsigned __int8 v17 = +[CSUtils xpcConnection:v22 hasEntitlement:@"corespeech.xpc"];
  if (v17)
  {
    v18 = [[CoreSpeechXPC alloc] initWithFakeMonitor:self->_fakeModelMonitor];
    [v22 setExportedObject:v18];
    [v22 resume];
  }
  else
  {
    v19 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[ServiceDelegate listener:shouldAcceptNewConnection:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s Connecting request %{public}@ rejected due to missing entitlement", buf, 0x16u);
    }
    objc_msgSend(v22, "invalidate", self);
  }

  return v17;
}

- (void)dealloc
{
  [(CoreSpeechXPCFakeModelMonitor *)self->_fakeModelMonitor stop];
  v3.receiver = self;
  v3.super_class = (Class)ServiceDelegate;
  [(ServiceDelegate *)&v3 dealloc];
}

- (ServiceDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)ServiceDelegate;
  v2 = [(ServiceDelegate *)&v6 init];
  if (v2 && CSIsInternalBuild())
  {
    objc_super v3 = objc_alloc_init(CoreSpeechXPCFakeModelMonitor);
    fakeModelMonitor = v2->_fakeModelMonitor;
    v2->_fakeModelMonitor = v3;

    [(CoreSpeechXPCFakeModelMonitor *)v2->_fakeModelMonitor start];
  }
  return v2;
}

@end