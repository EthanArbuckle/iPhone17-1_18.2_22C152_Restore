@interface MedicalRecordTimelineChartItemCell
- (_TtC15HealthRecordsUI34MedicalRecordTimelineChartItemCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI34MedicalRecordTimelineChartItemCell)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
@end

@implementation MedicalRecordTimelineChartItemCell

- (_TtC15HealthRecordsUI34MedicalRecordTimelineChartItemCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI34MedicalRecordTimelineChartItemCell_item;
  v9 = (objc_class *)type metadata accessor for MedicalRecordTimelineChartItemCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[MedicalRecordTimelineChartItemCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_1C2532A1C();

  return v10;
}

- (_TtC15HealthRecordsUI34MedicalRecordTimelineChartItemCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI34MedicalRecordTimelineChartItemCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for MedicalRecordTimelineChartItemCell();
  id v5 = a3;
  v6 = [(MedicalRecordTimelineChartItemCell *)&v10 initWithCoder:v5];
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    sub_1C2532A1C();
  }
  return v7;
}

- (void)didMoveToSuperview
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MedicalRecordTimelineChartItemCell();
  id v2 = v7.receiver;
  [(MedicalRecordTimelineChartItemCell *)&v7 didMoveToSuperview];
  uint64_t v3 = (uint64_t)v2 + OBJC_IVAR____TtC15HealthRecordsUI34MedicalRecordTimelineChartItemCell_item;
  swift_beginAccess();
  sub_1C2227014(v3, (uint64_t)v5);
  uint64_t v4 = v6;
  sub_1C2227100((uint64_t)v5);
  if (v4) {
    sub_1C25334A8();
  }
}

- (void).cxx_destruct
{
}

@end