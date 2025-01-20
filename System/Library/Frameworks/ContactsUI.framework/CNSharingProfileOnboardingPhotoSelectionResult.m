@interface CNSharingProfileOnboardingPhotoSelectionResult
- (BOOL)wasSelectedInFullPhotoPicker;
- (NSData)memojiMetadata;
- (NSString)variantName;
- (UIImage)compositedImage;
- (UIImage)originalImage;
- (int64_t)avatarType;
- (void)setAvatarType:(int64_t)a3;
- (void)setCompositedImage:(id)a3;
- (void)setMemojiMetadata:(id)a3;
- (void)setOriginalImage:(id)a3;
- (void)setVariantName:(id)a3;
- (void)setWasSelectedInFullPhotoPicker:(BOOL)a3;
@end

@implementation CNSharingProfileOnboardingPhotoSelectionResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantName, 0);
  objc_storeStrong((id *)&self->_compositedImage, 0);

  objc_storeStrong((id *)&self->_originalImage, 0);
}

- (void)setMemojiMetadata:(id)a3
{
  self->_memojiMetadata = (NSData *)a3;
}

- (NSData)memojiMetadata
{
  return self->_memojiMetadata;
}

- (void)setWasSelectedInFullPhotoPicker:(BOOL)a3
{
  self->_wasSelectedInFullPhotoPicker = a3;
}

- (BOOL)wasSelectedInFullPhotoPicker
{
  return self->_wasSelectedInFullPhotoPicker;
}

- (void)setAvatarType:(int64_t)a3
{
  self->_avatarType = a3;
}

- (int64_t)avatarType
{
  return self->_avatarType;
}

- (void)setVariantName:(id)a3
{
}

- (NSString)variantName
{
  return self->_variantName;
}

- (void)setCompositedImage:(id)a3
{
}

- (UIImage)compositedImage
{
  return self->_compositedImage;
}

- (void)setOriginalImage:(id)a3
{
}

- (UIImage)originalImage
{
  return self->_originalImage;
}

@end