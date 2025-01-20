@interface CKContactBalloonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySupportsActivateAction;
- (id)accessibilityLabel;
@end

@implementation CKContactBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKContactBalloonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKContactBalloonView", @"nameLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKContactBalloonView", @"organizationLabel", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = _AXCKStringForMediaType(4);
  v4 = [(CKContactBalloonViewAccessibility *)self safeValueForKey:@"nameLabel"];
  v5 = [v4 accessibilityLabel];
  v6 = [(CKContactBalloonViewAccessibility *)self safeValueForKey:@"organizationLabel"];
  v9 = [v6 accessibilityLabel];
  v7 = __UIAXStringForVariables();

  return v7;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

@end