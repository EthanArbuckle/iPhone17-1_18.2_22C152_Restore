@interface NSMeasurement(GEOExtras)
+ (id)_geo_distanceMeasurementForMeters:()GEOExtras;
@end

@implementation NSMeasurement(GEOExtras)

+ (id)_geo_distanceMeasurementForMeters:()GEOExtras
{
  id v2 = objc_alloc(MEMORY[0x1E4F28E28]);
  v3 = [MEMORY[0x1E4F291E0] meters];
  v4 = (void *)[v2 initWithDoubleValue:v3 unit:a1];

  return v4;
}

@end