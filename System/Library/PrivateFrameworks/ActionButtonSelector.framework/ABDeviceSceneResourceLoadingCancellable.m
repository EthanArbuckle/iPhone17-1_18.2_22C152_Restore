@interface ABDeviceSceneResourceLoadingCancellable
- (ABDeviceSceneResourceLoadingCancellable)initWithCancelBlock:(id)a3;
- (void)dealloc;
@end

@implementation ABDeviceSceneResourceLoadingCancellable

- (ABDeviceSceneResourceLoadingCancellable)initWithCancelBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ABDeviceSceneResourceLoadingCancellable;
  v5 = [(ABDeviceSceneResourceLoadingCancellable *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x24C555A80](v4);
    id cancelBlock = v5->_cancelBlock;
    v5->_id cancelBlock = (id)v6;
  }
  return v5;
}

- (void)dealloc
{
  (*((void (**)(void))self->_cancelBlock + 2))();
  v3.receiver = self;
  v3.super_class = (Class)ABDeviceSceneResourceLoadingCancellable;
  [(ABDeviceSceneResourceLoadingCancellable *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end