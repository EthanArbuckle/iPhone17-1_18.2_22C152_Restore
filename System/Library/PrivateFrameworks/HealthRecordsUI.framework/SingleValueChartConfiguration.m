@interface SingleValueChartConfiguration
- (BOOL)shouldShowOutOfRangeOverlay;
- (Class)chartControllerClass;
- (_TtC15HealthRecordsUI29SingleValueChartConfiguration)init;
- (_TtP15HealthRecordsUI33MedicalRecordChartDataTransformer_)dataTransformer;
@end

@implementation SingleValueChartConfiguration

- (Class)chartControllerClass
{
  sub_1C229E704();
  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)shouldShowOutOfRangeOverlay
{
  return 1;
}

- (_TtP15HealthRecordsUI33MedicalRecordChartDataTransformer_)dataTransformer
{
  type metadata accessor for SingleValueDataTransformer();
  v2 = (void *)swift_allocObject();
  return (_TtP15HealthRecordsUI33MedicalRecordChartDataTransformer_ *)v2;
}

- (_TtC15HealthRecordsUI29SingleValueChartConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SingleValueChartConfiguration();
  return [(SingleValueChartConfiguration *)&v3 init];
}

@end