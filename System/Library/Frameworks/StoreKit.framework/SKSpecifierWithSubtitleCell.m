@interface SKSpecifierWithSubtitleCell
+ (int64_t)cellStyle;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation SKSpecifierWithSubtitleCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)SKSpecifierWithSubtitleCell;
  id v4 = a3;
  [(PSTableCell *)&v18 refreshCellContentsWithSpecifier:v4];
  v5 = [(SKSpecifierWithSubtitleCell *)self textLabel];
  v6 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v5 setFont:v6];

  v7 = [(SKSpecifierWithSubtitleCell *)self textLabel];
  v8 = [MEMORY[0x1E4FB1618] labelColor];
  [v7 setTextColor:v8];

  v9 = [(SKSpecifierWithSubtitleCell *)self textLabel];
  v10 = [v4 propertyForKey:*MEMORY[0x1E4F93240]];
  [v9 setText:v10];

  v11 = [(SKSpecifierWithSubtitleCell *)self detailTextLabel];
  v12 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  [v11 setFont:v12];

  v13 = [(SKSpecifierWithSubtitleCell *)self detailTextLabel];
  v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v13 setTextColor:v14];

  v15 = [(SKSpecifierWithSubtitleCell *)self detailTextLabel];
  v16 = [v4 propertyForKey:*MEMORY[0x1E4F93230]];

  [v15 setText:v16];
  v17 = [(SKSpecifierWithSubtitleCell *)self imageView];
  [v17 setContentMode:1];

  [(SKSpecifierWithSubtitleCell *)self setNeedsLayout];
}

@end