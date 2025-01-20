@interface MSPSharedTripSubscriptionToken
- (MSPSharedTripSubscriptionToken)initWithSharedTripIdentifier:(id)a3 invalidationHandler:(id)a4;
- (void)dealloc;
@end

@implementation MSPSharedTripSubscriptionToken

- (MSPSharedTripSubscriptionToken)initWithSharedTripIdentifier:(id)a3 invalidationHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MSPSharedTripSubscriptionToken;
  v9 = [(MSPSharedTripSubscriptionToken *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sharedTripIdentifier, a3);
    uint64_t v11 = [v8 copy];
    id invalidationHandler = v10->_invalidationHandler;
    v10->_id invalidationHandler = (id)v11;
  }
  return v10;
}

- (void)dealloc
{
  id invalidationHandler = self->_invalidationHandler;
  if (invalidationHandler)
  {
    v4 = (void (**)(void, void, void))MEMORY[0x1BA9C2AF0](invalidationHandler, a2);
    id v5 = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    ((void (**)(void, MSPSharedTripSubscriptionToken *, NSString *))v4)[2](v4, self, self->_sharedTripIdentifier);
  }
  v6.receiver = self;
  v6.super_class = (Class)MSPSharedTripSubscriptionToken;
  [(MSPSharedTripSubscriptionToken *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);

  objc_storeStrong((id *)&self->_sharedTripIdentifier, 0);
}

@end