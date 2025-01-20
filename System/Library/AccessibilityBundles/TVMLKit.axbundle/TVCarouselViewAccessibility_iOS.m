@interface TVCarouselViewAccessibility_iOS
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_updateAutoScrollTimer;
@end

@implementation TVCarouselViewAccessibility_iOS

+ (id)safeCategoryTargetClassName
{
  return @"_TVCarouselView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVCarouselView", @"_updateAutoScrollTimer", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVCarouselView", @"_stopAutoScrollTimer", "v", 0);
}

- (void)_updateAutoScrollTimer
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    uint64_t v4 = MEMORY[0x263EF8330];
    uint64_t v5 = 3221225472;
    v6 = __57__TVCarouselViewAccessibility_iOS__updateAutoScrollTimer__block_invoke;
    v7 = &unk_26515DA10;
    v8 = self;
    AXPerformSafeBlock();
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)TVCarouselViewAccessibility_iOS;
    [(TVCarouselViewAccessibility_iOS *)&v3 _updateAutoScrollTimer];
  }
}

@end