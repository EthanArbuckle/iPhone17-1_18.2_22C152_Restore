@interface CPUIAssistantCell
- (CGSize)sizeThatFits:(CGSize)result;
- (void)_setSiriAccessory;
- (void)applyConfiguration:(id)a3;
- (void)configureCell;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation CPUIAssistantCell

- (void)configureCell
{
  v4.receiver = self;
  v4.super_class = (Class)CPUIAssistantCell;
  [(_CPUIBaseTableCell *)&v4 configureCell];
  v3 = [(CPUIAssistantCell *)self textLabel];
  [v3 setAdjustsFontSizeToFitWidth:1];

  [(CPUIAssistantCell *)self setAccessibilityIdentifier:@"CPListAssistantCell"];
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 54.0;
  result.height = v3;
  return result;
}

- (void)applyConfiguration:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(CPUIAssistantCell *)self _setSiriAccessory];
  v5 = [v4 text];

  v6 = [(CPUIAssistantCell *)self textLabel];
  [v6 setText:v5];

  v7 = [(CPUIAssistantCell *)self textLabel];
  v8 = [v7 text];

  if (v8)
  {
    v9 = [(CPUIAssistantCell *)self textLabel];
    v10 = [v9 text];
    v12[0] = v10;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    [(CPUIAssistantCell *)self setAccessibilityUserInputLabels:v11];
  }
  else
  {
    [(CPUIAssistantCell *)self setAccessibilityUserInputLabels:MEMORY[0x263EFFA68]];
  }
  [(CPUIAssistantCell *)self setNeedsLayout];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CPUIAssistantCell;
  [(CPUIAssistantCell *)&v9 setHighlighted:a3 animated:a4];
  if (a3) {
    [MEMORY[0x263F825C8] _carSystemFocusLabelColor];
  }
  else {
  v6 = [MEMORY[0x263F825C8] _carSystemFocusColor];
  }
  v7 = [(CPUIAssistantCell *)self textLabel];
  [v7 setTextColor:v6];

  v8 = [(CPUIAssistantCell *)self accessoryView];
  [v8 setTintColor:v6];
}

- (void)_setSiriAccessory
{
  double v3 = _CPUISiriGlyph(4);
  id v5 = [v3 imageWithRenderingMode:2];

  id v4 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v5];
  [(CPUIAssistantCell *)self setAccessoryView:v4];
}

@end