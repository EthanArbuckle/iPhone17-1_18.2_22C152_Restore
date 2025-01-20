@interface STStorageSubtitleTableCell
+ (int64_t)cellStyle;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation STStorageSubtitleTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)STStorageSubtitleTableCell;
  id v4 = a3;
  [(STStorageSubtitleTableCell *)&v7 refreshCellContentsWithSpecifier:v4];
  v5 = [(STStorageSubtitleTableCell *)self detailTextLabel];
  v6 = [v4 propertyForKey:PSTableCellSubtitleTextKey];

  [v5 setText:v6];
  [(STStorageSubtitleTableCell *)self setNeedsLayout];
}

@end