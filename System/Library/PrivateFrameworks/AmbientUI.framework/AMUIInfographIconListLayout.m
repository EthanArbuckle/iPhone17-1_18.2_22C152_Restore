@interface AMUIInfographIconListLayout
+ (BOOL)_shouldUseLegacyContentMargins;
- (AMUIInfographIconListLayout)init;
- (AMUIInfographIconListLayout)initWithRootFolderVisualConfiguration:(id)a3;
- (AMUIInfographIconListLayout)initWithRootFolderVisualConfiguration:(id)a3 screenType:(unint64_t)a4;
- (BOOL)supportsExtensibleGridSizeClasses;
- (BOOL)widgetsSupportDynamicText;
- (CGSize)iconSpacingForOrientation:(int64_t)a3;
- (SBHIconAccessoryVisualConfiguration)iconAccessoryVisualConfiguration;
- (SBHIconGridSizeClassSet)supportedIconGridSizeClasses;
- (SBHRootFolderVisualConfiguration)rootFolderVisualConfiguration;
- (SBHRootFolderVisualConfiguration)visualConfiguration;
- (SBIconImageInfo)_defaultSmallWidgetIconImageInfo;
- (SBIconImageInfo)iconImageInfo;
- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3;
- (UIEdgeInsets)_contentMarginsForMarginRatio:(double)a3;
- (UIEdgeInsets)layoutInsetsForOrientation:(int64_t)a3;
- (UIEdgeInsets)widgetContentMargins;
- (UIEdgeInsets)widgetContentMarginsWithBackgroundRemoved;
- (double)_widgetCornerRadius;
- (double)_widgetDimensionForScreenType:(unint64_t)a3;
- (double)editingAnimationStrengthForGridSizeClass:(id)a3;
- (double)widgetScaleFactor;
- (id)_defaultIconListLayout;
- (unint64_t)numberOfColumnsForOrientation:(int64_t)a3;
- (unint64_t)numberOfRowsForOrientation:(int64_t)a3;
- (unint64_t)screenType;
- (void)iconListView:(id)a3 willLayoutIconView:(id)a4;
- (void)setVisualConfiguration:(id)a3;
@end

@implementation AMUIInfographIconListLayout

- (AMUIInfographIconListLayout)initWithRootFolderVisualConfiguration:(id)a3 screenType:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMUIInfographIconListLayout;
  v8 = [(AMUIInfographIconListLayout *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_visualConfiguration, a3);
    v9->_screenType = a4;
  }

  return v9;
}

- (AMUIInfographIconListLayout)initWithRootFolderVisualConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [(AMUIInfographIconListLayout *)self initWithRootFolderVisualConfiguration:v4 screenType:SBHScreenTypeForCurrentDevice()];

  return v5;
}

- (AMUIInfographIconListLayout)init
{
  id v3 = objc_alloc_init(MEMORY[0x263F79248]);
  id v4 = [(AMUIInfographIconListLayout *)self initWithRootFolderVisualConfiguration:v3];

  return v4;
}

- (SBHRootFolderVisualConfiguration)rootFolderVisualConfiguration
{
  v2 = (void *)[(SBHRootFolderVisualConfiguration *)self->_visualConfiguration copy];

  return (SBHRootFolderVisualConfiguration *)v2;
}

- (unint64_t)numberOfRowsForOrientation:(int64_t)a3
{
  return 1;
}

- (unint64_t)numberOfColumnsForOrientation:(int64_t)a3
{
  return 2;
}

- (UIEdgeInsets)layoutInsetsForOrientation:(int64_t)a3
{
  unint64_t screenType = self->_screenType;
  if (screenType < 0x1D && ((0x1FFFFFFBu >> screenType) & 1) != 0)
  {
    double v5 = dbl_24786C070[screenType];
    double v6 = dbl_24786C158[screenType];
  }
  else
  {
    id v4 = AMUILogInfograph();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[AMUIInfographIconListLayout layoutInsetsForOrientation:]();
    }

    double v5 = 70.0;
    double v6 = 70.0;
  }
  double v7 = v6;
  double v8 = v5;
  result.right = v8;
  result.bottom = v7;
  result.left = v5;
  result.top = v6;
  return result;
}

- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3
{
  return (SBIconImageInfo *)[(AMUIInfographIconListLayout *)self _widgetCornerRadius];
}

- (SBHIconAccessoryVisualConfiguration)iconAccessoryVisualConfiguration
{
  id v3 = [(AMUIInfographIconListLayout *)self _defaultIconListLayout];
  id v4 = [v3 iconAccessoryVisualConfiguration];
  [(AMUIInfographIconListLayout *)self widgetScaleFactor];
  CGFloat v6 = v5;
  [v4 size];
  double v8 = v7;
  double v10 = v9;
  CGAffineTransformMakeScale(&v12, v6, v6);
  objc_msgSend(v4, "setSize:", v10 * v12.c + v12.a * v8, v10 * v12.d + v12.b * v8);

  return (SBHIconAccessoryVisualConfiguration *)v4;
}

- (double)_widgetDimensionForScreenType:(unint64_t)a3
{
  SBHGetScreenSpecification();
  [(AMUIInfographIconListLayout *)self layoutInsetsForOrientation:3];
  return 0.0 - v4 - v5;
}

- (double)_widgetCornerRadius
{
  [(AMUIInfographIconListLayout *)self _defaultSmallWidgetIconImageInfo];
  double v4 = v3;
  [(AMUIInfographIconListLayout *)self widgetScaleFactor];
  return v4 * v5;
}

- (id)_defaultIconListLayout
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F791F0]) initWithScreenType:self->_screenType];
  double v3 = [v2 layoutForIconLocation:*MEMORY[0x263F79320]];

  return v3;
}

- (SBIconImageInfo)_defaultSmallWidgetIconImageInfo
{
  double v3 = [(AMUIInfographIconListLayout *)self _defaultIconListLayout];
  [v3 iconImageInfoForGridSizeClass:*MEMORY[0x263F79310]];

  return result;
}

- (SBIconImageInfo)iconImageInfo
{
  return [(AMUIInfographIconListLayout *)self iconImageInfoForGridSizeClass:*MEMORY[0x263F792D0]];
}

- (SBHIconGridSizeClassSet)supportedIconGridSizeClasses
{
  id v2 = objc_alloc(MEMORY[0x263F79208]);
  double v3 = (void *)[v2 initWithGridSizeClass:*MEMORY[0x263F79310]];

  return (SBHIconGridSizeClassSet *)v3;
}

- (double)widgetScaleFactor
{
  [(AMUIInfographIconListLayout *)self _widgetDimensionForScreenType:self->_screenType];
  double v4 = v3;
  [(AMUIInfographIconListLayout *)self _defaultSmallWidgetIconImageInfo];
  return v4 / v5;
}

- (UIEdgeInsets)widgetContentMargins
{
  [(AMUIInfographIconListLayout *)self _contentMarginsForMarginRatio:0.101265823];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)widgetContentMarginsWithBackgroundRemoved
{
  [(AMUIInfographIconListLayout *)self _contentMarginsForMarginRatio:0.0443037975];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)_contentMarginsForMarginRatio:(double)a3
{
  if ([(id)objc_opt_class() _shouldUseLegacyContentMargins])
  {
    [(AMUIInfographIconListLayout *)self _defaultSmallWidgetIconImageInfo];
    SBHGetScreenSpecification();
    BSFloatRoundForScale();
  }
  else
  {
    [(AMUIInfographIconListLayout *)self _widgetDimensionForScreenType:self->_screenType];
    double v5 = v6 * a3;
  }
  double v7 = v5;
  double v8 = v5;
  double v9 = v5;
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v5;
  return result;
}

- (BOOL)widgetsSupportDynamicText
{
  return 0;
}

- (CGSize)iconSpacingForOrientation:(int64_t)a3
{
  unint64_t screenType = self->_screenType;
  if (screenType < 0x1D && ((0x1FFFFFFBu >> screenType) & 1) != 0)
  {
    double v5 = dbl_24786C240[screenType];
  }
  else
  {
    double v4 = AMUILogInfograph();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[AMUIInfographIconListLayout iconSpacingForOrientation:]();
    }

    double v5 = 40.0;
  }
  double v6 = v5;
  result.height = v6;
  result.width = v5;
  return result;
}

- (double)editingAnimationStrengthForGridSizeClass:(id)a3
{
  return 0.25;
}

- (BOOL)supportsExtensibleGridSizeClasses
{
  return 1;
}

- (void)iconListView:(id)a3 willLayoutIconView:(id)a4
{
  id v4 = a4;
  id v10 = [v4 icon];
  if ([v10 isPlaceholder]) {
    [MEMORY[0x263F1C550] clearColor];
  }
  else {
  double v5 = [MEMORY[0x263F1C550] blackColor];
  }
  double v6 = [v4 contentContainerView];
  [v6 setBackgroundColor:v5];

  double v7 = [v4 contentContainerView];
  [v4 iconImageInfo];
  [v7 _setContinuousCornerRadius:v8];

  double v9 = [v4 contentContainerView];

  [v9 setNeedsLayout];
}

+ (BOOL)_shouldUseLegacyContentMargins
{
  if (_shouldUseLegacyContentMargins_onceToken != -1) {
    dispatch_once(&_shouldUseLegacyContentMargins_onceToken, &__block_literal_global_8);
  }
  return _shouldUseLegacyContentMargins___shouldUseLegacyContentMargins;
}

uint64_t __61__AMUIInfographIconListLayout__shouldUseLegacyContentMargins__block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  _shouldUseLegacyContentMargins___shouldUseLegacyContentMargins = result ^ 1;
  return result;
}

- (unint64_t)screenType
{
  return self->_screenType;
}

- (SBHRootFolderVisualConfiguration)visualConfiguration
{
  return self->_visualConfiguration;
}

- (void)setVisualConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)layoutInsetsForOrientation:.cold.1()
{
  v0 = SBHStringForScreenType();
  OUTLINED_FUNCTION_0_1(&dword_247837000, v1, v2, "Requesting layout insets for unexpected screen type: %{public}@", v3, v4, v5, v6, 2u);
}

- (void)iconSpacingForOrientation:.cold.1()
{
  v0 = SBHStringForScreenType();
  OUTLINED_FUNCTION_0_1(&dword_247837000, v1, v2, "Requesting icon spacing for unexpected screen type: %{public}@", v3, v4, v5, v6, 2u);
}

@end