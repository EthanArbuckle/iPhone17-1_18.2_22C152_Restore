@interface CNPhotoPickerRecentsProviderItem
- (BOOL)allowsMoveAndScale;
- (BOOL)allowsVariants;
@end

@implementation CNPhotoPickerRecentsProviderItem

- (BOOL)allowsMoveAndScale
{
  return 1;
}

- (BOOL)allowsVariants
{
  return 1;
}

@end