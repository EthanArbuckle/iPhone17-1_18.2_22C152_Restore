@interface CXXPCCallSource
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)hasVoIPBackgroundMode;
- (BOOL)isConnected;
- (BOOL)isPermittedToUseBluetoothAccessories;
- (BOOL)isPermittedToUsePrivateAPI;
- (BOOL)isPermittedToUsePublicAPI;
- (CXXPCCallSource)init;
- (CXXPCCallSource)initWithConnection:(id)a3;
- (NSSet)capabilities;
- (NSXPCConnection)connection;
- (id)bundleIdentifier;
- (id)bundleURL;
- (id)localizedName;
- (id)vendorProtocolDelegate;
- (int)processIdentifier;
- (os_unfair_lock_s)accessorLock;
- (void)dealloc;
- (void)setConnection:(id)a3;
@end

@implementation CXXPCCallSource

- (CXXPCCallSource)init
{
  return 0;
}

- (CXXPCCallSource)initWithConnection:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = objc_msgSend(v5, "cx_applicationIdentifier");
  v41.receiver = self;
  v41.super_class = (Class)CXXPCCallSource;
  v7 = [(CXCallSource *)&v41 initWithIdentifier:v6];

  if (v7)
  {
    v7->_accessorLock._os_unfair_lock_opaque = 0;
    uint64_t v8 = objc_msgSend(v5, "cx_capabilities");
    capabilities = v7->_capabilities;
    v7->_capabilities = (NSSet *)v8;

    v10 = objc_msgSend(MEMORY[0x1E4F223C8], "cx_applicationRecordForConnection:", v5);
    uint64_t v11 = [v10 bundleIdentifier];
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v11;

    uint64_t v13 = [v10 URL];
    bundleURL = v7->_bundleURL;
    v7->_bundleURL = (NSURL *)v13;

    v7->_BOOL hasVoIPBackgroundMode = [v10 containsBackgroundModeOptions:1];
    v15 = [v10 localizedName];
    uint64_t v16 = [v15 copy];
    localizedName = v7->_localizedName;
    v7->_localizedName = (NSString *)v16;

    if (v7->_hasVoIPBackgroundMode || [(CXXPCCallSource *)v7 isPermittedToUsePrivateAPI])
    {
      objc_storeStrong((id *)&v7->_connection, a3);
      [(NSXPCConnection *)v7->_connection setExportedObject:v7];
      v18 = objc_msgSend(MEMORY[0x1E4F29280], "cx_providerHostInterface");
      [(NSXPCConnection *)v7->_connection setExportedInterface:v18];

      v19 = objc_msgSend(MEMORY[0x1E4F29280], "cx_providerVendorInterface");
      [(NSXPCConnection *)v7->_connection setRemoteObjectInterface:v19];

      objc_initWeak(&location, v7);
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __38__CXXPCCallSource_initWithConnection___block_invoke;
      v38[3] = &unk_1E5CADED0;
      objc_copyWeak(&v39, &location);
      [(NSXPCConnection *)v7->_connection setInterruptionHandler:v38];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __38__CXXPCCallSource_initWithConnection___block_invoke_3;
      v36[3] = &unk_1E5CADED0;
      objc_copyWeak(&v37, &location);
      [(NSXPCConnection *)v7->_connection setInvalidationHandler:v36];
      [(NSXPCConnection *)v7->_connection resume];
      v20 = CXDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = (id)objc_opt_class();
        v22 = [(CXCallSource *)v7 identifier];
        v23 = v7->_bundleIdentifier;
        v24 = v7->_bundleURL;
        BOOL hasVoIPBackgroundMode = v7->_hasVoIPBackgroundMode;
        v26 = v7->_capabilities;
        *(_DWORD *)buf = 138413826;
        id v43 = v21;
        __int16 v44 = 2112;
        v45 = v22;
        __int16 v46 = 2112;
        v47 = v23;
        __int16 v48 = 2112;
        v49 = v24;
        __int16 v50 = 1024;
        BOOL v51 = hasVoIPBackgroundMode;
        __int16 v52 = 2112;
        v53 = v26;
        __int16 v54 = 2112;
        id v55 = v5;
        _os_log_impl(&dword_1A6E3A000, v20, OS_LOG_TYPE_DEFAULT, "Created %@ with identifier: %@ bundleIdentifier: %@ bundleURL: %@ hasVoIPBackgroundMode: %d capabilities: %@ connection: %@", buf, 0x44u);
      }
      objc_destroyWeak(&v37);
      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
    }
    else
    {
      v28 = CXDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = objc_opt_class();
        id v30 = v29;
        v31 = [(CXCallSource *)v7 identifier];
        v32 = v7->_bundleIdentifier;
        v33 = v7->_bundleURL;
        BOOL v34 = v7->_hasVoIPBackgroundMode;
        v35 = v7->_capabilities;
        *(_DWORD *)buf = 138413826;
        id v43 = v29;
        __int16 v44 = 2112;
        v45 = v31;
        __int16 v46 = 2112;
        v47 = v32;
        __int16 v48 = 2112;
        v49 = v33;
        __int16 v50 = 1024;
        BOOL v51 = v34;
        __int16 v52 = 2112;
        v53 = v35;
        __int16 v54 = 2112;
        id v55 = v5;
        _os_log_error_impl(&dword_1A6E3A000, v28, OS_LOG_TYPE_ERROR, "Denying creation of %@ with identifier: %@ bundleIdentifier: %@ bundleURL: %@ hasVoIPBackgroundMode: %d capabilities: %@ connection: %@", buf, 0x44u);
      }
      v7 = 0;
    }
  }
  return v7;
}

void __38__CXXPCCallSource_initWithConnection___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = CXDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = WeakRetained;
      _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted for XPC call source %@", (uint8_t *)&v4, 0xCu);
    }

    v3 = [WeakRetained connection];
    [v3 invalidate];
  }
}

void __38__CXXPCCallSource_initWithConnection___block_invoke_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = CXDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v7 = WeakRetained;
      _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated for XPC call source %@", buf, 0xCu);
    }

    [WeakRetained setConnection:0];
    v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__CXXPCCallSource_initWithConnection___block_invoke_4;
    block[3] = &unk_1E5CADD30;
    id v5 = WeakRetained;
    dispatch_async(v3, block);
  }
}

void __38__CXXPCCallSource_initWithConnection___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callSourceInvalidated:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CXXPCCallSource;
  [(CXXPCCallSource *)&v3 dealloc];
}

- (NSXPCConnection)connection
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock_with_options();
  int v4 = self->_connection;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setConnection:(id)a3
{
  id v5 = (NSXPCConnection *)a3;
  os_unfair_lock_lock_with_options();
  if (self->_connection != v5) {
    objc_storeStrong((id *)&self->_connection, a3);
  }
  os_unfair_lock_unlock(&self->_accessorLock);
}

- (BOOL)isConnected
{
  id v2 = [(CXXPCCallSource *)self connection];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int)processIdentifier
{
  id v2 = [(CXXPCCallSource *)self connection];
  int v3 = [v2 processIdentifier];

  return v3;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  int v4 = [(CXXPCCallSource *)self connection];
  if (v4)
  {
    uint64_t v6 = v4;
    [v4 auditToken];
    int v4 = v6;
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (BOOL)isPermittedToUsePublicAPI
{
  if ([(CXXPCCallSource *)self isPermittedToUsePrivateAPI]) {
    return 1;
  }

  return [(CXXPCCallSource *)self hasVoIPBackgroundMode];
}

- (BOOL)isPermittedToUsePrivateAPI
{
  id v2 = [(CXXPCCallSource *)self capabilities];
  char v3 = [v2 containsObject:@"private-provider-api"];

  return v3;
}

- (BOOL)isPermittedToUseBluetoothAccessories
{
  Mutable = CFDictionaryCreateMutable(0, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4FA99C8], (const void *)*MEMORY[0x1E4F1CFC8]);
  int v4 = [(CXXPCCallSource *)self connection];
  id v5 = v4;
  if (v4) {
    [v4 auditToken];
  }
  BOOL v6 = TCCAccessCheckAuditToken() != 0;

  CFRelease(Mutable);
  return v6;
}

- (id)vendorProtocolDelegate
{
  id v2 = [(CXXPCCallSource *)self connection];
  char v3 = [v2 remoteObjectProxy];

  return v3;
}

- (id)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (id)bundleURL
{
  return self->_bundleURL;
}

- (id)localizedName
{
  return self->_localizedName;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (NSSet)capabilities
{
  return self->_capabilities;
}

- (BOOL)hasVoIPBackgroundMode
{
  return self->_hasVoIPBackgroundMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end