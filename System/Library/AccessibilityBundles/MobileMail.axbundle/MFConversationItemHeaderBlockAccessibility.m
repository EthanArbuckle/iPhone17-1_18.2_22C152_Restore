@interface MFConversationItemHeaderBlockAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)createPrimaryViews;
@end

@implementation MFConversationItemHeaderBlockAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFConversationItemHeaderBlock";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFConversationItemHeaderBlock", @"horizontalStatusIndicatorContentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFConversationItemHeaderBlock", @"createPrimaryViews", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)MFConversationItemHeaderBlockAccessibility;
  [(MFConversationItemHeaderBlockAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MFConversationItemHeaderBlockAccessibility *)self safeValueForKey:@"horizontalStatusIndicatorContentView"];
  [v3 accessibilitySetIdentification:@"AXAccessibilityStatusIndicatorView"];
}

- (void)createPrimaryViews
{
  v3.receiver = self;
  v3.super_class = (Class)MFConversationItemHeaderBlockAccessibility;
  [(MFConversationItemHeaderBlockAccessibility *)&v3 createPrimaryViews];
  [(MFConversationItemHeaderBlockAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end