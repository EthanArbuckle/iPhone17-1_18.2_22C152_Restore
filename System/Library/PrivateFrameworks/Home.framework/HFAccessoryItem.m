@interface HFAccessoryItem
+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4;
- (BOOL)actionsMayRequireDeviceUnlock;
- (BOOL)containsActions;
- (BOOL)isAnnounceEnabled;
- (BOOL)isAudioAnalysisEnabled;
- (BOOL)isCompoundItem;
- (BOOL)isContainedWithinItemGroup;
- (BOOL)isDoorbellChimeEnabled;
- (BOOL)isItemGroup;
- (BOOL)isMultiLightDevice;
- (BOOL)isMultiSensorDevice;
- (BOOL)isSiriDisabled;
- (BOOL)isSiriEndpointAccessory;
- (BOOL)shouldShowMutedMicIcon;
- (HFAccessoryItem)init;
- (HFAccessoryItem)initWithAccessory:(id)a3 valueSource:(id)a4;
- (HFCharacteristicValueSource)valueSource;
- (HFHomeKitObject)primaryHomeKitObject;
- (HFMediaAccessoryCommonSettingsManager)commonSettingsManager;
- (HMAccessory)accessory;
- (HMHome)home;
- (NSArray)allHomeKitObjects;
- (NSSet)serviceItems;
- (NSSet)services;
- (NSString)description;
- (id)_buildControlDescription;
- (id)_buildControlItems;
- (id)_buildServiceItems;
- (id)_buildTileDescription:(BOOL)a3 title:(id)a4;
- (id)_collectAllChildItems;
- (id)_mostCommonValueForResultsKey:(id)a3 inServiceItems:(id)a4;
- (id)_mostCommonValueInServiceItems:(id)a3 valueProvider:(id)a4;
- (id)_repeatingDescriptionsToCoalesce;
- (id)_sortDescriptorsForServiceItems;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)_unanimousValueForResultsKey:(id)a3 inServiceItems:(id)a4;
- (id)accessories;
- (id)controlItemsForService:(id)a3;
- (id)copyWithValueSource:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentStateActionBuildersForHome:(id)a3;
- (id)enableDoorbellChime:(BOOL)a3;
- (id)namingComponentForHomeKitObject;
- (id)serviceItemForService:(id)a3;
- (id)serviceLikeBuilderInHome:(id)a3;
- (id)setEnableAnnounce:(BOOL)a3;
- (id)setEnableAudioAnalysis:(BOOL)a3;
- (id)setSiriDisabled:(BOOL)a3;
- (unint64_t)numberOfCompoundItems;
- (unint64_t)numberOfItemsContainedWithinGroup;
- (void)setServiceItems:(id)a3;
@end

@implementation HFAccessoryItem

- (HFAccessoryItem)initWithAccessory:(id)a3 valueSource:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HFAccessoryItem;
  v9 = [(HFAccessoryItem *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessory, a3);
    objc_storeStrong((id *)&v10->_valueSource, a4);
    v11 = HFLogForCategory(0x3DuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      BOOL v13 = [(HFAccessoryItem *)v10 isSiriEndpointAccessory];
      v14 = [(HFAccessoryItem *)v10 accessories];
      v15 = [v14 anyObject];
      v16 = [v15 mediaProfile];
      v17 = objc_msgSend(v16, "hf_siriLanguageOptionsManager");
      *(_DWORD *)buf = 67109378;
      BOOL v20 = v13;
      __int16 v21 = 2112;
      v22 = v17;
      _os_log_debug_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEBUG, "isSiriEndPoint %{BOOL}d siriLanguageOptionsManager = %@", buf, 0x12u);
    }
  }

  return v10;
}

- (HFAccessoryItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"HFAccessoryItem.m" lineNumber:59 description:@"Use -initWithAccessory:valueSource:"];

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(HFAccessoryItem *)self valueSource];
  id v5 = [(HFAccessoryItem *)self copyWithValueSource:v4];

  return v5;
}

- (id)copyWithValueSource:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(HFAccessoryItem *)self accessory];
  id v7 = (void *)[v5 initWithAccessory:v6 valueSource:v4];

  [v7 copyLatestResultsFromItem:self];
  return v7;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(HFAccessoryItem *)self accessory];
  id v7 = objc_msgSend(v6, "hf_prettyDescription");
  id v8 = [(HFItem *)self latestResults];
  v9 = [v3 stringWithFormat:@"<%@: %p, %@ %@>", v5, self, v7, v8];

  return (NSString *)v9;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [(HFAccessoryItem *)self _buildServiceItems];
  [(HFAccessoryItem *)self setServiceItems:v6];
  id v7 = [MEMORY[0x263EFF980] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v13 = [*(id *)(*((void *)&v30 + 1) + 8 * i) updateWithOptions:v5];
        objc_msgSend(v7, "na_safeAddObject:", v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v10);
  }

  v14 = [HFServiceLikeItemUpdateRequest alloc];
  v15 = [(HFAccessoryItem *)self accessory];
  v16 = [(HFAccessoryItem *)self valueSource];
  v17 = [MEMORY[0x263EFFA08] set];
  objc_super v18 = [(HFServiceLikeItemUpdateRequest *)v14 initWithAccessory:v15 valueSource:v16 characteristics:v17];

  if (v18)
  {
    v19 = [(HFServiceLikeItemUpdateRequest *)v18 updateWithOptions:v5];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __47__HFAccessoryItem__subclass_updateWithOptions___block_invoke;
    v26[3] = &unk_264093478;
    id v27 = v7;
    v28 = self;
    id v29 = v8;
    BOOL v20 = [v19 flatMap:v26];
  }
  else
  {
    __int16 v21 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v24 = NSStringFromSelector(a2);
      v25 = [(HFAccessoryItem *)self accessory];
      *(_DWORD *)buf = 138412802;
      v35 = self;
      __int16 v36 = 2112;
      v37 = v24;
      __int16 v38 = 2112;
      v39 = v25;
      _os_log_error_impl(&dword_20B986000, v21, OS_LOG_TYPE_ERROR, "%@:%@ Failed to create HFServiceLikeItemUpdateRequest. Accessory: %@ ", buf, 0x20u);
    }
    v22 = (void *)MEMORY[0x263F58190];
    v19 = +[HFItemUpdateOutcome outcomeWithResults:MEMORY[0x263EFFA78]];
    BOOL v20 = [v22 futureWithResult:v19];
  }

  return v20;
}

id __47__HFAccessoryItem__subclass_updateWithOptions___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F58190];
  uint64_t v5 = a1[4];
  v6 = [MEMORY[0x263F581B8] mainThreadScheduler];
  id v7 = [v4 combineAllFutures:v5 ignoringErrors:1 scheduler:v6];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__HFAccessoryItem__subclass_updateWithOptions___block_invoke_2;
  v13[3] = &unk_264093450;
  uint64_t v8 = a1[5];
  uint64_t v9 = (void *)a1[6];
  id v14 = v3;
  uint64_t v15 = v8;
  id v16 = v9;
  id v10 = v3;
  uint64_t v11 = [v7 flatMap:v13];

  return v11;
}

id __47__HFAccessoryItem__subclass_updateWithOptions___block_invoke_2(id *a1, void *a2)
{
  uint64_t v158 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [a1[4] standardResults];
  uint64_t v5 = (void *)[v4 mutableCopy];

  v6 = [a1[5] accessory];
  id v7 = objc_msgSend(v6, "hf_serviceNameComponents");

  if (v7)
  {
    [v5 setObject:v7 forKeyedSubscript:@"serviceNameComponents"];
    uint64_t v8 = [v7 composedString];
    if (v8) {
      [v5 setObject:v8 forKeyedSubscript:@"title"];
    }
  }
  uint64_t v9 = [MEMORY[0x263EFF9C0] set];
  id v10 = [v5 objectForKeyedSubscript:@"dependentHomeKitObjects"];
  v135 = v9;
  [v9 unionSet:v10];

  long long v152 = 0u;
  long long v153 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  v130 = a1;
  id v11 = a1[6];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v150 objects:v157 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v151;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v151 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [*(id *)(*((void *)&v150 + 1) + 8 * i) latestResults];
        v17 = [v16 objectForKeyedSubscript:@"dependentHomeKitObjects"];

        if (v17) {
          [v135 unionSet:v17];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v150 objects:v157 count:16];
    }
    while (v13);
  }

  objc_super v18 = v130;
  if ([v130[5] isSiriEndpointAccessory])
  {
    v19 = [v130[5] accessories];
    BOOL v20 = [v19 anyObject];
    __int16 v21 = objc_msgSend(v20, "hf_siriEndpointProfile");
    objc_msgSend(v135, "na_safeAddObject:", v21);
  }
  [v5 setObject:v135 forKeyedSubscript:@"dependentHomeKitObjects"];
  v128 = [v130[5] _unanimousValueForResultsKey:@"hidden" inServiceItems:v130[6]];
  LODWORD(v22) = [v128 BOOLValue];
  if ([v130[6] count]) {
    uint64_t v22 = v22;
  }
  else {
    uint64_t v22 = 1;
  }
  uint64_t v23 = [NSNumber numberWithBool:v22];
  [v5 setObject:v23 forKeyedSubscript:@"hidden"];

  v24 = [v130[5] accessory];
  v25 = [v24 uniqueIdentifier];
  v26 = +[HFURLComponents homeKitObjectURLForDestination:4 secondaryDestination:1 UUID:v25];
  [v5 setObject:v26 forKeyedSubscript:@"itemDetailsURL"];

  if ((v22 & 1) == 0)
  {
    id v27 = v130[5];
    v28 = [v27 accessory];
    id v29 = objc_msgSend(v28, "hf_primaryService");
    long long v30 = [v27 serviceItemForService:v29];

    v129 = v30;
    long long v31 = [v30 latestResults];
    long long v32 = [v31 objectForKeyedSubscript:@"state"];
    uint64_t v33 = [v32 integerValue];

    id v127 = v3;
    if ([v130[5] isMultiSensorDevice])
    {
      uint64_t v33 = 1;
    }
    else if ([v130[5] isMultiLightDevice])
    {
      v34 = [v130[5] serviceItems];
      int v35 = objc_msgSend(v34, "na_any:", &__block_literal_global_71);

      if (v35) {
        uint64_t v33 = 2;
      }
      else {
        uint64_t v33 = 1;
      }
    }
    __int16 v36 = [NSNumber numberWithInteger:v33];
    [v5 setObject:v36 forKeyedSubscript:@"state"];

    v37 = NSNumber;
    __int16 v38 = [v130[5] accessory];
    v39 = objc_msgSend(v37, "numberWithUnsignedInteger:", objc_msgSend(v38, "suspendedState"));
    [v5 setObject:v39 forKeyedSubscript:@"suspendedState"];

    v40 = [v129 latestResults];
    uint64_t v41 = [v40 objectForKeyedSubscript:@"icon"];

    v42 = [v130[5] accessory];
    LODWORD(v38) = objc_msgSend(v42, "hf_isMultiServiceAccessory");

    if (v38)
    {
      if ([v130[5] isMultiLightDevice])
      {
        v43 = [v129 latestResults];
        v44 = [v43 objectForKeyedSubscript:@"state"];
        uint64_t v45 = [v44 integerValue];

        if (v45 != v33)
        {
          v46 = [v130[5] serviceItems];
          v149[0] = MEMORY[0x263EF8330];
          v149[1] = 3221225472;
          v149[2] = __47__HFAccessoryItem__subclass_updateWithOptions___block_invoke_4;
          v149[3] = &__block_descriptor_40_e23_B16__0__HFServiceItem_8l;
          v149[4] = v33;
          v47 = objc_msgSend(v46, "na_firstObjectPassingTest:", v149);

          if (v47)
          {
            v48 = [v47 latestResults];
            uint64_t v49 = [v48 objectForKeyedSubscript:@"icon"];

            uint64_t v41 = (void *)v49;
          }
        }
      }
      v50 = [v130[5] accessory];
      uint64_t v51 = +[HFServiceIconFactory overrideIconDescriptorForMultiServiceAccessory:v50 iconDescriptor:v41];

      v52 = (void *)v51;
    }
    else
    {
      v52 = v41;
    }
    v125 = v52;
    v126 = v7;
    objc_msgSend(v5, "setObject:forKeyedSubscript:");
    v53 = [v130[5] _buildControlDescription];
    [v5 setObject:v53 forKeyedSubscript:@"controlDescription"];

    v54 = [v129 latestResults];
    v55 = [v54 objectForKeyedSubscript:@"persistentWarningDescription"];
    [v5 setObject:v55 forKeyedSubscript:@"persistentWarningDescription"];

    v56 = [v129 latestResults];
    v57 = [v56 objectForKeyedSubscript:@"roomIdentifier"];
    v58 = v5;
    [v5 setObject:v57 forKeyedSubscript:@"roomIdentifier"];

    v134 = [MEMORY[0x263EFF910] distantFuture];
    long long v145 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    id v59 = v130[6];
    uint64_t v60 = [v59 countByEnumeratingWithState:&v145 objects:v156 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = *(void *)v146;
      do
      {
        for (uint64_t j = 0; j != v61; ++j)
        {
          if (*(void *)v146 != v62) {
            objc_enumerationMutation(v59);
          }
          v64 = [*(id *)(*((void *)&v145 + 1) + 8 * j) latestResults];
          v65 = [v64 objectForKeyedSubscript:@"dateAdded"];

          if (v65)
          {
            uint64_t v66 = [v134 earlierDate:v65];

            v134 = (void *)v66;
          }
        }
        uint64_t v61 = [v59 countByEnumeratingWithState:&v145 objects:v156 count:16];
      }
      while (v61);
    }

    v67 = [MEMORY[0x263EFF910] distantFuture];
    char v68 = [v134 isEqualToDate:v67];

    uint64_t v5 = v58;
    if ((v68 & 1) == 0) {
      [v58 setObject:v134 forKeyedSubscript:@"dateAdded"];
    }
    v69 = [v130[5] _buildControlItems];
    [v58 setObject:v69 forKeyedSubscript:@"childItems"];

    v70 = [v130[5] _collectAllChildItems];
    [v58 setObject:v70 forKeyedSubscript:@"collatedChildItems"];

    v124 = [v130[5] _mostCommonValueInServiceItems:v130[6] valueProvider:&__block_literal_global_22_1];
    objc_msgSend(v58, "na_safeSetObject:forKey:");
    if ([v130[5] isSiriEndpointAccessory])
    {
      if ([v130[5] shouldShowMutedMicIcon])
      {
        v71 = [v58 objectForKeyedSubscript:@"descriptionBadge"];

        if (!v71) {
          [v58 setObject:&unk_26C0F67B0 forKeyedSubscript:@"descriptionBadge"];
        }
      }
    }
    id v72 = v130[6];
    v73 = [v130[5] _sortDescriptorsForServiceItems];
    v74 = [v72 sortedArrayUsingDescriptors:v73];

    long long v143 = 0u;
    long long v144 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    obuint64_t j = v74;
    uint64_t v133 = [obj countByEnumeratingWithState:&v141 objects:v155 count:16];
    if (v133)
    {
      uint64_t v132 = *(void *)v142;
      do
      {
        uint64_t v75 = 0;
        do
        {
          if (*(void *)v142 != v132) {
            objc_enumerationMutation(obj);
          }
          uint64_t v136 = v75;
          v76 = *(void **)(*((void *)&v141 + 1) + 8 * v75);
          long long v137 = 0u;
          long long v138 = 0u;
          long long v139 = 0u;
          long long v140 = 0u;
          v77 = [v76 latestResults];
          uint64_t v78 = [v77 countByEnumeratingWithState:&v137 objects:v154 count:16];
          if (v78)
          {
            uint64_t v79 = v78;
            uint64_t v80 = *(void *)v138;
            do
            {
              for (uint64_t k = 0; k != v79; ++k)
              {
                if (*(void *)v138 != v80) {
                  objc_enumerationMutation(v77);
                }
                v82 = *(void **)(*((void *)&v137 + 1) + 8 * k);
                v83 = [v5 objectForKeyedSubscript:v82];

                if (!v83)
                {
                  if (([v82 isEqualToString:@"priority"] & 1) == 0
                    && ![v82 isEqualToString:@"descriptionStyle"]
                    || ([v76 service],
                        v84 = objc_claimAutoreleasedReturnValue(),
                        int v85 = [v84 isPrimaryService],
                        v84,
                        v85))
                  {
                    v86 = [v76 latestResults];
                    v87 = [v86 objectForKeyedSubscript:v82];
                    [v58 setObject:v87 forKeyedSubscript:v82];
                  }
                }
                uint64_t v5 = v58;
              }
              uint64_t v79 = [v77 countByEnumeratingWithState:&v137 objects:v154 count:16];
            }
            while (v79);
          }

          uint64_t v75 = v136 + 1;
        }
        while (v136 + 1 != v133);
        uint64_t v133 = [obj countByEnumeratingWithState:&v141 objects:v155 count:16];
      }
      while (v133);
    }

    objc_opt_class();
    v88 = [v5 objectForKeyedSubscript:@"underlyingError"];
    if (objc_opt_isKindOfClass()) {
      v89 = v88;
    }
    else {
      v89 = 0;
    }
    id v90 = v89;

    if (v90) {
      BOOL v91 = [v90 category] != 1;
    }
    else {
      BOOL v91 = 1;
    }
    id v7 = v126;
    id v3 = v127;
    objc_super v18 = v130;
    id v92 = v130[5];
    v93 = [v5 objectForKeyedSubscript:@"title"];
    v94 = [v92 _buildTileDescription:v91 title:v93];
    [v5 setObject:v94 forKeyedSubscript:@"description"];

    v95 = [v130[5] accessory];
    int v96 = objc_msgSend(v95, "hf_hasSetFavorite");

    if (v96)
    {
      v97 = NSNumber;
      v98 = [v130[5] accessory];
      v99 = objc_msgSend(v97, "numberWithBool:", objc_msgSend(v98, "hf_isFavorite"));
      [v5 setObject:v99 forKeyedSubscript:@"isFavorite"];
    }
    else
    {
      [v5 setObject:0 forKeyedSubscript:@"isFavorite"];
    }
  }
  v100 = [v18[5] accessory];
  int v101 = objc_msgSend(v100, "hf_isVisibleAsBridge");

  if (v101)
  {
    v102 = [v18[5] accessory];
    v103 = [v102 room];
    v104 = [v103 uniqueIdentifier];
    objc_msgSend(v5, "na_safeSetObject:forKey:", v104, @"roomIdentifier");

    v105 = [MEMORY[0x263F1C6C8] configurationPreferringMulticolor];
    v106 = [MEMORY[0x263F1C6C8] configurationWithPointSize:26.0];
    v107 = [v106 configurationByApplyingConfiguration:v105];
    v108 = [v18[5] accessory];
    v109 = +[HFServiceIconFactory iconDescriptorForAccessory:v108];

    objc_opt_class();
    id v110 = v109;
    if (objc_opt_isKindOfClass()) {
      v111 = v110;
    }
    else {
      v111 = 0;
    }
    id v112 = v111;

    v113 = [v112 imageIconDescriptorWithUpdatedImageSymbolConfiguration:v107];

    [v5 setObject:v113 forKeyedSubscript:@"icon"];
  }
  v114 = [v5 objectForKeyedSubscript:@"controlDescription"];

  if (v114)
  {
    v115 = (void *)MEMORY[0x263F086A0];
    v116 = [v5 objectForKeyedSubscript:@"controlDescription"];
    v117 = [v5 objectForKeyedSubscript:@"title"];
    v118 = objc_msgSend(v115, "hf_attributedStringWithInflectableAccessoryStatus:accessoryName:", v116, v117);
    v119 = [v118 string];
    [v5 setObject:v119 forKeyedSubscript:@"controlDescription"];
  }
  v120 = (void *)MEMORY[0x263F58190];
  v121 = +[HFItemUpdateOutcome outcomeWithResults:v5];
  v122 = [v120 futureWithResult:v121];

  return v122;
}

BOOL __47__HFAccessoryItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 latestResults];
  id v3 = [v2 objectForKeyedSubscript:@"state"];
  BOOL v4 = [v3 integerValue] == 2;

  return v4;
}

BOOL __47__HFAccessoryItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 latestResults];
  BOOL v4 = [v3 objectForKeyedSubscript:@"state"];
  BOOL v5 = [v4 integerValue] == *(void *)(a1 + 32);

  return v5;
}

id __47__HFAccessoryItem__subclass_updateWithOptions___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 latestResults];
  id v3 = [v2 objectForKeyedSubscript:@"badge"];

  if ([v3 isEqual:&unk_26C0F6798]) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (BOOL)shouldShowMutedMicIcon
{
  id v3 = [(HFAccessoryItem *)self commonSettingsManager];
  BOOL v4 = [v3 settingValueForKeyPath:HFAllowHeySiriSettingKeyPath];

  if (v4) {
    int v5 = [v4 BOOLValue] ^ 1;
  }
  else {
    int v5 = 0;
  }
  v6 = [(HFAccessoryItem *)self accessory];
  int v7 = [v6 supportsAudioAnalysis];

  if (!v7 || !v5)
  {
    if ((v5 & ~v7) != 1) {
      goto LABEL_7;
    }
LABEL_9:
    uint64_t v9 = [(HFAccessoryItem *)self home];
    BOOL v8 = [v9 audioAnalysisClassifierOptions] != 0;

    goto LABEL_10;
  }
  if (![(HFAccessoryItem *)self isAudioAnalysisEnabled]) {
    goto LABEL_9;
  }
LABEL_7:
  BOOL v8 = 0;
LABEL_10:

  return v8;
}

- (id)controlItemsForService:(id)a3
{
  id v3 = [(HFAccessoryItem *)self serviceItemForService:a3];
  BOOL v4 = v3;
  if (v3)
  {
    int v5 = [v3 latestResults];
    v6 = [v5 objectForKeyedSubscript:@"childItems"];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)serviceItemForService:(id)a3
{
  id v4 = a3;
  int v5 = [(HFAccessoryItem *)self serviceItems];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__HFAccessoryItem_serviceItemForService___block_invoke;
  v9[3] = &unk_2640934A0;
  id v10 = v4;
  id v6 = v4;
  int v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __41__HFAccessoryItem_serviceItemForService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 service];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)_buildControlItems
{
  id v3 = [(HFAccessoryItem *)self serviceItems];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    uint64_t v9 = [MEMORY[0x263EFFA08] set];
    goto LABEL_14;
  }
  if (v4 != 1)
  {
LABEL_8:
    id v10 = [(HFAccessoryItem *)self accessory];
    id v11 = objc_msgSend(v10, "hf_primaryService");
    BOOL v8 = [(HFAccessoryItem *)self serviceItemForService:v11];

    uint64_t v12 = [v8 latestResults];
    uint64_t v13 = [v12 objectForKeyedSubscript:@"childItems"];

    if ((objc_msgSend(v13, "na_any:", &__block_literal_global_37_2) & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v14 = objc_msgSend(v13, "na_map:", &__block_literal_global_42);
    }
    else
    {
      id v16 = [(HFAccessoryItem *)self serviceItems];
      int v17 = objc_msgSend(v16, "na_any:", &__block_literal_global_44);

      if (v17)
      {
        objc_super v18 = [HFAccessoryControlItem alloc];
        v19 = [(HFAccessoryItem *)self valueSource];
        BOOL v20 = [(HFAccessoryItem *)self accessory];
        __int16 v21 = [(HFAccessoryControlItem *)v18 initWithValueSource:v19 parentAccessory:v20 displayResults:MEMORY[0x263EFFA78]];

        uint64_t v9 = [MEMORY[0x263EFF9C0] setWithObject:v21];

        goto LABEL_12;
      }
      uint64_t v14 = [MEMORY[0x263EFFA08] set];
    }
    uint64_t v9 = (void *)v14;
LABEL_12:

    goto LABEL_13;
  }
  int v5 = [(HFAccessoryItem *)self serviceItems];
  id v6 = [v5 anyObject];
  int v7 = [v6 latestResults];
  BOOL v8 = [v7 objectForKeyedSubscript:@"childItems"];

  if ([v8 count] != 1)
  {

    goto LABEL_8;
  }
  uint64_t v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_34_0);
LABEL_13:

LABEL_14:
  return v9;
}

id __37__HFAccessoryItem__buildControlItems__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 copy];
  return v2;
}

uint64_t __37__HFAccessoryItem__buildControlItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __37__HFAccessoryItem__buildControlItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 copy];
  return v2;
}

uint64_t __37__HFAccessoryItem__buildControlItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 latestResults];
  id v3 = [v2 objectForKeyedSubscript:@"childItems"];

  uint64_t v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_46_0);
  return v4;
}

uint64_t __37__HFAccessoryItem__buildControlItems__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_collectAllChildItems
{
  id v3 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v4 = [(HFAccessoryItem *)self serviceItems];
  int v5 = objc_msgSend(v3, "setWithCapacity:", objc_msgSend(v4, "count"));

  id v6 = [(HFAccessoryItem *)self serviceItems];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__HFAccessoryItem__collectAllChildItems__block_invoke;
  v9[3] = &unk_264093530;
  id v7 = v5;
  id v10 = v7;
  objc_msgSend(v6, "na_each:", v9);

  return v7;
}

void __40__HFAccessoryItem__collectAllChildItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 latestResults];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"childItems"];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__HFAccessoryItem__collectAllChildItems__block_invoke_2;
  v5[3] = &unk_264093508;
  id v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "na_each:", v5);
}

void __40__HFAccessoryItem__collectAllChildItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (id)[a2 copy];
  [v2 addObject:v3];
}

- (id)_buildServiceItems
{
  id v3 = [(HFAccessoryItem *)self accessory];
  uint64_t v4 = objc_msgSend(v3, "hf_visibleServices");
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__HFAccessoryItem__buildServiceItems__block_invoke;
  v7[3] = &unk_26408EB00;
  v7[4] = self;
  int v5 = objc_msgSend(v4, "na_map:", v7);

  return v5;
}

id __37__HFAccessoryItem__buildServiceItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 valueSource];
  int v5 = +[HFServiceItem serviceItemForService:v3 valueSource:v4];

  return v5;
}

- (BOOL)containsActions
{
  id v2 = [(HFAccessoryItem *)self _buildServiceItems];
  char v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_54_0);

  return v3;
}

uint64_t __34__HFAccessoryItem_containsActions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsActions];
}

- (BOOL)actionsMayRequireDeviceUnlock
{
  id v2 = [(HFAccessoryItem *)self _buildServiceItems];
  char v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_56);

  return v3;
}

uint64_t __48__HFAccessoryItem_actionsMayRequireDeviceUnlock__block_invoke(uint64_t a1, void *a2)
{
  return [a2 actionsMayRequireDeviceUnlock];
}

- (id)currentStateActionBuildersForHome:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v25 = objc_alloc_init(MEMORY[0x263F58190]);
  v26 = [MEMORY[0x263EFF980] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  int v5 = [(HFAccessoryItem *)self accessory];
  id v6 = objc_msgSend(v5, "hf_visibleServices");

  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v31 + 1) + 8 * v10);
        uint64_t v12 = [(HFAccessoryItem *)self valueSource];
        uint64_t v13 = +[HFServiceItem serviceItemForService:v11 valueSource:v12];

        if (v13)
        {
          uint64_t v14 = [v13 currentStateActionBuildersForHome:v4];
          if (v14) {
            [v26 addObject:v14];
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v8);
  }

  uint64_t v15 = (void *)MEMORY[0x263F58190];
  id v16 = [MEMORY[0x263F581B8] mainThreadScheduler];
  int v17 = [v15 combineAllFutures:v26 ignoringErrors:0 scheduler:v16];

  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __53__HFAccessoryItem_currentStateActionBuildersForHome___block_invoke;
  v29[3] = &unk_264093558;
  id v18 = v25;
  id v30 = v18;
  id v19 = (id)[v17 addSuccessBlock:v29];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __53__HFAccessoryItem_currentStateActionBuildersForHome___block_invoke_2;
  v27[3] = &unk_26408CDF0;
  id v20 = v18;
  id v28 = v20;
  id v21 = (id)[v17 addFailureBlock:v27];
  uint64_t v22 = v28;
  id v23 = v20;

  return v23;
}

void __53__HFAccessoryItem_currentStateActionBuildersForHome___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263EFF9C0] set];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "unionSet:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 32) finishWithResult:v4];
}

uint64_t __53__HFAccessoryItem_currentStateActionBuildersForHome___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (HMHome)home
{
  id v2 = [(HFAccessoryItem *)self accessory];
  id v3 = [v2 home];

  return (HMHome *)v3;
}

- (NSSet)services
{
  id v2 = [(HFAccessoryItem *)self accessory];
  id v3 = objc_msgSend(v2, "hf_visibleServices");

  return (NSSet *)v3;
}

- (id)accessories
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [(HFAccessoryItem *)self accessory];
  id v4 = objc_msgSend(v2, "na_setWithSafeObject:", v3);

  return v4;
}

- (id)serviceLikeBuilderInHome:(id)a3
{
  id v4 = a3;
  id v5 = [HFAccessoryBuilder alloc];
  uint64_t v6 = [(HFAccessoryItem *)self homeKitObject];
  uint64_t v7 = [(HFAccessoryBuilder *)v5 initWithExistingObject:v6 inHome:v4];

  return v7;
}

- (id)namingComponentForHomeKitObject
{
  id v2 = [(HFAccessoryItem *)self accessory];
  id v3 = +[HFNamingComponents namingComponentFromAccessory:v2];

  return v3;
}

- (BOOL)isItemGroup
{
  return 0;
}

- (unint64_t)numberOfItemsContainedWithinGroup
{
  return 0;
}

- (BOOL)isContainedWithinItemGroup
{
  return 0;
}

- (BOOL)isCompoundItem
{
  return [(HFAccessoryItem *)self numberOfCompoundItems] > 1;
}

- (unint64_t)numberOfCompoundItems
{
  id v2 = [(HFAccessoryItem *)self accessory];
  id v3 = objc_msgSend(v2, "hf_visibleServices");
  unint64_t v4 = [v3 count];

  return v4;
}

- (HFHomeKitObject)primaryHomeKitObject
{
  id v2 = [(HFAccessoryItem *)self accessory];
  id v3 = objc_msgSend(v2, "hf_primaryService");

  return (HFHomeKitObject *)v3;
}

- (NSArray)allHomeKitObjects
{
  id v2 = [(HFAccessoryItem *)self accessory];
  id v3 = objc_msgSend(v2, "hf_visibleServices");
  unint64_t v4 = [v3 allObjects];
  id v5 = objc_msgSend(MEMORY[0x263F0E708], "hf_serviceComparator");
  uint64_t v6 = [v4 sortedArrayUsingComparator:v5];

  return (NSArray *)v6;
}

- (HFMediaAccessoryCommonSettingsManager)commonSettingsManager
{
  id v2 = [(HFAccessoryItem *)self accessory];
  id v3 = [v2 mediaProfile];
  unint64_t v4 = objc_msgSend(v3, "hf_mediaAccessoryCommonSettingsManager");

  return (HFMediaAccessoryCommonSettingsManager *)v4;
}

- (BOOL)isSiriEndpointAccessory
{
  id v2 = [(HFAccessoryItem *)self accessory];
  char v3 = objc_msgSend(v2, "hf_isSiriEndpoint");

  return v3;
}

- (BOOL)isAnnounceEnabled
{
  if (![(HFAccessoryItem *)self isSiriEndpointAccessory]) {
    return 0;
  }
  char v3 = [(HFAccessoryItem *)self commonSettingsManager];
  unint64_t v4 = [v3 settingValueForKeyPath:HFAnnounceEnabledKeyPath];

  if (!v4) {
    return 0;
  }
  char v5 = [v4 BOOLValue];

  return v5;
}

- (id)setEnableAnnounce:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(HFAccessoryItem *)self accessory];
  uint64_t v6 = [v5 uniqueIdentifier];

  if ([(HFAccessoryItem *)self isSiriEndpointAccessory])
  {
    uint64_t v7 = [(HFAccessoryItem *)self commonSettingsManager];
    uint64_t v8 = [(HFAccessoryItem *)self accessory];
    uint64_t v9 = [v8 home];
    long long v10 = [v9 uniqueIdentifier];
    long long v11 = HFAnnounceEnabledKeyPath;
    long long v12 = [NSNumber numberWithBool:v3];
    long long v13 = [v7 updateAccessorySettingWithHomeIdentifier:v10 accessoryIdentifier:v6 keyPath:v11 rawSettingValue:v12];
  }
  else
  {
    long long v13 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v13;
}

- (BOOL)isSiriDisabled
{
  id v2 = [(HFAccessoryItem *)self commonSettingsManager];
  BOOL v3 = [v2 settingValueForKeyPath:HFAllowHeySiriSettingKeyPath];

  if (v3) {
    int v4 = [v3 BOOLValue] ^ 1;
  }
  else {
    LOBYTE(v4) = 1;
  }

  return v4;
}

- (id)setSiriDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(HFAccessoryItem *)self accessory];
  uint64_t v6 = [v5 uniqueIdentifier];

  if ([(HFAccessoryItem *)self isSiriEndpointAccessory])
  {
    uint64_t v7 = [(HFAccessoryItem *)self commonSettingsManager];
    uint64_t v8 = [(HFAccessoryItem *)self accessory];
    uint64_t v9 = [v8 home];
    long long v10 = [v9 uniqueIdentifier];
    long long v11 = HFAllowHeySiriSettingKeyPath;
    long long v12 = [NSNumber numberWithInt:!v3];
    long long v13 = [v7 updateAccessorySettingWithHomeIdentifier:v10 accessoryIdentifier:v6 keyPath:v11 rawSettingValue:v12];
  }
  else
  {
    long long v13 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v13;
}

- (BOOL)isAudioAnalysisEnabled
{
  if (![(HFAccessoryItem *)self isSiriEndpointAccessory]) {
    return 0;
  }
  BOOL v3 = [(HFAccessoryItem *)self commonSettingsManager];
  int v4 = [v3 settingValueForKeyPath:HFAudioAnalysisEnabledKeyPath];

  if (!v4) {
    return 0;
  }
  char v5 = [v4 BOOLValue];

  return v5;
}

- (id)setEnableAudioAnalysis:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(HFAccessoryItem *)self accessory];
  uint64_t v6 = [v5 uniqueIdentifier];

  if ([(HFAccessoryItem *)self isSiriEndpointAccessory])
  {
    uint64_t v7 = [(HFAccessoryItem *)self commonSettingsManager];
    uint64_t v8 = [(HFAccessoryItem *)self accessory];
    uint64_t v9 = [v8 home];
    long long v10 = [v9 uniqueIdentifier];
    long long v11 = HFAudioAnalysisEnabledKeyPath;
    long long v12 = [NSNumber numberWithBool:v3];
    long long v13 = [v7 updateAccessorySettingWithHomeIdentifier:v10 accessoryIdentifier:v6 keyPath:v11 rawSettingValue:v12];
  }
  else
  {
    long long v13 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v13;
}

- (BOOL)isDoorbellChimeEnabled
{
  if (![(HFAccessoryItem *)self isSiriEndpointAccessory]) {
    return 0;
  }
  BOOL v3 = [(HFAccessoryItem *)self commonSettingsManager];
  int v4 = [v3 settingValueForKeyPath:HFDoorbellChimeEnabledKeyPath];

  if (!v4) {
    return 0;
  }
  char v5 = [v4 BOOLValue];

  return v5;
}

- (id)enableDoorbellChime:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(HFAccessoryItem *)self accessory];
  uint64_t v6 = [v5 uniqueIdentifier];

  if ([(HFAccessoryItem *)self isSiriEndpointAccessory])
  {
    uint64_t v7 = [(HFAccessoryItem *)self commonSettingsManager];
    uint64_t v8 = [(HFAccessoryItem *)self accessory];
    uint64_t v9 = [v8 home];
    long long v10 = [v9 uniqueIdentifier];
    long long v11 = HFDoorbellChimeEnabledKeyPath;
    long long v12 = [NSNumber numberWithBool:v3];
    long long v13 = [v7 updateAccessorySettingWithHomeIdentifier:v10 accessoryIdentifier:v6 keyPath:v11 rawSettingValue:v12];
  }
  else
  {
    long long v13 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v13;
}

- (id)_buildTileDescription:(BOOL)a3 title:(id)a4
{
  BOOL v4 = a3;
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [(HFAccessoryItem *)self accessory];
  int v8 = objc_msgSend(v7, "hf_isMultiServiceAccessory");

  if (!v8 || !v4)
  {
    id v30 = [(HFAccessoryItem *)self accessory];
    long long v31 = objc_msgSend(v30, "hf_primaryService");
    long long v32 = [(HFAccessoryItem *)self serviceItemForService:v31];

    long long v33 = [v32 latestResults];
    long long v34 = [v33 objectForKeyedSubscript:@"description"];

    uint64_t v35 = 0;
    goto LABEL_48;
  }
  id v66 = v6;
  char v68 = objc_opt_new();
  uint64_t v9 = objc_opt_new();
  v67 = objc_opt_new();
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v10 = [(HFAccessoryItem *)self serviceItems];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v70 objects:v74 count:16];
  if (!v11)
  {
    char v15 = 1;
    uint64_t v14 = &stru_26C081158;
    goto LABEL_26;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v71;
  uint64_t v14 = &stru_26C081158;
  char v15 = 1;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v71 != v13) {
        objc_enumerationMutation(v10);
      }
      int v17 = *(void **)(*((void *)&v70 + 1) + 8 * i);
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v19 = v9;
      if ((isKindOfClass & 1) == 0)
      {
        objc_opt_class();
        char v20 = objc_opt_isKindOfClass();
        id v19 = v9;
        if ((v20 & 1) == 0)
        {
          objc_opt_class();
          char v21 = objc_opt_isKindOfClass();
          id v19 = v9;
          if ((v21 & 1) == 0)
          {
            objc_opt_class();
            char v22 = objc_opt_isKindOfClass();
            id v19 = v9;
            if ((v22 & 1) == 0)
            {
              id v23 = [v17 latestResults];
              [v23 objectForKeyedSubscript:@"state"];
              v69 = v14;
              v24 = v9;
              v26 = id v25 = v10;
              uint64_t v27 = [v26 integerValue];

              long long v10 = v25;
              uint64_t v9 = v24;
              uint64_t v14 = v69;

              if (v27 == 2) {
                id v19 = v68;
              }
              else {
                id v19 = v67;
              }
            }
          }
        }
      }
      [v19 addObject:v17];
      if (![(__CFString *)v14 length])
      {
        id v28 = [v17 service];
        [v28 serviceType];
        id v29 = v14;
        uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      if (v15)
      {
        id v28 = [v17 service];
        id v29 = [v28 serviceType];
        char v15 = [(__CFString *)v14 isEqualToString:v29];
LABEL_19:

        continue;
      }
      char v15 = 0;
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v70 objects:v74 count:16];
  }
  while (v12);
LABEL_26:

  uint64_t v36 = [v68 count];
  uint64_t v37 = [v67 count];
  if (v37) {
    BOOL v38 = 0;
  }
  else {
    BOOL v38 = (int)v36 > 0;
  }
  if (v36) {
    BOOL v39 = 0;
  }
  else {
    BOOL v39 = (int)v37 > 0;
  }
  uint64_t v40 = [v9 count];
  int v47 = v37 + v36;
  if (!(v37 + v36) && (int)v40 >= 1)
  {
    long long v34 = HFLocalizedStringWithFormat(@"HFAccessoryTileSensorStatus", @"%d", v41, v42, v43, v44, v45, v46, v40);
    goto LABEL_46;
  }
  if (v47 != 1)
  {
    if (!((v36 != 1) | v15 & 1)) {
      goto LABEL_41;
    }
    if (v47 <= 3) {
      int v49 = (v47 == 2) & v15;
    }
    else {
      int v49 = 1;
    }
    if ((int)v36 < 1)
    {
      if ((int)v37 >= 1)
      {
        v63 = HFLocalizedStringWithFormat(@"HFAccessoryTileOffStatus", @"%d", v41, v42, v43, v44, v45, v46, v37);
        uint64_t v62 = 0;
        goto LABEL_59;
      }
      uint64_t v62 = 0;
    }
    else
    {
      uint64_t v62 = HFLocalizedStringWithFormat(@"HFAccessoryTileOnStatus", @"%d", v41, v42, v43, v44, v45, v46, v36);
      if ((int)v37 > 0)
      {
        v63 = HFLocalizedStringWithFormat(@"HFAccessoryTileOffStatus", @"%d", v56, v57, v58, v59, v60, v61, v37);
        id v64 = [NSString stringWithFormat:@"%@ • %@", v62, v63];
LABEL_69:
        long long v34 = v64;
        goto LABEL_70;
      }
    }
    v63 = 0;
LABEL_59:
    if (v38)
    {
      if (v49)
      {
        id v64 = v62;
        uint64_t v62 = v64;
        goto LABEL_69;
      }
      v65 = @"HFAccessoryTileAllOnStatus";
    }
    else
    {
      if (!v39)
      {
        long long v34 = 0;
LABEL_70:

        uint64_t v35 = 1;
        goto LABEL_47;
      }
      if (v49)
      {
        id v64 = v63;
        v63 = v64;
        goto LABEL_69;
      }
      v65 = @"HFAccessoryTileAllOffStatus";
    }
    _HFLocalizedStringWithDefaultValue(v65, v65, 1);
    id v64 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_69;
  }
  v48 = v67;
  if ((int)v36 >= 1) {
LABEL_41:
  }
    v48 = v68;
  v50 = [v48 firstObject];
  objc_opt_class();
  uint64_t v51 = HFResultDisplayDescriptionKey;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      uint64_t v51 = HFResultDisplayControlDescriptionKey;
    }
  }
  v52 = [v50 latestResults];
  long long v34 = [v52 objectForKeyedSubscript:*v51];

LABEL_46:
  uint64_t v35 = 0;
LABEL_47:
  id v6 = v66;

LABEL_48:
  v53 = objc_msgSend(MEMORY[0x263F086A0], "hf_attributedStringWithInflectableAccessoryStatus:accessoryName:forcePluralAgreement:", v34, v6, v35);
  v54 = [v53 string];

  return v54;
}

- (id)_buildControlDescription
{
  v21[1] = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:0 ascending:0 comparator:&__block_literal_global_95_1];
  BOOL v4 = [(HFAccessoryItem *)self serviceItems];
  char v5 = [v4 allObjects];
  v21[0] = v3;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  uint64_t v7 = [v5 sortedArrayUsingDescriptors:v6];
  int v8 = (void *)[v7 mutableCopy];

  uint64_t v9 = [(HFAccessoryItem *)self accessory];
  long long v10 = objc_msgSend(v9, "hf_primaryService");

  if (v10)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __43__HFAccessoryItem__buildControlDescription__block_invoke_2;
    v19[3] = &unk_2640934A0;
    id v20 = v10;
    uint64_t v11 = objc_msgSend(v8, "na_firstObjectPassingTest:", v19);
    if (v11 && [v8 containsObject:v11])
    {
      [v8 removeObject:v11];
      [v8 insertObject:v11 atIndex:0];
    }
  }
  uint64_t v12 = [MEMORY[0x263F089D8] string];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __43__HFAccessoryItem__buildControlDescription__block_invoke_3;
  v17[3] = &unk_2640935A0;
  v17[4] = self;
  id v13 = v12;
  id v18 = v13;
  objc_msgSend(v8, "na_each:", v17);
  uint64_t v14 = v18;
  id v15 = v13;

  return v15;
}

uint64_t __43__HFAccessoryItem__buildControlDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  char v5 = [a2 service];
  id v6 = [v5 name];

  uint64_t v7 = [v4 service];

  int v8 = [v7 name];

  uint64_t v9 = [v6 compare:v8];
  return v9;
}

uint64_t __43__HFAccessoryItem__buildControlDescription__block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 service];
  id v4 = [v3 uniqueIdentifier];
  char v5 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);

  return v6;
}

void __43__HFAccessoryItem__buildControlDescription__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 latestResults];
  char v5 = [v4 objectForKeyedSubscript:@"state"];
  uint64_t v6 = [v5 integerValue];

  objc_opt_class();
  id v19 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v19;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  if (!v8
    || ([*(id *)(a1 + 32) accessory],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = objc_msgSend(v9, "hf_isMultiServiceAccessory"),
        v9,
        !v10)
    || v6 == 2)
  {
    uint64_t v11 = [v19 latestResults];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"controlDescription"];
    if (v12)
    {
      id v13 = (void *)v12;
    }
    else
    {
      uint64_t v14 = [v19 latestResults];
      id v13 = [v14 objectForKeyedSubscript:@"description"];

      if (!v13)
      {
LABEL_14:

        goto LABEL_15;
      }
    }
    if ([*(id *)(a1 + 40) length])
    {
      id v15 = [*(id *)(a1 + 32) _repeatingDescriptionsToCoalesce];
      char v16 = [v15 containsObject:v13];

      if ((v16 & 1) == 0)
      {
        int v17 = *(void **)(a1 + 40);
        id v18 = [NSString stringWithFormat:@" • %@", v13];
        [v17 appendString:v18];
      }
    }
    else
    {
      [*(id *)(a1 + 40) appendString:v13];
    }
    goto LABEL_14;
  }
LABEL_15:
}

- (id)_repeatingDescriptionsToCoalesce
{
  v12[2] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263EFF9C0];
  id v4 = _HFLocalizedStringWithDefaultValue(@"HFServiceDescriptionUpdating", @"HFServiceDescriptionUpdating", 1);
  v12[0] = v4;
  char v5 = _HFLocalizedStringWithDefaultValue(@"HFServiceDescriptionAccessoryConnectionError", @"HFServiceDescriptionAccessoryConnectionError", 1);
  v12[1] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  uint64_t v7 = [v3 setWithArray:v6];

  id v8 = [(HFAccessoryItem *)self accessory];
  LODWORD(v4) = objc_msgSend(v8, "hf_isTelevision");

  if (v4)
  {
    uint64_t v9 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicValuePowerStateOff", @"HFCharacteristicValuePowerStateOff", 1);
    [v7 addObject:v9];
  }
  int v10 = (void *)[v7 copy];

  return v10;
}

- (BOOL)isMultiSensorDevice
{
  id v3 = [(HFAccessoryItem *)self accessory];
  if (objc_msgSend(v3, "hf_isMultiServiceAccessory"))
  {
    id v4 = [(HFAccessoryItem *)self serviceItems];
    char v5 = objc_msgSend(v4, "na_all:", &__block_literal_global_111_1);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

uint64_t __38__HFAccessoryItem_isMultiSensorDevice__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (BOOL)isMultiLightDevice
{
  id v3 = [(HFAccessoryItem *)self accessory];
  if (objc_msgSend(v3, "hf_isMultiServiceAccessory"))
  {
    id v4 = [(HFAccessoryItem *)self serviceItems];
    char v5 = objc_msgSend(v4, "na_all:", &__block_literal_global_113_0);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

uint64_t __37__HFAccessoryItem_isMultiLightDevice__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_unanimousValueForResultsKey:(id)a3 inServiceItems:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "latestResults", (void)v16);
        id v13 = [v12 objectForKeyedSubscript:v5];

        if (v13)
        {
          if (v9)
          {
            if (![v9 isEqual:v13])
            {

              uint64_t v14 = 0;
              goto LABEL_16;
            }
          }
          else
          {
            id v9 = v13;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  id v9 = v9;
  uint64_t v14 = v9;
LABEL_16:

  return v14;
}

- (id)_mostCommonValueForResultsKey:(id)a3 inServiceItems:(id)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__HFAccessoryItem__mostCommonValueForResultsKey_inServiceItems___block_invoke;
  v10[3] = &unk_2640935C8;
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = [(HFAccessoryItem *)self _mostCommonValueInServiceItems:a4 valueProvider:v10];

  return v8;
}

id __64__HFAccessoryItem__mostCommonValueForResultsKey_inServiceItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 latestResults];
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];

  return v4;
}

- (id)_mostCommonValueInServiceItems:(id)a3 valueProvider:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  if (v6)
  {
    id v7 = [MEMORY[0x263F08760] set];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = v6[2](v6, *(void *)(*((void *)&v16 + 1) + 8 * i));
          if (v13) {
            objc_msgSend(v7, "addObject:", v13, (void)v16);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    uint64_t v14 = objc_msgSend(v7, "na_mostCommonObject");
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)_sortDescriptorsForServiceItems
{
  v7[3] = *MEMORY[0x263EF8340];
  id v2 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:0 ascending:0 comparator:&__block_literal_global_117];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:0 ascending:0 comparator:&__block_literal_global_123_1];
  id v4 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:0 ascending:0 comparator:&__block_literal_global_125_0];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:3];

  return v5;
}

uint64_t __50__HFAccessoryItem__sortDescriptorsForServiceItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 latestResults];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"priority"];
  id v7 = (void *)v6;
  if (v6) {
    id v8 = (void *)v6;
  }
  else {
    id v8 = &unk_26C0F67C8;
  }
  id v9 = v8;

  uint64_t v10 = [v4 latestResults];

  uint64_t v11 = [v10 objectForKeyedSubscript:@"priority"];
  uint64_t v12 = (void *)v11;
  if (v11) {
    id v13 = (void *)v11;
  }
  else {
    id v13 = &unk_26C0F67C8;
  }
  id v14 = v13;

  uint64_t v15 = [v9 compare:v14];
  return v15;
}

uint64_t __50__HFAccessoryItem__sortDescriptorsForServiceItems__block_invoke_121(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 latestResults];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"errorDescription"];
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = [v5 latestResults];
    uint64_t v10 = [v9 objectForKeyedSubscript:@"errorDescription"];

    if (!v10)
    {
      uint64_t v11 = -1;
      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v12 = [v4 latestResults];
  id v13 = [v12 objectForKeyedSubscript:@"errorDescription"];
  if (v13)
  {

    uint64_t v11 = 0;
  }
  else
  {
    id v14 = [v5 latestResults];
    uint64_t v15 = [v14 objectForKeyedSubscript:@"errorDescription"];
    uint64_t v11 = v15 != 0;
  }
LABEL_8:

  return v11;
}

uint64_t __50__HFAccessoryItem__sortDescriptorsForServiceItems__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 latestResults];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"subPriority"];
  uint64_t v7 = (void *)v6;
  if (v6) {
    id v8 = (void *)v6;
  }
  else {
    id v8 = &unk_26C0F67E0;
  }
  id v9 = v8;

  uint64_t v10 = [v4 latestResults];

  uint64_t v11 = [v10 objectForKeyedSubscript:@"subPriority"];
  uint64_t v12 = (void *)v11;
  if (v11) {
    id v13 = (void *)v11;
  }
  else {
    id v13 = &unk_26C0F67E0;
  }
  id v14 = v13;

  uint64_t v15 = [v9 compare:v14];
  return v15;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (NSSet)serviceItems
{
  return self->_serviceItems;
}

- (void)setServiceItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceItems, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  id v9 = objc_msgSend(v7, "hf_homeKitObject");

  id v10 = v9;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t v12 = v10;
    if (v11) {
      goto LABEL_8;
    }
    id v13 = [MEMORY[0x263F08690] currentHandler];
    id v14 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v13 handleFailureInFunction:v14, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v8, objc_opt_class() file lineNumber description];
  }
  uint64_t v12 = 0;
LABEL_8:

  uint64_t v15 = (void *)[objc_alloc((Class)a1) initWithAccessory:v12 valueSource:v6];
  return v15;
}

@end