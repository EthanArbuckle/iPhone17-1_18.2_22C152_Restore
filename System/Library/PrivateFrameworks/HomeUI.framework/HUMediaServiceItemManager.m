@interface HUMediaServiceItemManager
- (BOOL)_hasAuthFatalError;
- (BOOL)_isAppleMusicService;
- (HFItem)reconnectItem;
- (HFItem)reconnectTitleItem;
- (HFItem)removeItem;
- (HFItem)updateListeningHistoryFooterItem;
- (HFItem)updateListeningHistoryItem;
- (HFUserItem)userItem;
- (HMHome)homeForUser;
- (HUAccessorySettingsItemModule)userSettingsItemModule;
- (HUMediaServiceItem)mediaServiceItem;
- (HUMediaServiceItemManager)initWithDelegate:(id)a3;
- (HUMediaServiceItemManager)initWithHome:(id)a3 mediaServiceItem:(id)a4 delegate:(id)a5;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (void)setHomeForUser:(id)a3;
- (void)setMediaServiceItem:(id)a3;
- (void)setReconnectItem:(id)a3;
- (void)setReconnectTitleItem:(id)a3;
- (void)setRemoveItem:(id)a3;
- (void)setUpdateListeningHistoryFooterItem:(id)a3;
- (void)setUpdateListeningHistoryItem:(id)a3;
- (void)setUserItem:(id)a3;
- (void)setUserSettingsItemModule:(id)a3;
@end

@implementation HUMediaServiceItemManager

- (HUMediaServiceItemManager)initWithHome:(id)a3 mediaServiceItem:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUMediaServiceItemManager;
  v10 = [(HFItemManager *)&v16 initWithDelegate:a5];
  v11 = v10;
  if (v10)
  {
    [(HUMediaServiceItemManager *)v10 setHomeForUser:v8];
    [(HUMediaServiceItemManager *)v11 setMediaServiceItem:v9];
    id v12 = objc_alloc(MEMORY[0x1E4F69710]);
    v13 = [v8 currentUser];
    v14 = (void *)[v12 initWithHome:v8 user:v13 nameStyle:0];
    [(HUMediaServiceItemManager *)v11 setUserItem:v14];
  }
  return v11;
}

- (HUMediaServiceItemManager)initWithDelegate:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithHome_mediaServiceItem_delegate_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUMediaServiceItemManager.m", 56, @"%s is unavailable; use %@ instead",
    "-[HUMediaServiceItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v72[1] = *MEMORY[0x1E4F143B8];
  v5 = [(HUMediaServiceItemManager *)self userItem];
  v6 = [v5 user];
  v7 = [(HUMediaServiceItemManager *)self homeForUser];
  id v8 = [v7 currentUser];
  int v9 = [v6 isEqual:v8];

  if (v9)
  {
    v10 = [(HUMediaServiceItemManager *)self userItem];
    int v11 = [v10 hasValidSettings];

    if (v11)
    {
      id v12 = [HUAccessorySettingsItemModule alloc];
      v13 = [(HUMediaServiceItemManager *)self userItem];
      uint64_t v71 = *MEMORY[0x1E4F68D90];
      v72[0] = MEMORY[0x1E4F1CC38];
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:&v71 count:1];
      v15 = [(HUAccessorySettingsItemModule *)v12 initWithItemUpdater:self homeKitSettingsVendor:v13 usageOptions:v14];
      [(HUMediaServiceItemManager *)self setUserSettingsItemModule:v15];
    }
    else
    {
      v13 = HFLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BE345000, v13, OS_LOG_TYPE_ERROR, "CAN'T ACCESS USER BASED SETTINGS: The user's settings can't be accessed because hasValidSettings == NO", buf, 2u);
      }
    }
  }
  else
  {
    v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_super v16 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v68 = self;
      __int16 v69 = 2112;
      v70 = v16;
      _os_log_debug_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEBUG, "%@:%@  Not Displaying HMSettings based controls because current user is not permitted", buf, 0x16u);
    }
  }

  id v17 = objc_alloc(MEMORY[0x1E4F695C0]);
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __56__HUMediaServiceItemManager__buildItemProvidersForHome___block_invoke;
  v63[3] = &unk_1E6385000;
  v63[4] = self;
  v18 = (void *)[v17 initWithResultsBlock:v63];
  [(HUMediaServiceItemManager *)self setUpdateListeningHistoryItem:v18];

  id v19 = objc_alloc(MEMORY[0x1E4F695C0]);
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __56__HUMediaServiceItemManager__buildItemProvidersForHome___block_invoke_32;
  v62[3] = &unk_1E6385000;
  v62[4] = self;
  v20 = (void *)[v19 initWithResultsBlock:v62];
  [(HUMediaServiceItemManager *)self setUpdateListeningHistoryFooterItem:v20];

  LOBYTE(v20) = [(HUMediaServiceItemManager *)self _isAppleMusicService];
  id v21 = objc_alloc(MEMORY[0x1E4F695C0]);
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __56__HUMediaServiceItemManager__buildItemProvidersForHome___block_invoke_42;
  v60[3] = &unk_1E6386518;
  char v61 = (char)v20;
  v60[4] = self;
  v22 = (void *)[v21 initWithResultsBlock:v60];
  [(HUMediaServiceItemManager *)self setRemoveItem:v22];

  uint64_t v23 = [(HUMediaServiceItemManager *)self _hasAuthFatalError] ^ 1;
  id v24 = objc_alloc(MEMORY[0x1E4F695C0]);
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __56__HUMediaServiceItemManager__buildItemProvidersForHome___block_invoke_2;
  v58[3] = &unk_1E6386518;
  char v59 = v23;
  v58[4] = self;
  v25 = (void *)[v24 initWithResultsBlock:v58];
  [(HUMediaServiceItemManager *)self setReconnectItem:v25];

  v26 = [(HUMediaServiceItemManager *)self mediaServiceItem];
  v27 = [v26 mediaService];
  v28 = [v27 serviceName];

  id v29 = objc_alloc(MEMORY[0x1E4F695C0]);
  v65[0] = *MEMORY[0x1E4F68AB8];
  v36 = HULocalizedStringWithFormat(@"HUMediaServiceReconnectServiceHeader", @"%@%@", v30, v31, v32, v33, v34, v35, (uint64_t)v28);
  v66[0] = v36;
  v65[1] = *MEMORY[0x1E4F68B10];
  v37 = [NSNumber numberWithBool:v23];
  v66[1] = v37;
  v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:2];
  v39 = (void *)[v29 initWithResults:v38];
  [(HUMediaServiceItemManager *)self setReconnectTitleItem:v39];

  id v40 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v41 = [(HUMediaServiceItemManager *)self mediaServiceItem];
  v64[0] = v41;
  v42 = [(HUMediaServiceItemManager *)self updateListeningHistoryItem];
  v64[1] = v42;
  v43 = [(HUMediaServiceItemManager *)self updateListeningHistoryFooterItem];
  v64[2] = v43;
  v44 = [(HUMediaServiceItemManager *)self removeItem];
  v64[3] = v44;
  v45 = [(HUMediaServiceItemManager *)self reconnectItem];
  v64[4] = v45;
  v46 = [(HUMediaServiceItemManager *)self reconnectTitleItem];
  v64[5] = v46;
  v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:6];
  v48 = (void *)[v40 initWithArray:v47];

  if ([(HUMediaServiceItemManager *)self _isAppleMusicService])
  {
    v49 = [(HUMediaServiceItemManager *)self updateListeningHistoryItem];
    [v48 removeObject:v49];

    v50 = [(HUMediaServiceItemManager *)self updateListeningHistoryFooterItem];
    [v48 removeObject:v50];
  }
  v51 = (void *)MEMORY[0x1E4F1CA80];
  v52 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v48];
  v53 = [v51 setWithObject:v52];

  if ([(HUMediaServiceItemManager *)self _isAppleMusicService])
  {
    v54 = [(HUMediaServiceItemManager *)self userSettingsItemModule];
    v55 = [v54 itemProviders];
    [v53 unionSet:v55];
  }
  v56 = [v53 allObjects];

  return v56;
}

id __56__HUMediaServiceItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) mediaServiceItem];
  v2 = [v1 mediaService];
  int v3 = [v2 updateListeningHistoryEnabled];

  v4 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v5 = *MEMORY[0x1E4F68B10];
  v15[0] = &unk_1F19B4490;
  uint64_t v6 = *MEMORY[0x1E4F68AB8];
  v14[0] = v5;
  v14[1] = v6;
  v7 = _HULocalizedStringWithDefaultValue(@"HUMediaServiceListeningHistoryTitle", @"HUMediaServiceListeningHistoryTitle", 1);
  v15[1] = v7;
  v14[2] = *MEMORY[0x1E4F68BC0];
  if (v3) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  int v9 = [NSNumber numberWithInteger:v8];
  v15[2] = v9;
  v14[3] = *MEMORY[0x1E4F68A08];
  v10 = [NSNumber numberWithBool:0];
  v15[3] = v10;
  int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  id v12 = [v4 futureWithResult:v11];

  return v12;
}

id __56__HUMediaServiceItemManager__buildItemProvidersForHome___block_invoke_32(uint64_t a1)
{
  v18[3] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v2 = *MEMORY[0x1E4F68B10];
  v18[0] = &unk_1F19B4490;
  uint64_t v3 = *MEMORY[0x1E4F68980];
  v17[0] = v2;
  v17[1] = v3;
  v4 = [*(id *)(a1 + 32) mediaServiceItem];
  uint64_t v5 = [v4 mediaService];
  uint64_t v6 = [v5 serviceName];
  v13 = HULocalizedStringWithFormat(@"HUMediaServiceListeningHistoryFooter", @"%@", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  v17[2] = @"instructionsStyle";
  v18[1] = v13;
  v18[2] = &unk_1F19B44A8;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
  v15 = [v1 futureWithResult:v14];

  return v15;
}

id __56__HUMediaServiceItemManager__buildItemProvidersForHome___block_invoke_42(uint64_t a1)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F7A0D8];
  v17[0] = *MEMORY[0x1E4F68B10];
  uint64_t v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E4F68AB8];
  v4 = [*(id *)(a1 + 32) mediaServiceItem];
  uint64_t v5 = [v4 mediaService];
  uint64_t v6 = [v5 serviceName];
  v13 = HULocalizedStringWithFormat(@"HUMediaServiceRemoveServiceTitle", @"%@", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  v18[1] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v15 = [v2 futureWithResult:v14];

  return v15;
}

id __56__HUMediaServiceItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F7A0D8];
  v17[0] = *MEMORY[0x1E4F68B10];
  uint64_t v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E4F68AB8];
  v4 = [*(id *)(a1 + 32) mediaServiceItem];
  uint64_t v5 = [v4 mediaService];
  uint64_t v6 = [v5 serviceName];
  v13 = HULocalizedStringWithFormat(@"HUMediaServiceReconnectServiceTitle", @"%@", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  v18[1] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v15 = [v2 futureWithResult:v14];

  return v15;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v142[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v115 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v118 = [(HUMediaServiceItemManager *)self mediaServiceItem];
  v140[0] = v118;
  uint64_t v6 = [(HUMediaServiceItemManager *)self updateListeningHistoryItem];
  v140[1] = v6;
  uint64_t v7 = [(HUMediaServiceItemManager *)self updateListeningHistoryFooterItem];
  v140[2] = v7;
  uint64_t v8 = [(HUMediaServiceItemManager *)self removeItem];
  v140[3] = v8;
  uint64_t v9 = [(HUMediaServiceItemManager *)self reconnectItem];
  v140[4] = v9;
  uint64_t v10 = [(HUMediaServiceItemManager *)self reconnectTitleItem];
  v140[5] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v140 count:6];
  uint64_t v12 = (void *)[v5 initWithArray:v11];
  int v13 = [v4 intersectsSet:v12];

  v14 = v115;
  if (v13)
  {
    BOOL v15 = [(HUMediaServiceItemManager *)self _hasAuthFatalError];
    objc_super v16 = [(HUMediaServiceItemManager *)self mediaServiceItem];
    int v17 = [v4 containsObject:v16];
    int v18 = !v15;

    if (v17 && v18)
    {
      id v19 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUMediaServiceAccountInfoSectionIdentifier"];
      v20 = (void *)MEMORY[0x1E4F1C978];
      id v21 = [(HUMediaServiceItemManager *)self mediaServiceItem];
      v22 = [v20 arrayWithObject:v21];
      [v19 setItems:v22];

      [v115 addObject:v19];
    }
    uint64_t v23 = [(HUMediaServiceItemManager *)self updateListeningHistoryItem];
    int v24 = [v4 containsObject:v23] & v18;

    if (v24 == 1)
    {
      v25 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUMediaServiceUpdateListeningHistorySectionIdentifier"];
      v26 = (void *)MEMORY[0x1E4F1C978];
      v27 = [(HUMediaServiceItemManager *)self updateListeningHistoryItem];
      v28 = [v26 arrayWithObject:v27];
      [v25 setItems:v28];

      [v115 addObject:v25];
    }
    id v29 = [(HUMediaServiceItemManager *)self updateListeningHistoryFooterItem];
    int v30 = [v4 containsObject:v29] & v18;

    if (v30 == 1)
    {
      uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUMediaServiceUpdateListeningHistoryFooterSectionIdentifier"];
      uint64_t v32 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v33 = [(HUMediaServiceItemManager *)self updateListeningHistoryFooterItem];
      uint64_t v34 = [v32 arrayWithObject:v33];
      [v31 setItems:v34];

      [v115 addObject:v31];
    }
    uint64_t v35 = [(HUMediaServiceItemManager *)self removeItem];
    int v36 = [v4 containsObject:v35];

    if (v36)
    {
      if (v15)
      {
        v37 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUMediaServiceReconnectServiceTitleSectionIdentifier"];
        v38 = [(HUMediaServiceItemManager *)self reconnectTitleItem];
        v139 = v38;
        v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v139 count:1];
        [v37 setItems:v39];

        [v115 addObject:v37];
      }
      id v40 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUMediaServiceRemoveServiceSectionIdentifier"];
      v41 = objc_opt_new();
      if (v15)
      {
        v42 = [(HUMediaServiceItemManager *)self reconnectItem];
        [v41 addObject:v42];
      }
      v43 = [(HUMediaServiceItemManager *)self removeItem];
      [v41 addObject:v43];

      [v40 setItems:v41];
      [v115 addObject:v40];
    }
  }
  if ([(HUMediaServiceItemManager *)self _isAppleMusicService])
  {
    v114 = self;
    v44 = [(HUMediaServiceItemManager *)self userSettingsItemModule];
    id v113 = v4;
    v45 = [v44 buildSectionsWithDisplayedItems:v4];

    v117 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"allowiTunesAccountSection"];
    long long v129 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    id v46 = v45;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v129 objects:v138 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v130;
      uint64_t v119 = *MEMORY[0x1E4F68BC0];
      do
      {
        for (uint64_t i = 0; i != v48; ++i)
        {
          if (*(void *)v130 != v49) {
            objc_enumerationMutation(v46);
          }
          v51 = *(void **)(*((void *)&v129 + 1) + 8 * i);
          v52 = [v51 headerTitle];
          v53 = HFLocalizedString();
          int v54 = [v52 isEqualToString:v53];

          if (v54)
          {
            v55 = [v51 items];
            v56 = objc_msgSend(v55, "na_firstObjectPassingTest:", &__block_literal_global_103);

            if (v56)
            {
              v137 = v56;
              v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v137 count:1];
              [v117 setItems:v57];

              v58 = [v56 latestResults];
              char v59 = [v58 objectForKeyedSubscript:v119];
              uint64_t v60 = [v59 integerValue];

              if (v60 == 2) {
                char v61 = @"HUUserSettingsAllowiTunesAccountEnabled_Footer";
              }
              else {
                char v61 = @"HUUserSettingsAllowiTunesAccountDisabled_Footer";
              }
              v62 = _HULocalizedStringWithDefaultValue(v61, v61, 1);
              [v117 setFooterTitle:v62];
            }
          }
        }
        uint64_t v48 = [v46 countByEnumeratingWithState:&v129 objects:v138 count:16];
      }
      while (v48);
    }

    v120 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"losslessSection"];
    long long v125 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    id v63 = v46;
    uint64_t v64 = [v63 countByEnumeratingWithState:&v125 objects:v136 count:16];
    if (v64)
    {
      uint64_t v65 = v64;
      uint64_t v66 = *(void *)v126;
      do
      {
        for (uint64_t j = 0; j != v65; ++j)
        {
          if (*(void *)v126 != v66) {
            objc_enumerationMutation(v63);
          }
          v68 = *(void **)(*((void *)&v125 + 1) + 8 * j);
          __int16 v69 = [v68 headerTitle];
          v70 = HFLocalizedString();
          int v71 = [v69 isEqualToString:v70];

          if (v71)
          {
            v72 = [v68 items];
            v73 = objc_msgSend(v72, "na_firstObjectPassingTest:", &__block_literal_global_79);

            if (v73)
            {
              v135 = v73;
              v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v135 count:1];
              [v120 setItems:v74];
            }
          }
        }
        uint64_t v65 = [v63 countByEnumeratingWithState:&v125 objects:v136 count:16];
      }
      while (v65);
    }

    v75 = HFLocalizedString();
    v76 = HFLocalizedString();
    id v77 = objc_alloc(MEMORY[0x1E4F28E48]);
    v78 = [v75 stringByAppendingString:@"\n"];
    v79 = (void *)[v77 initWithString:v78];

    id v80 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v141 = *MEMORY[0x1E4F42530];
    v81 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_losslessURL");
    v142[0] = v81;
    v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v142 forKeys:&v141 count:1];
    v83 = (void *)[v80 initWithString:v76 attributes:v82];
    [v79 appendAttributedString:v83];

    [v120 setAttributedFooterTitle:v79];
    v116 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"dolbyAtmosSection"];
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    id v84 = v63;
    uint64_t v85 = [v84 countByEnumeratingWithState:&v121 objects:v134 count:16];
    if (v85)
    {
      uint64_t v86 = v85;
      uint64_t v87 = *(void *)v122;
      do
      {
        for (uint64_t k = 0; k != v86; ++k)
        {
          if (*(void *)v122 != v87) {
            objc_enumerationMutation(v84);
          }
          v89 = *(void **)(*((void *)&v121 + 1) + 8 * k);
          v90 = [v89 headerTitle];
          v91 = HFLocalizedString();
          int v92 = [v90 isEqualToString:v91];

          if (v92)
          {
            v93 = [v89 items];
            v94 = objc_msgSend(v93, "na_firstObjectPassingTest:", &__block_literal_global_99);

            if (v94)
            {
              v133 = v94;
              v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v133 count:1];
              [v116 setItems:v95];
            }
          }
        }
        uint64_t v86 = [v84 countByEnumeratingWithState:&v121 objects:v134 count:16];
      }
      while (v86);
    }

    v96 = HFLocalizedString();
    [v116 setFooterTitle:v96];

    id v97 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v98 = objc_msgSend(v84, "na_filter:", &__block_literal_global_122_1);
    v99 = objc_msgSend(v98, "na_map:", &__block_literal_global_105_1);
    v100 = (void *)[v97 initWithArray:v99];

    if (v117)
    {
      v101 = [v117 items];
      uint64_t v102 = [v101 count];

      if (v102) {
        [v100 insertObject:v117 atIndex:0];
      }
    }
    v103 = [(HUMediaServiceItemManager *)v114 homeForUser];
    id v4 = v113;
    if (objc_msgSend(v103, "hf_currentUserIsOwner"))
    {
      v104 = [(HUMediaServiceItemManager *)v114 homeForUser];
      if (objc_msgSend(v104, "hf_hasAtleastOneOasisEnabledHomePod") && v120)
      {
        v105 = [v120 items];
        uint64_t v106 = [v105 count];

        v14 = v115;
        if (v106) {
          [v100 addObject:v120];
        }
LABEL_62:
        v107 = [(HUMediaServiceItemManager *)v114 homeForUser];
        if (objc_msgSend(v107, "hf_currentUserIsOwner"))
        {
          v108 = [(HUMediaServiceItemManager *)v114 homeForUser];
          if (objc_msgSend(v108, "hf_hasAtleastOneOasisEnabledHomePod") && v116)
          {
            v109 = [v116 items];
            uint64_t v110 = [v109 count];

            if (v110) {
              [v100 addObject:v116];
            }
            goto LABEL_69;
          }
        }
LABEL_69:
        v111 = [v100 sortedArrayUsingComparator:&__block_literal_global_125_1];
        [v14 addObjectsFromArray:v111];

        goto LABEL_70;
      }
    }
    v14 = v115;
    goto LABEL_62;
  }
LABEL_70:

  return v14;
}

uint64_t __62__HUMediaServiceItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
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

  if (v5)
  {
    uint64_t v6 = [v5 settingKeyPath];
    uint64_t v7 = [v6 isEqualToString:*MEMORY[0x1E4F68540]];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __62__HUMediaServiceItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
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

  if (v5)
  {
    uint64_t v6 = [v5 settingKeyPath];
    uint64_t v7 = [v6 isEqualToString:*MEMORY[0x1E4F68588]];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __62__HUMediaServiceItemManager__buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2)
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

  if (v5)
  {
    uint64_t v6 = [v5 settingKeyPath];
    uint64_t v7 = [v6 isEqualToString:*MEMORY[0x1E4F68558]];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id __62__HUMediaServiceItemManager__buildSectionsWithDisplayedItems___block_invoke_5(uint64_t a1, void *a2)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 headerTitle];
  id v4 = HFLocalizedString();
  int v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F692E8]);
    uint64_t v7 = [v2 identifier];
    uint64_t v8 = (void *)[v6 initWithIdentifier:v7];

    uint64_t v9 = [v2 items];
    uint64_t v10 = objc_msgSend(v9, "na_filter:", &__block_literal_global_107_0);
    [v8 setItems:v10];

    uint64_t v11 = HFLocalizedString();
    uint64_t v12 = HFLocalizedString();
    id v13 = objc_alloc(MEMORY[0x1E4F28E48]);
    v14 = [v11 stringByAppendingString:@" "];
    BOOL v15 = (void *)[v13 initWithString:v14];

    id v16 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v24 = *MEMORY[0x1E4F42530];
    int v17 = [MEMORY[0x1E4F696F8] musicPrivacyURL];
    v25[0] = v17;
    int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    id v19 = (void *)[v16 initWithString:v12 attributes:v18];
    [v15 appendAttributedString:v19];

    v20 = [v8 items];
    if ([v20 count]) {
      id v21 = v8;
    }
    else {
      id v21 = 0;
    }
    id v22 = v21;
  }
  else
  {
    id v22 = v2;
  }

  return v22;
}

uint64_t __62__HUMediaServiceItemManager__buildSectionsWithDisplayedItems___block_invoke_6(uint64_t a1, void *a2)
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

  if (v5)
  {
    id v6 = [v5 settingKeyPath];
    int v7 = [v6 isEqualToString:*MEMORY[0x1E4F68550]];

    uint64_t v8 = [v5 settingKeyPath];
    int v9 = [v8 isEqualToString:*MEMORY[0x1E4F68538]];

    uint64_t v10 = [v5 settingKeyPath];
    int v11 = [v10 isEqualToString:*MEMORY[0x1E4F68540]];

    unsigned int v12 = (v9 | v11 | v7) ^ 1;
  }
  else
  {
    unsigned int v12 = 1;
  }
  id v13 = [v5 settingKeyPath];
  if ([v13 isEqualToString:*MEMORY[0x1E4F68588]])
  {
  }
  else
  {
    v14 = [v5 settingKeyPath];
    int v15 = [v14 isEqualToString:*MEMORY[0x1E4F68558]];

    unsigned int v16 = v12;
    if (!v15) {
      goto LABEL_11;
    }
  }
  unsigned int v16 = 0;
LABEL_11:
  if (v5) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = v12;
  }

  return v17;
}

uint64_t __62__HUMediaServiceItemManager__buildSectionsWithDisplayedItems___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = [a2 headerTitle];
  id v3 = HFLocalizedString();
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

uint64_t __62__HUMediaServiceItemManager__buildSectionsWithDisplayedItems___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"HUAccessorySettingsItemModuleSortKey"];
  int v7 = [v4 userInfo];

  uint64_t v8 = [v7 objectForKeyedSubscript:@"HUAccessorySettingsItemModuleSortKey"];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (BOOL)_isAppleMusicService
{
  id v2 = [(HUMediaServiceItemManager *)self mediaServiceItem];
  id v3 = [v2 mediaService];
  char v4 = [v3 isServiceRemovable] ^ 1;

  return v4;
}

- (BOOL)_hasAuthFatalError
{
  id v2 = [(HUMediaServiceItemManager *)self mediaServiceItem];
  id v3 = [v2 mediaService];
  char v4 = [v3 authFatalError];

  return v4;
}

- (HFItem)updateListeningHistoryItem
{
  return self->_updateListeningHistoryItem;
}

- (void)setUpdateListeningHistoryItem:(id)a3
{
}

- (HFItem)updateListeningHistoryFooterItem
{
  return self->_updateListeningHistoryFooterItem;
}

- (void)setUpdateListeningHistoryFooterItem:(id)a3
{
}

- (HFItem)removeItem
{
  return self->_removeItem;
}

- (void)setRemoveItem:(id)a3
{
}

- (HFItem)reconnectItem
{
  return self->_reconnectItem;
}

- (void)setReconnectItem:(id)a3
{
}

- (HFItem)reconnectTitleItem
{
  return self->_reconnectTitleItem;
}

- (void)setReconnectTitleItem:(id)a3
{
}

- (HUMediaServiceItem)mediaServiceItem
{
  return self->_mediaServiceItem;
}

- (void)setMediaServiceItem:(id)a3
{
}

- (HFUserItem)userItem
{
  return self->_userItem;
}

- (void)setUserItem:(id)a3
{
}

- (HUAccessorySettingsItemModule)userSettingsItemModule
{
  return self->_userSettingsItemModule;
}

- (void)setUserSettingsItemModule:(id)a3
{
}

- (HMHome)homeForUser
{
  return self->_homeForUser;
}

- (void)setHomeForUser:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeForUser, 0);
  objc_storeStrong((id *)&self->_userSettingsItemModule, 0);
  objc_storeStrong((id *)&self->_userItem, 0);
  objc_storeStrong((id *)&self->_mediaServiceItem, 0);
  objc_storeStrong((id *)&self->_reconnectTitleItem, 0);
  objc_storeStrong((id *)&self->_reconnectItem, 0);
  objc_storeStrong((id *)&self->_removeItem, 0);
  objc_storeStrong((id *)&self->_updateListeningHistoryFooterItem, 0);

  objc_storeStrong((id *)&self->_updateListeningHistoryItem, 0);
}

@end