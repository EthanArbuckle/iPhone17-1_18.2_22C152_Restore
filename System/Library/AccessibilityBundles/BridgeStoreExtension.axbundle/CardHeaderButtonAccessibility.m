@interface CardHeaderButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsBackButton;
- (BOOL)_axIsCloseButton;
- (BOOL)isAccessibilityElement;
- (id)_imageAsset;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (unint64_t)accessibilityTraits;
@end

@implementation CardHeaderButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BridgeStoreExtension.CardHeaderButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CardHeaderButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CardHeaderButtonAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  if ([(CardHeaderButtonAccessibility *)self _axIsCloseButton])
  {
    objc_super v3 = @"popover.view.dismiss.article";
LABEL_5:
    v4 = accessibilityAppStoreLocalizedString(v3);
    goto LABEL_7;
  }
  if ([(CardHeaderButtonAccessibility *)self _axIsBackButton])
  {
    objc_super v3 = @"back.button";
    goto LABEL_5;
  }
  v6.receiver = self;
  v6.super_class = (Class)CardHeaderButtonAccessibility;
  v4 = [(CardHeaderButtonAccessibility *)&v6 accessibilityLabel];
LABEL_7:

  return v4;
}

- (id)accessibilityHint
{
  if ([(CardHeaderButtonAccessibility *)self _axIsCloseButton])
  {
    objc_super v3 = accessibilityAppStoreLocalizedString(@"popover.view.dismiss.article.hint");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CardHeaderButtonAccessibility;
    objc_super v3 = [(CardHeaderButtonAccessibility *)&v5 accessibilityHint];
  }

  return v3;
}

- (id)accessibilityUserInputLabels
{
  if ([(CardHeaderButtonAccessibility *)self _axIsCloseButton])
  {
    objc_super v3 = accessibilityAppStoreLocalizedString(@"popover.view.dismiss.article.user.input");
    v4 = MEMORY[0x245645800]();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CardHeaderButtonAccessibility;
    v4 = [(CardHeaderButtonAccessibility *)&v6 accessibilityUserInputLabels];
  }

  return v4;
}

- (id)_imageAsset
{
  objc_opt_class();
  objc_super v3 = [(CardHeaderButtonAccessibility *)self safeSwiftValueForKey:@"vibrantImageView"];
  v4 = __UIAccessibilityCastAsClass();

  objc_super v5 = [v4 image];
  objc_super v6 = [v5 safeValueForKey:@"_imageAsset"];
  v7 = [v6 safeStringForKey:@"assetName"];

  return v7;
}

- (BOOL)_axIsCloseButton
{
  v2 = [(CardHeaderButtonAccessibility *)self _imageAsset];
  char v3 = [v2 isEqualToString:@"xmark"];

  return v3;
}

- (BOOL)_axIsBackButton
{
  v2 = [(CardHeaderButtonAccessibility *)self _imageAsset];
  char v3 = [v2 isEqualToString:@"chevron.backward"];

  return v3;
}

@end