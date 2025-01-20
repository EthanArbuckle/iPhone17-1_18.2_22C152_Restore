@interface MTRDeviceControllerFactory
+ (MTRDeviceControllerFactory)sharedInstance;
+ (void)initialize;
- (BOOL)isRunning;
- (BOOL)startControllerFactory:(MTRDeviceControllerFactoryParams *)startupParams error:(NSError *)error;
- (MTRDeviceController)createControllerOnExistingFabric:(MTRDeviceControllerStartupParams *)startupParams error:(NSError *)error;
- (MTRDeviceController)createControllerOnNewFabric:(MTRDeviceControllerStartupParams *)startupParams error:(NSError *)error;
- (MTRDeviceControllerFactory)init;
- (NSArray)knownFabrics;
- (id).cxx_construct;
- (id)accessGrantsForFabricIndex:(unsigned __int8)a3 clusterPath:(id)a4;
- (id)neededReadPrivilegeForClusterID:(id)a3 attributeID:(id)a4;
- (void)dealloc;
- (void)preWarmCommissioningSession;
- (void)stopControllerFactory;
@end

@implementation MTRDeviceControllerFactory

+ (void)initialize
{
  if (qword_268EBE0F0 != -1) {
    dispatch_once(&qword_268EBE0F0, &unk_26F943EF8);
  }
}

+ (MTRDeviceControllerFactory)sharedInstance
{
  if (qword_268EBE8F0 != -1) {
    dispatch_once(&qword_268EBE8F0, &unk_26F944080);
  }
  v2 = (void *)qword_268EBE8E8;

  return (MTRDeviceControllerFactory *)v2;
}

- (MTRDeviceControllerFactory)init
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)MTRDeviceControllerFactory;
  v2 = [(MTRDeviceControllerFactory *)&v12 init];
  if (v2)
  {
    if (qword_26B0D43B0 != -1) {
      dispatch_once_f(&qword_26B0D43B0, &byte_26B0D4370, (dispatch_function_t)sub_2446D7DB8);
    }
    sub_244D77AA4((uint64_t)&byte_26B0D4370, (uint64_t)&v13);
    if (qword_26B0D43B0 != -1) {
      dispatch_once_f(&qword_26B0D43B0, &byte_26B0D4370, (dispatch_function_t)sub_2446D7DB8);
    }
    objc_storeStrong((id *)&v2->_chipWorkQueue, (id)qword_26B0D4398);
    v2->_controllerFactory = (DeviceControllerFactory *)sub_2446D1EF0();
    sub_244DA6294((uint64_t)&v2->_groupDataProvider, (uint64_t)&v2->_groupStorageDelegate);
    v2->_groupDataProvider.mSessionKeystore = (SessionKeystore *)&v2->_sessionKeystore;
    uint64_t v11 = 0;
    long long v10 = 0uLL;
    (*((void (**)(long long *__return_ptr, GroupDataProviderImpl *))v2->_groupDataProvider._vptr$GroupDataProvider
     + 2))(&v10, &v2->_groupDataProvider);
    if (!v10)
    {
      v2->_controllersLock._os_unfair_lock_opaque = 0;
      v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      controllers = v2->_controllers;
      v2->_controllers = v3;

      v2->_serverEndpointsLock._os_unfair_lock_opaque = 0;
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      serverEndpoints = v2->_serverEndpoints;
      v2->_serverEndpoints = v5;

      operator new();
    }
    v8 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      long long v13 = v10;
      uint64_t v14 = v11;
      v9 = sub_244CB7B34((const char **)&v13, 1);
      *(_DWORD *)buf = 136315138;
      v16 = v9;
      _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_ERROR, "GroupDataProviderImpl::Init() failed: %s", buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      long long v13 = v10;
      uint64_t v14 = v11;
      sub_244CB7B34((const char **)&v13, 1);
      sub_244CC4DE0(0, 1);
    }
    abort();
  }

  return 0;
}

- (void)dealloc
{
  objc_msgSend_stopControllerFactory(self, a2, v2);
  (*((void (**)(void))self->_groupDataProvider._vptr$GroupDataProvider + 3))();
  v4.receiver = self;
  v4.super_class = (Class)MTRDeviceControllerFactory;
  [(MTRDeviceControllerFactory *)&v4 dealloc];
}

- (NSArray)knownFabrics
{
  sub_2446D2004((BOOL)self);
  if (self->_running)
  {
    uint64_t v11 = 0;
    objc_super v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = sub_2446D23D4;
    v15 = sub_2446D23E4;
    id v16 = 0;
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    chipWorkQueue = self->_chipWorkQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2446D23EC;
    block[3] = &unk_265193DF0;
    block[4] = self;
    block[5] = &v11;
    block[6] = &v7;
    dispatch_sync(chipWorkQueue, block);
    if (*((unsigned char *)v8 + 24)) {
      id v4 = (id)v12[5];
    }
    else {
      id v4 = 0;
    }
    _Block_object_dispose(&v7, 8);
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v4 = 0;
  }

  return (NSArray *)v4;
}

- (BOOL)startControllerFactory:(MTRDeviceControllerFactoryParams *)startupParams error:(NSError *)error
{
  return sub_2446D26E0((uint64_t)self, startupParams, 0, error);
}

- (void)stopControllerFactory
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  sub_2446D2004((BOOL)self);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = objc_msgSend_copy(self->_controllers, v3, v4);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v14, v18, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend_shutdown(*(void **)(*((void *)&v14 + 1) + 8 * v11++), v7, v8);
      }
      while (v9 != v11);
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v14, v18, 16);
    }
    while (v9);
  }

  chipWorkQueue = self->_chipWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2446D3000;
  block[3] = &unk_265193E58;
  block[4] = self;
  dispatch_sync(chipWorkQueue, block);
}

- (MTRDeviceController)createControllerOnExistingFabric:(MTRDeviceControllerStartupParams *)startupParams error:(NSError *)error
{
  v6 = startupParams;
  sub_2446D2004((BOOL)self);
  if (self->_usingPerControllerStorage)
  {
    uint64_t v9 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2446BD000, v9, OS_LOG_TYPE_ERROR, "Can't createControllerOnExistingFabric when using per-controller data store", buf, 2u);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    if (error)
    {
      LODWORD(v20) = 3;
      *((void *)&v20 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/MTRDeviceControllerFactory.mm";
      int v21 = 640;
      sub_244B26908((uint64_t)MTRError, &v20);
      id v10 = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    uint64_t v11 = objc_msgSend_operationalCertificate(v6, v7, v8);
    long long v14 = objc_msgSend_rootCertificate(v6, v12, v13);
    long long v15 = sub_2446D4BC0((char *)self, v11, v14);

    if (v15)
    {
      id v10 = v15;
    }
    else
    {
      long long v16 = [MTRDeviceController_Concrete alloc];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = sub_2446D4DF0;
      v18[3] = &unk_265193EC0;
      v18[4] = self;
      uint64_t v19 = v6;
      sub_2446D30C8((uint64_t)self, v16, v19, v18, error);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return (MTRDeviceController *)v10;
}

- (MTRDeviceController)createControllerOnNewFabric:(MTRDeviceControllerStartupParams *)startupParams error:(NSError *)error
{
  v6 = startupParams;
  sub_2446D2004((BOOL)self);
  uint64_t v9 = objc_msgSend_vendorID(v6, v7, v8);

  if (v9)
  {
    long long v14 = objc_msgSend_intermediateCertificate(v6, v10, v11);
    if (!v14
      || (objc_msgSend_rootCertificate(v6, v12, v13),
          long long v15 = objc_claimAutoreleasedReturnValue(),
          v15,
          v14,
          v15))
    {
      long long v16 = [MTRDeviceController_Concrete alloc];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = sub_2446D5890;
      v22[3] = &unk_265193EC0;
      v22[4] = self;
      v23 = v6;
      long long v17 = sub_2446D30C8((uint64_t)self, v16, v23, v22, error);

      goto LABEL_19;
    }
    long long v20 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2446BD000, v20, OS_LOG_TYPE_ERROR, "Must provide a root certificate when using an intermediate certificate", buf, 2u);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    if (error)
    {
      LODWORD(v24) = 47;
      *((void *)&v24 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/MTRDeviceControllerFactory.mm";
      int v25 = 718;
      uint64_t v19 = sub_244B26908((uint64_t)MTRError, &v24);
      goto LABEL_17;
    }
  }
  else
  {
    v18 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2446BD000, v18, OS_LOG_TYPE_ERROR, "Must provide vendor id when starting controller on new fabric", buf, 2u);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    if (error)
    {
      LODWORD(v26) = 47;
      *((void *)&v26 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/MTRDeviceControllerFactory.mm";
      int v27 = 710;
      uint64_t v19 = sub_244B26908((uint64_t)MTRError, &v26);
LABEL_17:
      long long v17 = 0;
      *error = (NSError *)v19;
      goto LABEL_19;
    }
  }
  long long v17 = 0;
LABEL_19:

  return (MTRDeviceController *)v17;
}

- (void)preWarmCommissioningSession
{
  chipWorkQueue = self->_chipWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2446D5AC4;
  block[3] = &unk_265193E58;
  block[4] = self;
  dispatch_async(chipWorkQueue, block);
}

- (id)accessGrantsForFabricIndex:(unsigned __int8)a3 clusterPath:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDeviceControllerFactory.mm", 1035);
  uint64_t v9 = objc_msgSend_endpoint(v6, v7, v8);
  objc_super v12 = objc_msgSend_endpointID(self->_otaProviderEndpoint, v10, v11);
  int isEqual = objc_msgSend_isEqual_(v9, v13, (uint64_t)v12);

  if (isEqual)
  {
    otaProviderEndpoint = self->_otaProviderEndpoint;
    v18 = objc_msgSend_cluster(v6, v15, v16);
    uint64_t v20 = objc_msgSend_matterAccessGrantsForCluster_(otaProviderEndpoint, v19, (uint64_t)v18);
LABEL_5:
    v23 = (void *)v20;
    goto LABEL_6;
  }
  int v21 = sub_2446D65A4((unsigned __int8 *)self, v4, 0, 1);
  v18 = v21;
  if (v21)
  {
    uint64_t v20 = objc_msgSend_accessGrantsForClusterPath_(v21, v22, (uint64_t)v6);
    goto LABEL_5;
  }
  v23 = (void *)MEMORY[0x263EFFA68];
LABEL_6:

  return v23;
}

- (id)neededReadPrivilegeForClusterID:(id)a3 attributeID:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDeviceControllerFactory.mm", 1057);
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v40 = (os_unfair_lock_s *)self;
  objc_msgSend_serverClusters(self->_otaProviderEndpoint, v8, v9);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v52, v58, 16);
  if (v11)
  {
    uint64_t v42 = *(void *)v53;
    do
    {
      uint64_t v41 = v11;
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v53 != v42) {
          objc_enumerationMutation(obj);
        }
        long long v15 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend_clusterID(v15, v12, v13);
        char isEqual = objc_msgSend_isEqual_(v16, v17, (uint64_t)v6);

        if (isEqual)
        {
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          uint64_t v19 = objc_msgSend_attributes(v15, v12, v13);
          uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v48, v57, 16);
          if (v23)
          {
            uint64_t v24 = *(void *)v49;
            while (2)
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v49 != v24) {
                  objc_enumerationMutation(v19);
                }
                long long v26 = *(void **)(*((void *)&v48 + 1) + 8 * j);
                int v27 = objc_msgSend_attributeID(v26, v21, v22);
                char v29 = objc_msgSend_isEqual_(v27, v28, (uint64_t)v7);

                if (v29)
                {
                  v36 = NSNumber;
                  uint64_t Privilege = objc_msgSend_requiredReadPrivilege(v26, v21, v22);
                  v35 = objc_msgSend_numberWithUnsignedChar_(v36, v38, Privilege);

                  goto LABEL_28;
                }
              }
              uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v21, (uint64_t)&v48, v57, 16);
              if (v23) {
                continue;
              }
              break;
            }
          }
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v52, v58, 16);
    }
    while (v11);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  sub_2446D43BC(v40);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v44, v56, 16);
  if (v32)
  {
    uint64_t v33 = *(void *)v45;
LABEL_20:
    uint64_t v34 = 0;
    while (1)
    {
      if (*(void *)v45 != v33) {
        objc_enumerationMutation(obj);
      }
      v35 = objc_msgSend_neededReadPrivilegeForClusterID_attributeID_(*(void **)(*((void *)&v44 + 1) + 8 * v34), v31, (uint64_t)v6, v7);
      if (v35) {
        break;
      }
      if (v32 == ++v34)
      {
        uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v44, v56, 16);
        if (v32) {
          goto LABEL_20;
        }
        goto LABEL_26;
      }
    }
  }
  else
  {
LABEL_26:
    v35 = 0;
  }
LABEL_28:

  return v35;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverEndpoints, 0);
  objc_storeStrong((id *)&self->_diagnosticLogsDownloader, 0);
  value = self->_otaProviderDelegateBridge.__ptr_.__value_;
  self->_otaProviderDelegateBridge.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(MTROTAProviderDelegateBridge *))(*(void *)value + 32))(value);
  }
  objc_storeStrong((id *)&self->_otaProviderEndpoint, 0);
  objc_storeStrong((id *)&self->_otaProviderDelegateQueue, 0);
  objc_storeStrong((id *)&self->_otaProviderDelegate, 0);
  objc_storeStrong((id *)&self->_controllerBeingShutDown, 0);
  objc_storeStrong((id *)&self->_controllerBeingStarted, 0);
  objc_storeStrong((id *)&self->_controllers, 0);
  objc_storeStrong((id *)&self->_certificationDeclarationCertificates, 0);
  objc_storeStrong((id *)&self->_productAttestationAuthorityCertificates, 0);
  sub_2446DC5C4((uint64_t *)&self->_operationalBrowser, 0);
  sub_2446D82A0((uint64_t *)&self->_groupDataProvider);
  self->_groupStorageDelegate._vptr$PersistentStorageDelegate = (void **)&unk_26F9440D0;
  sub_2446D9D94((uint64_t)&self->_groupStorageDelegate.mPoisonKeys, (char *)self->_groupStorageDelegate.mPoisonKeys.__tree_.__pair1_.__value_.__left_);
  sub_2446D9DF8((uint64_t)&self->_groupStorageDelegate.mStorage, (void *)self->_groupStorageDelegate.mStorage.__tree_.__pair1_.__value_.__left_);

  objc_storeStrong((id *)&self->_chipWorkQueue, 0);
}

- (id).cxx_construct
{
  self->_certificateValidityPolicy._vptr$CertificateValidityPolicy = (void **)&unk_26F944188;
  self->_sessionKeystore._vptr$SessionKeystore = (void **)&unk_26F9542A0;
  self->_groupStorageDelegate.mStorage.__tree_.__pair1_.__value_.__left_ = 0;
  self->_groupStorageDelegate._vptr$PersistentStorageDelegate = (void **)&unk_26F9440D0;
  self->_groupStorageDelegate.mStorage.__tree_.__begin_node_ = &self->_groupStorageDelegate.mStorage.__tree_.__pair1_;
  self->_groupStorageDelegate.mPoisonKeys.__tree_.__pair1_.__value_.__left_ = 0;
  self->_groupStorageDelegate.mPoisonKeys.__tree_.__pair3_.__value_ = 0;
  self->_groupStorageDelegate.mStorage.__tree_.__pair3_.__value_ = 0;
  self->_groupStorageDelegate.mPoisonKeys.__tree_.__begin_node_ = &self->_groupStorageDelegate.mPoisonKeys.__tree_.__pair1_;
  self->_groupStorageDelegate.mRejectWrites = 0;
  self->_groupStorageDelegate.mLoggingLevel = 0;
  sub_2446DC454((uint64_t)&self->_groupDataProvider);
  self->_operationalBrowser.__ptr_.__value_ = 0;
  self->_otaProviderDelegateBridge.__ptr_.__value_ = 0;
  self->_preWarmingDelegate._vptr$BleScannerDelegate = (void **)&unk_26F9441D8;
  return self;
}

@end