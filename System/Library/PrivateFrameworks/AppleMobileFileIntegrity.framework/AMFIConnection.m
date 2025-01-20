@interface AMFIConnection
+ (id)newConnection;
- ($E0E7E7FD564019D5BF0FF602771CD47C)getSEPStateWithError:(SEL)a3;
- (AMFIConnection)init;
- (id)commitProfileForUuid:(id)a3;
- (id)getStagedProfileWithError:(id *)a3;
- (id)initiateDataMigration;
- (id)initiateDeveloperModeDaemons;
- (id)removeManagedState;
- (id)removeTrustforUuid:(id)a3;
- (id)setDemoState:(unsigned int)a3;
- (id)setManagedState:(id)a3;
- (id)setSupervisedState:(unsigned int)a3;
- (id)setTrustForUuid:(id)a3 withSignature:(id)a4 withSignType:(unsigned int)a5;
- (id)signTeamID:(id)a3 withSignType:(unsigned int)a4 withLAContext:(id)a5 withError:(id *)a6;
- (id)stageProfileForUuid:(id)a3;
- (void)dealloc;
@end

@implementation AMFIConnection

- (AMFIConnection)init
{
  v7.receiver = self;
  v7.super_class = (Class)AMFIConnection;
  v2 = [(AMFIConnection *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.amfi.nsxpc" options:4096];
    connection = v2->connection;
    v2->connection = (NSXPCConnection *)v3;

    v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C24A440];
    [(NSXPCConnection *)v2->connection setRemoteObjectInterface:v5];

    [(NSXPCConnection *)v2->connection resume];
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->connection invalidate];
  connection = self->connection;
  self->connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)AMFIConnection;
  [(AMFIConnection *)&v4 dealloc];
}

+ (id)newConnection
{
  return (id)MEMORY[0x270F9A540](AMFIConnection, a2);
}

- (id)initiateDataMigration
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  connection = self->connection;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__AMFIConnection_initiateDataMigration__block_invoke;
  v7[3] = &unk_2641281E0;
  v7[4] = &v8;
  uint64_t v3 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__AMFIConnection_initiateDataMigration__block_invoke_32;
  v6[3] = &unk_2641281E0;
  v6[4] = &v8;
  [v3 initiateDataMigrationWithReply:v6];

  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __39__AMFIConnection_initiateDataMigration__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[AMFIFMKLog generic];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __39__AMFIConnection_initiateDataMigration__block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __39__AMFIConnection_initiateDataMigration__block_invoke_32(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __39__AMFIConnection_initiateDataMigration__block_invoke_32_cold_1();
    }
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (id)initiateDeveloperModeDaemons
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  connection = self->connection;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__AMFIConnection_initiateDeveloperModeDaemons__block_invoke;
  v7[3] = &unk_2641281E0;
  v7[4] = &v8;
  id v3 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__AMFIConnection_initiateDeveloperModeDaemons__block_invoke_33;
  v6[3] = &unk_2641281E0;
  v6[4] = &v8;
  [v3 initiateDeveloperModeDaemonsWithReply:v6];

  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __46__AMFIConnection_initiateDeveloperModeDaemons__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[AMFIFMKLog generic];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__AMFIConnection_initiateDeveloperModeDaemons__block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __46__AMFIConnection_initiateDeveloperModeDaemons__block_invoke_33(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = +[AMFIFMKLog generic];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __46__AMFIConnection_initiateDeveloperModeDaemons__block_invoke_33_cold_1();
    }
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- ($E0E7E7FD564019D5BF0FF602771CD47C)getSEPStateWithError:(SEL)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x5810000000;
  v22 = &unk_20DBFAB13;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  char v26 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  connection = self->connection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __39__AMFIConnection_getSEPStateWithError___block_invoke;
  v12[3] = &unk_2641281E0;
  v12[4] = &v13;
  objc_super v7 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __39__AMFIConnection_getSEPStateWithError___block_invoke_35;
  v11[3] = &unk_264128208;
  v11[4] = &v19;
  v11[5] = &v13;
  [v7 getSEPStateWithReply:v11];

  if (a4) {
    *a4 = (id) v14[5];
  }
  uint64_t v8 = v20;
  long long v9 = *((_OWORD *)v20 + 3);
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v20 + 2);
  *(_OWORD *)&retstr->var3.var1.var0 = v9;
  *(_OWORD *)&retstr->var3.var1.var1[12] = *((_OWORD *)v8 + 4);
  retstr->var3.var1.var1[28] = *((unsigned char *)v8 + 80);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return result;
}

void __39__AMFIConnection_getSEPStateWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[AMFIFMKLog generic];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __39__AMFIConnection_getSEPStateWithError___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

__n128 __39__AMFIConnection_getSEPStateWithError___block_invoke_35(uint64_t a1, long long *a2, id obj)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v4 = *a2;
  long long v5 = a2[1];
  long long v6 = a2[2];
  *(unsigned char *)(v3 + 80) = *((unsigned char *)a2 + 48);
  *(_OWORD *)(v3 + 48) = v5;
  *(_OWORD *)(v3 + 64) = v6;
  *(_OWORD *)(v3 + 32) = v4;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  return result;
}

- (id)signTeamID:(id)a3 withSignType:(unsigned int)a4 withLAContext:(id)a5 withError:(id *)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  connection = self->connection;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __66__AMFIConnection_signTeamID_withSignType_withLAContext_withError___block_invoke;
  v17[3] = &unk_2641281E0;
  v17[4] = &v24;
  uint64_t v13 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __66__AMFIConnection_signTeamID_withSignType_withLAContext_withError___block_invoke_37;
  v16[3] = &unk_264128230;
  v16[4] = &v18;
  v16[5] = &v24;
  [v13 signTeamID:v10 withSignType:v8 withLAContext:v11 withReply:v16];

  if (a6) {
    *a6 = (id) v25[5];
  }
  id v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

void __66__AMFIConnection_signTeamID_withSignType_withLAContext_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = +[AMFIFMKLog generic];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __66__AMFIConnection_signTeamID_withSignType_withLAContext_withError___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __66__AMFIConnection_signTeamID_withSignType_withLAContext_withError___block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)stageProfileForUuid:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  uint64_t v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  connection = self->connection;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__AMFIConnection_stageProfileForUuid___block_invoke;
  v10[3] = &unk_2641281E0;
  v10[4] = &v11;
  id v6 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __38__AMFIConnection_stageProfileForUuid___block_invoke_39;
  v9[3] = &unk_2641281E0;
  v9[4] = &v11;
  [v6 stageProfileForUuid:v4 withReply:v9];

  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __38__AMFIConnection_stageProfileForUuid___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[AMFIFMKLog generic];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __38__AMFIConnection_stageProfileForUuid___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __38__AMFIConnection_stageProfileForUuid___block_invoke_39(uint64_t a1, void *a2)
{
}

- (id)getStagedProfileWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy_;
  id v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  connection = self->connection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__AMFIConnection_getStagedProfileWithError___block_invoke;
  v9[3] = &unk_2641281E0;
  v9[4] = &v16;
  uint64_t v5 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__AMFIConnection_getStagedProfileWithError___block_invoke_40;
  v8[3] = &unk_264128258;
  v8[4] = &v10;
  v8[5] = &v16;
  [v5 getStagedProfileWithReply:v8];

  if (a3) {
    *a3 = (id) v17[5];
  }
  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v6;
}

void __44__AMFIConnection_getStagedProfileWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[AMFIFMKLog generic];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __44__AMFIConnection_getStagedProfileWithError___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __44__AMFIConnection_getStagedProfileWithError___block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)commitProfileForUuid:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  connection = self->connection;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __39__AMFIConnection_commitProfileForUuid___block_invoke;
  v10[3] = &unk_2641281E0;
  v10[4] = &v11;
  id v6 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__AMFIConnection_commitProfileForUuid___block_invoke_42;
  v9[3] = &unk_2641281E0;
  v9[4] = &v11;
  [v6 commitProfileForUuid:v4 withReply:v9];

  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __39__AMFIConnection_commitProfileForUuid___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[AMFIFMKLog generic];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __39__AMFIConnection_commitProfileForUuid___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __39__AMFIConnection_commitProfileForUuid___block_invoke_42(uint64_t a1, void *a2)
{
}

- (id)setTrustForUuid:(id)a3 withSignature:(id)a4 withSignType:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  connection = self->connection;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__AMFIConnection_setTrustForUuid_withSignature_withSignType___block_invoke;
  v15[3] = &unk_2641281E0;
  v15[4] = &v16;
  uint64_t v11 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __61__AMFIConnection_setTrustForUuid_withSignature_withSignType___block_invoke_43;
  v14[3] = &unk_2641281E0;
  v14[4] = &v16;
  [v11 setTrustForUuid:v8 withSignature:v9 withSignType:v5 withReply:v14];

  id v12 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v12;
}

void __61__AMFIConnection_setTrustForUuid_withSignature_withSignType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[AMFIFMKLog generic];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__AMFIConnection_setTrustForUuid_withSignature_withSignType___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __61__AMFIConnection_setTrustForUuid_withSignature_withSignType___block_invoke_43(uint64_t a1, void *a2)
{
}

- (id)removeTrustforUuid:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  connection = self->connection;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __37__AMFIConnection_removeTrustforUuid___block_invoke;
  v10[3] = &unk_2641281E0;
  v10[4] = &v11;
  id v6 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__AMFIConnection_removeTrustforUuid___block_invoke_44;
  v9[3] = &unk_2641281E0;
  v9[4] = &v11;
  [v6 removeTrustforUuid:v4 withReply:v9];

  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __37__AMFIConnection_removeTrustforUuid___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[AMFIFMKLog generic];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __37__AMFIConnection_removeTrustforUuid___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __37__AMFIConnection_removeTrustforUuid___block_invoke_44(uint64_t a1, void *a2)
{
}

- (id)setSupervisedState:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy_;
  id v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  connection = self->connection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__AMFIConnection_setSupervisedState___block_invoke;
  v9[3] = &unk_2641281E0;
  v9[4] = &v10;
  uint64_t v5 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__AMFIConnection_setSupervisedState___block_invoke_45;
  v8[3] = &unk_2641281E0;
  v8[4] = &v10;
  [v5 setSupervisedState:v3 withReply:v8];

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __37__AMFIConnection_setSupervisedState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[AMFIFMKLog generic];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __37__AMFIConnection_setSupervisedState___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __37__AMFIConnection_setSupervisedState___block_invoke_45(uint64_t a1, void *a2)
{
}

- (id)setDemoState:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy_;
  id v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  connection = self->connection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __31__AMFIConnection_setDemoState___block_invoke;
  v9[3] = &unk_2641281E0;
  v9[4] = &v10;
  uint64_t v5 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __31__AMFIConnection_setDemoState___block_invoke_46;
  v8[3] = &unk_2641281E0;
  v8[4] = &v10;
  [v5 setDemoState:v3 withReply:v8];

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __31__AMFIConnection_setDemoState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[AMFIFMKLog generic];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __31__AMFIConnection_setDemoState___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __31__AMFIConnection_setDemoState___block_invoke_46(uint64_t a1, void *a2)
{
}

- (id)setManagedState:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  connection = self->connection;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __34__AMFIConnection_setManagedState___block_invoke;
  v10[3] = &unk_2641281E0;
  v10[4] = &v11;
  id v6 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __34__AMFIConnection_setManagedState___block_invoke_47;
  v9[3] = &unk_2641281E0;
  v9[4] = &v11;
  [v6 setManagedState:v4 withReply:v9];

  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __34__AMFIConnection_setManagedState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[AMFIFMKLog generic];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __34__AMFIConnection_setManagedState___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __34__AMFIConnection_setManagedState___block_invoke_47(uint64_t a1, void *a2)
{
}

- (id)removeManagedState
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  connection = self->connection;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__AMFIConnection_removeManagedState__block_invoke;
  v7[3] = &unk_2641281E0;
  v7[4] = &v8;
  id v3 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__AMFIConnection_removeManagedState__block_invoke_48;
  v6[3] = &unk_2641281E0;
  v6[4] = &v8;
  [v3 removeManagedStateWithReply:v6];

  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __36__AMFIConnection_removeManagedState__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[AMFIFMKLog generic];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __36__AMFIConnection_removeManagedState__block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __36__AMFIConnection_removeManagedState__block_invoke_48(uint64_t a1, void *a2)
{
}

- (void).cxx_destruct
{
}

void __39__AMFIConnection_initiateDataMigration__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] xpc error: %@", v2, v3, v4, v5, 2u);
}

void __39__AMFIConnection_initiateDataMigration__block_invoke_32_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] data migration error: %@", v2, v3, v4, v5, 2u);
}

void __46__AMFIConnection_initiateDeveloperModeDaemons__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] xpc error: %@", v2, v3, v4, v5, 2u);
}

void __46__AMFIConnection_initiateDeveloperModeDaemons__block_invoke_33_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] developer mode daemons error: %@", v2, v3, v4, v5, 2u);
}

void __39__AMFIConnection_getSEPStateWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] xpc error: %@", v2, v3, v4, v5, 2u);
}

void __66__AMFIConnection_signTeamID_withSignType_withLAContext_withError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] xpc error: %@", v2, v3, v4, v5, 2u);
}

void __38__AMFIConnection_stageProfileForUuid___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] xpc error: %@", v2, v3, v4, v5, 2u);
}

void __44__AMFIConnection_getStagedProfileWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] xpc error: %@", v2, v3, v4, v5, 2u);
}

void __39__AMFIConnection_commitProfileForUuid___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] xpc error: %@", v2, v3, v4, v5, 2u);
}

void __61__AMFIConnection_setTrustForUuid_withSignature_withSignType___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] xpc error: %@", v2, v3, v4, v5, 2u);
}

void __37__AMFIConnection_removeTrustforUuid___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] xpc error: %@", v2, v3, v4, v5, 2u);
}

void __37__AMFIConnection_setSupervisedState___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] xpc error: %@", v2, v3, v4, v5, 2u);
}

void __31__AMFIConnection_setDemoState___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] xpc error: %@", v2, v3, v4, v5, 2u);
}

void __34__AMFIConnection_setManagedState___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] xpc error: %@", v2, v3, v4, v5, 2u);
}

void __36__AMFIConnection_removeManagedState__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20DBEC000, v0, v1, "[%s] xpc error: %@", v2, v3, v4, v5, 2u);
}

@end