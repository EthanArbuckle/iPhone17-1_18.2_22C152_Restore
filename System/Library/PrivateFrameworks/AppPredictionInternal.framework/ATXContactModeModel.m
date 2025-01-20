@interface ATXContactModeModel
- (ATXContactModeModel)initWithMode:(unint64_t)a3 contactStore:(id)a4;
- (double)scoreFromContactFeatures:(id)a3;
- (id)contactKeysToFetch;
- (id)featuresToModel:(id)a3;
- (id)loadContactModeModel;
- (id)meContact;
- (id)modelName;
- (id)purgeDeletedContacts:(id)a3;
- (id)scoredEntities;
- (void)addNotificationsSignalsForIdentifier:(id)a3 toContactSpecificFeatures:(id)a4;
- (void)scoredEntities;
@end

@implementation ATXContactModeModel

- (ATXContactModeModel)initWithMode:(unint64_t)a3 contactStore:(id)a4
{
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)ATXContactModeModel;
  v8 = [(ATXContactModeModel *)&v25 init];
  v9 = v8;
  if (v8)
  {
    v8->_mode = a3;
    objc_storeStrong((id *)&v8->_contactStore, a4);
    uint64_t v10 = [(ATXContactModeModel *)v9 loadContactModeModel];
    contactModeModel = v9->_contactModeModel;
    v9->_contactModeModel = (MLModel *)v10;

    uint64_t v12 = [MEMORY[0x1E4F4AF60] cnContactIdsOfFavoriteContactsWithContactStore:v7];
    cnContactIdsOfFavoriteContacts = v9->_cnContactIdsOfFavoriteContacts;
    v9->_cnContactIdsOfFavoriteContacts = (NSSet *)v12;

    uint64_t v14 = [MEMORY[0x1E4F4AF60] vipContactEmailAddresses];
    vipContactEmailAddresses = v9->_vipContactEmailAddresses;
    v9->_vipContactEmailAddresses = (NSSet *)v14;

    uint64_t v16 = [MEMORY[0x1E4F4AF60] cnContactIdsOfEmergencyContacts];
    cnContactIdsOfEmergencyContacts = v9->_cnContactIdsOfEmergencyContacts;
    v9->_cnContactIdsOfEmergencyContacts = (NSSet *)v16;

    uint64_t v18 = [MEMORY[0x1E4F4AF60] cnContactIdsOfICloudFamilyMembers];
    cnContactIdsOfICloudFamilyMembers = v9->_cnContactIdsOfICloudFamilyMembers;
    v9->_cnContactIdsOfICloudFamilyMembers = (NSSet *)v18;

    uint64_t v20 = +[ATXModeEntityModelTrainer eventProviderForMode:v9->_mode];
    modeEventProvider = v9->_modeEventProvider;
    v9->_modeEventProvider = (ATXModeEntityEventProviderProtocol *)v20;

    uint64_t v22 = objc_opt_new();
    modeAffinityModelsConstants = v9->_modeAffinityModelsConstants;
    v9->_modeAffinityModelsConstants = (ATXModeAffinityModelsConstants *)v22;
  }
  return v9;
}

- (id)scoredEntities
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v4 = [[ATXInteractionEventProvider alloc] initWithContactStore:self->_contactStore];
  v5 = [[ATXModeEntityCorrelator alloc] initWithModeEventProvider:self->_modeEventProvider entityEventProvider:v4];
  v6 = [[ATXContactNotificationEngagementEventProvider alloc] initWithModeEventProvider:self->_modeEventProvider];
  contactNotificationEngagementEventProvider = self->_contactNotificationEngagementEventProvider;
  self->_contactNotificationEngagementEventProvider = v6;

  if (![(ATXContactNotificationEngagementEventProvider *)self->_contactNotificationEngagementEventProvider successfullyCalculatedNotificationEvents])
  {
    v8 = __atxlog_handle_modes();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ATXContactModeModel scoredEntities](v8);
    }
  }
  v9 = [(ATXModeEntityCorrelator *)v5 entityFeaturesForModeEntityScoring];
  uint64_t v10 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = ATXModeToString();
    *(_DWORD *)buf = 136315650;
    v29 = "-[ATXContactModeModel scoredEntities]";
    __int16 v30 = 2112;
    v31 = v11;
    __int16 v32 = 2048;
    uint64_t v33 = [v9 count];
    _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "%s: mode: '%@' returned %ld contacts from featurizer", buf, 0x20u);
  }
  [v9 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_253];
  uint64_t v12 = [(ATXContactModeModel *)self meContact];
  v13 = [[ATXStableContactRepresentationDatastore alloc] initWithContactStore:self->_contactStore];
  uint64_t v14 = [v12 identifier];
  v15 = [(ATXStableContactRepresentationDatastore *)v13 stableContactRepresentationForCnContactId:v14 rawIdentifier:0];
  uint64_t v16 = [v15 stableContactIdentifier];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __37__ATXContactModeModel_scoredEntities__block_invoke_24;
  v23[3] = &unk_1E68ABCF0;
  id v24 = v16;
  objc_super v25 = self;
  v26 = v13;
  id v17 = v3;
  id v27 = v17;
  uint64_t v18 = v13;
  id v19 = v16;
  [v9 enumerateKeysAndObjectsUsingBlock:v23];
  uint64_t v20 = v27;
  id v21 = v17;

  return v21;
}

void __37__ATXContactModeModel_scoredEntities__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __37__ATXContactModeModel_scoredEntities__block_invoke_cold_1((uint64_t)v4, v5, v6);
  }
}

void __37__ATXContactModeModel_scoredEntities__block_invoke_24(uint64_t a1, uint64_t a2, void *a3)
{
  id v26 = a3;
  id v4 = [v26 entity];
  id v5 = [v4 identifier];
  char v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if ((v6 & 1) == 0)
  {
    id v7 = [v26 entitySpecificFeatures];
    v8 = v7;
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = (id)objc_opt_new();
    }
    uint64_t v10 = v9;

    v11 = [v26 entity];
    objc_msgSend(v10, "setIsVIPContact:", objc_msgSend(v11, "isVIPContactGivenVIPs:contactStore:", *(void *)(*(void *)(a1 + 40) + 32), *(void *)(*(void *)(a1 + 40) + 80)));

    uint64_t v12 = *(void **)(a1 + 48);
    v13 = [v26 entity];
    uint64_t v14 = [v13 identifier];
    v15 = [v12 stableContactRepresentationForStableContactIdentifier:v14];
    uint64_t v16 = [v15 cnContactId];

    if (v16)
    {
      objc_msgSend(v10, "setIsICloudFamilyMember:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "containsObject:", v16));
      objc_msgSend(v10, "setIsEmergencyContact:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "containsObject:", v16));
      objc_msgSend(v10, "setIsFavoriteContact:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "containsObject:", v16));
      [*(id *)(a1 + 40) addNotificationsSignalsForIdentifier:v16 toContactSpecificFeatures:v10];
    }
    [v26 setEntitySpecificFeatures:v10];
    [*(id *)(a1 + 40) scoreFromContactFeatures:v26];
    double v18 = v17;
    id v19 = objc_opt_new();
    [v19 setScore:v18];
    uint64_t v20 = [v26 jsonRepresentation];
    [v19 setFeatureVector:v20];

    id v21 = [v26 entity];
    [v21 setScoreMetadata:v19];

    uint64_t v22 = *(void **)(a1 + 56);
    v23 = [v26 entity];
    id v24 = [v26 entity];
    objc_super v25 = [v24 identifier];
    [v22 setObject:v23 forKey:v25];
  }
}

- (void)addNotificationsSignalsForIdentifier:(id)a3 toContactSpecificFeatures:(id)a4
{
  char v6 = NSNumber;
  contactNotificationEngagementEventProvider = self->_contactNotificationEngagementEventProvider;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_msgSend(v6, "numberWithUnsignedInteger:", -[ATXContactNotificationEngagementEventProvider globalCountOfNotificationsClearedForContactId:](contactNotificationEngagementEventProvider, "globalCountOfNotificationsClearedForContactId:", v9));
  [v8 setGlobalCountOfNotificationsClearedForEntity:v10];

  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXContactNotificationEngagementEventProvider modeCountOfNotificationsClearedForContactId:](self->_contactNotificationEngagementEventProvider, "modeCountOfNotificationsClearedForContactId:", v9));
  [v8 setModeCountOfNotificationsClearedForEntity:v11];

  uint64_t v12 = NSNumber;
  [(ATXContactNotificationEngagementEventProvider *)self->_contactNotificationEngagementEventProvider localNotificationsClearedRateForContactId:v9];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  [v8 setLocalNotificationsClearedRateForEntity:v13];

  uint64_t v14 = NSNumber;
  [(ATXContactNotificationEngagementEventProvider *)self->_contactNotificationEngagementEventProvider globalNotificationsClearedRateForContactId:v9];
  v15 = objc_msgSend(v14, "numberWithDouble:");
  [v8 setGlobalNotificationsClearedRateForEntity:v15];

  uint64_t v16 = NSNumber;
  [(ATXContactNotificationEngagementEventProvider *)self->_contactNotificationEngagementEventProvider ratioOfLocalToGlobalNotificationsClearedRateForContactId:v9];
  double v17 = objc_msgSend(v16, "numberWithDouble:");
  [v8 setRatioOfLocalToGlobalNotificationsClearedRateForEntity:v17];

  double v18 = NSNumber;
  [(ATXContactNotificationEngagementEventProvider *)self->_contactNotificationEngagementEventProvider classConditionalOfNotificationsClearedForContactId:v9];
  id v19 = objc_msgSend(v18, "numberWithDouble:");
  [v8 setClassConditionalOfNotificationsClearedForEntity:v19];

  uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXContactNotificationEngagementEventProvider globalCountOfNotificationsReceivedForContactId:](self->_contactNotificationEngagementEventProvider, "globalCountOfNotificationsReceivedForContactId:", v9));
  [v8 setGlobalCountOfNotificationsReceivedForEntity:v20];

  id v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXContactNotificationEngagementEventProvider modeCountOfNotificationsReceivedForContactId:](self->_contactNotificationEngagementEventProvider, "modeCountOfNotificationsReceivedForContactId:", v9));
  [v8 setModeCountOfNotificationsReceivedForEntity:v21];

  uint64_t v22 = NSNumber;
  [(ATXContactNotificationEngagementEventProvider *)self->_contactNotificationEngagementEventProvider localPopularityOfNotificationsReceivedForContactId:v9];
  v23 = objc_msgSend(v22, "numberWithDouble:");
  [v8 setLocalPopularityOfNotificationsReceivedForEntity:v23];

  id v24 = NSNumber;
  [(ATXContactNotificationEngagementEventProvider *)self->_contactNotificationEngagementEventProvider globalPopularityOfNotificationsReceivedForContactId:v9];
  objc_super v25 = objc_msgSend(v24, "numberWithDouble:");
  [v8 setGlobalPopularityOfNotificationsReceivedForEntity:v25];

  id v26 = NSNumber;
  [(ATXContactNotificationEngagementEventProvider *)self->_contactNotificationEngagementEventProvider ratioOfLocalToGlobalPopularityOfNotificationsReceivedForContactId:v9];
  id v27 = objc_msgSend(v26, "numberWithDouble:");
  [v8 setRatioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity:v27];

  v28 = NSNumber;
  [(ATXContactNotificationEngagementEventProvider *)self->_contactNotificationEngagementEventProvider classConditionalOfNotificationsReceivedForContactId:v9];
  double v30 = v29;

  id v31 = [v28 numberWithDouble:v30];
  [v8 setClassConditionalOfNotificationsReceivedForEntity:v31];
}

- (id)meContact
{
  contactStore = self->_contactStore;
  v3 = [(ATXContactModeModel *)self contactKeysToFetch];
  id v14 = 0;
  id v4 = [(CNContactStore *)contactStore _crossPlatformUnifiedMeContactWithKeysToFetch:v3 error:&v14];
  id v5 = v14;

  if (v5)
  {
    char v6 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(ATXContactModeDenyListModel *)(uint64_t)v5 meContact];
    }
  }
  return v4;
}

- (id)contactKeysToFetch
{
  v5[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F1AEE0];
  v5[0] = *MEMORY[0x1E4F1AE08];
  v5[1] = v2;
  v5[2] = *MEMORY[0x1E4F1ADC8];
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  return v3;
}

- (id)featuresToModel:(id)a3
{
  id v4 = a3;
  id v5 = [v4 entitySpecificFeatures];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v7 = __atxlog_handle_modes();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[ATXContactModeModel featuresToModel:](v7);
    }
  }
  uint64_t v8 = [v4 entitySpecificFeatures];
  uint64_t v9 = NSNumber;
  [v4 classConditionalProbability];
  v39 = objc_msgSend(v9, "numberWithDouble:");
  uint64_t v10 = NSNumber;
  [v4 posteriorProbability];
  v40 = objc_msgSend(v10, "numberWithDouble:");
  uint64_t v11 = NSNumber;
  [v4 globalPopularity];
  v37 = objc_msgSend(v11, "numberWithDouble:");
  uint64_t v12 = NSNumber;
  [v4 modePopularity];
  v38 = objc_msgSend(v12, "numberWithDouble:");
  v28 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "entityOccurredGloballyOverLastNDays:", -[ATXModeAffinityModelsConstants numOfDaysToComputeEntityOccurenceFeaturesForContacts](self->_modeAffinityModelsConstants, "numOfDaysToComputeEntityOccurenceFeaturesForContacts")));
  id v27 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "entityOccurredInModeOverLastNDays:", -[ATXModeAffinityModelsConstants numOfDaysToComputeEntityOccurenceFeaturesForContacts](self->_modeAffinityModelsConstants, "numOfDaysToComputeEntityOccurenceFeaturesForContacts")));
  v36 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isFavoriteContact"));
  v35 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isVIPContact"));
  uint64_t v34 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isEmergencyContact"));
  uint64_t v33 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isICloudFamilyMember"));
  v13 = NSNumber;
  [v4 ratioModeAndGlobalPopularity];
  double v15 = v14;

  v23 = [v13 numberWithDouble:v15];
  __int16 v32 = [v8 globalCountOfNotificationsReceivedForEntity];
  id v31 = [v8 modeCountOfNotificationsReceivedForEntity];
  double v30 = [v8 localPopularityOfNotificationsReceivedForEntity];
  double v29 = [v8 globalPopularityOfNotificationsReceivedForEntity];
  uint64_t v16 = [v8 ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity];
  double v17 = [v8 classConditionalOfNotificationsReceivedForEntity];
  double v18 = [v8 globalCountOfNotificationsClearedForEntity];
  id v19 = [v8 modeCountOfNotificationsClearedForEntity];
  id v24 = [v8 localNotificationsClearedRateForEntity];
  objc_super v25 = [v8 globalNotificationsClearedRateForEntity];
  id v26 = [v8 ratioOfLocalToGlobalNotificationsClearedRateForEntity];
  uint64_t v20 = [v8 classConditionalOfNotificationsClearedForEntity];
  id v21 = objc_opt_new();
  [v21 setObject:v39 forKey:@"classConditionalProbability"];
  [v21 setObject:v40 forKey:@"posteriorProbability"];
  [v21 setObject:v37 forKey:@"globalPopularity"];
  [v21 setObject:v38 forKey:@"modePopularity"];
  [v21 setObject:v28 forKey:@"contactEngagedGloballyOverLastNDays"];
  [v21 setObject:v27 forKey:@"contactEngagedInModeOverLastNDays"];
  [v21 setObject:v36 forKey:@"contactIsFavorite"];
  [v21 setObject:v35 forKey:@"contactIsVIP"];
  [v21 setObject:v34 forKey:@"contactIsEmergency"];
  [v21 setObject:v33 forKey:@"contactIsICloudFamilyMember"];
  [v21 setObject:v23 forKey:@"ratioOfModePopularityToGlobalPopularityOfEntity"];
  [v21 setObject:v32 forKey:@"globalCountOfNotificationsReceivedForEntity"];
  [v21 setObject:v31 forKey:@"modeCountOfNotificationsReceivedForEntity"];
  [v21 setObject:v30 forKey:@"localPopularityOfNotificationsReceivedForEntity"];
  [v21 setObject:v29 forKey:@"globalPopularityOfNotificationsReceivedForEntity"];
  [v21 setObject:v16 forKey:@"ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity"];
  [v21 setObject:v17 forKey:@"classConditionalOfNotificationsReceivedForEntity"];
  [v21 setObject:v18 forKey:@"globalCountOfNotificationsClearedForEntity"];
  [v21 setObject:v19 forKey:@"modeCountOfNotificationsClearedForEntity"];
  [v21 setObject:v24 forKey:@"localNotificationsClearedRateForEntity"];
  [v21 setObject:v25 forKey:@"globalNotificationsClearedRateForEntity"];
  [v21 setObject:v26 forKey:@"ratioOfLocalToGlobalNotificationsClearedRateForEntity"];
  [v21 setObject:v20 forKey:@"classConditionalOfNotificationsClearedForEntity"];

  return v21;
}

- (id)modelName
{
  return @"ATXContactModeAllowListModel";
}

- (id)loadContactModeModel
{
  v3 = objc_opt_new();
  id v4 = [(ATXContactModeModel *)self modelName];
  id v5 = [v3 loadCoreMLModelFromTrialWithName:v4];

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    uint64_t v7 = [(ATXContactModeModel *)self modelName];
    id v6 = +[ATXCoreMLUtilities loadCoreMLModelWithName:v7];
  }
  return v6;
}

- (double)scoreFromContactFeatures:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)[v4 uniqueOccurrencesInMode] > 2)
  {
    if (!self->_contactModeModel)
    {
      double v6 = 0.0;
      goto LABEL_16;
    }
    id v10 = objc_alloc(MEMORY[0x1E4F1E930]);
    uint64_t v11 = [(ATXContactModeModel *)self featuresToModel:v4];
    id v32 = 0;
    uint64_t v7 = (void *)[v10 initWithDictionary:v11 error:&v32];
    id v12 = v32;

    if (v12)
    {
      v13 = __atxlog_handle_modes();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ATXContactModeModel scoreFromContactFeatures:]((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }
    contactModeModel = self->_contactModeModel;
    id v31 = v12;
    uint64_t v9 = [(MLModel *)contactModeModel predictionFromFeatures:v7 error:&v31];
    id v5 = v31;

    if (v5)
    {
      id v21 = __atxlog_handle_modes();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[ATXContactModeModel scoreFromContactFeatures:]((uint64_t)v5, v21, v22, v23, v24, v25, v26, v27);
      }
    }
    v28 = [v9 featureValueForName:@"classProbability"];
    +[ATXCoreMLUtilities scoreForModelOutputValue:v28 outputIndexedSubscript:1];
    double v6 = v29;

    goto LABEL_14;
  }
  id v5 = __atxlog_handle_notification_management();
  double v6 = 0.0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v4 entityDescription];
    uint64_t v8 = [v4 uniqueOccurrencesInMode];
    uint64_t v9 = ATXModeToString();
    *(_DWORD *)buf = 136315907;
    uint64_t v34 = "-[ATXContactModeModel scoreFromContactFeatures:]";
    __int16 v35 = 2117;
    v36 = v7;
    __int16 v37 = 2048;
    uint64_t v38 = v8;
    __int16 v39 = 2112;
    v40 = v9;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%s: contact '%{sensitive}@' only had %ld < 3 unique occurrences in mode: '%@' so setting score to zero", buf, 0x2Au);
LABEL_14:
  }
LABEL_16:

  return v6;
}

- (id)purgeDeletedContacts:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  double v6 = [[ATXStableContactRepresentationDatastore alloc] initWithContactStore:self->_contactStore];
  contactStore = self->_contactStore;
  id v8 = objc_alloc(MEMORY[0x1E4F1B908]);
  v23[0] = *MEMORY[0x1E4F1AE08];
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  id v10 = (void *)[v8 initWithKeysToFetch:v9];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __44__ATXContactModeModel_purgeDeletedContacts___block_invoke;
  v19[3] = &unk_1E68AE580;
  uint64_t v20 = v6;
  id v11 = v4;
  id v21 = v11;
  id v12 = v5;
  id v22 = v12;
  v13 = v6;
  [(CNContactStore *)contactStore enumerateContactsWithFetchRequest:v10 error:0 usingBlock:v19];

  uint64_t v14 = [v12 count];
  if (v14 != [v11 count])
  {
    uint64_t v15 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      [(ATXContactModeModel *)v11 purgeDeletedContacts:v15];
    }
  }
  uint64_t v16 = v22;
  id v17 = v12;

  return v17;
}

void __44__ATXContactModeModel_purgeDeletedContacts___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [a2 identifier];
  id v5 = [v3 stableContactRepresentationForCnContactId:v4 rawIdentifier:0];
  id v8 = [v5 stableContactIdentifier];

  double v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];

  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
    [*(id *)(a1 + 48) setObject:v7 forKeyedSubscript:v8];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_modeAffinityModelsConstants, 0);
  objc_storeStrong((id *)&self->_modeEventProvider, 0);
  objc_storeStrong((id *)&self->_contactNotificationEngagementEventProvider, 0);
  objc_storeStrong((id *)&self->_cnContactIdsOfICloudFamilyMembers, 0);
  objc_storeStrong((id *)&self->_cnContactIdsOfEmergencyContacts, 0);
  objc_storeStrong((id *)&self->_vipContactEmailAddresses, 0);
  objc_storeStrong((id *)&self->_cnContactIdsOfFavoriteContacts, 0);
  objc_storeStrong((id *)&self->_contactModeModel, 0);
}

- (void)scoredEntities
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXContactModeModel: There was an error in calculating notification events from ATXContactNotificationEngagementEventProvider", v1, 2u);
}

void __37__ATXContactModeModel_scoredEntities__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = [a2 debugDescription];
  double v6 = [v5 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F2740B58];
  int v7 = 136315651;
  id v8 = "-[ATXContactModeModel scoredEntities]_block_invoke";
  __int16 v9 = 2117;
  uint64_t v10 = a1;
  __int16 v11 = 2117;
  id v12 = v6;
  _os_log_debug_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_DEBUG, "  %s: contactId: '%{sensitive}@' features: '%{sensitive}@'", (uint8_t *)&v7, 0x20u);
}

- (void)featuresToModel:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "contactFeatures.entitySpecificFeatures is not a subclass for ATXContactEntityFeatures", v1, 2u);
}

- (void)scoreFromContactFeatures:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)scoreFromContactFeatures:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)purgeDeletedContacts:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 count];
  int v6 = 136315394;
  int v7 = "-[ATXContactModeModel purgeDeletedContacts:]";
  __int16 v8 = 2048;
  uint64_t v9 = v5 - [a2 count];
  _os_log_debug_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_DEBUG, "%s: Filtered out %ld deleted contacts", (uint8_t *)&v6, 0x16u);
}

@end