@interface FeaturedRadioShowCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation FeaturedRadioShowCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.FeaturedRadioShowCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.FeaturedRadioShowCell", @"headline", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.FeaturedRadioShowCell", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.FeaturedRadioShowCell", @"subtitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.FeaturedRadioShowCell", @"accessibilityIsExplicit", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  if ([(FeaturedRadioShowCellAccessibility *)self safeBoolForKey:@"accessibilityIsExplicit"])
  {
    id v3 = accessibilityMusicLocalizedString(@"explicit");
  }
  else
  {
    id v3 = 0;
  }
  v4 = [(FeaturedRadioShowCellAccessibility *)self safeValueForKey:@"headline"];
  v5 = [(FeaturedRadioShowCellAccessibility *)self safeValueForKey:@"title"];
  v8 = [(FeaturedRadioShowCellAccessibility *)self safeValueForKey:@"subtitle"];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)FeaturedRadioShowCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(FeaturedRadioShowCellAccessibility *)&v3 accessibilityTraits];
}

@end