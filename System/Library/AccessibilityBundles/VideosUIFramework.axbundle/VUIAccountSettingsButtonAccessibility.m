@interface VUIAccountSettingsButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
@end

@implementation VUIAccountSettingsButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUIAccountSettingsButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VUIAccountSettingsButton" isKindOfClass:@"VUIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIButton", @"imageView", "@", 0);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"account.settings");
}

- (CGRect)accessibilityFrame
{
  id v3 = [(VUIAccountSettingsButtonAccessibility *)self safeValueForKey:@"imageView"];
  v4 = v3;
  if (v3)
  {
    [v3 accessibilityFrame];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)VUIAccountSettingsButtonAccessibility;
    [(VUIAccountSettingsButtonAccessibility *)&v17 accessibilityFrame];
  }
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;

  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

@end