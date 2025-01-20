@interface HMDBulletinNotificationRegistrationUtilities
+ (id)accessoryRegistrationFromLocalRegistration:(id)a3;
+ (id)accessoryRegistrationFromMKFRegistration:(id)a3;
+ (id)adjustedOffsetFromMKFLocalElementTimePeriodSunriseSunSet:(id)a3;
+ (id)audioAnalysisNotificationRegistrationFromRemoteRegistration:(id)a3;
+ (id)cameraAccessModeRegistrationFromLocalRegistration:(id)a3;
+ (id)cameraAccessModeRegistrationFromMKFRegistration:(id)a3;
+ (id)cameraReachabilityRegistrationFromLocalRegistration:(id)a3;
+ (id)cameraReachabilityRegistrationFromMKFRegistration:(id)a3;
+ (id)cameraSignificantEventRegistrationFromLocalRegistration:(id)a3;
+ (id)cameraSignificantEventRegistrationFromMKFRegistration:(id)a3;
+ (id)conditionsFromLocalConditions:(id)a3;
+ (id)conditionsFromMKFConditions:(id)a3;
+ (id)createAndAddLocalConditionsToRegistration:(id)a3 moc:(id)a4 conditions:(id)a5;
+ (id)createAndAddLocalPresenceConditionToRegistration:(id)a3 moc:(id)a4 condition:(id)a5;
+ (id)createAndAddLocalTimePeriodConditionToRegistration:(id)a3 moc:(id)a4 condition:(id)a5;
+ (id)createLocalElementFromSunriseSunset:(id)a3 moc:(id)a4;
+ (id)createLocalElementFromTimeOfDay:(id)a3 moc:(id)a4;
+ (id)endpointRegistrationFromLocalRegistration:(id)a3;
+ (id)matterRegistrationFromLocalRegistration:(id)a3 home:(id)a4;
+ (id)matterRegistrationFromMKFRegistration:(id)a3 home:(id)a4;
+ (id)presenceConditionFromLocalCondition:(id)a3;
+ (id)serviceRegistrationFromLocalRegistration:(id)a3;
+ (id)timePeriodConditionFromLocalCondition:(id)a3;
@end

@implementation HMDBulletinNotificationRegistrationUtilities

+ (id)conditionsFromMKFConditions:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __76__HMDBulletinNotificationRegistrationUtilities_conditionsFromMKFConditions___block_invoke;
  v5[3] = &__block_descriptor_40_e32__16__0___MKFBulletinCondition__8l;
  v5[4] = a1;
  v3 = objc_msgSend(a3, "na_map:", v5);
  return v3;
}

HMDTimePeriodNotificationCondition *__76__HMDBulletinNotificationRegistrationUtilities_conditionsFromMKFConditions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_26E4DE2F0])
  {
    id v4 = v3;
    v5 = [v4 presenceEventType];
    uint64_t v6 = [v5 unsignedIntegerValue];

    v7 = [v4 presenceEventUserType];
    uint64_t v8 = [v7 unsignedIntegerValue];

    v9 = [v4 users];
    v10 = objc_msgSend(v9, "na_map:", &__block_literal_global_330);

    v11 = [HMDPresenceNotificationCondition alloc];
    v12 = [MEMORY[0x263EFFA08] setWithArray:v10];

    v13 = [(HMDPresenceNotificationCondition *)v11 initWithPresenceEventType:v6 presenceEventUserType:v8 userUUIDs:v12];
    goto LABEL_20;
  }
  if ([v3 conformsToProtocol:&unk_26E4DADE0])
  {
    id v14 = v3;
    v15 = [v14 startElement];
    if ([v15 conformsToProtocol:&unk_26E4DEA88])
    {
      v16 = [v14 endElement];
      int v17 = [v16 conformsToProtocol:&unk_26E4DEA88];

      if (v17)
      {
        v18 = [v14 startElement];
        v19 = [v14 endElement];
        v20 = [HMDTimeOfDayTimePeriodElement alloc];
        v21 = [v18 hour];
        uint64_t v22 = [v21 unsignedIntegerValue];
        v23 = [v18 minute];
        v24 = -[HMDTimeOfDayTimePeriodElement initWithHour:minute:](v20, "initWithHour:minute:", v22, [v23 unsignedIntegerValue]);

        v25 = [HMDTimeOfDayTimePeriodElement alloc];
        v26 = [v19 hour];
        uint64_t v27 = [v26 unsignedIntegerValue];
        v28 = [v19 minute];
        v29 = -[HMDTimeOfDayTimePeriodElement initWithHour:minute:](v25, "initWithHour:minute:", v27, [v28 unsignedIntegerValue]);

        v13 = [[HMDTimePeriodNotificationCondition alloc] initWithStartElement:v24 endElement:v29];
LABEL_14:

LABEL_19:
        goto LABEL_20;
      }
    }
    else
    {
    }
    v34 = [v14 startElement];
    if ([v34 conformsToProtocol:&unk_26E581590])
    {
      v35 = [v14 endElement];
      int v36 = [v35 conformsToProtocol:&unk_26E581590];

      if (v36)
      {
        v18 = [v14 startElement];
        v19 = [v14 endElement];
        v37 = [HMDSunriseSunsetTimePeriodElement alloc];
        v38 = [v18 significantEvent];
        v39 = [v18 offsetSeconds];
        v40 = HMDTimeOffsetToDateComponents([v39 integerValue], 0);
        v24 = [(HMDSunriseSunsetTimePeriodElement *)v37 initWithSignificantEvent:v38 offset:v40];

        v41 = [HMDSunriseSunsetTimePeriodElement alloc];
        v42 = [v19 significantEvent];
        v43 = [v19 offsetSeconds];
        v44 = HMDTimeOffsetToDateComponents([v43 integerValue], 0);
        v45 = [(HMDSunriseSunsetTimePeriodElement *)v41 initWithSignificantEvent:v42 offset:v44];

        v13 = [[HMDTimePeriodNotificationCondition alloc] initWithStartElement:v24 endElement:v45];
        goto LABEL_14;
      }
    }
    else
    {
    }
    v46 = (void *)MEMORY[0x230FBD990]();
    id v47 = *(id *)(a1 + 32);
    v48 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v49 = HMFGetLogIdentifier();
      v50 = [v14 startElement];
      v51 = [v14 endElement];
      int v53 = 138543874;
      v54 = v49;
      __int16 v55 = 2112;
      id v56 = v50;
      __int16 v57 = 2112;
      v58 = v51;
      _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_ERROR, "%{public}@Unrecognized time period start element: %@ end element: %@, unable to convert", (uint8_t *)&v53, 0x20u);
    }
    v13 = 0;
    goto LABEL_19;
  }
  v30 = (void *)MEMORY[0x230FBD990]();
  id v31 = *(id *)(a1 + 32);
  v32 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    v33 = HMFGetLogIdentifier();
    int v53 = 138543618;
    v54 = v33;
    __int16 v55 = 2112;
    id v56 = v3;
    _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unrecognized condition: %@, unable to convert", (uint8_t *)&v53, 0x16u);
  }
  v13 = 0;
LABEL_20:

  return v13;
}

id __76__HMDBulletinNotificationRegistrationUtilities_conditionsFromMKFConditions___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 modelID];
  id v3 = [v2 UUIDString];

  return v3;
}

+ (id)cameraAccessModeRegistrationFromMKFRegistration:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 conditions];
  uint64_t v6 = [a1 conditionsFromMKFConditions:v5];

  v7 = [v4 accessory];
  uint64_t v8 = [v7 modelID];

  v9 = [HMDCameraAccessModeBulletinNotificationRegistration alloc];
  v10 = [MEMORY[0x263EFFA08] setWithArray:v6];
  v11 = [(HMDCameraAccessModeBulletinNotificationRegistration *)v9 initWithAccessoryUUID:v8 conditions:v10];

  uint64_t v12 = [v4 deviceIdsIdentifier];
  uint64_t v13 = [v4 deviceIdsDestination];
  id v14 = [v4 user];
  v15 = [v14 modelID];

  v26 = (void *)v13;
  uint64_t v27 = (void *)v12;
  v16 = [[HMDDeviceAddress alloc] initWithIDSIdentifier:v12 idsDestination:v13];
  int v17 = [[HMDBulletinNotificationRegistrationSource alloc] initWithUserUUID:v15 deviceAddress:v16];
  v28 = [[HMDCameraAccessModeBulletinNotificationRegistrationRemote alloc] initWithCameraAccessModeBulletinNotificationRegistration:v11 source:v17];
  v18 = (void *)MEMORY[0x230FBD990]();
  id v19 = a1;
  v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v25 = v11;
    v21 = v8;
    v23 = uint64_t v22 = v6;
    *(_DWORD *)buf = 138543874;
    v30 = v23;
    __int16 v31 = 2112;
    v32 = v28;
    __int16 v33 = 2112;
    id v34 = v4;
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Initialized registration: %@ from MKF registration: %@", buf, 0x20u);

    uint64_t v6 = v22;
    uint64_t v8 = v21;
    v11 = v25;
  }

  return v28;
}

+ (id)audioAnalysisNotificationRegistrationFromRemoteRegistration:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = [v4 conditions];
  v7 = [a1 conditionsFromMKFConditions:v6];
  uint64_t v8 = [v5 setWithArray:v7];

  v9 = [HMDAudioAnalysisEventBulletinNotificationRegistration alloc];
  v10 = [v4 classifierOptions];
  uint64_t v11 = [v10 unsignedIntegerValue];
  uint64_t v12 = [v4 accessory];
  uint64_t v13 = [v12 modelID];
  v29 = (void *)v8;
  id v14 = [(HMDAudioAnalysisEventBulletinNotificationRegistration *)v9 initWithConditions:v8 audioAnalysisClassifierOptions:v11 accessoryUUID:v13];

  v15 = [v4 deviceIdsIdentifier];
  v16 = [v4 deviceIdsDestination];
  int v17 = [v4 user];
  v18 = [v17 modelID];

  id v19 = [[HMDDeviceAddress alloc] initWithIDSIdentifier:v15 idsDestination:v16];
  v20 = [[HMDBulletinNotificationRegistrationSource alloc] initWithUserUUID:v18 deviceAddress:v19];
  v30 = [[HMDAudioAnalysisEventBulletinNotificationRegistrationRemote alloc] initWithAudioAnalysisEventBulletinNotificationRegistration:v14 source:v20];
  v21 = (void *)MEMORY[0x230FBD990]();
  id v22 = a1;
  v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v28 = v16;
    v24 = v15;
    v26 = v25 = v14;
    *(_DWORD *)buf = 138543874;
    v32 = v26;
    __int16 v33 = 2112;
    id v34 = v30;
    __int16 v35 = 2112;
    id v36 = v4;
    _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Initialized registration: %@ from MKF registration: %@", buf, 0x20u);

    id v14 = v25;
    v15 = v24;
    v16 = v28;
  }

  return v30;
}

+ (id)cameraReachabilityRegistrationFromMKFRegistration:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 conditions];
  uint64_t v6 = [a1 conditionsFromMKFConditions:v5];

  v7 = [v4 accessory];
  uint64_t v8 = [v7 modelID];

  v9 = [HMDCameraReachabilityBulletinNotificationRegistration alloc];
  v10 = [MEMORY[0x263EFFA08] setWithArray:v6];
  uint64_t v11 = [(HMDCameraReachabilityBulletinNotificationRegistration *)v9 initWithAccessoryUUID:v8 conditions:v10];

  uint64_t v12 = [v4 deviceIdsIdentifier];
  uint64_t v13 = [v4 deviceIdsDestination];
  id v14 = [v4 user];
  v15 = [v14 modelID];

  v26 = (void *)v13;
  uint64_t v27 = (void *)v12;
  v16 = [[HMDDeviceAddress alloc] initWithIDSIdentifier:v12 idsDestination:v13];
  int v17 = [[HMDBulletinNotificationRegistrationSource alloc] initWithUserUUID:v15 deviceAddress:v16];
  v28 = [[HMDCameraReachabilityBulletinNotificationRegistrationRemote alloc] initWithCameraReachabilityBulletinNotificationRegistration:v11 source:v17];
  v18 = (void *)MEMORY[0x230FBD990]();
  id v19 = a1;
  v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v25 = v11;
    v21 = v8;
    v23 = id v22 = v6;
    *(_DWORD *)buf = 138543874;
    v30 = v23;
    __int16 v31 = 2112;
    v32 = v28;
    __int16 v33 = 2112;
    id v34 = v4;
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Initialized registration: %@ from MKF registration: %@", buf, 0x20u);

    uint64_t v6 = v22;
    uint64_t v8 = v21;
    uint64_t v11 = v25;
  }

  return v28;
}

+ (id)cameraSignificantEventRegistrationFromMKFRegistration:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 conditions];
  uint64_t v6 = [a1 conditionsFromMKFConditions:v5];

  v7 = [v4 accessory];
  uint64_t v8 = [v7 modelID];

  v9 = [v4 notificationModes];
  uint64_t v10 = [v9 unsignedIntegerValue];

  uint64_t v11 = [v4 significantEventTypes];
  uint64_t v12 = [v11 unsignedIntegerValue];

  uint64_t v13 = [v4 personFamiliarityOptions];
  uint64_t v14 = [v13 unsignedIntegerValue];

  v15 = [HMDCameraSignificantEventBulletinNotificationRegistration alloc];
  __int16 v33 = (void *)v6;
  v16 = [MEMORY[0x263EFFA08] setWithArray:v6];
  v32 = (void *)v8;
  int v17 = [(HMDCameraSignificantEventBulletinNotificationRegistration *)v15 initWithCameraIdentifier:v8 notificationModes:v10 significantEventTypes:v12 personFamiliarityOptions:v14 conditions:v16];

  v18 = [v4 deviceIdsIdentifier];
  id v19 = [v4 deviceIdsDestination];
  v20 = [v4 user];
  v21 = [v20 modelID];

  id v22 = [[HMDDeviceAddress alloc] initWithIDSIdentifier:v18 idsDestination:v19];
  v23 = [[HMDBulletinNotificationRegistrationSource alloc] initWithUserUUID:v21 deviceAddress:v22];
  id v34 = [[HMDCameraSignificantEventBulletinNotificationRegistrationRemote alloc] initWithCameraCameraSignificantEventBulletinNotificationRegistration:v17 source:v23];
  v24 = (void *)MEMORY[0x230FBD990]();
  id v25 = a1;
  v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    __int16 v31 = v19;
    uint64_t v27 = v18;
    v29 = v28 = v17;
    *(_DWORD *)buf = 138543874;
    id v36 = v29;
    __int16 v37 = 2112;
    v38 = v34;
    __int16 v39 = 2112;
    id v40 = v4;
    _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Initialized registration: %@ from MKF registration: %@", buf, 0x20u);

    int v17 = v28;
    v18 = v27;
    id v19 = v31;
  }

  return v34;
}

+ (id)matterRegistrationFromMKFRegistration:(id)a3 home:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[HMDCoreData featuresDataSource];
  int v9 = [v8 isRVCEnabled];

  if (v9)
  {
    uint64_t v10 = [v6 conditions];
    uint64_t v11 = [a1 conditionsFromMKFConditions:v10];

    uint64_t v12 = [v6 matterPaths];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __91__HMDBulletinNotificationRegistrationUtilities_matterRegistrationFromMKFRegistration_home___block_invoke;
    v38[3] = &unk_264A22628;
    id v41 = a1;
    id v13 = v6;
    id v39 = v13;
    id v40 = v7;
    id v36 = v12;
    uint64_t v14 = objc_msgSend(v12, "na_map:", v38);
    v15 = [HMDMatterBulletinNotificationRegistration alloc];
    __int16 v37 = (void *)v11;
    v16 = [MEMORY[0x263EFFA08] setWithArray:v11];
    uint64_t v35 = (void *)v14;
    uint64_t v17 = [(HMDMatterBulletinNotificationRegistration *)v15 initWithMatterPaths:v14 conditions:v16];

    uint64_t v18 = [v13 deviceIdsIdentifier];
    uint64_t v19 = [v13 deviceIdsDestination];
    v20 = [v13 user];
    v21 = [v20 modelID];

    if (!v21)
    {
      id v22 = [v13 guest];
      v21 = [v22 modelID];
    }
    v32 = (void *)v19;
    __int16 v33 = (void *)v18;
    v23 = [[HMDDeviceAddress alloc] initWithIDSIdentifier:v18 idsDestination:v19];
    v24 = [[HMDBulletinNotificationRegistrationSource alloc] initWithUserUUID:v21 deviceAddress:v23];
    id v34 = (void *)v17;
    id v25 = [[HMDMatterBulletinNotificationRegistrationRemote alloc] initWithMatterBulletinNotificationRegistration:v17 source:v24];
    v26 = (void *)MEMORY[0x230FBD990]();
    id v27 = a1;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v29 = id v31 = v7;
      *(_DWORD *)buf = 138543874;
      v43 = v29;
      __int16 v44 = 2112;
      v45 = v25;
      __int16 v46 = 2112;
      id v47 = v13;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Initialized registration: %@ from MKF registration: %@", buf, 0x20u);

      id v7 = v31;
    }
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

id __91__HMDBulletinNotificationRegistrationUtilities_matterRegistrationFromMKFRegistration_home___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 attributeID];

  if (v4)
  {
    v5 = [v3 attributeID];
    id v6 = [v3 endpointID];
    id v7 = [v3 clusterID];
    uint64_t v8 = +[HMDMatterPath PathWithAttributeID:v5 endpointID:v6 clusterID:v7];
LABEL_5:
    uint64_t v10 = (void *)v8;

    uint64_t v11 = *(void **)(a1 + 40);
    uint64_t v12 = [v3 accessory];
    id v13 = [v12 modelID];
    uint64_t v14 = [v11 accessoryWithUUID:v13];
    [v10 setAccessory:v14];

    goto LABEL_6;
  }
  int v9 = [v3 eventID];

  if (v9)
  {
    v5 = [v3 eventID];
    id v6 = [v3 endpointID];
    id v7 = [v3 clusterID];
    uint64_t v8 = +[HMDMatterPath PathWithEventID:v5 endpointID:v6 clusterID:v7];
    goto LABEL_5;
  }
  v16 = (void *)MEMORY[0x230FBD990]();
  id v17 = *(id *)(a1 + 48);
  uint64_t v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = HMFGetLogIdentifier();
    uint64_t v20 = *(void *)(a1 + 32);
    int v21 = 138543618;
    id v22 = v19;
    __int16 v23 = 2112;
    uint64_t v24 = v20;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@No attributeID or eventID found on working store Matter bulletin registration=%@", (uint8_t *)&v21, 0x16u);
  }
  uint64_t v10 = 0;
LABEL_6:

  return v10;
}

+ (id)accessoryRegistrationFromMKFRegistration:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 conditions];
  id v6 = [a1 conditionsFromMKFConditions:v5];

  id v7 = [v4 characteristic];
  uint64_t v8 = [v7 service];
  int v9 = [v8 accessory];
  uint64_t v10 = [v9 modelID];

  uint64_t v11 = [v4 characteristic];
  uint64_t v12 = [v11 service];
  uint64_t v13 = [v12 instanceID];

  uint64_t v14 = [v4 characteristic];
  uint64_t v15 = [v14 instanceID];

  v16 = [HMDAccessoryBulletinNotificationRegistration alloc];
  id v17 = [MEMORY[0x263EFFA08] setWithArray:v6];
  __int16 v37 = (void *)v15;
  v38 = (void *)v13;
  uint64_t v18 = [(HMDAccessoryBulletinNotificationRegistration *)v16 initWithAccessoryUUID:v10 serviceInstanceID:v13 characteristicInstanceID:v15 conditions:v17];

  uint64_t v19 = [v4 deviceIdsIdentifier];
  uint64_t v20 = [v4 deviceIdsDestination];
  int v21 = [v4 user];
  id v22 = [v21 modelID];

  if (!v22)
  {
    __int16 v23 = [v4 guest];
    id v22 = [v23 modelID];
  }
  id v34 = (void *)v20;
  uint64_t v35 = (void *)v19;
  uint64_t v24 = [[HMDDeviceAddress alloc] initWithIDSIdentifier:v19 idsDestination:v20];
  uint64_t v25 = [[HMDBulletinNotificationRegistrationSource alloc] initWithUserUUID:v22 deviceAddress:v24];
  id v36 = (void *)v18;
  v26 = [[HMDAccessoryBulletinNotificationRegistrationRemote alloc] initWithAccessoryBulletinNotificationRegistration:v18 source:v25];
  id v27 = (void *)MEMORY[0x230FBD990]();
  id v28 = a1;
  v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    __int16 v33 = v10;
    id v31 = v30 = v6;
    *(_DWORD *)buf = 138543874;
    id v40 = v31;
    __int16 v41 = 2112;
    v42 = v26;
    __int16 v43 = 2112;
    id v44 = v4;
    _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_DEBUG, "%{public}@Initialized registration: %@ from MKF registration: %@", buf, 0x20u);

    id v6 = v30;
    uint64_t v10 = v33;
  }

  return v26;
}

+ (id)cameraAccessModeRegistrationFromLocalRegistration:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 accessoryModelID];
  id v6 = [v4 conditions];
  id v7 = [a1 conditionsFromLocalConditions:v6];

  uint64_t v8 = [[HMDCameraAccessModeBulletinNotificationRegistration alloc] initWithAccessoryUUID:v5 conditions:v7];
  int v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = a1;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    int v14 = 138543874;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Initialized registration: %@ from local registration: %@", (uint8_t *)&v14, 0x20u);
  }

  return v8;
}

+ (id)cameraReachabilityRegistrationFromLocalRegistration:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 accessoryModelID];
  id v6 = [v4 conditions];
  id v7 = [a1 conditionsFromLocalConditions:v6];

  uint64_t v8 = [[HMDCameraReachabilityBulletinNotificationRegistration alloc] initWithAccessoryUUID:v5 conditions:v7];
  int v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = a1;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    int v14 = 138543874;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Initialized registration: %@ from local registration: %@", (uint8_t *)&v14, 0x20u);
  }

  return v8;
}

+ (id)cameraSignificantEventRegistrationFromLocalRegistration:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 accessoryModelID];
  id v6 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "notificationModes"));
  uint64_t v7 = [v6 unsignedIntegerValue];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "significantEventTypes"));
  uint64_t v9 = [v8 unsignedIntegerValue];

  id v10 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "personFamiliarityOptions"));
  uint64_t v11 = [v10 unsignedIntegerValue];

  uint64_t v12 = [v4 conditions];
  uint64_t v13 = [a1 conditionsFromLocalConditions:v12];

  int v14 = [[HMDCameraSignificantEventBulletinNotificationRegistration alloc] initWithCameraIdentifier:v5 notificationModes:v7 significantEventTypes:v9 personFamiliarityOptions:v11 conditions:v13];
  uint64_t v15 = (void *)MEMORY[0x230FBD990]();
  id v16 = a1;
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    __int16 v18 = HMFGetLogIdentifier();
    int v20 = 138543874;
    int v21 = v18;
    __int16 v22 = 2112;
    __int16 v23 = v14;
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Initialized registration: %@ from local registration: %@", (uint8_t *)&v20, 0x20u);
  }

  return v14;
}

+ (id)endpointRegistrationFromLocalRegistration:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[HMDCoreData featuresDataSource];
  int v6 = [v5 isRVCEnabled];

  if (v6)
  {
    uint64_t v7 = [v4 accessoryModelID];
    uint64_t v8 = [v4 endpointID];
    uint64_t v9 = [v4 conditions];
    id v10 = [a1 conditionsFromLocalConditions:v9];

    uint64_t v11 = [[HMDEndpointBulletinNotificationRegistration alloc] initWithAccessoryUUID:v7 endpointID:v8 conditions:v10];
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = a1;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v17 = 138543874;
      __int16 v18 = v15;
      __int16 v19 = 2112;
      int v20 = v11;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Initialized registration: %@ from local registration: %@", (uint8_t *)&v17, 0x20u);
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)serviceRegistrationFromLocalRegistration:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 accessoryModelID];
  int v6 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "serviceInstanceID"));
  uint64_t v7 = [v4 conditions];
  uint64_t v8 = [a1 conditionsFromLocalConditions:v7];

  uint64_t v9 = [[HMDServiceBulletinNotificationRegistration alloc] initWithAccessoryUUID:v5 serviceInstanceID:v6 conditions:v8];
  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = a1;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v13 = HMFGetLogIdentifier();
    int v15 = 138543874;
    id v16 = v13;
    __int16 v17 = 2112;
    __int16 v18 = v9;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Initialized registration: %@ from local registration: %@", (uint8_t *)&v15, 0x20u);
  }

  return v9;
}

+ (id)matterRegistrationFromLocalRegistration:(id)a3 home:(id)a4
{
  v44[1] = *MEMORY[0x263EF8340];
  int v6 = (HMDMatterBulletinNotificationRegistration *)a3;
  id v7 = a4;
  uint64_t v8 = +[HMDCoreData featuresDataSource];
  int v9 = [v8 isRVCEnabled];

  if (!v9)
  {
    id v16 = 0;
    goto LABEL_11;
  }
  id v10 = [(HMDMatterBulletinNotificationRegistration *)v6 endpointID];
  id v11 = [(HMDMatterBulletinNotificationRegistration *)v6 clusterID];
  uint64_t v12 = [(HMDMatterBulletinNotificationRegistration *)v6 attributeID];
  id v13 = [(HMDMatterBulletinNotificationRegistration *)v6 eventID];
  __int16 v37 = [(HMDMatterBulletinNotificationRegistration *)v6 accessoryModelID];
  uint64_t v14 = objc_msgSend(v7, "accessoryWithUUID:");
  id v36 = (void *)v14;
  if (v12)
  {
    id v34 = v13;
    uint64_t v35 = v12;
    int v15 = +[HMDMatterPath PathWithAttributeID:v12 endpointID:v10 clusterID:v11];
  }
  else
  {
    if (!v13)
    {
      v29 = (void *)MEMORY[0x230FBD990]();
      id v30 = a1;
      id v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v39 = v32;
        __int16 v40 = 2112;
        __int16 v41 = v6;
        _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@No attributeID or eventID found for local Matter registration=%@", buf, 0x16u);

        id v13 = 0;
      }

      id v16 = 0;
      goto LABEL_10;
    }
    id v34 = v13;
    uint64_t v35 = 0;
    int v15 = +[HMDMatterPath PathWithEventID:v13 endpointID:v10 clusterID:v11];
  }
  __int16 v17 = v15;
  [v15 setAccessory:v14];
  __int16 v18 = [(HMDBulletinNotificationRegistration *)v6 conditions];
  __int16 v19 = [a1 conditionsFromLocalConditions:v18];

  id v20 = [HMDMatterBulletinNotificationRegistration alloc];
  v44[0] = v17;
  uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:1];
  id v16 = [(HMDMatterBulletinNotificationRegistration *)v20 initWithMatterPaths:v21 conditions:v19];

  id v22 = (void *)MEMORY[0x230FBD990]();
  id v23 = a1;
  __int16 v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    id v33 = v7;
    id v25 = v11;
    id v27 = v26 = v10;
    *(_DWORD *)buf = 138543874;
    id v39 = v27;
    __int16 v40 = 2112;
    __int16 v41 = v16;
    __int16 v42 = 2112;
    __int16 v43 = v6;
    _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Initialized registration: %@ from local registration: %@", buf, 0x20u);

    id v10 = v26;
    id v11 = v25;
    id v7 = v33;
  }

  id v13 = v34;
  uint64_t v12 = v35;
LABEL_10:

LABEL_11:
  return v16;
}

+ (id)accessoryRegistrationFromLocalRegistration:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 accessoryModelID];
  int v6 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "serviceInstanceID"));
  id v7 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "characteristicInstanceID"));
  uint64_t v8 = [v4 conditions];
  int v9 = [a1 conditionsFromLocalConditions:v8];

  id v10 = [[HMDAccessoryBulletinNotificationRegistration alloc] initWithAccessoryUUID:v5 serviceInstanceID:v6 characteristicInstanceID:v7 conditions:v9];
  id v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = a1;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    int v16 = 138543874;
    __int16 v17 = v14;
    __int16 v18 = 2112;
    __int16 v19 = v10;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Initialized registration: %@ from local registration: %@", (uint8_t *)&v16, 0x20u);
  }

  return v10;
}

+ (id)adjustedOffsetFromMKFLocalElementTimePeriodSunriseSunSet:(id)a3
{
  id v3 = [a3 offset];
  uint64_t v4 = [v3 hour];
  id v5 = objc_alloc_init(MEMORY[0x263EFF918]);
  int v6 = v5;
  if (v4 && v4 != 0x7FFFFFFFFFFFFFFFLL) {
    [v5 setHour:v4];
  }
  uint64_t v7 = [v3 minute];
  if (v7 && v7 != 0x7FFFFFFFFFFFFFFFLL) {
    [v6 setMinute:v7];
  }

  return v6;
}

+ (id)timePeriodConditionFromLocalCondition:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 startElement];
  int v6 = [v4 endElement];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v5;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      id v9 = v8;

      id v10 = v6;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v11 = v10;
      }
      else {
        id v11 = 0;
      }
      id v12 = v11;

      id v13 = [HMDTimeOfDayTimePeriodElement alloc];
      uint64_t v14 = [v9 hour];
      uint64_t v15 = [v14 unsignedIntegerValue];
      int v16 = [v9 minute];
      __int16 v17 = -[HMDTimeOfDayTimePeriodElement initWithHour:minute:](v13, "initWithHour:minute:", v15, [v16 unsignedIntegerValue]);

      __int16 v18 = [HMDTimeOfDayTimePeriodElement alloc];
      __int16 v19 = [v12 hour];
      uint64_t v20 = [v19 unsignedIntegerValue];
      id v21 = [v12 minute];
      uint64_t v22 = -[HMDTimeOfDayTimePeriodElement initWithHour:minute:](v18, "initWithHour:minute:", v20, [v21 unsignedIntegerValue]);

      id v23 = [HMDTimePeriodNotificationCondition alloc];
      __int16 v24 = [(HMDTimePeriodNotificationCondition *)v23 initWithStartElement:v17 endElement:v22];

LABEL_19:
      goto LABEL_23;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v25 = v5;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v26 = v25;
      }
      else {
        uint64_t v26 = 0;
      }
      id v27 = v26;

      id v28 = v6;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v29 = v28;
      }
      else {
        v29 = 0;
      }
      id v30 = v29;

      __int16 v17 = [a1 adjustedOffsetFromMKFLocalElementTimePeriodSunriseSunSet:v27];
      id v31 = [a1 adjustedOffsetFromMKFLocalElementTimePeriodSunriseSunSet:v30];
      v32 = [HMDSunriseSunsetTimePeriodElement alloc];
      id v33 = [v27 significantEvent];
      id v34 = [(HMDSunriseSunsetTimePeriodElement *)v32 initWithSignificantEvent:v33 offset:v17];

      uint64_t v35 = [HMDSunriseSunsetTimePeriodElement alloc];
      id v36 = [v30 significantEvent];
      __int16 v37 = [(HMDSunriseSunsetTimePeriodElement *)v35 initWithSignificantEvent:v36 offset:v31];

      v38 = [HMDTimePeriodNotificationCondition alloc];
      __int16 v24 = [(HMDTimePeriodNotificationCondition *)v38 initWithStartElement:v34 endElement:v37];

      goto LABEL_19;
    }
  }
  id v39 = (void *)MEMORY[0x230FBD990]();
  id v40 = a1;
  __int16 v41 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    __int16 v42 = HMFGetLogIdentifier();
    int v44 = 138543874;
    uint64_t v45 = v42;
    __int16 v46 = 2112;
    id v47 = v5;
    __int16 v48 = 2112;
    v49 = v6;
    _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@Unrecognized local time period start element: %@ end element: %@, unable to convert", (uint8_t *)&v44, 0x20u);
  }
  __int16 v24 = 0;
LABEL_23:

  return v24;
}

+ (id)presenceConditionFromLocalCondition:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userModelIDs];
  id v5 = [MEMORY[0x263EFFA08] set];
  if ([v4 count])
  {
    int v6 = [v4 anyObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0 && v6)
    {
      objc_msgSend(v4, "na_map:", &__block_literal_global_156909);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = v4;
    }
    id v9 = v8;

    id v5 = v9;
  }
  id v10 = [HMDPresenceNotificationCondition alloc];
  id v11 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "presenceEventType"));
  uint64_t v12 = [v11 unsignedIntegerValue];
  id v13 = NSNumber;
  uint64_t v14 = [v3 presenceEventUserType];

  uint64_t v15 = [v13 numberWithLongLong:v14];
  int v16 = -[HMDPresenceNotificationCondition initWithPresenceEventType:presenceEventUserType:userUUIDs:](v10, "initWithPresenceEventType:presenceEventUserType:userUUIDs:", v12, [v15 unsignedIntegerValue], v5);

  return v16;
}

id __84__HMDBulletinNotificationRegistrationUtilities_presenceConditionFromLocalCondition___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F08C38];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

+ (id)conditionsFromLocalConditions:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __78__HMDBulletinNotificationRegistrationUtilities_conditionsFromLocalConditions___block_invoke;
  v5[3] = &__block_descriptor_40_e35__16__0__MKFLocalBulletinCondition_8l;
  v5[4] = a1;
  id v3 = objc_msgSend(a3, "na_map:", v5);
  return v3;
}

id __78__HMDBulletinNotificationRegistrationUtilities_conditionsFromLocalConditions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;

    uint64_t v7 = +[HMDBulletinNotificationRegistrationUtilities presenceConditionFromLocalCondition:v6];
LABEL_11:
    id v10 = (void *)v7;

    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v6 = v9;

    uint64_t v7 = +[HMDBulletinNotificationRegistrationUtilities timePeriodConditionFromLocalCondition:v6];
    goto LABEL_11;
  }
  id v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = *(id *)(a1 + 32);
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    int v16 = 138543618;
    __int16 v17 = v14;
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unrecognized local condition: %@, unable to convert", (uint8_t *)&v16, 0x16u);
  }
  id v10 = 0;
LABEL_15:

  return v10;
}

+ (id)createLocalElementFromSunriseSunset:(id)a3 moc:(id)a4
{
  id v5 = (void *)MEMORY[0x263EFF240];
  id v6 = a4;
  id v7 = a3;
  id v8 = +[MKFLocalElementTimePeriodSunriseSunSet entity];
  id v9 = [v8 name];
  id v10 = [v5 insertNewObjectForEntityForName:v9 inManagedObjectContext:v6];

  id v11 = [v7 significantEvent];
  [v10 setSignificantEvent:v11];

  id v12 = [v7 offset];

  [v10 setOffset:v12];
  return v10;
}

+ (id)createLocalElementFromTimeOfDay:(id)a3 moc:(id)a4
{
  id v5 = (void *)MEMORY[0x263EFF240];
  id v6 = a4;
  id v7 = a3;
  id v8 = +[MKFLocalElementTimePeriodTimeOfDay entity];
  id v9 = [v8 name];
  id v10 = [v5 insertNewObjectForEntityForName:v9 inManagedObjectContext:v6];

  id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "hour"));
  [v10 setHour:v11];

  id v12 = NSNumber;
  uint64_t v13 = [v7 minute];

  uint64_t v14 = [v12 numberWithUnsignedInteger:v13];
  [v10 setMinute:v14];

  return v10;
}

+ (id)createAndAddLocalTimePeriodConditionToRegistration:(id)a3 moc:(id)a4 condition:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x263EFF240];
  id v11 = a3;
  id v12 = +[MKFLocalBulletinConditionTimePeriod entity];
  uint64_t v13 = [v12 name];
  uint64_t v14 = [v10 insertNewObjectForEntityForName:v13 inManagedObjectContext:v8];

  uint64_t v15 = [v9 startElement];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v16 = [v9 endElement];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      __int16 v18 = [v9 startElement];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v19 = v18;
      }
      else {
        id v19 = 0;
      }
      id v20 = v19;

      id v21 = [v9 endElement];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v22 = v21;
      }
      else {
        uint64_t v22 = 0;
      }
      id v23 = v22;

      __int16 v24 = [a1 createLocalElementFromTimeOfDay:v20 moc:v8];

      [v14 setStartElement:v24];
      uint64_t v25 = [a1 createLocalElementFromTimeOfDay:v23 moc:v8];
LABEL_20:
      uint64_t v26 = (void *)v25;

      [v14 setEndElement:v26];
      goto LABEL_21;
    }
  }
  else
  {
  }
  uint64_t v26 = [v9 startElement];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v27 = [v9 endElement];
    objc_opt_class();
    char v28 = objc_opt_isKindOfClass();

    if ((v28 & 1) == 0) {
      goto LABEL_22;
    }
    v29 = [v9 startElement];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v30 = v29;
    }
    else {
      id v30 = 0;
    }
    id v31 = v30;

    v32 = [v9 endElement];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v33 = v32;
    }
    else {
      id v33 = 0;
    }
    id v23 = v33;

    id v34 = [a1 createLocalElementFromSunriseSunset:v31 moc:v8];

    [v14 setStartElement:v34];
    uint64_t v25 = [a1 createLocalElementFromSunriseSunset:v23 moc:v8];
    goto LABEL_20;
  }
LABEL_21:

LABEL_22:
  [v14 setRegistration:v11];
  [v11 addConditionsObject:v14];

  return v14;
}

+ (id)createAndAddLocalPresenceConditionToRegistration:(id)a3 moc:(id)a4 condition:(id)a5
{
  id v7 = (void *)MEMORY[0x263EFF240];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[MKFLocalBulletinConditionPresence entity];
  id v12 = [v11 name];
  uint64_t v13 = [v7 insertNewObjectForEntityForName:v12 inManagedObjectContext:v9];

  objc_msgSend(v13, "setPresenceEventType:", objc_msgSend(v8, "presenceEventType"));
  objc_msgSend(v13, "setPresenceEventUserType:", objc_msgSend(v8, "presenceEventUserType"));
  uint64_t v14 = [v8 userUUIDs];

  [v13 setUserModelIDs:v14];
  [v13 setRegistration:v10];
  [v10 addConditionsObject:v13];

  return v13;
}

+ (id)createAndAddLocalConditionsToRegistration:(id)a3 moc:(id)a4 conditions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __105__HMDBulletinNotificationRegistrationUtilities_createAndAddLocalConditionsToRegistration_moc_conditions___block_invoke;
  v14[3] = &unk_264A225E0;
  id v16 = v9;
  id v17 = a1;
  id v15 = v8;
  id v10 = v9;
  id v11 = v8;
  id v12 = objc_msgSend(a5, "na_map:", v14);

  return v12;
}

id __105__HMDBulletinNotificationRegistrationUtilities_createAndAddLocalConditionsToRegistration_moc_conditions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;

    uint64_t v7 = [*(id *)(a1 + 48) createAndAddLocalPresenceConditionToRegistration:*(void *)(a1 + 32) moc:*(void *)(a1 + 40) condition:v6];
LABEL_11:
    id v10 = (void *)v7;

    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v6 = v9;

    uint64_t v7 = [*(id *)(a1 + 48) createAndAddLocalTimePeriodConditionToRegistration:*(void *)(a1 + 32) moc:*(void *)(a1 + 40) condition:v6];
    goto LABEL_11;
  }
  id v10 = 0;
LABEL_13:

  return v10;
}

@end