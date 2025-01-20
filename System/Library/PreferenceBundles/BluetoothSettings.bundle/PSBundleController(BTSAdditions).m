@interface PSBundleController(BTSAdditions)
- (id)bundleParentController;
@end

@implementation PSBundleController(BTSAdditions)

- (id)bundleParentController
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + (int)*MEMORY[0x263F5FD50]));

  return WeakRetained;
}

@end