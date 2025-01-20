@interface FCUISettingsAttributedCell
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation FCUISettingsAttributedCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FCUISettingsAttributedCell;
  id v4 = a3;
  [(FCUISettingsAttributedCell *)&v7 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "propertyForKey:", @"FCUIDetailKey", v7.receiver, v7.super_class);

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [(FCUISettingsAttributedCell *)self detailTextLabel];
      [v6 setAttributedText:v5];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_7:
        [(FCUISettingsAttributedCell *)self setNeedsLayout];
        goto LABEL_8;
      }
      v6 = [(FCUISettingsAttributedCell *)self detailTextLabel];
      [v6 setText:v5];
    }

    goto LABEL_7;
  }
LABEL_8:
}

@end