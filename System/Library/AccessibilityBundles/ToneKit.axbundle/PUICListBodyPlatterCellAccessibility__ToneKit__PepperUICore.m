@interface PUICListBodyPlatterCellAccessibility__ToneKit__PepperUICore
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation PUICListBodyPlatterCellAccessibility__ToneKit__PepperUICore

+ (id)safeCategoryTargetClassName
{
  return @"PUICListBodyPlatterCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUICListBodyPlatterCell", @"bodyLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUICListPlatterCell", @"trailingAccessoryView", "@", 0);
  [v3 validateClass:@"PUICListBodyPlatterCell" isKindOfClass:@"PUICPlatterCell"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(PUICListBodyPlatterCellAccessibility__ToneKit__PepperUICore *)self safeValueForKey:@"bodyLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v12.receiver = self;
  v12.super_class = (Class)PUICListBodyPlatterCellAccessibility__ToneKit__PepperUICore;
  unint64_t v3 = [(PUICListBodyPlatterCellAccessibility__ToneKit__PepperUICore *)&v12 accessibilityTraits];
  objc_opt_class();
  v4 = [(PUICListBodyPlatterCellAccessibility__ToneKit__PepperUICore *)self safeValueForKey:@"trailingAccessoryView"];
  v5 = __UIAccessibilityCastAsClass();

  if (([v5 isHidden] & 1) == 0)
  {
    v6 = [v5 image];

    if (v6)
    {
      v7 = [v5 image];
      v8 = MEMORY[0x245667980]();

      int v9 = [v8 isEqualToString:@"checkmark"];
      uint64_t v10 = *MEMORY[0x263F1CF38];
      if (!v9) {
        uint64_t v10 = 0;
      }
      v3 |= v10;
    }
  }

  return v3;
}

- (id)accessibilityValue
{
  v4.receiver = self;
  v4.super_class = (Class)PUICListBodyPlatterCellAccessibility__ToneKit__PepperUICore;
  v2 = [(PUICListBodyPlatterCellAccessibility__ToneKit__PepperUICore *)&v4 accessibilityValue];

  return v2;
}

@end