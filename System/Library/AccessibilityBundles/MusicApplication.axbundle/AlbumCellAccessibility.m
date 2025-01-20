@interface AlbumCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (unint64_t)accessibilityTraits;
@end

@implementation AlbumCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.AlbumCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.AlbumCell", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.AlbumCell", @"artistName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.AlbumCell", @"accessibilityIsExplicit", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.AlbumCell", @"accessibilityRankString", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(AlbumCellAccessibility *)self safeValueForKey:@"accessibilityRankString"];
  v4 = [(AlbumCellAccessibility *)self safeValueForKey:@"title"];
  v5 = [(AlbumCellAccessibility *)self safeValueForKey:@"artistName"];
  if ([(AlbumCellAccessibility *)self safeBoolForKey:@"accessibilityIsExplicit"])
  {
    v8 = accessibilityMusicLocalizedString(@"explicit");
    v6 = __UIAXStringForVariables();
  }
  else
  {
    v6 = __UIAXStringForVariables();
  }

  return v6;
}

- (id)accessibilityUserInputLabels
{
  id v3 = [(AlbumCellAccessibility *)self safeValueForKey:@"title"];
  v4 = [(AlbumCellAccessibility *)self safeValueForKey:@"artistName"];
  v5 = __UIAXStringForVariables();
  v6 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 3, v3, v4, v5);

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)AlbumCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(AlbumCellAccessibility *)&v3 accessibilityTraits];
}

@end