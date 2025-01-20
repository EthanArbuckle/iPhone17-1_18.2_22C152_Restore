@interface FeaturedMusicVideoVerticalCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation FeaturedMusicVideoVerticalCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.FeaturedMusicVideoVerticalCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.FeaturedMusicVideoVerticalCell", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.FeaturedMusicVideoVerticalCell", @"artistName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.FeaturedMusicVideoVerticalCell", @"accessibilityDateReleasedText", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(FeaturedMusicVideoVerticalCellAccessibility *)self safeValueForKey:@"title"];
  v4 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v5 = [(FeaturedMusicVideoVerticalCellAccessibility *)self safeValueForKey:@"artistName"];
  v6 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v7 = [(FeaturedMusicVideoVerticalCellAccessibility *)self safeValueForKey:@"accessibilityDateReleasedText"];
  v8 = __UIAccessibilityCastAsClass();

  v9 = __UIAXStringForVariables();

  return v9;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)FeaturedMusicVideoVerticalCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(FeaturedMusicVideoVerticalCellAccessibility *)&v3 accessibilityTraits];
}

@end