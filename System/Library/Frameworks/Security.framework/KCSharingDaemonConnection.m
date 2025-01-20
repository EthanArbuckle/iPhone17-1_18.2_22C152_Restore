@interface KCSharingDaemonConnection
+ (id)sharedInstance;
+ (id)sharedInvitationNotifier;
- (KCSharingDaemonConnection)initWithConnection:(id)a3 queue:(id)a4 type:(int64_t)a5;
- (KCSharingDaemonConnection)initWithType:(int64_t)a3;
- (NSHashTable)connectionListeners;
- (NSXPCConnection)connection;
- (int64_t)type;
- (void)acceptInviteForGroupID:(id)a3 completion:(id)a4;
- (void)accountChanged;
- (void)addConnectionListener:(id)a3;
- (void)checkAvailabilityForHandles:(id)a3 completion:(id)a4;
- (void)connectionWasInterrupted;
- (void)connectionWasInvalidated;
- (void)createGroupWithRequest:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)declineInviteForGroupID:(id)a3 completion:(id)a4;
- (void)deleteGroupWithRequest:(id)a3 completion:(id)a4;
- (void)fetchCurrentUserIdentifierWithReply:(id)a3;
- (void)fetchRemoteChangesWithReply:(id)a3;
- (void)getGroupByGroupID:(id)a3 completion:(id)a4;
- (void)getGroupsWithRequest:(id)a3 completion:(id)a4;
- (void)groupInvitationWasCancelled;
- (void)groupsUpdated;
- (void)leaveGroupWithRequest:(id)a3 completion:(id)a4;
- (void)performMaintenanceWithCompletion:(id)a3;
- (void)provisionWithReply:(id)a3;
- (void)receivedGroupInvitation:(id)a3;
- (void)removeConnectionListener:(id)a3;
- (void)resyncWithCompletion:(id)a3;
- (void)saveLocalChangesWithReply:(id)a3;
- (void)setChangeTrackingEnabled:(BOOL)a3 reply:(id)a4;
- (void)setConnection:(id)a3;
- (void)setConnectionListeners:(id)a3;
- (void)setType:(int64_t)a3;
- (void)updateGroupWithRequest:(id)a3 completion:(id)a4;
- (void)verifyGroupsInSyncWithCompletion:(id)a3;
- (void)wipe:(BOOL)a3 reply:(id)a4;
@end

@implementation KCSharingDaemonConnection

uint64_t __43__KCSharingDaemonConnection_sharedInstance__block_invoke()
{
  sharedInstance_connection = [[KCSharingDaemonConnection alloc] initWithType:0];

  return MEMORY[0x1F41817F8]();
}

- (KCSharingDaemonConnection)initWithType:(int64_t)a3
{
  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_DEFAULT, -1);

  dispatch_queue_t v7 = dispatch_queue_create("com.apple.KCSharingDaemonConnection.xpcConnection", v6);
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.security.kcsharing" options:0];
  v9 = [(KCSharingDaemonConnection *)self initWithConnection:v8 queue:v7 type:a3];

  return v9;
}

- (KCSharingDaemonConnection)initWithConnection:(id)a3 queue:(id)a4 type:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v22.receiver = self;
  v22.super_class = (Class)KCSharingDaemonConnection;
  v11 = [(KCSharingDaemonConnection *)&v22 init];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    connectionListeners = v11->_connectionListeners;
    v11->_connectionListeners = (NSHashTable *)v12;

    objc_storeStrong((id *)&v11->_connection, a3);
    v11->_type = a5;
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v11);
    if (a5 == 1)
    {
      v14 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED8711A8];
      KCSharingSetupInvitationNotificationProtocol(v14);
      objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a5)
      {
        v14 = 0;
        goto LABEL_8;
      }
      v14 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED871108];
      KCSharingSetupServerProtocol(v14);
      objc_claimAutoreleasedReturnValue();
    }

LABEL_8:
    [v9 setRemoteObjectInterface:v14];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __59__KCSharingDaemonConnection_initWithConnection_queue_type___block_invoke;
    v19[3] = &unk_1E5481428;
    objc_copyWeak(&v20, &location);
    [v9 setInterruptionHandler:v19];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__KCSharingDaemonConnection_initWithConnection_queue_type___block_invoke_2;
    v17[3] = &unk_1E5481428;
    objc_copyWeak(&v18, &location);
    [v9 setInvalidationHandler:v17];
    v15 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED870E30];
    [v9 setExportedInterface:v15];

    [v9 setExportedObject:v11];
    [v9 _setQueue:v10];
    [v9 resume];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);

    objc_destroyWeak(&location);
  }

  return v11;
}

void __51__KCSharingDaemonConnection_addConnectionListener___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connectionListeners];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (NSHashTable)connectionListeners
{
  return self->_connectionListeners;
}

- (void)fetchCurrentUserIdentifierWithReply:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create(&dword_18B299000, "ksd/client/fetchCurrentUserIdentifierWithReply", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  v6 = [(KCSharingDaemonConnection *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__KCSharingDaemonConnection_fetchCurrentUserIdentifierWithReply___block_invoke;
  v9[3] = &unk_1E547F618;
  id v7 = v4;
  id v10 = v7;
  v8 = [v6 remoteObjectProxyWithErrorHandler:v9];
  [v8 fetchCurrentUserIdentifierWithReply:v7];

  os_activity_scope_leave(&state);
}

- (void)provisionWithReply:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create(&dword_18B299000, "ksd/client/provisionWithReply", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  v6 = [(KCSharingDaemonConnection *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__KCSharingDaemonConnection_provisionWithReply___block_invoke;
  v9[3] = &unk_1E547F618;
  id v7 = v4;
  id v10 = v7;
  v8 = [v6 remoteObjectProxyWithErrorHandler:v9];
  [v8 provisionWithReply:v7];

  os_activity_scope_leave(&state);
}

- (void)addConnectionListener:(id)a3
{
  id v4 = a3;
  v5 = [(KCSharingDaemonConnection *)self connection];
  v6 = [v5 _queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__KCSharingDaemonConnection_addConnectionListener___block_invoke;
  v8[3] = &unk_1E54776A0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1536);
  }
  id v2 = (void *)sharedInstance_connection;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionListeners, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)setConnectionListeners:(id)a3
{
}

- (void)setConnection:(id)a3
{
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)accountChanged
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = _os_activity_create(&dword_18B299000, "ksd/client/accountChanged", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v3, &state);
  id v4 = [(KCSharingDaemonConnection *)self connection];
  v5 = [v4 _queue];
  dispatch_assert_queue_V2(v5);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = [(KCSharingDaemonConnection *)self connectionListeners];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 accountChanged];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }

  os_activity_scope_leave(&state);
}

- (void)groupsUpdated
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = _os_activity_create(&dword_18B299000, "ksd/client/groupsUpdated", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v3, &state);
  id v4 = [(KCSharingDaemonConnection *)self connection];
  v5 = [v4 _queue];
  dispatch_assert_queue_V2(v5);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = [(KCSharingDaemonConnection *)self connectionListeners];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 groupsUpdated];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }

  os_activity_scope_leave(&state);
}

- (void)performMaintenanceWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create(&dword_18B299000, "ksd/client/performMaintenanceWithCompletion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  v6 = [(KCSharingDaemonConnection *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__KCSharingDaemonConnection_performMaintenanceWithCompletion___block_invoke;
  v9[3] = &unk_1E547F618;
  id v7 = v4;
  id v10 = v7;
  uint64_t v8 = [v6 remoteObjectProxyWithErrorHandler:v9];
  [v8 performMaintenanceWithCompletion:v7];

  os_activity_scope_leave(&state);
}

uint64_t __62__KCSharingDaemonConnection_performMaintenanceWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)verifyGroupsInSyncWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create(&dword_18B299000, "ksd/client/verifyGroupsInSyncWithCompletion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  v6 = [(KCSharingDaemonConnection *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__KCSharingDaemonConnection_verifyGroupsInSyncWithCompletion___block_invoke;
  v9[3] = &unk_1E547F618;
  id v7 = v4;
  id v10 = v7;
  uint64_t v8 = [v6 remoteObjectProxyWithErrorHandler:v9];
  [v8 verifyGroupsInSyncWithCompletion:v7];

  os_activity_scope_leave(&state);
}

uint64_t __62__KCSharingDaemonConnection_verifyGroupsInSyncWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)resyncWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create(&dword_18B299000, "ksd/client/resyncWithCompletion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  v6 = [(KCSharingDaemonConnection *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__KCSharingDaemonConnection_resyncWithCompletion___block_invoke;
  v9[3] = &unk_1E547F618;
  id v7 = v4;
  id v10 = v7;
  uint64_t v8 = [v6 remoteObjectProxyWithErrorHandler:v9];
  [v8 resyncWithCompletion:v7];

  os_activity_scope_leave(&state);
}

uint64_t __50__KCSharingDaemonConnection_resyncWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)groupInvitationWasCancelled
{
  v3 = _os_activity_create(&dword_18B299000, "ksd/client/groupInvitationWasCancelled", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  v6.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v3, &v6);
  id v4 = [(KCSharingDaemonConnection *)self connection];
  v5 = [v4 remoteObjectProxy];
  [v5 groupInvitationWasCancelled];

  os_activity_scope_leave(&v6);
}

- (void)receivedGroupInvitation:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create(&dword_18B299000, "ksd/client/receivedGroupInvitation", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  v8.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &v8);
  os_activity_scope_state_s v6 = [(KCSharingDaemonConnection *)self connection];
  id v7 = [v6 remoteObjectProxy];
  [v7 receivedGroupInvitation:v4];

  os_activity_scope_leave(&v8);
}

uint64_t __65__KCSharingDaemonConnection_fetchCurrentUserIdentifierWithReply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)wipe:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = _os_activity_create(&dword_18B299000, "ksd/client/wipe", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_state_s v8 = [(KCSharingDaemonConnection *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__KCSharingDaemonConnection_wipe_reply___block_invoke;
  v11[3] = &unk_1E547F618;
  id v9 = v6;
  id v12 = v9;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v11];
  [v10 wipe:v4 reply:v9];

  os_activity_scope_leave(&state);
}

uint64_t __40__KCSharingDaemonConnection_wipe_reply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)checkAvailabilityForHandles:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_activity_scope_state_s v8 = _os_activity_create(&dword_18B299000, "ksd/client/checkAvailabilityForHandles", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  id v9 = [(KCSharingDaemonConnection *)self connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__KCSharingDaemonConnection_checkAvailabilityForHandles_completion___block_invoke;
  v12[3] = &unk_1E547F618;
  id v10 = v7;
  id v13 = v10;
  long long v11 = [v9 remoteObjectProxyWithErrorHandler:v12];
  [v11 checkAvailabilityForHandles:v6 completion:v10];

  os_activity_scope_leave(&state);
}

uint64_t __68__KCSharingDaemonConnection_checkAvailabilityForHandles_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)declineInviteForGroupID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_activity_scope_state_s v8 = _os_activity_create(&dword_18B299000, "ksd/client/declineInviteForGroupID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  id v9 = [(KCSharingDaemonConnection *)self connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__KCSharingDaemonConnection_declineInviteForGroupID_completion___block_invoke;
  v12[3] = &unk_1E547F618;
  id v10 = v7;
  id v13 = v10;
  long long v11 = [v9 remoteObjectProxyWithErrorHandler:v12];
  [v11 declineInviteForGroupID:v6 completion:v10];

  os_activity_scope_leave(&state);
}

uint64_t __64__KCSharingDaemonConnection_declineInviteForGroupID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)acceptInviteForGroupID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_activity_scope_state_s v8 = _os_activity_create(&dword_18B299000, "ksd/client/acceptInviteForGroupID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  id v9 = [(KCSharingDaemonConnection *)self connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__KCSharingDaemonConnection_acceptInviteForGroupID_completion___block_invoke;
  v12[3] = &unk_1E547F618;
  id v10 = v7;
  id v13 = v10;
  long long v11 = [v9 remoteObjectProxyWithErrorHandler:v12];
  [v11 acceptInviteForGroupID:v6 completion:v10];

  os_activity_scope_leave(&state);
}

uint64_t __63__KCSharingDaemonConnection_acceptInviteForGroupID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)deleteGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_activity_scope_state_s v8 = _os_activity_create(&dword_18B299000, "ksd/client/deleteGroupWithRequest", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  id v9 = [(KCSharingDaemonConnection *)self connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__KCSharingDaemonConnection_deleteGroupWithRequest_completion___block_invoke;
  v12[3] = &unk_1E547F618;
  id v10 = v7;
  id v13 = v10;
  long long v11 = [v9 remoteObjectProxyWithErrorHandler:v12];
  [v11 deleteGroupWithRequest:v6 completion:v10];

  os_activity_scope_leave(&state);
}

uint64_t __63__KCSharingDaemonConnection_deleteGroupWithRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)leaveGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_activity_scope_state_s v8 = _os_activity_create(&dword_18B299000, "ksd/client/leaveGroupWithRequest", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  id v9 = [(KCSharingDaemonConnection *)self connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__KCSharingDaemonConnection_leaveGroupWithRequest_completion___block_invoke;
  v12[3] = &unk_1E547F618;
  id v10 = v7;
  id v13 = v10;
  long long v11 = [v9 remoteObjectProxyWithErrorHandler:v12];
  [v11 leaveGroupWithRequest:v6 completion:v10];

  os_activity_scope_leave(&state);
}

uint64_t __62__KCSharingDaemonConnection_leaveGroupWithRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_activity_scope_state_s v8 = _os_activity_create(&dword_18B299000, "ksd/client/updateGroupWithRequest", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  id v9 = [(KCSharingDaemonConnection *)self connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__KCSharingDaemonConnection_updateGroupWithRequest_completion___block_invoke;
  v12[3] = &unk_1E547F618;
  id v10 = v7;
  id v13 = v10;
  long long v11 = [v9 remoteObjectProxyWithErrorHandler:v12];
  [v11 updateGroupWithRequest:v6 completion:v10];

  os_activity_scope_leave(&state);
}

uint64_t __63__KCSharingDaemonConnection_updateGroupWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)createGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_activity_scope_state_s v8 = _os_activity_create(&dword_18B299000, "ksd/client/createGroupWithRequest", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  id v9 = [(KCSharingDaemonConnection *)self connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__KCSharingDaemonConnection_createGroupWithRequest_completion___block_invoke;
  v12[3] = &unk_1E547F618;
  id v10 = v7;
  id v13 = v10;
  long long v11 = [v9 remoteObjectProxyWithErrorHandler:v12];
  [v11 createGroupWithRequest:v6 completion:v10];

  os_activity_scope_leave(&state);
}

uint64_t __63__KCSharingDaemonConnection_createGroupWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)getGroupsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_activity_scope_state_s v8 = _os_activity_create(&dword_18B299000, "ksd/client/getGroupsWithRequest", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  id v9 = [(KCSharingDaemonConnection *)self connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__KCSharingDaemonConnection_getGroupsWithRequest_completion___block_invoke;
  v12[3] = &unk_1E547F618;
  id v10 = v7;
  id v13 = v10;
  long long v11 = [v9 remoteObjectProxyWithErrorHandler:v12];
  [v11 getGroupsWithRequest:v6 completion:v10];

  os_activity_scope_leave(&state);
}

uint64_t __61__KCSharingDaemonConnection_getGroupsWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)getGroupByGroupID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_activity_scope_state_s v8 = _os_activity_create(&dword_18B299000, "ksd/client/getGroupByGroupID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  id v9 = [(KCSharingDaemonConnection *)self connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__KCSharingDaemonConnection_getGroupByGroupID_completion___block_invoke;
  v12[3] = &unk_1E547F618;
  id v10 = v7;
  id v13 = v10;
  long long v11 = [v9 remoteObjectProxyWithErrorHandler:v12];
  [v11 getGroupByGroupID:v6 completion:v10];

  os_activity_scope_leave(&state);
}

uint64_t __58__KCSharingDaemonConnection_getGroupByGroupID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)saveLocalChangesWithReply:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create(&dword_18B299000, "ksd/client/saveLocalChangesWithReply", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  id v6 = [(KCSharingDaemonConnection *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__KCSharingDaemonConnection_saveLocalChangesWithReply___block_invoke;
  v9[3] = &unk_1E547F618;
  id v7 = v4;
  id v10 = v7;
  os_activity_scope_state_s v8 = [v6 remoteObjectProxyWithErrorHandler:v9];
  [v8 saveLocalChangesWithReply:v7];

  os_activity_scope_leave(&state);
}

uint64_t __55__KCSharingDaemonConnection_saveLocalChangesWithReply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchRemoteChangesWithReply:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create(&dword_18B299000, "ksd/client/fetchRemoteChangesWithReply", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  id v6 = [(KCSharingDaemonConnection *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__KCSharingDaemonConnection_fetchRemoteChangesWithReply___block_invoke;
  v9[3] = &unk_1E547F618;
  id v7 = v4;
  id v10 = v7;
  os_activity_scope_state_s v8 = [v6 remoteObjectProxyWithErrorHandler:v9];
  [v8 fetchRemoteChangesWithReply:v7];

  os_activity_scope_leave(&state);
}

uint64_t __57__KCSharingDaemonConnection_fetchRemoteChangesWithReply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setChangeTrackingEnabled:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = _os_activity_create(&dword_18B299000, "ksd/client/setChangeTrackingEnabled", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_state_s v8 = [(KCSharingDaemonConnection *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__KCSharingDaemonConnection_setChangeTrackingEnabled_reply___block_invoke;
  v11[3] = &unk_1E547F618;
  id v9 = v6;
  id v12 = v9;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v11];
  [v10 setChangeTrackingEnabled:v4 reply:v9];

  os_activity_scope_leave(&state);
}

uint64_t __60__KCSharingDaemonConnection_setChangeTrackingEnabled_reply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __48__KCSharingDaemonConnection_provisionWithReply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)dealloc
{
  v3 = [(KCSharingDaemonConnection *)self connection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)KCSharingDaemonConnection;
  [(KCSharingDaemonConnection *)&v4 dealloc];
}

- (void)connectionWasInvalidated
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = KCSharingLogObject(@"KCSharingDaemonConnection");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_super v4 = [(KCSharingDaemonConnection *)self connection];
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_18B299000, v3, OS_LOG_TYPE_INFO, "connection invalidated %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)connectionWasInterrupted
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = KCSharingLogObject(@"KCSharingDaemonConnection");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_super v4 = [(KCSharingDaemonConnection *)self connection];
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_18B299000, v3, OS_LOG_TYPE_INFO, "connection interrupted %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)removeConnectionListener:(id)a3
{
  id v4 = a3;
  int v5 = [(KCSharingDaemonConnection *)self connection];
  id v6 = [v5 _queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__KCSharingDaemonConnection_removeConnectionListener___block_invoke;
  v8[3] = &unk_1E54776A0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __54__KCSharingDaemonConnection_removeConnectionListener___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connectionListeners];
  [v2 removeObject:*(void *)(a1 + 40)];
}

void __59__KCSharingDaemonConnection_initWithConnection_queue_type___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionWasInterrupted];
}

void __59__KCSharingDaemonConnection_initWithConnection_queue_type___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionWasInvalidated];
}

+ (id)sharedInvitationNotifier
{
  if (sharedInvitationNotifier_onceToken != -1) {
    dispatch_once(&sharedInvitationNotifier_onceToken, &__block_literal_global_123);
  }
  id v2 = (void *)sharedInvitationNotifier_connection;

  return v2;
}

uint64_t __53__KCSharingDaemonConnection_sharedInvitationNotifier__block_invoke()
{
  sharedInvitationNotifier_connection = [[KCSharingDaemonConnection alloc] initWithType:1];

  return MEMORY[0x1F41817F8]();
}

@end