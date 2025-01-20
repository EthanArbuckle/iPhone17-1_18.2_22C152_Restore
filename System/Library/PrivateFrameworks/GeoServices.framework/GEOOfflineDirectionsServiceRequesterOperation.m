@interface GEOOfflineDirectionsServiceRequesterOperation
- (GEOOfflineDirectionsServiceRequesterOperation)initWithRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 config:(id)a6 throttleToken:(id)a7 options:(unint64_t)a8 willSendRequestHandler:(id)a9 validationHandler:(id)a10 completionHandler:(id)a11;
- (void)_recordAnalyticsDataForResponse:(id)a3;
@end

@implementation GEOOfflineDirectionsServiceRequesterOperation

- (GEOOfflineDirectionsServiceRequesterOperation)initWithRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 config:(id)a6 throttleToken:(id)a7 options:(unint64_t)a8 willSendRequestHandler:(id)a9 validationHandler:(id)a10 completionHandler:(id)a11
{
  id v17 = a5;
  v23.receiver = self;
  v23.super_class = (Class)GEOOfflineDirectionsServiceRequesterOperation;
  v18 = [(GEOOfflineServiceRequesterOperation *)&v23 initWithRequest:a3 traits:a4 auditToken:v17 config:a6 throttleToken:a7 options:a8 willSendRequestHandler:a9 validationHandler:a10 completionHandler:a11];
  if (v18)
  {
    v19 = [v17 offlineCohortId];
    uint64_t v20 = [v19 copy];
    offlineCohortId = v18->_offlineCohortId;
    v18->_offlineCohortId = (NSString *)v20;
  }
  return v18;
}

- (void)_recordAnalyticsDataForResponse:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v5 = v8;
  if (isKindOfClass)
  {
    id v6 = v8;
    if ([v6 hasAnalyticData])
    {
      v7 = [v6 analyticData];
      +[GEORequestResponseMetadataRecorder recordDirectionsRequestResponseAnalyticsData:v7 forCohortId:self->_offlineCohortId];
    }
    v5 = v8;
  }
}

- (void).cxx_destruct
{
}

@end