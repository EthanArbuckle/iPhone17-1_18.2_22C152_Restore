@interface TPSimpleNumberPadAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_updateDeleteButton;
@end

@implementation TPSimpleNumberPadAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TPSimpleNumberPad";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_updateDeleteButton
{
  v2.receiver = self;
  v2.super_class = (Class)TPSimpleNumberPadAccessibility;
  [(TPSimpleNumberPadAccessibility *)&v2 _updateDeleteButton];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end