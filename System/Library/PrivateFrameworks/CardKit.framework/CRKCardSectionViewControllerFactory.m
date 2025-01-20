@interface CRKCardSectionViewControllerFactory
@end

@implementation CRKCardSectionViewControllerFactory

uint64_t __55___CRKCardSectionViewControllerFactory__sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(_CRKCardSectionViewControllerFactory);
  uint64_t v1 = _sharedInstance_sStaticFactory;
  _sharedInstance_sStaticFactory = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

@end