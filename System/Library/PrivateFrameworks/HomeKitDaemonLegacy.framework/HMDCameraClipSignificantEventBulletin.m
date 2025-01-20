@interface HMDCameraClipSignificantEventBulletin
+ (id)actionURLForHomeUUID:(id)a3 cameraUUID:(id)a4;
+ (id)localizedMessageForSignificantEvents:(id)a3 cameraAccessory:(id)a4;
+ (unint64_t)effectiveReasonForSignificantEvent:(id)a3;
- (BOOL)shouldShowProvideFeedbackButton;
- (HMDAccessory)accessory;
- (HMDCameraClipSignificantEventBulletin)initWithSignificantEvent:(id)a3 previewImageFilePathURL:(id)a4 dateOfOccurrence:(id)a5 camera:(id)a6 home:(id)a7 accessory:(id)a8 recordingService:(id)a9 shouldShowProvideFeedbackButton:(BOOL)a10;
- (HMDCameraClipSignificantEventBulletin)initWithSignificantEvents:(id)a3 previewImageNotificationUUID:(id)a4 previewImageFilePathURL:(id)a5 dateOfOccurrence:(id)a6 camera:(id)a7 home:(id)a8 accessory:(id)a9 recordingService:(id)a10 clipUUID:(id)a11 shouldShowProvideFeedbackButton:(BOOL)a12;
- (HMDCameraClipSignificantEventBulletin)initWithSignificantEvents:(id)a3 previewImageNotificationUUID:(id)a4 previewImageFilePathURL:(id)a5 dateOfOccurrence:(id)a6 camera:(id)a7 home:(id)a8 accessory:(id)a9 recordingService:(id)a10 requestIdentifier:(id)a11 clipUUID:(id)a12 shouldShowProvideFeedbackButton:(BOOL)a13;
- (HMDCameraProfile)camera;
- (HMDHome)home;
- (HMDService)service;
- (NSDate)dateOfOccurrence;
- (NSDictionary)userInfo;
- (NSSet)significantEvents;
- (NSString)body;
- (NSString)requestIdentifier;
- (NSString)threadIdentifier;
- (NSString)title;
- (NSURL)previewImageFilePathURL;
- (NSUUID)clipUUID;
- (NSUUID)previewImageNotificationUUID;
- (id)createUserInfoWithWithSignificantEvents:(id)a3 previewImageNotificationUUID:(id)a4 camera:(id)a5 home:(id)a6 accessory:(id)a7 recordingService:(id)a8 clipUUID:(id)a9;
@end

@implementation HMDCameraClipSignificantEventBulletin

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_clipUUID, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_dateOfOccurrence, 0);
  objc_storeStrong((id *)&self->_previewImageFilePathURL, 0);
  objc_storeStrong((id *)&self->_previewImageNotificationUUID, 0);
  objc_storeStrong((id *)&self->_significantEvents, 0);
}

- (NSString)requestIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)threadIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)body
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)shouldShowProvideFeedbackButton
{
  return self->_shouldShowProvideFeedbackButton;
}

- (NSUUID)clipUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 80, 1);
}

- (HMDService)service
{
  return (HMDService *)objc_getProperty(self, a2, 72, 1);
}

- (HMDAccessory)accessory
{
  return (HMDAccessory *)objc_getProperty(self, a2, 64, 1);
}

- (HMDHome)home
{
  return (HMDHome *)objc_getProperty(self, a2, 56, 1);
}

- (HMDCameraProfile)camera
{
  return (HMDCameraProfile *)objc_getProperty(self, a2, 48, 1);
}

- (NSDate)dateOfOccurrence
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (NSURL)previewImageFilePathURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)previewImageNotificationUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)significantEvents
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (id)createUserInfoWithWithSignificantEvents:(id)a3 previewImageNotificationUUID:(id)a4 camera:(id)a5 home:(id)a6 accessory:(id)a7 recordingService:(id)a8 clipUUID:(id)a9
{
  v44[9] = *MEMORY[0x1E4F143B8];
  id v42 = a9;
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a4;
  id v19 = a3;
  v20 = [a5 contextSPIUniqueIdentifier];
  v21 = [v20 UUIDString];

  v22 = [v17 contextSPIUniqueIdentifier];
  v23 = [v22 UUIDString];

  v40 = [(id)objc_opt_class() actionURLForHomeUUID:v23 cameraUUID:v21];
  v24 = objc_msgSend(v19, "na_map:", &__block_literal_global_67_162923);
  v41 = [v24 allObjects];

  uint64_t v25 = objc_msgSend(v19, "na_any:", &__block_literal_global_69_162924);
  uint64_t v26 = *MEMORY[0x1E4F2CA78];
  v43[0] = *MEMORY[0x1E4F2CA80];
  v43[1] = v26;
  v44[0] = v41;
  v44[1] = v21;
  v43[2] = *MEMORY[0x1E4F2CA70];
  v27 = [v18 UUIDString];

  uint64_t v28 = *MEMORY[0x1E4F2CA98];
  v44[2] = v27;
  v44[3] = v23;
  uint64_t v29 = *MEMORY[0x1E4F2E308];
  v43[3] = v28;
  v43[4] = v29;
  v30 = [v40 absoluteString];
  v44[4] = v30;
  v43[5] = @"service";
  v31 = [v15 contextID];

  v44[5] = v31;
  v43[6] = @"home";
  v32 = [v17 contextID];

  v44[6] = v32;
  v43[7] = @"accessory";
  v33 = [v16 contextID];

  v44[7] = v33;
  v43[8] = @"HMDBulletinContextDidDetectedPerson";
  v34 = [NSNumber numberWithBool:v25];
  v44[8] = v34;
  v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:9];
  v36 = (void *)[v35 mutableCopy];

  v37 = [v42 UUIDString];

  [v36 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F2CA68]];
  v38 = (void *)[v36 copy];

  return v38;
}

BOOL __158__HMDCameraClipSignificantEventBulletin_createUserInfoWithWithSignificantEvents_previewImageNotificationUUID_camera_home_accessory_recordingService_clipUUID___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 reason] == 2;
}

id __158__HMDCameraClipSignificantEventBulletin_createUserInfoWithWithSignificantEvents_previewImageNotificationUUID_camera_home_accessory_recordingService_clipUUID___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 uniqueIdentifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (HMDCameraClipSignificantEventBulletin)initWithSignificantEvent:(id)a3 previewImageFilePathURL:(id)a4 dateOfOccurrence:(id)a5 camera:(id)a6 home:(id)a7 accessory:(id)a8 recordingService:(id)a9 shouldShowProvideFeedbackButton:(BOOL)a10
{
  id v16 = (void *)MEMORY[0x1E4F1CAD0];
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  v30 = [v16 setWithObject:v23];
  v24 = [v23 uniqueIdentifier];
  uint64_t v25 = [v23 uniqueIdentifier];

  uint64_t v26 = [v25 UUIDString];
  LOBYTE(v29) = a10;
  v27 = [(HMDCameraClipSignificantEventBulletin *)self initWithSignificantEvents:v30 previewImageNotificationUUID:v24 previewImageFilePathURL:v22 dateOfOccurrence:v21 camera:v20 home:v19 accessory:v18 recordingService:v17 requestIdentifier:v26 clipUUID:0 shouldShowProvideFeedbackButton:v29];

  return v27;
}

- (HMDCameraClipSignificantEventBulletin)initWithSignificantEvents:(id)a3 previewImageNotificationUUID:(id)a4 previewImageFilePathURL:(id)a5 dateOfOccurrence:(id)a6 camera:(id)a7 home:(id)a8 accessory:(id)a9 recordingService:(id)a10 clipUUID:(id)a11 shouldShowProvideFeedbackButton:(BOOL)a12
{
  HIDWORD(v29) = a12;
  id v18 = a11;
  id v19 = a10;
  id v20 = a9;
  id v21 = a8;
  id v22 = a7;
  id v23 = a6;
  id v24 = a5;
  id v25 = a4;
  id v26 = a3;
  v27 = [v18 UUIDString];
  LOBYTE(v29) = a12;
  v31 = [(HMDCameraClipSignificantEventBulletin *)self initWithSignificantEvents:v26 previewImageNotificationUUID:v25 previewImageFilePathURL:v24 dateOfOccurrence:v23 camera:v22 home:v21 accessory:v20 recordingService:v19 requestIdentifier:v27 clipUUID:v18 shouldShowProvideFeedbackButton:v29];

  return v31;
}

- (HMDCameraClipSignificantEventBulletin)initWithSignificantEvents:(id)a3 previewImageNotificationUUID:(id)a4 previewImageFilePathURL:(id)a5 dateOfOccurrence:(id)a6 camera:(id)a7 home:(id)a8 accessory:(id)a9 recordingService:(id)a10 requestIdentifier:(id)a11 clipUUID:(id)a12 shouldShowProvideFeedbackButton:(BOOL)a13
{
  id v18 = a3;
  id v19 = a4;
  id v59 = a5;
  id v62 = a5;
  id v60 = a6;
  id v20 = a6;
  id obj = a7;
  id v64 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  if (!v18)
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v19)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v20)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  id v26 = v20;
  v27 = v64;
  if (!v64)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v21)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  if (!v22)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  if (!v23)
  {
LABEL_18:
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  if (!v24)
  {
LABEL_19:
    v54 = (void *)_HMFPreconditionFailure();
    return (HMDCameraClipSignificantEventBulletin *)+[HMDCameraClipSignificantEventBulletin actionURLForHomeUUID:v56 cameraUUID:v57];
  }
  id v28 = v25;
  v63 = v26;
  v65.receiver = self;
  v65.super_class = (Class)HMDCameraClipSignificantEventBulletin;
  uint64_t v29 = [(HMDCameraClipSignificantEventBulletin *)&v65 init];
  v30 = v29;
  v31 = v24;
  v32 = v22;
  v33 = v28;
  v34 = v23;
  v35 = v31;
  if (v29)
  {
    v29->_shouldShowProvideFeedbackButton = a13;
    uint64_t v36 = [v31 copy];
    requestIdentifier = v30->_requestIdentifier;
    v30->_requestIdentifier = (NSString *)v36;

    objc_storeStrong((id *)&v30->_camera, obj);
    objc_storeStrong((id *)&v30->_home, a8);
    objc_storeStrong((id *)&v30->_service, a10);
    objc_storeStrong((id *)&v30->_accessory, a9);
    objc_storeStrong((id *)&v30->_previewImageFilePathURL, v59);
    uint64_t v38 = [v18 copy];
    significantEvents = v30->_significantEvents;
    v30->_significantEvents = (NSSet *)v38;

    uint64_t v40 = [v19 copy];
    previewImageNotificationUUID = v30->_previewImageNotificationUUID;
    v30->_previewImageNotificationUUID = (NSUUID *)v40;

    uint64_t v42 = [(HMDCameraClipSignificantEventBulletin *)v30 createUserInfoWithWithSignificantEvents:v18 previewImageNotificationUUID:v19 camera:v64 home:v21 accessory:v32 recordingService:v34 clipUUID:v33];
    userInfo = v30->_userInfo;
    v30->_userInfo = (NSDictionary *)v42;

    uint64_t v44 = [v21 name];
    title = v30->_title;
    v30->_title = (NSString *)v44;

    uint64_t v46 = [(id)objc_opt_class() localizedMessageForSignificantEvents:v18 cameraAccessory:v32];
    body = v30->_body;
    v30->_body = (NSString *)v46;

    v48 = [v21 uuid];
    uint64_t v49 = [v48 UUIDString];
    threadIdentifier = v30->_threadIdentifier;
    v30->_threadIdentifier = (NSString *)v49;

    v27 = v64;
    objc_storeStrong((id *)&v30->_dateOfOccurrence, v60);
    uint64_t v51 = [v33 copy];
    clipUUID = v30->_clipUUID;
    v30->_clipUUID = (NSUUID *)v51;
  }
  return v30;
}

+ (id)actionURLForHomeUUID:(id)a3 cameraUUID:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F2E690];
  id v6 = a4;
  v7 = [v5 tupleWithQueryType:0 uuidString:a3];
  v8 = [MEMORY[0x1E4F2E690] tupleWithQueryType:5 uuidString:v6];

  v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
  v10 = generateURLForHomeKitObject();

  return v10;
}

+ (id)localizedMessageForSignificantEvents:(id)a3 cameraAccessory:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA48] array];
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __94__HMDCameraClipSignificantEventBulletin_localizedMessageForSignificantEvents_cameraAccessory___block_invoke;
  v65[3] = &__block_descriptor_40_e34_B16__0__HMCameraSignificantEvent_8l;
  v65[4] = a1;
  v9 = objc_msgSend(v6, "na_filter:", v65);
  v10 = objc_msgSend(v9, "na_map:", &__block_literal_global_162967);
  SEL v55 = v10;
  id v56 = v9;
  if ([v10 count])
  {
    id v53 = v7;
    v11 = [v7 home];
    v12 = [v11 currentUser];
    v13 = [v12 personSettingsManager];

    v14 = [v10 allObjects];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __94__HMDCameraClipSignificantEventBulletin_localizedMessageForSignificantEvents_cameraAccessory___block_invoke_3;
    v63[3] = &unk_1E6A14F20;
    id v15 = v13;
    id v64 = v15;
    id v16 = [v14 sortedArrayUsingComparator:v63];

    uint64_t v17 = [v9 count];
    id v18 = NSString;
    v52 = v16;
    if (v17 == 1)
    {
      id v19 = HMDLocalizedStringForKey(@"PERSON_FAMILIAR");
      id v62 = 0;
      id v20 = [v16 firstObject];
      id v21 = [v20 name];
      id v22 = [v18 localizedStringWithValidatedFormat:v19, @"%@", &v62, v21 validFormatSpecifiers error];
      id v23 = v62;

      if (!v22)
      {
        id v24 = (void *)MEMORY[0x1D9452090]();
        id v25 = HMFGetOSLogHandle();
        id v22 = @"PERSON_FAMILIAR";
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v27 = id v26 = v24;
          *(_DWORD *)buf = 138544130;
          v67 = v27;
          __int16 v68 = 2112;
          v69 = @"PERSON_FAMILIAR";
          __int16 v70 = 2112;
          v71 = @"%@";
          __int16 v72 = 2112;
          id v73 = v23;
LABEL_15:
          _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

          id v24 = v26;
          goto LABEL_16;
        }
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v29 = HMDLocalizedStringForKey(@"PERSON_FAMILIAR_MULTIPLE");
      id v61 = 0;
      v30 = [v16 firstObject];
      v31 = [v30 name];
      id v22 = [v18 localizedStringWithValidatedFormat:v29, @"%@", &v61, v31 validFormatSpecifiers error];
      id v23 = v61;

      if (!v22)
      {
        id v24 = (void *)MEMORY[0x1D9452090]();
        id v25 = HMFGetOSLogHandle();
        id v22 = @"PERSON_FAMILIAR_MULTIPLE";
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v27 = id v26 = v24;
          *(_DWORD *)buf = 138544130;
          v67 = v27;
          __int16 v68 = 2112;
          v69 = @"PERSON_FAMILIAR_MULTIPLE";
          __int16 v70 = 2112;
          v71 = @"%@";
          __int16 v72 = 2112;
          id v73 = v23;
          goto LABEL_15;
        }
LABEL_16:
        v33 = v52;

        v32 = 0;
        goto LABEL_17;
      }
    }
    v32 = v22;
    v33 = v52;
LABEL_17:
    v34 = v22;

    [v8 addObject:v34];
    id v7 = v53;
    goto LABEL_18;
  }
  if ([v9 count] == 1)
  {
    id v28 = @"PERSON_UNFAMILIAR";
  }
  else
  {
    if ((unint64_t)[v9 count] < 2) {
      goto LABEL_19;
    }
    id v28 = @"PERSON_UNFAMILIAR_MULTIPLE";
  }
  HMDLocalizedStringForKey(v28);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  [v8 addObject:v15];
LABEL_18:

LABEL_19:
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __94__HMDCameraClipSignificantEventBulletin_localizedMessageForSignificantEvents_cameraAccessory___block_invoke_17;
  v60[3] = &__block_descriptor_40_e34_B16__0__HMCameraSignificantEvent_8l;
  v60[4] = a1;
  if (objc_msgSend(v6, "na_any:", v60))
  {
    v35 = HMDLocalizedStringForKey(@"ANIMAL");
    [v8 addObject:v35];
  }
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __94__HMDCameraClipSignificantEventBulletin_localizedMessageForSignificantEvents_cameraAccessory___block_invoke_2_21;
  v59[3] = &__block_descriptor_40_e34_B16__0__HMCameraSignificantEvent_8l;
  v59[4] = a1;
  if (objc_msgSend(v6, "na_any:", v59))
  {
    uint64_t v36 = HMDLocalizedStringForKey(@"VEHICLE");
    [v8 addObject:v36];
  }
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __94__HMDCameraClipSignificantEventBulletin_localizedMessageForSignificantEvents_cameraAccessory___block_invoke_3_25;
  v58[3] = &__block_descriptor_40_e34_B16__0__HMCameraSignificantEvent_8l;
  v58[4] = a1;
  if (objc_msgSend(v6, "na_any:", v58))
  {
    v37 = HMDLocalizedStringForKey(@"PACKAGE");
    [v8 addObject:v37];
  }
  if (![v8 count])
  {
    uint64_t v38 = HMDLocalizedStringForKey(@"MOTION");
    [v8 addObject:v38];
  }
  v39 = +[HMDBulletinCategory localizedStringForItems:v8];
  uint64_t v40 = NSString;
  v41 = HMDLocalizedStringForKey(@"CAMERA_RECORDING_SIGNIFICANT_EVENT_DETECTED_MESSAGE");
  id v57 = 0;
  uint64_t v42 = [v7 name];
  v43 = [v40 localizedStringWithValidatedFormat:v41, @"%@ %@", &v57, v42, v39 validFormatSpecifiers error];
  id v44 = v57;

  v45 = v43;
  if (!v43)
  {
    id v54 = v6;
    id v46 = v7;
    v47 = (void *)MEMORY[0x1D9452090]();
    v48 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      uint64_t v49 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v67 = v49;
      __int16 v68 = 2112;
      v69 = @"CAMERA_RECORDING_SIGNIFICANT_EVENT_DETECTED_MESSAGE";
      __int16 v70 = 2112;
      v71 = @"%@ %@";
      __int16 v72 = 2112;
      id v73 = v44;
      _os_log_impl(&dword_1D49D5000, v48, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
    }
    v45 = @"CAMERA_RECORDING_SIGNIFICANT_EVENT_DETECTED_MESSAGE";
    id v7 = v46;
    id v6 = v54;
  }
  v50 = v45;

  return v50;
}

BOOL __94__HMDCameraClipSignificantEventBulletin_localizedMessageForSignificantEvents_cameraAccessory___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) effectiveReasonForSignificantEvent:a2] == 2;
}

uint64_t __94__HMDCameraClipSignificantEventBulletin_localizedMessageForSignificantEvents_cameraAccessory___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  v8 = [v5 UUID];
  int v9 = [v7 areClassificationNotificationsEnabledForPersonUUID:v8];

  v10 = *(void **)(a1 + 32);
  v11 = [v6 UUID];
  LODWORD(v10) = [v10 areClassificationNotificationsEnabledForPersonUUID:v11];

  if (v9 == v10)
  {
    v13 = [v5 name];
    v14 = [v6 name];
    uint64_t v12 = [v13 localizedCaseInsensitiveCompare:v14];
  }
  else if (v9)
  {
    uint64_t v12 = -1;
  }
  else
  {
    uint64_t v12 = 1;
  }

  return v12;
}

BOOL __94__HMDCameraClipSignificantEventBulletin_localizedMessageForSignificantEvents_cameraAccessory___block_invoke_17(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) effectiveReasonForSignificantEvent:a2] == 3;
}

BOOL __94__HMDCameraClipSignificantEventBulletin_localizedMessageForSignificantEvents_cameraAccessory___block_invoke_2_21(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) effectiveReasonForSignificantEvent:a2] == 4;
}

BOOL __94__HMDCameraClipSignificantEventBulletin_localizedMessageForSignificantEvents_cameraAccessory___block_invoke_3_25(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) effectiveReasonForSignificantEvent:a2] == 5;
}

id __94__HMDCameraClipSignificantEventBulletin_localizedMessageForSignificantEvents_cameraAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 faceClassification];
  v3 = [v2 person];

  v4 = [v3 name];
  if (v4) {
    id v5 = v3;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

+ (unint64_t)effectiveReasonForSignificantEvent:(id)a3
{
  id v3 = a3;
  if ([v3 confidenceLevel] == 100) {
    unint64_t v4 = [v3 reason];
  }
  else {
    unint64_t v4 = 1;
  }

  return v4;
}

@end