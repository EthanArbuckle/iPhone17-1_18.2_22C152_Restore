@interface AXColorChooserCell
- (AXColorChooserCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (AXColorCircle)circle;
- (BOOL)colorIsBlack:(id)a3;
- (BOOL)colorIsWhite:(id)a3;
- (BOOL)fillCircle;
- (void)layoutSubviews;
- (void)setCircle:(id)a3;
- (void)setFillCircle:(BOOL)a3;
@end

@implementation AXColorChooserCell

- (BOOL)colorIsWhite:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectAtIndexedSubscript:0];
  [v4 floatValue];
  if (v5 == 1.0)
  {
    v6 = [v3 objectAtIndexedSubscript:1];
    [v6 floatValue];
    if (v7 == 1.0)
    {
      v8 = [v3 objectAtIndexedSubscript:2];
      [v8 floatValue];
      BOOL v10 = v9 == 1.0;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)colorIsBlack:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectAtIndexedSubscript:0];
  [v4 floatValue];
  if (v5 == 0.0)
  {
    v6 = [v3 objectAtIndexedSubscript:1];
    [v6 floatValue];
    if (v7 == 0.0)
    {
      v8 = [v3 objectAtIndexedSubscript:2];
      [v8 floatValue];
      BOOL v10 = v9 == 0.0;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (AXColorChooserCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v33.receiver = self;
  v33.super_class = (Class)AXColorChooserCell;
  id v7 = a5;
  v8 = [(AXColorChooserCell *)&v33 initWithStyle:a3 reuseIdentifier:a4 specifier:v7];
  float v9 = [AXColorCircle alloc];
  BOOL v10 = -[AXColorCircle initWithFrame:](v9, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height, v33.receiver, v33.super_class);
  v11 = [v7 propertyForKey:@"rgb"];

  if ([(AXColorChooserCell *)v8 colorIsWhite:v11])
  {
    v12 = [(AXColorChooserCell *)v8 traitCollection];
    v13 = (char *)[v12 userInterfaceStyle];

    if (v13 == (unsigned char *)&dword_0 + 1)
    {
      uint64_t v14 = +[UIColor blackColor];
LABEL_7:
      v17 = (void *)v14;
      [(AXColorCircle *)v10 setColor:v14];
LABEL_11:

      goto LABEL_12;
    }
  }
  if ([(AXColorChooserCell *)v8 colorIsBlack:v11])
  {
    v15 = [(AXColorChooserCell *)v8 traitCollection];
    v16 = (char *)[v15 userInterfaceStyle];

    if (v16 == (unsigned char *)&dword_0 + 2)
    {
      uint64_t v14 = +[UIColor whiteColor];
      goto LABEL_7;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = [v11 objectAtIndexedSubscript:0];
    [v17 floatValue];
    double v19 = v18;
    v20 = [v11 objectAtIndexedSubscript:1];
    [v20 floatValue];
    double v22 = v21;
    v23 = [v11 objectAtIndexedSubscript:2];
    [v23 floatValue];
    double v25 = v24;
    v26 = [v11 objectAtIndexedSubscript:3];
    [v26 floatValue];
    v28 = +[UIColor colorWithRed:v19 green:v22 blue:v25 alpha:v27];
    [(AXColorCircle *)v10 setColor:v28];

    goto LABEL_11;
  }
  [(AXColorCircle *)v10 setColor:v11];
LABEL_12:
  v29 = +[UIColor clearColor];
  [(AXColorCircle *)v10 setBackgroundColor:v29];

  v30 = [(AXColorChooserCell *)v8 contentView];
  [v30 addSubview:v10];

  [(AXColorChooserCell *)v8 setCircle:v10];
  LODWORD(v30) = [(AXColorChooserCell *)v8 colorIsWhite:v11];
  v31 = [(AXColorChooserCell *)v8 circle];
  [v31 setFillCircle:v30 ^ 1];

  return v8;
}

- (void)setFillCircle:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AXColorChooserCell *)self circle];
  [v4 setFillCircle:v3];
}

- (BOOL)fillCircle
{
  v2 = [(AXColorChooserCell *)self circle];
  unsigned __int8 v3 = [v2 fillCircle];

  return v3;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)AXColorChooserCell;
  [(AXColorChooserCell *)&v23 layoutSubviews];
  UIUserInterfaceLayoutDirection v3 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:[(AXColorChooserCell *)self semanticContentAttribute]];
  if (AXPreferredContentSizeCategoryIsAccessibilityCategory()) {
    double v4 = 30.0;
  }
  else {
    double v4 = 10.0;
  }
  if (v3)
  {
    float v5 = [(AXColorChooserCell *)self contentView];
    [v5 bounds];
    double v6 = CGRectGetMaxX(v24) - v4 + -9.0;
  }
  else
  {
    double v6 = 9.0;
  }
  [(AXColorChooserCell *)self bounds];
  double v8 = v7 * 0.5 - v4 * 0.5;
  float v9 = [(AXColorChooserCell *)self circle];
  objc_msgSend(v9, "setFrame:", v6, v8, v4, v4);

  BOOL v10 = [(AXColorChooserCell *)self circle];
  [v10 setNeedsDisplay];

  v11 = [(AXColorChooserCell *)self textLabel];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v4 + -1.0;
  if (v3) {
    double v20 = -(v4 + -1.0);
  }
  double v21 = v20 + v13;
  double v22 = [(AXColorChooserCell *)self textLabel];
  objc_msgSend(v22, "setFrame:", v21, v15, v17, v19);
}

- (AXColorCircle)circle
{
  return self->_circle;
}

- (void)setCircle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end