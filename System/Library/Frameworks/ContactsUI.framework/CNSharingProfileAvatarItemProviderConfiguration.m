@interface CNSharingProfileAvatarItemProviderConfiguration
- (CNPhotoPickerColorVariant)animojiColor;
- (NSData)memojiMetadata;
- (PRMonogramColor)monogramColor;
- (void)setAnimojiColor:(id)a3;
- (void)setMemojiMetadata:(id)a3;
- (void)setMonogramColor:(id)a3;
@end

@implementation CNSharingProfileAvatarItemProviderConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memojiMetadata, 0);
  objc_storeStrong((id *)&self->_animojiColor, 0);

  objc_storeStrong((id *)&self->_monogramColor, 0);
}

- (void)setMemojiMetadata:(id)a3
{
}

- (NSData)memojiMetadata
{
  return self->_memojiMetadata;
}

- (void)setAnimojiColor:(id)a3
{
}

- (CNPhotoPickerColorVariant)animojiColor
{
  return self->_animojiColor;
}

- (void)setMonogramColor:(id)a3
{
}

- (PRMonogramColor)monogramColor
{
  return self->_monogramColor;
}

@end