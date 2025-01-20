@interface GEOThrottlerServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (void)isSafeWithRequest:(id)a3;
@end

@implementation GEOThrottlerServer

+ (id)identifier
{
  return @"throttler";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (sub_100008D68(v10) == 603)
  {
    uint64_t v13 = objc_opt_class();
    v14 = sub_100008DBC(@"throttler", v10, v11, v13, v12);
    v15 = v14;
    BOOL v16 = v14 != 0;
    if (v14)
    {
      [v14 setSignpostId:a6];
      [(GEOThrottlerServer *)self isSafeWithRequest:v15];
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)isSafeWithRequest:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 requestKindType];
  id v5 = [v3 requestKindSubtype];
  id v6 = [objc_alloc((Class)GEOThrottlerIsSafeReply) initWithRequest:v3];
  if ([v3 includeToken])
  {
    v7 = [v3 throttlerToken];
    v8 = +[GEODataRequestThrottler sharedThrottler];
    v9 = [v3 preferredAuditToken];
    id v19 = 0;
    id v20 = v7;
    [v8 allowRequest:v4 | ((void)v5 << 32) forClient:v9 throttlerToken:&v20 error:&v19];
    id v10 = v20;

    id v11 = v19;
    [v6 setThrottlerToken:v10];
    [v6 setError:v11];
  }
  if (([v3 availableRequestCount] & 1) != 0
    || [v3 nextSafeRequestTime])
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v18 = 0.0;
    unsigned int v17 = 0;
    uint64_t v13 = +[GEODataRequestThrottler sharedThrottler];
    v14 = [v3 preferredAuditToken];
    [v13 getInfoForRequest:v4 | ((void)v5 << 32) client:v14 timeUntilNextReset:&v18 availableRequestCount:&v17];

    [v6 setAvailableRequestCount:v17];
    unsigned int v15 = [v6 availableRequestCount];
    double v16 = v18;
    if (v15) {
      double v16 = -0.0;
    }
    [v6 setNextSafeRequestTime:Current + v16];
  }
  [v6 send];
}

@end