@interface PXUIAssetBadgeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation PXUIAssetBadgeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXUIAssetBadgeView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXUIAssetBadgeView", @"badgeInfo", "{PXAssetBadgeInfo=Qdqq}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXUIAssetBadgeView", @"style", "q", 0);
  [v3 validateClass:@"PXUIAssetBadgeView" hasInstanceVariable:@"_topLeftPrimaryGroup" withType:"_PXUIAssetBadgeTopGroup"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_PXUIAssetBadgeTopGroup", @"label", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 1;
  AXPerformSafeBlock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __57__PXUIAssetBadgeViewAccessibility_isAccessibilityElement__block_invoke(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  if (v2) {
    [v2 badgeInfo];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "setAccessibilityElementsHidden:", 1, (unsigned __int128)0, (unsigned __int128)0);
}

- (id)accessibilityLabel
{
  id v3 = [(PXUIAssetBadgeViewAccessibility *)self safeValueForKey:@"_topLeftPrimaryGroup"];
  if (v3)
  {
    char v9 = 0;
    objc_opt_class();
    uint64_t v4 = [v3 safeValueForKey:@"label"];
    v5 = __UIAccessibilityCastAsClass();

    uint64_t v6 = [v5 accessibilityLabel];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PXUIAssetBadgeViewAccessibility;
    uint64_t v6 = [(PXUIAssetBadgeViewAccessibility *)&v8 accessibilityLabel];
  }

  return v6;
}

- (id)accessibilityValue
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  char v7 = __Block_byref_object_copy__2;
  objc_super v8 = __Block_byref_object_dispose__2;
  id v9 = 0;
  AXPerformSafeBlock();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __53__PXUIAssetBadgeViewAccessibility_accessibilityValue__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    [v1 badgeInfo];
  }
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)PXUIAssetBadgeViewAccessibility;
  unint64_t v3 = [(PXUIAssetBadgeViewAccessibility *)&v8 accessibilityTraits];
  uint64_t v4 = [(PXUIAssetBadgeViewAccessibility *)self safeValueForKey:@"style"];
  uint64_t v5 = [v4 integerValue];

  uint64_t v6 = *MEMORY[0x263F1CEE8];
  if (v5 != 4) {
    uint64_t v6 = 0;
  }
  return v6 | v3;
}

@end