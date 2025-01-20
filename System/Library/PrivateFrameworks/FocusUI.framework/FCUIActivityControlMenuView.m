@interface FCUIActivityControlMenuView
- (BOOL)_toggleHighlightForMenuElement:(id)a3;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (FCUIActivityControlMenuView)initWithFrame:(CGRect)a3;
- (NSArray)menuItemActions;
- (NSArray)menuItemElements;
- (NSArray)requiredVisualStyleCategories;
- (NSString)menuAlternativeDescription;
- (UIAction)footerAction;
- (UIGestureRecognizer)pressGestureRecognizer;
- (double)_continuousCornerRadius;
- (id)_newMenuItemView;
- (void)_configureFooterViewIfNecessary;
- (void)_handlePressGesture:(id)a3;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6;
- (void)_visualStylingProvider:(id)a3 didChangeForCategory:(int64_t)a4 outgoingProvider:(id)a5;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setFooterAction:(id)a3;
- (void)setMenuAlternativeDescription:(id)a3;
- (void)setMenuItemActions:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
@end

@implementation FCUIActivityControlMenuView

- (FCUIActivityControlMenuView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)FCUIActivityControlMenuView;
  v3 = -[FCUIActivityControlMenuView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIGestureRecognizer *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:v3 action:sel__handlePressGesture_];
    [(UIGestureRecognizer *)v4 setDelegate:v3];
    [(UIGestureRecognizer *)v4 setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)v4 setDelaysTouchesEnded:0];
    [(UIGestureRecognizer *)v4 setMinimumPressDuration:0.0];
    [(UIGestureRecognizer *)v4 _setKeepTouchesOnContinuation:1];
    pressGestureRecognizer = v3->_pressGestureRecognizer;
    v3->_pressGestureRecognizer = v4;
    v6 = v4;

    [(FCUIActivityControlMenuView *)v3 addGestureRecognizer:v6];
    id v7 = objc_alloc(MEMORY[0x263F82BC0]);
    v8 = [MEMORY[0x263F830C8] lightConfiguration];
    uint64_t v9 = [v7 initWithConfiguration:v8 view:v3];
    feedbackGenerator = v3->_feedbackGenerator;
    v3->_feedbackGenerator = (UISelectionFeedbackGenerator *)v9;
  }
  return v3;
}

- (NSArray)menuItemActions
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_menuItemViews;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "defaultAction", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)_newMenuItemView
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(FCUIActivityControlMenuItemView);
  [(FCUIActivityControlMenuItemView *)v3 setAdjustsFontForContentSizeCategory:self->_adjustsFontForContentSizeCategory];
  [(FCUIActivityControlMenuItemView *)v3 setAlpha:0.0];
  [(FCUIActivityControlMenuView *)self addSubview:v3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(FCUIActivityControlMenuItemView *)v3 requiredVisualStyleCategories];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v10 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:v9];
        -[FCUIActivityControlMenuItemView setVisualStylingProvider:forCategory:](v3, "setVisualStylingProvider:forCategory:", v10, [v9 integerValue]);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)setMenuItemActions:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v6 = [v4 count];
  uint64_t v7 = v5;
  v8 = self;
  id v33 = (id)[v7 initWithCapacity:v6];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v4;
  uint64_t v34 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v34)
  {
    uint64_t v31 = *(void *)v45;
    v32 = self;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v45 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = v9;
        v10 = *(void **)(*((void *)&v44 + 1) + 8 * v9);
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v11 = v8->_menuItemViews;
        uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v40 objects:v49 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v41;
          while (2)
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v41 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(NSArray **)(*((void *)&v40 + 1) + 8 * v15);
              uint64_t v17 = [v10 identifier];
              v18 = [(NSArray *)v16 defaultAction];
              v19 = [v18 identifier];
              char v20 = BSEqualStrings();

              if (v20)
              {
                v8 = v32;
                goto LABEL_16;
              }
              ++v15;
            }
            while (v13 != v15);
            uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v40 objects:v49 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

        v8 = v32;
        uint64_t v16 = [(FCUIActivityControlMenuView *)v32 _newMenuItemView];
        long long v11 = v16;
LABEL_16:
        [(NSArray *)v16 setDefaultAction:v10];
        [v33 addObject:v16];

        uint64_t v9 = v35 + 1;
      }
      while (v35 + 1 != v34);
      uint64_t v34 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v34);
  }

  v21 = (void *)[(NSArray *)v8->_menuItemViews mutableCopy];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v22 = v33;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v37;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(v22);
        }
        [v21 removeObject:*(void *)(*((void *)&v36 + 1) + 8 * v26++)];
      }
      while (v24 != v26);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v24);
  }

  objc_storeStrong((id *)&v8->_menuItemViews, v33);
  outgoingMenuItemViews = v8->_outgoingMenuItemViews;
  if (!outgoingMenuItemViews)
  {
    v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v29 = v8->_outgoingMenuItemViews;
    v8->_outgoingMenuItemViews = v28;

    outgoingMenuItemViews = v8->_outgoingMenuItemViews;
  }
  [(NSMutableArray *)outgoingMenuItemViews addObjectsFromArray:v21];
  [(FCUIActivityControlMenuView *)v8 setNeedsLayout];
}

- (NSArray)menuItemElements
{
  return self->_menuItemViews;
}

- (NSString)menuAlternativeDescription
{
  v2 = [(NSArray *)self->_menuItemViews firstObject];
  id v3 = [v2 alternativeDescription];

  return (NSString *)v3;
}

- (void)setMenuAlternativeDescription:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  menuItemViews = self->_menuItemViews;
  id v5 = a3;
  uint64_t v6 = [(NSArray *)menuItemViews firstObject];
  uint64_t v7 = [v6 alternativeDescription];
  if ([v7 length])
  {
    id v8 = [(NSArray *)self->_menuItemViews firstObject];
  }
  else
  {
    id v8 = [(FCUIActivityControlMenuView *)self _newMenuItemView];
  }
  uint64_t v9 = v8;

  [v9 setAlternativeDescription:v5];
  v10 = [(NSArray *)self->_menuItemViews firstObject];

  if (v10 != v9)
  {
    [(FCUIActivityControlMenuView *)self setMenuItemActions:0];
    v13[0] = v9;
    long long v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    uint64_t v12 = self->_menuItemViews;
    self->_menuItemViews = v11;
  }
  [(FCUIActivityControlMenuView *)self setNeedsLayout];
}

- (UIAction)footerAction
{
  return [(_FCUIActivityControlMenuFooterView *)self->_footerView footerAction];
}

- (void)setFooterAction:(id)a3
{
  id v7 = a3;
  id v4 = [(FCUIActivityControlMenuView *)self footerAction];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    id v6 = v7;
    if (v7)
    {
      [(FCUIActivityControlMenuView *)self _configureFooterViewIfNecessary];
      id v6 = v7;
    }
    [(_FCUIActivityControlMenuFooterView *)self->_footerView setFooterAction:v6];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v23 = *MEMORY[0x263EF8340];
  double v6 = *MEMORY[0x263F001B0];
  double v7 = *(double *)(MEMORY[0x263F001B0] + 8);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = self->_menuItemViews;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v12), "sizeThatFits:", width, height, (void)v18);
        if (v6 < v13) {
          double v6 = v13;
        }
        double v7 = v7 + v14;
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  [(FCUIActivityControlMenuView *)self _configureFooterViewIfNecessary];
  -[_FCUIActivityControlMenuFooterView sizeThatFits:](self->_footerView, "sizeThatFits:", width, height);
  double v16 = v7 + v15;
  double v17 = v6;
  result.double height = v16;
  result.double width = v17;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v43.receiver = self;
  v43.super_class = (Class)FCUIActivityControlMenuView;
  [(FCUIActivityControlMenuView *)&v43 layoutSubviews];
  [(FCUIActivityControlMenuView *)self bounds];
  double width = v47.size.width;
  double height = v47.size.height;
  CGFloat v5 = CGRectGetWidth(v47);
  NSUInteger v6 = [(NSArray *)self->_menuItemViews count];
  if (v6)
  {
    NSUInteger v7 = v6;
    NSUInteger v8 = 0;
    NSUInteger v9 = v6 - 1;
    CGFloat v10 = 0.0;
    CGFloat v11 = 0.0;
    CGFloat v12 = 0.0;
    do
    {
      double v13 = [(NSArray *)self->_menuItemViews objectAtIndex:v8];
      objc_msgSend(v13, "sizeThatFits:", width, height);
      BSRectWithSize();
      v48.size.double width = v5;
      v48.origin.x = v10;
      v48.origin.y = v11;
      v48.size.double height = v12;
      CGRectGetMaxY(v48);
      UIRectIntegralWithScale();
      CGFloat v10 = v14;
      CGFloat v11 = v15;
      CGFloat v5 = v16;
      CGFloat v12 = v17;
      objc_msgSend(v13, "setFrame:");
      [v13 setSeparatorVisible:v8 < v9];
      long long v18 = (void *)MEMORY[0x263F82E00];
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __45__FCUIActivityControlMenuView_layoutSubviews__block_invoke;
      v41[3] = &unk_264542B68;
      id v42 = v13;
      id v19 = v13;
      [v18 performWithoutAnimation:v41];
      [v19 setAlpha:1.0];

      ++v8;
    }
    while (v7 != v8);
  }
  else
  {
    CGFloat v12 = 0.0;
    CGFloat v11 = 0.0;
    CGFloat v10 = 0.0;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v20 = self->_outgoingMenuItemViews;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v37 + 1) + 8 * i) setAlpha:0.0];
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v22);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  p_purgeableMenuItemViews = (id *)&self->_purgeableMenuItemViews;
  uint64_t v26 = self->_purgeableMenuItemViews;
  uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v33 objects:v44 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v34 != v29) {
          objc_enumerationMutation(v26);
        }
        [*(id *)(*((void *)&v33 + 1) + 8 * j) removeFromSuperview];
      }
      uint64_t v28 = [(NSArray *)v26 countByEnumeratingWithState:&v33 objects:v44 count:16];
    }
    while (v28);
  }

  objc_storeStrong((id *)&self->_purgeableMenuItemViews, self->_outgoingMenuItemViews);
  outgoingMenuItemViews = self->_outgoingMenuItemViews;
  self->_outgoingMenuItemViews = 0;

  if (![*p_purgeableMenuItemViews count])
  {
    id v32 = *p_purgeableMenuItemViews;
    id *p_purgeableMenuItemViews = 0;
  }
  -[_FCUIActivityControlMenuFooterView sizeThatFits:](self->_footerView, "sizeThatFits:", width, height);
  BSRectWithSize();
  v49.origin.x = v10;
  v49.origin.y = v11;
  v49.size.double width = v5;
  v49.size.double height = v12;
  CGRectGetMaxY(v49);
  UIRectIntegralWithScale();
  -[_FCUIActivityControlMenuFooterView setFrame:](self->_footerView, "setFrame:");
}

uint64_t __45__FCUIActivityControlMenuView_layoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (double)_continuousCornerRadius
{
  [(_FCUIActivityControlMenuFooterView *)self->_footerView _continuousCornerRadius];
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  if (self->_pressGestureRecognizer == a3)
  {
    id v5 = a4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    char v4 = isKindOfClass ^ 1;
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

- (NSArray)requiredVisualStyleCategories
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9C0] setWithObject:&unk_26D1C03B0];
  if ([(NSArray *)self->_menuItemViews count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    char v4 = self->_menuItemViews;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          NSUInteger v9 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "requiredVisualStyleCategories", (void)v14);
          [v3 addObjectsFromArray:v9];
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
  }
  else
  {
    char v4 = objc_alloc_init(FCUIActivityControlMenuItemView);
    CGFloat v10 = [(NSArray *)v4 requiredVisualStyleCategories];
    [v3 addObjectsFromArray:v10];
  }
  [(FCUIActivityControlMenuView *)self _configureFooterViewIfNecessary];
  CGFloat v11 = [(_FCUIActivityControlMenuFooterView *)self->_footerView requiredVisualStyleCategories];
  [v3 addObjectsFromArray:v11];

  CGFloat v12 = [v3 allObjects];

  return (NSArray *)v12;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v16 = a3;
  uint64_t v6 = [(FCUIActivityControlMenuView *)self requiredVisualStyleCategories];
  uint64_t v7 = [NSNumber numberWithInteger:a4];
  int v8 = [v6 containsObject:v7];

  if (v8)
  {
    categoriesToVisualStylingProviders = self->_categoriesToVisualStylingProviders;
    CGFloat v10 = [NSNumber numberWithInteger:a4];
    CGFloat v11 = [(NSMutableDictionary *)categoriesToVisualStylingProviders objectForKey:v10];

    CGFloat v12 = self->_categoriesToVisualStylingProviders;
    if (!v12)
    {
      double v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      long long v14 = self->_categoriesToVisualStylingProviders;
      self->_categoriesToVisualStylingProviders = v13;

      CGFloat v12 = self->_categoriesToVisualStylingProviders;
    }
    long long v15 = [NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)v12 setObject:v16 forKey:v15];

    [(FCUIActivityControlMenuView *)self _visualStylingProvider:v16 didChangeForCategory:a4 outgoingProvider:v11];
  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    char v4 = self->_menuItemViews;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setAdjustsFontForContentSizeCategory:", self->_adjustsFontForContentSizeCategory, (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    [(_FCUIActivityControlMenuFooterView *)self->_footerView setAdjustsFontForContentSizeCategory:self->_adjustsFontForContentSizeCategory];
    [(FCUIActivityControlMenuView *)self setNeedsLayout];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v3 = [(FCUIActivityControlMenuView *)self adjustsFontForContentSizeCategory];
  if (v3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    char v4 = self->_menuItemViews;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      int v7 = 0;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v4);
          }
          v7 |= objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "adjustForContentSizeCategoryChange", (void)v11);
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
    else
    {
      LOBYTE(v7) = 0;
    }

    if ([(_FCUIActivityControlMenuFooterView *)self->_footerView adjustForContentSizeCategoryChange]|| (v7 & 1) != 0)
    {
      [(FCUIActivityControlMenuView *)self setNeedsLayout];
      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)_configureFooterViewIfNecessary
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!self->_footerView)
  {
    BOOL v3 = [_FCUIActivityControlMenuFooterView alloc];
    [(FCUIActivityControlMenuView *)self bounds];
    char v4 = -[_FCUIActivityControlMenuFooterView initWithFrame:](v3, "initWithFrame:");
    footerView = self->_footerView;
    self->_footerView = v4;

    [(_FCUIActivityControlMenuFooterView *)self->_footerView setAdjustsFontForContentSizeCategory:self->_adjustsFontForContentSizeCategory];
    [(FCUIActivityControlMenuView *)self addSubview:self->_footerView];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [(_FCUIActivityControlMenuFooterView *)self->_footerView requiredVisualStyleCategories];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          long long v12 = self->_footerView;
          long long v13 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:v11];
          -[_FCUIActivityControlMenuFooterView setVisualStylingProvider:forCategory:](v12, "setVisualStylingProvider:forCategory:", v13, [v11 integerValue]);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6
{
  if (a3)
  {
    id v9 = a5;
    id v10 = a3;
    [a6 stopAutomaticallyUpdatingView:v10];
    [v9 automaticallyUpdateView:v10 withStyle:a4];
  }
}

- (void)_visualStylingProvider:(id)a3 didChangeForCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v18 = self;
  id v19 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = v18->_menuItemViews;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v12 = objc_msgSend(v11, "requiredVisualStyleCategories", v18);
        long long v13 = [NSNumber numberWithInteger:a4];
        int v14 = [v12 containsObject:v13];

        if (v14) {
          [v11 setVisualStylingProvider:v19 forCategory:a4];
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  long long v15 = [(_FCUIActivityControlMenuFooterView *)v18->_footerView requiredVisualStyleCategories];
  long long v16 = [NSNumber numberWithInteger:a4];
  int v17 = [v15 containsObject:v16];

  if (v17) {
    [(_FCUIActivityControlMenuFooterView *)v18->_footerView setVisualStylingProvider:v19 forCategory:a4];
  }
}

- (BOOL)_toggleHighlightForMenuElement:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(NSArray *)self->_menuItemViews arrayByAddingObject:self->_footerView];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(id *)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 isHighlighted] != (v11 == v4))
        {
          [v11 setHighlighted:v11 == v4];
          char v8 = (v11 == v4) ^ [v11 isHighlighted] ^ 1;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    char v8 = 0;
  }

  return v8 & 1;
}

- (void)_handlePressGesture:(id)a3
{
  id v8 = a3;
  [v8 locationInView:self];
  id v4 = -[FCUIActivityControlMenuView hitTest:withEvent:](self, "hitTest:withEvent:", 0);
  char v5 = objc_opt_respondsToSelector();
  uint64_t v6 = 0;
  if (v5)
  {
    if ([v4 isMenuElement]) {
      uint64_t v6 = v4;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  id v7 = v6;
  if ([(FCUIActivityControlMenuView *)self _toggleHighlightForMenuElement:v7]) {
    [(UISelectionFeedbackGenerator *)self->_feedbackGenerator selectionChanged];
  }
  if (v7 && [v8 state] == 3)
  {
    [v7 setHighlighted:0];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v7, "setSelected:", objc_msgSend(v7, "isSelected") ^ 1);
    }
    [v7 performAction];
  }
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (UIGestureRecognizer)pressGestureRecognizer
{
  return self->_pressGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_categoriesToVisualStylingProviders, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_purgeableMenuItemViews, 0);
  objc_storeStrong((id *)&self->_outgoingMenuItemViews, 0);
  objc_storeStrong((id *)&self->_menuItemViews, 0);
}

@end