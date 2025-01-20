@interface HUEditLocationItemManager
- (BOOL)_inviteUsersItemAllowed;
- (BOOL)_isCurrentUserRestrictedGuest;
- (HFAccessoryCategoryItemProvider)allowedAccessoryCategoryItemProvider;
- (HFHomeBuilder)homeBuilder;
- (HFItem)cameraItem;
- (HFItem)chooseWallpaperItem;
- (HFItem)detailNotesItem;
- (HFItem)guestsItem;
- (HFItem)homeScheduleItem;
- (HFItem)inviteUsersItem;
- (HFItem)locationServicesSettingItem;
- (HFItem)nameItem;
- (HFItem)removeItem;
- (HFItem)showPredictedScenes;
- (HFItem)softwareUpdateItem;
- (HFItem)soundCheckItem;
- (HFItem)wallpaperPickerItem;
- (HFItem)wallpaperThumbnailItem;
- (HFItemProvider)inviteItemProvider;
- (HFItemProvider)userItemProvider;
- (HFPinCodeManager)pinCodeManager;
- (HFStaticNonBlockingItemProvider)nonBlockingItemProvider;
- (HUEditLocationItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HUEditLocationItemManager)initWithHomeBuilder:(id)a3 delegate:(id)a4;
- (HUEditLocationItemManager)initWithHomeBuilder:(id)a3 delegate:(id)a4 context:(unint64_t)a5;
- (HUMatterConnectedServicesItemModule)connectedServicesItemModule;
- (HUSiriTriggerPhraseSettingItem)siriTriggerPhraseSettingItem;
- (HUUserNotificationTopicListModule)notificationSettingsModule;
- (id)_buildItemModulesForHome:(id)a3;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_homeFuture;
- (id)_itemsToHideInSet:(id)a3;
- (id)updateLocationServicesEnabled:(BOOL)a3;
- (unint64_t)context;
- (void)_registerForExternalUpdates;
- (void)_unregisterForExternalUpdates;
- (void)pinCodeManagerDidUpdate:(id)a3 pinCodes:(id)a4;
- (void)setAllowedAccessoryCategoryItemProvider:(id)a3;
- (void)setCameraItem:(id)a3;
- (void)setChooseWallpaperItem:(id)a3;
- (void)setConnectedServicesItemModule:(id)a3;
- (void)setDetailNotesItem:(id)a3;
- (void)setGuestsItem:(id)a3;
- (void)setHomeBuilder:(id)a3;
- (void)setHomeScheduleItem:(id)a3;
- (void)setInviteItemProvider:(id)a3;
- (void)setInviteUsersItem:(id)a3;
- (void)setLocationServicesSettingItem:(id)a3;
- (void)setNameItem:(id)a3;
- (void)setNonBlockingItemProvider:(id)a3;
- (void)setNotificationSettingsModule:(id)a3;
- (void)setPinCodeManager:(id)a3;
- (void)setRemoveItem:(id)a3;
- (void)setShowPredictedScenes:(id)a3;
- (void)setSiriTriggerPhraseSettingItem:(id)a3;
- (void)setSoftwareUpdateItem:(id)a3;
- (void)setSoundCheckItem:(id)a3;
- (void)setUserItemProvider:(id)a3;
- (void)setWallpaperPickerItem:(id)a3;
- (void)setWallpaperThumbnailItem:(id)a3;
@end

@implementation HUEditLocationItemManager

- (HUEditLocationItemManager)initWithHomeBuilder:(id)a3 delegate:(id)a4 context:(unint64_t)a5
{
  id v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HUEditLocationItemManager;
  v10 = [(HFItemManager *)&v18 initWithDelegate:a4 sourceItem:0];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_homeBuilder, a3);
    v11->_context = a5;
    v12 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v13 = [v9 home];
    v14 = [v12 pinCodeManagerForHome:v13];
    [(HUEditLocationItemManager *)v11 setPinCodeManager:v14];

    v15 = [(HUEditLocationItemManager *)v11 pinCodeManager];
    id v16 = (id)[v15 fetchFromAccessoryCache];
  }
  return v11;
}

- (HUEditLocationItemManager)initWithHomeBuilder:(id)a3 delegate:(id)a4
{
  return [(HUEditLocationItemManager *)self initWithHomeBuilder:a3 delegate:a4 context:0];
}

- (HUEditLocationItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithHomeBuilder_delegate_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUEditLocationItemManager.m", 162, @"%s is unavailable; use %@ instead",
    "-[HUEditLocationItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (id)updateLocationServicesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  v6 = [(HFItemManager *)self home];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__HUEditLocationItemManager_updateLocationServicesEnabled___block_invoke;
  v9[3] = &unk_1E6386708;
  id v7 = v5;
  id v10 = v7;
  [v6 updateLocationServicesEnabled:v3 completion:v9];

  return v7;
}

uint64_t __59__HUEditLocationItemManager_updateLocationServicesEnabled___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    uint64_t v3 = MEMORY[0x1E4F1CC28];
  }
  else {
    uint64_t v3 = MEMORY[0x1E4F1CC38];
  }
  return [v2 finishWithResult:v3 error:a2];
}

- (id)_buildItemModulesForHome:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v6 = [[HUUserNotificationTopicListModule alloc] initWithItemUpdater:self home:v4];
  [(HUEditLocationItemManager *)self setNotificationSettingsModule:v6];

  id v7 = [[HUMatterConnectedServicesItemModule alloc] initWithItemUpdater:self home:v4];
  [(HUEditLocationItemManager *)self setConnectedServicesItemModule:v7];

  if (![(HUEditLocationItemManager *)self _isCurrentUserRestrictedGuest])
  {
    v8 = [(HUEditLocationItemManager *)self notificationSettingsModule];
    [v5 addObject:v8];
  }
  if (![(HUEditLocationItemManager *)self _isCurrentUserRestrictedGuest])
  {
    id v9 = [(HUEditLocationItemManager *)self connectedServicesItemModule];
    [v5 addObject:v9];
  }

  return v5;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v181[6] = *MEMORY[0x1E4F143B8];
  id v141 = a3;
  id v4 = [MEMORY[0x1E4F695C0] emptyItem];
  [(HUEditLocationItemManager *)self setNameItem:v4];

  BOOL v5 = [(HUEditLocationItemManager *)self _inviteUsersItemAllowed];
  objc_initWeak(&location, self);
  id v6 = objc_alloc(MEMORY[0x1E4F695C0]);
  v177[0] = *MEMORY[0x1E4F68AB8];
  uint64_t v143 = v177[0];
  id v7 = _HULocalizedStringWithDefaultValue(@"HUEditLocationInvitePeopleTitle", @"HUEditLocationInvitePeopleTitle", 1);
  uint64_t v8 = *MEMORY[0x1E4F68928];
  v181[0] = v7;
  v181[1] = @"Home.HomeSettings.InvitePeople";
  uint64_t v9 = *MEMORY[0x1E4F68A08];
  v177[1] = v8;
  v177[2] = v9;
  id v10 = NSNumber;
  v11 = [MEMORY[0x1E4F692A0] sharedDispatcher];
  v12 = objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "isUsingiCloud") ^ 1);
  v181[2] = v12;
  v178 = (id *)*MEMORY[0x1E4F68B10];
  v145 = v178;
  v13 = [NSNumber numberWithInt:!v5];
  uint64_t v14 = *MEMORY[0x1E4F68A00];
  v181[3] = v13;
  v181[4] = @"plus";
  uint64_t v15 = *MEMORY[0x1E4F68908];
  uint64_t v179 = v14;
  uint64_t v180 = v15;
  id v16 = (void *)MEMORY[0x1E4F1CAD0];
  v17 = [(HFItemManager *)self home];
  objc_super v18 = objc_msgSend(v16, "na_setWithSafeObject:", v17);
  v181[5] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v181 forKeys:v177 count:6];
  v20 = (void *)[v6 initWithResults:v19];
  [(HUEditLocationItemManager *)self setInviteUsersItem:v20];

  v21 = [HURestrictedGuestScheduleItem alloc];
  v22 = [(HFItemManager *)self home];
  v23 = [(HFItemManager *)self home];
  v24 = [v23 currentUser];
  v25 = [(HURestrictedGuestScheduleItem *)v21 initWithHome:v22 user:v24];
  [(HUEditLocationItemManager *)self setHomeScheduleItem:v25];

  BOOL v26 = +[HUWallpaperPickerInlineViewController useWallpaperPickerCell];
  v27 = (void *)MEMORY[0x1E4F1CA60];
  v28 = _HULocalizedStringWithDefaultValue(@"HUEditLocationTakePhotoTitle", @"HUEditLocationTakePhotoTitle", 1);
  v142 = objc_msgSend(v27, "dictionaryWithObjectsAndKeys:", v28, v143, @"Home.HomeSettings.TakePhoto", v8, 0);

  v29 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(MEMORY[0x1E4F42A90], "isSourceTypeAvailable:", 1) ^ 1);
  [v142 setObject:v29 forKeyedSubscript:v145];

  v30 = (void *)[objc_alloc(MEMORY[0x1E4F695C0]) initWithResults:v142];
  [(HUEditLocationItemManager *)self setCameraItem:v30];

  id v31 = objc_alloc(MEMORY[0x1E4F695C0]);
  v175[0] = v143;
  v32 = _HULocalizedStringWithDefaultValue(@"HUEditLocationShowPredictedScenesButtonTitle", @"HUEditLocationShowPredictedScenesButtonTitle", 1);
  uint64_t v33 = *MEMORY[0x1E4F68AC0];
  v176[0] = v32;
  v176[1] = @"HUEditLocationShowPredictedScenesButtonTitle";
  v175[1] = v33;
  v175[2] = v8;
  v176[2] = @"Home.HomeSettings.ShowSuggestedScenes";
  uint64_t v34 = *MEMORY[0x1E4F68BC0];
  v175[3] = *MEMORY[0x1E4F68BC0];
  v35 = NSNumber;
  objc_msgSend(v141, "hf_showPredictedScenesOnDashboard");
  v36 = [v35 numberWithInteger:HFPrimaryStateFromBOOL()];
  v176[3] = v36;
  v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v176 forKeys:v175 count:4];
  v38 = (void *)[v31 initWithResults:v37];
  [(HUEditLocationItemManager *)self setShowPredictedScenes:v38];

  id v39 = objc_alloc(MEMORY[0x1E4F695C0]);
  v173[0] = v143;
  v40 = _HULocalizedStringWithDefaultValue(@"HUEditLocationChooseWallpaperTitle", @"HUEditLocationChooseWallpaperTitle", 1);
  v174[0] = v40;
  v173[1] = v145;
  v41 = [NSNumber numberWithBool:v26];
  v173[2] = v8;
  v174[1] = v41;
  v174[2] = @"Home.HomeSetting.ChooseWallpaper";
  v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v174 forKeys:v173 count:3];
  v43 = (void *)[v39 initWithResults:v42];
  [(HUEditLocationItemManager *)self setChooseWallpaperItem:v43];

  id v44 = objc_alloc(MEMORY[0x1E4F695C0]);
  v171[0] = v145;
  v45 = [NSNumber numberWithBool:v26];
  v171[1] = v8;
  v172[0] = v45;
  v172[1] = @"Home.HomeSettings.WallpaperThumbnail";
  v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v172 forKeys:v171 count:2];
  v47 = (void *)[v44 initWithResults:v46];
  [(HUEditLocationItemManager *)self setWallpaperThumbnailItem:v47];

  id v48 = objc_alloc(MEMORY[0x1E4F695C0]);
  v169[0] = v145;
  v49 = [NSNumber numberWithInt:v26 ^ 1];
  v169[1] = v8;
  v170[0] = v49;
  v170[1] = @"Home.HomeSettings.WallpaperPicker";
  v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v170 forKeys:v169 count:2];
  v51 = (void *)[v48 initWithResults:v50];
  [(HUEditLocationItemManager *)self setWallpaperPickerItem:v51];

  id v52 = objc_alloc(MEMORY[0x1E4F695C0]);
  uint64_t v167 = *MEMORY[0x1E4F68AC8];
  v53 = _HULocalizedStringWithDefaultValue(@"HUEditLocationDetailsNotesPlaceholder", @"HUEditLocationDetailsNotesPlaceholder", 1);
  v168 = v53;
  v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v168 forKeys:&v167 count:1];
  v55 = (void *)[v52 initWithResults:v54];
  [(HUEditLocationItemManager *)self setDetailNotesItem:v55];

  v56 = [HUSoftwareUpdateSettingsItem alloc];
  v57 = [(HFItemManager *)self home];
  v58 = [(HUSoftwareUpdateSettingsItem *)v56 initWithHome:v57];
  [(HUEditLocationItemManager *)self setSoftwareUpdateItem:v58];

  id v59 = objc_alloc(MEMORY[0x1E4F695C0]);
  v154[0] = MEMORY[0x1E4F143A8];
  v154[1] = 3221225472;
  v154[2] = __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke;
  v154[3] = &unk_1E6384FD0;
  objc_copyWeak(&v155, &location);
  v60 = (void *)[v59 initWithResultsBlock:v154];
  [(HUEditLocationItemManager *)self setRemoveItem:v60];

  id v61 = objc_alloc(MEMORY[0x1E4F695C0]);
  v152[0] = MEMORY[0x1E4F143A8];
  v152[1] = 3221225472;
  v152[2] = __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_2;
  v152[3] = &unk_1E6384FD0;
  objc_copyWeak(&v153, &location);
  v62 = (void *)[v61 initWithResultsBlock:v152];
  [(HUEditLocationItemManager *)self setSoundCheckItem:v62];

  v63 = [HUSiriTriggerPhraseSettingItem alloc];
  v64 = [(HFItemManager *)self home];
  v65 = [(HUSiriTriggerPhraseSettingItem *)v63 initWithHome:v64];
  [(HUEditLocationItemManager *)self setSiriTriggerPhraseSettingItem:v65];

  v66 = [(HFItemManager *)self home];
  v67 = [v66 accessories];
  int v68 = objc_msgSend(v67, "na_any:", &__block_literal_global_122_3);

  if (v68)
  {
    v69 = [(HFItemManager *)self home];
    int v70 = objc_msgSend(v69, "hf_currentUserIsAdministrator");

    uint64_t v71 = v70 ^ 1u;
  }
  else
  {
    uint64_t v71 = 1;
  }
  v72 = HFLogForCategory();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    v73 = [(HFItemManager *)self home];
    int v74 = objc_msgSend(v73, "hf_currentUserIsAdministrator");
    *(_DWORD *)buf = 138412802;
    v158 = self;
    __int16 v159 = 1024;
    *(_DWORD *)v160 = v68;
    *(_WORD *)&v160[4] = 1024;
    *(_DWORD *)&v160[6] = v74;
    _os_log_impl(&dword_1BE345000, v72, OS_LOG_TYPE_DEFAULT, "%@:atLeastOneDeviceSupportsHomeLevelLocationServicesSetting = %{BOOL}d currentUserIsAdministrator = %{BOOL}d", buf, 0x18u);
  }
  id v75 = objc_alloc(MEMORY[0x1E4F695C0]);
  v165[0] = v143;
  v76 = _HULocalizedStringWithDefaultValue(@"HULocationServicesSetting_Title", @"HULocationServicesSetting_Title", 1);
  v166[0] = v76;
  v166[1] = @"Home.HomeSettings.LocationServices";
  v165[1] = v8;
  v165[2] = v33;
  v166[2] = @"HULocationServicesSetting_Title";
  v165[3] = v145;
  v77 = [NSNumber numberWithBool:v71];
  v166[3] = v77;
  v165[4] = v34;
  v78 = NSNumber;
  v79 = [(HFItemManager *)self home];
  [v79 isLocationServicesEnabled];
  v80 = [v78 numberWithInteger:HFPrimaryStateFromBOOL()];
  v166[4] = v80;
  v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v166 forKeys:v165 count:5];
  v82 = (void *)[v75 initWithResults:v81];
  [(HUEditLocationItemManager *)self setLocationServicesSettingItem:v82];

  v146 = [(HUEditLocationItemManager *)self nameItem];
  v164[0] = v146;
  v144 = [(HUEditLocationItemManager *)self inviteUsersItem];
  v164[1] = v144;
  v140 = [(HUEditLocationItemManager *)self wallpaperPickerItem];
  v164[2] = v140;
  v139 = [(HUEditLocationItemManager *)self homeScheduleItem];
  v164[3] = v139;
  v138 = [(HUEditLocationItemManager *)self showPredictedScenes];
  v164[4] = v138;
  v83 = [(HUEditLocationItemManager *)self cameraItem];
  v164[5] = v83;
  v84 = [(HUEditLocationItemManager *)self chooseWallpaperItem];
  v164[6] = v84;
  v85 = [(HUEditLocationItemManager *)self wallpaperThumbnailItem];
  v164[7] = v85;
  v86 = [(HUEditLocationItemManager *)self detailNotesItem];
  v164[8] = v86;
  v87 = [(HUEditLocationItemManager *)self softwareUpdateItem];
  v164[9] = v87;
  v88 = [(HUEditLocationItemManager *)self siriTriggerPhraseSettingItem];
  v164[10] = v88;
  v89 = [(HUEditLocationItemManager *)self soundCheckItem];
  v164[11] = v89;
  v90 = [(HUEditLocationItemManager *)self locationServicesSettingItem];
  v164[12] = v90;
  v91 = [(HUEditLocationItemManager *)self removeItem];
  v164[13] = v91;
  v137 = [MEMORY[0x1E4F1C978] arrayWithObjects:v164 count:14];

  v92 = HFLogForCategory();
  if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v158 = (HUEditLocationItemManager *)"-[HUEditLocationItemManager _buildItemProvidersForHome:]";
    _os_log_impl(&dword_1BE345000, v92, OS_LOG_TYPE_DEFAULT, "(%s) Creating 'guests'", buf, 0xCu);
  }

  id v93 = objc_alloc(MEMORY[0x1E4F695C0]);
  v149[0] = MEMORY[0x1E4F143A8];
  v149[1] = 3221225472;
  v149[2] = __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_130;
  v149[3] = &unk_1E63861A0;
  objc_copyWeak(&v151, &location);
  id v94 = v141;
  id v150 = v94;
  v95 = (void *)[v93 initWithResultsBlock:v149];
  [(HUEditLocationItemManager *)self setGuestsItem:v95];

  v96 = [(HFItemManager *)self home];
  v97 = objc_msgSend(v96, "hf_accessoriesSupportingAccessCodes");
  BOOL v98 = [v97 count] == 0;

  if (v98)
  {
    v100 = [(HFItemManager *)self home];
    v101 = [v100 restrictedGuests];
    BOOL v99 = [v101 count] != 0;
  }
  else
  {
    BOOL v99 = 1;
  }
  v102 = HFLogForCategory();
  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    id v103 = (id)objc_claimAutoreleasedReturnValue();
    v104 = [(HFItemManager *)self home];
    v105 = objc_msgSend(v104, "hf_accessoriesSupportingAccessCodes");
    uint64_t v106 = [v105 count];
    v107 = [(HFItemManager *)self home];
    v108 = [v107 restrictedGuests];
    uint64_t v109 = [v108 count];
    *(_DWORD *)buf = 136315906;
    v158 = (HUEditLocationItemManager *)"-[HUEditLocationItemManager _buildItemProvidersForHome:]";
    __int16 v159 = 2112;
    *(void *)v160 = v103;
    *(_WORD *)&v160[8] = 2048;
    uint64_t v161 = v106;
    __int16 v162 = 2048;
    uint64_t v163 = v109;
    _os_log_impl(&dword_1BE345000, v102, OS_LOG_TYPE_DEFAULT, "(%s) shouldIncludeNonBlockingItemProvider is %@ because hf_accessoriesSupportingAccessCodes.count = %ld. self.home.restrictedGuests.count = %ld.", buf, 0x2Au);
  }
  if (v99)
  {
    id v110 = objc_alloc(MEMORY[0x1E4F695D0]);
    v111 = (void *)MEMORY[0x1E4F1CAD0];
    v112 = [(HUEditLocationItemManager *)self guestsItem];
    v113 = [v111 setWithObject:v112];
    v114 = (void *)[v110 initWithItems:v113];
    [(HUEditLocationItemManager *)self setNonBlockingItemProvider:v114];

    v115 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F68700]];
    v116 = [(HUEditLocationItemManager *)self nonBlockingItemProvider];
    [v116 setClientInvalidationReasons:v115];
  }
  id v117 = objc_alloc(MEMORY[0x1E4F695C8]);
  v118 = [MEMORY[0x1E4F1CAD0] setWithArray:v137];
  v119 = (void *)[v117 initWithItems:v118];

  v120 = [(HFItemManager *)self home];
  v121 = [(HFItemManager *)self home];
  v122 = [v121 currentUser];
  v123 = [v120 homeAccessControlForUser:v122];

  v124 = [v123 restrictedGuestAccessSettings];
  v125 = [v124 accessAllowedToAccessories];
  id v126 = objc_alloc(MEMORY[0x1E4F68DC0]);
  v127 = [(HFItemManager *)self home];
  v128 = (void *)[v126 initWithHome:v127];
  [(HUEditLocationItemManager *)self setAllowedAccessoryCategoryItemProvider:v128];

  v147[0] = MEMORY[0x1E4F143A8];
  v147[1] = 3221225472;
  v147[2] = __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_159;
  v147[3] = &unk_1E6386608;
  id v129 = v125;
  id v148 = v129;
  v130 = [(HUEditLocationItemManager *)self allowedAccessoryCategoryItemProvider];
  [v130 setFilter:v147];

  v131 = (void *)[objc_alloc(MEMORY[0x1E4F69718]) initWithHome:v94];
  [v131 setIncludeCurrentUser:1];
  [(HUEditLocationItemManager *)self setUserItemProvider:v131];
  v132 = (void *)[objc_alloc(MEMORY[0x1E4F69388]) initWithHome:v94];
  [v132 setFilter:&__block_literal_global_168];
  [(HUEditLocationItemManager *)self setInviteItemProvider:v132];
  v133 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v119, v131, v132, 0);
  v134 = [(HUEditLocationItemManager *)self nonBlockingItemProvider];
  objc_msgSend(v133, "na_safeAddObject:", v134);

  v135 = [(HUEditLocationItemManager *)self allowedAccessoryCategoryItemProvider];
  objc_msgSend(v133, "na_safeAddObject:", v135);

  objc_destroyWeak(&v151);
  objc_destroyWeak(&v153);
  objc_destroyWeak(&v155);

  objc_destroyWeak(&location);

  return v133;
}

id __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained home];
  int v3 = objc_msgSend(v2, "hf_currentUserIsOwner");
  id v4 = @"HUEditLocationLeaveHomeButtonTitle";
  if (v3) {
    id v4 = @"HUEditLocationRemoveButtonTitle";
  }
  BOOL v5 = v4;

  id v6 = (void *)MEMORY[0x1E4F7A0D8];
  v11[0] = *MEMORY[0x1E4F68AB8];
  id v7 = _HULocalizedStringWithDefaultValue(v5, v5, 1);

  v11[1] = *MEMORY[0x1E4F68928];
  v12[0] = v7;
  v12[1] = @"Home.HomeSettings.RemoveLeaveHome";
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  uint64_t v9 = [v6 futureWithResult:v8];

  return v9;
}

id __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1)
{
  v21[6] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained home];
  [v2 soundCheckEnabled];

  int v3 = [WeakRetained home];
  id v4 = [v3 accessories];
  int v5 = objc_msgSend(v4, "na_any:", &__block_literal_global_297);

  if (v5)
  {
    id v6 = [WeakRetained home];
    uint64_t v7 = objc_msgSend(v6, "hf_currentUserIsAdministrator") ^ 1;
  }
  else
  {
    uint64_t v7 = 1;
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F7A0D8];
  v20[0] = *MEMORY[0x1E4F68AB8];
  uint64_t v9 = _HULocalizedStringWithDefaultValue(@"HUSoundCheckSetting_Title", @"HUSoundCheckSetting_Title", 1);
  uint64_t v10 = *MEMORY[0x1E4F68928];
  v21[0] = v9;
  v21[1] = @"Home.HomeSetting.SoundCheck";
  uint64_t v11 = *MEMORY[0x1E4F68AC0];
  v20[1] = v10;
  v20[2] = v11;
  v21[2] = @"HUSoundCheckSetting_Title";
  v20[3] = *MEMORY[0x1E4F68BC0];
  v12 = [NSNumber numberWithInteger:HFPrimaryStateFromBOOL()];
  v21[3] = v12;
  v20[4] = *MEMORY[0x1E4F68B10];
  v13 = [NSNumber numberWithBool:v7];
  v21[4] = v13;
  v20[5] = *MEMORY[0x1E4F68908];
  uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = [WeakRetained home];
  id v16 = objc_msgSend(v14, "na_setWithSafeObject:", v15);
  v21[5] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:6];
  objc_super v18 = [v8 futureWithResult:v17];

  return v18;
}

uint64_t __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 supportsUserMediaSettings];
}

uint64_t __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 supportsHomeLevelLocationServiceSetting];
}

id __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_130(uint64_t a1)
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v3 = (void *)MEMORY[0x1E4F7A0D8];
  id v4 = [WeakRetained pinCodeManager];
  int v5 = [v4 guestPinCodes];
  v16[0] = v5;
  id v6 = [WeakRetained pinCodeManager];
  uint64_t v7 = [v6 otherEcosystemGuestPinCodes];
  v16[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  uint64_t v9 = [v3 combineAllFutures:v8];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_2_131;
  v13[3] = &unk_1E6388C28;
  id v14 = *(id *)(a1 + 32);
  id v15 = WeakRetained;
  uint64_t v10 = [v9 flatMap:v13];
  uint64_t v11 = [v10 recover:&__block_literal_global_155_0];

  return v11;
}

id __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_2_131(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v40 = "-[HUEditLocationItemManager _buildItemProvidersForHome:]_block_invoke_2";
    __int16 v41 = 2112;
    id v42 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) Completed getting access codes from HK and other ecosystems with results %@", buf, 0x16u);
  }

  int v5 = objc_msgSend(v3, "na_arrayByFlattening");
  uint64_t v6 = [v5 count];
  v35 = v3;
  if (v6)
  {
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "hf_accessoriesSupportingAccessCodes");
    if ([v7 count])
    {
      uint64_t v8 = [*(id *)(a1 + 40) home];
      if (objc_msgSend(v8, "hf_currentUserIsAdministrator"))
      {
        uint64_t v9 = [*(id *)(a1 + 40) home];
        unsigned int v10 = [v9 hasOnboardedForAccessCode] ^ 1;
      }
      else
      {
        unsigned int v10 = 1;
      }
    }
    else
    {
      unsigned int v10 = 1;
    }
  }
  else
  {
    unsigned int v10 = 1;
  }
  uint64_t v11 = [*(id *)(a1 + 40) home];
  v12 = [v11 restrictedGuests];
  uint64_t v13 = [v12 count];

  if (v13) {
    uint64_t v20 = 0;
  }
  else {
    uint64_t v20 = v10;
  }
  v21 = HULocalizedStringWithFormat(@"HUEditLocationGuestsDescriptionFormat", @"%lu", v14, v15, v16, v17, v18, v19, v13 + v6);
  v22 = [MEMORY[0x1E4F42A98] configurationWithPointSize:26.0];
  v23 = (void *)MEMORY[0x1E4F7A0D8];
  v37[0] = *MEMORY[0x1E4F68AB8];
  v24 = _HULocalizedStringWithDefaultValue(@"HUEditLocationGuestsTitle", @"HUEditLocationGuestsTitle", 1);
  uint64_t v25 = *MEMORY[0x1E4F68928];
  v38[0] = v24;
  v38[1] = @"Home.HomeSettings.Guests";
  uint64_t v26 = *MEMORY[0x1E4F68980];
  v37[1] = v25;
  v37[2] = v26;
  v38[2] = v21;
  v37[3] = *MEMORY[0x1E4F689F8];
  v27 = [MEMORY[0x1E4F42A80] systemImageNamed:@"person.2.circle.fill" withConfiguration:v22];
  v38[3] = v27;
  v37[4] = *MEMORY[0x1E4F68B10];
  v28 = [NSNumber numberWithBool:v20];
  v38[4] = v28;
  v37[5] = *MEMORY[0x1E4F68900];
  v29 = (void *)MEMORY[0x1E4F1CAD0];
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  id v31 = [v29 setWithArray:v30];
  v38[5] = v31;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:6];
  uint64_t v33 = [v23 futureWithResult:v32];

  return v33;
}

id __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_152(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "-[HUEditLocationItemManager _buildItemProvidersForHome:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v2;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "(%s) Failed to get access codes from HK and other ecosystems. Error = %@. Hiding 'guests' item.", buf, 0x16u);
  }

  id v4 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v8 = *MEMORY[0x1E4F68B10];
  uint64_t v9 = MEMORY[0x1E4F1CC38];
  int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  uint64_t v6 = [v4 futureWithResult:v5];

  return v6;
}

uint64_t __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_159(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_2_160;
  v8[3] = &unk_1E63869C8;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_2_160(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F2E520];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = objc_msgSend(v2, "hf_compatibleServiceTypesForCategoryType:", v3);
  uint64_t v6 = objc_msgSend(v4, "hf_primaryService");

  uint64_t v7 = [v6 serviceType];
  uint64_t v8 = objc_msgSend(v5, "na_safeContainsObject:", v7);

  return v8;
}

BOOL __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_3_165(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  BOOL v6 = [v5 invitationState] != 5;
  return v6;
}

- (BOOL)_inviteUsersItemAllowed
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v4 = [v3 homeManager];
  int v5 = [v4 hasOptedToHH2];

  if (v5)
  {
    BOOL v6 = [(HFItemManager *)self home];
    uint64_t v7 = [v6 residentDevices];
    BOOL v8 = [v7 count] != 0;
  }
  else
  {
    BOOL v8 = 1;
  }
  id v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = [(HFItemManager *)self home];
    uint64_t v11 = [v10 residentDevices];
    int v13 = 136315906;
    uint64_t v14 = "-[HUEditLocationItemManager _inviteUsersItemAllowed]";
    __int16 v15 = 1024;
    int v16 = v5;
    __int16 v17 = 1024;
    BOOL v18 = v8;
    __int16 v19 = 2048;
    uint64_t v20 = [v11 count];
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%s hasOptedToHH2 = %{BOOL}d, shouldShowInviteUsersItem = %{BOOL}d, residentDevices.count = %ld", (uint8_t *)&v13, 0x22u);
  }
  return v8;
}

- (id)_homeFuture
{
  id v2 = (void *)MEMORY[0x1E4F7A0D8];
  id v3 = [(HUEditLocationItemManager *)self homeBuilder];
  id v4 = [v3 home];
  int v5 = [v2 futureWithResult:v4];

  return v5;
}

- (id)_itemsToHideInSet:(id)a3
{
  v28.receiver = self;
  v28.super_class = (Class)HUEditLocationItemManager;
  id v4 = [(HFItemManager *)&v28 _itemsToHideInSet:a3];
  int v5 = (void *)[v4 mutableCopy];

  BOOL v6 = [(HFItemManager *)self home];
  char v7 = objc_msgSend(v6, "hf_currentUserIsAdministrator");

  if ((v7 & 1) == 0)
  {
    BOOL v8 = [(HUEditLocationItemManager *)self inviteUsersItem];
    [v5 addObject:v8];

    id v9 = [(HUEditLocationItemManager *)self homeBuilder];
    unsigned int v10 = [v9 userNotes];
    uint64_t v11 = [v10 length];

    if (!v11)
    {
      __int16 v12 = [(HUEditLocationItemManager *)self detailNotesItem];
      [v5 addObject:v12];
    }
  }
  int v13 = [MEMORY[0x1E4F692A0] sharedDispatcher];
  int v14 = [v13 isUsingiCloud];

  if (!v14 || [(HUEditLocationItemManager *)self _isCurrentUserRestrictedGuest])
  {
    __int16 v15 = [(HUEditLocationItemManager *)self userItemProvider];
    int v16 = [v15 items];
    [v5 unionSet:v16];

    __int16 v17 = [(HUEditLocationItemManager *)self guestsItem];
    [v5 addObject:v17];

    BOOL v18 = [(HUEditLocationItemManager *)self inviteItemProvider];
    __int16 v19 = [v18 items];
    [v5 unionSet:v19];
  }
  if ([(HUEditLocationItemManager *)self _isCurrentUserRestrictedGuest])
  {
    uint64_t v20 = [(HUEditLocationItemManager *)self showPredictedScenes];
    [v5 addObject:v20];
  }
  if ([(HUEditLocationItemManager *)self context] == 1)
  {
    uint64_t v21 = [(HUEditLocationItemManager *)self wallpaperPickerItem];
    [v5 addObject:v21];

    v22 = [(HUEditLocationItemManager *)self showPredictedScenes];
    objc_msgSend(v5, "na_safeAddObject:", v22);

    v23 = [(HUEditLocationItemManager *)self cameraItem];
    [v5 addObject:v23];

    v24 = [(HUEditLocationItemManager *)self chooseWallpaperItem];
    [v5 addObject:v24];

    uint64_t v25 = [(HUEditLocationItemManager *)self wallpaperThumbnailItem];
    [v5 addObject:v25];
  }
  if ([MEMORY[0x1E4F69758] isRunningInStoreDemoMode])
  {
    uint64_t v26 = [(HUEditLocationItemManager *)self removeItem];
    [v5 addObject:v26];
  }

  return v5;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v112[1] = *MEMORY[0x1E4F143B8];
  id v98 = a3;
  id v4 = objc_opt_new();
  int v5 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUEditLocationNameSectionIdentifier"];
  BOOL v6 = _HULocalizedStringWithDefaultValue(@"HUEditLocationNameSectionTitle", @"HUEditLocationNameSectionTitle", 1);
  [v5 setHeaderTitle:v6];

  char v7 = [(HUEditLocationItemManager *)self nameItem];
  v112[0] = v7;
  BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:1];
  [v5 setItems:v8];

  v97 = v5;
  [v4 addObject:v5];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUScheduleSectionIdentifier"];
  unsigned int v10 = [(HUEditLocationItemManager *)self homeScheduleItem];
  v111 = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v111 count:1];
  [v9 setItems:v11];

  __int16 v12 = HFLocalizedString();
  [v9 setHeaderTitle:v12];

  int v13 = _HULocalizedStringWithDefaultValue(@"HURestrictedGuestScheduleItem_HomeSettings_FooterTitle", @"HURestrictedGuestScheduleItem_HomeSettings_FooterTitle", 1);
  [v9 setFooterTitle:v13];

  v96 = v9;
  [v4 addObject:v9];
  int v14 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUAllowedAccessoriesSectionIdentifier"];
  __int16 v15 = [(HUEditLocationItemManager *)self allowedAccessoryCategoryItemProvider];
  int v16 = [v15 items];
  __int16 v17 = [v16 allObjects];
  BOOL v18 = [MEMORY[0x1E4F69220] defaultItemComparator];
  __int16 v19 = [v17 sortedArrayUsingComparator:v18];
  [v14 setItems:v19];

  uint64_t v20 = _HULocalizedStringWithDefaultValue(@"HURestrictedGuest_AllowedAccessoriesSection_Header", @"HURestrictedGuest_AllowedAccessoriesSection_Header", 1);
  [v14 setHeaderTitle:v20];

  v95 = v14;
  [v4 addObject:v14];
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUEditLocationPeopleSectionIdentifier"];
  v22 = _HULocalizedStringWithDefaultValue(@"HUEditLocationPeopleSectionTitle", @"HUEditLocationPeopleSectionTitle", 1);
  [v21 setHeaderTitle:v22];

  v99[0] = MEMORY[0x1E4F143A8];
  v99[1] = 3221225472;
  v99[2] = __62__HUEditLocationItemManager__buildSectionsWithDisplayedItems___block_invoke;
  v99[3] = &unk_1E6387F48;
  v99[4] = self;
  v23 = __62__HUEditLocationItemManager__buildSectionsWithDisplayedItems___block_invoke((uint64_t)v99);
  [v21 setFooterTitle:v23];

  v24 = [(HUEditLocationItemManager *)self userItemProvider];
  uint64_t v25 = [v24 items];
  uint64_t v26 = [(HUEditLocationItemManager *)self inviteItemProvider];
  v27 = [v26 items];
  objc_super v28 = [v25 setByAddingObjectsFromSet:v27];
  v29 = [v28 allObjects];

  v30 = [MEMORY[0x1E4F69220] defaultItemComparator];
  id v93 = v29;
  id v31 = [v29 sortedArrayUsingComparator:v30];
  v110[0] = v31;
  v32 = [(HUEditLocationItemManager *)self guestsItem];
  v110[1] = v32;
  uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v110 count:2];
  uint64_t v34 = objc_msgSend(v33, "na_arrayByFlattening");
  [v21 setItems:v34];

  if ([(HUEditLocationItemManager *)self _inviteUsersItemAllowed])
  {
    v35 = [v21 items];
    v109[0] = v35;
    v36 = [(HUEditLocationItemManager *)self inviteUsersItem];
    v109[1] = v36;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v109 count:2];
    v38 = objc_msgSend(v37, "na_arrayByFlattening");
    [v21 setItems:v38];
  }
  id v94 = v21;
  [v4 addObject:v21];
  id v39 = [(HUEditLocationItemManager *)self notificationSettingsModule];
  v40 = [v39 buildSectionsWithDisplayedItems:v98];
  [v4 addObjectsFromArray:v40];

  __int16 v41 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUEditLocationSiriTriggerPhraseSectionIdentifier"];
  id v42 = [(HUEditLocationItemManager *)self siriTriggerPhraseSettingItem];
  v108 = v42;
  uint64_t v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v108 count:1];
  [v41 setItems:v43];

  v92 = v41;
  [v4 addObject:v41];
  id v44 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUEditLocationSoftwareUpdateSectionIdentifier"];
  v45 = [(HFItemManager *)self home];
  v46 = +[HUSoftwareUpdateSettingsItem footerTitleForHome:v45];
  [v44 setFooterTitle:v46];

  v47 = [(HUEditLocationItemManager *)self softwareUpdateItem];
  v107 = v47;
  id v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:1];
  [v44 setItems:v48];

  v91 = v44;
  [v4 addObject:v44];
  v49 = [(HUEditLocationItemManager *)self connectedServicesItemModule];
  v50 = [v49 buildSectionsWithDisplayedItems:v98];
  [v4 addObjectsFromArray:v50];

  v51 = [(HUEditLocationItemManager *)self soundCheckItem];
  LODWORD(v50) = [v98 containsObject:v51];

  if (v50)
  {
    id v52 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUEditLocationSoundCheckSectionIdentifier"];
    v53 = _HULocalizedStringWithDefaultValue(@"HUHomeMediaSettingSection_Title", @"HUHomeMediaSettingSection_Title", 1);
    [v52 setHeaderTitle:v53];

    v54 = [(HUEditLocationItemManager *)self soundCheckItem];
    uint64_t v106 = v54;
    v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v106 count:1];
    [v52 setItems:v55];

    [v4 addObject:v52];
  }
  v56 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUEditLocationScenesSectionIdentifier"];
  v57 = (void *)MEMORY[0x1E4F1C978];
  v58 = [(HUEditLocationItemManager *)self showPredictedScenes];
  id v59 = objc_msgSend(v57, "na_arrayWithSafeObject:", v58);
  [v56 setItems:v59];

  v60 = _HULocalizedStringWithDefaultValue(@"HUEditLocationScenesSectionTitle", @"HUEditLocationScenesSectionTitle", 1);
  v90 = v56;
  [v56 setHeaderTitle:v60];

  [v4 addObject:v56];
  id v61 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUEditLocationWallpaperSectionIdentifier"];
  v62 = _HULocalizedStringWithDefaultValue(@"HUEditLocationWallpaperSectionTitle", @"HUEditLocationWallpaperSectionTitle", 1);
  [v61 setHeaderTitle:v62];

  v63 = [(HUEditLocationItemManager *)self cameraItem];
  v105[0] = v63;
  v64 = [(HUEditLocationItemManager *)self chooseWallpaperItem];
  v105[1] = v64;
  v65 = [(HUEditLocationItemManager *)self wallpaperThumbnailItem];
  v105[2] = v65;
  v66 = [(HUEditLocationItemManager *)self wallpaperPickerItem];
  v105[3] = v66;
  v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:4];
  [v61 setItems:v67];

  [v4 addObject:v61];
  int v68 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUEditLocationDetailsSectionIdentifier"];
  v69 = _HULocalizedStringWithDefaultValue(@"HUEditLocationDetailsSectionTitle", @"HUEditLocationDetailsSectionTitle", 1);
  [v68 setHeaderTitle:v69];

  int v70 = _HULocalizedStringWithDefaultValue(@"HUEditLocationDetailsFooterTitle", @"HUEditLocationDetailsFooterTitle", 1);
  [v68 setFooterTitle:v70];

  uint64_t v71 = [(HUEditLocationItemManager *)self detailNotesItem];
  v104 = v71;
  v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v104 count:1];
  [v68 setItems:v72];

  [v4 addObject:v68];
  v89 = HFLocalizedWiFiString();
  v73 = HFLocalizedString();
  id v74 = objc_alloc(MEMORY[0x1E4F28E48]);
  id v75 = [v89 stringByAppendingString:@" "];
  v76 = (void *)[v74 initWithString:v75];

  id v77 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v102 = *MEMORY[0x1E4F42530];
  v78 = [MEMORY[0x1E4F696F8] locationPrivacyURL];
  id v103 = v78;
  v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v103 forKeys:&v102 count:1];
  v80 = (void *)[v77 initWithString:v73 attributes:v79];
  [v76 appendAttributedString:v80];

  v81 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HULocationServicesSectionIdentifier"];
  [v81 setAttributedFooterTitle:v76];
  v82 = [(HUEditLocationItemManager *)self locationServicesSettingItem];
  v101 = v82;
  v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];
  [v81 setItems:v83];

  [v4 addObject:v81];
  v84 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUEditLocationRemoveSectionIdentifier"];
  v85 = [(HUEditLocationItemManager *)self removeItem];
  v100 = v85;
  v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v100 count:1];
  [v84 setItems:v86];

  [v4 addObject:v84];
  v87 = [MEMORY[0x1E4F69220] filterSections:v4 toDisplayedItems:v98];

  return v87;
}

id __62__HUEditLocationItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F692A0] sharedDispatcher];
  int v3 = [v2 isUsingiCloud];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) home];
    if (objc_msgSend(v4, "hf_currentUserIsAdministrator")) {
      int v5 = @"HUEditLocationPeopleFooterTitle_AdminOrOwner";
    }
    else {
      int v5 = @"HUEditLocationPeopleFooterTitle_NonAdmin";
    }
    BOOL v6 = _HULocalizedStringWithDefaultValue(v5, v5, 1);
  }
  else
  {
    BOOL v6 = _HULocalizedStringWithDefaultValue(@"HUEditLocationPeopleICloudNotEnabledFooterTitle", @"HUEditLocationPeopleICloudNotEnabledFooterTitle", 1);
  }

  return v6;
}

- (BOOL)_isCurrentUserRestrictedGuest
{
  int v3 = [(HFItemManager *)self home];
  id v4 = [(HFItemManager *)self home];
  int v5 = [v4 currentUser];
  char v6 = objc_msgSend(v3, "hf_userIsRestrictedGuest:", v5);

  return v6;
}

- (void)_registerForExternalUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)HUEditLocationItemManager;
  [(HFItemManager *)&v4 _registerForExternalUpdates];
  int v3 = [(HUEditLocationItemManager *)self pinCodeManager];
  [v3 addObserver:self];
}

- (void)_unregisterForExternalUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)HUEditLocationItemManager;
  [(HFItemManager *)&v4 _unregisterForExternalUpdates];
  int v3 = [(HUEditLocationItemManager *)self pinCodeManager];
  [v3 removeObserver:self];
}

- (void)pinCodeManagerDidUpdate:(id)a3 pinCodes:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    char v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    int v14 = self;
    __int16 v15 = 2112;
    int v16 = v7;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Reloading PIN Code related items...", buf, 0x16u);
  }
  BOOL v8 = [(HUEditLocationItemManager *)self nonBlockingItemProvider];

  if (v8)
  {
    id v9 = [(HUEditLocationItemManager *)self nonBlockingItemProvider];
    __int16 v12 = v9;
    unsigned int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    id v11 = [(HFItemManager *)self reloadAndUpdateItemsForProviders:v10 senderSelector:a2];
  }
}

- (HUUserNotificationTopicListModule)notificationSettingsModule
{
  return self->_notificationSettingsModule;
}

- (void)setNotificationSettingsModule:(id)a3
{
}

- (HUMatterConnectedServicesItemModule)connectedServicesItemModule
{
  return self->_connectedServicesItemModule;
}

- (void)setConnectedServicesItemModule:(id)a3
{
}

- (HFItem)nameItem
{
  return self->_nameItem;
}

- (void)setNameItem:(id)a3
{
}

- (HFItem)homeScheduleItem
{
  return self->_homeScheduleItem;
}

- (void)setHomeScheduleItem:(id)a3
{
}

- (HFAccessoryCategoryItemProvider)allowedAccessoryCategoryItemProvider
{
  return self->_allowedAccessoryCategoryItemProvider;
}

- (void)setAllowedAccessoryCategoryItemProvider:(id)a3
{
}

- (HFItem)inviteUsersItem
{
  return self->_inviteUsersItem;
}

- (void)setInviteUsersItem:(id)a3
{
}

- (HFItem)wallpaperPickerItem
{
  return self->_wallpaperPickerItem;
}

- (void)setWallpaperPickerItem:(id)a3
{
}

- (HFItem)showPredictedScenes
{
  return self->_showPredictedScenes;
}

- (void)setShowPredictedScenes:(id)a3
{
}

- (HFItem)cameraItem
{
  return self->_cameraItem;
}

- (void)setCameraItem:(id)a3
{
}

- (HFItem)chooseWallpaperItem
{
  return self->_chooseWallpaperItem;
}

- (void)setChooseWallpaperItem:(id)a3
{
}

- (HFItem)wallpaperThumbnailItem
{
  return self->_wallpaperThumbnailItem;
}

- (void)setWallpaperThumbnailItem:(id)a3
{
}

- (HFItem)detailNotesItem
{
  return self->_detailNotesItem;
}

- (void)setDetailNotesItem:(id)a3
{
}

- (HFItem)softwareUpdateItem
{
  return self->_softwareUpdateItem;
}

- (void)setSoftwareUpdateItem:(id)a3
{
}

- (HFItem)guestsItem
{
  return self->_guestsItem;
}

- (void)setGuestsItem:(id)a3
{
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (void)setPinCodeManager:(id)a3
{
}

- (HFItem)removeItem
{
  return self->_removeItem;
}

- (void)setRemoveItem:(id)a3
{
}

- (HFItem)soundCheckItem
{
  return self->_soundCheckItem;
}

- (void)setSoundCheckItem:(id)a3
{
}

- (HFItemProvider)userItemProvider
{
  return self->_userItemProvider;
}

- (void)setUserItemProvider:(id)a3
{
}

- (HFItemProvider)inviteItemProvider
{
  return self->_inviteItemProvider;
}

- (void)setInviteItemProvider:(id)a3
{
}

- (unint64_t)context
{
  return self->_context;
}

- (HFItem)locationServicesSettingItem
{
  return self->_locationServicesSettingItem;
}

- (void)setLocationServicesSettingItem:(id)a3
{
}

- (HUSiriTriggerPhraseSettingItem)siriTriggerPhraseSettingItem
{
  return self->_siriTriggerPhraseSettingItem;
}

- (void)setSiriTriggerPhraseSettingItem:(id)a3
{
}

- (HFHomeBuilder)homeBuilder
{
  return self->_homeBuilder;
}

- (void)setHomeBuilder:(id)a3
{
}

- (HFStaticNonBlockingItemProvider)nonBlockingItemProvider
{
  return self->_nonBlockingItemProvider;
}

- (void)setNonBlockingItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonBlockingItemProvider, 0);
  objc_storeStrong((id *)&self->_homeBuilder, 0);
  objc_storeStrong((id *)&self->_siriTriggerPhraseSettingItem, 0);
  objc_storeStrong((id *)&self->_locationServicesSettingItem, 0);
  objc_storeStrong((id *)&self->_inviteItemProvider, 0);
  objc_storeStrong((id *)&self->_userItemProvider, 0);
  objc_storeStrong((id *)&self->_soundCheckItem, 0);
  objc_storeStrong((id *)&self->_removeItem, 0);
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
  objc_storeStrong((id *)&self->_guestsItem, 0);
  objc_storeStrong((id *)&self->_softwareUpdateItem, 0);
  objc_storeStrong((id *)&self->_detailNotesItem, 0);
  objc_storeStrong((id *)&self->_wallpaperThumbnailItem, 0);
  objc_storeStrong((id *)&self->_chooseWallpaperItem, 0);
  objc_storeStrong((id *)&self->_cameraItem, 0);
  objc_storeStrong((id *)&self->_showPredictedScenes, 0);
  objc_storeStrong((id *)&self->_wallpaperPickerItem, 0);
  objc_storeStrong((id *)&self->_inviteUsersItem, 0);
  objc_storeStrong((id *)&self->_allowedAccessoryCategoryItemProvider, 0);
  objc_storeStrong((id *)&self->_homeScheduleItem, 0);
  objc_storeStrong((id *)&self->_nameItem, 0);
  objc_storeStrong((id *)&self->_connectedServicesItemModule, 0);

  objc_storeStrong((id *)&self->_notificationSettingsModule, 0);
}

@end