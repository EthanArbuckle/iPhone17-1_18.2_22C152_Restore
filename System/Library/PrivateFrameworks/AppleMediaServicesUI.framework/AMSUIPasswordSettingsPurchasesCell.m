@interface AMSUIPasswordSettingsPurchasesCell
- (AMSUIPasswordSettingsPurchasesCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation AMSUIPasswordSettingsPurchasesCell

- (AMSUIPasswordSettingsPurchasesCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AMSUIPasswordSettingsPurchasesCell;
  v4 = [(AMSUIPasswordSettingsPurchasesCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F82E00]);
    [(AMSUIPasswordSettingsPurchasesCell *)v4 bounds];
    v6 = objc_msgSend(v5, "initWithFrame:");
    v7 = [MEMORY[0x263F825C8] clearColor];
    [v6 setBackgroundColor:v7];

    [(AMSUIPasswordSettingsPurchasesCell *)v4 setSelectedBackgroundView:v6];
  }
  return v4;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  if (a3) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 0;
  }
  -[AMSUIPasswordSettingsPurchasesCell setAccessoryType:](self, "setAccessoryType:", v4, a4);
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)AMSUIPasswordSettingsPurchasesCell;
  [(AMSUIPasswordSettingsPurchasesCell *)&v12 layoutSubviews];
  [(AMSUIPasswordSettingsPurchasesCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(AMSUIPasswordSettingsPurchasesCell *)self selectedBackgroundView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

@end