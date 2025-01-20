@interface FAChecklistCustomCellTableViewCell
+ (int64_t)cellStyle;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation FAChecklistCustomCellTableViewCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v42[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)FAChecklistCustomCellTableViewCell;
  [(PSTableCell *)&v38 refreshCellContentsWithSpecifier:v4];
  id v5 = objc_alloc_init(MEMORY[0x263F089B8]);
  [v4 propertyForKey:*MEMORY[0x263F60120]];
  v37 = unint64_t v6 = 0x263F08000uLL;
  if (v37)
  {
    id v7 = objc_alloc(MEMORY[0x263F086A0]);
    uint64_t v8 = *MEMORY[0x263F814F0];
    uint64_t v41 = *MEMORY[0x263F814F0];
    uint64_t v9 = *MEMORY[0x263F835F0];
    v10 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F835F0] weight:*MEMORY[0x263F81840]];
    v42[0] = v10;
    v11 = [NSDictionary dictionaryWithObjects:v42 forKeys:&v41 count:1];
    v12 = (void *)[v7 initWithString:v37 attributes:v11];

    unint64_t v6 = 0x263F08000;
    [v5 appendAttributedString:v12];
  }
  else
  {
    uint64_t v8 = *MEMORY[0x263F814F0];
    uint64_t v9 = *MEMORY[0x263F835F0];
  }
  v13 = v5;
  v36 = objc_msgSend(v4, "propertyForKey:", *MEMORY[0x263F602C8], v4);
  id v14 = objc_alloc(*(Class *)(v6 + 1696));
  uint64_t v39 = v8;
  v15 = [MEMORY[0x263F81708] preferredFontForTextStyle:v9];
  v40 = v15;
  v16 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
  v17 = (void *)[v14 initWithString:v36 attributes:v16];

  [v13 appendAttributedString:v17];
  v18 = [(FAChecklistCustomCellTableViewCell *)self imageView];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

  v19 = [(FAChecklistCustomCellTableViewCell *)self imageView];
  v20 = [v19 topAnchor];
  v21 = [(FAChecklistCustomCellTableViewCell *)self contentView];
  v22 = [v21 topAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  [v23 setActive:1];

  v24 = [(FAChecklistCustomCellTableViewCell *)self imageView];
  [v24 setContentMode:9];

  v25 = [(FAChecklistCustomCellTableViewCell *)self imageView];
  [v25 setContentMode:1];

  v26 = [(FAChecklistCustomCellTableViewCell *)self detailTextLabel];
  [v26 setAttributedText:v13];

  v27 = [(FAChecklistCustomCellTableViewCell *)self detailTextLabel];
  [v27 setLineBreakMode:0];

  v28 = [(FAChecklistCustomCellTableViewCell *)self detailTextLabel];
  [v28 setNumberOfLines:0];

  v29 = [(FAChecklistCustomCellTableViewCell *)self textLabel];
  v30 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
  [v29 setFont:v30];

  v31 = [(FAChecklistCustomCellTableViewCell *)self textLabel];
  v32 = [v35 propertyForKey:*MEMORY[0x263F602D0]];
  [v31 setText:v32];

  v33 = [(FAChecklistCustomCellTableViewCell *)self textLabel];
  [v33 setLineBreakMode:0];

  v34 = [(FAChecklistCustomCellTableViewCell *)self textLabel];
  [v34 setNumberOfLines:0];

  [(FAChecklistCustomCellTableViewCell *)self setNeedsLayout];
}

@end