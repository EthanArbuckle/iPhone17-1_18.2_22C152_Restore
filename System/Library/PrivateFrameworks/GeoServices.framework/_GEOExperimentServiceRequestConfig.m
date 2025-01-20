@interface _GEOExperimentServiceRequestConfig
+ (id)standardConfig;
- ($D10D8C5E6DF5C70B839224840994203A)dataRequestKindForRequest:(id)a3 traits:(id)a4;
- (id)serviceTypeNumber;
- (unint64_t)urlType;
@end

@implementation _GEOExperimentServiceRequestConfig

+ (id)standardConfig
{
  if (qword_100084728 != -1) {
    dispatch_once(&qword_100084728, &stru_1000715C0);
  }
  v2 = (void *)qword_100084730;

  return v2;
}

- (unint64_t)urlType
{
  return 26;
}

- ($D10D8C5E6DF5C70B839224840994203A)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($D10D8C5E6DF5C70B839224840994203A)2850;
}

- (id)serviceTypeNumber
{
  return &off_1000773A0;
}

@end