@interface MTRBaseDevice
+ (MTRBaseDevice)deviceWithNodeID:(NSNumber *)nodeID controller:(MTRDeviceController *)controller;
+ (PacketBufferHandle)_responseDataForCommand:(id)a3 clusterID:(unsigned int)a4 commandID:(unsigned int)a5 error:(id *)a6;
+ (id)eventReportForHeader:(const EventHeader *)a3 andData:(id)a4;
- (BOOL)isPASEDevice;
- (MTRBaseDevice)initWithNodeID:(id)a3 controller:(id)a4;
- (MTRBaseDevice)initWithPASEDevice:(void *)a3 controller:(id)a4;
- (MTRDeviceController)deviceController;
- (MTRDeviceController_Concrete)concreteController;
- (MTRTransportType)sessionTransportType;
- (id)description;
- (unint64_t)nodeID;
- (void)_invokeCommandWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 commandFields:(id)a6 timedInvokeTimeout:(id)a7 serverSideProcessingTimeout:(id)a8 logCall:(BOOL)a9 queue:(id)a10 completion:(id)a11;
- (void)_invokeKnownCommandWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 commandPayload:(id)a6 timedInvokeTimeout:(id)a7 serverSideProcessingTimeout:(id)a8 responseClass:(Class)a9 queue:(id)a10 completion:(id)a11;
- (void)_openCommissioningWindowWithSetupPasscode:(id)a3 discriminator:(id)a4 duration:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)_readKnownAttributeWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 params:(id)a6 queue:(id)a7 completion:(id)a8;
- (void)_subscribeToKnownAttributeWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 params:(id)a6 queue:(id)a7 reportHandler:(id)a8 subscriptionEstablished:(id)a9;
- (void)_writeAttributeWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 value:(id)a6 timedWriteTimeout:(id)a7 queue:(id)a8 completion:(id)a9;
- (void)deregisterReportHandlersWithClientQueue:(dispatch_queue_t)queue completion:(dispatch_block_t)completion;
- (void)deregisterReportHandlersWithQueue:(dispatch_queue_t)queue completion:(dispatch_block_t)completion;
- (void)downloadLogOfType:(int64_t)a3 timeout:(double)a4 queue:(id)a5 completion:(id)a6;
- (void)invalidateCASESession;
- (void)invokeCommandWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID commandID:(NSNumber *)commandID commandFields:(id)commandFields timedInvokeTimeout:(NSNumber *)timeoutMs queue:(dispatch_queue_t)queue completion:(MTRDeviceResponseHandler)completion;
- (void)invokeCommandWithEndpointId:(NSNumber *)endpointId clusterId:(NSNumber *)clusterId commandId:(NSNumber *)commandId commandFields:(id)commandFields timedInvokeTimeout:(NSNumber *)timeoutMs clientQueue:(dispatch_queue_t)clientQueue completion:(MTRDeviceResponseHandler)completion;
- (void)openCommissioningWindowWithDiscriminator:(NSNumber *)discriminator duration:(NSNumber *)duration queue:(dispatch_queue_t)queue completion:(MTRDeviceOpenCommissioningWindowHandler)completion;
- (void)openCommissioningWindowWithSetupPasscode:(NSNumber *)setupPasscode discriminator:(NSNumber *)discriminator duration:(NSNumber *)duration queue:(dispatch_queue_t)queue completion:(MTRDeviceOpenCommissioningWindowHandler)completion;
- (void)readAttributePaths:(NSArray *)attributePaths eventPaths:(NSArray *)eventPaths params:(MTRReadParams *)params queue:(dispatch_queue_t)queue completion:(MTRDeviceResponseHandler)completion;
- (void)readAttributePaths:(id)a3 eventPaths:(id)a4 params:(id)a5 includeDataVersion:(BOOL)a6 queue:(id)a7 completion:(id)a8;
- (void)readAttributesWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID attributeID:(NSNumber *)attributeID params:(MTRReadParams *)params queue:(dispatch_queue_t)queue completion:(MTRDeviceResponseHandler)completion;
- (void)readEventsWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID eventID:(NSNumber *)eventID params:(MTRReadParams *)params queue:(dispatch_queue_t)queue completion:(MTRDeviceResponseHandler)completion;
- (void)subscribeAttributeWithEndpointId:(NSNumber *)endpointId clusterId:(NSNumber *)clusterId attributeId:(NSNumber *)attributeId minInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params clientQueue:(dispatch_queue_t)clientQueue reportHandler:(MTRDeviceResponseHandler)reportHandler subscriptionEstablished:(dispatch_block_t)subscriptionEstablishedHandler;
- (void)subscribeToAttributePaths:(NSArray *)attributePaths eventPaths:(NSArray *)eventPaths params:(MTRSubscribeParams *)params queue:(dispatch_queue_t)queue reportHandler:(MTRDeviceResponseHandler)reportHandler subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished resubscriptionScheduled:(MTRDeviceResubscriptionScheduledHandler)resubscriptionScheduled;
- (void)subscribeToAttributesWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID attributeID:(NSNumber *)attributeID params:(MTRSubscribeParams *)params queue:(dispatch_queue_t)queue reportHandler:(MTRDeviceResponseHandler)reportHandler subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished;
- (void)subscribeToEventsWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID eventID:(NSNumber *)eventID params:(MTRSubscribeParams *)params queue:(dispatch_queue_t)queue reportHandler:(MTRDeviceResponseHandler)reportHandler subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished;
- (void)subscribeWithQueue:(dispatch_queue_t)queue minInterval:(uint16_t)minInterval maxInterval:(uint16_t)maxInterval params:(MTRSubscribeParams *)params cacheContainer:(MTRAttributeCacheContainer *)attributeCacheContainer attributeReportHandler:(MTRDeviceReportHandler)attributeReportHandler eventReportHandler:(MTRDeviceReportHandler)eventReportHandler errorHandler:(MTRDeviceErrorHandler)errorHandler subscriptionEstablished:(dispatch_block_t)subscriptionEstablishedHandler resubscriptionScheduled:(MTRDeviceResubscriptionScheduledHandler)resubscriptionScheduledHandler;
- (void)subscribeWithQueue:(dispatch_queue_t)queue params:(MTRSubscribeParams *)params clusterStateCacheContainer:(MTRClusterStateCacheContainer *)clusterStateCacheContainer attributeReportHandler:(MTRDeviceReportHandler)attributeReportHandler eventReportHandler:(MTRDeviceReportHandler)eventReportHandler errorHandler:(MTRDeviceErrorHandler)errorHandler subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished resubscriptionScheduled:(MTRDeviceResubscriptionScheduledHandler)resubscriptionScheduled;
- (void)writeAttributeWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID attributeID:(NSNumber *)attributeID value:(id)value timedWriteTimeout:(NSNumber *)timeoutMs queue:(dispatch_queue_t)queue completion:(MTRDeviceResponseHandler)completion;
- (void)writeAttributeWithEndpointId:(NSNumber *)endpointId clusterId:(NSNumber *)clusterId attributeId:(NSNumber *)attributeId value:(id)value timedWriteTimeout:(NSNumber *)timeoutMs clientQueue:(dispatch_queue_t)clientQueue completion:(MTRDeviceResponseHandler)completion;
@end

@implementation MTRBaseDevice

- (MTRBaseDevice)initWithPASEDevice:(void *)a3 controller:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTRBaseDevice;
  v8 = [(MTRBaseDevice *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_isPASEDevice = 1;
    v8->_nodeID = (*(uint64_t (**)(void *))(*(void *)a3 + 24))(a3);
    objc_storeStrong((id *)&v9->_deviceController, a4);
  }

  return v9;
}

- (MTRBaseDevice)initWithNodeID:(id)a3 controller:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MTRBaseDevice;
  v8 = [(MTRBaseDevice *)&v13 init];
  objc_super v11 = v8;
  if (v8)
  {
    v8->_isPASEDevice = 0;
    v8->_nodeID = objc_msgSend_unsignedLongLongValue(v6, v9, v10);
    objc_storeStrong((id *)&v11->_deviceController, a4);
  }

  return v11;
}

+ (MTRBaseDevice)deviceWithNodeID:(NSNumber *)nodeID controller:(MTRDeviceController *)controller
{
  v4 = objc_msgSend_baseDeviceForNodeID_(controller, a2, (uint64_t)nodeID);

  return (MTRBaseDevice *)v4;
}

- (MTRDeviceController_Concrete)concreteController
{
  v3 = objc_msgSend_deviceController(self, a2, v2);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (MTRDeviceController_Concrete *)v4;
}

- (MTRTransportType)sessionTransportType
{
  id v4 = objc_msgSend_concreteController(self, a2, v2);
  id v6 = v4;
  if (v4)
  {
    MTRTransportType v7 = objc_msgSend_sessionTransportTypeForDevice_(v4, v5, (uint64_t)self);
  }
  else
  {
    v8 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_ERROR, "Unable to determine session transport type for MTRBaseDevice created with an XPC controller", v10, 2u);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    MTRTransportType v7 = MTRTransportTypeUndefined;
  }

  return v7;
}

- (void)invalidateCASESession
{
  if ((objc_msgSend_isPASEDevice(self, a2, v2) & 1) == 0)
  {
    v8 = objc_msgSend_concreteController(self, v4, v5);
    if (v8)
    {
      v9 = NSNumber;
      uint64_t v10 = objc_msgSend_nodeID(self, v6, v7);
      v12 = objc_msgSend_numberWithUnsignedLongLong_(v9, v11, v10);
      objc_msgSend_invalidateCASESessionForNode_(v8, v13, (uint64_t)v12);
    }
    else
    {
      v14 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_ERROR, "Unable invalidate CASE session for MTRBaseDevice created with an XPC controller", v15, 2u);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
    }
  }
}

- (void)subscribeWithQueue:(dispatch_queue_t)queue params:(MTRSubscribeParams *)params clusterStateCacheContainer:(MTRClusterStateCacheContainer *)clusterStateCacheContainer attributeReportHandler:(MTRDeviceReportHandler)attributeReportHandler eventReportHandler:(MTRDeviceReportHandler)eventReportHandler errorHandler:(MTRDeviceErrorHandler)errorHandler subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished resubscriptionScheduled:(MTRDeviceResubscriptionScheduledHandler)resubscriptionScheduled
{
  v16 = queue;
  v17 = params;
  v37 = clusterStateCacheContainer;
  MTRDeviceReportHandler v18 = attributeReportHandler;
  MTRDeviceReportHandler v38 = eventReportHandler;
  MTRDeviceErrorHandler v19 = errorHandler;
  MTRSubscriptionEstablishedHandler v20 = subscriptionEstablished;
  MTRDeviceResubscriptionScheduledHandler v21 = resubscriptionScheduled;
  if (objc_msgSend_isPASEDevice(self, v22, v23))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2447D4B44;
    block[3] = &unk_265194E00;
    id v53 = v19;
    dispatch_async(v16, block);
    v26 = v53;
    v27 = v37;
  }
  else
  {
    v26 = objc_msgSend_concreteController(self, v24, v25);
    if (v26)
    {
      v30 = objc_msgSend_copy(v17, v28, v29);

      uint64_t v33 = objc_msgSend_nodeID(self, v31, v32);
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = sub_2447D4C4C;
      v39[3] = &unk_265195088;
      v40 = v16;
      id v44 = v19;
      v17 = v30;
      v41 = v17;
      v27 = v37;
      v42 = v37;
      id v45 = v18;
      id v46 = v38;
      id v47 = v21;
      id v48 = v20;
      v43 = self;
      objc_msgSend_getSessionForNode_completion_(v26, v34, v33, v39);
      v35 = (id *)&v40;
    }
    else
    {
      v36 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2446BD000, v36, OS_LOG_TYPE_ERROR, "Unable to create subscription for MTRBaseDevice created with an XPC controller", buf, 2u);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = sub_2447D4BC8;
      v49[3] = &unk_265194E00;
      v35 = &v50;
      id v50 = v19;
      dispatch_async(v16, v49);
      v27 = v37;
    }
  }
}

- (void)readAttributesWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID attributeID:(NSNumber *)attributeID params:(MTRReadParams *)params queue:(dispatch_queue_t)queue completion:(MTRDeviceResponseHandler)completion
{
  v22 = params;
  v14 = queue;
  MTRDeviceResponseHandler v15 = completion;
  v16 = (void *)MEMORY[0x263EFF8C0];
  MTRDeviceReportHandler v18 = objc_msgSend_requestPathWithEndpointID_clusterID_attributeID_(MTRAttributeRequestPath, v17, (uint64_t)endpointID, clusterID, attributeID);
  MTRSubscriptionEstablishedHandler v20 = objc_msgSend_arrayWithObject_(v16, v19, (uint64_t)v18);

  objc_msgSend_readAttributePaths_eventPaths_params_queue_completion_(self, v21, (uint64_t)v20, 0, v22, v14, v15);
}

- (void)_readKnownAttributeWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 params:(id)a6 queue:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  MTRDeviceResubscriptionScheduledHandler v21 = objc_msgSend_attributePathWithEndpointID_clusterID_attributeID_(MTRAttributePath, v20, (uint64_t)v14, v15, v16);
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  v28 = sub_2447D71B8;
  uint64_t v29 = &unk_2651950B0;
  id v22 = v19;
  id v30 = v21;
  id v31 = v22;
  id v23 = v21;
  v24 = (void *)MEMORY[0x2456969D0](&v26);
  objc_msgSend_readAttributesWithEndpointID_clusterID_attributeID_params_queue_completion_(self, v25, (uint64_t)v14, v15, v16, v17, v18, v24, v26, v27, v28, v29);
}

- (void)readAttributePaths:(NSArray *)attributePaths eventPaths:(NSArray *)eventPaths params:(MTRReadParams *)params queue:(dispatch_queue_t)queue completion:(MTRDeviceResponseHandler)completion
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v12 = attributePaths;
  objc_super v13 = eventPaths;
  id v14 = params;
  id v15 = queue;
  MTRDeviceResponseHandler v16 = completion;
  id v17 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v23 = self;
    __int16 v24 = 2112;
    uint64_t v25 = v12;
    __int16 v26 = 2112;
    uint64_t v27 = v13;
    _os_log_impl(&dword_2446BD000, v17, OS_LOG_TYPE_DEFAULT, "%@ readAttributePaths: %@, eventPaths: %@", buf, 0x20u);
  }

  if (sub_244CC4E58(2u))
  {
    MTRSubscriptionEstablishedHandler v20 = v12;
    MTRDeviceResubscriptionScheduledHandler v21 = v13;
    id v19 = self;
    sub_244CC4DE0(0, 2);
  }
  objc_msgSend_readAttributePaths_eventPaths_params_includeDataVersion_queue_completion_(self, v18, (uint64_t)v12, v13, v14, 0, v15, v16, v19, v20, v21);
}

- (void)readAttributePaths:(id)a3 eventPaths:(id)a4 params:(id)a5 includeDataVersion:(BOOL)a6 queue:(id)a7 completion:(id)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v18 = a8;
  if (v12 && objc_msgSend_count(v12, v16, v17))
  {
LABEL_6:
    id v19 = objc_alloc(MEMORY[0x263EFF8C0]);
    objc_msgSend_initWithArray_copyItems_(v19, v20, (uint64_t)v12, 1);
    if (!v13)
    {
      if (!v14) {
LABEL_12:
      }
        operator new();
LABEL_11:
      objc_msgSend_copy(v14, v21, v22);

      goto LABEL_12;
    }
LABEL_10:
    id v23 = objc_alloc(MEMORY[0x263EFF8C0]);
    objc_msgSend_initWithArray_copyItems_(v23, v24, (uint64_t)v13, 1);
    if (!v14) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v13 && objc_msgSend_count(v13, v16, v17))
  {
    if (!v12) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2447D78A0;
  block[3] = &unk_265194E00;
  id v26 = v18;
  dispatch_async(v15, block);
}

- (void)writeAttributeWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID attributeID:(NSNumber *)attributeID value:(id)value timedWriteTimeout:(NSNumber *)timeoutMs queue:(dispatch_queue_t)queue completion:(MTRDeviceResponseHandler)completion
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v15 = endpointID;
  MTRDeviceResponseHandler v16 = clusterID;
  uint64_t v17 = attributeID;
  id v18 = value;
  id v19 = timeoutMs;
  MTRSubscriptionEstablishedHandler v20 = queue;
  MTRDeviceResponseHandler v21 = completion;
  uint64_t v22 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    v37 = self;
    __int16 v38 = 2112;
    v39 = v15;
    __int16 v40 = 2048;
    uint64_t v41 = objc_msgSend_unsignedLongLongValue(v16, v23, v24);
    __int16 v42 = 2048;
    uint64_t v43 = objc_msgSend_unsignedLongLongValue(v17, v25, v26);
    __int16 v44 = 2112;
    id v45 = v18;
    _os_log_impl(&dword_2446BD000, v22, OS_LOG_TYPE_DEFAULT, "%@ write %@ 0x%llx 0x%llx: %@", buf, 0x34u);
  }

  if (sub_244CC4E58(2u))
  {
    uint64_t v29 = objc_msgSend_unsignedLongLongValue(v16, v27, v28);
    uint64_t v34 = objc_msgSend_unsignedLongLongValue(v17, v30, v31);
    id v35 = v18;
    uint64_t v32 = v15;
    uint64_t v33 = v29;
    sub_244CC4DE0(0, 2);
  }
  objc_msgSend__writeAttributeWithEndpointID_clusterID_attributeID_value_timedWriteTimeout_queue_completion_(self, v27, (uint64_t)v15, v16, v17, v18, v19, v20, v21, v32, v33, v34, v35);
}

- (void)_writeAttributeWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 value:(id)a6 timedWriteTimeout:(id)a7 queue:(id)a8 completion:(id)a9
{
  a3;
  a4;
  a5;
  a6;
  id v14 = a7;
  id v15 = a8;
  id v16 = a9;
  operator new();
}

- (void)invokeCommandWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID commandID:(NSNumber *)commandID commandFields:(id)commandFields timedInvokeTimeout:(NSNumber *)timeoutMs queue:(dispatch_queue_t)queue completion:(MTRDeviceResponseHandler)completion
{
  char v9 = 1;
  objc_msgSend__invokeCommandWithEndpointID_clusterID_commandID_commandFields_timedInvokeTimeout_serverSideProcessingTimeout_logCall_queue_completion_(self, a2, (uint64_t)endpointID, clusterID, commandID, commandFields, timeoutMs, 0, v9, queue, completion);
}

- (void)_invokeCommandWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 commandFields:(id)a6 timedInvokeTimeout:(id)a7 serverSideProcessingTimeout:(id)a8 logCall:(BOOL)a9 queue:(id)a10 completion:(id)a11
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  a10;
  id v23 = a11;
  if (v17)
  {
    uint64_t v26 = objc_msgSend_copy(v17, v24, v25);

    id v17 = (id)v26;
  }
  if (v18)
  {
    uint64_t v27 = objc_msgSend_copy(v18, v24, v25);

    id v18 = (id)v27;
  }
  if (v19)
  {
    uint64_t v28 = objc_msgSend_copy(v19, v24, v25);

    id v19 = (id)v28;
  }
  if (v20)
  {
    uint64_t v29 = objc_msgSend_copy(v20, v24, v25);

    id v20 = (id)v29;
  }
  id v30 = objc_msgSend_copy(v22, v24, v25);

  if (v30)
  {
    sub_2446BE6EC(v30, &unk_26F9C8638, &unk_26F9C8650);
    objc_claimAutoreleasedReturnValue();
  }
  uint64_t v33 = objc_msgSend_copy(v21, v31, v32);

  if (v33)
  {
    sub_2446BE6EC(v33, &unk_26F9C8668, &unk_26F9C8650);
    objc_claimAutoreleasedReturnValue();
  }
  if (a9)
  {
    uint64_t v34 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      __int16 v44 = self;
      __int16 v45 = 2112;
      id v46 = v17;
      __int16 v47 = 2048;
      uint64_t v48 = objc_msgSend_unsignedLongLongValue(v18, v35, v36);
      __int16 v49 = 2048;
      uint64_t v50 = objc_msgSend_unsignedLongLongValue(v19, v37, v38);
      __int16 v51 = 2112;
      id v52 = v20;
      _os_log_impl(&dword_2446BD000, v34, OS_LOG_TYPE_DEFAULT, "%@ invoke %@ 0x%llx 0x%llx: %@", buf, 0x34u);
    }

    if (sub_244CC4E58(2u))
    {
      objc_msgSend_unsignedLongLongValue(v18, v39, v40);
      objc_msgSend_unsignedLongLongValue(v19, v41, v42);
      sub_244CC4DE0(0, 2);
    }
  }
  operator new();
}

- (void)_invokeKnownCommandWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 commandPayload:(id)a6 timedInvokeTimeout:(id)a7 serverSideProcessingTimeout:(id)a8 responseClass:(Class)a9 queue:(id)a10 completion:(id)a11
{
  id v29 = a3;
  id v28 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a10;
  id v21 = a11;
  v35[0] = 0;
  id v23 = objc_msgSend__encodeAsDataValue_(a6, v22, (uint64_t)v35);
  id v24 = v35[0];
  if (v23)
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = sub_2447DA39C;
    v30[3] = &unk_265195150;
    v31[1] = a9;
    v31[0] = v21;
    uint64_t v25 = (void *)MEMORY[0x2456969D0](v30);
    objc_msgSend__invokeCommandWithEndpointID_clusterID_commandID_commandFields_timedInvokeTimeout_serverSideProcessingTimeout_logCall_queue_completion_(self, v26, (uint64_t)v29, v28, v17, v23, v18, v19, 1, v20, v25);
    uint64_t v27 = (id *)v31;
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2447DA384;
    block[3] = &unk_265194F48;
    uint64_t v27 = &v34;
    id v34 = v21;
    id v33 = v24;
    dispatch_async(v20, block);
    uint64_t v25 = v33;
  }
}

- (void)subscribeToAttributesWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID attributeID:(NSNumber *)attributeID params:(MTRSubscribeParams *)params queue:(dispatch_queue_t)queue reportHandler:(MTRDeviceResponseHandler)reportHandler subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished
{
  id v24 = params;
  id v15 = queue;
  MTRDeviceResponseHandler v16 = reportHandler;
  MTRSubscriptionEstablishedHandler v17 = subscriptionEstablished;
  id v18 = (void *)MEMORY[0x263EFF8C0];
  id v20 = objc_msgSend_requestPathWithEndpointID_clusterID_attributeID_(MTRAttributeRequestPath, v19, (uint64_t)endpointID, clusterID, attributeID);
  id v22 = objc_msgSend_arrayWithObject_(v18, v21, (uint64_t)v20);

  objc_msgSend_subscribeToAttributePaths_eventPaths_params_queue_reportHandler_subscriptionEstablished_resubscriptionScheduled_(self, v23, (uint64_t)v22, 0, v24, v15, v16, v17, 0);
}

- (void)_subscribeToKnownAttributeWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 params:(id)a6 queue:(id)a7 reportHandler:(id)a8 subscriptionEstablished:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v22 = objc_msgSend_attributePathWithEndpointID_clusterID_attributeID_(MTRAttributePath, v21, (uint64_t)v14, v15, v16);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = sub_2447DA7E4;
  v28[3] = &unk_2651950B0;
  id v23 = v19;
  id v29 = v22;
  id v30 = v23;
  id v24 = v22;
  uint64_t v25 = (void *)MEMORY[0x2456969D0](v28);
  objc_msgSend_subscribeToAttributesWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(self, v26, (uint64_t)v14, v15, v16, v17, v18, v25, v20);
}

- (void)subscribeToAttributePaths:(NSArray *)attributePaths eventPaths:(NSArray *)eventPaths params:(MTRSubscribeParams *)params queue:(dispatch_queue_t)queue reportHandler:(MTRDeviceResponseHandler)reportHandler subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished resubscriptionScheduled:(MTRDeviceResubscriptionScheduledHandler)resubscriptionScheduled
{
  id v15 = attributePaths;
  id v16 = eventPaths;
  id v17 = params;
  id v18 = queue;
  MTRDeviceResponseHandler v19 = reportHandler;
  MTRSubscriptionEstablishedHandler v20 = subscriptionEstablished;
  MTRDeviceResubscriptionScheduledHandler v23 = resubscriptionScheduled;
  if ((!v15 || !objc_msgSend_count(v15, v21, v22)) && (!v16 || !objc_msgSend_count(v16, v21, v22)))
  {
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = sub_2447DAF40;
    v56[3] = &unk_265194E00;
    id v57 = v19;
    dispatch_async(v18, v56);
    uint64_t v26 = v57;
    goto LABEL_23;
  }
  if (!objc_msgSend_isPASEDevice(self, v21, v22))
  {
    uint64_t v26 = objc_msgSend_concreteController(self, v24, v25);
    if (!v26)
    {
      id v34 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2446BD000, v34, OS_LOG_TYPE_ERROR, "Unable to create subscription for MTRBaseDevice created with an XPC controller", buf, 2u);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
      v51[0] = MEMORY[0x263EF8330];
      v51[1] = 3221225472;
      v51[2] = sub_2447DB03C;
      v51[3] = &unk_265194E00;
      id v52 = v19;
      dispatch_async(v18, v51);
      id v35 = v52;
      goto LABEL_22;
    }
    uint64_t v41 = v20;
    if (v15)
    {
      id v29 = objc_alloc(MEMORY[0x263EFF8C0]);
      uint64_t v40 = objc_msgSend_initWithArray_copyItems_(v29, v30, (uint64_t)v15, 1);
      if (v16) {
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v40 = 0;
      if (v16)
      {
LABEL_11:
        id v31 = objc_alloc(MEMORY[0x263EFF8C0]);
        id v33 = objc_msgSend_initWithArray_copyItems_(v31, v32, (uint64_t)v16, 1);
        if (!v17) {
          goto LABEL_21;
        }
        goto LABEL_20;
      }
    }
    id v33 = 0;
    if (!v17)
    {
LABEL_21:
      uint64_t v37 = objc_msgSend_nodeID(self, v27, v28);
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = sub_2447DB0C4;
      v42[3] = &unk_265195178;
      uint64_t v43 = v18;
      id v48 = v19;
      id v49 = v41;
      id v50 = v23;
      __int16 v44 = self;
      id v35 = v40;
      id v45 = v35;
      id v38 = v33;
      id v46 = v38;
      id v17 = v17;
      __int16 v47 = v17;
      objc_msgSend_getSessionForNode_completion_(v26, v39, v37, v42);

      MTRSubscriptionEstablishedHandler v20 = v41;
LABEL_22:

      goto LABEL_23;
    }
LABEL_20:
    uint64_t v36 = objc_msgSend_copy(v17, v27, v28);

    id v17 = (MTRSubscribeParams *)v36;
    goto LABEL_21;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2447DAFB4;
  block[3] = &unk_265194E00;
  id v55 = v19;
  dispatch_async(v18, block);
  uint64_t v26 = v55;
LABEL_23:
}

- (void)deregisterReportHandlersWithQueue:(dispatch_queue_t)queue completion:(dispatch_block_t)completion
{
  id v6 = queue;
  dispatch_block_t v7 = completion;
  v8 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_INFO, "Unexpected call to deregister report handlers", buf, 2u);
  }

  if (sub_244CC4E58(3u)) {
    sub_244CC4DE0(0, 3);
  }
  objc_super v11 = objc_msgSend_deviceController(self, v9, v10);
  uint64_t v14 = objc_msgSend_nodeID(self, v12, v13);
  id v15 = v11;
  id v16 = v6;
  id v18 = v7;
  if (qword_268EBE918 != -1) {
    dispatch_once(&qword_268EBE918, &unk_26F944D20);
  }
  MTRDeviceResponseHandler v19 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v17, v14);
  objc_msgSend_lock((void *)qword_268EBE908, v20, v21);
  MTRDeviceResubscriptionScheduledHandler v23 = objc_msgSend_objectForKeyedSubscript_((void *)qword_268EBE910, v22, (uint64_t)v19);
  objc_msgSend_removeObjectForKey_((void *)qword_268EBE910, v24, (uint64_t)v19);
  objc_msgSend_unlock((void *)qword_268EBE908, v25, v26);
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = sub_2447E5C00;
  v43[3] = &unk_265195238;
  id v27 = v23;
  id v44 = v27;
  id v28 = v18;
  id v46 = v28;
  id v29 = v16;
  id v45 = v29;
  *(void *)buf = MEMORY[0x263EF8330];
  uint64_t v36 = 3221225472;
  uint64_t v37 = sub_2447E5D28;
  id v38 = &unk_265195260;
  id v30 = v27;
  id v39 = v30;
  id v31 = v19;
  id v40 = v31;
  uint64_t v32 = v29;
  uint64_t v41 = v32;
  id v33 = v28;
  id v42 = v33;
  objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(v15, v34, (uint64_t)v43, buf);
}

- (void)_openCommissioningWindowWithSetupPasscode:(id)a3 discriminator:(id)a4 duration:(id)a5 queue:(id)a6 completion:(id)a7
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  *(_DWORD *)buf = 0;
  *(void *)&v65[4] = "dwnfw_open_pairing_window";
  char v66 = 0;
  sub_244D7E78C((uint64_t)buf);
  if (!objc_msgSend_isPASEDevice(self, v17, v18))
  {
    uint64_t v22 = objc_msgSend_concreteController(self, v19, v20);
    if (!v22)
    {
      id v35 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2446BD000, v35, OS_LOG_TYPE_ERROR, "Can't open a commissioning window via MTRBaseDevice created with an XPC controller", buf, 2u);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
      v60[0] = MEMORY[0x263EF8330];
      v60[1] = 3221225472;
      v60[2] = sub_2447DC92C;
      v60[3] = &unk_265194E00;
      id v33 = &v61;
      id v61 = v16;
      id v34 = v60;
      goto LABEL_25;
    }
    unint64_t v27 = objc_msgSend_unsignedLongLongValue(v14, v23, v24);
    if (v27 >= 0x10000)
    {
      uint64_t v36 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)v65 = v27;
        _os_log_impl(&dword_2446BD000, v36, OS_LOG_TYPE_ERROR, "Error: Duration %llu is too large.", buf, 0xCu);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
      v58[0] = MEMORY[0x263EF8330];
      v58[1] = 3221225472;
      v58[2] = sub_2447DC9E4;
      v58[3] = &unk_265194E00;
      id v33 = &v59;
      id v59 = v16;
      id v34 = v58;
      goto LABEL_25;
    }
    unint64_t v31 = objc_msgSend_unsignedLongLongValue(v13, v25, v26);
    if (v31 >= 0x1000)
    {
      uint64_t v32 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)v65 = v31;
        *(_WORD *)&v65[8] = 1024;
        *(_DWORD *)&v65[10] = 4095;
        _os_log_impl(&dword_2446BD000, v32, OS_LOG_TYPE_ERROR, "Error: Discriminator %llu is too large. Max value %d", buf, 0x12u);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
      v56[0] = MEMORY[0x263EF8330];
      v56[1] = 3221225472;
      v56[2] = sub_2447DCAA0;
      v56[3] = &unk_265194E00;
      id v33 = &v57;
      id v57 = v16;
      id v34 = v56;
LABEL_25:
      dispatch_async(v15, v34);
LABEL_26:

      goto LABEL_27;
    }
    if (v12)
    {
      unint64_t v43 = objc_msgSend_unsignedLongLongValue(v12, v28, v29);
      if (HIDWORD(v43) || !sub_244D82360(v43))
      {
        uint64_t v37 = sub_244CC8484(0, "NotSpecified");
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)v65 = v43;
          _os_log_impl(&dword_2446BD000, v37, OS_LOG_TYPE_ERROR, "Error: Setup passcode %llu is not valid", buf, 0xCu);
        }

        if (sub_244CC4E58(1u)) {
          sub_244CC4DE0(0, 1);
        }
        v54[0] = MEMORY[0x263EF8330];
        v54[1] = 3221225472;
        v54[2] = sub_2447DCB5C;
        v54[3] = &unk_265194E00;
        id v33 = &v55;
        id v55 = v16;
        id v34 = v54;
        goto LABEL_25;
      }
      id v42 = v12;
      char v41 = 1;
    }
    else
    {
      char v41 = 0;
      id v42 = 0;
      LODWORD(v43) = v30;
    }
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3321888768;
    v47[2] = sub_2447DCC18;
    v47[3] = &unk_26F944C50;
    id v38 = v15;
    v48[0] = v38;
    id v39 = v16;
    v48[1] = self;
    id v49 = v39;
    unint64_t v50 = v27;
    unint64_t v51 = v31;
    char v52 = v41;
    if (v42) {
      int v53 = v43;
    }
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = sub_2447DD4F0;
    v44[3] = &unk_265194FC0;
    id v45 = v38;
    id v46 = v39;
    objc_msgSend_asyncGetCommissionerOnMatterQueue_errorHandler_(v22, v40, (uint64_t)v47, v44);

    id v12 = v42;
    id v33 = (id *)v48;
    goto LABEL_26;
  }
  uint64_t v21 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2446BD000, v21, OS_LOG_TYPE_ERROR, "Can't open a commissioning window over PASE", buf, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0, 1);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2447DC874;
  block[3] = &unk_265194E00;
  id v63 = v16;
  dispatch_async(v15, block);
  uint64_t v22 = v63;
LABEL_27:
}

- (void)openCommissioningWindowWithSetupPasscode:(NSNumber *)setupPasscode discriminator:(NSNumber *)discriminator duration:(NSNumber *)duration queue:(dispatch_queue_t)queue completion:(MTRDeviceOpenCommissioningWindowHandler)completion
{
}

- (void)openCommissioningWindowWithDiscriminator:(NSNumber *)discriminator duration:(NSNumber *)duration queue:(dispatch_queue_t)queue completion:(MTRDeviceOpenCommissioningWindowHandler)completion
{
}

- (void)readEventsWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID eventID:(NSNumber *)eventID params:(MTRReadParams *)params queue:(dispatch_queue_t)queue completion:(MTRDeviceResponseHandler)completion
{
  uint64_t v22 = params;
  id v14 = queue;
  MTRDeviceResponseHandler v15 = completion;
  id v16 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v18 = objc_msgSend_requestPathWithEndpointID_clusterID_eventID_(MTREventRequestPath, v17, (uint64_t)endpointID, clusterID, eventID);
  uint64_t v20 = objc_msgSend_arrayWithObject_(v16, v19, (uint64_t)v18);

  objc_msgSend_readAttributePaths_eventPaths_params_queue_completion_(self, v21, 0, v20, v22, v14, v15);
}

- (void)subscribeToEventsWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID eventID:(NSNumber *)eventID params:(MTRSubscribeParams *)params queue:(dispatch_queue_t)queue reportHandler:(MTRDeviceResponseHandler)reportHandler subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished
{
  uint64_t v24 = params;
  MTRDeviceResponseHandler v15 = queue;
  MTRDeviceResponseHandler v16 = reportHandler;
  MTRSubscriptionEstablishedHandler v17 = subscriptionEstablished;
  uint64_t v18 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v20 = objc_msgSend_requestPathWithEndpointID_clusterID_eventID_(MTREventRequestPath, v19, (uint64_t)endpointID, clusterID, eventID);
  uint64_t v22 = objc_msgSend_arrayWithObject_(v18, v21, (uint64_t)v20);

  objc_msgSend_subscribeToAttributePaths_eventPaths_params_queue_reportHandler_subscriptionEstablished_resubscriptionScheduled_(self, v23, 0, v22, v24, v15, v16, v17, 0);
}

+ (id)eventReportForHeader:(const EventHeader *)a3 andData:(id)a4
{
  v49[2] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [MTREventPath alloc];
  uint64_t v10 = objc_msgSend_initWithPath_(v6, v7, (uint64_t)a3);
  if (!v5)
  {
    MTRDeviceResponseHandler v15 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v10;
      _os_log_impl(&dword_2446BD000, v15, OS_LOG_TYPE_ERROR, "%@ could not decode event data", buf, 0xCu);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    v48[1] = @"error";
    v49[0] = v10;
    v48[0] = @"eventPath";
    LODWORD(v36) = 47;
    *((void *)&v36 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTRBaseDevice.mm";
    int v37 = 2139;
    MTRDeviceResponseHandler v16 = sub_244B26908((uint64_t)MTRError, &v36);
    v49[1] = v16;
    uint64_t v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v17, (uint64_t)v49, v48, 2);
    goto LABEL_23;
  }
  if (a3->var3.var0 == 1)
  {
    objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x263EFF910], v8, v9, (double)(a3->var3.var1 % 0x3E8) / 1000.0 + (double)(a3->var3.var1 / 0x3E8));
    v13 = objc_super v11 = @"eventTimestampDate";
    id v14 = &unk_26F9C86C8;
    goto LABEL_11;
  }
  if (a3->var3.var0)
  {
    uint64_t v25 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int var0 = a3->var3.var0;
      *(_DWORD *)buf = 138412546;
      id v45 = v10;
      __int16 v46 = 1024;
      int v47 = var0;
      _os_log_impl(&dword_2446BD000, v25, OS_LOG_TYPE_ERROR, "%@ Unsupported event timestamp type %u - ignoring", buf, 0x12u);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    v42[1] = @"error";
    v43[0] = v10;
    v42[0] = @"eventPath";
    LODWORD(v34) = 108;
    *((void *)&v34 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTRBaseDevice.mm";
    int v35 = 2156;
    MTRDeviceResponseHandler v16 = sub_244B26908((uint64_t)MTRError, &v34);
    v43[1] = v16;
    uint64_t v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)v43, v42, 2);
LABEL_23:
    uint64_t v24 = (void *)v18;
    goto LABEL_30;
  }
  objc_msgSend_numberWithDouble_(NSNumber, v8, v9, (double)(a3->var3.var1 % 0x3E8) / 1000.0 + (double)(a3->var3.var1 / 0x3E8));
  v13 = objc_super v11 = @"eventSystemUpTime";
  id v14 = &unk_26F9C86B0;
LABEL_11:
  if (a3->var2 >= 3u)
  {
    id v28 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      int var2 = a3->var2;
      *(_DWORD *)buf = 138412546;
      id v45 = v10;
      __int16 v46 = 1024;
      int v47 = var2;
      _os_log_impl(&dword_2446BD000, v28, OS_LOG_TYPE_ERROR, "%@ Unsupported event priority %u - ignoring", buf, 0x12u);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    v41[0] = v10;
    v40[0] = @"eventPath";
    v40[1] = @"error";
    LODWORD(v32) = 108;
    *((void *)&v32 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTRBaseDevice.mm";
    int v33 = 2161;
    uint64_t v20 = sub_244B26908((uint64_t)MTRError, &v32);
    v41[1] = v20;
    uint64_t v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v30, (uint64_t)v41, v40, 2);
  }
  else
  {
    v38[0] = @"eventPath";
    v38[1] = @"data";
    v39[0] = v10;
    v39[1] = v5;
    v38[2] = @"eventNumber";
    uint64_t v20 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v12, a3->var1);
    v39[2] = v20;
    v38[3] = @"eventPriority";
    uint64_t v21 = 1;
    if (a3->var2 != 1) {
      uint64_t v21 = 2;
    }
    if (a3->var2) {
      objc_msgSend_numberWithUnsignedInteger_(NSNumber, v19, v21);
    }
    else {
    uint64_t v22 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v19, 0);
    }
    v39[3] = v22;
    void v39[4] = v14;
    v38[4] = @"eventTimeType";
    v38[5] = v11;
    v39[5] = v13;
    uint64_t v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v23, (uint64_t)v39, v38, 6);
  }
  MTRDeviceResponseHandler v16 = (void *)v13;
LABEL_30:

  return v24;
}

+ (PacketBufferHandle)_responseDataForCommand:(id)a3 clusterID:(unsigned int)a4 commandID:(unsigned int)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a5;
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = v6;
  id v11 = a3;
  uint64_t v12 = objc_opt_class();
  if (sub_2447DE310(v11, @"commandPath", v12, @"response-value command path is not an MTRCommandPath.", a6))
  {
    id v14 = objc_msgSend_objectForKeyedSubscript_(v11, v13, @"commandPath");
    MTRSubscriptionEstablishedHandler v17 = objc_msgSend_cluster(v14, v15, v16);
    MTRDeviceResponseHandler v19 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v18, v9);
    char isEqualToNumber = objc_msgSend_isEqualToNumber_(v17, v20, (uint64_t)v19);

    if (isEqualToNumber)
    {
      uint64_t v24 = objc_msgSend_command(v14, v22, v23);
      uint64_t v26 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v25, v8);
      char v28 = objc_msgSend_isEqualToNumber_(v24, v27, (uint64_t)v26);

      if (v28)
      {
        uint64_t v31 = objc_opt_class();
        if (sub_2447DE310(v11, @"data", v31, @"response-value data is not a data-value dictionary.", a6))
        {
          int v33 = objc_msgSend_objectForKeyedSubscript_(v11, v32, @"data");
          sub_244CC8F5C(0x62FuLL, 0, &v61);
          if (!v61)
          {
            int v58 = 11;
            id v59 = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRBaseDevice.mm";
            int v60 = 2207;
            sub_2447DE624(@"Unable to allocate encoding buffer", (uint64_t)&v58, a6);
            *uint64_t v10 = 0;
LABEL_19:
            sub_244794634(&v61);

            goto LABEL_12;
          }
          sub_244CB62B8((uint64_t)v53);
          id v55 = 0;
          v56 = 0;
          v54 = &unk_26F9536C8;
          char v57 = 0;
          sub_2447945A0((uint64_t)&v54, &v61, 0);
          sub_244CB6318((uint64_t)v53, (uint64_t)&v54, 0xFFFFFFFF, (uint64_t)&v62);
          long long v62 = 0uLL;
          uint64_t v63 = 0;
          sub_2447D6DCC(v33, v53, 256, &v62);
          if (v62)
          {
            long long v51 = v62;
            uint64_t v52 = v63;
            sub_2447DE624(@"Unable to encode data-value to TLV", (uint64_t)&v51, a6);
          }
          else
          {
            sub_2446DE160((uint64_t)v53, &v61, &v49);
            long long v62 = v49;
            uint64_t v63 = v50;
            if (!v49)
            {
              *uint64_t v10 = v61;
              id v61 = 0;
              goto LABEL_18;
            }
            long long v47 = v62;
            uint64_t v48 = v63;
            sub_2447DE624(@"Unable to encode data-value to TLV", (uint64_t)&v47, a6);
          }
          *uint64_t v10 = 0;
LABEL_18:
          v54 = &unk_26F9536C8;
          sub_244794634(&v56);
          sub_244794634(&v55);
          goto LABEL_19;
        }
      }
      else
      {
        id v40 = NSString;
        char v41 = objc_msgSend_command(v14, v29, v30);
        unint64_t v43 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v42, v8);
        id v45 = objc_msgSend_stringWithFormat_(v40, v44, @"Expected command id %@ but got %@", v41, v43);
        sub_2447DE428(v45, 13, a6);
      }
    }
    else
    {
      long long v34 = NSString;
      int v35 = objc_msgSend_cluster(v14, v22, v23);
      int v37 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v36, v9);
      id v39 = objc_msgSend_stringWithFormat_(v34, v38, @"Expected cluster id %@ but got %@", v35, v37);
      sub_2447DE428(v39, 13, a6);
    }
    *uint64_t v10 = 0;
LABEL_12:

    goto LABEL_13;
  }
  *uint64_t v10 = 0;
LABEL_13:

  return v46;
}

- (void)downloadLogOfType:(int64_t)a3 timeout:(double)a4 queue:(id)a5 completion:(id)a6
{
  uint64_t v10 = a5;
  id v11 = a6;
  MTRDeviceResponseHandler v15 = objc_msgSend_concreteController(self, v12, v13);
  if (v15)
  {
    uint64_t v16 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v14, self->_nodeID);
    objc_msgSend_downloadLogFromNodeWithID_type_timeout_queue_completion_(v15, v17, (uint64_t)v16, a3, v10, v11, a4);
  }
  else
  {
    uint64_t v18 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2446BD000, v18, OS_LOG_TYPE_ERROR, "Can't download logs via MTRBaseDevice created with an XPC controller", buf, 2u);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2447DE98C;
    block[3] = &unk_265194E00;
    id v20 = v11;
    dispatch_async(v10, block);
  }
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_compressedFabricID(self->_deviceController, v6, v7);
  uint64_t v11 = objc_msgSend_unsignedLongLongValue(v8, v9, v10);
  uint64_t v13 = objc_msgSend_stringWithFormat_(v3, v12, @"<%@: %p, node: %016llX-%016llX (%llu)>", v5, self, v11, self->_nodeID, self->_nodeID);

  return v13;
}

- (BOOL)isPASEDevice
{
  return self->_isPASEDevice;
}

- (MTRDeviceController)deviceController
{
  return self->_deviceController;
}

- (unint64_t)nodeID
{
  return self->_nodeID;
}

- (void).cxx_destruct
{
}

- (void)subscribeWithQueue:(dispatch_queue_t)queue minInterval:(uint16_t)minInterval maxInterval:(uint16_t)maxInterval params:(MTRSubscribeParams *)params cacheContainer:(MTRAttributeCacheContainer *)attributeCacheContainer attributeReportHandler:(MTRDeviceReportHandler)attributeReportHandler eventReportHandler:(MTRDeviceReportHandler)eventReportHandler errorHandler:(MTRDeviceErrorHandler)errorHandler subscriptionEstablished:(dispatch_block_t)subscriptionEstablishedHandler resubscriptionScheduled:(MTRDeviceResubscriptionScheduledHandler)resubscriptionScheduledHandler
{
  uint64_t v15 = maxInterval;
  uint64_t v16 = minInterval;
  char v41 = queue;
  id v42 = attributeCacheContainer;
  MTRDeviceReportHandler v17 = attributeReportHandler;
  MTRDeviceReportHandler v18 = eventReportHandler;
  MTRDeviceErrorHandler v19 = errorHandler;
  dispatch_block_t v20 = subscriptionEstablishedHandler;
  MTRDeviceResubscriptionScheduledHandler v21 = resubscriptionScheduledHandler;
  uint64_t v25 = objc_msgSend_copy(params, v22, v23);
  if (v25)
  {
    uint64_t v26 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v24, v16);
    objc_msgSend_setMinInterval_(v25, v27, (uint64_t)v26);

    uint64_t v29 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v28, v15);
    objc_msgSend_setMaxInterval_(v25, v30, (uint64_t)v29);
  }
  else
  {
    uint64_t v31 = [MTRSubscribeParams alloc];
    uint64_t v29 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v32, v16);
    long long v34 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v33, v15);
    uint64_t v25 = objc_msgSend_initWithMinInterval_maxInterval_(v31, v35, (uint64_t)v29, v34);
  }
  id v38 = objc_msgSend_realContainer(v42, v36, v37);
  objc_msgSend_subscribeWithQueue_params_clusterStateCacheContainer_attributeReportHandler_eventReportHandler_errorHandler_subscriptionEstablished_resubscriptionScheduled_(self, v39, (uint64_t)v41, v25, v38, v17, v18, v19, v20, v21);
}

- (void)writeAttributeWithEndpointId:(NSNumber *)endpointId clusterId:(NSNumber *)clusterId attributeId:(NSNumber *)attributeId value:(id)value timedWriteTimeout:(NSNumber *)timeoutMs clientQueue:(dispatch_queue_t)clientQueue completion:(MTRDeviceResponseHandler)completion
{
}

- (void)invokeCommandWithEndpointId:(NSNumber *)endpointId clusterId:(NSNumber *)clusterId commandId:(NSNumber *)commandId commandFields:(id)commandFields timedInvokeTimeout:(NSNumber *)timeoutMs clientQueue:(dispatch_queue_t)clientQueue completion:(MTRDeviceResponseHandler)completion
{
}

- (void)subscribeAttributeWithEndpointId:(NSNumber *)endpointId clusterId:(NSNumber *)clusterId attributeId:(NSNumber *)attributeId minInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params clientQueue:(dispatch_queue_t)clientQueue reportHandler:(MTRDeviceResponseHandler)reportHandler subscriptionEstablished:(dispatch_block_t)subscriptionEstablishedHandler
{
  int v33 = endpointId;
  MTRDeviceReportHandler v17 = clusterId;
  MTRDeviceReportHandler v18 = attributeId;
  MTRDeviceErrorHandler v19 = minInterval;
  dispatch_block_t v20 = maxInterval;
  MTRDeviceResubscriptionScheduledHandler v21 = clientQueue;
  MTRDeviceResponseHandler v22 = reportHandler;
  dispatch_block_t v23 = subscriptionEstablishedHandler;
  uint64_t v26 = objc_msgSend_copy(params, v24, v25);
  char v28 = v26;
  if (v26)
  {
    objc_msgSend_setMinInterval_(v26, v27, (uint64_t)v19);
    objc_msgSend_setMaxInterval_(v28, v29, (uint64_t)v20);
  }
  else
  {
    uint64_t v31 = [MTRSubscribeParams alloc];
    char v28 = objc_msgSend_initWithMinInterval_maxInterval_(v31, v32, (uint64_t)v19, v20);
  }
  objc_msgSend_subscribeToAttributesWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(self, v30, (uint64_t)v33, v17, v18, v28, v21, v22, v23);
}

- (void)deregisterReportHandlersWithClientQueue:(dispatch_queue_t)queue completion:(dispatch_block_t)completion
{
}

@end