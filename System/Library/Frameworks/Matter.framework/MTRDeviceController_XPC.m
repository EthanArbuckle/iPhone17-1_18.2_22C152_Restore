@interface MTRDeviceController_XPC
+ (id)_allowedClasses;
- (BOOL)_setupXPCConnection;
- (BOOL)isRunning;
- (BOOL)xpcConnectedOrConnecting;
- (MTRDeviceController_XPC)initWithParameters:(id)a3 error:(id *)a4;
- (MTRXPCDeviceControllerParameters)xpcParameters;
- (NSXPCConnection)xpcConnection;
- (double)xpcRetryTimeInterval;
- (id)_interfaceForClientProtocol;
- (id)_interfaceForServerProtocol;
- (id)_setupDeviceForNodeID:(id)a3 prefetchedClusterData:(id)a4;
- (id)controllerNodeID;
- (id)controllerXPCID;
- (void)_startXPCConnectionRetry;
- (void)_updateRegistrationInfo;
- (void)_xpcConnectionRetry;
- (void)device:(id)a3 internalStateUpdated:(id)a4;
- (void)device:(id)a3 receivedAttributeReport:(id)a4;
- (void)device:(id)a3 receivedEventReport:(id)a4;
- (void)device:(id)a3 stateChanged:(unint64_t)a4;
- (void)deviceBecameActive:(id)a3;
- (void)deviceCachePrimed:(id)a3;
- (void)deviceConfigurationChanged:(id)a3;
- (void)removeDevice:(id)a3;
- (void)setXpcConnectedOrConnecting:(BOOL)a3;
- (void)setXpcConnection:(id)a3;
- (void)setXpcParameters:(id)a3;
- (void)setXpcRetryTimeInterval:(double)a3;
- (void)updateControllerConfiguration:(id)a3;
@end

@implementation MTRDeviceController_XPC

- (void)updateControllerConfiguration:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_xpcConnection(self, v5, v6);
  v9 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v8, (uint64_t)&unk_26F952340);
  v12 = objc_msgSend_uniqueIdentifier(self, v10, v11);
  objc_msgSend_deviceController_updateControllerConfiguration_(v9, v13, (uint64_t)v12, v4);
}

- (void)_updateRegistrationInfo
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2);
  theDict = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v3, v4);
  v7 = objc_msgSend_array(MEMORY[0x263EFF980], v5, v6);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v10 = objc_msgSend_nodeIDToDeviceMap(self, v8, v9);
  v13 = objc_msgSend_keyEnumerator(v10, v11, v12);

  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v35, v43, 16);
  if (v17)
  {
    uint64_t v18 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(v13);
        }
        v20 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v15, v16, v30, v31);
        v21 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
        id v22 = v20;
        if (v22)
        {
          CFDictionarySetValue(v21, @"MTRDeviceControllerRegistrationNodeID", v22);
        }
        else
        {
          v23 = sub_244CC8484(0, "NotSpecified");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v40 = @"MTRDeviceControllerRegistrationNodeID";
            __int16 v41 = 2080;
            v42 = "nodeDictionary";
            _os_log_impl(&dword_2446BD000, v23, OS_LOG_TYPE_ERROR, "Warning, missing %@ to add to %s", buf, 0x16u);
          }

          if (sub_244CC4E58(1u))
          {
            v30 = @"MTRDeviceControllerRegistrationNodeID";
            v31 = "nodeDictionary";
            sub_244CC4DE0(0, 1);
          }
        }

        objc_msgSend_addObject_(v7, v24, (uint64_t)v21);
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v35, v43, 16);
    }
    while (v17);
  }

  id v25 = v7;
  if (v25)
  {
    CFDictionarySetValue(theDict, @"MTRDeviceControllerRegistrationNodeIDs", v25);
  }
  else
  {
    v26 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v40 = @"MTRDeviceControllerRegistrationNodeIDs";
      __int16 v41 = 2080;
      v42 = "registrationInfo";
      _os_log_impl(&dword_2446BD000, v26, OS_LOG_TYPE_ERROR, "Warning, missing %@ to add to %s", buf, 0x16u);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
  }

  id v27 = v32;
  if (v27)
  {
    CFDictionarySetValue(theDict, @"MTRDeviceControllerRegistrationControllerContext", v27);
  }
  else
  {
    v28 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v40 = @"MTRDeviceControllerRegistrationControllerContext";
      __int16 v41 = 2080;
      v42 = "registrationInfo";
      _os_log_impl(&dword_2446BD000, v28, OS_LOG_TYPE_ERROR, "Warning, missing %@ to add to %s", buf, 0x16u);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
  }

  objc_msgSend_updateControllerConfiguration_(self, v29, (uint64_t)theDict);
}

- (void)removeDevice:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MTRDeviceController_XPC;
  [(MTRDeviceController *)&v7 removeDevice:v4];
  objc_msgSend__updateRegistrationInfo(self, v5, v6);
}

+ (id)_allowedClasses
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_268EBE940, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_268EBE940))
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    qword_268EBE938 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v4, (uint64_t)&v5, 7);
    __cxa_guard_release(&qword_268EBE940);
  }
  uint64_t v2 = objc_msgSend_setWithArray_(MEMORY[0x263EFF9C0], a2, qword_268EBE938, v5, v6, v7, v8, v9, v10);

  return v2;
}

- (id)_interfaceForServerProtocol
{
  v27[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], a2, (uint64_t)&unk_26FA92B88);
  uint64_t v5 = objc_msgSend__allowedClasses(MTRDeviceController_XPC, v3, v4);
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  uint64_t v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v6, (uint64_t)v27, 2);
  objc_msgSend_addObjectsFromArray_(v5, v8, (uint64_t)v7);

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v2, v9, (uint64_t)v5, sel_deviceController_nodeID_invokeCommandWithEndpointID_clusterID_commandID_commandFields_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_completion_, 0, 1);
  uint64_t v12 = objc_msgSend__allowedClasses(MTRDeviceController_XPC, v10, v11);

  uint64_t v26 = objc_opt_class();
  v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v13, (uint64_t)&v26, 1);
  objc_msgSend_addObjectsFromArray_(v12, v15, (uint64_t)v14);

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v2, v16, (uint64_t)v12, sel_deviceController_nodeID_readAttributePaths_withReply_, 2, 0);
  v19 = objc_msgSend__allowedClasses(MTRDeviceController_XPC, v17, v18);

  uint64_t v25 = objc_opt_class();
  v21 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v20, (uint64_t)&v25, 1);
  objc_msgSend_addObjectsFromArray_(v19, v22, (uint64_t)v21);

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v2, v23, (uint64_t)v19, sel_deviceController_nodeID_readAttributePaths_withReply_, 0, 1);

  return v2;
}

- (id)_interfaceForClientProtocol
{
  v19[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], a2, (uint64_t)&unk_26FA508B0);
  uint64_t v5 = objc_msgSend__allowedClasses(MTRDeviceController_XPC, v3, v4);
  v19[0] = objc_opt_class();
  uint64_t v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v6, (uint64_t)v19, 1);
  objc_msgSend_addObjectsFromArray_(v5, v8, (uint64_t)v7);

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v2, v9, (uint64_t)v5, sel_device_receivedAttributeReport_, 1, 0);
  uint64_t v12 = objc_msgSend__allowedClasses(MTRDeviceController_XPC, v10, v11);

  uint64_t v18 = objc_opt_class();
  v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v13, (uint64_t)&v18, 1);
  objc_msgSend_addObjectsFromArray_(v12, v15, (uint64_t)v14);

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v2, v16, (uint64_t)v12, sel_device_receivedEventReport_, 1, 0);

  return v2;
}

- (id)controllerXPCID
{
  v3 = objc_msgSend_uniqueIdentifier(self, a2, v2);
  uint64_t v6 = objc_msgSend_UUIDString(v3, v4, v5);

  return v6;
}

- (void)_startXPCConnectionRetry
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  char v4 = objc_msgSend_xpcConnectedOrConnecting(self, a2, v2);
  uint64_t v5 = sub_244CC8484(0, "NotSpecified");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138412290;
      v20 = self;
      _os_log_impl(&dword_2446BD000, v5, OS_LOG_TYPE_DEFAULT, "%@: XPC Connection retry - Not starting retry for XPC Connection, already trying", buf, 0xCu);
    }

    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(0, 2);
    }
  }
  else
  {
    if (v6)
    {
      *(_DWORD *)buf = 138412290;
      v20 = self;
      _os_log_impl(&dword_2446BD000, v5, OS_LOG_TYPE_DEFAULT, "%@: XPC Connection retry - Starting retry for XPC Connection", buf, 0xCu);
    }

    if (sub_244CC4E58(2u))
    {
      uint64_t v16 = self;
      sub_244CC4DE0(0, 2);
    }
    objc_msgSend_setXpcRetryTimeInterval_(self, v7, v8, 0.5, v16);
    objc_initWeak((id *)buf, self);
    objc_msgSend_xpcRetryTimeInterval(self, v9, v10);
    dispatch_time_t v12 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
    v15 = objc_msgSend_chipWorkQueue(self, v13, v14);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_244B24644;
    block[3] = &unk_265194F70;
    objc_copyWeak(&v18, (id *)buf);
    dispatch_after(v12, v15, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_xpcConnectionRetry
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = self;
    _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_DEFAULT, "%@: XPC Connection retry - timer hit", buf, 0xCu);
  }

  if (sub_244CC4E58(2u))
  {
    dispatch_time_t v12 = self;
    sub_244CC4DE0(0, 2);
  }
  if (objc_msgSend_xpcConnectedOrConnecting(self, v4, v5, v12))
  {
    uint64_t v8 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = self;
      _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_DEFAULT, "%@: XPC Connection retry - Mid retry, or connected, stopping retry timer", buf, 0xCu);
    }

    if (sub_244CC4E58(2u)) {
LABEL_18:
    }
      sub_244CC4DE0(0, 2);
  }
  else
  {
    char v9 = objc_msgSend__setupXPCConnection(self, v6, v7);
    uint64_t v10 = sub_244CC8484(0, "NotSpecified");
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = self;
        _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_DEFAULT, "%@: XPC Connection retry - connection attempt successful", buf, 0xCu);
      }

      if (sub_244CC4E58(2u)) {
        goto LABEL_18;
      }
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = self;
        _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_DEFAULT, "%@: XPC Connection failed retry - bailing", buf, 0xCu);
      }

      if (sub_244CC4E58(2u)) {
        goto LABEL_18;
      }
    }
  }
}

- (BOOL)_setupXPCConnection
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  char v4 = objc_msgSend_xpcParameters(self, a2, v2);
  objc_msgSend_xpcConnectionBlock(v4, v5, v6);
  uint64_t v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v7[2]();
  objc_msgSend_setXpcConnection_(self, v9, (uint64_t)v8);

  uint64_t v10 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend_xpcConnection(self, v11, v12);
    *(_DWORD *)buf = 138412546;
    v67 = self;
    __int16 v68 = 2112;
    v69 = v13;
    _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_DEFAULT, "%@ Set up XPC Connection: %@", buf, 0x16u);
  }
  if (sub_244CC4E58(2u))
  {
    objc_msgSend_xpcConnection(self, v14, v15);
    v60 = v58 = self;
    sub_244CC4DE0(0, 2);
  }
  uint64_t v16 = objc_msgSend_xpcConnection(self, v14, v15, v58, v60);
  BOOL v17 = v16 == 0;

  if (v17)
  {
    v55 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v67 = self;
      _os_log_impl(&dword_2446BD000, v55, OS_LOG_TYPE_ERROR, "%@ Failed to set up XPC Connection", buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      v59 = self;
      sub_244CC4DE0(0, 1);
    }
    objc_msgSend_setXpcConnectedOrConnecting_(self, v56, 0, v59);
  }
  else
  {
    objc_initWeak(&location, self);
    v20 = objc_msgSend__interfaceForServerProtocol(self, v18, v19);
    v23 = objc_msgSend_xpcConnection(self, v21, v22);
    objc_msgSend_setRemoteObjectInterface_(v23, v24, (uint64_t)v20);

    id v27 = objc_msgSend__interfaceForClientProtocol(self, v25, v26);
    v30 = objc_msgSend_xpcConnection(self, v28, v29);
    objc_msgSend_setExportedInterface_(v30, v31, (uint64_t)v27);

    v34 = objc_msgSend_xpcConnection(self, v32, v33);
    objc_msgSend_setExportedObject_(v34, v35, (uint64_t)self);

    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = sub_244B24DEC;
    v63[3] = &unk_265194F70;
    objc_copyWeak(&v64, &location);
    long long v38 = objc_msgSend_xpcConnection(self, v36, v37);
    objc_msgSend_setInterruptionHandler_(v38, v39, (uint64_t)v63);

    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = sub_244B24F90;
    v61[3] = &unk_265194F70;
    objc_copyWeak(&v62, &location);
    v42 = objc_msgSend_xpcConnection(self, v40, v41);
    objc_msgSend_setInvalidationHandler_(v42, v43, (uint64_t)v61);

    uint64_t v44 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v67 = self;
      _os_log_impl(&dword_2446BD000, v44, OS_LOG_TYPE_DEFAULT, "%@ Activating new XPC connection", buf, 0xCu);
    }

    if (sub_244CC4E58(2u))
    {
      v59 = self;
      sub_244CC4DE0(0, 2);
    }
    v47 = objc_msgSend_xpcConnection(self, v45, v46, v59);
    objc_msgSend_activate(v47, v48, v49);

    objc_msgSend__updateRegistrationInfo(self, v50, v51);
    objc_msgSend_setXpcConnectedOrConnecting_(self, v52, 1);
    objc_destroyWeak(&v62);
    objc_destroyWeak(&v64);
    objc_destroyWeak(&location);
  }
  return objc_msgSend_xpcConnectedOrConnecting(self, v53, v54);
}

- (MTRDeviceController_XPC)initWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t started = objc_msgSend_startSuspended(v6, v7, v8);
    v33.receiver = self;
    v33.super_class = (Class)MTRDeviceController_XPC;
    uint64_t v10 = [(MTRDeviceController *)&v33 initForSubclasses:started];
    if (!v10)
    {
LABEL_10:
      self = v10;
      id v27 = self;
      goto LABEL_28;
    }
    id v11 = v6;
    uint64_t v14 = objc_msgSend_xpcConnectionBlock(v11, v12, v13);
    BOOL v17 = objc_msgSend_uniqueIdentifier(v11, v15, v16);
    id v18 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = (void *)MEMORY[0x2456969D0](v14);
      *(_DWORD *)buf = 138412546;
      id v37 = v17;
      __int16 v38 = 2048;
      v39 = v19;
      _os_log_impl(&dword_2446BD000, v18, OS_LOG_TYPE_DEFAULT, "Setting up XPC Controller for UUID: %@ with connection block: %p", buf, 0x16u);
    }
    if (sub_244CC4E58(2u))
    {
      v32 = (void *)MEMORY[0x2456969D0](v14);
      sub_244CC4DE0(0, 2);
    }
    if (v17)
    {
      if (v14)
      {
        objc_msgSend_setUniqueIdentifier_(v10, v20, (uint64_t)v17);
        objc_msgSend_setXpcParameters_(v10, v21, (uint64_t)v11);
        uint64_t v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        uint64_t v23 = (uint64_t)dispatch_queue_create("MTRDeviceController_XPC_queue", v22);
        objc_msgSend_setChipWorkQueue_(v10, v24, v23);

        LOBYTE(v23) = objc_msgSend__setupXPCConnection(v10, v25, v26);
        if (v23) {
          goto LABEL_10;
        }
LABEL_27:
        id v27 = 0;
        self = v10;
        goto LABEL_28;
      }
      v30 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2446BD000, v30, OS_LOG_TYPE_ERROR, "MTRDeviceController_XPC initWithParameters failed, nil connectionBlock", buf, 2u);
      }

      if (!sub_244CC4E58(1u))
      {
LABEL_26:

        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v29 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2446BD000, v29, OS_LOG_TYPE_ERROR, "MTRDeviceController_XPC initWithParameters failed, nil UUID", buf, 2u);
      }

      if (!sub_244CC4E58(1u)) {
        goto LABEL_26;
      }
    }
    sub_244CC4DE0(0, 1);
    goto LABEL_26;
  }
  v28 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v6;
    _os_log_impl(&dword_2446BD000, v28, OS_LOG_TYPE_ERROR, "Expected MTRXPCDeviceControllerParameters but got: %@", buf, 0xCu);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0, 1);
  }
  if (a4)
  {
    LODWORD(v34) = 47;
    *((void *)&v34 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTRDeviceController_XPC.mm";
    int v35 = 270;
    sub_244B26908((uint64_t)MTRError, &v34);
    id v27 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v27 = 0;
  }
LABEL_28:

  return v27;
}

- (id)_setupDeviceForNodeID:(id)a3 prefetchedClusterData:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v25 = "-[MTRDeviceController_XPC _setupDeviceForNodeID:prefetchedClusterData:]";
    _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (sub_244CC4E58(2u))
  {
    uint64_t v21 = "-[MTRDeviceController_XPC _setupDeviceForNodeID:prefetchedClusterData:]";
    sub_244CC4DE0(0, 2);
  }
  char v9 = (const os_unfair_lock *)objc_msgSend_deviceMapLock(self, v7, v8, v21);
  os_unfair_lock_assert_owner(v9);
  uint64_t v10 = [MTRDevice_XPC alloc];
  uint64_t v12 = objc_msgSend_initWithNodeID_controller_(v10, v11, (uint64_t)v5, self);
  uint64_t v15 = objc_msgSend_nodeIDToDeviceMap(self, v13, v14);
  objc_msgSend_setObject_forKey_(v15, v16, (uint64_t)v12, v5);

  BOOL v17 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v25 = "-[MTRDeviceController_XPC _setupDeviceForNodeID:prefetchedClusterData:]";
    __int16 v26 = 2112;
    id v27 = v5;
    _os_log_impl(&dword_2446BD000, v17, OS_LOG_TYPE_DEFAULT, "%s: returning XPC device for node id %@", buf, 0x16u);
  }

  if (sub_244CC4E58(2u))
  {
    uint64_t v22 = "-[MTRDeviceController_XPC _setupDeviceForNodeID:prefetchedClusterData:]";
    id v23 = v5;
    sub_244CC4DE0(0, 2);
  }
  objc_msgSend__updateRegistrationInfo(self, v18, v19, v22, v23);

  return v12;
}

- (BOOL)isRunning
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  char v4 = objc_msgSend_xpcConnection(self, a2, v2);
  id v6 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v4, v5, (uint64_t)&unk_26F952360);
  char v9 = objc_msgSend_uniqueIdentifier(self, v7, v8);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_244B25AF8;
  v12[3] = &unk_2651996C0;
  v12[4] = &v13;
  objc_msgSend_deviceController_getIsRunningWithReply_(v6, v10, (uint64_t)v9, v12);

  LOBYTE(v6) = *((unsigned char *)v14 + 24) != 0;
  _Block_object_dispose(&v13, 8);
  return (char)v6;
}

- (id)controllerNodeID
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_244B25D94;
  id v18 = sub_244B25DA4;
  id v19 = 0;
  char v4 = objc_msgSend_xpcConnection(self, a2, v2);
  id v6 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v4, v5, (uint64_t)&unk_26F952380);
  char v9 = objc_msgSend_uniqueIdentifier(self, v7, v8);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_244B25EA4;
  v13[3] = &unk_2651996E8;
  v13[4] = &v14;
  objc_msgSend_deviceController_controllerNodeIDWithReply_(v6, v10, (uint64_t)v9, v13);

  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

- (void)device:(id)a3 stateChanged:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v8 = objc_msgSend_deviceForNodeID_(self, v7, (uint64_t)v6);
  char v9 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v15 = v6;
    __int16 v16 = 2048;
    unint64_t v17 = a4;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl(&dword_2446BD000, v9, OS_LOG_TYPE_DEFAULT, "Received device: %@ stateChanged: %lu   found device: %@", buf, 0x20u);
  }

  if (sub_244CC4E58(2u))
  {
    unint64_t v12 = a4;
    uint64_t v13 = v8;
    id v11 = v6;
    sub_244CC4DE0(0, 2);
  }
  objc_msgSend_device_stateChanged_(v8, v10, (uint64_t)v6, a4, v11, v12, v13);
}

- (void)device:(id)a3 receivedAttributeReport:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v9 = objc_msgSend_deviceForNodeID_(self, v8, (uint64_t)v6);
  uint64_t v10 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_DEFAULT, "Received device: %@ receivedAttributeReport: %@     found device: %@", buf, 0x20u);
  }

  if (sub_244CC4E58(2u))
  {
    id v13 = v7;
    uint64_t v14 = v9;
    id v12 = v6;
    sub_244CC4DE0(0, 2);
  }
  objc_msgSend_device_receivedAttributeReport_(v9, v11, (uint64_t)v6, v7, v12, v13, v14);
}

- (void)device:(id)a3 receivedEventReport:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v9 = objc_msgSend_deviceForNodeID_(self, v8, (uint64_t)v6);
  uint64_t v10 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_DEFAULT, "Received device: %@ receivedEventReport: %@     found device: %@", buf, 0x20u);
  }

  if (sub_244CC4E58(2u))
  {
    id v13 = v7;
    uint64_t v14 = v9;
    id v12 = v6;
    sub_244CC4DE0(0, 2);
  }
  objc_msgSend_device_receivedEventReport_(v9, v11, (uint64_t)v6, v7, v12, v13, v14);
}

- (void)deviceBecameActive:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v6 = objc_msgSend_deviceForNodeID_(self, v5, (uint64_t)v4);
  id v7 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_DEFAULT, "Received deviceBecameActive: %@ found device: %@", buf, 0x16u);
  }

  if (sub_244CC4E58(2u))
  {
    id v9 = v4;
    uint64_t v10 = v6;
    sub_244CC4DE0(0, 2);
  }
  objc_msgSend_deviceBecameActive_(v6, v8, (uint64_t)v4, v9, v10);
}

- (void)deviceCachePrimed:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v6 = objc_msgSend_deviceForNodeID_(self, v5, (uint64_t)v4);
  id v7 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_DEFAULT, "Received deviceCachePrimed: %@ found device: %@", buf, 0x16u);
  }

  if (sub_244CC4E58(2u))
  {
    id v9 = v4;
    uint64_t v10 = v6;
    sub_244CC4DE0(0, 2);
  }
  objc_msgSend_deviceCachePrimed_(v6, v8, (uint64_t)v4, v9, v10);
}

- (void)deviceConfigurationChanged:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v6 = objc_msgSend_deviceForNodeID_(self, v5, (uint64_t)v4);
  id v7 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_DEFAULT, "Received deviceConfigurationChanged: %@ found device: %@", buf, 0x16u);
  }

  if (sub_244CC4E58(2u))
  {
    id v9 = v4;
    uint64_t v10 = v6;
    sub_244CC4DE0(0, 2);
  }
  objc_msgSend_deviceConfigurationChanged_(v6, v8, (uint64_t)v4, v9, v10);
}

- (void)device:(id)a3 internalStateUpdated:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v9 = objc_msgSend_deviceForNodeID_(self, v8, (uint64_t)v6);
  uint64_t v10 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    __int16 v17 = v9;
    _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_DEFAULT, "Received internalStateUpdated: %@ found device: %@", buf, 0x16u);
  }

  if (sub_244CC4E58(2u))
  {
    id v12 = v6;
    __int16 v13 = v9;
    sub_244CC4DE0(0, 2);
  }
  objc_msgSend_device_internalStateUpdated_(v9, v11, (uint64_t)v6, v7, v12, v13);
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 1616, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (MTRXPCDeviceControllerParameters)xpcParameters
{
  return (MTRXPCDeviceControllerParameters *)objc_getProperty(self, a2, 1624, 1);
}

- (void)setXpcParameters:(id)a3
{
}

- (double)xpcRetryTimeInterval
{
  return self->_xpcRetryTimeInterval;
}

- (void)setXpcRetryTimeInterval:(double)a3
{
  self->_xpcRetryTimeInterval = a3;
}

- (BOOL)xpcConnectedOrConnecting
{
  return self->_xpcConnectedOrConnecting;
}

- (void)setXpcConnectedOrConnecting:(BOOL)a3
{
  self->_xpcConnectedOrConnecting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcParameters, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end