@interface FollowerDetailsLinkCell
+ (int64_t)cellStyle;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation FollowerDetailsLinkCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FollowerDetailsLinkCell;
  [(PSTableCell *)&v13 refreshCellContentsWithSpecifier:v4];
  v5 = [v4 propertyForKey:@"PSFollowerDetailsTitleTextColorKey"];
  v6 = [(FollowerDetailsLinkCell *)self textLabel];
  v7 = v6;
  if (v5)
  {
    [v6 setTextColor:v5];
  }
  else
  {
    v8 = [MEMORY[0x263F1C550] labelColor];
    [v7 setTextColor:v8];
  }
  v9 = [(FollowerDetailsLinkCell *)self detailTextLabel];
  v10 = [v4 propertyForKey:*MEMORY[0x263F602C8]];
  [v9 setText:v10];

  v11 = [(FollowerDetailsLinkCell *)self detailTextLabel];
  v12 = [MEMORY[0x263F1C550] tableCellGrayTextColor];
  [v11 setTextColor:v12];

  [(FollowerDetailsLinkCell *)self setNeedsLayout];
}

@end