@interface _GEOMapDataSubscriptionQueuedDownload
- (GEOApplicationAuditToken)auditToken;
- (GEOMapDataSubscription)subscription;
- (_GEOMapDataSubscriptionQueuedDownload)initWithSubscription:(id)a3 auditToken:(id)a4;
@end

@implementation _GEOMapDataSubscriptionQueuedDownload

- (_GEOMapDataSubscriptionQueuedDownload)initWithSubscription:(id)a3 auditToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_GEOMapDataSubscriptionQueuedDownload;
  v9 = [(_GEOMapDataSubscriptionQueuedDownload *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_subscription, a3);
    objc_storeStrong((id *)&v10->_auditToken, a4);
    v11 = v10;
  }

  return v10;
}

- (GEOMapDataSubscription)subscription
{
  return self->_subscription;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);

  objc_storeStrong((id *)&self->_subscription, 0);
}

@end