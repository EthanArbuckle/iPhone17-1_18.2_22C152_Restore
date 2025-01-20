@interface UITextEffectsWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityCanBeConsideredAsMainWindow;
- (BOOL)_axHasModalView;
- (BOOL)accessibilityViewIsModal;
- (CGRect)_axConvertRect:(CGRect)a3 toWindow:(id)a4;
- (UITextEffectsWindowAccessibility)initWithFrame:(CGRect)a3;
@end

@implementation UITextEffectsWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITextEffectsWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UITextEffectsWindow", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_storeStrong(v4, obj);
}

- (UITextEffectsWindowAccessibility)initWithFrame:(CGRect)a3
{
  CGRect v11 = a3;
  SEL v9 = a2;
  v10 = 0;
  v8.receiver = self;
  v8.super_class = (Class)UITextEffectsWindowAccessibility;
  v10 = -[UITextEffectsWindowAccessibility initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    char v7 = 0;
    objc_opt_class();
    id v6 = (id)__UIAccessibilityCastAsSafeCategory();
    id v5 = v6;
    objc_storeStrong(&v6, 0);
    -[UIWindowAccessibility _axListenForRemoteElement](v5);
  }
  v4 = v10;
  objc_storeStrong((id *)&v10, 0);
  return v4;
}

- (BOOL)_accessibilityCanBeConsideredAsMainWindow
{
  return [(UITextEffectsWindowAccessibility *)self _axHasModalView];
}

- (BOOL)accessibilityViewIsModal
{
  return [(UITextEffectsWindowAccessibility *)self _axHasModalView];
}

- (BOOL)_axHasModalView
{
  id v4 = (id)[(UITextEffectsWindowAccessibility *)self subviews];
  id v3 = (id)objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_44);
  BOOL v5 = [v3 count] != 0;

  return v5;
}

uint64_t __51__UITextEffectsWindowAccessibility__axHasModalView__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v3 = [location[0] accessibilityViewIsModal];
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (CGRect)_axConvertRect:(CGRect)a3 toWindow:(id)a4
{
  CGRect v14 = a3;
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  if ([(UITextEffectsWindowAccessibility *)v13 safeBoolForKey:@"_isHostedInAnotherProcess"]) {
    -[UITextEffectsWindowAccessibility convertRect:toWindow:](v13, "convertRect:toWindow:", v13, v14.origin.x, v14.origin.y, v14.size.width, v14.size.height);
  }
  else {
    -[UITextEffectsWindowAccessibility convertRect:toWindow:](v13, "convertRect:toWindow:", 0, v14.origin.x, v14.origin.y, v14.size.width, v14.size.height);
  }
  double v15 = v4;
  double v16 = v5;
  double v17 = v6;
  double v18 = v7;
  objc_storeStrong(location, 0);
  double v8 = v15;
  double v9 = v16;
  double v10 = v17;
  double v11 = v18;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

@end