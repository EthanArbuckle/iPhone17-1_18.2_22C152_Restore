@interface _CDInteractionAdvisor
+ (id)sharedInteractionAdvisor;
- (NSError)error;
- (_CDInteractionAdvisor)initWithServiceName:(id)a3;
- (id)adviseInteractionsForDate:(id)a3 usingSettings:(id)a4;
- (id)adviseInteractionsForKeywordsInString:(id)a3 usingSettings:(id)a4;
- (id)adviseInteractionsUsingSettings:(id)a3;
- (id)adviseSocialInteractionsForDate:(id)a3 andSeedContacts:(id)a4 usingSettings:(id)a5;
- (id)rankCandidateContacts:(id)a3 usingSettings:(id)a4;
- (void)dealloc;
- (void)setError:(id)a3;
- (void)tuneSocialAdvisorUsingSettings:(id)a3 heartBeatHandler:(id)a4;
@end

@implementation _CDInteractionAdvisor

+ (id)sharedInteractionAdvisor
{
  if (sharedInteractionAdvisor_onceToken != -1) {
    dispatch_once(&sharedInteractionAdvisor_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)sharedInteractionAdvisor_advisor;
  return v2;
}

- (_CDInteractionAdvisor)initWithServiceName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CDInteractionAdvisor;
  v5 = [(_CDInteractionAdvisor *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:v4 options:4096];
    connection = v5->_connection;
    v5->_connection = (NSXPCConnection *)v6;

    v8 = _CDInteractionNSXPCInterface();
    [(NSXPCConnection *)v5->_connection setRemoteObjectInterface:v8];

    [(NSXPCConnection *)v5->_connection resume];
  }

  return v5;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_CDInteractionAdvisor;
  [(_CDInteractionAdvisor *)&v3 dealloc];
}

- (id)rankCandidateContacts:(id)a3 usingSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_18ECEB000, "Duet: rankCandidateContacts", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  [(_CDInteractionAdvisor *)self setError:0];
  connection = self->_connection;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke;
  v14[3] = &unk_1E560D730;
  v14[4] = self;
  objc_super v10 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_7;
  v13[3] = &unk_1E560D898;
  v13[4] = &state;
  [v10 rankCandidateContacts:v6 usingSettings:v7 reply:v13];
  id v11 = *(id *)(state.opaque[1] + 40);

  _Block_object_dispose(&state, 8);
  return v11;
}

- (id)adviseInteractionsUsingSettings:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _os_activity_create(&dword_18ECEB000, "Duet: adviseInteractionsUsingSettings", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  id v22 = 0;
  [(_CDInteractionAdvisor *)self setError:0];
  connection = self->_connection;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57___CDInteractionAdvisor_adviseInteractionsUsingSettings___block_invoke;
  v17[3] = &unk_1E560D730;
  v17[4] = self;
  id v7 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v17];
  v8 = v7;
  if (v4)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __57___CDInteractionAdvisor_adviseInteractionsUsingSettings___block_invoke_9;
    v16[3] = &unk_1E560D898;
    v16[4] = &state;
    [v7 adviseInteractionsUsingSettings:v4 reply:v16];
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = @"Settings cannot be nil";
    objc_super v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    id v11 = [v9 errorWithDomain:@"_CDInteractionAdvisor" code:1 userInfo:v10];

    v12 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [v11 localizedDescription];
      [(_CDInteractionAdvisor *)v13 adviseInteractionsUsingSettings:v12];
    }

    [(_CDInteractionAdvisor *)self setError:v11];
  }
  id v14 = *(id *)(state.opaque[1] + 40);

  _Block_object_dispose(&state, 8);
  return v14;
}

- (id)adviseInteractionsForDate:(id)a3 usingSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_18ECEB000, "Duet: adviseInteractionsForDate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  [(_CDInteractionAdvisor *)self setError:0];
  connection = self->_connection;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65___CDInteractionAdvisor_adviseInteractionsForDate_usingSettings___block_invoke;
  v14[3] = &unk_1E560D730;
  v14[4] = self;
  objc_super v10 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65___CDInteractionAdvisor_adviseInteractionsForDate_usingSettings___block_invoke_18;
  v13[3] = &unk_1E560D898;
  v13[4] = &state;
  [v10 adviseInteractionsForDate:v6 usingSettings:v7 reply:v13];
  id v11 = *(id *)(state.opaque[1] + 40);

  _Block_object_dispose(&state, 8);
  return v11;
}

- (id)adviseSocialInteractionsForDate:(id)a3 andSeedContacts:(id)a4 usingSettings:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_18ECEB000, "Duet: adviseSocialInteractionsForDate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  id v22 = 0;
  [(_CDInteractionAdvisor *)self setError:0];
  connection = self->_connection;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __87___CDInteractionAdvisor_adviseSocialInteractionsForDate_andSeedContacts_usingSettings___block_invoke;
  v17[3] = &unk_1E560D730;
  v17[4] = self;
  v13 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87___CDInteractionAdvisor_adviseSocialInteractionsForDate_andSeedContacts_usingSettings___block_invoke_19;
  v16[3] = &unk_1E560D898;
  v16[4] = &state;
  [v13 adviseSocialInteractionsForDate:v8 andSeedContacts:v9 usingSettings:v10 reply:v16];
  id v14 = *(id *)(state.opaque[1] + 40);

  _Block_object_dispose(&state, 8);
  return v14;
}

- (id)adviseInteractionsForKeywordsInString:(id)a3 usingSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_18ECEB000, "Duet: adviseInteractionsForKeywordsInString", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  [(_CDInteractionAdvisor *)self setError:0];
  connection = self->_connection;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77___CDInteractionAdvisor_adviseInteractionsForKeywordsInString_usingSettings___block_invoke;
  v14[3] = &unk_1E560D730;
  v14[4] = self;
  id v10 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77___CDInteractionAdvisor_adviseInteractionsForKeywordsInString_usingSettings___block_invoke_20;
  v13[3] = &unk_1E560D898;
  v13[4] = &state;
  [v10 adviseInteractionsForKeywordsInString:v6 usingSettings:v7 reply:v13];
  id v11 = *(id *)(state.opaque[1] + 40);

  _Block_object_dispose(&state, 8);
  return v11;
}

- (void)tuneSocialAdvisorUsingSettings:(id)a3 heartBeatHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _os_activity_create(&dword_18ECEB000, "Duet: tuneSocialAdvisorUsingSettings", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  [(_CDInteractionAdvisor *)self setError:0];
  connection = self->_connection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73___CDInteractionAdvisor_tuneSocialAdvisorUsingSettings_heartBeatHandler___block_invoke;
  v11[3] = &unk_1E560D730;
  v11[4] = self;
  id v10 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v11];
  [v10 tuneSocialAdvisorUsingSettings:v7 heartBeatHandler:v6 reply:0];
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)adviseInteractionsUsingSettings:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_18ECEB000, log, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);
}

@end