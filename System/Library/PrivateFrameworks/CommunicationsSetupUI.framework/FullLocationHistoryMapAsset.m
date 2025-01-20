@interface FullLocationHistoryMapAsset
- (FullLocationHistoryMapAsset)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UIView)assetView;
- (void)setAssetView:(id)a3;
- (void)setUpConstraints;
@end

@implementation FullLocationHistoryMapAsset

- (FullLocationHistoryMapAsset)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)FullLocationHistoryMapAsset;
  v5 = [(PSTableCell *)&v12 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263F827E8];
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = [v6 imageNamed:@"fullLocationHistoryMap" inBundle:v7 withConfiguration:0];

    uint64_t v9 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v8];
    assetView = v5->_assetView;
    v5->_assetView = (UIView *)v9;

    [(FullLocationHistoryMapAsset *)v5 setUpConstraints];
  }
  return v5;
}

- (void)setUpConstraints
{
  v29[4] = *MEMORY[0x263EF8340];
  v3 = [(FullLocationHistoryMapAsset *)self assetView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v4 = [(FullLocationHistoryMapAsset *)self assetView];
  [v4 setContentMode:2];

  v5 = [(FullLocationHistoryMapAsset *)self contentView];
  v6 = [(FullLocationHistoryMapAsset *)self assetView];
  [v5 addSubview:v6];

  v19 = (void *)MEMORY[0x263F08938];
  v28 = [(FullLocationHistoryMapAsset *)self assetView];
  v26 = [v28 centerYAnchor];
  v27 = [(FullLocationHistoryMapAsset *)self contentView];
  v25 = [v27 centerYAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v29[0] = v24;
  v23 = [(FullLocationHistoryMapAsset *)self assetView];
  v21 = [v23 centerXAnchor];
  v22 = [(FullLocationHistoryMapAsset *)self contentView];
  v20 = [v22 centerXAnchor];
  v18 = [v21 constraintEqualToAnchor:v20];
  v29[1] = v18;
  v17 = [(FullLocationHistoryMapAsset *)self assetView];
  v7 = [v17 widthAnchor];
  v8 = [(FullLocationHistoryMapAsset *)self contentView];
  uint64_t v9 = [v8 widthAnchor];
  v10 = [v7 constraintEqualToAnchor:v9];
  v29[2] = v10;
  v11 = [(FullLocationHistoryMapAsset *)self contentView];
  objc_super v12 = [v11 heightAnchor];
  v13 = [(FullLocationHistoryMapAsset *)self assetView];
  v14 = [v13 heightAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  v29[3] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:4];
  [v19 activateConstraints:v16];
}

- (UIView)assetView
{
  return self->_assetView;
}

- (void)setAssetView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end