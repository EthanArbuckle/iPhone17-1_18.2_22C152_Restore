@interface FCUIOnboardingPlatterDiscoveryView
+ (id)_bodyStringForDNDModeSemanticType:(int64_t)a3;
+ (id)onboardingPlatterDiscoveryViewForMode:(id)a3;
- (FCUIOnboardingPlatterDiscoveryView)initWithMode:(id)a3;
- (FCUIOnboardingPlatterDiscoveryViewDelegate)delegate;
- (id)presentQuickStartForModeIdentifier:(id)a3;
- (void)_configureGraphicViewIfNecessary;
- (void)_layoutGraphicView;
- (void)layoutSubviews;
- (void)requestDismissal:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation FCUIOnboardingPlatterDiscoveryView

+ (id)onboardingPlatterDiscoveryViewForMode:(id)a3
{
  id v3 = a3;
  v4 = [[FCUIOnboardingPlatterDiscoveryView alloc] initWithMode:v3];

  return v4;
}

- (FCUIOnboardingPlatterDiscoveryView)initWithMode:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FCUIOnboardingPlatterDiscoveryView;
  v5 = [(PLPlatterDiscoveryView *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 semanticType];
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"DISCOVERY_ONBOARDING_PLATTER_TITLE" value:&stru_26D1B4698 table:0];
    [(PLPlatterDiscoveryView *)v5 setTitleText:v8];

    v9 = +[FCUIOnboardingPlatterDiscoveryView _bodyStringForDNDModeSemanticType:v6];
    [(PLPlatterDiscoveryView *)v5 setBodyText:v9];

    v10 = (void *)MEMORY[0x263F823D0];
    v11 = [v4 modeIdentifier];
    v12 = [(FCUIOnboardingPlatterDiscoveryView *)v5 presentQuickStartForModeIdentifier:v11];
    v13 = [v10 actionWithTitle:@"Customize" image:0 identifier:@"present-quickstart-sheet" handler:v12];
    [(PLPlatterDiscoveryView *)v5 setDefaultAction:v13];
  }
  return v5;
}

+ (id)_bodyStringForDNDModeSemanticType:(int64_t)a3
{
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"NOTIFICATION_LIST_MISSED_SECTION_HEADER_DO_NOT_DISTURB" value:&stru_26D1B4698 table:0];

  switch(a3)
  {
    case 0:
      uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v7 = v6;
      v8 = @"DISCOVERY_ONBOARDING_PLATTER_BODY_DO_NOT_DISTURB_ALLOW";
      goto LABEL_12;
    case 1:
      uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v7 = v6;
      v8 = @"DISCOVERY_ONBOARDING_PLATTER_BODY_SLEEP_ALLOW";
      goto LABEL_12;
    case 2:
      uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v7 = v6;
      v8 = @"DISCOVERY_ONBOARDING_PLATTER_BODY_DRIVING_ALLOW";
      goto LABEL_12;
    case 3:
      uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v7 = v6;
      v8 = @"DISCOVERY_ONBOARDING_PLATTER_BODY_FITNESS_ALLOW";
      goto LABEL_12;
    case 4:
      uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v7 = v6;
      v8 = @"DISCOVERY_ONBOARDING_PLATTER_BODY_WORK_ALLOW";
      goto LABEL_12;
    case 5:
      uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v7 = v6;
      v8 = @"DISCOVERY_ONBOARDING_PLATTER_BODY_PERSONAL_SILENCE";
      goto LABEL_12;
    case 6:
      uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v7 = v6;
      v8 = @"DISCOVERY_ONBOARDING_PLATTER_BODY_READING_ALLOW";
      goto LABEL_12;
    case 7:
      uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v7 = v6;
      v8 = @"DISCOVERY_ONBOARDING_PLATTER_BODY_GAMING_ALLOW";
      goto LABEL_12;
    case 8:
      uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v7 = v6;
      v8 = @"DISCOVERY_ONBOARDING_PLATTER_BODY_MINDFULNESS_ALLOW";
      goto LABEL_12;
    case 9:
      uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v7 = v6;
      v8 = @"DISCOVERY_ONBOARDING_PLATTER_BODY_REDUCE_INTERRUPTIONS_ALLOW";
LABEL_12:
      uint64_t v9 = [v6 localizedStringForKey:v8 value:&stru_26D1B4698 table:0];

      v5 = (void *)v9;
      break;
    default:
      break;
  }
  return v5;
}

- (id)presentQuickStartForModeIdentifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__FCUIOnboardingPlatterDiscoveryView_presentQuickStartForModeIdentifier___block_invoke;
  v8[3] = &unk_264542D40;
  objc_copyWeak(&v11, &location);
  id v9 = v4;
  v10 = self;
  id v5 = v4;
  uint64_t v6 = _Block_copy(v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v6;
}

void __73__FCUIOnboardingPlatterDiscoveryView_presentQuickStartForModeIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [[_TtC7FocusUI24QuickStartViewController alloc] initWithModeIdentifier:*(void *)(a1 + 32)];
  [(QuickStartViewController *)v2 setDelegate:WeakRetained];
  id v3 = [*(id *)(a1 + 40) delegate];
  [v3 onboardingPlatter:*(void *)(a1 + 40) requestsModalPresentationOfViewController:v2 animated:1 completion:0];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)FCUIOnboardingPlatterDiscoveryView;
  [(PLPlatterDiscoveryView *)&v3 layoutSubviews];
  [(FCUIOnboardingPlatterDiscoveryView *)self _configureGraphicViewIfNecessary];
  [(FCUIOnboardingPlatterDiscoveryView *)self bounds];
  if (CGRectGetWidth(v4) > 0.0) {
    [(FCUIOnboardingPlatterDiscoveryView *)self _layoutGraphicView];
  }
}

- (void)_configureGraphicViewIfNecessary
{
  objc_super v3 = [(PLPlatterDiscoveryView *)self graphicView];

  if (!v3)
  {
    id v12 = objc_alloc_init(MEMORY[0x263F82E00]);
    CGRect v4 = [FCUIOnboardingStackedNotificationView alloc];
    id v5 = [MEMORY[0x263F825C8] systemGray3Color];
    uint64_t v6 = [(FCUIOnboardingStackedNotificationView *)v4 initWithBackgroundColor:v5 assetImageName:0];
    notificationPlatterView2 = self->_notificationPlatterView2;
    self->_notificationPlatterView2 = v6;

    [v12 addSubview:self->_notificationPlatterView2];
    v8 = [FCUIOnboardingStackedNotificationView alloc];
    id v9 = [MEMORY[0x263F825C8] systemGray2Color];
    v10 = [(FCUIOnboardingStackedNotificationView *)v8 initWithBackgroundColor:v9 assetImageName:@"person.circle.fill"];
    notificationPlatterView1 = self->_notificationPlatterView1;
    self->_notificationPlatterView1 = v10;

    [v12 addSubview:self->_notificationPlatterView1];
    [(PLPlatterDiscoveryView *)self setGraphicView:v12];
  }
}

- (void)_layoutGraphicView
{
  objc_super v3 = [(FCUIOnboardingPlatterDiscoveryView *)self traitCollection];
  [v3 displayScale];
  uint64_t v5 = v4;
  uint64_t v30 = v4;

  uint64_t v6 = [(PLPlatterDiscoveryView *)self graphicView];
  [v6 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v36.origin.x = v8;
  v36.origin.y = v10;
  v36.size.width = v12;
  v36.size.height = v14;
  double Width = CGRectGetWidth(v36);
  v37.origin.x = v8;
  v37.origin.y = v10;
  v37.size.width = v12;
  v37.size.height = v14;
  double v16 = (CGRectGetHeight(v37) + -44.0 + 4.0) / 1.5;
  if ((Width + -20.0) * 0.3 >= v16) {
    double v17 = v16;
  }
  else {
    double v17 = (Width + -20.0) * 0.3;
  }
  uint64_t v29 = v5;
  UIRectCenteredIntegralRectScale();
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  notificationPlatterView2 = self->_notificationPlatterView2;
  long long v27 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v35.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v35.c = v27;
  *(_OWORD *)&v35.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  -[FCUIOnboardingStackedNotificationView setTransform:](notificationPlatterView2, "setTransform:", &v35, v29);
  -[FCUIOnboardingStackedNotificationView setFrame:](self->_notificationPlatterView2, "setFrame:", v19, v21, v23, v25);
  memset(&v35, 0, sizeof(v35));
  CGAffineTransformMakeScale(&v35, 0.85, 0.85);
  memset(&v34, 0, sizeof(v34));
  CGAffineTransformMakeTranslation(&v34, 0.0, v17 * 0.5);
  v28 = self->_notificationPlatterView2;
  CGAffineTransform t1 = v35;
  CGAffineTransform t2 = v34;
  CGAffineTransformConcat(&v33, &t1, &t2);
  [(FCUIOnboardingStackedNotificationView *)v28 setTransform:&v33];
  UIRectCenteredIntegralRectScale();
  [(FCUIOnboardingStackedNotificationView *)self->_notificationPlatterView1 setFrame:v30];
}

- (void)requestDismissal:(id)a3
{
  id v4 = [(FCUIOnboardingPlatterDiscoveryView *)self delegate];
  [v4 onboardingPlatterRequestsDismissal:self];
}

- (FCUIOnboardingPlatterDiscoveryViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FCUIOnboardingPlatterDiscoveryViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notificationPlatterView2, 0);
  objc_storeStrong((id *)&self->_notificationPlatterView1, 0);
}

@end