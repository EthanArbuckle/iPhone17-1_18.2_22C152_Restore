@interface HMDAccessorySetupCoordinator
+ (id)logCategory;
- (HMDAccessorySetupCoordinator)initWithWorkQueue:(id)a3 messageDispatcher:(id)a4 chipAccessoryServerBrowser:(id)a5 chipDataSource:(id)a6;
- (HMDCHIPDataSource)chipDataSource;
- (HMFActivity)metricsActivity;
- (HMFMessageDispatcher)messageDispatcher;
- (HMMTRAccessoryServerBrowser)chipAccessoryServerBrowser;
- (NSMutableDictionary)stagingRequestsByUUID;
- (NSString)currentBundleIdentifier;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)workQueue;
- (id)_createCHIPSetupAccessoryPayloadWithSetupPayloadDecimalStringRepresentation:(id)a3 error:(id *)a4;
- (id)_setupPayloadWithCHIPSetupPayload:(id)a3 setupPayloadURL:(id)a4;
- (id)createCHIPSetupAccessoryPayloadWithSetupPayloadURL:(id)a3 error:(id *)a4;
- (id)createSetupAccessoryPayloadWithCHIPSetupPayload:(id)a3 error:(id *)a4;
- (id)decimalStringRepresentationCHIPAccessorySetupPayloadFactory;
- (id)logIdentifier;
- (id)payloadCHIPAccessorySetupPayloadFactory;
- (id)urlStringCHIPAccessorySetupPayloadFactory;
- (void)_handleStagedPairingDeviceCredential:(id)a3 completionHandler:(id)a4 forRequest:(id)a5 activity:(id)a6;
- (void)_handleStagedPairingProgressState:(int64_t)a3 forRequest:(id)a4;
- (void)_handleStagedPairingReadyToCancel:(id)a3 forRequest:(id)a4;
- (void)_handleStagedPairingServer:(id)a3 error:(id)a4 forRequest:(id)a5 activity:(id)a6;
- (void)_handleStagedPairingThreadNetworkScanResults:(id)a3 completionHandler:(id)a4 forRequest:(id)a5 activity:(id)a6;
- (void)_handleStagedPairingWiFiNetworkScanResults:(id)a3 completionHandler:(id)a4 forRequest:(id)a5 activity:(id)a6;
- (void)configure;
- (void)handleCancelStagedCHIPAccessoryPairingMessage:(id)a3;
- (void)handleCancelStagingMessage:(id)a3;
- (void)handleConfirmDeviceCredentialMessage:(id)a3;
- (void)handleCreateCHIPSetupAccessoryPayloadMessage:(id)a3;
- (void)handleCreateCHIPSetupPayloadMessage:(id)a3;
- (void)handleRejectDeviceCredentialMessage:(id)a3;
- (void)handleSelectThreadNetworkAssociationMessage:(id)a3;
- (void)handleSelectWiFiNetworkAssociationMessage:(id)a3;
- (void)handleStageCHIPAccessoryPairingInStepsMessage:(id)a3;
- (void)setCurrentBundleIdentifier:(id)a3;
- (void)setDecimalStringRepresentationCHIPAccessorySetupPayloadFactory:(id)a3;
- (void)setMetricsActivity:(id)a3;
- (void)setPayloadCHIPAccessorySetupPayloadFactory:(id)a3;
- (void)setUrlStringCHIPAccessorySetupPayloadFactory:(id)a3;
- (void)startMetricsForThirdPartyPairing;
- (void)stopMetricsForThirdPartyPairingWithError:(id)a3;
@end

@implementation HMDAccessorySetupCoordinator

- (void).cxx_destruct
{
  objc_storeStrong(&self->_payloadCHIPAccessorySetupPayloadFactory, 0);
  objc_storeStrong(&self->_decimalStringRepresentationCHIPAccessorySetupPayloadFactory, 0);
  objc_storeStrong(&self->_urlStringCHIPAccessorySetupPayloadFactory, 0);
  objc_storeStrong((id *)&self->_metricsActivity, 0);
  objc_storeStrong((id *)&self->_stagingRequestsByUUID, 0);
  objc_storeStrong((id *)&self->_chipDataSource, 0);
  objc_storeStrong((id *)&self->_chipAccessoryServerBrowser, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_currentBundleIdentifier, 0);
}

- (void)setPayloadCHIPAccessorySetupPayloadFactory:(id)a3
{
}

- (id)payloadCHIPAccessorySetupPayloadFactory
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setDecimalStringRepresentationCHIPAccessorySetupPayloadFactory:(id)a3
{
}

- (id)decimalStringRepresentationCHIPAccessorySetupPayloadFactory
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setUrlStringCHIPAccessorySetupPayloadFactory:(id)a3
{
}

- (id)urlStringCHIPAccessorySetupPayloadFactory
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setMetricsActivity:(id)a3
{
}

- (HMFActivity)metricsActivity
{
  return (HMFActivity *)objc_getProperty(self, a2, 56, 1);
}

- (NSMutableDictionary)stagingRequestsByUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (HMDCHIPDataSource)chipDataSource
{
  return (HMDCHIPDataSource *)objc_getProperty(self, a2, 40, 1);
}

- (HMMTRAccessoryServerBrowser)chipAccessoryServerBrowser
{
  return (HMMTRAccessoryServerBrowser *)objc_getProperty(self, a2, 32, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCurrentBundleIdentifier:(id)a3
{
}

- (NSString)currentBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)messageTargetUUID
{
  return (NSUUID *)[MEMORY[0x263F0E080] UUID];
}

- (id)logIdentifier
{
  v2 = [MEMORY[0x263F0E080] UUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)_handleStagedPairingServer:(id)a3 error:(id)a4 forRequest:(id)a5 activity:(id)a6
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  id v10 = a3;
  v11 = (__CFString *)a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(HMDAccessorySetupCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v14);

  v15 = [v10 identifier];
  v16 = (void *)MEMORY[0x230FBD990]();
  v17 = self;
  v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = HMFGetLogIdentifier();
    v20 = [v12 UUID];
    *(_DWORD *)buf = 138544130;
    v94 = v19;
    __int16 v95 = 2112;
    v96 = v15;
    __int16 v97 = 2112;
    v98 = v11;
    __int16 v99 = 2112;
    v100 = v20;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Handling staged pairing identifier %@ and error %@ for request UUID: %@", buf, 0x2Au);
  }
  v85 = v15;
  if (!v15
    || ([v12 pendingRequestMessage],
        v21 = objc_claimAutoreleasedReturnValue(),
        v21,
        v21))
  {
    v22 = [v10 productID];

    if (v22)
    {
      v84 = v13;
      v23 = (void *)MEMORY[0x230FBD990]();
      v24 = v17;
      v25 = HMFGetOSLogHandle();
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
      v27 = (void **)MEMORY[0x263F49760];
      if (v26)
      {
        HMFGetLogIdentifier();
        v28 = v83 = v23;
        v29 = (__CFString *)*MEMORY[0x263F49778];
        id v30 = v12;
        v31 = v11;
        v32 = *v27;
        v33 = [v10 productID];
        *(_DWORD *)buf = 138544386;
        v94 = v28;
        __int16 v95 = 2114;
        v96 = v29;
        __int16 v97 = 2112;
        v98 = @"Accessory Info";
        __int16 v99 = 2114;
        v100 = v32;
        v11 = v31;
        id v12 = v30;
        __int16 v101 = 2112;
        v102 = v33;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);

        v23 = v83;
      }
      else
      {
        v29 = (__CFString *)*MEMORY[0x263F49778];
      }

      v34 = [MEMORY[0x263F499E0] sharedInstance];
      id v35 = objc_alloc(MEMORY[0x263F499F0]);
      v36 = [v10 productID];
      if (v36)
      {
        uint64_t v91 = *MEMORY[0x263F49760];
        v25 = [v10 productID];
        v92 = v25;
        v37 = [NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
      }
      else
      {
        v37 = (void *)MEMORY[0x263EFFA78];
      }
      v48 = (void *)[v35 initWithTag:v29 data:v37];
      v49 = [v84 tagProcessorList];
      [v34 submitTaggedEvent:v48 processorList:v49];

      if (v36)
      {
      }
      id v13 = v84;
      v15 = v85;
    }
    [v10 startPairingMetricWithActivity:v13];
    v50 = [(HMDAccessorySetupCoordinator *)v17 stagingRequestsByUUID];
    v51 = [v12 UUID];
    [v50 setObject:0 forKeyedSubscript:v51];

    if (v15)
    {
      v52 = (void *)MEMORY[0x230FBD990]();
      v53 = v17;
      v54 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        v55 = HMFGetLogIdentifier();
        v56 = [v12 UUID];
        *(_DWORD *)buf = 138543874;
        v94 = v55;
        __int16 v95 = 2112;
        v96 = v15;
        __int16 v97 = 2112;
        v98 = v56;
        _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_INFO, "%{public}@Successfully staged CHIP accessory server with identifier %@ in multiple steps for request UUID: %@", buf, 0x20u);
      }
      v57 = [(HMDAccessorySetupCoordinator *)v53 chipAccessoryServerBrowser];
      v58 = [v57 systemCommissionerPairingManager];
      v86[0] = MEMORY[0x263EF8330];
      v86[1] = 3221225472;
      v86[2] = __85__HMDAccessorySetupCoordinator__handleStagedPairingServer_error_forRequest_activity___block_invoke;
      v86[3] = &unk_264A27988;
      v86[4] = v53;
      id v87 = v12;
      id v88 = v13;
      v89 = v15;
      id v90 = v10;
      [v58 fetchSystemCommissionerPairingsWithCompletionHandler:v86];

      goto LABEL_41;
    }
    mapHAPPairingErrorToHMError(v11);
    v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)MEMORY[0x230FBD990]();
    v61 = v17;
    v62 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      v63 = HMFGetLogIdentifier();
      v64 = [v12 UUID];
      *(_DWORD *)buf = 138543874;
      v94 = v63;
      __int16 v95 = 2112;
      v96 = v64;
      __int16 v97 = 2112;
      v98 = v59;
      _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_ERROR, "%{public}@Failed to stage CHIP accessory pairing for request UUID %@: %@", buf, 0x20u);
    }
    v65 = [v12 pendingRequestMessage];

    v66 = (void *)MEMORY[0x230FBD990]();
    v67 = v61;
    v68 = HMFGetOSLogHandle();
    BOOL v69 = os_log_type_enabled(v68, OS_LOG_TYPE_INFO);
    if (!v65)
    {
      if (v69)
      {
        v79 = HMFGetLogIdentifier();
        v80 = [v12 UUID];
        *(_DWORD *)buf = 138543874;
        v94 = v79;
        __int16 v95 = 2112;
        v96 = v59;
        __int16 v97 = 2112;
        v98 = v80;
        _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_INFO, "%{public}@Queueing staging error %@ for request UUID: %@", buf, 0x20u);
      }
      if (v59)
      {
        [v12 setError:v59];
      }
      else
      {
        v82 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
        [v12 setError:v82];
      }
      v15 = v85;
      goto LABEL_40;
    }
    if (v69)
    {
      v70 = HMFGetLogIdentifier();
      v71 = [v12 UUID];
      *(_DWORD *)buf = 138543874;
      v94 = v70;
      __int16 v95 = 2112;
      v96 = v71;
      __int16 v97 = 2112;
      v98 = v59;
      _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_INFO, "%{public}@Responding for request UUID %@ with error: %@", buf, 0x20u);
    }
    v72 = [v12 pendingRequestMessage];
    [v72 respondWithError:v59];

    v73 = [(__CFString *)v59 domain];
    v74 = v73;
    if (v73 == (void *)*MEMORY[0x263F0C710])
    {
      uint64_t v81 = [(__CFString *)v59 code];

      v15 = v85;
      if (v81 == 13)
      {
LABEL_40:

        goto LABEL_41;
      }
    }
    else
    {

      v15 = v85;
    }
    HMMLogTagActivityWithError();
    [v13 invalidate];
    goto LABEL_40;
  }
  v38 = (void *)MEMORY[0x230FBD990]();
  v39 = v17;
  v40 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    v41 = HMFGetLogIdentifier();
    v42 = [v12 UUID];
    *(_DWORD *)buf = 138543618;
    v94 = v41;
    __int16 v95 = 2112;
    v96 = v42;
    _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly received staged pairing identifier for request UUID: %@", buf, 0x16u);
  }
  v43 = (void *)MEMORY[0x230FBD990]();
  v44 = v39;
  v45 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
  {
    v46 = HMFGetLogIdentifier();
    v47 = (__CFString *)*MEMORY[0x263F49780];
    *(_DWORD *)buf = 138543874;
    v94 = v46;
    __int16 v95 = 2114;
    v96 = v47;
    __int16 v97 = 2112;
    v98 = @"unexpected pairing server";
    _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_ERROR, "%{public}@tag=\"%{public}@\" desc=\"%@\"", buf, 0x20u);
  }
  else
  {
    v47 = (__CFString *)*MEMORY[0x263F49780];
  }

  v75 = [MEMORY[0x263F499E0] sharedInstance];
  id v76 = objc_alloc(MEMORY[0x263F499F0]);
  v77 = (void *)[v76 initWithTag:v47 data:MEMORY[0x263EFFA78]];
  v78 = [v13 tagProcessorList];
  [v75 submitTaggedEvent:v77 processorList:v78];

  v15 = v85;
LABEL_41:
}

void __85__HMDAccessorySetupCoordinator__handleStagedPairingServer_error_forRequest_activity___block_invoke(id *a1, void *a2, void *a3)
{
  v67[3] = *MEMORY[0x263EF8340];
  v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __85__HMDAccessorySetupCoordinator__handleStagedPairingServer_error_forRequest_activity___block_invoke_171;
    v52[3] = &unk_264A2D9C8;
    id v53 = a1[7];
    v7 = [(__CFString *)v5 na_firstObjectPassingTest:v52];
    v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = a1[4];
    id v10 = HMFGetOSLogHandle();
    v11 = v10;
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v12 = HMFGetLogIdentifier();
        id v13 = [v7 uuid];
        v14 = (__CFString *)a1[7];
        *(_DWORD *)buf = 138543874;
        v57 = v12;
        __int16 v58 = 2112;
        id v59 = v13;
        __int16 v60 = 2112;
        v61 = v14;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Passing back pairing UUID %@ for staged pairing identifier: %@", buf, 0x20u);
      }
      v15 = [a1[5] pendingRequestMessage];
      v66[0] = *MEMORY[0x263F0B640];
      v16 = [a1[5] UUID];
      uint64_t v17 = *MEMORY[0x263F0B5F8];
      id v18 = a1[7];
      v67[0] = v16;
      v67[1] = v18;
      uint64_t v19 = *MEMORY[0x263F0B610];
      v66[1] = v17;
      v66[2] = v19;
      v20 = [v7 uuid];
      v67[2] = v20;
      unint64_t v21 = 0x263EFF000uLL;
      v22 = [NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:3];
      [v15 respondWithPayload:v22];

      v23 = (void *)MEMORY[0x230FBD990]();
      id v24 = a1[4];
      v25 = HMFGetOSLogHandle();
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
      v27 = (uint64_t *)MEMORY[0x263F49728];
      if (v26)
      {
        HMFGetLogIdentifier();
        v28 = v51 = v23;
        v29 = (void *)*MEMORY[0x263F49720];
        id v30 = v27;
        v31 = v5;
        v32 = v7;
        id v33 = v6;
        uint64_t v34 = *v30;
        id v35 = [a1[8] softwareVersionString];
        *(_DWORD *)buf = 138544386;
        v57 = v28;
        __int16 v58 = 2114;
        id v59 = v29;
        __int16 v60 = 2112;
        v61 = @"Firmware version";
        __int16 v62 = 2114;
        uint64_t v63 = v34;
        id v6 = v33;
        v7 = v32;
        v5 = v31;
        __int16 v64 = 2112;
        v65 = v35;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);

        unint64_t v21 = 0x263EFF000;
        v23 = v51;
      }
      else
      {
        v29 = (void *)*MEMORY[0x263F49720];
      }

      v44 = [MEMORY[0x263F499E0] sharedInstance];
      id v46 = objc_alloc(MEMORY[0x263F499F0]);
      v47 = [a1[8] softwareVersionString];
      if (v47)
      {
        uint64_t v54 = *MEMORY[0x263F49728];
        v25 = [a1[8] softwareVersionString];
        v55 = v25;
        v48 = [*(id *)(v21 + 2352) dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      }
      else
      {
        v48 = (void *)MEMORY[0x263EFFA78];
      }
      v49 = (void *)[v46 initWithTag:v29 data:v48];
      v50 = [a1[6] tagProcessorList];
      [v44 submitTaggedEvent:v49 processorList:v50];

      if (v47)
      {
      }
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v42 = HMFGetLogIdentifier();
        id v43 = a1[7];
        *(_DWORD *)buf = 138543874;
        v57 = v42;
        __int16 v58 = 2112;
        id v59 = v43;
        __int16 v60 = 2112;
        v61 = v5;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not find system commissioner pairing for newly staged server with identifier %@ in all pairings: %@", buf, 0x20u);
      }
      v44 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      v45 = [a1[5] pendingRequestMessage];
      [v45 respondWithError:v44];

      HMMLogTagActivityWithError();
      [a1[6] invalidate];
    }

    v40 = v53;
  }
  else
  {
    v36 = (void *)MEMORY[0x230FBD990]();
    id v37 = a1[4];
    v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v57 = v39;
      __int16 v58 = 2112;
      id v59 = v6;
      _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@System commissioner failed to fetch pairings: %@", buf, 0x16u);
    }
    v40 = [MEMORY[0x263F087E8] hmErrorWithCode:2 description:0 reason:0 suggestion:0 underlyingError:v6];
    v41 = [a1[5] pendingRequestMessage];
    [v41 respondWithError:v40];

    HMMLogTagActivityWithError();
    [a1[6] invalidate];
  }
}

uint64_t __85__HMDAccessorySetupCoordinator__handleStagedPairingServer_error_forRequest_activity___block_invoke_171(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263F49840];
  v4 = [a2 nodeID];
  v5 = [v3 identifierStringWithCHIPNodeID:v4];

  uint64_t v6 = [v5 isEqual:*(void *)(a1 + 32)];
  return v6;
}

- (void)_handleStagedPairingProgressState:(int64_t)a3 forRequest:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = [(HMDAccessorySetupCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v7);

  v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    id v12 = [v6 UUID];
    *(_DWORD *)buf = 138543874;
    BOOL v26 = v11;
    __int16 v27 = 2048;
    int64_t v28 = a3;
    __int16 v29 = 2112;
    id v30 = v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling progress state (%ld) for request UUID: %@", buf, 0x20u);
  }
  if ((unint64_t)(a3 - 1) > 0x25) {
    uint64_t v13 = 15;
  }
  else {
    uint64_t v13 = qword_2303E3F88[a3 - 1];
  }
  v14 = [NSNumber numberWithInteger:v13];
  v15 = objc_msgSend(v6, "UUID", *MEMORY[0x263F0B640]);
  v23[1] = *MEMORY[0x263F0B620];
  v24[0] = v15;
  v24[1] = v14;
  v16 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];

  uint64_t v17 = [MEMORY[0x263F42590] entitledMessageWithName:*MEMORY[0x263F0B688] messagePayload:v16];
  id v18 = objc_alloc(MEMORY[0x263F42570]);
  uint64_t v19 = [(HMDAccessorySetupCoordinator *)v9 messageTargetUUID];
  v20 = (void *)[v18 initWithTarget:v19];
  [v17 setDestination:v20];

  unint64_t v21 = [(HMDAccessorySetupCoordinator *)v9 messageDispatcher];
  v22 = (void *)[v17 copy];
  [v21 sendMessage:v22];
}

- (void)_handleStagedPairingReadyToCancel:(id)a3 forRequest:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDAccessorySetupCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    uint64_t v13 = [v7 UUID];
    int v25 = 138543618;
    BOOL v26 = v12;
    __int16 v27 = 2112;
    int64_t v28 = v13;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Handling ready to cancel for request UUID: %@", (uint8_t *)&v25, 0x16u);
  }
  v14 = [v7 pendingCancelMessage];

  if (v14)
  {
    v15 = (void *)MEMORY[0x230FBD990]();
    v16 = v10;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      int v25 = 138543362;
      BOOL v26 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Responding to a pending Cancel message", (uint8_t *)&v25, 0xCu);
    }
    uint64_t v19 = [v7 pendingCancelMessage];
    [v19 respondWithSuccess];

    v20 = [v7 pendingRequestMessage];

    if (v20)
    {
      unint64_t v21 = [v7 pendingRequestMessage];
      v22 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
      [v21 respondWithError:v22];
    }
    v23 = [(HMDAccessorySetupCoordinator *)v16 stagingRequestsByUUID];
    id v24 = [v7 UUID];
    [v23 setObject:0 forKeyedSubscript:v24];
  }
  else
  {
    [v7 setCancelHandler:v6];
  }
}

- (void)_handleStagedPairingThreadNetworkScanResults:(id)a3 completionHandler:(id)a4 forRequest:(id)a5 activity:(id)a6
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v10 = a3;
  v11 = (uint64_t (**)(id, void))a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(HMDAccessorySetupCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v14);

  v15 = (void *)MEMORY[0x230FBD990]();
  v16 = self;
  uint64_t v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = HMFGetLogIdentifier();
    uint64_t v19 = [v12 UUID];
    *(_DWORD *)buf = 138543874;
    v51 = v18;
    __int16 v52 = 2112;
    id v53 = v10;
    __int16 v54 = 2112;
    v55 = v19;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Handling Thread scan results %@ for request UUID: %@", buf, 0x20u);
  }
  v20 = [v12 selectWiFiNetworkHandler];
  if (v20)
  {

LABEL_6:
    v22 = (void *)MEMORY[0x230FBD990]();
    v23 = v16;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v25 = HMFGetLogIdentifier();
      BOOL v26 = [v12 UUID];
      *(_DWORD *)buf = 138543618;
      v51 = v25;
      __int16 v52 = 2112;
      id v53 = v26;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly received Thread scan results for request UUID: %@", buf, 0x16u);
    }
    uint64_t v27 = v11[2](v11, 0);
    int64_t v28 = (void *)MEMORY[0x230FBD990](v27);
    uint64_t v29 = v23;
    id v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = HMFGetLogIdentifier();
      v32 = (void *)*MEMORY[0x263F49780];
      *(_DWORD *)buf = 138543874;
      v51 = v31;
      __int16 v52 = 2114;
      id v53 = v32;
      __int16 v54 = 2112;
      v55 = @"Unexpected thread scan results";
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@tag=\"%{public}@\" desc=\"%@\"", buf, 0x20u);
    }
    else
    {
      v32 = (void *)*MEMORY[0x263F49780];
    }

    id v33 = [MEMORY[0x263F499E0] sharedInstance];
    id v34 = objc_alloc(MEMORY[0x263F499F0]);
    id v35 = (void *)[v34 initWithTag:v32 data:MEMORY[0x263EFFA78]];
    v36 = [v13 tagProcessorList];
    [v33 submitTaggedEvent:v35 processorList:v36];
    goto LABEL_12;
  }
  unint64_t v21 = [v12 selectThreadNetworkHandler];

  if (v21) {
    goto LABEL_6;
  }
  if (v10)
  {
    id v37 = objc_msgSend(v12, "UUID", *MEMORY[0x263F0B640]);
    v49[0] = v37;
    v48[1] = *MEMORY[0x263F0B650];
    v38 = encodeRootObject();
    v49[1] = v38;
    id v33 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];
  }
  else
  {
    id v33 = (void *)MEMORY[0x263EFFA78];
  }
  [v12 setSelectThreadNetworkHandler:v11];
  v39 = [v12 pendingRequestMessage];

  if (!v39)
  {
    id v35 = [v12 pendingResponsePayloads];
    [v35 addObject:v33];
    goto LABEL_13;
  }
  v40 = [v12 pendingRequestMessage];
  [v40 respondWithPayload:v33];

  v41 = (void *)MEMORY[0x230FBD990]([v12 setPendingRequestMessage:0]);
  v42 = v16;
  id v43 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    v44 = HMFGetLogIdentifier();
    v45 = (void *)*MEMORY[0x263F497A0];
    *(_DWORD *)buf = 138543874;
    v51 = v44;
    __int16 v52 = 2114;
    id v53 = v45;
    __int16 v54 = 2112;
    v55 = @"Thread Scan Results Ready";
    _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\"", buf, 0x20u);
  }
  else
  {
    v45 = (void *)*MEMORY[0x263F497A0];
  }

  id v35 = [MEMORY[0x263F499E0] sharedInstance];
  id v46 = objc_alloc(MEMORY[0x263F499F0]);
  v36 = (void *)[v46 initWithTag:v45 data:MEMORY[0x263EFFA78]];
  v47 = [v13 tagProcessorList];
  [v35 submitTaggedEvent:v36 processorList:v47];

LABEL_12:
LABEL_13:
}

- (void)_handleStagedPairingWiFiNetworkScanResults:(id)a3 completionHandler:(id)a4 forRequest:(id)a5 activity:(id)a6
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v10 = a3;
  v11 = (void (**)(id, void))a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(HMDAccessorySetupCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v14);

  v15 = (void *)MEMORY[0x230FBD990]();
  v16 = self;
  uint64_t v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = HMFGetLogIdentifier();
    uint64_t v19 = [v12 UUID];
    *(_DWORD *)buf = 138543874;
    v38 = v18;
    __int16 v39 = 2112;
    id v40 = v10;
    __int16 v41 = 2112;
    v42 = v19;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Handling WiFi scan results %@ for request UUID: %@", buf, 0x20u);
  }
  v20 = [v12 selectWiFiNetworkHandler];
  if (v20)
  {
  }
  else
  {
    unint64_t v21 = [v12 selectThreadNetworkHandler];

    if (!v21)
    {
      if (v10)
      {
        v35[0] = *MEMORY[0x263F0B640];
        uint64_t v27 = [v12 UUID];
        v36[0] = v27;
        v35[1] = *MEMORY[0x263F0B660];
        int64_t v28 = encodeRootObject();
        v36[1] = v28;
        uint64_t v29 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
      }
      else
      {
        uint64_t v27 = objc_msgSend(v12, "UUID", *MEMORY[0x263F0B640]);
        id v34 = v27;
        uint64_t v29 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      }

      [v12 setSelectWiFiNetworkHandler:v11];
      id v30 = [v12 pendingRequestMessage];

      if (v30)
      {
        uint64_t v31 = [v12 pendingRequestMessage];
        [v31 respondWithPayload:v29];

        [v12 setPendingRequestMessage:0];
      }
      else
      {
        v32 = [v12 pendingResponsePayloads];
        [v32 addObject:v29];
      }
      goto LABEL_9;
    }
  }
  v22 = (void *)MEMORY[0x230FBD990]();
  v23 = v16;
  id v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    int v25 = HMFGetLogIdentifier();
    BOOL v26 = [v12 UUID];
    *(_DWORD *)buf = 138543618;
    v38 = v25;
    __int16 v39 = 2112;
    id v40 = v26;
    _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly received WiFi scan results for request UUID: %@", buf, 0x16u);
  }
  v11[2](v11, 0);
LABEL_9:
}

- (void)_handleStagedPairingDeviceCredential:(id)a3 completionHandler:(id)a4 forRequest:(id)a5 activity:(id)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(HMDAccessorySetupCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v14);

  v15 = (void *)MEMORY[0x230FBD990]();
  v16 = self;
  uint64_t v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = HMFGetLogIdentifier();
    uint64_t v19 = [v12 UUID];
    *(_DWORD *)buf = 138543874;
    id v37 = v18;
    __int16 v38 = 2112;
    id v39 = v10;
    __int16 v40 = 2112;
    __int16 v41 = v19;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Handling device credential %@ for request UUID: %@", buf, 0x20u);
  }
  v20 = objc_msgSend(v12, "UUID", *MEMORY[0x263F0B640]);
  v35[0] = v20;
  v34[1] = *MEMORY[0x263F0B608];
  unint64_t v21 = encodeRootObject();
  v35[1] = v21;
  v22 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];

  v23 = [v12 pendingRequestMessage];

  if (v23)
  {
    id v24 = [v12 pendingRequestMessage];
    [v24 respondWithPayload:v22];

    int v25 = (void *)MEMORY[0x230FBD990]([v12 setPendingRequestMessage:0]);
    BOOL v26 = v16;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      int64_t v28 = HMFGetLogIdentifier();
      uint64_t v29 = (void *)*MEMORY[0x263F49750];
      *(_DWORD *)buf = 138543874;
      id v37 = v28;
      __int16 v38 = 2114;
      id v39 = v29;
      __int16 v40 = 2112;
      __int16 v41 = @"Device credential sent to client";
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\"", buf, 0x20u);
    }
    else
    {
      uint64_t v29 = (void *)*MEMORY[0x263F49750];
    }

    id v30 = [MEMORY[0x263F499E0] sharedInstance];
    id v31 = objc_alloc(MEMORY[0x263F499F0]);
    v32 = (void *)[v31 initWithTag:v29 data:MEMORY[0x263EFFA78]];
    uint64_t v33 = [v13 tagProcessorList];
    [v30 submitTaggedEvent:v32 processorList:v33];
  }
  else
  {
    id v30 = [v12 pendingResponsePayloads];
    [v30 addObject:v22];
  }

  [v12 setConfirmDeviceCredentialCompletionHandler:v11];
}

- (id)_setupPayloadWithCHIPSetupPayload:(id)a3 setupPayloadURL:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    _HMFPreconditionFailure();
  }
  v8 = v7;
  id v9 = objc_alloc(MEMORY[0x263F0E5E8]);
  id v10 = [v6 setupCode];
  id v11 = [v10 stringValue];
  id v12 = (void *)[v9 initWithSetupCode:v11 communicationProtocol:2];

  id v13 = (void *)[objc_alloc(MEMORY[0x263F0E150]) initWithCHIPSetupPayload:v6];
  [v12 setChipAccessorySetupPayload:v13];

  [v12 setSetupPayloadURL:v8];
  v14 = [v6 setupID];
  [v12 setSetupID:v14];

  objc_msgSend(v12, "setSupportsIP:", objc_msgSend(v6, "supportsIP"));
  objc_msgSend(v12, "setSupportsBTLE:", objc_msgSend(v6, "supportsBLE"));
  objc_msgSend(v12, "setSupportsWAC:", objc_msgSend(v6, "supportsSoftAP"));
  v15 = [v6 vendorID];
  uint64_t v16 = [v6 productID];
  uint64_t v17 = (void *)v16;
  if (v15 && v16)
  {
    id v18 = [(HMDAccessorySetupCoordinator *)self chipDataSource];
    uint64_t v19 = [v18 vendorMetadataStore];
    [v6 vendorID];
    v20 = v15;
    unint64_t v21 = v17;
    v22 = self;
    id v24 = v23 = v8;
    int v25 = [v6 productID];
    id v34 = [v19 retrieveVendorMetadataForVendorID:v24 productID:v25];

    v8 = v23;
    self = v22;
    uint64_t v17 = v21;
    v15 = v20;

    BOOL v26 = [v6 productID];
    uint64_t v27 = [v34 productWithID:v26];

    int64_t v28 = [v27 categoryNumber];
    [v12 setCategoryNumber:v28];
  }
  uint64_t v29 = (void *)MEMORY[0x230FBD990]();
  id v30 = self;
  id v31 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    v32 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v36 = v32;
    __int16 v37 = 2112;
    __int16 v38 = v12;
    _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Created CHIP setup accessory payload: %@", buf, 0x16u);
  }

  return v12;
}

- (id)_createCHIPSetupAccessoryPayloadWithSetupPayloadDecimalStringRepresentation:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!v6) {
    _HMFPreconditionFailure();
  }
  id v7 = v6;
  v8 = [(HMDAccessorySetupCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(HMDAccessorySetupCoordinator *)self decimalStringRepresentationCHIPAccessorySetupPayloadFactory];
  id v10 = ((void (**)(void, void *))v9)[2](v9, v7);

  if (v10)
  {
    id v11 = [(HMDAccessorySetupCoordinator *)self _setupPayloadWithCHIPSetupPayload:v10 setupPayloadURL:0];
  }
  else
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v17 = 138543618;
      id v18 = v15;
      __int16 v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to create CHIP accessory setup payload from decimal string representation: %@", (uint8_t *)&v17, 0x16u);
    }
    if (a4)
    {
      [MEMORY[0x263F087E8] hmErrorWithCode:3];
      id v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = 0;
    }
  }

  return v11;
}

- (void)handleCancelStagedCHIPAccessoryPairingMessage:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDAccessorySetupCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 stringForKey:*MEMORY[0x263F0B5F8]];
  id v7 = (void *)MEMORY[0x230FBD990]();
  v8 = self;
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v19 = v11;
      __int16 v20 = 2112;
      uint64_t v21 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Discarding staged accessory server with identifier: %@", buf, 0x16u);
    }
    id v12 = [(HMDAccessorySetupCoordinator *)v8 chipAccessoryServerBrowser];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __78__HMDAccessorySetupCoordinator_handleCancelStagedCHIPAccessoryPairingMessage___block_invoke;
    v16[3] = &unk_264A2F370;
    v16[4] = v8;
    id v17 = v4;
    [v12 discardStagedAccessoryServerWithIdentifier:v6 completionHandler:v16];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      v14 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      __int16 v19 = v13;
      __int16 v20 = 2112;
      uint64_t v21 = v14;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not find CHIP accessory pairing identifier in message payload: %@", buf, 0x16u);
    }
    v15 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v4 respondWithError:v15];
  }
}

void __78__HMDAccessorySetupCoordinator_handleCancelStagedCHIPAccessoryPairingMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v10 = 138543618;
      id v11 = v7;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to discard staged accessory server: %@", (uint8_t *)&v10, 0x16u);
    }
    v8 = *(void **)(a1 + 40);
    id v9 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v8 respondWithError:v9];
  }
  else
  {
    [*(id *)(a1 + 40) respondWithSuccess];
  }
}

- (void)handleCreateCHIPSetupPayloadMessage:(id)a3
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessorySetupCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 stringForKey:*MEMORY[0x263F0B5F8]];
  if (v6)
  {
    id v7 = [(HMDAccessorySetupCoordinator *)self chipAccessoryServerBrowser];
    v8 = [v7 stagedAccessoryServerWithIdentifier:v6];

    if (v8)
    {
      id v9 = [(HMDAccessorySetupCoordinator *)self currentBundleIdentifier];
      char v10 = [v9 isEqualToString:*MEMORY[0x263F0C7A8]];

      if ((v10 & 1) == 0)
      {
        uint64_t v11 = [(HMDAccessorySetupCoordinator *)self metricsActivity];
        if (!v11
          || (__int16 v12 = (void *)v11,
              [(HMDAccessorySetupCoordinator *)self metricsActivity],
              id v13 = objc_claimAutoreleasedReturnValue(),
              char v14 = [v13 isValid],
              v13,
              v12,
              (v14 & 1) == 0))
        {
          v15 = (void *)MEMORY[0x230FBD990]();
          uint64_t v16 = self;
          id v17 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            id v18 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            id v59 = v18;
            _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Starting metrics collection for 3rd party pairing via locker", buf, 0xCu);
          }
          [(HMDAccessorySetupCoordinator *)v16 startMetricsForThirdPartyPairing];
          __int16 v19 = [(HMDAccessorySetupCoordinator *)v16 metricsActivity];
          [v8 startPairingMetricWithActivity:v19];

          __int16 v20 = (void *)MEMORY[0x230FBD990]();
          uint64_t v21 = v16;
          uint64_t v22 = HMFGetOSLogHandle();
          BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
          id v24 = (uint64_t *)MEMORY[0x263F49738];
          if (v23)
          {
            HMFGetLogIdentifier();
            v25 = id v53 = v20;
            BOOL v26 = (void *)*MEMORY[0x263F49778];
            uint64_t v27 = *v24;
            int64_t v28 = [(HMDAccessorySetupCoordinator *)v21 currentBundleIdentifier];
            *(_DWORD *)buf = 138544386;
            id v59 = v25;
            __int16 v60 = 2114;
            v61 = v26;
            __int16 v62 = 2112;
            uint64_t v63 = @"Accessory Info";
            __int16 v64 = 2114;
            uint64_t v65 = v27;
            __int16 v66 = 2112;
            v67 = v28;
            _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);

            uint64_t v29 = v26;
            __int16 v20 = v53;
          }
          else
          {
            uint64_t v29 = (void *)*MEMORY[0x263F49778];
          }

          __int16 v40 = [MEMORY[0x263F499E0] sharedInstance];
          id v41 = objc_alloc(MEMORY[0x263F499F0]);
          uint64_t v42 = [(HMDAccessorySetupCoordinator *)v21 currentBundleIdentifier];
          if (v42)
          {
            uint64_t v56 = *MEMORY[0x263F49738];
            id v53 = [(HMDAccessorySetupCoordinator *)v21 currentBundleIdentifier];
            v57 = v53;
            uint64_t v43 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
          }
          else
          {
            uint64_t v43 = (void *)MEMORY[0x263EFFA78];
          }
          v44 = (void *)[v41 initWithTag:v29 data:v43];
          v45 = [(HMDAccessorySetupCoordinator *)v21 metricsActivity];
          id v46 = [v45 tagProcessorList];
          [v40 submitTaggedEvent:v44 processorList:v46];

          if (v42)
          {
          }
        }
      }
      v47 = (void *)MEMORY[0x230FBD990]();
      v48 = self;
      v49 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        v50 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v59 = v50;
        __int16 v60 = 2112;
        v61 = v8;
        _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_INFO, "%{public}@Opening pairing window with PIN on CHIP accessory server: %@", buf, 0x16u);
      }
      +[HMDHAPAccessory chipPairingModeActiveDuration];
      double v52 = v51;
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __68__HMDAccessorySetupCoordinator_handleCreateCHIPSetupPayloadMessage___block_invoke;
      v54[3] = &unk_264A2DA40;
      v54[4] = v48;
      id v55 = v4;
      [v8 openPairingWindowWithPINForDuration:v54 completionHandler:v52];
    }
    else
    {
      id v35 = (void *)MEMORY[0x230FBD990]();
      v36 = self;
      __int16 v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        __int16 v38 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v59 = v38;
        __int16 v60 = 2112;
        v61 = v6;
        _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@Could not find CHIP accessory server with identifier: %@", buf, 0x16u);
      }
      uint64_t v39 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [v4 respondWithError:v39];

      v8 = 0;
    }
  }
  else
  {
    id v30 = (void *)MEMORY[0x230FBD990]();
    id v31 = self;
    v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = HMFGetLogIdentifier();
      id v34 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      id v59 = v33;
      __int16 v60 = 2112;
      v61 = v34;
      _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Could not find CHIP accessory pairing identifier in message payload: %@", buf, 0x16u);
    }
    v8 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v4 respondWithError:v8];
  }
}

void __68__HMDAccessorySetupCoordinator_handleCreateCHIPSetupPayloadMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v13 = *MEMORY[0x263F0B628];
    id v14 = v5;
    id v7 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    [*(id *)(a1 + 40) respondWithPayload:v7];
  }
  else
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    char v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to open pairing window with PIN: %@", buf, 0x16u);
    }
    __int16 v12 = *(void **)(a1 + 40);
    id v7 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v12 respondWithError:v7];
  }
}

- (void)handleCancelStagingMessage:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessorySetupCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 uuidForKey:*MEMORY[0x263F0B640]];
  id v7 = (void *)MEMORY[0x230FBD990]();
  v8 = self;
  id v9 = HMFGetOSLogHandle();
  char v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v37 = 138543618;
      __int16 v38 = v11;
      __int16 v39 = 2112;
      __int16 v40 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling cancel staging message with staging request UUID: %@", (uint8_t *)&v37, 0x16u);
    }
    __int16 v12 = [(HMDAccessorySetupCoordinator *)v8 stagingRequestsByUUID];
    uint64_t v13 = [v12 objectForKeyedSubscript:v6];

    if (v13)
    {
      id v14 = [v13 error];

      if (v14)
      {
        v15 = (void *)MEMORY[0x230FBD990]();
        uint64_t v16 = v8;
        __int16 v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          id v18 = HMFGetLogIdentifier();
          uint64_t v19 = [v13 error];
          int v37 = 138543618;
          __int16 v38 = v18;
          __int16 v39 = 2112;
          __int16 v40 = v19;
          _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Responding to cancel staging message with success in presence of queued pairing error: %@", (uint8_t *)&v37, 0x16u);
        }
        __int16 v20 = [(HMDAccessorySetupCoordinator *)v16 stagingRequestsByUUID];
        [v20 setObject:0 forKeyedSubscript:v6];

        [v4 respondWithSuccess];
      }
      else
      {
        int64_t v28 = [v13 cancelHandler];

        if (v28)
        {
          uint64_t v29 = [(HMDAccessorySetupCoordinator *)v8 stagingRequestsByUUID];
          [v29 setObject:0 forKeyedSubscript:v6];

          id v30 = [v13 cancelHandler];
          v30[2]();

          [v4 respondWithSuccess];
          id v31 = [v13 pendingRequestMessage];
          v32 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
          [v31 respondWithError:v32];

          [v13 setPendingRequestMessage:0];
        }
        else
        {
          uint64_t v33 = (void *)MEMORY[0x230FBD990]();
          id v34 = v8;
          id v35 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            v36 = HMFGetLogIdentifier();
            int v37 = 138543618;
            __int16 v38 = v36;
            __int16 v39 = 2112;
            __int16 v40 = v6;
            _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@Staging request UUID: %@ is not ready to cancel yet", (uint8_t *)&v37, 0x16u);
          }
          [v13 setPendingCancelMessage:v4];
        }
      }
    }
    else
    {
      BOOL v23 = (void *)MEMORY[0x230FBD990]();
      id v24 = v8;
      int v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        BOOL v26 = HMFGetLogIdentifier();
        int v37 = 138543618;
        __int16 v38 = v26;
        __int16 v39 = 2112;
        __int16 v40 = v6;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Could not find staging request for cancel staging message with staging request UUID: %@", (uint8_t *)&v37, 0x16u);
      }
      uint64_t v27 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [v4 respondWithError:v27];

      uint64_t v13 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      uint64_t v22 = [v4 messagePayload];
      int v37 = 138543618;
      __int16 v38 = v21;
      __int16 v39 = 2112;
      __int16 v40 = v22;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not find staging request in cancel staging message payload: %@", (uint8_t *)&v37, 0x16u);
    }
    uint64_t v13 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v4 respondWithError:v13];
  }
}

- (void)handleSelectWiFiNetworkAssociationMessage:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessorySetupCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 uuidForKey:*MEMORY[0x263F0B640]];
  if (v6)
  {
    uint64_t v7 = *MEMORY[0x263F0B658];
    uint64_t v43 = objc_opt_class();
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
    id v9 = [v4 unarchivedObjectForKey:v7 ofClasses:v8];

    char v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = self;
    __int16 v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v45 = v13;
      __int16 v46 = 2112;
      v47 = v6;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling select wifi network message for request UUID: %@", buf, 0x16u);
    }
    id v14 = [(HMDAccessorySetupCoordinator *)v11 stagingRequestsByUUID];
    v15 = [v14 objectForKeyedSubscript:v6];

    if (!v15)
    {
      uint64_t v29 = (void *)MEMORY[0x230FBD990]();
      id v30 = v11;
      id v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v45 = v32;
        __int16 v46 = 2112;
        v47 = v6;
        _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Could not find staging request for select wifi network message with staging request UUID: %@", buf, 0x16u);
      }
      uint64_t v33 = (void *)MEMORY[0x263F087E8];
      uint64_t v34 = 2;
      goto LABEL_23;
    }
    uint64_t v16 = [v15 error];

    if (v16)
    {
      __int16 v17 = (void *)MEMORY[0x230FBD990]();
      id v18 = v11;
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        __int16 v20 = HMFGetLogIdentifier();
        uint64_t v21 = [v15 error];
        *(_DWORD *)buf = 138543618;
        v45 = v20;
        __int16 v46 = 2112;
        v47 = v21;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Responding to select wifi network message with queued pairing error: %@", buf, 0x16u);
      }
      uint64_t v22 = [v15 error];
      [v4 respondWithError:v22];

      BOOL v23 = [(HMDAccessorySetupCoordinator *)v18 stagingRequestsByUUID];
      [v23 setObject:0 forKeyedSubscript:v6];
      goto LABEL_24;
    }
    id v35 = [v15 selectWiFiNetworkHandler];

    if (v35)
    {
      v36 = [v15 pendingRequestMessage];

      if (!v36)
      {
        uint64_t v42 = [v15 selectWiFiNetworkHandler];
        ((void (**)(void, void *))v42)[2](v42, v9);

        [v15 setSelectWiFiNetworkHandler:0];
        [v15 setPendingRequestMessage:v4];
        goto LABEL_25;
      }
      int v37 = (void *)MEMORY[0x230FBD990]();
      __int16 v38 = v11;
      __int16 v39 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      __int16 v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v45 = v40;
      __int16 v46 = 2112;
      v47 = v6;
      uint64_t v41 = "%{public}@A pending request message already exists for staging request UUID: %@";
    }
    else
    {
      int v37 = (void *)MEMORY[0x230FBD990]();
      __int16 v38 = v11;
      __int16 v39 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
LABEL_22:

        uint64_t v33 = (void *)MEMORY[0x263F087E8];
        uint64_t v34 = 52;
LABEL_23:
        BOOL v23 = [v33 hmErrorWithCode:v34];
        [v4 respondWithError:v23];
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      __int16 v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v45 = v40;
      __int16 v46 = 2112;
      v47 = v6;
      uint64_t v41 = "%{public}@No pending select wifi network completion handler exists for staging request UUID: %@";
    }
    _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, v41, buf, 0x16u);

    goto LABEL_22;
  }
  id v24 = (void *)MEMORY[0x230FBD990]();
  int v25 = self;
  BOOL v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    uint64_t v27 = HMFGetLogIdentifier();
    int64_t v28 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    v45 = v27;
    __int16 v46 = 2112;
    v47 = v28;
    _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Could not find staging request in select-wifi-network message payload: %@", buf, 0x16u);
  }
  id v9 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
  [v4 respondWithError:v9];
LABEL_26:
}

- (void)handleSelectThreadNetworkAssociationMessage:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessorySetupCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 uuidForKey:*MEMORY[0x263F0B640]];
  if (v6)
  {
    uint64_t v7 = *MEMORY[0x263F0B648];
    uint64_t v43 = objc_opt_class();
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
    id v9 = [v4 unarchivedObjectForKey:v7 ofClasses:v8];

    char v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = self;
    __int16 v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v45 = v13;
      __int16 v46 = 2112;
      v47 = v6;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling select Thread network message for request UUID: %@", buf, 0x16u);
    }
    id v14 = [(HMDAccessorySetupCoordinator *)v11 stagingRequestsByUUID];
    v15 = [v14 objectForKeyedSubscript:v6];

    if (!v15)
    {
      uint64_t v29 = (void *)MEMORY[0x230FBD990]();
      id v30 = v11;
      id v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v45 = v32;
        __int16 v46 = 2112;
        v47 = v6;
        _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Could not find staging request for select Thread network message with staging request UUID: %@", buf, 0x16u);
      }
      uint64_t v33 = (void *)MEMORY[0x263F087E8];
      uint64_t v34 = 2;
      goto LABEL_23;
    }
    uint64_t v16 = [v15 error];

    if (v16)
    {
      __int16 v17 = (void *)MEMORY[0x230FBD990]();
      id v18 = v11;
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        __int16 v20 = HMFGetLogIdentifier();
        uint64_t v21 = [v15 error];
        *(_DWORD *)buf = 138543618;
        v45 = v20;
        __int16 v46 = 2112;
        v47 = v21;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Responding to select Thread network message with queued pairing error: %@", buf, 0x16u);
      }
      uint64_t v22 = [v15 error];
      [v4 respondWithError:v22];

      BOOL v23 = [(HMDAccessorySetupCoordinator *)v18 stagingRequestsByUUID];
      [v23 setObject:0 forKeyedSubscript:v6];
      goto LABEL_24;
    }
    id v35 = [v15 selectThreadNetworkHandler];

    if (v35)
    {
      v36 = [v15 pendingRequestMessage];

      if (!v36)
      {
        uint64_t v42 = [v15 selectThreadNetworkHandler];
        ((void (**)(void, void *))v42)[2](v42, v9);

        [v15 setSelectThreadNetworkHandler:0];
        [v15 setPendingRequestMessage:v4];
        goto LABEL_25;
      }
      int v37 = (void *)MEMORY[0x230FBD990]();
      __int16 v38 = v11;
      __int16 v39 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      __int16 v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v45 = v40;
      __int16 v46 = 2112;
      v47 = v6;
      uint64_t v41 = "%{public}@A pending request message already exists for staging request UUID: %@";
    }
    else
    {
      int v37 = (void *)MEMORY[0x230FBD990]();
      __int16 v38 = v11;
      __int16 v39 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
LABEL_22:

        uint64_t v33 = (void *)MEMORY[0x263F087E8];
        uint64_t v34 = 52;
LABEL_23:
        BOOL v23 = [v33 hmErrorWithCode:v34];
        [v4 respondWithError:v23];
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      __int16 v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v45 = v40;
      __int16 v46 = 2112;
      v47 = v6;
      uint64_t v41 = "%{public}@No pending select Thread network completion handler exists for staging request UUID: %@";
    }
    _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, v41, buf, 0x16u);

    goto LABEL_22;
  }
  id v24 = (void *)MEMORY[0x230FBD990]();
  int v25 = self;
  BOOL v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    uint64_t v27 = HMFGetLogIdentifier();
    int64_t v28 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    v45 = v27;
    __int16 v46 = 2112;
    v47 = v28;
    _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Could not find staging request in select-thread-network message payload: %@", buf, 0x16u);
  }
  id v9 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
  [v4 respondWithError:v9];
LABEL_26:
}

- (void)handleRejectDeviceCredentialMessage:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessorySetupCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 uuidForKey:*MEMORY[0x263F0B640]];
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  v8 = self;
  id v9 = HMFGetOSLogHandle();
  char v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v43 = 138543618;
      v44 = v11;
      __int16 v45 = 2112;
      __int16 v46 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling reject device credential message with staging request UUID: %@", (uint8_t *)&v43, 0x16u);
    }
    __int16 v12 = [(HMDAccessorySetupCoordinator *)v8 stagingRequestsByUUID];
    uint64_t v13 = [v12 objectForKeyedSubscript:v6];

    if (v13)
    {
      id v14 = [v13 error];

      if (v14)
      {
        v15 = (void *)MEMORY[0x230FBD990]();
        uint64_t v16 = v8;
        __int16 v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v18 = HMFGetLogIdentifier();
          uint64_t v19 = [v13 error];
          int v43 = 138543618;
          v44 = v18;
          __int16 v45 = 2112;
          __int16 v46 = v19;
          _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Responding to reject device credential message with queued pairing error: %@", (uint8_t *)&v43, 0x16u);
        }
        __int16 v20 = [v13 error];
        [v4 respondWithError:v20];

        uint64_t v21 = [(HMDAccessorySetupCoordinator *)v16 stagingRequestsByUUID];
        [v21 setObject:0 forKeyedSubscript:v6];
        goto LABEL_23;
      }
      uint64_t v29 = [v13 confirmDeviceCredentialCompletionHandler];

      if (!v29)
      {
        id v31 = (void *)MEMORY[0x230FBD990]();
        v32 = v8;
        uint64_t v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          uint64_t v34 = HMFGetLogIdentifier();
          int v43 = 138543618;
          v44 = v34;
          __int16 v45 = 2112;
          __int16 v46 = v6;
          id v35 = "%{public}@No pending reject device credential completion handler exists for staging request UUID: %@";
          goto LABEL_21;
        }
LABEL_22:

        uint64_t v21 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
        [v4 respondWithError:v21];
LABEL_23:

        goto LABEL_24;
      }
      id v30 = [v13 pendingRequestMessage];

      if (v30)
      {
        id v31 = (void *)MEMORY[0x230FBD990]();
        v32 = v8;
        uint64_t v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          uint64_t v34 = HMFGetLogIdentifier();
          int v43 = 138543618;
          v44 = v34;
          __int16 v45 = 2112;
          __int16 v46 = v6;
          id v35 = "%{public}@A pending reject device credential message already exists for staging request UUID: %@";
LABEL_21:
          _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, v35, (uint8_t *)&v43, 0x16u);

          goto LABEL_22;
        }
        goto LABEL_22;
      }
      v36 = [v13 confirmDeviceCredentialCompletionHandler];
      int v37 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
      ((void (**)(void, void *))v36)[2](v36, v37);

      [v13 setConfirmDeviceCredentialCompletionHandler:0];
      __int16 v38 = [v13 pendingResponsePayloads];
      uint64_t v39 = [v38 count];

      if (v39)
      {
        __int16 v40 = [v13 pendingResponsePayloads];
        uint64_t v41 = [v40 objectAtIndexedSubscript:0];

        uint64_t v42 = [v13 pendingResponsePayloads];
        [v42 removeObjectAtIndex:0];

        [v4 respondWithPayload:v41];
      }
      else
      {
        [v13 setPendingRequestMessage:v4];
      }
    }
    else
    {
      id v24 = (void *)MEMORY[0x230FBD990]();
      int v25 = v8;
      BOOL v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = HMFGetLogIdentifier();
        int v43 = 138543618;
        v44 = v27;
        __int16 v45 = 2112;
        __int16 v46 = v6;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Could not find staging request for reject device credential message with staging request UUID: %@", (uint8_t *)&v43, 0x16u);
      }
      int64_t v28 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [v4 respondWithError:v28];

      uint64_t v13 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      BOOL v23 = [v4 messagePayload];
      int v43 = 138543618;
      v44 = v22;
      __int16 v45 = 2112;
      __int16 v46 = v23;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not find staging request in reject device credential message payload: %@", (uint8_t *)&v43, 0x16u);
    }
    uint64_t v13 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v4 respondWithError:v13];
  }
LABEL_24:
}

- (void)handleConfirmDeviceCredentialMessage:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessorySetupCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 uuidForKey:*MEMORY[0x263F0B640]];
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  v8 = self;
  id v9 = HMFGetOSLogHandle();
  char v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v40 = 138543618;
      uint64_t v41 = v11;
      __int16 v42 = 2112;
      int v43 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling confirm device credential message with staging request UUID: %@", (uint8_t *)&v40, 0x16u);
    }
    __int16 v12 = [(HMDAccessorySetupCoordinator *)v8 stagingRequestsByUUID];
    uint64_t v13 = [v12 objectForKeyedSubscript:v6];

    if (v13)
    {
      id v14 = [v13 error];

      if (v14)
      {
        v15 = (void *)MEMORY[0x230FBD990]();
        uint64_t v16 = v8;
        __int16 v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v18 = HMFGetLogIdentifier();
          uint64_t v19 = [v13 error];
          int v40 = 138543618;
          uint64_t v41 = v18;
          __int16 v42 = 2112;
          int v43 = v19;
          _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Responding to confirm device credential message with queued pairing error: %@", (uint8_t *)&v40, 0x16u);
        }
        __int16 v20 = [v13 error];
        [v4 respondWithError:v20];

        uint64_t v21 = [(HMDAccessorySetupCoordinator *)v16 stagingRequestsByUUID];
        [v21 setObject:0 forKeyedSubscript:v6];
LABEL_9:

        goto LABEL_16;
      }
      uint64_t v29 = [v13 confirmDeviceCredentialCompletionHandler];

      if (!v29)
      {
        v36 = (void *)MEMORY[0x230FBD990]();
        int v37 = v8;
        __int16 v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          uint64_t v39 = HMFGetLogIdentifier();
          int v40 = 138543618;
          uint64_t v41 = v39;
          __int16 v42 = 2112;
          int v43 = v6;
          _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@No pending confirm device credential completion handler exists for staging request UUID: %@", (uint8_t *)&v40, 0x16u);
        }
        uint64_t v21 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
        [v4 respondWithError:v21];
        goto LABEL_9;
      }
      id v30 = [v13 confirmDeviceCredentialCompletionHandler];
      v30[2](v30, 0);

      [v13 setConfirmDeviceCredentialCompletionHandler:0];
      id v31 = [v13 pendingResponsePayloads];
      uint64_t v32 = [v31 count];

      if (v32)
      {
        uint64_t v33 = [v13 pendingResponsePayloads];
        uint64_t v34 = [v33 objectAtIndexedSubscript:0];

        id v35 = [v13 pendingResponsePayloads];
        [v35 removeObjectAtIndex:0];

        [v4 respondWithPayload:v34];
      }
      else
      {
        [v13 setPendingRequestMessage:v4];
      }
    }
    else
    {
      id v24 = (void *)MEMORY[0x230FBD990]();
      int v25 = v8;
      BOOL v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = HMFGetLogIdentifier();
        int v40 = 138543618;
        uint64_t v41 = v27;
        __int16 v42 = 2112;
        int v43 = v6;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Could not find staging request for confirm device credential message with staging request UUID: %@", (uint8_t *)&v40, 0x16u);
      }
      int64_t v28 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [v4 respondWithError:v28];

      uint64_t v13 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      BOOL v23 = [v4 messagePayload];
      int v40 = 138543618;
      uint64_t v41 = v22;
      __int16 v42 = 2112;
      int v43 = v23;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not find staging request in confirm device credential message payload: %@", (uint8_t *)&v40, 0x16u);
    }
    uint64_t v13 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v4 respondWithError:v13];
  }
LABEL_16:
}

- (void)handleStageCHIPAccessoryPairingInStepsMessage:(id)a3
{
  v145[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessorySetupCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v5);

  [(HMDAccessorySetupCoordinator *)self startMetricsForThirdPartyPairing];
  id v6 = [(HMDAccessorySetupCoordinator *)self metricsActivity];
  uint64_t v7 = *MEMORY[0x263F0B618];
  v145[0] = objc_opt_class();
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v145 count:1];
  id v9 = [v4 unarchivedObjectForKey:v7 ofClasses:v8];

  if (v9)
  {
    char v85 = [v4 BOOLForKey:*MEMORY[0x263F0B638]];
    char v10 = [v9 categoryNumber];

    if (v10)
    {
      uint64_t v11 = [v9 categoryNumber];
    }
    else
    {
      uint64_t v11 = &unk_26E473108;
    }
    uint64_t v19 = [v9 productNumber];

    if (v19)
    {
      __int16 v20 = [v9 productNumber];
    }
    else
    {
      __int16 v20 = @"Unknown";
    }
    v98 = v20;
    __int16 v99 = v11;
    v100 = v6;
    __int16 v97 = v4;
    uint64_t v21 = (void *)MEMORY[0x230FBD990]();
    uint64_t v22 = self;
    BOOL v23 = HMFGetOSLogHandle();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
    int v25 = (void **)MEMORY[0x263F49778];
    BOOL v26 = (uint64_t *)MEMORY[0x263F49748];
    unint64_t v27 = 0x263F08000uLL;
    int64_t v28 = (uint64_t *)MEMORY[0x263F49740];
    if (v24)
    {
      v86 = HMFGetLogIdentifier();
      v92 = *v25;
      uint64_t v94 = *v26;
      __int16 v101 = v21;
      uint64_t v29 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "communicationProtocol"));
      uint64_t v89 = *v28;
      uint64_t v30 = *MEMORY[0x263F49768];
      uint64_t v31 = *MEMORY[0x263F49738];
      v83 = [(HMDAccessorySetupCoordinator *)v22 currentBundleIdentifier];
      uint64_t v32 = *MEMORY[0x263F49770];
      uint64_t v33 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "requiresMatterCustomCommissioningFlow"));
      *(_DWORD *)buf = 138546434;
      v120 = v86;
      __int16 v121 = 2114;
      v122 = v92;
      unint64_t v27 = 0x263F08000;
      __int16 v123 = 2112;
      v124 = @"Accessory Info";
      __int16 v125 = 2114;
      uint64_t v126 = v94;
      __int16 v127 = 2112;
      v128 = v29;
      __int16 v129 = 2114;
      uint64_t v130 = v89;
      __int16 v131 = 2112;
      uint64_t v34 = v98;
      v132 = v99;
      __int16 v133 = 2114;
      uint64_t v93 = v31;
      uint64_t v95 = v30;
      uint64_t v134 = v30;
      __int16 v135 = 2112;
      v136 = v98;
      __int16 v137 = 2114;
      uint64_t v138 = v31;
      __int16 v139 = 2112;
      v140 = v83;
      __int16 v141 = 2114;
      uint64_t v90 = v32;
      uint64_t v142 = v32;
      __int16 v143 = 2112;
      v144 = v33;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x84u);

      uint64_t v21 = v101;
      int v25 = (void **)MEMORY[0x263F49778];

      BOOL v26 = (uint64_t *)MEMORY[0x263F49748];
    }
    else
    {
      uint64_t v90 = *MEMORY[0x263F49770];
      uint64_t v95 = *MEMORY[0x263F49768];
      uint64_t v93 = *MEMORY[0x263F49738];
      uint64_t v34 = v98;
    }

    id v35 = [MEMORY[0x263F499E0] sharedInstance];
    id v36 = objc_alloc(MEMORY[0x263F499F0]);
    int v37 = *v25;
    uint64_t v38 = *v26;
    uint64_t v39 = objc_msgSend(*(id *)(v27 + 2584), "numberWithInteger:", objc_msgSend(v9, "communicationProtocol"));
    v102 = v9;
    uint64_t v40 = *MEMORY[0x263F49740];
    [(HMDAccessorySetupCoordinator *)v22 currentBundleIdentifier];
    v41 = id v87 = v22;
    __int16 v42 = objc_msgSend(*(id *)(v27 + 2584), "numberWithBool:", objc_msgSend(v102, "requiresMatterCustomCommissioningFlow"));
    id v18 = v99;
    uint64_t v79 = v38;
    int v43 = HMDTaggedLoggingCreateDictionary();
    uint64_t v44 = objc_msgSend(v36, "initWithTag:data:", v37, v43, v79, v39, v40, v99, v95, v34, v93, v41, v90, v42);
    id v6 = v100;
    __int16 v45 = [v100 tagProcessorList];
    [v35 submitTaggedEvent:v44 processorList:v45];

    id v9 = v102;
    __int16 v46 = [v102 chipAccessorySetupPayload];
    v96 = v46;
    if (v46)
    {
      uint64_t v47 = [v46 chipSetupPayload];
      uint64_t v48 = (void *)MEMORY[0x230FBD990]();
      v49 = v87;
      v50 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        v82 = HMFGetLogIdentifier();
        uint64_t v51 = *MEMORY[0x263F497A8];
        uint64_t v81 = [v47 vendorID];
        uint64_t v52 = *MEMORY[0x263F49798];
        v84 = v48;
        id v53 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v47, "supportsSoftAP"));
        uint64_t v54 = *MEMORY[0x263F49758];
        objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v47, "hasShortDiscriminator"));
        id v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138545410;
        v120 = v82;
        __int16 v121 = 2114;
        v122 = v37;
        __int16 v123 = 2112;
        v124 = @"Accessory Info";
        __int16 v125 = 2114;
        uint64_t v88 = v52;
        uint64_t v91 = v51;
        uint64_t v126 = v51;
        __int16 v127 = 2112;
        v128 = v81;
        __int16 v129 = 2114;
        uint64_t v130 = v52;
        __int16 v131 = 2112;
        v132 = v53;
        __int16 v133 = 2114;
        uint64_t v134 = v54;
        __int16 v135 = 2112;
        v136 = v55;
        _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x5Cu);

        uint64_t v48 = v84;
      }
      else
      {
        uint64_t v91 = *MEMORY[0x263F497A8];
        uint64_t v88 = *MEMORY[0x263F49798];
        uint64_t v54 = *MEMORY[0x263F49758];
      }

      __int16 v60 = [MEMORY[0x263F499E0] sharedInstance];
      id v61 = objc_alloc(MEMORY[0x263F499F0]);
      __int16 v62 = [v47 vendorID];
      uint64_t v63 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v47, "supportsSoftAP"));
      __int16 v64 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v47, "hasShortDiscriminator"));
      uint64_t v65 = HMDTaggedLoggingCreateDictionary();
      __int16 v66 = objc_msgSend(v61, "initWithTag:data:", v37, v65, v91, v62, v88, v63, v54, v64);
      v67 = [v100 tagProcessorList];
      [v60 submitTaggedEvent:v66 processorList:v67];

      uint64_t v68 = objc_alloc_init(HMDAccessorySetupCoordinatorStagingRequest);
      BOOL v69 = [MEMORY[0x263EFF980] array];
      [(HMDAccessorySetupCoordinatorStagingRequest *)v68 setPendingResponsePayloads:v69];

      id v4 = v97;
      [(HMDAccessorySetupCoordinatorStagingRequest *)v68 setPendingRequestMessage:v97];
      v70 = [(HMDAccessorySetupCoordinator *)v49 stagingRequestsByUUID];
      v71 = [(HMDAccessorySetupCoordinatorStagingRequest *)v68 UUID];
      [v70 setObject:v68 forKeyedSubscript:v71];

      v72 = (void *)MEMORY[0x230FBD990]();
      v73 = v49;
      v74 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
      {
        v75 = HMFGetLogIdentifier();
        id v76 = [(HMDAccessorySetupCoordinatorStagingRequest *)v68 UUID];
        *(_DWORD *)buf = 138543874;
        v120 = v75;
        __int16 v121 = 2112;
        v122 = v47;
        __int16 v123 = 2112;
        v124 = v76;
        _os_log_impl(&dword_22F52A000, v74, OS_LOG_TYPE_INFO, "%{public}@Handling stage CHIP accessory pairing in steps message with setup payload: %@, request UUID: %@", buf, 0x20u);
      }
      v77 = [(HMDAccessorySetupCoordinator *)v73 chipAccessoryServerBrowser];
      v116[0] = MEMORY[0x263EF8330];
      v116[1] = 3221225472;
      v116[2] = __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke;
      v116[3] = &unk_264A27898;
      v116[4] = v73;
      v117 = v68;
      id v118 = v100;
      v113[0] = MEMORY[0x263EF8330];
      v113[1] = 3221225472;
      v113[2] = __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_3;
      v113[3] = &unk_264A278C0;
      v113[4] = v73;
      v114 = v117;
      id v115 = v118;
      v110[0] = MEMORY[0x263EF8330];
      v110[1] = 3221225472;
      v110[2] = __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_5;
      v110[3] = &unk_264A278E8;
      v110[4] = v73;
      v111 = v114;
      id v112 = v115;
      v108[0] = MEMORY[0x263EF8330];
      v108[1] = 3221225472;
      v108[2] = __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_7;
      v108[3] = &unk_264A27910;
      v108[4] = v73;
      v109 = v111;
      v106[0] = MEMORY[0x263EF8330];
      v106[1] = 3221225472;
      v106[2] = __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_9;
      v106[3] = &unk_264A27938;
      v106[4] = v73;
      v107 = v109;
      v103[0] = MEMORY[0x263EF8330];
      v103[1] = 3221225472;
      v103[2] = __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_11;
      v103[3] = &unk_264A27960;
      v103[4] = v73;
      v104 = v107;
      id v105 = v112;
      v78 = v107;
      LOBYTE(v80) = v85;
      id v6 = v100;
      [v77 stageAccessoryServerWithSetupPayload:v47 fabricID:0 deviceCredentialHandler:v116 wifiScanResultsHandler:v113 threadScanResultsHandler:v110 readyToCancelHandler:v108 progressUpdateHandler:v106 scanningNetworks:v80 completionHandler:v103];

      id v9 = v102;
      id v18 = v99;
    }
    else
    {
      uint64_t v56 = (void *)MEMORY[0x230FBD990]();
      v57 = v87;
      __int16 v58 = HMFGetOSLogHandle();
      id v4 = v97;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        id v59 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v120 = v59;
        __int16 v121 = 2112;
        v122 = v102;
        _os_log_impl(&dword_22F52A000, v58, OS_LOG_TYPE_ERROR, "%{public}@Could not find CHIP accessory setup payload on setup accessory payload: %@", buf, 0x16u);

        id v9 = v102;
      }

      uint64_t v47 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [v97 respondWithError:v47];
      HMMLogTagActivityWithError();
      [v100 invalidate];
    }
  }
  else
  {
    __int16 v12 = (void *)MEMORY[0x230FBD990]();
    uint64_t v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      [v4 messagePayload];
      __int16 v17 = v16 = v4;
      *(_DWORD *)buf = 138543618;
      v120 = v15;
      __int16 v121 = 2112;
      v122 = v17;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not find setup accessory payload in message payload: %@", buf, 0x16u);

      id v4 = v16;
      id v9 = 0;
    }
    id v18 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v4 respondWithError:v18];
    HMMLogTagActivityWithError();
    [v6 invalidate];
  }
}

void __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_2;
  block[3] = &unk_264A2DDC0;
  v8 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v15 = v6;
  id v13 = v8;
  id v14 = *(id *)(a1 + 48);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_4;
  block[3] = &unk_264A2DDC0;
  v8 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v15 = v6;
  id v13 = v8;
  id v14 = *(id *)(a1 + 48);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_6;
  block[3] = &unk_264A2DDC0;
  v8 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v15 = v6;
  id v13 = v8;
  id v14 = *(id *)(a1 + 48);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_8;
  block[3] = &unk_264A2EE80;
  id v5 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v9 = v3;
  id v8 = v5;
  id v6 = v3;
  dispatch_async(v4, block);
}

void __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_9(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_10;
  block[3] = &unk_264A2E458;
  id v5 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  uint64_t v8 = a2;
  id v7 = v5;
  dispatch_async(v4, block);
}

void __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_11(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_12;
  block[3] = &unk_264A2E908;
  id v9 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v13 = v6;
  id v14 = v7;
  id v15 = v9;
  id v16 = *(id *)(a1 + 48);
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, block);
}

uint64_t __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleStagedPairingServer:*(void *)(a1 + 40) error:*(void *)(a1 + 48) forRequest:*(void *)(a1 + 56) activity:*(void *)(a1 + 64)];
}

uint64_t __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleStagedPairingProgressState:*(void *)(a1 + 48) forRequest:*(void *)(a1 + 40)];
}

uint64_t __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleStagedPairingReadyToCancel:*(void *)(a1 + 48) forRequest:*(void *)(a1 + 40)];
}

uint64_t __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleStagedPairingThreadNetworkScanResults:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 64) forRequest:*(void *)(a1 + 48) activity:*(void *)(a1 + 56)];
}

uint64_t __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleStagedPairingWiFiNetworkScanResults:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 64) forRequest:*(void *)(a1 + 48) activity:*(void *)(a1 + 56)];
}

uint64_t __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleStagedPairingDeviceCredential:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 64) forRequest:*(void *)(a1 + 48) activity:*(void *)(a1 + 56)];
}

- (void)handleCreateCHIPSetupAccessoryPayloadMessage:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessorySetupCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = v9;
    __int16 v32 = 2112;
    uint64_t v33 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling create CHIP setup accessory payload message payload: %@", buf, 0x16u);
  }
  id v11 = [v4 URLForKey:*MEMORY[0x263F0B630]];
  uint64_t v12 = [v4 stringForKey:*MEMORY[0x263F0B600]];
  id v13 = (void *)v12;
  if (v11)
  {
    uint64_t v27 = 0;
    id v14 = (id *)&v27;
    uint64_t v15 = [(HMDAccessorySetupCoordinator *)v7 createCHIPSetupAccessoryPayloadWithSetupPayloadURL:v11 error:&v27];
  }
  else
  {
    if (!v12)
    {
      uint64_t v21 = (void *)MEMORY[0x230FBD990]();
      uint64_t v22 = v7;
      BOOL v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        BOOL v24 = HMFGetLogIdentifier();
        int v25 = [v4 messagePayload];
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v24;
        __int16 v32 = 2112;
        uint64_t v33 = v25;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Could not find any setup information in message payload: %@", buf, 0x16u);
      }
      id v17 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
      goto LABEL_12;
    }
    uint64_t v26 = 0;
    id v14 = (id *)&v26;
    uint64_t v15 = [(HMDAccessorySetupCoordinator *)v7 _createCHIPSetupAccessoryPayloadWithSetupPayloadDecimalStringRepresentation:v12 error:&v26];
  }
  id v16 = (void *)v15;
  id v17 = *v14;
  if (!v16)
  {
LABEL_12:
    [v4 respondWithError:v17];
    goto LABEL_13;
  }
  uint64_t v28 = *MEMORY[0x263F0B618];
  id v18 = (void *)[v16 copy];
  uint64_t v19 = encodeRootObjectForIncomingXPCMessage(v18, 0);
  uint64_t v29 = v19;
  __int16 v20 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  [v4 respondWithPayload:v20];

LABEL_13:
}

- (void)stopMetricsForThirdPartyPairingWithError:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v22 = 138543618;
    BOOL v23 = v8;
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Stop metrics for 3rd party pairing, error:%@", (uint8_t *)&v22, 0x16u);
  }
  id v9 = [(HMDAccessorySetupCoordinator *)v6 metricsActivity];
  int v10 = [v9 isValid];

  if (v10)
  {
    if (v4)
    {
      id v11 = [(HMDAccessorySetupCoordinator *)v6 metricsActivity];
      HMMLogTagActivityWithError();
    }
    else
    {
      uint64_t v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = v6;
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        id v16 = (void *)*MEMORY[0x263F49790];
        int v22 = 138543874;
        BOOL v23 = v15;
        __int16 v24 = 2114;
        id v25 = v16;
        __int16 v26 = 2112;
        uint64_t v27 = @"Stop";
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\"", (uint8_t *)&v22, 0x20u);
      }
      else
      {
        id v16 = (void *)*MEMORY[0x263F49790];
      }

      id v11 = [MEMORY[0x263F499E0] sharedInstance];
      id v17 = objc_alloc(MEMORY[0x263F499F0]);
      id v18 = (void *)[v17 initWithTag:v16 data:MEMORY[0x263EFFA78]];
      uint64_t v19 = [(HMDAccessorySetupCoordinator *)v13 metricsActivity];
      __int16 v20 = [v19 tagProcessorList];
      [v11 submitTaggedEvent:v18 processorList:v20];
    }
    uint64_t v21 = [(HMDAccessorySetupCoordinator *)v6 metricsActivity];
    [v21 invalidate];
  }
}

- (void)startMetricsForThirdPartyPairing
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v23 = 138543362;
    __int16 v24 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Start metrics for 3rd party pairing", (uint8_t *)&v23, 0xCu);
  }
  uint64_t v7 = [(HMDAccessorySetupCoordinator *)v4 metricsActivity];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [(HMDAccessorySetupCoordinator *)v4 metricsActivity];
    int v10 = [v9 isValid];

    if (v10)
    {
      id v11 = [(HMDAccessorySetupCoordinator *)v4 metricsActivity];
      [v11 invalidate];
    }
  }
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"CHIP Third Party Pairing"];
  [(HMDAccessorySetupCoordinator *)v4 setMetricsActivity:v12];

  id v13 = (void *)MEMORY[0x230FBD990]();
  id v14 = v4;
  uint64_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = HMFGetLogIdentifier();
    uint64_t v17 = *MEMORY[0x263F49788];
    int v23 = 138543874;
    __int16 v24 = v16;
    __int16 v25 = 2114;
    uint64_t v26 = v17;
    __int16 v27 = 2112;
    uint64_t v28 = @"Start";
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\"", (uint8_t *)&v23, 0x20u);
  }
  else
  {
    uint64_t v17 = *MEMORY[0x263F49788];
  }

  id v18 = [MEMORY[0x263F499E0] sharedInstance];
  id v19 = objc_alloc(MEMORY[0x263F499F0]);
  __int16 v20 = (void *)[v19 initWithTag:v17 data:MEMORY[0x263EFFA78]];
  uint64_t v21 = [(HMDAccessorySetupCoordinator *)v14 metricsActivity];
  int v22 = [v21 tagProcessorList];
  [v18 submitTaggedEvent:v20 processorList:v22];
}

- (id)createSetupAccessoryPayloadWithCHIPSetupPayload:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!v6) {
    _HMFPreconditionFailure();
  }
  uint64_t v7 = v6;
  uint64_t v8 = [(HMDAccessorySetupCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(HMDAccessorySetupCoordinator *)self payloadCHIPAccessorySetupPayloadFactory];
  int v10 = ((void (**)(void, void *))v9)[2](v9, v7);

  if (v10)
  {
    id v11 = [(HMDAccessorySetupCoordinator *)self _setupPayloadWithCHIPSetupPayload:v10 setupPayloadURL:0];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v17 = 138543618;
      id v18 = v15;
      __int16 v19 = 2112;
      __int16 v20 = v7;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to create CHIP accessory setup payload from setup payload %@", (uint8_t *)&v17, 0x16u);
    }
    if (a4)
    {
      [MEMORY[0x263F087E8] hmErrorWithCode:3];
      id v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = 0;
    }
  }

  return v11;
}

- (id)createCHIPSetupAccessoryPayloadWithSetupPayloadURL:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!v6) {
    _HMFPreconditionFailure();
  }
  uint64_t v7 = v6;
  uint64_t v8 = [(HMDAccessorySetupCoordinator *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v7 absoluteString];
  int v10 = [v9 stringByRemovingPercentEncoding];

  id v11 = [(HMDAccessorySetupCoordinator *)self urlStringCHIPAccessorySetupPayloadFactory];
  uint64_t v12 = ((void (**)(void, void *))v11)[2](v11, v10);

  if (v12)
  {
    id v13 = [(HMDAccessorySetupCoordinator *)self _setupPayloadWithCHIPSetupPayload:v12 setupPayloadURL:v7];
  }
  else
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    uint64_t v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = HMFGetLogIdentifier();
      int v19 = 138543618;
      __int16 v20 = v17;
      __int16 v21 = 2112;
      int v22 = v10;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to create CHIP accessory setup payload from setup payload URL string: %@", (uint8_t *)&v19, 0x16u);
    }
    if (a4)
    {
      [MEMORY[0x263F087E8] hmErrorWithCode:3];
      id v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v13 = 0;
    }
  }

  return v13;
}

- (void)configure
{
  v39[1] = *MEMORY[0x263EF8340];
  id v3 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  id v4 = [(HMDAccessorySetupCoordinator *)self messageDispatcher];
  uint64_t v5 = *MEMORY[0x263F0B5E8];
  v39[0] = v3;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:1];
  [v4 registerForMessage:v5 receiver:self policies:v6 selector:sel_handleCreateCHIPSetupAccessoryPayloadMessage_];

  uint64_t v7 = [(HMDAccessorySetupCoordinator *)self messageDispatcher];
  uint64_t v8 = *MEMORY[0x263F0B680];
  uint64_t v38 = v3;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v38 count:1];
  [v7 registerForMessage:v8 receiver:self policies:v9 selector:sel_handleStageCHIPAccessoryPairingInStepsMessage_];

  int v10 = [(HMDAccessorySetupCoordinator *)self messageDispatcher];
  uint64_t v11 = *MEMORY[0x263F0B5E0];
  int v37 = v3;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
  [v10 registerForMessage:v11 receiver:self policies:v12 selector:sel_handleConfirmDeviceCredentialMessage_];

  id v13 = [(HMDAccessorySetupCoordinator *)self messageDispatcher];
  uint64_t v14 = *MEMORY[0x263F0B668];
  id v36 = v3;
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
  [v13 registerForMessage:v14 receiver:self policies:v15 selector:sel_handleRejectDeviceCredentialMessage_];

  id v16 = [(HMDAccessorySetupCoordinator *)self messageDispatcher];
  uint64_t v17 = *MEMORY[0x263F0B670];
  id v35 = v3;
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
  [v16 registerForMessage:v17 receiver:self policies:v18 selector:sel_handleSelectThreadNetworkAssociationMessage_];

  int v19 = [(HMDAccessorySetupCoordinator *)self messageDispatcher];
  uint64_t v20 = *MEMORY[0x263F0B678];
  uint64_t v34 = v3;
  __int16 v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
  [v19 registerForMessage:v20 receiver:self policies:v21 selector:sel_handleSelectWiFiNetworkAssociationMessage_];

  int v22 = [(HMDAccessorySetupCoordinator *)self messageDispatcher];
  uint64_t v23 = *MEMORY[0x263F0B5D8];
  uint64_t v33 = v3;
  __int16 v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
  [v22 registerForMessage:v23 receiver:self policies:v24 selector:sel_handleCancelStagingMessage_];

  __int16 v25 = [(HMDAccessorySetupCoordinator *)self messageDispatcher];
  uint64_t v26 = *MEMORY[0x263F0B5F0];
  __int16 v32 = v3;
  __int16 v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
  [v25 registerForMessage:v26 receiver:self policies:v27 selector:sel_handleCreateCHIPSetupPayloadMessage_];

  uint64_t v28 = [(HMDAccessorySetupCoordinator *)self messageDispatcher];
  uint64_t v29 = *MEMORY[0x263F0B5D0];
  uint64_t v31 = v3;
  uint64_t v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
  [v28 registerForMessage:v29 receiver:self policies:v30 selector:sel_handleCancelStagedCHIPAccessoryPairingMessage_];
}

- (HMDAccessorySetupCoordinator)initWithWorkQueue:(id)a3 messageDispatcher:(id)a4 chipAccessoryServerBrowser:(id)a5 chipDataSource:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  uint64_t v15 = v14;
  if (!v14)
  {
LABEL_11:
    uint64_t v25 = _HMFPreconditionFailure();
    return (HMDAccessorySetupCoordinator *)__110__HMDAccessorySetupCoordinator_initWithWorkQueue_messageDispatcher_chipAccessoryServerBrowser_chipDataSource___block_invoke_3(v25);
  }
  v26.receiver = self;
  v26.super_class = (Class)HMDAccessorySetupCoordinator;
  id v16 = [(HMDAccessorySetupCoordinator *)&v26 init];
  uint64_t v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_workQueue, a3);
    objc_storeStrong((id *)&v17->_messageDispatcher, a4);
    objc_storeStrong((id *)&v17->_chipAccessoryServerBrowser, a5);
    objc_storeStrong((id *)&v17->_chipDataSource, a6);
    uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
    stagingRequestsByUUID = v17->_stagingRequestsByUUID;
    v17->_stagingRequestsByUUID = (NSMutableDictionary *)v18;

    currentBundleIdentifier = v17->_currentBundleIdentifier;
    v17->_currentBundleIdentifier = 0;

    id urlStringCHIPAccessorySetupPayloadFactory = v17->_urlStringCHIPAccessorySetupPayloadFactory;
    v17->_id urlStringCHIPAccessorySetupPayloadFactory = &__block_literal_global_215490;

    id decimalStringRepresentationCHIPAccessorySetupPayloadFactory = v17->_decimalStringRepresentationCHIPAccessorySetupPayloadFactory;
    v17->_id decimalStringRepresentationCHIPAccessorySetupPayloadFactory = &__block_literal_global_67_215491;

    id payloadCHIPAccessorySetupPayloadFactory = v17->_payloadCHIPAccessorySetupPayloadFactory;
    v17->_id payloadCHIPAccessorySetupPayloadFactory = &__block_literal_global_70_215492;
  }
  return v17;
}

id __110__HMDAccessorySetupCoordinator_initWithWorkQueue_messageDispatcher_chipAccessoryServerBrowser_chipDataSource___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F497D8];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithCHIPSetupPayload:v3];

  return v4;
}

id __110__HMDAccessorySetupCoordinator_initWithWorkQueue_messageDispatcher_chipAccessoryServerBrowser_chipDataSource___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F497D8];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithSetupCodeString:v3];

  return v4;
}

id __110__HMDAccessorySetupCoordinator_initWithWorkQueue_messageDispatcher_chipAccessoryServerBrowser_chipDataSource___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F497D8];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithSetupPayloadString:v3];

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t75_215511 != -1) {
    dispatch_once(&logCategory__hmf_once_t75_215511, &__block_literal_global_182_215512);
  }
  v2 = (void *)logCategory__hmf_once_v76_215513;
  return v2;
}

void __43__HMDAccessorySetupCoordinator_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v76_215513;
  logCategory__hmf_once_v76_215513 = v0;
}

@end