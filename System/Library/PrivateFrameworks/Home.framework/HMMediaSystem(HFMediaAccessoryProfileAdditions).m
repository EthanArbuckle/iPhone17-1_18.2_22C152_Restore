@interface HMMediaSystem(HFMediaAccessoryProfileAdditions)
- (BOOL)hasValidSettings;
- (HFHomeKitSettingsAdapterManager)hf_settingsAdapterManager;
- (HFHomeKitSettingsValueManager)hf_settingsValueManager;
- (HFMediaValueManager)hf_mediaValueSource;
- (HFSiriLanguageOptionsManager)hf_siriLanguageOptionsManager;
- (__CFString)hf_tileSize;
- (id)accessories;
- (id)hf_accessoryType;
- (id)hf_appleMusicCurrentLoggedInAccount;
- (id)hf_appleMusicCurrentLoggedInAccountDSID;
- (id)hf_categoryCapitalizedLocalizedDescription;
- (id)hf_categoryLowercaseLocalizedDescription;
- (id)hf_containedCharacteristics;
- (id)hf_containedServices;
- (id)hf_dependentHomeKitObjectsForDownstreamItems;
- (id)hf_deviceIdentifiers;
- (id)hf_displayName;
- (id)hf_fetchLog:()HFMediaAccessoryProfileAdditions timeout:;
- (id)hf_fetchLogListWithTimeout:()HFMediaAccessoryProfileAdditions;
- (id)hf_home;
- (id)hf_homePodMediaAccountIsMismatchedWithHomeMediaAccount;
- (id)hf_homePodSupportsMultiUserLanguage;
- (id)hf_identify;
- (id)hf_isEitherHomePodMediaAccountOrHomeMediaAccountPresent;
- (id)hf_mediaRouteIdentifier;
- (id)hf_moveToRoom:()HFMediaAccessoryProfileAdditions;
- (id)hf_parentRoom;
- (id)hf_preferredMediaUser;
- (id)hf_safeRoom;
- (id)hf_setTileSize:()HFMediaAccessoryProfileAdditions;
- (id)hf_stateDumpBuilderWithContext:()HFMediaAccessoryProfileAdditions;
- (id)hf_updateDateAdded:()HFMediaAccessoryProfileAdditions;
- (id)homekitObjectIdentifiers;
- (id)mediaProfiles;
- (id)symptoms;
- (id)symptomsHandler;
- (uint64_t)hf_backingAccessory;
- (uint64_t)hf_canShowInControlCenter;
- (uint64_t)hf_canSpanMultipleRooms;
- (uint64_t)hf_effectiveIsFavorite;
- (uint64_t)hf_effectiveShowInHomeDashboard;
- (uint64_t)hf_hasSetFavorite;
- (uint64_t)hf_hasSetShowInHomeDashboard;
- (uint64_t)hf_hasSetVisibleInHomeStatus;
- (uint64_t)hf_homePodIsCapableOfShowingSplitAccountError;
- (uint64_t)hf_homePodSupportsMultiUser;
- (uint64_t)hf_idsDeviceIdentifierWithError:()HFMediaAccessoryProfileAdditions;
- (uint64_t)hf_isAccessorySettingsReachable;
- (uint64_t)hf_isAppleMusicReachable;
- (uint64_t)hf_isCurrentAccessory;
- (uint64_t)hf_isFavorite;
- (uint64_t)hf_isForcedVisibleInHomeStatus;
- (uint64_t)hf_isIdentifiable;
- (uint64_t)hf_isInRoom:()HFMediaAccessoryProfileAdditions;
- (uint64_t)hf_isMatterOnlyAccessory;
- (uint64_t)hf_isReachable;
- (uint64_t)hf_isVisibleInHomeStatus;
- (uint64_t)hf_itemClass;
- (uint64_t)hf_preferredUserSelectionType;
- (uint64_t)hf_showInHomeDashboard;
- (uint64_t)hf_showsAudioSettings;
- (uint64_t)hf_supportsHomeStatus;
- (uint64_t)hf_supportsMediaActions;
- (uint64_t)hf_supportsMultiUser;
- (uint64_t)hf_supportsMusicAlarm;
- (uint64_t)hf_supportsPreferredMediaUser;
- (uint64_t)hf_supportsSoftwareUpdate;
- (uint64_t)hf_supportsStereoPairing;
- (uint64_t)hf_updateIsFavorite:()HFMediaAccessoryProfileAdditions;
- (uint64_t)hf_updateIsVisibleInHomeStatus:()HFMediaAccessoryProfileAdditions;
- (uint64_t)hf_updateShowInHomeDashboard:()HFMediaAccessoryProfileAdditions;
- (uint64_t)isContainedWithinItemGroup;
- (uint64_t)isItemGroup;
- (uint64_t)numberOfItemsContainedWithinGroup;
@end

@implementation HMMediaSystem(HFMediaAccessoryProfileAdditions)

- (id)accessories
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(a1, "components", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) mediaProfile];
        v9 = [v8 accessory];
        objc_msgSend(v2, "na_safeAddObject:", v9);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)mediaProfiles
{
  v1 = [a1 accessories];
  v2 = objc_msgSend(v1, "na_map:", &__block_literal_global_169);

  return v2;
}

- (id)hf_home
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 home];
  if (!v4)
  {
    uint64_t v5 = HFLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = NSStringFromSelector(a2);
      int v11 = 138412546;
      long long v12 = a1;
      __int16 v13 = 2112;
      long long v14 = v10;
      _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "%@:%@ nil home. Please file a radar against “Home App | New Bugs” with any info you have on what you were doing.", (uint8_t *)&v11, 0x16u);
    }
    if (+[HFUtilities isInternalInstall])
    {
      uint64_t v6 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", -1);
      v7 = +[HFErrorHandler sharedHandler];
      [v7 handleError:v6 operationType:@"HFOperationRemoveHomePodAlarm" options:0 retryBlock:0 cancelBlock:0];
    }
    v8 = +[HFHomeKitDispatcher sharedDispatcher];
    uint64_t v4 = [v8 home];
  }
  return v4;
}

- (id)hf_parentRoom
{
  v1 = [a1 components];
  v2 = [v1 firstObject];
  v3 = [v2 mediaProfile];
  uint64_t v4 = [v3 accessory];
  uint64_t v5 = [v4 room];

  return v5;
}

- (id)symptomsHandler
{
  v1 = [a1 accessories];
  v2 = [v1 anyObject];
  v3 = [v2 symptomsHandler];

  return v3;
}

- (id)symptoms
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [a1 symptomsHandler];
  v3 = [v2 symptoms];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = HFLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [a1 symptomsHandler];
      v7 = [v6 symptoms];
      int v11 = 138412546;
      long long v12 = a1;
      __int16 v13 = 2112;
      long long v14 = v7;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Media system: %@, has symptoms: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  v8 = [a1 symptomsHandler];
  v9 = [v8 symptoms];

  return v9;
}

- (uint64_t)hf_isCurrentAccessory
{
  v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_288);

  return v2;
}

- (uint64_t)hf_isReachable
{
  v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_all:", &__block_literal_global_290);

  return v2;
}

- (uint64_t)hf_supportsStereoPairing
{
  return 0;
}

- (uint64_t)hf_supportsMusicAlarm
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 accessories];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v4 = objc_msgSend(a1, "accessories", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          if (![*(id *)(*((void *)&v14 + 1) + 8 * v8) supportsMusicAlarm])
          {
            uint64_t v3 = 0;
            goto LABEL_12;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    uint64_t v3 = 1;
LABEL_12:

    v9 = HFLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (v3) {
        v10 = @"YES";
      }
      else {
        v10 = @"NO";
      }
      int v11 = [a1 description];
      *(_DWORD *)buf = 138412546;
      v19 = v10;
      __int16 v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Accessory Supports Music Alarm (%@) mediaprofilecontainer %@", buf, 0x16u);
    }
  }
  else
  {
    v9 = HFLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      long long v12 = [a1 description];
      *(_DWORD *)buf = 138412290;
      v19 = v12;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "No Accessories Found that Supports Music Alarm mediaprofilecontainer %@", buf, 0xCu);

      uint64_t v3 = 0;
    }
  }

  return v3;
}

- (uint64_t)hf_canShowInControlCenter
{
  return 1;
}

- (uint64_t)hf_showsAudioSettings
{
  return 1;
}

- (uint64_t)hf_supportsSoftwareUpdate
{
  return 1;
}

- (uint64_t)hf_isAppleMusicReachable
{
  v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_all:", &__block_literal_global_298);

  return v2;
}

- (uint64_t)hf_isAccessorySettingsReachable
{
  v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_all:", &__block_literal_global_300);

  return v2;
}

- (HFMediaValueManager)hf_mediaValueSource
{
  objc_getAssociatedObject(a1, a2);
  uint64_t v4 = (HFMediaValueManager *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    uint64_t v4 = [[HFMediaValueManager alloc] initWithMediaProfileContainer:a1];
    objc_setAssociatedObject(a1, a2, v4, (void *)0x301);
  }
  return v4;
}

- (HFHomeKitSettingsAdapterManager)hf_settingsAdapterManager
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_getAssociatedObject(a1, a2);
  uint64_t v4 = (HFHomeKitSettingsAdapterManager *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    uint64_t v5 = HFLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315394;
      uint64_t v8 = "-[HMMediaSystem(HFMediaAccessoryProfileAdditions) hf_settingsAdapterManager]";
      __int16 v9 = 2112;
      v10 = a1;
      _os_log_debug_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEBUG, "%s Creating new HFHomeKitSettingsAdapterManager for HMMediaSystem %@", (uint8_t *)&v7, 0x16u);
    }

    uint64_t v4 = [[HFHomeKitSettingsAdapterManager alloc] initWithHomeKitSettingsVendor:a1];
    objc_setAssociatedObject(a1, a2, v4, (void *)1);
  }
  return v4;
}

- (id)hf_categoryCapitalizedLocalizedDescription
{
  v1 = (void *)MEMORY[0x263F0DF00];
  uint64_t v2 = [a1 category];
  uint64_t v3 = [v2 categoryType];
  uint64_t v4 = objc_msgSend(v1, "hf_userFriendlyLocalizedCapitalizedDescription:", v3);

  return v4;
}

- (id)hf_categoryLowercaseLocalizedDescription
{
  v1 = (void *)MEMORY[0x263F0DF00];
  uint64_t v2 = [a1 category];
  uint64_t v3 = [v2 categoryType];
  uint64_t v4 = objc_msgSend(v1, "hf_userFriendlyLocalizedLowercaseDescription:", v3);

  return v4;
}

- (id)hf_dependentHomeKitObjectsForDownstreamItems
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_opt_new();
  [v2 addObject:a1];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = objc_msgSend(a1, "accessories", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v2 addObject:v8];
        __int16 v9 = [v8 mediaProfile];
        v10 = objc_msgSend(v9, "hf_dependentHomeKitObjectsForDownstreamItems");
        [v2 unionSet:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  uint64_t v11 = [a1 settings];
  objc_msgSend(v2, "na_safeAddObject:", v11);

  return v2;
}

- (uint64_t)hf_backingAccessory
{
  return 0;
}

- (uint64_t)hf_supportsMultiUser
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v1 = objc_msgSend(a1, "accessories", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        if (![*(id *)(*((void *)&v8 + 1) + 8 * v5) supportsMultiUser])
        {
          uint64_t v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v6 = 1;
LABEL_11:

  return v6;
}

- (uint64_t)hf_supportsMediaActions
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v1 = objc_msgSend(a1, "accessories", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        if (![*(id *)(*((void *)&v8 + 1) + 8 * v5) supportsMediaActions])
        {
          uint64_t v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v6 = 1;
LABEL_11:

  return v6;
}

- (uint64_t)hf_homePodSupportsMultiUser
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v1 = objc_msgSend(a1, "accessories", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (!objc_msgSend(v6, "hf_isHomePod") || !objc_msgSend(v6, "supportsMultiUser"))
        {
          uint64_t v7 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v7 = 1;
      if (v3) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }
LABEL_13:

  return v7;
}

- (uint64_t)hf_homePodIsCapableOfShowingSplitAccountError
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v1 = objc_msgSend(a1, "accessories", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = [*(id *)(*((void *)&v10 + 1) + 8 * v5) mediaProfile];
        int v7 = objc_msgSend(v6, "hf_homePodIsCapableOfShowingSplitAccountError");

        if (!v7)
        {
          uint64_t v8 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 1;
LABEL_11:

  return v8;
}

- (id)hf_deviceIdentifiers
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF9C0] set];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = objc_msgSend(a1, "accessories", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) deviceIdentifier];
        objc_msgSend(v2, "na_safeAddObject:", v8);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)hf_mediaRouteIdentifier
{
  v1 = objc_msgSend(a1, "hf_deviceIdentifiers");
  uint64_t v2 = [v1 anyObject];

  return v2;
}

- (BOOL)hasValidSettings
{
  v1 = [a1 settings];
  uint64_t v2 = [v1 rootGroup];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)homekitObjectIdentifiers
{
  v1 = [a1 mediaProfiles];
  uint64_t v2 = objc_msgSend(v1, "na_map:", &__block_literal_global_306_0);

  return v2;
}

- (uint64_t)isItemGroup
{
  return 1;
}

- (uint64_t)isContainedWithinItemGroup
{
  return 0;
}

- (uint64_t)numberOfItemsContainedWithinGroup
{
  v1 = [a1 accessories];
  uint64_t v2 = [v1 count];

  return v2;
}

- (id)hf_appleMusicCurrentLoggedInAccountDSID
{
  v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_map:", &__block_literal_global_308);

  if ([v2 count] == 1)
  {
    BOOL v3 = [v2 anyObject];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)hf_appleMusicCurrentLoggedInAccount
{
  uint64_t v2 = objc_msgSend(a1, "hf_appleMusicCurrentLoggedInAccountDSID");
  if (v2)
  {
    BOOL v3 = [a1 accessories];
    uint64_t v4 = [v3 anyObject];
    uint64_t v5 = [v4 mediaProfile];
    uint64_t v6 = objc_msgSend(v5, "hf_appleMusicCurrentLoggedInAccount");
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)hf_homePodSupportsMultiUserLanguage
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __86__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_homePodSupportsMultiUserLanguage__block_invoke;
  v4[3] = &unk_26408C8F0;
  v4[4] = a1;
  v4[5] = a2;
  uint64_t v2 = [MEMORY[0x263F58190] futureWithBlock:v4];
  return v2;
}

- (id)hf_homePodMediaAccountIsMismatchedWithHomeMediaAccount
{
  v1 = [a1 accessories];
  uint64_t v2 = [v1 anyObject];
  BOOL v3 = [v2 mediaProfile];
  uint64_t v4 = objc_msgSend(v3, "hf_homePodMediaAccountIsMismatchedWithHomeMediaAccount");

  return v4;
}

- (id)hf_isEitherHomePodMediaAccountOrHomeMediaAccountPresent
{
  v1 = [a1 accessories];
  uint64_t v2 = [v1 anyObject];
  BOOL v3 = [v2 mediaProfile];
  uint64_t v4 = objc_msgSend(v3, "hf_isEitherHomePodMediaAccountOrHomeMediaAccountPresent");

  return v4;
}

- (HFHomeKitSettingsValueManager)hf_settingsValueManager
{
  uint64_t v4 = [a1 settings];

  if (v4)
  {
    objc_getAssociatedObject(a1, a2);
    uint64_t v4 = (HFHomeKitSettingsValueManager *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      uint64_t v5 = [HFHomeKitSettingsValueManager alloc];
      uint64_t v6 = [a1 settings];
      int v7 = [a1 homekitObjectIdentifiers];
      uint64_t v4 = [(HFHomeKitSettingsValueManager *)v5 initWithSettings:v6 homeKitObjectIdentifiers:v7];

      objc_setAssociatedObject(a1, a2, v4, (void *)1);
    }
  }
  return v4;
}

- (HFSiriLanguageOptionsManager)hf_siriLanguageOptionsManager
{
  uint64_t v2 = [a1 accessories];
  BOOL v3 = [v2 allObjects];
  uint64_t v4 = [v3 lastObject];
  if (objc_msgSend(v4, "hf_isSiriEndpoint"))
  {
  }
  else
  {
    uint64_t v5 = +[HFHomeKitDispatcher sharedDispatcher];
    uint64_t v6 = [v5 homeManager];
    int v7 = [v6 hasOptedToHH2];

    if (!v7)
    {
      uint64_t v8 = 0;
      goto LABEL_7;
    }
  }
  objc_getAssociatedObject(a1, sel_hf_siriLanguageOptionsManager);
  uint64_t v8 = (HFSiriLanguageOptionsManager *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    long long v9 = +[HFHomeKitDispatcher sharedDispatcher];
    long long v10 = [v9 homeManager];

    long long v11 = [HFSiriLanguageOptionsManager alloc];
    long long v12 = objc_msgSend(v10, "hf_accessorySettingsController");
    long long v13 = [a1 accessories];
    uint64_t v14 = [v13 anyObject];
    uint64_t v15 = [v14 uniqueIdentifier];
    long long v16 = objc_msgSend(a1, "hf_home");
    uint64_t v8 = [(HFSiriLanguageOptionsManager *)v11 initWithSettingsController:v12 accessoryIdentifier:v15 home:v16];

    objc_setAssociatedObject(a1, sel_hf_siriLanguageOptionsManager, v8, (void *)1);
  }
LABEL_7:
  return v8;
}

- (id)hf_fetchLogListWithTimeout:()HFMediaAccessoryProfileAdditions
{
  v7[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F58190];
  v1 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F08320];
  v7[0] = @"HMMediaSystem is a composite of several objects, and does not support fetching logs";
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  BOOL v3 = objc_msgSend(v1, "hf_errorWithCode:operation:options:", 19, @"HFOperationHomePodDataAnalyticsRetrieveLogList", v2);
  uint64_t v4 = [v0 futureWithError:v3];

  return v4;
}

- (id)hf_fetchLog:()HFMediaAccessoryProfileAdditions timeout:
{
  v7[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F58190];
  v1 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F08320];
  v7[0] = @"HMMediaSystem is a composite of several objects, and does not support fetching logs";
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  BOOL v3 = objc_msgSend(v1, "hf_errorWithCode:operation:options:", 19, @"HFOperationHomePodDataAnalyticsRetrieveLog", v2);
  uint64_t v4 = [v0 futureWithError:v3];

  return v4;
}

- (uint64_t)hf_idsDeviceIdentifierWithError:()HFMediaAccessoryProfileAdditions
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:operation:options:", 20, @"HFOperationFindIDSDeviceIdentifier", 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (uint64_t)hf_isFavorite
{
  return objc_msgSend(a1, "hf_isOnForContextType:", 2);
}

- (uint64_t)hf_hasSetFavorite
{
  return objc_msgSend(a1, "hf_hasSetForContextType:", 2);
}

- (uint64_t)hf_effectiveIsFavorite
{
  return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 2);
}

- (uint64_t)hf_updateIsFavorite:()HFMediaAccessoryProfileAdditions
{
  return objc_msgSend(a1, "hf_updateValue:forContextType:", a3, 2);
}

- (uint64_t)hf_supportsHomeStatus
{
  return objc_msgSend(a1, "hf_shouldHideForContextType:", 1) ^ 1;
}

- (uint64_t)hf_isVisibleInHomeStatus
{
  if (objc_msgSend(a1, "hf_isForcedVisibleInHomeStatus")) {
    return 1;
  }
  return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 1);
}

- (uint64_t)hf_hasSetVisibleInHomeStatus
{
  return objc_msgSend(a1, "hf_hasSetForContextType:", 1);
}

- (uint64_t)hf_isForcedVisibleInHomeStatus
{
  v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_321_1);

  return v2;
}

- (uint64_t)hf_updateIsVisibleInHomeStatus:()HFMediaAccessoryProfileAdditions
{
  return objc_msgSend(a1, "hf_updateValue:forContextType:", a3, 1);
}

- (uint64_t)hf_showInHomeDashboard
{
  return objc_msgSend(a1, "hf_isOnForContextType:", 3);
}

- (uint64_t)hf_hasSetShowInHomeDashboard
{
  return objc_msgSend(a1, "hf_hasSetForContextType:", 3);
}

- (uint64_t)hf_effectiveShowInHomeDashboard
{
  return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 3);
}

- (uint64_t)hf_updateShowInHomeDashboard:()HFMediaAccessoryProfileAdditions
{
  return objc_msgSend(a1, "hf_updateValue:forContextType:", a3, 3);
}

- (__CFString)hf_tileSize
{
  uint64_t v2 = [MEMORY[0x263F08760] set];
  BOOL v3 = [a1 accessories];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_tileSize__block_invoke;
  v9[3] = &unk_26408F388;
  id v10 = v2;
  id v4 = v2;
  objc_msgSend(v3, "na_each:", v9);

  objc_msgSend(v4, "na_mostCommonObject");
  uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (!v5) {
    uint64_t v5 = @"HFTileResizableSizeSmall";
  }
  int v7 = v5;

  return v7;
}

- (id)hf_setTileSize:()HFMediaAccessoryProfileAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 accessories];
  uint64_t v6 = [v5 allObjects];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_setTileSize___block_invoke;
  v11[3] = &unk_264098900;
  v11[4] = v4;
  int v7 = objc_msgSend(v6, "na_map:", v11);

  uint64_t v8 = [MEMORY[0x263F58190] combineAllFutures:v7];
  long long v9 = [v8 flatMap:&__block_literal_global_328_0];

  return v9;
}

- (uint64_t)hf_itemClass
{
  return objc_opt_class();
}

- (id)hf_containedServices
{
  v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_flatMap:", &__block_literal_global_332);

  return v2;
}

- (id)hf_containedCharacteristics
{
  v1 = objc_msgSend(a1, "hf_containedServices");
  uint64_t v2 = objc_msgSend(v1, "na_flatMap:", &__block_literal_global_336);

  return v2;
}

- (id)hf_accessoryType
{
  return +[HFAccessoryType mediaSystemType];
}

- (uint64_t)hf_isInRoom:()HFMediaAccessoryProfileAdditions
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "hf_associatedAccessories");
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_isInRoom___block_invoke;
  v9[3] = &unk_26408D968;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

- (id)hf_safeRoom
{
  v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_map:", &__block_literal_global_339_1);

  if ([v2 count] == 1)
  {
    BOOL v3 = [v2 anyObject];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (uint64_t)hf_canSpanMultipleRooms
{
  return 0;
}

- (uint64_t)hf_isIdentifiable
{
  return 1;
}

- (uint64_t)hf_isMatterOnlyAccessory
{
  return 0;
}

- (id)hf_moveToRoom:()HFMediaAccessoryProfileAdditions
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263F58190];
  id v6 = objc_msgSend(a1, "hf_associatedAccessories");
  uint64_t v7 = [v6 allObjects];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_moveToRoom___block_invoke;
  v12[3] = &unk_26408E2E8;
  id v13 = v4;
  id v8 = v4;
  long long v9 = objc_msgSend(v7, "na_map:", v12);
  id v10 = [v5 combineAllFutures:v9];

  return v10;
}

- (id)hf_stateDumpBuilderWithContext:()HFMediaAccessoryProfileAdditions
{
  id v4 = _HFStateDumpBuilderForMediaProfileContainer(a1, a3);
  uint64_t v5 = [a1 components];
  [v4 appendObject:v5 withName:@"components"];

  return v4;
}

- (id)hf_displayName
{
  v1 = objc_msgSend(a1, "hf_serviceNameComponents");
  uint64_t v2 = [v1 composedString];

  return v2;
}

- (id)hf_updateDateAdded:()HFMediaAccessoryProfileAdditions
{
  return HFUpdateDateAddedForApplicationDataContainer(a1, a3);
}

- (uint64_t)hf_supportsPreferredMediaUser
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v1 = objc_msgSend(a1, "accessories", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(v6, "hf_isHomePod") & 1) == 0 && !objc_msgSend(v6, "hf_isSiriEndpoint")
          || ![v6 supportsPreferredMediaUser])
        {
          uint64_t v7 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v7 = 1;
LABEL_13:

  return v7;
}

- (id)hf_preferredMediaUser
{
  if (objc_msgSend(a1, "hf_supportsPreferredMediaUser"))
  {
    uint64_t v2 = [a1 accessories];
    uint64_t v3 = [v2 anyObject];
    uint64_t v4 = [v3 preferredMediaUser];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (uint64_t)hf_preferredUserSelectionType
{
  v1 = [a1 accessories];
  uint64_t v2 = [v1 anyObject];
  uint64_t v3 = [v2 preferredUserSelectionType];

  return v3;
}

- (id)hf_identify
{
  v1 = [a1 accessories];
  uint64_t v2 = [v1 allObjects];
  uint64_t v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_344_0);

  uint64_t v4 = [MEMORY[0x263F58190] combineAllFutures:v3];

  return v4;
}

@end