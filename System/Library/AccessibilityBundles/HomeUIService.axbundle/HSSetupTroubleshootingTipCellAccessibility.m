@interface HSSetupTroubleshootingTipCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (HSSetupTroubleshootingTipCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation HSSetupTroubleshootingTipCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HSSetupTroubleshootingTipCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HSSetupTroubleshootingTipCell", @"bodyTextView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HSSetupTroubleshootingTipCell", @"initWithStyle:reuseIdentifier:", "@", "q", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)HSSetupTroubleshootingTipCellAccessibility;
  [(HSSetupTroubleshootingTipCellAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(HSSetupTroubleshootingTipCellAccessibility *)self safeValueForKey:@"bodyTextView"];
  [v3 _accessibilitySetTextViewShouldBreakUpParagraphs:1];
}

- (HSSetupTroubleshootingTipCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)HSSetupTroubleshootingTipCellAccessibility;
  objc_super v4 = [(HSSetupTroubleshootingTipCellAccessibility *)&v6 initWithStyle:a3 reuseIdentifier:a4];
  [(HSSetupTroubleshootingTipCellAccessibility *)v4 _accessibilityLoadAccessibilityInformation];

  return v4;
}

@end