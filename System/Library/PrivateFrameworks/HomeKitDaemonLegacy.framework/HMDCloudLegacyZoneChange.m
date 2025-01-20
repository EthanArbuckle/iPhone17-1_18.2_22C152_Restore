@interface HMDCloudLegacyZoneChange
- (BOOL)controllerIdentifierChanged;
- (BOOL)decryptionFailed;
- (HMDCloudLegacyZoneChange)initWithZone:(id)a3 temporaryCache:(BOOL)a4;
@end

@implementation HMDCloudLegacyZoneChange

- (BOOL)controllerIdentifierChanged
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCloudZoneChange *)self cloudZone];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    v6 = [(HMDCloudZoneChange *)self rootGroupChange];
    v7 = [v5 homeDataObjectID];
    v8 = [v6 changeWithObjectID:v7];

    if (v8
      && ([v8 isDeleted] & 1) == 0
      && ([v8 cloudRecord],
          v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = [v9 controllerIdentifierChanged],
          v9,
          (v10 & 1) != 0))
    {
      char v11 = 1;
    }
    else
    {
      v12 = [(HMDCloudZoneChange *)self rootGroupChange];
      v13 = [v5 homeDataV3ObjectID];
      v14 = [v12 changeWithObjectID:v13];

      if (v8 && ([v14 isDeleted] & 1) == 0)
      {
        v19 = [v14 cloudRecord];
        char v11 = [v19 controllerIdentifierChanged];
      }
      else
      {
        char v11 = 0;
      }
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1D9452090]();
    v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      int v21 = 138543362;
      v22 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine cloud zone", (uint8_t *)&v21, 0xCu);
    }
    char v11 = 0;
  }

  return v11;
}

- (BOOL)decryptionFailed
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCloudZoneChange *)self cloudZone];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    v6 = [(HMDCloudZoneChange *)self rootGroupChange];
    v7 = [v5 homeDataObjectID];
    v8 = [v6 changeWithObjectID:v7];

    v9 = [(HMDCloudZoneChange *)self rootGroupChange];
    char v10 = [v5 homeDataV3ObjectID];
    char v11 = [v9 changeWithObjectID:v10];

    if (v8)
    {
      if (([v8 isDeleted] & 1) == 0)
      {
        v12 = [v8 cloudRecord];
        int v13 = [v12 decryptionFailed];

        if (v13)
        {
          if (!v11)
          {
            char v14 = 1;
LABEL_16:

            goto LABEL_17;
          }
          goto LABEL_14;
        }
      }
    }
    else if (v11)
    {
LABEL_14:
      if (([v11 isDeleted] & 1) == 0)
      {
        v20 = [v11 cloudRecord];
        char v14 = [v20 decryptionFailed];

        goto LABEL_16;
      }
    }
    char v14 = 0;
    goto LABEL_16;
  }
  v15 = (void *)MEMORY[0x1D9452090]();
  v16 = self;
  v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = HMFGetLogIdentifier();
    int v21 = 138543362;
    v22 = v18;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine cloud zone", (uint8_t *)&v21, 0xCu);
  }
  char v14 = 0;
LABEL_17:

  return v14;
}

- (HMDCloudLegacyZoneChange)initWithZone:(id)a3 temporaryCache:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    v15.receiver = self;
    v15.super_class = (Class)HMDCloudLegacyZoneChange;
    v9 = [(HMDCloudZoneChange *)&v15 initWithZone:v8 temporaryCache:v4];
    char v10 = v9;
  }
  else
  {
    char v11 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Not a legacy zone %@", buf, 0x16u);
    }
    char v10 = 0;
  }

  return v10;
}

@end