@interface CKTranscriptManagementNameFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsScrollAncestor;
- (BOOL)_accessibilityOverridesInvalidFrames;
- (BOOL)accessibilityScrollToVisible;
- (BOOL)isAccessibilityElement;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation CKTranscriptManagementNameFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKTranscriptManagementNameField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptManagementNameField", @"fieldLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptManagementNameField", @"textField", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  return 1;
}

- (BOOL)_accessibilityIsScrollAncestor
{
  return 1;
}

- (BOOL)accessibilityScrollToVisible
{
  v2 = [(CKTranscriptManagementNameFieldAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Cktranscriptma_1.isa)];
  id v3 = [v2 safeValueForKey:@"attachmentsCollectionView"];
  v4 = __UIAccessibilitySafeClass();

  v5 = [v4 _accessibilityDescendantOfType:objc_opt_class()];
  [v5 contentInset];
  objc_msgSend(v5, "accessibilityApplyScrollContent:sendScrollStatus:animated:", 0, 0, 0.0, -v6);

  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptManagementNameFieldAccessibility;
  [(CKTranscriptManagementNameFieldAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CKTranscriptManagementNameFieldAccessibility *)self safeValueForKey:@"fieldLabel"];
  [v3 setIsAccessibilityElement:0];
  v4 = [(CKTranscriptManagementNameFieldAccessibility *)self safeValueForKey:@"textField"];
  [v4 accessibilitySetIdentification:@"GroupNameField"];

  v5 = [(CKTranscriptManagementNameFieldAccessibility *)self safeValueForKey:@"textField"];
  double v6 = [v3 accessibilityLabel];
  [v5 setAccessibilityLabel:v6];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptManagementNameFieldAccessibility;
  [(CKTranscriptManagementNameFieldAccessibility *)&v3 layoutSubviews];
  [(CKTranscriptManagementNameFieldAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end