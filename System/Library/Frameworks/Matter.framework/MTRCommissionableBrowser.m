@interface MTRCommissionableBrowser
- (BOOL)start;
- (BOOL)stop;
- (CommissionableBrowserInternal)browser;
- (MTRCommissionableBrowser)initWithDelegate:(id)a3 controller:(id)a4 queue:(id)a5;
- (MTRCommissionableBrowserDelegate)delegate;
- (MTRDeviceController)controller;
- (OS_dispatch_queue)queue;
- (id).cxx_construct;
- (void)setBrowser:(CommissionableBrowserInternal *)a3;
- (void)setQueue:(id)a3;
@end

@implementation MTRCommissionableBrowser

- (MTRCommissionableBrowser)initWithDelegate:(id)a3 controller:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MTRCommissionableBrowser;
  v12 = [(MTRCommissionableBrowser *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_delegate, a3);
    objc_storeStrong((id *)&v13->_controller, a4);
    objc_storeStrong((id *)&v13->_queue, a5);
  }

  return v13;
}

- (BOOL)start
{
  sub_244C971BC((uint64_t)&self->_browser, self->_delegate, self->_controller, self->_queue, &v3);
  return v3.n128_u32[0] == 0;
}

- (BOOL)stop
{
  sub_244C974C0((uint64_t)&self->_browser, self, &v8);
  unsigned __int32 v3 = v8.n128_u32[0];
  if (!v8.n128_u32[0])
  {
    delegate = self->_delegate;
    self->_delegate = 0;

    controller = self->_controller;
    self->_controller = 0;

    queue = self->_queue;
    self->_queue = 0;
  }
  return v3 == 0;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (MTRCommissionableBrowserDelegate)delegate
{
  return self->_delegate;
}

- (MTRDeviceController)controller
{
  return self->_controller;
}

- (CommissionableBrowserInternal)browser
{
  retstr->_vptr$DiscoverNodeDelegate = (void **)&unk_26F9529A8;
  retstr->_vptr$DnssdBrowseDelegate = (void **)&unk_26F952A00;
  retstr->_vptr$BleScannerDelegate = (void **)&unk_26F952A38;
  retstr->mBleScannerDelegateOwner = self->_browser.mBleScannerDelegateOwner;
  retstr->var0 = self->_browser.var0;
  retstr->mDelegate = self->_browser.mDelegate;
  retstr->mController = self->_browser.mController;
  result = self->_browser.mDiscoveredResults;
  retstr->mDiscoveredResults = (NSMutableDictionary *)result;
  *(_OWORD *)&retstr->mOnNetworkDevicesAdded = *(_OWORD *)&self->_browser.mOnNetworkDevicesAdded;
  return result;
}

- (void)setBrowser:(CommissionableBrowserInternal *)a3
{
  *(_OWORD *)&self->_browser.mOnNetworkDevicesAdded = *(_OWORD *)&a3->mOnNetworkDevicesAdded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = &unk_26F9529A8;
  *((void *)self + 5) = &unk_26F952A00;
  *((void *)self + 6) = &unk_26F952A38;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((void *)self + 11) = 0;
  return self;
}

@end