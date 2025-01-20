@interface MTRDeviceController_Concrete
+ (BOOL)checkForError:(ChipError *)a3 logMsg:(id)a4 error:(id *)a5;
- (BOOL)addServerEndpoint:(id)a3;
- (BOOL)cancelCommissioningForNodeID:(id)a3 error:(id *)a4;
- (BOOL)checkForInitError:(BOOL)a3 logMsg:(id)a4;
- (BOOL)checkForStartError:(ChipError *)a3 logMsg:(id)a4;
- (BOOL)checkIsRunning;
- (BOOL)checkIsRunning:(id *)a3;
- (BOOL)commissionNodeWithID:(id)a3 commissioningParams:(id)a4 error:(id *)a5;
- (BOOL)continueCommissioningDevice:(void *)a3 ignoreAttestationFailure:(BOOL)a4 error:(id *)a5;
- (BOOL)getBaseDevice:(unint64_t)a3 queue:(id)a4 completionHandler:(id)a5;
- (BOOL)isRunning;
- (BOOL)matchesPendingShutdownControllerWithOperationalCertificate:(id)a3 andRootCertificate:(id)a4;
- (BOOL)openPairingWindow:(unint64_t)a3 duration:(unint64_t)a4 error:(id *)a5;
- (BOOL)pairDevice:(unint64_t)a3 address:(id)a4 port:(unsigned __int16)a5 setupPINCode:(unsigned int)a6 error:(id *)a7;
- (BOOL)pairDevice:(unint64_t)a3 discriminator:(unsigned __int16)a4 setupPINCode:(unsigned int)a5 error:(id *)a6;
- (BOOL)pairDevice:(unint64_t)a3 onboardingPayload:(id)a4 error:(id *)a5;
- (BOOL)setOperationalCertificateIssuer:(id)a3 queue:(id)a4;
- (BOOL)setupCommissioningSessionWithDiscoveredDevice:(id)a3 payload:(id)a4 newNodeID:(id)a5 error:(id *)a6;
- (BOOL)setupCommissioningSessionWithPayload:(id)a3 newNodeID:(id)a4 error:(id *)a5;
- (BOOL)shouldAdvertiseOperational;
- (BOOL)startBrowseForCommissionables:(id)a3 queue:(id)a4;
- (BOOL)startup:(id)a3;
- (BOOL)stopBrowseForCommissionables;
- (BOOL)syncRunOnWorkQueueWithBoolReturnValue:(id)a3 error:(id *)a4;
- (ChipError)isRunningOnFabric:(SEL)a3 fabricIndex:(void *)a4 isRunning:(unsigned __int8)a5;
- (MTRAsyncWorkQueue)concurrentSubscriptionPool;
- (MTRAttestationTrustStoreBridge)attestationTrustStoreBridge;
- (MTRCommissionableBrowser)commissionableBrowser;
- (MTRDeviceControllerDelegateBridge)deviceControllerDelegateBridge;
- (MTRDeviceControllerFactory)factory;
- (MTRDeviceController_Concrete)initWithFactory:(id)a3 queue:(id)a4 storageDelegate:(id)a5 storageDelegateQueue:(id)a6 otaProviderDelegate:(id)a7 otaProviderDelegateQueue:(id)a8 uniqueIdentifier:(id)a9 concurrentSubscriptionPoolSize:(unint64_t)a10 storageBehaviorConfiguration:(id)a11 startSuspended:(BOOL)a12;
- (MTRDeviceController_Concrete)initWithParameters:(id)a3 error:(id *)a4;
- (MTRDeviceStorageBehaviorConfiguration)storageBehaviorConfiguration;
- (MTROTAProviderDelegate)otaProviderDelegate;
- (NSMutableArray)serverEndpoints;
- (OS_dispatch_queue)chipWorkQueue;
- (OS_dispatch_queue)otaProviderDelegateQueue;
- (id).cxx_construct;
- (id)_setupDeviceForNodeID:(id)a3 prefetchedClusterData:(id)a4;
- (id)accessGrantsForClusterPath:(id)a3;
- (id)attestationChallengeForDeviceID:(id)a3;
- (id)baseDeviceForNodeID:(id)a3;
- (id)compressedFabricID;
- (id)controllerDataStore;
- (id)controllerNodeID;
- (id)description;
- (id)deviceBeingCommissionedWithNodeID:(id)a3 error:(id *)a4;
- (id)fetchAttestationChallengeForDeviceId:(unint64_t)a3;
- (id)neededReadPrivilegeForClusterID:(id)a3 attributeID:(id)a4;
- (id)openPairingWindowWithPIN:(unint64_t)a3 duration:(unint64_t)a4 discriminator:(unint64_t)a5 setupPIN:(unint64_t)a6 error:(id *)a7;
- (id)syncRunOnWorkQueueWithReturnValue:(id)a3 error:(id *)a4;
- (unsigned)fabricIndex;
- (unsigned)sessionTransportTypeForDevice:(id)a3;
- (void)_controllerResumed;
- (void)_controllerSuspended;
- (void)addRunAssertion;
- (void)asyncDispatchToMatterQueue:(id)a3 errorHandler:(id)a4;
- (void)asyncGetCommissionerOnMatterQueue:(id)a3 errorHandler:(id)a4;
- (void)cleanup;
- (void)cleanupAfterStartup;
- (void)clearDeviceAttestationDelegateBridge;
- (void)clearPendingShutdown;
- (void)cppCommissioner;
- (void)defaultDACVerifier;
- (void)deviceAttestationDelegateBridge;
- (void)directlyGetSessionForNode:(unint64_t)a3 completion:(id)a4;
- (void)downloadLogFromNodeWithID:(id)a3 type:(int64_t)a4 timeout:(double)a5 queue:(id)a6 completion:(id)a7;
- (void)finalShutdown;
- (void)getSessionForCommissioneeDevice:(unint64_t)a3 completion:(id)a4;
- (void)getSessionForNode:(unint64_t)a3 completion:(id)a4;
- (void)invalidateCASESessionForNode:(id)a3;
- (void)operationalCredentialsDelegate;
- (void)operationalInstanceAdded:(id)a3;
- (void)partialDACVerifier;
- (void)preWarmCommissioningSession;
- (void)removeRunAssertion;
- (void)removeServerEndpointInternal:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)removeServerEndpointOnMatterQueue:(id)a3;
- (void)setNocChainIssuer:(id)a3 queue:(id)a4;
- (void)setPairingDelegate:(id)a3 queue:(id)a4;
- (void)shutDownCppController;
- (void)shutdown;
- (void)syncRunOnWorkQueue:(id)a3 error:(id *)a4;
@end

@implementation MTRDeviceController_Concrete

- (MTRDeviceController_Concrete)initWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    objc_msgSend_sharedInstance(MTRDeviceControllerFactory, v8, v9);
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    sub_2446D706C(v10, self, v7, a4);
    v11 = (MTRDeviceController_Concrete *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_2446BD000, v12, OS_LOG_TYPE_ERROR, "Expected MTRDeviceControllerParameters but got: %@", buf, 0xCu);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    if (a4)
    {
      LODWORD(v14) = 47;
      *((void *)&v14 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/MTRDeviceController_Concrete.mm";
      int v15 = 152;
      sub_244B26908((uint64_t)MTRError, &v14);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (MTRDeviceController_Concrete)initWithFactory:(id)a3 queue:(id)a4 storageDelegate:(id)a5 storageDelegateQueue:(id)a6 otaProviderDelegate:(id)a7 otaProviderDelegateQueue:(id)a8 uniqueIdentifier:(id)a9 concurrentSubscriptionPoolSize:(unint64_t)a10 storageBehaviorConfiguration:(id)a11 startSuspended:(BOOL)a12
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v61 = a3;
  id v59 = a4;
  id v66 = a5;
  id v64 = a6;
  id v65 = a7;
  id v62 = a8;
  id v63 = a9;
  id v60 = a11;
  v67.receiver = self;
  v67.super_class = (Class)MTRDeviceController_Concrete;
  id v19 = [(MTRDeviceController *)&v67 initForSubclasses:a12];
  id v21 = v19;
  uint64_t v22 = (uint64_t)v19;
  if (!v19)
  {
    v49 = (MTRDeviceController_Concrete *)0;
    goto LABEL_40;
  }
  objc_msgSend_setUniqueIdentifier_(v19, v20, (uint64_t)v63);
  *(void *)(v22 + 3024) = 0;
  *(unsigned char *)(v22 + 3032) = 0;
  *(_DWORD *)(v22 + 3036) = 0;
  if (v66)
  {
    if (!v64)
    {
      v48 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2446BD000, v48, OS_LOG_TYPE_ERROR, "storageDelegate provided without storageDelegateQueue", buf, 2u);
      }

      if (!sub_244CC4E58(1u)) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
    id v25 = v66;
    if (objc_msgSend_localTestStorageEnabled(MTRDeviceControllerLocalTestStorage, v26, v27))
    {
      v28 = [MTRDeviceControllerLocalTestStorage alloc];
      uint64_t v30 = objc_msgSend_initWithPassThroughStorage_(v28, v29, (uint64_t)v25);

      id v25 = (id)v30;
    }
    v31 = [MTRDeviceControllerDataStore alloc];
    uint64_t v33 = objc_msgSend_initWithController_storageDelegate_storageDelegateQueue_(v31, v32, v22, v25, v64);
    v34 = (void *)*((void *)v21 + 382);
    *((void *)v21 + 382) = v33;

    BOOL v35 = *((void *)v21 + 382) == 0;
    if (v35) {
      goto LABEL_26;
    }
  }
  else if (objc_msgSend_localTestStorageEnabled(MTRDeviceControllerLocalTestStorage, v23, v24))
  {
    v36 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v37 = dispatch_queue_create("org.csa-iot.matter.framework.devicecontroller.localteststorage", v36);

    v38 = [MTRDeviceControllerLocalTestStorage alloc];
    v40 = objc_msgSend_initWithPassThroughStorage_(v38, v39, 0);
    v41 = [MTRDeviceControllerDataStore alloc];
    uint64_t v43 = objc_msgSend_initWithController_storageDelegate_storageDelegateQueue_(v41, v42, v22, v40, v37);
    v44 = (void *)*((void *)v21 + 382);
    *((void *)v21 + 382) = v43;

    BOOL v45 = *((void *)v21 + 382) == 0;
    if (v45) {
      goto LABEL_26;
    }
  }
  if (!v65 && v62)
  {
    v46 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2446BD000, v46, OS_LOG_TYPE_ERROR, "Must have otaProviderDelegate when we have otaProviderDelegateQueue", buf, 2u);
    }

    if (!sub_244CC4E58(1u)) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (v65 && !v62)
  {
    v47 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2446BD000, v47, OS_LOG_TYPE_ERROR, "Must have otaProviderDelegateQueue when we have otaProviderDelegate", buf, 2u);
    }

    if (!sub_244CC4E58(1u)) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (!v65)
  {
LABEL_38:
    objc_storeStrong((id *)v21 + 384, a7);
    objc_storeStrong((id *)v21 + 385, a8);
    objc_storeStrong((id *)v21 + 381, a4);
    objc_storeStrong((id *)v21 + 383, a3);
    id v50 = objc_alloc_init(MEMORY[0x263EFF980]);
    v51 = *(void **)(v22 + 3176);
    *(void *)(v22 + 3176) = v50;

    v52 = *(void **)(v22 + 3088);
    *(void *)(v22 + 3088) = 0;

    operator new();
  }
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
    {
      if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
      {
        if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
        {
          if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector()) {
            goto LABEL_38;
          }
          v58 = sub_244CC8484(0, "NotSpecified");
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2446BD000, v58, OS_LOG_TYPE_ERROR, "Error: MTROTAProviderDelegate does not support handleBDXQueryForNodeID", buf, 2u);
          }

          if (!sub_244CC4E58(1u)) {
            goto LABEL_26;
          }
        }
        else
        {
          v57 = sub_244CC8484(0, "NotSpecified");
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2446BD000, v57, OS_LOG_TYPE_ERROR, "Error: MTROTAProviderDelegate does not support handleBDXTransferSessionBeginForNodeID", buf, 2u);
          }

          if (!sub_244CC4E58(1u)) {
            goto LABEL_26;
          }
        }
      }
      else
      {
        v56 = sub_244CC8484(0, "NotSpecified");
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2446BD000, v56, OS_LOG_TYPE_ERROR, "Error: MTROTAProviderDelegate does not support handleNotifyUpdateAppliedForNodeID", buf, 2u);
        }

        if (!sub_244CC4E58(1u)) {
          goto LABEL_26;
        }
      }
    }
    else
    {
      v55 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2446BD000, v55, OS_LOG_TYPE_ERROR, "Error: MTROTAProviderDelegate does not support handleApplyUpdateRequestForNodeID", buf, 2u);
      }

      if (!sub_244CC4E58(1u)) {
        goto LABEL_26;
      }
    }
  }
  else
  {
    v54 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2446BD000, v54, OS_LOG_TYPE_ERROR, "Error: MTROTAProviderDelegate does not support handleQueryImageForNodeID", buf, 2u);
    }

    if (!sub_244CC4E58(1u)) {
      goto LABEL_26;
    }
  }
LABEL_25:
  sub_244CC4DE0(0, 1);
LABEL_26:
  v49 = 0;
LABEL_40:

  return v49;
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
  v12 = objc_msgSend_stringWithFormat_(v3, v11, @"<%@: %p, uuid: %@, suspended: %@>", v5, self, v8, @"NO");
  }

  return v12;
}

- (BOOL)isRunning
{
  return self->_cppCommissioner != 0;
}

- (void)_controllerSuspended
{
  v3 = self->_factory;
  chipWorkQueue = self->_chipWorkQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_244B89850;
  v6[3] = &unk_265193DC8;
  uint64_t v7 = v3;
  v8 = self;
  v5 = v3;
  dispatch_async(chipWorkQueue, v6);
}

- (void)_controllerResumed
{
  v3 = self->_factory;
  chipWorkQueue = self->_chipWorkQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_244B89970;
  v6[3] = &unk_265193DC8;
  uint64_t v7 = v3;
  v8 = self;
  v5 = v3;
  dispatch_async(chipWorkQueue, v6);
}

- (BOOL)matchesPendingShutdownControllerWithOperationalCertificate:(id)a3 andRootCertificate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = v7;
  char v10 = 0;
  if (v6 && v7)
  {
    v11 = objc_msgSend_nodeIDFromNOC_(MTRDeviceControllerParameters, v8, (uint64_t)v6);
    v13 = objc_msgSend_fabricIDFromNOC_(MTRDeviceControllerParameters, v12, (uint64_t)v6);
    int v15 = objc_msgSend_publicKeyFromCertificate_(MTRDeviceControllerParameters, v14, (uint64_t)v9);
    p_assertionLock = &self->_assertionLock;
    os_unfair_lock_lock(&self->_assertionLock);
    if (self->_keepRunningAssertionCounter && self->_shutdownPending)
    {
      id v19 = objc_msgSend_nodeID(self, v17, v18);
      if (sub_2446BE670(v11, v19))
      {
        uint64_t v22 = objc_msgSend_fabricID(self, v20, v21);
        if (sub_2446BE670(v13, v22))
        {
          id v25 = objc_msgSend_rootPublicKey(self, v23, v24);
          char v10 = sub_2446BE670(v15, v25);
        }
        else
        {
          char v10 = 0;
        }
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
    os_unfair_lock_unlock(p_assertionLock);
  }
  return v10;
}

- (void)addRunAssertion
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  p_assertionLock = &self->_assertionLock;
  os_unfair_lock_lock(&self->_assertionLock);
  if (objc_msgSend_isRunning(self, v4, v5))
  {
    ++self->_keepRunningAssertionCounter;
    id v6 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t keepRunningAssertionCounter = self->_keepRunningAssertionCounter;
      *(_DWORD *)buf = 138412546;
      uint64_t v9 = self;
      __int16 v10 = 2048;
      unint64_t v11 = keepRunningAssertionCounter;
      _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_DEFAULT, "%@ Adding keep running assertion, total %lu", buf, 0x16u);
    }

    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(0, 2);
    }
  }
  os_unfair_lock_unlock(p_assertionLock);
}

- (void)removeRunAssertion
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  p_assertionLock = &self->_assertionLock;
  os_unfair_lock_lock(&self->_assertionLock);
  unint64_t keepRunningAssertionCounter = self->_keepRunningAssertionCounter;
  if (keepRunningAssertionCounter)
  {
    self->_unint64_t keepRunningAssertionCounter = keepRunningAssertionCounter - 1;
    uint64_t v5 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v6 = self->_keepRunningAssertionCounter;
      *(_DWORD *)buf = 138412546;
      v16 = self;
      __int16 v17 = 2048;
      unint64_t v18 = v6;
      _os_log_impl(&dword_2446BD000, v5, OS_LOG_TYPE_DEFAULT, "%@ Removing keep running assertion, total %lu", buf, 0x16u);
    }

    if (sub_244CC4E58(2u))
    {
      uint64_t v12 = self;
      unint64_t v14 = self->_keepRunningAssertionCounter;
      sub_244CC4DE0(0, 2);
    }
    if (objc_msgSend_isRunning(self, v7, v8, v12, v14)
      && !self->_keepRunningAssertionCounter
      && self->_shutdownPending)
    {
      uint64_t v9 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = self;
        _os_log_impl(&dword_2446BD000, v9, OS_LOG_TYPE_DEFAULT, "%@ All assertions removed and shutdown is pending, shutting down", buf, 0xCu);
      }

      if (sub_244CC4E58(2u))
      {
        v13 = self;
        sub_244CC4DE0(0, 2);
      }
      objc_msgSend_finalShutdown(self, v10, v11, v13);
    }
  }
  os_unfair_lock_unlock(p_assertionLock);
}

- (void)clearPendingShutdown
{
  p_assertionLock = &self->_assertionLock;
  os_unfair_lock_lock(&self->_assertionLock);
  self->_shutdownPending = 0;

  os_unfair_lock_unlock(p_assertionLock);
}

- (void)shutdown
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_assertionLock = &self->_assertionLock;
  os_unfair_lock_lock(&self->_assertionLock);
  if (self->_keepRunningAssertionCounter)
  {
    unint64_t v6 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t keepRunningAssertionCounter = self->_keepRunningAssertionCounter;
      *(_DWORD *)buf = 138412546;
      __int16 v10 = self;
      __int16 v11 = 2048;
      unint64_t v12 = keepRunningAssertionCounter;
      _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_DEFAULT, "%@ Pending shutdown since %lu assertions are present", buf, 0x16u);
    }

    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(0, 2);
    }
    self->_shutdownPending = 1;
  }
  else
  {
    objc_msgSend_finalShutdown(self, v4, v5);
    v8.receiver = self;
    v8.super_class = (Class)MTRDeviceController_Concrete;
    [(MTRDeviceController *)&v8 shutdown];
  }
  os_unfair_lock_unlock(p_assertionLock);
}

- (void)finalShutdown
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&self->_assertionLock);
  v3 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = self;
    _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_DEFAULT, "%@ shutdown called", buf, 0xCu);
  }

  if (sub_244CC4E58(2u))
  {
    __int16 v10 = self;
    sub_244CC4DE0(0, 2);
  }
  if (self->_cppCommissioner)
  {
    v4 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      unint64_t v6 = (MTRDeviceController_Concrete *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      int v15 = self;
      _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_DEFAULT, "Shutting down %@: %@", buf, 0x16u);
    }
    if (sub_244CC4E58(2u))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      __int16 v10 = NSStringFromClass(v9);
      __int16 v11 = self;
      sub_244CC4DE0(0, 2);
    }
    objc_msgSend_cleanupAfterStartup(self, v7, v8, v10, v11);
  }
}

- (void)cleanupAfterStartup
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v3 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "-[MTRDeviceController_Concrete cleanupAfterStartup]";
    __int16 v42 = 2112;
    uint64_t v43 = self;
    _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }

  if (sub_244CC4E58(2u))
  {
    uint64_t v33 = "-[MTRDeviceController_Concrete cleanupAfterStartup]";
    v34 = self;
    sub_244CC4DE0(0, 2);
  }
  unint64_t v6 = (os_unfair_lock_s *)objc_msgSend_deviceMapLock(self, v4, v5, v33, v34);
  os_unfair_lock_lock(v6);
  uint64_t v9 = objc_msgSend_nodeIDToDeviceMap(self, v7, v8);
  unint64_t v12 = objc_msgSend_objectEnumerator(v9, v10, v11);
  int v15 = objc_msgSend_allObjects(v12, v13, v14);

  unint64_t v18 = objc_msgSend_nodeIDToDeviceMap(self, v16, v17);
  objc_msgSend_removeAllObjects(v18, v19, v20);

  v23 = (os_unfair_lock_s *)objc_msgSend_deviceMapLock(self, v21, v22);
  os_unfair_lock_unlock(v23);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v24 = v15;
  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v35, v39, 16);
  if (v28)
  {
    uint64_t v29 = *(void *)v36;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v36 != v29) {
          objc_enumerationMutation(v24);
        }
        objc_msgSend_invalidate(*(void **)(*((void *)&v35 + 1) + 8 * v30++), v26, v27);
      }
      while (v28 != v30);
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v26, (uint64_t)&v35, v39, 16);
    }
    while (v28);
  }

  objc_msgSend_stopBrowseForCommissionables(self, v31, v32);
  sub_2446D4428((uint64_t)self->_factory, self);
}

- (void)shutDownCppController
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v3 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v35 = "-[MTRDeviceController_Concrete shutDownCppController]";
    __int16 v36 = 2048;
    long long v37 = self;
    _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_DEFAULT, "%s: %p", buf, 0x16u);
  }

  if (sub_244CC4E58(2u))
  {
    uint64_t v27 = "-[MTRDeviceController_Concrete shutDownCppController]";
    uint64_t v28 = self;
    sub_244CC4DE0(0, 2);
  }
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDeviceController_Concrete.mm", 464);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  unint64_t v6 = objc_msgSend_copy(self->_serverEndpoints, v4, v5);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v29, v33, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend_removeServerEndpointOnMatterQueue_(self, v8, *(void *)(*((void *)&v29 + 1) + 8 * i), v27, v28);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v29, v33, 16);
    }
    while (v9);
  }

  cppCommissioner = self->_cppCommissioner;
  if (cppCommissioner)
  {
    self->_cppCommissioner = 0;
    (*(void (**)(void *))(*(void *)cppCommissioner + 32))(cppCommissioner);
    atomic_store(0, &self->_storedFabricIndex.__a_.__a_value);
    uint64_t v15 = *(void *)&self->_anon_650[7];
    do
    {
      _X2 = 0;
      _X5 = *(void *)&self->_anon_650[15];
      __asm { CASPAL          X4, X5, X2, X3, [X8] }
      _ZF = _X4 == v15;
      uint64_t v15 = _X4;
    }
    while (!_ZF);
    objc_msgSend_setNodeID_(self, *(const char **)&self->_anon_650[15], 0);
    objc_msgSend_setFabricID_(self, v23, 0);
    objc_msgSend_setRootPublicKey_(self, v24, 0);
    (*(void (**)(void *))(*(void *)cppCommissioner + 8))(cppCommissioner);
    operationalCredentialsDelegate = self->_operationalCredentialsDelegate;
    if (operationalCredentialsDelegate) {
      operationalCredentialsDelegate[11] = 0;
    }
  }
  if ((objc_msgSend_isSuspended(self, v12, v13, v27, v28) & 1) == 0)
  {
    uint64_t v26 = sub_2446D7590((uint64_t)self->_factory);
    sub_244BC6A28(v26);
  }
  self->_shutdownPending = 0;
}

- (void)cleanup
{
  if (self->_cppCommissioner) {
    sub_244E20610();
  }
  defaultDACVerifier = self->_defaultDACVerifier;
  if (defaultDACVerifier)
  {
    (*(void (**)(void *, SEL))(*(void *)defaultDACVerifier + 8))(defaultDACVerifier, a2);
    self->_defaultDACVerifier = 0;
  }
  attestationTrustStoreBridge = self->_attestationTrustStoreBridge;
  if (attestationTrustStoreBridge)
  {
    (*((void (**)(MTRAttestationTrustStoreBridge *, SEL))attestationTrustStoreBridge->var0 + 1))(attestationTrustStoreBridge, a2);
    self->_attestationTrustStoreBridge = 0;
  }
  objc_msgSend_clearDeviceAttestationDelegateBridge(self, a2, v2);
  operationalCredentialsDelegate = self->_operationalCredentialsDelegate;
  if (operationalCredentialsDelegate)
  {
    (*(void (**)(void *))(*(void *)operationalCredentialsDelegate + 8))(operationalCredentialsDelegate);
    self->_operationalCredentialsDelegate = 0;
  }
  partialDACVerifier = self->_partialDACVerifier;
  if (partialDACVerifier)
  {
    (*(void (**)(void *))(*(void *)partialDACVerifier + 8))(partialDACVerifier);
    self->_partialDACVerifier = 0;
  }
  deviceControllerDelegateBridge = self->_deviceControllerDelegateBridge;
  if (deviceControllerDelegateBridge)
  {
    (*((void (**)(MTRDeviceControllerDelegateBridge *))deviceControllerDelegateBridge->var0 + 1))(deviceControllerDelegateBridge);
    self->_deviceControllerDelegateBridge = 0;
  }
}

- (BOOL)startup:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v36 = 0;
  long long v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  if (!objc_msgSend_isRunning(self, v5, v6))
  {
    chipWorkQueue = self->_chipWorkQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_244B8ADDC;
    block[3] = &unk_265199630;
    block[4] = self;
    id v10 = v4;
    id v34 = v10;
    long long v35 = &v36;
    dispatch_sync(chipWorkQueue, block);
    if (*((unsigned char *)v37 + 24))
    {
      uint64_t v13 = objc_msgSend_operationalCertificateIssuer(v10, v11, v12);
      uint64_t v16 = objc_msgSend_operationalCertificateIssuerQueue(v10, v14, v15);
      char v18 = objc_msgSend_setOperationalCertificateIssuer_queue_(self, v17, (uint64_t)v13, v16);

      if (v18)
      {
        controllerDataStore = self->_controllerDataStore;
        if (controllerDataStore)
        {
          v32[0] = MEMORY[0x263EF8330];
          v32[1] = 3221225472;
          v32[2] = sub_244B8C238;
          v32[3] = &unk_265199830;
          v32[4] = self;
          objc_msgSend_fetchAttributeDataForAllDevices_(controllerDataStore, v19, (uint64_t)v32);
        }
        uint64_t v21 = sub_244CC8484(0, "NotSpecified");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
          v23 = (MTRDeviceController_Concrete *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v41 = v23;
          __int16 v42 = 2112;
          uint64_t v43 = self;
          _os_log_impl(&dword_2446BD000, v21, OS_LOG_TYPE_DEFAULT, "%@ startup: %@", buf, 0x16u);
        }
        if (sub_244CC4E58(2u))
        {
          id v24 = (objc_class *)objc_opt_class();
          long long v31 = NSStringFromClass(v24);
          sub_244CC4DE0(0, 2);
        }
        BOOL v8 = 1;
        goto LABEL_26;
      }
      uint64_t v28 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v41 = self;
        _os_log_impl(&dword_2446BD000, v28, OS_LOG_TYPE_ERROR, "%@ operationalCertificateIssuer and operationalCertificateIssuerQueue must both be nil or both be non-nil", buf, 0xCu);
      }

      if (!sub_244CC4E58(1u))
      {
LABEL_25:
        objc_msgSend_cleanupAfterStartup(self, v26, v27, v30);
        BOOL v8 = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    else
    {
      id v25 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v41 = self;
        _os_log_impl(&dword_2446BD000, v25, OS_LOG_TYPE_ERROR, "%@ startup failed", buf, 0xCu);
      }

      if (!sub_244CC4E58(1u)) {
        goto LABEL_25;
      }
    }
    long long v30 = self;
    sub_244CC4DE0(0, 1);
    goto LABEL_25;
  }
  id v7 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v41 = self;
    _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_ERROR, "%@ Unexpected duplicate call to startup", buf, 0xCu);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0, 1);
  }
  BOOL v8 = 0;
LABEL_27:
  _Block_object_dispose(&v36, 8);

  return v8;
}

- (BOOL)setupCommissioningSessionWithPayload:(id)a3 newNodeID:(id)a4 error:(id *)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  BOOL v8 = (__n128 (*)(__n128 *, __n128 *))a3;
  id v9 = a4;
  if (objc_msgSend_isSuspended(self, v10, v11))
  {
    uint64_t v12 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = objc_msgSend_unsignedLongLongValue(v9, v13, v14);
      *(_WORD *)&buf[22] = 2112;
      BOOL v45 = v8;
      _os_log_impl(&dword_2446BD000, v12, OS_LOG_TYPE_ERROR, "%@ suspended: can't set up commissioning session for device ID 0x%016llX with setup payload %@", buf, 0x20u);
    }

    if (sub_244CC4E58(1u))
    {
      objc_msgSend_unsignedLongLongValue(v9, v15, v16);
      sub_244CC4DE0(0, 1);
    }
    if (a5)
    {
      LODWORD(v42) = 3;
      *((void *)&v42 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/MTRDeviceController_Concrete.mm";
      int v43 = 813;
      sub_244B26908((uint64_t)MTRError, &v42);
      char v17 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v18 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = objc_msgSend_unsignedLongLongValue(v9, v19, v20);
      *(_WORD *)&buf[22] = 2112;
      BOOL v45 = v8;
      _os_log_impl(&dword_2446BD000, v18, OS_LOG_TYPE_DEFAULT, "%@ Setting up commissioning session for device ID 0x%016llX with setup payload %@", buf, 0x20u);
    }

    if (sub_244CC4E58(2u))
    {
      uint64_t v30 = objc_msgSend_unsignedLongLongValue(v9, v21, v22);
      long long v31 = v8;
      long long v29 = self;
      sub_244CC4DE0(0, 2);
    }
    v23 = objc_msgSend_sharedInstance(MTRMetricsCollector, v21, v22, v29, v30, v31);
    objc_msgSend_resetMetrics(v23, v24, v25);

    *(_DWORD *)buf = 0;
    *(void *)&buf[8] = "dwnfw_device_commissioning";
    buf[20] = 0;
    sub_244D7E78C((uint64_t)buf);
    sub_244B8CBC4(v8);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x4812000000;
    BOOL v45 = sub_244B8CC90;
    v46 = nullsub_838;
    v47 = "";
    long long v48 = xmmword_265199850;
    uint64_t v49 = 828;
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = sub_244B8CCA8;
    v36[3] = &unk_265199870;
    v40 = buf;
    long long v37 = v8;
    v41 = a5;
    id v38 = v9;
    char v39 = self;
    uint64_t v26 = (void *)MEMORY[0x2456969D0](v36);
    char v17 = objc_msgSend_syncRunOnWorkQueueWithBoolReturnValue_error_(self, v27, (uint64_t)v26, a5);
    if ((v17 & 1) == 0)
    {
      int v32 = 1;
      uint64_t v33 = "dwnfw_device_commissioning";
      int v34 = *(_DWORD *)(*(void *)&buf[8] + 48);
      char v35 = 3;
      sub_244D7E78C((uint64_t)&v32);
    }

    _Block_object_dispose(buf, 8);
  }

  return v17;
}

- (BOOL)setupCommissioningSessionWithDiscoveredDevice:(id)a3 payload:(id)a4 newNodeID:(id)a5 error:(id *)a6
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2048;
    uint64_t v44 = objc_msgSend_unsignedLongLongValue(v12, v14, v15);
    LOWORD(v45) = 2112;
    *(void *)((char *)&v45 + 2) = v11;
    _os_log_impl(&dword_2446BD000, v13, OS_LOG_TYPE_DEFAULT, "%@ Setting up commissioning session for already-discovered device %@ and device ID 0x%016llX with setup payload %@", buf, 0x2Au);
  }

  if (sub_244CC4E58(2u))
  {
    uint64_t v30 = objc_msgSend_unsignedLongLongValue(v12, v16, v17);
    id v31 = v11;
    uint64_t v28 = self;
    id v29 = v10;
    sub_244CC4DE0(0, 2);
  }
  char v18 = objc_msgSend_sharedInstance(MTRMetricsCollector, v16, v17, v28, v29, v30, v31);
  objc_msgSend_resetMetrics(v18, v19, v20);

  *(_DWORD *)buf = 0;
  *(void *)&buf[8] = "dwnfw_device_commissioning";
  buf[20] = 0;
  sub_244D7E78C((uint64_t)buf);
  sub_244B8CBC4(v11);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x4812000000;
  uint64_t v44 = (uint64_t)sub_244B8CC90;
  *(void *)&long long v45 = nullsub_838;
  *((void *)&v45 + 1) = "";
  long long v46 = xmmword_265199890;
  uint64_t v47 = 881;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = sub_244B8D298;
  v36[3] = &unk_2651998B0;
  v41 = buf;
  id v21 = v12;
  id v37 = v21;
  id v38 = self;
  id v22 = v10;
  id v39 = v22;
  id v23 = v11;
  id v40 = v23;
  long long v42 = a6;
  id v24 = (void *)MEMORY[0x2456969D0](v36);
  char v26 = objc_msgSend_syncRunOnWorkQueueWithBoolReturnValue_error_(self, v25, (uint64_t)v24, a6);
  if ((v26 & 1) == 0)
  {
    int v32 = 1;
    uint64_t v33 = "dwnfw_device_commissioning";
    int v34 = *(_DWORD *)(*(void *)&buf[8] + 48);
    char v35 = 3;
    sub_244D7E78C((uint64_t)&v32);
  }

  _Block_object_dispose(buf, 8);
  return v26;
}

- (BOOL)commissionNodeWithID:(id)a3 commissioningParams:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (objc_msgSend_isSuspended(self, v10, v11))
  {
    id v12 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v29 = self;
      __int16 v30 = 2048;
      uint64_t v31 = objc_msgSend_unsignedLongLongValue(v8, v13, v14);
      __int16 v32 = 2112;
      id v33 = v9;
      _os_log_impl(&dword_2446BD000, v12, OS_LOG_TYPE_ERROR, "%@ suspended: can't commission device ID 0x%016llX with parameters %@", buf, 0x20u);
    }

    if (sub_244CC4E58(1u))
    {
      objc_msgSend_unsignedLongLongValue(v8, v15, v16);
      sub_244CC4DE0(0, 1);
    }
    if (a5)
    {
      LODWORD(v26) = 3;
      *((void *)&v26 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/MTRDeviceController_Concrete.mm";
      int v27 = 951;
      sub_244B26908((uint64_t)MTRError, &v26);
      char v17 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = sub_244B8DA88;
    v21[3] = &unk_2651998D8;
    id v22 = v9;
    id v23 = self;
    id v24 = v8;
    uint64_t v25 = a5;
    char v18 = (void *)MEMORY[0x2456969D0](v21);
    char v17 = objc_msgSend_syncRunOnWorkQueueWithBoolReturnValue_error_(self, v19, (uint64_t)v18, a5);
  }
  return v17;
}

- (BOOL)continueCommissioningDevice:(void *)a3 ignoreAttestationFailure:(BOOL)a4 error:(id *)a5
{
  uint64_t v5 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_244B8E4F0;
  v10[3] = &unk_265199900;
  v10[4] = self;
  v10[5] = a3;
  BOOL v11 = a4;
  v10[6] = a5;
  id v7 = (void *)MEMORY[0x2456969D0](v10, a2);
  LOBYTE(v5) = objc_msgSend_syncRunOnWorkQueueWithBoolReturnValue_error_(self, v8, (uint64_t)v7, v5);

  return (char)v5;
}

- (BOOL)cancelCommissioningForNodeID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_244B8E694;
  v11[3] = &unk_265199928;
  v11[4] = self;
  id v12 = v6;
  uint64_t v13 = a4;
  id v7 = v6;
  id v8 = (void *)MEMORY[0x2456969D0](v11);
  LOBYTE(a4) = objc_msgSend_syncRunOnWorkQueueWithBoolReturnValue_error_(self, v9, (uint64_t)v8, a4);

  return (char)a4;
}

- (BOOL)startBrowseForCommissionables:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_244B8E85C;
  v13[3] = &unk_265199950;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = (void *)MEMORY[0x2456969D0](v13);
  LOBYTE(self) = objc_msgSend_syncRunOnWorkQueueWithBoolReturnValue_error_(self, v11, (uint64_t)v10, 0);

  return (char)self;
}

- (BOOL)stopBrowseForCommissionables
{
  uint64_t v2 = self;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_244B8E9F8;
  v6[3] = &unk_265199978;
  void v6[4] = self;
  v3 = (void *)MEMORY[0x2456969D0](v6, a2);
  LOBYTE(v2) = objc_msgSend_syncRunOnWorkQueueWithBoolReturnValue_error_(v2, v4, (uint64_t)v3, 0);

  return (char)v2;
}

- (void)preWarmCommissioningSession
{
}

- (id)deviceBeingCommissionedWithNodeID:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_244B8ED04;
  v19[3] = &unk_2651999A0;
  v19[4] = self;
  id v7 = v6;
  id v20 = v7;
  id v21 = a4;
  id v8 = (void *)MEMORY[0x2456969D0](v19);
  id v10 = objc_msgSend_syncRunOnWorkQueueWithReturnValue_error_(self, v9, (uint64_t)v8, a4);
  BOOL v11 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = objc_msgSend_unsignedLongLongValue(v7, v12, v13);
    if (a4) {
      id v15 = *a4;
    }
    else {
      id v15 = 0;
    }
    *(_DWORD *)buf = 138413058;
    id v23 = self;
    __int16 v24 = 2048;
    uint64_t v25 = v14;
    __int16 v26 = 2112;
    int v27 = v10;
    __int16 v28 = 2112;
    id v29 = v15;
    _os_log_impl(&dword_2446BD000, v11, OS_LOG_TYPE_DEFAULT, "%@ Getting device being commissioned with node ID 0x%016llX: %@ (error: %@)", buf, 0x2Au);
  }

  if (sub_244CC4E58(2u))
  {
    objc_msgSend_unsignedLongLongValue(v7, v16, v17);
    sub_244CC4DE0(0, 2);
  }

  return v10;
}

- (id)baseDeviceForNodeID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MTRBaseDevice alloc];
  id v7 = objc_msgSend_initWithNodeID_controller_(v5, v6, (uint64_t)v4, self);

  return v7;
}

- (id)_setupDeviceForNodeID:(id)a3 prefetchedClusterData:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v10 = (const os_unfair_lock *)objc_msgSend_deviceMapLock(self, v8, v9);
  os_unfair_lock_assert_owner(v10);
  BOOL v11 = [MTRDevice_Concrete alloc];
  uint64_t v13 = objc_msgSend_initWithNodeID_controller_(v11, v12, (uint64_t)v6, self);
  if (objc_msgSend_isRunning(self, v14, v15))
  {
    char v18 = objc_msgSend_nodeIDToDeviceMap(self, v16, v17);
    objc_msgSend_setObject_forKey_(v18, v19, (uint64_t)v13, v6);
  }
  if (v7)
  {
    if (objc_msgSend_count(v7, v16, v17)) {
      objc_msgSend_setPersistedClusterData_(v13, v16, (uint64_t)v7);
    }
  }
  else
  {
    controllerDataStore = self->_controllerDataStore;
    if (controllerDataStore)
    {
      id v21 = objc_msgSend_getStoredClusterDataForNodeID_(controllerDataStore, v16, (uint64_t)v6);
      id v22 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v38 = self;
        __int16 v39 = 2048;
        uint64_t v40 = objc_msgSend_count(v21, v23, v24);
        __int16 v41 = 2112;
        long long v42 = v13;
        _os_log_impl(&dword_2446BD000, v22, OS_LOG_TYPE_DEFAULT, "%@ Loaded %lu cluster data from storage for %@", buf, 0x20u);
      }

      if (sub_244CC4E58(2u))
      {
        uint64_t v35 = objc_msgSend_count(v21, v25, v26);
        uint64_t v36 = v13;
        uint64_t v34 = self;
        sub_244CC4DE0(0, 2);
      }
      if (objc_msgSend_count(v21, v25, v26, v34, v35, v36)) {
        objc_msgSend_setPersistedClusterData_(v13, v27, (uint64_t)v21);
      }
    }
  }
  __int16 v28 = self->_controllerDataStore;
  if (v28)
  {
    id v29 = objc_msgSend_getStoredDeviceDataForNodeID_(v28, v16, (uint64_t)v6);
    if (objc_msgSend_count(v29, v30, v31)) {
      objc_msgSend_setPersistedDeviceData_(v13, v32, (uint64_t)v29);
    }
  }
  objc_msgSend_setStorageBehaviorConfiguration_(v13, v16, (uint64_t)self->_storageBehaviorConfiguration);

  return v13;
}

- (BOOL)setOperationalCertificateIssuer:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if ((!v6 || v7) && (v6 || !v7))
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_244B8F228;
    v13[3] = &unk_265199950;
    id v14 = v6;
    uint64_t v15 = self;
    id v16 = v8;
    id v10 = (void *)MEMORY[0x2456969D0](v13);
    char v9 = objc_msgSend_syncRunOnWorkQueueWithBoolReturnValue_error_(self, v11, (uint64_t)v10, 0);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)attestationChallengeForDeviceID:(id)a3
{
  id v4 = a3;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = sub_244B8F40C;
  uint64_t v13 = &unk_2651999E0;
  id v14 = self;
  id v15 = v4;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x2456969D0](&v10);
  id v8 = objc_msgSend_syncRunOnWorkQueueWithReturnValue_error_(self, v7, (uint64_t)v6, 0, v10, v11, v12, v13, v14);

  return v8;
}

- (BOOL)addServerEndpoint:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((objc_msgSend_checkIsRunning(self, v5, v6) & 1) == 0 || !sub_2446D5E3C((uint64_t)self->_factory, v4))
  {
LABEL_10:
    BOOL v9 = 0;
    goto LABEL_11;
  }
  if ((objc_msgSend_associateWithController_(v4, v7, (uint64_t)self) & 1) == 0)
  {
    uint64_t v10 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138412546;
      id v21 = self;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_ERROR, "%@ Failed to associate MTRServerEndpoint with %@", buf, 0x16u);
    }
    if (sub_244CC4E58(1u))
    {
      uint64_t v13 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v13);
      sub_244CC4DE0(0, 1);
    }
    sub_2446D6520((uint64_t)self->_factory, v4);
    goto LABEL_10;
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B8F85C;
  v18[3] = &unk_265193DC8;
  v18[4] = self;
  id v19 = v4;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_244B8FA1C;
  v16[3] = &unk_265199A08;
  v16[4] = self;
  id v17 = v19;
  objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(self, v8, (uint64_t)v18, v16);

  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (void)removeServerEndpointInternal:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_msgSend_checkIsRunning(self, v11, v12))
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = sub_244B8FD40;
    v18[3] = &unk_265199720;
    v18[4] = self;
    id v19 = v8;
    id v20 = v9;
    id v21 = v10;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = sub_244B8FF04;
    v14[3] = &unk_265195260;
    v14[4] = self;
    id v15 = v19;
    id v16 = v20;
    id v17 = v21;
    objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(self, v13, (uint64_t)v18, v14);
  }
}

- (void)removeServerEndpointOnMatterQueue:(id)a3
{
  id v9 = a3;
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDeviceController_Concrete.mm", 1310);
  objc_msgSend_unregisterMatterEndpoint(v9, v4, v5);
  objc_msgSend_removeObject_(self->_serverEndpoints, v6, (uint64_t)v9);
  objc_msgSend_invalidate(v9, v7, v8);
  sub_2446D6520((uint64_t)self->_factory, v9);
}

- (BOOL)checkForInitError:(BOOL)a3 logMsg:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (!a3)
  {
    id v7 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = self;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_ERROR, "%@ Error: %@", buf, 0x16u);
    }

    if (sub_244CC4E58(1u))
    {
      uint64_t v11 = self;
      id v12 = v6;
      sub_244CC4DE0(0, 1);
    }
    objc_msgSend_cleanup(self, v8, v9, v11, v12);
  }

  return !a3;
}

- (void)clearDeviceAttestationDelegateBridge
{
  deviceAttestationDelegateBridge = self->_deviceAttestationDelegateBridge;
  if (deviceAttestationDelegateBridge)
  {
    (*(void (**)(void *, SEL))(*(void *)deviceAttestationDelegateBridge + 8))(deviceAttestationDelegateBridge, a2);
    self->_deviceAttestationDelegateBridge = 0;
  }
}

- (BOOL)checkForStartError:(ChipError *)a3 logMsg:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  unsigned int mError = a3->mError;
  if (a3->mError)
  {
    uint64_t v8 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      long long v11 = *(_OWORD *)&a3->mError;
      uint64_t v12 = *(void *)&a3->mLine;
      uint64_t v9 = sub_244CB7B34((const char **)&v11, 1);
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2112;
      id v14 = v6;
      _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_ERROR, "Error(%s): %@ %@", buf, 0x20u);
    }

    if (sub_244CC4E58(1u))
    {
      *(_OWORD *)buf = *(_OWORD *)&a3->mError;
      *(void *)&buf[16] = *(void *)&a3->mLine;
      sub_244CB7B34((const char **)buf, 1);
      sub_244CC4DE0(0, 1);
    }
  }

  return mError != 0;
}

+ (BOOL)checkForError:(ChipError *)a3 logMsg:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a4;
  unsigned int mError = a3->mError;
  if (a3->mError)
  {
    id v10 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      long long v22 = *(_OWORD *)&a3->mError;
      uint64_t v23 = *(void *)&a3->mLine;
      long long v11 = sub_244CB7B34((const char **)&v22, 1);
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
    id v6 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138412802;
      id v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = self;
      __int16 v22 = 2080;
      uint64_t v23 = objc_msgSend_UTF8String(@"Controller is not running. Call startup first.", v9, v10);
      _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_ERROR, "%@: %@ Error: %s", buf, 0x20u);
    }
    if (sub_244CC4E58(1u))
    {
      long long v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      objc_msgSend_UTF8String(@"Controller is not running. Call startup first.", v13, v14);
      sub_244CC4DE0(0, 1);
    }
    if (a3)
    {
      LODWORD(v16) = 3;
      *((void *)&v16 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/MTRDeviceController_Concrete.mm";
      int v17 = 1381;
      sub_244B26908((uint64_t)MTRError, &v16);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return isRunning;
}

- (void)getSessionForNode:(unint64_t)a3 completion:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (objc_msgSend_isSuspended(self, v7, v8))
  {
    uint64_t v10 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_msgSend_compressedFabricID(self, v11, v12);
      *(_DWORD *)buf = 138413058;
      long long v45 = self;
      __int16 v46 = 2048;
      uint64_t v47 = objc_msgSend_unsignedLongLongValue(v13, v14, v15);
      __int16 v48 = 2048;
      unint64_t v49 = a3;
      __int16 v50 = 2048;
      unint64_t v51 = a3;
      _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_ERROR, "%@ suspended: can't get session for node %016llX-%016llx (%llu)", buf, 0x2Au);
    }
    if (sub_244CC4E58(1u))
    {
      uint64_t v18 = objc_msgSend_compressedFabricID(self, v16, v17);
      objc_msgSend_unsignedLongLongValue(v18, v19, v20);
      sub_244CC4DE0(0, 1);
    }
    buf[0] = 0;
    LODWORD(v42) = 3;
    *((void *)&v42 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTRDeviceController_Concrete.mm";
    int v43 = 1394;
    uint64_t v21 = sub_244B26908((uint64_t)MTRError, &v42);
    (*((void (**)(id, void, uint8_t *, void *, void))v6 + 2))(v6, 0, buf, v21, 0);

    sub_24479DF48((uint64_t)buf);
  }
  else
  {
    __int16 v22 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v9, a3);
    uint64_t v24 = objc_msgSend_deviceForNodeID_(self, v23, (uint64_t)v22);

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v25 = v24;
      if (objc_msgSend_deviceUsesThread(v25, v26, v27))
      {
        id v29 = [MTRAsyncWorkItem alloc];
        uint64_t v30 = dispatch_get_global_queue(21, 0);
        __int16 v32 = objc_msgSend_initWithQueue_(v29, v31, (uint64_t)v30);

        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = sub_244B90C88;
        v37[3] = &unk_265199A58;
        v37[4] = self;
        id v38 = v6;
        unint64_t v39 = a3;
        objc_msgSend_setReadyHandler_(v32, v33, (uint64_t)v37);
        objc_msgSend_enqueueWorkItem_descriptionWithFormat_(self->_concurrentSubscriptionPool, v34, (uint64_t)v32, @"device controller getSessionForNode nodeID: 0x%016llX", a3);
      }
      else
      {
        objc_msgSend_directlyGetSessionForNode_completion_(self, v28, a3, v6);
      }
    }
    else
    {
      uint64_t v35 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        long long v45 = self;
        __int16 v46 = 2112;
        uint64_t v47 = (uint64_t)v24;
        __int16 v48 = 2048;
        unint64_t v49 = a3;
        __int16 v50 = 2048;
        unint64_t v51 = a3;
        _os_log_impl(&dword_2446BD000, v35, OS_LOG_TYPE_ERROR, "%@ somehow has %@ instead of MTRDevice_Concrete for node ID 0x%016llX (%llu)", buf, 0x2Au);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
      buf[0] = 0;
      LODWORD(v40) = 3;
      *((void *)&v40 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/MTRDeviceController_Concrete.mm";
      int v41 = 1405;
      uint64_t v36 = sub_244B26908((uint64_t)MTRError, &v40);
      (*((void (**)(id, void, uint8_t *, void *, void))v6 + 2))(v6, 0, buf, v36, 0);

      sub_24479DF48((uint64_t)buf);
    }
  }
}

- (void)directlyGetSessionForNode:(unint64_t)a3 completion:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (objc_msgSend_isSuspended(self, v7, v8))
  {
    uint64_t v9 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_msgSend_compressedFabricID(self, v10, v11);
      *(_DWORD *)buf = 138413058;
      uint64_t v30 = self;
      __int16 v31 = 2048;
      uint64_t v32 = objc_msgSend_unsignedLongLongValue(v12, v13, v14);
      __int16 v33 = 2048;
      unint64_t v34 = a3;
      __int16 v35 = 2048;
      unint64_t v36 = a3;
      _os_log_impl(&dword_2446BD000, v9, OS_LOG_TYPE_ERROR, "%@ suspended: can't get session for node %016llX-%016llx (%llu)", buf, 0x2Au);
    }
    if (sub_244CC4E58(1u))
    {
      uint64_t v17 = objc_msgSend_compressedFabricID(self, v15, v16);
      objc_msgSend_unsignedLongLongValue(v17, v18, v19);
      sub_244CC4DE0(0, 1);
    }
    buf[0] = 0;
    LODWORD(v27) = 3;
    *((void *)&v27 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTRDeviceController_Concrete.mm";
    int v28 = 1437;
    uint64_t v20 = sub_244B26908((uint64_t)MTRError, &v27);
    (*((void (**)(id, void, uint8_t *, void *, void))v6 + 2))(v6, 0, buf, v20, 0);

    sub_24479DF48((uint64_t)buf);
  }
  else
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = sub_244B91108;
    v24[3] = &unk_265199A80;
    id v25 = v6;
    unint64_t v26 = a3;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = sub_244B911B4;
    v22[3] = &unk_265199AA8;
    id v23 = v25;
    objc_msgSend_asyncGetCommissionerOnMatterQueue_errorHandler_(self, v21, (uint64_t)v24, v22);
  }
}

- (void)getSessionForCommissioneeDevice:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_244B9132C;
  v11[3] = &unk_265199A80;
  unint64_t v13 = a3;
  id v12 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_244B91524;
  v9[3] = &unk_265199AA8;
  id v10 = v12;
  id v7 = v12;
  objc_msgSend_asyncGetCommissionerOnMatterQueue_errorHandler_(self, v8, (uint64_t)v11, v9);
}

- (unsigned)sessionTransportTypeForDevice:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_checkIsRunning(self, v5, v6))
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    chipWorkQueue = self->_chipWorkQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_244B91688;
    block[3] = &unk_265199630;
    block[4] = self;
    id v11 = v4;
    id v12 = &v13;
    dispatch_sync(chipWorkQueue, block);
    unsigned __int8 v8 = *((unsigned char *)v14 + 24);

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)asyncGetCommissionerOnMatterQueue:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v16 = 0;
  char v9 = objc_msgSend_checkIsRunning_(self, v8, (uint64_t)&v16);
  id v10 = v16;
  id v11 = v10;
  if (v9)
  {

    chipWorkQueue = self->_chipWorkQueue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_244B918E4;
    v13[3] = &unk_265199AD0;
    void v13[4] = self;
    id v14 = v7;
    id v15 = v6;
    dispatch_async(chipWorkQueue, v13);
  }
  else
  {
    if (v7) {
      (*((void (**)(id, id))v7 + 2))(v7, v10);
    }
  }
}

- (void)asyncDispatchToMatterQueue:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_244B91A60;
  v11[3] = &unk_265199AF8;
  id v12 = v6;
  id v7 = v6;
  id v8 = a4;
  char v9 = (void *)MEMORY[0x2456969D0](v11);
  objc_msgSend_asyncGetCommissionerOnMatterQueue_errorHandler_(self, v10, (uint64_t)v9, v8);
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
    char v9 = sub_244CC8484(0x1Bu, "Support");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v14 = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDeviceContr"
            "oller_Concrete.mm";
      __int16 v15 = 1024;
      int v16 = 1536;
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
    block[2] = sub_244B91C88;
    block[3] = &unk_265198AC8;
    block[4] = self;
    id v12 = a4;
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
  uint64_t v21 = sub_244B91E38;
  __int16 v22 = sub_244B91E48;
  id v23 = 0;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = sub_244B91E50;
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
  uint64_t v13 = sub_244B91FB0;
  id v14 = &unk_265198AF0;
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

- (id)compressedFabricID
{
  _X2 = 0;
  _X3 = 0;
  __asm { CASPAL          X2, X3, X2, X3, [X8] }

  return 0;
}

- (ChipError)isRunningOnFabric:(SEL)a3 fabricIndex:(void *)a4 isRunning:(unsigned __int8)a5
{
  int v7 = a5;
  v18[10] = *MEMORY[0x263EF8340];
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDeviceController_Concrete.mm", 1583);
  result = (ChipError *)objc_msgSend_isRunning(self, v11, v12);
  if ((result & 1) == 0)
  {
    *a6 = 0;
    retstr->unsigned int mError = 0;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDev"
                    "iceController_Concrete.mm";
    unsigned int v16 = 1587;
LABEL_13:
    retstr->mLine = v16;
    return result;
  }
  result = (ChipError *)sub_244D9EA90((uint64_t)a4, v7);
  if (!result)
  {
    retstr->unsigned int mError = 3;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDev"
                    "iceController_Concrete.mm";
    unsigned int v16 = 1593;
    goto LABEL_13;
  }
  id v14 = result;
  result = (ChipError *)sub_244B94EE0((uint64_t)self->_cppCommissioner);
  if (result) {
    mFile = result->mFile;
  }
  else {
    mFile = 0;
  }
  if (mFile != v14->mFile)
  {
    *a6 = 0;
    retstr->unsigned int mError = 0;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDev"
                    "iceController_Concrete.mm";
    unsigned int v16 = 1598;
    goto LABEL_13;
  }
  v18[0] = &unk_26F954540;
  v17[0] = &unk_26F954540;
  retstr->mFile = 0;
  *(void *)&retstr->mLine = 0;
  *(void *)&retstr->unsigned int mError = 0;
  sub_244E03FB8((uint64_t)self->_cppCommissioner, (uint64_t)v18, (uint64_t)retstr);
  if (!retstr->mError)
  {
    *(void *)&retstr->unsigned int mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_244D9F140((uint64_t)a4, BYTE1(v14[5].mLine), (uint64_t)v17, (uint64_t)retstr);
    if (!retstr->mError)
    {
      result = (ChipError *)sub_244B9221C((uint64_t)v18, (uint64_t)v17);
      *a6 = (char)result;
      retstr->unsigned int mError = 0;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRD"
                      "eviceController_Concrete.mm";
      unsigned int v16 = 1606;
      goto LABEL_13;
    }
  }
  return result;
}

- (void)invalidateCASESessionForNode:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = sub_244B9241C;
  uint64_t v11 = &unk_265193DC8;
  uint64_t v12 = self;
  id v13 = v4;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x2456969D0](&v8);
  objc_msgSend_syncRunOnWorkQueue_error_(self, v7, (uint64_t)v6, 0, v8, v9, v10, v11, v12);
}

- (void)operationalInstanceAdded:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v7 = (os_unfair_lock_s *)objc_msgSend_deviceMapLock(self, v5, v6);
  os_unfair_lock_lock(v7);
  id v10 = objc_msgSend_nodeIDToDeviceMap(self, v8, v9);
  uint64_t v12 = objc_msgSend_objectForKey_(v10, v11, (uint64_t)v4);

  id v15 = (os_unfair_lock_s *)objc_msgSend_deviceMapLock(self, v13, v14);
  os_unfair_lock_unlock(v15);
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v16 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        __int16 v31 = self;
        __int16 v32 = 2112;
        __int16 v33 = v12;
        _os_log_impl(&dword_2446BD000, v16, OS_LOG_TYPE_DEFAULT, "%@ Notifying %@ about its node advertising", buf, 0x16u);
      }

      if (sub_244CC4E58(2u))
      {
        int v28 = self;
        id v29 = v12;
        sub_244CC4DE0(0, 2);
      }
      objc_msgSend_nodeMayBeAdvertisingOperational(v12, v17, v18, v28, v29);
    }
    else
    {
      uint64_t v19 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        __int16 v31 = self;
        __int16 v32 = 2112;
        __int16 v33 = v12;
        __int16 v34 = 2048;
        uint64_t v35 = objc_msgSend_unsignedLongLongValue(v4, v20, v21);
        __int16 v36 = 2048;
        uint64_t v37 = objc_msgSend_unsignedLongLongValue(v4, v22, v23);
        _os_log_impl(&dword_2446BD000, v19, OS_LOG_TYPE_ERROR, "%@ somehow has %@ instead of MTRDevice_Concrete for node ID 0x%016llX (%llu)", buf, 0x2Au);
      }

      if (sub_244CC4E58(1u))
      {
        objc_msgSend_unsignedLongLongValue(v4, v24, v25);
        objc_msgSend_unsignedLongLongValue(v4, v26, v27);
        sub_244CC4DE0(0, 1);
      }
    }
  }
}

- (void)downloadLogFromNodeWithID:(id)a3 type:(int64_t)a4 timeout:(double)a5 queue:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_244B92898;
  v21[3] = &unk_265199B20;
  void v21[4] = self;
  id v22 = v12;
  double v26 = a5;
  int64_t v25 = a4;
  id v23 = v13;
  id v24 = v14;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_244B928BC;
  v19[3] = &unk_265199AA8;
  id v20 = v24;
  id v15 = v24;
  id v16 = v13;
  id v17 = v12;
  objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(self, v18, (uint64_t)v21, v19);
}

- (id)accessGrantsForClusterPath:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDeviceController_Concrete.mm", 1667);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = self->_serverEndpoints;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v23, v27, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    uint64_t v11 = (void *)MEMORY[0x263EFFA68];
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v5);
        }
        id v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v14 = objc_msgSend_endpoint(v4, v7, v8, (void)v23);
        id v17 = objc_msgSend_endpointID(v13, v15, v16);
        int isEqual = objc_msgSend_isEqual_(v14, v18, (uint64_t)v17);

        if (isEqual)
        {
          id v20 = objc_msgSend_cluster(v4, v7, v8);
          uint64_t v11 = objc_msgSend_matterAccessGrantsForCluster_(v13, v21, (uint64_t)v20);

          goto LABEL_12;
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v23, v27, 16);
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x263EFFA68];
  }
LABEL_12:

  return v11;
}

- (id)neededReadPrivilegeForClusterID:(id)a3 attributeID:(id)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v42 = a3;
  id v6 = a4;
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDeviceController_Concrete.mm", 1681);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = self->_serverEndpoints;
  uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v51, v57, 16);
  if (v36)
  {
    uint64_t v37 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v52 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        objc_msgSend_serverClusters(v10, v8, v9);
        id v41 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v11, (uint64_t)&v47, v56, 16);
        if (v14)
        {
          uint64_t v40 = *(void *)v48;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v48 != v40) {
                objc_enumerationMutation(v41);
              }
              uint64_t v16 = *(void **)(*((void *)&v47 + 1) + 8 * j);
              id v17 = objc_msgSend_clusterID(v16, v12, v13);
              char isEqual = objc_msgSend_isEqual_(v17, v18, (uint64_t)v42);

              if (isEqual)
              {
                long long v45 = 0u;
                long long v46 = 0u;
                long long v43 = 0u;
                long long v44 = 0u;
                id v20 = objc_msgSend_attributes(v16, v12, v13);
                uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v43, v55, 16);
                if (v24)
                {
                  uint64_t v25 = *(void *)v44;
                  while (2)
                  {
                    for (uint64_t k = 0; k != v24; ++k)
                    {
                      if (*(void *)v44 != v25) {
                        objc_enumerationMutation(v20);
                      }
                      uint64_t v27 = *(void **)(*((void *)&v43 + 1) + 8 * k);
                      uint64_t v28 = objc_msgSend_attributeID(v27, v22, v23);
                      char v30 = objc_msgSend_isEqual_(v28, v29, (uint64_t)v6);

                      if (v30)
                      {
                        __int16 v32 = NSNumber;
                        uint64_t Privilege = objc_msgSend_requiredReadPrivilege(v27, v22, v23);
                        __int16 v31 = objc_msgSend_numberWithUnsignedChar_(v32, v34, Privilege);

                        goto LABEL_28;
                      }
                    }
                    uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v43, v55, 16);
                    if (v24) {
                      continue;
                    }
                    break;
                  }
                }
              }
            }
            uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v12, (uint64_t)&v47, v56, 16);
          }
          while (v14);
        }
      }
      __int16 v31 = 0;
      uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v51, v57, 16);
    }
    while (v36);
  }
  else
  {
    __int16 v31 = 0;
  }
LABEL_28:

  return v31;
}

- (OS_dispatch_queue)chipWorkQueue
{
  return self->_chipWorkQueue;
}

- (id)controllerDataStore
{
  return self->_controllerDataStore;
}

- (MTRDeviceControllerFactory)factory
{
  return self->_factory;
}

- (MTROTAProviderDelegate)otaProviderDelegate
{
  return self->_otaProviderDelegate;
}

- (OS_dispatch_queue)otaProviderDelegateQueue
{
  return self->_otaProviderDelegateQueue;
}

- (MTRCommissionableBrowser)commissionableBrowser
{
  return self->_commissionableBrowser;
}

- (MTRAsyncWorkQueue)concurrentSubscriptionPool
{
  return self->_concurrentSubscriptionPool;
}

- (MTRDeviceStorageBehaviorConfiguration)storageBehaviorConfiguration
{
  return self->_storageBehaviorConfiguration;
}

- (id)controllerNodeID
{
  return self->_controllerNodeID;
}

- (void)cppCommissioner
{
  return self->_cppCommissioner;
}

- (void)partialDACVerifier
{
  return self->_partialDACVerifier;
}

- (void)defaultDACVerifier
{
  return self->_defaultDACVerifier;
}

- (MTRDeviceControllerDelegateBridge)deviceControllerDelegateBridge
{
  return self->_deviceControllerDelegateBridge;
}

- (void)operationalCredentialsDelegate
{
  return self->_operationalCredentialsDelegate;
}

- (void)deviceAttestationDelegateBridge
{
  return self->_deviceAttestationDelegateBridge;
}

- (MTRAttestationTrustStoreBridge)attestationTrustStoreBridge
{
  return self->_attestationTrustStoreBridge;
}

- (NSMutableArray)serverEndpoints
{
  return self->_serverEndpoints;
}

- (BOOL)shouldAdvertiseOperational
{
  return self->_shouldAdvertiseOperational;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverEndpoints, 0);
  objc_storeStrong((id *)&self->_controllerNodeID, 0);
  objc_storeStrong((id *)&self->_storageBehaviorConfiguration, 0);
  objc_storeStrong((id *)&self->_concurrentSubscriptionPool, 0);
  objc_storeStrong((id *)&self->_commissionableBrowser, 0);
  objc_storeStrong((id *)&self->_otaProviderDelegateQueue, 0);
  objc_storeStrong((id *)&self->_otaProviderDelegate, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_controllerDataStore, 0);
  objc_storeStrong((id *)&self->_chipWorkQueue, 0);

  sub_244CEDE1C((uint64_t)&self->_operationalKeypairBridge);
  p_signingKeypairBridge = &self->_signingKeypairBridge;

  sub_244CEDE1C((uint64_t)p_signingKeypairBridge);
}

- (id).cxx_construct
{
  *((void *)self + 205) = &unk_26F954540;
  *((unsigned char *)self + 2232) = 0;
  *((void *)self + 204) = &unk_26F943F78;
  *((void *)self + 280) = 0;
  *((void *)self + 281) = &unk_26F954540;
  *((void *)self + 292) = &unk_26F954540;
  *((unsigned char *)self + 2928) = 0;
  *((void *)self + 291) = &unk_26F943F78;
  *((void *)self + 367) = 0;
  *((void *)self + 368) = &unk_26F954540;
  return self;
}

- (id)fetchAttestationChallengeForDeviceId:(unint64_t)a3
{
  id v4 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, a2, a3);
  id v6 = objc_msgSend_attestationChallengeForDeviceID_(self, v5, (uint64_t)v4);

  return v6;
}

- (BOOL)getBaseDevice:(unint64_t)a3 queue:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = a4;
  id v9 = a5;
  id v24 = 0;
  char v11 = objc_msgSend_checkIsRunning_(self, v10, (uint64_t)&v24);
  id v12 = v24;
  if (v11)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = sub_244B933C4;
    v17[3] = &unk_265199B70;
    unint64_t v20 = a3;
    v18[0] = v8;
    v18[1] = self;
    id v19 = v9;
    objc_msgSend_getSessionForNode_completion_(self, v13, a3, v17);
    uint64_t v14 = (id *)v18;
    id v15 = v19;
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_244B933AC;
    block[3] = &unk_265194F48;
    uint64_t v14 = &v23;
    id v23 = v9;
    id v22 = v12;
    dispatch_async(v8, block);
    id v15 = v22;
  }

  return v11;
}

- (BOOL)pairDevice:(unint64_t)a3 discriminator:(unsigned __int16)a4 setupPINCode:(unsigned int)a5 error:(id *)a6
{
  char v11 = objc_msgSend_sharedInstance(MTRMetricsCollector, a2, a3);
  objc_msgSend_resetMetrics(v11, v12, v13);

  LODWORD(v25) = 0;
  long long v26 = "dwnfw_device_commissioning";
  BYTE4(v27) = 0;
  sub_244D7E78C((uint64_t)&v25);
  uint64_t v25 = 0;
  long long v26 = (const char *)&v25;
  uint64_t v27 = 0x4812000000;
  uint64_t v28 = sub_244B8CC90;
  id v29 = nullsub_838;
  char v30 = "";
  long long v31 = xmmword_265199B90;
  uint64_t v32 = 1765;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_244B93718;
  v22[3] = &unk_265199BB0;
  unsigned __int16 v24 = a4;
  unsigned int v23 = a5;
  void v22[4] = self;
  v22[5] = &v25;
  v22[6] = a6;
  v22[7] = a3;
  uint64_t v14 = (void *)MEMORY[0x2456969D0](v22);
  char v16 = objc_msgSend_syncRunOnWorkQueueWithBoolReturnValue_error_(self, v15, (uint64_t)v14, a6);
  if ((v16 & 1) == 0)
  {
    int v18 = 1;
    id v19 = "dwnfw_device_commissioning";
    int v20 = *((_DWORD *)v26 + 12);
    char v21 = 3;
    sub_244D7E78C((uint64_t)&v18);
  }

  _Block_object_dispose(&v25, 8);
  return v16;
}

- (BOOL)pairDevice:(unint64_t)a3 address:(id)a4 port:(unsigned __int16)a5 setupPINCode:(unsigned int)a6 error:(id *)a7
{
  id v12 = a4;
  id v15 = objc_msgSend_sharedInstance(MTRMetricsCollector, v13, v14);
  objc_msgSend_resetMetrics(v15, v16, v17);

  LODWORD(v35) = 0;
  uint64_t v36 = "dwnfw_device_commissioning";
  BYTE4(v37) = 0;
  sub_244D7E78C((uint64_t)&v35);
  uint64_t v35 = 0;
  uint64_t v36 = (const char *)&v35;
  uint64_t v37 = 0x4812000000;
  uint64_t v38 = sub_244B8CC90;
  unint64_t v39 = nullsub_838;
  uint64_t v40 = "";
  long long v41 = xmmword_265199BD0;
  uint64_t v42 = 1812;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = sub_244B93C40;
  v27[3] = &unk_265199BF0;
  char v30 = &v35;
  id v18 = v12;
  unsigned __int16 v34 = a5;
  id v28 = v18;
  id v29 = self;
  unsigned int v33 = a6;
  unint64_t v31 = a3;
  uint64_t v32 = a7;
  id v19 = (void *)MEMORY[0x2456969D0](v27);
  char v21 = objc_msgSend_syncRunOnWorkQueueWithBoolReturnValue_error_(self, v20, (uint64_t)v19, a7);
  if ((v21 & 1) == 0)
  {
    int v23 = 1;
    unsigned __int16 v24 = "dwnfw_device_commissioning";
    int v25 = *((_DWORD *)v36 + 12);
    char v26 = 3;
    sub_244D7E78C((uint64_t)&v23);
  }

  _Block_object_dispose(&v35, 8);
  return v21;
}

- (BOOL)pairDevice:(unint64_t)a3 onboardingPayload:(id)a4 error:(id *)a5
{
  id v8 = a4;
  char v11 = objc_msgSend_sharedInstance(MTRMetricsCollector, v9, v10);
  objc_msgSend_resetMetrics(v11, v12, v13);

  LODWORD(v30) = 0;
  unint64_t v31 = "dwnfw_device_commissioning";
  BYTE4(v32) = 0;
  sub_244D7E78C((uint64_t)&v30);
  id v15 = objc_msgSend_setupPayloadWithOnboardingPayload_error_(MTRSetupPayload, v14, (uint64_t)v8, 0);
  sub_244B8CBC4(v15);

  uint64_t v30 = 0;
  unint64_t v31 = (const char *)&v30;
  uint64_t v32 = 0x4812000000;
  unsigned int v33 = sub_244B8CC90;
  unsigned __int16 v34 = nullsub_838;
  uint64_t v35 = "";
  long long v36 = xmmword_265199C10;
  uint64_t v37 = 1854;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = sub_244B9406C;
  v25[3] = &unk_265199C30;
  uint64_t v27 = &v30;
  unint64_t v28 = a3;
  v25[4] = self;
  id v16 = v8;
  id v26 = v16;
  id v29 = a5;
  uint64_t v17 = (void *)MEMORY[0x2456969D0](v25);
  char v19 = objc_msgSend_syncRunOnWorkQueueWithBoolReturnValue_error_(self, v18, (uint64_t)v17, a5);
  if ((v19 & 1) == 0)
  {
    int v21 = 1;
    id v22 = "dwnfw_device_commissioning";
    int v23 = *((_DWORD *)v31 + 12);
    char v24 = 3;
    sub_244D7E78C((uint64_t)&v21);
  }

  _Block_object_dispose(&v30, 8);
  return v19;
}

- (BOOL)openPairingWindow:(unint64_t)a3 duration:(unint64_t)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a4 < 0x10000)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_244B94428;
    v13[3] = &unk_265199C70;
    void v13[4] = self;
    void v13[5] = a3;
    v13[6] = a4;
    v13[7] = a5;
    uint64_t v10 = (void *)MEMORY[0x2456969D0](v13, a2);
    char v9 = objc_msgSend_syncRunOnWorkQueueWithBoolReturnValue_error_(self, v11, (uint64_t)v10, a5);
  }
  else
  {
    id v8 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = self;
      __int16 v18 = 2048;
      unint64_t v19 = a4;
      __int16 v20 = 1024;
      int v21 = 0xFFFF;
      _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_ERROR, "%@ Error: Duration %lu is too large. Max value %d", buf, 0x1Cu);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    if (a5)
    {
      LODWORD(v14) = 143;
      *((void *)&v14 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/MTRDeviceController_Concrete.mm";
      int v15 = 1885;
      sub_244B26908((uint64_t)MTRError, &v14);
      char v9 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  return v9;
}

- (id)openPairingWindowWithPIN:(unint64_t)a3 duration:(unint64_t)a4 discriminator:(unint64_t)a5 setupPIN:(unint64_t)a6 error:(id *)a7
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (a4 >= 0x10000)
  {
    uint64_t v10 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a4;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v32) = 0xFFFF;
      _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_ERROR, "%@ Error: Duration %lu is too large. Max value %d", buf, 0x1Cu);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    if (a7)
    {
      LODWORD(v29) = 143;
      *((void *)&v29 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/MTRDeviceController_Concrete.mm";
      int v30 = 1911;
      sub_244B26908((uint64_t)MTRError, &v29);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
      long long v14 = 0;
      *a7 = v11;
      goto LABEL_28;
    }
LABEL_16:
    long long v14 = 0;
    goto LABEL_28;
  }
  if (a5 >= 0x1000)
  {
    uint64_t v13 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a5;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v32) = 4095;
      _os_log_impl(&dword_2446BD000, v13, OS_LOG_TYPE_ERROR, "%@ Error: Discriminator %lu is too large. Max value %d", buf, 0x1Cu);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    if (a7)
    {
      LODWORD(v27) = 143;
      *((void *)&v27 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/MTRDeviceController_Concrete.mm";
      int v28 = 1919;
      sub_244B26908((uint64_t)MTRError, &v27);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x4812000000;
  uint64_t v32 = sub_244B8CC90;
  unsigned int v33 = nullsub_838;
  unsigned __int16 v34 = "";
  long long v35 = xmmword_265199C90;
  uint64_t v36 = 1924;
  v26[0] = (uint64_t)"dwnfw_open_pairing_window";
  v26[1] = (uint64_t)&v35;
  *(_DWORD *)uint64_t v37 = 0;
  *(void *)&v38[4] = "dwnfw_open_pairing_window";
  v38[16] = 0;
  sub_244D7E78C((uint64_t)v37);
  if (HIDWORD(a6) || !sub_244D82360(a6))
  {
    unint64_t v19 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v37 = 138412546;
      *(void *)uint64_t v38 = self;
      *(_WORD *)&v38[8] = 2048;
      *(void *)&v38[10] = a6;
      _os_log_impl(&dword_2446BD000, v19, OS_LOG_TYPE_ERROR, "%@ Error: Setup pin %lu is not valid", v37, 0x16u);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    uint64_t v20 = *(void *)&buf[8];
    *(_DWORD *)(*(void *)&buf[8] + 48) = 143;
    uint64_t v21 = v20 + 48;
    *(void *)(v21 + 8) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP"
                           "/MTRDeviceController_Concrete.mm";
    *(_DWORD *)(v21 + 16) = 1929;
    if (a7)
    {
      long long v24 = *(_OWORD *)v21;
      uint64_t v25 = *(void *)(v21 + 16);
      sub_244B26908((uint64_t)MTRError, &v24);
      long long v14 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v14 = 0;
    }
  }
  else
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = sub_244B949D0;
    v23[3] = &unk_265199CB0;
    v23[4] = self;
    v23[5] = buf;
    v23[6] = a3;
    v23[7] = a4;
    v23[8] = a5;
    v23[9] = a6;
    v23[10] = a7;
    uint64_t v17 = (void *)MEMORY[0x2456969D0](v23);
    long long v14 = objc_msgSend_syncRunOnWorkQueueWithReturnValue_error_(self, v18, (uint64_t)v17, a7);
  }
  sub_244855660(v26);
  _Block_object_dispose(buf, 8);
LABEL_28:

  return v14;
}

- (void)setPairingDelegate:(id)a3 queue:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  int v7 = [MTRDevicePairingDelegateShim alloc];
  char v9 = objc_msgSend_initWithDelegate_(v7, v8, (uint64_t)v11);
  objc_msgSend_setDeviceControllerDelegate_queue_(self, v10, (uint64_t)v9, v6);
}

- (void)setNocChainIssuer:(id)a3 queue:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  int v7 = [MTROperationalCertificateChainIssuerShim alloc];
  char v9 = objc_msgSend_initWithIssuer_(v7, v8, (uint64_t)v11);
  objc_msgSend_setOperationalCertificateIssuer_queue_(self, v10, (uint64_t)v9, v6);
}

@end