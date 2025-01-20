@interface PHHandsetDialerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setDeleteButtonAlpha:(double)a3;
@end

@implementation PHHandsetDialerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHHandsetDialerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)setDeleteButtonAlpha:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PHHandsetDialerViewAccessibility;
  [(PHHandsetDialerViewAccessibility *)&v3 setDeleteButtonAlpha:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end