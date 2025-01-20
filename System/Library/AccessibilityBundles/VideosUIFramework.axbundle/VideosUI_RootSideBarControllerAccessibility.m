@interface VideosUI_RootSideBarControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation VideosUI_RootSideBarControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.RootSideBarController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VideosUI.RootSideBarController" hasSwiftField:@"delegate" withSwiftType:"Optional<RootSideBarControllerDelegate>"];
  [v3 validateClass:@"VideosUI.RootSplitViewController" hasSwiftField:@"pillView" withSwiftType:"RootSideBarPillView"];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VideosUI_RootSideBarControllerAccessibility;
  [(VideosUI_RootSideBarControllerAccessibility *)&v10 viewDidDisappear:a3];
  v4 = [(VideosUI_RootSideBarControllerAccessibility *)self safeSwiftValueForKey:@"delegate"];
  v5 = [v4 safeSwiftValueForKey:@"pillView"];
  v6 = [v5 _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_11];
  v7 = objc_msgSend(v6, "ax_mappedArrayUsingBlock:", &__block_literal_global_287);

  if ([v7 count] == 2)
  {
    UIAccessibilityNotifications v8 = *MEMORY[0x263F1CDC8];
    v9 = [v7 componentsJoinedByString:@", "];
    UIAccessibilityPostNotification(v8, v9);
  }
}

@end