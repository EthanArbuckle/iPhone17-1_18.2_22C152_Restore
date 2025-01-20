@interface AXUIBannerPresenter
- (AXUIBannerPresenter)initWithContainingView:(id)a3;
- (AXUIBannerView)bannerView;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)presentBannerViewWithText:(id)a3 duration:(double)a4;
- (void)presentBannerViewWithText:(id)a3 secondaryText:(id)a4 duration:(double)a5 fromUserAction:(BOOL)a6;
- (void)setBannerView:(id)a3;
@end

@implementation AXUIBannerPresenter

- (AXUIBannerPresenter)initWithContainingView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AXUIBannerPresenter;
  v3 = [(AXUIFloatingViewPresenter *)&v6 initWithContainingView:a3 alignedToEdge:1 withinSafeArea:0];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v3;
}

- (void)presentBannerViewWithText:(id)a3 duration:(double)a4
{
}

- (void)presentBannerViewWithText:(id)a3 secondaryText:(id)a4 duration:(double)a5 fromUserAction:(BOOL)a6
{
  id v19 = a3;
  id v9 = a4;
  v10 = (objc_class *)objc_opt_class();
  uint64_t v11 = [(AXUIBannerPresenter *)self bannerView];
  if (!v11
    || (v12 = (void *)v11,
        [(AXUIBannerPresenter *)self bannerView],
        v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = [v13 isMemberOfClass:v10],
        v13,
        v12,
        (v14 & 1) == 0))
  {
    id v15 = objc_alloc_init(v10);
    [(AXUIBannerPresenter *)self setBannerView:v15];
  }
  v16 = [(AXUIBannerPresenter *)self bannerView];
  [v16 setText:v19];

  v17 = [(AXUIBannerPresenter *)self bannerView];
  [v17 setSecondaryText:v9];

  v18 = [(AXUIBannerPresenter *)self bannerView];
  [(AXUIFloatingViewPresenter *)self presentFloatingView:v18 withDuration:a5];
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
}

- (AXUIBannerView)bannerView
{
  return self->_bannerView;
}

- (void)setBannerView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end