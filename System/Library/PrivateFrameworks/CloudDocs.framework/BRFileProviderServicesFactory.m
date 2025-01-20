@interface BRFileProviderServicesFactory
+ (id)clientSideServiceSyncProxyForURL:(id)a3;
+ (id)itemServiceSyncProxyForURL:(id)a3;
+ (void)fetchItemServiceSyncProxyForURL:(id)a3 handler:(id)a4;
@end

@implementation BRFileProviderServicesFactory

+ (id)itemServiceSyncProxyForURL:(id)a3
{
  id v3 = a3;
  v4 = BRCXPCBRItemServiceProtocolInterface();
  v5 = _fetchSynchronousAutomaticErrorProxyFromURL(v3, @"com.apple.CloudDocs.private.BRItem", v4);

  return v5;
}

+ (void)fetchItemServiceSyncProxyForURL:(id)a3 handler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = BRCXPCBRItemServiceProtocolInterface();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__BRFileProviderServicesFactory_fetchItemServiceSyncProxyForURL_handler___block_invoke;
  v9[3] = &unk_1E59ADA88;
  id v10 = v5;
  id v8 = v5;
  _fetchServiceAutomaticErrorProxyFromURL(v6, @"com.apple.CloudDocs.private.BRItem", v7, 0, v9);
}

uint64_t __73__BRFileProviderServicesFactory_fetchItemServiceSyncProxyForURL_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)clientSideServiceSyncProxyForURL:(id)a3
{
  id v3 = a3;
  v4 = BRCXPCICDFileProviderClientSideCollaborationProtocolInterface();
  id v5 = _fetchSynchronousAutomaticErrorProxyFromURL(v3, @"com.apple.CloudDocs.private.ClientSideCollaboration", v4);

  return v5;
}

@end