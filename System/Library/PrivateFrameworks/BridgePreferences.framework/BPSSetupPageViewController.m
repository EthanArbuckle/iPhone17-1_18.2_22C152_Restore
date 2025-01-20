@interface BPSSetupPageViewController
- (BOOL)contentViewIsInAdjustedScrollView;
- (BOOL)wantsFollowUpNotification;
- (BPSBuddyControllerDelegate)delegate;
- (BPSSetupPageViewController)init;
- (CGRect)computedTitleFrame;
- (UILabel)titleLabel;
- (UIView)contentView;
- (double)verticalTitleInset;
- (id)_baseIdentifier;
- (id)followUpActions;
- (id)followUpIdentifier;
- (id)localizedInformativeText;
- (id)localizedTitle;
- (id)titleAttributedString;
- (id)titleString;
- (void)addFollowUpForPageAndDevice:(id)a3 withCompletion:(id)a4;
- (void)addFollowUpForPageWithCompletion:(id)a3;
- (void)removeFollowupForPageWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateTitleLabel;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation BPSSetupPageViewController

- (BPSSetupPageViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)BPSSetupPageViewController;
  return [(BPSSetupPageViewController *)&v3 init];
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)BPSSetupPageViewController;
  [(BPSSetupPageViewController *)&v11 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x263F1C768]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  titleLabel = self->_titleLabel;
  self->_titleLabel = v4;

  v6 = self->_titleLabel;
  v7 = BPSRegularFontWithSize(24.0);
  [(UILabel *)v6 setFont:v7];

  v8 = self->_titleLabel;
  v9 = BPSTextColor();
  [(UILabel *)v8 setTextColor:v9];

  [(UILabel *)self->_titleLabel setTextAlignment:1];
  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  v10 = [(BPSSetupPageViewController *)self view];
  [v10 addSubview:self->_titleLabel];

  [(BPSSetupPageViewController *)self updateTitleLabel];
}

- (void)updateTitleLabel
{
  id v3 = [(BPSSetupPageViewController *)self titleString];

  if (v3)
  {
    titleLabel = self->_titleLabel;
    v5 = [(BPSSetupPageViewController *)self titleString];
    [(UILabel *)titleLabel setText:v5];
  }
  else
  {
    v6 = [(BPSSetupPageViewController *)self titleAttributedString];

    if (!v6) {
      goto LABEL_6;
    }
    v7 = self->_titleLabel;
    v5 = [(BPSSetupPageViewController *)self titleAttributedString];
    [(UILabel *)v7 setAttributedText:v5];
  }

LABEL_6:
  id v8 = [(BPSSetupPageViewController *)self view];
  [v8 setNeedsLayout];
}

- (CGRect)computedTitleFrame
{
  if ([(BPSSetupPageViewController *)self isViewLoaded])
  {
    [(UILabel *)self->_titleLabel frame];
  }
  else
  {
    double v3 = *MEMORY[0x263F001A8];
    double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)viewDidLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)BPSSetupPageViewController;
  [(BPSSetupPageViewController *)&v15 viewDidLayoutSubviews];
  double v3 = [(BPSSetupPageViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v6 = [MEMORY[0x263F1C920] mainScreen];
  [v6 scale];

  LODWORD(v6) = [(BPSSetupPageViewController *)self contentViewIsInAdjustedScrollView];
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v5 + -28.0, 1.79769313e308);
  titleLabel = self->_titleLabel;
  UIRectIntegralWithScale();
  -[UILabel setFrame:](titleLabel, "setFrame:");
  id v8 = self->_titleLabel;
  [(BPSSetupPageViewController *)self verticalTitleInset];
  v12[0] = xmmword_21C53C880;
  v12[1] = xmmword_21C53C910;
  int64x2_t v13 = vdupq_n_s64(0x4058000000000000uLL);
  int64x2_t v14 = v13;
  double v10 = v9 + BPSScreenValueGetRelevantValue((uint64_t)v12);
  double v11 = 64.0;
  if (!v6) {
    double v11 = 0.0;
  }
  [(UILabel *)v8 _setFirstLineBaselineFrameOriginY:v10 - v11];
}

- (double)verticalTitleInset
{
  return 0.0;
}

- (BOOL)contentViewIsInAdjustedScrollView
{
  return 0;
}

- (UIView)contentView
{
  contentView = self->_contentView;
  if (!contentView)
  {
    double v4 = [(BPSSetupPageViewController *)self view];
    id v5 = objc_alloc(MEMORY[0x263F1CB60]);
    [v4 bounds];
    double v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
    v7 = self->_contentView;
    self->_contentView = v6;

    [(UIView *)self->_contentView addSubview:self->_titleLabel];
    [v4 addSubview:self->_contentView];

    contentView = self->_contentView;
  }
  return contentView;
}

- (id)titleString
{
  return 0;
}

- (id)titleAttributedString
{
  return 0;
}

- (id)followUpIdentifier
{
  return 0;
}

- (id)localizedTitle
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = bps_setup_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[BPSSetupPageViewController localizedTitle]";
    _os_log_impl(&dword_21C513000, v2, OS_LOG_TYPE_DEFAULT, "%s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (id)followUpActions
{
  return 0;
}

- (id)localizedInformativeText
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = bps_setup_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[BPSSetupPageViewController localizedInformativeText]";
    _os_log_impl(&dword_21C513000, v2, OS_LOG_TYPE_DEFAULT, "%s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (BOOL)wantsFollowUpNotification
{
  return 0;
}

- (id)_baseIdentifier
{
  double v3 = +[BPSFollowUpController baseDomainIdentifier];
  int v4 = [(BPSSetupPageViewController *)self followUpIdentifier];
  if (v4)
  {
    id v5 = [NSString stringWithFormat:@"%@.%@", v3, v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)addFollowUpForPageAndDevice:(id)a3 withCompletion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BPSSetupPageViewController *)self _baseIdentifier];
  if (v8)
  {
    double v9 = [v6 valueForProperty:*MEMORY[0x263F57678]];
    double v10 = [NSString stringWithFormat:@"%@.%@", v8, v9];
    double v11 = bps_setup_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v10;
      _os_log_impl(&dword_21C513000, v11, OS_LOG_TYPE_DEFAULT, "Add FollowUp for identifier %{public}@...", buf, 0xCu);
    }

    v12 = bps_setup_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v6;
      _os_log_impl(&dword_21C513000, v12, OS_LOG_TYPE_DEFAULT, "...for device: %{public}@", buf, 0xCu);
    }

    v20[0] = @"title";
    int64x2_t v13 = [(BPSSetupPageViewController *)self localizedTitle];
    v21[0] = v13;
    v20[1] = @"description";
    int64x2_t v14 = [(BPSSetupPageViewController *)self localizedInformativeText];
    v21[1] = v14;
    v20[2] = @"followUpActions";
    objc_super v15 = [(BPSSetupPageViewController *)self followUpActions];
    v21[2] = v15;
    v16 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
    v17 = +[BPSFollowUpAttributes attributeWithOptions:v16];

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __73__BPSSetupPageViewController_addFollowUpForPageAndDevice_withCompletion___block_invoke;
    v18[3] = &unk_2644089C8;
    id v19 = v7;
    +[BPSFollowUpController addFollowUpForIdentifier:v10 withAttributes:v17 withCompletion:v18];
  }
  else
  {
    double v9 = bps_setup_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C513000, v9, OS_LOG_TYPE_DEFAULT, "Error!! Issuing a FollowUp requires dictating an identifier!", buf, 2u);
    }
  }
}

uint64_t __73__BPSSetupPageViewController_addFollowUpForPageAndDevice_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)addFollowUpForPageWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(BPSSetupPageViewController *)self _baseIdentifier];
  id v6 = bps_setup_log();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v5;
      _os_log_impl(&dword_21C513000, v7, OS_LOG_TYPE_DEFAULT, "Add Global FollowUp for %{public}@", buf, 0xCu);
    }

    v14[0] = @"title";
    id v8 = [(BPSSetupPageViewController *)self localizedTitle];
    v15[0] = v8;
    v14[1] = @"description";
    double v9 = [(BPSSetupPageViewController *)self localizedInformativeText];
    v15[1] = v9;
    v14[2] = @"followUpActions";
    double v10 = [(BPSSetupPageViewController *)self followUpActions];
    v15[2] = v10;
    double v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
    id v7 = +[BPSFollowUpAttributes attributeWithOptions:v11];

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    _OWORD v12[2] = __63__BPSSetupPageViewController_addFollowUpForPageWithCompletion___block_invoke;
    v12[3] = &unk_2644089C8;
    id v13 = v4;
    +[BPSFollowUpController addFollowUpForIdentifier:v5 withAttributes:v7 withCompletion:v12];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C513000, v7, OS_LOG_TYPE_DEFAULT, "Error!! Issuing a FollowUp requires dictating an identifier!", buf, 2u);
  }
}

uint64_t __63__BPSSetupPageViewController_addFollowUpForPageWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeFollowupForPageWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(BPSSetupPageViewController *)self followUpIdentifier];
  id v6 = bps_setup_log();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      double v11 = v5;
      _os_log_impl(&dword_21C513000, v7, OS_LOG_TYPE_DEFAULT, "Remove identifier %{public}@", buf, 0xCu);
    }

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __66__BPSSetupPageViewController_removeFollowupForPageWithCompletion___block_invoke;
    v8[3] = &unk_2644089C8;
    double v9 = v4;
    +[BPSFollowUpController removeFollowUpForIdentifier:v5 withCompletion:v8];
    id v7 = v9;
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C513000, v7, OS_LOG_TYPE_DEFAULT, "Error!! Removing a FollowUp requires dictating an identifier!", buf, 2u);
  }
}

uint64_t __66__BPSSetupPageViewController_removeFollowupForPageWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (BPSBuddyControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BPSBuddyControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end