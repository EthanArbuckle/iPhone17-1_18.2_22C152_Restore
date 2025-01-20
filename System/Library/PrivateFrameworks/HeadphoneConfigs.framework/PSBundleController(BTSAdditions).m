@interface PSBundleController(BTSAdditions)
- (id)bundleParentController;
@end

@implementation PSBundleController(BTSAdditions)

- (id)bundleParentController
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + (int)*MEMORY[0x1E4F92EE8]));

  return WeakRetained;
}

@end