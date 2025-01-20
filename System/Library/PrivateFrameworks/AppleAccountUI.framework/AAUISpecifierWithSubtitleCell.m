@interface AAUISpecifierWithSubtitleCell
+ (int64_t)cellStyle;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation AAUISpecifierWithSubtitleCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)AAUISpecifierWithSubtitleCell;
  id v4 = a3;
  [(PSTableCell *)&v22 refreshCellContentsWithSpecifier:v4];
  v5 = [(AAUISpecifierWithSubtitleCell *)self textLabel];
  v6 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [v5 setFont:v6];

  v7 = [(AAUISpecifierWithSubtitleCell *)self textLabel];
  v8 = [MEMORY[0x263F825C8] labelColor];
  [v7 setTextColor:v8];

  v9 = [(AAUISpecifierWithSubtitleCell *)self textLabel];
  v10 = [v4 propertyForKey:*MEMORY[0x263F602D0]];
  [v9 setText:v10];

  v11 = [(AAUISpecifierWithSubtitleCell *)self textLabel];
  [v11 setLineBreakMode:0];

  v12 = [(AAUISpecifierWithSubtitleCell *)self textLabel];
  [v12 setNumberOfLines:0];

  v13 = [(AAUISpecifierWithSubtitleCell *)self detailTextLabel];
  v14 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
  [v13 setFont:v14];

  v15 = [(AAUISpecifierWithSubtitleCell *)self detailTextLabel];
  v16 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [v15 setTextColor:v16];

  v17 = [(AAUISpecifierWithSubtitleCell *)self detailTextLabel];
  v18 = [v4 propertyForKey:*MEMORY[0x263F602C8]];

  [v17 setText:v18];
  v19 = [(AAUISpecifierWithSubtitleCell *)self detailTextLabel];
  [v19 setLineBreakMode:0];

  v20 = [(AAUISpecifierWithSubtitleCell *)self detailTextLabel];
  [v20 setNumberOfLines:0];

  v21 = [(AAUISpecifierWithSubtitleCell *)self imageView];
  [v21 setContentMode:1];

  [(AAUISpecifierWithSubtitleCell *)self setNeedsLayout];
}

@end