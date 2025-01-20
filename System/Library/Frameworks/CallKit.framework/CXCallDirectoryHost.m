@interface CXCallDirectoryHost
- (BOOL)_connectionContainsCallDirectoryHostEntitlementCapability:(id)a3;
- (CXCallDirectoryHost)init;
- (CXCallDirectoryHostDelegate)delegate;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (void)_nsExtensionWithIdentifier:(id)a3 completion:(id)a4;
- (void)cleanUpLiveLookupDataWithReply:(id)a3;
- (void)compactStoreWithReply:(id)a3;
- (void)fetchLiveBlockingInfoForHandle:(id)a3 reply:(id)a4;
- (void)firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber:(id)a3 reply:(id)a4;
- (void)firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:(id)a3 cacheOnly:(BOOL)a4 reply:(id)a5;
- (void)getEnabledForLiveLookupExtensionWithIdentifier:(id)a3 reply:(id)a4;
- (void)getEnabledStatusForExtensionWithIdentifier:(id)a3 reply:(id)a4;
- (void)getExtensionsWithReply:(id)a3;
- (void)getLastUpdatedCallDirectoryInfoWithReply:(id)a3;
- (void)launchCallDirectorySettingsWithReply:(id)a3;
- (void)performDelegateCallback:(id)a3;
- (void)prepareStoreIfNecessary;
- (void)refreshExtensionContextForLiveLookupExtensionWithIdentifier:(id)a3 reply:(id)a4;
- (void)refreshPIRParametersForLiveLookupExtensionWithIdentifier:(id)a3 reply:(id)a4;
- (void)reloadExtensionWithIdentifier:(id)a3 reply:(id)a4;
- (void)resetLiveLookupExtensionWithIdentifier:(id)a3 reply:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setDelegateQueue:(id)a3;
- (void)setEnabled:(BOOL)a3 forExtensionWithIdentifier:(id)a4 reply:(id)a5;
- (void)setEnabled:(BOOL)a3 forLiveLookupExtensionWithIdentifier:(id)a4 reply:(id)a5;
- (void)setPrioritizedExtensionIdentifiers:(id)a3 reply:(id)a4;
- (void)setQueue:(id)a3;
- (void)synchronizeExtensionsWithReply:(id)a3;
@end

@implementation CXCallDirectoryHost

void __47__CXCallDirectoryHost_performDelegateCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    v3 = (void *)v2;
    v4 = [*(id *)(a1 + 32) delegateQueue];

    if (v4)
    {
      v5 = [*(id *)(a1 + 32) delegateQueue];
      dispatch_async(v5, *(dispatch_block_t *)(a1 + 40));
    }
  }
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

void __102__CXCallDirectoryHost_firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers_cacheOnly_reply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callDirectoryHost:*(void *)(a1 + 32) requestedFirstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:*(void *)(a1 + 40) cacheOnly:*(unsigned __int8 *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
}

- (CXCallDirectoryHostDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CXCallDirectoryHostDelegate *)WeakRetained;
}

- (void)firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:(id)a3 cacheOnly:(BOOL)a4 reply:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = CXDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v8;
    _os_log_impl(&dword_1A6E3A000, v10, OS_LOG_TYPE_DEFAULT, "phoneNumbers %@", buf, 0xCu);
  }

  if ([(CXCallDirectoryHost *)self _connectionContainsCallDirectoryHostEntitlementCapability:@"query-identification-entries"])
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __102__CXCallDirectoryHost_firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers_cacheOnly_reply___block_invoke;
    v23[3] = &unk_1E5CADDF0;
    v23[4] = self;
    id v24 = v8;
    BOOL v26 = a4;
    id v25 = v9;
    [(CXCallDirectoryHost *)self performDelegateCallback:v23];
  }
  else
  {
    v11 = CXDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CXCallDirectoryHost firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:cacheOnly:reply:](v11, v12, v13, v14, v15, v16, v17, v18);
    }

    v19 = [NSString stringWithFormat:@"Requestor does not contain entitlement capability '%@' in call directory host entitlement capabilities list", @"query-identification-entries"];
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    v28 = v19;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    v22 = objc_msgSend(v20, "cx_callDirectoryManagerErrorWithCode:userInfo:", 100, v21);
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v22);
  }
}

- (void)performDelegateCallback:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallDirectoryHost *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__CXCallDirectoryHost_performDelegateCallback___block_invoke;
  v7[3] = &unk_1E5CADD78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)_connectionContainsCallDirectoryHostEntitlementCapability:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F29268] currentConnection];
  v5 = [v4 valueForEntitlement:@"com.apple.CallKit.call-directory"];
  if (!v5)
  {
    v7 = CXDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      v10 = v4;
      __int16 v11 = 2112;
      uint64_t v12 = @"com.apple.CallKit.call-directory";
      _os_log_impl(&dword_1A6E3A000, v7, OS_LOG_TYPE_DEFAULT, "[WARN] XPC connection %@ does not contain entitlement '%@'", (uint8_t *)&v9, 0x16u);
    }
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = CXDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(CXCallDirectoryHost *)(uint64_t)v4 _connectionContainsCallDirectoryHostEntitlementCapability:v7];
    }
LABEL_8:

    char v6 = 0;
    goto LABEL_9;
  }
  char v6 = [v5 containsObject:v3];
LABEL_9:

  return v6;
}

- (CXCallDirectoryHost)init
{
  v6.receiver = self;
  v6.super_class = (Class)CXCallDirectoryHost;
  id v2 = [(CXCallDirectoryHost *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.callkit.calldirectoryhost", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CXCallDirectoryHost *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CXCallDirectoryHost_setDelegate_queue___block_invoke;
  block[3] = &unk_1E5CADD08;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __41__CXCallDirectoryHost_setDelegate_queue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 48)) {
    uint64_t v2 = *(void *)(a1 + 48);
  }
  else {
    uint64_t v2 = MEMORY[0x1E4F14428];
  }
  dispatch_queue_t v3 = *(void **)(a1 + 32);

  return [v3 setDelegateQueue:v2];
}

- (void)reloadExtensionWithIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "identifier %@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__CXCallDirectoryHost_reloadExtensionWithIdentifier_reply___block_invoke;
  v11[3] = &unk_1E5CADDC8;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(CXCallDirectoryHost *)self _nsExtensionWithIdentifier:v9 completion:v11];
}

void __59__CXCallDirectoryHost_reloadExtensionWithIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__CXCallDirectoryHost_reloadExtensionWithIdentifier_reply___block_invoke_2;
    v9[3] = &unk_1E5CADDA0;
    v9[4] = v5;
    id v10 = v3;
    id v11 = *(id *)(a1 + 48);
    [v5 performDelegateCallback:v9];
  }
  else
  {
    id v6 = CXDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __59__CXCallDirectoryHost_reloadExtensionWithIdentifier_reply___block_invoke_cold_1();
    }

    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "cx_callDirectoryManagerErrorWithCode:", 1);
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

void __59__CXCallDirectoryHost_reloadExtensionWithIdentifier_reply___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callDirectoryHost:*(void *)(a1 + 32) requestedReloadForExtension:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)resetLiveLookupExtensionWithIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "resetLiveLookupExtensionWithIdentifier identifier %@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__CXCallDirectoryHost_resetLiveLookupExtensionWithIdentifier_reply___block_invoke;
  v11[3] = &unk_1E5CADDC8;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(CXCallDirectoryHost *)self _nsExtensionWithIdentifier:v9 completion:v11];
}

void __68__CXCallDirectoryHost_resetLiveLookupExtensionWithIdentifier_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__CXCallDirectoryHost_resetLiveLookupExtensionWithIdentifier_reply___block_invoke_2;
    v11[3] = &unk_1E5CADDA0;
    v11[4] = v7;
    id v12 = v5;
    id v13 = *(id *)(a1 + 48);
    [v7 performDelegateCallback:v11];
  }
  else
  {
    id v8 = CXDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __68__CXCallDirectoryHost_resetLiveLookupExtensionWithIdentifier_reply___block_invoke_cold_1();
    }

    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "cx_callDirectoryManagerErrorWithCode:", 1);
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
}

void __68__CXCallDirectoryHost_resetLiveLookupExtensionWithIdentifier_reply___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callDirectoryHost:*(void *)(a1 + 32) requestedResetForLiveLookupExtension:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)refreshPIRParametersForLiveLookupExtensionWithIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "refreshPIRParametersForLiveLookupExtensionWithIdentifier identifier %@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__CXCallDirectoryHost_refreshPIRParametersForLiveLookupExtensionWithIdentifier_reply___block_invoke;
  v11[3] = &unk_1E5CADDC8;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(CXCallDirectoryHost *)self _nsExtensionWithIdentifier:v9 completion:v11];
}

void __86__CXCallDirectoryHost_refreshPIRParametersForLiveLookupExtensionWithIdentifier_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __86__CXCallDirectoryHost_refreshPIRParametersForLiveLookupExtensionWithIdentifier_reply___block_invoke_2;
    v11[3] = &unk_1E5CADDA0;
    v11[4] = v7;
    id v12 = v5;
    id v13 = *(id *)(a1 + 48);
    [v7 performDelegateCallback:v11];
  }
  else
  {
    id v8 = CXDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __68__CXCallDirectoryHost_resetLiveLookupExtensionWithIdentifier_reply___block_invoke_cold_1();
    }

    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "cx_callDirectoryManagerErrorWithCode:", 1);
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
}

void __86__CXCallDirectoryHost_refreshPIRParametersForLiveLookupExtensionWithIdentifier_reply___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callDirectoryHost:*(void *)(a1 + 32) requestedRefreshPIRParametersForLiveLookupExtension:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)refreshExtensionContextForLiveLookupExtensionWithIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "refreshExtensionContextForLiveLookupExtensionWithIdentifier identifier %@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __89__CXCallDirectoryHost_refreshExtensionContextForLiveLookupExtensionWithIdentifier_reply___block_invoke;
  v11[3] = &unk_1E5CADDC8;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(CXCallDirectoryHost *)self _nsExtensionWithIdentifier:v9 completion:v11];
}

void __89__CXCallDirectoryHost_refreshExtensionContextForLiveLookupExtensionWithIdentifier_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __89__CXCallDirectoryHost_refreshExtensionContextForLiveLookupExtensionWithIdentifier_reply___block_invoke_2;
    v11[3] = &unk_1E5CADDA0;
    v11[4] = v7;
    id v12 = v5;
    id v13 = *(id *)(a1 + 48);
    [v7 performDelegateCallback:v11];
  }
  else
  {
    id v8 = CXDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __68__CXCallDirectoryHost_resetLiveLookupExtensionWithIdentifier_reply___block_invoke_cold_1();
    }

    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "cx_callDirectoryManagerErrorWithCode:", 1);
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
}

void __89__CXCallDirectoryHost_refreshExtensionContextForLiveLookupExtensionWithIdentifier_reply___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callDirectoryHost:*(void *)(a1 + 32) requestedRefreshExtensionContextForLiveLookupExtension:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)getEnabledStatusForExtensionWithIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "getEnabledStatusForExtensionWithIdentifieridentifier %@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__CXCallDirectoryHost_getEnabledStatusForExtensionWithIdentifier_reply___block_invoke;
  v11[3] = &unk_1E5CADDC8;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(CXCallDirectoryHost *)self _nsExtensionWithIdentifier:v9 completion:v11];
}

void __72__CXCallDirectoryHost_getEnabledStatusForExtensionWithIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__CXCallDirectoryHost_getEnabledStatusForExtensionWithIdentifier_reply___block_invoke_2;
    v9[3] = &unk_1E5CADDA0;
    v9[4] = v5;
    id v10 = v3;
    id v11 = *(id *)(a1 + 48);
    [v5 performDelegateCallback:v9];
  }
  else
  {
    id v6 = CXDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __59__CXCallDirectoryHost_reloadExtensionWithIdentifier_reply___block_invoke_cold_1();
    }

    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "cx_callDirectoryManagerErrorWithCode:", 1);
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
  }
}

void __72__CXCallDirectoryHost_getEnabledStatusForExtensionWithIdentifier_reply___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callDirectoryHost:*(void *)(a1 + 32) requestedEnabledStatusForExtension:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)getEnabledForLiveLookupExtensionWithIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "getEnabledForLiveLookupExtensionWithIdentifier identifier %@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__CXCallDirectoryHost_getEnabledForLiveLookupExtensionWithIdentifier_reply___block_invoke;
  v11[3] = &unk_1E5CADDC8;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(CXCallDirectoryHost *)self _nsExtensionWithIdentifier:v9 completion:v11];
}

void __76__CXCallDirectoryHost_getEnabledForLiveLookupExtensionWithIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 callDirectoryHost:*(void *)(a1 + 32) requestedEnabledForLiveLookupExtension:v3 completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    id v5 = CXDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __59__CXCallDirectoryHost_reloadExtensionWithIdentifier_reply___block_invoke_cold_1();
    }

    uint64_t v6 = *(void *)(a1 + 48);
    id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "cx_callDirectoryManagerErrorWithCode:", 1);
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v4);
  }
}

- (void)setEnabled:(BOOL)a3 forLiveLookupExtensionWithIdentifier:(id)a4 reply:(id)a5
{
  BOOL v6 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a5;
  id v10 = CXDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    BOOL v33 = v6;
    __int16 v34 = 2112;
    id v35 = v8;
    _os_log_impl(&dword_1A6E3A000, v10, OS_LOG_TYPE_DEFAULT, "enabled %d identifier %@", buf, 0x12u);
  }

  if (![(CXCallDirectoryHost *)self _connectionContainsCallDirectoryHostEntitlementCapability:@"modify-any-extension"])
  {
    id v13 = CXDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CXCallDirectoryHost setEnabled:forLiveLookupExtensionWithIdentifier:reply:](v13, v14, v15, v16, v17, v18, v19, v20);
    }

    id v12 = [NSString stringWithFormat:@"Requestor does not contain entitlement capability '%@' in call directory host entitlement capabilities list", @"modify-any-extension"];
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    id v31 = v12;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    uint64_t v22 = objc_msgSend(v21, "cx_callDirectoryManagerErrorWithCode:userInfo:", 100, v11);
    goto LABEL_12;
  }
  id v29 = 0;
  id v11 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:v8 error:&v29];
  id v12 = v29;
  if (!v11)
  {
    v23 = CXDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[CXCallDirectoryHost setEnabled:forLiveLookupExtensionWithIdentifier:reply:]();
    }

    uint64_t v22 = objc_msgSend(MEMORY[0x1E4F28C58], "cx_callDirectoryManagerErrorWithCode:", 1);
LABEL_12:
    id v24 = (void *)v22;
    v9[2](v9, v22);

    goto LABEL_13;
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __77__CXCallDirectoryHost_setEnabled_forLiveLookupExtensionWithIdentifier_reply___block_invoke;
  v25[3] = &unk_1E5CADDF0;
  v25[4] = self;
  BOOL v28 = v6;
  id v11 = v11;
  id v26 = v11;
  uint64_t v27 = v9;
  [(CXCallDirectoryHost *)self performDelegateCallback:v25];

LABEL_13:
}

void __77__CXCallDirectoryHost_setEnabled_forLiveLookupExtensionWithIdentifier_reply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callDirectoryHost:*(void *)(a1 + 32) requestedSetEnabled:*(unsigned __int8 *)(a1 + 56) forLiveLookupExtension:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_nsExtensionWithIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = objc_alloc_init(CXCallDirectoryNSExtensionManager);
    id v8 = [MEMORY[0x1E4F29268] currentConnection];
    uint64_t v9 = [v8 processIdentifier];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__CXCallDirectoryHost__nsExtensionWithIdentifier_completion___block_invoke;
    v12[3] = &unk_1E5CADE18;
    id v14 = v6;
    id v13 = v5;
    int v15 = v9;
    [(CXCallDirectoryNSExtensionManager *)v7 extensionWithIdentifier:v13 inContainingAppWithProcessIdentifier:v9 completion:v12];
  }
  else
  {
    id v10 = CXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_1A6E3A000, v10, OS_LOG_TYPE_DEFAULT, "[WARN] identifier is nil", v11, 2u);
    }

    objc_msgSend(MEMORY[0x1E4F28C58], "cx_callDirectoryManagerErrorWithCode:", 1);
    id v7 = (CXCallDirectoryNSExtensionManager *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, CXCallDirectoryNSExtensionManager *))v6 + 2))(v6, 0, v7);
  }
}

void __61__CXCallDirectoryHost__nsExtensionWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    id v4 = CXDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __61__CXCallDirectoryHost__nsExtensionWithIdentifier_completion___block_invoke_cold_1();
    }

    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "cx_callDirectoryManagerErrorWithCode:", 1);
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
  }
}

- (void)setEnabled:(BOOL)a3 forExtensionWithIdentifier:(id)a4 reply:(id)a5
{
  BOOL v6 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = (void (**)(id, uint64_t))a5;
  id v10 = CXDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    BOOL v33 = v6;
    __int16 v34 = 2112;
    id v35 = v8;
    _os_log_impl(&dword_1A6E3A000, v10, OS_LOG_TYPE_DEFAULT, "enabled %d identifier %@", buf, 0x12u);
  }

  if (![(CXCallDirectoryHost *)self _connectionContainsCallDirectoryHostEntitlementCapability:@"modify-any-extension"])
  {
    id v13 = CXDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CXCallDirectoryHost setEnabled:forLiveLookupExtensionWithIdentifier:reply:](v13, v14, v15, v16, v17, v18, v19, v20);
    }

    id v12 = [NSString stringWithFormat:@"Requestor does not contain entitlement capability '%@' in call directory host entitlement capabilities list", @"modify-any-extension"];
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    id v31 = v12;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    uint64_t v22 = objc_msgSend(v21, "cx_callDirectoryManagerErrorWithCode:userInfo:", 100, v11);
    goto LABEL_12;
  }
  id v29 = 0;
  id v11 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:v8 error:&v29];
  id v12 = v29;
  if (!v11)
  {
    v23 = CXDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[CXCallDirectoryHost setEnabled:forLiveLookupExtensionWithIdentifier:reply:]();
    }

    uint64_t v22 = objc_msgSend(MEMORY[0x1E4F28C58], "cx_callDirectoryManagerErrorWithCode:", 1);
LABEL_12:
    id v24 = (void *)v22;
    v9[2](v9, v22);

    goto LABEL_13;
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __67__CXCallDirectoryHost_setEnabled_forExtensionWithIdentifier_reply___block_invoke;
  v25[3] = &unk_1E5CADDF0;
  v25[4] = self;
  BOOL v28 = v6;
  id v11 = v11;
  id v26 = v11;
  uint64_t v27 = v9;
  [(CXCallDirectoryHost *)self performDelegateCallback:v25];

LABEL_13:
}

void __67__CXCallDirectoryHost_setEnabled_forExtensionWithIdentifier_reply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callDirectoryHost:*(void *)(a1 + 32) requestedToSetEnabled:*(unsigned __int8 *)(a1 + 56) forExtension:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)getLastUpdatedCallDirectoryInfoWithReply:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "getLastUpdatedCallDirectoryInfoWithReply", buf, 2u);
  }

  if ([(CXCallDirectoryHost *)self _connectionContainsCallDirectoryHostEntitlementCapability:@"query-identification-entries"])
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __64__CXCallDirectoryHost_getLastUpdatedCallDirectoryInfoWithReply___block_invoke;
    v18[3] = &unk_1E5CADD78;
    v18[4] = self;
    id v19 = v4;
    [(CXCallDirectoryHost *)self performDelegateCallback:v18];
  }
  else
  {
    BOOL v6 = CXDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CXCallDirectoryHost getLastUpdatedCallDirectoryInfoWithReply:](v6, v7, v8, v9, v10, v11, v12, v13);
    }

    uint64_t v14 = [NSString stringWithFormat:@"Requestor does not contain entitlement capability '%@' in call directory host entitlement capabilities list", @"query-identification-entries"];
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22[0] = v14;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v17 = objc_msgSend(v15, "cx_callDirectoryManagerErrorWithCode:userInfo:", 100, v16);
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v17);
  }
}

void __64__CXCallDirectoryHost_getLastUpdatedCallDirectoryInfoWithReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callDirectoryHost:*(void *)(a1 + 32) requestedLastUpdatedInfoWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)fetchLiveBlockingInfoForHandle:(id)a3 reply:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v6;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "blockingInfoFor handle=%@", buf, 0xCu);
  }

  if ([(CXCallDirectoryHost *)self _connectionContainsCallDirectoryHostEntitlementCapability:@"query-identification-entries"])
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __60__CXCallDirectoryHost_fetchLiveBlockingInfoForHandle_reply___block_invoke;
    v21[3] = &unk_1E5CADDA0;
    v21[4] = self;
    id v22 = v6;
    id v23 = v7;
    [(CXCallDirectoryHost *)self performDelegateCallback:v21];
  }
  else
  {
    uint64_t v9 = CXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CXCallDirectoryHost firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:cacheOnly:reply:](v9, v10, v11, v12, v13, v14, v15, v16);
    }

    uint64_t v17 = [NSString stringWithFormat:@"Requestor does not contain entitlement capability '%@' in call directory host entitlement capabilities list", @"query-identification-entries"];
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    id v25 = v17;
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    uint64_t v20 = objc_msgSend(v18, "cx_callDirectoryManagerErrorWithCode:userInfo:", 100, v19);
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v20);
  }
}

void __60__CXCallDirectoryHost_fetchLiveBlockingInfoForHandle_reply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callDirectoryHost:*(void *)(a1 + 32) requestedLiveBlockingInfoFor:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber:(id)a3 reply:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(CXCallDirectoryHost *)self _connectionContainsCallDirectoryHostEntitlementCapability:@"query-identification-entries"])
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __87__CXCallDirectoryHost_firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber_reply___block_invoke;
    v20[3] = &unk_1E5CADDA0;
    v20[4] = self;
    id v21 = v6;
    id v22 = v7;
    [(CXCallDirectoryHost *)self performDelegateCallback:v20];
  }
  else
  {
    uint64_t v8 = CXDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CXCallDirectoryHost firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:cacheOnly:reply:](v8, v9, v10, v11, v12, v13, v14, v15);
    }

    uint64_t v16 = [NSString stringWithFormat:@"Requestor does not contain entitlement capability '%@' in call directory host entitlement capabilities list", @"query-identification-entries"];
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = v16;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    id v19 = objc_msgSend(v17, "cx_callDirectoryManagerErrorWithCode:userInfo:", 100, v18);
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v19);
  }
}

void __87__CXCallDirectoryHost_firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber_reply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callDirectoryHost:*(void *)(a1 + 32) requestedFirstEnabledLiveBlockingExtensionIdentifierForPhoneNumber:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)getExtensionsWithReply:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1A6EAF971, buf, 2u);
  }

  if ([(CXCallDirectoryHost *)self _connectionContainsCallDirectoryHostEntitlementCapability:@"query-extension-priorities"])
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __46__CXCallDirectoryHost_getExtensionsWithReply___block_invoke;
    v18[3] = &unk_1E5CADD78;
    v18[4] = self;
    id v19 = v4;
    [(CXCallDirectoryHost *)self performDelegateCallback:v18];
  }
  else
  {
    id v6 = CXDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CXCallDirectoryHost getExtensionsWithReply:](v6, v7, v8, v9, v10, v11, v12, v13);
    }

    uint64_t v14 = [NSString stringWithFormat:@"Requestor does not contain entitlement capability '%@' in call directory host entitlement capabilities list", @"query-extension-priorities"];
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22[0] = v14;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v17 = objc_msgSend(v15, "cx_callDirectoryManagerErrorWithCode:userInfo:", 100, v16);
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v17);
  }
}

void __46__CXCallDirectoryHost_getExtensionsWithReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callDirectoryHost:*(void *)(a1 + 32) requestedExtensionsWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)setPrioritizedExtensionIdentifiers:(id)a3 reply:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v6;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "prioritizedExtensionIdentifiers %@", buf, 0xCu);
  }

  if ([(CXCallDirectoryHost *)self _connectionContainsCallDirectoryHostEntitlementCapability:@"modify-extension-priorities"])
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __64__CXCallDirectoryHost_setPrioritizedExtensionIdentifiers_reply___block_invoke;
    v21[3] = &unk_1E5CADDA0;
    v21[4] = self;
    id v22 = v6;
    id v23 = v7;
    [(CXCallDirectoryHost *)self performDelegateCallback:v21];
  }
  else
  {
    uint64_t v9 = CXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CXCallDirectoryHost setPrioritizedExtensionIdentifiers:reply:](v9, v10, v11, v12, v13, v14, v15, v16);
    }

    uint64_t v17 = [NSString stringWithFormat:@"Requestor does not contain entitlement capability '%@' in call directory host entitlement capabilities list", @"modify-extension-priorities"];
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    id v25 = v17;
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    uint64_t v20 = objc_msgSend(v18, "cx_callDirectoryManagerErrorWithCode:userInfo:", 100, v19);
    (*((void (**)(id, void *))v7 + 2))(v7, v20);
  }
}

void __64__CXCallDirectoryHost_setPrioritizedExtensionIdentifiers_reply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callDirectoryHost:*(void *)(a1 + 32) requestedToSetPrioritizedExtensionIdentifiers:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)synchronizeExtensionsWithReply:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1A6EAF971, buf, 2u);
  }

  if ([(CXCallDirectoryHost *)self _connectionContainsCallDirectoryHostEntitlementCapability:@"synchronize-extensions"])
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __54__CXCallDirectoryHost_synchronizeExtensionsWithReply___block_invoke;
    v18[3] = &unk_1E5CADD78;
    v18[4] = self;
    id v19 = v4;
    [(CXCallDirectoryHost *)self performDelegateCallback:v18];
  }
  else
  {
    id v6 = CXDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CXCallDirectoryHost synchronizeExtensionsWithReply:](v6, v7, v8, v9, v10, v11, v12, v13);
    }

    uint64_t v14 = [NSString stringWithFormat:@"Requestor does not contain entitlement capability '%@' in call directory host entitlement capabilities list", @"synchronize-extensions"];
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22[0] = v14;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v17 = objc_msgSend(v15, "cx_callDirectoryManagerErrorWithCode:userInfo:", 100, v16);
    (*((void (**)(id, void *))v4 + 2))(v4, v17);
  }
}

void __54__CXCallDirectoryHost_synchronizeExtensionsWithReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callDirectoryHost:*(void *)(a1 + 32) requestedToSynchronizeExtensionsWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)compactStoreWithReply:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1A6EAF971, buf, 2u);
  }

  if ([(CXCallDirectoryHost *)self _connectionContainsCallDirectoryHostEntitlementCapability:@"compact-store"])
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __45__CXCallDirectoryHost_compactStoreWithReply___block_invoke;
    v18[3] = &unk_1E5CADD78;
    v18[4] = self;
    id v19 = v4;
    [(CXCallDirectoryHost *)self performDelegateCallback:v18];
  }
  else
  {
    id v6 = CXDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CXCallDirectoryHost compactStoreWithReply:](v6, v7, v8, v9, v10, v11, v12, v13);
    }

    uint64_t v14 = [NSString stringWithFormat:@"Requestor does not contain entitlement capability '%@' in call directory host entitlement capabilities list", @"compact-store"];
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22[0] = v14;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v17 = objc_msgSend(v15, "cx_callDirectoryManagerErrorWithCode:userInfo:", 100, v16);
    (*((void (**)(id, void *))v4 + 2))(v4, v17);
  }
}

void __45__CXCallDirectoryHost_compactStoreWithReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callDirectoryHost:*(void *)(a1 + 32) requestedToCompactStoreWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)cleanUpLiveLookupDataWithReply:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "cleanUpLiveLookupDataWithReply", buf, 2u);
  }

  if ([(CXCallDirectoryHost *)self _connectionContainsCallDirectoryHostEntitlementCapability:@"compact-store"])
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __54__CXCallDirectoryHost_cleanUpLiveLookupDataWithReply___block_invoke;
    v18[3] = &unk_1E5CADD78;
    v18[4] = self;
    id v19 = v4;
    [(CXCallDirectoryHost *)self performDelegateCallback:v18];
  }
  else
  {
    id v6 = CXDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CXCallDirectoryHost compactStoreWithReply:](v6, v7, v8, v9, v10, v11, v12, v13);
    }

    uint64_t v14 = [NSString stringWithFormat:@"Requestor does not contain entitlement capability '%@' in call directory host entitlement capabilities list", @"compact-store"];
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22[0] = v14;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v17 = objc_msgSend(v15, "cx_callDirectoryManagerErrorWithCode:userInfo:", 100, v16);
    (*((void (**)(id, void *))v4 + 2))(v4, v17);
  }
}

uint64_t __54__CXCallDirectoryHost_cleanUpLiveLookupDataWithReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callDirectoryHostRequestedToCleanupLiveLookupData:*(void *)(a1 + 32)];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void)launchCallDirectorySettingsWithReply:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1A6EAF971, buf, 2u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__CXCallDirectoryHost_launchCallDirectorySettingsWithReply___block_invoke;
  v7[3] = &unk_1E5CADD78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CXCallDirectoryHost *)self performDelegateCallback:v7];
}

void __60__CXCallDirectoryHost_launchCallDirectorySettingsWithReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callDirectoryHost:*(void *)(a1 + 32) requestedToLaunchCallDirectorySettingsWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)prepareStoreIfNecessary
{
  id v3 = CXDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6E3A000, v3, OS_LOG_TYPE_DEFAULT, "prepareStoreIfNecessary", buf, 2u);
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__CXCallDirectoryHost_prepareStoreIfNecessary__block_invoke;
  v4[3] = &unk_1E5CADD30;
  v4[4] = self;
  [(CXCallDirectoryHost *)self performDelegateCallback:v4];
}

void __46__CXCallDirectoryHost_prepareStoreIfNecessary__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callDirectoryHost:*(void *)(a1 + 32) requestedToPrepareStoreWithCompletionHandler:0];
}

- (void)setQueue:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_connectionContainsCallDirectoryHostEntitlementCapability:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v5 = 138412802;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  id v8 = @"com.apple.CallKit.call-directory";
  __int16 v9 = 2112;
  id v10 = (id)objc_opt_class();
  id v4 = v10;
  _os_log_error_impl(&dword_1A6E3A000, a3, OS_LOG_TYPE_ERROR, "XPC connection %@ contains entitlement '%@' but it is of unexpected class %@, should be NSArray", (uint8_t *)&v5, 0x20u);
}

void __59__CXCallDirectoryHost_reloadExtensionWithIdentifier_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1A6E3A000, v0, v1, "No extension returned with identifier %@", v2, v3, v4, v5, v6);
}

void __68__CXCallDirectoryHost_resetLiveLookupExtensionWithIdentifier_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1A6E3A000, v0, v1, "No extension returned with identifier %@ error %@");
}

- (void)setEnabled:forLiveLookupExtensionWithIdentifier:reply:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1A6E3A000, v0, v1, "Error locating extension with identifier %@: %@");
}

- (void)setEnabled:(uint64_t)a3 forLiveLookupExtensionWithIdentifier:(uint64_t)a4 reply:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __61__CXCallDirectoryHost__nsExtensionWithIdentifier_completion___block_invoke_cold_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_1A6E3A000, v1, OS_LOG_TYPE_ERROR, "No extension found with identifier %@ containingAppPID %d", v2, 0x12u);
}

- (void)getLastUpdatedCallDirectoryInfoWithReply:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:(uint64_t)a3 cacheOnly:(uint64_t)a4 reply:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getExtensionsWithReply:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setPrioritizedExtensionIdentifiers:(uint64_t)a3 reply:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)synchronizeExtensionsWithReply:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)compactStoreWithReply:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end