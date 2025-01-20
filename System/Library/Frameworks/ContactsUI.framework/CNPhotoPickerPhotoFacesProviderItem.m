@interface CNPhotoPickerPhotoFacesProviderItem
- (BOOL)allowsMoveAndScale;
- (BOOL)allowsVariants;
- (unint64_t)imageType;
@end

@implementation CNPhotoPickerPhotoFacesProviderItem

- (unint64_t)imageType
{
  return 1;
}

- (BOOL)allowsMoveAndScale
{
  return 1;
}

- (BOOL)allowsVariants
{
  return 1;
}

@end