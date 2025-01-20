@interface UARPControllerXPC
- (BOOL)addAccessory:(id)a3 assetID:(id)a4;
- (BOOL)changeAssetLocation:(id)a3 assetID:(id)a4;
- (BOOL)checkForUpdate:(id)a3;
- (BOOL)disableTRMSystemAuthenticationForRegistryEntryID:(id)a3;
- (BOOL)downloadAvailableFirmwareUpdate:(id)a3 assetID:(id)a4 withUserIntent:(BOOL)a5;
- (BOOL)downloadReleaseNotes:(id)a3 assetID:(id)a4;
- (BOOL)enableTRMSystemAuthenticationForRegistryEntryID:(id)a3;
- (BOOL)getAttestationCertificates:(id)a3 assetID:(id)a4;
- (BOOL)getSupportedAccessories:(id)a3 assetID:(id)a4 batchRequest:(BOOL)a5;
- (BOOL)getSupportedAccessories:(id)a3 forProductGroup:(id)a4;
- (BOOL)performSynchronousProviderInvocation:(id)a3 accessory:(id)a4 requireKnown:(BOOL)a5 description:(const char *)a6;
- (BOOL)personalizationVectorForAccessory:(id)a3 assetTag:(unsigned int)a4 outVector:(unsigned int *)a5;
- (BOOL)removeAccessory:(id)a3;
- (BOOL)requestConsent:(id)a3;
- (BOOL)revokeConsentRequest:(id)a3;
- (BOOL)updateProperty:(unint64_t)a3 value:(id)a4 forAccessory:(id)a5;
- (BOOL)useAssetAvailabilityNotifications;
- (NSXPCConnection)xpcConnection;
- (UARPControllerXPC)initWithController:(id)a3;
- (id)getAssetIDForAccessoryID:(id)a3;
- (id)getAttestationCertificates:(id)a3;
- (id)getSandboxExtensionTokenForAssetID:(id)a3;
- (id)getSupplementalAssetNameForAccessoryID:(id)a3;
- (id)invocationForProviderSelector:(SEL)a3;
- (void)dealloc;
- (void)manifestPropertiesReceivedForAccessory:(id)a3 assetTag:(unsigned int)a4 properties:(id)a5;
- (void)progressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5;
- (void)progressForUARPConsentInPostLogout:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5;
- (void)sendFirmwareUpdateProgressForAccessory:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)sendFirmwareUpdateProgressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5;
- (void)sendUpdateFirmwareAnalyticsEventForAccessoryID:(id)a3 assetID:(id)a4 params:(id)a5;
- (void)stagingCompleteForAccessoryID:(id)a3 assetID:(id)a4 status:(unint64_t)a5;
@end

@implementation UARPControllerXPC

- (UARPControllerXPC)initWithController:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UARPControllerXPC;
  v5 = [(UARPControllerXPC *)&v14 init];
  if (v5)
  {
    objc_initWeak(&location, v5);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __40__UARPControllerXPC_initWithController___block_invoke;
    v11[3] = &unk_264492820;
    objc_copyWeak(&v12, &location);
    uint64_t v6 = MEMORY[0x223C1FE50](v11);
    id providerErrorReply = v5->_providerErrorReply;
    v5->_id providerErrorReply = (id)v6;

    os_log_t v8 = os_log_create("com.apple.accessoryupdater.uarp", "xpc");
    xpcLog = v5->_xpcLog;
    v5->_xpcLog = (OS_os_log *)v8;

    objc_storeWeak((id *)&v5->_controller, v4);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __40__UARPControllerXPC_initWithController___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 2, a2);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)UARPControllerXPC;
  [(UARPControllerXPC *)&v3 dealloc];
}

- (NSXPCConnection)xpcConnection
{
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.accessoryupdater.uarp" options:4096];
    v5 = self->_xpcConnection;
    self->_xpcConnection = v4;

    id v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CF0CDC8];
    [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v6];

    v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    id v12 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
    v13 = [(NSXPCConnection *)self->_xpcConnection remoteObjectInterface];
    [v13 setClasses:v12 forSelector:sel_getSupportedAccessories_reply_ argumentIndex:0 ofReply:1];

    [(NSXPCConnection *)self->_xpcConnection resume];
    objc_initWeak(&location, self);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __34__UARPControllerXPC_xpcConnection__block_invoke;
    v17[3] = &unk_264491768;
    objc_copyWeak(&v18, &location);
    [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v17];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __34__UARPControllerXPC_xpcConnection__block_invoke_113;
    v15[3] = &unk_264491768;
    objc_copyWeak(&v16, &location);
    [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

void __34__UARPControllerXPC_xpcConnection__block_invoke(uint64_t a1)
{
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v3 = WeakRetained[4];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4[0] = 0;
      _os_log_impl(&dword_21E079000, v3, OS_LOG_TYPE_INFO, "Connection interrupted", (uint8_t *)v4, 2u);
    }
  }
}

void __34__UARPControllerXPC_xpcConnection__block_invoke_113(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v3 = *((void *)WeakRetained + 4);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21E079000, v3, OS_LOG_TYPE_INFO, "Connection invalidated", v5, 2u);
    }
    id v4 = (void *)v2[1];
    v2[1] = 0;
  }
}

- (id)invocationForProviderSelector:(SEL)a3
{
  objc_method_description MethodDescription = protocol_getMethodDescription((Protocol *)&unk_26CF0CDC8, a3, 1, 1);
  if (MethodDescription.types)
  {
    v5 = [MEMORY[0x263EFF970] signatureWithObjCTypes:MethodDescription.types];
    id v6 = [MEMORY[0x263EFF958] invocationWithMethodSignature:v5];
    [v6 setSelector:a3];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (BOOL)performSynchronousProviderInvocation:(id)a3 accessory:(id)a4 requireKnown:(BOOL)a5 description:(const char *)a6
{
  int v7 = a5;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = v11;
  if (v10)
  {
    id v26 = [v11 getID];
    [v10 setArgument:&v26 atIndex:2];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    int v14 = [WeakRetained accessoryKnown:v12];

    if (v14 == v7)
    {
      lastProviderError = self->_lastProviderError;
      self->_lastProviderError = 0;

      id v18 = [(UARPControllerXPC *)self xpcConnection];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __93__UARPControllerXPC_performSynchronousProviderInvocation_accessory_requireKnown_description___block_invoke;
      v25[3] = &unk_264492848;
      v25[4] = self;
      v19 = [v18 synchronousRemoteObjectProxyWithErrorHandler:v25];

      [v10 invokeWithTarget:v19];
      v20 = self->_lastProviderError;
      BOOL v16 = v20 == 0;
      if (v20)
      {
        xpcLog = self->_xpcLog;
        if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_ERROR))
        {
          v24 = self->_lastProviderError;
          *(_DWORD *)buf = 136446722;
          v28 = a6;
          __int16 v29 = 2114;
          v30 = v24;
          __int16 v31 = 2112;
          v32 = v12;
          _os_log_error_impl(&dword_21E079000, xpcLog, OS_LOG_TYPE_ERROR, "%{public}s: %{public}@ (%@)", buf, 0x20u);
        }
      }
    }
    else
    {
      v15 = self->_xpcLog;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v23 = "known";
        *(_DWORD *)buf = 136446722;
        v28 = a6;
        if (v7) {
          v23 = "unknown";
        }
        __int16 v29 = 2082;
        v30 = (void *)v23;
        __int16 v31 = 2112;
        v32 = v12;
        _os_log_error_impl(&dword_21E079000, v15, OS_LOG_TYPE_ERROR, "%{public}s: %{public}s accessory (%@)", buf, 0x20u);
      }
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

void __93__UARPControllerXPC_performSynchronousProviderInvocation_accessory_requireKnown_description___block_invoke(uint64_t a1, void *a2)
{
}

- (BOOL)addAccessory:(id)a3 assetID:(id)a4
{
  id v6 = a4;
  id v13 = v6;
  id v7 = a3;
  uint64_t v8 = [(UARPControllerXPC *)self invocationForProviderSelector:sel_addAccessoryID_assetID_sandboxExtensionToken_reply_];
  id v12 = 0;
  if (v6 && !objc_msgSend(v6, "type", v12, v13))
  {
    uint64_t v9 = [v6 remoteURL];
    id v12 = +[UARPSandboxExtension readWriteTokenStringWithURL:v9];
  }
  objc_msgSend(v8, "setArgument:atIndex:", &v13, 3, v12);
  [v8 setArgument:&v12 atIndex:4];
  [v8 setArgument:&self->_providerErrorReply atIndex:5];
  BOOL v10 = [(UARPControllerXPC *)self performSynchronousProviderInvocation:v8 accessory:v7 requireKnown:0 description:"Add accessory"];

  return v10;
}

- (BOOL)removeAccessory:(id)a3
{
  id v4 = a3;
  v5 = [(UARPControllerXPC *)self invocationForProviderSelector:sel_removeAccessoryID_reply_];
  [v5 setArgument:&self->_providerErrorReply atIndex:3];
  LOBYTE(self) = [(UARPControllerXPC *)self performSynchronousProviderInvocation:v5 accessory:v4 requireKnown:1 description:"Remove accessory"];

  return (char)self;
}

- (BOOL)changeAssetLocation:(id)a3 assetID:(id)a4
{
  id v6 = a4;
  id v13 = v6;
  id v7 = a3;
  uint64_t v8 = [(UARPControllerXPC *)self invocationForProviderSelector:sel_changeAssetLocation_assetID_sandboxExtensionToken_reply_];
  id v12 = 0;
  if (v6 && !objc_msgSend(v6, "type", v12, v13))
  {
    uint64_t v9 = [v6 remoteURL];
    id v12 = +[UARPSandboxExtension readWriteTokenStringWithURL:v9];
  }
  objc_msgSend(v8, "setArgument:atIndex:", &v13, 3, v12);
  [v8 setArgument:&v12 atIndex:4];
  [v8 setArgument:&self->_providerErrorReply atIndex:5];
  BOOL v10 = [(UARPControllerXPC *)self performSynchronousProviderInvocation:v8 accessory:v7 requireKnown:1 description:"Change asset location"];

  return v10;
}

- (BOOL)downloadAvailableFirmwareUpdate:(id)a3 assetID:(id)a4 withUserIntent:(BOOL)a5
{
  id v12 = a4;
  BOOL v11 = a5;
  id v8 = a3;
  uint64_t v9 = [(UARPControllerXPC *)self invocationForProviderSelector:sel_downloadFirmwareForAccessoryID_assetID_userIntent_reply_];
  [v9 setArgument:&v12 atIndex:3];
  [v9 setArgument:&v11 atIndex:4];
  [v9 setArgument:&self->_providerErrorReply atIndex:5];
  LOBYTE(self) = [(UARPControllerXPC *)self performSynchronousProviderInvocation:v9 accessory:v8 requireKnown:1 description:"Download asset"];

  return (char)self;
}

- (BOOL)downloadReleaseNotes:(id)a3 assetID:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  id v7 = [(UARPControllerXPC *)self invocationForProviderSelector:sel_downloadReleaseNotesForAccessoryID_assetID_reply_];
  [v7 setArgument:&v9 atIndex:3];
  [v7 setArgument:&self->_providerErrorReply atIndex:4];
  LOBYTE(self) = [(UARPControllerXPC *)self performSynchronousProviderInvocation:v7 accessory:v6 requireKnown:1 description:"Download release notes"];

  return (char)self;
}

- (void)sendFirmwareUpdateProgressForAccessory:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a3;
  id v14 = [(UARPControllerXPC *)self xpcConnection];
  id v12 = [v14 remoteObjectProxy];
  id v13 = [v11 getID];

  [v12 firmwareUpdateProgressForAccessoryID:v13 assetID:v10 bytesSent:a5 bytesTotal:a6];
}

- (void)stagingCompleteForAccessoryID:(id)a3 assetID:(id)a4 status:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v11 = [(UARPControllerXPC *)self xpcConnection];
  id v10 = [v11 remoteObjectProxy];
  [v10 stagingCompleteForAccessoryID:v9 assetID:v8 status:a5];
}

- (void)sendFirmwareUpdateProgressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  id v8 = a3;
  id v10 = [(UARPControllerXPC *)self xpcConnection];
  id v9 = [v10 remoteObjectProxy];
  [v9 firmwareUpdateProgressForUARPConsent:v8 bytesSent:a4 bytesTotal:a5];
}

- (void)progressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  id v8 = a3;
  id v10 = [(UARPControllerXPC *)self xpcConnection];
  id v9 = [v10 remoteObjectProxy];
  [v9 progressForUARPConsent:v8 bytesSent:a4 bytesTotal:a5];
}

- (void)progressForUARPConsentInPostLogout:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  id v8 = a3;
  id v10 = [(UARPControllerXPC *)self xpcConnection];
  id v9 = [v10 remoteObjectProxy];
  [v9 progressForUARPConsentInPostLogout:v8 bytesSent:a4 bytesTotal:a5];
}

- (BOOL)checkForUpdate:(id)a3
{
  id v4 = a3;
  v5 = [(UARPControllerXPC *)self invocationForProviderSelector:sel_checkForUpdate_reply_];
  [v5 setArgument:&self->_providerErrorReply atIndex:3];
  LOBYTE(self) = [(UARPControllerXPC *)self performSynchronousProviderInvocation:v5 accessory:v4 requireKnown:1 description:"Check for update"];

  return (char)self;
}

- (BOOL)personalizationVectorForAccessory:(id)a3 assetTag:(unsigned int)a4 outVector:(unsigned int *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  char v10 = [WeakRetained accessoryKnown:v8];

  if (v10)
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    __int16 v29 = __Block_byref_object_copy__2;
    v30 = __Block_byref_object_dispose__2;
    id v31 = 0;
    id v11 = [(UARPControllerXPC *)self xpcConnection];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __74__UARPControllerXPC_personalizationVectorForAccessory_assetTag_outVector___block_invoke;
    v25[3] = &unk_264492870;
    v25[4] = &v26;
    id v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v25];

    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2020000000;
    int v24 = 0;
    id v13 = [v8 getID];
    id v14 = [NSNumber numberWithUnsignedInt:v6];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __74__UARPControllerXPC_personalizationVectorForAccessory_assetTag_outVector___block_invoke_2;
    v20[3] = &unk_264492898;
    v20[4] = &v21;
    v20[5] = &v26;
    [v12 personalizationVectorForAccessoryID:v13 assetTag:v14 reply:v20];

    v15 = v27;
    if (v27[5])
    {
      xpcLog = self->_xpcLog;
      if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = v27[5];
        *(_DWORD *)buf = 136315906;
        uint64_t v33 = "-[UARPControllerXPC personalizationVectorForAccessory:assetTag:outVector:]";
        __int16 v34 = 1024;
        int v35 = v6;
        __int16 v36 = 2112;
        id v37 = v8;
        __int16 v38 = 2112;
        uint64_t v39 = v19;
        _os_log_error_impl(&dword_21E079000, xpcLog, OS_LOG_TYPE_ERROR, "%s: Failed to query assetTag 0x%08x for %@ (%@)", buf, 0x26u);
      }
      v15 = v27;
    }
    else
    {
      *a5 = *((_DWORD *)v22 + 6);
    }
    BOOL v17 = v15[5] == 0;
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_xpcLog, OS_LOG_TYPE_ERROR)) {
      -[UARPControllerXPC personalizationVectorForAccessory:assetTag:outVector:]();
    }
    BOOL v17 = 0;
  }

  return v17;
}

void __74__UARPControllerXPC_personalizationVectorForAccessory_assetTag_outVector___block_invoke(uint64_t a1, void *a2)
{
}

void __74__UARPControllerXPC_personalizationVectorForAccessory_assetTag_outVector___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v6 = a2;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v6 = v7;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
}

- (id)getAssetIDForAccessoryID:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  uint64_t v21 = __Block_byref_object_dispose__2;
  id v22 = 0;
  v5 = [(UARPControllerXPC *)self xpcConnection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __46__UARPControllerXPC_getAssetIDForAccessoryID___block_invoke;
  v16[3] = &unk_264492870;
  v16[4] = &v17;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v16];

  if (v18[5])
  {
    if (os_log_type_enabled((os_log_t)self->_xpcLog, OS_LOG_TYPE_ERROR)) {
      -[UARPControllerXPC getAssetIDForAccessoryID:]();
    }
    id v7 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    id v13 = __Block_byref_object_copy__2;
    id v14 = __Block_byref_object_dispose__2;
    id v15 = 0;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __46__UARPControllerXPC_getAssetIDForAccessoryID___block_invoke_133;
    v9[3] = &unk_2644928C0;
    v9[4] = &v10;
    [v6 getAssetIDForAccessoryID:v4 reply:v9];
    id v7 = (id)v11[5];
    _Block_object_dispose(&v10, 8);
  }
  _Block_object_dispose(&v17, 8);

  return v7;
}

void __46__UARPControllerXPC_getAssetIDForAccessoryID___block_invoke(uint64_t a1, void *a2)
{
}

void __46__UARPControllerXPC_getAssetIDForAccessoryID___block_invoke_133(uint64_t a1, void *a2)
{
}

- (id)getSupplementalAssetNameForAccessoryID:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  uint64_t v21 = __Block_byref_object_dispose__2;
  id v22 = 0;
  v5 = [(UARPControllerXPC *)self xpcConnection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __60__UARPControllerXPC_getSupplementalAssetNameForAccessoryID___block_invoke;
  v16[3] = &unk_264492870;
  v16[4] = &v17;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v16];

  if (v18[5])
  {
    if (os_log_type_enabled((os_log_t)self->_xpcLog, OS_LOG_TYPE_ERROR)) {
      -[UARPControllerXPC getSupplementalAssetNameForAccessoryID:]();
    }
    id v7 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    id v13 = __Block_byref_object_copy__2;
    id v14 = __Block_byref_object_dispose__2;
    id v15 = 0;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __60__UARPControllerXPC_getSupplementalAssetNameForAccessoryID___block_invoke_135;
    v9[3] = &unk_2644928E8;
    v9[4] = &v10;
    [v6 getSupplementalAssetNameForAccessoryID:v4 reply:v9];
    id v7 = (id)v11[5];
    _Block_object_dispose(&v10, 8);
  }
  _Block_object_dispose(&v17, 8);

  return v7;
}

void __60__UARPControllerXPC_getSupplementalAssetNameForAccessoryID___block_invoke(uint64_t a1, void *a2)
{
}

void __60__UARPControllerXPC_getSupplementalAssetNameForAccessoryID___block_invoke_135(uint64_t a1, void *a2)
{
}

- (void)manifestPropertiesReceivedForAccessory:(id)a3 assetTag:(unsigned int)a4 properties:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  char v11 = [WeakRetained accessoryKnown:v8];

  if (v11)
  {
    uint64_t v12 = [(UARPControllerXPC *)self xpcConnection];
    id v13 = [v12 remoteObjectProxy];
    id v14 = [v8 getID];
    [v13 manifestPropertiesReceivedForAccessoryID:v14 assetTag:v6 properties:v9];
  }
  else if (os_log_type_enabled((os_log_t)self->_xpcLog, OS_LOG_TYPE_ERROR))
  {
    -[UARPControllerXPC manifestPropertiesReceivedForAccessory:assetTag:properties:]();
  }
}

- (void)sendUpdateFirmwareAnalyticsEventForAccessoryID:(id)a3 assetID:(id)a4 params:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  char v12 = [WeakRetained accessoryIDKnown:v8];

  if (v12)
  {
    id v13 = [(UARPControllerXPC *)self xpcConnection];
    id v14 = [v13 remoteObjectProxy];
    [v14 sendUpdateFirmwareAnalyticsEventForAccessoryID:v8 assetID:v9 params:v10];
  }
  else if (os_log_type_enabled((os_log_t)self->_xpcLog, OS_LOG_TYPE_ERROR))
  {
    -[UARPControllerXPC sendUpdateFirmwareAnalyticsEventForAccessoryID:assetID:params:]();
  }
}

- (BOOL)updateProperty:(unint64_t)a3 value:(id)a4 forAccessory:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  char v11 = [WeakRetained accessoryKnown:v9];

  if (v11)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = __Block_byref_object_copy__2;
    uint64_t v23 = __Block_byref_object_dispose__2;
    id v24 = 0;
    char v12 = [(UARPControllerXPC *)self xpcConnection];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __55__UARPControllerXPC_updateProperty_value_forAccessory___block_invoke;
    v18[3] = &unk_264492870;
    v18[4] = &v19;
    id v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v18];

    id v14 = [v9 getID];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __55__UARPControllerXPC_updateProperty_value_forAccessory___block_invoke_2;
    v17[3] = &unk_264492870;
    void v17[4] = &v19;
    [v13 updateProperty:a3 value:v8 forAccessory:v14 reply:v17];

    BOOL v15 = v20[5] == 0;
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_xpcLog, OS_LOG_TYPE_ERROR)) {
      -[UARPControllerXPC updateProperty:value:forAccessory:]();
    }
    BOOL v15 = 0;
  }

  return v15;
}

void __55__UARPControllerXPC_updateProperty_value_forAccessory___block_invoke(uint64_t a1, void *a2)
{
}

void __55__UARPControllerXPC_updateProperty_value_forAccessory___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)useAssetAvailabilityNotifications
{
  return 1;
}

- (BOOL)getSupportedAccessories:(id)a3 forProductGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    __int16 v29 = __Block_byref_object_copy__2;
    v30 = __Block_byref_object_dispose__2;
    id v31 = 0;
    id v8 = [(UARPControllerXPC *)self xpcConnection];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __61__UARPControllerXPC_getSupportedAccessories_forProductGroup___block_invoke;
    v25[3] = &unk_264492870;
    v25[4] = &v26;
    id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v25];

    if (v27[5])
    {
      if (os_log_type_enabled((os_log_t)self->_xpcLog, OS_LOG_TYPE_ERROR)) {
        -[UARPControllerXPC getSupportedAccessories:forProductGroup:]();
      }
      BOOL v10 = 0;
    }
    else
    {
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x3032000000;
      id v22 = __Block_byref_object_copy__2;
      uint64_t v23 = __Block_byref_object_dispose__2;
      id v24 = 0;
      uint64_t v15 = 0;
      BOOL v16 = &v15;
      uint64_t v17 = 0x2020000000;
      char v18 = 1;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __61__UARPControllerXPC_getSupportedAccessories_forProductGroup___block_invoke_137;
      v14[3] = &unk_264492910;
      v14[4] = &v19;
      v14[5] = &v15;
      [v9 getSupportedAccessories:v7 reply:v14];
      char v12 = [(id)v20[5] allObjects];
      [v6 addObjectsFromArray:v12];

      BOOL v10 = *((unsigned char *)v16 + 24) != 0;
      _Block_object_dispose(&v15, 8);
      _Block_object_dispose(&v19, 8);
    }
    _Block_object_dispose(&v26, 8);
  }
  else
  {
    xpcLog = self->_xpcLog;
    if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_ERROR)) {
      -[UARPControllerXPC getSupportedAccessories:forProductGroup:](xpcLog);
    }
    BOOL v10 = 0;
  }

  return v10;
}

void __61__UARPControllerXPC_getSupportedAccessories_forProductGroup___block_invoke(uint64_t a1, void *a2)
{
}

void __61__UARPControllerXPC_getSupportedAccessories_forProductGroup___block_invoke_137(uint64_t a1, void *a2, char a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v6 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
}

- (BOOL)getSupportedAccessories:(id)a3 assetID:(id)a4 batchRequest:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v15 = 0;
  BOOL v16 = &v15;
  uint64_t v17 = 0x3032000000;
  char v18 = __Block_byref_object_copy__2;
  uint64_t v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  BOOL v10 = [(UARPControllerXPC *)self xpcConnection];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__UARPControllerXPC_getSupportedAccessories_assetID_batchRequest___block_invoke;
  v14[3] = &unk_264492870;
  v14[4] = &v15;
  char v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v14];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__UARPControllerXPC_getSupportedAccessories_assetID_batchRequest___block_invoke_2;
  v13[3] = &unk_264492870;
  v13[4] = &v15;
  [v11 getSupportedAccessories:v8 assetID:v9 batchRequest:v5 reply:v13];
  LOBYTE(v5) = v16[5] == 0;

  _Block_object_dispose(&v15, 8);
  return v5;
}

void __66__UARPControllerXPC_getSupportedAccessories_assetID_batchRequest___block_invoke(uint64_t a1, void *a2)
{
}

void __66__UARPControllerXPC_getSupportedAccessories_assetID_batchRequest___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)getAttestationCertificates:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__2;
  uint64_t v21 = __Block_byref_object_dispose__2;
  id v22 = 0;
  BOOL v5 = [(UARPControllerXPC *)self xpcConnection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __48__UARPControllerXPC_getAttestationCertificates___block_invoke;
  v16[3] = &unk_264492870;
  v16[4] = &v17;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v16];

  if (v18[5])
  {
    if (os_log_type_enabled((os_log_t)self->_xpcLog, OS_LOG_TYPE_ERROR)) {
      -[UARPControllerXPC getAttestationCertificates:]();
    }
    id v7 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    char v11 = &v10;
    uint64_t v12 = 0x3032000000;
    id v13 = __Block_byref_object_copy__2;
    id v14 = __Block_byref_object_dispose__2;
    id v15 = 0;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __48__UARPControllerXPC_getAttestationCertificates___block_invoke_139;
    v9[3] = &unk_264492938;
    v9[4] = &v10;
    [v6 getAttestationCertificates:v4 reply:v9];
    id v7 = (id)v11[5];
    _Block_object_dispose(&v10, 8);
  }
  _Block_object_dispose(&v17, 8);

  return v7;
}

void __48__UARPControllerXPC_getAttestationCertificates___block_invoke(uint64_t a1, void *a2)
{
}

void __48__UARPControllerXPC_getAttestationCertificates___block_invoke_139(uint64_t a1, void *a2)
{
}

- (BOOL)getAttestationCertificates:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  BOOL v16 = __Block_byref_object_copy__2;
  uint64_t v17 = __Block_byref_object_dispose__2;
  id v18 = 0;
  id v8 = [(UARPControllerXPC *)self xpcConnection];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__UARPControllerXPC_getAttestationCertificates_assetID___block_invoke;
  v12[3] = &unk_264492870;
  v12[4] = &v13;
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__UARPControllerXPC_getAttestationCertificates_assetID___block_invoke_2;
  v11[3] = &unk_264492870;
  void v11[4] = &v13;
  [v9 getAttestationCertificates:v6 assetID:v7 reply:v11];
  LOBYTE(v8) = v14[5] == 0;

  _Block_object_dispose(&v13, 8);
  return (char)v8;
}

void __56__UARPControllerXPC_getAttestationCertificates_assetID___block_invoke(uint64_t a1, void *a2)
{
}

void __56__UARPControllerXPC_getAttestationCertificates_assetID___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)requestConsent:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__2;
  id v14 = __Block_byref_object_dispose__2;
  id v15 = 0;
  BOOL v5 = [(UARPControllerXPC *)self xpcConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __36__UARPControllerXPC_requestConsent___block_invoke;
  v9[3] = &unk_264492870;
  v9[4] = &v10;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__UARPControllerXPC_requestConsent___block_invoke_2;
  v8[3] = &unk_264492870;
  v8[4] = &v10;
  [v6 requestConsent:v4 reply:v8];
  LOBYTE(v5) = v11[5] == 0;

  _Block_object_dispose(&v10, 8);
  return (char)v5;
}

void __36__UARPControllerXPC_requestConsent___block_invoke(uint64_t a1, void *a2)
{
}

void __36__UARPControllerXPC_requestConsent___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)revokeConsentRequest:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__2;
  id v14 = __Block_byref_object_dispose__2;
  id v15 = 0;
  BOOL v5 = [(UARPControllerXPC *)self xpcConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__UARPControllerXPC_revokeConsentRequest___block_invoke;
  v9[3] = &unk_264492870;
  v9[4] = &v10;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__UARPControllerXPC_revokeConsentRequest___block_invoke_2;
  v8[3] = &unk_264492870;
  v8[4] = &v10;
  [v6 revokeConsentRequest:v4 reply:v8];
  LOBYTE(v5) = v11[5] == 0;

  _Block_object_dispose(&v10, 8);
  return (char)v5;
}

void __42__UARPControllerXPC_revokeConsentRequest___block_invoke(uint64_t a1, void *a2)
{
}

void __42__UARPControllerXPC_revokeConsentRequest___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)enableTRMSystemAuthenticationForRegistryEntryID:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__2;
  id v14 = __Block_byref_object_dispose__2;
  id v15 = 0;
  BOOL v5 = [(UARPControllerXPC *)self xpcConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__UARPControllerXPC_enableTRMSystemAuthenticationForRegistryEntryID___block_invoke;
  v9[3] = &unk_264492870;
  v9[4] = &v10;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__UARPControllerXPC_enableTRMSystemAuthenticationForRegistryEntryID___block_invoke_2;
  v8[3] = &unk_264492870;
  v8[4] = &v10;
  [v6 enableTRMSystemAuthenticationForRegistryEntryID:v4 reply:v8];
  LOBYTE(v5) = v11[5] == 0;

  _Block_object_dispose(&v10, 8);
  return (char)v5;
}

void __69__UARPControllerXPC_enableTRMSystemAuthenticationForRegistryEntryID___block_invoke(uint64_t a1, void *a2)
{
}

void __69__UARPControllerXPC_enableTRMSystemAuthenticationForRegistryEntryID___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)disableTRMSystemAuthenticationForRegistryEntryID:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__2;
  id v14 = __Block_byref_object_dispose__2;
  id v15 = 0;
  BOOL v5 = [(UARPControllerXPC *)self xpcConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__UARPControllerXPC_disableTRMSystemAuthenticationForRegistryEntryID___block_invoke;
  v9[3] = &unk_264492870;
  v9[4] = &v10;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__UARPControllerXPC_disableTRMSystemAuthenticationForRegistryEntryID___block_invoke_2;
  v8[3] = &unk_264492870;
  v8[4] = &v10;
  [v6 disableTRMSystemAuthenticationForRegistryEntryID:v4 reply:v8];
  LOBYTE(v5) = v11[5] == 0;

  _Block_object_dispose(&v10, 8);
  return (char)v5;
}

void __70__UARPControllerXPC_disableTRMSystemAuthenticationForRegistryEntryID___block_invoke(uint64_t a1, void *a2)
{
}

void __70__UARPControllerXPC_disableTRMSystemAuthenticationForRegistryEntryID___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)getSandboxExtensionTokenForAssetID:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__2;
  uint64_t v21 = __Block_byref_object_dispose__2;
  id v22 = 0;
  BOOL v5 = [(UARPControllerXPC *)self xpcConnection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __56__UARPControllerXPC_getSandboxExtensionTokenForAssetID___block_invoke;
  v16[3] = &unk_264492870;
  v16[4] = &v17;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v16];

  if (v18[5])
  {
    if (os_log_type_enabled((os_log_t)self->_xpcLog, OS_LOG_TYPE_ERROR)) {
      -[UARPControllerXPC getSandboxExtensionTokenForAssetID:]();
    }
    id v7 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    char v11 = &v10;
    uint64_t v12 = 0x3032000000;
    uint64_t v13 = __Block_byref_object_copy__2;
    id v14 = __Block_byref_object_dispose__2;
    id v15 = 0;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __56__UARPControllerXPC_getSandboxExtensionTokenForAssetID___block_invoke_141;
    v9[3] = &unk_2644928E8;
    v9[4] = &v10;
    [v6 getSandboxExtensionTokenForAssetID:v4 reply:v9];
    id v7 = (id)v11[5];
    _Block_object_dispose(&v10, 8);
  }
  _Block_object_dispose(&v17, 8);

  return v7;
}

void __56__UARPControllerXPC_getSandboxExtensionTokenForAssetID___block_invoke(uint64_t a1, void *a2)
{
}

void __56__UARPControllerXPC_getSandboxExtensionTokenForAssetID___block_invoke_141(uint64_t a1, void *a2)
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_xpcLog, 0);
  objc_storeStrong(&self->_providerErrorReply, 0);
  objc_storeStrong((id *)&self->_lastProviderError, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)personalizationVectorForAccessory:assetTag:outVector:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_21E079000, v0, v1, "%s: unknown accessory (%@)", v2, v3, v4, v5, 2u);
}

- (void)getAssetIDForAccessoryID:.cold.1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_1(&dword_21E079000, v0, v1, "%s: Failed to create proxy (%@)", v2, v3, v4, v5, 2u);
}

- (void)getSupplementalAssetNameForAccessoryID:.cold.1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_1(&dword_21E079000, v0, v1, "%s: Failed to create proxy (%@)", v2, v3, v4, v5, 2u);
}

- (void)manifestPropertiesReceivedForAccessory:assetTag:properties:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_21E079000, v0, v1, "%s: unknown accessory (%@)", v2, v3, v4, v5, 2u);
}

- (void)sendUpdateFirmwareAnalyticsEventForAccessoryID:assetID:params:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_21E079000, v0, v1, "%s: unknown accessory ID (%@)", v2, v3, v4, v5, 2u);
}

- (void)updateProperty:value:forAccessory:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_21E079000, v0, v1, "%s: unknown accessory (%@)", v2, v3, v4, v5, 2u);
}

- (void)getSupportedAccessories:(os_log_t)log forProductGroup:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[UARPControllerXPC getSupportedAccessories:forProductGroup:]";
  _os_log_error_impl(&dword_21E079000, log, OS_LOG_TYPE_ERROR, "%s: Caller provided nil parameter set", (uint8_t *)&v1, 0xCu);
}

- (void)getSupportedAccessories:forProductGroup:.cold.2()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_1(&dword_21E079000, v0, v1, "%s: Failed to create proxy (%@)", v2, v3, v4, v5, 2u);
}

- (void)getAttestationCertificates:.cold.1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_1(&dword_21E079000, v0, v1, "%s: Failed to create proxy (%@)", v2, v3, v4, v5, 2u);
}

- (void)getSandboxExtensionTokenForAssetID:.cold.1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_1(&dword_21E079000, v0, v1, "%s: Failed to create proxy (%@)", v2, v3, v4, v5, 2u);
}

@end