@interface AVTStickerResource
+ (BOOL)supportsSecureCoding;
- (AVTStickerResource)initWithCoder:(id)a3;
- (AVTStickerResource)initWithImage:(id)a3 URL:(id)a4 clippingRect:(CGRect)a5;
- (AVTUINSURL)internalURL;
- (BOOL)isPrereleaseSticker;
- (CGRect)clippingRect;
- (UIImage)image;
- (void)encodeWithCoder:(id)a3;
- (void)setInternalURL:(id)a3;
- (void)setPrereleaseSticker:(BOOL)a3;
- (void)setURL:(id)a3;
@end

@implementation AVTStickerResource

- (AVTStickerResource)initWithImage:(id)a3 URL:(id)a4 clippingRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v12 = a3;
  id v13 = a4;
  v21.receiver = self;
  v21.super_class = (Class)AVTStickerResource;
  v14 = [(AVTStickerResource *)&v21 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_image, a3);
    if (v13)
    {
      v16 = [AVTUINSURL alloc];
      v17 = [v13 path];
      uint64_t v18 = [(AVTUINSURL *)v16 initFileURLWithPath:v17];
      internalURL = v15->_internalURL;
      v15->_internalURL = (AVTUINSURL *)v18;
    }
    else
    {
      v17 = v15->_internalURL;
      v15->_internalURL = 0;
    }

    v15->_clippingRect.origin.CGFloat x = x;
    v15->_clippingRect.origin.CGFloat y = y;
    v15->_clippingRect.size.CGFloat width = width;
    v15->_clippingRect.size.CGFloat height = height;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AVTStickerResource)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
  [v4 decodeCGRectForKey:@"clippingRect"];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v15 = -[AVTStickerResource initWithImage:URL:clippingRect:](self, "initWithImage:URL:clippingRect:", v5, v6, v8, v10, v12, v14);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(AVTStickerResource *)self image];
  [v6 encodeObject:v4 forKey:@"image"];

  v5 = [(AVTStickerResource *)self URL];
  [v6 encodeObject:v5 forKey:@"url"];

  [(AVTStickerResource *)self clippingRect];
  objc_msgSend(v6, "encodeCGRect:forKey:", @"clippingRect");
}

- (void)setURL:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    id v4 = [AVTUINSURL alloc];
    v5 = [v8 path];
    id v6 = (AVTUINSURL *)[(AVTUINSURL *)v4 initFileURLWithPath:v5];
    internalURL = self->_internalURL;
    self->_internalURL = v6;
  }
  else
  {
    v5 = self->_internalURL;
    self->_internalURL = 0;
  }
}

- (UIImage)image
{
  return self->_image;
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

- (AVTUINSURL)internalURL
{
  return self->_internalURL;
}

- (void)setInternalURL:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalURL, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end