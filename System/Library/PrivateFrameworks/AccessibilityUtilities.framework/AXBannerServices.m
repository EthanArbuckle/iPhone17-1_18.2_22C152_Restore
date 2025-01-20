@interface AXBannerServices
+ (id)sharedInstance;
- (AXUIClient)serverClient;
- (id)_init;
- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3;
- (void)dismissBanner;
- (void)presentBannerWithTitle:(id)a3 message:(id)a4 duration:(double)a5;
@end

@implementation AXBannerServices

+ (id)sharedInstance
{
  if (sharedInstance_sOnceToken != -1) {
    dispatch_once(&sharedInstance_sOnceToken, &__block_literal_global_16);
  }
  v2 = (void *)sharedInstance__SharedInstance;

  return v2;
}

uint64_t __34__AXBannerServices_sharedInstance__block_invoke()
{
  sharedInstance__SharedInstance = [[AXBannerServices alloc] _init];

  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)AXBannerServices;
  return [(AXBannerServices *)&v3 init];
}

- (AXUIClient)serverClient
{
  serverClient = self->_serverClient;
  if (!serverClient)
  {
    v4 = NSString;
    v5 = [MEMORY[0x1E4F28F80] processInfo];
    v6 = [v5 processName];
    v7 = [NSNumber numberWithInt:getpid()];
    v8 = [v4 stringWithFormat:@"AXBannerServicesClient-%@-%@", v6, v7];

    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2050000000;
    v9 = (void *)getAXUIClientClass_softClass_0;
    uint64_t v18 = getAXUIClientClass_softClass_0;
    if (!getAXUIClientClass_softClass_0)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __getAXUIClientClass_block_invoke_0;
      v14[3] = &unk_1E5585E30;
      v14[4] = &v15;
      __getAXUIClientClass_block_invoke_0((uint64_t)v14);
      v9 = (void *)v16[3];
    }
    v10 = v9;
    _Block_object_dispose(&v15, 8);
    v11 = (AXUIClient *)[[v10 alloc] initWithIdentifier:v8 serviceBundleName:@"AXBannerUIServer"];
    v12 = self->_serverClient;
    self->_serverClient = v11;

    [(AXUIClient *)self->_serverClient setDelegate:self];
    serverClient = self->_serverClient;
  }

  return serverClient;
}

- (void)presentBannerWithTitle:(id)a3 message:(id)a4 duration:(double)a5
{
  id v12 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v12) {
    [v9 setObject:v12 forKeyedSubscript:@"title"];
  }
  if (v8) {
    [v9 setObject:v8 forKeyedSubscript:@"message"];
  }
  v10 = [NSNumber numberWithDouble:a5];
  [v9 setObject:v10 forKeyedSubscript:@"duration"];

  v11 = [(AXBannerServices *)self serverClient];
  [v11 sendAsynchronousMessage:v9 withIdentifier:1000 targetAccessQueue:0 completion:0];
}

- (void)dismissBanner
{
  id v2 = [(AXBannerServices *)self serverClient];
  [v2 sendAsynchronousMessage:MEMORY[0x1E4F1CC08] withIdentifier:1001 targetAccessQueue:0 completion:0];
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  id v4 = a3;
  id v5 = [(AXBannerServices *)self serverClient];

  if (v5 == v4)
  {
    serverClient = self->_serverClient;
    self->_serverClient = 0;
  }
}

- (void).cxx_destruct
{
}

@end