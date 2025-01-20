@interface MPModelGroupKind
+ (id)identityKind;
- (id)humanDescription;
@end

@implementation MPModelGroupKind

- (id)humanDescription
{
  return @"group";
}

+ (id)identityKind
{
  uint64_t v2 = objc_opt_class();

  return +[MPModelKind kindWithModelClass:v2];
}

@end