@interface OTATaskingAgentClient
+ (id)sharedClient;
- (BOOL)deletePreference:(id)a3 forUser:(id)a4 inDomain:(id)a5;
- (BOOL)setPreference:(id)a3 forUser:(id)a4 inDomain:(id)a5 toValue:(void *)a6;
- (OTATaskingAgentClient)init;
- (id)awdKey;
- (id)crashreporterKey;
- (unsigned)uidForUser:(id)a3;
@end

@implementation OTATaskingAgentClient

+ (id)sharedClient
{
  if (sharedClient_onceToken != -1) {
    dispatch_once(&sharedClient_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedClient__sharedInstance;

  return v2;
}

uint64_t __37__OTATaskingAgentClient_sharedClient__block_invoke()
{
  sharedClient__sharedInstance = objc_alloc_init(OTATaskingAgentClient);

  return MEMORY[0x1F41817F8]();
}

- (OTATaskingAgentClient)init
{
  v9.receiver = self;
  v9.super_class = (Class)OTATaskingAgentClient;
  v2 = [(OTATaskingAgentClient *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.OTATaskingAgent" options:4096];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F062CC08];
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v5];

    [(NSXPCConnection *)v2->_connection resume];
    uint64_t v6 = [(NSXPCConnection *)v2->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_57];
    synchRemoteObjectProxy = v2->_synchRemoteObjectProxy;
    v2->_synchRemoteObjectProxy = (OTATaskingAgent *)v6;
  }
  return v2;
}

void __29__OTATaskingAgentClient_init__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412290;
    uint64_t v4 = a2;
    _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Connection error to OTATaskingAgent. Error: %@", (uint8_t *)&v3, 0xCu);
  }
}

- (BOOL)setPreference:(id)a3 forUser:(id)a4 inDomain:(id)a5 toValue:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v13 = [(OTATaskingAgentClient *)self uidForUser:v11];
  if (v13)
  {
    synchRemoteObjectProxy = self->_synchRemoteObjectProxy;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __64__OTATaskingAgentClient_setPreference_forUser_inDomain_toValue___block_invoke;
    v17[3] = &unk_1E5F05610;
    v17[4] = &v18;
    [(OTATaskingAgent *)synchRemoteObjectProxy setPreferenceForDomain:v12 preference:v10 value:a6 UID:v13 withReply:v17];
  }
  char v15 = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return v15;
}

uint64_t __64__OTATaskingAgentClient_setPreference_forUser_inDomain_toValue___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)deletePreference:(id)a3 forUser:(id)a4 inDomain:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v11 = [(OTATaskingAgentClient *)self uidForUser:v9];
  if (v11)
  {
    synchRemoteObjectProxy = self->_synchRemoteObjectProxy;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __59__OTATaskingAgentClient_deletePreference_forUser_inDomain___block_invoke;
    v15[3] = &unk_1E5F05610;
    v15[4] = &v16;
    [(OTATaskingAgent *)synchRemoteObjectProxy deletePreferenceForDomain:v10 preference:v8 UID:v11 withReply:v15];
  }
  char v13 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return v13;
}

uint64_t __59__OTATaskingAgentClient_deletePreference_forUser_inDomain___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)crashreporterKey
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__0;
  id v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  synchRemoteObjectProxy = self->_synchRemoteObjectProxy;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__OTATaskingAgentClient_crashreporterKey__block_invoke;
  v7[3] = &unk_1E5F05638;
  v7[4] = &v8;
  [(OTATaskingAgent *)synchRemoteObjectProxy crashreporterKeyWithReply:v7];
  if ([(id)v9[5] isEqualToString:@"<no_entitlement>"])
  {
    int v3 = (void *)v9[5];
    v9[5] = 0;

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Error while retrieving crashreporterKey. Does this process have the entitlement - com.apple.osanalytics.otatasking-service-access ?", v6, 2u);
    }
    if (crashreporterKey_onceToken != -1) {
      dispatch_once(&crashreporterKey_onceToken, &__block_literal_global_65);
    }
  }
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __41__OTATaskingAgentClient_crashreporterKey__block_invoke(uint64_t a1, void *a2)
{
}

void __41__OTATaskingAgentClient_crashreporterKey__block_invoke_63()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
    __41__OTATaskingAgentClient_crashreporterKey__block_invoke_63_cold_1();
  }
}

- (id)awdKey
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__0;
  id v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  synchRemoteObjectProxy = self->_synchRemoteObjectProxy;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__OTATaskingAgentClient_awdKey__block_invoke;
  v7[3] = &unk_1E5F05638;
  v7[4] = &v8;
  [(OTATaskingAgent *)synchRemoteObjectProxy awdKeyWithReply:v7];
  if ([(id)v9[5] isEqualToString:@"<no_entitlement>"])
  {
    int v3 = (void *)v9[5];
    v9[5] = 0;

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Error while retrieving awdKey. Does this process have the entitlement - com.apple.osanalytics.otatasking-service-access ?", v6, 2u);
    }
    if (awdKey_onceToken != -1) {
      dispatch_once(&awdKey_onceToken, &__block_literal_global_68);
    }
  }
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __31__OTATaskingAgentClient_awdKey__block_invoke(uint64_t a1, void *a2)
{
}

void __31__OTATaskingAgentClient_awdKey__block_invoke_66()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
    __41__OTATaskingAgentClient_crashreporterKey__block_invoke_63_cold_1();
  }
}

- (unsigned)uidForUser:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = getpwnam((const char *)[v3 UTF8String]);
  if (v4)
  {
    unsigned int pw_uid = v4->pw_uid;
    if (!pw_uid && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      uint64_t v6 = MEMORY[0x1E4F14500];
      v7 = "Modifying defaults as root is not allowed, skipping request";
      uint32_t v8 = 2;
LABEL_7:
      _os_log_impl(&dword_1AE71D000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v8);
      unsigned int pw_uid = 0;
    }
  }
  else
  {
    unsigned int pw_uid = 0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v3;
      uint64_t v6 = MEMORY[0x1E4F14500];
      v7 = "Unknown user '%@', skipping request";
      uint32_t v8 = 12;
      goto LABEL_7;
    }
  }

  return pw_uid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchRemoteObjectProxy, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __41__OTATaskingAgentClient_crashreporterKey__block_invoke_63_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Querying crashreporterKey/awdKey now requires the entitlement - com.apple.osanalytics.otatasking-service-access. Please add that to your process.", v0, 2u);
}

@end