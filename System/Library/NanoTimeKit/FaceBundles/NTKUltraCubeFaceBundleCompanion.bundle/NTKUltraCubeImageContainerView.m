@interface NTKUltraCubeImageContainerView
- (NSArray)imageFilters;
- (NTKUltraCubeImageContainerView)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (UIImageView)imageView;
- (void)_generateMaskingLayerForImage:(id)a3;
- (void)_updateTransform;
- (void)applyColorRamp:(id)a3 colorRampAmount:(double)a4 monochromeColorMatrix:(id)a5;
- (void)removeColorRamp;
- (void)setContentAlpha:(double)a3;
- (void)setContentBackgroundColor:(id)a3;
- (void)setContentRoll:(double)a3 pitch:(double)a4;
- (void)setContentScale:(double)a3;
- (void)setContentsMultiplyByWhite:(double)a3 alpha:(double)a4;
- (void)setImage:(id)a3;
- (void)setImageBlur:(double)a3;
- (void)setImageFilters:(id)a3;
- (void)setImageView:(id)a3;
- (void)setImageViewHidden:(BOOL)a3;
@end

@implementation NTKUltraCubeImageContainerView

- (NTKUltraCubeImageContainerView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NTKUltraCubeImageContainerView;
  v3 = -[NTKUltraCubeImageContainerView initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)UIView);
    [(NTKUltraCubeImageContainerView *)v3 bounds];
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    contentView = v3->_contentView;
    v3->_contentView = v5;

    [(NTKUltraCubeImageContainerView *)v3 addSubview:v3->_contentView];
    id v7 = objc_alloc((Class)UIImageView);
    [(NTKUltraCubeImageContainerView *)v3 bounds];
    v8 = (UIImageView *)objc_msgSend(v7, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = v8;

    [(UIView *)v3->_contentView addSubview:v3->_imageView];
    v3->_contentAlpha = 1.0;
    v3->_contentScale = 1.0;
    v3->_contentsMultiplyAlpha = 1.0;
    v3->_contentsMultiplyWhite = 1.0;
    v3->_contentRoll = 0.0;
    v3->_contentPitch = 0.0;
    [(NTKUltraCubeImageContainerView *)v3 _updateTransform];
  }
  return v3;
}

- (void)setImage:(id)a3
{
  imageView = self->_imageView;
  id v6 = a3;
  v5 = [(UIImageView *)imageView layer];
  [v5 setMask:0];

  [(UIImageView *)self->_imageView setImage:v6];
  [(NTKUltraCubeImageContainerView *)self _generateMaskingLayerForImage:v6];
}

- (void)_generateMaskingLayerForImage:(id)a3
{
  id v4 = a3;
  v5 = +[CALayer layer];
  maskingImageLayer = self->_maskingImageLayer;
  self->_maskingImageLayer = v5;

  [(NTKUltraCubeImageContainerView *)self bounds];
  -[CALayer setFrame:](self->_maskingImageLayer, "setFrame:");
  id v7 = v4;
  v8 = (CGImage *)[v7 CGImage];

  CGImageRef Copy = CGImageCreateCopy(v8);
  [(CALayer *)self->_maskingImageLayer setContents:Copy];
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (NSArray)imageFilters
{
  v2 = [(UIImageView *)self->_imageView layer];
  v3 = [v2 filters];

  return (NSArray *)v3;
}

- (void)setImageFilters:(id)a3
{
  imageView = self->_imageView;
  id v4 = a3;
  id v5 = [(UIImageView *)imageView layer];
  [v5 setFilters:v4];
}

- (void)setImageViewHidden:(BOOL)a3
{
}

- (void)setContentAlpha:(double)a3
{
  if (self->_contentAlpha != a3)
  {
    self->_contentAlpha = a3;
    -[UIView setAlpha:](self->_contentView, "setAlpha:");
  }
}

- (void)setContentsMultiplyByWhite:(double)a3 alpha:(double)a4
{
  if (self->_contentsMultiplyWhite != a3 || self->_contentsMultiplyAlpha != a4)
  {
    self->_contentsMultiplyWhite = a3;
    self->_contentsMultiplyAlpha = a4;
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:");
    id v5 = objc_claimAutoreleasedReturnValue();
    id v6 = [v5 CGColor];

    id v7 = [(UIView *)self->_contentView layer];
    [v7 setContentsMultiplyColor:v6];
  }
}

- (void)setContentScale:(double)a3
{
  if (self->_contentScale != a3)
  {
    self->_contentScale = a3;
    [(NTKUltraCubeImageContainerView *)self _updateTransform];
  }
}

- (void)setContentRoll:(double)a3 pitch:(double)a4
{
  if (self->_contentRoll != a3 || self->_contentPitch != a4)
  {
    self->_contentRoll = a3;
    self->_contentPitch = a4;
    [(NTKUltraCubeImageContainerView *)self _updateTransform];
  }
}

- (void)applyColorRamp:(id)a3 colorRampAmount:(double)a4 monochromeColorMatrix:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  v9 = [(UIImageView *)self->_imageView layer];
  v10 = [v9 mask];

  if (!v10)
  {
    maskingImageLayer = self->_maskingImageLayer;
    v12 = [(UIImageView *)self->_imageView layer];
    [v12 setMask:maskingImageLayer];
  }
  +[NTKPhotosColorPalette applyColorRamp:v13 colorRampAmount:v8 monochromeColorMatrix:self->_imageView toView:a4];
}

- (void)removeColorRamp
{
  +[NTKPhotosColorPalette removeColorRampFromView:self->_imageView];
  id v3 = [(UIImageView *)self->_imageView layer];
  [v3 setMask:0];
}

- (void)setContentBackgroundColor:(id)a3
{
}

- (void)_updateTransform
{
  memset(&v10, 0, sizeof(v10));
  double contentRoll = self->_contentRoll;
  double contentPitch = self->_contentPitch;
  if (fabs(contentRoll) >= 0.00000011920929
    || fabs(contentPitch) >= 0.00000011920929
    || fabs(self->_contentScale + -1.0) >= 0.00000011920929)
  {
    memset(&v9, 0, sizeof(v9));
    CGAffineTransformMakeTranslation(&v9, contentRoll, contentPitch);
    double contentScale = self->_contentScale;
    CGAffineTransform v8 = v9;
    CGAffineTransformScale(&v10, &v8, contentScale, contentScale);
  }
  else
  {
    long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v10.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v10.c = v5;
    *(_OWORD *)&v10.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  contentView = self->_contentView;
  CGAffineTransform v9 = v10;
  [(UIView *)contentView setTransform:&v9];
}

- (void)setImageBlur:(double)a3
{
  if (self->_imageBlur != a3)
  {
    self->_imageBlur = a3;
    id v4 = [(UIImageView *)self->_imageView layer];
    long long v5 = [v4 filters];
    id v6 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v13 = objc_msgSend(v12, "name", (void)v17);
          unsigned __int8 v14 = [v13 isEqualToString:@"NTKUltraCubeContentViewBlurFilter"];

          if ((v14 & 1) == 0) {
            [v6 addObject:v12];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    if (fabs(a3) >= 0.00000011920929)
    {
      v15 = +[CAFilter filterWithType:kCAFilterGaussianBlur];
      [v15 setValue:&__kCFBooleanTrue forKey:@"inputHardEdges"];
      [v15 setValue:&__kCFBooleanTrue forKey:@"inputNormalizeEdges"];
      [v15 setValue:@"low" forKey:@"inputQuality"];
      [v15 setValue:@"low" forKey:@"inputIntermediateBitDepth"];
      [v15 setName:@"NTKUltraCubeContentViewBlurFilter"];
      v16 = +[NSNumber numberWithDouble:a3];
      [v15 setValue:v16 forKey:@"inputRadius"];

      [v6 addObject:v15];
    }
    objc_msgSend(v4, "setFilters:", v6, (void)v17);
  }
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_maskingImageLayer, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end