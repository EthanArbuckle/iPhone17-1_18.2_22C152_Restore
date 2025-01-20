@interface FAUpdateFamilyMemberFlagRequest
- (FAUpdateFamilyMemberFlagRequest)initWithFamilyMemberDSID:(id)a3 ephemeralAuthResults:(id)a4 flag:(id)a5 enabled:(BOOL)a6;
- (FAUpdateFamilyMemberFlagRequest)initWithFamilyMemberDSID:(id)a3 flag:(id)a4 enabled:(BOOL)a5;
- (NSDictionary)ephemeralAuthResults;
- (void)setEphemeralAuthResults:(id)a3;
- (void)startRequestWithCompletionHandler:(id)a3;
@end

@implementation FAUpdateFamilyMemberFlagRequest

- (FAUpdateFamilyMemberFlagRequest)initWithFamilyMemberDSID:(id)a3 flag:(id)a4 enabled:(BOOL)a5
{
  return [(FAUpdateFamilyMemberFlagRequest *)self initWithFamilyMemberDSID:a3 ephemeralAuthResults:0 flag:a4 enabled:a5];
}

- (FAUpdateFamilyMemberFlagRequest)initWithFamilyMemberDSID:(id)a3 ephemeralAuthResults:(id)a4 flag:(id)a5 enabled:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FAUpdateFamilyMemberFlagRequest;
  v14 = [(FAFamilyCircleRequest *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_dsid, a3);
    objc_storeStrong((id *)&v15->_ephemeralAuthResults, a4);
    objc_storeStrong((id *)&v15->_flag, a5);
    v15->_enabled = a6;
  }

  return v15;
}

- (void)startRequestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__FAUpdateFamilyMemberFlagRequest_startRequestWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E6924B90;
  id v5 = v4;
  id v16 = v5;
  v6 = [(FAFamilyCircleRequest *)self serviceRemoteObjectWithErrorHandler:v15];
  v7 = _FALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[FAUpdateFamilyMemberFlagRequest startRequestWithCompletionHandler:](self, v7);
  }

  dsid = self->_dsid;
  v9 = [(FAUpdateFamilyMemberFlagRequest *)self ephemeralAuthResults];
  flag = self->_flag;
  BOOL enabled = self->_enabled;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__FAUpdateFamilyMemberFlagRequest_startRequestWithCompletionHandler___block_invoke_20;
  v13[3] = &unk_1E6924E58;
  v13[4] = self;
  id v14 = v5;
  id v12 = v5;
  [v6 updateFamilyMemberFlagWithDSID:dsid ephemeralAuthResults:v9 flag:flag enabled:enabled replyBlock:v13];
}

void __69__FAUpdateFamilyMemberFlagRequest_startRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1D252C000, v4, OS_LOG_TYPE_DEFAULT, "FARegisterPushTokenRequest: Error from service - %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __69__FAUpdateFamilyMemberFlagRequest_startRequestWithCompletionHandler___block_invoke_20(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _FALogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __69__FAUpdateFamilyMemberFlagRequest_startRequestWithCompletionHandler___block_invoke_20_cold_2(a1, (uint64_t)v3, v4);
    }
  }
  else if (v5)
  {
    __69__FAUpdateFamilyMemberFlagRequest_startRequestWithCompletionHandler___block_invoke_20_cold_1(v4);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

- (NSDictionary)ephemeralAuthResults
{
  return self->_ephemeralAuthResults;
}

- (void)setEphemeralAuthResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ephemeralAuthResults, 0);
  objc_storeStrong((id *)&self->_flag, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

- (void)startRequestWithCompletionHandler:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = NSNumber;
  BOOL v5 = [a1 ephemeralAuthResults];
  uint64_t v6 = [v4 numberWithInt:v5 != 0];
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_1D252C000, a2, OS_LOG_TYPE_DEBUG, "Starting family update member flag request: %@, ephemeralAuth: (%@)", (uint8_t *)&v7, 0x16u);
}

void __69__FAUpdateFamilyMemberFlagRequest_startRequestWithCompletionHandler___block_invoke_20_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[FAUpdateFamilyMemberFlagRequest startRequestWithCompletionHandler:]_block_invoke";
  _os_log_debug_impl(&dword_1D252C000, log, OS_LOG_TYPE_DEBUG, "%s Family update member flag completed.", (uint8_t *)&v1, 0xCu);
}

void __69__FAUpdateFamilyMemberFlagRequest_startRequestWithCompletionHandler___block_invoke_20_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 40);
  int v4 = 136315650;
  BOOL v5 = "-[FAUpdateFamilyMemberFlagRequest startRequestWithCompletionHandler:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1D252C000, log, OS_LOG_TYPE_DEBUG, "%s Error updating Family member flag %@ completed %@", (uint8_t *)&v4, 0x20u);
}

@end