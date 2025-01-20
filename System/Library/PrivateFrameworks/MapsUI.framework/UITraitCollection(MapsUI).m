@interface UITraitCollection(MapsUI)
- (BOOL)_mapsUI_isWithinMUPlatterView;
@end

@implementation UITraitCollection(MapsUI)

- (BOOL)_mapsUI_isWithinMUPlatterView
{
  v2 = self;
  uint64_t v3 = [a1 valueForNSIntegerTrait:v2];

  return v3 != 0;
}

@end