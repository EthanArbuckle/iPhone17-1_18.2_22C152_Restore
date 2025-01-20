@interface ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier
+ (BOOL)supportsSecureCoding;
+ (void)configureKeyedArchiver:(id)a3;
+ (void)configureKeyedUnarchiver:(id)a3;
- (ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier)initWithCandidateId:(id)a3 candidateType:(id)a4 anchor:(id)a5;
- (ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier)initWithCandidateId:(id)a3 candidateType:(id)a4 anchor:(id)a5 hyperParameters:(id)a6;
- (ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier)initWithCandidateId:(id)a3 candidateType:(id)a4 anchor:(id)a5 hyperParameters:(id)a6 dataStoreWrapper:(id)a7;
- (ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier)initWithCandidateId:(id)a3 candidateType:(id)a4 anchor:(id)a5 tree:(id)a6 hyperParameters:(id)a7 dataStoreWrapper:(id)a8;
- (ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier)initWithCoder:(id)a3;
- (BOOL)checkAndReportDecodingFailureIfNeededForBOOL:(BOOL)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)shouldComputeLaunchHistoryCounts;
- (NSString)description;
- (NSString)treeDescription;
- (id)anchorFeaturesWithAnchorOccurrence:(id)a3;
- (id)candidateFeaturesForActionCandidateOnAnchorOccurrenceDate:(id)a3 cachedLaunchHistory:(id)a4;
- (id)candidateFeaturesForAppCandidateOnAnchorOccurrenceDate:(id)a3 cachedLaunchHistory:(id)a4;
- (id)candidateFeaturesForLinkActionCandidateOnAnchorOccurrenceDate:(id)a3 cachedLaunchHistory:(id)a4;
- (id)candidateFeaturesForModeCandidateOnAnchorOccurrenceDate:(id)a3 cachedLaunchHistory:(id)a4;
- (id)candidateFeaturesWithAnchorOccurrence:(id)a3 trainingResult:(id)a4;
- (id)classifyCandidateForAnchorOccurrence:(id)a3 trainingResult:(id)a4;
- (id)featureNames;
- (id)featureVectorFromFeatureDictionary:(id)a3;
- (id)indicesToKeepInTrainingAfterRemovingDuplicateFeatureVectorsWithConflictingLabels:(id)a3 labels:(id)a4;
- (id)inferenceFeatureDictForAnchorOccurrence:(id)a3 trainingResult:(id)a4;
- (id)labelKey;
- (id)predictWhenNoTreeInitialized;
- (id)stringFeaturesToReplaceWithUnk;
- (id)trainDecisionTree;
- (id)trainingData;
- (id)trainingFeatureVectorsFromTrainingData:(id)a3;
- (id)trainingLabelsFromTrainingData:(id)a3;
- (id)tree;
- (int64_t)classifierType;
- (void)encodeWithCoder:(id)a3;
- (void)predictWhenNoTreeInitialized;
- (void)setRecentAppLaunchCountsFromAppInfoManager:(id)a3 anchorOccurrenceDate:(id)a4;
- (void)setTreeDescription:(id)a3;
- (void)train;
- (void)trainDecisionTree;
@end

@implementation ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier

- (ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier)initWithCandidateId:(id)a3 candidateType:(id)a4 anchor:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[ATXAnchorModelHyperParameters sharedInstance];
  v12 = objc_opt_new();
  v13 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self initWithCandidateId:v10 candidateType:v9 anchor:v8 hyperParameters:v11 dataStoreWrapper:v12];

  return v13;
}

- (ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier)initWithCandidateId:(id)a3 candidateType:(id)a4 anchor:(id)a5 hyperParameters:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_opt_new();
  v15 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self initWithCandidateId:v13 candidateType:v12 anchor:v11 hyperParameters:v10 dataStoreWrapper:v14];

  return v15;
}

- (ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier)initWithCandidateId:(id)a3 candidateType:(id)a4 anchor:(id)a5 hyperParameters:(id)a6 dataStoreWrapper:(id)a7
{
  return [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self initWithCandidateId:a3 candidateType:a4 anchor:a5 tree:0 hyperParameters:a6 dataStoreWrapper:a7];
}

- (ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier)initWithCandidateId:(id)a3 candidateType:(id)a4 anchor:(id)a5 tree:(id)a6 hyperParameters:(id)a7 dataStoreWrapper:(id)a8
{
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier;
  v18 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)&v21 initWithCandidateId:a3 candidateType:a4 anchor:a5];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_tree, a6);
    objc_storeStrong((id *)&v19->_storeWrapper, a8);
    objc_storeStrong((id *)&v19->_hyperParameters, a7);
  }

  return v19;
}

- (int64_t)classifierType
{
  return 3;
}

- (NSString)treeDescription
{
  treeDescription = self->_treeDescription;
  if (!treeDescription)
  {
    id v4 = [NSString alloc];
    tree = self->_tree;
    if (!tree) {
      tree = (ATXGamePlayKitDecisionTree *)@"EmptyTree";
    }
    v6 = (NSString *)[v4 initWithFormat:@"%@", tree];
    v7 = self->_treeDescription;
    self->_treeDescription = v6;

    treeDescription = self->_treeDescription;
  }
  return treeDescription;
}

- (NSString)description
{
  if ([(ATXNaivePositiveAnchorModelCandidateClassifier *)self isTrained])
  {
    v3 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self treeDescription];
  }
  else
  {
    v3 = @"GamePlayKit Decision Tree Anchor Model candidate classifier.";
  }
  return (NSString *)v3;
}

- (id)featureNames
{
  return &unk_1F27F3618;
}

- (BOOL)shouldComputeLaunchHistoryCounts
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier_shouldComputeLaunchHistoryCounts__block_invoke;
  block[3] = &unk_1E68AB818;
  block[4] = self;
  if (shouldComputeLaunchHistoryCounts__pasOnceToken6 != -1) {
    dispatch_once(&shouldComputeLaunchHistoryCounts__pasOnceToken6, block);
  }
  return shouldComputeLaunchHistoryCounts__pasExprOnceResult;
}

void __92__ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier_shouldComputeLaunchHistoryCounts__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D25F6CC0]();
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __92__ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier_shouldComputeLaunchHistoryCounts__block_invoke_2;
  v3[3] = &unk_1E68B0D20;
  v3[4] = *(void *)(a1 + 32);
  shouldComputeLaunchHistoryCounts__pasExprOnceResult = __92__ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier_shouldComputeLaunchHistoryCounts__block_invoke_2((uint64_t)v3);
}

uint64_t __92__ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier_shouldComputeLaunchHistoryCounts__block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "featureNames", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * v5) containsString:@"candidateOccurrencesIn"])
        {
          uint64_t v6 = 1;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v6 = 0;
LABEL_11:

  return v6;
}

- (id)stringFeaturesToReplaceWithUnk
{
  uint64_t v2 = (void *)MEMORY[0x1D25F6CC0](self, a2);
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"anchorEventIdentifier", 0, 0);
  return v3;
}

- (id)labelKey
{
  return @"candidatePerformed";
}

- (id)tree
{
  return self->_tree;
}

- (void)train
{
  uint64_t v3 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self trainDecisionTree];
  tree = self->_tree;
  self->_tree = v3;

  [(ATXNaivePositiveAnchorModelCandidateClassifier *)self setIsTrained:1];
}

- (id)trainDecisionTree
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D25F6CC0](self, a2);
  uint64_t v3 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self trainingData];
  uint64_t v4 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self trainingFeatureVectorsFromTrainingData:v3];
  uint64_t v5 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self trainingLabelsFromTrainingData:v3];
  uint64_t v6 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self featureNames];
  v7 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self indicesToKeepInTrainingAfterRemovingDuplicateFeatureVectorsWithConflictingLabels:v4 labels:v5];
  long long v8 = [v4 objectsAtIndexes:v7];

  long long v9 = [v5 objectsAtIndexes:v7];

  long long v10 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier trainDecisionTree]();
  }

  long long v11 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier trainDecisionTree]();
  }

  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v9];
  uint64_t v13 = [v12 count];
  if (v13 == 1)
  {
    v14 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self candidateId];
      id v16 = [v12 anyObject];
      *(_DWORD *)buf = 138412546;
      v25 = v15;
      __int16 v26 = 2112;
      v27 = v16;
      _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_INFO, "Skipping training decision tree for candidate %@ since there's only one known label: %@.:", buf, 0x16u);
    }
    id v17 = 0;
  }
  else
  {
    v18 = [ATXGamePlayKitDecisionTree alloc];
    [(ATXAnchorModelHyperParameters *)self->_hyperParameters ratioForLeafNodeDecision];
    id v17 = -[ATXGamePlayKitDecisionTree initWithExamples:actions:attributes:maxDepth:minSamplesSplit:ratioForLeafNodeDecision:](v18, "initWithExamples:actions:attributes:maxDepth:minSamplesSplit:ratioForLeafNodeDecision:", v8, v9, v6, 3, 3);
    v19 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self candidateId];
      *(_DWORD *)buf = 138412290;
      v25 = v20;
      _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_INFO, "Finished training decision tree for candidate %@. Tree:", buf, 0xCu);
    }
    v14 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_INFO, "\n%@", buf, 0xCu);
    }
  }

  if (v13 == 1) {
    objc_super v21 = 0;
  }
  else {
    objc_super v21 = v17;
  }

  return v21;
}

- (id)indicesToKeepInTrainingAfterRemovingDuplicateFeatureVectorsWithConflictingLabels:(id)a3 labels:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  if ([v5 count])
  {
    unint64_t v8 = 0;
    do
    {
      long long v9 = [v5 objectAtIndexedSubscript:v8];
      for (unint64_t i = v8; i < [v5 count]; ++i)
      {
        long long v11 = [v5 objectAtIndexedSubscript:i];
        if ([v9 isEqual:v11])
        {
          id v12 = [v6 objectAtIndexedSubscript:v8];
          uint64_t v13 = [v6 objectAtIndexedSubscript:i];
          char v14 = [v12 isEqual:v13];

          if ((v14 & 1) == 0)
          {
            id v15 = [v6 objectAtIndexedSubscript:v8];

            if (!v15) {
              [v7 addIndex:v8];
            }
            id v16 = [v6 objectAtIndexedSubscript:i];

            if (!v16) {
              [v7 addIndex:i];
            }
          }
        }
        else
        {
        }
      }

      ++v8;
    }
    while (v8 < [v5 count]);
  }
  id v17 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v5, "count"));
  [v17 removeIndexes:v7];

  return v17;
}

- (id)trainingData
{
  storeWrapper = self->_storeWrapper;
  uint64_t v4 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self candidateId];
  id v5 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self anchor];
  id v6 = [(ATXAnchorModelDataStoreWrapperProtocol *)storeWrapper trainingDataForCandidate:v4 anchor:v5 replacementStringForNilStringValues:@"unk"];

  return v6;
}

- (id)trainingLabelsFromTrainingData:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __91__ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier_trainingLabelsFromTrainingData___block_invoke;
  v6[3] = &unk_1E68B2A08;
  v6[4] = self;
  uint64_t v3 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v6);
  uint64_t v4 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier trainingLabelsFromTrainingData:]();
  }

  return v3;
}

id __91__ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier_trainingLabelsFromTrainingData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 labelKey];
  id v5 = [v3 objectForKeyedSubscript:v4];

  return v5;
}

- (id)featureVectorFromFeatureDictionary:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self featureNames];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v12 = [v4 objectForKeyedSubscript:v11];
        if (!v12)
        {
          uint64_t v13 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self stringFeaturesToReplaceWithUnk];
          int v14 = [v13 containsObject:v11];

          id v12 = @"unk";
          if (!v14) {
            continue;
          }
        }
        [v5 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  id v15 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier featureVectorFromFeatureDictionary:]();
  }

  return v5;
}

- (id)trainingFeatureVectorsFromTrainingData:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __99__ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier_trainingFeatureVectorsFromTrainingData___block_invoke;
  v5[3] = &unk_1E68B2A08;
  v5[4] = self;
  id v3 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v5);
  return v3;
}

uint64_t __99__ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier_trainingFeatureVectorsFromTrainingData___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) featureVectorFromFeatureDictionary:a2];
}

- (id)classifyCandidateForAnchorOccurrence:(id)a3 trainingResult:(id)a4
{
  *(void *)&v25[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D25F6CC0]();
  if (self->_tree)
  {
    uint64_t v9 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self inferenceFeatureDictForAnchorOccurrence:v6 trainingResult:v7];
    uint64_t v10 = [v9 count];
    uint64_t v11 = __atxlog_handle_anchor();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        int v24 = 138412290;
        *(void *)v25 = v9;
        _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "Inference features: %@", (uint8_t *)&v24, 0xCu);
      }

      uint64_t v13 = [(ATXGamePlayKitDecisionTree *)self->_tree findActionForAnswers:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v14 = [v13 BOOLValue];
        id v15 = __atxlog_handle_anchor();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self candidateId];
          int v24 = 67109378;
          v25[0] = v14;
          LOWORD(v25[1]) = 2112;
          *(void *)((char *)&v25[1] + 2) = v16;
          _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "GamePlayKit Decision Tree predicted %{BOOL}d for candidate %@", (uint8_t *)&v24, 0x12u);
        }
        long long v17 = [ATXAnchorModelClassificationResult alloc];
        double v18 = 0.5;
        uint64_t v19 = v14;
      }
      else
      {
        uint64_t v22 = __atxlog_handle_anchor();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
          -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier classifyCandidateForAnchorOccurrence:trainingResult:]();
        }

        long long v17 = [ATXAnchorModelClassificationResult alloc];
        double v18 = 0.0;
        uint64_t v19 = 0;
      }
      long long v20 = [(ATXAnchorModelClassificationResult *)v17 initWithShouldPredictCandidate:v19 score:v18];
    }
    else
    {
      if (v12)
      {
        objc_super v21 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self candidateId];
        int v24 = 138412290;
        *(void *)v25 = v21;
        _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "GKDecisionTree Predicting NO because inference feature dict was an empty dictionary, likely due to an error. CandidateId: %@", (uint8_t *)&v24, 0xCu);
      }
      long long v20 = [[ATXAnchorModelClassificationResult alloc] initWithShouldPredictCandidate:0 score:0.0];
    }
  }
  else
  {
    long long v20 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self predictWhenNoTreeInitialized];
  }

  return v20;
}

- (id)predictWhenNoTreeInitialized
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self trainingData];
  id v4 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self trainingFeatureVectorsFromTrainingData:v3];
  id v5 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self trainingLabelsFromTrainingData:v3];
  id v6 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self indicesToKeepInTrainingAfterRemovingDuplicateFeatureVectorsWithConflictingLabels:v4 labels:v5];
  id v7 = [v5 objectsAtIndexes:v6];

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v7];
  uint64_t v9 = [v8 count];
  uint64_t v10 = __atxlog_handle_anchor();
  uint64_t v11 = v10;
  if (v9 == 1)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL v12 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self candidateId];
      int v17 = 138412290;
      double v18 = v12;
      _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_INFO, "Tree not initialized but asked to make a prediction. Since this was a pure candidate, we're predicting the only label we have. %@", (uint8_t *)&v17, 0xCu);
    }
    uint64_t v13 = [ATXAnchorModelClassificationResult alloc];
    uint64_t v14 = [v8 anyObject];
    id v15 = -[ATXAnchorModelClassificationResult initWithShouldPredictCandidate:score:](v13, "initWithShouldPredictCandidate:score:", [v14 BOOLValue], 1.0);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self predictWhenNoTreeInitialized];
    }

    id v15 = [[ATXAnchorModelClassificationResult alloc] initWithShouldPredictCandidate:0 score:0.0];
  }

  return v15;
}

- (id)inferenceFeatureDictForAnchorOccurrence:(id)a3 trainingResult:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier inferenceFeatureDictForAnchorOccurrence:trainingResult:].cold.4(self, v8);
  }

  uint64_t v9 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self candidateFeaturesWithAnchorOccurrence:v6 trainingResult:v7];

  uint64_t v10 = [v9 count];
  uint64_t v11 = __atxlog_handle_anchor();
  BOOL v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier inferenceFeatureDictForAnchorOccurrence:trainingResult:]();
    }

    BOOL v12 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self anchorFeaturesWithAnchorOccurrence:v6];
    uint64_t v13 = [v12 count];
    uint64_t v14 = __atxlog_handle_anchor();
    id v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier inferenceFeatureDictForAnchorOccurrence:trainingResult:]();
      }

      id v16 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v9];
      [v16 addEntriesFromDictionary:v12];
      id v15 = __atxlog_handle_anchor();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier inferenceFeatureDictForAnchorOccurrence:trainingResult:]();
      }
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self candidateId];
        long long v20 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self anchor];
        int v22 = 138412546;
        v23 = v19;
        __int16 v24 = 2112;
        v25 = v20;
        _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "Anchor features were empty for candidateId: %@, anchor: %@", (uint8_t *)&v22, 0x16u);
      }
      id v16 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self candidateId];
      double v18 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self anchor];
      int v22 = 138412546;
      v23 = v17;
      __int16 v24 = 2112;
      v25 = v18;
      _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "Candidate features were empty for candidateId: %@, anchor: %@", (uint8_t *)&v22, 0x16u);
    }
    id v16 = 0;
  }

  return v16;
}

- (id)candidateFeaturesWithAnchorOccurrence:(id)a3 trainingResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self anchor];
  uint64_t v9 = [(id)objc_opt_class() anchorOccurenceDateFromDuetEvent:v7];

  uint64_t v10 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self candidateType];
  LODWORD(v8) = [v10 isEqualToString:@"action"];

  if (v8)
  {
    uint64_t v11 = [v6 phase1TrainingResult];
    BOOL v12 = [v11 launchHistory];
    uint64_t v13 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self candidateFeaturesForActionCandidateOnAnchorOccurrenceDate:v9 cachedLaunchHistory:v12];
LABEL_9:
    long long v20 = (void *)v13;

    goto LABEL_10;
  }
  uint64_t v14 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self candidateType];
  int v15 = [v14 isEqualToString:@"app"];

  if (v15)
  {
    uint64_t v11 = [v6 phase1TrainingResult];
    BOOL v12 = [v11 launchHistory];
    uint64_t v13 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self candidateFeaturesForAppCandidateOnAnchorOccurrenceDate:v9 cachedLaunchHistory:v12];
    goto LABEL_9;
  }
  id v16 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self candidateType];
  int v17 = [v16 isEqualToString:@"mode"];

  if (v17)
  {
    uint64_t v11 = [v6 phase1TrainingResult];
    BOOL v12 = [v11 launchHistory];
    uint64_t v13 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self candidateFeaturesForModeCandidateOnAnchorOccurrenceDate:v9 cachedLaunchHistory:v12];
    goto LABEL_9;
  }
  double v18 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self candidateType];
  int v19 = [v18 isEqualToString:@"linkaction"];

  if (v19)
  {
    uint64_t v11 = [v6 phase1TrainingResult];
    BOOL v12 = [v11 launchHistory];
    uint64_t v13 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self candidateFeaturesForLinkActionCandidateOnAnchorOccurrenceDate:v9 cachedLaunchHistory:v12];
    goto LABEL_9;
  }
  long long v20 = objc_opt_new();
LABEL_10:

  return v20;
}

- (id)candidateFeaturesForActionCandidateOnAnchorOccurrenceDate:(id)a3 cachedLaunchHistory:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  storeWrapper = self->_storeWrapper;
  uint64_t v9 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self candidateId];
  uint64_t v10 = [(ATXAnchorModelDataStoreWrapperProtocol *)storeWrapper appIntentDuetEventFromCandidateId:v9 date:v6];

  if (v10)
  {
    uint64_t v11 = objc_opt_new();
    [v11 setShouldComputeLaunchHistoryForAppLaunches:0];
    [v11 setShouldComputeLaunchHistoryForActionKeyLaunches:0];
    BOOL v12 = 0;
    if (!v7) {
      BOOL v12 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self shouldComputeLaunchHistoryCounts];
    }
    [v11 setShouldComputeLaunchHistoryForActionUUIDLaunches:v12];
    uint64_t v13 = [v11 featurizeActionEvent:v10 anchorOccurrenceDate:v6];
    if (v7)
    {
      uint64_t v14 = __atxlog_handle_anchor();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self candidateId];
        *(_DWORD *)buf = 138412290;
        v25 = v15;
        _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "Featurizing %@, already have cachedLaunchHistory. Filling in the recent history.", buf, 0xCu);
      }
      id v16 = [v13 actionUUIDMetadatas];
      int v17 = [v16 objectAtIndexedSubscript:0];
      [v17 setActionUUIDLaunchHistory:v7];

      double v18 = [v11 recentHistoryForActionUUIDWithAppIntentDuetEvent:v10 anchorOccurrenceDate:v6];
      int v19 = [v13 actionUUIDMetadatas];
      long long v20 = [v19 objectAtIndexedSubscript:0];
      objc_super v21 = [v20 actionUUIDLaunchHistory];
      [v21 mergeFrom:v18];
    }
    int v22 = [(id)objc_opt_class() actionCandidateFeaturesFromActionEvent:v10 actionMetadata:v13 actionOccurred:0 actionEngaged:0];
  }
  else
  {
    int v22 = 0;
  }

  return v22;
}

- (id)candidateFeaturesForAppCandidateOnAnchorOccurrenceDate:(id)a3 cachedLaunchHistory:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  storeWrapper = self->_storeWrapper;
  uint64_t v9 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self candidateId];
  uint64_t v10 = [(ATXAnchorModelDataStoreWrapperProtocol *)storeWrapper appLaunchDuetEventFromCandidateId:v9 date:v6];

  uint64_t v11 = objc_opt_new();
  if (v7) {
    BOOL v12 = 0;
  }
  else {
    BOOL v12 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self shouldComputeLaunchHistoryCounts];
  }
  [v11 setShouldComputeLaunchHistoryForAppLaunches:v12];
  v20[0] = v10;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  uint64_t v14 = [v11 featurizeAppLaunchEvents:v13 anchorOccurrenceDate:v6];
  int v15 = [v14 objectAtIndexedSubscript:0];

  if (v7)
  {
    [v15 setAppLaunchHistory:v7];
    if ([(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self shouldComputeLaunchHistoryCounts])
    {
      id v16 = [v11 recentHistoryForAppLaunchDuetEvent:v10 anchorOccurrenceDate:v6];
      int v17 = [v15 appLaunchHistory];
      [v17 mergeFrom:v16];
    }
    else
    {
      [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self setRecentAppLaunchCountsFromAppInfoManager:v15 anchorOccurrenceDate:v6];
    }
  }
  double v18 = [(id)objc_opt_class() appCandidateFeaturesFromAppLaunchEvent:v10 appMetadata:v15 appWasLaunched:0 appEngaged:0];

  return v18;
}

- (id)candidateFeaturesForModeCandidateOnAnchorOccurrenceDate:(id)a3 cachedLaunchHistory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  storeWrapper = self->_storeWrapper;
  uint64_t v9 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self candidateId];
  uint64_t v10 = [(ATXAnchorModelDataStoreWrapperProtocol *)storeWrapper modeBiomeEventFromCandidateId:v9 date:v6];

  if (v10)
  {
    uint64_t v11 = objc_opt_new();
    BOOL v12 = [v11 featurizeModeEvent:v10 anchorOccurrenceDate:v6];
    uint64_t v13 = v12;
    if (v7)
    {
      [v12 setModeHistory:v7];
      if ([(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self shouldComputeLaunchHistoryCounts])
      {
        uint64_t v14 = [v11 recentHistoryForModeWithModeEvent:v10 anchorOccurrenceDate:v6];
        int v15 = [v13 modeHistory];
        [v15 mergeFrom:v14];
      }
    }
    id v16 = [(id)objc_opt_class() modeCandidateFeaturesFromModeEvent:v10 modeMetadata:v13 modeOccurred:0 modeEngaged:0];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)candidateFeaturesForLinkActionCandidateOnAnchorOccurrenceDate:(id)a3 cachedLaunchHistory:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  storeWrapper = self->_storeWrapper;
  uint64_t v9 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self candidateId];
  uint64_t v10 = [(ATXAnchorModelDataStoreWrapperProtocol *)storeWrapper linkActionBiomeEventFromCandidateId:v9 date:v6];

  if (v10)
  {
    uint64_t v11 = objc_opt_new();
    BOOL v12 = [v11 featurizeLinkActionEvent:v10 anchorOccurrenceDate:v6];
    if (v7)
    {
      uint64_t v13 = __atxlog_handle_anchor();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self candidateId];
        int v19 = 138412290;
        long long v20 = v14;
        _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "Featurizing %@, already have cachedLaunchHistory. Filling in the recent history.", (uint8_t *)&v19, 0xCu);
      }
      [v12 setActionHistory:v7];
      int v15 = [v11 historyForLinkActionChangeEvent:v10 anchorOccurrenceDate:v6];
      id v16 = [v12 actionHistory];
      [v16 mergeFrom:v15];
    }
    int v17 = [(id)objc_opt_class() linkActionCandidateFeaturesFromLinkActionEvent:v10 actionMetadata:v12 actionOccurred:0 actionEngaged:0];
  }
  else
  {
    int v17 = 0;
  }

  return v17;
}

- (void)setRecentAppLaunchCountsFromAppInfoManager:(id)a3 anchorOccurrenceDate:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self candidateId];
    int v19 = 138412290;
    long long v20 = v9;
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "Featurizing %@, already have cachedLaunchHistory and we don't need to compute the launch history counts. Accessing the last app launch date from ATXAppInfoManager.", (uint8_t *)&v19, 0xCu);
  }
  uint64_t v10 = +[_ATXAppInfoManager sharedInstance];
  uint64_t v11 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self candidateId];
  BOOL v12 = [v10 lastLaunchDateForBundleId:v11];

  uint64_t v13 = [v7 dateByAddingTimeInterval:-86400.0];
  uint64_t v14 = [v7 dateByAddingTimeInterval:-43200.0];

  int v15 = [v12 earlierDate:v13];

  if (v15 == v13)
  {
    id v16 = [v6 appLaunchHistory];
    [v16 setLaunchesInLast24Hours:1];
  }
  int v17 = [v12 earlierDate:v14];

  if (v17 == v14)
  {
    double v18 = [v6 appLaunchHistory];
    [v18 setLaunchesInLast12Hours:1];
  }
}

- (id)anchorFeaturesWithAnchorOccurrence:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self anchor];
  id v7 = [v5 featurizeAnchorEvent:v4 anchor:v6];

  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self anchor];
  uint64_t v10 = [v8 anchorFeaturesForAnchorOccurrence:v4 anchor:v9 anchorMetadata:v7];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    int v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      int v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      int v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForBOOL:(BOOL)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    int v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      int v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      int v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

+ (void)configureKeyedArchiver:(id)a3
{
}

+ (void)configureKeyedUnarchiver:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self candidateId];
  [v10 encodeObject:v4 forKey:@"codingKeyForCandidateId"];

  id v5 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self candidateType];
  [v10 encodeObject:v5 forKey:@"codingKeyForCandidateType"];

  id v6 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self anchor];
  [v10 encodeObject:v6 forKey:@"codingKeyForAnchorInstance"];

  id v7 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self treeDescription];
  char v8 = [v7 isEqualToString:@"EmptyTree"];

  if ((v8 & 1) == 0) {
    [v10 encodeObject:self->_tree forKey:@"codingKeyForGKDecisionTree"];
  }
  objc_msgSend(v10, "encodeBool:forKey:", -[ATXNaivePositiveAnchorModelCandidateClassifier isTrained](self, "isTrained"), @"codingKeyForDecisionTreeIsTrained");
  uint64_t v9 = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self treeDescription];
  [v10 encodeObject:v9 forKey:@"codingKeyForDecisionTreeDescription"];
}

- (ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"codingKeyForCandidateId"];
  if (![(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self checkAndReportDecodingFailureIfNeededForid:v5 key:@"codingKeyForCandidateId" coder:v4 errorDomain:@"com.apple.proactive.GamePlayKitDecisionTreeAnchorModelCandidateClassifier" errorCode:-1])
  {
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"codingKeyForCandidateType"];
    if ([(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self checkAndReportDecodingFailureIfNeededForid:v7 key:@"codingKeyForCandidateType" coder:v4 errorDomain:@"com.apple.proactive.GamePlayKitDecisionTreeAnchorModelCandidateClassifier" errorCode:-1])
    {
      id v6 = 0;
LABEL_40:

      goto LABEL_41;
    }
    char v8 = +[ATXAnchor allAnchorClasses];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"codingKeyForAnchorInstance"];

    if (v9) {
      goto LABEL_6;
    }
    id v11 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier initWithCoder:].cold.5(v11);
    }

    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"codingKeyForAnchor"];
    if ([(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self checkAndReportDecodingFailureIfNeededForid:v12 key:@"codingKeyForAnchor" coder:v4 errorDomain:@"com.apple.proactive.GamePlayKitDecisionTreeAnchorModelCandidateClassifier" errorCode:-1])
    {
      uint64_t v9 = 0;
LABEL_13:
      id v6 = 0;
LABEL_38:

      goto LABEL_39;
    }
    id v13 = +[ATXAnchorModelHyperParameters sharedInstance];
    BOOL v14 = [v13 enabledAnchors];
    char v15 = [v14 containsObject:v12];

    if (v15)
    {
      if (NSClassFromString((NSString *)v12))
      {
        id v16 = objc_opt_new();
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {

          uint64_t v9 = v16;
LABEL_6:
          uint64_t v10 = [v4 decodeBoolForKey:@"codingKeyForDecisionTreeIsTrained"];
          if ([(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self checkAndReportDecodingFailureIfNeededForBOOL:v10 key:@"codingKeyForDecisionTreeIsTrained" coder:v4 errorDomain:@"com.apple.proactive.GamePlayKitDecisionTreeAnchorModelCandidateClassifier" errorCode:-1])
          {
            id v6 = 0;
LABEL_39:

            goto LABEL_40;
          }
          id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"codingKeyForDecisionTreeDescription"];
          if ([(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self checkAndReportDecodingFailureIfNeededForid:v12 key:@"codingKeyForDecisionTreeDescription" coder:v4 errorDomain:@"com.apple.proactive.GamePlayKitDecisionTreeAnchorModelCandidateClassifier" errorCode:-1])
          {
            goto LABEL_13;
          }
          if ([v12 isEqualToString:@"EmptyTree"])
          {
            v27 = 0;
LABEL_24:
            int v17 = (objc_class *)objc_opt_class();
            uint64_t v18 = NSStringFromClass(v17);
            int v19 = +[ATXAnchorModelHyperParameters sharedInstance];
            long long v20 = [v19 enabledAnchors];
            uint64_t v28 = (void *)v18;
            LOBYTE(v18) = [v20 containsObject:v18];

            if (v18)
            {
              uint64_t v21 = +[ATXAnchorModelHyperParameters sharedInstance];
              int v22 = objc_opt_new();
              id v16 = v27;
              self = [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self initWithCandidateId:v5 candidateType:v7 anchor:v9 tree:v27 hyperParameters:v21 dataStoreWrapper:v22];

              [(ATXNaivePositiveAnchorModelCandidateClassifier *)self setIsTrained:v10];
              [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self setTreeDescription:v12];
              id v6 = self;
              v23 = v28;
            }
            else
            {
              __int16 v24 = __atxlog_handle_anchor();
              id v16 = v27;
              v23 = v28;
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier initWithCoder:]();
              }

              id v6 = 0;
            }

            goto LABEL_37;
          }
          id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"codingKeyForGKDecisionTree"];
          if (![(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)self checkAndReportDecodingFailureIfNeededForid:v16 key:@"codingKeyForGKDecisionTree" coder:v4 errorDomain:@"com.apple.proactive.GamePlayKitDecisionTreeAnchorModelCandidateClassifier" errorCode:-1])
          {
            v27 = v16;
            goto LABEL_24;
          }
LABEL_36:
          id v6 = 0;
LABEL_37:

          goto LABEL_38;
        }
        v25 = __atxlog_handle_anchor();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
          -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier initWithCoder:]();
        }
      }
      else
      {
        id v16 = __atxlog_handle_anchor();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier initWithCoder:]();
        }
      }
    }
    else
    {
      id v16 = __atxlog_handle_anchor();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier initWithCoder:]();
      }
    }
    uint64_t v9 = 0;
    goto LABEL_36;
  }
  id v6 = 0;
LABEL_41:

  return v6;
}

- (void)setTreeDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treeDescription, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_tree, 0);
  objc_storeStrong((id *)&self->_storeWrapper, 0);
}

- (void)trainDecisionTree
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "Examples: %@", v2, v3, v4, v5, v6);
}

- (void)trainingLabelsFromTrainingData:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "Label Vector: %@", v2, v3, v4, v5, v6);
}

- (void)featureVectorFromFeatureDictionary:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "Feature Vector: %@", v2, v3, v4, v5, v6);
}

- (void)classifyCandidateForAnchorOccurrence:trainingResult:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_FAULT, "GamePlayKit Decision Tree predicted a label that was not an NSNumber. Returning False to be safe.", v1, 2u);
}

- (void)predictWhenNoTreeInitialized
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 candidateId];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Tree not initialized but asked to make a prediction. Returning NO for candidate: %@", v4, 0xCu);
}

- (void)inferenceFeatureDictForAnchorOccurrence:trainingResult:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Finished generating feature dict GameplayKit inference.", v2, v3, v4, v5, v6);
}

- (void)inferenceFeatureDictForAnchorOccurrence:trainingResult:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "> done generating anchor features.", v2, v3, v4, v5, v6);
}

- (void)inferenceFeatureDictForAnchorOccurrence:trainingResult:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "> done generating candidate features.", v2, v3, v4, v5, v6);
}

- (void)inferenceFeatureDictForAnchorOccurrence:(void *)a1 trainingResult:(NSObject *)a2 .cold.4(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 candidateId];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "Generating feature dict for GameplayKit inference of %@...", v4, 0xCu);
}

- (void)initWithCoder:.cold.1()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0FA3000, v2, v3, "When decoding %@, encountered an unknown/non-existent Anchor Class String.", v4, v5, v6, v7, v8);
}

- (void)initWithCoder:.cold.2()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v2, v3, "When decoding %@, attempted to deserialize object with a non-whitelisted anchor: %@", v4, v5, v6, v7, v8);
}

- (void)initWithCoder:.cold.3()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0FA3000, v2, v3, "When decoding %@, decoded an object that is not a known Anchor type.", v4, v5, v6, v7, v8);
}

- (void)initWithCoder:(os_log_t)log .cold.5(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 138412546;
  uint64_t v2 = @"codingKeyForAnchorInstance";
  __int16 v3 = 2112;
  uint64_t v4 = @"codingKeyForAnchor";
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "When decoding object at %@, the output was nil. Falling back to reading anchor type string from %@", (uint8_t *)&v1, 0x16u);
}

@end