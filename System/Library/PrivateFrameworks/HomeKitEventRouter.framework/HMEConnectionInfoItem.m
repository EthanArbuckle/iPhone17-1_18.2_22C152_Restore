@interface HMEConnectionInfoItem
- (BOOL)hasPendingRequest;
- (HMEConnectionInfoItem)initWithConnection:(id)a3 expiry:(id)a4;
- (HMEPendingEventsCollection)pendingCachedEventItems;
- (HMEPendingEventsCollection)pendingEventItems;
- (NSDate)debounceStartTime;
- (NSDate)expiry;
- (NSUUID)identifier;
- (id)connection;
- (void)setConnection:(id)a3;
- (void)setDebounceStartTime:(id)a3;
- (void)setExpiry:(id)a3;
- (void)setHasPendingRequest:(BOOL)a3;
@end

@implementation HMEConnectionInfoItem

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_connection);
  objc_storeStrong((id *)&self->_debounceStartTime, 0);
  objc_storeStrong((id *)&self->_expiry, 0);
  objc_storeStrong((id *)&self->_pendingCachedEventItems, 0);
  objc_storeStrong((id *)&self->_pendingEventItems, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setHasPendingRequest:(BOOL)a3
{
  self->_hasPendingRequest = a3;
}

- (BOOL)hasPendingRequest
{
  return self->_hasPendingRequest;
}

- (void)setConnection:(id)a3
{
}

- (id)connection
{
  id WeakRetained = objc_loadWeakRetained(&self->_connection);
  return WeakRetained;
}

- (void)setDebounceStartTime:(id)a3
{
}

- (NSDate)debounceStartTime
{
  return self->_debounceStartTime;
}

- (void)setExpiry:(id)a3
{
}

- (NSDate)expiry
{
  return self->_expiry;
}

- (HMEPendingEventsCollection)pendingCachedEventItems
{
  return self->_pendingCachedEventItems;
}

- (HMEPendingEventsCollection)pendingEventItems
{
  return self->_pendingEventItems;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (HMEConnectionInfoItem)initWithConnection:(id)a3 expiry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMEConnectionInfoItem;
  v8 = [(HMEConnectionInfoItem *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
    identifier = v8->_identifier;
    v8->_identifier = (NSUUID *)v9;

    objc_storeWeak(&v8->_connection, v6);
    objc_storeStrong((id *)&v8->_expiry, a4);
    v11 = objc_alloc_init(HMEPendingEventsCollection);
    pendingEventItems = v8->_pendingEventItems;
    v8->_pendingEventItems = v11;

    v13 = objc_alloc_init(HMEPendingEventsCollection);
    pendingCachedEventItems = v8->_pendingCachedEventItems;
    v8->_pendingCachedEventItems = v13;
  }
  return v8;
}

uint64_t __49__HMEConnectionInfoItem_performRequestWithBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHasPendingRequest:0];
}

@end