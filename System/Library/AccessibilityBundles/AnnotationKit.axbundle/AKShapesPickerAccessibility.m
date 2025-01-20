@interface AKShapesPickerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setShapes:(id)a3;
@end

@implementation AKShapesPickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AKShapesPicker";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKShapesPicker", @"setShapes:", "v", "@", 0);
  [v3 validateClass:@"AKShapesPicker" isKindOfClass:@"AKModernToolbarPicker"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKModernToolbarPicker", @"stackview", "@", 0);
}

- (void)setShapes:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AKShapesPickerAccessibility;
  [(AKShapesPickerAccessibility *)&v4 setShapes:a3];
  [(AKShapesPickerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)AKShapesPickerAccessibility;
  [(AKShapesPickerAccessibility *)&v16 _accessibilityLoadAccessibilityInformation];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(AKShapesPickerAccessibility *)self safeUIViewForKey:@"stackview", 0];
  objc_super v4 = [v3 subviews];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        unint64_t v10 = [v9 tag] - 764000;
        if (v10 <= 7 && ((0xA5u >> v10) & 1) != 0)
        {
          v11 = accessibilityLocalizedString(off_265104078[v10]);
          [v9 setAccessibilityLabel:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v6);
  }
}

@end