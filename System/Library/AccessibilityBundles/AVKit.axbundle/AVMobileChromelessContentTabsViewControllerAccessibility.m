@interface AVMobileChromelessContentTabsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)contentTabsView:(id)a3 didChangeContentTab:(id)a4 withReason:(unint64_t)a5;
@end

@implementation AVMobileChromelessContentTabsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVMobileChromelessContentTabsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)contentTabsView:(id)a3 didChangeContentTab:(id)a4 withReason:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVMobileChromelessContentTabsViewControllerAccessibility;
  [(AVMobileChromelessContentTabsViewControllerAccessibility *)&v12 contentTabsView:v8 didChangeContentTab:v9 withReason:a5];
  objc_initWeak(&location, v8);
  objc_copyWeak(&v10, &location);
  AXPerformBlockOnMainThreadAfterDelay();
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __107__AVMobileChromelessContentTabsViewControllerAccessibility_contentTabsView_didChangeContentTab_withReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained _accessibilityFindSubviewDescendant:&__block_literal_global_6];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v1);
}

uint64_t __107__AVMobileChromelessContentTabsViewControllerAccessibility_contentTabsView_didChangeContentTab_withReason___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  if (v2)
  {
    NSClassFromString(&cfstr_Avmobilechrome_15.isa);
    char v3 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v3 = 0;
  }

  return v3 & 1;
}

@end