@interface RecordSourceCell
- (_TtC15HealthRecordsUI16RecordSourceCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI16RecordSourceCell)initWithFrame:(CGRect)a3;
@end

@implementation RecordSourceCell

- (_TtC15HealthRecordsUI16RecordSourceCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI16RecordSourceCell *)sub_1C22C1CE8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI16RecordSourceCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI16RecordSourceCell____lazy_storage___brandView) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI16RecordSourceCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC15HealthRecordsUI16RecordSourceCell *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI16RecordSourceCell____lazy_storage___brandView));
  v3 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI16RecordSourceCell_item;
  sub_1C2227100((uint64_t)v3);
}

@end