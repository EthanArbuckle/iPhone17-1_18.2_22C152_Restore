@interface PosterCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityScrollParentForComparingByXAxis;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PosterCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.PosterCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.PosterCell", @"accessibilityTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.PosterCell", @"accessibilitySubtitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.PosterCell", @"accessibilityDescriptionText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.PosterCell", @"accessibilityAltText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.PosterCell", @"overlayTitleText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.PosterCell", @"materialImage", "@", 0);
  [v3 validateClass:@"MusicCoreUI.SymbolButton"];
  [v3 validateClass:@"MusicApplication.PosterCell" hasSwiftField:@"isTitleChevronEnabled" withSwiftType:"Optional<Bool>"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(PosterCellAccessibility *)self _accessibilityDescendantOfType:MEMORY[0x2456584B0](@"MusicCoreUI.SymbolButton", a2)];
  if ([(PosterCellAccessibility *)self safeSwiftBoolForKey:@"isTitleChevronEnabled"])
  {
    accessibilityMusicLocalizedString(@"right.arrow.circle");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_26F7488C8;
  }
  v5 = [v3 accessibilityLabel];
  v6 = [(PosterCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"overlayTitleText, accessibilityAltText, accessibilityTitle"];
  v9 = [(PosterCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilitySubtitle, accessibilityDescriptionText"];
  v7 = __UIAXStringForVariables();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PosterCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(PosterCellAccessibility *)&v3 accessibilityTraits];
}

- (id)_accessibilityScrollParentForComparingByXAxis
{
  uint64_t v3 = objc_opt_class();

  return (id)[(PosterCellAccessibility *)self _accessibilityAncestorIsKindOf:v3];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  char v6 = 0;
  objc_opt_class();
  uint64_t v3 = [(PosterCellAccessibility *)self safeValueForKey:@"materialImage"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 setIsAccessibilityElement:0];
  v5.receiver = self;
  v5.super_class = (Class)PosterCellAccessibility;
  [(PosterCellAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
}

@end