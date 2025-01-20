@interface HMDAppleMediaAccessoryInfoController
+ (id)logCategory;
- (HMDAppleMediaAccessoryInfoController)initWithQueue:(id)a3 dataSource:(id)a4 delegate:(id)a5 notificationCenter:(id)a6 wifiManager:(id)a7;
- (HMDAppleMediaAccessoryInfoControllerDataSource)dataSource;
- (HMDAppleMediaAccessoryInfoControllerDelegate)delegate;
- (HMFWiFiManager)wifiManager;
- (HMFWiFiNetworkInfo)lastWifiNetworkInfo;
- (NSNotificationCenter)notificationCenter;
- (OS_dispatch_queue)queue;
- (id)currentWifiNetworkInfo;
- (void)_notifyDelegateWifiInfoUpdated:(id)a3;
- (void)_postUpdateSoftwareVersionIfDifferent:(id)a3;
- (void)_postUpdateWifiNetworkInfoIfDifferent:(id)a3;
- (void)configure;
- (void)handleCurrentNetworkChangedNotification:(id)a3;
- (void)setLastWifiNetworkInfo:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setWifiManager:(id)a3;
@end

@implementation HMDAppleMediaAccessoryInfoController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_lastWifiNetworkInfo, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setWifiManager:(id)a3
{
}

- (HMFWiFiManager)wifiManager
{
  return (HMFWiFiManager *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastWifiNetworkInfo:(id)a3
{
}

- (HMFWiFiNetworkInfo)lastWifiNetworkInfo
{
  return (HMFWiFiNetworkInfo *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNotificationCenter:(id)a3
{
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 32, 1);
}

- (HMDAppleMediaAccessoryInfoControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDAppleMediaAccessoryInfoControllerDelegate *)WeakRetained;
}

- (HMDAppleMediaAccessoryInfoControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDAppleMediaAccessoryInfoControllerDataSource *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)_notifyDelegateWifiInfoUpdated:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4 && ([v4 SSID], v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    v7 = [(HMDAppleMediaAccessoryInfoController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      v8 = [(HMDAppleMediaAccessoryInfoController *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __71__HMDAppleMediaAccessoryInfoController__notifyDelegateWifiInfoUpdated___block_invoke;
      block[3] = &unk_1E6A19668;
      block[4] = self;
      id v14 = v5;
      id v15 = v7;
      dispatch_async(v8, block);
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1D9452090]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v17 = v12;
      __int16 v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Trying to notify with invalid WiFi info: %@", buf, 0x16u);
    }
  }
}

uint64_t __71__HMDAppleMediaAccessoryInfoController__notifyDelegateWifiInfoUpdated___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate to update WiFi info: %@ ", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) accessoryInfoController:*(void *)(a1 + 32) didUpdateWifiInfo:*(void *)(a1 + 40)];
}

- (void)_postUpdateSoftwareVersionIfDifferent:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(HMDAppleMediaAccessoryInfoController *)self queue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__HMDAppleMediaAccessoryInfoController__postUpdateSoftwareVersionIfDifferent___block_invoke;
    v10[3] = &unk_1E6A197C8;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v5, v10);
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1D9452090]();
    v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v13 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Error posting software version update: object is nil", buf, 0xCu);
    }
  }
}

void __78__HMDAppleMediaAccessoryInfoController__postUpdateSoftwareVersionIfDifferent___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void **)(a1 + 40);
    v7 = [v6 buildVersion];
    *(_DWORD *)buf = 138543874;
    v38 = v5;
    __int16 v39 = 2112;
    v40 = v6;
    __int16 v41 = 2112;
    v42 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Posting updated software version: %@ (%@)", buf, 0x20u);
  }
  int v8 = [*(id *)(a1 + 32) dataSource];
  v9 = [v8 accessoryInfoControllerSoftwareVersionTopicForController:*(void *)(a1 + 32)];
  __int16 v10 = [v8 eventStoreReadHandle];
  id v11 = [v10 lastEventForTopic:v9];
  if (!v11)
  {
    v34 = v10;
LABEL_13:
    uint64_t v14 = 0;
LABEL_15:
    v25 = objc_msgSend(v8, "eventSourceIdentifierNameForAccessoryInfoController:", *(void *)(a1 + 32), v34);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v27 = v26;
    v28 = (void *)[objc_alloc(MEMORY[0x1E4F2E5C0]) initWithSoftwareVersion:*(void *)(a1 + 40)];
    v29 = (void *)[objc_alloc(MEMORY[0x1E4F69F48]) initWithSource:v25 cachePolicy:2 combineType:2 timestamp:v27];
    id v30 = objc_alloc(MEMORY[0x1E4F69F38]);
    v31 = [v28 protoData];
    v32 = (void *)[v30 initWithEventData:v31 metadata:v29];

    v33 = [v8 eventForwarder];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __78__HMDAppleMediaAccessoryInfoController__postUpdateSoftwareVersionIfDifferent___block_invoke_10;
    v36[3] = &unk_1E6A197F0;
    v36[4] = *(void *)(a1 + 32);
    [v33 forwardEvent:v32 topic:v9 completion:v36];

    __int16 v10 = v35;
    goto LABEL_16;
  }
  id v12 = objc_alloc(MEMORY[0x1E4F2E5C0]);
  v13 = [v11 encodedData];
  uint64_t v14 = (void *)[v12 initWithProtoData:v13];

  if (!v14)
  {
    v21 = (void *)MEMORY[0x1D9452090]();
    id v22 = *(id *)(a1 + 32);
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v38 = v24;
      __int16 v39 = 2112;
      v40 = v9;
      __int16 v41 = 2112;
      v42 = 0;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Error reading stored software version for topic %@, error: %@", buf, 0x20u);
    }
    v34 = v10;

    goto LABEL_13;
  }
  id v15 = [v14 softwareVersion];
  int v16 = [v15 isEqual:*(void *)(a1 + 40)];

  if (!v16)
  {
    v34 = v10;
    goto LABEL_15;
  }
  v17 = (void *)MEMORY[0x1D9452090]();
  id v18 = *(id *)(a1 + 32);
  v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v38 = v20;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Skip sending event update for software version as it matches stored", buf, 0xCu);
  }
LABEL_16:
}

void __78__HMDAppleMediaAccessoryInfoController__postUpdateSoftwareVersionIfDifferent___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error in forwarding the software version info event: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_postUpdateWifiNetworkInfoIfDifferent:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4 && ([v4 SSID], uint64_t v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    v7 = [(HMDAppleMediaAccessoryInfoController *)self queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __78__HMDAppleMediaAccessoryInfoController__postUpdateWifiNetworkInfoIfDifferent___block_invoke;
    v12[3] = &unk_1E6A197C8;
    v12[4] = self;
    id v13 = v5;
    dispatch_async(v7, v12);
  }
  else
  {
    int v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v15 = v11;
      __int16 v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Trying to post invalid WiFi info: %@", buf, 0x16u);
    }
  }
}

void __78__HMDAppleMediaAccessoryInfoController__postUpdateWifiNetworkInfoIfDifferent___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = [*(id *)(a1 + 40) SSID];
    v7 = [*(id *)(a1 + 40) MACAddress];
    int v8 = [v7 formattedString];
    *(_DWORD *)buf = 138543874;
    v40 = v5;
    __int16 v41 = 2112;
    v42 = v6;
    __int16 v43 = 2112;
    v44 = v8;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Posting updated WiFi: SSID: %@, MAC: %@", buf, 0x20u);
  }
  v9 = [*(id *)(a1 + 32) dataSource];
  __int16 v10 = [v9 accessoryInfoControllerTopicForWifiInfo];
  id v11 = [v9 eventStoreReadHandle];
  uint64_t v12 = [v11 lastEventForTopic:v10];
  if (!v12)
  {
    v36 = v11;
LABEL_13:
    id v15 = 0;
LABEL_15:
    double v27 = objc_msgSend(v9, "eventSourceIdentifierNameForAccessoryInfoController:", *(void *)(a1 + 32), v36);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v29 = v28;
    id v30 = (void *)[objc_alloc(MEMORY[0x1E4F2E5C8]) initWithWifiNetworkInfo:*(void *)(a1 + 40)];
    v31 = (void *)[objc_alloc(MEMORY[0x1E4F69F48]) initWithSource:v27 cachePolicy:2 combineType:2 timestamp:v29];
    id v32 = objc_alloc(MEMORY[0x1E4F69F38]);
    v33 = [v30 protoData];
    v34 = (void *)[v32 initWithEventData:v33 metadata:v31];

    v35 = [v9 eventForwarder];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __78__HMDAppleMediaAccessoryInfoController__postUpdateWifiNetworkInfoIfDifferent___block_invoke_7;
    v38[3] = &unk_1E6A197F0;
    v38[4] = *(void *)(a1 + 32);
    [v35 forwardEvent:v34 topic:v10 completion:v38];

    id v11 = v37;
    goto LABEL_16;
  }
  id v13 = objc_alloc(MEMORY[0x1E4F2E5C8]);
  uint64_t v14 = [v12 encodedData];
  id v15 = (void *)[v13 initWithProtoData:v14];

  if (!v15)
  {
    v23 = (void *)MEMORY[0x1D9452090]();
    id v24 = *(id *)(a1 + 32);
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      double v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v40 = v26;
      __int16 v41 = 2112;
      v42 = v10;
      __int16 v43 = 2112;
      v44 = 0;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Error reading stored setting for topic %@, error: %@", buf, 0x20u);
    }
    v36 = v11;

    goto LABEL_13;
  }
  __int16 v16 = [v15 networkSSID];
  v17 = [*(id *)(a1 + 40) SSID];
  int v18 = [v16 isEqualToString:v17];

  if (!v18)
  {
    v36 = v11;
    goto LABEL_15;
  }
  v19 = (void *)MEMORY[0x1D9452090]();
  id v20 = *(id *)(a1 + 32);
  v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    id v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v40 = v22;
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Skip sending event update for WiFi as it matches stored", buf, 0xCu);
  }
LABEL_16:
}

void __78__HMDAppleMediaAccessoryInfoController__postUpdateWifiNetworkInfoIfDifferent___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error in forwarding the WiFi network info event: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (id)currentWifiNetworkInfo
{
  id v3 = [(HMDAppleMediaAccessoryInfoController *)self wifiManager];
  id v4 = [v3 MACAddress];

  id v5 = [(HMDAppleMediaAccessoryInfoController *)self wifiManager];
  uint64_t v6 = [v5 currentNetworkSSID];

  v7 = [(HMDAppleMediaAccessoryInfoController *)self wifiManager];
  int v8 = [v7 currentNetworkAssociation];

  id v9 = objc_alloc(MEMORY[0x1E4F655A0]);
  __int16 v10 = [v8 BSSID];
  id v11 = [v10 formattedString];
  uint64_t v12 = [v8 gatewayIPAddress];
  id v13 = [v8 gatewayMACAddress];
  uint64_t v14 = [v13 formattedString];
  id v15 = (void *)[v9 initWithMACAddress:v4 SSID:v6 BSSID:v11 gatewayIPAddress:v12 gatewayMACAddress:v14];

  return v15;
}

- (void)handleCurrentNetworkChangedNotification:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  uint64_t v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = HMFGetLogIdentifier();
    int v19 = 138543618;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Received current network changed notification: %@", (uint8_t *)&v19, 0x16u);
  }
  uint64_t v9 = [(HMDAppleMediaAccessoryInfoController *)v6 lastWifiNetworkInfo];
  if (v9)
  {
    __int16 v10 = (void *)v9;
    id v11 = [(HMDAppleMediaAccessoryInfoController *)v6 lastWifiNetworkInfo];
    uint64_t v12 = [v11 SSID];
    id v13 = [(HMDAppleMediaAccessoryInfoController *)v6 wifiManager];
    uint64_t v14 = [v13 currentNetworkSSID];
    char v15 = [v12 isEqualToString:v14];

    if ((v15 & 1) == 0)
    {
      __int16 v16 = [(HMDAppleMediaAccessoryInfoController *)v6 currentWifiNetworkInfo];
      [(HMDAppleMediaAccessoryInfoController *)v6 setLastWifiNetworkInfo:v16];

      v17 = [(HMDAppleMediaAccessoryInfoController *)v6 lastWifiNetworkInfo];
      [(HMDAppleMediaAccessoryInfoController *)v6 _notifyDelegateWifiInfoUpdated:v17];

      int v18 = [(HMDAppleMediaAccessoryInfoController *)v6 lastWifiNetworkInfo];
      [(HMDAppleMediaAccessoryInfoController *)v6 _postUpdateWifiNetworkInfoIfDifferent:v18];
    }
  }
}

- (void)configure
{
  id v3 = [(HMDAppleMediaAccessoryInfoController *)self currentWifiNetworkInfo];
  [(HMDAppleMediaAccessoryInfoController *)self setLastWifiNetworkInfo:v3];

  id v4 = [(HMDAppleMediaAccessoryInfoController *)self lastWifiNetworkInfo];
  [(HMDAppleMediaAccessoryInfoController *)self _notifyDelegateWifiInfoUpdated:v4];

  id v5 = [(HMDAppleMediaAccessoryInfoController *)self lastWifiNetworkInfo];
  [(HMDAppleMediaAccessoryInfoController *)self _postUpdateWifiNetworkInfoIfDifferent:v5];

  uint64_t v6 = [(HMDAppleMediaAccessoryInfoController *)self dataSource];
  v7 = [v6 currentAccessorySoftwareVersion];
  [(HMDAppleMediaAccessoryInfoController *)self _postUpdateSoftwareVersionIfDifferent:v7];

  int v8 = [(HMDAppleMediaAccessoryInfoController *)self notificationCenter];
  uint64_t v9 = *MEMORY[0x1E4F653E8];
  [v8 removeObserver:self name:*MEMORY[0x1E4F653E8] object:0];

  id v10 = [(HMDAppleMediaAccessoryInfoController *)self notificationCenter];
  [v10 addObserver:self selector:sel_handleCurrentNetworkChangedNotification_ name:v9 object:0];
}

- (HMDAppleMediaAccessoryInfoController)initWithQueue:(id)a3 dataSource:(id)a4 delegate:(id)a5 notificationCenter:(id)a6 wifiManager:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDAppleMediaAccessoryInfoController;
  int v18 = [(HMDAppleMediaAccessoryInfoController *)&v21 init];
  int v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeWeak((id *)&v19->_dataSource, v14);
    objc_storeWeak((id *)&v19->_delegate, v15);
    objc_storeStrong((id *)&v19->_notificationCenter, a6);
    objc_storeStrong((id *)&v19->_wifiManager, a7);
  }

  return v19;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t13 != -1) {
    dispatch_once(&logCategory__hmf_once_t13, &__block_literal_global_50044);
  }
  v2 = (void *)logCategory__hmf_once_v14;
  return v2;
}

uint64_t __51__HMDAppleMediaAccessoryInfoController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v14;
  logCategory__hmf_once_id v14 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end