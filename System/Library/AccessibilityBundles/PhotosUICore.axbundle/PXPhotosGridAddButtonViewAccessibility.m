@interface PXPhotosGridAddButtonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PXPhotosGridAddButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXPhotosGridAddButtonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityPhotosUICoreLocalizedString(@"add.photo");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosGridAddButtonViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(PXPhotosGridAddButtonViewAccessibility *)&v3 accessibilityTraits];
}

@end