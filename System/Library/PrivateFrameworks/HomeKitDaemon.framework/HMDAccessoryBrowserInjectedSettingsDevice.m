@interface HMDAccessoryBrowserInjectedSettingsDevice
- (HMDAccessoryBrowserInjectedSettingsDevice)init;
- (id)createAuthServerWithDelegate:(id)a3;
- (id)createBtleAccessoryBrowser;
- (id)createCHIPAccessoryBrowser;
- (id)createHap2AccessoryBrowserWithStorage:(id)a3;
- (id)createIpAccessoryBrowser;
- (id)workQueue;
@end

@implementation HMDAccessoryBrowserInjectedSettingsDevice

- (void).cxx_destruct
{
}

- (id)createAuthServerWithDelegate:(id)a3
{
  id v3 = a3;
  v4 = [[HMDAuthServer alloc] initWithDelegate:v3];

  return v4;
}

- (id)createHap2AccessoryBrowserWithStorage:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F35890];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithQueue:self->_queue storage:v5];

  return v6;
}

- (id)createCHIPAccessoryBrowser
{
  id v3 = objc_alloc(MEMORY[0x263F497D0]);
  queue = self->_queue;
  id v5 = NSURL;
  id v6 = (id)storeDirectoryPath;
  v7 = [v5 fileURLWithPath:v6 isDirectory:1];
  v8 = (void *)[v3 initWithQueue:queue storeDirectoryURL:v7];

  return v8;
}

- (id)createBtleAccessoryBrowser
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F35888]) initWithQueue:self->_queue];
  return v2;
}

- (id)createIpAccessoryBrowser
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F35898]) initWithQueue:self->_queue];
  return v2;
}

- (id)workQueue
{
  return self->_queue;
}

- (HMDAccessoryBrowserInjectedSettingsDevice)init
{
  v9.receiver = self;
  v9.super_class = (Class)HMDAccessoryBrowserInjectedSettingsDevice;
  v2 = [(HMDAccessoryBrowserInjectedSettingsDevice *)&v9 init];
  if (v2)
  {
    HMDispatchQueueNameString();
    id v3 = objc_claimAutoreleasedReturnValue();
    v4 = (const char *)[v3 UTF8String];
    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

@end