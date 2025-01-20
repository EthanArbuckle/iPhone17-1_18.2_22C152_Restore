@interface CLLocation(HMFObject)
+ (NSString)shortDescription;
+ (id)logCategory;
- (id)attributeDescriptions;
- (id)shortDescription;
- (uint64_t)description;
- (uint64_t)isLocationSimulatedBasedOnCarPlay;
- (uint64_t)isSimulated;
@end

@implementation CLLocation(HMFObject)

- (uint64_t)isLocationSimulatedBasedOnCarPlay
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v2 = [a1 timestamp];

  if (v2)
  {
    v3 = +[HMDLocation sharedManager];
    int v4 = [v3 isCarPlayConnected];

    if (v4)
    {
      v5 = (void *)MEMORY[0x1D9452090]();
      id v6 = a1;
      v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = HMFGetLogIdentifier();
        int v28 = 138543362;
        v29 = v8;
        _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@CarPlay session is connected right now. Trusting this location", (uint8_t *)&v28, 0xCu);
      }
      return 0;
    }
    v14 = +[HMDLocation sharedManager];
    v15 = [v14 lastCarPlaySessionDisconnectionTimeStamp];

    if (v15)
    {
      v16 = [a1 timestamp];
      [v16 timeIntervalSinceDate:v15];
      double v18 = fabs(v17);

      if (v18 <= 300.0 || fabs(v18 + -300.0) < 2.22044605e-16)
      {
        uint64_t v9 = 0;
LABEL_18:

        return v9;
      }
      v19 = (void *)MEMORY[0x1D9452090]();
      id v20 = a1;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = HMFGetLogIdentifier();
        v23 = [v20 timestamp];
        v24 = [NSNumber numberWithDouble:v18];
        int v28 = 138544130;
        v29 = v22;
        __int16 v30 = 2112;
        v31 = v15;
        __int16 v32 = 2112;
        v33 = v23;
        __int16 v34 = 2112;
        v35 = v24;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@It was a while between disconnecting the CarPlay session and when this location was determined. Considering this location as simulated. Last active CarPlay session: [%@], location timestamp: [%@], timeDiff: %@", (uint8_t *)&v28, 0x2Au);
      }
    }
    else
    {
      v19 = (void *)MEMORY[0x1D9452090]();
      id v25 = a1;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v26 = HMFGetLogIdentifier();
        int v28 = 138543362;
        v29 = v26;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@We do not know whether there was any active car play session in the past from last homed boot. Considering this location as simulated", (uint8_t *)&v28, 0xCu);
      }
    }

    uint64_t v9 = 1;
    goto LABEL_18;
  }
  v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = a1;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = HMFGetLogIdentifier();
    int v28 = 138543362;
    v29 = v13;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@CLLocation timestamp is nil. We don't know whether we can trust it. Considering this location as simulated", (uint8_t *)&v28, 0xCu);
  }
  return 1;
}

- (uint64_t)isSimulated
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F65530] sharedPreferences];
  v3 = [v2 preferenceForKey:@"allowLocationSimulation"];
  int v4 = [v3 BOOLValue];

  if (!v4)
  {
    v10 = [a1 sourceInformation];
    id v11 = (void *)MEMORY[0x1D9452090]();
    if (v10)
    {
      if ([v10 isSimulatedBySoftware])
      {
        v12 = (void *)MEMORY[0x1D9452090]();
        id v13 = a1;
        v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = HMFGetLogIdentifier();
          int v20 = 138543362;
          v21 = v15;
          _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@CLLocation is simulated by the software", (uint8_t *)&v20, 0xCu);
        }
        uint64_t v9 = 1;
        goto LABEL_15;
      }
      if ([v10 isProducedByAccessory])
      {
        uint64_t v9 = [a1 isLocationSimulatedBasedOnCarPlay];
LABEL_15:
LABEL_17:

        return v9;
      }
    }
    else
    {
      id v16 = a1;
      double v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        double v18 = HMFGetLogIdentifier();
        int v20 = 138543362;
        v21 = v18;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@CLLocation does not contain the location source information", (uint8_t *)&v20, 0xCu);
      }
    }
    uint64_t v9 = 0;
    goto LABEL_17;
  }
  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = a1;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v20 = 138543362;
    v21 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Not checking for location simulation due to override", (uint8_t *)&v20, 0xCu);
  }
  return 0;
}

- (id)attributeDescriptions
{
  v24[5] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F65538] defaultFormatter];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  int v4 = NSNumber;
  [a1 coordinate];
  v23 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v22 = (void *)[v3 initWithName:@"Latitude" value:v23 options:0 formatter:v2];
  v24[0] = v22;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v6 = NSNumber;
  [a1 coordinate];
  v8 = [v6 numberWithDouble:v7];
  uint64_t v9 = (void *)[v5 initWithName:@"Longitude" value:v8 options:0 formatter:v2];
  v24[1] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v11 = NSNumber;
  [a1 horizontalAccuracy];
  v12 = objc_msgSend(v11, "numberWithDouble:");
  id v13 = (void *)[v10 initWithName:@"Horizontal Accuracy" value:v12 options:0 formatter:v2];
  v24[2] = v13;
  id v14 = objc_alloc(MEMORY[0x1E4F653F8]);
  v15 = [a1 timestamp];
  id v16 = (void *)[v14 initWithName:@"Timestamp" value:v15 options:0 formatter:v2];
  v24[3] = v16;
  id v17 = objc_alloc(MEMORY[0x1E4F653F8]);
  double v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isSimulated"));
  v19 = (void *)[v17 initWithName:@"Simulated" value:v18 options:0 formatter:v2];
  v24[4] = v19;
  int v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:5];

  return v20;
}

- (id)shortDescription
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() shortDescription];
  v2 = [v0 stringWithFormat:@"<%@>", v1];

  return v2;
}

- (uint64_t)description
{
  return MEMORY[0x1F411CB90](a1, a2);
}

+ (NSString)shortDescription
{
  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_185913 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_185913, &__block_literal_global_185914);
  }
  v0 = (void *)logCategory__hmf_once_v1_185915;
  return v0;
}

@end