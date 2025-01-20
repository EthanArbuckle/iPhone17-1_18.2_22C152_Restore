@interface _GEOSimpleETARequestConfig
- ($D10D8C5E6DF5C70B839224840994203A)dataRequestKindForRequest:(id)a3 traits:(id)a4;
- (BOOL)supportsOffline;
- (id)offlineTaskQueue;
- (id)serviceTypeNumber;
- (unint64_t)urlType;
@end

@implementation _GEOSimpleETARequestConfig

- (unint64_t)urlType
{
  return 18;
}

- (id)serviceTypeNumber
{
  return &off_100077460;
}

- ($D10D8C5E6DF5C70B839224840994203A)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($D10D8C5E6DF5C70B839224840994203A)672;
}

- (BOOL)supportsOffline
{
  return 1;
}

- (id)offlineTaskQueue
{
  id UInteger = (id)GEOConfigGetUInteger();
  if (UInteger)
  {
    if (qword_100084980 != -1) {
      dispatch_once(&qword_100084980, &stru_100073660);
    }
    id UInteger = (id)qword_100084970;
  }

  return UInteger;
}

@end