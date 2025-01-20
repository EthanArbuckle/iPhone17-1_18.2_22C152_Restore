@interface HMDGuestModel
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)properties;
- (BOOL)shouldIgnoreProperty:(id)a3;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
@end

@implementation HMDGuestModel

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"allowedAccessories_"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"allowedAccessoryUUIDs"])
    {
      uint64_t v18 = 0;
      v19 = &v18;
      uint64_t v20 = 0x3032000000;
      v21 = __Block_byref_object_copy__175331;
      v22 = __Block_byref_object_dispose__175332;
      v11 = (void *)MEMORY[0x263EFF9C0];
      v12 = [(HMDGuestModel *)self allowedAccessoryUUIDs];
      objc_msgSend(v11, "setWithCapacity:", objc_msgSend(v12, "count"));
      id v23 = (id)objc_claimAutoreleasedReturnValue();

      v13 = [(HMDGuestModel *)self allowedAccessoryUUIDs];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __82__HMDGuestModel_CoreData__cd_generateValueForProperty_managedObjectField_context___block_invoke;
      v17[3] = &unk_264A23820;
      v17[4] = &v18;
      objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v17);

      id v14 = (id)v19[5];
      _Block_object_dispose(&v18, 8);
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)HMDGuestModel;
    id v14 = [(HMDUserModel *)&v16 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
  }

  return v14;
}

void __82__HMDGuestModel_CoreData__cd_generateValueForProperty_managedObjectField_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend((id)objc_opt_class(), "cd_getMKFAccessoryFromAccessory:", v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
    v4 = v5;
  }
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(HMDGuestModel *)self shouldIgnoreProperty:v9])
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v14;
      __int16 v21 = 2114;
      id v22 = v9;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring property [%{public}@] as it is not applicable for _MKFGuest entity", buf, 0x16u);
    }
    v15 = 0;
  }
  else
  {
    if ([v9 isEqualToString:@"allowedAccessoryUUIDs"])
    {
      uint64_t v16 = [v8 allowedAccessoryUUIDs];
    }
    else
    {
      v18.receiver = self;
      v18.super_class = (Class)HMDGuestModel;
      uint64_t v16 = [(HMDUserModel *)&v18 cd_generateValueForModelObjectFromManagedObject:v8 modelObjectField:v9 modelFieldInfo:v10];
    }
    v15 = (void *)v16;
  }

  return v15;
}

- (BOOL)shouldIgnoreProperty:(id)a3
{
  uint64_t v3 = shouldIgnoreProperty__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&shouldIgnoreProperty__onceToken, &__block_literal_global_175338);
  }
  char v5 = [(id)shouldIgnoreProperty__ignoredPropertySet containsObject:v4];

  return v5;
}

void __48__HMDGuestModel_CoreData__shouldIgnoreProperty___block_invoke()
{
  v4[31] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = @"activityNotificationsEnabledForPersonalRequests";
  v4[1] = @"allowExplicitContent";
  v4[2] = @"allowiTunesAccount";
  v4[3] = @"analysisAccessSelection";
  v4[4] = @"changeTag";
  v4[5] = @"dolbyAtmosEnabled";
  v4[6] = @"losslessMusicEnabled";
  v4[7] = @"ownerAddSceneButtonPresentedCount";
  v4[8] = @"ownerCharacteristicAuthorizationData";
  v4[9] = @"ownerCompletedSwitchingHomesOnboardingUI";
  v4[10] = @"ownerDismissed2024EnergyOnboarding";
  v4[11] = @"ownerDismissedAccessCodeOnboarding";
  v4[12] = @"ownerDismissedAccessoryFirmwareUpdateOnboarding";
  v4[13] = @"ownerDismissedAnnounceOnboarding";
  v4[14] = @"ownerDismissedCameraRecordingOnboarding";
  v4[15] = @"ownerDismissedCameraRecordingSetupBanner";
  v4[16] = @"ownerDismissedCameraUpgradeOfferBanner";
  v4[17] = @"ownerDismissedHomeTheaterOnboarding";
  v4[18] = @"ownerDismissedIdentifyVoiceOnboarding";
  v4[19] = @"ownerDismissedIdentifyVoiceSetupBanner";
  v4[20] = @"ownerDismissedNaturalLightingOnboarding";
  v4[21] = @"ownerDismissedTVViewingProfileOnboarding";
  v4[22] = @"ownerDismissedTVViewingProfileSetupBanner";
  v4[23] = @"ownerDismissedUserSplitMediaAccountWarning";
  v4[24] = @"ownerDismissedWalletKeyExpressModeOnboarding";
  v4[25] = @"ownerDismissedWelcomeUI";
  v4[26] = @"ownerHasUserSeenRMVNewLanguageNotification";
  v4[27] = @"photosPersonDataZoneUUIDString";
  v4[28] = @"playbackInfluencesEnabled";
  v4[29] = @"sharePhotosFaceClassifications";
  v4[30] = @"siriIdentifyVoiceEnabled";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:31];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)shouldIgnoreProperty__ignoredPropertySet;
  shouldIgnoreProperty__ignoredPropertySet = v2;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)@"home";
}

+ (id)properties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__HMDGuestModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_191976 != -1) {
    dispatch_once(&properties_onceToken_191976, block);
  }
  uint64_t v2 = (void *)properties__properties_191977;
  return v2;
}

void __27__HMDGuestModel_properties__block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v10 = @"allowedAccessoryUUIDs";
  uint64_t v3 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];

  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)&OBJC_METACLASS___HMDGuestModel;
  char v5 = objc_msgSendSuper2(&v9, sel_properties);
  v6 = (void *)[v5 mutableCopy];

  [v6 addEntriesFromDictionary:v4];
  uint64_t v7 = [v6 copy];
  id v8 = (void *)properties__properties_191977;
  properties__properties_191977 = v7;
}

@end