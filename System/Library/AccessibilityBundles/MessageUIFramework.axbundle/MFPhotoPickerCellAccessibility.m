@interface MFPhotoPickerCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
@end

@implementation MFPhotoPickerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFPhotoPickerCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)MFPhotoPickerCellAccessibility;
  return *MEMORY[0x263F1CF00] | [(MFPhotoPickerCellAccessibility *)&v3 accessibilityTraits];
}

@end