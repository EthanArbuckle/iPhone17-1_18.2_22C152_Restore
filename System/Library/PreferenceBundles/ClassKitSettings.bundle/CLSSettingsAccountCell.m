@interface CLSSettingsAccountCell
- (BOOL)canReload;
- (CLSSettingsAccountCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation CLSSettingsAccountCell

- (CLSSettingsAccountCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CLSSettingsAccountCell;
  v5 = [(CLSSettingsAccountCell *)&v9 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    [(CLSSettingsAccountCell *)v5 setSelectionStyle:0];
    [(CLSSettingsAccountCell *)v6 setUserInteractionEnabled:0];
    v7 = [(CLSSettingsAccountCell *)v6 valueLabel];
    [v7 setAdjustsFontSizeToFitWidth:1];
    [v7 setMinimumScaleFactor:0.823529412];
  }
  return v6;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CLSSettingsAccountCell;
  [(CLSSettingsAccountCell *)&v4 refreshCellContentsWithSpecifier:a3];
  [(CLSSettingsAccountCell *)self setAccessoryType:0];
}

- (void)setValue:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLSSettingsAccountCell;
  [(CLSSettingsAccountCell *)&v5 setValue:a3];
  objc_super v4 = [(CLSSettingsAccountCell *)self titleLabel];
  [v4 sizeToFit];
}

- (BOOL)canReload
{
  return 1;
}

@end