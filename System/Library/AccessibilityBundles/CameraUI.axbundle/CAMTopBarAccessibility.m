@interface CAMTopBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityOnlyComparesByXAxis;
- (BOOL)shouldGroupAccessibilityChildren;
- (void)collapseMenuButton:(id)a3 animated:(BOOL)a4;
- (void)expandMenuButton:(id)a3 animated:(BOOL)a4;
@end

@implementation CAMTopBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMTopBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

- (void)expandMenuButton:(id)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CAMTopBarAccessibility;
  [(CAMTopBarAccessibility *)&v4 expandMenuButton:a3 animated:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)collapseMenuButton:(id)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CAMTopBarAccessibility;
  [(CAMTopBarAccessibility *)&v4 collapseMenuButton:a3 animated:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end