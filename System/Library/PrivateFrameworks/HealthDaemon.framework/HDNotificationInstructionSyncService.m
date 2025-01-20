@interface HDNotificationInstructionSyncService
- (BOOL)sendNotificationInstructionMessage:(id)a3 identifier:(id *)a4 error:(id *)a5;
- (BOOL)unitTest_sendOnEmptyDestinationSet;
- (HDIDSService)IDSService;
- (HDNotificationInstructionSyncService)initWithDaemon:(id)a3;
- (HDNotificationInstructionSyncService)initWithDaemon:(id)a3 IDSService:(id)a4 analyticsEventManager:(id)a5;
- (NSDate)unitTest_currentDate;
- (NSString)description;
- (id)diagnosticDescription;
- (id)initWithDaemon:(void *)a3 syncService:(void *)a4 analyticsEventManager:;
- (id)unitTest_didSendInstructionWithSuccess;
- (void)registerObserver:(id)a3 queue:(id)a4;
- (void)service:(id)a3 didReceiveMessage:(id)a4 fromDevice:(id)a5 messageContext:(id)a6;
- (void)service:(id)a3 didSendWithSuccess:(BOOL)a4 identifier:(id)a5 error:(id)a6;
- (void)setUnitTest_currentDate:(id)a3;
- (void)setUnitTest_didSendInstructionWithSuccess:(id)a3;
- (void)setUnitTest_sendOnEmptyDestinationSet:(BOOL)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation HDNotificationInstructionSyncService

- (HDNotificationInstructionSyncService)initWithDaemon:(id)a3
{
  id v4 = a3;
  v5 = [[HDIDSService alloc] initWithServiceName:@"com.apple.private.alloy.healthappnotificationsync"];
  id v6 = objc_alloc(MEMORY[0x1E4F2ABE8]);
  uint64_t v7 = *MEMORY[0x1E4F29F80];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  v9 = [WeakRetained primaryProfile];
  v10 = (void *)[v6 initWithLoggingCategory:v7 healthDataSource:v9];

  v11 = (HDNotificationInstructionSyncService *)-[HDNotificationInstructionSyncService initWithDaemon:syncService:analyticsEventManager:]((id *)&self->super.isa, v4, v5, v10);
  return v11;
}

- (id)initWithDaemon:(void *)a3 syncService:(void *)a4 analyticsEventManager:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)HDNotificationInstructionSyncService;
    v10 = (id *)objc_msgSendSuper2(&v19, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeWeak(v10 + 2, v7);
      *((_DWORD *)a1 + 10) = 0;
      objc_storeStrong(a1 + 6, a3);
      [a1[6] setDelegate:a1];
      id v11 = objc_alloc(MEMORY[0x1E4F2B2D0]);
      v12 = NSStringFromProtocol((Protocol *)&unk_1F1813FD8);
      uint64_t v13 = [v11 initWithName:v12 loggingCategory:*MEMORY[0x1E4F29F80]];
      id v14 = a1[1];
      a1[1] = (id)v13;

      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v16 = a1[4];
      a1[4] = v15;

      objc_storeStrong(a1 + 3, a4);
      v17 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
      [v17 addObject:a1];
    }
  }

  return a1;
}

- (HDNotificationInstructionSyncService)initWithDaemon:(id)a3 IDSService:(id)a4 analyticsEventManager:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[HDIDSService alloc] initWithService:v9];

  v12 = (HDNotificationInstructionSyncService *)-[HDNotificationInstructionSyncService initWithDaemon:syncService:analyticsEventManager:]((id *)&self->super.isa, v10, v11, v8);
  return v12;
}

- (BOOL)sendNotificationInstructionMessage:(id)a3 identifier:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [v8 messageDictionary];
  id v10 = objc_alloc(MEMORY[0x1E4F2B130]);
  id v11 = +[HDIDSDestination validHealthSoftwareDeviceTypes];
  v12 = (void *)[v10 initWithSet:v11];

  uint64_t v13 = +[HDIDSDestination initWithAllowedDeviceTypes:v12];
  id v14 = +[HDIDSMessageOptions defaultOptionsWithPriority:1];
  IDSServiceInstance = self->_IDSServiceInstance;
  id v21 = 0;
  BOOL v16 = [(HDIDSService *)IDSServiceInstance sendMessage:v9 destination:v13 options:v14 identifier:&v21 error:a5];
  id v17 = v21;
  v18 = v17;
  if (v16 && v17 != 0)
  {
    if (a4) {
      *a4 = v17;
    }
    os_unfair_lock_lock(&self->_lock);
    [(NSMutableDictionary *)self->_lock_pendingMessages setObject:v8 forKeyedSubscript:v18];
    os_unfair_lock_unlock(&self->_lock);
  }

  return v16;
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
}

- (void)unregisterObserver:(id)a3
{
}

- (void)service:(id)a3 didReceiveMessage:(id)a4 fromDevice:(id)a5 messageContext:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a6;
  id v11 = a5;
  v12 = [HDNotificationInstructionMessage alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  id v14 = [WeakRetained pluginManager];
  id v15 = [v14 notificationInstructionCriteriaClasses];
  BOOL v16 = [(HDNotificationInstructionMessage *)v12 initWithMessageDictionary:v9 criteriaClasses:v15];

  id v17 = [HDNotificationInstruction alloc];
  v18 = [v10 originalGUID];
  if (self)
  {
    unitTest_currentDate = self->_unitTest_currentDate;
    if (unitTest_currentDate)
    {
      v20 = unitTest_currentDate;
    }
    else
    {
      v20 = [MEMORY[0x1E4F1C9C8] date];
    }
    id v21 = v20;
  }
  else
  {
    id v21 = 0;
  }
  v22 = [v11 name];

  v23 = [(HDNotificationInstruction *)v17 initWithMessageIdentifier:v18 receivedDate:v21 sendingDeviceName:v22 message:v16];
  if (!v23)
  {
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x1E4F29F80];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_ERROR))
    {
      v27 = v24;
      v28 = objc_opt_class();
      id v29 = v28;
      v30 = [v10 originalGUID];
      *(_DWORD *)buf = 138543874;
      v35 = v28;
      __int16 v36 = 2114;
      id v37 = v9;
      __int16 v38 = 2114;
      v39 = v30;
      _os_log_error_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to instantiate HDNotificationInstructionMessage from dictionary: %{public}@, originalGUID: %{public}@", buf, 0x20u);
    }
  }
  observers = self->_observers;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __92__HDNotificationInstructionSyncService_service_didReceiveMessage_fromDevice_messageContext___block_invoke;
  v31[3] = &unk_1E6303F98;
  v32 = v23;
  v33 = self;
  v26 = v23;
  [(HDNotificationInstructionSyncServiceObserver *)observers notifyObservers:v31];
}

void __92__HDNotificationInstructionSyncService_service_didReceiveMessage_fromDevice_messageContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(v3, "notificationInstructionSyncService:didReceiveNotificationInstruction:", *(void *)(a1 + 40));
  }
  else
  {
    int v4 = [v3 conformsToProtocol:&unk_1F18A8768];
    v5 = v6;
    if (!v4) {
      goto LABEL_6;
    }
    objc_msgSend(v6, "unitTesting_notificationInstructionSyncService:didReceiveNotificationInstruction:", *(void *)(a1 + 40), *(void *)(a1 + 32));
  }
  v5 = v6;
LABEL_6:
}

- (void)service:(id)a3 didSendWithSuccess:(BOOL)a4 identifier:(id)a5 error:(id)a6
{
  BOOL v7 = a4;
  id v14 = a6;
  id v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  id v10 = [(NSMutableDictionary *)self->_lock_pendingMessages objectForKeyedSubscript:v9];
  [(NSMutableDictionary *)self->_lock_pendingMessages removeObjectForKey:v9];

  os_unfair_lock_unlock(&self->_lock);
  if (v10)
  {
    analyticsEventSubmissionManager = self->_analyticsEventSubmissionManager;
    v12 = [[HDNotificationInstructionSyncSendEvent alloc] initWithNotificationInstructionMessage:v10 sendError:v14];
    [(HKAnalyticsEventSubmissionManager *)analyticsEventSubmissionManager submitEvent:v12 error:0];
  }
  unitTest_didSendInstructionWithSuccess = (void (**)(id, BOOL))self->_unitTest_didSendInstructionWithSuccess;
  if (unitTest_didSendInstructionWithSuccess) {
    unitTest_didSendInstructionWithSuccess[2](unitTest_didSendInstructionWithSuccess, v7);
  }
}

- (void)setUnitTest_sendOnEmptyDestinationSet:(BOOL)a3
{
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"[%@] IDS: %@", objc_opt_class(), self->_IDSServiceInstance];
}

- (id)diagnosticDescription
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v4 = (void *)[(NSMutableDictionary *)self->_lock_pendingMessages copy];
  os_unfair_lock_unlock(p_lock);
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        [v5 appendFormat:@"ID: %@\n", v11];
        v12 = [v6 objectForKeyedSubscript:v11];
        [v5 appendFormat:@"MSG: %@\n\n", v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v13 = (void *)[v5 copy];

  return v13;
}

- (HDIDSService)IDSService
{
  return self->_IDSServiceInstance;
}

- (BOOL)unitTest_sendOnEmptyDestinationSet
{
  return self->_unitTest_sendOnEmptyDestinationSet;
}

- (NSDate)unitTest_currentDate
{
  return self->_unitTest_currentDate;
}

- (void)setUnitTest_currentDate:(id)a3
{
}

- (id)unitTest_didSendInstructionWithSuccess
{
  return self->_unitTest_didSendInstructionWithSuccess;
}

- (void)setUnitTest_didSendInstructionWithSuccess:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_didSendInstructionWithSuccess, 0);
  objc_storeStrong((id *)&self->_unitTest_currentDate, 0);
  objc_storeStrong((id *)&self->_IDSServiceInstance, 0);
  objc_storeStrong((id *)&self->_lock_pendingMessages, 0);
  objc_storeStrong((id *)&self->_analyticsEventSubmissionManager, 0);
  objc_destroyWeak((id *)&self->_daemon);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end