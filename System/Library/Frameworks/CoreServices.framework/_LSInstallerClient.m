@interface _LSInstallerClient
+ (id)makeServerInstallerConnection;
+ (id)syncServerInstallerProxyForShim;
+ (void)makeServerInstallerConnection;
@end

@implementation _LSInstallerClient

+ (id)makeServerInstallerConnection
{
  self;
  v0 = _LSDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    +[_LSInstallerClient makeServerInstallerConnection]();
  }

  v1 = [(id)__LSDefaultsGetSharedInstance() serviceNameForConnectionType:6];
  uint64_t v2 = _LSGetAuditTokenForSelf();
  int v3 = _LSCheckMachPortAccessForAuditToken(v2, v1);

  v4 = _LSDefaultLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      +[_LSInstallerClient makeServerInstallerConnection]();
    }

    id v6 = objc_alloc(MEMORY[0x1E4F29268]);
    v7 = [(id)__LSDefaultsGetSharedInstance() serviceNameForConnectionType:6];
    v8 = (void *)[v6 initWithMachServiceName:v7 options:4096];

    uint64_t v9 = installationInterface();
  }
  else
  {
    if (v5) {
      +[_LSInstallerClient makeServerInstallerConnection]();
    }

    id v10 = objc_alloc(MEMORY[0x1E4F29268]);
    v11 = [(id)__LSDefaultsGetSharedInstance() serviceNameForConnectionType:1];
    v8 = (void *)[v10 initWithMachServiceName:v11 options:4096];

    uint64_t v9 = +[_LSDModifyService XPCInterface];
  }
  v12 = (void *)v9;
  [v8 setRemoteObjectInterface:v9];

  [v8 setInterruptionHandler:&__block_literal_global_53];
  [v8 setInvalidationHandler:&__block_literal_global_4];

  return v8;
}

+ (id)syncServerInstallerProxyForShim
{
  self;
  v0 = +[_LSInstallerClient makeServerInstallerConnection]();
  v1 = [v0 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_7_1];
  [v0 resume];

  return v1;
}

+ (void)makeServerInstallerConnection
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_7(&dword_182959000, v0, v1, "Checking if this process can access the com.apple.lsd.installation service name", v2, v3, v4, v5, v6);
}

@end