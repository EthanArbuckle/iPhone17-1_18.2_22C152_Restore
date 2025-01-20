@interface NSObject(LegacyModelObjectProviding)
- (id)musicKit_sanitizedLegacyModelObject;
@end

@implementation NSObject(LegacyModelObjectProviding)

- (id)musicKit_sanitizedLegacyModelObject
{
  getMPModelObjectClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = a1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

@end