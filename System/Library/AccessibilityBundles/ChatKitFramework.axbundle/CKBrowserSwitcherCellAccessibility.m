@interface CKBrowserSwitcherCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)canBecomeFocused;
@end

@implementation CKBrowserSwitcherCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKBrowserSwitcherCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKBrowserPluginCell" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"canBecomeFocused", "B", 0);
}

- (BOOL)canBecomeFocused
{
  v5.receiver = self;
  v5.super_class = (Class)CKBrowserSwitcherCellAccessibility;
  unsigned __int8 v3 = [(CKBrowserSwitcherCellAccessibility *)&v5 canBecomeFocused];
  return v3 & ~[(CKBrowserSwitcherCellAccessibility *)self _accessibilityIsFKARunningForFocusItem];
}

@end