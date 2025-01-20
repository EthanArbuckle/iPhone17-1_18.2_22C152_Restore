@interface MRUArtworkView
- (BOOL)acuis_wantsPriorityOverTargetOfGestureRecognizer:(id)a3;
- (BOOL)adjustsImageWhenHighlighted;
- (BOOL)isArtworkControllerEnabled;
- (BOOL)isSquare:(CGSize)a3;
- (BOOL)showPlaceholder;
- (BOOL)useVisualEffectPlaceholder;
- (CGRect)artworkFrame;
- (CGRect)artworkFrameForSize:(CGSize)a3 availableBounds:(CGRect)a4;
- (CGSize)preferredContentSize;
- (CGSize)sizeThatFits:(CGSize)result;
- (MPArtworkCatalog)catalog;
- (MRUArtwork)artwork;
- (MRUArtworkController)controller;
- (MRUArtworkView)initWithFrame:(CGRect)a3;
- (MRUImageLoader)imageLoader;
- (MRUShadowView)artworkShadowView;
- (MRUVisualStylingProvider)stylingProvider;
- (MSVTimer)artworkTimer;
- (NSHashTable)observers;
- (UIImage)artworkImage;
- (UIImage)iconImage;
- (UIImage)placeholderImage;
- (UIImageView)artworkImageView;
- (UIImageView)placeholderImageView;
- (UIPointerInteraction)pointerInteraction;
- (UIView)placeholderBackground;
- (double)artworkLoadingTimeout;
- (double)contentScale;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)failedRetryCount;
- (int64_t)style;
- (void)addObserver:(id)a3;
- (void)artworkLoadingDidTimeoutInController:(id)a3;
- (void)controller:(id)a3 didLoadArtworkImage:(id)a4;
- (void)controller:(id)a3 didStartLoadingImageForCatalog:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)removeObserver:(id)a3;
- (void)setAdjustsImageWhenHighlighted:(BOOL)a3;
- (void)setArtwork:(id)a3;
- (void)setArtworkImage:(id)a3;
- (void)setArtworkImageView:(id)a3;
- (void)setArtworkLoadingTimeout:(double)a3;
- (void)setArtworkShadowView:(id)a3;
- (void)setArtworkTimer:(id)a3;
- (void)setCatalog:(id)a3;
- (void)setContentScale:(double)a3;
- (void)setController:(id)a3;
- (void)setFailedRetryCount:(int64_t)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIconImage:(id)a3;
- (void)setImageLoader:(id)a3;
- (void)setIsArtworkControllerEnabled:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setPlaceholderBackground:(id)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setPlaceholderImageView:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)setShowPlaceholder:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setStylingProvider:(id)a3;
- (void)setUseVisualEffectPlaceholder:(BOOL)a3;
- (void)updateArtworkFittingSize;
- (void)updatePlaceholderBackground;
- (void)updateStyle;
- (void)updateVisibility;
- (void)updateVisualStyling;
- (void)userInterfaceStyleChanged;
@end

@implementation MRUArtworkView

- (MRUArtworkView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v31[1] = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)MRUArtworkView;
  v7 = -[MRUArtworkView initWithFrame:](&v26, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;

    v31[0] = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
    id v11 = (id)[(MRUArtworkView *)v7 registerForTraitChanges:v10 withAction:sel_userInterfaceStyleChanged];

    [(MRUArtworkView *)v7 updatePlaceholderBackground];
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", x, y, width, height);
    placeholderImageView = v7->_placeholderImageView;
    v7->_placeholderImageView = (UIImageView *)v12;

    [(UIImageView *)v7->_placeholderImageView setUserInteractionEnabled:0];
    [(UIImageView *)v7->_placeholderImageView setContentMode:1];
    [(MRUArtworkView *)v7 addSubview:v7->_placeholderImageView];
    v14 = objc_alloc_init(MRUShadowView);
    artworkShadowView = v7->_artworkShadowView;
    v7->_artworkShadowView = v14;

    [(MRUArtworkView *)v7 addSubview:v7->_artworkShadowView];
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", x, y, width, height);
    artworkImageView = v7->_artworkImageView;
    v7->_artworkImageView = (UIImageView *)v16;

    [(UIImageView *)v7->_artworkImageView setUserInteractionEnabled:0];
    [(UIImageView *)v7->_artworkImageView setContentMode:2];
    [(UIImageView *)v7->_artworkImageView setClipsToBounds:1];
    [(MRUArtworkView *)v7 addSubview:v7->_artworkImageView];
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v7];
    pointerInteraction = v7->_pointerInteraction;
    v7->_pointerInteraction = (UIPointerInteraction *)v18;

    [(UIPointerInteraction *)v7->_pointerInteraction setEnabled:0];
    [(MRUArtworkView *)v7 addInteraction:v7->_pointerInteraction];
    BOOL v20 = +[MRUFeatureFlagProvider isArtworkControllerEnabled];
    v7->_isArtworkControllerEnabled = v20;
    if (v20)
    {
      v21 = MCLogCategoryDefault();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        uint64_t v28 = v22;
        __int16 v29 = 2048;
        v30 = v7;
        _os_log_impl(&dword_1AE7DF000, v21, OS_LOG_TYPE_INFO, "%@<%p> initializing MRUArtworkController", buf, 0x16u);
      }

      v23 = objc_alloc_init(MRUArtworkController);
      controller = v7->_controller;
      v7->_controller = v23;

      [(MRUArtworkController *)v7->_controller setDelegate:v7];
    }
    v7->_showPlaceholder = 1;
    v7->_adjustsImageWhenHighlighted = 1;
    v7->_contentScale = 1.0;
    [(MRUArtworkView *)v7 updateStyle];
    [(MRUArtworkView *)v7 updateVisibility];
  }
  return v7;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)MRUArtworkView;
  [(MRUArtworkView *)&v23 layoutSubviews];
  [(MRUArtworkView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_placeholderBackground, "setFrame:");
  [(MRUArtworkView *)self artworkFrame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  -[UIImageView setFrame:](self->_artworkImageView, "setFrame:");
  double v19 = MRUArtworkShadowInset(self->_style);
  -[MRUShadowView setFrame:](self->_artworkShadowView, "setFrame:", v12 + v22, v14 + v19, v16 - (v22 + v20), v18 - (v19 + v21));
  -[UIImageView sizeThatFits:](self->_placeholderImageView, "sizeThatFits:", v8, v10);
  v24.origin.double x = v4;
  v24.origin.double y = v6;
  v24.size.double width = v8;
  v24.size.double height = v10;
  CGRectGetWidth(v24);
  v25.origin.double x = v4;
  v25.origin.double y = v6;
  v25.size.double width = v8;
  v25.size.double height = v10;
  CGRectGetHeight(v25);
  UIRectCenteredRect();
  -[UIImageView setFrame:](self->_placeholderImageView, "setFrame:");
  [(MRUArtworkView *)self updateArtworkFittingSize];
}

- (CGSize)sizeThatFits:(CGSize)result
{
  if (result.width >= result.height) {
    result.double width = result.height;
  }
  double width = result.width;
  result.double height = width;
  return result;
}

- (void)userInterfaceStyleChanged
{
  if (self->_style == 1) {
    [(MRUArtworkView *)self updateStyle];
  }
}

- (double)artworkLoadingTimeout
{
  return 1.0;
}

- (void)setArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_artwork, a3);
  id v5 = a3;
  id v6 = [v5 catalog];

  [(MRUArtworkView *)self setCatalog:v6];
}

- (void)setCatalog:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_catalog, a3);
  id v6 = MCLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = objc_opt_class();
    BOOL isArtworkControllerEnabled = self->_isArtworkControllerEnabled;
    *(_DWORD *)buf = 138412802;
    uint64_t v27 = v7;
    __int16 v28 = 2048;
    __int16 v29 = self;
    __int16 v30 = 1024;
    BOOL v31 = isArtworkControllerEnabled;
    _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_INFO, "%@<%p> setCatalog isArtworkControllerEnabled:%{BOOL}u", buf, 0x1Cu);
  }

  if (self->_isArtworkControllerEnabled)
  {
    [(MRUArtworkView *)self updateArtworkFittingSize];
    [(MRUArtworkController *)self->_controller setCatalog:v5];
  }
  else
  {
    double v9 = [(MRUArtworkView *)self imageLoader];
    BOOL v10 = v9 == 0;

    if (v10)
    {
      objc_initWeak((id *)buf, self);
      double v11 = [MRUImageLoader alloc];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __29__MRUArtworkView_setCatalog___block_invoke;
      v24[3] = &unk_1E5F0D848;
      objc_copyWeak(&v25, (id *)buf);
      double v12 = [(MRUImageLoader *)v11 initWithDestination:self imageHandler:v24];
      [(MRUArtworkView *)self setImageLoader:v12];

      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)buf);
    }
    if (v5)
    {
      double v13 = [(MRUArtworkView *)self imageLoader];
      int v14 = [v13 wouldLoadNewImageForCatalog:v5];

      if (v14)
      {
        objc_initWeak((id *)buf, self);
        double v15 = (void *)MEMORY[0x1E4F77A30];
        [(MRUArtworkView *)self artworkLoadingTimeout];
        double v17 = v16;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __29__MRUArtworkView_setCatalog___block_invoke_14;
        v21[3] = &unk_1E5F0D870;
        objc_copyWeak(&v23, (id *)buf);
        id v22 = v5;
        double v18 = [v15 timerWithInterval:0 repeats:v21 block:v17];
        artworkTimer = self->_artworkTimer;
        self->_artworkTimer = v18;

        objc_destroyWeak(&v23);
        objc_destroyWeak((id *)buf);
      }
    }
    [(MRUArtworkView *)self updateArtworkFittingSize];
    double v20 = [(MRUArtworkView *)self imageLoader];
    [v20 updateCatalog:v5];
  }
}

void __29__MRUArtworkView_setCatalog___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      double v8 = MCLogCategoryImageLoading();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412802;
        uint64_t v11 = objc_opt_class();
        __int16 v12 = 2048;
        id v13 = WeakRetained;
        __int16 v14 = 2114;
        id v15 = v6;
        _os_log_impl(&dword_1AE7DF000, v8, OS_LOG_TYPE_ERROR, "%@<%p> Image load failed with error: %{public}@.", (uint8_t *)&v10, 0x20u);
      }
    }
    double v9 = [WeakRetained artworkTimer];
    [v9 invalidate];

    [WeakRetained setArtworkImage:v5];
  }
}

void __29__MRUArtworkView_setCatalog___block_invoke_14(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v3 = MCLogCategoryImageLoading();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412802;
    uint64_t v7 = v4;
    __int16 v8 = 2048;
    id v9 = WeakRetained;
    __int16 v10 = 2048;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1AE7DF000, v3, OS_LOG_TYPE_ERROR, "%@<%p> clearing old artwork while waiting for catalog=%p", (uint8_t *)&v6, 0x20u);
  }

  [WeakRetained setArtworkImage:0];
}

- (void)setArtworkImage:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_artworkImage, a3);
  [(UIImageView *)self->_artworkImageView setImage:v5];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v6 = self->_observers;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "artworkView:didChangeArtworkImage:", self, v5, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(MRUArtworkView *)self updateStyle];
  [(MRUArtworkView *)self updateVisibility];
  [(MRUArtworkView *)self setNeedsLayout];
}

- (void)setPlaceholderImage:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderImage, a3);
  id v5 = a3;
  [(UIImageView *)self->_placeholderImageView setImage:v5];

  [(MRUArtworkView *)self setNeedsLayout];
}

- (void)setStylingProvider:(id)a3
{
  id v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    uint64_t v7 = v5;
    [(MRUVisualStylingProvider *)stylingProvider removeObserver:self];
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)self->_stylingProvider addObserver:self];
    [(MRUArtworkView *)self updateVisualStyling];
    id v5 = v7;
  }
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(MRUArtworkView *)self updateStyle];
    [(MRUArtworkView *)self updateVisibility];
    [(MRUArtworkView *)self setNeedsLayout];
  }
}

- (void)setShowPlaceholder:(BOOL)a3
{
  if (self->_showPlaceholder != a3)
  {
    self->_showPlaceholder = a3;
    [(MRUArtworkView *)self updateVisibility];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MRUArtworkView;
  -[MRUArtworkView setHighlighted:](&v7, sel_setHighlighted_);
  if ([(MRUArtworkView *)self adjustsImageWhenHighlighted])
  {
    if (v3)
    {
      id v5 = [(MRUArtworkView *)self artworkImageView];
      [v5 setAlpha:0.2];
    }
    else
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __33__MRUArtworkView_setHighlighted___block_invoke;
      v6[3] = &unk_1E5F0D7F8;
      v6[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v6 options:0 animations:0.25 completion:0.0];
    }
  }
}

void __33__MRUArtworkView_setHighlighted___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) artworkImageView];
  [v1 setAlpha:1.0];
}

- (void)setFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  UIRectGetCenter();
  double v9 = v8;
  double v11 = v10;
  [(MRUArtworkView *)self center];
  BOOL v14 = v13 != v11 || v12 != v9;
  if (v14) {
    -[MRUArtworkView setCenter:](self, "setCenter:", v9, v11);
  }
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double v15 = CGRectGetWidth(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double v16 = CGRectGetHeight(v19);
  [(MRUArtworkView *)self bounds];
  v21.origin.CGFloat x = 0.0;
  v21.origin.CGFloat y = 0.0;
  v21.size.CGFloat width = v15;
  v21.size.CGFloat height = v16;
  if (CGRectEqualToRect(v20, v21))
  {
    if (!v14) {
      return;
    }
  }
  else
  {
    -[MRUArtworkView setBounds:](self, "setBounds:", 0.0, 0.0, v15, v16);
  }
  [(MRUArtworkView *)self setNeedsLayout];

  [(MRUArtworkView *)self layoutIfNeeded];
}

- (void)setUseVisualEffectPlaceholder:(BOOL)a3
{
  if (self->_useVisualEffectPlaceholder != a3)
  {
    self->_useVisualEffectPlaceholder = a3;
    [(MRUArtworkView *)self updatePlaceholderBackground];
  }
}

- (void)setContentScale:(double)a3
{
  if (vabdd_f64(self->_contentScale, a3) > 2.22044605e-16)
  {
    self->_contentScale = a3;
    [(MRUArtworkView *)self updateStyle];
  }
}

- (void)prepareForReuse
{
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = (void *)MEMORY[0x1E4FB1AD8];
  [(UIImageView *)self->_artworkImageView frame];

  return (id)objc_msgSend(v5, "regionWithRect:identifier:", 0);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self];
  int v6 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v5];
  objc_super v7 = (void *)MEMORY[0x1E4FB1AE0];
  double v8 = (void *)MEMORY[0x1E4FB14C0];
  [(UIImageView *)self->_artworkImageView frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  int64_t style = self->_style;
  [(UIImage *)self->_artworkImage size];
  CGRect v20 = objc_msgSend(v8, "bezierPathWithRoundedRect:cornerRadius:", v10, v12, v14, v16, MRUArtworkCornerRadius(style, v18, v19));
  CGRect v21 = [v7 shapeWithPath:v20];

  id v22 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v6 shape:v21];

  return v22;
}

- (BOOL)acuis_wantsPriorityOverTargetOfGestureRecognizer:(id)a3
{
  return 1;
}

- (void)controller:(id)a3 didStartLoadingImageForCatalog:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = MCLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v9 = 138543618;
    uint64_t v10 = objc_opt_class();
    __int16 v11 = 2048;
    double v12 = self;
    _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_INFO, "%{public}@<%p> controller:didStartLoadingImageForCatalog:", (uint8_t *)&v9, 0x16u);
  }

  objc_super v7 = [(MRUArtwork *)self->_artwork catalog];
  int v8 = [v7 isArtworkVisuallyIdenticalToCatalog:v5];

  if (v8) {
    [(MRUArtworkView *)self setArtworkImage:0];
  }
}

- (void)controller:(id)a3 didLoadArtworkImage:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = MCLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543618;
    uint64_t v8 = objc_opt_class();
    __int16 v9 = 2048;
    uint64_t v10 = self;
    _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_INFO, "%{public}@<%p> controller:didLoadArtworkImage:", (uint8_t *)&v7, 0x16u);
  }

  [(MRUArtworkView *)self setArtworkImage:v5];
}

- (void)artworkLoadingDidTimeoutInController:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = MCLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138543618;
    uint64_t v6 = objc_opt_class();
    __int16 v7 = 2048;
    uint64_t v8 = self;
    _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_INFO, "%{public}@<%p> artworkLoadingDidTimeoutInController:", (uint8_t *)&v5, 0x16u);
  }

  [(MRUArtworkView *)self setArtworkImage:0];
}

- (void)updatePlaceholderBackground
{
  [(UIView *)self->_placeholderBackground removeFromSuperview];
  if ([(MRUArtworkView *)self useVisualEffectPlaceholder]) {
    [MEMORY[0x1E4F743C8] materialViewWithRecipe:1];
  }
  else {
  BOOL v3 = [MEMORY[0x1E4F5AE08] controlCenterTertiaryMaterial];
  }
  placeholderBackground = self->_placeholderBackground;
  self->_placeholderBackground = v3;

  [(UIView *)self->_placeholderBackground setUserInteractionEnabled:0];
  [(UIView *)self->_placeholderBackground setClipsToBounds:1];
  int v5 = self->_placeholderBackground;

  [(MRUArtworkView *)self insertSubview:v5 atIndex:0];
}

- (void)updateVisualStyling
{
}

- (void)updateVisibility
{
  int64_t style = self->_style;
  switch(style)
  {
    case 7:
      BOOL v5 = self->_artworkImage != 0;
      placeholderBackground = self->_placeholderBackground;
LABEL_8:
      [(UIView *)placeholderBackground setHidden:v5];
      placeholderImageView = self->_placeholderImageView;
      BOOL v4 = 1;
LABEL_13:
      [(UIImageView *)placeholderImageView setHidden:v4];
      double v9 = 0.0;
      goto LABEL_17;
    case 9:
      placeholderBackground = self->_placeholderBackground;
      BOOL v5 = 1;
      goto LABEL_8;
    case 8:
      [(UIView *)self->_placeholderBackground setHidden:self->_artworkImage != 0];
      BOOL v4 = !self->_showPlaceholder || self->_artworkImage != 0;
      placeholderImageView = self->_placeholderImageView;
      goto LABEL_13;
  }
  [(UIView *)self->_placeholderBackground setHidden:self->_artworkImage != 0];
  BOOL v8 = !self->_showPlaceholder || self->_artworkImage != 0;
  [(UIImageView *)self->_placeholderImageView setHidden:v8];
  double v9 = 1.0;
  if (!self->_artworkImage) {
    double v9 = 0.0;
  }
LABEL_17:
  artworkShadowView = self->_artworkShadowView;

  [(MRUShadowView *)artworkShadowView setAlpha:v9];
}

- (void)updateStyle
{
  int64_t style = self->_style;
  [(UIImage *)self->_artworkImage size];
  double v6 = MRUArtworkCornerRadius(style, v4, v5) * self->_contentScale;
  [(UIView *)self->_placeholderBackground _setContinuousCornerRadius:v6];
  [(UIImageView *)self->_artworkImageView _setContinuousCornerRadius:v6];
  [(MRUShadowView *)self->_artworkShadowView _setContinuousCornerRadius:v6];
  [(MRUShadowView *)self->_artworkShadowView setOffset:MRUArtworkShadowOffset()];
  [(MRUShadowView *)self->_artworkShadowView setRadius:MRUArtworkShadowRadius(self->_style)];
  int64_t v7 = self->_style;
  BOOL v8 = [(MRUArtworkView *)self traitCollection];
  double v9 = MRUArtworkShadowOpacity(v7, [v8 userInterfaceStyle]);
  *(float *)&double v9 = v9;
  [(MRUShadowView *)self->_artworkShadowView setOpacity:v9];

  uint64_t v10 = MRUArtworkShadowColor((char *)self->_style);
  [(MRUShadowView *)self->_artworkShadowView setColor:v10];

  uint64_t v11 = MRUArtworkShadowFilter(self->_style);
  [(MRUShadowView *)self->_artworkShadowView setCompositingFilter:v11];

  MRUArtworkPlaceholderSymbolConfiguration(self->_style);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [(UIImageView *)self->_placeholderImageView setPreferredSymbolConfiguration:v12];
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
  [(MRUArtworkView *)self bounds];

  -[MRUArtworkView artworkFrameForSize:availableBounds:](self, "artworkFrameForSize:availableBounds:", v4, v6, v7, v8, v9, v10);
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
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
  if (!-[MRUArtworkView isSquare:](self, "isSquare:"))
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
  if (!-[MRUArtworkView isSquare:](self, "isSquare:", width, height))
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

- (void)updateArtworkFittingSize
{
  [(MRUArtworkView *)self bounds];
  BOOL v5 = self->_preferredContentSize.width == *MEMORY[0x1E4F1DB30];
  BOOL v6 = self->_preferredContentSize.height == *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v5 && v6) {
    double height = v4;
  }
  else {
    double height = self->_preferredContentSize.height;
  }
  if (v5 && v6) {
    double width = v3;
  }
  else {
    double width = self->_preferredContentSize.width;
  }
  if (self->_isArtworkControllerEnabled)
  {
    id v11 = [(MRUArtworkView *)self controller];
    objc_msgSend(v11, "setPreferredContentSize:", width, height);
  }
  else
  {
    id v11 = [(MRUArtworkView *)self imageLoader];
    double v9 = [(MRUArtworkView *)self traitCollection];
    [v9 displayScale];
    objc_msgSend(v11, "updateFittingSize:scale:", width, height, v10);
  }
}

- (UIImageView)artworkImageView
{
  return self->_artworkImageView;
}

- (void)setArtworkImageView:(id)a3
{
}

- (MRUArtwork)artwork
{
  return self->_artwork;
}

- (MPArtworkCatalog)catalog
{
  return self->_catalog;
}

- (UIImage)artworkImage
{
  return self->_artworkImage;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)showPlaceholder
{
  return self->_showPlaceholder;
}

- (CGSize)preferredContentSize
{
  double width = self->_preferredContentSize.width;
  double height = self->_preferredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  self->_preferredContentSize = a3;
}

- (BOOL)useVisualEffectPlaceholder
{
  return self->_useVisualEffectPlaceholder;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (MRUArtworkController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (MRUShadowView)artworkShadowView
{
  return self->_artworkShadowView;
}

- (void)setArtworkShadowView:(id)a3
{
}

- (MSVTimer)artworkTimer
{
  return self->_artworkTimer;
}

- (void)setArtworkTimer:(id)a3
{
}

- (int64_t)failedRetryCount
{
  return self->_failedRetryCount;
}

- (void)setFailedRetryCount:(int64_t)a3
{
  self->_failedRetryCount = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (BOOL)isArtworkControllerEnabled
{
  return self->_isArtworkControllerEnabled;
}

- (void)setIsArtworkControllerEnabled:(BOOL)a3
{
  self->_BOOL isArtworkControllerEnabled = a3;
}

- (UIView)placeholderBackground
{
  return self->_placeholderBackground;
}

- (void)setPlaceholderBackground:(id)a3
{
}

- (UIImageView)placeholderImageView
{
  return self->_placeholderImageView;
}

- (void)setPlaceholderImageView:(id)a3
{
}

- (void)setArtworkLoadingTimeout:(double)a3
{
  self->_artworkLoadingTimeout = a3;
}

- (MRUImageLoader)imageLoader
{
  return self->_imageLoader;
}

- (void)setImageLoader:(id)a3
{
}

- (BOOL)adjustsImageWhenHighlighted
{
  return self->_adjustsImageWhenHighlighted;
}

- (void)setAdjustsImageWhenHighlighted:(BOOL)a3
{
  self->_adjustsImageWhenHighlighted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLoader, 0);
  objc_storeStrong((id *)&self->_placeholderImageView, 0);
  objc_storeStrong((id *)&self->_placeholderBackground, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_artworkTimer, 0);
  objc_storeStrong((id *)&self->_artworkShadowView, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_artworkImage, 0);
  objc_storeStrong((id *)&self->_catalog, 0);
  objc_storeStrong((id *)&self->_artwork, 0);

  objc_storeStrong((id *)&self->_artworkImageView, 0);
}

@end