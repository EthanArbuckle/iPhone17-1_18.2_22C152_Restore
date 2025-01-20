@interface IMPhotoLibraryPersistenceManager
+ (id)_assetFetchQueue;
+ (id)_photoLibraryInternalQueue;
+ (id)photosSyndicationIdentifiersForMessage:(id)a3 transcriptChatItem:(id)a4;
+ (id)sharedInstance;
- (BOOL)_invalidateCacheDueToChanges:(id)a3;
- (BOOL)_isListenerRegistered:(id)a3;
- (BOOL)libraryAlreadyOpened;
- (CPLRUDictionary)syndicationIdentifierFetchResultCache;
- (CPLRUDictionary)syndicationIdentifierSaveStateCache;
- (IMPhotoLibraryPersistenceManager)init;
- (NSHashTable)listeners;
- (NSMutableDictionary)syndicationIdentifierToAssetUUIDCache;
- (NSMutableSet)syndicationIdentifiersWithActiveFetch;
- (id)_cachedSaveStateForIdentifier:(id)a3;
- (unint64_t)cachedCountOfSyndicationIdentifiersSavedToSystemPhotoLibrary:(id)a3 shouldFetchAndNotifyAsNeeded:(BOOL)a4 didStartFetch:(BOOL *)a5;
- (void)_notifyListeners;
- (void)_openPhotoLibraryIfNecessary;
- (void)cacheCompletedSaveForSyndicationIdentifiers:(id)a3;
- (void)fetchInfoForSyndicationIdentifiersSavedToSystemPhotoLibrary:(id)a3 completion:(id)a4;
- (void)photoLibraryDidChange:(id)a3;
- (void)registerPhotoLibraryPersistenceManagerListener:(id)a3;
- (void)setLibraryAlreadyOpened:(BOOL)a3;
- (void)setListeners:(id)a3;
- (void)setSyndicationIdentifierFetchResultCache:(id)a3;
- (void)setSyndicationIdentifierSaveStateCache:(id)a3;
- (void)setSyndicationIdentifierToAssetUUIDCache:(id)a3;
- (void)setSyndicationIdentifiersWithActiveFetch:(id)a3;
- (void)unregisterPhotoLibraryPersistenceManagerListener:(id)a3;
@end

@implementation IMPhotoLibraryPersistenceManager

+ (id)sharedInstance
{
  if (qword_1EB3F2450 != -1) {
    dispatch_once(&qword_1EB3F2450, &unk_1EF8E53B8);
  }
  v2 = (void *)qword_1EB3F2478;

  return v2;
}

- (IMPhotoLibraryPersistenceManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)IMPhotoLibraryPersistenceManager;
  v2 = [(IMPhotoLibraryPersistenceManager *)&v18 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F4BE58]);
    uint64_t v6 = objc_msgSend_initWithMaximumCapacity_(v3, v4, 512, v5);
    syndicationIdentifierSaveStateCache = v2->_syndicationIdentifierSaveStateCache;
    v2->_syndicationIdentifierSaveStateCache = (CPLRUDictionary *)v6;

    id v8 = objc_alloc(MEMORY[0x1E4F4BE58]);
    uint64_t v11 = objc_msgSend_initWithMaximumCapacity_(v8, v9, 512, v10);
    syndicationIdentifierFetchResultCache = v2->_syndicationIdentifierFetchResultCache;
    v2->_syndicationIdentifierFetchResultCache = (CPLRUDictionary *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    syndicationIdentifierToAssetUUIDCache = v2->_syndicationIdentifierToAssetUUIDCache;
    v2->_syndicationIdentifierToAssetUUIDCache = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    syndicationIdentifiersWithActiveFetch = v2->_syndicationIdentifiersWithActiveFetch;
    v2->_syndicationIdentifiersWithActiveFetch = v15;

    v2->_libraryAlreadyOpened = 0;
  }
  return v2;
}

+ (id)_assetFetchQueue
{
  if (qword_1E965DDE0 != -1) {
    dispatch_once(&qword_1E965DDE0, &unk_1EF8E3D30);
  }
  v2 = (void *)qword_1E965DE08;

  return v2;
}

+ (id)_photoLibraryInternalQueue
{
  if (qword_1E965DDA8 != -1) {
    dispatch_once(&qword_1E965DDA8, &unk_1EF8E3D50);
  }
  v2 = (void *)qword_1E965DDB0;

  return v2;
}

+ (id)photosSyndicationIdentifiersForMessage:(id)a3 transcriptChatItem:(id)a4
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v9 = a4;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_fileTransferGUIDs(v5, v6, v7, v8);
    uint64_t v14 = objc_msgSend_count(v10, v11, v12, v13);

    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        objc_super v18 = objc_msgSend_message(v9, v15, v16, v17);
        uint64_t v22 = objc_msgSend_fileTransferGUIDs(v18, v19, v20, v21);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v23 = 0;
          goto LABEL_8;
        }
        uint64_t v36 = objc_msgSend_transferGUID(v9, v33, v34, v35);
        objc_super v18 = (void *)v36;
        if (!v36)
        {
          v23 = (void *)MEMORY[0x1E4F1CBF0];
          goto LABEL_7;
        }
        v44[0] = v36;
        uint64_t v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v37, (uint64_t)v44, 1);
      }
      v23 = (void *)v22;
LABEL_7:

LABEL_8:
      v24 = objc_opt_new();
      uint64_t v38 = MEMORY[0x1E4F143A8];
      uint64_t v39 = 3221225472;
      v40 = sub_1A4BBA9FC;
      v41 = &unk_1E5B7C5C8;
      id v42 = v5;
      id v43 = v24;
      id v25 = v24;
      objc_msgSend_enumerateObjectsUsingBlock_(v23, v26, (uint64_t)&v38, v27);
      v31 = objc_msgSend_copy(v25, v28, v29, v30, v38, v39, v40, v41);

      goto LABEL_10;
    }
  }
  v31 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_10:

  return v31;
}

- (BOOL)_invalidateCacheDueToChanges:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v58 = a3;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v4, OS_LOG_TYPE_INFO, "Invalidating cache", buf, 2u);
    }
  }
  v59 = self;
  objc_sync_enter(v59);
  if (objc_msgSend_IMDeviceIsChinaRegion(MEMORY[0x1E4F6E730], v5, v6, v7)
    && (objc_msgSend_deletedObjectIDs(v58, v8, v9, v10),
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        BOOL v15 = objc_msgSend_count(v11, v12, v13, v14) == 0,
        v11,
        v15))
  {
    if (IMOSLoggingEnabled())
    {
      v55 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v55, OS_LOG_TYPE_INFO, "Not flushing save state cache as there were no deletions", buf, 2u);
      }
    }
    char v18 = 0;
  }
  else
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v16 = objc_msgSend_allKeys(v59->_syndicationIdentifierFetchResultCache, v8, v9, v10);
    char v18 = 0;
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v60, (uint64_t)v66, 16);
    if (v21)
    {
      uint64_t v22 = *(void *)v61;
      id obj = v16;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v61 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void *)(*((void *)&v60 + 1) + 8 * i);
          id v25 = objc_msgSend_objectForKey_(v59->_syndicationIdentifierFetchResultCache, v19, v24, v20);
          v28 = objc_msgSend_changeDetailsForFetchResult_(v58, v26, (uint64_t)v25, v27);
          v32 = v28;
          if (v28)
          {
            uint64_t v36 = objc_msgSend_fetchResultAfterChanges(v28, v29, v30, v31);
            if (v36)
            {
              v37 = objc_msgSend_fetchResultAfterChanges(v32, v33, v34, v35);
              uint64_t v41 = objc_msgSend_count(v37, v38, v39, v40);

              v45 = objc_msgSend_fetchResultBeforeChanges(v32, v42, v43, v44);
              uint64_t v49 = objc_msgSend_count(v45, v46, v47, v48);

              objc_msgSend_setObject_forKey_(v59->_syndicationIdentifierFetchResultCache, v50, (uint64_t)v36, v24);
              char v18 = (v41 != 0) ^ (v49 != 0);
            }
            else
            {
              objc_msgSend_removeObjectForKey_(v59->_syndicationIdentifierFetchResultCache, v33, v24, v35);
              char v18 = 1;
            }
          }
        }
        uint64_t v16 = obj;
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v60, (uint64_t)v66, 16);
      }
      while (v21);
    }

    objc_msgSend_removeAllObjects(v59->_syndicationIdentifierToAssetUUIDCache, v51, v52, v53);
    if (IMOSLoggingEnabled())
    {
      v54 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v65 = v18 & 1;
        _os_log_impl(&dword_1A4AF7000, v54, OS_LOG_TYPE_INFO, "Photo library changed, will invalidate %d", buf, 8u);
      }
    }
  }
  objc_sync_exit(v59);

  return v18 & 1;
}

- (id)_cachedSaveStateForIdentifier:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F6E730];
  id v5 = a3;
  if (objc_msgSend_IMDeviceIsChinaRegion(v4, v6, v7, v8))
  {
    uint64_t v11 = objc_msgSend_objectForKey_(self->_syndicationIdentifierSaveStateCache, v9, (uint64_t)v5, v10);
  }
  else
  {
    uint64_t v12 = objc_msgSend_objectForKey_(self->_syndicationIdentifierFetchResultCache, v9, (uint64_t)v5, v10);

    if (v12)
    {
      uint64_t v16 = NSNumber;
      BOOL v17 = objc_msgSend_count(v12, v13, v14, v15) != 0;
      uint64_t v11 = objc_msgSend_numberWithBool_(v16, v18, v17, v19);
    }
    else
    {
      uint64_t v11 = 0;
    }
    id v5 = v12;
  }

  return v11;
}

- (unint64_t)cachedCountOfSyndicationIdentifiersSavedToSystemPhotoLibrary:(id)a3 shouldFetchAndNotifyAsNeeded:(BOOL)a4 didStartFetch:(BOOL *)a5
{
  BOOL v6 = a4;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v12 = v8;
  if (a5) {
    *a5 = 0;
  }
  if (objc_msgSend_count(v8, v9, v10, v11))
  {
    BOOL v43 = v6;
    uint64_t v41 = a5;
    id v44 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v42 = v12;
    id v13 = v12;
    unint64_t v15 = 0;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v48, (uint64_t)v56, 16);
    if (v16)
    {
      uint64_t v17 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v49 != v17) {
            objc_enumerationMutation(v13);
          }
          uint64_t v19 = *(void *)(*((void *)&v48 + 1) + 8 * i);
          uint64_t v20 = self;
          objc_sync_enter(v20);
          v23 = objc_msgSend__cachedSaveStateForIdentifier_(v20, v21, v19, v22);
          objc_sync_exit(v20);

          if (v23)
          {
            if (objc_msgSend_BOOLValue(v23, v24, v25, v26)) {
              ++v15;
            }
          }
          else if ((objc_msgSend_IMDeviceIsChinaRegion(MEMORY[0x1E4F6E730], v24, v25, v26) & 1) == 0)
          {
            uint64_t v27 = v20;
            objc_sync_enter(v27);
            char v30 = objc_msgSend_containsObject_(self->_syndicationIdentifiersWithActiveFetch, v28, v19, v29);
            objc_sync_exit(v27);

            if ((v30 & 1) == 0)
            {
              objc_msgSend_addObject_(v44, v31, v19, v32);
              if (IMOSLoggingEnabled())
              {
                v33 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315394;
                  uint64_t v53 = "-[IMPhotoLibraryPersistenceManager cachedCountOfSyndicationIdentifiersSavedToSystemPhotoLibrary:"
                        "shouldFetchAndNotifyAsNeeded:didStartFetch:]";
                  __int16 v54 = 2112;
                  uint64_t v55 = v19;
                  _os_log_impl(&dword_1A4AF7000, v33, OS_LOG_TYPE_INFO, "%s Identifier needs save state fetch %@", buf, 0x16u);
                }
              }
            }
          }
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v34, (uint64_t)&v48, (uint64_t)v56, 16);
      }
      while (v16);
    }

    if (v43 && objc_msgSend_count(v44, v35, v36, v37))
    {
      if (v41) {
        BOOL *v41 = 1;
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v38 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v53 = (const char *)v44;
          _os_log_impl(&dword_1A4AF7000, v38, OS_LOG_TYPE_INFO, "Fetching identifiers that weren't cached %@", buf, 0xCu);
        }
      }
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = sub_1A4BBB3F4;
      v45[3] = &unk_1E5B7CF98;
      id v46 = v44;
      uint64_t v47 = self;
      objc_msgSend_fetchInfoForSyndicationIdentifiersSavedToSystemPhotoLibrary_completion_(self, v39, (uint64_t)v46, (uint64_t)v45);
    }
    uint64_t v12 = v42;
  }
  else
  {
    unint64_t v15 = 0;
  }

  return v15;
}

- (void)cacheCompletedSaveForSyndicationIdentifiers:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_IMDeviceIsChinaRegion(MEMORY[0x1E4F6E730], v5, v6, v7))
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v4;
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v18, (uint64_t)v22, 16);
    if (v10)
    {
      uint64_t v11 = *(void *)v19;
      uint64_t v12 = MEMORY[0x1E4F1CC38];
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v13);
          unint64_t v15 = self;
          objc_sync_enter(v15);
          objc_msgSend_setObject_forKey_(self->_syndicationIdentifierSaveStateCache, v16, v12, v14, (void)v18);
          objc_sync_exit(v15);

          ++v13;
        }
        while (v10 != v13);
        uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v17, (uint64_t)&v18, (uint64_t)v22, 16);
      }
      while (v10);
    }
  }
}

- (void)fetchInfoForSyndicationIdentifiersSavedToSystemPhotoLibrary:(id)a3 completion:(id)a4
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v59 = v6;
  if (objc_msgSend_count(v6, v8, v9, v10))
  {
    uint64_t v81 = 0;
    v82 = &v81;
    uint64_t v83 = 0x2020000000;
    uint64_t v84 = 0;
    uint64_t v75 = 0;
    v76 = &v75;
    uint64_t v77 = 0x3032000000;
    v78 = sub_1A4B3450C;
    v79 = sub_1A4B3436C;
    id v80 = 0;
    id v60 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v11 = v6;
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v71, (uint64_t)v87, 16);
    id v58 = (void (**)(void, void, void))v7;
    if (v13)
    {
      uint64_t v14 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v72 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v71 + 1) + 8 * i);
          uint64_t v17 = self;
          objc_sync_enter(v17);
          uint64_t v22 = objc_msgSend__cachedSaveStateForIdentifier_(v17, v18, v16, v19);
          if (!v76[5])
          {
            uint64_t v23 = objc_msgSend_objectForKey_(self->_syndicationIdentifierToAssetUUIDCache, v20, v16, v21);
            uint64_t v24 = (void *)v76[5];
            v76[5] = v23;
          }
          objc_sync_exit(v17);

          if (v22)
          {
            if (objc_msgSend_BOOLValue(v22, v25, v26, v27)) {
              ++v82[3];
            }
          }
          else if ((objc_msgSend_IMDeviceIsChinaRegion(MEMORY[0x1E4F6E730], v25, v26, v27) & 1) == 0)
          {
            v28 = v17;
            objc_sync_enter(v28);
            char v31 = objc_msgSend_containsObject_(self->_syndicationIdentifiersWithActiveFetch, v29, v16, v30);
            objc_sync_exit(v28);

            if ((v31 & 1) == 0)
            {
              objc_msgSend_addObject_(v60, v32, v16, v33);
              if (IMOSLoggingEnabled())
              {
                uint64_t v34 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315394;
                  *(void *)&uint8_t buf[4] = "-[IMPhotoLibraryPersistenceManager fetchInfoForSyndicationIdentifiersSavedToSyste"
                                       "mPhotoLibrary:completion:]";
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v16;
                  _os_log_impl(&dword_1A4AF7000, v34, OS_LOG_TYPE_INFO, "%s Identifier needs save state fetch %@", buf, 0x16u);
                }
              }
            }
          }
        }
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v35, (uint64_t)&v71, (uint64_t)v87, 16);
      }
      while (v13);
    }

    uint64_t v39 = objc_msgSend_count(v60, v36, v37, v38);
    if (v39 && (sub_1A4BBBBD4(v39, v40, v41, v42), (objc_opt_respondsToSelector() & 1) != 0))
    {
      BOOL v43 = self;
      objc_sync_enter(v43);
      syndicationIdentifiersWithActiveFetch = v43->_syndicationIdentifiersWithActiveFetch;
      long long v48 = objc_msgSend_allObjects(v60, v45, v46, v47);
      objc_msgSend_addObjectsFromArray_(syndicationIdentifiersWithActiveFetch, v49, (uint64_t)v48, v50);

      objc_sync_exit(v43);
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      uint64_t v86 = 0;
      long long v51 = dispatch_group_create();
      dispatch_group_enter(v51);
      uint64_t v52 = objc_opt_class();
      v56 = objc_msgSend__assetFetchQueue(v52, v53, v54, v55);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1A4BBBCB8;
      block[3] = &unk_1E5B7CFC0;
      block[4] = v43;
      v69 = buf;
      v70 = &v75;
      id v67 = v60;
      v68 = v51;
      uint64_t v57 = v51;
      dispatch_async(v56, block);

      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = sub_1A4BBC054;
      v61[3] = &unk_1E5B7CFE8;
      long long v63 = &v81;
      v64 = buf;
      long long v62 = v58;
      int v65 = &v75;
      dispatch_group_notify(v57, MEMORY[0x1E4F14428], v61);

      _Block_object_dispose(buf, 8);
    }
    else if (v58)
    {
      v58[2](v58, v82[3], v76[5]);
    }

    _Block_object_dispose(&v75, 8);
    _Block_object_dispose(&v81, 8);
    id v7 = v58;
  }
  else if (v7)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (BOOL)_isListenerRegistered:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_listeners(self, v5, v6, v7);
  char v11 = objc_msgSend_containsObject_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (void)registerPhotoLibraryPersistenceManagerListener:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    char v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB8008(v11);
    }
    goto LABEL_10;
  }
  if ((objc_msgSend__isListenerRegistered_(self, v4, (uint64_t)v6, v5) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        id v15 = v6;
        _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "Registering as photo library persistence change listener %@", (uint8_t *)&v14, 0xCu);
      }
    }
    char v11 = objc_msgSend_listeners(self, v7, v8, v9);
    objc_msgSend_addObject_(v11, v12, (uint64_t)v6, v13);
LABEL_10:
  }
}

- (void)unregisterPhotoLibraryPersistenceManagerListener:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    char isListenerRegistered = objc_msgSend__isListenerRegistered_(self, v4, (uint64_t)v6, v5);
    int v8 = IMOSLoggingEnabled();
    if (isListenerRegistered)
    {
      if (v8)
      {
        uint64_t v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v18 = 138412290;
          id v19 = v6;
          _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "Unregistering as photo library persistence change listener %@", (uint8_t *)&v18, 0xCu);
        }
      }
      if (self->_listeners)
      {
        uint64_t v13 = objc_msgSend_listeners(self, v9, v10, v11);
        objc_msgSend_removeObject_(v13, v14, (uint64_t)v6, v15);
      }
    }
    else if (v8)
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v18 = 138412290;
        id v19 = v6;
        _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_INFO, "Not unregistering listener because it's already not listening %@", (uint8_t *)&v18, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v16 = IMLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB804C(v16);
    }
  }
}

- (NSHashTable)listeners
{
  listeners = self->_listeners;
  if (!listeners)
  {
    objc_msgSend_weakObjectsHashTable(MEMORY[0x1E4F28D30], a2, v2, v3);
    id v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = self->_listeners;
    self->_listeners = v6;

    int v8 = objc_opt_class();
    uint64_t v12 = objc_msgSend__photoLibraryInternalQueue(v8, v9, v10, v11);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A4BBC538;
    block[3] = &unk_1E5B7ACD0;
    block[4] = self;
    dispatch_async(v12, block);

    listeners = self->_listeners;
  }
  if (!self->_libraryAlreadyOpened && listeners)
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v17 = objc_msgSend__photoLibraryInternalQueue(v13, v14, v15, v16);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1A4BBC5F0;
    v19[3] = &unk_1E5B7ACD0;
    v19[4] = self;
    dispatch_async(v17, v19);

    listeners = self->_listeners;
  }

  return listeners;
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1A4BBC690;
  v6[3] = &unk_1E5B7B130;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

- (void)_notifyListeners
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = objc_msgSend_listeners(self, v7, v8, v9);
      *(_DWORD *)buf = 134217984;
      uint64_t v28 = objc_msgSend_count(v10, v11, v12, v13);
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Broadcasting changes to %lu listeners", buf, 0xCu);
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  int v14 = objc_msgSend_allObjects(self->_listeners, v3, v4, v5, 0);
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v19)
  {
    uint64_t v20 = *(void *)v23;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend_photoLibraryPersistedSyndicatedAssetSetDidChange(*(void **)(*((void *)&v22 + 1) + 8 * v21++), v16, v17, v18);
      }
      while (v19 != v21);
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v16, (uint64_t)&v22, (uint64_t)v26, 16);
    }
    while (v19);
  }
}

- (void)_openPhotoLibraryIfNecessary
{
  if (!self->_libraryAlreadyOpened)
  {
    id v5 = sub_1A4BBBF70((uint64_t)self, a2, v2, v3);
    uint64_t v9 = objc_msgSend_sharedPhotoLibrary(v5, v6, v7, v8);
    id v14 = 0;
    char v11 = objc_msgSend_openAndWaitWithUpgrade_error_(v9, v10, 0, (uint64_t)&v14);
    id v12 = v14;

    if (v11)
    {
      self->_libraryAlreadyOpened = 1;
    }
    else
    {
      uint64_t v13 = IMLogHandleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB8090((uint64_t)v12, v13);
      }
    }
  }
}

- (void)setListeners:(id)a3
{
}

- (CPLRUDictionary)syndicationIdentifierSaveStateCache
{
  return self->_syndicationIdentifierSaveStateCache;
}

- (void)setSyndicationIdentifierSaveStateCache:(id)a3
{
}

- (CPLRUDictionary)syndicationIdentifierFetchResultCache
{
  return self->_syndicationIdentifierFetchResultCache;
}

- (void)setSyndicationIdentifierFetchResultCache:(id)a3
{
}

- (NSMutableDictionary)syndicationIdentifierToAssetUUIDCache
{
  return self->_syndicationIdentifierToAssetUUIDCache;
}

- (void)setSyndicationIdentifierToAssetUUIDCache:(id)a3
{
}

- (NSMutableSet)syndicationIdentifiersWithActiveFetch
{
  return self->_syndicationIdentifiersWithActiveFetch;
}

- (void)setSyndicationIdentifiersWithActiveFetch:(id)a3
{
}

- (BOOL)libraryAlreadyOpened
{
  return self->_libraryAlreadyOpened;
}

- (void)setLibraryAlreadyOpened:(BOOL)a3
{
  self->_libraryAlreadyOpened = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syndicationIdentifiersWithActiveFetch, 0);
  objc_storeStrong((id *)&self->_syndicationIdentifierToAssetUUIDCache, 0);
  objc_storeStrong((id *)&self->_syndicationIdentifierFetchResultCache, 0);
  objc_storeStrong((id *)&self->_syndicationIdentifierSaveStateCache, 0);

  objc_storeStrong((id *)&self->_listeners, 0);
}

@end