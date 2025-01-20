@interface AccessoryControlTableCell
+ (int64_t)cellStyle;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation AccessoryControlTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AccessoryControlTableCell;
  id v4 = a3;
  [(PSTableCell *)&v7 refreshCellContentsWithSpecifier:v4];
  v5 = [(AccessoryControlTableCell *)self detailTextLabel];
  v6 = [v4 propertyForKey:*MEMORY[0x1E4F93230]];

  [v5 setText:v6];
  [(AccessoryControlTableCell *)self setNeedsLayout];
}

@end