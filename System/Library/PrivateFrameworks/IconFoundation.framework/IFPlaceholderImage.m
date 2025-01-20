@interface IFPlaceholderImage
- (BOOL)placeholder;
- (CGImage)CGImage;
- (CGSize)iconSize;
- (CGSize)minimumSize;
- (CGSize)size;
- (IFImage)image;
- (IFPlaceholderImage)initWithImage:(id)a3;
- (double)scale;
- (id)validationToken;
- (unint64_t)validationFlags;
- (void)setValidationFlags:(unint64_t)a3;
@end

@implementation IFPlaceholderImage

- (IFPlaceholderImage)initWithImage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IFPlaceholderImage;
  v6 = [(IFImage *)&v9 _init];
  v7 = (IFPlaceholderImage *)v6;
  if (v6) {
    objc_storeStrong(v6 + 5, a3);
  }

  return v7;
}

- (CGSize)size
{
  [(IFImage *)self->_image size];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)iconSize
{
  [(IFImage *)self->_image iconSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)scale
{
  [(IFImage *)self->_image scale];
  return result;
}

- (CGImage)CGImage
{
  return (CGImage *)[(IFImage *)self->_image CGImage];
}

- (CGSize)minimumSize
{
  [(IFImage *)self->_image minimumSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)validationToken
{
  return [(IFImage *)self->_image validationToken];
}

- (unint64_t)validationFlags
{
  unint64_t validationFlags = self->_validationFlags;
  return validationFlags | [(IFImage *)self->_image validationFlags] | 1;
}

- (BOOL)placeholder
{
  return [(IFPlaceholderImage *)self validationFlags] & 1;
}

- (void)setValidationFlags:(unint64_t)a3
{
  self->_unint64_t validationFlags = a3;
}

- (IFImage)image
{
  return (IFImage *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
}

@end