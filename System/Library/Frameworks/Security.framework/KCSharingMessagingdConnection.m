@interface KCSharingMessagingdConnection
+ (id)sharedInstance;
- (KCSharingMessagingdConnection)init;
- (KCSharingMessagingdConnection)initWithConnection:(id)a3 interface:(id)a4 queue:(id)a5;
- (NSXPCConnection)connection;
- (void)cancelPendingInvitesForGroup:(id)a3 participantHandles:(id)a4 completion:(id)a5;
- (void)connectionWasInterrupted;
- (void)connectionWasInvalidated;
- (void)dealloc;
- (void)didAcceptInviteForGroupID:(id)a3 completion:(id)a4;
- (void)didDeclineInviteForGroupID:(id)a3 completion:(id)a4;
- (void)fetchReceivedInviteWithGroupID:(id)a3 completion:(id)a4;
- (void)fetchReceivedInvitesWithCompletion:(id)a3;
- (void)sendNewInvitesForGroup:(id)a3 completion:(id)a4;
- (void)setConnection:(id)a3;
@end

@implementation KCSharingMessagingdConnection

- (void).cxx_destruct
{
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)fetchReceivedInvitesWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create(&dword_18B299000, "ksmd/client/fetchReceivedInvitesWithCompletion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  v6 = [(KCSharingMessagingdConnection *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__KCSharingMessagingdConnection_fetchReceivedInvitesWithCompletion___block_invoke;
  v9[3] = &unk_1E547F618;
  id v7 = v4;
  id v10 = v7;
  v8 = [v6 remoteObjectProxyWithErrorHandler:v9];
  [v8 fetchReceivedInvitesWithCompletion:v7];

  os_activity_scope_leave(&state);
}

uint64_t __68__KCSharingMessagingdConnection_fetchReceivedInvitesWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)fetchReceivedInviteWithGroupID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_18B299000, "ksmd/client/fetchReceivedInviteWithGroupID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  v9 = [(KCSharingMessagingdConnection *)self connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__KCSharingMessagingdConnection_fetchReceivedInviteWithGroupID_completion___block_invoke;
  v12[3] = &unk_1E547F618;
  id v10 = v7;
  id v13 = v10;
  v11 = [v9 remoteObjectProxyWithErrorHandler:v12];
  [v11 fetchReceivedInviteWithGroupID:v6 completion:v10];

  os_activity_scope_leave(&state);
}

uint64_t __75__KCSharingMessagingdConnection_fetchReceivedInviteWithGroupID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)didDeclineInviteForGroupID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_18B299000, "ksmd/client/didDeclineInviteForGroupID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  v9 = [(KCSharingMessagingdConnection *)self connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__KCSharingMessagingdConnection_didDeclineInviteForGroupID_completion___block_invoke;
  v12[3] = &unk_1E547F618;
  id v10 = v7;
  id v13 = v10;
  v11 = [v9 remoteObjectProxyWithErrorHandler:v12];
  [v11 didDeclineInviteForGroupID:v6 completion:v10];

  os_activity_scope_leave(&state);
}

uint64_t __71__KCSharingMessagingdConnection_didDeclineInviteForGroupID_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)didAcceptInviteForGroupID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_18B299000, "ksmd/client/didAcceptInviteForGroupID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  v9 = [(KCSharingMessagingdConnection *)self connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__KCSharingMessagingdConnection_didAcceptInviteForGroupID_completion___block_invoke;
  v12[3] = &unk_1E547F618;
  id v10 = v7;
  id v13 = v10;
  v11 = [v9 remoteObjectProxyWithErrorHandler:v12];
  [v11 didAcceptInviteForGroupID:v6 completion:v10];

  os_activity_scope_leave(&state);
}

uint64_t __70__KCSharingMessagingdConnection_didAcceptInviteForGroupID_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)cancelPendingInvitesForGroup:(id)a3 participantHandles:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = _os_activity_create(&dword_18B299000, "ksmd/client/cancelPendingInvitesForGroup", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v11, &state);
  v12 = [(KCSharingMessagingdConnection *)self connection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__KCSharingMessagingdConnection_cancelPendingInvitesForGroup_participantHandles_completion___block_invoke;
  v15[3] = &unk_1E547F618;
  id v13 = v10;
  id v16 = v13;
  v14 = [v12 remoteObjectProxyWithErrorHandler:v15];
  [v14 cancelPendingInvitesForGroup:v8 participantHandles:v9 completion:v13];

  os_activity_scope_leave(&state);
}

uint64_t __92__KCSharingMessagingdConnection_cancelPendingInvitesForGroup_participantHandles_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)sendNewInvitesForGroup:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_18B299000, "ksmd/client/sendNewInvitesForGroup", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  id v9 = [(KCSharingMessagingdConnection *)self connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__KCSharingMessagingdConnection_sendNewInvitesForGroup_completion___block_invoke;
  v12[3] = &unk_1E547F618;
  id v10 = v7;
  id v13 = v10;
  v11 = [v9 remoteObjectProxyWithErrorHandler:v12];
  [v11 sendNewInvitesForGroup:v6 completion:v10];

  os_activity_scope_leave(&state);
}

uint64_t __67__KCSharingMessagingdConnection_sendNewInvitesForGroup_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)KCSharingMessagingdConnection;
  [(KCSharingMessagingdConnection *)&v3 dealloc];
}

- (void)connectionWasInvalidated
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_super v3 = KCSharingLogObject(@"KCSharingMessagingdConnection");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(KCSharingMessagingdConnection *)self connection];
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_18B299000, v3, OS_LOG_TYPE_INFO, "connection invalidated %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)connectionWasInterrupted
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_super v3 = KCSharingLogObject(@"KCSharingMessagingdConnection");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(KCSharingMessagingdConnection *)self connection];
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_18B299000, v3, OS_LOG_TYPE_INFO, "connection interrupted %@", (uint8_t *)&v5, 0xCu);
  }
}

- (KCSharingMessagingdConnection)initWithConnection:(id)a3 interface:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)KCSharingMessagingdConnection;
  v12 = [(KCSharingMessagingdConnection *)&v20 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connection, a3);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v13);
    [v9 setRemoteObjectInterface:v10];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__KCSharingMessagingdConnection_initWithConnection_interface_queue___block_invoke;
    v17[3] = &unk_1E5481428;
    objc_copyWeak(&v18, &location);
    [v9 setInterruptionHandler:v17];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68__KCSharingMessagingdConnection_initWithConnection_interface_queue___block_invoke_2;
    v15[3] = &unk_1E5481428;
    objc_copyWeak(&v16, &location);
    [v9 setInvalidationHandler:v15];
    [v9 _setQueue:v11];
    [v9 resume];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __68__KCSharingMessagingdConnection_initWithConnection_interface_queue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionWasInterrupted];
}

void __68__KCSharingMessagingdConnection_initWithConnection_interface_queue___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionWasInvalidated];
}

- (KCSharingMessagingdConnection)init
{
  objc_super v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, -1);

  dispatch_queue_t v5 = dispatch_queue_create("com.apple.KCSharingMessagingdConnection.xpcConnection", v4);
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.keychainsharingmessagingd" options:0];
  uint64_t v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED873B58];
  KCSharingSetupMessagingdServerProtocol(v7);
  objc_claimAutoreleasedReturnValue();

  id v8 = [(KCSharingMessagingdConnection *)self initWithConnection:v6 interface:v7 queue:v5];
  return v8;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4141 != -1) {
    dispatch_once(&sharedInstance_onceToken_4141, &__block_literal_global_4142);
  }
  v2 = (void *)sharedInstance_connection_4143;

  return v2;
}

uint64_t __47__KCSharingMessagingdConnection_sharedInstance__block_invoke()
{
  sharedInstance_connection_4143 = objc_alloc_init(KCSharingMessagingdConnection);

  return MEMORY[0x1F41817F8]();
}

@end