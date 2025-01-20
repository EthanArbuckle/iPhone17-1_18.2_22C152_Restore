@interface MedicationChartDataFormatter
- (_TtC19HealthMedicationsUI28MedicationChartDataFormatter)init;
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4;
@end

@implementation MedicationChartDataFormatter

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationChartDataFormatter____lazy_storage___numberFormatter));
}

- (_TtC19HealthMedicationsUI28MedicationChartDataFormatter)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationChartDataFormatter____lazy_storage___numberFormatter) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MedicationChartDataFormatter();
  return [(MedicationChartDataFormatter *)&v3 init];
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  sub_1C1FF0138();
  unint64_t v6 = sub_1C214A780();
  v7 = self;
  sub_1C1FEF0D0(v6, (uint64_t *)a4);

  swift_bridgeObjectRelease();
  sub_1C1F12718(0, &qword_1EA2C4FD0);
  v8 = (void *)sub_1C214A770();
  swift_bridgeObjectRelease();

  return v8;
}

@end