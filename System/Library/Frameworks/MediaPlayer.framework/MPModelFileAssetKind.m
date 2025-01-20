@interface MPModelFileAssetKind
+ (id)identityKind;
- (id)humanDescription;
@end

@implementation MPModelFileAssetKind

+ (id)identityKind
{
  uint64_t v2 = objc_opt_class();

  return +[MPModelKind kindWithModelClass:v2];
}

- (id)humanDescription
{
  return @"file asset";
}

@end