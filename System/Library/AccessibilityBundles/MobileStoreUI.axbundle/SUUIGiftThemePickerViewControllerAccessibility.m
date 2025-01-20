@interface SUUIGiftThemePickerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
@end

@implementation SUUIGiftThemePickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIGiftThemePickerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIGiftThemePickerViewController", @"loadView", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIGiftThemePickerViewController", @"collectionView: cellForItemAtIndexPath:", "@", "@", "@", 0);
  [v3 validateClass:@"SUUIGiftThemePickerViewController" hasInstanceVariable:@"_pageControl" withType:"UIPageControl"];
  [v3 validateClass:@"SUUIGiftThemePickerViewController" hasInstanceVariable:@"_themes" withType:"NSArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIGiftTheme", @"themeName", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIGiftThemePickerViewControllerAccessibility;
  [(SUUIGiftThemePickerViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SUUIGiftThemePickerViewControllerAccessibility *)self safeValueForKey:@"_pageControl"];
  [v3 setAccessibilityIdentifier:@"GiftThemePageControl"];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)SUUIGiftThemePickerViewControllerAccessibility;
  [(SUUIGiftThemePickerViewControllerAccessibility *)&v3 loadView];
  [(SUUIGiftThemePickerViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SUUIGiftThemePickerViewControllerAccessibility;
  v8 = [(SUUIGiftThemePickerViewControllerAccessibility *)&v18 collectionView:v6 cellForItemAtIndexPath:v7];
  objc_opt_class();
  v9 = [(SUUIGiftThemePickerViewControllerAccessibility *)self safeValueForKey:@"_themes"];
  v10 = __UIAccessibilityCastAsClass();

  unint64_t v11 = [v7 item];
  if (v11 < [v10 count])
  {
    v12 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "item"));
    v13 = [v12 safeValueForKey:@"themeName"];
    v14 = [v13 stringByReplacingOccurrencesOfString:@" " withString:&stru_26F7296D0];

    v15 = [NSString stringWithFormat:@"gift.theme.%@", v14];
    v16 = accessibilityLocalizedString(v15);
    [v8 setAccessibilityLabel:v16];
  }

  return v8;
}

@end