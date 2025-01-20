@interface HUEditUserItemManager
- (BOOL)_canModifyUserBeingEditedPermissions;
- (BOOL)_hasPendingAccessories;
- (BOOL)_hasPersonalRequestsDevice;
- (BOOL)_hasResidentDevice;
- (BOOL)_hasTVViewingProfilesDevice;
- (BOOL)_isEditingAllowedForUser:(id)a3;
- (BOOL)_isPersonalRequestsEnabledForUser;
- (BOOL)_isRemoteAccessAllowedForUser:(id)a3;
- (BOOL)_isTVViewingProfilesEnabledForUser;
- (BOOL)_isUserOwner:(id)a3;
- (BOOL)_isVoiceIDEnabled:(id)a3;
- (BOOL)_shouldShowBoltUI;
- (BOOL)isUserBeingEditedTheDeviceUser;
- (HFItem)allowEditingItem;
- (HFItem)camerasItem;
- (HFItem)homeScheduleItem;
- (HFItem)localAccessItem;
- (HFItem)locksItem;
- (HFItem)pendingAccessoriesItem;
- (HFItem)personalRequestsFooterItem;
- (HFItem)personalRequestsItem;
- (HFItem)remoteAccessItem;
- (HFItem)removeItem;
- (HFItem)tvViewingProfilesItem;
- (HFItem)updateListeningHistoryItem;
- (HFTransformItemProvider)allowedAccessoryCategoryItemProvider;
- (HMHome)homeForUser;
- (HMUser)userBeingEdited;
- (HUAccessorySettingsItemModule)userSettingsItemModule;
- (HUEditUserItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HUEditUserItemManager)initWithHome:(id)a3 userItem:(id)a4 delegate:(id)a5;
- (HULocationDeviceManager)locationDeviceManager;
- (HUMediaServiceSettingsItemModule)mediaServiceItemModule;
- (NSArray)sectionOrderArrayWhenViewingOther;
- (NSArray)sectionOrderArrayWhenViewingSelf;
- (NSArray)supportedMULanguageCodes;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_homeFuture;
- (id)_itemsToHideInSet:(id)a3;
- (id)reuseIdentifierForFooterViewInSection:(unint64_t)a3;
- (void)_registerForExternalUpdates;
- (void)_unregisterForExternalUpdates;
- (void)_updateSiriSectionFooterForSection:(id)a3;
- (void)setAllowEditingItem:(id)a3;
- (void)setAllowedAccessoryCategoryItemProvider:(id)a3;
- (void)setCamerasItem:(id)a3;
- (void)setHomeForUser:(id)a3;
- (void)setHomeScheduleItem:(id)a3;
- (void)setLocalAccessItem:(id)a3;
- (void)setLocationDeviceManager:(id)a3;
- (void)setLocksItem:(id)a3;
- (void)setMediaServiceItemModule:(id)a3;
- (void)setPendingAccessoriesItem:(id)a3;
- (void)setPersonalRequestsItem:(id)a3;
- (void)setRemoteAccessItem:(id)a3;
- (void)setRemoveItem:(id)a3;
- (void)setSectionOrderArrayWhenViewingOther:(id)a3;
- (void)setSectionOrderArrayWhenViewingSelf:(id)a3;
- (void)setSupportedMULanguageCodes:(id)a3;
- (void)setTvViewingProfilesItem:(id)a3;
- (void)setUpdateListeningHistoryItem:(id)a3;
- (void)setUserSettingsItemModule:(id)a3;
@end

@implementation HUEditUserItemManager

- (HUEditUserItemManager)initWithHome:(id)a3 userItem:(id)a4 delegate:(id)a5
{
  v21[12] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HUEditUserItemManager;
  v9 = [(HFItemManager *)&v19 initWithDelegate:a5 sourceItem:a4];
  if (v9)
  {
    uint64_t v10 = +[HULocationDeviceManager sharedInstance];
    locationDeviceManager = v9->_locationDeviceManager;
    v9->_locationDeviceManager = (HULocationDeviceManager *)v10;

    [(HUEditUserItemManager *)v9 setHomeForUser:v8];
    v21[0] = *MEMORY[0x1E4F685A0];
    uint64_t v12 = v21[0];
    v21[1] = @"HUEditUserItemManager_PersonalRequestsSectionIdentifier";
    v21[2] = @"HUEditUserItemManager_TVViewingProfilesSectionIdentifier";
    v21[3] = @"HUMediaServiceSettingsItemModule_MediaServicesSectionIdentifier";
    uint64_t v13 = *MEMORY[0x1E4F68548];
    v21[4] = @"HUMediaServiceSettingsItemModule_PrimaryServiceSectionIdentifier";
    v21[5] = v13;
    v21[6] = @"HUEditUserItemManager_UpdateListeningHistorySectionIdentifier";
    v21[7] = @"HUEditUserItemManager_EditingSectionIdentifier";
    v21[8] = @"HUEditUserItemManager_AccessSectionIdentifier";
    v21[9] = @"HUEditUserItemManager_AccessLevelSectionIdentifier";
    v21[10] = @"HUEditUserItemManager_AccessoriesSectionIdentifier";
    v21[11] = @"HUEditUserItemManager_ButtonSectionIdentifier";
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:12];
    sectionOrderArrayWhenViewingSelf = v9->_sectionOrderArrayWhenViewingSelf;
    v9->_sectionOrderArrayWhenViewingSelf = (NSArray *)v14;

    v20[0] = @"HUEditUserItemManager_EditingSectionIdentifier";
    v20[1] = @"HUEditUserItemManager_AccessSectionIdentifier";
    v20[2] = @"HUEditUserItemManager_AccessLevelSectionIdentifier";
    v20[3] = @"HUEditUserItemManager_AccessoriesSectionIdentifier";
    v20[4] = v12;
    v20[5] = @"HUEditUserItemManager_PersonalRequestsSectionIdentifier";
    v20[6] = @"HUEditUserItemManager_TVViewingProfilesSectionIdentifier";
    v20[7] = @"HUMediaServiceSettingsItemModule_MediaServicesSectionIdentifier";
    v20[8] = @"HUMediaServiceSettingsItemModule_PrimaryServiceSectionIdentifier";
    v20[9] = v13;
    v20[10] = @"HUEditUserItemManager_UpdateListeningHistorySectionIdentifier";
    v20[11] = @"HUEditUserItemManager_ButtonSectionIdentifier";
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:12];
    sectionOrderArrayWhenViewingOther = v9->_sectionOrderArrayWhenViewingOther;
    v9->_sectionOrderArrayWhenViewingOther = (NSArray *)v16;
  }
  return v9;
}

- (HUEditUserItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithHome_userItem_delegate_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUEditUserItemManager.m", 126, @"%s is unavailable; use %@ instead",
    "-[HUEditUserItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HMUser)userBeingEdited
{
  v2 = [(HFItemManager *)self sourceItem];
  v3 = [v2 user];

  return (HMUser *)v3;
}

- (id)reuseIdentifierForFooterViewInSection:(unint64_t)a3
{
  v4 = [(HFItemManager *)self displayedSectionIdentifierForSectionIndex:a3];
  if ([v4 isEqualToString:@"HUEditUserItemManager_AccessSectionIdentifier"]
    && ![(HUEditUserItemManager *)self _hasResidentDevice])
  {
    v5 = @"HUAboutResidentDeviceFooterViewReuseIdentifier";
  }
  else
  {
    v5 = (__CFString *)*MEMORY[0x1E4F68548];
    if (![v4 isEqualToString:*MEMORY[0x1E4F68548]])
    {
      v6 = 0;
      goto LABEL_7;
    }
  }
  v6 = v5;
LABEL_7:

  return v6;
}

- (BOOL)isUserBeingEditedTheDeviceUser
{
  v3 = [(HUEditUserItemManager *)self userBeingEdited];
  v4 = [(HFItemManager *)self home];
  v5 = [v4 currentUser];
  char v6 = [v3 isEqual:v5];

  return v6;
}

- (id)_homeFuture
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v3 = [(HUEditUserItemManager *)self homeForUser];
  v4 = [v2 futureWithResult:v3];

  return v4;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  uint64_t v168 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v94 = (objc_class *)objc_opt_class();
    NSStringFromClass(v94);
    v122 = (HUEditUserItemManager *)(id)objc_claimAutoreleasedReturnValue();
    v118 = [(HFItemManager *)self home];
    v116 = [v118 currentUser];
    objc_msgSend(v116, "hf_prettyDescription");
    v110 = (id *)objc_claimAutoreleasedReturnValue();
    v114 = [(HFItemManager *)self home];
    v111 = [v114 currentUser];
    v109 = [v111 name];
    v95 = [(HUEditUserItemManager *)self userBeingEdited];
    v96 = [(HUEditUserItemManager *)self userBeingEdited];
    v97 = [v96 name];
    v98 = [(HUEditUserItemManager *)self userBeingEdited];
    BOOL v99 = [(HUEditUserItemManager *)self _isUserOwner:v98];
    v100 = [(HUEditUserItemManager *)self userBeingEdited];
    BOOL v101 = [(HUEditUserItemManager *)self _isEditingAllowedForUser:v100];
    BOOL v102 = [(HUEditUserItemManager *)self _canModifyUserBeingEditedPermissions];
    *(_DWORD *)buf = 138414082;
    v153 = v122;
    __int16 v154 = 2112;
    uint64_t v155 = (uint64_t)v110;
    __int16 v156 = 2112;
    v157 = (__CFString *)v109;
    __int16 v158 = 2112;
    v159 = v95;
    __int16 v160 = 2112;
    v161 = v97;
    __int16 v162 = 1024;
    BOOL v163 = v99;
    __int16 v164 = 1024;
    BOOL v165 = v101;
    __int16 v166 = 1024;
    BOOL v167 = v102;
    _os_log_debug_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEBUG, "%@ Info:\n\tCurrent User: %@/%@\n\tUser Being Edited: %@/%@\n\tUBE is Owner: %{BOOL}d\n\tUBE is Admin: %{BOOL}d\n\tCU Can Modify User Permissions for UBE: %{BOOL}d", buf, 0x46u);
  }
  char v6 = [(HFItemManager *)self home];
  v7 = [(HUEditUserItemManager *)self userBeingEdited];
  unsigned int v8 = objc_msgSend(v6, "hf_userIsRestrictedGuest:", v7);

  v9 = [HURestrictedGuestScheduleItem alloc];
  uint64_t v10 = [(HUEditUserItemManager *)self homeForUser];
  v11 = [(HUEditUserItemManager *)self userBeingEdited];
  uint64_t v12 = [(HURestrictedGuestScheduleItem *)v9 initWithHome:v10 user:v11];
  [(HUEditUserItemManager *)self setHomeScheduleItem:v12];

  uint64_t v13 = [HUInstructionsItem alloc];
  uint64_t v14 = _HULocalizedStringWithDefaultValue(@"HUUsersAccessWithoutRemoteCapability", @"HUUsersAccessWithoutRemoteCapability", 1);
  v15 = [(HUInstructionsItem *)v13 initWithStyle:5 title:0 description:v14];
  [(HUEditUserItemManager *)self setLocalAccessItem:v15];

  id v16 = objc_alloc(MEMORY[0x1E4F695C0]);
  v144[0] = MEMORY[0x1E4F143A8];
  v144[1] = 3221225472;
  v144[2] = __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke;
  v144[3] = &unk_1E6386518;
  v144[4] = self;
  char v145 = v8;
  v17 = (void *)[v16 initWithResultsBlock:v144];
  [(HUEditUserItemManager *)self setRemoteAccessItem:v17];

  LOBYTE(v12) = [(HUEditUserItemManager *)self _hasResidentDevice];
  v18 = [_HUUserAccessItem alloc];
  objc_super v19 = [(HUEditUserItemManager *)self userBeingEdited];
  v141[0] = MEMORY[0x1E4F143A8];
  v141[1] = 3221225472;
  v141[2] = __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_2;
  v141[3] = &unk_1E63869A0;
  objc_copyWeak(&v142, &location);
  char v143 = v12 ^ 1 | v8;
  v20 = [(_HUUserAccessItem *)v18 initWithUser:v19 resultsBlock:v141];
  [(HUEditUserItemManager *)self setAllowEditingItem:v20];

  v21 = [_HUUserAccessItem alloc];
  v22 = [(HUEditUserItemManager *)self userBeingEdited];
  v139[0] = MEMORY[0x1E4F143A8];
  v139[1] = 3221225472;
  v139[2] = __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_3;
  v139[3] = &unk_1E6384FD0;
  objc_copyWeak(&v140, &location);
  v23 = [(_HUUserAccessItem *)v21 initWithUser:v22 resultsBlock:v139];
  [(HUEditUserItemManager *)self setCamerasItem:v23];

  v24 = [(HUEditUserItemManager *)self homeForUser];
  v25 = [v24 accessories];
  int v26 = objc_msgSend(v25, "na_any:", &__block_literal_global_28);

  if (v26)
  {
    v27 = [(HFItemManager *)self home];
    char v28 = [v27 hasOnboardedForAccessCode];
    if ((v28 & 1) != 0
      || ([(HFItemManager *)self home],
          v25 = objc_claimAutoreleasedReturnValue(),
          [v25 hasOnboardedForWalletKey]))
    {
      if ([(HUEditUserItemManager *)self isUserBeingEditedTheDeviceUser])
      {
        int v26 = 1;
      }
      else
      {
        v29 = [(HFItemManager *)self home];
        int v26 = objc_msgSend(v29, "hf_currentUserIsAdministrator");
      }
      if (v28) {
        goto LABEL_13;
      }
    }
    else
    {
      int v26 = 0;
    }

LABEL_13:
  }
  id v30 = objc_alloc(MEMORY[0x1E4F695C0]);
  v150[0] = *MEMORY[0x1E4F68AB8];
  v31 = _HULocalizedStringWithDefaultValue(@"HUUsersLocksTitle", @"HUUsersLocksTitle", 1);
  uint64_t v32 = *MEMORY[0x1E4F68928];
  v151[0] = v31;
  v151[1] = @"Home.Users.Locks.Title";
  uint64_t v33 = *MEMORY[0x1E4F689E8];
  v150[1] = v32;
  v150[2] = v33;
  v34 = [MEMORY[0x1E4F69548] iconDescriptorForAccessoryCategoryOrServiceType:*MEMORY[0x1E4F2C1B0]];
  v151[2] = v34;
  v150[3] = *MEMORY[0x1E4F68B10];
  v35 = [NSNumber numberWithInt:v26 ^ 1 | v8];
  v150[4] = *MEMORY[0x1E4F68A70];
  v151[3] = v35;
  v151[4] = MEMORY[0x1E4F1CC28];
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v151 forKeys:v150 count:5];
  v37 = (void *)[v30 initWithResults:v36];
  [(HUEditUserItemManager *)self setLocksItem:v37];

  id v38 = objc_alloc(MEMORY[0x1E4F68DC0]);
  v39 = [(HFItemManager *)self home];
  v121 = (void *)[v38 initWithHome:v39];

  v136[0] = MEMORY[0x1E4F143A8];
  v136[1] = 3221225472;
  v136[2] = __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_5;
  v136[3] = &unk_1E63869F0;
  objc_copyWeak(&v138, &location);
  id v108 = v4;
  id v137 = v108;
  [v121 setFilter:v136];
  id v40 = objc_alloc(MEMORY[0x1E4F696B0]);
  v134[0] = MEMORY[0x1E4F143A8];
  v134[1] = 3221225472;
  v134[2] = __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_7;
  v134[3] = &unk_1E6386A40;
  objc_copyWeak(&v135, &location);
  v41 = (void *)[v40 initWithSourceProvider:v121 transformationBlock:v134];
  [(HUEditUserItemManager *)self setAllowedAccessoryCategoryItemProvider:v41];

  v42 = [_HUUserAccessItem alloc];
  v43 = [(HUEditUserItemManager *)self userBeingEdited];
  v132[0] = MEMORY[0x1E4F143A8];
  v132[1] = 3221225472;
  v132[2] = __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_10;
  v132[3] = &unk_1E6386A68;
  objc_copyWeak(v133, &location);
  v133[1] = (id)a2;
  v44 = [(_HUUserAccessItem *)v42 initWithUser:v43 resultsBlock:v132];
  [(HUEditUserItemManager *)self setPersonalRequestsItem:v44];

  if ([(HUEditUserItemManager *)self _hasTVViewingProfilesDevice])
  {
    v45 = [(HFItemManager *)self home];
    v46 = [(HUEditUserItemManager *)self userBeingEdited];
    if (objc_msgSend(v45, "hf_canShowTvViewingInfoForUser:", v46))
    {
      if ([(HUEditUserItemManager *)self isUserBeingEditedTheDeviceUser])
      {
        BOOL v47 = 1;
      }
      else
      {
        v48 = [(HFItemManager *)self home];
        v49 = [v48 currentUser];
        BOOL v47 = [(HUEditUserItemManager *)self _isUserOwner:v49];
      }
    }
    else
    {
      BOOL v47 = 0;
    }
  }
  else
  {
    BOOL v47 = 0;
  }
  BOOL v50 = [(HUEditUserItemManager *)self isUserBeingEditedTheDeviceUser];
  v51 = HFLogForCategory();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v103 = NSStringFromSelector(a2);
    v104 = (void *)v103;
    v105 = @"HIDDEN";
    if (v47) {
      v105 = @"not hidden";
    }
    v106 = @"disabled";
    *(_DWORD *)buf = 138413058;
    v153 = self;
    v157 = v105;
    __int16 v154 = 2112;
    uint64_t v155 = v103;
    __int16 v156 = 2112;
    if (v50) {
      v106 = @"not disabled";
    }
    __int16 v158 = 2112;
    v159 = v106;
    _os_log_debug_impl(&dword_1BE345000, v51, OS_LOG_TYPE_DEBUG, "%@:%@  TV Viewing Profiles is %@ / %@", buf, 0x2Au);
  }
  v52 = [_HUUserAccessItem alloc];
  v53 = [(HUEditUserItemManager *)self userBeingEdited];
  v128[0] = MEMORY[0x1E4F143A8];
  v128[1] = 3221225472;
  v128[2] = __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_106;
  v128[3] = &unk_1E63866A0;
  objc_copyWeak(&v129, &location);
  BOOL v130 = v47;
  BOOL v131 = !v50;
  v54 = [(_HUUserAccessItem *)v52 initWithUser:v53 resultsBlock:v128];
  [(HUEditUserItemManager *)self setTvViewingProfilesItem:v54];

  v55 = [_HUUserAccessItem alloc];
  v56 = [(HUEditUserItemManager *)self userBeingEdited];
  v126[0] = MEMORY[0x1E4F143A8];
  v126[1] = 3221225472;
  v126[2] = __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_2_110;
  v126[3] = &unk_1E6384FD0;
  objc_copyWeak(&v127, &location);
  v57 = [(_HUUserAccessItem *)v55 initWithUser:v56 resultsBlock:v126];
  [(HUEditUserItemManager *)self setRemoveItem:v57];

  v58 = [_HUUserAccessItem alloc];
  v59 = [(HUEditUserItemManager *)self userBeingEdited];
  v124[0] = MEMORY[0x1E4F143A8];
  v124[1] = 3221225472;
  v124[2] = __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_3_120;
  v124[3] = &unk_1E6384FD0;
  objc_copyWeak(&v125, &location);
  v60 = [(_HUUserAccessItem *)v58 initWithUser:v59 resultsBlock:v124];
  [(HUEditUserItemManager *)self setPendingAccessoriesItem:v60];

  if ([(HUEditUserItemManager *)self isUserBeingEditedTheDeviceUser]
    || ([(HFItemManager *)self home],
        v61 = objc_claimAutoreleasedReturnValue(),
        [v61 currentUser],
        v62 = objc_claimAutoreleasedReturnValue(),
        BOOL v63 = [(HUEditUserItemManager *)self _isUserOwner:v62],
        v62,
        v61,
        v63))
  {
    v64 = [(HFItemManager *)self sourceItem];
    int v65 = [v64 hasValidSettings];

    if (v65)
    {
      v66 = [HUAccessorySettingsItemModule alloc];
      v67 = [(HFItemManager *)self sourceItem];
      uint64_t v148 = *MEMORY[0x1E4F68D90];
      uint64_t v149 = MEMORY[0x1E4F1CC38];
      v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v149 forKeys:&v148 count:1];
      v69 = [(HUAccessorySettingsItemModule *)v66 initWithItemUpdater:self homeKitSettingsVendor:v67 usageOptions:v68];
      [(HUEditUserItemManager *)self setUserSettingsItemModule:v69];
    }
    else
    {
      v67 = HFLogForCategory();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v153 = (HUEditUserItemManager *)"-[HUEditUserItemManager _buildItemProvidersForHome:]";
        _os_log_error_impl(&dword_1BE345000, v67, OS_LOG_TYPE_ERROR, "(%s) CAN'T ACCESS USER BASED SETTINGS: The user's settings can't be accessed because hasValidSettings == NO", buf, 0xCu);
      }
    }
  }
  else
  {
    v67 = HFLogForCategory();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
    {
      v107 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v153 = self;
      __int16 v154 = 2112;
      uint64_t v155 = (uint64_t)v107;
      _os_log_debug_impl(&dword_1BE345000, v67, OS_LOG_TYPE_DEBUG, "%@:%@  Not Displaying HMSettings based controls because current user is not permitted", buf, 0x16u);
    }
  }

  id v70 = objc_alloc(MEMORY[0x1E4F695C0]);
  v123[0] = MEMORY[0x1E4F143A8];
  v123[1] = 3221225472;
  v123[2] = __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_122;
  v123[3] = &unk_1E6385000;
  v123[4] = self;
  v71 = (void *)[v70 initWithResultsBlock:v123];
  [(HUEditUserItemManager *)self setUpdateListeningHistoryItem:v71];

  if ([(HUEditUserItemManager *)self _shouldShowBoltUI])
  {
    v72 = [HUMediaServiceSettingsItemModule alloc];
    v73 = [(HFItemManager *)self home];
    v74 = [(HUMediaServiceSettingsItemModule *)v72 initWithItemUpdater:self home:v73];
    [(HUEditUserItemManager *)self setMediaServiceItemModule:v74];
  }
  id v112 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  aSelectora = [(HUEditUserItemManager *)self homeScheduleItem];
  v147[0] = aSelectora;
  v117 = [(HUEditUserItemManager *)self localAccessItem];
  v147[1] = v117;
  v115 = [(HUEditUserItemManager *)self remoteAccessItem];
  v147[2] = v115;
  v75 = [(HUEditUserItemManager *)self allowEditingItem];
  v147[3] = v75;
  v76 = [(HUEditUserItemManager *)self camerasItem];
  v147[4] = v76;
  v77 = [(HUEditUserItemManager *)self locksItem];
  v147[5] = v77;
  v78 = [(HUEditUserItemManager *)self personalRequestsItem];
  v147[6] = v78;
  v79 = [(HUEditUserItemManager *)self tvViewingProfilesItem];
  v147[7] = v79;
  v80 = [(HUEditUserItemManager *)self updateListeningHistoryItem];
  v147[8] = v80;
  v81 = [(HUEditUserItemManager *)self removeItem];
  v147[9] = v81;
  v82 = [(HUEditUserItemManager *)self pendingAccessoriesItem];
  v147[10] = v82;
  v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:v147 count:11];
  v113 = (void *)[v112 initWithArray:v83];

  v84 = (void *)MEMORY[0x1E4F1CA80];
  v85 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v113];
  v86 = [v84 setWithObject:v85];

  v87 = [(HUEditUserItemManager *)self allowedAccessoryCategoryItemProvider];
  objc_msgSend(v86, "na_safeAddObject:", v87);

  v88 = [(HUEditUserItemManager *)self userSettingsItemModule];
  v89 = [v88 itemProviders];
  [v86 unionSet:v89];

  v90 = [(HUEditUserItemManager *)self mediaServiceItemModule];
  v91 = [v90 itemProviders];
  [v86 unionSet:v91];

  v92 = [v86 allObjects];

  objc_destroyWeak(&v125);
  objc_destroyWeak(&v127);
  objc_destroyWeak(&v129);
  objc_destroyWeak(v133);
  objc_destroyWeak(&v135);

  objc_destroyWeak(&v138);
  objc_destroyWeak(&v140);
  objc_destroyWeak(&v142);
  objc_destroyWeak(&location);

  return v92;
}

id __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  v15[4] = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) _canModifyUserBeingEditedPermissions];
  [*(id *)(a1 + 32) _hasResidentDevice];
  if ([*(id *)(a1 + 32) _hasResidentDevice]) {
    BOOL v3 = *(unsigned char *)(a1 + 40) != 0;
  }
  else {
    BOOL v3 = 1;
  }
  id v4 = (void *)MEMORY[0x1E4F7A0D8];
  v14[0] = *MEMORY[0x1E4F68B10];
  v5 = [NSNumber numberWithBool:v3];
  v15[0] = v5;
  v14[1] = *MEMORY[0x1E4F68AB8];
  char v6 = _HULocalizedStringWithDefaultValue(@"HUUsersCellControlAccessRemotely", @"HUUsersCellControlAccessRemotely", 1);
  v15[1] = v6;
  v14[2] = *MEMORY[0x1E4F68980];
  v7 = *(void **)(a1 + 32);
  unsigned int v8 = [v7 userBeingEdited];
  [v7 _isRemoteAccessAllowedForUser:v8];
  v9 = HFLocalizedString();
  v15[2] = v9;
  v14[3] = *MEMORY[0x1E4F68A08];
  uint64_t v10 = [NSNumber numberWithBool:v2 ^ 1u];
  v15[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  uint64_t v12 = [v4 futureWithResult:v11];

  return v12;
}

id __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1)
{
  v18[5] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained _canModifyUserBeingEditedPermissions] ^ 1;
  id v4 = (void *)MEMORY[0x1E4F7A0D8];
  v17[0] = *MEMORY[0x1E4F68B10];
  v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v18[0] = v5;
  v17[1] = *MEMORY[0x1E4F68AB8];
  char v6 = _HULocalizedStringWithDefaultValue(@"HUUsersCellAllowEditing", @"HUUsersCellAllowEditing", 1);
  uint64_t v7 = *MEMORY[0x1E4F68AC0];
  v18[1] = v6;
  v18[2] = @"HUUsersCellAllowEditing";
  uint64_t v8 = *MEMORY[0x1E4F68BC0];
  v17[2] = v7;
  v17[3] = v8;
  v9 = NSNumber;
  uint64_t v10 = [WeakRetained userBeingEdited];
  if ([WeakRetained _isEditingAllowedForUser:v10]) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 1;
  }
  uint64_t v12 = [v9 numberWithInteger:v11];
  v18[3] = v12;
  v17[4] = *MEMORY[0x1E4F68A08];
  uint64_t v13 = [NSNumber numberWithBool:v3];
  v18[4] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  v15 = [v4 futureWithResult:v14];

  return v15;
}

id __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1)
{
  v22[4] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = [WeakRetained home];
  uint64_t v3 = [WeakRetained userBeingEdited];
  id v4 = [v2 homeAccessControlForUser:v3];
  [v4 camerasAccessLevel];
  uint64_t v5 = HFLocalizedStringFromHMUserCameraAccessLevel();

  char v6 = [WeakRetained home];
  uint64_t v7 = objc_msgSend(v6, "hf_allCameraProfiles");
  if ([v7 count])
  {
    uint64_t v8 = [WeakRetained home];
    int v9 = objc_msgSend(v8, "hf_hasCameraRecordingResident") ^ 1;
  }
  else
  {
    int v9 = 1;
  }
  if (v5) {
    uint64_t v10 = (__CFString *)v5;
  }
  else {
    uint64_t v10 = &stru_1F18F92B8;
  }

  uint64_t v11 = [WeakRetained home];
  uint64_t v12 = [WeakRetained userBeingEdited];
  int v13 = objc_msgSend(v11, "hf_userIsRestrictedGuest:", v12);

  uint64_t v14 = (void *)MEMORY[0x1E4F7A0D8];
  v21[0] = *MEMORY[0x1E4F68B10];
  v15 = [NSNumber numberWithBool:v13 | v9];
  v22[0] = v15;
  v21[1] = *MEMORY[0x1E4F68AB8];
  id v16 = _HULocalizedStringWithDefaultValue(@"HUUsersCamerasTitle", @"HUUsersCamerasTitle", 1);
  v22[1] = v16;
  v21[2] = *MEMORY[0x1E4F689E8];
  v17 = [MEMORY[0x1E4F69548] iconDescriptorForAccessoryCategoryOrServiceType:*MEMORY[0x1E4F2C1D8]];
  v21[3] = *MEMORY[0x1E4F68980];
  v22[2] = v17;
  v22[3] = v10;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:4];
  objc_super v19 = [v14 futureWithResult:v18];

  return v19;
}

uint64_t __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_msgSend(v2, "hf_categoryOrPrimaryServiceType");
  if ([v3 isEqualToString:*MEMORY[0x1E4F2C1B0]])
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v5 = objc_msgSend(v2, "hf_categoryOrPrimaryServiceType");
    uint64_t v4 = [v5 isEqualToString:*MEMORY[0x1E4F2DE88]];
  }
  return v4;
}

uint64_t __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  char v6 = [WeakRetained home];
  if (objc_msgSend(v6, "hf_currentUserIsAdministrator"))
  {
    uint64_t v7 = [WeakRetained home];
    uint64_t v8 = [WeakRetained userBeingEdited];
    char v9 = objc_msgSend(v7, "hf_userIsRestrictedGuest:", v8);

    char v10 = v9 ^ 1;
  }
  else
  {
    char v10 = 1;
  }

  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F2E520], "hf_compatibleServiceTypesForCategoryType:", v4);

  uint64_t v12 = [*(id *)(a1 + 32) accessories];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_6;
  v19[3] = &unk_1E63869C8;
  id v13 = v11;
  id v20 = v13;
  int v14 = objc_msgSend(v12, "na_any:", v19);

  uint64_t v15 = 0;
  if ((v10 & 1) == 0 && v14)
  {
    id v16 = (void *)MEMORY[0x1E4F2EA78];
    v17 = [v13 allObjects];
    uint64_t v15 = [v16 doesAccessoryHaveRestrictedGuestCapableServiceTypes:v17];
  }
  return v15;
}

uint64_t __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_msgSend(a2, "hf_primaryService");
  id v4 = [v3 serviceType];
  uint64_t v5 = objc_msgSend(v2, "na_safeContainsObject:", v4);

  return v5;
}

id __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  id v5 = v3;
  if (objc_opt_isKindOfClass()) {
    char v6 = v5;
  }
  else {
    char v6 = 0;
  }
  id v7 = v6;

  id v8 = objc_alloc(MEMORY[0x1E4F696A8]);
  char v9 = (void *)[v7 copy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_8;
  v13[3] = &unk_1E6386A18;
  v13[4] = WeakRetained;
  id v14 = v7;
  id v10 = v7;
  uint64_t v11 = (void *)[v8 initWithSourceItem:v9 transformationBlock:v13];

  return v11;
}

id __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  id v4 = [*(id *)(a1 + 32) home];
  id v5 = [*(id *)(a1 + 32) userBeingEdited];
  char v6 = [v4 homeAccessControlForUser:v5];

  id v7 = [v6 restrictedGuestAccessSettings];
  id v8 = [v7 accessAllowedToAccessories];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_9;
  v19[3] = &unk_1E63869C8;
  id v20 = *(id *)(a1 + 40);
  char v9 = objc_msgSend(v8, "na_filter:", v19);
  uint64_t v10 = [v9 count];

  if (v10) {
    HULocalizedStringWithFormat(@"HURestrictedGuestScheduleUserSettings_AccessoryCategory_AllowedCount_Description", @"%lu", v11, v12, v13, v14, v15, v16, v10);
  }
  else {
  v17 = _HULocalizedStringWithDefaultValue(@"HURestrictedGuestScheduleUserSettings_AccessoryCategory_AllowedNone_Description", @"HURestrictedGuestScheduleUserSettings_AccessoryCategory_AllowedNone_Description", 1);
  }
  [v3 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F68980]];

  return v3;
}

uint64_t __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F2E520];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 categoryType];
  char v6 = objc_msgSend(v2, "hf_compatibleServiceTypesForCategoryType:", v5);
  id v7 = objc_msgSend(v4, "hf_primaryService");

  id v8 = [v7 serviceType];
  uint64_t v9 = objc_msgSend(v6, "na_safeContainsObject:", v8);

  return v9;
}

id __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_10(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _hasPersonalRequestsDevice])
  {
    if ([WeakRetained isUserBeingEditedTheDeviceUser])
    {
      int v3 = 1;
    }
    else
    {
      id v4 = [WeakRetained home];
      id v5 = [v4 currentUser];
      int v3 = [WeakRetained _isUserOwner:v5];
    }
  }
  else
  {
    int v3 = 0;
  }
  if ([WeakRetained isUserBeingEditedTheDeviceUser]) {
    uint64_t v6 = [MEMORY[0x1E4F69758] isAMac];
  }
  else {
    uint64_t v6 = 1;
  }
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = NSStringFromSelector(*(SEL *)(a1 + 40));
    v17 = (void *)v16;
    v18 = @"HIDDEN";
    if (v3) {
      v18 = @"not hidden";
    }
    objc_super v19 = @"not disabled";
    *(_DWORD *)buf = 138413058;
    id v23 = WeakRetained;
    v27 = v18;
    __int16 v24 = 2112;
    uint64_t v25 = v16;
    __int16 v26 = 2112;
    if (v6) {
      objc_super v19 = @"disabled";
    }
    __int16 v28 = 2112;
    v29 = v19;
    _os_log_debug_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEBUG, "%@:%@  Personal Requests is %@ / %@", buf, 0x2Au);
  }
  id v8 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", v3 ^ 1u, *MEMORY[0x1E4F68B10]);
  v21[0] = v9;
  v20[1] = *MEMORY[0x1E4F68AB8];
  uint64_t v10 = _HULocalizedStringWithDefaultValue(@"HUUsersPersonalRequests", @"HUUsersPersonalRequests", 1);
  v21[1] = v10;
  v20[2] = *MEMORY[0x1E4F68980];
  [WeakRetained _isPersonalRequestsEnabledForUser];
  uint64_t v11 = HFLocalizedString();
  v21[2] = v11;
  v20[3] = *MEMORY[0x1E4F68A08];
  uint64_t v12 = [NSNumber numberWithBool:v6];
  v20[4] = *MEMORY[0x1E4F68A70];
  v21[3] = v12;
  void v21[4] = MEMORY[0x1E4F1CC28];
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:5];
  uint64_t v14 = [v8 futureWithResult:v13];

  return v14;
}

id __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_106(uint64_t a1)
{
  v12[5] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = (void *)MEMORY[0x1E4F7A0D8];
  v11[0] = *MEMORY[0x1E4F68B10];
  id v4 = [NSNumber numberWithInt:*(unsigned char *)(a1 + 40) == 0];
  v12[0] = v4;
  v11[1] = *MEMORY[0x1E4F68AB8];
  id v5 = _HULocalizedStringWithDefaultValue(@"HUUsersShowTVViewingProfile", @"HUUsersShowTVViewingProfile", 1);
  v12[1] = v5;
  v11[2] = *MEMORY[0x1E4F68980];
  [WeakRetained _isTVViewingProfilesEnabledForUser];
  uint64_t v6 = HFLocalizedString();
  v12[2] = v6;
  v11[3] = *MEMORY[0x1E4F68A08];
  id v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 41)];
  v11[4] = *MEMORY[0x1E4F68A70];
  v12[3] = v7;
  v12[4] = MEMORY[0x1E4F1CC28];
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:5];
  uint64_t v9 = [v3 futureWithResult:v8];

  return v9;
}

id __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_2_110(uint64_t a1)
{
  void v14[4] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained userBeingEdited];
  uint64_t v3 = [WeakRetained _isUserOwner:v2];

  id v4 = (void *)MEMORY[0x1E4F7A0D8];
  v13[0] = *MEMORY[0x1E4F68AB8];
  if ([WeakRetained isUserBeingEditedTheDeviceUser]) {
    id v5 = @"HUEditLocationLeaveHomeButtonTitle";
  }
  else {
    id v5 = @"HUUsersCellRemovePerson";
  }
  uint64_t v6 = _HULocalizedStringWithDefaultValue(v5, v5, 1);
  uint64_t v7 = *MEMORY[0x1E4F68928];
  v14[0] = v6;
  v14[1] = @"Home.Users.Remove";
  uint64_t v8 = *MEMORY[0x1E4F68B10];
  v13[1] = v7;
  v13[2] = v8;
  uint64_t v9 = [NSNumber numberWithBool:v3];
  v13[3] = *MEMORY[0x1E4F68A70];
  v14[2] = v9;
  v14[3] = MEMORY[0x1E4F1CC28];
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  uint64_t v11 = [v4 futureWithResult:v10];

  return v11;
}

id __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_3_120(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v7 = *MEMORY[0x1E4F68B10];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(WeakRetained, "_hasPendingAccessories") ^ 1);
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v5 = [v2 futureWithResult:v4];

  return v5;
}

id __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_122(uint64_t a1)
{
  v22[4] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) home];
  uint64_t v3 = [v2 accessories];
  id v4 = objc_msgSend(v3, "na_filter:", &__block_literal_global_125);

  if ([v4 count])
  {
    if ([*(id *)(a1 + 32) isUserBeingEditedTheDeviceUser])
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v6 = *(void **)(a1 + 32);
      uint64_t v7 = [v6 home];
      uint64_t v8 = [v7 currentUser];
      uint64_t v5 = [v6 _isUserOwner:v8] ^ 1;
    }
  }
  else
  {
    uint64_t v5 = 1;
  }
  id v9 = objc_alloc(MEMORY[0x1E4F69710]);
  uint64_t v10 = [*(id *)(a1 + 32) home];
  uint64_t v11 = [*(id *)(a1 + 32) userBeingEdited];
  uint64_t v12 = (void *)[v9 initWithHome:v10 user:v11 nameStyle:0];

  if (([MEMORY[0x1E4F69758] isAMac] & 1) != 0
    || ![*(id *)(a1 + 32) isUserBeingEditedTheDeviceUser])
  {
    uint64_t v13 = 1;
  }
  else
  {
    uint64_t v13 = [v12 isIdentifyVoiceEnabled] ^ 1;
  }
  uint64_t v14 = (void *)MEMORY[0x1E4F7A0D8];
  v21[0] = *MEMORY[0x1E4F68B10];
  uint64_t v15 = [NSNumber numberWithInt:v5];
  v22[0] = v15;
  v21[1] = *MEMORY[0x1E4F68AB8];
  uint64_t v16 = _HULocalizedStringWithDefaultValue(@"HUUpdateListeningHistorySettingTitle", @"HUUpdateListeningHistorySettingTitle", 1);
  v22[1] = v16;
  v21[2] = *MEMORY[0x1E4F68A08];
  v17 = [NSNumber numberWithBool:v13];
  v21[3] = *MEMORY[0x1E4F68A70];
  v22[2] = v17;
  v22[3] = MEMORY[0x1E4F1CC28];
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:4];
  objc_super v19 = [v14 futureWithResult:v18];

  return v19;
}

uint64_t __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_2_123(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_supportsUserLevelUpdateListeningHistorySetting");
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v110[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = [(HUEditUserItemManager *)self localAccessItem];
  v110[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v110 count:1];
  id v9 = (void *)[v6 initWithArray:v8];
  int v10 = [v4 intersectsSet:v9];

  if (v10)
  {
    uint64_t v11 = [(HUEditUserItemManager *)self localAccessItem];
    if ([v4 containsObject:v11])
    {
      BOOL v12 = [(HUEditUserItemManager *)self _hasResidentDevice];

      if (v12) {
        goto LABEL_6;
      }
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUEditUserItemManager_AccessSectionIdentifier"];
      uint64_t v13 = [(HUEditUserItemManager *)self localAccessItem];
      v109 = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v109 count:1];
      [v11 setItems:v14];

      [v5 addObject:v11];
    }
  }
LABEL_6:
  id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v16 = [(HUEditUserItemManager *)self homeScheduleItem];
  v108[0] = v16;
  v17 = [(HUEditUserItemManager *)self remoteAccessItem];
  v108[1] = v17;
  v18 = [(HUEditUserItemManager *)self allowEditingItem];
  v108[2] = v18;
  objc_super v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:3];
  id v20 = (void *)[v15 initWithArray:v19];
  int v21 = [v4 intersectsSet:v20];

  if (v21)
  {
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v23 = [(HUEditUserItemManager *)self remoteAccessItem];
    int v24 = [v4 containsObject:v23];

    if (v24)
    {
      uint64_t v25 = [(HUEditUserItemManager *)self remoteAccessItem];
      [v22 addObject:v25];
    }
    __int16 v26 = [(HUEditUserItemManager *)self homeScheduleItem];
    int v27 = [v4 containsObject:v26];

    if (v27)
    {
      __int16 v28 = [(HUEditUserItemManager *)self homeScheduleItem];
      [v22 addObject:v28];
    }
    v29 = [(HUEditUserItemManager *)self allowEditingItem];
    int v30 = [v4 containsObject:v29];

    if (v30)
    {
      v31 = [(HUEditUserItemManager *)self allowEditingItem];
      [v22 addObject:v31];
    }
    if ([v22 count])
    {
      uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUEditUserItemManager_EditingSectionIdentifier"];
      [v32 setItems:v22];
      uint64_t v33 = _HULocalizedStringWithDefaultValue(@"HUAllowAccessSectionTitle", @"HUAllowAccessSectionTitle", 1);
      v34 = _HULocalizedStringWithDefaultValue(@"HUUsersAllowEditingFooter", @"HUUsersAllowEditingFooter", 1);
      v35 = [(HUEditUserItemManager *)self homeScheduleItem];
      int v36 = [v4 containsObject:v35];

      if (v36)
      {
        uint64_t v37 = HFLocalizedString();

        uint64_t v38 = _HULocalizedStringWithDefaultValue(@"HURestrictedGuestScheduleUserSettings_SectionFooter_Title", @"HURestrictedGuestScheduleUserSettings_SectionFooter_Title", 1);

        v34 = (void *)v38;
        uint64_t v33 = (void *)v37;
      }
      [v32 setHeaderTitle:v33];
      [v32 setFooterTitle:v34];
      [v5 addObject:v32];
    }
  }
  id v39 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v40 = [(HUEditUserItemManager *)self camerasItem];
  v107 = v40;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:1];
  v42 = (void *)[v39 initWithArray:v41];
  int v43 = [v4 intersectsSet:v42];

  if (v43)
  {
    v44 = [(HUEditUserItemManager *)self camerasItem];
    int v45 = [v4 containsObject:v44];

    if (v45)
    {
      v46 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUEditUserItemManager_AccessLevelSectionIdentifier"];
      BOOL v47 = [(HUEditUserItemManager *)self camerasItem];
      v106 = v47;
      v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v106 count:1];
      [v46 setItems:v48];

      [v5 addObject:v46];
    }
  }
  v49 = [(HUEditUserItemManager *)self locksItem];
  int v50 = [v4 containsObject:v49];

  if (v50)
  {
    v51 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUEditUserItemManager_AccessoriesSectionIdentifier"];
    v52 = [(HUEditUserItemManager *)self locksItem];
    v105 = v52;
    v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v105 count:1];
    [v51 setItems:v53];

    [v5 addObject:v51];
  }
  v54 = [(HUEditUserItemManager *)self allowedAccessoryCategoryItemProvider];
  v55 = [v54 items];
  int v56 = [v4 intersectsSet:v55];

  if (v56)
  {
    v57 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUEditUserItemManager_AccessoriesSectionIdentifier"];
    v58 = [(HUEditUserItemManager *)self allowedAccessoryCategoryItemProvider];
    v59 = [v58 items];
    v60 = [v59 allObjects];
    v61 = [MEMORY[0x1E4F69220] defaultItemComparator];
    v62 = [v60 sortedArrayUsingComparator:v61];
    [v57 setItems:v62];

    [v5 addObject:v57];
  }
  BOOL v63 = [(HUEditUserItemManager *)self userSettingsItemModule];
  v64 = [v63 buildSectionsWithDisplayedItems:v4];

  LOBYTE(v63) = [(HUEditUserItemManager *)self _isVoiceIDEnabled:v64];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__HUEditUserItemManager__buildSectionsWithDisplayedItems___block_invoke;
  aBlock[3] = &unk_1E6386A90;
  aBlock[4] = self;
  id v65 = v4;
  char v101 = (char)v63;
  id v99 = v65;
  SEL v100 = a2;
  v66 = _Block_copy(aBlock);
  v67 = [(HUEditUserItemManager *)self homeForUser];
  v68 = [v67 accessories];
  char v69 = objc_msgSend(v68, "na_any:", &__block_literal_global_177);

  v96[0] = MEMORY[0x1E4F143A8];
  v96[1] = 3221225472;
  v96[2] = __58__HUEditUserItemManager__buildSectionsWithDisplayedItems___block_invoke_2_178;
  v96[3] = &unk_1E6386AB8;
  v96[4] = self;
  char v97 = v69;
  id v70 = objc_msgSend(v64, "na_filter:", v96);
  v71 = objc_msgSend(v70, "na_map:", v66);

  v72 = [v71 sortedArrayUsingComparator:&__block_literal_global_183];
  [v5 addObjectsFromArray:v72];

  if ([(HUEditUserItemManager *)self _hasTVViewingProfilesDevice])
  {
    v73 = [(HUEditUserItemManager *)self tvViewingProfilesItem];
    int v74 = [v65 containsObject:v73];

    if (v74)
    {
      v75 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUEditUserItemManager_TVViewingProfilesSectionIdentifier"];
      v76 = [(HUEditUserItemManager *)self tvViewingProfilesItem];
      v104 = v76;
      v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v104 count:1];
      [v75 setItems:v77];

      [v5 addObject:v75];
    }
  }
  v78 = [(HUEditUserItemManager *)self mediaServiceItemModule];
  v79 = [v78 buildSectionsWithDisplayedItems:v65];

  [v5 addObjectsFromArray:v79];
  v80 = [(HUEditUserItemManager *)self pendingAccessoriesItem];
  int v81 = [v65 containsObject:v80];

  if (v81)
  {
    v82 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUEditUserItemManager_PendingAccessoriesSectionIdentifier"];
    v83 = _HULocalizedStringWithDefaultValue(@"HUUsersTableSectionPendingAccessories", @"HUUsersTableSectionPendingAccessories", 1);
    [v82 setHeaderTitle:v83];

    v84 = _HULocalizedStringWithDefaultValue(@"HUUsersPendingAccessoriesFooter", @"HUUsersPendingAccessoriesFooter", 1);
    [v82 setFooterTitle:v84];

    v85 = [(HUEditUserItemManager *)self pendingAccessoriesItem];
    uint64_t v103 = v85;
    v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v103 count:1];
    [v82 setItems:v86];

    [v5 addObject:v82];
  }
  v87 = [(HUEditUserItemManager *)self removeItem];
  int v88 = [v65 containsObject:v87];

  if (v88)
  {
    v89 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUEditUserItemManager_ButtonSectionIdentifier"];
    v90 = [(HUEditUserItemManager *)self removeItem];
    BOOL v102 = v90;
    v91 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
    [v89 setItems:v91];

    [v5 addObject:v89];
  }
  v95[0] = MEMORY[0x1E4F143A8];
  v95[1] = 3221225472;
  v95[2] = __58__HUEditUserItemManager__buildSectionsWithDisplayedItems___block_invoke_4_190;
  v95[3] = &unk_1E6386B00;
  v95[4] = self;
  v92 = [v5 sortedArrayUsingComparator:v95];

  return v92;
}

id __58__HUEditUserItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  v102[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 headerTitle];
  id v5 = _HULocalizedStringWithDefaultValue(@"HUSiriSectionTitle", @"HUSiriSectionTitle", 1);
  if ([v4 isEqualToString:v5]) {
    id v6 = (id)[v3 mutableCopy];
  }
  else {
    id v6 = 0;
  }

  [*(id *)(a1 + 32) _updateSiriSectionFooterForSection:v6];
  if (![*(id *)(a1 + 32) _hasPersonalRequestsDevice]) {
    goto LABEL_27;
  }
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = [*(id *)(a1 + 32) personalRequestsItem];
  LODWORD(v7) = [v7 containsObject:v8];

  if (!v7) {
    goto LABEL_27;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    id v9 = [v3 headerTitle];
    int v10 = _HULocalizedStringWithDefaultValue(@"HUSiriSectionTitle", @"HUSiriSectionTitle", 1);
    int v11 = [v9 isEqualToString:v10];

    if (v11)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F692E8]);
      uint64_t v13 = [v3 identifier];
      uint64_t v14 = (void *)[v12 initWithIdentifier:v13];

      id v15 = (void *)MEMORY[0x1E4F1CA48];
      uint64_t v16 = [v3 items];
      v17 = [v15 arrayWithArray:v16];

      v18 = [*(id *)(a1 + 32) personalRequestsItem];
      [v17 addObject:v18];

      objc_super v19 = _HULocalizedStringWithDefaultValue(@"HUSiriSectionTitle", @"HUSiriSectionTitle", 1);
      [v14 setHeaderTitle:v19];

      [v14 setFooterTitle:0];
      [*(id *)(a1 + 32) _updateSiriSectionFooterForSection:v14];
      [v14 setItems:v17];

      id v6 = v14;
LABEL_16:
      if (v6)
      {
        v48 = [v6 headerTitle];
        v49 = _HULocalizedStringWithDefaultValue(@"HUSiriSectionTitle", @"HUSiriSectionTitle", 1);
        int v50 = [v48 isEqualToString:v49];

        if (v50)
        {
          v80 = v6;
          id v81 = v3;
          long long v88 = 0u;
          long long v89 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          v51 = [v6 items];
          uint64_t v52 = [v51 countByEnumeratingWithState:&v86 objects:v101 count:16];
          if (v52)
          {
            uint64_t v53 = v52;
            uint64_t v54 = *(void *)v87;
            uint64_t v55 = *MEMORY[0x1E4F68AF0];
            uint64_t v56 = MEMORY[0x1E4F1CC38];
            do
            {
              for (uint64_t i = 0; i != v53; ++i)
              {
                if (*(void *)v87 != v54) {
                  objc_enumerationMutation(v51);
                }
                v58 = *(void **)(*((void *)&v86 + 1) + 8 * i);
                v59 = objc_opt_new();
                [v59 setObject:v56 forKeyedSubscript:v55];
                id v60 = (id)[v58 updateWithOptions:v59];
              }
              uint64_t v53 = [v51 countByEnumeratingWithState:&v86 objects:v101 count:16];
            }
            while (v53);
          }

          v61 = [MEMORY[0x1E4F691A0] sharedDispatcher];
          v62 = [v61 homeManager];
          int v63 = [v62 hasOptedToHH2];

          if (v63)
          {
            v64 = [*(id *)(a1 + 32) homeForUser];
            int v65 = objc_msgSend(v64, "hf_hasReachableResidents") ^ 1;
          }
          else
          {
            int v65 = 0;
          }
          v67 = HFLogForCategory();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v68 = *(void *)(a1 + 32);
            char v69 = NSStringFromSelector(*(SEL *)(a1 + 48));
            *(_DWORD *)buf = 138413058;
            *(void *)&uint8_t buf[4] = v68;
            __int16 v95 = 2112;
            v96 = v69;
            __int16 v97 = 1024;
            int v98 = v63;
            __int16 v99 = 1024;
            int v100 = v65;
            _os_log_impl(&dword_1BE345000, v67, OS_LOG_TYPE_DEFAULT, "%@:%@: hasOptedToHH2 %{BOOL}d, shouldDisableVoiceIDSetting = %{BOOL}d", buf, 0x22u);
          }
          if (([*(id *)(a1 + 32) isUserBeingEditedTheDeviceUser] ^ 1 | v65) == 1)
          {
            long long v84 = 0u;
            long long v85 = 0u;
            long long v82 = 0u;
            long long v83 = 0u;
            id v70 = [v80 items];
            uint64_t v71 = [v70 countByEnumeratingWithState:&v82 objects:v93 count:16];
            if (v71)
            {
              uint64_t v72 = v71;
              uint64_t v73 = *(void *)v83;
              uint64_t v74 = *MEMORY[0x1E4F68A08];
              uint64_t v75 = MEMORY[0x1E4F1CC38];
              do
              {
                for (uint64_t j = 0; j != v72; ++j)
                {
                  if (*(void *)v83 != v73) {
                    objc_enumerationMutation(v70);
                  }
                  v77 = *(void **)(*((void *)&v82 + 1) + 8 * j);
                  v78 = objc_opt_new();
                  [v78 setObject:v75 forKeyedSubscript:v74];
                  id v79 = (id)[v77 updateWithOptions:v78];
                }
                uint64_t v72 = [v70 countByEnumeratingWithState:&v82 objects:v93 count:16];
              }
              while (v72);
            }
          }
          id v6 = v80;
          id v25 = v6;
          id v3 = v81;
          goto LABEL_28;
        }
      }
LABEL_27:
      id v25 = v3;
      goto LABEL_28;
    }
  }
  id v20 = [v3 headerTitle];
  int v21 = HFLocalizedString();
  int v22 = [v20 isEqualToString:v21];

  if (!v22) {
    goto LABEL_16;
  }
  id v23 = objc_alloc(MEMORY[0x1E4F692E8]);
  int v24 = [v3 identifier];
  id v25 = (id)[v23 initWithIdentifier:v24];

  __int16 v26 = [v3 items];
  v92[0] = MEMORY[0x1E4F143A8];
  v92[1] = 3221225472;
  v92[2] = __58__HUEditUserItemManager__buildSectionsWithDisplayedItems___block_invoke_2;
  v92[3] = &unk_1E6386108;
  v92[4] = *(void *)(a1 + 32);
  int v27 = objc_msgSend(v26, "na_filter:", v92);
  [v25 setItems:v27];

  uint64_t v28 = [*(id *)(a1 + 32) updateListeningHistoryItem];
  if (v28)
  {
    v29 = (void *)v28;
    int v30 = *(void **)(a1 + 40);
    v31 = [*(id *)(a1 + 32) updateListeningHistoryItem];
    LODWORD(v30) = [v30 containsObject:v31];

    if (v30)
    {
      uint64_t v32 = (void *)MEMORY[0x1E4F1CA48];
      uint64_t v33 = [v25 items];
      v34 = [v32 arrayWithArray:v33];

      v35 = [*(id *)(a1 + 32) updateListeningHistoryItem];
      [v34 addObject:v35];

      [v25 setItems:v34];
    }
  }
  int v36 = [v3 headerTitle];
  [v25 setHeaderTitle:v36];

  uint64_t v37 = [v25 items];
  v90[0] = MEMORY[0x1E4F143A8];
  v90[1] = 3221225472;
  v90[2] = __58__HUEditUserItemManager__buildSectionsWithDisplayedItems___block_invoke_3;
  v90[3] = &unk_1E6386108;
  id v91 = *(id *)(a1 + 40);
  int v38 = objc_msgSend(v37, "na_any:", v90);

  if (v38)
  {
    id v39 = HFLocalizedString();
    id v40 = HFLocalizedString();
    id v41 = objc_alloc(MEMORY[0x1E4F28E48]);
    v42 = [v39 stringByAppendingString:@" "];
    int v43 = (void *)[v41 initWithString:v42];

    id v44 = objc_alloc(MEMORY[0x1E4F28B18]);
    v102[0] = *MEMORY[0x1E4F42530];
    int v45 = [MEMORY[0x1E4F696F8] musicPrivacyURL];
    *(void *)buf = v45;
    v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v102 count:1];
    BOOL v47 = (void *)[v44 initWithString:v40 attributes:v46];
    [v43 appendAttributedString:v47];

    [v25 setAttributedFooterTitle:v43];
  }

LABEL_28:

  return v25;
}

uint64_t __58__HUEditUserItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if ([*(id *)(a1 + 32) _shouldShowBoltUI] && v6)
  {
    uint64_t v7 = [v6 settingKeyPath];
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4F68550]];

    unsigned int v9 = v8 ^ 1;
  }
  else
  {
    unsigned int v9 = 1;
    if (!v6) {
      goto LABEL_9;
    }
  }
  int v10 = [v6 settingKeyPath];
  int v11 = [v10 isEqualToString:*MEMORY[0x1E4F68540]];

  v9 &= ~v11;
LABEL_9:
  id v12 = [v6 settingKeyPath];
  if ([v12 isEqualToString:*MEMORY[0x1E4F68588]])
  {
  }
  else
  {
    uint64_t v13 = [v6 settingKeyPath];
    int v14 = [v13 isEqualToString:*MEMORY[0x1E4F68558]];

    unsigned int v15 = v9;
    if (!v14) {
      goto LABEL_13;
    }
  }
  unsigned int v15 = 0;
LABEL_13:
  if (v6) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = v9;
  }

  return v16;
}

uint64_t __58__HUEditUserItemManager__buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = [v6 settingKeyPath];
    if ([v7 isEqualToString:*MEMORY[0x1E4F68550]]) {
      uint64_t v8 = [*(id *)(a1 + 32) containsObject:v6];
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __58__HUEditUserItemManager__buildSectionsWithDisplayedItems___block_invoke_175(uint64_t a1, void *a2)
{
  return [a2 supportsUserMediaSettings];
}

uint64_t __58__HUEditUserItemManager__buildSectionsWithDisplayedItems___block_invoke_2_178(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) home];
  id v5 = [*(id *)(a1 + 32) userBeingEdited];
  char v6 = objc_msgSend(v4, "hf_userIsRestrictedGuest:", v5);

  if (v6)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = [v3 headerTitle];
    unsigned int v9 = HFLocalizedString();
    int v10 = [v8 isEqualToString:v9];

    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = v10 ^ 1u;
    }
  }

  return v7;
}

uint64_t __58__HUEditUserItemManager__buildSectionsWithDisplayedItems___block_invoke_3_180(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 userInfo];
  char v6 = [v5 objectForKeyedSubscript:@"HUAccessorySettingsItemModuleSortKey"];
  uint64_t v7 = [v4 userInfo];

  uint64_t v8 = [v7 objectForKeyedSubscript:@"HUAccessorySettingsItemModuleSortKey"];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

uint64_t __58__HUEditUserItemManager__buildSectionsWithDisplayedItems___block_invoke_4_190(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  char v6 = [a2 identifier];
  uint64_t v7 = [v5 identifier];

  int v8 = [*(id *)(a1 + 32) isUserBeingEditedTheDeviceUser];
  uint64_t v9 = *(void **)(a1 + 32);
  if (v8) {
    [v9 sectionOrderArrayWhenViewingSelf];
  }
  else {
  int v10 = [v9 sectionOrderArrayWhenViewingOther];
  }
  unint64_t v11 = [v10 indexOfObject:v6];
  unint64_t v12 = [v10 indexOfObject:v7];
  uint64_t v13 = -1;
  uint64_t v14 = 1;
  if (v11 < v12) {
    uint64_t v15 = -1;
  }
  else {
    uint64_t v15 = 1;
  }
  if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v14 = v15;
  }
  if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v13 = v14;
  }
  if (v11 == v12) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = v13;
  }

  return v16;
}

- (id)_itemsToHideInSet:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)HUEditUserItemManager;
  id v5 = a3;
  char v6 = [(HFItemManager *)&v15 _itemsToHideInSet:v5];
  uint64_t v7 = (void *)[v6 mutableCopy];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__HUEditUserItemManager__itemsToHideInSet___block_invoke;
  v12[3] = &unk_1E6386B28;
  v12[4] = self;
  SEL v14 = a2;
  id v8 = v7;
  id v13 = v8;
  [v5 enumerateObjectsUsingBlock:v12];

  uint64_t v9 = v13;
  id v10 = v8;

  return v10;
}

void __43__HUEditUserItemManager__itemsToHideInSet___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 latestResults];
  uint64_t v5 = *MEMORY[0x1E4F67FC8];
  char v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F67FC8]];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F685A0]];

  if (!v7)
  {
    v17 = [v3 latestResults];
    v18 = [v17 objectForKeyedSubscript:v5];
    int v19 = [v18 isEqualToString:*MEMORY[0x1E4F68548]];

    if (!v19) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  id v8 = [*(id *)(a1 + 32) home];
  int v9 = objc_msgSend(v8, "hf_hasRMVCapableAppleTV");

  id v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = *(void *)(a1 + 32);
    unint64_t v11 = NSStringFromSelector(*(SEL *)(a1 + 48));
    unint64_t v12 = [*(id *)(a1 + 32) home];
    id v13 = [*(id *)(a1 + 32) home];
    SEL v14 = [v13 currentUser];
    objc_super v15 = objc_msgSend(v14, "hf_prettyDescription");
    uint64_t v16 = [*(id *)(a1 + 32) homeForUser];
    *(_DWORD *)buf = 138413570;
    uint64_t v24 = v22;
    __int16 v25 = 2112;
    __int16 v26 = v11;
    __int16 v27 = 2112;
    uint64_t v28 = v12;
    __int16 v29 = 2112;
    int v30 = v15;
    __int16 v31 = 1024;
    int v32 = v9;
    __int16 v33 = 1024;
    int v34 = objc_msgSend(v16, "hf_hasHomePods");
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ Home = %@ currentUser = %@ shouldShowRMVSettingInHome = %{BOOL}d [self.homeForUser hf_hasHomePods] = %{BOOL}d", buf, 0x36u);
  }
  if ((v9 & 1) == 0)
  {
LABEL_7:
    id v20 = [*(id *)(a1 + 32) homeForUser];
    char v21 = objc_msgSend(v20, "hf_hasHomePods");

    if ((v21 & 1) == 0) {
      [*(id *)(a1 + 40) addObject:v3];
    }
  }
LABEL_9:
}

- (void)_registerForExternalUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)HUEditUserItemManager;
  [(HFItemManager *)&v4 _registerForExternalUpdates];
  id v3 = [(HUEditUserItemManager *)self mediaServiceItemModule];
  [v3 registerForExternalUpdates];
}

- (void)_unregisterForExternalUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)HUEditUserItemManager;
  [(HFItemManager *)&v4 _unregisterForExternalUpdates];
  id v3 = [(HUEditUserItemManager *)self mediaServiceItemModule];
  [v3 unregisterForExternalUpdates];
}

- (BOOL)_isRemoteAccessAllowedForUser:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self home];
  char v6 = [v5 homeAccessControlForUser:v4];

  LOBYTE(v4) = [v6 isRemoteAccessAllowed];
  return (char)v4;
}

- (BOOL)_isEditingAllowedForUser:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self home];
  char v6 = [v5 homeAccessControlForUser:v4];

  LOBYTE(v4) = [v6 isAdministrator];
  return (char)v4;
}

- (BOOL)_isUserOwner:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self home];
  char v6 = [v5 homeAccessControlForUser:v4];

  LOBYTE(v4) = [v6 isOwner];
  return (char)v4;
}

- (BOOL)_hasResidentDevice
{
  id v3 = [(HFItemManager *)self home];
  if (objc_msgSend(v3, "hf_supportsRemoteAccessRestrictions"))
  {
    char v4 = 1;
  }
  else
  {
    uint64_t v5 = [(HFItemManager *)self home];
    char v4 = objc_msgSend(v5, "hf_supportsPerUserRemoteAccess");
  }
  return v4;
}

- (BOOL)_hasPersonalRequestsDevice
{
  id v2 = [(HFItemManager *)self home];
  id v3 = objc_msgSend(v2, "hf_mediaAccessories");
  char v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_200);

  return v4;
}

uint64_t __51__HUEditUserItemManager__hasPersonalRequestsDevice__block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F2E670] isAccessorySupported:a2];
}

- (BOOL)_hasTVViewingProfilesDevice
{
  id v2 = [(HFItemManager *)self home];
  id v3 = objc_msgSend(v2, "hf_tvViewingProfilesAccessories");
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)_hasPendingAccessories
{
  id v2 = [(HUEditUserItemManager *)self userBeingEdited];
  id v3 = [v2 pendingAccessoryInvitations];

  LOBYTE(v2) = objc_msgSend(v3, "na_any:", &__block_literal_global_204);
  return (char)v2;
}

BOOL __47__HUEditUserItemManager__hasPendingAccessories__block_invoke(uint64_t a1, void *a2)
{
  return [a2 state] != 1;
}

- (BOOL)_canModifyUserBeingEditedPermissions
{
  id v3 = [(HFItemManager *)self home];
  BOOL v4 = [v3 currentUser];
  if ([(HUEditUserItemManager *)self _isUserOwner:v4])
  {
    BOOL v5 = [(HUEditUserItemManager *)self isUserBeingEditedTheDeviceUser];

    if (!v5)
    {
      LOBYTE(v6) = 1;
      return v6;
    }
  }
  else
  {
  }
  int v7 = [(HFItemManager *)self home];
  id v8 = [v7 currentUser];
  if ([(HUEditUserItemManager *)self _isEditingAllowedForUser:v8])
  {
    int v9 = [(HUEditUserItemManager *)self userBeingEdited];
    BOOL v6 = ![(HUEditUserItemManager *)self _isEditingAllowedForUser:v9];
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)_isPersonalRequestsEnabledForUser
{
  id v3 = [(HFItemManager *)self home];
  BOOL v4 = [v3 currentUser];
  BOOL v5 = [(HUEditUserItemManager *)self _isUserOwner:v4];

  BOOL v6 = [(HUEditUserItemManager *)self userBeingEdited];
  int v7 = [(HFItemManager *)self home];
  id v8 = [v6 assistantAccessControlForHome:v7];

  int v9 = [(HUEditUserItemManager *)self supportedMULanguageCodes];
  LOBYTE(v6) = objc_msgSend(v8, "hf_effectivelyEnabledForSupportedVoiceRecognitionLanguages:currentUserIsOwner:", v9, v5);

  return (char)v6;
}

- (BOOL)_isTVViewingProfilesEnabledForUser
{
  id v3 = [(HUEditUserItemManager *)self userBeingEdited];
  BOOL v4 = [(HFItemManager *)self home];
  BOOL v5 = [v3 mediaContentProfileAccessControlForHome:v4];

  BOOL v6 = [v5 accessories];
  LOBYTE(v3) = [v6 count] != 0;

  return (char)v3;
}

- (BOOL)_isVoiceIDEnabled:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    char v5 = 0;
    uint64_t v6 = *(void *)v32;
    uint64_t v7 = *MEMORY[0x1E4F685A0];
    uint64_t v8 = *MEMORY[0x1E4F68570];
    uint64_t v23 = *MEMORY[0x1E4F685A0];
    uint64_t v24 = *(void *)v32;
    do
    {
      uint64_t v9 = 0;
      uint64_t v25 = v4;
      do
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
        unint64_t v11 = objc_msgSend(v10, "identifier", v23, v24);
        int v12 = [v11 isEqualToString:v7];

        if (v12)
        {
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          id v13 = [v10 items];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
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
                v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
                int v19 = [v18 settingKeyPath];
                int v20 = [v19 isEqualToString:v8];

                if (v20)
                {
                  char v21 = [v18 value];
                  char v5 = [v21 BOOLValue];
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v15);
          }

          uint64_t v7 = v23;
          uint64_t v6 = v24;
          uint64_t v4 = v25;
        }
        ++v9;
      }
      while (v9 != v4);
      uint64_t v4 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v4);
  }
  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

- (BOOL)_shouldShowBoltUI
{
  if (![(HUEditUserItemManager *)self isUserBeingEditedTheDeviceUser]) {
    return 0;
  }
  uint64_t v3 = [(HUEditUserItemManager *)self userSettingsItemModule];
  if (v3)
  {
    uint64_t v4 = [(HFItemManager *)self home];
    char v5 = objc_msgSend(v4, "hf_hasHomePods");
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)_updateSiriSectionFooterForSection:(id)a3
{
  id v4 = a3;
  char v5 = _HULocalizedStringWithDefaultValue(@"HUSiriSectionFooter_RecognizeMyVoice", @"HUSiriSectionFooter_RecognizeMyVoice", 1);
  id v6 = objc_alloc(MEMORY[0x1E4F69710]);
  uint64_t v7 = [(HFItemManager *)self home];
  uint64_t v8 = [(HUEditUserItemManager *)self userBeingEdited];
  uint64_t v9 = (void *)[v6 initWithHome:v7 user:v8 nameStyle:0];

  if ([v9 isIdentifyVoiceEnabled])
  {
    uint64_t v18 = 0;
    int v19 = &v18;
    uint64_t v20 = 0x3032000000;
    char v21 = __Block_byref_object_copy__3;
    uint64_t v22 = __Block_byref_object_dispose__3;
    _HULocalizedStringWithDefaultValue(@"HUSiriSectionFooter_PersonalRequests_UnknownDevice", @"HUSiriSectionFooter_PersonalRequests_UnknownDevice", 1);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    if ([(HUEditUserItemManager *)self isUserBeingEditedTheDeviceUser])
    {
      id v10 = [(HUEditUserItemManager *)self locationDeviceManager];
      unint64_t v11 = [v10 activeLocationDeviceFuture];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __60__HUEditUserItemManager__updateSiriSectionFooterForSection___block_invoke;
      v14[3] = &unk_1E6386B70;
      v17 = &v18;
      id v15 = v4;
      id v16 = v5;
      id v12 = (id)[v11 addCompletionBlock:v14];

      id v13 = v15;
    }
    else
    {
      id v13 = [NSString stringWithFormat:@"%@ %@", v5, v19[5]];
      [v4 setFooterTitle:v13];
    }

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    [v4 setFooterTitle:v5];
  }
}

void __60__HUEditUserItemManager__updateSiriSectionFooterForSection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3)
  {
    id v4 = [a2 name];
    uint64_t v11 = HULocalizedStringWithFormat(@"HUSiriSectionFooter_PersonalRequests", @"%@", v5, v6, v7, v8, v9, v10, (uint64_t)v4);
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  id v14 = [NSString stringWithFormat:@"%@ %@", *(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  [*(id *)(a1 + 32) setFooterTitle:v14];
}

- (HFItem)homeScheduleItem
{
  return self->_homeScheduleItem;
}

- (void)setHomeScheduleItem:(id)a3
{
}

- (HFItem)localAccessItem
{
  return self->_localAccessItem;
}

- (void)setLocalAccessItem:(id)a3
{
}

- (HFItem)remoteAccessItem
{
  return self->_remoteAccessItem;
}

- (void)setRemoteAccessItem:(id)a3
{
}

- (HFItem)allowEditingItem
{
  return self->_allowEditingItem;
}

- (void)setAllowEditingItem:(id)a3
{
}

- (HFItem)camerasItem
{
  return self->_camerasItem;
}

- (void)setCamerasItem:(id)a3
{
}

- (HFItem)locksItem
{
  return self->_locksItem;
}

- (void)setLocksItem:(id)a3
{
}

- (HFItem)pendingAccessoriesItem
{
  return self->_pendingAccessoriesItem;
}

- (void)setPendingAccessoriesItem:(id)a3
{
}

- (HFItem)personalRequestsItem
{
  return self->_personalRequestsItem;
}

- (void)setPersonalRequestsItem:(id)a3
{
}

- (HFItem)personalRequestsFooterItem
{
  return self->_personalRequestsFooterItem;
}

- (HFItem)tvViewingProfilesItem
{
  return self->_tvViewingProfilesItem;
}

- (void)setTvViewingProfilesItem:(id)a3
{
}

- (HUAccessorySettingsItemModule)userSettingsItemModule
{
  return self->_userSettingsItemModule;
}

- (void)setUserSettingsItemModule:(id)a3
{
}

- (HFItem)updateListeningHistoryItem
{
  return self->_updateListeningHistoryItem;
}

- (void)setUpdateListeningHistoryItem:(id)a3
{
}

- (HUMediaServiceSettingsItemModule)mediaServiceItemModule
{
  return self->_mediaServiceItemModule;
}

- (void)setMediaServiceItemModule:(id)a3
{
}

- (HFTransformItemProvider)allowedAccessoryCategoryItemProvider
{
  return self->_allowedAccessoryCategoryItemProvider;
}

- (void)setAllowedAccessoryCategoryItemProvider:(id)a3
{
}

- (NSArray)supportedMULanguageCodes
{
  return self->_supportedMULanguageCodes;
}

- (void)setSupportedMULanguageCodes:(id)a3
{
}

- (HMHome)homeForUser
{
  return self->_homeForUser;
}

- (void)setHomeForUser:(id)a3
{
}

- (HFItem)removeItem
{
  return self->_removeItem;
}

- (void)setRemoveItem:(id)a3
{
}

- (NSArray)sectionOrderArrayWhenViewingSelf
{
  return self->_sectionOrderArrayWhenViewingSelf;
}

- (void)setSectionOrderArrayWhenViewingSelf:(id)a3
{
}

- (NSArray)sectionOrderArrayWhenViewingOther
{
  return self->_sectionOrderArrayWhenViewingOther;
}

- (void)setSectionOrderArrayWhenViewingOther:(id)a3
{
}

- (HULocationDeviceManager)locationDeviceManager
{
  return self->_locationDeviceManager;
}

- (void)setLocationDeviceManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationDeviceManager, 0);
  objc_storeStrong((id *)&self->_sectionOrderArrayWhenViewingOther, 0);
  objc_storeStrong((id *)&self->_sectionOrderArrayWhenViewingSelf, 0);
  objc_storeStrong((id *)&self->_removeItem, 0);
  objc_storeStrong((id *)&self->_homeForUser, 0);
  objc_storeStrong((id *)&self->_supportedMULanguageCodes, 0);
  objc_storeStrong((id *)&self->_allowedAccessoryCategoryItemProvider, 0);
  objc_storeStrong((id *)&self->_mediaServiceItemModule, 0);
  objc_storeStrong((id *)&self->_updateListeningHistoryItem, 0);
  objc_storeStrong((id *)&self->_userSettingsItemModule, 0);
  objc_storeStrong((id *)&self->_tvViewingProfilesItem, 0);
  objc_storeStrong((id *)&self->_personalRequestsFooterItem, 0);
  objc_storeStrong((id *)&self->_personalRequestsItem, 0);
  objc_storeStrong((id *)&self->_pendingAccessoriesItem, 0);
  objc_storeStrong((id *)&self->_locksItem, 0);
  objc_storeStrong((id *)&self->_camerasItem, 0);
  objc_storeStrong((id *)&self->_allowEditingItem, 0);
  objc_storeStrong((id *)&self->_remoteAccessItem, 0);
  objc_storeStrong((id *)&self->_localAccessItem, 0);

  objc_storeStrong((id *)&self->_homeScheduleItem, 0);
}

@end