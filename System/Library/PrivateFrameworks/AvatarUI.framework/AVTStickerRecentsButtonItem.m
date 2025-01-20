@interface AVTStickerRecentsButtonItem
- (AVTStickerRecentsButtonItem)initWithLocalizedDescription:(id)a3;
- (NSString)localizedDescription;
- (NSURL)url;
- (UIImage)image;
- (id)cellIdentifier;
- (id)discardableContentHandler;
- (id)provider;
- (void)discardContent;
- (void)setDiscardableContentHandler:(id)a3;
- (void)setImage:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation AVTStickerRecentsButtonItem

- (AVTStickerRecentsButtonItem)initWithLocalizedDescription:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTStickerRecentsButtonItem;
  v6 = [(AVTStickerRecentsButtonItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_localizedDescription, a3);
  }

  return v7;
}

- (id)cellIdentifier
{
  return +[AVTStickerRecentsButtonCollectionViewCell identifier];
}

- (id)provider
{
  return 0;
}

- (void)discardContent
{
  discardableContentHandler = (void (**)(id, AVTStickerRecentsButtonItem *))self->discardableContentHandler;
  if (discardableContentHandler) {
    discardableContentHandler[2](discardableContentHandler, self);
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

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (id)discardableContentHandler
{
  return self->discardableContentHandler;
}

- (void)setDiscardableContentHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->discardableContentHandler, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end