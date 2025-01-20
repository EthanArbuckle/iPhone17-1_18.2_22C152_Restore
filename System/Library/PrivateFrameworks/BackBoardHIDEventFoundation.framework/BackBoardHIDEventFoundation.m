uint64_t _BKIOHIDEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  _BKHandleIOHIDEventFromSender(a4, a3);
  return 0;
}

uint64_t _BKHIDEventDeferringDisplayMatch(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = v4;
  uint64_t v6 = 1;
  if (v3 && v4 && ([v4 _isNullDisplay] & 1) == 0) {
    uint64_t v6 = [v5 isEqual:v3];
  }

  return v6;
}

uint64_t _BKHandleIOHIDEventFromSender(void *a1, uint64_t a2)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v49 = a1;
  id v4 = (void *)MEMORY[0x1D25E02E0]();
  if (IOHIDEventGetAttributeDataLength() < 1)
  {
    uint64_t v6 = +[BKHIDSystem sharedInstance];
    *(void *)&long long valuePtr = 0;
    if (a1)
    {
      *(void *)&long long valuePtr = IOHIDEventGetSenderID();
      BOOL v11 = (void)valuePtr == 0;
      if (!a2) {
        goto LABEL_20;
      }
    }
    else
    {
      BOOL v11 = 1;
      if (!a2) {
        goto LABEL_20;
      }
    }
    if (v11)
    {
      CFNumberRef RegistryID = (const __CFNumber *)IOHIDServiceGetRegistryID();
      if (RegistryID) {
        CFNumberGetValue(RegistryID, kCFNumberSInt64Type, &valuePtr);
      }
    }
LABEL_20:
    v13 = +[BKHIDSystem sharedInstance];
    v14 = [v13 senderCache];

    p_super = [v14 senderInfoForSenderID:(void)valuePtr];
    if (a2)
    {
      if (!(void)valuePtr) {
        goto LABEL_30;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_30;
      }
      v16 = BKLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v59 = (void *)valuePtr;
        _os_log_impl(&dword_1CFDE2000, v16, OS_LOG_TYPE_INFO, "populating sender cache for unknown sender with senderID:%llX", buf, 0xCu);
      }

      v17 = [[BKIOHIDService alloc] initWithHIDServiceRef:a2];
      [v14 addSenderInfo:v17 forSenderID:(void)valuePtr];
      v18 = p_super;
      p_super = &v17->super;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_30:

        v19 = [v6 dispatcherProvider];
        v20 = [v19 dispatcherForEvent:a1];
        [v6 processEvent:&v49 sender:p_super dispatcher:v20];

LABEL_31:
LABEL_32:

        goto LABEL_33;
      }
      v18 = BKLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v59 = (void *)valuePtr;
        _os_log_impl(&dword_1CFDE2000, v18, OS_LOG_TYPE_INFO, "no IOHIDServiceRef for unknown senderID:%llX", buf, 0xCu);
      }
    }

    goto LABEL_30;
  }
  if (IOHIDEventGetAttributeDataLength() < 6
    || (uint64_t AttributeDataPtr = IOHIDEventGetAttributeDataPtr()) == 0
    || !*(_DWORD *)(AttributeDataPtr + 4)
    || *(unsigned char *)AttributeDataPtr != 3)
  {
    uint64_t v6 = BKLogEventDelivery();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v59 = a1;
      _os_log_error_impl(&dword_1CFDE2000, v6, OS_LOG_TYPE_ERROR, "ignoring event with non-redirect attribute data: %{public}@", buf, 0xCu);
    }
    goto LABEL_32;
  }
  if (a1)
  {
    uint64_t v6 = +[BKHIDSystem sharedInstance];
    v7 = BKSHIDEventGetBaseAttributes();
    uint64_t v8 = objc_opt_class();
    id v9 = v7;
    if (v8)
    {
      if (objc_opt_isKindOfClass()) {
        v10 = v9;
      }
      else {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
    p_super = v10;

    if (p_super)
    {
      v19 = [p_super environment];
      [p_super source];
      v22 = [p_super display];
      if (!v22)
      {
        v23 = [v6 deliveryManager];
        v22 = [v23 mainDisplay];
      }
      v24 = [p_super token];
      [p_super options];
      uint64_t v25 = [p_super pid];
      v48 = v22;
      if ((int)v25 <= 0)
      {
        v32 = BKLogCommon();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v59 = a1;
          _os_log_error_impl(&dword_1CFDE2000, v32, OS_LOG_TYPE_ERROR, "must have a valid destination PID must be set to redirect events -- not redirecting '%{public}@'", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v26 = v25;
        v46 = v6;
        v47 = v19;
        v44 = v24;
        if (v19)
        {
          v27 = v6;
          v28 = v24;
          v29 = (void *)[MEMORY[0x1E4F4F358] new];
          [v29 setDisplay:v22];
          [v29 setEnvironment:v47];
          [v29 setToken:v28];
          v30 = [v27 deliveryManager];
          v31 = [v30 destinationsStartingFromPID:v26 deferringPredicate:v29];
        }
        else
        {
          v33 = (void *)MEMORY[0x1E4F4F288];
          v54[0] = MEMORY[0x1E4F143A8];
          v54[1] = 3221225472;
          v54[2] = ___BKRedirectHIDEvent_block_invoke;
          v54[3] = &unk_1E6871778;
          id v55 = v22;
          int v57 = v26;
          id v56 = v24;
          v34 = [v33 build:v54];
          v31 = [MEMORY[0x1E4F1CAD0] setWithObject:v34];
        }
        v45 = p_super;
        v35 = BKLogHID();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v36 = BKSHIDEventGetConciseDescription();
          uint64_t SenderID = IOHIDEventGetSenderID();
          *(_DWORD *)buf = 138543874;
          v59 = v36;
          __int16 v60 = 2048;
          uint64_t v61 = SenderID;
          __int16 v62 = 2114;
          v63 = v31;
          _os_log_impl(&dword_1CFDE2000, v35, OS_LOG_TYPE_DEFAULT, "Redirecting HID event (%{public}@ / senderID:%llX) to destinations: %{public}@", buf, 0x20u);
        }
        IOHIDEventGetTimeStamp();
        kdebug_trace();
        long long valuePtr = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        v32 = v31;
        uint64_t v38 = [v32 countByEnumeratingWithState:&valuePtr objects:buf count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v40 = *(void *)v51;
          do
          {
            for (uint64_t i = 0; i != v39; ++i)
            {
              if (*(void *)v51 != v40) {
                objc_enumerationMutation(v32);
              }
              v42 = *(void **)(*((void *)&valuePtr + 1) + 8 * i);
              Copy = (const void *)IOHIDEventCreateCopy();
              BKSHIDEventSetSimpleDeliveryInfo();
              _BKSendHIDEventToClientWithDestination((uint64_t)Copy, v42, 1);
              CFRelease(Copy);
            }
            uint64_t v39 = [v32 countByEnumeratingWithState:&valuePtr objects:buf count:16];
          }
          while (v39);
        }

        p_super = v45;
        uint64_t v6 = v46;
        v19 = v47;
        v24 = v44;
      }
    }
    else
    {
      v19 = BKLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v59 = a1;
        _os_log_error_impl(&dword_1CFDE2000, v19, OS_LOG_TYPE_ERROR, "event does not contain valid redirect info -- not redirecting '%{public}@'", buf, 0xCu);
      }
    }
    goto LABEL_31;
  }
LABEL_33:
  return 0;
}

void sub_1CFDE718C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id BKHIDEventRoutingGetClientConnectionManager()
{
  return (id)__HIDClientConnectionManager;
}

uint64_t _BKHIDNoteUserEventOccurredOnDisplay(uint64_t a1)
{
  return [(id)_userEventNotifier userEventOccurredOnDisplay:a1];
}

id _BKResolutionDescriptionForLogging(void *a1, char a2)
{
  id v3 = a1;
  id v4 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = ___BKResolutionDescriptionForLogging_block_invoke;
  v7[3] = &unk_1E68710B0;
  id v5 = v4;
  id v8 = v5;
  char v9 = a2;
  [v5 appendCollection:v3 withName:0 itemBlock:v7];

  return v5;
}

uint64_t _BKHIDEventSenderMatchesSenderSet(void *a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = 1;
  v31 = v5;
  if (v5 && v6)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v8)
    {
      id v29 = v6;
      uint64_t v9 = *(void *)v33;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(obj);
          }
          BOOL v11 = *(void **)(*((void *)&v32 + 1) + 8 * v10);
          id v12 = v31;
          id v13 = v11;
          id v14 = v7;
          uint64_t v15 = [v13 senderID];
          if (v15 && v15 != [v12 senderID]
            || [v13 isAuthenticated] && !objc_msgSend(v12, "isAuthenticated")
            || (uint64_t v16 = [v13 hardwareType]) != 0 && v16 != objc_msgSend(v12, "hardwareType")
            || (int v17 = [v13 primaryPage], v18 = objc_msgSend(v13, "primaryUsage"), v17)
            && ((int v19 = v18, v17 != [v12 primaryPage])
             || v19 && v19 != [v12 primaryUsage]))
          {
          }
          else
          {
            uint64_t v20 = [v13 associatedDisplay];
            if (!v20)
            {

LABEL_33:
              uint64_t v8 = 1;
              goto LABEL_34;
            }
            v21 = (void *)v20;
            v22 = [v12 associatedDisplay];
            if (v22)
            {
              v23 = v22;
              if ([v22 _isBuiltinDisplay])
              {
                id v24 = v14;

                v23 = v24;
              }
            }
            else
            {
              v23 = [MEMORY[0x1E4F4F2D0] nullDisplay];
            }
            if ([v21 _isBuiltinDisplay])
            {
              id v25 = v14;

              v21 = v25;
            }
            char v26 = [v23 isEqual:v21];

            if (v26) {
              goto LABEL_33;
            }
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v27 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
        uint64_t v8 = v27;
      }
      while (v27);
LABEL_34:
      id v6 = v29;
    }
  }
  return v8;
}

void BKHIDClientConnectionRemovalCallback(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = BKLogHID();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138543362;
    BOOL v11 = a3;
    _os_log_debug_impl(&dword_1CFDE2000, v5, OS_LOG_TYPE_DEBUG, "Got a client removal callback: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  if (a1)
  {
    CFRetain(a3);
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 48));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    id v6 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), a3);
    if (v6)
    {
      id v7 = BKLogHID();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138543874;
        BOOL v11 = v6;
        __int16 v12 = 2114;
        id v13 = a3;
        __int16 v14 = 2114;
        uint64_t v15 = @"HID";
        _os_log_impl(&dword_1CFDE2000, v7, OS_LOG_TYPE_DEFAULT, "Removing client connection %{public}@ for client: %{public}@ source:%{public}@", (uint8_t *)&v10, 0x20u);
      }

      objc_msgSend(*(id *)(a1 + 16), "removeObjectForKey:", objc_msgSend(v6, "task"));
      objc_msgSend(*(id *)(a1 + 24), "removeObjectForKey:", (int)objc_msgSend(v6, "pid"));
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "versionedPID"));
      [v8 removeObjectForKey:v9];

      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 40), a3);
      [v6 invalidate];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    CFRelease(a3);
  }
}

void _BKSendHIDEventToClientWithDestination(uint64_t a1, void *a2, char a3)
{
  id v9 = a2;
  if ((a3 & 1) != 0
    || !__BKHIDEventTapCallback
    || ([(id)__HIDClientConnectionManager clientForDestination:v9],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 bundleID],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        LODWORD(v5) = __BKHIDEventTapCallback(a1, 0, v6),
        v6,
        v5))
  {
    uint64_t v7 = [(id)__HIDClientConnectionManager copyClientForDestination:v9];
    if (v7)
    {
      uint64_t v8 = (const void *)v7;
      _BKSendHIDEventToClientConnection(a1, v7);
      CFRelease(v8);
    }
  }
}

void BKSendHIDEventToClientWithTaskPort(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!__BKHIDEventTapCallback || __BKHIDEventTapCallback(a1, a2, 0))
  {
    uint64_t v4 = [(id)__HIDClientConnectionManager copyClientForTaskPort:a2];
    if (v4)
    {
      id v5 = (const void *)v4;
      _BKSendHIDEventToClientConnection(a1, v4);
      CFRelease(v5);
    }
    else
    {
      id v6 = BKLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7[0] = 67109120;
        v7[1] = a2;
        _os_log_impl(&dword_1CFDE2000, v6, OS_LOG_TYPE_DEFAULT, "no client connection for port 0x%X", (uint8_t *)v7, 8u);
      }
    }
  }
}

void _BKSendHIDEventToClientConnection(uint64_t a1, uint64_t a2)
{
  *(void *)&v9[5] = *MEMORY[0x1E4F143B8];
  id v3 = BKLogSendHIDEvent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138543362;
    *(void *)id v9 = a2;
    _os_log_debug_impl(&dword_1CFDE2000, v3, OS_LOG_TYPE_DEBUG, "#BKSendHIDEvent: Sending event to client connection: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  int v4 = IOHIDEventSystemConnectionDispatchEvent();
  if (v4)
  {
    int v5 = v4;
    id v6 = BKLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      IOHIDEventGetType();
      uint64_t Name = IOHIDEventTypeGetName();
      int v8 = 67109378;
      v9[0] = v5;
      LOWORD(v9[1]) = 2114;
      *(void *)((char *)&v9[1] + 2) = Name;
      _os_log_impl(&dword_1CFDE2000, v6, OS_LOG_TYPE_DEFAULT, "#BKSendHIDEvent: IOHIDEventSystemConnectionDispatchEvent error:0x%X -- %{public}@ event dropped", (uint8_t *)&v8, 0x12u);
    }
  }
}

id BKLogSendHIDEvent()
{
  if (BKLogSendHIDEvent_onceToken != -1) {
    dispatch_once(&BKLogSendHIDEvent_onceToken, &__block_literal_global_36);
  }
  v0 = (void *)BKLogSendHIDEvent___logObj;

  return v0;
}

void sub_1CFDECA8C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1CFDECBB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _BKHIDServiceRemoved(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = BKLogHID();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138543362;
    uint64_t v8 = a3;
    _os_log_debug_impl(&dword_1CFDE2000, v5, OS_LOG_TYPE_DEBUG, "Got a service removed callback: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = a1;
  [v6 _serviceWasRemoved];
}

void _BKHIDServiceAdded(os_unfair_lock_s *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v7 = BKLogHID();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v10 = 138543362;
    BOOL v11 = a4;
    _os_log_impl(&dword_1CFDE2000, v7, OS_LOG_TYPE_INFO, "IOServices added: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  if (a4 && CFArrayGetCount((CFArrayRef)a4))
  {
    if (a1)
    {
      id v8 = a4;
      os_unfair_lock_assert_not_owner(a1 + 2);
      os_unfair_lock_lock(a1 + 2);
      -[BKIOHIDServiceMatcher _lock_servicesAdded:]((uint64_t)a1, v8);

      os_unfair_lock_unlock(a1 + 2);
    }
  }
  else
  {
    uint64_t v9 = BKLogHID();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 138543362;
      BOOL v11 = a3;
      _os_log_impl(&dword_1CFDE2000, v9, OS_LOG_TYPE_INFO, "Empty IOService array for sender %{public}@; ignoring",
        (uint8_t *)&v10,
        0xCu);
    }
  }
}

void BKHIDClientConnectionAdditionCallback(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v5 = BKLogHID();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138543362;
    id v13 = a3;
    _os_log_debug_impl(&dword_1CFDE2000, v5, OS_LOG_TYPE_DEBUG, "Got a client addition callback: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  if (a1)
  {
    CFRetain(a3);
    id v6 = (os_unfair_lock_s *)(a1 + 48);
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 48));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    int v7 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), a3);
    if (!v7)
    {
      int v7 = +[BKHIDClientConnection connectionWithConnection:a3];
      if (v7)
      {
        id v8 = BKLogHID();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 138543618;
          id v13 = v7;
          __int16 v14 = 2114;
          uint64_t v15 = a3;
          _os_log_impl(&dword_1CFDE2000, v8, OS_LOG_TYPE_DEFAULT, "Adding client connection: %{public}@ for client: %{public}@", (uint8_t *)&v12, 0x16u);
        }

        int v9 = [v7 pid];
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), a3, v7);
        objc_msgSend(*(id *)(a1 + 16), "setObject:forKey:", v7, objc_msgSend(v7, "task"));
        [*(id *)(a1 + 24) setObject:v7 forKey:v9];
        int v10 = *(void **)(a1 + 32);
        BOOL v11 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v7, "versionedPID"));
        [v10 setObject:v7 forKey:v11];
      }
    }
    os_unfair_lock_unlock(v6);
    CFRelease(a3);
  }
}

id BKLogHID()
{
  if (BKLogHID_onceToken != -1) {
    dispatch_once(&BKLogHID_onceToken, &__block_literal_global_15);
  }
  v0 = (void *)BKLogHID___logObj;

  return v0;
}

void sub_1CFDEF00C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void BKSendHIDEventToClientWithDestination(uint64_t a1, void *a2)
{
}

id _BKDeferringTargetForResolutionTranscript(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  int v9 = ___BKDeferringTargetForResolutionTranscript_block_invoke;
  int v10 = &unk_1E68718D8;
  id v11 = v2;
  id v12 = v1;
  id v3 = v1;
  id v4 = v2;
  [v4 appendProem:0 block:&v7];
  int v5 = objc_msgSend(v4, "description", v7, v8, v9, v10);

  return v5;
}

void _BKDescribeSenderSet(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  int v5 = v4;
  if (!v4)
  {
    id v6 = @"(all senders)";
LABEL_6:
    id v7 = (id)[v3 appendObject:v6 withName:0 skipIfNil:0];
    goto LABEL_7;
  }
  if (![v4 count])
  {
    id v6 = @"(no senders)";
    goto LABEL_6;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ___BKDescribeSenderSet_block_invoke;
  v8[3] = &unk_1E68718D8;
  id v9 = v3;
  id v10 = v5;
  [v9 sameLine:v8];

LABEL_7:
}

void sub_1CFDF6FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id BKHIDCreatePrimaryEventProcessor(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v15 = 0;
  id v2 = _BKHIDEventProcessorConfigurationFromRootRelativePath(@"/System/Library/BackBoard/EventProcessorConfigurationPlatformOverride.plist", &v15);
  id v3 = v15;
  id v4 = v3;
  if (v2)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [v3 domain];
    uint64_t v7 = [v4 code];
    if ([v6 isEqual:*MEMORY[0x1E4F281F8]]) {
      BOOL v8 = (v7 & 0xFFFFFFFFFFFFFEFFLL) == 4;
    }
    else {
      BOOL v8 = 0;
    }
    if (!v8)
    {
      id v9 = BKLogEventDelivery();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        int v17 = @"/System/Library/BackBoard/EventProcessorConfigurationPlatformOverride.plist";
        __int16 v18 = 2114;
        int v19 = v4;
        _os_log_error_impl(&dword_1CFDE2000, v9, OS_LOG_TYPE_ERROR, "cannot decode %{public}@: %{public}@", buf, 0x16u);
      }
    }
    id v14 = v4;
    id v2 = _BKHIDEventProcessorConfigurationFromRootRelativePath(@"/System/Library/BackBoard/EventProcessorConfiguration.plist", &v14);
    id v5 = v14;

    if (!v2)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      id v13 = [NSString stringWithUTF8String:"BKHIDPrimaryEventProcessor * _Nonnull BKHIDCreatePrimaryEventProcessor(BKHIDEventProcessorCreationContext *__strong _Nonnull)"];
      [v12 handleFailureInFunction:v13, @"BKHIDPrimaryEventProcessorFactory.m", 55, @"error reading %@: %@", @"/System/Library/BackBoard/EventProcessorConfiguration.plist", v5 file lineNumber description];
    }
  }
  id v10 = BKHIDCreatePrimaryEventProcessorWithDictionary(v1, v2);

  return v10;
}

id _BKHIDEventProcessorConfigurationFromRootRelativePath(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = BSSystemRootDirectory();
  id v5 = [v4 stringByAppendingPathComponent:v3];

  id v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:0];
  id v11 = 0;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v6 error:&v11];
  id v8 = v11;
  id v9 = v8;
  if (a2 && !v7) {
    *a2 = v8;
  }

  return v7;
}

BKHIDPrimaryEventProcessor *BKHIDCreatePrimaryEventProcessorWithDictionary(void *a1, void *a2)
{
  uint64_t v171 = *MEMORY[0x1E4F143B8];
  id v131 = a1;
  id v132 = a2;
  id v3 = [v132 objectForKeyedSubscript:@"DefaultProcessor"];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  v130 = v7;
  if (!v7)
  {
    v118 = [MEMORY[0x1E4F28B00] currentHandler];
    v119 = [NSString stringWithUTF8String:"void _validateDictionary(NSDictionary *__strong)"];
    [v118 handleFailureInFunction:v119 file:@"BKHIDPrimaryEventProcessorFactory.m" lineNumber:223 description:@"Must have a default processor name"];
  }
  id v8 = [v132 objectForKeyedSubscript:@"CreationOrder"];
  uint64_t v9 = objc_opt_class();
  id v10 = v8;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }
  id v12 = v11;

  if (!v12)
  {
    v120 = [MEMORY[0x1E4F28B00] currentHandler];
    v121 = [NSString stringWithUTF8String:"void _validateDictionary(NSDictionary *__strong)"];
    [v120 handleFailureInFunction:v121 file:@"BKHIDPrimaryEventProcessorFactory.m" lineNumber:226 description:@"Must have a creation order"];
  }
  long long v161 = 0u;
  long long v162 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  id obj = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v159 objects:v169 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v160;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v160 != v15) {
          objc_enumerationMutation(obj);
        }
        int v17 = *(void **)(*((void *)&v159 + 1) + 8 * i);
        uint64_t v18 = objc_opt_class();
        id v19 = v17;
        if (v18)
        {
          if (objc_opt_isKindOfClass()) {
            uint64_t v20 = v19;
          }
          else {
            uint64_t v20 = 0;
          }
        }
        else
        {
          uint64_t v20 = 0;
        }
        id v21 = v20;

        if (!v21)
        {
          v22 = [MEMORY[0x1E4F28B00] currentHandler];
          v23 = [NSString stringWithUTF8String:"void _validateDictionary(NSDictionary *__strong)"];
          [v22 handleFailureInFunction:v23, @"BKHIDPrimaryEventProcessorFactory.m", 230, @"Bad creation order name: %@", v19 file lineNumber description];
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v159 objects:v169 count:16];
    }
    while (v14);
  }

  id v24 = [v132 objectForKeyedSubscript:@"ProcessorChains"];
  uint64_t v25 = objc_opt_class();
  id v26 = v24;
  if (v25)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v27 = v26;
    }
    else {
      uint64_t v27 = 0;
    }
  }
  else
  {
    uint64_t v27 = 0;
  }
  id v28 = v27;

  if (!v28)
  {
    v122 = [MEMORY[0x1E4F28B00] currentHandler];
    v123 = [NSString stringWithUTF8String:"void _validateDictionary(NSDictionary *__strong)"];
    [v122 handleFailureInFunction:v123 file:@"BKHIDPrimaryEventProcessorFactory.m" lineNumber:234 description:@"Must have a chain configuration"];
  }
  id v29 = [MEMORY[0x1E4F1CAD0] setWithArray:obj];
  uint64_t v30 = [v29 count];
  if (v30 != [obj count])
  {
    v124 = [MEMORY[0x1E4F28B00] currentHandler];
    v125 = [NSString stringWithUTF8String:"void _validateDictionary(NSDictionary *__strong)"];
    [v124 handleFailureInFunction:v125 file:@"BKHIDPrimaryEventProcessorFactory.m" lineNumber:237 description:@"Creation order items must be unique"];
  }
  long long v157 = 0u;
  long long v158 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  id v141 = v28;
  uint64_t v138 = [v141 countByEnumeratingWithState:&v155 objects:buf count:16];
  if (v138)
  {
    uint64_t v136 = *(void *)v156;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v156 != v136) {
          objc_enumerationMutation(v141);
        }
        long long v32 = *(void **)(*((void *)&v155 + 1) + 8 * v31);
        uint64_t v33 = objc_opt_class();
        id v34 = v32;
        if (v33)
        {
          if (objc_opt_isKindOfClass()) {
            long long v35 = v34;
          }
          else {
            long long v35 = 0;
          }
        }
        else
        {
          long long v35 = 0;
        }
        id v36 = v35;

        if (!v36)
        {
          id v56 = [MEMORY[0x1E4F28B00] currentHandler];
          int v57 = [NSString stringWithUTF8String:"void _validateDictionary(NSDictionary *__strong)"];
          [v56 handleFailureInFunction:v57, @"BKHIDPrimaryEventProcessorFactory.m", 241, @"Bad event type: %@", v34 file lineNumber description];
        }
        uint64_t v37 = [v141 objectForKeyedSubscript:v36];
        uint64_t v38 = objc_opt_class();
        id v39 = v37;
        uint64_t v146 = v31;
        v149 = v36;
        if (v38)
        {
          if (objc_opt_isKindOfClass()) {
            uint64_t v40 = v39;
          }
          else {
            uint64_t v40 = 0;
          }
        }
        else
        {
          uint64_t v40 = 0;
        }
        id v41 = v40;

        if (!v41)
        {
          v58 = [MEMORY[0x1E4F28B00] currentHandler];
          v59 = [NSString stringWithUTF8String:"void _validateDictionary(NSDictionary *__strong)"];
          [v58 handleFailureInFunction:v59, @"BKHIDPrimaryEventProcessorFactory.m", 245, @"Bad processor chain: %@", v39 file lineNumber description];
        }
        v143 = v39;
        long long v153 = 0u;
        long long v154 = 0u;
        long long v151 = 0u;
        long long v152 = 0u;
        id v42 = v41;
        uint64_t v43 = [v42 countByEnumeratingWithState:&v151 objects:&v163 count:16];
        if (v43)
        {
          uint64_t v44 = v43;
          uint64_t v45 = *(void *)v152;
          do
          {
            for (uint64_t j = 0; j != v44; ++j)
            {
              if (*(void *)v152 != v45) {
                objc_enumerationMutation(v42);
              }
              v47 = *(void **)(*((void *)&v151 + 1) + 8 * j);
              uint64_t v48 = objc_opt_class();
              id v49 = v47;
              if (v48)
              {
                if (objc_opt_isKindOfClass()) {
                  v50 = v49;
                }
                else {
                  v50 = 0;
                }
              }
              else
              {
                v50 = 0;
              }
              id v51 = v50;

              if (!v51)
              {
                long long v52 = [MEMORY[0x1E4F28B00] currentHandler];
                long long v53 = [NSString stringWithUTF8String:"void _validateDictionary(NSDictionary *__strong)"];
                [v52 handleFailureInFunction:v53, @"BKHIDPrimaryEventProcessorFactory.m", 249, @"Bad event processor: %@", v49 file lineNumber description];
              }
              if (([v29 containsObject:v51] & 1) == 0)
              {
                v54 = [MEMORY[0x1E4F28B00] currentHandler];
                id v55 = [NSString stringWithUTF8String:"void _validateDictionary(NSDictionary *__strong)"];
                [v54 handleFailureInFunction:v55, @"BKHIDPrimaryEventProcessorFactory.m", 250, @"Processor chain for %@ contains event processor %@ that does not exist in creation order", v149, v51 file lineNumber description];
              }
            }
            uint64_t v44 = [v42 countByEnumeratingWithState:&v151 objects:&v163 count:16];
          }
          while (v44);
        }

        uint64_t v31 = v146 + 1;
      }
      while (v146 + 1 != v138);
      uint64_t v138 = [v141 countByEnumeratingWithState:&v155 objects:buf count:16];
    }
    while (v138);
  }

  __int16 v60 = [v132 objectForKeyedSubscript:@"CreationOrder"];
  uint64_t v61 = objc_opt_class();
  id v62 = v60;
  if (v61)
  {
    if (objc_opt_isKindOfClass()) {
      v63 = v62;
    }
    else {
      v63 = 0;
    }
  }
  else
  {
    v63 = 0;
  }
  id v64 = v63;

  id v65 = v131;
  id v66 = v64;
  v147 = [MEMORY[0x1E4F1CA60] dictionary];
  v137 = v65;
  v144 = [v65 eventProcessorRegistry];
  id v139 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v163 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  id v142 = v66;
  uint64_t v67 = [v142 countByEnumeratingWithState:&v163 objects:v169 count:16];
  if (v67)
  {
    uint64_t v68 = v67;
    uint64_t v69 = *(void *)v164;
    do
    {
      for (uint64_t k = 0; k != v68; ++k)
      {
        if (*(void *)v164 != v69) {
          objc_enumerationMutation(v142);
        }
        v71 = *(NSString **)(*((void *)&v163 + 1) + 8 * k);
        Class v72 = NSClassFromString(v71);
        if (v72)
        {
          Class v73 = v72;
          if (([(objc_class *)v72 conformsToProtocol:&unk_1F26886C8] & 1) == 0)
          {
            id objb = [MEMORY[0x1E4F28B00] currentHandler];
            v78 = objc_msgSend(NSString, "stringWithUTF8String:", "NSDictionary<NSString *,id<BKHIDEventProcessor>> *_createEventProcessorsWithCreationOrderArray(BKHIDEventProcessorCreationContext *__strong, NSArray<NSString *> *__strong)");
            [objb handleFailureInFunction:v78, @"BKHIDPrimaryEventProcessorFactory.m", 90, @"Class %@ is not an event processor", v71 file lineNumber description];
          }
          if (objc_opt_respondsToSelector())
          {
            v74 = [(objc_class *)v73 performSelector:sel_sharedInstance];
          }
          else if ([(objc_class *)v73 instancesRespondToSelector:sel_initWithContext_])
          {
            v74 = [[v73 alloc] initWithContext:v137];
          }
          else
          {
            v74 = objc_alloc_init(v73);
          }
          v75 = v74;
          v76 = BKLogEventDelivery();
          BOOL v77 = os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT);
          if (v75)
          {
            if (v77)
            {
              *(_DWORD *)buf = 138543362;
              v168 = v75;
              _os_log_impl(&dword_1CFDE2000, v76, OS_LOG_TYPE_DEFAULT, "Registered %{public}@", buf, 0xCu);
            }

            [v147 setObject:v75 forKeyedSubscript:v71];
            [v144 addEventProcessor:v75];
            if (objc_opt_respondsToSelector()) {
              [v139 addObject:v75];
            }
          }
          else
          {
            if (v77)
            {
              *(_DWORD *)buf = 138543362;
              v168 = v71;
              _os_log_impl(&dword_1CFDE2000, v76, OS_LOG_TYPE_DEFAULT, "Could not create event processor of class %{public}@", buf, 0xCu);
            }

            v75 = 0;
          }
        }
        else
        {
          v75 = BKLogEventDelivery();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v168 = v71;
            _os_log_impl(&dword_1CFDE2000, v75, OS_LOG_TYPE_DEFAULT, "Event processor class %{public}@ does not exist", buf, 0xCu);
          }
        }
      }
      uint64_t v68 = [v142 countByEnumeratingWithState:&v163 objects:v169 count:16];
    }
    while (v68);
  }

  long long v161 = 0u;
  long long v162 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  id v79 = v139;
  uint64_t v80 = [v79 countByEnumeratingWithState:&v159 objects:buf count:16];
  if (v80)
  {
    uint64_t v81 = v80;
    uint64_t v82 = *(void *)v160;
    do
    {
      for (uint64_t m = 0; m != v81; ++m)
      {
        if (*(void *)v160 != v82) {
          objc_enumerationMutation(v79);
        }
        [*(id *)(*((void *)&v159 + 1) + 8 * m) didInitializeRegistryWithContext:v137];
      }
      uint64_t v81 = [v79 countByEnumeratingWithState:&v159 objects:buf count:16];
    }
    while (v81);
  }

  if (![v147 count])
  {
    v126 = [MEMORY[0x1E4F28B00] currentHandler];
    v127 = objc_msgSend(NSString, "stringWithUTF8String:", "BKHIDPrimaryEventProcessor * _Nonnull BKHIDCreatePrimaryEventProcessorWithDictionary(BKHIDEventProcessorCreationContext *__strong _Nonnull, NSDictionary *__strong _Nonnull)");
    [v126 handleFailureInFunction:v127 file:@"BKHIDPrimaryEventProcessorFactory.m" lineNumber:65 description:@"Failed to create event processors from creation order data"];
  }
  v84 = [v132 objectForKeyedSubscript:@"DefaultProcessor"];
  uint64_t v85 = objc_opt_class();
  id v86 = v84;
  if (v85)
  {
    if (objc_opt_isKindOfClass()) {
      v87 = v86;
    }
    else {
      v87 = 0;
    }
  }
  else
  {
    v87 = 0;
  }
  id v88 = v87;

  v140 = v88;
  v89 = [v147 objectForKeyedSubscript:v88];
  if (!v89)
  {
    v128 = [MEMORY[0x1E4F28B00] currentHandler];
    v129 = objc_msgSend(NSString, "stringWithUTF8String:", "BKHIDPrimaryEventProcessor * _Nonnull BKHIDCreatePrimaryEventProcessorWithDictionary(BKHIDEventProcessorCreationContext *__strong _Nonnull, NSDictionary *__strong _Nonnull)");
    [v128 handleFailureInFunction:v129 file:@"BKHIDPrimaryEventProcessorFactory.m" lineNumber:69 description:@"Failed to create a default event processor"];
  }
  v90 = [v132 objectForKeyedSubscript:@"ProcessorChains"];
  uint64_t v91 = objc_opt_class();
  id v92 = v90;
  if (v91)
  {
    if (objc_opt_isKindOfClass()) {
      v93 = v92;
    }
    else {
      v93 = 0;
    }
  }
  else
  {
    v93 = 0;
  }
  id v94 = v93;

  id v95 = v147;
  id v96 = v94;
  id obja = v89;
  uint64_t v170 = 0;
  memset(v169, 0, sizeof(v169));
  long long v161 = 0u;
  long long v162 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  v150 = v96;
  uint64_t v148 = [v96 countByEnumeratingWithState:&v159 objects:buf count:16];
  if (v148)
  {
    uint64_t v145 = *(void *)v160;
    do
    {
      uint64_t v97 = 0;
      do
      {
        if (*(void *)v160 != v145) {
          objc_enumerationMutation(v150);
        }
        v98 = *(void **)(*((void *)&v159 + 1) + 8 * v97);
        v99 = [MEMORY[0x1E4F1CA48] array];
        long long v155 = 0u;
        long long v156 = 0u;
        long long v157 = 0u;
        long long v158 = 0u;
        v100 = [v150 objectForKeyedSubscript:v98];
        uint64_t v101 = [v100 countByEnumeratingWithState:&v155 objects:&v163 count:16];
        if (v101)
        {
          uint64_t v102 = v101;
          uint64_t v103 = *(void *)v156;
          do
          {
            for (uint64_t n = 0; n != v102; ++n)
            {
              if (*(void *)v156 != v103) {
                objc_enumerationMutation(v100);
              }
              v105 = [v95 objectForKeyedSubscript:*(void *)(*((void *)&v155 + 1) + 8 * n)];
              if (v105) {
                [v99 addObject:v105];
              }
            }
            uint64_t v102 = [v100 countByEnumeratingWithState:&v155 objects:&v163 count:16];
          }
          while (v102);
        }

        if ([v99 count])
        {
          id v106 = v98;
          if (_eventTypeFromName_onceToken != -1) {
            dispatch_once(&_eventTypeFromName_onceToken, &__block_literal_global_519);
          }
          uint64_t v107 = [(id)_eventTypeFromName_nameToEventTypeMap objectForKeyedSubscript:v106];
          if (v107)
          {
            v108 = (void *)v107;
          }
          else if (![v106 hasPrefix:@"kIOHIDEventType"] {
                 || ([v106 stringByReplacingCharactersInRange:0, objc_msgSend(@"kIOHIDEventType", "length"), &stru_1F267F920 withString], v109 = objc_claimAutoreleasedReturnValue(), v106, objc_msgSend((id)_eventTypeFromName_nameToEventTypeMap, "objectForKeyedSubscript:", v109), v108 = objc_claimAutoreleasedReturnValue(), id v106 = (id)v109, !v108))
          }
          {
            v110 = [MEMORY[0x1E4F28B00] currentHandler];
            v111 = [NSString stringWithUTF8String:"IOHIDEventType _eventTypeFromName(NSString *__strong)"];
            [v110 handleFailureInFunction:v111, @"BKHIDPrimaryEventProcessorFactory.m", 216, @"Unknown event type %@", v106 file lineNumber description];

            v108 = 0;
          }
          unsigned int v112 = [v108 intValue];

          objc_storeStrong((id *)v169 + v112, v99);
        }

        ++v97;
      }
      while (v97 != v148);
      uint64_t v148 = [v150 countByEnumeratingWithState:&v159 objects:buf count:16];
    }
    while (v148);
  }
  v113 = [[BKHIDPrimaryEventProcessor alloc] initWithSubProcessors:v169 defaultProcessor:obja];
  for (iuint64_t i = 336; ii != -8; ii -= 8)

  v115 = [v137 eventProcessorRegistry];
  [v115 addEventProcessor:v113];
  v116 = v113;

  return v116;
}

void ___eventTypeFromName_block_invoke()
{
  v0 = (void *)_eventTypeFromName_nameToEventTypeMap;
  _eventTypeFromName_nameToEventTypeMap = (uint64_t)&unk_1F2686998;
}

uint64_t BKHIDEventRoutingInit(uint64_t a1)
{
  __HIDClientConnectionManager = [[BKHIDClientConnectionManager alloc] initWithHIDEventSystem:a1];

  return MEMORY[0x1F41817F8]();
}

void *BKGetEventTapCallback()
{
  return __BKEventTapCallback;
}

void *BKSetEventTapCallback(void *result)
{
  __BKEventTapCallbacuint64_t k = result;
  return result;
}

void BKSendGSEvent(int *a1, uint64_t a2, int a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!__BKEventTapCallback || __BKEventTapCallback(a1))
  {
    mach_error_t v5 = a3 ? GSSendSystemAppEvent() : GSSendEvent();
    mach_error_t v6 = v5;
    if (v5)
    {
      id v7 = BKLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = *a1;
        int v9 = 136315906;
        id v10 = "BKSendGSEvent";
        __int16 v11 = 1024;
        int v12 = v8;
        __int16 v13 = 2082;
        uint64_t v14 = mach_error_string(v6);
        __int16 v15 = 1024;
        mach_error_t v16 = v6;
        _os_log_impl(&dword_1CFDE2000, v7, OS_LOG_TYPE_DEFAULT, "%s ERROR sending event type %d: %{public}s (0x%X)", (uint8_t *)&v9, 0x22u);
      }
    }
  }
}

void *BKGetHIDEventTapCallback()
{
  return __BKHIDEventTapCallback;
}

void *BKSetHIDEventTapCallback(void *result)
{
  __BKHIDEventTapCallbacuint64_t k = result;
  return result;
}

void BKSendHIDEventToClientWithDestinationAsRedirect(uint64_t a1, void *a2)
{
}

void _BKHIDServiceWillTerminate(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  mach_error_t v5 = BKLogHID();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    uint64_t v8 = a3;
    _os_log_impl(&dword_1CFDE2000, v5, OS_LOG_TYPE_DEFAULT, "Got a service willTerminate callback: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = a1;
  [v6 _serviceWasRemoved];
}

void sub_1CFDF9B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1CFDFA23C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void _BKHIDSetUserEventNotifier(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    mach_error_t v5 = [NSString stringWithUTF8String:"void _BKHIDSetUserEventNotifier(__strong id<BKHIDUserEventNotifying> _Nonnull)"];
    [v4 handleFailureInFunction:v5 file:@"BKHIDUserEventNotifying.m" lineNumber:14 description:@"userEventNotifier must not be nil"];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___BKHIDSetUserEventNotifier_block_invoke;
  block[3] = &unk_1E68713E0;
  id v7 = v1;
  uint64_t v2 = _BKHIDSetUserEventNotifier_onceToken;
  id v3 = v1;
  if (v2 != -1) {
    dispatch_once(&_BKHIDSetUserEventNotifier_onceToken, block);
  }
}

__CFString *NSStringFromBKHIDEventSequencePosition(unint64_t a1)
{
  if (a1 > 3) {
    return @"<whuh?>";
  }
  else {
    return off_1E6871498[a1];
  }
}

id BKLogBootUI()
{
  if (BKLogBootUI_onceToken != -1) {
    dispatch_once(&BKLogBootUI_onceToken, &__block_literal_global_1660);
  }
  v0 = (void *)BKLogBootUI___logObj;

  return v0;
}

uint64_t __BKLogBootUI_block_invoke()
{
  BKLogBootUI___logObuint64_t j = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F4F180], "BootUI");

  return MEMORY[0x1F41817F8]();
}

id BKLogButton()
{
  if (BKLogButton_onceToken != -1) {
    dispatch_once(&BKLogButton_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)BKLogButton___logObj;

  return v0;
}

uint64_t __BKLogButton_block_invoke()
{
  BKLogButton___logObuint64_t j = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F4F180], "Button");

  return MEMORY[0x1F41817F8]();
}

id BKLogDisplayAnnotations()
{
  if (BKLogDisplayAnnotations_onceToken != -1) {
    dispatch_once(&BKLogDisplayAnnotations_onceToken, &__block_literal_global_6);
  }
  v0 = (void *)BKLogDisplayAnnotations___logObj;

  return v0;
}

uint64_t __BKLogDisplayAnnotations_block_invoke()
{
  BKLogDisplayAnnotations___logObuint64_t j = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F4F180], "DisplayAnnotations");

  return MEMORY[0x1F41817F8]();
}

id BKLogDisplayMonitor()
{
  if (BKLogDisplayMonitor_onceToken != -1) {
    dispatch_once(&BKLogDisplayMonitor_onceToken, &__block_literal_global_9);
  }
  v0 = (void *)BKLogDisplayMonitor___logObj;

  return v0;
}

uint64_t __BKLogDisplayMonitor_block_invoke()
{
  BKLogDisplayMonitor___logObuint64_t j = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F4F180], "DisplayMonitor");

  return MEMORY[0x1F41817F8]();
}

id BKLogGenericGesture()
{
  if (BKLogGenericGesture_onceToken != -1) {
    dispatch_once(&BKLogGenericGesture_onceToken, &__block_literal_global_12);
  }
  v0 = (void *)BKLogGenericGesture___logObj;

  return v0;
}

uint64_t __BKLogGenericGesture_block_invoke()
{
  BKLogGenericGesture___logObuint64_t j = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F4F180], "GenericGesture");

  return MEMORY[0x1F41817F8]();
}

uint64_t __BKLogHID_block_invoke()
{
  BKLogHID___logObuint64_t j = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F4F180], "HID");

  return MEMORY[0x1F41817F8]();
}

id BKLogIdleTimer()
{
  if (BKLogIdleTimer_onceToken != -1) {
    dispatch_once(&BKLogIdleTimer_onceToken, &__block_literal_global_18);
  }
  v0 = (void *)BKLogIdleTimer___logObj;

  return v0;
}

uint64_t __BKLogIdleTimer_block_invoke()
{
  BKLogIdleTimer___logObuint64_t j = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F4F180], "IdleTimer");

  return MEMORY[0x1F41817F8]();
}

id BKLogRenderOverlay()
{
  if (BKLogRenderOverlay_onceToken != -1) {
    dispatch_once(&BKLogRenderOverlay_onceToken, &__block_literal_global_21);
  }
  v0 = (void *)BKLogRenderOverlay___logObj;

  return v0;
}

uint64_t __BKLogRenderOverlay_block_invoke()
{
  BKLogRenderOverlay___logObuint64_t j = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F4F180], "RenderOverlay");

  return MEMORY[0x1F41817F8]();
}

id BKLogHapticFeedback()
{
  if (BKLogHapticFeedback_onceToken != -1) {
    dispatch_once(&BKLogHapticFeedback_onceToken, &__block_literal_global_24);
  }
  v0 = (void *)BKLogHapticFeedback___logObj;

  return v0;
}

uint64_t __BKLogHapticFeedback_block_invoke()
{
  BKLogHapticFeedback___logObuint64_t j = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F4F180], "HapticFeedback");

  return MEMORY[0x1F41817F8]();
}

id BKLogAccelerometer()
{
  if (BKLogAccelerometer_onceToken != -1) {
    dispatch_once(&BKLogAccelerometer_onceToken, &__block_literal_global_27);
  }
  v0 = (void *)BKLogAccelerometer___logObj;

  return v0;
}

uint64_t __BKLogAccelerometer_block_invoke()
{
  BKLogAccelerometer___logObuint64_t j = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F4F180], "Accelerometer");

  return MEMORY[0x1F41817F8]();
}

id BKLogKeyPresses()
{
  if (BKLogKeyPresses_onceToken != -1) {
    dispatch_once(&BKLogKeyPresses_onceToken, &__block_literal_global_30);
  }
  v0 = (void *)BKLogKeyPresses___logObj;

  return v0;
}

uint64_t __BKLogKeyPresses_block_invoke()
{
  BKLogKeyPresses___logObuint64_t j = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F4F180], "KeyPresses");

  return MEMORY[0x1F41817F8]();
}

id BKLogMotionEvents()
{
  if (BKLogMotionEvents_onceToken != -1) {
    dispatch_once(&BKLogMotionEvents_onceToken, &__block_literal_global_33);
  }
  v0 = (void *)BKLogMotionEvents___logObj;

  return v0;
}

uint64_t __BKLogMotionEvents_block_invoke()
{
  BKLogMotionEvents___logObuint64_t j = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F4F180], "MotionEvents");

  return MEMORY[0x1F41817F8]();
}

uint64_t __BKLogSendHIDEvent_block_invoke()
{
  BKLogSendHIDEvent___logObuint64_t j = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F4F180], "SendHIDEvent");

  return MEMORY[0x1F41817F8]();
}

void sub_1CFE01C1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t BKLogCommon()
{
  return MEMORY[0x1F410BD90]();
}

uint64_t BKLogEventDelivery()
{
  return MEMORY[0x1F410BDA0]();
}

uint64_t BKLogEventDeliveryBuffering()
{
  return MEMORY[0x1F410BDA8]();
}

uint64_t BKLogEventDeliveryMatching()
{
  return MEMORY[0x1F410BDB0]();
}

uint64_t BKSHIDEventGetBaseAttributes()
{
  return MEMORY[0x1F410BE80]();
}

uint64_t BKSHIDEventGetConciseDescription()
{
  return MEMORY[0x1F410BE88]();
}

uint64_t BKSHIDEventSetSimpleDeliveryInfo()
{
  return MEMORY[0x1F410BF10]();
}

uint64_t BSAuditTokenForTask()
{
  return MEMORY[0x1F410C160]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1F410C2A8]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1F410C2E8]();
}

uint64_t BSEqualSets()
{
  return MEMORY[0x1F410C2F0]();
}

uint64_t BSIntegerMapEnumerateWithBlock()
{
  return MEMORY[0x1F410C390]();
}

uint64_t BSPIDForAuditToken()
{
  return MEMORY[0x1F410C4A8]();
}

uint64_t BSProcessDescriptionForPID()
{
  return MEMORY[0x1F410C4F8]();
}

uint64_t BSSystemRootDirectory()
{
  return MEMORY[0x1F410C678]();
}

uint64_t BSVersionedPIDForAuditToken()
{
  return MEMORY[0x1F410C6B8]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F28](allocator, propertyList, mutabilityOption);
}

Boolean CFPropertyListIsValid(CFPropertyListRef plist, CFPropertyListFormat format)
{
  return MEMORY[0x1F40D7F68](plist, format);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

void CFStringAppendFormatAndArguments(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1F40D8498](alloc, formatOptions, format, arguments);
}

uint64_t GSEventDeviceOrientation()
{
  return MEMORY[0x1F411C8A0]();
}

uint64_t GSEventGetType()
{
  return MEMORY[0x1F411C8D8]();
}

uint64_t GSEventRemoveShouldRouteToFrontMost()
{
  return MEMORY[0x1F411C928]();
}

uint64_t GSEventShouldRouteToFrontMost()
{
  return MEMORY[0x1F411C948]();
}

uint64_t GSSendEvent()
{
  return MEMORY[0x1F411CA10]();
}

uint64_t GSSendSystemAppEvent()
{
  return MEMORY[0x1F411CA18]();
}

uint64_t IOHIDEventCreateCopy()
{
  return MEMORY[0x1F40E8900]();
}

uint64_t IOHIDEventGetAttributeDataLength()
{
  return MEMORY[0x1F40E89B8]();
}

uint64_t IOHIDEventGetAttributeDataPtr()
{
  return MEMORY[0x1F40E89C0]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x1F40E8A00]();
}

uint64_t IOHIDEventGetSenderID()
{
  return MEMORY[0x1F40E8A20]();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return MEMORY[0x1F40E8A28]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x1F40E8A38]();
}

uint64_t IOHIDEventSystemClientCreate()
{
  return MEMORY[0x1F40E8AC0]();
}

uint64_t IOHIDEventSystemConnectionDispatchEvent()
{
  return MEMORY[0x1F40E8B98]();
}

uint64_t IOHIDEventSystemConnectionGetAttribute()
{
  return MEMORY[0x1F40E8BA0]();
}

uint64_t IOHIDEventSystemConnectionGetTaskNamePort()
{
  return MEMORY[0x1F40E8BB0]();
}

uint64_t IOHIDEventSystemCopyConnections()
{
  return MEMORY[0x1F40E8BC0]();
}

uint64_t IOHIDEventSystemCopyServices()
{
  return MEMORY[0x1F40E8BD0]();
}

uint64_t IOHIDEventSystemCreate()
{
  return MEMORY[0x1F40E8BD8]();
}

uint64_t IOHIDEventSystemGetProperty()
{
  return MEMORY[0x1F40E8BE0]();
}

uint64_t IOHIDEventSystemOpen()
{
  return MEMORY[0x1F40E8BE8]();
}

uint64_t IOHIDEventSystemRegisterConnectionAdditionCallback()
{
  return MEMORY[0x1F40E8BF0]();
}

uint64_t IOHIDEventSystemRegisterConnectionRemovalCallback()
{
  return MEMORY[0x1F40E8BF8]();
}

uint64_t IOHIDEventSystemSetProperty()
{
  return MEMORY[0x1F40E8C10]();
}

uint64_t IOHIDEventSystemUnregisterConnectionAdditionCallback()
{
  return MEMORY[0x1F40E8C18]();
}

uint64_t IOHIDEventSystemUnregisterConnectionRemovalCallback()
{
  return MEMORY[0x1F40E8C20]();
}

uint64_t IOHIDEventTypeGetName()
{
  return MEMORY[0x1F40E8C30]();
}

uint64_t IOHIDServiceCreateRemovalNotification()
{
  return MEMORY[0x1F40E8D80]();
}

uint64_t IOHIDServiceCreateRequestTerminationNotification()
{
  return MEMORY[0x1F40E8D88]();
}

uint64_t IOHIDServiceGetProperty()
{
  return MEMORY[0x1F40E8D90]();
}

uint64_t IOHIDServiceGetRegistryID()
{
  return MEMORY[0x1F40E8D98]();
}

uint64_t IOHIDServiceSetElementValue()
{
  return MEMORY[0x1F40E8DA8]();
}

uint64_t IOHIDServiceSetProperty()
{
  return MEMORY[0x1F40E8DB0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

uint64_t NSStringFromBKSHIDEventSource()
{
  return MEMORY[0x1F410C070]();
}

uint64_t NSStringFromBSVersionedPID()
{
  return MEMORY[0x1F410C6C8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _GSEventGetGSEventRecord()
{
  return MEMORY[0x1F411CA30]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1F410C6F0]();
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40CC940](*(void *)&error_value);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}