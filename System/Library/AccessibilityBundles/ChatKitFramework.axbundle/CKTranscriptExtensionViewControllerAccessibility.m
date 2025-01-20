@interface CKTranscriptExtensionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CKTranscriptExtensionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKTranscriptExtensionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptExtensionViewControllerAccessibility;
  [(CKTranscriptExtensionViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(CKTranscriptExtensionViewControllerAccessibility *)self _accessibilityWindow];
  [v3 setAccessibilityIdentifier:@"AXMessagesExtensionWindow"];
}

@end