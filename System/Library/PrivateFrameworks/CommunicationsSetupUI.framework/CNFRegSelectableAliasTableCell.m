@interface CNFRegSelectableAliasTableCell
- (BOOL)usesStandardBackgroundImage;
- (CNFRegSelectableAliasTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)setChecked:(BOOL)a3;
@end

@implementation CNFRegSelectableAliasTableCell

- (CNFRegSelectableAliasTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)CNFRegSelectableAliasTableCell;
  v5 = [(PSTableCell *)&v11 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    v6 = +[CNFRegAppearanceController globalAppearanceController];
    id v7 = objc_alloc(MEMORY[0x263F82828]);
    v8 = [v6 tableCellCheckmarkImage];
    v9 = (void *)[v7 initWithImage:v8];

    [(CNFRegSelectableAliasTableCell *)v5 setAccessoryView:v9];
  }
  return v5;
}

- (BOOL)usesStandardBackgroundImage
{
  return 1;
}

- (void)setChecked:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CNFRegSelectableAliasTableCell;
  [(PSTableCell *)&v13 setChecked:a3];
  v4 = +[CNFRegAppearanceController globalAppearanceController];
  BOOL v5 = [(PSTableCell *)self isChecked];
  v6 = [(CNFRegSelectableAliasTableCell *)self accessoryView];
  id v7 = v6;
  if (v5)
  {
    [v6 setHidden:0];

    if ([(CNFRegSelectableAliasTableCell *)self isEnabled]) {
      [v4 tableCellCheckmarkImage];
    }
    else {
    id v7 = [v4 tableCellCheckmarkImageDisabled];
    }
    v8 = [(CNFRegSelectableAliasTableCell *)self accessoryView];
    [v8 setImage:v7];
  }
  else
  {
    [v6 setHidden:1];
  }

  if ([v4 styleUsesCustomTableStyle]
    && ([v4 tableCellTextLabelColor],
        v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    uint64_t v10 = [v4 tableCellTextLabelColor];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F825C8] blackColor];
  }
  objc_super v11 = (void *)v10;
  v12 = [(CNFRegSelectableAliasTableCell *)self textLabel];
  [v12 setTextColor:v11];
}

@end