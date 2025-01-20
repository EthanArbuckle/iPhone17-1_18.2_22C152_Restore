@interface _DKSyncContextObjectFactory
+ (id)objectFactoryForClass:(Class)a3 context:(id)a4;
- (Class)class;
- (_DKSyncContext)context;
- (_DKSyncContextObjectFactory)initWithContext:(id)a3 fabricateClass:(Class)a4;
- (id)instance;
@end

@implementation _DKSyncContextObjectFactory

+ (id)objectFactoryForClass:(Class)a3 context:(id)a4
{
  id v6 = a4;
  if (objectFactoryForClass_context__initialized != -1) {
    dispatch_once(&objectFactoryForClass_context__initialized, &__block_literal_global_85);
  }
  v7 = NSString;
  v8 = [v6 name];
  v9 = NSStringFromClass(a3);
  v10 = [v7 stringWithFormat:@"%@::%@", v8, v9];

  id v11 = (id)objectFactoryForClass_context__instances;
  objc_sync_enter(v11);
  v12 = [(id)objectFactoryForClass_context__instances objectForKeyedSubscript:v10];
  if (!v12)
  {
    v12 = (void *)[objc_alloc((Class)a1) initWithContext:v6 fabricateClass:a3];
    [(id)objectFactoryForClass_context__instances setObject:v12 forKeyedSubscript:v10];
  }
  objc_sync_exit(v11);

  return v12;
}

- (_DKSyncContextObjectFactory)initWithContext:(id)a3 fabricateClass:(Class)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_DKSyncContextObjectFactory;
  v8 = [(_DKSyncContextObjectFactory *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_context, a3);
    objc_storeStrong((id *)&v9->_class, a4);
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    instances = v9->_instances;
    v9->_instances = (NSMutableDictionary *)v10;
  }
  return v9;
}

- (id)instance
{
  v3 = [(_DKSyncContext *)self->_context name];
  v4 = self->_instances;
  objc_sync_enter(v4);
  v5 = [(NSMutableDictionary *)self->_instances objectForKeyedSubscript:v3];
  if (!v5)
  {
    v5 = (void *)[objc_alloc(self->_class) initWithContext:self->_context];
    [(NSMutableDictionary *)self->_instances setObject:v5 forKeyedSubscript:v3];
  }
  objc_sync_exit(v4);

  return v5;
}

- (_DKSyncContext)context
{
  return self->_context;
}

- (Class)class
{
  return self->_class;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_class, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_instances, 0);
}

@end