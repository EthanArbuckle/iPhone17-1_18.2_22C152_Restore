@interface HMDDoorbellChimeController
+ (id)logCategory;
- (HMDDoorbellChimeController)initWithContext:(id)a3;
- (HMDDoorbellChimeController)initWithWorkQueue:(id)a3 accessory:(id)a4;
- (HMDDoorbellChimeControllerContext)context;
- (NSDate)lastUnidentifiedChimeDate;
- (NSSet)availableCharacteristics;
- (id)clientIdentifier;
- (id)logIdentifier;
- (unint64_t)_numHomePodsWithDoorbellChimeEnabled;
- (void)_handleCharacteristicsValueUpdatedNotification:(id)a3;
- (void)_notifyAllAccessoriesForDoorbellPressAndPlayChimeSound:(BOOL)a3 attemptCloudPullIfNoPersonsFound:(BOOL)a4;
- (void)configure;
- (void)dealloc;
- (void)handleCharacteristicsValueUpdatedNotification:(id)a3;
- (void)handleUpdatedPersonIdentificationInformation;
- (void)listener:(id)a3 didUpdateAvailableCharacteristics:(id)a4;
- (void)notifyAccessoriesViaCoordinationFreePathWithDelay:(double)a3 home:(id)a4 shouldPlayChime:(BOOL)a5 personIdentificationText:(id)a6 accessoriesToNotify:(id)a7 logEvent:(id)a8 accessoryUUID:(id)a9;
- (void)setAvailableCharacteristics:(id)a3;
- (void)setLastUnidentifiedChimeDate:(id)a3;
@end

@implementation HMDDoorbellChimeController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUnidentifiedChimeDate, 0);
  objc_storeStrong((id *)&self->_availableCharacteristics, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)setLastUnidentifiedChimeDate:(id)a3
{
}

- (NSDate)lastUnidentifiedChimeDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAvailableCharacteristics:(id)a3
{
}

- (NSSet)availableCharacteristics
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (HMDDoorbellChimeControllerContext)context
{
  return (HMDDoorbellChimeControllerContext *)objc_getProperty(self, a2, 8, 1);
}

- (void)listener:(id)a3 didUpdateAvailableCharacteristics:(id)a4
{
  id v5 = a4;
  [(HMDDoorbellChimeController *)self setAvailableCharacteristics:v5];
  id v9 = [(HMDDoorbellChimeController *)self context];
  v6 = [v9 accessory];
  v7 = [v5 allObjects];

  v8 = [(HMDDoorbellChimeController *)self clientIdentifier];
  [v6 setNotificationsEnabled:1 forCharacteristics:v7 clientIdentifier:v8];
}

- (id)logIdentifier
{
  v2 = [(HMDDoorbellChimeController *)self context];
  v3 = [v2 accessory];
  v4 = [v3 uuid];
  id v5 = [v4 UUIDString];

  return v5;
}

- (void)handleCharacteristicsValueUpdatedNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDDoorbellChimeController *)self context];
  char v6 = [v5 isCurrentDevicePrimaryResident];

  if (v6)
  {
    v7 = [(HMDDoorbellChimeController *)self context];
    v8 = [v7 workQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __76__HMDDoorbellChimeController_handleCharacteristicsValueUpdatedNotification___block_invoke;
    v13[3] = &unk_1E6A197C8;
    v13[4] = self;
    id v14 = v4;
    dispatch_async(v8, v13);
  }
  else
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring characteristic value updated notification since we are not the primary resident", buf, 0xCu);
    }
  }
}

uint64_t __76__HMDDoorbellChimeController_handleCharacteristicsValueUpdatedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCharacteristicsValueUpdatedNotification:*(void *)(a1 + 40)];
}

- (unint64_t)_numHomePodsWithDoorbellChimeEnabled
{
  v2 = [(HMDDoorbellChimeController *)self context];
  v3 = [v2 accessory];
  id v4 = [v3 home];
  id v5 = [v4 accessories];
  char v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_42_96785);

  v7 = objc_msgSend(v6, "na_filter:", &__block_literal_global_45_96786);
  unint64_t v8 = [v7 count];

  return v8;
}

uint64_t __66__HMDDoorbellChimeController__numHomePodsWithDoorbellChimeEnabled__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isHomePod]) {
    uint64_t v3 = [v2 isDoorbellChimeSettingEnabled];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

id __66__HMDDoorbellChimeController__numHomePodsWithDoorbellChimeEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)notifyAccessoriesViaCoordinationFreePathWithDelay:(double)a3 home:(id)a4 shouldPlayChime:(BOOL)a5 personIdentificationText:(id)a6 accessoriesToNotify:(id)a7 logEvent:(id)a8 accessoryUUID:(id)a9
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v21 = (void *)MEMORY[0x1D9452090]();
  v22 = self;
  v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v36 = v24;
    __int16 v37 = 2112;
    id v38 = v18;
    _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Taking HomeKit path to notify: %@", buf, 0x16u);
  }
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __169__HMDDoorbellChimeController_notifyAccessoriesViaCoordinationFreePathWithDelay_home_shouldPlayChime_personIdentificationText_accessoriesToNotify_logEvent_accessoryUUID___block_invoke;
  v30[3] = &unk_1E6A0EA10;
  v30[4] = v22;
  BOOL v34 = a5;
  id v25 = v17;
  id v31 = v25;
  double v33 = a3;
  id v26 = v20;
  id v32 = v26;
  objc_msgSend(v18, "na_each:", v30);
  if (v25)
  {
    [(HMDDoorbellChimeController *)v22 setLastUnidentifiedChimeDate:0];
  }
  else
  {
    v27 = [MEMORY[0x1E4F1C9C8] date];
    [(HMDDoorbellChimeController *)v22 setLastUnidentifiedChimeDate:v27];
  }
  v28 = [(HMDDoorbellChimeController *)v22 context];
  v29 = [v28 logEventSubmitter];
  [v29 submitLogEvent:v19];
}

uint64_t __169__HMDDoorbellChimeController_notifyAccessoriesViaCoordinationFreePathWithDelay_home_shouldPlayChime_personIdentificationText_accessoriesToNotify_logEvent_accessoryUUID___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) context];
  int v4 = [v3 accessorySupportsCoordinationFreeDoorbellChime:v12];

  id v6 = v12;
  if (v4)
  {
    id v5 = v12;
    uint64_t v7 = *(void *)(a1 + 40);
    if (*(unsigned char *)(a1 + 64))
    {
      if (v7) {
        uint64_t v8 = 3;
      }
      else {
        uint64_t v8 = 1;
      }
    }
    else
    {
      if (!v7) {
        goto LABEL_9;
      }
      uint64_t v8 = 2;
    }
    id v9 = [v12 doorbellChimeProfile];
    v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:*(double *)(a1 + 56)];
    [v9 sendDoorbellChimeMessageWithChimeMode:v8 chimeDate:v10 personIdentificationText:*(void *)(a1 + 40) accessoryUUID:*(void *)(a1 + 48)];

    id v6 = v12;
  }
LABEL_9:
  return MEMORY[0x1F41817F8](v5, v6);
}

- (void)_notifyAllAccessoriesForDoorbellPressAndPlayChimeSound:(BOOL)a3 attemptCloudPullIfNoPersonsFound:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(HMDDoorbellChimeController *)self context];
  uint64_t v8 = [v7 workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x1D9452090]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    v13 = HMFBooleanToString();
    id v14 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    v95 = v12;
    __int16 v96 = 2112;
    double v97 = *(double *)&v13;
    __int16 v98 = 2112;
    v99 = v14;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying accessories for doorbell press with shouldPlayChime: %@, attemptCloudPullIfNoPersonsFound: %@", buf, 0x20u);
  }
  if (a3) {
    goto LABEL_11;
  }
  v15 = [(HMDDoorbellChimeController *)v10 lastUnidentifiedChimeDate];

  if (v15)
  {
    id v16 = [(HMDDoorbellChimeController *)v10 lastUnidentifiedChimeDate];
    [v16 timeIntervalSinceNow];
    double v18 = -v17;

    id v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = v10;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = HMFGetLogIdentifier();
      v23 = [(HMDDoorbellChimeController *)v20 context];
      [v23 doorbellChimeMaximumAnnounceDelay];
      *(_DWORD *)buf = 138543874;
      v95 = v22;
      __int16 v96 = 2048;
      double v97 = v18;
      __int16 v98 = 2048;
      v99 = v24;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@It has been %lfs since the last unidentified chime, and our maximum allowed announce delay is %lfs", buf, 0x20u);
    }
    id v25 = [(HMDDoorbellChimeController *)v20 context];
    [v25 doorbellChimeMaximumAnnounceDelay];
    double v27 = v26;

    if (v27 < v18)
    {
      v28 = (void *)MEMORY[0x1D9452090]();
      v29 = v20;
      v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        id v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v95 = v31;
        _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Not notifying accessories since we have exceeded our maximum allowed announce delay", buf, 0xCu);
      }
      [(HMDDoorbellChimeController *)v29 setLastUnidentifiedChimeDate:0];
      return;
    }
LABEL_11:
    id v32 = objc_alloc_init(HMDDoorbellChimeNotificationLogEvent);
    [(HMDDoorbellChimeNotificationLogEvent *)v32 setNumHomePodsWithDoorbellChimeEnabled:[(HMDDoorbellChimeController *)v10 _numHomePodsWithDoorbellChimeEnabled]];
    if (a3) {
      [MEMORY[0x1E4F1C9C8] date];
    }
    else {
    double v33 = [(HMDDoorbellChimeController *)v10 lastUnidentifiedChimeDate];
    }
    [(HMDDoorbellChimeController *)v10 setLastUnidentifiedChimeDate:v33];

    BOOL v34 = [(HMDDoorbellChimeController *)v10 context];
    v35 = [v34 accessory];

    v84 = v35;
    v36 = [v35 cameraProfiles];
    __int16 v37 = [v36 anyObject];

    v83 = v37;
    if (v37)
    {
      id v38 = [(HMDDoorbellChimeController *)v10 context];
      uint64_t v39 = [v38 doorbellBulletinUtilities];
      v40 = [(HMDDoorbellChimeController *)v10 lastUnidentifiedChimeDate];
      v41 = [v39 significantEventsRelevantToDoorbellPress:v40 forCameraProfile:v37];

      v42 = [(HMDDoorbellChimeController *)v10 context];
      v43 = [v42 doorbellBulletinUtilities];
      v44 = [v43 localizedAudioAccessoryAnnounceMessageForSignificantEvents:v41];

      if (!v44 && v4)
      {
        v45 = [v83 clipManager];
        if (v45)
        {
          v81 = v32;
          v46 = (void *)MEMORY[0x1D9452090]();
          v47 = v10;
          v48 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            v49 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v95 = v49;
            _os_log_impl(&dword_1D49D5000, v48, OS_LOG_TYPE_INFO, "%{public}@Did not find person identification text, so performing cloud pull", buf, 0xCu);
          }
          v50 = [v45 performCloudPull];
          v51 = (void *)MEMORY[0x1E4F7A0F0];
          v52 = [(HMDDoorbellChimeController *)v47 context];
          v53 = [v52 workQueue];
          v54 = [v51 schedulerWithDispatchQueue:v53];
          v55 = [v50 reschedule:v54];
          v93[0] = MEMORY[0x1E4F143A8];
          v93[1] = 3221225472;
          v93[2] = __118__HMDDoorbellChimeController__notifyAllAccessoriesForDoorbellPressAndPlayChimeSound_attemptCloudPullIfNoPersonsFound___block_invoke;
          v93[3] = &unk_1E6A19708;
          v93[4] = v47;
          id v56 = (id)[v55 addSuccessBlock:v93];

          v44 = 0;
          id v32 = v81;
        }
      }
      __int16 v37 = v83;
      if (a3) {
        goto LABEL_29;
      }
    }
    else
    {
      v44 = 0;
      if (a3) {
        goto LABEL_29;
      }
    }
    if (!v44)
    {
      v57 = (void *)MEMORY[0x1D9452090]();
      v58 = v10;
      v59 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        v60 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v95 = v60;
        _os_log_impl(&dword_1D49D5000, v59, OS_LOG_TYPE_INFO, "%{public}@Not playing chime and found no persons to announce, so doing nothing", buf, 0xCu);
      }
      goto LABEL_38;
    }
LABEL_29:
    v61 = [v84 home];
    v62 = [v61 appleMediaAccessories];
    v92[0] = MEMORY[0x1E4F143A8];
    v92[1] = 3221225472;
    v92[2] = __118__HMDDoorbellChimeController__notifyAllAccessoriesForDoorbellPressAndPlayChimeSound_attemptCloudPullIfNoPersonsFound___block_invoke_35;
    v92[3] = &unk_1E6A18D10;
    v92[4] = v10;
    v63 = objc_msgSend(v62, "na_filter:", v92);

    if ([v63 count])
    {
      v80 = [(HMDDoorbellChimeController *)v10 context];
      v82 = v32;
      v64 = [v80 fetchDoorbellDelay];
      v65 = v44;
      v66 = (void *)MEMORY[0x1E4F7A0F0];
      v67 = [(HMDDoorbellChimeController *)v10 context];
      v68 = [v67 workQueue];
      v69 = [v66 schedulerWithDispatchQueue:v68];
      v70 = [v64 reschedule:v69];
      v85[0] = MEMORY[0x1E4F143A8];
      v85[1] = 3221225472;
      v85[2] = __118__HMDDoorbellChimeController__notifyAllAccessoriesForDoorbellPressAndPlayChimeSound_attemptCloudPullIfNoPersonsFound___block_invoke_37;
      v85[3] = &unk_1E6A0E9E8;
      v85[4] = v10;
      id v86 = v61;
      BOOL v91 = a3;
      id v87 = v65;
      id v88 = v63;
      v89 = v82;
      id v90 = v84;
      id v71 = (id)[v70 addCompletionBlock:v85];

      v44 = v65;
      id v32 = v82;
      __int16 v37 = v83;
    }
    else
    {
      v76 = (void *)MEMORY[0x1D9452090]();
      v77 = v10;
      v78 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
      {
        v79 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v95 = v79;
        __int16 v96 = 2112;
        double v97 = *(double *)&v84;
        _os_log_impl(&dword_1D49D5000, v78, OS_LOG_TYPE_INFO, "%{public}@Nothing to notify for chime from %@", buf, 0x16u);
      }
    }

LABEL_38:
    return;
  }
  v72 = (void *)MEMORY[0x1D9452090]();
  v73 = v10;
  v74 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
  {
    v75 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v95 = v75;
    _os_log_impl(&dword_1D49D5000, v74, OS_LOG_TYPE_INFO, "%{public}@Ignoring updated person information because there was not a recent doorbell press", buf, 0xCu);
  }
}

void __118__HMDDoorbellChimeController__notifyAllAccessoriesForDoorbellPressAndPlayChimeSound_attemptCloudPullIfNoPersonsFound___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Cloud pull succeeded; attempting to announce without playing chime",
      (uint8_t *)&v8,
      0xCu);
  }
  [*(id *)(a1 + 32) _notifyAllAccessoriesForDoorbellPressAndPlayChimeSound:0 attemptCloudPullIfNoPersonsFound:0];
}

uint64_t __118__HMDDoorbellChimeController__notifyAllAccessoriesForDoorbellPressAndPlayChimeSound_attemptCloudPullIfNoPersonsFound___block_invoke_35(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v2 context];
  uint64_t v5 = [v4 accessorySupportsCoordinationFreeDoorbellChime:v3];

  return v5;
}

void __118__HMDDoorbellChimeController__notifyAllAccessoriesForDoorbellPressAndPlayChimeSound_attemptCloudPullIfNoPersonsFound___block_invoke_37(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  [a2 doubleValue];
  double v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 64);
  id v11 = [*(id *)(a1 + 72) uuid];
  [v3 notifyAccessoriesViaCoordinationFreePathWithDelay:v7 home:v6 shouldPlayChime:v8 personIdentificationText:v9 accessoriesToNotify:v10 logEvent:v11 accessoryUUID:v5];
}

- (void)_handleCharacteristicsValueUpdatedNotification:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(HMDDoorbellChimeController *)self context];
  uint64_t v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  v22 = v4;
  uint64_t v7 = [v4 userInfo];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"HMDNotificationCharacteristicValueUpdatedChangedCharacteristicsKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  v21 = v10;
  objc_msgSend(v10, "na_filter:", &__block_literal_global_96805);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        double v17 = (void *)MEMORY[0x1D9452090]();
        double v18 = self;
        id v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          id v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v28 = v20;
          __int16 v29 = 2112;
          uint64_t v30 = v16;
          _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Handling doorbell input event characteristic: %@", buf, 0x16u);
        }
        [(HMDDoorbellChimeController *)v18 _notifyAllAccessoriesForDoorbellPressAndPlayChimeSound:1 attemptCloudPullIfNoPersonsFound:1];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v13);
  }
}

uint64_t __77__HMDDoorbellChimeController__handleCharacteristicsValueUpdatedNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 type];
  if ([v3 isEqualToString:*MEMORY[0x1E4F2CF08]])
  {
    id v4 = [v2 service];
    double v5 = [v4 type];
    uint64_t v6 = [v5 isEqualToString:*MEMORY[0x1E4F2DE20]];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)clientIdentifier
{
  id v2 = NSString;
  id v3 = [(HMDDoorbellChimeController *)self context];
  id v4 = [v3 accessory];
  double v5 = [v4 uuid];
  uint64_t v6 = [v5 UUIDString];
  uint64_t v7 = [v2 stringWithFormat:@"%@%@", @"HMDDoorbellChimeControllerIdentifier", v6];

  return v7;
}

- (void)handleUpdatedPersonIdentificationInformation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDDoorbellChimeController *)self context];
  char v4 = [v3 isCurrentDevicePrimaryResident];

  if (v4)
  {
    double v5 = [(HMDDoorbellChimeController *)self context];
    uint64_t v6 = [v5 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__HMDDoorbellChimeController_handleUpdatedPersonIdentificationInformation__block_invoke;
    block[3] = &unk_1E6A19B30;
    block[4] = self;
    dispatch_async(v6, block);
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1D9452090]();
    uint64_t v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Ignoring new significant event since we are not the primary resident", buf, 0xCu);
    }
  }
}

uint64_t __74__HMDDoorbellChimeController_handleUpdatedPersonIdentificationInformation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyAllAccessoriesForDoorbellPressAndPlayChimeSound:0 attemptCloudPullIfNoPersonsFound:1];
}

- (void)configure
{
  id v3 = [(HMDDoorbellChimeController *)self context];
  char v4 = [v3 listener];
  [v4 setDelegate:self];

  double v5 = [(HMDDoorbellChimeController *)self context];
  uint64_t v6 = [v5 listener];
  [v6 start];

  id v10 = [(HMDDoorbellChimeController *)self context];
  uint64_t v7 = [v10 notificationCenter];
  uint64_t v8 = [(HMDDoorbellChimeController *)self context];
  uint64_t v9 = [v8 accessory];
  [v7 addObserver:self selector:sel_handleCharacteristicsValueUpdatedNotification_ name:@"HMDNotificationCharacteristicValueUpdated" object:v9];
}

- (void)dealloc
{
  id v3 = [(HMDDoorbellChimeController *)self context];
  char v4 = [v3 accessory];
  double v5 = [(HMDDoorbellChimeController *)self availableCharacteristics];
  uint64_t v6 = [v5 allObjects];
  uint64_t v7 = [(HMDDoorbellChimeController *)self clientIdentifier];
  [v4 setNotificationsEnabled:0 forCharacteristics:v6 clientIdentifier:v7];

  v8.receiver = self;
  v8.super_class = (Class)HMDDoorbellChimeController;
  [(HMDDoorbellChimeController *)&v8 dealloc];
}

- (HMDDoorbellChimeController)initWithContext:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = v5;
    v16.receiver = self;
    v16.super_class = (Class)HMDDoorbellChimeController;
    uint64_t v7 = [(HMDDoorbellChimeController *)&v16 init];
    objc_super v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_context, a3);
      uint64_t v9 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      availableCharacteristics = v8->_availableCharacteristics;
      v8->_availableCharacteristics = v9;
    }
    return v8;
  }
  else
  {
    uint64_t v12 = (HMDDoorbellChimeController *)_HMFPreconditionFailure();
    return [(HMDDoorbellChimeController *)v12 initWithWorkQueue:v14 accessory:v15];
  }
}

- (HMDDoorbellChimeController)initWithWorkQueue:(id)a3 accessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_super v8 = v7;
    if (v7)
    {
      uint64_t v9 = [[HMDDoorbellChimeControllerContext alloc] initWithWorkQueue:v6 accessory:v7];
      id v10 = [(HMDDoorbellChimeController *)self initWithContext:v9];

      return v10;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  uint64_t v12 = (void *)_HMFPreconditionFailure();
  return (HMDDoorbellChimeController *)+[HMDDoorbellChimeController logCategory];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t14_96827 != -1) {
    dispatch_once(&logCategory__hmf_once_t14_96827, &__block_literal_global_47);
  }
  id v2 = (void *)logCategory__hmf_once_v15_96828;
  return v2;
}

uint64_t __41__HMDDoorbellChimeController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v15_96828;
  logCategory__hmf_once_v15_96828 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end