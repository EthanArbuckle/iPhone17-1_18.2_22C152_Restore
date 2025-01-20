@interface DOMNodeAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)handleKeyWebEvent:(id)a3;
@end

@implementation DOMNodeAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DOMNode";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)handleKeyWebEvent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DOMNodeAccessibility;
  id v3 = a3;
  [(DOMNodeAccessibility *)&v4 handleKeyWebEvent:v3];
  sendNotificationAfterHandlingWebKeyEventIfNeeded(v3);
}

@end