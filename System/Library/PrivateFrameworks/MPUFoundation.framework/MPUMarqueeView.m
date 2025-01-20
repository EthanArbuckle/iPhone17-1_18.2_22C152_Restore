@interface MPUMarqueeView
- (BOOL)_contentFits;
- (BOOL)isMarqueeEnabled;
- (CAGradientLayer)gradientLayer;
- (CGSize)contentSize;
- (CGSize)intrinsicContentSize;
- (MPUMarqueeView)initWithFrame:(CGRect)a3;
- (MPUMarqueeViewDelegate)delegate;
- (NSArray)coordinatedMarqueeViews;
- (UIEdgeInsets)fadeEdgeInsets;
- (UIView)animationReferenceView;
- (UIView)contentView;
- (UIView)viewForContentSize;
- (double)_duration;
- (double)contentGap;
- (double)marqueeDelay;
- (double)marqueeScrollRate;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (int64_t)animationDirection;
- (void)_applyMarqueeFade;
- (void)_createMarqueeAnimationIfNeeded;
- (void)_createMarqueeAnimationIfNeededWithMaximumDuration:(double)a3 beginTime:(double)a4;
- (void)_tearDownMarqueeAnimation;
- (void)addCoordinatedMarqueeView:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)didMoveToWindow;
- (void)invalidateIntrinsicContentSize;
- (void)layoutSubviews;
- (void)resetMarqueePosition;
- (void)sceneDidEnterBackgroundNotification:(id)a3;
- (void)sceneWillEnterForegroundNotification:(id)a3;
- (void)setAnimationDirection:(int64_t)a3;
- (void)setAnimationReferenceView:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setContentGap:(double)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setDelegate:(id)a3;
- (void)setFadeEdgeInsets:(UIEdgeInsets)a3;
- (void)setFrame:(CGRect)a3;
- (void)setMarqueeDelay:(double)a3;
- (void)setMarqueeEnabled:(BOOL)a3;
- (void)setMarqueeEnabled:(BOOL)a3 withOptions:(int64_t)a4;
- (void)setMarqueeScrollRate:(double)a3;
- (void)setViewForContentSize:(id)a3;
@end

@implementation MPUMarqueeView

- (MPUMarqueeView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MPUMarqueeView;
  v3 = -[MPUMarqueeView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_marqueeDelay = 3.0;
    v3->_marqueeScrollRate = 30.0;
    long long v5 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
    *(_OWORD *)&v3->_fadeEdgeInsets.top = *MEMORY[0x263F1D1C0];
    *(_OWORD *)&v3->_fadeEdgeInsets.bottom = v5;
    uint64_t v6 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
    coordinatedMarqueeViews = v4->_coordinatedMarqueeViews;
    v4->_coordinatedMarqueeViews = (NSPointerArray *)v6;

    [(MPUMarqueeView *)v4 setClipsToBounds:1];
    v8 = [_MPUMarqueeContentView alloc];
    [(MPUMarqueeView *)v4 bounds];
    uint64_t v9 = -[_MPUMarqueeContentView initWithFrame:](v8, "initWithFrame:");
    contentView = v4->_contentView;
    v4->_contentView = (UIView *)v9;

    [(MPUMarqueeView *)v4 addSubview:v4->_contentView];
    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v4 selector:sel_sceneDidEnterBackgroundNotification_ name:*MEMORY[0x263F1D578] object:0];

    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v4 selector:sel_sceneWillEnterForegroundNotification_ name:*MEMORY[0x263F1D590] object:0];
  }
  return v4;
}

- (void)sceneWillEnterForegroundNotification:(id)a3
{
  v4 = [a3 object];
  long long v5 = [(MPUMarqueeView *)self window];
  uint64_t v6 = [v5 windowScene];

  if (v4 == v6)
  {
    [(MPUMarqueeView *)self setMarqueeEnabled:1];
  }
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)MPUMarqueeView;
  [(MPUMarqueeView *)&v4 didMoveToWindow];
  v3 = [(MPUMarqueeView *)self window];

  if (v3) {
    [(MPUMarqueeView *)self _createMarqueeAnimationIfNeeded];
  }
  else {
    [(MPUMarqueeView *)self _tearDownMarqueeAnimation];
  }
}

- (void)setViewForContentSize:(id)a3
{
  long long v5 = (UIView *)a3;
  p_viewForContentSize = &self->_viewForContentSize;
  if (self->_viewForContentSize != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_viewForContentSize, a3);
    p_viewForContentSize = (UIView **)[(MPUMarqueeView *)self invalidateIntrinsicContentSize];
    long long v5 = v7;
  }

  MEMORY[0x270F9A758](p_viewForContentSize, v5);
}

- (id)viewForLastBaselineLayout
{
  v2 = [(UIView *)self->_contentView subviews];
  v3 = [v2 lastObject];
  objc_super v4 = [v3 viewForLastBaselineLayout];

  return v4;
}

- (void)setContentGap:(double)a3
{
  if (self->_contentGap != a3)
  {
    self->_contentGap = a3;
    [(MPUMarqueeView *)self _tearDownMarqueeAnimation];
    [(MPUMarqueeView *)self _createMarqueeAnimationIfNeeded];
    [(MPUMarqueeView *)self setNeedsLayout];
  }
}

- (CGSize)intrinsicContentSize
{
  viewForContentSize = self->_viewForContentSize;
  if (viewForContentSize)
  {
    [(UIView *)viewForContentSize intrinsicContentSize];
  }
  else
  {
    double width = self->_contentSize.width;
    double height = self->_contentSize.height;
  }
  double v6 = width + self->_fadeEdgeInsets.left + self->_fadeEdgeInsets.right;
  result.double height = height;
  result.double width = v6;
  return result;
}

- (void)invalidateIntrinsicContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)MPUMarqueeView;
  [(MPUMarqueeView *)&v4 invalidateIntrinsicContentSize];
  viewForContentSize = self->_viewForContentSize;
  if (viewForContentSize)
  {
    [(UIView *)viewForContentSize intrinsicContentSize];
    -[MPUMarqueeView setContentSize:](self, "setContentSize:");
  }
}

- (void)setContentSize:(CGSize)a3
{
  if (self->_contentSize.width != a3.width || self->_contentSize.height != a3.height)
  {
    self->_contentSize = a3;
    [(MPUMarqueeView *)self _tearDownMarqueeAnimation];
    [(MPUMarqueeView *)self _createMarqueeAnimationIfNeeded];
    [(MPUMarqueeView *)self setNeedsLayout];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MPUMarqueeView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)MPUMarqueeView;
  -[MPUMarqueeView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    [(MPUMarqueeView *)self _tearDownMarqueeAnimation];
    [(MPUMarqueeView *)self _createMarqueeAnimationIfNeeded];
    [(MPUMarqueeView *)self setNeedsLayout];
  }
}

- (void)_createMarqueeAnimationIfNeeded
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  p_primaryMarqueeView = &self->_primaryMarqueeView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryMarqueeView);

  if (WeakRetained)
  {
    id v24 = objc_loadWeakRetained((id *)p_primaryMarqueeView);
    [v24 _createMarqueeAnimationIfNeeded];
  }
  else
  {
    long long v5 = [(MPUMarqueeView *)self superview];

    if (v5 && self->_marqueeEnabled)
    {
      [(MPUMarqueeView *)self _duration];
      double v7 = v6;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      double v8 = self->_coordinatedMarqueeViews;
      uint64_t v9 = [(NSPointerArray *)v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v30 != v11) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*((void *)&v29 + 1) + 8 * i) _duration];
            if (v7 < v13) {
              double v7 = v13;
            }
          }
          uint64_t v10 = [(NSPointerArray *)v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v10);
      }

      objc_super v14 = [(UIView *)self->_contentView layer];
      v15 = [v14 animationForKey:@"_MPUMarqueeViewLayerAnimationKey"];
      v16 = v15;
      if (v15) {
        [v15 beginTime];
      }
      else {
        double v17 = CACurrentMediaTime();
      }
      double v18 = v17;
      [(MPUMarqueeView *)self _createMarqueeAnimationIfNeededWithMaximumDuration:v7 beginTime:v17];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v19 = self->_coordinatedMarqueeViews;
      uint64_t v20 = [(NSPointerArray *)v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v26;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v26 != v22) {
              objc_enumerationMutation(v19);
            }
            [*(id *)(*((void *)&v25 + 1) + 8 * j) _createMarqueeAnimationIfNeededWithMaximumDuration:v7 beginTime:v18];
          }
          uint64_t v21 = [(NSPointerArray *)v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v21);
      }
    }
  }
}

- (void)_tearDownMarqueeAnimation
{
  id v2 = [(UIView *)self->_contentView layer];
  [v2 removeAnimationForKey:@"_MPUMarqueeViewLayerAnimationKey"];
}

- (void)_applyMarqueeFade
{
  v23[4] = *MEMORY[0x263EF8340];
  if ([(MPUMarqueeView *)self _contentFits])
  {
    id v21 = [(MPUMarqueeView *)self gradientLayer];
    [v21 removeFromSuperlayer];
  }
  else
  {
    uint64_t v3 = [MEMORY[0x263F158F8] disableActions];
    [MEMORY[0x263F158F8] setDisableActions:1];
    objc_super v4 = [(MPUMarqueeView *)self layer];
    long long v5 = [(MPUMarqueeView *)self gradientLayer];
    if (!v5)
    {
      long long v5 = [MEMORY[0x263F157D0] layer];
      id v6 = [MEMORY[0x263F1C550] whiteColor];
      uint64_t v7 = [v6 CGColor];

      id v8 = [MEMORY[0x263F1C550] clearColor];
      uint64_t v9 = [v8 CGColor];

      v23[0] = v7;
      v23[1] = v9;
      v23[2] = v9;
      v23[3] = v7;
      uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];
      [v5 setColors:v10];

      [v5 setCompositingFilter:*MEMORY[0x263F15B90]];
      [v4 addSublayer:v5];
    }
    [(MPUMarqueeView *)self bounds];
    double x = v25.origin.x;
    double y = v25.origin.y;
    double width = v25.size.width;
    double height = v25.size.height;
    double v15 = CGRectGetWidth(v25);
    v22[0] = &unk_26DAC2978;
    p_fadeEdgeInsets = &self->_fadeEdgeInsets;
    double v17 = [NSNumber numberWithDouble:self->_fadeEdgeInsets.left / v15];
    v22[1] = v17;
    double v18 = [NSNumber numberWithDouble:(v15 - p_fadeEdgeInsets->right) / v15];
    v22[2] = v18;
    v22[3] = &unk_26DAC2988;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
    [v5 setLocations:v19];

    objc_msgSend(v5, "setBounds:", x, y, width, height);
    v26.origin.double x = x;
    v26.origin.double y = y;
    v26.size.double width = width;
    v26.size.double height = height;
    double MidX = CGRectGetMidX(v26);
    v27.origin.double x = x;
    v27.origin.double y = y;
    v27.size.double width = width;
    v27.size.double height = height;
    objc_msgSend(v5, "setPosition:", MidX, CGRectGetMidY(v27));
    v28.origin.double x = x;
    v28.origin.double y = y;
    v28.size.double width = width;
    v28.size.double height = height;
    objc_msgSend(v5, "setStartPoint:", 0.0, CGRectGetMidY(v28));
    v29.origin.double x = x;
    v29.origin.double y = y;
    v29.size.double width = width;
    v29.size.double height = height;
    objc_msgSend(v5, "setEndPoint:", 1.0, CGRectGetMidY(v29));
    [MEMORY[0x263F158F8] setDisableActions:v3];
  }
}

- (CAGradientLayer)gradientLayer
{
  id v2 = [(MPUMarqueeView *)self layer];
  uint64_t v3 = [v2 sublayers];
  objc_super v4 = [v3 lastObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return (CAGradientLayer *)v5;
}

- (BOOL)_contentFits
{
  [(MPUMarqueeView *)self bounds];
  return round(self->_contentSize.width) <= round(CGRectGetWidth(v4)- self->_fadeEdgeInsets.left- self->_fadeEdgeInsets.right);
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)MPUMarqueeView;
  [(MPUMarqueeView *)&v20 layoutSubviews];
  if ([(MPUMarqueeView *)self animationDirection]) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 3;
  }
  [(UIView *)self->_contentView setSemanticContentAttribute:v3];
  [(MPUMarqueeView *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  v12 = [(UIView *)self->_contentView layer];
  int64_t animationDirection = self->_animationDirection;
  double v14 = self->_contentSize.width + self->_contentGap;
  v21.origin.double x = v5;
  v21.origin.double y = v7;
  v21.size.double width = v9;
  v21.size.double height = v11;
  double Width = CGRectGetWidth(v21);
  if (v14 >= Width) {
    double Width = v14;
  }
  if (animationDirection == 1) {
    double Width = -Width;
  }
  CATransform3DMakeTranslation(&v19, Width, 0.0, 0.0);
  [v12 setInstanceTransform:&v19];
  [v12 setInstanceCount:2];
  contentView = self->_contentView;
  UIRectCenteredYInRectScale();
  [(UIView *)contentView setFrame:0];
  if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_fadeEdgeInsets.top, *MEMORY[0x263F1D1C0]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_fadeEdgeInsets.bottom, *(float64x2_t *)(MEMORY[0x263F1D1C0] + 16)))), 0xFuLL))))
  {
    double v17 = [(MPUMarqueeView *)self gradientLayer];

    if (v17)
    {
      double v18 = [(MPUMarqueeView *)self gradientLayer];
      [v18 removeFromSuperlayer];
    }
  }
  else
  {
    [(MPUMarqueeView *)self _applyMarqueeFade];
  }
}

- (int64_t)animationDirection
{
  return self->_animationDirection;
}

- (UIView)viewForContentSize
{
  return self->_viewForContentSize;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setFadeEdgeInsets:(UIEdgeInsets)a3
{
  self->_fadeEdgeInsets = a3;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MPUMarqueeView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)MPUMarqueeView;
  -[MPUMarqueeView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    [(MPUMarqueeView *)self _tearDownMarqueeAnimation];
    [(MPUMarqueeView *)self _createMarqueeAnimationIfNeeded];
  }
}

- (id)viewForFirstBaselineLayout
{
  id v2 = [(UIView *)self->_contentView subviews];
  uint64_t v3 = [v2 firstObject];
  double v4 = [v3 viewForFirstBaselineLayout];

  return v4;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = [a3 valueForKey:@"_MPUMarqueeViewAnimationIdentifierKey"];
  int v7 = [v6 isEqual:self->_currentAnimationID];

  if (v7)
  {
    [(MPUMarqueeView *)self _tearDownMarqueeAnimation];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 marqueeViewDidEndMarqueeIteration:self finished:v4];
    }
    if (v4)
    {
      int64_t options = self->_options;
      if ((options & 2) != 0) {
        self->_int64_t options = options ^ 2;
      }
      [(MPUMarqueeView *)self _createMarqueeAnimationIfNeeded];
    }
  }
}

- (void)setMarqueeDelay:(double)a3
{
  if (self->_marqueeDelay != a3)
  {
    self->_marqueeDeladouble y = a3;
    [(MPUMarqueeView *)self _createMarqueeAnimationIfNeeded];
  }
}

- (void)setAnimationReferenceView:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animationReferenceView);

  CGFloat v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_animationReferenceView, obj);
    [(MPUMarqueeView *)self _createMarqueeAnimationIfNeeded];
    CGFloat v5 = obj;
  }
}

- (void)setMarqueeEnabled:(BOOL)a3
{
}

- (void)setMarqueeEnabled:(BOOL)a3 withOptions:(int64_t)a4
{
  char v4 = a4;
  if (self->_options != a4)
  {
    self->_int64_t options = a4;
    p_marqueeEnabled = &self->_marqueeEnabled;
    if (self->_marqueeEnabled == a3)
    {
LABEL_13:
      [(MPUMarqueeView *)self _createMarqueeAnimationIfNeeded];
      return;
    }
LABEL_5:
    BOOL *p_marqueeEnabled = a3;
    int v7 = [(UIView *)self->_contentView layer];
    double v8 = v7;
    if ((v4 & 1) == 0) {
      goto LABEL_11;
    }
    uint64_t v9 = [v7 animationForKey:@"_MPUMarqueeViewLayerAnimationKey"];
    if (v9)
    {
      id v10 = (void *)v9;
      double v11 = [v8 presentationLayer];
      v12 = v11;
      if (v11)
      {
        [v11 affineTransform];
        double v13 = *(double *)&v17;
      }
      else
      {
        long long v16 = 0u;
        long long v17 = 0u;
        long long v15 = 0u;
        double v13 = 0.0;
      }
      double v14 = fabs(v13);

      if (v14 < 2.22044605e-16) {
LABEL_11:
      }
        [(MPUMarqueeView *)self _tearDownMarqueeAnimation];
    }

    goto LABEL_13;
  }
  p_marqueeEnabled = &self->_marqueeEnabled;
  if (self->_marqueeEnabled != a3) {
    goto LABEL_5;
  }
}

- (void)setMarqueeScrollRate:(double)a3
{
  if (self->_marqueeScrollRate != a3)
  {
    self->_marqueeScrollRate = a3;
    [(MPUMarqueeView *)self _tearDownMarqueeAnimation];
    [(MPUMarqueeView *)self _createMarqueeAnimationIfNeeded];
  }
}

- (void)setAnimationDirection:(int64_t)a3
{
  if (self->_animationDirection != a3)
  {
    self->_int64_t animationDirection = a3;
    [(MPUMarqueeView *)self setNeedsLayout];
  }
}

- (void)addCoordinatedMarqueeView:(id)a3
{
  p_primaryMarqueeView = &self->_primaryMarqueeView;
  double v8 = (id *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_primaryMarqueeView);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_primaryMarqueeView);
    [v6 addCoordinatedMarqueeView:v8];

    int v7 = (id *)v6;
  }
  else
  {
    objc_storeWeak(v8 + 54, self);
    [(NSPointerArray *)self->_coordinatedMarqueeViews addPointer:v8];
    int v7 = v8;
  }
}

- (NSArray)coordinatedMarqueeViews
{
  [(NSPointerArray *)self->_coordinatedMarqueeViews compact];
  coordinatedMarqueeViews = self->_coordinatedMarqueeViews;

  return [(NSPointerArray *)coordinatedMarqueeViews allObjects];
}

- (void)resetMarqueePosition
{
  [(MPUMarqueeView *)self _tearDownMarqueeAnimation];

  [(MPUMarqueeView *)self _createMarqueeAnimationIfNeeded];
}

- (void)_createMarqueeAnimationIfNeededWithMaximumDuration:(double)a3 beginTime:(double)a4
{
  v26[4] = *MEMORY[0x263EF8340];
  int v7 = [(UIView *)self->_contentView layer];
  double v8 = [v7 animationForKey:@"_MPUMarqueeViewLayerAnimationKey"];
  if (!v8 && ![(MPUMarqueeView *)self _contentFits])
  {
    uint64_t v9 = (NSUUID *)objc_alloc_init(MEMORY[0x263F08C38]);
    currentAnimationID = self->_currentAnimationID;
    self->_currentAnimationID = v9;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_animationReferenceView);
    [WeakRetained bounds];
    double v12 = CGRectGetWidth(v27) - self->_fadeEdgeInsets.left - self->_fadeEdgeInsets.right - self->_contentSize.width;

    if (v12 < 0.0) {
      double v12 = 0.0;
    }
    double v13 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform.translation.x"];
    double v14 = -self->_contentSize.width - self->_contentGap - v12;
    int64_t v15 = [(MPUMarqueeView *)self animationDirection];
    double v16 = -v14;
    if (v15 != 1) {
      double v16 = v14;
    }
    long long v17 = [NSNumber numberWithDouble:v16];
    [(MPUMarqueeView *)self _duration];
    double v19 = v18;
    v26[0] = &unk_26DAC2978;
    v26[1] = &unk_26DAC2978;
    v26[2] = v17;
    v26[3] = v17;
    objc_super v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:4];
    [v13 setValues:v20];

    v25[0] = &unk_26DAC2978;
    CGRect v21 = [NSNumber numberWithDouble:self->_marqueeDelay / a3];
    v25[1] = v21;
    uint64_t v22 = [NSNumber numberWithDouble:v19 / a3];
    v25[2] = v22;
    v25[3] = &unk_26DAC2988;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];
    [v13 setKeyTimes:v23];

    [v13 setDuration:a3];
    [v13 setBeginTime:a4];
    id v24 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC8]];
    [v13 setTimingFunction:v24];

    [v13 setDelegate:self];
    [v13 setValue:self->_currentAnimationID forKey:@"_MPUMarqueeViewAnimationIdentifierKey"];
    [v13 setFrameInterval:0.016];
    [v7 addAnimation:v13 forKey:@"_MPUMarqueeViewLayerAnimationKey"];
  }
}

- (double)_duration
{
  marqueeDeladouble y = 0.0;
  if ((self->_options & 2) == 0) {
    marqueeDeladouble y = self->_marqueeDelay;
  }
  return marqueeDelay + 1.0 / self->_marqueeScrollRate * (self->_contentSize.width + self->_contentGap);
}

- (void)sceneDidEnterBackgroundNotification:(id)a3
{
  char v4 = [a3 object];
  CGFloat v5 = [(MPUMarqueeView *)self window];
  id v6 = [v5 windowScene];

  if (v4 == v6)
  {
    [(MPUMarqueeView *)self setMarqueeEnabled:0];
  }
}

- (double)contentGap
{
  return self->_contentGap;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIView)animationReferenceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animationReferenceView);

  return (UIView *)WeakRetained;
}

- (UIEdgeInsets)fadeEdgeInsets
{
  double top = self->_fadeEdgeInsets.top;
  double left = self->_fadeEdgeInsets.left;
  double bottom = self->_fadeEdgeInsets.bottom;
  double right = self->_fadeEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (MPUMarqueeViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MPUMarqueeViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)marqueeDelay
{
  return self->_marqueeDelay;
}

- (double)marqueeScrollRate
{
  return self->_marqueeScrollRate;
}

- (BOOL)isMarqueeEnabled
{
  return self->_marqueeEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewForContentSize, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_animationReferenceView);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_primaryMarqueeView);
  objc_storeStrong((id *)&self->_coordinatedMarqueeViews, 0);

  objc_storeStrong((id *)&self->_currentAnimationID, 0);
}

@end