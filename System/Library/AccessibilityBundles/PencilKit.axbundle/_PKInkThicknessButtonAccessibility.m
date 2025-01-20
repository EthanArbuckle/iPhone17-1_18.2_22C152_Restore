@interface _PKInkThicknessButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axPKPaletteErasingAttributesView;
- (id)accessibilityLabel;
@end

@implementation _PKInkThicknessButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_PKInkThicknessButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKPaletteErasingAttributesView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaletteErasingAttributesView", @"eraserType", "q", 0);
}

- (BOOL)isAccessibilityElement
{
  v2 = [(_PKInkThicknessButtonAccessibility *)self _axPKPaletteErasingAttributesView];
  BOOL v3 = [v2 safeIntegerForKey:@"eraserType"] == 0;

  return v3;
}

- (id)accessibilityLabel
{
  return accessibilityPencilKitLocalizedString(@"tool.weight");
}

- (id)_axPKPaletteErasingAttributesView
{
  uint64_t v3 = MEMORY[0x24565AD00](@"PKPaletteErasingAttributesView", a2);

  return (id)[(_PKInkThicknessButtonAccessibility *)self _accessibilityAncestorIsKindOf:v3];
}

@end