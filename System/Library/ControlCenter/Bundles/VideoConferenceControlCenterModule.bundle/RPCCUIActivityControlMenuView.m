@interface RPCCUIActivityControlMenuView
- (BOOL)_toggleHighlightForMenuElement:(id)a3;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)menuItemActions;
- (NSArray)menuItemElements;
- (NSArray)requiredVisualStyleCategories;
- (NSString)menuAlternativeDescription;
- (RPCCUIActivityControlMenuView)initWithFrame:(CGRect)a3;
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
- (void)updateMenuItemViewWithState:(BOOL)a3;
@end

@implementation RPCCUIActivityControlMenuView

- (RPCCUIActivityControlMenuView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RPCCUIActivityControlMenuView;
  v3 = -[RPCCUIActivityControlMenuView initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIGestureRecognizer *)[objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:v3 action:"_handlePressGesture:"];
    [(UIGestureRecognizer *)v4 setDelegate:v3];
    [(UIGestureRecognizer *)v4 setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)v4 setDelaysTouchesEnded:0];
    [(UIGestureRecognizer *)v4 setMinimumPressDuration:0.0];
    [(UIGestureRecognizer *)v4 _setKeepTouchesOnContinuation:1];
    pressGestureRecognizer = v3->_pressGestureRecognizer;
    v3->_pressGestureRecognizer = v4;
    v6 = v4;

    id v7 = objc_alloc((Class)UISelectionFeedbackGenerator);
    v8 = +[_UISelectionFeedbackGeneratorConfiguration lightConfiguration];
    v9 = (UISelectionFeedbackGenerator *)[v7 initWithConfiguration:v8 coordinateSpace:v3];
    feedbackGenerator = v3->_feedbackGenerator;
    v3->_feedbackGenerator = v9;
  }
  return v3;
}

- (NSArray)menuItemActions
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_menuItemViews;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "defaultAction", (void)v11);
        [v3 addObject:v9];
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)_newMenuItemView
{
  id v3 = objc_alloc_init(RPCCUIActivityControlMenuItemView);
  [(RPCCUIActivityControlMenuItemView *)v3 setAdjustsFontForContentSizeCategory:self->_adjustsFontForContentSizeCategory];
  [(RPCCUIActivityControlMenuItemView *)v3 setAlpha:0.0];
  [(RPCCUIActivityControlMenuView *)self addSubview:v3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(RPCCUIActivityControlMenuItemView *)v3 requiredVisualStyleCategories];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v10 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:v9];
        -[RPCCUIActivityControlMenuItemView setVisualStylingProvider:forCategory:](v3, "setVisualStylingProvider:forCategory:", v10, [v9 integerValue]);
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)setMenuItemActions:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSMutableArray);
  id v6 = [v4 count];
  uint64_t v7 = v5;
  v8 = self;
  id v33 = [v7 initWithCapacity:v6];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v4;
  id v34 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
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
        id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v40 objects:v49 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v41;
          while (2)
          {
            long long v15 = 0;
            do
            {
              if (*(void *)v41 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(NSArray **)(*((void *)&v40 + 1) + 8 * (void)v15);
              v17 = [v10 identifier];
              v18 = [(NSArray *)v16 defaultAction];
              v19 = [v18 identifier];
              char v20 = BSEqualStrings();

              if (v20)
              {
                v8 = v32;
                goto LABEL_16;
              }
              long long v15 = (char *)v15 + 1;
            }
            while (v13 != v15);
            id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v40 objects:v49 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

        v8 = v32;
        v16 = [(RPCCUIActivityControlMenuView *)v32 _newMenuItemView];
        long long v11 = v16;
LABEL_16:
        [(NSArray *)v16 setDefaultAction:v10];
        [(NSArray *)v16 setSeparatorVisible:0];
        [v33 addObject:v16];

        uint64_t v9 = v35 + 1;
      }
      while ((id)(v35 + 1) != v34);
      id v34 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v34);
  }

  id v21 = [(NSArray *)v8->_menuItemViews mutableCopy];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v22 = v33;
  id v23 = [v22 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v37;
    do
    {
      v26 = 0;
      do
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(v22);
        }
        [v21 removeObject:*(void *)(*((void *)&v36 + 1) + 8 * (void)v26)];
        v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      id v24 = [v22 countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v24);
  }

  objc_storeStrong((id *)&v8->_menuItemViews, v33);
  outgoingMenuItemViews = v8->_outgoingMenuItemViews;
  if (!outgoingMenuItemViews)
  {
    v28 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v29 = v8->_outgoingMenuItemViews;
    v8->_outgoingMenuItemViews = v28;

    outgoingMenuItemViews = v8->_outgoingMenuItemViews;
  }
  [(NSMutableArray *)outgoingMenuItemViews addObjectsFromArray:v21];
  [(RPCCUIActivityControlMenuView *)v8 setNeedsLayout];
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
  menuItemViews = self->_menuItemViews;
  id v5 = a3;
  id v6 = [(NSArray *)menuItemViews firstObject];
  uint64_t v7 = [v6 alternativeDescription];
  if ([v7 length])
  {
    id v8 = [(NSArray *)self->_menuItemViews firstObject];
  }
  else
  {
    id v8 = [(RPCCUIActivityControlMenuView *)self _newMenuItemView];
  }
  uint64_t v9 = v8;

  [v9 setAlternativeDescription:v5];
  v10 = [(NSArray *)self->_menuItemViews firstObject];

  if (v10 != v9)
  {
    [(RPCCUIActivityControlMenuView *)self setMenuItemActions:0];
    id v13 = v9;
    long long v11 = +[NSArray arrayWithObjects:&v13 count:1];
    id v12 = self->_menuItemViews;
    self->_menuItemViews = v11;
  }
  [(RPCCUIActivityControlMenuView *)self setNeedsLayout];
}

- (UIAction)footerAction
{
  return [(_FCUIActivityControlMenuFooterView *)self->_footerView footerAction];
}

- (void)setFooterAction:(id)a3
{
  id v7 = a3;
  id v4 = [(RPCCUIActivityControlMenuView *)self footerAction];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    id v6 = v7;
    if (v7)
    {
      [(RPCCUIActivityControlMenuView *)self _configureFooterViewIfNecessary];
      id v6 = v7;
    }
    [(_FCUIActivityControlMenuFooterView *)self->_footerView setFooterAction:v6];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = CGSizeZero.width;
  double v7 = CGSizeZero.height;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = self->_menuItemViews;
  id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * (void)v12), "sizeThatFits:", width, height, (void)v18);
        if (v6 < v13) {
          double v6 = v13;
        }
        double v7 = v7 + v14;
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  [(RPCCUIActivityControlMenuView *)self _configureFooterViewIfNecessary];
  -[_FCUIActivityControlMenuFooterView sizeThatFits:](self->_footerView, "sizeThatFits:", width, height);
  double v16 = v7 + v15;
  double v17 = v6;
  result.double height = v16;
  result.double width = v17;
  return result;
}

- (void)layoutSubviews
{
  v41.receiver = self;
  v41.super_class = (Class)RPCCUIActivityControlMenuView;
  [(RPCCUIActivityControlMenuView *)&v41 layoutSubviews];
  [(RPCCUIActivityControlMenuView *)self bounds];
  double width = v44.size.width;
  double height = v44.size.height;
  CGFloat v5 = CGRectGetWidth(v44);
  NSUInteger v6 = [(NSArray *)self->_menuItemViews count];
  if (v6)
  {
    NSUInteger v7 = v6;
    uint64_t v8 = 0;
    CGFloat v9 = 0.0;
    CGFloat v10 = 0.0;
    CGFloat v11 = 0.0;
    do
    {
      id v12 = [(NSArray *)self->_menuItemViews objectAtIndex:v8];
      objc_msgSend(v12, "sizeThatFits:", width, height);
      BSRectWithSize();
      v45.size.double width = v5;
      v45.origin.x = v9;
      v45.origin.y = v10;
      v45.size.double height = v11;
      CGRectGetMaxY(v45);
      UIRectIntegralWithScale();
      CGFloat v9 = v13;
      CGFloat v10 = v14;
      CGFloat v5 = v15;
      CGFloat v11 = v16;
      objc_msgSend(v12, "setFrame:");
      [v12 setSeparatorVisible:1];
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_80A0;
      v39[3] = &unk_68F10;
      id v40 = v12;
      id v17 = v12;
      +[UIView performWithoutAnimation:v39];
      [v17 setAlpha:1.0];

      ++v8;
    }
    while (v7 != v8);
  }
  else
  {
    CGFloat v11 = 0.0;
    CGFloat v10 = 0.0;
    CGFloat v9 = 0.0;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v18 = self->_outgoingMenuItemViews;
  id v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v36;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v35 + 1) + 8 * i) setAlpha:0.0];
      }
      id v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v20);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  p_purgeableMenuItemViews = (id *)&self->_purgeableMenuItemViews;
  id v24 = self->_purgeableMenuItemViews;
  id v25 = [(NSArray *)v24 countByEnumeratingWithState:&v31 objects:v42 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v32;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v32 != v27) {
          objc_enumerationMutation(v24);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * (void)j) removeFromSuperview];
      }
      id v26 = [(NSArray *)v24 countByEnumeratingWithState:&v31 objects:v42 count:16];
    }
    while (v26);
  }

  objc_storeStrong((id *)&self->_purgeableMenuItemViews, self->_outgoingMenuItemViews);
  outgoingMenuItemViews = self->_outgoingMenuItemViews;
  self->_outgoingMenuItemViews = 0;

  if (![*p_purgeableMenuItemViews count])
  {
    id v30 = *p_purgeableMenuItemViews;
    id *p_purgeableMenuItemViews = 0;
  }
  -[_FCUIActivityControlMenuFooterView sizeThatFits:](self->_footerView, "sizeThatFits:", width, height);
  BSRectWithSize();
  v46.origin.x = v9;
  v46.origin.y = v10;
  v46.size.double width = v5;
  v46.size.double height = v11;
  CGRectGetMaxY(v46);
  UIRectIntegralWithScale();
  -[_FCUIActivityControlMenuFooterView setFrame:](self->_footerView, "setFrame:");
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
  id v3 = +[NSMutableSet setWithObject:&off_6B288];
  if ([(NSArray *)self->_menuItemViews count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    char v4 = self->_menuItemViews;
    id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          CGFloat v9 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "requiredVisualStyleCategories", (void)v14);
          [v3 addObjectsFromArray:v9];
        }
        id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
  }
  else
  {
    char v4 = objc_alloc_init(RPCCUIActivityControlMenuItemView);
    CGFloat v10 = [(NSArray *)v4 requiredVisualStyleCategories];
    [v3 addObjectsFromArray:v10];
  }
  [(RPCCUIActivityControlMenuView *)self _configureFooterViewIfNecessary];
  CGFloat v11 = [(_FCUIActivityControlMenuFooterView *)self->_footerView requiredVisualStyleCategories];
  [v3 addObjectsFromArray:v11];

  id v12 = [v3 allObjects];

  return (NSArray *)v12;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v16 = a3;
  id v6 = [(RPCCUIActivityControlMenuView *)self requiredVisualStyleCategories];
  uint64_t v7 = +[NSNumber numberWithInteger:a4];
  unsigned int v8 = [v6 containsObject:v7];

  if (v8)
  {
    categoriesToVisualStylingProviders = self->_categoriesToVisualStylingProviders;
    CGFloat v10 = +[NSNumber numberWithInteger:a4];
    CGFloat v11 = [(NSMutableDictionary *)categoriesToVisualStylingProviders objectForKey:v10];

    id v12 = self->_categoriesToVisualStylingProviders;
    if (!v12)
    {
      double v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      long long v14 = self->_categoriesToVisualStylingProviders;
      self->_categoriesToVisualStylingProviders = v13;

      id v12 = self->_categoriesToVisualStylingProviders;
    }
    long long v15 = +[NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)v12 setObject:v16 forKey:v15];

    [(RPCCUIActivityControlMenuView *)self _visualStylingProvider:v16 didChangeForCategory:a4 outgoingProvider:v11];
  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    char v4 = self->_menuItemViews;
    id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        unsigned int v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "setAdjustsFontForContentSizeCategory:", self->_adjustsFontForContentSizeCategory, (void)v9);
          unsigned int v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    [(_FCUIActivityControlMenuFooterView *)self->_footerView setAdjustsFontForContentSizeCategory:self->_adjustsFontForContentSizeCategory];
    [(RPCCUIActivityControlMenuView *)self setNeedsLayout];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(RPCCUIActivityControlMenuView *)self adjustsFontForContentSizeCategory];
  if (v3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    char v4 = self->_menuItemViews;
    id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      int v7 = 0;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v4);
          }
          v7 |= objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "adjustForContentSizeCategoryChange", (void)v11);
        }
        id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
    else
    {
      LOBYTE(v7) = 0;
    }

    if ([(_FCUIActivityControlMenuFooterView *)self->_footerView adjustForContentSizeCategoryChange]|| (v7 & 1) != 0)
    {
      [(RPCCUIActivityControlMenuView *)self setNeedsLayout];
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
  if (!self->_footerView)
  {
    BOOL v3 = [_FCUIActivityControlMenuFooterView alloc];
    [(RPCCUIActivityControlMenuView *)self bounds];
    char v4 = -[_FCUIActivityControlMenuFooterView initWithFrame:](v3, "initWithFrame:");
    footerView = self->_footerView;
    self->_footerView = v4;

    [(_FCUIActivityControlMenuFooterView *)self->_footerView setAdjustsFontForContentSizeCategory:self->_adjustsFontForContentSizeCategory];
    [(RPCCUIActivityControlMenuView *)self addSubview:self->_footerView];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [(_FCUIActivityControlMenuFooterView *)self->_footerView requiredVisualStyleCategories];
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          long long v12 = self->_footerView;
          long long v13 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:v11];
          -[_FCUIActivityControlMenuFooterView setVisualStylingProvider:forCategory:](v12, "setVisualStylingProvider:forCategory:", v13, [v11 integerValue]);
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
  long long v18 = self;
  id v19 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v18->_menuItemViews;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v12 = objc_msgSend(v11, "requiredVisualStyleCategories", v18);
        long long v13 = +[NSNumber numberWithInteger:a4];
        unsigned int v14 = [v12 containsObject:v13];

        if (v14) {
          [v11 setVisualStylingProvider:v19 forCategory:a4];
        }
      }
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  long long v15 = [(_FCUIActivityControlMenuFooterView *)v18->_footerView requiredVisualStyleCategories];
  long long v16 = +[NSNumber numberWithInteger:a4];
  unsigned int v17 = [v15 containsObject:v16];

  if (v17) {
    [(_FCUIActivityControlMenuFooterView *)v18->_footerView setVisualStylingProvider:v19 forCategory:a4];
  }
}

- (BOOL)_toggleHighlightForMenuElement:(id)a3
{
  id v4 = a3;
  id v5 = [(NSArray *)self->_menuItemViews arrayByAddingObject:self->_footerView];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
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
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
  id v4 = -[RPCCUIActivityControlMenuView hitTest:withEvent:](self, "hitTest:withEvent:", 0);
  char v5 = objc_opt_respondsToSelector();
  id v6 = 0;
  if (v5)
  {
    if ([v4 isMenuElement]) {
      id v6 = v4;
    }
    else {
      id v6 = 0;
    }
  }
  id v7 = v6;
  if ([(RPCCUIActivityControlMenuView *)self _toggleHighlightForMenuElement:v7]) {
    [(UISelectionFeedbackGenerator *)self->_feedbackGenerator selectionChanged];
  }
  if (v7 && [v8 state] == (char *)&dword_0 + 3)
  {
    [v7 setHighlighted:0];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v7, "setSelected:", objc_msgSend(v7, "isSelected") ^ 1);
    }
    [v7 performAction];
  }
}

- (void)updateMenuItemViewWithState:(BOOL)a3
{
  BOOL v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_menuItemViews;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "updateItemViewWithState:", v3, (void)v9);
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
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