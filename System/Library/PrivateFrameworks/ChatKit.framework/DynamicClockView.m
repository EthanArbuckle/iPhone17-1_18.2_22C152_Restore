@interface DynamicClockView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC7ChatKit16DynamicClockView)initWithCoder:(id)a3;
- (_TtC7ChatKit16DynamicClockView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
@end

@implementation DynamicClockView

- (_TtC7ChatKit16DynamicClockView)initWithFrame:(CGRect)a3
{
}

- (_TtC7ChatKit16DynamicClockView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18F5576C0(0xD000000000000025, 0x800000018F888790);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18F555F38();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_18F554ED8(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_18F556128();
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC7ChatKit16DynamicClockView_currentDate;
  uint64_t v4 = sub_18F7B61D0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit16DynamicClockView_behavior);

  double v6 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit16DynamicClockView_packageLayer);
}

@end