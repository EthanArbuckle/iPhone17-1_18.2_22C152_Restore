@interface MPURatingControl
+ (id)ratingDotImage;
+ (id)ratingStarImage;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MPURatingControl)initWithFrame:(CGRect)a3;
- (MPURatingControlDelegate)delegate;
- (UIEdgeInsets)hitTestEdgeInsets;
- (double)rating;
- (double)ratingValueForLocationInView:(CGPoint)a3;
- (void)_handlePanGesture:(id)a3;
- (void)_handleTapGesture:(id)a3;
- (void)_updateImageView:(id)a3 proposedImage:(id)a4 filled:(BOOL)a5;
- (void)_updateImageViewsForRatingAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setHitTestEdgeInsets:(UIEdgeInsets)a3;
- (void)setRating:(double)a3;
- (void)setRating:(double)a3 animated:(BOOL)a4;
- (void)viewDidMoveToSuperview;
@end

@implementation MPURatingControl

+ (id)ratingStarImage
{
  v2 = (void *)MEMORY[0x263F1C6B0];
  v3 = [MEMORY[0x263F086E0] mediaPlayerUIBundle];
  v4 = [v2 imageNamed:@"rating-star" inBundle:v3];

  return v4;
}

+ (id)ratingDotImage
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__MPURatingControl_ratingDotImage__block_invoke;
  v4[3] = &__block_descriptor_40_e5__8__0l;
  v4[4] = a1;
  v2 = +[MPUTheme cachedObjectWithKey:@"MPURatingControl_ratingDot" block:v4];
  return v2;
}

id __34__MPURatingControl_ratingDotImage__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) ratingStarImage];
  [v1 size];
  double v3 = v2;
  double v5 = v4;

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __34__MPURatingControl_ratingDotImage__block_invoke_2;
  v8[3] = &__block_descriptor_48_e5_v8__0l;
  *(double *)&v8[4] = v3;
  *(double *)&v8[5] = v5;
  v6 = objc_msgSend(MEMORY[0x263F1C6B0], "imageWithSize:opaque:fromBlock:", 0, v8, v3, v5);
  return v6;
}

void __34__MPURatingControl_ratingDotImage__block_invoke_2()
{
  v0 = [MEMORY[0x263F1C550] colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
  [v0 setFill];

  UIRectCenteredIntegralRectScale();
  objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", 0);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 fill];
}

- (MPURatingControl)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)MPURatingControl;
  double v3 = -[MPURatingControl initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v3 action:sel__handleTapGesture_];
    tapGestureRecognizer = v3->_tapGestureRecognizer;
    v3->_tapGestureRecognizer = (UITapGestureRecognizer *)v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x263F1C838]) initWithTarget:v3 action:sel__handlePanGesture_];
    panGestureRecognizer = v3->_panGestureRecognizer;
    v3->_panGestureRecognizer = (UIPanGestureRecognizer *)v6;

    [(MPURatingControl *)v3 addGestureRecognizer:v3->_tapGestureRecognizer];
    [(MPURatingControl *)v3 addGestureRecognizer:v3->_panGestureRecognizer];
    [(MPURatingControl *)v3 setClipsToBounds:1];
    [MEMORY[0x263F11D50] easyTouchDefaultHitRectInsets];
    -[MPURatingControl setHitTestEdgeInsets:](v3, "setHitTestEdgeInsets:");
    uint64_t v8 = 5;
    uint64_t v9 = [MEMORY[0x263EFF980] arrayWithCapacity:5];
    imageViews = v3->_imageViews;
    v3->_imageViews = (NSMutableArray *)v9;

    v11 = [(id)objc_opt_class() ratingStarImage];
    [v11 size];
    double v13 = v12;
    double v15 = v14;

    do
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", 0.0, 0.0, v13, v15);
      [v16 setContentMode:4];
      [(NSMutableArray *)v3->_imageViews addObject:v16];
      [(MPURatingControl *)v3 addSubview:v16];

      --v8;
    }
    while (v8);
    [(MPURatingControl *)v3 _updateImageViewsForRatingAnimated:0];
  }
  return v3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(MPURatingControl *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(MPURatingControl *)self hitTestEdgeInsets];
  double v16 = v10 + v15;
  double v19 = v12 - (v17 + v18);
  double v21 = v14 - (v15 + v20);
  double v22 = v8 + v17;
  double v23 = v16;
  double v24 = v19;
  CGFloat v25 = x;
  CGFloat v26 = y;
  return CGRectContainsPoint(*(CGRect *)&v22, *(CGPoint *)&v25);
}

- (void)layoutSubviews
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)MPURatingControl;
  [(MPURatingControl *)&v16 layoutSubviews];
  [(MPURatingControl *)self bounds];
  double Width = CGRectGetWidth(v19);
  [(MPURatingControl *)self bounds];
  double Height = CGRectGetHeight(v20);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v5 = self->_imageViews;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    double v8 = Height * 0.5;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        double v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v11, "setCenter:", Width/ 6.0* (double)(unint64_t)(-[NSMutableArray indexOfObject:](self->_imageViews, "indexOfObject:", v11, (void)v12)+ 1), v8);
        [v11 bounds];
        [v11 center];
        UIRectCenteredAboutPointScale();
        objc_msgSend(v11, "setFrame:");
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v7);
  }
}

- (double)ratingValueForLocationInView:(CGPoint)a3
{
  double x = a3.x;
  uint64_t v23 = *MEMORY[0x263EF8340];
  double v5 = [(NSMutableArray *)self->_imageViews firstObject];
  [v5 frame];
  double MinX = CGRectGetMinX(v24);

  double result = 0.0;
  if (x >= MinX)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    double v8 = self->_imageViews;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      uint64_t v12 = -1;
      double v13 = 1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          objc_msgSend(v15, "center", (void)v18);
          UIDistanceBetweenPoints();
          if (v16 < v13)
          {
            double v17 = v16;
            uint64_t v12 = [(NSMutableArray *)self->_imageViews indexOfObject:v15];
            double v13 = v17;
          }
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
    else
    {
      uint64_t v12 = -1;
    }

    return (double)((v12 & ~(v12 >> 63)) + 1)
         / (double)(unint64_t)[(NSMutableArray *)self->_imageViews count];
  }
  return result;
}

- (void)_handleTapGesture:(id)a3
{
  id v5 = a3;
  if ([v5 state] == 3)
  {
    [v5 locationInView:self];
    -[MPURatingControl ratingValueForLocationInView:](self, "ratingValueForLocationInView:");
    -[MPURatingControl setRating:animated:](self, "setRating:animated:", 1);
    uint64_t v4 = [(MPURatingControl *)self delegate];
    [v4 ratingDidChangeForRatingControl:self];
  }
}

- (void)_handlePanGesture:(id)a3
{
  id v5 = a3;
  if ([v5 state] == 2)
  {
    [v5 locationInView:self];
    -[MPURatingControl ratingValueForLocationInView:](self, "ratingValueForLocationInView:");
    -[MPURatingControl setRating:animated:](self, "setRating:animated:", 1);
  }
  if ([v5 state] == 3)
  {
    uint64_t v4 = [(MPURatingControl *)self delegate];
    [v4 ratingDidChangeForRatingControl:self];
  }
}

- (void)setRating:(double)a3
{
}

- (void)setRating:(double)a3 animated:(BOOL)a4
{
  if (self->_rating != a3)
  {
    self->_rating = a3;
    [(MPURatingControl *)self _updateImageViewsForRatingAnimated:a4];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = [(id)objc_opt_class() ratingStarImage];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  double v8 = (v5 + 16.0) * 5.0;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)viewDidMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)MPURatingControl;
  [(MPURatingControl *)&v3 viewDidMoveToSuperview];
  [(MPURatingControl *)self _updateImageViewsForRatingAnimated:0];
}

- (void)_updateImageView:(id)a3 proposedImage:(id)a4 filled:(BOOL)a5
{
}

- (void)_updateImageViewsForRatingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = 0;
  int64_t v6 = llround(self->_rating * 5.0);
  do
  {
    double v7 = [(NSMutableArray *)self->_imageViews objectAtIndex:v5];
    uint64_t v8 = [v7 _animatesContents];
    [v7 _setAnimatesContents:v3];
    double v9 = objc_opt_class();
    if (v6 && v5 < v6)
    {
      uint64_t v10 = [v9 ratingStarImage];
      uint64_t v11 = self;
      uint64_t v12 = v7;
      double v13 = v10;
      uint64_t v14 = 1;
    }
    else
    {
      uint64_t v10 = [v9 ratingDotImage];
      uint64_t v11 = self;
      uint64_t v12 = v7;
      double v13 = v10;
      uint64_t v14 = 0;
    }
    [(MPURatingControl *)v11 _updateImageView:v12 proposedImage:v13 filled:v14];

    [v7 _setAnimatesContents:v8];
    ++v5;
  }
  while (v5 != 5);
}

- (MPURatingControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MPURatingControlDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIEdgeInsets)hitTestEdgeInsets
{
  double top = self->_hitTestEdgeInsets.top;
  double left = self->_hitTestEdgeInsets.left;
  double bottom = self->_hitTestEdgeInsets.bottom;
  double right = self->_hitTestEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setHitTestEdgeInsets:(UIEdgeInsets)a3
{
  self->_hitTestEdgeInsets = a3;
}

- (double)rating
{
  return self->_rating;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
}

@end