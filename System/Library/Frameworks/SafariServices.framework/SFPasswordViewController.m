@interface SFPasswordViewController
@end

@implementation SFPasswordViewController

void __46___SFPasswordViewController__connectToService__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 976);
  *(void *)(v1 + 976) = 0;
}

void __59___SFPasswordViewController__dismissPasswordViewController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 984));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained passwordViewControllerDidFinish:*(void *)(a1 + 32)];
  }
}

@end