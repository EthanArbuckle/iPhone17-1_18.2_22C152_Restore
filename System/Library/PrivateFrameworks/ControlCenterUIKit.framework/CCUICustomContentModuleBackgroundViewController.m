@interface CCUICustomContentModuleBackgroundViewController
- (BOOL)_shouldLimitContentSizeCategory;
- (BOOL)positionHeaderToRightInLandscapeRight;
- (CGPoint)_footerCenterForBounds:(CGRect)a3;
- (CGPoint)_headerCenterForBounds:(CGRect)a3;
- (CGRect)effectiveContentFrameForContainerFrame:(CGRect)a3;
- (double)expandedContentModuleHeight;
- (double)expandedContentModuleWidth;
- (id)_titleFont;
- (id)requiredVisualStyleCategories;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (void)_updateCustomFooterViewLayoutIfNecessary;
- (void)_updateCustomHeaderViewLayoutIfNecessary;
- (void)_updateFooterButtonsLayoutIfNecessary;
- (void)_updateHeaderGlyphVisualStylingWithProvider:(id)a3;
- (void)_updateHeaderLayoutIfNecessary;
- (void)_updateTitleFont;
- (void)_visualStylingProvider:(id)a3 didChangeForCategory:(int64_t)a4 outgoingVisualStylingProvider:(id)a5;
- (void)setCustomFooterView:(id)a3;
- (void)setCustomHeaderView:(id)a3;
- (void)setExpandedContentModuleHeight:(double)a3;
- (void)setExpandedContentModuleWidth:(double)a3;
- (void)setFooterButtons:(id)a3;
- (void)setHeaderGlyphImage:(id)a3;
- (void)setHeaderGlyphImage:(id)a3 unscaledSymbolPointSize:(double)a4;
- (void)setHeaderGlyphPackageDescription:(id)a3;
- (void)setHeaderGlyphState:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setPositionHeaderToRightInLandscapeRight:(BOOL)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillLayoutSubviews;
@end

@implementation CCUICustomContentModuleBackgroundViewController

- (void)viewDidLoad
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)CCUICustomContentModuleBackgroundViewController;
  [(CCUICustomContentModuleBackgroundViewController *)&v6 viewDidLoad];
  v3 = self;
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v5 = (id)[(CCUICustomContentModuleBackgroundViewController *)self registerForTraitChanges:v4 withAction:sel__contentSizeCategoryDidChange];

  [(CCUICustomContentModuleBackgroundViewController *)self _contentSizeCategoryDidChange];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CCUICustomContentModuleBackgroundViewController;
  [(CCUICustomContentModuleBackgroundViewController *)&v3 viewWillLayoutSubviews];
  [(CCUICustomContentModuleBackgroundViewController *)self _updateHeaderLayoutIfNecessary];
  [(CCUICustomContentModuleBackgroundViewController *)self _updateCustomHeaderViewLayoutIfNecessary];
  [(CCUICustomContentModuleBackgroundViewController *)self _updateFooterButtonsLayoutIfNecessary];
  [(CCUICustomContentModuleBackgroundViewController *)self _updateCustomFooterViewLayoutIfNecessary];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CCUICustomContentModuleBackgroundViewController;
  [(CCUICustomContentModuleBackgroundViewController *)&v10 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3)
  {
    objc_super v6 = [(CCUICustomContentModuleBackgroundViewController *)self visualStylingProviderForCategory:1];
    categoriesToVisualStylingProviders = self->_categoriesToVisualStylingProviders;
    v8 = [NSNumber numberWithInteger:1];
    v9 = [(NSMutableDictionary *)categoriesToVisualStylingProviders objectForKey:v8];
    [(CCUICustomContentModuleBackgroundViewController *)self _visualStylingProvider:v6 didChangeForCategory:1 outgoingVisualStylingProvider:v9];
  }
}

- (void)setHeaderTitle:(id)a3
{
  id v4 = a3;
  headerTitleLabel = self->_headerTitleLabel;
  if (v4)
  {
    id v15 = v4;
    if (!headerTitleLabel)
    {
      id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
      v7 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      v8 = self->_headerTitleLabel;
      self->_headerTitleLabel = v7;

      v9 = self->_headerTitleLabel;
      objc_super v10 = [MEMORY[0x1E4FB1618] systemWhiteColor];
      [(UILabel *)v9 setTextColor:v10];

      v11 = self->_headerTitleLabel;
      v12 = [MEMORY[0x1E4FB08E0] systemFontOfSize:20.0];
      [(UILabel *)v11 setFont:v12];

      v13 = [(CCUICustomContentModuleBackgroundViewController *)self view];
      [v13 addSubview:self->_headerTitleLabel];

      headerTitleLabel = self->_headerTitleLabel;
    }
    [(UILabel *)headerTitleLabel setText:v15];
    headerTitleLabel = (UILabel *)[(CCUICustomContentModuleBackgroundViewController *)self _updateTitleFont];
  }
  else
  {
    if (!headerTitleLabel) {
      goto LABEL_8;
    }
    id v15 = 0;
    [(UILabel *)headerTitleLabel removeFromSuperview];
    v14 = self->_headerTitleLabel;
    self->_headerTitleLabel = 0;
  }
  id v4 = v15;
LABEL_8:
  MEMORY[0x1F41817F8](headerTitleLabel, v4);
}

- (void)setHeaderGlyphImage:(id)a3
{
}

- (void)setHeaderGlyphImage:(id)a3 unscaledSymbolPointSize:(double)a4
{
  id v6 = (UIImageView *)a3;
  headerImageView = self->_headerImageView;
  if (v6)
  {
    v22 = v6;
    if (!headerImageView)
    {
      v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      v9 = self->_headerImageView;
      self->_headerImageView = v8;

      [(UIImageView *)self->_headerImageView controlCenterApplyPrimaryContentShadow];
      [(UIImageView *)self->_headerImageView setContentMode:1];
      objc_super v10 = self->_headerImageView;
      v11 = [MEMORY[0x1E4FB1618] systemWhiteColor];
      [(UIImageView *)v10 setTintColor:v11];

      v12 = [(CCUICustomContentModuleBackgroundViewController *)self view];
      [v12 addSubview:self->_headerImageView];

      id v6 = v22;
    }
    if ([(UIImageView *)v6 isSymbolImage])
    {
      v13 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v14 = [v13 userInterfaceIdiom];

      double v15 = 1.33333333;
      if ((v14 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
        double v15 = 1.5;
      }
      v16 = [MEMORY[0x1E4FB1830] configurationWithPointSize:round(v15 * a4)];
      uint64_t v17 = [(UIImageView *)v22 imageByApplyingSymbolConfiguration:v16];

      v18 = (UIImageView *)v17;
    }
    else
    {
      v18 = v22;
    }
    v23 = v18;
    [(UIImageView *)self->_headerImageView setImage:v18];
    v20 = [(CCUICustomContentModuleBackgroundViewController *)self visualStylingProviderForCategory:1];
    [(CCUICustomContentModuleBackgroundViewController *)self _updateHeaderGlyphVisualStylingWithProvider:v20];

    v21 = [(CCUICustomContentModuleBackgroundViewController *)self view];
    [v21 setNeedsLayout];

    v19 = v23;
  }
  else
  {
    if (!headerImageView) {
      return;
    }
    [(UIImageView *)headerImageView removeFromSuperview];
    v19 = self->_headerImageView;
    self->_headerImageView = 0;
  }
}

- (void)setHeaderGlyphPackageDescription:(id)a3
{
  id v6 = a3;
  uint64_t v7 = 992;
  packageView = self->_packageView;
  id v19 = v6;
  if (!packageView)
  {
    v9 = objc_alloc_init(CCUICAPackageView);
    objc_super v10 = self->_packageView;
    self->_packageView = v9;

    [(UIView *)self->_packageView controlCenterApplyPrimaryContentShadow];
    v11 = [(CCUICustomContentModuleBackgroundViewController *)self view];
    [v11 addSubview:self->_packageView];

    id v6 = v19;
    packageView = self->_packageView;
  }
  [(CCUICAPackageView *)packageView setPackageDescription:v6];
  v12 = self->_packageView;
  v21.origin.x = CCUIReferenceScreenBounds();
  double Width = CGRectGetWidth(v21);
  if (Width < 1024.0
    || ([MEMORY[0x1E4FB16C8] currentDevice],
        self = (CCUICustomContentModuleBackgroundViewController *)objc_claimAutoreleasedReturnValue(),
        [(CCUICustomContentModuleBackgroundViewController *)self userInterfaceIdiom] != 1)
    || SBFEffectiveHomeButtonType() == 2)
  {
    v22.origin.x = CCUIReferenceScreenBounds();
    double v14 = CGRectGetWidth(v22);
    if (v14 >= 1024.0)
    {
      uint64_t v7 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([(id)v7 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        [(CCUICAPackageView *)v12 setScale:1.25];
LABEL_38:

LABEL_39:
        if (Width < 1024.0) {
          goto LABEL_41;
        }
        goto LABEL_40;
      }
    }
    v23.origin.x = CCUIReferenceScreenBounds();
    double v15 = CGRectGetWidth(v23);
    if (v15 >= 834.0)
    {
      objc_super v3 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v3 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        [(CCUICAPackageView *)v12 setScale:1.25];
LABEL_36:

LABEL_37:
        if (v14 < 1024.0) {
          goto LABEL_39;
        }
        goto LABEL_38;
      }
    }
    v24.origin.x = CCUIReferenceScreenBounds();
    double v16 = CGRectGetWidth(v24);
    if (v16 >= 834.0
      && ([MEMORY[0x1E4FB16C8] currentDevice],
          id v4 = objc_claimAutoreleasedReturnValue(),
          [v4 userInterfaceIdiom] == 1)
      && SBFEffectiveHomeButtonType() != 2)
    {
      [(CCUICAPackageView *)v12 setScale:1.25];
    }
    else
    {
      uint64_t v17 = [MEMORY[0x1E4FB16C8] currentDevice];
      double v18 = 1.25;
      if ([v17 userInterfaceIdiom] != 1)
      {
        v25.origin.x = CCUIReferenceScreenBounds();
        double v18 = 1.5;
        if (CGRectGetWidth(v25) < 430.0)
        {
          v26.origin.x = CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v26) < 428.0)
          {
            v27.origin.x = CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v27) < 414.0 || SBFEffectiveHomeButtonType() != 2)
            {
              v28.origin.x = CCUIReferenceScreenBounds();
              if (CGRectGetWidth(v28) < 414.0)
              {
                v29.origin.x = CCUIReferenceScreenBounds();
                if (CGRectGetWidth(v29) < 393.0)
                {
                  v30.origin.x = CCUIReferenceScreenBounds();
                  if (CGRectGetWidth(v30) < 390.0)
                  {
                    v31.origin.x = CCUIReferenceScreenBounds();
                    if (CGRectGetWidth(v31) < 375.0 || SBFEffectiveHomeButtonType() != 2)
                    {
                      v32.origin.x = CCUIReferenceScreenBounds();
                      if (CGRectGetWidth(v32) < 375.0) {
                        double v18 = 1.25;
                      }
                      else {
                        double v18 = 1.5;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      [(CCUICAPackageView *)v12 setScale:v18];

      if (v16 < 834.0)
      {
LABEL_35:
        if (v15 < 834.0) {
          goto LABEL_37;
        }
        goto LABEL_36;
      }
    }

    goto LABEL_35;
  }
  [(CCUICAPackageView *)v12 setScale:1.25];
LABEL_40:

LABEL_41:
}

- (void)setHeaderGlyphState:(id)a3
{
  id v4 = a3;
  [(CCUICustomContentModuleBackgroundViewController *)self loadViewIfNeeded];
  [(CCUICAPackageView *)self->_packageView setStateName:v4];
}

- (void)setCustomHeaderView:(id)a3
{
  id v5 = (UIView *)a3;
  p_customHeaderView = &self->_customHeaderView;
  customHeaderView = self->_customHeaderView;
  if (customHeaderView != v5)
  {
    double v14 = v5;
    if (customHeaderView) {
      [(UIView *)customHeaderView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_customHeaderView, a3);
    v8 = *p_customHeaderView;
    v9 = [(CCUICustomContentModuleBackgroundViewController *)self view];
    objc_super v10 = v9;
    if (v8)
    {
      [v9 addSubview:*p_customHeaderView];

      [(UILabel *)self->_headerTitleLabel removeFromSuperview];
      [(UIImageView *)self->_headerImageView removeFromSuperview];
      [(CCUICAPackageView *)self->_packageView removeFromSuperview];
    }
    else
    {
      [v9 addSubview:self->_headerTitleLabel];

      v11 = [(CCUICustomContentModuleBackgroundViewController *)self view];
      [v11 addSubview:self->_headerImageView];

      v12 = [(CCUICustomContentModuleBackgroundViewController *)self view];
      [v12 addSubview:self->_packageView];
    }
    v13 = [(CCUICustomContentModuleBackgroundViewController *)self view];
    [v13 setNeedsLayout];

    id v5 = v14;
  }
  MEMORY[0x1F41817F8](customHeaderView, v5);
}

- (void)setFooterButtons:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  footerButtons = self->_footerButtons;
  if (footerButtons)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v6 = footerButtons;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v29 + 1) + 8 * i) view];
          [v11 removeFromSuperview];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v8);
    }
  }
  v12 = (NSArray *)[v4 copy];
  v13 = self->_footerButtons;
  self->_footerButtons = v12;

  NSUInteger v14 = [(NSArray *)self->_footerButtons count];
  if (v14 == 1)
  {
    double v15 = (id *)MEMORY[0x1E4FB2790];
  }
  else
  {
    double v15 = (id *)MEMORY[0x1E4FB27B0];
    if (v14 != 2) {
      double v15 = (id *)MEMORY[0x1E4FB27C0];
    }
  }
  id v16 = *v15;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v17 = self->_footerButtons;
  uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        CGRect v22 = *(void **)(*((void *)&v25 + 1) + 8 * j);
        objc_msgSend(v22, "setContentSizeCategoryThreshold:", v16, (void)v25);
        CGRect v23 = [(CCUICustomContentModuleBackgroundViewController *)self view];
        CGRect v24 = [v22 view];
        [v23 addSubview:v24];
      }
      uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v19);
  }
}

- (void)setCustomFooterView:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = (UIView *)a3;
  p_customFooterView = &self->_customFooterView;
  customFooterView = self->_customFooterView;
  if (customFooterView != v5)
  {
    if (customFooterView) {
      [(UIView *)customFooterView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_customFooterView, a3);
    if (*p_customFooterView)
    {
      uint64_t v8 = [(CCUICustomContentModuleBackgroundViewController *)self view];
      [v8 addSubview:*p_customFooterView];

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v9 = self->_footerButtons;
      uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v28 != v12) {
              objc_enumerationMutation(v9);
            }
            NSUInteger v14 = [*(id *)(*((void *)&v27 + 1) + 8 * i) view];
            [v14 removeFromSuperview];
          }
          uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v11);
      }
    }
    else
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v9 = self->_footerButtons;
      uint64_t v15 = [(NSArray *)v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v24;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v24 != v17) {
              objc_enumerationMutation(v9);
            }
            uint64_t v19 = *(void **)(*((void *)&v23 + 1) + 8 * j);
            uint64_t v20 = [(CCUICustomContentModuleBackgroundViewController *)self view];
            CGRect v21 = [v19 view];
            [v20 addSubview:v21];
          }
          uint64_t v16 = [(NSArray *)v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
        }
        while (v16);
      }
    }

    CGRect v22 = [(CCUICustomContentModuleBackgroundViewController *)self view];
    [v22 setNeedsLayout];
  }
}

- (CGRect)effectiveContentFrameForContainerFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  double v8 = CGRectGetWidth(a3);
  *(CGFloat *)recta = x;
  v54.origin.CGFloat x = x;
  v54.origin.CGFloat y = y;
  v54.size.double width = width;
  v54.size.CGFloat height = height;
  -[CCUICustomContentModuleBackgroundViewController _headerCenterForBounds:](self, "_headerCenterForBounds:", 0.0, 0.0, v8, CGRectGetHeight(v54));
  double v10 = v9;
  double v12 = v11;
  p_headerImageView = (id *)&self->_headerImageView;
  NSUInteger v14 = [(UIImageView *)self->_headerImageView image];
  if (!v14) {
    p_headerImageView = (id *)&self->_packageView;
  }
  [*p_headerImageView bounds];
  double v16 = v15;
  double v18 = v17;

  uint64_t v19 = [(UILabel *)self->_headerTitleLabel text];

  double v46 = height;
  if (v19)
  {
    [(UILabel *)self->_headerTitleLabel frame];
    double v18 = v18 + CGRectGetHeight(v55) + 10.0;
    [(UILabel *)self->_headerTitleLabel frame];
    double v20 = CGRectGetWidth(v56);
    if (v16 < v20) {
      double v16 = v20;
    }
  }
  double v21 = v10 - v16 * 0.5;
  double v22 = v12 - v18 * 0.5;
  NSUInteger v23 = [(NSArray *)self->_footerButtons count];
  double v24 = v18;
  double v25 = v16;
  CGFloat v47 = v22;
  CGFloat v48 = v21;
  if (v23)
  {
    unint64_t v26 = v23;
    long long v27 = [(NSArray *)self->_footerButtons firstObject];
    long long v28 = [v27 button];
    objc_msgSend(v28, "sizeThatFits:", width, v46);
    double v30 = v29;

    *(void *)&v57.origin.CGFloat x = recta[0];
    CGFloat v45 = y;
    v57.origin.CGFloat y = y;
    v57.size.double width = width;
    v57.size.CGFloat height = v46;
    double v44 = (double)v26;
    double v21 = (CGRectGetWidth(v57) - (double)v26 * v30) / (double)(v26 + 1);
    double v31 = v30 + v21 + -12.0;
    memset(&recta[1], 0, 32);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v32 = self->_footerButtons;
    uint64_t v33 = [(NSArray *)v32 countByEnumeratingWithState:&recta[1] objects:v52 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)recta[3];
      double v24 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)recta[3] != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = objc_msgSend(*(id *)(recta[2] + 8 * i), "view", *(void *)&v44);
          objc_msgSend(v37, "sizeThatFits:", v31, 0.0);
          double v39 = v38;

          if (v24 < v39) {
            double v24 = v39;
          }
        }
        uint64_t v34 = [(NSArray *)v32 countByEnumeratingWithState:&recta[1] objects:v52 count:16];
      }
      while (v34);
    }
    else
    {
      double v24 = 0.0;
    }

    double v25 = (double)(v26 - 1) * 12.0 + v44 * v31;
    *(void *)&v58.origin.CGFloat x = recta[0];
    v58.origin.CGFloat y = v45;
    v58.size.double width = width;
    v58.size.CGFloat height = v46;
    double v40 = CGRectGetHeight(v58);
    [(CCUICustomContentModuleBackgroundViewController *)self expandedContentModuleHeight];
    double v42 = (v40 - v41) * 0.5;
    [(CCUICustomContentModuleBackgroundViewController *)self expandedContentModuleHeight];
    double v22 = v43 + v42;
  }
  v59.origin.CGFloat y = v47;
  v59.origin.CGFloat x = v48;
  v59.size.double width = v16;
  v59.size.CGFloat height = v18;
  v61.origin.CGFloat x = v21;
  v61.origin.CGFloat y = v22;
  v61.size.double width = v25;
  v61.size.CGFloat height = v24;
  return CGRectUnion(v59, v61);
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  id v5 = [(CCUICustomContentModuleBackgroundViewController *)self requiredVisualStyleCategories];
  id v6 = [NSNumber numberWithInteger:a3];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    categoriesToVisualStylingProviders = self->_categoriesToVisualStylingProviders;
    double v9 = [NSNumber numberWithInteger:a3];
    double v10 = [(NSMutableDictionary *)categoriesToVisualStylingProviders objectForKey:v9];
    double v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      v13 = [(CCUICustomContentModuleBackgroundViewController *)self view];
      id v12 = [v13 visualStylingProviderForCategory:a3];
    }
  }
  else
  {
    id v12 = 0;
  }
  return v12;
}

- (id)requiredVisualStyleCategories
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", &unk_1F301EED0, 0);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_footerButtons;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        double v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) requiredVisualStyleCategories];
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  double v10 = [v3 allObjects];

  return v10;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v17 = a3;
  uint64_t v6 = [(CCUICustomContentModuleBackgroundViewController *)self requiredVisualStyleCategories];
  uint64_t v7 = [NSNumber numberWithInteger:a4];
  int v8 = [v6 containsObject:v7];

  if (v8)
  {
    categoriesToVisualStylingProviders = self->_categoriesToVisualStylingProviders;
    double v10 = [NSNumber numberWithInteger:a4];
    id v11 = [(NSMutableDictionary *)categoriesToVisualStylingProviders objectForKey:v10];

    if (v11 == v17)
    {
LABEL_10:

      goto LABEL_11;
    }
    long long v12 = self->_categoriesToVisualStylingProviders;
    if (v17)
    {
      if (!v12)
      {
        long long v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v14 = self->_categoriesToVisualStylingProviders;
        self->_categoriesToVisualStylingProviders = v13;

        long long v12 = self->_categoriesToVisualStylingProviders;
      }
      long long v15 = [NSNumber numberWithInteger:a4];
      [(NSMutableDictionary *)v12 setObject:v17 forKey:v15];
    }
    else
    {
      double v16 = [NSNumber numberWithInteger:a4];
      [(NSMutableDictionary *)v12 removeObjectForKey:v16];

      if ([(NSMutableDictionary *)self->_categoriesToVisualStylingProviders count]) {
        goto LABEL_9;
      }
      long long v15 = self->_categoriesToVisualStylingProviders;
      self->_categoriesToVisualStylingProviders = 0;
    }

LABEL_9:
    [(CCUICustomContentModuleBackgroundViewController *)self _visualStylingProvider:v17 didChangeForCategory:a4 outgoingVisualStylingProvider:v11];
    goto LABEL_10;
  }
LABEL_11:
}

- (void)_updateHeaderLayoutIfNecessary
{
  objc_super v3 = [(CCUICustomContentModuleBackgroundViewController *)self view];
  [v3 bounds];
  -[CCUICustomContentModuleBackgroundViewController _headerCenterForBounds:](self, "_headerCenterForBounds:");

  if (!CGFloatIsValid() || !CGFloatIsValid()) {
    return;
  }
  id v4 = [(CCUICustomContentModuleBackgroundViewController *)self traitCollection];
  [v4 displayScale];

  id v39 = [(UIImageView *)self->_headerImageView image];
  [v39 size];
  if (([v39 isSymbolImage] & 1) == 0)
  {
    v41.origin.CGFloat x = CCUIReferenceScreenBounds();
    double Width = CGRectGetWidth(v41);
    uint64_t v6 = (void *)0x1E4FB1000;
    if (Width >= 1024.0
      && ([MEMORY[0x1E4FB16C8] currentDevice],
          v36 = objc_claimAutoreleasedReturnValue(),
          [v36 userInterfaceIdiom] == 1)
      && SBFEffectiveHomeButtonType() != 2)
    {
      int v38 = 0;
      BOOL v9 = 0;
      BOOL v10 = 0;
      BOOL v8 = 0;
    }
    else
    {
      v42.origin.CGFloat x = CCUIReferenceScreenBounds();
      CGFloat v7 = CGRectGetWidth(v42);
      BOOL v8 = v7 >= 1024.0;
      if (v7 >= 1024.0
        && ([MEMORY[0x1E4FB16C8] currentDevice],
            uint64_t v34 = objc_claimAutoreleasedReturnValue(),
            [v34 userInterfaceIdiom] == 1)
        && SBFEffectiveHomeButtonType() == 2)
      {
        int v38 = 0;
        BOOL v9 = 0;
        BOOL v10 = 0;
        BOOL v8 = 1;
      }
      else
      {
        v43.origin.CGFloat x = CCUIReferenceScreenBounds();
        CGFloat v11 = CGRectGetWidth(v43);
        BOOL v10 = v11 >= 834.0;
        if (v11 >= 834.0
          && ([MEMORY[0x1E4FB16C8] currentDevice],
              long long v32 = objc_claimAutoreleasedReturnValue(),
              [v32 userInterfaceIdiom] == 1)
          && SBFEffectiveHomeButtonType() == 2)
        {
          int v38 = 0;
          BOOL v9 = 0;
          BOOL v10 = 1;
        }
        else
        {
          v44.origin.CGFloat x = CCUIReferenceScreenBounds();
          CGFloat v12 = CGRectGetWidth(v44);
          BOOL v9 = v12 >= 834.0;
          if (v12 >= 834.0
            && ([MEMORY[0x1E4FB16C8] currentDevice],
                double v30 = objc_claimAutoreleasedReturnValue(),
                [v30 userInterfaceIdiom] == 1)
            && SBFEffectiveHomeButtonType() != 2)
          {
            int v38 = 0;
            BOOL v9 = 1;
          }
          else
          {
            v37 = [MEMORY[0x1E4FB16C8] currentDevice];
            if ([v37 userInterfaceIdiom] != 1)
            {
              v45.origin.CGFloat x = CCUIReferenceScreenBounds();
              if (CGRectGetWidth(v45) < 430.0)
              {
                v46.origin.CGFloat x = CCUIReferenceScreenBounds();
                if (CGRectGetWidth(v46) < 428.0)
                {
                  v47.origin.CGFloat x = CCUIReferenceScreenBounds();
                  if (CGRectGetWidth(v47) < 414.0 || SBFEffectiveHomeButtonType() != 2)
                  {
                    v48.origin.CGFloat x = CCUIReferenceScreenBounds();
                    if (CGRectGetWidth(v48) < 414.0)
                    {
                      v49.origin.CGFloat x = CCUIReferenceScreenBounds();
                      if (CGRectGetWidth(v49) < 393.0)
                      {
                        v50.origin.CGFloat x = CCUIReferenceScreenBounds();
                        if (CGRectGetWidth(v50) < 390.0)
                        {
                          v51.origin.CGFloat x = CCUIReferenceScreenBounds();
                          if (CGRectGetWidth(v51) < 375.0 || SBFEffectiveHomeButtonType() != 2)
                          {
                            v52.origin.CGFloat x = CCUIReferenceScreenBounds();
                            CGRectGetWidth(v52);
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
            int v38 = 1;
          }
        }
      }
    }
    v53.origin.CGFloat x = CCUIReferenceScreenBounds();
    double v13 = CGRectGetWidth(v53);
    if (v13 >= 1024.0)
    {
      uint64_t v35 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v35 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() != 2)
      {
        BOOL v16 = v10;
        BOOL v17 = v8;
        int v18 = 0;
        BOOL v19 = 0;
        BOOL v20 = 0;
        BOOL v15 = 0;
        goto LABEL_66;
      }
    }
    v54.origin.CGFloat x = CCUIReferenceScreenBounds();
    CGFloat v14 = CGRectGetWidth(v54);
    BOOL v15 = v14 >= 1024.0;
    if (v14 >= 1024.0)
    {
      uint64_t v33 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v33 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        BOOL v16 = v10;
        BOOL v17 = v8;
        int v18 = 0;
        BOOL v19 = 0;
        BOOL v20 = 0;
        BOOL v15 = 1;
        goto LABEL_66;
      }
    }
    v55.origin.CGFloat x = CCUIReferenceScreenBounds();
    CGFloat v21 = CGRectGetWidth(v55);
    BOOL v20 = v21 >= 834.0;
    if (v21 >= 834.0)
    {
      double v31 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v31 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        BOOL v16 = v10;
        BOOL v17 = v8;
        int v18 = 0;
        BOOL v19 = 0;
        BOOL v20 = 1;
        goto LABEL_66;
      }
    }
    v56.origin.CGFloat x = CCUIReferenceScreenBounds();
    CGFloat v22 = CGRectGetWidth(v56);
    BOOL v19 = v22 >= 834.0;
    if (v22 >= 834.0)
    {
      double v29 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v29 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() != 2)
      {
        BOOL v16 = v10;
        BOOL v17 = v8;
        int v18 = 0;
        BOOL v19 = 1;
        goto LABEL_66;
      }
    }
    uint64_t v6 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v6 userInterfaceIdiom] == 1)
    {
      BOOL v16 = v10;
      BOOL v17 = v8;
LABEL_61:
      int v18 = 1;
      goto LABEL_66;
    }
    v57.origin.CGFloat x = CCUIReferenceScreenBounds();
    if (CGRectGetWidth(v57) >= 430.0) {
      goto LABEL_59;
    }
    v58.origin.CGFloat x = CCUIReferenceScreenBounds();
    if (CGRectGetWidth(v58) >= 428.0) {
      goto LABEL_59;
    }
    v59.origin.CGFloat x = CCUIReferenceScreenBounds();
    if (CGRectGetWidth(v59) >= 414.0 && SBFEffectiveHomeButtonType() == 2
      || (v60.origin.CGFloat x = CCUIReferenceScreenBounds(), CGRectGetWidth(v60) >= 414.0))
    {
      BOOL v16 = v10;
      BOOL v17 = v8;
LABEL_65:
      int v18 = 1;
LABEL_66:
      UISizeRoundToScale();
      if (v18)
      {

        if (!v19) {
          goto LABEL_68;
        }
      }
      else if (!v19)
      {
LABEL_68:
        if (v20) {
          goto LABEL_69;
        }
        goto LABEL_73;
      }

      if (v20)
      {
LABEL_69:

        if (!v15)
        {
LABEL_75:
          if (v13 >= 1024.0) {

          }
          if (v38)
          {

            if (!v9) {
              goto LABEL_79;
            }
          }
          else if (!v9)
          {
LABEL_79:
            if (v16) {
              goto LABEL_80;
            }
            goto LABEL_84;
          }

          if (v16)
          {
LABEL_80:

            if (!v17)
            {
LABEL_86:
              if (Width >= 1024.0) {

              }
              goto LABEL_88;
            }
LABEL_85:

            goto LABEL_86;
          }
LABEL_84:
          if (!v17) {
            goto LABEL_86;
          }
          goto LABEL_85;
        }
LABEL_74:

        goto LABEL_75;
      }
LABEL_73:
      if (!v15) {
        goto LABEL_75;
      }
      goto LABEL_74;
    }
    v61.origin.CGFloat x = CCUIReferenceScreenBounds();
    if (CGRectGetWidth(v61) >= 393.0)
    {
LABEL_59:
      BOOL v16 = v10;
    }
    else
    {
      BOOL v16 = v10;
      v62.origin.CGFloat x = CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v62) < 390.0)
      {
        BOOL v17 = v8;
        v63.origin.CGFloat x = CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v63) < 375.0 || SBFEffectiveHomeButtonType() != 2)
        {
          v64.origin.CGFloat x = CCUIReferenceScreenBounds();
          CGRectGetWidth(v64);
        }
        goto LABEL_65;
      }
    }
    BOOL v17 = v8;
    goto LABEL_61;
  }
LABEL_88:
  headerImageView = self->_headerImageView;
  BSRectWithSize();
  UIRectCenteredAboutPointScale();
  -[UIImageView setFrame:](headerImageView, "setFrame:");
  packageView = self->_packageView;
  [(CCUICAPackageView *)packageView bounds];
  UIRectCenteredAboutPointScale();
  -[CCUICAPackageView setFrame:](packageView, "setFrame:");
  double v25 = self->_headerImageView;
  if (v25)
  {
    [(UIImageView *)v25 frame];
    double Height = CGRectGetHeight(v65);
  }
  else
  {
    double Height = 0.0;
  }
  long long v27 = self->_packageView;
  if (v27)
  {
    [(CCUICAPackageView *)v27 frame];
    double Height = CGRectGetHeight(v66);
  }
  if (Height > 0.0)
  {
    [(UILabel *)self->_headerTitleLabel frame];
    CGRectGetHeight(v67);
  }
  headerTitleLabel = self->_headerTitleLabel;
  [(UILabel *)headerTitleLabel bounds];
  UIRectCenteredAboutPointScale();
  -[UILabel setFrame:](headerTitleLabel, "setFrame:");
}

- (void)_updateCustomHeaderViewLayoutIfNecessary
{
  if (self->_customHeaderView)
  {
    objc_super v3 = [(CCUICustomContentModuleBackgroundViewController *)self view];
    [v3 bounds];
    -[CCUICustomContentModuleBackgroundViewController _headerCenterForBounds:](self, "_headerCenterForBounds:");

    if (CGFloatIsValid())
    {
      if (CGFloatIsValid())
      {
        customHeaderView = self->_customHeaderView;
        [(UIView *)customHeaderView bounds];
        UIRectCenteredAboutPointScale();
        -[UIView setFrame:](customHeaderView, "setFrame:");
      }
    }
  }
}

- (CGPoint)_headerCenterForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectIsEmpty(a3))
  {
    BOOL v10 = [(CCUICustomContentModuleBackgroundViewController *)self view];
    if (CCUILayoutShouldBePortrait(v10))
    {
    }
    else
    {
      CGFloat v11 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v12 = [v11 userInterfaceIdiom];

      if ((v12 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      {
        if ([(CCUICustomContentModuleBackgroundViewController *)self positionHeaderToRightInLandscapeRight])
        {
          BOOL v15 = [(id)*MEMORY[0x1E4FB2608] activeInterfaceOrientation] == 4;
        }
        else
        {
          BOOL v15 = 0;
        }
        BOOL v16 = [(CCUICustomContentModuleBackgroundViewController *)self view];
        v24.origin.CGFloat x = x;
        v24.origin.CGFloat y = y;
        v24.size.CGFloat width = width;
        v24.size.CGFloat height = height;
        double MidY = CGRectGetMidY(v24);
        v25.origin.CGFloat x = x;
        v25.origin.CGFloat y = y;
        v25.size.CGFloat width = width;
        v25.size.CGFloat height = height;
        objc_msgSend(v16, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 10, 1, 0.0, MidY, CGRectGetWidth(v25), 1.0);
        CGRectGetMinX(v26);

        v27.origin.CGFloat x = x;
        v27.origin.CGFloat y = y;
        v27.size.CGFloat width = width;
        v27.size.CGFloat height = height;
        CGRectGetWidth(v27);
        [(CCUICustomContentModuleBackgroundViewController *)self expandedContentModuleWidth];
        if (v15)
        {
          v28.origin.CGFloat x = x;
          v28.origin.CGFloat y = y;
          v28.size.CGFloat width = width;
          v28.size.CGFloat height = height;
          CGRectGetWidth(v28);
        }
        v29.origin.CGFloat x = x;
        v29.origin.CGFloat y = y;
        v29.size.CGFloat width = width;
        v29.size.CGFloat height = height;
        CGRectGetMidY(v29);
        goto LABEL_13;
      }
    }
    double v13 = [(CCUICustomContentModuleBackgroundViewController *)self view];
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    double MidX = CGRectGetMidX(v19);
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    objc_msgSend(v13, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 5, 1, MidX, 0.0, 1.0, CGRectGetHeight(v20));
    CGRectGetMinY(v21);

    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    CGRectGetHeight(v22);
    [(CCUICustomContentModuleBackgroundViewController *)self expandedContentModuleHeight];
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    CGRectGetMidX(v23);
LABEL_13:
    UIPointRoundToViewScale();
    goto LABEL_14;
  }
  double v8 = *MEMORY[0x1E4F1DAD8];
  double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
LABEL_14:
  result.CGFloat y = v9;
  result.CGFloat x = v8;
  return result;
}

- (void)_updateHeaderGlyphVisualStylingWithProvider:(id)a3
{
  id v6 = a3;
  id v4 = [(UIImageView *)self->_headerImageView image];
  uint64_t v5 = [v4 renderingMode];

  if (v5 == 2) {
    [v6 automaticallyUpdateView:self->_headerImageView withStyle:0];
  }
  else {
    [(UIImageView *)self->_headerImageView mt_removeAllVisualStyling];
  }
}

- (void)_updateTitleFont
{
  headerTitleLabel = self->_headerTitleLabel;
  id v4 = [(CCUICustomContentModuleBackgroundViewController *)self _titleFont];
  [(UILabel *)headerTitleLabel setFont:v4];

  [(UILabel *)self->_headerTitleLabel sizeToFit];
  id v5 = [(CCUICustomContentModuleBackgroundViewController *)self viewIfLoaded];
  [v5 setNeedsLayout];
}

- (id)_titleFont
{
  if ([(CCUICustomContentModuleBackgroundViewController *)self _shouldLimitContentSizeCategory])
  {
    id v3 = (id)*MEMORY[0x1E4FB2790];
  }
  else
  {
    id v4 = [(CCUICustomContentModuleBackgroundViewController *)self traitCollection];
    id v3 = [v4 preferredContentSizeCategory];
  }
  headerImageView = self->_headerImageView;
  BOOL v6 = headerImageView == 0;
  if (headerImageView) {
    CGFloat v7 = (void *)MEMORY[0x1E4FB2908];
  }
  else {
    CGFloat v7 = (void *)MEMORY[0x1E4FB2988];
  }
  if (v6) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 8;
  }
  double v9 = objc_msgSend(MEMORY[0x1E4FB08E0], "bsui_preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", *v7, v8, v3);

  return v9;
}

- (BOOL)_shouldLimitContentSizeCategory
{
  v2 = [(CCUICustomContentModuleBackgroundViewController *)self traitCollection];
  id v3 = [v2 preferredContentSizeCategory];

  BOOL v4 = (unint64_t)([(id)*MEMORY[0x1E4FB2608] activeInterfaceOrientation] - 3) <= 1
    && UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E4FB2790]) == NSOrderedDescending;

  return v4;
}

- (void)_updateFooterButtonsLayoutIfNecessary
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_footerButtons count])
  {
    id v3 = [(CCUICustomContentModuleBackgroundViewController *)self view];
    [v3 bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    double v9 = v8;
    double v11 = v10;

    unint64_t v12 = [(NSArray *)self->_footerButtons count];
    double v13 = [(NSArray *)self->_footerButtons firstObject];
    CGFloat v14 = [v13 button];
    objc_msgSend(v14, "sizeThatFits:", v9, v11);
    double v16 = v15;

    BOOL v17 = [(CCUICustomContentModuleBackgroundViewController *)self view];
    if (CCUILayoutShouldBePortrait(v17))
    {
    }
    else
    {
      int v18 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v19 = [v18 userInterfaceIdiom];

      if ((v19 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      {
        int v38 = [(CCUICustomContentModuleBackgroundViewController *)self view];
        v96.origin.CGFloat x = v5;
        v96.origin.CGFloat y = v7;
        v96.size.CGFloat width = v9;
        v96.size.CGFloat height = v11;
        double MidY = CGRectGetMidY(v96);
        v97.origin.CGFloat x = v5;
        v97.origin.CGFloat y = v7;
        v97.size.CGFloat width = v9;
        v97.size.CGFloat height = v11;
        double v40 = 0.0;
        objc_msgSend(v38, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 10, 1, 0.0, MidY, CGRectGetWidth(v97), 1.0);
        double MaxX = CGRectGetMaxX(v98);

        v99.origin.CGFloat x = v5;
        v99.origin.CGFloat y = v7;
        v99.size.CGFloat width = v9;
        v99.size.CGFloat height = v11;
        double v42 = CGRectGetMaxX(v99) + -16.0;
        if (MaxX >= v42) {
          double MaxX = v42;
        }
        if (CGFloatIsValid())
        {
          v100.origin.CGFloat x = v5;
          v100.origin.CGFloat y = v7;
          v100.size.CGFloat width = v9;
          v100.size.CGFloat height = v11;
          double v40 = CGRectGetMaxX(v100) - MaxX;
        }
        v101.origin.CGFloat x = v5;
        v101.origin.CGFloat y = v7;
        v101.size.CGFloat width = v9;
        v101.size.CGFloat height = v11;
        double Width = CGRectGetWidth(v101);
        [(CCUICustomContentModuleBackgroundViewController *)self expandedContentModuleWidth];
        double v45 = (Width - v44) * 0.5 - v40 + -16.0;
        if (!-[CCUICustomContentModuleBackgroundViewController positionHeaderToRightInLandscapeRight](self, "positionHeaderToRightInLandscapeRight")|| [(id)*MEMORY[0x1E4FB2608] activeInterfaceOrientation] != 4)
        {
          v102.origin.CGFloat x = v5;
          v102.origin.CGFloat y = v7;
          v102.size.CGFloat width = v9;
          v102.size.CGFloat height = v11;
          CGRectGetWidth(v102);
        }
        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        CGRect v46 = self->_footerButtons;
        uint64_t v47 = [(NSArray *)v46 countByEnumeratingWithState:&v77 objects:v90 count:16];
        double v48 = 0.0;
        if (v47)
        {
          uint64_t v49 = v47;
          uint64_t v50 = *(void *)v78;
          do
          {
            for (uint64_t i = 0; i != v49; ++i)
            {
              if (*(void *)v78 != v50) {
                objc_enumerationMutation(v46);
              }
              CGRect v52 = *(void **)(*((void *)&v77 + 1) + 8 * i);
              CGRect v53 = [v52 view];
              objc_msgSend(v53, "sizeThatFits:", v45, 0.0);
              double v55 = v54;

              CGRect v56 = [v52 view];
              UIRectIntegralWithScale();
              objc_msgSend(v56, "setBounds:");

              double v48 = v48 + v55;
            }
            uint64_t v49 = [(NSArray *)v46 countByEnumeratingWithState:&v77 objects:v90 count:16];
          }
          while (v49);
        }

        [(CCUICustomContentModuleBackgroundViewController *)self expandedContentModuleHeight];
        v103.origin.CGFloat x = v5;
        v103.origin.CGFloat y = v7;
        v103.size.CGFloat width = v9;
        v103.size.CGFloat height = v11;
        CGRectGetHeight(v103);
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        double v30 = self->_footerButtons;
        uint64_t v57 = [(NSArray *)v30 countByEnumeratingWithState:&v73 objects:v89 count:16];
        if (v57)
        {
          uint64_t v58 = v57;
          uint64_t v59 = *(void *)v74;
          do
          {
            for (uint64_t j = 0; j != v58; ++j)
            {
              if (*(void *)v74 != v59) {
                objc_enumerationMutation(v30);
              }
              CGRect v61 = *(void **)(*((void *)&v73 + 1) + 8 * j);
              CGRect v62 = [v61 view];
              [v62 bounds];
              CGFloat v64 = v63;
              CGFloat v66 = v65;
              CGFloat v68 = v67;
              CGFloat v70 = v69;

              v71 = [v61 view];
              v104.origin.CGFloat x = v64;
              v104.origin.CGFloat y = v66;
              v104.size.CGFloat width = v68;
              v104.size.CGFloat height = v70;
              CGRectGetHeight(v104);
              UIPointIntegral();
              objc_msgSend(v71, "setCenter:");

              v72 = [v61 view];
              [v72 frame];
              CGRectGetMaxY(v105);
            }
            uint64_t v58 = [(NSArray *)v30 countByEnumeratingWithState:&v73 objects:v89 count:16];
          }
          while (v58);
        }
        goto LABEL_43;
      }
    }
    v94.origin.CGFloat x = v5;
    v94.origin.CGFloat y = v7;
    v94.size.CGFloat width = v9;
    v94.size.CGFloat height = v11;
    CGRectGetHeight(v94);
    [(CCUICustomContentModuleBackgroundViewController *)self expandedContentModuleHeight];
    v95.origin.CGFloat x = v5;
    v95.origin.CGFloat y = v7;
    v95.size.CGFloat width = v9;
    v95.size.CGFloat height = v11;
    double v20 = v16 + (CGRectGetWidth(v95) - (double)v12 * v16) / (double)(v12 + 1);
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    CGRect v21 = self->_footerButtons;
    uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v85 objects:v92 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v86;
      double v25 = 0.0;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v86 != v24) {
            objc_enumerationMutation(v21);
          }
          CGRect v27 = [*(id *)(*((void *)&v85 + 1) + 8 * k) view];
          objc_msgSend(v27, "sizeThatFits:", v20 + -12.0, 0.0);
          double v29 = v28;

          if (v25 < v29) {
            double v25 = v29;
          }
        }
        uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v85 objects:v92 count:16];
      }
      while (v23);
    }

    [(CCUICustomContentModuleBackgroundViewController *)self expandedContentModuleHeight];
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    double v30 = self->_footerButtons;
    uint64_t v31 = [(NSArray *)v30 countByEnumeratingWithState:&v81 objects:v91 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = 0;
      uint64_t v34 = *(void *)v82;
      do
      {
        uint64_t v35 = 0;
        do
        {
          if (*(void *)v82 != v34) {
            objc_enumerationMutation(v30);
          }
          v36 = *(void **)(*((void *)&v81 + 1) + 8 * v35++);
          v37 = [v36 view];
          UIRectCenteredAboutPoint();
          UIRectIntegralWithScale();
          objc_msgSend(v37, "setFrame:");
        }
        while (v32 != v35);
        uint64_t v32 = [(NSArray *)v30 countByEnumeratingWithState:&v81 objects:v91 count:16];
        v33 += v35;
      }
      while (v32);
    }
LABEL_43:
  }
}

- (void)_updateCustomFooterViewLayoutIfNecessary
{
  if (self->_customFooterView)
  {
    id v3 = [(CCUICustomContentModuleBackgroundViewController *)self view];
    [v3 bounds];
    -[CCUICustomContentModuleBackgroundViewController _footerCenterForBounds:](self, "_footerCenterForBounds:");
    double v5 = v4;
    double v7 = v6;

    if (CGFloatIsValid())
    {
      if (CGFloatIsValid())
      {
        customFooterView = self->_customFooterView;
        -[UIView setCenter:](customFooterView, "setCenter:", v5, v7);
      }
    }
  }
}

- (CGPoint)_footerCenterForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = [(CCUICustomContentModuleBackgroundViewController *)self view];
  if (CCUILayoutShouldBePortrait(v8))
  {

LABEL_4:
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    double v11 = CGRectGetHeight(v28);
    [(CCUICustomContentModuleBackgroundViewController *)self expandedContentModuleHeight];
    double v13 = (v11 - v12) * 0.5;
    [(CCUICustomContentModuleBackgroundViewController *)self expandedContentModuleHeight];
    double v15 = v14 + v13 + v13 * 0.5;
    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    double v16 = CGRectGetWidth(v29) * 0.5;
    goto LABEL_14;
  }
  double v9 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    goto LABEL_4;
  }
  BOOL v17 = [(CCUICustomContentModuleBackgroundViewController *)self view];
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v30);
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  double v19 = 0.0;
  objc_msgSend(v17, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 10, 1, 0.0, MidY, CGRectGetWidth(v31), 1.0);
  double MaxX = CGRectGetMaxX(v32);

  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  double v21 = CGRectGetMaxX(v33) + -16.0;
  if (MaxX >= v21) {
    double MaxX = v21;
  }
  if (CGFloatIsValid())
  {
    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = y;
    v34.size.CGFloat width = width;
    v34.size.CGFloat height = height;
    double v19 = CGRectGetMaxX(v34) - MaxX;
  }
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  double v22 = CGRectGetWidth(v35);
  [(CCUICustomContentModuleBackgroundViewController *)self expandedContentModuleWidth];
  double v24 = (v22 - v23) * 0.5 - v19 + -16.0;
  if (-[CCUICustomContentModuleBackgroundViewController positionHeaderToRightInLandscapeRight](self, "positionHeaderToRightInLandscapeRight")&& [(id)*MEMORY[0x1E4FB2608] activeInterfaceOrientation] == 4)
  {
    double v16 = v19 + v24 * 0.5;
  }
  else
  {
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    double v16 = CGRectGetWidth(v36) + v24 * -0.5 - v19;
  }
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  double v15 = CGRectGetHeight(v37) * 0.5;
LABEL_14:
  double v25 = v16;
  double v26 = v15;
  result.CGFloat y = v26;
  result.CGFloat x = v25;
  return result;
}

- (void)_visualStylingProvider:(id)a3 didChangeForCategory:(int64_t)a4 outgoingVisualStylingProvider:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v8 = a5;
  id v9 = v8;
  if (a4 == 1)
  {
    [v8 stopAutomaticallyUpdatingView:self->_headerImageView];
    [(CCUICustomContentModuleBackgroundViewController *)self _updateHeaderGlyphVisualStylingWithProvider:v20];
  }
  double v19 = v9;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = self->_footerButtons;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        double v16 = objc_msgSend(v15, "requiredVisualStyleCategories", v19);
        BOOL v17 = [NSNumber numberWithInteger:a4];
        int v18 = [v16 containsObject:v17];

        if (v18) {
          [v15 setVisualStylingProvider:v20 forCategory:a4];
        }
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }
}

- (double)expandedContentModuleHeight
{
  return self->_expandedContentModuleHeight;
}

- (void)setExpandedContentModuleHeight:(double)a3
{
  self->_expandedContentModuledouble Height = a3;
}

- (double)expandedContentModuleWidth
{
  return self->_expandedContentModuleWidth;
}

- (void)setExpandedContentModuleWidth:(double)a3
{
  self->_expandedContentModuledouble Width = a3;
}

- (BOOL)positionHeaderToRightInLandscapeRight
{
  return self->_positionHeaderToRightInLandscapeRight;
}

- (void)setPositionHeaderToRightInLandscapeRight:(BOOL)a3
{
  self->_positionHeaderToRightInLandscapeRight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customFooterView, 0);
  objc_storeStrong((id *)&self->_customHeaderView, 0);
  objc_storeStrong((id *)&self->_footerButtons, 0);
  objc_storeStrong((id *)&self->_categoriesToVisualStylingProviders, 0);
  objc_storeStrong((id *)&self->_packageView, 0);
  objc_storeStrong((id *)&self->_headerImageView, 0);
  objc_storeStrong((id *)&self->_headerTitleLabel, 0);
}

@end