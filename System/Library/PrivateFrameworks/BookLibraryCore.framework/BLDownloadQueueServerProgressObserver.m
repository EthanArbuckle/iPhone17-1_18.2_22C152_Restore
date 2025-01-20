@interface BLDownloadQueueServerProgressObserver
- (BLDownloadQueueNonUI)downloadQueue;
- (BLDownloadQueueServerProgressObserver)initWithDownloadQueue:(id)a3;
- (BLServiceProxy)serviceProxy;
- (NSArray)downloads;
- (NSHashTable)observers;
- (NSMutableDictionary)activeDownloads;
- (id)_dateFromObject:(id)a3;
- (id)_downloadStatusFromDictionary:(id)a3 outParamNewlyTrackedDownload:(BOOL *)a4;
- (id)_downloadStatusStoreID:(id)a3 storePlaylistID:(id)a4 orPermLink:(id)a5 downloadID:(id)a6 title:(id)a7 collectionTitle:(id)a8 assetKind:(id)a9 isPaused:(BOOL)a10;
- (id)_numberFromObject:(id)a3;
- (id)_stringFromObject:(id)a3;
- (void)_postDownloadCompleteNotificationWithDictionary:(id)a3 failed:(BOOL)a4;
- (void)_postDownloadProgressNotificationWithDictionary:(id)a3;
- (void)_postUpdatesForCurrentlyPausedDownloadsForObserver:(id)a3;
- (void)cancelAllPausedDownloads;
- (void)dealloc;
- (void)didFailWithUserInfo:(id)a3;
- (void)downloadCompleteWithUserInfo:(id)a3;
- (void)notifyDidCompleteForDownloadID:(id)a3;
- (void)notifyPurchaseAttemptForRequest:(id)a3;
- (void)progressWithUserInfo:(id)a3;
- (void)purchaseDidCompleteWithResponse:(id)a3;
- (void)purchaseDidFailedWithResponse:(id)a3;
- (void)purchaseFailedWithUserInfo:(id)a3;
- (void)purchaseSucceededWithUserInfo:(id)a3;
- (void)reconnectingToServiceForProxy:(id)a3;
- (void)registerObserver:(id)a3;
- (void)sendCancelCompletionNotificationForDownloadWithDownloadID:(id)a3;
- (void)sendInitialProgressNotificationForDownloadWithStoreID:(id)a3 storePlaylistID:(id)a4 orPermlink:(id)a5 downloadID:(id)a6 title:(id)a7 collectionTitle:(id)a8 assetKind:(id)a9 isPaused:(BOOL)a10 targetObserver:(id)a11;
- (void)setActiveDownloads:(id)a3;
- (void)setDownloadQueue:(id)a3;
- (void)setObservers:(id)a3;
- (void)setServiceProxy:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation BLDownloadQueueServerProgressObserver

- (NSArray)downloads
{
  p_activeDownloadsLock = &self->_activeDownloadsLock;
  os_unfair_lock_lock(&self->_activeDownloadsLock);
  v7 = objc_msgSend_activeDownloads(self, v4, v5, v6);
  v11 = objc_msgSend_allValues(v7, v8, v9, v10);
  v15 = objc_msgSend_copy(v11, v12, v13, v14);

  os_unfair_lock_unlock(p_activeDownloadsLock);

  return (NSArray *)v15;
}

- (void)reconnectingToServiceForProxy:(id)a3
{
  id v3 = a3;
  v4 = BLDownloadQueueServiceProgressMonitorLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21DFE3000, v4, OS_LOG_TYPE_DEFAULT, "[BLDownloadQueueServerProgressObserver] registering to monitor progress.", v7, 2u);
  }

  objc_msgSend_monitorProgressWithReply_(v3, v5, (uint64_t)&unk_26CED3D70, v6);
}

- (void)registerObserver:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    v8 = objc_msgSend_observers(self, v5, v6, v7);
    objc_msgSend_addObject_(v8, v9, (uint64_t)v4, v10);

    os_unfair_lock_unlock(&self->_observersLock);
    v11 = BLDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_21DFE3000, v11, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: Added observer: %@", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend__postUpdatesForCurrentlyPausedDownloadsForObserver_(self, v12, (uint64_t)v4, v13);
  }
}

- (BLDownloadQueueServerProgressObserver)initWithDownloadQueue:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BLDownloadQueueServerProgressObserver;
  uint64_t v5 = [(BLDownloadQueueServerProgressObserver *)&v22 init];
  uint64_t v6 = (uint64_t)v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_downloadQueue, v4);
    uint64_t v9 = objc_msgSend_hashTableWithOptions_(MEMORY[0x263F088B0], v7, 517, v8);
    uint64_t v10 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = v9;

    *(void *)(v6 + 8) = 0;
    uint64_t v11 = objc_opt_new();
    v12 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = v11;

    uint64_t v13 = [BLServiceProxy alloc];
    uint64_t v15 = objc_msgSend_initWithProgressReceiver_error_(v13, v14, v6, 0);
    uint64_t v16 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v15;

    objc_msgSend_setConnectionMonitor_(*(void **)(v6 + 16), v17, v6, v18);
    objc_msgSend_reconnectingToServiceForProxy_((void *)v6, v19, *(void *)(v6 + 16), v20);
  }

  return (BLDownloadQueueServerProgressObserver *)v6;
}

- (void)_postUpdatesForCurrentlyPausedDownloadsForObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v8 = objc_msgSend_serviceProxy(self, v5, v6, v7);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_21DFE4444;
  v12[3] = &unk_26448B970;
  objc_copyWeak(&v14, &location);
  id v9 = v4;
  id v13 = v9;
  objc_msgSend_fetchDownloadListWithReply_(v8, v10, (uint64_t)v12, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (BLServiceProxy)serviceProxy
{
  return self->_serviceProxy;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (NSMutableDictionary)activeDownloads
{
  return self->_activeDownloads;
}

- (void)dealloc
{
  objc_msgSend_shutdown(self->_serviceProxy, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)BLDownloadQueueServerProgressObserver;
  [(BLDownloadQueueServerProgressObserver *)&v5 dealloc];
}

- (void)cancelAllPausedDownloads
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  objc_super v5 = objc_msgSend_activeDownloads(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_count(v5, v6, v7, v8);

  if (v9)
  {
    uint64_t v10 = BLDownloadQueueServiceProgressMonitorLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DFE3000, v10, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: _cancelAllPausedDownloads", buf, 2u);
    }

    os_unfair_lock_lock(&self->_observersLock);
    id v14 = objc_msgSend_observers(self, v11, v12, v13);
    v58 = objc_msgSend_copy(v14, v15, v16, v17);

    v21 = objc_msgSend_activeDownloads(self, v18, v19, v20);
    v25 = objc_msgSend_allValues(v21, v22, v23, v24);
    v29 = objc_msgSend_copy(v25, v26, v27, v28);

    os_unfair_lock_unlock(&self->_observersLock);
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id obj = v29;
    uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v66, (uint64_t)v74, 16);
    if (v31)
    {
      uint64_t v35 = v31;
      uint64_t v36 = *(void *)v67;
      uint64_t v57 = *(void *)v67;
      do
      {
        uint64_t v37 = 0;
        uint64_t v59 = v35;
        do
        {
          if (*(void *)v67 != v36) {
            objc_enumerationMutation(obj);
          }
          v38 = *(void **)(*((void *)&v66 + 1) + 8 * v37);
          if (objc_msgSend_downloadPhase(v38, v32, v33, v34) == 3)
          {
            uint64_t v61 = v37;
            objc_msgSend_setDownloadPhase_(v38, v32, 4, v34);
            long long v64 = 0u;
            long long v65 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            id v39 = v58;
            uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v62, (uint64_t)v73, 16);
            if (v41)
            {
              uint64_t v42 = v41;
              uint64_t v43 = *(void *)v63;
              do
              {
                for (uint64_t i = 0; i != v42; ++i)
                {
                  if (*(void *)v63 != v43) {
                    objc_enumerationMutation(v39);
                  }
                  v45 = *(void **)(*((void *)&v62 + 1) + 8 * i);
                  if (objc_opt_respondsToSelector())
                  {
                    v47 = BLDownloadQueueServiceProgressMonitorLog();
                    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v72 = v45;
                      _os_log_impl(&dword_21DFE3000, v47, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: notifyComplete: for observer %@", buf, 0xCu);
                    }

                    v51 = objc_msgSend_downloadQueue(self, v48, v49, v50);
                    v70 = v38;
                    v53 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v52, (uint64_t)&v70, 1);
                    objc_msgSend_downloadQueue_downloadStates_didCompleteWithError_(v45, v54, (uint64_t)v51, (uint64_t)v53, 0);
                  }
                }
                uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v46, (uint64_t)&v62, (uint64_t)v73, 16);
              }
              while (v42);
            }

            uint64_t v36 = v57;
            uint64_t v35 = v59;
            uint64_t v37 = v61;
          }
          ++v37;
        }
        while (v37 != v35);
        uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v32, (uint64_t)&v66, (uint64_t)v74, 16);
      }
      while (v35);
    }

    os_unfair_lock_lock(&self->_activeDownloadsLock);
    objc_msgSend_setActiveDownloads_(self, v55, 0, v56);
    os_unfair_lock_unlock(&self->_activeDownloadsLock);
  }
}

- (void)notifyPurchaseAttemptForRequest:(id)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = BLDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v76 = v4;
    _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: NotifyPurchaseAttemptForRequest: %@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_observersLock);
  uint64_t v9 = objc_msgSend_observers(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_copy(v9, v10, v11, v12);

  os_unfair_lock_unlock(&self->_observersLock);
  long long v69 = objc_msgSend_downloadQueue(self, v14, v15, v16);
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = v13;
  uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v70, (uint64_t)v74, 16);
  if (v68)
  {
    uint64_t v18 = *(void *)v71;
    do
    {
      uint64_t v19 = 0;
      uint64_t v20 = sel_downloadQueue_purchaseAttemptForRequest_;
      do
      {
        if (*(void *)v71 != v18) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v70 + 1) + 8 * v19);
        if (objc_opt_respondsToSelector())
        {
          objc_super v22 = BLDefaultLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v76 = v21;
            _os_log_impl(&dword_21DFE3000, v22, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: notifying observer %@ of purchaseAttemptForRequest:", buf, 0xCu);
          }

          objc_msgSend_downloadQueue_purchaseAttemptForRequest_(v21, v23, (uint64_t)v69, (uint64_t)v4);
        }
        if (objc_opt_respondsToSelector())
        {
          uint64_t v24 = v20;
          uint64_t v25 = v18;
          v26 = BLDefaultLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v76 = v21;
            _os_log_impl(&dword_21DFE3000, v26, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: notifying observer %@ of downloadQueuePurchaseAttemptForIDWithUserInfo", buf, 0xCu);
          }

          v30 = objc_msgSend_storeIdentifier(v4, v27, v28, v29);
          uint64_t v34 = objc_msgSend_stringValue(v30, v31, v32, v33);
          v38 = objc_msgSend_buyParameters(v4, v35, v36, v37);
          uint64_t isAudiobook = objc_msgSend_isAudiobook(v4, v39, v40, v41);
          v46 = objc_msgSend_analyticsInfo(v4, v43, v44, v45);
          objc_msgSend_downloadQueue_purchaseAttemptForID_buyParams_isAudioBook_userInfo_(v21, v47, (uint64_t)v69, (uint64_t)v34, v38, isAudiobook, v46);

          uint64_t v18 = v25;
          uint64_t v20 = v24;
        }
        if (objc_opt_respondsToSelector())
        {
          uint64_t v49 = BLDefaultLog();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v76 = v21;
            _os_log_impl(&dword_21DFE3000, v49, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: notifying observer %@ of downloadQueuePurchaseAttemptForID", buf, 0xCu);
          }

          v53 = objc_msgSend_storeIdentifier(v4, v50, v51, v52);
          uint64_t v57 = objc_msgSend_stringValue(v53, v54, v55, v56);
          uint64_t v61 = objc_msgSend_buyParameters(v4, v58, v59, v60);
          uint64_t v65 = objc_msgSend_isAudiobook(v4, v62, v63, v64);
          objc_msgSend_downloadQueue_purchaseAttemptForID_buyParams_isAudioBook_(v21, v66, (uint64_t)v69, (uint64_t)v57, v61, v65);
        }
        ++v19;
      }
      while (v68 != v19);
      uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v48, (uint64_t)&v70, (uint64_t)v74, 16);
    }
    while (v68);
  }
}

- (void)unregisterObserver:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    p_observersLock = &self->_observersLock;
    os_unfair_lock_lock(&self->_observersLock);
    uint64_t v9 = objc_msgSend_observers(self, v6, v7, v8);
    int v12 = objc_msgSend_containsObject_(v9, v10, (uint64_t)v4, v11);

    if (v12)
    {
      uint64_t v16 = objc_msgSend_observers(self, v13, v14, v15);
      objc_msgSend_removeObject_(v16, v17, (uint64_t)v4, v18);
    }
    os_unfair_lock_unlock(p_observersLock);
    uint64_t v19 = BLDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v4;
      _os_log_impl(&dword_21DFE3000, v19, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: Removed observer: %@", (uint8_t *)&v20, 0xCu);
    }
  }
}

- (void)notifyDidCompleteForDownloadID:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = BLDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v59 = v4;
    _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: notifyDidCompleteForDownloadID", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_observersLock);
  uint64_t v9 = objc_msgSend_observers(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_copy(v9, v10, v11, v12);

  uint64_t v17 = objc_msgSend_activeDownloads(self, v14, v15, v16);
  int v20 = objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)v4, v19);

  os_unfair_lock_unlock(&self->_observersLock);
  if (objc_msgSend_downloadPhase(v20, v21, v22, v23) == 3 || objc_msgSend_downloadPhase(v20, v24, v25, v26) == 1)
  {
    id v51 = v4;
    objc_msgSend_setDownloadPhase_(v20, v24, 4, v26);
    uint64_t v50 = self;
    v30 = objc_msgSend_downloadQueue(self, v27, v28, v29);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    uint64_t v49 = v13;
    id v31 = v13;
    uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v52, (uint64_t)v57, 16);
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v53 != v35) {
            objc_enumerationMutation(v31);
          }
          uint64_t v37 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            id v39 = BLDefaultLog();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v59 = v37;
              _os_log_impl(&dword_21DFE3000, v39, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: notifyComplete: for observer %@", buf, 0xCu);
            }

            uint64_t v56 = v20;
            uint64_t v41 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v40, (uint64_t)&v56, 1);
            objc_msgSend_downloadQueue_downloadStates_didCompleteWithError_(v37, v42, (uint64_t)v30, (uint64_t)v41, 0);
          }
        }
        uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v38, (uint64_t)&v52, (uint64_t)v57, 16);
      }
      while (v34);
    }

    self = v50;
    id v4 = v51;
    uint64_t v13 = v49;
  }
  p_activeDownloadsLock = &self->_activeDownloadsLock;
  os_unfair_lock_lock(&self->_activeDownloadsLock);
  v47 = objc_msgSend_activeDownloads(self, v44, v45, v46);
  objc_msgSend_setObject_forKeyedSubscript_(v47, v48, 0, (uint64_t)v4);

  os_unfair_lock_unlock(p_activeDownloadsLock);
}

- (void)sendInitialProgressNotificationForDownloadWithStoreID:(id)a3 storePlaylistID:(id)a4 orPermlink:(id)a5 downloadID:(id)a6 title:(id)a7 collectionTitle:(id)a8 assetKind:(id)a9 isPaused:(BOOL)a10 targetObserver:(id)a11
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v62 = a9;
  id v23 = a11;
  uint64_t v24 = BLDefaultLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v72 = v20;
    _os_log_impl(&dword_21DFE3000, v24, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: sendInitialProgressNotificationForDownloadWithStoreID...", buf, 0xCu);
  }

  uint64_t v61 = v22;
  if (v20)
  {
    uint64_t v26 = v62;
    v30 = objc_msgSend__downloadStatusStoreID_storePlaylistID_orPermLink_downloadID_title_collectionTitle_assetKind_isPaused_(self, v25, (uint64_t)v17, (uint64_t)v18, v19, v20, v21, v22, v62, a10);
    if (v30)
    {
      id v60 = v17;
      id v31 = objc_msgSend_downloadQueue(self, v27, v28, v29);
      if (v23 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        uint64_t v32 = BLDefaultLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          id v72 = v20;
          __int16 v73 = 2112;
          id v74 = v23;
          __int16 v75 = 2112;
          id v76 = v30;
          _os_log_impl(&dword_21DFE3000, v32, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: notifying target observer: %@ of downloadStatesDidChange: %@", buf, 0x20u);
        }

        long long v70 = v30;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v33, (uint64_t)&v70, 1);
        id v34 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_downloadQueue_downloadStatesDidChange_(v23, v35, (uint64_t)v31, (uint64_t)v34);
      }
      else
      {
        id v58 = v23;
        id v59 = v21;
        id v63 = v20;
        p_observersLock = &self->_observersLock;
        os_unfair_lock_lock(&self->_observersLock);
        uint64_t v40 = objc_msgSend_observers(self, v37, v38, v39);
        uint64_t v44 = objc_msgSend_copy(v40, v41, v42, v43);

        os_unfair_lock_unlock(p_observersLock);
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v34 = v44;
        uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v45, (uint64_t)&v64, (uint64_t)v69, 16);
        if (v46)
        {
          uint64_t v50 = v46;
          uint64_t v51 = *(void *)v65;
          do
          {
            for (uint64_t i = 0; i != v50; ++i)
            {
              if (*(void *)v65 != v51) {
                objc_enumerationMutation(v34);
              }
              long long v53 = *(void **)(*((void *)&v64 + 1) + 8 * i);
              if ((!objc_msgSend_isAudiobook(v30, v47, v48, v49) || (sub_21DFFE6E0(v53) & 1) == 0)
                && (objc_opt_respondsToSelector() & 1) != 0)
              {
                long long v54 = BLDefaultLog();
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543874;
                  id v72 = v63;
                  __int16 v73 = 2112;
                  id v74 = v53;
                  __int16 v75 = 2112;
                  id v76 = v30;
                  _os_log_impl(&dword_21DFE3000, v54, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: notifying observer: %@ of downloadStatesDidChange: %@", buf, 0x20u);
                }

                uint64_t v68 = v30;
                uint64_t v56 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v55, (uint64_t)&v68, 1);
                objc_msgSend_downloadQueue_downloadStatesDidChange_(v53, v57, (uint64_t)v31, (uint64_t)v56);
              }
            }
            uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v47, (uint64_t)&v64, (uint64_t)v69, 16);
          }
          while (v50);
        }

        id v20 = v63;
        id v23 = v58;
        id v21 = v59;
        uint64_t v26 = v62;
      }

      id v17 = v60;
    }
  }
  else
  {
    v30 = BLDefaultLog();
    uint64_t v26 = v62;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DFE3000, v30, OS_LOG_TYPE_ERROR, "[DownloadQueue]: nil passed for downloadID to _sendInitialProgressNotificationFor...", buf, 2u);
    }
  }
}

- (void)sendCancelCompletionNotificationForDownloadWithDownloadID:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = BLDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v55 = v4;
    _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: sendCancelCompletionNotificationForDownloadWithDownloadID", buf, 0xCu);
  }

  if (v4)
  {
    os_unfair_lock_lock(&self->_activeDownloadsLock);
    uint64_t v9 = objc_msgSend_activeDownloads(self, v6, v7, v8);
    uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v4, v11);

    uint64_t v16 = objc_msgSend_activeDownloads(self, v13, v14, v15);
    objc_msgSend_setObject_forKeyedSubscript_(v16, v17, 0, (uint64_t)v4);

    os_unfair_lock_unlock(&self->_activeDownloadsLock);
    if (v12)
    {
      id v48 = v4;
      objc_msgSend_setDownloadPhase_(v12, v18, 4, v19);
      os_unfair_lock_lock(&self->_observersLock);
      id v23 = objc_msgSend_observers(self, v20, v21, v22);
      uint64_t v27 = objc_msgSend_copy(v23, v24, v25, v26);

      os_unfair_lock_unlock(&self->_observersLock);
      id v31 = objc_msgSend_downloadQueue(self, v28, v29, v30);
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v32 = v27;
      uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v49, (uint64_t)v58, 16);
      if (v34)
      {
        uint64_t v39 = v34;
        uint64_t v40 = *(void *)v50;
        *(void *)&long long v38 = 138543618;
        long long v47 = v38;
        do
        {
          uint64_t v41 = 0;
          do
          {
            if (*(void *)v50 != v40) {
              objc_enumerationMutation(v32);
            }
            uint64_t v42 = *(void **)(*((void *)&v49 + 1) + 8 * v41);
            if ((!objc_msgSend_isAudiobook(v12, v35, v36, v37, v47) || (sub_21DFFE6E0(v42) & 1) == 0)
              && (objc_opt_respondsToSelector() & 1) != 0)
            {
              uint64_t v43 = BLDefaultLog();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v47;
                id v55 = v48;
                __int16 v56 = 2112;
                uint64_t v57 = v42;
                _os_log_impl(&dword_21DFE3000, v43, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: sendingCancelComplete for observer %@", buf, 0x16u);
              }

              long long v53 = v12;
              uint64_t v45 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v44, (uint64_t)&v53, 1);
              objc_msgSend_downloadQueue_downloadStates_didCompleteWithError_(v42, v46, (uint64_t)v31, (uint64_t)v45, 0);
            }
            ++v41;
          }
          while (v39 != v41);
          uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v49, (uint64_t)v58, 16);
        }
        while (v39);
      }

      id v4 = v48;
    }
  }
  else
  {
    uint64_t v12 = BLDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DFE3000, v12, OS_LOG_TYPE_ERROR, "[DownloadQueue]: _sendCancelCompleteNotification: nil passed for downloadID", buf, 2u);
    }
  }
}

- (id)_downloadStatusFromDictionary:(id)a3 outParamNewlyTrackedDownload:(BOOL *)a4
{
  uint64_t v251 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v6, v7, @"downloadIdentifier", v8);
  uint64_t v12 = objc_msgSend__stringFromObject_(self, v10, (uint64_t)v9, v11);

  if (v12)
  {
    p_activeDownloadsLock = &self->_activeDownloadsLock;
    os_unfair_lock_lock(&self->_activeDownloadsLock);
    id v17 = objc_msgSend_activeDownloads(self, v14, v15, v16);
    id v20 = objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)v12, v19);

    if (!v20)
    {
      id v20 = objc_opt_new();
      uint64_t v24 = objc_msgSend_activeDownloads(self, v21, v22, v23);
      objc_msgSend_setObject_forKeyedSubscript_(v24, v25, (uint64_t)v20, (uint64_t)v12);

      if (a4) {
        *a4 = 1;
      }
    }
    os_unfair_lock_unlock(&self->_activeDownloadsLock);
    objc_msgSend_setDownloadID_(v20, v26, (uint64_t)v12, v27);
    uint64_t v30 = objc_msgSend_objectForKeyedSubscript_(v6, v28, @"storeItemIdentifier", v29);
    uint64_t v33 = objc_msgSend__numberFromObject_(self, v31, (uint64_t)v30, v32);

    if (v33 && (objc_msgSend_isEqual_(v33, v34, (uint64_t)&unk_26CEE4048, v35) & 1) == 0) {
      objc_msgSend_setStoreID_(v20, v34, (uint64_t)v33, v35);
    }
    uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(v6, v34, @"storePlaylistIdentifier", v35);
    uint64_t v39 = objc_msgSend__numberFromObject_(self, v37, (uint64_t)v36, v38);

    if (v39) {
      objc_msgSend_setStorePlaylistID_(v20, v40, v39, v41);
    }
    uint64_t v42 = objc_msgSend_objectForKeyedSubscript_(v6, v40, @"permLink", v41);
    uint64_t v45 = objc_msgSend__stringFromObject_(self, v43, (uint64_t)v42, v44);

    if (v45) {
      objc_msgSend_setPermLink_(v20, v46, v45, v47);
    }
    v245 = (void *)v45;
    v246 = (void *)v39;
    id v48 = BLDefaultLog();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      long long v51 = objc_msgSend_objectForKeyedSubscript_(v6, v49, @"percentComplete", v50, v45, v39);
      long long v54 = objc_msgSend__numberFromObject_(self, v52, (uint64_t)v51, v53);
      *(_DWORD *)buf = 138543618;
      id v248 = v12;
      __int16 v249 = 2112;
      v250 = v54;
      _os_log_impl(&dword_21DFE3000, v48, OS_LOG_TYPE_DEBUG, "(dID=%{public}@) [DownloadQueue]: notifying percentComplete:[%@]", buf, 0x16u);
    }
    uint64_t v57 = objc_msgSend_objectForKeyedSubscript_(v6, v55, @"percentComplete", v56);
    id v60 = objc_msgSend__numberFromObject_(self, v58, (uint64_t)v57, v59);
    objc_msgSend_setPercentComplete_(v20, v61, (uint64_t)v60, v62);

    long long v65 = objc_msgSend_objectForKeyedSubscript_(v6, v63, @"estimatedTimeRemaining", v64);
    uint64_t v68 = objc_msgSend__numberFromObject_(self, v66, (uint64_t)v65, v67);
    objc_msgSend_setEstimatedTimeRemaining_(v20, v69, (uint64_t)v68, v70);

    __int16 v73 = objc_msgSend_objectForKeyedSubscript_(v6, v71, @"bytesDownloaded", v72);
    id v76 = objc_msgSend__numberFromObject_(self, v74, (uint64_t)v73, v75);
    objc_msgSend_setTransferBytesWritten_(v20, v77, (uint64_t)v76, v78);

    v81 = objc_msgSend_objectForKeyedSubscript_(v6, v79, @"bytesTotal", v80);
    v84 = objc_msgSend__numberFromObject_(self, v82, (uint64_t)v81, v83);
    objc_msgSend_setTransferBytesExpected_(v20, v85, (uint64_t)v84, v86);

    v89 = objc_msgSend_objectForKeyedSubscript_(v6, v87, @"downloadPhase", v88);
    v92 = objc_msgSend__numberFromObject_(self, v90, (uint64_t)v89, v91);

    uint64_t v96 = objc_msgSend_integerValue(v92, v93, v94, v95);
    objc_msgSend_setDownloadPhase_(v20, v97, v96, v98);
    v101 = objc_msgSend_objectForKeyedSubscript_(v6, v99, @"artistName", v100);
    v104 = objc_msgSend__stringFromObject_(self, v102, (uint64_t)v101, v103);
    objc_msgSend_setArtistName_(v20, v105, (uint64_t)v104, v106);

    v109 = objc_msgSend_objectForKeyedSubscript_(v6, v107, @"title", v108);
    v112 = objc_msgSend__stringFromObject_(self, v110, (uint64_t)v109, v111);
    objc_msgSend_setTitle_(v20, v113, (uint64_t)v112, v114);

    v117 = objc_msgSend_objectForKeyedSubscript_(v6, v115, @"subtitle", v116);
    v120 = objc_msgSend__stringFromObject_(self, v118, (uint64_t)v117, v119);
    objc_msgSend_setSubtitle_(v20, v121, (uint64_t)v120, v122);

    v125 = objc_msgSend_objectForKeyedSubscript_(v6, v123, @"collectionArtistName", v124);
    v128 = objc_msgSend__stringFromObject_(self, v126, (uint64_t)v125, v127);
    objc_msgSend_setCollectionArtistName_(v20, v129, (uint64_t)v128, v130);

    v133 = objc_msgSend_objectForKeyedSubscript_(v6, v131, @"collectionTitle", v132);
    v136 = objc_msgSend__stringFromObject_(self, v134, (uint64_t)v133, v135);
    objc_msgSend_setCollectionTitle_(v20, v137, (uint64_t)v136, v138);

    v141 = objc_msgSend_objectForKeyedSubscript_(v6, v139, @"genre", v140);
    v144 = objc_msgSend__stringFromObject_(self, v142, (uint64_t)v141, v143);
    objc_msgSend_setGenre_(v20, v145, (uint64_t)v144, v146);

    v149 = objc_msgSend_objectForKeyedSubscript_(v6, v147, @"kind", v148);
    v152 = objc_msgSend__stringFromObject_(self, v150, (uint64_t)v149, v151);
    objc_msgSend_setAssetKind_(v20, v153, (uint64_t)v152, v154);

    v157 = objc_msgSend_objectForKeyedSubscript_(v6, v155, @"thumbnailImageURL", v156);
    v160 = objc_msgSend__stringFromObject_(self, v158, (uint64_t)v157, v159);
    objc_msgSend_setThumbnailImageURL_(v20, v161, (uint64_t)v160, v162);

    v165 = objc_msgSend_objectForKeyedSubscript_(v6, v163, @"isAudiobook", v164);
    v168 = objc_msgSend__numberFromObject_(self, v166, (uint64_t)v165, v167);
    uint64_t v172 = objc_msgSend_BOOLValue(v168, v169, v170, v171);
    objc_msgSend_setIsAudiobook_(v20, v173, v172, v174);

    v177 = objc_msgSend_objectForKeyedSubscript_(v6, v175, @"isRestore", v176);
    v180 = objc_msgSend__numberFromObject_(self, v178, (uint64_t)v177, v179);
    uint64_t v184 = objc_msgSend_BOOLValue(v180, v181, v182, v183);
    objc_msgSend_setIsRestore_(v20, v185, v184, v186);

    v189 = objc_msgSend_objectForKeyedSubscript_(v6, v187, @"isSample", v188);
    v192 = objc_msgSend__numberFromObject_(self, v190, (uint64_t)v189, v191);
    uint64_t v196 = objc_msgSend_BOOLValue(v192, v193, v194, v195);
    objc_msgSend_setIsSample_(v20, v197, v196, v198);

    v201 = objc_msgSend_objectForKeyedSubscript_(v6, v199, @"isPurchase", v200);
    v204 = objc_msgSend__numberFromObject_(self, v202, (uint64_t)v201, v203);
    uint64_t v208 = objc_msgSend_BOOLValue(v204, v205, v206, v207);
    objc_msgSend_setIsPurchase_(v20, v209, v208, v210);

    v213 = objc_msgSend_objectForKeyedSubscript_(v6, v211, @"purchaseDate", v212);
    v216 = objc_msgSend__dateFromObject_(self, v214, (uint64_t)v213, v215);
    objc_msgSend_setPurchaseDate_(v20, v217, (uint64_t)v216, v218);

    v221 = objc_msgSend_objectForKeyedSubscript_(v6, v219, @"persistentIdentifier", v220);
    v224 = objc_msgSend__numberFromObject_(self, v222, (uint64_t)v221, v223);
    uint64_t v228 = objc_msgSend_unsignedLongValue(v224, v225, v226, v227);
    objc_msgSend_setPersistentIdentifier_(v20, v229, v228, v230);

    v233 = objc_msgSend_objectForKeyedSubscript_(v6, v231, @"storeAccountIdentifier", v232);
    v236 = objc_msgSend__numberFromObject_(self, v234, (uint64_t)v233, v235);
    objc_msgSend_setStoreAccountIdentifier_(v20, v237, (uint64_t)v236, v238);

    os_unfair_lock_lock(&self->_activeDownloadsLock);
    v242 = objc_msgSend_activeDownloads(self, v239, v240, v241);
    objc_msgSend_setObject_forKeyedSubscript_(v242, v243, (uint64_t)v20, (uint64_t)v12);

    os_unfair_lock_unlock(p_activeDownloadsLock);
  }
  else
  {
    uint64_t v33 = BLDefaultLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v248 = v6;
      _os_log_impl(&dword_21DFE3000, v33, OS_LOG_TYPE_ERROR, "[DownloadQueue]: _downloadStatusFromDictionary: failed to retrieve downloadID from dictionary %@", buf, 0xCu);
    }
    id v20 = 0;
  }

  return v20;
}

- (void)_postDownloadProgressNotificationWithDictionary:(id)a3
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v61 = 0;
  id v6 = objc_msgSend__downloadStatusFromDictionary_outParamNewlyTrackedDownload_(self, v5, (uint64_t)v4, (uint64_t)&v61);
  uint64_t v10 = objc_msgSend_copy(v6, v7, v8, v9);
  uint64_t v14 = objc_msgSend_downloadID(v10, v11, v12, v13);
  uint64_t v15 = BLDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    long long v66 = v14;
    __int16 v67 = 2048;
    uint64_t v68 = v6;
    __int16 v69 = 2048;
    uint64_t v70 = v10;
    __int16 v71 = 2112;
    id v72 = v4;
    _os_log_impl(&dword_21DFE3000, v15, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue] Copied download status %p to download status %p for dictionary %@", buf, 0x2Au);
  }

  if (v14)
  {
    long long v52 = v14;
    uint64_t v50 = v6;
    id v51 = v4;
    os_unfair_lock_lock(&self->_observersLock);
    uint64_t v19 = objc_msgSend_observers(self, v16, v17, v18);
    uint64_t v23 = objc_msgSend_copy(v19, v20, v21, v22);

    os_unfair_lock_unlock(&self->_observersLock);
    if (v61)
    {
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v49 = v23;
      id v24 = v23;
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v57, (uint64_t)v64, 16);
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v58;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v58 != v28) {
              objc_enumerationMutation(v24);
            }
            uint64_t v30 = *(void **)(*((void *)&v57 + 1) + 8 * i);
            if (objc_opt_respondsToSelector())
            {
              uint64_t v32 = BLDefaultLog();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                long long v66 = v52;
                __int16 v67 = 2112;
                uint64_t v68 = v30;
                _os_log_impl(&dword_21DFE3000, v32, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: notifying observer %@ of downloadManagerDownloadsDidChange", buf, 0x16u);
              }

              objc_msgSend_downloadQueueDownloadsDidChange_(v30, v33, 0, v34);
            }
          }
          uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v31, (uint64_t)&v57, (uint64_t)v64, 16);
        }
        while (v27);
      }

      uint64_t v23 = v49;
    }
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v35 = v23;
    uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v53, (uint64_t)v63, 16);
    if (v37)
    {
      uint64_t v41 = v37;
      uint64_t v42 = *(void *)v54;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v54 != v42) {
            objc_enumerationMutation(v35);
          }
          uint64_t v44 = *(void **)(*((void *)&v53 + 1) + 8 * j);
          if ((!objc_msgSend_isAudiobook(v10, v38, v39, v40) || (sub_21DFFE6E0(v44) & 1) == 0)
            && (objc_opt_respondsToSelector() & 1) != 0)
          {
            uint64_t v45 = BLDefaultLog();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              long long v66 = v52;
              __int16 v67 = 2112;
              uint64_t v68 = v44;
              __int16 v69 = 2112;
              uint64_t v70 = v10;
              _os_log_impl(&dword_21DFE3000, v45, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: notifying observer: %@ of downloadStatesDidChange: %@", buf, 0x20u);
            }

            uint64_t v62 = v10;
            uint64_t v47 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v46, (uint64_t)&v62, 1);
            objc_msgSend_downloadQueue_downloadStatesDidChange_(v44, v48, 0, (uint64_t)v47);
          }
        }
        uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v53, (uint64_t)v63, 16);
      }
      while (v41);
    }

    id v6 = v50;
    id v4 = v51;
    uint64_t v14 = v52;
  }
  else
  {
    uint64_t v35 = BLDefaultLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DFE3000, v35, OS_LOG_TYPE_ERROR, "[DownloadQueue]: _notifyProgress: nil passed for downloadID", buf, 2u);
    }
  }
}

- (void)_postDownloadCompleteNotificationWithDictionary:(id)a3 failed:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v111 = *MEMORY[0x263EF8340];
  id v6 = a3;
  char v100 = 0;
  v85 = self;
  uint64_t v8 = objc_msgSend__downloadStatusFromDictionary_outParamNewlyTrackedDownload_(self, v7, (uint64_t)v6, (uint64_t)&v100);
  uint64_t v12 = objc_msgSend_downloadID(v8, v9, v10, v11);
  uint64_t v13 = BLDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v106 = (uint64_t)v12;
    __int16 v107 = 2048;
    uint64_t v108 = (uint64_t)v8;
    __int16 v109 = 2112;
    id v110 = v6;
    _os_log_impl(&dword_21DFE3000, v13, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue] Obtained download status %p for dictionary %@", buf, 0x20u);
  }

  if (v12)
  {
    id v83 = v6;
    os_unfair_lock_lock(&v85->_observersLock);
    uint64_t v17 = objc_msgSend_observers(v85, v14, v15, v16);
    uint64_t v21 = objc_msgSend_copy(v17, v18, v19, v20);

    os_unfair_lock_unlock(&v85->_observersLock);
    uint64_t v22 = BLDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = objc_msgSend_count(v21, v23, v24, v25);
      *(_DWORD *)buf = 138543618;
      uint64_t v106 = (uint64_t)v12;
      __int16 v107 = 2048;
      uint64_t v108 = v26;
      _os_log_impl(&dword_21DFE3000, v22, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: _postDownloadCompleteNotification: About to notify %lu observers", buf, 0x16u);
    }
    uint64_t v87 = (uint64_t)v12;

    uint64_t v86 = v8;
    if (v100)
    {
      BOOL v84 = v4;
      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      v82 = v21;
      id v30 = v21;
      uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v96, (uint64_t)v104, 16);
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v97;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v97 != v34) {
              objc_enumerationMutation(v30);
            }
            uint64_t v36 = *(void **)(*((void *)&v96 + 1) + 8 * i);
            if (objc_opt_respondsToSelector())
            {
              uint64_t v38 = BLDefaultLog();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                uint64_t v106 = v87;
                __int16 v107 = 2112;
                uint64_t v108 = (uint64_t)v36;
                _os_log_impl(&dword_21DFE3000, v38, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: download added, notifying observer %@ of downloadQueueDownloadsDidChange", buf, 0x16u);
              }

              uint64_t v42 = objc_msgSend_downloadQueue(v85, v39, v40, v41);
              objc_msgSend_downloadQueueDownloadsDidChange_(v36, v43, (uint64_t)v42, v44);
            }
          }
          uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v37, (uint64_t)&v96, (uint64_t)v104, 16);
        }
        while (v33);
      }

      BOOL v4 = v84;
      uint64_t v21 = v82;
    }
    if (v4)
    {
      uint64_t v45 = BLError(33, @"download failed", @"Download either failed or was cancelled by the user");
    }
    else
    {
      uint64_t v45 = 0;
    }
    uint64_t v47 = objc_msgSend_downloadQueue(v85, v27, v28, v29, v82);
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v48 = v21;
    uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v92, (uint64_t)v103, 16);
    if (v50)
    {
      uint64_t v54 = v50;
      uint64_t v55 = *(void *)v93;
      do
      {
        for (uint64_t j = 0; j != v54; ++j)
        {
          if (*(void *)v93 != v55) {
            objc_enumerationMutation(v48);
          }
          long long v57 = *(void **)(*((void *)&v92 + 1) + 8 * j);
          if ((!objc_msgSend_isAudiobook(v8, v51, v52, v53) || (sub_21DFFE6E0(v57) & 1) == 0)
            && (objc_opt_respondsToSelector() & 1) != 0)
          {
            long long v58 = BLDefaultLog();
            long long v59 = v58;
            if (v45)
            {
              if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543874;
                uint64_t v106 = v87;
                __int16 v107 = 2112;
                uint64_t v108 = (uint64_t)v57;
                __int16 v109 = 2112;
                id v110 = v45;
                long long v60 = v59;
                os_log_type_t v61 = OS_LOG_TYPE_ERROR;
                uint64_t v62 = "(dID=%{public}@) [DownloadQueue]: notifying observer %@ download completed with error:  %@";
                uint32_t v63 = 32;
                goto LABEL_37;
              }
            }
            else if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v106 = v87;
              __int16 v107 = 2112;
              uint64_t v108 = (uint64_t)v57;
              long long v60 = v59;
              os_log_type_t v61 = OS_LOG_TYPE_DEFAULT;
              uint64_t v62 = "(dID=%{public}@) [DownloadQueue]: notifying observer %@ download completed";
              uint32_t v63 = 22;
LABEL_37:
              _os_log_impl(&dword_21DFE3000, v60, v61, v62, buf, v63);
            }

            uint64_t v8 = v86;
            v102 = v86;
            long long v65 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v64, (uint64_t)&v102, 1);
            objc_msgSend_downloadQueue_downloadStates_didCompleteWithError_(v57, v66, (uint64_t)v47, (uint64_t)v65, v45);

            continue;
          }
        }
        uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v51, (uint64_t)&v92, (uint64_t)v103, 16);
      }
      while (v54);
    }

    os_unfair_lock_lock(&v85->_activeDownloadsLock);
    uint64_t v70 = objc_msgSend_activeDownloads(v85, v67, v68, v69);
    objc_msgSend_setObject_forKeyedSubscript_(v70, v71, 0, v87);

    os_unfair_lock_unlock(&v85->_activeDownloadsLock);
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    uint64_t v46 = v48;
    uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v72, (uint64_t)&v88, (uint64_t)v101, 16);
    if (v73)
    {
      uint64_t v74 = v73;
      uint64_t v75 = *(void *)v89;
      do
      {
        for (uint64_t k = 0; k != v74; ++k)
        {
          if (*(void *)v89 != v75) {
            objc_enumerationMutation(v46);
          }
          uint64_t v77 = *(void **)(*((void *)&v88 + 1) + 8 * k);
          if (objc_opt_respondsToSelector())
          {
            v79 = BLDefaultLog();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v106 = v87;
              __int16 v107 = 2112;
              uint64_t v108 = (uint64_t)v77;
              _os_log_impl(&dword_21DFE3000, v79, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: notifying observer %@ of downloadQueueDownloadsDidChange", buf, 0x16u);
            }

            objc_msgSend_downloadQueueDownloadsDidChange_(v77, v80, (uint64_t)v47, v81);
          }
        }
        uint64_t v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v78, (uint64_t)&v88, (uint64_t)v101, 16);
      }
      while (v74);
    }

    id v6 = v83;
    uint64_t v8 = v86;
    uint64_t v12 = (void *)v87;
  }
  else
  {
    uint64_t v46 = BLDefaultLog();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v106 = (uint64_t)v6;
      _os_log_impl(&dword_21DFE3000, v46, OS_LOG_TYPE_ERROR, "[DownloadQueue]: _postDownloadCompleteNotificationWithDictionary: failed to retrieve downloadID from downloadStatus %@", buf, 0xCu);
    }
  }
}

- (void)purchaseDidCompleteWithResponse:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = BLDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_msgSend_downloadID(v4, v6, v7, v8);
    *(_DWORD *)buf = 138543362;
    uint64_t v41 = v9;
    _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: purchaseDidCompleteWithResponse", buf, 0xCu);
  }
  os_unfair_lock_lock(&self->_observersLock);
  uint64_t v13 = objc_msgSend_observers(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_copy(v13, v14, v15, v16);

  os_unfair_lock_unlock(&self->_observersLock);
  uint64_t v21 = objc_msgSend_downloadQueue(self, v18, v19, v20);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v22 = v17;
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v36, (uint64_t)v44, 16);
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(v22);
        }
        uint64_t v28 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          id v30 = BLDefaultLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v34 = objc_msgSend_downloadID(v4, v31, v32, v33);
            *(_DWORD *)buf = 138543618;
            uint64_t v41 = v34;
            __int16 v42 = 2112;
            uint64_t v43 = v28;
            _os_log_impl(&dword_21DFE3000, v30, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: notifying observer %@ of purchaseDidComplete", buf, 0x16u);
          }
          objc_msgSend_downloadQueue_purchasedDidCompleteWithResponse_(v28, v35, (uint64_t)v21, (uint64_t)v4);
        }
      }
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v29, (uint64_t)&v36, (uint64_t)v44, 16);
    }
    while (v25);
  }
}

- (void)purchaseDidFailedWithResponse:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = BLDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_msgSend_downloadID(v4, v6, v7, v8);
    *(_DWORD *)buf = 138543362;
    uint64_t v41 = v9;
    _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: purchaseDidFailedWithResponse", buf, 0xCu);
  }
  os_unfair_lock_lock(&self->_observersLock);
  uint64_t v13 = objc_msgSend_observers(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_copy(v13, v14, v15, v16);

  os_unfair_lock_unlock(&self->_observersLock);
  uint64_t v21 = objc_msgSend_downloadQueue(self, v18, v19, v20);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v22 = v17;
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v36, (uint64_t)v44, 16);
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(v22);
        }
        uint64_t v28 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          id v30 = BLDefaultLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v34 = objc_msgSend_downloadID(v4, v31, v32, v33);
            *(_DWORD *)buf = 138543618;
            uint64_t v41 = v34;
            __int16 v42 = 2112;
            uint64_t v43 = v28;
            _os_log_impl(&dword_21DFE3000, v30, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: notifying observer %@ of purchaseDidFail", buf, 0x16u);
          }
          objc_msgSend_downloadQueue_purchasedDidFailWithResponse_(v28, v35, (uint64_t)v21, (uint64_t)v4);
        }
      }
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v29, (uint64_t)&v36, (uint64_t)v44, 16);
    }
    while (v25);
  }
}

- (id)_stringFromObject:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      id v4 = BUDynamicCast();
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      objc_super v5 = BUDynamicCast();
      id v4 = objc_msgSend_stringValue(v5, v6, v7, v8);

      goto LABEL_10;
    }
    uint64_t v9 = BLDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412546;
      id v13 = v3;
      __int16 v14 = 2112;
      id v15 = (id)objc_opt_class();
      id v10 = v15;
      _os_log_impl(&dword_21DFE3000, v9, OS_LOG_TYPE_ERROR, "The object [%@] of class: [%@] could not be converted to neither an NSString nor an NSNumber", (uint8_t *)&v12, 0x16u);
    }
  }
  id v4 = 0;
LABEL_10:

  return v4;
}

- (id)_numberFromObject:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      id v4 = BUDynamicCast();
      goto LABEL_8;
    }
    objc_super v5 = BLDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = v3;
      __int16 v10 = 2112;
      id v11 = (id)objc_opt_class();
      id v6 = v11;
      _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_ERROR, "The object [%@] of class: [%@] could not be converted to an NSNumber", (uint8_t *)&v8, 0x16u);
    }
  }
  id v4 = 0;
LABEL_8:

  return v4;
}

- (id)_dateFromObject:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      id v4 = BUDynamicCast();
      goto LABEL_8;
    }
    objc_super v5 = BLDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = v3;
      __int16 v10 = 2112;
      id v11 = (id)objc_opt_class();
      id v6 = v11;
      _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_ERROR, "The object [%@] of class: [%@] could not be converted to an NSDate", (uint8_t *)&v8, 0x16u);
    }
  }
  id v4 = 0;
LABEL_8:

  return v4;
}

- (id)_downloadStatusStoreID:(id)a3 storePlaylistID:(id)a4 orPermLink:(id)a5 downloadID:(id)a6 title:(id)a7 collectionTitle:(id)a8 assetKind:(id)a9 isPaused:(BOOL)a10
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  if (v19)
  {
    os_unfair_lock_lock(&self->_activeDownloadsLock);
    uint64_t v26 = objc_msgSend_activeDownloads(self, v23, v24, v25);
    uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v26, v27, (uint64_t)v19, v28);

    if (!v29)
    {
      uint64_t v29 = objc_opt_new();
      uint64_t v33 = objc_msgSend_activeDownloads(self, v30, v31, v32);
      objc_msgSend_setObject_forKeyedSubscript_(v33, v34, (uint64_t)v29, (uint64_t)v19);
    }
    os_unfair_lock_unlock(&self->_activeDownloadsLock);
    objc_msgSend_setDownloadID_(v29, v35, (uint64_t)v19, v36);
    if (v16)
    {
      if (objc_msgSend_longLongValue(v16, v37, v38, v39))
      {
        objc_msgSend_setStoreID_(v29, v40, (uint64_t)v16, v42);
        if (objc_msgSend_longLongValue(v17, v43, v44, v45)) {
          objc_msgSend_setStorePlaylistID_(v29, v40, (uint64_t)v17, v42);
        }
        goto LABEL_13;
      }
    }
    else
    {
      if (objc_msgSend_length(v18, v37, v38, v39))
      {
        objc_msgSend_setPermLink_(v29, v47, (uint64_t)v18, v48);
LABEL_13:
        char v49 = 0;
LABEL_18:
        if (objc_msgSend_length(v22, v40, v41, v42)) {
          objc_msgSend_setAssetKind_(v29, v51, (uint64_t)v22, v53);
        }
        if (v29) {
          char v54 = v49;
        }
        else {
          char v54 = 1;
        }
        if ((v54 & 1) == 0)
        {
          uint64_t isEqualToString = objc_msgSend_isEqualToString_(v22, v51, @"book", v53);
          objc_msgSend_setIsAudiobook_(v29, v56, isEqualToString, v57);
          if (a10)
          {
            objc_msgSend_setDownloadPhase_(v29, v58, 3, v59);
          }
          else
          {
            long long v60 = BLDefaultLog();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v77 = v19;
              _os_log_impl(&dword_21DFE3000, v60, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: setting percentComplete 5 percent", buf, 0xCu);
            }

            objc_msgSend_setPercentComplete_(v29, v61, (uint64_t)&unk_26CEE40A8, v62);
            objc_msgSend_setDownloadPhase_(v29, v63, 1, v64);
          }
          os_unfair_lock_lock(&self->_activeDownloadsLock);
          uint64_t v68 = objc_msgSend_activeDownloads(self, v65, v66, v67);
          objc_msgSend_setObject_forKeyedSubscript_(v68, v69, (uint64_t)v29, (uint64_t)v19);

          os_unfair_lock_unlock(&self->_activeDownloadsLock);
        }
        if (objc_msgSend_length(v20, v51, v52, v53)) {
          objc_msgSend_setTitle_(v29, v70, (uint64_t)v20, v72);
        }
        if (objc_msgSend_length(v21, v70, v71, v72)) {
          objc_msgSend_setCollectionTitle_(v29, v73, (uint64_t)v21, v74);
        }
        goto LABEL_34;
      }
      uint64_t v50 = BLDefaultLog();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFE3000, v50, OS_LOG_TYPE_ERROR, "[DownloadQueue]: we do not have enough information to post initial progress for this download", buf, 2u);
      }

      uint64_t v29 = 0;
    }
    char v49 = 1;
    goto LABEL_18;
  }
  uint64_t v46 = BLDefaultLog();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v46, OS_LOG_TYPE_ERROR, "[DownloadQueue]: nil downloadID passed to _downloadStatusSToreID:storePlaylistID:orPermLink:downloadID:isPaused:isAudiobook:", buf, 2u);
  }

  uint64_t v29 = 0;
LABEL_34:

  return v29;
}

- (void)didFailWithUserInfo:(id)a3
{
  id v4 = a3;
  objc_super v5 = BLDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEFAULT, "[DownloadQueue] didFailWithUserInfo:", v7, 2u);
  }

  objc_msgSend__postDownloadCompleteNotificationWithDictionary_failed_(self, v6, (uint64_t)v4, 1);
}

- (void)downloadCompleteWithUserInfo:(id)a3
{
  id v4 = a3;
  objc_super v5 = BLDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEFAULT, "[DownloadQueue] downloadCompleteWithUserInfo:", v7, 2u);
  }

  objc_msgSend__postDownloadCompleteNotificationWithDictionary_failed_(self, v6, (uint64_t)v4, 0);
}

- (void)progressWithUserInfo:(id)a3
{
  id v4 = a3;
  objc_super v5 = BLDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEFAULT, "[DownloadQueue] progressWithUserInfo", v8, 2u);
  }

  objc_msgSend__postDownloadProgressNotificationWithDictionary_(self, v6, (uint64_t)v4, v7);
}

- (void)purchaseFailedWithUserInfo:(id)a3
{
  id v4 = a3;
  objc_super v5 = BLDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEFAULT, "[DownloadQueue] purchaseFailedWithUserInfo", v11, 2u);
  }

  id v9 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v6, v7, v8);
  objc_msgSend_postNotificationName_object_userInfo_(v9, v10, @"com.apple.BLService.DownloadQueue.Purchase.Failed", (uint64_t)self, v4);
}

- (void)purchaseSucceededWithUserInfo:(id)a3
{
  id v4 = a3;
  objc_super v5 = BLDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEFAULT, "[DownloadQueue] purchaseSucceededWithUserInfo", v11, 2u);
  }

  id v9 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v6, v7, v8);
  objc_msgSend_postNotificationName_object_userInfo_(v9, v10, @"com.apple.BLService.DownloadQueue.Purchase.Succeeded", (uint64_t)self, v4);
}

- (void)setServiceProxy:(id)a3
{
}

- (void)setObservers:(id)a3
{
}

- (void)setActiveDownloads:(id)a3
{
}

- (BLDownloadQueueNonUI)downloadQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_downloadQueue);

  return (BLDownloadQueueNonUI *)WeakRetained;
}

- (void)setDownloadQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_downloadQueue);
  objc_storeStrong((id *)&self->_activeDownloads, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

@end