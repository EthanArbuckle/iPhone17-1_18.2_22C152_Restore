@interface MTRDevice_XPC
- (BOOL)deviceCachePrimed;
- (MTRDevice_XPC)initWithNodeID:(id)a3 controller:(id)a4;
- (NSDictionary)_internalState;
- (NSString)description;
- (id)estimatedStartTime;
- (id)estimatedSubscriptionLatency;
- (id)readAttributePaths:(id)a3;
- (id)readAttributeWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 params:(id)a6;
- (unint64_t)state;
- (void)_invokeCommandWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 commandFields:(id)a6 expectedValues:(id)a7 expectedValueInterval:(id)a8 timedInvokeTimeout:(id)a9 serverSideProcessingTimeout:(id)a10 queue:(id)a11 completion:(id)a12;
- (void)_setInternalState:(id)a3;
- (void)dealloc;
- (void)device:(id)a3 internalStateUpdated:(id)a4;
- (void)device:(id)a3 receivedAttributeReport:(id)a4;
- (void)device:(id)a3 receivedEventReport:(id)a4;
- (void)device:(id)a3 stateChanged:(unint64_t)a4;
- (void)deviceBecameActive:(id)a3;
- (void)deviceCachePrimed:(id)a3;
- (void)deviceConfigurationChanged:(id)a3;
- (void)downloadLogOfType:(int64_t)a3 timeout:(double)a4 queue:(id)a5 completion:(id)a6;
- (void)writeAttributeWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 value:(id)a6 expectedValueInterval:(id)a7 timedWriteTimeout:(id)a8;
@end

@implementation MTRDevice_XPC

- (MTRDevice_XPC)initWithNodeID:(id)a3 controller:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MTRDevice_XPC;
  return (MTRDevice_XPC *)[(MTRDevice *)&v5 initForSubclassesWithNodeID:a3 controller:a4];
}

- (void)dealloc
{
  objc_msgSend__setInternalState_(self, a2, 0);
  v3.receiver = self;
  v3.super_class = (Class)MTRDevice_XPC;
  [(MTRDevice *)&v3 dealloc];
}

- (NSString)description
{
  v4 = objc_msgSend__internalState(self, a2, v2);
  v6 = objc_msgSend_objectForKey_(v4, v5, @"MTRDeviceInternalPropertyNetworkFeatures");

  v46 = v6;
  if (v6)
  {
    if (objc_msgSend_unsignedLongLongValue(v6, v7, v8)) {
      v9 = @"YES";
    }
    else {
      v9 = @"NO";
    }
    v10 = v9;
    if ((objc_msgSend_unsignedLongLongValue(v6, v11, v12) & 2) != 0) {
      v13 = @"YES";
    }
    else {
      v13 = @"NO";
    }
    v14 = v13;
  }
  else
  {
    v14 = @"NO";
    v10 = @"NO";
  }
  v15 = NSString;
  v16 = (objc_class *)objc_opt_class();
  v45 = NSStringFromClass(v16);
  v47 = v14;
  v44 = objc_msgSend_compressedFabricID(self->super._deviceController, v17, v18);
  uint64_t v21 = objc_msgSend_unsignedLongLongValue(v44, v19, v20);
  uint64_t v24 = objc_msgSend_unsignedLongLongValue(self->super._nodeID, v22, v23);
  uint64_t v27 = objc_msgSend_unsignedLongLongValue(self->super._nodeID, v25, v26);
  v43 = objc_msgSend__internalState(self, v28, v29);
  v42 = objc_msgSend_objectForKey_(v43, v30, @"MTRDeviceInternalStateKeyVendorID");
  v41 = objc_msgSend__internalState(self, v31, v32);
  v34 = objc_msgSend_objectForKey_(v41, v33, @"MTRDeviceInternalStateKeyProductID");
  v37 = objc_msgSend_uniqueIdentifier(self->super._deviceController, v35, v36);
  v39 = objc_msgSend_stringWithFormat_(v15, v38, @"<%@: %p, node: %016llX-%016llX (%llu), VID: %@, PID: %@, WiFi: %@, Thread: %@, controller: %@>", v45, self, v21, v24, v27, v42, v34, v10, v47, v37);

  return (NSString *)v39;
}

- (void)device:(id)a3 stateChanged:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v6 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[MTRDevice_XPC device:stateChanged:]";
    _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (sub_244CC4E58(2u))
  {
    uint64_t v8 = "-[MTRDevice_XPC device:stateChanged:]";
    sub_244CC4DE0(0, 2);
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_244B98BCC;
  v9[3] = &unk_265199E28;
  v9[4] = self;
  v9[5] = a4;
  objc_msgSend__lockAndCallDelegatesWithBlock_(self, v7, (uint64_t)v9, v8);
}

- (void)device:(id)a3 receivedAttributeReport:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v12 = "-[MTRDevice_XPC device:receivedAttributeReport:]";
    _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(0, 2);
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_244B98D64;
  v9[3] = &unk_265199E50;
  v9[4] = self;
  id v7 = v5;
  id v10 = v7;
  objc_msgSend__lockAndCallDelegatesWithBlock_(self, v8, (uint64_t)v9);
}

- (void)device:(id)a3 receivedEventReport:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v12 = "-[MTRDevice_XPC device:receivedEventReport:]";
    _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(0, 2);
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_244B98EFC;
  v9[3] = &unk_265199E50;
  v9[4] = self;
  id v7 = v5;
  id v10 = v7;
  objc_msgSend__lockAndCallDelegatesWithBlock_(self, v8, (uint64_t)v9);
}

- (void)deviceBecameActive:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[MTRDevice_XPC deviceBecameActive:]";
    _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (sub_244CC4E58(2u))
  {
    v6 = "-[MTRDevice_XPC deviceBecameActive:]";
    sub_244CC4DE0(0, 2);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B99048;
  v7[3] = &unk_265199E78;
  v7[4] = self;
  objc_msgSend__lockAndCallDelegatesWithBlock_(self, v5, (uint64_t)v7, v6);
}

- (void)deviceCachePrimed:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_244B9912C;
  v3[3] = &unk_265199E78;
  v3[4] = self;
  objc_msgSend__lockAndCallDelegatesWithBlock_(self, a2, (uint64_t)v3);
}

- (void)deviceConfigurationChanged:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_244B99210;
  v3[3] = &unk_265199E78;
  v3[4] = self;
  objc_msgSend__lockAndCallDelegatesWithBlock_(self, a2, (uint64_t)v3);
}

- (void)device:(id)a3 internalStateUpdated:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  objc_msgSend__setInternalState_(self, v6, (uint64_t)v5);
  id v7 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = self;
    _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_DEFAULT, "%@ internal state updated", buf, 0xCu);
  }

  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(0, 2);
  }
}

- (unint64_t)state
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  v4 = objc_msgSend_deviceController(self, a2, v2);
  id v7 = objc_msgSend_xpcConnection(v4, v5, v6);

  v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v7, v8, (uint64_t)&unk_26F952498);
  uint64_t v12 = objc_msgSend_deviceController(self, v10, v11);
  v15 = objc_msgSend_uniqueIdentifier(v12, v13, v14);
  uint64_t v18 = objc_msgSend_nodeID(self, v16, v17);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_244B99734;
  v22[3] = &unk_265199EA0;
  v22[4] = &v23;
  objc_msgSend_deviceController_nodeID_getStateWithReply_(v9, v19, (uint64_t)v15, v18, v22);

  unint64_t v20 = v24[3];
  _Block_object_dispose(&v23, 8);
  return v20;
}

- (BOOL)deviceCachePrimed
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v4 = objc_msgSend_deviceController(self, a2, v2);
  id v7 = objc_msgSend_xpcConnection(v4, v5, v6);

  v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v7, v8, (uint64_t)&unk_26F9524B8);
  uint64_t v12 = objc_msgSend_deviceController(self, v10, v11);
  v15 = objc_msgSend_uniqueIdentifier(v12, v13, v14);
  uint64_t v18 = objc_msgSend_nodeID(self, v16, v17);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_244B99AEC;
  v21[3] = &unk_2651996C0;
  v21[4] = &v22;
  objc_msgSend_deviceController_nodeID_getDeviceCachePrimedWithReply_(v9, v19, (uint64_t)v15, v18, v21);

  LOBYTE(v9) = *((unsigned char *)v23 + 24) != 0;
  _Block_object_dispose(&v22, 8);
  return (char)v9;
}

- (id)estimatedStartTime
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_244B99DF8;
  uint64_t v27 = sub_244B99E08;
  id v28 = 0;
  v4 = objc_msgSend_deviceController(self, a2, v2);
  id v7 = objc_msgSend_xpcConnection(v4, v5, v6);

  v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v7, v8, (uint64_t)&unk_26F9524D8);
  uint64_t v12 = objc_msgSend_deviceController(self, v10, v11);
  v15 = objc_msgSend_uniqueIdentifier(v12, v13, v14);
  uint64_t v18 = objc_msgSend_nodeID(self, v16, v17);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_244B99F08;
  v22[3] = &unk_265199EC8;
  v22[4] = &v23;
  objc_msgSend_deviceController_nodeID_getEstimatedStartTimeWithReply_(v9, v19, (uint64_t)v15, v18, v22);

  id v20 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v20;
}

- (id)estimatedSubscriptionLatency
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_244B99DF8;
  uint64_t v27 = sub_244B99E08;
  id v28 = 0;
  v4 = objc_msgSend_deviceController(self, a2, v2);
  id v7 = objc_msgSend_xpcConnection(v4, v5, v6);

  v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v7, v8, (uint64_t)&unk_26F9524F8);
  uint64_t v12 = objc_msgSend_deviceController(self, v10, v11);
  v15 = objc_msgSend_uniqueIdentifier(v12, v13, v14);
  uint64_t v18 = objc_msgSend_nodeID(self, v16, v17);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_244B9A30C;
  v22[3] = &unk_2651996E8;
  v22[4] = &v23;
  objc_msgSend_deviceController_nodeID_getEstimatedSubscriptionLatencyWithReply_(v9, v19, (uint64_t)v15, v18, v22);

  id v20 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v20;
}

- (id)readAttributeWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 params:(id)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_244B99DF8;
  v39 = sub_244B99E08;
  id v40 = 0;
  v16 = objc_msgSend_deviceController(self, v14, v15);
  v19 = objc_msgSend_xpcConnection(v16, v17, v18);

  uint64_t v21 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v19, v20, (uint64_t)&unk_26F952518);
  uint64_t v24 = objc_msgSend_deviceController(self, v22, v23);
  uint64_t v27 = objc_msgSend_uniqueIdentifier(v24, v25, v26);
  v30 = objc_msgSend_nodeID(self, v28, v29);
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_244B9A780;
  v34[3] = &unk_265199EF0;
  v34[4] = &v35;
  objc_msgSend_deviceController_nodeID_readAttributeWithEndpointID_clusterID_attributeID_params_withReply_(v21, v31, (uint64_t)v27, v30, v10, v11, v12, v13, v34);

  id v32 = (id)v36[5];
  _Block_object_dispose(&v35, 8);

  return v32;
}

- (void)writeAttributeWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 value:(id)a6 expectedValueInterval:(id)a7 timedWriteTimeout:(id)a8
{
  id v37 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v21 = objc_msgSend_deviceController(self, v19, v20);
  uint64_t v24 = objc_msgSend_xpcConnection(v21, v22, v23);

  uint64_t v26 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v24, v25, (uint64_t)&unk_26F952538);
  uint64_t v29 = objc_msgSend_deviceController(self, v27, v28);
  id v32 = objc_msgSend_uniqueIdentifier(v29, v30, v31);
  uint64_t v35 = objc_msgSend_nodeID(self, v33, v34);
  objc_msgSend_deviceController_nodeID_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v26, v36, (uint64_t)v32, v35, v37, v14, v15, v16, v17, v18);
}

- (id)readAttributePaths:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = sub_244B99DF8;
  id v32 = sub_244B99E08;
  objc_msgSend_array(MEMORY[0x263EFF8C0], v5, v6);
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_deviceController(self, v7, v8);
  id v12 = objc_msgSend_xpcConnection(v9, v10, v11);

  id v14 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v12, v13, (uint64_t)&unk_26F952558);
  id v17 = objc_msgSend_deviceController(self, v15, v16);
  uint64_t v20 = objc_msgSend_uniqueIdentifier(v17, v18, v19);
  uint64_t v23 = objc_msgSend_nodeID(self, v21, v22);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = sub_244B9AF68;
  v27[3] = &unk_265199F18;
  v27[4] = &v28;
  objc_msgSend_deviceController_nodeID_readAttributePaths_withReply_(v14, v24, (uint64_t)v20, v23, v4, v27);

  id v25 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v25;
}

- (void)_invokeCommandWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 commandFields:(id)a6 expectedValues:(id)a7 expectedValueInterval:(id)a8 timedInvokeTimeout:(id)a9 serverSideProcessingTimeout:(id)a10 queue:(id)a11 completion:(id)a12
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v43 = a3;
  id v44 = a4;
  id v45 = a5;
  id v46 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v42 = a11;
  id v41 = a12;
  uint64_t v24 = objc_msgSend_deviceController(self, v22, v23);
  uint64_t v27 = objc_msgSend_xpcConnection(v24, v25, v26);

  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = sub_244B9B338;
  v47[3] = &unk_265199AA8;
  id v28 = v41;
  id v48 = v28;
  uint64_t v30 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v27, v29, (uint64_t)v47);
  id v33 = objc_msgSend_deviceController(self, v31, v32);
  uint64_t v36 = objc_msgSend_uniqueIdentifier(v33, v34, v35);
  v39 = objc_msgSend_nodeID(self, v37, v38);
  objc_msgSend_deviceController_nodeID_invokeCommandWithEndpointID_clusterID_commandID_commandFields_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_completion_(v30, v40, (uint64_t)v36, v39, v43, v44, v45, v46, v18, v19, v20, v21, v28);
}

- (void)downloadLogOfType:(int64_t)a3 timeout:(double)a4 queue:(id)a5 completion:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  id v14 = objc_msgSend_deviceController(self, v12, v13);
  id v17 = objc_msgSend_xpcConnection(v14, v15, v16);

  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = sub_244B9B834;
  v35[3] = &unk_265194FC0;
  id v18 = v10;
  id v36 = v18;
  id v19 = v11;
  id v37 = v19;
  id v21 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v17, v20, (uint64_t)v35);
  uint64_t v24 = objc_msgSend_deviceController(self, v22, v23);
  uint64_t v27 = objc_msgSend_uniqueIdentifier(v24, v25, v26);
  uint64_t v30 = objc_msgSend_nodeID(self, v28, v29);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244B9BA2C;
  v32[3] = &unk_265199F40;
  id v33 = v18;
  id v34 = v19;
  objc_msgSend_deviceController_nodeID_downloadLogOfType_timeout_completion_(v21, v31, (uint64_t)v27, v30, a3, v32, a4);
}

- (NSDictionary)_internalState
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)_setInternalState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end