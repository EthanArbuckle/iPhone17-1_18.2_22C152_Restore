@interface MCRestrictionManager
+ (BOOL)BOOLSetting:(id)a3 valueChangedBetweenOldSettings:(id)a4 andNewSettings:(id)a5;
+ (BOOL)intersectedValuesForFeature:(id)a3 changedBetweenOldRestrictions:(id)a4 andNewRestrictions:(id)a5;
+ (BOOL)intersectedValuesSetting:(id)a3 valueChangedBetweenOldSettings:(id)a4 andNewSettings:(id)a5;
+ (BOOL)isInSingleAppModeWithSettingsDictionary:(id)a3;
+ (BOOL)isPasscodeRequiredToAccessWhitelistedAppsWithSettingsDictionary:(id)a3;
+ (BOOL)isSingleAppModeLogoutAllowedWithSettingsDictionary:(id)a3;
+ (BOOL)isWebContentFilterUIActiveWithRestrictionDictionary:(id)a3;
+ (BOOL)isWhitelistedAppsRestrictionEnforcedWithRestrictionsDictionary:(id)a3;
+ (BOOL)mayChangePasscode;
+ (BOOL)mayEnterPasscodeToAccessNonWhitelistedAppsWithSettingsDictionary:(id)a3;
+ (BOOL)restrictedBool:(id)a3 changedBetweenOldRestrictions:(id)a4 andNewRestrictions:(id)a5;
+ (BOOL)restrictedValue:(id)a3 changedBetweenOldRestrictions:(id)a4 andNewRestrictions:(id)a5;
+ (BOOL)unionValuesForFeature:(id)a3 changedBetweenOldRestrictions:(id)a4 andNewRestrictions:(id)a5;
+ (BOOL)unionValuesSetting:(id)a3 valueChangedBetweenOldSettings:(id)a4 andNewSettings:(id)a5;
+ (BOOL)valueSetting:(id)a3 valueChangedBetweenOldSettings:(id)a4 andNewSettings:(id)a5;
+ (id)_addRestrictionPayloadKeysDictionary:(id)a3 toRestrictionPayloadKeysDictionary:(id)a4 forRestrictionKey:(id)a5;
+ (id)_filterRestrictionDictionary:(id)a3 removingPayloadKeysInRestrictionPayloadKeysDictionary:(id)a4 forRestrictionKey:(id)a5;
+ (id)_filterRestrictionPayloadKeysDictionary:(id)a3 removingPayloadKeysInRestrictionPayloadKeysDictionary:(id)a4 forRestrictionKey:(id)a5;
+ (id)_lockedDownRestrictionPayloadKeysWithPayloadKeysDictionary:(id)a3 forRestrictionKey:(id)a4;
+ (id)_payloadKeysDictionaryAfterAddingFeature:(id)a3 toRestrictionPayloadKeysDictionary:(id)a4 forRestrictionKey:(id)a5;
+ (id)addRestrictionPayloadKeysDictionary:(id)a3 toRestrictionPayloadKeysDictionary:(id)a4;
+ (id)allowedGrandfatheredRestrictionPayloadKeysDictionary;
+ (id)allowedImportFromAppBundleIDsWithOriginalAppBundleIDs:(id)a3 managedAppBundleIDs:(id)a4 localAppBundleID:(id)a5 localAccountIsManaged:(BOOL)a6 mayOpenFromUnmanagedToManaged:(BOOL)a7 mayOpenFromManagedToUnmanaged:(BOOL)a8 isAppBundleIDExemptBlock:(id)a9 isAppBundleIDAccountBasedBlock:(id)a10;
+ (id)allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:(id)a3 managedAppBundleIDs:(id)a4 hostAppIsManaged:(BOOL)a5 mayOpenFromUnmanagedToManaged:(BOOL)a6 mayOpenFromManagedToUnmanaged:(BOOL)a7;
+ (id)allowedOpenInAppBundleIDsWithOriginalAppBundleIDs:(id)a3 managedAppBundleIDs:(id)a4 localAppBundleID:(id)a5 localAccountIsManaged:(BOOL)a6 mayOpenFromUnmanagedToManaged:(BOOL)a7 mayOpenFromManagedToUnmanaged:(BOOL)a8 isAppBundleIDExemptBlock:(id)a9 isAppBundleIDAccountBasedBlock:(id)a10;
+ (id)applyRestrictions:(id)a3 forFeature:(id)a4 toParametersForBoolSetting:(id)a5;
+ (id)defaultIntersectedValuesForSetting:(id)a3;
+ (id)defaultParametersForBoolSetting:(id)a3;
+ (id)defaultParametersForIntersectedValuesSetting:(id)a3;
+ (id)defaultParametersForUnionValuesSetting:(id)a3;
+ (id)defaultParametersForValueSetting:(id)a3;
+ (id)defaultRestrictionFilePath;
+ (id)defaultSettings;
+ (id)defaultUnionValuesForSetting:(id)a3;
+ (id)defaultValueForSetting:(id)a3;
+ (id)effectiveGrandfatheredRestrictionPayloadKeysDictionary;
+ (id)explicitlyRestrictedAppsBySetting;
+ (id)explicitlyRestrictedEphemeralMultiUserApps;
+ (id)filterGrandfatheredRestrictionsIfNeededFromRestrictions:(id)a3;
+ (id)filterRestrictionDictionary:(id)a3 acceptedKeysDict:(id)a4;
+ (id)filterRestrictionDictionary:(id)a3 removingPayloadKeysInRestrictionPayloadKeysDictionary:(id)a4;
+ (id)filterRestrictionDictionary:(id)a3 toIncludeOnlyRestrictionsThatDifferFromRestrictions:(id)a4;
+ (id)filterRestrictionDictionaryForPublicUse:(id)a3;
+ (id)filterRestrictionPayloadKeysDictionary:(id)a3 removingPayloadKeysInRestrictionPayloadKeysDictionary:(id)a4;
+ (id)filterUserSettingsForPublicUse:(id)a3;
+ (id)grandfatheredRestrictionPayloadKeysDictionary;
+ (id)intersectedValuesForFeature:(id)a3 withRestrictionsDictionary:(id)a4;
+ (id)intersectedValuesSettingForFeature:(id)a3 withUserSettingDectionary:(id)a4;
+ (id)maximumValueForSetting:(id)a3;
+ (id)minimumValueForSetting:(id)a3;
+ (id)newEffectiveSettingsByApplyingRestrictions:(id)a3 toSettings:(id)a4;
+ (id)objectForFeature:(id)a3 withRestrictionsDictionary:(id)a4;
+ (id)parametersForBoolSetting:(id)a3 withUserSettingDictionary:(id)a4;
+ (id)parametersForIntersectedSetting:(id)a3 withUserSettingDictionary:(id)a4;
+ (id)parametersForSetting:(id)a3 ofType:(id)a4 withUserSettingDictionary:(id)a5;
+ (id)parametersForUnionSetting:(id)a3 withUserSettingDictionary:(id)a4;
+ (id)parametersForValueSetting:(id)a3 withUserSettingDictionary:(id)a4;
+ (id)restrictionKeys;
+ (id)restrictionsAfterApplyingRestrictionsDictionary:(id)a3 toRestrictionsDictionary:(id)a4 outChangeDetected:(BOOL *)a5 outError:(id *)a6;
+ (id)restrictionsWithCurrentRestrictions:(id)a3 defaultRestrictions:(id)a4 systemProfileRestrictions:(id)a5 userProfileRestrictions:(id)a6 systemClientRestrictions:(id)a7 userClientRestrictions:(id)a8 outRestrictionsChanged:(BOOL *)a9 outError:(id *)a10;
+ (id)sharedManager;
+ (id)systemMetadataValueForKey:(id)a3;
+ (id)unionValuesForFeature:(id)a3 withRestrictionsDictionary:(id)a4;
+ (id)unionValuesSettingForFeature:(id)a3 withUserSettingDictionary:(id)a4;
+ (id)valueForFeature:(id)a3 withRestrictionsDictionary:(id)a4;
+ (id)valueSettingForFeature:(id)a3 withUserSettingDictionary:(id)a4;
+ (int)BOOLSettingForFeature:(id)a3 outAsk:(BOOL *)a4 withUserSettingDictionary:(id)a5;
+ (int)BOOLSettingForFeature:(id)a3 withNewUserSetting:(id)a4 currentSettings:(id)a5;
+ (int)BOOLSettingForFeature:(id)a3 withUserSettingDictionary:(id)a4;
+ (int)appWhitelistStateWithSettingsDictionary:(id)a3 restrictionsDictionary:(id)a4;
+ (int)defaultBoolValueForSetting:(id)a3;
+ (int)defaultBoolValueForSetting:(id)a3 outAsk:(BOOL *)a4;
+ (int)restrictedBoolForFeature:(id)a3 withRestrictionsDictionary:(id)a4;
- (BOOL)_isBoolSettingLockedDown:(id)a3;
- (BOOL)_isValueSettingLockedDown:(id)a3 effectiveSetting:(id)a4;
- (BOOL)allowedToRunAppWithBundleID:(id)a3;
- (BOOL)applyConfiguration:(id)a3 toDomain:(unint64_t)a4 inNamespace:(id)a5 fromSender:(id)a6;
- (BOOL)isBoolSettingLockedDownByRestrictions:(id)a3;
- (BOOL)isInSingleAppMode;
- (BOOL)isIntersectionSettingLockedDownByRestrictions:(id)a3;
- (BOOL)isSettingLockedDownByRestrictions:(id)a3;
- (BOOL)isSingleAppModeLogoutAllowed;
- (BOOL)isUnionSettingLockedDownByRestrictions:(id)a3;
- (BOOL)isValueSettingLockedDownByRestrictions:(id)a3;
- (MCRestrictionManager)init;
- (NSArray)memberQueueEffectiveWhitelistedAppsAndOptions;
- (NSDictionary)combinedProfileRestrictions;
- (NSDictionary)currentRestrictions;
- (NSDictionary)defaultRestrictions;
- (NSDictionary)defaultSettings;
- (NSDictionary)effectiveUserSettings;
- (NSDictionary)systemProfileRestrictions;
- (NSDictionary)systemUserSettings;
- (NSDictionary)userProfileRestrictions;
- (NSDictionary)userUserSettings;
- (NSMutableDictionary)memberQueueCombinedProfileRestrictions;
- (NSMutableDictionary)memberQueueCombinedSystemProfileRestrictions;
- (NSMutableDictionary)memberQueueEffectiveUserSettings;
- (NSMutableDictionary)memberQueueRestrictions;
- (NSMutableDictionary)memberQueueSettingsEvents;
- (NSMutableDictionary)memberQueueSystemClientRestrictions;
- (NSMutableDictionary)memberQueueSystemNamespacedUserSettings;
- (NSMutableDictionary)memberQueueSystemProfileRestrictions;
- (NSMutableDictionary)memberQueueSystemUserSettings;
- (NSMutableDictionary)memberQueueUserClientRestrictions;
- (NSMutableDictionary)memberQueueUserNamespacedUserSettings;
- (NSMutableDictionary)memberQueueUserProfileRestrictions;
- (NSMutableDictionary)memberQueueUserUserSettings;
- (NSString)memberQueueOverridingRestrictionClientUUID;
- (OS_dispatch_queue)memberQueue;
- (id)_effectiveIntersectedValuesForSetting:(id)a3 effectiveUserSettings:(id)a4;
- (id)_effectiveUnionValuesForSetting:(id)a3 effectiveUserSettings:(id)a4;
- (id)_settingsEventFromProcess:(id)a3 withTag:(id)a4;
- (id)_updatedDomainSettingsEvents:(id)a3 fromPreviousSettings:(id)a4 toNewSettings:(id)a5 sender:(id)a6;
- (id)allClientUUIDsForClientType:(id)a3;
- (id)appsAndOptionsForClientUUID:(id)a3;
- (id)clientRestrictionsForClientUUID:(id)a3;
- (id)description;
- (id)effectiveBlockedAppBundleIDsExcludingRemovedSystemApps:(BOOL)a3;
- (id)effectiveIntersectedValuesForSetting:(id)a3;
- (id)effectiveParametersForBoolSetting:(id)a3;
- (id)effectiveParametersForBoolSetting:(id)a3 configurationUUID:(id)a4;
- (id)effectiveParametersForIntersectedSetting:(id)a3;
- (id)effectiveParametersForUnionSetting:(id)a3;
- (id)effectiveParametersForValueSetting:(id)a3;
- (id)effectiveUnionValuesForSetting:(id)a3;
- (id)effectiveValueForSetting:(id)a3;
- (id)effectiveWhitelistedAppBundleIDs;
- (id)effectiveWhitelistedAppsAndOptions;
- (id)exchangeUUIDsRestrictingSettings:(id)a3;
- (id)intersectedValuesForFeature:(id)a3;
- (id)intersectedValuesSettingForFeature:(id)a3;
- (id)memberQueueAppsAndOptionsForClientUUID:(id)a3;
- (id)memberQueueClientRestrictionsDictionaryForClientUUID:(id)a3;
- (id)memberQueueClientRestrictionsForClientUUID:(id)a3;
- (id)memberQueueClientTypeForClientUUID:(id)a3;
- (id)memberQueueUserInfoForClientUUID:(id)a3;
- (id)objectForFeature:(id)a3;
- (id)parentalControlsBlockedAppBundleIDs;
- (id)parentalControlsWhitelistedAppBundleIDs;
- (id)potentialRestrictionsAfterApplyingRestrictionsDictionary:(id)a3 outChangeDetected:(BOOL *)a4 outError:(id *)a5;
- (id)profileIdentifiersRestrictingSettings:(id)a3;
- (id)restrictedAppBundleIDs;
- (id)restrictedAppBundleIDsExcludingRemovedSystemApps:(BOOL)a3;
- (id)restrictionEnforcedBlockedAppBundleIDsExcludingRemovedSystemApps:(BOOL)a3;
- (id)restrictionEnforcedWhitelistedAppBundleIDs;
- (id)singleAppModeBundleID;
- (id)systemClientRestrictions;
- (id)unionValuesForFeature:(id)a3;
- (id)unionValuesSettingForFeature:(id)a3;
- (id)userClientRestrictions;
- (id)userInfoForClientUUID:(id)a3;
- (id)valueForFeature:(id)a3;
- (id)valueSettingForFeature:(id)a3;
- (int)BOOLSettingForFeature:(id)a3;
- (int)appWhitelistState;
- (int)effectiveRestrictedBoolForSetting:(id)a3;
- (int)effectiveRestrictedBoolForSetting:(id)a3 configurationUUID:(id)a4;
- (int)restrictedBoolForFeature:(id)a3;
- (void)clearEffectiveWhitelistedAppsAndOptionsCache;
- (void)invalidateRestrictions;
- (void)invalidateSettings;
- (void)setMemberQueue:(id)a3;
- (void)setMemberQueueEffectiveUserSettings:(id)a3;
- (void)setMemberQueueEffectiveWhitelistedAppsAndOptions:(id)a3;
- (void)setMemberQueueOverridingRestrictionClientUUID:(id)a3;
- (void)setMemberQueueRestrictions:(id)a3;
- (void)setMemberQueueSettingsEvents:(id)a3;
- (void)setMemberQueueSystemClientRestrictions:(id)a3;
- (void)setMemberQueueSystemNamespacedUserSettings:(id)a3;
- (void)setMemberQueueSystemProfileRestrictions:(id)a3;
- (void)setMemberQueueSystemUserSettings:(id)a3;
- (void)setMemberQueueUserClientRestrictions:(id)a3;
- (void)setMemberQueueUserNamespacedUserSettings:(id)a3;
- (void)setMemberQueueUserProfileRestrictions:(id)a3;
- (void)setMemberQueueUserUserSettings:(id)a3;
@end

@implementation MCRestrictionManager

- (void)setMemberQueueEffectiveUserSettings:(id)a3
{
}

uint64_t __45__MCRestrictionManager_effectiveUserSettings__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) memberQueueEffectiveUserSettings];
  return MEMORY[0x1F41817F8]();
}

uint64_t __42__MCRestrictionManager_invalidateSettings__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setMemberQueueSystemUserSettings:0];
  [*(id *)(a1 + 32) setMemberQueueSystemNamespacedUserSettings:0];
  [*(id *)(a1 + 32) setMemberQueueUserUserSettings:0];
  [*(id *)(a1 + 32) setMemberQueueUserNamespacedUserSettings:0];
  v2 = *(void **)(a1 + 32);
  return [v2 setMemberQueueEffectiveUserSettings:0];
}

- (void)setMemberQueueUserUserSettings:(id)a3
{
}

- (void)setMemberQueueUserNamespacedUserSettings:(id)a3
{
}

- (void)setMemberQueueSystemUserSettings:(id)a3
{
}

- (void)setMemberQueueSystemNamespacedUserSettings:(id)a3
{
}

+ (id)newEffectiveSettingsByApplyingRestrictions:(id)a3 toSettings:(id)a4
{
  uint64_t v156 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = 0x1E4F1C000uLL;
  v9 = [MEMORY[0x1E4F1CA60] dictionary];
  v104 = v7;
  v10 = [v7 objectForKeyedSubscript:@"restrictedBool"];
  v11 = (void *)[v10 mutableCopy];

  v107 = v6;
  v103 = v9;
  if (v11)
  {
    long long v148 = 0u;
    long long v149 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    v12 = [v6 objectForKeyedSubscript:@"restrictedBool"];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v146 objects:v155 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v147;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v147 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v146 + 1) + 8 * i);
          v18 = [v11 objectForKeyedSubscript:v17];
          v19 = [a1 applyRestrictions:v6 forFeature:v17 toParametersForBoolSetting:v18];
          [v11 setObject:v19 forKeyedSubscript:v17];

          id v6 = v107;
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v146 objects:v155 count:16];
      }
      while (v14);
    }

    [v103 setObject:v11 forKey:@"restrictedBool"];
    unint64_t v8 = 0x1E4F1C000;
  }
  else
  {
    v20 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A13F0000, v20, OS_LOG_TYPE_ERROR, "settings dictionary missing BOOLean restrictions (restrictedBool)", buf, 2u);
    }
    v21 = [MEMORY[0x1E4F1CA60] dictionary];
    [v9 setObject:v21 forKey:@"restrictedBool"];
  }
  v110 = [v6 objectForKey:@"restrictedValue"];
  v22 = [v104 objectForKey:@"restrictedValue"];
  v109 = [*(id *)(v8 + 2656) dictionary];
  long long v141 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  obuint64_t j = v22;
  uint64_t v113 = [obj countByEnumeratingWithState:&v141 objects:v154 count:16];
  if (v113)
  {
    uint64_t v108 = *(void *)v142;
    do
    {
      for (uint64_t j = 0; j != v113; ++j)
      {
        if (*(void *)v142 != v108) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v141 + 1) + 8 * j);
        v25 = [obj objectForKey:v24];
        uint64_t v117 = v24;
        v26 = [v110 objectForKey:v24];
        v27 = [v25 objectForKey:@"value"];
        v28 = [v25 objectForKey:@"rangeMinimum"];
        id v29 = [v25 objectForKey:@"rangeMaximum"];
        id v30 = v28;
        id v31 = v27;
        id v32 = v31;
        id v33 = v30;
        id v34 = v29;
        if (v26)
        {
          v35 = [v26 objectForKey:@"value"];
          v36 = [v26 objectForKey:@"preferSmallerValues"];
          if (v35) {
            BOOL v37 = v36 == 0;
          }
          else {
            BOOL v37 = 1;
          }
          id v32 = v31;
          id v33 = v30;
          id v34 = v29;
          if (v37) {
            goto LABEL_43;
          }
          id v106 = v36;
          int v38 = [v36 BOOLValue];
          id v34 = v35;
          if (v38)
          {

            if (!v29 || [v29 compare:v34] != -1)
            {
              if (v30) {
                goto LABEL_27;
              }
LABEL_41:
              id v33 = 0;
              id v32 = v31;
LABEL_42:
              v36 = v106;
LABEL_43:

              goto LABEL_44;
            }
            id v44 = v29;

            id v34 = v44;
            if (!v30) {
              goto LABEL_41;
            }
LABEL_27:
            v105 = v35;
            uint64_t v39 = [v30 compare:v34];
            v40 = v30;
            id v33 = v30;
            v41 = v34;
            if (v39 == 1)
            {
LABEL_28:
              id v33 = v40;

              v41 = v33;
            }
          }
          else
          {

            if (v30 && [v30 compare:v34] == 1)
            {
              id v42 = v30;

              id v34 = v42;
            }
            if (!v29)
            {
              id v32 = v31;
              id v33 = v34;
              id v34 = 0;
              goto LABEL_42;
            }
            v105 = v35;
            uint64_t v43 = [v29 compare:v34];
            v40 = v29;
            id v33 = v34;
            v41 = v29;
            if (v43 == -1) {
              goto LABEL_28;
            }
          }
          if ([v41 compare:v33] == 1)
          {
            id v32 = v31;
            id v34 = v41;
          }
          else
          {
            id v32 = v41;

            id v34 = v32;
          }
          v35 = v105;
          goto LABEL_42;
        }
LABEL_44:
        if (v34) {
          BOOL v45 = v32 == 0;
        }
        else {
          BOOL v45 = 1;
        }
        if (!v45 && [v34 compare:v32] == -1)
        {
          id v46 = v34;

          id v32 = v46;
        }
        if (v33) {
          BOOL v47 = v32 == 0;
        }
        else {
          BOOL v47 = 1;
        }
        if (!v47 && [v33 compare:v32] == 1)
        {
          id v48 = v33;

          id v32 = v48;
        }
        id v49 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v49 MCSetObjectIfNotNil:v34 forKey:@"rangeMaximum"];
        [v49 MCSetObjectIfNotNil:v33 forKey:@"rangeMinimum"];
        [v49 MCSetObjectIfNotNil:v32 forKey:@"value"];
        [v109 setObject:v49 forKey:v117];
      }
      uint64_t v113 = [obj countByEnumeratingWithState:&v141 objects:v154 count:16];
    }
    while (v113);
  }

  [v103 setObject:v109 forKey:@"restrictedValue"];
  v50 = [v107 objectForKey:@"intersection"];
  v51 = [v104 objectForKey:@"intersection"];
  v121 = [MEMORY[0x1E4F1CA60] dictionary];
  v123 = v50;
  v52 = [v50 allKeys];
  v118 = (void *)[v52 mutableCopy];

  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id v53 = v51;
  v111 = v53;
  uint64_t v119 = [v53 countByEnumeratingWithState:&v137 objects:v153 count:16];
  if (v119)
  {
    id obja = *(id *)v138;
    do
    {
      for (uint64_t k = 0; k != v119; ++k)
      {
        if (*(id *)v138 != obja) {
          objc_enumerationMutation(v53);
        }
        uint64_t v55 = *(void *)(*((void *)&v137 + 1) + 8 * k);
        v56 = [v53 objectForKey:v55];
        v57 = (void *)[v56 mutableCopy];

        v58 = [v57 objectForKey:@"values"];
        v59 = [v123 objectForKey:v55];
        v60 = [v59 objectForKey:@"values"];
        if (v60)
        {
          v61 = [v59 objectForKey:@"overrideUserSettings"];
          int v62 = [v61 BOOLValue];

          if (v62)
          {
            [v57 setObject:v60 forKey:@"values"];
          }
          else
          {
            if (v58)
            {
              v63 = [MEMORY[0x1E4F1CAD0] setWithArray:v60];
              v64 = [MEMORY[0x1E4F1CA80] setWithArray:v58];
              [v64 intersectSet:v63];
              v65 = [v64 allObjects];
              [v57 setObject:v65 forKey:@"values"];
            }
            else
            {
              v66 = (void *)[v60 copy];
              [v57 setObject:v66 forKey:@"values"];
            }
            id v53 = v111;
          }
        }
        [v121 setObject:v57 forKey:v55];
        [v118 removeObject:v55];
      }
      uint64_t v119 = [v53 countByEnumeratingWithState:&v137 objects:v153 count:16];
    }
    while (v119);
  }

  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id v67 = v118;
  uint64_t v68 = [v67 countByEnumeratingWithState:&v133 objects:v152 count:16];
  if (v68)
  {
    uint64_t v69 = v68;
    uint64_t v70 = *(void *)v134;
    do
    {
      for (uint64_t m = 0; m != v69; ++m)
      {
        if (*(void *)v134 != v70) {
          objc_enumerationMutation(v67);
        }
        uint64_t v72 = *(void *)(*((void *)&v133 + 1) + 8 * m);
        v73 = [v123 objectForKey:v72];
        [v121 setObject:v73 forKey:v72];
      }
      uint64_t v69 = [v67 countByEnumeratingWithState:&v133 objects:v152 count:16];
    }
    while (v69);
  }

  [v103 setObject:v121 forKey:@"intersection"];
  v74 = [v107 objectForKeyedSubscript:@"union"];
  v75 = [v104 objectForKeyedSubscript:@"union"];
  v76 = v74;
  v124 = [MEMORY[0x1E4F1CA60] dictionary];
  v77 = [v74 allKeys];
  v78 = (void *)[v77 mutableCopy];

  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  id v79 = v75;
  v114 = v79;
  uint64_t v122 = [v79 countByEnumeratingWithState:&v129 objects:v151 count:16];
  if (v122)
  {
    uint64_t v80 = *(void *)v130;
    v120 = v76;
    uint64_t v112 = *(void *)v130;
    do
    {
      for (uint64_t n = 0; n != v122; ++n)
      {
        if (*(void *)v130 != v80) {
          objc_enumerationMutation(v79);
        }
        uint64_t v82 = *(void *)(*((void *)&v129 + 1) + 8 * n);
        v83 = [v79 objectForKeyedSubscript:v82];
        v84 = (void *)[v83 mutableCopy];

        v85 = [v84 objectForKeyedSubscript:@"values"];
        v86 = [v76 objectForKeyedSubscript:v82];
        v87 = [v86 objectForKeyedSubscript:@"values"];
        v88 = v87;
        if (v87)
        {
          if (v85)
          {
            v89 = [MEMORY[0x1E4F1CAD0] setWithArray:v87];
            v90 = [MEMORY[0x1E4F1CA80] setWithArray:v85];
            [v90 unionSet:v89];
            [v90 allObjects];
            v92 = v91 = v78;
            [v84 setObject:v92 forKeyedSubscript:@"values"];

            v78 = v91;
            uint64_t v80 = v112;

            id v79 = v114;
          }
          else
          {
            v89 = (void *)[v87 copy];
            [v84 setObject:v89 forKeyedSubscript:@"values"];
          }
        }
        [v124 setObject:v84 forKeyedSubscript:v82];
        [v78 removeObject:v82];

        v76 = v120;
      }
      uint64_t v122 = [v79 countByEnumeratingWithState:&v129 objects:v151 count:16];
    }
    while (v122);
  }

  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id v93 = v78;
  uint64_t v94 = [v93 countByEnumeratingWithState:&v125 objects:v150 count:16];
  if (v94)
  {
    uint64_t v95 = v94;
    uint64_t v96 = *(void *)v126;
    do
    {
      for (iuint64_t i = 0; ii != v95; ++ii)
      {
        if (*(void *)v126 != v96) {
          objc_enumerationMutation(v93);
        }
        uint64_t v98 = *(void *)(*((void *)&v125 + 1) + 8 * ii);
        v99 = [v76 objectForKeyedSubscript:v98];
        [v124 setObject:v99 forKeyedSubscript:v98];
      }
      uint64_t v95 = [v93 countByEnumeratingWithState:&v125 objects:v150 count:16];
    }
    while (v95);
  }

  [v103 setObject:v124 forKeyedSubscript:@"union"];
  v100 = +[MCHacks sharedHacks];
  [v100 _applyHeuristicsToEffectiveUserSettings:v103];

  v101 = +[MCHacks sharedHacks];
  [v101 _applyMandatorySettingsToEffectiveUserSettings:v103];

  return v103;
}

+ (int)BOOLSettingForFeature:(id)a3 outAsk:(BOOL *)a4 withUserSettingDictionary:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = [v8 objectForKey:@"restrictedBool"];
  v10 = [v9 objectForKey:v7];
  v11 = [v10 objectForKey:@"value"];

  if (v11)
  {
    if ([v11 BOOLValue])
    {
      if (a4)
      {
        v12 = [v8 objectForKeyedSubscript:@"restrictedBool"];
        uint64_t v13 = [v12 objectForKeyedSubscript:v7];
        uint64_t v14 = [v13 objectForKeyedSubscript:@"ask"];
        *a4 = [v14 BOOLValue];
      }
      int v15 = 1;
    }
    else
    {
      int v15 = 2;
    }
  }
  else
  {
    int v15 = 0;
  }

  return v15;
}

void __76__MCRestrictionManager_effectiveParametersForBoolSetting_configurationUUID___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = objc_opt_class();
    uint64_t v3 = *(void *)(a1 + 48);
    v4 = [*(id *)(a1 + 40) memberQueueUserNamespacedUserSettings];
    v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 32)];
    uint64_t v6 = [v2 parametersForBoolSetting:v3 withUserSettingDictionary:v5];

    id v7 = objc_opt_class();
    if (v6)
    {
LABEL_5:
      v11 = [*(id *)(a1 + 40) memberQueueRestrictions];
      uint64_t v12 = [v7 applyRestrictions:v11 forFeature:*(void *)(a1 + 48) toParametersForBoolSetting:v6];
      uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      goto LABEL_7;
    }
    uint64_t v8 = *(void *)(a1 + 48);
    v9 = [*(id *)(a1 + 40) memberQueueSystemNamespacedUserSettings];
    v10 = [v9 objectForKeyedSubscript:*(void *)(a1 + 32)];
    uint64_t v6 = [v7 parametersForBoolSetting:v8 withUserSettingDictionary:v10];

    if (v6)
    {
      id v7 = objc_opt_class();
      goto LABEL_5;
    }
  }
  int v15 = objc_opt_class();
  uint64_t v16 = *(void *)(a1 + 48);
  v11 = [*(id *)(a1 + 40) memberQueueEffectiveUserSettings];
  uint64_t v6 = [v15 parametersForBoolSetting:v16 withUserSettingDictionary:v11];
LABEL_7:

  uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
  v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v6;
}

- (NSMutableDictionary)memberQueueEffectiveUserSettings
{
  memberQueueEffectiveUserSettings = self->_memberQueueEffectiveUserSettings;
  if (!memberQueueEffectiveUserSettings)
  {
    v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    v5 = MCEffectiveUserSettingsFilePath();
    int v6 = [v4 isReadableFileAtPath:v5];

    if (v6)
    {
      id v7 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_INFO, "Reading from private effective user settings.", buf, 2u);
      }
      uint64_t v8 = (void *)MEMORY[0x1E4F1C9B8];
      v9 = MCEffectiveUserSettingsFilePath();
      v10 = [v8 MCDataFromFile:v9];

      if (v10) {
        goto LABEL_9;
      }
    }
    v11 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1A13F0000, v11, OS_LOG_TYPE_INFO, "Reading from public effective user settings.", v21, 2u);
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v13 = MCPublicEffectiveUserSettingsFilePath();
    v10 = [v12 MCDataFromFile:v13];

    if (v10)
    {
LABEL_9:
      uint64_t v14 = [MEMORY[0x1E4F28F98] MCSafePropertyListWithData:v10 options:1 format:0 error:0];
      int v15 = self->_memberQueueEffectiveUserSettings;
      self->_memberQueueEffectiveUserSettings = v14;
    }
    if (!self->_memberQueueEffectiveUserSettings)
    {
      uint64_t v16 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1A13F0000, v16, OS_LOG_TYPE_DEFAULT, "Could not find effective user settings. Creating new dictionary.", v20, 2u);
      }
      uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
      v18 = self->_memberQueueEffectiveUserSettings;
      self->_memberQueueEffectiveUserSettings = v17;
    }
    memberQueueEffectiveUserSettings = self->_memberQueueEffectiveUserSettings;
  }
  return memberQueueEffectiveUserSettings;
}

+ (id)parametersForSetting:(id)a3 ofType:(id)a4 withUserSettingDictionary:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  +[MCSignpostManager willGetFeature:v9];
  v10 = [v7 objectForKey:v8];

  v11 = [v10 objectForKey:v9];

  return v11;
}

+ (id)parametersForBoolSetting:(id)a3 withUserSettingDictionary:(id)a4
{
  return (id)[a1 parametersForSetting:a3 ofType:@"restrictedBool" withUserSettingDictionary:a4];
}

- (id)effectiveParametersForBoolSetting:(id)a3 configurationUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__14;
  v22 = __Block_byref_object_dispose__14;
  id v23 = 0;
  id v8 = [(MCRestrictionManager *)self memberQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__MCRestrictionManager_effectiveParametersForBoolSetting_configurationUUID___block_invoke;
  v13[3] = &unk_1E5A68BA8;
  id v14 = v7;
  int v15 = self;
  id v16 = v6;
  uint64_t v17 = &v18;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, v13);

  id v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

+ (id)sharedManager
{
  if (sharedManager_once != -1) {
    dispatch_once(&sharedManager_once, &__block_literal_global_3_3);
  }
  v2 = (void *)sharedManager_obj;
  return v2;
}

+ (id)applyRestrictions:(id)a3 forFeature:(id)a4 toParametersForBoolSetting:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  id v9 = [a3 objectForKeyedSubscript:@"restrictedBool"];
  id v10 = [v9 objectForKeyedSubscript:v8];

  id v11 = [v10 objectForKeyedSubscript:@"value"];
  uint64_t v12 = [v10 objectForKeyedSubscript:@"preference"];
  uint64_t v13 = (void *)v12;
  if (v11) {
    BOOL v14 = v12 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14 && (uint64_t v15 = [v11 BOOLValue], v15 == objc_msgSend(v13, "BOOLValue")))
  {
    v19 = @"value";
    uint64_t v17 = [MEMORY[0x1E4F28ED0] numberWithBool:v15];
    v20[0] = v17;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  }
  else
  {
    id v16 = v7;
  }

  return v16;
}

void __71__MCRestrictionManager_AppWhitelist__explicitlyRestrictedAppsBySetting__block_invoke()
{
  v30[13] = *MEMORY[0x1E4F143B8];
  v29[0] = @"allowCamera";
  v28[0] = @"com.apple.camera";
  v28[1] = @"com.apple.Photo-Booth";
  v28[2] = @"com.apple.Capture";
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  v30[0] = v15;
  v29[1] = @"allowSafari";
  v27 = @"com.apple.mobilesafari";
  BOOL v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v30[1] = v14;
  v29[2] = @"allowiTunes";
  v26 = @"com.apple.MobileStore";
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  v30[2] = v13;
  v29[3] = @"allowAppInstallation";
  v25 = @"com.apple.AppStore";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v30[3] = v12;
  v29[4] = @"allowUIAppInstallation";
  uint64_t v24 = @"com.apple.AppStore";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  v30[4] = v0;
  v29[5] = @"allowVideoConferencing";
  id v23 = @"com.apple.facetime";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  v30[5] = v1;
  v29[6] = @"allowGameCenter";
  v22 = @"com.apple.gamecenter";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v30[6] = v2;
  v29[7] = @"allowPodcasts";
  v21 = @"com.apple.podcasts";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v30[7] = v3;
  v29[8] = @"allowHome";
  uint64_t v20 = @"allowHome";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  v30[8] = v4;
  v29[9] = @"allowPairedWatch";
  v19 = @"com.apple.Bridge";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v30[9] = v5;
  v29[10] = @"allowChat";
  char HasSMSCapability = MCGestaltHasSMSCapability();
  if (HasSMSCapability)
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v18 = @"com.apple.MobileSMS";
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  }
  v30[10] = v7;
  v29[11] = @"allowNews";
  uint64_t v17 = @"com.apple.news";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v30[11] = v8;
  v29[12] = @"allowCloudDocumentSync";
  id v16 = @"com.apple.iCloudDriveApp";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v30[12] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:13];
  id v11 = (void *)explicitlyRestrictedAppsBySetting_apps;
  explicitlyRestrictedAppsBySetting_apps = v10;

  if ((HasSMSCapability & 1) == 0) {
}
  }

- (void)invalidateSettings
{
  uint64_t v3 = [(MCRestrictionManager *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MCRestrictionManager_invalidateSettings__block_invoke;
  block[3] = &unk_1E5A65CB0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __43__MCRestrictionManager_currentRestrictions__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) memberQueueRestrictions];
  return MEMORY[0x1F41817F8]();
}

- (NSMutableDictionary)memberQueueRestrictions
{
  memberQueueRestrictions = self->_memberQueueRestrictions;
  if (!memberQueueRestrictions)
  {
    v4 = (void *)MEMORY[0x1E4F28F98];
    v5 = (void *)MEMORY[0x1E4F1C9B8];
    id v6 = MCRestrictionsFilePath();
    id v7 = [v5 MCDataFromFile:v6];
    id v8 = [v4 MCSafePropertyListWithData:v7 options:1 format:0 error:0];
    id v9 = self->_memberQueueRestrictions;
    self->_memberQueueRestrictions = v8;

    memberQueueRestrictions = self->_memberQueueRestrictions;
    if (!memberQueueRestrictions)
    {
      uint64_t v10 = [(MCRestrictionManager *)self defaultRestrictions];
      id v11 = (NSMutableDictionary *)[v10 MCMutableDeepCopy];
      uint64_t v12 = self->_memberQueueRestrictions;
      self->_memberQueueRestrictions = v11;

      memberQueueRestrictions = self->_memberQueueRestrictions;
    }
  }
  return memberQueueRestrictions;
}

uint64_t __42__MCRestrictionManager_systemUserSettings__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) memberQueueSystemUserSettings];
  return MEMORY[0x1F41817F8]();
}

- (NSMutableDictionary)memberQueueSystemUserSettings
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  memberQueueSystemUserSettings = self->_memberQueueSystemUserSettings;
  if (!memberQueueSystemUserSettings)
  {
    v4 = (void *)MEMORY[0x1E4F1C9B8];
    v5 = MCSystemUserSettingsFilePath();
    id v6 = [v4 MCDataFromFile:v5];

    if (v6)
    {
      id v14 = 0;
      id v7 = [MEMORY[0x1E4F28F98] MCSafePropertyListWithData:v6 options:1 format:0 error:&v14];
      id v8 = v14;
      id v9 = self->_memberQueueSystemUserSettings;
      self->_memberQueueSystemUserSettings = v7;
    }
    else
    {
      id v8 = 0;
    }
    if (!self->_memberQueueSystemUserSettings)
    {
      uint64_t v10 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v16 = v8;
        _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_DEFAULT, "Could not find system user settings. Creating new dictionary. serialization error:  %{public}@", buf, 0xCu);
      }
      id v11 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v12 = self->_memberQueueSystemUserSettings;
      self->_memberQueueSystemUserSettings = v11;
    }
    memberQueueSystemUserSettings = self->_memberQueueSystemUserSettings;
  }
  return memberQueueSystemUserSettings;
}

- (id)restrictedAppBundleIDsExcludingRemovedSystemApps:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_new();
  id v6 = [(MCRestrictionManager *)self effectiveUnionValuesForSetting:@"blockedAppBundleIDs"];
  if (v6) {
    [v5 addObjectsFromArray:v6];
  }
  if (!a3)
  {
    id v7 = [(MCRestrictionManager *)self effectiveUnionValuesForSetting:@"removedSystemAppBundleIDs"];
    if (v7) {
      [v5 addObjectsFromArray:v7];
    }
  }
  id v8 = +[MCRestrictionManager explicitlyRestrictedAppsBySetting];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if ([(MCRestrictionManager *)self effectiveRestrictedBoolForSetting:v13] == 2)
        {
          id v14 = [v8 objectForKeyedSubscript:v13];
          [v5 addObjectsFromArray:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
  if ([(MCRestrictionManager *)self effectiveRestrictedBoolForSetting:@"allowFindMyDevice"] == 2&& [(MCRestrictionManager *)self effectiveRestrictedBoolForSetting:@"allowFindMyFriends"] == 2)
  {
    [v5 addObject:@"com.apple.findmy"];
  }
  if ([MEMORY[0x1E4F5E7A8] isSharediPad])
  {
    uint64_t v15 = +[MCRestrictionManager explicitlyRestrictedEphemeralMultiUserApps];
    [v5 addObjectsFromArray:v15];
  }
  return v5;
}

- (int)effectiveRestrictedBoolForSetting:(id)a3 configurationUUID:(id)a4
{
  v4 = [(MCRestrictionManager *)self effectiveParametersForBoolSetting:a3 configurationUUID:a4];
  v5 = [v4 objectForKey:@"value"];

  if (v5)
  {
    if ([v5 BOOLValue]) {
      int v6 = 1;
    }
    else {
      int v6 = 2;
    }
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (int)effectiveRestrictedBoolForSetting:(id)a3
{
  return [(MCRestrictionManager *)self effectiveRestrictedBoolForSetting:a3 configurationUUID:0];
}

- (id)effectiveUnionValuesForSetting:(id)a3
{
  uint64_t v3 = [(MCRestrictionManager *)self effectiveParametersForUnionSetting:a3];
  v4 = [v3 objectForKey:@"values"];

  return v4;
}

+ (id)explicitlyRestrictedAppsBySetting
{
  if (explicitlyRestrictedAppsBySetting_onceToken != -1) {
    dispatch_once(&explicitlyRestrictedAppsBySetting_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)explicitlyRestrictedAppsBySetting_apps;
  return v2;
}

- (id)unionValuesForFeature:(id)a3
{
  id v4 = a3;
  v5 = [(MCRestrictionManager *)self currentRestrictions];
  int v6 = +[MCRestrictionManager unionValuesForFeature:v4 withRestrictionsDictionary:v5];

  return v6;
}

+ (int)appWhitelistStateWithSettingsDictionary:(id)a3 restrictionsDictionary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[MCRestrictionManager intersectedValuesSettingForFeature:@"appLockBundleIDs" withUserSettingDectionary:v5];

  if (v7)
  {
    if (+[MCRestrictionManager isInSingleAppModeWithSettingsDictionary:v5])
    {
      +[MCRestrictionManager isPasscodeRequiredToAccessWhitelistedAppsWithSettingsDictionary:v5];
      LODWORD(v7) = 1;
    }
    else if (+[MCRestrictionManager isWhitelistedAppsRestrictionEnforcedWithRestrictionsDictionary:v6])
    {
      LODWORD(v7) = 6;
    }
    else
    {
      +[MCRestrictionManager mayEnterPasscodeToAccessNonWhitelistedAppsWithSettingsDictionary:v5];
      LODWORD(v7) = 2;
    }
  }

  return (int)v7;
}

+ (id)intersectedValuesSettingForFeature:(id)a3 withUserSettingDectionary:(id)a4
{
  id v5 = a3;
  id v6 = [a4 objectForKey:@"intersection"];
  id v7 = [v6 objectForKey:v5];

  id v8 = [v7 objectForKey:@"values"];

  return v8;
}

- (int)restrictedBoolForFeature:(id)a3
{
  id v4 = a3;
  id v5 = [(MCRestrictionManager *)self currentRestrictions];
  int v6 = +[MCRestrictionManager restrictedBoolForFeature:v4 withRestrictionsDictionary:v5];

  return v6;
}

- (BOOL)isBoolSettingLockedDownByRestrictions:(id)a3
{
  id v4 = a3;
  if (!os_variant_has_internal_ui()
    || ![v4 isEqualToString:@"allowDiagnosticSubmission"]
    || (Boolean keyExistsAndHasValidFormat = 0,
        AppBooleanValue = CFPreferencesGetAppBooleanValue(@"MCInternalOverrideDiagnosticEnforcement", (CFStringRef)*MEMORY[0x1E4F1D3B8], &keyExistsAndHasValidFormat), BOOL v6 = 1, keyExistsAndHasValidFormat)&& AppBooleanValue)
  {
    id v7 = [(MCRestrictionManager *)self currentRestrictions];
    id v8 = [v7 objectForKey:@"restrictedBool"];
    uint64_t v9 = [v8 objectForKey:v4];

    BOOL v6 = [(MCRestrictionManager *)self _isBoolSettingLockedDown:v9];
  }

  return v6;
}

- (NSDictionary)currentRestrictions
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__14;
  uint64_t v11 = __Block_byref_object_dispose__14;
  id v12 = 0;
  uint64_t v3 = [(MCRestrictionManager *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__MCRestrictionManager_currentRestrictions__block_invoke;
  v6[3] = &unk_1E5A65D90;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (BOOL)_isBoolSettingLockedDown:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKey:@"value"];
    uint64_t v6 = [v4 objectForKey:@"preference"];
    uint64_t v7 = (void *)v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      LOBYTE(v10) = 0;
    }
    else
    {
      int v9 = [v5 BOOLValue];
      int v10 = v9 ^ [v7 BOOLValue] ^ 1;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)effectiveParametersForIntersectedSetting:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  uint64_t v6 = [(MCRestrictionManager *)self effectiveUserSettings];
  uint64_t v7 = [v5 parametersForIntersectedSetting:v4 withUserSettingDictionary:v6];

  return v7;
}

- (id)effectiveParametersForUnionSetting:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  uint64_t v6 = [(MCRestrictionManager *)self effectiveUserSettings];
  uint64_t v7 = [v5 parametersForUnionSetting:v4 withUserSettingDictionary:v6];

  return v7;
}

- (id)effectiveParametersForValueSetting:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  uint64_t v6 = [(MCRestrictionManager *)self effectiveUserSettings];
  uint64_t v7 = [v5 parametersForValueSetting:v4 withUserSettingDictionary:v6];

  return v7;
}

- (NSDictionary)effectiveUserSettings
{
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int v10 = __Block_byref_object_copy__14;
  uint64_t v11 = __Block_byref_object_dispose__14;
  id v12 = 0;
  id v3 = [(MCRestrictionManager *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__MCRestrictionManager_effectiveUserSettings__block_invoke;
  v6[3] = &unk_1E5A65D90;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

+ (id)parametersForValueSetting:(id)a3 withUserSettingDictionary:(id)a4
{
  return (id)[a1 parametersForSetting:a3 ofType:@"restrictedValue" withUserSettingDictionary:a4];
}

+ (id)parametersForUnionSetting:(id)a3 withUserSettingDictionary:(id)a4
{
  return (id)[a1 parametersForSetting:a3 ofType:@"union" withUserSettingDictionary:a4];
}

+ (id)parametersForIntersectedSetting:(id)a3 withUserSettingDictionary:(id)a4
{
  return (id)[a1 parametersForSetting:a3 ofType:@"intersection" withUserSettingDictionary:a4];
}

+ (int)restrictedBoolForFeature:(id)a3 withRestrictionsDictionary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    BOOL v8 = [v6 objectForKey:@"restrictedBool"];
    uint64_t v9 = v8;
    if (v8)
    {
      int v10 = [v8 objectForKey:v5];
      uint64_t v11 = v10;
      if (v10
        && ([v10 objectForKey:@"value"],
            (id v12 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v13 = v12;
        if ([v12 BOOLValue]) {
          int v14 = 1;
        }
        else {
          int v14 = 2;
        }
      }
      else
      {
        int v14 = 0;
      }
    }
    else
    {
      int v14 = 0;
    }
  }
  else
  {
    int v14 = 0;
  }

  return v14;
}

+ (id)valueForFeature:(id)a3 withRestrictionsDictionary:(id)a4
{
  id v5 = a3;
  id v6 = [a4 objectForKey:@"restrictedValue"];
  uint64_t v7 = [v6 objectForKey:v5];

  BOOL v8 = [v7 objectForKey:@"value"];

  return v8;
}

+ (id)intersectedValuesForFeature:(id)a3 withRestrictionsDictionary:(id)a4
{
  id v5 = a3;
  id v6 = [a4 objectForKey:@"intersection"];
  uint64_t v7 = [v6 objectForKey:v5];

  BOOL v8 = [v7 objectForKey:@"values"];

  return v8;
}

- (void)setMemberQueueUserClientRestrictions:(id)a3
{
}

uint64_t __46__MCRestrictionManager_invalidateRestrictions__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setMemberQueueRestrictions:0];
  [*(id *)(a1 + 32) setMemberQueueSystemProfileRestrictions:0];
  [*(id *)(a1 + 32) setMemberQueueUserProfileRestrictions:0];
  [*(id *)(a1 + 32) setMemberQueueSystemClientRestrictions:0];
  v2 = *(void **)(a1 + 32);
  return [v2 setMemberQueueUserClientRestrictions:0];
}

- (void)setMemberQueueUserProfileRestrictions:(id)a3
{
}

- (void)setMemberQueueSystemProfileRestrictions:(id)a3
{
}

- (void)setMemberQueueSystemClientRestrictions:(id)a3
{
}

- (void)setMemberQueueRestrictions:(id)a3
{
}

uint64_t __37__MCRestrictionManager_sharedManager__block_invoke()
{
  v0 = NSClassFromString(&cfstr_Mcrestrictionm.isa);
  if (!v0) {
    v0 = (objc_class *)MCRestrictionManager;
  }
  sharedManager_obuint64_t j = (uint64_t)objc_alloc_init(v0);
  return MEMORY[0x1F41817F8]();
}

- (MCRestrictionManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)MCRestrictionManager;
  v2 = [(MCRestrictionManager *)&v7 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("MCRestrictionManagerWriter member queue", v3);
    memberQueue = v2->_memberQueue;
    v2->_memberQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (id)effectiveWhitelistedAppBundleIDs
{
  v2 = [(MCRestrictionManager *)self effectiveIntersectedValuesForSetting:@"appLockBundleIDs"];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CAD0] setWithArray:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)effectiveIntersectedValuesForSetting:(id)a3
{
  id v3 = [(MCRestrictionManager *)self effectiveParametersForIntersectedSetting:a3];
  dispatch_queue_t v4 = [v3 objectForKey:@"values"];

  return v4;
}

- (id)effectiveBlockedAppBundleIDsExcludingRemovedSystemApps:(BOOL)a3
{
  uint64_t v5 = [(MCRestrictionManager *)self effectiveUnionValuesForSetting:@"blockedAppBundleIDs"];
  id v6 = (void *)v5;
  objc_super v7 = (void *)MEMORY[0x1E4F1CBF0];
  if (v5) {
    objc_super v7 = (void *)v5;
  }
  id v8 = v7;

  if (!a3)
  {
    uint64_t v9 = [(MCRestrictionManager *)self effectiveUnionValuesForSetting:@"removedSystemAppBundleIDs"];
    if (v9)
    {
      uint64_t v10 = [v8 arrayByAddingObjectsFromArray:v9];

      id v8 = (id)v10;
    }
  }
  uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];

  return v11;
}

- (int)BOOLSettingForFeature:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MCRestrictionManager *)self userSettings];
  int v6 = +[MCRestrictionManager BOOLSettingForFeature:v4 withUserSettingDictionary:v5];

  return v6;
}

- (NSDictionary)systemUserSettings
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__14;
  uint64_t v11 = __Block_byref_object_dispose__14;
  id v12 = 0;
  id v3 = [(MCRestrictionManager *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__MCRestrictionManager_systemUserSettings__block_invoke;
  v6[3] = &unk_1E5A65D90;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

+ (int)BOOLSettingForFeature:(id)a3 withUserSettingDictionary:(id)a4
{
  return [a1 BOOLSettingForFeature:a3 outAsk:0 withUserSettingDictionary:a4];
}

+ (int)BOOLSettingForFeature:(id)a3 withNewUserSetting:(id)a4 currentSettings:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int v10 = [a1 BOOLSettingForFeature:v8 outAsk:0 withUserSettingDictionary:a4];
  if (!v10) {
    int v10 = [a1 BOOLSettingForFeature:v8 outAsk:0 withUserSettingDictionary:v9];
  }

  return v10;
}

+ (id)unionValuesForFeature:(id)a3 withRestrictionsDictionary:(id)a4
{
  id v5 = a3;
  int v6 = [a4 objectForKeyedSubscript:@"union"];
  uint64_t v7 = [v6 objectForKeyedSubscript:v5];

  id v8 = [v7 objectForKeyedSubscript:@"values"];

  return v8;
}

+ (id)valueSettingForFeature:(id)a3 withUserSettingDictionary:(id)a4
{
  id v5 = a3;
  int v6 = [a4 objectForKey:@"restrictedValue"];
  uint64_t v7 = [v6 objectForKey:v5];

  id v8 = [v7 objectForKey:@"value"];

  return v8;
}

- (NSString)memberQueueOverridingRestrictionClientUUID
{
  return self->_memberQueueOverridingRestrictionClientUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberQueueUserProfileRestrictions, 0);
  objc_storeStrong((id *)&self->_memberQueueSystemProfileRestrictions, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
  objc_storeStrong((id *)&self->_memberQueueOverridingRestrictionClientUUID, 0);
  objc_storeStrong((id *)&self->_memberQueueEffectiveWhitelistedAppsAndOptions, 0);
  objc_storeStrong((id *)&self->_memberQueueSettingsEvents, 0);
  objc_storeStrong((id *)&self->_memberQueueEffectiveUserSettings, 0);
  objc_storeStrong((id *)&self->_memberQueueUserNamespacedUserSettings, 0);
  objc_storeStrong((id *)&self->_memberQueueUserUserSettings, 0);
  objc_storeStrong((id *)&self->_memberQueueUserClientRestrictions, 0);
  objc_storeStrong((id *)&self->_memberQueueSystemNamespacedUserSettings, 0);
  objc_storeStrong((id *)&self->_memberQueueSystemUserSettings, 0);
  objc_storeStrong((id *)&self->_memberQueueSystemClientRestrictions, 0);
  objc_storeStrong((id *)&self->_memberQueueRestrictions, 0);
}

- (id)memberQueueClientRestrictionsForClientUUID:(id)a3
{
  id v3 = [(MCRestrictionManager *)self memberQueueClientRestrictionsDictionaryForClientUUID:a3];
  id v4 = [v3 objectForKey:@"clientRestrictions"];

  return v4;
}

- (id)memberQueueClientTypeForClientUUID:(id)a3
{
  id v3 = [(MCRestrictionManager *)self memberQueueClientRestrictionsDictionaryForClientUUID:a3];
  id v4 = [v3 objectForKey:@"clientType"];

  return v4;
}

- (id)memberQueueClientRestrictionsDictionaryForClientUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(MCRestrictionManager *)self memberQueueUserClientRestrictions];
  int v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    uint64_t v7 = [(MCRestrictionManager *)self memberQueueSystemClientRestrictions];
    int v6 = [v7 objectForKey:v4];
  }
  return v6;
}

- (NSMutableDictionary)memberQueueUserClientRestrictions
{
  memberQueueUserClientRestrictions = self->_memberQueueUserClientRestrictions;
  if (memberQueueUserClientRestrictions)
  {
    id v3 = memberQueueUserClientRestrictions;
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1C9B8];
    int v6 = MCUserClientRestrictionsFilePath();
    uint64_t v7 = [v5 MCDataFromFile:v6];

    if (v7)
    {
      id v8 = [MEMORY[0x1E4F28F98] MCSafePropertyListWithData:v7 options:2 format:0 error:0];
      id v9 = self->_memberQueueUserClientRestrictions;
      self->_memberQueueUserClientRestrictions = v8;
    }
    if (!self->_memberQueueUserClientRestrictions || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      int v10 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v14 = 0;
        _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_DEFAULT, "Could not find user client restrictions. Creating new dictionary.", v14, 2u);
      }
      uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
      id v12 = self->_memberQueueUserClientRestrictions;
      self->_memberQueueUserClientRestrictions = v11;
    }
    id v3 = self->_memberQueueUserClientRestrictions;
  }
  return v3;
}

- (NSMutableDictionary)memberQueueSystemClientRestrictions
{
  memberQueueSystemClientRestrictions = self->_memberQueueSystemClientRestrictions;
  if (memberQueueSystemClientRestrictions)
  {
    id v3 = memberQueueSystemClientRestrictions;
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1C9B8];
    int v6 = MCSystemClientRestrictionsFilePath();
    uint64_t v7 = [v5 MCDataFromFile:v6];

    if (v7)
    {
      id v8 = [MEMORY[0x1E4F28F98] MCSafePropertyListWithData:v7 options:2 format:0 error:0];
      id v9 = self->_memberQueueSystemClientRestrictions;
      self->_memberQueueSystemClientRestrictions = v8;
    }
    if (!self->_memberQueueSystemClientRestrictions || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      int v10 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v14 = 0;
        _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_DEFAULT, "Could not find system client restrictions. Creating new dictionary.", v14, 2u);
      }
      uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
      id v12 = self->_memberQueueSystemClientRestrictions;
      self->_memberQueueSystemClientRestrictions = v11;
    }
    id v3 = self->_memberQueueSystemClientRestrictions;
  }
  return v3;
}

- (void)invalidateRestrictions
{
  id v3 = [(MCRestrictionManager *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MCRestrictionManager_invalidateRestrictions__block_invoke;
  block[3] = &unk_1E5A65CB0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (NSMutableDictionary)memberQueueUserUserSettings
{
  memberQueueUserUserSettings = self->_memberQueueUserUserSettings;
  if (!memberQueueUserUserSettings)
  {
    id v4 = (void *)MEMORY[0x1E4F1C9B8];
    id v5 = MCUserUserSettingsFilePath();
    int v6 = [v4 MCDataFromFile:v5];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F28F98] MCSafePropertyListWithData:v6 options:1 format:0 error:0];
      id v8 = self->_memberQueueUserUserSettings;
      self->_memberQueueUserUserSettings = v7;
    }
    if (!self->_memberQueueUserUserSettings)
    {
      id v9 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_1A13F0000, v9, OS_LOG_TYPE_DEFAULT, "Could not find user user settings. Creating new dictionary.", v13, 2u);
      }
      int v10 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v11 = self->_memberQueueUserUserSettings;
      self->_memberQueueUserUserSettings = v10;
    }
    memberQueueUserUserSettings = self->_memberQueueUserUserSettings;
  }
  return memberQueueUserUserSettings;
}

- (NSMutableDictionary)memberQueueUserNamespacedUserSettings
{
  memberQueueUserNamespacedUserSettings = self->_memberQueueUserNamespacedUserSettings;
  if (!memberQueueUserNamespacedUserSettings)
  {
    id v4 = (void *)MEMORY[0x1E4F1C9B8];
    id v5 = MCUserNamespacedUserSettingsFilePath();
    int v6 = [v4 MCDataFromFile:v5];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F28F98] MCSafePropertyListWithData:v6 options:1 format:0 error:0];
      id v8 = self->_memberQueueUserNamespacedUserSettings;
      self->_memberQueueUserNamespacedUserSettings = v7;
    }
    if (!self->_memberQueueUserNamespacedUserSettings)
    {
      id v9 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_1A13F0000, v9, OS_LOG_TYPE_DEFAULT, "Could not find user user settings. Creating new dictionary.", v13, 2u);
      }
      int v10 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v11 = self->_memberQueueUserNamespacedUserSettings;
      self->_memberQueueUserNamespacedUserSettings = v10;
    }
    memberQueueUserNamespacedUserSettings = self->_memberQueueUserNamespacedUserSettings;
  }
  return memberQueueUserNamespacedUserSettings;
}

- (NSMutableDictionary)memberQueueSystemNamespacedUserSettings
{
  memberQueueSystemNamespacedUserSettings = self->_memberQueueSystemNamespacedUserSettings;
  if (!memberQueueSystemNamespacedUserSettings)
  {
    id v4 = (void *)MEMORY[0x1E4F1C9B8];
    id v5 = MCSystemNamespacedUserSettingsFilePath();
    int v6 = [v4 MCDataFromFile:v5];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F28F98] MCSafePropertyListWithData:v6 options:1 format:0 error:0];
      id v8 = self->_memberQueueSystemNamespacedUserSettings;
      self->_memberQueueSystemNamespacedUserSettings = v7;
    }
    if (!self->_memberQueueSystemNamespacedUserSettings)
    {
      id v9 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_1A13F0000, v9, OS_LOG_TYPE_DEFAULT, "Could not find system name spaced user settings. Creating new dictionary.", v13, 2u);
      }
      int v10 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v11 = self->_memberQueueSystemNamespacedUserSettings;
      self->_memberQueueSystemNamespacedUserSettings = v10;
    }
    memberQueueSystemNamespacedUserSettings = self->_memberQueueSystemNamespacedUserSettings;
  }
  return memberQueueSystemNamespacedUserSettings;
}

- (BOOL)applyConfiguration:(id)a3 toDomain:(unint64_t)a4 inNamespace:(id)a5 fromSender:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  switch(a4)
  {
    case 0uLL:
      if ([(NSMutableDictionary *)self->_memberQueueSystemUserSettings isEqualToDictionary:v10])goto LABEL_22; {
      uint64_t v13 = self->_memberQueueSystemUserSettings;
      }
      int v14 = (NSMutableDictionary *)[v10 MCMutableDeepCopy];
      memberQueueSystemUserSettings = self->_memberQueueSystemUserSettings;
      self->_memberQueueSystemUserSettings = v14;
      id v16 = @"SystemSettings";
      goto LABEL_36;
    case 1uLL:
      memberQueueSystemNamespacedUserSettings = self->_memberQueueSystemNamespacedUserSettings;
      if (v11)
      {
        long long v18 = [(NSMutableDictionary *)memberQueueSystemNamespacedUserSettings objectForKeyedSubscript:v11];
      }
      else
      {
        long long v18 = memberQueueSystemNamespacedUserSettings;
      }
      uint64_t v13 = v18;
      if ([(NSMutableDictionary *)v18 isEqualToDictionary:v10]) {
        goto LABEL_30;
      }
      memberQueueSystemUserSettings = (NSMutableDictionary *)[v10 MCMutableDeepCopy];
      id v29 = self->_memberQueueSystemNamespacedUserSettings;
      if (v11)
      {
        [(NSMutableDictionary *)v29 setObject:memberQueueSystemUserSettings forKeyedSubscript:v11];
        id v16 = @"SystemNamespacedSettings";
        goto LABEL_36;
      }
      self->_memberQueueSystemNamespacedUserSettings = memberQueueSystemUserSettings;
      id v16 = @"SystemNamespacedSettings";
      goto LABEL_35;
    case 2uLL:
      if ([(NSMutableDictionary *)self->_memberQueueUserUserSettings isEqualToDictionary:v10]) {
        goto LABEL_22;
      }
      uint64_t v13 = self->_memberQueueUserUserSettings;
      long long v19 = (NSMutableDictionary *)[v10 MCMutableDeepCopy];
      memberQueueSystemUserSettings = self->_memberQueueUserUserSettings;
      self->_memberQueueUserUserSettings = v19;
      id v16 = @"UserSettings";
      goto LABEL_36;
    case 3uLL:
      memberQueueUserNamespacedUserSettings = self->_memberQueueUserNamespacedUserSettings;
      if (v11)
      {
        v21 = [(NSMutableDictionary *)memberQueueUserNamespacedUserSettings objectForKeyedSubscript:v11];
      }
      else
      {
        v21 = memberQueueUserNamespacedUserSettings;
      }
      uint64_t v13 = v21;
      if ([(NSMutableDictionary *)v21 isEqualToDictionary:v10])
      {
LABEL_30:
        BOOL v27 = 0;
        goto LABEL_38;
      }
      memberQueueSystemUserSettings = (NSMutableDictionary *)[v10 MCMutableDeepCopy];
      id v29 = self->_memberQueueUserNamespacedUserSettings;
      if (v11)
      {
        [(NSMutableDictionary *)v29 setObject:memberQueueSystemUserSettings forKeyedSubscript:v11];
        id v16 = @"UserNamespacedSettings";
      }
      else
      {
        self->_memberQueueUserNamespacedUserSettings = memberQueueSystemUserSettings;
        id v16 = @"UserNamespacedSettings";
LABEL_35:
        memberQueueSystemUserSettings = v29;
      }
      goto LABEL_36;
    case 4uLL:
      if ([(NSMutableDictionary *)self->_memberQueueEffectiveUserSettings isEqualToDictionary:v10])goto LABEL_22; {
      uint64_t v13 = self->_memberQueueEffectiveUserSettings;
      }
      uint64_t v22 = (NSMutableDictionary *)[v10 MCMutableDeepCopy];
      memberQueueSystemUserSettings = self->_memberQueueEffectiveUserSettings;
      self->_memberQueueEffectiveUserSettings = v22;
      id v16 = @"EffectiveSettings";
      goto LABEL_36;
    case 5uLL:
      if ([(NSMutableDictionary *)self->_memberQueueRestrictions isEqualToDictionary:v10]) {
        goto LABEL_22;
      }
      uint64_t v13 = self->_memberQueueRestrictions;
      id v23 = (NSMutableDictionary *)[v10 MCMutableDeepCopy];
      memberQueueSystemUserSettings = self->_memberQueueRestrictions;
      self->_memberQueueRestrictions = v23;
      id v16 = @"Restrictions";
      goto LABEL_36;
    case 6uLL:
      if ([(NSMutableDictionary *)self->_memberQueueSystemProfileRestrictions isEqualToDictionary:v10])goto LABEL_22; {
      uint64_t v13 = self->_memberQueueSystemProfileRestrictions;
      }
      uint64_t v24 = (NSMutableDictionary *)[v10 MCMutableDeepCopy];
      memberQueueSystemUserSettings = self->_memberQueueSystemProfileRestrictions;
      self->_memberQueueSystemProfileRestrictions = v24;
      id v16 = @"SystemProfileRestrictions";
      goto LABEL_36;
    case 7uLL:
      if ([(NSMutableDictionary *)self->_memberQueueUserProfileRestrictions isEqualToDictionary:v10])goto LABEL_22; {
      uint64_t v13 = self->_memberQueueUserProfileRestrictions;
      }
      v25 = (NSMutableDictionary *)[v10 MCMutableDeepCopy];
      memberQueueSystemUserSettings = self->_memberQueueUserProfileRestrictions;
      self->_memberQueueUserProfileRestrictions = v25;
      id v16 = @"UserProfileRestrictions";
      goto LABEL_36;
    case 8uLL:
      if ([(NSMutableDictionary *)self->_memberQueueSystemClientRestrictions isEqualToDictionary:v10])goto LABEL_22; {
      uint64_t v13 = self->_memberQueueSystemClientRestrictions;
      }
      v26 = (NSMutableDictionary *)[v10 MCMutableDeepCopy];
      memberQueueSystemUserSettings = self->_memberQueueSystemClientRestrictions;
      self->_memberQueueSystemClientRestrictions = v26;
      id v16 = @"SystemClientRestrictions";
      goto LABEL_36;
    case 9uLL:
      if ([(NSMutableDictionary *)self->_memberQueueUserClientRestrictions isEqualToDictionary:v10])
      {
LABEL_22:
        BOOL v27 = 0;
        uint64_t v13 = 0;
      }
      else
      {
        uint64_t v13 = self->_memberQueueUserClientRestrictions;
        v28 = (NSMutableDictionary *)[v10 MCMutableDeepCopy];
        memberQueueSystemUserSettings = self->_memberQueueUserClientRestrictions;
        self->_memberQueueUserClientRestrictions = v28;
        id v16 = @"UserClientRestrictions";
LABEL_36:

LABEL_37:
        id v30 = [(NSMutableDictionary *)self->_memberQueueSettingsEvents objectForKeyedSubscript:v16];
        id v31 = [(MCRestrictionManager *)self _updatedDomainSettingsEvents:v30 fromPreviousSettings:v13 toNewSettings:v10 sender:v12];
        [(NSMutableDictionary *)self->_memberQueueSettingsEvents setObject:v31 forKeyedSubscript:v16];

        BOOL v27 = 1;
      }
LABEL_38:

      return v27;
    default:
      uint64_t v13 = 0;
      id v16 = 0;
      goto LABEL_37;
  }
}

- (NSMutableDictionary)memberQueueSettingsEvents
{
  memberQueueSettingsEvents = self->_memberQueueSettingsEvents;
  if (!memberQueueSettingsEvents)
  {
    id v4 = (void *)MEMORY[0x1E4F1C9B8];
    id v5 = MCSettingsEventsFilePath();
    int v6 = [v4 MCDataFromFile:v5];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F28F98] MCSafePropertyListWithData:v6 options:1 format:0 error:0];
      id v8 = self->_memberQueueSettingsEvents;
      self->_memberQueueSettingsEvents = v7;
    }
    if (!self->_memberQueueSettingsEvents)
    {
      id v9 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_1A13F0000, v9, OS_LOG_TYPE_DEFAULT, "Could not find settings events. Creating new dictionary.", v13, 2u);
      }
      id v10 = [MEMORY[0x1E4F1CA60] dictionary];
      id v11 = self->_memberQueueSettingsEvents;
      self->_memberQueueSettingsEvents = v10;
    }
    memberQueueSettingsEvents = self->_memberQueueSettingsEvents;
  }
  return memberQueueSettingsEvents;
}

- (id)restrictedAppBundleIDs
{
  return [(MCRestrictionManager *)self restrictedAppBundleIDsExcludingRemovedSystemApps:0];
}

+ (id)explicitlyRestrictedEphemeralMultiUserApps
{
  if (explicitlyRestrictedEphemeralMultiUserApps_onceToken != -1) {
    dispatch_once(&explicitlyRestrictedEphemeralMultiUserApps_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)explicitlyRestrictedEphemeralMultiUserApps_apps;
  return v2;
}

void __80__MCRestrictionManager_AppWhitelist__explicitlyRestrictedEphemeralMultiUserApps__block_invoke()
{
  v2[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.findmy";
  v2[1] = @"com.apple.Home";
  v2[2] = @"com.apple.Fitness";
  v2[3] = @"com.apple.Health";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:4];
  v1 = (void *)explicitlyRestrictedEphemeralMultiUserApps_apps;
  explicitlyRestrictedEphemeralMultiUserApps_apps = v0;
}

- (id)restrictionEnforcedBlockedAppBundleIDsExcludingRemovedSystemApps:(BOOL)a3
{
  id v5 = [(MCRestrictionManager *)self unionValuesForFeature:@"blockedAppBundleIDs"];
  if (!a3)
  {
    int v6 = [(MCRestrictionManager *)self unionValuesForFeature:@"removedSystemAppBundleIDs"];
    if (v6)
    {
      uint64_t v7 = [v5 arrayByAddingObjectsFromArray:v6];

      id v5 = (void *)v7;
    }
  }
  id v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];

  return v8;
}

- (id)parentalControlsBlockedAppBundleIDs
{
  v2 = [(MCRestrictionManager *)self unionValuesSettingForFeature:@"blockedAppBundleIDs"];
  id v3 = [MEMORY[0x1E4F1CAD0] setWithArray:v2];

  return v3;
}

- (id)restrictionEnforcedWhitelistedAppBundleIDs
{
  v2 = [(MCRestrictionManager *)self intersectedValuesForFeature:@"appLockBundleIDs"];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CAD0] setWithArray:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)parentalControlsWhitelistedAppBundleIDs
{
  v2 = [(MCRestrictionManager *)self intersectedValuesSettingForFeature:@"appLockBundleIDs"];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CAD0] setWithArray:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)effectiveWhitelistedAppsAndOptions
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__2;
  id v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  id v3 = [(MCRestrictionManager *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__MCRestrictionManager_AppWhitelist__effectiveWhitelistedAppsAndOptions__block_invoke;
  v6[3] = &unk_1E5A65D90;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __72__MCRestrictionManager_AppWhitelist__effectiveWhitelistedAppsAndOptions__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) memberQueueEffectiveWhitelistedAppsAndOptions];
  return MEMORY[0x1F41817F8]();
}

- (void)clearEffectiveWhitelistedAppsAndOptionsCache
{
  id v3 = [(MCRestrictionManager *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__MCRestrictionManager_AppWhitelist__clearEffectiveWhitelistedAppsAndOptionsCache__block_invoke;
  block[3] = &unk_1E5A65CB0;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __82__MCRestrictionManager_AppWhitelist__clearEffectiveWhitelistedAppsAndOptionsCache__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMemberQueueEffectiveWhitelistedAppsAndOptions:0];
}

- (BOOL)isInSingleAppMode
{
  v2 = [(MCRestrictionManager *)self effectiveUserSettings];
  BOOL v3 = +[MCRestrictionManager isInSingleAppModeWithSettingsDictionary:v2];

  return v3;
}

- (id)singleAppModeBundleID
{
  if ([(MCRestrictionManager *)self isInSingleAppMode])
  {
    BOOL v3 = [(MCRestrictionManager *)self effectiveWhitelistedAppsAndOptions];
    id v4 = [v3 firstObject];

    id v5 = [v4 objectForKeyedSubscript:@"Identifier"];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (BOOL)isSingleAppModeLogoutAllowed
{
  v2 = [(MCRestrictionManager *)self effectiveUserSettings];
  BOOL v3 = +[MCRestrictionManager isSingleAppModeLogoutAllowedWithSettingsDictionary:v2];

  return v3;
}

- (BOOL)allowedToRunAppWithBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [(MCRestrictionManager *)self restrictedAppBundleIDs];
  if ([v5 containsObject:v4])
  {
    BOOL v6 = 0;
  }
  else
  {
    uint64_t v7 = [(MCRestrictionManager *)self effectiveWhitelistedAppBundleIDs];
    id v8 = v7;
    BOOL v6 = !v7 || [v7 containsObject:v4];
  }
  return v6;
}

+ (id)defaultRestrictionFilePath
{
  if (defaultRestrictionFilePath_onceToken != -1) {
    dispatch_once(&defaultRestrictionFilePath_onceToken, &__block_literal_global_44);
  }
  v2 = (void *)defaultRestrictionFilePath_path;
  return v2;
}

void __50__MCRestrictionManager_defaultRestrictionFilePath__block_invoke()
{
  MCGetBaseResourcePath();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 stringByAppendingPathComponent:@"defaultRestrictions.plist"];
  v1 = (void *)defaultRestrictionFilePath_path;
  defaultRestrictionFilePath_path = v0;
}

- (NSDictionary)defaultRestrictions
{
  if (defaultRestrictions_onceToken != -1) {
    dispatch_once(&defaultRestrictions_onceToken, &__block_literal_global_9_1);
  }
  id v2 = (void *)defaultRestrictions_dict;
  return (NSDictionary *)v2;
}

void __43__MCRestrictionManager_defaultRestrictions__block_invoke()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F28F98];
  v1 = (void *)MEMORY[0x1E4F1C9B8];
  id v2 = +[MCRestrictionManager defaultRestrictionFilePath];
  BOOL v3 = [v1 MCDataFromFile:v2];
  id v10 = 0;
  uint64_t v4 = [v0 MCSafePropertyListWithData:v3 options:0 format:0 error:&v10];
  id v5 = v10;
  BOOL v6 = (void *)defaultRestrictions_dict;
  defaultRestrictions_dict = v4;

  if (!defaultRestrictions_dict)
  {
    uint64_t v7 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v5;
      _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_ERROR, "Cannot load default restrictions file. Substituting empty dictionary. Error: %{public}@", buf, 0xCu);
    }
    id v8 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    uint64_t v9 = (void *)defaultRestrictions_dict;
    defaultRestrictions_dict = (uint64_t)v8;
  }
}

- (NSDictionary)defaultSettings
{
  return (NSDictionary *)+[MCRestrictionManager defaultSettings];
}

- (NSMutableDictionary)memberQueueSystemProfileRestrictions
{
  memberQueueSystemProfileRestrictions = self->_memberQueueSystemProfileRestrictions;
  if (memberQueueSystemProfileRestrictions)
  {
    BOOL v3 = memberQueueSystemProfileRestrictions;
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1C9B8];
    BOOL v6 = MCSystemProfileRestrictionsFilePath();
    uint64_t v7 = [v5 MCDataFromFile:v6];

    if (v7)
    {
      id v8 = [MEMORY[0x1E4F28F98] MCSafePropertyListWithData:v7 options:1 format:0 error:0];
      uint64_t v9 = self->_memberQueueSystemProfileRestrictions;
      self->_memberQueueSystemProfileRestrictions = v8;
    }
    if (!self->_memberQueueSystemProfileRestrictions || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v10 = [MEMORY[0x1E4F1CA60] dictionary];
      id v11 = self->_memberQueueSystemProfileRestrictions;
      self->_memberQueueSystemProfileRestrictions = v10;
    }
    BOOL v3 = self->_memberQueueSystemProfileRestrictions;
  }
  return v3;
}

- (NSMutableDictionary)memberQueueUserProfileRestrictions
{
  memberQueueUserProfileRestrictions = self->_memberQueueUserProfileRestrictions;
  if (memberQueueUserProfileRestrictions)
  {
    BOOL v3 = memberQueueUserProfileRestrictions;
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1C9B8];
    BOOL v6 = MCUserProfileRestrictionsFilePath();
    uint64_t v7 = [v5 MCDataFromFile:v6];

    if (v7)
    {
      id v8 = [MEMORY[0x1E4F28F98] MCSafePropertyListWithData:v7 options:1 format:0 error:0];
      uint64_t v9 = self->_memberQueueUserProfileRestrictions;
      self->_memberQueueUserProfileRestrictions = v8;
    }
    if (!self->_memberQueueUserProfileRestrictions || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v10 = [MEMORY[0x1E4F1CA60] dictionary];
      id v11 = self->_memberQueueUserProfileRestrictions;
      self->_memberQueueUserProfileRestrictions = v10;
    }
    BOOL v3 = self->_memberQueueUserProfileRestrictions;
  }
  return v3;
}

- (NSDictionary)systemProfileRestrictions
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__14;
  id v11 = __Block_byref_object_dispose__14;
  id v12 = 0;
  BOOL v3 = [(MCRestrictionManager *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__MCRestrictionManager_systemProfileRestrictions__block_invoke;
  v6[3] = &unk_1E5A65D90;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

uint64_t __49__MCRestrictionManager_systemProfileRestrictions__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) memberQueueSystemProfileRestrictions];
  return MEMORY[0x1F41817F8]();
}

- (NSDictionary)userProfileRestrictions
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__14;
  id v11 = __Block_byref_object_dispose__14;
  id v12 = 0;
  BOOL v3 = [(MCRestrictionManager *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__MCRestrictionManager_userProfileRestrictions__block_invoke;
  v6[3] = &unk_1E5A65D90;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

uint64_t __47__MCRestrictionManager_userProfileRestrictions__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) memberQueueUserProfileRestrictions];
  return MEMORY[0x1F41817F8]();
}

- (NSMutableDictionary)memberQueueCombinedSystemProfileRestrictions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(MCRestrictionManager *)self memberQueueSystemProfileRestrictions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      uint64_t v9 = v3;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v8);
        id v11 = [(MCRestrictionManager *)self memberQueueSystemProfileRestrictions];
        id v12 = [v11 objectForKey:v10];

        uint64_t v13 = (void *)MEMORY[0x1A6232D90]();
        BOOL v3 = +[MCRestrictionManager restrictionsAfterApplyingRestrictionsDictionary:v12 toRestrictionsDictionary:v9 outChangeDetected:0 outError:0];

        ++v8;
        uint64_t v9 = v3;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return (NSMutableDictionary *)v3;
}

- (NSMutableDictionary)memberQueueCombinedProfileRestrictions
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v4 = [(MCRestrictionManager *)self memberQueueSystemProfileRestrictions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v30;
    do
    {
      uint64_t v8 = 0;
      uint64_t v9 = v3;
      do
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * v8);
        id v11 = [(MCRestrictionManager *)self memberQueueSystemProfileRestrictions];
        id v12 = [v11 objectForKey:v10];

        uint64_t v13 = (void *)MEMORY[0x1A6232D90]();
        BOOL v3 = +[MCRestrictionManager restrictionsAfterApplyingRestrictionsDictionary:v12 toRestrictionsDictionary:v9 outChangeDetected:0 outError:0];

        ++v8;
        uint64_t v9 = v3;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v6);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  int v14 = [(MCRestrictionManager *)self memberQueueUserProfileRestrictions];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      uint64_t v18 = 0;
      long long v19 = v3;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * v18);
        v21 = [(MCRestrictionManager *)self memberQueueUserProfileRestrictions];
        uint64_t v22 = [v21 objectForKey:v20];

        id v23 = (void *)MEMORY[0x1A6232D90]();
        BOOL v3 = +[MCRestrictionManager restrictionsAfterApplyingRestrictionsDictionary:v22 toRestrictionsDictionary:v19 outChangeDetected:0 outError:0];

        ++v18;
        long long v19 = v3;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v16);
  }

  return (NSMutableDictionary *)v3;
}

- (NSDictionary)combinedProfileRestrictions
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__14;
  id v11 = __Block_byref_object_dispose__14;
  id v12 = 0;
  BOOL v3 = [(MCRestrictionManager *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__MCRestrictionManager_combinedProfileRestrictions__block_invoke;
  v6[3] = &unk_1E5A65D90;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

uint64_t __51__MCRestrictionManager_combinedProfileRestrictions__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) memberQueueCombinedProfileRestrictions];
  return MEMORY[0x1F41817F8]();
}

- (id)description
{
  BOOL v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MCRestrictionManager;
  id v4 = [(MCRestrictionManager *)&v8 description];
  uint64_t v5 = [(MCRestrictionManager *)self currentRestrictions];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %p: Restrictions:%@", v4, self, v5];

  return v6;
}

- (id)potentialRestrictionsAfterApplyingRestrictionsDictionary:(id)a3 outChangeDetected:(BOOL *)a4 outError:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(MCRestrictionManager *)self currentRestrictions];
  uint64_t v10 = +[MCRestrictionManager restrictionsAfterApplyingRestrictionsDictionary:v8 toRestrictionsDictionary:v9 outChangeDetected:a4 outError:a5];

  return v10;
}

+ (id)restrictionsAfterApplyingRestrictionsDictionary:(id)a3 toRestrictionsDictionary:(id)a4 outChangeDetected:(BOOL *)a5 outError:(id *)a6
{
  uint64_t v155 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void *)[a4 MCMutableDeepCopy];
  uint64_t v10 = [v8 objectForKey:@"restrictedBool"];
  id v113 = v8;
  v114 = v9;
  if (!v10)
  {
    char v38 = 0;
    goto LABEL_36;
  }
  id v11 = (void *)v10;
  uint64_t v115 = [v9 objectForKey:@"restrictedBool"];
  if (!v115)
  {
    uint64_t v115 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_msgSend(v9, "setValue:forKey:");
  }
  long long v148 = 0u;
  long long v149 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  id v12 = v11;
  uint64_t v124 = [v12 countByEnumeratingWithState:&v146 objects:v154 count:16];
  if (!v124)
  {
    char v37 = 0;
    id v27 = 0;
    uint64_t v13 = (void *)v115;
    goto LABEL_34;
  }
  v110 = a6;
  char v118 = 0;
  uint64_t v122 = *(void *)v147;
  uint64_t v13 = (void *)v115;
  while (2)
  {
    for (uint64_t i = 0; i != v124; ++i)
    {
      if (*(void *)v147 != v122) {
        objc_enumerationMutation(v12);
      }
      uint64_t v15 = *(void **)(*((void *)&v146 + 1) + 8 * i);
      uint64_t v16 = [v12 objectForKey:v15];
      uint64_t v17 = [v13 objectForKey:v15];
      if (v17)
      {
        uint64_t v18 = [v16 objectForKey:@"preference"];
        uint64_t v19 = [v17 objectForKey:@"preference"];
        uint64_t v20 = (void *)v19;
        if (v18) {
          BOOL v21 = v19 == 0;
        }
        else {
          BOOL v21 = 1;
        }
        if (v21 || (int v22 = [v18 BOOLValue], v22 != objc_msgSend(v20, "BOOLValue")))
        {

          long long v28 = (void *)MEMORY[0x1E4F28C58];
          v36 = MCErrorArray(@"RESTRICTION_ERROR_INCONSISTENT_SENSE_P_KEY", v29, v30, v31, v32, v33, v34, v35, v15);
          id v27 = [v28 MCErrorWithDomain:@"MCRestrictionsErrorDomain" code:3000 descriptionArray:v36 errorType:@"MCFatalError"];

          goto LABEL_31;
        }
        id v23 = [v16 objectForKey:@"value"];
        if (v23)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v24 = [v17 objectForKey:@"value"];
            if (!v24
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
              || ([v23 isEqualToNumber:v24] & 1) == 0)
            {
              uint64_t v25 = [v23 BOOLValue];
              if (v22 == v25)
              {
                long long v26 = [MEMORY[0x1E4F28ED0] numberWithBool:v25];
                [v17 setValue:v26 forKey:@"value"];

                char v118 = 1;
              }
            }

            uint64_t v13 = (void *)v115;
          }
        }
      }
      else
      {
        if (!v16) {
          goto LABEL_27;
        }
        uint64_t v18 = (void *)[v16 mutableCopy];
        [v13 setValue:v18 forKey:v15];
        char v118 = 1;
      }

LABEL_27:
    }
    uint64_t v124 = [v12 countByEnumeratingWithState:&v146 objects:v154 count:16];
    if (v124) {
      continue;
    }
    break;
  }
  id v27 = 0;
LABEL_31:
  id v8 = v113;
  a6 = v110;
  char v37 = v118;
LABEL_34:

  uint64_t v9 = v114;
  if (v27) {
    goto LABEL_69;
  }
  char v38 = v37 & 1;
LABEL_36:
  uint64_t v39 = [v8 objectForKey:@"restrictedValue"];
  if (!v39) {
    goto LABEL_71;
  }
  v40 = (void *)v39;
  v41 = [v9 objectForKey:@"restrictedValue"];
  if (!v41)
  {
    v41 = [MEMORY[0x1E4F1CA60] dictionary];
    [v9 setValue:v41 forKey:@"restrictedValue"];
  }
  long long v144 = 0u;
  long long v145 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  id v42 = v40;
  uint64_t v123 = [v42 countByEnumeratingWithState:&v142 objects:v153 count:16];
  if (!v123)
  {
    id v27 = 0;
    goto LABEL_68;
  }
  v111 = a6;
  char v125 = v38;
  uint64_t v121 = *(void *)v143;
  while (2)
  {
    uint64_t v43 = 0;
    while (2)
    {
      if (*(void *)v143 != v121) {
        objc_enumerationMutation(v42);
      }
      id v44 = *(void **)(*((void *)&v142 + 1) + 8 * v43);
      BOOL v45 = [v42 objectForKey:v44];
      id v46 = [v41 objectForKey:v44];
      if (v46)
      {
        BOOL v47 = [v45 objectForKey:@"preferSmallerValues"];
        uint64_t v48 = [v46 objectForKey:@"preferSmallerValues"];
        id v49 = (void *)v48;
        if (v47) {
          BOOL v50 = v48 == 0;
        }
        else {
          BOOL v50 = 1;
        }
        if (v50 || (int v51 = [v47 BOOLValue], v51 != objc_msgSend(v49, "BOOLValue")))
        {

          v57 = (void *)MEMORY[0x1E4F28C58];
          v65 = MCErrorArray(@"RESTRICTION_ERROR_INCONSISTENT_SENSE_P_KEY", v58, v59, v60, v61, v62, v63, v64, v44);
          id v27 = [v57 MCErrorWithDomain:@"MCRestrictionsErrorDomain" code:3001 descriptionArray:v65 errorType:@"MCFatalError"];

          goto LABEL_66;
        }
        v52 = [v45 objectForKey:@"value"];
        id v53 = [v46 objectForKey:@"value"];
        if (v52)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (!v53) {
              goto LABEL_57;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_57;
            }
            uint64_t v54 = [v52 compare:v53];
            uint64_t v55 = -1;
            if (!v51) {
              uint64_t v55 = 1;
            }
            if (v54 == v55)
            {
LABEL_57:
              v56 = (void *)[v52 copy];
              [v46 setValue:v56 forKey:@"value"];

              char v125 = 1;
            }
          }
        }

LABEL_61:
      }
      else if (v45)
      {
        BOOL v47 = (void *)[v45 mutableCopy];
        [v41 setValue:v47 forKey:v44];
        char v125 = 1;
        goto LABEL_61;
      }

      if (v123 != ++v43) {
        continue;
      }
      break;
    }
    uint64_t v123 = [v42 countByEnumeratingWithState:&v142 objects:v153 count:16];
    if (v123) {
      continue;
    }
    break;
  }
  id v27 = 0;
LABEL_66:
  id v8 = v113;
  char v38 = v125;
  a6 = v111;
LABEL_68:

  uint64_t v9 = v114;
  if (v27)
  {
LABEL_69:
    if (a6)
    {
      id v27 = v27;
      id v66 = 0;
      *a6 = v27;
    }
    else
    {
      id v66 = 0;
    }
    goto LABEL_143;
  }
LABEL_71:
  uint64_t v67 = [v8 objectForKey:@"intersection"];
  if (v67)
  {
    uint64_t v68 = (void *)v67;
    char v126 = v38;
    uint64_t v69 = [v9 objectForKey:@"intersection"];
    if (!v69)
    {
      uint64_t v69 = [MEMORY[0x1E4F1CA60] dictionary];
      [v9 setObject:v69 forKey:@"intersection"];
    }
    long long v140 = 0u;
    long long v141 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    id v70 = v68;
    uint64_t v71 = [v70 countByEnumeratingWithState:&v138 objects:v152 count:16];
    if (v71)
    {
      uint64_t v72 = v71;
      uint64_t v73 = *(void *)v139;
      uint64_t v116 = *(void *)v139;
      do
      {
        for (uint64_t j = 0; j != v72; ++j)
        {
          if (*(void *)v139 != v73) {
            objc_enumerationMutation(v70);
          }
          uint64_t v75 = *(void *)(*((void *)&v138 + 1) + 8 * j);
          v76 = [v70 objectForKey:v75];
          v77 = [v69 objectForKey:v75];
          if (v77)
          {
            if (!v76) {
              goto LABEL_94;
            }
            v78 = [v76 objectForKey:@"values"];
            id v79 = [v77 objectForKey:@"values"];
            if (v78)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if (v79 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  uint64_t v80 = [MEMORY[0x1E4F1CAD0] setWithArray:v78];
                  v81 = [MEMORY[0x1E4F1CA80] setWithArray:v79];
                  uint64_t v119 = (void *)[v81 copy];
                  [v81 intersectSet:v80];
                  if (([v81 isEqualToSet:v119] & 1) == 0)
                  {
                    long long v127 = [v81 allObjects];
                    [v77 setObject:v127 forKey:@"values"];

                    char v126 = 1;
                  }

                  uint64_t v73 = v116;
                }
                else
                {
                  uint64_t v80 = (void *)[v78 mutableCopy];
                  [v77 setObject:v80 forKey:@"values"];
                  char v126 = 1;
                }
              }
            }
          }
          else
          {
            if (!v76) {
              goto LABEL_94;
            }
            v78 = (void *)[v76 mutableCopy];
            [v69 setValue:v78 forKey:v75];
            char v126 = 1;
          }

LABEL_94:
        }
        uint64_t v72 = [v70 countByEnumeratingWithState:&v138 objects:v152 count:16];
      }
      while (v72);
    }

    id v8 = v113;
    uint64_t v9 = v114;
    char v38 = v126;
  }
  uint64_t v82 = [v8 objectForKey:@"union"];
  if (v82)
  {
    v83 = (void *)v82;
    char v128 = v38;
    v84 = [v9 objectForKey:@"union"];
    if (!v84)
    {
      v84 = [MEMORY[0x1E4F1CA60] dictionary];
      [v9 setObject:v84 forKey:@"union"];
    }
    long long v136 = 0u;
    long long v137 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    id v85 = v83;
    uint64_t v86 = [v85 countByEnumeratingWithState:&v134 objects:v151 count:16];
    if (v86)
    {
      uint64_t v87 = v86;
      uint64_t v88 = *(void *)v135;
      uint64_t v117 = *(void *)v135;
      do
      {
        for (uint64_t k = 0; k != v87; ++k)
        {
          if (*(void *)v135 != v88) {
            objc_enumerationMutation(v85);
          }
          uint64_t v90 = *(void *)(*((void *)&v134 + 1) + 8 * k);
          v91 = [v85 objectForKey:v90];
          v92 = [v84 objectForKey:v90];
          if (v92)
          {
            if (!v91) {
              goto LABEL_120;
            }
            id v93 = [v91 objectForKey:@"values"];
            uint64_t v94 = [v92 objectForKey:@"values"];
            if (v93)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if (v94 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  uint64_t v95 = [MEMORY[0x1E4F1CAD0] setWithArray:v93];
                  uint64_t v96 = [MEMORY[0x1E4F1CA80] setWithArray:v94];
                  v120 = (void *)[v96 copy];
                  [v96 unionSet:v95];
                  if (([v96 isEqual:v120] & 1) == 0)
                  {
                    long long v129 = [v96 allObjects];
                    [v92 setObject:v129 forKey:@"values"];

                    char v128 = 1;
                  }

                  uint64_t v88 = v117;
                }
                else
                {
                  uint64_t v95 = (void *)[v93 mutableCopy];
                  [v92 setObject:v95 forKey:@"values"];
                  char v128 = 1;
                }
              }
            }
          }
          else
          {
            if (!v91) {
              goto LABEL_120;
            }
            id v93 = (void *)[v91 mutableCopy];
            [v84 setValue:v93 forKey:v90];
            char v128 = 1;
          }

LABEL_120:
        }
        uint64_t v87 = [v85 countByEnumeratingWithState:&v134 objects:v151 count:16];
      }
      while (v87);
    }

    id v8 = v113;
    uint64_t v9 = v114;
    char v38 = v128;
  }
  uint64_t v97 = [v8 objectForKey:@"assignedObject"];
  if (v97)
  {
    uint64_t v98 = (void *)v97;
    v99 = [v9 objectForKey:@"assignedObject"];
    if (!v99)
    {
      v99 = [MEMORY[0x1E4F1CA60] dictionary];
      [v9 setValue:v99 forKey:@"assignedObject"];
    }
    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id v100 = v98;
    uint64_t v101 = [v100 countByEnumeratingWithState:&v130 objects:v150 count:16];
    if (v101)
    {
      uint64_t v102 = v101;
      uint64_t v103 = *(void *)v131;
      do
      {
        for (uint64_t m = 0; m != v102; ++m)
        {
          if (*(void *)v131 != v103) {
            objc_enumerationMutation(v100);
          }
          uint64_t v105 = *(void *)(*((void *)&v130 + 1) + 8 * m);
          id v106 = [v100 objectForKey:v105];
          v107 = [v99 objectForKey:v105];
          if (!v107) {
            goto LABEL_135;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v99 removeObjectForKey:v105];
            goto LABEL_136;
          }
          if (([v107 isEqual:v106] & 1) == 0)
          {
LABEL_135:
            uint64_t v108 = (void *)[v106 copy];
            [v99 setValue:v108 forKey:v105];

            char v38 = 1;
          }
LABEL_136:
        }
        uint64_t v102 = [v100 countByEnumeratingWithState:&v130 objects:v150 count:16];
      }
      while (v102);
    }

    id v8 = v113;
    uint64_t v9 = v114;
  }
  if (a5) {
    *a5 = v38 & 1;
  }
  id v66 = v9;
  id v27 = 0;
LABEL_143:

  return v66;
}

+ (id)restrictionsWithCurrentRestrictions:(id)a3 defaultRestrictions:(id)a4 systemProfileRestrictions:(id)a5 userProfileRestrictions:(id)a6 systemClientRestrictions:(id)a7 userClientRestrictions:(id)a8 outRestrictionsChanged:(BOOL *)a9 outError:(id *)a10
{
  uint64_t v15 = a9;
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v63 = a3;
  id v65 = a5;
  id v64 = a6;
  id v16 = a7;
  id v66 = a8;
  id v17 = (id)[a4 MCMutableDeepCopy];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v18 = v16;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v91 objects:v100 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v92;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v92 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = [v18 objectForKeyedSubscript:*(void *)(*((void *)&v91 + 1) + 8 * i)];
        uint64_t v24 = [v23 objectForKeyedSubscript:@"overrideRestrictions"];
        if ([v24 BOOLValue])
        {
          id v25 = v18;
          goto LABEL_51;
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v91 objects:v100 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v25 = v66;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v87 objects:v99 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v88;
LABEL_11:
    uint64_t v29 = 0;
    while (1)
    {
      if (*(void *)v88 != v28) {
        objc_enumerationMutation(v25);
      }
      id v23 = [v25 objectForKeyedSubscript:*(void *)(*((void *)&v87 + 1) + 8 * v29)];
      uint64_t v24 = [v23 objectForKeyedSubscript:@"overrideRestrictions"];
      if ([v24 BOOLValue]) {
        break;
      }

      if (v27 == ++v29)
      {
        uint64_t v27 = [v25 countByEnumeratingWithState:&v87 objects:v99 count:16];
        if (v27) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
LABEL_51:
    uint64_t v58 = [v23 objectForKeyedSubscript:@"clientRestrictions"];

    id v30 = v25;
    id v17 = (id)v58;
    v57 = v63;
    goto LABEL_52;
  }
LABEL_17:
  uint64_t v61 = a9;

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v30 = v65;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v83 objects:v98 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v84;
LABEL_19:
    uint64_t v34 = 0;
    uint64_t v35 = v17;
    while (1)
    {
      if (*(void *)v84 != v33) {
        objc_enumerationMutation(v30);
      }
      v36 = objc_msgSend(v30, "objectForKeyedSubscript:", *(void *)(*((void *)&v83 + 1) + 8 * v34), v61);
      id v82 = 0;
      id v17 = +[MCRestrictionManager restrictionsAfterApplyingRestrictionsDictionary:v36 toRestrictionsDictionary:v35 outChangeDetected:0 outError:&v82];
      id v37 = v82;

      if (v37) {
        goto LABEL_58;
      }
      ++v34;
      uint64_t v35 = v17;
      if (v32 == v34)
      {
        uint64_t v32 = [v30 countByEnumeratingWithState:&v83 objects:v98 count:16];
        if (v32) {
          goto LABEL_19;
        }
        break;
      }
    }
  }

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v30 = v18;
  uint64_t v38 = [v30 countByEnumeratingWithState:&v78 objects:v97 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v62 = *(void *)v79;
LABEL_27:
    uint64_t v40 = 0;
    v41 = v17;
    while (1)
    {
      if (*(void *)v79 != v62) {
        objc_enumerationMutation(v30);
      }
      id v42 = objc_msgSend(v30, "objectForKeyedSubscript:", *(void *)(*((void *)&v78 + 1) + 8 * v40), v61);
      uint64_t v43 = [v42 objectForKeyedSubscript:@"clientRestrictions"];

      id v77 = 0;
      id v17 = +[MCRestrictionManager restrictionsAfterApplyingRestrictionsDictionary:v43 toRestrictionsDictionary:v41 outChangeDetected:0 outError:&v77];
      id v37 = v77;

      if (v37) {
        goto LABEL_58;
      }
      ++v40;
      v41 = v17;
      if (v39 == v40)
      {
        uint64_t v39 = [v30 countByEnumeratingWithState:&v78 objects:v97 count:16];
        if (v39) {
          goto LABEL_27;
        }
        break;
      }
    }
  }

  long long v76 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v73 = 0u;
  id v30 = v64;
  uint64_t v44 = [v30 countByEnumeratingWithState:&v73 objects:v96 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v74;
LABEL_35:
    uint64_t v47 = 0;
    uint64_t v48 = v17;
    while (1)
    {
      if (*(void *)v74 != v46) {
        objc_enumerationMutation(v30);
      }
      id v49 = objc_msgSend(v30, "objectForKeyedSubscript:", *(void *)(*((void *)&v73 + 1) + 8 * v47), v61);
      id v72 = 0;
      id v17 = +[MCRestrictionManager restrictionsAfterApplyingRestrictionsDictionary:v49 toRestrictionsDictionary:v48 outChangeDetected:0 outError:&v72];
      id v37 = v72;

      if (v37) {
        goto LABEL_58;
      }
      ++v47;
      uint64_t v48 = v17;
      if (v45 == v47)
      {
        uint64_t v45 = [v30 countByEnumeratingWithState:&v73 objects:v96 count:16];
        if (v45) {
          goto LABEL_35;
        }
        break;
      }
    }
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v30 = v25;
  uint64_t v50 = [v30 countByEnumeratingWithState:&v68 objects:v95 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v69;
LABEL_43:
    uint64_t v53 = 0;
    uint64_t v54 = v17;
    while (1)
    {
      if (*(void *)v69 != v52) {
        objc_enumerationMutation(v30);
      }
      uint64_t v55 = objc_msgSend(v30, "objectForKeyedSubscript:", *(void *)(*((void *)&v68 + 1) + 8 * v53), v61);
      v56 = [v55 objectForKeyedSubscript:@"clientRestrictions"];

      id v67 = 0;
      id v17 = +[MCRestrictionManager restrictionsAfterApplyingRestrictionsDictionary:v56 toRestrictionsDictionary:v54 outChangeDetected:0 outError:&v67];
      id v37 = v67;

      if (v37) {
        break;
      }
      ++v53;
      uint64_t v54 = v17;
      if (v51 == v53)
      {
        uint64_t v51 = [v30 countByEnumeratingWithState:&v68 objects:v95 count:16];
        if (v51) {
          goto LABEL_43;
        }
        goto LABEL_49;
      }
    }
LABEL_58:

    v57 = v63;
    if (a10)
    {
      id v37 = v37;
      uint64_t v59 = 0;
      *a10 = v37;
    }
    else
    {
      uint64_t v59 = 0;
    }
    goto LABEL_55;
  }
LABEL_49:
  v57 = v63;
  uint64_t v15 = v61;
LABEL_52:

  if (v15) {
    *uint64_t v15 = MCEqualDictionaries(v17, v57) ^ 1;
  }
  id v17 = v17;
  id v37 = 0;
  uint64_t v59 = v17;
LABEL_55:

  return v59;
}

+ (id)filterRestrictionDictionaryForPublicUse:(id)a3
{
  uint64_t v4 = filterRestrictionDictionaryForPublicUse__onceToken;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&filterRestrictionDictionaryForPublicUse__onceToken, &__block_literal_global_30_2);
  }
  uint64_t v6 = [a1 filterRestrictionDictionary:v5 acceptedKeysDict:filterRestrictionDictionaryForPublicUse__keysDict];

  return v6;
}

void __64__MCRestrictionManager_filterRestrictionDictionaryForPublicUse___block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1C9E8];
  MCGetBaseResourcePath();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v1 = [v4 stringByAppendingPathComponent:@"publicRestrictionKeys.plist"];
  uint64_t v2 = [v0 MCDictionaryFromFile:v1];
  BOOL v3 = (void *)filterRestrictionDictionaryForPublicUse__keysDict;
  filterRestrictionDictionaryForPublicUse__keysDict = v2;
}

+ (id)filterRestrictionDictionary:(id)a3 acceptedKeysDict:(id)a4
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v57 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = [v6 objectForKeyedSubscript:@"restrictedBool"];
  id v66 = [v7 setWithArray:v8];

  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = [v6 objectForKeyedSubscript:@"restrictedValue"];
  id v65 = [v9 setWithArray:v10];

  id v11 = (void *)MEMORY[0x1E4F1CAD0];
  id v12 = objc_msgSend(v6, "objectForKeyedSubscript:");
  id v64 = [v11 setWithArray:v12];

  uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
  v56 = v6;
  int v14 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v63 = [v13 setWithArray:v14];

  uint64_t v58 = v5;
  uint64_t v15 = [v5 objectForKeyedSubscript:@"restrictedBool"];
  uint64_t v62 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  obuint64_t j = v15;
  uint64_t v16 = [obj countByEnumeratingWithState:&v80 objects:v95 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v81 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v80 + 1) + 8 * i);
        if ([v66 containsObject:v20])
        {
          uint64_t v21 = [obj objectForKeyedSubscript:v20];
          int v22 = [v21 objectForKeyedSubscript:@"value"];

          if (v22)
          {
            long long v93 = @"value";
            long long v94 = v22;
            id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
            [v62 setObject:v23 forKeyedSubscript:v20];
          }
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v80 objects:v95 count:16];
    }
    while (v17);
  }

  if ([v62 count]) {
    [v57 setObject:v62 forKeyedSubscript:@"restrictedBool"];
  }
  uint64_t v24 = [v58 objectForKeyedSubscript:@"restrictedValue"];
  uint64_t v61 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v25 = v24;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v76 objects:v92 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v77;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v77 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v76 + 1) + 8 * j);
        if ([v65 containsObject:v30])
        {
          uint64_t v31 = [v25 objectForKeyedSubscript:v30];
          uint64_t v32 = [v31 objectForKeyedSubscript:@"value"];

          if (v32)
          {
            long long v90 = @"value";
            long long v91 = v32;
            uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
            [v61 setObject:v33 forKeyedSubscript:v30];
          }
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v76 objects:v92 count:16];
    }
    while (v27);
  }

  if ([v61 count]) {
    [v57 setObject:v61 forKeyedSubscript:@"restrictedValue"];
  }
  uint64_t v34 = [v58 objectForKeyedSubscript:@"intersection"];
  uint64_t v60 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v34, "count"));
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v35 = v34;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v72 objects:v89 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v73;
    do
    {
      for (uint64_t k = 0; k != v37; ++k)
      {
        if (*(void *)v73 != v38) {
          objc_enumerationMutation(v35);
        }
        uint64_t v40 = *(void *)(*((void *)&v72 + 1) + 8 * k);
        if ([v64 containsObject:v40])
        {
          v41 = [v35 objectForKeyedSubscript:v40];
          id v42 = [v41 objectForKeyedSubscript:@"values"];

          if (v42)
          {
            long long v87 = @"values";
            long long v88 = v42;
            uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
            [v60 setObject:v43 forKeyedSubscript:v40];
          }
        }
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v72 objects:v89 count:16];
    }
    while (v37);
  }

  if ([v60 count]) {
    [v57 setObject:v60 forKeyedSubscript:@"intersection"];
  }
  uint64_t v44 = [v58 objectForKeyedSubscript:@"union"];
  uint64_t v59 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v44, "count"));
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v45 = v44;
  uint64_t v46 = [v45 countByEnumeratingWithState:&v68 objects:v86 count:16];
  uint64_t v47 = (void *)v63;
  if (v46)
  {
    uint64_t v48 = v46;
    uint64_t v49 = *(void *)v69;
    do
    {
      for (uint64_t m = 0; m != v48; ++m)
      {
        if (*(void *)v69 != v49) {
          objc_enumerationMutation(v45);
        }
        uint64_t v51 = *(void *)(*((void *)&v68 + 1) + 8 * m);
        if ([v47 containsObject:v51])
        {
          uint64_t v52 = [v45 objectForKeyedSubscript:v51];
          uint64_t v53 = [v52 objectForKeyedSubscript:@"values"];

          if (v53)
          {
            long long v84 = @"values";
            long long v85 = v53;
            uint64_t v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
            [v59 setObject:v54 forKeyedSubscript:v51];
          }
          uint64_t v47 = (void *)v63;
        }
      }
      uint64_t v48 = [v45 countByEnumeratingWithState:&v68 objects:v86 count:16];
    }
    while (v48);
  }

  if ([v59 count]) {
    [v57 setObject:v59 forKeyedSubscript:@"union"];
  }

  return v57;
}

+ (id)filterRestrictionDictionary:(id)a3 toIncludeOnlyRestrictionsThatDifferFromRestrictions:(id)a4
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  id v68 = (id)objc_claimAutoreleasedReturnValue();
  long long v70 = v5;
  uint64_t v7 = [v5 objectForKeyedSubscript:@"restrictedBool"];
  long long v69 = v6;
  long long v83 = [v6 objectForKeyedSubscript:@"restrictedBool"];
  long long v71 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v8 = v7;
  uint64_t v87 = [v8 countByEnumeratingWithState:&v103 objects:v110 count:16];
  if (v87)
  {
    uint64_t v79 = *(void *)v104;
    id v72 = v8;
    do
    {
      for (uint64_t i = 0; i != v87; ++i)
      {
        if (*(void *)v104 != v79) {
          objc_enumerationMutation(v8);
        }
        uint64_t v10 = *(void *)(*((void *)&v103 + 1) + 8 * i);
        id v11 = (void *)MEMORY[0x1A6232D90]();
        id v12 = [v8 objectForKeyedSubscript:v10];
        uint64_t v13 = [v83 objectForKeyedSubscript:v10];
        uint64_t v14 = [v12 objectForKeyedSubscript:@"value"];
        if (v14)
        {
          uint64_t v15 = (void *)v14;
          uint64_t v16 = [v12 objectForKeyedSubscript:@"value"];
          int v17 = [v16 BOOLValue];
          uint64_t v18 = [v13 objectForKeyedSubscript:@"preference"];
          uint64_t v19 = v11;
          int v20 = [v18 BOOLValue];

          BOOL v21 = v17 == v20;
          id v11 = v19;
          id v8 = v72;
          if (v21) {
            [v71 setObject:v12 forKeyedSubscript:v10];
          }
        }
      }
      uint64_t v87 = [v8 countByEnumeratingWithState:&v103 objects:v110 count:16];
    }
    while (v87);
  }

  if ([v71 count]) {
    [v68 setObject:v71 forKeyedSubscript:@"restrictedBool"];
  }

  int v22 = [v70 objectForKeyedSubscript:@"restrictedValue"];
  long long v80 = [v69 objectForKeyedSubscript:@"restrictedValue"];
  long long v73 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v23 = v22;
  uint64_t v84 = [v23 countByEnumeratingWithState:&v99 objects:v109 count:16];
  if (v84)
  {
    uint64_t v76 = *(void *)v100;
    uint64_t v24 = @"value";
    do
    {
      for (uint64_t j = 0; j != v84; ++j)
      {
        if (*(void *)v100 != v76) {
          objc_enumerationMutation(v23);
        }
        uint64_t v26 = *(void *)(*((void *)&v99 + 1) + 8 * j);
        uint64_t v27 = (void *)MEMORY[0x1A6232D90]();
        uint64_t v28 = [v23 objectForKeyedSubscript:v26];
        uint64_t v29 = [v80 objectForKeyedSubscript:v26];
        uint64_t v30 = [v28 objectForKeyedSubscript:v24];
        if (v30)
        {
          uint64_t v31 = (void *)v30;
          uint64_t v32 = [v28 objectForKeyedSubscript:v24];
          [v29 objectForKeyedSubscript:@"default"];
          uint64_t v33 = v27;
          uint64_t v34 = v24;
          v36 = id v35 = v23;
          char v88 = [v32 isEqual:v36];

          id v23 = v35;
          uint64_t v24 = v34;
          uint64_t v27 = v33;

          if ((v88 & 1) == 0) {
            [v73 setObject:v28 forKeyedSubscript:v26];
          }
        }
      }
      uint64_t v84 = [v23 countByEnumeratingWithState:&v99 objects:v109 count:16];
    }
    while (v84);
  }

  if ([v73 count]) {
    [v68 setObject:v73 forKeyedSubscript:@"restrictedValue"];
  }

  uint64_t v37 = [v70 objectForKeyedSubscript:@"intersection"];
  long long v81 = [v69 objectForKeyedSubscript:@"intersection"];
  long long v74 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v37, "count"));
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v38 = v37;
  uint64_t v85 = [v38 countByEnumeratingWithState:&v95 objects:v108 count:16];
  if (v85)
  {
    uint64_t v77 = *(void *)v96;
    uint64_t v39 = @"values";
    do
    {
      for (uint64_t k = 0; k != v85; ++k)
      {
        if (*(void *)v96 != v77) {
          objc_enumerationMutation(v38);
        }
        uint64_t v41 = *(void *)(*((void *)&v95 + 1) + 8 * k);
        id v42 = (void *)MEMORY[0x1A6232D90]();
        uint64_t v43 = [v38 objectForKeyedSubscript:v41];
        uint64_t v44 = [v81 objectForKeyedSubscript:v41];
        uint64_t v45 = [v43 objectForKeyedSubscript:v39];
        if (v45)
        {
          uint64_t v46 = (void *)v45;
          uint64_t v47 = [v43 objectForKeyedSubscript:v39];
          [v44 objectForKeyedSubscript:@"default"];
          uint64_t v48 = v42;
          uint64_t v49 = v39;
          v51 = id v50 = v38;
          char v89 = [v47 isEqual:v51];

          id v38 = v50;
          uint64_t v39 = v49;
          id v42 = v48;

          if ((v89 & 1) == 0) {
            [v74 setObject:v43 forKeyedSubscript:v41];
          }
        }
      }
      uint64_t v85 = [v38 countByEnumeratingWithState:&v95 objects:v108 count:16];
    }
    while (v85);
  }

  if ([v74 count]) {
    [v68 setObject:v74 forKeyedSubscript:@"intersection"];
  }

  uint64_t v52 = [v70 objectForKeyedSubscript:@"union"];
  long long v82 = [v69 objectForKeyedSubscript:@"union"];
  long long v75 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v52, "count"));
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v53 = v52;
  uint64_t v86 = [v53 countByEnumeratingWithState:&v91 objects:v107 count:16];
  if (v86)
  {
    uint64_t v78 = *(void *)v92;
    uint64_t v54 = @"values";
    do
    {
      for (uint64_t m = 0; m != v86; ++m)
      {
        if (*(void *)v92 != v78) {
          objc_enumerationMutation(v53);
        }
        uint64_t v56 = *(void *)(*((void *)&v91 + 1) + 8 * m);
        id v57 = (void *)MEMORY[0x1A6232D90]();
        uint64_t v58 = [v53 objectForKeyedSubscript:v56];
        uint64_t v59 = [v82 objectForKeyedSubscript:v56];
        uint64_t v60 = [v58 objectForKeyedSubscript:v54];
        if (v60)
        {
          uint64_t v61 = (void *)v60;
          uint64_t v62 = [v58 objectForKeyedSubscript:v54];
          [v59 objectForKeyedSubscript:@"default"];
          uint64_t v63 = v57;
          id v64 = v54;
          id v66 = v65 = v53;
          char v90 = [v62 isEqual:v66];

          id v53 = v65;
          uint64_t v54 = v64;
          id v57 = v63;

          if ((v90 & 1) == 0) {
            [v75 setObject:v58 forKeyedSubscript:v56];
          }
        }
      }
      uint64_t v86 = [v53 countByEnumeratingWithState:&v91 objects:v107 count:16];
    }
    while (v86);
  }

  if ([v75 count]) {
    [v68 setObject:v75 forKeyedSubscript:@"union"];
  }

  return v68;
}

+ (id)filterUserSettingsForPublicUse:(id)a3
{
  BOOL v3 = (void *)[a3 mutableCopy];
  [v3 MCSetUnionSetting:@"blacklistedAppBundleIDs" values:0];
  [v3 MCSetUnionSetting:@"blockedAppBundleIDs" values:0];
  [v3 MCSetUnionSetting:@"trustedCodeSigningIdentities" values:0];
  [v3 MCSetIntersectionSetting:@"appLockBundleIDs" values:0];
  [v3 MCSetIntersectionSetting:@"allowedExternalIntelligenceAccountDomains" values:0];
  [v3 MCSetIntersectionSetting:@"allowedExternalIntelligenceWorkspaceIDs" values:0];
  id v4 = (void *)[v3 copy];

  return v4;
}

+ (id)restrictionKeys
{
  if (restrictionKeys_onceToken != -1) {
    dispatch_once(&restrictionKeys_onceToken, &__block_literal_global_35);
  }
  uint64_t v2 = (void *)restrictionKeys_restrictionKeys;
  return v2;
}

void __39__MCRestrictionManager_restrictionKeys__block_invoke()
{
  v2[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"restrictedBool";
  v2[1] = @"restrictedValue";
  v2[2] = @"intersection";
  v2[3] = @"union";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:4];
  v1 = (void *)restrictionKeys_restrictionKeys;
  restrictionKeys_restrictionKeys = v0;
}

+ (id)systemMetadataValueForKey:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9B8];
  id v5 = MCSystemMetadataFilePath();
  id v6 = [v4 MCDataFromFile:v5];

  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v7 = [MEMORY[0x1E4F28F98] MCSafePropertyListWithData:v6 options:0 format:0 error:0];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

LABEL_5:
      uint64_t v7 = 0;
    }
  }
  id v8 = [v7 objectForKeyedSubscript:v3];

  return v8;
}

+ (id)filterGrandfatheredRestrictionsIfNeededFromRestrictions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 systemMetadataValueForKey:@"StopFilteringGrandfatheredRestrictions"];
  char v6 = [v5 BOOLValue];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = +[MCRestrictionManager allowedGrandfatheredRestrictionPayloadKeysDictionary];
    id v8 = +[MCRestrictionManager grandfatheredRestrictionPayloadKeysDictionary];
    uint64_t v9 = [v7 count];
    uint64_t v10 = _MCLogObjects;
    BOOL v11 = os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_DEFAULT, "Honor only allowed grandfathered restrictions", (uint8_t *)&v17, 2u);
      }
      id v12 = +[MCRestrictionManager filterRestrictionPayloadKeysDictionary:v8 removingPayloadKeysInRestrictionPayloadKeysDictionary:v7];
    }
    else
    {
      if (v11)
      {
        uint64_t v13 = v10;
        int v17 = 138412546;
        uint64_t v18 = @"NO";
        __int16 v19 = 2048;
        uint64_t v20 = [v7 count];
        _os_log_impl(&dword_1A13F0000, v13, OS_LOG_TYPE_DEFAULT, "Don't honor deprecated unsupervised restrictions, stopFilteringGrandfatheredRestrictions: %@, allowedGrandfatheredRestrictionPayloadKeys count: %lu", (uint8_t *)&v17, 0x16u);
      }
      id v12 = v8;
    }
    uint64_t v14 = v12;
    if (v12)
    {
      id v15 = +[MCRestrictionManager filterRestrictionDictionary:v4 removingPayloadKeysInRestrictionPayloadKeysDictionary:v12];

      goto LABEL_13;
    }
  }
  id v15 = v4;
LABEL_13:

  return v15;
}

+ (id)allowedGrandfatheredRestrictionPayloadKeysDictionary
{
  uint64_t v2 = [a1 systemMetadataValueForKey:@"AllowedGrandfatheredRestrictions"];
  if (![v2 count])
  {
    id v3 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1A13F0000, v3, OS_LOG_TYPE_DEFAULT, "No flagged grandfathered restrictions set on the device.", v5, 2u);
    }
  }
  return v2;
}

+ (id)effectiveGrandfatheredRestrictionPayloadKeysDictionary
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = objc_msgSend(a1, "restrictionKeys", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = +[MCRestrictionManager grandfatheredRestrictionPayloadKeysDictionary];
        BOOL v11 = [a1 _lockedDownRestrictionPayloadKeysWithPayloadKeysDictionary:v10 forRestrictionKey:v9];
        [v3 setObject:v11 forKeyedSubscript:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v6);
  }

  if ([v3 count])
  {
    id v12 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = v12;
      uint64_t v14 = [v3 description];
      *(_DWORD *)buf = 138412290;
      int v22 = v14;
      _os_log_impl(&dword_1A13F0000, v13, OS_LOG_TYPE_DEFAULT, "Locked down deprecated unsupervised restrictions: %@\n", buf, 0xCu);
    }
    id v15 = (void *)[v3 copy];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

+ (id)_lockedDownRestrictionPayloadKeysWithPayloadKeysDictionary:(id)a3 forRestrictionKey:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  uint64_t v21 = v6;
  uint64_t v9 = [v6 objectForKeyedSubscript:v7];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v15 = [a1 sharedManager];
        int v16 = [v15 isSettingLockedDownByRestrictions:v14];

        if (v16)
        {
          uint64_t v17 = [a1 _payloadKeysDictionaryAfterAddingFeature:v14 toRestrictionPayloadKeysDictionary:v8 forRestrictionKey:v7];

          id v8 = (void *)v17;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }
  if ([v8 count])
  {
    long long v18 = [v8 objectForKeyedSubscript:v7];
    long long v19 = (void *)[v18 copy];
  }
  else
  {
    long long v19 = 0;
  }

  return v19;
}

+ (id)_payloadKeysDictionaryAfterAddingFeature:(id)a3 toRestrictionPayloadKeysDictionary:(id)a4 forRestrictionKey:(id)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_opt_new();
  if ([v8 count])
  {
    uint64_t v11 = (void *)[v8 mutableCopy];

    uint64_t v12 = [v11 objectForKeyedSubscript:v9];

    if (v12)
    {
      uint64_t v13 = [v11 objectForKeyedSubscript:v9];
      uint64_t v14 = (void *)[v13 mutableCopy];
    }
    else
    {
      uint64_t v14 = objc_opt_new();
    }
    if (([v14 containsObject:v7] & 1) == 0) {
      [v14 addObject:v7];
    }
    uint64_t v17 = (void *)[v14 copy];
    [v11 setObject:v17 forKeyedSubscript:v9];

    int v16 = (void *)[v11 copy];
  }
  else
  {
    v19[0] = v7;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    [v10 setObject:v15 forKeyedSubscript:v9];

    int v16 = (void *)[v10 copy];
    uint64_t v11 = v10;
  }

  return v16;
}

+ (id)grandfatheredRestrictionPayloadKeysDictionary
{
  if (grandfatheredRestrictionPayloadKeysDictionary_onceToken != -1) {
    dispatch_once(&grandfatheredRestrictionPayloadKeysDictionary_onceToken, &__block_literal_global_44_1);
  }
  uint64_t v2 = (void *)grandfatheredRestrictionPayloadKeysDictionary_grandfatheredRestrictionPayloadKeysDictionary;
  return v2;
}

void __69__MCRestrictionManager_grandfatheredRestrictionPayloadKeysDictionary__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1C9E8];
  MCGetBaseResourcePath();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v1 = [v5 stringByAppendingPathComponent:@"deprecatedUnsupervisedRestrictionPayloadKeys.plist"];
  uint64_t v2 = [v0 MCDictionaryFromFile:v1];
  uint64_t v3 = [v2 mutableCopy];
  id v4 = (void *)grandfatheredRestrictionPayloadKeysDictionary_grandfatheredRestrictionPayloadKeysDictionary;
  grandfatheredRestrictionPayloadKeysDictionary_grandfatheredRestrictionPayloadKeysDictionary = v3;
}

+ (id)_filterRestrictionDictionary:(id)a3 removingPayloadKeysInRestrictionPayloadKeysDictionary:(id)a4 forRestrictionKey:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v23 = (void *)[v7 mutableCopy];
  uint64_t v26 = v7;
  uint64_t v10 = [v7 objectForKeyedSubscript:v9];
  long long v24 = v9;
  long long v25 = v8;
  uint64_t v11 = [v8 objectForKeyedSubscript:v9];
  uint64_t v12 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        long long v19 = [v13 objectForKeyedSubscript:v18];
        if ([v11 containsObject:v18])
        {
          long long v20 = _MCLogObjects;
          if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v32 = v18;
            _os_log_impl(&dword_1A13F0000, v20, OS_LOG_TYPE_DEFAULT, "Filter out the following restriction: %@", buf, 0xCu);
          }
        }
        else
        {
          [v12 setObject:v19 forKeyedSubscript:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v15);
  }

  [v23 setObject:v12 forKeyedSubscript:v24];
  uint64_t v21 = (void *)[v23 copy];

  return v21;
}

+ (id)filterRestrictionDictionary:(id)a3 removingPayloadKeysInRestrictionPayloadKeysDictionary:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)[a3 copy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = objc_msgSend(a1, "restrictionKeys", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      id v13 = v7;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v7 = [(id)objc_opt_class() _filterRestrictionDictionary:v13 removingPayloadKeysInRestrictionPayloadKeysDictionary:v6 forRestrictionKey:*(void *)(*((void *)&v16 + 1) + 8 * v12)];

        ++v12;
        id v13 = v7;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  uint64_t v14 = (void *)[v7 copy];
  return v14;
}

+ (id)_filterRestrictionPayloadKeysDictionary:(id)a3 removingPayloadKeysInRestrictionPayloadKeysDictionary:(id)a4 forRestrictionKey:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 objectForKeyedSubscript:v9];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    uint64_t v12 = [v7 objectForKeyedSubscript:v9];
    id v13 = (void *)[v12 mutableCopy];

    uint64_t v14 = [v8 objectForKeyedSubscript:v9];
    uint64_t v15 = (void *)[v7 mutableCopy];
    [v13 removeObjectsInArray:v14];
    long long v16 = (void *)[v13 copy];
    [v15 setObject:v16 forKeyedSubscript:v9];

    id v17 = (id)[v15 copy];
  }
  else
  {
    id v17 = v7;
  }

  return v17;
}

+ (id)filterRestrictionPayloadKeysDictionary:(id)a3 removingPayloadKeysInRestrictionPayloadKeysDictionary:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)[a3 copy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = objc_msgSend(a1, "restrictionKeys", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      id v13 = v7;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v7 = [a1 _filterRestrictionPayloadKeysDictionary:v13 removingPayloadKeysInRestrictionPayloadKeysDictionary:v6 forRestrictionKey:*(void *)(*((void *)&v16 + 1) + 8 * v12)];

        ++v12;
        id v13 = v7;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  uint64_t v14 = (void *)[v7 copy];
  return v14;
}

+ (id)_addRestrictionPayloadKeysDictionary:(id)a3 toRestrictionPayloadKeysDictionary:(id)a4 forRestrictionKey:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_opt_new();
  if ([v8 count])
  {
    uint64_t v11 = [v8 mutableCopy];

    uint64_t v10 = (void *)v11;
  }
  uint64_t v12 = [v7 objectForKeyedSubscript:v9];
  id v13 = (void *)[v12 copy];

  uint64_t v14 = [v8 objectForKeyedSubscript:v9];
  if ([v14 count])
  {
    id v25 = v7;
    uint64_t v15 = (void *)[v14 mutableCopy];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v24 = v13;
    id v16 = v13;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          if ((objc_msgSend(v15, "containsObject:", v21, v24) & 1) == 0) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v18);
    }

    [v10 setObject:v15 forKeyedSubscript:v9];
    id v13 = v24;
    id v7 = v25;
  }
  else
  {
    [v10 setObject:v13 forKeyedSubscript:v9];
  }
  long long v22 = objc_msgSend(v10, "copy", v24);

  return v22;
}

+ (id)addRestrictionPayloadKeysDictionary:(id)a3 toRestrictionPayloadKeysDictionary:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)[a4 MCDeepCopy];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = objc_msgSend(a1, "restrictionKeys", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      id v13 = v7;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        id v7 = [a1 _addRestrictionPayloadKeysDictionary:v6 toRestrictionPayloadKeysDictionary:v13 forRestrictionKey:*(void *)(*((void *)&v19 + 1) + 8 * v12)];

        ++v12;
        id v13 = v7;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v10);
  }

  uint64_t v14 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = v14;
    id v16 = [v7 description];
    *(_DWORD *)buf = 138412290;
    long long v24 = v16;
    _os_log_impl(&dword_1A13F0000, v15, OS_LOG_TYPE_DEFAULT, "Union Dictionary in the abstract: %@\n", buf, 0xCu);
  }
  uint64_t v17 = (void *)[v7 copy];

  return v17;
}

- (id)valueForFeature:(id)a3
{
  id v4 = a3;
  id v5 = [(MCRestrictionManager *)self currentRestrictions];
  id v6 = +[MCRestrictionManager valueForFeature:v4 withRestrictionsDictionary:v5];

  return v6;
}

- (id)objectForFeature:(id)a3
{
  id v4 = a3;
  id v5 = [(MCRestrictionManager *)self currentRestrictions];
  id v6 = +[MCRestrictionManager objectForFeature:v4 withRestrictionsDictionary:v5];

  return v6;
}

- (id)intersectedValuesForFeature:(id)a3
{
  id v4 = a3;
  id v5 = [(MCRestrictionManager *)self currentRestrictions];
  id v6 = +[MCRestrictionManager intersectedValuesForFeature:v4 withRestrictionsDictionary:v5];

  return v6;
}

+ (id)objectForFeature:(id)a3 withRestrictionsDictionary:(id)a4
{
  id v5 = a3;
  id v6 = [a4 objectForKey:@"assignedObject"];
  id v7 = [v6 objectForKey:v5];

  return v7;
}

+ (BOOL)restrictedBool:(id)a3 changedBetweenOldRestrictions:(id)a4 andNewRestrictions:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = [a4 objectForKey:@"restrictedBool"];
  uint64_t v10 = [v9 objectForKey:v8];
  uint64_t v11 = [v10 objectForKey:@"value"];

  uint64_t v12 = [v7 objectForKey:@"restrictedBool"];

  id v13 = [v12 objectForKey:v8];

  uint64_t v14 = [v13 objectForKey:@"value"];

  if (v11 | v14)
  {
    if ((v11 != 0) != (v14 != 0)) {
      LOBYTE(v15) = 1;
    }
    else {
      int v15 = [(id)v11 isEqualToNumber:v14] ^ 1;
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

+ (BOOL)restrictedValue:(id)a3 changedBetweenOldRestrictions:(id)a4 andNewRestrictions:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = [a4 objectForKey:@"restrictedValue"];
  uint64_t v10 = [v9 objectForKey:v8];
  uint64_t v11 = [v10 objectForKey:@"value"];

  uint64_t v12 = [v7 objectForKey:@"restrictedValue"];

  id v13 = [v12 objectForKey:v8];

  uint64_t v14 = [v13 objectForKey:@"value"];

  if (v11 | v14)
  {
    if ((v11 != 0) != (v14 != 0)) {
      LOBYTE(v15) = 1;
    }
    else {
      int v15 = [(id)v11 isEqualToNumber:v14] ^ 1;
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

+ (BOOL)intersectedValuesForFeature:(id)a3 changedBetweenOldRestrictions:(id)a4 andNewRestrictions:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = [a4 objectForKey:@"intersection"];
  uint64_t v10 = [v9 objectForKey:v8];
  uint64_t v11 = [v10 objectForKey:@"values"];

  uint64_t v12 = [v7 objectForKey:@"intersection"];

  id v13 = [v12 objectForKey:v8];

  uint64_t v14 = [v13 objectForKey:@"values"];

  if (v11 | v14)
  {
    if ((v11 != 0) != (v14 != 0)) {
      LOBYTE(v15) = 1;
    }
    else {
      int v15 = [(id)v11 isEqualToArray:v14] ^ 1;
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

+ (BOOL)unionValuesForFeature:(id)a3 changedBetweenOldRestrictions:(id)a4 andNewRestrictions:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = [a4 objectForKeyedSubscript:@"union"];
  uint64_t v10 = [v9 objectForKeyedSubscript:v8];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"values"];

  uint64_t v12 = [v7 objectForKeyedSubscript:@"union"];

  id v13 = [v12 objectForKeyedSubscript:v8];

  uint64_t v14 = [v13 objectForKeyedSubscript:@"values"];

  if (v11 | v14)
  {
    if ((v11 != 0) != (v14 != 0)) {
      LOBYTE(v15) = 1;
    }
    else {
      int v15 = [(id)v11 isEqualToArray:v14] ^ 1;
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (id)systemClientRestrictions
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__14;
  uint64_t v11 = __Block_byref_object_dispose__14;
  id v12 = 0;
  uint64_t v3 = [(MCRestrictionManager *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__MCRestrictionManager_systemClientRestrictions__block_invoke;
  v6[3] = &unk_1E5A65D90;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __48__MCRestrictionManager_systemClientRestrictions__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) memberQueueSystemClientRestrictions];
  return MEMORY[0x1F41817F8]();
}

- (id)userClientRestrictions
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__14;
  uint64_t v11 = __Block_byref_object_dispose__14;
  id v12 = 0;
  uint64_t v3 = [(MCRestrictionManager *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__MCRestrictionManager_userClientRestrictions__block_invoke;
  v6[3] = &unk_1E5A65D90;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __46__MCRestrictionManager_userClientRestrictions__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) memberQueueUserClientRestrictions];
  return MEMORY[0x1F41817F8]();
}

- (id)clientRestrictionsForClientUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__14;
  id v16 = __Block_byref_object_dispose__14;
  id v17 = 0;
  id v5 = [(MCRestrictionManager *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MCRestrictionManager_clientRestrictionsForClientUUID___block_invoke;
  block[3] = &unk_1E5A679B8;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __56__MCRestrictionManager_clientRestrictionsForClientUUID___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) memberQueueClientRestrictionsForClientUUID:*(void *)(a1 + 40)];
  return MEMORY[0x1F41817F8]();
}

- (id)memberQueueUserInfoForClientUUID:(id)a3
{
  uint64_t v3 = [(MCRestrictionManager *)self memberQueueClientRestrictionsDictionaryForClientUUID:a3];
  id v4 = [v3 objectForKey:@"userInfo"];

  return v4;
}

- (id)userInfoForClientUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__14;
  id v16 = __Block_byref_object_dispose__14;
  id v17 = 0;
  id v5 = [(MCRestrictionManager *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MCRestrictionManager_userInfoForClientUUID___block_invoke;
  block[3] = &unk_1E5A679B8;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __46__MCRestrictionManager_userInfoForClientUUID___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) memberQueueUserInfoForClientUUID:*(void *)(a1 + 40)];
  return MEMORY[0x1F41817F8]();
}

- (id)memberQueueAppsAndOptionsForClientUUID:(id)a3
{
  uint64_t v3 = [(MCRestrictionManager *)self memberQueueClientRestrictionsDictionaryForClientUUID:a3];
  id v4 = [v3 objectForKey:@"appsAndOptions"];

  return v4;
}

- (id)appsAndOptionsForClientUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__14;
  id v16 = __Block_byref_object_dispose__14;
  id v17 = 0;
  id v5 = [(MCRestrictionManager *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MCRestrictionManager_appsAndOptionsForClientUUID___block_invoke;
  block[3] = &unk_1E5A679B8;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __52__MCRestrictionManager_appsAndOptionsForClientUUID___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) memberQueueAppsAndOptionsForClientUUID:*(void *)(a1 + 40)];
  return MEMORY[0x1F41817F8]();
}

- (id)allClientUUIDsForClientType:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__14;
  id v16 = __Block_byref_object_dispose__14;
  id v17 = [MEMORY[0x1E4F1CA80] set];
  id v5 = [(MCRestrictionManager *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MCRestrictionManager_allClientUUIDsForClientType___block_invoke;
  block[3] = &unk_1E5A67AB0;
  block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __52__MCRestrictionManager_allClientUUIDsForClientType___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) memberQueueSystemClientRestrictions];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        id v8 = [v2 objectForKey:v7];
        uint64_t v9 = [v8 objectForKey:@"clientType"];
        int v10 = [v9 isEqualToString:*(void *)(a1 + 40)];

        if (v10) {
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v4);
  }
  long long v20 = v2;
  uint64_t v11 = [*(id *)(a1 + 32) memberQueueUserClientRestrictions];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * j);
        id v17 = [v11 objectForKey:v16];
        uint64_t v18 = [v17 objectForKey:@"clientType"];
        int v19 = [v18 isEqualToString:*(void *)(a1 + 40)];

        if (v19) {
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v13);
  }
}

- (id)exchangeUUIDsRestrictingSettings:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v6 = [(MCRestrictionManager *)self effectiveUserSettings];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __57__MCRestrictionManager_exchangeUUIDsRestrictingSettings___block_invoke;
  uint64_t v18 = &unk_1E5A68B80;
  id v19 = v4;
  long long v20 = self;
  id v21 = v6;
  id v7 = v5;
  id v22 = v7;
  id v8 = v6;
  id v9 = v4;
  int v10 = (void *)MEMORY[0x1A6232FE0](&v15);
  uint64_t v11 = [(MCRestrictionManager *)self systemClientRestrictions];
  uint64_t v12 = [(MCRestrictionManager *)self userClientRestrictions];
  [v11 enumerateKeysAndObjectsUsingBlock:v10];
  [v12 enumerateKeysAndObjectsUsingBlock:v10];
  id v13 = v7;

  return v13;
}

void __57__MCRestrictionManager_exchangeUUIDsRestrictingSettings___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  [a3 objectForKey:@"clientRestrictions"];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v35;
    id v28 = v5;
    id v27 = v6;
    uint64_t v24 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [v6 objectForKey:*(void *)(*((void *)&v34 + 1) + 8 * i)];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        obuint64_t j = a1[4];
        uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v31;
          uint64_t v25 = i;
          uint64_t v26 = v8;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v31 != v14) {
                objc_enumerationMutation(obj);
              }
              uint64_t v16 = *(void *)(*((void *)&v30 + 1) + 8 * j);
              id v17 = [v11 objectForKey:v16];
              if (v17)
              {
                if ([a1[5] _isBoolSettingLockedDown:v17]) {
                  goto LABEL_23;
                }
                id v18 = a1[5];
                id v19 = [a1[6] objectForKey:@"restrictedValue"];
                long long v20 = [v19 objectForKey:v16];
                if ([v18 _isValueSettingLockedDown:v17 effectiveSetting:v20]) {
                  goto LABEL_22;
                }
                id v21 = [a1[5] _effectiveIntersectedValuesForSetting:v16 effectiveUserSettings:a1[6]];
                if (v21)
                {

LABEL_22:
LABEL_23:
                  long long v23 = _MCLogObjects;
                  id v5 = v28;
                  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543618;
                    id v39 = v28;
                    __int16 v40 = 2114;
                    uint64_t v41 = v16;
                    _os_log_impl(&dword_1A13F0000, v23, OS_LOG_TYPE_DEBUG, "Exchange UUID %{public}@ matched for %{public}@", buf, 0x16u);
                  }
                  [a1[7] addObject:v28];

                  id v6 = v27;
                  goto LABEL_26;
                }
                id v22 = [a1[5] _effectiveUnionValuesForSetting:v16 effectiveUserSettings:a1[6]];

                if (v22) {
                  goto LABEL_23;
                }
              }
            }
            uint64_t v13 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
            id v6 = v27;
            id v5 = v28;
            uint64_t v9 = v24;
            uint64_t i = v25;
            uint64_t v8 = v26;
            if (v13) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v8);
  }
LABEL_26:
}

- (id)_updatedDomainSettingsEvents:(id)a3 fromPreviousSettings:(id)a4 toNewSettings:(id)a5 sender:(id)a6
{
  uint64_t v11 = (void *)MEMORY[0x1E4F1CC08];
  if (a4) {
    id v12 = a4;
  }
  else {
    id v12 = (id)MEMORY[0x1E4F1CC08];
  }
  id v13 = v12;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [v13 MCDictionaryAdditiveDeltaToCreateDictionary:v15];
  id v19 = [v13 MCDictionarySubtractiveDeltaToCreateDictionary:v15];

  if (v17) {
    long long v20 = v17;
  }
  else {
    long long v20 = v11;
  }
  id v21 = v20;
  id v22 = [(MCRestrictionManager *)self _settingsEventFromProcess:v14 withTag:@"set"];
  long long v23 = [v21 MCInsertedKeysFromDictionary:v18 withNewLeafValue:v22];

  uint64_t v24 = [(MCRestrictionManager *)self _settingsEventFromProcess:v14 withTag:@"remove"];

  uint64_t v25 = [v23 MCInsertedKeysFromDictionary:v19 withNewLeafValue:v24];

  return v25;
}

- (id)_settingsEventFromProcess:(id)a3 withTag:(id)a4
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v5 = @"unknown";
  if (a3) {
    id v5 = (__CFString *)a3;
  }
  v13[0] = v5;
  v12[0] = @"process";
  v12[1] = @"timestamp";
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 date];
  v12[2] = @"event";
  v13[1] = v9;
  v13[2] = v7;
  int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

- (NSDictionary)userUserSettings
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int v10 = __Block_byref_object_copy__14;
  uint64_t v11 = __Block_byref_object_dispose__14;
  id v12 = 0;
  uint64_t v3 = [(MCRestrictionManager *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__MCRestrictionManager_userUserSettings__block_invoke;
  v6[3] = &unk_1E5A65D90;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

uint64_t __40__MCRestrictionManager_userUserSettings__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) memberQueueUserUserSettings];
  return MEMORY[0x1F41817F8]();
}

- (id)effectiveParametersForBoolSetting:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(MCRestrictionManager *)self effectiveUserSettings];
  uint64_t v7 = [v5 parametersForBoolSetting:v4 withUserSettingDictionary:v6];

  return v7;
}

- (id)valueSettingForFeature:(id)a3
{
  id v4 = a3;
  id v5 = [(MCRestrictionManager *)self userSettings];
  id v6 = +[MCRestrictionManager valueSettingForFeature:v4 withUserSettingDictionary:v5];

  return v6;
}

- (id)intersectedValuesSettingForFeature:(id)a3
{
  id v4 = a3;
  id v5 = [(MCRestrictionManager *)self userSettings];
  id v6 = +[MCRestrictionManager intersectedValuesSettingForFeature:v4 withUserSettingDectionary:v5];

  return v6;
}

- (id)unionValuesSettingForFeature:(id)a3
{
  id v4 = a3;
  id v5 = [(MCRestrictionManager *)self userSettings];
  id v6 = +[MCRestrictionManager unionValuesSettingForFeature:v4 withUserSettingDictionary:v5];

  return v6;
}

- (id)effectiveValueForSetting:(id)a3
{
  uint64_t v3 = [(MCRestrictionManager *)self effectiveParametersForValueSetting:a3];
  id v4 = [v3 objectForKey:@"value"];

  return v4;
}

- (id)_effectiveIntersectedValuesForSetting:(id)a3 effectiveUserSettings:(id)a4
{
  id v5 = a3;
  id v6 = [a4 objectForKey:@"intersection"];
  uint64_t v7 = [v6 objectForKey:v5];

  id v8 = [v7 objectForKey:@"values"];

  return v8;
}

- (id)_effectiveUnionValuesForSetting:(id)a3 effectiveUserSettings:(id)a4
{
  id v5 = a3;
  id v6 = [a4 objectForKey:@"union"];
  uint64_t v7 = [v6 objectForKey:v5];

  id v8 = [v7 objectForKey:@"values"];

  return v8;
}

- (id)profileIdentifiersRestrictingSettings:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v6 = objc_opt_new();
  uint64_t v7 = [(MCRestrictionManager *)self systemProfileRestrictions];
  [v6 addEntriesFromDictionary:v7];

  id v8 = [(MCRestrictionManager *)self userProfileRestrictions];
  [v6 addEntriesFromDictionary:v8];

  uint64_t v9 = [(MCRestrictionManager *)self effectiveUserSettings];
  int v10 = +[MCManifest sharedManifest];
  uint64_t v11 = [v10 identifiersOfProfilesWithFilterFlags:2];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __62__MCRestrictionManager_profileIdentifiersRestrictingSettings___block_invoke;
  v18[3] = &unk_1E5A68BD0;
  id v19 = v4;
  long long v20 = self;
  id v21 = v9;
  id v22 = v11;
  id v23 = v5;
  id v12 = v5;
  id v13 = v11;
  id v14 = v9;
  id v15 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v18];
  id v16 = (void *)[v12 copy];

  return v16;
}

void __62__MCRestrictionManager_profileIdentifiersRestrictingSettings___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v41;
    id v34 = v7;
    id v33 = v8;
    uint64_t v30 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [v8 objectForKey:*(void *)(*((void *)&v40 + 1) + 8 * i)];
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        obuint64_t j = a1[4];
        uint64_t v14 = [obj countByEnumeratingWithState:&v36 objects:v48 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v37;
          uint64_t v31 = i;
          uint64_t v32 = v10;
          while (2)
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v37 != v16) {
                objc_enumerationMutation(obj);
              }
              uint64_t v18 = *(void *)(*((void *)&v36 + 1) + 8 * j);
              id v19 = [v13 objectForKey:v18];
              if (v19)
              {
                if ([a1[5] _isBoolSettingLockedDown:v19]) {
                  goto LABEL_23;
                }
                id v20 = a1[5];
                id v21 = [a1[6] objectForKey:@"restrictedValue"];
                id v22 = [v21 objectForKey:v18];
                if ([v20 _isValueSettingLockedDown:v19 effectiveSetting:v22]) {
                  goto LABEL_22;
                }
                id v23 = [a1[5] _effectiveIntersectedValuesForSetting:v18 effectiveUserSettings:a1[6]];
                if (v23)
                {

LABEL_22:
LABEL_23:
                  uint64_t v25 = _MCLogObjects;
                  id v7 = v34;
                  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543618;
                    id v45 = v34;
                    __int16 v46 = 2114;
                    uint64_t v47 = v18;
                    _os_log_impl(&dword_1A13F0000, v25, OS_LOG_TYPE_DEBUG, "Profile %{public}@ matched for %{public}@", buf, 0x16u);
                  }
                  uint64_t v26 = +[MCDependencyReader sharedReader];
                  id v27 = [v26 dependentsOfParent:v34 inDomain:@"ManagedProfileToManagingProfile"];
                  if (([a1[7] containsObject:v34] & 1) == 0)
                  {
                    if (v27 && [v27 count])
                    {
                      id v28 = a1[8];
                      long long v29 = [v27 firstObject];
                      [v28 addObject:v29];
                    }
                    else
                    {
                      [a1[8] addObject:v34];
                    }
                  }

                  id v8 = v33;
                  goto LABEL_31;
                }
                uint64_t v24 = [a1[5] _effectiveUnionValuesForSetting:v18 effectiveUserSettings:a1[6]];

                if (v24) {
                  goto LABEL_23;
                }
              }
            }
            uint64_t v15 = [obj countByEnumeratingWithState:&v36 objects:v48 count:16];
            id v8 = v33;
            id v7 = v34;
            uint64_t v11 = v30;
            uint64_t i = v31;
            uint64_t v10 = v32;
            if (v15) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v10);
  }
LABEL_31:
}

- (BOOL)isSettingLockedDownByRestrictions:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MCRestrictionManager *)self isBoolSettingLockedDownByRestrictions:v4]|| [(MCRestrictionManager *)self isValueSettingLockedDownByRestrictions:v4]|| [(MCRestrictionManager *)self isIntersectionSettingLockedDownByRestrictions:v4]|| [(MCRestrictionManager *)self isUnionSettingLockedDownByRestrictions:v4];

  return v5;
}

- (BOOL)_isValueSettingLockedDown:(id)a3 effectiveSetting:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  BOOL v7 = 0;
  if (a3 && v5)
  {
    id v8 = a3;
    uint64_t v9 = [v8 objectForKey:@"value"];
    uint64_t v10 = [v8 objectForKey:@"preferSmallerValues"];

    if (v9) {
      BOOL v11 = v10 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      BOOL v7 = 0;
LABEL_18:

      goto LABEL_19;
    }
    if ([v10 BOOLValue])
    {
      id v12 = [v6 objectForKey:@"rangeMinimum"];
      id v13 = v12;
      if (!v12 || [v12 compare:v9] == -1)
      {
LABEL_15:
        BOOL v7 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v14 = [v6 objectForKey:@"rangeMaximum"];
      id v13 = v14;
      if (!v14 || [v14 compare:v9] == 1) {
        goto LABEL_15;
      }
    }
    BOOL v7 = 1;
    goto LABEL_17;
  }
LABEL_19:

  return v7;
}

- (BOOL)isValueSettingLockedDownByRestrictions:(id)a3
{
  id v4 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__14;
  uint64_t v26 = __Block_byref_object_dispose__14;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__14;
  id v20 = __Block_byref_object_dispose__14;
  id v21 = 0;
  id v5 = [(MCRestrictionManager *)self memberQueue];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __63__MCRestrictionManager_isValueSettingLockedDownByRestrictions___block_invoke;
  BOOL v11 = &unk_1E5A68BF8;
  uint64_t v14 = &v22;
  id v12 = self;
  id v6 = v4;
  id v13 = v6;
  uint64_t v15 = &v16;
  dispatch_sync(v5, &v8);

  LOBYTE(self) = -[MCRestrictionManager _isValueSettingLockedDown:effectiveSetting:](self, "_isValueSettingLockedDown:effectiveSetting:", v23[5], v17[5], v8, v9, v10, v11, v12);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return (char)self;
}

void __63__MCRestrictionManager_isValueSettingLockedDownByRestrictions___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) memberQueueRestrictions];
  uint64_t v3 = [v2 objectForKey:@"restrictedValue"];
  id v4 = [v3 objectForKey:*(void *)(a1 + 40)];
  uint64_t v5 = [v4 copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v13 = [*(id *)(a1 + 32) memberQueueEffectiveUserSettings];
  uint64_t v8 = [v13 objectForKey:@"restrictedValue"];
  uint64_t v9 = [v8 objectForKey:*(void *)(a1 + 40)];
  uint64_t v10 = [v9 copy];
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (BOOL)isIntersectionSettingLockedDownByRestrictions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MCRestrictionManager *)self currentRestrictions];
  uint64_t v6 = [v5 objectForKey:@"intersection"];
  BOOL v7 = [v6 objectForKey:v4];

  uint64_t v8 = [v7 objectForKey:@"overrideUserSettings"];
  LODWORD(v6) = [v8 BOOLValue];

  if (v6)
  {
    uint64_t v9 = [v7 objectForKey:@"values"];
    BOOL v10 = v9 != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)isUnionSettingLockedDownByRestrictions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MCRestrictionManager *)self currentRestrictions];
  uint64_t v6 = [v5 objectForKey:@"union"];
  BOOL v7 = [v6 objectForKey:v4];

  uint64_t v8 = [v7 objectForKey:@"overrideUserSettings"];
  LODWORD(v6) = [v8 BOOLValue];

  if (v6)
  {
    uint64_t v9 = [v7 objectForKey:@"values"];
    BOOL v10 = v9 != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (int)appWhitelistState
{
  uint64_t v3 = [(MCRestrictionManager *)self effectiveUserSettings];
  id v4 = [(MCRestrictionManager *)self currentRestrictions];
  int v5 = +[MCRestrictionManager appWhitelistStateWithSettingsDictionary:v3 restrictionsDictionary:v4];

  return v5;
}

+ (id)defaultSettings
{
  uint64_t v2 = +[MCHacks sharedHacks];
  uint64_t v3 = [v2 _deviceSpecificDefaultSettings];

  return v3;
}

+ (id)defaultParametersForBoolSetting:(id)a3
{
  id v4 = a3;
  int v5 = [a1 defaultSettings];
  uint64_t v6 = [v5 objectForKey:@"restrictedBool"];
  BOOL v7 = [v6 objectForKey:v4];

  return v7;
}

+ (id)defaultParametersForValueSetting:(id)a3
{
  id v4 = a3;
  int v5 = [a1 defaultSettings];
  uint64_t v6 = [v5 objectForKey:@"restrictedValue"];
  BOOL v7 = [v6 objectForKey:v4];

  return v7;
}

+ (id)defaultParametersForIntersectedValuesSetting:(id)a3
{
  id v4 = a3;
  int v5 = [a1 defaultSettings];
  uint64_t v6 = [v5 objectForKey:@"intersection"];
  BOOL v7 = [v6 objectForKey:v4];

  return v7;
}

+ (id)defaultParametersForUnionValuesSetting:(id)a3
{
  id v4 = a3;
  int v5 = [a1 defaultSettings];
  uint64_t v6 = [v5 objectForKey:@"union"];
  BOOL v7 = [v6 objectForKey:v4];

  return v7;
}

+ (int)defaultBoolValueForSetting:(id)a3
{
  return [a1 defaultBoolValueForSetting:a3 outAsk:0];
}

+ (int)defaultBoolValueForSetting:(id)a3 outAsk:(BOOL *)a4
{
  id v6 = a3;
  BOOL v7 = [a1 defaultSettings];
  LODWORD(a4) = [a1 BOOLSettingForFeature:v6 outAsk:a4 withUserSettingDictionary:v7];

  return (int)a4;
}

+ (id)defaultValueForSetting:(id)a3
{
  id v4 = a3;
  int v5 = [a1 defaultSettings];
  id v6 = [v5 objectForKey:@"restrictedValue"];
  BOOL v7 = [v6 objectForKey:v4];

  uint64_t v8 = [v7 objectForKey:@"value"];

  return v8;
}

+ (id)maximumValueForSetting:(id)a3
{
  id v4 = a3;
  int v5 = [a1 defaultSettings];
  id v6 = [v5 objectForKey:@"restrictedValue"];
  BOOL v7 = [v6 objectForKey:v4];

  uint64_t v8 = [v7 objectForKey:@"rangeMaximum"];

  return v8;
}

+ (id)minimumValueForSetting:(id)a3
{
  id v4 = a3;
  int v5 = [a1 defaultSettings];
  id v6 = [v5 objectForKey:@"restrictedValue"];
  BOOL v7 = [v6 objectForKey:v4];

  uint64_t v8 = [v7 objectForKey:@"rangeMinimum"];

  return v8;
}

+ (id)defaultIntersectedValuesForSetting:(id)a3
{
  id v4 = a3;
  int v5 = [a1 defaultSettings];
  id v6 = [v5 objectForKey:@"intersection"];
  BOOL v7 = [v6 objectForKey:v4];

  uint64_t v8 = [v7 objectForKey:@"values"];

  return v8;
}

+ (id)defaultUnionValuesForSetting:(id)a3
{
  id v4 = a3;
  int v5 = [a1 defaultSettings];
  id v6 = [v5 objectForKey:@"union"];
  BOOL v7 = [v6 objectForKey:v4];

  uint64_t v8 = [v7 objectForKey:@"values"];

  return v8;
}

+ (id)unionValuesSettingForFeature:(id)a3 withUserSettingDictionary:(id)a4
{
  id v5 = a3;
  id v6 = [a4 objectForKey:@"union"];
  BOOL v7 = [v6 objectForKey:v5];

  uint64_t v8 = [v7 objectForKey:@"values"];

  return v8;
}

+ (BOOL)BOOLSetting:(id)a3 valueChangedBetweenOldSettings:(id)a4 andNewSettings:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [v8 objectForKey:@"restrictedBool"];
  uint64_t v11 = [v10 objectForKey:v7];
  uint64_t v12 = [v11 objectForKey:@"value"];

  id v13 = [v9 objectForKey:@"restrictedBool"];
  uint64_t v14 = [v13 objectForKey:v7];
  uint64_t v15 = [v14 objectForKey:@"value"];

  if (v12 | v15)
  {
    if ((v12 != 0) != (v15 != 0))
    {
      LOBYTE(v16) = 1;
    }
    else
    {
      if (v12) {
        BOOL v17 = v15 == 0;
      }
      else {
        BOOL v17 = 1;
      }
      if (!v17 && [(id)v12 BOOLValue] && objc_msgSend((id)v15, "BOOLValue"))
      {
        uint64_t v18 = [v8 objectForKeyedSubscript:@"restrictedBool"];
        id v19 = [v18 objectForKeyedSubscript:v7];
        id v20 = [v19 objectForKeyedSubscript:@"ask"];
        char v25 = [v20 BOOLValue];

        uint64_t v16 = [v9 objectForKeyedSubscript:@"restrictedBool"];
        id v21 = [v16 objectForKeyedSubscript:v7];
        uint64_t v22 = [v21 objectForKeyedSubscript:@"ask"];
        char v23 = [v22 BOOLValue];

        LOBYTE(v16) = v25 ^ v23;
      }
      else
      {
        LODWORD(v16) = [(id)v12 isEqualToNumber:v15] ^ 1;
      }
    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return (char)v16;
}

+ (BOOL)valueSetting:(id)a3 valueChangedBetweenOldSettings:(id)a4 andNewSettings:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [a4 objectForKey:@"restrictedValue"];
  BOOL v10 = [v9 objectForKey:v8];
  uint64_t v11 = [v10 objectForKey:@"value"];

  uint64_t v12 = [v7 objectForKey:@"restrictedValue"];

  id v13 = [v12 objectForKey:v8];

  uint64_t v14 = [v13 objectForKey:@"value"];

  if (v11 | v14)
  {
    if ((v11 != 0) != (v14 != 0)) {
      LOBYTE(v15) = 1;
    }
    else {
      int v15 = [(id)v11 isEqualToNumber:v14] ^ 1;
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

+ (BOOL)intersectedValuesSetting:(id)a3 valueChangedBetweenOldSettings:(id)a4 andNewSettings:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [a4 objectForKey:@"intersection"];
  BOOL v10 = [v9 objectForKey:v8];
  uint64_t v11 = [v10 objectForKey:@"values"];

  uint64_t v12 = [v7 objectForKey:@"intersection"];

  id v13 = [v12 objectForKey:v8];

  uint64_t v14 = [v13 objectForKey:@"values"];

  if (v11 | v14)
  {
    if ((v11 != 0) != (v14 != 0)) {
      LOBYTE(v15) = 1;
    }
    else {
      int v15 = [(id)v11 isEqualToArray:v14] ^ 1;
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

+ (BOOL)unionValuesSetting:(id)a3 valueChangedBetweenOldSettings:(id)a4 andNewSettings:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [a4 objectForKey:@"union"];
  BOOL v10 = [v9 objectForKey:v8];
  uint64_t v11 = [v10 objectForKey:@"values"];

  uint64_t v12 = [v7 objectForKey:@"union"];

  id v13 = [v12 objectForKey:v8];

  uint64_t v14 = [v13 objectForKey:@"values"];

  if (v11 | v14)
  {
    if ((v11 != 0) != (v14 != 0)) {
      LOBYTE(v15) = 1;
    }
    else {
      int v15 = [(id)v11 isEqualToArray:v14] ^ 1;
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (NSArray)memberQueueEffectiveWhitelistedAppsAndOptions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  memberQueueEffectiveWhitelistedAppsAndOptions = self->_memberQueueEffectiveWhitelistedAppsAndOptions;
  if (!memberQueueEffectiveWhitelistedAppsAndOptions)
  {
    id v4 = (void *)MEMORY[0x1E4F1C9B8];
    id v5 = MCSystemEffectiveAppWhitelistFilePath();
    id v6 = [v4 dataWithContentsOfFile:v5];

    if (v6)
    {
      id v12 = 0;
      id v7 = [MEMORY[0x1E4F28F98] MCSafePropertyListWithData:v6 options:0 format:0 error:&v12];
      id v8 = v12;
      id v9 = self->_memberQueueEffectiveWhitelistedAppsAndOptions;
      self->_memberQueueEffectiveWhitelistedAppsAndOptions = v7;

      if (!self->_memberQueueEffectiveWhitelistedAppsAndOptions)
      {
        BOOL v10 = _MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v14 = v8;
          _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_ERROR, "Could not read effective whitelisted apps and options. Error: %{public}@", buf, 0xCu);
        }
      }
    }
    memberQueueEffectiveWhitelistedAppsAndOptions = self->_memberQueueEffectiveWhitelistedAppsAndOptions;
  }
  return memberQueueEffectiveWhitelistedAppsAndOptions;
}

- (void)setMemberQueueEffectiveWhitelistedAppsAndOptions:(id)a3
{
}

+ (BOOL)isInSingleAppModeWithSettingsDictionary:(id)a3
{
  return +[MCRestrictionManager BOOLSettingForFeature:@"allowMultipleAppsInAppLock" withUserSettingDictionary:a3] == 2;
}

+ (BOOL)isSingleAppModeLogoutAllowedWithSettingsDictionary:(id)a3
{
  return +[MCRestrictionManager BOOLSettingForFeature:@"allowAppLockLogout" withUserSettingDictionary:a3] == 1;
}

+ (BOOL)isPasscodeRequiredToAccessWhitelistedAppsWithSettingsDictionary:(id)a3
{
  return +[MCRestrictionManager BOOLSettingForFeature:@"allowAccessWithoutPasscodeInAppLock" withUserSettingDictionary:a3] == 2;
}

+ (BOOL)mayEnterPasscodeToAccessNonWhitelistedAppsWithSettingsDictionary:(id)a3
{
  return +[MCRestrictionManager BOOLSettingForFeature:@"forceGrantSupervisorAccessInAppLock" withUserSettingDictionary:a3] == 1;
}

+ (BOOL)isWhitelistedAppsRestrictionEnforcedWithRestrictionsDictionary:(id)a3
{
  uint64_t v3 = +[MCRestrictionManager intersectedValuesForFeature:@"appLockBundleIDs" withRestrictionsDictionary:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (id)allowedOpenInAppBundleIDsWithOriginalAppBundleIDs:(id)a3 managedAppBundleIDs:(id)a4 localAppBundleID:(id)a5 localAccountIsManaged:(BOOL)a6 mayOpenFromUnmanagedToManaged:(BOOL)a7 mayOpenFromManagedToUnmanaged:(BOOL)a8 isAppBundleIDExemptBlock:(id)a9 isAppBundleIDAccountBasedBlock:(id)a10
{
  BOOL v11 = a7;
  BOOL v29 = a6;
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = (uint64_t (**)(id, id))a9;
  BOOL v17 = (uint64_t (**)(id, id))a10;
  uint64_t v18 = [MEMORY[0x1E4F1CA80] setWithArray:a3];
  id v19 = +[MCRestrictionManager sharedManager];
  id v20 = [v19 restrictedAppBundleIDs];

  if ([v20 count]) {
    [v18 minusSet:v20];
  }
  id v21 = +[MCRestrictionManager sharedManager];
  uint64_t v22 = [v21 effectiveWhitelistedAppBundleIDs];

  if ([v22 count]) {
    [v18 intersectSet:v22];
  }
  char v23 = [MEMORY[0x1E4F1CAD0] setWithArray:v14];
  if ((!v11 || !a8) && (v16[2](v16, v15) & 1) == 0)
  {
    char v24 = v17[2](v17, v15);
    int v25 = v29;
    if ((v24 & 1) == 0) {
      int v25 = [v23 containsObject:v15];
    }
    if (v25 && !a8)
    {
      int v26 = v25;
      [v18 intersectSet:v23];
      int v25 = v26;
    }
    if (((v25 | v11) & 1) == 0) {
      [v18 minusSet:v23];
    }
  }
  id v27 = [v18 allObjects];

  return v27;
}

+ (id)allowedImportFromAppBundleIDsWithOriginalAppBundleIDs:(id)a3 managedAppBundleIDs:(id)a4 localAppBundleID:(id)a5 localAccountIsManaged:(BOOL)a6 mayOpenFromUnmanagedToManaged:(BOOL)a7 mayOpenFromManagedToUnmanaged:(BOOL)a8 isAppBundleIDExemptBlock:(id)a9 isAppBundleIDAccountBasedBlock:(id)a10
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  BOOL v29 = a6;
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = (uint64_t (**)(id, id))a9;
  BOOL v17 = (uint64_t (**)(id, id))a10;
  uint64_t v18 = [MEMORY[0x1E4F1CA80] setWithArray:a3];
  id v19 = +[MCRestrictionManager sharedManager];
  id v20 = [v19 restrictedAppBundleIDs];

  if ([v20 count]) {
    [v18 minusSet:v20];
  }
  id v21 = +[MCRestrictionManager sharedManager];
  uint64_t v22 = [v21 effectiveWhitelistedAppBundleIDs];

  if ([v22 count]) {
    [v18 intersectSet:v22];
  }
  char v23 = [MEMORY[0x1E4F1CAD0] setWithArray:v14];
  if ((!v11 || !v10) && (v16[2](v16, v15) & 1) == 0)
  {
    char v24 = v17[2](v17, v15);
    int v25 = v29;
    if ((v24 & 1) == 0) {
      int v25 = [v23 containsObject:v15];
    }
    if (v25 && !v11)
    {
      int v26 = v25;
      [v18 intersectSet:v23];
      int v25 = v26;
    }
    if (((v25 | v10) & 1) == 0) {
      [v18 minusSet:v23];
    }
  }
  id v27 = [v18 allObjects];

  return v27;
}

+ (id)allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:(id)a3 managedAppBundleIDs:(id)a4 hostAppIsManaged:(BOOL)a5 mayOpenFromUnmanagedToManaged:(BOOL)a6 mayOpenFromManagedToUnmanaged:(BOOL)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v11 = a4;
  id v12 = [MEMORY[0x1E4F1CA80] setWithArray:a3];
  id v13 = +[MCRestrictionManager sharedManager];
  id v14 = [v13 restrictedAppBundleIDs];

  if ([v14 count]) {
    [v12 minusSet:v14];
  }
  id v15 = +[MCRestrictionManager sharedManager];
  uint64_t v16 = [v15 effectiveWhitelistedAppBundleIDs];

  if ([v16 count]) {
    [v12 intersectSet:v16];
  }
  BOOL v17 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
  if (!v8 || !a7)
  {
    if (v9 && !a7) {
      [v12 intersectSet:v17];
    }
    if (!v9 && !v8) {
      [v12 minusSet:v17];
    }
  }
  uint64_t v18 = [v12 allObjects];

  return v18;
}

+ (BOOL)isWebContentFilterUIActiveWithRestrictionDictionary:(id)a3
{
  id v3 = a3;
  if (+[MCRestrictionManager restrictedBoolForFeature:@"forceWebContentFilterAuto" withRestrictionsDictionary:v3] == 1)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = +[MCRestrictionManager intersectedValuesForFeature:@"webContentFilterAutoPermittedURLs" withRestrictionsDictionary:v3];
    if (v5)
    {
      BOOL v4 = 1;
    }
    else
    {
      id v6 = +[MCRestrictionManager intersectedValuesForFeature:@"webContentFilterWhitelistedURLs" withRestrictionsDictionary:v3];
      if (v6)
      {
        BOOL v4 = 1;
      }
      else
      {
        id v7 = +[MCRestrictionManager unionValuesForFeature:@"webContentFilterBlacklistedURLs" withRestrictionsDictionary:v3];
        BOOL v4 = v7 != 0;
      }
    }
  }
  return !v4;
}

+ (BOOL)mayChangePasscode
{
  uint64_t v2 = +[MCRestrictionManager sharedManager];
  BOOL v3 = [v2 effectiveRestrictedBoolForSetting:@"allowPasscodeModification"] != 2;

  return v3;
}

- (void)setMemberQueueSettingsEvents:(id)a3
{
}

- (void)setMemberQueueOverridingRestrictionClientUUID:(id)a3
{
}

- (void)setMemberQueue:(id)a3
{
}

@end