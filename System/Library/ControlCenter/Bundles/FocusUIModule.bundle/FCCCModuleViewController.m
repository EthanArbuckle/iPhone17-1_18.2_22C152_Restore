@interface FCCCModuleViewController
+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6;
+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6 compatibleWithTraitCollection:(id)a7;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isLargerModuleForAccessibility;
- (BOOL)_isRequestingInitialUseView;
- (BOOL)_needsTextAttributesUpdate;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)isExpanded;
- (CCUILabeledRoundButtonViewController)_roundButtonVC;
- (CCUIModuleContentMetrics)contentMetrics;
- (CGRect)_textFrameWithButtonOfSize:(CGSize)a3 inBounds:(CGRect)a4 isRTL:(BOOL)a5;
- (FCActivityDescribing)activeActivity;
- (FCActivityDescribing)suggestedActivity;
- (FCCCModuleViewControllerDelegate)delegate;
- (NSArray)requiredVisualStyleCategories;
- (NSString)preferredContentSizeCategory;
- (UIView)_initialUseView;
- (double)_scaledMetric:(double)result;
- (id)_effectiveTitle;
- (id)_imageForActivity:(id)a3;
- (id)_newTitleLabelForOnState:(BOOL)a3;
- (int64_t)_userInterfaceStyleForSelectedAppearance:(BOOL)a3;
- (void)_configureActiveTitleLabel:(BOOL)a3 on:(BOOL)a4;
- (void)_configureActiveTitleLabelIfNecesaryForOnState:(BOOL)a3;
- (void)_configureInitialUseViewIfNecessary;
- (void)_configureOnStateLabelIfNecessary;
- (void)_configureRoundButtonViewControllerIfNecessary;
- (void)_invalidateInitialUseView;
- (void)_invalidateRoundButtonViewController;
- (void)_setInitialUseView:(id)a3;
- (void)_setNeedsTextAttributesUpdate;
- (void)_setRequestingInitialUseView:(BOOL)a3;
- (void)_setRoundButtonVC:(id)a3;
- (void)_updateTextAttributes;
- (void)_updateTextAttributesForOnStateLabel;
- (void)_updateTextAttributesForTitleLabel:(id)a3 on:(BOOL)a4;
- (void)_updateTextAttributesIfNecessary;
- (void)_updateTitle:(id)a3 on:(BOOL)a4 buttonSize:(CGSize)a5;
- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6;
- (void)_visualStylingProvider:(id)a3 didChangeForCategory:(int64_t)a4 outgoingProvider:(id)a5;
- (void)addButtonAction:(id)a3;
- (void)removeButtonAction:(id)a3;
- (void)setActiveActivity:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setContentMetrics:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExpanded:(BOOL)a3 withTransitionCoordinator:(id)a4;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setSuggestedActivity:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillLayoutSubviews;
@end

@implementation FCCCModuleViewController

- (void)setSuggestedActivity:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_suggestedActivity, a3);
    if (!self->_activeActivity)
    {
      [(FCCCModuleViewController *)self _invalidateRoundButtonViewController];
      v5 = [(FCCCModuleViewController *)self viewIfLoaded];
      [v5 setNeedsLayout];
    }
  }
}

- (void)setActiveActivity:(id)a3
{
  p_activeActivity = &self->_activeActivity;
  id v8 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    id v6 = *p_activeActivity;
    objc_storeStrong((id *)&self->_activeActivity, a3);
    if ((v6 || (BSEqualObjects() & 1) == 0) && (*p_activeActivity || (BSEqualObjects() & 1) == 0)) {
      [(FCCCModuleViewController *)self _invalidateRoundButtonViewController];
    }
    v7 = [(FCCCModuleViewController *)self viewIfLoaded];
    [v7 setNeedsLayout];
  }
}

- (void)setContentMetrics:(id)a3
{
  id v8 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contentMetrics, a3);
    roundButtonVC = self->_roundButtonVC;
    if (v8) {
      [v8 symbolScaleFactor];
    }
    else {
      double v6 = 1.0;
    }
    [(CCUILabeledRoundButtonViewController *)roundButtonVC setGlyphScale:v6];
    v7 = [(FCCCModuleViewController *)self viewIfLoaded];
    [v7 setNeedsLayout];
  }
}

- (void)addButtonAction:(id)a3
{
  id v4 = a3;
  buttonActions = self->_buttonActions;
  id v9 = v4;
  if (!buttonActions)
  {
    double v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_buttonActions;
    self->_buttonActions = v6;

    id v4 = v9;
    buttonActions = self->_buttonActions;
  }
  [(NSMutableArray *)buttonActions addObject:v4];
  id v8 = [(CCUILabeledRoundButtonViewController *)self->_roundButtonVC button];
  [v8 addAction:v9 forControlEvents:64];
}

- (void)removeButtonAction:(id)a3
{
  buttonActions = self->_buttonActions;
  id v5 = a3;
  [(NSMutableArray *)buttonActions removeObject:v5];
  if (![(NSMutableArray *)self->_buttonActions count])
  {
    double v6 = self->_buttonActions;
    self->_buttonActions = 0;
  }
  id v7 = [(CCUILabeledRoundButtonViewController *)self->_roundButtonVC button];
  [v7 removeAction:v5 forControlEvents:4096];
}

- (void)viewWillLayoutSubviews
{
  v43.receiver = self;
  v43.super_class = (Class)FCCCModuleViewController;
  [(FCCCModuleViewController *)&v43 viewWillLayoutSubviews];
  [(FCCCModuleViewController *)self _updateTextAttributesIfNecessary];
  if (![(FCCCModuleViewController *)self isExpanded])
  {
    v3 = [(FCCCModuleViewController *)self view];
    [v3 bounds];
    self->_compactBounds.origin.x = v4;
    self->_compactBounds.origin.y = v5;
    self->_compactBounds.size.double width = v6;
    self->_compactBounds.size.double height = v7;
  }
  if (self->_activeActivity
    || +[FCUIActivityPickerViewController isOnboardingEncountered]&& self->_suggestedActivity)
  {
    roundButtonVC = self->_roundButtonVC;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_8008;
    v42[3] = &unk_10438;
    v42[4] = self;
    +[UIView performWithoutAnimation:v42];
    [(CCUILabeledRoundButtonViewController *)self->_roundButtonVC setEnabled:0];
    [(CCUILabeledRoundButtonViewController *)self->_roundButtonVC setUseAlternateBackground:self->_activeActivity != 0];
    [(CCUILabeledRoundButtonViewController *)self->_roundButtonVC setOverrideUserInterfaceStyle:[(FCCCModuleViewController *)self _userInterfaceStyleForSelectedAppearance:self->_activeActivity != 0]];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_8010;
    v41[3] = &unk_105F0;
    v41[4] = self;
    id v9 = objc_retainBlock(v41);
    v10 = v9;
    if (self->_expansionState)
    {
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_8040;
      v39[3] = &unk_10618;
      v39[4] = self;
      v40 = v9;
      +[UIView performWithoutAnimation:v39];
    }
    else
    {
      ((void (*)(void *, BOOL))v9[2])(v9, self->_activeActivity != 0);
    }
    v11 = [(CCUILabeledRoundButtonViewController *)self->_roundButtonVC view];
  }
  else
  {
    roundButtonVC = self->_initialUseView;
    [(FCCCModuleViewController *)self _configureInitialUseViewIfNecessary];
    v11 = self->_initialUseView;
  }
  v12 = [(FCCCModuleViewController *)self view];
  unsigned __int8 v13 = [v12 _shouldReverseLayoutDirection];
  double width = self->_compactBounds.size.width;
  double height = self->_compactBounds.size.height;
  [(FCCCModuleViewController *)self _scaledMetric:14.0];
  v17 = self->_roundButtonVC;
  if (v17)
  {
    double v18 = height + v16 * -2.0;
    v19 = [(CCUILabeledRoundButtonViewController *)v17 button];
    objc_msgSend(v19, "sizeThatFits:", width, v18);
    double v21 = v20;
    double v23 = v22;
  }
  else
  {
    -[UIView sizeThatFits:](v11, "sizeThatFits:", self->_compactBounds.size.width, self->_compactBounds.size.height);
    double v21 = v24;
    double v23 = v25;
  }
  v30 = _NSConcreteStackBlock;
  uint64_t v31 = 3221225472;
  v32 = sub_8068;
  v33 = &unk_10640;
  v34 = self;
  unsigned __int8 v38 = v13;
  double v36 = v21;
  double v37 = v23;
  v26 = v11;
  v35 = v26;
  v27 = objc_retainBlock(&v30);
  v28 = v27;
  if (roundButtonVC) {
    ((void (*)(void ***))v27[2])(v27);
  }
  else {
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v27, v30, v31, v32, v33, v34);
  }
  v29 = [(FCCCModuleViewController *)self _effectiveTitle];
  -[FCCCModuleViewController _updateTitle:on:buttonSize:](self, "_updateTitle:on:buttonSize:", v29, self->_activeActivity != 0, v21, v23);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v18.receiver = self;
  v18.super_class = (Class)FCCCModuleViewController;
  [(FCCCModuleViewController *)&v18 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3 && !self->_categoriesToVisualStylingProviders)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    CGFloat v6 = [(FCCCModuleViewController *)self requiredVisualStyleCategories];
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) integerValue];
          v12 = [(FCCCModuleViewController *)self view];
          unsigned __int8 v13 = [v12 visualStylingProviderForCategory:v11];
          [(FCCCModuleViewController *)self setVisualStylingProvider:v13 forCategory:v11];

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v8);
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSArray)requiredVisualStyleCategories
{
  v3 = +[NSMutableSet setWithObject:&off_10A20];
  CGFloat v4 = [(CCUILabeledRoundButtonViewController *)self->_roundButtonVC requiredVisualStyleCategories];
  [v3 addObjectsFromArray:v4];

  CGFloat v5 = [v3 allObjects];

  return (NSArray *)v5;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v16 = a3;
  CGFloat v6 = [(FCCCModuleViewController *)self requiredVisualStyleCategories];
  id v7 = +[NSNumber numberWithInteger:a4];
  unsigned int v8 = [v6 containsObject:v7];

  if (v8)
  {
    categoriesToVisualStylingProviders = self->_categoriesToVisualStylingProviders;
    v10 = +[NSNumber numberWithInteger:a4];
    id v11 = [(NSMutableDictionary *)categoriesToVisualStylingProviders objectForKey:v10];

    v12 = self->_categoriesToVisualStylingProviders;
    if (!v12)
    {
      unsigned __int8 v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      long long v14 = self->_categoriesToVisualStylingProviders;
      self->_categoriesToVisualStylingProviders = v13;

      v12 = self->_categoriesToVisualStylingProviders;
    }
    long long v15 = +[NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)v12 setObject:v16 forKey:v15];

    [(FCCCModuleViewController *)self _visualStylingProvider:v16 didChangeForCategory:a4 outgoingProvider:v11];
  }
}

- (BOOL)isExpanded
{
  return (unint64_t)(self->_expansionState - 1) < 2;
}

- (void)setExpanded:(BOOL)a3
{
  int64_t v3 = 2;
  if (!a3) {
    int64_t v3 = 0;
  }
  self->_expansionState = v3;
}

- (void)setExpanded:(BOOL)a3 withTransitionCoordinator:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  int64_t v7 = 3;
  if (v4) {
    int64_t v7 = 1;
  }
  self->_expansionState = v7;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_8598;
  v8[3] = &unk_10668;
  objc_copyWeak(&v9, &location);
  BOOL v10 = v4;
  [v6 animateAlongsideTransition:0 completion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    [(FCCCModuleViewController *)self _setNeedsTextAttributesUpdate];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(FCCCModuleViewController *)self adjustsFontForContentSizeCategory];
  if (v3) {
    [(FCCCModuleViewController *)self _setNeedsTextAttributesUpdate];
  }
  return v3;
}

+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6 compatibleWithTraitCollection:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  BOOL v10 = a3;
  id v11 = a4;
  id v12 = a7;
  if (v10)
  {
    if (v12) {
      +[UIFontDescriptor _preferredFontDescriptorWithTextStyle:v11 addingSymbolicTraits:v8 design:UIFontDescriptorSystemDesignDefault weight:v12 compatibleWithTraitCollection:a5];
    }
    else {
    uint64_t v13 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:v11 addingSymbolicTraits:v8 options:0];
    }
  }
  else
  {
    uint64_t v13 = +[UIFontDescriptor defaultFontDescriptorWithTextStyle:v11 addingSymbolicTraits:v8 options:0];
  }
  long long v14 = (void *)v13;
  UIFontDescriptorAttributeName v23 = UIFontDescriptorTraitsAttribute;
  UIFontDescriptorTraitKey v21 = UIFontWeightTrait;
  long long v15 = +[NSNumber numberWithDouble:a5];
  double v22 = v15;
  id v16 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  double v24 = v16;
  long long v17 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  objc_super v18 = [v14 fontDescriptorByAddingAttributes:v17];

  v19 = +[UIFont fontWithDescriptor:v18 size:0.0];

  return v19;
}

+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6
{
  return [a1 _preferredFont:a3 textStyle:a4 weight:*(void *)&a6 additionalTraits:0 compatibleWithTraitCollection:a5];
}

- (void)_invalidateRoundButtonViewController
{
  roundButtonVC = self->_roundButtonVC;
  if (roundButtonVC)
  {
    BOOL v4 = [(CCUILabeledRoundButtonViewController *)roundButtonVC viewIfLoaded];
    [v4 removeFromSuperview];

    [(CCUILabeledRoundButtonViewController *)self->_roundButtonVC willMoveToParentViewController:0];
    [(CCUILabeledRoundButtonViewController *)self->_roundButtonVC removeFromParentViewController];
    CGFloat v5 = self->_roundButtonVC;
    self->_roundButtonVC = 0;

    id v6 = [(FCCCModuleViewController *)self viewIfLoaded];
    [v6 setNeedsLayout];
  }
}

- (void)_configureRoundButtonViewControllerIfNecessary
{
  if (!self->_roundButtonVC && [(FCCCModuleViewController *)self isViewLoaded])
  {
    [(FCCCModuleViewController *)self _invalidateInitialUseView];
    activeActivity = self->_activeActivity;
    if (!activeActivity) {
      activeActivity = self->_suggestedActivity;
    }
    BOOL v4 = activeActivity;
    CGFloat v5 = FCUILogModule;
    if (os_log_type_enabled(FCUILogModule, OS_LOG_TYPE_DEFAULT))
    {
      if (v4 == self->_activeActivity) {
        CFStringRef v6 = @"active";
      }
      else {
        CFStringRef v6 = @"suggested (or previously active)";
      }
      *(_DWORD *)buf = 138543618;
      CFStringRef v51 = v6;
      __int16 v52 = 2114;
      v53 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Configuring round button with %{public}@ activity: %{public}@", buf, 0x16u);
    }
    int64_t v7 = +[CCUICAPackageDescription packageDescriptionForActivity:v4];
    uint64_t v8 = v7;
    if (v7)
    {
      [v7 setHonorsUIViewAnimationState:1];
      id v9 = objc_alloc((Class)CCUILabeledRoundButtonViewController);
      BOOL v10 = +[UIColor clearColor];
      id v11 = (CCUILabeledRoundButtonViewController *)[v9 initWithGlyphPackageDescription:v8 highlightColor:v10 useLightStyle:1];
      roundButtonVC = self->_roundButtonVC;
      self->_roundButtonVC = v11;
    }
    else
    {
      id v13 = objc_alloc((Class)CCUILabeledRoundButtonViewController);
      BOOL v10 = [(FCCCModuleViewController *)self _imageForActivity:v4];
      roundButtonVC = +[UIColor clearColor];
      long long v14 = +[UIColor fcui_colorForActivity:v4];
      long long v15 = (CCUILabeledRoundButtonViewController *)[v13 initWithGlyphImage:v10 highlightColor:roundButtonVC highlightTintColor:v14 useLightStyle:1];
      id v16 = self->_roundButtonVC;
      self->_roundButtonVC = v15;
    }
    [(CCUILabeledRoundButtonViewController *)self->_roundButtonVC setDynamicLayoutEnabled:1];
    [(CCUILabeledRoundButtonViewController *)self->_roundButtonVC setLabelsVisible:0];
    long long v17 = self->_roundButtonVC;
    contentMetrics = self->_contentMetrics;
    double v37 = v8;
    if (contentMetrics) {
      [(CCUIModuleContentMetrics *)contentMetrics symbolScaleFactor];
    }
    else {
      double v19 = 1.0;
    }
    -[CCUILabeledRoundButtonViewController setGlyphScale:](v17, "setGlyphScale:", v19, v37);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    double v20 = self->_buttonActions;
    id v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v45;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v45 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v44 + 1) + 8 * i);
          v26 = [(CCUILabeledRoundButtonViewController *)self->_roundButtonVC button];
          [v26 addAction:v25 forControlEvents:64];
        }
        id v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v22);
    }
    v39 = v4;

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v27 = [(CCUILabeledRoundButtonViewController *)self->_roundButtonVC requiredVisualStyleCategories];
    id v28 = [v27 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v41;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v41 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v40 + 1) + 8 * (void)j);
          v33 = self->_roundButtonVC;
          v34 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:v32];
          -[CCUILabeledRoundButtonViewController setVisualStylingProvider:forCategory:](v33, "setVisualStylingProvider:forCategory:", v34, [v32 integerValue]);
        }
        id v29 = [v27 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v29);
    }

    [(FCCCModuleViewController *)self addChildViewController:self->_roundButtonVC];
    [(CCUILabeledRoundButtonViewController *)self->_roundButtonVC didMoveToParentViewController:self];
    v35 = [(FCCCModuleViewController *)self view];
    double v36 = [(CCUILabeledRoundButtonViewController *)self->_roundButtonVC view];
    [v35 addSubview:v36];
  }
}

- (BOOL)_isRequestingInitialUseView
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL isRequestingInitialUseView = v2->_isRequestingInitialUseView;
  objc_sync_exit(v2);

  return isRequestingInitialUseView;
}

- (void)_setRequestingInitialUseView:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL isRequestingInitialUseView = a3;
  objc_sync_exit(obj);
}

- (void)_invalidateInitialUseView
{
  [(UIView *)self->_initialUseView removeFromSuperview];
  initialUseView = self->_initialUseView;
  self->_initialUseView = 0;
}

- (void)_configureInitialUseViewIfNecessary
{
  if (!self->_initialUseView && [(FCCCModuleViewController *)self isViewLoaded])
  {
    [(FCCCModuleViewController *)self _invalidateRoundButtonViewController];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (![(FCCCModuleViewController *)self _isRequestingInitialUseView]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [(FCCCModuleViewController *)self _setRequestingInitialUseView:1];
      objc_initWeak(&location, self);
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      v4[2] = sub_8F3C;
      v4[3] = &unk_10690;
      objc_copyWeak(&v5, &location);
      [WeakRetained moduleViewController:self initialUseView:v4];
      objc_destroyWeak(&v5);
      objc_destroyWeak(&location);
    }
  }
}

- (BOOL)_isLargerModuleForAccessibility
{
  return UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
}

- (void)_updateTextAttributesForTitleLabel:(id)a3 on:(BOOL)a4
{
  if (a3)
  {
    CFStringRef v6 = (id *)&UIFontTextStyleFootnote;
    if (!a4) {
      CFStringRef v6 = (id *)&UIFontTextStyleSubheadline;
    }
    preferredContentSizeCategory = self->_preferredContentSizeCategory;
    uint64_t v8 = UIContentSizeCategoryExtraExtraExtraLarge;
    id v9 = *v6;
    id v10 = a3;
    if (UIContentSizeCategoryCompareToCategory(preferredContentSizeCategory, UIContentSizeCategoryExtraExtraExtraLarge) != NSOrderedDescending
      || [(FCCCModuleViewController *)self _isLargerModuleForAccessibility])
    {
      uint64_t v8 = self->_preferredContentSizeCategory;
    }
    id v11 = v8;
    id v12 = objc_opt_class();
    id v13 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v11];

    id v14 = [v12 _preferredFont:1 textStyle:v9 weight:0x8000 additionalTraits:v13 compatibleWithTraitCollection:UIFontWeightMedium];

    [v10 setFont:v14];
  }
}

- (id)_newTitleLabelForOnState:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init((Class)UILabel);
  [v5 setNumberOfLines:2];
  LODWORD(v6) = 1036831949;
  [v5 _setHyphenationFactor:v6];
  [v5 setContentMode:4];
  [(FCCCModuleViewController *)self _updateTextAttributesForTitleLabel:v5 on:v3];
  int64_t v7 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&off_10A20];
  [(FCCCModuleViewController *)self _updateVisualStylingOfView:v5 style:0 visualStylingProvider:v7 outgoingProvider:0];

  return v5;
}

- (void)_configureActiveTitleLabel:(BOOL)a3 on:(BOOL)a4
{
  if (self->_activeTitleLabel) {
    BOOL v4 = !a3;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    BOOL v5 = a4;
    if ([(FCCCModuleViewController *)self isViewLoaded])
    {
      int64_t v7 = [(FCCCModuleViewController *)self _newTitleLabelForOnState:v5];
      activeTitleLabel = self->_activeTitleLabel;
      self->_activeTitleLabel = v7;

      id v9 = [(FCCCModuleViewController *)self view];
      [v9 addSubview:self->_activeTitleLabel];
    }
  }
}

- (void)_configureActiveTitleLabelIfNecesaryForOnState:(BOOL)a3
{
}

- (void)_updateTextAttributesForOnStateLabel
{
  if (self->_onStateLabel)
  {
    preferredContentSizeCategory = UIContentSizeCategoryExtraExtraLarge;
    if (UIContentSizeCategoryCompareToCategory(self->_preferredContentSizeCategory, UIContentSizeCategoryExtraExtraLarge) != NSOrderedDescending|| [(FCCCModuleViewController *)self _isLargerModuleForAccessibility])
    {
      preferredContentSizeCategory = self->_preferredContentSizeCategory;
    }
    onStateLabel = self->_onStateLabel;
    id v5 = preferredContentSizeCategory;
    double v6 = objc_opt_class();
    id v8 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v5];
    int64_t v7 = [v6 _preferredFont:1 textStyle:UIFontTextStyleFootnote weight:0 additionalTraits:v8 compatibleWithTraitCollection:UIFontWeightMedium];
    [(UILabel *)onStateLabel setFont:v7];
  }
}

- (void)_configureOnStateLabelIfNecessary
{
  if (!self->_onStateLabel)
  {
    BOOL v3 = (UILabel *)objc_alloc_init((Class)UILabel);
    onStateLabel = self->_onStateLabel;
    self->_onStateLabel = v3;

    [(UILabel *)self->_onStateLabel setNumberOfLines:1];
    [(UILabel *)self->_onStateLabel setContentMode:4];
    id v5 = self->_onStateLabel;
    double v6 = +[NSBundle bundleForClass:objc_opt_class()];
    int64_t v7 = [v6 localizedStringForKey:@"MODULE_ON_STATE" value:&stru_10938 table:0];
    [(UILabel *)v5 setText:v7];

    id v8 = [(FCCCModuleViewController *)self view];
    [v8 addSubview:self->_onStateLabel];

    [(FCCCModuleViewController *)self _updateTextAttributesForOnStateLabel];
    id v9 = self->_onStateLabel;
    id v10 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&off_10A20];
    [(FCCCModuleViewController *)self _updateVisualStylingOfView:v9 style:1 visualStylingProvider:v10 outgoingProvider:0];
  }
}

- (CGRect)_textFrameWithButtonOfSize:(CGSize)a3 inBounds:(CGRect)a4 isRTL:(BOOL)a5
{
  BOOL v5 = a5;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v10 = a3.width;
  -[FCCCModuleViewController _scaledMetric:](self, "_scaledMetric:", 14.0, a3.height);
  double v13 = v12;
  [(FCCCModuleViewController *)self _scaledMetric:8.0];
  double v15 = v14;
  id v16 = [(FCCCModuleViewController *)self _scaledMetric:8.0];
  if (v5) {
    v22.n128_f64[0] = v10 + v13 + v15;
  }
  else {
    v22.n128_f64[0] = v17.n128_f64[0];
  }
  if (v5) {
    v24.n128_f64[0] = v17.n128_f64[0];
  }
  else {
    v24.n128_f64[0] = v10 + v13 + v15;
  }
  v21.n128_u64[0] = 0;
  v23.n128_u64[0] = 0;
  v17.n128_f64[0] = x;
  v18.n128_f64[0] = y;
  v19.n128_f64[0] = width;
  v20.n128_f64[0] = height;

  _UIRectInset(v16, v17, v18, v19, v20, v21, v22, v23, v24);
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (void)_updateTitle:(id)a3 on:(BOOL)a4 buttonSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  BOOL v7 = a4;
  id v9 = a3;
  if (![(FCCCModuleViewController *)self isViewLoaded]) {
    goto LABEL_34;
  }
  double v10 = [(FCCCModuleViewController *)self view];
  id v11 = [v10 _shouldReverseLayoutDirection];
  double x = self->_compactBounds.origin.x;
  double y = self->_compactBounds.origin.y;
  double v15 = self->_compactBounds.size.width;
  double v14 = self->_compactBounds.size.height;
  [(UILabel *)self->_onStateLabel alpha];
  double v17 = v16;
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_9C68;
  v74[3] = &unk_106B0;
  BOOL v75 = IsAccessibilityCategory;
  char v76 = (char)v11;
  __n128 v19 = objc_retainBlock(v74);
  if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
  {
    if (v17 > 0.0 != v7)
    {
      int v20 = 1;
    }
    else
    {
      __n128 v21 = [(UILabel *)self->_activeTitleLabel text];
      int v20 = BSEqualStrings() ^ 1;
    }
  }
  else
  {
    int v20 = 0;
  }
  p_outgoingTitleLabel = &self->_outgoingTitleLabel;
  [(UILabel *)self->_outgoingTitleLabel removeFromSuperview];
  objc_storeStrong((id *)&self->_outgoingTitleLabel, self->_activeTitleLabel);
  __n128 v23 = [(FCCCModuleViewController *)self _newTitleLabelForOnState:v7];
  activeTitleLabel = self->_activeTitleLabel;
  self->_activeTitleLabel = v23;

  [(UILabel *)self->_activeTitleLabel setAlpha:0.0];
  [(UILabel *)self->_activeTitleLabel setText:v9];
  [v10 addSubview:self->_activeTitleLabel];
  if (v7)
  {
    [(FCCCModuleViewController *)self _configureOnStateLabelIfNecessary];
    double v25 = 1.0;
    if (v17 <= 0.0) {
      double v25 = 0.0;
    }
    [(UILabel *)self->_onStateLabel setAlpha:v25];
  }
  -[FCCCModuleViewController _textFrameWithButtonOfSize:inBounds:isRTL:](self, "_textFrameWithButtonOfSize:inBounds:isRTL:", v11, width, height, x, y, v15, v14);
  double v29 = v28;
  double v31 = v30;
  double v32 = v26;
  double v33 = v27;
  if (v20)
  {
    -[UILabel sizeThatFits:](*p_outgoingTitleLabel, "sizeThatFits:", v26, v27);
    double v35 = v34;
    double v37 = v36;
  }
  else
  {
    double v35 = CGSizeZero.width;
    double v37 = CGSizeZero.height;
  }
  -[UILabel sizeThatFits:](self->_activeTitleLabel, "sizeThatFits:", v32, v33);
  double v56 = v39;
  if (v17 > 0.0 || v7)
  {
    double v40 = v38;
    -[UILabel sizeThatFits:](self->_onStateLabel, "sizeThatFits:", v32, v33);
    double v57 = v42;
    double v58 = v41;
  }
  else
  {
    double v40 = v38;
    double v57 = CGSizeZero.height;
    double v58 = CGSizeZero.width;
  }
  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  CGSize v73 = size;
  CGPoint v70 = origin;
  CGSize v71 = size;
  CGPoint v68 = origin;
  CGSize v69 = size;
  CGPoint v66 = origin;
  CGSize v67 = size;
  if (v20)
  {
    if (v17 <= 0.0)
    {
      v77.origin.double x = v29;
      v77.origin.double y = v31;
      v77.size.double width = v32;
      v77.size.double height = v33;
      CGRectGetWidth(v77);
      BSRectWithSize();
      UIRectCenteredIntegralRect();
      origin.double x = v45;
      origin.double y = v46;
      v73.double width = v47;
      v73.double height = v48;
      if (v7) {
        goto LABEL_22;
      }
LABEL_24:
      v78.origin.double x = v29;
      v78.origin.double y = v31;
      v78.size.double width = v32;
      v78.size.double height = v33;
      CGRectGetWidth(v78);
      BSRectWithSize();
      UIRectCenteredIntegralRect();
      v70.double x = v49;
      v71.double width = v50;
      v71.double height = v51;
      goto LABEL_25;
    }
    ((void (*)(void *, CGPoint *, CGPoint *, double, double, double, double, double, double, double, double))v19[2])(v19, &origin, &v68, v29, v31, v32, v33, v35, v37, v58, v57);
  }
  if (!v7) {
    goto LABEL_24;
  }
LABEL_22:
  ((void (*)(void *, CGPoint *, CGPoint *, double, double, double, double, double, double, double, double))v19[2])(v19, &v70, &v66, v29, v31, v32, v33, v56, v40, v58, v57);
  double v44 = v70.y;
LABEL_25:
  double v52 = v44 + 3.34;
  v70.double y = v44 + 3.34;
  if (v17 <= 0.0)
  {
    v68.double x = v66.x;
    CGSize v69 = v67;
    v68.double y = v66.y + 3.34;
  }
  if (v20)
  {
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    CGPoint v60 = origin;
    CGSize v61 = v73;
    CGPoint v62 = v70;
    CGSize v63 = v71;
    CGPoint v64 = v68;
    CGSize v65 = v69;
    v59[2] = sub_9E34;
    v59[3] = &unk_106D8;
    v59[4] = self;
    +[UIView performWithoutAnimation:v59];
    double v52 = v70.y;
  }
  v70.double y = v52 + -3.34;
  origin.double y = origin.y + -3.34;
  if (!v7)
  {
    v66.double x = v68.x;
    CGSize v67 = v69;
    v66.double y = v68.y + -3.34;
  }
  if (v20)
  {
    v53 = *p_outgoingTitleLabel;
    UIRectIntegralWithScale();
    -[UILabel setFrame:](v53, "setFrame:");
  }
  [(UILabel *)*p_outgoingTitleLabel setAlpha:0.0];
  v54 = self->_activeTitleLabel;
  UIRectIntegralWithScale();
  -[UILabel setFrame:](v54, "setFrame:");
  [(UILabel *)self->_activeTitleLabel setAlpha:1.0];
  onStateLabel = self->_onStateLabel;
  UIRectIntegralWithScale();
  -[UILabel setFrame:](onStateLabel, "setFrame:");
  [(UILabel *)self->_onStateLabel setAlpha:(double)v7];

LABEL_34:
}

- (id)_effectiveTitle
{
  if (self->_activeActivity)
  {
    v2 = [(FCActivityDescribing *)self->_activeActivity activityDisplayName];
  }
  else
  {
    BOOL v3 = +[NSBundle bundleForClass:objc_opt_class()];
    v2 = [v3 localizedStringForKey:@"MODULE_DEFAULT_TITLE" value:&stru_10938 table:0];
  }

  return v2;
}

- (id)_imageForActivity:(id)a3
{
  BOOL v3 = [a3 activitySymbolImageName];
  BOOL v4 = +[UIImageSymbolConfiguration configurationWithPointSize:20.0];
  BOOL v5 = +[UIImage _systemImageNamed:v3 withConfiguration:v4];

  return v5;
}

- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6
{
  if (a3)
  {
    id v9 = a5;
    id v10 = a3;
    [a6 stopAutomaticallyUpdatingView:v10];
    [v9 automaticallyUpdateView:v10 withStyle:a4 andObserverBlock:&stru_10718];
  }
}

- (void)_visualStylingProvider:(id)a3 didChangeForCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  if (a4 == 1)
  {
    [(FCCCModuleViewController *)self _updateVisualStylingOfView:self->_activeTitleLabel style:0 visualStylingProvider:v12 outgoingProvider:v8];
    [(FCCCModuleViewController *)self _updateVisualStylingOfView:self->_outgoingTitleLabel style:0 visualStylingProvider:v12 outgoingProvider:v8];
    [(FCCCModuleViewController *)self _updateVisualStylingOfView:self->_onStateLabel style:1 visualStylingProvider:v12 outgoingProvider:v8];
  }
  id v9 = [(CCUILabeledRoundButtonViewController *)self->_roundButtonVC requiredVisualStyleCategories];
  id v10 = +[NSNumber numberWithInteger:a4];
  unsigned int v11 = [v9 containsObject:v10];

  if (v11) {
    [(CCUILabeledRoundButtonViewController *)self->_roundButtonVC setVisualStylingProvider:v12 forCategory:a4];
  }
}

- (BOOL)_needsTextAttributesUpdate
{
  return self->_preferredContentSizeCategory == 0;
}

- (void)_setNeedsTextAttributesUpdate
{
  preferredContentSizeCategordouble y = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategordouble y = 0;

  id v4 = [(FCCCModuleViewController *)self viewIfLoaded];
  [v4 setNeedsLayout];
}

- (void)_updateTextAttributes
{
  BOOL v3 = [(FCCCModuleViewController *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  preferredContentSizeCategordouble y = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategordouble y = v4;

  [(FCCCModuleViewController *)self _updateTextAttributesForTitleLabel:self->_activeTitleLabel on:self->_activeActivity != 0];

  [(FCCCModuleViewController *)self _updateTextAttributesForOnStateLabel];
}

- (void)_updateTextAttributesIfNecessary
{
  if ([(FCCCModuleViewController *)self _needsTextAttributesUpdate])
  {
    [(FCCCModuleViewController *)self _updateTextAttributes];
  }
}

- (int64_t)_userInterfaceStyleForSelectedAppearance:(BOOL)a3
{
  if (a3) {
    return 1;
  }
  else {
    return 2;
  }
}

- (double)_scaledMetric:(double)result
{
  double v3 = result;
  contentMetrics = self->_contentMetrics;
  if (contentMetrics)
  {
    [(CCUIModuleContentMetrics *)contentMetrics metricsScaleFactor];
    double v7 = v6;
    id v8 = [(FCCCModuleViewController *)self traitCollection];
    [v8 displayScale];
    unint64_t v10 = v9;

    v12.n128_u64[0] = v10;
    v11.n128_f64[0] = v7 * v3;
    _UIRoundToScale(v11, v12);
  }
  return result;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (FCCCModuleViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FCCCModuleViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FCActivityDescribing)suggestedActivity
{
  return self->_suggestedActivity;
}

- (FCActivityDescribing)activeActivity
{
  return self->_activeActivity;
}

- (CCUIModuleContentMetrics)contentMetrics
{
  return self->_contentMetrics;
}

- (CCUILabeledRoundButtonViewController)_roundButtonVC
{
  return self->_roundButtonVC;
}

- (void)_setRoundButtonVC:(id)a3
{
}

- (UIView)_initialUseView
{
  return self->_initialUseView;
}

- (void)_setInitialUseView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialUseView, 0);
  objc_storeStrong((id *)&self->_roundButtonVC, 0);
  objc_storeStrong((id *)&self->_contentMetrics, 0);
  objc_storeStrong((id *)&self->_activeActivity, 0);
  objc_storeStrong((id *)&self->_suggestedActivity, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_categoriesToVisualStylingProviders, 0);
  objc_storeStrong((id *)&self->_buttonActions, 0);
  objc_storeStrong((id *)&self->_onStateLabel, 0);
  objc_storeStrong((id *)&self->_outgoingTitleLabel, 0);

  objc_storeStrong((id *)&self->_activeTitleLabel, 0);
}

@end