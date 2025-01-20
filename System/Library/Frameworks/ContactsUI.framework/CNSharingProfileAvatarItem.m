@interface CNSharingProfileAvatarItem
- (BOOL)wasSetFromFullPhotoPicker;
- (CNSharingProfileAvatarItem)initWithImageProvider:(id)a3 originalImageProvider:(id)a4 type:(int64_t)a5;
- (CNSharingProfileAvatarItem)initWithImageProvider:(id)a3 type:(int64_t)a4;
- (NSData)memojiMetadata;
- (NSString)variantIdentifier;
- (id)imageProvider;
- (id)originalImageProvider;
- (int64_t)type;
- (void)setMemojiMetadata:(id)a3;
- (void)setVariantIdentifier:(id)a3;
- (void)setWasSetFromFullPhotoPicker:(BOOL)a3;
@end

@implementation CNSharingProfileAvatarItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantIdentifier, 0);
  objc_storeStrong(&self->_originalImageProvider, 0);

  objc_storeStrong(&self->_imageProvider, 0);
}

- (void)setMemojiMetadata:(id)a3
{
  self->_memojiMetadata = (NSData *)a3;
}

- (NSData)memojiMetadata
{
  return self->_memojiMetadata;
}

- (void)setWasSetFromFullPhotoPicker:(BOOL)a3
{
  self->_wasSetFromFullPhotoPicker = a3;
}

- (BOOL)wasSetFromFullPhotoPicker
{
  return self->_wasSetFromFullPhotoPicker;
}

- (void)setVariantIdentifier:(id)a3
{
}

- (NSString)variantIdentifier
{
  return self->_variantIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

- (id)originalImageProvider
{
  return self->_originalImageProvider;
}

- (id)imageProvider
{
  return self->_imageProvider;
}

- (CNSharingProfileAvatarItem)initWithImageProvider:(id)a3 originalImageProvider:(id)a4 type:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNSharingProfileAvatarItem;
  v10 = [(CNSharingProfileAvatarItem *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    id imageProvider = v10->_imageProvider;
    v10->_id imageProvider = (id)v11;

    uint64_t v13 = [v9 copy];
    id originalImageProvider = v10->_originalImageProvider;
    v10->_id originalImageProvider = (id)v13;

    v10->_type = a5;
    v15 = v10;
  }

  return v10;
}

- (CNSharingProfileAvatarItem)initWithImageProvider:(id)a3 type:(int64_t)a4
{
  return [(CNSharingProfileAvatarItem *)self initWithImageProvider:a3 originalImageProvider:a3 type:a4];
}

@end