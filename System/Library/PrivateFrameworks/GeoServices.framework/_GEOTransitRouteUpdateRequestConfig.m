@interface _GEOTransitRouteUpdateRequestConfig
+ (id)standardConfig;
- ($D10D8C5E6DF5C70B839224840994203A)dataRequestKindForRequest:(id)a3 traits:(id)a4;
- (id)debugRequestName;
- (id)serviceTypeNumber;
- (unint64_t)urlType;
@end

@implementation _GEOTransitRouteUpdateRequestConfig

+ (id)standardConfig
{
  if (qword_100084950 != -1) {
    dispatch_once(&qword_100084950, &stru_1000735F8);
  }
  v2 = (void *)qword_100084958;

  return v2;
}

- (unint64_t)urlType
{
  return 2;
}

- (id)debugRequestName
{
  return @"TransitUpdateRequest";
}

- (id)serviceTypeNumber
{
  return &off_100077448;
}

- ($D10D8C5E6DF5C70B839224840994203A)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($D10D8C5E6DF5C70B839224840994203A)2857;
}

@end