@interface CXCallDirectoryExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (BOOL)hasQueriedIsIncremental;
- (BOOL)isIncremental;
- (CXCallDirectoryExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
- (CXCallDirectoryMutableLabeledPhoneNumberEntryData)pendingIdentificationEntryDataForAddition;
- (CXCallDirectoryMutablePhoneNumberEntryData)pendingBlockingEntryData;
- (CXCallDirectoryMutablePhoneNumberEntryData)pendingIdentificationEntryDataForRemoval;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3 synchronous:(BOOL)a4;
- (id)delegate;
- (id)remoteObjectProxyGenerator;
- (int64_t)pendingBlockingEntryChangeType;
- (int64_t)pendingIdentificationEntryChangeType;
- (void)_flushPendingBlockingEntryData;
- (void)_flushPendingIdentificationEntryData;
- (void)_performBlockIfIncremental:(id)a3 usingSelectorForExceptionMessage:(SEL)a4;
- (void)addBlockingEntryWithNextSequentialPhoneNumber:(CXCallDirectoryPhoneNumber)phoneNumber;
- (void)appendBlockingEntryPhoneNumber:(int64_t)a3 changeType:(int64_t)a4;
- (void)appendIdentificationEntryForAdditionWithPhoneNumber:(int64_t)a3 label:(id)a4;
- (void)appendIdentificationEntryForRemovalWithPhoneNumber:(int64_t)a3;
- (void)completeRequestWithCompletionHandler:(void *)completion;
- (void)removeAllBlockingEntries;
- (void)removeAllIdentificationEntries;
- (void)removeBlockingEntryWithPhoneNumber:(CXCallDirectoryPhoneNumber)phoneNumber;
- (void)removeIdentificationEntryWithPhoneNumber:(CXCallDirectoryPhoneNumber)phoneNumber;
- (void)requestFailedWithError:(id)a3 reply:(id)a4;
- (void)setDelegate:(id)delegate;
- (void)setHasQueriedIsIncremental:(BOOL)a3;
- (void)setPendingBlockingEntryChangeType:(int64_t)a3;
- (void)setPendingBlockingEntryData:(id)a3;
- (void)setPendingIdentificationEntryChangeType:(int64_t)a3;
- (void)setPendingIdentificationEntryDataForAddition:(id)a3;
- (void)setPendingIdentificationEntryDataForRemoval:(id)a3;
- (void)setRemoteObjectProxyGenerator:(id)a3;
@end

@implementation CXCallDirectoryExtensionContext

- (CXCallDirectoryExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)CXCallDirectoryExtensionContext;
  v5 = [(CXCallDirectoryExtensionContext *)&v12 initWithInputItems:a3 listenerEndpoint:a4 contextUUID:a5];
  if (v5)
  {
    objc_initWeak(&location, v5);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__CXCallDirectoryExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke;
    v9[3] = &unk_1E5CAE7B0;
    objc_copyWeak(&v10, &location);
    uint64_t v6 = MEMORY[0x1AD0C5BA0](v9);
    id remoteObjectProxyGenerator = v5->_remoteObjectProxyGenerator;
    v5->_id remoteObjectProxyGenerator = (id)v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v5;
}

id __83__CXCallDirectoryExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a3)
    {
      if (!v5) {
        id v5 = &__block_literal_global_11;
      }
      v8 = [WeakRetained _auxiliaryConnection];
      uint64_t v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v5];
    }
    else
    {
      v11 = [WeakRetained _auxiliaryConnection];
      v8 = v11;
      if (v5) {
        [v11 remoteObjectProxyWithErrorHandler:v5];
      }
      else {
      uint64_t v9 = [v11 remoteObjectProxy];
      }
    }
    id v10 = (void *)v9;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __83__CXCallDirectoryExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = CXDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __73__CXCallDirectoryExtensionHostContext_requestFailedWithError_completion___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3 synchronous:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(CXCallDirectoryExtensionContext *)self remoteObjectProxyGenerator];
  v8 = ((void (**)(void, id, BOOL))v7)[2](v7, v6, v4);

  return v8;
}

- (CXCallDirectoryMutablePhoneNumberEntryData)pendingBlockingEntryData
{
  pendingBlockingEntryData = self->_pendingBlockingEntryData;
  if (!pendingBlockingEntryData)
  {
    BOOL v4 = [[CXCallDirectoryMutablePhoneNumberEntryData alloc] initWithCapacity:10000];
    id v5 = self->_pendingBlockingEntryData;
    self->_pendingBlockingEntryData = v4;

    pendingBlockingEntryData = self->_pendingBlockingEntryData;
  }

  return pendingBlockingEntryData;
}

- (CXCallDirectoryMutableLabeledPhoneNumberEntryData)pendingIdentificationEntryDataForAddition
{
  pendingIdentificationEntryDataForAddition = self->_pendingIdentificationEntryDataForAddition;
  if (!pendingIdentificationEntryDataForAddition)
  {
    BOOL v4 = [[CXCallDirectoryMutableLabeledPhoneNumberEntryData alloc] initWithCapacity:10000];
    id v5 = self->_pendingIdentificationEntryDataForAddition;
    self->_pendingIdentificationEntryDataForAddition = v4;

    pendingIdentificationEntryDataForAddition = self->_pendingIdentificationEntryDataForAddition;
  }

  return pendingIdentificationEntryDataForAddition;
}

- (CXCallDirectoryMutablePhoneNumberEntryData)pendingIdentificationEntryDataForRemoval
{
  pendingIdentificationEntryDataForRemoval = self->_pendingIdentificationEntryDataForRemoval;
  if (!pendingIdentificationEntryDataForRemoval)
  {
    BOOL v4 = [[CXCallDirectoryMutablePhoneNumberEntryData alloc] initWithCapacity:10000];
    id v5 = self->_pendingIdentificationEntryDataForRemoval;
    self->_pendingIdentificationEntryDataForRemoval = v4;

    pendingIdentificationEntryDataForRemoval = self->_pendingIdentificationEntryDataForRemoval;
  }

  return pendingIdentificationEntryDataForRemoval;
}

- (void)appendBlockingEntryPhoneNumber:(int64_t)a3 changeType:(int64_t)a4
{
  if ([(CXCallDirectoryExtensionContext *)self pendingBlockingEntryChangeType] != a4)
  {
    v7 = [(CXCallDirectoryExtensionContext *)self pendingBlockingEntryData];
    uint64_t v8 = [v7 count];

    if (v8) {
      [(CXCallDirectoryExtensionContext *)self _flushPendingBlockingEntryData];
    }
    [(CXCallDirectoryExtensionContext *)self setPendingBlockingEntryChangeType:a4];
  }
  uint64_t v9 = [(CXCallDirectoryExtensionContext *)self pendingBlockingEntryData];
  [v9 appendPhoneNumber:a3];

  id v10 = [(CXCallDirectoryExtensionContext *)self pendingBlockingEntryData];
  unint64_t v11 = [v10 count];

  if (v11 >> 4 >= 0x271)
  {
    [(CXCallDirectoryExtensionContext *)self _flushPendingBlockingEntryData];
  }
}

- (void)appendIdentificationEntryForAdditionWithPhoneNumber:(int64_t)a3 label:(id)a4
{
  id v6 = a4;
  if ([(CXCallDirectoryExtensionContext *)self pendingIdentificationEntryChangeType])
  {
    v7 = [(CXCallDirectoryExtensionContext *)self pendingIdentificationEntryDataForAddition];
    uint64_t v8 = [v7 count];
    uint64_t v9 = [(CXCallDirectoryExtensionContext *)self pendingIdentificationEntryDataForRemoval];
    uint64_t v10 = [v9 count];

    if (v8 + v10) {
      [(CXCallDirectoryExtensionContext *)self _flushPendingIdentificationEntryData];
    }
    [(CXCallDirectoryExtensionContext *)self setPendingIdentificationEntryChangeType:0];
  }
  unint64_t v11 = [(CXCallDirectoryExtensionContext *)self pendingIdentificationEntryDataForAddition];
  [v11 appendPhoneNumber:a3 label:v6];

  objc_super v12 = [(CXCallDirectoryExtensionContext *)self pendingIdentificationEntryDataForAddition];
  unint64_t v13 = [v12 count];

  if (v13 >> 4 >= 0x271)
  {
    [(CXCallDirectoryExtensionContext *)self _flushPendingIdentificationEntryData];
  }
}

- (void)appendIdentificationEntryForRemovalWithPhoneNumber:(int64_t)a3
{
  if ([(CXCallDirectoryExtensionContext *)self pendingIdentificationEntryChangeType] != 1)
  {
    id v5 = [(CXCallDirectoryExtensionContext *)self pendingIdentificationEntryDataForAddition];
    uint64_t v6 = [v5 count];
    v7 = [(CXCallDirectoryExtensionContext *)self pendingIdentificationEntryDataForRemoval];
    uint64_t v8 = [v7 count];

    if (v6 + v8) {
      [(CXCallDirectoryExtensionContext *)self _flushPendingIdentificationEntryData];
    }
    [(CXCallDirectoryExtensionContext *)self setPendingIdentificationEntryChangeType:1];
  }
  uint64_t v9 = [(CXCallDirectoryExtensionContext *)self pendingIdentificationEntryDataForRemoval];
  [v9 appendPhoneNumber:a3];

  uint64_t v10 = [(CXCallDirectoryExtensionContext *)self pendingIdentificationEntryDataForRemoval];
  unint64_t v11 = [v10 count];

  if (v11 >> 4 >= 0x271)
  {
    [(CXCallDirectoryExtensionContext *)self _flushPendingIdentificationEntryData];
  }
}

- (void)_flushPendingBlockingEntryData
{
  v3 = [(CXCallDirectoryExtensionContext *)self pendingBlockingEntryData];
  id v6 = (id)[v3 copy];

  [(CXCallDirectoryExtensionContext *)self setPendingBlockingEntryData:0];
  BOOL v4 = [(CXCallDirectoryExtensionContext *)self _remoteObjectProxyWithErrorHandler:0 synchronous:1];
  int64_t v5 = [(CXCallDirectoryExtensionContext *)self pendingBlockingEntryChangeType];
  if (v5 == 1)
  {
    [v4 removeBlockingEntriesWithData:v6 reply:&__block_literal_global_7_0];
  }
  else if (!v5)
  {
    [v4 addBlockingEntriesWithData:v6 reply:&__block_literal_global_5];
  }
}

- (void)_flushPendingIdentificationEntryData
{
  id v7 = [(CXCallDirectoryExtensionContext *)self _remoteObjectProxyWithErrorHandler:0 synchronous:1];
  int64_t v3 = [(CXCallDirectoryExtensionContext *)self pendingIdentificationEntryChangeType];
  if (v3 == 1)
  {
    id v6 = [(CXCallDirectoryExtensionContext *)self pendingIdentificationEntryDataForRemoval];
    int64_t v5 = (void *)[v6 copy];

    [(CXCallDirectoryExtensionContext *)self setPendingIdentificationEntryDataForRemoval:0];
    [v7 removeIdentificationEntriesWithData:v5 reply:&__block_literal_global_11];
  }
  else
  {
    if (v3) {
      goto LABEL_6;
    }
    BOOL v4 = [(CXCallDirectoryExtensionContext *)self pendingIdentificationEntryDataForAddition];
    int64_t v5 = (void *)[v4 copy];

    [(CXCallDirectoryExtensionContext *)self setPendingIdentificationEntryDataForAddition:0];
    [v7 addIdentificationEntriesWithData:v5 reply:&__block_literal_global_9_1];
  }

LABEL_6:
}

- (BOOL)isIncremental
{
  if (![(CXCallDirectoryExtensionContext *)self hasQueriedIsIncremental])
  {
    int64_t v3 = [(CXCallDirectoryExtensionContext *)self _remoteObjectProxyWithErrorHandler:0 synchronous:1];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __48__CXCallDirectoryExtensionContext_isIncremental__block_invoke;
    v5[3] = &unk_1E5CAE7D8;
    v5[4] = self;
    [v3 isIncrementalLoadingAllowed:v5];
  }
  return self->_incremental;
}

void __48__CXCallDirectoryExtensionContext_isIncremental__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = CXDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __48__CXCallDirectoryExtensionContext_isIncremental__block_invoke_cold_1((uint64_t)v5, v6);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setHasQueriedIsIncremental:1];
    *(unsigned char *)(*(void *)(a1 + 32) + 24) = a2;
  }
}

- (void)addBlockingEntryWithNextSequentialPhoneNumber:(CXCallDirectoryPhoneNumber)phoneNumber
{
}

- (void)_performBlockIfIncremental:(id)a3 usingSelectorForExceptionMessage:(SEL)a4
{
  uint64_t v9 = (void (**)(void))a3;
  if ([(CXCallDirectoryExtensionContext *)self isIncremental])
  {
    v9[2]();
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3B8];
    uint64_t v8 = NSStringFromSelector(a4);
    [v6 raise:v7, @"Calling %@ when isIncremental is false is unsupported", v8 format];
  }
}

- (void)removeBlockingEntryWithPhoneNumber:(CXCallDirectoryPhoneNumber)phoneNumber
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__CXCallDirectoryExtensionContext_removeBlockingEntryWithPhoneNumber___block_invoke;
  v3[3] = &unk_1E5CAE800;
  v3[4] = self;
  v3[5] = phoneNumber;
  [(CXCallDirectoryExtensionContext *)self _performBlockIfIncremental:v3 usingSelectorForExceptionMessage:a2];
}

uint64_t __70__CXCallDirectoryExtensionContext_removeBlockingEntryWithPhoneNumber___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendBlockingEntryPhoneNumber:*(void *)(a1 + 40) changeType:1];
}

- (void)removeAllBlockingEntries
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __59__CXCallDirectoryExtensionContext_removeAllBlockingEntries__block_invoke;
  v2[3] = &unk_1E5CADD30;
  v2[4] = self;
  [(CXCallDirectoryExtensionContext *)self _performBlockIfIncremental:v2 usingSelectorForExceptionMessage:a2];
}

void __59__CXCallDirectoryExtensionContext_removeAllBlockingEntries__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pendingBlockingEntryData];
  uint64_t v3 = [v2 count];

  if (v3) {
    [*(id *)(a1 + 32) _flushPendingBlockingEntryData];
  }
  id v4 = [*(id *)(a1 + 32) _remoteObjectProxyWithErrorHandler:0 synchronous:1];
  [v4 removeAllBlockingEntriesWithReply:&__block_literal_global_16];
}

- (void)removeIdentificationEntryWithPhoneNumber:(CXCallDirectoryPhoneNumber)phoneNumber
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __76__CXCallDirectoryExtensionContext_removeIdentificationEntryWithPhoneNumber___block_invoke;
  v3[3] = &unk_1E5CAE800;
  v3[4] = self;
  v3[5] = phoneNumber;
  [(CXCallDirectoryExtensionContext *)self _performBlockIfIncremental:v3 usingSelectorForExceptionMessage:a2];
}

uint64_t __76__CXCallDirectoryExtensionContext_removeIdentificationEntryWithPhoneNumber___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendIdentificationEntryForRemovalWithPhoneNumber:*(void *)(a1 + 40)];
}

- (void)removeAllIdentificationEntries
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __65__CXCallDirectoryExtensionContext_removeAllIdentificationEntries__block_invoke;
  v2[3] = &unk_1E5CADD30;
  v2[4] = self;
  [(CXCallDirectoryExtensionContext *)self _performBlockIfIncremental:v2 usingSelectorForExceptionMessage:a2];
}

void __65__CXCallDirectoryExtensionContext_removeAllIdentificationEntries__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pendingIdentificationEntryDataForAddition];
  uint64_t v3 = [v2 count];
  id v4 = [*(id *)(a1 + 32) pendingIdentificationEntryDataForRemoval];
  uint64_t v5 = [v4 count];

  if (v3 + v5) {
    [*(id *)(a1 + 32) _flushPendingIdentificationEntryData];
  }
  id v6 = [*(id *)(a1 + 32) _remoteObjectProxyWithErrorHandler:0 synchronous:1];
  [v6 removeAllIdentificationEntriesWithReply:&__block_literal_global_18_0];
}

- (void)completeRequestWithCompletionHandler:(void *)completion
{
  id v4 = completion;
  uint64_t v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1A6EAF971, buf, 2u);
  }

  id v6 = [(CXCallDirectoryExtensionContext *)self pendingBlockingEntryData];
  uint64_t v7 = [v6 count];

  if (v7) {
    [(CXCallDirectoryExtensionContext *)self _flushPendingBlockingEntryData];
  }
  uint64_t v8 = [(CXCallDirectoryExtensionContext *)self pendingIdentificationEntryDataForAddition];
  uint64_t v9 = [v8 count];
  uint64_t v10 = [(CXCallDirectoryExtensionContext *)self pendingIdentificationEntryDataForRemoval];
  uint64_t v11 = [v10 count];

  if (v9 + v11) {
    [(CXCallDirectoryExtensionContext *)self _flushPendingIdentificationEntryData];
  }
  objc_super v12 = [(CXCallDirectoryExtensionContext *)self _remoteObjectProxyWithErrorHandler:0 synchronous:0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__CXCallDirectoryExtensionContext_completeRequestWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E5CAE430;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  [v12 completeRequestWithReply:v14];
}

id __72__CXCallDirectoryExtensionContext_completeRequestWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)CXCallDirectoryExtensionContext;
  return objc_msgSendSuper2(&v3, sel_completeRequestReturningItems_completionHandler_, 0, v1);
}

- (void)requestFailedWithError:(id)a3 reply:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  uint64_t v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "request failed with error: %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = [(CXCallDirectoryExtensionContext *)self delegate];
  [v9 requestFailedForExtensionContext:self withError:v6];

  v7[2](v7);
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_1 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_1, &__block_literal_global_22);
  }
  id v2 = (void *)_extensionAuxiliaryVendorProtocol_interface_1;

  return v2;
}

uint64_t __68__CXCallDirectoryExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol_interface_1 = objc_msgSend(MEMORY[0x1E4F29280], "cx_callDirectoryProviderVendorInterface");

  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_1 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_1, &__block_literal_global_25_0);
  }
  id v2 = (void *)_extensionAuxiliaryHostProtocol_interface_1;

  return v2;
}

uint64_t __66__CXCallDirectoryExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol_interface_1 = objc_msgSend(MEMORY[0x1E4F29280], "cx_callDirectoryProviderHostInterface");

  return MEMORY[0x1F41817F8]();
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (void)setPendingBlockingEntryData:(id)a3
{
}

- (int64_t)pendingBlockingEntryChangeType
{
  return self->_pendingBlockingEntryChangeType;
}

- (void)setPendingBlockingEntryChangeType:(int64_t)a3
{
  self->_pendingBlockingEntryChangeType = a3;
}

- (void)setPendingIdentificationEntryDataForAddition:(id)a3
{
}

- (void)setPendingIdentificationEntryDataForRemoval:(id)a3
{
}

- (int64_t)pendingIdentificationEntryChangeType
{
  return self->_pendingIdentificationEntryChangeType;
}

- (void)setPendingIdentificationEntryChangeType:(int64_t)a3
{
  self->_pendingIdentificationEntryChangeType = a3;
}

- (BOOL)hasQueriedIsIncremental
{
  return self->_hasQueriedIsIncremental;
}

- (void)setHasQueriedIsIncremental:(BOOL)a3
{
  self->_hasQueriedIsIncremental = a3;
}

- (id)remoteObjectProxyGenerator
{
  return self->_remoteObjectProxyGenerator;
}

- (void)setRemoteObjectProxyGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteObjectProxyGenerator, 0);
  objc_storeStrong((id *)&self->_pendingIdentificationEntryDataForRemoval, 0);
  objc_storeStrong((id *)&self->_pendingIdentificationEntryDataForAddition, 0);
  objc_storeStrong((id *)&self->_pendingBlockingEntryData, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __48__CXCallDirectoryExtensionContext_isIncremental__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6E3A000, a2, OS_LOG_TYPE_ERROR, "Error querying is incremental loading allowed: %@", (uint8_t *)&v2, 0xCu);
}

@end