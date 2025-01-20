@interface BYODSubtitleBadgedTabelCell
+ (int64_t)cellStyle;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation BYODSubtitleBadgedTabelCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BYODSubtitleBadgedTabelCell;
  [(BYODSubtitleBadgedTabelCell *)&v9 refreshCellContentsWithSpecifier:v4];
  v5 = [(BYODSubtitleBadgedTabelCell *)self detailTextLabel];
  v6 = [v4 propertyForKey:PSTableCellSubtitleTextKey];
  [v5 setText:v6];

  v7 = [(BYODSubtitleBadgedTabelCell *)self detailTextLabel];
  [v7 setLineBreakMode:0];

  v8 = [(BYODSubtitleBadgedTabelCell *)self detailTextLabel];
  [v8 setNumberOfLines:0];

  [(BYODSubtitleBadgedTabelCell *)self setNeedsLayout];
}

@end