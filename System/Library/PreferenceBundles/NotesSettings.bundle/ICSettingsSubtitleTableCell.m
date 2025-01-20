@interface ICSettingsSubtitleTableCell
+ (int64_t)cellStyle;
- (BOOL)canReload;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation ICSettingsSubtitleTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (BOOL)canReload
{
  return 1;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICSettingsSubtitleTableCell;
  id v4 = a3;
  [(ICSettingsSubtitleTableCell *)&v7 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "propertyForKey:", PSTableCellSubtitleTextKey, v7.receiver, v7.super_class);

  v6 = [(ICSettingsSubtitleTableCell *)self detailTextLabel];
  [v6 setText:v5];

  [(ICSettingsSubtitleTableCell *)self setNeedsLayout];
}

@end