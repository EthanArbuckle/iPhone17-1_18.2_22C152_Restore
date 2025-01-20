@interface CXXPCVoicemailSource
- (BOOL)isConnected;
- (BOOL)isPermittedToUsePrivateAPI;
- (CXXPCVoicemailSource)init;
- (CXXPCVoicemailSource)initWithConnection:(id)a3;
- (NSSet)capabilities;
- (NSString)applicationIdentifier;
- (NSString)bundleIdentifier;
- (NSURL)bundleURL;
- (NSXPCConnection)connection;
- (id)vendorProtocolDelegate;
- (int)processIdentifier;
- (void)dealloc;
- (void)setApplicationIdentifier:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleURL:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation CXXPCVoicemailSource

- (CXXPCVoicemailSource)init
{
  return 0;
}

- (CXXPCVoicemailSource)initWithConnection:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CXXPCVoicemailSource;
  v6 = [(CXVoicemailSource *)&v38 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend(v5, "cx_applicationIdentifier");
    applicationIdentifier = v6->_applicationIdentifier;
    v6->_applicationIdentifier = (NSString *)v7;

    uint64_t v9 = objc_msgSend(v5, "cx_capabilities");
    capabilities = v6->_capabilities;
    v6->_capabilities = (NSSet *)v9;

    v11 = objc_msgSend(MEMORY[0x1E4F223C8], "cx_applicationRecordForConnection:", v5);
    uint64_t v12 = [v11 bundleIdentifier];
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v12;

    uint64_t v14 = [v11 URL];
    bundleURL = v6->_bundleURL;
    v6->_bundleURL = (NSURL *)v14;

    if (v6->_applicationIdentifier
      && [(CXXPCVoicemailSource *)v6 isPermittedToUsePrivateAPI])
    {
      objc_storeStrong((id *)&v6->_connection, a3);
      [(NSXPCConnection *)v6->_connection setExportedObject:v6];
      v16 = objc_msgSend(MEMORY[0x1E4F29280], "cx_voicemailProviderHostInterface");
      [(NSXPCConnection *)v6->_connection setExportedInterface:v16];

      v17 = objc_msgSend(MEMORY[0x1E4F29280], "cx_voicemailProviderVendorInterface");
      [(NSXPCConnection *)v6->_connection setRemoteObjectInterface:v17];

      objc_initWeak(&location, v6);
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __43__CXXPCVoicemailSource_initWithConnection___block_invoke;
      v35[3] = &unk_1E5CADED0;
      objc_copyWeak(&v36, &location);
      [(NSXPCConnection *)v6->_connection setInterruptionHandler:v35];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __43__CXXPCVoicemailSource_initWithConnection___block_invoke_3;
      v33[3] = &unk_1E5CADED0;
      objc_copyWeak(&v34, &location);
      [(NSXPCConnection *)v6->_connection setInvalidationHandler:v33];
      [(NSXPCConnection *)v6->_connection resume];
      v18 = CXDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = objc_opt_class();
        v20 = v6->_applicationIdentifier;
        v21 = v6->_bundleIdentifier;
        v22 = v6->_bundleURL;
        v23 = v6->_capabilities;
        *(_DWORD *)buf = 138413570;
        v40 = v19;
        __int16 v41 = 2112;
        v42 = v20;
        __int16 v43 = 2112;
        v44 = v21;
        __int16 v45 = 2112;
        v46 = v22;
        __int16 v47 = 2112;
        v48 = v23;
        __int16 v49 = 2112;
        id v50 = v5;
        id v24 = v19;
        _os_log_impl(&dword_1A6E3A000, v18, OS_LOG_TYPE_DEFAULT, "Created %@ with applicationIdentifier: %@ bundleIdentifier: %@ bundleURL: %@ capabilities: %@ connection: %@", buf, 0x3Eu);
      }
      objc_destroyWeak(&v34);
      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);
    }
    else
    {
      v25 = CXDefaultLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v27 = objc_opt_class();
        v28 = v6->_applicationIdentifier;
        v29 = v6->_bundleIdentifier;
        v30 = v6->_bundleURL;
        v31 = v6->_capabilities;
        *(_DWORD *)buf = 138413570;
        v40 = v27;
        __int16 v41 = 2112;
        v42 = v28;
        __int16 v43 = 2112;
        v44 = v29;
        __int16 v45 = 2112;
        v46 = v30;
        __int16 v47 = 2112;
        v48 = v31;
        __int16 v49 = 2112;
        id v50 = v5;
        id v32 = v27;
        _os_log_error_impl(&dword_1A6E3A000, v25, OS_LOG_TYPE_ERROR, "Denying creation of %@ with applicationIdentifier: %@ bundleIdentifier: %@ bundleURL: %@ capabilities: %@ connection: %@", buf, 0x3Eu);
      }
      v6 = 0;
    }
  }
  return v6;
}

void __43__CXXPCVoicemailSource_initWithConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CXXPCVoicemailSource_initWithConnection___block_invoke_2;
  block[3] = &unk_1E5CADD30;
  id v5 = WeakRetained;
  id v3 = WeakRetained;
  dispatch_async(v2, block);
}

void __43__CXXPCVoicemailSource_initWithConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted for XPC voicemail source %@", (uint8_t *)&v5, 0xCu);
  }

  v4 = [*(id *)(a1 + 32) connection];
  [v4 invalidate];
}

void __43__CXXPCVoicemailSource_initWithConnection___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CXXPCVoicemailSource_initWithConnection___block_invoke_2_4;
  block[3] = &unk_1E5CADD30;
  id v5 = WeakRetained;
  id v3 = WeakRetained;
  dispatch_async(v2, block);
}

void __43__CXXPCVoicemailSource_initWithConnection___block_invoke_2_4(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated for XPC voicemail source %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) setConnection:0];
  v4 = [*(id *)(a1 + 32) delegate];
  [v4 voicemailSourceInvalidated:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CXXPCVoicemailSource;
  [(CXXPCVoicemailSource *)&v3 dealloc];
}

- (BOOL)isConnected
{
  v2 = [(CXXPCVoicemailSource *)self connection];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int)processIdentifier
{
  v2 = [(CXXPCVoicemailSource *)self connection];
  int v3 = [v2 processIdentifier];

  return v3;
}

- (BOOL)isPermittedToUsePrivateAPI
{
  v2 = [(CXXPCVoicemailSource *)self capabilities];
  char v3 = [v2 containsObject:@"private-voicemail-provider-api"];

  return v3;
}

- (id)vendorProtocolDelegate
{
  v2 = [(CXXPCVoicemailSource *)self connection];
  char v3 = [v2 remoteObjectProxy];

  return v3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void)setBundleURL:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSSet)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end