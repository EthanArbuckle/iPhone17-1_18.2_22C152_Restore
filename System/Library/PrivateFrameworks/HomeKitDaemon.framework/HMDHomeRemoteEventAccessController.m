@interface HMDHomeRemoteEventAccessController
- (BOOL)isAppleMediaAccessoryUUID:(id)a3 error:(id *)a4;
- (BOOL)isMediaSystemUUID:(id)a3 error:(id *)a4;
- (BOOL)isSiriEndpointAccessoryUUID:(id)a3 error:(id *)a4;
- (BOOL)remoteEventAllowForMediaSystemSettingEventTopic:(id)a3 deviceType:(unint64_t)a4 userType:(unint64_t)a5;
- (BOOL)remoteEventAllowedForAccessoryEventTopic:(id)a3 parsedEventTopic:(id)a4 deviceType:(unint64_t)a5 userType:(unint64_t)a6;
- (BOOL)remoteEventAllowedForAccessoryInfoWithTopicSuffix:(id)a3 deviceType:(unint64_t)a4 userType:(unint64_t)a5;
- (BOOL)remoteEventAllowedForHomeEventTopic:(id)a3 parsedEventTopic:(id)a4 deviceType:(unint64_t)a5 userType:(unint64_t)a6;
- (BOOL)remoteEventAllowedForTopic:(id)a3 deviceType:(unint64_t)a4 userType:(unint64_t)a5;
- (HMDAccessorySettingsEventHelper)settingsHelper;
- (HMDHomeRemoteEventAccessController)initWithDataSource:(id)a3;
- (HMDHomeRemoteEventAccessControllerDataSource)dataSource;
@end

@implementation HMDHomeRemoteEventAccessController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsHelper, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (HMDAccessorySettingsEventHelper)settingsHelper
{
  return self->_settingsHelper;
}

- (HMDHomeRemoteEventAccessControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDHomeRemoteEventAccessControllerDataSource *)WeakRetained;
}

- (BOOL)isMediaSystemUUID:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(HMDHomeRemoteEventAccessController *)self dataSource];
  v8 = v7;
  if (v7)
  {
    char v9 = [v7 isMediaSystem:v6];
  }
  else
  {
    v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      int v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine media system existence due to no data source", (uint8_t *)&v15, 0xCu);
    }
    if (a4)
    {
      [MEMORY[0x263F087E8] hmfErrorWithCode:4];
      char v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (BOOL)isSiriEndpointAccessoryUUID:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(HMDHomeRemoteEventAccessController *)self dataSource];
  v8 = v7;
  if (v7)
  {
    char v9 = [v7 isSidekickAccessory:v6];
  }
  else
  {
    v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      int v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine allowed remote event due to no data source", (uint8_t *)&v15, 0xCu);
    }
    if (a4)
    {
      [MEMORY[0x263F087E8] hmfErrorWithCode:4];
      char v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (BOOL)isAppleMediaAccessoryUUID:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(HMDHomeRemoteEventAccessController *)self dataSource];
  v8 = v7;
  if (v7)
  {
    char v9 = [v7 isAppleMediaAccessory:v6];
  }
  else
  {
    v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      int v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine allowed remote event due to no data source", (uint8_t *)&v15, 0xCu);
    }
    if (a4)
    {
      [MEMORY[0x263F087E8] hmfErrorWithCode:4];
      char v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (BOOL)remoteEventAllowedForAccessoryInfoWithTopicSuffix:(id)a3 deviceType:(unint64_t)a4 userType:(unint64_t)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (v8)
  {
    char v9 = +[HMDAccessoryEventsGenerated topicMap];
    v10 = [v9 objectForKeyedSubscript:v8];
    v11 = [v10 objectForKeyedSubscript:@"remoteUserAccessControl"];

    v12 = +[HMDAccessoryEventsGenerated topicMap];
    v13 = [v12 objectForKeyedSubscript:v8];
    v14 = [v13 objectForKeyedSubscript:@"remoteDeviceAccessControl"];

    if (v11 && v14)
    {
      if ((+[HMDRemoteEventRouterAccessControl remoteUserAccessControlFromNumber:v11] & a5) != 0)
      {
        BOOL v15 = (+[HMDRemoteEventRouterAccessControl remoteDeviceAccessControlFromNumber:v14] & a4) != 0;
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      v20 = (void *)MEMORY[0x230FBD990]();
      v21 = self;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = HMFGetLogIdentifier();
        int v25 = 138543618;
        v26 = v23;
        __int16 v27 = 2112;
        id v28 = v8;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to get remove event allowed due to no ACL for accessory info topicSuffix: %@", (uint8_t *)&v25, 0x16u);
      }
    }
    BOOL v15 = 0;
    goto LABEL_13;
  }
  v16 = (void *)MEMORY[0x230FBD990]();
  uint64_t v17 = self;
  v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v19 = HMFGetLogIdentifier();
    int v25 = 138543362;
    v26 = v19;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to get remove event allowed due to no topicSuffix", (uint8_t *)&v25, 0xCu);
  }
  BOOL v15 = 0;
LABEL_14:

  return v15;
}

- (BOOL)remoteEventAllowedForHomeEventTopic:(id)a3 parsedEventTopic:(id)a4 deviceType:(unint64_t)a5 userType:(unint64_t)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v12 = [v11 topicSuffix];

  if (v12)
  {
    v13 = +[HMDHomeEventsGenerated topicMap];
    v14 = [v11 topicSuffix];
    BOOL v15 = [v13 objectForKeyedSubscript:v14];
    v16 = [v15 objectForKeyedSubscript:@"remoteUserAccessControl"];

    uint64_t v17 = +[HMDHomeEventsGenerated topicMap];
    v18 = [v11 topicSuffix];
    v19 = [v17 objectForKeyedSubscript:v18];
    v20 = [v19 objectForKeyedSubscript:@"remoteDeviceAccessControl"];

    if (v16 && v20)
    {
      if ((+[HMDRemoteEventRouterAccessControl remoteUserAccessControlFromNumber:v16] & a6) != 0)
      {
        BOOL v21 = (+[HMDRemoteEventRouterAccessControl remoteDeviceAccessControlFromNumber:v20] & a5) != 0;
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      v26 = (void *)MEMORY[0x230FBD990]();
      __int16 v27 = self;
      id v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = HMFGetLogIdentifier();
        v30 = [v11 topicSuffix];
        int v32 = 138543618;
        v33 = v29;
        __int16 v34 = 2112;
        v35 = v30;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to get remove event allowed due to no ACL for home topic suffix: %@", (uint8_t *)&v32, 0x16u);
      }
    }
    BOOL v21 = 0;
    goto LABEL_13;
  }
  v22 = (void *)MEMORY[0x230FBD990]();
  v23 = self;
  v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    int v25 = HMFGetLogIdentifier();
    int v32 = 138543362;
    v33 = v25;
    _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to get remove event allowed due to no accessory topic suffix", (uint8_t *)&v32, 0xCu);
  }
  BOOL v21 = 0;
LABEL_14:

  return v21;
}

- (BOOL)remoteEventAllowedForAccessoryEventTopic:(id)a3 parsedEventTopic:(id)a4 deviceType:(unint64_t)a5 userType:(unint64_t)a6
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v12 = [v10 accessoryUUID];
  id v50 = 0;
  BOOL v13 = [(HMDHomeRemoteEventAccessController *)self isAppleMediaAccessoryUUID:v12 error:&v50];
  id v14 = v50;
  id v49 = v14;
  BOOL v15 = [(HMDHomeRemoteEventAccessController *)self isSiriEndpointAccessoryUUID:v12 error:&v49];
  id v16 = v49;

  if (v16)
  {
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v52 = v20;
      __int16 v53 = 2112;
      id v54 = v16;
      BOOL v21 = "%{public}@Failed to get remote event allowed due to known accessory type with error: %@";
      v22 = v19;
      uint32_t v23 = 22;
LABEL_9:
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v13 || v15)
  {
    v24 = [v11 asAccessorySettingTopic];
    if (v24)
    {
      int v25 = [(HMDHomeRemoteEventAccessController *)self settingsHelper];
      v26 = [v24 accessorySettingKeyPath];
      char v27 = [v25 remoteEventAllowedForKeyPath:v26 deviceType:a5 userType:a6];

LABEL_25:
      goto LABEL_11;
    }
    uint64_t v29 = [v11 topicSuffix];

    if (!v29)
    {
      v37 = (void *)MEMORY[0x230FBD990]();
      v38 = self;
      v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v40 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v52 = v40;
        _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to get remove event allowed due to no accessory topic suffix", buf, 0xCu);
      }
      char v27 = 0;
      goto LABEL_25;
    }
    v30 = +[HMDAccessoryEventsGenerated topicMap];
    v31 = [v11 topicSuffix];
    int v32 = [v30 objectForKeyedSubscript:v31];
    v48 = [v32 objectForKeyedSubscript:@"remoteUserAccessControl"];

    v46 = +[HMDAccessoryEventsGenerated topicMap];
    v33 = [v11 topicSuffix];
    __int16 v34 = [v46 objectForKeyedSubscript:v33];
    uint64_t v35 = [v34 objectForKeyedSubscript:@"remoteDeviceAccessControl"];

    uint64_t v36 = (void *)v35;
    if (v48 && v35)
    {
      if ((+[HMDRemoteEventRouterAccessControl remoteUserAccessControlFromNumber:v48] & a6) != 0)
      {
        char v27 = (+[HMDRemoteEventRouterAccessControl remoteDeviceAccessControlFromNumber:v35] & a5) != 0;
LABEL_24:
        v24 = 0;

        goto LABEL_25;
      }
    }
    else
    {
      v41 = (void *)MEMORY[0x230FBD990]();
      v42 = self;
      v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v44 = HMFGetLogIdentifier();
        [v11 topicSuffix];
        v45 = v47 = v36;
        *(_DWORD *)buf = 138543618;
        v52 = v44;
        __int16 v53 = 2112;
        id v54 = v45;
        _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to get remove event allowed due to no ACL for accessory topic suffix: %@", buf, 0x16u);

        uint64_t v36 = v47;
      }
    }
    char v27 = 0;
    goto LABEL_24;
  }
  uint64_t v17 = (void *)MEMORY[0x230FBD990]();
  v18 = self;
  v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v52 = v20;
    BOOL v21 = "%{public}@Failed to determine remote event allowed for non-supported accessory";
    v22 = v19;
    uint32_t v23 = 12;
    goto LABEL_9;
  }
LABEL_10:

  char v27 = 0;
LABEL_11:

  return v27;
}

- (BOOL)remoteEventAllowForMediaSystemSettingEventTopic:(id)a3 deviceType:(unint64_t)a4 userType:(unint64_t)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  char v9 = [v8 mediaSystemUUID];
  id v23 = 0;
  BOOL v10 = [(HMDHomeRemoteEventAccessController *)self isMediaSystemUUID:v9 error:&v23];
  id v11 = v23;
  if (v11)
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    BOOL v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      BOOL v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v25 = v15;
      __int16 v26 = 2112;
      id v27 = v11;
      id v16 = "%{public}@Failed to get remote event allowed for media system with error: %@";
      uint64_t v17 = v14;
      uint32_t v18 = 22;
LABEL_8:
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if (!v10)
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    BOOL v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      BOOL v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v25 = v15;
      id v16 = "%{public}@Failed to determine remote event allowed for unknown media system";
      uint64_t v17 = v14;
      uint32_t v18 = 12;
      goto LABEL_8;
    }
LABEL_9:

    char v21 = 0;
    goto LABEL_10;
  }
  v19 = [(HMDHomeRemoteEventAccessController *)self settingsHelper];
  v20 = [v8 mediaSystemSettingKeyPath];
  char v21 = [v19 remoteEventAllowedForKeyPath:v20 deviceType:a4 userType:a5];

LABEL_10:
  return v21;
}

- (BOOL)remoteEventAllowedForTopic:(id)a3 deviceType:(unint64_t)a4 userType:(unint64_t)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  char v9 = [MEMORY[0x263F0E300] decodeTopic:v8];
  BOOL v10 = v9;
  if (v9)
  {
    id v11 = [v9 asAccessoryTopic];
    if (v11)
    {
      BOOL v12 = [(HMDHomeRemoteEventAccessController *)self remoteEventAllowedForAccessoryEventTopic:v11 parsedEventTopic:v10 deviceType:a4 userType:a5];
    }
    else
    {
      uint64_t v17 = [v10 asMediaSystemSettingTopic];
      if (v17)
      {
        BOOL v12 = [(HMDHomeRemoteEventAccessController *)self remoteEventAllowForMediaSystemSettingEventTopic:v17 deviceType:a4 userType:a5];
      }
      else
      {
        uint32_t v18 = [v10 asHomeEventTopic];
        if (v18)
        {
          BOOL v12 = [(HMDHomeRemoteEventAccessController *)self remoteEventAllowedForHomeEventTopic:v18 parsedEventTopic:v10 deviceType:a4 userType:a5];
        }
        else
        {
          v19 = (void *)MEMORY[0x230FBD990]();
          v20 = self;
          char v21 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v22 = HMFGetLogIdentifier();
            int v24 = 138543874;
            int v25 = v22;
            __int16 v26 = 2112;
            id v27 = v10;
            __int16 v28 = 2112;
            id v29 = v8;
            _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine remote event allowed due to unknown parsed topic: %@ with topic: %@", (uint8_t *)&v24, 0x20u);
          }
          BOOL v12 = 0;
        }
      }
    }
  }
  else
  {
    BOOL v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = self;
    BOOL v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v16 = HMFGetLogIdentifier();
      int v24 = 138543618;
      int v25 = v16;
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Failed to determine allowed remote event due to unparsable topic: %@", (uint8_t *)&v24, 0x16u);
    }
    BOOL v12 = 0;
  }

  return v12;
}

- (HMDHomeRemoteEventAccessController)initWithDataSource:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDHomeRemoteEventAccessController;
  v5 = [(HMDHomeRemoteEventAccessController *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataSource, v4);
    v7 = objc_alloc_init(HMDAccessorySettingsEventHelper);
    settingsHelper = v6->_settingsHelper;
    v6->_settingsHelper = v7;
  }
  return v6;
}

@end