@interface ATXCandidateRelevanceModelDataStore
- (ATXCandidateRelevanceModelDataStore)init;
- (ATXCandidateRelevanceModelDataStore)initWithDataStore:(id)a3;
- (BOOL)isModelUUIDVerified:(id)a3;
- (id)cachedCandidatesForModelId:(id)a3 earliestDate:(id)a4;
- (id)clientModelNamesWithTrainedRelevanceModels;
- (id)idsInTableWithName:(id)a3;
- (id)modelUUIDToTrainDateForClientModelName:(id)a3;
- (id)mostRecentVerifiedTrainDateForClientModelName:(id)a3;
- (id)mostRecentVerifiedTrainingResultsForClientModelName:(id)a3;
- (id)trainingResultsForClientModelName:(id)a3 modelUUID:(id)a4;
- (int64_t)candidateIdForCandidate:(id)a3 error:(id *)a4;
- (int64_t)datasetMetadataIdForDatasetMetadata:(id)a3 error:(id *)a4;
- (int64_t)featurizationManagerIdForFeaturizationManager:(id)a3 error:(id *)a4;
- (unint64_t)numberOfCandidateIds;
- (unint64_t)numberOfDatasetMetadataIds;
- (unint64_t)numberOfFeaturizationManagerIds;
- (unint64_t)numberOfTrainedModels;
- (void)cacheSelectedCandidates:(id)a3 featurizationManager:(id)a4 modelId:(id)a5;
- (void)deleteCachedCandidatesForModelId:(id)a3;
- (void)deleteRowsWithIds:(id)a3 fromTableWithName:(id)a4;
- (void)deleteTrainedModelsWithTrainDateOlderThanDate:(id)a3;
- (void)receiveMostRecentVerifiedTrainedModelTrainingResults:(id)a3 clientModelName:(id)a4 completion:(id)a5;
- (void)receiveMostRecentVerifiedTrainedModelTrainingResults:(id)a3 completion:(id)a4;
- (void)receiveTrainingResult:(id)a3 completion:(id)a4 modelUUID:(id)a5 clientModelName:(id)a6;
- (void)writeSuccessfulVerificationForModelUUID:(id)a3;
- (void)writeTrainingResult:(id)a3;
- (void)writeVerificationStatusForModelUUID:(id)a3 clientModelName:(id)a4 expectedNumberOfModels:(unint64_t)a5;
@end

@implementation ATXCandidateRelevanceModelDataStore

- (ATXCandidateRelevanceModelDataStore)init
{
  v3 = +[_ATXDataStore sharedInstance];
  v4 = [(ATXCandidateRelevanceModelDataStore *)self initWithDataStore:v3];

  return v4;
}

- (ATXCandidateRelevanceModelDataStore)initWithDataStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXCandidateRelevanceModelDataStore;
  v6 = [(ATXCandidateRelevanceModelDataStore *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataStore, a3);
  }

  return v7;
}

- (void)writeTrainingResult:(id)a3
{
  id v4 = a3;
  id v5 = [v4 featurizationManager];
  id v27 = 0;
  int64_t v6 = [(ATXCandidateRelevanceModelDataStore *)self featurizationManagerIdForFeaturizationManager:v5 error:&v27];
  id v7 = v27;

  if (v7)
  {
    v8 = __atxlog_handle_relevance_model();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ATXCandidateRelevanceModelDataStore writeTrainingResult:].cold.4();
    }
  }
  else
  {
    objc_super v9 = [v4 candidate];
    id v26 = 0;
    int64_t v10 = [(ATXCandidateRelevanceModelDataStore *)self candidateIdForCandidate:v9 error:&v26];
    id v7 = v26;

    if (v7)
    {
      v8 = __atxlog_handle_relevance_model();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[ATXCandidateRelevanceModelDataStore writeTrainingResult:]();
      }
    }
    else
    {
      v11 = [v4 datasetMetadata];
      id v25 = 0;
      int64_t v12 = [(ATXCandidateRelevanceModelDataStore *)self datasetMetadataIdForDatasetMetadata:v11 error:&v25];
      id v7 = v25;

      if (v7)
      {
        v8 = __atxlog_handle_relevance_model();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[ATXCandidateRelevanceModelDataStore writeTrainingResult:]();
        }
      }
      else
      {
        v13 = (void *)MEMORY[0x1D25F6CC0]();
        v14 = (void *)MEMORY[0x1E4F28DB0];
        v15 = [v4 model];
        id v24 = 0;
        v8 = [v14 archivedDataWithRootObject:v15 requiringSecureCoding:1 error:&v24];
        id v7 = v24;

        if (v7)
        {
          v16 = __atxlog_handle_relevance_model();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[ATXCandidateRelevanceModelDataStore writeTrainingResult:]();
          }
        }
        else
        {
          dataStore = self->_dataStore;
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __59__ATXCandidateRelevanceModelDataStore_writeTrainingResult___block_invoke;
          v18[3] = &unk_1E68AECC0;
          v18[4] = self;
          id v19 = v4;
          int64_t v21 = v10;
          v8 = v8;
          v20 = v8;
          int64_t v22 = v6;
          int64_t v23 = v12;
          [(_ATXDataStore *)dataStore _doSync:v18];
        }
      }
    }
  }
}

void __59__ATXCandidateRelevanceModelDataStore_writeTrainingResult___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__ATXCandidateRelevanceModelDataStore_writeTrainingResult___block_invoke_2;
  v7[3] = &unk_1E68AECC0;
  v3 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v4 = v3;
  int64_t v6 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v8 = v4;
  uint64_t v10 = v5;
  id v9 = v6;
  long long v11 = *(_OWORD *)(a1 + 64);
  [v2 writeTransaction:v7];
}

void __59__ATXCandidateRelevanceModelDataStore_writeTrainingResult___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__ATXCandidateRelevanceModelDataStore_writeTrainingResult___block_invoke_3;
  v6[3] = &unk_1E68AEC98;
  id v3 = *(id *)(a1 + 40);
  uint64_t v5 = *(void **)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  id v7 = v3;
  uint64_t v9 = v4;
  id v8 = v5;
  long long v10 = *(_OWORD *)(a1 + 64);
  [v2 prepAndRunQuery:@"INSERT INTO relevanceCandidateModels (modelUUID, clientModelName, candidateId, candidateModelData, featurizationManagerId, trainDate, datasetMetadataId, isVerified) VALUES (:modelUUID, :clientModelName, :candidateId, :candidateModelData, :featurizationManagerId, :trainDate, :datasetMetadataId, :isVerified)", v6, 0, 0 onPrep onRow onError];
}

void __59__ATXCandidateRelevanceModelDataStore_writeTrainingResult___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v9 = a2;
  uint64_t v4 = [v3 modelUUID];
  uint64_t v5 = [v4 UUIDString];
  [v9 bindNamedParam:":modelUUID" toNSString:v5];

  int64_t v6 = [*(id *)(a1 + 32) clientModelName];
  [v9 bindNamedParam:":clientModelName" toNSString:v6];

  [v9 bindNamedParam:":candidateId" toInt64:*(void *)(a1 + 48)];
  [v9 bindNamedParam:":candidateModelData" toNSData:*(void *)(a1 + 40)];
  [v9 bindNamedParam:":featurizationManagerId" toInt64:*(void *)(a1 + 56)];
  id v7 = [*(id *)(a1 + 32) trainDate];
  [v7 timeIntervalSinceReferenceDate];
  [v9 bindNamedParam:":trainDate" toInt64:(uint64_t)v8];

  [v9 bindNamedParam:":datasetMetadataId" toInt64:*(void *)(a1 + 64)];
  objc_msgSend(v9, "bindNamedParam:toInteger:", ":isVerified", objc_msgSend(*(id *)(a1 + 32), "isVerified"));
}

- (int64_t)featurizationManagerIdForFeaturizationManager:(id)a3 error:(id *)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  id v7 = (void *)MEMORY[0x1D25F6CC0]();
  id v27 = 0;
  double v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v27];
  id v9 = v27;
  if (v9)
  {
    if (a4)
    {
      long long v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v34 = *MEMORY[0x1E4F28228];
      v35[0] = @"Failed to serialize featurizationManager";
      long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
      *a4 = [v10 errorWithDomain:@"ATXCandidateRelevanceModelDataStore" code:1 userInfo:v11];
    }
    int64_t v12 = v29[3];
  }
  else
  {
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    dataStore = self->_dataStore;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __91__ATXCandidateRelevanceModelDataStore_featurizationManagerIdForFeaturizationManager_error___block_invoke;
    v19[3] = &unk_1E68AED10;
    v19[4] = self;
    id v20 = v8;
    int64_t v21 = &v28;
    int64_t v22 = &v23;
    [(_ATXDataStore *)dataStore _doSync:v19];
    if (!*((unsigned char *)v24 + 24))
    {
      v14 = __atxlog_handle_relevance_model();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        objc_claimAutoreleasedReturnValue();
        -[ATXCandidateRelevanceModelDataStore featurizationManagerIdForFeaturizationManager:error:]();
      }

      if (a4)
      {
        v16 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v32 = *MEMORY[0x1E4F28228];
        v33 = @"Failed to find corresponding featurizationManagerId for featurization manager";
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        *a4 = [v16 errorWithDomain:@"ATXCandidateRelevanceModelDataStore" code:1 userInfo:v17];
      }
    }
    int64_t v12 = v29[3];

    _Block_object_dispose(&v23, 8);
  }

  _Block_object_dispose(&v28, 8);
  return v12;
}

void __91__ATXCandidateRelevanceModelDataStore_featurizationManagerIdForFeaturizationManager_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __91__ATXCandidateRelevanceModelDataStore_featurizationManagerIdForFeaturizationManager_error___block_invoke_2;
  v4[3] = &unk_1E68AED10;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  long long v6 = *(_OWORD *)(a1 + 48);
  [v2 writeTransaction:v4];
}

void __91__ATXCandidateRelevanceModelDataStore_featurizationManagerIdForFeaturizationManager_error___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __91__ATXCandidateRelevanceModelDataStore_featurizationManagerIdForFeaturizationManager_error___block_invoke_3;
  v8[3] = &unk_1E68AD200;
  id v9 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"INSERT OR IGNORE INTO relevanceFeaturizationManagers (featurizationManagerData) VALUES (:featurizationManagerData)" onPrep:v8 onRow:0 onError:0];

  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __91__ATXCandidateRelevanceModelDataStore_featurizationManagerIdForFeaturizationManager_error___block_invoke_4;
  v6[3] = &unk_1E68AD200;
  id v7 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __91__ATXCandidateRelevanceModelDataStore_featurizationManagerIdForFeaturizationManager_error___block_invoke_5;
  v4[3] = &unk_1E68AECE8;
  long long v5 = *(_OWORD *)(a1 + 48);
  [v3 prepAndRunQuery:@"SELECT id FROM relevanceFeaturizationManagers WHERE featurizationManagerData=:featurizationManagerData" onPrep:v6 onRow:v4 onError:0];
}

uint64_t __91__ATXCandidateRelevanceModelDataStore_featurizationManagerIdForFeaturizationManager_error___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":featurizationManagerData" toNSData:*(void *)(a1 + 32)];
}

uint64_t __91__ATXCandidateRelevanceModelDataStore_featurizationManagerIdForFeaturizationManager_error___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":featurizationManagerData" toNSData:*(void *)(a1 + 32)];
}

uint64_t __91__ATXCandidateRelevanceModelDataStore_featurizationManagerIdForFeaturizationManager_error___block_invoke_5(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumn:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return *MEMORY[0x1E4F93C10];
}

- (int64_t)datasetMetadataIdForDatasetMetadata:(id)a3 error:(id *)a4
{
  v32[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  dataStore = self->_dataStore;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __81__ATXCandidateRelevanceModelDataStore_datasetMetadataIdForDatasetMetadata_error___block_invoke;
  v18 = &unk_1E68AED10;
  id v19 = self;
  id v8 = v6;
  id v20 = v8;
  int64_t v21 = &v27;
  int64_t v22 = &v23;
  [(_ATXDataStore *)dataStore _doSync:&v15];
  if (!*((unsigned char *)v24 + 24))
  {
    id v9 = __atxlog_handle_relevance_model();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      long long v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      objc_claimAutoreleasedReturnValue();
      -[ATXCandidateRelevanceModelDataStore datasetMetadataIdForDatasetMetadata:error:]();
    }

    if (a4)
    {
      long long v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28228];
      v32[0] = @"Failed to find corresponding datasetMetadataId for datasetMetadata";
      int64_t v12 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1, v15, v16, v17, v18, v19);
      *a4 = [v11 errorWithDomain:@"ATXCandidateRelevanceModelDataStore" code:1 userInfo:v12];
    }
  }
  int64_t v13 = v28[3];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

void __81__ATXCandidateRelevanceModelDataStore_datasetMetadataIdForDatasetMetadata_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __81__ATXCandidateRelevanceModelDataStore_datasetMetadataIdForDatasetMetadata_error___block_invoke_2;
  v4[3] = &unk_1E68AED10;
  id v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  long long v6 = *(_OWORD *)(a1 + 48);
  [v2 writeTransaction:v4];
}

void __81__ATXCandidateRelevanceModelDataStore_datasetMetadataIdForDatasetMetadata_error___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__ATXCandidateRelevanceModelDataStore_datasetMetadataIdForDatasetMetadata_error___block_invoke_3;
  v8[3] = &unk_1E68AD200;
  id v9 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"INSERT OR IGNORE INTO relevanceDatasetMetadata (numberOfPositiveSamples, numberOfSamples, numberOfDaysWithPositiveSamples, numberOfDaysWithSamples, startDate, endDate) VALUES (:numberOfPositiveSamples, :numberOfSamples, :numberOfDaysWithPositiveSamples, :numberOfDaysWithSamples, :startDate, :endDate)", v8, 0, 0 onPrep onRow onError];

  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__ATXCandidateRelevanceModelDataStore_datasetMetadataIdForDatasetMetadata_error___block_invoke_4;
  v6[3] = &unk_1E68AD200;
  id v7 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __81__ATXCandidateRelevanceModelDataStore_datasetMetadataIdForDatasetMetadata_error___block_invoke_5;
  v4[3] = &unk_1E68AECE8;
  long long v5 = *(_OWORD *)(a1 + 48);
  [v3 prepAndRunQuery:@"SELECT id FROM relevanceDatasetMetadata WHERE numberOfPositiveSamples=:numberOfPositiveSamples AND numberOfSamples=:numberOfSamples AND numberOfDaysWithPositiveSamples=:numberOfDaysWithPositiveSamples AND numberOfDaysWithSamples=:numberOfDaysWithSamples AND startDate=:startDate AND endDate=:endDate" onPrep:v6 onRow:v4 onError:0];
}

void __81__ATXCandidateRelevanceModelDataStore_datasetMetadataIdForDatasetMetadata_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":numberOfPositiveSamples", objc_msgSend(v3, "numberOfPositiveSamples"));
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":numberOfSamples", objc_msgSend(*(id *)(a1 + 32), "numberOfSamples"));
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":numberOfDaysWithPositiveSamples", objc_msgSend(*(id *)(a1 + 32), "numberOfDaysWithPositiveSamples"));
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":numberOfDaysWithSamples", objc_msgSend(*(id *)(a1 + 32), "numberOfDaysWithSamples"));
  long long v5 = [*(id *)(a1 + 32) startDate];
  [v5 timeIntervalSinceReferenceDate];
  [v4 bindNamedParam:":startDate" toInt64:(uint64_t)v6];

  id v8 = [*(id *)(a1 + 32) endDate];
  [v8 timeIntervalSinceReferenceDate];
  [v4 bindNamedParam:":endDate" toInt64:(uint64_t)v7];
}

void __81__ATXCandidateRelevanceModelDataStore_datasetMetadataIdForDatasetMetadata_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":numberOfPositiveSamples", objc_msgSend(v3, "numberOfPositiveSamples"));
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":numberOfSamples", objc_msgSend(*(id *)(a1 + 32), "numberOfSamples"));
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":numberOfDaysWithPositiveSamples", objc_msgSend(*(id *)(a1 + 32), "numberOfDaysWithPositiveSamples"));
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":numberOfDaysWithSamples", objc_msgSend(*(id *)(a1 + 32), "numberOfDaysWithSamples"));
  long long v5 = [*(id *)(a1 + 32) startDate];
  [v5 timeIntervalSinceReferenceDate];
  [v4 bindNamedParam:":startDate" toInt64:(uint64_t)v6];

  id v8 = [*(id *)(a1 + 32) endDate];
  [v8 timeIntervalSinceReferenceDate];
  [v4 bindNamedParam:":endDate" toInt64:(uint64_t)v7];
}

uint64_t __81__ATXCandidateRelevanceModelDataStore_datasetMetadataIdForDatasetMetadata_error___block_invoke_5(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumn:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return *MEMORY[0x1E4F93C10];
}

- (void)cacheSelectedCandidates:(id)a3 featurizationManager:(id)a4 modelId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = (void *)MEMORY[0x1D25F6CC0]();
  int64_t v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];
  int64_t v13 = (void *)MEMORY[0x1D25F6CC0]();
  v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v9 requiringSecureCoding:1 error:0];
  dataStore = self->_dataStore;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __92__ATXCandidateRelevanceModelDataStore_cacheSelectedCandidates_featurizationManager_modelId___block_invoke;
  v19[3] = &unk_1E68AC3B8;
  v19[4] = self;
  id v20 = v10;
  id v21 = v12;
  id v22 = v14;
  id v16 = v14;
  id v17 = v12;
  id v18 = v10;
  [(_ATXDataStore *)dataStore _doSync:v19];
}

void __92__ATXCandidateRelevanceModelDataStore_cacheSelectedCandidates_featurizationManager_modelId___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __92__ATXCandidateRelevanceModelDataStore_cacheSelectedCandidates_featurizationManager_modelId___block_invoke_2;
  v4[3] = &unk_1E68AC3B8;
  id v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v2 writeTransaction:v4];
}

void __92__ATXCandidateRelevanceModelDataStore_cacheSelectedCandidates_featurizationManager_modelId___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __92__ATXCandidateRelevanceModelDataStore_cacheSelectedCandidates_featurizationManager_modelId___block_invoke_3;
  v3[3] = &unk_1E68AED38;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 prepAndRunQuery:@"INSERT OR REPLACE INTO relevanceCandidateCache (modelId, date, candidateList, featurizationManager) VALUES (:modelId, :date, :candidateList, :featurizationManager)", v3, 0, 0 onPrep onRow onError];
}

void __92__ATXCandidateRelevanceModelDataStore_cacheSelectedCandidates_featurizationManager_modelId___block_invoke_3(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v6 = a2;
  [v6 bindNamedParam:":modelId" toNSString:v3];
  id v4 = [MEMORY[0x1E4F1C9C8] now];
  [v4 timeIntervalSinceReferenceDate];
  [v6 bindNamedParam:":date" toInt64:(uint64_t)v5];

  [v6 bindNamedParam:":candidateList" toNSData:a1[5]];
  [v6 bindNamedParam:":featurizationManager" toNSData:a1[6]];
}

- (void)deleteCachedCandidatesForModelId:(id)a3
{
  id v4 = a3;
  dataStore = self->_dataStore;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__ATXCandidateRelevanceModelDataStore_deleteCachedCandidatesForModelId___block_invoke;
  v7[3] = &unk_1E68AB870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(_ATXDataStore *)dataStore _doSync:v7];
}

void __72__ATXCandidateRelevanceModelDataStore_deleteCachedCandidatesForModelId___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__ATXCandidateRelevanceModelDataStore_deleteCachedCandidatesForModelId___block_invoke_2;
  v4[3] = &unk_1E68AB870;
  uint64_t v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 writeTransaction:v4];
}

void __72__ATXCandidateRelevanceModelDataStore_deleteCachedCandidatesForModelId___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72__ATXCandidateRelevanceModelDataStore_deleteCachedCandidatesForModelId___block_invoke_3;
  v3[3] = &unk_1E68AD200;
  id v4 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"DELETE FROM relevanceCandidateCache WHERE modelId = :modelId" onPrep:v3 onRow:0 onError:0];
}

uint64_t __72__ATXCandidateRelevanceModelDataStore_deleteCachedCandidatesForModelId___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":modelId" toNSString:*(void *)(a1 + 32)];
}

- (id)cachedCandidatesForModelId:(id)a3 earliestDate:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x2020000000;
  uint64_t v63 = 0;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__32;
  v58 = __Block_byref_object_dispose__32;
  id v59 = 0;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__32;
  v52 = __Block_byref_object_dispose__32;
  id v53 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  dataStore = self->_dataStore;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __79__ATXCandidateRelevanceModelDataStore_cachedCandidatesForModelId_earliestDate___block_invoke;
  v38[3] = &unk_1E68AED88;
  v38[4] = self;
  id v9 = v6;
  id v39 = v9;
  v40 = &v60;
  v41 = &v54;
  v42 = &v48;
  v43 = &v44;
  [(_ATXDataStore *)dataStore _doSync:v38];
  if (!*((unsigned char *)v45 + 24))
  {
    uint64_t v25 = 0;
    goto LABEL_17;
  }
  id v10 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  long long v11 = (void *)[v10 initWithTimeIntervalSinceReferenceDate:(double)v61[3]];
  int64_t v12 = [v11 laterDate:v7];
  BOOL v13 = v12 == v7;

  if (v13)
  {
    id v21 = __atxlog_handle_relevance_model();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      char v26 = (objc_class *)objc_opt_class();
      uint64_t v27 = NSStringFromClass(v26);
      *(_DWORD *)buf = 138412802;
      v65 = v27;
      __int16 v66 = 2112;
      v67 = v7;
      __int16 v68 = 2112;
      v69 = v11;
      _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_DEFAULT, "%@ - Cached candidates are older than earliest date (%@), returning nil instead: %@", buf, 0x20u);
    }
    uint64_t v25 = 0;
    goto LABEL_16;
  }
  v14 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v15 = (void *)MEMORY[0x1E4F28DC0];
  id v16 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v17 = objc_opt_class();
  id v18 = objc_msgSend(v16, "initWithObjects:", v17, objc_opt_class(), 0);
  uint64_t v19 = v55[5];
  id v37 = 0;
  id v20 = [v15 unarchivedObjectOfClasses:v18 fromData:v19 error:&v37];
  id v21 = v37;

  if (v21)
  {
    id v22 = __atxlog_handle_relevance_model();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = (objc_class *)objc_opt_class();
      id v24 = NSStringFromClass(v23);
      *(_DWORD *)buf = 138412546;
      v65 = v24;
      __int16 v66 = 2112;
      v67 = v21;
      _os_log_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_DEFAULT, "%@ - Unable to decode cached candidates due to: %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v28 = (void *)MEMORY[0x1D25F6CC0]();
    uint64_t v29 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v30 = objc_opt_class();
    uint64_t v31 = v49[5];
    id v36 = 0;
    id v22 = [v29 unarchivedObjectOfClass:v30 fromData:v31 error:&v36];
    id v21 = v36;
    if (!v21)
    {
      uint64_t v25 = [[ATXCandidateRelevanceModelCandidateCacheResult alloc] initWithCandidates:v20 featurizationManager:v22];
      goto LABEL_15;
    }
    uint64_t v32 = __atxlog_handle_relevance_model();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = (objc_class *)objc_opt_class();
      uint64_t v34 = NSStringFromClass(v33);
      *(_DWORD *)buf = 138412546;
      v65 = v34;
      __int16 v66 = 2112;
      v67 = v21;
      _os_log_impl(&dword_1D0FA3000, v32, OS_LOG_TYPE_DEFAULT, "%@ - Unable to decode cached featurization manager due to: %@", buf, 0x16u);
    }
  }
  uint64_t v25 = 0;
LABEL_15:

LABEL_16:
LABEL_17:

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

  return v25;
}

void __79__ATXCandidateRelevanceModelDataStore_cachedCandidatesForModelId_earliestDate___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__ATXCandidateRelevanceModelDataStore_cachedCandidatesForModelId_earliestDate___block_invoke_2;
  v5[3] = &unk_1E68AED88;
  uint64_t v3 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  long long v4 = *(_OWORD *)(a1 + 64);
  long long v7 = *(_OWORD *)(a1 + 48);
  long long v8 = v4;
  [v2 readTransaction:v5];
}

void __79__ATXCandidateRelevanceModelDataStore_cachedCandidatesForModelId_earliestDate___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__ATXCandidateRelevanceModelDataStore_cachedCandidatesForModelId_earliestDate___block_invoke_3;
  v7[3] = &unk_1E68AD200;
  id v8 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__ATXCandidateRelevanceModelDataStore_cachedCandidatesForModelId_earliestDate___block_invoke_4;
  v4[3] = &unk_1E68AED60;
  long long v3 = *(_OWORD *)(a1 + 64);
  long long v5 = *(_OWORD *)(a1 + 48);
  long long v6 = v3;
  [v2 prepAndRunQuery:@"SELECT date, candidateList, featurizationManager FROM relevanceCandidateCache WHERE modelId=:modelId LIMIT 1", v7, v4, 0 onPrep onRow onError];
}

uint64_t __79__ATXCandidateRelevanceModelDataStore_cachedCandidatesForModelId_earliestDate___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":modelId" toNSString:*(void *)(a1 + 32)];
}

uint64_t __79__ATXCandidateRelevanceModelDataStore_cachedCandidatesForModelId_earliestDate___block_invoke_4(void *a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(a1[4] + 8) + 24) = [v3 getInt64ForColumn:0];
  uint64_t v4 = [v3 getNSDataForColumn:1];
  uint64_t v5 = *(void *)(a1[5] + 8);
  long long v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = [v3 getNSDataForColumn:2];

  uint64_t v8 = *(void *)(a1[6] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  return *MEMORY[0x1E4F93C10];
}

- (int64_t)candidateIdForCandidate:(id)a3 error:(id *)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  id v31 = 0;
  uint64_t v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v31];
  id v8 = v31;
  if (v8)
  {
    if (a4)
    {
      id v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v38 = *MEMORY[0x1E4F28228];
      v39[0] = @"Failed to serialize candidate when writing to database";
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
      *a4 = [v9 errorWithDomain:@"ATXCandidateRelevanceModelDataStore" code:1 userInfo:v10];
    }
    int64_t v11 = v33[3];
  }
  else
  {
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    dataStore = self->_dataStore;
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __69__ATXCandidateRelevanceModelDataStore_candidateIdForCandidate_error___block_invoke;
    id v21 = &unk_1E68AEDB0;
    id v22 = self;
    id v23 = v6;
    id v24 = v7;
    uint64_t v25 = &v32;
    char v26 = &v27;
    [(_ATXDataStore *)dataStore _doSync:&v18];
    if (!*((unsigned char *)v28 + 24))
    {
      BOOL v13 = __atxlog_handle_relevance_model();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        objc_claimAutoreleasedReturnValue();
        -[ATXCandidateRelevanceModelDataStore candidateIdForCandidate:error:]();
      }

      if (a4)
      {
        uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v36 = *MEMORY[0x1E4F28228];
        id v37 = @"Failed to find corresponding candidateId for candidate";
        id v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1, v18, v19, v20, v21, v22, v23);
        *a4 = [v15 errorWithDomain:@"ATXCandidateRelevanceModelDataStore" code:1 userInfo:v16];
      }
    }
    int64_t v11 = v33[3];

    _Block_object_dispose(&v27, 8);
  }

  _Block_object_dispose(&v32, 8);
  return v11;
}

void __69__ATXCandidateRelevanceModelDataStore_candidateIdForCandidate_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__ATXCandidateRelevanceModelDataStore_candidateIdForCandidate_error___block_invoke_2;
  v4[3] = &unk_1E68AEDB0;
  id v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  long long v7 = *(_OWORD *)(a1 + 56);
  [v2 writeTransaction:v4];
}

void __69__ATXCandidateRelevanceModelDataStore_candidateIdForCandidate_error___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__ATXCandidateRelevanceModelDataStore_candidateIdForCandidate_error___block_invoke_3;
  v8[3] = &unk_1E68AD1B0;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  [v2 prepAndRunQuery:@"INSERT OR IGNORE INTO relevanceCandidates (candidateType, candidateIdentifier, candidateData) VALUES (:candidateType, :candidateIdentifier, :candidateData)", v8, 0, 0 onPrep onRow onError];

  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__ATXCandidateRelevanceModelDataStore_candidateIdForCandidate_error___block_invoke_4;
  v6[3] = &unk_1E68AD200;
  id v7 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__ATXCandidateRelevanceModelDataStore_candidateIdForCandidate_error___block_invoke_5;
  v4[3] = &unk_1E68AECE8;
  long long v5 = *(_OWORD *)(a1 + 56);
  [v3 prepAndRunQuery:@"SELECT id FROM relevanceCandidates WHERE candidateType=:candidateType AND candidateIdentifier=:candidateIdentifier" onPrep:v6 onRow:v4 onError:0];
}

void __69__ATXCandidateRelevanceModelDataStore_candidateIdForCandidate_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v4 = [v3 type];
  [v6 bindNamedParam:":candidateType" toNSString:v4];

  long long v5 = [*(id *)(a1 + 32) identifier];
  [v6 bindNamedParam:":candidateIdentifier" toNSString:v5];

  [v6 bindNamedParam:":candidateData" toNSData:*(void *)(a1 + 40)];
}

void __69__ATXCandidateRelevanceModelDataStore_candidateIdForCandidate_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  long long v5 = [v3 type];
  [v4 bindNamedParam:":candidateType" toNSString:v5];

  id v6 = [*(id *)(a1 + 32) identifier];
  [v4 bindNamedParam:":candidateIdentifier" toNSString:v6];
}

uint64_t __69__ATXCandidateRelevanceModelDataStore_candidateIdForCandidate_error___block_invoke_5(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumn:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return *MEMORY[0x1E4F93C10];
}

- (void)receiveMostRecentVerifiedTrainedModelTrainingResults:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__32;
  id v24 = __Block_byref_object_dispose__32;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__32;
  uint64_t v18 = __Block_byref_object_dispose__32;
  id v19 = 0;
  dataStore = self->_dataStore;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __103__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_completion___block_invoke;
  v13[3] = &unk_1E68AEDD8;
  v13[4] = self;
  v13[5] = &v20;
  v13[6] = &v14;
  [(_ATXDataStore *)dataStore _doSync:v13];
  if (v21[5] && v15[5])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __103__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_completion___block_invoke_4;
    v11[3] = &unk_1E68AEE00;
    id v12 = v6;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __103__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_completion___block_invoke_5;
    v9[3] = &unk_1E68AEE28;
    id v10 = v7;
    [(ATXCandidateRelevanceModelDataStore *)self receiveTrainingResult:v11 completion:v9 modelUUID:v15[5] clientModelName:v21[5]];
  }
  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
}

void __103__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __103__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_completion___block_invoke_2;
  v3[3] = &unk_1E68AEDD8;
  long long v4 = *(_OWORD *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  [v2 readTransaction:v3];
}

void __103__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_completion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __103__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_completion___block_invoke_3;
  v3[3] = &unk_1E68AECE8;
  long long v4 = *(_OWORD *)(a1 + 40);
  [v2 prepAndRunQuery:@"SELECT clientModelName, modelUUID FROM relevanceCandidateModels WHERE isVerified=1 ORDER BY trainDate DESC LIMIT 1", 0, v3, 0 onPrep onRow onError];
}

uint64_t __103__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getNSStringForColumn:0];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = objc_alloc(MEMORY[0x1E4F29128]);
  id v8 = [v3 getNSStringForColumn:1];

  uint64_t v9 = [v7 initWithUUIDString:v8];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  int64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  return *MEMORY[0x1E4F93C10];
}

uint64_t __103__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __103__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)receiveMostRecentVerifiedTrainedModelTrainingResults:(id)a3 clientModelName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t v11 = (void (**)(void, void))v10;
  if (v9)
  {
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy__32;
    id v25 = __Block_byref_object_dispose__32;
    id v26 = 0;
    dataStore = self->_dataStore;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __119__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_clientModelName_completion___block_invoke;
    v18[3] = &unk_1E68AD278;
    v18[4] = self;
    id v13 = v9;
    id v19 = v13;
    uint64_t v20 = &v21;
    [(_ATXDataStore *)dataStore _doSync:v18];
    if (v22[5])
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __119__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_clientModelName_completion___block_invoke_5;
      v16[3] = &unk_1E68AEE00;
      id v17 = v8;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __119__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_clientModelName_completion___block_invoke_6;
      v14[3] = &unk_1E68AEE28;
      uint64_t v15 = v11;
      [(ATXCandidateRelevanceModelDataStore *)self receiveTrainingResult:v16 completion:v14 modelUUID:v22[5] clientModelName:v13];
    }
    else
    {
      v11[2](v11, 1);
    }

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
  }
}

void __119__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_clientModelName_completion___block_invoke(void *a1)
{
  v2 = [*(id *)(a1[4] + 8) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __119__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_clientModelName_completion___block_invoke_2;
  v6[3] = &unk_1E68AD278;
  id v3 = (void *)a1[5];
  void v6[4] = a1[4];
  id v4 = v3;
  uint64_t v5 = a1[6];
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 readTransaction:v6];
}

void __119__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_clientModelName_completion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __119__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_clientModelName_completion___block_invoke_3;
  v4[3] = &unk_1E68AD200;
  id v5 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __119__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_clientModelName_completion___block_invoke_4;
  v3[3] = &unk_1E68AD228;
  void v3[4] = *(void *)(a1 + 48);
  [v2 prepAndRunQuery:@"SELECT modelUUID FROM relevanceCandidateModels WHERE clientModelName=:clientModelName AND isVerified=1 ORDER BY trainDate DESC LIMIT 1" onPrep:v4 onRow:v3 onError:0];
}

uint64_t __119__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_clientModelName_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":clientModelName" toNSString:*(void *)(a1 + 32)];
}

uint64_t __119__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_clientModelName_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [v4 getNSStringForColumn:0];

  uint64_t v7 = [v5 initWithUUIDString:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  return *MEMORY[0x1E4F93C10];
}

uint64_t __119__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_clientModelName_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __119__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_clientModelName_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)receiveTrainingResult:(id)a3 completion:(id)a4 modelUUID:(id)a5 clientModelName:(id)a6
{
  id v10 = a3;
  int64_t v11 = (void (**)(id, void))a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = objc_opt_new();
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  dataStore = self->_dataStore;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke;
  v20[3] = &unk_1E68AEE78;
  v20[4] = self;
  id v16 = v12;
  id v21 = v16;
  id v17 = v13;
  id v22 = v17;
  id v25 = &v26;
  id v18 = v14;
  id v23 = v18;
  id v19 = v10;
  id v24 = v19;
  [(_ATXDataStore *)dataStore _doSync:v20];
  v11[2](v11, *((unsigned __int8 *)v27 + 24));

  _Block_object_dispose(&v26, 8);
}

void __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke_2;
  v6[3] = &unk_1E68AEE78;
  id v3 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 72);
  id v8 = v4;
  uint64_t v11 = v5;
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  [v2 readTransaction:v6];
}

void __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke_3;
  v11[3] = &unk_1E68AD1B0;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke_4;
  v5[3] = &unk_1E68AEE50;
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 72);
  id v7 = v3;
  uint64_t v10 = v4;
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  [v2 prepAndRunQuery:@"SELECT candidateModelData, candidateData, featurizationManagerData, featurizationManagerId, trainDate, numberOfPositiveSamples, numberOfSamples, numberOfDaysWithPositiveSamples, numberOfDaysWithSamples, startDate, endDate, isVerified FROM relevanceCandidateModels INNER JOIN relevanceCandidates ON relevanceCandidates.id = relevanceCandidateModels.candidateId INNER JOIN relevanceFeaturizationManagers ON relevanceFeaturizationManagers.id = relevanceCandidateModels.featurizationManagerId INNER JOIN relevanceDatasetMetadata ON relevanceDatasetMetadata.id = relevanceCandidateModels.datasetMetadataId WHERE modelUUID=:modelUUID AND clientModelName=:clientModelName", v11, v5, 0 onPrep onRow onError];
}

void __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v4 = [v3 UUIDString];
  [v5 bindNamedParam:":modelUUID" toNSString:v4];

  [v5 bindNamedParam:":clientModelName" toNSString:*(void *)(a1 + 40)];
}

uint64_t __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getNSDataForColumn:0];
  id v5 = (void *)MEMORY[0x1D25F6CC0]();
  id v39 = 0;
  id v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v39];
  id v7 = v39;
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    uint64_t v11 = [v3 getNSDataForColumn:1];
    id v12 = (void *)MEMORY[0x1D25F6CC0]();
    id v38 = 0;
    id v13 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:&v38];
    id v7 = v38;
    if (!v13 || v7)
    {
      uint64_t v26 = __atxlog_handle_relevance_model();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke_4_cold_2();
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      uint64_t v10 = *MEMORY[0x1E4F93C10];
      goto LABEL_19;
    }
    uint64_t v34 = [v3 getNSDataForColumn:2];
    uint64_t v14 = [v3 getInt64ForColumn:3];
    uint64_t v15 = [*(id *)(a1 + 48) featurizationManagerForFeaturizationManagerId:v14];
    if (!v15)
    {
      id v16 = (void *)MEMORY[0x1D25F6CC0]();
      id v37 = 0;
      uint64_t v35 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v34 error:&v37];
      id v7 = v37;
      if (!v34 || v7)
      {
        uint64_t v28 = __atxlog_handle_relevance_model();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
          __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke_4_cold_3();
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
        uint64_t v10 = *MEMORY[0x1E4F93C10];
        id v25 = (void *)v35;
        goto LABEL_15;
      }
      uint64_t v15 = v35;
      [*(id *)(a1 + 48) setFeaturizationManager:v35 forFeaturizationManagerId:v14];
    }
    uint64_t v36 = (void *)v15;
    uint64_t v32 = v13;
    id v17 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 4));
    uint64_t v31 = [v3 getIntegerForColumn:5];
    uint64_t v30 = [v3 getIntegerForColumn:6];
    uint64_t v18 = [v3 getIntegerForColumn:7];
    uint64_t v19 = [v3 getIntegerForColumn:8];
    objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 9));
    uint64_t v20 = v33 = v11;
    id v21 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 10));
    BOOL v22 = [v3 getIntegerForColumn:11] != 0;
    id v23 = [[ATXCandidateRelevanceModelDataStoreDatasetMetadata alloc] initWithNumberOfPositiveSamples:v31 numberOfSamples:v30 numberOfDaysWithPositiveSamples:v18 numberOfDaysWithSamples:v19 startDate:v20 endDate:v21];
    LOBYTE(v29) = v22;
    id v13 = v32;
    id v24 = [[ATXCandidateRelevanceModelDataStoreTrainingResult alloc] initWithModel:v6 candidate:v32 featurizationManager:v36 modelUUID:*(void *)(a1 + 32) datasetMetadata:v23 clientModelName:*(void *)(a1 + 40) trainDate:v17 isVerified:v29];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    uint64_t v10 = *MEMORY[0x1E4F93C08];

    id v25 = v36;
    uint64_t v11 = v33;

    id v7 = 0;
LABEL_15:

LABEL_19:
    goto LABEL_20;
  }
  id v9 = __atxlog_handle_relevance_model();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke_4_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  uint64_t v10 = *MEMORY[0x1E4F93C10];
LABEL_20:

  return v10;
}

- (unint64_t)numberOfTrainedModels
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dataStore = self->_dataStore;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__ATXCandidateRelevanceModelDataStore_numberOfTrainedModels__block_invoke;
  v5[3] = &unk_1E68AB898;
  void v5[4] = self;
  void v5[5] = &v6;
  [(_ATXDataStore *)dataStore _doSync:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __60__ATXCandidateRelevanceModelDataStore_numberOfTrainedModels__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__ATXCandidateRelevanceModelDataStore_numberOfTrainedModels__block_invoke_2;
  v3[3] = &unk_1E68AB898;
  long long v4 = *(_OWORD *)(a1 + 32);
  [v2 readTransaction:v3];
}

void __60__ATXCandidateRelevanceModelDataStore_numberOfTrainedModels__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__ATXCandidateRelevanceModelDataStore_numberOfTrainedModels__block_invoke_3;
  v3[3] = &unk_1E68AD228;
  void v3[4] = *(void *)(a1 + 40);
  [v2 prepAndRunQuery:@"SELECT COUNT(*) FROM (SELECT DISTINCT modelUUID from relevanceCandidateModels)" onPrep:0 onRow:v3 onError:0];
}

uint64_t __60__ATXCandidateRelevanceModelDataStore_numberOfTrainedModels__block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

- (id)clientModelNamesWithTrainedRelevanceModels
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__32;
  uint64_t v11 = __Block_byref_object_dispose__32;
  id v12 = (id)objc_opt_new();
  dataStore = self->_dataStore;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__ATXCandidateRelevanceModelDataStore_clientModelNamesWithTrainedRelevanceModels__block_invoke;
  v6[3] = &unk_1E68AB898;
  void v6[4] = self;
  void v6[5] = &v7;
  [(_ATXDataStore *)dataStore _doSync:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __81__ATXCandidateRelevanceModelDataStore_clientModelNamesWithTrainedRelevanceModels__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __81__ATXCandidateRelevanceModelDataStore_clientModelNamesWithTrainedRelevanceModels__block_invoke_2;
  v3[3] = &unk_1E68AB898;
  long long v4 = *(_OWORD *)(a1 + 32);
  [v2 readTransaction:v3];
}

void __81__ATXCandidateRelevanceModelDataStore_clientModelNamesWithTrainedRelevanceModels__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __81__ATXCandidateRelevanceModelDataStore_clientModelNamesWithTrainedRelevanceModels__block_invoke_3;
  v3[3] = &unk_1E68AD228;
  void v3[4] = *(void *)(a1 + 40);
  [v2 prepAndRunQuery:@"SELECT DISTINCT clientModelName FROM relevanceCandidateModels" onPrep:0 onRow:v3 onError:0];
}

uint64_t __81__ATXCandidateRelevanceModelDataStore_clientModelNamesWithTrainedRelevanceModels__block_invoke_3(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 getNSStringForColumn:0];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  long long v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

- (id)modelUUIDToTrainDateForClientModelName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__32;
  id v16 = __Block_byref_object_dispose__32;
  id v17 = (id)objc_opt_new();
  dataStore = self->_dataStore;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__ATXCandidateRelevanceModelDataStore_modelUUIDToTrainDateForClientModelName___block_invoke;
  v9[3] = &unk_1E68AD278;
  void v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [(_ATXDataStore *)dataStore _doSync:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __78__ATXCandidateRelevanceModelDataStore_modelUUIDToTrainDateForClientModelName___block_invoke(void *a1)
{
  v2 = [*(id *)(a1[4] + 8) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__ATXCandidateRelevanceModelDataStore_modelUUIDToTrainDateForClientModelName___block_invoke_2;
  v6[3] = &unk_1E68AD278;
  unint64_t v3 = (void *)a1[5];
  void v6[4] = a1[4];
  id v4 = v3;
  uint64_t v5 = a1[6];
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 readTransaction:v6];
}

void __78__ATXCandidateRelevanceModelDataStore_modelUUIDToTrainDateForClientModelName___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__ATXCandidateRelevanceModelDataStore_modelUUIDToTrainDateForClientModelName___block_invoke_3;
  v4[3] = &unk_1E68AD200;
  id v5 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__ATXCandidateRelevanceModelDataStore_modelUUIDToTrainDateForClientModelName___block_invoke_4;
  v3[3] = &unk_1E68AD228;
  void v3[4] = *(void *)(a1 + 48);
  [v2 prepAndRunQuery:@"SELECT DISTINCT modelUUID, trainDate FROM relevanceCandidateModels WHERE clientModelName=:clientModelName", v4, v3, 0 onPrep onRow onError];
}

uint64_t __78__ATXCandidateRelevanceModelDataStore_modelUUIDToTrainDateForClientModelName___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":clientModelName" toNSString:*(void *)(a1 + 32)];
}

uint64_t __78__ATXCandidateRelevanceModelDataStore_modelUUIDToTrainDateForClientModelName___block_invoke_4(uint64_t a1, void *a2)
{
  unint64_t v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [v4 getNSStringForColumn:0];
  id v7 = (void *)[v5 initWithUUIDString:v6];

  uint64_t v8 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v9 = [v4 getInt64ForColumn:1];

  id v10 = [v8 dateWithTimeIntervalSinceReferenceDate:(double)v9];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v10 forKeyedSubscript:v7];
  uint64_t v11 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v11;
}

- (id)mostRecentVerifiedTrainDateForClientModelName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__32;
  id v16 = __Block_byref_object_dispose__32;
  id v17 = 0;
  dataStore = self->_dataStore;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__ATXCandidateRelevanceModelDataStore_mostRecentVerifiedTrainDateForClientModelName___block_invoke;
  v9[3] = &unk_1E68AD278;
  void v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [(_ATXDataStore *)dataStore _doSync:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __85__ATXCandidateRelevanceModelDataStore_mostRecentVerifiedTrainDateForClientModelName___block_invoke(void *a1)
{
  v2 = [*(id *)(a1[4] + 8) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__ATXCandidateRelevanceModelDataStore_mostRecentVerifiedTrainDateForClientModelName___block_invoke_2;
  v6[3] = &unk_1E68AD278;
  unint64_t v3 = (void *)a1[5];
  void v6[4] = a1[4];
  id v4 = v3;
  uint64_t v5 = a1[6];
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 readTransaction:v6];
}

void __85__ATXCandidateRelevanceModelDataStore_mostRecentVerifiedTrainDateForClientModelName___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __85__ATXCandidateRelevanceModelDataStore_mostRecentVerifiedTrainDateForClientModelName___block_invoke_3;
  v4[3] = &unk_1E68AD200;
  id v5 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __85__ATXCandidateRelevanceModelDataStore_mostRecentVerifiedTrainDateForClientModelName___block_invoke_4;
  v3[3] = &unk_1E68AD228;
  void v3[4] = *(void *)(a1 + 48);
  [v2 prepAndRunQuery:@"SELECT trainDate FROM relevanceCandidateModels WHERE clientModelName=:clientModelName AND isVerified=1 ORDER BY trainDate DESC LIMIT 1" onPrep:v4 onRow:v3 onError:0];
}

uint64_t __85__ATXCandidateRelevanceModelDataStore_mostRecentVerifiedTrainDateForClientModelName___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":clientModelName" toNSString:*(void *)(a1 + 32)];
}

uint64_t __85__ATXCandidateRelevanceModelDataStore_mostRecentVerifiedTrainDateForClientModelName___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(a2, "getInt64ForColumn:", 0));
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x1E4F93C10];
}

- (unint64_t)numberOfFeaturizationManagerIds
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dataStore = self->_dataStore;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__ATXCandidateRelevanceModelDataStore_numberOfFeaturizationManagerIds__block_invoke;
  v5[3] = &unk_1E68AB898;
  void v5[4] = self;
  void v5[5] = &v6;
  [(_ATXDataStore *)dataStore _doSync:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __70__ATXCandidateRelevanceModelDataStore_numberOfFeaturizationManagerIds__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__ATXCandidateRelevanceModelDataStore_numberOfFeaturizationManagerIds__block_invoke_2;
  v3[3] = &unk_1E68AB898;
  long long v4 = *(_OWORD *)(a1 + 32);
  [v2 readTransaction:v3];
}

void __70__ATXCandidateRelevanceModelDataStore_numberOfFeaturizationManagerIds__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__ATXCandidateRelevanceModelDataStore_numberOfFeaturizationManagerIds__block_invoke_3;
  v3[3] = &unk_1E68AD228;
  void v3[4] = *(void *)(a1 + 40);
  [v2 prepAndRunQuery:@"SELECT COUNT(*) FROM relevanceFeaturizationManagers" onPrep:0 onRow:v3 onError:0];
}

uint64_t __70__ATXCandidateRelevanceModelDataStore_numberOfFeaturizationManagerIds__block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

- (unint64_t)numberOfDatasetMetadataIds
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dataStore = self->_dataStore;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__ATXCandidateRelevanceModelDataStore_numberOfDatasetMetadataIds__block_invoke;
  v5[3] = &unk_1E68AB898;
  void v5[4] = self;
  void v5[5] = &v6;
  [(_ATXDataStore *)dataStore _doSync:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __65__ATXCandidateRelevanceModelDataStore_numberOfDatasetMetadataIds__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__ATXCandidateRelevanceModelDataStore_numberOfDatasetMetadataIds__block_invoke_2;
  v3[3] = &unk_1E68AB898;
  long long v4 = *(_OWORD *)(a1 + 32);
  [v2 readTransaction:v3];
}

void __65__ATXCandidateRelevanceModelDataStore_numberOfDatasetMetadataIds__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__ATXCandidateRelevanceModelDataStore_numberOfDatasetMetadataIds__block_invoke_3;
  v3[3] = &unk_1E68AD228;
  void v3[4] = *(void *)(a1 + 40);
  [v2 prepAndRunQuery:@"SELECT COUNT(*) FROM relevanceDatasetMetadata" onPrep:0 onRow:v3 onError:0];
}

uint64_t __65__ATXCandidateRelevanceModelDataStore_numberOfDatasetMetadataIds__block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

- (unint64_t)numberOfCandidateIds
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dataStore = self->_dataStore;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__ATXCandidateRelevanceModelDataStore_numberOfCandidateIds__block_invoke;
  v5[3] = &unk_1E68AB898;
  void v5[4] = self;
  void v5[5] = &v6;
  [(_ATXDataStore *)dataStore _doSync:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __59__ATXCandidateRelevanceModelDataStore_numberOfCandidateIds__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__ATXCandidateRelevanceModelDataStore_numberOfCandidateIds__block_invoke_2;
  v3[3] = &unk_1E68AB898;
  long long v4 = *(_OWORD *)(a1 + 32);
  [v2 readTransaction:v3];
}

void __59__ATXCandidateRelevanceModelDataStore_numberOfCandidateIds__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__ATXCandidateRelevanceModelDataStore_numberOfCandidateIds__block_invoke_3;
  v3[3] = &unk_1E68AD228;
  void v3[4] = *(void *)(a1 + 40);
  [v2 prepAndRunQuery:@"SELECT COUNT(*) FROM relevanceCandidates" onPrep:0 onRow:v3 onError:0];
}

uint64_t __59__ATXCandidateRelevanceModelDataStore_numberOfCandidateIds__block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

- (id)trainingResultsForClientModelName:(id)a3 modelUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__ATXCandidateRelevanceModelDataStore_trainingResultsForClientModelName_modelUUID___block_invoke;
  v12[3] = &unk_1E68AEEA0;
  id v13 = v8;
  id v9 = v8;
  [(ATXCandidateRelevanceModelDataStore *)self receiveTrainingResult:v12 completion:&__block_literal_global_65 modelUUID:v6 clientModelName:v7];

  id v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_317];

  return v10;
}

uint64_t __83__ATXCandidateRelevanceModelDataStore_trainingResultsForClientModelName_modelUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __83__ATXCandidateRelevanceModelDataStore_trainingResultsForClientModelName_modelUUID___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 datasetMetadata];
  id v6 = [v4 datasetMetadata];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)mostRecentVerifiedTrainingResultsForClientModelName:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__ATXCandidateRelevanceModelDataStore_mostRecentVerifiedTrainingResultsForClientModelName___block_invoke;
  v9[3] = &unk_1E68AEEA0;
  id v10 = v5;
  id v6 = v5;
  [(ATXCandidateRelevanceModelDataStore *)self receiveMostRecentVerifiedTrainedModelTrainingResults:v9 clientModelName:v4 completion:&__block_literal_global_319];

  uint64_t v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_321];

  return v7;
}

uint64_t __91__ATXCandidateRelevanceModelDataStore_mostRecentVerifiedTrainingResultsForClientModelName___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __91__ATXCandidateRelevanceModelDataStore_mostRecentVerifiedTrainingResultsForClientModelName___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 datasetMetadata];
  id v6 = [v4 datasetMetadata];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)idsInTableWithName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__32;
  id v16 = __Block_byref_object_dispose__32;
  id v17 = (id)objc_opt_new();
  dataStore = self->_dataStore;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__ATXCandidateRelevanceModelDataStore_idsInTableWithName___block_invoke;
  v9[3] = &unk_1E68AD278;
  void v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [(_ATXDataStore *)dataStore _doSync:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __58__ATXCandidateRelevanceModelDataStore_idsInTableWithName___block_invoke(void *a1)
{
  v2 = [*(id *)(a1[4] + 8) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__ATXCandidateRelevanceModelDataStore_idsInTableWithName___block_invoke_2;
  v6[3] = &unk_1E68AD278;
  unint64_t v3 = (void *)a1[5];
  void v6[4] = a1[4];
  id v4 = v3;
  uint64_t v5 = a1[6];
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 readTransaction:v6];
}

void __58__ATXCandidateRelevanceModelDataStore_idsInTableWithName___block_invoke_2(void *a1)
{
  v2 = [*(id *)(a1[4] + 8) db];
  unint64_t v3 = [NSString stringWithFormat:@"SELECT id FROM %@", a1[5]];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__ATXCandidateRelevanceModelDataStore_idsInTableWithName___block_invoke_3;
  v4[3] = &unk_1E68AD228;
  void v4[4] = a1[6];
  [v2 prepAndRunQuery:v3 onPrep:0 onRow:v4 onError:0];
}

uint64_t __58__ATXCandidateRelevanceModelDataStore_idsInTableWithName___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getInt64ForColumn:0];
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v5 = [NSNumber numberWithLongLong:v3];
  [v4 addObject:v5];

  return *MEMORY[0x1E4F93C08];
}

- (void)deleteRowsWithIds:(id)a3 fromTableWithName:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__ATXCandidateRelevanceModelDataStore_deleteRowsWithIds_fromTableWithName___block_invoke;
  v8[3] = &unk_1E68AEF08;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 enumerateObjectsUsingBlock:v8];
}

void __75__ATXCandidateRelevanceModelDataStore_deleteRowsWithIds_fromTableWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__ATXCandidateRelevanceModelDataStore_deleteRowsWithIds_fromTableWithName___block_invoke_2;
  v7[3] = &unk_1E68AC320;
  void v7[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v6 = v3;
  [v5 _doSync:v7];
}

void __75__ATXCandidateRelevanceModelDataStore_deleteRowsWithIds_fromTableWithName___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__ATXCandidateRelevanceModelDataStore_deleteRowsWithIds_fromTableWithName___block_invoke_3;
  v4[3] = &unk_1E68AC320;
  id v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  [v2 writeTransaction:v4];
}

void __75__ATXCandidateRelevanceModelDataStore_deleteRowsWithIds_fromTableWithName___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  id v3 = [NSString stringWithFormat:@"DELETE FROM %@ WHERE id = :id", *(void *)(a1 + 40)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__ATXCandidateRelevanceModelDataStore_deleteRowsWithIds_fromTableWithName___block_invoke_4;
  v4[3] = &unk_1E68AD200;
  id v5 = *(id *)(a1 + 48);
  [v2 prepAndRunQuery:v3 onPrep:v4 onRow:0 onError:0];
}

void __75__ATXCandidateRelevanceModelDataStore_deleteRowsWithIds_fromTableWithName___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":id", objc_msgSend(v2, "longLongValue"));
}

- (void)deleteTrainedModelsWithTrainDateOlderThanDate:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  [v4 timeIntervalSinceReferenceDate];
  dataStore = self->_dataStore;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke;
  v31[3] = &unk_1E68AD2C8;
  v31[6] = v6;
  v31[4] = self;
  v31[5] = &v32;
  [(_ATXDataStore *)dataStore _doSync:v31];
  id v7 = __atxlog_handle_relevance_model();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    uint64_t v10 = v33[3];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    id v37 = (uint64_t (*)(uint64_t, uint64_t))v4;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "%@ - Deleted %lu models that were older than %@.", buf, 0x20u);
  }
  uint64_t v11 = [(ATXCandidateRelevanceModelDataStore *)self idsInTableWithName:@"relevanceCandidates"];
  uint64_t v12 = [(ATXCandidateRelevanceModelDataStore *)self idsInTableWithName:@"relevanceFeaturizationManagers"];
  id v13 = [(ATXCandidateRelevanceModelDataStore *)self idsInTableWithName:@"relevanceDatasetMetadata"];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v37 = __Block_byref_object_copy__32;
  id v38 = __Block_byref_object_dispose__32;
  id v39 = (id)objc_opt_new();
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__32;
  uint64_t v29 = __Block_byref_object_dispose__32;
  id v30 = (id)objc_opt_new();
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = __Block_byref_object_copy__32;
  id v23 = __Block_byref_object_dispose__32;
  id v24 = (id)objc_opt_new();
  uint64_t v14 = self->_dataStore;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke_344;
  v18[3] = &unk_1E68AEF58;
  v18[4] = self;
  void v18[5] = buf;
  v18[6] = &v25;
  v18[7] = &v19;
  [(_ATXDataStore *)v14 _doSync:v18];
  uint64_t v15 = (void *)[v11 mutableCopy];
  [v15 minusSet:*(void *)(*(void *)&buf[8] + 40)];
  id v16 = (void *)[v12 mutableCopy];
  [v16 minusSet:v26[5]];
  id v17 = (void *)[v13 mutableCopy];
  [v17 minusSet:v20[5]];
  [(ATXCandidateRelevanceModelDataStore *)self deleteRowsWithIds:v15 fromTableWithName:@"relevanceCandidates"];
  [(ATXCandidateRelevanceModelDataStore *)self deleteRowsWithIds:v16 fromTableWithName:@"relevanceFeaturizationManagers"];
  [(ATXCandidateRelevanceModelDataStore *)self deleteRowsWithIds:v17 fromTableWithName:@"relevanceDatasetMetadata"];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v32, 8);
}

void __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke_2;
  v3[3] = &unk_1E68AD2C8;
  uint64_t v5 = *(void *)(a1 + 48);
  long long v4 = *(_OWORD *)(a1 + 32);
  [v2 writeTransaction:v3];
}

void __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke_2(void *a1)
{
  v2 = [*(id *)(a1[4] + 8) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke_3;
  v4[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  void v4[4] = a1[6];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke_4;
  v3[3] = &unk_1E68AD228;
  void v3[4] = a1[5];
  [v2 prepAndRunQuery:@"DELETE FROM relevanceCandidateModels WHERE trainDate < :trainDate" onPrep:v4 onRow:v3 onError:0];
}

uint64_t __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":trainDate" toInt64:(uint64_t)*(double *)(a1 + 32)];
}

uint64_t __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke_4(uint64_t a1)
{
  return *MEMORY[0x1E4F93C08];
}

void __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke_344(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke_2_345;
  v4[3] = &unk_1E68AEF58;
  long long v3 = *(_OWORD *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 32);
  long long v6 = v3;
  [v2 readTransaction:v4];
}

void __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke_2_345(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke_3_349;
  v3[3] = &unk_1E68AEF30;
  long long v4 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  [v2 prepAndRunQuery:@"SELECT candidateId, featurizationManagerId, datasetMetadataId FROM relevanceCandidateModels", 0, v3, 0 onPrep onRow onError];
}

uint64_t __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke_3_349(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getInt64ForColumn:0];
  uint64_t v5 = *(void **)(*(void *)(a1[4] + 8) + 40);
  long long v6 = [NSNumber numberWithLongLong:v4];
  [v5 addObject:v6];

  uint64_t v7 = [v3 getInt64ForColumn:1];
  id v8 = *(void **)(*(void *)(a1[5] + 8) + 40);
  id v9 = [NSNumber numberWithLongLong:v7];
  [v8 addObject:v9];

  uint64_t v10 = [v3 getInt64ForColumn:2];
  uint64_t v11 = *(void **)(*(void *)(a1[6] + 8) + 40);
  uint64_t v12 = [NSNumber numberWithLongLong:v10];
  [v11 addObject:v12];

  return *MEMORY[0x1E4F93C08];
}

- (void)writeVerificationStatusForModelUUID:(id)a3 clientModelName:(id)a4 expectedNumberOfModels:(unint64_t)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __114__ATXCandidateRelevanceModelDataStore_writeVerificationStatusForModelUUID_clientModelName_expectedNumberOfModels___block_invoke;
  v14[3] = &unk_1E68AEF80;
  void v14[4] = &v15;
  [(ATXCandidateRelevanceModelDataStore *)self receiveTrainingResult:v14 completion:&__block_literal_global_351 modelUUID:v8 clientModelName:v9];
  if (v16[3] == a5)
  {
    [(ATXCandidateRelevanceModelDataStore *)self writeSuccessfulVerificationForModelUUID:v8];
  }
  else
  {
    uint64_t v10 = __atxlog_handle_relevance_model();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      uint64_t v13 = v16[3];
      *(_DWORD *)buf = 138413314;
      uint64_t v20 = v12;
      __int16 v21 = 2112;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v9;
      __int16 v25 = 2048;
      unint64_t v26 = a5;
      __int16 v27 = 2048;
      uint64_t v28 = v13;
      _os_log_error_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_ERROR, "%@ - Unable to verify modelUUID %@ for %@ because we expected %lu models, but only see %lu in the database.", buf, 0x34u);
    }
  }
  _Block_object_dispose(&v15, 8);
}

uint64_t __114__ATXCandidateRelevanceModelDataStore_writeVerificationStatusForModelUUID_clientModelName_expectedNumberOfModels___block_invoke(uint64_t result)
{
  return result;
}

- (void)writeSuccessfulVerificationForModelUUID:(id)a3
{
  id v4 = a3;
  dataStore = self->_dataStore;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__ATXCandidateRelevanceModelDataStore_writeSuccessfulVerificationForModelUUID___block_invoke;
  v7[3] = &unk_1E68AB870;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(_ATXDataStore *)dataStore _doSync:v7];
}

void __79__ATXCandidateRelevanceModelDataStore_writeSuccessfulVerificationForModelUUID___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__ATXCandidateRelevanceModelDataStore_writeSuccessfulVerificationForModelUUID___block_invoke_2;
  v4[3] = &unk_1E68AB870;
  id v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 writeTransaction:v4];
}

void __79__ATXCandidateRelevanceModelDataStore_writeSuccessfulVerificationForModelUUID___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__ATXCandidateRelevanceModelDataStore_writeSuccessfulVerificationForModelUUID___block_invoke_3;
  v4[3] = &unk_1E68AD200;
  id v5 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__ATXCandidateRelevanceModelDataStore_writeSuccessfulVerificationForModelUUID___block_invoke_4;
  v3[3] = &unk_1E68AD250;
  void v3[4] = *(void *)(a1 + 32);
  [v2 prepAndRunQuery:@"UPDATE relevanceCandidateModels SET isVerified = 1 WHERE modelUUID = :modelUUID " onPrep:v4 onRow:0 onError:v3];
}

void __79__ATXCandidateRelevanceModelDataStore_writeSuccessfulVerificationForModelUUID___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 UUIDString];
  [v3 bindNamedParam:":modelUUID" toNSString:v4];
}

uint64_t __79__ATXCandidateRelevanceModelDataStore_writeSuccessfulVerificationForModelUUID___block_invoke_4(uint64_t a1)
{
  v2 = __atxlog_handle_relevance_model();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    __79__ATXCandidateRelevanceModelDataStore_writeSuccessfulVerificationForModelUUID___block_invoke_4_cold_1(a1, v2);
  }

  return *MEMORY[0x1E4F93C10];
}

- (BOOL)isModelUUIDVerified:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  dataStore = self->_dataStore;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__ATXCandidateRelevanceModelDataStore_isModelUUIDVerified___block_invoke;
  v8[3] = &unk_1E68AD278;
  void v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  uint64_t v10 = &v11;
  [(_ATXDataStore *)dataStore _doSync:v8];
  LOBYTE(dataStore) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)dataStore;
}

void __59__ATXCandidateRelevanceModelDataStore_isModelUUIDVerified___block_invoke(void *a1)
{
  v2 = [*(id *)(a1[4] + 8) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__ATXCandidateRelevanceModelDataStore_isModelUUIDVerified___block_invoke_2;
  v6[3] = &unk_1E68AD278;
  id v3 = (void *)a1[5];
  void v6[4] = a1[4];
  id v4 = v3;
  uint64_t v5 = a1[6];
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 readTransaction:v6];
}

void __59__ATXCandidateRelevanceModelDataStore_isModelUUIDVerified___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__ATXCandidateRelevanceModelDataStore_isModelUUIDVerified___block_invoke_3;
  v4[3] = &unk_1E68AD200;
  id v5 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__ATXCandidateRelevanceModelDataStore_isModelUUIDVerified___block_invoke_4;
  v3[3] = &unk_1E68AD228;
  void v3[4] = *(void *)(a1 + 48);
  [v2 prepAndRunQuery:@"SELECT isVerified FROM relevanceCandidateModels WHERE modelUUID = :modelUUID LIMIT 1" onPrep:v4 onRow:v3 onError:0];
}

void __59__ATXCandidateRelevanceModelDataStore_isModelUUIDVerified___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 UUIDString];
  [v3 bindNamedParam:":modelUUID" toNSString:v4];
}

uint64_t __59__ATXCandidateRelevanceModelDataStore_isModelUUIDVerified___block_invoke_4(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = [a2 getIntegerForColumn:0] != 0;
  return *MEMORY[0x1E4F93C10];
}

- (void).cxx_destruct
{
}

- (void)writeTrainingResult:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = [(id)OUTLINED_FUNCTION_8() debugDescription];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v3, v4, "%@ - Skipping the training results write because there was an error when serializing modelData: %@", v5, v6, v7, v8, v9);
}

- (void)writeTrainingResult:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = [(id)OUTLINED_FUNCTION_8() debugDescription];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v3, v4, "%@ - Skipping the training results write because there was an error when creating or retrieving datasetMetadataId: %@", v5, v6, v7, v8, v9);
}

- (void)writeTrainingResult:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = [(id)OUTLINED_FUNCTION_8() debugDescription];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v3, v4, "%@ - Skipping the training results write because there was an error when creating or retrieving candidateId: %@", v5, v6, v7, v8, v9);
}

- (void)writeTrainingResult:.cold.4()
{
  OUTLINED_FUNCTION_2_0();
  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = [(id)OUTLINED_FUNCTION_8() debugDescription];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v3, v4, "%@ - Skipping the training results write because there was an error when creating or retrieving featurizationManagerId: %@", v5, v6, v7, v8, v9);
}

- (void)featurizationManagerIdForFeaturizationManager:error:.cold.1()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_3_2(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5_1(&dword_1D0FA3000, "%@ - Could not find featurizationManagerId for featurizationManager that was just written to the datastore for featurizationManager: %@", v4, v5);
}

- (void)datasetMetadataIdForDatasetMetadata:error:.cold.1()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_3_2(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5_1(&dword_1D0FA3000, "%@ - Could not find datasetMetadataId for datasetMetadata that was just written to the datastore for datasetMetadata: %@", v4, v5);
}

- (void)candidateIdForCandidate:error:.cold.1()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_3_2(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5_1(&dword_1D0FA3000, "%@ - Could not find candidateId for candidate that was just written to the datastore for candidate: %@", v4, v5);
}

void __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_14(&dword_1D0FA3000, v0, v1, "Failed to unarchive candidateModel trained classifier with error: %{public}@. modelId: %@, clientModelName: %@");
}

void __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke_4_cold_2()
{
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_14(&dword_1D0FA3000, v0, v1, "Failed to unarchive candidateData with error: %{public}@. modelId: %@, clientModelName: %@");
}

void __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke_4_cold_3()
{
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_14(&dword_1D0FA3000, v0, v1, "Failed to unarchive featurizationManagerData with error: %{public}@. modelId: %@, clientModelName: %@");
}

void __79__ATXCandidateRelevanceModelDataStore_writeSuccessfulVerificationForModelUUID___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "%@ - Error while verifying and activating models", (uint8_t *)&v5, 0xCu);
}

@end