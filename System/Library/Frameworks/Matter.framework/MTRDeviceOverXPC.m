@interface MTRDeviceOverXPC
- (MTRDeviceControllerOverXPC)controller;
- (MTRDeviceControllerXPCConnection)xpcConnection;
- (MTRDeviceOverXPC)initWithControllerOverXPC:(id)a3 deviceID:(id)a4 xpcConnection:(id)a5;
- (NSCopying)controllerID;
- (NSNumber)nodeID;
- (void)_invokeCommandWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 commandFields:(id)a6 timedInvokeTimeout:(id)a7 serverSideProcessingTimeout:(id)a8 logCall:(BOOL)a9 queue:(id)a10 completion:(id)a11;
- (void)_writeAttributeWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 value:(id)a6 timedWriteTimeout:(id)a7 queue:(id)a8 completion:(id)a9;
- (void)deregisterReportHandlersWithQueue:(id)a3 completion:(id)a4;
- (void)downloadLogOfType:(int64_t)a3 timeout:(double)a4 queue:(id)a5 completion:(id)a6;
- (void)fetchProxyHandleWithQueue:(id)a3 completion:(id)a4;
- (void)invokeCommandWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 commandFields:(id)a6 timedInvokeTimeout:(id)a7 queue:(id)a8 completion:(id)a9;
- (void)openCommissioningWindowWithDiscriminator:(id)a3 duration:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)openCommissioningWindowWithSetupPasscode:(id)a3 discriminator:(id)a4 duration:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)readAttributePaths:(id)a3 eventPaths:(id)a4 params:(id)a5 includeDataVersion:(BOOL)a6 queue:(id)a7 completion:(id)a8;
- (void)readAttributePaths:(id)a3 eventPaths:(id)a4 params:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)readAttributesWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 params:(id)a6 queue:(id)a7 completion:(id)a8;
- (void)subscribeToAttributesWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 params:(id)a6 queue:(id)a7 reportHandler:(id)a8 subscriptionEstablished:(id)a9;
- (void)subscribeWithQueue:(id)a3 params:(id)a4 clusterStateCacheContainer:(id)a5 attributeReportHandler:(id)a6 eventReportHandler:(id)a7 errorHandler:(id)a8 subscriptionEstablished:(id)a9 resubscriptionScheduled:(id)a10;
@end

@implementation MTRDeviceOverXPC

- (MTRDeviceOverXPC)initWithControllerOverXPC:(id)a3 deviceID:(id)a4 xpcConnection:(id)a5
{
  v8 = (MTRDeviceControllerOverXPC *)a3;
  v9 = (NSNumber *)a4;
  v10 = (MTRDeviceControllerXPCConnection *)a5;
  objc_msgSend_controllerXPCID(v8, v11, v12);
  v13 = (NSCopying *)objc_claimAutoreleasedReturnValue();
  controllerID = self->_controllerID;
  self->_controllerID = v13;

  controller = self->_controller;
  self->_controller = v8;
  v16 = v8;

  nodeID = self->_nodeID;
  self->_nodeID = v9;
  v18 = v9;

  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v10;

  return self;
}

- (void)subscribeWithQueue:(id)a3 params:(id)a4 clusterStateCacheContainer:(id)a5 attributeReportHandler:(id)a6 eventReportHandler:(id)a7 errorHandler:(id)a8 subscriptionEstablished:(id)a9 resubscriptionScheduled:(id)a10
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  id v18 = a9;
  v19 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2446BD000, v19, OS_LOG_TYPE_INFO, "Subscribing all attributes... Note that attributeReportHandler, eventReportHandler, and resubscriptionScheduled are not supported.", buf, 2u);
  }

  if (sub_244CC4E58(3u)) {
    sub_244CC4DE0(0, 3);
  }
  uint64_t v28 = MEMORY[0x263EF8330];
  uint64_t v29 = 3221225472;
  v30 = sub_244C7AF78;
  v31 = &unk_26519B060;
  id v20 = v17;
  id v36 = v20;
  id v21 = v16;
  id v32 = v21;
  v33 = self;
  id v22 = v15;
  id v34 = v22;
  id v27 = v14;
  id v23 = v14;
  id v35 = v23;
  id v24 = v18;
  id v37 = v24;
  v25 = (void *)MEMORY[0x2456969D0](&v28);
  objc_msgSend_fetchProxyHandleWithQueue_completion_(self, v26, (uint64_t)v23, v25, v15, v27, v28, v29, v30, v31);
}

- (void)readAttributesWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 params:(id)a6 queue:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2446BD000, v20, OS_LOG_TYPE_INFO, "Reading attribute ...", buf, 2u);
  }

  if (sub_244CC4E58(3u)) {
    sub_244CC4DE0(0, 3);
  }
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = sub_244C7B5A4;
  v29[3] = &unk_26519B0D8;
  id v21 = v19;
  id v35 = v21;
  v29[4] = self;
  id v22 = v14;
  id v30 = v22;
  id v23 = v15;
  id v31 = v23;
  id v24 = v16;
  id v32 = v24;
  id v25 = v17;
  id v33 = v25;
  id v26 = v18;
  id v34 = v26;
  id v27 = (void *)MEMORY[0x2456969D0](v29);
  objc_msgSend_fetchProxyHandleWithQueue_completion_(self, v28, (uint64_t)v26, v27);
}

- (void)readAttributePaths:(id)a3 eventPaths:(id)a4 params:(id)a5 queue:(id)a6 completion:(id)a7
{
}

- (void)readAttributePaths:(id)a3 eventPaths:(id)a4 params:(id)a5 includeDataVersion:(BOOL)a6 queue:(id)a7 completion:(id)a8
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v39 = a5;
  queue = a7;
  id v41 = a8;
  id v36 = v14;
  if (!v13 || v14)
  {
    id v35 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2446BD000, v35, OS_LOG_TYPE_ERROR, "MTRBaseDevice doesn't support reading event paths over XPC", buf, 2u);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_244C7BDD8;
    block[3] = &unk_265194E00;
    id v59 = v41;
    dispatch_async(queue, block);
  }
  else
  {
    uint64_t v17 = objc_msgSend_count(v13, v15, v16, 0);
    *(void *)buf = 0;
    v55 = buf;
    uint64_t v56 = 0x2020000000;
    uint64_t v57 = 0;
    id v38 = objc_alloc_init(MEMORY[0x263EFF980]);
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x2020000000;
    char v53 = 0;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = v13;
    uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v48, v60, 16);
    if (v19)
    {
      uint64_t v20 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v49 != v20) {
            objc_enumerationMutation(obj);
          }
          id v22 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          v42[0] = MEMORY[0x263EF8330];
          v42[1] = 3221225472;
          v42[2] = sub_244C7BE68;
          v42[3] = &unk_26519B100;
          v45 = v52;
          id v44 = v41;
          id v43 = v38;
          v46 = buf;
          uint64_t v47 = v17;
          id v23 = (void *)MEMORY[0x2456969D0](v42);
          id v26 = objc_msgSend_endpoint(v22, v24, v25);
          uint64_t v29 = objc_msgSend_cluster(v22, v27, v28);
          id v32 = objc_msgSend_attribute(v22, v30, v31);
          objc_msgSend_readAttributesWithEndpointID_clusterID_attributeID_params_queue_completion_(self, v33, (uint64_t)v26, v29, v32, v39, queue, v23);
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v48, v60, 16);
      }
      while (v19);
    }

    _Block_object_dispose(v52, 8);
    _Block_object_dispose(buf, 8);
  }
}

- (void)_writeAttributeWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 value:(id)a6 timedWriteTimeout:(id)a7 queue:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = sub_244CC8484(0, "NotSpecified");
  id v23 = v16;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2446BD000, v22, OS_LOG_TYPE_INFO, "Writing attribute ...", buf, 2u);
  }
  id v24 = self;

  if (sub_244CC4E58(3u)) {
    sub_244CC4DE0(0, 3);
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_244C7C26C;
  v34[3] = &unk_26519B128;
  id v25 = v21;
  id v41 = v25;
  v34[4] = v24;
  id v33 = v15;
  id v35 = v33;
  id v32 = v23;
  id v36 = v32;
  id v26 = v17;
  id v37 = v26;
  id v27 = v18;
  id v38 = v27;
  id v28 = v19;
  id v39 = v28;
  id v29 = v20;
  id v40 = v29;
  id v30 = (void *)MEMORY[0x2456969D0](v34);
  objc_msgSend_fetchProxyHandleWithQueue_completion_(v24, v31, (uint64_t)v29, v30);
}

- (void)invokeCommandWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 commandFields:(id)a6 timedInvokeTimeout:(id)a7 queue:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = sub_244CC8484(0, "NotSpecified");
  id v23 = v16;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2446BD000, v22, OS_LOG_TYPE_INFO, "Invoking command ...", buf, 2u);
  }
  id v24 = self;

  if (sub_244CC4E58(3u)) {
    sub_244CC4DE0(0, 3);
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_244C7C904;
  v34[3] = &unk_26519B128;
  id v25 = v21;
  id v41 = v25;
  v34[4] = v24;
  id v33 = v15;
  id v35 = v33;
  id v32 = v23;
  id v36 = v32;
  id v26 = v17;
  id v37 = v26;
  id v27 = v18;
  id v38 = v27;
  id v28 = v19;
  id v39 = v28;
  id v29 = v20;
  id v40 = v29;
  id v30 = (void *)MEMORY[0x2456969D0](v34);
  objc_msgSend_fetchProxyHandleWithQueue_completion_(v24, v31, (uint64_t)v29, v30);
}

- (void)_invokeCommandWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 commandFields:(id)a6 timedInvokeTimeout:(id)a7 serverSideProcessingTimeout:(id)a8 logCall:(BOOL)a9 queue:(id)a10 completion:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a10;
  id v24 = a11;
  id v26 = v24;
  if (v22)
  {
    id v27 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2446BD000, v27, OS_LOG_TYPE_ERROR, "MTRBaseDevice doesn't support invokes with a server-side processing timeout over XPC", buf, 2u);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_244C7CEA8;
    block[3] = &unk_265194E00;
    id v29 = v26;
    dispatch_async(v23, block);
  }
  else
  {
    objc_msgSend_invokeCommandWithEndpointID_clusterID_commandID_commandFields_timedInvokeTimeout_queue_completion_(self, v25, (uint64_t)v17, v18, v19, v20, v21, v23, v24);
  }
}

- (void)subscribeToAttributesWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 params:(id)a6 queue:(id)a7 reportHandler:(id)a8 subscriptionEstablished:(id)a9
{
  id v33 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = sub_244CC8484(0, "NotSpecified");
  id v32 = v15;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2446BD000, v21, OS_LOG_TYPE_INFO, "Subscribing attribute ...", buf, 2u);
  }
  id v22 = self;

  if (sub_244CC4E58(3u)) {
    sub_244CC4DE0(0, 3);
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_244C7D214;
  v34[3] = &unk_26519B178;
  id v23 = v20;
  id v40 = v23;
  id v24 = v19;
  id v41 = v24;
  v34[4] = v22;
  id v25 = v18;
  id v35 = v25;
  id v31 = v33;
  id v36 = v31;
  id v26 = v32;
  id v37 = v26;
  id v27 = v16;
  id v38 = v27;
  id v28 = v17;
  id v39 = v28;
  id v29 = (void *)MEMORY[0x2456969D0](v34);
  objc_msgSend_fetchProxyHandleWithQueue_completion_(v22, v30, (uint64_t)v25, v29);
}

- (void)deregisterReportHandlersWithQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_INFO, "Deregistering report handlers", buf, 2u);
  }

  if (sub_244CC4E58(3u)) {
    sub_244CC4DE0(0, 3);
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_244C7E12C;
  v22[3] = &unk_265199770;
  v22[4] = self;
  id v9 = v6;
  id v23 = v9;
  id v10 = v7;
  id v24 = v10;
  v11 = (void (**)(void))MEMORY[0x2456969D0](v22);
  id v14 = objc_msgSend_controllerID(self, v12, v13);

  if (v14)
  {
    v11[2](v11);
  }
  else
  {
    id v17 = objc_msgSend_controller(self, v15, v16);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = sub_244C7E248;
    v19[3] = &unk_26519B1A0;
    v19[4] = self;
    id v20 = v10;
    id v21 = v11;
    objc_msgSend_fetchControllerIdWithQueue_completion_(v17, v18, (uint64_t)v9, v19);
  }
}

- (void)openCommissioningWindowWithSetupPasscode:(id)a3 discriminator:(id)a4 duration:(id)a5 queue:(id)a6 completion:(id)a7
{
  v8 = a6;
  id v9 = a7;
  id v10 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_ERROR, "MTRBaseDevice doesn't support openCommissioningWindowWithSetupPasscode over XPC", buf, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0, 1);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244C7E41C;
  block[3] = &unk_265194E00;
  id v13 = v9;
  id v11 = v9;
  dispatch_async(v8, block);
}

- (void)openCommissioningWindowWithDiscriminator:(id)a3 duration:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v7 = a5;
  id v8 = a6;
  id v9 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2446BD000, v9, OS_LOG_TYPE_ERROR, "MTRBaseDevice doesn't support openCommissioningWindowWithDiscriminator over XPC", buf, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0, 1);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244C7E5E0;
  block[3] = &unk_265194E00;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(v7, block);
}

- (void)downloadLogOfType:(int64_t)a3 timeout:(double)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2446BD000, v12, OS_LOG_TYPE_INFO, "Downloading log ...", buf, 2u);
  }

  if (sub_244CC4E58(3u)) {
    sub_244CC4DE0(0, 3);
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_244C7E80C;
  v17[3] = &unk_26519B1F0;
  id v13 = v11;
  id v19 = v13;
  int64_t v20 = a3;
  v17[4] = self;
  double v21 = a4;
  id v14 = v10;
  id v18 = v14;
  id v15 = (void *)MEMORY[0x2456969D0](v17);
  objc_msgSend_fetchProxyHandleWithQueue_completion_(self, v16, (uint64_t)v14, v15);
}

- (void)fetchProxyHandleWithQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend_controllerID(self, v8, v9);

  if (v10)
  {
    xpcConnection = self->_xpcConnection;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = sub_244C7ED34;
    v20[3] = &unk_26519B218;
    id v21 = v6;
    id v22 = v7;
    objc_msgSend_getProxyHandleWithCompletion_(xpcConnection, v14, (uint64_t)v20);
    id v15 = &v21;
  }
  else
  {
    uint64_t v16 = objc_msgSend_controller(self, v11, v12);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = sub_244C7EF10;
    v18[3] = &unk_26519B240;
    v18[4] = self;
    id v19 = v7;
    objc_msgSend_fetchControllerIdWithQueue_completion_(v16, v17, (uint64_t)v6, v18);
    id v15 = &v19;
  }
}

- (NSCopying)controllerID
{
  return self->_controllerID;
}

- (MTRDeviceControllerOverXPC)controller
{
  return self->_controller;
}

- (NSNumber)nodeID
{
  return self->_nodeID;
}

- (MTRDeviceControllerXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_storeStrong((id *)&self->_controller, 0);

  objc_storeStrong((id *)&self->_controllerID, 0);
}

@end