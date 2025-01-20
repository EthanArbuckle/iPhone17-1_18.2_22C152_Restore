@interface _KSTextReplacementServerConnection
+ (id)serviceConnection;
- (_KSTextReplacementServerConnection)init;
- (id)textReplacementEntries;
- (void)addEntries:(id)a3 removeEntries:(id)a4 withReply:(id)a5;
- (void)cancelPendingUpdatesWithReply:(id)a3;
- (void)dealloc;
- (void)queryTextReplacementEntriesWithReply:(id)a3;
- (void)queryTextReplacementsWithPredicate:(id)a3 reply:(id)a4;
- (void)removeAllEntries;
- (void)requestSyncWithReply:(id)a3;
@end

@implementation _KSTextReplacementServerConnection

- (_KSTextReplacementServerConnection)init
{
  v9.receiver = self;
  v9.super_class = (Class)_KSTextReplacementServerConnection;
  v2 = [(_KSTextReplacementServerConnection *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F08D68]);
    v4 = +[_KSUtilities machServiceNameTextReplacement];
    uint64_t v5 = [v3 initWithMachServiceName:v4 options:4096];
    serviceConnection = v2->_serviceConnection;
    v2->_serviceConnection = (NSXPCConnection *)v5;

    v7 = _KSTextReplacementServerInterface();
    [(NSXPCConnection *)v2->_serviceConnection setRemoteObjectInterface:v7];

    [(NSXPCConnection *)v2->_serviceConnection resume];
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_serviceConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_KSTextReplacementServerConnection;
  [(_KSTextReplacementServerConnection *)&v3 dealloc];
}

+ (id)serviceConnection
{
  v2 = objc_alloc_init(_KSTextReplacementServerConnection);
  return v2;
}

- (void)addEntries:(id)a3 removeEntries:(id)a4 withReply:(id)a5
{
  id v8 = a5;
  serviceConnection = self->_serviceConnection;
  id v10 = a4;
  id v11 = a3;
  v12 = [(NSXPCConnection *)serviceConnection remoteObjectProxy];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __73___KSTextReplacementServerConnection_addEntries_removeEntries_withReply___block_invoke;
  v14[3] = &unk_264891358;
  id v15 = v8;
  id v13 = v8;
  [v12 addEntries:v11 removeEntries:v10 withReply:v14];
}

- (void)removeAllEntries
{
  id v2 = [(NSXPCConnection *)self->_serviceConnection remoteObjectProxy];
  [v2 removeAllEntries];
}

- (void)requestSyncWithReply:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSXPCConnection *)self->_serviceConnection remoteObjectProxy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59___KSTextReplacementServerConnection_requestSyncWithReply___block_invoke;
  v7[3] = &unk_264891380;
  id v8 = v4;
  id v6 = v4;
  [v5 requestSyncWithReply:v7];
}

- (void)cancelPendingUpdatesWithReply:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSXPCConnection *)self->_serviceConnection remoteObjectProxy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68___KSTextReplacementServerConnection_cancelPendingUpdatesWithReply___block_invoke;
  v7[3] = &unk_264891358;
  id v8 = v4;
  id v6 = v4;
  [v5 cancelPendingUpdatesWithReply:v7];
}

- (void)queryTextReplacementEntriesWithReply:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSXPCConnection *)self->_serviceConnection remoteObjectProxy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75___KSTextReplacementServerConnection_queryTextReplacementEntriesWithReply___block_invoke;
  v7[3] = &unk_2648913F0;
  id v8 = v4;
  id v6 = v4;
  [v5 queryTextReplacementEntriesWithReply:v7];
}

- (void)queryTextReplacementsWithPredicate:(id)a3 reply:(id)a4
{
  id v6 = a4;
  serviceConnection = self->_serviceConnection;
  id v8 = a3;
  objc_super v9 = [(NSXPCConnection *)serviceConnection remoteObjectProxy];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __79___KSTextReplacementServerConnection_queryTextReplacementsWithPredicate_reply___block_invoke;
  v11[3] = &unk_2648913F0;
  id v12 = v6;
  id v10 = v6;
  [v9 queryTextReplacementsWithPredicate:v8 reply:v11];
}

- (id)textReplacementEntries
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  id v18 = [MEMORY[0x263EFF980] array];
  serviceConnection = self->_serviceConnection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60___KSTextReplacementServerConnection_textReplacementEntries__block_invoke;
  v12[3] = &unk_2648916D0;
  v12[4] = &v19;
  id v4 = [(NSXPCConnection *)serviceConnection synchronousRemoteObjectProxyWithErrorHandler:v12];
  uint64_t v8 = 0;
  objc_super v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  while (*((unsigned char *)v9 + 24) && !v20[5])
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60___KSTextReplacementServerConnection_textReplacementEntries__block_invoke_2;
    v7[3] = &unk_2648916F8;
    void v7[4] = &v13;
    v7[5] = &v8;
    [v4 queryTextReplacementEntriesWithReply:v7];
  }
  id v5 = (id)v14[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v5;
}

- (void).cxx_destruct
{
}

@end