@interface HDDataCollectorRecord
- (HDDataCollector)collector;
- (HKDataCollectorState)state;
- (id)description;
- (void)setCollector:(id)a3;
- (void)setState:(id)a3;
@end

@implementation HDDataCollectorRecord

- (void)setCollector:(id)a3
{
}

- (void)setState:(id)a3
{
}

- (HDDataCollector)collector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collector);

  return (HDDataCollector *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);

  objc_destroyWeak((id *)&self->_collector);
}

- (HKDataCollectorState)state
{
  return self->_state;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDDataCollectorRecord;
  v4 = [(HDDataCollectorRecord *)&v8 description];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collector);
  v6 = [v3 stringWithFormat:@"<%@: %@, %@>", v4, WeakRetained, self->_state];

  return v6;
}

@end