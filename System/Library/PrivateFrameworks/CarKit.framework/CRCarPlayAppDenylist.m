@interface CRCarPlayAppDenylist
- (BOOL)containsBundleIdentifier:(id)a3;
- (CRCarPlayAppDenylist)init;
- (NSSet)denylistedBundleIDs;
- (NSXPCConnection)connection;
- (id)_denylistPreference;
- (void)_requestDenylistUpdate;
- (void)_setupConnection;
- (void)dealloc;
- (void)setConnection:(id)a3;
- (void)setDenylistedBundleIDs:(id)a3;
@end

@implementation CRCarPlayAppDenylist

- (CRCarPlayAppDenylist)init
{
  v9.receiver = self;
  v9.super_class = (Class)CRCarPlayAppDenylist;
  v2 = [(CRCarPlayAppDenylist *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(CRCarPlayAppDenylist *)v2 _setupConnection];
    v4 = (void *)MEMORY[0x1E4F1CAD0];
    v5 = [(CRCarPlayAppDenylist *)v3 _denylistPreference];
    uint64_t v6 = [v4 setWithArray:v5];
    denylistedBundleIDs = v3->_denylistedBundleIDs;
    v3->_denylistedBundleIDs = (NSSet *)v6;

    [(CRCarPlayAppDenylist *)v3 _requestDenylistUpdate];
  }
  return v3;
}

- (void)_setupConnection
{
  v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0327300];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.carkit.app.service" options:4096];
  [v4 setRemoteObjectInterface:v3];
  v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_DEFAULT, "Connecting to app denylist service.", v6, 2u);
  }

  [v4 resume];
  [(CRCarPlayAppDenylist *)self setConnection:v4];
}

- (void)dealloc
{
  v3 = [(CRCarPlayAppDenylist *)self connection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)CRCarPlayAppDenylist;
  [(CRCarPlayAppDenylist *)&v4 dealloc];
}

- (id)_denylistPreference
{
  v2 = (void *)CFPreferencesCopyAppValue(CRCarPlayAppDenylistPreferenceKey, CRPreferencesNotMigratedDomain);
  return v2;
}

- (BOOL)containsBundleIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CRCarPlayAppDenylist *)self denylistedBundleIDs];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    v7 = CarGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_1ABB00000, v7, OS_LOG_TYPE_DEFAULT, "app %@ is CarPlay denylisted", (uint8_t *)&v9, 0xCu);
    }
  }
  return v6;
}

- (void)_requestDenylistUpdate
{
  v2 = [(CRCarPlayAppDenylist *)self connection];
  id v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_4];

  [v3 requestDenylistUpdate];
}

void __46__CRCarPlayAppDenylist__requestDenylistUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __46__CRCarPlayAppDenylist__requestDenylistUpdate__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSSet)denylistedBundleIDs
{
  return self->_denylistedBundleIDs;
}

- (void)setDenylistedBundleIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denylistedBundleIDs, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __46__CRCarPlayAppDenylist__requestDenylistUpdate__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1ABB00000, a2, OS_LOG_TYPE_ERROR, "CarPlay denylist service error: %@", (uint8_t *)&v2, 0xCu);
}

@end