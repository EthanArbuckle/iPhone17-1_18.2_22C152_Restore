@interface UIDocumentLaunchViewControllerAccessibility
@end

@implementation UIDocumentLaunchViewControllerAccessibility

uint64_t __90___UIDocumentLaunchViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(&cfstr_Uiremoteview.isa);
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

BOOL __90___UIDocumentLaunchViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = (id)[WeakRetained safeValueForKey:@"_browserPresentationController"];
  id v2 = (id)[v3 safeStringForKey:@"selectedDetentIdentifier"];
  char v5 = [v2 isEqualToString:@"_UIDocumentUnavailableViewBrowserViewControllerMediumDetent"];

  return (v5 & 1) != 0;
}

@end