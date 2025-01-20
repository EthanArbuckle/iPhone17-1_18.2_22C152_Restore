@interface AXLongTitleSwitchTableCell
- (AXLongTitleSwitchTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
@end

@implementation AXLongTitleSwitchTableCell

- (AXLongTitleSwitchTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)AXLongTitleSwitchTableCell;
  v5 = [(PSSwitchTableCell *)&v9 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(PSTableCell *)v5 titleLabel];
    [v7 setNumberOfLines:0];
  }
  return v6;
}

@end