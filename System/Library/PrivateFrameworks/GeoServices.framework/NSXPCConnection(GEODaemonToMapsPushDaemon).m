@interface NSXPCConnection(GEODaemonToMapsPushDaemon)
+ (id)geo_createGEODaemonToMapsNotificationDaemonConnection;
+ (void)geo_withMapsNotificationProviderDaemon:()GEODaemonToMapsPushDaemon errorHandler:;
@end

@implementation NSXPCConnection(GEODaemonToMapsPushDaemon)

+ (id)geo_createGEODaemonToMapsNotificationDaemonConnection
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__NSXPCConnection_GEODaemonToMapsPushDaemon__geo_createGEODaemonToMapsNotificationDaemonConnection__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB29FE80 != -1) {
    dispatch_once(&qword_1EB29FE80, block);
  }
  v1 = (void *)_MergedGlobals_266;

  return v1;
}

+ (void)geo_withMapsNotificationProviderDaemon:()GEODaemonToMapsPushDaemon errorHandler:
{
  id v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(a1, "geo_createGEODaemonToMapsNotificationDaemonConnection");
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __98__NSXPCConnection_GEODaemonToMapsPushDaemon__geo_withMapsNotificationProviderDaemon_errorHandler___block_invoke;
  v11[3] = &unk_1E53DB698;
  id v12 = v6;
  id v9 = v6;
  v10 = [v8 remoteObjectProxyWithErrorHandler:v11];
  v7[2](v7, v10);
}

@end