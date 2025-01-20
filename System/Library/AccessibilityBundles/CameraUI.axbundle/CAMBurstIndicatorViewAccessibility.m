@interface CAMBurstIndicatorViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_updateCountLabelWithNumberOfPhotos;
@end

@implementation CAMBurstIndicatorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMBurstIndicatorView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMBurstIndicatorView", @"_updateCountLabelWithNumberOfPhotos", "v", 0);
  [v3 validateClass:@"CAMBurstIndicatorView" hasInstanceVariable:@"__numberOfPhotos" withType:"q"];
}

- (void)_updateCountLabelWithNumberOfPhotos
{
  v11.receiver = self;
  v11.super_class = (Class)CAMBurstIndicatorViewAccessibility;
  [(CAMBurstIndicatorViewAccessibility *)&v11 _updateCountLabelWithNumberOfPhotos];
  id v3 = [(CAMBurstIndicatorViewAccessibility *)self safeValueForKey:@"__numberOfPhotos"];
  uint64_t v4 = [v3 integerValue];

  if (v4 >= 5)
  {
    v5 = NSString;
    v6 = accessibilityCameraKitLocalizedString(@"camera.photo.burst.count");
    v7 = AXFormatInteger();
    v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);

    v9 = [MEMORY[0x263F21660] axAttributedStringWithString:v8];
    v10 = [NSNumber numberWithInteger:10];
    [v9 setAttribute:v10 forKey:*MEMORY[0x263F216D8]];

    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v9);
  }
}

@end