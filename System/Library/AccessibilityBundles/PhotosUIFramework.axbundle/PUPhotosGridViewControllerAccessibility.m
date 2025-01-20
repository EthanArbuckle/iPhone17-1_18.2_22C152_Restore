@interface PUPhotosGridViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axShouldMoveFocusToNavigationButton;
- (void)_axSetShouldMoveFocusToNavigationButton:(BOOL)a3;
- (void)_configureAddPlaceholderCell:(id)a3 animated:(BOOL)a4;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)updateNavigationBarAnimated:(BOOL)a3;
@end

@implementation PUPhotosGridViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUPhotosGridViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axShouldMoveFocusToNavigationButton
{
  return MEMORY[0x270F09620](self, &__PUPhotosGridViewControllerAccessibility___axShouldMoveFocusToNavigationButton);
}

- (void)_axSetShouldMoveFocusToNavigationButton:(BOOL)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotosGridViewController", @"_configureAddPlaceholderCell: animated:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotosGridViewController", @"updateNavigationBarAnimated:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotosGridViewController", @"setEditing: animated:", "v", "B", "B", 0);
}

- (void)_configureAddPlaceholderCell:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)PUPhotosGridViewControllerAccessibility;
  id v5 = a3;
  [(PUPhotosGridViewControllerAccessibility *)&v6 _configureAddPlaceholderCell:v5 animated:v4];
  objc_msgSend(v5, "setAccessibilityIdentifier:", @"AddPhotoPlaceholder", v6.receiver, v6.super_class);
}

- (void)updateNavigationBarAnimated:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUPhotosGridViewControllerAccessibility;
  [(PUPhotosGridViewControllerAccessibility *)&v6 updateNavigationBarAnimated:a3];
  if ([(PUPhotosGridViewControllerAccessibility *)self _axShouldMoveFocusToNavigationButton])
  {
    BOOL v4 = [(PUPhotosGridViewControllerAccessibility *)self safeValueForKey:@"navigationItem"];
    id v5 = [v4 safeValueForKey:@"rightBarButtonItem"];
  }
  else
  {
    id v5 = 0;
  }
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v5);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(PUPhotosGridViewControllerAccessibility *)self isEditing] != a3 && v4) {
    [(PUPhotosGridViewControllerAccessibility *)self _axSetShouldMoveFocusToNavigationButton:1];
  }
  v7.receiver = self;
  v7.super_class = (Class)PUPhotosGridViewControllerAccessibility;
  [(PUPhotosGridViewControllerAccessibility *)&v7 setEditing:v5 animated:v4];
  [(PUPhotosGridViewControllerAccessibility *)self _axSetShouldMoveFocusToNavigationButton:0];
}

@end