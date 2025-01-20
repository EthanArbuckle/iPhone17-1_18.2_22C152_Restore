@interface AUHostingServiceInstanceMap
+ (id)sharedInstance;
- (AUHostingServiceInstanceMap)init;
- (id)retrieveInstance:(id)a3;
- (void)registerInstance:(id)a3 instance:(id)a4;
- (void)unregisterInstance:(id)a3;
@end

@implementation AUHostingServiceInstanceMap

- (void).cxx_destruct
{
}

- (id)retrieveInstance:(id)a3
{
  id v4 = a3;
  v5 = self->_instances;
  objc_sync_enter(v5);
  instances = self->_instances;
  v7 = [v4 UUIDString];
  v8 = [(NSMutableDictionary *)instances objectForKeyedSubscript:v7];

  objc_sync_exit(v5);
  return v8;
}

- (void)unregisterInstance:(id)a3
{
  id v7 = a3;
  id v4 = self->_instances;
  objc_sync_enter(v4);
  if (v7)
  {
    instances = self->_instances;
    v6 = [v7 UUIDString];
    [(NSMutableDictionary *)instances removeObjectForKey:v6];
  }
  objc_sync_exit(v4);
}

- (void)registerInstance:(id)a3 instance:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = self->_instances;
  objc_sync_enter(v7);
  v8 = [(NSMutableDictionary *)self->_instances allKeys];
  v9 = [v13 UUIDString];
  int v10 = [v8 containsObject:v9];

  if (v10) {
    std::terminate();
  }
  instances = self->_instances;
  v12 = [v13 UUIDString];
  [(NSMutableDictionary *)instances setObject:v6 forKeyedSubscript:v12];

  objc_sync_exit(v7);
}

- (AUHostingServiceInstanceMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)AUHostingServiceInstanceMap;
  v2 = [(AUHostingServiceInstanceMap *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    instances = v2->_instances;
    v2->_instances = (NSMutableDictionary *)v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (+[AUHostingServiceInstanceMap sharedInstance]::onceToken != -1) {
    dispatch_once(&+[AUHostingServiceInstanceMap sharedInstance]::onceToken, &__block_literal_global_8330);
  }
  v2 = (void *)+[AUHostingServiceInstanceMap sharedInstance]::sSharedInstance;
  return v2;
}

uint64_t __45__AUHostingServiceInstanceMap_sharedInstance__block_invoke()
{
  +[AUHostingServiceInstanceMap sharedInstance]::sSharedInstance = objc_alloc_init(AUHostingServiceInstanceMap);
  return MEMORY[0x1F41817F8]();
}

@end