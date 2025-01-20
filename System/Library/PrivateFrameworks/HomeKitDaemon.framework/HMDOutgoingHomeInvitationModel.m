@interface HMDOutgoingHomeInvitationModel
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)properties;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
- (id)dependentUUIDs;
- (id)rgSettingsFromOutgoingInvitation:(id)a3;
@end

@implementation HMDOutgoingHomeInvitationModel

- (id)dependentUUIDs
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9C0] setWithCapacity:2];
  v4 = [(HMDBackingStoreModelObject *)self parentUUID];

  if (v4)
  {
    v5 = [(HMDBackingStoreModelObject *)self parentUUID];
    [v3 addObject:v5];
  }
  v6 = [(HMDOutgoingHomeInvitationModel *)self pendingUserUUID];

  if (v6)
  {
    v7 = [(HMDOutgoingHomeInvitationModel *)self pendingUserUUID];
    [v3 addObject:v7];
  }
  v8 = [(HMDOutgoingHomeInvitationModel *)self uuidsOfAllowedAccessories];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    v10 = [(HMDOutgoingHomeInvitationModel *)self uuidsOfAllowedAccessories];
    [v3 addObjectsFromArray:v10];
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [(HMDOutgoingHomeInvitationModel *)self operations];
  uint64_t v11 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v16 = [v15 objectForKey:@"HM.user"];

        if (v16)
        {
          v17 = [v15 objectForKeyedSubscript:@"HM.user"];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          v19 = [v15 objectForKeyedSubscript:@"HM.user"];
          if ((isKindOfClass & 1) == 0)
          {
            objc_opt_class();
            char v20 = objc_opt_isKindOfClass();

            if ((v20 & 1) == 0) {
              goto LABEL_18;
            }
            id v21 = objc_alloc(MEMORY[0x263F08C38]);
            v22 = [v15 objectForKeyedSubscript:@"HM.user"];
            v19 = (void *)[v21 initWithUUIDString:v22];
          }
          if (v19)
          {
            [v3 addObject:v19];
          }
        }
LABEL_18:
        v23 = [v15 objectForKey:@"accessory"];

        if (!v23) {
          continue;
        }
        v24 = [v15 objectForKeyedSubscript:@"accessory"];
        objc_opt_class();
        char v25 = objc_opt_isKindOfClass();

        v26 = [v15 objectForKeyedSubscript:@"accessory"];
        if ((v25 & 1) == 0)
        {
          objc_opt_class();
          char v27 = objc_opt_isKindOfClass();

          if ((v27 & 1) == 0) {
            continue;
          }
          id v28 = objc_alloc(MEMORY[0x263F08C38]);
          v29 = [v15 objectForKeyedSubscript:@"accessory"];
          v26 = (void *)[v28 initWithUUIDString:v29];
        }
        if (v26)
        {
          [v3 addObject:v26];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v12);
  }

  return v3;
}

+ (id)properties
{
  if (properties_onceToken_12471 != -1) {
    dispatch_once(&properties_onceToken_12471, &__block_literal_global_12472);
  }
  v2 = (void *)properties__properties_12473;
  return v2;
}

void __44__HMDOutgoingHomeInvitationModel_properties__block_invoke()
{
  v18[15] = *MEMORY[0x263EF8340];
  v17[0] = @"user";
  v16 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v18[0] = v16;
  v17[1] = @"invitationState";
  v15 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v18[1] = v15;
  v17[2] = @"idsInvitationUUID";
  v14 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v18[2] = v14;
  v17[3] = @"dateSent";
  uint64_t v13 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v18[3] = v13;
  v17[4] = @"accessCode";
  uint64_t v12 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v18[4] = v12;
  v17[5] = @"announceAccessLevel";
  uint64_t v11 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v18[5] = v11;
  v17[6] = @"shareToken";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v18[6] = v0;
  v17[7] = @"pendingUserUUID";
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v18[7] = v1;
  v17[8] = @"expiryDate";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v18[8] = v2;
  v17[9] = @"messageIdentifier";
  v3 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v18[9] = v3;
  v17[10] = @"responseReceived";
  v4 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v18[10] = v4;
  v17[11] = @"inviteeDestinationAddress";
  v5 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class() logging:0];
  v18[11] = v5;
  v17[12] = @"operations";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v18[12] = v6;
  v17[13] = @"operationIdentifiers";
  v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v18[13] = v7;
  v17[14] = @"uuidsOfAllowedAccessories";
  v8 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v18[14] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:15];
  v10 = (void *)properties__properties_12473;
  properties__properties_12473 = v9;
}

- (id)rgSettingsFromOutgoingInvitation:(id)a3
{
  id v3 = a3;
  v4 = [HMDRestrictedGuestHomeAccessSettings alloc];
  v5 = [v3 allowedAccessoryUUIDs];
  v6 = [v3 restrictedGuestSchedule];

  v7 = [(HMDRestrictedGuestHomeAccessSettings *)v4 initWithAllowedAccessories:v5 schedule:v6];
  return v7;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"privilege"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"user"])
    {
      uint64_t v11 = [(HMDOutgoingHomeInvitationModel *)self user];

      if (v11)
      {
        uint64_t v12 = [(HMDOutgoingHomeInvitationModel *)self user];
        uint64_t v13 = +[HMDUser userWithDictionary:v12];

        v14 = NSNumber;
        uint64_t v15 = [v13 privilege];
LABEL_13:
        id v20 = [v14 numberWithUnsignedInteger:v15];
LABEL_14:
        id v21 = v20;
LABEL_15:

        goto LABEL_44;
      }
      goto LABEL_24;
    }
    goto LABEL_43;
  }
  if ([v9 isEqualToString:@"announceAccessLevel"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"user"])
    {
      v16 = [(HMDOutgoingHomeInvitationModel *)self user];

      if (v16)
      {
        v17 = [(HMDOutgoingHomeInvitationModel *)self user];
        uint64_t v13 = +[HMDUser userWithDictionary:v17];

        v14 = NSNumber;
        uint64_t v15 = [v13 announceAccessLevel];
        goto LABEL_13;
      }
      goto LABEL_24;
    }
    goto LABEL_43;
  }
  if (![v9 isEqualToString:@"cameraAccessLevel"])
  {
    if ([v9 isEqualToString:@"inviteeUserID"])
    {
      if (![(HMDBackingStoreModelObject *)self propertyWasSet:@"user"]) {
        goto LABEL_43;
      }
      v22 = [(HMDOutgoingHomeInvitationModel *)self user];

      if (v22)
      {
        v23 = [(HMDOutgoingHomeInvitationModel *)self user];
        uint64_t v13 = +[HMDUser userWithDictionary:v23];

        v24 = [v13 accountHandle];
        id v21 = +[HMDUser userIDForAccountHandle:v24];

        goto LABEL_15;
      }
    }
    else
    {
      if (![v9 isEqualToString:@"remoteAccessAllowed"])
      {
        if ([v9 isEqualToString:@"idsIdentifier"])
        {
          if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"idsInvitationUUID"])
          {
            uint64_t v28 = [(HMDOutgoingHomeInvitationModel *)self idsInvitationUUID];
            uint64_t v13 = (void *)v28;
            v29 = (void *)*MEMORY[0x263EFFD08];
            if (v28) {
              v29 = (void *)v28;
            }
            id v20 = v29;
            goto LABEL_14;
          }
          goto LABEL_43;
        }
        if ([v9 isEqualToString:@"shareToken"])
        {
          if (![(HMDBackingStoreModelObject *)self propertyWasSet:@"shareToken"]) {
            goto LABEL_43;
          }
          v30 = objc_opt_class();
          v31 = [(HMDOutgoingHomeInvitationModel *)self shareToken];
          uint64_t v32 = [v30 shareTokenFromKeyedArchiveData:v31];
          long long v33 = (void *)v32;
          long long v34 = (void *)*MEMORY[0x263EFFD08];
          if (v32) {
            long long v34 = (void *)v32;
          }
          id v21 = v34;
        }
        else
        {
          if (![v9 isEqualToString:@"pendingUser"])
          {
            if (![v9 isEqualToString:@"allowedAccessories_"])
            {
              v40.receiver = self;
              v40.super_class = (Class)HMDOutgoingHomeInvitationModel;
              uint64_t v27 = [(HMDBackingStoreModelObject *)&v40 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
              goto LABEL_25;
            }
            if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"uuidsOfAllowedAccessories"])
            {
              uint64_t v42 = 0;
              v43 = &v42;
              uint64_t v44 = 0x3032000000;
              v45 = __Block_byref_object_copy__94718;
              v46 = __Block_byref_object_dispose__94719;
              v36 = (void *)MEMORY[0x263EFF9C0];
              uint64_t v37 = [(HMDOutgoingHomeInvitationModel *)self uuidsOfAllowedAccessories];
              objc_msgSend(v36, "setWithCapacity:", objc_msgSend(v37, "count"));
              id v47 = (id)objc_claimAutoreleasedReturnValue();

              v38 = [(HMDOutgoingHomeInvitationModel *)self uuidsOfAllowedAccessories];
              v41[0] = MEMORY[0x263EF8330];
              v41[1] = 3221225472;
              v41[2] = __99__HMDOutgoingHomeInvitationModel_CoreData__cd_generateValueForProperty_managedObjectField_context___block_invoke;
              v41[3] = &unk_264A23820;
              v41[4] = &v42;
              objc_msgSend(v38, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v41);

              id v21 = (id)v43[5];
              _Block_object_dispose(&v42, 8);

              goto LABEL_44;
            }
            goto LABEL_43;
          }
          if (![(HMDBackingStoreModelObject *)self propertyWasSet:@"pendingUserUUID"]) {
            goto LABEL_43;
          }
          long long v35 = objc_opt_class();
          v31 = [(HMDOutgoingHomeInvitationModel *)self pendingUserUUID];
          objc_msgSend(v35, "cd_getMKFUserFromUUID:", v31);
          id v21 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_44;
      }
      if (![(HMDBackingStoreModelObject *)self propertyWasSet:@"user"]) {
        goto LABEL_43;
      }
      char v25 = [(HMDOutgoingHomeInvitationModel *)self user];

      if (v25)
      {
        v26 = [(HMDOutgoingHomeInvitationModel *)self user];
        uint64_t v13 = +[HMDUser userWithDictionary:v26];

        objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "isRemoteAccessAllowed"));
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
    }
LABEL_24:
    uint64_t v27 = [MEMORY[0x263EFF9D0] null];
LABEL_25:
    id v21 = (id)v27;
    goto LABEL_44;
  }
  if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"user"])
  {
    v18 = [(HMDOutgoingHomeInvitationModel *)self user];

    if (v18)
    {
      v19 = [(HMDOutgoingHomeInvitationModel *)self user];
      uint64_t v13 = +[HMDUser userWithDictionary:v19];

      v14 = NSNumber;
      uint64_t v15 = [v13 camerasAccessLevel];
      goto LABEL_13;
    }
    goto LABEL_24;
  }
LABEL_43:
  id v21 = 0;
LABEL_44:

  return v21;
}

void __99__HMDOutgoingHomeInvitationModel_CoreData__cd_generateValueForProperty_managedObjectField_context___block_invoke(uint64_t a1, void *a2)
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
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"user"])
  {
    uint64_t v11 = [v8 inviteeUserID];
    [v8 privilege];
    uint64_t v12 = v37 = v9;
    uint64_t v35 = [v12 unsignedIntegerValue];
    uint64_t v13 = [v8 remoteAccessAllowed];
    uint64_t v14 = [v13 BOOLValue];
    [v8 cameraAccessLevel];
    uint64_t v15 = v36 = v10;
    uint64_t v16 = [v15 unsignedIntegerValue];
    v17 = [v8 announceAccessLevel];
    uint64_t v18 = [v17 unsignedIntegerValue];
    v19 = [(HMDOutgoingHomeInvitationModel *)self rgSettingsFromOutgoingInvitation:v8];
    id v20 = +[HMDUser userDictionaryWithUserID:v11 privilege:v35 remoteAccessAllowed:v14 cameraAccessLevel:v16 announceAccessAllowed:0 announceAccessLevel:v18 audioAnalysisUserDropInAccessLevel:0 restrictedGuestAccessSettings:v19];

    id v10 = v36;
    id v9 = v37;

    goto LABEL_14;
  }
  if ([v9 isEqualToString:@"idsInvitationUUID"])
  {
    uint64_t v21 = [v8 idsIdentifier];
    v22 = (void *)v21;
    v23 = (void *)*MEMORY[0x263EFFD08];
    if (v21) {
      v23 = (void *)v21;
    }
    id v20 = v23;
LABEL_7:

    goto LABEL_14;
  }
  if (([v9 isEqualToString:@"messageIdentifier"] & 1) != 0
    || ([v9 isEqualToString:@"responseReceived"] & 1) != 0
    || ([v9 isEqualToString:@"inviteeDestinationAddress"] & 1) != 0
    || ([v9 isEqualToString:@"operations"] & 1) != 0
    || ([v9 isEqualToString:@"operationIdentifiers"] & 1) != 0)
  {
    id v20 = 0;
  }
  else if ([v9 isEqualToString:@"shareToken"])
  {
    char v25 = objc_opt_class();
    v26 = [v8 shareToken];
    uint64_t v27 = [v25 keyedArchiveToken:v26];
    uint64_t v28 = (void *)v27;
    v29 = (void *)*MEMORY[0x263EFFD08];
    if (v27) {
      v29 = (void *)v27;
    }
    id v20 = v29;
  }
  else
  {
    if ([v9 isEqualToString:@"pendingUserUUID"])
    {
      v22 = [v8 pendingUser];
      uint64_t v30 = [v22 modelID];
      v31 = (void *)v30;
      uint64_t v32 = (void *)*MEMORY[0x263EFFD08];
      if (v30) {
        uint64_t v32 = (void *)v30;
      }
      id v20 = v32;

      goto LABEL_7;
    }
    if ([v9 isEqualToString:@"uuidsOfAllowedAccessories"])
    {
      long long v33 = [v8 allowedAccessories];

      if (v33) {
        [v8 allowedAccessoryUUIDs];
      }
      else {
      uint64_t v34 = [MEMORY[0x263EFF9D0] null];
      }
    }
    else
    {
      v38.receiver = self;
      v38.super_class = (Class)HMDOutgoingHomeInvitationModel;
      uint64_t v34 = [(HMDBackingStoreModelObject *)&v38 cd_generateValueForModelObjectFromManagedObject:v8 modelObjectField:v9 modelFieldInfo:v10];
    }
    id v20 = (id)v34;
  }
LABEL_14:

  return v20;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)@"home";
}

@end