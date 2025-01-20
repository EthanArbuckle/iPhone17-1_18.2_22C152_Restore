@interface CNFRegTableHeaderLabel
- (CNFRegTableHeaderLabel)initWithSpecifier:(id)a3;
- (double)preferredHeightForWidth:(double)a3;
- (id)_labelText;
- (int64_t)_labelTextAlignment;
@end

@implementation CNFRegTableHeaderLabel

- (CNFRegTableHeaderLabel)initWithSpecifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CNFRegTableHeaderLabel;
  v3 = [(CNFRegTableLabel *)&v8 initWithSpecifier:a3];
  if (v3)
  {
    v4 = +[CNFRegAppearanceController globalAppearanceController];
    v5 = [v4 tableHeaderFont];

    if (v5) {
      [v4 tableHeaderFont];
    }
    else {
    v6 = PreferencesTableViewFooterFont();
    }
    [(UILabel *)v3->super._label setFont:v6];

    -[UILabel setTextAlignment:](v3->super._label, "setTextAlignment:", [v4 tableHeaderTextAlignment]);
  }
  return v3;
}

- (id)_labelText
{
  return (id)[(PSSpecifier *)self->super._specifier name];
}

- (int64_t)_labelTextAlignment
{
  v3 = [(PSSpecifier *)self->super._specifier propertyForKey:*MEMORY[0x263F5FEF0]];
  v4 = v3;
  if (v3)
  {
    int64_t v5 = (int)[v3 intValue];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CNFRegTableHeaderLabel;
    int64_t v5 = [(CNFRegTableLabel *)&v7 _labelTextAlignment];
  }

  return v5;
}

- (double)preferredHeightForWidth:(double)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CNFRegTableHeaderLabel;
  [(CNFRegTableLabel *)&v9 preferredHeightForWidth:a3];
  double v4 = v3;
  if (v3 > 0.0)
  {
    int64_t v5 = [MEMORY[0x263F82670] currentDevice];
    double v6 = [v5 userInterfaceIdiom] == 1 ? 34.0 : 35.0;

    if (v4 < v6)
    {
      objc_super v7 = [MEMORY[0x263F82670] currentDevice];
      if ([v7 userInterfaceIdiom] == 1) {
        double v4 = 34.0;
      }
      else {
        double v4 = 35.0;
      }
    }
  }
  return v4;
}

@end