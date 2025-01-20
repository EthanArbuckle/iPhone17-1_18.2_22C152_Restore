@interface PUOneUpDetailsBarButtonControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axDetailsShowing;
- (id)_axAssetViewModel;
- (void)_axLoadDetailsButtonAccessibility:(id)a3;
- (void)update;
@end

@implementation PUOneUpDetailsBarButtonControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUOneUpDetailsBarButtonController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAssetViewModel", @"isAccessoryViewVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUBrowsingViewModel", @"assetViewModelForAssetReference:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUBrowsingViewModel", @"currentAssetReference", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUOneUpDetailsBarButtonController", @"update", "v", 0);
  [v3 validateClass:@"PUOneUpDetailsBarButtonController" hasSwiftField:@"browseViewModel" withSwiftType:"PUBrowsingViewModel"];
  [v3 validateClass:@"PUOneUpDetailsBarButtonController" hasSwiftField:@"barButtonItem" withSwiftType:"AnimatableBarButtonItem"];
}

- (id)_axAssetViewModel
{
  v2 = [(PUOneUpDetailsBarButtonControllerAccessibility *)self safeSwiftValueForKey:@"browseViewModel"];
  id v3 = [v2 safeValueForKey:@"currentAssetReference"];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  id v6 = v2;
  id v7 = v3;
  AXPerformSafeBlock();
  id v4 = (id)v9[5];

  _Block_object_dispose(&v8, 8);

  return v4;
}

uint64_t __67__PUOneUpDetailsBarButtonControllerAccessibility__axAssetViewModel__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) assetViewModelForAssetReference:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (BOOL)_axDetailsShowing
{
  v2 = [(PUOneUpDetailsBarButtonControllerAccessibility *)self _axAssetViewModel];
  char v3 = [v2 safeBoolForKey:@"isAccessoryViewVisible"];

  return v3;
}

- (void)_axLoadDetailsButtonAccessibility:(id)a3
{
  id v7 = a3;
  if ([(PUOneUpDetailsBarButtonControllerAccessibility *)self _axDetailsShowing])
  {
    uint64_t v4 = [v7 accessibilityTraits];
    uint64_t v5 = *MEMORY[0x263F1CF38] | v4;
  }
  else
  {
    uint64_t v6 = *MEMORY[0x263F1CF38];
    uint64_t v5 = [v7 accessibilityTraits] & ~v6;
  }
  [v7 setAccessibilityTraits:v5];
}

- (void)update
{
  v2.receiver = self;
  v2.super_class = (Class)PUOneUpDetailsBarButtonControllerAccessibility;
  [(PUOneUpDetailsBarButtonControllerAccessibility *)&v2 update];
  AXPerformSafeBlock();
}

void __56__PUOneUpDetailsBarButtonControllerAccessibility_update__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeSwiftValueForKey:@"barButtonItem"];
  [*(id *)(a1 + 32) _axLoadDetailsButtonAccessibility:v2];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end