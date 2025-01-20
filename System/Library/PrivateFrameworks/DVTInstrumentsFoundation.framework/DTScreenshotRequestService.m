@interface DTScreenshotRequestService
+ (void)registerCapabilities:(id)a3;
- (id)_screenshotServiceRequestWithError:(id *)a3;
- (id)_screenshotWithError:(id *)a3;
- (id)takeScreenshot;
@end

@implementation DTScreenshotRequestService

+ (void)registerCapabilities:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v6 = 138412290;
    *(void *)&v6[4] = objc_opt_class();
    id v5 = *(id *)&v6[4];
    _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "Registering service %@", v6, 0xCu);
  }
  [v4 publishCapability:@"com.apple.instruments.server.services.screenshot" withVersion:2 forClass:a1 *(_OWORD *)v6];
}

- (id)takeScreenshot
{
  v23[1] = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  id v17 = 0;
  id v4 = [(DTScreenshotRequestService *)self _screenshotWithError:&v17];
  id v5 = v17;
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = objc_opt_class();
      id v8 = v7;
      uint64_t v9 = [v4 length];
      *(_DWORD *)buf = 138412546;
      v19 = v7;
      __int16 v20 = 2048;
      uint64_t v21 = v9;
      _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "%@: Screenshot succeeded (%lu bytes)", buf, 0x16u);
    }
    v10 = v4;
  }
  else
  {
    if (!v5)
    {
      v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v22 = *MEMORY[0x263F08320];
      v23[0] = @"Unknown error.";
      v12 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
      v6 = [v11 errorWithDomain:@"DTScreenshotRequestService" code:1 userInfo:v12];
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      v13 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v19 = v13;
      __int16 v20 = 2112;
      uint64_t v21 = (uint64_t)v6;
      id v14 = v13;
      _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%@: Screenshot failed: %@", buf, 0x16u);
    }
    [v3 invokeCompletionWithReturnValue:v6 error:v6];
    v10 = v3;
  }
  id v15 = v10;

  return v15;
}

- (id)_screenshotWithError:(id *)a3
{
  return (id)MEMORY[0x270F9A6D0](self, sel__screenshotServiceRequestWithError_);
}

- (id)_screenshotServiceRequestWithError:(id *)a3
{
  id v4 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.dt.DTScreenshotService"];
  id v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E54A108];
  [v4 setRemoteObjectInterface:v5];

  [v4 resume];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_2308E60E4;
  v25 = sub_2308E60F4;
  id v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_2308E60E4;
  v19 = sub_2308E60F4;
  id v20 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v7 = [v4 remoteObjectProxy];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_2308E60FC;
  v11[3] = &unk_264B8EAC8;
  v13 = &v21;
  id v14 = &v15;
  id v8 = v6;
  v12 = v8;
  [v7 takeScreenshotWithReply:v11];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a3) {
    *a3 = (id) v16[5];
  }
  [v4 invalidate];
  id v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

@end