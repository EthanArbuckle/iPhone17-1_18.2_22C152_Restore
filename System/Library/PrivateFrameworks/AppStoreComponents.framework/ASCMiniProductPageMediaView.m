@interface ASCMiniProductPageMediaView
- (ASCMiniProductPageMediaView)initWithCoder:(id)a3;
- (ASCMiniProductPageMediaView)initWithFrame:(CGRect)a3;
- (ASCScreenshots)screenshots;
- (BOOL)shouldPeekNextScreenshot;
- (BOOL)showsPlaceholderContent;
- (CGSize)intrinsicContentSize;
- (CGSize)preferredScreenshotSize;
- (CGSize)screenshotSizeForBoundingSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSMutableArray)imageViews;
- (UIColor)placeholderColor;
- (double)firstScreenshotVerticalFraction;
- (double)screenshotSpacing;
- (double)widthOfScreenshotCount:(unint64_t)a3;
- (id)preferredScreenshotDisplayConfiguration;
- (unint64_t)actualScreenshotCount;
- (unint64_t)maxScreenshotsCount;
- (unint64_t)preferredScreenshotCount;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setImage:(id)a3 atIndex:(int64_t)a4;
- (void)setMaxScreenshotsCount:(unint64_t)a3;
- (void)setPlaceholderColor:(id)a3;
- (void)setScreenshotSpacing:(double)a3;
- (void)setScreenshots:(id)a3;
- (void)setScreenshots:(id)a3 andTrailers:(id)a4;
- (void)setShowsPlaceholderContent:(BOOL)a3;
- (void)updateImageViews;
@end

@implementation ASCMiniProductPageMediaView

- (ASCMiniProductPageMediaView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ASCMiniProductPageMediaView;
  v3 = -[ASCMiniProductPageMediaView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    imageViews = v3->_imageViews;
    v3->_imageViews = (NSMutableArray *)v4;

    -[ASCMiniProductPageMediaView setLayoutMargins:](v3, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  }
  return v3;
}

- (ASCMiniProductPageMediaView)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)setImage:(id)a3 atIndex:(int64_t)a4
{
  id v10 = a3;
  v6 = [(ASCMiniProductPageMediaView *)self imageViews];
  unint64_t v7 = [v6 count];

  if (v7 > a4)
  {
    v8 = [(ASCMiniProductPageMediaView *)self imageViews];
    v9 = [v8 objectAtIndexedSubscript:a4];
    [v9 setImage:v10];
  }
}

- (void)setScreenshots:(id)a3 andTrailers:(id)a4
{
  v8 = (ASCScreenshots *)a3;
  id v6 = a4;
  screenshots = self->_screenshots;
  if (!v8 || !screenshots)
  {
    if (screenshots == v8) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (![(ASCScreenshots *)screenshots isEqual:v8])
  {
LABEL_6:
    [(ASCMiniProductPageMediaView *)self setScreenshots:v8];
    [(ASCMiniProductPageMediaView *)self updateImageViews];
    [(ASCMiniProductPageMediaView *)self invalidateIntrinsicContentSize];
    [(ASCMiniProductPageMediaView *)self setNeedsLayout];
  }
LABEL_7:
}

- (void)setShowsPlaceholderContent:(BOOL)a3
{
  if (((!self->_showsPlaceholderContent ^ a3) & 1) == 0)
  {
    self->_showsPlaceholderContent = a3;
    [(ASCMiniProductPageMediaView *)self updateImageViews];
    [(ASCMiniProductPageMediaView *)self invalidateIntrinsicContentSize];
    [(ASCMiniProductPageMediaView *)self setNeedsLayout];
  }
}

- (void)setPlaceholderColor:(id)a3
{
  unint64_t v7 = (UIColor *)a3;
  v5 = self->_placeholderColor;
  if (!v7 || !v5)
  {

    if (v5 == v7) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  char v6 = [(UIColor *)v5 isEqual:v7];

  if ((v6 & 1) == 0)
  {
LABEL_6:
    objc_storeStrong((id *)&self->_placeholderColor, a3);
    [(ASCMiniProductPageMediaView *)self updateImageViews];
    [(ASCMiniProductPageMediaView *)self invalidateIntrinsicContentSize];
    [(ASCMiniProductPageMediaView *)self setNeedsLayout];
  }
LABEL_7:
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[ASCMiniProductPageMediaView screenshotSizeForBoundingSize:](self, "screenshotSizeForBoundingSize:", a3.width, a3.height);
  double v5 = width;
  result.height = v4;
  result.CGFloat width = v5;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(ASCMiniProductPageMediaView *)self bounds];

  -[ASCMiniProductPageMediaView sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.height = v6;
  result.CGFloat width = v5;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)ASCMiniProductPageMediaView;
  [(ASCMiniProductPageMediaView *)&v31 layoutSubviews];
  [(ASCMiniProductPageMediaView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(ASCMiniProductPageMediaView *)self preferredScreenshotSize];
  double v12 = v11;
  double v14 = v13;
  unint64_t v15 = [(ASCMiniProductPageMediaView *)self actualScreenshotCount];
  double v16 = v4;
  if (v15 < [(ASCMiniProductPageMediaView *)self preferredScreenshotCount])
  {
    [(ASCMiniProductPageMediaView *)self widthOfScreenshotCount:[(ASCMiniProductPageMediaView *)self actualScreenshotCount]];
    double v18 = v17;
    [(ASCMiniProductPageMediaView *)self bounds];
    double v16 = (v19 - v18) * 0.5;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v20 = [(ASCMiniProductPageMediaView *)self imageViews];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v27 + 1) + 8 * v24);
        +[__ASCLayoutProxy rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:](__ASCLayoutProxy, "rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:", self, v16, v6, v12, v14, v4, v6, v8, v10);
        objc_msgSend(v25, "setFrame:");
        [(ASCMiniProductPageMediaView *)self screenshotSpacing];
        double v16 = v12 + v16 + v26;
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v22);
  }
}

- (unint64_t)preferredScreenshotCount
{
  double v3 = [(ASCMiniProductPageMediaView *)self screenshots];
  double v4 = [v3 artwork];
  double v5 = [v4 firstObject];

  if (v5)
  {
    if ([v5 isPortrait]) {
      unint64_t v6 = 3;
    }
    else {
      unint64_t v6 = 1;
    }
  }
  else if ([(ASCMiniProductPageMediaView *)self showsPlaceholderContent])
  {
    double v7 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v7 userInterfaceIdiom] == 1) {
      unint64_t v6 = 1;
    }
    else {
      unint64_t v6 = 3;
    }
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)actualScreenshotCount
{
  double v3 = [(ASCMiniProductPageMediaView *)self screenshots];
  if (v3)
  {

    goto LABEL_7;
  }
  if (![(ASCMiniProductPageMediaView *)self showsPlaceholderContent])
  {
LABEL_7:
    double v5 = [(ASCMiniProductPageMediaView *)self screenshots];
    unint64_t v6 = [v5 artwork];
    unint64_t v7 = [v6 count];

    unint64_t result = [(ASCMiniProductPageMediaView *)self preferredScreenshotCount];
    if (v7 < result) {
      return v7;
    }
    return result;
  }

  return [(ASCMiniProductPageMediaView *)self preferredScreenshotCount];
}

- (BOOL)shouldPeekNextScreenshot
{
  double v9 = self;
  v2 = [(ASCMiniProductPageMediaView *)self screenshots];
  double v3 = [v2 artwork];
  double v4 = [v3 firstObject];

  double v5 = [(ASCMiniProductPageMediaView *)v9 screenshots];
  unint64_t v6 = [v5 artwork];
  unint64_t v7 = [v6 count];
  unint64_t v8 = [(ASCMiniProductPageMediaView *)v9 actualScreenshotCount];

  LOBYTE(v9) = 0;
  if (v7 > v8 && v4) {
    LODWORD(v9) = [v4 isPortrait] ^ 1;
  }

  return (char)v9;
}

- (CGSize)preferredScreenshotSize
{
  [(ASCMiniProductPageMediaView *)self bounds];

  -[ASCMiniProductPageMediaView screenshotSizeForBoundingSize:](self, "screenshotSizeForBoundingSize:", v3, v4);
  result.height = v6;
  result.CGFloat width = v5;
  return result;
}

- (CGSize)screenshotSizeForBoundingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(ASCMiniProductPageMediaView *)self firstScreenshotVerticalFraction];
  double v7 = v6;
  unint64_t v8 = [(ASCMiniProductPageMediaView *)self preferredScreenshotCount];
  double v9 = *MEMORY[0x1E4F1DB30];
  double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if ((height != v10 || width != v9) && v8 != 0)
  {
    unint64_t v13 = v8;
    [(ASCMiniProductPageMediaView *)self screenshotSpacing];
    double v15 = (width - v14 * (double)(v13 - 1)) / (double)v13;
    double v16 = v7 * v15;
    double v9 = ceil(v15);
    double v10 = ceil(v16);
  }
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (double)firstScreenshotVerticalFraction
{
  v2 = [(ASCMiniProductPageMediaView *)self screenshots];
  double v3 = [v2 artwork];
  double v4 = [v3 firstObject];

  if (v4)
  {
    [v4 height];
    double v6 = v5;
    [v4 width];
    double v8 = v6 / v7;
  }
  else
  {
    double v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;

    double v14 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v15 = [v14 userInterfaceIdiom];

    if (v15)
    {
      if (v11 >= v13) {
        double v16 = v13;
      }
      else {
        double v16 = v11;
      }
      if (v11 >= v13) {
        double v17 = v11;
      }
      else {
        double v17 = v13;
      }
    }
    else
    {
      if (v11 >= v13) {
        double v16 = v11;
      }
      else {
        double v16 = v13;
      }
      if (v11 >= v13) {
        double v17 = v13;
      }
      else {
        double v17 = v11;
      }
    }
    double v8 = v16 / v17;
  }

  return v8;
}

- (id)preferredScreenshotDisplayConfiguration
{
  double v3 = [(ASCMiniProductPageMediaView *)self screenshots];

  if (v3)
  {
    double v4 = [(ASCMiniProductPageMediaView *)self screenshots];
    double v5 = [v4 mediaPlatform];
    double v6 = [v5 deviceCornerRadiusFactor];

    double v7 = [[ASCScreenshotDisplayConfiguration alloc] initWithDeviceCornerRadiusFactor:v6];
  }
  else
  {
    double v7 = +[ASCScreenshotDisplayConfiguration defaultConfiguration];
  }

  return v7;
}

- (double)widthOfScreenshotCount:(unint64_t)a3
{
  if (!a3) {
    return 0.0;
  }
  [(ASCMiniProductPageMediaView *)self preferredScreenshotSize];
  double v6 = v5 * (double)a3;
  [(ASCMiniProductPageMediaView *)self screenshotSpacing];
  return v6 + v7 * (double)(a3 - 1);
}

- (void)updateImageViews
{
  BOOL v3 = [(ASCMiniProductPageMediaView *)self shouldPeekNextScreenshot];
  unint64_t v4 = [(ASCMiniProductPageMediaView *)self actualScreenshotCount] + v3;
  id v38 = [(ASCMiniProductPageMediaView *)self preferredScreenshotDisplayConfiguration];
  double v5 = [(ASCMiniProductPageMediaView *)self imageViews];
  unint64_t v6 = [v5 count];

  if (v6 >= v4) {
    unint64_t v7 = v4;
  }
  else {
    unint64_t v7 = v6;
  }
  if (v7)
  {
    unint64_t v8 = 0;
    do
    {
      double v9 = [(ASCMiniProductPageMediaView *)self screenshots];

      if (!v9)
      {
        double v10 = [(ASCMiniProductPageMediaView *)self imageViews];
        double v11 = [v10 objectAtIndexedSubscript:v8];
        [v11 setImage:0];
      }
      double v12 = [(ASCMiniProductPageMediaView *)self imageViews];
      double v13 = [v12 objectAtIndexedSubscript:v8];
      [v13 setScreenshotDisplayConfiguration:v38];

      double v14 = [(ASCMiniProductPageMediaView *)self placeholderColor];
      uint64_t v15 = [(ASCMiniProductPageMediaView *)self imageViews];
      double v16 = [v15 objectAtIndexedSubscript:v8];
      [v16 setPlaceholderColor:v14];

      ++v8;
      double v17 = [(ASCMiniProductPageMediaView *)self imageViews];
      unint64_t v18 = [v17 count];

      if (v18 >= v4) {
        unint64_t v19 = v4;
      }
      else {
        unint64_t v19 = v18;
      }
    }
    while (v19 > v8);
  }
  v20 = [(ASCMiniProductPageMediaView *)self imageViews];
  uint64_t v21 = [v20 count];

  if (v21 != v4)
  {
    double v22 = *MEMORY[0x1E4F1DB28];
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v26 = *MEMORY[0x1E4FB2558];
    do
    {
      long long v27 = [(ASCMiniProductPageMediaView *)self imageViews];
      unint64_t v28 = [v27 count];

      if (v28 >= v4)
      {
        v34 = [(ASCMiniProductPageMediaView *)self imageViews];
        long long v29 = [v34 lastObject];

        if (v29)
        {
          v35 = [(ASCMiniProductPageMediaView *)self imageViews];
          [v35 removeLastObject];

          [(ASCArtworkView *)v29 removeFromSuperview];
        }
      }
      else
      {
        long long v29 = -[ASCArtworkView initWithFrame:]([ASCArtworkView alloc], "initWithFrame:", v22, v23, v24, v25);
        [(ASCArtworkView *)v29 setScreenshotDisplayConfiguration:v38];
        [(ASCArtworkView *)v29 setDecoration:@"screenshot"];
        long long v30 = [(ASCMiniProductPageMediaView *)self placeholderColor];
        [(ASCArtworkView *)v29 setPlaceholderColor:v30];

        [(ASCArtworkView *)v29 setUserInteractionEnabled:0];
        [(ASCArtworkView *)v29 setIsAccessibilityElement:1];
        [(ASCArtworkView *)v29 setAccessibilityTraits:v26];
        v32 = ASCLocalizedString(@"AX_ARTWORK", v31);
        [(ASCArtworkView *)v29 setAccessibilityLabel:v32];

        uint64_t v33 = [(ASCMiniProductPageMediaView *)self imageViews];
        [v33 addObject:v29];

        [(ASCMiniProductPageMediaView *)self addSubview:v29];
      }

      v36 = [(ASCMiniProductPageMediaView *)self imageViews];
      uint64_t v37 = [v36 count];
    }
    while (v37 != v4);
  }
}

- (unint64_t)maxScreenshotsCount
{
  return self->_maxScreenshotsCount;
}

- (void)setMaxScreenshotsCount:(unint64_t)a3
{
  self->_maxScreenshotsCount = a3;
}

- (double)screenshotSpacing
{
  return self->_screenshotSpacing;
}

- (void)setScreenshotSpacing:(double)a3
{
  self->_screenshotSpacing = a3;
}

- (ASCScreenshots)screenshots
{
  return self->_screenshots;
}

- (void)setScreenshots:(id)a3
{
}

- (NSMutableArray)imageViews
{
  return self->_imageViews;
}

- (BOOL)showsPlaceholderContent
{
  return self->_showsPlaceholderContent;
}

- (UIColor)placeholderColor
{
  return self->_placeholderColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);

  objc_storeStrong((id *)&self->_screenshots, 0);
}

@end