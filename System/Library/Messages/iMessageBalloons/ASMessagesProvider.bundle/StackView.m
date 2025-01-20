@interface StackView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)accessibilityNonHiddenSubviews;
- (_TtC18ASMessagesProvider9StackView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider9StackView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation StackView

- (_TtC18ASMessagesProvider9StackView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider9StackView_distribution;
  *(void *)v7 = 0;
  v7[8] = 1;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider9StackView_axis) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider9StackView_alignment) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider9StackView_spacing) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for StackView();
  return -[StackView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC18ASMessagesProvider9StackView)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider9StackView_distribution;
  *(void *)v4 = 0;
  v4[8] = 1;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider9StackView_axis) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider9StackView_alignment) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider9StackView_spacing) = 0;
  id v5 = a3;

  result = (_TtC18ASMessagesProvider9StackView *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StackView();
  id v2 = v3.receiver;
  [(StackView *)&v3 layoutSubviews];
  sub_4FD5B8();
  sub_4FD734();
  sub_4FD9F8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider9StackView_spacing);
  v6 = self;
  sub_4FDE18(width, height, v5);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (NSArray)accessibilityNonHiddenSubviews
{
  id v2 = self;
  sub_4FD3E0();

  sub_2C368();
  v3.super.isa = sub_77D880().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

@end