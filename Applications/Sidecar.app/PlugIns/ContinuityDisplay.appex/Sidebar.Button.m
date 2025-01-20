@interface Sidebar.Button
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (_TtCO17ContinuityDisplay7Sidebar6Button)initWithCoder:(id)a3;
- (_TtCO17ContinuityDisplay7Sidebar6Button)initWithFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation Sidebar.Button

- (_TtCO17ContinuityDisplay7Sidebar6Button)initWithCoder:(id)a3
{
}

- (BOOL)isHighlighted
{
  v2 = self;
  unsigned __int8 v3 = sub_10003E830((SEL *)&selRef_isHighlighted);

  return v3 & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_10003E8C8(a3, (SEL *)&selRef_setHighlighted_);
}

- (BOOL)isSelected
{
  v2 = self;
  unsigned __int8 v3 = sub_10003E830((SEL *)&selRef_isSelected);

  return v3 & 1;
}

- (void)setSelected:(BOOL)a3
{
  v4 = self;
  sub_10003E8C8(a3, (SEL *)&selRef_setSelected_);
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  unsigned __int8 v3 = self;
  sub_10003EA48();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (_TtCO17ContinuityDisplay7Sidebar6Button)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
}

@end