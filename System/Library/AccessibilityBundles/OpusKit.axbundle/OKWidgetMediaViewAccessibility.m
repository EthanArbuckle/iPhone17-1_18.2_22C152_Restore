@interface OKWidgetMediaViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation OKWidgetMediaViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"OKWidgetMediaView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"OKWidgetMediaView" isKindOfClass:@"OKWidgetMediaViewProxy"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OKWidgetViewProxy", @"mediaURLs", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OKWidgetViewProxy", @"pageViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OKPageViewController", @"presentationViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OKPresentationViewControllerProxy", @"presentation", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OKPresentation", @"mediaItemForURL:", "@", "@", 0);
  [v3 validateClass:@"OKMediaPhotoKitItem" hasInstanceVariable:@"_asset" withType:"PHAsset"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(OKWidgetMediaViewAccessibility *)self safeValueForKey:@"mediaURLs"];
  v4 = __UIAccessibilitySafeClass();

  v5 = [(OKWidgetMediaViewAccessibility *)self safeValueForKey:@"pageViewController"];
  v6 = __UIAccessibilitySafeClass();

  v7 = [v6 safeValueForKey:@"presentationViewController"];
  v8 = __UIAccessibilitySafeClass();

  v9 = [v8 safeValueForKey:@"presentation"];
  v10 = __UIAccessibilitySafeClass();

  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  id v15 = v10;
  id v16 = v4;
  AXPerformSafeBlock();
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  v12 = [v11 safeValueForKey:@"_asset"];

  v13 = [v12 accessibilityLabel];

  return v13;
}

void __52__OKWidgetMediaViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) firstObject];
  uint64_t v3 = [v2 mediaItemForURL:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF00];
}

@end