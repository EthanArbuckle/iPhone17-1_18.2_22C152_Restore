@interface _KSTRClient
- (BOOL)hasReadAccess;
- (_KSTRClient)initWithOwner:(id)a3;
- (_KSTRClient)initWithOwner:(id)a3 forConnection:(id)a4;
- (int64_t)generation;
- (void)addEntries:(id)a3 removeEntries:(id)a4 withReply:(id)a5;
- (void)cancel;
- (void)cancelPendingUpdatesWithReply:(id)a3;
- (void)queryTextReplacementEntriesWithReply:(id)a3;
- (void)queryTextReplacementsWithPredicate:(id)a3 reply:(id)a4;
- (void)removeAllEntries;
- (void)requestSyncWithReply:(id)a3;
- (void)setGeneration:(int64_t)a3;
@end

@implementation _KSTRClient

- (_KSTRClient)initWithOwner:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_KSTRClient;
  v5 = [(_KSTRClient *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_owner, v4);
    v6->_hasReadAccess = 1;
  }

  return v6;
}

- (_KSTRClient)initWithOwner:(id)a3 forConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_KSTRClient;
  objc_super v8 = [(_KSTRClient *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_owner, v6);
    v10 = [v7 valueForEntitlement:kTextReplacementEntitlement];
    v9->_hasReadAccess = [v10 BOOLValue];
  }
  return v9;
}

- (void)cancel
{
}

- (void)addEntries:(id)a3 removeEntries:(id)a4 withReply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __50___KSTRClient_addEntries_removeEntries_withReply___block_invoke;
  v13[3] = &unk_264891330;
  id v14 = v8;
  id v12 = v8;
  [WeakRetained addEntries:v10 removeEntries:v9 forClient:self withCompletionHandler:v13];
}

- (void)removeAllEntries
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  [WeakRetained removeAllEntries];
}

- (void)requestSyncWithReply:(id)a3
{
  p_owner = &self->_owner;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_owner);
  [WeakRetained requestSync:0 withCompletionBlock:v4];
}

- (void)cancelPendingUpdatesWithReply:(id)a3
{
  id v7 = (void (**)(id, uint64_t, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  uint64_t v5 = [WeakRetained _cancelPendingUpdateForClient:self];

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [MEMORY[0x263F087E8] errorWithDomain:@"KSTextReplacementErrorDomain" code:10 userInfo:&unk_26DE92A88];
  }
  v7[2](v7, v5, v6);
}

- (void)queryTextReplacementEntriesWithReply:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(_KSTRClient *)self hasReadAccess])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v11 = 0x3032000000;
    id v12 = __Block_byref_object_copy__5;
    v13 = __Block_byref_object_dispose__5;
    id v14 = (id)os_transaction_create();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __52___KSTRClient_queryTextReplacementEntriesWithReply___block_invoke;
    v7[3] = &unk_264891918;
    id v8 = v4;
    p_long long buf = &buf;
    [WeakRetained queryTextReplacementsWithCallback:v7];

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v6 = KSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[_KSTRClient queryTextReplacementEntriesWithReply:]";
      _os_log_impl(&dword_22B2BC000, v6, OS_LOG_TYPE_INFO, "%s  Client does not have read access", (uint8_t *)&buf, 0xCu);
    }

    (*((void (**)(id, void, uint64_t))v4 + 2))(v4, MEMORY[0x263EFFA68], 1);
  }
}

- (void)queryTextReplacementsWithPredicate:(id)a3 reply:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(_KSTRClient *)self hasReadAccess])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__5;
    v16 = __Block_byref_object_dispose__5;
    id v17 = (id)os_transaction_create();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __56___KSTRClient_queryTextReplacementsWithPredicate_reply___block_invoke;
    v10[3] = &unk_264891918;
    id v11 = v7;
    p_long long buf = &buf;
    [WeakRetained queryTextReplacementsWithPredicate:v6 callback:v10];

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v9 = KSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[_KSTRClient queryTextReplacementsWithPredicate:reply:]";
      _os_log_impl(&dword_22B2BC000, v9, OS_LOG_TYPE_INFO, "%s  Client does not have read access", (uint8_t *)&buf, 0xCu);
    }

    (*((void (**)(id, void, uint64_t))v7 + 2))(v7, MEMORY[0x263EFFA68], 1);
  }
}

- (int64_t)generation
{
  return self->_generation;
}

- (void)setGeneration:(int64_t)a3
{
  self->_generation = a3;
}

- (BOOL)hasReadAccess
{
  return self->_hasReadAccess;
}

- (void).cxx_destruct
{
}

@end