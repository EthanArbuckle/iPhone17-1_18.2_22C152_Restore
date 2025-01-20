@interface HDHealthAppNewDeviceNotificationService
- (BOOL)sendNewDeviceNotificationWithMessageKind:(int64_t)a3 error:(id *)a4;
- (HDHealthAppNewDeviceNotificationService)init;
- (IDSService)notificationService;
- (void)setNotificationService:(id)a3;
@end

@implementation HDHealthAppNewDeviceNotificationService

- (HDHealthAppNewDeviceNotificationService)init
{
  v6.receiver = self;
  v6.super_class = (Class)HDHealthAppNewDeviceNotificationService;
  v2 = [(HDHealthAppNewDeviceNotificationService *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F6AB90]) initWithService:@"com.apple.private.alloy.healthapp.messaging"];
    notificationService = v2->_notificationService;
    v2->_notificationService = (IDSService *)v3;
  }
  return v2;
}

- (BOOL)sendNewDeviceNotificationWithMessageKind:(int64_t)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  objc_super v6 = (NSObject **)MEMORY[0x1E4F29F80];
  v7 = *MEMORY[0x1E4F29F80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v36 = self;
    __int16 v37 = 2114;
    v38 = @"com.apple.private.alloy.healthapp.messaging";
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Attempting to send IDS notification with service: %{public}@", buf, 0x16u);
  }
  v8 = [(IDSService *)self->_notificationService linkedDevicesWithRelationship:1];
  v9 = [MEMORY[0x1E4F1CA80] set];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([v15 deviceType] == 2 || objc_msgSend(v15, "deviceType") == 4)
        {
          v16 = (void *)IDSCopyIDForDevice();
          [v9 addObject:v16];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v12);
  }

  v17 = (void *)[objc_alloc(MEMORY[0x1E4F2B090]) initWithMessageKind:a3];
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v19 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v17 requiringSecureCoding:1 error:0];
  notificationService = self->_notificationService;
  id v28 = 0;
  id v29 = 0;
  int v21 = [(IDSService *)notificationService sendData:v19 toDestinations:v9 priority:300 options:v18 identifier:&v29 error:&v28];
  v22 = (__CFString *)v29;
  v23 = (__CFString *)v28;
  _HKInitializeLogging();
  v24 = *v6;
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v25)
    {
      *(_DWORD *)buf = 138543618;
      v36 = self;
      __int16 v37 = 2114;
      v38 = v22;
      _os_log_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: Data successfully sent with identifier: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (v25)
    {
      *(_DWORD *)buf = 138543362;
      v36 = self;
      _os_log_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: Data was not sent successfully.", buf, 0xCu);
    }
    _HKInitializeLogging();
    v26 = *MEMORY[0x1E4F29F80];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v36 = self;
      __int16 v37 = 2114;
      v38 = v23;
      _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "%{public}@: Error occured when sending new device IDS notification: %{public}@", buf, 0x16u);
    }
  }

  return v21;
}

- (IDSService)notificationService
{
  return self->_notificationService;
}

- (void)setNotificationService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end