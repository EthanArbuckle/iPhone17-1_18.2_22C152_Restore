@interface DOCTagEditorTextFieldCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation DOCTagEditorTextFieldCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DOCTagEditorTextFieldCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DOCTagEditorTextFieldCell", @"addTagView", "@", 0);
  [v3 validateClass:@"DOCAddTagView" hasInstanceVariable:@"_addNewTagLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  v2 = [(DOCTagEditorTextFieldCellAccessibility *)self safeValueForKey:@"addTagView"];
  id v3 = [v2 safeUIViewForKey:@"_addNewTagLabel"];
  char v4 = [v3 _accessibilityViewIsVisible];

  return v4;
}

- (id)accessibilityLabel
{
  v2 = [(DOCTagEditorTextFieldCellAccessibility *)self safeValueForKey:@"addTagView"];
  id v3 = [v2 safeValueForKey:@"_addNewTagLabel"];
  char v4 = [v3 accessibilityLabel];

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end