@interface CLKUIColoringImageView
- (BOOL)usesLegibility;
- (CGSize)maxSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CLKImageProvider)imageProvider;
- (CLKUIColoringImageView)initWithFrame:(CGRect)a3;
- (CLKUIColoringImageView)initWithImage:(id)a3;
- (CLKUIColoringImageView)initWithImage:(id)a3 highlightedImage:(id)a4;
- (UIColor)overrideColor;
- (int64_t)symbolImageType;
- (void)_commonInit;
- (void)setImage:(id)a3;
- (void)setImageProvider:(id)a3;
- (void)setMaxSize:(CGSize)a3;
- (void)setOverrideColor:(id)a3;
- (void)setSymbolImageType:(int64_t)a3;
- (void)sizeToFit;
@end

@implementation CLKUIColoringImageView

- (void)_commonInit
{
  self->_maxSize = (CGSize)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  self->_symbolImageType = 1;
}

- (CLKUIColoringImageView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLKUIColoringImageView;
  v3 = -[CLKUIColoringImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CLKUIColoringImageView *)v3 _commonInit];
  }
  return v4;
}

- (CLKUIColoringImageView)initWithImage:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLKUIColoringImageView;
  v3 = [(CLKUIColoringImageView *)&v6 initWithImage:a3];
  v4 = v3;
  if (v3) {
    [(CLKUIColoringImageView *)v3 _commonInit];
  }
  return v4;
}

- (CLKUIColoringImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CLKUIColoringImageView;
  v4 = [(CLKUIColoringImageView *)&v7 initWithImage:a3 highlightedImage:a4];
  v5 = v4;
  if (v4) {
    [(CLKUIColoringImageView *)v4 _commonInit];
  }
  return v5;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  if ([v4 renderingMode] != 2)
  {
    uint64_t v5 = [v4 imageWithRenderingMode:2];

    id v4 = (id)v5;
  }
  v6.receiver = self;
  v6.super_class = (Class)CLKUIColoringImageView;
  [(CLKUIColoringImageView *)&v6 setImage:v4];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v4 = [(CLKUIColoringImageView *)self image];
  [v4 size];
  double v6 = v5;
  double v8 = v7;

  imageProvider = self->_imageProvider;
  if (imageProvider)
  {
    [(CLKImageProvider *)imageProvider maxSize];
    double width = v10;
    double height = v12;
  }
  else
  {
    double width = self->_maxSize.width;
    double height = self->_maxSize.height;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  v14 = [(CLKImageProvider *)self->_imageProvider pointSize];
  if (v14)
  {

LABEL_8:
    v16 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    v17 = [v16 device];

    CLKFloorForDevice();
    double v6 = v18;
    CLKFloorForDevice();
    double v8 = v19;

    goto LABEL_9;
  }
  v15 = [(CLKImageProvider *)self->_imageProvider overridePointSize];

  if (v15) {
    goto LABEL_8;
  }
  if (v6 != 0.0 && v8 != 0.0)
  {
    if (width / v6 >= height / v8)
    {
      double v6 = v6 * height / v8;
      double v8 = height;
    }
    else
    {
      double v8 = v8 * width / v6;
      double v6 = width;
    }
  }
LABEL_9:
  double v20 = v6;
  double v21 = v8;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (void)sizeToFit
{
  v3 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  id v4 = [v3 device];

  [(CLKUIColoringImageView *)self transform];
  if (CGAffineTransformIsIdentity(&v9))
  {
    [(CLKUIColoringImageView *)self frame];
    -[CLKUIColoringImageView sizeThatFits:](self, "sizeThatFits:", v5, v6);
    CLKPixelAlignRectForDevice();
    -[CLKUIColoringImageView setFrame:](self, "setFrame:");
  }
  else
  {
    [(CLKUIColoringImageView *)self bounds];
    -[CLKUIColoringImageView sizeThatFits:](self, "sizeThatFits:", v7, v8);
    CLKPixelAlignRectForDevice();
    -[CLKUIColoringImageView setBounds:](self, "setBounds:");
  }
}

- (UIColor)overrideColor
{
  overrideColor = self->_overrideColor;
  if (overrideColor)
  {
    v3 = overrideColor;
  }
  else
  {
    v3 = [(CLKImageProvider *)self->_imageProvider tintColor];
  }
  return v3;
}

- (void)setImageProvider:(id)a3
{
  p_imageProvider = (id *)&self->_imageProvider;
  id v12 = a3;
  if ((objc_msgSend(*p_imageProvider, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_imageProvider, a3);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v7 = *p_imageProvider;
    if (isKindOfClass)
    {
      int64_t symbolImageType = self->_symbolImageType;
      CGAffineTransform v9 = [(CLKUIColoringImageView *)self color];
      double v10 = v9;
      if (!v9)
      {
        double v10 = [(CLKUIColoringImageView *)self overrideColor];
      }
      v11 = [v7 createSymbolImageForType:symbolImageType color:v10];
      [(CLKUIColoringImageView *)self setImage:v11];

      if (!v9) {
    }
      }
    else
    {
      CGAffineTransform v9 = [*p_imageProvider onePieceImage];
      [(CLKUIColoringImageView *)self setImage:v9];
    }
  }
}

- (BOOL)usesLegibility
{
  return 0;
}

- (void)setOverrideColor:(id)a3
{
}

- (CGSize)maxSize
{
  double width = self->_maxSize.width;
  double height = self->_maxSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaxSize:(CGSize)a3
{
  self->_maxSize = a3;
}

- (CLKImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (int64_t)symbolImageType
{
  return self->_symbolImageType;
}

- (void)setSymbolImageType:(int64_t)a3
{
  self->_int64_t symbolImageType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_overrideColor, 0);
}

@end