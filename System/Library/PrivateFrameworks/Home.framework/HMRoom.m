@interface HMRoom
@end

@implementation HMRoom

uint64_t __47__HMRoom_HFAdditions__hf_hasVisibleAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isVisibleAccessory");
}

uint64_t __55__HMRoom_AbstractionAdditions__hf_accessoryLikeObjects__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_accessoryLikeObjects");
}

uint64_t __43__HMRoom_HFAdditions__hf_allCameraProfiles__block_invoke(uint64_t a1, void *a2)
{
  return [a2 cameraProfiles];
}

uint64_t __34__HMRoom_HFAdditions__hf_allZones__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 rooms];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

id __77__HMRoom_HFAdditions__hf_allUniqueMediaProfileContainersExcludingMediaGroups__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isMediaAccessory"))
  {
    v3 = [v2 mediaProfile];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

BOOL __77__HMRoom_HFAdditions__hf_allUniqueMediaProfileContainersExcludingMediaGroups__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_msgSend(v2, "hf_backingAccessory");
  uint64_t v4 = [v3 home];
  v5 = objc_msgSend(v2, "hf_backingAccessory");

  v6 = objc_msgSend(v4, "hf_mediaSystemForAccessory:", v5);

  return v6 == 0;
}

id __40__HMRoom_HFAdditions__hf_pairedHomePods__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isHomePod"))
  {
    v3 = [v2 home];
    uint64_t v4 = objc_msgSend(v3, "hf_mediaSystemForAccessory:", v2);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

BOOL __59__HMRoom_HFAdditions__hf_homePodPairsNotInHomeTheaterGroup__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 home];
  uint64_t v4 = [v2 audioDestinationIdentifier];

  v5 = objc_msgSend(v3, "hf_appleTVUsingAudioDestination:", v4);
  BOOL v6 = v5 == 0;

  return v6;
}

BOOL __55__HMRoom_HFAdditions__hf_homePodsNotInHomeTheaterGroup__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isHomePod")
    && ([v2 home],
        v3 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "hf_mediaSystemForAccessory:", v2),
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    BOOL v6 = [v2 home];
    v7 = [v2 audioDestinationIdentifier];
    v8 = objc_msgSend(v6, "hf_appleTVUsingAudioDestination:", v7);
    BOOL v5 = v8 == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

BOOL __59__HMRoom_HFAdditions__availableHomeTheaterMediaPartnerFor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "hf_isAppleTV")) {
    BOOL v4 = +[HFMediaHelper canMediaProfileContainer:*(void *)(a1 + 32) supportHomeTheaterWithAppleTV:v3];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

BOOL __59__HMRoom_HFAdditions__availableHomeTheaterMediaPartnerFor___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = objc_msgSend(v2, "hf_backingAccessory");
  BOOL v5 = +[HFMediaHelper canMediaProfileContainer:v3 supportHomeTheaterWithAppleTV:v4];

  return v5;
}

BOOL __59__HMRoom_HFAdditions__availableHomeTheaterMediaPartnerFor___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 mediaProfile];
  BOOL v4 = objc_msgSend(*(id *)(a1 + 32), "hf_backingAccessory");
  BOOL v5 = +[HFMediaHelper canMediaProfileContainer:v3 supportHomeTheaterWithAppleTV:v4];

  return v5;
}

BOOL __72__HMRoom_HFAdditions__availableHomePodsSupportingStereoPairingVersions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v6 = objc_msgSend(v3, "hf_isHomePod")
    && ([v3 home],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "hf_mediaSystemForAccessory:", v3),
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5)
    && (*(void *)(a1 + 32) & [v3 supportedStereoPairVersions]) != 0;

  return v6;
}

uint64_t __65__HMRoom_HFAdditions__hf_hasAtLeastOneAnnounceSupportedAccessory__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isHomePod");
}

uint64_t __44__HMRoom_HFAdditions__hf_allVisibleServices__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_visibleServices");
}

uint64_t __44__HMRoom_HFAdditions__hf_visibleAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isVisibleAccessory");
}

uint64_t __59__HMRoom_HFAdditions__hf_atleastOneHomePodSupportsAnnounce__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isHomePod")) {
    uint64_t v3 = [v2 supportsAnnounce];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void *__79__HMRoom_HFAdditions__hf_atleastOneMediaAccessorySupportsAndHasAnnounceEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isHomePod"))
  {
    uint64_t v3 = [v2 mediaProfile];
    BOOL v4 = objc_msgSend(v3, "hf_settingsValueManager");

    BOOL v5 = [v2 settings];
    BOOL v6 = objc_msgSend(v5, "hf_accessorySettingAtKeyPath:", @"root.announce.enabled");

    objc_opt_class();
    v7 = [v4 valueForSetting:v6];
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    id v9 = v8;

    if (v9)
    {
      char v10 = [v9 BOOLValue];

      if ((v10 & 1) == 0) {
        goto LABEL_17;
      }
      goto LABEL_14;
    }

    goto LABEL_16;
  }
  v11 = objc_msgSend(v2, "hf_siriEndpointProfile");

  if (v11)
  {
    v12 = [v2 mediaProfile];
    BOOL v4 = objc_msgSend(v12, "hf_mediaAccessoryCommonSettingsManager");

    objc_opt_class();
    v13 = [v4 settingValueForKeyPath:HFAnnounceEnabledKeyPath];
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v15 = v14;

    if (v15)
    {
      int v16 = [v15 BOOLValue];

      if (v16)
      {
LABEL_14:
        v11 = (void *)[v2 supportsAnnounce];
        goto LABEL_18;
      }
LABEL_17:
      v11 = 0;
      goto LABEL_18;
    }
LABEL_16:

    goto LABEL_17;
  }
LABEL_18:

  return v11;
}

uint64_t __66__HMRoom_HFAdditions__hf_hasAtLeastOneReachableHomeMediaAccessory__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isHomePod"))
  {
    uint64_t v3 = [v2 mediaProfile];
    BOOL v4 = [v3 settings];
    uint64_t v5 = [v4 isControllable];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __73__HMRoom_HFAdditions__hf_dashboardSectionReorderableUUIDStringComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  v8 = objc_msgSend(WeakRetained, "hf_reorderableDashboardSectionList");
  int v9 = [v8 sortedIdentifiersWithIdentifier1:v6 identifier2:v5];

  if (v9) {
    uint64_t v10 = -1;
  }
  else {
    uint64_t v10 = 1;
  }

  return v10;
}

uint64_t __47__HMRoom_HFAdditions__hf_allNonEmptyActionSets__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 actions];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__HMRoom_HFAdditions__hf_allNonEmptyActionSets__block_invoke_2;
  v6[3] = &unk_264090490;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __47__HMRoom_HFAdditions__hf_allNonEmptyActionSets__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "hf_affectedAccessoryRepresentables");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__HMRoom_HFAdditions__hf_allNonEmptyActionSets__block_invoke_3;
  v6[3] = &unk_26408FD78;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __47__HMRoom_HFAdditions__hf_allNonEmptyActionSets__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isInRoom:", *(void *)(a1 + 32));
}

BOOL __44__HMRoom_HFDemoMode__hf_demoModeAccessories__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 room];
  BOOL v4 = v2 == v3;

  return v4;
}

void __55__HMRoom_HFApplicationData___hf_updateApplicationData___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [*(id *)(a1 + 32) home];
    [v4 home:v3 didUpdateApplicationDataForRoom:*(void *)(a1 + 32)];
  }
}

void __84__HMRoom_HFApplicationData__hf_updateApplicationData_handleError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  uint64_t v3 = +[HFHomeKitDispatcher sharedDispatcher];
  id v4 = [v3 homeManager];
  if ([v4 hasOptedToHH2])
  {
    id v5 = [*(id *)(a1 + 32) home];
    id v6 = [v5 residentDevices];
    uint64_t v7 = [v6 count];

    v8 = HFOperationUpdateApplicationDataResidentSync;
    if (!v7) {
      v8 = HFOperationUpdateApplicationDataCloudSync;
    }
  }
  else
  {

    v8 = HFOperationUpdateApplicationDataCloudSync;
  }
  int v9 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v10 = *v8;
  v11 = +[HFErrorHandler sharedHandler];
  v12 = v11;
  if (v9) {
    [v11 handleError:v15 operationType:v10 options:0 retryBlock:0 cancelBlock:0];
  }
  else {
    [v11 logError:v15 operationDescription:v10];
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v14 = [WeakRetained applicationData];
  objc_msgSend(WeakRetained, "_hf_updateApplicationData:", v14);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end