@interface SidebarContentDimmingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityViewIsModal;
- (id)_accessibilityObscuredScreenAllowedViews;
@end

@implementation SidebarContentDimmingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SidebarContentDimmingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SidebarContentDimmingView" hasInstanceVariable:@"_passthroughView" withType:"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SidebarContentDimmingView", @"delegate", "@", 0);
  [v3 validateClass:@"BrowserToolbar" hasInstanceVariable:@"_barRegistration" withType:"<_SFBarRegistrationToken>"];
  [v3 validateClass:@"SFBarRegistration" hasInstanceVariable:@"_bookmarksItem" withType:"UIBarButtonItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserRootViewController", @"bottomToolbar", "@", 0);
}

- (id)_accessibilityObscuredScreenAllowedViews
{
  id v3 = [(SidebarContentDimmingViewAccessibility *)self safeValueForKey:@"delegate"];
  v4 = [v3 safeValueForKey:@"bottomToolbar"];
  v5 = [v4 safeValueForKey:@"_barRegistration"];

  objc_opt_class();
  v6 = [v5 safeValueForKey:@"_bookmarksItem"];
  v7 = [v6 safeValueForKey:@"view"];
  v8 = __UIAccessibilityCastAsClass();

  v9 = (void *)MEMORY[0x263EFF8C0];
  v10 = [(SidebarContentDimmingViewAccessibility *)self safeValueForKey:@"_passthroughView"];
  v11 = objc_msgSend(v9, "axArrayByIgnoringNilElementsWithCount:", 2, v10, v8);

  return v11;
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end