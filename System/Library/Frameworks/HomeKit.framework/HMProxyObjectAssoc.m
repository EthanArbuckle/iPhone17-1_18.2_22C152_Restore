@interface HMProxyObjectAssoc
- (HMProxyObjectAssoc)self;
@end

@implementation HMProxyObjectAssoc

- (HMProxyObjectAssoc)self
{
  return (HMProxyObjectAssoc *)objc_getAssociatedObject(self, &HMProxyObjectAssocTargetKey);
}

@end