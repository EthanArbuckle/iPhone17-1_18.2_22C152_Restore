@interface _GEOLocationShiftRequestConfig
+ (id)standardConfig;
- ($D10D8C5E6DF5C70B839224840994203A)dataRequestKindForRequest:(id)a3 traits:(id)a4;
- (id)serviceTypeNumber;
- (int64_t)companionRequestType;
- (unint64_t)urlType;
@end

@implementation _GEOLocationShiftRequestConfig

+ (id)standardConfig
{
  if (qword_100084848 != -1) {
    dispatch_once(&qword_100084848, &stru_100072208);
  }
  v2 = (void *)qword_100084850;

  return v2;
}

- (id)serviceTypeNumber
{
  return +[NSNumber numberWithInt:17];
}

- (unint64_t)urlType
{
  return 15;
}

- ($D10D8C5E6DF5C70B839224840994203A)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($D10D8C5E6DF5C70B839224840994203A)2851;
}

- (int64_t)companionRequestType
{
  return 3;
}

@end