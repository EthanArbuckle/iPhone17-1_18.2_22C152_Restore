@interface ButtonCell
- (_TtC15HealthRecordsUI10ButtonCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI10ButtonCell)initWithFrame:(CGRect)a3;
@end

@implementation ButtonCell

- (_TtC15HealthRecordsUI10ButtonCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI10ButtonCell *)sub_1C252D534(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI10ButtonCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C252E384();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI10ButtonCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI10ButtonCell____lazy_storage___spinnerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI10ButtonCell_titleLabelLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI10ButtonCell_nonBusyTitleLabelColor));
  id v3 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI10ButtonCell_item;
  sub_1C2227100((uint64_t)v3);
}

@end