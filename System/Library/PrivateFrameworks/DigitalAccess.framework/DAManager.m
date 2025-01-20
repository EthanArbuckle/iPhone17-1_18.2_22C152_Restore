@interface DAManager
+ (BOOL)isCarKeySupportedForManufacturer:(id)a3 brand:(id)a4 ppid:(id)a5 error:(id *)a6;
+ (BOOL)isSupported;
+ (BOOL)updateHydraKey:(id)a3 session:(id)a4 seid:(id)a5 encryptedSEData:(id)a6 outError:(id *)a7;
+ (id)createAliroHomeKey:(id)a3 seid:(id)a4 readerIdentifier:(id)a5 readerPublicKey:(id)a6 homeUUID:(id)a7 outError:(id *)a8;
+ (id)createAliroHydraKey:(id)a3 seid:(id)a4 serverParameters:(id)a5 outError:(id *)a6;
+ (id)createHomeKey:(id)a3 seid:(id)a4 readerIdentifier:(id)a5 readerPublicKey:(id)a6 outError:(id *)a7;
+ (id)createHydraKey:(id)a3 seid:(id)a4 serverParameters:(id)a5 outError:(id *)a6;
+ (id)getAliroSupportedProtocolVersions:(id *)a3;
+ (id)getHydraEncryptionCert:(id)a3 session:(id)a4 seid:(id)a5 outError:(id *)a6;
+ (id)sharedManager;
+ (id)updateAliroCredentialDocumentStatus:(id)a3 seid:(id)a4 keyIdentifier:(id)a5 accessDocumentPresent:(unsigned __int8)a6 accessDocumentSignedTimestamp:(id)a7 revocationDocumentPresent:(unsigned __int8)a8 revocationDocumentSignedTimestamp:(id)a9;
+ (void)handleSharingMessage:(id)a3 forInvitationIdentifier:(id)a4 fromMailboxIdentifier:(id)a5 completionHandler:(id)a6;
+ (void)listKeysWithSession:(id)a3 seid:(id)a4 callback:(id)a5;
+ (void)rejectSharingInvitation:(id)a3 completionHandler:(id)a4;
- (DAManager)init;
- (id)connection;
- (id)createManagementSessionWithDelegate:(id)a3;
- (id)createPairingSessionWithDelegate:(id)a3;
- (id)createSharingSessionWithDelegate:(id)a3;
- (void)cleanup;
- (void)establishXpcConnection;
- (void)handleSharingMessage:(void *)a3 forInvitationIdentifier:(void *)a4 fromMailboxIdentifier:;
- (void)invalidateSessions;
- (void)registerCrossPlatformTestMessageOverIDSHandler:(id)a3;
- (void)registerCrossPlatformTestMessageSendHandler:(id)a3;
- (void)registerFriendSideInvitationUnusableHandler:(id)a3;
- (void)registerFriendSidePasscodeRetryRequestTestHandler:(id)a3;
- (void)registerFriendSideSharingTestCompletion:(id)a3;
- (void)registerFriendSideSharingTestInvitationUUIDHandler:(id)a3;
- (void)registerOwnerSideInvitationRequestHandler:(id)a3;
- (void)registerOwnerSideSharingTestInvitations:(id)a3 callback:(id)a4;
- (void)registerSession:(id)a3;
- (void)sendCrossPlatformTestData:(id)a3 toIdsIdentifier:(id)a4;
- (void)setServiceName:(uint64_t)a1;
- (void)unregisterSession:(id)a3;
- (void)unregisterSharingTestHandlers;
@end

@implementation DAManager

+ (BOOL)isSupported
{
  int v2 = MGGetSInt32Answer();
  return v2 == 6 || v2 == 1;
}

- (void)establishXpcConnection
{
  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    if (v1[2])
    {
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager establishXpcConnection]", 258, @"DAKeyManager: XPC connection already established", v2, v3, v4, v5, v16);
    }
    else
    {
      id v6 = objc_alloc(MEMORY[0x263F08D68]);
      id v7 = v1[3];
      uint64_t v8 = [v6 initWithMachServiceName:v7 options:4096];
      id v9 = v1[2];
      v1[2] = (id)v8;

      v10 = +[KmlManagerInterface interface];
      [v1[2] setRemoteObjectInterface:v10];

      v11 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C5C2CC0];
      [v1[2] setExportedInterface:v11];

      [v1[2] setExportedObject:v1];
      objc_initWeak(&location, v1);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __35__DAManager_establishXpcConnection__block_invoke;
      v19[3] = &unk_26422D2B8;
      objc_copyWeak(&v20, &location);
      [v1[2] setInterruptionHandler:v19];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __35__DAManager_establishXpcConnection__block_invoke_2;
      v17[3] = &unk_26422D2B8;
      objc_copyWeak(&v18, &location);
      [v1[2] setInvalidationHandler:v17];
      [v1[2] resume];
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager establishXpcConnection]", 291, @"XPC Connection created", v12, v13, v14, v15, v16);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
    objc_sync_exit(v1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_clientConnection, 0);

  objc_storeStrong((id *)&self->_activeSessions, 0);
}

- (DAManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)DAManager;
  uint64_t v2 = [(DAManager *)&v7 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    activeSessions = v2->_activeSessions;
    v2->_activeSessions = v3;

    serviceName = v2->_serviceName;
    v2->_serviceName = (NSString *)@"com.apple.seserviced.kmlXpcService";
  }
  return v2;
}

+ (id)createHydraKey:(id)a3 seid:(id)a4 serverParameters:(id)a5 outError:(id *)a6
{
  id v6 = SESEndPointCreateForHydraWithSession();
  if (v6) {
    objc_super v7 = [[DAKeyInformation alloc] initWithEndpoint:v6];
  }
  else {
    objc_super v7 = 0;
  }

  return v7;
}

+ (id)getHydraEncryptionCert:(id)a3 session:(id)a4 seid:(id)a5 outError:(id *)a6
{
  return (id)MEMORY[0x270F5C118](a3, a4, a5, a6);
}

+ (BOOL)updateHydraKey:(id)a3 session:(id)a4 seid:(id)a5 encryptedSEData:(id)a6 outError:(id *)a7
{
  return MEMORY[0x270F5C160](a3, a4, a5, a6, a7);
}

- (void)setServiceName:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_2);
  }
  uint64_t v2 = (void *)sharedManager__keyManager;

  return v2;
}

uint64_t __26__DAManager_sharedManager__block_invoke()
{
  sharedManager__keyManager = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

+ (BOOL)isCarKeySupportedForManufacturer:(id)a3 brand:(id)a4 ppid:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (v11)
  {
    uint64_t v13 = kmlUtilDataForHexString(v11);
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = SESEndPointIsCarKeySupported();
  id v15 = 0;
  if (v12) {

  }
  if (a6 && v15)
  {
    uint64_t v16 = sesErrorToKmlError(v15, 0xD6u);

    kmlErrorToDAError(v16);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = v16;
  }
  char v17 = [v14 BOOLValue];

  return v17;
}

+ (void)listKeysWithSession:(id)a3 seid:(id)a4 callback:(id)a5
{
  v52[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"+[DAManager listKeysWithSession:seid:callback:]", 108, &stru_26C5B7750, v10, v11, v12, v13, v42);
  if (v7 && v8)
  {
    uint64_t v49 = 0;
    SESEndPointListWithSession();
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    id v19 = 0;
    id v20 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v18, "count"));
    if (v19)
    {
      v21 = (void *)MEMORY[0x263F087E8];
      v22 = [v19 userInfo];
      v23 = [v21 errorWithDomain:@"DigitalAccessError" code:209 userInfo:v22];

      v9[2](v9, 0, v23);
    }
    else
    {
      v43 = v9;
      id v44 = v8;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v18 = v18;
      uint64_t v26 = [v18 countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v46 != v28) {
              objc_enumerationMutation(v18);
            }
            v30 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            v31 = [v30 publicKeyIdentifier];
            KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"+[DAManager listKeysWithSession:seid:callback:]", 121, @"Key id = %@", v32, v33, v34, v35, (uint64_t)v31);

            v36 = [[DAKeyInformation alloc] initWithEndpoint:v30];
            [v20 addObject:v36];
          }
          uint64_t v27 = [v18 countByEnumeratingWithState:&v45 objects:v50 count:16];
        }
        while (v27);
      }

      uint64_t v37 = [v20 count];
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"+[DAManager listKeysWithSession:seid:callback:]", 125, @"key count = %lu", v38, v39, v40, v41, v37);
      id v9 = v43;
      ((void (**)(id, void *, void *))v43)[2](v43, v20, 0);
      id v8 = v44;
    }
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"+[DAManager listKeysWithSession:seid:callback:]", 110, @"Null arguments provided. Session : %@, seid : %@", v14, v15, v16, v17, (uint64_t)v7);
    v24 = (void *)MEMORY[0x263F087E8];
    uint64_t v51 = *MEMORY[0x263F08320];
    id v18 = [NSString stringWithUTF8String:DAErrorString(217)];
    v52[0] = v18;
    id v20 = [NSDictionary dictionaryWithObjects:v52 forKeys:&v51 count:1];
    v25 = [v24 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v20];
    v9[2](v9, 0, v25);
  }
}

+ (void)handleSharingMessage:(id)a3 forInvitationIdentifier:(id)a4 fromMailboxIdentifier:(id)a5 completionHandler:(id)a6
{
  id v9 = (void (**)(id, void *))a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"+[DAManager handleSharingMessage:forInvitationIdentifier:fromMailboxIdentifier:completionHandler:]", 138, &stru_26C5B7750, v13, v14, v15, v16, v18);
  id v19 = +[DAManager sharedManager];
  uint64_t v17 = -[DAManager handleSharingMessage:forInvitationIdentifier:fromMailboxIdentifier:](v19, v12, v11, v10);

  v9[2](v9, v17);
}

- (void)handleSharingMessage:(void *)a3 forInvitationIdentifier:(void *)a4 fromMailboxIdentifier:
{
  id v7 = a2;
  id v8 = a3;
  id v13 = a4;
  if (a1)
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager handleSharingMessage:forInvitationIdentifier:fromMailboxIdentifier:]", 389, &stru_26C5B7750, v9, v10, v11, v12, v17[0]);
    -[DAManager establishXpcConnection](a1);
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__2;
    v23 = __Block_byref_object_dispose__2;
    id v24 = 0;
    uint64_t v14 = (void *)a1[2];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __80__DAManager_handleSharingMessage_forInvitationIdentifier_fromMailboxIdentifier___block_invoke;
    v18[3] = &unk_26422CBD0;
    v18[4] = &v19;
    uint64_t v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v18];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = (uint64_t)__80__DAManager_handleSharingMessage_forInvitationIdentifier_fromMailboxIdentifier___block_invoke_2;
    v17[3] = (uint64_t)&unk_26422CBD0;
    void v17[4] = (uint64_t)&v19;
    [v15 queueCrossPlatformSharingMessage:v7 forInvitationIdentifier:v8 fromMailboxIdentifier:v13 callback:v17];

    a1 = (id)v20[5];
    _Block_object_dispose(&v19, 8);
  }

  return a1;
}

+ (void)rejectSharingInvitation:(id)a3 completionHandler:(id)a4
{
  v41[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void (**)(id, void *, void *))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"+[DAManager rejectSharingInvitation:completionHandler:]", 147, &stru_26C5B7750, v7, v8, v9, v10, v38);
  uint64_t v11 = [v5 genericData];
  if (!v11) {
    goto LABEL_4;
  }
  uint64_t v16 = (void *)v11;
  uint64_t v17 = [v5 genericData];
  uint64_t v18 = [v17 sharingIdentifier];

  if (v18)
  {
    uint64_t v19 = [v5 genericData];
    id v20 = [v19 sharingIdentifier];
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"+[DAManager rejectSharingInvitation:completionHandler:]", 152, @"Cancel invite with id : %@", v21, v22, v23, v24, (uint64_t)v20);

    id v25 = -[KmlCancelMessage initWithCCCErrorCode:]([KmlCancelMessage alloc], 34);
    uint64_t v26 = -[KmlCancelMessage asData]((uint64_t)v25);

    uint64_t v27 = [DACarKeyGenericCrossPlatformSharingData alloc];
    uint64_t v28 = [v5 genericData];
    v29 = [v28 sharingIdentifier];
    v30 = [(DACarKeyGenericCrossPlatformSharingData *)v27 initWithSharingIdentifier:v29 friendKeyIdentifier:0 sharingMessageType:5 message:v26];

    v31 = [DACarKeySharingMessage alloc];
    uint64_t v32 = [v5 additionalData];
    uint64_t v33 = [(DACarKeySharingMessage *)v31 initWithGenericCrossPlatformSharingData:v30 additionalData:v32 privateData:0];

    uint64_t v34 = 0;
  }
  else
  {
LABEL_4:
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"+[DAManager rejectSharingInvitation:completionHandler:]", 171, @"Can't cancel invite missing invitationIdentifier", v12, v13, v14, v15, v39);
    uint64_t v35 = (void *)MEMORY[0x263F087E8];
    uint64_t v40 = *MEMORY[0x263F08320];
    v36 = [NSString stringWithUTF8String:DAErrorString(109)];
    v41[0] = v36;
    uint64_t v37 = [NSDictionary dictionaryWithObjects:v41 forKeys:&v40 count:1];
    uint64_t v34 = [v35 errorWithDomain:@"DigitalAccessError" code:109 userInfo:v37];

    uint64_t v33 = 0;
  }
  v6[2](v6, v33, v34);
}

+ (id)createHomeKey:(id)a3 seid:(id)a4 readerIdentifier:(id)a5 readerPublicKey:(id)a6 outError:(id *)a7
{
  uint64_t v7 = MEMORY[0x2166B17F0](a3, a4, a5, a6, a7);
  if (v7) {
    uint64_t v8 = [[DAKeyInformation alloc] initWithEndpoint:v7];
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)registerSession:(id)a3
{
  id v9 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAManager registerSession:]", 190, @"%@", v4, v5, v6, v7, (uint64_t)v9);
  uint64_t v8 = self->_activeSessions;
  objc_sync_enter(v8);
  [(NSMutableSet *)self->_activeSessions addObject:v9];
  objc_sync_exit(v8);
}

- (void)unregisterSession:(id)a3
{
  id v9 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAManager unregisterSession:]", 198, @"%@", v4, v5, v6, v7, (uint64_t)v9);
  uint64_t v8 = self->_activeSessions;
  objc_sync_enter(v8);
  [(NSMutableSet *)self->_activeSessions removeObject:v9];
  objc_sync_exit(v8);
}

- (void)invalidateSessions
{
  if (a1)
  {
    id v2 = *(id *)(a1 + 8);
    objc_sync_enter(v2);
    id v3 = (id)[*(id *)(a1 + 8) copy];
    [*(id *)(a1 + 8) removeAllObjects];
    objc_sync_exit(v2);

    [v3 enumerateObjectsUsingBlock:&__block_literal_global_49];
  }
}

void __31__DAManager_invalidateSessions__block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v2 = a2;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAManager invalidateSessions]_block_invoke", 215, @"%@", v3, v4, v5, v6, (uint64_t)v2);
  uint64_t v7 = (void *)MEMORY[0x263F087E8];
  uint64_t v11 = *MEMORY[0x263F08320];
  uint64_t v8 = [NSString stringWithUTF8String:DAErrorString(216)];
  v12[0] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v10 = [v7 errorWithDomain:@"DigitalAccessError" code:216 userInfo:v9];

  [v2 didEnd:v10];
}

- (void)cleanup
{
  if (a1)
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager cleanup]", 228, &stru_26C5B7750, a5, a6, a7, a8, v10);
    -[DAManager invalidateSessions]((uint64_t)a1);
    obj = a1;
    objc_sync_enter(obj);
    id v9 = (void *)obj[2];
    obj[2] = 0;

    objc_sync_exit(obj);
  }
}

- (id)connection
{
  return self->_clientConnection;
}

void __35__DAManager_establishXpcConnection__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager establishXpcConnection]_block_invoke", 275, &stru_26C5B7750, v1, v2, v3, v4, v9);
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager releaseConnection]", 245, &stru_26C5B7750, v5, v6, v7, v8, v10);
    [WeakRetained[2] invalidate];
  }
}

void __35__DAManager_establishXpcConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager establishXpcConnection]_block_invoke_2", 284, &stru_26C5B7750, v1, v2, v3, v4, v12);
    [(DAManager *)WeakRetained cleanup];
  }
}

- (id)createPairingSessionWithDelegate:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager createPairingSessionWithDelegate:]", 297, &stru_26C5B7750, v5, v6, v7, v8, v14[0]);
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__2;
  id v20 = __Block_byref_object_dispose__2;
  uint64_t v21 = [[DAKeyPairingSession alloc] initWithDelegate:v4];
  -[DAManager establishXpcConnection](self);
  [(DAManager *)self registerSession:v17[5]];
  clientConnection = self->_clientConnection;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __46__DAManager_createPairingSessionWithDelegate___block_invoke;
  v15[3] = &unk_26422D328;
  v15[4] = self;
  v15[5] = &v16;
  uint64_t v10 = [(NSXPCConnection *)clientConnection synchronousRemoteObjectProxyWithErrorHandler:v15];
  uint64_t v11 = v17[5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = (uint64_t)__46__DAManager_createPairingSessionWithDelegate___block_invoke_2;
  v14[3] = (uint64_t)&unk_26422D350;
  v14[4] = (uint64_t)self;
  v14[5] = (uint64_t)&v16;
  [v10 queueOwnerPairingSession:v11 callback:v14];

  id v12 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v12;
}

void __46__DAManager_createPairingSessionWithDelegate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAManager createPairingSessionWithDelegate:]_block_invoke", 306, @"proxyError: %@", a5, a6, a7, a8, a2);
    [*(id *)(a1 + 32) unregisterSession:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
}

void __46__DAManager_createPairingSessionWithDelegate___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a4)
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAManager createPairingSessionWithDelegate:]_block_invoke_2", 314, @"proxyError: %@", a5, a6, a7, a8, a4);
    [*(id *)(a1 + 32) unregisterSession:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
  else
  {
    uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v11 setProxy:a2];
  }
}

- (id)createSharingSessionWithDelegate:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager createSharingSessionWithDelegate:]", 327, &stru_26C5B7750, v5, v6, v7, v8, v14[0]);
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__2;
  id v20 = __Block_byref_object_dispose__2;
  uint64_t v21 = [[DAKeySharingSession alloc] initWithDelegate:v4];
  -[DAManager establishXpcConnection](self);
  [(DAManager *)self registerSession:v17[5]];
  clientConnection = self->_clientConnection;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __46__DAManager_createSharingSessionWithDelegate___block_invoke;
  v15[3] = &unk_26422D328;
  v15[4] = self;
  v15[5] = &v16;
  uint64_t v10 = [(NSXPCConnection *)clientConnection synchronousRemoteObjectProxyWithErrorHandler:v15];
  uint64_t v11 = v17[5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = (uint64_t)__46__DAManager_createSharingSessionWithDelegate___block_invoke_2;
  v14[3] = (uint64_t)&unk_26422D378;
  v14[4] = (uint64_t)self;
  v14[5] = (uint64_t)&v16;
  [v10 queueSharingSession:v11 callback:v14];

  id v12 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v12;
}

void __46__DAManager_createSharingSessionWithDelegate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAManager createSharingSessionWithDelegate:]_block_invoke", 336, @"proxyError: %@", a5, a6, a7, a8, a2);
    [*(id *)(a1 + 32) unregisterSession:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
}

void __46__DAManager_createSharingSessionWithDelegate___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a4)
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAManager createSharingSessionWithDelegate:]_block_invoke_2", 344, @"proxyError: %@", a5, a6, a7, a8, a4);
    [*(id *)(a1 + 32) unregisterSession:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
  else
  {
    uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v11 setProxy:a2];
  }
}

- (id)createManagementSessionWithDelegate:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager createManagementSessionWithDelegate:]", 357, &stru_26C5B7750, v5, v6, v7, v8, v14[0]);
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__2;
  id v20 = __Block_byref_object_dispose__2;
  uint64_t v21 = [[DAKeyManagementSession alloc] initWithDelegate:v4];
  -[DAManager establishXpcConnection](self);
  [(DAManager *)self registerSession:v17[5]];
  clientConnection = self->_clientConnection;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __49__DAManager_createManagementSessionWithDelegate___block_invoke;
  v15[3] = &unk_26422D328;
  v15[4] = self;
  v15[5] = &v16;
  uint64_t v10 = [(NSXPCConnection *)clientConnection synchronousRemoteObjectProxyWithErrorHandler:v15];
  uint64_t v11 = v17[5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = (uint64_t)__49__DAManager_createManagementSessionWithDelegate___block_invoke_2;
  v14[3] = (uint64_t)&unk_26422D3A0;
  v14[4] = (uint64_t)self;
  v14[5] = (uint64_t)&v16;
  [v10 queueManagementSession:v11 callback:v14];

  id v12 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v12;
}

void __49__DAManager_createManagementSessionWithDelegate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAManager createManagementSessionWithDelegate:]_block_invoke", 366, @"proxyError: %@", a5, a6, a7, a8, a2);
    [*(id *)(a1 + 32) unregisterSession:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
}

void __49__DAManager_createManagementSessionWithDelegate___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a4)
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAManager createManagementSessionWithDelegate:]_block_invoke_2", 374, @"proxyError: %@", a5, a6, a7, a8, a4);
    [*(id *)(a1 + 32) unregisterSession:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
  else
  {
    uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v11 setProxy:a2];
  }
}

void __80__DAManager_handleSharingMessage_forInvitationIdentifier_fromMailboxIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v9 = v4;
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAManager handleSharingMessage:forInvitationIdentifier:fromMailboxIdentifier:]_block_invoke", 395, @"proxyError: %@", v5, v6, v7, v8, (uint64_t)v4);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v9;
  }
}

void __80__DAManager_handleSharingMessage_forInvitationIdentifier_fromMailboxIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)registerOwnerSideSharingTestInvitations:(id)a3 callback:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerOwnerSideSharingTestInvitations:callback:]", 409, &stru_26C5B7750, v8, v9, v10, v11, v17);
  -[DAManager establishXpcConnection](self);
  id v12 = [(NSXPCConnection *)self->_clientConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_111];
  [v12 registerOwnerSideSharingTestInvitations:v7 callback:v6];

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerOwnerSideSharingTestInvitations:callback:]", 415, &stru_26C5B7750, v13, v14, v15, v16, v19);
}

void __62__DAManager_registerOwnerSideSharingTestInvitations_callback___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)registerOwnerSideInvitationRequestHandler:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerOwnerSideInvitationRequestHandler:]", 420, &stru_26C5B7750, v5, v6, v7, v8, v14);
  -[DAManager establishXpcConnection](self);
  uint64_t v9 = [(NSXPCConnection *)self->_clientConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_113];
  [v9 registerOwnerSideInvitationRequestHandler:v4];

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerOwnerSideInvitationRequestHandler:]", 426, &stru_26C5B7750, v10, v11, v12, v13, v16);
}

void __55__DAManager_registerOwnerSideInvitationRequestHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)registerFriendSideSharingTestCompletion:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerFriendSideSharingTestCompletion:]", 431, &stru_26C5B7750, v5, v6, v7, v8, v14);
  -[DAManager establishXpcConnection](self);
  uint64_t v9 = [(NSXPCConnection *)self->_clientConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_115];
  [v9 registerFriendSideSharingTestCompletion:v4];

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerFriendSideSharingTestCompletion:]", 437, &stru_26C5B7750, v10, v11, v12, v13, v16);
}

void __53__DAManager_registerFriendSideSharingTestCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)registerFriendSideSharingTestInvitationUUIDHandler:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerFriendSideSharingTestInvitationUUIDHandler:]", 442, &stru_26C5B7750, v5, v6, v7, v8, v14);
  -[DAManager establishXpcConnection](self);
  uint64_t v9 = [(NSXPCConnection *)self->_clientConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_117];
  [v9 registerFriendSideSharingTestInvitationUUIDHandler:v4];

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerFriendSideSharingTestInvitationUUIDHandler:]", 448, &stru_26C5B7750, v10, v11, v12, v13, v16);
}

void __64__DAManager_registerFriendSideSharingTestInvitationUUIDHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)registerFriendSideInvitationUnusableHandler:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerFriendSideInvitationUnusableHandler:]", 453, &stru_26C5B7750, v5, v6, v7, v8, v14);
  -[DAManager establishXpcConnection](self);
  uint64_t v9 = [(NSXPCConnection *)self->_clientConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_119];
  [v9 registerFriendSideInvitationUnusableHandler:v4];

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerFriendSideInvitationUnusableHandler:]", 459, &stru_26C5B7750, v10, v11, v12, v13, v16);
}

void __57__DAManager_registerFriendSideInvitationUnusableHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)registerCrossPlatformTestMessageOverIDSHandler:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerCrossPlatformTestMessageOverIDSHandler:]", 464, &stru_26C5B7750, v5, v6, v7, v8, v14);
  -[DAManager establishXpcConnection](self);
  uint64_t v9 = [(NSXPCConnection *)self->_clientConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_121];
  [v9 registerCrossPlatformTestMessageOverIDSHandler:v4];

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerCrossPlatformTestMessageOverIDSHandler:]", 470, &stru_26C5B7750, v10, v11, v12, v13, v16);
}

void __60__DAManager_registerCrossPlatformTestMessageOverIDSHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)registerCrossPlatformTestMessageSendHandler:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerCrossPlatformTestMessageSendHandler:]", 475, &stru_26C5B7750, v5, v6, v7, v8, v14);
  -[DAManager establishXpcConnection](self);
  uint64_t v9 = [(NSXPCConnection *)self->_clientConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_123];
  [v9 registerCrossPlatformTestMessageSendHandler:v4];

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerCrossPlatformTestMessageSendHandler:]", 481, &stru_26C5B7750, v10, v11, v12, v13, v16);
}

void __57__DAManager_registerCrossPlatformTestMessageSendHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendCrossPlatformTestData:(id)a3 toIdsIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager sendCrossPlatformTestData:toIdsIdentifier:]", 486, &stru_26C5B7750, v8, v9, v10, v11, v17);
  -[DAManager establishXpcConnection](self);
  uint64_t v12 = [(NSXPCConnection *)self->_clientConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_125];
  [v12 sendCrossPlatformTestData:v7 toIdsIdentifier:v6];

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager sendCrossPlatformTestData:toIdsIdentifier:]", 492, &stru_26C5B7750, v13, v14, v15, v16, v19);
}

void __55__DAManager_sendCrossPlatformTestData_toIdsIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)registerFriendSidePasscodeRetryRequestTestHandler:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerFriendSidePasscodeRetryRequestTestHandler:]", 497, &stru_26C5B7750, v5, v6, v7, v8, v14);
  -[DAManager establishXpcConnection](self);
  uint64_t v9 = [(NSXPCConnection *)self->_clientConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_127];
  [v9 registerFriendSidePasscodeRetryRequestHandler:v4];

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerFriendSidePasscodeRetryRequestTestHandler:]", 503, &stru_26C5B7750, v10, v11, v12, v13, v16);
}

void __63__DAManager_registerFriendSidePasscodeRetryRequestTestHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)unregisterSharingTestHandlers
{
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager unregisterSharingTestHandlers]", 508, &stru_26C5B7750, v2, v3, v4, v5, v12);
  -[DAManager establishXpcConnection](self);
  uint64_t v7 = [(NSXPCConnection *)self->_clientConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_129];
  [v7 unregisterSharingTestHandlers];

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager unregisterSharingTestHandlers]", 514, &stru_26C5B7750, v8, v9, v10, v11, v14);
}

void __42__DAManager_unregisterSharingTestHandlers__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (id)createAliroHomeKey:(id)a3 seid:(id)a4 readerIdentifier:(id)a5 readerPublicKey:(id)a6 homeUUID:(id)a7 outError:(id *)a8
{
  uint64_t v12 = NSNumber;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = [v12 numberWithInt:0];
  uint64_t v19 = SESEndPointCreateForLyonWithSession();

  if (v19) {
    id v20 = [[DAKeyInformation alloc] initWithEndpoint:v19];
  }
  else {
    id v20 = 0;
  }

  return v20;
}

+ (id)createAliroHydraKey:(id)a3 seid:(id)a4 serverParameters:(id)a5 outError:(id *)a6
{
  uint64_t v6 = SESEndPointCreateForLyonHydraWithSession();
  if (v6) {
    uint64_t v7 = [[DAKeyInformation alloc] initWithEndpoint:v6];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)updateAliroCredentialDocumentStatus:(id)a3 seid:(id)a4 keyIdentifier:(id)a5 accessDocumentPresent:(unsigned __int8)a6 accessDocumentSignedTimestamp:(id)a7 revocationDocumentPresent:(unsigned __int8)a8 revocationDocumentSignedTimestamp:(id)a9
{
  return (id)MEMORY[0x270F5C188](a3, a4, a5, a6 != 0, a7, a8 != 0, a9);
}

+ (id)getAliroSupportedProtocolVersions:(id *)a3
{
  return (id)MEMORY[0x270F5C170](a3, a2);
}

@end