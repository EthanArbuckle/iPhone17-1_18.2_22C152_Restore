@interface GEOMapDataSubscriptionUpdateSession
- (GEOMapDataSubscriptionUpdateSession)initWithSubscriptions:(id)a3 downloadMode:(unint64_t)a4 updateType:(int64_t)a5 auditToken:(id)a6 backgroundTask:(id)a7 delegate:(id)a8 delegateQueue:(id)a9;
- (NSDictionary)offlineDataVersions;
- (int64_t)updateType;
- (void)setOfflineDataVersions:(id)a3;
@end

@implementation GEOMapDataSubscriptionUpdateSession

- (GEOMapDataSubscriptionUpdateSession)initWithSubscriptions:(id)a3 downloadMode:(unint64_t)a4 updateType:(int64_t)a5 auditToken:(id)a6 backgroundTask:(id)a7 delegate:(id)a8 delegateQueue:(id)a9
{
  v14.receiver = self;
  v14.super_class = (Class)GEOMapDataSubscriptionUpdateSession;
  v10 = [(GEOMapDataSubscriptionDownloadGroup *)&v14 initWithSubscriptions:a3 downloadMode:a4 auditToken:a6 backgroundTask:a7 delegate:a8 delegateQueue:a9];
  v11 = v10;
  if (v10)
  {
    v10->_updateType = a5;
    v12 = v10;
  }

  return v11;
}

- (int64_t)updateType
{
  return self->_updateType;
}

- (NSDictionary)offlineDataVersions
{
  return self->_offlineDataVersions;
}

- (void)setOfflineDataVersions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end