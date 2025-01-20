@interface CSDiscoveryItemPlatterSleepMigration
- (CSDiscoveryItemPlatterSleepMigration)init;
- (void)_configureGraphicViewIfNecessary;
- (void)_layoutGraphicView;
- (void)layoutSubviews;
- (void)visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5;
@end

@implementation CSDiscoveryItemPlatterSleepMigration

- (CSDiscoveryItemPlatterSleepMigration)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSDiscoveryItemPlatterSleepMigration;
  v2 = [(PLPlatterDiscoveryView *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v4 = [v3 localizedStringForKey:@"DISCOVERY_LIST_ITEM_PLATTER_SLEEP_MIGRATION_TITLE" value:&stru_1F3020248 table:@"CoverSheet"];
    [(PLPlatterDiscoveryView *)v2 setTitleText:v4];

    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"DISCOVERY_LIST_ITEM_PLATTER_SLEEP_MIGRATION_BODY" value:&stru_1F3020248 table:@"CoverSheet"];
    [(PLPlatterDiscoveryView *)v2 setBodyText:v6];
  }
  return v2;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CSDiscoveryItemPlatterSleepMigration;
  [(PLPlatterDiscoveryView *)&v3 layoutSubviews];
  [(CSDiscoveryItemPlatterSleepMigration *)self _configureGraphicViewIfNecessary];
  [(CSDiscoveryItemPlatterSleepMigration *)self bounds];
  if (CGRectGetWidth(v4) > 0.0) {
    [(CSDiscoveryItemPlatterSleepMigration *)self _layoutGraphicView];
  }
}

- (void)_configureGraphicViewIfNecessary
{
  objc_super v3 = [(PLPlatterDiscoveryView *)self graphicView];

  if (!v3)
  {
    id v22 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    CGRect v4 = [MEMORY[0x1E4F42A98] configurationWithPointSize:2 weight:70.0];
    v5 = [MEMORY[0x1E4F42A80] systemImageNamed:@"apps.iphone" withConfiguration:v4];
    v6 = (UIImageView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v5];
    deviceImageView = self->_deviceImageView;
    self->_deviceImageView = v6;

    [(UIImageView *)self->_deviceImageView setContentMode:11];
    [v22 addSubview:self->_deviceImageView];
    objc_super v8 = self->_deviceImageView;
    v9 = [(PLPlatterDiscoveryView *)self strokeVisualStylingProvider];
    [(PLPlatterDiscoveryView *)self updateVisualStylingOfView:v8 style:1 visualStylingProvider:v9 outgoingProvider:0];

    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    sleepSymbolBackgroundView = self->_sleepSymbolBackgroundView;
    self->_sleepSymbolBackgroundView = v10;

    v12 = self->_sleepSymbolBackgroundView;
    v13 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(UIView *)v12 setBackgroundColor:v13];

    [v22 addSubview:self->_sleepSymbolBackgroundView];
    v14 = [MEMORY[0x1E4F4F8B8] defaultFontProvider];
    v15 = [v14 preferredFontForTextStyle:*MEMORY[0x1E4F43888] hiFontStyle:4];

    v16 = [MEMORY[0x1E4F42A98] configurationWithFont:v15];
    v17 = [MEMORY[0x1E4F42A80] systemImageNamed:@"bed.double.fill" withConfiguration:v16];
    v18 = (UIView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v17];
    sleepSymbolImageView = self->_sleepSymbolImageView;
    self->_sleepSymbolImageView = v18;

    v20 = self->_sleepSymbolImageView;
    v21 = [MEMORY[0x1E4F428B8] systemMintColor];
    [(UIView *)v20 setTintColor:v21];

    [v22 addSubview:self->_sleepSymbolImageView];
    [(PLPlatterDiscoveryView *)self setGraphicView:v22];
  }
}

- (void)_layoutGraphicView
{
  int v3 = [(CSDiscoveryItemPlatterSleepMigration *)self _shouldReverseLayoutDirection];
  CGRect v4 = [(CSDiscoveryItemPlatterSleepMigration *)self traitCollection];
  [v4 displayScale];
  uint64_t v6 = v5;

  v7 = [(PLPlatterDiscoveryView *)self graphicView];
  [v7 bounds];

  UIRectCenteredIntegralRectScale();
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [(UIImageView *)self->_deviceImageView setFrame:v6];
  v31.origin.x = v9;
  v31.origin.y = v11;
  v31.size.width = v13;
  v31.size.height = v15;
  double MinX = CGRectGetMinX(v31);
  double v17 = -0.0;
  if (v3) {
    double v17 = v13;
  }
  double v18 = MinX + v17 + 15.0;
  v32.origin.x = v9;
  v32.origin.y = v11;
  v32.size.width = v13;
  v32.size.height = v15;
  -[UIView setCenter:](self->_sleepSymbolImageView, "setCenter:", v18, CGRectGetMaxY(v32) + -15.0);
  [(UIView *)self->_sleepSymbolImageView frame];
  uint64_t v29 = v6;
  UIRectCenteredIntegralRectScale();
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  [(UIView *)self->_sleepSymbolBackgroundView setFrame:v29];
  sleepSymbolBackgroundView = self->_sleepSymbolBackgroundView;
  v33.origin.x = v20;
  v33.origin.y = v22;
  v33.size.width = v24;
  v33.size.height = v26;
  double v28 = CGRectGetWidth(v33) * 0.5;

  [(UIView *)sleepSymbolBackgroundView _setCornerRadius:v28];
}

- (void)visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)CSDiscoveryItemPlatterSleepMigration;
  [(PLPlatterDiscoveryView *)&v8 visualStylingProviderDidChange:a3 forCategory:a4 outgoingProvider:a5];
  deviceImageView = self->_deviceImageView;
  v7 = [(PLPlatterDiscoveryView *)self strokeVisualStylingProvider];
  [(PLPlatterDiscoveryView *)self updateVisualStylingOfView:deviceImageView style:1 visualStylingProvider:v7 outgoingProvider:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceImageView, 0);
  objc_storeStrong((id *)&self->_sleepSymbolImageView, 0);

  objc_storeStrong((id *)&self->_sleepSymbolBackgroundView, 0);
}

@end