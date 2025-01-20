@interface DOCTagEditorTagCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation DOCTagEditorTagCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DOCTagEditorTagCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"DOCTagEditorTagCell" hasInstanceVariable:@"_tagView" withType:"DOCLargeTagView"];
  [v3 validateClass:@"DOCTagEditorTagCell" hasInstanceVariable:@"_mixedSelection" withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DOCLargeTagView", @"tagNameLabel", "@", 0);
  [v3 validateClass:@"DOCTagEditorTagCell" isKindOfClass:@"UICollectionViewCell"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(DOCTagEditorTagCellAccessibility *)self safeValueForKey:@"_tagView"];
  id v3 = [v2 safeValueForKey:@"tagNameLabel"];
  v4 = [v3 accessibilityLabel];

  return v4;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  int v3 = [(DOCTagEditorTagCellAccessibility *)self safeBoolForKey:@"isSelected"];
  uint64_t v4 = *MEMORY[0x263F1CF38];
  if (!v3) {
    uint64_t v4 = 0;
  }
  return v4 | v2;
}

- (id)accessibilityValue
{
  if ([(DOCTagEditorTagCellAccessibility *)self safeBoolForKey:@"_mixedSelection"])
  {
    uint64_t v2 = accessibilityLocalizedString(@"mixed.selected");
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

@end