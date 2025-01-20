@interface BloodPressureChartConfiguration
- (BOOL)shouldShowOutOfRangeOverlay;
- (Class)chartControllerClass;
- (_TtC15HealthRecordsUI31BloodPressureChartConfiguration)init;
- (_TtP15HealthRecordsUI33MedicalRecordChartDataTransformer_)dataTransformer;
@end

@implementation BloodPressureChartConfiguration

- (Class)chartControllerClass
{
  sub_1C22CE03C();
  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)shouldShowOutOfRangeOverlay
{
  return 0;
}

- (_TtP15HealthRecordsUI33MedicalRecordChartDataTransformer_)dataTransformer
{
  type metadata accessor for BloodPressureDataTransformer();
  v2 = (void *)swift_allocObject();
  v2[2] = 0;
  v2[3] = 0;
  return (_TtP15HealthRecordsUI33MedicalRecordChartDataTransformer_ *)v2;
}

- (_TtC15HealthRecordsUI31BloodPressureChartConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BloodPressureChartConfiguration();
  return [(BloodPressureChartConfiguration *)&v3 init];
}

@end