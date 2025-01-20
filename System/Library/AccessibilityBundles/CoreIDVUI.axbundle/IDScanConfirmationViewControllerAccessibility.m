@interface IDScanConfirmationViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation IDScanConfirmationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CoreIDVUI.IDScanConfirmationViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)IDScanConfirmationViewControllerAccessibility;
  [(IDScanConfirmationViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(IDScanConfirmationViewControllerAccessibility *)self safeUIViewForKey:@"imageView"];
  [v3 setIsAccessibilityElement:1];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CF00]];
  [v3 _accessibilitySetUserDefinedMediaAnalysisOptions:&unk_26F6881E0];
  v4 = accessibilityLocalizedString(@"id.card.scanned.photo");
  [v3 setAccessibilityLabel:v4];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)IDScanConfirmationViewControllerAccessibility;
  [(IDScanConfirmationViewControllerAccessibility *)&v3 viewDidLoad];
  [(IDScanConfirmationViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end