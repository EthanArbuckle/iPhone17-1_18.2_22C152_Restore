@interface DisplayAlertButton
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (_TtC17ContinuityDisplay18DisplayAlertButton)initWithCoder:(id)a3;
- (_TtC17ContinuityDisplay18DisplayAlertButton)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation DisplayAlertButton

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  v8 = self;
  v9 = sub_100022BB8(x, y);

  return v9;
}

- (BOOL)isHighlighted
{
  v2 = self;
  unsigned __int8 v3 = sub_100022EF8((SEL *)&selRef_isHighlighted);

  return v3 & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_100022F90(a3, (SEL *)&selRef_setHighlighted_);
}

- (BOOL)isSelected
{
  v2 = self;
  unsigned __int8 v3 = sub_100022EF8((SEL *)&selRef_isSelected);

  return v3 & 1;
}

- (void)setSelected:(BOOL)a3
{
  v4 = self;
  sub_100022F90(a3, (SEL *)&selRef_setSelected_);
}

- (_TtC17ContinuityDisplay18DisplayAlertButton)initWithFrame:(CGRect)a3
{
  return (_TtC17ContinuityDisplay18DisplayAlertButton *)sub_100023174(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17ContinuityDisplay18DisplayAlertButton)initWithCoder:(id)a3
{
  return (_TtC17ContinuityDisplay18DisplayAlertButton *)sub_1000231FC(a3);
}

@end