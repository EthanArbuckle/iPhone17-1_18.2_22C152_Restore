@interface FIUIChartMultiDashedBackgroundView
+ (id)calculateRoundedLinePositionsForTotalWidth:(double)a3 lineWidth:(double)a4 numberOfLines:(unint64_t)a5 roundedInView:(id)a6;
- (BOOL)backgroundIsTransparent;
- (FIUIChartMultiDashedBackgroundView)initWithFrame:(CGRect)a3;
- (double)lineWidth;
- (double)sublineInset;
- (id)_stretchableLinesPatternImage;
- (unint64_t)numLines;
- (unint64_t)sublineInterval;
- (void)_setNeedsRegenerateBackgroundImage;
- (void)layoutSubviews;
- (void)setBackgroundIsTransparent:(BOOL)a3;
- (void)setLineWidth:(double)a3;
- (void)setNumLines:(unint64_t)a3;
- (void)setSublineInset:(double)a3;
- (void)setSublineInterval:(unint64_t)a3;
@end

@implementation FIUIChartMultiDashedBackgroundView

- (FIUIChartMultiDashedBackgroundView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)FIUIChartMultiDashedBackgroundView;
  v3 = -[FIUIChartBackgroundView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.15];
    lineColor = v3->_lineColor;
    v3->_lineColor = (UIColor *)v4;

    uint64_t v6 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.1];
    subLineColor = v3->_subLineColor;
    v3->_subLineColor = (UIColor *)v6;

    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    imageView = v3->_imageView;
    v3->_imageView = v8;

    [(FIUIChartMultiDashedBackgroundView *)v3 addSubview:v3->_imageView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)FIUIChartMultiDashedBackgroundView;
  [(FIUIChartMultiDashedBackgroundView *)&v18 layoutSubviews];
  [(FIUIChartMultiDashedBackgroundView *)self frame];
  if (v3 != self->_previousWidth)
  {
    [(FIUIChartMultiDashedBackgroundView *)self frame];
    self->_previousWidth = v4;
    v5 = [(FIUIChartMultiDashedBackgroundView *)self _stretchableLinesPatternImage];
    [(UIImageView *)self->_imageView setImage:v5];
  }
  [(FIUIChartMultiDashedBackgroundView *)self bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(FIUIChartBackgroundView *)self lineInsets];
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v7 + v17, v9 + v14, v11 - (v17 + v15), v13 - (v14 + v16));
}

- (void)_setNeedsRegenerateBackgroundImage
{
  self->_previousWidth = 0.0;
  [(FIUIChartMultiDashedBackgroundView *)self setNeedsLayout];
}

- (void)setBackgroundIsTransparent:(BOOL)a3
{
  self->_backgroundIsTransparent = a3;
  [(UIImageView *)self->_imageView setOpaque:!a3];
  [(FIUIChartMultiDashedBackgroundView *)self _setNeedsRegenerateBackgroundImage];
}

- (void)setNumLines:(unint64_t)a3
{
  self->_numLines = a3;
  [(FIUIChartMultiDashedBackgroundView *)self _setNeedsRegenerateBackgroundImage];
}

- (void)setSublineInterval:(unint64_t)a3
{
  self->_sublineInterval = a3;
  [(FIUIChartMultiDashedBackgroundView *)self _setNeedsRegenerateBackgroundImage];
}

- (void)setSublineInset:(double)a3
{
  self->_sublineInset = a3;
  [(FIUIChartMultiDashedBackgroundView *)self _setNeedsRegenerateBackgroundImage];
}

- (id)_stretchableLinesPatternImage
{
  UIRoundToViewScale();
  double v4 = v3;
  double sublineInset = self->_sublineInset;
  UIRoundToViewScale();
  CGFloat v7 = v6;
  [(FIUIChartMultiDashedBackgroundView *)self bounds];
  double v9 = 0;
  if (v8 != 0.0)
  {
    double v10 = v4 + sublineInset;
    if (v10 != 0.0)
    {
      double v11 = v8;
      v28.width = v8;
      v28.height = v10;
      UIGraphicsBeginImageContextWithOptions(v28, !self->_backgroundIsTransparent, 0.0);
      if (self->_backgroundIsTransparent)
      {
        CurrentContext = UIGraphicsGetCurrentContext();
        [(FIUIChartMultiDashedBackgroundView *)self bounds];
        CGContextClearRect(CurrentContext, v29);
      }
      double v13 = [(id)objc_opt_class() calculateRoundedLinePositionsForTotalWidth:self->_numLines lineWidth:self numberOfLines:v11 roundedInView:self->_lineWidth];
      unint64_t numLines = self->_numLines;
      if (numLines)
      {
        unint64_t v15 = 0;
        do
        {
          unint64_t sublineInterval = self->_sublineInterval;
          if (sublineInterval)
          {
            unint64_t v17 = v15 % (sublineInterval + 1);
            unint64_t v18 = v15 + 1;
            BOOL v19 = v15 + 1 == numLines || v17 == 0;
            if (v19) {
              v20 = &OBJC_IVAR___FIUIChartMultiDashedBackgroundView__lineColor;
            }
            else {
              v20 = &OBJC_IVAR___FIUIChartMultiDashedBackgroundView__subLineColor;
            }
            if (v19) {
              CGFloat v21 = v10;
            }
            else {
              CGFloat v21 = v4;
            }
          }
          else
          {
            unint64_t v18 = v15 + 1;
            v20 = &OBJC_IVAR___FIUIChartMultiDashedBackgroundView__lineColor;
            CGFloat v21 = v10;
          }
          [*(id *)((char *)&self->super.super.super.super.isa + *v20) setFill];
          v22 = [v13 objectAtIndexedSubscript:v15];
          [v22 floatValue];
          CGFloat v24 = v23;

          v30.origin.y = 0.0;
          v30.origin.x = v24;
          v30.size.width = v7;
          v30.size.height = v21;
          UIRectFill(v30);
          unint64_t numLines = self->_numLines;
          unint64_t v15 = v18;
        }
        while (v18 < numLines);
      }
      v25 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
      double v9 = objc_msgSend(v25, "resizableImageWithCapInsets:", 0.0, 0.0, self->_sublineInset, 0.0);
    }
  }
  return v9;
}

+ (id)calculateRoundedLinePositionsForTotalWidth:(double)a3 lineWidth:(double)a4 numberOfLines:(unint64_t)a5 roundedInView:(id)a6
{
  id v7 = a6;
  double v8 = [MEMORY[0x263EFF980] array];
  if (a5)
  {
    uint64_t v9 = 0;
    do
    {
      UIRoundToViewScale();
      double v10 = objc_msgSend(NSNumber, "numberWithDouble:");
      [v8 addObject:v10];

      ++v9;
    }
    while (a5 != v9);
  }

  return v8;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (double)sublineInset
{
  return self->_sublineInset;
}

- (unint64_t)numLines
{
  return self->_numLines;
}

- (unint64_t)sublineInterval
{
  return self->_sublineInterval;
}

- (BOOL)backgroundIsTransparent
{
  return self->_backgroundIsTransparent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subLineColor, 0);
  objc_storeStrong((id *)&self->_lineColor, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end