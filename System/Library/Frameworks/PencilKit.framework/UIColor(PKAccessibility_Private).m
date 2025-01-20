@interface UIColor(PKAccessibility_Private)
- (id)_pkaxCachedApproximateColorDescription;
- (void)_pkaxSetCachedApproximateColorDescription:()PKAccessibility_Private;
@end

@implementation UIColor(PKAccessibility_Private)

- (id)_pkaxCachedApproximateColorDescription
{
  return objc_getAssociatedObject(a1, &cachedColorDescriptionKey);
}

- (void)_pkaxSetCachedApproximateColorDescription:()PKAccessibility_Private
{
}

@end