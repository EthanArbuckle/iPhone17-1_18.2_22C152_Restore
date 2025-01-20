@interface UIResponder(SafariServicesExtras)
- (BOOL)sf_inResponderChain;
@end

@implementation UIResponder(SafariServicesExtras)

- (BOOL)sf_inResponderChain
{
  uint64_t v2 = [a1 firstResponder];
  v3 = (void *)v2;
  for (BOOL i = v2 != 0; v3 != a1 && v3; BOOL i = v3 != 0)
  {
    v5 = v3;
    v3 = [v3 nextResponder];
  }
  return i;
}

@end