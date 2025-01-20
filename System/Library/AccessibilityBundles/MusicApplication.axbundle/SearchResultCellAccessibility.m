@interface SearchResultCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SearchResultCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.SearchResultCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.SearchResultCell", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.SearchResultCell", @"subtitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.SearchResultCell", @"additionalDescription", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.SearchResultCell", @"accessibilityIsExplicit", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(SearchResultCellAccessibility *)self safeValueForKey:@"title"];
  v4 = [(SearchResultCellAccessibility *)self safeValueForKey:@"subtitle"];
  v5 = [(SearchResultCellAccessibility *)self safeValueForKey:@"additionalDescription"];
  if ([(SearchResultCellAccessibility *)self safeBoolForKey:@"accessibilityIsExplicit"])
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

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SearchResultCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SearchResultCellAccessibility *)&v3 accessibilityTraits];
}

@end