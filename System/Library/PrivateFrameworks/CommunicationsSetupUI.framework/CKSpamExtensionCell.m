@interface CKSpamExtensionCell
- (BOOL)usesStandardBackgroundImage;
- (CKSpamExtensionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setChecked:(BOOL)a3;
@end

@implementation CKSpamExtensionCell

- (CKSpamExtensionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)CKSpamExtensionCell;
  v5 = [(PSTableCell *)&v11 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(CKSpamExtensionCell *)v5 detailTextLabel];
    [v7 setTextAlignment:2];

    v8 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
    v9 = [(CKSpamExtensionCell *)v6 detailTextLabel];
    [v9 setTextColor:v8];
  }
  return v6;
}

- (void)setChecked:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 0;
  }
  [(CKSpamExtensionCell *)self setAccessoryType:v4];
  if ([(CKSpamExtensionCell *)self isEnabled]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  [(CKSpamExtensionCell *)self setTintAdjustmentMode:v5];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKSpamExtensionCell;
  [(PSTableCell *)&v4 refreshCellContentsWithSpecifier:a3];
  [(CKSpamExtensionCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v38[1] = *MEMORY[0x263EF8340];
  v36.receiver = self;
  v36.super_class = (Class)CKSpamExtensionCell;
  [(PSTableCell *)&v36 layoutSubviews];
  v3 = [(CKSpamExtensionCell *)self contentView];
  objc_super v4 = [(PSTableCell *)self titleLabel];
  uint64_t v5 = [(CKSpamExtensionCell *)self detailTextLabel];
  v6 = [v5 text];
  uint64_t v7 = [v6 length];

  v8 = (id *)MEMORY[0x263F83300];
  if (v7)
  {
    [v5 frame];
    double v10 = v9;
    double v12 = v11;
    uint64_t v37 = *MEMORY[0x263F814F0];
    v13 = [v5 font];
    v38[0] = v13;
    v14 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];

    v15 = [v5 text];
    if ([v15 length])
    {
      v16 = [v5 text];
      [v3 frame];
      objc_msgSend(v16, "boundingRectWithSize:options:attributes:context:", 0, v14, 0, v17, v18);
      double v20 = v19;
    }
    else
    {
      double v20 = 0.0;
    }

    uint64_t v22 = [*v8 userInterfaceLayoutDirection];
    double v23 = 10.0;
    if (!v22)
    {
      objc_msgSend(v3, "bounds", 10.0);
      double v23 = v24 + -10.0 - v20;
    }
    objc_msgSend(v5, "setFrame:", v23, v10, v20, v12);
    double v21 = v20 + 6.0;
  }
  else
  {
    double v21 = 0.0;
  }
  [v4 frame];
  double v26 = v25;
  double v28 = v27;
  [v3 bounds];
  double v30 = v29 + -10.0 + -16.0 - v21 + -55.0;
  if ([*v8 userInterfaceLayoutDirection])
  {
    [v3 bounds];
    double v32 = v31 - v30 + -55.0;
  }
  else
  {
    double v32 = 55.0;
  }
  objc_msgSend(v4, "setFrame:", v32, v26, v30, v28);
  v33 = +[CNFRegAppearanceController globalAppearanceController];
  if ([v33 styleUsesCustomTableStyle]
    && ([v33 tableCellTextLabelColor],
        v34 = objc_claimAutoreleasedReturnValue(),
        v34,
        v34))
  {
    v35 = [v33 tableCellTextLabelColor];
    [v4 setTextColor:v35];
  }
  else
  {
    [v4 setTextColor:0];
  }
}

- (BOOL)usesStandardBackgroundImage
{
  return 1;
}

@end