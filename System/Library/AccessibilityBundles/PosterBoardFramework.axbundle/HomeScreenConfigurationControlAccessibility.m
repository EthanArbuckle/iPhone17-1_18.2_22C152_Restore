@interface HomeScreenConfigurationControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axPreviewContentIsPosterOrBlur:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axGradientColorValue:(id)a3;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation HomeScreenConfigurationControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PosterBoard.HomeScreenConfigurationControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PUIGradientView"];
  [v3 validateClass:@"PosterBoard.HomeScreenConfigurationControl" hasSwiftField:@"previewContentView" withSwiftType:"UIView"];
  [v3 validateClass:@"PUIGradientView" hasProperty:@"colors" withType:"@"];
  [v3 validateClass:@"PosterBoard.HomeScreenConfigurationControl" isKindOfClass:@"title"];
  [v3 validateClass:@"PosterBoard.HomeScreenConfigurationBlurControlContentView"];
  [v3 validateClass:@"PosterBoard.HomeScreenConfigurationPosterControlContentView"];
}

- (id)accessibilityLabel
{
  return (id)[(HomeScreenConfigurationControlAccessibility *)self safeSwiftStringForKey:@"title"];
}

- (id)accessibilityValue
{
  objc_opt_class();
  id v3 = [(HomeScreenConfigurationControlAccessibility *)self safeSwiftValueForKey:@"previewContentView"];
  v4 = __UIAccessibilityCastAsClass();

  if ([(HomeScreenConfigurationControlAccessibility *)self _axPreviewContentIsPosterOrBlur:v4])
  {
    uint64_t v5 = [v4 accessibilityValue];
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_6;
  }
  MEMORY[0x24565BD30](@"PUIGradientView");
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(HomeScreenConfigurationControlAccessibility *)self _axGradientColorValue:v4];
    goto LABEL_5;
  }
  v6 = [v4 backgroundColor];

  if (v6)
  {
    v8 = [v4 backgroundColor];
    v6 = AXColorStringForColor();
  }
LABEL_6:

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)HomeScreenConfigurationControlAccessibility;
  return *MEMORY[0x263F83260] | [(HomeScreenConfigurationControlAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityHint
{
  char v10 = 0;
  objc_opt_class();
  objc_super v3 = [(HomeScreenConfigurationControlAccessibility *)self safeSwiftValueForKey:@"previewContentView"];
  v4 = __UIAccessibilityCastAsClass();

  if ([(HomeScreenConfigurationControlAccessibility *)self _axPreviewContentIsPosterOrBlur:v4]&& [(HomeScreenConfigurationControlAccessibility *)self _accessibilityIsUserInteractionEnabled])
  {
    uint64_t v5 = [v4 accessibilityHint];
  }
  else
  {
    char v10 = 0;
    objc_opt_class();
    v6 = __UIAccessibilityCastAsClass();
    if ([v6 isSelected])
    {
      uint64_t v7 = accessibilityLocalizedString(@"home.configuration.select.color.hint");
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)HomeScreenConfigurationControlAccessibility;
      uint64_t v7 = [(HomeScreenConfigurationControlAccessibility *)&v9 accessibilityHint];
    }
    uint64_t v5 = (void *)v7;
  }

  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_axGradientColorValue:(id)a3
{
  id v3 = a3;
  v4 = [v3 safeArrayForKey:@"colors"];
  objc_opt_class();
  uint64_t v5 = [v4 firstObject];
  v6 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  uint64_t v7 = [v4 lastObject];
  v8 = __UIAccessibilityCastAsClass();

  objc_super v9 = AXColorStringForColor();
  char v10 = AXColorStringForColor();
  int v11 = [v9 isEqualToString:v10];
  v12 = NSString;
  if (v11)
  {
    v13 = accessibilityLocalizedString(@"home.configuration.gradient.color.value");
  }
  else
  {
    v13 = accessibilityLocalizedString(@"home.configuration.gradient.between.colors.value");
    v16 = v10;
  }
  v14 = objc_msgSend(v12, "stringWithFormat:", v13, v9, v16);

  return v14;
}

- (BOOL)_axPreviewContentIsPosterOrBlur:(id)a3
{
  id v3 = a3;
  MEMORY[0x24565BD30](@"PosterBoard.HomeScreenConfigurationBlurControlContentView");
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    MEMORY[0x24565BD30](@"PosterBoard.HomeScreenConfigurationPosterControlContentView");
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

@end