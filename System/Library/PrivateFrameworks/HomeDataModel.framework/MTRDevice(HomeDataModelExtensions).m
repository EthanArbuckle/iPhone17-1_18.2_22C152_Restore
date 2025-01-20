@interface MTRDevice(HomeDataModelExtensions)
- (id)hdm_containingHome;
- (id)initForTestingWithClusterID:()HomeDataModelExtensions;
- (void)setHdm_containingHome:()HomeDataModelExtensions;
@end

@implementation MTRDevice(HomeDataModelExtensions)

- (id)hdm_containingHome
{
  v2 = objc_getAssociatedObject(a1, a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)setHdm_containingHome:()HomeDataModelExtensions
{
}

- (id)initForTestingWithClusterID:()HomeDataModelExtensions
{
  v2.receiver = a1;
  v2.super_class = (Class)&off_270295F38;
  return objc_msgSendSuper2(&v2, sel_init);
}

@end