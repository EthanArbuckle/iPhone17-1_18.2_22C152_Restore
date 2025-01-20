@interface CSBenchmarkXPCListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CSBenchmarkXPCListener)init;
- (void)listen;
@end

@implementation CSBenchmarkXPCListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = (NSXPCListener *)a3;
  id v7 = a4;
  v8 = CSLogContextFacilityCoreSpeech;
  if (self->_listener != v6)
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[CSBenchmarkXPCListener listener:shouldAcceptNewConnection:]";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s we got unknown types of XPC connection request", (uint8_t *)&buf, 0xCu);
    }
LABEL_13:
    BOOL v71 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CSBenchmarkXPCListener listener:shouldAcceptNewConnection:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkXPCListener start listening", (uint8_t *)&buf, 0xCu);
  }
  v9 = +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CSBenchmarkXPCProtocol, self);
  *(void *)&long long buf = objc_opt_class();
  *((void *)&buf + 1) = objc_opt_class();
  uint64_t v104 = objc_opt_class();
  v10 = +[NSArray arrayWithObjects:&buf count:3];
  v11 = +[NSSet setWithArray:v10];
  [v9 setClasses:v11 forSelector:"runVTSecondPassModelWithConfig:locale:withUrl:completion:" argumentIndex:0 ofReply:0];

  v102[0] = objc_opt_class();
  v102[1] = objc_opt_class();
  v102[2] = objc_opt_class();
  v12 = +[NSArray arrayWithObjects:v102 count:3];
  v13 = +[NSSet setWithArray:v12];
  [v9 setClasses:v13 forSelector:"runVTSecondPassModelWithConfig:locale:withUrl:completion:" argumentIndex:1 ofReply:0];

  v101[0] = objc_opt_class();
  v101[1] = objc_opt_class();
  v101[2] = objc_opt_class();
  v14 = +[NSArray arrayWithObjects:v101 count:3];
  v15 = +[NSSet setWithArray:v14];
  [v9 setClasses:v15 forSelector:"runVTSecondPassModelWithConfig:locale:withUrl:completion:" argumentIndex:2 ofReply:0];

  v100[0] = objc_opt_class();
  v100[1] = objc_opt_class();
  v100[2] = objc_opt_class();
  v16 = +[NSArray arrayWithObjects:v100 count:3];
  v17 = +[NSSet setWithArray:v16];
  [v9 setClasses:v17 forSelector:"runVTSecondPassModelWithConfig:locale:withUrl:completion:" argumentIndex:0 ofReply:1];

  v99[0] = objc_opt_class();
  v99[1] = objc_opt_class();
  v99[2] = objc_opt_class();
  v18 = +[NSArray arrayWithObjects:v99 count:3];
  v19 = +[NSSet setWithArray:v18];
  [v9 setClasses:v19 forSelector:"runVTSecondPassModelWithConfig:locale:withUrl:completion:" argumentIndex:1 ofReply:1];

  v98[0] = objc_opt_class();
  v98[1] = objc_opt_class();
  v20 = +[NSArray arrayWithObjects:v98 count:2];
  v21 = +[NSSet setWithArray:v20];
  [v9 setClasses:v21 forSelector:"runLstmPhsModelWithConfig:withUrl:withConfigRoot:completion:" argumentIndex:0 ofReply:0];

  v97[0] = objc_opt_class();
  v97[1] = objc_opt_class();
  v22 = +[NSArray arrayWithObjects:v97 count:2];
  v23 = +[NSSet setWithArray:v22];
  [v9 setClasses:v23 forSelector:"runLstmPhsModelWithConfig:withUrl:withConfigRoot:completion:" argumentIndex:1 ofReply:0];

  v96[0] = objc_opt_class();
  v96[1] = objc_opt_class();
  v24 = +[NSArray arrayWithObjects:v96 count:2];
  v25 = +[NSSet setWithArray:v24];
  [v9 setClasses:v25 forSelector:"runLstmPhsModelWithConfig:withUrl:withConfigRoot:completion:" argumentIndex:2 ofReply:0];

  v95[0] = objc_opt_class();
  v95[1] = objc_opt_class();
  v26 = +[NSArray arrayWithObjects:v95 count:2];
  v27 = +[NSSet setWithArray:v26];
  [v9 setClasses:v27 forSelector:"runLstmPhsModelWithConfig:withUrl:withConfigRoot:completion:" argumentIndex:0 ofReply:1];

  v94[0] = objc_opt_class();
  v94[1] = objc_opt_class();
  v28 = +[NSArray arrayWithObjects:v94 count:2];
  v29 = +[NSSet setWithArray:v28];
  [v9 setClasses:v29 forSelector:"runLstmPhsModelWithConfig:withUrl:withConfigRoot:completion:" argumentIndex:1 ofReply:1];

  v93[0] = objc_opt_class();
  v93[1] = objc_opt_class();
  v30 = +[NSArray arrayWithObjects:v93 count:2];
  v31 = +[NSSet setWithArray:v30];
  [v9 setClasses:v31 forSelector:"runOSDAnalyzerWithConfig:withUrl:completion:" argumentIndex:0 ofReply:0];

  v92[0] = objc_opt_class();
  v92[1] = objc_opt_class();
  v32 = +[NSArray arrayWithObjects:v92 count:2];
  v33 = +[NSSet setWithArray:v32];
  [v9 setClasses:v33 forSelector:"runOSDAnalyzerWithConfig:withUrl:completion:" argumentIndex:1 ofReply:0];

  v91[0] = objc_opt_class();
  v91[1] = objc_opt_class();
  v34 = +[NSArray arrayWithObjects:v91 count:2];
  v35 = +[NSSet setWithArray:v34];
  [v9 setClasses:v35 forSelector:"runOSDAnalyzerWithConfig:withUrl:completion:" argumentIndex:0 ofReply:1];

  v90[0] = objc_opt_class();
  v90[1] = objc_opt_class();
  v36 = +[NSArray arrayWithObjects:v90 count:2];
  v37 = +[NSSet setWithArray:v36];
  [v9 setClasses:v37 forSelector:"runOSDAnalyzerWithConfig:withUrl:completion:" argumentIndex:1 ofReply:1];

  uint64_t v89 = objc_opt_class();
  v38 = +[NSArray arrayWithObjects:&v89 count:1];
  v39 = +[NSSet setWithArray:v38];
  [v9 setClasses:v39 forSelector:"pingpong:completion:" argumentIndex:0 ofReply:0];

  uint64_t v88 = objc_opt_class();
  v40 = +[NSArray arrayWithObjects:&v88 count:1];
  v41 = +[NSSet setWithArray:v40];
  [v9 setClasses:v41 forSelector:"pingpong:completion:" argumentIndex:0 ofReply:1];

  uint64_t v87 = objc_opt_class();
  v42 = +[NSArray arrayWithObjects:&v87 count:1];
  v43 = +[NSSet setWithArray:v42];
  [v9 setClasses:v43 forSelector:"runODLDModelWithConfig:locale:inputText:completion:" argumentIndex:0 ofReply:0];

  uint64_t v86 = objc_opt_class();
  v44 = +[NSArray arrayWithObjects:&v86 count:1];
  v45 = +[NSSet setWithArray:v44];
  [v9 setClasses:v45 forSelector:"runODLDModelWithConfig:locale:inputText:completion:" argumentIndex:1 ofReply:0];

  uint64_t v85 = objc_opt_class();
  v46 = +[NSArray arrayWithObjects:&v85 count:1];
  v47 = +[NSSet setWithArray:v46];
  [v9 setClasses:v47 forSelector:"runODLDModelWithConfig:locale:inputText:completion:" argumentIndex:2 ofReply:0];

  uint64_t v84 = objc_opt_class();
  v48 = +[NSArray arrayWithObjects:&v84 count:1];
  v49 = +[NSSet setWithArray:v48];
  [v9 setClasses:v49 forSelector:"runODLDModelWithConfig:locale:inputText:completion:" argumentIndex:0 ofReply:1];

  uint64_t v83 = objc_opt_class();
  v50 = +[NSArray arrayWithObjects:&v83 count:1];
  v51 = +[NSSet setWithArray:v50];
  [v9 setClasses:v51 forSelector:"runAudioInjectionOnly:completion:" argumentIndex:0 ofReply:0];

  uint64_t v82 = objc_opt_class();
  v52 = +[NSArray arrayWithObjects:&v82 count:1];
  v53 = +[NSSet setWithArray:v52];
  [v9 setClasses:v53 forSelector:"runAudioInjectionOnly:completion:" argumentIndex:0 ofReply:1];

  v81[0] = objc_opt_class();
  v81[1] = objc_opt_class();
  v54 = +[NSArray arrayWithObjects:v81 count:2];
  v55 = +[NSSet setWithArray:v54];
  [v9 setClasses:v55 forSelector:"runNovDetectorWithConfig:configRoot:withUrl:completion:" argumentIndex:0 ofReply:0];

  v80[0] = objc_opt_class();
  v80[1] = objc_opt_class();
  v56 = +[NSArray arrayWithObjects:v80 count:2];
  v57 = +[NSSet setWithArray:v56];
  [v9 setClasses:v57 forSelector:"runNovDetectorWithConfig:configRoot:withUrl:completion:" argumentIndex:1 ofReply:0];

  v79[0] = objc_opt_class();
  v79[1] = objc_opt_class();
  v58 = +[NSArray arrayWithObjects:v79 count:2];
  v59 = +[NSSet setWithArray:v58];
  [v9 setClasses:v59 forSelector:"runNovDetectorWithConfig:configRoot:withUrl:completion:" argumentIndex:2 ofReply:0];

  uint64_t v78 = objc_opt_class();
  v60 = +[NSArray arrayWithObjects:&v78 count:1];
  v61 = +[NSSet setWithArray:v60];
  [v9 setClasses:v61 forSelector:"runNovDetectorWithConfig:configRoot:withUrl:completion:" argumentIndex:0 ofReply:1];

  uint64_t v77 = objc_opt_class();
  v62 = +[NSArray arrayWithObjects:&v77 count:1];
  v63 = +[NSSet setWithArray:v62];
  [v9 setClasses:v63 forSelector:"benchmarkOnDeviceCompilationCleanup:" argumentIndex:0 ofReply:1];

  uint64_t v76 = objc_opt_class();
  v64 = +[NSArray arrayWithObjects:&v76 count:1];
  v65 = +[NSSet setWithArray:v64];
  [v9 setClasses:v65 forSelector:"runNCModelWithConfig:completion:" argumentIndex:0 ofReply:0];

  uint64_t v75 = objc_opt_class();
  v66 = +[NSArray arrayWithObjects:&v75 count:1];
  v67 = +[NSSet setWithArray:v66];
  [v9 setClasses:v67 forSelector:"runNCModelWithConfig:completion:" argumentIndex:0 ofReply:1];

  [v7 setExportedInterface:v9];
  if ((+[CSUtils xpcConnection:v7 hasEntitlement:@"corespeech.benchmark.xpc"] & 1) == 0)
  {
    v72 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[CSBenchmarkXPCListener listener:shouldAcceptNewConnection:]";
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkXPCListener does not have entitlement", (uint8_t *)&buf, 0xCu);
    }
    [v7 invalidate];
    goto LABEL_13;
  }
  uint64_t v68 = *(void *)(v74 + 16);
  if (!v68)
  {
    uint64_t v69 = objc_opt_new();
    v70 = *(void **)(v74 + 16);
    *(void *)(v74 + 16) = v69;

    uint64_t v68 = *(void *)(v74 + 16);
  }
  [v7 setExportedObject:v68];
  [v7 resume];
  BOOL v71 = 1;
LABEL_14:

  return v71;
}

- (void)listen
{
  v3 = +[CSFPreferences sharedPreferences];
  unsigned int v4 = [v3 isModelBenchmarkingEnabled];

  if (v4)
  {
    v5 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.corespeech.benchmark.xpc"];
    listener = self->_listener;
    self->_listener = v5;

    [(NSXPCListener *)self->_listener setDelegate:self];
    [(NSXPCListener *)self->_listener resume];
    id v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      v9 = "-[CSBenchmarkXPCListener listen]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkXPCListener start listening", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (CSBenchmarkXPCListener)init
{
  v3 = +[CSFPreferences sharedPreferences];
  unsigned int v4 = [v3 isModelBenchmarkingEnabled];

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)CSBenchmarkXPCListener;
    self = [(CSBenchmarkXPCListener *)&v7 init];
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end