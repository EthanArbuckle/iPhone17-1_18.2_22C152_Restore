@interface TVShowEpisodeDetailViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation TVShowEpisodeDetailViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.TVShowEpisodeDetailView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  char v7 = 0;
  objc_opt_class();
  v3 = [(TVShowEpisodeDetailViewAccessibility *)self safeValueForKey:@"accessibilityContextualActionsButton"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = accessibilityMusicLocalizedString(@"more.button");
  [v4 setAccessibilityLabel:v5];

  v6.receiver = self;
  v6.super_class = (Class)TVShowEpisodeDetailViewAccessibility;
  [(TVShowEpisodeDetailViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TVShowEpisodeDetailViewAccessibility;
  [(TVShowEpisodeDetailViewAccessibility *)&v3 layoutSubviews];
  [(TVShowEpisodeDetailViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end