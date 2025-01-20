@interface CNSharingProfilePhotoPickerItem
- (CNSharingProfileAvatarItem)avatarItem;
- (NSString)symbolImageName;
- (UIImage)cachedPreviewImage;
- (id)compositeImageWithSize:(CGSize)a3;
- (id)originalImageWithSize:(CGSize)a3;
- (void)setAvatarItem:(id)a3;
- (void)setCachedPreviewImage:(id)a3;
- (void)setSymbolImageName:(id)a3;
@end

@implementation CNSharingProfilePhotoPickerItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolImageName, 0);
  objc_storeStrong((id *)&self->_avatarItem, 0);

  objc_storeStrong((id *)&self->_cachedPreviewImage, 0);
}

- (void)setSymbolImageName:(id)a3
{
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (void)setAvatarItem:(id)a3
{
}

- (CNSharingProfileAvatarItem)avatarItem
{
  return self->_avatarItem;
}

- (void)setCachedPreviewImage:(id)a3
{
}

- (UIImage)cachedPreviewImage
{
  return self->_cachedPreviewImage;
}

- (id)compositeImageWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(CNSharingProfileAvatarItem *)self->_avatarItem imageProvider];
  v6 = v5[2](width, height);

  return v6;
}

- (id)originalImageWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(CNSharingProfileAvatarItem *)self->_avatarItem originalImageProvider];

  if (v6)
  {
    v7 = [(CNSharingProfileAvatarItem *)self->_avatarItem originalImageProvider];
    v8 = v7[2](width, height);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end