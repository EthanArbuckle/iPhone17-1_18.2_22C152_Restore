@interface HDHealthRecordsLegacyIngestionXPCService
- (HDHealthRecordsLegacyIngestionXPCService)init;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_performDownloadRequest:(id)a3 completion:(id)a4;
- (void)remote_pingWithCompletion:(id)a3;
@end

@implementation HDHealthRecordsLegacyIngestionXPCService

- (HDHealthRecordsLegacyIngestionXPCService)init
{
  v6.receiver = self;
  v6.super_class = (Class)HDHealthRecordsLegacyIngestionXPCService;
  v2 = [(HDHealthRecordsLegacyIngestionXPCService *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(HDHealthRecordsLegacyIngestionManager);
    manager = v2->_manager;
    v2->_manager = v3;
  }
  return v2;
}

- (void)remote_pingWithCompletion:(id)a3
{
}

- (void)remote_performDownloadRequest:(id)a3 completion:(id)a4
{
}

- (id)exportedInterface
{
  return (id)_HDHealthRecordsLegacyIngestionServiceInterface(self, a2);
}

- (id)remoteInterface
{
  id v2 = objc_alloc_init((Class)NSXPCInterface);

  return v2;
}

- (void).cxx_destruct
{
}

@end