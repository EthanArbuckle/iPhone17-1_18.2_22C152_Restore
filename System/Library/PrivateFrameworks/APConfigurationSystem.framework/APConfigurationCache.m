@interface APConfigurationCache
+ (id)sharedInstance;
- (APConfigurationCache)init;
- (APInMemoryTTLCache)purgeableCache;
- (id)configurationForPath:(id)a3;
- (void)recentlyAccessedObject:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setPurgeableCache:(id)a3;
@end

@implementation APConfigurationCache

- (APConfigurationCache)init
{
  v10.receiver = self;
  v10.super_class = (Class)APConfigurationCache;
  v2 = [(APConfigurationCache *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.ap.configurationsystem.queue", v3);

    id v5 = objc_alloc(MEMORY[0x263F20B58]);
    uint64_t v7 = objc_msgSend_initWithExpirationInterval_flushQueue_(v5, v6, (uint64_t)v4, 300.0);
    purgeableCache = v2->_purgeableCache;
    v2->_purgeableCache = (APInMemoryTTLCache *)v7;
  }
  return v2;
}

- (void)recentlyAccessedObject:(id)a3
{
}

+ (id)sharedInstance
{
  dispatch_queue_t v4 = objc_msgSend_sharedInstance(MEMORY[0x263F20BA0], a2, v2);
  objc_msgSend_configurationCache(v4, v5, v6);
  uint64_t v7 = (APConfigurationCache *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    id v8 = a1;
    objc_sync_enter(v8);
    objc_msgSend_configurationCache(v4, v9, v10);
    uint64_t v7 = (APConfigurationCache *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      uint64_t v7 = objc_alloc_init(APConfigurationCache);
      objc_msgSend_setConfigurationCache_(v4, v11, (uint64_t)v7);
    }
    objc_sync_exit(v8);
  }
  return v7;
}

- (void)setConfiguration:(id)a3
{
}

- (id)configurationForPath:(id)a3
{
  return (id)MEMORY[0x270F9A6D0](self->_purgeableCache, sel_getObjectForIdentifier_, a3);
}

- (APInMemoryTTLCache)purgeableCache
{
  return self->_purgeableCache;
}

- (void)setPurgeableCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end