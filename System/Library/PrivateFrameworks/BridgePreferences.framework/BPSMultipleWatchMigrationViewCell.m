@interface BPSMultipleWatchMigrationViewCell
- (BPSCheckMarkView)checkmarkView;
- (BPSMultipleWatchMigrationViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (BPSRemoveMigrationWatchView)watchView;
- (UILabel)deviceDetailLabel;
- (void)layoutSubviews;
- (void)setCheckmarkView:(id)a3;
- (void)setDeviceDetailLabel:(id)a3;
- (void)setWatchView:(id)a3;
@end

@implementation BPSMultipleWatchMigrationViewCell

- (BPSMultipleWatchMigrationViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v28.receiver = self;
  v28.super_class = (Class)BPSMultipleWatchMigrationViewCell;
  v4 = [(BPSMultipleWatchMigrationViewCell *)&v28 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = objc_alloc_init(BPSCheckMarkView);
    checkmarkView = v4->_checkmarkView;
    v4->_checkmarkView = v5;

    [(BPSCheckMarkView *)v4->_checkmarkView setIsChecked:0];
    v7 = [(BPSMultipleWatchMigrationViewCell *)v4 contentView];
    [v7 addSubview:v4->_checkmarkView];

    v8 = [BPSRemoveMigrationWatchView alloc];
    double v9 = *MEMORY[0x263F001A8];
    double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v12 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v13 = -[BPSRemoveMigrationWatchView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x263F001A8], v10, v11, v12);
    watchView = v4->_watchView;
    v4->_watchView = (BPSRemoveMigrationWatchView *)v13;

    v15 = [(BPSMultipleWatchMigrationViewCell *)v4 contentView];
    [v15 addSubview:v4->_watchView];

    v16 = [MEMORY[0x263F5FBC0] appearance];
    v17 = [v16 textColor];

    v18 = [(BPSMultipleWatchMigrationViewCell *)v4 textLabel];
    [v18 setTextColor:v17];

    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v9, v10, v11, v12);
    deviceDetailLabel = v4->_deviceDetailLabel;
    v4->_deviceDetailLabel = (UILabel *)v19;

    v21 = v4->_deviceDetailLabel;
    v22 = [MEMORY[0x263F1C658] systemFontOfSize:13.0];
    [(UILabel *)v21 setFont:v22];

    [(UILabel *)v4->_deviceDetailLabel setTextColor:v17];
    v23 = [(BPSMultipleWatchMigrationViewCell *)v4 contentView];
    [v23 addSubview:v4->_deviceDetailLabel];

    v24 = [MEMORY[0x263F5FBC0] appearance];
    v25 = [v24 cellHighlightColor];

    if (v25)
    {
      id v26 = objc_alloc_init(MEMORY[0x263F1CB60]);
      [v26 setBackgroundColor:v25];
      [(BPSMultipleWatchMigrationViewCell *)v4 setSelectedBackgroundView:v26];
    }
  }
  return v4;
}

- (void)layoutSubviews
{
  v42.receiver = self;
  v42.super_class = (Class)BPSMultipleWatchMigrationViewCell;
  [(BPSMultipleWatchMigrationViewCell *)&v42 layoutSubviews];
  [(BPSMultipleWatchMigrationViewCell *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = *(double *)(MEMORY[0x263F001B0] + 8);
  double v36 = *MEMORY[0x263F001B0];
  -[BPSRemoveMigrationWatchView sizeThatFits:](self->_watchView, "sizeThatFits:");
  CGFloat v41 = v12;
  double v14 = v13;
  v43.origin.x = v4;
  CGFloat v38 = v6;
  CGFloat v39 = v4;
  v43.origin.y = v6;
  v43.size.width = v8;
  v43.size.height = v10;
  float v15 = (CGRectGetHeight(v43) - v14) * 0.5;
  CGFloat v40 = floorf(v15);
  -[BPSRemoveMigrationWatchView setFrame:](self->_watchView, "setFrame:");
  -[BPSCheckMarkView sizeThatFits:](self->_checkmarkView, "sizeThatFits:", v36, v11);
  double v17 = v16;
  double v19 = v18;
  v44.origin.x = v4;
  v44.origin.y = v6;
  v44.size.width = v8;
  v44.size.height = v10;
  float v20 = (CGRectGetHeight(v44) - v19) * 0.5;
  -[BPSCheckMarkView setFrame:](self->_checkmarkView, "setFrame:", 20.0, floorf(v20), v17, v19);
  v21 = [(BPSMultipleWatchMigrationViewCell *)self textLabel];
  objc_msgSend(v21, "sizeThatFits:", v36, v11);
  double v23 = v22;
  double v25 = v24;

  id v26 = [(BPSMultipleWatchMigrationViewCell *)self deviceDetailLabel];
  objc_msgSend(v26, "sizeThatFits:", v36, v11);
  double v37 = v27;
  double v29 = v28;

  v45.origin.x = 65.0;
  v45.origin.y = v40;
  v45.size.height = v14;
  v45.size.width = v41;
  CGFloat v30 = CGRectGetMaxX(v45) + 16.0;
  v46.origin.y = v38;
  v46.origin.x = v39;
  v46.size.width = v8;
  v46.size.height = v10;
  float v31 = (CGRectGetHeight(v46) - (v25 + v29 + 4.0)) * 0.5;
  CGFloat v32 = floorf(v31);
  v47.origin.x = v30;
  v47.origin.y = v32;
  v47.size.width = v23;
  v47.size.height = v25;
  CGFloat v33 = CGRectGetMaxY(v47) + 4.0;
  v34 = [(BPSMultipleWatchMigrationViewCell *)self textLabel];
  objc_msgSend(v34, "setFrame:", v30, v32, v23, v25);

  v35 = [(BPSMultipleWatchMigrationViewCell *)self deviceDetailLabel];
  objc_msgSend(v35, "setFrame:", v30, v33, v37, v29);
}

- (BPSRemoveMigrationWatchView)watchView
{
  return self->_watchView;
}

- (void)setWatchView:(id)a3
{
}

- (BPSCheckMarkView)checkmarkView
{
  return self->_checkmarkView;
}

- (void)setCheckmarkView:(id)a3
{
}

- (UILabel)deviceDetailLabel
{
  return self->_deviceDetailLabel;
}

- (void)setDeviceDetailLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceDetailLabel, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_watchView, 0);
}

@end