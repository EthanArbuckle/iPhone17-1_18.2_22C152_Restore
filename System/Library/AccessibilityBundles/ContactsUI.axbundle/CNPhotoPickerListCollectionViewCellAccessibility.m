@interface CNPhotoPickerListCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
@end

@implementation CNPhotoPickerListCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNPhotoPickerListCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CNPhotoPickerListCollectionViewCellAccessibility;
  v4 = [(CNPhotoPickerListCollectionViewCellAccessibility *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  uint64_t v5 = [v4 accessibilityTraits];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEE8] | v5];

  return v4;
}

@end