@interface ATXNotificationInterruptionTuner
- (ATXNotificationInterruptionTuner)init;
- (ATXNotificationInterruptionTuner)initWithModesModels:(id)a3 notificationSettingsReader:(id)a4 dataStore:(id)a5;
- (ATXNotificationInterruptionTuner)initWithModesModels:(id)a3 notificationSettingsReader:(id)a4 dataStore:(id)a5 modeConfigClient:(id)a6;
- (ATXNotificationInterruptionTuner)initWithModesModels:(id)a3 notificationSettingsReader:(id)a4 dataStore:(id)a5 modeConfigClient:(id)a6 interruptionManager:(id)a7;
- (ATXNotificationInterruptionTuner)initWithNotificationSettingsReader:(id)a3 dataStore:(id)a4 modeConfigClient:(id)a5 interruptionManager:(id)a6;
- (BOOL)appWithBundleId:(id)a3 isRecommendedByAllowListModel:(id)a4;
- (BOOL)appWithBundleId:(id)a3 isRecommendedByDenyListModel:(id)a4;
- (BOOL)contactWithIdentifier:(id)a3 isRecommendedByAllowListModel:(id)a4;
- (BOOL)contactWithIdentifier:(id)a3 isRecommendedByDenyListModel:(id)a4;
- (BOOL)validateNotificationUrgency:(id)a3;
- (id)activeNotificationSuggestionsForMode:(unint64_t)a3;
- (id)activeNotificationSuggestionsForMode:(unint64_t)a3 candidateNotifications:(id)a4;
- (id)dndModeUUID:(unint64_t)a3;
- (int64_t)recommendedUrgencyForNotification:(id)a3 mode:(unint64_t)a4;
@end

@implementation ATXNotificationInterruptionTuner

- (ATXNotificationInterruptionTuner)init
{
  id v3 = objc_alloc(MEMORY[0x1E4F4B178]);
  v4 = +[ATXModeEntityScorerServer sharedInstance];
  v5 = (void *)[v3 initWithModeEntityScorerClient:v4];
  v6 = objc_opt_new();
  v7 = objc_opt_new();
  v8 = [(ATXNotificationInterruptionTuner *)self initWithModesModels:v5 notificationSettingsReader:v6 dataStore:v7];

  return v8;
}

- (ATXNotificationInterruptionTuner)initWithModesModels:(id)a3 notificationSettingsReader:(id)a4 dataStore:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F4AF78];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 sharedInstance];
  v13 = [(ATXNotificationInterruptionTuner *)self initWithModesModels:v11 notificationSettingsReader:v10 dataStore:v9 modeConfigClient:v12];

  return v13;
}

- (ATXNotificationInterruptionTuner)initWithModesModels:(id)a3 notificationSettingsReader:(id)a4 dataStore:(id)a5 modeConfigClient:(id)a6
{
  id v10 = (objc_class *)MEMORY[0x1E4F4B110];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = (void *)[[v10 alloc] initWithModesModels:v14 notificationSettingsReader:v13 modeConfigurationClient:v11];
  v16 = [(ATXNotificationInterruptionTuner *)self initWithModesModels:v14 notificationSettingsReader:v13 dataStore:v12 modeConfigClient:v11 interruptionManager:v15];

  return v16;
}

- (ATXNotificationInterruptionTuner)initWithModesModels:(id)a3 notificationSettingsReader:(id)a4 dataStore:(id)a5 modeConfigClient:(id)a6 interruptionManager:(id)a7
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)ATXNotificationInterruptionTuner;
  v17 = [(ATXNotificationInterruptionTuner *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_modesModels, a3);
    objc_storeStrong((id *)&v18->_notificationSettingsReader, a4);
    objc_storeStrong((id *)&v18->_dataStore, a5);
    objc_storeStrong((id *)&v18->_modeConfigClient, a6);
    uint64_t v19 = [MEMORY[0x1E4F4B1D0] sharedInstance];
    constants = v18->_constants;
    v18->_constants = (ATXNotificationManagementMAConstants *)v19;

    objc_storeStrong((id *)&v18->_interruptionManager, a7);
  }

  return v18;
}

- (ATXNotificationInterruptionTuner)initWithNotificationSettingsReader:(id)a3 dataStore:(id)a4 modeConfigClient:(id)a5 interruptionManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ATXNotificationInterruptionTuner;
  id v15 = [(ATXNotificationInterruptionTuner *)&v20 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_notificationSettingsReader, a3);
    objc_storeStrong((id *)&v16->_dataStore, a4);
    objc_storeStrong((id *)&v16->_modeConfigClient, a5);
    uint64_t v17 = [MEMORY[0x1E4F4B1D0] sharedInstance];
    constants = v16->_constants;
    v16->_constants = (ATXNotificationManagementMAConstants *)v17;

    objc_storeStrong((id *)&v16->_interruptionManager, a6);
  }

  return v16;
}

- (int64_t)recommendedUrgencyForNotification:(id)a3 mode:(unint64_t)a4
{
  return 1;
}

- (id)activeNotificationSuggestionsForMode:(unint64_t)a3
{
  v5 = [(ATXNotificationAndSuggestionDatastore *)self->_dataStore getTopOfProminentStackNotificationsWithLimit:10];
  v6 = [(ATXNotificationAndSuggestionDatastore *)self->_dataStore getTopOfNonProminentStackNotificationsWithLimit:10];
  v7 = [v5 arrayByAddingObjectsFromArray:v6];
  v8 = [(ATXNotificationInterruptionTuner *)self activeNotificationSuggestionsForMode:a3 candidateNotifications:v7];

  return v8;
}

- (id)activeNotificationSuggestionsForMode:(unint64_t)a3 candidateNotifications:(id)a4
{
  uint64_t v227 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3 <= 0xF && ((1 << a3) & 0xB021) != 0)
  {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_4;
  }
  unint64_t v136 = a3;
  v139 = v6;
  id v9 = [(ATXNotificationInterruptionTuner *)self dndModeUUID:a3];
  if (v9)
  {
    v135 = objc_opt_new();
    id v10 = [MEMORY[0x1E4F1CA60] dictionary];
    id v11 = [MEMORY[0x1E4F1CA60] dictionary];
    v208[0] = MEMORY[0x1E4F143A8];
    v208[1] = 3221225472;
    v208[2] = __96__ATXNotificationInterruptionTuner_activeNotificationSuggestionsForMode_candidateNotifications___block_invoke;
    v208[3] = &unk_1E68AD0D8;
    id v156 = v10;
    id v209 = v156;
    id v155 = v11;
    id v210 = v155;
    [v139 enumerateObjectsUsingBlock:v208];
    char v207 = 0;
    uint64_t v12 = [(ATXNotificationSettingsReaderProtocol *)self->_notificationSettingsReader applicationConfigurationTypeForDNDModeUUID:v9 success:&v207];
    v163 = v9;
    v166 = self;
    if (!v207)
    {
      v37 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        -[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:](v37);
      }
      v7 = v135;
LABEL_87:

      char v207 = 0;
      uint64_t v68 = [(ATXNotificationSettingsReaderProtocol *)self->_notificationSettingsReader senderConfigurationTypeForDNDModeUUID:v9 success:&v207];
      if (!v207)
      {
        v97 = __atxlog_handle_notification_management();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR)) {
          -[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:](v97);
        }
        goto LABEL_176;
      }
      uint64_t v134 = v68;
      if (![v155 count])
      {
        v97 = __atxlog_handle_notification_management();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v218 = "-[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:]";
          _os_log_impl(&dword_1D0FA3000, v97, OS_LOG_TYPE_DEFAULT, "%s: None of the notifications had associated contacts, so not returning any contact suggestions", buf, 0xCu);
        }
        goto LABEL_176;
      }
      interruptionManager = self->_interruptionManager;
      v70 = +[ATXModeEntityScorerServer sharedInstance];
      v71 = [v70 rankedContactsForMode:v136 options:1];
      v72 = [(ATXInterruptionManager *)interruptionManager recommendedAllowedContactsForContactScores:v71];

      v142 = [(ATXInterruptionManager *)self->_interruptionManager recommendedDeniedContactsForMode:v136 options:1];
      v165 = objc_opt_new();
      v141 = v72;
      if (v134 == 2)
      {
        v73 = __atxlog_handle_notification_management();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          v98 = ATXModeToString();
          v99 = DNDStringFromConfigurationType();
          *(_DWORD *)buf = 136315650;
          v218 = "-[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:]";
          __int16 v219 = 2114;
          uint64_t v220 = (uint64_t)v98;
          __int16 v221 = 2114;
          v222 = v99;
          _os_log_impl(&dword_1D0FA3000, v73, OS_LOG_TYPE_DEFAULT, "%s: Not returning any notification adjacent suggestions for contacts because mode: %{public}@ is in an unconfigured state: %{public}@", buf, 0x20u);
        }
LABEL_164:

        v122 = __atxlog_handle_notification_management();
        if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
        {
          uint64_t v123 = [v165 count];
          v124 = DNDStringFromConfigurationType();
          *(_DWORD *)buf = 136315650;
          v218 = "-[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:]";
          __int16 v219 = 2048;
          uint64_t v220 = v123;
          __int16 v221 = 2112;
          v222 = v124;
          _os_log_impl(&dword_1D0FA3000, v122, OS_LOG_TYPE_INFO, "%s: Created %ld contact suggestions for DND configuration type: %@", buf, 0x20u);
        }
        long long v169 = 0u;
        long long v170 = 0u;
        long long v167 = 0u;
        long long v168 = 0u;
        id v125 = v165;
        uint64_t v126 = [v125 countByEnumeratingWithState:&v167 objects:v211 count:16];
        if (v126)
        {
          uint64_t v127 = v126;
          uint64_t v128 = *(void *)v168;
          do
          {
            for (uint64_t i = 0; i != v127; ++i)
            {
              if (*(void *)v168 != v128) {
                objc_enumerationMutation(v125);
              }
              uint64_t v130 = *(void *)(*((void *)&v167 + 1) + 8 * i);
              v131 = __atxlog_handle_notification_management();
              if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v218 = "-[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:]";
                __int16 v219 = 2112;
                uint64_t v220 = v130;
                _os_log_debug_impl(&dword_1D0FA3000, v131, OS_LOG_TYPE_DEBUG, "%s: %@", buf, 0x16u);
              }
            }
            uint64_t v127 = [v125 countByEnumeratingWithState:&v167 objects:v211 count:16];
          }
          while (v127);
        }

        v7 = v135;
        [v135 addObjectsFromArray:v125];

        id v9 = v163;
        v97 = v141;
LABEL_176:

        goto LABEL_177;
      }
      if (v134 != 1)
      {
        if (!v134)
        {
          long long v185 = 0u;
          long long v186 = 0u;
          long long v183 = 0u;
          long long v184 = 0u;
          v73 = v72;
          uint64_t v74 = [v73 countByEnumeratingWithState:&v183 objects:v215 count:16];
          if (!v74) {
            goto LABEL_164;
          }
          uint64_t v76 = v74;
          uint64_t v77 = *(void *)v184;
          *(void *)&long long v75 = 138412290;
          long long v132 = v75;
          v78 = v142;
          v153 = v73;
          uint64_t v137 = *(void *)v184;
          while (1)
          {
            uint64_t v79 = 0;
            uint64_t v144 = v76;
            do
            {
              if (*(void *)v184 != v77) {
                objc_enumerationMutation(v73);
              }
              v80 = *(void **)(*((void *)&v183 + 1) + 8 * v79);
              if (v80)
              {
                v81 = [v80 cnContactId];
                if (v81)
                {
                  if ([(ATXNotificationSettingsReaderProtocol *)self->_notificationSettingsReader contactIsOnAllowList:v81 dndModeUUID:v163])
                  {
                    logb = __atxlog_handle_notification_management();
                    if (os_log_type_enabled(logb, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = v132;
                      v218 = v81;
                      _os_log_debug_impl(&dword_1D0FA3000, logb, OS_LOG_TYPE_DEBUG, "Not suggesting contact: %@ for allow list because it's already there", buf, 0xCu);
                    }
                    goto LABEL_119;
                  }
                  if (![(ATXNotificationInterruptionTuner *)self contactWithIdentifier:v81 isRecommendedByDenyListModel:v78])
                  {
                    long long v181 = 0u;
                    long long v182 = 0u;
                    long long v179 = 0u;
                    long long v180 = 0u;
                    logb = [v155 objectForKeyedSubscript:v81];
                    uint64_t v83 = [logb countByEnumeratingWithState:&v179 objects:v214 count:16];
                    if (!v83) {
                      goto LABEL_119;
                    }
                    uint64_t v84 = v83;
                    uint64_t v149 = v79;
                    uint64_t v85 = *(void *)v180;
                    v87 = logb;
                    v86 = v163;
                    while (1)
                    {
                      for (uint64_t j = 0; j != v84; ++j)
                      {
                        if (*(void *)v180 != v85) {
                          objc_enumerationMutation(v87);
                        }
                        v89 = *(void **)(*((void *)&v179 + 1) + 8 * j);
                        v90 = objc_msgSend(v89, "bundleID", v132);
                        if ([(ATXNotificationSettingsReaderProtocol *)self->_notificationSettingsReader appIsOnAllowList:v90 dndModeUUID:v86])
                        {
                          v91 = __atxlog_handle_notification_management();
                          if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)buf = 138412546;
                            v218 = v81;
                            __int16 v219 = 2112;
                            uint64_t v220 = (uint64_t)v90;
                            _os_log_impl(&dword_1D0FA3000, v91, OS_LOG_TYPE_INFO, "Not suggesting contact: %@ because app: %@ is already allowed so no reason to suggest allowing the contact as well.", buf, 0x16u);
                          }
                        }
                        else
                        {
                          if (![(ATXNotificationInterruptionTuner *)self validateNotificationUrgency:v89])goto LABEL_116; {
                          v91 = [objc_alloc(MEMORY[0x1E4F4B118]) initWithSuggestionType:1];
                          }
                          id v92 = objc_alloc(MEMORY[0x1E4F4B1B0]);
                          v93 = objc_opt_new();
                          v94 = objc_opt_new();
                          v95 = [v89 uuid];
                          v96 = (void *)[v92 initWithInterruptionManagerTuningSuggestion:v91 scope:3 entityIdentifier:v81 uuid:v93 timestamp:v94 triggerNotificationUUID:v95];

                          self = v166;
                          [v165 addObject:v96];

                          v87 = logb;
                          v86 = v163;
                        }

LABEL_116:
                      }
                      uint64_t v84 = [v87 countByEnumeratingWithState:&v179 objects:v214 count:16];
                      if (!v84)
                      {
                        v78 = v142;
                        uint64_t v79 = v149;
                        v73 = v153;
                        uint64_t v77 = v137;
                        uint64_t v76 = v144;
                        goto LABEL_119;
                      }
                    }
                  }
                }
                else
                {
                  v82 = __atxlog_handle_notification_management();
                  logb = v82;
                  if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 136315138;
                    v218 = "-[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:]";
                    _os_log_impl(&dword_1D0FA3000, v82, OS_LOG_TYPE_INFO, "%s: Contact doesn't have a cnContactId. Skipping.", buf, 0xCu);
                  }
LABEL_119:
                }
              }
              ++v79;
            }
            while (v79 != v76);
            uint64_t v76 = [v73 countByEnumeratingWithState:&v183 objects:v215 count:16];
            if (!v76) {
              goto LABEL_164;
            }
          }
        }
        v73 = __atxlog_handle_notification_management();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT)) {
          -[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:](v134, v73);
        }
        goto LABEL_164;
      }
      long long v177 = 0u;
      long long v178 = 0u;
      long long v175 = 0u;
      long long v176 = 0u;
      v73 = v142;
      uint64_t v100 = [v73 countByEnumeratingWithState:&v175 objects:v213 count:16];
      if (!v100) {
        goto LABEL_164;
      }
      uint64_t v102 = v100;
      uint64_t v103 = *(void *)v176;
      *(void *)&long long v101 = 138412290;
      long long v133 = v101;
      v154 = v73;
      uint64_t v138 = *(void *)v176;
LABEL_132:
      uint64_t v104 = 0;
      uint64_t v145 = v102;
      while (1)
      {
        if (*(void *)v176 != v103) {
          objc_enumerationMutation(v73);
        }
        v105 = *(void **)(*((void *)&v175 + 1) + 8 * v104);
        if (!v105) {
          goto LABEL_159;
        }
        v106 = [v105 cnContactId];
        if (!v106)
        {
          v107 = __atxlog_handle_notification_management();
          logc = v107;
          if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v218 = "-[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:]";
            _os_log_impl(&dword_1D0FA3000, v107, OS_LOG_TYPE_INFO, "%s: Contact doesn't have a cnContactId. Skipping.", buf, 0xCu);
          }
          goto LABEL_157;
        }
        if ([(ATXNotificationSettingsReaderProtocol *)self->_notificationSettingsReader contactIsOnDenyList:v106 dndModeUUID:v163])
        {
          logc = __atxlog_handle_notification_management();
          if (os_log_type_enabled(logc, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v133;
            v218 = v106;
            _os_log_debug_impl(&dword_1D0FA3000, logc, OS_LOG_TYPE_DEBUG, "Not suggesting contact: %@ for deny list because it's already there", buf, 0xCu);
          }
LABEL_157:

          goto LABEL_158;
        }
        if (![(ATXNotificationInterruptionTuner *)self contactWithIdentifier:v106 isRecommendedByAllowListModel:v72])break; {
LABEL_158:
        }

LABEL_159:
        if (++v104 == v102)
        {
          uint64_t v102 = [v73 countByEnumeratingWithState:&v175 objects:v213 count:16];
          if (!v102) {
            goto LABEL_164;
          }
          goto LABEL_132;
        }
      }
      long long v173 = 0u;
      long long v174 = 0u;
      long long v171 = 0u;
      long long v172 = 0u;
      logc = [v155 objectForKeyedSubscript:v106];
      uint64_t v108 = [logc countByEnumeratingWithState:&v171 objects:v212 count:16];
      if (!v108) {
        goto LABEL_157;
      }
      uint64_t v109 = v108;
      uint64_t v150 = v104;
      uint64_t v110 = *(void *)v172;
      v112 = logc;
      v111 = v163;
LABEL_145:
      uint64_t v113 = 0;
      while (1)
      {
        if (*(void *)v172 != v110) {
          objc_enumerationMutation(v112);
        }
        v114 = *(void **)(*((void *)&v171 + 1) + 8 * v113);
        v115 = objc_msgSend(v114, "bundleID", v133);
        if ([(ATXNotificationSettingsReaderProtocol *)self->_notificationSettingsReader appIsOnDenyList:v115 dndModeUUID:v111])break; {
        if ([(ATXNotificationInterruptionTuner *)self validateNotificationUrgency:v114])
        }
        {
          v116 = [objc_alloc(MEMORY[0x1E4F4B118]) initWithSuggestionType:3];
          id v117 = objc_alloc(MEMORY[0x1E4F4B1B0]);
          v118 = objc_opt_new();
          v119 = objc_opt_new();
          v120 = [v114 uuid];
          v121 = (void *)[v117 initWithInterruptionManagerTuningSuggestion:v116 scope:3 entityIdentifier:v106 uuid:v118 timestamp:v119 triggerNotificationUUID:v120];

          self = v166;
          [v165 addObject:v121];

          v112 = logc;
          v111 = v163;
LABEL_153:
        }
        if (v109 == ++v113)
        {
          uint64_t v109 = [v112 countByEnumeratingWithState:&v171 objects:v212 count:16];
          if (!v109)
          {
            v72 = v141;
            uint64_t v104 = v150;
            v73 = v154;
            uint64_t v103 = v138;
            uint64_t v102 = v145;
            goto LABEL_157;
          }
          goto LABEL_145;
        }
      }
      v116 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v218 = v106;
        __int16 v219 = 2112;
        uint64_t v220 = (uint64_t)v115;
        _os_log_impl(&dword_1D0FA3000, v116, OS_LOG_TYPE_INFO, "Not suggesting contact: %@ because app: %@ is already denied so no reason to suggest denying the contact as well.", buf, 0x16u);
      }
      goto LABEL_153;
    }
    uint64_t v140 = v12;
    id v13 = [(ATXInterruptionManager *)self->_interruptionManager recommendedAllowedAppsForMode:v136];
    id v14 = [(ATXInterruptionManager *)self->_interruptionManager recommendedDeniedAppsForMode:v136];
    v164 = objc_opt_new();
    v148 = v13;
    v143 = v14;
    if (v140 == 2)
    {
      id v15 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v38 = ATXModeToString();
        v39 = DNDStringFromConfigurationType();
        *(_DWORD *)buf = 136315650;
        v218 = "-[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:]";
        __int16 v219 = 2114;
        uint64_t v220 = (uint64_t)v38;
        __int16 v221 = 2114;
        v222 = v39;
        _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "%s: Not returning any notification adjacent suggestions for apps because mode: %{public}@ is in an unconfigured state: %{public}@", buf, 0x20u);
      }
LABEL_75:

      v58 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        uint64_t v59 = [v164 count];
        v60 = DNDStringFromConfigurationType();
        *(_DWORD *)buf = 136315650;
        v218 = "-[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:]";
        __int16 v219 = 2048;
        uint64_t v220 = v59;
        __int16 v221 = 2112;
        v222 = v60;
        _os_log_impl(&dword_1D0FA3000, v58, OS_LOG_TYPE_INFO, "%s: Created %ld app suggestions for DND configuration type: %@", buf, 0x20u);
      }
      long long v189 = 0u;
      long long v190 = 0u;
      long long v187 = 0u;
      long long v188 = 0u;
      id v61 = v164;
      uint64_t v62 = [v61 countByEnumeratingWithState:&v187 objects:v216 count:16];
      if (v62)
      {
        uint64_t v63 = v62;
        uint64_t v64 = *(void *)v188;
        do
        {
          for (uint64_t k = 0; k != v63; ++k)
          {
            if (*(void *)v188 != v64) {
              objc_enumerationMutation(v61);
            }
            uint64_t v66 = *(void *)(*((void *)&v187 + 1) + 8 * k);
            v67 = __atxlog_handle_notification_management();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v218 = "-[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:]";
              __int16 v219 = 2112;
              uint64_t v220 = v66;
              _os_log_debug_impl(&dword_1D0FA3000, v67, OS_LOG_TYPE_DEBUG, "%s: %@", buf, 0x16u);
            }
          }
          uint64_t v63 = [v61 countByEnumeratingWithState:&v187 objects:v216 count:16];
        }
        while (v63);
      }

      v7 = v135;
      [v135 addObjectsFromArray:v61];

      id v9 = v163;
      v37 = v148;
      goto LABEL_87;
    }
    if (v140 != 1)
    {
      if (!v140)
      {
        long long v205 = 0u;
        long long v206 = 0u;
        long long v203 = 0u;
        long long v204 = 0u;
        id v15 = v13;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v203 objects:v226 count:16];
        if (!v16) {
          goto LABEL_75;
        }
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v204;
        v157 = v15;
        uint64_t v146 = *(void *)v204;
        while (1)
        {
          os_log_t v19 = 0;
          uint64_t v151 = v17;
          do
          {
            if (*(void *)v204 != v18) {
              objc_enumerationMutation(v15);
            }
            objc_super v20 = *(void **)(*((void *)&v203 + 1) + 8 * (void)v19);
            if (v20)
            {
              v21 = [v20 bundleId];
              if ([(ATXNotificationSettingsReaderProtocol *)self->_notificationSettingsReader appIsOnAllowList:v21 dndModeUUID:v163])
              {
                id v22 = __atxlog_handle_notification_management();
                if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
                  goto LABEL_20;
                }
                *(_DWORD *)buf = 138412290;
                v218 = v21;
                objc_super v23 = v22;
                v24 = "Not suggesting app: %@ for allow list because it's already there";
LABEL_39:
                _os_log_debug_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_DEBUG, v24, buf, 0xCu);
                goto LABEL_20;
              }
              if (![(ATXNotificationInterruptionTuner *)self appWithBundleId:v21 isRecommendedByDenyListModel:v14])
              {
                if ([(ATXNotificationSettingsReaderProtocol *)self->_notificationSettingsReader doesAppSendNotificationsToDigest:v21])
                {
                  id v22 = __atxlog_handle_notification_management();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v218 = v21;
                    objc_super v23 = v22;
                    v24 = "Not suggesting app: %@ for allow list because app is configured to go to digest";
                    goto LABEL_39;
                  }
                }
                else
                {
                  long long v201 = 0u;
                  long long v202 = 0u;
                  long long v199 = 0u;
                  long long v200 = 0u;
                  id v22 = [v156 objectForKeyedSubscript:v21];
                  uint64_t v25 = [v22 countByEnumeratingWithState:&v199 objects:v225 count:16];
                  if (v25)
                  {
                    uint64_t v26 = v25;
                    os_log_t log = v19;
                    uint64_t v27 = *(void *)v200;
                    do
                    {
                      for (uint64_t m = 0; m != v26; ++m)
                      {
                        if (*(void *)v200 != v27) {
                          objc_enumerationMutation(v22);
                        }
                        v29 = *(void **)(*((void *)&v199 + 1) + 8 * m);
                        if ([(ATXNotificationInterruptionTuner *)self validateNotificationUrgency:v29])
                        {
                          v30 = (void *)[objc_alloc(MEMORY[0x1E4F4B118]) initWithSuggestionType:1];
                          id v31 = objc_alloc(MEMORY[0x1E4F4B1B0]);
                          v32 = objc_opt_new();
                          v33 = objc_opt_new();
                          v34 = [v29 uuid];
                          v35 = (void *)[v31 initWithInterruptionManagerTuningSuggestion:v30 scope:1 entityIdentifier:v21 uuid:v32 timestamp:v33 triggerNotificationUUID:v34];

                          [v164 addObject:v35];
                          self = v166;
                        }
                      }
                      uint64_t v26 = [v22 countByEnumeratingWithState:&v199 objects:v225 count:16];
                    }
                    while (v26);
                    id v14 = v143;
                    uint64_t v18 = v146;
                    id v15 = v157;
                    uint64_t v17 = v151;
                    os_log_t v19 = log;
                  }
                }
LABEL_20:
              }
            }
            os_log_t v19 = (os_log_t)((char *)v19 + 1);
          }
          while (v19 != (os_log_t)v17);
          uint64_t v36 = [v15 countByEnumeratingWithState:&v203 objects:v226 count:16];
          uint64_t v17 = v36;
          if (!v36) {
            goto LABEL_75;
          }
        }
      }
      id v15 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:](v140, v15);
      }
      goto LABEL_75;
    }
    long long v197 = 0u;
    long long v198 = 0u;
    long long v195 = 0u;
    long long v196 = 0u;
    id v15 = v14;
    uint64_t v40 = [v15 countByEnumeratingWithState:&v195 objects:v224 count:16];
    if (!v40) {
      goto LABEL_75;
    }
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v196;
    v158 = v15;
    uint64_t v147 = *(void *)v196;
LABEL_50:
    os_log_t v43 = 0;
    uint64_t v152 = v41;
    while (1)
    {
      if (*(void *)v196 != v42) {
        objc_enumerationMutation(v15);
      }
      v44 = *(void **)(*((void *)&v195 + 1) + 8 * (void)v43);
      if (!v44) {
        goto LABEL_70;
      }
      v45 = [v44 bundleId];
      if ([(ATXNotificationSettingsReaderProtocol *)self->_notificationSettingsReader appIsOnDenyList:v45 dndModeUUID:v163])break; {
      if (![(ATXNotificationInterruptionTuner *)self appWithBundleId:v45 isRecommendedByAllowListModel:v13])
      }
      {
        long long v193 = 0u;
        long long v194 = 0u;
        long long v191 = 0u;
        long long v192 = 0u;
        v46 = [v156 objectForKeyedSubscript:v45];
        uint64_t v47 = [v46 countByEnumeratingWithState:&v191 objects:v223 count:16];
        if (v47)
        {
          uint64_t v48 = v47;
          os_log_t loga = v43;
          uint64_t v49 = *(void *)v192;
          do
          {
            for (uint64_t n = 0; n != v48; ++n)
            {
              if (*(void *)v192 != v49) {
                objc_enumerationMutation(v46);
              }
              v51 = *(void **)(*((void *)&v191 + 1) + 8 * n);
              if ([(ATXNotificationInterruptionTuner *)self validateNotificationUrgency:v51])
              {
                v52 = (void *)[objc_alloc(MEMORY[0x1E4F4B118]) initWithSuggestionType:3];
                id v53 = objc_alloc(MEMORY[0x1E4F4B1B0]);
                v54 = objc_opt_new();
                v55 = objc_opt_new();
                v56 = [v51 uuid];
                v57 = (void *)[v53 initWithInterruptionManagerTuningSuggestion:v52 scope:1 entityIdentifier:v45 uuid:v54 timestamp:v55 triggerNotificationUUID:v56];

                self = v166;
                [v164 addObject:v57];
              }
            }
            uint64_t v48 = [v46 countByEnumeratingWithState:&v191 objects:v223 count:16];
          }
          while (v48);
          id v13 = v148;
          uint64_t v41 = v152;
          id v15 = v158;
          uint64_t v42 = v147;
          os_log_t v43 = loga;
        }
        goto LABEL_68;
      }
LABEL_69:

LABEL_70:
      os_log_t v43 = (os_log_t)((char *)v43 + 1);
      if (v43 == (os_log_t)v41)
      {
        uint64_t v41 = [v15 countByEnumeratingWithState:&v195 objects:v224 count:16];
        if (!v41) {
          goto LABEL_75;
        }
        goto LABEL_50;
      }
    }
    v46 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v218 = (const char *)v45;
      _os_log_debug_impl(&dword_1D0FA3000, v46, OS_LOG_TYPE_DEBUG, "Not suggesting app: %@ for deny list because it's already there", buf, 0xCu);
    }
LABEL_68:

    goto LABEL_69;
  }
  v7 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_177:

  id v6 = v139;
LABEL_4:

  return v7;
}

void __96__ATXNotificationInterruptionTuner_activeNotificationSuggestionsForMode_candidateNotifications___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [v13 bundleID];
  if (v3)
  {
    v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];

    if (!v4)
    {
      v5 = objc_opt_new();
      [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v3];
    }
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
    [v6 addObject:v13];
  }
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F4B1E0]) initWithUserNotification:v13];
  v8 = [v7 contactEntity];
  id v9 = [v8 cnContactId];

  if (v9)
  {
    id v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];

    if (!v10)
    {
      id v11 = objc_opt_new();
      [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v9];
    }
    uint64_t v12 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];
    [v12 addObject:v13];
  }
}

- (BOOL)validateNotificationUrgency:(id)a3
{
  id v3 = a3;
  if ([v3 urgency] && objc_msgSend(v3, "urgency") != 1)
  {
    BOOL v5 = 1;
  }
  else
  {
    v4 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[ATXNotificationInterruptionTuner validateNotificationUrgency:](v3, v4);
    }

    BOOL v5 = 0;
  }

  return v5;
}

- (id)dndModeUUID:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = -[ATXDNDModeConfigurationClient dndModeForATXMode:](self->_modeConfigClient, "dndModeForATXMode:");
  if (!v3)
  {
    v4 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = ATXModeToString();
      int v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "Unable to retrieve dndModeUUID for ATXMode: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  return v3;
}

- (BOOL)appWithBundleId:(id)a3 isRecommendedByAllowListModel:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "bundleId", (void)v16);
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          id v13 = [v10 bundleId];
          char v14 = [v13 isEqualToString:v5];

          if (v14)
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v7;
}

- (BOOL)appWithBundleId:(id)a3 isRecommendedByDenyListModel:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "bundleId", (void)v16);
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          id v13 = [v10 bundleId];
          char v14 = [v13 isEqualToString:v5];

          if (v14)
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v7;
}

- (BOOL)contactWithIdentifier:(id)a3 isRecommendedByAllowListModel:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "cnContactId", (void)v16);
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          id v13 = [v10 cnContactId];
          char v14 = [v13 isEqualToString:v5];

          if (v14)
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v7;
}

- (BOOL)contactWithIdentifier:(id)a3 isRecommendedByDenyListModel:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "cnContactId", (void)v16);
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          id v13 = [v10 cnContactId];
          char v14 = [v13 isEqualToString:v5];

          if (v14)
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interruptionManager, 0);
  objc_storeStrong((id *)&self->_constants, 0);
  objc_storeStrong((id *)&self->_modeConfigClient, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_notificationSettingsReader, 0);
  objc_storeStrong((id *)&self->_modesModels, 0);
}

- (void)activeNotificationSuggestionsForMode:(os_log_t)log candidateNotifications:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:]";
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "%s: Failed to get the DND allow/silence list configuration for contacts", (uint8_t *)&v1, 0xCu);
}

- (void)activeNotificationSuggestionsForMode:(uint64_t)a1 candidateNotifications:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "Unknown configuration type: %ld", (uint8_t *)&v2, 0xCu);
}

- (void)activeNotificationSuggestionsForMode:(os_log_t)log candidateNotifications:.cold.3(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  int v2 = "-[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:]";
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "%s: Failed to get the DND allow/silence list configuration for apps", (uint8_t *)&v1, 0xCu);
}

- (void)validateNotificationUrgency:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 bundleID];
  int v4 = 136315394;
  id v5 = "-[ATXNotificationInterruptionTuner validateNotificationUrgency:]";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "%s: Not sending suggestion for critical/time sensitive notification from app: %@", (uint8_t *)&v4, 0x16u);
}

@end