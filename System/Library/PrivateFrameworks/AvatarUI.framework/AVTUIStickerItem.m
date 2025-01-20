@interface AVTUIStickerItem
- (AVTUIStickerItem)initWithIdentifier:(id)a3 localizedName:(id)a4 resourceProvider:(id)a5;
- (BOOL)hasBeenRendered;
- (CGRect)clippingRect;
- (MSSticker)cachedMSSticker;
- (NSString)description;
- (NSString)identifier;
- (NSString)localizedName;
- (UIImage)cachedImage;
- (id)discardableContentHandler;
- (id)resourceProvider;
- (void)clearCachedItems;
- (void)discardContent;
- (void)setCachedImage:(id)a3;
- (void)setCachedMSSticker:(id)a3;
- (void)setClippingRect:(CGRect)a3;
- (void)setDiscardableContentHandler:(id)a3;
- (void)setHasBeenRendered:(BOOL)a3;
@end

@implementation AVTUIStickerItem

- (AVTUIStickerItem)initWithIdentifier:(id)a3 localizedName:(id)a4 resourceProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AVTUIStickerItem;
  v11 = [(AVTUIStickerItem *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    localizedName = v11->_localizedName;
    v11->_localizedName = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    id resourceProvider = v11->_resourceProvider;
    v11->_id resourceProvider = (id)v16;
  }
  return v11;
}

- (void)clearCachedItems
{
  [(AVTUIStickerItem *)self setCachedMSSticker:0];
  [(AVTUIStickerItem *)self setCachedImage:0];
}

- (NSString)description
{
  v10.receiver = self;
  v10.super_class = (Class)AVTUIStickerItem;
  v3 = [(AVTUIStickerItem *)&v10 description];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(AVTUIStickerItem *)self localizedName];
  [v4 appendFormat:@" name: %@", v5];

  if ([(AVTUIStickerItem *)self hasBeenRendered]) {
    [v4 appendString:@" hasBeenRendered"];
  }
  v6 = [(AVTUIStickerItem *)self cachedMSSticker];

  if (v6) {
    [v4 appendString:@" has cached MSSticker"];
  }
  v7 = [(AVTUIStickerItem *)self cachedImage];

  if (v7) {
    [v4 appendString:@" and cached image"];
  }
  id v8 = (void *)[v4 copy];

  return (NSString *)v8;
}

- (void)discardContent
{
  [(AVTUIStickerItem *)self clearCachedItems];
  id discardableContentHandler = self->discardableContentHandler;
  if (discardableContentHandler)
  {
    v4 = (void (*)(void))*((void *)discardableContentHandler + 2);
    v4();
  }
}

- (id)discardableContentHandler
{
  return self->discardableContentHandler;
}

- (void)setDiscardableContentHandler:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (MSSticker)cachedMSSticker
{
  return self->_cachedMSSticker;
}

- (void)setCachedMSSticker:(id)a3
{
}

- (BOOL)hasBeenRendered
{
  return self->_hasBeenRendered;
}

- (void)setHasBeenRendered:(BOOL)a3
{
  self->_hasBeenRendered = a3;
}

- (CGRect)clippingRect
{
  double x = self->_clippingRect.origin.x;
  double y = self->_clippingRect.origin.y;
  double width = self->_clippingRect.size.width;
  double height = self->_clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (UIImage)cachedImage
{
  return self->_cachedImage;
}

- (void)setCachedImage:(id)a3
{
}

- (id)resourceProvider
{
  return self->_resourceProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resourceProvider, 0);
  objc_storeStrong((id *)&self->_cachedImage, 0);
  objc_storeStrong((id *)&self->_cachedMSSticker, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->discardableContentHandler, 0);
}

@end