@interface MSAlbumPropertiesViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation MSAlbumPropertiesViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MSAlbumPropertiesView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = [(MSAlbumPropertiesViewAccessibility *)self safeValueForKey:@"_artistLabel"];
  v4 = [v3 accessibilityLabel];

  v5 = [(MSAlbumPropertiesViewAccessibility *)self safeValueForKey:@"_albumLabel"];
  v6 = [v5 accessibilityLabel];

  v7 = [(MSAlbumPropertiesViewAccessibility *)self safeValueForKey:@"_itemCountsLabel"];
  v8 = [v7 accessibilityLabel];

  v9 = [(MSAlbumPropertiesViewAccessibility *)self safeValueForKey:@"_releaseDateLabel"];
  v10 = [v9 accessibilityLabel];

  v11 = __UIAXStringForVariables();

  return v11;
}

@end