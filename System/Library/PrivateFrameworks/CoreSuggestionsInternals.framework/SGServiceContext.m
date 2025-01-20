@interface SGServiceContext
- (SGServiceContext)initWithStore:(id)a3;
- (SGSqlEntityStore)store;
@end

@implementation SGServiceContext

- (SGServiceContext)initWithStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGServiceContext;
  v6 = [(SGServiceContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (SGSqlEntityStore)store
{
  return self->_store;
}

@end