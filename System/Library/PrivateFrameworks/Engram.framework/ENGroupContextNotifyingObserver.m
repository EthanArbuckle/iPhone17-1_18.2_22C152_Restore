@interface ENGroupContextNotifyingObserver
- (ENGroupContextNotifyingObserver)initWithQueue:(id)a3;
- (OS_dispatch_queue)queue;
- (id)onGroupCache;
- (id)onGroupCreate;
- (id)onGroupUpdate;
- (void)groupContext:(id)a3 didCacheGroup:(id)a4;
- (void)groupContext:(id)a3 didCreateGroup:(id)a4;
- (void)groupContext:(id)a3 didUpdateGroup:(id)a4 withNewGroup:(id)a5;
- (void)setOnGroupCache:(id)a3;
- (void)setOnGroupCreate:(id)a3;
- (void)setOnGroupUpdate:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation ENGroupContextNotifyingObserver

- (ENGroupContextNotifyingObserver)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ENGroupContextNotifyingObserver;
  v6 = [(ENGroupContextNotifyingObserver *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (void)groupContext:(id)a3 didCreateGroup:(id)a4
{
  id v8 = a4;
  id v5 = [(ENGroupContextNotifyingObserver *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(ENGroupContextNotifyingObserver *)self onGroupCreate];

  if (v6)
  {
    v7 = [(ENGroupContextNotifyingObserver *)self onGroupCreate];
    ((void (**)(void, id))v7)[2](v7, v8);
  }
}

- (void)groupContext:(id)a3 didCacheGroup:(id)a4
{
  id v8 = a4;
  id v5 = [(ENGroupContextNotifyingObserver *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(ENGroupContextNotifyingObserver *)self onGroupCache];

  if (v6)
  {
    v7 = [(ENGroupContextNotifyingObserver *)self onGroupCache];
    ((void (**)(void, id))v7)[2](v7, v8);
  }
}

- (void)groupContext:(id)a3 didUpdateGroup:(id)a4 withNewGroup:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  id v8 = [(ENGroupContextNotifyingObserver *)self queue];
  dispatch_assert_queue_V2(v8);

  objc_super v9 = [(ENGroupContextNotifyingObserver *)self onGroupUpdate];

  if (v9)
  {
    v10 = [(ENGroupContextNotifyingObserver *)self onGroupUpdate];
    ((void (**)(void, id, id))v10)[2](v10, v11, v7);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)onGroupCache
{
  return self->_onGroupCache;
}

- (void)setOnGroupCache:(id)a3
{
}

- (id)onGroupCreate
{
  return self->_onGroupCreate;
}

- (void)setOnGroupCreate:(id)a3
{
}

- (id)onGroupUpdate
{
  return self->_onGroupUpdate;
}

- (void)setOnGroupUpdate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onGroupUpdate, 0);
  objc_storeStrong(&self->_onGroupCreate, 0);
  objc_storeStrong(&self->_onGroupCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end