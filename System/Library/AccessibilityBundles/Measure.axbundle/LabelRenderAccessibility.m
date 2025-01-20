@interface LabelRenderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)selectAnimationComplete;
@end

@implementation LabelRenderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Measure.LabelRender";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"Measure.SpatialGenericPlatter"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.LabelRender", @"selectAnimationComplete", "v", 0);
}

- (void)selectAnimationComplete
{
  v3.receiver = self;
  v3.super_class = (Class)LabelRenderAccessibility;
  [(LabelRenderAccessibility *)&v3 selectAnimationComplete];
  uint64_t v2 = MEMORY[0x245653970](@"Measure.SpatialGenericPlatter");
  AXMeasureDidPotentiallyShowCardViewWithAncestorClass(v2);
}

@end