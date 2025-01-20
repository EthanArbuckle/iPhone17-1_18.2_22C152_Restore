@interface ComplicationsLabel
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC11ClockPoster18ComplicationsLabel)initWithCoder:(id)a3;
- (_TtC11ClockPoster18ComplicationsLabel)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ComplicationsLabel

- (_TtC11ClockPoster18ComplicationsLabel)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11ClockPoster18ComplicationsLabel_contentsSpacing) = (Class)0x4020000000000000;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11ClockPoster18ComplicationsLabel_orderedContents) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11ClockPoster18ComplicationsLabel_complicationViews) = (Class)MEMORY[0x263F8EE78];
  id v4 = a3;

  result = (_TtC11ClockPoster18ComplicationsLabel *)sub_24A057BC8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_249F9C764();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_249F9C96C(0, width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (_TtC11ClockPoster18ComplicationsLabel)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC11ClockPoster18ComplicationsLabel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end