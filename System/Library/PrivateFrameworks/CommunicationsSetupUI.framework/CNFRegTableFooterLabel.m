@interface CNFRegTableFooterLabel
- (CNFRegTableFooterLabel)initWithSpecifier:(id)a3;
- (double)_bottomPadding;
- (double)_topPadding;
- (id)_URLTarget;
- (id)_URLText;
- (id)_labelText;
- (int64_t)_labelTextAlignment;
@end

@implementation CNFRegTableFooterLabel

- (CNFRegTableFooterLabel)initWithSpecifier:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CNFRegTableFooterLabel;
  v3 = [(CNFRegTableLabel *)&v9 initWithSpecifier:a3];
  if (v3)
  {
    v4 = +[CNFRegAppearanceController globalAppearanceController];
    v5 = [v4 tableFooterFont];

    if (v5) {
      [v4 tableFooterFont];
    }
    else {
    v6 = PreferencesTableViewFooterFont();
    }
    [(UILabel *)v3->super._label setFont:v6];

    v7 = [v4 tableFooterTextColor];
    [(UILabel *)v3->super._label setTextColor:v7];

    -[UILabel setTextAlignment:](v3->super._label, "setTextAlignment:", [v4 tableHeaderTextAlignment]);
  }
  return v3;
}

- (id)_labelText
{
  return (id)[(PSSpecifier *)self->super._specifier propertyForKey:*MEMORY[0x263F600F8]];
}

- (id)_URLText
{
  return (id)[(PSSpecifier *)self->super._specifier propertyForKey:@"cnfreg-url-text"];
}

- (id)_URLTarget
{
  return (id)[(PSSpecifier *)self->super._specifier propertyForKey:@"cnfreg-url-target"];
}

- (int64_t)_labelTextAlignment
{
  v3 = [(PSSpecifier *)self->super._specifier propertyForKey:*MEMORY[0x263F600B8]];
  v4 = v3;
  if (v3)
  {
    int64_t v5 = (int)[v3 intValue];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CNFRegTableFooterLabel;
    int64_t v5 = [(CNFRegTableLabel *)&v7 _labelTextAlignment];
  }

  return v5;
}

- (double)_topPadding
{
  return 6.0;
}

- (double)_bottomPadding
{
  return 6.0;
}

@end