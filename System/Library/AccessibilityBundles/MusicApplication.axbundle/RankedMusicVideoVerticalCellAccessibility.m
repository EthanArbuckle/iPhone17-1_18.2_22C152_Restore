@interface RankedMusicVideoVerticalCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation RankedMusicVideoVerticalCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.RankedMusicVideoVerticalCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.RankedMusicVideoVerticalCell", @"accessibilityRankString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.RankedMusicVideoVerticalCell", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.RankedMusicVideoVerticalCell", @"artistName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.RankedMusicVideoVerticalCell", @"accessibilityIsExplicit", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  if ([(RankedMusicVideoVerticalCellAccessibility *)self safeBoolForKey:@"accessibilityIsExplicit"])
  {
    id v3 = accessibilityMusicLocalizedString(@"explicit");
  }
  else
  {
    id v3 = 0;
  }
  v4 = [(RankedMusicVideoVerticalCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityRankString, title, artistName"];
  v5 = __UIAXStringForVariables();

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)RankedMusicVideoVerticalCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(RankedMusicVideoVerticalCellAccessibility *)&v3 accessibilityTraits];
}

@end