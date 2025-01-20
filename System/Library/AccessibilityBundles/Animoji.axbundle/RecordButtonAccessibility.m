@interface RecordButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
@end

@implementation RecordButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"RecordButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"RecordButton" isKindOfClass:@"UIControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIControl", @"enabled", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return [(RecordButtonAccessibility *)self safeBoolForKey:@"enabled"];
}

@end