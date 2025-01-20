@interface CLPlacemark(INIntentsAdditionsDeprecated)
- (uint64_t)initIntentPlacemarkWithLocation:()INIntentsAdditionsDeprecated addressDictionary:;
@end

@implementation CLPlacemark(INIntentsAdditionsDeprecated)

- (uint64_t)initIntentPlacemarkWithLocation:()INIntentsAdditionsDeprecated addressDictionary:
{
  return [a1 initWithLocation:a3 addressDictionary:a4 region:0 areasOfInterest:0];
}

@end