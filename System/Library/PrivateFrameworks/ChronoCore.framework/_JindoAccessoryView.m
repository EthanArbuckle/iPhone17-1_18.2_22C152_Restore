@interface _JindoAccessoryView
- (CGRect)frame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC10ChronoCore19_JindoAccessoryView)initWithCoder:(id)a3;
- (_TtC10ChronoCore19_JindoAccessoryView)initWithFrame:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation _JindoAccessoryView

- (_TtC10ChronoCore19_JindoAccessoryView)initWithCoder:(id)a3
{
  result = (_TtC10ChronoCore19_JindoAccessoryView *)sub_1DAD28728();
  __break(1u);
  return result;
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for _JindoAccessoryView();
  [(_JindoAccessoryView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for _JindoAccessoryView();
  v7 = (char *)v10.receiver;
  -[_JindoAccessoryView setFrame:](&v10, sel_setFrame_, x, y, width, height);
  id v8 = objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC10ChronoCore19_JindoAccessoryView__hostController], sel_view, v10.receiver, v10.super_class);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v7, sel_bounds);
    objc_msgSend(v9, sel_setFrame_);
  }
  else
  {
    __break(1u);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = self;
  double v4 = sub_1DABC9160();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (_TtC10ChronoCore19_JindoAccessoryView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC10ChronoCore19_JindoAccessoryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10ChronoCore19_JindoAccessoryView__hostController);
}

@end