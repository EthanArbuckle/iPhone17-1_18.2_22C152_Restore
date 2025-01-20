@interface RPCCModuleViewController
+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6;
+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6 compatibleWithTraitCollection:(id)a7;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isRequestingInitialUseView;
- (BOOL)_needsTextAttributesUpdate;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)isExpanded;
- (CGRect)_textFrameInBounds:(CGRect)a3 isRTL:(BOOL)a4;
- (NSArray)requiredVisualStyleCategories;
- (NSMutableArray)activeActivities;
- (NSString)preferredContentSizeCategory;
- (RPCCActivityDescribing)suggestedActivity;
- (RPCCModuleViewControllerDelegate)delegate;
- (UIView)_initialUseView;
- (id)_effectiveTitle;
- (id)_newTitleLabelForOnState:(BOOL)a3;
- (int64_t)_userInterfaceStyleForSelectedAppearance:(BOOL)a3;
- (void)_configureActiveEffectLabelIfNecessary;
- (void)_configureActiveTitleLabel:(BOOL)a3 on:(BOOL)a4;
- (void)_configureActiveTitleLabelIfNecesaryForOnState:(BOOL)a3;
- (void)_configureInitialUseViewIfNecessary;
- (void)_invalidateInitialUseView;
- (void)_setActiveEffectLabelVibrancy;
- (void)_setInitialUseView:(id)a3;
- (void)_setNeedsTextAttributesUpdate;
- (void)_setRequestingInitialUseView:(BOOL)a3;
- (void)_setSelectedIfNeccessary;
- (void)_setSubtitleLabelText;
- (void)_subtitleActivityFontActivityFontForSubTitleLabel:(id)a3;
- (void)_updateTextAttributes;
- (void)_updateTextAttributesForTitleLabel:(id)a3;
- (void)_updateTextAttributesIfNecessary;
- (void)_updateTitle:(id)a3 on:(BOOL)a4;
- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6;
- (void)_visualStylingProvider:(id)a3 didChangeForCategory:(int64_t)a4 outgoingProvider:(id)a5;
- (void)addButtonAction:(id)a3;
- (void)removeButtonAction:(id)a3;
- (void)setActiveActivities:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExpanded:(BOOL)a3 withTransitionCoordinator:(id)a4;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setSuggestedActivity:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)updateActivteActivityText;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillLayoutSubviews;
@end

@implementation RPCCModuleViewController

- (void)setSuggestedActivity:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_suggestedActivity, a3);
    if (!self->_activeActivities)
    {
      v5 = [(RPCCModuleViewController *)self viewIfLoaded];
      [v5 setNeedsLayout];
    }
  }
}

- (void)setActiveActivities:(id)a3
{
  p_activeActivities = &self->_activeActivities;
  id v5 = a3;
  if ((BSEqualArrays() & 1) == 0) {
    objc_storeStrong((id *)p_activeActivities, a3);
  }
}

- (void)addButtonAction:(id)a3
{
  id v4 = a3;
  buttonActions = self->_buttonActions;
  id v8 = v4;
  if (!buttonActions)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_buttonActions;
    self->_buttonActions = v6;

    id v4 = v8;
    buttonActions = self->_buttonActions;
  }
  [(NSMutableArray *)buttonActions addObject:v4];
}

- (void)removeButtonAction:(id)a3
{
  [(NSMutableArray *)self->_buttonActions removeObject:a3];
  if (![(NSMutableArray *)self->_buttonActions count])
  {
    buttonActions = self->_buttonActions;
    self->_buttonActions = 0;
  }
}

- (void)updateActivteActivityText
{
  v3 = [(RPCCModuleViewController *)self _effectiveTitle];
  [(RPCCModuleViewController *)self _updateTitle:v3 on:self->_activeActivities != 0];

  [(RPCCModuleViewController *)self _setSubtitleLabelText];

  [(RPCCModuleViewController *)self _setSelectedIfNeccessary];
}

- (void)viewWillLayoutSubviews
{
  v3 = RPCCUILogModule;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "RPCCModuleViewController viewWillLayoutSubviews", buf, 2u);
  }
  v10.receiver = self;
  v10.super_class = (Class)RPCCModuleViewController;
  [(RPCCModuleViewController *)&v10 viewWillLayoutSubviews];
  [(RPCCModuleViewController *)self _updateTextAttributesIfNecessary];
  if (![(RPCCModuleViewController *)self isExpanded])
  {
    id v4 = [(RPCCModuleViewController *)self view];
    [v4 bounds];
    self->_compactBounds.origin.x = v5;
    self->_compactBounds.origin.y = v6;
    self->_compactBounds.size.width = v7;
    self->_compactBounds.size.height = v8;
  }
  v9 = [(RPCCModuleViewController *)self _effectiveTitle];
  [(RPCCModuleViewController *)self _updateTitle:v9 on:self->_activeActivities != 0];

  [(RPCCModuleViewController *)self _setSubtitleLabelText];
  [(RPCCModuleViewController *)self _setSelectedIfNeccessary];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v18.receiver = self;
  v18.super_class = (Class)RPCCModuleViewController;
  [(RPCCModuleViewController *)&v18 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3 && !self->_categoriesToVisualStylingProviders)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    CGFloat v6 = [(RPCCModuleViewController *)self requiredVisualStyleCategories];
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        objc_super v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) integerValue];
          v12 = [(RPCCModuleViewController *)self view];
          v13 = [v12 visualStylingProviderForCategory:v11];
          [(RPCCModuleViewController *)self setVisualStylingProvider:v13 forCategory:v11];

          objc_super v10 = (char *)v10 + 1;
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
  v2 = +[NSMutableSet setWithObject:&off_6B300];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v16 = a3;
  CGFloat v6 = [(RPCCModuleViewController *)self requiredVisualStyleCategories];
  id v7 = +[NSNumber numberWithInteger:a4];
  unsigned int v8 = [v6 containsObject:v7];

  if (v8)
  {
    categoriesToVisualStylingProviders = self->_categoriesToVisualStylingProviders;
    objc_super v10 = +[NSNumber numberWithInteger:a4];
    id v11 = [(NSMutableDictionary *)categoriesToVisualStylingProviders objectForKey:v10];

    v12 = self->_categoriesToVisualStylingProviders;
    if (!v12)
    {
      v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      long long v14 = self->_categoriesToVisualStylingProviders;
      self->_categoriesToVisualStylingProviders = v13;

      v12 = self->_categoriesToVisualStylingProviders;
    }
    long long v15 = +[NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)v12 setObject:v16 forKey:v15];

    [(RPCCModuleViewController *)self _visualStylingProvider:v16 didChangeForCategory:a4 outgoingProvider:v11];
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
  v8[2] = sub_27B00;
  v8[3] = &unk_69650;
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
    [(RPCCModuleViewController *)self _setNeedsTextAttributesUpdate];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(RPCCModuleViewController *)self adjustsFontForContentSizeCategory];
  if (v3) {
    [(RPCCModuleViewController *)self _setNeedsTextAttributesUpdate];
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
  v22 = v15;
  id v16 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  v24 = v16;
  long long v17 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  objc_super v18 = [v14 fontDescriptorByAddingAttributes:v17];

  v19 = +[UIFont fontWithDescriptor:v18 size:0.0];

  return v19;
}

+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6
{
  return _[a1 _preferredFont:a3 textStyle:a4 weight:*(void *)&a6 additionalTraits:0 compatibleWithTraitCollection:a5];
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
  if (!self->_initialUseView && [(RPCCModuleViewController *)self isViewLoaded])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (![(RPCCModuleViewController *)self _isRequestingInitialUseView]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [(RPCCModuleViewController *)self _setRequestingInitialUseView:1];
    }
  }
}

- (void)_updateTextAttributesForTitleLabel:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    CGFloat v5 = [(RPCCModuleViewController *)self traitCollection];
    id v6 = [v5 preferredContentSizeCategory];

    if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v6))
    {
      int64_t v7 = UIContentSizeCategoryAccessibilityMedium;

      id v6 = v7;
    }
    uint64_t v8 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleLargeTitle];
    id v9 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleLargeTitle];
    UIFontDescriptorTraitKey v15 = UIFontWeightTrait;
    BOOL v10 = +[NSNumber numberWithDouble:UIFontWeightBlack];
    id v16 = v10;
    id v11 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    id v12 = [v9 fontDescriptorByAddingAttributes:v11];

    uint64_t v13 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v6];
    [v8 scaledValueForValue:v13 compatibleWithTraitCollection:14.0];
    long long v14 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v12);

    [v4 setFont:v14];
  }
}

- (void)_subtitleActivityFontActivityFontForSubTitleLabel:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    CGFloat v5 = [(RPCCModuleViewController *)self traitCollection];
    id v6 = [v5 preferredContentSizeCategory];

    if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v6))
    {
      int64_t v7 = UIContentSizeCategoryAccessibilityMedium;

      id v6 = v7;
    }
    uint64_t v8 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleSubheadline];
    id v9 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleSubheadline];
    UIFontDescriptorTraitKey v15 = UIFontWeightTrait;
    BOOL v10 = +[NSNumber numberWithDouble:UIFontWeightBold];
    id v16 = v10;
    id v11 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    id v12 = [v9 fontDescriptorByAddingAttributes:v11];

    uint64_t v13 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v6];
    [v8 scaledValueForValue:v13 compatibleWithTraitCollection:13.0];
    long long v14 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v12);

    [v4 setFont:v14];
  }
}

- (id)_newTitleLabelForOnState:(BOOL)a3
{
  id v4 = objc_alloc_init((Class)UILabel);
  [v4 setNumberOfLines:2];
  LODWORD(v5) = 1036831949;
  [v4 _setHyphenationFactor:v5];
  [v4 setContentMode:4];
  [(RPCCModuleViewController *)self _updateTextAttributesForTitleLabel:v4];
  id v6 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&off_6B300];
  [(RPCCModuleViewController *)self _updateVisualStylingOfView:v4 style:0 visualStylingProvider:v6 outgoingProvider:0];

  return v4;
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
    if ([(RPCCModuleViewController *)self isViewLoaded])
    {
      int64_t v7 = [(RPCCModuleViewController *)self _newTitleLabelForOnState:v5];
      activeTitleLabel = self->_activeTitleLabel;
      self->_activeTitleLabel = v7;

      id v9 = [(RPCCModuleViewController *)self view];
      [v9 addSubview:self->_activeTitleLabel];
    }
  }
}

- (void)_configureActiveTitleLabelIfNecesaryForOnState:(BOOL)a3
{
}

- (void)_configureActiveEffectLabelIfNecessary
{
  if (!self->_activeEffectLabel && !self->_subtitleEffectView)
  {
    id v3 = objc_alloc((Class)UIVisualEffectView);
    BOOL v4 = +[UIVibrancyEffect controlCenterPrimaryVibrancyEffect];
    BOOL v5 = (UIVisualEffectView *)[v3 initWithEffect:v4];
    subtitleEffectView = self->_subtitleEffectView;
    self->_subtitleEffectView = v5;

    [(UIVisualEffectView *)self->_subtitleEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
    int64_t v7 = self->_subtitleEffectView;
    uint64_t v8 = [(RPCCModuleViewController *)self view];
    [v8 frame];
    -[UIVisualEffectView setFrame:](v7, "setFrame:");

    id v9 = [(RPCCModuleViewController *)self view];
    [v9 addSubview:self->_subtitleEffectView];

    [(UIVisualEffectView *)self->_subtitleEffectView setUserInteractionEnabled:0];
    BOOL v10 = (UILabel *)objc_alloc_init((Class)UILabel);
    activeEffectLabel = self->_activeEffectLabel;
    self->_activeEffectLabel = v10;

    id v12 = [(UIVisualEffectView *)self->_subtitleEffectView contentView];
    [v12 addSubview:self->_activeEffectLabel];

    [(UILabel *)self->_activeEffectLabel setNumberOfLines:1];
    [(UILabel *)self->_activeEffectLabel setLineBreakMode:4];
    [(RPCCModuleViewController *)self _setSubtitleLabelText];
    uint64_t v13 = self->_activeEffectLabel;
    [(RPCCModuleViewController *)self _subtitleActivityFontActivityFontForSubTitleLabel:v13];
  }
}

- (void)_setSelectedIfNeccessary
{
  id v3 = [(NSMutableArray *)self->_activeActivities count];
  [(RPCCModuleViewController *)self setSelected:v3 != 0];
  if (v3) {
    +[UIColor systemBlackColor];
  }
  else {
  id v4 = +[UIColor systemWhiteColor];
  }
  [(UILabel *)self->_activeTitleLabel setTextColor:v4];
}

- (void)_setSubtitleLabelText
{
  if (self->_activeEffectLabel)
  {
    id v3 = [(NSMutableArray *)self->_activeActivities count];
    id v16 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_VIDEO_NO_EFFECTS"];
    switch((unint64_t)v3)
    {
      case 1uLL:
        id v4 = [(NSMutableArray *)self->_activeActivities firstObject];
        BOOL v5 = [v4 activityIdentifier];
        unsigned __int8 v6 = [v5 isEqualToString:AVControlCenterVideoEffectCenterStage];

        if (v6)
        {
          CFStringRef v7 = @"CONTROL_CENTER_CINEMATIC_FRAMING";
        }
        else
        {
          id v9 = [v4 activityIdentifier];
          unsigned __int8 v10 = [v9 isEqualToString:AVControlCenterVideoEffectBackgroundBlur];

          if (v10)
          {
            CFStringRef v7 = @"CONTROL_CENTER_PORTRAIT";
          }
          else
          {
            id v11 = [v4 activityIdentifier];
            unsigned __int8 v12 = [v11 isEqualToString:AVControlCenterVideoEffectStudioLighting];

            if (v12)
            {
              CFStringRef v7 = @"CONTROL_CENTER_STUDIO_LIGHT";
            }
            else
            {
              uint64_t v13 = [v4 activityIdentifier];
              unsigned int v14 = [v13 isEqualToString:AVControlCenterVideoEffectReactions];

              if (!v14) {
                goto LABEL_11;
              }
              CFStringRef v7 = @"CONTROL_CENTER_REACTIONS";
            }
          }
        }
        uint64_t v15 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v7];

        id v16 = (id)v15;
LABEL_11:

        [(UILabel *)self->_activeEffectLabel setText:v16];
        [(RPCCModuleViewController *)self _setActiveEffectLabelVibrancy];

        break;
      case 2uLL:
        CFStringRef v8 = @"CONTROL_CENTER_VIDEO_EFFECTS_2_ON";
        goto LABEL_10;
      case 3uLL:
        CFStringRef v8 = @"CONTROL_CENTER_VIDEO_EFFECTS_3_ON";
        goto LABEL_10;
      case 4uLL:
        CFStringRef v8 = @"CONTROL_CENTER_VIDEO_EFFECTS_4_ON";
        goto LABEL_10;
      default:
        CFStringRef v8 = @"CONTROL_CENTER_VIDEO_NO_EFFECTS";
LABEL_10:
        +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v8];
        id v4 = v16;
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
    }
  }
}

- (void)_setActiveEffectLabelVibrancy
{
  if ([(NSMutableArray *)self->_activeActivities count]) {
    +[UIVibrancyEffect controlCenterKeyLineOnLightVibrancyEffect];
  }
  else {
  id v3 = +[UIVibrancyEffect controlCenterSecondaryVibrancyEffect];
  }
  [(UIVisualEffectView *)self->_subtitleEffectView setEffect:v3];
}

- (CGRect)_textFrameInBounds:(CGRect)a3 isRTL:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = [(RPCCModuleViewController *)self traitCollection];
  unsigned __int8 v10 = [v9 preferredContentSizeCategory];

  if (UIContentSizeCategoryCompareToCategory(v10, UIContentSizeCategoryExtraExtraExtraLarge) == NSOrderedAscending) {
    double v11 = 12.0;
  }
  else {
    double v11 = 10.0;
  }
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  CGFloat rect = height;
  v25.size.CGFloat height = height;
  CGRect v26 = CGRectInset(v25, v11, 0.0);
  CGFloat v12 = v26.origin.x;
  CGFloat v13 = v26.origin.y;
  CGFloat v14 = v26.size.width;
  CGFloat v15 = v26.size.height;
  double v16 = CGRectGetWidth(v26) + -26.0 + -10.0;
  if (v4)
  {
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = rect;
    double v17 = CGRectGetWidth(v27) + -12.0 + -26.0 + -10.0 - v16;
  }
  else
  {
    double v17 = 48.0;
  }
  v28.origin.CGFloat x = v12;
  v28.origin.CGFloat y = v13;
  v28.size.CGFloat width = v14;
  v28.size.CGFloat height = v15;
  CGFloat MinY = CGRectGetMinY(v28);
  v29.origin.CGFloat x = v12;
  v29.origin.CGFloat y = v13;
  v29.size.CGFloat width = v14;
  v29.size.CGFloat height = v15;
  CGFloat v19 = CGRectGetHeight(v29);

  double v20 = v17;
  double v21 = MinY;
  double v22 = v16;
  double v23 = v19;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (void)_updateTitle:(id)a3 on:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![(RPCCModuleViewController *)self isViewLoaded]) {
    goto LABEL_34;
  }
  CFStringRef v7 = [(RPCCModuleViewController *)self view];
  id v8 = [v7 _shouldReverseLayoutDirection];
  double x = self->_compactBounds.origin.x;
  double y = self->_compactBounds.origin.y;
  double width = self->_compactBounds.size.width;
  double height = self->_compactBounds.size.height;
  [(UILabel *)self->_activeEffectLabel alpha];
  double v14 = v13;
  if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
  {
    if (v14 > 0.0 != v4)
    {
      int v15 = 1;
    }
    else
    {
      double v16 = [(UILabel *)self->_activeTitleLabel text];
      int v15 = BSEqualStrings() ^ 1;
    }
  }
  else
  {
    int v15 = 0;
  }
  p_outgoingTitleLabel = &self->_outgoingTitleLabel;
  [(UILabel *)self->_outgoingTitleLabel removeFromSuperview];
  objc_storeStrong((id *)&self->_outgoingTitleLabel, self->_activeTitleLabel);
  objc_super v18 = [(RPCCModuleViewController *)self _newTitleLabelForOnState:v4];
  activeTitleLabel = self->_activeTitleLabel;
  self->_activeTitleLabel = v18;

  [(UILabel *)self->_activeTitleLabel setAlpha:1.0];
  [(UILabel *)self->_activeTitleLabel setText:v6];
  [v7 addSubview:self->_activeTitleLabel];
  if (v4) {
    [(RPCCModuleViewController *)self _configureActiveEffectLabelIfNecessary];
  }
  -[RPCCModuleViewController _textFrameInBounds:isRTL:](self, "_textFrameInBounds:isRTL:", v8, x, y, width, height);
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  double v26 = v20;
  double v27 = v21;
  if (v15)
  {
    -[UILabel sizeThatFits:](*p_outgoingTitleLabel, "sizeThatFits:", v20, v21);
    double v29 = v28;
    id v31 = -[UILabel sizeThatFits:](self->_activeTitleLabel, "sizeThatFits:", v26, v27, v30);
  }
  else
  {
    double v29 = CGSizeZero.height;
    id v31 = -[UILabel sizeThatFits:](self->_activeTitleLabel, "sizeThatFits:", v20, v21, *(void *)&CGSizeZero.width);
  }
  double v54 = v32;
  double v55 = v33;
  double v34 = v14;
  if (v14 <= 0.0 && !v4)
  {
    double v37 = CGSizeZero.width;
    double v39 = CGSizeZero.height;
  }
  else
  {
    id v31 = -[UILabel sizeThatFits:](self->_activeEffectLabel, "sizeThatFits:", v26, v27);
    double v37 = v36;
    double v39 = v38;
  }
  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  CGSize v70 = size;
  CGPoint v67 = origin;
  CGSize v68 = size;
  CGPoint v65 = origin;
  CGSize v66 = size;
  CGPoint v63 = origin;
  CGSize v64 = size;
  if (v15)
  {
    if (v34 <= 0.0)
    {
      v71.origin.double x = v23;
      v71.origin.double y = v25;
      v71.size.double width = v26;
      v71.size.double height = v27;
      CGRectGetWidth(v71);
      BSRectWithSize();
      id v31 = (id)UIRectCenteredIntegralRect();
      origin.double x = v42;
      origin.double y = v43;
      v70.double width = v44;
      v70.double height = v45;
      if (v4) {
        goto LABEL_22;
      }
LABEL_24:
      v72.origin.double x = v23;
      v72.origin.double y = v25;
      v72.size.double width = v26;
      v72.size.double height = v27;
      CGRectGetWidth(v72);
      BSRectWithSize();
      UIRectCenteredIntegralRect();
      v67.double x = v46;
      v68.double width = v47;
      v68.double height = v48;
      goto LABEL_25;
    }
    sub_28ED8(v23, v25, v26, v27, v53, v29, v37, v39, (uint64_t)v31, &origin.x, &v65.x);
  }
  if (!v4) {
    goto LABEL_24;
  }
LABEL_22:
  sub_28ED8(v23, v25, v26, v27, v54, v55, v37, v39, (uint64_t)v31, &v67.x, &v63.x);
  double v41 = v67.y;
LABEL_25:
  double v49 = v41 + 10.0;
  v67.double y = v41 + 10.0;
  if (v34 <= 0.0)
  {
    v65.double x = v63.x;
    CGSize v66 = v64;
    v65.double y = v63.y + 10.0;
  }
  if (v15)
  {
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    CGPoint v57 = origin;
    CGSize v58 = v70;
    CGPoint v59 = v67;
    CGSize v60 = v68;
    CGPoint v61 = v65;
    CGSize v62 = v66;
    v56[2] = sub_29004;
    v56[3] = &unk_69678;
    v56[4] = self;
    +[UIView performWithoutAnimation:v56];
    double v49 = v67.y;
  }
  v67.double y = v49 + -10.0;
  origin.double y = origin.y + -10.0;
  if (!v4)
  {
    v63.double x = v65.x;
    CGSize v64 = v66;
    v63.double y = v65.y + -10.0;
  }
  if (v15)
  {
    v50 = *p_outgoingTitleLabel;
    UIRectIntegralWithScale();
    -[UILabel setFrame:](v50, "setFrame:");
  }
  v51 = self->_activeTitleLabel;
  UIRectIntegralWithScale();
  -[UILabel setFrame:](v51, "setFrame:");
  activeEffectLabel = self->_activeEffectLabel;
  UIRectIntegralWithScale();
  -[UILabel setFrame:](activeEffectLabel, "setFrame:");

LABEL_34:
}

- (id)_effectiveTitle
{
  return +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_VIDEO_EFFECTS"];
}

- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6
{
  if (a3)
  {
    id v9 = a5;
    id v10 = a3;
    [a6 stopAutomaticallyUpdatingView:v10];
    [v9 automaticallyUpdateView:v10 withStyle:a4 andObserverBlock:&stru_69698];
  }
}

- (void)_visualStylingProvider:(id)a3 didChangeForCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  if (a4 == 1)
  {
    activeTitleLabel = self->_activeTitleLabel;
    id v9 = a5;
    id v10 = a3;
    [(RPCCModuleViewController *)self _updateVisualStylingOfView:activeTitleLabel style:0 visualStylingProvider:v10 outgoingProvider:v9];
    [(RPCCModuleViewController *)self _updateVisualStylingOfView:self->_outgoingTitleLabel style:0 visualStylingProvider:v10 outgoingProvider:v9];
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

  id v4 = [(RPCCModuleViewController *)self viewIfLoaded];
  [v4 setNeedsLayout];
}

- (void)_updateTextAttributes
{
  id v3 = [(RPCCModuleViewController *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  preferredContentSizeCategordouble y = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategordouble y = v4;

  [(RPCCModuleViewController *)self _updateTextAttributesForTitleLabel:self->_activeTitleLabel];
  activeEffectLabel = self->_activeEffectLabel;

  [(RPCCModuleViewController *)self _subtitleActivityFontActivityFontForSubTitleLabel:activeEffectLabel];
}

- (void)_updateTextAttributesIfNecessary
{
  if ([(RPCCModuleViewController *)self _needsTextAttributesUpdate])
  {
    [(RPCCModuleViewController *)self _updateTextAttributes];
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

- (RPCCModuleViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RPCCModuleViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RPCCActivityDescribing)suggestedActivity
{
  return self->_suggestedActivity;
}

- (NSMutableArray)activeActivities
{
  return self->_activeActivities;
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
  objc_storeStrong((id *)&self->_activeActivities, 0);
  objc_storeStrong((id *)&self->_suggestedActivity, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_subtitleEffectView, 0);
  objc_storeStrong((id *)&self->_categoriesToVisualStylingProviders, 0);
  objc_storeStrong((id *)&self->_buttonActions, 0);
  objc_storeStrong((id *)&self->_activeEffectLabel, 0);
  objc_storeStrong((id *)&self->_outgoingTitleLabel, 0);

  objc_storeStrong((id *)&self->_activeTitleLabel, 0);
}

@end