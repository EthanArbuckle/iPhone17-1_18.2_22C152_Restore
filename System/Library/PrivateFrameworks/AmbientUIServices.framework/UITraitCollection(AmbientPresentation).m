@interface UITraitCollection(AmbientPresentation)
- (BOOL)isAmbientPresented;
- (uint64_t)ambientDisplayStyle;
@end

@implementation UITraitCollection(AmbientPresentation)

- (BOOL)isAmbientPresented
{
  v2 = self;
  BOOL IsPresented = AMUIAmbientPresentationStateIsPresented([a1 valueForNSIntegerTrait:v2]);

  return IsPresented;
}

- (uint64_t)ambientDisplayStyle
{
  v2 = self;
  uint64_t v3 = [a1 valueForNSIntegerTrait:v2];

  return v3;
}

@end