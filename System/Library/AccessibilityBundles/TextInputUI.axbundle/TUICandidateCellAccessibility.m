@interface TUICandidateCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axCellIsVisibleInCollectionView;
- (BOOL)accessibilityElementsHidden;
- (BOOL)isAccessibilityElement;
- (id)_axCandidateText;
- (id)accessibilityHeaderElements;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)accessibilityHeaderElements;
@end

@implementation TUICandidateCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TUICandidateCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TUICandidateGroupHeader"];
  [v3 validateClass:@"TUICandidateCell" isKindOfClass:@"UICollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TUICandidateCell", @"candidate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionViewCell", @"_accessibilityIndexPath", "@", 0);
  [v3 validateClass:@"UIKeyboardCandidateController"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"UIKeyboardCandidateController", @"sharedInstance", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyboardCandidateController", @"isExtended", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityElementsHidden
{
  v2 = [(TUICandidateCellAccessibility *)self _axCandidateText];
  BOOL v3 = [v2 length] == 0;

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF08] | *MEMORY[0x263F1CEE8] | *MEMORY[0x263F811F8];
}

- (id)_axCandidateText
{
  objc_opt_class();
  BOOL v3 = [(TUICandidateCellAccessibility *)self safeValueForKey:@"candidate"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 label];

  return v5;
}

- (id)accessibilityLabel
{
  BOOL v3 = [MEMORY[0x263F1C748] sharedInputModeController];
  v4 = [v3 currentInputMode];
  v5 = [v4 primaryLanguage];

  v6 = [(TUICandidateCellAccessibility *)self _axCandidateText];
  v7 = [MEMORY[0x263F228D0] sharedInstance];
  v11 = [v7 descriptionOfWord:v6 forLanguage:v5];
  v8 = __UIAXStringForVariables();

  if (!objc_msgSend(v8, "length", v11, @"__AXStringForVariablesSentinel"))
  {
    id v9 = v6;

    v8 = v9;
  }

  return v8;
}

- (id)accessibilityHeaderElements
{
  v11[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(TUICandidateCellAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  objc_opt_class();
  v4 = [(TUICandidateCellAccessibility *)self safeValueForKey:@"_accessibilityIndexPath"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", 0, objc_msgSend(v5, "section"));
  v7 = [v3 supplementaryViewForElementKind:@"GroupHeader" atIndexPath:v6];
  if (v7)
  {
    MEMORY[0x245666FF0](@"TUICandidateGroupHeader");
    if (objc_opt_isKindOfClass())
    {
      v11[0] = v7;
      v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
      goto LABEL_8;
    }
    id v9 = AXLogAppAccessibility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(TUICandidateCellAccessibility *)(uint64_t)v7 accessibilityHeaderElements];
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (BOOL)_axCellIsVisibleInCollectionView
{
  BOOL v3 = objc_msgSend((id)MEMORY[0x245666FF0](@"UIKeyboardCandidateController", a2), "safeValueForKey:", @"sharedInstance");
  char v4 = [v3 safeBoolForKey:@"isExtended"];

  if (v4) {
    return 1;
  }
  v6 = [(TUICandidateCellAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  objc_opt_class();
  v7 = [(TUICandidateCellAccessibility *)self safeValueForKey:@"_accessibilityIndexPath"];
  v8 = __UIAccessibilityCastAsClass();

  id v9 = [v6 layoutAttributesForItemAtIndexPath:v8];
  [v9 frame];
  double v11 = v10;
  [v9 frame];
  BOOL v5 = v11 < v12;

  return v5;
}

- (void)accessibilityHeaderElements
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_242667000, a2, OS_LOG_TYPE_ERROR, "Unexpected class for candidate group header: %@", (uint8_t *)&v2, 0xCu);
}

@end