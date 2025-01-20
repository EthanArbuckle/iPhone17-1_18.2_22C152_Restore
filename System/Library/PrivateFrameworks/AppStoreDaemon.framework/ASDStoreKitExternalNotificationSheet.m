@interface ASDStoreKitExternalNotificationSheet
+ (id)interface;
+ (id)sharedInstance;
- (ASDStoreKitExternalNotificationSheet)init;
- (void)presentSheetIfNeededForProcessHandle:(id)a3 completion:(id)a4;
@end

@implementation ASDStoreKitExternalNotificationSheet

+ (id)interface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6C0F8];
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__ASDStoreKitExternalNotificationSheet_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB4D64C8 != -1) {
    dispatch_once(&qword_1EB4D64C8, block);
  }
  v2 = (void *)_MergedGlobals_33;
  return v2;
}

uint64_t __54__ASDStoreKitExternalNotificationSheet_sharedInstance__block_invoke(uint64_t a1)
{
  _MergedGlobals_33 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (ASDStoreKitExternalNotificationSheet)init
{
  v6.receiver = self;
  v6.super_class = (Class)ASDStoreKitExternalNotificationSheet;
  v2 = [(ASDStoreKitExternalNotificationSheet *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[ASDServiceBroker defaultBroker];
    serviceBroker = v2->_serviceBroker;
    v2->_serviceBroker = (ASDServiceBroker *)v3;
  }
  return v2;
}

- (void)presentSheetIfNeededForProcessHandle:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  serviceBroker = self->_serviceBroker;
  id v13 = 0;
  id v8 = a4;
  v9 = [(ASDServiceBroker *)serviceBroker getStoreKitExternalNotificationServiceWithError:&v13];
  id v10 = v13;
  if (v9)
  {
    v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_10];
    [v11 presentSheetIfNeededForProcessHandle:v6 completion:v8];

    id v8 = v11;
  }
  else
  {
    v12 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v10;
      _os_log_error_impl(&dword_19BF6A000, v12, OS_LOG_TYPE_ERROR, "[ASDStoreKitExternalNotification] Service unavailable: %{public}@", buf, 0xCu);
    }

    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

void __88__ASDStoreKitExternalNotificationSheet_presentSheetIfNeededForProcessHandle_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_error_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_ERROR, "[ASDStoreKitExternalNotification] Remote object proxy error: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void).cxx_destruct
{
}

@end