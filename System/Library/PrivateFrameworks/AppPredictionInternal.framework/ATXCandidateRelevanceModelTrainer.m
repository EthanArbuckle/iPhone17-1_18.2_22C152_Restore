@interface ATXCandidateRelevanceModelTrainer
- (ATXCandidateRelevanceModelTrainer)initWithConfig:(id)a3;
- (void)generateAndSaveDatasetWithFilename:(id)a3;
- (void)trainWithXPCActivity:(id)a3 disregardDatasetMetadataRequirements:(BOOL)a4;
@end

@implementation ATXCandidateRelevanceModelTrainer

- (ATXCandidateRelevanceModelTrainer)initWithConfig:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXCandidateRelevanceModelTrainer;
  v6 = [(ATXCandidateRelevanceModelTrainer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_config, a3);
  }

  return v7;
}

- (void)generateAndSaveDatasetWithFilename:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ATXCandidateRelevanceModelConfig *)self->_config datasetGenerator];
  v6 = objc_opt_new();
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __72__ATXCandidateRelevanceModelTrainer_generateAndSaveDatasetWithFilename___block_invoke;
  v58[3] = &unk_1E68B1AB0;
  v58[4] = self;
  id v7 = v6;
  id v59 = v7;
  [v5 receiveDataPoint:v58 completion:&__block_literal_global_112];
  v8 = [ATXCandidateRelevanceModelFeaturizationManager alloc];
  v38 = self;
  objc_super v9 = [(ATXCandidateRelevanceModelConfig *)self->_config featurizers];
  v10 = [(ATXCandidateRelevanceModelFeaturizationManager *)v8 initWithFeaturizers:v9];

  v11 = [MEMORY[0x1E4F4B650] appPredictionDirectory];
  v43 = v4;
  uint64_t v12 = [v11 stringByAppendingPathComponent:v4];

  v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v13 createFileAtPath:v12 contents:0 attributes:0];

  v42 = (void *)v12;
  v14 = [MEMORY[0x1E4F28CB0] fileHandleForWritingAtPath:v12];
  v15 = objc_opt_new();
  v47 = v10;
  uint64_t v16 = [(ATXCandidateRelevanceModelFeaturizationManager *)v10 featureNames];
  [v15 addObject:@"Candidate"];
  [v15 addObject:@"CandidateIdentifier"];
  [v15 addObject:@"CandidateType"];
  [v15 addObject:@"SessionId"];
  [v15 addObject:@"Engaged"];
  v40 = (void *)v16;
  [v15 addObjectsFromArray:v16];
  v51 = v14;
  v41 = v15;
  [v14 writeCommaSeparatedValues:v15];
  v17 = objc_opt_new();
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __72__ATXCandidateRelevanceModelTrainer_generateAndSaveDatasetWithFilename___block_invoke_3;
  v56[3] = &unk_1E68B1AD8;
  id v46 = v17;
  id v57 = v46;
  v48 = v5;
  [v5 receiveDatasetSession:v56 completion:&__block_literal_global_42_0];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v7;
  uint64_t v49 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v49)
  {
    uint64_t v45 = *(void *)v53;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v53 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v50 = v18;
        v19 = *(void **)(*((void *)&v52 + 1) + 8 * v18);
        v20 = [(id)objc_opt_class() candidateDataPointsForSessions:v46 candidate:v19];
        v21 = [(ATXCandidateRelevanceModelFeaturizationManager *)v47 sparseFeatureMatrixFromDataPoints:v20];
        v22 = [(id)objc_opt_class() labelsFromDataPoints:v20];
        uint64_t v23 = [v21 numberOfRows];
        if (v23 != [v22 count])
        {
          v37 = [MEMORY[0x1E4F28B00] currentHandler];
          [v37 handleFailureInMethod:a2 object:v38 file:@"ATXCandidateRelevanceModelTrainer.m" lineNumber:102 description:@"Feature matrix does not match the size of labels."];
        }
        if ([v21 numberOfRows])
        {
          unint64_t v24 = 0;
          do
          {
            v25 = objc_opt_new();
            v26 = [v19 description];
            [v25 addObject:v26];

            v27 = [v19 identifier];
            [v25 addObject:v27];

            v28 = [v19 type];
            [v25 addObject:v28];

            v29 = [v20 objectAtIndexedSubscript:v24];
            v30 = [v29 contextDefinedSessionId];
            v31 = [v30 UUIDString];
            [v25 addObject:v31];

            v32 = [v22 objectAtIndexedSubscript:v24];
            v33 = [v32 stringValue];
            [v25 addObject:v33];

            if ([v21 numberOfColumns])
            {
              unint64_t v34 = 0;
              do
              {
                [v21 valueAtRow:v24 column:v34];
                v35 = objc_msgSend(NSNumber, "numberWithFloat:");
                v36 = [v35 stringValue];
                [v25 addObject:v36];

                ++v34;
              }
              while ([v21 numberOfColumns] > v34);
            }
            [v51 writeCommaSeparatedValues:v25];

            ++v24;
          }
          while ([v21 numberOfRows] > v24);
        }

        uint64_t v18 = v50 + 1;
      }
      while (v50 + 1 != v49);
      uint64_t v49 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v49);
  }

  [v51 closeFile];
}

void __72__ATXCandidateRelevanceModelTrainer_generateAndSaveDatasetWithFilename___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "featurizers", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
        v10 = [v3 context];
        v11 = [v3 candidate];
        [v9 observeContext:v10 candidate:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  uint64_t v12 = *(void **)(a1 + 40);
  v13 = [v3 candidate];
  [v12 addObject:v13];
}

uint64_t __72__ATXCandidateRelevanceModelTrainer_generateAndSaveDatasetWithFilename___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)trainWithXPCActivity:(id)a3 disregardDatasetMetadataRequirements:(BOOL)a4
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(ATXCandidateRelevanceModelConfig *)self->_config isEnabled])
  {
    uint64_t v6 = +[ATXCandidateRelevanceModelGlobals sharedInstance];
    char v7 = [v6 isPipelineEnabled];

    if (v7)
    {
      uint64_t v8 = __atxlog_handle_relevance_model();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        v11 = [(ATXCandidateRelevanceModelConfig *)self->_config clientModel];
        uint64_t v12 = [v11 clientModelId];
        *(_DWORD *)buf = 138412546;
        v137 = v10;
        __int16 v138 = 2112;
        v139 = v12;
        _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "%@ - Beginning model training for config with client model name: %@.", buf, 0x16u);
      }
      v13 = [(ATXCandidateRelevanceModelConfig *)self->_config datastore];
      long long v14 = [(ATXCandidateRelevanceModelConfig *)self->_config clientModel];
      long long v15 = [v14 clientModelId];
      long long v16 = [MEMORY[0x1E4F1C9C8] now];
      long long v17 = [v16 dateByAddingTimeInterval:-86400.0];
      uint64_t v18 = [v13 cachedCandidatesForModelId:v15 earliestDate:v17];

      uint64_t v19 = v18;
      v20 = [v18 candidates];
      v119 = [v18 featurizationManager];
      v21 = [(ATXCandidateRelevanceModelConfig *)self->_config datasetGenerator];
      v112 = v21;
      v113 = self;
      if (v18)
      {
        v22 = __atxlog_handle_relevance_model();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          v25 = unint64_t v24 = v20;
          *(_DWORD *)buf = 138412290;
          v137 = v25;
          _os_log_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_DEFAULT, "%@ - Using cached candidates since a deferral must have occurred.", buf, 0xCu);

          v20 = v24;
        }
      }
      else
      {
        v30 = v20;
        v31 = objc_opt_new();
        v32 = objc_opt_new();
        v132[0] = MEMORY[0x1E4F143A8];
        v132[1] = 3221225472;
        v132[2] = __95__ATXCandidateRelevanceModelTrainer_trainWithXPCActivity_disregardDatasetMetadataRequirements___block_invoke;
        v132[3] = &unk_1E68B1B00;
        v132[4] = self;
        id v33 = v32;
        id v133 = v33;
        id v34 = v31;
        id v134 = v34;
        [v21 receiveDataPoint:v132 completion:&__block_literal_global_56];
        v117 = [v33 currentMetadata];
        v35 = __atxlog_handle_relevance_model();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v36 = (objc_class *)objc_opt_class();
          v37 = NSStringFromClass(v36);
          [(ATXCandidateRelevanceModelConfig *)self->_config clientModel];
          v39 = id v38 = v5;
          v40 = [v39 clientModelId];
          *(_DWORD *)buf = 138412802;
          v137 = v37;
          __int16 v138 = 2112;
          v139 = v40;
          __int16 v140 = 2112;
          v141 = v117;
          _os_log_impl(&dword_1D0FA3000, v35, OS_LOG_TYPE_DEFAULT, "%@ - Overall dataset metadata for config with client model name %@:\n%@", buf, 0x20u);

          id v5 = v38;
        }

        if (a4
          || [(ATXCandidateRelevanceModelConfig *)self->_config shouldTrainModelWithOverallDatasetMetadata:v117])
        {
          v41 = [v34 allKeys];
          v130[0] = MEMORY[0x1E4F143A8];
          v130[1] = 3221225472;
          v130[2] = __95__ATXCandidateRelevanceModelTrainer_trainWithXPCActivity_disregardDatasetMetadataRequirements___block_invoke_57;
          v130[3] = &unk_1E68B1B28;
          v42 = v34;
          v131 = v42;
          [v41 sortedArrayUsingComparator:v130];
          v44 = id v43 = v5;

          unint64_t v45 = [v44 count];
          int v46 = [(ATXCandidateRelevanceModelConfig *)v113->_config maximumNumberOfTrainedCandidates];
          if (v45 >= v46) {
            unint64_t v47 = v46;
          }
          else {
            unint64_t v47 = v45;
          }
          v48 = objc_msgSend(v44, "subarrayWithRange:", 0, v47);

          v126[0] = MEMORY[0x1E4F143A8];
          v126[1] = 3221225472;
          v126[2] = __95__ATXCandidateRelevanceModelTrainer_trainWithXPCActivity_disregardDatasetMetadataRequirements___block_invoke_2_59;
          v126[3] = &unk_1E68B1B50;
          v127 = v42;
          v128 = v113;
          BOOL v129 = a4;
          uint64_t v49 = objc_msgSend(v48, "_pas_filteredArrayWithTest:", v126);

          uint64_t v50 = [ATXCandidateRelevanceModelFeaturizationManager alloc];
          v51 = [(ATXCandidateRelevanceModelConfig *)v113->_config featurizers];
          uint64_t v52 = [(ATXCandidateRelevanceModelFeaturizationManager *)v50 initWithFeaturizers:v51];

          long long v53 = [(ATXCandidateRelevanceModelConfig *)v113->_config datastore];
          long long v54 = [(ATXCandidateRelevanceModelConfig *)v113->_config clientModel];
          long long v55 = [v54 clientModelId];
          v30 = (void *)v49;
          [v53 cacheSelectedCandidates:v49 featurizationManager:v52 modelId:v55];

          char v56 = 1;
          id v57 = v131;
          v119 = (void *)v52;
          id v5 = v43;
          self = v113;
        }
        else
        {
          id v57 = __atxlog_handle_relevance_model();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            v58 = (objc_class *)objc_opt_class();
            id v59 = NSStringFromClass(v58);
            *(_DWORD *)buf = 138412290;
            v137 = v59;
            _os_log_impl(&dword_1D0FA3000, v57, OS_LOG_TYPE_DEFAULT, "%@ - Config specifies we shouldn't begin training yet given the overall dataset metadata. Skipping model training for all candidates.", buf, 0xCu);
          }
          char v56 = 0;
        }

        uint64_t v19 = 0;
        v21 = v112;
        v20 = v30;
        if ((v56 & 1) == 0) {
          goto LABEL_56;
        }
      }
      if (v20 && v119)
      {
        if (![v5 didDefer])
        {
          id v108 = v5;
          uint64_t v111 = objc_opt_new();
          long long v122 = 0u;
          long long v123 = 0u;
          long long v124 = 0u;
          long long v125 = 0u;
          id obj = v20;
          uint64_t v115 = [obj countByEnumeratingWithState:&v122 objects:v135 count:16];
          v109 = v19;
          v107 = v20;
          if (v115)
          {
            uint64_t v118 = 0;
            uint64_t v114 = *(void *)v123;
            do
            {
              uint64_t v64 = 0;
              do
              {
                if (*(void *)v123 != v114) {
                  objc_enumerationMutation(obj);
                }
                v65 = *(void **)(*((void *)&v122 + 1) + 8 * v64);
                v66 = (void *)MEMORY[0x1D25F6CC0]();
                v67 = __atxlog_handle_relevance_model();
                if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
                {
                  v68 = (objc_class *)objc_opt_class();
                  v69 = NSStringFromClass(v68);
                  v70 = [v65 identifier];
                  *(_DWORD *)buf = 138412546;
                  v137 = v69;
                  __int16 v138 = 2112;
                  v139 = v70;
                  _os_log_impl(&dword_1D0FA3000, v67, OS_LOG_TYPE_DEFAULT, "%@ - Setting up dataset for candidate with identifier: %@", buf, 0x16u);
                }
                v71 = objc_opt_new();
                v120[0] = MEMORY[0x1E4F143A8];
                v120[1] = 3221225472;
                v120[2] = __95__ATXCandidateRelevanceModelTrainer_trainWithXPCActivity_disregardDatasetMetadataRequirements___block_invoke_62;
                v120[3] = &unk_1E68B1B78;
                id v72 = v71;
                id v121 = v72;
                [v21 receiveCandidateDataPoint:v120 completion:&__block_literal_global_65_2 candidate:v65];
                v73 = +[ATXCandidateRelevanceModelDataStoreDatasetMetadata datasetMetadataForDataPoints:v72];
                v74 = __atxlog_handle_relevance_model();
                if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
                {
                  v75 = (objc_class *)objc_opt_class();
                  v76 = NSStringFromClass(v75);
                  v77 = [v65 identifier];
                  *(_DWORD *)buf = 138412802;
                  v137 = v76;
                  __int16 v138 = 2112;
                  v139 = v77;
                  __int16 v140 = 2112;
                  v141 = v73;
                  _os_log_impl(&dword_1D0FA3000, v74, OS_LOG_TYPE_DEFAULT, "%@ - Candidate dataset metadata for candidate identifier %@:\n%@", buf, 0x20u);
                }
                if (a4
                  || [(ATXCandidateRelevanceModelConfig *)self->_config shouldTrainModelWithCandidateDatasetMetadata:v73])
                {
                  v78 = __atxlog_handle_relevance_model();
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                  {
                    v79 = (objc_class *)objc_opt_class();
                    v80 = NSStringFromClass(v79);
                    v81 = [v65 identifier];
                    *(_DWORD *)buf = 138412546;
                    v137 = v80;
                    __int16 v138 = 2112;
                    v139 = v81;
                    _os_log_impl(&dword_1D0FA3000, v78, OS_LOG_TYPE_DEFAULT, "%@ - Training model for candidate with identifier: %@", buf, 0x16u);
                  }
                  v82 = [(ATXCandidateRelevanceModelConfig *)self->_config modelTrainingPlan];
                  v83 = [v82 trainModelForDataPoints:v72 candidate:v65 featurizationManager:v119];

                  v84 = __atxlog_handle_relevance_model();
                  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
                  {
                    v85 = (objc_class *)objc_opt_class();
                    v86 = NSStringFromClass(v85);
                    v87 = [v65 identifier];
                    *(_DWORD *)buf = 138412546;
                    v137 = v86;
                    __int16 v138 = 2112;
                    v139 = v87;
                    _os_log_impl(&dword_1D0FA3000, v84, OS_LOG_TYPE_DEFAULT, "%@ - Writing model to datastore for candidate with identifier: %@", buf, 0x16u);
                  }
                  v88 = [ATXCandidateRelevanceModelDataStoreTrainingResult alloc];
                  v89 = [(ATXCandidateRelevanceModelConfig *)self->_config clientModel];
                  v90 = [v89 clientModelId];
                  v91 = [MEMORY[0x1E4F1C9C8] now];
                  LOBYTE(v106) = 0;
                  v92 = [(ATXCandidateRelevanceModelDataStoreTrainingResult *)v88 initWithModel:v83 candidate:v65 featurizationManager:v119 modelUUID:v111 datasetMetadata:v73 clientModelName:v90 trainDate:v91 isVerified:v106];

                  self = v113;
                  v93 = [(ATXCandidateRelevanceModelConfig *)v113->_config datastore];
                  [v93 writeTrainingResult:v92];

                  ++v118;
                  v21 = v112;
                }
                else
                {
                  v83 = __atxlog_handle_relevance_model();
                  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
                  {
                    v94 = (objc_class *)objc_opt_class();
                    v95 = NSStringFromClass(v94);
                    v96 = [v65 identifier];
                    *(_DWORD *)buf = 138412546;
                    v137 = v95;
                    __int16 v138 = 2112;
                    v139 = v96;
                    _os_log_impl(&dword_1D0FA3000, v83, OS_LOG_TYPE_DEFAULT, "%@ - Config specifies we shouldn't train a model given the candidate dataset metadata. Skipping model training for candidate with identifier: %@", buf, 0x16u);
                  }
                }

                ++v64;
              }
              while (v115 != v64);
              uint64_t v97 = [obj countByEnumeratingWithState:&v122 objects:v135 count:16];
              uint64_t v115 = v97;
            }
            while (v97);
          }
          else
          {
            uint64_t v118 = 0;
          }

          v98 = [(ATXCandidateRelevanceModelConfig *)self->_config datastore];
          v99 = [(ATXCandidateRelevanceModelConfig *)self->_config clientModel];
          v100 = [v99 clientModelId];
          v60 = v111;
          [v98 writeVerificationStatusForModelUUID:v111 clientModelName:v100 expectedNumberOfModels:v118];

          v101 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-1209600.0];
          v102 = [(ATXCandidateRelevanceModelConfig *)self->_config datastore];
          v103 = [(ATXCandidateRelevanceModelConfig *)self->_config clientModel];
          v104 = [v103 clientModelId];
          [v102 deleteCachedCandidatesForModelId:v104];

          v21 = v112;
          v105 = [(ATXCandidateRelevanceModelConfig *)self->_config datastore];
          [v105 deleteTrainedModelsWithTrainDateOlderThanDate:v101];

          id v5 = v108;
          uint64_t v19 = v109;
          v20 = v107;
          goto LABEL_55;
        }
        v60 = __atxlog_handle_relevance_model();
        if (!os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
LABEL_55:

LABEL_56:
          goto LABEL_57;
        }
        uint64_t v61 = (objc_class *)objc_opt_class();
        v62 = NSStringFromClass(v61);
        *(_DWORD *)buf = 138412290;
        v137 = v62;
        _os_log_impl(&dword_1D0FA3000, v60, OS_LOG_TYPE_DEFAULT, "%@ - Stopping model training early due to deferral.", buf, 0xCu);
      }
      else
      {
        v60 = __atxlog_handle_relevance_model();
        if (!os_log_type_enabled(v60, OS_LOG_TYPE_FAULT)) {
          goto LABEL_55;
        }
        v63 = (objc_class *)objc_opt_class();
        v62 = NSStringFromClass(v63);
        *(_DWORD *)buf = 138412802;
        v137 = v62;
        __int16 v138 = 2112;
        v139 = v20;
        __int16 v140 = 2112;
        v141 = v119;
        _os_log_fault_impl(&dword_1D0FA3000, v60, OS_LOG_TYPE_FAULT, "%@ - Programmer error: Either the candidates list (%@) or featurizationManager is nil (%@).", buf, 0x20u);
      }

      goto LABEL_55;
    }
  }
  uint64_t v19 = __atxlog_handle_relevance_model();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v26 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v26);
    v28 = [(ATXCandidateRelevanceModelConfig *)self->_config clientModel];
    v29 = [v28 clientModelId];
    *(_DWORD *)buf = 138412546;
    v137 = v27;
    __int16 v138 = 2112;
    v139 = v29;
    _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_DEFAULT, "%@ - Config with client model name %@ is not enabled or the pipeline is disabled. Skipping training.", buf, 0x16u);
  }
LABEL_57:
}

void __95__ATXCandidateRelevanceModelTrainer_trainWithXPCActivity_disregardDatasetMetadataRequirements___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "featurizers", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
        v10 = [v3 context];
        v11 = [v3 candidate];
        [v9 observeContext:v10 candidate:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  [*(id *)(a1 + 40) observeDataPoint:v3];
  uint64_t v12 = *(void **)(a1 + 48);
  v13 = [v3 candidate];
  long long v14 = [v12 objectForKeyedSubscript:v13];

  if (!v14)
  {
    long long v15 = objc_opt_new();
    long long v16 = *(void **)(a1 + 48);
    long long v17 = [v3 candidate];
    [v16 setObject:v15 forKeyedSubscript:v17];
  }
  uint64_t v18 = *(void **)(a1 + 48);
  uint64_t v19 = [v3 candidate];
  v20 = [v18 objectForKeyedSubscript:v19];
  [v20 observeDataPoint:v3];
}

uint64_t __95__ATXCandidateRelevanceModelTrainer_trainWithXPCActivity_disregardDatasetMetadataRequirements___block_invoke_57(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKeyedSubscript:a2];
  uint64_t v8 = [v7 currentMetadata];

  objc_super v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  v10 = [v9 currentMetadata];

  uint64_t v11 = [v10 compare:v8];
  return v11;
}

uint64_t __95__ATXCandidateRelevanceModelTrainer_trainWithXPCActivity_disregardDatasetMetadataRequirements___block_invoke_2_59(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  uint64_t v5 = [v4 currentMetadata];

  id v6 = __atxlog_handle_relevance_model();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    objc_super v9 = [v3 identifier];
    int v16 = 138412802;
    long long v17 = v8;
    __int16 v18 = 2112;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    long long v21 = v5;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "%@ - Candidate dataset metadata (positive only) for candidate identifier %@:\n%@", (uint8_t *)&v16, 0x20u);
  }
  if (*(unsigned char *)(a1 + 48)
    || ([*(id *)(*(void *)(a1 + 40) + 8) shouldTrainModelWithPositiveCandidateDatasetMetadata:v5] & 1) != 0)
  {
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v12 = __atxlog_handle_relevance_model();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class();
      long long v14 = NSStringFromClass(v13);
      long long v15 = [v3 identifier];
      int v16 = 138412546;
      long long v17 = v14;
      __int16 v18 = 2112;
      uint64_t v19 = v15;
      _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "%@ - Config specifies we shouldn't train a model given the candidate dataset metadata (positive only). Skipping model training for candidate with identifier: %@", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t __95__ATXCandidateRelevanceModelTrainer_trainWithXPCActivity_disregardDatasetMetadataRequirements___block_invoke_62(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void).cxx_destruct
{
}

@end