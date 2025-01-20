@interface FeaturedPlaylistCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation FeaturedPlaylistCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.FeaturedPlaylistCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.FeaturedPlaylistCell", @"name", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.FeaturedPlaylistCell", @"descriptionText", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(FeaturedPlaylistCellAccessibility *)self safeValueForKey:@"name"];
  v6 = [(FeaturedPlaylistCellAccessibility *)self safeValueForKey:@"descriptionText"];
  v4 = __UIAXStringForVariables();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)FeaturedPlaylistCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(FeaturedPlaylistCellAccessibility *)&v3 accessibilityTraits];
}

@end