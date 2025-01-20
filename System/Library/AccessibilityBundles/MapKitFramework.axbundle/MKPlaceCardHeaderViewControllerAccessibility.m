@interface MKPlaceCardHeaderViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_setupDatas;
- (void)_updateDirectionsButton;
@end

@implementation MKPlaceCardHeaderViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKPlaceCardHeaderViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKPlaceCardHeaderViewController", @"_setupDatas", "v", 0);
  [v3 validateClass:@"MKPlaceCardHeaderViewController" hasInstanceVariable:@"_placeItem" withType:"<_MKPlaceItem>"];
  [v3 validateClass:@"MKPlaceCardHeaderViewController" hasInstanceVariable:@"_priceToken" withType:"_MKTokenAttributedString"];
  [v3 validateProtocol:@"_MKPlaceItem" hasRequiredInstanceMethod:@"mapItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_MKTokenAttributedString", @"string", "@", 0);
}

- (void)_updateDirectionsButton
{
  v8.receiver = self;
  v8.super_class = (Class)MKPlaceCardHeaderViewControllerAccessibility;
  [(MKPlaceCardHeaderViewControllerAccessibility *)&v8 _updateDirectionsButton];
  objc_opt_class();
  id v3 = [(MKPlaceCardHeaderViewControllerAccessibility *)self safeValueForKey:@"_primaryButton"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 currentAttributedTitle];
  v6 = [v5 string];
  v7 = [v6 stringByReplacingOccurrencesOfString:@"\n" withString:@","];
  [v4 setAccessibilityLabel:v7];
}

- (void)_setupDatas
{
  v7.receiver = self;
  v7.super_class = (Class)MKPlaceCardHeaderViewControllerAccessibility;
  [(MKPlaceCardHeaderViewControllerAccessibility *)&v7 _setupDatas];
  id v3 = [(MKPlaceCardHeaderViewControllerAccessibility *)self safeValueForKey:@"_priceToken"];
  v4 = __UIAccessibilitySafeClass();

  v5 = [v4 safeValueForKey:@"string"];
  v6 = UIAXPriceRangeDescription();
  [v5 setAccessibilityLabel:v6];
}

@end