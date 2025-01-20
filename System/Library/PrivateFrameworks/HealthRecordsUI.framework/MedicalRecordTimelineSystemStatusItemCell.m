@interface MedicalRecordTimelineSystemStatusItemCell
- (_TtC15HealthRecordsUI41MedicalRecordTimelineSystemStatusItemCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI41MedicalRecordTimelineSystemStatusItemCell)initWithFrame:(CGRect)a3;
@end

@implementation MedicalRecordTimelineSystemStatusItemCell

- (_TtC15HealthRecordsUI41MedicalRecordTimelineSystemStatusItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI41MedicalRecordTimelineSystemStatusItemCell *)sub_1C250506C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI41MedicalRecordTimelineSystemStatusItemCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI41MedicalRecordTimelineSystemStatusItemCell____lazy_storage___spinner) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI41MedicalRecordTimelineSystemStatusItemCell____lazy_storage___titleLabel) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI41MedicalRecordTimelineSystemStatusItemCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC15HealthRecordsUI41MedicalRecordTimelineSystemStatusItemCell *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI41MedicalRecordTimelineSystemStatusItemCell____lazy_storage___spinner));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI41MedicalRecordTimelineSystemStatusItemCell____lazy_storage___titleLabel));
  v3 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI41MedicalRecordTimelineSystemStatusItemCell_item;
  sub_1C2227100((uint64_t)v3);
}

@end