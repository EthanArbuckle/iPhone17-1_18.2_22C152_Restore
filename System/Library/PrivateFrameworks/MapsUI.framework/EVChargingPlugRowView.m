@interface EVChargingPlugRowView
- (_TtC6MapsUI21EVChargingPlugRowView)initWithCoder:(id)a3;
- (_TtC6MapsUI21EVChargingPlugRowView)initWithFrame:(CGRect)a3;
@end

@implementation EVChargingPlugRowView

- (_TtC6MapsUI21EVChargingPlugRowView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC6MapsUI21EVChargingPlugRowView_areLabelsArrangedVertically) = 0;
  v4 = (objc_class *)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI21EVChargingPlugRowView_horizontalArrangementConstraints) = (Class)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI21EVChargingPlugRowView_verticalArrangementConstraints) = v4;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI21EVChargingPlugRowView____lazy_storage___leadingOrTopLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI21EVChargingPlugRowView____lazy_storage___trailingOrBottomLabel) = 0;
  id v5 = a3;

  result = (_TtC6MapsUI21EVChargingPlugRowView *)sub_1933417B0();
  __break(1u);
  return result;
}

- (_TtC6MapsUI21EVChargingPlugRowView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC6MapsUI21EVChargingPlugRowView_leadingText;
  uint64_t v4 = sub_193340DB0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MapsUI21EVChargingPlugRowView_trailingText));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MapsUI21EVChargingPlugRowView____lazy_storage___leadingOrTopLabel));
  id v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6MapsUI21EVChargingPlugRowView____lazy_storage___trailingOrBottomLabel);
}

@end