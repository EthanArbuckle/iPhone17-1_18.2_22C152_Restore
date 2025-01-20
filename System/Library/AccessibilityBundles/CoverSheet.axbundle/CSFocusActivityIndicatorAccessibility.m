@interface CSFocusActivityIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CSFocusActivityIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSFocusActivityIndicator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSFocusActivityIndicator", @"activity", "@", 0);
  [v3 validateClass:@"CSFocusActivityIndicator" hasInstanceVariable:@"_previousActivity" withType:"<FCActivityDescribing>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSFocusActivityView", @"delegate", "@", 0);
  [v3 validateProtocol:@"FCActivityDescribing" hasMethod:@"activityDisplayName" isInstanceMethod:1 isRequired:1];
  [v3 validateProtocol:@"CSFocusActivityViewDelegate" hasMethod:@"focusActivityViewIndicatorPressed:" isInstanceMethod:1 isRequired:1];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(CSFocusActivityIndicatorAccessibility *)self safeValueForKey:@"activity"];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = accessibilityLocalizedString(@"focus.on");
  }
  else
  {
    v5 = accessibilityLocalizedString(@"focus.off");
    v4 = [(CSFocusActivityIndicatorAccessibility *)self safeValueForKey:@"_previousActivity"];
  }
  v6 = NSString;
  v7 = [v4 safeStringForKey:@"activityDisplayName"];
  v8 = objc_msgSend(v6, "stringWithFormat:", v5, v7);

  return v8;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF18];
}

- (id)accessibilityCustomActions
{
  objc_initWeak(&location, self);
  id v2 = objc_alloc(MEMORY[0x263F1C390]);
  uint64_t v3 = accessibilityLocalizedString(@"open.focus.settings");
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__CSFocusActivityIndicatorAccessibility_accessibilityCustomActions__block_invoke;
  v7[3] = &unk_26511B5F0;
  objc_copyWeak(&v8, &location);
  v4 = (void *)[v2 initWithName:v3 actionHandler:v7];

  v5 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v4);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

uint64_t __67__CSFocusActivityIndicatorAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __67__CSFocusActivityIndicatorAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained accessibilityContainer];
  id v3 = [v2 safeValueForKey:@"_delegate"];
  id v4 = objc_loadWeakRetained(v1);
  [v3 focusActivityViewIndicatorPressed:v4];
}

@end