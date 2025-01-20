@interface HFOpenURLRouter
+ (HFOpenURLRouter)sharedInstance;
- (HFApplicationURLHandling)applicationURLHandler;
- (id)openSensitiveURL:(id)a3;
- (id)openURL:(id)a3;
- (void)_sendAnalyticsEventForURL:(id)a3;
- (void)setApplicationURLHandler:(id)a3;
@end

@implementation HFOpenURLRouter

- (void)setApplicationURLHandler:(id)a3
{
}

uint64_t __33__HFOpenURLRouter_sharedInstance__block_invoke_2()
{
  v0 = objc_alloc_init(HFOpenURLRouter);
  uint64_t v1 = qword_26AB2EDD8;
  qword_26AB2EDD8 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (HFOpenURLRouter)sharedInstance
{
  if (_MergedGlobals_224 != -1) {
    dispatch_once(&_MergedGlobals_224, &__block_literal_global_3_3);
  }
  v2 = (void *)qword_26AB2EDD8;
  return (HFOpenURLRouter *)v2;
}

- (id)openURL:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = HFLogForCategory(0x47uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "HFOpenURLRouter received request to open URL: %@.", buf, 0xCu);
  }

  v6 = (void *)MEMORY[0x263F58190];
  v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08570] code:-1002 userInfo:MEMORY[0x263EFFA78]];
  v8 = [v6 futureWithError:v7];

  v9 = [(HFOpenURLRouter *)self applicationURLHandler];

  if (v9)
  {
    v10 = [(HFOpenURLRouter *)self applicationURLHandler];
    uint64_t v11 = [v10 openApplicationURL:v4];

    v8 = (void *)v11;
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __27__HFOpenURLRouter_openURL___block_invoke;
  v15[3] = &unk_26408CE18;
  v15[4] = self;
  id v16 = v4;
  id v12 = v4;
  v13 = [v8 recover:v15];

  return v13;
}

uint64_t __27__HFOpenURLRouter_openURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) openSensitiveURL:*(void *)(a1 + 40)];
}

- (id)openSensitiveURL:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = HFLogForCategory(0x47uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "HFOpenURLRouter received request to open sensitive URL: %@.", buf, 0xCu);
  }

  if (+[HFURLComponents isHomeAppURL:v4])
  {
    v6 = +[HFExecutionEnvironment sharedInstance];
    uint64_t v7 = [v6 hostProcess];

    if (!v7) {
      NSLog(&cfstr_TryingToOpenHo.isa, v4);
    }
  }
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v8 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F3F5E8]];
  if (+[HFUtilities isAMac])
  {
    v9 = (void *)MEMORY[0x263F58190];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __36__HFOpenURLRouter_openSensitiveURL___block_invoke;
    v16[3] = &unk_26408CD78;
    id v17 = v4;
    v10 = [v9 futureWithCompletionHandlerAdapterBlock:v16];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F01880] defaultWorkspace];
    id v15 = 0;
    [v11 openSensitiveURL:v4 withOptions:v8 error:&v15];
    id v12 = v15;

    if (v12)
    {
      v13 = HFLogForCategory(0x47uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v19 = v4;
        __int16 v20 = 2112;
        id v21 = v12;
        _os_log_error_impl(&dword_20B986000, v13, OS_LOG_TYPE_ERROR, "Failed to open URL: %@, error: %@", buf, 0x16u);
      }

      v10 = [MEMORY[0x263F58190] futureWithError:v12];
    }
    else
    {
      [(HFOpenURLRouter *)self _sendAnalyticsEventForURL:v4];
      v10 = [MEMORY[0x263F58190] futureWithNoResult];
    }
  }

  return v10;
}

void __36__HFOpenURLRouter_openSensitiveURL___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263F01880];
  id v4 = a2;
  id v5 = [v3 defaultWorkspace];
  [v5 openURL:*(void *)(a1 + 32) configuration:0 completionHandler:v4];
}

- (void)_sendAnalyticsEventForURL:(id)a3
{
  v3 = NSURL;
  id v4 = a3;
  id v5 = objc_msgSend(v3, "hf_photosLibraryPeopleAlbumURL");
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    +[HFAnalytics sendEvent:6];
  }
}

- (HFApplicationURLHandling)applicationURLHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationURLHandler);
  return (HFApplicationURLHandling *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end