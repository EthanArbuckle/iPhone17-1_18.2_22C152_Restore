@interface MPModelRadioStationKind
+ (id)identityKind;
- (id)humanDescription;
@end

@implementation MPModelRadioStationKind

+ (id)identityKind
{
  uint64_t v2 = objc_opt_class();

  return +[MPModelKind kindWithModelClass:v2];
}

- (id)humanDescription
{
  return @"radio station";
}

@end