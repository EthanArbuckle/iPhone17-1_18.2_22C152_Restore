@interface GEOWiFiQualityServiceDataRequestConfig
- ($D10D8C5E6DF5C70B839224840994203A)dataRequestKindForRequest:(id)a3 traits:(id)a4;
- (id)serviceTypeNumber;
- (unint64_t)urlType;
@end

@implementation GEOWiFiQualityServiceDataRequestConfig

- (unint64_t)urlType
{
  return 41;
}

- (id)serviceTypeNumber
{
  return +[NSNumber numberWithInt:23];
}

- ($D10D8C5E6DF5C70B839224840994203A)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($D10D8C5E6DF5C70B839224840994203A)2856;
}

@end