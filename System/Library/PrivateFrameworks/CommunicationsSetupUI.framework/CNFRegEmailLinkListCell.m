@interface CNFRegEmailLinkListCell
- (BOOL)canReload;
- (CNFRegEmailLinkListCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)layoutSubviews;
@end

@implementation CNFRegEmailLinkListCell

- (BOOL)canReload
{
  return 1;
}

- (CNFRegEmailLinkListCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)CNFRegEmailLinkListCell;
  v5 = [(PSTableCell *)&v11 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(CNFRegEmailLinkListCell *)v5 detailTextLabel];
    [v7 setTextAlignment:2];

    v8 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
    v9 = [(CNFRegEmailLinkListCell *)v6 detailTextLabel];
    [v9 setTextColor:v8];
  }
  return v6;
}

- (void)layoutSubviews
{
  v16[1] = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)CNFRegEmailLinkListCell;
  [(PSTableCell *)&v14 layoutSubviews];
  v3 = [(CNFRegEmailLinkListCell *)self textLabel];
  v4 = [(CNFRegEmailLinkListCell *)self detailTextLabel];
  v5 = [v3 text];
  if (![v5 length])
  {
LABEL_6:

    goto LABEL_7;
  }
  v6 = [v4 text];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    uint64_t v15 = *MEMORY[0x263F814F0];
    v8 = [v4 font];
    v16[0] = v8;
    v5 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];

    v9 = [v4 text];
    if ([v9 length])
    {
      v10 = [v4 text];
      [(CNFRegEmailLinkListCell *)self bounds];
      objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 0, v5, 0, v11, v12);
    }
    v13 = [(CNFRegEmailLinkListCell *)self contentView];
    [v13 bounds];
    CGRectGetWidth(v17);

    [v3 frame];
    objc_msgSend(v3, "setFrame:");
    goto LABEL_6;
  }
LABEL_7:
}

@end