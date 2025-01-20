@interface MRUFlippingArtworkView
- (BOOL)currentItemHasChangedSinceArtworkLastSet;
- (BOOL)dimsWhenPaused;
- (BOOL)isOnScreen;
- (BOOL)isPlaying;
- (BOOL)isSquare:(CGSize)a3;
- (BOOL)isSquareArtwork;
- (BOOL)shouldTransitionFromImage:(id)a3 toImage:(id)a4;
- (CGRect)artworkFrame;
- (CGRect)artworkFrameForSize:(CGSize)a3 availableBounds:(CGRect)a4;
- (MRUArtwork)artwork;
- (MRUArtworkController)controller;
- (MRUFlippingArtworkLayer)artworkLayer;
- (MRUFlippingArtworkView)initWithFrame:(CGRect)a3;
- (MRUShadowView)artworkShadowView;
- (MRUVisualStylingProvider)stylingProvider;
- (MSVTimer)setArtworkThrottleTimer;
- (NSHashTable)observers;
- (NSString)itemIdentifier;
- (NSString)placeholderSymbolName;
- (UIEdgeInsets)shadowViewInsets;
- (UIImage)artworkImage;
- (int64_t)pendingTransitionDirection;
- (int64_t)style;
- (void)addObserver:(id)a3;
- (void)artworkLoadingDidTimeoutInController:(id)a3;
- (void)controller:(id)a3 didLoadArtworkImage:(id)a4;
- (void)controller:(id)a3 didStartLoadingImageForCatalog:(id)a4;
- (void)layoutSubviews;
- (void)removeObserver:(id)a3;
- (void)setArtwork:(id)a3;
- (void)setArtwork:(id)a3 transitionDirection:(int64_t)a4;
- (void)setArtworkImage:(id)a3;
- (void)setArtworkImageWithThrottle:(id)a3 updatePlaceholder:(BOOL)a4;
- (void)setArtworkLayer:(id)a3;
- (void)setArtworkShadowView:(id)a3;
- (void)setController:(id)a3;
- (void)setCurrentItemHasChangedSinceArtworkLastSet:(BOOL)a3;
- (void)setDimsWhenPaused:(BOOL)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setObservers:(id)a3;
- (void)setOnScreen:(BOOL)a3;
- (void)setPendingTransitionDirection:(int64_t)a3;
- (void)setPlaceholderSymbolName:(id)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setSetArtworkThrottleTimer:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setStylingProvider:(id)a3;
- (void)updateOpacity;
- (void)updatePlaceholder;
- (void)updateStyle;
- (void)updateVisualStyling;
@end

@implementation MRUFlippingArtworkView

- (MRUFlippingArtworkView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)MRUFlippingArtworkView;
  v3 = -[MRUFlippingArtworkView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

    v3->_currentItemHasChangedSinceArtworkLastSet = 0;
    v6 = objc_alloc_init(MRUShadowView);
    artworkShadowView = v3->_artworkShadowView;
    v3->_artworkShadowView = v6;

    [(MRUFlippingArtworkView *)v3 addSubview:v3->_artworkShadowView];
    v8 = objc_alloc_init(MRUFlippingArtworkLayer);
    artworkLayer = v3->_artworkLayer;
    v3->_artworkLayer = v8;

    -[MRUFlippingArtworkLayer setAnchorPoint:](v3->_artworkLayer, "setAnchorPoint:", 0.5, 0.5);
    v10 = [(MRUFlippingArtworkView *)v3 traitCollection];
    [v10 displayScale];
    -[MRUFlippingArtworkLayer setContentsScale:](v3->_artworkLayer, "setContentsScale:");

    v11 = [(MRUFlippingArtworkView *)v3 layer];
    [v11 addSublayer:v3->_artworkLayer];

    v12 = objc_alloc_init(MRUArtworkController);
    controller = v3->_controller;
    v3->_controller = v12;

    [(MRUArtworkController *)v3->_controller setArtworkLoadingTimeout:3.0];
    [(MRUArtworkController *)v3->_controller setDelegate:v3];
    v3->_dimsWhenPaused = 0;
    [(MRUFlippingArtworkView *)v3 setArtworkImage:0];
    [(MRUFlippingArtworkView *)v3 updateStyle];
    [(MRUFlippingArtworkView *)v3 updateOpacity];
    [(MRUFlippingArtworkView *)v3 setPlaying:0];
  }
  return v3;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)MRUFlippingArtworkView;
  [(MRUFlippingArtworkView *)&v17 layoutSubviews];
  [(MRUFlippingArtworkView *)self artworkFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[MRUFlippingArtworkLayer setFrame:](self->_artworkLayer, "setFrame:");
  [(MRUFlippingArtworkView *)self bounds];
  -[MRUArtworkController setPreferredContentSize:](self->_controller, "setPreferredContentSize:", v11, v12);
  [(MRUFlippingArtworkView *)self shadowViewInsets];
  -[MRUShadowView setFrame:](self->_artworkShadowView, "setFrame:", v4 + v16, v6 + v13, v8 - (v16 + v14), v10 - (v13 + v15));
}

- (void)setStylingProvider:(id)a3
{
  double v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    double v7 = v5;
    [(MRUVisualStylingProvider *)stylingProvider removeObserver:self];
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)self->_stylingProvider addObserver:self];
    [(MRUFlippingArtworkView *)self updateVisualStyling];
    double v5 = v7;
  }
}

- (void)setItemIdentifier:(id)a3
{
  double v8 = (NSString *)a3;
  double v4 = self->_itemIdentifier;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSString *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      double v6 = (NSString *)[(NSString *)v8 copy];
      itemIdentifier = self->_itemIdentifier;
      self->_itemIdentifier = v6;

      self->_currentItemHasChangedSinceArtworkLastSet = 1;
    }
  }
}

- (void)setPlaying:(BOOL)a3
{
  if (self->_playing != a3)
  {
    BOOL v3 = a3;
    self->_playing = a3;
    char v5 = [(MRUFlippingArtworkView *)self artworkLayer];
    [v5 setPlaying:v3];

    [(MRUFlippingArtworkView *)self setNeedsLayout];
    if (self->_onScreen)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __37__MRUFlippingArtworkView_setPlaying___block_invoke;
      v8[3] = &unk_1E5F0D7F8;
      v8[4] = self;
      v6[0] = MRUFlippingArtworkSpringParameters;
      v6[1] = unk_1AE9634C8;
      uint64_t v7 = 0;
      objc_msgSend(MEMORY[0x1E4FB1EB0], "mru_animateWithSpringParameters:options:animations:", v6, 4, v8);
    }
  }
}

uint64_t __37__MRUFlippingArtworkView_setPlaying___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setDimsWhenPaused:(BOOL)a3
{
  if (self->_dimsWhenPaused != a3)
  {
    BOOL v3 = a3;
    self->_dimsWhenPaused = a3;
    id v4 = [(MRUFlippingArtworkView *)self artworkLayer];
    [v4 setDimsWhenPaused:v3];
  }
}

- (void)setArtwork:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_artwork, a3);
  char v5 = [v7 catalog];
  [(MRUArtworkController *)self->_controller setCatalog:v5];

  double v6 = [v7 catalog];

  if (!v6) {
    [(MRUFlippingArtworkView *)self updatePlaceholder];
  }
}

- (void)setArtwork:(id)a3 transitionDirection:(int64_t)a4
{
  id v6 = a3;
  [(MRUFlippingArtworkView *)self setPendingTransitionDirection:a4];
  [(MRUFlippingArtworkView *)self setArtwork:v6];
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(MRUFlippingArtworkView *)self updateStyle];
    [(MRUFlippingArtworkView *)self setNeedsLayout];
  }
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)setArtworkImageWithThrottle:(id)a3 updatePlaceholder:(BOOL)a4
{
  id v6 = a3;
  [(MSVTimer *)self->_setArtworkThrottleTimer invalidate];
  id v7 = (void *)MEMORY[0x1E4F77A30];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__MRUFlippingArtworkView_setArtworkImageWithThrottle_updatePlaceholder___block_invoke;
  v11[3] = &unk_1E5F0DD10;
  v11[4] = self;
  id v12 = v6;
  BOOL v13 = a4;
  id v8 = v6;
  double v9 = [v7 timerWithInterval:0 repeats:v11 block:0.1];
  setArtworkThrottleTimer = self->_setArtworkThrottleTimer;
  self->_setArtworkThrottleTimer = v9;
}

uint64_t __72__MRUFlippingArtworkView_setArtworkImageWithThrottle_updatePlaceholder___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setArtworkImage:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 32) setSetArtworkThrottleTimer:0];
  if (*(unsigned char *)(a1 + 48))
  {
    BOOL v3 = *(void **)(a1 + 32);
    return [v3 updatePlaceholder];
  }
  return result;
}

- (void)setArtworkImage:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  char v5 = (UIImage *)a3;
  id v6 = v5;
  artworkImage = self->_artworkImage;
  if (v5 && artworkImage == v5) {
    goto LABEL_20;
  }
  if (![(MRUFlippingArtworkView *)self shouldTransitionFromImage:artworkImage toImage:v5])
  {
    self->_currentItemHasChangedSinceArtworkLastSet = 0;
    goto LABEL_9;
  }
  BOOL v8 = [(MRUFlippingArtworkView *)self isOnScreen];
  self->_currentItemHasChangedSinceArtworkLastSet = 0;
  if (!v8)
  {
LABEL_9:
    id v12 = MCLogCategoryDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v24 = v6;
      __int16 v25 = 1024;
      LODWORD(v26) = [(MRUFlippingArtworkView *)self isOnScreen];
      _os_log_impl(&dword_1AE7DF000, v12, OS_LOG_TYPE_DEBUG, "[FlippingArtwork].View view will set image:<%p> to current layer onScreen:%{BOOL}u", buf, 0x12u);
    }

    double v11 = [(MRUFlippingArtworkView *)self artworkLayer];
    objc_msgSend(v11, "setImageToCurrentLayer:animated:", -[UIImage CGImage](v6, "CGImage"), -[MRUFlippingArtworkView isOnScreen](self, "isOnScreen"));
    goto LABEL_12;
  }
  double v9 = MCLogCategoryDefault();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    double v10 = MRUFlippingArtworkTransitionDirectionDescription([(MRUFlippingArtworkView *)self pendingTransitionDirection]);
    *(_DWORD *)buf = 134218242;
    v24 = v6;
    __int16 v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_1AE7DF000, v9, OS_LOG_TYPE_DEBUG, "[FlippingArtwork].View view will transition to image:<%p> direction:%@", buf, 0x16u);
  }
  double v11 = [(MRUFlippingArtworkView *)self artworkLayer];
  objc_msgSend(v11, "transitionToImage:transitionDirection:", -[UIImage CGImage](v6, "CGImage"), -[MRUFlippingArtworkView pendingTransitionDirection](self, "pendingTransitionDirection"));
LABEL_12:

  objc_storeStrong((id *)&self->_artworkImage, a3);
  [(MRUFlippingArtworkView *)self setNeedsLayout];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v13 = self->_observers;
  uint64_t v14 = [(NSHashTable *)v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "artworkView:didChangeArtworkImage:", self, v6, (void)v18);
      }
      uint64_t v15 = [(NSHashTable *)v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }

  [(MRUFlippingArtworkView *)self updateOpacity];
LABEL_20:
}

- (void)setPlaceholderSymbolName:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderSymbolName, a3);

  [(MRUFlippingArtworkView *)self updatePlaceholder];
}

- (void)updatePlaceholder
{
  if (self->_artworkImage || !self->_placeholderSymbolName)
  {
    [(MRUFlippingArtworkLayer *)self->_artworkLayer setPlaceholderImage:0];
  }
  else
  {
    BOOL v3 = MRUArtworkPlaceholderSymbolConfiguration(self->_style);
    id v4 = [MEMORY[0x1E4FB1818] systemImageNamed:self->_placeholderSymbolName];
    char v5 = [v4 imageWithSymbolConfiguration:v3];

    id v6 = v5;
    -[MRUFlippingArtworkLayer setPlaceholderImage:](self->_artworkLayer, "setPlaceholderImage:", [v6 CGImage]);
  }

  [(MRUFlippingArtworkView *)self updateOpacity];
}

- (BOOL)shouldTransitionFromImage:(id)a3 toImage:(id)a4
{
  BOOL v7 = a3 == a4 || !self->_currentItemHasChangedSinceArtworkLastSet;
  if ([(MRUFlippingArtworkLayer *)self->_artworkLayer placeholderImage]) {
    BOOL currentItemHasChangedSinceArtworkLastSet = self->_currentItemHasChangedSinceArtworkLastSet;
  }
  else {
    BOOL currentItemHasChangedSinceArtworkLastSet = 0;
  }
  if (a3) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = a4 == 0;
  }
  char v10 = !v9 || v7;
  return currentItemHasChangedSinceArtworkLastSet | v10 ^ 1;
}

- (void)controller:(id)a3 didStartLoadingImageForCatalog:(id)a4
{
  artwork = self->_artwork;
  id v6 = a4;
  BOOL v7 = [(MRUArtwork *)artwork catalog];
  int v8 = [v7 isArtworkVisuallyIdenticalToCatalog:v6];

  if (v8)
  {
    [(MRUFlippingArtworkView *)self setArtworkImageWithThrottle:0 updatePlaceholder:0];
  }
}

- (void)controller:(id)a3 didLoadArtworkImage:(id)a4
{
}

- (void)artworkLoadingDidTimeoutInController:(id)a3
{
}

- (BOOL)isSquareArtwork
{
  [(UIImage *)self->_artworkImage size];

  return -[MRUFlippingArtworkView isSquare:](self, "isSquare:");
}

- (BOOL)isSquare:(CGSize)a3
{
  if (a3.width == *MEMORY[0x1E4F1DB30] && a3.height == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    return 1;
  }
  double v4 = 1.0 - a3.width / a3.height;
  if (v4 < 0.0) {
    double v4 = -v4;
  }
  return v4 < 0.03;
}

- (CGRect)artworkFrame
{
  [(UIImage *)self->_artworkImage size];
  double v4 = v3;
  double v6 = v5;
  [(MRUFlippingArtworkView *)self bounds];

  -[MRUFlippingArtworkView artworkFrameForSize:availableBounds:](self, "artworkFrameForSize:availableBounds:", v4, v6, v7, v8, v9, v10);
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)artworkFrameForSize:(CGSize)a3 availableBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v8 = a3.height;
  double v9 = a3.width;
  if (!-[MRUFlippingArtworkView isSquare:](self, "isSquare:"))
  {
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.double width = width;
    v19.size.double height = height;
    if (!CGRectIsEmpty(v19) && v9 > 0.0 && v8 > 0.0)
    {
      v20.origin.CGFloat x = x;
      v20.origin.CGFloat y = y;
      v20.size.double width = width;
      v20.size.double height = height;
      CGRectGetWidth(v20);
      v21.origin.CGFloat x = x;
      v21.origin.CGFloat y = y;
      v21.size.double width = width;
      v21.size.double height = height;
      CGRectGetHeight(v21);
LABEL_8:
      UIRectCenteredRect();
      CGFloat x = v11;
      CGFloat y = v12;
      double width = v13;
      double height = v14;
      goto LABEL_9;
    }
  }
  if (!-[MRUFlippingArtworkView isSquare:](self, "isSquare:", width, height))
  {
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.double width = width;
    v22.size.double height = height;
    CGRectGetWidth(v22);
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.double width = width;
    v23.size.double height = height;
    CGRectGetHeight(v23);
    goto LABEL_8;
  }
LABEL_9:
  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (void)updateOpacity
{
  double v3 = 1.0;
  if (!self->_artworkImage)
  {
    if ([(MRUFlippingArtworkLayer *)self->_artworkLayer placeholderImage]) {
      double v3 = 1.0;
    }
    else {
      double v3 = 0.2;
    }
  }
  if ([(MRUFlippingArtworkView *)self isOnScreen])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __39__MRUFlippingArtworkView_updateOpacity__block_invoke;
    v4[3] = &unk_1E5F0DBF8;
    v4[4] = self;
    *(double *)&v4[5] = v3;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v4 options:0 animations:0.25 completion:0.0];
  }
  else
  {
    [(MRUFlippingArtworkView *)self setAlpha:v3];
  }
}

uint64_t __39__MRUFlippingArtworkView_updateOpacity__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (void)updateStyle
{
  [(MRUFlippingArtworkLayer *)self->_artworkLayer setArtworkStyle:self->_style];
  int64_t style = self->_style;
  [(UIImage *)self->_artworkImage size];
  double v6 = MRUArtworkCornerRadius(style, v4, v5);
  -[MRUFlippingArtworkLayer setArtworkCornerRadius:](self->_artworkLayer, "setArtworkCornerRadius:");
  [(MRUShadowView *)self->_artworkShadowView _setContinuousCornerRadius:v6];
  [(MRUShadowView *)self->_artworkShadowView setOffset:MRUArtworkShadowOffset()];
  [(MRUShadowView *)self->_artworkShadowView setRadius:MRUArtworkShadowRadius(self->_style)];
  int64_t v7 = self->_style;
  double v8 = [(MRUFlippingArtworkView *)self traitCollection];
  double v9 = MRUArtworkShadowOpacity(v7, [v8 userInterfaceStyle]);
  *(float *)&double v9 = v9;
  [(MRUShadowView *)self->_artworkShadowView setOpacity:v9];

  double v10 = MRUArtworkShadowColor((char *)self->_style);
  [(MRUShadowView *)self->_artworkShadowView setColor:v10];

  MRUArtworkShadowFilter(self->_style);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [(MRUShadowView *)self->_artworkShadowView setCompositingFilter:v11];
}

- (void)updateVisualStyling
{
  id v3 = [(MRUVisualStylingProvider *)self->_stylingProvider primaryColor];
  -[MRUFlippingArtworkLayer setPlaceholderImageTintColor:](self->_artworkLayer, "setPlaceholderImageTintColor:", [v3 CGColor]);
}

- (UIEdgeInsets)shadowViewInsets
{
  double v3 = MRUArtworkShadowInset(self->_style);
  unint64_t v5 = v4;
  unint64_t v7 = v6;
  unint64_t v9 = v8;
  BOOL playing = self->_playing;
  [(MRUFlippingArtworkView *)self bounds];
  v13.n128_u64[0] = MRUFlippingArtworkInsets(playing, v11, v12);
  v14.n128_u64[0] = v18.n128_u64[0];
  v15.n128_u64[0] = v19.n128_u64[0];
  v16.n128_u64[0] = v20.n128_u64[0];
  v17.n128_f64[0] = v3;
  v18.n128_u64[0] = v5;
  v19.n128_u64[0] = v7;
  v20.n128_u64[0] = v9;

  MEMORY[0x1F4166BC0](15, v17, v18, v19, v20, v13, v14, v15, v16);
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)dimsWhenPaused
{
  return self->_dimsWhenPaused;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (void)setOnScreen:(BOOL)a3
{
  self->_onScreen = a3;
}

- (MRUArtwork)artwork
{
  return self->_artwork;
}

- (NSString)placeholderSymbolName
{
  return self->_placeholderSymbolName;
}

- (int64_t)style
{
  return self->_style;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (MRUFlippingArtworkLayer)artworkLayer
{
  return self->_artworkLayer;
}

- (void)setArtworkLayer:(id)a3
{
}

- (MRUShadowView)artworkShadowView
{
  return self->_artworkShadowView;
}

- (void)setArtworkShadowView:(id)a3
{
}

- (UIImage)artworkImage
{
  return self->_artworkImage;
}

- (BOOL)currentItemHasChangedSinceArtworkLastSet
{
  return self->_currentItemHasChangedSinceArtworkLastSet;
}

- (void)setCurrentItemHasChangedSinceArtworkLastSet:(BOOL)a3
{
  self->_BOOL currentItemHasChangedSinceArtworkLastSet = a3;
}

- (MRUArtworkController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (int64_t)pendingTransitionDirection
{
  return self->_pendingTransitionDirection;
}

- (void)setPendingTransitionDirection:(int64_t)a3
{
  self->_pendingTransitionDirection = a3;
}

- (MSVTimer)setArtworkThrottleTimer
{
  return self->_setArtworkThrottleTimer;
}

- (void)setSetArtworkThrottleTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setArtworkThrottleTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_artworkImage, 0);
  objc_storeStrong((id *)&self->_artworkShadowView, 0);
  objc_storeStrong((id *)&self->_artworkLayer, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_placeholderSymbolName, 0);
  objc_storeStrong((id *)&self->_artwork, 0);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end