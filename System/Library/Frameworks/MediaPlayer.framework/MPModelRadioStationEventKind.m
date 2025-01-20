@interface MPModelRadioStationEventKind
+ (id)identityKind;
- (id)humanDescription;
@end

@implementation MPModelRadioStationEventKind

+ (id)identityKind
{
  uint64_t v2 = objc_opt_class();

  return +[MPModelKind kindWithModelClass:v2];
}

- (id)humanDescription
{
  return @"radio station event";
}

@end