@interface IMIDStatusController
+ (id)sharedInstance;
- (IMIDStatusController)init;
- (NSMutableSet)_servicesRegistered;
- (NSRecursiveLock)_servicesLock;
- (int64_t)__statusForID:(id)a3 onService:(id)a4 isCanonicalized:(BOOL)a5;
- (int64_t)_idStatusForID:(id)a3 onAccount:(id)a4;
- (int64_t)_idStatusForID:(id)a3 onService:(id)a4;
- (int64_t)_statusForCanonicalizedID:(id)a3 onService:(id)a4;
- (int64_t)statusForID:(id)a3 onService:(id)a4;
- (void)_processIDStatusResponseForURI:(id)a3 resultStatus:(int64_t)a4 forService:(id)a5;
- (void)_requestStatusForID:(id)a3 onService:(id)a4 onAccount:(id)a5;
- (void)requestStatusForID:(id)a3 onAccount:(id)a4;
- (void)requestStatusForID:(id)a3 onService:(id)a4;
- (void)set_servicesLock:(id)a3;
- (void)set_servicesRegistered:(id)a3;
@end

@implementation IMIDStatusController

+ (id)sharedInstance
{
  if (qword_1EB3F24E0 != -1) {
    dispatch_once(&qword_1EB3F24E0, &unk_1EF8E5678);
  }
  v2 = (void *)qword_1EB3F2540;

  return v2;
}

- (IMIDStatusController)init
{
  v9.receiver = self;
  v9.super_class = (Class)IMIDStatusController;
  v2 = [(IMIDStatusController *)&v9 init];
  v3 = v2;
  if (v2)
  {
    if (!v2->_servicesRegistered)
    {
      v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      servicesRegistered = v3->_servicesRegistered;
      v3->_servicesRegistered = v4;
    }
    v6 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    servicesLock = v3->_servicesLock;
    v3->_servicesLock = v6;
  }
  return v3;
}

- (void)_processIDStatusResponseForURI:(id)a3 resultStatus:(int64_t)a4 forService:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A4C0FE0C;
  block[3] = &unk_1E5B7D9C8;
  id v12 = v8;
  id v13 = v7;
  int64_t v14 = a4;
  id v9 = v7;
  id v10 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (int64_t)__statusForID:(id)a3 onService:(id)a4 isCanonicalized:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ((unint64_t)objc_msgSend_length(v8, v10, v11, v12) >= 2
    && objc_msgSend_characterAtIndex_(v8, v13, 1, v15) == 58)
  {
    int64_t v16 = 3;
  }
  else
  {
    int64_t v16 = 0;
    if (v8 && v9)
    {
      if (v5)
      {
        uint64_t v17 = objc_msgSend__bestGuessURIFromCanicalizedID(v8, v13, v14, v15);
      }
      else
      {
        if (objc_msgSend__appearsToBePhoneNumber(v8, v13, v14, v15)
          && (objc_msgSend_hasPrefix_(v8, v18, @"+", v20) & 1) == 0)
        {
          uint64_t v21 = IMCleanupPhoneNumber();

          id v8 = (id)v21;
        }
        uint64_t v17 = objc_msgSend__bestGuessURI(v8, v18, v19, v20);
      }
      v22 = (void *)v17;
      if (IMOSLoggingEnabled())
      {
        v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&buf[4] = v8;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v9;
          *(_WORD *)&buf[22] = 2112;
          v58 = v22;
          _os_log_impl(&dword_1A4AF7000, v26, OS_LOG_TYPE_DEBUG, "ID %@  onService: %@   (URI: %@)", buf, 0x20u);
        }
      }
      v27 = sub_1A4C10678(v9, v23, v24, v25);
      objc_msgSend_lock(self->_servicesLock, v28, v29, v30);
      if ((objc_msgSend_containsObject_(self->_servicesRegistered, v31, (uint64_t)v27, v32) & 1) == 0)
      {
        objc_msgSend_addObject_(self->_servicesRegistered, v33, (uint64_t)v27, v35);
        v39 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6AB38], v36, v37, v38);
        objc_msgSend_addDelegate_forService_listenerID_queue_(v39, v40, (uint64_t)self, (uint64_t)v27, @"IMIDStatusControllerListenerID", MEMORY[0x1E4F14428]);
      }
      objc_msgSend_unlock(self->_servicesLock, v33, v34, v35);
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      v58 = 0;
      if (qword_1E965EA68 != -1) {
        dispatch_once(&qword_1E965EA68, &unk_1EF8E5C38);
      }
      pthread_mutex_lock(&stru_1E965C550);
      v44 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6AB38], v41, v42, v43);
      int hasCacheForService = objc_msgSend__hasCacheForService_(v44, v45, (uint64_t)v27, v46);

      v49 = (void *)MEMORY[0x1E4F6E7B8];
      if (hasCacheForService)
      {
        uint64_t v50 = objc_msgSend__currentCachedIDStatusForDestination_service_listenerID_(MEMORY[0x1E4F6E7B8], v48, (uint64_t)v22, (uint64_t)v27, @"IMIDStatusControllerListenerID");
        *(void *)(*(void *)&buf[8] + 24) = v50;
      }
      else
      {
        v51 = dispatch_get_global_queue(0, 0);
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = sub_1A4C106FC;
        v56[3] = &unk_1E5B7E368;
        v56[4] = buf;
        objc_msgSend_currentIDStatusForDestination_service_listenerID_queue_completionBlock_(v49, v52, (uint64_t)v22, (uint64_t)v27, @"IMIDStatusControllerListenerID", v51, v56);

        v53 = qword_1E965EA60;
        dispatch_time_t v54 = dispatch_time(0, 5000000);
        dispatch_semaphore_wait(v53, v54);
      }
      pthread_mutex_unlock(&stru_1E965C550);
      int64_t v16 = *(void *)(*(void *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);
    }
  }

  return v16;
}

- (int64_t)_idStatusForID:(id)a3 onService:(id)a4
{
  return MEMORY[0x1F4181798](self, sel___statusForID_onService_isCanonicalized_, a3, a4);
}

- (int64_t)_statusForCanonicalizedID:(id)a3 onService:(id)a4
{
  return MEMORY[0x1F4181798](self, sel___statusForID_onService_isCanonicalized_, a3, a4);
}

- (int64_t)_idStatusForID:(id)a3 onAccount:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = IMCleanupPhoneNumber();
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412546;
      v22 = v6;
      __int16 v23 = 2112;
      uint64_t v24 = (uint64_t)v5;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "ID %@  onAccount: %@", (uint8_t *)&v21, 0x16u);
    }
  }
  uint64_t v11 = 0;
  if (v5 && v6)
  {
    uint64_t v12 = objc_msgSend_service(v5, v7, v8, v9);
    uint64_t v11 = objc_msgSend__idStatusForID_onService_(self, v13, (uint64_t)v6, (uint64_t)v12);

    int64_t v16 = objc_msgSend_existingIMHandleWithID_(v5, v14, (uint64_t)v6, v15);
    objc_msgSend__setIDStatus_(v16, v17, v11, v18);
    if (IMOSLoggingEnabled())
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        int v21 = 138412546;
        v22 = v6;
        __int16 v23 = 2048;
        uint64_t v24 = v11;
        _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "Status for %@ is %ld", (uint8_t *)&v21, 0x16u);
      }
    }
  }

  return v11;
}

- (void)_requestStatusForID:(id)a3 onService:(id)a4 onAccount:(id)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (uint64_t)a4;
  uint64_t v10 = (uint64_t)a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v54 = v8;
      __int16 v55 = 2112;
      uint64_t v56 = v9;
      __int16 v57 = 2112;
      uint64_t v58 = v10;
      _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_DEBUG, "ID %@  onService: %@  onAccount: %@", buf, 0x20u);
    }
  }
  if (v8)
  {
    if (v9 | v10)
    {
      if (!v10)
      {
        uint64_t v15 = objc_msgSend_sharedInstance(IMAccountController, v11, v12, v13);
        uint64_t v10 = objc_msgSend__bestOperationalAccountForSendingForService_(v15, v16, v9, v17);
      }
      if (!v9)
      {
        uint64_t v9 = objc_msgSend_service((void *)v10, v11, v12, v13);
      }
      if (objc_msgSend__isUsableForSending((void *)v10, v11, v12, v13)
        && objc_msgSend_supportsIDStatusLookup((void *)v9, v18, v19, v20))
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v54 = v8;
            __int16 v55 = 2112;
            uint64_t v56 = v9;
            _os_log_impl(&dword_1A4AF7000, v24, OS_LOG_TYPE_INFO, "Sending request to daemon for ID %@ onService %@", buf, 0x16u);
          }
        }
        if (objc_msgSend__appearsToBePhoneNumber(v8, v21, v22, v23)) {
          uint64_t v25 = MEMORY[0x1A6262E70](v8, 0, 1);
        }
        else {
          uint64_t v25 = MEMORY[0x1A6262E50](v8);
        }
        uint64_t v30 = (void *)v25;
        v31 = sub_1A4C10678((void *)v9, v26, v27, v28);
        objc_msgSend_lock(self->_servicesLock, v32, v33, v34);
        if ((objc_msgSend_containsObject_(self->_servicesRegistered, v35, (uint64_t)v31, v36) & 1) == 0)
        {
          objc_msgSend_addObject_(self->_servicesRegistered, v37, (uint64_t)v31, v39);
          uint64_t v43 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6AB38], v40, v41, v42);
          objc_msgSend_addDelegate_forService_listenerID_queue_(v43, v44, (uint64_t)self, (uint64_t)v31, @"IMIDStatusControllerListenerID", MEMORY[0x1E4F14428]);
        }
        objc_msgSend_unlock(self->_servicesLock, v37, v38, v39);
        v45 = (void *)MEMORY[0x1E4F6E7B8];
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = sub_1A4C10CE8;
        v49[3] = &unk_1E5B7E390;
        id v50 = v30;
        v51 = self;
        id v52 = v31;
        id v46 = v31;
        id v47 = v30;
        objc_msgSend_refreshIDStatusForDestination_service_listenerID_queue_completionBlock_(v45, v48, (uint64_t)v47, (uint64_t)v46, @"IMIDStatusControllerListenerID", MEMORY[0x1E4F14428], v49);
      }
      else if (IMOSLoggingEnabled())
      {
        uint64_t v29 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v54 = v8;
          __int16 v55 = 2112;
          uint64_t v56 = v9;
          _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, "Cannot issue ID status for ID: %@   on service: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v9 = 0;
    }
  }
}

- (void)requestStatusForID:(id)a3 onService:(id)a4
{
}

- (void)requestStatusForID:(id)a3 onAccount:(id)a4
{
}

- (int64_t)statusForID:(id)a3 onService:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_DEBUG, "ID %@  onService: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  int64_t v10 = objc_msgSend__idStatusForID_onService_(self, v8, (uint64_t)v6, (uint64_t)v7);

  return v10;
}

- (NSRecursiveLock)_servicesLock
{
  return self->_servicesLock;
}

- (void)set_servicesLock:(id)a3
{
}

- (NSMutableSet)_servicesRegistered
{
  return self->_servicesRegistered;
}

- (void)set_servicesRegistered:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_servicesRegistered, 0);

  objc_storeStrong((id *)&self->_servicesLock, 0);
}

@end