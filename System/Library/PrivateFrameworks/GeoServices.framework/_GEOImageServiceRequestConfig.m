@interface _GEOImageServiceRequestConfig
+ (id)standardConfig;
- ($D10D8C5E6DF5C70B839224840994203A)dataRequestKindForRequest:(id)a3 traits:(id)a4;
- (id)serviceTypeNumber;
- (unint64_t)urlType;
@end

@implementation _GEOImageServiceRequestConfig

+ (id)standardConfig
{
  if (qword_1000848D8 != -1) {
    dispatch_once(&qword_1000848D8, &stru_100072EF0);
  }
  v2 = (void *)qword_1000848E0;

  return v2;
}

- (unint64_t)urlType
{
  return 37;
}

- (id)serviceTypeNumber
{
  return &off_100077430;
}

- ($D10D8C5E6DF5C70B839224840994203A)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($D10D8C5E6DF5C70B839224840994203A)2854;
}

@end