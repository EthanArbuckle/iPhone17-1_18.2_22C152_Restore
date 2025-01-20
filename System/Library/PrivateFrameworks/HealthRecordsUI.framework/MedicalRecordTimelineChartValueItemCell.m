@interface MedicalRecordTimelineChartValueItemCell
- (_TtC15HealthRecordsUI39MedicalRecordTimelineChartValueItemCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI39MedicalRecordTimelineChartValueItemCell)initWithFrame:(CGRect)a3;
- (void)awakeFromNib;
@end

@implementation MedicalRecordTimelineChartValueItemCell

- (_TtC15HealthRecordsUI39MedicalRecordTimelineChartValueItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI39MedicalRecordTimelineChartValueItemCell *)sub_1C2380474(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI39MedicalRecordTimelineChartValueItemCell)initWithCoder:(id)a3
{
  return (_TtC15HealthRecordsUI39MedicalRecordTimelineChartValueItemCell *)sub_1C23805F8(a3);
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MedicalRecordTimelineChartValueItemCell();
  id v2 = v3.receiver;
  [(MedicalRecordTimelineChartValueItemCell *)&v3 awakeFromNib];
  sub_1C23807AC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI39MedicalRecordTimelineChartValueItemCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI39MedicalRecordTimelineChartValueItemCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI39MedicalRecordTimelineChartValueItemCell_valueTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI39MedicalRecordTimelineChartValueItemCell_valueLabel));
  sub_1C2382F3C((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI39MedicalRecordTimelineChartValueItemCell_item, (unint64_t *)&qword_1EA2E5330, (uint64_t (*)(uint64_t))sub_1C22270A8);
  sub_1C2382F3C((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI39MedicalRecordTimelineChartValueItemCell_sectionContext, &qword_1EA2DF2E0, MEMORY[0x1E4F66300]);
}

@end