@interface AKIcon
+ (double)_screenScale;
+ (id)iconWithBundleID:(id)a3 size:(CGSize)a4;
+ (id)iconWithData:(id)a3 scale:(double)a4;
+ (id)iconWithIconContext:(id)a3;
+ (id)iconWithName:(id)a3 size:(CGSize)a4;
+ (id)iconWithPresentationContext:(id)a3;
- (AKIcon)initWithBundleID:(id)a3 size:(CGSize)a4;
- (AKIcon)initWithData:(id)a3 scale:(double)a4;
- (AKIcon)initWithIconContext:(id)a3;
- (AKIcon)initWithName:(id)a3 size:(CGSize)a4;
- (AKIcon)initWithPresentationContext:(id)a3;
- (BOOL)_hasInstalledApplicationWithBundleID:(id)a3;
- (BOOL)_shouldMaskImage;
- (CGImage)_CGImageForImage:(id)a3;
- (id)_applicationProxyForBundleID:(id)a3;
- (id)_catalogueImageWithName:(id)a3;
- (id)_dataForImage:(id)a3;
- (id)_iconWithImage:(id)a3;
- (id)_imageWithBundleID:(id)a3 size:(CGSize)a4 masked:(BOOL)a5;
- (id)_imageWithData:(id)a3 scale:(double)a4 masked:(BOOL)a5;
- (id)_imageWithIcon:(id)a3 size:(CGSize)a4 masked:(BOOL)a5;
- (id)_imageWithName:(id)a3 size:(CGSize)a4 masked:(BOOL)a5;
- (id)automaskedImage;
- (id)automaskedImageData;
- (id)maskedImage;
- (id)maskedImageData;
- (id)unmaskedImage;
- (id)unmaskedImageData;
- (unint64_t)iconType;
@end

@implementation AKIcon

- (AKIcon)initWithData:(id)a3 scale:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKIcon;
  v8 = [(AKIcon *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_data, a3);
    v9->_scale = a4;
  }

  return v9;
}

- (AKIcon)initWithPresentationContext:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AKIcon;
  v5 = [(AKIcon *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 iconData];
    if (v6
      && (id v7 = (void *)v6,
          [v4 iconScale],
          v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          v8))
    {
      uint64_t v9 = [v4 iconData];
      data = v5->_data;
      v5->_data = (NSData *)v9;

      objc_super v11 = [v4 iconScale];
      [v11 doubleValue];
      v5->_scale = v12;
    }
    else
    {
      v13 = [v4 iconName];

      if (v13)
      {
        uint64_t v14 = [v4 iconName];
        name = v5->_name;
        v5->_name = (NSString *)v14;
      }
      else
      {
        uint64_t v16 = [v4 bundleID];
        name = v5->_bundleID;
        v5->_bundleID = (NSString *)v16;
      }

      v5->_size = (CGSize)vdupq_n_s64(0x404B000000000000uLL);
    }
  }

  return v5;
}

- (AKIcon)initWithIconContext:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKIcon;
  v5 = [(AKIcon *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 data];
    data = v5->_data;
    v5->_data = (NSData *)v6;

    v8 = [v4 scale];
    [v8 doubleValue];
    v5->_scale = v9;

    v5->_maskingStyle = [v4 maskingStyle];
  }

  return v5;
}

- (AKIcon)initWithName:(id)a3 size:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AKIcon;
  double v9 = [(AKIcon *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    v10->_size.CGFloat width = width;
    v10->_size.CGFloat height = height;
  }

  return v10;
}

- (AKIcon)initWithBundleID:(id)a3 size:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AKIcon;
  double v9 = [(AKIcon *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleID, a3);
    v10->_size.CGFloat width = width;
    v10->_size.CGFloat height = height;
  }

  return v10;
}

+ (id)iconWithData:(id)a3 scale:(double)a4
{
  id v5 = a3;
  uint64_t v6 = [[AKIcon alloc] initWithData:v5 scale:a4];

  return v6;
}

+ (id)iconWithPresentationContext:(id)a3
{
  id v3 = a3;
  id v4 = [[AKIcon alloc] initWithPresentationContext:v3];

  return v4;
}

+ (id)iconWithIconContext:(id)a3
{
  id v3 = a3;
  id v4 = [[AKIcon alloc] initWithIconContext:v3];

  return v4;
}

+ (id)iconWithName:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  id v7 = -[AKIcon initWithName:size:]([AKIcon alloc], "initWithName:size:", v6, width, height);

  return v7;
}

+ (id)iconWithBundleID:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  id v7 = -[AKIcon initWithBundleID:size:]([AKIcon alloc], "initWithBundleID:size:", v6, width, height);

  return v7;
}

- (id)unmaskedImage
{
  data = self->_data;
  if (data)
  {
    id v3 = [(AKIcon *)self _imageWithData:data scale:0 masked:self->_scale];
  }
  else
  {
    name = self->_name;
    if (name)
    {
      id v3 = -[AKIcon _imageWithName:size:masked:](self, "_imageWithName:size:masked:", name, 0, self->_size.width, self->_size.height);
    }
    else
    {
      bundleID = self->_bundleID;
      if (bundleID)
      {
        id v3 = -[AKIcon _imageWithBundleID:size:masked:](self, "_imageWithBundleID:size:masked:", bundleID, 0, self->_size.width, self->_size.height);
      }
      else
      {
        id v3 = 0;
      }
    }
  }

  return v3;
}

- (id)maskedImage
{
  data = self->_data;
  if (data)
  {
    id v3 = [(AKIcon *)self _imageWithData:data scale:1 masked:self->_scale];
  }
  else
  {
    name = self->_name;
    if (name)
    {
      id v3 = -[AKIcon _imageWithName:size:masked:](self, "_imageWithName:size:masked:", name, 1, self->_size.width, self->_size.height);
    }
    else
    {
      bundleID = self->_bundleID;
      if (bundleID)
      {
        id v3 = -[AKIcon _imageWithBundleID:size:masked:](self, "_imageWithBundleID:size:masked:", bundleID, 1, self->_size.width, self->_size.height);
      }
      else
      {
        id v3 = 0;
      }
    }
  }

  return v3;
}

- (id)automaskedImage
{
  BOOL v3 = [(AKIcon *)self _shouldMaskImage];
  data = self->_data;
  if (data)
  {
    id v5 = [(AKIcon *)self _imageWithData:data scale:v3 masked:self->_scale];
  }
  else
  {
    name = self->_name;
    if (name)
    {
      id v5 = -[AKIcon _imageWithName:size:masked:](self, "_imageWithName:size:masked:", name, v3, self->_size.width, self->_size.height);
    }
    else
    {
      bundleID = self->_bundleID;
      if (bundleID)
      {
        id v5 = -[AKIcon _imageWithBundleID:size:masked:](self, "_imageWithBundleID:size:masked:", bundleID, v3, self->_size.width, self->_size.height);
      }
      else
      {
        id v5 = 0;
      }
    }
  }

  return v5;
}

- (id)unmaskedImageData
{
  BOOL v3 = [(AKIcon *)self unmaskedImage];
  id v4 = [(AKIcon *)self _dataForImage:v3];

  return v4;
}

- (id)maskedImageData
{
  BOOL v3 = [(AKIcon *)self maskedImage];
  id v4 = [(AKIcon *)self _dataForImage:v3];

  return v4;
}

- (id)automaskedImageData
{
  BOOL v3 = [(AKIcon *)self automaskedImage];
  id v4 = [(AKIcon *)self _dataForImage:v3];

  return v4;
}

- (unint64_t)iconType
{
  if (self->_data) {
    return 2;
  }
  if (self->_name)
  {
    BOOL v3 = -[AKIcon _catalogueImageWithName:](self, "_catalogueImageWithName:");
    unint64_t v2 = 2 * (v3 != 0);
  }
  else if (self->_bundleID)
  {
    if (-[AKIcon _hasInstalledApplicationWithBundleID:](self, "_hasInstalledApplicationWithBundleID:")) {
      return 2;
    }
    else {
      return 1;
    }
  }
  else
  {
    return 0;
  }
  return v2;
}

- (id)_catalogueImageWithName:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  id v5 = [v3 bundleForClass:objc_opt_class()];
  id v6 = [MEMORY[0x1E4F42A80] imageNamed:v4 inBundle:v5];

  return v6;
}

- (id)_imageWithData:(id)a3 scale:(double)a4 masked:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = [MEMORY[0x1E4F42A80] imageWithData:a3 scale:a4];
  id v8 = (void *)v7;
  double v9 = 0;
  if (v5 && v7)
  {
    v10 = [(AKIcon *)self _iconWithImage:v7];
    [v8 size];
    double v9 = -[AKIcon _imageWithIcon:size:masked:](self, "_imageWithIcon:size:masked:", v10, 1);
  }
  if (v9) {
    objc_super v11 = v9;
  }
  else {
    objc_super v11 = v8;
  }
  id v12 = v11;

  return v12;
}

- (id)_imageWithBundleID:(id)a3 size:(CGSize)a4 masked:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  double v9 = [(AKIcon *)self _applicationProxyForBundleID:a3];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithResourceProxy:v9];
  objc_super v11 = -[AKIcon _imageWithIcon:size:masked:](self, "_imageWithIcon:size:masked:", v10, v5, width, height);

  return v11;
}

- (id)_imageWithName:(id)a3 size:(CGSize)a4 masked:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  double v9 = [(AKIcon *)self _catalogueImageWithName:a3];
  v10 = [(AKIcon *)self _iconWithImage:v9];
  objc_super v11 = -[AKIcon _imageWithIcon:size:masked:](self, "_imageWithIcon:size:masked:", v10, v5, width, height);
  id v12 = v11;
  if (!v11) {
    objc_super v11 = v9;
  }
  id v13 = v11;

  return v13;
}

- (id)_iconWithImage:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(AKIcon *)self _CGImageForImage:v4];
  [v4 scale];
  double v7 = v6;

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F6F238]) initWithCGImage:v5 scale:v7];
  id v9 = objc_alloc(MEMORY[0x1E4F6F248]);
  v13[0] = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  objc_super v11 = (void *)[v9 initWithImages:v10];

  return v11;
}

- (id)_imageWithIcon:(id)a3 size:(CGSize)a4 masked:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  [(id)objc_opt_class() _screenScale];
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", width, height, v9);
  [v10 setShape:0];
  [v10 setShouldApplyMask:v5];
  [v10 setDrawBorder:1];
  v17[0] = v10;
  objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [v8 prepareImagesForImageDescriptors:v11];

  id v12 = [v8 imageForDescriptor:v10];

  id v13 = (void *)MEMORY[0x1E4F42A80];
  uint64_t v14 = [v12 CGImage];
  [v12 scale];
  v15 = objc_msgSend(v13, "imageWithCGImage:scale:orientation:", v14, 0);

  return v15;
}

- (id)_dataForImage:(id)a3
{
  Copy = [(AKIcon *)self _CGImageForImage:a3];
  if (Copy)
  {
    Mutable = CFDataCreateMutable(0, 0);
    BOOL v5 = [(id)*MEMORY[0x1E4F444E0] identifier];
    double v6 = CGImageDestinationCreateWithData(Mutable, v5, 1uLL, 0);

    CGImageDestinationAddImage(v6, Copy, 0);
    LODWORD(v5) = CGImageDestinationFinalize(v6);
    CFRelease(v6);
    Copy = 0;
    if (v5) {
      Copy = CFDataCreateCopy(0, Mutable);
    }
    CFRelease(Mutable);
  }

  return Copy;
}

- (CGImage)_CGImageForImage:(id)a3
{
  id v3 = a3;

  return (CGImage *)[v3 CGImage];
}

- (BOOL)_hasInstalledApplicationWithBundleID:(id)a3
{
  id v3 = [(AKIcon *)self _applicationProxyForBundleID:a3];
  id v4 = [v3 appState];
  char v5 = [v4 isInstalled];

  return v5;
}

- (id)_applicationProxyForBundleID:(id)a3
{
  return (id)[MEMORY[0x1E4F223B8] applicationProxyForIdentifier:a3];
}

- (BOOL)_shouldMaskImage
{
  unint64_t maskingStyle = self->_maskingStyle;
  if (maskingStyle) {
    return maskingStyle == 1;
  }
  if (self->_data || self->_name) {
    return 1;
  }
  return self->_bundleID != 0;
}

+ (double)_screenScale
{
  unint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 scale];
  double v4 = v3;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end