@interface BAAppStoreProgressConfiguration
+ (BOOL)supportsSecureCoding;
- (BAAppStoreProgressConfiguration)init;
- (BAAppStoreProgressConfiguration)initWithCoder:(id)a3;
- (id)appBundleIdentifiers;
- (void)encodeWithCoder:(id)a3;
- (void)invokeHandlerWithAppBundleIdentifier:(void *)a3 progressInfo:;
- (void)setAppBundleIdentifiers:(id)a3;
- (void)setHandlerQueue:(id)a3;
- (void)setUpdateHandler:(id)a3;
@end

@implementation BAAppStoreProgressConfiguration

- (BAAppStoreProgressConfiguration)init
{
  v13.receiver = self;
  v13.super_class = (Class)BAAppStoreProgressConfiguration;
  v2 = [(BAAppStoreProgressConfiguration *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_opt_new();
    appBundleIdentifiers = v3->_appBundleIdentifiers;
    v3->_appBundleIdentifiers = (NSSet *)v4;

    id updateHandler = v3->_updateHandler;
    v3->_id updateHandler = 0;

    qos_class_t v7 = qos_class_self();
    uint64_t v8 = dispatch_get_global_queue(v7, 0);
    handlerQueue = v3->_handlerQueue;
    v3->_handlerQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = objc_opt_new();
    duplicateEventCache = v3->_duplicateEventCache;
    v3->_duplicateEventCache = (NSMutableDictionary *)v10;
  }
  return v3;
}

- (BAAppStoreProgressConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BAAppStoreProgressConfiguration;
  v5 = [(BAAppStoreProgressConfiguration *)&v15 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    qos_class_t v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"BA_AppBundleIdentifiers"];
    appBundleIdentifiers = v6->_appBundleIdentifiers;
    v6->_appBundleIdentifiers = (NSSet *)v10;

    uint64_t v12 = objc_opt_new();
    duplicateEventCache = v6->_duplicateEventCache;
    v6->_duplicateEventCache = (NSMutableDictionary *)v12;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [v5 encodeObject:self->_appBundleIdentifiers forKey:@"BA_AppBundleIdentifiers"];

  os_unfair_lock_unlock(p_lock);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setAppBundleIdentifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = (NSSet *)[v4 copy];
  appBundleIdentifiers = self->_appBundleIdentifiers;
  self->_appBundleIdentifiers = v5;

  qos_class_t v7 = (void *)MEMORY[0x22A66B380]();
  uint64_t v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableDictionary count](self->_duplicateEventCache, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v9 = [(NSMutableDictionary *)self->_duplicateEventCache allKeys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (![(NSSet *)self->_appBundleIdentifiers containsObject:v14]) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  [(NSMutableDictionary *)self->_duplicateEventCache removeObjectsForKeys:v8];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setUpdateHandler:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (void *)[v5 copy];

  id updateHandler = self->_updateHandler;
  self->_id updateHandler = v6;

  os_unfair_lock_unlock(p_lock);
}

- (id)appBundleIdentifiers
{
  v1 = (id *)a1;
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    v1 = (id *)v1[4];
    os_unfair_lock_unlock(v2);
  }

  return v1;
}

- (void)setHandlerQueue:(id)a3
{
  id v4 = (OS_dispatch_queue *)a3;
  os_unfair_lock_lock(&self->_lock);
  handlerQueue = self->_handlerQueue;
  self->_handlerQueue = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)invokeHandlerWithAppBundleIdentifier:(void *)a3 progressInfo:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    qos_class_t v7 = *(id *)(a1 + 16);
    uint64_t v8 = _Block_copy(*(const void **)(a1 + 24));
    v9 = [*(id *)(a1 + 40) objectForKey:v5];
    [*(id *)(a1 + 40) setObject:v6 forKey:v5];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (([v9 isEqual:v6] & 1) == 0 && v8)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __85__BAAppStoreProgressConfiguration_invokeHandlerWithAppBundleIdentifier_progressInfo___block_invoke;
      block[3] = &unk_2647E8EB8;
      id v13 = v8;
      id v11 = v5;
      id v12 = v6;
      dispatch_async(v7, block);
    }
  }
}

uint64_t __85__BAAppStoreProgressConfiguration_invokeHandlerWithAppBundleIdentifier_progressInfo___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duplicateEventCache, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifiers, 0);
  objc_storeStrong(&self->_updateHandler, 0);

  objc_storeStrong((id *)&self->_handlerQueue, 0);
}

@end