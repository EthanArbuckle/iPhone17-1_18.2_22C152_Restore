@interface NSXPCConnection
@end

@implementation NSXPCConnection

uint64_t __99__NSXPCConnection_GEODaemonToNanoMapsGateDaemon__geo_createGEODaemonToNanoMapsGateDaemonConnection__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) initWithMachServiceName:@"com.apple.nanomaps.xpc.GeoServices" options:0];
  v2 = (void *)_MergedGlobals_198;
  _MergedGlobals_198 = v1;

  v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED835E70];
  [(id)_MergedGlobals_198 setRemoteObjectInterface:v3];

  v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED7580B8];
  [(id)_MergedGlobals_198 setExportedInterface:v4];

  v5 = objc_alloc_init(_NanoMapsGateDaemonHelper);
  [(id)_MergedGlobals_198 setExportedObject:v5];

  v6 = (void *)_MergedGlobals_198;

  return [v6 resume];
}

void __90__NSXPCConnection_GEODaemonToNanoMapsGateDaemon__geo_withNanoMapsGateDaemon_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (qword_1EB29F6D8 != -1) {
    dispatch_once(&qword_1EB29F6D8, &__block_literal_global_31);
  }
  v4 = qword_1EB29F6D0;
  if (os_log_type_enabled((os_log_t)qword_1EB29F6D0, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_ERROR, "Error sending message to mapspushd: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __99__NSXPCConnection_GEODaemonToMapsPushDaemon__geo_createGEODaemonToMapsNotificationDaemonConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(*(Class *)(a1 + 32)) initWithMachServiceName:@"com.apple.Maps.mapspushd.geoservices" options:0];
  id v3 = (void *)_MergedGlobals_266;
  _MergedGlobals_266 = v2;

  v4 = objc_msgSend(MEMORY[0x1E4F29280], "geo_MapsNotificationDaemonFromGeodInterface");
  [(id)_MergedGlobals_266 setRemoteObjectInterface:v4];

  int v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED740580];
  [(id)_MergedGlobals_266 setExportedInterface:v5];

  [(id)_MergedGlobals_266 setExportedObject:*(void *)(a1 + 32)];
  id v6 = (void *)_MergedGlobals_266;

  return [v6 resume];
}

void __98__NSXPCConnection_GEODaemonToMapsPushDaemon__geo_withMapsNotificationProviderDaemon_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (qword_1EB29FE90 != -1) {
    dispatch_once(&qword_1EB29FE90, &__block_literal_global_123);
  }
  v4 = qword_1EB29FE88;
  if (os_log_type_enabled((os_log_t)qword_1EB29FE88, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_ERROR, "Error sending message to notification daemon: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end