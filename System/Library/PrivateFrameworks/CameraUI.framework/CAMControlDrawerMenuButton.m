@interface CAMControlDrawerMenuButton
+ (id)_backgroundImage;
- (BOOL)_isTouchInTrackedView;
- (BOOL)_isTrackingExpansionToggle;
- (BOOL)_needsLoadMenuItems;
- (BOOL)_shouldTrackView:(id)a3 forTouchAtLocation:(CGPoint)a4;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)isExpandable;
- (BOOL)isExpanded;
- (BOOL)isMenuItemSelected:(id)a3;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)shouldScaleImageWhileHighlighted;
- (CAMControlDrawerMenuButton)initWithLayoutStyle:(int64_t)a3;
- (CAMControlDrawerMenuButtonDelegate)delegate;
- (NSArray)_cachedMenuItems;
- (NSMutableArray)_itemLabels;
- (UIEdgeInsets)expansionInsets;
- (UIImageView)_accessoryBackgroundView;
- (UIView)_highlightedView;
- (id)hudItemForAccessibilityHUDManager:(id)a3;
- (id)loadMenuItems;
- (unint64_t)_indexOfItemToTrackForTouchAtLocation:(CGPoint)a3;
- (unint64_t)_trackedItemIndex;
- (void)_loadMenuItemsIfNeeded;
- (void)_setCachedMenuItems:(id)a3;
- (void)_setExpanded:(BOOL)a3 animated:(BOOL)a4 shouldNotify:(BOOL)a5;
- (void)_setHighlightedView:(id)a3;
- (void)_setNeedsLoadMenuItems:(BOOL)a3;
- (void)_setTouchInTrackedView:(BOOL)a3;
- (void)_setTrackedItemIndex:(unint64_t)a3;
- (void)_setTrackingExpansionToggle:(BOOL)a3;
- (void)_updateHighlightedView;
- (void)_updateLabels;
- (void)_updateSubviewAlphas;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)didSelectMenuItem:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)selectedByAccessibilityHUDManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)setExpansionInsets:(UIEdgeInsets)a3;
- (void)setNeedsLoadMenuItems;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)updateLabelsIfNeeded;
@end

@implementation CAMControlDrawerMenuButton

+ (id)_backgroundImage
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__CAMControlDrawerMenuButton__backgroundImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_backgroundImage_onceToken_219 != -1) {
    dispatch_once(&_backgroundImage_onceToken_219, block);
  }
  v2 = (void *)_backgroundImage_resizableBackgroundImage;
  return v2;
}

void __46__CAMControlDrawerMenuButton__backgroundImage__block_invoke(uint64_t a1)
{
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___CAMControlDrawerMenuButton;
  uint64_t v1 = objc_msgSendSuper2(&v6, sel__backgroundImage);
  v2 = (void *)_backgroundImage_resizableBackgroundImage;
  _backgroundImage_resizableBackgroundImage = v1;

  [(id)_backgroundImage_resizableBackgroundImage size];
  uint64_t v4 = objc_msgSend((id)_backgroundImage_resizableBackgroundImage, "resizableImageWithCapInsets:", 0.0, v3 * 0.5, 0.0, v3 * 0.5);
  v5 = (void *)_backgroundImage_resizableBackgroundImage;
  _backgroundImage_resizableBackgroundImage = v4;
}

- (CAMControlDrawerMenuButton)initWithLayoutStyle:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CAMControlDrawerMenuButton;
  double v3 = [(CAMControlDrawerButton *)&v14 initWithLayoutStyle:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    itemLabels = v3->__itemLabels;
    v3->__itemLabels = (NSMutableArray *)v4;

    v3->__trackedItemIndex = 0x7FFFFFFFFFFFFFFFLL;
    v3->__needsLoadMenuItems = 1;
    id v6 = objc_alloc(MEMORY[0x263F82828]);
    v13.receiver = v3;
    v13.super_class = (Class)CAMControlDrawerMenuButton;
    v7 = objc_msgSend(-[CAMControlDrawerMenuButton class](&v13, sel_class), "_backgroundImage");
    uint64_t v8 = [v6 initWithImage:v7];
    accessoryBackgroundView = v3->__accessoryBackgroundView;
    v3->__accessoryBackgroundView = (UIImageView *)v8;

    v10 = v3->__accessoryBackgroundView;
    v11 = [(CAMControlDrawerButton *)v3 _imageView];
    [(CAMControlDrawerMenuButton *)v3 insertSubview:v10 belowSubview:v11];

    [(CAMControlDrawerMenuButton *)v3 _updateSubviewAlphas];
  }
  return v3;
}

- (BOOL)isExpandable
{
  return 1;
}

- (BOOL)shouldScaleImageWhileHighlighted
{
  return 0;
}

- (void)layoutSubviews
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  v68.receiver = self;
  v68.super_class = (Class)CAMControlDrawerMenuButton;
  [(CAMControlDrawerButton *)&v68 layoutSubviews];
  double v3 = [(CAMControlDrawerMenuButton *)self _itemLabels];
  uint64_t v4 = [(CAMControlDrawerButton *)self _backgroundView];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  objc_super v13 = [(CAMControlDrawerButton *)self _slashView];
  objc_super v14 = [(CAMControlDrawerButton *)self _imageView];
  [v14 center];
  double v16 = v15;
  double v18 = v17;
  if ([(CAMControlDrawerMenuButton *)self isExpanded])
  {
    [(CAMControlDrawerMenuButton *)self expansionInsets];
    double v19 = 0.0;
    CGFloat v55 = v12;
    UIRectInset();
    double v8 = v20;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v54 = v25;
    objc_msgSend(v4, "setFrame:");
    [v14 bounds];
    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    objc_msgSend(v14, "setCenter:");
    [v13 bounds];
    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    objc_msgSend(v13, "setCenter:");
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v26 = v3;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v64 objects:v71 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v65 != v29) {
            objc_enumerationMutation(v26);
          }
          [*(id *)(*((void *)&v64 + 1) + 8 * i) bounds];
          double v19 = v19 + v31;
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v64 objects:v71 count:16];
      }
      while (v28);
    }

    [v26 count];
    v32 = [v4 image];
    [v32 size];

    v73.size.height = v55;
    v73.origin.x = v54;
    v73.origin.y = v8;
    v73.size.width = v10;
    CGRectGetMaxX(v73);
    v74.origin.x = v54;
    v74.origin.y = v8;
    v74.size.width = v22;
    v74.size.height = v24;
    CGRectGetMidY(v74);
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v33 = v26;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v60 objects:v70 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v61 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = *(void **)(*((void *)&v60 + 1) + 8 * j);
          [v38 bounds];
          UIRectIntegralWithScale();
          CGFloat v40 = v39;
          CGFloat v42 = v41;
          CGFloat v44 = v43;
          CGFloat v46 = v45;
          UIRectGetCenter();
          objc_msgSend(v38, "setCenter:");
          v75.origin.x = v40;
          v75.origin.y = v42;
          v75.size.width = v44;
          v75.size.height = v46;
          double MaxX = CGRectGetMaxX(v75);
        }
        uint64_t v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v60, v70, 16, MaxX);
      }
      while (v35);
    }

    double v6 = v54;
    double v12 = v55;
  }
  else
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v48 = v3;
    uint64_t v49 = [v48 countByEnumeratingWithState:&v56 objects:v69 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v57;
      do
      {
        for (uint64_t k = 0; k != v50; ++k)
        {
          if (*(void *)v57 != v51) {
            objc_enumerationMutation(v48);
          }
          objc_msgSend(*(id *)(*((void *)&v56 + 1) + 8 * k), "setCenter:", v16, v18);
        }
        uint64_t v50 = [v48 countByEnumeratingWithState:&v56 objects:v69 count:16];
      }
      while (v50);
    }
  }
  v53 = [(CAMControlDrawerMenuButton *)self _accessoryBackgroundView];
  objc_msgSend(v53, "setFrame:", v6, v8, v10, v12);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CAMControlDrawerMenuButton;
  [(CAMControlDrawerButton *)&v8 setOrientation:a3 animated:a4];
  if ((unint64_t)(a3 - 1) <= 1)
  {
    double v6 = [(CAMControlDrawerMenuButton *)self _itemLabels];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __54__CAMControlDrawerMenuButton_setOrientation_animated___block_invoke;
    v7[3] = &__block_descriptor_40_e24_v32__0__UILabel_8Q16_B24l;
    v7[4] = a3;
    [v6 enumerateObjectsUsingBlock:v7];
  }
}

uint64_t __54__CAMControlDrawerMenuButton_setOrientation_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CAMView rotateView:a2 toInterfaceOrientation:*(void *)(a1 + 32) animated:0];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)CAMControlDrawerMenuButton;
  if (-[CAMControlDrawerMenuButton pointInside:withEvent:](&v9, sel_pointInside_withEvent_, a4))
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    BOOL v7 = [(CAMControlDrawerMenuButton *)self isExpanded];
    if (v7)
    {
      [(CAMControlDrawerMenuButton *)self expansionInsets];
      [(CAMControlDrawerMenuButton *)self bounds];
      UIRectInset();
      v10.CGFloat x = x;
      v10.CGFloat y = y;
      LOBYTE(v7) = CGRectContainsPoint(v11, v10);
    }
  }
  return v7;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CAMControlDrawerMenuButton *)self isExpanded])
  {
    [v6 locationInView:self];
    double v9 = v8;
    double v11 = v10;
    -[CAMControlDrawerMenuButton _setTrackedItemIndex:](self, "_setTrackedItemIndex:", -[CAMControlDrawerMenuButton _indexOfItemToTrackForTouchAtLocation:](self, "_indexOfItemToTrackForTouchAtLocation:"));
    double v12 = [(CAMControlDrawerMenuButton *)self _accessoryBackgroundView];
    -[CAMControlDrawerMenuButton _setTrackingExpansionToggle:](self, "_setTrackingExpansionToggle:", -[CAMControlDrawerMenuButton _shouldTrackView:forTouchAtLocation:](self, "_shouldTrackView:forTouchAtLocation:", v12, v9, v11));
  }
  else
  {
    [(CAMControlDrawerMenuButton *)self _setTrackingExpansionToggle:1];
  }
  BOOL v13 = [(CAMControlDrawerMenuButton *)self _isTrackingExpansionToggle]
     || [(CAMControlDrawerMenuButton *)self _trackedItemIndex] != 0x7FFFFFFFFFFFFFFFLL;
  [(CAMControlDrawerMenuButton *)self _setTouchInTrackedView:v13];
  [(CAMControlDrawerMenuButton *)self _updateHighlightedView];
  v16.receiver = self;
  v16.super_class = (Class)CAMControlDrawerMenuButton;
  BOOL v14 = [(CAMControlDrawerMenuButton *)&v16 beginTrackingWithTouch:v6 withEvent:v7];

  return v14;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 locationInView:self];
  double v9 = v8;
  double v11 = v10;
  if (![(CAMControlDrawerMenuButton *)self isTouchInside])
  {
LABEL_5:
    BOOL v13 = 0;
    goto LABEL_6;
  }
  if (![(CAMControlDrawerMenuButton *)self _isTrackingExpansionToggle])
  {
    if ([(CAMControlDrawerMenuButton *)self _trackedItemIndex] != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v16 = [(CAMControlDrawerMenuButton *)self _trackedItemIndex];
      BOOL v13 = v16 == -[CAMControlDrawerMenuButton _indexOfItemToTrackForTouchAtLocation:](self, "_indexOfItemToTrackForTouchAtLocation:", v9, v11);
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  double v12 = [(CAMControlDrawerMenuButton *)self _accessoryBackgroundView];
  BOOL v13 = -[CAMControlDrawerMenuButton _shouldTrackView:forTouchAtLocation:](self, "_shouldTrackView:forTouchAtLocation:", v12, v9, v11);

LABEL_6:
  [(CAMControlDrawerMenuButton *)self _setTouchInTrackedView:v13];
  [(CAMControlDrawerMenuButton *)self _updateHighlightedView];
  v17.receiver = self;
  v17.super_class = (Class)CAMControlDrawerMenuButton;
  BOOL v14 = [(CAMControlDrawerMenuButton *)&v17 continueTrackingWithTouch:v7 withEvent:v6];

  return v14;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CAMControlDrawerMenuButton *)self isExpanded]
    && [(CAMControlDrawerMenuButton *)self _isTouchInTrackedView])
  {
    [v6 locationInView:self];
    double v9 = v8;
    double v11 = v10;
    if ([(CAMControlDrawerMenuButton *)self _isTrackingExpansionToggle])
    {
      double v12 = [(CAMControlDrawerMenuButton *)self _accessoryBackgroundView];
      BOOL v13 = -[CAMControlDrawerMenuButton _shouldTrackView:forTouchAtLocation:](self, "_shouldTrackView:forTouchAtLocation:", v12, v9, v11);

      uint64_t v14 = !v13;
      double v15 = self;
LABEL_8:
      [(CAMControlDrawerMenuButton *)v15 _setExpanded:v14 animated:1 shouldNotify:1];
      goto LABEL_9;
    }
    if ([(CAMControlDrawerMenuButton *)self _trackedItemIndex] != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v16 = -[CAMControlDrawerMenuButton _indexOfItemToTrackForTouchAtLocation:](self, "_indexOfItemToTrackForTouchAtLocation:", v9, v11);
      if (v16 == [(CAMControlDrawerMenuButton *)self _trackedItemIndex])
      {
        objc_super v17 = [(CAMControlDrawerMenuButton *)self _cachedMenuItems];
        double v18 = [v17 objectAtIndexedSubscript:v16];

        [(CAMControlDrawerMenuButton *)self didSelectMenuItem:v18];
        double v19 = [(CAMControlDrawerMenuButton *)self delegate];
        [v19 menuButtonDidSelectItem:self];

        [(CAMControlDrawerMenuButton *)self _setExpanded:0 animated:1 shouldNotify:1];
      }
    }
  }
  else if ([(CAMControlDrawerMenuButton *)self _isTouchInTrackedView] {
         && [(CAMControlDrawerMenuButton *)self isExpandable])
  }
  {
    double v15 = self;
    uint64_t v14 = 1;
    goto LABEL_8;
  }
LABEL_9:
  [(CAMControlDrawerMenuButton *)self _setTouchInTrackedView:0];
  [(CAMControlDrawerMenuButton *)self _setTrackingExpansionToggle:0];
  [(CAMControlDrawerMenuButton *)self _setTrackedItemIndex:0x7FFFFFFFFFFFFFFFLL];
  [(CAMControlDrawerMenuButton *)self _updateHighlightedView];
  v20.receiver = self;
  v20.super_class = (Class)CAMControlDrawerMenuButton;
  [(CAMControlDrawerMenuButton *)&v20 endTrackingWithTouch:v6 withEvent:v7];
}

- (void)cancelTrackingWithEvent:(id)a3
{
  id v4 = a3;
  [(CAMControlDrawerMenuButton *)self _setTouchInTrackedView:0];
  [(CAMControlDrawerMenuButton *)self _setTrackingExpansionToggle:0];
  [(CAMControlDrawerMenuButton *)self _setTrackedItemIndex:0x7FFFFFFFFFFFFFFFLL];
  [(CAMControlDrawerMenuButton *)self _updateHighlightedView];
  v5.receiver = self;
  v5.super_class = (Class)CAMControlDrawerMenuButton;
  [(CAMControlDrawerMenuButton *)&v5 cancelTrackingWithEvent:v4];
}

- (unint64_t)_indexOfItemToTrackForTouchAtLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  if ([(CAMControlDrawerMenuButton *)self isExpanded])
  {
    id v6 = [(CAMControlDrawerMenuButton *)self _itemLabels];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __68__CAMControlDrawerMenuButton__indexOfItemToTrackForTouchAtLocation___block_invoke;
    v9[3] = &unk_263FA4950;
    *(CGFloat *)&v9[6] = x;
    *(CGFloat *)&v9[7] = y;
    v9[4] = self;
    v9[5] = &v10;
    [v6 enumerateObjectsUsingBlock:v9];
  }
  unint64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __68__CAMControlDrawerMenuButton__indexOfItemToTrackForTouchAtLocation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_shouldTrackView:forTouchAtLocation:", a2, *(double *)(a1 + 48), *(double *)(a1 + 56));
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (BOOL)_shouldTrackView:(id)a3 forTouchAtLocation:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v6 = a3;
  [v6 frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v6 origin];
  double v16 = v15;

  v21.origin.CGFloat x = v8;
  v21.origin.CGFloat y = v10;
  v21.size.width = v12;
  v21.size.height = v14;
  CGRect v22 = CGRectInset(v21, -20.0, -v16);
  CGFloat v17 = x;
  CGFloat v18 = y;
  return CGRectContainsPoint(v22, *(CGPoint *)&v17);
}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  id v4 = a3;
  [v4 locationOfAccessibilityGestureInView:self];
  double v6 = v5;
  double v8 = v7;
  if ([(CAMControlDrawerMenuButton *)self isExpanded]
    && ([(CAMControlDrawerMenuButton *)self _accessoryBackgroundView],
        double v9 = objc_claimAutoreleasedReturnValue(),
        BOOL v10 = -[CAMControlDrawerMenuButton _shouldTrackView:forTouchAtLocation:](self, "_shouldTrackView:forTouchAtLocation:", v9, v6, v8), v9, !v10))
  {
    if ([(CAMControlDrawerMenuButton *)self isExpanded]
      && (unint64_t v12 = -[CAMControlDrawerMenuButton _indexOfItemToTrackForTouchAtLocation:](self, "_indexOfItemToTrackForTouchAtLocation:", v6, v8), v12 != 0x7FFFFFFFFFFFFFFFLL))
    {
      unint64_t v13 = v12;
      CGFloat v14 = [(CAMControlDrawerMenuButton *)self _cachedMenuItems];
      double v15 = [v14 objectAtIndexedSubscript:v13];

      v18.receiver = self;
      v18.super_class = (Class)CAMControlDrawerMenuButton;
      double v11 = [(CAMControlDrawerButton *)&v18 hudItemForAccessibilityHUDManager:v4];
      double v16 = [v15 title];
      [v11 setTitle:v16];
    }
    else
    {
      double v11 = 0;
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)CAMControlDrawerMenuButton;
    double v11 = [(CAMControlDrawerButton *)&v19 hudItemForAccessibilityHUDManager:v4];
  }

  return v11;
}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
  [a3 locationOfAccessibilityGestureInView:self];
  double v5 = v4;
  double v7 = v6;
  if ([(CAMControlDrawerMenuButton *)self isExpanded]
    && ([(CAMControlDrawerMenuButton *)self _accessoryBackgroundView],
        double v8 = objc_claimAutoreleasedReturnValue(),
        BOOL v9 = -[CAMControlDrawerMenuButton _shouldTrackView:forTouchAtLocation:](self, "_shouldTrackView:forTouchAtLocation:", v8, v5, v7), v8, !v9))
  {
    if ([(CAMControlDrawerMenuButton *)self isExpanded])
    {
      unint64_t v10 = -[CAMControlDrawerMenuButton _indexOfItemToTrackForTouchAtLocation:](self, "_indexOfItemToTrackForTouchAtLocation:", v5, v7);
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v11 = v10;
        unint64_t v12 = [(CAMControlDrawerMenuButton *)self _cachedMenuItems];
        unint64_t v13 = [v12 objectAtIndexedSubscript:v11];

        [(CAMControlDrawerMenuButton *)self didSelectMenuItem:v13];
        CGFloat v14 = [(CAMControlDrawerMenuButton *)self delegate];
        [v14 menuButtonDidSelectItem:self];

        [(CAMControlDrawerMenuButton *)self _setExpanded:0 animated:1 shouldNotify:1];
      }
    }
  }
  else
  {
    [(CAMControlDrawerMenuButton *)self _setExpanded:[(CAMControlDrawerMenuButton *)self isExpanded] ^ 1 animated:1 shouldNotify:1];
  }
  [(CAMControlDrawerMenuButton *)self cancelTouchTracking];
  [(CAMControlDrawerMenuButton *)self sendActionsForControlEvents:64];
}

- (void)_updateHighlightedView
{
  if ([(CAMControlDrawerMenuButton *)self _isTouchInTrackedView])
  {
    if ([(CAMControlDrawerMenuButton *)self _isTrackingExpansionToggle])
    {
      uint64_t v3 = [(CAMControlDrawerButton *)self _imageView];
    }
    else
    {
      double v4 = [(CAMControlDrawerMenuButton *)self _itemLabels];
      objc_msgSend(v4, "objectAtIndexedSubscript:", -[CAMControlDrawerMenuButton _trackedItemIndex](self, "_trackedItemIndex"));
      id v5 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v3 = (uint64_t)v5;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v6 = (id)v3;
  [(CAMControlDrawerMenuButton *)self _setHighlightedView:v3];
}

- (void)_setHighlightedView:(id)a3
{
  id v5 = (UIView *)a3;
  p_highlightedView = (id *)&self->__highlightedView;
  highlightedView = self->__highlightedView;
  objc_super v18 = v5;
  if (highlightedView != v5)
  {
    if (highlightedView)
    {
      double v8 = [(UIView *)highlightedView layer];
      +[CAMAnimationHelper animateLayer:v8 forButtonHighlighted:0 layoutStyle:[(CAMControlDrawerButton *)self layoutStyle]];

      id v9 = *p_highlightedView;
      id v10 = [(CAMControlDrawerButton *)self _imageView];

      if (v9 == v10)
      {
        unint64_t v11 = [(CAMControlDrawerButton *)self _slashView];
        unint64_t v12 = [v11 layer];
        +[CAMAnimationHelper animateLayer:v12 forButtonHighlighted:0 layoutStyle:[(CAMControlDrawerButton *)self layoutStyle]];
      }
    }
    objc_storeStrong((id *)&self->__highlightedView, a3);
    if (*p_highlightedView)
    {
      unint64_t v13 = [*p_highlightedView layer];
      +[CAMAnimationHelper animateLayer:v13 forButtonHighlighted:1 layoutStyle:[(CAMControlDrawerButton *)self layoutStyle]];

      id v14 = *p_highlightedView;
      id v15 = [(CAMControlDrawerButton *)self _imageView];

      if (v14 == v15)
      {
        double v16 = [(CAMControlDrawerButton *)self _slashView];
        CGFloat v17 = [v16 layer];
        +[CAMAnimationHelper animateLayer:v17 forButtonHighlighted:1 layoutStyle:[(CAMControlDrawerButton *)self layoutStyle]];
      }
    }
  }
}

- (void)_updateLabels
{
  [(CAMControlDrawerMenuButton *)self _loadMenuItemsIfNeeded];
  uint64_t v3 = [(CAMControlDrawerMenuButton *)self _cachedMenuItems];
  unint64_t v4 = [v3 count];
  id v5 = [(CAMControlDrawerMenuButton *)self _itemLabels];
  while ([v5 count] < v4)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F828E0]);
    [(CAMControlDrawerMenuButton *)self addSubview:v6];
    [v5 addObject:v6];
    if ([(CAMControlDrawerButton *)self orientation] == 2)
    {
      CAMOrientationTransform([(CAMControlDrawerButton *)self orientation], (uint64_t)v15);
      v14[0] = v15[0];
      v14[1] = v15[1];
      v14[2] = v15[2];
      [v6 setTransform:v14];
    }
  }
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __43__CAMControlDrawerMenuButton__updateLabels__block_invoke;
  unint64_t v11 = &unk_263FA4978;
  id v12 = v3;
  unint64_t v13 = self;
  id v7 = v3;
  [v5 enumerateObjectsUsingBlock:&v8];
  [(CAMControlDrawerMenuButton *)self _updateSubviewAlphas];
}

void __43__CAMControlDrawerMenuButton__updateLabels__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v22 = a2;
  id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  if ([*(id *)(a1 + 40) isMenuItemSelected:v5])
  {
    id v6 = [MEMORY[0x263F825C8] systemYellowColor];
    [v22 setTextColor:v6];

    [v5 selectedTitle];
  }
  else
  {
    id v7 = [MEMORY[0x263F825C8] whiteColor];
    [v22 setTextColor:v7];

    [v5 title];
  uint64_t v8 = };
  uint64_t v9 = [*(id *)(a1 + 40) traitCollection];
  id v10 = [v9 preferredContentSizeCategory];
  +[CAMFont cameraModeDialFontSizeForContentSize:v10];
  double v12 = v11;

  unint64_t v13 = [v22 text];
  if (([v8 isEqualToString:v13] & 1) == 0)
  {

    goto LABEL_8;
  }
  id v14 = [v22 font];
  [v14 pointSize];
  double v16 = v15;

  if (v12 != v16)
  {
LABEL_8:
    [v22 setText:v8];
    CGFloat v17 = +[CAMFont cameraFontOfSize:v12];
    [v22 setFont:v17];

    double v18 = *MEMORY[0x263F00148];
    double v19 = *(double *)(MEMORY[0x263F00148] + 8);
    [v22 intrinsicContentSize];
    objc_msgSend(v22, "setBounds:", v18, v19, v20, v21);
  }
}

- (void)_updateSubviewAlphas
{
  BOOL v3 = [(CAMControlDrawerMenuButton *)self isExpanded];
  unint64_t v4 = [(CAMControlDrawerMenuButton *)self _cachedMenuItems];
  uint64_t v5 = [v4 count];

  id v6 = [(CAMControlDrawerMenuButton *)self _itemLabels];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__CAMControlDrawerMenuButton__updateSubviewAlphas__block_invoke;
  v9[3] = &__block_descriptor_41_e24_v32__0__UILabel_8Q16_B24l;
  BOOL v10 = v3;
  v9[4] = v5;
  [v6 enumerateObjectsUsingBlock:v9];

  if (v3) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  uint64_t v8 = [(CAMControlDrawerMenuButton *)self _accessoryBackgroundView];
  [v8 setAlpha:v7];
}

uint64_t __50__CAMControlDrawerMenuButton__updateSubviewAlphas__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  if (*(unsigned char *)(a1 + 40))
  {
    double v3 = 0.0;
    if (*(void *)(a1 + 32) > a3) {
      double v3 = 1.0;
    }
  }
  else
  {
    double v3 = 0.0;
  }
  return [a2 setAlpha:v3];
}

- (void)setExpansionInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_expansionInsets.left
    || a3.top != self->_expansionInsets.top
    || a3.right != self->_expansionInsets.right
    || a3.bottom != self->_expansionInsets.bottom)
  {
    self->_expansionInsets = a3;
    [(CAMControlDrawerMenuButton *)self setNeedsLayout];
  }
}

- (void)setExpanded:(BOOL)a3
{
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)_setExpanded:(BOOL)a3 animated:(BOOL)a4 shouldNotify:(BOOL)a5
{
  if (self->_expanded == a3) {
    return;
  }
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  if (a3)
  {
    [(CAMControlDrawerMenuButton *)self _updateLabels];
    if (!v6)
    {
LABEL_4:
      if (!v5) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if (!a4)
  {
    goto LABEL_4;
  }
  [(CAMControlDrawerMenuButton *)self layoutIfNeeded];
  if (v5)
  {
LABEL_5:
    uint64_t v9 = [(CAMControlDrawerMenuButton *)self delegate];
    [v9 expandableButton:self willChangeExpanded:v7];
  }
LABEL_6:
  self->_expanded = v7;
  [(CAMControlDrawerMenuButton *)self setNeedsLayout];
  if (v6)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __65__CAMControlDrawerMenuButton__setExpanded_animated_shouldNotify___block_invoke;
    v18[3] = &unk_263FA0208;
    v18[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:2 delay:v18 usingSpringWithDamping:0 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:1.0];
    if (v7)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __65__CAMControlDrawerMenuButton__setExpanded_animated_shouldNotify___block_invoke_2;
      v17[3] = &unk_263FA0208;
      v17[4] = self;
      double v10 = 0.05;
      double v11 = 0.5;
      double v12 = 1.0;
      double v13 = 1.0;
      id v14 = v17;
      uint64_t v15 = 2;
    }
    else
    {
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __65__CAMControlDrawerMenuButton__setExpanded_animated_shouldNotify___block_invoke_3;
      v16[3] = &unk_263FA0208;
      v16[4] = self;
      double v11 = 0.25;
      double v10 = 0.0;
      double v12 = 1.0;
      id v14 = v16;
      double v13 = 1.0;
      uint64_t v15 = 0;
    }
    [MEMORY[0x263F82E00] animateWithDuration:v15 delay:v14 usingSpringWithDamping:0 initialSpringVelocity:v11 options:v10 animations:v12 completion:v13];
  }
  else
  {
    [(CAMControlDrawerMenuButton *)self _updateSubviewAlphas];
  }
}

uint64_t __65__CAMControlDrawerMenuButton__setExpanded_animated_shouldNotify___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __65__CAMControlDrawerMenuButton__setExpanded_animated_shouldNotify___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSubviewAlphas];
}

uint64_t __65__CAMControlDrawerMenuButton__setExpanded_animated_shouldNotify___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSubviewAlphas];
}

- (void)_loadMenuItemsIfNeeded
{
  if ([(CAMControlDrawerMenuButton *)self _needsLoadMenuItems])
  {
    double v3 = [(CAMControlDrawerMenuButton *)self loadMenuItems];
    [(CAMControlDrawerMenuButton *)self _setCachedMenuItems:v3];

    [(CAMControlDrawerMenuButton *)self _setNeedsLoadMenuItems:0];
  }
}

- (void)setNeedsLoadMenuItems
{
  [(CAMControlDrawerMenuButton *)self _setNeedsLoadMenuItems:1];
  if ([(CAMControlDrawerMenuButton *)self isExpanded])
  {
    [(CAMControlDrawerMenuButton *)self _updateLabels];
  }
}

- (void)updateLabelsIfNeeded
{
  if ([(CAMControlDrawerMenuButton *)self isExpanded])
  {
    [(CAMControlDrawerMenuButton *)self _updateLabels];
  }
}

- (id)loadMenuItems
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF488];
  unint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"%@ must be implemented by subclasses", v4 format];

  return (id)MEMORY[0x263EFFA68];
}

- (void)didSelectMenuItem:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF488];
  NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 raise:v4, @"%@ must be implemented by subclasses", v5 format];
}

- (BOOL)isMenuItemSelected:(id)a3
{
  return 0;
}

- (UIEdgeInsets)expansionInsets
{
  double top = self->_expansionInsets.top;
  double left = self->_expansionInsets.left;
  double bottom = self->_expansionInsets.bottom;
  double right = self->_expansionInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CAMControlDrawerMenuButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMControlDrawerMenuButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (UIImageView)_accessoryBackgroundView
{
  return self->__accessoryBackgroundView;
}

- (NSMutableArray)_itemLabels
{
  return self->__itemLabels;
}

- (NSArray)_cachedMenuItems
{
  return self->__cachedMenuItems;
}

- (void)_setCachedMenuItems:(id)a3
{
}

- (BOOL)_needsLoadMenuItems
{
  return self->__needsLoadMenuItems;
}

- (void)_setNeedsLoadMenuItems:(BOOL)a3
{
  self->__needsLoadMenuItems = a3;
}

- (unint64_t)_trackedItemIndex
{
  return self->__trackedItemIndex;
}

- (void)_setTrackedItemIndex:(unint64_t)a3
{
  self->__trackedItemIndeCGFloat x = a3;
}

- (BOOL)_isTrackingExpansionToggle
{
  return self->__trackingExpansionToggle;
}

- (void)_setTrackingExpansionToggle:(BOOL)a3
{
  self->__trackingExpansionToggle = a3;
}

- (BOOL)_isTouchInTrackedView
{
  return self->__touchInTrackedView;
}

- (void)_setTouchInTrackedView:(BOOL)a3
{
  self->__touchInTrackedView = a3;
}

- (UIView)_highlightedView
{
  return self->__highlightedView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__highlightedView, 0);
  objc_storeStrong((id *)&self->__cachedMenuItems, 0);
  objc_storeStrong((id *)&self->__itemLabels, 0);
  objc_storeStrong((id *)&self->__accessoryBackgroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end