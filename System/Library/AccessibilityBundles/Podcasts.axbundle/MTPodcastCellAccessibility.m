@interface MTPodcastCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MTPodcastCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTPodcastCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTGenericCell", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTGenericCell", @"subtitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTPodcastCell", @"countView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTCountChevronView", @"count", "@", 0);
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(MTPodcastCellAccessibility *)self safeValueForKey:@"title"];
  v4 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v5 = [(MTPodcastCellAccessibility *)self safeValueForKey:@"subtitle"];
  v6 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v7 = [(MTPodcastCellAccessibility *)self safeValueForKey:@"countView"];
  v8 = [v7 safeValueForKey:@"count"];
  v9 = __UIAccessibilityCastAsClass();

  uint64_t v10 = [v9 integerValue];
  if (v10 < 0)
  {
    v13 = accessibilityLocalizedString(@"needs.attention");
  }
  else
  {
    v11 = NSString;
    v12 = accessibilityLocalizedString(@"unplayed.episode.count");
    v13 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);
  }
  v14 = __UIAXStringForVariables();

  return v14;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)MTPodcastCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(MTPodcastCellAccessibility *)&v3 accessibilityTraits];
}

@end