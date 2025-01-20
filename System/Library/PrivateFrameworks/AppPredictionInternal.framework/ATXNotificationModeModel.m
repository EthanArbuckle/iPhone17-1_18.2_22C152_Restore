@interface ATXNotificationModeModel
- (ATXNotificationModeModel)initWithMode:(unint64_t)a3 contactStore:(id)a4;
- (double)scoreFromEngagementFeatures:(id)a3 dismissalFeatures:(id)a4 hiddenFeatures:(id)a5 clearedFeatures:(id)a6 expiredFeatures:(id)a7 scoredApp:(id)a8 scoredContact:(id)a9;
- (id)modeEntityScoreFromEngagementFeatures:(id)a3 dismissalFeatures:(id)a4 hiddenFeatures:(id)a5 clearedFeatures:(id)a6 expiredFeatures:(id)a7 scoredApp:(id)a8 scoredContact:(id)a9;
- (id)scoredEntitiesWithScoredAppEntities:(id)a3 scoredContactEntities:(id)a4;
- (void)addSubFeaturesToFeatureDict:(id)a3 subFeatures:(id)a4 prefix:(id)a5;
@end

@implementation ATXNotificationModeModel

- (ATXNotificationModeModel)initWithMode:(unint64_t)a3 contactStore:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ATXNotificationModeModel;
  v8 = [(ATXNotificationModeModel *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_mode = a3;
    uint64_t v10 = objc_opt_new();
    notificationModeEntityModelWeights = v9->_notificationModeEntityModelWeights;
    v9->_notificationModeEntityModelWeights = (ATXNotificationModeEntityModelWeights *)v10;

    objc_storeStrong((id *)&v9->_contactStore, a4);
  }

  return v9;
}

- (id)scoredEntitiesWithScoredAppEntities:(id)a3 scoredContactEntities:(id)a4
{
  id v6 = a3;
  id v39 = a4;
  context = (void *)MEMORY[0x1D25F6CC0]();
  v37 = objc_opt_new();
  uint64_t v7 = +[ATXModeEntityModelTrainer eventProviderForMode:self->_mode];
  v51 = [[ATXNotificationEventProvider alloc] initWithEventType:1 contactStore:self->_contactStore];
  v50 = [[ATXModeEntityCorrelator alloc] initWithModeEventProvider:v7 entityEventProvider:v51];
  v36 = [(ATXModeEntityCorrelator *)v50 entityFeaturesForModeEntityScoring];
  v49 = [[ATXNotificationEventProvider alloc] initWithEventType:8 contactStore:self->_contactStore];
  v48 = [[ATXModeEntityCorrelator alloc] initWithModeEventProvider:v7 entityEventProvider:v49];
  v8 = [(ATXModeEntityCorrelator *)v48 entityFeaturesForModeEntityScoring];
  v47 = [[ATXNotificationEventProvider alloc] initWithEventType:6 contactStore:self->_contactStore];
  v9 = (void *)v7;
  v46 = [[ATXModeEntityCorrelator alloc] initWithModeEventProvider:v7 entityEventProvider:v47];
  uint64_t v10 = [(ATXModeEntityCorrelator *)v46 entityFeaturesForModeEntityScoring];
  v45 = [[ATXNotificationEventProvider alloc] initWithEventType:3 contactStore:self->_contactStore];
  v44 = v9;
  v43 = [[ATXModeEntityCorrelator alloc] initWithModeEventProvider:v9 entityEventProvider:v45];
  v11 = [(ATXModeEntityCorrelator *)v43 entityFeaturesForModeEntityScoring];
  v42 = [[ATXNotificationEventProvider alloc] initWithEventType:10 contactStore:self->_contactStore];
  v41 = [[ATXModeEntityCorrelator alloc] initWithModeEventProvider:v9 entityEventProvider:v42];
  v12 = [(ATXModeEntityCorrelator *)v41 entityFeaturesForModeEntityScoring];
  objc_super v13 = objc_opt_new();
  v14 = objc_opt_new();
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __86__ATXNotificationModeModel_scoredEntitiesWithScoredAppEntities_scoredContactEntities___block_invoke;
  v62[3] = &unk_1E68B51E8;
  id v35 = v8;
  id v63 = v35;
  id v15 = v10;
  id v64 = v15;
  id v16 = v11;
  id v65 = v16;
  id v17 = v12;
  id v66 = v17;
  id v67 = v13;
  id v18 = v6;
  id v68 = v18;
  id v69 = v14;
  id v40 = v39;
  id v70 = v40;
  v71 = self;
  id v19 = v37;
  id v72 = v19;
  id v38 = v14;
  id v20 = v13;
  [v36 enumerateKeysAndObjectsUsingBlock:v62];
  id v21 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v22 = [v18 allKeys];
  v23 = (void *)[v21 initWithArray:v22];

  v24 = v20;
  [v23 minusSet:v20];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __86__ATXNotificationModeModel_scoredEntitiesWithScoredAppEntities_scoredContactEntities___block_invoke_2;
  v53[3] = &unk_1E68B5210;
  id v25 = v18;
  id v54 = v25;
  id v55 = v36;
  id v56 = v35;
  id v57 = v15;
  id v58 = v16;
  id v59 = v17;
  v60 = self;
  id v26 = v19;
  id v61 = v26;
  id v27 = v17;
  id v28 = v16;
  id v29 = v15;
  id v30 = v35;
  id v31 = v36;
  [v23 enumerateObjectsUsingBlock:v53];
  v32 = v61;
  id v33 = v26;

  return v33;
}

void __86__ATXNotificationModeModel_scoredEntitiesWithScoredAppEntities_scoredContactEntities___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v36 = a3;
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  uint64_t v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];
  uint64_t v9 = [*(id *)(a1 + 48) objectForKeyedSubscript:v6];
  uint64_t v10 = [*(id *)(a1 + 56) objectForKeyedSubscript:v6];

  v11 = [v36 entity];
  v12 = [v11 appEntity];

  objc_super v13 = [v36 entity];
  v14 = [v13 contactEntity];

  if (v12)
  {
    id v15 = *(void **)(a1 + 64);
    id v16 = [v12 identifier];
    [v15 addObject:v16];

    id v17 = *(void **)(a1 + 72);
    id v18 = [v12 identifier];
    id v19 = [v17 objectForKeyedSubscript:v18];
  }
  else
  {
    id v19 = 0;
  }
  v34 = v14;
  id v35 = v12;
  if (v14)
  {
    id v20 = *(void **)(a1 + 80);
    id v21 = [v14 identifier];
    [v20 addObject:v21];

    v22 = *(void **)(a1 + 88);
    v23 = [v14 identifier];
    v24 = [v22 objectForKeyedSubscript:v23];
  }
  else
  {
    v24 = 0;
  }
  id v25 = [*(id *)(a1 + 96) modeEntityScoreFromEngagementFeatures:v36 dismissalFeatures:v7 hiddenFeatures:v8 clearedFeatures:v9 expiredFeatures:v10 scoredApp:v19 scoredContact:v24];
  [v36 entity];
  id v26 = v33 = (void *)v7;
  [v26 setScoreMetadata:v25];

  id v27 = *(void **)(a1 + 104);
  id v28 = [v36 entity];
  [v36 entity];
  v30 = id v29 = (void *)v8;
  [v30 identifier];
  v32 = id v31 = (void *)v9;
  [v27 setObject:v28 forKey:v32];
}

void __86__ATXNotificationModeModel_scoredEntitiesWithScoredAppEntities_scoredContactEntities___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v22 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F4B1E0]) initWithAppEntity:v22];
  v4 = *(void **)(a1 + 40);
  v5 = [v3 identifier];
  id v6 = [v4 objectForKeyedSubscript:v5];

  uint64_t v7 = *(void **)(a1 + 48);
  uint64_t v8 = [v3 identifier];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  uint64_t v10 = *(void **)(a1 + 56);
  v11 = [v3 identifier];
  v12 = [v10 objectForKeyedSubscript:v11];

  objc_super v13 = *(void **)(a1 + 64);
  v14 = [v3 identifier];
  id v15 = [v13 objectForKeyedSubscript:v14];

  id v16 = *(void **)(a1 + 72);
  id v17 = [v3 identifier];
  id v18 = [v16 objectForKeyedSubscript:v17];

  id v19 = [*(id *)(a1 + 80) modeEntityScoreFromEngagementFeatures:v6 dismissalFeatures:v9 hiddenFeatures:v12 clearedFeatures:v15 expiredFeatures:v18 scoredApp:v22 scoredContact:0];
  [v3 setScoreMetadata:v19];
  id v20 = *(void **)(a1 + 88);
  id v21 = [v3 identifier];
  [v20 setObject:v3 forKey:v21];
}

- (id)modeEntityScoreFromEngagementFeatures:(id)a3 dismissalFeatures:(id)a4 hiddenFeatures:(id)a5 clearedFeatures:(id)a6 expiredFeatures:(id)a7 scoredApp:(id)a8 scoredContact:(id)a9
{
  id v15 = a8;
  id v16 = a9;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  [(ATXNotificationModeModel *)self scoreFromEngagementFeatures:v21 dismissalFeatures:v20 hiddenFeatures:v19 clearedFeatures:v18 expiredFeatures:v17 scoredApp:v15 scoredContact:v16];
  double v23 = v22;
  v24 = objc_opt_new();
  [(ATXNotificationModeModel *)self addSubFeaturesToFeatureDict:v24 subFeatures:v21 prefix:@"engaged"];

  [(ATXNotificationModeModel *)self addSubFeaturesToFeatureDict:v24 subFeatures:v20 prefix:@"dismissed"];
  [(ATXNotificationModeModel *)self addSubFeaturesToFeatureDict:v24 subFeatures:v19 prefix:@"hidden"];

  [(ATXNotificationModeModel *)self addSubFeaturesToFeatureDict:v24 subFeatures:v18 prefix:@"cleared"];
  [(ATXNotificationModeModel *)self addSubFeaturesToFeatureDict:v24 subFeatures:v17 prefix:@"expired"];

  if (v15)
  {
    id v25 = [ATXModeEntityScoringFeatures alloc];
    id v26 = [v15 scoreMetadata];
    id v27 = [v26 featureVector];
    id v28 = [(ATXModeEntityScoringFeatures *)v25 initFromJSON:v27];

    [(ATXNotificationModeModel *)self addSubFeaturesToFeatureDict:v24 subFeatures:v28 prefix:@"app"];
  }
  if (v16)
  {
    id v29 = [ATXModeEntityScoringFeatures alloc];
    id v30 = [v16 scoreMetadata];
    id v31 = [v30 featureVector];
    id v32 = [(ATXModeEntityScoringFeatures *)v29 initFromJSON:v31];

    [(ATXNotificationModeModel *)self addSubFeaturesToFeatureDict:v24 subFeatures:v32 prefix:@"contact"];
  }
  id v33 = objc_opt_new();
  [v33 setScore:v23];
  v34 = (void *)[v24 copy];
  [v33 setFeatureVector:v34];

  return v33;
}

- (void)addSubFeaturesToFeatureDict:(id)a3 subFeatures:(id)a4 prefix:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [a4 jsonRepresentation];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__ATXNotificationModeModel_addSubFeaturesToFeatureDict_subFeatures_prefix___block_invoke;
  v12[3] = &unk_1E68B5238;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [v9 enumerateKeysAndObjectsUsingBlock:v12];
}

void __75__ATXNotificationModeModel_addSubFeaturesToFeatureDict_subFeatures_prefix___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __75__ATXNotificationModeModel_addSubFeaturesToFeatureDict_subFeatures_prefix___block_invoke_2;
    v9[3] = &unk_1E68B5238;
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    [v6 enumerateKeysAndObjectsUsingBlock:v9];
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = (void *)[[NSString alloc] initWithFormat:@"%@_%@", *(void *)(a1 + 40), v5];
    [v7 setObject:v6 forKey:v8];
  }
}

void __75__ATXNotificationModeModel_addSubFeaturesToFeatureDict_subFeatures_prefix___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v8 = (id)[a3 copy];
  id v7 = (void *)[[NSString alloc] initWithFormat:@"%@_%@", *(void *)(a1 + 40), v6];

  [v5 setObject:v8 forKey:v7];
}

- (double)scoreFromEngagementFeatures:(id)a3 dismissalFeatures:(id)a4 hiddenFeatures:(id)a5 clearedFeatures:(id)a6 expiredFeatures:(id)a7 scoredApp:(id)a8 scoredContact:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v150 = v18;
  v151 = v19;
  v153 = v20;
  id v22 = v17;
  id v23 = v16;
  id v24 = v15;
  if (v20)
  {
    id v25 = [ATXModeEntityScoringFeatures alloc];
    id v26 = [v20 scoreMetadata];
    [v26 featureVector];
    v28 = id v27 = v21;
    id v20 = [(ATXModeEntityScoringFeatures *)v25 initFromJSON:v28];

    id v21 = v27;
  }
  v152 = v21;
  if (v21)
  {
    id v29 = [ATXModeEntityScoringFeatures alloc];
    id v30 = [v21 scoreMetadata];
    id v31 = [v30 featureVector];
    id v21 = [(ATXModeEntityScoringFeatures *)v29 initFromJSON:v31];
  }
  id v32 = v24;
  id v33 = v23;
  v34 = v22;
  id v35 = v150;
  if (v20)
  {
    id v36 = [v20 entitySpecificFeatures];
    v37 = objc_msgSend(v36, "appCategoryScore_v2");
    [v37 doubleValue];
    double v39 = v38;

    [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights appCategoryScoreComponent];
    double v41 = v39 * v40;
    [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights appClassConditionalProbabilityComponent];
    double v43 = v42;
    [v20 classConditionalProbability];
    double v45 = v43 * v44;
    [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights appGlobalPopularityComponent];
    double v47 = v46;
    [v20 globalPopularity];
    double v49 = v47 * v48;
    [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights appModePopularityComponent];
    double v51 = v50;
    [v20 modePopularity];
    double v53 = v51 * v52;
    [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights appPosteriorProbabilityComponent];
    double v55 = v54;
    [v20 posteriorProbability];
    double v57 = v55 * v56;
    [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights appGlobalOccurrencesComponent];
    double v59 = v58;
    uint64_t v60 = [v20 globalOccurrences];
    double v61 = 1.0;
    if (!v60) {
      double v61 = 0.0;
    }
    double v62 = v41 + v45 + v49 + v53 + v57 + v59 * v61 + 0.0;
    if (v21) {
      goto LABEL_9;
    }
  }
  else
  {
    double v62 = 0.0;
    if (v21)
    {
LABEL_9:
      id v63 = objc_msgSend(v21, "entitySpecificFeatures", v150);
      unsigned int v64 = [v63 isFavoriteContact];

      id v65 = [v21 entitySpecificFeatures];
      LODWORD(v63) = [v65 isVIPContact];

      [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights contactClassConditionalProbabilityComponent];
      double v67 = v66;
      [v21 classConditionalProbability];
      double v69 = v67 * v68;
      [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights contactGlobalPopularityComponent];
      double v71 = v70;
      [v21 globalPopularity];
      double v73 = v71 * v72;
      [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights contactPosteriorProbabilityComponent];
      double v75 = v74;
      [v21 posteriorProbability];
      double v77 = v75 * v76;
      [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights contactGlobalOccurrencesComponent];
      double v79 = v78
          * (double)objc_msgSend(v21, "entityOccurredGloballyOverLastNDays:", -[ATXNotificationModeEntityModelWeights numOfDays](self->_notificationModeEntityModelWeights, "numOfDays"));
      [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights contactIsFavoriteComponent];
      double v81 = v80 * (double)v64;
      [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights contactIsVIPComponent];
      double v62 = v62 + v69 + v73 + v77 + v79 + v81 + v82 * (double)v63;
    }
  }
  [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights engagementGlobalPopularityComponent];
  double v84 = v83;
  [v32 globalPopularity];
  double v86 = v84 * v85;
  [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights engagementModePopularityComponent];
  double v88 = v87;
  [v32 modePopularity];
  double v90 = v88 * v89;
  [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights engagementClassConditionalProbabilityComponent];
  double v92 = v91;
  [v32 classConditionalProbability];
  double v94 = v92 * v93;
  [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights engagementPosteriorProbabilityComponent];
  double v96 = v95;
  [v32 posteriorProbability];
  double v98 = v62 + v86 + v90 + v94 + v96 * v97;
  [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights clearGlobalPopularityComponent];
  double v100 = v99;
  [v35 globalPopularity];
  double v102 = v100 * v101;
  [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights clearModePopularityComponent];
  double v104 = v103;
  [v35 modePopularity];
  double v106 = v104 * v105;
  [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights clearClassConditionalProbabilityComponent];
  double v108 = v107;
  [v35 classConditionalProbability];
  double v110 = v108 * v109;
  [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights clearPosteriorProbabilityComponent];
  double v112 = v111;
  [v35 posteriorProbability];
  double v114 = v98 + v102 + v106 + v110 + v112 * v113;
  [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights hiddenGlobalPopularityComponent];
  double v116 = v115;
  [v34 globalPopularity];
  double v118 = v116 * v117;
  [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights hiddenModePopularityComponent];
  double v120 = v119;
  [v34 modePopularity];
  double v122 = v120 * v121;
  [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights hiddenClassConditionalProbabilityComponent];
  double v124 = v123;
  [v34 classConditionalProbability];
  double v126 = v124 * v125;
  [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights hiddenPosteriorProbabilityComponent];
  double v128 = v127;
  [v34 posteriorProbability];
  double v130 = v114 + v118 + v122 + v126 + v128 * v129;
  [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights dismissGlobalPopularityComponent];
  double v132 = v131;
  [v33 globalPopularity];
  double v134 = v132 * v133;
  [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights dismissModePopularityComponent];
  double v136 = v135;
  [v33 modePopularity];
  double v138 = v136 * v137;
  [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights dismissClassConditionalProbabilityComponent];
  double v140 = v139;
  [v33 classConditionalProbability];
  double v142 = v140 * v141;
  [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights dismissPosteriorProbabilityComponent];
  double v144 = v143;
  [v33 posteriorProbability];
  double v146 = v130 + v134 + v138 + v142 + v144 * v145;
  [(ATXNotificationModeEntityModelWeights *)self->_notificationModeEntityModelWeights bias];
  *(float *)&double v147 = v147 + v146;
  double v148 = (float)(1.0 / (float)(expf(-*(float *)&v147) + 1.0));
  if (v20 && (unint64_t)[v20 uniqueOccurrencesInMode] < 3
    || v21 && (unint64_t)[v21 uniqueOccurrencesInMode] <= 2)
  {
    double v148 = v148 * 0.5;
  }

  return v148;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_notificationModeEntityModelWeights, 0);
}

@end