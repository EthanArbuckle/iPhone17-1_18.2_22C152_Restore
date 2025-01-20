@interface IMHandleStatusManager
+ (id)sharedInstance;
- (IMHandleStatusManager)init;
- (NSMapTable)handlesForObserver;
- (NSMapTable)observers;
- (id)acquireObservationAssertionForHandle:(id)a3;
- (void)adjustObservingStatusForHandles;
- (void)beginObservingAvailabilityForHandle:(id)a3;
- (void)beginObservingOffGridStateForHandle:(id)a3;
- (void)beginObservingStatusUpdatesForHandle:(id)a3;
- (void)endObservingAvailabilityForHandle:(id)a3;
- (void)endObservingOffGridStateForHandle:(id)a3;
- (void)endObservingStatusUpdatesForHandle:(id)a3;
- (void)invalidateObserver:(id)a3;
@end

@implementation IMHandleStatusManager

- (IMHandleStatusManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)IMHandleStatusManager;
  v5 = [(IMHandleStatusManager *)&v14 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E4F28E10], v2, v3, v4);
    observers = v5->_observers;
    v5->_observers = (NSMapTable *)v6;

    uint64_t v11 = objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E4F28E10], v8, v9, v10);
    handlesForObserver = v5->_handlesForObserver;
    v5->_handlesForObserver = (NSMapTable *)v11;
  }
  return v5;
}

+ (id)sharedInstance
{
  if (qword_1EB3F2460 != -1) {
    dispatch_once(&qword_1EB3F2460, &unk_1EF8E55B8);
  }
  v2 = (void *)qword_1EB3F2480;

  return v2;
}

- (id)acquireObservationAssertionForHandle:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v12 = objc_msgSend_ID(v4, v9, v10, v11);
      int v49 = 138412290;
      v50 = v12;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Vending a new observer for handle %@", (uint8_t *)&v49, 0xCu);
    }
  }
  v13 = objc_msgSend_observers(self, v5, v6, v7);
  v17 = objc_msgSend_ID(v4, v14, v15, v16);
  v20 = objc_msgSend_objectForKey_(v13, v18, (uint64_t)v17, v19);

  if (!v20)
  {
    v20 = objc_msgSend_weakObjectsHashTable(MEMORY[0x1E4F28D30], v21, v22, v23);
    v27 = objc_msgSend_observers(self, v24, v25, v26);
    v31 = objc_msgSend_ID(v4, v28, v29, v30);
    objc_msgSend_setObject_forKey_(v27, v32, (uint64_t)v20, (uint64_t)v31);

    v36 = objc_msgSend_handlesForObserver(self, v33, v34, v35);
    v40 = objc_msgSend_ID(v4, v37, v38, v39);
    objc_msgSend_setObject_forKey_(v36, v41, (uint64_t)v4, (uint64_t)v40);
  }
  objc_msgSend_beginObservingStatusUpdatesForHandle_(self, v21, (uint64_t)v4, v23);
  v42 = [IMHandleStatusObserverAssertion alloc];
  v45 = objc_msgSend_initWithHandle_(v42, v43, (uint64_t)v4, v44);
  objc_msgSend_addObject_(v20, v46, (uint64_t)v45, v47);

  return v45;
}

- (void)invalidateObserver:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v12 = objc_msgSend_handle(v4, v9, v10, v11);
      uint64_t v16 = objc_msgSend_ID(v12, v13, v14, v15);
      int v45 = 138412290;
      v46 = v16;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Invalidating observer for handle %@", (uint8_t *)&v45, 0xCu);
    }
  }
  v17 = objc_msgSend_observers(self, v5, v6, v7);
  v21 = objc_msgSend_handle(v4, v18, v19, v20);
  uint64_t v25 = objc_msgSend_ID(v21, v22, v23, v24);
  v28 = objc_msgSend_objectForKey_(v17, v26, (uint64_t)v25, v27);

  if (v28)
  {
    if (objc_msgSend_containsObject_(v28, v29, (uint64_t)v4, v31))
    {
      objc_msgSend_removeObject_(v28, v29, (uint64_t)v4, v31);
      if (IMOSLoggingEnabled())
      {
        v32 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          v36 = objc_msgSend_handle(v4, v33, v34, v35);
          v40 = objc_msgSend_ID(v36, v37, v38, v39);
          uint64_t v44 = objc_msgSend_count(v28, v41, v42, v43);
          int v45 = 138412546;
          v46 = v40;
          __int16 v47 = 2048;
          uint64_t v48 = v44;
          _os_log_impl(&dword_1A4AF7000, v32, OS_LOG_TYPE_INFO, "Remaining observers for handle %@: %lu", (uint8_t *)&v45, 0x16u);
        }
      }
    }
  }
  objc_msgSend_adjustObservingStatusForHandles(self, v29, v30, v31);
}

- (void)adjustObservingStatusForHandles
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Checking whether to unsubscribe handles", buf, 2u);
    }
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v7 = objc_msgSend_observers(self, v3, v4, v5);
  uint64_t v11 = objc_msgSend_dictionaryRepresentation(v7, v8, v9, v10);

  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v52, (uint64_t)v58, 16);
  if (v16)
  {
    uint64_t v18 = *(void *)v53;
    *(void *)&long long v17 = 138412290;
    long long v51 = v17;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v53 != v18) {
          objc_enumerationMutation(v11);
        }
        uint64_t v20 = *(void *)(*((void *)&v52 + 1) + 8 * v19);
        v21 = objc_msgSend_observers(self, v13, v14, v15, v51);
        uint64_t v24 = objc_msgSend_objectForKey_(v21, v22, v20, v23);

        if (!v24 || !objc_msgSend_count(v24, v25, v26, v27))
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v31 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v51;
              uint64_t v57 = v20;
              _os_log_impl(&dword_1A4AF7000, v31, OS_LOG_TYPE_INFO, "No more observers for handle %@, ending observing status updates", buf, 0xCu);
            }
          }
          v32 = objc_msgSend_handlesForObserver(self, v28, v29, v30);
          uint64_t v35 = objc_msgSend_objectForKey_(v32, v33, v20, v34);

          if (v35)
          {
            objc_msgSend_endObservingStatusUpdatesForHandle_(self, v36, (uint64_t)v35, v37);
            v41 = objc_msgSend_observers(self, v38, v39, v40);
            objc_msgSend_removeObjectForKey_(v41, v42, v20, v43);

            __int16 v47 = objc_msgSend_handlesForObserver(self, v44, v45, v46);
            objc_msgSend_removeObjectForKey_(v47, v48, v20, v49);
          }
          else if (IMOSLoggingEnabled())
          {
            v50 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v51;
              uint64_t v57 = v20;
              _os_log_impl(&dword_1A4AF7000, v50, OS_LOG_TYPE_INFO, "No IMHandle found for handle %@", buf, 0xCu);
            }
          }
        }

        ++v19;
      }
      while (v16 != v19);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v52, (uint64_t)v58, 16);
    }
    while (v16);
  }
}

- (void)beginObservingStatusUpdatesForHandle:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = objc_msgSend_ID(v4, v8, v9, v10);
      int v14 = 138412290;
      uint64_t v15 = v11;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Status manager beginning observing for handle: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  objc_msgSend_beginObservingAvailabilityForHandle_(self, v5, (uint64_t)v4, v6);
  objc_msgSend_beginObservingOffGridStateForHandle_(self, v12, (uint64_t)v4, v13);
}

- (void)beginObservingAvailabilityForHandle:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_isInAppleStoreDemoMode(MEMORY[0x1E4F6E5D0], v5, v6, v7))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Not beginnign observing availability in Apple Store Demo mode.", buf, 2u);
      }
    }
  }
  else
  {
    v12 = objc_msgSend_ID(v4, v8, v9, v10);
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v40 = v12;
        _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "Received request to begin observing availability for: %@", buf, 0xCu);
      }
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1A4C024D4;
    aBlock[3] = &unk_1E5B7E150;
    id v14 = v12;
    id v38 = v14;
    uint64_t v15 = (void (**)(void *, void *))_Block_copy(aBlock);
    uint64_t v19 = objc_msgSend_sharedInstance(IMHandleAvailabilityManager, v16, v17, v18);
    uint64_t v22 = objc_msgSend_statusSubscriptionForHandle_(v19, v20, (uint64_t)v4, v21);

    if (v22)
    {
      v15[2](v15, v22);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          uint64_t v30 = objc_msgSend_ID(v4, v27, v28, v29);
          *(_DWORD *)buf = 138412290;
          uint64_t v40 = v30;
          _os_log_impl(&dword_1A4AF7000, v26, OS_LOG_TYPE_INFO, "Could not find cached subscription for handle: \"%@\". Not observing availability (yet).", buf, 0xCu);
        }
      }
      uint64_t v31 = objc_msgSend_sharedInstance(IMHandleAvailabilityManager, v23, v24, v25);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = sub_1A4C02780;
      v33[3] = &unk_1E5B7E178;
      id v34 = v4;
      uint64_t v35 = self;
      v36 = v15;
      objc_msgSend_fetchUpdatedStatusForHandle_completion_(v31, v32, (uint64_t)v34, (uint64_t)v33);
    }
  }
}

- (void)endObservingAvailabilityForHandle:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_isInAppleStoreDemoMode(MEMORY[0x1E4F6E5D0], v5, v6, v7))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Not ending observing availability in Apple Store Demo mode.", buf, 2u);
      }
    }
  }
  else
  {
    v12 = objc_msgSend_ID(v4, v8, v9, v10);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1A4C02DAC;
    aBlock[3] = &unk_1E5B7E150;
    id v13 = v12;
    id v38 = v13;
    id v14 = (void (**)(void *, void *))_Block_copy(aBlock);
    if (IMOSLoggingEnabled())
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v13;
        _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "Received request to end observing availability for: %@", buf, 0xCu);
      }
    }
    uint64_t v19 = objc_msgSend_sharedInstance(IMHandleAvailabilityManager, v15, v16, v17);
    uint64_t v22 = objc_msgSend_statusSubscriptionForHandle_(v19, v20, (uint64_t)v4, v21);

    if (v22)
    {
      v14[2](v14, v22);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          uint64_t v30 = objc_msgSend_ID(v4, v27, v28, v29);
          *(_DWORD *)buf = 138412290;
          id v40 = v30;
          _os_log_impl(&dword_1A4AF7000, v26, OS_LOG_TYPE_INFO, "Could not find cached subscription for handle: \"%@\". Not observing availability (yet).", buf, 0xCu);
        }
      }
      uint64_t v31 = objc_msgSend_sharedInstance(IMHandleAvailabilityManager, v23, v24, v25);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = sub_1A4C03054;
      v33[3] = &unk_1E5B7E178;
      id v34 = v4;
      uint64_t v35 = self;
      v36 = v14;
      objc_msgSend_fetchUpdatedStatusForHandle_completion_(v31, v32, (uint64_t)v34, (uint64_t)v33);
    }
  }
}

- (void)beginObservingOffGridStateForHandle:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v5, v6, v7);
  int isCarrierPigeonEnabled = objc_msgSend_isCarrierPigeonEnabled(v8, v9, v10, v11);

  if (isCarrierPigeonEnabled)
  {
    uint64_t v16 = objc_msgSend_ID(v4, v13, v14, v15);
    if (IMOSLoggingEnabled())
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v44 = v16;
        _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_INFO, "Received request to begin observing offgrid status for: %@", buf, 0xCu);
      }
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1A4C0362C;
    aBlock[3] = &unk_1E5B7E150;
    id v18 = v16;
    id v42 = v18;
    uint64_t v19 = (void (**)(void *, void *))_Block_copy(aBlock);
    uint64_t v23 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E7B0], v20, v21, v22);
    uint64_t v26 = objc_msgSend_cachedStatusSubscriptionForHandle_(v23, v24, (uint64_t)v4, v25);

    if (v26)
    {
      v19[2](v19, v26);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          id v34 = objc_msgSend_ID(v4, v31, v32, v33);
          *(_DWORD *)buf = 138412290;
          uint64_t v44 = v34;
          _os_log_impl(&dword_1A4AF7000, v30, OS_LOG_TYPE_INFO, "Could not find cached subscription for handle: \"%@\". Not observing offgrid status (yet).", buf, 0xCu);
        }
      }
      uint64_t v35 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E7B0], v27, v28, v29);
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = sub_1A4C038D8;
      v37[3] = &unk_1E5B7E178;
      id v38 = v4;
      uint64_t v39 = self;
      id v40 = v19;
      objc_msgSend_fetchUpdatedStatusForHandle_completion_(v35, v36, (uint64_t)v38, (uint64_t)v37);
    }
  }
}

- (void)endObservingOffGridStateForHandle:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v5, v6, v7);
  int isCarrierPigeonEnabled = objc_msgSend_isCarrierPigeonEnabled(v8, v9, v10, v11);

  if (isCarrierPigeonEnabled)
  {
    uint64_t v16 = objc_msgSend_ID(v4, v13, v14, v15);
    if (IMOSLoggingEnabled())
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v44 = v16;
        _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_INFO, "Received request to end observing offgrid status for: %@", buf, 0xCu);
      }
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1A4C03EB0;
    aBlock[3] = &unk_1E5B7E150;
    id v18 = v16;
    id v42 = v18;
    uint64_t v19 = (void (**)(void *, void *))_Block_copy(aBlock);
    uint64_t v23 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E7B0], v20, v21, v22);
    uint64_t v26 = objc_msgSend_cachedStatusSubscriptionForHandle_(v23, v24, (uint64_t)v4, v25);

    if (v26)
    {
      v19[2](v19, v26);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          id v34 = objc_msgSend_ID(v4, v31, v32, v33);
          *(_DWORD *)buf = 138412290;
          uint64_t v44 = v34;
          _os_log_impl(&dword_1A4AF7000, v30, OS_LOG_TYPE_INFO, "Could not find cached subscription for handle: \"%@\". Not observing offgrid status (yet).", buf, 0xCu);
        }
      }
      uint64_t v35 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E7B0], v27, v28, v29);
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = sub_1A4C04158;
      v37[3] = &unk_1E5B7E178;
      id v38 = v4;
      uint64_t v39 = self;
      id v40 = v19;
      objc_msgSend_fetchUpdatedStatusForHandle_completion_(v35, v36, (uint64_t)v38, (uint64_t)v37);
    }
  }
}

- (void)endObservingStatusUpdatesForHandle:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = objc_msgSend_ID(v4, v8, v9, v10);
      int v14 = 138412290;
      uint64_t v15 = v11;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Status manager ending observing for handle: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  objc_msgSend_endObservingAvailabilityForHandle_(self, v5, (uint64_t)v4, v6);
  objc_msgSend_endObservingOffGridStateForHandle_(self, v12, (uint64_t)v4, v13);
}

- (NSMapTable)observers
{
  return self->_observers;
}

- (NSMapTable)handlesForObserver
{
  return self->_handlesForObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlesForObserver, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end