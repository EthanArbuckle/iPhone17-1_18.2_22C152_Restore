@interface TVShowEpisodeCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityTVShowEpisodeCellElements;
- (id)accessibilityElements;
- (void)_setAccessibilityTVShowEpisodeCellElements:(id)a3;
- (void)layoutSubviews;
@end

@implementation TVShowEpisodeCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.TVShowEpisodeCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityTVShowEpisodeCellElements
{
}

- (void)_setAccessibilityTVShowEpisodeCellElements:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.TVShowEpisodeCell", @"accessibilityHeaderLockupView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.TVShowEpisodeCell", @"accessibilityHeadlineTextStackView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.TVShowEpisodeCell", @"accessibilityTextStackView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.TVShowEpisodeCell", @"accessibilityDescriptionTextStackView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.TVShowEpisodeCell", @"accessibilityChevronImageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.TVShowEpisodeCell", @"layoutSubviews", "v", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  id v3 = [(TVShowEpisodeCellAccessibility *)self _accessibilityTVShowEpisodeCellElements];
  if (!v3)
  {
    id v3 = [MEMORY[0x263EFF980] array];
    v4 = [(TVShowEpisodeCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"headline, title"];
    objc_opt_class();
    v5 = [(TVShowEpisodeCellAccessibility *)self safeValueForKey:@"accessibilityHeaderLockupView"];
    v6 = __UIAccessibilityCastAsSafeCategory();

    [v6 _accessibilitySetVideoLabel:v4];
    [v3 axSafelyAddObject:v6];
    v7 = (void *)MEMORY[0x263EFF8C0];
    v8 = [(TVShowEpisodeCellAccessibility *)self safeValueForKey:@"accessibilityHeadlineTextStackView"];
    v9 = [(TVShowEpisodeCellAccessibility *)self safeValueForKey:@"accessibilityTextStackView"];
    v10 = [(TVShowEpisodeCellAccessibility *)self safeValueForKey:@"accessibilityDescriptionTextStackView"];
    v11 = [(TVShowEpisodeCellAccessibility *)self safeValueForKey:@"accessibilityChevronImageView"];
    v12 = objc_msgSend(v7, "axArrayByIgnoringNilElementsWithCount:", 4, v8, v9, v10, v11);

    v13 = (void *)[objc_alloc(MEMORY[0x263F81178]) initWithAccessibilityContainer:self representedElements:v12];
    v14 = [(TVShowEpisodeCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"headline, title, descriptionText"];
    [v13 setAccessibilityLabel:v14];
    [v3 axSafelyAddObject:v13];
    [(TVShowEpisodeCellAccessibility *)self _setAccessibilityTVShowEpisodeCellElements:v3];
  }

  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TVShowEpisodeCellAccessibility;
  [(TVShowEpisodeCellAccessibility *)&v3 layoutSubviews];
  [(TVShowEpisodeCellAccessibility *)self _setAccessibilityTVShowEpisodeCellElements:0];
}

@end