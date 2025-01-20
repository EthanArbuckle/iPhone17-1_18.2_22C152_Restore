@interface HMDHomeLocationHandler
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)_canExtractLocation;
- (BOOL)_hasReachableAccessoriesExcludingMatter;
- (BOOL)_needToExtractLocations;
- (BOOL)_shouldRegisterForSignificantRegion;
- (BOOL)_shouldUpdateHomeLocation;
- (BOOL)firstAccessoryReachable;
- (BOOL)isDate:(id)a3 laterThanDate:(id)a4;
- (BOOL)isLocation:(id)a3 closeToLocation:(id)a4;
- (BOOL)isNewHomeLocationTooCloseToPreviousLocation:(id)a3 newLocation:(id)a4;
- (BOOL)pairingHomeLocationOverride;
- (BOOL)resendOnce;
- (BOOL)shouldAllowHomeLocationUpdateWithSource:(int64_t)a3 newLocation:(id)a4;
- (BOOL)shouldUpdateHomeLocation;
- (BOOL)shouldUpdateLocationFromLocationData:(id)a3;
- (BOOL)updateRegionStateFromLocation:(id)a3;
- (CLLocation)cachedLocation;
- (CLLocation)location;
- (CLRegion)regionAtHome;
- (CLRegion)regionNearbyHome;
- (HMDHome)home;
- (HMDHomeLocationData)locationData;
- (HMDHomeLocationHandler)init;
- (HMDHomeLocationHandler)initWithCoder:(id)a3;
- (HMFMessageDispatcher)msgDispatcher;
- (HMFTimer)homeRegionUpdateTimer;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSDate)homeLocationUpdateRequestTime;
- (NSDate)lastArrival;
- (NSDate)lastAttemptedLocationUpdate;
- (NSDate)lastExit;
- (NSDate)locationUpdateTimestamp;
- (NSString)description;
- (NSString)isoCountryCode;
- (NSTimeZone)timeZone;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)workQueue;
- (_HMDPendingRegionUpdate)pendingAtHomeRegionUpdate;
- (_HMDPendingRegionUpdate)pendingNearbyHomeRegionUpdate;
- (double)coalesceRegionUpdateIntervalInSeconds;
- (id)__initForUnitTesting:(double)a3 home:(id)a4 queue:(id)a5 messageDispatcher:(id)a6 location:(id)a7;
- (id)_handleHomeLocationData:(id)a3 message:(id)a4;
- (id)_handleHomeLocationDataForHH2:(id)a3 fromMessage:(id)a4;
- (id)logIdentifier;
- (id)messageDestination;
- (int64_t)cachedSource;
- (int64_t)locationAuthorization;
- (int64_t)locationSource;
- (int64_t)regionStateAtHome;
- (int64_t)regionStateNearbyHome;
- (void)__simulateAtHomeRegionState:(int64_t)a3;
- (void)__simulateNearByHomeRegionState:(int64_t)a3;
- (void)_evaluateHomeRegionStateForCurrentDeviceLocation:(id)a3;
- (void)_handleLocationAuthorization:(int64_t)a3;
- (void)_handleLocationAuthorizationChangedNotification:(id)a3;
- (void)_handleRetrieveLocation:(id)a3;
- (void)_processPendingRegionStateUpdates;
- (void)_registerForMessages;
- (void)_registerForRegionUpdate;
- (void)_sendLocationUpdateToClients;
- (void)_updateTimeZone:(id)a3;
- (void)accessoriesBecomeReachable;
- (void)accessoriesBecomeUnreachable;
- (void)checkFalsePresence;
- (void)coalesceRegionUpdateState:(int64_t)a3 forRegion:(id)a4;
- (void)configure:(id)a3 queue:(id)a4 messageDispatcher:(id)a5;
- (void)dealloc;
- (void)didDetermineLocation:(id)a3;
- (void)didDetermineState:(int64_t)a3 forRegion:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)getReachableIPAccessory:(unint64_t *)a3 btleAccessory:(unint64_t *)a4 mediaAccessory:(unint64_t *)a5;
- (void)logHomeLocationEventWithLocation:(id)a3;
- (void)runTransactionWithLocation:(id)a3 updatedTime:(id)a4 source:(int64_t)a5;
- (void)setCachedLocation:(id)a3;
- (void)setCachedSource:(int64_t)a3;
- (void)setCoalesceRegionUpdateIntervalInSeconds:(double)a3;
- (void)setFirstAccessoryReachable:(BOOL)a3;
- (void)setHome:(id)a3;
- (void)setHomeLocationUpdateRequestTime:(id)a3;
- (void)setHomeRegionUpdateTimer:(id)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setLastArrival:(id)a3;
- (void)setLastAttemptedLocationUpdate:(id)a3;
- (void)setLastExit:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLocationAuthorization:(int64_t)a3;
- (void)setLocationSource:(int64_t)a3;
- (void)setLocationUpdateTimestamp:(id)a3;
- (void)setMsgDispatcher:(id)a3;
- (void)setPairingHomeLocationOverride:(BOOL)a3;
- (void)setPendingAtHomeRegionUpdate:(id)a3;
- (void)setPendingNearbyHomeRegionUpdate:(id)a3;
- (void)setRegionAtHome:(id)a3;
- (void)setRegionNearbyHome:(id)a3;
- (void)setRegionStateAtHome:(int64_t)a3;
- (void)setRegionStateNearbyHome:(int64_t)a3;
- (void)setResendOnce:(BOOL)a3;
- (void)setShouldUpdateHomeLocation:(BOOL)a3;
- (void)setTimeZone:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)timerDidFire:(id)a3;
- (void)updateHomeLocation;
- (void)updateHomeLocationFromCoreRoutine;
- (void)updateHomeLocationFromSingleOrCoreRoutine;
@end

@implementation HMDHomeLocationHandler

- (NSUUID)messageTargetUUID
{
  v2 = [(HMDHomeLocationHandler *)self home];
  v3 = [v2 uuid];

  return (NSUUID *)v3;
}

- (void)_handleRetrieveLocation:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isAuthorizedForLocationAccess])
  {
    v5 = [v4 proxyConnection];
    v6 = [v5 processInfo];
    v7 = [v6 locationAuthorization];
    [v7 mark];

    LODWORD(v7) = isInternalBuild();
    v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v11)
      {
        v12 = HMFGetLogIdentifier();
        v13 = [(HMDHomeLocationHandler *)v9 location];
        v14 = [(HMDHomeLocationHandler *)v9 home];
        *(_DWORD *)buf = 138543874;
        v25 = v12;
        __int16 v26 = 2112;
        v27 = v13;
        __int16 v28 = 2112;
        v29 = v14;
        v15 = "%{public}@Sending location %@ for home %@";
LABEL_10:
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, v15, buf, 0x20u);
      }
    }
    else if (v11)
    {
      v12 = HMFGetLogIdentifier();
      v13 = [(HMDHomeLocationHandler *)v9 location];
      v14 = [(HMDHomeLocationHandler *)v9 home];
      *(_DWORD *)buf = 138543875;
      v25 = v12;
      __int16 v26 = 2117;
      v27 = v13;
      __int16 v28 = 2112;
      v29 = v14;
      v15 = "%{public}@Sending location %{sensitive}@ for home %@";
      goto LABEL_10;
    }

    v19 = [(HMDHomeLocationHandler *)v9 location];
    v20 = encodeRootObject();
    v23 = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    [v4 respondWithPayload:v21];

    goto LABEL_12;
  }
  v16 = (void *)MEMORY[0x1D9452090]();
  v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v25 = v18;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Client does not have authorization to location", buf, 0xCu);
  }
  [v4 respondWithPayload:0];
LABEL_12:
}

- (CLLocation)location
{
  return self->_location;
}

- (id)logIdentifier
{
  v2 = [(HMDHomeLocationHandler *)self home];
  v3 = NSString;
  id v4 = [v2 name];
  v5 = [v2 uuid];
  v6 = [v3 stringWithFormat:@"%@/%@", v4, v5];

  return v6;
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t100 != -1) {
    dispatch_once(&logCategory__hmf_once_t100, &__block_literal_global_166785);
  }
  v2 = (void *)logCategory__hmf_once_v101;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeLocationUpdateRequestTime, 0);
  objc_storeStrong((id *)&self->_cachedLocation, 0);
  objc_storeStrong((id *)&self->_lastAttemptedLocationUpdate, 0);
  objc_storeStrong((id *)&self->_lastExit, 0);
  objc_storeStrong((id *)&self->_lastArrival, 0);
  objc_storeStrong((id *)&self->_pendingNearbyHomeRegionUpdate, 0);
  objc_storeStrong((id *)&self->_pendingAtHomeRegionUpdate, 0);
  objc_storeStrong((id *)&self->_homeRegionUpdateTimer, 0);
  objc_storeStrong((id *)&self->_regionNearbyHome, 0);
  objc_storeStrong((id *)&self->_regionAtHome, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_locationUpdateTimestamp, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

- (void)setHomeLocationUpdateRequestTime:(id)a3
{
}

- (NSDate)homeLocationUpdateRequestTime
{
  return self->_homeLocationUpdateRequestTime;
}

- (void)setShouldUpdateHomeLocation:(BOOL)a3
{
  self->_shouldUpdateHomeLocation = a3;
}

- (BOOL)shouldUpdateHomeLocation
{
  return self->_shouldUpdateHomeLocation;
}

- (void)setCachedLocation:(id)a3
{
}

- (CLLocation)cachedLocation
{
  return self->_cachedLocation;
}

- (void)setCachedSource:(int64_t)a3
{
  self->_cachedSource = a3;
}

- (int64_t)cachedSource
{
  return self->_cachedSource;
}

- (void)setResendOnce:(BOOL)a3
{
  self->_resendOnce = a3;
}

- (BOOL)resendOnce
{
  return self->_resendOnce;
}

- (void)setLastAttemptedLocationUpdate:(id)a3
{
}

- (NSDate)lastAttemptedLocationUpdate
{
  return self->_lastAttemptedLocationUpdate;
}

- (void)setLastExit:(id)a3
{
}

- (NSDate)lastExit
{
  return self->_lastExit;
}

- (void)setLastArrival:(id)a3
{
}

- (NSDate)lastArrival
{
  return self->_lastArrival;
}

- (void)setCoalesceRegionUpdateIntervalInSeconds:(double)a3
{
  self->_coalesceRegionUpdateIntervalInSeconds = a3;
}

- (double)coalesceRegionUpdateIntervalInSeconds
{
  return self->_coalesceRegionUpdateIntervalInSeconds;
}

- (void)setPendingNearbyHomeRegionUpdate:(id)a3
{
}

- (_HMDPendingRegionUpdate)pendingNearbyHomeRegionUpdate
{
  return self->_pendingNearbyHomeRegionUpdate;
}

- (void)setPendingAtHomeRegionUpdate:(id)a3
{
}

- (_HMDPendingRegionUpdate)pendingAtHomeRegionUpdate
{
  return self->_pendingAtHomeRegionUpdate;
}

- (void)setHomeRegionUpdateTimer:(id)a3
{
}

- (HMFTimer)homeRegionUpdateTimer
{
  return self->_homeRegionUpdateTimer;
}

- (void)setPairingHomeLocationOverride:(BOOL)a3
{
  self->_pairingHomeLocationOverride = a3;
}

- (BOOL)pairingHomeLocationOverride
{
  return self->_pairingHomeLocationOverride;
}

- (void)setFirstAccessoryReachable:(BOOL)a3
{
  self->_firstAccessoryReachable = a3;
}

- (BOOL)firstAccessoryReachable
{
  return self->_firstAccessoryReachable;
}

- (void)setRegionNearbyHome:(id)a3
{
}

- (CLRegion)regionNearbyHome
{
  return self->_regionNearbyHome;
}

- (void)setRegionAtHome:(id)a3
{
}

- (CLRegion)regionAtHome
{
  return self->_regionAtHome;
}

- (void)setLocationAuthorization:(int64_t)a3
{
  self->_locationAuthorization = a3;
}

- (int64_t)locationAuthorization
{
  return self->_locationAuthorization;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (void)setHome:(id)a3
{
}

- (void)setMsgDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setWorkQueue:(id)a3
{
}

- (void)setRegionStateNearbyHome:(int64_t)a3
{
  self->_regionStateNearbyHome = a3;
}

- (int64_t)regionStateNearbyHome
{
  return self->_regionStateNearbyHome;
}

- (void)setRegionStateAtHome:(int64_t)a3
{
  self->_regionStateAtHome = a3;
}

- (int64_t)regionStateAtHome
{
  return self->_regionStateAtHome;
}

- (void)setIsoCountryCode:(id)a3
{
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setTimeZone:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setLocationSource:(int64_t)a3
{
  self->_locationSource = a3;
}

- (int64_t)locationSource
{
  return self->_locationSource;
}

- (void)setLocationUpdateTimestamp:(id)a3
{
}

- (NSDate)locationUpdateTimestamp
{
  return self->_locationUpdateTimestamp;
}

- (void)setLocation:(id)a3
{
}

- (void)__simulateNearByHomeRegionState:(int64_t)a3
{
  if (a3)
  {
    id v5 = [(HMDHomeLocationHandler *)self regionNearbyHome];
    [(HMDHomeLocationHandler *)self didDetermineState:a3 forRegion:v5];
  }
  else
  {
    os_unfair_recursive_lock_lock_with_options();
    [(HMDHomeLocationHandler *)self setRegionStateNearbyHome:0];
    os_unfair_recursive_lock_unlock();
  }
}

- (void)__simulateAtHomeRegionState:(int64_t)a3
{
  if (a3)
  {
    id v5 = [(HMDHomeLocationHandler *)self regionAtHome];
    [(HMDHomeLocationHandler *)self didDetermineState:a3 forRegion:v5];
  }
  else
  {
    os_unfair_recursive_lock_lock_with_options();
    [(HMDHomeLocationHandler *)self setRegionStateAtHome:0];
    os_unfair_recursive_lock_unlock();
  }
}

- (id)__initForUnitTesting:(double)a3 home:(id)a4 queue:(id)a5 messageDispatcher:(id)a6 location:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = [(HMDHomeLocationHandler *)self init];
  [(HMDHomeLocationHandler *)v16 setLocation:v12];

  [(HMDHomeLocationHandler *)v16 setCoalesceRegionUpdateIntervalInSeconds:a3];
  [(HMDHomeLocationHandler *)v16 setHome:v15];

  [(HMDHomeLocationHandler *)v16 setWorkQueue:v14];
  [(HMDHomeLocationHandler *)v16 setMsgDispatcher:v13];

  [(HMDHomeLocationHandler *)v16 _registerForRegionUpdate];
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomeLocationHandler *)self location];
  [v4 encodeObject:v5 forKey:@"homeLocation"];

  v6 = [(HMDHomeLocationHandler *)self locationUpdateTimestamp];
  [v4 encodeObject:v6 forKey:@"homeLocationNextUpdate"];

  objc_msgSend(NSNumber, "numberWithInteger:", -[HMDHomeLocationHandler locationSource](self, "locationSource"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"homeLocationSource"];
  v7 = [(HMDHomeLocationHandler *)self timeZone];
  [v4 encodeObject:v7 forKey:@"HMD.homeLocTZ"];

  v8 = [(HMDHomeLocationHandler *)self isoCountryCode];
  [v4 encodeObject:v8 forKey:@"HMD.homeLocCC"];
}

- (HMDHomeLocationHandler)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomeLocationHandler *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeLocation"];
    location = v5->_location;
    v5->_location = (CLLocation *)v6;

    if (v5->_location)
    {
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeLocationNextUpdate"];
      locationUpdateTimestamp = v5->_locationUpdateTimestamp;
      v5->_locationUpdateTimestamp = (NSDate *)v8;

      v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeLocationSource"];
      v5->_locationSource = [v10 unsignedIntValue];
    }
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMD.homeLocTZ"];
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMD.homeLocCC"];
    isoCountryCode = v5->_isoCountryCode;
    v5->_isoCountryCode = (NSString *)v13;
  }
  return v5;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  id v4 = [(HMDHomeLocationHandler *)self messageTargetUUID];
  id v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (void)checkFalsePresence
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
  if ([(HMDHomeLocationHandler *)self regionStateAtHome] == 2)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    id v5 = [(HMDHomeLocationHandler *)self lastArrival];
    [v4 timeIntervalSinceDate:v5];
    double v7 = v6;

    uint64_t v8 = [(HMDHomeLocationHandler *)self lastArrival];
    uint64_t v9 = [v8 isEqualToDate:v3];

    if (v7 >= 30.0)
    {
      v10 = +[HMDEntryExitLogEvent exitLogEvent:0 isFalse:v9 isInitial:v7];
      uint64_t v30 = [(HMDHomeLocationHandler *)self logEventSubmitter];
      [v30 submitLogEvent:v10];
    }
    else
    {
      v10 = +[HMDEntryExitLogEvent exitLogEvent:1 isFalse:v9 isInitial:v7];
      uint64_t v11 = [(HMDHomeLocationHandler *)self logEventSubmitter];
      [v11 submitLogEvent:v10];

      id v12 = (void *)MEMORY[0x1D9452090]();
      uint64_t v13 = self;
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        id v15 = HMFGetLogIdentifier();
        v16 = [(HMDHomeLocationHandler *)v13 lastArrival];
        int v38 = 138543874;
        v39 = v15;
        __int16 v40 = 2048;
        double v41 = v7;
        __int16 v42 = 2112;
        v43 = v16;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEBUG, "%{public}@False exit. Seconds since last entry: %f with last entry: %@", (uint8_t *)&v38, 0x20u);
      }
    }

    v31 = [MEMORY[0x1E4F1C9C8] date];
    [(HMDHomeLocationHandler *)self setLastExit:v31];

    if ((v9 & 1) == 0) {
      goto LABEL_19;
    }
LABEL_16:
    v34 = (void *)MEMORY[0x1D9452090]();
    v35 = self;
    v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v37 = HMFGetLogIdentifier();
      int v38 = 138543362;
      v39 = v37;
      _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_INFO, "%{public}@Setting isInitial to YES as this is the first exit or arrival.", (uint8_t *)&v38, 0xCu);
    }
    goto LABEL_19;
  }
  if ([(HMDHomeLocationHandler *)self regionStateAtHome] == 1)
  {
    v17 = [MEMORY[0x1E4F1C9C8] date];
    v18 = [(HMDHomeLocationHandler *)self lastExit];
    [v17 timeIntervalSinceDate:v18];
    double v20 = v19;

    v21 = [(HMDHomeLocationHandler *)self lastExit];
    uint64_t v22 = [v21 isEqualToDate:v3];

    if (v20 >= 30.0)
    {
      v23 = +[HMDEntryExitLogEvent entryLogEvent:0 isFalse:v22 isInitial:v20];
      v32 = [(HMDHomeLocationHandler *)self logEventSubmitter];
      [v32 submitLogEvent:v23];
    }
    else
    {
      v23 = +[HMDEntryExitLogEvent entryLogEvent:1 isFalse:v22 isInitial:v20];
      v24 = [(HMDHomeLocationHandler *)self logEventSubmitter];
      [v24 submitLogEvent:v23];

      v25 = (void *)MEMORY[0x1D9452090]();
      __int16 v26 = self;
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        __int16 v28 = HMFGetLogIdentifier();
        v29 = [(HMDHomeLocationHandler *)v26 lastExit];
        int v38 = 138543874;
        v39 = v28;
        __int16 v40 = 2048;
        double v41 = v20;
        __int16 v42 = 2112;
        v43 = v29;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_DEBUG, "%{public}@False entry. Seconds since last exit: %f with last exit: %@", (uint8_t *)&v38, 0x20u);
      }
    }

    v33 = [MEMORY[0x1E4F1C9C8] date];
    [(HMDHomeLocationHandler *)self setLastArrival:v33];

    if (v22) {
      goto LABEL_16;
    }
  }
LABEL_19:
}

- (void)logHomeLocationEventWithLocation:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHomeLocationHandler *)self location];

  if (v4 && v5)
  {
    double v6 = [(HMDHomeLocationHandler *)self location];
    [v6 distanceFromLocation:v4];
    double v8 = v7;

    if (v8 >= 10.0 && fabs(v8 + -10.0) >= 2.22044605e-16)
    {
      int v9 = isInternalBuild();
      v10 = (void *)MEMORY[0x1D9452090]();
      uint64_t v11 = self;
      id v12 = HMFGetOSLogHandle();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
      if (v9)
      {
        if (v13)
        {
          id v14 = HMFGetLogIdentifier();
          int v22 = 138543874;
          v23 = v14;
          __int16 v24 = 2112;
          id v25 = v4;
          __int16 v26 = 2048;
          double v27 = v8;
          id v15 = "%{public}@Submitting event updated home location [%@] & distance %f";
LABEL_14:
          _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v22, 0x20u);
        }
      }
      else if (v13)
      {
        id v14 = HMFGetLogIdentifier();
        int v22 = 138543875;
        v23 = v14;
        __int16 v24 = 2117;
        id v25 = v4;
        __int16 v26 = 2048;
        double v27 = v8;
        id v15 = "%{public}@Submitting event updated home location [%{sensitive}@] & distance %f";
        goto LABEL_14;
      }

      double v20 = +[HMDHomeLocationLogEvent updateWithHomeDistance:v8];
      v21 = [(HMDHomeLocationHandler *)v11 logEventSubmitter];
      [v21 submitLogEvent:v20];
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1D9452090]();
    v17 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      double v19 = HMFGetLogIdentifier();
      int v22 = 138543362;
      v23 = v19;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Home location is nil, not submitting event.", (uint8_t *)&v22, 0xCu);
    }
  }
}

- (void)_processPendingRegionStateUpdates
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_unfair_recursive_lock_lock_with_options();
  pendingAtHomeRegionUpdate = self->_pendingAtHomeRegionUpdate;
  pendingNearbyHomeRegionUpdate = self->_pendingNearbyHomeRegionUpdate;
  double v6 = (void *)MEMORY[0x1D9452090](v3);
  double v7 = self;
  if (!pendingAtHomeRegionUpdate)
  {
    if (!pendingNearbyHomeRegionUpdate)
    {
      HMFGetOSLogHandle();
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v23 = HMFGetLogIdentifier();
        int v54 = 138543362;
        v55 = v23;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Dropping region state update. How are we even here?", (uint8_t *)&v54, 0xCu);
      }
      goto LABEL_42;
    }
    HMFGetOSLogHandle();
    BOOL v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      id v15 = self->_pendingNearbyHomeRegionUpdate;
      int v54 = 138543618;
      v55 = v14;
      __int16 v56 = 2112;
      v57 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@processing pending nearByHome region update : %@", (uint8_t *)&v54, 0x16u);
    }
    if ([(_HMDPendingRegionUpdate *)self->_pendingNearbyHomeRegionUpdate state] == 1)
    {
      [(HMDHomeLocationHandler *)v7 setRegionStateNearbyHome:1];
      if ([(HMDHomeLocationHandler *)v7 regionStateAtHome] == 1)
      {
        double v6 = (void *)MEMORY[0x1D9452090]();
        v16 = v7;
        HMFGetOSLogHandle();
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = HMFGetLogIdentifier();
          int v54 = 138543362;
          v55 = v18;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@atHome region is inside, not notifying.", (uint8_t *)&v54, 0xCu);
        }
      }
      else
      {
        BOOL v35 = [(HMDHomeLocationHandler *)v7 regionStateAtHome] == 0;
        double v6 = (void *)MEMORY[0x1D9452090]();
        v36 = v7;
        if (!v35)
        {
          HMFGetOSLogHandle();
          v37 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            int v38 = HMFGetLogIdentifier();
            int v54 = 138543362;
            v55 = v38;
            _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@notifying of entry into nearByHome.", (uint8_t *)&v54, 0xCu);
          }
          goto LABEL_27;
        }
        HMFGetOSLogHandle();
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v39 = HMFGetLogIdentifier();
          int v54 = 138543362;
          v55 = v39;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@atHome region is still unknown, waiting for initial state before notifying.", (uint8_t *)&v54, 0xCu);
        }
      }
      goto LABEL_42;
    }
    if ([(_HMDPendingRegionUpdate *)self->_pendingNearbyHomeRegionUpdate state] != 2)
    {
      double v6 = (void *)MEMORY[0x1D9452090]();
      v29 = v7;
      HMFGetOSLogHandle();
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v30 = HMFGetLogIdentifier();
        v31 = self->_pendingNearbyHomeRegionUpdate;
        int v54 = 138543618;
        v55 = v30;
        __int16 v56 = 2112;
        v57 = v31;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Dropping nearByHome region state update. nearByHome region state is set to Unknown. [%@]", (uint8_t *)&v54, 0x16u);
      }
      goto LABEL_42;
    }
LABEL_25:
    uint64_t v22 = 2;
    [(HMDHomeLocationHandler *)v7 setRegionStateAtHome:2];
    goto LABEL_26;
  }
  if (!pendingNearbyHomeRegionUpdate)
  {
    HMFGetOSLogHandle();
    double v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      double v20 = HMFGetLogIdentifier();
      v21 = self->_pendingAtHomeRegionUpdate;
      int v54 = 138543618;
      v55 = v20;
      __int16 v56 = 2112;
      v57 = v21;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@processing pending atHome region update : %@", (uint8_t *)&v54, 0x16u);
    }
    if ([(_HMDPendingRegionUpdate *)self->_pendingAtHomeRegionUpdate state] != 1)
    {
      if ([(_HMDPendingRegionUpdate *)self->_pendingAtHomeRegionUpdate state] == 2)
      {
        [(HMDHomeLocationHandler *)v7 setRegionStateAtHome:2];
        goto LABEL_27;
      }
      double v6 = (void *)MEMORY[0x1D9452090]();
      v32 = v7;
      HMFGetOSLogHandle();
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v33 = HMFGetLogIdentifier();
        v34 = self->_pendingAtHomeRegionUpdate;
        int v54 = 138543618;
        v55 = v33;
        __int16 v56 = 2112;
        v57 = v34;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Dropping atHome region state update. atHome region state is set to Unknown. [%@]", (uint8_t *)&v54, 0x16u);
      }
      goto LABEL_42;
    }
LABEL_20:
    uint64_t v12 = 1;
    goto LABEL_21;
  }
  HMFGetOSLogHandle();
  double v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = HMFGetLogIdentifier();
    v10 = self->_pendingAtHomeRegionUpdate;
    uint64_t v11 = self->_pendingNearbyHomeRegionUpdate;
    int v54 = 138543874;
    v55 = v9;
    __int16 v56 = 2112;
    v57 = v10;
    __int16 v58 = 2112;
    v59 = v11;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@atHome & nearByHome regions are updated to new states: [atHome : %@] , [nearByHome : %@]", (uint8_t *)&v54, 0x20u);
  }
  if ([(_HMDPendingRegionUpdate *)self->_pendingAtHomeRegionUpdate state] == 1) {
    goto LABEL_20;
  }
  if ([(_HMDPendingRegionUpdate *)self->_pendingNearbyHomeRegionUpdate state] == 2) {
    goto LABEL_25;
  }
  if ([(_HMDPendingRegionUpdate *)self->_pendingAtHomeRegionUpdate state] == 2
    && [(_HMDPendingRegionUpdate *)self->_pendingNearbyHomeRegionUpdate state] == 1)
  {
    uint64_t v12 = 2;
LABEL_21:
    [(HMDHomeLocationHandler *)v7 setRegionStateAtHome:v12];
    uint64_t v22 = 1;
LABEL_26:
    [(HMDHomeLocationHandler *)v7 setRegionStateNearbyHome:v22];
LABEL_27:
    char v24 = 1;
    goto LABEL_43;
  }
  double v6 = (void *)MEMORY[0x1D9452090]();
  id v25 = v7;
  HMFGetOSLogHandle();
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    __int16 v26 = HMFGetLogIdentifier();
    double v27 = self->_pendingAtHomeRegionUpdate;
    uint64_t v28 = self->_pendingNearbyHomeRegionUpdate;
    int v54 = 138543874;
    v55 = v26;
    __int16 v56 = 2112;
    v57 = v27;
    __int16 v58 = 2112;
    v59 = v28;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Dropping region state updates. User cannot be inside atHome & outside nearByHome at the same time. [atHome=%@][nearByHome=%@]", (uint8_t *)&v54, 0x20u);
  }
LABEL_42:

  char v24 = 0;
LABEL_43:
  __int16 v40 = self->_pendingAtHomeRegionUpdate;
  self->_pendingAtHomeRegionUpdate = 0;

  double v41 = self->_pendingNearbyHomeRegionUpdate;
  self->_pendingNearbyHomeRegionUpdate = 0;

  homeRegionUpdateTimer = v7->_homeRegionUpdateTimer;
  v7->_homeRegionUpdateTimer = 0;

  os_unfair_recursive_lock_unlock();
  v43 = +[HMDRegionStateCorrectnessLogEvent updateWithRegion:[(HMDHomeLocationHandler *)v7 regionStateAtHome] nearbyHome:[(HMDHomeLocationHandler *)v7 regionStateNearbyHome] accessoryReachable:[(HMDHomeLocationHandler *)v7 firstAccessoryReachable]];
  uint64_t v44 = [(HMDHomeLocationHandler *)v7 logEventSubmitter];
  [v44 submitLogEvent:v43];

  if (v24)
  {
    v45 = [(HMDHomeLocationHandler *)v7 home];
    v46 = (void *)MEMORY[0x1D9452090]();
    v47 = v7;
    v48 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      v49 = HMFGetLogIdentifier();
      v50 = [v45 uuid];
      v51 = [v50 UUIDString];
      [(HMDHomeLocationHandler *)v47 regionStateAtHome];
      HMDRegionStateString();
      v52 = (_HMDPendingRegionUpdate *)objc_claimAutoreleasedReturnValue();
      [(HMDHomeLocationHandler *)v47 regionStateNearbyHome];
      v53 = HMDRegionStateString();
      int v54 = 138544130;
      v55 = v49;
      __int16 v56 = 2112;
      v57 = v51;
      __int16 v58 = 2112;
      v59 = v52;
      __int16 v60 = 2112;
      v61 = v53;
      _os_log_impl(&dword_1D49D5000, v48, OS_LOG_TYPE_INFO, "%{public}@Region state for home [%@] is determined using GeoFence. atHome: %@, nearbyHome: %@", (uint8_t *)&v54, 0x2Au);
    }
    [v45 regionStateUpdated];
    [(HMDHomeLocationHandler *)v47 checkFalsePresence];
  }
}

- (void)timerDidFire:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = (HMFTimer *)a3;
  if (self->_homeRegionUpdateTimer == v4)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    double v6 = self;
    double v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      double v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Region update timer fired : Processing pending region state updates", (uint8_t *)&v9, 0xCu);
    }
    [(HMDHomeLocationHandler *)v6 _processPendingRegionStateUpdates];
  }
}

- (void)coalesceRegionUpdateState:(int64_t)a3 forRegion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  os_unfair_recursive_lock_lock_with_options();
  double v7 = objc_alloc_init(_HMDPendingRegionUpdate);
  [(_HMDPendingRegionUpdate *)v7 setState:a3];
  double v8 = [(CLRegion *)self->_regionAtHome identifier];
  int v9 = [v6 identifier];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    uint64_t v12 = self;
    HMFGetOSLogHandle();
    BOOL v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      id v15 = HMDRegionStateString();
      int v32 = 138543618;
      id v33 = v14;
      __int16 v34 = 2112;
      id v35 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@atHome region updated (100m) : %@", (uint8_t *)&v32, 0x16u);
    }
    v16 = &OBJC_IVAR___HMDHomeLocationHandler__pendingAtHomeRegionUpdate;
LABEL_9:
    objc_storeStrong((id *)((char *)&self->super.super.isa + *v16), v7);
    homeRegionUpdateTimer = self->_homeRegionUpdateTimer;
    if (homeRegionUpdateTimer)
    {
      [(HMFTimer *)homeRegionUpdateTimer kick];
    }
    else
    {
      id v26 = objc_alloc(MEMORY[0x1E4F65580]);
      [(HMDHomeLocationHandler *)self coalesceRegionUpdateIntervalInSeconds];
      double v27 = (HMFTimer *)objc_msgSend(v26, "initWithTimeInterval:options:", 8);
      uint64_t v28 = self->_homeRegionUpdateTimer;
      self->_homeRegionUpdateTimer = v27;

      [(HMFTimer *)self->_homeRegionUpdateTimer setDelegateQueue:self->_workQueue];
      [(HMFTimer *)self->_homeRegionUpdateTimer setDelegate:self];
      [(HMFTimer *)self->_homeRegionUpdateTimer resume];
    }
    goto LABEL_15;
  }
  v17 = [(CLRegion *)self->_regionNearbyHome identifier];
  v18 = [v6 identifier];
  int v19 = [v17 isEqualToString:v18];

  double v20 = (void *)MEMORY[0x1D9452090]();
  v21 = self;
  if (v19)
  {
    HMFGetOSLogHandle();
    uint64_t v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      char v24 = HMDRegionStateString();
      int v32 = 138543618;
      id v33 = v23;
      __int16 v34 = 2112;
      id v35 = v24;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@nearByHome region updated (500m) : %@", (uint8_t *)&v32, 0x16u);
    }
    v16 = &OBJC_IVAR___HMDHomeLocationHandler__pendingNearbyHomeRegionUpdate;
    goto LABEL_9;
  }
  HMFGetOSLogHandle();
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    v31 = HMDRegionStateString();
    int v32 = 138543874;
    id v33 = v30;
    __int16 v34 = 2112;
    id v35 = v6;
    __int16 v36 = 2112;
    v37 = v31;
    _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Unknown region update found for region : %@ [new state: %@]", (uint8_t *)&v32, 0x20u);
  }
LABEL_15:

  os_unfair_recursive_lock_unlock();
}

- (BOOL)updateRegionStateFromLocation:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  double v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    double v8 = HMFGetLogIdentifier();
    int v26 = 138543618;
    double v27 = v8;
    __int16 v28 = 2112;
    id v29 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Current location : %@", (uint8_t *)&v26, 0x16u);
  }
  int v9 = [(HMDHomeLocationHandler *)v6 home];
  int v10 = [(HMDHomeLocationHandler *)v6 location];
  [v10 distanceFromLocation:v4];
  double v12 = v11;

  double v13 = __homeRegionNearbyRadius();
  if (v12 >= 100.0)
  {
    if (v12 < v13)
    {
      [(HMDHomeLocationHandler *)v6 setRegionStateNearbyHome:1];
      uint64_t v16 = [(HMDHomeLocationHandler *)v6 setRegionStateAtHome:2];
      goto LABEL_9;
    }
    [(HMDHomeLocationHandler *)v6 setRegionStateAtHome:2];
    id v14 = v6;
    uint64_t v15 = 2;
  }
  else
  {
    -[HMDHomeLocationHandler setRegionStateAtHome:](v6, "setRegionStateAtHome:", 1, v13);
    id v14 = v6;
    uint64_t v15 = 1;
  }
  uint64_t v16 = [(HMDHomeLocationHandler *)v14 setRegionStateNearbyHome:v15];
LABEL_9:
  v17 = (void *)MEMORY[0x1D9452090](v16);
  v18 = v6;
  int v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    double v20 = HMFGetLogIdentifier();
    v21 = [v9 uuid];
    uint64_t v22 = [v21 UUIDString];
    [(HMDHomeLocationHandler *)v18 regionStateAtHome];
    id v23 = HMDRegionStateString();
    [(HMDHomeLocationHandler *)v18 regionStateNearbyHome];
    char v24 = HMDRegionStateString();
    int v26 = 138544386;
    double v27 = v20;
    __int16 v28 = 2112;
    id v29 = v22;
    __int16 v30 = 2048;
    double v31 = v12;
    __int16 v32 = 2112;
    id v33 = v23;
    __int16 v34 = 2112;
    id v35 = v24;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Region state for home [%@] is determined using location. distance: %f meters, atHome: %@, nearbyHome: %@", (uint8_t *)&v26, 0x34u);
  }

  return 1;
}

- (void)getReachableIPAccessory:(unint64_t *)a3 btleAccessory:(unint64_t *)a4 mediaAccessory:(unint64_t *)a5
{
  id v8 = [(HMDHomeLocationHandler *)self home];
  [v8 getReachableIPAccessories:a3 btleAccessories:a4 mediaAccessories:a5];
}

- (void)didDetermineState:(int64_t)a3 forRegion:(id)a4
{
  id v6 = a4;
  double v7 = [(HMDHomeLocationHandler *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__HMDHomeLocationHandler_didDetermineState_forRegion___block_invoke;
  block[3] = &unk_1E6A16D78;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __54__HMDHomeLocationHandler_didDetermineState_forRegion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) home];
  if (!v2)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      double v7 = HMFGetLogIdentifier();
      int v11 = 138543362;
      double v12 = v7;
      id v8 = "%{public}@Home reference is nil";
      int v9 = v6;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
LABEL_8:
      _os_log_impl(&dword_1D49D5000, v9, v10, v8, (uint8_t *)&v11, 0xCu);
    }
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1E600], "hm_hmdRegionStateFromCLRegionState:", *(void *)(a1 + 48));
  if (!v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      double v7 = HMFGetLogIdentifier();
      int v11 = 138543362;
      double v12 = v7;
      id v8 = "%{public}@Not updating the region state because it is currently unknown";
      int v9 = v6;
      os_log_type_t v10 = OS_LOG_TYPE_INFO;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  [*(id *)(a1 + 32) coalesceRegionUpdateState:v3 forRegion:*(void *)(a1 + 40)];
LABEL_10:
}

- (void)didDetermineLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomeLocationHandler *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__HMDHomeLocationHandler_didDetermineLocation___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __47__HMDHomeLocationHandler_didDetermineLocation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _evaluateHomeRegionStateForCurrentDeviceLocation:*(void *)(a1 + 40)];
}

- (void)updateHomeLocationFromSingleOrCoreRoutine
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Using Single Core Routine API for HomeKit Home location", (uint8_t *)&v7, 0xCu);
  }
  [(HMDHomeLocationHandler *)v4 updateHomeLocationFromCoreRoutine];
}

- (void)updateHomeLocationFromCoreRoutine
{
  uint64_t v3 = +[HMDLocation sharedManager];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__HMDHomeLocationHandler_updateHomeLocationFromCoreRoutine__block_invoke;
  v4[3] = &unk_1E6A15310;
  v4[4] = self;
  [v3 getCoreRoutineLOIForCurrentLocationWithCompletionHandler:v4];
}

void __59__HMDHomeLocationHandler_updateHomeLocationFromCoreRoutine__block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  int v9 = isInternalBuild();
  os_log_type_t v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = *(id *)(a1 + 32);
  double v12 = HMFGetOSLogHandle();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v13)
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)__int16 v30 = 138543874;
      *(void *)&v30[4] = v14;
      *(_WORD *)&v30[12] = 2112;
      *(void *)&v30[14] = v7;
      *(_WORD *)&v30[22] = 2112;
      id v31 = v8;
      uint64_t v15 = "%{public}@Fetching LOI at current location finished with location [%@], error: %@";
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, v15, v30, 0x20u);
    }
  }
  else if (v13)
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)__int16 v30 = 138543875;
    *(void *)&v30[4] = v14;
    *(_WORD *)&v30[12] = 2117;
    *(void *)&v30[14] = v7;
    *(_WORD *)&v30[22] = 2112;
    id v31 = v8;
    uint64_t v15 = "%{public}@Fetching LOI at current location finished with location [%{sensitive}@], error: %@";
    goto LABEL_6;
  }

  if (!v7 || v8)
  {
    uint64_t v19 = isInternalBuild();
    int v20 = v19;
    char v24 = (void *)MEMORY[0x1D9452090](v19, v21, v22, v23);
    id v25 = *(id *)(a1 + 32);
    int v26 = HMFGetOSLogHandle();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v27)
      {
        __int16 v28 = HMFGetLogIdentifier();
        *(_DWORD *)__int16 v30 = 138543874;
        *(void *)&v30[4] = v28;
        *(_WORD *)&v30[12] = 2112;
        *(void *)&v30[14] = v7;
        *(_WORD *)&v30[22] = 2112;
        id v31 = v8;
        id v29 = "%{public}@Unable to get LOI at current location: %@ / %@";
LABEL_18:
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, v29, v30, 0x20u);
      }
    }
    else if (v27)
    {
      __int16 v28 = HMFGetLogIdentifier();
      *(_DWORD *)__int16 v30 = 138543875;
      *(void *)&v30[4] = v28;
      *(_WORD *)&v30[12] = 2117;
      *(void *)&v30[14] = v7;
      *(_WORD *)&v30[22] = 2112;
      id v31 = v8;
      id v29 = "%{public}@Unable to get LOI at current location: %{sensitive}@ / %@";
      goto LABEL_18;
    }

    goto LABEL_20;
  }
  if (a3) {
    uint64_t v16 = 2;
  }
  else {
    uint64_t v16 = 4;
  }
  v17 = *(void **)(a1 + 32);
  v18 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", *(_OWORD *)v30, *(void *)&v30[16], v31);
  [v17 runTransactionWithLocation:v7 updatedTime:v18 source:v16];

LABEL_20:
}

- (BOOL)isDate:(id)a3 laterThanDate:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  int v9 = self;
  os_log_type_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    [v6 timeIntervalSince1970];
    uint64_t v13 = v12;
    [v7 timeIntervalSince1970];
    int v17 = 138544386;
    v18 = v11;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2048;
    uint64_t v22 = v13;
    __int16 v23 = 2112;
    id v24 = v7;
    __int16 v25 = 2048;
    uint64_t v26 = v14;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Going to check if date1 %@ (%lf) is later than date2 %@ (%lf)", (uint8_t *)&v17, 0x34u);
  }
  if (v6)
  {
    if (v7) {
      BOOL v15 = [v6 compare:v7] == 1;
    }
    else {
      BOOL v15 = 1;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)isLocation:(id)a3 closeToLocation:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  int v9 = self;
  os_log_type_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v27 = 138543874;
    __int16 v28 = v11;
    __int16 v29 = 2112;
    __int16 v30 = v6;
    __int16 v31 = 2112;
    id v32 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Going to check if location1 %@ is close to location2 %@", (uint8_t *)&v27, 0x20u);
  }
  BOOL v12 = 1;
  if (v6 && v7)
  {
    [v6 distanceFromLocation:v7];
    double v14 = v13;
    int v15 = isInternalBuild();
    uint64_t v16 = (void *)MEMORY[0x1D9452090]();
    int v17 = v9;
    v18 = HMFGetOSLogHandle();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (v15)
    {
      if (v19)
      {
        id v20 = HMFGetLogIdentifier();
        int v27 = 138544130;
        __int16 v28 = v20;
        __int16 v29 = 2112;
        __int16 v30 = v6;
        __int16 v31 = 2112;
        id v32 = v7;
        __int16 v33 = 2048;
        double v34 = v14;
        __int16 v21 = "%{public}@Distance between location1 %@ and location2 %@: %lf";
LABEL_10:
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v27, 0x2Au);
      }
    }
    else if (v19)
    {
      id v20 = HMFGetLogIdentifier();
      int v27 = 138544131;
      __int16 v28 = v20;
      __int16 v29 = 2117;
      __int16 v30 = v6;
      __int16 v31 = 2117;
      id v32 = v7;
      __int16 v33 = 2048;
      double v34 = v14;
      __int16 v21 = "%{public}@Distance between location1 %{sensitive}@ and location2 %{sensitive}@: %lf";
      goto LABEL_10;
    }

    BOOL v12 = 0;
    if (v14 > 0.0 && v14 <= 30.0)
    {
      uint64_t v22 = (void *)MEMORY[0x1D9452090]();
      __int16 v23 = v17;
      id v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        __int16 v25 = HMFGetLogIdentifier();
        int v27 = 138543618;
        __int16 v28 = v25;
        __int16 v29 = 2112;
        __int16 v30 = &unk_1F2DCB8F8;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@The two locations are within %@ meter range.", (uint8_t *)&v27, 0x16u);
      }
      BOOL v12 = 1;
    }
  }

  return v12;
}

- (HMDHomeLocationData)locationData
{
  uint64_t v3 = [HMDHomeLocationData alloc];
  id v4 = [(HMDHomeLocationHandler *)self location];
  id v5 = [(HMDHomeLocationHandler *)self locationUpdateTimestamp];
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDHomeLocationHandler locationSource](self, "locationSource"));
  id v7 = [(HMDHomeLocationData *)v3 initWithLocation:v4 locationUpdateTimestamp:v5 locationSource:v6];

  return v7;
}

- (void)_sendLocationUpdateToClients
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDHomeLocationHandler *)self location];

  if (v3)
  {
    BOOL v12 = @"kHomeLocationKey";
    id v4 = (void *)MEMORY[0x1E4F28DB0];
    id v5 = [(HMDHomeLocationHandler *)self location];
    id v6 = [v4 archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
    v13[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

    id v8 = [MEMORY[0x1E4F65480] locationAuthorizedMessageWithName:@"kHomeLocationUpdatedNotificationKey" messagePayload:v7];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F65480] messageWithName:@"kHomeLocationUpdatedNotificationKey" messagePayload:0];
  }
  logAndPostNotification(@"HMDLocationForHomeChanged", self, 0);
  int v9 = [(HMDHomeLocationHandler *)self home];
  if (v9)
  {
    os_log_type_t v10 = [(HMDHomeLocationHandler *)self msgDispatcher];
    id v11 = [v9 uuid];
    [v10 sendMessage:v8 target:v11];
  }
}

- (BOOL)isNewHomeLocationTooCloseToPreviousLocation:(id)a3 newLocation:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 distanceFromLocation:v7];
  double v10 = v9;
  id v11 = (void *)MEMORY[0x1D9452090](v8);
  BOOL v12 = self;
  double v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    double v14 = HMFGetLogIdentifier();
    int v15 = [NSNumber numberWithDouble:v10];
    int v18 = 138543618;
    BOOL v19 = v14;
    __int16 v20 = 2112;
    __int16 v21 = v15;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@The distance between new & previous location is : %@", (uint8_t *)&v18, 0x16u);
  }
  BOOL v16 = fabs(v10 + -10.0) < 2.22044605e-16 || v10 < 10.0;

  return v16;
}

- (BOOL)shouldAllowHomeLocationUpdateWithSource:(int64_t)a3 newLocation:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!v7)
  {
    double v9 = (void *)MEMORY[0x1D9452090]();
    double v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      BOOL v12 = HMFGetLogIdentifier();
      int v24 = 138543362;
      __int16 v25 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@New location is nil, rejecting home location update.", (uint8_t *)&v24, 0xCu);
    }
    goto LABEL_15;
  }
  if ([(HMDHomeLocationHandler *)self locationSource] != 2) {
    goto LABEL_17;
  }
  int v8 = 0;
  if (a3 != 2 && a3 != 5)
  {
    id v4 = [(HMDHomeLocationHandler *)self location];
    if (v4) {
      int v8 = ![(HMDHomeLocationHandler *)self pairingHomeLocationOverride];
    }
    else {
      int v8 = 0;
    }
  }
  if (a3 == 2 || a3 == 5)
  {
    if (v8) {
      goto LABEL_13;
    }
LABEL_17:
    [(HMDHomeLocationHandler *)self setPairingHomeLocationOverride:0];
    int v17 = isInternalBuild();
    double v9 = (void *)MEMORY[0x1D9452090]();
    int v18 = self;
    id v11 = HMFGetOSLogHandle();
    BOOL v19 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v17)
    {
      if (v19)
      {
        __int16 v20 = HMFGetLogIdentifier();
        __int16 v21 = HMDHomeLocationSourceToString(a3);
        int v24 = 138543874;
        __int16 v25 = v20;
        __int16 v26 = 2112;
        id v27 = v7;
        __int16 v28 = 2112;
        __int16 v29 = v21;
        uint64_t v22 = "%{public}@Updating home location to %@ and source %@";
LABEL_22:
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, v22, (uint8_t *)&v24, 0x20u);
      }
    }
    else if (v19)
    {
      __int16 v20 = HMFGetLogIdentifier();
      __int16 v21 = HMDHomeLocationSourceToString(a3);
      int v24 = 138543875;
      __int16 v25 = v20;
      __int16 v26 = 2117;
      id v27 = v7;
      __int16 v28 = 2112;
      __int16 v29 = v21;
      uint64_t v22 = "%{public}@Updating home location to %{sensitive}@ and source %@";
      goto LABEL_22;
    }
    BOOL v16 = 1;
    goto LABEL_24;
  }

  if ((v8 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_13:
  double v9 = (void *)MEMORY[0x1D9452090]();
  double v13 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    double v14 = HMFGetLogIdentifier();
    int v15 = HMDHomeLocationSourceToString(a3);
    int v24 = 138543618;
    __int16 v25 = v14;
    __int16 v26 = 2112;
    id v27 = v15;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Rejecting home location update source: %@", (uint8_t *)&v24, 0x16u);
  }
LABEL_15:
  BOOL v16 = 0;
LABEL_24:

  return v16;
}

- (void)runTransactionWithLocation:(id)a3 updatedTime:(id)a4 source:(int64_t)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  double v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = self;
  BOOL v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    double v13 = HMFGetLogIdentifier();
    double v14 = HMDHomeLocationSourceToString(a5);
    *(_DWORD *)buf = 138543874;
    v69 = v13;
    __int16 v70 = 2112;
    id v71 = v8;
    __int16 v72 = 2112;
    v73 = v14;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Determined Location: %@, Source : %@", buf, 0x20u);
  }
  int v15 = [(HMDHomeLocationHandler *)v11 home];
  if (([v15 isOwnerUser] & 1) != 0 || objc_msgSend(v15, "isSharedAdmin"))
  {
    BOOL v16 = [HMDHomeLocationData alloc];
    int v17 = [NSNumber numberWithInteger:a5];
    id v62 = v9;
    id v63 = v8;
    uint64_t v18 = [(HMDHomeLocationData *)v16 initWithLocation:v8 locationUpdateTimestamp:v9 locationSource:v17];

    v61 = (void *)v18;
    BOOL v19 = encodeRootObject();
    __int16 v20 = [HMDHomeModel alloc];
    __int16 v21 = [v15 uuid];
    uint64_t v22 = [v15 homeManager];
    __int16 v23 = [v22 uuid];
    int v24 = [(HMDBackingStoreModelObject *)v20 initWithObjectChangeType:2 uuid:v21 parentUUID:v23];

    [(HMDHomeModel *)v24 setHomeLocationData:v19];
    if ([v15 isOwnerUser])
    {
      __int16 v25 = (void *)MEMORY[0x1D9452090]();
      __int16 v26 = v11;
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        __int16 v28 = HMFGetLogIdentifier();
        [v15 name];
        uint64_t v30 = v29 = a5;
        *(_DWORD *)buf = 138543618;
        v69 = v28;
        __int16 v70 = 2112;
        id v71 = v30;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@[%@] This is the owner user, updating home location which should result into CK push.", buf, 0x16u);

        a5 = v29;
      }

      __int16 v31 = [v15 backingStore];
      uint64_t v32 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    }
    else
    {
      if (![v15 isSharedAdmin])
      {
        __int16 v40 = 0;
        goto LABEL_15;
      }
      __int16 v33 = (void *)MEMORY[0x1D9452090]();
      double v34 = v11;
      uint64_t v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        uint64_t v36 = HMFGetLogIdentifier();
        [v15 name];
        uint64_t v38 = v37 = a5;
        *(_DWORD *)buf = 138543618;
        v69 = v36;
        __int16 v70 = 2112;
        id v71 = v38;
        _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_INFO, "%{public}@[%@] This is the shared admin, updating home location locally only will not push to CK", buf, 0x16u);

        a5 = v37;
      }

      __int16 v31 = [v15 backingStore];
      uint64_t v32 = +[HMDBackingStoreTransactionOptions defaultLocalOptions];
    }
    v39 = (void *)v32;
    __int16 v40 = [v31 transaction:@"kHomeLocationUpdatedNotificationKey" options:v32];

LABEL_15:
    double v41 = (void *)MEMORY[0x1E4F654B0];
    __int16 v42 = [(HMDHomeLocationHandler *)v11 messageDestination];
    v66 = @"HMD.LOC.SRC";
    [NSNumber numberWithInteger:a5];
    uint64_t v44 = v43 = a5;
    v67 = v44;
    v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
    v46 = [v41 messageWithName:@"kHomeLocationUpdatedNotificationKey" destination:v42 payload:v45];

    a5 = v43;
    [v40 add:v24 withMessage:v46];
    [v40 run];

    id v9 = v62;
    id v8 = v63;
  }
  if ([v15 isSharedAdmin])
  {
    v47 = (void *)MEMORY[0x1D9452090]();
    v48 = v11;
    v49 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      v50 = HMFGetLogIdentifier();
      [v15 name];
      v52 = int64_t v51 = a5;
      *(_DWORD *)buf = 138543618;
      v69 = v50;
      __int16 v70 = 2112;
      id v71 = v52;
      _os_log_impl(&dword_1D49D5000, v49, OS_LOG_TYPE_INFO, "%{public}@[%@] This is a shared admin, re-dispatching the home location to resident", buf, 0x16u);

      a5 = v51;
    }

    v53 = (void *)MEMORY[0x1E4F654B0];
    int v54 = [(HMDHomeLocationHandler *)v48 messageDestination];
    v64[0] = @"kHomeLocationDataKey";
    v55 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];
    v64[1] = @"HMD.LOC.SRC";
    v65[0] = v55;
    __int16 v56 = [NSNumber numberWithInteger:a5];
    v65[1] = v56;
    v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];
    __int16 v58 = [v53 messageWithName:@"kHomeLocationUpdatedNotificationKey" destination:v54 payload:v57];

    v59 = [v15 uuid];
    __int16 v60 = [(HMDHomeLocationHandler *)v48 workQueue];
    [v15 redispatchToResidentMessage:v58 target:v59 responseQueue:v60];
  }
}

- (BOOL)shouldUpdateLocationFromLocationData:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 location];

  if (v5)
  {
    id v6 = [v4 location];
    if (+[HMDLocation isAccurateLocation:v6])
    {
      id v7 = [v4 locationUpdateTimestamp];
      id v8 = [(HMDHomeLocationHandler *)self locationUpdateTimestamp];
      BOOL v9 = [(HMDHomeLocationHandler *)self isDate:v7 laterThanDate:v8];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    double v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = self;
    BOOL v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      double v13 = HMFGetLogIdentifier();
      int v15 = 138543362;
      BOOL v16 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Location data has nil location. Will not update location from location data", (uint8_t *)&v15, 0xCu);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_handleHomeLocationDataForHH2:(id)a3 fromMessage:(id)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v62 = a4;
  id v7 = [(HMDHomeLocationHandler *)self home];
  id v8 = [v6 location];

  if (v8)
  {
    BOOL v9 = [(HMDHomeLocationHandler *)self location];
    double v10 = [v6 locationSource];
    uint64_t v11 = (int)[v10 intValue];

    if (v9)
    {
      BOOL v12 = [v6 location];
      if (-[HMDHomeLocationHandler isNewHomeLocationTooCloseToPreviousLocation:newLocation:](self, "isNewHomeLocationTooCloseToPreviousLocation:newLocation:", v9, v12)&& (-[HMDHomeLocationHandler locationUpdateTimestamp](self, "locationUpdateTimestamp"), double v13 = objc_claimAutoreleasedReturnValue(), [v6 locationUpdateTimestamp], v14 = objc_claimAutoreleasedReturnValue(), v15 = HMFEqualObjects(), v14, v13, (v15 & 1) != 0))
      {
        int64_t v16 = [(HMDHomeLocationHandler *)self locationSource];

        if (v16 == v11)
        {
          uint64_t v17 = (void *)MEMORY[0x1D9452090]();
          uint64_t v18 = self;
          BOOL v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            __int16 v20 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v64 = v20;
            __int16 v21 = "%{public}@Not updating the home location as current location is too close to previous one";
LABEL_18:
            _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, v21, buf, 0xCu);

            goto LABEL_19;
          }
          goto LABEL_19;
        }
      }
      else
      {
      }
    }
    __int16 v26 = [v6 location];
    BOOL v27 = [(HMDHomeLocationHandler *)self shouldAllowHomeLocationUpdateWithSource:v11 newLocation:v26];

    if (v27)
    {
      int v28 = isInternalBuild();
      int64_t v29 = (void *)MEMORY[0x1D9452090]();
      uint64_t v30 = self;
      __int16 v31 = HMFGetOSLogHandle();
      BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);
      if (v28)
      {
        if (v32)
        {
          __int16 v33 = HMFGetLogIdentifier();
          double v34 = [(HMDHomeLocationHandler *)v30 location];
          [v6 location];
          uint64_t v35 = v58 = v9;
          uint64_t v36 = [v62 name];
          *(_DWORD *)buf = 138544386;
          v64 = v33;
          __int16 v65 = 2112;
          v66 = v7;
          __int16 v67 = 2112;
          v68 = v34;
          __int16 v69 = 2112;
          __int16 v70 = v35;
          __int16 v71 = 2112;
          __int16 v72 = v36;
          _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Updating location for home %@ from: %@ to %@, message: %@", buf, 0x34u);

          BOOL v9 = v58;
        }
      }
      else if (v32)
      {
        HMFGetLogIdentifier();
        int64_t v37 = v59 = v29;
        uint64_t v38 = [(HMDHomeLocationHandler *)v30 location];
        v39 = [v6 location];
        __int16 v40 = [v62 name];
        *(_DWORD *)buf = 138544387;
        v64 = v37;
        __int16 v65 = 2112;
        v66 = v7;
        __int16 v67 = 2117;
        v68 = v38;
        __int16 v69 = 2117;
        __int16 v70 = v39;
        __int16 v71 = 2112;
        __int16 v72 = v40;
        _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Updating location for home %@ from: %{sensitive}@ to %{sensitive}@, message: %@", buf, 0x34u);

        int64_t v29 = v59;
      }
      __int16 v60 = v7;

      double v41 = [v6 location];
      [(HMDHomeLocationHandler *)v30 setLocation:v41];

      __int16 v42 = [v6 locationUpdateTimestamp];
      [(HMDHomeLocationHandler *)v30 setLocationUpdateTimestamp:v42];

      [(HMDHomeLocationHandler *)v30 setLocationSource:v11];
      int64_t v43 = [(HMDHomeLocationHandler *)v30 location];
      [(HMDHomeLocationHandler *)v30 _updateTimeZone:v43];

      uint64_t v44 = [(HMDHomeLocationHandler *)v30 regionAtHome];
      if (!v44) {
        goto LABEL_26;
      }
      v45 = (void *)v44;
      v46 = [(HMDHomeLocationHandler *)v30 regionNearbyHome];

      if (!v46
        || v9
        && ([v6 location],
            v47 = objc_claimAutoreleasedReturnValue(),
            BOOL v48 = [(HMDHomeLocationHandler *)v30 isNewHomeLocationTooCloseToPreviousLocation:v9 newLocation:v47], v47, !v48))
      {
LABEL_26:
        [(HMDHomeLocationHandler *)v30 _registerForRegionUpdate];
      }
      v49 = (void *)MEMORY[0x1D9452090]([(HMDHomeLocationHandler *)v30 _sendLocationUpdateToClients]);
      v50 = v30;
      int64_t v51 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        v52 = HMFGetLogIdentifier();
        v53 = [(HMDHomeLocationHandler *)v50 locationUpdateTimestamp];
        int v54 = [v6 locationUpdateTimestamp];
        v55 = HMDHomeLocationSourceToString([(HMDHomeLocationHandler *)v50 locationSource]);
        *(_DWORD *)buf = 138544386;
        v64 = v52;
        __int16 v65 = 2112;
        v66 = v61;
        __int16 v67 = 2112;
        v68 = v53;
        __int16 v69 = 2112;
        __int16 v70 = v54;
        __int16 v71 = 2112;
        __int16 v72 = v55;
        _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_INFO, "%{public}@Updating last home location update for home %@ from: %@ to %@ with source %@", buf, 0x34u);
      }
      __int16 v56 = [v62 transactionResult];
      [v56 markChanged];

      id v7 = v61;
      goto LABEL_30;
    }
    uint64_t v17 = (void *)MEMORY[0x1D9452090]();
    uint64_t v18 = self;
    BOOL v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v64 = v20;
      __int16 v21 = "%{public}@Not saving non-LOI home location.";
      goto LABEL_18;
    }
LABEL_19:

LABEL_30:

    goto LABEL_31;
  }
  uint64_t v22 = (void *)MEMORY[0x1D9452090]();
  __int16 v23 = self;
  int v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    __int16 v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v64 = v25;
    _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@New location is nil. Will not register for region updates.", buf, 0xCu);
  }
LABEL_31:

  return 0;
}

- (id)_handleHomeLocationData:(id)a3 message:(id)a4
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (__CFString *)a4;
  id v8 = objc_alloc(MEMORY[0x1E4F28DC0]);
  BOOL v9 = [v6 homeLocationData];
  double v10 = (void *)[v8 initForReadingFromData:v9 error:0];

  uint64_t v11 = [v10 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
  BOOL v12 = [(__CFString *)v7 transactionResult];
  double v13 = [(HMDHomeLocationHandler *)self home];
  double v14 = (void *)MEMORY[0x1D9452090]();
  char v15 = self;
  int64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v113 = (uint64_t)v17;
    __int16 v114 = 2112;
    v115 = v7;
    __int16 v116 = 2112;
    v117 = v11;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@handling home location update due to %@ / locationData: %@", buf, 0x20u);
  }
  BOOL v18 = [(HMDHomeLocationHandler *)v15 shouldUpdateLocationFromLocationData:v11];
  BOOL v19 = (void *)MEMORY[0x1D9452090]();
  __int16 v20 = v15;
  __int16 v21 = HMFGetOSLogHandle();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
  if (v18)
  {
    if (v22)
    {
      __int16 v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v113 = (uint64_t)v23;
      __int16 v114 = 2112;
      v115 = v13;
      __int16 v116 = 2112;
      v117 = v11;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Updating home location for %@ with %@", buf, 0x20u);
    }
    if ([v12 source] == 3)
    {
      int v24 = [(HMDHomeLocationHandler *)v20 location];

      if (v24) {
        goto LABEL_47;
      }
      id v109 = v6;
      v110 = v10;
      __int16 v25 = (void *)MEMORY[0x1D9452090]();
      __int16 v26 = v20;
      BOOL v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        int v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v113 = (uint64_t)v28;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Saving the home location as it was pushed by legacy cloud", buf, 0xCu);
      }
LABEL_38:
      int v81 = isInternalBuild();
      v82 = (void *)MEMORY[0x1D9452090]();
      v83 = v20;
      v84 = HMFGetOSLogHandle();
      BOOL v85 = os_log_type_enabled(v84, OS_LOG_TYPE_INFO);
      if (v81)
      {
        if (v85)
        {
          v86 = HMFGetLogIdentifier();
          [(HMDHomeLocationHandler *)v83 location];
          v107 = v13;
          v87 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v88 = [(__CFString *)v11 location];
          *(_DWORD *)buf = 138544130;
          uint64_t v113 = (uint64_t)v86;
          __int16 v114 = 2112;
          v115 = v107;
          __int16 v116 = 2112;
          v117 = v87;
          __int16 v118 = 2112;
          v119 = v88;
          _os_log_impl(&dword_1D49D5000, v84, OS_LOG_TYPE_INFO, "%{public}@Updating location for home %@ from: %@ to %@", buf, 0x2Au);

          double v13 = v107;
        }
      }
      else if (v85)
      {
        HMFGetLogIdentifier();
        v89 = v108 = v82;
        [(HMDHomeLocationHandler *)v83 location];
        v90 = v13;
        v91 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v92 = [(__CFString *)v11 location];
        *(_DWORD *)buf = 138544131;
        uint64_t v113 = (uint64_t)v89;
        __int16 v114 = 2112;
        v115 = v90;
        __int16 v116 = 2117;
        v117 = v91;
        __int16 v118 = 2117;
        v119 = v92;
        _os_log_impl(&dword_1D49D5000, v84, OS_LOG_TYPE_INFO, "%{public}@Updating location for home %@ from: %{sensitive}@ to %{sensitive}@", buf, 0x2Au);

        double v13 = v90;
        v82 = v108;
      }

      v93 = [(__CFString *)v11 location];
      [(HMDHomeLocationHandler *)v83 setLocation:v93];

      v94 = [(HMDHomeLocationHandler *)v83 location];
      [(HMDHomeLocationHandler *)v83 _updateTimeZone:v94];

      v95 = +[HMDLocation sharedManager];
      [v95 startExtractingSingleLocationForDelegate:v83];

      [(HMDHomeLocationHandler *)v83 _registerForRegionUpdate];
      uint64_t v46 = [(HMDHomeLocationHandler *)v83 _sendLocationUpdateToClients];
      goto LABEL_44;
    }
    id v109 = v6;
    v110 = v10;
    double v34 = [(__CFString *)v7 numberForKey:@"HMD.LOC.SRC"];
    unint64_t v35 = (int)[v34 intValue];

    uint64_t v36 = (void *)MEMORY[0x1D9452090]([(HMDHomeLocationHandler *)v20 setLocationSource:v35]);
    int64_t v37 = v20;
    uint64_t v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v39 = HMFGetLogIdentifier();
      HMDHomeLocationSourceToString(v35);
      v105 = v37;
      __int16 v40 = v20;
      double v41 = v11;
      __int16 v42 = v7;
      int64_t v43 = v12;
      uint64_t v44 = v13;
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      uint64_t v113 = (uint64_t)v39;
      __int16 v114 = 2112;
      v115 = v45;
      _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_INFO, "%{public}@Source of the home location: %@", buf, 0x16u);

      double v13 = v44;
      BOOL v12 = v43;
      id v7 = v42;
      uint64_t v11 = v41;
      __int16 v20 = v40;
      int64_t v37 = v105;
    }
    if (v35 > 5) {
      goto LABEL_44;
    }
    if (((1 << v35) & 0x1B) != 0)
    {
      v47 = [(__CFString *)v11 location];
      [(HMDHomeLocationHandler *)v37 location];
      BOOL v48 = v37;
      v49 = v20;
      v50 = v11;
      int64_t v51 = v7;
      v52 = v12;
      int v54 = v53 = v13;
      BOOL v55 = [(HMDHomeLocationHandler *)v48 isLocation:v47 closeToLocation:v54];

      double v13 = v53;
      BOOL v12 = v52;
      id v7 = v51;
      uint64_t v11 = v50;
      __int16 v20 = v49;
      int64_t v37 = v48;

      if (!v55)
      {
LABEL_44:
        v96 = (void *)MEMORY[0x1D9452090](v46);
        v97 = v20;
        v98 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
        {
          v99 = HMFGetLogIdentifier();
          [(HMDHomeLocationHandler *)v97 locationUpdateTimestamp];
          v100 = v13;
          v101 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v102 = [(__CFString *)v11 locationUpdateTimestamp];
          *(_DWORD *)buf = 138544130;
          uint64_t v113 = (uint64_t)v99;
          __int16 v114 = 2112;
          v115 = v100;
          __int16 v116 = 2112;
          v117 = v101;
          __int16 v118 = 2112;
          v119 = v102;
          _os_log_impl(&dword_1D49D5000, v98, OS_LOG_TYPE_INFO, "%{public}@Updating last home location update for home %@ from: %@ to %@", buf, 0x2Au);

          double v13 = v100;
        }

        v103 = [(__CFString *)v11 locationUpdateTimestamp];
        [(HMDHomeLocationHandler *)v97 setLocationUpdateTimestamp:v103];

        [v12 markChanged];
        id v6 = v109;
        double v10 = v110;
        goto LABEL_47;
      }
      goto LABEL_31;
    }
    if (v35 == 2)
    {
      int v56 = isInternalBuild();
      v57 = (void *)MEMORY[0x1D9452090]();
      __int16 v58 = v37;
      v59 = HMFGetOSLogHandle();
      BOOL v60 = os_log_type_enabled(v59, OS_LOG_TYPE_INFO);
      if (v56)
      {
        if (v60)
        {
          v61 = HMFGetLogIdentifier();
          [(__CFString *)v11 location];
          id v62 = v11;
          id v63 = v7;
          v64 = v12;
          __int16 v65 = v13;
          v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          uint64_t v113 = (uint64_t)v61;
          __int16 v114 = 2112;
          v115 = v66;
          __int16 v67 = "%{public}@Used Core Routine's LOI data to determine home location : %@";
LABEL_29:
          _os_log_impl(&dword_1D49D5000, v59, OS_LOG_TYPE_INFO, v67, buf, 0x16u);

          double v13 = v65;
          BOOL v12 = v64;
          id v7 = v63;
          uint64_t v11 = v62;
        }
      }
      else if (v60)
      {
        v61 = HMFGetLogIdentifier();
        [(__CFString *)v11 location];
        id v62 = v11;
        id v63 = v7;
        v64 = v12;
        __int16 v65 = v13;
        v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543619;
        uint64_t v113 = (uint64_t)v61;
        __int16 v114 = 2117;
        v115 = v66;
        __int16 v67 = "%{public}@Used Core Routine's LOI data to determine home location : %{sensitive}@";
        goto LABEL_29;
      }
    }
    else
    {
      if (!isInternalBuild()) {
        goto LABEL_31;
      }
      v57 = (void *)MEMORY[0x1D9452090]();
      v68 = v37;
      v59 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        v61 = HMFGetLogIdentifier();
        [(__CFString *)v11 location];
        id v62 = v11;
        id v63 = v7;
        v64 = v12;
        __int16 v65 = v13;
        v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        uint64_t v113 = (uint64_t)v61;
        __int16 v114 = 2112;
        v115 = v66;
        __int16 v67 = "%{public}@Used Override to determine home location : %@";
        goto LABEL_29;
      }
    }

LABEL_31:
    uint64_t v69 = [(HMDHomeLocationHandler *)v37 location];
    if (v69)
    {
      __int16 v70 = (void *)v69;
      __int16 v71 = [(__CFString *)v11 location];

      if (v71)
      {
        v106 = v13;
        __int16 v72 = [(HMDHomeLocationHandler *)v37 location];
        uint64_t v73 = [(__CFString *)v11 location];
        BOOL v74 = [(HMDHomeLocationHandler *)v37 isNewHomeLocationTooCloseToPreviousLocation:v72 newLocation:v73];

        v75 = (void *)MEMORY[0x1D9452090]();
        v76 = v37;
        v77 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
        {
          uint64_t v78 = HMFGetLogIdentifier();
          v79 = (void *)v78;
          v80 = @"will";
          if (v74) {
            v80 = @"will not";
          }
          *(_DWORD *)buf = 138543618;
          uint64_t v113 = v78;
          __int16 v114 = 2112;
          v115 = v80;
          _os_log_impl(&dword_1D49D5000, v77, OS_LOG_TYPE_INFO, "%{public}@%@ push the new location to the cloud.", buf, 0x16u);
        }
        double v13 = v106;
        if (v74) {
          goto LABEL_44;
        }
      }
    }
    goto LABEL_38;
  }
  if (v22)
  {
    HMFGetLogIdentifier();
    int64_t v29 = v111 = v10;
    uint64_t v30 = v20;
    __int16 v31 = v7;
    BOOL v32 = v13;
    +[HMDBackingStoreTransactionOptions stringForHMDBackingStoreTransactionSource:](HMDBackingStoreTransactionOptions, "stringForHMDBackingStoreTransactionSource:", [v12 source]);
    __int16 v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    uint64_t v113 = (uint64_t)v29;
    __int16 v114 = 2112;
    v115 = v11;
    __int16 v116 = 2112;
    v117 = v33;
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Ignoring the location data %@ from %@.", buf, 0x20u);

    double v13 = v32;
    id v7 = v31;
    __int16 v20 = v30;

    double v10 = v111;
  }

LABEL_47:

  return 0;
}

- (void)_updateTimeZone:(id)a3
{
  id v4 = a3;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3042000000;
  v6[3] = __Block_byref_object_copy__166722;
  v6[4] = __Block_byref_object_dispose__166723;
  objc_initWeak(&v7, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__HMDHomeLocationHandler__updateTimeZone___block_invoke;
  v5[3] = &unk_1E6A152E8;
  v5[4] = self;
  v5[5] = v6;
  +[HMDLocation timeZoneISOCountryCodeForCLLocationAsync:v4 withCompletion:v5];
  _Block_object_dispose(v6, 8);
  objc_destroyWeak(&v7);
}

void __42__HMDHomeLocationHandler__updateTimeZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  id v8 = WeakRetained;
  if (v5 && WeakRetained)
  {
    [WeakRetained setTimeZone:v5];
    BOOL v9 = (void *)MEMORY[0x1D9452090]([v8 setIsoCountryCode:v6]);
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      BOOL v12 = HMFGetLogIdentifier();
      double v13 = [v8 timeZone];
      double v14 = [v8 isoCountryCode];
      int v15 = 138543874;
      int64_t v16 = v12;
      __int16 v17 = 2112;
      BOOL v18 = v13;
      __int16 v19 = 2112;
      __int16 v20 = v14;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating timezone %@, country: %@", (uint8_t *)&v15, 0x20u);
    }
  }
}

- (void)_evaluateHomeRegionStateForCurrentDeviceLocation:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHomeLocationHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDHomeLocationHandler *)self home];
  int v7 = isInternalBuild();
  id v8 = (void *)MEMORY[0x1D9452090]();
  BOOL v9 = self;
  id v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v11)
    {
      BOOL v12 = HMFGetLogIdentifier();
      double v13 = [v6 uuid];
      double v14 = [v13 UUIDString];
      int v15 = [(HMDHomeLocationHandler *)v9 location];
      *(_DWORD *)buf = 138544130;
      unint64_t v35 = v12;
      __int16 v36 = 2112;
      int64_t v37 = v14;
      __int16 v38 = 2112;
      v39 = v15;
      __int16 v40 = 2112;
      id v41 = v4;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Evaluating current device region state for home %@ using home location %@ and device location %@", buf, 0x2Au);
    }
  }
  else if (v11)
  {
    int64_t v16 = HMFGetLogIdentifier();
    __int16 v17 = [v6 uuid];
    BOOL v18 = [v17 UUIDString];
    __int16 v19 = [(HMDHomeLocationHandler *)v9 location];
    *(_DWORD *)buf = 138544131;
    unint64_t v35 = v16;
    __int16 v36 = 2112;
    int64_t v37 = v18;
    __int16 v38 = 2117;
    v39 = v19;
    __int16 v40 = 2117;
    id v41 = v4;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Evaluating current device region state for home %@ using home location %{sensitive}@ and device location %{sensitive}@", buf, 0x2Au);
  }
  __int16 v20 = [(HMDHomeLocationHandler *)v9 location];
  if (v4) {
    BOOL v21 = v20 == 0;
  }
  else {
    BOOL v21 = 1;
  }
  int v22 = !v21;

  if (v22)
  {
    uint64_t v23 = [(HMDHomeLocationHandler *)v9 updateRegionStateFromLocation:v4];
  }
  else if (v4)
  {
    objc_initWeak((id *)buf, v9);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __75__HMDHomeLocationHandler__evaluateHomeRegionStateForCurrentDeviceLocation___block_invoke;
    v32[3] = &unk_1E6A152C0;
    objc_copyWeak(&v33, (id *)buf);
    +[HMDLocation timeZoneISOCountryCodeForCLLocationAsync:v4 withCompletion:v32];
    objc_destroyWeak(&v33);
    objc_destroyWeak((id *)buf);
  }
  int v24 = (void *)MEMORY[0x1D9452090](v23);
  __int16 v25 = v9;
  __int16 v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    BOOL v27 = HMFGetLogIdentifier();
    int v28 = [v6 uuid];
    int64_t v29 = [v28 UUIDString];
    [(HMDHomeLocationHandler *)v25 regionStateAtHome];
    uint64_t v30 = HMDRegionStateString();
    [(HMDHomeLocationHandler *)v25 regionStateNearbyHome];
    __int16 v31 = HMDRegionStateString();
    *(_DWORD *)buf = 138544130;
    unint64_t v35 = v27;
    __int16 v36 = 2114;
    int64_t v37 = v29;
    __int16 v38 = 2112;
    v39 = v30;
    __int16 v40 = 2112;
    id v41 = v31;
    _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@AtHome region state and NearbyHome region state for home %{public}@ are determined as %@ and %@ respectively", buf, 0x2Au);
  }
  [v6 regionStateUpdated];
}

void __75__HMDHomeLocationHandler__evaluateHomeRegionStateForCurrentDeviceLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (v5 && WeakRetained)
  {
    BOOL v9 = (void *)MEMORY[0x1D9452090]([WeakRetained setIsoCountryCode:v6]);
    id v10 = v8;
    BOOL v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      BOOL v12 = HMFGetLogIdentifier();
      double v13 = [v10 isoCountryCode];
      int v14 = 138543618;
      int v15 = v12;
      __int16 v16 = 2112;
      __int16 v17 = v13;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating device isoCountry code: %@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (BOOL)_shouldUpdateHomeLocation
{
  BOOL v3 = [(HMDHomeLocationHandler *)self _canExtractLocation];
  if (v3)
  {
    LOBYTE(v3) = [(HMDHomeLocationHandler *)self _needToExtractLocations];
  }
  return v3;
}

- (BOOL)_needToExtractLocations
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDHomeLocationHandler *)self location];

  if (!v3)
  {
    double v34 = (void *)MEMORY[0x1D9452090]();
    unint64_t v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      __int16 v36 = HMFGetLogIdentifier();
      int v42 = 138543362;
      int64_t v43 = v36;
      _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Location is not known, need to extract location", (uint8_t *)&v42, 0xCu);
    }
    return 1;
  }
  id v4 = [(HMDHomeLocationHandler *)self locationUpdateTimestamp];

  if (!v4) {
    goto LABEL_9;
  }
  id v5 = [(HMDHomeLocationHandler *)self locationUpdateTimestamp];
  [v5 timeIntervalSinceNow];
  double v7 = fabs(v6);

  id v8 = (void *)MEMORY[0x1D9452090]();
  BOOL v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    BOOL v11 = HMFGetLogIdentifier();
    BOOL v12 = [(HMDHomeLocationHandler *)v9 home];
    double v13 = HMFTimeIntervalDescription();
    getLocationUpdateTimeInterval();
    int v14 = HMFTimeIntervalDescription();
    int v42 = 138544130;
    int64_t v43 = v11;
    __int16 v44 = 2112;
    v45 = v12;
    __int16 v46 = 2112;
    v47 = v13;
    __int16 v48 = 2112;
    v49 = v14;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Time since last location update for home %@ is %@. Update interval is %@", (uint8_t *)&v42, 0x2Au);
  }
  if (v7 >= getLocationUpdateTimeInterval())
  {
LABEL_9:
    __int16 v20 = [(HMDHomeLocationHandler *)self lastAttemptedLocationUpdate];

    if (v20)
    {
      double LocationUpdateTimeInterval = getLocationUpdateTimeInterval();
      int v22 = (void *)MEMORY[0x1D9452090]();
      uint64_t v23 = self;
      int v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        __int16 v25 = HMFGetLogIdentifier();
        __int16 v26 = [(HMDHomeLocationHandler *)v23 home];
        BOOL v27 = [(HMDHomeLocationHandler *)v23 lastAttemptedLocationUpdate];
        int v28 = HMFTimeIntervalDescription();
        int v42 = 138544130;
        int64_t v43 = v25;
        __int16 v44 = 2112;
        v45 = v26;
        __int16 v46 = 2112;
        v47 = v27;
        __int16 v48 = 2112;
        v49 = v28;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Last location attempt for home %@ is %@. Update interval is %@", (uint8_t *)&v42, 0x2Au);
      }
      int64_t v29 = [(HMDHomeLocationHandler *)v23 lastAttemptedLocationUpdate];
      uint64_t v30 = [MEMORY[0x1E4F1C9C8] date];
      [v29 timeIntervalSinceDate:v30];
      double v32 = fabs(v31);

      if (v32 < LocationUpdateTimeInterval || vabdd_f64(v32, LocationUpdateTimeInterval) < 2.22044605e-16)
      {
        uint64_t v38 = MEMORY[0x1D9452090]();
        v39 = v23;
        __int16 v40 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          id v41 = HMFGetLogIdentifier();
          int v42 = 138543362;
          int64_t v43 = v41;
          _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_INFO, "%{public}@Not evalutating home location as last attempted time is below threshold.", (uint8_t *)&v42, 0xCu);
        }
        __int16 v19 = (void *)v38;
        goto LABEL_22;
      }
      id v33 = [MEMORY[0x1E4F1C9C8] date];
      [(HMDHomeLocationHandler *)v23 setLastAttemptedLocationUpdate:v33];
    }
    return 1;
  }
  uint64_t v15 = MEMORY[0x1D9452090]();
  __int16 v16 = v9;
  __int16 v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = HMFGetLogIdentifier();
    int v42 = 138543362;
    int64_t v43 = v18;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Not extracting location as not enough time has passed.", (uint8_t *)&v42, 0xCu);
  }
  __int16 v19 = (void *)v15;
LABEL_22:
  return 0;
}

- (BOOL)_canExtractLocation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDHomeLocationHandler *)self home];
  id v4 = v3;
  if (!v3)
  {
    double v6 = (void *)MEMORY[0x1D9452090]();
    HMFGetOSLogHandle();
    double v7 = (HMDHomeLocationHandler *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

      BOOL v5 = 0;
      goto LABEL_14;
    }
    id v8 = HMFGetLogIdentifier();
    int v14 = 138543362;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1D49D5000, &v7->super.super, OS_LOG_TYPE_ERROR, "%{public}@No home reference?", (uint8_t *)&v14, 0xCu);
    goto LABEL_12;
  }
  if (([v3 isAdminUser] & 1) == 0)
  {
    double v6 = (void *)MEMORY[0x1D9452090]();
    double v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      BOOL v9 = HMFGetLogIdentifier();
      int v14 = 138543362;
      uint64_t v15 = v9;
      id v10 = "%{public}@Not evaluating home location as user is not Admin.";
      BOOL v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
LABEL_11:
      _os_log_impl(&dword_1D49D5000, v11, v12, v10, (uint8_t *)&v14, 0xCu);
    }
LABEL_12:

    goto LABEL_13;
  }
  if ([(HMDHomeLocationHandler *)self locationAuthorization] != 1)
  {
    double v6 = (void *)MEMORY[0x1D9452090]();
    double v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      BOOL v9 = HMFGetLogIdentifier();
      int v14 = 138543362;
      uint64_t v15 = v9;
      id v10 = "%{public}@homed is not authorized for location services";
      BOOL v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  BOOL v5 = 1;
LABEL_14:

  return v5;
}

- (BOOL)_hasReachableAccessoriesExcludingMatter
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDHomeLocationHandler *)self home];
  id v4 = v3;
  if (!v3)
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    HMFGetOSLogHandle();
    BOOL v9 = (HMDHomeLocationHandler *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      BOOL v7 = 0;
      goto LABEL_10;
    }
    id v10 = HMFGetLogIdentifier();
    int v13 = 138543362;
    int v14 = v10;
    _os_log_impl(&dword_1D49D5000, &v9->super.super, OS_LOG_TYPE_ERROR, "%{public}@No home reference?", (uint8_t *)&v13, 0xCu);
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v5 = [v3 reachableAccessoriesCountExcludingMatter];
  uint64_t v6 = [v4 reachableAppleMediaAccessoriesCount];
  if ((v6 + v5 < 0) ^ __OFADD__(v6, v5) | (v6 + v5 == 0))
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    BOOL v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      int v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v4;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Home %@ does not have any reachable accessories, no need to extract location", (uint8_t *)&v13, 0x16u);
    }
    goto LABEL_8;
  }
  BOOL v7 = 1;
LABEL_10:

  return v7;
}

- (void)accessoriesBecomeUnreachable
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@The last accessory becomes unreachable, trying to stop extracting location.", (uint8_t *)&v7, 0xCu);
  }
  [(HMDHomeLocationHandler *)v4 setFirstAccessoryReachable:0];
}

- (void)accessoriesBecomeReachable
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v18 = 138543362;
    __int16 v19 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@The first accessory becomes reachable, evaluating to extract location.", (uint8_t *)&v18, 0xCu);
  }
  [(HMDHomeLocationHandler *)v4 setFirstAccessoryReachable:1];
  if ([(HMDHomeLocationHandler *)v4 _hasReachableAccessoriesExcludingMatter])
  {
    if ([(HMDHomeLocationHandler *)v4 _shouldUpdateHomeLocation])
    {
      int v7 = (void *)MEMORY[0x1D9452090]();
      id v8 = v4;
      uint64_t v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = HMFGetLogIdentifier();
        BOOL v11 = [(HMDHomeLocationHandler *)v8 home];
        int v18 = 138543618;
        __int16 v19 = v10;
        __int16 v20 = 2112;
        BOOL v21 = v11;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Accessories are reachable, extracting location for home %@", (uint8_t *)&v18, 0x16u);
      }
      os_log_type_t v12 = +[HMDRegionStateCorrectnessLogEvent updateWithFirstAccessory:[(HMDHomeLocationHandler *)v8 regionStateAtHome] nearbyHome:[(HMDHomeLocationHandler *)v8 regionStateNearbyHome]];
      int v13 = [(HMDHomeLocationHandler *)v8 logEventSubmitter];
      [v13 submitLogEvent:v12];

      [(HMDHomeLocationHandler *)v8 updateHomeLocationFromSingleOrCoreRoutine];
    }
  }
  else
  {
    int v14 = (void *)MEMORY[0x1D9452090]();
    __int16 v15 = v4;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      int v18 = 138543362;
      __int16 v19 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@No reachable accessories, not extracting location.", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (void)updateHomeLocation
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(HMDHomeLocationHandler *)self locationAuthorization] == 1)
  {
    BOOL v3 = [(HMDHomeLocationHandler *)self home];
    int v4 = [v3 isAdminUser];

    if (v4)
    {
      uint64_t v5 = (void *)MEMORY[0x1D9452090]();
      uint64_t v6 = self;
      int v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = HMFGetLogIdentifier();
        int v10 = 138543362;
        BOOL v11 = v8;
        _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Extracting home location", (uint8_t *)&v10, 0xCu);
      }
      uint64_t v9 = +[HMDLocation sharedManager];
      [v9 startExtractingSingleLocationForDelegate:v6];
    }
  }
}

- (void)_handleLocationAuthorization:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(HMDHomeLocationHandler *)self locationAuthorization] != a3)
  {
    uint64_t v5 = [(HMDHomeLocationHandler *)self setLocationAuthorization:a3];
    if (a3 == 1)
    {
      [(HMDHomeLocationHandler *)self _registerForRegionUpdate];
      id v10 = +[HMDLocation sharedManager];
      [v10 startExtractingSingleLocationForDelegate:self];
    }
    else if (a3 == 2)
    {
      uint64_t v6 = (void *)MEMORY[0x1D9452090](v5);
      int v7 = self;
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v12 = v9;
        _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Received a call back that the location is not allowed for homed", buf, 0xCu);
      }
    }
  }
}

- (void)_handleLocationAuthorizationChangedNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  uint64_t v6 = objc_msgSend(v5, "hmf_numberForKey:", @"HMDLocationAuthorizationKey");

  if (v6)
  {
    -[HMDHomeLocationHandler _handleLocationAuthorization:](self, "_handleLocationAuthorization:", [v6 integerValue]);
  }
  else
  {
    int v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      BOOL v11 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@No location authorization", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (BOOL)_shouldRegisterForSignificantRegion
{
  if (isiOSDevice()) {
    return 1;
  }
  return isMac();
}

- (void)_registerForRegionUpdate
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDHomeLocationHandler *)self home];
  if (v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    uint64_t v5 = [(HMDHomeLocationHandler *)self regionAtHome];

    if (v5)
    {
      uint64_t v6 = (void *)MEMORY[0x1D9452090]();
      int v7 = self;
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v72 = v9;
        _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Deregistering for old location at home region updates", buf, 0xCu);
      }
      int v10 = [(HMDHomeLocationHandler *)v7 regionAtHome];
      [v4 addObject:v10];
    }
    BOOL v11 = [(HMDHomeLocationHandler *)self regionNearbyHome];

    if (v11)
    {
      uint64_t v12 = (void *)MEMORY[0x1D9452090]();
      uint64_t v13 = self;
      int v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        __int16 v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v72 = v15;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Deregistering for old location nearby home region updates", buf, 0xCu);
      }
      uint64_t v16 = [(HMDHomeLocationHandler *)v13 regionNearbyHome];
      [v4 addObject:v16];
    }
    if ([v4 count])
    {
      uint64_t v17 = +[HMDLocation sharedManager];
      int v18 = (void *)[v4 copy];
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __50__HMDHomeLocationHandler__registerForRegionUpdate__block_invoke;
      v69[3] = &unk_1E6A197F0;
      v69[4] = self;
      [v17 deregisterForRegionUpdate:v18 completionHandler:v69];
    }
    __int16 v19 = [(HMDHomeLocationHandler *)self location];

    if (v19)
    {
      __int16 v20 = (void *)MEMORY[0x1D9452090]();
      BOOL v21 = self;
      uint64_t v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v72 = v23;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Registering for new location at home region and nearby home region updates", buf, 0xCu);
      }
      BOOL v24 = [(HMDHomeLocationHandler *)v21 _shouldRegisterForSignificantRegion];
      __int16 v25 = (void *)MEMORY[0x1D9452090]();
      __int16 v26 = v21;
      BOOL v27 = HMFGetOSLogHandle();
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
      if (v24)
      {
        if (v28)
        {
          int64_t v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          __int16 v72 = v29;
          _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Using significant region for atHome GeoFence", buf, 0xCu);
        }
        id v30 = objc_alloc(MEMORY[0x1E4F1E6A0]);
        double v31 = [(HMDHomeLocationHandler *)v26 location];
        [v31 coordinate];
        double v33 = v32;
        double v35 = v34;
        __int16 v36 = [MEMORY[0x1E4F29128] UUID];
        int64_t v37 = [v36 UUIDString];
        uint64_t v38 = objc_msgSend(v30, "initWithCenter:radius:identifier:", v37, v33, v35, 100.0);
      }
      else
      {
        if (v28)
        {
          int64_t v43 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          __int16 v72 = v43;
          _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Using circular region for atHome GeoFence", buf, 0xCu);
        }
        id v44 = objc_alloc(MEMORY[0x1E4F1E5A8]);
        double v31 = [(HMDHomeLocationHandler *)v26 location];
        [v31 coordinate];
        double v46 = v45;
        double v48 = v47;
        __int16 v36 = [MEMORY[0x1E4F29128] UUID];
        int64_t v37 = [v36 UUIDString];
        uint64_t v38 = objc_msgSend(v44, "initWithCenter:radius:identifier:nearbyAllowed:", v37, 1, v46, v48, 100.0);
      }
      v49 = (void *)v38;
      [(HMDHomeLocationHandler *)v26 setRegionAtHome:v38];

      uint64_t v50 = [(HMDHomeLocationHandler *)v26 regionAtHome];
      [v50 setNotifyOnExit:1];

      int64_t v51 = [(HMDHomeLocationHandler *)v26 regionAtHome];
      [v51 setNotifyOnEntry:1];

      double v52 = __homeRegionNearbyRadius();
      id v53 = objc_alloc(MEMORY[0x1E4F1E5A8]);
      int v54 = [(HMDHomeLocationHandler *)v26 location];
      [v54 coordinate];
      double v56 = v55;
      double v58 = v57;
      v59 = [MEMORY[0x1E4F29128] UUID];
      BOOL v60 = [v59 UUIDString];
      v61 = objc_msgSend(v53, "initWithCenter:radius:identifier:nearbyAllowed:", v60, 1, v56, v58, v52);
      [(HMDHomeLocationHandler *)v26 setRegionNearbyHome:v61];

      id v62 = [(HMDHomeLocationHandler *)v26 regionNearbyHome];
      [v62 setNotifyOnExit:1];

      id v63 = [(HMDHomeLocationHandler *)v26 regionNearbyHome];
      [v63 setNotifyOnEntry:1];

      v64 = +[HMDLocation sharedManager];
      __int16 v65 = [(HMDHomeLocationHandler *)v26 regionAtHome];
      v70[0] = v65;
      v66 = [(HMDHomeLocationHandler *)v26 regionNearbyHome];
      v70[1] = v66;
      __int16 v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __50__HMDHomeLocationHandler__registerForRegionUpdate__block_invoke_51;
      v68[3] = &unk_1E6A197F0;
      v68[4] = v26;
      [v64 registerForRegionUpdate:v67 withDelegate:v26 completionHandler:v68];
    }
  }
  else
  {
    v39 = (void *)MEMORY[0x1D9452090]();
    __int16 v40 = self;
    id v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      int v42 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v72 = v42;
      _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_ERROR, "%{public}@Home reference is nil", buf, 0xCu);
    }
  }
}

void __50__HMDHomeLocationHandler__registerForRegionUpdate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Region update deregistered with error: %@", (uint8_t *)&v8, 0x16u);
  }
}

void __50__HMDHomeLocationHandler__registerForRegionUpdate__block_invoke_51(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Region update registered with error: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_registerForMessages
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDHomeLocationHandler *)self msgDispatcher];
  id v4 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v7[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v3 registerForMessage:@"kRetrieveHomeLocationRequestKey" receiver:self policies:v5 selector:sel__handleRetrieveLocation_];

  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel__handleLocationAuthorizationChangedNotification_ name:@"HMDLocationAuthorizationChangedNotification" object:0];
}

- (void)configure:(id)a3 queue:(id)a4 messageDispatcher:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(HMDHomeLocationHandler *)self setHome:v8];
  [(HMDHomeLocationHandler *)self setWorkQueue:v9];
  [(HMDHomeLocationHandler *)self setMsgDispatcher:v10];
  int v11 = isInternalBuild();
  uint64_t v12 = (void *)MEMORY[0x1D9452090]();
  uint64_t v13 = self;
  int v14 = HMFGetOSLogHandle();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v15)
    {
      uint64_t v16 = HMFGetLogIdentifier();
      location = v13->_location;
      int v18 = [(NSDate *)v13->_locationUpdateTimestamp hmf_localTimeDescription];
      __int16 v19 = HMDHomeLocationSourceToString(v13->_locationSource);
      int v23 = 138544386;
      BOOL v24 = v16;
      __int16 v25 = 2112;
      id v26 = v8;
      __int16 v27 = 2112;
      BOOL v28 = location;
      __int16 v29 = 2112;
      id v30 = v18;
      __int16 v31 = 2112;
      double v32 = v19;
      __int16 v20 = "%{public}@Configured location handler for home %@, with: %@, and timestamp with: %@, and source: %@";
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v23, 0x34u);
    }
  }
  else if (v15)
  {
    uint64_t v16 = HMFGetLogIdentifier();
    BOOL v21 = v13->_location;
    int v18 = [(NSDate *)v13->_locationUpdateTimestamp hmf_localTimeDescription];
    __int16 v19 = HMDHomeLocationSourceToString(v13->_locationSource);
    int v23 = 138544387;
    BOOL v24 = v16;
    __int16 v25 = 2112;
    id v26 = v8;
    __int16 v27 = 2117;
    BOOL v28 = v21;
    __int16 v29 = 2112;
    id v30 = v18;
    __int16 v31 = 2112;
    double v32 = v19;
    __int16 v20 = "%{public}@Configured location handler for home %@, with: %{sensitive}@, and timestamp with: %@, and source: %@";
    goto LABEL_6;
  }

  [(HMDHomeLocationHandler *)v13 _updateTimeZone:v13->_location];
  [(HMDHomeLocationHandler *)v13 _registerForMessages];
  uint64_t v22 = +[HMDLocation sharedManager];
  -[HMDHomeLocationHandler _handleLocationAuthorization:](v13, "_handleLocationAuthorization:", [v22 locationAuthorized]);
}

- (void)dealloc
{
  id v3 = [(HMDHomeLocationHandler *)self msgDispatcher];
  [v3 deregisterReceiver:self];

  v4.receiver = self;
  v4.super_class = (Class)HMDHomeLocationHandler;
  [(HMDHomeLocationHandler *)&v4 dealloc];
}

- (HMDHomeLocationHandler)init
{
  v15.receiver = self;
  v15.super_class = (Class)HMDHomeLocationHandler;
  v2 = [(HMDHomeLocationHandler *)&v15 init];
  id v3 = v2;
  if (v2)
  {
    v2->_locationAuthorization = 0;
    v2->_coalesceRegionUpdateIntervalInSeconds = 3.0;
    v2->_firstAccessoryReachable = 0;
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
    lastArrival = v3->_lastArrival;
    v3->_lastArrival = (NSDate *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
    lastExit = v3->_lastExit;
    v3->_lastExit = (NSDate *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:0.0];
    lastAttemptedLocationUpdate = v3->_lastAttemptedLocationUpdate;
    v3->_lastAttemptedLocationUpdate = (NSDate *)v8;

    v3->_resendOnce = 0;
    v3->_shouldUpdateHomeLocation = 0;
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
    homeLocationUpdateRequestTime = v3->_homeLocationUpdateRequestTime;
    v3->_homeLocationUpdateRequestTime = (NSDate *)v10;

    v3->_regionStateAtHome = 0;
    v3->_regionStateNearbyHome = 0;
    uint64_t v12 = +[HMDMetricsManager sharedLogEventSubmitter];
    logEventSubmitter = v3->_logEventSubmitter;
    v3->_logEventSubmitter = (HMMLogEventSubmitting *)v12;

    v3->_pairingHomeLocationOverride = 0;
  }
  return v3;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(HMDHomeLocationHandler *)self location];
  id v5 = locationAsString(v4);
  uint64_t v6 = [(HMDHomeLocationHandler *)self locationUpdateTimestamp];
  int v7 = objc_msgSend(v6, "hmf_localTimeDescription");
  uint64_t v8 = HMDHomeLocationSourceToString([(HMDHomeLocationHandler *)self locationSource]);
  id v9 = (void *)[v3 initWithFormat:@"Loc: %@, Timestamp: %@, Source: %@", v5, v7, v8];

  return (NSString *)v9;
}

uint64_t __37__HMDHomeLocationHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v101;
  logCategory__hmf_once_v101 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end