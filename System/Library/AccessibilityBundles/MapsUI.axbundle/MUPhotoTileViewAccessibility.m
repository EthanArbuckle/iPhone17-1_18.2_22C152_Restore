@interface MUPhotoTileViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MUPhotoTileViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MUPhotoTileView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(MUPhotoTileViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)MUPhotoTileViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(MUPhotoTileViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F1CF00];
}

@end