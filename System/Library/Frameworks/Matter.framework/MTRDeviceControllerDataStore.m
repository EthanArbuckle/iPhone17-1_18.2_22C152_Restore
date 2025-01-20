@interface MTRDeviceControllerDataStore
- (BOOL)_bulkStoreAttributeCacheValues:(id)a3;
- (BOOL)_deleteClusterDataForNodeID:(id)a3 endpointID:(id)a4 clusterID:(id)a5;
- (BOOL)_deleteClusterIndexForNodeID:(id)a3 endpointID:(id)a4;
- (BOOL)_deleteEndpointIndexForNodeID:(id)a3;
- (BOOL)_deleteNodeIndex;
- (BOOL)_removeAttributeCacheValueForKey:(id)a3;
- (BOOL)_removeEndpointFromEndpointIndex:(id)a3 forNodeID:(id)a4;
- (BOOL)_storeAttributeCacheValue:(id)a3 forKey:(id)a4;
- (BOOL)_storeClusterData:(id)a3 forNodeID:(id)a4 endpointID:(id)a5 clusterID:(id)a6;
- (BOOL)_storeClusterIndex:(id)a3 forNodeID:(id)a4 endpointID:(id)a5;
- (BOOL)_storeEndpointIndex:(id)a3 forNodeID:(id)a4;
- (BOOL)_storeNodeIndex:(id)a3;
- (ChipError)storeLastLocallyUsedNOC:(SEL)a3;
- (MTRDeviceControllerDataStore)initWithController:(id)a3 storageDelegate:(id)a4 storageDelegateQueue:(id)a5;
- (id)_clusterDataKeyForNodeID:(id)a3 endpointID:(id)a4 clusterID:(id)a5;
- (id)_clusterIndexKeyForNodeID:(id)a3 endpointID:(id)a4;
- (id)_deviceDataKeyForNodeID:(id)a3;
- (id)_endpointIndexKeyForNodeID:(id)a3;
- (id)_fetchAttributeCacheValueForKey:(id)a3 expectedClass:(Class)a4;
- (id)_fetchClusterDataForNodeID:(id)a3 endpointID:(id)a4 clusterID:(id)a5;
- (id)_fetchClusterIndexForNodeID:(id)a3 endpointID:(id)a4;
- (id)_fetchEndpointIndexForNodeID:(id)a3;
- (id)_fetchNodeIndex;
- (id)_findResumptionInfoWithKey:(id)a3;
- (id)_getClusterDataFromSecureLocalValues:(id)a3;
- (id)fetchLastLocallyUsedNOC;
- (id)findResumptionInfoByNodeID:(id)a3;
- (id)findResumptionInfoByResumptionID:(id)a3;
- (id)getStoredClusterDataForNodeID:(id)a3;
- (id)getStoredClusterDataForNodeID:(id)a3 endpointID:(id)a4 clusterID:(id)a5;
- (id)getStoredDeviceDataForNodeID:(id)a3;
- (void)_clearStoredClusterDataForNodeID:(id)a3;
- (void)_pruneEmptyStoredClusterDataBranches;
- (void)clearAllResumptionInfo;
- (void)clearAllStoredClusterData;
- (void)clearStoredClusterDataForNodeID:(id)a3;
- (void)clearStoredClusterDataForNodeID:(id)a3 endpointID:(id)a4;
- (void)clearStoredClusterDataForNodeID:(id)a3 endpointID:(id)a4 clusterID:(id)a5;
- (void)fetchAttributeDataForAllDevices:(id)a3;
- (void)removeAttributes:(id)a3 fromCluster:(id)a4 forNodeID:(id)a5;
- (void)storeClusterData:(id)a3 forNodeID:(id)a4;
- (void)storeDeviceData:(id)a3 forNodeID:(id)a4;
- (void)storeResumptionInfo:(id)a3;
@end

@implementation MTRDeviceControllerDataStore

- (MTRDeviceControllerDataStore)initWithController:(id)a3 storageDelegate:(id)a4 storageDelegateQueue:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v44.receiver = self;
  v44.super_class = (Class)MTRDeviceControllerDataStore;
  v11 = [(MTRDeviceControllerDataStore *)&v44 init];
  p_isa = (id *)&v11->super.isa;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_controller, v8);
    objc_storeStrong(p_isa + 1, a4);
    objc_storeStrong(p_isa + 2, a5);
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x3032000000;
    v41 = sub_244B19D98;
    v42 = sub_244B19DA8;
    id v43 = 0;
    v13 = p_isa[2];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_244B19DB0;
    block[3] = &unk_265199590;
    v37 = &v38;
    v14 = p_isa;
    v35 = v14;
    id v36 = v8;
    dispatch_sync(v13, block);
    if (v39[5])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v27 = sub_244CC8484(0, "NotSpecified");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2446BD000, v27, OS_LOG_TYPE_ERROR, "List of CASE resumption node IDs is not an array", buf, 2u);
        }

        if (sub_244CC4E58(1u)) {
          sub_244CC4DE0(0, 1);
        }
LABEL_25:
        v25 = 0;
        goto LABEL_26;
      }
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v15 = (id)v39[5];
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v30, v47, 16);
      if (v17)
      {
        uint64_t v18 = *(void *)v31;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v31 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            if (!sub_244B19E20(v20))
            {
              v28 = sub_244CC8484(0, "NotSpecified");
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v46 = v20;
                _os_log_impl(&dword_2446BD000, v28, OS_LOG_TYPE_ERROR, "Resumption node ID contains invalid value: %@", buf, 0xCu);
              }

              if (sub_244CC4E58(1u)) {
                sub_244CC4DE0(0, 1);
              }

              goto LABEL_25;
            }
          }
          uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v21, (uint64_t)&v30, v47, 16);
          if (v17) {
            continue;
          }
          break;
        }
      }

      id v24 = (id)objc_msgSend_mutableCopy((void *)v39[5], v22, v23);
    }
    else
    {
      id v24 = objc_alloc_init(MEMORY[0x263EFF980]);
    }
    id v26 = v14[4];
    v14[4] = v24;

    v25 = v14;
LABEL_26:

    _Block_object_dispose(&v38, 8);
    goto LABEL_27;
  }
  v25 = 0;
LABEL_27:

  return v25;
}

- (void)fetchAttributeDataForAllDevices:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_244B19D98;
  v19 = sub_244B19DA8;
  id v20 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    storageDelegateQueue = self->_storageDelegateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_244B1A01C;
    block[3] = &unk_265193E30;
    void block[4] = self;
    v14 = &v15;
    id v13 = WeakRetained;
    dispatch_sync(storageDelegateQueue, block);
    if (objc_msgSend_count((void *)v16[5], v8, v9))
    {
      v11 = objc_msgSend__getClusterDataFromSecureLocalValues_(self, v10, v16[5]);
      v4[2](v4, v11);
    }
  }

  _Block_object_dispose(&v15, 8);
}

- (id)findResumptionInfoByNodeID:(id)a3
{
  v4 = sub_244B1A104(a3);
  v6 = objc_msgSend__findResumptionInfoWithKey_(self, v5, (uint64_t)v4);

  return v6;
}

- (id)findResumptionInfoByResumptionID:(id)a3
{
  v4 = sub_244B1A1EC(a3, a2);
  v6 = objc_msgSend__findResumptionInfoWithKey_(self, v5, (uint64_t)v4);

  return v6;
}

- (void)storeResumptionInfo:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  if (WeakRetained)
  {
    id v8 = objc_msgSend_nodeID(v4, v5, v6);
    id v10 = objc_msgSend_findResumptionInfoByNodeID_(self, v9, (uint64_t)v8);

    storageDelegateQueue = self->_storageDelegateQueue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_244B1A3A0;
    v13[3] = &unk_2651995B8;
    id v14 = v10;
    uint64_t v15 = self;
    id v16 = WeakRetained;
    id v17 = v4;
    id v12 = v10;
    dispatch_sync(storageDelegateQueue, v13);
  }
}

- (void)clearAllResumptionInfo
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  if (WeakRetained)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = self->_nodesWithResumptionInfo;
    uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v17, v21, 16);
    if (v7)
    {
      uint64_t v8 = *(void *)v18;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v4);
          }
          id v10 = objc_msgSend_findResumptionInfoByNodeID_(self, v6, *(void *)(*((void *)&v17 + 1) + 8 * v9));
          if (v10)
          {
            storageDelegateQueue = self->_storageDelegateQueue;
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = sub_244B1A784;
            block[3] = &unk_2651995E0;
            void block[4] = self;
            id v15 = WeakRetained;
            id v16 = v10;
            dispatch_sync(storageDelegateQueue, block);
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v17, v21, 16);
      }
      while (v7);
    }

    objc_msgSend_removeAllObjects(self->_nodesWithResumptionInfo, v12, v13);
  }
}

- (ChipError)storeLastLocallyUsedNOC:(SEL)a3
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v16 = 0;
    long long v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    storageDelegateQueue = self->_storageDelegateQueue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_244B1A9C0;
    v12[3] = &unk_265199608;
    id v15 = &v16;
    v12[4] = self;
    id v13 = WeakRetained;
    id v14 = v6;
    dispatch_sync(storageDelegateQueue, v12);
    if (*((unsigned char *)v17 + 24)) {
      unsigned int v10 = 0;
    }
    else {
      unsigned int v10 = 159;
    }
    retstr->mError = v10;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDev"
                    "iceControllerDataStore.mm";
    retstr->mLine = 262;

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    retstr->mError = 159;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDev"
                    "iceControllerDataStore.mm";
    retstr->mLine = 252;
  }

  return result;
}

- (id)fetchLastLocallyUsedNOC
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = sub_244B19D98;
    id v15 = sub_244B19DA8;
    id v16 = 0;
    storageDelegateQueue = self->_storageDelegateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_244B1AB98;
    block[3] = &unk_265199590;
    unsigned int v10 = &v11;
    void block[4] = self;
    id v9 = WeakRetained;
    dispatch_sync(storageDelegateQueue, block);
    if (v12[5] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v6 = (id)v12[5];
    }
    else {
      id v6 = 0;
    }

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_findResumptionInfoWithKey:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  id v6 = WeakRetained;
  id v7 = 0;
  if (v4 && WeakRetained)
  {
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x3032000000;
    long long v17 = sub_244B19D98;
    uint64_t v18 = sub_244B19DA8;
    id v19 = 0;
    storageDelegateQueue = self->_storageDelegateQueue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = sub_244B1ADC8;
    v10[3] = &unk_265199608;
    uint64_t v13 = &v14;
    v10[4] = self;
    id v11 = WeakRetained;
    id v12 = v4;
    dispatch_sync(storageDelegateQueue, v10);
    if (v15[5] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v7 = (id)v15[5];
    }
    else {
      id v7 = 0;
    }

    _Block_object_dispose(&v14, 8);
  }

  return v7;
}

- (id)_fetchAttributeCacheValueForKey:(id)a3 expectedClass:(Class)a4
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  if (WeakRetained)
  {
    id v7 = (void *)MEMORY[0x245696770]();
    id v9 = objc_msgSend_controller_valueForKey_securityLevel_sharingType_(self->_storageDelegate, v8, (uint64_t)WeakRetained, v5, 0, 0);
    if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)_storeAttributeCacheValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  if (WeakRetained) {
    char v10 = objc_msgSend_controller_storeValue_forKey_securityLevel_sharingType_(self->_storageDelegate, v8, (uint64_t)WeakRetained, v6, v7, 0, 0);
  }
  else {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)_bulkStoreAttributeCacheValues:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  if (WeakRetained) {
    char v7 = objc_msgSend_controller_storeValues_securityLevel_sharingType_(self->_storageDelegate, v5, (uint64_t)WeakRetained, v4, 0, 0);
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)_removeAttributeCacheValueForKey:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  if (WeakRetained) {
    char v7 = objc_msgSend_controller_removeValueForKey_securityLevel_sharingType_(self->_storageDelegate, v5, (uint64_t)WeakRetained, v4, 0, 0);
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (id)_fetchNodeIndex
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  uint64_t v4 = objc_opt_class();

  return (id)objc_msgSend__fetchAttributeCacheValueForKey_expectedClass_(self, v3, @"attrCacheNodeIndex", v4);
}

- (BOOL)_storeNodeIndex:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  LOBYTE(self) = objc_msgSend__storeAttributeCacheValue_forKey_(self, v5, (uint64_t)v4, @"attrCacheNodeIndex");

  return (char)self;
}

- (BOOL)_deleteNodeIndex
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);

  return objc_msgSend__removeAttributeCacheValueForKey_(self, v3, @"attrCacheNodeIndex");
}

- (id)_endpointIndexKeyForNodeID:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_unsignedLongLongValue(v3, v4, v5);
  uint64_t v8 = objc_msgSend_stringByAppendingFormat_(@"attrCacheEndpointIndex", v7, @":0x%016llX", v6);

  return v8;
}

- (id)_fetchEndpointIndexForNodeID:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  if (v4)
  {
    uint64_t v6 = objc_msgSend__endpointIndexKeyForNodeID_(self, v5, (uint64_t)v4);
    uint64_t v7 = objc_opt_class();
    id v9 = objc_msgSend__fetchAttributeCacheValueForKey_expectedClass_(self, v8, (uint64_t)v6, v7);
  }
  else
  {
    char v10 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v13 = "-[MTRDeviceControllerDataStore _fetchEndpointIndexForNodeID:]";
      _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_ERROR, "%s: unexpected nil input", buf, 0xCu);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    id v9 = 0;
  }

  return v9;
}

- (BOOL)_storeEndpointIndex:(id)a3 forNodeID:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  if (v7)
  {
    id v9 = objc_msgSend__endpointIndexKeyForNodeID_(self, v8, (uint64_t)v7);
    char v11 = objc_msgSend__storeAttributeCacheValue_forKey_(self, v10, (uint64_t)v6, v9);
  }
  else
  {
    id v12 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v15 = "-[MTRDeviceControllerDataStore _storeEndpointIndex:forNodeID:]";
      _os_log_impl(&dword_2446BD000, v12, OS_LOG_TYPE_ERROR, "%s: unexpected nil input", buf, 0xCu);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    char v11 = 0;
  }

  return v11;
}

- (BOOL)_removeEndpointFromEndpointIndex:(id)a3 forNodeID:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  if (v6 && v7)
  {
    id v9 = objc_msgSend__fetchEndpointIndexForNodeID_(self, v8, (uint64_t)v7);
    id v12 = objc_msgSend_mutableCopy(v9, v10, v11);

    if (v12)
    {
      objc_msgSend_removeObject_(v12, v13, (uint64_t)v6);
      char v15 = objc_msgSend__storeEndpointIndex_forNodeID_(self, v14, (uint64_t)v12, v7);
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    uint64_t v16 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[MTRDeviceControllerDataStore _removeEndpointFromEndpointIndex:forNodeID:]";
      _os_log_impl(&dword_2446BD000, v16, OS_LOG_TYPE_ERROR, "%s: unexpected nil input", buf, 0xCu);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    char v15 = 0;
  }

  return v15;
}

- (BOOL)_deleteEndpointIndexForNodeID:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  if (v4)
  {
    id v6 = objc_msgSend__endpointIndexKeyForNodeID_(self, v5, (uint64_t)v4);
    char v8 = objc_msgSend__removeAttributeCacheValueForKey_(self, v7, (uint64_t)v6);
  }
  else
  {
    id v9 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v12 = "-[MTRDeviceControllerDataStore _deleteEndpointIndexForNodeID:]";
      _os_log_impl(&dword_2446BD000, v9, OS_LOG_TYPE_ERROR, "%s: unexpected nil input", buf, 0xCu);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    char v8 = 0;
  }

  return v8;
}

- (id)_clusterIndexKeyForNodeID:(id)a3 endpointID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v9 = objc_msgSend_unsignedLongLongValue(v5, v7, v8);
  unsigned int v12 = objc_msgSend_unsignedShortValue(v6, v10, v11);
  uint64_t v14 = objc_msgSend_stringByAppendingFormat_(@"attrCacheClusterIndex", v13, @":0x%016llX:0x%04X", v9, v12);

  return v14;
}

- (id)_fetchClusterIndexForNodeID:(id)a3 endpointID:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  if (v6 && v7)
  {
    uint64_t v9 = objc_msgSend__clusterIndexKeyForNodeID_endpointID_(self, v8, (uint64_t)v6, v7);
    uint64_t v10 = objc_opt_class();
    unsigned int v12 = objc_msgSend__fetchAttributeCacheValueForKey_expectedClass_(self, v11, (uint64_t)v9, v10);
  }
  else
  {
    uint64_t v13 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = "-[MTRDeviceControllerDataStore _fetchClusterIndexForNodeID:endpointID:]";
      _os_log_impl(&dword_2446BD000, v13, OS_LOG_TYPE_ERROR, "%s: unexpected nil input", buf, 0xCu);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    unsigned int v12 = 0;
  }

  return v12;
}

- (BOOL)_storeClusterIndex:(id)a3 forNodeID:(id)a4 endpointID:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  if (v9 && v10)
  {
    unsigned int v12 = objc_msgSend__clusterIndexKeyForNodeID_endpointID_(self, v11, (uint64_t)v9, v10);
    char v14 = objc_msgSend__storeAttributeCacheValue_forKey_(self, v13, (uint64_t)v8, v12);
  }
  else
  {
    char v15 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v18 = "-[MTRDeviceControllerDataStore _storeClusterIndex:forNodeID:endpointID:]";
      _os_log_impl(&dword_2446BD000, v15, OS_LOG_TYPE_ERROR, "%s: unexpected nil input", buf, 0xCu);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    char v14 = 0;
  }

  return v14;
}

- (BOOL)_deleteClusterIndexForNodeID:(id)a3 endpointID:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  if (v6 && v7)
  {
    id v9 = objc_msgSend__clusterIndexKeyForNodeID_endpointID_(self, v8, (uint64_t)v6, v7);
    char v11 = objc_msgSend__removeAttributeCacheValueForKey_(self, v10, (uint64_t)v9);
  }
  else
  {
    unsigned int v12 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      char v15 = "-[MTRDeviceControllerDataStore _deleteClusterIndexForNodeID:endpointID:]";
      _os_log_impl(&dword_2446BD000, v12, OS_LOG_TYPE_ERROR, "%s: unexpected nil input", buf, 0xCu);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    char v11 = 0;
  }

  return v11;
}

- (id)_clusterDataKeyForNodeID:(id)a3 endpointID:(id)a4 clusterID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_unsignedLongLongValue(v7, v10, v11);
  unsigned int v15 = objc_msgSend_unsignedShortValue(v8, v13, v14);
  uint64_t v18 = objc_msgSend_unsignedLongValue(v9, v16, v17);
  uint64_t v20 = objc_msgSend_stringByAppendingFormat_(@"attrCacheClusterData", v19, @":0x%016llX:0x%04X:0x%08lX", v12, v15, v18);

  return v20;
}

- (id)_fetchClusterDataForNodeID:(id)a3 endpointID:(id)a4 clusterID:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  if (v8 && v9 && v10)
  {
    uint64_t v12 = objc_msgSend__clusterDataKeyForNodeID_endpointID_clusterID_(self, v11, (uint64_t)v8, v9, v10);
    uint64_t v13 = objc_opt_class();
    unsigned int v15 = objc_msgSend__fetchAttributeCacheValueForKey_expectedClass_(self, v14, (uint64_t)v12, v13);
  }
  else
  {
    uint64_t v16 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v19 = "-[MTRDeviceControllerDataStore _fetchClusterDataForNodeID:endpointID:clusterID:]";
      _os_log_impl(&dword_2446BD000, v16, OS_LOG_TYPE_ERROR, "%s: unexpected nil input", buf, 0xCu);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    unsigned int v15 = 0;
  }

  return v15;
}

- (BOOL)_storeClusterData:(id)a3 forNodeID:(id)a4 endpointID:(id)a5 clusterID:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  if (v10 && v11 && v12 && v13)
  {
    unsigned int v15 = objc_msgSend__clusterDataKeyForNodeID_endpointID_clusterID_(self, v14, (uint64_t)v11, v12, v13);
    char v17 = objc_msgSend__storeAttributeCacheValue_forKey_(self, v16, (uint64_t)v10, v15);
  }
  else
  {
    uint64_t v18 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[MTRDeviceControllerDataStore _storeClusterData:forNodeID:endpointID:clusterID:]";
      _os_log_impl(&dword_2446BD000, v18, OS_LOG_TYPE_ERROR, "%s: unexpected nil input", buf, 0xCu);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    char v17 = 0;
  }

  return v17;
}

- (BOOL)_deleteClusterDataForNodeID:(id)a3 endpointID:(id)a4 clusterID:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  if (v8 && v9 && v10)
  {
    id v12 = objc_msgSend__clusterDataKeyForNodeID_endpointID_clusterID_(self, v11, (uint64_t)v8, v9, v10);
    char v14 = objc_msgSend__removeAttributeCacheValueForKey_(self, v13, (uint64_t)v12);
  }
  else
  {
    unsigned int v15 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v18 = "-[MTRDeviceControllerDataStore _deleteClusterDataForNodeID:endpointID:clusterID:]";
      _os_log_impl(&dword_2446BD000, v15, OS_LOG_TYPE_ERROR, "%s: unexpected nil input", buf, 0xCu);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    char v14 = 0;
  }

  return v14;
}

- (void)_pruneEmptyStoredClusterDataBranches
{
  uint64_t v130 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  id v5 = objc_msgSend__fetchNodeIndex(self, v3, v4);
  v99 = objc_msgSend_mutableCopy(v5, v6, v7);
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id obj = v5;
  uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v117, v129, 16);
  if (v97)
  {
    uint64_t v103 = 0;
    uint64_t v98 = *(void *)v118;
    do
    {
      for (uint64_t i = 0; i != v97; ++i)
      {
        if (*(void *)v118 != v98) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v117 + 1) + 8 * i);
        v96 = objc_msgSend__fetchEndpointIndexForNodeID_(self, v9, (uint64_t)v10, v93);
        v102 = objc_msgSend_mutableCopy(v96, v11, v12);
        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        id v104 = v96;
        uint64_t v107 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v13, (uint64_t)&v113, v128, 16);
        if (v107)
        {
          uint64_t v106 = *(void *)v114;
          do
          {
            for (uint64_t j = 0; j != v107; ++j)
            {
              if (*(void *)v114 != v106) {
                objc_enumerationMutation(v104);
              }
              unsigned int v15 = *(void **)(*((void *)&v113 + 1) + 8 * j);
              v105 = objc_msgSend__fetchClusterIndexForNodeID_endpointID_(self, v14, (uint64_t)v10, v15, v93, v94, v95);
              uint64_t v18 = objc_msgSend_mutableCopy(v105, v16, v17);
              long long v111 = 0u;
              long long v112 = 0u;
              long long v109 = 0u;
              long long v110 = 0u;
              id v19 = v105;
              uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v109, v127, 16);
              if (v22)
              {
                uint64_t v23 = *(void *)v110;
                do
                {
                  for (uint64_t k = 0; k != v22; ++k)
                  {
                    if (*(void *)v110 != v23) {
                      objc_enumerationMutation(v19);
                    }
                    uint64_t v25 = *(void *)(*((void *)&v109 + 1) + 8 * k);
                    v27 = objc_msgSend__fetchClusterDataForNodeID_endpointID_clusterID_(self, v21, (uint64_t)v10, v15, v25);
                    if (!v27) {
                      objc_msgSend_removeObject_(v18, v26, v25);
                    }
                  }
                  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v21, (uint64_t)&v109, v127, 16);
                }
                while (v22);
              }

              uint64_t v30 = objc_msgSend_count(v19, v28, v29);
              if (v30 != objc_msgSend_count(v18, v31, v32))
              {
                if (objc_msgSend_count(v18, v33, v34))
                {
                  char v36 = objc_msgSend__storeClusterIndex_forNodeID_endpointID_(self, v35, (uint64_t)v18, v10, v15);
                }
                else
                {
                  objc_msgSend_removeObject_(v102, v35, (uint64_t)v15);
                  char v36 = objc_msgSend__deleteClusterIndexForNodeID_endpointID_(self, v37, (uint64_t)v10, v15);
                }
                if ((v36 & 1) == 0)
                {
                  uint64_t v38 = sub_244CC8484(0, "NotSpecified");
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v41 = objc_msgSend_count(v18, v39, v40);
                    uint64_t v44 = objc_msgSend_unsignedLongLongValue(v10, v42, v43);
                    int v47 = objc_msgSend_unsignedShortValue(v15, v45, v46);
                    *(_DWORD *)buf = 134218496;
                    uint64_t v122 = v41;
                    __int16 v123 = 2048;
                    uint64_t v124 = v44;
                    __int16 v125 = 1024;
                    int v126 = v47;
                    _os_log_impl(&dword_2446BD000, v38, OS_LOG_TYPE_ERROR, "Store failed in _pruneEmptyStoredClusterDataBranches for clusterIndex (%lu) @ node 0x%016llX endpoint %u", buf, 0x1Cu);
                  }

                  ++v103;
                  if (sub_244CC4E58(1u))
                  {
                    uint64_t v50 = objc_msgSend_count(v18, v48, v49);
                    uint64_t v94 = objc_msgSend_unsignedLongLongValue(v10, v51, v52);
                    uint64_t v95 = objc_msgSend_unsignedShortValue(v15, v53, v54);
                    uint64_t v93 = v50;
                    sub_244CC4DE0(0, 1);
                  }
                }
              }
            }
            uint64_t v107 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v14, (uint64_t)&v113, v128, 16);
          }
          while (v107);
        }

        uint64_t v57 = objc_msgSend_count(v104, v55, v56);
        if (v57 != objc_msgSend_count(v102, v58, v59))
        {
          if (objc_msgSend_count(v102, v60, v61))
          {
            char v63 = objc_msgSend__storeEndpointIndex_forNodeID_(self, v62, (uint64_t)v102, v10);
          }
          else
          {
            objc_msgSend_removeObject_(v99, v62, (uint64_t)v10);
            char v63 = objc_msgSend__deleteEndpointIndexForNodeID_(self, v64, (uint64_t)v10);
          }
          if ((v63 & 1) == 0)
          {
            v65 = sub_244CC8484(0, "NotSpecified");
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
            {
              uint64_t v68 = objc_msgSend_count(v102, v66, v67);
              uint64_t v71 = objc_msgSend_unsignedLongLongValue(v10, v69, v70);
              *(_DWORD *)buf = 134218240;
              uint64_t v122 = v68;
              __int16 v123 = 2048;
              uint64_t v124 = v71;
              _os_log_impl(&dword_2446BD000, v65, OS_LOG_TYPE_ERROR, "Store failed in _pruneEmptyStoredClusterDataBranches for endpointIndex (%lu) @ node 0x%016llX", buf, 0x16u);
            }

            ++v103;
            if (sub_244CC4E58(1u))
            {
              uint64_t v93 = objc_msgSend_count(v102, v72, v73);
              uint64_t v94 = objc_msgSend_unsignedLongLongValue(v10, v74, v75);
              sub_244CC4DE0(0, 1);
            }
          }
        }
      }
      uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v117, v129, 16);
    }
    while (v97);
  }
  else
  {
    uint64_t v103 = 0;
  }

  uint64_t v78 = objc_msgSend_count(obj, v76, v77);
  if (v78 != objc_msgSend_count(v99, v79, v80))
  {
    char v85 = objc_msgSend_count(v99, v81, v82)
        ? objc_msgSend__storeNodeIndex_(self, v83, (uint64_t)v99)
        : objc_msgSend__deleteNodeIndex(self, v83, v84);
    if ((v85 & 1) == 0)
    {
      v86 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      {
        uint64_t v89 = objc_msgSend_count(v99, v87, v88);
        *(_DWORD *)buf = 134217984;
        uint64_t v122 = v89;
        _os_log_impl(&dword_2446BD000, v86, OS_LOG_TYPE_ERROR, "Store failed in _pruneEmptyStoredClusterDataBranches for nodeIndex (%lu)", buf, 0xCu);
      }

      ++v103;
      if (sub_244CC4E58(1u))
      {
        objc_msgSend_count(v99, v90, v91);
        sub_244CC4DE0(0, 1);
      }
    }
  }
  if (v103)
  {
    v92 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v122 = v103;
      _os_log_impl(&dword_2446BD000, v92, OS_LOG_TYPE_ERROR, "Store failed in _pruneEmptyStoredClusterDataBranches: failure count %lu", buf, 0xCu);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
  }
}

- (void)_clearStoredClusterDataForNodeID:(id)a3
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  uint64_t v59 = objc_msgSend__fetchEndpointIndexForNodeID_(self, v5, (uint64_t)v4);
  uint64_t v60 = objc_msgSend_count(v59, v6, v7);
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id obj = v59;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v75, v86, 16);
  if (v9)
  {
    uint64_t v70 = 0;
    uint64_t v67 = 0;
    uint64_t v63 = *(void *)v76;
    uint64_t v64 = 0;
    do
    {
      uint64_t v68 = 0;
      uint64_t v65 = v9;
      do
      {
        if (*(void *)v76 != v63) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v75 + 1) + 8 * v68);
        v62 = objc_msgSend__fetchClusterIndexForNodeID_endpointID_(self, v10, (uint64_t)v4, v11, v56, v57, v58);
        uint64_t v66 = objc_msgSend_count(v62, v12, v13);
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id v69 = v62;
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v14, (uint64_t)&v71, v85, 16);
        if (v16)
        {
          uint64_t v17 = *(void *)v72;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v72 != v17) {
                objc_enumerationMutation(v69);
              }
              id v19 = *(void **)(*((void *)&v71 + 1) + 8 * i);
              if (objc_msgSend__deleteClusterDataForNodeID_endpointID_clusterID_(self, v15, (uint64_t)v4, v11, v19, v56))
              {
                ++v70;
              }
              else
              {
                uint64_t v20 = sub_244CC8484(0, "NotSpecified");
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v23 = objc_msgSend_unsignedLongLongValue(v4, v21, v22);
                  int v26 = objc_msgSend_unsignedShortValue(v11, v24, v25);
                  uint64_t v29 = objc_msgSend_unsignedLongValue(v19, v27, v28);
                  *(_DWORD *)buf = 134218496;
                  uint64_t v80 = v23;
                  __int16 v81 = 1024;
                  *(_DWORD *)uint64_t v82 = v26;
                  *(_WORD *)&v82[4] = 2048;
                  *(void *)&v82[6] = v29;
                  _os_log_impl(&dword_2446BD000, v20, OS_LOG_TYPE_ERROR, "Delete failed for clusterData @ node 0x%016llX endpoint %u cluster 0x%08lX", buf, 0x1Cu);
                }

                if (sub_244CC4E58(1u))
                {
                  uint64_t v31 = objc_msgSend_unsignedLongLongValue(v4, v15, v30);
                  uint64_t v57 = objc_msgSend_unsignedShortValue(v11, v32, v33);
                  uint64_t v58 = objc_msgSend_unsignedLongValue(v19, v34, v35);
                  uint64_t v56 = v31;
                  sub_244CC4DE0(0, 1);
                }
              }
            }
            uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v15, (uint64_t)&v71, v85, 16);
          }
          while (v16);
        }

        if (objc_msgSend__deleteClusterIndexForNodeID_endpointID_(self, v36, (uint64_t)v4, v11))
        {
          ++v64;
        }
        else
        {
          v37 = sub_244CC8484(0, "NotSpecified");
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            uint64_t v40 = objc_msgSend_unsignedLongLongValue(v4, v38, v39);
            int v43 = objc_msgSend_unsignedShortValue(v11, v41, v42);
            *(_DWORD *)buf = 134218240;
            uint64_t v80 = v40;
            __int16 v81 = 1024;
            *(_DWORD *)uint64_t v82 = v43;
            _os_log_impl(&dword_2446BD000, v37, OS_LOG_TYPE_ERROR, "Delete failed for clusterIndex @ node 0x%016llX endpoint %u", buf, 0x12u);
          }

          if (sub_244CC4E58(1u))
          {
            uint64_t v56 = objc_msgSend_unsignedLongLongValue(v4, v44, v45);
            uint64_t v57 = objc_msgSend_unsignedShortValue(v11, v46, v47);
            sub_244CC4DE0(0, 1);
          }
        }

        v67 += v66;
        ++v68;
      }
      while (v68 != v65);
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v75, v86, 16);
    }
    while (v9);
  }
  else
  {
    uint64_t v70 = 0;
    uint64_t v64 = 0;
    uint64_t v67 = 0;
  }

  if ((objc_msgSend__deleteEndpointIndexForNodeID_(self, v48, (uint64_t)v4) & 1) == 0)
  {
    uint64_t v49 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      uint64_t v52 = objc_msgSend_unsignedLongLongValue(v4, v50, v51);
      *(_DWORD *)buf = 134217984;
      uint64_t v80 = v52;
      _os_log_impl(&dword_2446BD000, v49, OS_LOG_TYPE_ERROR, "Delete failed for endpointIndex @ node 0x%016llX", buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      objc_msgSend_unsignedLongLongValue(v4, v53, v54);
      sub_244CC4DE0(0, 1);
    }
  }
  v55 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    uint64_t v80 = v64;
    __int16 v81 = 2048;
    *(void *)uint64_t v82 = v60;
    *(_WORD *)&v82[8] = 2048;
    *(void *)&v82[10] = v70;
    __int16 v83 = 2048;
    uint64_t v84 = v67;
    _os_log_impl(&dword_2446BD000, v55, OS_LOG_TYPE_DEFAULT, "clearStoredClusterDataForNodeID: deleted endpoints %lu/%lu clusters %lu/%lu", buf, 0x2Au);
  }

  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(0, 2);
  }
}

- (void)clearStoredClusterDataForNodeID:(id)a3
{
  id v4 = a3;
  storageDelegateQueue = self->_storageDelegateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B1D2A0;
  v7[3] = &unk_265193DC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(storageDelegateQueue, v7);
}

- (void)clearStoredClusterDataForNodeID:(id)a3 endpointID:(id)a4 clusterID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  storageDelegateQueue = self->_storageDelegateQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_244B1D520;
  v15[3] = &unk_2651995B8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(storageDelegateQueue, v15);
}

- (void)clearStoredClusterDataForNodeID:(id)a3 endpointID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  storageDelegateQueue = self->_storageDelegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B1D984;
  block[3] = &unk_2651995E0;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(storageDelegateQueue, block);
}

- (void)removeAttributes:(id)a3 fromCluster:(id)a4 forNodeID:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v13 = objc_msgSend_endpoint(v9, v11, v12);
  id v16 = objc_msgSend_cluster(v9, v14, v15);
  id v18 = objc_msgSend_getStoredClusterDataForNodeID_endpointID_clusterID_(self, v17, (uint64_t)v10, v13, v16);

  if (v18)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v19 = v8;
    uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v31, v35, 16);
    if (v22)
    {
      uint64_t v23 = *(void *)v32;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v32 != v23) {
            objc_enumerationMutation(v19);
          }
          objc_msgSend_removeValueForAttribute_(v18, v21, *(void *)(*((void *)&v31 + 1) + 8 * v24++));
        }
        while (v22 != v24);
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v21, (uint64_t)&v31, v35, 16);
      }
      while (v22);
    }

    storageDelegateQueue = self->_storageDelegateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_244B1E0A8;
    block[3] = &unk_265193F10;
    void block[4] = self;
    id v27 = v18;
    id v28 = v10;
    id v29 = v9;
    id v30 = v19;
    dispatch_async(storageDelegateQueue, block);
  }
}

- (void)clearAllStoredClusterData
{
  storageDelegateQueue = self->_storageDelegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B1E44C;
  block[3] = &unk_265193E58;
  void block[4] = self;
  dispatch_async(storageDelegateQueue, block);
}

- (id)getStoredClusterDataForNodeID:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = sub_244B19D98;
    id v16 = sub_244B19DA8;
    id v17 = 0;
    storageDelegateQueue = self->_storageDelegateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_244B1E7DC;
    block[3] = &unk_265199630;
    void block[4] = self;
    id v11 = v4;
    p_long long buf = &buf;
    dispatch_sync(storageDelegateQueue, block);
    id v7 = *(id *)(*((void *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v8 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[MTRDeviceControllerDataStore getStoredClusterDataForNodeID:]";
      _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_ERROR, "%s: unexpected nil input", (uint8_t *)&buf, 0xCu);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)getStoredClusterDataForNodeID:(id)a3 endpointID:(id)a4 clusterID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = sub_244B19D98;
  int v26 = sub_244B19DA8;
  id v27 = 0;
  storageDelegateQueue = self->_storageDelegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B1EEC8;
  block[3] = &unk_265199658;
  id v20 = v10;
  v21 = &v22;
  void block[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(storageDelegateQueue, block);
  id v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);

  return v15;
}

- (id)_getClusterDataFromSecureLocalValues:(id)a3
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v50 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v39 = objc_msgSend_objectForKeyedSubscript_(v50, v3, @"attrCacheNodeIndex");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id obj = v39;
      uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v59, v65, 16);
      if (v41)
      {
        v37 = 0;
        uint64_t v40 = *(void *)v60;
        do
        {
          for (uint64_t i = 0; i != v41; ++i)
          {
            if (*(void *)v60 != v40) {
              objc_enumerationMutation(obj);
            }
            uint64_t v5 = *(void *)(*((void *)&v59 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v7 = objc_msgSend__endpointIndexKeyForNodeID_(self, v6, v5);
              uint64_t v42 = objc_msgSend_objectForKeyedSubscript_(v50, v8, (uint64_t)v7);

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v57 = 0u;
                long long v58 = 0u;
                long long v55 = 0u;
                long long v56 = 0u;
                id v44 = v42;
                uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v9, (uint64_t)&v55, v64, 16);
                if (v10)
                {
                  id v11 = 0;
                  uint64_t v45 = *(void *)v56;
                  uint64_t v46 = v10;
                  do
                  {
                    for (uint64_t j = 0; j != v46; ++j)
                    {
                      if (*(void *)v56 != v45) {
                        objc_enumerationMutation(v44);
                      }
                      uint64_t v12 = *(void *)(*((void *)&v55 + 1) + 8 * j);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v14 = objc_msgSend__clusterIndexKeyForNodeID_endpointID_(self, v13, v5, v12);
                        uint64_t v47 = objc_msgSend_objectForKeyedSubscript_(v50, v15, (uint64_t)v14);

                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          long long v53 = 0u;
                          long long v54 = 0u;
                          long long v51 = 0u;
                          long long v52 = 0u;
                          id v16 = v47;
                          uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v51, v63, 16);
                          if (v18)
                          {
                            uint64_t v19 = *(void *)v52;
                            do
                            {
                              for (uint64_t k = 0; k != v18; ++k)
                              {
                                if (*(void *)v52 != v19) {
                                  objc_enumerationMutation(v16);
                                }
                                uint64_t v21 = *(void *)(*((void *)&v51 + 1) + 8 * k);
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  uint64_t v23 = objc_msgSend__clusterDataKeyForNodeID_endpointID_clusterID_(self, v22, v5, v12, v21);
                                  uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v50, v24, (uint64_t)v23);

                                  if (v25)
                                  {
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v29 = objc_msgSend_clusterPathWithEndpointID_clusterID_(MTRClusterPath, v26, v12, v21);
                                      if (!v11)
                                      {
                                        id v11 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v27, v28);
                                      }
                                      objc_msgSend_setObject_forKeyedSubscript_(v11, v27, (uint64_t)v25, v29, v37);
                                    }
                                  }
                                }
                              }
                              uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v22, (uint64_t)&v51, v63, 16);
                            }
                            while (v18);
                          }
                        }
                      }
                    }
                    uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v13, (uint64_t)&v55, v64, 16);
                  }
                  while (v46);
                }
                else
                {
                  id v11 = 0;
                }

                if (objc_msgSend_count(v11, v30, v31))
                {
                  long long v34 = v37;
                  if (!v37)
                  {
                    long long v34 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v32, v33, 0);
                  }
                  objc_msgSend_setObject_forKeyedSubscript_(v34, v32, (uint64_t)v11, v5, v34);
                }
              }
              else
              {
                id v11 = 0;
              }
            }
          }
          uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v59, v65, 16);
        }
        while (v41);
      }
      else
      {
        v37 = 0;
      }

      id v35 = v37;
    }
    else
    {
      id v35 = 0;
    }
  }
  else
  {
    id v35 = 0;
  }

  return v35;
}

- (void)storeClusterData:(id)a3 forNodeID:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v9 = a4;
  if (v9)
  {
    if (objc_msgSend_count(v6, v7, v8))
    {
      storageDelegateQueue = self->_storageDelegateQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_244B1F730;
      block[3] = &unk_2651995E0;
      void block[4] = self;
      id v14 = v6;
      id v15 = v9;
      dispatch_async(storageDelegateQueue, block);

      goto LABEL_12;
    }
    uint64_t v12 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      id v17 = "-[MTRDeviceControllerDataStore storeClusterData:forNodeID:]";
      _os_log_impl(&dword_2446BD000, v12, OS_LOG_TYPE_ERROR, "%s: nothing to store", buf, 0xCu);
    }

    if (sub_244CC4E58(1u)) {
LABEL_11:
    }
      sub_244CC4DE0(0, 1);
  }
  else
  {
    id v11 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      id v17 = "-[MTRDeviceControllerDataStore storeClusterData:forNodeID:]";
      _os_log_impl(&dword_2446BD000, v11, OS_LOG_TYPE_ERROR, "%s: unexpected nil input", buf, 0xCu);
    }

    if (sub_244CC4E58(1u)) {
      goto LABEL_11;
    }
  }
LABEL_12:
}

- (id)_deviceDataKeyForNodeID:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_unsignedLongLongValue(v3, v4, v5);
  uint64_t v8 = objc_msgSend_stringByAppendingFormat_(@"deviceData", v7, @":0x%016llX", v6);

  return v8;
}

- (id)getStoredDeviceDataForNodeID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_244B19D98;
  id v16 = sub_244B19DA8;
  id v17 = 0;
  storageDelegateQueue = self->_storageDelegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B20830;
  block[3] = &unk_265199630;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(storageDelegateQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)storeDeviceData:(id)a3 forNodeID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  storageDelegateQueue = self->_storageDelegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B20AF8;
  block[3] = &unk_2651995E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(storageDelegateQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodesWithResumptionInfo, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_storageDelegateQueue, 0);

  objc_storeStrong((id *)&self->_storageDelegate, 0);
}

@end