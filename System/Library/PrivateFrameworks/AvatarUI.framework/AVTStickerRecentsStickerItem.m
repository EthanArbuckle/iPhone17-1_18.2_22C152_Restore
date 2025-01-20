@interface AVTStickerRecentsStickerItem
- (AVTStickerRecentsStickerItem)initWithAvatarIdentifier:(id)a3 stickerName:(id)a4 localizedName:(id)a5 stickerProvider:(id)a6;
- (BOOL)isPrereleaseSticker;
- (NSString)avatarIdentifier;
- (NSString)localizedDescription;
- (NSString)stickerName;
- (NSURL)url;
- (UIImage)image;
- (id)cellIdentifier;
- (id)discardableContentHandler;
- (id)provider;
- (void)discardContent;
- (void)setDiscardableContentHandler:(id)a3;
- (void)setImage:(id)a3;
- (void)setPrereleaseSticker:(BOOL)a3;
- (void)setUrl:(id)a3;
@end

@implementation AVTStickerRecentsStickerItem

- (AVTStickerRecentsStickerItem)initWithAvatarIdentifier:(id)a3 stickerName:(id)a4 localizedName:(id)a5 stickerProvider:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)AVTStickerRecentsStickerItem;
  v14 = [(AVTStickerRecentsStickerItem *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    avatarIdentifier = v14->_avatarIdentifier;
    v14->_avatarIdentifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    stickerName = v14->_stickerName;
    v14->_stickerName = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    localizedDescription = v14->_localizedDescription;
    v14->_localizedDescription = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    id provider = v14->_provider;
    v14->_id provider = (id)v21;
  }
  return v14;
}

- (id)cellIdentifier
{
  return +[AVTStickerRecentsStickerCollectionViewCell identifier];
}

- (void)discardContent
{
  [(AVTStickerRecentsStickerItem *)self setImage:0];
  id discardableContentHandler = self->discardableContentHandler;
  if (discardableContentHandler)
  {
    v4 = (void (*)(void))*((void *)discardableContentHandler + 2);
    v4();
  }
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (id)provider
{
  return self->_provider;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (BOOL)isPrereleaseSticker
{
  return self->_prereleaseSticker;
}

- (void)setPrereleaseSticker:(BOOL)a3
{
  self->_prereleaseSticker = a3;
}

- (id)discardableContentHandler
{
  return self->discardableContentHandler;
}

- (void)setDiscardableContentHandler:(id)a3
{
}

- (NSString)avatarIdentifier
{
  return self->_avatarIdentifier;
}

- (NSString)stickerName
{
  return self->_stickerName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerName, 0);
  objc_storeStrong((id *)&self->_avatarIdentifier, 0);
  objc_storeStrong(&self->discardableContentHandler, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong(&self->_provider, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end