@interface SUStorePageViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)reloadForSectionsWithGroup:(id)a3;
- (void)_handleViewControllerBecameReady:(id)a3;
- (void)_setActiveChildViewController:(id)a3 shouldTearDown:(BOOL)a4;
@end

@implementation SUStorePageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUStorePageViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_handleViewControllerBecameReady:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SUStorePageViewControllerAccessibility;
  [(SUStorePageViewControllerAccessibility *)&v3 _handleViewControllerBecameReady:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (BOOL)reloadForSectionsWithGroup:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUStorePageViewControllerAccessibility;
  BOOL v4 = [(SUStorePageViewControllerAccessibility *)&v8 reloadForSectionsWithGroup:a3];
  v5 = [(SUStorePageViewControllerAccessibility *)self safeValueForKey:@"_segmentedControl"];
  v6 = [(id)*MEMORY[0x263F1D020] safeValueForKey:@"_accessibilityContentLanguage"];
  [v5 setAccessibilityLanguage:v6];

  return v4;
}

- (void)_setActiveChildViewController:(id)a3 shouldTearDown:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(SUStorePageViewControllerAccessibility *)self safeValueForKey:@"_activeChildViewController"];
  NSClassFromString(&cfstr_Suplaceholderv.isa);
  char isKindOfClass = objc_opt_isKindOfClass();
  v9.receiver = self;
  v9.super_class = (Class)SUStorePageViewControllerAccessibility;
  [(SUStorePageViewControllerAccessibility *)&v9 _setActiveChildViewController:v6 shouldTearDown:v4];

  if (v7 != v6 && (isKindOfClass & 1) != 0) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

@end