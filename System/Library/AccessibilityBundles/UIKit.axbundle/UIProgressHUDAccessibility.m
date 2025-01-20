@interface UIProgressHUDAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityBlocksInteraction;
- (BOOL)accessibilityViewIsModal;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (void)showInView:(id)a3;
@end

@implementation UIProgressHUDAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIProgressHUD";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilityBlocksInteraction
{
  v11 = self;
  SEL v10 = a2;
  id v3 = (id)[(UIProgressHUDAccessibility *)self safeValueForKey:@"superview"];
  char v5 = 0;
  LOBYTE(v4) = 0;
  if (v3)
  {
    char v9 = 0;
    objc_opt_class();
    id v8 = (id)__UIAccessibilityCastAsClass();
    id v7 = v8;
    objc_storeStrong(&v8, 0);
    id v6 = v7;
    char v5 = 1;
    int v4 = [v7 isUserInteractionEnabled] ^ 1;
  }
  char v12 = v4 & 1;
  if (v5) {

  }
  return v12 & 1;
}

- (void)showInView:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIProgressHUDAccessibility;
  [(UIProgressHUDAccessibility *)&v5 showInView:location[0]];
  UIAccessibilityNotifications notification = *MEMORY[0x263F811F0];
  id v4 = [(UIProgressHUDAccessibility *)v7 accessibilityLabel];
  UIAccessibilityPostNotification(notification, v4);

  objc_storeStrong(location, 0);
}

- (id)accessibilityLabel
{
  id v3 = (id)[(UIProgressHUDAccessibility *)self safeValueForKey:@"_progressMessage"];
  id v4 = (id)[v3 accessibilityLabel];

  return v4;
}

@end