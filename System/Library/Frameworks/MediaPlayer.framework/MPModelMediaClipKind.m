@interface MPModelMediaClipKind
+ (id)identityKind;
- (id)humanDescription;
@end

@implementation MPModelMediaClipKind

- (id)humanDescription
{
  return @"media clip";
}

+ (id)identityKind
{
  uint64_t v2 = objc_opt_class();

  return +[MPModelKind kindWithModelClass:v2];
}

@end