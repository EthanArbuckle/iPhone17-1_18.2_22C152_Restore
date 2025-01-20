@interface LNAppNotificationEventRegistrationProvider
- (LNAppNotificationEventRegistrationProvider)init;
- (NSXPCConnection)connection;
- (void)dealloc;
- (void)registerForAppNotificationEventsOfBundleIdentifier:(id)a3 entityType:(id)a4 completion:(id)a5;
- (void)unregisterForAppNotificationEventsOfBundleIdentifier:(id)a3 entityType:(id)a4 completion:(id)a5;
@end

@implementation LNAppNotificationEventRegistrationProvider

- (void).cxx_destruct
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)unregisterForAppNotificationEventsOfBundleIdentifier:(id)a3 entityType:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = _os_activity_create(&dword_1A4419000, "appintents:Stop observation", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __121__LNAppNotificationEventRegistrationProvider_unregisterForAppNotificationEventsOfBundleIdentifier_entityType_completion___block_invoke;
  v15[3] = &unk_1E5B39090;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  os_activity_apply(v11, v15);
}

void __121__LNAppNotificationEventRegistrationProvider_unregisterForAppNotificationEventsOfBundleIdentifier_entityType_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __121__LNAppNotificationEventRegistrationProvider_unregisterForAppNotificationEventsOfBundleIdentifier_entityType_completion___block_invoke_2;
  v4[3] = &unk_1E5B3A550;
  id v5 = *(id *)(a1 + 56);
  v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 unregisterForAppNotificationEventsOfBundleIdentifier:*(void *)(a1 + 40) entityType:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

uint64_t __121__LNAppNotificationEventRegistrationProvider_unregisterForAppNotificationEventsOfBundleIdentifier_entityType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerForAppNotificationEventsOfBundleIdentifier:(id)a3 entityType:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = _os_activity_create(&dword_1A4419000, "appintents:Start observation", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __119__LNAppNotificationEventRegistrationProvider_registerForAppNotificationEventsOfBundleIdentifier_entityType_completion___block_invoke;
  v15[3] = &unk_1E5B39090;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  os_activity_apply(v11, v15);
}

void __119__LNAppNotificationEventRegistrationProvider_registerForAppNotificationEventsOfBundleIdentifier_entityType_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __119__LNAppNotificationEventRegistrationProvider_registerForAppNotificationEventsOfBundleIdentifier_entityType_completion___block_invoke_2;
  v4[3] = &unk_1E5B3A550;
  id v5 = *(id *)(a1 + 56);
  v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 registerForAppNotificationEventsOfBundleIdentifier:*(void *)(a1 + 40) entityType:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

uint64_t __119__LNAppNotificationEventRegistrationProvider_registerForAppNotificationEventsOfBundleIdentifier_entityType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)LNAppNotificationEventRegistrationProvider;
  [(LNAppNotificationEventRegistrationProvider *)&v3 dealloc];
}

- (LNAppNotificationEventRegistrationProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)LNAppNotificationEventRegistrationProvider;
  v2 = [(LNAppNotificationEventRegistrationProvider *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.linkd.observationStatusRegistry" options:0];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    id v5 = LNDaemonObservationStatusRegistryXPCInterface();
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v5];

    [(NSXPCConnection *)v2->_connection resume];
  }
  return v2;
}

@end