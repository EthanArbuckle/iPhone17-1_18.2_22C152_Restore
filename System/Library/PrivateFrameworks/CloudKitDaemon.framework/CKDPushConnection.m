@interface CKDPushConnection
+ (id)sharedConnectionForAPSEnvironmentString:(id)a3;
- (APSConnection)apsConnection;
- (CKDPushConnection)initWithEnvironment:(id)a3;
- (NSMutableArray)completionBlocks;
- (NSString)apsEnvironmentString;
- (OS_dispatch_queue)queue;
- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connectionDidReconnect:(id)a3;
- (void)dealloc;
- (void)getToken:(id)a3;
- (void)setAPSEnvironmentString:(id)a3;
- (void)setApsConnection:(id)a3;
- (void)setCompletionBlocks:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CKDPushConnection

+ (id)sharedConnectionForAPSEnvironmentString:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (qword_1EBBCFC28 == -1)
  {
    if (v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_1EBBCFC28, &unk_1F2043410);
  if (!v5) {
LABEL_3:
  }
    id v5 = (id)*MEMORY[0x1E4F4E1D0];
LABEL_4:
  id v6 = a1;
  objc_sync_enter(v6);
  v8 = objc_msgSend_objectForKeyedSubscript_((void *)qword_1EBBCFC20, v7, (uint64_t)v5);
  if (!v8)
  {
    v9 = [CKDPushConnection alloc];
    v8 = objc_msgSend_initWithEnvironment_(v9, v10, (uint64_t)v5);
    objc_msgSend_setObject_forKeyedSubscript_((void *)qword_1EBBCFC20, v11, (uint64_t)v8, v5);
  }
  objc_sync_exit(v6);

  return v8;
}

- (CKDPushConnection)initWithEnvironment:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CKDPushConnection;
  id v6 = [(CKDPushConnection *)&v26 init];
  if (v6)
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v11 = (const char *)objc_msgSend_UTF8String(v8, v9, v10);
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create(v11, v12);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v6->_apsEnvironmentString, a3);
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    completionBlocks = v6->_completionBlocks;
    v6->_completionBlocks = v15;

    id v17 = objc_alloc(MEMORY[0x1E4F4E1E8]);
    uint64_t v19 = objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(v17, v18, (uint64_t)v5, *MEMORY[0x1E4F4E1B8], v6->_queue);
    apsConnection = v6->_apsConnection;
    v6->_apsConnection = (APSConnection *)v19;

    objc_msgSend_setDelegate_(v6->_apsConnection, v21, (uint64_t)v6);
    id v24 = (id)objc_msgSend_publicToken(v6->_apsConnection, v22, v23);
  }
  return v6;
}

- (void)dealloc
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4E17DEC;
  block[3] = &unk_1E64F09E0;
  objc_copyWeak(&v6, &location);
  dispatch_sync(queue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  v4.receiver = self;
  v4.super_class = (Class)CKDPushConnection;
  [(CKDPushConnection *)&v4 dealloc];
}

- (void)getToken:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_queue(self, v5, v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4E17EEC;
  v9[3] = &unk_1E64F0E18;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1C4CFF000, "CKDPushConnection/didReceivePublicToken", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v9 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v6;
    __int16 v20 = 2114;
    id v21 = v7;
    _os_log_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_INFO, "Received public token from connection %@: %{public}@", buf, 0x16u);
  }
  id v10 = CKGetGlobalQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4E182DC;
  block[3] = &unk_1E64F05C8;
  void block[4] = self;
  dispatch_async(v10, block);

  if (v7)
  {
    dispatch_queue_t v13 = objc_msgSend_queue(self, v11, v12);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1C4E1835C;
    v14[3] = &unk_1E64F0948;
    v14[4] = self;
    id v15 = v7;
    dispatch_async(v13, v14);
  }
  os_activity_scope_leave(&state);
}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v7 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    uint64_t v11 = objc_msgSend_apsEnvironmentString(self, v9, v10);
    uint64_t v12 = (void *)v11;
    dispatch_queue_t v13 = @"disconnected";
    if (v4) {
      dispatch_queue_t v13 = @"connected";
    }
    int v14 = 138543618;
    uint64_t v15 = v11;
    __int16 v16 = 2114;
    id v17 = v13;
    _os_log_impl(&dword_1C4CFF000, v8, OS_LOG_TYPE_INFO, "Push connection for environment \"%{public}@\" changed status: %{public}@", (uint8_t *)&v14, 0x16u);
  }
}

- (void)connectionDidReconnect:(id)a3
{
  id v3 = a3;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  BOOL v4 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_debug_impl(&dword_1C4CFF000, v4, OS_LOG_TYPE_DEBUG, "Did reconnect to push daemon", v5, 2u);
  }
}

- (NSString)apsEnvironmentString
{
  return self->_apsEnvironmentString;
}

- (void)setAPSEnvironmentString:(id)a3
{
}

- (APSConnection)apsConnection
{
  return self->_apsConnection;
}

- (void)setApsConnection:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (void)setCompletionBlocks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_apsEnvironmentString, 0);
}

@end