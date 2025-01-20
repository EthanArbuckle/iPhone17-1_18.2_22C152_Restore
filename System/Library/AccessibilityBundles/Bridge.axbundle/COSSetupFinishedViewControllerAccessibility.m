@interface COSSetupFinishedViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation COSSetupFinishedViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"COSSetupFinishedViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PBBridgeProgressView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PBBridgeProgressView", @"currentProgress", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"COSSetupFinishedViewController", @"illustratedSyncView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"COSSetupFinishedViewController", @"progressView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"COSSetupFinishedViewController", @"progress", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v12.receiver = self;
  v12.super_class = (Class)COSSetupFinishedViewControllerAccessibility;
  [(COSSetupFinishedViewControllerAccessibility *)&v12 _accessibilityLoadAccessibilityInformation];
  LOBYTE(location) = 0;
  id v3 = [(COSSetupFinishedViewControllerAccessibility *)self safeValueForKey:@"illustratedSyncView"];
  v4 = __UIAccessibilitySafeClass();

  if (v4)
  {
    objc_initWeak(&location, self);
    [v4 setIsAccessibilityElement:1];
    v5 = accessibilityLocalizedString(@"sync.progress");
    [v4 setAccessibilityLabel:v5];

    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    v8 = __89__COSSetupFinishedViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v9 = &unk_26510F0E8;
    objc_copyWeak(&v10, &location);
    [v4 _setAccessibilityValueBlock:&v6];
    objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x263F1CF68], v6, v7, v8, v9);
    [v4 _accessibilitySetUserDefinedMediaAnalysisOptions:&unk_26F640CC8];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

id __89__COSSetupFinishedViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _accessibilityBoolValueForKey:@"isSyncComplete"])
  {
    v2 = 0;
  }
  else
  {
    id v3 = [WeakRetained safeValueForKey:@"progressView"];
    v4 = __UIAccessibilitySafeClass();
    v5 = [v4 safeValueForKey:@"currentProgress"];
    [v5 doubleValue];

    v2 = AXFormatFloatWithPercentage();
    if (AXIsInternalInstall())
    {
      uint64_t v6 = [WeakRetained safeValueForKey:@"progress"];
      uint64_t v7 = [v6 accessibilityLabel];

      if ([v7 length])
      {
        id v10 = [NSString stringWithFormat:@"Apple Internal Info: %@", v7];
        uint64_t v8 = __UIAXStringForVariables();

        v2 = (void *)v8;
      }
    }
  }

  return v2;
}

@end