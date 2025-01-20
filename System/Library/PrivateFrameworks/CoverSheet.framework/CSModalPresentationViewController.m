@interface CSModalPresentationViewController
- (CSModalPresentationViewController)init;
- (void)_addStateCaptureHandlers;
- (void)dealloc;
@end

@implementation CSModalPresentationViewController

- (CSModalPresentationViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSModalPresentationViewController;
  v2 = [(CSModalPresentationViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CSModalPresentationViewController *)v2 _addStateCaptureHandlers];
  }
  return v3;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateCaptureBlock invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CSModalPresentationViewController;
  [(CSCoverSheetViewControllerBase *)&v3 dealloc];
}

- (void)_addStateCaptureHandlers
{
  objc_initWeak(&location, self);
  id v3 = MEMORY[0x1E4F14428];
  objc_copyWeak(&v6, &location);
  BSLogAddStateCaptureBlockWithTitle();
  v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  stateCaptureBlock = self->_stateCaptureBlock;
  self->_stateCaptureBlock = v4;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __61__CSModalPresentationViewController__addStateCaptureHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained descriptionWithMultilinePrefix:0];

  return v2;
}

- (void).cxx_destruct
{
}

@end