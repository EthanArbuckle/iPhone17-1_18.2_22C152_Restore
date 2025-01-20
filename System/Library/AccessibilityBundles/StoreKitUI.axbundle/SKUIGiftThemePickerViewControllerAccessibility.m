@interface SKUIGiftThemePickerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
@end

@implementation SKUIGiftThemePickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIGiftThemePickerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIGiftThemePickerViewController", @"loadView", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIGiftThemePickerViewController", @"collectionView: cellForItemAtIndexPath:", "@", "@", "@", 0);
  [v3 validateClass:@"SKUIGiftThemePickerViewController" hasInstanceVariable:@"_pageControl" withType:"UIPageControl"];
  [v3 validateClass:@"SKUIGiftThemePickerViewController" hasInstanceVariable:@"_themes" withType:"NSArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIGiftTheme", @"themeName", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIGiftThemePickerViewControllerAccessibility;
  [(SKUIGiftThemePickerViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SKUIGiftThemePickerViewControllerAccessibility *)self safeValueForKey:@"_pageControl"];
  [v3 setAccessibilityIdentifier:@"GiftThemePageControl"];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)SKUIGiftThemePickerViewControllerAccessibility;
  [(SKUIGiftThemePickerViewControllerAccessibility *)&v3 loadView];
  [(SKUIGiftThemePickerViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SKUIGiftThemePickerViewControllerAccessibility;
  v8 = [(SKUIGiftThemePickerViewControllerAccessibility *)&v18 collectionView:v6 cellForItemAtIndexPath:v7];
  objc_opt_class();
  v9 = [(SKUIGiftThemePickerViewControllerAccessibility *)self safeValueForKey:@"_themes"];
  v10 = __UIAccessibilityCastAsClass();

  unint64_t v11 = [v7 item];
  if (v11 < [v10 count])
  {
    v12 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "item"));
    v13 = [v12 safeValueForKey:@"themeName"];
    v14 = [v13 stringByReplacingOccurrencesOfString:@" " withString:&stru_26F441D68];

    v15 = [NSString stringWithFormat:@"gift.theme.%@", v14];
    v16 = accessibilitySKUILocalizedString(v15);
    [v8 setAccessibilityLabel:v16];
  }

  return v8;
}

@end