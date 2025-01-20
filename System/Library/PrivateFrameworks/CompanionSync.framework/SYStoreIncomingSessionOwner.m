@interface SYStoreIncomingSessionOwner
- (BOOL)isResetSync;
- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4;
- (SYStoreIncomingSessionOwner)initWithIncomingSession:(id)a3;
- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5;
@end

@implementation SYStoreIncomingSessionOwner

- (SYStoreIncomingSessionOwner)initWithIncomingSession:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SYStoreIncomingSessionOwner;
  v5 = [(SYStoreIncomingSessionOwner *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(SYStoreSessionOwner *)v5 setSession:v4];
    v7 = v6;
  }

  return v6;
}

- (BOOL)isResetSync
{
  v2 = [(SYStoreSessionOwner *)self session];
  char v3 = [v2 isResetSync];

  return v3;
}

- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4
{
  id v6 = a3;
  v7 = [(SYStoreSessionOwner *)self store];
  if ([(SYStoreIncomingSessionOwner *)self isResetSync])
  {
    if ((v7[8] & 0x10) != 0)
    {
      v10 = [v7 delegate];
      [v10 syncStoreAllObjectsDeleted:v7];

      BOOL v9 = 1;
      goto LABEL_7;
    }
    unsigned __int8 v8 = -[SYStoreSessionOwner syncSession:resetDataStoreWithError:](&v12, sel_syncSession_resetDataStoreWithError_, v6, a4, self, SYStoreIncomingSessionOwner, v13.receiver, v13.super_class);
  }
  else
  {
    unsigned __int8 v8 = -[SYStoreSessionOwner syncSession:resetDataStoreWithError:](&v13, sel_syncSession_resetDataStoreWithError_, v6, a4, v12.receiver, v12.super_class, self, SYStoreIncomingSessionOwner);
  }
  BOOL v9 = v8;
LABEL_7:

  return v9;
}

- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  BOOL v9 = [(SYStoreSessionOwner *)self store];
  v10 = [v9 delegate];
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  v11 = (void *)qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v12 = v11;
    *(_DWORD *)buf = 134217984;
    uint64_t v24 = [v7 count];
    _os_log_impl(&dword_21C7C9000, v12, OS_LOG_TYPE_DEFAULT, "SYStore shim: forwarding %lu changes to SYStoreDelegate", buf, 0xCu);
  }
  objc_super v13 = [v9 delegateQueue];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __67__SYStoreIncomingSessionOwner_syncSession_applyChanges_completion___block_invoke;
  v18[3] = &unk_264422CB8;
  id v19 = v7;
  id v20 = v10;
  id v21 = v9;
  id v22 = v8;
  id v14 = v8;
  id v15 = v9;
  id v16 = v10;
  id v17 = v7;
  dispatch_async(v13, v18);
}

void __67__SYStoreIncomingSessionOwner_syncSession_applyChanges_completion___block_invoke(id *a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __67__SYStoreIncomingSessionOwner_syncSession_applyChanges_completion___block_invoke_2;
  v2[3] = &unk_264422CB8;
  id v3 = a1[4];
  id v4 = a1[5];
  id v5 = a1[6];
  id v6 = a1[7];
  _os_activity_initiate(&dword_21C7C9000, "Sync Batch Input", OS_ACTIVITY_FLAG_DEFAULT, v2);
}

uint64_t __67__SYStoreIncomingSessionOwner_syncSession_applyChanges_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "changeType", (void)v17);
        switch(v8)
        {
          case 3:
            id v14 = *(void **)(a1 + 40);
            uint64_t v15 = *(void *)(a1 + 48);
            v11 = [v7 wrappedObject];
            [v14 syncStore:v15 objectDeleted:v11];
            break;
          case 2:
            objc_super v12 = *(void **)(a1 + 40);
            uint64_t v13 = *(void *)(a1 + 48);
            v11 = [v7 wrappedObject];
            [v12 syncStore:v13 objectUpdated:v11];
            break;
          case 1:
            BOOL v9 = *(void **)(a1 + 40);
            uint64_t v10 = *(void *)(a1 + 48);
            v11 = [v7 wrappedObject];
            [v9 syncStore:v10 objectAdded:v11];
            break;
          default:
            continue;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

@end