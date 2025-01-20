@interface IMHandleRegistrar
+ (id)sharedInstance;
- (IMHandleRegistrar)init;
- (id)CNIDToHandlesMap;
- (id)IDToHandlesMap;
- (id)_accountSiblingsForHandle:(id)a3;
- (id)_chatSiblingsForHandle:(id)a3;
- (id)_existingAccountSiblingsForHandle:(id)a3;
- (id)_existingChatSiblingsForHandle:(id)a3;
- (id)allIMHandles;
- (id)businessNameForUID:(id)a3 blockFetch:(BOOL)a4 updateHandler:(id)a5;
- (id)businessNameForUID:(id)a3 updateHandler:(id)a4;
- (id)getIDsForAllIMHandles;
- (id)getIDsForFinalBatch;
- (id)getIDsForInitialBatch;
- (id)getIMHandlesForID:(id)a3;
- (id)handlesForCNIdentifier:(id)a3;
- (id)siblingsForIMHandle:(id)a3;
- (void)_addIMHandleToIDToHandlesMap:(id)a3;
- (void)_addressBookChanged;
- (void)_buildSiblingsForIMHandle:(id)a3;
- (void)_clearSiblingsCacheForIMHandle:(id)a3 rebuildAfter:(BOOL)a4;
- (void)_dumpOutAllIMHandles;
- (void)_dumpOutAllIMHandlesForAccount:(id)a3;
- (void)_emptySiblingCacheForIMHandleGUID:(id)a3;
- (void)_handleAddContactChangeHistoryEvent:(id)a3;
- (void)_handleDeleteContactChangeHistoryEvent:(id)a3;
- (void)_handleDropEverythingChangeHistoryEvent;
- (void)_handleUpdateContactChangeHistoryEvent:(id)a3;
- (void)_postContactChangeHistoryEventClientNotifications;
- (void)_removeIMHandleToIDToHandlesMap:(id)a3;
- (void)addHandleToCNIDMap:(id)a3 CNContact:(id)a4;
- (void)clearCNIDToHandlesMap;
- (void)clearSiblingCacheForIMHandle:(id)a3;
- (void)processContactChangeHistoryEventWithHandleIDs:(id)a3 andCNContact:(id)a4;
- (void)registerIMHandle:(id)a3;
- (void)removeHandleFromCNIDMap:(id)a3 withCNID:(id)a4;
- (void)unregisterIMHandle:(id)a3;
@end

@implementation IMHandleRegistrar

- (id)allIMHandles
{
  v2 = self;
  objc_sync_enter(v2);
  v6 = objc_msgSend_allObjects(v2->_allIMHandles, v3, v4, v5);
  objc_sync_exit(v2);

  return v6;
}

- (IMHandleRegistrar)init
{
  v17.receiver = self;
  v17.super_class = (Class)IMHandleRegistrar;
  v2 = [(IMHandleRegistrar *)&v17 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    siblingsMap = v2->_siblingsMap;
    v2->_siblingsMap = v3;

    uint64_t v8 = objc_msgSend_weakObjectsHashTable(MEMORY[0x1E4F28D30], v5, v6, v7);
    allIMHandles = v2->_allIMHandles;
    v2->_allIMHandles = (NSHashTable *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    CNIDToHandlesMap = v2->_CNIDToHandlesMap;
    v2->_CNIDToHandlesMap = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    IDToHandlesMap = v2->_IDToHandlesMap;
    v2->_IDToHandlesMap = v12;

    v14 = (IMBusinessNameManager *)objc_alloc_init(MEMORY[0x1E4F6E640]);
    businessNameManager = v2->_businessNameManager;
    v2->_businessNameManager = v14;
  }
  return v2;
}

- (id)getIDsForAllIMHandles
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v7 = objc_msgSend_allIMHandles(self, v4, v5, v6, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v9)
  {
    uint64_t v13 = v9;
    uint64_t v14 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v7);
        }
        v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        objc_super v17 = objc_msgSend_ID(v16, v10, v11, v12);
        uint64_t v21 = objc_msgSend_length(v17, v18, v19, v20);

        if (v21)
        {
          v22 = objc_msgSend_ID(v16, v10, v11, v12);
          objc_msgSend_addObject_(v3, v23, (uint64_t)v22, v24);
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v30, (uint64_t)v34, 16);
    }
    while (v13);
  }

  v28 = objc_msgSend_allObjects(v3, v25, v26, v27);

  return v28;
}

+ (id)sharedInstance
{
  if (qword_1EB3F2430 != -1) {
    dispatch_once(&qword_1EB3F2430, &unk_1EF8E5398);
  }
  if (qword_1EB3F24C0 != -1) {
    dispatch_once(&qword_1EB3F24C0, &unk_1EF8E5CF8);
  }
  if (qword_1EB3F2428 != -1) {
    dispatch_once(&qword_1EB3F2428, &unk_1EF8E5D58);
  }
  v2 = (void *)qword_1EB3F2520;

  return v2;
}

- (void)registerIMHandle:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_addObject_(v5->_allIMHandles, v6, (uint64_t)v4, v7);
  siblingsMap = v5->_siblingsMap;
  uint64_t v12 = objc_msgSend_guid(v4, v9, v10, v11);
  v15 = objc_msgSend_objectForKey_(siblingsMap, v13, (uint64_t)v12, v14);

  if (!v15)
  {
    uint64_t v19 = objc_msgSend_guid(v4, v16, v17, v18);
    objc_msgSend__emptySiblingCacheForIMHandleGUID_(v5, v20, (uint64_t)v19, v21);
  }
  objc_msgSend__addIMHandleToIDToHandlesMap_(v5, v16, (uint64_t)v4, v18);
  if (IMOSLoggingEnabled())
  {
    v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_ID(v4, v23, v24, v25);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      int v30 = objc_msgSend_count(v5->_allIMHandles, v27, v28, v29);
      int v31 = 138412546;
      id v32 = v26;
      __int16 v33 = 1024;
      int v34 = v30;
      _os_log_impl(&dword_1A4AF7000, v22, OS_LOG_TYPE_DEBUG, "** Added: %@   (%d now exist)", (uint8_t *)&v31, 0x12u);
    }
  }
  objc_sync_exit(v5);
}

- (void)_emptySiblingCacheForIMHandleGUID:(id)a3
{
  if (a3)
  {
    id v4 = objc_msgSend_objectForKey_(self->_siblingsMap, a2, (uint64_t)a3, v3);
    if (v4)
    {
      uint64_t v9 = v4;
      if (objc_msgSend_count(v4, (const char *)v4, v5, v6)) {
        objc_msgSend_removeAllObjects(v9, (const char *)v9, v7, v8);
      }
    }
    MEMORY[0x1F41817F8]();
  }
}

- (void)_addIMHandleToIDToHandlesMap:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = v4;
  if (v4
    && (objc_msgSend_ID(v4, v5, v6, v7),
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = objc_msgSend_length(v9, v10, v11, v12),
        v9,
        v13))
  {
    IDToHandlesMap = self->_IDToHandlesMap;
    uint64_t v18 = objc_msgSend_ID(v8, v14, v15, v16);
    v22 = objc_msgSend_im_stripCategoryLabel(v18, v19, v20, v21);
    uint64_t v25 = objc_msgSend_objectForKey_(IDToHandlesMap, v23, (uint64_t)v22, v24);

    if (!v25)
    {
      id v28 = objc_alloc(MEMORY[0x1E4F1CA80]);
      uint64_t v25 = objc_msgSend_initWithCapacity_(v28, v29, 1, v30);
      int v31 = self->_IDToHandlesMap;
      uint64_t v35 = objc_msgSend_ID(v8, v32, v33, v34);
      v39 = objc_msgSend_im_stripCategoryLabel(v35, v36, v37, v38);
      objc_msgSend_setObject_forKey_(v31, v40, (uint64_t)v25, (uint64_t)v39);
    }
    if ((objc_msgSend_containsObject_(v25, v26, (uint64_t)v8, v27) & 1) == 0) {
      objc_msgSend_addObject_(v25, v41, (uint64_t)v8, v42);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v43 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      int v44 = 138412290;
      v45 = v8;
      _os_log_impl(&dword_1A4AF7000, v43, OS_LOG_TYPE_INFO, "Not adding %@ to IDToHandlesMap", (uint8_t *)&v44, 0xCu);
    }
  }
}

- (void)addHandleToCNIDMap:(id)a3 CNContact:(id)a4
{
  id v35 = a3;
  id v9 = a4;
  if (v35 && v9)
  {
    uint64_t v10 = objc_msgSend_sharedInstance(IMHandleRegistrar, v6, v7, v8);
    uint64_t v14 = objc_msgSend_identifier(v9, v11, v12, v13);
    uint64_t v17 = objc_msgSend_handlesForCNIdentifier_(v10, v15, (uint64_t)v14, v16);
    uint64_t v21 = objc_msgSend_mutableCopy(v17, v18, v19, v20);

    if (self->_CNIDToHandlesMap)
    {
      if (v21)
      {
LABEL_5:
        objc_msgSend_addObject_(v21, v22, (uint64_t)v35, v23);

        goto LABEL_6;
      }
    }
    else
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      CNIDToHandlesMap = self->_CNIDToHandlesMap;
      self->_CNIDToHandlesMap = Mutable;

      if (v21) {
        goto LABEL_5;
      }
    }
    id v26 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v21 = objc_msgSend_initWithCapacity_(v26, v27, 1, v28);
    uint64_t v29 = self->_CNIDToHandlesMap;
    uint64_t v33 = objc_msgSend_identifier(v9, v30, v31, v32);
    objc_msgSend_setObject_forKey_(v29, v34, (uint64_t)v21, (uint64_t)v33);

    goto LABEL_5;
  }
LABEL_6:
}

- (id)handlesForCNIdentifier:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    uint64_t v10 = objc_msgSend_objectForKey_(self->_CNIDToHandlesMap, v8, (uint64_t)v4, v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_existingChatSiblingsForHandle:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v7 = objc_msgSend_guid(v3, v4, v5, v6);

  if (v7)
  {
    id v55 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    objc_msgSend_addObject_(v55, v8, (uint64_t)v3, v9);
    uint64_t v13 = objc_msgSend_account(v3, v10, v11, v12);
    v54 = objc_msgSend_service(v13, v14, v15, v16);
    uint64_t v20 = objc_msgSend_countryCode(v3, v17, v18, v19);
    uint64_t v24 = objc_msgSend_originalID(v3, v21, v22, v23);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v28 = objc_msgSend_sharedInstance(IMAccountController, v25, v26, v27);
    uint64_t v31 = objc_msgSend_accountsForService_(v28, v29, 0, v30);

    uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v56, (uint64_t)v60, 16);
    if (v33)
    {
      uint64_t v36 = v33;
      uint64_t v37 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v57 != v37) {
            objc_enumerationMutation(v31);
          }
          v39 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          if (v39 != v13)
          {
            if ((objc_msgSend_hasCapability_(*(void **)(*((void *)&v56 + 1) + 8 * i), v34, 1024, v35) & 1) != 0
              || (objc_msgSend_hasCapability_(v39, v34, 8, v35) & 1) != 0
              || (objc_msgSend_service(v39, v34, v40, v35),
                  v41 = objc_claimAutoreleasedReturnValue(),
                  v41,
                  v41 == v54))
            {
              uint64_t v42 = objc_msgSend_ID(v3, v34, v40, v35);
              objc_msgSend_existingIMHandleWithID_alreadyCanonical_(v39, v43, (uint64_t)v42, 1);
              id v44 = (id)objc_claimAutoreleasedReturnValue();

              if (v44) {
                BOOL v46 = v44 == v3;
              }
              else {
                BOOL v46 = 1;
              }
              if (!v46)
              {
                objc_msgSend__setOriginalID_countryCode_updateSiblings_(v44, v45, (uint64_t)v24, (uint64_t)v20, 0);
                objc_msgSend_addObject_(v55, v47, (uint64_t)v44, v48);
              }
            }
          }
        }
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v56, (uint64_t)v60, 16);
      }
      while (v36);
    }

    v52 = objc_msgSend_allObjects(v55, v49, v50, v51);
  }
  else
  {
    v52 = 0;
  }

  return v52;
}

- (void)removeHandleFromCNIDMap:(id)a3 withCNID:(id)a4
{
  id v31 = a3;
  id v9 = a4;
  if (v31 && objc_msgSend_length(v9, v6, v7, v8))
  {
    if (!self->_CNIDToHandlesMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      CNIDToHandlesMap = self->_CNIDToHandlesMap;
      self->_CNIDToHandlesMap = Mutable;
    }
    uint64_t v15 = objc_msgSend_sharedInstance(IMHandleRegistrar, v10, v11, v12);
    uint64_t v18 = objc_msgSend_handlesForCNIdentifier_(v15, v16, (uint64_t)v9, v17);
    uint64_t v22 = objc_msgSend_mutableCopy(v18, v19, v20, v21);

    if (objc_msgSend_count(v22, v23, v24, v25)) {
      objc_msgSend_removeObject_(v22, v26, (uint64_t)v31, v28);
    }
    if (!objc_msgSend_count(v22, v26, v27, v28)) {
      objc_msgSend_removeObjectForKey_(self->_CNIDToHandlesMap, v29, (uint64_t)v9, v30);
    }
  }
}

- (id)getIDsForInitialBatch
{
  return (id)((uint64_t (*)(IMHandleRegistrar *, char *))MEMORY[0x1F4181798])(self, sel_getIDsForAllIMHandles);
}

- (void)_handleDropEverythingChangeHistoryEvent
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "Handling drop everything ContactStore change history event", v25, 2u);
    }
  }
  uint64_t v6 = objc_msgSend_sharedInstance(IMHandleRegistrar, v2, v3, v4);
  objc_msgSend__addressBookChanged(v6, v7, v8, v9);

  uint64_t v13 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v10, v11, v12);
  objc_msgSend_postNotificationName_object_(v13, v14, *MEMORY[0x1E4F6CA58], 0);

  uint64_t v18 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v15, v16, v17);
  objc_msgSend_postNotificationName_object_(v18, v19, @"__kIMHandleRegistrarAddressBookChangedNotification", 0);

  uint64_t v23 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v20, v21, v22);
  objc_msgSend_postNotificationName_object_(v23, v24, *MEMORY[0x1E4F6CA50], 0);
}

- (void)_handleDeleteContactChangeHistoryEvent:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v68 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Received a DeleteContactChangeHistoryEvent", buf, 2u);
    }
  }
  uint64_t v7 = objc_msgSend_userInfo(v68, v3, v4, v5);
  v67 = v7;
  if (v7)
  {
    uint64_t v10 = objc_msgSend_objectForKey_(v7, v8, *MEMORY[0x1E4F6CC98], v9);
    uint64_t v14 = objc_msgSend_sharedInstance(IMHandleRegistrar, v11, v12, v13);
    v66 = objc_msgSend_handlesForCNIdentifier_(v14, v15, (uint64_t)v10, v16);

    if (objc_msgSend_count(v66, v17, v18, v19))
    {
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      obuint64_t j = v66;
      uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v78, (uint64_t)v85, 16);
      if (v72)
      {
        uint64_t v70 = *(void *)v79;
        do
        {
          for (uint64_t i = 0; i != v72; ++i)
          {
            if (*(void *)v79 != v70) {
              objc_enumerationMutation(obj);
            }
            uint64_t v25 = *(void **)(*((void *)&v78 + 1) + 8 * i);
            uint64_t v26 = objc_msgSend_sharedInstance(IMHandleRegistrar, v21, v22, v23, v66, v67);
            objc_msgSend_removeHandleFromCNIDMap_withCNID_(v26, v27, (uint64_t)v25, (uint64_t)v10);

            v73 = objc_msgSend_ID(v25, v28, v29, v30);
            uint64_t v34 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E6D8], v31, v32, v33);
            objc_msgSend_removeContactWithID_(v34, v35, (uint64_t)v73, v36);

            objc_msgSend_updateCNContact_(v25, v37, 0, v38);
            v41 = objc_msgSend_getIMHandlesForID_(self, v39, (uint64_t)v73, v40);
            long long v76 = 0u;
            long long v77 = 0u;
            long long v74 = 0u;
            long long v75 = 0u;
            uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v74, (uint64_t)v84, 16);
            if (v46)
            {
              uint64_t v47 = *(void *)v75;
              do
              {
                for (uint64_t j = 0; j != v46; ++j)
                {
                  if (*(void *)v75 != v47) {
                    objc_enumerationMutation(v41);
                  }
                  v49 = *(void **)(*((void *)&v74 + 1) + 8 * j);
                  if (v49 != v25)
                  {
                    uint64_t v50 = objc_msgSend_sharedInstance(IMHandleRegistrar, v43, v44, v45);
                    objc_msgSend_removeHandleFromCNIDMap_withCNID_(v50, v51, (uint64_t)v49, (uint64_t)v10);

                    objc_msgSend_updateCNContact_(v49, v52, 0, v53);
                  }
                }
                uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v43, (uint64_t)&v74, (uint64_t)v84, 16);
              }
              while (v46);
            }
          }
          uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v78, (uint64_t)v85, 16);
        }
        while (v72);
      }

      long long v57 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v54, v55, v56);
      objc_msgSend_postNotificationName_object_(v57, v58, *MEMORY[0x1E4F6CA58], 0);

      v62 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v59, v60, v61);
      objc_msgSend_postNotificationName_object_(v62, v63, *MEMORY[0x1E4F6CA50], 0);
    }
    else if (IMOSLoggingEnabled())
    {
      v65 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v83 = v10;
        _os_log_impl(&dword_1A4AF7000, v65, OS_LOG_TYPE_INFO, "No handles with CNID %@ found, no action to take.", buf, 0xCu);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v64 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v64, OS_LOG_TYPE_INFO, "No action to take in _handleAddContactChangeHistoryEvent", buf, 2u);
    }
  }
}

- (void)_handleAddContactChangeHistoryEvent:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Received a AddContactChangeHistoryEvent", buf, 2u);
    }
  }
  uint64_t v8 = objc_msgSend_userInfo(v3, v4, v5, v6);
  uint64_t v11 = v8;
  if (v8)
  {
    uint64_t v12 = objc_msgSend_objectForKey_(v8, v9, *MEMORY[0x1E4F6CCB8], v10);
    uint64_t v15 = objc_msgSend_objectForKey_(v11, v13, *MEMORY[0x1E4F6CCA0], v14);
    uint64_t v19 = objc_msgSend_sharedInstance(IMHandleRegistrar, v16, v17, v18);
    objc_msgSend_processContactChangeHistoryEventWithHandleIDs_andCNContact_(v19, v20, (uint64_t)v12, (uint64_t)v15);
  }
  else
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_8;
    }
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "No action to take in _handleAddContactChangeHistoryEvent", v21, 2u);
    }
  }

LABEL_8:
}

- (void)_handleUpdateContactChangeHistoryEvent:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Received a UpdateContactChangeHistoryEvent", buf, 2u);
    }
  }
  uint64_t v8 = objc_msgSend_userInfo(v3, v4, v5, v6);
  uint64_t v11 = v8;
  if (v8)
  {
    uint64_t v12 = objc_msgSend_objectForKey_(v8, v9, *MEMORY[0x1E4F6CCB8], v10);
    uint64_t v15 = objc_msgSend_objectForKey_(v11, v13, *MEMORY[0x1E4F6CCA0], v14);
    uint64_t v19 = objc_msgSend_sharedInstance(IMHandleRegistrar, v16, v17, v18);
    objc_msgSend_processContactChangeHistoryEventWithHandleIDs_andCNContact_(v19, v20, (uint64_t)v12, (uint64_t)v15);
  }
  else
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_8;
    }
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "No action to take in _handleAddContactChangeHistoryEvent", v21, 2u);
    }
  }

LABEL_8:
}

- (void)processContactChangeHistoryEventWithHandleIDs:(id)a3 andCNContact:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v10 = objc_msgSend_count(v5, v7, v8, v9);
  uint64_t v61 = v6;
  long long v59 = v5;
  if (v6 && v10)
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v11 = v5;
    uint64_t v13 = 0;
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v66, (uint64_t)v73, 16);
    if (v14)
    {
      uint64_t v15 = *(void *)v67;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v67 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = IMCleanupPhoneNumber();
          uint64_t v21 = objc_msgSend_sharedInstance(IMHandleRegistrar, v18, v19, v20);
          uint64_t v24 = objc_msgSend_getIMHandlesForID_(v21, v22, (uint64_t)v17, v23);

          if (objc_msgSend_count(v24, v25, v26, v27))
          {
            if (!v13)
            {
              id v30 = objc_alloc(MEMORY[0x1E4F1CA48]);
              uint64_t v13 = objc_msgSend_initWithCapacity_(v30, v31, 1, v32);
            }
            objc_msgSend_addObjectsFromArray_(v13, v28, (uint64_t)v24, v29);
          }

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v33, (uint64_t)&v66, (uint64_t)v73, 16);
      }
      while (v14);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v34 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v34, OS_LOG_TYPE_INFO, "Cannot process Contact change history event!. No handles or invalid CNContact recevied.", buf, 2u);
      }
    }
    uint64_t v13 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v35 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v72 = v13;
      _os_log_impl(&dword_1A4AF7000, v35, OS_LOG_TYPE_INFO, "Updating handles with IDs %@ with a new Contact", buf, 0xCu);
    }
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v36 = v13;
  uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v62, (uint64_t)v70, 16);
  if (v41)
  {
    uint64_t v42 = *(void *)v63;
    uint64_t v43 = MEMORY[0x1E4F1CBF0];
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v63 != v42) {
          objc_enumerationMutation(v36);
        }
        uint64_t v45 = *(void **)(*((void *)&v62 + 1) + 8 * v44);
        uint64_t v46 = objc_msgSend_sharedInstance(IMHandleRegistrar, v38, v39, v40);
        v49 = objc_msgSend_cnContactWithKeys_(v45, v47, v43, v48);
        uint64_t v53 = objc_msgSend_identifier(v49, v50, v51, v52);
        objc_msgSend_removeHandleFromCNIDMap_withCNID_(v46, v54, (uint64_t)v45, (uint64_t)v53);

        objc_msgSend_updateCNContact_(v45, v55, (uint64_t)v61, v56);
        ++v44;
      }
      while (v41 != v44);
      uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v38, (uint64_t)&v62, (uint64_t)v70, 16);
    }
    while (v41);
  }

  objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E4FBA8A8], v57, (uint64_t)self, (uint64_t)sel__postContactChangeHistoryEventClientNotifications, 0);
  objc_msgSend_performSelector_withObject_afterDelay_(self, v58, (uint64_t)sel__postContactChangeHistoryEventClientNotifications, 0, 0.0);
}

- (void)_postContactChangeHistoryEventClientNotifications
{
  uint64_t v4 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  objc_msgSend_postNotificationName_object_(v4, v5, *MEMORY[0x1E4F6CA58], 0);

  objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v6, v7, v8);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_(v10, v9, *MEMORY[0x1E4F6CA50], 0);
}

- (void)_addressBookChanged
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  objc_msgSend_startTimingForKey_(v3, v4, @"_addressBookChanged", v5);
  uint64_t v9 = objc_msgSend_allIMHandles(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_copy(v9, v10, v11, v12);

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v14 = v13;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v36, (uint64_t)v40, 16);
  if (v16)
  {
    uint64_t v20 = v16;
    uint64_t v21 = *(void *)v37;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v37 != v21) {
          objc_enumerationMutation(v14);
        }
        uint64_t v23 = *(void **)(*((void *)&v36 + 1) + 8 * v22);
        uint64_t v24 = objc_msgSend_sharedInstance(IMHandleRegistrar, v17, v18, v19, (void)v36);
        objc_msgSend_clearSiblingCacheForIMHandle_(v24, v25, (uint64_t)v23, v26);

        objc_msgSend_updateCNContact_(v23, v27, 0, v28);
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v36, (uint64_t)v40, 16);
    }
    while (v20);
  }

  uint64_t v32 = objc_msgSend_sharedInstance(IMHandleRegistrar, v29, v30, v31);
  objc_msgSend_clearCNIDToHandlesMap(v32, v33, v34, v35);
}

- (void)_buildSiblingsForIMHandle:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = v4;
  if (v4)
  {
    uint64_t v9 = objc_msgSend_guid(v4, v5, v6, v7);
    objc_msgSend__emptySiblingCacheForIMHandleGUID_(self, v10, (uint64_t)v9, v11);

    uint64_t v15 = objc_msgSend_guid(v8, v12, v13, v14);
    objc_msgSend_objectForKey_(self->_siblingsMap, v16, (uint64_t)v15, v17);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      objc_msgSend_setObject_forKey_(self->_siblingsMap, v21, (uint64_t)v20, (uint64_t)v15);
    }
    objc_msgSend_addObject_(v20, v18, (uint64_t)v8, v19);
    uint64_t v24 = objc_msgSend_cnContactWithKeys_(v8, v22, MEMORY[0x1E4F1CBF0], v23);
    uint64_t v28 = objc_msgSend_identifier(v24, v25, v26, v27);

    uint64_t v32 = objc_msgSend_sharedInstance(IMHandleRegistrar, v29, v30, v31);
    uint64_t v35 = objc_msgSend_handlesForCNIdentifier_(v32, v33, (uint64_t)v28, v34);
    long long v39 = objc_msgSend_allObjects(v35, v36, v37, v38);

    if (objc_msgSend_count(v39, v40, v41, v42))
    {
      long long v59 = v15;
      objc_msgSend_addObjectsFromArray_(v20, v43, (uint64_t)v39, v44);
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v45 = v39;
      uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v60, (uint64_t)v64, 16);
      if (v47)
      {
        uint64_t v51 = v47;
        uint64_t v52 = *(void *)v61;
        do
        {
          uint64_t v53 = 0;
          do
          {
            if (*(void *)v61 != v52) {
              objc_enumerationMutation(v45);
            }
            if (*(void **)(*((void *)&v60 + 1) + 8 * v53) != v8)
            {
              v54 = objc_msgSend_guid(v8, v48, v49, v50);
              if (objc_msgSend_length(v54, v55, v56, v57)) {
                objc_msgSend_setObject_forKey_(self->_siblingsMap, v58, (uint64_t)v20, (uint64_t)v54);
              }
            }
            ++v53;
          }
          while (v51 != v53);
          uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v48, (uint64_t)&v60, (uint64_t)v64, 16);
        }
        while (v51);
      }

      uint64_t v15 = v59;
    }
  }
}

- (void)_clearSiblingsCacheForIMHandle:(id)a3 rebuildAfter:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v10 = objc_msgSend_guid(v6, v7, v8, v9);
  if (objc_msgSend_length(v10, v11, v12, v13))
  {
    uint64_t v16 = objc_msgSend_objectForKey_(self->_siblingsMap, v14, (uint64_t)v10, v15);
    id v20 = objc_msgSend_copy(v16, v17, v18, v19);

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v21 = v20;
    uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v39, (uint64_t)v43, 16);
    if (v23)
    {
      uint64_t v27 = v23;
      uint64_t v28 = *(void *)v40;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v40 != v28) {
            objc_enumerationMutation(v21);
          }
          id v30 = *(id *)(*((void *)&v39 + 1) + 8 * v29);
          if (v30 != v6)
          {
            uint64_t v31 = objc_msgSend_guid(v30, v24, v25, v26, (void)v39);
            objc_msgSend__emptySiblingCacheForIMHandleGUID_(self, v32, (uint64_t)v31, v33);
          }
          ++v29;
        }
        while (v27 != v29);
        uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v39, (uint64_t)v43, 16);
      }
      while (v27);
    }

    objc_msgSend__emptySiblingCacheForIMHandleGUID_(self, v34, (uint64_t)v10, v35);
    if (v4)
    {
      objc_msgSend__buildSiblingsForIMHandle_(self, v36, (uint64_t)v6, v37);
      objc_msgSend__clearSiblingsCacheForIMHandle_rebuildAfter_(self, v38, (uint64_t)v6, 0);
    }
  }
}

- (void)clearCNIDToHandlesMap
{
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Clearing the CNIDToHandlesMap", v7, 2u);
    }
  }
  objc_msgSend_removeAllObjects(self->_CNIDToHandlesMap, v3, v4, v5);
}

- (id)CNIDToHandlesMap
{
  uint64_t v4 = objc_msgSend_copy(self->_CNIDToHandlesMap, a2, v2, v3);

  return v4;
}

- (void)unregisterIMHandle:(id)a3
{
  id v19 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_guid(v19, v5, v6, v7);
  if (objc_msgSend_length(v8, v9, v10, v11))
  {
    objc_msgSend_removeObject_(v4->_allIMHandles, v12, (uint64_t)v19, v13);
    objc_msgSend__clearSiblingsCacheForIMHandle_rebuildAfter_(v4, v14, (uint64_t)v19, 0);
    objc_msgSend_removeObjectForKey_(v4->_siblingsMap, v15, (uint64_t)v8, v16);
    objc_msgSend__removeIMHandleToIDToHandlesMap_(v4, v17, (uint64_t)v19, v18);
  }

  objc_sync_exit(v4);
}

- (void)clearSiblingCacheForIMHandle:(id)a3
{
}

- (id)siblingsForIMHandle:(id)a3
{
  id v4 = a3;
  siblingsMap = self->_siblingsMap;
  uint64_t v9 = objc_msgSend_guid(v4, v6, v7, v8);
  uint64_t v12 = objc_msgSend_objectForKey_(siblingsMap, v10, (uint64_t)v9, v11);

  if (!objc_msgSend_count(v12, v13, v14, v15))
  {
    objc_msgSend__buildSiblingsForIMHandle_(self, v16, (uint64_t)v4, v18);
    id v19 = self->_siblingsMap;
    uint64_t v23 = objc_msgSend_guid(v4, v20, v21, v22);
    uint64_t v26 = objc_msgSend_objectForKey_(v19, v24, (uint64_t)v23, v25);

    uint64_t v12 = (void *)v26;
  }
  uint64_t v27 = objc_msgSend_copy(v12, v16, v17, v18);

  return v27;
}

- (void)_removeIMHandleToIDToHandlesMap:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = v4;
  if (v4
    && (objc_msgSend_ID(v4, v5, v6, v7),
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = objc_msgSend_length(v9, v10, v11, v12),
        v9,
        v13))
  {
    IDToHandlesMap = self->_IDToHandlesMap;
    uint64_t v18 = objc_msgSend_ID(v8, v14, v15, v16);
    uint64_t v22 = objc_msgSend_im_stripCategoryLabel(v18, v19, v20, v21);
    uint64_t v25 = objc_msgSend_objectForKey_(IDToHandlesMap, v23, (uint64_t)v22, v24);

    if (objc_msgSend_containsObject_(v25, v26, (uint64_t)v8, v27)) {
      objc_msgSend_removeObject_(v25, v28, (uint64_t)v8, v30);
    }
    if (!objc_msgSend_count(v25, v28, v29, v30))
    {
      uint64_t v34 = self->_IDToHandlesMap;
      uint64_t v35 = objc_msgSend_ID(v8, v31, v32, v33);
      long long v39 = objc_msgSend_im_stripCategoryLabel(v35, v36, v37, v38);
      objc_msgSend_removeObjectForKey_(v34, v40, (uint64_t)v39, v41);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    long long v42 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      int v43 = 138412290;
      uint64_t v44 = v8;
      _os_log_impl(&dword_1A4AF7000, v42, OS_LOG_TYPE_INFO, "Not removing %@ from IDToHandlesMap", (uint8_t *)&v43, 0xCu);
    }
  }
}

- (id)IDToHandlesMap
{
  id v4 = objc_msgSend_copy(self->_IDToHandlesMap, a2, v2, v3);

  return v4;
}

- (id)getIMHandlesForID:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    uint64_t v10 = objc_msgSend_objectForKey_(self->_IDToHandlesMap, v8, (uint64_t)v4, v9);
    uint64_t v14 = objc_msgSend_allObjects(v10, v11, v12, v13);
    uint64_t v18 = objc_msgSend_copy(v14, v15, v16, v17);

    uint64_t v22 = objc_msgSend_dialingForCurrentLocale(MEMORY[0x1E4F6E6D8], v19, v20, v21);
    if (objc_msgSend_count(v18, v23, v24, v25)
      || (objc_msgSend_hasPrefix_(v4, v26, (uint64_t)v22, v28) & 1) != 0
      || !MEMORY[0x1A62639B0](v4))
    {
      uint64_t v29 = (uint64_t)v4;
      uint64_t v48 = objc_msgSend_copy(v18, v26, v27, v28);
    }
    else
    {
      uint64_t v29 = IMStripFormattingFromAddress();

      uint64_t v32 = objc_msgSend_stringWithFormat_(NSString, v30, @"%@%@", v31, v22, v29);
      if (IMOSLoggingEnabled())
      {
        uint64_t v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v52 = v32;
          _os_log_impl(&dword_1A4AF7000, v35, OS_LOG_TYPE_INFO, "Re-attempting to lookup cache with ID & ITU: %@", buf, 0xCu);
        }
      }
      long long v36 = objc_msgSend_objectForKey_(self->_IDToHandlesMap, v33, (uint64_t)v32, v34);
      long long v40 = objc_msgSend_allObjects(v36, v37, v38, v39);
      uint64_t v44 = objc_msgSend_copy(v40, v41, v42, v43);

      uint64_t v18 = v44;
      uint64_t v48 = objc_msgSend_copy(v44, v45, v46, v47);
    }
    uint64_t v49 = (void *)v48;

    id v4 = (id)v29;
  }
  else
  {
    uint64_t v49 = 0;
  }

  return v49;
}

- (id)getIDsForFinalBatch
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v7 = objc_msgSend_allIMHandles(self, v4, v5, v6, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v38, (uint64_t)v42, 16);
  if (v9)
  {
    uint64_t v13 = v9;
    uint64_t v14 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v7);
        }
        uint64_t v16 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E6D8], v10, v11, v12);
        uint64_t v21 = objc_msgSend_ID(v16, v18, v19, v20);
        char isContactWithIDAlreadyFetched = objc_msgSend_isContactWithIDAlreadyFetched_(v17, v22, (uint64_t)v21, v23);

        if ((isContactWithIDAlreadyFetched & 1) == 0)
        {
          uint64_t v25 = objc_msgSend_ID(v16, v10, v11, v12);
          uint64_t v29 = objc_msgSend_length(v25, v26, v27, v28);

          if (v29)
          {
            uint64_t v30 = objc_msgSend_ID(v16, v10, v11, v12);
            objc_msgSend_addObject_(v3, v31, (uint64_t)v30, v32);
          }
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v38, (uint64_t)v42, 16);
    }
    while (v13);
  }

  long long v36 = objc_msgSend_allObjects(v3, v33, v34, v35);

  return v36;
}

- (void)_dumpOutAllIMHandles
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      allIMHandles = self->_allIMHandles;
      int v5 = 138412290;
      uint64_t v6 = allIMHandles;
      _os_log_impl(&dword_1A4AF7000, v3, OS_LOG_TYPE_INFO, "All handles: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_dumpOutAllIMHandlesForAccount:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!_IMWillLog()) {
    goto LABEL_26;
  }
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v4;
      _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "All handles for account: %@", buf, 0xCu);
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = self->_allIMHandles;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v22, (uint64_t)v26, 16);
  if (!v11)
  {

LABEL_22:
    if (IMOSLoggingEnabled())
    {
      uint64_t v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v20, OS_LOG_TYPE_INFO, "    Hurray, no handles!", buf, 2u);
      }
    }
    goto LABEL_26;
  }
  char v13 = 0;
  uint64_t v14 = *(void *)v23;
  *(void *)&long long v12 = 138412290;
  long long v21 = v12;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v23 != v14) {
        objc_enumerationMutation(v6);
      }
      uint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      objc_msgSend_account(v16, v8, v9, v10, v21, (void)v22);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v18 = v17 == v4;

      if (v18)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v19 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v21;
            id v28 = v16;
            _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "     %@", buf, 0xCu);
          }
        }
        char v13 = 1;
      }
    }
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v22, (uint64_t)v26, 16);
  }
  while (v11);

  if ((v13 & 1) == 0) {
    goto LABEL_22;
  }
LABEL_26:
}

- (id)_accountSiblingsForHandle:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v7 = objc_msgSend_guid(v3, v4, v5, v6);
  if (v7)
  {
    uint64_t v55 = v7;
    id v56 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    objc_msgSend_addObject_(v56, v8, (uint64_t)v3, v9);
    char v13 = objc_msgSend_countryCode(v3, v10, v11, v12);
    id v17 = objc_msgSend_originalID(v3, v14, v15, v16);
    long long v21 = objc_msgSend_account(v3, v18, v19, v20);
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v25 = objc_msgSend_sharedInstance(IMAccountController, v22, v23, v24);
    uint64_t v29 = objc_msgSend_service(v21, v26, v27, v28);
    uint64_t v32 = objc_msgSend_accountsForService_(v25, v30, (uint64_t)v29, v31);

    uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v57, (uint64_t)v61, 16);
    if (v34)
    {
      uint64_t v38 = v34;
      uint64_t v39 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v58 != v39) {
            objc_enumerationMutation(v32);
          }
          long long v41 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          if (v41 != v21)
          {
            id v42 = v3;
            uint64_t v43 = objc_msgSend_ID(v3, v35, v36, v37);
            uint64_t v45 = objc_msgSend__imHandleWithID_alreadyCanonical_originalID_countryCode_(v41, v44, (uint64_t)v43, 1, v17, v13);

            if (v45 && (objc_msgSend_containsObject_(v56, v46, (uint64_t)v45, v47) & 1) == 0) {
              objc_msgSend_addObject_(v56, v48, (uint64_t)v45, v49);
            }

            id v3 = v42;
          }
        }
        uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v57, (uint64_t)v61, 16);
      }
      while (v38);
    }

    uint64_t v53 = objc_msgSend_allObjects(v56, v50, v51, v52);

    uint64_t v7 = v55;
  }
  else
  {
    uint64_t v53 = 0;
  }

  return v53;
}

- (id)_existingAccountSiblingsForHandle:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v7 = objc_msgSend_guid(v3, v4, v5, v6);
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    objc_msgSend_addObject_(v8, v9, (uint64_t)v3, v10);
    uint64_t v14 = objc_msgSend_account(v3, v11, v12, v13);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    BOOL v18 = objc_msgSend_sharedInstance(IMAccountController, v15, v16, v17, 0);
    long long v22 = objc_msgSend_service(v14, v19, v20, v21);
    long long v25 = objc_msgSend_accountsForService_(v18, v23, (uint64_t)v22, v24);

    uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v45, (uint64_t)v49, 16);
    if (v27)
    {
      uint64_t v31 = v27;
      uint64_t v32 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v46 != v32) {
            objc_enumerationMutation(v25);
          }
          uint64_t v34 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          if (v34 != v14)
          {
            uint64_t v35 = objc_msgSend_ID(v3, v28, v29, v30);
            uint64_t v37 = objc_msgSend_existingIMHandleWithID_alreadyCanonical_(v34, v36, (uint64_t)v35, 1);

            if (v37) {
              objc_msgSend_addObject_(v8, v38, (uint64_t)v37, v39);
            }
          }
        }
        uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v45, (uint64_t)v49, 16);
      }
      while (v31);
    }

    uint64_t v43 = objc_msgSend_allObjects(v8, v40, v41, v42);
  }
  else
  {
    uint64_t v43 = 0;
  }

  return v43;
}

- (id)_chatSiblingsForHandle:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v66 = objc_msgSend_guid(v3, v4, v5, v6);
  if (objc_msgSend_length(v66, v7, v8, v9))
  {
    id v71 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    objc_msgSend_addObject_(v71, v10, (uint64_t)v3, v11);
    uint64_t v15 = objc_msgSend_account(v3, v12, v13, v14);
    if (IMOSLoggingEnabled())
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v83 = v3;
        _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_DEBUG, "Handle %@", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v83 = v15;
        _os_log_impl(&dword_1A4AF7000, v20, OS_LOG_TYPE_DEBUG, "Handle account %@", buf, 0xCu);
      }
    }
    uint64_t v21 = objc_msgSend_countryCode(v3, v17, v18, v19);
    long long v25 = objc_msgSend_originalID(v3, v22, v23, v24);
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    uint64_t v29 = objc_msgSend_service(v3, v26, v27, v28);
    objc_msgSend_siblingServices(v29, v30, v31, v32);
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v76, (uint64_t)v81, 16);
    if (v69)
    {
      uint64_t v68 = *(void *)v77;
      do
      {
        uint64_t v37 = 0;
        do
        {
          if (*(void *)v77 != v68)
          {
            uint64_t v38 = v37;
            objc_enumerationMutation(obj);
            uint64_t v37 = v38;
          }
          uint64_t v70 = v37;
          uint64_t v39 = *(void *)(*((void *)&v76 + 1) + 8 * v37);
          long long v72 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          long long v40 = objc_msgSend_sharedInstance(IMAccountController, v34, v35, v36);
          uint64_t v43 = objc_msgSend_accountsForService_(v40, v41, v39, v42);

          uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v72, (uint64_t)v80, 16);
          if (v48)
          {
            uint64_t v49 = *(void *)v73;
            do
            {
              for (uint64_t i = 0; i != v48; ++i)
              {
                if (*(void *)v73 != v49) {
                  objc_enumerationMutation(v43);
                }
                uint64_t v51 = *(void **)(*((void *)&v72 + 1) + 8 * i);
                if (v51 != v15)
                {
                  uint64_t v52 = objc_msgSend_ID(v3, v45, v46, v47);
                  objc_msgSend__imHandleWithID_alreadyCanonical_originalID_countryCode_(v51, v53, (uint64_t)v52, 1, v25, v21);
                  id v54 = (id)objc_claimAutoreleasedReturnValue();

                  if (v54) {
                    BOOL v56 = v54 == v3;
                  }
                  else {
                    BOOL v56 = 1;
                  }
                  if (!v56)
                  {
                    objc_msgSend__setOriginalID_countryCode_updateSiblings_(v54, v55, (uint64_t)v25, (uint64_t)v21, 0);
                    objc_msgSend_addObject_(v71, v57, (uint64_t)v54, v58);
                  }
                }
              }
              uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v45, (uint64_t)&v72, (uint64_t)v80, 16);
            }
            while (v48);
          }

          uint64_t v37 = v70 + 1;
        }
        while (v70 + 1 != v69);
        uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v76, (uint64_t)v81, 16);
      }
      while (v69);
    }

    if (IMOSLoggingEnabled())
    {
      uint64_t v62 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v83 = v71;
        _os_log_impl(&dword_1A4AF7000, v62, OS_LOG_TYPE_DEBUG, "Account sibling: %@", buf, 0xCu);
      }
    }
    long long v63 = objc_msgSend_allObjects(v71, v59, v60, v61);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      long long v64 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v64, OS_LOG_TYPE_DEBUG, "No GUID, bailing...", buf, 2u);
      }
    }
    long long v63 = 0;
  }

  return v63;
}

- (id)businessNameForUID:(id)a3 updateHandler:(id)a4
{
  return (id)objc_msgSend_businessNameForUID_blockFetch_updateHandler_(self, a2, (uint64_t)a3, 0, a4);
}

- (id)businessNameForUID:(id)a3 blockFetch:(BOOL)a4 updateHandler:(id)a5
{
  return (id)objc_msgSend_businessNameForUID_blockFetch_updateHandler_(self->_businessNameManager, a2, (uint64_t)a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessNameManager, 0);
  objc_storeStrong((id *)&self->_CNIDToHandlesMap, 0);
  objc_storeStrong((id *)&self->_IDToHandlesMap, 0);
  objc_storeStrong((id *)&self->_allIMHandles, 0);

  objc_storeStrong((id *)&self->_siblingsMap, 0);
}

@end