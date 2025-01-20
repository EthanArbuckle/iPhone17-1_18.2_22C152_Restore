@interface IndoorProtocolProxy
- (CLIndoorDelegateProtocol)delegate;
- (IndoorProtocolProxy)initWithDelegate:(id)a3;
- (NSError)shutdownReason;
- (void)indoorAssetDownloadProgress:(float)a3;
- (void)indoorDidFailWithError:(id)a3;
- (void)indoorDidShutdown:(id)a3;
- (void)indoorDidUpdateToLocation:(id)a3 fromLocation:(id)a4;
- (void)indoorGivesUpWithLocation:(id)a3;
- (void)indoorIsUncertainWithLocation:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation IndoorProtocolProxy

- (IndoorProtocolProxy)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IndoorProtocolProxy;
  v5 = [(IndoorProtocolProxy *)&v11 init];
  v7 = v5;
  if (v5)
  {
    if (!v4)
    {
      objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], v6, *MEMORY[0x263EFF4A0], @"no delegate", 0);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v10);
    }
    objc_storeWeak((id *)&v5->_delegate, v4);
    v8 = v7;
  }

  return v7;
}

- (void)indoorDidUpdateToLocation:(id)a3 fromLocation:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  objc_super v11 = objc_msgSend_delegate(self, v7, v8, v9, v10);
  objc_msgSend_indoorDidUpdateToLocation_fromLocation_(v11, v12, (uint64_t)v14, (uint64_t)v6, v13);
}

- (void)indoorIsUncertainWithLocation:(id)a3
{
  id v12 = a3;
  uint64_t v8 = objc_msgSend_delegate(self, v4, v5, v6, v7);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend_indoorIsUncertainWithLocation_(v8, v9, (uint64_t)v12, v10, v11);
  }
}

- (void)indoorGivesUpWithLocation:(id)a3
{
  id v12 = a3;
  uint64_t v8 = objc_msgSend_delegate(self, v4, v5, v6, v7);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend_indoorGivesUpWithLocation_(v8, v9, (uint64_t)v12, v10, v11);
  }
}

- (void)indoorAssetDownloadProgress:(float)a3
{
  objc_msgSend_delegate(self, a2, v3, v4, v5);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_opt_respondsToSelector())
  {
    *(float *)&double v11 = a3;
    objc_msgSend_indoorAssetDownloadProgress_(v12, v7, v8, v9, v10, v11);
  }
}

- (void)indoorDidFailWithError:(id)a3
{
  id v12 = a3;
  uint64_t v8 = objc_msgSend_delegate(self, v4, v5, v6, v7);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend_indoorDidFailWithError_(v8, v9, (uint64_t)v12, v10, v11);
  }
}

- (void)indoorDidShutdown:(id)a3
{
  uint64_t v4 = (NSError *)a3;
  if (v4)
  {
    shutdownReason = self->_shutdownReason;
    self->_shutdownReason = v4;
  }
  else
  {
    NSLog(&cfstr_ErrorDidnTGetA.isa);
    id v6 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v8 = (NSError *)objc_msgSend_initWithDomain_code_userInfo_(v6, v7, @"com.apple.pipelined", -1, (uint64_t)&unk_26D4700E0);
    shutdownReason = self->_shutdownReason;
    self->_shutdownReason = v8;
  }
}

- (CLIndoorDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CLIndoorDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSError)shutdownReason
{
  return self->_shutdownReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shutdownReason, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end