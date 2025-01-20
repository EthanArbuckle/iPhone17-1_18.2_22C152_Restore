@interface CPLPushPullGatekeeper
- (CPLEngineStore)store;
- (CPLPushPullGatekeeper)initWithStore:(id)a3;
- (int64_t)checkPushedChange:(id)a3;
@end

@implementation CPLPushPullGatekeeper

- (void).cxx_destruct
{
}

- (CPLEngineStore)store
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  return (CPLEngineStore *)WeakRetained;
}

- (int64_t)checkPushedChange:(id)a3
{
  return 0;
}

- (CPLPushPullGatekeeper)initWithStore:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPLPushPullGatekeeper;
  v5 = [(CPLPushPullGatekeeper *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_store, v4);
  }

  return v6;
}

@end