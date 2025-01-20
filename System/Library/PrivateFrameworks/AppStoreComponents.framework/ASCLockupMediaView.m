@interface ASCLockupMediaView
- (ASCLockupMediaView)initWithCoder:(id)a3;
- (ASCLockupMediaView)initWithFrame:(CGRect)a3;
- (ASCScreenshots)screenshots;
- (ASCTrailers)trailers;
- (ASCVideoView)videoView;
- (BOOL)isVideoLoopingEnabled;
- (BOOL)isVideoMuted;
- (CGSize)estimatedMediaContentSize;
- (CGSize)intrinsicContentSize;
- (CGSize)preferredScreenshotSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)mediaViews;
- (NSMutableArray)imageViews;
- (NSString)context;
- (UIEdgeInsets)layoutMarginsForCurrentContext;
- (UIView)containerView;
- (id)accessibilityElements;
- (id)makeLayout;
- (id)makeSizingLayout;
- (unint64_t)numberOfImageViews;
- (unint64_t)numberOfViews;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateIntrinsicContentSize;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setContext:(id)a3;
- (void)setImage:(id)a3 atIndex:(int64_t)a4;
- (void)setNumberOfViews:(unint64_t)a3;
- (void)setScreenshots:(id)a3;
- (void)setScreenshots:(id)a3 andTrailers:(id)a4;
- (void)setTrailers:(id)a3;
- (void)setVideoLoopingEnabled:(BOOL)a3;
- (void)setVideoMuted:(BOOL)a3;
- (void)setVideoView:(id)a3;
- (void)updateImageViews;
@end

@implementation ASCLockupMediaView

- (ASCLockupMediaView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)ASCLockupMediaView;
  v3 = -[ASCLockupMediaView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_numberOfViews = 0;
    id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    containerView = v4->_containerView;
    v4->_containerView = (UIView *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    imageViews = v4->_imageViews;
    v4->_imageViews = (NSMutableArray *)v8;

    videoView = v4->_videoView;
    v4->_videoView = 0;

    screenshots = v4->_screenshots;
    v4->_screenshots = 0;

    trailers = v4->_trailers;
    v4->_trailers = 0;

    v4->_videoLoopingEnabled = 1;
    v4->_videoMuted = 1;
    -[ASCLockupMediaView setLayoutMargins:](v4, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(UIView *)v4->_containerView setUserInteractionEnabled:0];
    [(ASCLockupMediaView *)v4 addSubview:v4->_containerView];
    [(ASCLockupMediaView *)v4 setClipsToBounds:1];
  }
  return v4;
}

- (ASCLockupMediaView)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CGSize)preferredScreenshotSize
{
  [(ASCLockupMediaView *)self estimatedMediaContentSize];
  double v4 = v3;
  double v6 = v5;
  v7 = [(ASCLockupMediaView *)self context];
  uint64_t v8 = [(ASCLockupMediaView *)self screenshots];
  v9 = [(ASCLockupMediaView *)self trailers];
  v10 = [(UIView *)self asc_layoutTraitEnvironment];
  +[__ASCLayoutProxy lockupMediaPreferredMediaSizeWithFitting:for:with:and:in:](__ASCLayoutProxy, "lockupMediaPreferredMediaSizeWithFitting:for:with:and:in:", v7, v8, v9, v10, v4, v6);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)setVideoView:(id)a3
{
  v10 = (ASCVideoView *)a3;
  p_videoView = &self->_videoView;
  double v6 = self->_videoView;
  if (v10 && v6)
  {
    char v7 = [(ASCVideoView *)v6 isEqual:v10];

    if (v7) {
      goto LABEL_11;
    }
  }
  else
  {

    if (v6 == v10) {
      goto LABEL_11;
    }
  }
  uint64_t v8 = [(ASCVideoView *)*p_videoView superview];

  if (v8) {
    [(ASCVideoView *)*p_videoView removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_videoView, a3);
  if (*p_videoView)
  {
    [(ASCVideoView *)*p_videoView setLoopingEnabled:[(ASCLockupMediaView *)self isVideoLoopingEnabled]];
    [(ASCVideoView *)*p_videoView setMuted:[(ASCLockupMediaView *)self isVideoMuted]];
    v9 = [(ASCLockupMediaView *)self containerView];
    [v9 addSubview:*p_videoView];
  }
  [(ASCLockupMediaView *)self updateImageViews];
  [(ASCLockupMediaView *)self setNeedsLayout];
  [(ASCLockupMediaView *)self invalidateIntrinsicContentSize];
LABEL_11:
}

- (NSArray)mediaViews
{
  double v3 = [MEMORY[0x1E4F1CA48] array];
  double v4 = [(ASCLockupMediaView *)self videoView];

  if (v4)
  {
    double v5 = [(ASCLockupMediaView *)self videoView];
    [v3 addObject:v5];
  }
  double v6 = [(ASCLockupMediaView *)self imageViews];
  [v3 addObjectsFromArray:v6];

  return (NSArray *)v3;
}

- (void)setVideoLoopingEnabled:(BOOL)a3
{
  if (self->_videoLoopingEnabled != a3)
  {
    BOOL v3 = a3;
    self->_videoLoopingEnabled = a3;
    id v4 = [(ASCLockupMediaView *)self videoView];
    [v4 setLoopingEnabled:v3];
  }
}

- (void)setVideoMuted:(BOOL)a3
{
  if (self->_videoMuted != a3)
  {
    BOOL v3 = a3;
    self->_videoMuted = a3;
    id v4 = [(ASCLockupMediaView *)self videoView];
    [v4 setMuted:v3];
  }
}

- (void)setContext:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_context, a3);
  if (ASCLockupContextIsAdGridContext(v9))
  {
    double v5 = (void *)MEMORY[0x1E4FB1618];
    double v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.93333333 green:0.93333333 blue:0.93333333 alpha:1.0];
    char v7 = [MEMORY[0x1E4FB1618] colorWithRed:0.12941176 green:0.12941176 blue:0.12941176 alpha:1.0];
    uint64_t v8 = objc_msgSend(v5, "asc_colorWithLightColor:darkColor:", v6, v7);
    [(ASCLockupMediaView *)self setBackgroundColor:v8];
  }
  else
  {
    [(ASCLockupMediaView *)self setBackgroundColor:0];
  }
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)ASCLockupMediaView;
  [(ASCLockupMediaView *)&v3 layoutMarginsDidChange];
  if (self)
  {
    [(ASCLockupMediaView *)self updateImageViews];
    [(ASCLockupMediaView *)self setNeedsLayout];
    [(ASCLockupMediaView *)self invalidateIntrinsicContentSize];
  }
}

- (id)makeLayout
{
  objc_super v3 = [(ASCLockupMediaView *)self context];
  id v4 = [(ASCLockupMediaView *)self screenshots];
  double v5 = [(ASCLockupMediaView *)self trailers];
  double v6 = [(ASCLockupMediaView *)self containerView];
  char v7 = [(ASCLockupMediaView *)self mediaViews];
  uint64_t v8 = +[__ASCLayoutProxy lockupMediaLayoutFor:v3 screenshots:v4 trailers:v5 containerView:v6 mediaViews:v7];

  return v8;
}

- (id)makeSizingLayout
{
  objc_super v3 = [(ASCLockupMediaView *)self context];
  id v4 = [(ASCLockupMediaView *)self screenshots];
  double v5 = [(ASCLockupMediaView *)self trailers];
  double v6 = [(ASCLockupMediaView *)self containerView];
  char v7 = [(ASCLockupMediaView *)self mediaViews];
  uint64_t v8 = +[__ASCLayoutProxy lockupMediaSizingLayoutFor:v3 screenshots:v4 trailers:v5 containerView:v6 mediaViews:v7];

  return v8;
}

- (CGSize)estimatedMediaContentSize
{
  objc_super v3 = [(ASCLockupMediaView *)self context];
  id v4 = [(ASCLockupMediaView *)self screenshots];
  double v5 = [(ASCLockupMediaView *)self trailers];
  [(ASCLockupMediaView *)self bounds];
  double v7 = v6;
  double v9 = v8;
  v10 = [(UIView *)self asc_layoutTraitEnvironment];
  +[__ASCLayoutProxy estimatedMediaContentSizeFor:screenshots:trailers:fitting:in:](__ASCLayoutProxy, "estimatedMediaContentSizeFor:screenshots:trailers:fitting:in:", v3, v4, v5, v10, v7, v9);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)invalidateIntrinsicContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)ASCLockupMediaView;
  [(ASCLockupMediaView *)&v4 invalidateIntrinsicContentSize];
  if ([(ASCLockupMediaView *)self translatesAutoresizingMaskIntoConstraints])
  {
    objc_super v3 = [(ASCLockupMediaView *)self superview];
    [v3 invalidateIntrinsicContentSize];
  }
}

- (CGSize)intrinsicContentSize
{
  [(ASCLockupMediaView *)self bounds];

  -[ASCLockupMediaView sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(ASCLockupMediaView *)self layoutMarginsForCurrentContext];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = width - v8 - v12;
  double v15 = height - v6 - v10;
  double v16 = [(ASCLockupMediaView *)self context];
  v17 = [(ASCLockupMediaView *)self screenshots];
  v18 = [(ASCLockupMediaView *)self trailers];
  v19 = [(UIView *)self asc_layoutTraitEnvironment];
  +[__ASCLayoutProxy estimatedMediaContentSizeFor:screenshots:trailers:fitting:in:](__ASCLayoutProxy, "estimatedMediaContentSizeFor:screenshots:trailers:fitting:in:", v16, v17, v18, v19, v14, v15);
  double v21 = v20;
  double v23 = v22;

  double v24 = v9 + v13 + v21;
  double v25 = v7 + v11 + v23;
  result.double height = v25;
  result.double width = v24;
  return result;
}

- (void)layoutSubviews
{
  v32.receiver = self;
  v32.super_class = (Class)ASCLockupMediaView;
  [(ASCLockupMediaView *)&v32 layoutSubviews];
  double v3 = [(ASCLockupMediaView *)self containerView];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v31[0] = *MEMORY[0x1E4F1DAB8];
  v31[1] = v4;
  v31[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v3 setTransform:v31];

  [(ASCLockupMediaView *)self layoutMarginsForCurrentContext];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(ASCLockupMediaView *)self bounds];
  double v14 = v8 + v13;
  double v16 = v6 + v15;
  double v18 = v17 - (v8 + v12);
  double v20 = v19 - (v6 + v10);
  double v21 = [(ASCLockupMediaView *)self makeLayout];
  double v22 = [(UIView *)self asc_layoutTraitEnvironment];
  objc_msgSend(v21, "placeChildrenRelativeToRect:inTraitEnvironment:", v22, v14, v16, v18, v20);

  double v23 = [(ASCLockupMediaView *)self context];
  double v24 = [(ASCLockupMediaView *)self screenshots];
  double v25 = [(ASCLockupMediaView *)self trailers];
  +[__ASCLayoutProxy containerViewRotationAngleFor:v23 screenshots:v24 trailers:v25];
  double v27 = v26;

  if (v27 != 0.0)
  {
    CGAffineTransformMakeRotation(&v30, v27 * 3.14159265 / 180.0);
    v28 = [(ASCLockupMediaView *)self containerView];
    CGAffineTransform v29 = v30;
    [v28 setTransform:&v29];
  }
}

- (UIEdgeInsets)layoutMarginsForCurrentContext
{
  [(ASCLockupMediaView *)self layoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(ASCLockupMediaView *)self context];
  +[__ASCLayoutProxy layoutMarginsFor:existingLayoutMargins:](__ASCLayoutProxy, "layoutMarginsFor:existingLayoutMargins:", v11, v4, v6, v8, v10);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.right = v23;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
  return result;
}

- (unint64_t)numberOfImageViews
{
  double v3 = [(ASCLockupMediaView *)self videoView];

  unint64_t result = [(ASCLockupMediaView *)self numberOfViews];
  if (v3)
  {
    if (result) {
      return [(ASCLockupMediaView *)self numberOfViews] - 1;
    }
  }
  return result;
}

- (void)updateImageViews
{
  double v3 = [ASCScreenshotDisplayConfiguration alloc];
  double v4 = [(ASCLockupMediaView *)self screenshots];
  double v5 = [v4 mediaPlatform];
  double v6 = [v5 deviceCornerRadiusFactor];
  double v21 = [(ASCScreenshotDisplayConfiguration *)v3 initWithDeviceCornerRadiusFactor:v6];

  unint64_t v7 = [(ASCLockupMediaView *)self numberOfImageViews];
  unint64_t v8 = [(NSMutableArray *)self->_imageViews count];
  if (v8 >= v7) {
    unint64_t v9 = v7;
  }
  else {
    unint64_t v9 = v8;
  }
  if (v9)
  {
    for (unint64_t i = 0; i < v14; ++i)
    {
      double v11 = [(NSMutableArray *)self->_imageViews objectAtIndexedSubscript:i];
      double v12 = [v11 artworkView];
      [v12 setScreenshotDisplayConfiguration:v21];

      unint64_t v13 = [(NSMutableArray *)self->_imageViews count];
      if (v13 >= v7) {
        unint64_t v14 = v7;
      }
      else {
        unint64_t v14 = v13;
      }
    }
  }
  if ([(NSMutableArray *)self->_imageViews count] != v7)
  {
    double v15 = *MEMORY[0x1E4F1DB28];
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      if ([(NSMutableArray *)self->_imageViews count] >= v7)
      {
        double v19 = [(NSMutableArray *)self->_imageViews lastObject];
        if (v19)
        {
          [(NSMutableArray *)self->_imageViews removeLastObject];
          [(ASCBorderedScreenshotView *)v19 removeFromSuperview];
        }
      }
      else
      {
        double v19 = -[ASCBorderedScreenshotView initWithFrame:screenshotDisplayConfiguration:]([ASCBorderedScreenshotView alloc], "initWithFrame:screenshotDisplayConfiguration:", v21, v15, v16, v17, v18);
        [(NSMutableArray *)self->_imageViews addObject:v19];
        double v20 = [(ASCLockupMediaView *)self containerView];
        [v20 addSubview:v19];
      }
    }
    while ([(NSMutableArray *)self->_imageViews count] != v7);
  }
}

- (void)prepareForReuse
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v3 = [(ASCLockupMediaView *)self imageViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * v7) artworkView];
        [v8 setImage:0];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  unint64_t v9 = [(ASCLockupMediaView *)self imageViews];
  [v9 removeAllObjects];

  [(ASCLockupMediaView *)self setVideoView:0];
}

- (void)setScreenshots:(id)a3 andTrailers:(id)a4
{
  double v20 = (ASCScreenshots *)a3;
  uint64_t v6 = (ASCTrailers *)a4;
  uint64_t v7 = v20;
  unint64_t v8 = v6;
  screenshots = self->_screenshots;
  if (!v20 || !screenshots)
  {
    if (screenshots == v20) {
      goto LABEL_4;
    }
LABEL_6:
    long long v12 = (ASCScreenshots *)[(ASCScreenshots *)v7 copy];
    long long v13 = self->_screenshots;
    self->_screenshots = v12;

    int v11 = 1;
    goto LABEL_7;
  }
  BOOL v10 = [(ASCScreenshots *)screenshots isEqual:v20];
  uint64_t v7 = v20;
  if (!v10) {
    goto LABEL_6;
  }
LABEL_4:
  int v11 = 0;
LABEL_7:
  trailers = self->_trailers;
  if (v8 && trailers)
  {
    if ([(ASCTrailers *)trailers isEqual:v8]) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v15 = (ASCTrailers *)[(ASCTrailers *)v8 copy];
    double v16 = self->_trailers;
    self->_trailers = v15;

    goto LABEL_14;
  }
  if (trailers != v8) {
    goto LABEL_13;
  }
LABEL_10:
  if (v11)
  {
LABEL_14:
    double v17 = [(ASCLockupMediaView *)self context];
    double v18 = [(ASCLockupMediaView *)self screenshots];
    double v19 = [(ASCLockupMediaView *)self trailers];
    [(ASCLockupMediaView *)self setNumberOfViews:+[__ASCLayoutProxy numberOfViewsInLockupMediaLayoutFor:v17 with:v18 and:v19]];

    [(ASCLockupMediaView *)self updateImageViews];
    [(ASCLockupMediaView *)self setNeedsLayout];
    [(ASCLockupMediaView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setImage:(id)a3 atIndex:(int64_t)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(ASCLockupMediaView *)self mediaViews];
  if ([v7 count] > (unint64_t)a4)
  {
    unint64_t v8 = [(ASCLockupMediaView *)self screenshots];
    unint64_t v9 = [v8 artwork];
    uint64_t v10 = [v9 count];

    uint64_t v11 = [(ASCLockupMediaView *)self trailers];
    if (v11)
    {
      long long v12 = (void *)v11;
      long long v13 = [(ASCLockupMediaView *)self trailers];
      unint64_t v14 = [v13 videos];
      uint64_t v15 = [v14 count];

      if (v15) {
        ++v10;
      }
    }
    for (id i = objc_alloc_init(MEMORY[0x1E4F1CA48]); a4 < (unint64_t)[v7 count]; a4 += v10)
    {
      double v17 = [NSNumber numberWithInteger:a4];
      [i addObject:v17];
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    obuint64_t j = i;
    uint64_t v18 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = [*(id *)(*((void *)&v32 + 1) + 8 * j) integerValue];
          objc_opt_class();
          id v23 = [v7 objectAtIndexedSubscript:v22];
          if (v23)
          {
            if (objc_opt_isKindOfClass()) {
              double v24 = v23;
            }
            else {
              double v24 = 0;
            }
          }
          else
          {
            double v24 = 0;
          }
          id v25 = v24;

          if (v25)
          {
            [v25 setImage:v6];
            id v26 = [v25 previewFrameArtwork];
            [v26 setNeedsDisplay];
          }
          else
          {
            objc_opt_class();
            id v27 = [v7 objectAtIndexedSubscript:v22];
            if (v27)
            {
              if (objc_opt_isKindOfClass()) {
                v28 = v27;
              }
              else {
                v28 = 0;
              }
            }
            else
            {
              v28 = 0;
            }
            id v26 = v28;

            if (v26)
            {
              CGAffineTransform v29 = [v26 artworkView];
              [v29 setImage:v6];

              CGAffineTransform v30 = [v26 artworkView];
              [v30 setNeedsDisplay];

              [v26 setUserInteractionEnabled:0];
            }
          }
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v19);
    }
  }
}

- (id)accessibilityElements
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  double v3 = objc_opt_new();
  uint64_t v4 = [(ASCLockupMediaView *)self videoView];

  if (v4)
  {
    uint64_t v5 = [(ASCLockupMediaView *)self videoView];
    [v5 setIsAccessibilityElement:1];

    uint64_t v6 = *MEMORY[0x1E4FB2580];
    uint64_t v7 = [(ASCLockupMediaView *)self videoView];
    [v7 setAccessibilityTraits:v6];

    unint64_t v9 = ASCLocalizedString(@"AX_VIDEO", v8);
    uint64_t v10 = [(ASCLockupMediaView *)self videoView];
    [v10 setAccessibilityLabel:v9];

    uint64_t v11 = [(ASCLockupMediaView *)self videoView];
    [v3 addObject:v11];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v12 = [(ASCLockupMediaView *)self imageViews];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    uint64_t v16 = *MEMORY[0x1E4FB2558];
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v19 = [v18 artworkView];
        [v19 setIsAccessibilityElement:1];

        uint64_t v20 = [v18 artworkView];
        [v20 setAccessibilityTraits:v16];

        uint64_t v22 = ASCLocalizedString(@"AX_ARTWORK", v21);
        id v23 = [v18 artworkView];
        [v23 setAccessibilityLabel:v22];

        double v24 = [v18 artworkView];
        [v3 addObject:v24];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v14);
  }

  id v25 = (void *)[v3 copy];

  return v25;
}

- (ASCVideoView)videoView
{
  return self->_videoView;
}

- (NSString)context
{
  return self->_context;
}

- (BOOL)isVideoLoopingEnabled
{
  return self->_videoLoopingEnabled;
}

- (BOOL)isVideoMuted
{
  return self->_videoMuted;
}

- (unint64_t)numberOfViews
{
  return self->_numberOfViews;
}

- (void)setNumberOfViews:(unint64_t)a3
{
  self->_numberOfViews = a3;
}

- (ASCScreenshots)screenshots
{
  return self->_screenshots;
}

- (void)setScreenshots:(id)a3
{
}

- (ASCTrailers)trailers
{
  return self->_trailers;
}

- (void)setTrailers:(id)a3
{
}

- (NSMutableArray)imageViews
{
  return self->_imageViews;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_trailers, 0);
  objc_storeStrong((id *)&self->_screenshots, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_videoView, 0);
}

@end