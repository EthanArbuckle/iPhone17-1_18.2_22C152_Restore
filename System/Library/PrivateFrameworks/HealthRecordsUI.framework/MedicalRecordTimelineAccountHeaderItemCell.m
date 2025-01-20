@interface MedicalRecordTimelineAccountHeaderItemCell
- (_TtC15HealthRecordsUI42MedicalRecordTimelineAccountHeaderItemCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI42MedicalRecordTimelineAccountHeaderItemCell)initWithFrame:(CGRect)a3;
@end

@implementation MedicalRecordTimelineAccountHeaderItemCell

- (_TtC15HealthRecordsUI42MedicalRecordTimelineAccountHeaderItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI42MedicalRecordTimelineAccountHeaderItemCell *)sub_1C2271200(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI42MedicalRecordTimelineAccountHeaderItemCell)initWithCoder:(id)a3
{
  return (_TtC15HealthRecordsUI42MedicalRecordTimelineAccountHeaderItemCell *)sub_1C22715C4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI42MedicalRecordTimelineAccountHeaderItemCell_accountView));
  sub_1C2272220((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI42MedicalRecordTimelineAccountHeaderItemCell_item, (unint64_t *)&qword_1EA2E5330, (void (*)(uint64_t))sub_1C22270A8);
}

@end