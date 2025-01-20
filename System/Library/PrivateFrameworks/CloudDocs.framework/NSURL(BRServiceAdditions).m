@interface NSURL(BRServiceAdditions)
- (id)_br_clientSideCollaborationServiceSyncProxy;
- (id)_br_itemServiceSyncProxy;
- (uint64_t)_br_fetchItemServiceSyncProxy:()BRServiceAdditions;
@end

@implementation NSURL(BRServiceAdditions)

- (id)_br_itemServiceSyncProxy
{
  return +[BRFileProviderServicesFactory itemServiceSyncProxyForURL:a1];
}

- (uint64_t)_br_fetchItemServiceSyncProxy:()BRServiceAdditions
{
  return +[BRFileProviderServicesFactory fetchItemServiceSyncProxyForURL:a1 handler:a3];
}

- (id)_br_clientSideCollaborationServiceSyncProxy
{
  return +[BRFileProviderServicesFactory clientSideServiceSyncProxyForURL:a1];
}

@end