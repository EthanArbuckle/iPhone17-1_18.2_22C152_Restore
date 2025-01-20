@interface PBControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_addTilesForPhotos:(id)a3 animated:(BOOL)a4;
- (id)_reviewModeFooter;
- (void)_accessibilityApplyLabels:(id)a3;
- (void)_reloadTiles;
- (void)setCurrentMode:(int)a3 animated:(BOOL)a4;
- (void)toggleCamera:(id)a3;
@end

@implementation PBControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PBController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PBController", @"_reloadTiles", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PBController", @"_addTilesForPhotos: animated:", "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PBController", @"setCurrentMode: animated:", "v", "i", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PBController", @"toggleCamera:", "v", "@", 0);
  [v3 validateClass:@"PBController" hasInstanceVariable:@"_effectsController" withType:"PBEffectsController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PBController", @"_flipButton", "@", 0);
}

- (id)_addTilesForPhotos:(id)a3 animated:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PBControllerAccessibility;
  v4 = [(PBControllerAccessibility *)&v6 _addTilesForPhotos:a3 animated:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);

  return v4;
}

- (void)_reloadTiles
{
  v2.receiver = self;
  v2.super_class = (Class)PBControllerAccessibility;
  [(PBControllerAccessibility *)&v2 _reloadTiles];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)_accessibilityApplyLabels:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = objc_msgSend(a3, "items", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        unint64_t v9 = [v8 tag] - 1;
        if (v9 <= 5 && ((0x2Fu >> v9) & 1) != 0)
        {
          v10 = axLocalizedString(off_2651438E8[v9]);
          [v8 setAccessibilityLabel:v10];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (id)_reviewModeFooter
{
  v5.receiver = self;
  v5.super_class = (Class)PBControllerAccessibility;
  id v3 = [(PBControllerAccessibility *)&v5 _reviewModeFooter];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(PBControllerAccessibility *)self _accessibilityApplyLabels:v3];
  }
  else {
    _AXAssert();
  }

  return v3;
}

- (void)setCurrentMode:(int)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PBControllerAccessibility;
  [(PBControllerAccessibility *)&v4 setCurrentMode:*(void *)&a3 animated:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)toggleCamera:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PBControllerAccessibility;
  [(PBControllerAccessibility *)&v6 toggleCamera:a3];
  UIAccessibilityNotifications v4 = *MEMORY[0x263F1CE68];
  objc_super v5 = [(PBControllerAccessibility *)self safeValueForKey:@"_flipButton"];
  UIAccessibilityPostNotification(v4, v5);
}

@end