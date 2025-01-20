@interface PKStrokeSelectionImage
- (PKStrokeSelectionImage)initWithImage:(id)a3 config:(id)a4 fullSizeConfig:(id)a5;
- (PKStrokeSelectionImageConfig)config;
- (PKStrokeSelectionImageConfig)fullSizeConfig;
- (UIImage)addImage;
- (UIImage)combinedImage;
- (UIImage)image;
- (UIImage)mulImage;
- (void)setAddImage:(id)a3;
- (void)setImage:(id)a3;
- (void)setMulImage:(id)a3;
@end

@implementation PKStrokeSelectionImage

- (PKStrokeSelectionImage)initWithImage:(id)a3 config:(id)a4 fullSizeConfig:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(PKStrokeSelectionImage *)self init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_image, a3);
    objc_storeStrong((id *)&v13->_config, a4);
    objc_storeStrong((id *)&v13->_fullSizeConfig, a5);
  }

  return v13;
}

- (UIImage)combinedImage
{
  addImage = self->_addImage;
  if (addImage && self->_mulImage)
  {
    v4 = [(UIImage *)addImage CGImage];
    uint64_t v5 = CGBitmapContextCreateForFlatteningImage();
    if (!v5) {
      goto LABEL_13;
    }
    v6 = (CGContext *)v5;
    double Width = (double)CGImageGetWidth(v4);
    double Height = (double)CGImageGetHeight(v4);
    id v9 = [MEMORY[0x1E4FB1618] whiteColor];
    CGContextSetFillColorWithColor(v6, (CGColorRef)[v9 CGColor]);

    v21.origin.x = 0.0;
    v21.origin.y = 0.0;
    v21.size.width = Width;
    v21.size.height = Height;
    CGContextFillRect(v6, v21);
    image = self->_image;
    if (image)
    {
      id v11 = [(UIImage *)image CGImage];
      v22.origin.x = 0.0;
      v22.origin.y = 0.0;
      v22.size.width = Width;
      v22.size.height = Height;
      CGContextDrawImage(v6, v22, v11);
    }
    if (self->_mulImage)
    {
      CGContextSetBlendMode(v6, kCGBlendModeMultiply);
      v12 = [(UIImage *)self->_mulImage CGImage];
      v23.origin.x = 0.0;
      v23.origin.y = 0.0;
      v23.size.width = Width;
      v23.size.height = Height;
      CGContextDrawImage(v6, v23, v12);
    }
    if (self->_addImage)
    {
      CGContextSetBlendMode(v6, kCGBlendModePlusLighter);
      v13 = [(UIImage *)self->_addImage CGImage];
      v24.origin.x = 0.0;
      v24.origin.y = 0.0;
      v24.size.width = Width;
      v24.size.height = Height;
      CGContextDrawImage(v6, v24, v13);
    }
    v14 = CGBitmapContextCreateImage(v6);
    CGContextRelease(v6);
    if (v14)
    {
      v15 = (void *)MEMORY[0x1E4FB1818];
      v16 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v16 scale];
      objc_msgSend(v15, "imageWithCGImage:scale:orientation:", v14, -[UIImage imageOrientation](self->_addImage, "imageOrientation"), v17);
      v18 = (UIImage *)objc_claimAutoreleasedReturnValue();

      CGImageRelease(v14);
    }
    else
    {
LABEL_13:
      v18 = 0;
    }
  }
  else
  {
    v18 = self->_image;
  }

  return v18;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (PKStrokeSelectionImageConfig)config
{
  return self->_config;
}

- (PKStrokeSelectionImageConfig)fullSizeConfig
{
  return self->_fullSizeConfig;
}

- (UIImage)addImage
{
  return self->_addImage;
}

- (void)setAddImage:(id)a3
{
}

- (UIImage)mulImage
{
  return self->_mulImage;
}

- (void)setMulImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mulImage, 0);
  objc_storeStrong((id *)&self->_addImage, 0);
  objc_storeStrong((id *)&self->_fullSizeConfig, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end