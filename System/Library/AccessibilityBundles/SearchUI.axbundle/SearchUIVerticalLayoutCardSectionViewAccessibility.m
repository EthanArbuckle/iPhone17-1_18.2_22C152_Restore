@interface SearchUIVerticalLayoutCardSectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axCellHasTextContent;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (id)_axFootnoteLabel;
- (id)_axTitleLabel;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SearchUIVerticalLayoutCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUIVerticalLayoutCardSectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIVerticalLayoutCardSectionView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIVerticalLayoutCardSectionView", @"footnoteLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIVerticalLayoutCardSectionView", @"thumbnailView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUITableViewCell", @"rowModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIRowModel", @"cardSection", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFVerticalLayoutCardSection", @"thumbnail", "@", 0);
  [v3 validateClass:@"SFPhotosLibraryImage"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  if ([(SearchUIVerticalLayoutCardSectionViewAccessibility *)self _axCellHasTextContent])
  {
    id v3 = [(SearchUIVerticalLayoutCardSectionViewAccessibility *)self _axTitleLabel];
    v6 = [(SearchUIVerticalLayoutCardSectionViewAccessibility *)self _axFootnoteLabel];
    v4 = __UIAXStringForVariables();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SearchUIVerticalLayoutCardSectionViewAccessibility;
    v4 = [(SearchUIVerticalLayoutCardSectionViewAccessibility *)&v7 accessibilityLabel];
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v13.receiver = self;
  v13.super_class = (Class)SearchUIVerticalLayoutCardSectionViewAccessibility;
  unint64_t v3 = [(SearchUIVerticalLayoutCardSectionViewAccessibility *)&v13 accessibilityTraits];
  v4 = [(SearchUIVerticalLayoutCardSectionViewAccessibility *)self safeValueForKey:@"rowModel"];
  v5 = [v4 safeValueForKey:@"cardSection"];
  v6 = [v5 safeValueForKey:@"thumbnail"];
  NSClassFromString(&cfstr_Sfphotoslibrar.isa);
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v8 = *MEMORY[0x263F1CF00] | v3;
  if (isKindOfClass) {
    v3 |= *MEMORY[0x263F1CF00];
  }
  BOOL v9 = [(SearchUIVerticalLayoutCardSectionViewAccessibility *)self _axCellHasTextContent];
  if (v6) {
    int v10 = v9;
  }
  else {
    int v10 = 1;
  }
  if (v10) {
    unint64_t v11 = v3;
  }
  else {
    unint64_t v11 = v8;
  }

  return v11;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

- (id)_axTitleLabel
{
  v2 = [(SearchUIVerticalLayoutCardSectionViewAccessibility *)self safeValueForKey:@"titleLabel"];
  unint64_t v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)_axFootnoteLabel
{
  v2 = [(SearchUIVerticalLayoutCardSectionViewAccessibility *)self safeValueForKey:@"footnoteLabel"];
  unint64_t v3 = [v2 accessibilityLabel];

  return v3;
}

- (BOOL)_axCellHasTextContent
{
  unint64_t v3 = [(SearchUIVerticalLayoutCardSectionViewAccessibility *)self _axTitleLabel];
  v4 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v5 = [v3 stringByTrimmingCharactersInSet:v4];
  uint64_t v6 = [v5 length];

  objc_super v7 = [(SearchUIVerticalLayoutCardSectionViewAccessibility *)self _axFootnoteLabel];
  unint64_t v8 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  BOOL v9 = [v7 stringByTrimmingCharactersInSet:v8];
  uint64_t v10 = v6 | [v9 length];

  return v10 != 0;
}

@end