@interface CKMacRecipientsControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CKMacRecipientsControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKMacRecipientsController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMacRecipientsController", @"toField", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNComposeRecipientTextView", @"textView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)CKMacRecipientsControllerAccessibility;
  [(CKMacRecipientsControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CKMacRecipientsControllerAccessibility *)self safeValueForKey:@"toField"];
  v4 = [v3 safeValueForKey:@"textView"];
  v5 = accessibilityLocalizedString(@"to.field");
  [v4 setAccessibilityLabel:v5];
}

@end