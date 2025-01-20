@interface StackedTwoLabelView
- (_TtC15HealthRecordsUI19StackedTwoLabelView)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI19StackedTwoLabelView)initWithFrame:(CGRect)a3;
@end

@implementation StackedTwoLabelView

- (_TtC15HealthRecordsUI19StackedTwoLabelView)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI19StackedTwoLabelView *)sub_1C24833A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI19StackedTwoLabelView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI19StackedTwoLabelView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI19StackedTwoLabelView____lazy_storage___subtitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI19StackedTwoLabelView____lazy_storage___titleHorizontalConstraints) = 0;
  id v4 = a3;

  result = (_TtC15HealthRecordsUI19StackedTwoLabelView *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI19StackedTwoLabelView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI19StackedTwoLabelView____lazy_storage___subtitleLabel));
  swift_bridgeObjectRelease();
}

@end