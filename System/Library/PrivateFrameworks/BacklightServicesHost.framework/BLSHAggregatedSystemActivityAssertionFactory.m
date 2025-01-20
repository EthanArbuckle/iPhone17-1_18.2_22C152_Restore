@interface BLSHAggregatedSystemActivityAssertionFactory
- (BLSHAggregatedSystemActivityAssertionFactory)init;
- (id)createAggregatedSystemActivityAssertionWithIdentifier:(id)a3 configurator:(id)a4;
@end

@implementation BLSHAggregatedSystemActivityAssertionFactory

- (BLSHAggregatedSystemActivityAssertionFactory)init
{
  v6.receiver = self;
  v6.super_class = (Class)BLSHAggregatedSystemActivityAssertionFactory;
  v2 = [(BLSHAggregatedSystemActivityAssertionFactory *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    lock_aggregateAssertions = v2->_lock_aggregateAssertions;
    v2->_lock_aggregateAssertions = (NSMapTable *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)createAggregatedSystemActivityAssertionWithIdentifier:(id)a3 configurator:(id)a4
{
  objc_super v6 = (void (**)(id, void *))a4;
  p_lock = &self->_lock;
  id v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  v9 = objc_opt_new();
  v6[2](v6, v9);
  v10 = NSNumber;
  if ([v9 acquireWaitsToAbortSleepRequested]) {
    int v11 = 2;
  }
  else {
    int v11 = 0;
  }
  v12 = objc_msgSend(v10, "numberWithInt:", v11 | objc_msgSend(v9, "acquireWaitsToAbortSleepRequested"));
  v13 = [(NSMapTable *)self->_lock_aggregateAssertions objectForKey:v12];
  if (!v13)
  {
    v13 = [[BLSHAggregateSystemActivityAssertion alloc] initWithConfigurator:v6];
    [(NSMapTable *)self->_lock_aggregateAssertions setObject:v13 forKey:v12];
  }
  v14 = [[BLSHIndividualSystemActivityAssertion alloc] initWithWithIdentifier:v8 aggregator:v13];

  os_unfair_lock_unlock(p_lock);

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_aggregateAssertions, 0);

  objc_destroyWeak((id *)&self->_lock_aggregateAssertion);
}

@end