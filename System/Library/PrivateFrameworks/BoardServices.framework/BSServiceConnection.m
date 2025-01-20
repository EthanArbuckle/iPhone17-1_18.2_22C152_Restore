@interface BSServiceConnection
+ (BSServiceConnectionContext)currentContext;
+ (id)NSXPCConnectionWithEndpoint:(id)a3 clientContextBuilder:(id)a4 configurator:(id)a5;
+ (id)NSXPCConnectionWithEndpoint:(id)a3 configurator:(id)a4;
+ (id)_connectionFromIncomingConnection:(char)a3 requiresMessagingAfterHandshake:;
+ (id)_connectionWithEndpoint:(uint64_t)a3 clientContextBuilder:;
+ (id)_currentConnection;
+ (id)connectionWithEndpoint:(id)a3;
+ (id)connectionWithEndpoint:(id)a3 clientContextBuilder:(id)a4;
- (BSAuditToken)remoteToken;
- (BSProcessHandle)remoteProcess;
- (BSServiceConnection)init;
- (BSServiceConnectionMessageBatching)activeMessageBatch;
- (NSCopying)userInfo;
- (NSString)description;
- (NSString)instance;
- (NSString)service;
- (RBSTarget)remoteAssertionTarget;
- (id)_clientContext;
- (id)_extractUnderlyingConnection;
- (id)_initWithConnection:(void *)a3 service:(void *)a4 instance:(char)a5 requiresMessagingAfterHandshake:(void *)a6 clientContext:;
- (id)createMessage;
- (id)createMessageWithCompletion:(id)a3;
- (id)extractNSXPCConnectionWithConfigurator:(id)a3;
- (id)remoteTarget;
- (id)remoteTargetWithAssertionAttributes:(id)a3;
- (id)remoteTargetWithLaunchingAssertionAttributes:(id)a3;
- (void)_configureConnection:(id)a3;
- (void)activate;
- (void)configureConnection:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation BSServiceConnection

- (id)remoteTarget
{
  return -[BSXPCServiceConnection remoteTargetWithAssertionAttributes:enforcingLaunchConstraints:]((os_unfair_lock_s *)self->_connection, 0, 0);
}

+ (BSServiceConnectionContext)currentContext
{
  return (BSServiceConnectionContext *)+[BSServiceConnection _currentConnection]();
}

- (BSAuditToken)remoteToken
{
  return (BSAuditToken *)-[BSXPCServiceConnection auditToken]((os_unfair_lock_s *)self->_connection);
}

void __31__BSServiceConnection_activate__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __31__BSServiceConnection_activate__block_invoke_4(uint64_t a1, os_unfair_lock_s *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  +[BSServiceConnection _currentConnection]();
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v4 = NSString;
    v5 = -[BSXPCServiceConnection _stateDump](a2);
    v6 = +[BSXPCServiceConnection currentContext]();
    v7 = -[BSXPCServiceConnection _eventHandler](a2);
    uint64_t v8 = -[BSXPCServiceConnection _eventHandler](a2);
    v9 = (void *)v8;
    if (v8) {
      v10 = *(void **)(v8 + 144);
    }
    else {
      v10 = 0;
    }
    id v11 = v10;
    v12 = [MEMORY[0x1E4F29060] currentThread];
    v13 = [MEMORY[0x1E4F29060] currentThread];
    v14 = [v13 threadDictionary];
    v15 = [v4 stringWithFormat:@"%@: _currentConnection is nil in activation handler : context=%@ : eventHandler=%@ : name=%@ : t=%@ : tls=%@", v5, v6, v7, v11, v12, v14];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v16 = [NSString stringWithUTF8String:"-[BSServiceConnection activate]_block_invoke_4"];
      *(_DWORD *)buf = 138544130;
      v19 = v16;
      __int16 v20 = 2114;
      v21 = @"BSServiceConnection.m";
      __int16 v22 = 1024;
      int v23 = 371;
      __int16 v24 = 2114;
      v25 = v15;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C75B7B4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BSServiceConnectionMessageBatching)activeMessageBatch
{
  return (BSServiceConnectionMessageBatching *)-[BSXPCServiceConnection activeMessageBatch]((id *)&self->_connection->super.isa);
}

- (NSCopying)userInfo
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_userInfo;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

+ (id)_connectionWithEndpoint:(uint64_t)a3 clientContextBuilder:
{
  self;
  v5 = [(id)a2 service];
  if (!v5) {
    goto LABEL_12;
  }
  if (![(id)a2 isNullEndpoint])
  {
    v12 = +[BSServiceManager sharedInstanceCreatingIfNecessary:]((uint64_t)BSServiceManager, 1);
    if (a2)
    {
      id v13 = *(id *)(a2 + 40);
      v14 = *(void **)(a2 + 48);
    }
    else
    {
      id v13 = 0;
      v14 = 0;
    }
    id v15 = v14;
    char v16 = [(id)a2 isNonLaunching];
    if (a2) {
      uint64_t v17 = *(unsigned int *)(a2 + 16);
    }
    else {
      uint64_t v17 = 0;
    }
    v18 = [(id)a2 targetDescription];
    v6 = (void *)-[BSServiceManager newConnectionWithEndpoint:oneshot:nonLaunching:targetPID:description:]((uint64_t)v12, v13, v15, v16, v17, v18);

    if (v6) {
      goto LABEL_4;
    }
LABEL_12:
    id v11 = 0;
    goto LABEL_13;
  }
  v6 = +[BSXPCServiceConnection nullConnection]();
  if (!v6) {
    goto LABEL_12;
  }
LABEL_4:
  v7 = [MEMORY[0x1E4F4F870] coder];
  if (a3) {
    (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v7);
  }
  uint64_t v8 = [BSServiceConnection alloc];
  v9 = [(id)a2 instance];
  v10 = [v7 createMessage];
  id v11 = -[BSServiceConnection _initWithConnection:service:instance:requiresMessagingAfterHandshake:clientContext:]((id *)&v8->super.isa, v6, v5, v9, 0, v10);

LABEL_13:

  return v11;
}

- (id)_initWithConnection:(void *)a3 service:(void *)a4 instance:(char)a5 requiresMessagingAfterHandshake:(void *)a6 clientContext:
{
  v6 = a1;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!a2)
    {
      v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"connection"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithConnection_service_instance_requiresMessagingAfterHandshake_clientContext_);
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        v32 = (objc_class *)objc_opt_class();
        v33 = NSStringFromClass(v32);
        *(_DWORD *)v43 = 138544642;
        *(void *)&v43[4] = v31;
        *(_WORD *)&v43[12] = 2114;
        *(void *)&v43[14] = v33;
        __int16 v44 = 2048;
        v45 = v6;
        __int16 v46 = 2114;
        v47 = @"BSServiceConnection.m";
        __int16 v48 = 1024;
        int v49 = 185;
        __int16 v50 = 2114;
        v51 = v30;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v43, 0x3Au);
      }
      [v30 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C75FED4);
    }
    id v11 = a3;
    NSClassFromString(&cfstr_Nsstring.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v34 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithConnection_service_instance_requiresMessagingAfterHandshake_clientContext_);
        id v35 = (id)objc_claimAutoreleasedReturnValue();
        v36 = (objc_class *)objc_opt_class();
        v37 = NSStringFromClass(v36);
        *(_DWORD *)v43 = 138544642;
        *(void *)&v43[4] = v35;
        *(_WORD *)&v43[12] = 2114;
        *(void *)&v43[14] = v37;
        __int16 v44 = 2048;
        v45 = v6;
        __int16 v46 = 2114;
        v47 = @"BSServiceConnection.m";
        __int16 v48 = 1024;
        int v49 = 186;
        __int16 v50 = 2114;
        v51 = v34;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v43, 0x3Au);
      }
      [v34 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C75FFD4);
    }

    id v12 = a4;
    if (v12)
    {
      NSClassFromString(&cfstr_Nsstring.isa);
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v38 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithConnection_service_instance_requiresMessagingAfterHandshake_clientContext_);
          id v39 = (id)objc_claimAutoreleasedReturnValue();
          v40 = (objc_class *)objc_opt_class();
          v41 = NSStringFromClass(v40);
          *(_DWORD *)v43 = 138544642;
          *(void *)&v43[4] = v39;
          *(_WORD *)&v43[12] = 2114;
          *(void *)&v43[14] = v41;
          __int16 v44 = 2048;
          v45 = v6;
          __int16 v46 = 2114;
          v47 = @"BSServiceConnection.m";
          __int16 v48 = 1024;
          int v49 = 187;
          __int16 v50 = 2114;
          v51 = v38;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v43, 0x3Au);
        }
        [v38 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C7600D4);
      }
    }

    v42.receiver = v6;
    v42.super_class = (Class)BSServiceConnection;
    id v13 = (id *)objc_msgSendSuper2(&v42, sel_init);
    v6 = v13;
    if (v13)
    {
      objc_storeStrong(v13 + 1, a2);
      uint64_t v14 = [v11 copy];
      id v15 = v6[8];
      v6[8] = (id)v14;

      uint64_t v16 = [v12 copy];
      id v17 = v6[9];
      v6[9] = (id)v16;

      id v18 = v6[8];
      id v19 = v6[9];
      self;
      __int16 v20 = [MEMORY[0x1E4F28E78] stringWithString:@"BSCnx:"];
      v21 = v20;
      if (a6) {
        __int16 v22 = @"client:";
      }
      else {
        __int16 v22 = @"host:";
      }
      [v20 appendString:v22];
      [v21 appendString:v18];
      if (v19)
      {
        [v21 appendString:@":"];
        [v21 appendString:v19];
      }
      uint64_t v23 = [v21 copy];

      id v24 = v6[2];
      v6[2] = (id)v23;

      *((_DWORD *)v6 + 8) = 0;
      *((unsigned char *)v6 + 58) = a5;
      v25 = [_BSServiceConnectionConfiguration alloc];
      if (v25)
      {
        *(void *)v43 = v25;
        *(void *)&v43[8] = _BSServiceConnectionConfiguration;
        uint64_t v26 = (id *)objc_msgSendSuper2((objc_super *)v43, sel_init);
        v27 = v26;
        if (v26)
        {
          v26[1] = v6 + 4;
          objc_storeStrong(v26 + 2, a6);
        }
      }
      else
      {
        v27 = 0;
      }
      id v28 = v6[5];
      v6[5] = v27;
    }
  }
  return v6;
}

void __31__BSServiceConnection_activate__block_invoke(uint64_t a1, void *a2)
{
  v4 = [MEMORY[0x1E4F4F880] referenceWithObject:*(void *)(a1 + 32)];
  -[BSXPCServiceConnectionEventHandler setContext:]((uint64_t)a2, v4);

  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 40);
  if (v6[2])
  {
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __31__BSServiceConnection_activate__block_invoke_2;
    v78[3] = &unk_1E58FC318;
    v78[4] = v5;
    -[BSXPCServiceConnectionEventHandler encodeInitiatingContext:]((uint64_t)a2, (uint64_t)v78);
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 40);
  }
  v7 = (void *)v6[4];
  if (!v7) {
    v7 = *(void **)(v5 + 16);
  }
  if (a2)
  {
    uint64_t v8 = [v7 copy];
    v9 = (void *)a2[18];
    a2[18] = v8;

    uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 40) + 40) copy];
    id v11 = (void *)a2[21];
    a2[21] = v10;

    v6 = *(void **)(*(void *)(a1 + 32) + 40);
    id v12 = (void *)v6[6];
    if (v12)
    {
      uint64_t v13 = [v12 copy];
      uint64_t v14 = (void *)a2[22];
      a2[22] = v13;

      v6 = *(void **)(*(void *)(a1 + 32) + 40);
    }
  }
  id v15 = (void *)v6[7];
  if (v15)
  {
    -[BSXPCServiceConnectionEventHandler setInterfaceTarget:]((uint64_t)a2, v15);
    v6 = *(void **)(*(void *)(a1 + 32) + 40);
  }
  uint64_t v16 = (void *)v6[11];
  if (v16)
  {
    -[BSXPCServiceConnectionEventHandler setTargetQueue:]((uint64_t)a2, v16);
    v6 = *(void **)(*(void *)(a1 + 32) + 40);
  }
  id v17 = (void *)v6[12];
  if (v17)
  {
    -[BSXPCServiceConnectionEventHandler setTargetDispatchingQueue:]((uint64_t)a2, v17);
    v6 = *(void **)(*(void *)(a1 + 32) + 40);
  }
  id v18 = (void *)MEMORY[0x19F399B00](v6[13]);
  if (v18)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __31__BSServiceConnection_activate__block_invoke_3;
    v74[3] = &unk_1E58FC340;
    objc_copyWeak(&v76, &location);
    id v19 = v18;
    id v75 = v19;
    if (a2)
    {
      uint64_t v20 = [v74 copy];
      v21 = (void *)a2[15];
      a2[15] = v20;

      id v19 = v75;
    }

    objc_destroyWeak(&v76);
    objc_destroyWeak(&location);
  }
  uint64_t v22 = *(void *)(a1 + 32);
  uint64_t v23 = *(void *)(v22 + 40);
  id v24 = *(void **)(v23 + 112);
  if (v24)
  {
    if (a2)
    {
      uint64_t v25 = [v24 copy];
      uint64_t v26 = (void *)a2[10];
      a2[10] = v25;

      uint64_t v27 = *(void *)(a1 + 32);
      if (*(void *)(*(void *)(v27 + 40) + 120))
      {
        *(unsigned char *)(v27 + 57) = 1;
LABEL_24:
        uint64_t v28 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 40) + 120) copy];
        v29 = (void *)a2[11];
        a2[11] = v28;
      }
    }
    else if (*(void *)(v23 + 120))
    {
      *(unsigned char *)(v22 + 57) = 1;
    }
  }
  else if (*(void *)(v23 + 120))
  {
    *(unsigned char *)(v22 + 57) = 1;
    if (a2) {
      goto LABEL_24;
    }
  }
  char v30 = [*(id *)(a1 + 40) isServer];
  uint64_t v31 = *(void *)(a1 + 32);
  if ((v30 & 1) != 0 || *(unsigned char *)(v31 + 57))
  {
    v32 = *(void **)(v31 + 40);
    if (v32[8])
    {
      v33 = (void *)MEMORY[0x19F399B00]();
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = __31__BSServiceConnection_activate__block_invoke_4;
      v72[3] = &unk_1E58FC368;
      v73 = v33;
      id v34 = v33;
      id v35 = v34;
      if (a2)
      {
        uint64_t v36 = [v72 copy];
        v37 = (void *)a2[12];
        a2[12] = v36;

        id v35 = v73;
      }

      v32 = *(void **)(*(void *)(a1 + 32) + 40);
    }
    if (v32[9])
    {
      v38 = (void *)MEMORY[0x19F399B00]();
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = __31__BSServiceConnection_activate__block_invoke_172;
      v70[3] = &unk_1E58FC368;
      v71 = v38;
      id v39 = v38;
      v40 = v39;
      if (a2)
      {
        uint64_t v41 = [v70 copy];
        objc_super v42 = (void *)a2[13];
        a2[13] = v41;

        v40 = v71;
      }

      v32 = *(void **)(*(void *)(a1 + 32) + 40);
    }
    v43 = (void *)MEMORY[0x19F399B00](v32[10]);
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __31__BSServiceConnection_activate__block_invoke_176;
    v68[3] = &unk_1E58FC390;
    v68[4] = *(void *)(a1 + 32);
    v69 = v43;
    id v44 = v43;
    v45 = v44;
    if (a2)
    {
      uint64_t v46 = [v68 copy];
      v47 = (void *)a2[14];
      a2[14] = v46;

      v45 = v69;
    }
  }
  else
  {
    __int16 v48 = *(void **)(v31 + 40);
    if (v48[8])
    {
      int v49 = (void *)MEMORY[0x19F399B00]();
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __31__BSServiceConnection_activate__block_invoke_180;
      v66[3] = &unk_1E58FC368;
      v67 = v49;
      id v50 = v49;
      v51 = v50;
      if (a2)
      {
        uint64_t v52 = [v66 copy];
        v53 = (void *)a2[12];
        a2[12] = v52;

        v51 = v67;
      }

      __int16 v48 = *(void **)(*(void *)(a1 + 32) + 40);
    }
    if (v48[9])
    {
      v54 = (void *)MEMORY[0x19F399B00]();
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __31__BSServiceConnection_activate__block_invoke_181;
      v64[3] = &unk_1E58FC368;
      v65 = v54;
      id v55 = v54;
      v56 = v55;
      if (a2)
      {
        uint64_t v57 = [v64 copy];
        v58 = (void *)a2[13];
        a2[13] = v57;

        v56 = v65;
      }

      __int16 v48 = *(void **)(*(void *)(a1 + 32) + 40);
    }
    v59 = (void *)MEMORY[0x19F399B00](v48[10]);
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __31__BSServiceConnection_activate__block_invoke_182;
    v62[3] = &unk_1E58FC368;
    v63 = v59;
    id v44 = v59;
    v45 = v44;
    if (a2)
    {
      uint64_t v60 = [v62 copy];
      v61 = (void *)a2[14];
      a2[14] = v60;

      v45 = v63;
    }
  }
}

uint64_t __31__BSServiceConnection_activate__block_invoke_2(uint64_t a1, void *a2)
{
  [a2 encodeObject:*(void *)(*(void *)(a1 + 32) + 64) forKey:@"s"];
  [a2 encodeObject:*(void *)(*(void *)(a1 + 32) + 72) forKey:@"i"];
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 16);

  return [a2 encodeXPCObject:v4 forKey:@"clientContext"];
}

+ (id)connectionWithEndpoint:(id)a3 clientContextBuilder:(id)a4
{
  return +[BSServiceConnection _connectionWithEndpoint:clientContextBuilder:]((uint64_t)BSServiceConnection, (uint64_t)a3, (uint64_t)a4);
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = -[BSXPCServiceConnection name]((os_unfair_lock_s *)self->_connection);
  uint64_t v5 = [v3 stringWithFormat:@"<%@:%p>", v4, self];

  return (NSString *)v5;
}

- (void)activate
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_config)
  {
    connection = self->_connection;
    if (connection) {
      connection = (BSXPCServiceConnection *)connection->_context;
    }
    v6 = connection;
    lock_config = self->_lock_config;
    if (!lock_config->_serviceQuality)
    {
      uint64_t v26 = [NSString stringWithFormat:@"serviceQuality must be specified before activation"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        *(_DWORD *)buf = 138544642;
        id v53 = v27;
        __int16 v54 = 2114;
        id v55 = v29;
        __int16 v56 = 2048;
        uint64_t v57 = self;
        __int16 v58 = 2114;
        v59 = @"BSServiceConnection.m";
        __int16 v60 = 1024;
        int v61 = 298;
        __int16 v62 = 2114;
        v63 = v26;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v26 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C764D10);
    }
    interface = lock_config->_interface;
    if (interface)
    {
      v9 = [(BSServiceInterface *)interface identifier];
      if (v9 && ![(NSString *)self->_service isEqualToString:v9])
      {
        char v30 = [NSString stringWithFormat:@"interface's identifier doesn't match our service"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          id v31 = (id)objc_claimAutoreleasedReturnValue();
          v32 = (objc_class *)objc_opt_class();
          v33 = NSStringFromClass(v32);
          *(_DWORD *)buf = 138544642;
          id v53 = v31;
          __int16 v54 = 2114;
          id v55 = v33;
          __int16 v56 = 2048;
          uint64_t v57 = self;
          __int16 v58 = 2114;
          v59 = @"BSServiceConnection.m";
          __int16 v60 = 1024;
          int v61 = 302;
          __int16 v62 = 2114;
          v63 = v30;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v30 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C764E04);
      }
      if (self->_requiresMessagingAfterHandshake
        && [(BSServiceInterface *)self->_lock_config->_interface clientMessagingExpectation] != 1)
      {
        id v34 = [NSString stringWithFormat:@"incompatible clientMessagingExpectation for this connection"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          id v35 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v36 = (objc_class *)objc_opt_class();
          v37 = NSStringFromClass(v36);
          *(_DWORD *)buf = 138544642;
          id v53 = v35;
          __int16 v54 = 2114;
          id v55 = v37;
          __int16 v56 = 2048;
          uint64_t v57 = self;
          __int16 v58 = 2114;
          v59 = @"BSServiceConnection.m";
          __int16 v60 = 1024;
          int v61 = 304;
          __int16 v62 = 2114;
          v63 = v34;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v34 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C764EF8);
      }
      int v10 = [(BSXPCServiceConnection *)v6 isClient];
      id v11 = self->_lock_config->_interface;
      if (v10) {
        [(BSServiceInterface *)v11 client];
      }
      else {
      uint64_t v16 = [(BSServiceInterface *)v11 server];
      }
      id v17 = [v16 methods];
      uint64_t v18 = [v17 count];

      if (v18 && !self->_lock_config->_target)
      {
        v38 = [NSString stringWithFormat:@"target must be specified if the local interface is not empty"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          id v39 = (id)objc_claimAutoreleasedReturnValue();
          v40 = (objc_class *)objc_opt_class();
          NSStringFromClass(v40);
          *(_DWORD *)buf = 138544642;
          id v53 = v39;
          uint64_t v41 = v54 = 2114;
          id v55 = v41;
          __int16 v56 = 2048;
          uint64_t v57 = self;
          __int16 v58 = 2114;
          v59 = @"BSServiceConnection.m";
          __int16 v60 = 1024;
          int v61 = 308;
          __int16 v62 = 2114;
          v63 = v38;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v38 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C764FECLL);
      }

      lock_config = self->_lock_config;
    }
    else
    {
      if (lock_config->_target)
      {
        uint64_t v22 = [NSString stringWithFormat:@"interface must be specified if you specified a target"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          id v23 = (id)objc_claimAutoreleasedReturnValue();
          id v24 = (objc_class *)objc_opt_class();
          uint64_t v25 = NSStringFromClass(v24);
          *(_DWORD *)buf = 138544642;
          id v53 = v23;
          __int16 v54 = 2114;
          id v55 = v25;
          __int16 v56 = 2048;
          uint64_t v57 = self;
          __int16 v58 = 2114;
          v59 = @"BSServiceConnection.m";
          __int16 v60 = 1024;
          int v61 = 300;
          __int16 v62 = 2114;
          v63 = v22;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v22 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C764C1CLL);
      }
      if (!lock_config->_messageHandler)
      {
        uint64_t v46 = [NSString stringWithFormat:@"some form of interface handler must be specified before activation"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          id v47 = (id)objc_claimAutoreleasedReturnValue();
          __int16 v48 = (objc_class *)objc_opt_class();
          int v49 = NSStringFromClass(v48);
          *(_DWORD *)buf = 138544642;
          id v53 = v47;
          __int16 v54 = 2114;
          id v55 = v49;
          __int16 v56 = 2048;
          uint64_t v57 = self;
          __int16 v58 = 2114;
          v59 = @"BSServiceConnection.m";
          __int16 v60 = 1024;
          int v61 = 311;
          __int16 v62 = 2114;
          v63 = v46;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v46 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C7651D4);
      }
      if (self->_requiresMessagingAfterHandshake)
      {
        id v12 = [NSString stringWithFormat:@"raw message handlers aren't supported on this connection"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          id v13 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v14 = (objc_class *)objc_opt_class();
          id v15 = NSStringFromClass(v14);
          *(_DWORD *)buf = 138544642;
          id v53 = v13;
          __int16 v54 = 2114;
          id v55 = v15;
          __int16 v56 = 2048;
          uint64_t v57 = self;
          __int16 v58 = 2114;
          v59 = @"BSServiceConnection.m";
          __int16 v60 = 1024;
          int v61 = 312;
          __int16 v62 = 2114;
          v63 = v12;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v12 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C764A14);
      }
    }
    if (!lock_config->_invalidationHandler && !lock_config->_errorHandler)
    {
      objc_super v42 = [NSString stringWithFormat:@"you must configure an invalidation handler"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v43 = (id)objc_claimAutoreleasedReturnValue();
        id v44 = (objc_class *)objc_opt_class();
        v45 = NSStringFromClass(v44);
        *(_DWORD *)buf = 138544642;
        id v53 = v43;
        __int16 v54 = 2114;
        id v55 = v45;
        __int16 v56 = 2048;
        uint64_t v57 = self;
        __int16 v58 = 2114;
        v59 = @"BSServiceConnection.m";
        __int16 v60 = 1024;
        int v61 = 314;
        __int16 v62 = 2114;
        v63 = v42;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v42 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C7650E0);
    }
    id v19 = self->_connection;
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __31__BSServiceConnection_activate__block_invoke;
    v50[3] = &unk_1E58FC238;
    v50[4] = self;
    uint64_t v20 = v6;
    v51 = v20;
    -[BSXPCServiceConnection configure:]((uint64_t)v19, (uint64_t)v50);
    v21 = self->_lock_config;
    self->_lock_config = 0;
  }
  -[BSXPCServiceConnection activateNowOrWhenReady:]((uint64_t)self->_connection, 0);
  os_unfair_lock_unlock(p_lock);
}

void __51__BSServiceConnection__extractUnderlyingConnection__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__BSServiceConnection__extractUnderlyingConnection__block_invoke_2;
    v7[3] = &unk_1E58FC3B8;
    v7[4] = *(void *)(a1 + 40);
    id v8 = v4;
    -[BSXPCServiceConnectionEventHandler encodeInitiatingContext:](a2, (uint64_t)v7);
  }
  if (a2)
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 16) copy];
    v6 = *(void **)(a2 + 144);
    *(void *)(a2 + 144) = v5;
  }
}

uint64_t __51__BSServiceConnection__extractUnderlyingConnection__block_invoke_2(uint64_t a1, void *a2)
{
  [a2 encodeObject:*(void *)(*(void *)(a1 + 32) + 64) forKey:@"s"];
  [a2 encodeObject:*(void *)(*(void *)(a1 + 32) + 72) forKey:@"i"];
  uint64_t v4 = *(void *)(a1 + 40);

  return [a2 encodeXPCObject:v4 forKey:@"clientContext"];
}

- (void)configureConnection:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__BSServiceConnection_configureConnection___block_invoke;
  v3[3] = &unk_1E58FC2F0;
  v3[4] = a3;
  [(BSServiceConnection *)self _configureConnection:v3];
}

- (void)_configureConnection:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_config)
  {
    v7 = [NSString stringWithFormat:@"configure called after activation or invalidation"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      int v10 = NSStringFromClass(v9);
      int v11 = 138544642;
      id v12 = v8;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      __int16 v15 = 2048;
      uint64_t v16 = self;
      __int16 v17 = 2114;
      uint64_t v18 = @"BSServiceConnection.m";
      __int16 v19 = 1024;
      int v20 = 477;
      __int16 v21 = 2114;
      uint64_t v22 = v7;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C768490);
  }
  (*((void (**)(id))a3 + 2))(a3);
  objc_storeStrong((id *)&self->_userInfo, self->_lock_config->_userInfo);

  os_unfair_lock_unlock(p_lock);
}

uint64_t __43__BSServiceConnection_configureConnection___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_lock_activatedSignal, 0);
  objc_storeStrong((id *)&self->_lock_config, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (BSProcessHandle)remoteProcess
{
  v2 = -[BSXPCServiceConnection peer]((os_unfair_lock_s *)self->_connection);
  v3 = v2;
  if (v2) {
    v2 = (void *)v2[4];
  }
  uint64_t v4 = v2;

  return v4;
}

- (id)remoteTargetWithLaunchingAssertionAttributes:(id)a3
{
  return -[BSXPCServiceConnection remoteTargetWithAssertionAttributes:enforcingLaunchConstraints:]((os_unfair_lock_s *)self->_connection, a3, 1);
}

- (id)createMessage
{
  return -[BSXPCServiceConnection createMessageWithOptions:]((uint64_t)self->_connection, 0);
}

+ (id)NSXPCConnectionWithEndpoint:(id)a3 configurator:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    __int16 v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"endpoint"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v15 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138544642;
      id v22 = v14;
      __int16 v23 = 2114;
      id v24 = v16;
      __int16 v25 = 2048;
      id v26 = a1;
      __int16 v27 = 2114;
      uint64_t v28 = @"BSServiceConnection+NSXPCConnection.m";
      __int16 v29 = 1024;
      int v30 = 23;
      __int16 v31 = 2114;
      v32 = v13;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C76DFF4);
  }
  if (!v8)
  {
    __int16 v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"configurator"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v19 = (objc_class *)objc_opt_class();
      int v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138544642;
      id v22 = v18;
      __int16 v23 = 2114;
      id v24 = v20;
      __int16 v25 = 2048;
      id v26 = a1;
      __int16 v27 = 2114;
      uint64_t v28 = @"BSServiceConnection+NSXPCConnection.m";
      __int16 v29 = 1024;
      int v30 = 24;
      __int16 v31 = 2114;
      v32 = v17;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C76E0F4);
  }
  int v10 = +[BSServiceConnection connectionWithEndpoint:v7];
  int v11 = [v10 extractNSXPCConnectionWithConfigurator:v9];

  return v11;
}

+ (id)connectionWithEndpoint:(id)a3
{
  return +[BSServiceConnection _connectionWithEndpoint:clientContextBuilder:]((uint64_t)BSServiceConnection, (uint64_t)a3, 0);
}

- (id)extractNSXPCConnectionWithConfigurator:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    int v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"configurator"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      id v12 = (objc_class *)objc_opt_class();
      __int16 v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138544642;
      id v19 = v11;
      __int16 v20 = 2114;
      __int16 v21 = v13;
      __int16 v22 = 2048;
      __int16 v23 = self;
      __int16 v24 = 2114;
      __int16 v25 = @"BSServiceConnection+NSXPCConnection.m";
      __int16 v26 = 1024;
      int v27 = 38;
      __int16 v28 = 2114;
      __int16 v29 = v10;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C76E36CLL);
  }
  v6 = -[BSServiceConnection _extractUnderlyingConnection]((uint64_t)self);
  if (!v6)
  {
    id v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"connection"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = (objc_class *)objc_opt_class();
      __int16 v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138544642;
      id v19 = v15;
      __int16 v20 = 2114;
      __int16 v21 = v17;
      __int16 v22 = 2048;
      __int16 v23 = self;
      __int16 v24 = 2114;
      __int16 v25 = @"BSServiceConnection+NSXPCConnection.m";
      __int16 v26 = 1024;
      int v27 = 41;
      __int16 v28 = 2114;
      __int16 v29 = v14;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C76E46CLL);
  }
  id v7 = -[BSNSXPCTransport _initWithConnection:configurator:assertionProvider:]((os_unfair_lock_s *)[BSNSXPCTransport alloc], v6, v5, 0);
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) _initWithCustomTransport:v7];
  objc_setAssociatedObject(v8, "BSServiceConnectionTransport", v7, (void *)1);

  return v8;
}

- (id)_extractUnderlyingConnection
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    if (!*(void *)(a1 + 40))
    {
      int v10 = [NSString stringWithFormat:@"cannot extract connection after activation"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__extractUnderlyingConnection);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        id v12 = (objc_class *)objc_opt_class();
        __int16 v13 = NSStringFromClass(v12);
        *(_DWORD *)buf = 138544642;
        id v22 = v11;
        __int16 v23 = 2114;
        __int16 v24 = v13;
        __int16 v25 = 2048;
        uint64_t v26 = a1;
        __int16 v27 = 2114;
        __int16 v28 = @"BSServiceConnection.m";
        __int16 v29 = 1024;
        int v30 = 506;
        __int16 v31 = 2114;
        v32 = v10;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v10 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C76E724);
    }
    v3 = *(void **)(a1 + 8);
    if (!v3)
    {
      id v14 = [NSString stringWithFormat:@"cannot extract connection twice"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__extractUnderlyingConnection);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = (objc_class *)objc_opt_class();
        __int16 v17 = NSStringFromClass(v16);
        *(_DWORD *)buf = 138544642;
        id v22 = v15;
        __int16 v23 = 2114;
        __int16 v24 = v17;
        __int16 v25 = 2048;
        uint64_t v26 = a1;
        __int16 v27 = 2114;
        __int16 v28 = @"BSServiceConnection.m";
        __int16 v29 = 1024;
        int v30 = 507;
        __int16 v31 = 2114;
        v32 = v14;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v14 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C76E818);
    }
    id v4 = v3;
    id v5 = *(id *)(*(void *)(a1 + 40) + 16);
    v6 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    os_unfair_lock_unlock(v2);
    [(id)a1 invalidate];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __51__BSServiceConnection__extractUnderlyingConnection__block_invoke;
    v18[3] = &unk_1E58FC238;
    id v7 = v5;
    id v19 = v7;
    uint64_t v20 = a1;
    -[BSXPCServiceConnection configure:]((uint64_t)v4, (uint64_t)v18);
    id v8 = v4;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __31__BSServiceConnection_activate__block_invoke_180(uint64_t a1, os_unfair_lock_s *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = +[BSServiceConnection _currentConnection]();
  if (v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v5 = BSServiceXPCErrorsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[BSXPCServiceConnection _stateDump](a2);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      +[BSXPCServiceConnection currentContext]();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      -[BSXPCServiceConnection _eventHandler](a2);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = -[BSXPCServiceConnection _eventHandler](a2);
      int v10 = (void *)v9;
      if (v9) {
        id v11 = *(void **)(v9 + 144);
      }
      else {
        id v11 = 0;
      }
      id v12 = v11;
      int v13 = 138413058;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v7;
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_error_impl(&dword_19C754000, v5, OS_LOG_TYPE_ERROR, "%@: dropping activation handler because _currentConnection is unexpectedly nil (client bug) : context=%@ : eventHandler=%@ : name=%@", (uint8_t *)&v13, 0x2Au);
    }
  }
}

void __31__BSServiceConnection_activate__block_invoke_176(uint64_t a1, os_unfair_lock_s *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  +[BSServiceConnection _currentConnection]();
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    id v4 = NSString;
    id v5 = -[BSXPCServiceConnection _stateDump](a2);
    id v6 = +[BSXPCServiceConnection currentContext]();
    id v7 = -[BSXPCServiceConnection _eventHandler](a2);
    uint64_t v8 = -[BSXPCServiceConnection _eventHandler](a2);
    uint64_t v9 = (void *)v8;
    if (v8) {
      int v10 = *(void **)(v8 + 144);
    }
    else {
      int v10 = 0;
    }
    id v11 = v10;
    id v12 = [MEMORY[0x1E4F29060] currentThread];
    int v13 = [MEMORY[0x1E4F29060] currentThread];
    id v14 = [v13 threadDictionary];
    __int16 v15 = [v4 stringWithFormat:@"%@: _currentConnection is nil in invalidation handler : context=%@ : eventHandler=%@ : name=%@ : t=%@ : tls=%@", v5, v6, v7, v11, v12, v14];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v16 = [NSString stringWithUTF8String:"-[BSServiceConnection activate]_block_invoke"];
      *(_DWORD *)buf = 138544130;
      __int16 v19 = v16;
      __int16 v20 = 2114;
      uint64_t v21 = @"BSServiceConnection.m";
      __int16 v22 = 1024;
      int v23 = 388;
      __int16 v24 = 2114;
      __int16 v25 = v15;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C76F040);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)_currentConnection
{
  self;
  v0 = +[BSXPCServiceConnection currentContext]();
  uint64_t v1 = objc_opt_class();
  id v2 = v0;
  if (v1)
  {
    if (objc_opt_isKindOfClass()) {
      v3 = v2;
    }
    else {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }
  id v4 = v3;

  id v5 = [v4 object];

  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (NSString)instance
{
  return self->_instance;
}

- (NSString)service
{
  return self->_service;
}

- (id)_clientContext
{
  if (a1)
  {
    uint64_t v1 = (void *)MEMORY[0x1E4F4F870];
    id v2 = -[BSXPCServiceConnection initiatingContext](*(os_unfair_lock_s **)(a1 + 8));
    v3 = [v2 decodeXPCObjectOfType:MEMORY[0x1E4F14590] forKey:@"clientContext"];
    id v4 = [v1 coderWithMessage:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)_connectionFromIncomingConnection:(char)a3 requiresMessagingAfterHandshake:
{
  self;
  id v5 = -[BSXPCServiceConnection initiatingContext](a2);
  uint64_t v6 = [v5 decodeStringForKey:@"s"];
  if (v6)
  {
    id v7 = [BSServiceConnection alloc];
    uint64_t v8 = [v5 decodeStringForKey:@"i"];
    id v9 = -[BSServiceConnection _initWithConnection:service:instance:requiresMessagingAfterHandshake:clientContext:]((id *)&v7->super.isa, a2, v6, v8, a3, 0);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!self->_lock_noAssertInvalidatedOnDealloc && !self->_lock_invalidated)
  {
    id v4 = [NSString stringWithFormat:@"invalidation must occur before letting the connection dealloc for %@ : cnx=%@", self->_name, self->_connection];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      *(_DWORD *)buf = 138544642;
      id v10 = v5;
      v7 = __int16 v11 = 2114;
      id v12 = v7;
      __int16 v13 = 2048;
      id v14 = self;
      __int16 v15 = 2114;
      id v16 = @"BSServiceConnection.m";
      __int16 v17 = 1024;
      int v18 = 202;
      __int16 v19 = 2114;
      __int16 v20 = v4;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C76FD30);
  }
  v8.receiver = self;
  v8.super_class = (Class)BSServiceConnection;
  [(BSServiceConnection *)&v8 dealloc];
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_config = self->_lock_config;
  self->_lock_config = 0;

  self->_lock_invalidated = 1;
  os_unfair_lock_unlock(p_lock);
  connection = self->_connection;

  [(BSXPCServiceConnection *)connection invalidate];
}

void __31__BSServiceConnection_activate__block_invoke_182(uint64_t a1, os_unfair_lock_s *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  +[BSServiceConnection _currentConnection]();
  id v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if (v4)
  {
    os_unfair_lock_lock(v4 + 8);
    LOBYTE(v5[14]._os_unfair_lock_opaque) = 1;
    os_unfair_lock_unlock(v5 + 8);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v6 = BSServiceXPCErrorsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[BSXPCServiceConnection _stateDump](a2);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      +[BSXPCServiceConnection currentContext]();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      -[BSXPCServiceConnection _eventHandler](a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = -[BSXPCServiceConnection _eventHandler](a2);
      __int16 v11 = (void *)v10;
      if (v10) {
        id v12 = *(void **)(v10 + 144);
      }
      else {
        id v12 = 0;
      }
      id v13 = v12;
      int v14 = 138413058;
      id v15 = v7;
      __int16 v16 = 2112;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      __int16 v20 = 2112;
      id v21 = v13;
      _os_log_error_impl(&dword_19C754000, v6, OS_LOG_TYPE_ERROR, "%@: dropping invalidation handler because _currentConnection is unexpectedly nil (client bug) : context=%@ : eventHandler=%@ : name=%@", (uint8_t *)&v14, 0x2Au);
    }
  }
}

- (id)createMessageWithCompletion:(id)a3
{
  id v4 = -[BSXPCServiceConnection createMessageWithOptions:]((uint64_t)self->_connection, 0);
  uint64_t v6 = v4;
  if (v4) {
    objc_setProperty_nonatomic_copy(v4, v5, a3, 80);
  }

  return v6;
}

+ (id)NSXPCConnectionWithEndpoint:(id)a3 clientContextBuilder:(id)a4 configurator:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (!v9)
  {
    __int16 v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"endpoint"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v18 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138544642;
      id v29 = v17;
      __int16 v30 = 2114;
      __int16 v31 = v19;
      __int16 v32 = 2048;
      id v33 = a1;
      __int16 v34 = 2114;
      id v35 = @"BSServiceConnection+NSXPCConnection.m";
      __int16 v36 = 1024;
      int v37 = 31;
      __int16 v38 = 2114;
      id v39 = v16;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77F270);
  }
  if (!v10)
  {
    __int16 v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"block"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = (objc_class *)objc_opt_class();
      int v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138544642;
      id v29 = v21;
      __int16 v30 = 2114;
      __int16 v31 = v23;
      __int16 v32 = 2048;
      id v33 = a1;
      __int16 v34 = 2114;
      id v35 = @"BSServiceConnection+NSXPCConnection.m";
      __int16 v36 = 1024;
      int v37 = 32;
      __int16 v38 = 2114;
      id v39 = v20;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77F370);
  }
  if (!v11)
  {
    __int16 v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"configurator"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = (objc_class *)objc_opt_class();
      __int16 v27 = NSStringFromClass(v26);
      *(_DWORD *)buf = 138544642;
      id v29 = v25;
      __int16 v30 = 2114;
      __int16 v31 = v27;
      __int16 v32 = 2048;
      id v33 = a1;
      __int16 v34 = 2114;
      id v35 = @"BSServiceConnection+NSXPCConnection.m";
      __int16 v36 = 1024;
      int v37 = 33;
      __int16 v38 = 2114;
      id v39 = v24;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77F470);
  }
  id v13 = +[BSServiceConnection connectionWithEndpoint:v9 clientContextBuilder:v10];
  int v14 = [v13 extractNSXPCConnectionWithConfigurator:v12];

  return v14;
}

- (BSServiceConnection)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [NSString stringWithFormat:@"-init is not allowed on BSServiceConnection"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    int v14 = self;
    __int16 v15 = 2114;
    __int16 v16 = @"BSServiceConnection.m";
    __int16 v17 = 1024;
    int v18 = 176;
    __int16 v19 = 2114;
    __int16 v20 = v4;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BSServiceConnection *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

void __31__BSServiceConnection_activate__block_invoke_172(uint64_t a1, os_unfair_lock_s *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  +[BSServiceConnection _currentConnection]();
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    id v4 = NSString;
    id v5 = -[BSXPCServiceConnection _stateDump](a2);
    uint64_t v6 = +[BSXPCServiceConnection currentContext]();
    id v7 = -[BSXPCServiceConnection _eventHandler](a2);
    uint64_t v8 = -[BSXPCServiceConnection _eventHandler](a2);
    int v9 = (void *)v8;
    if (v8) {
      id v10 = *(void **)(v8 + 144);
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;
    id v12 = [MEMORY[0x1E4F29060] currentThread];
    __int16 v13 = [MEMORY[0x1E4F29060] currentThread];
    int v14 = [v13 threadDictionary];
    __int16 v15 = [v4 stringWithFormat:@"%@: _currentConnection is nil in interrupt handler : context=%@ : eventHandler=%@ : name=%@ : t=%@ : tls=%@", v5, v6, v7, v11, v12, v14];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = [NSString stringWithUTF8String:"-[BSServiceConnection activate]_block_invoke"];
      *(_DWORD *)buf = 138544130;
      __int16 v19 = v16;
      __int16 v20 = 2114;
      uint64_t v21 = @"BSServiceConnection.m";
      __int16 v22 = 1024;
      int v23 = 380;
      __int16 v24 = 2114;
      id v25 = v15;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C782468);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __31__BSServiceConnection_activate__block_invoke_181(uint64_t a1, os_unfair_lock_s *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = +[BSServiceConnection _currentConnection]();
  if (v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v5 = BSServiceXPCErrorsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[BSXPCServiceConnection _stateDump](a2);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      +[BSXPCServiceConnection currentContext]();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      -[BSXPCServiceConnection _eventHandler](a2);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = -[BSXPCServiceConnection _eventHandler](a2);
      id v10 = (void *)v9;
      if (v9) {
        id v11 = *(void **)(v9 + 144);
      }
      else {
        id v11 = 0;
      }
      id v12 = v11;
      int v13 = 138413058;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v7;
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_error_impl(&dword_19C754000, v5, OS_LOG_TYPE_ERROR, "%@: dropping interrupt handler because _currentConnection is unexpectedly nil (client bug) : context=%@ : eventHandler=%@ : name=%@", (uint8_t *)&v13, 0x2Au);
    }
  }
}

- (id)remoteTargetWithAssertionAttributes:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"attributes"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138544642;
      id v12 = v8;
      __int16 v13 = 2114;
      id v14 = v10;
      __int16 v15 = 2048;
      id v16 = self;
      __int16 v17 = 2114;
      id v18 = @"BSServiceConnection.m";
      __int16 v19 = 1024;
      int v20 = 447;
      __int16 v21 = 2114;
      __int16 v22 = v7;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C782834);
  }
  connection = (os_unfair_lock_s *)self->_connection;

  return -[BSXPCServiceConnection remoteTargetWithAssertionAttributes:enforcingLaunchConstraints:](connection, a3, 0);
}

- (RBSTarget)remoteAssertionTarget
{
  connection = self->_connection;
  if (connection) {
    return connection->_remoteAssertionTarget;
  }
  else {
    return 0;
  }
}

@end