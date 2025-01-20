@interface RadioStationCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (unint64_t)accessibilityTraits;
@end

@implementation RadioStationCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.RadioStationCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.RadioStationCell", @"supertitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.RadioStationCell", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.RadioStationCell", @"stationDescription", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.RadioStationCell", @"accessibilityIsExplicit", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(RadioStationCellAccessibility *)self safeValueForKey:@"supertitle"];
  v4 = [(RadioStationCellAccessibility *)self safeValueForKey:@"title"];
  v5 = [(RadioStationCellAccessibility *)self safeValueForKey:@"stationDescription"];
  if ([(RadioStationCellAccessibility *)self safeBoolForKey:@"accessibilityIsExplicit"])
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
  id v3 = [(RadioStationCellAccessibility *)self safeStringForKey:@"supertitle"];
  v4 = [(RadioStationCellAccessibility *)self safeStringForKey:@"title"];
  v5 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 2, v4, v3);

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)RadioStationCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(RadioStationCellAccessibility *)&v3 accessibilityTraits];
}

@end