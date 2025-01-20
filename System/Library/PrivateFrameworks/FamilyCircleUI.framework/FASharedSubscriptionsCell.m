@interface FASharedSubscriptionsCell
- (FASharedSubscriptionsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation FASharedSubscriptionsCell

- (FASharedSubscriptionsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v17.receiver = self;
  v17.super_class = (Class)FASharedSubscriptionsCell;
  v5 = -[FASharedSubscriptionsCell initWithStyle:reuseIdentifier:](&v17, sel_initWithStyle_reuseIdentifier_, 3, a4, a5);
  v6 = v5;
  if (v5)
  {
    v7 = [(FASharedSubscriptionsCell *)v5 textLabel];
    v8 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
    [v7 setFont:v8];

    v9 = [(FASharedSubscriptionsCell *)v6 textLabel];
    [v9 setLineBreakMode:0];

    v10 = [(FASharedSubscriptionsCell *)v6 textLabel];
    [v10 setNumberOfLines:0];

    v11 = [(FASharedSubscriptionsCell *)v6 detailTextLabel];
    v12 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
    [v11 setFont:v12];

    v13 = [(FASharedSubscriptionsCell *)v6 detailTextLabel];
    [v13 setLineBreakMode:0];

    v14 = [(FASharedSubscriptionsCell *)v6 detailTextLabel];
    [v14 setNumberOfLines:0];

    v15 = [(FASharedSubscriptionsCell *)v6 imageView];
    [v15 setContentMode:1];
  }
  return v6;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FASharedSubscriptionsCell;
  id v4 = a3;
  [(PSTableCell *)&v9 refreshCellContentsWithSpecifier:v4];
  v5 = [(FASharedSubscriptionsCell *)self textLabel];
  v6 = [v4 propertyForKey:*MEMORY[0x263F602D0]];
  [v5 setText:v6];

  v7 = [(FASharedSubscriptionsCell *)self detailTextLabel];
  v8 = [v4 propertyForKey:*MEMORY[0x263F602C8]];

  [v7 setText:v8];
  [(FASharedSubscriptionsCell *)self setNeedsLayout];
}

@end