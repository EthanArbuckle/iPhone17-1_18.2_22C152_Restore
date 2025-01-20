@interface SBHLibraryViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation SBHLibraryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHLibraryViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBHLibraryViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHLibraryViewController", @"libraryPodFolderControllerRequestsDismissal:", "v", "@", 0);
  [v3 validateClass:@"SBHLibraryViewController" hasInstanceVariable:@"_podFolderViewController" withType:"SBHLibraryPodFolderController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)SBHLibraryViewControllerAccessibility;
  [(SBHLibraryViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SBHLibraryViewControllerAccessibility *)self safeValueForKey:@"view"];
  [v3 setAccessibilityViewIsModal:1];
}

- (BOOL)accessibilityPerformEscape
{
  int IsPad = AXDeviceIsPad();
  if (IsPad) {
    AXPerformSafeBlock();
  }
  return IsPad;
}

void __67__SBHLibraryViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = [v1 safeValueForKey:@"_podFolderViewController"];
  [v1 libraryPodFolderControllerRequestsDismissal:v2];

  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CE68];

  UIAccessibilityPostNotification(v3, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBHLibraryViewControllerAccessibility;
  [(SBHLibraryViewControllerAccessibility *)&v3 viewDidAppear:a3];
  if (AXDeviceIsPad()) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBHLibraryViewControllerAccessibility;
  [(SBHLibraryViewControllerAccessibility *)&v3 viewDidDisappear:a3];
  if (AXDeviceIsPad()) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  }
}

@end