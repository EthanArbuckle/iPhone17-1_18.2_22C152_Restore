@interface HUSymptomStatusBannerItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUSymptomStatusBannerItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUSymptomStatusBannerItem;
  v4 = [(HUStatusBannerItem *)&v8 _subclass_updateWithOptions:a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__HUSymptomStatusBannerItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_1E6389290;
  v7[4] = self;
  v5 = [v4 flatMap:v7];

  return v5;
}

id __57__HUSymptomStatusBannerItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x1E4F68B10];
  v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];
  }
  else
  {
    objc_super v8 = (void *)[v3 mutableCopy];
    v9 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68C18]];
    v10 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68C00]];
    BOOL v11 = (unint64_t)[v10 count] > 1;
    v12 = [*(id *)(a1 + 32) _sortedObjectDisplayNamesForHomeKitObjects:v10];
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__12;
    v39 = __Block_byref_object_dispose__12;
    id v40 = 0;
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__12;
    v33 = __Block_byref_object_dispose__12;
    if ([v12 count] == 1) {
      [v12 firstObject];
    }
    else {
      objc_msgSend(MEMORY[0x1E4F2E4F8], "hf_userFriendlyLocalizedCapitalizedDescription:", *MEMORY[0x1E4F2C1D0]);
    }
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __57__HUSymptomStatusBannerItem__subclass_updateWithOptions___block_invoke_2;
    v21[3] = &unk_1E638A6A0;
    id v13 = v9;
    uint64_t v14 = *(void *)(a1 + 32);
    id v22 = v13;
    uint64_t v23 = v14;
    id v15 = v10;
    id v24 = v15;
    v26 = &v35;
    BOOL v28 = v11;
    id v16 = v8;
    id v25 = v16;
    v27 = &v29;
    v17 = __57__HUSymptomStatusBannerItem__subclass_updateWithOptions___block_invoke_2((uint64_t)v21);
    uint64_t v18 = *MEMORY[0x1E4F68980];
    [v16 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F68980]];

    [v16 setObject:v30[5] forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    if ([(id)v36[5] length]) {
      [v16 setObject:v36[5] forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
    }
    v19 = [v16 objectForKeyedSubscript:v18];

    if (!v19) {
      [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v4];
    }
    [v16 setObject:&unk_1F19B4508 forKeyedSubscript:@"bannerItemCategory"];
    v7 = [MEMORY[0x1E4F7A0D8] futureWithResult:v16];

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v35, 8);
  }

  return v7;
}

id __57__HUSymptomStatusBannerItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) type];
  id v3 = 0;
  switch(v2)
  {
    case 1:
    case 20:
      uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = @"HUBannerSymptom_NeediCloudCredential_Title";

      [*(id *)(a1 + 56) setObject:@"Home.Banners.Symptoms.NeediCloudCrentialFix" forKeyedSubscript:*MEMORY[0x1E4F68928]];
      uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v15 = _HULocalizedStringWithDefaultValue(v14, v14, 1);
      uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8);
      v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;

      uint64_t v18 = *(void **)(a1 + 40);
      uint64_t v19 = *(void *)(a1 + 48);
      v20 = @"HUBannerSymptom_Description_NeediCloudCredential";
      goto LABEL_27;
    case 2:
      uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
      id v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = @"HUBannerSymptom_NeediTunesCredential_Title";

      [*(id *)(a1 + 56) setObject:@"Home.Banners.Symptoms.NeediTunesCredential" forKeyedSubscript:*MEMORY[0x1E4F68928]];
      uint64_t v23 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v24 = _HULocalizedStringWithDefaultValue(v23, v23, 1);
      uint64_t v25 = *(void *)(*(void *)(a1 + 72) + 8);
      v26 = *(void **)(v25 + 40);
      *(void *)(v25 + 40) = v24;

      uint64_t v18 = *(void **)(a1 + 40);
      uint64_t v19 = *(void *)(a1 + 48);
      v20 = @"HUBannerSymptom_Description_NeediTunesCredential";
      goto LABEL_27;
    case 3:
      goto LABEL_8;
    case 4:
    case 5:
    case 14:
      if (*(unsigned char *)(a1 + 80)) {
        uint64_t v4 = @"HUBannerSymptom_NoNetwork_Title_Multiple";
      }
      else {
        uint64_t v4 = @"HUBannerSymptom_NoNetwork_Title";
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v4);
      [*(id *)(a1 + 56) setObject:@"Home.Banners.Symptoms.NoNetwork.NeedWiFiFix" forKeyedSubscript:*MEMORY[0x1E4F68928]];
      v5 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v6 = _HULocalizedStringWithDefaultValue(v5, v5, 1);
      uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
      objc_super v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      v9 = *(void **)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      BOOL v11 = @"HUBannerSymptom_Description_NoNetwork";
      goto LABEL_36;
    case 6:
    case 15:
      goto LABEL_37;
    case 7:
      if (*(unsigned char *)(a1 + 80)) {
        v27 = @"HUBannerSymptom_NeedsService_Title_Multiple";
      }
      else {
        v27 = @"HUBannerSymptom_NeedsService_Title";
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v27);
      [*(id *)(a1 + 56) setObject:@"Home.Banners.Symptoms.NeedsService" forKeyedSubscript:*MEMORY[0x1E4F68928]];
      BOOL v28 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v29 = _HULocalizedStringWithDefaultValue(v28, v28, 1);
      uint64_t v30 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v31 = *(void **)(v30 + 40);
      *(void *)(v30 + 40) = v29;

      uint64_t v18 = *(void **)(a1 + 40);
      uint64_t v19 = *(void *)(a1 + 48);
      v20 = @"HUBannerSymptom_Description_NeedsService";
      goto LABEL_27;
    case 8:
      uint64_t v32 = *(void *)(*(void *)(a1 + 64) + 8);
      v33 = *(void **)(v32 + 40);
      *(void *)(v32 + 40) = @"HUBannerSymptom_StereoVersionMismatch_Title";

      [*(id *)(a1 + 56) setObject:@"Home.Banners.Symptoms.StereoVersionMismatch.HomePodSoftwareUpdateRequired" forKeyedSubscript:*MEMORY[0x1E4F68928]];
      id v34 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v35 = _HULocalizedStringWithDefaultValue(v34, v34, 1);
      uint64_t v36 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v37 = *(void **)(v36 + 40);
      *(void *)(v36 + 40) = v35;

      uint64_t v18 = *(void **)(a1 + 40);
      uint64_t v19 = *(void *)(a1 + 48);
      v20 = @"HUBannerSymptom_Description_StereoVersionMismatch";
      goto LABEL_27;
    case 9:
      uint64_t v38 = *(void *)(*(void *)(a1 + 64) + 8);
      v39 = *(void **)(v38 + 40);
      *(void *)(v38 + 40) = @"HUBannerSymptom_StereoNotFound_Title";

      [*(id *)(a1 + 56) setObject:@"Home.Banners.Symptoms.StereoNotFound.HomePodConnectionProblem" forKeyedSubscript:*MEMORY[0x1E4F68928]];
      id v40 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v41 = _HULocalizedStringWithDefaultValue(v40, v40, 1);
      uint64_t v42 = *(void *)(*(void *)(a1 + 72) + 8);
      v43 = *(void **)(v42 + 40);
      *(void *)(v42 + 40) = v41;

      uint64_t v18 = *(void **)(a1 + 40);
      uint64_t v19 = *(void *)(a1 + 48);
      v20 = @"HUBannerSymptom_Description_StereoNotFound";
      goto LABEL_27;
    case 10:
      if (*(unsigned char *)(a1 + 80)) {
        v44 = @"HUBannerSymptom_NoNetwork_Title_Multiple";
      }
      else {
        v44 = @"HUBannerSymptom_NoNetwork_Title";
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v44);
      v45 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v46 = _HULocalizedStringWithDefaultValue(v45, v45, 1);
      uint64_t v47 = *(void *)(*(void *)(a1 + 72) + 8);
      v48 = *(void **)(v47 + 40);
      *(void *)(v47 + 40) = v46;

      if ([MEMORY[0x1E4F69758] useWLANInsteadOfWiFi]) {
        v20 = @"HUBannerSymptom_Description_WLAN";
      }
      else {
        v20 = @"HUBannerSymptom_Description_WiFi";
      }
      uint64_t v18 = *(void **)(a1 + 40);
      uint64_t v19 = *(void *)(a1 + 48);
      goto LABEL_27;
    case 11:
      v49 = [MEMORY[0x1E4F69758] networkSSID];

      if (!v49) {
        goto LABEL_40;
      }
      uint64_t v50 = *(void *)(*(void *)(a1 + 64) + 8);
      v51 = *(void **)(v50 + 40);
      *(void *)(v50 + 40) = @"HUBannerSymptom_NetworkMismatch_Title";

      [*(id *)(a1 + 56) setObject:@"Home.Banners.Symptoms.NetworkMismatch" forKeyedSubscript:*MEMORY[0x1E4F68928]];
      v52 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v53 = _HULocalizedStringWithDefaultValue(v52, v52, 1);
      uint64_t v54 = *(void *)(*(void *)(a1 + 72) + 8);
      v55 = *(void **)(v54 + 40);
      *(void *)(v54 + 40) = v53;

      v9 = *(void **)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      BOOL v11 = @"HUBannerSymptom_Description_NetworkMismatch";
      goto LABEL_36;
    case 12:
      uint64_t v56 = *(void *)(*(void *)(a1 + 64) + 8);
      v57 = *(void **)(v56 + 40);
      *(void *)(v56 + 40) = @"HUBannerSymptom_TargetControl_Title";

      [*(id *)(a1 + 56) setObject:@"Home.Banners.Symptoms.TargetControl.AppleTVRequired" forKeyedSubscript:*MEMORY[0x1E4F68928]];
      v58 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v59 = _HULocalizedStringWithDefaultValue(v58, v58, 1);
      uint64_t v60 = *(void *)(*(void *)(a1 + 72) + 8);
      v61 = *(void **)(v60 + 40);
      *(void *)(v60 + 40) = v59;

      uint64_t v18 = *(void **)(a1 + 40);
      uint64_t v19 = *(void *)(a1 + 48);
      v20 = @"HUBannerSymptom_Description_TargetControl";
      goto LABEL_27;
    case 13:
      uint64_t v62 = *(void *)(*(void *)(a1 + 64) + 8);
      v63 = *(void **)(v62 + 40);
      *(void *)(v62 + 40) = @"HUBannerSymptom_VPNProfileExpired_Title";

      [*(id *)(a1 + 56) setObject:@"Home.Banners.Symptoms.VPNProfileExpired" forKeyedSubscript:*MEMORY[0x1E4F68928]];
      v64 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v65 = _HULocalizedStringWithDefaultValue(v64, v64, 1);
      uint64_t v66 = *(void *)(*(void *)(a1 + 72) + 8);
      v67 = *(void **)(v66 + 40);
      *(void *)(v66 + 40) = v65;

      uint64_t v18 = *(void **)(a1 + 40);
      uint64_t v19 = *(void *)(a1 + 48);
      v20 = @"HUBannerSymptom_Description_VPNProfileExpired";
      goto LABEL_27;
    case 16:
      uint64_t v68 = *(void *)(*(void *)(a1 + 64) + 8);
      v69 = *(void **)(v68 + 40);
      *(void *)(v68 + 40) = @"HUBannerSymptom_ProfileExpired_Title";

      [*(id *)(a1 + 56) setObject:@"Home.Banners.Symptoms.NeedNetworkProfileFix" forKeyedSubscript:*MEMORY[0x1E4F68928]];
      v70 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v71 = _HULocalizedStringWithDefaultValue(v70, v70, 1);
      uint64_t v72 = *(void *)(*(void *)(a1 + 72) + 8);
      v73 = *(void **)(v72 + 40);
      *(void *)(v72 + 40) = v71;

      v9 = *(void **)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      BOOL v11 = @"HUBannerSymptom_Description_ProfileExpired";
      goto LABEL_36;
    case 17:
      uint64_t v74 = *(void *)(*(void *)(a1 + 64) + 8);
      v75 = *(void **)(v74 + 40);
      *(void *)(v74 + 40) = @"HUBannerSymptom_ProfileInstall_Title";

      [*(id *)(a1 + 56) setObject:@"Home.Banners.Symptoms.NeedNetworkProfileInstall" forKeyedSubscript:*MEMORY[0x1E4F68928]];
      v76 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v77 = _HULocalizedStringWithDefaultValue(v76, v76, 1);
      uint64_t v78 = *(void *)(*(void *)(a1 + 72) + 8);
      v79 = *(void **)(v78 + 40);
      *(void *)(v78 + 40) = v77;

      v9 = *(void **)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      BOOL v11 = @"HUBannerSymptom_Description_ProfileInstall";
      goto LABEL_36;
    case 18:
      uint64_t v80 = *(void *)(*(void *)(a1 + 64) + 8);
      v81 = *(void **)(v80 + 40);
      *(void *)(v80 + 40) = @"HUBannerSymptom_NetworkNotShareable_Title";

      [*(id *)(a1 + 56) setObject:@"Home.Banners.Symptoms.NetworkNotShareable" forKeyedSubscript:*MEMORY[0x1E4F68928]];
      v82 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v83 = _HULocalizedStringWithDefaultValue(v82, v82, 1);
      uint64_t v84 = *(void *)(*(void *)(a1 + 72) + 8);
      v85 = *(void **)(v84 + 40);
      *(void *)(v84 + 40) = v83;

      v9 = *(void **)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      BOOL v11 = @"HUBannerSymptom_Description_NetworkNotShareable";
      goto LABEL_36;
    case 19:
      v86 = [MEMORY[0x1E4F69758] networkSSID];

      if (v86)
      {
        uint64_t v87 = *(void *)(*(void *)(a1 + 64) + 8);
        v88 = *(void **)(v87 + 40);
        *(void *)(v87 + 40) = @"HUBannerSymptom_CaptiveLeaseRenewal_Title";

        [*(id *)(a1 + 56) setObject:@"Home.Banners.Symptoms.CaptiveLeaseRenewal" forKeyedSubscript:*MEMORY[0x1E4F68928]];
        v89 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        uint64_t v90 = _HULocalizedStringWithDefaultValue(v89, v89, 1);
        uint64_t v91 = *(void *)(*(void *)(a1 + 72) + 8);
        v92 = *(void **)(v91 + 40);
        *(void *)(v91 + 40) = v90;

        if ([MEMORY[0x1E4F69758] useWLANInsteadOfWiFi]) {
          BOOL v11 = @"HUBannerSymptom_Description_CaptiveLeaseRenewal_WLAN";
        }
        else {
          BOOL v11 = @"HUBannerSymptom_Description_CaptiveLeaseRenewal_WiFi";
        }
        v9 = *(void **)(a1 + 40);
        uint64_t v10 = *(void *)(a1 + 48);
LABEL_36:
        id v3 = [v9 _descriptionForLocalizedStringKey:v11 representedHomeKitObjects:v10 options:2];
      }
      else
      {
LABEL_40:
        id v3 = 0;
      }
LABEL_37:
      return v3;
    default:
      if (v2 == 999)
      {
LABEL_8:
        uint64_t v18 = *(void **)(a1 + 40);
        uint64_t v19 = *(void *)(a1 + 48);
        v20 = @"HUBannerSymptom_Description_General";
LABEL_27:
        id v3 = [v18 _descriptionForLocalizedStringKey:v20 representedHomeKitObjects:v19];
      }
      goto LABEL_37;
  }
}

@end