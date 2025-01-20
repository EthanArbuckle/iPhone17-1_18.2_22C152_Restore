@interface PKTextInputHandwritingShotAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_shouldTargetFirstResponderElement:(id)a3 strokeIdentifiers:(id)a4;
@end

@implementation PKTextInputHandwritingShotAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKTextInputHandwritingShot";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)_shouldTargetFirstResponderElement:(id)a3 strokeIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    BOOL v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PKTextInputHandwritingShotAccessibility;
    BOOL v8 = [(PKTextInputHandwritingShotAccessibility *)&v10 _shouldTargetFirstResponderElement:v6 strokeIdentifiers:v7];
  }

  return v8;
}

@end