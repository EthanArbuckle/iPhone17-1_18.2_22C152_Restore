@interface AMSUISpecifierWithSubtitleCell
+ (int64_t)cellStyle;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation AMSUISpecifierWithSubtitleCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)AMSUISpecifierWithSubtitleCell;
  id v4 = a3;
  [(PSTableCell *)&v18 refreshCellContentsWithSpecifier:v4];
  v5 = [(AMSUISpecifierWithSubtitleCell *)self textLabel];
  v6 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [v5 setFont:v6];

  v7 = [(AMSUISpecifierWithSubtitleCell *)self textLabel];
  v8 = [MEMORY[0x263F825C8] labelColor];
  [v7 setTextColor:v8];

  v9 = [(AMSUISpecifierWithSubtitleCell *)self textLabel];
  v10 = [v4 propertyForKey:*MEMORY[0x263F602D0]];
  [v9 setText:v10];

  v11 = [(AMSUISpecifierWithSubtitleCell *)self detailTextLabel];
  v12 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
  [v11 setFont:v12];

  v13 = [(AMSUISpecifierWithSubtitleCell *)self detailTextLabel];
  v14 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [v13 setTextColor:v14];

  v15 = [(AMSUISpecifierWithSubtitleCell *)self detailTextLabel];
  v16 = [v4 propertyForKey:*MEMORY[0x263F602C8]];

  [v15 setText:v16];
  v17 = [(AMSUISpecifierWithSubtitleCell *)self imageView];
  [v17 setContentMode:1];

  [(AMSUISpecifierWithSubtitleCell *)self setNeedsLayout];
}

@end