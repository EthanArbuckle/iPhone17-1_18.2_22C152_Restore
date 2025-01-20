@interface RecordReferenceRangeCell
+ (NSString)reuseIdentifier;
- (HKInspectableValueInRange)valueInRange;
- (_TtC15HealthRecordsUI24RecordReferenceRangeCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI24RecordReferenceRangeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setValueInRange:(id)a3;
@end

@implementation RecordReferenceRangeCell

+ (NSString)reuseIdentifier
{
  v2 = (void *)sub_1C254F430();
  return (NSString *)v2;
}

- (HKInspectableValueInRange)valueInRange
{
  v2 = (id *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC15HealthRecordsUI24RecordReferenceRangeCell_valueInRange);
  swift_beginAccess();
  return (HKInspectableValueInRange *)*v2;
}

- (void)setValueInRange:(id)a3
{
  v5 = (void **)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC15HealthRecordsUI24RecordReferenceRangeCell_valueInRange);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  id v7 = a3;
  v8 = self;

  sub_1C2535008();
}

- (_TtC15HealthRecordsUI24RecordReferenceRangeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC15HealthRecordsUI24RecordReferenceRangeCell *)sub_1C2536A9C((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))RecordReferenceRangeCell.init(style:reuseIdentifier:));
}

- (_TtC15HealthRecordsUI24RecordReferenceRangeCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI24RecordReferenceRangeCell_valueInRange) = 0;
  id v4 = a3;

  result = (_TtC15HealthRecordsUI24RecordReferenceRangeCell *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI24RecordReferenceRangeCell_expandedRangeValueView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI24RecordReferenceRangeCell_valueInRange);
}

@end