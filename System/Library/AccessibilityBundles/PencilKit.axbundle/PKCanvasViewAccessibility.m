@interface PKCanvasViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation PKCanvasViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKCanvasView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKCanvasView", @"drawing", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKDrawing", @"strokes", "@", 0);
}

- (id)accessibilityElements
{
  v2 = [(PKCanvasViewAccessibility *)self safeValueForKey:@"drawing"];
  id v3 = [v2 safeArrayForKey:@"strokes"];

  return v3;
}

@end