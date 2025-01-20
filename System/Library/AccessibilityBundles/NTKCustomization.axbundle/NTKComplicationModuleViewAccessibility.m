@interface NTKComplicationModuleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
@end

@implementation NTKComplicationModuleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKComplicationModuleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKComplicationModuleView", @"isXL", "B", 0);
  [v3 validateClass:@"NTKEmptyModuleView"];
}

- (BOOL)isAccessibilityElement
{
  BOOL result = 1;
  if ([(NTKComplicationModuleViewAccessibility *)self safeBoolForKey:@"isXL"])
  {
    AXSafeClassFromString();
    if (objc_opt_isKindOfClass()) {
      return 0;
    }
  }
  return result;
}

@end