void sub_2405E274C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  objc_destroyWeak((id *)(v8 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_2405E276C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2405E277C(uint64_t a1)
{
}

void sub_2405E2784(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_msgSend_session(WeakRetained, v3, v4);

  if (!v5)
  {
    id v8 = objc_alloc(MEMORY[0x263F3BA28]);
    v11 = objc_msgSend_serviceDescription(WeakRetained, v9, v10);
    v13 = objc_msgSend_initWithServiceDescription_(v8, v12, (uint64_t)v11);
    objc_msgSend_setSession_(WeakRetained, v14, (uint64_t)v13);

    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend_serviceDescription(WeakRetained, v15, v16);
      v20 = objc_msgSend_machService(v17, v18, v19);
      int v30 = 138412290;
      v31 = v20;
      _os_log_impl(&dword_2405E1000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Establishing XPC connection to %@", (uint8_t *)&v30, 0xCu);
    }
    v21 = objc_msgSend_session(WeakRetained, v15, v16);
    objc_msgSend_resume(v21, v22, v23);
  }
  v24 = objc_msgSend_session(WeakRetained, v6, v7);
  uint64_t v27 = objc_msgSend_proxy(v24, v25, v26);
  uint64_t v28 = *(void *)(*(void *)(a1 + 32) + 8);
  v29 = *(void **)(v28 + 40);
  *(void *)(v28 + 40) = v27;
}

void sub_2405E2A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  objc_destroyWeak((id *)(v8 - 40));
  _Unwind_Resume(a1);
}

void sub_2405E2A74(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = objc_msgSend_session(WeakRetained, v3, v4);

  if (!v5)
  {
    id v8 = objc_alloc(MEMORY[0x263F3BA28]);
    v11 = objc_msgSend_serviceDescription(WeakRetained, v9, v10);
    v13 = objc_msgSend_initWithServiceDescription_(v8, v12, (uint64_t)v11);
    objc_msgSend_setSession_(WeakRetained, v14, (uint64_t)v13);

    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend_serviceDescription(WeakRetained, v15, v16);
      v20 = objc_msgSend_machService(v17, v18, v19);
      int v29 = 138412290;
      int v30 = v20;
      _os_log_impl(&dword_2405E1000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Establishing XPC connection to %@", (uint8_t *)&v29, 0xCu);
    }
    v21 = objc_msgSend_session(WeakRetained, v15, v16);
    objc_msgSend_resume(v21, v22, v23);
  }
  v24 = objc_msgSend_session(WeakRetained, v6, v7);
  uint64_t v26 = objc_msgSend_syncProxyWithErrorHandler_(v24, v25, *(void *)(a1 + 32));
  uint64_t v27 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v28 = *(void **)(v27 + 40);
  *(void *)(v27 + 40) = v26;
}

void sub_2405E2E6C(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    sub_2405E3950();
  }
  uint64_t v4 = objc_msgSend_serialQueue(*(void **)(a1 + 32), v2, v3);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2405E2F18;
  block[3] = &unk_2650C5F88;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v4, block);
}

uint64_t sub_2405E2F18(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_session(*(void **)(a1 + 32), a2, a3);
  objc_msgSend_invalidate(v4, v5, v6);

  id v8 = *(void **)(a1 + 32);
  return objc_msgSend_setSession_(v8, v7, 0);
}

void sub_2405E2F68(void **a1, const char *a2)
{
  uint64_t v3 = objc_msgSend_userAgentSynchronousProxyWithErrorHandler_(a1[4], a2, (uint64_t)&unk_26F4B6A70);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_2405E3064;
  v5[3] = &unk_2650C5FD0;
  id v6 = a1[5];
  id v7 = a1[6];
  objc_msgSend_removeLocalAccountDataWithCompletion_(v3, v4, (uint64_t)v5);
}

void sub_2405E3024(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    sub_2405E3998(a2);
  }
}

void sub_2405E3064(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_2405E1000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "removeLocalAccountDataWithCompletion returned %d", (uint8_t *)v6, 8u);
  }
  objc_msgSend_cancel(*(void **)(a1 + 32), v4, v5);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_2405E35D0(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = a2;
  BOOL v3 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v3)
    {
      int v7 = 138543362;
      id v8 = v2;
      uint64_t v4 = MEMORY[0x263EF8438];
      uint64_t v5 = "Failed to update masked phone number: %{public}@.";
      uint32_t v6 = 12;
LABEL_6:
      _os_log_impl(&dword_2405E1000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v7, v6);
    }
  }
  else if (v3)
  {
    LOWORD(v7) = 0;
    uint64_t v4 = MEMORY[0x263EF8438];
    uint64_t v5 = "Masked phone number updated successfully.";
    uint32_t v6 = 2;
    goto LABEL_6;
  }
}

void sub_2405E3950()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_2405E1000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "removeLocalAccountDataWithCompletion timed out!", v0, 2u);
}

void sub_2405E3998(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_2405E1000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "canRemoveAccount sync XPC error: %@", (uint8_t *)&v1, 0xCu);
}

void sub_2405E3A18(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_2405E1000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "oldMaskedPhoneNumber: %@.", (uint8_t *)&v1, 0xCu);
}

void sub_2405E3A98(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_2405E1000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "maskedPhoneNumber: %@.", (uint8_t *)&v1, 0xCu);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

 v57 = objc_msgSend_isEqualToString_(v55, v56, *MEMORY[0x263EFAF00]);

  if (v57)
  {
    v59 = objc_msgSend_securityLevelForAccount_(self->_akAccountManager, v58, (uint64_t)v10);
    if (v59 != objc_msgSend_securityLevelForAccount_(self->_akAccountManager, v60, (uint64_t)v12))
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v24 = MEMORY[0x263EF8438];
        v25 = "IDMS account security level changed, signaling primaryAccountModified";
        goto LABEL_36;
      }
LABEL_37:
      objc_msgSend_primaryAccountModified(self, v22, v23);
    }
  }
LABEL_39:
}

- (id)_extractPhoneNumberFrom:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v5 = v3;
  if (v3)
  {
    uint32_t v6 = objc_msgSend_objectForKeyedSubscript_(v3, v4, @"obfuscatedPhoneNumbers");
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v19, v23, 16);
    if (v8)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(void *)v20;
      v12 = &stru_26F4B6B30;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v6);
          }
          v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v14, v9, @"recentlyUsed");
          if (v16)
          {
            uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v14, v15, @"maskedPhoneNumber");

            v12 = (__CFString *)v17;
          }
        }
        uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v19, v23, 16);
      }
      while (v10);
    }
    else
    {
      v12 = &stru_26F4B6B30;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)primaryAccountModified
{
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_2405E1000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "primaryAccountModified", v8, 2u);
  }
  uint64_t v5 = objc_msgSend_userAgentProxy(self, v3, v4);
  objc_msgSend_primaryAccountModified(v5, v6, v7);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

- (void)setServiceDescription:(id)a3
{
}

- (FMXPCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_akAccountManager, 0);
}

@end