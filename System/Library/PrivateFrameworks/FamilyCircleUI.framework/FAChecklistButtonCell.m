@interface FAChecklistButtonCell
+ (int64_t)cellStyle;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation FAChecklistButtonCell

+ (int64_t)cellStyle
{
  return 1;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)FAChecklistButtonCell;
  id v4 = a3;
  [(PSTableCell *)&v13 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(MEMORY[0x263F825C8], "systemBlueColor", v13.receiver, v13.super_class);
  v6 = [(FAChecklistButtonCell *)self textLabel];
  [v6 setColor:v5];

  v7 = [(FAChecklistButtonCell *)self textLabel];
  v8 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83570] weight:*MEMORY[0x263F81840]];
  [v7 setFont:v8];

  v9 = [(FAChecklistButtonCell *)self textLabel];
  v10 = [v4 propertyForKey:*MEMORY[0x263F602D0]];

  [v9 setText:v10];
  v11 = [(FAChecklistButtonCell *)self textLabel];
  [v11 setLineBreakMode:0];

  v12 = [(FAChecklistButtonCell *)self textLabel];
  [v12 setNumberOfLines:0];

  [(FAChecklistButtonCell *)self setIndentationWidth:51.75];
  [(FAChecklistButtonCell *)self setIndentationLevel:1];
  [(FAChecklistButtonCell *)self setNeedsLayout];
}

@end