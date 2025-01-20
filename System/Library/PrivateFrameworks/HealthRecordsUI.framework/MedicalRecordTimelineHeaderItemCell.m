@interface MedicalRecordTimelineHeaderItemCell
- (_TtC15HealthRecordsUI35MedicalRecordTimelineHeaderItemCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI35MedicalRecordTimelineHeaderItemCell)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MedicalRecordTimelineHeaderItemCell

- (_TtC15HealthRecordsUI35MedicalRecordTimelineHeaderItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI35MedicalRecordTimelineHeaderItemCell *)MedicalRecordTimelineHeaderItemCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI35MedicalRecordTimelineHeaderItemCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C249DC0C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1C249C298(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI35MedicalRecordTimelineHeaderItemCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI35MedicalRecordTimelineHeaderItemCell____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI35MedicalRecordTimelineHeaderItemCell____lazy_storage___separatorView));
  swift_bridgeObjectRelease();
  sub_1C249D430((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI35MedicalRecordTimelineHeaderItemCell_item, (unint64_t *)&qword_1EA2E5330, (void (*)(uint64_t))sub_1C22270A8);
  sub_1C249D430((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI35MedicalRecordTimelineHeaderItemCell_sectionContext, &qword_1EA2DF2E0, MEMORY[0x1E4F66300]);
}

@end