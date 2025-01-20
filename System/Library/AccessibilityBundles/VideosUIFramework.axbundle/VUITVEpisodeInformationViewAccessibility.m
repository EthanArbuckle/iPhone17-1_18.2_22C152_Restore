@interface VUITVEpisodeInformationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation VUITVEpisodeInformationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUITVEpisodeInformationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUITVEpisodeInformationView", @"episodeLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUITVEpisodeInformationView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUITVEpisodeInformationView", @"descriptionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUITVEpisodeInformationView", @"metadataView", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(VUITVEpisodeInformationViewAccessibility *)self safeValueForKey:@"episodeLabel"];
  v4 = [(VUITVEpisodeInformationViewAccessibility *)self safeValueForKey:@"titleLabel"];
  v5 = [(VUITVEpisodeInformationViewAccessibility *)self safeValueForKey:@"descriptionLabel"];
  v6 = [(VUITVEpisodeInformationViewAccessibility *)self safeValueForKey:@"metadataView"];
  v7 = [v3 accessibilityLabel];
  v8 = [v4 accessibilityLabel];
  v9 = [v5 accessibilityLabel];
  v12 = [v6 accessibilityLabel];
  v10 = __UIAXStringForVariables();

  return v10;
}

@end