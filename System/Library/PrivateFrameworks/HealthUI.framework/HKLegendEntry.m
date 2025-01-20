@interface HKLegendEntry
+ (id)legendEntryWithTitle:(id)a3 dotColor:(id)a4 innerDotColor:(id)a5;
+ (id)legendEntryWithTitle:(id)a3 icon:(id)a4 iconTint:(id)a5;
+ (id)legendEntryWithTitle:(id)a3 labelColor:(id)a4;
- (BOOL)isEqual:(id)a3;
- (HKLegendEntry)initWithTitle:(id)a3 dotColor:(id)a4 innerDotColor:(id)a5 labelColor:(id)a6 icon:(id)a7 iconTint:(id)a8;
- (NSString)title;
- (UIColor)dotColor;
- (UIColor)iconTint;
- (UIColor)innerDotColor;
- (UIColor)labelColor;
- (UIImage)icon;
- (void)setDotColor:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIconTint:(id)a3;
- (void)setInnerDotColor:(id)a3;
- (void)setLabelColor:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation HKLegendEntry

+ (id)legendEntryWithTitle:(id)a3 dotColor:(id)a4 innerDotColor:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[HKLegendEntry alloc] initWithTitle:v9 dotColor:v8 innerDotColor:v7 labelColor:0 icon:0 iconTint:0];

  return v10;
}

+ (id)legendEntryWithTitle:(id)a3 labelColor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[HKLegendEntry alloc] initWithTitle:v6 dotColor:0 innerDotColor:0 labelColor:v5 icon:0 iconTint:0];

  return v7;
}

+ (id)legendEntryWithTitle:(id)a3 icon:(id)a4 iconTint:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[HKLegendEntry alloc] initWithTitle:v9 dotColor:0 innerDotColor:0 labelColor:0 icon:v8 iconTint:v7];

  return v10;
}

- (HKLegendEntry)initWithTitle:(id)a3 dotColor:(id)a4 innerDotColor:(id)a5 labelColor:(id)a6 icon:(id)a7 iconTint:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HKLegendEntry;
  v20 = [(HKLegendEntry *)&v23 init];
  v21 = v20;
  if (v20)
  {
    [(HKLegendEntry *)v20 setTitle:v14];
    [(HKLegendEntry *)v21 setDotColor:v15];
    [(HKLegendEntry *)v21 setInnerDotColor:v16];
    [(HKLegendEntry *)v21 setLabelColor:v17];
    [(HKLegendEntry *)v21 setIcon:v18];
    [(HKLegendEntry *)v21 setIconTint:v19];
  }

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [(HKLegendEntry *)self title];
  id v6 = [v4 title];
  if (v5 == v6)
  {
    int v10 = 0;
  }
  else
  {
    id v7 = [(HKLegendEntry *)self title];
    id v8 = [v4 title];
    int v9 = [v7 isEqual:v8];

    int v10 = v9 ^ 1;
  }

  v11 = [(HKLegendEntry *)self dotColor];
  v12 = [v4 dotColor];
  if (v11 == v12)
  {
    int v16 = 0;
  }
  else
  {
    v13 = [(HKLegendEntry *)self dotColor];
    id v14 = [v4 dotColor];
    int v15 = [v13 isEqual:v14];

    int v16 = v15 ^ 1;
  }

  id v17 = [(HKLegendEntry *)self labelColor];
  id v18 = [v4 labelColor];
  if (v17 == v18)
  {
    char v21 = 1;
  }
  else
  {
    id v19 = [(HKLegendEntry *)self labelColor];
    v20 = [v4 labelColor];
    char v21 = [v19 isEqual:v20];
  }
  v22 = [(HKLegendEntry *)self icon];
  objc_super v23 = [v4 icon];

  if ((v10 | v16))
  {
    BOOL v24 = 0;
  }
  else if (v22 == v23)
  {
    BOOL v24 = v21;
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UIColor)dotColor
{
  return self->_dotColor;
}

- (void)setDotColor:(id)a3
{
}

- (UIColor)innerDotColor
{
  return self->_innerDotColor;
}

- (void)setInnerDotColor:(id)a3
{
}

- (UIColor)labelColor
{
  return self->_labelColor;
}

- (void)setLabelColor:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (UIColor)iconTint
{
  return self->_iconTint;
}

- (void)setIconTint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconTint, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_labelColor, 0);
  objc_storeStrong((id *)&self->_innerDotColor, 0);
  objc_storeStrong((id *)&self->_dotColor, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end