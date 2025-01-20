@interface FLFollowUpController
- (BOOL)clearNotificationForItem:(id)a3 error:(id *)a4;
- (BOOL)clearPendingFollowUpItems:(id *)a3;
- (BOOL)clearPendingFollowUpItemsWithUniqueIdentifiers:(id)a3 error:(id *)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)postFollowUpItem:(id)a3 error:(id *)a4;
- (FLFollowUpController)initWithClientIdentifier:(id)a3;
- (FLFollowUpController)initWithClientIdentifier:(id)a3 machServiceName:(id)a4 delegate:(id)a5;
- (FLFollowUpController)initWithClientIdentifier:(id)a3 xpcEndpoint:(id)a4;
- (FLFollowUpControllerDelegate)delegate;
- (id)pendingFollowUpItems:(id *)a3;
- (unint64_t)countOfPendingFollowUpItems:(id *)a3;
- (void)_didActivateHSA2LoginNotification:(id)a3;
- (void)_postHSA2LoginCode:(id)a3 withNotification:(id)a4 completion:(id)a5;
- (void)_postHSA2LoginNotification:(id)a3 completion:(id)a4;
- (void)_postHSA2PasswordChangeForAppleID:(id)a3 completion:(id)a4;
- (void)_postHSA2PasswordResetNotification:(id)a3 completion:(id)a4;
- (void)_tearDownHSA2LoginNotificationWithPushMessageID:(id)a3;
- (void)clearPendingFollowUpItemsWithCompletion:(id)a3;
- (void)clearPendingFollowUpItemsWithUniqueIdentifiers:(id)a3 completion:(id)a4;
- (void)countOfPendingFollowUpItemsWithCompletion:(id)a3;
- (void)pendingFollowUpItemsWithCompletion:(id)a3;
- (void)postFollowUpItem:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)updateBadgesForTimer;
@end

@implementation FLFollowUpController

void __45__FLFollowUpController_pendingFollowUpItems___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = _FLLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1BE24A000, v7, OS_LOG_TYPE_DEFAULT, "pendingFollowUpItems: Fetched pending follow up items: %@, error: %@", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
}

void __77__FLFollowUpController_clearPendingFollowUpItemsWithUniqueIdentifiers_error___block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _FLLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [NSNumber numberWithBool:a2];
    int v10 = 138412546;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_1BE24A000, v6, OS_LOG_TYPE_DEFAULT, "Cleared pending follow up item identifiers with success: %@, error: %@", (uint8_t *)&v10, 0x16u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

- (id)pendingFollowUpItems:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = _os_activity_create(&dword_1BE24A000, "followup/reading-pending-items", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  id v6 = +[FLDaemon sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__FLFollowUpController_pendingFollowUpItems___block_invoke;
  v14[3] = &unk_1E637AD98;
  v14[4] = &v15;
  v7 = [v6 synchronousDaemonWithErrorHandler:v14];

  uint64_t v8 = _FLLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    clientIdentifier = self->_clientIdentifier;
    *(_DWORD *)buf = 138412290;
    v29 = clientIdentifier;
    _os_log_impl(&dword_1BE24A000, v8, OS_LOG_TYPE_DEFAULT, "pendingFollowUpItems: Asking daemon server for pending items with identifier: %@", buf, 0xCu);
  }

  int v10 = self->_clientIdentifier;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __45__FLFollowUpController_pendingFollowUpItems___block_invoke_7;
  v13[3] = &unk_1E637AE10;
  v13[4] = &v21;
  v13[5] = &v15;
  [v7 pendingFollowUpItemsForClientIdentifier:v10 completion:v13];
  if (a3) {
    *a3 = (id) v16[5];
  }
  id v11 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  os_activity_scope_leave(&state);

  return v11;
}

- (BOOL)clearPendingFollowUpItemsWithUniqueIdentifiers:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  id v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  v7 = +[FLDaemon sharedInstance];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__FLFollowUpController_clearPendingFollowUpItemsWithUniqueIdentifiers_error___block_invoke;
  v15[3] = &unk_1E637AD98;
  v15[4] = &v16;
  uint64_t v8 = [v7 synchronousDaemonWithErrorHandler:v15];

  v9 = _FLLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    clientIdentifier = self->_clientIdentifier;
    *(_DWORD *)buf = 138412546;
    v27 = clientIdentifier;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl(&dword_1BE24A000, v9, OS_LOG_TYPE_DEFAULT, "Asking daemon server to clear pending items with identifier: %@, uniqueIdentifiers: %@", buf, 0x16u);
  }

  id v11 = self->_clientIdentifier;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__FLFollowUpController_clearPendingFollowUpItemsWithUniqueIdentifiers_error___block_invoke_10;
  v14[3] = &unk_1E637AE38;
  v14[4] = &v22;
  void v14[5] = &v16;
  [v8 clearPendingFollowUpItemsForClientIdentifier:v11 uniqueIdentifiers:v6 completion:v14];
  if (a4) {
    *a4 = (id) v17[5];
  }
  BOOL v12 = *((unsigned char *)v23 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

- (FLFollowUpController)initWithClientIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FLFollowUpController;
  id v6 = [(FLFollowUpController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_clientIdentifier, a3);
  }

  return v7;
}

- (FLFollowUpController)initWithClientIdentifier:(id)a3 xpcEndpoint:(id)a4
{
  id v6 = a4;
  v7 = [(FLFollowUpController *)self initWithClientIdentifier:a3];
  if (v7)
  {
    uint64_t v8 = +[FLDaemon sharedInstance];
    [v8 setDaemonXPCEndpoint:v6];
  }
  return v7;
}

- (FLFollowUpController)initWithClientIdentifier:(id)a3 machServiceName:(id)a4 delegate:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = [(FLFollowUpController *)self initWithClientIdentifier:a3];
  BOOL v12 = v11;
  if (v11)
  {
    p_machServiceName = &v11->_machServiceName;
    objc_storeStrong((id *)&v11->_machServiceName, a4);
    objc_storeWeak((id *)&v12->_delegate, v10);
    if (v10)
    {
      if (*p_machServiceName)
      {
        uint64_t v14 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:v12->_machServiceName];
        listener = v12->_listener;
        v12->_listener = (NSXPCListener *)v14;

        [(NSXPCListener *)v12->_listener setDelegate:v12];
        [(NSXPCListener *)v12->_listener resume];
      }
    }
  }

  return v12;
}

- (BOOL)postFollowUpItem:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = _os_activity_create(&dword_1BE24A000, "followup/posting-item", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy_;
  uint64_t v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v8 = +[FLDaemon sharedInstance];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __47__FLFollowUpController_postFollowUpItem_error___block_invoke;
  v18[3] = &unk_1E637AD98;
  v18[4] = &v19;
  id v9 = [v8 synchronousDaemonWithErrorHandler:v18];

  if (self->_clientIdentifier) {
    objc_msgSend(v6, "setClientIdentifier:");
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  id v11 = _FLLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v6;
    _os_log_impl(&dword_1BE24A000, v11, OS_LOG_TYPE_DEFAULT, "Asking daemon server to post follow up item: %@", buf, 0xCu);
  }

  BOOL v12 = [v6 title];
  BOOL v13 = v12 == 0;

  if (v13)
  {
    uint64_t v14 = _FLLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[FLFollowUpController postFollowUpItem:error:](v14);
    }
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __47__FLFollowUpController_postFollowUpItem_error___block_invoke_2;
  v17[3] = &unk_1E637ADC0;
  *(CFAbsoluteTime *)&v17[6] = Current;
  v17[4] = &v25;
  v17[5] = &v19;
  [v9 postFollowUpItem:v6 completion:v17];
  if (a4) {
    *a4 = (id) v20[5];
  }
  BOOL v15 = *((unsigned char *)v26 + 24) != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  os_activity_scope_leave(&state);

  return v15;
}

void __47__FLFollowUpController_postFollowUpItem_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __47__FLFollowUpController_postFollowUpItem_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _FLLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [NSNumber numberWithBool:a2];
    uint64_t v8 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48)];
    int v11 = 138412802;
    BOOL v12 = v7;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_impl(&dword_1BE24A000, v6, OS_LOG_TYPE_DEFAULT, "Posted follow up item with success: %@, error: %@, took: %@", (uint8_t *)&v11, 0x20u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (unint64_t)countOfPendingFollowUpItems:(id *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = _os_activity_create(&dword_1BE24A000, "followup/counting-pending-items", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  id v6 = +[FLDaemon sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__FLFollowUpController_countOfPendingFollowUpItems___block_invoke;
  v14[3] = &unk_1E637AD98;
  v14[4] = &v15;
  v7 = [v6 synchronousDaemonWithErrorHandler:v14];

  uint64_t v8 = _FLLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    clientIdentifier = self->_clientIdentifier;
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = clientIdentifier;
    _os_log_impl(&dword_1BE24A000, v8, OS_LOG_TYPE_DEFAULT, "Asking daemon server for count of items with identifier: %@", buf, 0xCu);
  }

  id v10 = self->_clientIdentifier;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__FLFollowUpController_countOfPendingFollowUpItems___block_invoke_5;
  v13[3] = &unk_1E637ADE8;
  v13[4] = &v21;
  v13[5] = &v15;
  [v7 countOfPendingFollowUpItemsForClientIdentifier:v10 completion:v13];
  if (a3) {
    *a3 = (id) v16[5];
  }
  unint64_t v11 = v22[3];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  os_activity_scope_leave(&state);

  return v11;
}

void __52__FLFollowUpController_countOfPendingFollowUpItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __52__FLFollowUpController_countOfPendingFollowUpItems___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _FLLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [NSNumber numberWithUnsignedInteger:a2];
    int v10 = 138412546;
    unint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_1BE24A000, v6, OS_LOG_TYPE_DEFAULT, "Received count of follow up items for client: %@, error: %@", (uint8_t *)&v10, 0x16u);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

void __45__FLFollowUpController_pendingFollowUpItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (BOOL)clearPendingFollowUpItems:(id *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _os_activity_create(&dword_1BE24A000, "followup/clearing-pending-items", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  id v6 = +[FLDaemon sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__FLFollowUpController_clearPendingFollowUpItems___block_invoke;
  v14[3] = &unk_1E637AD98;
  v14[4] = &v15;
  v7 = [v6 synchronousDaemonWithErrorHandler:v14];

  uint64_t v8 = _FLLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    clientIdentifier = self->_clientIdentifier;
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = clientIdentifier;
    _os_log_impl(&dword_1BE24A000, v8, OS_LOG_TYPE_DEFAULT, "Asking daemon server to clear pending items with identifier: %@", buf, 0xCu);
  }

  int v10 = self->_clientIdentifier;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__FLFollowUpController_clearPendingFollowUpItems___block_invoke_9;
  v13[3] = &unk_1E637AE38;
  v13[4] = &v21;
  v13[5] = &v15;
  [v7 clearPendingFollowUpItemsForClientIdentifier:v10 completion:v13];
  if (a3) {
    *a3 = (id) v16[5];
  }
  BOOL v11 = *((unsigned char *)v22 + 24) != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  os_activity_scope_leave(&state);

  return v11;
}

void __50__FLFollowUpController_clearPendingFollowUpItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __50__FLFollowUpController_clearPendingFollowUpItems___block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _FLLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [NSNumber numberWithBool:a2];
    int v10 = 138412546;
    BOOL v11 = v7;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_1BE24A000, v6, OS_LOG_TYPE_DEFAULT, "Cleared pending follow up items with success: %@, error: %@", (uint8_t *)&v10, 0x16u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

void __77__FLFollowUpController_clearPendingFollowUpItemsWithUniqueIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (BOOL)clearNotificationForItem:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _os_activity_create(&dword_1BE24A000, "followup/clearing-notification", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  uint64_t v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  v7 = +[FLDaemon sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__FLFollowUpController_clearNotificationForItem_error___block_invoke;
  v13[3] = &unk_1E637AD98;
  v13[4] = &v14;
  uint64_t v8 = [v7 synchronousDaemonWithErrorHandler:v13];

  uint64_t v9 = _FLLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v5;
    _os_log_impl(&dword_1BE24A000, v9, OS_LOG_TYPE_DEFAULT, "Asking daemon server to clear notifications for item: %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__FLFollowUpController_clearNotificationForItem_error___block_invoke_11;
  v12[3] = &unk_1E637AE38;
  v12[4] = &v20;
  v12[5] = &v14;
  [v8 clearNotificationForItem:v5 completion:v12];
  if (a4) {
    *a4 = (id) v15[5];
  }
  BOOL v10 = *((unsigned char *)v21 + 24) != 0;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  os_activity_scope_leave(&state);

  return v10;
}

void __55__FLFollowUpController_clearNotificationForItem_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __55__FLFollowUpController_clearNotificationForItem_error___block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _FLLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [NSNumber numberWithBool:a2];
    int v10 = 138412546;
    BOOL v11 = v7;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_1BE24A000, v6, OS_LOG_TYPE_DEFAULT, "Cleared notification with success: %@, error: %@", (uint8_t *)&v10, 0x16u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

- (void)postFollowUpItem:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[FLDaemon sharedInstance];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __52__FLFollowUpController_postFollowUpItem_completion___block_invoke;
  v17[3] = &unk_1E637AE60;
  id v9 = v7;
  id v18 = v9;
  int v10 = [v8 daemonWithErrorHandler:v17];

  if (self->_clientIdentifier) {
    objc_msgSend(v6, "setClientIdentifier:");
  }
  BOOL v11 = _FLLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v6;
    _os_log_impl(&dword_1BE24A000, v11, OS_LOG_TYPE_DEFAULT, "Asking daemon server to post follow up item: %@", buf, 0xCu);
  }

  __int16 v12 = [v6 title];

  if (!v12)
  {
    id v13 = _FLLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[FLFollowUpController postFollowUpItem:error:](v13);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__FLFollowUpController_postFollowUpItem_completion___block_invoke_12;
  v15[3] = &unk_1E637AE88;
  id v16 = v9;
  id v14 = v9;
  [v10 postFollowUpItem:v6 completion:v15];
}

void __52__FLFollowUpController_postFollowUpItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __52__FLFollowUpController_postFollowUpItem_completion___block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _FLLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [NSNumber numberWithBool:a2];
    int v9 = 138412546;
    int v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1BE24A000, v6, OS_LOG_TYPE_DEFAULT, "Posted follow up item with success: %@, error: %@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (void)countOfPendingFollowUpItemsWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[FLDaemon sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__FLFollowUpController_countOfPendingFollowUpItemsWithCompletion___block_invoke;
  v14[3] = &unk_1E637AE60;
  id v6 = v4;
  id v15 = v6;
  id v7 = [v5 daemonWithErrorHandler:v14];

  uint64_t v8 = _FLLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    clientIdentifier = self->_clientIdentifier;
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = clientIdentifier;
    _os_log_impl(&dword_1BE24A000, v8, OS_LOG_TYPE_DEFAULT, "Asking daemon server for count of items with identifier: %@", buf, 0xCu);
  }

  int v10 = self->_clientIdentifier;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__FLFollowUpController_countOfPendingFollowUpItemsWithCompletion___block_invoke_13;
  v12[3] = &unk_1E637AEB0;
  id v13 = v6;
  id v11 = v6;
  [v7 countOfPendingFollowUpItemsForClientIdentifier:v10 completion:v12];
}

void __66__FLFollowUpController_countOfPendingFollowUpItemsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__FLFollowUpController_countOfPendingFollowUpItemsWithCompletion___block_invoke_13(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _FLLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [NSNumber numberWithUnsignedInteger:a2];
    int v9 = 138412546;
    int v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1BE24A000, v6, OS_LOG_TYPE_DEFAULT, "Received count of follow up items for client: %@, error: %@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (void)pendingFollowUpItemsWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[FLDaemon sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__FLFollowUpController_pendingFollowUpItemsWithCompletion___block_invoke;
  v14[3] = &unk_1E637AE60;
  id v6 = v4;
  id v15 = v6;
  id v7 = [v5 daemonWithErrorHandler:v14];

  uint64_t v8 = _FLLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    clientIdentifier = self->_clientIdentifier;
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = clientIdentifier;
    _os_log_impl(&dword_1BE24A000, v8, OS_LOG_TYPE_DEFAULT, "pendingFollowUpItemsWithCompletion: Asking daemon server for pending items with identifier: %@", buf, 0xCu);
  }

  int v10 = self->_clientIdentifier;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__FLFollowUpController_pendingFollowUpItemsWithCompletion___block_invoke_14;
  v12[3] = &unk_1E637AED8;
  id v13 = v6;
  id v11 = v6;
  [v7 pendingFollowUpItemsForClientIdentifier:v10 completion:v12];
}

void __59__FLFollowUpController_pendingFollowUpItemsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__FLFollowUpController_pendingFollowUpItemsWithCompletion___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _FLLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_1BE24A000, v7, OS_LOG_TYPE_DEFAULT, "pendingFollowUpItemsWithCompletion: Fetched pending follow up items: %@, error: %@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)clearPendingFollowUpItemsWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[FLDaemon sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__FLFollowUpController_clearPendingFollowUpItemsWithCompletion___block_invoke;
  v14[3] = &unk_1E637AE60;
  id v6 = v4;
  id v15 = v6;
  id v7 = [v5 daemonWithErrorHandler:v14];

  uint64_t v8 = _FLLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    clientIdentifier = self->_clientIdentifier;
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = clientIdentifier;
    _os_log_impl(&dword_1BE24A000, v8, OS_LOG_TYPE_DEFAULT, "Asking daemon server to clear pending items with identifier: %@", buf, 0xCu);
  }

  id v10 = self->_clientIdentifier;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__FLFollowUpController_clearPendingFollowUpItemsWithCompletion___block_invoke_15;
  v12[3] = &unk_1E637AE88;
  id v13 = v6;
  id v11 = v6;
  [v7 clearPendingFollowUpItemsForClientIdentifier:v10 completion:v12];
}

void __64__FLFollowUpController_clearPendingFollowUpItemsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__FLFollowUpController_clearPendingFollowUpItemsWithCompletion___block_invoke_15(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _FLLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [NSNumber numberWithBool:a2];
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1BE24A000, v6, OS_LOG_TYPE_DEFAULT, "Cleared pending follow up items with success: %@, error: %@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (void)clearPendingFollowUpItemsWithUniqueIdentifiers:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[FLDaemon sharedInstance];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __82__FLFollowUpController_clearPendingFollowUpItemsWithUniqueIdentifiers_completion___block_invoke;
  v17[3] = &unk_1E637AE60;
  id v9 = v7;
  id v18 = v9;
  id v10 = [v8 daemonWithErrorHandler:v17];

  __int16 v11 = _FLLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    clientIdentifier = self->_clientIdentifier;
    *(_DWORD *)buf = 138412546;
    id v20 = clientIdentifier;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_1BE24A000, v11, OS_LOG_TYPE_DEFAULT, "Asking daemon server to clear pending items with identifier: %@, uniqueIdentifiers: %@", buf, 0x16u);
  }

  uint64_t v13 = self->_clientIdentifier;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__FLFollowUpController_clearPendingFollowUpItemsWithUniqueIdentifiers_completion___block_invoke_16;
  v15[3] = &unk_1E637AE88;
  id v16 = v9;
  id v14 = v9;
  [v10 clearPendingFollowUpItemsForClientIdentifier:v13 uniqueIdentifiers:v6 completion:v15];
}

void __82__FLFollowUpController_clearPendingFollowUpItemsWithUniqueIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __82__FLFollowUpController_clearPendingFollowUpItemsWithUniqueIdentifiers_completion___block_invoke_16(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _FLLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [NSNumber numberWithBool:a2];
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1BE24A000, v6, OS_LOG_TYPE_DEFAULT, "Cleared pending follow up item identifiers with success: %@, error: %@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (void)updateBadgesForTimer
{
  v2 = +[FLDaemon sharedInstance];
  id v3 = [v2 daemonWithErrorHandler:&__block_literal_global_4];

  id v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1BE24A000, v4, OS_LOG_TYPE_DEFAULT, "Asking daemon server to update badge counts", v5, 2u);
  }

  [v3 updateBadgesForTimer];
}

void __44__FLFollowUpController_updateBadgesForTimer__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();
  }
}

- (void)_postHSA2LoginNotification:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[FLDaemon sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__FLFollowUpController__postHSA2LoginNotification_completion___block_invoke;
  v14[3] = &unk_1E637AE60;
  id v8 = v6;
  id v15 = v8;
  int v9 = [v7 daemonWithErrorHandler:v14];

  id v10 = _FLLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v5;
    _os_log_impl(&dword_1BE24A000, v10, OS_LOG_TYPE_DEFAULT, "Asking daemon server to post HSA2 login notification: %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__FLFollowUpController__postHSA2LoginNotification_completion___block_invoke_17;
  v12[3] = &unk_1E637AEB0;
  id v13 = v8;
  id v11 = v8;
  [v9 postHSA2LoginNotification:v5 completion:v12];
}

void __62__FLFollowUpController__postHSA2LoginNotification_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__FLFollowUpController__postHSA2LoginNotification_completion___block_invoke_17(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _FLLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218242;
    uint64_t v9 = a2;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_1BE24A000, v6, OS_LOG_TYPE_DEFAULT, "Posted HSA2 login notification with response: %lu, error: %@", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)_postHSA2PasswordChangeForAppleID:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[FLDaemon sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__FLFollowUpController__postHSA2PasswordChangeForAppleID_completion___block_invoke;
  v14[3] = &unk_1E637AE60;
  id v8 = v6;
  id v15 = v8;
  uint64_t v9 = [v7 daemonWithErrorHandler:v14];

  __int16 v10 = _FLLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v5;
    _os_log_impl(&dword_1BE24A000, v10, OS_LOG_TYPE_DEFAULT, "Asking daemon server to post HSA2 password change notification for Apple ID: %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__FLFollowUpController__postHSA2PasswordChangeForAppleID_completion___block_invoke_18;
  v12[3] = &unk_1E637AEB0;
  id v13 = v8;
  id v11 = v8;
  [v9 postHSA2PasswordChangeForAppleID:v5 completion:v12];
}

void __69__FLFollowUpController__postHSA2PasswordChangeForAppleID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__FLFollowUpController__postHSA2PasswordChangeForAppleID_completion___block_invoke_18(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _FLLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218242;
    uint64_t v9 = a2;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_1BE24A000, v6, OS_LOG_TYPE_DEFAULT, "Posted HSA2 password change notification with response: %lu, error: %@", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)_postHSA2LoginCode:(id)a3 withNotification:(id)a4 completion:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __int16 v10 = +[FLDaemon sharedInstance];
  id v11 = [v10 daemonWithErrorHandler:&__block_literal_global_20];

  uint64_t v12 = _FLLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl(&dword_1BE24A000, v12, OS_LOG_TYPE_DEFAULT, "Asking daemon server to post HSA2 login code notification with number: %{private}@, notification: %@", buf, 0x16u);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__FLFollowUpController__postHSA2LoginCode_withNotification_completion___block_invoke_21;
  v14[3] = &unk_1E637AEB0;
  id v15 = v9;
  id v13 = v9;
  [v11 postHSA2LoginCode:v7 withNotification:v8 completion:v14];
}

void __71__FLFollowUpController__postHSA2LoginCode_withNotification_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __71__FLFollowUpController__postHSA2LoginCode_withNotification_completion___block_invoke_cold_1();
  }
}

void __71__FLFollowUpController__postHSA2LoginCode_withNotification_completion___block_invoke_21(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _FLLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218242;
    uint64_t v9 = a2;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_1BE24A000, v6, OS_LOG_TYPE_DEFAULT, "Posted HSA2 login code notification with response: %lu, error: %@", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)_tearDownHSA2LoginNotificationWithPushMessageID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[FLDaemon sharedInstance];
  id v5 = [v4 daemonWithErrorHandler:&__block_literal_global_23];

  id v6 = _FLLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_1BE24A000, v6, OS_LOG_TYPE_DEFAULT, "Tearing down HSA2 login notification with identifier: %@", (uint8_t *)&v7, 0xCu);
  }

  [v5 tearDownHSA2LoginNotificationWithPushMessageID:v3];
}

void __72__FLFollowUpController__tearDownHSA2LoginNotificationWithPushMessageID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __72__FLFollowUpController__tearDownHSA2LoginNotificationWithPushMessageID___block_invoke_cold_1();
  }
}

- (void)_postHSA2PasswordResetNotification:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = +[FLDaemon sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__FLFollowUpController__postHSA2PasswordResetNotification_completion___block_invoke;
  v14[3] = &unk_1E637AE60;
  id v8 = v6;
  id v15 = v8;
  uint64_t v9 = [v7 daemonWithErrorHandler:v14];

  __int16 v10 = _FLLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v5;
    _os_log_impl(&dword_1BE24A000, v10, OS_LOG_TYPE_DEFAULT, "Asking daemon server to post HSA2 password reset notification: %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__FLFollowUpController__postHSA2PasswordResetNotification_completion___block_invoke_24;
  v12[3] = &unk_1E637AE88;
  id v13 = v8;
  id v11 = v8;
  [v9 postHSA2PasswordResetNotification:v5 completion:v12];
}

void __70__FLFollowUpController__postHSA2PasswordResetNotification_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__FLFollowUpController__postHSA2PasswordResetNotification_completion___block_invoke_24(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _FLLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [NSNumber numberWithBool:a2];
    int v9 = 138412546;
    __int16 v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1BE24A000, v6, OS_LOG_TYPE_DEFAULT, "Posted HSA2 password reset notification with success: %@, error: %@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (void)_didActivateHSA2LoginNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[FLDaemon sharedInstance];
  id v5 = [v4 daemonWithErrorHandler:&__block_literal_global_26];

  id v6 = _FLLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_1BE24A000, v6, OS_LOG_TYPE_DEFAULT, "Notifying daemon of HSA2 login notification activation: %@", (uint8_t *)&v7, 0xCu);
  }

  [v5 didActivateHSA2LoginNotificationNotification:v3];
}

void __58__FLFollowUpController__didActivateHSA2LoginNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __58__FLFollowUpController__didActivateHSA2LoginNotification___block_invoke_cold_1();
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F29280];
  id v6 = a4;
  int v7 = [v5 interfaceWithProtocol:&unk_1F18DCEC0];
  [v6 setExportedInterface:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [v6 setExportedObject:WeakRetained];

  [v6 resume];
  return 1;
}

- (FLFollowUpControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FLFollowUpControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);

  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (void)postFollowUpItem:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BE24A000, log, OS_LOG_TYPE_ERROR, "nil title on FLFollowUpItem, please ensure your items have a title, even if its a fallback", v1, 2u);
}

void __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1BE24A000, v0, v1, "Remote daemon server returned an error: %@", v2, v3, v4, v5, v6);
}

void __71__FLFollowUpController__postHSA2LoginCode_withNotification_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1BE24A000, v0, v1, "Failed to post login code: %@", v2, v3, v4, v5, v6);
}

void __72__FLFollowUpController__tearDownHSA2LoginNotificationWithPushMessageID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1BE24A000, v0, v1, "Error communicating with daemon while tearing down HSA2 login notification: %@", v2, v3, v4, v5, v6);
}

void __58__FLFollowUpController__didActivateHSA2LoginNotification___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1BE24A000, v0, v1, "Error communicating with daemon while activating HSA2 login notification: %@", v2, v3, v4, v5, v6);
}

@end