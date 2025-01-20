@interface HMDAccessoryPairingProgressStateMap
- (HMDAccessoryPairingProgressStateMap)initWithDate:(id)a3;
- (NSDate)lastProgressStateEventTime;
- (NSMutableDictionary)progressStateMap;
- (NSString)lastProgressState;
- (NSString)longestProgressState;
- (double)getTimeDurationForLongestProgressState;
- (void)setLastProgressState:(id)a3;
- (void)setLastProgressStateEventTime:(id)a3;
- (void)setLongestProgressState:(id)a3;
- (void)setProgressStateMap:(id)a3;
- (void)updateWithProgressState:(id)a3 date:(id)a4;
@end

@implementation HMDAccessoryPairingProgressStateMap

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastProgressStateEventTime, 0);
  objc_storeStrong((id *)&self->_longestProgressState, 0);
  objc_storeStrong((id *)&self->_lastProgressState, 0);
  objc_storeStrong((id *)&self->_progressStateMap, 0);
}

- (void)setLastProgressStateEventTime:(id)a3
{
}

- (NSDate)lastProgressStateEventTime
{
  return self->_lastProgressStateEventTime;
}

- (void)setLongestProgressState:(id)a3
{
}

- (void)setLastProgressState:(id)a3
{
}

- (void)setProgressStateMap:(id)a3
{
}

- (NSMutableDictionary)progressStateMap
{
  return self->_progressStateMap;
}

- (double)getTimeDurationForLongestProgressState
{
  p_accessoryPairingProgressStateMapLock = &self->_accessoryPairingProgressStateMapLock;
  os_unfair_lock_lock_with_options();
  v4 = [(NSMutableDictionary *)self->_progressStateMap objectForKey:self->_longestProgressState];

  if (v4)
  {
    v5 = [(NSMutableDictionary *)self->_progressStateMap objectForKey:self->_longestProgressState];
    [v5 doubleValue];
    double v7 = v6 * 1000.0;
  }
  else
  {
    double v7 = 0.0;
  }
  os_unfair_lock_unlock(p_accessoryPairingProgressStateMapLock);
  return v7;
}

- (NSString)lastProgressState
{
  p_accessoryPairingProgressStateMapLock = &self->_accessoryPairingProgressStateMapLock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)[(NSString *)self->_lastProgressState copy];
  os_unfair_lock_unlock(p_accessoryPairingProgressStateMapLock);
  return (NSString *)v4;
}

- (NSString)longestProgressState
{
  p_accessoryPairingProgressStateMapLock = &self->_accessoryPairingProgressStateMapLock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)[(NSString *)self->_longestProgressState copy];
  os_unfair_lock_unlock(p_accessoryPairingProgressStateMapLock);
  return (NSString *)v4;
}

- (void)updateWithProgressState:(id)a3 date:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  double v6 = (NSString *)a3;
  id v7 = a4;
  p_accessoryPairingProgressStateMapLock = &self->_accessoryPairingProgressStateMapLock;
  os_unfair_lock_lock_with_options();
  uint64_t v9 = [v7 timeIntervalSinceDate:self->_lastProgressStateEventTime];
  double v11 = v10;
  if (v6)
  {
    v12 = [(HMDAccessoryPairingProgressStateMap *)self progressStateMap];
    [v12 setObject:&unk_1F2DC7AE0 forKey:v6];

    if (self->_lastProgressState)
    {
      v13 = [(HMDAccessoryPairingProgressStateMap *)self progressStateMap];
      v14 = [NSNumber numberWithDouble:v11];
      [v13 setObject:v14 forKey:self->_lastProgressState];
    }
    [(HMDAccessoryPairingProgressStateMap *)self setLastProgressState:v6];
    v15 = (void *)MEMORY[0x1D9452090]([(HMDAccessoryPairingProgressStateMap *)self setLastProgressStateEventTime:v7]);
    v16 = self;
    HMFGetOSLogHandle();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = HMFGetLogIdentifier();
      progressStateMap = v16->_progressStateMap;
      int v38 = 138543874;
      id v39 = v18;
      __int16 v40 = 2112;
      v41 = v6;
      __int16 v42 = 2112;
      v43 = progressStateMap;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Successfully added progress state: %@ to the pairing progress state map: %@", (uint8_t *)&v38, 0x20u);
    }
LABEL_9:

    v25 = [(NSMutableDictionary *)self->_progressStateMap keysSortedByValueUsingComparator:&__block_literal_global_38054];
    uint64_t v26 = [v25 count];
    if (v26)
    {
      v27 = [v25 objectAtIndexedSubscript:0];
    }
    else
    {
      v27 = &stru_1F2C9F1A8;
    }
    uint64_t v28 = [(HMDAccessoryPairingProgressStateMap *)self setLongestProgressState:v27];
    if (v26) {

    }
    v29 = (void *)MEMORY[0x1D9452090](v28);
    v30 = self;
    HMFGetOSLogHandle();
    v31 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      v32 = HMFGetLogIdentifier();
      longestProgressState = v30->_longestProgressState;
      int v38 = 138543618;
      id v39 = v32;
      __int16 v40 = 2112;
      v41 = longestProgressState;
      _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_DEBUG, "%{public}@Updated longest progress state to: %@", (uint8_t *)&v38, 0x16u);
    }

    goto LABEL_17;
  }
  if (self->_lastProgressState)
  {
    v20 = [(HMDAccessoryPairingProgressStateMap *)self progressStateMap];
    v21 = [NSNumber numberWithDouble:v11];
    [v20 setObject:v21 forKey:self->_lastProgressState];

    v15 = (void *)MEMORY[0x1D9452090]();
    v22 = self;
    HMFGetOSLogHandle();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      v24 = [NSNumber numberWithDouble:v11];
      int v38 = 138543618;
      id v39 = v23;
      __int16 v40 = 2112;
      v41 = v24;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Successfully updated duration of last progress state to: %@", (uint8_t *)&v38, 0x16u);
    }
    goto LABEL_9;
  }
  v34 = (void *)MEMORY[0x1D9452090](v9);
  v35 = self;
  HMFGetOSLogHandle();
  v36 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    v37 = HMFGetLogIdentifier();
    int v38 = 138543362;
    id v39 = v37;
    _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_DEBUG, "%{public}@No previous state information to update last state duration", (uint8_t *)&v38, 0xCu);
  }
LABEL_17:
  os_unfair_lock_unlock(p_accessoryPairingProgressStateMapLock);
}

uint64_t __68__HMDAccessoryPairingProgressStateMap_updateWithProgressState_date___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (HMDAccessoryPairingProgressStateMap)initWithDate:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDAccessoryPairingProgressStateMap;
  double v6 = [(HMDAccessoryPairingProgressStateMap *)&v10 init];
  if (v6)
  {
    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    progressStateMap = v6->_progressStateMap;
    v6->_progressStateMap = v7;

    objc_storeStrong((id *)&v6->_lastProgressStateEventTime, a3);
  }

  return v6;
}

@end