@interface MTRServerEndpoint
+ (id)rootNodeEndpoint;
- (BOOL)addServerCluster:(id)a3;
- (BOOL)associateWithController:(id)a3;
- (MTRServerEndpoint)initWithEndpointID:(id)a3 deviceTypes:(id)a4;
- (NSArray)accessGrants;
- (NSArray)deviceTypes;
- (NSArray)serverClusters;
- (NSNumber)endpointID;
- (NSSet)matterAccessGrants;
- (id).cxx_construct;
- (id)description;
- (id)matterAccessGrantsForCluster:(id)a3;
- (void)addAccessGrant:(id)a3;
- (void)invalidate;
- (void)registerMatterEndpoint;
- (void)removeAccessGrant:(id)a3;
- (void)unregisterMatterEndpoint;
@end

@implementation MTRServerEndpoint

- (MTRServerEndpoint)initWithEndpointID:(id)a3 deviceTypes:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v10 = objc_msgSend_unsignedLongLongValue(v6, v8, v9);
  unint64_t v13 = v10;
  if (v10 >= 0x10000)
  {
    v15 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v24 = v13;
      _os_log_impl(&dword_2446BD000, v15, OS_LOG_TYPE_ERROR, "MTRServerEndpoint provided too-large endpoint ID: 0x%llx", buf, 0xCu);
    }

    if (!sub_244CC4E58(1u)) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (!v10)
  {
    v16 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = 0;
      _os_log_impl(&dword_2446BD000, v16, OS_LOG_TYPE_ERROR, "MTRServerEndpoint provided invalid endpoint ID: 0x%x", buf, 8u);
    }

    if (!sub_244CC4E58(1u)) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (v10 == 0xFFFF)
  {
    v14 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = 0xFFFF;
      _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_ERROR, "MTRServerEndpoint provided invalid endpoint ID: 0x%x", buf, 8u);
    }

    if (!sub_244CC4E58(1u)) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (objc_msgSend_count(v7, v11, v12))
  {
    v21 = objc_msgSend_set(MEMORY[0x263EFFA08], v19, v20);
    self = sub_244C9BAE0(self, v6, v7, v21, MEMORY[0x263EFFA68]);

    v17 = self;
    goto LABEL_17;
  }
  v22 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2446BD000, v22, OS_LOG_TYPE_ERROR, "MTRServerEndpoint needs a non-empty list of device types", buf, 2u);
  }

  if (sub_244CC4E58(1u)) {
LABEL_15:
  }
    sub_244CC4DE0(0, 1);
LABEL_16:
  v17 = 0;
LABEL_17:

  return v17;
}

+ (id)rootNodeEndpoint
{
  v2 = [MTRServerEndpoint alloc];
  v5 = objc_msgSend_set(MEMORY[0x263EFFA08], v3, v4);
  id v6 = sub_244C9BAE0(v2, &unk_26F9CD7B0, MEMORY[0x263EFFA68], v5, MEMORY[0x263EFFA68]);

  return v6;
}

- (void)addAccessGrant:(id)a3
{
  id v5 = a3;
  objc_msgSend_addObject_(self->_accessGrants, v4, (uint64_t)v5);
  sub_244C9BE78((uint64_t)self);
}

- (void)removeAccessGrant:(id)a3
{
  id v5 = a3;
  objc_msgSend_removeObject_(self->_accessGrants, v4, (uint64_t)v5);
  sub_244C9BE78((uint64_t)self);
}

- (BOOL)addServerCluster:(id)a3
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceController);
  if (!WeakRetained)
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    unint64_t v13 = self->_serverClusters;
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v60, v68, 16);
    if (v17)
    {
      uint64_t v18 = *(void *)v61;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v61 != v18) {
            objc_enumerationMutation(v13);
          }
          uint64_t v20 = objc_msgSend_clusterID(*(void **)(*((void *)&v60 + 1) + 8 * i), v15, v16);
          v23 = objc_msgSend_clusterID(v4, v21, v22);
          int isEqual = objc_msgSend_isEqual_(v20, v24, (uint64_t)v23);

          if (isEqual)
          {
            v31 = sub_244CC8484(0, "NotSpecified");
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              v34 = objc_msgSend_clusterID(v4, v32, v33);
              unsigned __int16 v37 = objc_msgSend_unsignedLongLongValue(v34, v35, v36) >> 16;
              v40 = objc_msgSend_clusterID(v4, v38, v39);
              unsigned __int16 v43 = objc_msgSend_unsignedLongLongValue(v40, v41, v42);
              uint64_t v46 = objc_msgSend_unsignedLongLongValue(self->_endpointID, v44, v45);
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)v65 = v37;
              *(_WORD *)&v65[4] = 1024;
              *(_DWORD *)&v65[6] = v43;
              __int16 v66 = 2048;
              uint64_t v67 = v46;
              _os_log_impl(&dword_2446BD000, v31, OS_LOG_TYPE_ERROR, "Cannot add second cluster with ID 0x%04X_%04X on endpoint %llu", buf, 0x18u);
            }
            if (sub_244CC4E58(1u))
            {
              v49 = objc_msgSend_clusterID(v4, v47, v48);
              objc_msgSend_unsignedLongLongValue(v49, v50, v51);
              v54 = objc_msgSend_clusterID(v4, v52, v53);
              objc_msgSend_unsignedLongLongValue(v54, v55, v56);
              objc_msgSend_unsignedLongLongValue(self->_endpointID, v57, v58);
              sub_244CC4DE0(0, 1);
            }
            goto LABEL_21;
          }
        }
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v60, v68, 16);
        if (v17) {
          continue;
        }
        break;
      }
    }

    unsigned __int16 v28 = objc_msgSend_unsignedLongLongValue(self->_endpointID, v26, v27);
    if (objc_msgSend_addToEndpoint_(v4, v29, v28))
    {
      objc_msgSend_addObject_(self->_serverClusters, v30, (uint64_t)v4);
      BOOL v12 = 1;
      goto LABEL_22;
    }
LABEL_21:
    BOOL v12 = 0;
    goto LABEL_22;
  }
  id v6 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = objc_msgSend_unsignedLongLongValue(self->_endpointID, v7, v8);
    *(_DWORD *)buf = 134217984;
    *(void *)v65 = v9;
    _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_ERROR, "Cannot add cluster on endpoint %llu which is already in use", buf, 0xCu);
  }

  if (!sub_244CC4E58(1u)) {
    goto LABEL_21;
  }
  objc_msgSend_unsignedLongLongValue(self->_endpointID, v10, v11);
  sub_244CC4DE0(0, 1);
  BOOL v12 = 0;
LABEL_22:

  return v12;
}

- (BOOL)associateWithController:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceController);
  if (WeakRetained)
  {
    id v6 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_msgSend_uniqueIdentifier(v4, v7, v8);
      BOOL v12 = objc_msgSend_uniqueIdentifier(WeakRetained, v10, v11);
      *(_DWORD *)buf = 138412546;
      unint64_t v24 = v9;
      __int16 v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_ERROR, "Cannot associate MTRServerEndpoint with controller %@; already associated with controller %@",
        buf,
        0x16u);
    }
    if (sub_244CC4E58(1u))
    {
      v15 = objc_msgSend_uniqueIdentifier(v4, v13, v14);
      uint64_t v22 = objc_msgSend_uniqueIdentifier(WeakRetained, v16, v17);
      sub_244CC4DE0(0, 1);
    }
    goto LABEL_9;
  }
  if ((sub_244C9C604((uint64_t)self, v4) & 1) == 0)
  {
    objc_msgSend_invalidate(self, v18, v19);
LABEL_9:
    BOOL v20 = 0;
    goto LABEL_10;
  }
  BOOL v20 = 1;
LABEL_10:

  return v20;
}

- (void)registerMatterEndpoint
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/ServerEndpoint/MTRServerEndpoint.mm", 322);
  for (unsigned __int16 i = 0; ; ++i)
  {
    unsigned int v4 = i;
    if (sub_2448565A0(i) == 0xFFFF) {
      break;
    }
    if (v4 >= 0xFD)
    {
      id v7 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_ERROR, "We somehow ran out of endpoint slots.", buf, 2u);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
      return;
    }
  }
  *(void *)buf = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  unsigned __int16 v8 = objc_msgSend_unsignedLongLongValue(self->_endpointID, v5, v6);
  sub_2446D0450(v27, (uint64_t)self->_matterDataVersions.__ptr_.__value_, self->_matterEndpointMetadata.clusterCount);
  value = self->_matterDeviceTypes.__ptr_.__value_;
  uint64_t v12 = objc_msgSend_count(self->_deviceTypes, v10, v11);
  sub_2446D0450(v25, (uint64_t)value, v12);
  sub_2446D0450(v26, v25[0], v25[1]);
  sub_2448558D0(i, v8, (unsigned __int8 *)&self->_matterEndpointMetadata, (uint64_t)v27, v26[0], v26[1], 0xFFFF, (uint64_t)buf);
  if (*(_DWORD *)buf)
  {
    unint64_t v13 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_2446BD000, v13, OS_LOG_TYPE_ERROR, "Unexpected failure to define our Matter endpoint", v27, 2u);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
  }
  self->_endpointIndex.var0.__val_ = i;
  self->_endpointIndex.__engaged_ = 1;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v14 = self->_serverClusters;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v21, v31, 16);
  if (v18)
  {
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend_registerMatterCluster(*(void **)(*((void *)&v21 + 1) + 8 * j), v16, v17, (void)v21);
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v16, (uint64_t)&v21, v31, 16);
    }
    while (v18);
  }
}

- (void)unregisterMatterEndpoint
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/ServerEndpoint/MTRServerEndpoint.mm", 360);
  if (self->_endpointIndex.__engaged_)
  {
    sub_244855C60(self->_endpointIndex.var0.__val_);
    if (self->_endpointIndex.__engaged_) {
      self->_endpointIndex.__engaged_ = 0;
    }
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_serverClusters;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v10, v14, 16);
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend_unregisterMatterCluster(*(void **)(*((void *)&v10 + 1) + 8 * v9++), v5, v6, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v10, v14, 16);
    }
    while (v7);
  }
}

- (void)invalidate
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v3 = self->_serverClusters;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v17, v21, 16);
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend_invalidate(*(void **)(*((void *)&v17 + 1) + 8 * v9++), v5, v6, (void)v17);
      }
      while (v7 != v9);
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v17, v21, 16);
    }
    while (v7);
  }

  objc_msgSend_set(MEMORY[0x263EFFA08], v10, v11);
  long long v12 = (NSSet *)objc_claimAutoreleasedReturnValue();
  matterAccessGrants = self->_matterAccessGrants;
  self->_matterAccessGrants = v12;

  self->_matterEndpointMetadata.clusterCount = 0;
  value = self->_matterClusterMetadata.__ptr_.__value_;
  self->_matterClusterMetadata.__ptr_.__value_ = 0;
  self->_matterEndpointMetadata.cluster = 0;
  if (value) {
    MEMORY[0x245695F80](value, 0x10F0C80AC0EDF25);
  }
  uint64_t v15 = self->_matterDeviceTypes.__ptr_.__value_;
  self->_matterDeviceTypes.__ptr_.__value_ = 0;
  if (v15) {
    MEMORY[0x245695F80](v15, 0x1000C8090D0E795);
  }
  uint64_t v16 = self->_matterDataVersions.__ptr_.__value_;
  self->_matterDataVersions.__ptr_.__value_ = 0;
  if (v16) {
    MEMORY[0x245695F80](v16, 0x1000C8052888210);
  }
  objc_storeWeak((id *)&self->_deviceController, 0);
}

- (id)matterAccessGrantsForCluster:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/ServerEndpoint/MTRServerEndpoint.mm", 393);
  uint64_t v7 = objc_msgSend_allObjects(self->_matterAccessGrants, v5, v6);
  long long v10 = objc_msgSend_mutableCopy(v7, v8, v9);

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v11 = self->_serverClusters;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v28, v32, 16);
  if (v15)
  {
    uint64_t v16 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v11);
        }
        long long v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        long long v19 = objc_msgSend_clusterID(v18, v13, v14, (void)v28);
        int isEqual = objc_msgSend_isEqual_(v19, v20, (uint64_t)v4);

        if (isEqual)
        {
          uint64_t v22 = objc_msgSend_matterAccessGrants(v18, v13, v14);
          objc_msgSend_addObjectsFromArray_(v10, v23, (uint64_t)v22);
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v28, v32, 16);
    }
    while (v15);
  }

  v26 = objc_msgSend_copy(v10, v24, v25);

  return v26;
}

- (NSArray)accessGrants
{
  return (NSArray *)objc_msgSend_allObjects(self->_accessGrants, a2, v2);
}

- (NSArray)serverClusters
{
  v3 = objc_msgSend_copy(self->_serverClusters, a2, v2);

  return (NSArray *)v3;
}

- (id)description
{
  v3 = NSString;
  unsigned __int16 v4 = objc_msgSend_unsignedLongLongValue(self->_endpointID, a2, v2);
  return (id)objc_msgSend_stringWithFormat_(v3, v5, @"<MTRServerEndpoint id %u>", v4);
}

- (NSNumber)endpointID
{
  return self->_endpointID;
}

- (NSArray)deviceTypes
{
  return self->_deviceTypes;
}

- (NSSet)matterAccessGrants
{
  return self->_matterAccessGrants;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matterAccessGrants, 0);
  objc_storeStrong((id *)&self->_deviceTypes, 0);
  objc_storeStrong((id *)&self->_endpointID, 0);
  value = self->_matterDataVersions.__ptr_.__value_;
  self->_matterDataVersions.__ptr_.__value_ = 0;
  if (value) {
    MEMORY[0x245695F80](value, 0x1000C8052888210);
  }
  unsigned __int16 v4 = self->_matterDeviceTypes.__ptr_.__value_;
  self->_matterDeviceTypes.__ptr_.__value_ = 0;
  if (v4) {
    MEMORY[0x245695F80](v4, 0x1000C8090D0E795);
  }
  id v5 = self->_matterClusterMetadata.__ptr_.__value_;
  self->_matterClusterMetadata.__ptr_.__value_ = 0;
  if (v5) {
    MEMORY[0x245695F80](v5, 0x10F0C80AC0EDF25);
  }
  objc_destroyWeak((id *)&self->_deviceController);
  objc_storeStrong((id *)&self->_serverClusters, 0);

  objc_storeStrong((id *)&self->_accessGrants, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((unsigned char *)self + 74) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((unsigned char *)self + 72) = 0;
  return self;
}

@end