@interface PlaybackStatusViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityViewIsVisible;
- (id)accessibilityLabel;
@end

@implementation PlaybackStatusViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.PlaybackStatusView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.PlaybackStatusView", @"accessibilityTimeRemainingString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.PlaybackStatusView", @"accessibilityPlayedDateString", "@", 0);
}

- (id)accessibilityLabel
{
  return (id)[(PlaybackStatusViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityTimeRemainingString, accessibilityPlayedDateString"];
}

- (BOOL)_accessibilityViewIsVisible
{
  objc_initWeak(&location, self);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  v8 = __62__PlaybackStatusViewAccessibility__accessibilityViewIsVisible__block_invoke;
  v9 = &unk_265144298;
  objc_copyWeak(&v10, &location);
  id v3 = [(PlaybackStatusViewAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&v6];
  BOOL v4 = objc_msgSend(v3, "count", v6, v7, v8, v9) != 0;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v4;
}

uint64_t __62__PlaybackStatusViewAccessibility__accessibilityViewIsVisible__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained == v3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [v3 _accessibilityViewIsVisible];
  }

  return v5;
}

@end