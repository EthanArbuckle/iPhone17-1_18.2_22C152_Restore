@interface MUPhotoTileCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MUPhotoTileCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MUPhotoTileCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUPhotoTileCollectionViewCell", @"photoOverlay", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUPhotoTileOverlay", @"shouldBeShown", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUPhotoTileOverlay", @"attributionTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUPhotoTileOverlay", @"tileTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUPhotoTileOverlay", @"badgeTitle", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF00] | *MEMORY[0x263F1CEE8];
}

- (id)accessibilityLabel
{
  v2 = [(MUPhotoTileCollectionViewCellAccessibility *)self safeValueForKey:@"photoOverlay"];
  id v3 = v2;
  if (v2 && [v2 safeBoolForKey:@"shouldBeShown"])
  {
    v4 = [v3 safeStringForKey:@"attributionTitle"];
    v5 = [v3 safeStringForKey:@"badgeTitle"];
    v6 = v5;
    if (v4)
    {
      v7 = v4;
    }
    else if (v5)
    {
      v7 = v5;
    }
    else
    {
      v7 = [v3 safeStringForKey:@"tileTitle"];
    }
    v8 = v7;
  }
  else
  {
    v8 = &stru_26F6F4CD0;
  }

  return v8;
}

@end