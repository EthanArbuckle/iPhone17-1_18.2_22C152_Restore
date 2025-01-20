@interface IMBalloonPluginManagerModel
- (BOOL)hasCompletedInitialization;
- (BOOL)hasDeferredInstalledAppsChangedNotification;
- (Class)richLinksDataSourceClass;
- (IMBalloonPluginManagerModel)init;
- (IMThreadSafeBalloonPluginMap)pluginsMap;
- (NSDictionary)pluginIDToMetadataCache;
- (NSSet)pluginsToRemoveAfterExtensionsUpdate;
- (NSString)pluginMetaDataFolder;
- (OS_dispatch_queue)dataQueue;
- (id)extensionMatchingContext;
- (id)highMemoryExtensionMatchingContext;
- (void)setExtensionMatchingContext:(id)a3;
- (void)setHasCompletedInitialization:(BOOL)a3;
- (void)setHasDeferredInstalledAppsChangedNotification:(BOOL)a3;
- (void)setHighMemoryExtensionMatchingContext:(id)a3;
- (void)setPluginIDToMetadataCache:(id)a3;
- (void)setPluginMetaDataFolder:(id)a3;
- (void)setPluginsToRemoveAfterExtensionsUpdate:(id)a3;
- (void)setRichLinksDataSourceClass:(Class)a3;
@end

@implementation IMBalloonPluginManagerModel

- (void)setHasCompletedInitialization:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_hasCompletedInitialization = a3;
  objc_sync_exit(obj);
}

- (void)setPluginIDToMetadataCache:(id)a3
{
  v4 = (NSDictionary *)a3;
  obj = self;
  objc_sync_enter(obj);
  pluginIDToMetadataCache = obj->_pluginIDToMetadataCache;
  obj->_pluginIDToMetadataCache = v4;

  objc_sync_exit(obj);
}

- (void)setPluginMetaDataFolder:(id)a3
{
  v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  pluginMetaDataFolder = obj->_pluginMetaDataFolder;
  obj->_pluginMetaDataFolder = v4;

  objc_sync_exit(obj);
}

- (void)setHighMemoryExtensionMatchingContext:(id)a3
{
  id v4 = a3;
  obj = self;
  objc_sync_enter(obj);
  id highMemoryExtensionMatchingContext = obj->_highMemoryExtensionMatchingContext;
  obj->_id highMemoryExtensionMatchingContext = v4;

  objc_sync_exit(obj);
}

- (void)setExtensionMatchingContext:(id)a3
{
  id v4 = a3;
  obj = self;
  objc_sync_enter(obj);
  id extensionMatchingContext = obj->_extensionMatchingContext;
  obj->_id extensionMatchingContext = v4;

  objc_sync_exit(obj);
}

- (IMBalloonPluginManagerModel)init
{
  v23.receiver = self;
  v23.super_class = (Class)IMBalloonPluginManagerModel;
  id v2 = [(IMBalloonPluginManagerModel *)&v23 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.IMCore.IMBalloonPluginManagerModel", v4);
    v6 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v5;

    v7 = [IMThreadSafeBalloonPluginMap alloc];
    uint64_t v10 = objc_msgSend_initWithConcurrentDataQueue_(v7, v8, *((void *)v2 + 9), v9);
    v11 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v10;

    uint64_t v15 = objc_msgSend_dictionary(MEMORY[0x1E4F1C9E8], v12, v13, v14);
    v16 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v15;

    uint64_t v20 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v17, v18, v19);
    v21 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v20;
  }
  return (IMBalloonPluginManagerModel *)v2;
}

- (BOOL)hasDeferredInstalledAppsChangedNotification
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL hasDeferredInstalledAppsChangedNotification = v2->_hasDeferredInstalledAppsChangedNotification;
  objc_sync_exit(v2);

  return hasDeferredInstalledAppsChangedNotification;
}

- (void)setPluginsToRemoveAfterExtensionsUpdate:(id)a3
{
  id v4 = (NSSet *)a3;
  obj = self;
  objc_sync_enter(obj);
  pluginsToRemoveAfterExtensionsUpdate = obj->_pluginsToRemoveAfterExtensionsUpdate;
  obj->_pluginsToRemoveAfterExtensionsUpdate = v4;

  objc_sync_exit(obj);
}

- (NSSet)pluginsToRemoveAfterExtensionsUpdate
{
  return self->_pluginsToRemoveAfterExtensionsUpdate;
}

- (BOOL)hasCompletedInitialization
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL hasCompletedInitialization = v2->_hasCompletedInitialization;
  objc_sync_exit(v2);

  return hasCompletedInitialization;
}

- (IMThreadSafeBalloonPluginMap)pluginsMap
{
  return self->_pluginsMap;
}

- (id)extensionMatchingContext
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_extensionMatchingContext;
  objc_sync_exit(v2);

  return v3;
}

- (id)highMemoryExtensionMatchingContext
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_highMemoryExtensionMatchingContext;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)pluginMetaDataFolder
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_pluginMetaDataFolder;
  objc_sync_exit(v2);

  return v3;
}

- (void)setHasDeferredInstalledAppsChangedNotification:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL hasDeferredInstalledAppsChangedNotification = a3;
  objc_sync_exit(obj);
}

- (Class)richLinksDataSourceClass
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_richLinksDataSourceClass;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRichLinksDataSourceClass:(Class)a3
{
  obj = self;
  objc_sync_enter(obj);
  objc_storeStrong((id *)&obj->_richLinksDataSourceClass, a3);
  objc_sync_exit(obj);
}

- (NSDictionary)pluginIDToMetadataCache
{
  return self->_pluginIDToMetadataCache;
}

- (OS_dispatch_queue)dataQueue
{
  return self->_dataQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataQueue, 0);
  objc_storeStrong((id *)&self->_pluginsToRemoveAfterExtensionsUpdate, 0);
  objc_storeStrong((id *)&self->_pluginsMap, 0);
  objc_storeStrong((id *)&self->_richLinksDataSourceClass, 0);
  objc_storeStrong((id *)&self->_pluginIDToMetadataCache, 0);
  objc_storeStrong((id *)&self->_pluginMetaDataFolder, 0);
  objc_storeStrong(&self->_highMemoryExtensionMatchingContext, 0);

  objc_storeStrong(&self->_extensionMatchingContext, 0);
}

@end