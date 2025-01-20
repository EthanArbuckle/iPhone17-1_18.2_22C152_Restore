@interface _KSTextReplacementClientStore
- (_KSTextReplacementClientStore)init;
- (id)phraseShortcuts;
- (id)textReplacementEntries;
- (void)addEntries:(id)a3 removeEntries:(id)a4 withCompletionHandler:(id)a5;
- (void)cancelPendingUpdates;
- (void)modifyEntry:(id)a3 toEntry:(id)a4 withCompletionHandler:(id)a5;
- (void)performTransaction:(id)a3 completionHandler:(id)a4;
- (void)queryTextReplacementsWithCallback:(id)a3;
- (void)queryTextReplacementsWithPredicate:(id)a3 callback:(id)a4;
- (void)removeAllEntries;
- (void)requestSyncWithCompletionBlock:(id)a3;
@end

@implementation _KSTextReplacementClientStore

- (_KSTextReplacementClientStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)_KSTextReplacementClientStore;
  v2 = [(_KSTextReplacementClientStore *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[_KSTextReplacementServerConnection serviceConnection];
    connection = v2->_connection;
    v2->_connection = (_KSTextReplacementServerConnection *)v3;
  }
  return v2;
}

- (void)modifyEntry:(id)a3 toEntry:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void))a5;
  if ([v9 isEquivalentTo:v8])
  {
    v11 = KSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[_KSTextReplacementClientStore modifyEntry:toEntry:withCompletionHandler:]";
      _os_log_impl(&dword_22B2BC000, v11, OS_LOG_TYPE_INFO, "%s  not modifying entry as old and new are the same", buf, 0xCu);
    }

    v10[2](v10, 0);
  }
  else
  {
    int64_t v12 = +[_KSTextReplacementHelper validateTextReplacement:v9];
    if (v12)
    {
      int64_t v13 = v12;
      [v9 setPriorValue:v8];
      v14 = +[_KSTextReplacementHelper errorWithCode:v13 forEntry:v9];
      ((void (**)(id, void *))v10)[2](v10, v14);
    }
    else
    {
      id v20 = v9;
      v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
      id v19 = v8;
      v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __75___KSTextReplacementClientStore_modifyEntry_toEntry_withCompletionHandler___block_invoke;
      v17[3] = &unk_264891330;
      v18 = v10;
      [(_KSTextReplacementClientStore *)self addEntries:v15 removeEntries:v16 withCompletionHandler:v17];
    }
  }
}

- (void)addEntries:(id)a3 removeEntries:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a5;
  connection = self->_connection;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80___KSTextReplacementClientStore_addEntries_removeEntries_withCompletionHandler___block_invoke;
  v11[3] = &unk_264891358;
  id v12 = v8;
  id v10 = v8;
  [(_KSTextReplacementServerConnection *)connection addEntries:a3 removeEntries:a4 withReply:v11];
}

- (void)removeAllEntries
{
}

- (void)requestSyncWithCompletionBlock:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64___KSTextReplacementClientStore_requestSyncWithCompletionBlock___block_invoke;
  v7[3] = &unk_264891380;
  id v8 = v4;
  id v6 = v4;
  [(_KSTextReplacementServerConnection *)connection requestSyncWithReply:v7];
}

- (void)cancelPendingUpdates
{
}

- (id)textReplacementEntries
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55___KSTextReplacementClientStore_textReplacementEntries__block_invoke;
  v8[3] = &unk_2648913C8;
  id v10 = &v11;
  id v4 = v3;
  id v9 = v4;
  [(_KSTextReplacementClientStore *)self queryTextReplacementsWithCallback:v8];
  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  id v6 = 0;
  if (!dispatch_semaphore_wait(v4, v5)) {
    id v6 = (id)v12[5];
  }

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)queryTextReplacementsWithCallback:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67___KSTextReplacementClientStore_queryTextReplacementsWithCallback___block_invoke;
  v7[3] = &unk_2648913F0;
  id v8 = v4;
  id v6 = v4;
  [(_KSTextReplacementServerConnection *)connection queryTextReplacementEntriesWithReply:v7];
}

- (void)queryTextReplacementsWithPredicate:(id)a3 callback:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __77___KSTextReplacementClientStore_queryTextReplacementsWithPredicate_callback___block_invoke;
  v9[3] = &unk_2648913F0;
  id v10 = v6;
  id v8 = v6;
  [(_KSTextReplacementServerConnection *)connection queryTextReplacementsWithPredicate:a3 reply:v9];
}

- (void)performTransaction:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF980] array];
  id v9 = [MEMORY[0x263EFF980] array];
  id v10 = [v6 valueToInsert];

  if (v10)
  {
    uint64_t v11 = objc_opt_class();
    id v12 = [v6 valueToInsert];
    uint64_t v13 = [v11 textReplaceEntryFromTIDictionaryValue:v12];

    if (v13)
    {
      [v8 addObject:v13];
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  v14 = [v6 valueToDelete];

  if (v14)
  {
    v15 = objc_opt_class();
    id v16 = [v6 valueToDelete];
    v14 = [v15 textReplaceEntryFromTIDictionaryValue:v16];

    if (v13) {
      [v9 addObject:v14];
    }
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __70___KSTextReplacementClientStore_performTransaction_completionHandler___block_invoke;
  v18[3] = &unk_264891330;
  id v19 = v7;
  id v17 = v7;
  [(_KSTextReplacementClientStore *)self addEntries:v8 removeEntries:v9 withCompletionHandler:v18];
}

- (id)phraseShortcuts
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [(_KSTextReplacementClientStore *)self textReplacementEntries];
  dispatch_semaphore_t v3 = [MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend((id)objc_opt_class(), "transactionFromTextReplacementEntry:forDelete:", *(void *)(*((void *)&v11 + 1) + 8 * i), 0, (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end