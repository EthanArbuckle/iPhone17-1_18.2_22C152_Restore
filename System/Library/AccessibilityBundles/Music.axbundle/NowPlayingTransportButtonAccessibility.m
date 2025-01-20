@interface NowPlayingTransportButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation NowPlayingTransportButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Music.NowPlayingTransportButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIControl", @"isEnabled", "B", 0);
  [v3 validateClass:@"Music.NowPlayingTransportButton" isKindOfClass:@"UIButton"];
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)NowPlayingTransportButtonAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(NowPlayingTransportButtonAccessibility *)&v7 accessibilityTraits];
  int v4 = [(NowPlayingTransportButtonAccessibility *)self safeBoolForKey:@"isEnabled"];
  uint64_t v5 = *MEMORY[0x263F1CF20];
  if (v4) {
    uint64_t v5 = 0;
  }
  return v3 | v5;
}

@end