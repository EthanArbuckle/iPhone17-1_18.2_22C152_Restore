@interface DOCBorderedFittingImageView
- (BOOL)addDecoration;
- (double)decorationCornerRadius;
- (void)initCommon;
- (void)layoutSubviews;
- (void)setAddDecoration:(BOOL)a3;
- (void)setDecorationCornerRadius:(double)a3;
- (void)setFittingSize:(CGSize)a3;
- (void)updateImage:(id)a3 addDecoration:(BOOL)a4;
@end

@implementation DOCBorderedFittingImageView

- (void)setFittingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(DOCFittingImageView *)self fittingSize];
  double v7 = v6;
  double v9 = v8;
  v11.receiver = self;
  v11.super_class = (Class)DOCBorderedFittingImageView;
  -[DOCFittingImageView setFittingSize:](&v11, sel_setFittingSize_, width, height);
  if (v7 != width || v9 != height) {
    [(DOCBorderedFittingImageView *)self setNeedsLayout];
  }
}

- (void)updateImage:(id)a3 addDecoration:(BOOL)a4
{
  BOOL v4 = a4;
  [(DOCFittingImageView *)self setThumbnail:a3];
  [(DOCBorderedFittingImageView *)self setAddDecoration:v4];
  [(DOCBorderedFittingImageView *)self setNeedsLayout];
}

- (void)setAddDecoration:(BOOL)a3
{
  if (self->_addDecoration != a3)
  {
    self->_addDecoration = a3;
    [(DOCBorderedFittingImageView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)DOCBorderedFittingImageView;
  [(DOCFittingImageView *)&v13 layoutSubviews];
  if ([(DOCBorderedFittingImageView *)self addDecoration])
  {
    v3 = [(DOCBorderedFittingImageView *)self traitCollection];
    +[DOCSeparatorView separatorThicknessForTraitCollection:v3];
    double v5 = v4;
    double v6 = [(DOCBorderedFittingImageView *)self layer];
    [v6 setBorderWidth:v5];

    [(DOCBorderedFittingImageView *)self decorationCornerRadius];
    double v8 = v7;
    double v9 = [(DOCBorderedFittingImageView *)self layer];
    v10 = v9;
    double v11 = v8;
  }
  else
  {
    v12 = [(DOCBorderedFittingImageView *)self layer];
    [v12 setBorderWidth:0.0];

    double v9 = [(DOCBorderedFittingImageView *)self layer];
    v10 = v9;
    double v11 = 0.0;
  }
  [v9 setCornerRadius:v11];
}

- (BOOL)addDecoration
{
  return self->_addDecoration;
}

- (double)decorationCornerRadius
{
  double result = self->_decorationCornerRadius;
  if (result < 0.0)
  {
    [(DOCFittingImageView *)self fittingSize];
    double v5 = v4;
    [(DOCFittingImageView *)self fittingSize];
    if (v5 >= v6) {
      double v7 = v5;
    }
    else {
      double v7 = v6;
    }
    double result = v7 * 6.0 * 0.0078125 + -1.0;
    if (result < 3.0) {
      return 3.0;
    }
  }
  return result;
}

- (void)initCommon
{
  self->_decorationCornerRadius = -1.0;
  v2.receiver = self;
  v2.super_class = (Class)DOCBorderedFittingImageView;
  [(DOCFittingImageView *)&v2 initCommon];
}

- (void)setDecorationCornerRadius:(double)a3
{
  if (a3 < 0.0) {
    a3 = -1.0;
  }
  if (self->_decorationCornerRadius != a3)
  {
    self->_decorationCornerRadius = a3;
    [(DOCBorderedFittingImageView *)self setNeedsLayout];
  }
}

@end