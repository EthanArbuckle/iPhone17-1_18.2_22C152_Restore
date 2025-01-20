@interface HearingMLHelperServiceInstance
- (HearingMLHelperServiceXPCServer)xpcServer;
- (void)run;
- (void)setXpcServer:(id)a3;
- (void)trainWithDetectorID:(id)a3 hallucinatorPath:(id)a4 pretrainedWeightsPath:(id)a5 resultHandler:(id)a6;
@end

@implementation HearingMLHelperServiceInstance

- (void)run
{
  v3 = AXLogUltronKShot();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "*** HearingMLHelper service starting up ***", buf, 2u);
  }

  v4 = objc_alloc_init(HearingMLHelperServiceXPCServer);
  [(HearingMLHelperServiceInstance *)self setXpcServer:v4];

  v5 = [(HearingMLHelperServiceInstance *)self xpcServer];
  [v5 setDelegate:self];

  v6 = [(HearingMLHelperServiceInstance *)self xpcServer];
  [v6 run];

  v7 = AXLogUltronKShot();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "*** HearingMLHelper service about to exit ***", v8, 2u);
  }
}

- (void)trainWithDetectorID:(id)a3 hallucinatorPath:(id)a4 pretrainedWeightsPath:(id)a5 resultHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void, void *))a6;
  v14 = AXLogUltronKShot();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Training Detector with ID: %@", buf, 0xCu);
  }

  if (!v11)
  {
    +[NSError ax_errorWithDomain:@"com.apple.accessibility.ultron", @"Invalid hallucinatorPath: %@", 0 description];
    v21 = LABEL_8:;
    v13[2](v13, 0, v21);

    goto LABEL_9;
  }
  if (!v12)
  {
    +[NSError ax_errorWithDomain:@"com.apple.accessibility.ultron", @"Invalid pretrainedWeightsPath: %@", 0 description];
    goto LABEL_8;
  }
  v16 = (AXSDKShotModelCreationManager *)objc_alloc_init((Class)AXSDKShotModelCreationManager);
  modelCreationManager = self->_modelCreationManager;
  self->_modelCreationManager = v16;

  v18 = self->_modelCreationManager;
  id v22 = 0;
  v19 = [(AXSDKShotModelCreationManager *)v18 trainWithDetectorID:v10 hallucinatorPath:v11 pretrainedWeightsPath:v12 error:&v22];
  id v20 = v22;
  ((void (**)(id, void *, void *))v13)[2](v13, v19, v20);

LABEL_9:
}

- (HearingMLHelperServiceXPCServer)xpcServer
{
  return self->_xpcServer;
}

- (void)setXpcServer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcServer, 0);
  objc_storeStrong((id *)&self->_modelCreationManager, 0);
}

@end