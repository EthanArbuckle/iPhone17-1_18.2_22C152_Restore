@interface MTRDeviceController
+ (BOOL)checkForError:(ChipError *)a3 logMsg:(id)a4 error:(id *)a5;
+ (MTRDeviceController)sharedControllerWithID:(id)controllerID xpcConnectBlock:(MTRXPCConnectBlock)xpcConnectBlock;
+ (MTRDeviceController)sharedControllerWithId:(id)controllerID xpcConnectBlock:(MTRXPCConnectBlock)xpcConnectBlock;
+ (MTRReadParams)decodeXPCReadParams:(NSDictionary *)params;
+ (MTRSubscribeParams)decodeXPCSubscribeParams:(NSDictionary *)params;
+ (NSArray)decodeXPCResponseValues:(NSArray *)values;
+ (NSArray)encodeXPCResponseValues:(NSArray *)values;
+ (NSData)computePASEVerifierForSetupPasscode:(NSNumber *)setupPasscode iterations:(NSNumber *)iterations salt:(NSData *)salt error:(NSError *)error;
+ (NSDictionary)encodeXPCReadParams:(MTRReadParams *)params;
+ (NSDictionary)encodeXPCSubscribeParams:(MTRSubscribeParams *)params;
+ (NSXPCInterface)xpcInterfaceForClientProtocol;
+ (NSXPCInterface)xpcInterfaceForServerProtocol;
- (BOOL)addServerEndpoint:(id)a3;
- (BOOL)cancelCommissioningForNodeID:(NSNumber *)nodeID error:(NSError *)error;
- (BOOL)checkIsRunning;
- (BOOL)checkIsRunning:(id *)a3;
- (BOOL)commissionDevice:(uint64_t)deviceId commissioningParams:(MTRCommissioningParameters *)commissioningParams error:(NSError *)error;
- (BOOL)commissionNodeWithID:(NSNumber *)nodeID commissioningParams:(MTRCommissioningParameters *)commissioningParams error:(NSError *)error;
- (BOOL)continueCommissioningDevice:(void *)opaqueDeviceHandle ignoreAttestationFailure:(BOOL)ignoreAttestationFailure error:(NSError *)error;
- (BOOL)getBaseDevice:(uint64_t)deviceID queue:(dispatch_queue_t)queue completionHandler:(MTRDeviceConnectionCallback)completionHandler;
- (BOOL)isRunning;
- (BOOL)isSuspended;
- (BOOL)openPairingWindow:(uint64_t)deviceID duration:(NSUInteger)duration error:(NSError *)error;
- (BOOL)pairDevice:(uint64_t)deviceID address:(NSString *)address port:(uint16_t)port setupPINCode:(uint32_t)setupPINCode error:(NSError *)error;
- (BOOL)pairDevice:(uint64_t)deviceID discriminator:(uint16_t)discriminator setupPINCode:(uint32_t)setupPINCode error:(NSError *)error;
- (BOOL)pairDevice:(uint64_t)deviceID onboardingPayload:(NSString *)onboardingPayload error:(NSError *)error;
- (BOOL)setOperationalCertificateIssuer:(id)a3 queue:(id)a4;
- (BOOL)setupCommissioningSessionWithDiscoveredDevice:(MTRCommissionableBrowserResult *)discoveredDevice payload:(MTRSetupPayload *)payload newNodeID:(NSNumber *)newNodeID error:(NSError *)error;
- (BOOL)setupCommissioningSessionWithPayload:(MTRSetupPayload *)payload newNodeID:(NSNumber *)newNodeID error:(NSError *)error;
- (BOOL)startBrowseForCommissionables:(id)delegate queue:(dispatch_queue_t)queue;
- (BOOL)stopBrowseForCommissionables;
- (BOOL)stopDevicePairing:(uint64_t)deviceID error:(NSError *)error;
- (BOOL)syncRunOnWorkQueueWithBoolReturnValue:(id)a3 error:(id *)a4;
- (MTRAsyncWorkQueue)concurrentSubscriptionPool;
- (MTRBaseDevice)deviceBeingCommissionedWithNodeID:(NSNumber *)nodeID error:(NSError *)error;
- (MTRBaseDevice)getDeviceBeingCommissioned:(uint64_t)deviceId error:(NSError *)error;
- (MTRDeviceController)initWithParameters:(id)a3 error:(id *)a4;
- (MTRDeviceControllerDataStore)controllerDataStore;
- (MTROTAProviderDelegate)otaProviderDelegate;
- (NSData)attestationChallengeForDeviceID:(NSNumber *)deviceID;
- (NSData)computePaseVerifier:(uint32_t)setupPincode iterations:(uint32_t)iterations salt:(NSData *)salt;
- (NSData)fetchAttestationChallengeForDeviceId:(uint64_t)deviceId;
- (NSData)rootPublicKey;
- (NSMapTable)nodeIDToDeviceMap;
- (NSNumber)compressedFabricID;
- (NSNumber)controllerNodeID;
- (NSNumber)controllerNodeId;
- (NSNumber)fabricID;
- (NSNumber)nodeID;
- (NSString)openPairingWindowWithPIN:(uint64_t)deviceID duration:(NSUInteger)duration discriminator:(NSUInteger)discriminator setupPIN:(NSUInteger)setupPIN error:(NSError *)error;
- (NSUUID)uniqueIdentifier;
- (OS_dispatch_queue)chipWorkQueue;
- (OS_dispatch_queue)otaProviderDelegateQueue;
- (id).cxx_construct;
- (id)_setupDeviceForNodeID:(id)a3 prefetchedClusterData:(id)a4;
- (id)baseDeviceForNodeID:(id)a3;
- (id)description;
- (id)deviceForNodeID:(id)a3;
- (id)initForSubclasses:(BOOL)a3;
- (id)syncRunOnWorkQueueWithReturnValue:(id)a3 error:(id *)a4;
- (os_unfair_lock_s)deviceMapLock;
- (unint64_t)_iterateDelegateInfoWithBlock:(id)a3;
- (unsigned)fabricIndex;
- (void)_callDelegatesWithBlock:(id)a3 logString:(const char *)a4;
- (void)_clearDeviceControllerDelegates;
- (void)_notifyDelegatesOfSuspendState;
- (void)addDeviceControllerDelegate:(id)a3 queue:(id)a4;
- (void)asyncDispatchToMatterQueue:(id)a3 errorHandler:(id)a4;
- (void)controller:(id)a3 commissioningComplete:(id)a4 nodeID:(id)a5 metrics:(id)a6;
- (void)controller:(id)a3 commissioningSessionEstablishmentDone:(id)a4;
- (void)controller:(id)a3 readCommissioningInfo:(id)a4;
- (void)controller:(id)a3 statusUpdate:(int64_t)a4;
- (void)getSessionForCommissioneeDevice:(unint64_t)a3 completion:(id)a4;
- (void)getSessionForNode:(unint64_t)a3 completion:(id)a4;
- (void)preWarmCommissioningSession;
- (void)removeDevice:(id)a3;
- (void)removeDeviceControllerDelegate:(id)a3;
- (void)removeServerEndpoint:(id)a3;
- (void)removeServerEndpoint:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)removeServerEndpointInternal:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)resume;
- (void)setChipWorkQueue:(id)a3;
- (void)setDeviceControllerDelegate:(id)delegate queue:(dispatch_queue_t)queue;
- (void)setFabricID:(id)a3;
- (void)setNocChainIssuer:(id)nocChainIssuer queue:(dispatch_queue_t)queue;
- (void)setNodeID:(id)a3;
- (void)setPairingDelegate:(id)delegate queue:(dispatch_queue_t)queue;
- (void)setRootPublicKey:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)shutdown;
- (void)suspend;
- (void)syncRunOnWorkQueue:(id)a3 error:(id *)a4;
@end

@implementation MTRDeviceController

- (os_unfair_lock_s)deviceMapLock
{
  return &self->_underlyingDeviceMapLock;
}

- (id)initForSubclasses:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MTRDeviceController;
  v4 = [(MTRDeviceController *)&v14 init];
  v4->_underlyingDeviceMapLock._os_unfair_lock_opaque = 0;
  atomic_store(a3, (unsigned __int8 *)&v4->_suspended);
  uint64_t v7 = objc_msgSend_strongToWeakObjectsMapTable(MEMORY[0x263F08968], v5, v6);
  nodeIDToDeviceMap = v4->_nodeIDToDeviceMap;
  v4->_nodeIDToDeviceMap = (NSMapTable *)v7;

  uint64_t v11 = objc_msgSend_array(MEMORY[0x263EFF980], v9, v10);
  delegates = v4->_delegates;
  v4->_delegates = (NSMutableArray *)v11;

  return v4;
}

- (MTRDeviceController)initWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v6;
      _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_DEFAULT, "Starting up with XPC Device Controller Parameters: %@", buf, 0xCu);
    }

    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(0, 2);
    }
    v8 = off_265191EE0;
LABEL_7:
    id v9 = objc_alloc(*v8);
    uint64_t v11 = (MTRDeviceController *)objc_msgSend_initWithParameters_error_(v9, v10, (uint64_t)v6, a4);
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v6;
    v13 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v12;
      _os_log_impl(&dword_2446BD000, v13, OS_LOG_TYPE_DEFAULT, "Starting up with Mach Service XPC Device Controller Parameters: %@", buf, 0xCu);
    }

    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(0, 2);
    }
    objc_super v14 = [MTRDeviceController_XPC alloc];
    v17 = objc_msgSend_machServiceName(v12, v15, v16);
    uint64_t v20 = objc_msgSend_connectionOptions(v12, v18, v19);
    uint64_t v11 = (MTRDeviceController *)objc_msgSend_initWithMachServiceName_options_(v14, v21, (uint64_t)v17, v20);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v6;
        _os_log_impl(&dword_2446BD000, v22, OS_LOG_TYPE_DEFAULT, "Starting up with Device Controller Parameters: %@", buf, 0xCu);
      }

      if (sub_244CC4E58(2u)) {
        sub_244CC4DE0(0, 2);
      }
      v8 = off_265191ED8;
      goto LABEL_7;
    }
    v23 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v6;
      _os_log_impl(&dword_2446BD000, v23, OS_LOG_TYPE_ERROR, "Unsupported type of MTRDeviceControllerAbstractParameters: %@", buf, 0xCu);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    if (a4)
    {
      LODWORD(v25) = 47;
      *((void *)&v25 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/MTRDeviceController.mm";
      int v26 = 196;
      sub_244B26908((uint64_t)MTRError, &v25);
      uint64_t v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
LABEL_27:

  return v11;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v8 = objc_msgSend_uniqueIdentifier(self, v6, v7);
  if (objc_msgSend_isSuspended(self, v9, v10)) {
    objc_msgSend_stringWithFormat_(v3, v11, @"<%@: %p, uuid: %@, suspended: %@>", v5, self, v8, @"YES");
  }
  else {
  id v12 = objc_msgSend_stringWithFormat_(v3, v11, @"<%@: %p, uuid: %@, suspended: %@>", v5, self, v8, @"NO");
  }

  return v12;
}

- (BOOL)isRunning
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = objc_opt_class();
    v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    uint64_t v7 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  return 0;
}

- (BOOL)isSuspended
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_suspended);
  return v2 & 1;
}

- (void)_notifyDelegatesOfSuspendState
{
  char isSuspended = objc_msgSend_isSuspended(self, a2, v2);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_24484F4B0;
  v6[3] = &unk_265198AA0;
  v6[4] = self;
  char v7 = isSuspended;
  objc_msgSend__callDelegatesWithBlock_logString_(self, v5, (uint64_t)v6, "-[MTRDeviceController _notifyDelegatesOfSuspendState]");
}

- (void)suspend
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  v3 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v47 = self;
    _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_DEFAULT, "%@ suspending", buf, 0xCu);
  }

  if (sub_244CC4E58(2u))
  {
    v38 = self;
    sub_244CC4DE0(0, 2);
  }
  if (objc_msgSend_isRunning(self, v4, v5, v38))
  {
    v8 = (os_unfair_lock_s *)objc_msgSend_deviceMapLock(self, v6, v7);
    os_unfair_lock_lock(v8);
    unsigned __int8 v11 = atomic_load((unsigned __int8 *)&self->_suspended);
    if (v11)
    {
      v37 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v47 = self;
        _os_log_impl(&dword_2446BD000, v37, OS_LOG_TYPE_DEFAULT, "%@ already suspended", buf, 0xCu);
      }

      if (sub_244CC4E58(2u)) {
        sub_244CC4DE0(0, 2);
      }
      os_unfair_lock_unlock(v8);
      id v25 = 0;
    }
    else
    {
      atomic_store(1u, (unsigned __int8 *)&self->_suspended);
      uint64_t v12 = objc_msgSend_nodeIDToDeviceMap(self, v9, v10);
      v15 = objc_msgSend_objectEnumerator(v12, v13, v14);
      v18 = objc_msgSend_allObjects(v15, v16, v17);

      os_unfair_lock_unlock(v8);
      uint64_t v19 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = objc_msgSend_count(v18, v20, v21);
        *(_DWORD *)buf = 138412546;
        v47 = self;
        __int16 v48 = 2048;
        uint64_t v49 = v22;
        _os_log_impl(&dword_2446BD000, v19, OS_LOG_TYPE_DEFAULT, "%@ found %lu devices to suspend", buf, 0x16u);
      }

      if (sub_244CC4E58(2u))
      {
        v39 = self;
        uint64_t v40 = objc_msgSend_count(v18, v23, v24);
        sub_244CC4DE0(0, 2);
      }
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v25 = v18;
      uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v41, v45, 16);
      if (v29)
      {
        uint64_t v30 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v42 != v30) {
              objc_enumerationMutation(v25);
            }
            objc_msgSend_controllerSuspended(*(void **)(*((void *)&v41 + 1) + 8 * i), v27, v28, v39, v40, (void)v41);
          }
          uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v27, (uint64_t)&v41, v45, 16);
        }
        while (v29);
      }

      objc_msgSend__notifyDelegatesOfSuspendState(self, v32, v33);
      objc_msgSend__controllerSuspended(self, v34, v35);
    }
  }
  else
  {
    v36 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v47 = self;
      _os_log_impl(&dword_2446BD000, v36, OS_LOG_TYPE_ERROR, "%@ not running; can't suspend", buf, 0xCu);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
  }
}

- (void)resume
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  v3 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v47 = self;
    _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_DEFAULT, "%@ resuming", buf, 0xCu);
  }

  if (sub_244CC4E58(2u))
  {
    v38 = self;
    sub_244CC4DE0(0, 2);
  }
  if (objc_msgSend_isRunning(self, v4, v5, v38))
  {
    v8 = (os_unfair_lock_s *)objc_msgSend_deviceMapLock(self, v6, v7);
    os_unfair_lock_lock(v8);
    unsigned __int8 v11 = atomic_load((unsigned __int8 *)&self->_suspended);
    if (v11)
    {
      atomic_store(0, (unsigned __int8 *)&self->_suspended);
      v15 = objc_msgSend_nodeIDToDeviceMap(self, v9, v10);
      v18 = objc_msgSend_objectEnumerator(v15, v16, v17);
      uint64_t v21 = objc_msgSend_allObjects(v18, v19, v20);

      os_unfair_lock_unlock(v8);
      uint64_t v22 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = objc_msgSend_count(v21, v23, v24);
        *(_DWORD *)buf = 138412546;
        v47 = self;
        __int16 v48 = 2048;
        uint64_t v49 = v25;
        _os_log_impl(&dword_2446BD000, v22, OS_LOG_TYPE_DEFAULT, "%@ found %lu devices to resume", buf, 0x16u);
      }

      if (sub_244CC4E58(2u))
      {
        v39 = self;
        uint64_t v40 = objc_msgSend_count(v21, v26, v27);
        sub_244CC4DE0(0, 2);
      }
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v13 = v21;
      uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v28, (uint64_t)&v41, v45, 16);
      if (v31)
      {
        uint64_t v32 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v42 != v32) {
              objc_enumerationMutation(v13);
            }
            objc_msgSend_controllerResumed(*(void **)(*((void *)&v41 + 1) + 8 * i), v29, v30, v39, v40, (void)v41);
          }
          uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v29, (uint64_t)&v41, v45, 16);
        }
        while (v31);
      }

      objc_msgSend__notifyDelegatesOfSuspendState(self, v34, v35);
      objc_msgSend__controllerResumed(self, v36, v37);
    }
    else
    {
      uint64_t v12 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v47 = self;
        _os_log_impl(&dword_2446BD000, v12, OS_LOG_TYPE_DEFAULT, "%@ already not suspended", buf, 0xCu);
      }

      if (sub_244CC4E58(2u)) {
        sub_244CC4DE0(0, 2);
      }
      os_unfair_lock_unlock(v8);
      id v13 = 0;
    }
  }
  else
  {
    uint64_t v14 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v47 = self;
      _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_ERROR, "%@ not running; can't resume", buf, 0xCu);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
  }
}

- (void)shutdown
{
}

- (NSNumber)controllerNodeID
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    unsigned __int8 v11 = v5;
    _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    uint64_t v7 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  return 0;
}

- (BOOL)setupCommissioningSessionWithPayload:(MTRSetupPayload *)payload newNodeID:(NSNumber *)newNodeID error:(NSError *)error
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v7 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    unsigned __int8 v11 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  if (error)
  {
    LODWORD(v12) = 3;
    *((void *)&v12 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTRDeviceController.mm";
    int v13 = 331;
    sub_244B26908((uint64_t)MTRError, &v12);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)setupCommissioningSessionWithDiscoveredDevice:(MTRCommissionableBrowserResult *)discoveredDevice payload:(MTRSetupPayload *)payload newNodeID:(NSNumber *)newNodeID error:(NSError *)error
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v8 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = objc_opt_class();
    __int16 v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v10;
    _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    long long v12 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  if (error)
  {
    LODWORD(v13) = 3;
    *((void *)&v13 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTRDeviceController.mm";
    int v14 = 343;
    sub_244B26908((uint64_t)MTRError, &v13);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)commissionNodeWithID:(NSNumber *)nodeID commissioningParams:(MTRCommissioningParameters *)commissioningParams error:(NSError *)error
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v7 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    __int16 v17 = v9;
    _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    unsigned __int8 v11 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  if (error)
  {
    LODWORD(v12) = 3;
    *((void *)&v12 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTRDeviceController.mm";
    int v13 = 354;
    sub_244B26908((uint64_t)MTRError, &v12);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)continueCommissioningDevice:(void *)opaqueDeviceHandle ignoreAttestationFailure:(BOOL)ignoreAttestationFailure error:(NSError *)error
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v7 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    __int16 v17 = v9;
    _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    unsigned __int8 v11 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  if (error)
  {
    LODWORD(v12) = 3;
    *((void *)&v12 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTRDeviceController.mm";
    int v13 = 365;
    sub_244B26908((uint64_t)MTRError, &v12);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)cancelCommissioningForNodeID:(NSNumber *)nodeID error:(NSError *)error
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    __int16 v16 = v8;
    _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    __int16 v10 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  if (error)
  {
    LODWORD(v11) = 3;
    *((void *)&v11 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTRDeviceController.mm";
    int v12 = 374;
    sub_244B26908((uint64_t)MTRError, &v11);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)startBrowseForCommissionables:(id)delegate queue:(dispatch_queue_t)queue
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    int v13 = v7;
    _os_log_impl(&dword_2446BD000, v5, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    uint64_t v9 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  return 0;
}

- (BOOL)stopBrowseForCommissionables
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    uint64_t v7 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  return 0;
}

- (void)preWarmCommissioningSession
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    __int16 v10 = v5;
    _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    uint64_t v6 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
}

- (MTRBaseDevice)deviceBeingCommissionedWithNodeID:(NSNumber *)nodeID error:(NSError *)error
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v6 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    __int16 v16 = v8;
    _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    __int16 v10 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  if (error)
  {
    LODWORD(v11) = 3;
    *((void *)&v11 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTRDeviceController.mm";
    int v12 = 400;
    sub_244B26908((uint64_t)MTRError, &v11);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)baseDeviceForNodeID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MTRBaseDevice alloc];
  uint64_t v7 = objc_msgSend_initWithNodeID_controller_(v5, v6, (uint64_t)v4, self);

  return v7;
}

- (id)_setupDeviceForNodeID:(id)a3 prefetchedClusterData:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = objc_opt_class();
    __int16 v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v9;
    _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    uint64_t v14 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  __int16 v10 = [MTRDevice alloc];
  int v12 = objc_msgSend_initForSubclassesWithNodeID_controller_(v10, v11, (uint64_t)v6, self);

  return v12;
}

- (id)deviceForNodeID:(id)a3
{
  id v4 = a3;
  uint64_t v7 = (os_unfair_lock_s *)objc_msgSend_deviceMapLock(self, v5, v6);
  os_unfair_lock_lock(v7);
  __int16 v10 = objc_msgSend_objectForKey_(self->_nodeIDToDeviceMap, v8, (uint64_t)v4);
  if (!v10)
  {
    __int16 v10 = objc_msgSend__setupDeviceForNodeID_prefetchedClusterData_(self, v9, (uint64_t)v4, 0);
  }
  os_unfair_lock_unlock(v7);

  return v10;
}

- (void)removeDevice:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v7 = (os_unfair_lock_s *)objc_msgSend_deviceMapLock(self, v5, v6);
  os_unfair_lock_lock(v7);
  __int16 v10 = objc_msgSend_nodeID(v4, v8, v9);
  objc_msgSend_objectForKey_(self->_nodeIDToDeviceMap, v11, (uint64_t)v10);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14 == v4)
  {
    objc_msgSend_invalidate(v4, v12, v13);
    objc_msgSend_removeObjectForKey_(self->_nodeIDToDeviceMap, v20, (uint64_t)v10);
  }
  else
  {
    __int16 v15 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = self;
      __int16 v23 = 2048;
      id v24 = v4;
      __int16 v25 = 2048;
      uint64_t v26 = objc_msgSend_unsignedLongLongValue(v10, v16, v17);
      _os_log_impl(&dword_2446BD000, v15, OS_LOG_TYPE_ERROR, "%@ Error: Cannot remove device %p with nodeID %llu", buf, 0x20u);
    }

    if (sub_244CC4E58(1u))
    {
      objc_msgSend_unsignedLongLongValue(v10, v18, v19);
      sub_244CC4DE0(0, 1);
    }
  }

  os_unfair_lock_unlock(v7);
}

- (BOOL)setOperationalCertificateIssuer:(id)a3 queue:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl(&dword_2446BD000, v5, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    uint64_t v9 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  return 0;
}

+ (NSData)computePASEVerifierForSetupPasscode:(NSNumber *)setupPasscode iterations:(NSNumber *)iterations salt:(NSData *)salt error:(NSError *)error
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v9 = setupPasscode;
  __int16 v10 = iterations;
  uint64_t v11 = salt;
  long long v40 = 0uLL;
  uint64_t v41 = 0;
  uint64_t v14 = objc_msgSend_unsignedIntValue(v10, v12, v13);
  __int16 v15 = v11;
  uint64_t v18 = objc_msgSend_bytes(v15, v16, v17);
  uint64_t v21 = objc_msgSend_length(v15, v19, v20);
  sub_2446C1098(&v42, v18, v21);

  long long v33 = v42;
  int v24 = objc_msgSend_unsignedIntValue(v9, v22, v23);
  sub_244CE64D0((uint64_t)v44, v14, (uint64_t *)&v33, v24, &v40);
  v39[0] = (uint64_t)"dwnfw_pase_verifier_for_code";
  v39[1] = (uint64_t)&v40;
  LODWORD(v42) = 0;
  *((void *)&v42 + 1) = "dwnfw_pase_verifier_for_code";
  char v43 = 0;
  sub_244D7E78C((uint64_t)&v42);
  long long v37 = v40;
  uint64_t v38 = v41;
  if (objc_msgSend_checkForError_logMsg_error_(MTRDeviceController, v25, (uint64_t)&v37, @"PASE verifier generation failed", error) & 1) != 0|| (uint64_t v35 = &v42, v36 = 97, sub_244CE63D8((uint64_t)v44, &v35, (uint64_t)&v33), v40 = v33, v41 = v34, v31 = v33, v32 = v34, (objc_msgSend_checkForError_logMsg_error_(MTRDeviceController, v26, (uint64_t)&v31, @"PASE verifier serialization failed", error)))
  {
    uint64_t v27 = 0;
  }
  else
  {
    sub_2446C1098(v30, (uint64_t)v35, v36);
    uint64_t v27 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v28, v30[0], v30[1]);
  }
  sub_244855660(v39);

  return (NSData *)v27;
}

- (NSData)attestationChallengeForDeviceID:(NSNumber *)deviceID
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    __int16 v12 = v6;
    _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    uint64_t v8 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  return 0;
}

- (BOOL)addServerEndpoint:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    __int16 v12 = v6;
    _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    uint64_t v8 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  return 0;
}

- (void)removeServerEndpoint:(id)a3 queue:(id)a4 completion:(id)a5
{
}

- (void)removeServerEndpoint:(id)a3
{
}

- (void)removeServerEndpointInternal:(id)a3 queue:(id)a4 completion:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v7 = a4;
  id v8 = a5;
  uint64_t v9 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = objc_opt_class();
    __int16 v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    _os_log_impl(&dword_2446BD000, v9, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    __int16 v12 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  if (v7 && v8) {
    dispatch_async(v7, v8);
  }
}

+ (BOOL)checkForError:(ChipError *)a3 logMsg:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a4;
  unsigned int mError = a3->mError;
  if (a3->mError)
  {
    uint64_t v10 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      long long v22 = *(_OWORD *)&a3->mError;
      uint64_t v23 = *(void *)&a3->mLine;
      __int16 v11 = sub_244CB7B34((const char **)&v22, 1);
      id v12 = v8;
      uint64_t v15 = objc_msgSend_UTF8String(v12, v13, v14);
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = a1;
      *(_WORD *)&buf[22] = 2080;
      uint64_t v25 = v15;
      _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_ERROR, "Error(%s): %@ %s", buf, 0x20u);
    }

    if (sub_244CC4E58(1u))
    {
      *(_OWORD *)buf = *(_OWORD *)&a3->mError;
      *(void *)&buf[16] = *(void *)&a3->mLine;
      sub_244CB7B34((const char **)buf, 1);
      id v16 = v8;
      objc_msgSend_UTF8String(v16, v17, v18);
      sub_244CC4DE0(0, 1);
    }
    if (a5)
    {
      long long v20 = *(_OWORD *)&a3->mError;
      uint64_t v21 = *(void *)&a3->mLine;
      sub_244B26908((uint64_t)MTRError, &v20);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return mError != 0;
}

- (BOOL)checkIsRunning
{
  return objc_msgSend_checkIsRunning_(self, a2, 0);
}

- (BOOL)checkIsRunning:(id *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  char isRunning = objc_msgSend_isRunning(self, a2, (uint64_t)a3);
  if ((isRunning & 1) == 0)
  {
    uint64_t v6 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138412802;
      uint64_t v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = self;
      __int16 v22 = 2080;
      uint64_t v23 = objc_msgSend_UTF8String(@"Controller is not running. Call startup first.", v9, v10);
      _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_ERROR, "%@: %@ Error: %s", buf, 0x20u);
    }
    if (sub_244CC4E58(1u))
    {
      __int16 v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      objc_msgSend_UTF8String(@"Controller is not running. Call startup first.", v13, v14);
      sub_244CC4DE0(0, 1);
    }
    if (a3)
    {
      LODWORD(v16) = 3;
      *((void *)&v16 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/MTRDeviceController.mm";
      int v17 = 532;
      sub_244B26908((uint64_t)MTRError, &v16);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return isRunning;
}

- (void)getSessionForNode:(unint64_t)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    long long v16 = v8;
    _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    uint64_t v10 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  buf[0] = 0;
  LODWORD(v11) = 3;
  *((void *)&v11 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/"
                          "MTRDeviceController.mm";
  int v12 = 541;
  uint64_t v9 = sub_244B26908((uint64_t)MTRError, &v11);
  (*((void (**)(id, void, uint8_t *, void *, void))v5 + 2))(v5, 0, buf, v9, 0);

  sub_24479DF48((uint64_t)buf);
}

- (void)getSessionForCommissioneeDevice:(unint64_t)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    long long v16 = v8;
    _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    uint64_t v10 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  buf[0] = 0;
  LODWORD(v11) = 3;
  *((void *)&v11 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/"
                          "MTRDeviceController.mm";
  int v12 = 547;
  uint64_t v9 = sub_244B26908((uint64_t)MTRError, &v11);
  (*((void (**)(id, void, uint8_t *, void *, void))v5 + 2))(v5, 0, buf, v9, 0);

  sub_24479DF48((uint64_t)buf);
}

- (void)asyncDispatchToMatterQueue:(id)a3 errorHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = (void (**)(id, void *))a4;
  uint64_t v6 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    long long v16 = v8;
    _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    uint64_t v10 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  LODWORD(v11) = 3;
  *((void *)&v11 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/"
                          "MTRDeviceController.mm";
  int v12 = 554;
  uint64_t v9 = sub_244B26908((uint64_t)MTRError, &v11);
  v5[2](v5, v9);
}

- (void)syncRunOnWorkQueue:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (qword_26B0D43B0 != -1) {
    dispatch_once_f(&qword_26B0D43B0, &byte_26B0D4370, (dispatch_function_t)sub_2446D7DB8);
  }
  if (sub_244D77BF4(&byte_26B0D4370))
  {
    uint64_t v9 = sub_244CC8484(0x1Bu, "Support");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v14 = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDeviceController.mm";
      __int16 v15 = 1024;
      int v16 = 559;
      __int16 v17 = 2080;
      uint64_t v18 = "!chip::DeviceLayer::PlatformMgrImpl().IsWorkQueueCurrentQueue()";
      _os_log_impl(&dword_2446BD000, v9, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0x1Bu, 1);
    }
    abort();
  }
  if (objc_msgSend_checkIsRunning_(self, v7, (uint64_t)a4))
  {
    chipWorkQueue = self->_chipWorkQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_244852484;
    block[3] = &unk_265198AC8;
    block[4] = self;
    int v12 = a4;
    id v11 = v6;
    dispatch_sync(chipWorkQueue, block);
  }
}

- (id)syncRunOnWorkQueueWithReturnValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_244852634;
  __int16 v22 = sub_244852644;
  id v23 = 0;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = sub_24485264C;
  __int16 v15 = &unk_265198AF0;
  id v16 = v6;
  __int16 v17 = &v18;
  id v7 = v6;
  id v8 = (void *)MEMORY[0x2456969D0](&v12);
  objc_msgSend_syncRunOnWorkQueue_error_(self, v9, (uint64_t)v8, a4, v12, v13, v14, v15);
  id v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);

  return v10;
}

- (BOOL)syncRunOnWorkQueueWithBoolReturnValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = sub_2448527AC;
  uint64_t v14 = &unk_265198AF0;
  id v15 = v6;
  id v16 = &v17;
  id v7 = v6;
  id v8 = (void *)MEMORY[0x2456969D0](&v11);
  objc_msgSend_syncRunOnWorkQueue_error_(self, v9, (uint64_t)v8, a4, v11, v12, v13, v14);
  LOBYTE(a4) = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)a4;
}

- (unsigned)fabricIndex
{
  return atomic_load(&self->_storedFabricIndex.__a_.__a_value);
}

- (NSNumber)compressedFabricID
{
  _X2 = 0;
  _X3 = 0;
  __asm { CASPAL          X2, X3, X2, X3, [X8] }

  return (NSNumber *)0;
}

- (void)setDeviceControllerDelegate:(id)delegate queue:(dispatch_queue_t)queue
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = (MTRDeviceControllerDelegate *)delegate;
  id v8 = queue;
  uint64_t v9 = self;
  objc_sync_enter(v9);
  strongDelegateForSetDelegateAPI = v9->_strongDelegateForSetDelegateAPI;
  if (!strongDelegateForSetDelegateAPI)
  {
LABEL_8:
    objc_storeStrong((id *)&v9->_strongDelegateForSetDelegateAPI, delegate);
    objc_msgSend_addDeviceControllerDelegate_queue_(v9, v14, (uint64_t)v7, v8);
    goto LABEL_9;
  }
  if (strongDelegateForSetDelegateAPI != v7)
  {
    uint64_t v11 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v9->_strongDelegateForSetDelegateAPI;
      *(_DWORD *)buf = 138412802;
      char v20 = v9;
      __int16 v21 = 2048;
      __int16 v22 = v12;
      __int16 v23 = 2048;
      uint64_t v24 = v7;
      _os_log_impl(&dword_2446BD000, v11, OS_LOG_TYPE_DEFAULT, "%@ setDeviceControllerDelegate: replacing %p with %p", buf, 0x20u);
    }

    if (sub_244CC4E58(2u))
    {
      uint64_t v17 = v9->_strongDelegateForSetDelegateAPI;
      uint64_t v18 = v7;
      id v16 = v9;
      sub_244CC4DE0(0, 2);
    }
    objc_msgSend_removeDeviceControllerDelegate_(v9, v13, (uint64_t)v9->_strongDelegateForSetDelegateAPI, v16, v17, v18);
    goto LABEL_8;
  }
  id v15 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    char v20 = v9;
    __int16 v21 = 2048;
    __int16 v22 = v7;
    _os_log_impl(&dword_2446BD000, v15, OS_LOG_TYPE_DEFAULT, "%@ setDeviceControllerDelegate: delegate %p is already set", buf, 0x16u);
  }

  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(0, 2);
  }
LABEL_9:
  objc_sync_exit(v9);
}

- (void)addDeviceControllerDelegate:(id)a3 queue:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_244852D68;
  v22[3] = &unk_265198B18;
  id v9 = v6;
  id v23 = v9;
  uint64_t v24 = &v25;
  objc_msgSend__iterateDelegateInfoWithBlock_(v8, v10, (uint64_t)v22);
  if (*((unsigned char *)v26 + 24))
  {
    uint64_t v11 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = v8;
      _os_log_impl(&dword_2446BD000, v11, OS_LOG_TYPE_DEFAULT, "%@ addDeviceControllerDelegate: delegate already added", buf, 0xCu);
    }

    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(0, 2);
    }
  }
  else
  {
    uint64_t v12 = [MTRDeviceControllerDelegateInfo alloc];
    uint64_t v14 = objc_msgSend_initWithDelegate_queue_(v12, v13, (uint64_t)v9, v7);
    objc_msgSend_addObject_(v8->_delegates, v15, (uint64_t)v14);
    id v16 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = objc_msgSend_count(v8->_delegates, v17, v18);
      *(_DWORD *)buf = 138412802;
      uint64_t v30 = v8;
      __int16 v31 = 2048;
      id v32 = v9;
      __int16 v33 = 2048;
      uint64_t v34 = v19;
      _os_log_impl(&dword_2446BD000, v16, OS_LOG_TYPE_DEFAULT, "%@ addDeviceControllerDelegate: added %p total %lu", buf, 0x20u);
    }

    if (sub_244CC4E58(2u))
    {
      objc_msgSend_count(v8->_delegates, v20, v21);
      sub_244CC4DE0(0, 2);
    }
  }
  _Block_object_dispose(&v25, 8);
  objc_sync_exit(v8);
}

- (void)removeDeviceControllerDelegate:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = (MTRDeviceControllerDelegate *)a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (v5->_strongDelegateForSetDelegateAPI == v4)
  {
    v5->_strongDelegateForSetDelegateAPI = 0;
  }
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_244852634;
  uint64_t v27 = sub_244852644;
  id v28 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_2448530C8;
  v20[3] = &unk_265198B18;
  id v6 = v4;
  uint64_t v21 = v6;
  __int16 v22 = &v23;
  objc_msgSend__iterateDelegateInfoWithBlock_(v5, v7, (uint64_t)v20);
  uint64_t v9 = v24[5];
  if (v9)
  {
    objc_msgSend_removeObject_(v5->_delegates, v8, v9);
    id v10 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_msgSend_count(v5->_delegates, v11, v12);
      *(_DWORD *)buf = 138412802;
      uint64_t v30 = v5;
      __int16 v31 = 2048;
      id v32 = v6;
      __int16 v33 = 2048;
      uint64_t v34 = v13;
      _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_DEFAULT, "%@ removeDeviceControllerDelegate: removed %p remaining %lu", buf, 0x20u);
    }

    if (sub_244CC4E58(2u))
    {
LABEL_11:
      objc_msgSend_count(v5->_delegates, v14, v15);
      sub_244CC4DE0(0, 2);
    }
  }
  else
  {
    id v16 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = objc_msgSend_count(v5->_delegates, v17, v18);
      *(_DWORD *)buf = 138412802;
      uint64_t v30 = v5;
      __int16 v31 = 2048;
      id v32 = v6;
      __int16 v33 = 2048;
      uint64_t v34 = v19;
      _os_log_impl(&dword_2446BD000, v16, OS_LOG_TYPE_DEFAULT, "%@ removeDeviceControllerDelegate: delegate %p not found in %lu", buf, 0x20u);
    }

    if (sub_244CC4E58(2u)) {
      goto LABEL_11;
    }
  }

  _Block_object_dispose(&v23, 8);
  objc_sync_exit(v5);
}

- (void)_clearDeviceControllerDelegates
{
  obj = self;
  objc_sync_enter(obj);
  strongDelegateForSetDelegateAPI = obj->_strongDelegateForSetDelegateAPI;
  obj->_strongDelegateForSetDelegateAPI = 0;

  objc_msgSend_removeAllObjects(obj->_delegates, v3, v4);
  objc_sync_exit(obj);
}

- (unint64_t)_iterateDelegateInfoWithBlock:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void *))a3;
  id v5 = self;
  objc_sync_enter(v5);
  obj = (void **)&v5->super.isa;
  if (objc_msgSend_count(v5->_delegates, v6, v7))
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v8 = v5->_delegates;
    id v10 = 0;
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v40, v50, 16);
    if (v13)
    {
      uint64_t v14 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v41 != v14) {
            objc_enumerationMutation(v8);
          }
          id v16 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v19 = objc_msgSend_delegate(v16, v11, v12);
          if (v19)
          {
            if (v4) {
              v4[2](v4, v16);
            }
          }
          else
          {
            if (!v10)
            {
              id v10 = objc_msgSend_array(MEMORY[0x263EFF980], v17, v18);
            }
            objc_msgSend_addObject_(v10, v17, (uint64_t)v16);
          }
        }
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v40, v50, 16);
      }
      while (v13);
    }

    if (objc_msgSend_count(v10, v20, v21))
    {
      objc_msgSend_removeObjectsInArray_(obj[189], v22, (uint64_t)v10);
      uint64_t v24 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = objc_msgSend_count(v10, v25, v26);
        uint64_t v30 = objc_msgSend_count(obj[189], v28, v29);
        *(_DWORD *)buf = 138412802;
        uint64_t v45 = (MTRDeviceController *)obj;
        __int16 v46 = 2048;
        uint64_t v47 = v27;
        __int16 v48 = 2048;
        uint64_t v49 = v30;
        _os_log_impl(&dword_2446BD000, v24, OS_LOG_TYPE_DEFAULT, "%@ _iterateDelegatesWithBlock: removed %lu remaining %lu", buf, 0x20u);
      }

      if (sub_244CC4E58(2u))
      {
        uint64_t v37 = objc_msgSend_count(v10, v22, v23);
        uint64_t v38 = objc_msgSend_count(obj[189], v31, v32);
        uint64_t v36 = obj;
        sub_244CC4DE0(0, 2);
      }
    }
    unint64_t v33 = objc_msgSend_count(obj[189], v22, v23, v36, v37, v38);
  }
  else
  {
    uint64_t v34 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v45 = v5;
      _os_log_impl(&dword_2446BD000, v34, OS_LOG_TYPE_DEFAULT, "%@ No delegates to iterate", buf, 0xCu);
    }

    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(0, 2);
    }
    unint64_t v33 = 0;
  }
  objc_sync_exit(obj);

  return v33;
}

- (void)_callDelegatesWithBlock:(id)a3 logString:(const char *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_244853710;
  v11[3] = &unk_265198B40;
  id v7 = v6;
  id v12 = v7;
  uint64_t v9 = objc_msgSend__iterateDelegateInfoWithBlock_(self, v8, (uint64_t)v11);
  id v10 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v14 = self;
    __int16 v15 = 2048;
    uint64_t v16 = v9;
    __int16 v17 = 2080;
    uint64_t v18 = a4;
    _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_DEFAULT, "%@ %lu delegates called for %s", buf, 0x20u);
  }

  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(0, 2);
  }
}

- (void)controller:(id)a3 statusUpdate:(int64_t)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_2448538CC;
  v9[3] = &unk_265198B68;
  id v10 = v6;
  int64_t v11 = a4;
  id v7 = v6;
  objc_msgSend__callDelegatesWithBlock_logString_(self, v8, (uint64_t)v9, "-[MTRDeviceController controller:statusUpdate:]");
}

- (void)controller:(id)a3 commissioningSessionEstablishmentDone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_244853A28;
  v11[3] = &unk_265198B90;
  id v12 = v6;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  objc_msgSend__callDelegatesWithBlock_logString_(self, v10, (uint64_t)v11, "-[MTRDeviceController controller:commissioningSessionEstablishmentDone:]");
}

- (void)controller:(id)a3 commissioningComplete:(id)a4 nodeID:(id)a5 metrics:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_244853BE8;
  v19[3] = &unk_265198BB8;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  objc_msgSend__callDelegatesWithBlock_logString_(self, v18, (uint64_t)v19, "-[MTRDeviceController controller:commissioningComplete:nodeID:metrics:]");
}

- (void)controller:(id)a3 readCommissioningInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_244853D94;
  v11[3] = &unk_265198B90;
  id v12 = v6;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  objc_msgSend__callDelegatesWithBlock_logString_(self, v10, (uint64_t)v11, "-[MTRDeviceController controller:readCommissioningInfo:]");
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSMapTable)nodeIDToDeviceMap
{
  return self->_nodeIDToDeviceMap;
}

- (OS_dispatch_queue)chipWorkQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 1544, 1);
}

- (void)setChipWorkQueue:(id)a3
{
}

- (MTRDeviceControllerDataStore)controllerDataStore
{
  return self->_controllerDataStore;
}

- (MTROTAProviderDelegate)otaProviderDelegate
{
  return self->_otaProviderDelegate;
}

- (OS_dispatch_queue)otaProviderDelegateQueue
{
  return self->_otaProviderDelegateQueue;
}

- (MTRAsyncWorkQueue)concurrentSubscriptionPool
{
  return self->_concurrentSubscriptionPool;
}

- (NSNumber)fabricID
{
  return self->_fabricID;
}

- (void)setFabricID:(id)a3
{
}

- (NSNumber)nodeID
{
  return self->_nodeID;
}

- (void)setNodeID:(id)a3
{
}

- (NSData)rootPublicKey
{
  return self->_rootPublicKey;
}

- (void)setRootPublicKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootPublicKey, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_storeStrong((id *)&self->_fabricID, 0);
  objc_storeStrong((id *)&self->_concurrentSubscriptionPool, 0);
  objc_storeStrong((id *)&self->_otaProviderDelegateQueue, 0);
  objc_storeStrong((id *)&self->_otaProviderDelegate, 0);
  objc_storeStrong((id *)&self->_controllerDataStore, 0);
  objc_storeStrong((id *)&self->_chipWorkQueue, 0);
  objc_storeStrong((id *)&self->_nodeIDToDeviceMap, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_strongDelegateForSetDelegateAPI, 0);
  objc_storeStrong((id *)&self->_delegates, 0);

  sub_244CEDE1C((uint64_t)&self->_operationalKeypairBridge);
  sub_244CEDE1C((uint64_t)&self->_signingKeypairBridge);
  objc_storeStrong((id *)&self->_storageBehaviorConfiguration, 0);
  objc_storeStrong((id *)&self->_serverEndpoints, 0);

  objc_storeStrong((id *)&self->_commissionableBrowser, 0);
}

- (id).cxx_construct
{
  *((void *)self + 15) = &unk_26F954540;
  *((unsigned char *)self + 712) = 0;
  *((void *)self + 14) = &unk_26F943F78;
  *((void *)self + 90) = 0;
  *((void *)self + 91) = &unk_26F954540;
  *((void *)self + 102) = &unk_26F954540;
  *((unsigned char *)self + 1408) = 0;
  *((void *)self + 101) = &unk_26F943F78;
  *((void *)self + 177) = 0;
  *((void *)self + 178) = &unk_26F954540;
  return self;
}

- (NSNumber)controllerNodeId
{
  return (NSNumber *)((uint64_t (*)(MTRDeviceController *, char *))MEMORY[0x270F9A6D0])(self, sel_controllerNodeID);
}

- (NSData)fetchAttestationChallengeForDeviceId:(uint64_t)deviceId
{
  uint64_t v4 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, a2, deviceId);
  id v6 = objc_msgSend_attestationChallengeForDeviceID_(self, v5, (uint64_t)v4);

  return (NSData *)v6;
}

- (BOOL)getBaseDevice:(uint64_t)deviceID queue:(dispatch_queue_t)queue completionHandler:(MTRDeviceConnectionCallback)completionHandler
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    id v10 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  return 0;
}

- (BOOL)pairDevice:(uint64_t)deviceID discriminator:(uint16_t)discriminator setupPINCode:(uint32_t)setupPINCode error:(NSError *)error
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = objc_opt_class();
    id v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v10;
    _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    uint64_t v12 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  if (error)
  {
    LODWORD(v13) = 3;
    *((void *)&v13 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTRDeviceController.mm";
    int v14 = 921;
    sub_244B26908((uint64_t)MTRError, &v13);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)pairDevice:(uint64_t)deviceID address:(NSString *)address port:(uint16_t)port setupPINCode:(uint32_t)setupPINCode error:(NSError *)error
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v9 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = objc_opt_class();
    id v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v17 = v10;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    _os_log_impl(&dword_2446BD000, v9, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    long long v13 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  if (error)
  {
    LODWORD(v14) = 3;
    *((void *)&v14 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTRDeviceController.mm";
    int v15 = 934;
    sub_244B26908((uint64_t)MTRError, &v14);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)pairDevice:(uint64_t)deviceID onboardingPayload:(NSString *)onboardingPayload error:(NSError *)error
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v7 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    id v11 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  if (error)
  {
    LODWORD(v12) = 3;
    *((void *)&v12 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTRDeviceController.mm";
    int v13 = 943;
    sub_244B26908((uint64_t)MTRError, &v12);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)commissionDevice:(uint64_t)deviceId commissioningParams:(MTRCommissioningParameters *)commissioningParams error:(NSError *)error
{
  uint64_t v8 = commissioningParams;
  uint64_t v10 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v9, deviceId);
  LOBYTE(error) = objc_msgSend_commissionNodeWithID_commissioningParams_error_(self, v11, (uint64_t)v10, v8, error);

  return (char)error;
}

- (BOOL)stopDevicePairing:(uint64_t)deviceID error:(NSError *)error
{
  id v6 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, a2, deviceID);
  LOBYTE(error) = objc_msgSend_cancelCommissioningForNodeID_error_(self, v7, (uint64_t)v6, error);

  return (char)error;
}

- (MTRBaseDevice)getDeviceBeingCommissioned:(uint64_t)deviceId error:(NSError *)error
{
  id v6 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, a2, deviceId);
  uint64_t v8 = objc_msgSend_deviceBeingCommissionedWithNodeID_error_(self, v7, (uint64_t)v6, error);

  return (MTRBaseDevice *)v8;
}

- (BOOL)openPairingWindow:(uint64_t)deviceID duration:(NSUInteger)duration error:(NSError *)error
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v7 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    id v11 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  if (error)
  {
    LODWORD(v12) = 3;
    *((void *)&v12 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTRDeviceController.mm";
    int v13 = 969;
    sub_244B26908((uint64_t)MTRError, &v12);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (NSString)openPairingWindowWithPIN:(uint64_t)deviceID duration:(NSUInteger)duration discriminator:(NSUInteger)discriminator setupPIN:(NSUInteger)setupPIN error:(NSError *)error
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v9 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = objc_opt_class();
    id v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v17 = v10;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    _os_log_impl(&dword_2446BD000, v9, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    int v13 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  if (error)
  {
    LODWORD(v14) = 3;
    *((void *)&v14 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTRDeviceController.mm";
    int v15 = 982;
    sub_244B26908((uint64_t)MTRError, &v14);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (NSData)computePaseVerifier:(uint32_t)setupPincode iterations:(uint32_t)iterations salt:(NSData *)salt
{
  uint64_t v5 = *(void *)&iterations;
  uint64_t v6 = *(void *)&setupPincode;
  uint64_t v7 = salt;
  uint64_t v9 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v8, v6);
  id v11 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v10, v5);
  int v13 = objc_msgSend_computePASEVerifierForSetupPasscode_iterations_salt_error_(MTRDeviceController, v12, (uint64_t)v9, v11, v7, 0);

  return (NSData *)v13;
}

- (void)setPairingDelegate:(id)delegate queue:(dispatch_queue_t)queue
{
  id v11 = delegate;
  uint64_t v6 = queue;
  uint64_t v7 = [MTRDevicePairingDelegateShim alloc];
  uint64_t v9 = objc_msgSend_initWithDelegate_(v7, v8, (uint64_t)v11);
  objc_msgSend_setDeviceControllerDelegate_queue_(self, v10, (uint64_t)v9, v6);
}

- (void)setNocChainIssuer:(id)nocChainIssuer queue:(dispatch_queue_t)queue
{
  id v11 = nocChainIssuer;
  uint64_t v6 = queue;
  uint64_t v7 = [MTROperationalCertificateChainIssuerShim alloc];
  uint64_t v9 = objc_msgSend_initWithIssuer_(v7, v8, (uint64_t)v11);
  objc_msgSend_setOperationalCertificateIssuer_queue_(self, v10, (uint64_t)v9, v6);
}

+ (MTRDeviceController)sharedControllerWithID:(id)controllerID xpcConnectBlock:(MTRXPCConnectBlock)xpcConnectBlock
{
  uint64_t v4 = objc_msgSend_sharedControllerWithID_xpcConnectBlock_(MTRDeviceControllerOverXPC, a2, (uint64_t)controllerID, xpcConnectBlock);

  return (MTRDeviceController *)v4;
}

+ (NSArray)encodeXPCResponseValues:(NSArray *)values
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  v55 = values;
  if (v55)
  {
    objc_msgSend_array(MEMORY[0x263EFF980], v3, v4);
    id v58 = (id)objc_claimAutoreleasedReturnValue();
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    obj = v55;
    uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v60, v64, 16);
    if (!v6) {
      goto LABEL_25;
    }
    uint64_t v57 = *(void *)v61;
    while (1)
    {
      uint64_t v59 = v6;
      for (uint64_t i = 0; i != v59; ++i)
      {
        if (*(void *)v61 != v57) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        if (!v9)
        {
LABEL_14:
          objc_msgSend_addObject_(v58, v7, (uint64_t)v9);
          continue;
        }
        uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*((void *)&v60 + 1) + 8 * i), v7, @"attributePath");
        if (v10)
        {
        }
        else
        {
          int v13 = objc_msgSend_objectForKeyedSubscript_(v9, v11, @"commandPath");
          BOOL v14 = v13 == 0;

          if (v14) {
            goto LABEL_14;
          }
        }
        int v15 = (void *)MEMORY[0x263EFF9A0];
        uint64_t v16 = objc_msgSend_count(v9, v7, v12);
        __int16 v18 = objc_msgSend_dictionaryWithCapacity_(v15, v17, v16);
        objc_msgSend_addEntriesFromDictionary_(v18, v19, (uint64_t)v9);
        id v21 = objc_msgSend_objectForKeyedSubscript_(v9, v20, @"attributePath");
        LOBYTE(v15) = v21 == 0;

        if ((v15 & 1) == 0)
        {
          objc_msgSend_objectForKeyedSubscript_(v9, v22, @"attributePath");
          id v23 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v26 = v23;
          if (v23)
          {
            uint64_t v27 = objc_msgSend_endpoint(v23, v24, v25);
            v65 = v27;
            uint64_t v30 = objc_msgSend_cluster(v26, v28, v29);
            v66 = v30;
            unint64_t v33 = objc_msgSend_attribute(v26, v31, v32);
            v67 = v33;
            uint64_t v35 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v34, (uint64_t)&v65, 3);
          }
          else
          {
            uint64_t v35 = 0;
          }

          objc_msgSend_setObject_forKeyedSubscript_(v18, v36, (uint64_t)v35, @"attributePath");
        }
        uint64_t v37 = objc_msgSend_objectForKeyedSubscript_(v9, v22, @"commandPath");
        BOOL v38 = v37 == 0;

        if (!v38)
        {
          objc_msgSend_objectForKeyedSubscript_(v9, v39, @"commandPath");
          id v40 = (id)objc_claimAutoreleasedReturnValue();
          long long v43 = v40;
          if (v40)
          {
            long long v44 = objc_msgSend_endpoint(v40, v41, v42);
            v65 = v44;
            uint64_t v47 = objc_msgSend_cluster(v43, v45, v46);
            v66 = v47;
            uint64_t v50 = objc_msgSend_command(v43, v48, v49);
            v67 = v50;
            v52 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v51, (uint64_t)&v65, 3);
          }
          else
          {
            v52 = 0;
          }

          objc_msgSend_setObject_forKeyedSubscript_(v18, v53, (uint64_t)v52, @"commandPath");
        }
        objc_msgSend_addObject_(v58, v39, (uint64_t)v18);
      }
      uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v60, v64, 16);
      if (!v6)
      {
LABEL_25:

        goto LABEL_27;
      }
    }
  }
  id v58 = 0;
LABEL_27:

  return (NSArray *)v58;
}

+ (NSArray)decodeXPCResponseValues:(NSArray *)values
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  v53 = values;
  if (v53)
  {
    objc_msgSend_array(MEMORY[0x263EFF980], v3, v4);
    id v57 = (id)objc_claimAutoreleasedReturnValue();
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    obj = v53;
    uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v58, v62, 16);
    if (!v6) {
      goto LABEL_26;
    }
    uint64_t v55 = *(void *)v59;
    while (1)
    {
      uint64_t v56 = v6;
      for (uint64_t i = 0; i != v56; ++i)
      {
        if (*(void *)v59 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        if (!v9) {
          goto LABEL_11;
        }
        uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*((void *)&v58 + 1) + 8 * i), v7, @"attributePath");
        if (v10)
        {

          goto LABEL_12;
        }
        int v13 = objc_msgSend_objectForKeyedSubscript_(v9, v11, @"commandPath");
        BOOL v14 = v13 == 0;

        if (v14) {
LABEL_11:
        }
          objc_msgSend_addObject_(v57, v7, (uint64_t)v9);
LABEL_12:
        int v15 = (void *)MEMORY[0x263EFF9A0];
        uint64_t v16 = objc_msgSend_count(v9, v7, v12);
        __int16 v18 = objc_msgSend_dictionaryWithCapacity_(v15, v17, v16);
        objc_msgSend_addEntriesFromDictionary_(v18, v19, (uint64_t)v9);
        id v21 = objc_msgSend_objectForKeyedSubscript_(v9, v20, @"attributePath");
        LOBYTE(v15) = v21 == 0;

        if ((v15 & 1) == 0)
        {
          objc_msgSend_objectForKeyedSubscript_(v9, v22, @"attributePath");
          id v23 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v26 = v23;
          if (v23 && objc_msgSend_count(v23, v24, v25) == 3)
          {
            id v28 = objc_msgSend_objectAtIndexedSubscript_(v26, v27, 0);
            uint64_t v30 = objc_msgSend_objectAtIndexedSubscript_(v26, v29, 1);
            uint64_t v32 = objc_msgSend_objectAtIndexedSubscript_(v26, v31, 2);
            uint64_t v34 = objc_msgSend_attributePathWithEndpointID_clusterID_attributeID_(MTRAttributePath, v33, (uint64_t)v28, v30, v32);
          }
          else
          {
            uint64_t v34 = 0;
          }

          objc_msgSend_setObject_forKeyedSubscript_(v18, v35, (uint64_t)v34, @"attributePath");
        }
        uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(v9, v22, @"commandPath");
        BOOL v37 = v36 == 0;

        if (!v37)
        {
          objc_msgSend_objectForKeyedSubscript_(v9, v38, @"commandPath");
          id v39 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v42 = v39;
          if (v39 && objc_msgSend_count(v39, v40, v41) == 3)
          {
            long long v44 = objc_msgSend_objectAtIndexedSubscript_(v42, v43, 0);
            uint64_t v46 = objc_msgSend_objectAtIndexedSubscript_(v42, v45, 1);
            __int16 v48 = objc_msgSend_objectAtIndexedSubscript_(v42, v47, 2);
            uint64_t v50 = objc_msgSend_commandPathWithEndpointID_clusterID_commandID_(MTRCommandPath, v49, (uint64_t)v44, v46, v48);
          }
          else
          {
            uint64_t v50 = 0;
          }

          objc_msgSend_setObject_forKeyedSubscript_(v18, v51, (uint64_t)v50, @"commandPath");
        }
        objc_msgSend_addObject_(v57, v38, (uint64_t)v18);
      }
      uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v58, v62, 16);
      if (!v6)
      {
LABEL_26:

        goto LABEL_28;
      }
    }
  }
  id v57 = 0;
LABEL_28:

  return (NSArray *)v57;
}

+ (NSDictionary)encodeXPCReadParams:(MTRReadParams *)params
{
  uint64_t v5 = params;
  if (v5)
  {
    uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v3, v4);
    uint64_t v7 = NSNumber;
    uint64_t shouldFilterByFabric = objc_msgSend_shouldFilterByFabric(v5, v8, v9);
    uint64_t v12 = objc_msgSend_numberWithBool_(v7, v11, shouldFilterByFabric);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v13, (uint64_t)v12, @"fabricFiltered");
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSDictionary *)v6;
}

+ (MTRReadParams)decodeXPCReadParams:(NSDictionary *)params
{
  v3 = params;
  if (v3)
  {
    uint64_t v4 = objc_alloc_init(MTRReadParams);
    sub_244BC9114(v3, v4);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (NSDictionary)encodeXPCSubscribeParams:(MTRSubscribeParams *)params
{
  uint64_t v4 = params;
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v6 = objc_msgSend_encodeXPCReadParams_(MTRDeviceController, v3, (uint64_t)v4);
    uint64_t v8 = objc_msgSend_dictionaryWithDictionary_(v5, v7, (uint64_t)v6);

    uint64_t v9 = NSNumber;
    int shouldReplaceExistingSubscriptions = objc_msgSend_shouldReplaceExistingSubscriptions(v4, v10, v11);
    BOOL v14 = objc_msgSend_numberWithBool_(v9, v13, shouldReplaceExistingSubscriptions ^ 1u);
    objc_msgSend_setObject_forKeyedSubscript_(v8, v15, (uint64_t)v14, @"keepPreviousSubscriptions");

    uint64_t v16 = NSNumber;
    uint64_t shouldResubscribeAutomatically = objc_msgSend_shouldResubscribeAutomatically(v4, v17, v18);
    id v21 = objc_msgSend_numberWithBool_(v16, v20, shouldResubscribeAutomatically);
    objc_msgSend_setObject_forKeyedSubscript_(v8, v22, (uint64_t)v21, @"autoResubscribe");

    uint64_t v25 = objc_msgSend_minInterval(v4, v23, v24);
    objc_msgSend_setObject_forKeyedSubscript_(v8, v26, (uint64_t)v25, @"minInterval");

    uint64_t v29 = objc_msgSend_maxInterval(v4, v27, v28);
    objc_msgSend_setObject_forKeyedSubscript_(v8, v30, (uint64_t)v29, @"maxInterval");
  }
  else
  {
    uint64_t v8 = 0;
  }

  return (NSDictionary *)v8;
}

+ (MTRSubscribeParams)decodeXPCSubscribeParams:(NSDictionary *)params
{
  v3 = params;
  if (v3)
  {
    uint64_t v4 = [MTRSubscribeParams alloc];
    uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(v3, v5, @"minInterval");
    uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v3, v7, @"maxInterval");
    uint64_t v10 = objc_msgSend_initWithMinInterval_maxInterval_(v4, v9, (uint64_t)v6, v8);

    sub_244BC9114(v3, v10);
    uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v3, v11, @"keepPreviousSubscriptions");
    int v15 = v12;
    if (v12)
    {
      uint64_t v16 = objc_msgSend_BOOLValue(v12, v13, v14) ^ 1;
      objc_msgSend_setReplaceExistingSubscriptions_(v10, v17, v16);
    }
    else
    {
      objc_msgSend_setReplaceExistingSubscriptions_(v10, v13, 1);
    }
    uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v3, v18, @"autoResubscribe");
    id v22 = v19;
    if (v19)
    {
      uint64_t v23 = objc_msgSend_BOOLValue(v19, v20, v21);
      objc_msgSend_setResubscribeAutomatically_(v10, v24, v23);
    }
    else
    {
      objc_msgSend_setResubscribeAutomatically_(v10, v20, 1);
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return (MTRSubscribeParams *)v10;
}

+ (NSXPCInterface)xpcInterfaceForServerProtocol
{
  uint64_t v2 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], a2, (uint64_t)&unk_26FA92E20);
  v3 = sub_244BC962C();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v2, v4, (uint64_t)v3, sel_readAttributeWithController_nodeId_endpointId_clusterId_attributeId_params_completion_, 0, 1);

  uint64_t v5 = sub_244BC962C();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v2, v6, (uint64_t)v5, sel_writeAttributeWithController_nodeId_endpointId_clusterId_attributeId_value_timedWriteTimeout_completion_, 0, 1);

  uint64_t v7 = sub_244BC962C();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v2, v8, (uint64_t)v7, sel_invokeCommandWithController_nodeId_endpointId_clusterId_commandId_fields_timedInvokeTimeout_completion_, 0, 1);

  uint64_t v9 = sub_244BC962C();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v2, v10, (uint64_t)v9, sel_readAttributeCacheWithController_nodeId_endpointId_clusterId_attributeId_completion_, 0, 1);

  uint64_t v11 = sub_244BC962C();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v2, v12, (uint64_t)v11, sel_downloadLogWithController_nodeId_type_timeout_completion_, 0, 1);

  return (NSXPCInterface *)v2;
}

+ (NSXPCInterface)xpcInterfaceForClientProtocol
{
  uint64_t v2 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], a2, (uint64_t)&unk_26FA92EF0);
  v3 = sub_244BC962C();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v2, v4, (uint64_t)v3, sel_handleReportWithController_nodeId_values_error_, 2, 0);

  return (NSXPCInterface *)v2;
}

+ (MTRDeviceController)sharedControllerWithId:(id)controllerID xpcConnectBlock:(MTRXPCConnectBlock)xpcConnectBlock
{
  uint64_t v4 = objc_msgSend_sharedControllerWithID_xpcConnectBlock_(MTRDeviceController, a2, (uint64_t)controllerID, xpcConnectBlock);

  return (MTRDeviceController *)v4;
}

@end