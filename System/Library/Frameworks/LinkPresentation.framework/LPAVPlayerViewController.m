@interface LPAVPlayerViewController
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareForDisplayWithCompletionHandler:(id)a3;
@end

@implementation LPAVPlayerViewController

- (void)dealloc
{
  if (self->_readyForDisplayCallback) {
    [(LPAVPlayerViewController *)self removeObserver:self forKeyPath:@"readyForDisplay" context:&readyForDisplayKVOContext_0];
  }
  v3.receiver = self;
  v3.super_class = (Class)LPAVPlayerViewController;
  [(LPAVPlayerViewController *)&v3 dealloc];
}

- (void)prepareForDisplayWithCompletionHandler:(id)a3
{
  aBlock = (void (**)(void))a3;
  if ([(LPAVPlayerViewController *)self isReadyForDisplay])
  {
    aBlock[2]();
  }
  else
  {
    if (!self->_readyForDisplayCallback) {
      [(LPAVPlayerViewController *)self addObserver:self forKeyPath:@"readyForDisplay" options:0 context:&readyForDisplayKVOContext_0];
    }
    v4 = _Block_copy(aBlock);
    id readyForDisplayCallback = self->_readyForDisplayCallback;
    self->_id readyForDisplayCallback = v4;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == &readyForDisplayKVOContext_0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__LPAVPlayerViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5B04DF0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)LPAVPlayerViewController;
    [(LPAVPlayerViewController *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

uint64_t __75__LPAVPlayerViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 1904);
  if (result)
  {
    (*(void (**)(void))(result + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 1904);
    *(void *)(v3 + 1904) = 0;

    v5 = *(void **)(a1 + 32);
    return [v5 removeObserver:v5 forKeyPath:@"readyForDisplay" context:&readyForDisplayKVOContext_0];
  }
  return result;
}

- (void).cxx_destruct
{
}

@end