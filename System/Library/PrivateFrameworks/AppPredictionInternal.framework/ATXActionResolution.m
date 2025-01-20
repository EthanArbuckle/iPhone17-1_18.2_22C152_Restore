@interface ATXActionResolution
- (ATXActionResolution)init;
- (ATXActionResolution)initWithSlotResolver:(id)a3 predictionContextBuilder:(id)a4;
- (id)actionPredictionsForActionKey:(id)a3 statistics:(id)a4 appActionPredictionItem:(const ATXPredictionItem *)a5 appActionLogProbability:(double)a6 scoreLogger:(id)a7 andLimit:(int)a8 forMagicalMoments:(BOOL)a9 currentDate:(id)a10;
- (id)actionPredictionsForActionKey:(id)a3 statistics:(id)a4 appActionPredictionItem:(const ATXPredictionItem *)a5 appActionLogProbability:(double)a6 scoreLogger:(id)a7 andLimit:(int)a8 forMagicalMoments:(BOOL)a9 predictionItemsToKeep:(void *)a10 currentDate:(id)a11;
- (id)statisticsForActionKey:(id)a3;
- (id)statisticsForActionKey:(id)a3 context:(id)a4;
@end

@implementation ATXActionResolution

- (ATXActionResolution)init
{
  v3 = objc_opt_new();
  v4 = +[ATXPredictionContextBuilder sharedInstance];
  v5 = [(ATXActionResolution *)self initWithSlotResolver:v3 predictionContextBuilder:v4];

  return v5;
}

- (ATXActionResolution)initWithSlotResolver:(id)a3 predictionContextBuilder:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXActionResolution;
  v9 = [(ATXActionResolution *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_slotResolver, a3);
    objc_storeStrong((id *)&v10->_predictionContextBuilder, a4);
  }

  return v10;
}

- (id)statisticsForActionKey:(id)a3
{
  id v4 = a3;
  slotResolver = self->_slotResolver;
  v6 = [(ATXPredictionContextBuilderProtocol *)self->_predictionContextBuilder predictionContextForCurrentContext];
  id v7 = [(ATXSlotResolution *)slotResolver statisticsForActionKey:v4 context:v6];

  return v7;
}

- (id)statisticsForActionKey:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(ATXSlotResolution *)self->_slotResolver statisticsForActionKey:v6 context:v7];
  }
  else
  {
    v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ATXActionResolution statisticsForActionKey:context:](v9);
    }

    id v8 = 0;
  }

  return v8;
}

- (id)actionPredictionsForActionKey:(id)a3 statistics:(id)a4 appActionPredictionItem:(const ATXPredictionItem *)a5 appActionLogProbability:(double)a6 scoreLogger:(id)a7 andLimit:(int)a8 forMagicalMoments:(BOOL)a9 currentDate:(id)a10
{
  v10 = [(ATXActionResolution *)self actionPredictionsForActionKey:a3 statistics:a4 appActionPredictionItem:a5 appActionLogProbability:a7 scoreLogger:*(void *)&a8 andLimit:a9 forMagicalMoments:a6 predictionItemsToKeep:0 currentDate:a10];
  return v10;
}

- (id)actionPredictionsForActionKey:(id)a3 statistics:(id)a4 appActionPredictionItem:(const ATXPredictionItem *)a5 appActionLogProbability:(double)a6 scoreLogger:(id)a7 andLimit:(int)a8 forMagicalMoments:(BOOL)a9 predictionItemsToKeep:(void *)a10 currentDate:(id)a11
{
  uint64_t v11 = *(void *)&a8;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  v19 = [(ATXSlotResolution *)self->_slotResolver actionPredictionsForStatistics:v18 appActionPredictionItem:a5 appActionLogProbability:a7 scoreLogger:a11 currentDate:a6];
  v20 = +[ATXActionPredictionsHelpers processCandidateActionPredictions:v19 limit:v11 predictionItemsToKeep:a10];

  v21 = +[_ATXActionUtils getBundleIdAndActionTypeFromActionKey:v17];
  v22 = [v21 first];
  uint64_t v23 = [v21 second];
  v24 = (void *)v23;
  if (v22 && v23)
  {
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    int v27 = [v24 isEqualToString:v26];

    if (v27)
    {
      uint64_t v28 = [MEMORY[0x1E4F4AF00] isSystemAppForBundleId:v22];
      v29 = [MEMORY[0x1E4F4B390] getUpcomingMediaForBundle:v22 isInternalApplication:v28];
      uint64_t v30 = +[ATXMediaActionPrediction updatePlayMediaActionPredictions:v20 withUpcomingMedia:v29 forActionKey:v17 appActionPredictionItem:a5 appActionLogProbability:v18 statistics:a6];

      v20 = (void *)v30;
    }
    v31 = +[_ATXActionUtils filterContainersWithNilAction:v20];
  }
  else
  {
    v32 = __atxlog_handle_default();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = 138412290;
      id v35 = v17;
      _os_log_impl(&dword_1D0FA3000, v32, OS_LOG_TYPE_DEFAULT, "Error parsing '%@'", (uint8_t *)&v34, 0xCu);
    }

    v31 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionContextBuilder, 0);
  objc_storeStrong((id *)&self->_slotResolver, 0);
}

- (void)statisticsForActionKey:(os_log_t)log context:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Can't generate statistics for action key since ATXPredictionContext is nil", v1, 2u);
}

@end