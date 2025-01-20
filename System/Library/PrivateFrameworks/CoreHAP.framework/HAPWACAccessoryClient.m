@interface HAPWACAccessoryClient
+ (id)logCategory;
- (BOOL)metricSubmitted;
- (HAPAccessoryServer)server;
- (HAPEasyConfigDevice)ezConfigDevice;
- (HAPWACAccessory)hapWACAccessory;
- (HAPWACAccessoryBrowser)browser;
- (HAPWACAccessoryClient)init;
- (HAPWACAccessoryClient)initWithWACAccessory:(id)a3 server:(id)a4 browser:(id)a5 compatible2Pt4Networks:(id)a6;
- (HAPWACAccessoryClientDelegate)clientDelegate;
- (NSDate)setupCodeRequestTime;
- (NSDictionary)compatiblePrefixedNetwork;
- (NSDictionary)currentNetworkInfo;
- (NSMutableSet)compatible2Pt4Networks;
- (OS_dispatch_queue)workQueue;
- (double)configurationLatency;
- (double)joinLatency;
- (double)postConfigDiscoveryTime;
- (double)preConfigDiscoveryTime;
- (double)restoreLatency;
- (double)setupCodeDelay;
- (id)_findCompatiblePrefixedNetworks;
- (id)_setupEasyConfigWithDeviceInfo:(id)a3;
- (id)completionHandler;
- (id)continuePairingWithSetupCode:(id)a3;
- (id)joinAccessoryNetworkWithCompletion:(id)a3;
- (id)logIdentifier;
- (id)performEasyConfigWithParingPrompt:(void *)a3 performPairSetup:(BOOL)a4 isSplit:(BOOL)a5 pairingRequest:(id)a6 completion:(id)a7;
- (id)restartEasyConfigBlock;
- (id)restoreNetworkWithCompletion:(id)a3;
- (unint64_t)restartPairingCount;
- (unint64_t)retryCount;
- (unint64_t)state;
- (void)_callJoinCompletion:(id)a3 withError:(id)a4;
- (void)_callRestoreCompletion:(id)a3 withError:(id)a4;
- (void)_continuePairingWithSetupCode:(id)a3;
- (void)_joinAccessory:(id)a3 completion:(id)a4;
- (void)_joinAccessoryNetworkWithCompletion:(id)a3;
- (void)_joinCompleteWithStatus:(int)a3;
- (void)_performEasyConfigWithPairingPrompt:(void *)a3 performPairSetup:(BOOL)a4 isSplit:(BOOL)a5 pairingRequest:(id)a6 completion:(id)a7;
- (void)_performPostConfig;
- (void)_reportProgress:(unint64_t)a3;
- (void)_restoreNetworkAndReportError:(id)a3 withCompletion:(id)a4;
- (void)_restoreNetworkWithCompletion:(id)a3;
- (void)dumpStatsWithError:(id)a3;
- (void)registerClientDelegate:(id)a3;
- (void)restart;
- (void)setCompatiblePrefixedNetwork:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setConfigurationLatency:(double)a3;
- (void)setCurrentNetworkInfo:(id)a3;
- (void)setEzConfigDevice:(id)a3;
- (void)setJoinLatency:(double)a3;
- (void)setMetricSubmitted:(BOOL)a3;
- (void)setPostConfigDiscoveryTime:(double)a3;
- (void)setPreConfigDiscoveryTime:(double)a3;
- (void)setRestartEasyConfigBlock:(id)a3;
- (void)setRestartPairingCount:(unint64_t)a3;
- (void)setRestoreLatency:(double)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)setSetupCodeDelay:(double)a3;
- (void)setSetupCodeRequestTime:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)stopEasyConfig;
@end

@implementation HAPWACAccessoryClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupCodeRequestTime, 0);
  objc_storeStrong(&self->_restartEasyConfigBlock, 0);
  objc_destroyWeak((id *)&self->_browser);
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_ezConfigDevice, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_compatiblePrefixedNetwork, 0);
  objc_storeStrong((id *)&self->_currentNetworkInfo, 0);
  objc_storeStrong((id *)&self->_compatible2Pt4Networks, 0);
  objc_storeStrong((id *)&self->_hapWACAccessory, 0);

  objc_destroyWeak((id *)&self->_clientDelegate);
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setSetupCodeRequestTime:(id)a3
{
}

- (NSDate)setupCodeRequestTime
{
  return self->_setupCodeRequestTime;
}

- (void)setSetupCodeDelay:(double)a3
{
  self->_setupCodeDelay = a3;
}

- (double)setupCodeDelay
{
  return self->_setupCodeDelay;
}

- (void)setPostConfigDiscoveryTime:(double)a3
{
  self->_postConfigDiscoveryTime = a3;
}

- (double)postConfigDiscoveryTime
{
  return self->_postConfigDiscoveryTime;
}

- (void)setPreConfigDiscoveryTime:(double)a3
{
  self->_preConfigDiscoveryTime = a3;
}

- (double)preConfigDiscoveryTime
{
  return self->_preConfigDiscoveryTime;
}

- (void)setConfigurationLatency:(double)a3
{
  self->_configurationLatency = a3;
}

- (double)configurationLatency
{
  return self->_configurationLatency;
}

- (void)setRestoreLatency:(double)a3
{
  self->_restoreLatency = a3;
}

- (double)restoreLatency
{
  return self->_restoreLatency;
}

- (void)setJoinLatency:(double)a3
{
  self->_joinLatency = a3;
}

- (double)joinLatency
{
  return self->_joinLatency;
}

- (void)setMetricSubmitted:(BOOL)a3
{
  self->_metricSubmitted = a3;
}

- (BOOL)metricSubmitted
{
  return self->_metricSubmitted;
}

- (void)setRestartEasyConfigBlock:(id)a3
{
}

- (id)restartEasyConfigBlock
{
  return self->_restartEasyConfigBlock;
}

- (void)setRestartPairingCount:(unint64_t)a3
{
  self->_restartPairingCount = a3;
}

- (unint64_t)restartPairingCount
{
  return self->_restartPairingCount;
}

- (HAPWACAccessoryBrowser)browser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browser);

  return (HAPWACAccessoryBrowser *)WeakRetained;
}

- (HAPAccessoryServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);

  return (HAPAccessoryServer *)WeakRetained;
}

- (void)setEzConfigDevice:(id)a3
{
}

- (HAPEasyConfigDevice)ezConfigDevice
{
  return self->_ezConfigDevice;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setCompatiblePrefixedNetwork:(id)a3
{
}

- (NSDictionary)compatiblePrefixedNetwork
{
  return self->_compatiblePrefixedNetwork;
}

- (void)setCurrentNetworkInfo:(id)a3
{
}

- (NSDictionary)currentNetworkInfo
{
  return self->_currentNetworkInfo;
}

- (NSMutableSet)compatible2Pt4Networks
{
  return self->_compatible2Pt4Networks;
}

- (HAPWACAccessory)hapWACAccessory
{
  return self->_hapWACAccessory;
}

- (id)logIdentifier
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HAPWACAccessoryClient state](self, "state"));
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)restart
{
  v3 = [(HAPWACAccessoryClient *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__HAPWACAccessoryClient_restart__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = self;
  dispatch_async(v3, block);
}

void __32__HAPWACAccessoryClient_restart__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) restartEasyConfigBlock];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) ezConfigDevice];

    if (v3)
    {
      uint64_t v4 = (void *)MEMORY[0x1D944E080]();
      id v5 = *(id *)(a1 + 32);
      v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v7 = HMFGetLogIdentifier();
        int v13 = 138543362;
        v14 = v7;
        _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Restarting ezConfig", (uint8_t *)&v13, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "setRestartPairingCount:", objc_msgSend(*(id *)(a1 + 32), "restartPairingCount") + 1);
      v8 = [*(id *)(a1 + 32) restartEasyConfigBlock];
      v8[2]();
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1D944E080]();
    id v10 = *(id *)(a1 + 32);
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%{public}@Invalid state, must have a block here", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)stopEasyConfig
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [(HAPWACAccessoryClient *)self ezConfigDevice];

  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1D944E080]();
    id v5 = self;
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = HMFGetLogIdentifier();
      int v9 = 138543362;
      id v10 = v7;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Stopping ezConfig", (uint8_t *)&v9, 0xCu);
    }
    v8 = [(HAPWACAccessoryClient *)v5 ezConfigDevice];
    [v8 stop];
  }
}

- (void)_continuePairingWithSetupCode:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPWACAccessoryClient *)self ezConfigDevice];
  [v5 trySetupCode:v4];
}

- (id)continuePairingWithSetupCode:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HAPWACAccessoryClient *)self workQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__HAPWACAccessoryClient_continuePairingWithSetupCode___block_invoke;
    v8[3] = &unk_1E69F46E0;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(v5, v8);

    v6 = 0;
  }
  else
  {
    v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:9 userInfo:0];
  }

  return v6;
}

uint64_t __54__HAPWACAccessoryClient_continuePairingWithSetupCode___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setState:7];
  v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [*(id *)(a1 + 32) setupCodeRequestTime];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;
  [v2 setupCodeDelay];
  [v2 setSetupCodeDelay:v6 + v7];

  v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);

  return [v8 _continuePairingWithSetupCode:v9];
}

- (void)_performPostConfig
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__HAPWACAccessoryClient__performPostConfig__block_invoke;
  v4[3] = &unk_1E69F4330;
  v4[4] = self;
  __43__HAPWACAccessoryClient__performPostConfig__block_invoke((uint64_t)v4);
  [(HAPWACAccessoryClient *)self setState:8];
  v3 = [(HAPWACAccessoryClient *)self ezConfigDevice];
  [v3 resumePostConfig];
}

void __43__HAPWACAccessoryClient__performPostConfig__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) server];
  id v4 = [v2 pairingActivity];

  if (v4) {
    id v3 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "state"));
  }
}

- (void)_restoreNetworkAndReportError:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(HAPWACAccessoryClient *)self state];
  [(HAPWACAccessoryClient *)self setState:0];
  uint64_t v9 = mapUnderlyingErrorToHAPError(v7);

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__HAPWACAccessoryClient__restoreNetworkAndReportError_withCompletion___block_invoke;
  v13[3] = &unk_1E69F1268;
  id v14 = v9;
  id v15 = v6;
  unint64_t v16 = v8;
  id v10 = v9;
  id v11 = v6;
  id v12 = [(HAPWACAccessoryClient *)self restoreNetworkWithCompletion:v13];
}

uint64_t __70__HAPWACAccessoryClient__restoreNetworkAndReportError_withCompletion___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

- (void)_performEasyConfigWithPairingPrompt:(void *)a3 performPairSetup:(BOOL)a4 isSplit:(BOOL)a5 pairingRequest:(id)a6 completion:(id)a7
{
  BOOL v100 = a5;
  BOOL v8 = a4;
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  id v102 = a6;
  id v11 = a7;
  objc_initWeak(&location, self);
  v122[0] = 0;
  v122[1] = v122;
  v122[2] = 0x3032000000;
  v122[3] = __Block_byref_object_copy__5773;
  v122[4] = __Block_byref_object_dispose__5774;
  id v123 = 0;
  v120[0] = 0;
  v120[1] = v120;
  v120[2] = 0x3032000000;
  v120[3] = __Block_byref_object_copy__5773;
  v120[4] = __Block_byref_object_dispose__5774;
  id v121 = 0;
  v117[0] = MEMORY[0x1E4F143A8];
  v117[1] = 3221225472;
  v117[2] = __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke;
  v117[3] = &unk_1E69F11A0;
  objc_copyWeak(&v119, &location);
  id v101 = v11;
  id v118 = v101;
  v103 = (void (**)(void, void, void))MEMORY[0x1D944E2D0](v117);
  id v12 = (void *)MEMORY[0x1D944E080]();
  int v13 = self;
  HMFGetOSLogHandle();
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = HMFBooleanToString();
    *(_DWORD *)buf = 138544130;
    id v134 = v15;
    __int16 v135 = 2112;
    id v136 = v16;
    __int16 v137 = 2112;
    v138 = v17;
    __int16 v139 = 2112;
    id v140 = v102;
    _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Performing easy config, setupCodeHandler: %@ performPairSetup: %@ pairingRequest: %@", buf, 0x2Au);
  }
  v18 = [(HAPWACAccessoryClient *)v13 hapWACAccessory];
  v19 = [v18 name];
  if (!v19) {
    goto LABEL_10;
  }
  v20 = [(HAPWACAccessoryClient *)v13 hapWACAccessory];
  v21 = [v20 deviceId];
  if (!v21)
  {

LABEL_10:
    goto LABEL_11;
  }
  v22 = [(HAPWACAccessoryClient *)v13 currentNetworkInfo];
  v23 = [v22 objectForKeyedSubscript:@"ssid"];
  BOOL v24 = v23 == 0;

  if (!v24)
  {
    v111[0] = MEMORY[0x1E4F143A8];
    v111[1] = 3221225472;
    v111[2] = __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_107;
    v111[3] = &unk_1E69F11C8;
    objc_copyWeak(v114, &location);
    v114[1] = a3;
    BOOL v115 = v8;
    BOOL v116 = v100;
    id v25 = v102;
    id v112 = v25;
    id v113 = v101;
    [(HAPWACAccessoryClient *)v13 setRestartEasyConfigBlock:v111];
    if (a3 && v8)
    {
      v131[0] = *MEMORY[0x1E4F5FBF0];
      v26 = [(HAPWACAccessoryClient *)v13 hapWACAccessory];
      v27 = [v26 deviceId];
      uint64_t v28 = *MEMORY[0x1E4F5FBF8];
      v132[0] = v27;
      v132[1] = &unk_1F2C80A18;
      uint64_t v29 = *MEMORY[0x1E4F5FBE0];
      v131[1] = v28;
      v131[2] = v29;
      v132[2] = MEMORY[0x1E4F1CC38];
      v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v132 forKeys:v131 count:3];

      v31 = [(HAPWACAccessoryClient *)v13 _setupEasyConfigWithDeviceInfo:v30];
      [(HAPWACAccessoryClient *)v13 setEzConfigDevice:v31];

      v32 = [(HAPWACAccessoryClient *)v13 ezConfigDevice];
      v109[0] = MEMORY[0x1E4F143A8];
      v109[1] = 3221225472;
      v109[2] = __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_109;
      v109[3] = &unk_1E69F11F0;
      objc_copyWeak(v110, &location);
      v110[1] = a3;
      [v32 setPromptForSetupCodeHandler:v109];

      objc_destroyWeak(v110);
    }
    else
    {
      if (v8)
      {
        v129[0] = *MEMORY[0x1E4F5FBF0];
        v44 = [(HAPWACAccessoryClient *)v13 hapWACAccessory];
        v45 = [v44 deviceId];
        v129[1] = *MEMORY[0x1E4F5FBF8];
        v130[0] = v45;
        v130[1] = &unk_1F2C80A30;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v130 forKeys:v129 count:2];
      }
      else
      {
        v127[0] = *MEMORY[0x1E4F5FBF0];
        v44 = [(HAPWACAccessoryClient *)v13 hapWACAccessory];
        v45 = [v44 deviceId];
        uint64_t v48 = *MEMORY[0x1E4F5FBF8];
        v128[0] = v45;
        v128[1] = &unk_1F2C80A18;
        uint64_t v49 = *MEMORY[0x1E4F5FBE0];
        v127[1] = v48;
        v127[2] = v49;
        v128[2] = MEMORY[0x1E4F1CC38];
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v128 forKeys:v127 count:3];
      v30 = };

      v46 = [(HAPWACAccessoryClient *)v13 _setupEasyConfigWithDeviceInfo:v30];
      [(HAPWACAccessoryClient *)v13 setEzConfigDevice:v46];

      v47 = [(HAPWACAccessoryClient *)v13 ezConfigDevice];
      [v47 setSkipPairSetup:1];
    }
    uint64_t v125 = *MEMORY[0x1E4F5FC00];
    v50 = [(HAPWACAccessoryClient *)v13 hapWACAccessory];
    v51 = [v50 name];
    v126 = v51;
    v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v126 forKeys:&v125 count:1];
    v53 = (void *)[v52 mutableCopy];

    v54 = [v25 ssid];

    if (v54)
    {
      v55 = [v25 ssid];
      uint64_t v56 = *MEMORY[0x1E4F5FC18];
      [v53 setObject:v55 forKeyedSubscript:*MEMORY[0x1E4F5FC18]];
    }
    else
    {
      v57 = [(HAPWACAccessoryClient *)v13 compatiblePrefixedNetwork];
      v58 = [v57 objectForKeyedSubscript:@"ssid"];

      if (v58) {
        [(HAPWACAccessoryClient *)v13 compatiblePrefixedNetwork];
      }
      else {
      v55 = [(HAPWACAccessoryClient *)v13 currentNetworkInfo];
      }
      v59 = [v55 objectForKeyedSubscript:@"ssid"];
      uint64_t v56 = *MEMORY[0x1E4F5FC18];
      [v53 setObject:v59 forKeyedSubscript:*MEMORY[0x1E4F5FC18]];
    }
    v60 = [v25 psk];

    if (v60)
    {
      v61 = [v25 psk];
      [v53 setObject:v61 forKeyedSubscript:*MEMORY[0x1E4F5FC10]];
LABEL_32:

      goto LABEL_33;
    }
    v62 = [(HAPWACAccessoryClient *)v13 compatiblePrefixedNetwork];
    v63 = [v62 objectForKeyedSubscript:@"ssid"];

    if (v63)
    {
      v64 = [(HAPWACAccessoryClient *)v13 compatiblePrefixedNetwork];
      v65 = [v64 objectForKeyedSubscript:@"password"];

      if (v65)
      {
        v61 = [(HAPWACAccessoryClient *)v13 compatiblePrefixedNetwork];
        v66 = [v61 objectForKeyedSubscript:@"password"];
        [v53 setObject:v66 forKeyedSubscript:*MEMORY[0x1E4F5FC10]];
LABEL_31:

        goto LABEL_32;
      }
    }
    else
    {
      v67 = [(HAPWACAccessoryClient *)v13 currentNetworkInfo];
      v68 = [v67 objectForKeyedSubscript:@"password"];

      if (v68)
      {
        v61 = [(HAPWACAccessoryClient *)v13 currentNetworkInfo];
        v66 = [v61 objectForKeyedSubscript:@"password"];
        [v53 setObject:v66 forKeyedSubscript:*MEMORY[0x1E4F5FC10]];
        goto LABEL_31;
      }
    }
LABEL_33:
    v69 = (void *)MEMORY[0x1D944E080]();
    v70 = v13;
    HMFGetOSLogHandle();
    v71 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v72 = (id)objc_claimAutoreleasedReturnValue();
      v73 = [v53 objectForKeyedSubscript:v56];
      *(_DWORD *)buf = 138543618;
      id v134 = v72;
      __int16 v135 = 2112;
      id v136 = v73;
      _os_log_impl(&dword_1D4758000, v71, OS_LOG_TYPE_DEBUG, "%{public}@Configuring to SSID: %@", buf, 0x16u);
    }
    v74 = [v25 isoCountryCode];

    if (v74)
    {
      v75 = (void *)MEMORY[0x1D944E080]();
      v76 = v70;
      HMFGetOSLogHandle();
      v77 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        id v78 = (id)objc_claimAutoreleasedReturnValue();
        v79 = [v25 isoCountryCode];
        *(_DWORD *)buf = 138543618;
        id v134 = v78;
        __int16 v135 = 2112;
        id v136 = v79;
        _os_log_impl(&dword_1D4758000, v77, OS_LOG_TYPE_DEBUG, "%{public}@Adding country code: %@", buf, 0x16u);
      }
      v80 = [v25 isoCountryCode];
      [v53 setObject:v80 forKeyedSubscript:*MEMORY[0x1E4F5FBE8]];
    }
    v81 = [(HAPWACAccessoryClient *)v70 ezConfigDevice];

    if (v81)
    {
      v82 = [(HAPWACAccessoryClient *)v70 restartPairingCount];
      v83 = [(HAPWACAccessoryClient *)v70 ezConfigDevice];
      v104[0] = MEMORY[0x1E4F143A8];
      v104[1] = 3221225472;
      v104[2] = __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_116;
      v104[3] = &unk_1E69F1240;
      objc_copyWeak(v108, &location);
      v108[1] = v82;
      v105 = v103;
      v106 = v122;
      v107 = v120;
      [v83 setProgressHandler:v104];

      v84 = [(HAPWACAccessoryClient *)v70 ezConfigDevice];
      [v84 setConfiguration:v53];

      v85 = [(HAPWACAccessoryClient *)v70 ezConfigDevice];
      [v85 setPairSetupFlags:0];

      v86 = [(HAPWACAccessoryClient *)v70 hapWACAccessory];
      LODWORD(v82) = [v86 supportsTokenAuth];

      if (v82)
      {
        v87 = [(HAPWACAccessoryClient *)v70 ezConfigDevice];
        objc_msgSend(v87, "setPairSetupFlags:", objc_msgSend(v87, "pairSetupFlags") | 0x8000);
      }
      else
      {
        v95 = [(HAPWACAccessoryClient *)v70 hapWACAccessory];
        int v96 = [v95 supportsCertAuth];

        v87 = [(HAPWACAccessoryClient *)v70 ezConfigDevice];
        if (v96) {
          objc_msgSend(v87, "setPairSetupFlags:", objc_msgSend(v87, "pairSetupFlags") | 0x4001);
        }
        else {
          [v87 setPairSetupFlags:1];
        }
      }

      if (v100)
      {
        v97 = [(HAPWACAccessoryClient *)v70 ezConfigDevice];
        objc_msgSend(v97, "setPairSetupFlags:", objc_msgSend(v97, "pairSetupFlags") | 0x1000000);
      }
      v98 = [(HAPWACAccessoryClient *)v70 ezConfigDevice];
      [v98 setPausesAfterApply:1];

      v99 = [(HAPWACAccessoryClient *)v70 ezConfigDevice];
      [v99 start];

      objc_destroyWeak(v108);
    }
    else
    {
      v88 = (void *)MEMORY[0x1D944E080]();
      v89 = v70;
      HMFGetOSLogHandle();
      v90 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v91 = (id)objc_claimAutoreleasedReturnValue();
        v92 = [(HAPWACAccessoryClient *)v89 hapWACAccessory];
        v93 = [v92 rawScanResult];
        *(_DWORD *)buf = 138543618;
        id v134 = v91;
        __int16 v135 = 2112;
        id v136 = v93;
        _os_log_impl(&dword_1D4758000, v90, OS_LOG_TYPE_ERROR, "%{public}@Failed instantiating easy config with scan result: %@", buf, 0x16u);
      }
      v94 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:19 userInfo:0];
      ((void (**)(void, void *, unint64_t))v103)[2](v103, v94, [(HAPWACAccessoryClient *)v89 state]);
    }
    objc_destroyWeak(v114);
    goto LABEL_52;
  }
LABEL_11:
  v33 = (void *)MEMORY[0x1D944E080]();
  v34 = v13;
  HMFGetOSLogHandle();
  v35 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    id v36 = (id)objc_claimAutoreleasedReturnValue();
    v37 = [(HAPWACAccessoryClient *)v34 hapWACAccessory];
    v38 = [v37 name];
    v39 = [(HAPWACAccessoryClient *)v34 hapWACAccessory];
    v40 = [v39 deviceId];
    v41 = [(HAPWACAccessoryClient *)v34 currentNetworkInfo];
    v42 = [v41 objectForKeyedSubscript:@"ssid"];
    *(_DWORD *)buf = 138544130;
    id v134 = v36;
    __int16 v135 = 2112;
    id v136 = v38;
    __int16 v137 = 2112;
    v138 = v40;
    __int16 v139 = 2112;
    id v140 = v42;
    _os_log_impl(&dword_1D4758000, v35, OS_LOG_TYPE_ERROR, "%{public}@Invalid nil param(s), name: %@, deviceId: %@, ssid: %@", buf, 0x2Au);
  }
  v43 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:9 userInfo:0];
  ((void (**)(void, void *, unint64_t))v103)[2](v103, v43, [(HAPWACAccessoryClient *)v34 state]);

LABEL_52:
  objc_destroyWeak(&v119);
  _Block_object_dispose(v120, 8);

  _Block_object_dispose(v122, 8);
  objc_destroyWeak(&location);
}

void __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = [v5 userInfo];
    id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = v9;

    if (!v10) {
      id v8 = v5;
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_2;
    v13[3] = &unk_1E69F2088;
    id v14 = v8;
    uint64_t v15 = a3;
    void v13[4] = WeakRetained;
    id v11 = v8;
    __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_2((uint64_t)v13);
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:20];

    id v5 = (id)v12;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_107(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained ezConfigDevice];
  [v2 stop];

  [WeakRetained _performEasyConfigWithPairingPrompt:*(void *)(a1 + 56) performPairSetup:*(unsigned __int8 *)(a1 + 64) isSplit:*(unsigned __int8 *)(a1 + 65) pairingRequest:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

uint64_t __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_109(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setState:6];
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    [v7 setSetupCodeRequestTime:v8];

    uint64_t v9 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 40);
    id v10 = [v7 server];
    v9(a2, a3, v10);

    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = 4294960556;
  }

  return v11;
}

void __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_116(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = [WeakRetained workQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_2_117;
    v9[3] = &unk_1E69F1218;
    v13[1] = *(id *)(a1 + 64);
    v9[4] = v7;
    int v14 = a2;
    id v10 = v5;
    id v11 = *(id *)(a1 + 32);
    long long v12 = *(_OWORD *)(a1 + 40);
    objc_copyWeak(v13, (id *)(a1 + 56));
    dispatch_async(v8, v9);

    objc_destroyWeak(v13);
  }
}

void __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_2_117(uint64_t a1)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 80);
  BOOL v3 = v2 == [*(id *)(a1 + 32) restartPairingCount];
  id v4 = (void *)MEMORY[0x1D944E080]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (!v7) {
      goto LABEL_28;
    }
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v9 = (void *)v8;
    int v10 = *(_DWORD *)(a1 + 88);
    if (v10 <= 29)
    {
      id v11 = "Start";
      switch(v10)
      {
        case 1:
          goto LABEL_27;
        case 2:
          id v11 = "Final";
          break;
        case 3:
          id v11 = "Error";
          break;
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
          goto LABEL_19;
        case 10:
          id v11 = "Search for pre-config device";
          break;
        default:
          if (v10 != 20) {
            goto LABEL_19;
          }
          id v11 = "Authenticating pre-config device";
          break;
      }
      goto LABEL_27;
    }
    if (v10 <= 49)
    {
      if (v10 == 30)
      {
        id v11 = "Applying configuration to device";
        goto LABEL_27;
      }
      if (v10 == 40)
      {
        id v11 = "Applied configuration to device";
        goto LABEL_27;
      }
    }
    else
    {
      switch(v10)
      {
        case '2':
          id v11 = "Searching for post-config device";
          goto LABEL_27;
        case '<':
          id v11 = "Performing post-config check of device";
          goto LABEL_27;
        case 'F':
          id v11 = "Performed post-config check of device";
LABEL_27:
          *(_DWORD *)buf = 138543618;
          uint64_t v68 = v8;
          __int16 v69 = 2080;
          uint64_t v70 = (uint64_t)v11;
          _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Easy config progress: %s", buf, 0x16u);

LABEL_28:
          v65[0] = MEMORY[0x1E4F143A8];
          v65[1] = 3221225472;
          v65[2] = __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_130;
          v65[3] = &unk_1E69F3DD0;
          v65[4] = *(void *)(a1 + 32);
          int v66 = *(_DWORD *)(a1 + 88);
          __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_130((uint64_t)v65);
          int v13 = *(void **)(a1 + 40);
          if (v13)
          {
            uint64_t v14 = *MEMORY[0x1E4F5FC08];
            uint64_t v15 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F5FC08]];
            BOOL v16 = v15 == 0;

            if (!v16)
            {
              v17 = (void *)MEMORY[0x1D944E080]();
              id v18 = *(id *)(a1 + 32);
              v19 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                v20 = HMFGetLogIdentifier();
                uint64_t v21 = [*(id *)(a1 + 32) state];
                v22 = [*(id *)(a1 + 40) objectForKeyedSubscript:v14];
                *(_DWORD *)buf = 138543874;
                uint64_t v68 = (uint64_t)v20;
                __int16 v69 = 2048;
                uint64_t v70 = v21;
                __int16 v71 = 2112;
                id v72 = v22;
                _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%{public}@Easy config failed in state: %tu - error: %@ calling completion handler with error", buf, 0x20u);
              }
              v23 = *(void **)(a1 + 32);
              BOOL v24 = [*(id *)(a1 + 40) objectForKeyedSubscript:v14];
              [v23 _restoreNetworkAndReportError:v24 withCompletion:*(void *)(a1 + 48)];
            }
          }
          int v25 = *(_DWORD *)(a1 + 88);
          if (v25 == 10)
          {
            [*(id *)(a1 + 32) _reportProgress:0];
            uint64_t v26 = [MEMORY[0x1E4F1C9C8] date];
            uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
            uint64_t v28 = *(void **)(v27 + 40);
            *(void *)(v27 + 40) = v26;

            int v25 = *(_DWORD *)(a1 + 88);
          }
          if (v25 == 50)
          {
            [*(id *)(a1 + 32) _reportProgress:0];
            uint64_t v29 = [MEMORY[0x1E4F1C9C8] date];
            uint64_t v30 = *(void *)(*(void *)(a1 + 64) + 8);
            v31 = *(void **)(v30 + 40);
            *(void *)(v30 + 40) = v29;

            int v25 = *(_DWORD *)(a1 + 88);
          }
          if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) && v25 >= 11)
          {
            v32 = *(void **)(a1 + 32);
            v33 = [MEMORY[0x1E4F1C9C8] date];
            [v33 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
            double v35 = v34;
            [v32 preConfigDiscoveryTime];
            [v32 setPreConfigDiscoveryTime:v35 + v36];

            uint64_t v37 = *(void *)(*(void *)(a1 + 56) + 8);
            v38 = *(void **)(v37 + 40);
            *(void *)(v37 + 40) = 0;

            int v25 = *(_DWORD *)(a1 + 88);
          }
          if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) && v25 >= 51)
          {
            v39 = *(void **)(a1 + 32);
            v40 = [MEMORY[0x1E4F1C9C8] date];
            [v40 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
            double v42 = v41;
            [v39 postConfigDiscoveryTime];
            [v39 setPostConfigDiscoveryTime:v42 + v43];

            uint64_t v44 = *(void *)(*(void *)(a1 + 64) + 8);
            v45 = *(void **)(v44 + 40);
            *(void *)(v44 + 40) = 0;

            int v25 = *(_DWORD *)(a1 + 88);
          }
          if (v25 == 40)
          {
            v46 = (void *)MEMORY[0x1D944E080]();
            id v47 = *(id *)(a1 + 32);
            uint64_t v48 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v49 = HMFGetLogIdentifier();
              uint64_t v50 = *(void *)(a1 + 40);
              *(_DWORD *)buf = 138543618;
              uint64_t v68 = (uint64_t)v49;
              __int16 v69 = 2112;
              uint64_t v70 = v50;
              _os_log_impl(&dword_1D4758000, v48, OS_LOG_TYPE_DEBUG, "%{public}@Applied Config with info: %@", buf, 0x16u);
            }
            [*(id *)(a1 + 32) _reportProgress:1];
            [*(id *)(a1 + 32) _reportProgress:2];
            v51 = *(void **)(a1 + 32);
            v63[0] = MEMORY[0x1E4F143A8];
            v63[1] = 3221225472;
            v63[2] = __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_135;
            v63[3] = &unk_1E69F4420;
            objc_copyWeak(&v64, (id *)(a1 + 72));
            id v52 = (id)[v51 restoreNetworkWithCompletion:v63];
            objc_destroyWeak(&v64);
            int v25 = *(_DWORD *)(a1 + 88);
          }
          if (v25 == 2)
          {
            BOOL v53 = [*(id *)(a1 + 32) state] == 8;
            v54 = (void *)MEMORY[0x1D944E080]();
            id v55 = *(id *)(a1 + 32);
            uint64_t v56 = HMFGetOSLogHandle();
            v57 = v56;
            if (v53)
            {
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
              {
                v58 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                uint64_t v68 = (uint64_t)v58;
                _os_log_impl(&dword_1D4758000, v57, OS_LOG_TYPE_DEBUG, "%{public}@Easy config completed - calling completion handler", buf, 0xCu);
              }
              [*(id *)(a1 + 32) setState:9];
              (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
            }
            else
            {
              if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
              {
                v59 = HMFGetLogIdentifier();
                uint64_t v60 = [*(id *)(a1 + 32) state];
                *(_DWORD *)buf = 138543618;
                uint64_t v68 = (uint64_t)v59;
                __int16 v69 = 2048;
                uint64_t v70 = v60;
                _os_log_impl(&dword_1D4758000, v57, OS_LOG_TYPE_ERROR, "%{public}@Easy config failed in state: %tu - calling completion handler with error", buf, 0x16u);
              }
              v61 = *(void **)(a1 + 32);
              v62 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F5FC08]];
              [v61 _restoreNetworkAndReportError:v62 withCompletion:*(void *)(a1 + 48)];
            }
          }
          return;
      }
    }
LABEL_19:
    id v11 = "?";
    if (v10 == 100) {
      id v11 = "Configuration complete";
    }
    goto LABEL_27;
  }
  if (v7)
  {
    long long v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v68 = (uint64_t)v12;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Ignoring easy config progress event because we are restarting", buf, 0xCu);
  }
}

void __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_130(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) server];
  id v5 = [v2 pairingActivity];

  if (v5)
  {
    id v3 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "state"));
    id v4 = (id)[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  }
}

void __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_135(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (!v3 && WeakRetained)
  {
    id v6 = (void *)MEMORY[0x1D944E080]();
    id v7 = v5;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      long long v12 = v9;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Restored network", (uint8_t *)&v11, 0xCu);
    }
    int v10 = [v7 clientDelegate];
    [v10 hapWACAccessoryClient:v7 setBonjourInfo:0];

    [v7 _reportProgress:3];
    [v7 _performPostConfig];
  }
}

void __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) server];
  id v16 = [v2 pairingActivity];

  if (v16)
  {
    id v3 = (id)[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    id v4 = NSNumber;
    [*(id *)(a1 + 32) joinLatency];
    id v5 = (id)objc_msgSend(v4, "numberWithDouble:");
    id v6 = NSNumber;
    [*(id *)(a1 + 32) restoreLatency];
    id v7 = (id)objc_msgSend(v6, "numberWithDouble:");
    uint64_t v8 = NSNumber;
    [*(id *)(a1 + 32) configurationLatency];
    id v9 = (id)objc_msgSend(v8, "numberWithDouble:");
    int v10 = NSNumber;
    [*(id *)(a1 + 32) preConfigDiscoveryTime];
    id v11 = (id)objc_msgSend(v10, "numberWithDouble:");
    long long v12 = NSNumber;
    [*(id *)(a1 + 32) postConfigDiscoveryTime];
    id v13 = (id)objc_msgSend(v12, "numberWithDouble:");
    uint64_t v14 = NSNumber;
    [*(id *)(a1 + 32) setupCodeDelay];
    id v15 = (id)objc_msgSend(v14, "numberWithDouble:");
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
  }
}

- (void)_reportProgress:(unint64_t)a3
{
  id v5 = [(HAPWACAccessoryClient *)self clientDelegate];

  if (v5)
  {
    id v6 = [(HAPWACAccessoryClient *)self clientDelegate];
    [v6 hapWACAccessoryClient:self wacProgress:a3];
  }
}

- (id)performEasyConfigWithParingPrompt:(void *)a3 performPairSetup:(BOOL)a4 isSplit:(BOOL)a5 pairingRequest:(id)a6 completion:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  if (v13)
  {
    uint64_t v14 = [(HAPWACAccessoryClient *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __110__HAPWACAccessoryClient_performEasyConfigWithParingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke;
    block[3] = &unk_1E69F1178;
    block[4] = self;
    v20 = a3;
    BOOL v21 = a4;
    BOOL v22 = a5;
    id v18 = v12;
    id v19 = v13;
    dispatch_async(v14, block);

    id v15 = 0;
  }
  else
  {
    id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:9 userInfo:0];
  }

  return v15;
}

void __110__HAPWACAccessoryClient_performEasyConfigWithParingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setState:5];
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 65);
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __110__HAPWACAccessoryClient_performEasyConfigWithParingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_2;
  v9[3] = &unk_1E69F1150;
  objc_copyWeak(&v12, &location);
  id v8 = v2;
  id v10 = v8;
  id v11 = *(id *)(a1 + 48);
  [v6 _performEasyConfigWithPairingPrompt:v3 performPairSetup:v4 isSplit:v5 pairingRequest:v7 completion:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __110__HAPWACAccessoryClient_performEasyConfigWithParingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v9) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 9;
    }
    [WeakRetained setState:v4];
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
    [v5 timeIntervalSinceDate:*(void *)(a1 + 32)];
    double v7 = v6;
    [WeakRetained configurationLatency];
    [WeakRetained setConfigurationLatency:v7 + v8];
  }
  else
  {
    [MEMORY[0x1E4F28C58] errorWithHMErrorCode:20];
    uint64_t v5 = v9;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_restoreNetworkWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void *))a3;
  [(HAPWACAccessoryClient *)self setCompletionHandler:v4];
  uint64_t v5 = [(HAPWACAccessoryClient *)self currentNetworkInfo];
  double v6 = objc_msgSend(v5, "hmf_stringForKey:", @"ssid");

  double v7 = (void *)MEMORY[0x1D944E080]();
  double v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    BOOL v24 = v10;
    __int16 v25 = 2112;
    uint64_t v26 = v6;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Restoring network: %@", buf, 0x16u);
  }
  id v11 = [(HAPWACAccessoryClient *)v8 currentNetworkInfo];

  if (!v11)
  {
    id v12 = (void *)MEMORY[0x1D944E080]();
    id v13 = v8;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      BOOL v24 = v15;
      _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%{public}@No restored network info", buf, 0xCu);
    }
    id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:26 userInfo:0];
    v4[2](v4, v16);
  }
  v17 = [(HAPWACAccessoryClient *)v8 currentNetworkInfo];
  id v18 = [(HAPWACAccessoryClient *)v8 workQueue];
  BOOL v21 = v6;
  BOOL v22 = v4;
  id v19 = v4;
  id v20 = v6;
  WiFiRestoreNetwork();
}

void __55__HAPWACAccessoryClient__restoreNetworkWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1D944E080]();
  id v5 = *(id *)(a1 + 32);
  double v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    double v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v17 = v7;
    __int16 v18 = 2112;
    uint64_t v19 = v8;
    __int16 v20 = 1024;
    int v21 = a2;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Restored to network %@ with status: %d", buf, 0x1Cu);
  }
  if (a2)
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:26 userInfo:0];
  }
  else
  {
    id v10 = (void *)WiFiCopyCurrentNetworkInfoEx();
    id v11 = objc_msgSend(v10, "hmf_stringForKey:", @"ssid");
    if ([*(id *)(a1 + 40) isEqual:v11])
    {
      id v9 = 0;
    }
    else
    {
      id v12 = (void *)MEMORY[0x1D944E080]();
      id v13 = *(id *)(a1 + 32);
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v17 = v15;
        _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%{public}@Restored network does not match - indicating join failure", buf, 0xCu);
      }
      id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:26 userInfo:0];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_callRestoreCompletion:(id)a3 withError:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double v6 = (void (**)(id, id))a3;
  id v7 = a4;
  if (v7) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 1;
  }
  id v9 = (void *)MEMORY[0x1D944E080]([(HAPWACAccessoryClient *)self setState:v8]);
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = HMFGetLogIdentifier();
    id v13 = [(HAPWACAccessoryClient *)v10 hapWACAccessory];
    uint64_t v14 = [v13 ssid];
    int v17 = 138543618;
    __int16 v18 = v12;
    __int16 v19 = 2112;
    __int16 v20 = v14;
    _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Removing accessory network %@ from the known network list", (uint8_t *)&v17, 0x16u);
  }
  WiFiManagerClientCreate();
  id v15 = [(HAPWACAccessoryClient *)v10 hapWACAccessory];
  id v16 = [v15 rawScanResult];
  [v16 objectForKey:@"platformNetwork"];

  WiFiManagerClientRemoveNetwork();
  if (v6) {
    v6[2](v6, v7);
  }
}

- (id)restoreNetworkWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
    double v6 = [(HAPWACAccessoryClient *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__HAPWACAccessoryClient_restoreNetworkWithCompletion___block_invoke;
    block[3] = &unk_1E69F4070;
    block[4] = self;
    id v11 = v5;
    id v12 = v4;
    id v7 = v5;
    dispatch_async(v6, block);

    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:9 userInfo:0];
  }

  return v8;
}

void __54__HAPWACAccessoryClient_restoreNetworkWithCompletion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__HAPWACAccessoryClient_restoreNetworkWithCompletion___block_invoke_2;
  v9[3] = &unk_1E69F1608;
  objc_copyWeak(&v11, &location);
  id v10 = a1[6];
  uint64_t v2 = (void *)MEMORY[0x1D944E2D0](v9);
  [a1[4] setState:4];
  id v3 = a1[4];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__HAPWACAccessoryClient_restoreNetworkWithCompletion___block_invoke_4;
  v5[3] = &unk_1E69F1150;
  objc_copyWeak(&v8, &location);
  id v4 = v2;
  id v7 = v4;
  id v6 = a1[5];
  [v3 _restoreNetworkWithCompletion:v5];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __54__HAPWACAccessoryClient_restoreNetworkWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__HAPWACAccessoryClient_restoreNetworkWithCompletion___block_invoke_3;
    v10[3] = &unk_1E69F46E0;
    v10[4] = WeakRetained;
    id v6 = v3;
    id v11 = v6;
    __54__HAPWACAccessoryClient_restoreNetworkWithCompletion___block_invoke_3((uint64_t)v10);
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:20];
  }
  (*(void (**)(void, id, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v6, v7, v8, v9);
}

void __54__HAPWACAccessoryClient_restoreNetworkWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
    [v5 timeIntervalSinceDate:*(void *)(a1 + 32)];
    double v7 = v6;
    [WeakRetained restoreLatency];
    [WeakRetained setRestoreLatency:v7 + v8];

    if (v3)
    {
      uint64_t v9 = (void *)MEMORY[0x1D944E080](objc_msgSend(WeakRetained, "setRetryCount:", objc_msgSend(WeakRetained, "retryCount") + 1));
      id v10 = WeakRetained;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        id v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v21 = v12;
        __int16 v22 = 2112;
        id v23 = v3;
        _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Retrying restore after 5 sec on error: %@", buf, 0x16u);
      }
      dispatch_time_t v13 = dispatch_time(0, 5000000000);
      uint64_t v14 = [v10 workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__HAPWACAccessoryClient_restoreNetworkWithCompletion___block_invoke_99;
      block[3] = &unk_1E69F4270;
      block[4] = v10;
      objc_copyWeak(&v19, (id *)(a1 + 48));
      id v18 = *(id *)(a1 + 40);
      dispatch_after(v13, v14, block);

      objc_destroyWeak(&v19);
    }
    else
    {
      [WeakRetained _callRestoreCompletion:*(void *)(a1 + 40) withError:0];
    }
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 40);
    id v16 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:20];
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);
  }
}

void __54__HAPWACAccessoryClient_restoreNetworkWithCompletion___block_invoke_99(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__HAPWACAccessoryClient_restoreNetworkWithCompletion___block_invoke_2_100;
  v3[3] = &unk_1E69F1608;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 40);
  [v2 _restoreNetworkWithCompletion:v3];

  objc_destroyWeak(&v5);
}

void __54__HAPWACAccessoryClient_restoreNetworkWithCompletion___block_invoke_2_100(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  uint64_t v5 = *(void *)(a1 + 32);
  if (WeakRetained)
  {
    [WeakRetained _callRestoreCompletion:v5 withError:v7];
  }
  else
  {
    double v6 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:20];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

void __54__HAPWACAccessoryClient_restoreNetworkWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) server];
  id v7 = [v2 pairingActivity];

  if (v7)
  {
    id v3 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "state"));
    id v4 = NSNumber;
    [*(id *)(a1 + 32) restoreLatency];
    id v5 = (id)objc_msgSend(v4, "numberWithDouble:");
    id v6 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "retryCount"));
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
  }
}

- (void)_joinAccessory:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  double v8 = [(HAPWACAccessoryClient *)self currentNetworkInfo];
  [v8 objectForKey:@"platformNetwork"];

  int OperatingBand = WiFiNetworkGetOperatingBand();
  id v10 = [(HAPWACAccessoryClient *)self currentNetworkInfo];
  id v11 = objc_msgSend(v10, "hmf_stringForKey:", @"ssid");

  id v12 = (void *)MEMORY[0x1D944E080]();
  dispatch_time_t v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    id v16 = [(HAPWACAccessoryClient *)v13 hapWACAccessory];
    int v17 = [v16 ssid];
    int v27 = 138544130;
    uint64_t v28 = v15;
    __int16 v29 = 2112;
    uint64_t v30 = v11;
    __int16 v31 = 1024;
    int v32 = OperatingBand;
    __int16 v33 = 2112;
    double v34 = v17;
    _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Joining accessory network: (%@[%u]) -> %@)", (uint8_t *)&v27, 0x26u);
  }
  id v18 = [(HAPWACAccessoryClient *)v13 hapWACAccessory];
  id v19 = [v18 rawScanResult];
  __int16 v20 = [(HAPWACAccessoryClient *)v13 workQueue];
  int v21 = WiFiJoinNetwork();

  if (v21)
  {
    __int16 v22 = (void *)MEMORY[0x1D944E080]();
    id v23 = v13;
    uint64_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      __int16 v25 = HMFGetLogIdentifier();
      int v27 = 138543618;
      uint64_t v28 = v25;
      __int16 v29 = 1024;
      LODWORD(v30) = v21;
      _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to join accessory network with error: %d", (uint8_t *)&v27, 0x12u);
    }
    uint64_t v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:26 userInfo:0];
    v7[2](v7, v26);
  }
}

- (id)_findCompatiblePrefixedNetworks
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  int v46 = 0;
  id v3 = [(HAPWACAccessoryClient *)self currentNetworkInfo];
  id v4 = objc_msgSend(v3, "hmf_stringForKey:", @"ssid");

  id v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = [(HAPWACAccessoryClient *)self compatible2Pt4Networks];
  id v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  double v8 = [(HAPWACAccessoryClient *)self compatible2Pt4Networks];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v14 = [v4 commonPrefixWithString:v13 options:10];
        if ([v14 length]) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v42 objects:v54 count:16];
    }
    while (v10);
  }

  uint64_t v15 = (void *)MEMORY[0x1D944E080]();
  id v16 = self;
  int v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v51 = v18;
    __int16 v52 = 2112;
    BOOL v53 = v7;
    _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_INFO, "%{public}@Possible compatible results: %@", buf, 0x16u);
  }
  uint64_t v35 = v16;

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = v7;
  uint64_t v19 = [obj countByEnumeratingWithState:&v38 objects:v49 count:16];
  if (v19)
  {
    uint64_t v21 = v19;
    id v22 = 0;
    uint64_t v37 = *(void *)v39;
    *(void *)&long long v20 = 138543618;
    long long v34 = v20;
    id v23 = v16;
    while (2)
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v39 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void *)(*((void *)&v38 + 1) + 8 * j);
        id v47 = @"ssid";
        uint64_t v48 = v25;
        objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1, v34);
        uint64_t v26 = (void *)WiFiCopyNetworkInfo();
        if (v26)
        {
          int v27 = (void *)MEMORY[0x1D944E080]();
          uint64_t v28 = v23;
          __int16 v29 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            uint64_t v30 = HMFGetLogIdentifier();
            __int16 v31 = [v26 objectForKeyedSubscript:@"ssid"];
            *(_DWORD *)buf = v34;
            v51 = v30;
            __int16 v52 = 2112;
            BOOL v53 = v31;
            _os_log_impl(&dword_1D4758000, v29, OS_LOG_TYPE_INFO, "%{public}@Matched : %@", buf, 0x16u);

            id v23 = v35;
          }

          if (v22)
          {

            goto LABEL_26;
          }
          id v22 = v26;
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v38 objects:v49 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_26:
    id v22 = 0;
  }

  id v32 = v22;

  return v32;
}

- (void)_joinAccessoryNetworkWithCompletion:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  [(HAPWACAccessoryClient *)self setCompletionHandler:v4];
  id v5 = [(HAPWACAccessoryClient *)self currentNetworkInfo];
  [v5 objectForKey:@"platformNetwork"];

  if (CoreWiFiLibraryCore())
  {
    uint64_t v56 = 0;
    v57 = &v56;
    uint64_t v58 = 0x2050000000;
    id v6 = (void *)getCWFInterfaceClass_softClass;
    uint64_t v59 = getCWFInterfaceClass_softClass;
    if (!getCWFInterfaceClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getCWFInterfaceClass_block_invoke;
      v61 = &unk_1E69F12A8;
      v62 = &v56;
      __getCWFInterfaceClass_block_invoke((uint64_t)buf);
      id v6 = (void *)v57[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v56, 8);
    id v8 = objc_alloc_init(v7);
    [v8 resume];
    uint64_t v9 = [v8 currentKnownNetworkProfile];
    char v10 = [v9 isEAP];

    [v8 invalidate];
  }
  else
  {
    char v10 = 0;
  }
  int OperatingBand = WiFiNetworkGetOperatingBand();
  id v12 = [(HAPWACAccessoryClient *)self currentNetworkInfo];
  uint64_t v13 = objc_msgSend(v12, "hmf_stringForKey:", @"ssid");

  uint64_t v14 = [MEMORY[0x1E4F65530] sharedPreferences];
  uint64_t v15 = [v14 preferenceForKey:@"wifiNetworkBlacklist"];
  id v16 = [v15 value];

  if ((v10 & 1) != 0 || [v16 containsObject:v13])
  {
    int v17 = (void *)MEMORY[0x1D944E080]();
    id v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      long long v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v20;
      _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%{public}@Enterprise networks - not supported", buf, 0xCu);
    }
    uint64_t v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:23 userInfo:0];
    v4[2](v4, v21);

    goto LABEL_11;
  }
  id v22 = [(HAPWACAccessoryClient *)self hapWACAccessory];
  id v23 = [v22 ssid];
  int v24 = [v13 isEqual:v23];
  if (v13) {
    int v25 = v24;
  }
  else {
    int v25 = 1;
  }

  if (v25)
  {
    uint64_t v26 = (void *)MEMORY[0x1D944E080]();
    int v27 = self;
    uint64_t v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      __int16 v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v29;
      _os_log_impl(&dword_1D4758000, v28, OS_LOG_TYPE_ERROR, "%{public}@Not associated to WiFi", buf, 0xCu);
    }
    uint64_t v30 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:21 userInfo:0];
    v4[2](v4, v30);

    goto LABEL_11;
  }
  [(HAPWACAccessoryClient *)self setCompatiblePrefixedNetwork:0];
  __int16 v31 = [(HAPWACAccessoryClient *)self hapWACAccessory];
  if (([v31 supportedWiFiBands] & 1) != 0 && OperatingBand == 1) {
    goto LABEL_24;
  }
  id v32 = [(HAPWACAccessoryClient *)self hapWACAccessory];
  if (([v32 supportedWiFiBands] & 2) != 0 && OperatingBand == 2)
  {

LABEL_24:
LABEL_25:
    __int16 v33 = (void *)MEMORY[0x1D944E080]();
    long long v34 = self;
    uint64_t v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      double v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v36;
      _os_log_impl(&dword_1D4758000, v35, OS_LOG_TYPE_DEBUG, "%{public}@Compatible network", buf, 0xCu);
    }
    uint64_t v37 = [(HAPWACAccessoryClient *)v34 hapWACAccessory];
    [(HAPWACAccessoryClient *)v34 _joinAccessory:v37 completion:v4];

    goto LABEL_11;
  }
  long long v38 = [(HAPWACAccessoryClient *)self hapWACAccessory];
  if ([v38 supportedWiFiBands])
  {
    long long v39 = [(HAPWACAccessoryClient *)self compatible2Pt4Networks];
    char v40 = [v39 containsObject:v13];

    if (v40) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  long long v41 = [(HAPWACAccessoryClient *)self hapWACAccessory];
  if (([v41 supportedWiFiBands] & 1) == 0)
  {

LABEL_34:
    long long v44 = (void *)MEMORY[0x1D944E080]();
    long long v45 = self;
    int v46 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      id v47 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v47;
      _os_log_impl(&dword_1D4758000, v46, OS_LOG_TYPE_ERROR, "%{public}@Incompatible network", buf, 0xCu);
    }
    uint64_t v48 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:20 userInfo:0];
    v4[2](v4, v48);

    goto LABEL_11;
  }
  long long v42 = [(HAPWACAccessoryClient *)self compatible2Pt4Networks];
  char v43 = [v42 containsObject:v13];

  if (v43) {
    goto LABEL_34;
  }
  uint64_t v49 = (void *)MEMORY[0x1D944E080]();
  uint64_t v50 = self;
  v51 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
  {
    __int16 v52 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v52;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    _os_log_impl(&dword_1D4758000, v51, OS_LOG_TYPE_DEBUG, "%{public}@Finding 2.4 AP with ssid: %@", buf, 0x16u);
  }
  BOOL v53 = [(HAPWACAccessoryClient *)v50 browser];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __61__HAPWACAccessoryClient__joinAccessoryNetworkWithCompletion___block_invoke;
  v54[3] = &unk_1E69F1100;
  v54[4] = v50;
  uint64_t v55 = v4;
  [v53 scan2Pt4APWithSSID:v13 completion:v54];

LABEL_11:
}

void __61__HAPWACAccessoryClient__joinAccessoryNetworkWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    id v18 = [*(id *)(a1 + 32) hapWACAccessory];
    objc_msgSend(v3, "_joinAccessory:completion:");
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) _findCompatiblePrefixedNetworks];
    [*(id *)(a1 + 32) setCompatiblePrefixedNetwork:v4];

    id v5 = [*(id *)(a1 + 32) compatiblePrefixedNetwork];

    id v6 = (void *)MEMORY[0x1D944E080]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    uint64_t v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        char v10 = HMFGetLogIdentifier();
        uint64_t v11 = [*(id *)(a1 + 32) compatiblePrefixedNetwork];
        id v12 = [v11 objectForKeyedSubscript:@"ssid"];
        *(_DWORD *)buf = 138543618;
        long long v20 = v10;
        __int16 v21 = 2112;
        id v22 = v12;
        _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@Found compatible prefixed network: %@", buf, 0x16u);
      }
      uint64_t v13 = *(void **)(a1 + 32);
      uint64_t v14 = [v13 hapWACAccessory];
      [v13 _joinAccessory:v14 completion:*(void *)(a1 + 40)];
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v20 = v15;
        _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%{public}@No compatible network found", buf, 0xCu);
      }
      uint64_t v16 = *(void *)(a1 + 40);
      int v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:20 userInfo:0];
      (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);
    }
  }
}

- (id)joinAccessoryNetworkWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HAPWACAccessoryClient *)self workQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__HAPWACAccessoryClient_joinAccessoryNetworkWithCompletion___block_invoke;
    v8[3] = &unk_1E69F3C68;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(v5, v8);

    id v6 = 0;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:9 userInfo:0];
  }

  return v6;
}

void __60__HAPWACAccessoryClient_joinAccessoryNetworkWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __60__HAPWACAccessoryClient_joinAccessoryNetworkWithCompletion___block_invoke_2;
  v19[3] = &unk_1E69F1608;
  objc_copyWeak(&v21, &location);
  id v20 = *(id *)(a1 + 40);
  id v3 = (void *)MEMORY[0x1D944E2D0](v19);
  int v18 = 0;
  [*v2 setState:2];
  [*(id *)(a1 + 32) setRetryCount:0];
  id v4 = (void *)WiFiCopyCurrentNetworkInfoEx();
  [*(id *)(a1 + 32) setCurrentNetworkInfo:v4];

  id v5 = (void *)MEMORY[0x1D944E080]();
  id v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = [*(id *)(a1 + 32) currentNetworkInfo];
    char v10 = objc_msgSend(v9, "hmf_stringForKey:", @"ssid");
    *(_DWORD *)buf = 138543618;
    id v24 = v8;
    __int16 v25 = 2112;
    uint64_t v26 = v10;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Saving current network: %@", buf, 0x16u);
  }
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
  id v12 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__HAPWACAccessoryClient_joinAccessoryNetworkWithCompletion___block_invoke_90;
  v14[3] = &unk_1E69F1150;
  objc_copyWeak(&v17, &location);
  id v16 = v3;
  id v13 = v11;
  id v15 = v13;
  [v12 _joinAccessoryNetworkWithCompletion:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __60__HAPWACAccessoryClient_joinAccessoryNetworkWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__HAPWACAccessoryClient_joinAccessoryNetworkWithCompletion___block_invoke_3;
    v10[3] = &unk_1E69F46E0;
    v10[4] = WeakRetained;
    id v6 = v3;
    id v11 = v6;
    __60__HAPWACAccessoryClient_joinAccessoryNetworkWithCompletion___block_invoke_3((uint64_t)v10);
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:20];
  }
  (*(void (**)(void, id, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v6, v7, v8, v9);
}

void __60__HAPWACAccessoryClient_joinAccessoryNetworkWithCompletion___block_invoke_90(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
    [v5 timeIntervalSinceDate:*(void *)(a1 + 32)];
    double v7 = v6;
    [WeakRetained joinLatency];
    [WeakRetained setJoinLatency:v7 + v8];

    if (!v3)
    {
      uint64_t v9 = 3;
      goto LABEL_9;
    }
    if ([WeakRetained retryCount] || objc_msgSend(v3, "code") == 23 || objc_msgSend(v3, "code") == 34)
    {
      uint64_t v9 = 1;
LABEL_9:
      [WeakRetained setState:v9];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_10;
    }
    id v12 = (void *)MEMORY[0x1D944E080](objc_msgSend(WeakRetained, "setRetryCount:", objc_msgSend(WeakRetained, "retryCount") + 1));
    id v13 = WeakRetained;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v20 = v15;
      __int16 v21 = 2112;
      id v22 = v3;
      _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Retrying to join accessory network on error: %@", buf, 0x16u);
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__HAPWACAccessoryClient_joinAccessoryNetworkWithCompletion___block_invoke_91;
    v16[3] = &unk_1E69F1608;
    objc_copyWeak(&v18, (id *)(a1 + 48));
    id v17 = *(id *)(a1 + 40);
    [v13 _joinAccessoryNetworkWithCompletion:v16];

    objc_destroyWeak(&v18);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:20];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }
LABEL_10:
}

void __60__HAPWACAccessoryClient_joinAccessoryNetworkWithCompletion___block_invoke_91(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 3;
    }
    [WeakRetained setState:v4];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:20];

    id v6 = (id)v5;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__HAPWACAccessoryClient_joinAccessoryNetworkWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) server];
  id v7 = [v2 pairingActivity];

  if (v7)
  {
    id v3 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "state"));
    uint64_t v4 = NSNumber;
    [*(id *)(a1 + 32) joinLatency];
    id v5 = (id)objc_msgSend(v4, "numberWithDouble:");
    id v6 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "retryCount"));
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
  }
}

- (void)_callJoinCompletion:(id)a3 withError:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, id))a3;
  id v7 = a4;
  if (!v7)
  {
    double v8 = (void *)WiFiCopyCurrentNetworkInfoEx();
    id v7 = 0;
    uint64_t v9 = [v8 objectForKey:@"platformNetwork"];
    uint64_t v10 = (void *)MEMORY[0x1D944E080]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    id v13 = v12;
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        id v15 = objc_msgSend(v8, "hmf_stringForKey:", @"ssid");
        *(_DWORD *)buf = 138543874;
        uint64_t v19 = v14;
        __int16 v20 = 2112;
        __int16 v21 = v15;
        __int16 v22 = 2112;
        uint64_t v23 = 0;
        _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Disabling auto-join on: %@, error: %@", buf, 0x20u);
      }
      WiFiNetworkDisableAutoJoinUntilFirstUserJoin();
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v19 = v16;
        _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_ERROR, "%{public}@Join succeeded but no network - declaring join failure", buf, 0xCu);
      }
      uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:26 userInfo:0];

      id v7 = (id)v17;
    }
  }
  if (v6) {
    v6[2](v6, v7);
  }
}

- (void)_joinCompleteWithStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1D944E080](self, a2);
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    double v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v30 = v8;
    __int16 v31 = 1024;
    int v32 = v3;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@Joined accessory network with status: %d", buf, 0x12u);
  }
  switch(v3)
  {
    case 5:
      goto LABEL_6;
    case 0:
      id v13 = [(HAPWACAccessoryClient *)v6 completionHandler];
      [(HAPWACAccessoryClient *)v6 _callJoinCompletion:v13 withError:0];
      break;
    case 0xFFFFF0A0:
LABEL_6:
      uint64_t v9 = (void *)MEMORY[0x1D944E080]();
      uint64_t v10 = v6;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v30 = v12;
        _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@Failed to join network, reporting connection failure", buf, 0xCu);
      }
      id v13 = [(HAPWACAccessoryClient *)v10 completionHandler];
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F28588];
      uint64_t v28 = @"Network was not found";
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      id v16 = [v14 errorWithDomain:@"HAPErrorDomain" code:34 userInfo:v15];
      [(HAPWACAccessoryClient *)v10 _callJoinCompletion:v13 withError:v16];

      break;
    default:
      id v13 = HMErrorFromOSStatus(v3);
      uint64_t v17 = [(HAPWACAccessoryClient *)v6 completionHandler];
      objc_initWeak((id *)buf, v6);
      if ([(HAPWACAccessoryClient *)v6 retryCount] > 2)
      {
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __49__HAPWACAccessoryClient__joinCompleteWithStatus___block_invoke_4;
        v20[3] = &unk_1E69F1608;
        id v18 = &v22;
        objc_copyWeak(&v22, (id *)buf);
        id v21 = v17;
        [(HAPWACAccessoryClient *)v6 _restoreNetworkWithCompletion:v20];
        uint64_t v19 = &v21;
      }
      else
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __49__HAPWACAccessoryClient__joinCompleteWithStatus___block_invoke;
        v23[3] = &unk_1E69F1150;
        id v18 = &v26;
        objc_copyWeak(&v26, (id *)buf);
        id v25 = v17;
        id v24 = v13;
        [(HAPWACAccessoryClient *)v6 _restoreNetworkWithCompletion:v23];

        uint64_t v19 = &v25;
      }

      objc_destroyWeak(v18);
      objc_destroyWeak((id *)buf);

      break;
  }
}

void __49__HAPWACAccessoryClient__joinCompleteWithStatus___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)MEMORY[0x1D944E080](objc_msgSend(WeakRetained, "setRetryCount:", objc_msgSend(WeakRetained, "retryCount") + 1));
    id v7 = v5;
    double v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      uint64_t v10 = [v7 retryCount];
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v27 = v9;
      __int16 v28 = 2048;
      uint64_t v29 = v10;
      __int16 v30 = 2112;
      uint64_t v31 = v11;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Retrying attempt: %ld to join accessory network on error:%@", buf, 0x20u);
    }
    if ([v7 retryCount] == 3)
    {
      id v12 = (void *)MEMORY[0x1D944E080]();
      id v13 = v7;
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        id v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v27 = v15;
        _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Last retry attempting after 10 sec", buf, 0xCu);
      }
      dispatch_time_t v16 = dispatch_time(0, 10000000000);
      uint64_t v17 = [v13 workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__HAPWACAccessoryClient__joinCompleteWithStatus___block_invoke_77;
      block[3] = &unk_1E69F4270;
      block[4] = v13;
      objc_copyWeak(&v25, (id *)(a1 + 48));
      id v24 = *(id *)(a1 + 40);
      dispatch_after(v16, v17, block);

      objc_destroyWeak(&v25);
    }
    else
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __49__HAPWACAccessoryClient__joinCompleteWithStatus___block_invoke_3;
      v20[3] = &unk_1E69F1608;
      objc_copyWeak(&v22, (id *)(a1 + 48));
      id v21 = *(id *)(a1 + 40);
      [v7 _joinAccessoryNetworkWithCompletion:v20];

      objc_destroyWeak(&v22);
    }
  }
  else
  {
    uint64_t v18 = *(void *)(a1 + 40);
    uint64_t v19 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:20];
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);
  }
}

void __49__HAPWACAccessoryClient__joinCompleteWithStatus___block_invoke_4(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  uint64_t v5 = *(void *)(a1 + 32);
  if (WeakRetained)
  {
    [WeakRetained _callJoinCompletion:v5 withError:v7];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:20];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

void __49__HAPWACAccessoryClient__joinCompleteWithStatus___block_invoke_77(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__HAPWACAccessoryClient__joinCompleteWithStatus___block_invoke_2;
  v3[3] = &unk_1E69F1608;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 40);
  [v2 _joinAccessoryNetworkWithCompletion:v3];

  objc_destroyWeak(&v5);
}

void __49__HAPWACAccessoryClient__joinCompleteWithStatus___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  uint64_t v5 = *(void *)(a1 + 32);
  if (WeakRetained)
  {
    [WeakRetained _callJoinCompletion:v5 withError:v7];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:20];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

void __49__HAPWACAccessoryClient__joinCompleteWithStatus___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  uint64_t v5 = *(void *)(a1 + 32);
  if (WeakRetained)
  {
    [WeakRetained _callJoinCompletion:v5 withError:v7];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:20];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

- (unint64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void)setState:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_unint64_t state = a3;

  os_unfair_lock_unlock(p_lock);
}

- (HAPWACAccessoryClientDelegate)clientDelegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientDelegate);
  os_unfair_lock_unlock(p_lock);

  return (HAPWACAccessoryClientDelegate *)WeakRetained;
}

- (void)registerClientDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_clientDelegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)dumpStatsWithError:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(HAPWACAccessoryClient *)self metricSubmitted])
  {
    id v5 = (void *)MEMORY[0x1D944E080]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      double v8 = v29 = v5;
      __int16 v28 = [(HAPWACAccessoryClient *)v6 hapWACAccessory];
      uint64_t v9 = [v28 name];
      uint64_t v10 = [(HAPWACAccessoryClient *)v6 hapWACAccessory];
      uint64_t v11 = [v10 deviceId];
      id v12 = [(HAPWACAccessoryClient *)v6 hapWACAccessory];
      id v13 = [v12 rssi];
      uint64_t v14 = [(HAPWACAccessoryClient *)v6 hapWACAccessory];
      [v14 discoveryTime];
      uint64_t v16 = v15;
      [(HAPWACAccessoryClient *)v6 joinLatency];
      uint64_t v18 = v17;
      [(HAPWACAccessoryClient *)v6 restoreLatency];
      uint64_t v20 = v19;
      [(HAPWACAccessoryClient *)v6 configurationLatency];
      uint64_t v22 = v21;
      [(HAPWACAccessoryClient *)v6 preConfigDiscoveryTime];
      uint64_t v24 = v23;
      [(HAPWACAccessoryClient *)v6 postConfigDiscoveryTime];
      uint64_t v26 = v25;
      [(HAPWACAccessoryClient *)v6 setupCodeDelay];
      *(_DWORD *)buf = 138546434;
      uint64_t v32 = v8;
      __int16 v33 = 2112;
      long long v34 = v9;
      __int16 v35 = 2112;
      double v36 = v11;
      __int16 v37 = 2112;
      long long v38 = v13;
      __int16 v39 = 2048;
      uint64_t v40 = v16;
      __int16 v41 = 2048;
      uint64_t v42 = v18;
      __int16 v43 = 2048;
      uint64_t v44 = v20;
      __int16 v45 = 2048;
      uint64_t v46 = v22;
      __int16 v47 = 2048;
      uint64_t v48 = v24;
      __int16 v49 = 2048;
      uint64_t v50 = v26;
      __int16 v51 = 2048;
      uint64_t v52 = v27;
      __int16 v53 = 2048;
      uint64_t v54 = [(HAPWACAccessoryClient *)v6 retryCount];
      __int16 v55 = 2112;
      id v56 = v4;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@Stats for accessory: %@ (%@) @ (%@), \nDiscovery Time: %f sec, \nJoin Time     : %f sec, \nRestore Time  : %f sec, \nWAC Configs   : %f sec, \n    Pre-Config Discovery : %f sec, \n    Post-Config Discovery: %f sec, \n    Setup Code delay     : %f sec, \nRetry Count   : %ld \nError         : %@  \n", buf, 0x84u);

      id v5 = v29;
    }

    id v30 = v4;
    AnalyticsSendEventLazy();
    [(HAPWACAccessoryClient *)v6 setMetricSubmitted:1];
  }
}

id __44__HAPWACAccessoryClient_dumpStatsWithError___block_invoke(uint64_t a1)
{
  v25[11] = *MEMORY[0x1E4F143B8];
  v24[0] = @"accessoryName";
  uint64_t v23 = [*(id *)(a1 + 32) hapWACAccessory];
  uint64_t v22 = [v23 name];
  v25[0] = v22;
  v24[1] = @"deviceId";
  uint64_t v21 = [*(id *)(a1 + 32) hapWACAccessory];
  uint64_t v20 = [v21 deviceId];
  v25[1] = v20;
  v24[2] = @"joinLatency";
  uint64_t v2 = NSNumber;
  [*(id *)(a1 + 32) joinLatency];
  uint64_t v19 = objc_msgSend(v2, "numberWithDouble:");
  v25[2] = v19;
  v24[3] = @"restoreLatency";
  id v3 = NSNumber;
  [*(id *)(a1 + 32) restoreLatency];
  id v4 = objc_msgSend(v3, "numberWithDouble:");
  v25[3] = v4;
  v24[4] = @"configurationLatency";
  id v5 = NSNumber;
  [*(id *)(a1 + 32) configurationLatency];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  v25[4] = v6;
  v24[5] = @"preConfigDiscoveryTime";
  id v7 = NSNumber;
  [*(id *)(a1 + 32) preConfigDiscoveryTime];
  double v8 = objc_msgSend(v7, "numberWithDouble:");
  v25[5] = v8;
  v24[6] = @"postConfigDiscoveryTime";
  uint64_t v9 = NSNumber;
  [*(id *)(a1 + 32) postConfigDiscoveryTime];
  uint64_t v10 = objc_msgSend(v9, "numberWithDouble:");
  v25[6] = v10;
  v24[7] = @"setupCodeDelay";
  uint64_t v11 = NSNumber;
  [*(id *)(a1 + 32) setupCodeDelay];
  id v12 = objc_msgSend(v11, "numberWithDouble:");
  v25[7] = v12;
  v24[8] = @"retryCount";
  id v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "retryCount"));
  v25[8] = v13;
  v24[9] = @"errorCode";
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "code"));
  v25[9] = v14;
  v24[10] = @"errorDescription";
  uint64_t v15 = [*(id *)(a1 + 40) description];
  if (v15)
  {
    uint64_t v16 = [*(id *)(a1 + 40) description];
  }
  else
  {
    uint64_t v16 = &stru_1F2C4E778;
  }
  v25[10] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:11];
  if (v15) {

  }
  return v17;
}

- (id)_setupEasyConfigWithDeviceInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPWACAccessoryClient *)self server];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    uint64_t v17 = objc_msgSend(v7, "copyPairingIdentityDelegateCallback", 0, 0, 0, 0, 0, 0, 0, 0, 0);
    uint64_t v18 = [v7 findPairedPeerDelegateCallback];
    *(void *)&long long v19 = [v7 savePairedPeerDelegateCallback];
    double v8 = [[HAPEasyConfigDevice alloc] initWithDeviceInfo:v4 server:v7];
    [(EasyConfigDevice *)v8 setPairingDelegate:&v16];

    return v8;
  }
  else
  {
    uint64_t v10 = (HAPWACAccessoryClient *)_HMFPreconditionFailure();
    return [(HAPWACAccessoryClient *)v10 initWithWACAccessory:v12 server:v13 browser:v14 compatible2Pt4Networks:v15];
  }
}

- (HAPWACAccessoryClient)initWithWACAccessory:(id)a3 server:(id)a4 browser:(id)a5 compatible2Pt4Networks:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)HAPWACAccessoryClient;
  id v15 = [(HAPWACAccessoryClient *)&v26 init];
  long long v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_hapWACAccessory, a3);
    uint64_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("HAPWACAccessoryClient", v17);
    workQueue = v16->_workQueue;
    v16->_workQueue = (OS_dispatch_queue *)v18;

    currentNetworkInfo = v16->_currentNetworkInfo;
    v16->_currentNetworkInfo = 0;

    objc_storeWeak((id *)&v16->_server, v12);
    objc_storeWeak((id *)&v16->_browser, v13);
    objc_storeStrong((id *)&v16->_compatible2Pt4Networks, a6);
    compatiblePrefixedNetwork = v16->_compatiblePrefixedNetwork;
    v16->_compatiblePrefixedNetwork = 0;

    v16->_metricSubmitted = 0;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __84__HAPWACAccessoryClient_initWithWACAccessory_server_browser_compatible2Pt4Networks___block_invoke;
    v23[3] = &unk_1E69F46E0;
    uint64_t v24 = v16;
    id v25 = v11;
    __84__HAPWACAccessoryClient_initWithWACAccessory_server_browser_compatible2Pt4Networks___block_invoke((uint64_t)v23);
  }
  return v16;
}

void __84__HAPWACAccessoryClient_initWithWACAccessory_server_browser_compatible2Pt4Networks___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) server];
  id v13 = [v2 pairingActivity];

  if (v13)
  {
    [*(id *)(a1 + 40) wacCategory];

    id v3 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "version"));
    [*(id *)(a1 + 40) supportsLegacyWAC];
    id v4 = (id)HMFBooleanToString();
    id v5 = HAPAuthFeaturesToString([*(id *)(a1 + 40) authFeatures]);
    [*(id *)(a1 + 40) supportedWiFiBands];
    id v6 = (id)HMFBooleanToString();
    [*(id *)(a1 + 40) supportedWiFiBands];
    id v7 = (id)HMFBooleanToString();
    [*(id *)(a1 + 40) supportsTokenAuth];
    id v8 = (id)HMFBooleanToString();
    [*(id *)(a1 + 40) supportsCertAuth];
    id v9 = (id)HMFBooleanToString();
    [*(id *)(a1 + 40) isAirPlayAccessory];
    id v10 = (id)HMFBooleanToString();
    [*(id *)(a1 + 40) isHomeKitAccessory];
    id v11 = (id)HMFBooleanToString();
    [*(id *)(a1 + 40) requiresOwnershipToken];
    id v12 = (id)HMFBooleanToString();
  }
}

- (HAPWACAccessoryClient)init
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t48 != -1) {
    dispatch_once(&logCategory__hmf_once_t48, &__block_literal_global_5889);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v49;

  return v2;
}

uint64_t __36__HAPWACAccessoryClient_logCategory__block_invoke()
{
  logCategory__hmf_once___int16 v49 = HMFCreateOSLogHandle();

  return MEMORY[0x1F41817F8]();
}

@end