@interface BYODSubtitleTableCell
+ (int64_t)cellStyle;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation BYODSubtitleTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BYODSubtitleTableCell;
  [(BYODSubtitleTableCell *)&v9 refreshCellContentsWithSpecifier:v4];
  v5 = [(BYODSubtitleTableCell *)self detailTextLabel];
  v6 = [v4 propertyForKey:PSTableCellSubtitleTextKey];
  [v5 setText:v6];

  v7 = [(BYODSubtitleTableCell *)self detailTextLabel];
  [v7 setLineBreakMode:0];

  v8 = [(BYODSubtitleTableCell *)self detailTextLabel];
  [v8 setNumberOfLines:0];

  [(BYODSubtitleTableCell *)self setNeedsLayout];
}

@end