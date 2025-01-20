@interface BKSettingsDeviceCell
+ (int64_t)cellStyle;
- (id)blankIcon;
- (id)getLazyIcon;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation BKSettingsDeviceCell

+ (int64_t)cellStyle
{
  return 3;
}

- (id)blankIcon
{
  if (qword_1E690 != -1) {
    dispatch_once(&qword_1E690, &stru_188F8);
  }
  v2 = (void *)qword_1E688;

  return v2;
}

- (id)getLazyIcon
{
  v3 = [BKSettingsDeviceImage alloc];
  v7.receiver = self;
  v7.super_class = (Class)BKSettingsDeviceCell;
  id v4 = [(BKSettingsDeviceCell *)&v7 getLazyIcon];
  v5 = -[BKSettingsDeviceImage initWithCGImage:](v3, "initWithCGImage:", [v4 CGImage]);

  return v5;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BKSettingsDeviceCell;
  [(BKSettingsDeviceCell *)&v21 refreshCellContentsWithSpecifier:v4];
  v5 = [(BKSettingsDeviceCell *)self textLabel];
  v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v5 setFont:v6];

  objc_super v7 = [(BKSettingsDeviceCell *)self textLabel];
  v8 = +[UIColor labelColor];
  [v7 setTextColor:v8];

  v9 = [(BKSettingsDeviceCell *)self textLabel];
  v10 = [v4 propertyForKey:PSTitleKey];
  [v9 setText:v10];

  v11 = [v4 propertyForKey:PSTableCellSubtitleTextKey];
  if (v11)
  {
    v12 = [(BKSettingsDeviceCell *)self detailTextLabel];
    v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    [v12 setFont:v13];

    v14 = [v4 propertyForKey:PSTableCellSubtitleColorKey];
    v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = +[UIColor systemGrayColor];
    }
    v17 = v16;

    v18 = [(BKSettingsDeviceCell *)self detailTextLabel];
    [v18 setTextColor:v17];

    v19 = [(BKSettingsDeviceCell *)self detailTextLabel];
    [v19 setText:v11];
  }
  v20 = [(BKSettingsDeviceCell *)self imageView];
  [v20 setContentMode:2];

  [(BKSettingsDeviceCell *)self setNeedsLayout];
}

@end