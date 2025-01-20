@interface MultiValueView
- (_TtC15HealthRecordsUI14MultiValueView)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI14MultiValueView)initWithFrame:(CGRect)a3;
@end

@implementation MultiValueView

- (_TtC15HealthRecordsUI14MultiValueView)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI14MultiValueView *)MultiValueView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI14MultiValueView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15HealthRecordsUI14MultiValueView_viewData) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI14MultiValueView____lazy_storage___stackView) = 0;
  id v4 = a3;

  result = (_TtC15HealthRecordsUI14MultiValueView *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI14MultiValueView____lazy_storage___stackView);
}

@end