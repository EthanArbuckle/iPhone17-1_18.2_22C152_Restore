@interface BNImageProvider
+ (BOOL)supportsSecureCoding;
- (BNImageProvider)initWithCoder:(id)a3;
- (BNImageProvider)initWithImage:(id)a3;
- (BNImageProvider)initWithImageName:(id)a3;
- (BNImageProvider)initWithImageName:(id)a3 fromBundle:(id)a4;
- (BNImageProvider)initWithSystemImageName:(id)a3;
- (BOOL)isImageProvider;
- (UIImage)image;
- (id)_initWithImageSource:(id)a3 ofType:(int64_t)a4 fromBundle:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BNImageProvider

- (id)_initWithImageSource:(id)a3 ofType:(int64_t)a4 fromBundle:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  if (!v10)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"BNImageProvider.m", 62, @"Invalid parameter not satisfying: %@", @"imageSource" object file lineNumber description];
  }
  if ((unint64_t)(a4 - 4) <= 0xFFFFFFFFFFFFFFFCLL)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"BNImageProvider.m", 63, @"Invalid image source type: %ld", a4);
  }
  else if (a4 == 1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_15;
    }
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = @"image";
    goto LABEL_14;
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = @"[UNKNOWN]";
    if (a4 == 2) {
      v13 = @"imageName";
    }
    if (a4 == 3) {
      v13 = @"systemImageName";
    }
LABEL_14:
    [v12 handleFailureInMethod:a2, self, @"BNImageProvider.m", 64, @"Image source (%@) is not of specified type (%@)", v10, v13 object file lineNumber description];
  }
LABEL_15:
  v22.receiver = self;
  v22.super_class = (Class)BNImageProvider;
  v16 = [(BNImageProvider *)&v22 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong(&v16->_imageSource, a3);
    v17->_imageSourceType = a4;
    v18 = [v11 bundleURL];
    uint64_t v19 = [v18 copy];
    bundleURL = v17->_bundleURL;
    v17->_bundleURL = (NSURL *)v19;
  }
  return v17;
}

- (BNImageProvider)initWithImage:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"BNImageProvider.m", 74, @"Invalid parameter not satisfying: %@", @"image" object file lineNumber description];
  }
  v6 = [(BNImageProvider *)self _initWithImageSource:v5 ofType:1 fromBundle:0];

  return v6;
}

- (BNImageProvider)initWithImageName:(id)a3
{
  id v5 = a3;
  if (![v5 length])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"BNImageProvider.m", 79, @"Invalid parameter not satisfying: %@", @"[imageName length] > 0" object file lineNumber description];
  }
  v6 = [(BNImageProvider *)self _initWithImageSource:v5 ofType:2 fromBundle:0];

  return v6;
}

- (BNImageProvider)initWithImageName:(id)a3 fromBundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![v7 length])
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"BNImageProvider.m", 84, @"Invalid parameter not satisfying: %@", @"[imageName length] > 0" object file lineNumber description];
  }
  v9 = [(BNImageProvider *)self _initWithImageSource:v7 ofType:2 fromBundle:v8];

  return v9;
}

- (BNImageProvider)initWithSystemImageName:(id)a3
{
  id v5 = a3;
  if (![v5 length])
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"BNImageProvider.m", 89, @"Invalid parameter not satisfying: %@", @"[systemImageName length] > 0" object file lineNumber description];
  }
  v6 = [(BNImageProvider *)self _initWithImageSource:v5 ofType:3 fromBundle:0];

  return v6;
}

- (BOOL)isImageProvider
{
  return 1;
}

- (UIImage)image
{
  if (!self->_image)
  {
    int64_t imageSourceType = self->_imageSourceType;
    switch(imageSourceType)
    {
      case 3:
        v4 = [MEMORY[0x1E4F42A80] _systemImageNamed:self->_imageSource];
        break;
      case 2:
        if (self->_bundleURL)
        {
          id v5 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithURL:");
        }
        else
        {
          id v5 = 0;
        }
        v6 = [MEMORY[0x1E4F42A80] imageNamed:self->_imageSource inBundle:v5 withConfiguration:0];
        image = self->_image;
        self->_image = v6;

        goto LABEL_12;
      case 1:
        v4 = (UIImage *)self->_imageSource;
        break;
      default:
        goto LABEL_13;
    }
    id v5 = self->_image;
    self->_image = v4;
LABEL_12:
  }
LABEL_13:
  id v8 = self->_image;
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeInteger:self->_imageSourceType forKey:@"imageSourceType"];
  bundleURL = self->_bundleURL;
  if (bundleURL) {
    [v6 encodeObject:bundleURL forKey:@" bundleURL"];
  }
  unint64_t v5 = self->_imageSourceType - 1;
  if (v5 <= 2) {
    [v6 encodeObject:self->_imageSource forKey:off_1E63BA0A0[v5]];
  }
}

- (BNImageProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"imageSourceType"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@" bundleURL"];
  id v7 = (void *)v6;
  if (v5 == 1)
  {
    id v8 = @"image";
  }
  else
  {
    if ((v5 & 0xFFFFFFFFFFFFFFFELL) != 2)
    {
      v9 = 0;
      if (v6) {
        goto LABEL_6;
      }
LABEL_8:
      id v11 = (BNImageProvider *)[(BNImageProvider *)self _initWithImageSource:v9 ofType:v5 fromBundle:0];
      goto LABEL_9;
    }
    id v8 = @"imageName";
  }
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:v8];
  if (!v7) {
    goto LABEL_8;
  }
LABEL_6:
  id v10 = [MEMORY[0x1E4F28B50] bundleWithURL:v7];
  id v11 = (BNImageProvider *)[(BNImageProvider *)self _initWithImageSource:v9 ofType:v5 fromBundle:v10];

LABEL_9:
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong(&self->_imageSource, 0);
}

@end