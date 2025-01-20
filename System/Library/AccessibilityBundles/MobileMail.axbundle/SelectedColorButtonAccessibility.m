@interface SelectedColorButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)buttonWithType:(int64_t)a3 radius:(double)a4 color:(id)a5;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation SelectedColorButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SelectedColorButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

+ (id)buttonWithType:(int64_t)a3 radius:(double)a4 color:(id)a5
{
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___SelectedColorButtonAccessibility;
  id v7 = a5;
  v8 = objc_msgSendSuper2(&v11, sel_buttonWithType_radius_color_, a3, v7, a4);
  v9 = accessibilityLabelForFlagColor(v7);

  objc_msgSend(v8, "setAccessibilityLabel:", v9, v11.receiver, v11.super_class);

  return v8;
}

@end