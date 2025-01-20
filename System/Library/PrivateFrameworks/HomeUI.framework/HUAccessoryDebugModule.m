@interface HUAccessoryDebugModule
- (BOOL)fake8021xNetworkSymptom;
- (BOOL)fakeCDPSymptom;
- (BOOL)fakeCaptiveLeaseRenewalSymptom;
- (BOOL)fakeGeneralFixSymptom;
- (BOOL)fakeHardwareFixSymptom;
- (BOOL)fakeHomeKitSymptom;
- (BOOL)fakeICloudSymptom;
- (BOOL)fakeITunesSymptom;
- (BOOL)fakeInternetFixSymptom;
- (BOOL)fakeNetworkNotShareableSymptom;
- (BOOL)fakeNetworkProfileFixSymptom;
- (BOOL)fakeNetworkProfileInstallSymptom;
- (BOOL)fakeNetworkStrengthError;
- (BOOL)fakeStereoPairGeneralSymptom;
- (BOOL)fakeStereoPairNotFoundSymptom;
- (BOOL)fakeStereoPairVersionMismatchSymptom;
- (BOOL)fakeUnreachableError;
- (BOOL)fakeVPNProfileExpiredSymptom;
- (BOOL)fakeWiFiNetworkMismatchSymptom;
- (BOOL)fakeWiFiPerformanceSymptom;
- (BOOL)fakeWiFiSymptom;
- (HFHomeKitObject)homeKitObject;
- (HFItem)fake8021xNetworkSymptomItem;
- (HFItem)fakeCDPSymptomItem;
- (HFItem)fakeCaptiveLeaseRenewalSymptomItem;
- (HFItem)fakeGeneralFixSymptomItem;
- (HFItem)fakeHardwareFixSymptomItem;
- (HFItem)fakeHomeKitSymptomItem;
- (HFItem)fakeICloudSymptomItem;
- (HFItem)fakeITunesSymptomItem;
- (HFItem)fakeInternetFixSymptomItem;
- (HFItem)fakeNetworkNotShareableSymptomItem;
- (HFItem)fakeNetworkProfileFixSymptomItem;
- (HFItem)fakeNetworkProfileInstallSymptomItem;
- (HFItem)fakeNetworkStrengthErrorItem;
- (HFItem)fakeStereoPairGeneralSymptomItem;
- (HFItem)fakeStereoPairNotFoundSymptomItem;
- (HFItem)fakeStereoPairVersionMismatchSymptomItem;
- (HFItem)fakeUnreachableItem;
- (HFItem)fakeVPNProfileExpiredSymptomItem;
- (HFItem)fakeWiFiPerformanceSymptomItem;
- (HFItem)fakeWiFiSymptomItem;
- (HFItem)fakeWifiNetworkMismatchSymptomItem;
- (HFStaticItemProvider)debugItemProvider;
- (HMAccessory)accessory;
- (HMSymptomsHandler)symptomsHandler;
- (HUAccessoryDebugModule)initWithItemUpdater:(id)a3 homeKitObject:(id)a4;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (void)_pushSymptomUpdate;
- (void)_reloadItemProviders;
- (void)setFake8021xNetworkSymptom:(BOOL)a3;
- (void)setFakeCDPSymptom:(BOOL)a3;
- (void)setFakeCaptiveLeaseRenewalSymptom:(BOOL)a3;
- (void)setFakeGeneralFixSymptom:(BOOL)a3;
- (void)setFakeHardwareFixSymptom:(BOOL)a3;
- (void)setFakeHomeKitSymptom:(BOOL)a3;
- (void)setFakeICloudSymptom:(BOOL)a3;
- (void)setFakeITunesSymptom:(BOOL)a3;
- (void)setFakeInternetFixSymptom:(BOOL)a3;
- (void)setFakeNetworkNotShareableSymptom:(BOOL)a3;
- (void)setFakeNetworkProfileFixSymptom:(BOOL)a3;
- (void)setFakeNetworkProfileInstallSymptom:(BOOL)a3;
- (void)setFakeNetworkStrengthError:(BOOL)a3;
- (void)setFakeStereoPairGeneralSymptom:(BOOL)a3;
- (void)setFakeStereoPairNotFoundSymptom:(BOOL)a3;
- (void)setFakeStereoPairVersionMismatchSymptom:(BOOL)a3;
- (void)setFakeUnreachableError:(BOOL)a3;
- (void)setFakeVPNProfileExpiredSymptom:(BOOL)a3;
- (void)setFakeWiFiNetworkMismatchSymptom:(BOOL)a3;
- (void)setFakeWiFiPerformanceSymptom:(BOOL)a3;
- (void)setFakeWiFiSymptom:(BOOL)a3;
@end

@implementation HUAccessoryDebugModule

- (HUAccessoryDebugModule)initWithItemUpdater:(id)a3 homeKitObject:(id)a4
{
  id v7 = a3;
  id v92 = v7;
  id v93 = a4;
  if (!v93)
  {
    v90 = [MEMORY[0x1E4F28B00] currentHandler];
    [v90 handleFailureInMethod:a2, self, @"HUAccessoryDebugModule.m", 23, @"Invalid parameter not satisfying: %@", @"homeKitObject" object file lineNumber description];

    id v7 = v92;
  }
  v139.receiver = self;
  v139.super_class = (Class)HUAccessoryDebugModule;
  v8 = [(HFItemModule *)&v139 initWithItemUpdater:v7];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_homeKitObject, a4);
    objc_opt_class();
    id v10 = v93;
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;

    objc_opt_class();
    id v13 = v10;
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v91 = v14;

    objc_initWeak(&location, v9);
    if (objc_msgSend(v12, "hf_isHomePod"))
    {
      objc_storeStrong((id *)&v9->_accessory, v11);
      uint64_t v15 = [v12 symptomsHandler];
      symptomsHandler = v9->_symptomsHandler;
      v9->_symptomsHandler = (HMSymptomsHandler *)v15;

      id v17 = objc_alloc(MEMORY[0x1E4F695C0]);
      v136[0] = MEMORY[0x1E4F143A8];
      v136[1] = 3221225472;
      v136[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke;
      v136[3] = &unk_1E6384FD0;
      objc_copyWeak(&v137, &location);
      uint64_t v18 = [v17 initWithResultsBlock:v136];
      fakeUnreachableItem = v9->_fakeUnreachableItem;
      v9->_fakeUnreachableItem = (HFItem *)v18;

      id v20 = objc_alloc(MEMORY[0x1E4F695C0]);
      v134[0] = MEMORY[0x1E4F143A8];
      v134[1] = 3221225472;
      v134[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_2;
      v134[3] = &unk_1E6384FD0;
      objc_copyWeak(&v135, &location);
      uint64_t v21 = [v20 initWithResultsBlock:v134];
      fakeWiFiSymptomItem = v9->_fakeWiFiSymptomItem;
      v9->_fakeWiFiSymptomItem = (HFItem *)v21;

      id v23 = objc_alloc(MEMORY[0x1E4F695C0]);
      v132[0] = MEMORY[0x1E4F143A8];
      v132[1] = 3221225472;
      v132[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_3;
      v132[3] = &unk_1E6384FD0;
      objc_copyWeak(&v133, &location);
      uint64_t v24 = [v23 initWithResultsBlock:v132];
      fakeWiFiPerformanceSymptomItem = v9->_fakeWiFiPerformanceSymptomItem;
      v9->_fakeWiFiPerformanceSymptomItem = (HFItem *)v24;

      id v26 = objc_alloc(MEMORY[0x1E4F695C0]);
      v130[0] = MEMORY[0x1E4F143A8];
      v130[1] = 3221225472;
      v130[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_4;
      v130[3] = &unk_1E6384FD0;
      objc_copyWeak(&v131, &location);
      uint64_t v27 = [v26 initWithResultsBlock:v130];
      fakeWifiNetworkMismatchSymptomItem = v9->_fakeWifiNetworkMismatchSymptomItem;
      v9->_fakeWifiNetworkMismatchSymptomItem = (HFItem *)v27;

      id v29 = objc_alloc(MEMORY[0x1E4F695C0]);
      v128[0] = MEMORY[0x1E4F143A8];
      v128[1] = 3221225472;
      v128[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_5;
      v128[3] = &unk_1E6384FD0;
      objc_copyWeak(&v129, &location);
      uint64_t v30 = [v29 initWithResultsBlock:v128];
      fakeInternetFixSymptomItem = v9->_fakeInternetFixSymptomItem;
      v9->_fakeInternetFixSymptomItem = (HFItem *)v30;

      id v32 = objc_alloc(MEMORY[0x1E4F695C0]);
      v126[0] = MEMORY[0x1E4F143A8];
      v126[1] = 3221225472;
      v126[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_6;
      v126[3] = &unk_1E6384FD0;
      objc_copyWeak(&v127, &location);
      uint64_t v33 = [v32 initWithResultsBlock:v126];
      fakeHardwareFixSymptomItem = v9->_fakeHardwareFixSymptomItem;
      v9->_fakeHardwareFixSymptomItem = (HFItem *)v33;

      id v35 = objc_alloc(MEMORY[0x1E4F695C0]);
      v124[0] = MEMORY[0x1E4F143A8];
      v124[1] = 3221225472;
      v124[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_7;
      v124[3] = &unk_1E6384FD0;
      objc_copyWeak(&v125, &location);
      uint64_t v36 = [v35 initWithResultsBlock:v124];
      fakeGeneralFixSymptomItem = v9->_fakeGeneralFixSymptomItem;
      v9->_fakeGeneralFixSymptomItem = (HFItem *)v36;

      id v38 = objc_alloc(MEMORY[0x1E4F695C0]);
      v122[0] = MEMORY[0x1E4F143A8];
      v122[1] = 3221225472;
      v122[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_8;
      v122[3] = &unk_1E6384FD0;
      objc_copyWeak(&v123, &location);
      uint64_t v39 = [v38 initWithResultsBlock:v122];
      fakeHomeKitSymptomItem = v9->_fakeHomeKitSymptomItem;
      v9->_fakeHomeKitSymptomItem = (HFItem *)v39;

      id v41 = objc_alloc(MEMORY[0x1E4F695C0]);
      v120[0] = MEMORY[0x1E4F143A8];
      v120[1] = 3221225472;
      v120[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_9;
      v120[3] = &unk_1E6384FD0;
      objc_copyWeak(&v121, &location);
      uint64_t v42 = [v41 initWithResultsBlock:v120];
      fakeICloudSymptomItem = v9->_fakeICloudSymptomItem;
      v9->_fakeICloudSymptomItem = (HFItem *)v42;

      id v44 = objc_alloc(MEMORY[0x1E4F695C0]);
      v118[0] = MEMORY[0x1E4F143A8];
      v118[1] = 3221225472;
      v118[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_10;
      v118[3] = &unk_1E6384FD0;
      objc_copyWeak(&v119, &location);
      uint64_t v45 = [v44 initWithResultsBlock:v118];
      fakeITunesSymptomItem = v9->_fakeITunesSymptomItem;
      v9->_fakeITunesSymptomItem = (HFItem *)v45;

      id v47 = objc_alloc(MEMORY[0x1E4F695C0]);
      v116[0] = MEMORY[0x1E4F143A8];
      v116[1] = 3221225472;
      v116[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_11;
      v116[3] = &unk_1E6384FD0;
      objc_copyWeak(&v117, &location);
      uint64_t v48 = [v47 initWithResultsBlock:v116];
      fakeCDPSymptomItem = v9->_fakeCDPSymptomItem;
      v9->_fakeCDPSymptomItem = (HFItem *)v48;

      id v50 = objc_alloc(MEMORY[0x1E4F695C0]);
      v114[0] = MEMORY[0x1E4F143A8];
      v114[1] = 3221225472;
      v114[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_12;
      v114[3] = &unk_1E6384FD0;
      objc_copyWeak(&v115, &location);
      uint64_t v51 = [v50 initWithResultsBlock:v114];
      fakeVPNProfileExpiredSymptomItem = v9->_fakeVPNProfileExpiredSymptomItem;
      v9->_fakeVPNProfileExpiredSymptomItem = (HFItem *)v51;

      id v53 = objc_alloc(MEMORY[0x1E4F695C0]);
      v112[0] = MEMORY[0x1E4F143A8];
      v112[1] = 3221225472;
      v112[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_13;
      v112[3] = &unk_1E6384FD0;
      objc_copyWeak(&v113, &location);
      uint64_t v54 = [v53 initWithResultsBlock:v112];
      fake8021xNetworkSymptomItem = v9->_fake8021xNetworkSymptomItem;
      v9->_fake8021xNetworkSymptomItem = (HFItem *)v54;

      id v56 = objc_alloc(MEMORY[0x1E4F695C0]);
      v110[0] = MEMORY[0x1E4F143A8];
      v110[1] = 3221225472;
      v110[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_14;
      v110[3] = &unk_1E6384FD0;
      objc_copyWeak(&v111, &location);
      uint64_t v57 = [v56 initWithResultsBlock:v110];
      fakeNetworkProfileFixSymptomItem = v9->_fakeNetworkProfileFixSymptomItem;
      v9->_fakeNetworkProfileFixSymptomItem = (HFItem *)v57;

      id v59 = objc_alloc(MEMORY[0x1E4F695C0]);
      v108[0] = MEMORY[0x1E4F143A8];
      v108[1] = 3221225472;
      v108[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_15;
      v108[3] = &unk_1E6384FD0;
      objc_copyWeak(&v109, &location);
      uint64_t v60 = [v59 initWithResultsBlock:v108];
      fakeNetworkProfileInstallSymptomItem = v9->_fakeNetworkProfileInstallSymptomItem;
      v9->_fakeNetworkProfileInstallSymptomItem = (HFItem *)v60;

      id v62 = objc_alloc(MEMORY[0x1E4F695C0]);
      v106[0] = MEMORY[0x1E4F143A8];
      v106[1] = 3221225472;
      v106[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_16;
      v106[3] = &unk_1E6384FD0;
      objc_copyWeak(&v107, &location);
      uint64_t v63 = [v62 initWithResultsBlock:v106];
      fakeNetworkNotShareableSymptomItem = v9->_fakeNetworkNotShareableSymptomItem;
      v9->_fakeNetworkNotShareableSymptomItem = (HFItem *)v63;

      id v65 = objc_alloc(MEMORY[0x1E4F695C0]);
      v104[0] = MEMORY[0x1E4F143A8];
      v104[1] = 3221225472;
      v104[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_17;
      v104[3] = &unk_1E6384FD0;
      objc_copyWeak(&v105, &location);
      uint64_t v66 = [v65 initWithResultsBlock:v104];
      fakeCaptiveLeaseRenewalSymptomItem = v9->_fakeCaptiveLeaseRenewalSymptomItem;
      v9->_fakeCaptiveLeaseRenewalSymptomItem = (HFItem *)v66;

      id v68 = objc_alloc(MEMORY[0x1E4F695C0]);
      v102[0] = MEMORY[0x1E4F143A8];
      v102[1] = 3221225472;
      v102[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_18;
      v102[3] = &unk_1E6384FD0;
      objc_copyWeak(&v103, &location);
      uint64_t v69 = [v68 initWithResultsBlock:v102];
      fakeNetworkStrengthErrorItem = v9->_fakeNetworkStrengthErrorItem;
      v9->_fakeNetworkStrengthErrorItem = (HFItem *)v69;

      objc_destroyWeak(&v103);
      objc_destroyWeak(&v105);
      objc_destroyWeak(&v107);
      objc_destroyWeak(&v109);
      objc_destroyWeak(&v111);
      objc_destroyWeak(&v113);
      objc_destroyWeak(&v115);
      objc_destroyWeak(&v117);
      objc_destroyWeak(&v119);
      objc_destroyWeak(&v121);
      objc_destroyWeak(&v123);
      objc_destroyWeak(&v125);
      objc_destroyWeak(&v127);
      objc_destroyWeak(&v129);
      objc_destroyWeak(&v131);
      objc_destroyWeak(&v133);
      objc_destroyWeak(&v135);
      objc_destroyWeak(&v137);
    }
    v71 = v91;
    id v7 = v92;
    if (v91)
    {
      uint64_t v72 = [v91 symptomsHandler];
      v73 = v9->_symptomsHandler;
      v9->_symptomsHandler = (HMSymptomsHandler *)v72;

      id v74 = objc_alloc(MEMORY[0x1E4F695C0]);
      v100[0] = MEMORY[0x1E4F143A8];
      v100[1] = 3221225472;
      v100[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_19;
      v100[3] = &unk_1E6384FD0;
      objc_copyWeak(&v101, &location);
      uint64_t v75 = [v74 initWithResultsBlock:v100];
      fakeStereoPairGeneralSymptomItem = v9->_fakeStereoPairGeneralSymptomItem;
      v9->_fakeStereoPairGeneralSymptomItem = (HFItem *)v75;

      id v77 = objc_alloc(MEMORY[0x1E4F695C0]);
      v98[0] = MEMORY[0x1E4F143A8];
      v98[1] = 3221225472;
      v98[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_20;
      v98[3] = &unk_1E6384FD0;
      objc_copyWeak(&v99, &location);
      uint64_t v78 = [v77 initWithResultsBlock:v98];
      fakeStereoPairNotFoundSymptomItem = v9->_fakeStereoPairNotFoundSymptomItem;
      v9->_fakeStereoPairNotFoundSymptomItem = (HFItem *)v78;

      id v80 = objc_alloc(MEMORY[0x1E4F695C0]);
      v96[0] = MEMORY[0x1E4F143A8];
      v96[1] = 3221225472;
      v96[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_21;
      v96[3] = &unk_1E6384FD0;
      objc_copyWeak(&v97, &location);
      uint64_t v81 = [v80 initWithResultsBlock:v96];
      fakeStereoPairVersionMismatchSymptomItem = v9->_fakeStereoPairVersionMismatchSymptomItem;
      v9->_fakeStereoPairVersionMismatchSymptomItem = (HFItem *)v81;

      id v83 = objc_alloc(MEMORY[0x1E4F695C0]);
      v94[0] = MEMORY[0x1E4F143A8];
      v94[1] = 3221225472;
      v94[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_22;
      v94[3] = &unk_1E6384FD0;
      objc_copyWeak(&v95, &location);
      uint64_t v84 = [v83 initWithResultsBlock:v94];
      v85 = v9->_fake8021xNetworkSymptomItem;
      v9->_fake8021xNetworkSymptomItem = (HFItem *)v84;

      objc_destroyWeak(&v95);
      objc_destroyWeak(&v97);
      objc_destroyWeak(&v99);
      objc_destroyWeak(&v101);
      v71 = v91;
      id v7 = v92;
    }
    v86 = objc_opt_new();
    if ([MEMORY[0x1E4F69758] isInternalInstall])
    {
      objc_msgSend(v86, "na_safeAddObject:", v9->_fakeUnreachableItem);
      objc_msgSend(v86, "na_safeAddObject:", v9->_fakeWifiNetworkMismatchSymptomItem);
      objc_msgSend(v86, "na_safeAddObject:", v9->_fakeWiFiSymptomItem);
      objc_msgSend(v86, "na_safeAddObject:", v9->_fakeWiFiPerformanceSymptomItem);
      objc_msgSend(v86, "na_safeAddObject:", v9->_fakeInternetFixSymptomItem);
      objc_msgSend(v86, "na_safeAddObject:", v9->_fakeHardwareFixSymptomItem);
      objc_msgSend(v86, "na_safeAddObject:", v9->_fakeGeneralFixSymptomItem);
      objc_msgSend(v86, "na_safeAddObject:", v9->_fakeHomeKitSymptomItem);
      objc_msgSend(v86, "na_safeAddObject:", v9->_fakeICloudSymptomItem);
      objc_msgSend(v86, "na_safeAddObject:", v9->_fakeITunesSymptomItem);
      objc_msgSend(v86, "na_safeAddObject:", v9->_fakeCDPSymptomItem);
      objc_msgSend(v86, "na_safeAddObject:", v9->_fakeVPNProfileExpiredSymptomItem);
      objc_msgSend(v86, "na_safeAddObject:", v9->_fake8021xNetworkSymptomItem);
      objc_msgSend(v86, "na_safeAddObject:", v9->_fakeNetworkProfileFixSymptomItem);
      objc_msgSend(v86, "na_safeAddObject:", v9->_fakeNetworkProfileInstallSymptomItem);
      objc_msgSend(v86, "na_safeAddObject:", v9->_fakeNetworkNotShareableSymptomItem);
      objc_msgSend(v86, "na_safeAddObject:", v9->_fakeCaptiveLeaseRenewalSymptomItem);
      objc_msgSend(v86, "na_safeAddObject:", v9->_fakeNetworkStrengthErrorItem);
      objc_msgSend(v86, "na_safeAddObject:", v9->_fakeStereoPairGeneralSymptomItem);
      objc_msgSend(v86, "na_safeAddObject:", v9->_fakeStereoPairNotFoundSymptomItem);
      objc_msgSend(v86, "na_safeAddObject:", v9->_fakeStereoPairVersionMismatchSymptomItem);
    }
    uint64_t v87 = [objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v86];
    debugItemProvider = v9->_debugItemProvider;
    v9->_debugItemProvider = (HFStaticItemProvider *)v87;

    objc_destroyWeak(&location);
  }

  return v9;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_opt_new();
  [v2 setObject:@"Fake Reachability Error" forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v3 = NSNumber;
  [WeakRetained fakeUnreachableError];
  v4 = [v3 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_opt_new();
  [v2 setObject:@"Fake WiFi Symptom" forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v3 = NSNumber;
  [WeakRetained fakeWiFiSymptom];
  v4 = [v3 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_opt_new();
  [v2 setObject:@"Fake WiFi Perf Symptom" forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v3 = NSNumber;
  [WeakRetained fakeWiFiPerformanceSymptom];
  v4 = [v3 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_opt_new();
  [v2 setObject:@"Fake WiFi Network Mismatch" forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v3 = NSNumber;
  [WeakRetained fakeWiFiNetworkMismatchSymptom];
  v4 = [v3 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_opt_new();
  [v2 setObject:@"Fake Internet Symptom" forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v3 = NSNumber;
  [WeakRetained fakeInternetFixSymptom];
  v4 = [v3 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_opt_new();
  [v2 setObject:@"Fake Hardware Symptom" forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v3 = NSNumber;
  [WeakRetained fakeHardwareFixSymptom];
  v4 = [v3 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_opt_new();
  [v2 setObject:@"Fake General Symptom" forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v3 = NSNumber;
  [WeakRetained fakeGeneralFixSymptom];
  v4 = [v3 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_opt_new();
  [v2 setObject:@"Fake HomeKit Symptom" forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v3 = NSNumber;
  [WeakRetained fakeHomeKitSymptom];
  v4 = [v3 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_opt_new();
  [v2 setObject:@"Fake iCloud Symptom" forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v3 = NSNumber;
  [WeakRetained fakeICloudSymptom];
  v4 = [v3 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_opt_new();
  [v2 setObject:@"Fake iTunes Symptom" forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v3 = NSNumber;
  [WeakRetained fakeITunesSymptom];
  v4 = [v3 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_opt_new();
  [v2 setObject:@"Fake CDP Symptom" forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v3 = NSNumber;
  [WeakRetained fakeCDPSymptom];
  v4 = [v3 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_12(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_opt_new();
  [v2 setObject:@"Fake VPN Profile Expired Symptom" forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v3 = NSNumber;
  [WeakRetained fakeVPNProfileExpiredSymptom];
  v4 = [v3 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_13(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_opt_new();
  [v2 setObject:@"Fake 802.1x Network Symptom" forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v3 = NSNumber;
  [WeakRetained fake8021xNetworkSymptom];
  v4 = [v3 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_opt_new();
  [v2 setObject:@"Fake Network Profile Fix Symptom" forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v3 = NSNumber;
  [WeakRetained fakeNetworkProfileFixSymptom];
  v4 = [v3 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_15(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_opt_new();
  [v2 setObject:@"Fake Network Profile Install Symptom" forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v3 = NSNumber;
  [WeakRetained fakeNetworkProfileInstallSymptom];
  v4 = [v3 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_16(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_opt_new();
  [v2 setObject:@"Fake Network Not Shareable Symptom" forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v3 = NSNumber;
  [WeakRetained fakeNetworkNotShareableSymptom];
  v4 = [v3 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_17(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_opt_new();
  [v2 setObject:@"Fake Captive Lease Renewal" forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v3 = NSNumber;
  [WeakRetained fakeCaptiveLeaseRenewalSymptom];
  v4 = [v3 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_opt_new();
  [v2 setObject:@"Fake WiFi Indicator Problem" forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v3 = NSNumber;
  [WeakRetained fakeNetworkStrengthError];
  v4 = [v3 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_19(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_opt_new();
  [v2 setObject:@"Fake Stereo Pair General Symptom" forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v3 = NSNumber;
  [WeakRetained fakeStereoPairGeneralSymptom];
  v4 = [v3 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_20(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_opt_new();
  [v2 setObject:@"Fake Stereo Pair not Found Symptom" forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v3 = NSNumber;
  [WeakRetained fakeStereoPairNotFoundSymptom];
  v4 = [v3 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_21(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_opt_new();
  [v2 setObject:@"Fake Stereo Pair Version Mismatch Symptom" forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v3 = NSNumber;
  [WeakRetained fakeStereoPairVersionMismatchSymptom];
  v4 = [v3 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_22(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_opt_new();
  [v2 setObject:@"Fake 802.1x Network Symptom" forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v3 = NSNumber;
  [WeakRetained fake8021xNetworkSymptom];
  v4 = [v3 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v5;
}

- (id)itemProviders
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(HUAccessoryDebugModule *)self debugItemProvider];
  v4 = [v2 setWithObject:v3];

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  if (HFPreferencesInternalDebuggingEnabled() && [v4 count])
  {
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    v6 = [(HUAccessoryDebugModule *)self fakeUnreachableItem];
    id v7 = [(HUAccessoryDebugModule *)self fakeNetworkStrengthErrorItem];
    v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, 0);
    v34 = objc_msgSend(v8, "na_setByIntersectingWithSet:", v4);

    id v32 = (void *)MEMORY[0x1E4F1CAD0];
    id v41 = [(HUAccessoryDebugModule *)self fakeInternetFixSymptomItem];
    v31 = [(HUAccessoryDebugModule *)self fakeWiFiSymptomItem];
    uint64_t v39 = [(HUAccessoryDebugModule *)self fakeWiFiPerformanceSymptomItem];
    id v38 = [(HUAccessoryDebugModule *)self fake8021xNetworkSymptomItem];
    [(HUAccessoryDebugModule *)self fakeNetworkProfileFixSymptomItem];
    v37 = id v40 = v4;
    uint64_t v36 = [(HUAccessoryDebugModule *)self fakeNetworkProfileInstallSymptomItem];
    id v35 = [(HUAccessoryDebugModule *)self fakeNetworkNotShareableSymptomItem];
    uint64_t v30 = [(HUAccessoryDebugModule *)self fakeHardwareFixSymptomItem];
    v9 = [(HUAccessoryDebugModule *)self fakeGeneralFixSymptomItem];
    id v10 = [(HUAccessoryDebugModule *)self fakeHomeKitSymptomItem];
    id v29 = [(HUAccessoryDebugModule *)self fakeITunesSymptomItem];
    v11 = [(HUAccessoryDebugModule *)self fakeICloudSymptomItem];
    id v12 = [(HUAccessoryDebugModule *)self fakeCDPSymptomItem];
    id v13 = [(HUAccessoryDebugModule *)self fakeWifiNetworkMismatchSymptomItem];
    v14 = [(HUAccessoryDebugModule *)self fakeVPNProfileExpiredSymptomItem];
    uint64_t v15 = [(HUAccessoryDebugModule *)self fakeCaptiveLeaseRenewalSymptomItem];
    v16 = objc_msgSend(v32, "setWithObjects:", v41, v31, v39, v38, v37, v36, v35, v30, v9, v10, v29, v11, v12, v13, v14, v15, 0);
    uint64_t v33 = objc_msgSend(v16, "na_setByIntersectingWithSet:", v40);

    id v4 = v40;
    id v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = [(HUAccessoryDebugModule *)self fakeStereoPairNotFoundSymptomItem];
    v19 = [(HUAccessoryDebugModule *)self fakeStereoPairVersionMismatchSymptomItem];
    id v20 = [(HUAccessoryDebugModule *)self fakeStereoPairGeneralSymptomItem];
    uint64_t v21 = [(HUAccessoryDebugModule *)self fake8021xNetworkSymptomItem];
    v22 = objc_msgSend(v17, "setWithObjects:", v18, v19, v20, v21, 0);
    id v23 = objc_msgSend(v22, "na_setByIntersectingWithSet:", v40);

    uint64_t v24 = objc_opt_new();
    v25 = __58__HUAccessoryDebugModule_buildSectionsWithDisplayedItems___block_invoke(@"Accessory Debugging", v34);
    objc_msgSend(v24, "na_safeAddObject:", v25);

    id v26 = __58__HUAccessoryDebugModule_buildSectionsWithDisplayedItems___block_invoke(@"Symptom Debugging", v33);
    objc_msgSend(v24, "na_safeAddObject:", v26);

    uint64_t v27 = __58__HUAccessoryDebugModule_buildSectionsWithDisplayedItems___block_invoke(@"Stereo Pair Symptom Debugging", v23);
    objc_msgSend(v24, "na_safeAddObject:", v27);
  }
  else
  {
    uint64_t v24 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v24;
}

id __58__HUAccessoryDebugModule_buildSectionsWithDisplayedItems___block_invoke(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v4 count])
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:v3];
    [v5 setHeaderTitle:v3];
    [v5 setFooterTitle:@"*** INTERNAL USE ONLY ***"];
    v6 = [v4 allObjects];
    id v7 = [MEMORY[0x1E4F69220] defaultItemComparator];
    v8 = [v6 sortedArrayUsingComparator:v7];
    [v5 setItems:v8];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)fakeICloudSymptom
{
  v2 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v3 = [v2 uniqueIdentifier];
  id v4 = [v3 UUIDString];
  v5 = HFPreferencesAccessoryValueForKey();
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)setFakeICloudSymptom:(BOOL)a3
{
  id v4 = [(HUAccessoryDebugModule *)self homeKitObject];
  v5 = [v4 uniqueIdentifier];
  char v6 = [v5 UUIDString];
  HFPreferencesAccessorySetValueForKey();

  [(HUAccessoryDebugModule *)self _pushSymptomUpdate];

  [(HUAccessoryDebugModule *)self _reloadItemProviders];
}

- (BOOL)fakeITunesSymptom
{
  v2 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v3 = [v2 uniqueIdentifier];
  id v4 = [v3 UUIDString];
  v5 = HFPreferencesAccessoryValueForKey();
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)setFakeITunesSymptom:(BOOL)a3
{
  id v4 = [(HUAccessoryDebugModule *)self homeKitObject];
  v5 = [v4 uniqueIdentifier];
  char v6 = [v5 UUIDString];
  HFPreferencesAccessorySetValueForKey();

  [(HUAccessoryDebugModule *)self _pushSymptomUpdate];

  [(HUAccessoryDebugModule *)self _reloadItemProviders];
}

- (BOOL)fakeCDPSymptom
{
  v2 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v3 = [v2 uniqueIdentifier];
  id v4 = [v3 UUIDString];
  v5 = HFPreferencesAccessoryValueForKey();
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)setFakeCDPSymptom:(BOOL)a3
{
  id v4 = [(HUAccessoryDebugModule *)self homeKitObject];
  v5 = [v4 uniqueIdentifier];
  char v6 = [v5 UUIDString];
  HFPreferencesAccessorySetValueForKey();

  [(HUAccessoryDebugModule *)self _pushSymptomUpdate];

  [(HUAccessoryDebugModule *)self _reloadItemProviders];
}

- (BOOL)fakeGeneralFixSymptom
{
  v2 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v3 = [v2 uniqueIdentifier];
  id v4 = [v3 UUIDString];
  v5 = HFPreferencesAccessoryValueForKey();
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)setFakeGeneralFixSymptom:(BOOL)a3
{
  id v4 = [(HUAccessoryDebugModule *)self homeKitObject];
  v5 = [v4 uniqueIdentifier];
  char v6 = [v5 UUIDString];
  HFPreferencesAccessorySetValueForKey();

  [(HUAccessoryDebugModule *)self _pushSymptomUpdate];

  [(HUAccessoryDebugModule *)self _reloadItemProviders];
}

- (BOOL)fakeHomeKitSymptom
{
  v2 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v3 = [v2 uniqueIdentifier];
  id v4 = [v3 UUIDString];
  v5 = HFPreferencesAccessoryValueForKey();
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)setFakeHomeKitSymptom:(BOOL)a3
{
  id v4 = [(HUAccessoryDebugModule *)self homeKitObject];
  v5 = [v4 uniqueIdentifier];
  char v6 = [v5 UUIDString];
  HFPreferencesAccessorySetValueForKey();

  [(HUAccessoryDebugModule *)self _pushSymptomUpdate];

  [(HUAccessoryDebugModule *)self _reloadItemProviders];
}

- (BOOL)fakeUnreachableError
{
  v2 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v3 = [v2 uniqueIdentifier];
  id v4 = [v3 UUIDString];
  v5 = HFPreferencesAccessoryValueForKey();
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)setFakeUnreachableError:(BOOL)a3
{
  id v4 = [(HUAccessoryDebugModule *)self homeKitObject];
  v5 = [v4 uniqueIdentifier];
  char v6 = [v5 UUIDString];
  HFPreferencesAccessorySetValueForKey();

  id v7 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__HUAccessoryDebugModule_setFakeUnreachableError___block_invoke;
  v8[3] = &unk_1E638C990;
  v8[4] = self;
  [v7 dispatchAccessoryObserverMessage:v8 sender:0];

  [(HUAccessoryDebugModule *)self _reloadItemProviders];
}

void __50__HUAccessoryDebugModule_setFakeUnreachableError___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) accessory];
    [v5 accessoryDidUpdateReachability:v3];
  }
  if (objc_opt_respondsToSelector())
  {
    id v4 = [*(id *)(a1 + 32) accessory];
    [v5 accessoryDidUpdateReachableTransports:v4];
  }
}

- (BOOL)fakeWiFiNetworkMismatchSymptom
{
  v2 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v3 = [v2 uniqueIdentifier];
  id v4 = [v3 UUIDString];
  id v5 = HFPreferencesAccessoryValueForKey();
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)setFakeWiFiNetworkMismatchSymptom:(BOOL)a3
{
  id v4 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v5 = [v4 uniqueIdentifier];
  char v6 = [v5 UUIDString];
  HFPreferencesAccessorySetValueForKey();

  [(HUAccessoryDebugModule *)self _pushSymptomUpdate];

  [(HUAccessoryDebugModule *)self _reloadItemProviders];
}

- (BOOL)fakeVPNProfileExpiredSymptom
{
  v2 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v3 = [v2 uniqueIdentifier];
  id v4 = [v3 UUIDString];
  id v5 = HFPreferencesAccessoryValueForKey();
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)setFakeVPNProfileExpiredSymptom:(BOOL)a3
{
  id v4 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v5 = [v4 uniqueIdentifier];
  char v6 = [v5 UUIDString];
  HFPreferencesAccessorySetValueForKey();

  [(HUAccessoryDebugModule *)self _pushSymptomUpdate];

  [(HUAccessoryDebugModule *)self _reloadItemProviders];
}

- (BOOL)fakeWiFiSymptom
{
  v2 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v3 = [v2 uniqueIdentifier];
  id v4 = [v3 UUIDString];
  id v5 = HFPreferencesAccessoryValueForKey();
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)setFakeWiFiSymptom:(BOOL)a3
{
  id v4 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v5 = [v4 uniqueIdentifier];
  char v6 = [v5 UUIDString];
  HFPreferencesAccessorySetValueForKey();

  [(HUAccessoryDebugModule *)self _pushSymptomUpdate];

  [(HUAccessoryDebugModule *)self _reloadItemProviders];
}

- (BOOL)fakeWiFiPerformanceSymptom
{
  v2 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v3 = [v2 uniqueIdentifier];
  id v4 = [v3 UUIDString];
  id v5 = HFPreferencesAccessoryValueForKey();
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)setFakeWiFiPerformanceSymptom:(BOOL)a3
{
  id v4 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v5 = [v4 uniqueIdentifier];
  char v6 = [v5 UUIDString];
  HFPreferencesAccessorySetValueForKey();

  [(HUAccessoryDebugModule *)self _pushSymptomUpdate];

  [(HUAccessoryDebugModule *)self _reloadItemProviders];
}

- (BOOL)fakeInternetFixSymptom
{
  v2 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v3 = [v2 uniqueIdentifier];
  id v4 = [v3 UUIDString];
  id v5 = HFPreferencesAccessoryValueForKey();
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)setFakeInternetFixSymptom:(BOOL)a3
{
  id v4 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v5 = [v4 uniqueIdentifier];
  char v6 = [v5 UUIDString];
  HFPreferencesAccessorySetValueForKey();

  [(HUAccessoryDebugModule *)self _pushSymptomUpdate];

  [(HUAccessoryDebugModule *)self _reloadItemProviders];
}

- (BOOL)fakeHardwareFixSymptom
{
  v2 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v3 = [v2 uniqueIdentifier];
  id v4 = [v3 UUIDString];
  id v5 = HFPreferencesAccessoryValueForKey();
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)setFakeHardwareFixSymptom:(BOOL)a3
{
  id v4 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v5 = [v4 uniqueIdentifier];
  char v6 = [v5 UUIDString];
  HFPreferencesAccessorySetValueForKey();

  [(HUAccessoryDebugModule *)self _pushSymptomUpdate];

  [(HUAccessoryDebugModule *)self _reloadItemProviders];
}

- (BOOL)fakeStereoPairGeneralSymptom
{
  v2 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v3 = [v2 uniqueIdentifier];
  id v4 = [v3 UUIDString];
  id v5 = HFPreferencesAccessoryValueForKey();
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)setFakeStereoPairGeneralSymptom:(BOOL)a3
{
  id v4 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v5 = [v4 uniqueIdentifier];
  char v6 = [v5 UUIDString];
  HFPreferencesAccessorySetValueForKey();

  [(HUAccessoryDebugModule *)self _pushSymptomUpdate];

  [(HUAccessoryDebugModule *)self _reloadItemProviders];
}

- (BOOL)fakeStereoPairNotFoundSymptom
{
  v2 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v3 = [v2 uniqueIdentifier];
  id v4 = [v3 UUIDString];
  id v5 = HFPreferencesAccessoryValueForKey();
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)setFakeStereoPairNotFoundSymptom:(BOOL)a3
{
  id v4 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v5 = [v4 uniqueIdentifier];
  char v6 = [v5 UUIDString];
  HFPreferencesAccessorySetValueForKey();

  [(HUAccessoryDebugModule *)self _pushSymptomUpdate];

  [(HUAccessoryDebugModule *)self _reloadItemProviders];
}

- (BOOL)fakeStereoPairVersionMismatchSymptom
{
  v2 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v3 = [v2 uniqueIdentifier];
  id v4 = [v3 UUIDString];
  id v5 = HFPreferencesAccessoryValueForKey();
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)setFakeStereoPairVersionMismatchSymptom:(BOOL)a3
{
  id v4 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v5 = [v4 uniqueIdentifier];
  char v6 = [v5 UUIDString];
  HFPreferencesAccessorySetValueForKey();

  [(HUAccessoryDebugModule *)self _pushSymptomUpdate];

  [(HUAccessoryDebugModule *)self _reloadItemProviders];
}

- (BOOL)fake8021xNetworkSymptom
{
  v2 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v3 = [v2 uniqueIdentifier];
  id v4 = [v3 UUIDString];
  id v5 = HFPreferencesAccessoryValueForKey();
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)setFake8021xNetworkSymptom:(BOOL)a3
{
  id v4 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v5 = [v4 uniqueIdentifier];
  char v6 = [v5 UUIDString];
  HFPreferencesAccessorySetValueForKey();

  [(HUAccessoryDebugModule *)self _pushSymptomUpdate];

  [(HUAccessoryDebugModule *)self _reloadItemProviders];
}

- (BOOL)fakeNetworkProfileFixSymptom
{
  v2 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v3 = [v2 uniqueIdentifier];
  id v4 = [v3 UUIDString];
  id v5 = HFPreferencesAccessoryValueForKey();
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)setFakeNetworkProfileFixSymptom:(BOOL)a3
{
  id v4 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v5 = [v4 uniqueIdentifier];
  char v6 = [v5 UUIDString];
  HFPreferencesAccessorySetValueForKey();

  [(HUAccessoryDebugModule *)self _pushSymptomUpdate];

  [(HUAccessoryDebugModule *)self _reloadItemProviders];
}

- (BOOL)fakeNetworkProfileInstallSymptom
{
  v2 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v3 = [v2 uniqueIdentifier];
  id v4 = [v3 UUIDString];
  id v5 = HFPreferencesAccessoryValueForKey();
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)setFakeNetworkProfileInstallSymptom:(BOOL)a3
{
  id v4 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v5 = [v4 uniqueIdentifier];
  char v6 = [v5 UUIDString];
  HFPreferencesAccessorySetValueForKey();

  [(HUAccessoryDebugModule *)self _pushSymptomUpdate];

  [(HUAccessoryDebugModule *)self _reloadItemProviders];
}

- (BOOL)fakeNetworkNotShareableSymptom
{
  v2 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v3 = [v2 uniqueIdentifier];
  id v4 = [v3 UUIDString];
  id v5 = HFPreferencesAccessoryValueForKey();
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)setFakeNetworkNotShareableSymptom:(BOOL)a3
{
  id v4 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v5 = [v4 uniqueIdentifier];
  char v6 = [v5 UUIDString];
  HFPreferencesAccessorySetValueForKey();

  [(HUAccessoryDebugModule *)self _pushSymptomUpdate];

  [(HUAccessoryDebugModule *)self _reloadItemProviders];
}

- (BOOL)fakeCaptiveLeaseRenewalSymptom
{
  v2 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v3 = [v2 uniqueIdentifier];
  id v4 = [v3 UUIDString];
  id v5 = HFPreferencesAccessoryValueForKey();
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)setFakeCaptiveLeaseRenewalSymptom:(BOOL)a3
{
  id v4 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v5 = [v4 uniqueIdentifier];
  char v6 = [v5 UUIDString];
  HFPreferencesAccessorySetValueForKey();

  [(HUAccessoryDebugModule *)self _pushSymptomUpdate];

  [(HUAccessoryDebugModule *)self _reloadItemProviders];
}

- (BOOL)fakeNetworkStrengthError
{
  v2 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v3 = [v2 uniqueIdentifier];
  id v4 = [v3 UUIDString];
  id v5 = HFPreferencesAccessoryValueForKey();
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)setFakeNetworkStrengthError:(BOOL)a3
{
  id v4 = [(HUAccessoryDebugModule *)self homeKitObject];
  id v5 = [v4 uniqueIdentifier];
  char v6 = [v5 UUIDString];
  HFPreferencesAccessorySetValueForKey();

  [(HUAccessoryDebugModule *)self _reloadItemProviders];
}

- (void)_reloadItemProviders
{
  id v4 = (void *)MEMORY[0x1E4F69230];
  id v5 = [(HUAccessoryDebugModule *)self itemProviders];
  id v8 = [v4 requestToReloadItemProviders:v5 senderSelector:a2];

  char v6 = [(HFItemModule *)self itemUpdater];
  id v7 = (id)[v6 performItemUpdateRequest:v8];
}

- (void)_pushSymptomUpdate
{
  v2 = [(HUAccessoryDebugModule *)self symptomsHandler];
  id v3 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__HUAccessoryDebugModule__pushSymptomUpdate__block_invoke;
  v5[3] = &unk_1E638E980;
  id v6 = v2;
  id v4 = v2;
  [v3 dispatchSymptomsHandlerMessage:v5 sender:0];
}

void __44__HUAccessoryDebugModule__pushSymptomUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v3 symptoms];
    [v5 symptomsHandler:v3 didUpdateSymptoms:v4];
  }
}

- (HFHomeKitObject)homeKitObject
{
  return self->_homeKitObject;
}

- (HFItem)fakeUnreachableItem
{
  return self->_fakeUnreachableItem;
}

- (HFItem)fakeWiFiSymptomItem
{
  return self->_fakeWiFiSymptomItem;
}

- (HFItem)fakeWiFiPerformanceSymptomItem
{
  return self->_fakeWiFiPerformanceSymptomItem;
}

- (HFItem)fakeInternetFixSymptomItem
{
  return self->_fakeInternetFixSymptomItem;
}

- (HFItem)fakeHardwareFixSymptomItem
{
  return self->_fakeHardwareFixSymptomItem;
}

- (HFItem)fakeGeneralFixSymptomItem
{
  return self->_fakeGeneralFixSymptomItem;
}

- (HFItem)fakeHomeKitSymptomItem
{
  return self->_fakeHomeKitSymptomItem;
}

- (HFItem)fakeICloudSymptomItem
{
  return self->_fakeICloudSymptomItem;
}

- (HFItem)fakeITunesSymptomItem
{
  return self->_fakeITunesSymptomItem;
}

- (HFItem)fakeCDPSymptomItem
{
  return self->_fakeCDPSymptomItem;
}

- (HFItem)fakeWifiNetworkMismatchSymptomItem
{
  return self->_fakeWifiNetworkMismatchSymptomItem;
}

- (HFItem)fakeVPNProfileExpiredSymptomItem
{
  return self->_fakeVPNProfileExpiredSymptomItem;
}

- (HFItem)fake8021xNetworkSymptomItem
{
  return self->_fake8021xNetworkSymptomItem;
}

- (HFItem)fakeNetworkProfileFixSymptomItem
{
  return self->_fakeNetworkProfileFixSymptomItem;
}

- (HFItem)fakeNetworkProfileInstallSymptomItem
{
  return self->_fakeNetworkProfileInstallSymptomItem;
}

- (HFItem)fakeNetworkNotShareableSymptomItem
{
  return self->_fakeNetworkNotShareableSymptomItem;
}

- (HFItem)fakeCaptiveLeaseRenewalSymptomItem
{
  return self->_fakeCaptiveLeaseRenewalSymptomItem;
}

- (HFItem)fakeNetworkStrengthErrorItem
{
  return self->_fakeNetworkStrengthErrorItem;
}

- (HFItem)fakeStereoPairGeneralSymptomItem
{
  return self->_fakeStereoPairGeneralSymptomItem;
}

- (HFItem)fakeStereoPairNotFoundSymptomItem
{
  return self->_fakeStereoPairNotFoundSymptomItem;
}

- (HFItem)fakeStereoPairVersionMismatchSymptomItem
{
  return self->_fakeStereoPairVersionMismatchSymptomItem;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (HMSymptomsHandler)symptomsHandler
{
  return self->_symptomsHandler;
}

- (HFStaticItemProvider)debugItemProvider
{
  return self->_debugItemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugItemProvider, 0);
  objc_storeStrong((id *)&self->_symptomsHandler, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_fakeStereoPairVersionMismatchSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeStereoPairNotFoundSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeStereoPairGeneralSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeNetworkStrengthErrorItem, 0);
  objc_storeStrong((id *)&self->_fakeCaptiveLeaseRenewalSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeNetworkNotShareableSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeNetworkProfileInstallSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeNetworkProfileFixSymptomItem, 0);
  objc_storeStrong((id *)&self->_fake8021xNetworkSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeVPNProfileExpiredSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeWifiNetworkMismatchSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeCDPSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeITunesSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeICloudSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeHomeKitSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeGeneralFixSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeHardwareFixSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeInternetFixSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeWiFiPerformanceSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeWiFiSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeUnreachableItem, 0);

  objc_storeStrong((id *)&self->_homeKitObject, 0);
}

@end