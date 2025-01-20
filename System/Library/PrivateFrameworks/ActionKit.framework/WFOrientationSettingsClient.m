@interface WFOrientationSettingsClient
+ (void)createClientWithCompletionHandler:(id)a3;
- (AXSpringBoardServer)server;
- (WFOrientationSettingsClient)initWithSpringBoardServer:(id)a3;
- (void)getStateWithCompletionHandler:(id)a3;
- (void)setState:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation WFOrientationSettingsClient

- (void).cxx_destruct
{
}

- (AXSpringBoardServer)server
{
  return self->_server;
}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, void))a4;
  v7 = [(WFOrientationSettingsClient *)self server];
  [v7 setOrientationLocked:v4];

  v8 = getWFBundledIntentsLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    v10 = "-[WFOrientationSettingsClient setState:completionHandler:]";
    __int16 v11 = 1024;
    BOOL v12 = v4;
    _os_log_impl(&dword_23C364000, v8, OS_LOG_TYPE_INFO, "%s Set orientation lock state to %d", (uint8_t *)&v9, 0x12u);
  }

  v6[2](v6, 0);
}

- (void)getStateWithCompletionHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v4 = (void (**)(id, uint64_t, void))a3;
  v5 = [(WFOrientationSettingsClient *)self server];
  uint64_t v6 = [v5 isOrientationLocked];

  v7 = getWFBundledIntentsLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    int v9 = "-[WFOrientationSettingsClient getStateWithCompletionHandler:]";
    __int16 v10 = 1024;
    int v11 = v6;
    _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_INFO, "%s Retrieved orientation lock state: %d", (uint8_t *)&v8, 0x12u);
  }

  v4[2](v4, v6, 0);
}

- (WFOrientationSettingsClient)initWithSpringBoardServer:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    int v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFOrientationSettingsClient.m", 46, @"Invalid parameter not satisfying: %@", @"server" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFOrientationSettingsClient;
  v7 = [(WFOrientationSettingsClient *)&v12 init];
  int v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_server, a3);
    int v9 = v8;
  }

  return v8;
}

+ (void)createClientWithCompletionHandler:(id)a3
{
  BOOL v4 = (void (**)(id, void *, void))a3;
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v5 = (void *)getAXSpringBoardServerClass_softClass;
  uint64_t v13 = getAXSpringBoardServerClass_softClass;
  if (!getAXSpringBoardServerClass_softClass)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __getAXSpringBoardServerClass_block_invoke;
    v9[3] = &unk_264E5EC88;
    v9[4] = &v10;
    __getAXSpringBoardServerClass_block_invoke((uint64_t)v9);
    v5 = (void *)v11[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);
  v7 = [v6 server];
  if (v7)
  {
    int v8 = (void *)[objc_alloc((Class)a1) initWithSpringBoardServer:v7];
    v4[2](v4, v8, 0);
  }
  else
  {
    int v8 = WFSettingsClientError();
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v8);
  }
}

@end