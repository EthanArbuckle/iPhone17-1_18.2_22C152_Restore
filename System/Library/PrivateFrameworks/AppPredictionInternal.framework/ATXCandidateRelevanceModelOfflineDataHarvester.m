@interface ATXCandidateRelevanceModelOfflineDataHarvester
+ (float)calculateF1ScoreWithPrecision:(float)a3 recall:(float)a4;
+ (id)candidateMetricsFromConfig:(id)a3;
+ (id)evaluationMetricsFromConfig:(id)a3 startTime:(id)a4 endTime:(id)a5;
+ (id)metricsForConfig:(id)a3;
+ (id)modelMetricsForConfig:(id)a3;
+ (unsigned)daysBetweenStartDate:(id)a3 endDate:(id)a4;
+ (void)harvestDataUsingConfig:(id)a3;
- (ATXCandidateRelevanceModelOfflineDataHarvester)init;
- (ATXCandidateRelevanceModelOfflineDataHarvester)initWithConfigs:(id)a3;
- (void)harvestData;
@end

@implementation ATXCandidateRelevanceModelOfflineDataHarvester

- (ATXCandidateRelevanceModelOfflineDataHarvester)init
{
  v3 = allRelevanceModelConfigs();
  v4 = [(ATXCandidateRelevanceModelOfflineDataHarvester *)self initWithConfigs:v3];

  return v4;
}

- (ATXCandidateRelevanceModelOfflineDataHarvester)initWithConfigs:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXCandidateRelevanceModelOfflineDataHarvester;
  v6 = [(ATXCandidateRelevanceModelOfflineDataHarvester *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configs, a3);
  }

  return v7;
}

- (void)harvestData
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = __atxlog_handle_relevance_model();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "%@ - Beginning data harvesting for all configs.", buf, 0xCu);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_configs;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend((id)objc_opt_class(), "harvestDataUsingConfig:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

+ (void)harvestDataUsingConfig:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 dataHarvestingSamplingRate];
  BOOL v5 = +[_ATXAggregateLogger yesWithProbability:v4];
  v6 = __atxlog_handle_relevance_model();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      uint64_t v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      uint64_t v10 = [v3 clientModel];
      long long v11 = [v10 clientModelId];
      int v17 = 138412546;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "%@ - Harvesting data for config with client model id %@.", (uint8_t *)&v17, 0x16u);
    }
    v6 = [(id)objc_opt_class() metricsForConfig:v3];
    long long v12 = [MEMORY[0x1E4F93728] sharedInstance];
    [v12 logMessage:v6];
    goto LABEL_7;
  }
  if (v7)
  {
    long long v13 = (objc_class *)objc_opt_class();
    long long v12 = NSStringFromClass(v13);
    long long v14 = [v3 clientModel];
    v15 = [v14 clientModelId];
    [v3 dataHarvestingSamplingRate];
    int v17 = 138412802;
    uint64_t v18 = v12;
    __int16 v19 = 2112;
    v20 = v15;
    __int16 v21 = 2048;
    double v22 = v16;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "%@ - Not harvesting data for config with client model id %@. We failed to sample a value between 0 and 1 that is less than %f.", (uint8_t *)&v17, 0x20u);

LABEL_7:
  }
}

+ (id)metricsForConfig:(id)a3
{
  id v3 = a3;
  float v4 = objc_opt_new();
  BOOL v5 = [(id)objc_opt_class() candidateMetricsFromConfig:v3];
  [v4 setCandidateMetrics:v5];

  v6 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v7 = objc_opt_class();
  uint64_t v8 = NSNumber;
  uint64_t v9 = [v6 dateByAddingTimeInterval:-604800.0];
  [v9 timeIntervalSinceReferenceDate];
  uint64_t v10 = objc_msgSend(v8, "numberWithDouble:");
  long long v11 = NSNumber;
  [v6 timeIntervalSinceReferenceDate];
  long long v12 = objc_msgSend(v11, "numberWithDouble:");
  long long v13 = [v7 evaluationMetricsFromConfig:v3 startTime:v10 endTime:v12];
  [v4 setEvaluationMetricsOneWeekAgo:v13];

  long long v14 = objc_opt_class();
  v15 = NSNumber;
  float v16 = [v6 dateByAddingTimeInterval:-1209600.0];
  [v16 timeIntervalSinceReferenceDate];
  int v17 = objc_msgSend(v15, "numberWithDouble:");
  uint64_t v18 = NSNumber;
  __int16 v19 = [v6 dateByAddingTimeInterval:-604800.0];
  [v19 timeIntervalSinceReferenceDate];
  v20 = objc_msgSend(v18, "numberWithDouble:");
  __int16 v21 = [v14 evaluationMetricsFromConfig:v3 startTime:v17 endTime:v20];
  [v4 setEvaluationMetricsTwoWeeksAgo:v21];

  double v22 = objc_opt_class();
  uint64_t v23 = NSNumber;
  v24 = [v6 dateByAddingTimeInterval:-1814400.0];
  [v24 timeIntervalSinceReferenceDate];
  v25 = objc_msgSend(v23, "numberWithDouble:");
  v26 = NSNumber;
  v27 = [v6 dateByAddingTimeInterval:-1209600.0];
  [v27 timeIntervalSinceReferenceDate];
  v28 = objc_msgSend(v26, "numberWithDouble:");
  v29 = [v22 evaluationMetricsFromConfig:v3 startTime:v25 endTime:v28];
  [v4 setEvaluationMetricsThreeWeeksAgo:v29];

  v30 = objc_opt_class();
  v31 = NSNumber;
  v32 = [v6 dateByAddingTimeInterval:-2419200.0];
  [v32 timeIntervalSinceReferenceDate];
  v33 = objc_msgSend(v31, "numberWithDouble:");
  v34 = NSNumber;
  v35 = [v6 dateByAddingTimeInterval:-1814400.0];
  [v35 timeIntervalSinceReferenceDate];
  v36 = objc_msgSend(v34, "numberWithDouble:");
  v37 = [v30 evaluationMetricsFromConfig:v3 startTime:v33 endTime:v36];
  [v4 setEvaluationMetricsFourWeeksAgo:v37];

  v38 = objc_opt_class();
  v39 = NSNumber;
  v40 = [v6 dateByAddingTimeInterval:-2419200.0];
  [v40 timeIntervalSinceReferenceDate];
  v41 = objc_msgSend(v39, "numberWithDouble:");
  v42 = NSNumber;
  [v6 timeIntervalSinceReferenceDate];
  v43 = objc_msgSend(v42, "numberWithDouble:");
  v44 = [v38 evaluationMetricsFromConfig:v3 startTime:v41 endTime:v43];
  [v4 setEvaluationMetricsLastFourWeeks:v44];

  v45 = [(id)objc_opt_class() modelMetricsForConfig:v3];

  [v4 setModelMetrics:v45];
  return v4;
}

+ (id)candidateMetricsFromConfig:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_opt_new();
  v6 = objc_opt_new();
  BOOL v7 = [v4 clientModel];
  uint64_t v8 = [v7 clientModelId];
  uint64_t v9 = [v5 resultForClientModelName:v8 suggestionExecutableType:1 sessionType:0 removeDockedApps:0];

  uint64_t v10 = [v4 clientModel];
  long long v11 = [v10 clientModelId];
  long long v12 = [v5 resultForClientModelName:v11 suggestionExecutableType:1 sessionType:1 removeDockedApps:0];

  long long v13 = [v4 datastore];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __77__ATXCandidateRelevanceModelOfflineDataHarvester_candidateMetricsFromConfig___block_invoke;
  v31[3] = &unk_1E68B5920;
  id v32 = v9;
  id v33 = v12;
  id v34 = v6;
  id v35 = a1;
  id v14 = v6;
  id v15 = v12;
  id v16 = v9;
  int v17 = [v4 clientModel];
  uint64_t v18 = [v17 clientModelId];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __77__ATXCandidateRelevanceModelOfflineDataHarvester_candidateMetricsFromConfig___block_invoke_2;
  v28 = &unk_1E68B5948;
  id v29 = v4;
  id v30 = a1;
  id v19 = v4;
  [v13 receiveMostRecentVerifiedTrainedModelTrainingResults:v31 clientModelName:v18 completion:&v25];

  v20 = objc_msgSend(v14, "sortedArrayUsingComparator:", &__block_literal_global_225, v25, v26, v27, v28);
  unint64_t v21 = [v20 count];
  if (v21 >= 0x19) {
    uint64_t v22 = 25;
  }
  else {
    uint64_t v22 = v21;
  }
  uint64_t v23 = objc_msgSend(v20, "subarrayWithRange:", 0, v22);

  return v23;
}

void __77__ATXCandidateRelevanceModelOfflineDataHarvester_candidateMetricsFromConfig___block_invoke(uint64_t a1, void *a2)
{
  id v77 = a2;
  id v3 = objc_opt_new();
  id v4 = [v77 candidate];
  BOOL v5 = [v4 identifier];

  v6 = [v77 datasetMetadata];
  unsigned int v7 = [v6 numberOfPositiveSamples];
  if (v7 >= 0x65) {
    uint64_t v8 = 10 * (v7 / 0xA);
  }
  else {
    uint64_t v8 = v7;
  }
  [v3 setCandidateNumberOfPositiveSamples:v8];

  uint64_t v9 = [v77 datasetMetadata];
  unsigned int v10 = [v9 numberOfSamples];
  if (v10 >= 0x65) {
    uint64_t v11 = 10 * (v10 / 0xA);
  }
  else {
    uint64_t v11 = v10;
  }
  [v3 setCandidateNumberOfSamples:v11];

  long long v12 = [v77 datasetMetadata];
  objc_msgSend(v3, "setCandidateNumberOfDaysWithPositiveSamples:", objc_msgSend(v12, "numberOfDaysWithPositiveSamples"));

  long long v13 = [v77 model];
  unsigned int v14 = [v13 numberOfModelWeights];
  if (v14 >= 0x65) {
    uint64_t v15 = 10 * (v14 / 0xA);
  }
  else {
    uint64_t v15 = v14;
  }
  [v3 setCandidateNumberOfModelWeights:v15];

  id v16 = [v77 model];
  unsigned int v17 = [v16 numberOfNonZeroModelWeights];
  if (v17 >= 0x65) {
    uint64_t v18 = 10 * (v17 / 0xA);
  }
  else {
    uint64_t v18 = v17;
  }
  [v3 setCandidateNumberOfNonZeroModelWeights:v18];

  id v19 = [*(id *)(a1 + 32) engagedPerCandidate];
  v20 = [v19 objectForKeyedSubscript:v5];
  [v20 floatValue];
  double v22 = v21 / ((double)(unint64_t)[*(id *)(a1 + 32) numberOfSessions] + 0.000001);
  *(float *)&double v22 = v22;
  *(float *)&double v22 = roundf(*(float *)&v22 * 100.0) / 100.0;
  [v3 setCandidateShadowLaunchPercentage:v22];

  uint64_t v23 = [*(id *)(a1 + 32) shownInTop8PerCandidate];
  v24 = [v23 objectForKeyedSubscript:v5];
  [v24 floatValue];
  double v26 = v25 / ((double)(unint64_t)[*(id *)(a1 + 32) numberOfSessions] + 0.000001);
  *(float *)&double v26 = v26;
  *(float *)&double v26 = roundf(*(float *)&v26 * 100.0) / 100.0;
  [v3 setCandidateShadowShownPercentage:v26];

  v27 = [*(id *)(a1 + 32) engagedInTop8PerCandidate];
  v28 = [v27 objectForKeyedSubscript:v5];
  [v28 floatValue];
  double v30 = v29;
  v31 = [*(id *)(a1 + 32) shownInTop8PerCandidate];
  id v32 = [v31 objectForKeyedSubscript:v5];
  [v32 floatValue];
  double v34 = v30 / (v33 + 0.000001);
  *(float *)&double v34 = v34;
  *(float *)&double v34 = roundf(*(float *)&v34 * 100.0) / 100.0;
  [v3 setCandidateShadowPrecision:v34];

  id v35 = [*(id *)(a1 + 32) engagedInTop8PerCandidate];
  v36 = [v35 objectForKeyedSubscript:v5];
  [v36 floatValue];
  double v38 = v37;
  v39 = [*(id *)(a1 + 32) engagedPerCandidate];
  v40 = [v39 objectForKeyedSubscript:v5];
  [v40 floatValue];
  double v42 = v38 / (v41 + 0.000001);
  *(float *)&double v42 = v42;
  *(float *)&double v42 = roundf(*(float *)&v42 * 100.0) / 100.0;
  [v3 setCandidateShadowRecall:v42];

  v43 = *(void **)(a1 + 56);
  [v3 candidateShadowPrecision];
  LODWORD(v38) = v44;
  [v3 candidateShadowRecall];
  LODWORD(v46) = v45;
  LODWORD(v47) = LODWORD(v38);
  [v43 calculateF1ScoreWithPrecision:v47 recall:v46];
  objc_msgSend(v3, "setCandidateShadowF1:");
  v48 = [*(id *)(a1 + 40) engagedPerCandidate];
  v49 = [v48 objectForKeyedSubscript:v5];
  [v49 floatValue];
  double v51 = v50 / ((double)(unint64_t)[*(id *)(a1 + 40) numberOfSessions] + 0.000001);
  *(float *)&double v51 = v51;
  *(float *)&double v51 = roundf(*(float *)&v51 * 100.0) / 100.0;
  [v3 setCandidateUILaunchPercentage:v51];

  v52 = [*(id *)(a1 + 40) shownInTop8PerCandidate];
  v53 = [v52 objectForKeyedSubscript:v5];
  [v53 floatValue];
  double v55 = v54 / ((double)(unint64_t)[*(id *)(a1 + 40) numberOfSessions] + 0.000001);
  *(float *)&double v55 = v55;
  *(float *)&double v55 = roundf(*(float *)&v55 * 100.0) / 100.0;
  [v3 setCandidateUIShownPercentage:v55];

  v56 = [*(id *)(a1 + 40) engagedInTop8PerCandidate];
  v57 = [v56 objectForKeyedSubscript:v5];
  [v57 floatValue];
  double v59 = v58;
  v60 = [*(id *)(a1 + 40) shownInTop8PerCandidate];
  v61 = [v60 objectForKeyedSubscript:v5];
  [v61 floatValue];
  double v63 = v59 / (v62 + 0.000001);
  *(float *)&double v63 = v63;
  *(float *)&double v63 = roundf(*(float *)&v63 * 100.0) / 100.0;
  [v3 setCandidateUIPrecision:v63];

  v64 = [*(id *)(a1 + 40) engagedInTop8PerCandidate];
  v65 = [v64 objectForKeyedSubscript:v5];
  [v65 floatValue];
  double v67 = v66;
  v68 = [*(id *)(a1 + 40) engagedPerCandidate];
  v69 = [v68 objectForKeyedSubscript:v5];
  [v69 floatValue];
  double v71 = v67 / (v70 + 0.000001);
  *(float *)&double v71 = v71;
  *(float *)&double v71 = roundf(*(float *)&v71 * 100.0) / 100.0;
  [v3 setCandidateUIRecall:v71];

  v72 = *(void **)(a1 + 56);
  [v3 candidateUIPrecision];
  LODWORD(v67) = v73;
  [v3 candidateUIRecall];
  LODWORD(v75) = v74;
  LODWORD(v76) = LODWORD(v67);
  [v72 calculateF1ScoreWithPrecision:v76 recall:v75];
  objc_msgSend(v3, "setCandidateUIF1:");
  [v3 setCandidateIdentifier:v5];
  [*(id *)(a1 + 48) addObject:v3];
}

void __77__ATXCandidateRelevanceModelOfflineDataHarvester_candidateMetricsFromConfig___block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v3 = __atxlog_handle_relevance_model();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __77__ATXCandidateRelevanceModelOfflineDataHarvester_candidateMetricsFromConfig___block_invoke_2_cold_1(a1);
    }
  }
}

uint64_t __77__ATXCandidateRelevanceModelOfflineDataHarvester_candidateMetricsFromConfig___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v5, "candidateNumberOfPositiveSamples"));
  unsigned int v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "candidateNumberOfPositiveSamples"));
  uint64_t v8 = [v6 compare:v7];

  if (!v8)
  {
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v5, "candidateNumberOfPositiveSamples"));
    unsigned int v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "candidateNumberOfPositiveSamples"));
    uint64_t v8 = [v9 compare:v10];
  }
  return v8;
}

+ (id)evaluationMetricsFromConfig:(id)a3 startTime:(id)a4 endTime:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  unsigned int v10 = [[ATXProactiveSuggestionClientModelEvaluator alloc] initWithStartTime:v9 endTime:v8];

  uint64_t v11 = objc_opt_new();
  long long v12 = [v7 clientModel];
  long long v13 = [v12 clientModelId];
  unsigned int v14 = [(ATXProactiveSuggestionClientModelEvaluator *)v10 resultForClientModelName:v13 suggestionExecutableType:1 sessionType:0 removeDockedApps:0];

  double v15 = (float)(unint64_t)[v14 engagedInTop1];
  double v16 = v15 / ((double)(unint64_t)[v14 numberOfSessionsWithPredictions] + 0.000001);
  *(float *)&double v16 = v16;
  *(float *)&double v16 = roundf(*(float *)&v16 * 100.0) / 100.0;
  [v11 setShadowEvaluationSuccessAt1:v16];
  double v17 = (float)(unint64_t)[v14 engagedInTop2];
  double v18 = v17 / ((double)(unint64_t)[v14 numberOfSessionsWithPredictions] + 0.000001);
  *(float *)&double v18 = v18;
  *(float *)&double v18 = roundf(*(float *)&v18 * 100.0) / 100.0;
  [v11 setShadowEvaluationSuccessAt2:v18];
  double v19 = (float)(unint64_t)[v14 engagedInTop4];
  double v20 = v19 / ((double)(unint64_t)[v14 numberOfSessionsWithPredictions] + 0.000001);
  *(float *)&double v20 = v20;
  *(float *)&double v20 = roundf(*(float *)&v20 * 100.0) / 100.0;
  [v11 setShadowEvaluationSuccessAt4:v20];
  double v21 = (float)(unint64_t)[v14 engagedInTop8];
  double v22 = v21 / ((double)(unint64_t)[v14 numberOfSessionsWithPredictions] + 0.000001);
  *(float *)&double v22 = v22;
  *(float *)&double v22 = roundf(*(float *)&v22 * 100.0) / 100.0;
  [v11 setShadowEvaluationSuccessAt8:v22];
  [v14 reciprocalRank];
  double v24 = v23 / ((double)(unint64_t)[v14 numberOfSessionsWithPredictions] + 0.000001);
  *(float *)&double v24 = v24;
  *(float *)&double v24 = roundf(*(float *)&v24 * 100.0) / 100.0;
  [v11 setShadowEvaluationMRR:v24];
  uint64_t v25 = [v14 numberOfSessionsWithPredictions];
  uint64_t v26 = v25;
  if (v25 >= 0x65) {
    uint64_t v26 = 10 * (v25 / 0xA);
  }
  [v11 setShadowEvaluationNumberOfSessionsWithPredictions:v26];
  uint64_t v27 = [v14 numberOfSessions];
  uint64_t v28 = v27;
  if (v27 >= 0x65) {
    uint64_t v28 = 10 * (v27 / 0xA);
  }
  [v11 setShadowEvaluationNumberOfSessions:v28];
  float v29 = [v7 clientModel];
  double v30 = [v29 clientModelId];
  v31 = [(ATXProactiveSuggestionClientModelEvaluator *)v10 resultForClientModelName:v30 suggestionExecutableType:1 sessionType:1 removeDockedApps:0];

  double v32 = (float)(unint64_t)[v31 engagedInTop1];
  double v33 = v32 / ((double)(unint64_t)[v31 numberOfSessionsWithPredictions] + 0.000001);
  *(float *)&double v33 = v33;
  *(float *)&double v33 = roundf(*(float *)&v33 * 100.0) / 100.0;
  [v11 setUiEvaluationSuccessAt1:v33];
  double v34 = (float)(unint64_t)[v31 engagedInTop2];
  double v35 = v34 / ((double)(unint64_t)[v31 numberOfSessionsWithPredictions] + 0.000001);
  *(float *)&double v35 = v35;
  *(float *)&double v35 = roundf(*(float *)&v35 * 100.0) / 100.0;
  [v11 setUiEvaluationSuccessAt2:v35];
  double v36 = (float)(unint64_t)[v31 engagedInTop4];
  double v37 = v36 / ((double)(unint64_t)[v31 numberOfSessionsWithPredictions] + 0.000001);
  *(float *)&double v37 = v37;
  *(float *)&double v37 = roundf(*(float *)&v37 * 100.0) / 100.0;
  [v11 setUiEvaluationSuccessAt4:v37];
  double v38 = (float)(unint64_t)[v31 engagedInTop8];
  double v39 = v38 / ((double)(unint64_t)[v31 numberOfSessionsWithPredictions] + 0.000001);
  *(float *)&double v39 = v39;
  *(float *)&double v39 = roundf(*(float *)&v39 * 100.0) / 100.0;
  [v11 setUiEvaluationSuccessAt8:v39];
  [v31 reciprocalRank];
  double v41 = v40 / ((double)(unint64_t)[v31 numberOfSessionsWithPredictions] + 0.000001);
  *(float *)&double v41 = v41;
  *(float *)&double v41 = roundf(*(float *)&v41 * 100.0) / 100.0;
  [v11 setUiEvaluationMRR:v41];
  uint64_t v42 = [v31 numberOfSessionsWithPredictions];
  uint64_t v43 = v42;
  if (v42 >= 0x65) {
    uint64_t v43 = 10 * (v42 / 0xA);
  }
  [v11 setUiEvaluationNumberOfSessionsWithPredictions:v43];
  uint64_t v44 = [v31 numberOfSessions];
  uint64_t v45 = v44;
  if (v44 >= 0x65) {
    uint64_t v45 = 10 * (v44 / 0xA);
  }
  [v11 setUiEvaluationNumberOfSessions:v45];
  double v46 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:15];
  double v47 = [(ATXProactiveSuggestionClientModelEvaluator *)v10 resultForClientModelName:v46 suggestionExecutableType:1 sessionType:0 removeDockedApps:0];
  double v48 = (float)(unint64_t)[v47 engagedInTop1];
  double v49 = v48 / ((double)(unint64_t)[v47 numberOfSessionsWithPredictions] + 0.000001);
  *(float *)&double v49 = v49;
  *(float *)&double v49 = roundf(*(float *)&v49 * 100.0) / 100.0;
  [v11 setProdShadowEvaluationSuccessAt1:v49];
  double v50 = (float)(unint64_t)[v47 engagedInTop2];
  double v51 = v50 / ((double)(unint64_t)[v47 numberOfSessionsWithPredictions] + 0.000001);
  *(float *)&double v51 = v51;
  *(float *)&double v51 = roundf(*(float *)&v51 * 100.0) / 100.0;
  [v11 setProdShadowEvaluationSuccessAt2:v51];
  double v52 = (float)(unint64_t)[v47 engagedInTop4];
  double v53 = v52 / ((double)(unint64_t)[v47 numberOfSessionsWithPredictions] + 0.000001);
  *(float *)&double v53 = v53;
  *(float *)&double v53 = roundf(*(float *)&v53 * 100.0) / 100.0;
  [v11 setProdShadowEvaluationSuccessAt4:v53];
  double v54 = (float)(unint64_t)[v47 engagedInTop8];
  double v55 = v54 / ((double)(unint64_t)[v47 numberOfSessionsWithPredictions] + 0.000001);
  *(float *)&double v55 = v55;
  *(float *)&double v55 = roundf(*(float *)&v55 * 100.0) / 100.0;
  [v11 setProdShadowEvaluationSuccessAt8:v55];
  [v47 reciprocalRank];
  double v57 = v56 / ((double)(unint64_t)[v47 numberOfSessionsWithPredictions] + 0.000001);
  *(float *)&double v57 = v57;
  *(float *)&double v57 = roundf(*(float *)&v57 * 100.0) / 100.0;
  [v11 setProdShadowEvaluationMRR:v57];
  uint64_t v58 = [v47 numberOfSessionsWithPredictions];
  uint64_t v59 = v58;
  if (v58 >= 0x65) {
    uint64_t v59 = 10 * (v58 / 0xA);
  }
  [v11 setProdShadowEvaluationNumberOfSessionsWithPredictions:v59];
  uint64_t v60 = [v47 numberOfSessions];
  uint64_t v61 = v60;
  if (v60 >= 0x65) {
    uint64_t v61 = 10 * (v60 / 0xA);
  }
  [v11 setProdShadowEvaluationNumberOfSessions:v61];
  float v62 = [(ATXProactiveSuggestionClientModelEvaluator *)v10 resultForClientModelName:v46 suggestionExecutableType:1 sessionType:1 removeDockedApps:0];
  double v63 = (float)(unint64_t)[v62 engagedInTop1];
  double v64 = v63 / ((double)(unint64_t)[v62 numberOfSessionsWithPredictions] + 0.000001);
  *(float *)&double v64 = v64;
  *(float *)&double v64 = roundf(*(float *)&v64 * 100.0) / 100.0;
  [v11 setProdUIEvaluationSuccessAt1:v64];
  double v65 = (float)(unint64_t)[v62 engagedInTop2];
  double v66 = v65 / ((double)(unint64_t)[v62 numberOfSessionsWithPredictions] + 0.000001);
  *(float *)&double v66 = v66;
  *(float *)&double v66 = roundf(*(float *)&v66 * 100.0) / 100.0;
  [v11 setProdUIEvaluationSuccessAt2:v66];
  double v67 = (float)(unint64_t)[v62 engagedInTop4];
  double v68 = v67 / ((double)(unint64_t)[v62 numberOfSessionsWithPredictions] + 0.000001);
  *(float *)&double v68 = v68;
  *(float *)&double v68 = roundf(*(float *)&v68 * 100.0) / 100.0;
  [v11 setProdUIEvaluationSuccessAt4:v68];
  double v69 = (float)(unint64_t)[v62 engagedInTop8];
  double v70 = v69 / ((double)(unint64_t)[v62 numberOfSessionsWithPredictions] + 0.000001);
  *(float *)&double v70 = v70;
  *(float *)&double v70 = roundf(*(float *)&v70 * 100.0) / 100.0;
  [v11 setProdUIEvaluationSuccessAt8:v70];
  [v62 reciprocalRank];
  double v72 = v71 / ((double)(unint64_t)[v62 numberOfSessionsWithPredictions] + 0.000001);
  *(float *)&double v72 = v72;
  *(float *)&double v72 = roundf(*(float *)&v72 * 100.0) / 100.0;
  [v11 setProdUIEvaluationMRR:v72];
  uint64_t v73 = [v62 numberOfSessionsWithPredictions];
  uint64_t v74 = v73;
  if (v73 >= 0x65) {
    uint64_t v74 = 10 * (v73 / 0xA);
  }
  [v11 setProdUIEvaluationNumberOfSessionsWithPredictions:v74];
  uint64_t v75 = [v62 numberOfSessions];
  uint64_t v76 = v75;
  if (v75 >= 0x65) {
    uint64_t v76 = 10 * (v75 / 0xA);
  }
  [v11 setProdUIEvaluationNumberOfSessions:v76];

  return v11;
}

+ (id)modelMetricsForConfig:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [MEMORY[0x1E4F93550] sharedInstance];
  v6 = [v5 abGroup];
  [v4 setBlendingABGroup:v6];

  id v7 = [v3 abGroupIdentifier];
  [v4 setAbGroup:v7];

  id v8 = [v3 clientModel];
  id v9 = [v8 clientModelId];
  [v4 setClientModelId:v9];

  objc_msgSend(v4, "setPipelineEnabled:", objc_msgSend(v3, "isEnabled"));
  [v4 setHasDefaultHyperParams:1];
  uint64_t v86 = 0;
  v87 = &v86;
  uint64_t v88 = 0x2020000000;
  int v89 = 0;
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x2020000000;
  int v85 = 0;
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x2020000000;
  int v81 = 0;
  uint64_t v74 = 0;
  uint64_t v75 = &v74;
  uint64_t v76 = 0x2020000000;
  uint64_t v77 = 0;
  uint64_t v68 = 0;
  double v69 = &v68;
  uint64_t v70 = 0x3032000000;
  float v71 = __Block_byref_object_copy__100;
  double v72 = __Block_byref_object_dispose__100;
  id v73 = 0;
  uint64_t v64 = 0;
  double v65 = &v64;
  uint64_t v66 = 0x2020000000;
  char v67 = 0;
  uint64_t v60 = 0;
  uint64_t v61 = &v60;
  uint64_t v62 = 0x2020000000;
  int v63 = 0;
  uint64_t v56 = 0;
  double v57 = (unsigned int *)&v56;
  uint64_t v58 = 0x2020000000;
  int v59 = 0;
  uint64_t v52 = 0;
  double v53 = (unsigned int *)&v52;
  uint64_t v54 = 0x2020000000;
  int v55 = 0;
  uint64_t v48 = 0;
  double v49 = &v48;
  uint64_t v50 = 0x2020000000;
  uint64_t v51 = 0;
  unsigned int v10 = [v3 datastore];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __72__ATXCandidateRelevanceModelOfflineDataHarvester_modelMetricsForConfig___block_invoke;
  v47[3] = &unk_1E68B5990;
  v47[4] = &v86;
  v47[5] = &v82;
  v47[6] = &v78;
  v47[7] = &v74;
  v47[8] = &v68;
  v47[9] = &v64;
  v47[10] = &v60;
  v47[11] = &v56;
  v47[12] = &v52;
  v47[13] = &v48;
  uint64_t v11 = [v3 clientModel];
  long long v12 = [v11 clientModelId];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __72__ATXCandidateRelevanceModelOfflineDataHarvester_modelMetricsForConfig___block_invoke_2;
  v44[3] = &unk_1E68B5948;
  id v46 = a1;
  id v13 = v3;
  id v45 = v13;
  [v10 receiveMostRecentVerifiedTrainedModelTrainingResults:v47 clientModelName:v12 completion:v44];

  [v4 setHasTrainedModel:*((unsigned __int8 *)v65 + 24)];
  uint64_t v14 = v75[3];
  if (v14)
  {
    if (v14 == 1)
    {
      double v15 = @"LogisticRegression";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %lu)", v75[3]);
      double v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    double v15 = @"Unknown";
  }
  [v4 setModelType:v15];

  LODWORD(v16) = *((_DWORD *)v61 + 6);
  uint64_t v17 = ((float)v53[6] / ((double)v16 + 0.0001));
  if (v17 >= 0x65) {
    uint64_t v17 = 10 * (v17 / 0xA);
  }
  [v4 setAvgNumberOfModelWeights:v17];
  LODWORD(v18) = *((_DWORD *)v61 + 6);
  uint64_t v19 = ((float)v57[6] / ((double)v18 + 0.0001));
  if (v19 >= 0x65) {
    uint64_t v19 = 10 * (v19 / 0xA);
  }
  [v4 setAvgNumberOfNonZeroModelWeights:v19];
  uint64_t v20 = *((unsigned int *)v61 + 6);
  if (v20 >= 0x65) {
    uint64_t v20 = 10 * (v20 / 0xA);
  }
  [v4 setNumberOfCandidateModels:v20];
  double v21 = objc_opt_class();
  uint64_t v22 = v69[5];
  float v23 = [MEMORY[0x1E4F1C9C8] now];
  objc_msgSend(v4, "setModelAgeInDays:", objc_msgSend(v21, "daysBetweenStartDate:endDate:", v22, v23));

  uint64_t v24 = *((unsigned int *)v83 + 6);
  if (v24 >= 0x65) {
    uint64_t v24 = 10 * (v24 / 0xA);
  }
  [v4 setTrainDataNumberOfPositiveSamples:v24];
  uint64_t v25 = *((unsigned int *)v87 + 6);
  if (v25 >= 0x65) {
    uint64_t v25 = 10 * (v25 / 0xA);
  }
  [v4 setTrainDataNumberOfSamples:v25];
  uint64_t v26 = *((unsigned int *)v79 + 6);
  if (v26 >= 0x65) {
    uint64_t v26 = 10 * (v26 / 0xA);
  }
  [v4 setTrainDataNumberOfDaysWithPositiveSamples:v26];
  uint64_t v27 = *((unsigned int *)v61 + 6);
  if (v27 >= 0x65) {
    uint64_t v27 = 10 * (v27 / 0xA);
  }
  [v4 setTrainDataNumberOfCandidates:v27];
  unint64_t v28 = v49[3];
  if (v28 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %li)", v49[3]);
    float v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    float v29 = off_1E68B59B0[v28];
  }
  [v4 setExecutableType:v29];

  double v30 = [v13 modelTrainingPlan];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v32 = [v13 modelTrainingPlan];
    double v33 = +[ATXCandidateRelevanceLogisticRegressionModelTrainingPlan stringForPMLRegularizationStrategy:](ATXCandidateRelevanceLogisticRegressionModelTrainingPlan, "stringForPMLRegularizationStrategy:", [v32 regularizationStrategy]);
    [v4 setLogisticRegressionRegularizationStrategy:v33];

    [v32 regularizationRate];
    *(float *)&double v35 = roundf(v34 * 100.0) / 100.0;
    [v4 setLogisticRegressionRegularizationRate:v35];
    [v32 regularizationL1Ratio];
    *(float *)&double v37 = roundf(v36 * 100.0) / 100.0;
    [v4 setLogisticRegressionRegularizationL1Ratio:v37];
    [v32 learningRate];
    *(float *)&double v39 = roundf(v38 * 100.0) / 100.0;
    [v4 setLearningRate:v39];
    uint64_t v40 = [v32 minIterations];
    uint64_t v41 = v40;
    if (v40 >= 0x65) {
      uint64_t v41 = 10 * (v40 / 0xA);
    }
    [v4 setMinIterations:v41];
    [v32 stoppingThreshold];
    objc_msgSend(v4, "setStoppingThreshold:");
  }
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v82, 8);
  _Block_object_dispose(&v86, 8);

  return v4;
}

void __72__ATXCandidateRelevanceModelOfflineDataHarvester_modelMetricsForConfig___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 datasetMetadata];
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) += [v4 numberOfSamples];

  id v5 = [v3 datasetMetadata];
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) += [v5 numberOfPositiveSamples];

  v6 = [v3 datasetMetadata];
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = [v6 numberOfDaysWithSamples];

  id v7 = [v3 model];
  *(void *)(*(void *)(a1[7] + 8) + 24) = [v7 modelType];

  uint64_t v8 = [v3 trainDate];
  uint64_t v9 = *(void *)(a1[8] + 8);
  unsigned int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
  ++*(_DWORD *)(*(void *)(a1[10] + 8) + 24);
  uint64_t v11 = [v3 model];
  *(_DWORD *)(*(void *)(a1[11] + 8) + 24) += [v11 numberOfNonZeroModelWeights];

  long long v12 = [v3 model];
  *(_DWORD *)(*(void *)(a1[12] + 8) + 24) += [v12 numberOfModelWeights];

  id v13 = [v3 candidate];

  *(void *)(*(void *)(a1[13] + 8) + 24) = [v13 suggestionExecutableType];
}

void __72__ATXCandidateRelevanceModelOfflineDataHarvester_modelMetricsForConfig___block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v3 = __atxlog_handle_relevance_model();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __77__ATXCandidateRelevanceModelOfflineDataHarvester_candidateMetricsFromConfig___block_invoke_2_cold_1(a1);
    }
  }
}

+ (unsigned)daysBetweenStartDate:(id)a3 endDate:(id)a4
{
  unsigned int v4 = -1;
  if (a3 && a4)
  {
    v6 = (void *)MEMORY[0x1E4F1C9A8];
    id v7 = a4;
    id v8 = a3;
    uint64_t v9 = [v6 currentCalendar];
    unsigned int v10 = [v9 components:16 fromDate:v8 toDate:v7 options:0];

    unsigned int v4 = [v10 day];
  }
  return v4;
}

+ (float)calculateF1ScoreWithPrecision:(float)a3 recall:(float)a4
{
  float v4 = (float)((float)(a3 * a4) + (float)(a3 * a4)) / ((float)(a3 + a4) + 0.000001);
  return roundf(v4 * 100.0) / 100.0;
}

- (void).cxx_destruct
{
}

void __77__ATXCandidateRelevanceModelOfflineDataHarvester_candidateMetricsFromConfig___block_invoke_2_cold_1(uint64_t a1)
{
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  float v4 = [*(id *)(a1 + 32) clientModel];
  id v5 = [v4 clientModelId];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v6, v7, "%@ - Error retrieving most recent verified trained model for %@.", v8, v9, v10, v11, v12);
}

@end