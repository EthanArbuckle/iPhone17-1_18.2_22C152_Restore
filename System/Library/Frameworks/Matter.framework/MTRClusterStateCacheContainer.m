@interface MTRClusterStateCacheContainer
- (BOOL)shouldUseXPC;
- (MTRBaseDevice)baseDevice;
- (MTRClusterStateCacheContainer)init;
- (MTRDeviceControllerXPCConnection)xpcConnection;
- (NSCopying)xpcControllerID;
- (NSNumber)deviceID;
- (void)_readKnownCachedAttributeWithEndpointID:(unsigned __int16)a3 clusterID:(unsigned int)a4 attributeID:(unsigned int)a5 queue:(id)a6 completion:(id)a7;
- (void)cppClusterStateCache;
- (void)readAttributesWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID attributeID:(NSNumber *)attributeID queue:(dispatch_queue_t)queue completion:(MTRDeviceResponseHandler)completion;
- (void)setBaseDevice:(id)a3;
- (void)setCppClusterStateCache:(void *)a3;
- (void)setDeviceID:(id)a3;
- (void)setShouldUseXPC:(BOOL)a3;
- (void)setXPCConnection:(id)a3 controllerID:(id)a4 deviceID:(id)a5;
- (void)setXpcConnection:(id)a3;
- (void)setXpcControllerID:(id)a3;
@end

@implementation MTRClusterStateCacheContainer

- (MTRClusterStateCacheContainer)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRClusterStateCacheContainer;
  v2 = [(MTRClusterStateCacheContainer *)&v6 init];
  v3 = v2;
  if (v2)
  {
    baseDevice = v2->_baseDevice;
    v2->_cppClusterStateCache = 0;
    v2->_baseDevice = 0;

    v3->_shouldUseXPC = 0;
  }
  return v3;
}

- (void)setXPCConnection:(id)a3 controllerID:(id)a4 deviceID:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_msgSend_setXpcConnection_(self, v10, (uint64_t)v14);
  objc_msgSend_setXpcControllerID_(self, v11, (uint64_t)v8);
  objc_msgSend_setDeviceID_(self, v12, (uint64_t)v9);
  objc_msgSend_setShouldUseXPC_(self, v13, 1);
}

- (void)readAttributesWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID attributeID:(NSNumber *)attributeID queue:(dispatch_queue_t)queue completion:(MTRDeviceResponseHandler)completion
{
  v12 = endpointID;
  v13 = clusterID;
  id v14 = attributeID;
  v15 = queue;
  MTRDeviceResponseHandler v16 = completion;
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = sub_244B9572C;
  v62[3] = &unk_265199CD8;
  v17 = v15;
  v63 = v17;
  id v18 = v16;
  id v64 = v18;
  v19 = (void (**)(void, void, void))MEMORY[0x2456969D0](v62);
  if (objc_msgSend_shouldUseXPC(self, v20, v21))
  {
    v26 = objc_msgSend_xpcConnection(self, v22, v23);
    if (v26)
    {
      v27 = objc_msgSend_xpcControllerID(self, v24, v25);
      v30 = objc_msgSend_deviceID(self, v28, v29);
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = sub_244B95818;
      v54[3] = &unk_265199D28;
      id v31 = v27;
      id v55 = v31;
      id v56 = v30;
      v57 = v12;
      v58 = v13;
      v59 = v14;
      v60 = v19;
      id v32 = v30;
      objc_msgSend_getProxyHandleWithCompletion_(v26, v33, (uint64_t)v54);
    }
    else
    {
      v42 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2446BD000, v42, OS_LOG_TYPE_ERROR, "Attribute cache read failed: MTRDeviceController was already disposed", buf, 2u);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v43, @"MTRErrorDomain", 1, 0);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void, id))v19)[2](v19, 0, v31);
    }
  }
  else
  {
    v34 = objc_msgSend_baseDevice(self, v22, v23);

    if (v34)
    {
      v37 = objc_msgSend_baseDevice(self, v35, v36);
      v40 = objc_msgSend_deviceController(v37, v38, v39);
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = sub_244B95AC0;
      v48[3] = &unk_265199D50;
      v49 = v12;
      v50 = v13;
      v53 = v19;
      v51 = self;
      v52 = v14;
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = sub_244B96644;
      v46[3] = &unk_265199AA8;
      v47 = v53;
      objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(v40, v41, (uint64_t)v48, v46);

      v26 = v49;
    }
    else
    {
      v44 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2446BD000, v44, OS_LOG_TYPE_ERROR, "Error: No attribute cache available to read from", buf, 2u);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
      v26 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v45, @"MTRErrorDomain", 1, 0);
      ((void (**)(void, void, void *))v19)[2](v19, 0, v26);
    }
  }
}

- (void)_readKnownCachedAttributeWithEndpointID:(unsigned __int16)a3 clusterID:(unsigned int)a4 attributeID:(unsigned int)a5 queue:(id)a6 completion:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = sub_244B968F0;
  v37[3] = &unk_265199D78;
  id v14 = v12;
  id v38 = v14;
  id v15 = v13;
  id v39 = v15;
  MTRDeviceResponseHandler v16 = (void (**)(void, void, void))MEMORY[0x2456969D0](v37);
  v19 = objc_msgSend_baseDevice(self, v17, v18);

  if (v19)
  {
    v22 = objc_msgSend_baseDevice(self, v20, v21);
    uint64_t v25 = objc_msgSend_deviceController(v22, v23, v24);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = sub_244B969DC;
    v30[3] = &unk_265199DA0;
    v30[4] = self;
    id v31 = v16;
    unsigned __int16 v34 = a3;
    unsigned int v32 = a4;
    unsigned int v33 = a5;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = sub_244B96C14;
    v28[3] = &unk_265199AA8;
    uint64_t v29 = v31;
    objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(v25, v26, (uint64_t)v30, v28);
  }
  else
  {
    LODWORD(v35) = 3;
    *((void *)&v35 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTRClusterStateCacheContainer.mm";
    int v36 = 216;
    v27 = sub_244B26908((uint64_t)MTRError, &v35);
    ((void (**)(void, void, void *))v16)[2](v16, 0, v27);
  }
}

- (NSNumber)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (MTRDeviceControllerXPCConnection)xpcConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);

  return (MTRDeviceControllerXPCConnection *)WeakRetained;
}

- (void)setXpcConnection:(id)a3
{
}

- (NSCopying)xpcControllerID
{
  return self->_xpcControllerID;
}

- (void)setXpcControllerID:(id)a3
{
}

- (BOOL)shouldUseXPC
{
  return self->_shouldUseXPC;
}

- (void)setShouldUseXPC:(BOOL)a3
{
  self->_shouldUseXPC = a3;
}

- (void)cppClusterStateCache
{
  return self->_cppClusterStateCache;
}

- (void)setCppClusterStateCache:(void *)a3
{
  self->_cppClusterStateCache = a3;
}

- (MTRBaseDevice)baseDevice
{
  return self->_baseDevice;
}

- (void)setBaseDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseDevice, 0);
  objc_storeStrong((id *)&self->_xpcControllerID, 0);
  objc_destroyWeak((id *)&self->_xpcConnection);

  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end