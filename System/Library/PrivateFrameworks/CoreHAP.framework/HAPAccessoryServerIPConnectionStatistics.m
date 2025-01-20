@interface HAPAccessoryServerIPConnectionStatistics
- (BOOL)metricTriggered;
- (BOOL)sessionRestoreActive;
- (HAPAccessoryServer)accessory;
- (HAPAccessoryServerIPConnectionStatistics)initWithAccessory:(id)a3;
- (int64_t)state;
- (void)accessoryServerIPEvent:(int64_t)a3;
- (void)generateBonjourRemoveMetric;
@end

@implementation HAPAccessoryServerIPConnectionStatistics

- (void).cxx_destruct
{
}

- (HAPAccessoryServer)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);

  return (HAPAccessoryServer *)WeakRetained;
}

- (BOOL)sessionRestoreActive
{
  return self->_sessionRestoreActive;
}

- (BOOL)metricTriggered
{
  return self->_metricTriggered;
}

- (int64_t)state
{
  return self->_state;
}

- (void)accessoryServerIPEvent:(int64_t)a3
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  v5 = [(HAPAccessoryServerIPConnectionStatistics *)self accessory];
  if (v5)
  {
    p_lock = &self->_lock;
    uint64_t v7 = os_unfair_lock_lock_with_options();
    int64_t state = self->_state;
    switch(a3)
    {
      case 0:
        if (!self->_sessionRestoreActive) {
          goto LABEL_57;
        }
        v9 = (void *)MEMORY[0x1D944E080](v7);
        v10 = self;
        HMFGetOSLogHandle();
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          id v12 = (id)objc_claimAutoreleasedReturnValue();
          v13 = [v5 identifier];
          *(_DWORD *)buf = 138543618;
          uint64_t v85 = (uint64_t)v12;
          __int16 v86 = 2112;
          uint64_t v87 = (uint64_t)v13;
          _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@%@ IP Connection BonjourUndiscovered", buf, 0x16u);
        }
        goto LABEL_50;
      case 1:
        int64_t v36 = self->_state;
        if (self->_sessionRestoreActive)
        {
          v37 = (void *)MEMORY[0x1D944E080](v7);
          v38 = self;
          HMFGetOSLogHandle();
          v39 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            id v40 = (id)objc_claimAutoreleasedReturnValue();
            v41 = [v5 identifier];
            *(_DWORD *)buf = 138543618;
            uint64_t v85 = (uint64_t)v40;
            __int16 v86 = 2112;
            uint64_t v87 = (uint64_t)v41;
            _os_log_impl(&dword_1D4758000, v39, OS_LOG_TYPE_DEBUG, "%{public}@%@ IP Connection BonjourRemoved", buf, 0x16u);

            p_lock = &self->_lock;
          }

          int64_t v36 = self->_state;
        }
        if (v36 == 1) {
          goto LABEL_56;
        }
        if (v36 != 2) {
          goto LABEL_57;
        }
        BOOL v24 = 0;
        self->_metricTriggered = 0;
        int64_t state = 3;
        goto LABEL_58;
      case 2:
        int64_t v18 = self->_state;
        if (self->_sessionRestoreActive)
        {
          v19 = (void *)MEMORY[0x1D944E080](v7);
          v20 = self;
          HMFGetOSLogHandle();
          v21 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            id v22 = (id)objc_claimAutoreleasedReturnValue();
            v23 = [v5 identifier];
            *(_DWORD *)buf = 138543618;
            uint64_t v85 = (uint64_t)v22;
            __int16 v86 = 2112;
            uint64_t v87 = (uint64_t)v23;
            _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_DEBUG, "%{public}@%@ IP Connection BonjourAdd", buf, 0x16u);

            p_lock = &self->_lock;
          }

          int64_t v18 = self->_state;
        }
        BOOL v24 = 0;
        if (!v18) {
          int64_t state = 1;
        }
        self->_metricTriggered = 0;
        goto LABEL_58;
      case 3:
        if (self->_sessionRestoreActive)
        {
          v25 = (void *)MEMORY[0x1D944E080](v7);
          v26 = self;
          HMFGetOSLogHandle();
          v27 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            id v28 = (id)objc_claimAutoreleasedReturnValue();
            v29 = [v5 identifier];
            *(_DWORD *)buf = 138543618;
            uint64_t v85 = (uint64_t)v28;
            __int16 v86 = 2112;
            uint64_t v87 = (uint64_t)v29;
            _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_INFO, "%{public}@%@ IP Connection Connected", buf, 0x16u);

            p_lock = &self->_lock;
          }

          int64_t state = self->_state;
        }
        if (state == 1)
        {
          BOOL v24 = 0;
          int64_t state = 2;
LABEL_58:
          if (!HAPIsInternalBuild() || !self->_sessionRestoreActive || self->_metricTriggered) {
            BOOL v24 = 0;
          }
          if (self->_state != state)
          {
            v62 = (void *)MEMORY[0x1D944E080]();
            v63 = self;
            HMFGetOSLogHandle();
            v64 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
            {
              v83 = p_lock;
              HMFGetLogIdentifier();
              id v65 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v66 = [v5 identifier];
              v67 = (void *)v66;
              unint64_t v68 = self->_state - 1;
              if (v68 > 2) {
                v69 = @"HAPAccessoryServerIPDiscoveryState_Undiscovered";
              }
              else {
                v69 = off_1E69F2ED8[v68];
              }
              if ((unint64_t)(state - 1) > 2) {
                v70 = @"HAPAccessoryServerIPDiscoveryState_Undiscovered";
              }
              else {
                v70 = off_1E69F2ED8[state - 1];
              }
              *(_DWORD *)buf = 138544130;
              uint64_t v85 = (uint64_t)v65;
              __int16 v86 = 2112;
              uint64_t v87 = v66;
              __int16 v88 = 2112;
              v89 = v69;
              __int16 v90 = 2112;
              v91 = v70;
              _os_log_impl(&dword_1D4758000, v64, OS_LOG_TYPE_INFO, "%{public}@%@ updating discovery state from %@ to %@", buf, 0x2Au);

              p_lock = v83;
            }
          }
          self->_int64_t state = state;
          if (v24)
          {
            v71 = (void *)MEMORY[0x1D944E080]();
            v72 = self;
            HMFGetOSLogHandle();
            v73 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              id v74 = (id)objc_claimAutoreleasedReturnValue();
              v75 = [v5 identifier];
              *(_DWORD *)buf = 138543618;
              uint64_t v85 = (uint64_t)v74;
              __int16 v86 = 2112;
              uint64_t v87 = (uint64_t)v75;
              _os_log_impl(&dword_1D4758000, v73, OS_LOG_TYPE_INFO, "%{public}@%@ IP Connection bonjour submitting metric", buf, 0x16u);
            }
            v72->_metricTriggered = 1;
            os_unfair_lock_unlock(p_lock);
            [(HAPAccessoryServerIPConnectionStatistics *)v72 generateBonjourRemoveMetric];
            goto LABEL_84;
          }
        }
        else
        {
          v76 = (void *)MEMORY[0x1D944E080](v7);
          v77 = self;
          HMFGetOSLogHandle();
          v78 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          {
            uint64_t v79 = HMFGetLogIdentifier();
            v80 = (void *)v79;
            unint64_t v81 = self->_state - 1;
            if (v81 > 2) {
              v82 = @"HAPAccessoryServerIPDiscoveryState_Undiscovered";
            }
            else {
              v82 = off_1E69F2ED8[v81];
            }
            *(_DWORD *)buf = 138543618;
            uint64_t v85 = v79;
            __int16 v86 = 2112;
            uint64_t v87 = (uint64_t)v82;
            _os_log_impl(&dword_1D4758000, v78, OS_LOG_TYPE_ERROR, "%{public}@*** transitioning to invalid state %@ while connected", buf, 0x16u);
          }
        }
        os_unfair_lock_unlock(p_lock);
        goto LABEL_84;
      case 4:
        int64_t v30 = self->_state;
        if (self->_sessionRestoreActive)
        {
          v31 = (void *)MEMORY[0x1D944E080](v7);
          v32 = self;
          HMFGetOSLogHandle();
          v33 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            id v34 = (id)objc_claimAutoreleasedReturnValue();
            v35 = [v5 identifier];
            *(_DWORD *)buf = 138543618;
            uint64_t v85 = (uint64_t)v34;
            __int16 v86 = 2112;
            uint64_t v87 = (uint64_t)v35;
            _os_log_impl(&dword_1D4758000, v33, OS_LOG_TYPE_INFO, "%{public}@%@ IP Connection Connection Failed", buf, 0x16u);

            p_lock = &self->_lock;
          }

          int64_t v30 = self->_state;
        }
        if (v30 == 2)
        {
          BOOL v24 = 0;
          int64_t state = 1;
        }
        else
        {
          if (v30 == 3) {
LABEL_56:
          }
            int64_t state = 0;
LABEL_57:
          BOOL v24 = 0;
        }
        goto LABEL_58;
      case 5:
        int64_t v42 = self->_state;
        if (self->_sessionRestoreActive)
        {
          v43 = (void *)MEMORY[0x1D944E080](v7);
          v44 = self;
          HMFGetOSLogHandle();
          v45 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            id v46 = (id)objc_claimAutoreleasedReturnValue();
            v47 = [v5 identifier];
            *(_DWORD *)buf = 138543618;
            uint64_t v85 = (uint64_t)v46;
            __int16 v86 = 2112;
            uint64_t v87 = (uint64_t)v47;
            _os_log_impl(&dword_1D4758000, v45, OS_LOG_TYPE_INFO, "%{public}@%@ IP Connection ConnectionTerminated", buf, 0x16u);

            p_lock = &self->_lock;
          }

          int64_t v42 = self->_state;
        }
        BOOL v24 = 0;
        if (v42 == 2) {
          int64_t state = 1;
        }
        goto LABEL_58;
      case 6:
        int64_t v48 = self->_state;
        if (self->_sessionRestoreActive)
        {
          v49 = (void *)MEMORY[0x1D944E080](v7);
          v50 = self;
          HMFGetOSLogHandle();
          v51 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            id v52 = (id)objc_claimAutoreleasedReturnValue();
            v53 = [v5 identifier];
            *(_DWORD *)buf = 138543618;
            uint64_t v85 = (uint64_t)v52;
            __int16 v86 = 2112;
            uint64_t v87 = (uint64_t)v53;
            _os_log_impl(&dword_1D4758000, v51, OS_LOG_TYPE_DEBUG, "%{public}@%@ IP Connection Successful Transaction", buf, 0x16u);

            p_lock = &self->_lock;
          }

          int64_t v48 = self->_state;
        }
        BOOL v24 = v48 == 3;
        goto LABEL_58;
      case 7:
        self->_sessionRestoreActive = 1;
        v9 = (void *)MEMORY[0x1D944E080](v7);
        v54 = self;
        HMFGetOSLogHandle();
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          id v55 = (id)objc_claimAutoreleasedReturnValue();
          v56 = [v5 identifier];
          *(_DWORD *)buf = 138543618;
          uint64_t v85 = (uint64_t)v55;
          __int16 v86 = 2112;
          uint64_t v87 = (uint64_t)v56;
          _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@%@ IP Connection Session Restore Registration", buf, 0x16u);
        }
LABEL_50:

        goto LABEL_57;
      case 8:
        if (self->_sessionRestoreActive)
        {
          v57 = (void *)MEMORY[0x1D944E080](v7);
          v58 = self;
          HMFGetOSLogHandle();
          v59 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            id v60 = (id)objc_claimAutoreleasedReturnValue();
            v61 = [v5 identifier];
            *(_DWORD *)buf = 138543618;
            uint64_t v85 = (uint64_t)v60;
            __int16 v86 = 2112;
            uint64_t v87 = (uint64_t)v61;
            _os_log_impl(&dword_1D4758000, v59, OS_LOG_TYPE_INFO, "%{public}@%@ IP Connection Session Restore Deregistration", buf, 0x16u);

            p_lock = &self->_lock;
          }
        }
        BOOL v24 = 0;
        self->_sessionRestoreActive = 0;
        goto LABEL_58;
      default:
        goto LABEL_57;
    }
  }
  v14 = (void *)MEMORY[0x1D944E080]();
  v15 = self;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v85 = (uint64_t)v17;
    _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_ERROR, "%{public}@Will not update state as accessory server is nil", buf, 0xCu);
  }
LABEL_84:
}

- (void)generateBonjourRemoveMetric
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(HAPAccessoryServerIPConnectionStatistics *)self accessory];
  if (v3)
  {
    v4 = [HAPMetricsBonjourIncorrrectStateLogEvent alloc];
    v5 = [v3 identifier];
    v6 = [(HAPMetricsBonjourIncorrrectStateLogEvent *)v4 initWithDeviceID:v5];

    uint64_t v7 = +[HAPMetricsDispatcher sharedInstance];
    [v7 submitLogEvent:v6];
  }
  else
  {
    v8 = (void *)MEMORY[0x1D944E080]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot generate bonjour metric as accessory server is nil", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (HAPAccessoryServerIPConnectionStatistics)initWithAccessory:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HAPAccessoryServerIPConnectionStatistics;
  v5 = [(HAPAccessoryServerIPConnectionStatistics *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_accessory, v4);
    v6->_int64_t state = 0;
    v6->_sessionRestoreActive = 0;
  }

  return v6;
}

@end