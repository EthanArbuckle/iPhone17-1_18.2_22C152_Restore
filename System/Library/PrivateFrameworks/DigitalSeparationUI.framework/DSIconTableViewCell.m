@interface DSIconTableViewCell
+ (id)iconTableViewCellFromTableView:(id)a3 withContentConfigurationText:(id)a4 detail:(id)a5 icon:(id)a6;
+ (id)iconTableViewCellFromTableView:(id)a3 withRightAlignedLabel:(id)a4 detail:(id)a5 icon:(id)a6;
+ (id)iconTableViewCellFromTableView:(id)a3 withText:(id)a4 detail:(id)a5 icon:(id)a6;
- (DSIconTableViewCell)initWithContentConfigurationForText:(id)a3 detail:(id)a4 icon:(id)a5;
- (DSIconTableViewCell)initWithRightAlignedLabel:(id)a3 detail:(id)a4 icon:(id)a5;
- (DSIconTableViewCell)initWithText:(id)a3 detail:(id)a4 icon:(id)a5;
- (id)contentConfigurationWithText:(id)a3 secondaryText:(id)a4 icon:(id)a5;
- (id)subtitleFont;
- (void)customizeProperties;
- (void)willTransitionToState:(unint64_t)a3;
@end

@implementation DSIconTableViewCell

+ (id)iconTableViewCellFromTableView:(id)a3 withText:(id)a4 detail:(id)a5 icon:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = [a3 dequeueReusableCellWithIdentifier:@"DSCell"];
  v14 = v13;
  if (v13)
  {
    v15 = [v13 textLabel];
    [v15 setText:v12];

    v16 = [v14 detailTextLabel];
    [v16 setText:v11];

    if (v10)
    {
      v17 = [v14 imageView];
      [v17 setImage:v10];
    }
    id v18 = v14;
  }
  else
  {
    id v18 = (id)[objc_alloc((Class)a1) initWithText:v12 detail:v11 icon:v10];
  }
  return v18;
}

+ (id)iconTableViewCellFromTableView:(id)a3 withRightAlignedLabel:(id)a4 detail:(id)a5 icon:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = [a3 dequeueReusableCellWithIdentifier:@"DSCellRightAligned"];
  v14 = v13;
  if (v13)
  {
    v15 = [v13 textLabel];
    [v15 setText:v12];

    v16 = [v14 detailTextLabel];
    [v16 setText:v11];

    if (v10)
    {
      v17 = [v14 imageView];
      [v17 setImage:v10];
    }
    id v18 = v14;
  }
  else
  {
    id v18 = (id)[objc_alloc((Class)a1) initWithRightAlignedLabel:v12 detail:v11 icon:v10];
  }
  return v18;
}

+ (id)iconTableViewCellFromTableView:(id)a3 withContentConfigurationText:(id)a4 detail:(id)a5 icon:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = [a3 dequeueReusableCellWithIdentifier:@"DSCellWithContentConfiguration"];
  v14 = v13;
  if (v13)
  {
    v15 = [v13 defaultContentConfiguration];
    [v15 setText:v12];

    [v15 setSecondaryText:v11];
    if (v10) {
      [v15 setImage:v10];
    }
    [v14 setContentConfiguration:v15];
    id v16 = v14;
  }
  else
  {
    id v16 = (id)[objc_alloc((Class)a1) initWithContentConfigurationForText:v12 detail:v11 icon:v10];

    v15 = v12;
  }

  return v16;
}

- (DSIconTableViewCell)initWithText:(id)a3 detail:(id)a4 icon:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DSIconTableViewCell;
  id v11 = [(DSIconTableViewCell *)&v17 initWithStyle:3 reuseIdentifier:@"DSCell"];
  id v12 = v11;
  if (v11)
  {
    v13 = [(DSIconTableViewCell *)v11 textLabel];
    [v13 setText:v8];

    v14 = [(DSIconTableViewCell *)v12 detailTextLabel];
    [v14 setText:v9];

    v15 = [(DSIconTableViewCell *)v12 imageView];
    [v15 setImage:v10];

    [(DSIconTableViewCell *)v12 customizeProperties];
  }

  return v12;
}

- (DSIconTableViewCell)initWithRightAlignedLabel:(id)a3 detail:(id)a4 icon:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DSIconTableViewCell;
  id v11 = [(DSIconTableViewCell *)&v17 initWithStyle:1 reuseIdentifier:@"DSCellRightAligned"];
  id v12 = v11;
  if (v11)
  {
    v13 = [(DSIconTableViewCell *)v11 textLabel];
    [v13 setText:v8];

    v14 = [(DSIconTableViewCell *)v12 detailTextLabel];
    [v14 setText:v9];

    v15 = [(DSIconTableViewCell *)v12 imageView];
    [v15 setImage:v10];

    [(DSIconTableViewCell *)v12 customizeProperties];
  }

  return v12;
}

- (DSIconTableViewCell)initWithContentConfigurationForText:(id)a3 detail:(id)a4 icon:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DSIconTableViewCell;
  id v11 = [(DSIconTableViewCell *)&v16 initWithStyle:3 reuseIdentifier:@"DSCellWithContentConfiguration"];
  id v12 = v11;
  if (v11)
  {
    v13 = [(DSIconTableViewCell *)v11 contentConfigurationWithText:v8 secondaryText:v9 icon:v10];
    [(DSIconTableViewCell *)v12 setContentConfiguration:v13];

    v14 = [MEMORY[0x263F825C8] tertiarySystemFillColor];
    [(DSIconTableViewCell *)v12 setBackgroundColor:v14];

    [(DSIconTableViewCell *)v12 setIsAccessibilityElement:1];
  }

  return v12;
}

- (void)customizeProperties
{
  v3 = [(DSIconTableViewCell *)self textLabel];
  [v3 setNumberOfLines:0];

  v4 = [(DSIconTableViewCell *)self textLabel];
  [v4 setLineBreakMode:0];

  v5 = [(DSIconTableViewCell *)self detailTextLabel];
  v6 = [(DSIconTableViewCell *)self subtitleFont];
  [v5 setFont:v6];

  v7 = [(DSIconTableViewCell *)self detailTextLabel];
  id v8 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [v7 setTextColor:v8];

  id v9 = [(DSIconTableViewCell *)self detailTextLabel];
  [v9 setNumberOfLines:0];

  id v10 = [(DSIconTableViewCell *)self detailTextLabel];
  [v10 setLineBreakMode:0];

  id v11 = [MEMORY[0x263F825C8] tertiarySystemFillColor];
  [(DSIconTableViewCell *)self setBackgroundColor:v11];

  [(DSIconTableViewCell *)self setIsAccessibilityElement:1];
}

- (void)willTransitionToState:(unint64_t)a3
{
  char v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DSIconTableViewCell;
  -[DSIconTableViewCell willTransitionToState:](&v7, sel_willTransitionToState_);
  if (v3)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F82E00]);
    v6 = [MEMORY[0x263F825C8] clearColor];
    [v5 setBackgroundColor:v6];

    [(DSIconTableViewCell *)self setSelectedBackgroundView:v5];
  }
}

- (id)subtitleFont
{
  v2 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F835F0]];
  char v3 = [v2 fontDescriptorWithSymbolicTraits:0x8000];

  v4 = [MEMORY[0x263F81708] fontWithDescriptor:v3 size:0.0];

  return v4;
}

- (id)contentConfigurationWithText:(id)a3 secondaryText:(id)a4 icon:(id)a5
{
  id v8 = (void *)MEMORY[0x263F82918];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 subtitleCellConfiguration];
  [v12 setText:v11];

  v13 = [v12 textProperties];
  [v13 setNumberOfLines:1];

  v14 = [v12 textProperties];
  [v14 setAdjustsFontSizeToFitWidth:1];

  [v12 setSecondaryText:v10];
  v15 = [v12 secondaryTextProperties];
  [v15 setNumberOfLines:1];

  objc_super v16 = [v12 secondaryTextProperties];
  [v16 setAdjustsFontSizeToFitWidth:1];

  objc_super v17 = [(DSIconTableViewCell *)self subtitleFont];
  id v18 = [v12 secondaryTextProperties];
  [v18 setFont:v17];

  v19 = [MEMORY[0x263F825C8] secondaryLabelColor];
  v20 = [v12 secondaryTextProperties];
  [v20 setColor:v19];

  [v12 setImage:v9];
  v21 = [v12 imageProperties];
  objc_msgSend(v21, "setMaximumSize:", 48.0, 48.0);

  [v12 setImageToTextPadding:8.0];
  [v12 directionalLayoutMargins];
  objc_msgSend(v12, "setDirectionalLayoutMargins:");
  return v12;
}

@end