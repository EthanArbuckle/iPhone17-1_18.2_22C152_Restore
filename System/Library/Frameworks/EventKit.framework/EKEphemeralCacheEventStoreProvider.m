@interface EKEphemeralCacheEventStoreProvider
- (EKEphemeralCacheEventStoreProvider)initWithCreationBlock:(id)a3;
- (id)eventStore;
@end

@implementation EKEphemeralCacheEventStoreProvider

- (id)eventStore
{
  return [(EKTimedEventStorePurger *)self->_eventStorePurger acquireCachedEventStoreOrCreate:1];
}

- (EKEphemeralCacheEventStoreProvider)initWithCreationBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKEphemeralCacheEventStoreProvider;
  v5 = [(EKEphemeralCacheEventStoreProvider *)&v9 init];
  if (v5)
  {
    v6 = objc_alloc_init(EKTimedEventStorePurger);
    eventStorePurger = v5->_eventStorePurger;
    v5->_eventStorePurger = v6;

    [(EKTimedEventStorePurger *)v5->_eventStorePurger setPurgingAllowed:1];
    [(EKTimedEventStorePurger *)v5->_eventStorePurger setTimeout:10.0];
    [(EKTimedEventStorePurger *)v5->_eventStorePurger setCreationBlock:v4];
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end