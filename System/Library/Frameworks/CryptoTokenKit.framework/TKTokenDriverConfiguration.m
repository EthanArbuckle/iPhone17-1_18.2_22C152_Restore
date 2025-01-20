@interface TKTokenDriverConfiguration
+ (NSDictionary)driverConfigurations;
+ (id)_connectionWithClient:(id)a3;
+ (id)_driverConfigurationsWithConnection:(id)a3;
+ (id)driverConfigurationsWithClient:(id)a3;
- (NSDictionary)tokenConfigurations;
- (TKTokenConfiguration)addTokenConfigurationForTokenInstanceID:(TKTokenInstanceID)instanceID;
- (TKTokenDriverClassID)classID;
- (TKTokenDriverConfiguration)initWithClassID:(id)a3 configurationConnection:(id)a4;
- (id)beginTransaction;
- (id)createTokenConfigurationWithInstanceID:(id)a3 persistent:(BOOL)a4;
- (void)removeTokenConfigurationForTokenInstanceID:(TKTokenInstanceID)instanceID;
@end

@implementation TKTokenDriverConfiguration

+ (id)driverConfigurationsWithClient:(id)a3
{
  v3 = +[TKTokenDriverConfiguration _connectionWithClient:a3];
  v4 = +[TKTokenDriverConfiguration _driverConfigurationsWithConnection:v3];

  return v4;
}

+ (NSDictionary)driverConfigurations
{
  if (driverConfigurations_onceToken != -1) {
    dispatch_once(&driverConfigurations_onceToken, &__block_literal_global_191);
  }
  uint64_t v3 = driverConfigurations_connection;

  return (NSDictionary *)[a1 _driverConfigurationsWithConnection:v3];
}

uint64_t __50__TKTokenDriverConfiguration_driverConfigurations__block_invoke()
{
  driverConfigurations_connection = +[TKTokenDriverConfiguration _connectionWithClient:0];

  return MEMORY[0x1F41817F8]();
}

+ (id)_connectionWithClient:(id)a3
{
  uint64_t v3 = (TKClientToken *)a3;
  if (!v3) {
    uint64_t v3 = [[TKClientToken alloc] initWithTokenID:&stru_1F19EDBB0];
  }
  v4 = [(TKClientToken *)v3 configurationEndpoint];
  if (v4) {
    v5 = [[TKTokenConfigurationConnection alloc] initWithEndpoint:v4];
  }
  else {
    v5 = 0;
  }

  return v5;
}

+ (id)_driverConfigurationsWithConnection:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__2;
    v18 = __Block_byref_object_dispose__2;
    id v19 = (id)[MEMORY[0x1E4F1CC08] mutableCopy];
    v4 = [v3 configurationProtocol];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    v10 = __66__TKTokenDriverConfiguration__driverConfigurationsWithConnection___block_invoke;
    v11 = &unk_1E63C8668;
    id v12 = v3;
    v13 = &v14;
    [v4 getClassIDsWithReply:&v8];

    v5 = objc_msgSend((id)v15[5], "copy", v8, v9, v10, v11);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v6 = TK_LOG_tokencfg();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[TKTokenDriverConfiguration _driverConfigurationsWithConnection:](v6);
    }

    v5 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v5;
}

void __66__TKTokenDriverConfiguration__driverConfigurationsWithConnection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        uint64_t v9 = [[TKTokenDriverConfiguration alloc] initWithClassID:v8 configurationConnection:*(void *)(a1 + 32)];
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v9 forKeyedSubscript:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (TKTokenDriverConfiguration)initWithClassID:(id)a3 configurationConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TKTokenDriverConfiguration;
  uint64_t v9 = [(TKTokenDriverConfiguration *)&v12 init];
  long long v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_classID, a3);
    objc_storeStrong((id *)&v10->_configurationConnection, a4);
  }

  return v10;
}

- (NSDictionary)tokenConfigurations
{
  id v3 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  uint64_t v4 = [(TKTokenConfigurationConnection *)self->_configurationConnection configurationProtocol];
  uint64_t v5 = [(TKTokenDriverConfiguration *)self classID];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  long long v11 = __49__TKTokenDriverConfiguration_tokenConfigurations__block_invoke;
  objc_super v12 = &unk_1E63C8690;
  long long v13 = self;
  id v14 = v3;
  id v6 = v3;
  [v4 getTokenIDsForClassID:v5 reply:&v9];

  id v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);

  return (NSDictionary *)v7;
}

void __49__TKTokenDriverConfiguration_tokenConfigurations__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        uint64_t v9 = [[TKTokenConfiguration alloc] initWithTokenID:v8 configurationConnection:*(void *)(*(void *)(a1 + 32) + 8)];
        uint64_t v10 = *(void **)(a1 + 40);
        long long v11 = [v8 instanceID];
        [v10 setObject:v9 forKeyedSubscript:v11];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (id)beginTransaction
{
  id v3 = [(TKTokenConfigurationConnection *)self->_configurationConnection configurationProtocol];
  [v3 beginTransactionWithReply:&__block_literal_global_199];

  uint64_t v4 = [[TKTokenConfigurationTransaction alloc] initWithConfigurationConnection:self->_configurationConnection];

  return v4;
}

- (TKTokenConfiguration)addTokenConfigurationForTokenInstanceID:(TKTokenInstanceID)instanceID
{
  return (TKTokenConfiguration *)[(TKTokenDriverConfiguration *)self createTokenConfigurationWithInstanceID:instanceID persistent:1];
}

- (id)createTokenConfigurationWithInstanceID:(id)a3 persistent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  id v21 = 0;
  uint64_t v7 = [[TKTokenID alloc] initWithClassID:self->_classID instanceID:v6];
  id v8 = [(TKTokenConfigurationConnection *)self->_configurationConnection configurationProtocol];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__TKTokenDriverConfiguration_createTokenConfigurationWithInstanceID_persistent___block_invoke;
  v12[3] = &unk_1E63C8248;
  long long v15 = &v16;
  uint64_t v9 = v7;
  long long v13 = v9;
  long long v14 = self;
  [v8 createTokenID:v9 persistent:v4 reply:v12];

  id v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

uint64_t __80__TKTokenDriverConfiguration_createTokenConfigurationWithInstanceID_persistent___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [[TKTokenConfiguration alloc] initWithTokenID:a1[4] configurationConnection:*(void *)(a1[5] + 8)];

  return MEMORY[0x1F41817F8]();
}

- (void)removeTokenConfigurationForTokenInstanceID:(TKTokenInstanceID)instanceID
{
  BOOL v4 = instanceID;
  id v6 = [[TKTokenID alloc] initWithClassID:self->_classID instanceID:v4];

  uint64_t v5 = [(TKTokenConfigurationConnection *)self->_configurationConnection configurationProtocol];
  [v5 removeTokenID:v6 reply:&__block_literal_global_201];
}

- (TKTokenDriverClassID)classID
{
  return self->_classID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classID, 0);

  objc_storeStrong((id *)&self->_configurationConnection, 0);
}

+ (void)_driverConfigurationsWithConnection:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BED55000, log, OS_LOG_TYPE_ERROR, "Failed to get configurationEndpoint, returning empty configurations", v1, 2u);
}

@end