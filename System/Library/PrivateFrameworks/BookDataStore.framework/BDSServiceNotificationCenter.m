@interface BDSServiceNotificationCenter
+ (id)sharedInstance;
- (BDSServiceNotificationCenter)init;
- (BDSServiceProxy)serviceProxy;
- (BOOL)shouldMonitor;
- (NSNumber)changeTokenObject;
- (void)_postServiceNotificationNames:(id)a3 andUpdateChangeToken:(id)a4;
- (void)_startMonitoring;
- (void)_startMonitoringServiceNotifications;
- (void)_updateChangeToken:(id)a3;
- (void)handleServiceNotificationNames:(id)a3 latestChangeToken:(int64_t)a4;
- (void)q_startMonitoringServiceNotifications;
- (void)serviceConnectionDidResume;
- (void)serviceDidRestart;
- (void)setChangeTokenObject:(id)a3;
- (void)setServiceProxy:(id)a3;
- (void)setShouldMonitor:(BOOL)a3;
- (void)startMonitoring;
@end

@implementation BDSServiceNotificationCenter

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2360EBED4;
  block[3] = &unk_264CA15B8;
  block[4] = a1;
  if (qword_26AD77610 != -1) {
    dispatch_once(&qword_26AD77610, block);
  }
  v2 = (void *)qword_26AD775C0;
  return v2;
}

- (BDSServiceNotificationCenter)init
{
  v17.receiver = self;
  v17.super_class = (Class)BDSServiceNotificationCenter;
  v2 = [(BDSServiceNotificationCenter *)&v17 init];
  v3 = v2;
  if (v2)
  {
    v2->_changeTokenLock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("BDSServiceNotificationCenter.dispatchQueue", v4);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = [BDSServiceProxy alloc];
    uint64_t v14 = objc_msgSend_initWithConnectionDelegate_(v7, v8, (uint64_t)v3, v9, v10, v11, v12, v13);
    serviceProxy = v3->_serviceProxy;
    v3->_serviceProxy = (BDSServiceProxy *)v14;
  }
  return v3;
}

- (void)startMonitoring
{
  if (BDSXPCNotificationsEnabled())
  {
    MEMORY[0x270F9A6D0](self, sel__startMonitoring, v3, v4, v5, v6, v7, v8);
  }
}

- (void)_startMonitoring
{
  objc_msgSend_setShouldMonitor_(self, a2, 1, v2, v3, v4, v5, v6);
  MEMORY[0x270F9A6D0](self, sel__startMonitoringServiceNotifications, v8, v9, v10, v11, v12, v13);
}

- (void)_startMonitoringServiceNotifications
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2360EC0A8;
  block[3] = &unk_264CA1428;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)q_startMonitoringServiceNotifications
{
  objc_msgSend_serviceProxy(self, a2, v2, v3, v4, v5, v6, v7);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_changeTokenObject(self, v9, v10, v11, v12, v13, v14, v15);
  objc_msgSend_monitorServiceNotificationsWithChangeToken_completion_(v22, v17, (uint64_t)v16, (uint64_t)&unk_26E971C30, v18, v19, v20, v21);
}

- (void)serviceConnectionDidResume
{
  if (objc_msgSend_shouldMonitor(self, a2, v2, v3, v4, v5, v6, v7))
  {
    MEMORY[0x270F9A6D0](self, sel__startMonitoringServiceNotifications, v9, v10, v11, v12, v13, v14);
  }
}

- (void)serviceDidRestart
{
  if (objc_msgSend_shouldMonitor(self, a2, v2, v3, v4, v5, v6, v7))
  {
    MEMORY[0x270F9A6D0](self, sel__startMonitoringServiceNotifications, v9, v10, v11, v12, v13, v14);
  }
}

- (void)handleServiceNotificationNames:(id)a3 latestChangeToken:(int64_t)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = BDSServiceXPCNotificationLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138543618;
    id v21 = v6;
    __int16 v22 = 2048;
    int64_t v23 = a4;
    _os_log_impl(&dword_2360BC000, v7, OS_LOG_TYPE_DEFAULT, "handleServiceNotificationNames: %{public}@, latestChangeToken:%ld", (uint8_t *)&v20, 0x16u);
  }

  uint64_t v14 = objc_msgSend_numberWithInteger_(NSNumber, v8, a4, v9, v10, v11, v12, v13);
  objc_msgSend__postServiceNotificationNames_andUpdateChangeToken_(self, v15, (uint64_t)v6, (uint64_t)v14, v16, v17, v18, v19);
}

- (void)_postServiceNotificationNames:(id)a3 andUpdateChangeToken:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v30, (uint64_t)v34, 16, v9, v10, v11);
  if (v12)
  {
    uint64_t v20 = v12;
    uint64_t v21 = *(void *)v31;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v6);
        }
        uint64_t v23 = *(void *)(*((void *)&v30 + 1) + 8 * v22);
        uint64_t v24 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v13, v14, v15, v16, v17, v18, v19);
        objc_msgSend_postNotificationName_object_(v24, v25, v23, 0, v26, v27, v28, v29);

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v13, (uint64_t)&v30, (uint64_t)v34, 16, v17, v18, v19);
    }
    while (v20);
  }
  objc_msgSend__updateChangeToken_(self, v13, (uint64_t)v7, v15, v16, v17, v18, v19);
}

- (void)_updateChangeToken:(id)a3
{
  id v10 = a3;
  os_unfair_lock_lock(&self->_changeTokenLock);
  if (v10) {
    objc_msgSend_setChangeTokenObject_(self, v4, (uint64_t)v10, v5, v6, v7, v8, v9);
  }
  os_unfair_lock_unlock(&self->_changeTokenLock);
}

- (NSNumber)changeTokenObject
{
  return self->_changeTokenObject;
}

- (void)setChangeTokenObject:(id)a3
{
}

- (BOOL)shouldMonitor
{
  return self->_shouldMonitor;
}

- (void)setShouldMonitor:(BOOL)a3
{
  self->_shouldMonitor = a3;
}

- (BDSServiceProxy)serviceProxy
{
  return self->_serviceProxy;
}

- (void)setServiceProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_changeTokenObject, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end