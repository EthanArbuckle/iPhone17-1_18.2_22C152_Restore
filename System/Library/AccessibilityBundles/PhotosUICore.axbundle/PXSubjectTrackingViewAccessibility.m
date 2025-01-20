@interface PXSubjectTrackingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
- (void)setCinematographyFrame:(id)a3 animate:(BOOL)a4;
@end

@implementation PXSubjectTrackingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXSubjectTrackingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXSubjectTrackingView", @"_axDescriptionForCacheKey:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXSubjectTrackingView", @"setCinematographyFrame:animate:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXSubjectTrackingView", @"detectionViewCache", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXSubjectTrackingView", @"focusStateBadge", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXSubjectTrackingView", @"layoutSubviews", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)PXSubjectTrackingViewAccessibility;
  [(PXSubjectTrackingViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PXSubjectTrackingViewAccessibility *)self safeDictionaryForKey:@"detectionViewCache"];
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __80__PXSubjectTrackingViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_2650A60F8;
  objc_copyWeak(&v5, &location);
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __80__PXSubjectTrackingViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  id v7 = v5;
  AXPerformSafeBlock();
  id v8 = (id)v15[5];

  objc_destroyWeak(&v13);
  _Block_object_dispose(&v14, 8);

  uint64_t v9 = [v6 safeIntegerForKey:@"shape"];
  v10 = [NSString string];
  if ((unint64_t)(v9 - 1) < 3)
  {
    uint64_t v11 = accessibilityPhotosUICoreLocalizedString(off_2650A6118[v9 - 1]);

    v10 = (void *)v11;
  }
  v12 = __UIAXStringForVariables();
  objc_msgSend(v6, "setAccessibilityLabel:", v12, v10, @"__AXStringForVariablesSentinel");
}

void __80__PXSubjectTrackingViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_485(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained _axDescriptionForCacheKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXSubjectTrackingViewAccessibility;
  [(PXSubjectTrackingViewAccessibility *)&v3 layoutSubviews];
  [(PXSubjectTrackingViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)setCinematographyFrame:(id)a3 animate:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PXSubjectTrackingViewAccessibility;
  [(PXSubjectTrackingViewAccessibility *)&v5 setCinematographyFrame:a3 animate:a4];
  [(PXSubjectTrackingViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end