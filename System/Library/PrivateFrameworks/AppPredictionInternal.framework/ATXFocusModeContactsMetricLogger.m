@interface ATXFocusModeContactsMetricLogger
- (ATXFocusModeContactsMetricLogger)initWithContactStore:(id)a3;
- (id)_contactScoresForDenyListForMode:(unint64_t)a3;
- (id)_contactScoresForMode:(unint64_t)a3;
- (id)fetchRelevantContactIdsWithModeConfigurationUIFlowLoggingEvent:(id)a3 suggestedEntities:(id)a4 candidateEntities:(id)a5 currentEntities:(id)a6;
- (id)metricFieldsToFeatureNames;
- (void)addContactEntitySpecificFeatures:(id)a3 toMetric:(id)a4;
- (void)logFocusModeContactSignalsWithModeConfigurationUIFlowLoggingEvent:(id)a3 xpcActivity:(id)a4;
- (void)populateContactModeAffinitySignalsForMode:(unint64_t)a3 contactId:(id)a4 metric:(id)a5;
- (void)populateContactModeDenyListSignalsForMode:(unint64_t)a3 contactId:(id)a4 metric:(id)a5;
@end

@implementation ATXFocusModeContactsMetricLogger

- (ATXFocusModeContactsMetricLogger)initWithContactStore:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ATXFocusModeContactsMetricLogger;
  v6 = [(ATXFocusModeContactsMetricLogger *)&v21 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactStore, a3);
    uint64_t v8 = objc_opt_new();
    cachedContactScores = v7->_cachedContactScores;
    v7->_cachedContactScores = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    cachedContactScoresForDenyList = v7->_cachedContactScoresForDenyList;
    v7->_cachedContactScoresForDenyList = (NSMutableDictionary *)v10;

    uint64_t v12 = [MEMORY[0x1E4F4AF78] sharedInstance];
    modeConfigClient = v7->_modeConfigClient;
    v7->_modeConfigClient = (ATXDNDModeConfigurationClient *)v12;

    uint64_t v14 = [MEMORY[0x1E4F4B180] sharedInstance];
    modeEntityTrialClientWrapper = v7->_modeEntityTrialClientWrapper;
    v7->_modeEntityTrialClientWrapper = (ATXModeEntityTrialClientWrapper *)v14;

    v16 = [[ATXStableContactRepresentationDatastore alloc] initWithContactStore:v5];
    stableContactRepresentationDatastore = v7->_stableContactRepresentationDatastore;
    v7->_stableContactRepresentationDatastore = v16;

    uint64_t v18 = objc_opt_new();
    modeAffinityModelsConstants = v7->_modeAffinityModelsConstants;
    v7->_modeAffinityModelsConstants = (ATXModeAffinityModelsConstants *)v18;
  }
  return v7;
}

- (void)logFocusModeContactSignalsWithModeConfigurationUIFlowLoggingEvent:(id)a3 xpcActivity:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 modeConfigurationEntityType] == 1)
  {
    modeConfigClient = self->_modeConfigClient;
    v9 = [v6 dndModeUUID];
    uint64_t v10 = [(ATXDNDModeConfigurationClient *)modeConfigClient atxModeForDNDMode:v9];

    if (v10)
    {
      v11 = [(ATXDNDModeConfigurationClient *)self->_modeConfigClient dndSemanticTypeForATXMode:v10];
      uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
      v13 = [v6 currentEntityIdentifiers];
      uint64_t v14 = [v12 setWithArray:v13];

      v15 = (void *)MEMORY[0x1E4F1CAD0];
      v16 = [v6 suggestedEntityIdentifiers];
      uint64_t v17 = [v15 setWithArray:v16];

      uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
      v19 = [v6 candidateEntityIdentifiers];
      uint64_t v20 = [v18 setWithArray:v19];

      v50 = (void *)v17;
      v41 = (void *)v20;
      objc_super v21 = [(ATXFocusModeContactsMetricLogger *)self fetchRelevantContactIdsWithModeConfigurationUIFlowLoggingEvent:v6 suggestedEntities:v17 candidateEntities:v20 currentEntities:v14];
      v38 = v11;
      if (v11)
      {
        v49 = -[ATXDNDModeConfigurationClient iOSContactDenyListForMode:](self->_modeConfigClient, "iOSContactDenyListForMode:", objc_msgSend(v11, "integerValue", v11));
        v48 = -[ATXDNDModeConfigurationClient iOSContactAllowListForMode:](self->_modeConfigClient, "iOSContactAllowListForMode:", [v11 integerValue]);
      }
      else
      {
        v48 = (void *)MEMORY[0x1E4F1CBF0];
        v49 = (void *)MEMORY[0x1E4F1CBF0];
      }
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id obj = v21;
      v22 = (void *)v20;
      uint64_t v47 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
      if (v47)
      {
        uint64_t v39 = 0;
        uint64_t v45 = *(void *)v52;
        uint64_t v40 = v10;
        while (2)
        {
          uint64_t v23 = 0;
          uint64_t v46 = v39 + 1;
          v39 += v47;
          do
          {
            if (*(void *)v52 != v45) {
              objc_enumerationMutation(obj);
            }
            uint64_t v24 = *(void *)(*((void *)&v51 + 1) + 8 * v23);
            v25 = objc_opt_new();
            [v25 setFocusMode:v10];
            if (([v49 containsObject:v24] & 1) != 0 || objc_msgSend(v6, "modeConfigurationType") == 1) {
              objc_msgSend(v25, "setActiveConfigurationType:", @"DenyList", v38);
            }
            if ((objc_msgSend(v48, "containsObject:", v24, v38) & 1) != 0 || !objc_msgSend(v6, "modeConfigurationType")) {
              [v25 setActiveConfigurationType:@"AllowList"];
            }
            v26 = [(ATXModeEntityTrialClientWrapper *)self->_modeEntityTrialClientWrapper trialExperimentId];
            [v25 setExperimentId:v26];

            v27 = objc_msgSend(NSNumber, "numberWithInt:", -[ATXModeEntityTrialClientWrapper trialDeploymentId](self->_modeEntityTrialClientWrapper, "trialDeploymentId"));
            [v25 setDeploymentId:v27];

            v28 = [(ATXModeEntityTrialClientWrapper *)self->_modeEntityTrialClientWrapper trialTreatmentId];
            [v25 setTreatmentId:v28];

            objc_msgSend(v25, "setIsContactCandidateSuggestion:", objc_msgSend(v22, "containsObject:", v24));
            objc_msgSend(v25, "setIsContactRecommendedSuggestion:", objc_msgSend(v50, "containsObject:", v24));
            if (([v50 containsObject:v24] & 1) != 0
              || [v22 containsObject:v24])
            {
              [v25 setWasContactSuggestedDuringModeSetup:1];
            }
            objc_msgSend(v25, "setWasContactSuggestionDuringModeSetupAccepted:", objc_msgSend(v14, "containsObject:", v24));
            if (![v6 modeConfigurationType]) {
              [(ATXFocusModeContactsMetricLogger *)self populateContactModeAffinitySignalsForMode:v10 contactId:v24 metric:v25];
            }
            if ([v6 modeConfigurationType] == 1) {
              [(ATXFocusModeContactsMetricLogger *)self populateContactModeDenyListSignalsForMode:v10 contactId:v24 metric:v25];
            }
            v29 = __atxlog_handle_modes();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              v30 = objc_opt_class();
              id v44 = v30;
              v31 = NSStringFromSelector(a2);
              [v25 coreAnalyticsDictionary];
              v32 = self;
              id v33 = v6;
              v34 = v14;
              v36 = id v35 = v7;
              *(_DWORD *)buf = 138412802;
              v56 = v30;
              __int16 v57 = 2112;
              v58 = v31;
              __int16 v59 = 2112;
              v60 = v36;
              _os_log_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_INFO, "[%@][%@] Logging: %@", buf, 0x20u);

              id v7 = v35;
              uint64_t v14 = v34;
              id v6 = v33;
              self = v32;
              uint64_t v10 = v40;

              v22 = v41;
            }

            [v25 logToCoreAnalytics];
            if ((unint64_t)(v46 + v23) > 0x13)
            {

              goto LABEL_32;
            }
            char v37 = [v7 didDefer];

            if (v37) {
              goto LABEL_32;
            }
            ++v23;
          }
          while (v47 != v23);
          uint64_t v47 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
          if (v47) {
            continue;
          }
          break;
        }
      }
LABEL_32:
    }
  }
}

- (void)populateContactModeAffinitySignalsForMode:(unint64_t)a3 contactId:(id)a4 metric:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(ATXFocusModeContactsMetricLogger *)self _contactScoresForMode:a3];
  v11 = [(ATXStableContactRepresentationDatastore *)self->_stableContactRepresentationDatastore stableContactRepresentationForCnContactId:v8 rawIdentifier:0];
  uint64_t v12 = [v11 stableContactIdentifier];

  if (v12)
  {
    v13 = [v10 objectForKeyedSubscript:v12];

    if (v13)
    {
      id v33 = v10;
      id v34 = v8;
      v32 = v12;
      uint64_t v14 = [v10 objectForKeyedSubscript:v12];
      v15 = [v14 scoreMetadata];
      v16 = [v15 featureVector];

      id v30 = [[ATXModeEntityScoringFeatures alloc] initFromJSON:v16];
      v31 = v14;
      uint64_t v17 = NSNumber;
      uint64_t v18 = [v14 scoreMetadata];
      [v18 score];
      v19 = objc_msgSend(v17, "numberWithDouble:");
      [v9 setEntityModeEntityScore:v19];

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v20 = [(ATXFocusModeContactsMetricLogger *)self metricFieldsToFeatureNames];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v36;
        do
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v36 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void *)(*((void *)&v35 + 1) + 8 * v24);
            v26 = [(ATXFocusModeContactsMetricLogger *)self metricFieldsToFeatureNames];
            v27 = [v26 objectForKeyedSubscript:v25];

            if (v27)
            {
              v28 = [v16 objectForKeyedSubscript:v27];

              if (v28)
              {
                v29 = [v16 objectForKeyedSubscript:v27];
                [v9 setValue:v29 forKey:v25];
              }
            }

            ++v24;
          }
          while (v22 != v24);
          uint64_t v22 = [v20 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v22);
      }

      [(ATXFocusModeContactsMetricLogger *)self addContactEntitySpecificFeatures:v30 toMetric:v9];
      uint64_t v10 = v33;
      id v8 = v34;
      uint64_t v12 = v32;
    }
  }
}

- (void)populateContactModeDenyListSignalsForMode:(unint64_t)a3 contactId:(id)a4 metric:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(ATXFocusModeContactsMetricLogger *)self _contactScoresForDenyListForMode:a3];
  v11 = [(ATXStableContactRepresentationDatastore *)self->_stableContactRepresentationDatastore stableContactRepresentationForCnContactId:v8 rawIdentifier:0];
  uint64_t v12 = [v11 stableContactIdentifier];

  if (v12)
  {
    v13 = [v10 objectForKeyedSubscript:v12];

    if (v13)
    {
      id v33 = v10;
      id v34 = v8;
      v32 = v12;
      uint64_t v14 = [v10 objectForKeyedSubscript:v12];
      v15 = [v14 scoreMetadata];
      v16 = [v15 featureVector];

      id v30 = [[ATXModeEntityScoringFeatures alloc] initFromJSON:v16];
      v31 = v14;
      uint64_t v17 = NSNumber;
      uint64_t v18 = [v14 scoreMetadata];
      [v18 score];
      v19 = objc_msgSend(v17, "numberWithDouble:");
      [v9 setEntityModeEntityScore:v19];

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v20 = [(ATXFocusModeContactsMetricLogger *)self metricFieldsToFeatureNames];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v36;
        do
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v36 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void *)(*((void *)&v35 + 1) + 8 * v24);
            v26 = [(ATXFocusModeContactsMetricLogger *)self metricFieldsToFeatureNames];
            v27 = [v26 objectForKeyedSubscript:v25];

            if (v27)
            {
              v28 = [v16 objectForKeyedSubscript:v27];

              if (v28)
              {
                v29 = [v16 objectForKeyedSubscript:v27];
                [v9 setValue:v29 forKey:v25];
              }
            }

            ++v24;
          }
          while (v22 != v24);
          uint64_t v22 = [v20 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v22);
      }

      [(ATXFocusModeContactsMetricLogger *)self addContactEntitySpecificFeatures:v30 toMetric:v9];
      uint64_t v10 = v33;
      id v8 = v34;
      uint64_t v12 = v32;
    }
  }
}

- (void)addContactEntitySpecificFeatures:(id)a3 toMetric:(id)a4
{
  modeAffinityModelsConstants = self->_modeAffinityModelsConstants;
  id v7 = a4;
  id v8 = a3;
  objc_msgSend(v7, "setContactEngagedGloballyOverLastNDays:", objc_msgSend(v8, "entityOccurredGloballyOverLastNDays:", -[ATXModeAffinityModelsConstants numOfDaysToComputeEntityOccurenceFeaturesForContacts](modeAffinityModelsConstants, "numOfDaysToComputeEntityOccurenceFeaturesForContacts")));
  objc_msgSend(v7, "setContactEngagedInModeOverLastNDays:", objc_msgSend(v8, "entityOccurredInModeOverLastNDays:", -[ATXModeAffinityModelsConstants numOfDaysToComputeEntityOccurenceFeaturesForContacts](self->_modeAffinityModelsConstants, "numOfDaysToComputeEntityOccurenceFeaturesForContacts")));
  id v21 = [v8 entitySpecificFeatures];

  objc_msgSend(v7, "setContactIsFavorite:", objc_msgSend(v21, "isFavoriteContact"));
  objc_msgSend(v7, "setContactIsVIP:", objc_msgSend(v21, "isVIPContact"));
  objc_msgSend(v7, "setContactIsEmergency:", objc_msgSend(v21, "isEmergencyContact"));
  objc_msgSend(v7, "setContactIsiCloudFamilyMember:", objc_msgSend(v21, "isICloudFamilyMember"));
  id v9 = [v21 modeCountOfNotificationsClearedForEntity];
  [v7 setNotificationsClearedInMode:v9];

  uint64_t v10 = [v21 globalCountOfNotificationsClearedForEntity];
  [v7 setNotificationsClearedGlobally:v10];

  v11 = [v21 localNotificationsClearedRateForEntity];
  [v7 setLocalNotificationsClearedRateForEntity:v11];

  uint64_t v12 = [v21 globalNotificationsClearedRateForEntity];
  [v7 setGlobalNotificationsClearedRateForEntity:v12];

  v13 = [v21 ratioOfLocalToGlobalNotificationsClearedRateForEntity];
  [v7 setRatioOfLocalToGlobalNotificationsClearedRateForEntity:v13];

  uint64_t v14 = [v21 classConditionalOfNotificationsClearedForEntity];
  [v7 setClassConditionalOfNotificationsClearedForEntity:v14];

  v15 = [v21 globalCountOfNotificationsReceivedForEntity];
  [v7 setNotificationsReceivedGlobally:v15];

  v16 = [v21 modeCountOfNotificationsReceivedForEntity];
  [v7 setNotificationsReceivedInMode:v16];

  uint64_t v17 = [v21 localPopularityOfNotificationsReceivedForEntity];
  [v7 setLocalPopularityOfNotificationsReceivedForEntity:v17];

  uint64_t v18 = [v21 globalPopularityOfNotificationsReceivedForEntity];
  [v7 setGlobalPopularityOfNotificationsReceivedForEntity:v18];

  v19 = [v21 ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity];
  [v7 setRatioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity:v19];

  uint64_t v20 = [v21 classConditionalOfNotificationsReceivedForEntity];
  [v7 setClassConditionalOfNotificationsReceivedForEntity:v20];
}

- (id)fetchRelevantContactIdsWithModeConfigurationUIFlowLoggingEvent:(id)a3 suggestedEntities:(id)a4 candidateEntities:(id)a5 currentEntities:(id)a6
{
  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = [a3 previousEntityIdentifiers];
  uint64_t v14 = [v9 setWithArray:v13];

  v15 = [v12 setByAddingObjectsFromSet:v11];

  v16 = [v10 setByAddingObjectsFromSet:v15];
  uint64_t v17 = (void *)[v16 mutableCopy];

  [v17 minusSet:v14];
  uint64_t v18 = (void *)[v14 mutableCopy];
  [v18 minusSet:v10];

  v19 = [v18 allObjects];
  [v17 addObjectsFromArray:v19];

  return v17;
}

- (id)metricFieldsToFeatureNames
{
  return &unk_1F27F3BF0;
}

- (id)_contactScoresForMode:(unint64_t)a3
{
  cachedContactScores = self->_cachedContactScores;
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v7 = [(NSMutableDictionary *)cachedContactScores objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = self->_cachedContactScores;
    id v9 = [NSNumber numberWithUnsignedInteger:a3];
    id v10 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v9];
  }
  else
  {
    id v9 = [[ATXContactModeModel alloc] initWithMode:a3 contactStore:self->_contactStore];
    id v11 = [(ATXContactModeModel *)v9 scoredEntities];
    id v12 = self->_cachedContactScores;
    v13 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:v13];

    uint64_t v14 = self->_cachedContactScores;
    v15 = [NSNumber numberWithUnsignedInteger:a3];
    id v10 = [(NSMutableDictionary *)v14 objectForKeyedSubscript:v15];
  }
  return v10;
}

- (id)_contactScoresForDenyListForMode:(unint64_t)a3
{
  cachedContactScoresForDenyList = self->_cachedContactScoresForDenyList;
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v7 = [(NSMutableDictionary *)cachedContactScoresForDenyList objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = self->_cachedContactScoresForDenyList;
    id v9 = [NSNumber numberWithUnsignedInteger:a3];
    id v10 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v9];
  }
  else
  {
    id v9 = [[ATXContactModeDenyListModel alloc] initWithMode:a3 contactStore:self->_contactStore];
    id v11 = [(ATXContactModeDenyListModel *)v9 scoredEntities];
    id v12 = self->_cachedContactScoresForDenyList;
    v13 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:v13];

    uint64_t v14 = self->_cachedContactScoresForDenyList;
    v15 = [NSNumber numberWithUnsignedInteger:a3];
    id v10 = [(NSMutableDictionary *)v14 objectForKeyedSubscript:v15];
  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeAffinityModelsConstants, 0);
  objc_storeStrong((id *)&self->_stableContactRepresentationDatastore, 0);
  objc_storeStrong((id *)&self->_modeEntityTrialClientWrapper, 0);
  objc_storeStrong((id *)&self->_modeConfigClient, 0);
  objc_storeStrong((id *)&self->_cachedContactScoresForDenyList, 0);
  objc_storeStrong((id *)&self->_cachedContactScores, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end