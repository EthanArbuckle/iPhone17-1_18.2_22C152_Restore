@interface LiveRadioCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
@end

@implementation LiveRadioCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.LiveRadioCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.LiveRadioCell", @"accessibilityHeaderTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.LiveRadioCell", @"accessibilityHeaderSubtitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.LiveRadioCell", @"accessibilityHeadline", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.LiveRadioCell", @"accessibilityTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.LiveRadioCell", @"accessibilitySubtitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.LiveRadioCell", @"accessibilityAccessoryButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.LiveRadioCell", @"accessibilityAccessoryCalendarButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.FeaturedMaterialCell", @"accessibilityPlayButton", "@", 0);
  [v3 validateClass:@"MusicApplication.LiveRadioCell" isKindOfClass:@"MusicApplication.FeaturedMaterialCell"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(LiveRadioCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityHeaderTitle, accessibilityHeaderSubtitle, accessibilityHeadline, accessibilityTitle, accessibilitySubtitle"];
  id v3 = accessibilityStripUnfavorableCharacters(v2);

  return v3;
}

- (id)accessibilityUserInputLabels
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = [(LiveRadioCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityTitle"];
  v4 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3 = [MEMORY[0x263EFF980] array];
  v9.receiver = self;
  v9.super_class = (Class)LiveRadioCellAccessibility;
  v4 = [(LiveRadioCellAccessibility *)&v9 _accessibilitySupplementaryFooterViews];
  [v3 axSafelyAddObjectsFromArray:v4];

  v5 = [(LiveRadioCellAccessibility *)self safeValueForKey:@"accessibilityAccessoryButton"];
  if ([v5 _accessibilityViewIsVisible]) {
    [v3 axSafelyAddObject:v5];
  }
  v6 = [(LiveRadioCellAccessibility *)self safeValueForKey:@"accessibilityAccessoryCalendarButton"];
  [v6 _setAccessibilityLabelBlock:&__block_literal_global_3];
  if ([v6 _accessibilityViewIsVisible]) {
    [v3 axSafelyAddObject:v6];
  }
  v7 = [(LiveRadioCellAccessibility *)self safeValueForKey:@"accessibilityPlayButton"];
  [v3 axSafelyAddObject:v7];

  return v3;
}

id __68__LiveRadioCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke()
{
  return accessibilityMusicLocalizedString(@"schedule.calendar");
}

@end