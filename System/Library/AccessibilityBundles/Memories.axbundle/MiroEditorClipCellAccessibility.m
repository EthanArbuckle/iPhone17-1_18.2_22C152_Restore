@interface MiroEditorClipCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axMediaAsset;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation MiroEditorClipCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MiroEditorClipCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MiroEditorClipCell", @"clipProvider", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMClipProvider", @"phAsset", "@", 0);
}

- (id)_axMediaAsset
{
  objc_opt_class();
  id v3 = [(MiroEditorClipCellAccessibility *)self safeValueForKeyPath:@"clipProvider.phAsset"];
  v4 = __UIAccessibilityCastAsClass();

  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(MiroEditorClipCellAccessibility *)self _axMediaAsset];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(MiroEditorClipCellAccessibility *)self _axMediaAsset];
  id v3 = [v2 accessibilityValue];

  return v3;
}

@end