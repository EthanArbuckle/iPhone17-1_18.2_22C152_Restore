@interface CPImageSet
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CPImageSet)initWithCoder:(id)a3;
- (CPImageSet)initWithImage:(id)a3;
- (CPImageSet)initWithImage:(id)a3 treatmentBlock:(id)a4;
- (CPImageSet)initWithLightContentImage:(UIImage *)lightImage darkContentImage:(UIImage *)darkImage;
- (CPImageSetAssetRegistration)currentAssetRegistration;
- (UIImage)darkContentImage;
- (UIImage)lightContentImage;
- (id)description;
- (id)image;
- (void)encodeWithCoder:(id)a3;
- (void)resizeImagesToSize:(CGSize)a3;
- (void)setCurrentAssetRegistration:(id)a3;
- (void)setDarkContentImage:(id)a3;
- (void)setLightContentImage:(id)a3;
- (void)swapStyles;
@end

@implementation CPImageSet

- (CPImageSet)initWithLightContentImage:(UIImage *)lightImage darkContentImage:(UIImage *)darkImage
{
  v6 = lightImage;
  v7 = darkImage;
  v16.receiver = self;
  v16.super_class = (Class)CPImageSet;
  v8 = [(CPImageSet *)&v16 init];
  if (v8)
  {
    v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = CPSanitizeImage(v6, v9);
    lightContentImage = v8->_lightContentImage;
    v8->_lightContentImage = (UIImage *)v10;

    v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = CPSanitizeImage(v7, v12);
    darkContentImage = v8->_darkContentImage;
    v8->_darkContentImage = (UIImage *)v13;
  }
  return v8;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CPImageSet;
  v4 = [(CPImageSet *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ {lightContentImage: %@, darkContentImage: %@}", v4, self->_lightContentImage, self->_darkContentImage];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPImageSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPImageSet;
  v5 = [(CPImageSet *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPLightContentImageKey"];
    lightContentImage = v5->_lightContentImage;
    v5->_lightContentImage = (UIImage *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPDarkContentImageKey"];
    darkContentImage = v5->_darkContentImage;
    v5->_darkContentImage = (UIImage *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CPImageSet *)self lightContentImage];
  [v4 encodeObject:v5 forKey:@"kCPLightContentImageKey"];

  id v6 = [(CPImageSet *)self darkContentImage];
  [v4 encodeObject:v6 forKey:@"kCPDarkContentImageKey"];
}

- (CPImageSet)initWithImage:(id)a3 treatmentBlock:(id)a4
{
  v37[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_super v7 = (void (**)(id, void))a4;
  v35.receiver = self;
  v35.super_class = (Class)CPImageSet;
  uint64_t v8 = [(CPImageSet *)&v35 init];
  if (v8)
  {
    v9 = [v6 traitCollection];
    uint64_t v10 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:1];
    objc_super v11 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
    if (v9)
    {
      v12 = (void *)MEMORY[0x263F1CB00];
      v37[0] = v9;
      v37[1] = v10;
      uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:2];
      uint64_t v14 = [v12 traitCollectionWithTraitsFromCollections:v13];

      v15 = (void *)MEMORY[0x263F1CB00];
      v36[0] = v9;
      v36[1] = v11;
      objc_super v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
      uint64_t v17 = [v15 traitCollectionWithTraitsFromCollections:v16];

      objc_super v11 = (void *)v17;
      uint64_t v10 = (void *)v14;
    }
    v18 = [v6 imageAsset];
    v19 = [v18 imageWithTraitCollection:v10];

    v20 = [v6 imageAsset];
    v21 = [v20 imageWithTraitCollection:v11];

    v22 = (objc_class *)objc_opt_class();
    if (v19) {
      v23 = v19;
    }
    else {
      v23 = v6;
    }
    uint64_t v24 = CPSanitizeImage(v23, v22);
    lightContentImage = v8->_lightContentImage;
    v8->_lightContentImage = (UIImage *)v24;

    v26 = (objc_class *)objc_opt_class();
    if (v21) {
      v27 = v21;
    }
    else {
      v27 = v6;
    }
    uint64_t v28 = CPSanitizeImage(v27, v26);
    darkContentImage = v8->_darkContentImage;
    v8->_darkContentImage = (UIImage *)v28;

    if (v7)
    {
      uint64_t v30 = ((void (**)(id, UIImage *))v7)[2](v7, v8->_darkContentImage);
      v31 = v8->_darkContentImage;
      v8->_darkContentImage = (UIImage *)v30;

      uint64_t v32 = ((void (**)(id, UIImage *))v7)[2](v7, v8->_lightContentImage);
      v33 = v8->_lightContentImage;
      v8->_lightContentImage = (UIImage *)v32;
    }
  }

  return v8;
}

- (CPImageSet)initWithImage:(id)a3
{
  return [(CPImageSet *)self initWithImage:a3 treatmentBlock:0];
}

- (id)image
{
  v3 = [MEMORY[0x263F1CB00] _currentTraitCollection];
  uint64_t v4 = [(CPImageSet *)self currentAssetRegistration];
  if (!v4) {
    goto LABEL_3;
  }
  v5 = (void *)v4;
  id v6 = [(CPImageSet *)self currentAssetRegistration];
  objc_super v7 = [v6 baseTraitCollection];
  char v8 = [v7 isEqual:v3];

  if ((v8 & 1) == 0)
  {
LABEL_3:
    v9 = [CPImageSetAssetRegistration alloc];
    uint64_t v10 = [(CPImageSet *)self lightContentImage];
    objc_super v11 = [(CPImageSet *)self darkContentImage];
    v12 = [(CPImageSetAssetRegistration *)v9 initWithLightImage:v10 darkImage:v11 baseTraitCollection:v3];
    [(CPImageSet *)self setCurrentAssetRegistration:v12];
  }
  uint64_t v13 = [(CPImageSet *)self currentAssetRegistration];
  uint64_t v14 = [v13 combinedImage];

  return v14;
}

- (void)swapStyles
{
  id v4 = [(CPImageSet *)self lightContentImage];
  v3 = [(CPImageSet *)self darkContentImage];
  [(CPImageSet *)self setDarkContentImage:v4];
  [(CPImageSet *)self setLightContentImage:v3];
}

- (void)resizeImagesToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  lightContentImage = self->_lightContentImage;
  if (lightContentImage)
  {
    CPImageByScalingImageToSize(lightContentImage, a3.width, a3.height);
    objc_super v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
    char v8 = self->_lightContentImage;
    self->_lightContentImage = v7;
  }
  darkContentImage = self->_darkContentImage;
  if (darkContentImage)
  {
    CPImageByScalingImageToSize(darkContentImage, width, height);
    self->_darkContentImage = (UIImage *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x270F9A758]();
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(CPImageSet *)self darkContentImage];
    objc_super v7 = UIImagePNGRepresentation(v6);
    char v8 = [v5 darkContentImage];
    v9 = UIImagePNGRepresentation(v8);
    if ([v7 isEqualToData:v9])
    {
      v15 = [(CPImageSet *)self lightContentImage];
      uint64_t v10 = UIImagePNGRepresentation(v15);
      objc_super v11 = [v5 lightContentImage];
      v12 = UIImagePNGRepresentation(v11);
      char v13 = [v10 isEqualToData:v12];
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (UIImage)lightContentImage
{
  return self->_lightContentImage;
}

- (void)setLightContentImage:(id)a3
{
}

- (UIImage)darkContentImage
{
  return self->_darkContentImage;
}

- (void)setDarkContentImage:(id)a3
{
}

- (CPImageSetAssetRegistration)currentAssetRegistration
{
  return self->_currentAssetRegistration;
}

- (void)setCurrentAssetRegistration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAssetRegistration, 0);
  objc_storeStrong((id *)&self->_darkContentImage, 0);

  objc_storeStrong((id *)&self->_lightContentImage, 0);
}

@end