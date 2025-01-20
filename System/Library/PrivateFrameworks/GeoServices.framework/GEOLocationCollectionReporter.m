@interface GEOLocationCollectionReporter
+ (void)reportBatchLocationCollection:(id)a3;
+ (void)reportCalibratedPressureCollection:(id)a3;
+ (void)reportRealtimeLocationCollection:(id)a3;
@end

@implementation GEOLocationCollectionReporter

+ (void)reportRealtimeLocationCollection:(id)a3
{
  id v3 = a3;
  [getGEOAPLocationCollectionReporterClass() reportRealtimeLocationCollection:v3];
}

+ (void)reportBatchLocationCollection:(id)a3
{
  id v3 = a3;
  [getGEOAPLocationCollectionReporterClass() reportBatchLocationCollection:v3];
}

+ (void)reportCalibratedPressureCollection:(id)a3
{
  id v3 = a3;
  [getGEOAPLocationCollectionReporterClass() reportCalibratedPressureCollection:v3];
}

@end