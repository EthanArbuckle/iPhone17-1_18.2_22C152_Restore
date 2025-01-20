@interface ATXModeConfigurationLogger
- (ATXDNDModeConfigurationClient)client;
- (ATXModeConfigurationLogger)init;
- (ATXModeConfigurationLogger)initWithDNDModeConfigurationClient:(id)a3;
- (NSArray)cachedConfigurations;
- (NSMutableDictionary)cachedSuggestedItems;
- (void)logMetricForConfiguration:(id)a3;
- (void)logModeConfigurations;
- (void)logModeConfigurationsWithXPCActivity:(id)a3;
- (void)retrieveEvents;
- (void)setCachedConfigurations:(id)a3;
- (void)setCachedSuggestedItems:(id)a3;
@end

@implementation ATXModeConfigurationLogger

- (ATXModeConfigurationLogger)initWithDNDModeConfigurationClient:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ATXModeConfigurationLogger;
  v6 = [(ATXModeConfigurationLogger *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    uint64_t v8 = objc_opt_new();
    cachedSuggestedItems = v7->_cachedSuggestedItems;
    v7->_cachedSuggestedItems = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x1E4F4B180] sharedInstance];
    modeEntityTrialClientWrapper = v7->_modeEntityTrialClientWrapper;
    v7->_modeEntityTrialClientWrapper = (ATXModeEntityTrialClientWrapper *)v10;

    [(ATXModeConfigurationLogger *)v7 retrieveEvents];
    v12 = +[ATXPosterConfigurationCache sharedInstance];
    uint64_t v13 = [v12 configurations];
    cachedConfigurations = v7->_cachedConfigurations;
    v7->_cachedConfigurations = (NSArray *)v13;
  }
  return v7;
}

- (ATXModeConfigurationLogger)init
{
  v3 = [MEMORY[0x1E4F4AF78] sharedInstance];
  v4 = [(ATXModeConfigurationLogger *)self initWithDNDModeConfigurationClient:v3];

  return v4;
}

- (void)logModeConfigurations
{
}

- (void)logModeConfigurationsWithXPCActivity:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138412290;
    v32 = v7;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_INFO, "%@ - Logging mode configurations", buf, 0xCu);
  }
  uint64_t v8 = [(ATXDNDModeConfigurationClient *)self->_client getAllModeConfigurationsWithoutCache];
  v9 = __atxlog_handle_metrics();
  uint64_t v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138412290;
      v32 = v12;
      _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_INFO, "%@ - Fetched mode configurations from client", buf, 0xCu);
    }
    if ([v4 didDefer])
    {
      uint64_t v10 = __atxlog_handle_metrics();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138412290;
        v32 = v14;
        v15 = "%@ - XPC Activity deferred, terminating.";
LABEL_21:
        _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_INFO, v15, buf, 0xCu);
      }
    }
    else
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v10 = objc_msgSend(v8, "allValues", 0);
      uint64_t v16 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v27;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v27 != v18) {
              objc_enumerationMutation(v10);
            }
            uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * i);
            v21 = (void *)MEMORY[0x1D25F6CC0]();
            [(ATXModeConfigurationLogger *)self logMetricForConfiguration:v20];
            if ([v4 didDefer])
            {
              v23 = __atxlog_handle_metrics();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                v24 = (objc_class *)objc_opt_class();
                v25 = NSStringFromClass(v24);
                *(_DWORD *)buf = 138412290;
                v32 = v25;
                _os_log_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_INFO, "%@ - XPC Activity deferred, terminating.", buf, 0xCu);
              }
              goto LABEL_25;
            }
          }
          uint64_t v17 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

      uint64_t v10 = __atxlog_handle_metrics();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v22 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v22);
        *(_DWORD *)buf = 138412290;
        v32 = v14;
        v15 = "%@ - Finished logging mode configurations";
        goto LABEL_21;
      }
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[ATXModeConfigurationLogger logModeConfigurationsWithXPCActivity:]((uint64_t)self, v10);
  }
LABEL_25:
}

- (void)logMetricForConfiguration:(id)a3
{
  uint64_t v180 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    v7 = [v3 mode];
    uint64_t v8 = [v7 identifier];
    v9 = [v8 UUIDString];
    *(_DWORD *)buf = 138412546;
    v172 = v6;
    __int16 v173 = 2112;
    v174 = v9;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_INFO, "%@ - Generating metrics for DND mode with UUID %@", buf, 0x16u);
  }
  uint64_t v10 = objc_opt_new();
  v11 = [v3 mode];
  v12 = [v11 identifier];
  uint64_t v13 = [v12 UUIDString];
  [v10 setModeIdentifier:v13];

  v14 = [v3 mode];
  [v14 semanticType];
  DNDModeSemanticTypeToATXActivityType();
  v15 = ATXActivityTypeToString();
  [v10 setModeSemanticType:v15];

  id v169 = 0;
  id v134 = objc_alloc_init(MEMORY[0x1E4F4B078]);
  uint64_t v16 = [v134 loadHomeScreenPageConfigurationsIncludingHidden:1 error:&v169];
  id v17 = v169;
  if (v17)
  {
    uint64_t v18 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ATXModeConfigurationLogger logMetricForConfiguration:].cold.4();
    }
  }
  v137 = v3;
  v133 = v17;
  long long v167 = 0u;
  long long v168 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  obuint64_t j = v16;
  uint64_t v19 = [obj countByEnumeratingWithState:&v165 objects:v179 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    id v140 = *(id *)v166;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(id *)v166 != v140) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v165 + 1) + 8 * i);
        long long v161 = 0u;
        long long v162 = 0u;
        long long v163 = 0u;
        long long v164 = 0u;
        v23 = [v22 associatedModeUUIDs];
        uint64_t v24 = [v23 countByEnumeratingWithState:&v161 objects:v178 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v162;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v162 != v26) {
                objc_enumerationMutation(v23);
              }
              long long v28 = *(void **)(*((void *)&v161 + 1) + 8 * j);
              long long v29 = [v10 modeIdentifier];
              LODWORD(v28) = [v28 isEqualToString:v29];

              if (v28)
              {
                [v10 setHasCustomHomeScreen:1];
                objc_msgSend(v10, "setNumCustomHomeScreens:", objc_msgSend(v10, "numCustomHomeScreens") + 1);
                v30 = [v22 associatedModeUUIDs];
                unint64_t v31 = [v30 count];
                unsigned int v32 = [v10 hasCustomHomeScreenUsedInOtherModes];
                if (v31 > 1) {
                  uint64_t v33 = 1;
                }
                else {
                  uint64_t v33 = v32;
                }
                [v10 setHasCustomHomeScreenUsedInOtherModes:v33];
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v161 objects:v178 count:16];
          }
          while (v25);
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v165 objects:v179 count:16];
    }
    while (v20);
  }

  v34 = [(ATXModeConfigurationLogger *)self cachedConfigurations];
  v159[0] = MEMORY[0x1E4F143A8];
  v159[1] = 3221225472;
  v159[2] = __56__ATXModeConfigurationLogger_logMetricForConfiguration___block_invoke;
  v159[3] = &unk_1E68B3FF8;
  id v35 = v137;
  id v160 = v35;
  v36 = objc_msgSend(v34, "_pas_filteredArrayWithTest:", v159);
  objc_msgSend(v10, "setNumLockScreenPosters:", objc_msgSend(v36, "count"));

  v37 = objc_opt_new();
  v38 = [v35 mode];
  v39 = [v38 identifier];
  v40 = [v39 UUIDString];
  v132 = v37;
  v41 = [v37 identifierOfSuggestedPageForModeUUID:v40];

  if (v41) {
    [v10 setNumAcceptedSuggestedHomePages:1];
  }
  v42 = [v35 mode];
  uint64_t v43 = [v42 semanticType];

  if (v43 == 1)
  {
    v44 = ATXSleepSuggestedHomePageWasCreatedDuringMigration();
    if (!v44)
    {
      v45 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        -[ATXModeConfigurationLogger logMetricForConfiguration:](v45);
      }
    }
    uint64_t v46 = [v44 BOOLValue];
    [v10 setIsSleepMigrated:v46];
    objc_msgSend(v10, "setDidRemoveSuggestedPage:", v46 & (objc_msgSend(v10, "hasCustomHomeScreen") ^ 1));
  }
  long long v157 = 0u;
  long long v158 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  v138 = v35;
  v47 = [v35 triggers];
  uint64_t v48 = [v47 countByEnumeratingWithState:&v155 objects:v177 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v156;
    do
    {
      for (uint64_t k = 0; k != v49; ++k)
      {
        if (*(void *)v156 != v50) {
          objc_enumerationMutation(v47);
        }
        v52 = *(void **)(*((void *)&v155 + 1) + 8 * k);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v52 isEnabled])
        {
          [v10 setHasAreaTrigger:1];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v52 isEnabled])
          {
            [v10 setHasTimeTrigger:1];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v52 isEnabled])
            {
              [v10 setHasAppTrigger:1];
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && [v52 isEnabled])
              {
                [v10 setHasSmartTrigger:1];
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 && [v52 isEnabled])
                {
                  [v10 setHasWorkoutTrigger:1];
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0 && [v52 isEnabled])
                  {
                    [v10 setHasSleepTrigger:1];
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0 && [v52 isEnabled]) {
                      [v10 setHasDrivingTrigger:1];
                    }
                  }
                }
              }
            }
          }
        }
      }
      uint64_t v49 = [v47 countByEnumeratingWithState:&v155 objects:v177 count:16];
    }
    while (v49);
  }

  v53 = [v138 configuration];
  uint64_t v54 = [v53 allowIntelligentManagement];

  if (v54 == 2) {
    [v10 setIsIntelligentBreakthroughEnabled:1];
  }
  v55 = [(ATXModeConfigurationLogger *)self cachedSuggestedItems];
  v56 = [v138 mode];
  v57 = [v56 identifier];
  v58 = [v57 UUIDString];
  v59 = [v55 objectForKeyedSubscript:v58];

  v60 = [v138 configuration];
  uint64_t v61 = [v60 applicationConfigurationType];

  if (v61)
  {
    if (v61 == 2) {
      goto LABEL_73;
    }
    if (v61 != 1)
    {
      v65 = __atxlog_handle_metrics();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT)) {
        -[ATXModeConfigurationLogger logMetricForConfiguration:](v138);
      }
      goto LABEL_72;
    }
    v62 = [v138 configuration];
    v63 = [v62 applicationsWithExceptions];

    objc_msgSend(v10, "setNumDeniedApps:", objc_msgSend(v63, "count"));
    v64 = [v59 suggestedDeniedApps];
    v153[0] = MEMORY[0x1E4F143A8];
    v153[1] = 3221225472;
    v153[2] = __56__ATXModeConfigurationLogger_logMetricForConfiguration___block_invoke_51;
    v153[3] = &unk_1E68B0200;
    v154 = v63;
    v65 = v63;
    v66 = objc_msgSend(v64, "_pas_filteredSetWithTest:", v153);

    objc_msgSend(v10, "setNumAcceptedSuggestedApps:", objc_msgSend(v66, "count"));
    v67 = v154;
  }
  else
  {
    v68 = [v138 configuration];
    v69 = [v68 applicationsWithExceptions];

    objc_msgSend(v10, "setNumAllowedApps:", objc_msgSend(v69, "count"));
    v70 = [v59 suggestedAllowedApps];
    v151[0] = MEMORY[0x1E4F143A8];
    v151[1] = 3221225472;
    v151[2] = __56__ATXModeConfigurationLogger_logMetricForConfiguration___block_invoke_2;
    v151[3] = &unk_1E68B0200;
    v152 = v69;
    v65 = v69;
    v71 = objc_msgSend(v70, "_pas_filteredSetWithTest:", v151);

    objc_msgSend(v10, "setNumAcceptedSuggestedApps:", objc_msgSend(v71, "count"));
    v67 = v152;
  }

LABEL_72:
LABEL_73:
  v72 = [v138 configuration];
  uint64_t v73 = [v72 senderConfigurationType];

  if (v73)
  {
    if (v73 == 2) {
      goto LABEL_82;
    }
    if (v73 != 1)
    {
      v77 = __atxlog_handle_metrics();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT)) {
        -[ATXModeConfigurationLogger logMetricForConfiguration:](v138);
      }
      goto LABEL_81;
    }
    v74 = [v138 configuration];
    v75 = [v74 contactsWithExceptions];

    objc_msgSend(v10, "setNumDeniedContacts:", objc_msgSend(v75, "count"));
    v76 = [v59 suggestedDeniedContacts];
    v149[0] = MEMORY[0x1E4F143A8];
    v149[1] = 3221225472;
    v149[2] = __56__ATXModeConfigurationLogger_logMetricForConfiguration___block_invoke_53;
    v149[3] = &unk_1E68B0200;
    v150 = v75;
    v77 = v75;
    v78 = objc_msgSend(v76, "_pas_filteredSetWithTest:", v149);

    objc_msgSend(v10, "setNumAcceptedSuggestedContacts:", objc_msgSend(v78, "count"));
    v79 = v150;
  }
  else
  {
    v80 = [v138 configuration];
    v81 = [v80 contactsWithExceptions];

    objc_msgSend(v10, "setNumAllowedContacts:", objc_msgSend(v81, "count"));
    v82 = [v59 suggestedAllowedContacts];
    v147[0] = MEMORY[0x1E4F143A8];
    v147[1] = 3221225472;
    v147[2] = __56__ATXModeConfigurationLogger_logMetricForConfiguration___block_invoke_2_54;
    v147[3] = &unk_1E68B0200;
    v148 = v81;
    v77 = v81;
    v83 = objc_msgSend(v82, "_pas_filteredSetWithTest:", v147);

    objc_msgSend(v10, "setNumAcceptedSuggestedContacts:", objc_msgSend(v83, "count"));
    v79 = v148;
  }

LABEL_81:
LABEL_82:
  v131 = v59;
  v84 = [v138 configuration];
  [v84 applicationConfigurationType];
  v85 = DNDStringFromConfigurationType();
  [v10 setAppConfigurationType:v85];

  v86 = [v138 configuration];
  [v86 senderConfigurationType];
  v87 = DNDStringFromConfigurationType();
  [v10 setContactConfigurationType:v87];

  objc_msgSend(v10, "setIsAutomaticallyGenerated:", objc_msgSend(v138, "isAutomaticallyGenerated"));
  objc_msgSend(v10, "setDoesImpactAvailability:", objc_msgSend(v138, "impactsAvailability") != 0);
  v88 = [(ATXModeConfigurationLogger *)self client];
  objc_msgSend(v10, "setIsSharingAcrossDevices:", objc_msgSend(v88, "isCloudSyncActive"));

  v89 = [(ATXModeConfigurationLogger *)self client];
  v90 = [v138 mode];
  v91 = [v90 modeIdentifier];
  id v146 = 0;
  v92 = [v89 appConfigurationsForModeIdentifier:v91 error:&v146];
  id v93 = v146;
  objc_msgSend(v10, "setNumAppConfigurations:", objc_msgSend(v92, "count"));

  v94 = [(ATXModeEntityTrialClientWrapper *)self->_modeEntityTrialClientWrapper trialExperimentId];
  [v10 setExperimentId:v94];

  v95 = [(ATXModeEntityTrialClientWrapper *)self->_modeEntityTrialClientWrapper trialTreatmentId];
  [v10 setTreatmentId:v95];

  v96 = objc_msgSend(NSNumber, "numberWithInt:", -[ATXModeEntityTrialClientWrapper trialDeploymentId](self->_modeEntityTrialClientWrapper, "trialDeploymentId"));
  [v10 setDeploymentId:v96];

  v135 = v93;
  if (v93)
  {
    v97 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
    {
      v126 = (objc_class *)objc_opt_class();
      v127 = NSStringFromClass(v126);
      v128 = [v93 localizedDescription];
      v129 = [v138 mode];
      [v129 semanticType];
      v130 = DNDModeSemanticTypeToString();
      *(_DWORD *)buf = 138412802;
      v172 = v127;
      __int16 v173 = 2112;
      v174 = v128;
      __int16 v175 = 2112;
      v176 = v130;
      _os_log_error_impl(&dword_1D0FA3000, v97, OS_LOG_TYPE_ERROR, "%@: Got error: %@, when getting AppConfigturation for %@", buf, 0x20u);
    }
  }
  v98 = (void *)MEMORY[0x1E4F4B3D0];
  v99 = [v138 mode];
  LODWORD(v98) = objc_msgSend(v98, "suggestionsAreSupportedForModeSemanticType:", objc_msgSend(v99, "semanticType"));

  if (v98)
  {
    id v100 = objc_alloc(MEMORY[0x1E4F4B3D0]);
    v101 = [v138 mode];
    v102 = objc_msgSend(v100, "initWithModeSemanticType:", objc_msgSend(v101, "semanticType"));

    objc_msgSend(v10, "setWasQuickStartPlatterShown:", objc_msgSend(v102, "suggestionWasAlreadyShown"));
  }
  id v103 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v104 = (void *)[v103 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  v105 = [v104 dictionaryForKey:*MEMORY[0x1E4F4B738]];
  v106 = [v138 mode];
  v107 = [v106 modeIdentifier];
  v108 = [v105 objectForKeyedSubscript:v107];
  objc_msgSend(v10, "setWasColoringBookSeen:", objc_msgSend(v108, "BOOLValue"));

  [v10 setNumAcceptedSuggestedLockScreens:0];
  long long v144 = 0u;
  long long v145 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  v109 = +[ATXPosterConfigurationCache sharedInstance];
  v110 = [v109 configurations];

  id v141 = v110;
  uint64_t v111 = [v110 countByEnumeratingWithState:&v142 objects:v170 count:16];
  if (v111)
  {
    uint64_t v112 = v111;
    uint64_t v113 = *(void *)v143;
    do
    {
      for (uint64_t m = 0; m != v112; ++m)
      {
        if (*(void *)v143 != v113) {
          objc_enumerationMutation(v141);
        }
        v115 = [*(id *)(*((void *)&v142 + 1) + 8 * m) galleryItem];
        v116 = v115;
        if (v115
          && ([v115 modeSemanticType], (v107 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v106 = [v116 modeSemanticType];
          uint64_t v117 = [v106 integerValue];
          v108 = [v138 mode];
          BOOL v118 = v117 == [v108 semanticType] && objc_msgSend(v116, "source") == 6;
          int v119 = 1;
        }
        else
        {
          int v119 = 0;
          BOOL v118 = 0;
        }
        objc_msgSend(v10, "setNumAcceptedSuggestedLockScreens:", objc_msgSend(v10, "numAcceptedSuggestedLockScreens") + v118);
        if (v119)
        {
        }
        if (v116) {
      }
        }
      uint64_t v112 = [v141 countByEnumeratingWithState:&v142 objects:v170 count:16];
    }
    while (v112);
  }

  v120 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
  {
    v121 = (objc_class *)objc_opt_class();
    v122 = NSStringFromClass(v121);
    v123 = [v138 mode];
    v124 = [v123 identifier];
    v125 = [v124 UUIDString];
    *(_DWORD *)buf = 138412546;
    v172 = v122;
    __int16 v173 = 2112;
    v174 = v125;
    _os_log_impl(&dword_1D0FA3000, v120, OS_LOG_TYPE_INFO, "%@ - Logging metrics for DND mode with UUID %@", buf, 0x16u);
  }
  [v10 logToCoreAnalytics];
}

uint64_t __56__ATXModeConfigurationLogger_logMetricForConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 modeUUID];
  id v4 = [v3 UUIDString];
  id v5 = [*(id *)(a1 + 32) mode];
  v6 = [v5 identifier];
  v7 = [v6 UUIDString];
  uint64_t v8 = [v4 isEqualToString:v7];

  return v8;
}

uint64_t __56__ATXModeConfigurationLogger_logMetricForConfiguration___block_invoke_51(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "allObjects", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) bundleID];
        char v9 = [v8 isEqualToString:v3];

        if (v9)
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

uint64_t __56__ATXModeConfigurationLogger_logMetricForConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "allObjects", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) bundleID];
        char v9 = [v8 isEqualToString:v3];

        if (v9)
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

uint64_t __56__ATXModeConfigurationLogger_logMetricForConfiguration___block_invoke_53(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "allObjects", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) contactIdentifier];
        char v9 = [v8 isEqualToString:v3];

        if (v9)
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

uint64_t __56__ATXModeConfigurationLogger_logMetricForConfiguration___block_invoke_2_54(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "allObjects", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) contactIdentifier];
        char v9 = [v8 isEqualToString:v3];

        if (v9)
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)retrieveEvents
{
  id v3 = objc_opt_new();
  id v4 = [v3 publisherFromStartTime:0.0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__ATXModeConfigurationLogger_retrieveEvents__block_invoke;
  v7[3] = &unk_1E68AD400;
  v7[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__ATXModeConfigurationLogger_retrieveEvents__block_invoke_60;
  v6[3] = &unk_1E68AF140;
  v6[4] = self;
  id v5 = (id)[v4 sinkWithCompletion:v7 shouldContinue:v6];
}

void __44__ATXModeConfigurationLogger_retrieveEvents__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 state];
  id v5 = __atxlog_handle_metrics();
  uint64_t v6 = v5;
  if (v4 == 1)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __44__ATXModeConfigurationLogger_retrieveEvents__block_invoke_cold_1(a1, v3, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "%@ - Retrieved events from ATXModeConfigurationUIFlowLoggingBiomeStream", (uint8_t *)&v9, 0xCu);
  }
}

uint64_t __44__ATXModeConfigurationLogger_retrieveEvents__block_invoke_60(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  uint64_t v4 = [v3 dndModeUUID];
  id v5 = [v4 UUIDString];

  uint64_t v6 = [*(id *)(a1 + 32) cachedSuggestedItems];
  v7 = [v6 objectForKeyedSubscript:v5];

  if (!v7)
  {
    uint64_t v8 = objc_opt_new();
    int v9 = [*(id *)(a1 + 32) cachedSuggestedItems];
    [v9 setObject:v8 forKeyedSubscript:v5];
  }
  uint64_t v10 = [*(id *)(a1 + 32) cachedSuggestedItems];
  uint64_t v11 = [v10 objectForKeyedSubscript:v5];

  if (![v3 modeConfigurationEntityType])
  {
    if ([v3 modeConfigurationType]) {
      [v11 suggestedDeniedApps];
    }
    else {
      [v11 suggestedAllowedApps];
    }
    goto LABEL_7;
  }
  if ([v3 modeConfigurationEntityType] == 1)
  {
    if ([v3 modeConfigurationType]) {
      [v11 suggestedDeniedContacts];
    }
    else {
      [v11 suggestedAllowedContacts];
    }
    uint64_t v12 = LABEL_7:;
    long long v13 = (void *)v12;
    long long v14 = [v3 suggestedEntityIdentifiers];
    [v13 addObjectsFromArray:v14];
  }
  return 1;
}

- (ATXDNDModeConfigurationClient)client
{
  return self->_client;
}

- (NSMutableDictionary)cachedSuggestedItems
{
  return self->_cachedSuggestedItems;
}

- (void)setCachedSuggestedItems:(id)a3
{
}

- (NSArray)cachedConfigurations
{
  return self->_cachedConfigurations;
}

- (void)setCachedConfigurations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedConfigurations, 0);
  objc_storeStrong((id *)&self->_cachedSuggestedItems, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_modeEntityTrialClientWrapper, 0);
}

- (void)logModeConfigurationsWithXPCActivity:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "%@ - Failed to fetch mode configurations from client.  Terminating.", v5, 0xCu);
}

- (void)logMetricForConfiguration:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 configuration];
  [v1 senderConfigurationType];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0FA3000, v2, v3, "Unable to set number of allowed or denied contacts on metric due to unknown DNDConfigurationType: %ld", v4, v5, v6, v7, v8);
}

- (void)logMetricForConfiguration:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 configuration];
  [v1 applicationConfigurationType];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0FA3000, v2, v3, "Unable to set number of allowed or denied apps on metric due to unknown DNDConfigurationType: %ld", v4, v5, v6, v7, v8);
}

- (void)logMetricForConfiguration:(os_log_t)log .cold.3(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[ATXModeConfigurationLogger logMetricForConfiguration:]";
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "%s: Failed to determine whether sleep migration happened so can't set didRemoveSuggestedPage on the metric correctly. Setting metric to NO as a fallback.", (uint8_t *)&v1, 0xCu);
}

- (void)logMetricForConfiguration:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "ATXModeConfigurationLogger: Unable to load HomeScreen page configurations - %{public}@", v1, 0xCu);
}

void __44__ATXModeConfigurationLogger_retrieveEvents__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = [a2 error];
  uint8_t v8 = [v7 localizedDescription];
  int v9 = 138412546;
  uint64_t v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = v8;
  _os_log_error_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_ERROR, "%@ - Failed to retrive events from ATXModeConfigurationUIFlowLoggingBiomeStream: %@", (uint8_t *)&v9, 0x16u);
}

@end