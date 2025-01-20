@interface CNFRegAddAliasTableCell
- (void)layoutSubviews;
@end

@implementation CNFRegAddAliasTableCell

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)CNFRegAddAliasTableCell;
  [(PSTableCell *)&v21 layoutSubviews];
  v3 = [(CNFRegAddAliasTableCell *)self textLabel];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = 39.0;
  if ([(id)*MEMORY[0x263F83300] userInterfaceLayoutDirection])
  {
    [(CNFRegAddAliasTableCell *)self bounds];
    double v12 = v11;
    v13 = [(CNFRegAddAliasTableCell *)self textLabel];
    [v13 frame];
    double v10 = v12 - v14 + -39.0;
  }
  v15 = [(CNFRegAddAliasTableCell *)self contentView];
  [v15 size];
  double v17 = v16;

  if (v7 + 39.0 + 4.0 > v17)
  {
    v18 = [(CNFRegAddAliasTableCell *)self contentView];
    [v18 size];
    double v7 = v19 + -39.0 + -4.0;
  }
  v20 = [(CNFRegAddAliasTableCell *)self textLabel];
  objc_msgSend(v20, "setFrame:", v10, v5, v7, v9);
}

@end