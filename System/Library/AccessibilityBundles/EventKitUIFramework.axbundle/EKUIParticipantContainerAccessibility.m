@interface EKUIParticipantContainerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation EKUIParticipantContainerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKUIParticipantContainer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKUIParticipantContainer", @"nameLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKUIParticipantContainer", @"subLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(EKUIParticipantContainerAccessibility *)self safeUIViewForKey:@"nameLabel"];
  v4 = [v3 accessibilityLabel];
  v5 = [(EKUIParticipantContainerAccessibility *)self safeUIViewForKey:@"subLabel"];
  v8 = [v5 accessibilityLabel];
  v6 = __AXStringForVariables();

  return v6;
}

@end