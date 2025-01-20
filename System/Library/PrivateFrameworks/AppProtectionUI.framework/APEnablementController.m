@interface APEnablementController
+ (void)oneshotBeginFlowToSetEnablement:(unint64_t)a3 ofFeature:(unint64_t)a4 forSubject:(id)a5 completion:(id)a6;
- (APEnablementController)initWithSubject:(id)a3 forEnablement:(unint64_t)a4 ofFeature:(unint64_t)a5;
- (BOOL)_setNoLongerWaitingForService;
- (NSString)description;
- (void)_didCompleteWithError:(id)a3;
- (void)_handleServiceConnectionEvent:(id)a3;
- (void)beginFlow;
- (void)dealloc;
- (void)registerObserver:(id)a3;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation APEnablementController

- (APEnablementController)initWithSubject:(id)a3 forEnablement:(unint64_t)a4 ofFeature:(unint64_t)a5
{
  id v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)APEnablementController;
  v10 = [(APEnablementController *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_subject, a3);
    uint64_t v12 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v11->_observers;
    v11->_observers = (NSHashTable *)v12;

    v11->_lock._os_unfair_lock_opaque = 0;
    v11->_feature = a5;
    v11->_action = a4;
    alertHandle = v11->_alertHandle;
    v11->_alertHandle = 0;
  }
  return v11;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = APUIDefaultFrameworkLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_247E02000, v3, OS_LOG_TYPE_DEFAULT, "destroying controller %@", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)APEnablementController;
  [(APEnablementController *)&v4 dealloc];
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  subject = self->_subject;
  unint64_t feature = self->_feature;
  if (feature >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UnknownFeature%lld", self->_feature);
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v7 = off_26522D988[feature];
  }
  v8 = [v3 stringWithFormat:@"<%@: %@, %@>", v4, subject, v7];

  return (NSString *)v8;
}

- (void)registerObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_observers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)unregisterObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)_didCompleteWithError:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = APUIDefaultFrameworkLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    subject = self->_subject;
    unint64_t feature = self->_feature;
    unint64_t action = self->_action;
    *(_DWORD *)buf = 138413058;
    v21 = subject;
    __int16 v22 = 2048;
    unint64_t v23 = feature;
    __int16 v24 = 2048;
    unint64_t v25 = action;
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl(&dword_247E02000, v5, OS_LOG_TYPE_DEFAULT, "enablement controller for %@ feature %lld enablement %lld complete with error %@", buf, 0x2Au);
  }

  os_unfair_lock_lock(&self->_lock);
  id v9 = [(NSHashTable *)self->_observers allObjects];
  os_unfair_lock_unlock(&self->_lock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "enablementController:didCompleteWithError:", self, v4, (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (BOOL)_setNoLongerWaitingForService
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL waitingForService = self->_waitingForService;
  self->_BOOL waitingForService = 0;
  os_unfair_lock_unlock(p_lock);
  return waitingForService;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = APUIDefaultFrameworkLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = v4;
    __int16 v8 = 2112;
    id v9 = self;
    _os_log_impl(&dword_247E02000, v5, OS_LOG_TYPE_DEFAULT, "handle %@ activated for %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = APUIDefaultFrameworkLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = v4;
    __int16 v8 = 2112;
    id v9 = self;
    _os_log_impl(&dword_247E02000, v5, OS_LOG_TYPE_DEFAULT, "handle %@ deactivated for %@", (uint8_t *)&v6, 0x16u);
  }

  [v4 invalidate];
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = APUIDefaultFrameworkLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v17 = v6;
    __int16 v18 = 2112;
    v19 = self;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_247E02000, v8, OS_LOG_TYPE_DEFAULT, "handle %@ invalidated for %@: %@", buf, 0x20u);
  }

  if ([(APEnablementController *)self _setNoLongerWaitingForService])
  {
    id v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F08438];
    uint64_t v14 = *MEMORY[0x263F07F80];
    long long v15 = @"remote alert for enablement flow invalidated before completion";
    uint64_t v11 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    uint64_t v12 = [v9 errorWithDomain:v10 code:4 userInfo:v11];

    [(APEnablementController *)self _didCompleteWithError:v12];
  }
  xpc_connection_cancel(self->_listenerConnection);
  xpc_connection_set_event_handler(self->_listenerConnection, &__block_literal_global);
  serviceConnection = self->_serviceConnection;
  if (serviceConnection)
  {
    xpc_connection_cancel(serviceConnection);
    xpc_connection_set_event_handler(self->_serviceConnection, &__block_literal_global_11);
  }
  [(SBSRemoteAlertHandle *)self->_alertHandle unregisterObserver:self];
}

- (void)_handleServiceConnectionEvent:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = APUIDefaultFrameworkLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_247E02000, v5, OS_LOG_TYPE_DEFAULT, "handle service connection event: %@", (uint8_t *)&v9, 0xCu);
  }

  if ([(APEnablementController *)self _setNoLongerWaitingForService])
  {
    serviceConnection = self->_serviceConnection;
    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    xpc_connection_send_message(serviceConnection, reply);

    [(APEnablementController *)self _didCompleteWithError:0];
    __int16 v8 = APUIDefaultFrameworkLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_247E02000, v8, OS_LOG_TYPE_DEFAULT, "waiting for service and service is done; invalidating handle",
        (uint8_t *)&v9,
        2u);
    }

    [(SBSRemoteAlertHandle *)self->_alertHandle invalidate];
  }
}

- (void)beginFlow
{
  OUTLINED_FUNCTION_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0(&dword_247E02000, v0, v1, "invalid subject for enablement %@", v2, v3, v4, v5, 2u);
}

void __35__APEnablementController_beginFlow__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a2;
  uint64_t v5 = MEMORY[0x24C56D260]();
  if (v5 != MEMORY[0x263EF86F0])
  {
    id v6 = (const _xpc_type_s *)v5;
    if (v5 == MEMORY[0x263EF8720])
    {
      string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x263EF86B0]);
      id v7 = APUIDefaultFrameworkLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        name = string;
        __int16 v8 = "got error on listener error: %s";
        goto LABEL_10;
      }
    }
    else
    {
      id v7 = APUIDefaultFrameworkLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        name = xpc_type_get_name(v6);
        __int16 v8 = "got unknown object of type %s";
LABEL_10:
        _os_log_impl(&dword_247E02000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
      }
    }

    goto LABEL_12;
  }
  int v9 = APUIDefaultFrameworkLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_247E02000, v9, OS_LOG_TYPE_DEFAULT, "got connection from service", buf, 2u);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), a2);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(_xpc_connection_s **)(v10 + 72);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __35__APEnablementController_beginFlow__block_invoke_14;
  handler[3] = &unk_26522D8A8;
  handler[4] = v10;
  xpc_connection_set_event_handler(v11, handler);
  xpc_connection_resume(*(xpc_connection_t *)(*(void *)(a1 + 32) + 72));
LABEL_12:
}

uint64_t __35__APEnablementController_beginFlow__block_invoke_14(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleServiceConnectionEvent:a2];
}

void __35__APEnablementController_beginFlow__block_invoke_35(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = APUIDefaultFrameworkLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (a2)
  {
    if (v7) {
      __35__APEnablementController_beginFlow__block_invoke_35_cold_1();
    }

    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __35__APEnablementController_beginFlow__block_invoke_36;
    aBlock[3] = &unk_26522D8D0;
    aBlock[4] = *(void *)(a1 + 32);
    __int16 v8 = _Block_copy(aBlock);
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy_;
    v17[4] = __Block_byref_object_dispose_;
    id v18 = 0;
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 32);
    if (v9 == 1)
    {
      uint64_t v13 = [MEMORY[0x263F25210] sharedManager];
      [v13 setSubject:*(void *)(*(void *)(a1 + 32) + 8) isLocked:0 completion:v8];
    }
    else
    {
      if (v9 == 3)
      {
        uint64_t v10 = [MEMORY[0x263F25210] sharedManager];
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v12 = *(void *)(v11 + 8);
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __35__APEnablementController_beginFlow__block_invoke_38;
        v14[3] = &unk_26522D920;
        uint64_t v16 = v17;
        v14[4] = v11;
        id v15 = v8;
        [v10 setSubject:v12 isLocked:0 completion:v14];

LABEL_13:
        _Block_object_dispose(v17, 8);

        goto LABEL_14;
      }
      uint64_t v13 = [MEMORY[0x263F25210] sharedManager];
      [v13 setSubject:*(void *)(*(void *)(a1 + 32) + 8) isHidden:0 completion:v8];
    }

    goto LABEL_13;
  }
  if (v7) {
    __35__APEnablementController_beginFlow__block_invoke_35_cold_2();
  }

  [*(id *)(a1 + 32) _didCompleteWithError:v5];
LABEL_14:
}

void __35__APEnablementController_beginFlow__block_invoke_36(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = APUIDefaultFrameworkLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __35__APEnablementController_beginFlow__block_invoke_36_cold_1();
    }
  }
  [*(id *)(a1 + 32) _didCompleteWithError:v5];
}

void __35__APEnablementController_beginFlow__block_invoke_38(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  BOOL v7 = [MEMORY[0x263F25210] sharedManager];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __35__APEnablementController_beginFlow__block_invoke_2;
  v11[3] = &unk_26522D8F8;
  char v14 = a2;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  id v12 = v9;
  uint64_t v13 = v10;
  [v7 setSubject:v8 isHidden:0 completion:v11];
}

void __35__APEnablementController_beginFlow__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if ((a2 & 1) != 0 || *(unsigned char *)(a1 + 48)) {
    id v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else {
    id v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v5();
}

+ (void)oneshotBeginFlowToSetEnablement:(unint64_t)a3 ofFeature:(unint64_t)a4 forSubject:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v12 = [[APEnablementController alloc] initWithSubject:v10 forEnablement:a3 ofFeature:a4];

  uint64_t v11 = [[APOneshotObserverAdapter alloc] initWithController:v12 completionHandler:v9];
  [(APOneshotObserverAdapter *)v11 kickoff];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_listenerConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_alertHandle, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_subject, 0);
}

void __35__APEnablementController_beginFlow__block_invoke_35_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_247E02000, v0, OS_LOG_TYPE_ERROR, "authenticated, now disabling feature %lld for %@", v1, 0x16u);
}

void __35__APEnablementController_beginFlow__block_invoke_35_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_247E02000, v0, v1, "Could not authenticate to disable feature %lld: %@");
}

void __35__APEnablementController_beginFlow__block_invoke_36_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_247E02000, v2, OS_LOG_TYPE_ERROR, "couldn't disable feature %lld of %@: %@", v3, 0x20u);
}

@end