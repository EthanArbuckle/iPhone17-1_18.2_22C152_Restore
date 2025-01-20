@interface MusicVideoVerticalCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityRoleDescription;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MusicVideoVerticalCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.MusicVideoVerticalCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.MusicVideoVerticalCell", @"headline", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.MusicVideoVerticalCell", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.MusicVideoVerticalCell", @"subtitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.MusicVideoVerticalCell", @"accessibilityIsExplicit", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(MusicVideoVerticalCellAccessibility *)self safeValueForKey:@"headline"];
  v4 = [(MusicVideoVerticalCellAccessibility *)self safeValueForKey:@"title"];
  v5 = [(MusicVideoVerticalCellAccessibility *)self safeValueForKey:@"subtitle"];
  if ([(MusicVideoVerticalCellAccessibility *)self safeBoolForKey:@"accessibilityIsExplicit"])
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
  return *MEMORY[0x263F1CEE8];
}

- (id)_accessibilityRoleDescription
{
  return accessibilityMusicLocalizedString(@"media.music.video");
}

@end