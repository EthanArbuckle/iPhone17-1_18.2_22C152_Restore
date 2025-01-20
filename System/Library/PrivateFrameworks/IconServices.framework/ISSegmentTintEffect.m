@interface ISSegmentTintEffect
- (CIImage)segmentedImage;
- (IFColor)color;
- (ISSegmentTintEffect)initWithColor:(id)a3;
- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4;
- (void)prepareSegmentedImageFromImage:(id)a3;
- (void)setColor:(id)a3;
- (void)setSegmentedImage:(id)a3;
@end

@implementation ISSegmentTintEffect

- (ISSegmentTintEffect)initWithColor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISSegmentTintEffect;
  v6 = [(ISSegmentTintEffect *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_color, a3);
  }

  return v7;
}

- (void)prepareSegmentedImageFromImage:(id)a3
{
  id v9 = a3;
  v4 = +[ISDefaults sharedInstance];
  if (([(ISIconSegmentation *)v4 disableLegacyIconSegmentation] & 1) == 0)
  {
    id v5 = [(ISSegmentTintEffect *)self segmentedImage];

    if (v5) {
      goto LABEL_6;
    }
    v4 = objc_alloc_init(ISIconSegmentation);
    uint64_t v6 = -[ISIconSegmentation createTintableImageWithCGImage:](v4, "createTintableImageWithCGImage:", [v9 CGImage]);
    if (v6)
    {
      v7 = (const void *)v6;
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F1E050]) initWithCGImage:v6];
      CFRelease(v7);
      [(ISSegmentTintEffect *)self setSegmentedImage:v8];
    }
  }

LABEL_6:
}

- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1B3E70EF0]();
  [(ISSegmentTintEffect *)self prepareSegmentedImageFromImage:v7];
  id v9 = [(ISSegmentTintEffect *)self segmentedImage];

  if (v9)
  {
    v10 = [ISTemplateTintEffect alloc];
    v11 = [(ISSegmentTintEffect *)self color];
    v12 = [(ISTemplateTintEffect *)v10 initWithColor:v11];

    v13 = [(ISSegmentTintEffect *)self segmentedImage];
    v14 = [(ISTemplateTintEffect *)v12 filterWithBackgroundImage:v6 inputImage:v13];
  }
  else
  {
    v13 = objc_alloc_init(ISGreyscaleEffect);
    v15 = [(ISGreyscaleEffect *)v13 filterWithBackgroundImage:v6 inputImage:v7];
    v16 = [MEMORY[0x1E4F1E040] filterWithName:@"CIConstantColorGenerator"];
    v17 = [(ISSegmentTintEffect *)self color];
    v18 = [v17 ciColor];
    [v16 setValue:v18 forKey:*MEMORY[0x1E4F1E448]];

    v19 = [MEMORY[0x1E4F1E040] filterWithName:@"CIMultiplyCompositing"];
    v20 = [v16 outputImage];
    [v19 setValue:v20 forKey:*MEMORY[0x1E4F1E480]];

    v21 = [v15 outputImage];
    [v19 setValue:v21 forKey:*MEMORY[0x1E4F1E418]];

    v12 = v19;
    v14 = v12;
  }

  return v14;
}

- (IFColor)color
{
  return (IFColor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setColor:(id)a3
{
}

- (CIImage)segmentedImage
{
  return (CIImage *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSegmentedImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedImage, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end