@interface _CDInteractionRecorder
+ (id)interactionRecorder;
- (BOOL)enforceDataLimits;
- (BOOL)enforcePrivacy;
- (BOOL)recordInteraction:(id)a3;
- (BOOL)recordInteractions:(id)a3;
- (BOOL)recordInteractions:(id)a3 synchronous:(BOOL)a4 completionHandler:(id)a5;
- (_CDInteractionRecorder)initWithServiceName:(id)a3;
- (id)queryContactsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 error:(id *)a6;
- (id)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5;
- (id)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 error:(id *)a6;
- (unint64_t)countContactsUsingPredicate:(id)a3 error:(id *)a4;
- (unint64_t)countInteractionsUsingPredicate:(id)a3 error:(id *)a4;
- (unint64_t)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 debuggingReason:(id)a6 error:(id *)a7;
- (unint64_t)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 error:(id *)a6;
- (unint64_t)deleteInteractionsWithBundleId:(id)a3 account:(id)a4 error:(id *)a5;
- (unint64_t)deleteInteractionsWithBundleId:(id)a3 domainIdentifier:(id)a4 error:(id *)a5;
- (unint64_t)deleteInteractionsWithBundleId:(id)a3 domainIdentifiers:(id)a4 error:(id *)a5;
- (unint64_t)deleteInteractionsWithBundleId:(id)a3 error:(id *)a4;
- (void)countContactsUsingPredicate:(id)a3 completionHandler:(id)a4;
- (void)countContactsUsingPredicate:(id)a3 synchronous:(BOOL)a4 completionHandler:(id)a5;
- (void)countInteractionsUsingPredicate:(id)a3 completionHandler:(id)a4;
- (void)countInteractionsUsingPredicate:(id)a3 synchronous:(BOOL)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6;
- (void)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 debuggingReason:(id)a6 completionHandler:(id)a7;
- (void)deleteInteractionsMatchingPredicate:(id)a3 synchronous:(BOOL)a4 sortDescriptors:(id)a5 limit:(unint64_t)a6 debuggingReason:(id)a7 completionHandler:(id)a8;
- (void)deleteInteractionsWithBundleId:(id)a3 account:(id)a4 completionHandler:(id)a5;
- (void)deleteInteractionsWithBundleId:(id)a3 completionHandler:(id)a4;
- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifier:(id)a4 completionHandler:(id)a5;
- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifiers:(id)a4 completionHandler:(id)a5;
- (void)deleteInteractionsWithBundleId:(id)a3 synchronous:(BOOL)a4 account:(id)a5 completionHandler:(id)a6;
- (void)deleteInteractionsWithBundleId:(id)a3 synchronous:(BOOL)a4 completionHandler:(id)a5;
- (void)deleteInteractionsWithBundleId:(id)a3 synchronous:(BOOL)a4 domainIdentifier:(id)a5 completionHandler:(id)a6;
- (void)deleteInteractionsWithBundleId:(id)a3 synchronous:(BOOL)a4 domainIdentifiers:(id)a5 completionHandler:(id)a6;
- (void)queryContactsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6;
- (void)queryContactsUsingPredicate:(id)a3 synchronous:(BOOL)a4 sortDescriptors:(id)a5 limit:(unint64_t)a6 completionHandler:(id)a7;
- (void)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6;
- (void)queryInteractionsUsingPredicate:(id)a3 synchronous:(BOOL)a4 sortDescriptors:(id)a5 limit:(unint64_t)a6 completionHandler:(id)a7;
- (void)recordInteractions:(id)a3 completionHandler:(id)a4;
- (void)setEnforceDataLimits:(BOOL)a3;
- (void)setEnforcePrivacy:(BOOL)a3;
@end

@implementation _CDInteractionRecorder

- (void)deleteInteractionsMatchingPredicate:(id)a3 synchronous:(BOOL)a4 sortDescriptors:(id)a5 limit:(unint64_t)a6 debuggingReason:(id)a7 completionHandler:(id)a8
{
  BOOL v10 = a4;
  id v13 = a8;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __130___CDInteractionRecorder_deleteInteractionsMatchingPredicate_synchronous_sortDescriptors_limit_debuggingReason_completionHandler___block_invoke;
  v20[3] = &unk_1E560D640;
  id v14 = v13;
  id v21 = v14;
  id v15 = a5;
  id v16 = a3;
  v17 = (void *)MEMORY[0x192FB31A0](v20);
  connection = self->_connection;
  if (v10) {
    [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v17];
  }
  else {
  v19 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v17];
  }
  [v19 deleteInteractionsMatchingPredicate:v16 sortDescriptors:v15 limit:a6 reply:v14];
}

- (void)deleteInteractionsWithBundleId:(id)a3 synchronous:(BOOL)a4 account:(id)a5 completionHandler:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = _os_activity_create(&dword_18ECEB000, "Duet: deleteInteractionsWithBundleId account async", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  os_activity_scope_leave(&state);

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __95___CDInteractionRecorder_deleteInteractionsWithBundleId_synchronous_account_completionHandler___block_invoke;
  v18[3] = &unk_1E560D640;
  id v14 = v10;
  id v19 = v14;
  id v15 = (void *)MEMORY[0x192FB31A0](v18);
  connection = self->_connection;
  if (v7) {
    [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v15];
  }
  else {
  v17 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v15];
  }
  [v17 deleteInteractionsWithBundleId:v12 account:v11 reply:v14];
}

+ (id)interactionRecorder
{
  if (interactionRecorder_onceToken != -1) {
    dispatch_once(&interactionRecorder_onceToken, &__block_literal_global_70);
  }
  v2 = (void *)interactionRecorder_recorder;
  return v2;
}

- (_CDInteractionRecorder)initWithServiceName:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_CDInteractionRecorder;
  v5 = [(_CDInteractionRecorder *)&v13 init];
  v6 = v5;
  if (v5)
  {
    *(_WORD *)&v5->_enforceDataLimits = 257;
    uint64_t v7 = +[_CDInteractionPolicies interactionPolicies];
    policies = v6->_policies;
    v6->_policies = (_CDInteractionPolicies *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:v4 options:4096];
    connection = v6->_connection;
    v6->_connection = (NSXPCConnection *)v9;

    id v11 = _CDInteractionNSXPCInterface();
    [(NSXPCConnection *)v6->_connection setRemoteObjectInterface:v11];

    [(NSXPCConnection *)v6->_connection resume];
  }

  return v6;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_CDInteractionRecorder;
  [(_CDInteractionRecorder *)&v3 dealloc];
}

- (BOOL)recordInteractions:(id)a3 synchronous:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v21 = (void (**)(void))a5;
  v20 = [(_CDInteractionPolicies *)self->_policies filterAndModifyInteractionsWithPolicies:v8 enforceDataLimits:[(_CDInteractionRecorder *)self enforceDataLimits] enforcePrivacy:[(_CDInteractionRecorder *)self enforcePrivacy]];
  if (recordInteractions_synchronous_completionHandler___pasOnceToken5 != -1)
  {
    dispatch_once(&recordInteractions_synchronous_completionHandler___pasOnceToken5, &__block_literal_global_9_0);
    if (v6) {
      goto LABEL_3;
    }
LABEL_18:
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_18;
    v27[3] = &unk_1E5610568;
    v28 = v21;
    id v16 = objc_msgSend(v27, "copy", v20);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v40 = 0x2050000000;
    v41 = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_2_20;
    v22[3] = &unk_1E5610590;
    p_long long buf = &buf;
    id v23 = v8;
    id v17 = v16;
    v24 = self;
    id v25 = v17;
    v18 = (void (**)(void))[v22 copy];
    *(void *)(*((void *)&buf + 1) + 24) = v18;
    v18[2]();

    _Block_object_dispose(&buf, 8);
    BOOL v15 = 1;
    goto LABEL_19;
  }
  if (!v6) {
    goto LABEL_18;
  }
LABEL_3:
  while ((atomic_exchange((atomic_uchar *volatile)recordInteractions_synchronous_completionHandler__flag, 1u) & 1) != 0)
  {
    uint64_t v9 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_DEFAULT, "[sync path] It's not our turn yet...", (uint8_t *)&buf, 2u);
    }

    dispatch_sync((dispatch_queue_t)recordInteractions_synchronous_completionHandler__queue, &__block_literal_global_14_0);
    dispatch_group_wait((dispatch_group_t)recordInteractions_synchronous_completionHandler__group, 0xFFFFFFFFFFFFFFFFLL);
  }
  dispatch_group_enter((dispatch_group_t)recordInteractions_synchronous_completionHandler__group);
  id v10 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v8 count];
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_18ECEB000, v10, OS_LOG_TYPE_DEFAULT, "[sync path] beginning recordInteractions (%tu interactions)", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__23;
  v42 = __Block_byref_object_dispose__23;
  id v43 = 0;
  id v12 = recordInteractions_synchronous_completionHandler__queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_15;
  block[3] = &unk_1E5610540;
  block[4] = self;
  v31 = &buf;
  id v30 = v20;
  v32 = &v33;
  dispatch_sync(v12, block);
  if (*((unsigned char *)v34 + 24))
  {
    objc_super v13 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v8 count];
      *(_DWORD *)v37 = 134217984;
      uint64_t v38 = v14;
      _os_log_impl(&dword_18ECEB000, v13, OS_LOG_TYPE_DEFAULT, "[sync path] successfully sent %tu interactions to coreduet daemon", v37, 0xCu);
    }
  }
  else
  {
    objc_super v13 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_CDInteractionRecorder recordInteractions:synchronous:completionHandler:]((uint64_t)&buf + 8, v37, [v8 count], v13);
    }
  }

  if (v21) {
    v21[2]();
  }
  BOOL v15 = *((unsigned char *)v34 + 24) != 0;

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v33, 8);
LABEL_19:

  return v15;
}

- (BOOL)recordInteraction:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  BOOL v6 = [v4 arrayWithObjects:&v8 count:1];

  LOBYTE(self) = -[_CDInteractionRecorder recordInteractions:](self, "recordInteractions:", v6, v8, v9);
  return (char)self;
}

- (BOOL)recordInteractions:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_18ECEB000, "Duet: recordInteractions sync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v5, &v7);
  os_activity_scope_leave(&v7);

  LOBYTE(self) = [(_CDInteractionRecorder *)self recordInteractions:v4 synchronous:1 completionHandler:0];
  return (char)self;
}

- (void)recordInteractions:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _os_activity_create(&dword_18ECEB000, "Duet: recordInteractions async", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v8, &v9);
  os_activity_scope_leave(&v9);

  [(_CDInteractionRecorder *)self recordInteractions:v7 synchronous:0 completionHandler:v6];
}

- (void)queryInteractionsUsingPredicate:(id)a3 synchronous:(BOOL)a4 sortDescriptors:(id)a5 limit:(unint64_t)a6 completionHandler:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __110___CDInteractionRecorder_queryInteractionsUsingPredicate_synchronous_sortDescriptors_limit_completionHandler___block_invoke;
  v19[3] = &unk_1E560D640;
  id v13 = v12;
  id v20 = v13;
  id v14 = a5;
  id v15 = a3;
  id v16 = (void *)MEMORY[0x192FB31A0](v19);
  connection = self->_connection;
  if (v9) {
    [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v16];
  }
  else {
  v18 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v16];
  }
  [v18 queryInteractionsUsingPredicate:v15 sortDescriptors:v14 limit:a6 reply:v13];
}

- (id)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = _os_activity_create(&dword_18ECEB000, "Duet: queryInteractionsUsingPredicate sync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__23;
  id v25 = __Block_byref_object_dispose__23;
  id v26 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__23;
  id v20 = __Block_byref_object_dispose__23;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86___CDInteractionRecorder_queryInteractionsUsingPredicate_sortDescriptors_limit_error___block_invoke;
  v15[3] = &unk_1E56105B8;
  v15[4] = &state;
  v15[5] = &v16;
  [(_CDInteractionRecorder *)self queryInteractionsUsingPredicate:v10 synchronous:1 sortDescriptors:v11 limit:a5 completionHandler:v15];
  if (a6) {
    *a6 = (id) v17[5];
  }
  id v13 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&state, 8);
  return v13;
}

- (void)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = _os_activity_create(&dword_18ECEB000, "Duet: queryInteractionsUsingPredicate async", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v13, &v14);
  os_activity_scope_leave(&v14);

  if (v12) {
    [(_CDInteractionRecorder *)self queryInteractionsUsingPredicate:v10 synchronous:0 sortDescriptors:v11 limit:a5 completionHandler:v12];
  }
}

- (void)countInteractionsUsingPredicate:(id)a3 synchronous:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88___CDInteractionRecorder_countInteractionsUsingPredicate_synchronous_completionHandler___block_invoke;
  v14[3] = &unk_1E560D640;
  id v9 = v8;
  id v15 = v9;
  id v10 = a3;
  id v11 = (void *)MEMORY[0x192FB31A0](v14);
  connection = self->_connection;
  if (v5) {
    [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v11];
  }
  else {
  id v13 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v11];
  }
  [v13 countInteractionsUsingPredicate:v10 reply:v9];
}

- (unint64_t)countInteractionsUsingPredicate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = _os_activity_create(&dword_18ECEB000, "Duet: countInteractionsUsingPredicate sync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__23;
  os_activity_scope_state_s v14 = __Block_byref_object_dispose__23;
  id v15 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64___CDInteractionRecorder_countInteractionsUsingPredicate_error___block_invoke;
  v10[3] = &unk_1E56105E0;
  v10[4] = &v16;
  v10[5] = &state;
  [(_CDInteractionRecorder *)self countInteractionsUsingPredicate:v6 synchronous:1 completionHandler:v10];
  if (a4) {
    *a4 = *(id *)(state.opaque[1] + 40);
  }
  unint64_t v8 = v17[3];
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (void)countInteractionsUsingPredicate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = _os_activity_create(&dword_18ECEB000, "Duet: countInteractionsUsingPredicate async", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v7, &v8);
  os_activity_scope_leave(&v8);

  if (a4) {
    [(_CDInteractionRecorder *)self countInteractionsUsingPredicate:v6 synchronous:0 completionHandler:0];
  }
}

- (id)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5
{
  return [(_CDInteractionRecorder *)self queryInteractionsUsingPredicate:a3 sortDescriptors:a4 limit:a5 error:0];
}

- (void)queryContactsUsingPredicate:(id)a3 synchronous:(BOOL)a4 sortDescriptors:(id)a5 limit:(unint64_t)a6 completionHandler:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __106___CDInteractionRecorder_queryContactsUsingPredicate_synchronous_sortDescriptors_limit_completionHandler___block_invoke;
  v19[3] = &unk_1E560D640;
  id v13 = v12;
  id v20 = v13;
  id v14 = a5;
  id v15 = a3;
  uint64_t v16 = (void *)MEMORY[0x192FB31A0](v19);
  connection = self->_connection;
  if (v9) {
    [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v16];
  }
  else {
  uint64_t v18 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v16];
  }
  [v18 queryContactsUsingPredicate:v15 sortDescriptors:v14 limit:a6 reply:v13];
}

- (id)queryContactsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = _os_activity_create(&dword_18ECEB000, "Duet: queryContactsUsingPredicate sync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__23;
  id v25 = __Block_byref_object_dispose__23;
  id v26 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__23;
  id v20 = __Block_byref_object_dispose__23;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82___CDInteractionRecorder_queryContactsUsingPredicate_sortDescriptors_limit_error___block_invoke;
  v15[3] = &unk_1E56105B8;
  v15[4] = &state;
  v15[5] = &v16;
  [(_CDInteractionRecorder *)self queryContactsUsingPredicate:v10 synchronous:1 sortDescriptors:v11 limit:a5 completionHandler:v15];
  if (a6) {
    *a6 = (id) v17[5];
  }
  id v13 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&state, 8);
  return v13;
}

- (void)queryContactsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = _os_activity_create(&dword_18ECEB000, "Duet: queryContactsUsingPredicate async", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v13, &v14);
  os_activity_scope_leave(&v14);

  if (v12) {
    [(_CDInteractionRecorder *)self queryContactsUsingPredicate:v10 synchronous:0 sortDescriptors:v11 limit:a5 completionHandler:v12];
  }
}

- (void)countContactsUsingPredicate:(id)a3 synchronous:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84___CDInteractionRecorder_countContactsUsingPredicate_synchronous_completionHandler___block_invoke;
  v14[3] = &unk_1E560D640;
  id v9 = v8;
  id v15 = v9;
  id v10 = a3;
  id v11 = (void *)MEMORY[0x192FB31A0](v14);
  connection = self->_connection;
  if (v5) {
    [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v11];
  }
  else {
  id v13 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v11];
  }
  [v13 countContactsUsingPredicate:v10 reply:v9];
}

- (unint64_t)countContactsUsingPredicate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = _os_activity_create(&dword_18ECEB000, "Duet: countContactsUsingPredicate sync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__23;
  os_activity_scope_state_s v14 = __Block_byref_object_dispose__23;
  id v15 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60___CDInteractionRecorder_countContactsUsingPredicate_error___block_invoke;
  v10[3] = &unk_1E56105E0;
  v10[4] = &v16;
  v10[5] = &state;
  [(_CDInteractionRecorder *)self countContactsUsingPredicate:v6 synchronous:1 completionHandler:v10];
  if (a4) {
    *a4 = *(id *)(state.opaque[1] + 40);
  }
  unint64_t v8 = v17[3];
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (void)countContactsUsingPredicate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = _os_activity_create(&dword_18ECEB000, "Duet: countContactsUsingPredicate async", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v8, &v9);
  os_activity_scope_leave(&v9);

  if (v7) {
    [(_CDInteractionRecorder *)self countContactsUsingPredicate:v6 synchronous:0 completionHandler:v7];
  }
}

- (void)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
}

- (void)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 debuggingReason:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = _os_activity_create(&dword_18ECEB000, "Duet: deleteInteractionsMatchingPredicate async", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v17.opaque[0] = 0;
  v17.opaque[1] = 0;
  os_activity_scope_enter(v16, &v17);
  os_activity_scope_leave(&v17);

  if (v15) {
    [(_CDInteractionRecorder *)self deleteInteractionsMatchingPredicate:v12 synchronous:0 sortDescriptors:v13 limit:a5 debuggingReason:v14 completionHandler:v15];
  }
}

- (unint64_t)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  return [(_CDInteractionRecorder *)self deleteInteractionsMatchingPredicate:a3 sortDescriptors:a4 limit:a5 debuggingReason:@"unspecified reason" error:a6];
}

- (unint64_t)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 debuggingReason:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = _os_activity_create(&dword_18ECEB000, "Duet: deleteInteractionsMatchingPredicate sync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v15, &state);
  os_activity_scope_leave(&state);

  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__23;
  v22 = __Block_byref_object_dispose__23;
  id v23 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __106___CDInteractionRecorder_deleteInteractionsMatchingPredicate_sortDescriptors_limit_debuggingReason_error___block_invoke;
  v18[3] = &unk_1E56105E0;
  void v18[4] = &v24;
  v18[5] = &state;
  [(_CDInteractionRecorder *)self deleteInteractionsMatchingPredicate:v12 synchronous:1 sortDescriptors:v13 limit:a5 debuggingReason:v14 completionHandler:v18];
  if (a7) {
    *a7 = *(id *)(state.opaque[1] + 40);
  }
  unint64_t v16 = v25[3];
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v24, 8);
  return v16;
}

- (void)deleteInteractionsWithBundleId:(id)a3 synchronous:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87___CDInteractionRecorder_deleteInteractionsWithBundleId_synchronous_completionHandler___block_invoke;
  v14[3] = &unk_1E560D640;
  id v9 = v8;
  id v15 = v9;
  id v10 = a3;
  id v11 = (void *)MEMORY[0x192FB31A0](v14);
  connection = self->_connection;
  if (v5) {
    [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v11];
  }
  else {
  id v13 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v11];
  }
  [v13 deleteInteractionsWithBundleId:v10 reply:v9];
}

- (void)deleteInteractionsWithBundleId:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_18ECEB000, "Duet: deleteInteractionsWithBundleId async", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v8, &v9);
  os_activity_scope_leave(&v9);

  if (v7) {
    [(_CDInteractionRecorder *)self deleteInteractionsWithBundleId:v6 synchronous:0 completionHandler:v7];
  }
}

- (unint64_t)deleteInteractionsWithBundleId:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = _os_activity_create(&dword_18ECEB000, "Duet: deleteInteractionsWithBundleId sync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  uint64_t v16 = 0;
  os_activity_scope_state_s v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__23;
  id v14 = __Block_byref_object_dispose__23;
  id v15 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63___CDInteractionRecorder_deleteInteractionsWithBundleId_error___block_invoke;
  v10[3] = &unk_1E56105E0;
  v10[4] = &v16;
  v10[5] = &state;
  [(_CDInteractionRecorder *)self deleteInteractionsWithBundleId:v6 synchronous:1 completionHandler:v10];
  if (a4) {
    *a4 = *(id *)(state.opaque[1] + 40);
  }
  unint64_t v8 = v17[3];
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (void)deleteInteractionsWithBundleId:(id)a3 account:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_18ECEB000, "Duet: deleteInteractionsWithBundleId account async", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v11, &v12);
  os_activity_scope_leave(&v12);

  if (v10) {
    [(_CDInteractionRecorder *)self deleteInteractionsWithBundleId:v8 synchronous:0 account:v9 completionHandler:v10];
  }
}

- (unint64_t)deleteInteractionsWithBundleId:(id)a3 account:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__23;
  os_activity_scope_state_s v17 = __Block_byref_object_dispose__23;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71___CDInteractionRecorder_deleteInteractionsWithBundleId_account_error___block_invoke;
  v12[3] = &unk_1E56105E0;
  v12[4] = &v19;
  v12[5] = &v13;
  [(_CDInteractionRecorder *)self deleteInteractionsWithBundleId:v8 synchronous:1 account:v9 completionHandler:v12];
  if (a5) {
    *a5 = (id) v14[5];
  }
  unint64_t v10 = v20[3];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

- (void)deleteInteractionsWithBundleId:(id)a3 synchronous:(BOOL)a4 domainIdentifier:(id)a5 completionHandler:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  uint64_t v13 = _os_activity_create(&dword_18ECEB000, "Duet: deleteInteractionsWithBundleId domainIdentifier async", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  os_activity_scope_leave(&state);

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __104___CDInteractionRecorder_deleteInteractionsWithBundleId_synchronous_domainIdentifier_completionHandler___block_invoke;
  v18[3] = &unk_1E560D640;
  id v14 = v10;
  id v19 = v14;
  uint64_t v15 = (void *)MEMORY[0x192FB31A0](v18);
  connection = self->_connection;
  if (v7) {
    [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v15];
  }
  else {
  os_activity_scope_state_s v17 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v15];
  }
  [v17 deleteInteractionsWithBundleId:v12 domainIdentifier:v11 reply:v14];
}

- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_18ECEB000, "Duet: deleteInteractionsWithBundleId domainIdentifier async", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v11, &v12);
  os_activity_scope_leave(&v12);

  if (v10) {
    [(_CDInteractionRecorder *)self deleteInteractionsWithBundleId:v8 synchronous:0 domainIdentifier:v9 completionHandler:v10];
  }
}

- (unint64_t)deleteInteractionsWithBundleId:(id)a3 domainIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__23;
  os_activity_scope_state_s v17 = __Block_byref_object_dispose__23;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80___CDInteractionRecorder_deleteInteractionsWithBundleId_domainIdentifier_error___block_invoke;
  v12[3] = &unk_1E56105E0;
  v12[4] = &v19;
  v12[5] = &v13;
  [(_CDInteractionRecorder *)self deleteInteractionsWithBundleId:v8 synchronous:1 domainIdentifier:v9 completionHandler:v12];
  if (a5) {
    *a5 = (id) v14[5];
  }
  unint64_t v10 = v20[3];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

- (void)deleteInteractionsWithBundleId:(id)a3 synchronous:(BOOL)a4 domainIdentifiers:(id)a5 completionHandler:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  uint64_t v13 = _os_activity_create(&dword_18ECEB000, "Duet: deleteInteractionsWithBundleId domainIdentifiers dispatch", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  os_activity_scope_leave(&state);

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __105___CDInteractionRecorder_deleteInteractionsWithBundleId_synchronous_domainIdentifiers_completionHandler___block_invoke;
  v18[3] = &unk_1E560D640;
  id v14 = v10;
  id v19 = v14;
  uint64_t v15 = (void *)MEMORY[0x192FB31A0](v18);
  connection = self->_connection;
  if (v7) {
    [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v15];
  }
  else {
  os_activity_scope_state_s v17 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v15];
  }
  [v17 deleteInteractionsWithBundleId:v12 domainIdentifiers:v11 reply:v14];
}

- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifiers:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_18ECEB000, "Duet: deleteInteractionsWithBundleId domainIdentifiers async", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v11, &v12);
  os_activity_scope_leave(&v12);

  if (v10) {
    [(_CDInteractionRecorder *)self deleteInteractionsWithBundleId:v8 synchronous:0 domainIdentifiers:v9 completionHandler:v10];
  }
}

- (unint64_t)deleteInteractionsWithBundleId:(id)a3 domainIdentifiers:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__23;
  os_activity_scope_state_s v17 = __Block_byref_object_dispose__23;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81___CDInteractionRecorder_deleteInteractionsWithBundleId_domainIdentifiers_error___block_invoke;
  v12[3] = &unk_1E56105E0;
  v12[4] = &v19;
  v12[5] = &v13;
  [(_CDInteractionRecorder *)self deleteInteractionsWithBundleId:v8 synchronous:1 domainIdentifiers:v9 completionHandler:v12];
  if (a5) {
    *a5 = (id) v14[5];
  }
  unint64_t v10 = v20[3];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

- (BOOL)enforceDataLimits
{
  return self->_enforceDataLimits;
}

- (void)setEnforceDataLimits:(BOOL)a3
{
  self->_enforceDataLimits = a3;
}

- (BOOL)enforcePrivacy
{
  return self->_enforcePrivacy;
}

- (void)setEnforcePrivacy:(BOOL)a3
{
  self->_enforcePrivacy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policies, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)recordInteractions:(uint64_t)a3 synchronous:(os_log_t)log completionHandler:.cold.1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  uint64_t v4 = *(void *)(*(void *)a1 + 40);
  *(_DWORD *)long long buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = v4;
  _os_log_error_impl(&dword_18ECEB000, log, OS_LOG_TYPE_ERROR, "[sync path] stopped sending %tu interactions to coreduet daemon (%{public}@)", buf, 0x16u);
}

@end