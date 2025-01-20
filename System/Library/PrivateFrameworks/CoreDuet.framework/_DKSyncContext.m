@interface _DKSyncContext
+ (_DKSyncContext)new;
- (NSString)name;
- (_DKKnowledgeStorage)storage;
- (_DKSyncContext)init;
- (_DKSyncContext)initWithName:(id)a3;
- (void)setStorage:(id)a3;
@end

@implementation _DKSyncContext

+ (_DKSyncContext)new
{
  return 0;
}

- (_DKSyncContext)init
{
  return 0;
}

- (_DKSyncContext)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DKSyncContext;
  v6 = [(_DKSyncContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (_DKKnowledgeStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end