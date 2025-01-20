@interface HFServiceLikeItemResultFactory
+ (id)populateStandardResultsForHomeKitObject:(id)a3 withBackingAccessory:(id)a4 displayMetadata:(id)a5 readResponse:(id)a6 batteryLevelResults:(id)a7 valueSource:(id)a8 updateOptions:(id)a9;
+ (void)_appendDestinationURLResultsForHomeKitObject:(id)a3 backingAccessory:(id)a4 toResults:(id)a5;
+ (void)_appendSoftwareUpdateResultsForAccessory:(id)a3 toResults:(id)a4;
@end

@implementation HFServiceLikeItemResultFactory

+ (id)populateStandardResultsForHomeKitObject:(id)a3 withBackingAccessory:(id)a4 displayMetadata:(id)a5 readResponse:(id)a6 batteryLevelResults:(id)a7 valueSource:(id)a8 updateOptions:(id)a9
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v75 = a8;
  id v19 = a9;
  v20 = objc_opt_new();
  v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v16, "primaryState"));
  [v20 setObject:v21 forKeyedSubscript:@"state"];

  if ([v16 transitioningPrimaryState])
  {
    v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v16, "transitioningPrimaryState"));
    [v20 setObject:v22 forKeyedSubscript:@"transitioningState"];
  }
  v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v16, "priority"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v23);

  v24 = [v16 sortKey];
  objc_msgSend(v20, "na_safeSetObject:forKey:", v24, @"sortKey");

  v74 = v19;
  v25 = [v19 objectForKeyedSubscript:HFItemUpdateOptionFastInitialUpdate];
  if ([v25 BOOLValue])
  {

    goto LABEL_26;
  }
  BOOL v26 = +[HFUtilities shouldSuppressAllErrorsForDemo];

  if (!v26)
  {
    v27 = objc_opt_new();
    v28 = [HFSymptomResultContextProvider alloc];
    objc_opt_class();
    id v71 = v14;
    id v29 = v14;
    if (objc_opt_isKindOfClass()) {
      v30 = v29;
    }
    else {
      v30 = 0;
    }
    id v31 = v30;
    id v70 = v29;

    v72 = [(HFSymptomResultContextProvider *)v28 initWithAccessory:v15 mediaSystem:v31];
    v32 = [v16 error];

    if (v32)
    {
      v33 = [v16 error];
      [v20 setObject:v33 forKeyedSubscript:@"underlyingError"];

      v34 = [v16 error];
      v35 = +[HFErrorResultComponent componentForDisplayError:v34 symptomContextProvider:v72];

      if (v35)
      {
        v36 = HFLogForCategory(0x2AuLL);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v69 = [v16 error];
          v68 = [v17 allFailedReadResponses];
          *(_DWORD *)buf = 138413058;
          v77 = v69;
          __int16 v78 = 2112;
          v79 = v35;
          __int16 v80 = 2112;
          id v81 = v29;
          __int16 v82 = 2112;
          v83 = v68;
          _os_log_error_impl(&dword_20B986000, v36, OS_LOG_TYPE_ERROR, "Displaying error %@ as %@ for %@ read errors %@", buf, 0x2Au);
        }
        [v27 addObject:v35];
      }
    }
    v37 = [v17 allCharacteristics];
    v38 = +[HFErrorResultComponent componentForWriteErrorForCharacteristics:v37 valueSource:v75];
    objc_msgSend(v27, "na_safeAddObject:", v38);

    v39 = +[HFErrorResultComponent componentForAccessoryReprovisionState:](HFErrorResultComponent, "componentForAccessoryReprovisionState:", [v15 accessoryReprovisionState]);
    objc_msgSend(v27, "na_safeAddObject:", v39);

    if ([v27 count])
    {
      v40 = +[HFItemResultComponent combinedResultsForComponents:v27];
      [v20 addEntriesFromDictionary:v40];
    }
    v41 = [v74 objectForKeyedSubscript:HFItemUpdateOptionFastInitialUpdate];
    if ([v41 BOOLValue])
    {

      id v14 = v71;
    }
    else
    {
      v42 = [v16 error];
      v43 = [v42 underlyingError];
      int v44 = objc_msgSend(v43, "na_isCancelledError");

      id v14 = v71;
      if (!v44)
      {
LABEL_21:
        v45 = [v20 objectForKeyedSubscript:@"errorDescription"];
        objc_msgSend(v20, "na_safeSetObject:forKey:", v45, @"description");

        if ([v27 count])
        {
          v46 = HFLogForCategory(0x2AuLL);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v77 = v70;
            __int16 v78 = 2112;
            v79 = v20;
            _os_log_error_impl(&dword_20B986000, v46, OS_LOG_TYPE_ERROR, "Added HFErrorResultComponent to results for object %@: %@", buf, 0x16u);
          }
        }
        goto LABEL_26;
      }
    }
    [v20 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"readsSkipped"];
    goto LABEL_21;
  }
LABEL_26:
  if ([v16 primaryState]) {
    goto LABEL_32;
  }
  v47 = [v20 objectForKeyedSubscript:@"errorDescription"];
  if (v47) {
    goto LABEL_28;
  }
  if (!+[HFUtilities shouldSuppressAllErrorsForDemo])
  {
    v48 = _HFLocalizedStringWithDefaultValue(@"HFServiceDescriptionUpdating", @"HFServiceDescriptionUpdating", 1);
    [v20 setObject:v48 forKeyedSubscript:@"description"];

    if (objc_msgSend(v15, "hf_isSuspended"))
    {
      v47 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicValuePowerStateOff", @"HFCharacteristicValuePowerStateOff", 1);
      [v20 setObject:v47 forKeyedSubscript:@"description"];
LABEL_28:
    }
  }
LABEL_32:
  v49 = [v17 allCharacteristics];
  v50 = (void *)[v49 mutableCopy];

  v51 = objc_msgSend(v15, "hf_softwareUpdateDependentObjects");
  [v50 unionSet:v51];

  v52 = [v18 objectForKeyedSubscript:@"dependentHomeKitObjects"];
  [v50 unionSet:v52];

  if ([v50 count]) {
    [v20 setObject:v50 forKeyedSubscript:@"dependentHomeKitObjects"];
  }
  if ([v15 supportsSoftwareUpdateV2]) {
    [v20 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hasSoftwareUpdateV2Dependency"];
  }
  [v20 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"remoteAccessDependency"];

  v53 = [v18 objectForKeyedSubscript:@"batteryLow"];
  if ([v53 BOOLValue])
  {
    BOOL v54 = +[HFUtilities shouldSuppressAllErrorsForDemo];

    if (!v54)
    {
      v55 = [v20 objectForKeyedSubscript:@"longErrorDescription"];

      if (!v55)
      {
        v56 = _HFLocalizedStringWithDefaultValue(@"HFServiceDescriptionBatteryLow", @"HFServiceDescriptionBatteryLow", 1);
        [v20 setObject:v56 forKeyedSubscript:@"longErrorDescription"];
      }
      [v20 setObject:&unk_26C0F6DC8 forKeyedSubscript:@"badge"];
      [v20 setObject:&unk_26C0F6DE0 forKeyedSubscript:@"descriptionBadge"];
      [v20 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"lowBattery"];
      objc_msgSend(v20, "hf_setMinimumDisplayPriority:", 1);
    }
  }
  else
  {
  }
  if ([v15 certificationStatus] == 1
    && !+[HFUtilities shouldSuppressAllErrorsForDemo])
  {
    v57 = _HFLocalizedStringWithDefaultValue(@"HFServiceLongFormPersistentWarningHomeKitUncertified", @"HFServiceLongFormPersistentWarningHomeKitUncertified", 1);
    [v20 setObject:v57 forKeyedSubscript:@"persistentWarningDescription"];

    v58 = [v15 services];
    int v59 = objc_msgSend(v58, "na_any:", &__block_literal_global_118_0);

    if (v59)
    {
      if (_os_feature_enabled_impl())
      {
        v60 = _HFLocalizedStringWithDefaultValue(@"HFServiceLongFormPersistentWarningHomeKitUncertified_Lock", @"HFServiceLongFormPersistentWarningHomeKitUncertified_Lock", 1);
        [v20 setObject:v60 forKeyedSubscript:@"persistentWarningDescription"];
      }
    }
  }
  [a1 _appendSoftwareUpdateResultsForAccessory:v15 toResults:v20];
  [a1 _appendDestinationURLResultsForHomeKitObject:v14 backingAccessory:v15 toResults:v20];
  v61 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v15, "supportsIdentify"));
  [v20 setObject:v61 forKeyedSubscript:@"isIdentifiable"];

  v62 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "suspendedState"));
  [v20 setObject:v62 forKeyedSubscript:@"suspendedState"];

  v63 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "hf_canSyncExternalSettings") ^ 1);
  [v20 setObject:v63 forKeyedSubscript:@"externalSettingIsDisabled"];

  v64 = [v20 objectForKeyedSubscript:@"priority"];
  uint64_t v65 = [v64 integerValue];

  v66 = [NSNumber numberWithUnsignedInteger:v65 > 0];
  [v20 setObject:v66 forKeyedSubscript:@"descriptionStyle"];

  return v20;
}

+ (void)_appendSoftwareUpdateResultsForAccessory:(id)a3 toResults:(id)a4
{
  id v14 = a3;
  id v5 = a4;
  int v6 = [v14 isFirmwareUpdateAvailable];
  v7 = [v14 home];
  v8 = v7;
  if (v6)
  {
    char v9 = objc_msgSend(v7, "hf_currentUserIsRestrictedGuest");

    if ((v9 & 1) == 0)
    {
      v10 = _HFLocalizedStringWithDefaultValue(@"HFServiceDetailedControlDescriptionFirmwareUpdateAvailable", @"HFServiceDetailedControlDescriptionFirmwareUpdateAvailable", 1);
      [v5 setObject:v10 forKeyedSubscript:@"detailedControlDescription"];

      [v5 setObject:&unk_26C0F6DF8 forKeyedSubscript:@"badge"];
      [v5 setObject:&unk_26C0F6DC8 forKeyedSubscript:@"descriptionBadge"];
    }
    goto LABEL_16;
  }
  if (!objc_msgSend(v7, "hf_currentUserIsOwner"))
  {
LABEL_15:

    goto LABEL_16;
  }
  int v11 = objc_msgSend(v14, "hf_softwareUpdatePossessesNecessaryDocumentation");

  if (!v11) {
    goto LABEL_16;
  }
  if (objc_msgSend(v14, "hf_isReadyToInstallSoftwareUpdate")
    && [v14 isControllable])
  {
    [v5 setObject:&unk_26C0F6DF8 forKeyedSubscript:@"badge"];
    [v5 setObject:&unk_26C0F6DC8 forKeyedSubscript:@"descriptionBadge"];
    v12 = _HFLocalizedStringWithDefaultValue(@"HFServiceDetailedControlDescriptionSoftwareUpdateAvailable", @"HFServiceDetailedControlDescriptionSoftwareUpdateAvailable", 1);
    [v5 setObject:v12 forKeyedSubscript:@"detailedControlDescription"];
  }
  if (objc_msgSend(v14, "hf_isInstallingSoftwareUpdate"))
  {
    v13 = @"HFFirmwareUpdateInstallingDescription";
  }
  else
  {
    if (!objc_msgSend(v14, "hf_isDownloadingSoftwareUpdate")) {
      goto LABEL_16;
    }
    v13 = @"HFFirmwareUpdateDownloadingDescription";
  }
  v8 = _HFLocalizedStringWithDefaultValue(v13, v13, 1);
  if (v8)
  {
    [v5 setObject:v8 forKeyedSubscript:@"description"];
    [v5 setObject:v8 forKeyedSubscript:@"detailedControlDescription"];
    goto LABEL_15;
  }
LABEL_16:
}

+ (void)_appendDestinationURLResultsForHomeKitObject:(id)a3 backingAccessory:(id)a4 toResults:(id)a5
{
  id v13 = a3;
  id v7 = a5;
  v8 = [a4 uniqueIdentifier];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = 7;
LABEL_5:
    uint64_t v10 = [v13 uniqueIdentifier];

    v8 = (void *)v10;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = 5;
    goto LABEL_5;
  }
  uint64_t v9 = 4;
LABEL_7:
  int v11 = +[HFURLComponents homeKitObjectURLForDestination:v9 secondaryDestination:2 UUID:v8];
  [v7 setObject:v11 forKeyedSubscript:@"alternateQuickControlURL"];

  v12 = +[HFURLComponents homeKitObjectURLForDestination:v9 secondaryDestination:1 UUID:v8];
  [v7 setObject:v12 forKeyedSubscript:@"itemDetailsURL"];
}

uint64_t __170__HFServiceLikeItemResultFactory_populateStandardResultsForHomeKitObject_withBackingAccessory_displayMetadata_readResponse_batteryLevelResults_valueSource_updateOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0D798]];

  return v3;
}

@end