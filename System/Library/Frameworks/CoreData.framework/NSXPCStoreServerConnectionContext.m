@interface NSXPCStoreServerConnectionContext
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)_allowCoreDataFutures;
- (NSXPCStoreServerConnectionContext)initWithConnectionInfo:(id)a3;
- (id)cache;
- (id)description;
- (id)entitlements;
- (id)inverseIsToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4;
- (id)managedObjectContext;
- (id)manyToManyPrefetchRequestsForRelationshipNamed:(id)a3 onEntity:(id)a4;
- (id)manyToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4;
- (id)notificationManager;
- (id)persistentStoreCoordinator;
- (id)userInfo;
- (void)dealloc;
- (void)setActiveStore:(uint64_t)a1;
- (void)setManagedObjectContext:(id)a3;
- (void)setNotificationManager:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation NSXPCStoreServerConnectionContext

- (void)dealloc
{
  self->_activeStore = 0;
  self->_info = 0;

  self->_context = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSXPCStoreServerConnectionContext;
  [(NSXPCStoreServerConnectionContext *)&v3 dealloc];
}

- (id)entitlements
{
  id v2 = [(NSXPCStoreConnectionInfo *)self->_info entitlements];

  return v2;
}

- (id)managedObjectContext
{
  id v2 = self->_context;

  return v2;
}

- (id)persistentStoreCoordinator
{
  id v2 = [(NSXPCStoreConnectionInfo *)self->_info persistentStoreCoordinator];

  return v2;
}

- (void)setManagedObjectContext:(id)a3
{
  if (self->_context != a3)
  {
    id v5 = a3;

    self->_context = (NSManagedObjectContext *)a3;
  }
}

- (NSXPCStoreServerConnectionContext)initWithConnectionInfo:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSXPCStoreServerConnectionContext;
  v4 = [(NSXPCStoreServerConnectionContext *)&v6 init];
  if (v4) {
    v4->_info = (NSXPCStoreConnectionInfo *)a3;
  }
  return v4;
}

- (void)setActiveStore:(uint64_t)a1
{
  if (a1)
  {
    if (*(void **)(a1 + 32) != a2)
    {
      id v4 = a2;

      *(void *)(a1 + 32) = a2;
    }
  }
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<NSXPCStoreServerConnectionContext: \n\tentitlements = %@ ;\n\tcontext = %@ ;\n\tinfo = %@>",
               [(NSXPCStoreServerConnectionContext *)self entitlements],
               self->_context,
               self->_info);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_info;
  if (result) {
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)[($115C4C562B26FF47E01F9F4EA65B5887 *)result auditToken];
  }
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

- (id)userInfo
{
  return [(NSXPCStoreConnectionInfo *)self->_info userInfo];
}

- (void)setUserInfo:(id)a3
{
  info = self->_info;
  if (info)
  {
    id v5 = a3;
    os_unfair_lock_lock_with_options();
    id userInfo = info->_userInfo;
    info->_id userInfo = a3;
    os_unfair_lock_unlock(&info->_lock);
  }
}

- (id)notificationManager
{
  id v2 = self->_manager;

  return v2;
}

- (void)setNotificationManager:(id)a3
{
  if (self->_manager != a3)
  {
    id v5 = a3;

    self->_manager = a3;
  }
}

- (id)cache
{
  info = self->_info;
  if (info) {
    return info->_cache;
  }
  else {
    return 0;
  }
}

- (id)inverseIsToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  id v6 = [(NSXPCStoreServerConnectionContext *)self cache];

  return (id)[v6 inverseIsToOnePrefetchRequestForRelationshipNamed:a3 onEntity:a4];
}

- (id)manyToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  id v6 = [(NSXPCStoreServerConnectionContext *)self cache];

  return (id)[v6 manyToOnePrefetchRequestForRelationshipNamed:a3 onEntity:a4];
}

- (id)manyToManyPrefetchRequestsForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  id v6 = [(NSXPCStoreServerConnectionContext *)self cache];

  return (id)[v6 manyToManyPrefetchRequestsForRelationshipNamed:a3 onEntity:a4];
}

- (BOOL)_allowCoreDataFutures
{
  return 1;
}

@end