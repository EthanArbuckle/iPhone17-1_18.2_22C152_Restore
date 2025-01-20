@interface HMDLocationCluster
+ (id)logCategory;
- (CLLocation)bestLocation;
- (HMDLocationCluster)clusterWithGroups:(id)a3;
- (HMDLocationCluster)initWithLocations:(id)a3;
- (NSArray)locations;
- (id)attributeDescriptions;
- (id)generateNewGroupsFromGroups:(id)a3;
- (id)kMeansClusteredGroups;
- (id)locationFromKMeansClusteredGroups:(id)a3;
@end

@implementation HMDLocationCluster

- (void).cxx_destruct
{
}

- (NSArray)locations
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDLocationCluster *)self locations];
  v5 = (void *)[v3 initWithName:@"Locations" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (id)locationFromKMeansClusteredGroups:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    v7 = 0;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v11 = [v10 locations];
        unint64_t v12 = [v11 count];

        if (v12 > v6)
        {
          id v13 = v10;

          v14 = [v13 locations];
          unint64_t v6 = [v14 count];

          v7 = v13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v5);
  }
  else
  {
    v7 = 0;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v15 = objc_msgSend(v7, "locations", 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    v18 = 0;
    double v19 = *MEMORY[0x1E4F1E568];
    uint64_t v20 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v15);
        }
        v22 = *(void **)(*((void *)&v28 + 1) + 8 * j);
        v23 = [v7 center];
        [v23 distanceFromLocation:v22];
        double v25 = v24;

        if (v25 < v19)
        {
          id v26 = v22;

          v18 = v26;
          double v19 = v25;
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)generateNewGroupsFromGroups:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        v10 = [v9 locations];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v29;
          double v14 = 0.0;
          double v15 = 0.0;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v29 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v17 = *(void **)(*((void *)&v28 + 1) + 8 * j);
              [v17 coordinate];
              double v15 = v15 + v18;
              [v17 coordinate];
              double v14 = v14 + v19;
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v12);
        }
        else
        {
          double v14 = 0.0;
          double v15 = 0.0;
        }

        uint64_t v20 = [v9 locations];
        double v21 = v15 / (float)(unint64_t)[v20 count];

        v22 = [v9 locations];
        double v23 = v14 / (float)(unint64_t)[v22 count];

        double v24 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:v21 longitude:v23];
        double v25 = [[HMDLocationClusterGroup alloc] initWithCenter:v24];
        [v4 addObject:v25];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v6);
  }

  return v4;
}

- (HMDLocationCluster)clusterWithGroups:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = [(HMDLocationCluster *)self locations];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        if ([v4 count])
        {
          unint64_t v11 = 0;
          int v12 = -1;
          double v13 = 0.0;
          do
          {
            double v14 = [v4 objectAtIndexedSubscript:v11];
            double v15 = [v14 center];
            [v15 distanceFromLocation:v10];
            double v17 = v16;

            if (v17 < v13 || v11 == 0)
            {
              int v12 = v11;
              double v13 = v17;
            }

            ++v11;
          }
          while ([v4 count] > v11);
          if (v12 != -1)
          {
            double v19 = [v4 objectAtIndexedSubscript:v12];
            uint64_t v20 = [v19 locations];
            [v20 addObject:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  return result;
}

- (id)kMeansClusteredGroups
{
  uint64_t v3 = 3;
  id v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  uint64_t v5 = [(HMDLocationCluster *)self locations];
  unint64_t v6 = [v5 count] / 3uLL;

  uint64_t v7 = 0;
  do
  {
    uint64_t v8 = [HMDLocationClusterGroup alloc];
    v9 = [(HMDLocationCluster *)self locations];
    uint64_t v10 = [v9 objectAtIndexedSubscript:v7];
    unint64_t v11 = [(HMDLocationClusterGroup *)v8 initWithCenter:v10];
    [v4 addObject:v11];

    v7 += v6;
    --v3;
  }
  while (v3);
  int v12 = (void *)[v4 copy];
  [(HMDLocationCluster *)self clusterWithGroups:v12];
  int v13 = 10;
  do
  {
    double v14 = v12;
    int v12 = [(HMDLocationCluster *)self generateNewGroupsFromGroups:v12];

    [(HMDLocationCluster *)self clusterWithGroups:v12];
    --v13;
  }
  while (v13);

  return v12;
}

- (CLLocation)bestLocation
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDLocationCluster *)self locations];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(HMDLocationCluster *)self locations];
    unint64_t v6 = [v5 count];

    if (v6 > 0xA)
    {
      int v13 = [(HMDLocationCluster *)self kMeansClusteredGroups];
      double v14 = [(HMDLocationCluster *)self locationFromKMeansClusteredGroups:v13];
      double v19 = (void *)MEMORY[0x1D9452090]();
      uint64_t v20 = self;
      double v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        long long v22 = HMFGetLogIdentifier();
        long long v23 = [(HMDLocationCluster *)v20 locations];
        int v25 = 138543874;
        id v26 = v22;
        __int16 v27 = 2048;
        uint64_t v28 = [v23 count];
        __int16 v29 = 2112;
        long long v30 = v14;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Number of locations is %lu so using k-means-clustered location for best location: %@", (uint8_t *)&v25, 0x20u);
      }
    }
    else
    {
      uint64_t v7 = (void *)MEMORY[0x1D9452090]();
      uint64_t v8 = self;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = HMFGetLogIdentifier();
        unint64_t v11 = [(HMDLocationCluster *)v8 locations];
        int v25 = 138543618;
        id v26 = v10;
        __int16 v27 = 2048;
        uint64_t v28 = [v11 count];
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Number of locations is only %lu so sorting and using most accurate location for best location", (uint8_t *)&v25, 0x16u);
      }
      int v12 = [(HMDLocationCluster *)v8 locations];
      int v13 = [v12 sortedArrayUsingComparator:&__block_literal_global_163476];

      double v14 = [v13 firstObject];
    }
  }
  else
  {
    double v15 = (void *)MEMORY[0x1D9452090]();
    double v16 = self;
    double v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      double v18 = HMFGetLogIdentifier();
      int v25 = 138543362;
      id v26 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Number of locations is 0 so returning nil for best location", (uint8_t *)&v25, 0xCu);
    }
    double v14 = 0;
  }
  return (CLLocation *)v14;
}

uint64_t __34__HMDLocationCluster_bestLocation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 horizontalAccuracy];
  double v7 = v6;
  [v5 horizontalAccuracy];
  if (v7 >= v8)
  {
    [v4 horizontalAccuracy];
    double v11 = v10;
    [v5 horizontalAccuracy];
    uint64_t v9 = v11 > v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (HMDLocationCluster)initWithLocations:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    double v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)HMDLocationCluster;
    double v7 = [(HMDLocationCluster *)&v12 init];
    double v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_locations, a3);
    }

    return v8;
  }
  else
  {
    double v10 = (void *)_HMFPreconditionFailure();
    return (HMDLocationCluster *)+[HMDLocationCluster logCategory];
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_163487 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_163487, &__block_literal_global_6_163488);
  }
  v2 = (void *)logCategory__hmf_once_v4_163489;
  return v2;
}

uint64_t __33__HMDLocationCluster_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v4_163489;
  logCategory__hmf_once_v4_163489 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end