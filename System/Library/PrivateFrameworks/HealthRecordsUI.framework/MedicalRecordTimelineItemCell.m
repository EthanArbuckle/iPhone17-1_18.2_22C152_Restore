@interface MedicalRecordTimelineItemCell
- (_TtC15HealthRecordsUI29MedicalRecordTimelineItemCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI29MedicalRecordTimelineItemCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)awakeFromNib;
@end

@implementation MedicalRecordTimelineItemCell

- (_TtC15HealthRecordsUI29MedicalRecordTimelineItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI29MedicalRecordTimelineItemCell *)sub_1C2427F30(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI29MedicalRecordTimelineItemCell)initWithCoder:(id)a3
{
  return (_TtC15HealthRecordsUI29MedicalRecordTimelineItemCell *)sub_1C2428310(a3);
}

- (void)awakeFromNib
{
  v2 = self;
  sub_1C2428488();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1C254E690();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254E680();
  v8 = self;
  sub_1C230BE90((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI29MedicalRecordTimelineItemCell_titleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI29MedicalRecordTimelineItemCell_valueView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI29MedicalRecordTimelineItemCell_subtitleLabel));
  sub_1C229B07C((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI29MedicalRecordTimelineItemCell_item, (unint64_t *)&qword_1EA2E5330, (unint64_t *)&qword_1EA2DED90);
  v3 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI29MedicalRecordTimelineItemCell_sectionContext;
  sub_1C225F194((uint64_t)v3);
}

@end