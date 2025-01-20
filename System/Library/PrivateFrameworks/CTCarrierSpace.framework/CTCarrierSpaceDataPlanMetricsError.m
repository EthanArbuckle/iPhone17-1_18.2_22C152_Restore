@interface CTCarrierSpaceDataPlanMetricsError
+ (id)errorDescriptionForCode:(int64_t)a3;
@end

@implementation CTCarrierSpaceDataPlanMetricsError

+ (id)errorDescriptionForCode:(int64_t)a3
{
  if ((unint64_t)a3 > 0x12) {
    return @"Unknown Error";
  }
  else {
    return off_264200908[a3];
  }
}

@end