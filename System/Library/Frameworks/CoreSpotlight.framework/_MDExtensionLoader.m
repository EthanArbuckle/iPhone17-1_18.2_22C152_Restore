@interface _MDExtensionLoader
- (BOOL)extensionsCacheNeedsLoad;
- (NSDictionary)extensionsByBundleId;
- (NSDictionary)fileProviderBundleMap;
- (NSMutableArray)containerIDs;
- (NSMutableArray)containerPaths;
- (NSMutableArray)extensionIdentifiers;
- (NSMutableArray)queueLabels;
- (NSSet)fileProviderBundleIDs;
- (OS_dispatch_queue)queue;
- (_MDExtensionLoader)init;
- (id)matchingContext;
- (int64_t)notificationCount;
- (void)findExtensionsWithCompletionBlock:(id)a3;
- (void)setContainerIDs:(id)a3;
- (void)setContainerPaths:(id)a3;
- (void)setExtensionIdentifiers:(id)a3;
- (void)setExtensionsByBundleId:(id)a3;
- (void)setExtensionsCacheNeedsLoad:(BOOL)a3;
- (void)setFileProviderBundleIDs:(id)a3;
- (void)setFileProviderBundleMap:(id)a3;
- (void)setMatchingContext:(id)a3;
- (void)setNotificationCount:(int64_t)a3;
- (void)setQueue:(id)a3;
- (void)setQueueLabels:(id)a3;
- (void)startLookingForExtensionsWithMatchUpdateHandler:(id)a3;
- (void)stopLookingForExtensions;
@end

@implementation _MDExtensionLoader

- (_MDExtensionLoader)init
{
  v3.receiver = self;
  v3.super_class = (Class)_MDExtensionLoader;
  return [(_MDExtensionLoader *)&v3 init];
}

- (void)findExtensionsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[_MDExtensionLoader findExtensionsWithCompletionBlock:]();
  }
  v5 = v4;
  v6 = (void *)MEMORY[0x1E4F28C70];
  v7 = [(id)objc_opt_class() _matchDictionary];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56___MDExtensionLoader_findExtensionsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E554C810;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [v6 extensionsWithMatchingAttributes:v7 completion:v9];
}

- (void)startLookingForExtensionsWithMatchUpdateHandler:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[_MDExtensionLoader startLookingForExtensionsWithMatchUpdateHandler:]();
  }
  v5 = v4;
  v6 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D0E3000, v6, OS_LOG_TYPE_DEFAULT, "startLookingForExtensionsWithMatchUpdateHandler", buf, 2u);
  }

  v7 = [(_MDExtensionLoader *)self queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70___MDExtensionLoader_startLookingForExtensionsWithMatchUpdateHandler___block_invoke;
  v9[3] = &unk_1E554C838;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

- (void)stopLookingForExtensions
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18D0E3000, log, OS_LOG_TYPE_DEBUG, "Done looking for indexing extensions", v1, 2u);
}

- (id)matchingContext
{
  return self->_matchingContext;
}

- (void)setMatchingContext:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSDictionary)extensionsByBundleId
{
  return self->_extensionsByBundleId;
}

- (void)setExtensionsByBundleId:(id)a3
{
}

- (NSDictionary)fileProviderBundleMap
{
  return self->_fileProviderBundleMap;
}

- (void)setFileProviderBundleMap:(id)a3
{
}

- (NSSet)fileProviderBundleIDs
{
  return self->_fileProviderBundleIDs;
}

- (void)setFileProviderBundleIDs:(id)a3
{
}

- (NSMutableArray)containerPaths
{
  return self->_containerPaths;
}

- (void)setContainerPaths:(id)a3
{
}

- (NSMutableArray)queueLabels
{
  return self->_queueLabels;
}

- (void)setQueueLabels:(id)a3
{
}

- (NSMutableArray)containerIDs
{
  return self->_containerIDs;
}

- (void)setContainerIDs:(id)a3
{
}

- (NSMutableArray)extensionIdentifiers
{
  return self->_extensionIdentifiers;
}

- (void)setExtensionIdentifiers:(id)a3
{
}

- (BOOL)extensionsCacheNeedsLoad
{
  return self->_extensionsCacheNeedsLoad;
}

- (void)setExtensionsCacheNeedsLoad:(BOOL)a3
{
  self->_extensionsCacheNeedsLoad = a3;
}

- (int64_t)notificationCount
{
  return self->_notificationCount;
}

- (void)setNotificationCount:(int64_t)a3
{
  self->_notificationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentifiers, 0);
  objc_storeStrong((id *)&self->_containerIDs, 0);
  objc_storeStrong((id *)&self->_queueLabels, 0);
  objc_storeStrong((id *)&self->_containerPaths, 0);
  objc_storeStrong((id *)&self->_fileProviderBundleIDs, 0);
  objc_storeStrong((id *)&self->_fileProviderBundleMap, 0);
  objc_storeStrong((id *)&self->_extensionsByBundleId, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_matchingContext, 0);
}

- (void)findExtensionsWithCompletionBlock:.cold.1()
{
}

- (void)startLookingForExtensionsWithMatchUpdateHandler:.cold.1()
{
}

@end