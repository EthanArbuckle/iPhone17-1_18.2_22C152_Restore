@interface CNFRegSettingsAccountCell
- (BOOL)canReload;
- (CNFRegSettingsAccountCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation CNFRegSettingsAccountCell

- (CNFRegSettingsAccountCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)CNFRegSettingsAccountCell;
  v5 = [(PSTableCell *)&v13 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    [(CNFRegSettingsAccountCell *)v5 setSelectionStyle:1];
    [(CNFRegSettingsAccountCell *)v6 setUserInteractionEnabled:1];
    v7 = [(PSTableCell *)v6 valueLabel];
    [v7 setAdjustsFontSizeToFitWidth:1];
    [v7 setMinimumScaleFactor:0.823529412];
    v8 = [MEMORY[0x263F825C8] systemBlueColor];
    v9 = [(PSTableCell *)v6 titleLabel];
    [v9 setTextColor:v8];

    v10 = [MEMORY[0x263F825C8] systemBlueColor];
    v11 = [(PSTableCell *)v6 valueLabel];
    [v11 setTextColor:v10];
  }
  return v6;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNFRegSettingsAccountCell;
  [(PSTableCell *)&v4 refreshCellContentsWithSpecifier:a3];
  [(CNFRegSettingsAccountCell *)self setAccessoryType:0];
}

- (void)setValue:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNFRegSettingsAccountCell;
  [(PSTableCell *)&v4 setValue:a3];
  [(CNFRegSettingsAccountCell *)self setNeedsLayout];
}

- (BOOL)canReload
{
  return 1;
}

- (void)layoutSubviews
{
  v32[2] = *MEMORY[0x263EF8340];
  v30.receiver = self;
  v30.super_class = (Class)CNFRegSettingsAccountCell;
  [(PSTableCell *)&v30 layoutSubviews];
  v3 = [(PSTableCell *)self valueLabel];
  objc_super v4 = [v3 text];
  v5 = v4;
  if (v4) {
    BOOL v6 = [v4 length] != 0;
  }
  else {
    BOOL v6 = 0;
  }
  v7 = [v3 font];
  v8 = [(PSTableCell *)self titleLabel];
  [v8 bounds];
  double v10 = v9;
  v11 = [(CNFRegSettingsAccountCell *)self contentView];
  [v11 bounds];
  double v13 = v12;
  double v15 = v14;

  double v16 = *MEMORY[0x263F001B0];
  if (v6)
  {
    v17 = [MEMORY[0x263F81658] defaultParagraphStyle];
    v18 = (void *)[v17 mutableCopy];

    [v18 setLineBreakMode:4];
    uint64_t v19 = *MEMORY[0x263F81540];
    v31[0] = *MEMORY[0x263F814F0];
    v31[1] = v19;
    v32[0] = v7;
    v32[1] = v18;
    v20 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
    id v21 = objc_alloc_init(MEMORY[0x263F81668]);
    [v7 pointSize];
    [v21 setMinimumScaleFactor:14.0 / v22];
    v23 = [v3 text];
    if ([v23 length])
    {
      v24 = [v3 text];
      objc_msgSend(v24, "boundingRectWithSize:options:attributes:context:", 1, v20, v21, v13 + -32.0 + -4.0 - v10, v15);
      double v16 = v25;
    }
    double v27 = *MEMORY[0x263F001A8];
    double v26 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v28 = ceil(v16);
    if ([(id)*MEMORY[0x263F83300] userInterfaceLayoutDirection]) {
      double v29 = v13 - v28 - v10 + -4.0 + -16.0;
    }
    else {
      double v29 = 16.0;
    }
  }
  else
  {
    double v27 = *MEMORY[0x263F001A8];
    double v26 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v28 = ceil(v16);
    double v29 = floor((v13 - v10) * 0.5);
  }
  objc_msgSend(v8, "setFrame:", v29, v26, v10, v15);
  if (v6)
  {
    v33.origin.x = v29;
    v33.origin.y = v26;
    v33.size.width = v10;
    v33.size.height = v15;
    double v27 = CGRectGetMaxX(v33) + 4.0;
  }
  objc_msgSend(v3, "setFrame:", v27, v26, v28, v15);
}

@end