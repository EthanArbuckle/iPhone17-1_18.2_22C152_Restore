@interface CLSPublicEventCacheCreatorResult
- (CLSPublicEventCacheCreatorResult)init;
- (NSDictionary)invalidationTokenByTimeLocationIdentifier;
- (NSDictionary)resolvedPublicEventsByTimeLocationIdentifier;
- (unint64_t)numberOfRequests;
- (void)setInvalidationTokenByTimeLocationIdentifier:(id)a3;
- (void)setNumberOfRequests:(unint64_t)a3;
- (void)setResolvedPublicEventsByTimeLocationIdentifier:(id)a3;
@end

@implementation CLSPublicEventCacheCreatorResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationTokenByTimeLocationIdentifier, 0);
  objc_storeStrong((id *)&self->_resolvedPublicEventsByTimeLocationIdentifier, 0);
}

- (void)setNumberOfRequests:(unint64_t)a3
{
  self->_numberOfRequests = a3;
}

- (unint64_t)numberOfRequests
{
  return self->_numberOfRequests;
}

- (void)setInvalidationTokenByTimeLocationIdentifier:(id)a3
{
}

- (NSDictionary)invalidationTokenByTimeLocationIdentifier
{
  return self->_invalidationTokenByTimeLocationIdentifier;
}

- (void)setResolvedPublicEventsByTimeLocationIdentifier:(id)a3
{
}

- (NSDictionary)resolvedPublicEventsByTimeLocationIdentifier
{
  return self->_resolvedPublicEventsByTimeLocationIdentifier;
}

- (CLSPublicEventCacheCreatorResult)init
{
  v8.receiver = self;
  v8.super_class = (Class)CLSPublicEventCacheCreatorResult;
  v2 = [(CLSPublicEventCacheCreatorResult *)&v8 init];
  v3 = v2;
  if (v2)
  {
    resolvedPublicEventsByTimeLocationIdentifier = v2->_resolvedPublicEventsByTimeLocationIdentifier;
    v5 = (NSDictionary *)MEMORY[0x1E4F1CC08];
    v2->_resolvedPublicEventsByTimeLocationIdentifier = (NSDictionary *)MEMORY[0x1E4F1CC08];

    invalidationTokenByTimeLocationIdentifier = v3->_invalidationTokenByTimeLocationIdentifier;
    v3->_invalidationTokenByTimeLocationIdentifier = v5;
  }
  return v3;
}

@end