@interface CHNoHeartRateDataViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
@end

@implementation CHNoHeartRateDataViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CHNoHeartRateDataViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHNoHeartRateDataViewController", @"loadView", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHNoHeartRateDataViewController", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHNoHeartRateDataViewController", @"linkLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHNoHeartRateDataViewController", @"linkButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v10.receiver = self;
  v10.super_class = (Class)CHNoHeartRateDataViewControllerAccessibility;
  [(CHNoHeartRateDataViewControllerAccessibility *)&v10 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CHNoHeartRateDataViewControllerAccessibility *)self safeValueForKey:@"titleLabel"];
  unint64_t v4 = (unint64_t)[v3 accessibilityTraits];
  [v3 setAccessibilityTraits:UIAccessibilityTraitHeader | v4];
  v5 = [(CHNoHeartRateDataViewControllerAccessibility *)self safeValueForKey:@"linkLabel"];
  [v5 setIsAccessibilityElement:0];

  objc_initWeak(&location, self);
  v6 = [(CHNoHeartRateDataViewControllerAccessibility *)self safeValueForKey:@"linkButton"];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __90__CHNoHeartRateDataViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v7[3] = &unk_18448;
  objc_copyWeak(&v8, &location);
  [v6 _setAccessibilityLabelBlock:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

id __90__CHNoHeartRateDataViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"linkLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)CHNoHeartRateDataViewControllerAccessibility;
  [(CHNoHeartRateDataViewControllerAccessibility *)&v3 loadView];
  [(CHNoHeartRateDataViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end