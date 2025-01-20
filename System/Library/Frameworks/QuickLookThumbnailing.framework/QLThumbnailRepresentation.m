@interface QLThumbnailRepresentation
- (CGImageRef)CGImage;
- (CGRect)contentRect;
- (NSArray)images;
- (NSImage)NSImage;
- (QLThumbnailMetadata)generatedProperties;
- (QLThumbnailRepresentation)initWithThumbnailType:(int64_t)a3 iconFlavor:(int)a4 CGImage:(CGImage *)a5 scale:(double)a6 contentRect:(CGRect)a7 generatedProperties:(id)a8;
- (QLThumbnailRepresentation)initWithThumbnailType:(int64_t)a3 iconFlavor:(int)a4 images:(id)a5 scale:(double)a6 contentRect:(CGRect)a7 generatedProperties:(id)a8;
- (QLThumbnailRepresentationType)type;
- (UIImage)UIImage;
- (UIImage)UIImageThumbnail;
- (double)scale;
- (id)description;
- (int)flavor;
- (void)setContentRect:(CGRect)a3;
- (void)setFlavor:(int)a3;
- (void)setGeneratedProperties:(id)a3;
- (void)setImages:(id)a3;
- (void)setScale:(double)a3;
- (void)setType:(int64_t)a3;
- (void)setUIImageThumbnail:(id)a3;
@end

@implementation QLThumbnailRepresentation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatedProperties, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_UIImageThumbnail, 0);

  objc_storeStrong((id *)&self->_NSImage, 0);
}

- (QLThumbnailRepresentation)initWithThumbnailType:(int64_t)a3 iconFlavor:(int)a4 images:(id)a5 scale:(double)a6 contentRect:(CGRect)a7 generatedProperties:(id)a8
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  id v18 = a5;
  id v19 = a8;
  v23.receiver = self;
  v23.super_class = (Class)QLThumbnailRepresentation;
  v20 = [(QLThumbnailRepresentation *)&v23 init];
  v21 = v20;
  if (v20)
  {
    v20->_type = a3;
    objc_storeStrong((id *)&v20->_images, a5);
    v21->_scale = a6;
    v21->_flavor = a4;
    v21->_contentRect.origin.CGFloat x = x;
    v21->_contentRect.origin.CGFloat y = y;
    v21->_contentRect.size.CGFloat width = width;
    v21->_contentRect.size.CGFloat height = height;
    objc_storeStrong((id *)&v21->_generatedProperties, a8);
  }

  return v21;
}

- (UIImage)UIImage
{
  UIImageThumbnail = self->_UIImageThumbnail;
  if (!UIImageThumbnail)
  {
    v4 = (UIImage *)objc_msgSend(objc_alloc((Class)QLTImageClassWithError(0)), "initWithCGImage:scale:orientation:", -[QLThumbnailRepresentation CGImage](self, "CGImage"), 0, self->_scale);
    v5 = self->_UIImageThumbnail;
    self->_UIImageThumbnail = v4;

    UIImageThumbnail = self->_UIImageThumbnail;
  }

  return UIImageThumbnail;
}

- (CGImageRef)CGImage
{
  v2 = [(NSArray *)self->_images firstObject];

  return (CGImageRef)v2;
}

- (QLThumbnailRepresentation)initWithThumbnailType:(int64_t)a3 iconFlavor:(int)a4 CGImage:(CGImage *)a5 scale:(double)a6 contentRect:(CGRect)a7 generatedProperties:(id)a8
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  v25[1] = *MEMORY[0x1E4F143B8];
  id v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)QLThumbnailRepresentation;
  id v19 = [(QLThumbnailRepresentation *)&v24 init];
  v20 = v19;
  if (v19)
  {
    v19->_type = a3;
    if (a5)
    {
      v25[0] = a5;
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      images = v20->_images;
      v20->_images = (NSArray *)v21;
    }
    else
    {
      images = v19->_images;
      v19->_images = (NSArray *)MEMORY[0x1E4F1CBF0];
    }

    v20->_scale = a6;
    v20->_flavor = a4;
    v20->_contentRect.origin.CGFloat x = x;
    v20->_contentRect.origin.CGFloat y = y;
    v20->_contentRect.size.CGFloat width = width;
    v20->_contentRect.size.CGFloat height = height;
    objc_storeStrong((id *)&v20->_generatedProperties, a8);
  }

  return v20;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  QLThumbnailRepresentationType v6 = [(QLThumbnailRepresentation *)self type];
  v7 = @"Icon";
  if (v6 == QLThumbnailRepresentationTypeLowQualityThumbnail) {
    v7 = @"LowQualityThumbnail";
  }
  if (v6 == QLThumbnailRepresentationTypeThumbnail) {
    v7 = @"Thumbnail";
  }
  v8 = v7;
  if ([(NSArray *)self->_images count] <= 1)
  {
    v10 = objc_msgSend(v3, "initWithFormat:", @"<%@:%p type: %@%@; properties=%@>",
                    v5,
                    self,
                    v8,
                    &stru_1F0A8F3F8,
                    self->_generatedProperties);
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"; %lu images",
    v9 = [(NSArray *)self->_images count]);
    v10 = objc_msgSend(v3, "initWithFormat:", @"<%@:%p type: %@%@; properties=%@>",
                    v5,
                    self,
                    v8,
                    v9,
                    self->_generatedProperties);
  }

  return v10;
}

- (QLThumbnailRepresentationType)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSImage)NSImage
{
  return self->_NSImage;
}

- (CGRect)contentRect
{
  double x = self->_contentRect.origin.x;
  double y = self->_contentRect.origin.y;
  double width = self->_contentRect.size.width;
  double height = self->_contentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentRect:(CGRect)a3
{
  self->_contentRect = a3;
}

- (UIImage)UIImageThumbnail
{
  return self->_UIImageThumbnail;
}

- (void)setUIImageThumbnail:(id)a3
{
}

- (NSArray)images
{
  return self->_images;
}

- (void)setImages:(id)a3
{
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (int)flavor
{
  return self->_flavor;
}

- (void)setFlavor:(int)a3
{
  self->_flavor = a3;
}

- (QLThumbnailMetadata)generatedProperties
{
  return (QLThumbnailMetadata *)objc_getProperty(self, a2, 56, 1);
}

- (void)setGeneratedProperties:(id)a3
{
}

@end