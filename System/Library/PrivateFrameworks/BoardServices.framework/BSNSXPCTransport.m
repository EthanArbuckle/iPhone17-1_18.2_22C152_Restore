@interface BSNSXPCTransport
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (id)_auditToken;
- (id)newExternalMessageSessionWithReason:(id)a3;
- (id)sendMessageWithReplySync:(id)a3;
- (int)auditSessionIdentifier;
- (int)processIdentifier;
- (os_unfair_lock_s)_initWithConnection:(void *)a3 configurator:(void *)a4 assertionProvider:;
- (unsigned)effectiveGroupIdentifier;
- (unsigned)effectiveUserIdentifier;
- (void)_newAcquiredAssertionWithAttributes:(void *)a1;
- (void)_newMessageSessionWithReason:(void *)a1;
- (void)_sendMessage:(int)a3 asNotification:;
- (void)activate;
- (void)cancel;
- (void)dealloc;
- (void)resume;
- (void)sendBarrierBlock:(id)a3;
- (void)sendMessage:(id)a3;
- (void)sendMessageWithReply:(id)a3 onQueue:(id)a4 replyHandler:(id)a5;
- (void)sendNotification:(id)a3;
- (void)setActivateOnResume;
- (void)setErrorHandler:(id)a3;
- (void)setFaultOnSuspend;
- (void)setMessageHandler:(id)a3;
- (void)setPerMessageAssertionAttributes:(id)a3;
- (void)setRefCountedAssertionAttributes:(id)a3;
- (void)setTargetQueue:(id)a3;
- (void)suspend;
@end

@implementation BSNSXPCTransport

void __36__BSNSXPCTransport_setErrorHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v25 = a2;
  id v5 = a3;
  v6 = [v5 domain];
  char v7 = BSEqualObjects();

  if ((v7 & 1) == 0)
  {
    v11 = NSString;
    v12 = [v5 domain];
    v13 = [v11 stringWithFormat:@"unexpected error domain: %@", v12];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138544642;
      id v27 = v14;
      __int16 v28 = 2114;
      v29 = v16;
      __int16 v30 = 2048;
      uint64_t v31 = v17;
      __int16 v32 = 2114;
      v33 = @"BSNSXPCTransport.m";
      __int16 v34 = 1024;
      int v35 = 325;
      __int16 v36 = 2114;
      v37 = v13;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C75B3C4);
  }
  v8 = (void *)MEMORY[0x1E4F14528];
  id v9 = MEMORY[0x1E4F14528];
  if ([v5 code] == 1)
  {
    if (-[_BSNSXPCInvalidCallbackTracking isInvalidationStillPending](*(os_unfair_lock_s **)(a1 + 40)))
    {
      v8 = (void *)MEMORY[0x1E4F14520];
      id v10 = MEMORY[0x1E4F14520];
    }
  }
  else
  {
    if ([v5 code] != 2)
    {
      v18 = NSString;
      v19 = NSStringFromBSServiceConnectionErrorCode([v5 code]);
      v20 = [v18 stringWithFormat:@"unexpected error code: %@", v19];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        v22 = (objc_class *)objc_opt_class();
        v23 = NSStringFromClass(v22);
        uint64_t v24 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138544642;
        id v27 = v21;
        __int16 v28 = 2114;
        v29 = v23;
        __int16 v30 = 2048;
        uint64_t v31 = v24;
        __int16 v32 = 2114;
        v33 = @"BSNSXPCTransport.m";
        __int16 v34 = 1024;
        int v35 = 332;
        __int16 v36 = 2114;
        v37 = v20;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v20 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C75B4DCLL);
    }
    -[_BSNSXPCInvalidCallbackTracking clearPendingInvalidation](*(void *)(a1 + 40));
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __38__BSNSXPCTransport_setMessageHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__BSNSXPCTransport_setMessageHandler___block_invoke_2;
  v7[3] = &unk_1E58FC198;
  id v4 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  if (a2)
  {
    uint64_t v5 = [v7 copy];
    v6 = *(void **)(a2 + 80);
    *(void *)(a2 + 80) = v5;
  }
}

void __36__BSNSXPCTransport_setErrorHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__BSNSXPCTransport_setErrorHandler___block_invoke_2;
  v9[3] = &unk_1E58FC1E8;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 56);
  v9[4] = v4;
  id v10 = v5;
  id v6 = *(id *)(a1 + 48);
  id v11 = v6;
  if (a2)
  {
    uint64_t v7 = [v9 copy];
    id v8 = *(void **)(a2 + 88);
    *(void *)(a2 + 88) = v7;

    id v6 = v11;
  }
}

void __35__BSNSXPCTransport_setTargetQueue___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
  id v4 = a2;
  -[BSXPCServiceConnectionEventHandler setTargetQueue:]((uint64_t)v4, *(void **)(a1 + 40));
}

void __62__BSNSXPCTransport_sendMessageWithReply_onQueue_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  [*(id *)(a1 + 32) invalidate];
  if (v6)
  {
    a3 = [v6 message];
  }
  else if (a3)
  {
    a3 = (void *)MEMORY[0x1E4F14528];
    id v5 = MEMORY[0x1E4F14528];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)sendMessage:(id)a3
{
}

- (int)processIdentifier
{
  v2 = -[BSNSXPCTransport _auditToken]((uint64_t)self);
  int v3 = [v2 pid];

  return v3;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  id v4 = -[BSNSXPCTransport _auditToken]((uint64_t)self);
  id v6 = v4;
  if (v4)
  {
    [v4 realToken];
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (id)_auditToken
{
  if (a1)
  {
    v1 = -[BSXPCServiceConnection auditToken](*(os_unfair_lock_s **)(a1 + 8));
    v2 = v1;
    if (v1)
    {
      id v3 = v1;
    }
    else
    {
      id v3 = [MEMORY[0x1E4F4F6A8] invalidToken];
    }
    id v4 = v3;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void __38__BSNSXPCTransport_setMessageHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 createReply];
  int v6 = [v4 decodeBoolForKey:@"BSNSXPCReplyIsInternal"];
  uint64_t v7 = [v4 decodeXPCObjectOfType:MEMORY[0x1E4F14590] forKey:@"BSNSXPCMessage"];
  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (v6)
    {
      (*(void (**)(void, void *, void))(v8 + 16))(*(void *)(a1 + 40), v7, 0);
      [v5 send];
    }
    else
    {
      id v10 = [v5 message];
      (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v7, v10);
    }
  }
  else
  {
    id v9 = BSServiceXPCErrorsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 16);
      uint64_t v12 = [v4 message];
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      v16 = v12;
      _os_log_error_impl(&dword_19C754000, v9, OS_LOG_TYPE_ERROR, "%{public}@ failed to decode underlying message : message=%@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (os_unfair_lock_s)_initWithConnection:(void *)a3 configurator:(void *)a4 assertionProvider:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (!a1) {
    goto LABEL_12;
  }
  v26.receiver = a1;
  v26.super_class = (Class)BSNSXPCTransport;
  uint64_t v11 = (id *)[(os_unfair_lock_s *)&v26 init];
  a1 = (os_unfair_lock_s *)v11;
  if (!v11) {
    goto LABEL_12;
  }
  objc_storeStrong(v11 + 1, a2);
  uint64_t v12 = NSString;
  uint64_t v13 = *(void *)&a1[2]._os_unfair_lock_opaque;
  if (!v13)
  {
    __int16 v15 = 0;
    goto LABEL_14;
  }
  id v14 = *(id *)(v13 + 176);
  __int16 v15 = v14;
  if (!v14)
  {
LABEL_14:
    v16 = 0;
    goto LABEL_6;
  }
  v16 = (void *)*((void *)v14 + 1);
LABEL_6:
  id v17 = v16;
  uint64_t v18 = [v12 stringWithFormat:@"BSNSXPCTransport%@", v17];
  v19 = *(void **)&a1[4]._os_unfair_lock_opaque;
  *(void *)&a1[4]._os_unfair_lock_opaque = v18;

  uint64_t v20 = [v10 copy];
  id v21 = *(void **)&a1[12]._os_unfair_lock_opaque;
  *(void *)&a1[12]._os_unfair_lock_opaque = v20;

  a1[18]._os_unfair_lock_opaque = 0;
  os_unfair_lock_lock(a1 + 18);
  ((void (**)(id, os_unfair_lock_s *))v9)[2](v9, a1);
  os_unfair_lock_unlock(a1 + 18);
  LOBYTE(a1[19]._os_unfair_lock_opaque) = 0;
  v22 = *(void **)&a1[2]._os_unfair_lock_opaque;
  if (v22) {
    v22 = (void *)v22[22];
  }
  v23 = v22;
  int v24 = [v23 isNonLaunching];

  if (v24 && (*(void *)&a1[6]._os_unfair_lock_opaque || *(void *)&a1[8]._os_unfair_lock_opaque)) {
    LOBYTE(a1[19]._os_unfair_lock_opaque) = 1;
  }
LABEL_12:

  return a1;
}

- (void)sendMessageWithReply:(id)a3 onQueue:(id)a4 replyHandler:(id)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = (OS_dispatch_queue *)a4;
  id v11 = a5;
  if (!v9 || MEMORY[0x19F399FF0](v9) != MEMORY[0x1E4F14590])
  {
    objc_super v26 = [NSString stringWithFormat:@"xMessage was invalid : %@", v9];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v28 = (objc_class *)objc_opt_class();
      v29 = NSStringFromClass(v28);
      *(_DWORD *)buf = 138544642;
      id v50 = v27;
      __int16 v51 = 2114;
      v52 = v29;
      __int16 v53 = 2048;
      v54 = self;
      __int16 v55 = 2114;
      v56 = @"BSNSXPCTransport.m";
      __int16 v57 = 1024;
      int v58 = 376;
      __int16 v59 = 2114;
      v60 = v26;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C777658);
  }
  uint64_t v12 = xpc_dictionary_get_remote_connection(v9);

  if (v12)
  {
    __int16 v30 = [NSString stringWithFormat:@"cannot send a reply via sendMessageWithReply:onQueue:replyHandler:"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v32 = (objc_class *)objc_opt_class();
      v33 = NSStringFromClass(v32);
      *(_DWORD *)buf = 138544642;
      id v50 = v31;
      __int16 v51 = 2114;
      v52 = v33;
      __int16 v53 = 2048;
      v54 = self;
      __int16 v55 = 2114;
      v56 = @"BSNSXPCTransport.m";
      __int16 v57 = 1024;
      int v58 = 377;
      __int16 v59 = 2114;
      v60 = v30;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77774CLL);
  }
  if (!v10)
  {
    __int16 v34 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"queue"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v35 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v36 = (objc_class *)objc_opt_class();
      v37 = NSStringFromClass(v36);
      *(_DWORD *)buf = 138544642;
      id v50 = v35;
      __int16 v51 = 2114;
      v52 = v37;
      __int16 v53 = 2048;
      v54 = self;
      __int16 v55 = 2114;
      v56 = @"BSNSXPCTransport.m";
      __int16 v57 = 1024;
      int v58 = 378;
      __int16 v59 = 2114;
      v60 = v34;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v34 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77784CLL);
  }
  if (!v11)
  {
    uint64_t v38 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v39 = (id)objc_claimAutoreleasedReturnValue();
      v40 = (objc_class *)objc_opt_class();
      v41 = NSStringFromClass(v40);
      *(_DWORD *)buf = 138544642;
      id v50 = v39;
      __int16 v51 = 2114;
      v52 = v41;
      __int16 v53 = 2048;
      v54 = self;
      __int16 v55 = 2114;
      v56 = @"BSNSXPCTransport.m";
      __int16 v57 = 1024;
      int v58 = 379;
      __int16 v59 = 2114;
      v60 = v38;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v38 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77794CLL);
  }
  connection = self->_connection;
  if (connection) {
    connection = (BSXPCServiceConnection *)connection->_context;
  }
  id v14 = connection;
  if ([(BSXPCServiceConnection *)v14 isNonLaunching])
  {
    unsigned __int8 messageOptions = self->_messageOptions;

    if ((messageOptions & 1) == 0)
    {
      v16 = [NSString stringWithFormat:@"cannot send to non-launching services without specifying launching attributes"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v18 = (objc_class *)objc_opt_class();
        v19 = NSStringFromClass(v18);
        *(_DWORD *)buf = 138544642;
        id v50 = v17;
        __int16 v51 = 2114;
        v52 = v19;
        __int16 v53 = 2048;
        v54 = self;
        __int16 v55 = 2114;
        v56 = @"BSNSXPCTransport.m";
        __int16 v57 = 1024;
        int v58 = 380;
        __int16 v59 = 2114;
        v60 = v16;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v16 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C777448);
    }
  }
  else
  {
  }
  uint64_t v20 = -[BSXPCServiceConnection createMessageWithOptions:]((uint64_t)self->_connection, self->_messageOptions);
  [v20 encodeXPCObject:v9 forKey:@"BSNSXPCMessage"];
  targetQueue = self->_targetQueue;
  if (targetQueue != v10)
  {
    v42 = [NSString stringWithFormat:@"queue does not match configured queue : param=%@ config=%@", v10, targetQueue];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v43 = (id)objc_claimAutoreleasedReturnValue();
      v44 = (objc_class *)objc_opt_class();
      v45 = NSStringFromClass(v44);
      *(_DWORD *)buf = 138544642;
      id v50 = v43;
      __int16 v51 = 2114;
      v52 = v45;
      __int16 v53 = 2048;
      v54 = self;
      __int16 v55 = 2114;
      v56 = @"BSNSXPCTransport.m";
      __int16 v57 = 1024;
      int v58 = 385;
      __int16 v59 = 2114;
      v60 = v42;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v42 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C777A44);
  }
  v22 = -[BSNSXPCTransport _newMessageSessionWithReason:](self, @"per-async-message-with-reply");
  newValue[0] = MEMORY[0x1E4F143A8];
  newValue[1] = 3221225472;
  newValue[2] = __62__BSNSXPCTransport_sendMessageWithReply_onQueue_replyHandler___block_invoke;
  newValue[3] = &unk_1E58FC2C8;
  v23 = v22;
  id v47 = v23;
  id v25 = v11;
  id v48 = v25;
  if (v20) {
    objc_setProperty_nonatomic_copy(v20, v24, newValue, 80);
  }
  [v20 send];
}

- (id)sendMessageWithReplySync:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = v5;
  if (!v5 || MEMORY[0x19F399FF0](v5) != MEMORY[0x1E4F14590])
  {
    v23 = [NSString stringWithFormat:@"xMessage was invalid : %@", v6];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      id v25 = (objc_class *)objc_opt_class();
      objc_super v26 = NSStringFromClass(v25);
      *(_DWORD *)buf = 138544642;
      id v33 = v24;
      __int16 v34 = 2114;
      id v35 = v26;
      __int16 v36 = 2048;
      v37 = self;
      __int16 v38 = 2114;
      id v39 = @"BSNSXPCTransport.m";
      __int16 v40 = 1024;
      int v41 = 348;
      __int16 v42 = 2114;
      id v43 = v23;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C777F00);
  }
  uint64_t v7 = xpc_dictionary_get_remote_connection(v6);

  if (v7)
  {
    id v27 = [NSString stringWithFormat:@"cannot send a reply via sendMessageWithReplySync:"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      __int16 v30 = NSStringFromClass(v29);
      *(_DWORD *)buf = 138544642;
      id v33 = v28;
      __int16 v34 = 2114;
      id v35 = v30;
      __int16 v36 = 2048;
      v37 = self;
      __int16 v38 = 2114;
      id v39 = @"BSNSXPCTransport.m";
      __int16 v40 = 1024;
      int v41 = 349;
      __int16 v42 = 2114;
      id v43 = v27;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C777FF4);
  }
  connection = self->_connection;
  if (connection) {
    connection = (BSXPCServiceConnection *)connection->_context;
  }
  id v9 = connection;
  if ([(BSXPCServiceConnection *)v9 isNonLaunching])
  {
    unsigned __int8 messageOptions = self->_messageOptions;

    if ((messageOptions & 1) == 0)
    {
      id v11 = [NSString stringWithFormat:@"cannot send to non-launching services without specifying launching attributes"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = (objc_class *)objc_opt_class();
        id v14 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138544642;
        id v33 = v12;
        __int16 v34 = 2114;
        id v35 = v14;
        __int16 v36 = 2048;
        v37 = self;
        __int16 v38 = 2114;
        id v39 = @"BSNSXPCTransport.m";
        __int16 v40 = 1024;
        int v41 = 350;
        __int16 v42 = 2114;
        id v43 = v11;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v11 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C777D0CLL);
    }
  }
  else
  {
  }
  __int16 v15 = -[BSXPCServiceConnection createMessageWithOptions:]((uint64_t)self->_connection, self->_messageOptions);
  [v15 encodeXPCObject:v6 forKey:@"BSNSXPCMessage"];
  v16 = -[BSNSXPCTransport _newMessageSessionWithReason:](self, @"per-sync-message");
  id v31 = 0;
  id v17 = [v15 sendSynchronouslyWithError:&v31];
  id v18 = v31;
  [v16 invalidate];
  if (v17)
  {
    uint64_t v19 = [v17 message];
LABEL_14:
    uint64_t v20 = (void *)v19;
    goto LABEL_17;
  }
  if (!v18)
  {
    uint64_t v19 = (uint64_t)xpc_dictionary_create(0, 0, 0);
    goto LABEL_14;
  }
  uint64_t v20 = (void *)MEMORY[0x1E4F14528];
  id v21 = MEMORY[0x1E4F14528];
LABEL_17:

  return v20;
}

- (void)_newMessageSessionWithReason:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = (void *)a1[3];
    if (v4) {
      id v5 = -[BSNSXPCTransport _newAcquiredAssertionWithAttributes:](a1, v4);
    }
    else {
      id v5 = 0;
    }
    int v6 = (void *)a1[4];
    if (v6)
    {
      uint64_t v7 = [v6 acquireForReason:v3];
      id v8 = (id)v7;
      BOOL v9 = v5 != 0;
      if (v5 && v7)
      {
        id v10 = objc_alloc(MEMORY[0x1E4F4F838]);
        uint64_t v11 = a1[2];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __49__BSNSXPCTransport__newMessageSessionWithReason___block_invoke;
        v14[3] = &unk_1E58FC100;
        id v15 = v5;
        id v8 = v8;
        id v16 = v8;
        a1 = (void *)[v10 initWithIdentifier:v11 forReason:@"combiner" invalidationBlock:v14];

LABEL_14:
        goto LABEL_15;
      }
    }
    else
    {
      id v8 = 0;
      BOOL v9 = v5 != 0;
    }
    if (v9) {
      id v12 = v5;
    }
    else {
      id v12 = v8;
    }
    a1 = v12;
    goto LABEL_14;
  }
LABEL_15:

  return a1;
}

- (void)setFaultOnSuspend
{
  self->_faultOnSuspend = 1;
}

- (void)setActivateOnResume
{
  self->_activateOnResume = 1;
}

- (void)_sendMessage:(int)a3 asNotification:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  int v6 = v5;
  if (a1)
  {
    if (!v5 || MEMORY[0x19F399FF0](v5) != MEMORY[0x1E4F14590])
    {
      id v21 = [NSString stringWithFormat:@"xMessage was invalid : %@", v6];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__sendMessage_asNotification_);
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        v23 = (objc_class *)objc_opt_class();
        id v24 = NSStringFromClass(v23);
        *(_DWORD *)buf = 138544642;
        id v28 = v22;
        __int16 v29 = 2114;
        __int16 v30 = v24;
        __int16 v31 = 2048;
        uint64_t v32 = a1;
        __int16 v33 = 2114;
        __int16 v34 = @"BSNSXPCTransport.m";
        __int16 v35 = 1024;
        int v36 = 196;
        __int16 v37 = 2114;
        __int16 v38 = v21;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v21 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C77DF8CLL);
    }
    xpc_dictionary_get_remote_connection(v6);
    uint64_t v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    id v8 = v7;
    if (v7)
    {
      if (a3) {
        xpc_connection_send_notification();
      }
      else {
        xpc_connection_send_message(v7, v6);
      }
    }
    else
    {
      BOOL v9 = *(void **)(a1 + 8);
      if (v9) {
        BOOL v9 = (void *)v9[22];
      }
      id v10 = v9;
      if ([v10 isNonLaunching])
      {
        char v11 = *(unsigned char *)(a1 + 76);

        if ((v11 & 1) == 0)
        {
          id v12 = [NSString stringWithFormat:@"cannot send to non-launching services without specifying launching attributes"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel__sendMessage_asNotification_);
            id v13 = (id)objc_claimAutoreleasedReturnValue();
            id v14 = (objc_class *)objc_opt_class();
            id v15 = NSStringFromClass(v14);
            *(_DWORD *)buf = 138544642;
            id v28 = v13;
            __int16 v29 = 2114;
            __int16 v30 = v15;
            __int16 v31 = 2048;
            uint64_t v32 = a1;
            __int16 v33 = 2114;
            __int16 v34 = @"BSNSXPCTransport.m";
            __int16 v35 = 1024;
            int v36 = 206;
            __int16 v37 = 2114;
            __int16 v38 = v12;
            _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          [v12 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19C77DD4CLL);
        }
      }
      else
      {
      }
      -[BSXPCServiceConnection createMessageWithOptions:](*(void *)(a1 + 8), *(unsigned char *)(a1 + 76));
      id v16 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      [v16 encodeXPCObject:v6 forKey:@"BSNSXPCMessage"];
      if (a3) {
        id v17 = @"per-notification";
      }
      else {
        id v17 = @"per-async-message";
      }
      id v18 = -[BSNSXPCTransport _newMessageSessionWithReason:]((void *)a1, v17);
      if (v18)
      {
        [v16 encodeBool:1 forKey:@"BSNSXPCReplyIsInternal"];
        newValue[0] = MEMORY[0x1E4F143A8];
        newValue[1] = 3221225472;
        newValue[2] = __48__BSNSXPCTransport__sendMessage_asNotification___block_invoke;
        newValue[3] = &unk_1E58FC128;
        uint64_t v19 = v18;
        id v26 = v19;
        if (v16)
        {
          objc_setProperty_nonatomic_copy(v16, v20, newValue, 80);
          uint64_t v19 = v26;
        }
      }
      else if (a3 && v16)
      {
        v16[61] = 1;
      }
      [v16 send];
    }
  }
}

- (void)activate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  -[BSXPCServiceConnection activateNowOrWhenReady:]((uint64_t)self->_connection, 0);
  if (!self->_targetQueue)
  {
    id v4 = [NSString stringWithFormat:@"setTargetQueue not called before activate"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      int v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      int v8 = 138544642;
      id v9 = v5;
      __int16 v10 = 2114;
      char v11 = v7;
      __int16 v12 = 2048;
      id v13 = self;
      __int16 v14 = 2114;
      id v15 = @"BSNSXPCTransport.m";
      __int16 v16 = 1024;
      int v17 = 424;
      __int16 v18 = 2114;
      uint64_t v19 = v4;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77E248);
  }
}

- (void)setMessageHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v8 = [NSString stringWithUTF8String:"-[BSNSXPCTransport setMessageHandler:]"];
      *(_DWORD *)buf = 138544130;
      __int16 v12 = v8;
      __int16 v13 = 2114;
      __int16 v14 = @"BSNSXPCTransport.m";
      __int16 v15 = 1024;
      int v16 = 297;
      __int16 v17 = 2114;
      __int16 v18 = v7;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77E41CLL);
  }
  connection = self->_connection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__BSNSXPCTransport_setMessageHandler___block_invoke;
  v9[3] = &unk_1E58FC1C0;
  id v6 = v4;
  v9[4] = self;
  id v10 = v6;
  -[BSXPCServiceConnection configure:]((uint64_t)connection, (uint64_t)v9);
}

- (void)dealloc
{
  [(BSCompoundAssertion *)self->_refCounter invalidate];
  [(RBSAssertion *)self->_refCountedAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BSNSXPCTransport;
  [(BSNSXPCTransport *)&v3 dealloc];
}

- (void)setTargetQueue:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    int v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"queue"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = (objc_class *)objc_opt_class();
      char v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v15 = v9;
      __int16 v16 = 2114;
      __int16 v17 = v11;
      __int16 v18 = 2048;
      uint64_t v19 = self;
      __int16 v20 = 2114;
      id v21 = @"BSNSXPCTransport.m";
      __int16 v22 = 1024;
      int v23 = 414;
      __int16 v24 = 2114;
      id v25 = v8;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77E6B4);
  }
  connection = self->_connection;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __35__BSNSXPCTransport_setTargetQueue___block_invoke;
  v12[3] = &unk_1E58FC238;
  v12[4] = self;
  id v7 = v5;
  id v13 = v7;
  -[BSXPCServiceConnection configure:]((uint64_t)connection, (uint64_t)v12);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configured_invalidCallbackTracking, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong(&self->_assertionProvider, 0);
  objc_storeStrong((id *)&self->_refCountedAssertion, 0);
  objc_storeStrong((id *)&self->_refCounter, 0);
  objc_storeStrong((id *)&self->_perMessageAttributes, 0);
  objc_storeStrong((id *)&self->_explanation, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)cancel
{
  [(BSXPCServiceConnection *)self->_connection invalidate];
  if (-[_BSNSXPCInvalidCallbackTracking isInvalidationStillPending]((os_unfair_lock_s *)self->_configured_invalidCallbackTracking))
  {
    objc_super v3 = self->_configured_invalidCallbackTracking;
    connection = self->_connection;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __26__BSNSXPCTransport_cancel__block_invoke;
    v6[3] = &unk_1E58FC278;
    id v5 = v3;
    id v7 = v5;
    if (!-[BSXPCServiceConnection _asyncToConnectionQueueIfEverActivated:]((uint64_t)connection, (uint64_t)v6)) {
      -[_BSNSXPCInvalidCallbackTracking clearPendingInvalidation]((uint64_t)v5);
    }
  }
}

void __26__BSNSXPCTransport_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 16));
    objc_super v3 = (void (**)(id, void))MEMORY[0x19F399B00](*(void *)(v1 + 8));
    v2 = *(void **)(v1 + 8);
    *(void *)(v1 + 8) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 16));
    if (v3) {
      v3[2](v3, MEMORY[0x1E4F14528]);
    }
  }
}

- (void)setErrorHandler:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    __int16 v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v18 = [NSString stringWithUTF8String:"-[BSNSXPCTransport setErrorHandler:]"];
      *(_DWORD *)int v23 = 138544130;
      *(void *)&v23[4] = v18;
      *(_WORD *)&v23[12] = 2114;
      *(void *)&v23[14] = @"BSNSXPCTransport.m";
      __int16 v24 = 1024;
      int v25 = 319;
      __int16 v26 = 2114;
      id v27 = v17;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", v23, 0x26u);
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77ECACLL);
  }
  id v7 = (void *)[v5 copy];
  os_unfair_lock_lock(&self->_lock);
  int v8 = [_BSNSXPCInvalidCallbackTracking alloc];
  id v9 = v7;
  if (v8)
  {
    *(void *)int v23 = v8;
    *(void *)&v23[8] = _BSNSXPCInvalidCallbackTracking;
    int v8 = (_BSNSXPCInvalidCallbackTracking *)objc_msgSendSuper2((objc_super *)v23, sel_init);
    if (v8)
    {
      uint64_t v10 = [v9 copy];
      id lock_handler = v8->_lock_handler;
      v8->_id lock_handler = (id)v10;

      v8->_lock._os_unfair_lock_opaque = 0;
    }
  }

  connection = self->_connection;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __36__BSNSXPCTransport_setErrorHandler___block_invoke;
  v19[3] = &unk_1E58FC210;
  SEL v22 = a2;
  v19[4] = self;
  id v13 = v8;
  __int16 v20 = v13;
  id v14 = v9;
  id v21 = v14;
  -[BSXPCServiceConnection configure:]((uint64_t)connection, (uint64_t)v19);
  configured_invalidCallbackTracking = self->_configured_invalidCallbackTracking;
  self->_configured_invalidCallbackTracking = v13;
  __int16 v16 = v13;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)resume
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!self->_activateOnResume)
  {
    id v4 = [NSString stringWithFormat:@"resume is not supported on a wrapped BSServiceConnection"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v8 = 138544642;
      id v9 = v5;
      __int16 v10 = 2114;
      char v11 = v7;
      __int16 v12 = 2048;
      id v13 = self;
      __int16 v14 = 2114;
      id v15 = @"BSNSXPCTransport.m";
      __int16 v16 = 1024;
      int v17 = 448;
      __int16 v18 = 2114;
      uint64_t v19 = v4;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77EE80);
  }

  [(BSNSXPCTransport *)self activate];
}

- (void)_newAcquiredAssertionWithAttributes:(void *)a1
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    SEL v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"attributes"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__newAcquiredAssertionWithAttributes_);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v24 = (objc_class *)objc_opt_class();
      int v25 = NSStringFromClass(v24);
      *(_DWORD *)buf = 138544642;
      *(void *)&uint8_t buf[4] = v23;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v25;
      *(_WORD *)&buf[22] = 2048;
      __int16 v40 = a1;
      *(_WORD *)int v41 = 2114;
      *(void *)&v41[2] = @"BSNSXPCTransport.m";
      __int16 v42 = 1024;
      int v43 = 144;
      __int16 v44 = 2114;
      v45 = v22;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C7812B8);
  }
  uint64_t v4 = a1[1];
  if (!v4) {
    goto LABEL_29;
  }
  id v5 = *(id *)(v4 + 168);
  if (!v5)
  {
LABEL_30:
    __int16 v10 = 0;
    goto LABEL_31;
  }
  uint64_t v6 = a1[6];
  if (v6)
  {
    id v7 = (*(void (**)(uint64_t, void, id, id))(v6 + 16))(v6, a1[2], v5, v3);
  }
  else
  {
    uint64_t v35 = 0;
    int v36 = &v35;
    uint64_t v37 = 0x2050000000;
    int v8 = (void *)_MergedGlobals_3;
    uint64_t v38 = _MergedGlobals_3;
    if (!_MergedGlobals_3)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getRBSAssertionClass_block_invoke_1;
      __int16 v40 = &unk_1E58FBE80;
      *(void *)int v41 = &v35;
      __getRBSAssertionClass_block_invoke_1((uint64_t)buf);
      int v8 = (void *)v36[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v35, 8);
    id v7 = (void *)[[v9 alloc] initWithExplanation:a1[2] target:v5 attributes:v3];
  }
  __int16 v10 = v7;
  if (!v7)
  {
    __int16 v26 = [NSString stringWithFormat:@"%@ failed to create assertion : attributes=%@", a1[2], v3];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__newAcquiredAssertionWithAttributes_);
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v28 = (objc_class *)objc_opt_class();
      __int16 v29 = NSStringFromClass(v28);
      *(_DWORD *)buf = 138544642;
      *(void *)&uint8_t buf[4] = v27;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v29;
      *(_WORD *)&buf[22] = 2048;
      __int16 v40 = a1;
      *(_WORD *)int v41 = 2114;
      *(void *)&v41[2] = @"BSNSXPCTransport.m";
      __int16 v42 = 1024;
      int v43 = 155;
      __int16 v44 = 2114;
      v45 = v26;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C7813B4);
  }
  id v34 = 0;
  char v11 = [v7 acquireWithError:&v34];
  id v12 = v34;
  id v13 = v12;
  if (v11) {
    goto LABEL_21;
  }
  __int16 v14 = [v12 domain];
  uint64_t v35 = 0;
  int v36 = &v35;
  uint64_t v37 = 0x2020000000;
  id v15 = (id *)qword_1EB27F7D8;
  uint64_t v38 = qword_1EB27F7D8;
  if (!qword_1EB27F7D8)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getRBSAssertionErrorDomainSymbolLoc_block_invoke_0;
    __int16 v40 = &unk_1E58FBE80;
    *(void *)int v41 = &v35;
    __int16 v16 = RunningBoardServicesLibrary_1();
    int v17 = dlsym(v16, "RBSAssertionErrorDomain");
    *(void *)(*(void *)(*(void *)v41 + 8) + 24) = v17;
    qword_1EB27F7D8 = *(void *)(*(void *)(*(void *)v41 + 8) + 24);
    id v15 = (id *)v36[3];
  }
  _Block_object_dispose(&v35, 8);
  if (!v15)
  {
    __int16 v30 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v31 = [NSString stringWithUTF8String:"NSString *getRBSAssertionErrorDomain(void)"];
    objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, @"BSNSXPCTransport.m", 32, @"%s", dlerror());

    __break(1u);
LABEL_29:
    id v5 = 0;
    goto LABEL_30;
  }
  id v18 = *v15;
  if ([v14 isEqualToString:v18])
  {
    BOOL v19 = [v13 code] == 4;

    if (v19)
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __56__BSNSXPCTransport__newAcquiredAssertionWithAttributes___block_invoke;
      v33[3] = &unk_1E58FC2A0;
      v33[4] = a1;
      v33[5] = v13;
      v33[6] = v3;
      v33[7] = sel__newAcquiredAssertionWithAttributes_;
      __56__BSNSXPCTransport__newAcquiredAssertionWithAttributes___block_invoke((uint64_t)v33);
    }
  }
  else
  {
  }
  uint64_t v20 = BSServiceXPCErrorsLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = a1[2];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v21;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2114;
    __int16 v40 = v3;
    _os_log_error_impl(&dword_19C754000, v20, OS_LOG_TYPE_ERROR, "%{public}@ failed to acquire assertion : error=%{public}@ attributes=%{public}@", buf, 0x20u);
  }

LABEL_21:
LABEL_31:

  return v10;
}

void __56__BSNSXPCTransport__newAcquiredAssertionWithAttributes___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [NSString stringWithFormat:@"%@ failed to acquire assertion : error=%@  attributes=%@", *(void *)(*(void *)(a1 + 32) + 16), *(void *)(a1 + 40), *(void *)(a1 + 48)];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138544642;
    id v8 = v3;
    __int16 v9 = 2114;
    __int16 v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    __int16 v14 = @"BSNSXPCTransport.m";
    __int16 v15 = 1024;
    int v16 = 161;
    __int16 v17 = 2114;
    id v18 = v2;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v2 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

uint64_t __49__BSNSXPCTransport__newMessageSessionWithReason___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  v2 = *(void **)(a1 + 40);

  return [v2 invalidate];
}

uint64_t __48__BSNSXPCTransport__sendMessage_asNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)setPerMessageAssertionAttributes:(id)a3
{
  id v11 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ([v11 count])
  {
    connection = self->_connection;
    if (connection) {
      connection = (BSXPCServiceConnection *)connection->_context;
    }
    id v5 = connection;
    int v6 = [(BSXPCServiceConnection *)v5 isNonLaunching];

    if (v6)
    {
      id v7 = [getRBSConstraintsAttributeClass() attributeWithConstraints:7];
      id v8 = [v11 arrayByAddingObject:v7];
      perMessageAttributes = self->_perMessageAttributes;
      self->_perMessageAttributes = v8;
    }
    else
    {
      __int16 v10 = (NSArray *)[v11 copy];
      id v7 = self->_perMessageAttributes;
      self->_perMessageAttributes = v10;
    }
  }
  else
  {
    id v7 = self->_perMessageAttributes;
    self->_perMessageAttributes = 0;
  }
}

- (void)setRefCountedAssertionAttributes:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ([v4 count])
  {
    connection = self->_connection;
    if (connection) {
      connection = (BSXPCServiceConnection *)connection->_context;
    }
    int v6 = connection;
    int v7 = [(BSXPCServiceConnection *)v6 isNonLaunching];

    if (v7) {
      [getRBSConstraintsAttributeClass() attributeWithConstraints:7];
    }
    else {
    id v8 = [getRBSConstraintsAttributeClass() attributeWithConstraints:4];
    }
    __int16 v10 = [v4 arrayByAddingObject:v8];

    objc_initWeak(&location, self);
    id v11 = (void *)MEMORY[0x1E4F4F6E8];
    explanation = self->_explanation;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__BSNSXPCTransport_setRefCountedAssertionAttributes___block_invoke;
    v15[3] = &unk_1E58FC150;
    objc_copyWeak(&v17, &location);
    id v4 = v10;
    id v16 = v4;
    __int16 v13 = [v11 assertionWithIdentifier:explanation stateDidChangeHandler:v15];
    refCounter = self->_refCounter;
    self->_refCounter = v13;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    [(BSCompoundAssertion *)self->_refCounter invalidate];
    __int16 v9 = self->_refCounter;
    self->_refCounter = 0;
  }
}

void __53__BSNSXPCTransport_setRefCountedAssertionAttributes___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int v4 = [v8 isActive];
    id v5 = (void *)WeakRetained[5];
    if (v4)
    {
      if (v5) {
        goto LABEL_8;
      }
      int v6 = -[BSNSXPCTransport _newAcquiredAssertionWithAttributes:](WeakRetained, *(void **)(a1 + 32));
    }
    else
    {
      if (!v5) {
        goto LABEL_8;
      }
      [v5 invalidate];
      int v6 = 0;
    }
    int v7 = (void *)WeakRetained[5];
    WeakRetained[5] = v6;
  }
LABEL_8:
}

- (id)newExternalMessageSessionWithReason:(id)a3
{
  id v4 = a3;
  id v5 = -[BSNSXPCTransport _newMessageSessionWithReason:](self, v4);
  int v6 = v5;
  if (v5) {
    int v7 = v5;
  }
  else {
    int v7 = (void *)[objc_alloc(MEMORY[0x1E4F4F838]) initWithIdentifier:self->_explanation forReason:v4 invalidationBlock:&__block_literal_global];
  }
  id v8 = v7;

  return v8;
}

- (void)sendNotification:(id)a3
{
}

- (void)sendBarrierBlock:(id)a3
{
}

- (void)suspend
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_faultOnSuspend)
  {
    int v7 = [NSString stringWithFormat:@"suspend is not supported on a wrapped BSServiceConnection"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v8 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
      __int16 v9 = (objc_class *)objc_opt_class();
      __int16 v10 = NSStringFromClass(v9);
      int v11 = 138544642;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      __int16 v14 = v10;
      __int16 v15 = 2048;
      id v16 = self;
      __int16 v17 = 2114;
      id v18 = @"BSNSXPCTransport.m";
      __int16 v19 = 1024;
      int v20 = 440;
      __int16 v21 = 2114;
      SEL v22 = v7;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C781DF0);
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_faultedOnSuspend)
  {
    os_log_type_t v3 = OS_LOG_TYPE_ERROR;
  }
  else
  {
    self->_lock_faultedOnSuspend = 1;
    os_log_type_t v3 = OS_LOG_TYPE_FAULT;
  }
  os_unfair_lock_unlock(&self->_lock);
  id v4 = BSServiceXPCErrorsLog();
  if (os_log_type_enabled(v4, v3))
  {
    explanation = self->_explanation;
    int v11 = 138543362;
    uint64_t v12 = explanation;
    _os_log_impl(&dword_19C754000, v4, v3, "%{public}@ cannot suspend this type of transport", (uint8_t *)&v11, 0xCu);
  }
}

- (int)auditSessionIdentifier
{
  v2 = -[BSNSXPCTransport _auditToken]((uint64_t)self);
  int v3 = [v2 asid];

  return v3;
}

- (unsigned)effectiveUserIdentifier
{
  v2 = -[BSNSXPCTransport _auditToken]((uint64_t)self);
  unsigned int v3 = [v2 euid];

  return v3;
}

- (unsigned)effectiveGroupIdentifier
{
  v2 = -[BSNSXPCTransport _auditToken]((uint64_t)self);
  unsigned int v3 = [v2 egid];

  return v3;
}

@end