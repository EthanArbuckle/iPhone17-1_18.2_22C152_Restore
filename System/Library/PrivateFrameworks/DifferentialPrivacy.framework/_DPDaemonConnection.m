@interface _DPDaemonConnection
+ (id)daemonConnection;
- (NSXPCConnection)daemonConnection;
- (_DPDaemonConnection)init;
- (void)dealloc;
- (void)recordBitValues:(id)a3 forKey:(id)a4 withReply:(id)a5;
- (void)recordBitValues:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6;
- (void)recordBitVectors:(id)a3 forKey:(id)a4 withReply:(id)a5;
- (void)recordBitVectors:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6;
- (void)recordFloatVectors:(id)a3 forKey:(id)a4 withReply:(id)a5;
- (void)recordFloatVectors:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6;
- (void)recordNumbers:(id)a3 forKey:(id)a4 withReply:(id)a5;
- (void)recordNumbers:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6;
- (void)recordNumbersVectors:(id)a3 forKey:(id)a4 withReply:(id)a5;
- (void)recordNumbersVectors:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6;
- (void)recordStrings:(id)a3 forKey:(id)a4 withReply:(id)a5;
- (void)recordStrings:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6;
- (void)recordWords:(id)a3 forKey:(id)a4 withReply:(id)a5;
- (void)reportsNotYetSubmittedWithReply:(id)a3;
- (void)retireReports:(id)a3 withReply:(id)a4;
@end

@implementation _DPDaemonConnection

- (_DPDaemonConnection)init
{
  v9.receiver = self;
  v9.super_class = (Class)_DPDaemonConnection;
  v2 = [(_DPDaemonConnection *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29268]);
    v4 = +[_DPStrings machServiceName];
    uint64_t v5 = [v3 initWithMachServiceName:v4 options:4096];
    daemonConnection = v2->_daemonConnection;
    v2->_daemonConnection = (NSXPCConnection *)v5;

    v7 = _DPDaemonInterface();
    [(NSXPCConnection *)v2->_daemonConnection setRemoteObjectInterface:v7];

    [(NSXPCConnection *)v2->_daemonConnection resume];
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_daemonConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_DPDaemonConnection;
  [(_DPDaemonConnection *)&v3 dealloc];
}

+ (id)daemonConnection
{
  v2 = objc_opt_new();
  return v2;
}

- (void)recordNumbers:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v8 = a5;
  daemonConnection = self->_daemonConnection;
  id v10 = a4;
  id v11 = a3;
  v12 = [(NSXPCConnection *)daemonConnection remoteObjectProxy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54___DPDaemonConnection_recordNumbers_forKey_withReply___block_invoke;
  v14[3] = &unk_1E6C43C08;
  id v15 = v8;
  id v13 = v8;
  [v12 recordNumbers:v11 forKey:v10 withReply:v14];
}

- (void)recordNumbers:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6
{
  id v10 = a6;
  daemonConnection = self->_daemonConnection;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(NSXPCConnection *)daemonConnection remoteObjectProxy];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63___DPDaemonConnection_recordNumbers_metadata_forKey_withReply___block_invoke;
  v17[3] = &unk_1E6C43C08;
  id v18 = v10;
  id v16 = v10;
  [v15 recordNumbers:v14 metadata:v13 forKey:v12 withReply:v17];
}

- (void)recordNumbersVectors:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v8 = a5;
  daemonConnection = self->_daemonConnection;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(NSXPCConnection *)daemonConnection remoteObjectProxy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61___DPDaemonConnection_recordNumbersVectors_forKey_withReply___block_invoke;
  v14[3] = &unk_1E6C43C08;
  id v15 = v8;
  id v13 = v8;
  [v12 recordNumbersVectors:v11 forKey:v10 withReply:v14];
}

- (void)recordNumbersVectors:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6
{
  id v10 = a6;
  daemonConnection = self->_daemonConnection;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(NSXPCConnection *)daemonConnection remoteObjectProxy];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70___DPDaemonConnection_recordNumbersVectors_metadata_forKey_withReply___block_invoke;
  v17[3] = &unk_1E6C43C08;
  id v18 = v10;
  id v16 = v10;
  [v15 recordNumbersVectors:v14 metadata:v13 forKey:v12 withReply:v17];
}

- (void)recordBitValues:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v8 = a5;
  daemonConnection = self->_daemonConnection;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(NSXPCConnection *)daemonConnection remoteObjectProxy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56___DPDaemonConnection_recordBitValues_forKey_withReply___block_invoke;
  v14[3] = &unk_1E6C43C08;
  id v15 = v8;
  id v13 = v8;
  [v12 recordBitValues:v11 forKey:v10 withReply:v14];
}

- (void)recordBitValues:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6
{
  id v10 = a6;
  daemonConnection = self->_daemonConnection;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(NSXPCConnection *)daemonConnection remoteObjectProxy];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65___DPDaemonConnection_recordBitValues_metadata_forKey_withReply___block_invoke;
  v17[3] = &unk_1E6C43C08;
  id v18 = v10;
  id v16 = v10;
  [v15 recordBitValues:v14 metadata:v13 forKey:v12 withReply:v17];
}

- (void)recordBitVectors:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v8 = a5;
  daemonConnection = self->_daemonConnection;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(NSXPCConnection *)daemonConnection remoteObjectProxy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57___DPDaemonConnection_recordBitVectors_forKey_withReply___block_invoke;
  v14[3] = &unk_1E6C43C08;
  id v15 = v8;
  id v13 = v8;
  [v12 recordBitVectors:v11 forKey:v10 withReply:v14];
}

- (void)recordBitVectors:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[_DPLog framework];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v10;
    _os_log_impl(&dword_1DC55E000, v14, OS_LOG_TYPE_DEFAULT, "Begin: recordBitVectors:metadata: for key %@", buf, 0xCu);
  }

  id v15 = [(NSXPCConnection *)self->_daemonConnection remoteObjectProxy];
  id v16 = (void *)os_transaction_create();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __66___DPDaemonConnection_recordBitVectors_metadata_forKey_withReply___block_invoke;
  v20[3] = &unk_1E6C43C30;
  id v22 = v16;
  id v23 = v11;
  id v21 = v10;
  id v17 = v16;
  id v18 = v10;
  id v19 = v11;
  [v15 recordBitVectors:v13 metadata:v12 forKey:v18 withReply:v20];
}

- (void)recordFloatVectors:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v8 = a5;
  daemonConnection = self->_daemonConnection;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(NSXPCConnection *)daemonConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59___DPDaemonConnection_recordFloatVectors_forKey_withReply___block_invoke_2;
  v14[3] = &unk_1E6C43C08;
  id v15 = v8;
  id v13 = v8;
  [v12 recordFloatVectors:v11 forKey:v10 withReply:v14];
}

- (void)recordFloatVectors:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6
{
  id v10 = a6;
  daemonConnection = self->_daemonConnection;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(NSXPCConnection *)daemonConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_8];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68___DPDaemonConnection_recordFloatVectors_metadata_forKey_withReply___block_invoke_2;
  v17[3] = &unk_1E6C43C08;
  id v18 = v10;
  id v16 = v10;
  [v15 recordFloatVectors:v14 metadata:v13 forKey:v12 withReply:v17];
}

- (void)recordStrings:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v8 = a5;
  daemonConnection = self->_daemonConnection;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(NSXPCConnection *)daemonConnection remoteObjectProxy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54___DPDaemonConnection_recordStrings_forKey_withReply___block_invoke;
  v14[3] = &unk_1E6C43C08;
  id v15 = v8;
  id v13 = v8;
  [v12 recordStrings:v11 forKey:v10 withReply:v14];
}

- (void)recordStrings:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6
{
  id v10 = a6;
  daemonConnection = self->_daemonConnection;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(NSXPCConnection *)daemonConnection remoteObjectProxy];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63___DPDaemonConnection_recordStrings_metadata_forKey_withReply___block_invoke;
  v17[3] = &unk_1E6C43C08;
  id v18 = v10;
  id v16 = v10;
  [v15 recordStrings:v14 metadata:v13 forKey:v12 withReply:v17];
}

- (void)recordWords:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v8 = a5;
  daemonConnection = self->_daemonConnection;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(NSXPCConnection *)daemonConnection remoteObjectProxy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52___DPDaemonConnection_recordWords_forKey_withReply___block_invoke;
  v14[3] = &unk_1E6C43C08;
  id v15 = v8;
  id v13 = v8;
  [v12 recordWords:v11 forKey:v10 withReply:v14];
}

- (void)reportsNotYetSubmittedWithReply:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSXPCConnection *)self->_daemonConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_10];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55___DPDaemonConnection_reportsNotYetSubmittedWithReply___block_invoke_2;
  v7[3] = &unk_1E6C43C78;
  id v8 = v4;
  id v6 = v4;
  [v5 reportsNotYetSubmittedWithReply:v7];
}

- (void)retireReports:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  daemonConnection = self->_daemonConnection;
  id v8 = a3;
  objc_super v9 = [(NSXPCConnection *)daemonConnection remoteObjectProxy];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47___DPDaemonConnection_retireReports_withReply___block_invoke;
  v11[3] = &unk_1E6C43C08;
  id v12 = v6;
  id v10 = v6;
  [v9 retireReports:v8 withReply:v11];
}

- (NSXPCConnection)daemonConnection
{
  return self->_daemonConnection;
}

- (void).cxx_destruct
{
}

@end