@interface CKNanoComposeControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityLabelForExtraButton;
@end

@implementation CKNanoComposeControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKNanoComposeController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateProtocol:@"PUICQuickboardViewControllerDelegate" hasOptionalInstanceMethod:@"extraButtonImage"];
  [v3 validateProtocol:@"PUICQuickboardViewControllerDelegate" hasOptionalInstanceMethod:@"extraButtonTapped"];
}

- (id)_accessibilityLabelForExtraButton
{
  return accessibilityLocalizedString(@"nano.reply.digital.touch");
}

@end