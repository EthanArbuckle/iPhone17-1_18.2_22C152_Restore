@interface MapDataSubscriptionInfo
- (BOOL)isEqual:(id)a3;
- (GEOMapDataSubscription)subscription;
- (GEOMapDataSubscriptionState)pairedDeviceState;
- (GEOMapDataSubscriptionState)state;
- (MapDataSubscriptionInfo)initWithSubscription:(id)a3 state:(id)a4;
- (unint64_t)hash;
- (void)setPairedDeviceState:(id)a3;
- (void)setState:(id)a3;
@end

@implementation MapDataSubscriptionInfo

- (MapDataSubscriptionInfo)initWithSubscription:(id)a3 state:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MapDataSubscriptionInfo;
  v9 = [(MapDataSubscriptionInfo *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_subscription, a3);
    objc_storeStrong((id *)&v10->_state, a4);
    v11 = v10;
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(MapDataSubscriptionInfo *)self subscription];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MapDataSubscriptionInfo *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = [(MapDataSubscriptionInfo *)v5 subscription];
    id v7 = [(MapDataSubscriptionInfo *)self subscription];
    if (v6 == v7) {
      unsigned __int8 v8 = 1;
    }
    else {
      unsigned __int8 v8 = [v6 isEqual:v7];
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (GEOMapDataSubscription)subscription
{
  return self->_subscription;
}

- (GEOMapDataSubscriptionState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (GEOMapDataSubscriptionState)pairedDeviceState
{
  return self->_pairedDeviceState;
}

- (void)setPairedDeviceState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDeviceState, 0);
  objc_storeStrong((id *)&self->_state, 0);

  objc_storeStrong((id *)&self->_subscription, 0);
}

@end