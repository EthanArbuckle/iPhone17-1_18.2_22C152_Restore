@interface CTSweetgumDataPlanMetricsError
+ (id)errorDescriptionForCode:(int64_t)a3;
@end

@implementation CTSweetgumDataPlanMetricsError

+ (id)errorDescriptionForCode:(int64_t)a3
{
  if ((unint64_t)a3 > 0x12) {
    return @"Unknown Error";
  }
  else {
    return (id)*((void *)&off_1E5260EC8 + a3);
  }
}

@end