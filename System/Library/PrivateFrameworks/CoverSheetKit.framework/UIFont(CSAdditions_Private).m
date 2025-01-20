@interface UIFont(CSAdditions_Private)
- (id)cs_cachedVariantWeight;
- (void)cs_setCachedVariantWeight:()CSAdditions_Private;
@end

@implementation UIFont(CSAdditions_Private)

- (id)cs_cachedVariantWeight
{
  return objc_getAssociatedObject(a1, &CSCachedVariantWeightAssociationKey);
}

- (void)cs_setCachedVariantWeight:()CSAdditions_Private
{
}

@end