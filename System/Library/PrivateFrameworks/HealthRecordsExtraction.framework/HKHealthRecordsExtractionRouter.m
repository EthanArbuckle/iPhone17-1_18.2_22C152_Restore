@interface HKHealthRecordsExtractionRouter
- (HKHealthRecordsExtractionRouter)init;
- (id)supportedResourceTypesForRelease:(id)a3;
@end

@implementation HKHealthRecordsExtractionRouter

- (id)supportedResourceTypesForRelease:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_232F43930();

  v6 = (void *)sub_23309BB10();
  swift_bridgeObjectRelease();
  return v6;
}

- (HKHealthRecordsExtractionRouter)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HealthRecordsExtractionRouter();
  return [(HKHealthRecordsExtractionRouter *)&v3 init];
}

@end