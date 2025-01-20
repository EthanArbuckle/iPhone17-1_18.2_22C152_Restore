@interface CCUIVPNModule
- (id)contentViewControllerForContext:(id)a3;
@end

@implementation CCUIVPNModule

- (id)contentViewControllerForContext:(id)a3
{
  id v3 = objc_alloc_init((Class)CCUIVPNModuleViewController);

  return v3;
}

@end