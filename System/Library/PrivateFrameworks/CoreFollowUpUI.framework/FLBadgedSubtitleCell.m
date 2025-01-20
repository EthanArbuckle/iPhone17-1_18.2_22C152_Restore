@interface FLBadgedSubtitleCell
+ (id)reuseIdentifierForClassAndType:(int64_t)a3;
- (FLBadgedSubtitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (int64_t)style;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation FLBadgedSubtitleCell

+ (id)reuseIdentifierForClassAndType:(int64_t)a3
{
  return @"FLBadgedSubtitleCell";
}

- (FLBadgedSubtitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v7 = a5;
  v12.receiver = self;
  v12.super_class = (Class)FLBadgedSubtitleCell;
  v8 = [(PSBadgedTableCell *)&v12 initWithStyle:3 reuseIdentifier:a4 specifier:v7];
  if (v8)
  {
    v9 = [v7 propertyForKey:*MEMORY[0x263F602C8]];
    v10 = [(PSTableCell *)v8 valueLabel];
    [v10 setText:v9];
  }
  return v8;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FLBadgedSubtitleCell;
  id v4 = a3;
  [(PSBadgedTableCell *)&v7 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "propertyForKey:", *MEMORY[0x263F602C8], v7.receiver, v7.super_class);

  v6 = [(PSTableCell *)self valueLabel];
  [v6 setText:v5];
}

- (int64_t)style
{
  return 3;
}

@end