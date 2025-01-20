@interface HMDDoorbellBulletinUtilities
+ (id)logCategory;
- (id)_localizedDoorbellMessageForSignificantEvents:(id)a3 forAudioAccessory:(BOOL)a4;
- (id)_significantEventsWithinTimeWindowOfDoorbellPress:(id)a3 forCameraProfile:(id)a4;
- (id)clipUUIDsForCoalesceableSignificantEvents:(id)a3;
- (id)faceClassificationsNearDateOfDoorbellPress:(id)a3 forCameraProfile:(id)a4;
- (id)localizedAudioAccessoryAnnounceMessageForSignificantEvents:(id)a3;
- (id)localizedDoorbellMessageForSignificantEvents:(id)a3;
- (id)localizedMessageForCharacteristic:(id)a3;
- (id)significantEventsRelevantToDoorbellPress:(id)a3 forCameraProfile:(id)a4;
@end

@implementation HMDDoorbellBulletinUtilities

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_72458 != -1) {
    dispatch_once(&logCategory__hmf_once_t9_72458, &__block_literal_global_45);
  }
  v2 = (void *)logCategory__hmf_once_v10_72459;
  return v2;
}

void __43__HMDDoorbellBulletinUtilities_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v10_72459;
  logCategory__hmf_once_v10_72459 = v0;
}

- (id)clipUUIDsForCoalesceableSignificantEvents:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_40_72477);
  v5 = objc_msgSend(v3, "na_map:", &__block_literal_global_42_72478);

  v6 = objc_msgSend(v4, "na_setByRemovingObjectsFromSet:", v5);

  return v6;
}

id __74__HMDDoorbellBulletinUtilities_clipUUIDsForCoalesceableSignificantEvents___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 reason] == 1 || objc_msgSend(v2, "reason") == 2)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [v2 clipUUID];
  }

  return v3;
}

uint64_t __74__HMDDoorbellBulletinUtilities_clipUUIDsForCoalesceableSignificantEvents___block_invoke(uint64_t a1, void *a2)
{
  return [a2 clipUUID];
}

- (id)faceClassificationsNearDateOfDoorbellPress:(id)a3 forCameraProfile:(id)a4
{
  v4 = [(HMDDoorbellBulletinUtilities *)self significantEventsRelevantToDoorbellPress:a3 forCameraProfile:a4];
  v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_37_72482);

  return v5;
}

uint64_t __92__HMDDoorbellBulletinUtilities_faceClassificationsNearDateOfDoorbellPress_forCameraProfile___block_invoke(uint64_t a1, void *a2)
{
  return [a2 faceClassification];
}

- (id)significantEventsRelevantToDoorbellPress:(id)a3 forCameraProfile:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 clipManager];
  if (v8)
  {
    v9 = [(HMDDoorbellBulletinUtilities *)self _significantEventsWithinTimeWindowOfDoorbellPress:v6 forCameraProfile:v7];
    v10 = objc_msgSend(v9, "na_map:", &__block_literal_global_35_72487);
    if (objc_msgSend(v10, "hmf_isEmpty"))
    {
      id v11 = [v8 significantEventsForClipContainingDate:v6];
      v12 = (void *)MEMORY[0x230FBD990]();
      v13 = self;
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = HMFGetLogIdentifier();
        int v25 = 138543618;
        v26 = v15;
        __int16 v27 = 2112;
        id v28 = v11;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@The following significant events were found for the clip containing the doorbell press: %@", (uint8_t *)&v25, 0x16u);
      }
    }
    else
    {
      v20 = (void *)MEMORY[0x230FBD990]();
      v21 = self;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = HMFGetLogIdentifier();
        int v25 = 138543618;
        v26 = v23;
        __int16 v27 = 2112;
        id v28 = v9;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@The following significant events were found within the time window: %@", (uint8_t *)&v25, 0x16u);
      }
      id v11 = v9;
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x230FBD990]();
    v17 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = HMFGetLogIdentifier();
      int v25 = 138543362;
      v26 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Clip Manager is nil, returning empty set for significant events relevant to doorbell press", (uint8_t *)&v25, 0xCu);
    }
    id v11 = [MEMORY[0x263EFFA08] set];
  }

  return v11;
}

uint64_t __90__HMDDoorbellBulletinUtilities_significantEventsRelevantToDoorbellPress_forCameraProfile___block_invoke(uint64_t a1, void *a2)
{
  return [a2 faceClassification];
}

- (id)_significantEventsWithinTimeWindowOfDoorbellPress:(id)a3 forCameraProfile:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 clipManager];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263EFF910] dateWithTimeInterval:v6 sinceDate:-30.0];
    v10 = [MEMORY[0x263EFF910] dateWithTimeInterval:v6 sinceDate:30.0];
    v23 = (void *)v9;
    id v11 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v9 endDate:v10];
    v12 = [v8 significantEventsWithDateInterval:v11];
    v13 = (void *)MEMORY[0x230FBD990]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544386;
      int v25 = v16;
      __int16 v26 = 2112;
      __int16 v27 = v12;
      __int16 v28 = 2112;
      id v29 = v7;
      __int16 v30 = 2112;
      v31 = v11;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Found recent significant events: %@ for camera profile: %@, with date interval: %@, dateOfDoorbellPress: %@", buf, 0x34u);
    }
    v17 = [MEMORY[0x263EFFA08] setWithArray:v12];
  }
  else
  {
    v18 = (void *)MEMORY[0x230FBD990]();
    v19 = self;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v25 = v21;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Clip Manager is nil, returning empty set for significant events in time window", buf, 0xCu);
    }
    v17 = [MEMORY[0x263EFFA08] set];
  }

  return v17;
}

- (id)localizedMessageForCharacteristic:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = NSString;
  v5 = HMDLocalizedStringForKey(@"NOTIFICATION_MESSAGE_DOORBELL_EVENT");
  id v18 = 0;
  id v6 = [v3 accessory];
  id v7 = [v6 room];
  v8 = [v7 name];
  uint64_t v9 = +[HMDBulletinCategory trimLeadingAndTailingSpacesInName:v8];
  v10 = [v4 localizedStringWithValidatedFormat:v5, @"%@", &v18, v9 validFormatSpecifiers error];
  id v11 = v18;

  v12 = v10;
  if (!v10)
  {
    v13 = (void *)MEMORY[0x230FBD990]();
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v20 = v15;
      __int16 v21 = 2112;
      v22 = @"NOTIFICATION_MESSAGE_DOORBELL_EVENT";
      __int16 v23 = 2112;
      v24 = @"%@";
      __int16 v25 = 2112;
      id v26 = v11;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
    }
    v12 = @"NOTIFICATION_MESSAGE_DOORBELL_EVENT";
  }
  v16 = v12;

  return v16;
}

- (id)_localizedDoorbellMessageForSignificantEvents:(id)a3 forAudioAccessory:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = (__CFString *)a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v47 = v10;
    __int16 v48 = 2112;
    v49 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Determining localized camera doorbell message from significant events: %@", buf, 0x16u);
  }
  id v11 = [(__CFString *)v6 na_map:&__block_literal_global_72505];
  v12 = [(__CFString *)v6 na_filter:&__block_literal_global_3_72506];
  v13 = [v11 allObjects];
  v14 = objc_msgSend(v13, "na_map:", &__block_literal_global_6);

  v15 = [v14 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];
  uint64_t v16 = [v15 count];
  if (v16 == 1)
  {
    v42 = v12;
    id v18 = @"NOTIFICATION_MESSAGE_CAMERA_DOORBELL_EVENT_FAMILIAR";
    if (v4) {
      id v18 = @"NOTIFICATION_MESSAGE_CAMERA_DOORBELL_EVENT_FAMILIAR_AUDIO_ACCESSORY";
    }
    v19 = v18;
    v20 = NSString;
    __int16 v21 = HMDLocalizedStringForKey(v19);
    id v45 = 0;
    v22 = [v15 firstObject];
    __int16 v23 = [v20 localizedStringWithValidatedFormat:v21, @"%@", &v45, v22 validFormatSpecifiers error];
    id v24 = v45;

    __int16 v25 = v23;
    if (!v23)
    {
      id v26 = (void *)MEMORY[0x230FBD990]();
      uint64_t v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        __int16 v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        v47 = v28;
        __int16 v48 = 2112;
        v49 = v19;
        __int16 v50 = 2112;
        v51 = @"%@";
        __int16 v52 = 2112;
        id v53 = v24;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
      }
      __int16 v25 = v19;
    }
    v17 = v25;

    v12 = v42;
  }
  else if (v16)
  {
    v43 = v11;
    id v29 = @"NOTIFICATION_MESSAGE_CAMERA_DOORBELL_EVENT_FAMILIAR_MULTIPLE";
    if (v4) {
      id v29 = @"NOTIFICATION_MESSAGE_CAMERA_DOORBELL_EVENT_FAMILIAR_MULTIPLE_AUDIO_ACCESSORY";
    }
    __int16 v30 = v29;
    v31 = NSString;
    __int16 v32 = HMDLocalizedStringForKey(v30);
    id v44 = 0;
    id v33 = [v15 firstObject];
    uint64_t v34 = [v31 localizedStringWithValidatedFormat:v32, @"%@", &v44, v33 validFormatSpecifiers error];
    id v35 = v44;

    v36 = v34;
    if (!v34)
    {
      v37 = (void *)MEMORY[0x230FBD990]();
      v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        v47 = v39;
        __int16 v48 = 2112;
        v49 = v30;
        __int16 v50 = 2112;
        v51 = @"%@";
        __int16 v52 = 2112;
        id v53 = v35;
        _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
      }
      v36 = v30;
    }
    v17 = v36;

    id v11 = v43;
  }
  else if (v4)
  {
    v17 = 0;
  }
  else
  {
    if ((unint64_t)[v12 count] < 2) {
      v40 = @"NOTIFICATION_MESSAGE_CAMERA_DOORBELL_EVENT_UNFAMILIAR";
    }
    else {
      v40 = @"NOTIFICATION_MESSAGE_CAMERA_DOORBELL_EVENT_UNFAMILIAR_MULTIPLE";
    }
    HMDLocalizedStringForKey(v40);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

id __96__HMDDoorbellBulletinUtilities__localizedDoorbellMessageForSignificantEvents_forAudioAccessory___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 person];
  id v3 = [v2 name];

  return v3;
}

BOOL __96__HMDDoorbellBulletinUtilities__localizedDoorbellMessageForSignificantEvents_forAudioAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 reason] == 2;
}

uint64_t __96__HMDDoorbellBulletinUtilities__localizedDoorbellMessageForSignificantEvents_forAudioAccessory___block_invoke(uint64_t a1, void *a2)
{
  return [a2 faceClassification];
}

- (id)localizedAudioAccessoryAnnounceMessageForSignificantEvents:(id)a3
{
  return [(HMDDoorbellBulletinUtilities *)self _localizedDoorbellMessageForSignificantEvents:a3 forAudioAccessory:1];
}

- (id)localizedDoorbellMessageForSignificantEvents:(id)a3
{
  return [(HMDDoorbellBulletinUtilities *)self _localizedDoorbellMessageForSignificantEvents:a3 forAudioAccessory:0];
}

@end