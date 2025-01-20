@interface SBHIconGridSizeClassDomain(ControlCenterUIServices)
+ (id)controlCenterDomain;
@end

@implementation SBHIconGridSizeClassDomain(ControlCenterUIServices)

+ (id)controlCenterDomain
{
  if (controlCenterDomain_onceToken != -1) {
    dispatch_once(&controlCenterDomain_onceToken, &__block_literal_global);
  }
  v0 = (void *)controlCenterDomain_controlCenterDomain;
  return v0;
}

@end