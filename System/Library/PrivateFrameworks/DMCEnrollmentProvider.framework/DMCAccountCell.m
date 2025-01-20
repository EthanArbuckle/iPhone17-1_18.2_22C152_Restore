@interface DMCAccountCell
+ (int64_t)cellStyle;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation DMCAccountCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DMCAccountCell;
  id v4 = a3;
  [(PSTableCell *)&v9 refreshCellContentsWithSpecifier:v4];
  v5 = [(DMCAccountCell *)self textLabel];
  v6 = [v4 propertyForKey:*MEMORY[0x263F602D0]];
  [v5 setText:v6];

  v7 = [(DMCAccountCell *)self detailTextLabel];
  v8 = [v4 propertyForKey:*MEMORY[0x263F602C8]];

  [v7 setText:v8];
}

@end