@interface ATXAnchorModelTrainer
- (ATXAnchorModelTrainer)init;
- (ATXAnchorModelTrainer)initWithXPCActivity:(id)a3;
- (ATXAnchorModelTrainer)initWithXPCActivity:(id)a3 dataStoreWrapper:(id)a4;
- (BOOL)anchorWasRecentlyTrained:(id)a3;
- (id)anchorsToIncludeInTraining;
- (id)candidateTypeFromCandidateId:(id)a3;
- (id)trainAnchorModel:(id)a3;
- (id)trainAnchorModel:(id)a3 phase1Trainer:(id)a4 phase2Trainer:(id)a5 phase3Trainer:(id)a6;
- (id)trainModelPerCandidateSelectedInPhase1:(id)a3 phase2Trainer:(id)a4 phase3Trainer:(id)a5 phase1Results:(id)a6;
- (void)train;
@end

@implementation ATXAnchorModelTrainer

- (ATXAnchorModelTrainer)init
{
  v3 = objc_opt_new();
  v4 = [(ATXAnchorModelTrainer *)self initWithXPCActivity:0 dataStoreWrapper:v3];

  return v4;
}

- (ATXAnchorModelTrainer)initWithXPCActivity:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(ATXAnchorModelTrainer *)self initWithXPCActivity:v4 dataStoreWrapper:v5];

  return v6;
}

- (ATXAnchorModelTrainer)initWithXPCActivity:(id)a3 dataStoreWrapper:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXAnchorModelTrainer;
  v9 = [(ATXAnchorModelTrainer *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_xpcActivity, a3);
    objc_storeStrong((id *)&v10->_dataStoreWrapper, a4);
    uint64_t v11 = +[ATXAnchorModelHyperParameters sharedInstance];
    hyperparameters = v10->_hyperparameters;
    v10->_hyperparameters = (ATXAnchorModelHyperParameters *)v11;
  }
  return v10;
}

- (id)anchorsToIncludeInTraining
{
  v2 = [(ATXAnchorModelHyperParameters *)self->_hyperparameters enabledAnchors];
  v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_26);

  return v3;
}

id __51__ATXAnchorModelTrainer_anchorsToIncludeInTraining__block_invoke(int a1, NSString *aClassName)
{
  NSClassFromString(aClassName);
  v2 = objc_opt_new();
  return v2;
}

- (void)train
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "Anchor Model training has exceeded 15 minutes. Training completed in %.2f seconds.", (uint8_t *)&v2, 0xCu);
}

uint64_t __30__ATXAnchorModelTrainer_train__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) anchorWasRecentlyTrained:v3];
  if (v4)
  {
    v5 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Skipping training of anchor because it was recently trained. Anchor: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  return v4 ^ 1u;
}

- (BOOL)anchorWasRecentlyTrained:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  [(ATXAnchorModelHyperParameters *)self->_hyperparameters maxTrainingAgeInSecondsToConsiderForRetraining];
  int v7 = (void *)[v5 initWithTimeIntervalSinceNow:-v6];
  id v8 = [(ATXAnchorModelDataStoreWrapperProtocol *)self->_dataStoreWrapper dateAnchorModelWasLastTrainedForAnchor:v4];
  uint64_t v9 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412546;
    id v14 = v4;
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_INFO, "Anchor %@ was last trained on %@", (uint8_t *)&v13, 0x16u);
  }

  v10 = [v8 laterDate:v7];
  BOOL v11 = v10 == v8;

  return v11;
}

- (id)trainAnchorModel:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v4;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_INFO, "Starting training for Anchor %@", buf, 0xCu);
  }

  v25 = objc_opt_new();
  double v6 = v4;
  [(ATXAnchorModelDataStoreWrapperProtocol *)self->_dataStoreWrapper uniqueAnchorEventIdentifiersForAnchor:v4];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        BOOL v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([(ATXXPCActivity *)self->_xpcActivity didDefer])
        {
          v22 = __atxlog_handle_anchor();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v32 = v6;
            _os_log_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_DEFAULT, "Deferring training of additional anchors in the middle of training anchor model for anchor %@ because XPC activity asked for deferral. Not going to process any other anchors for now.", buf, 0xCu);
          }

          v18 = obj;
          id v21 = (id)MEMORY[0x1E4F1CBF0];
          v20 = v25;
          goto LABEL_17;
        }
        v12 = (void *)[v6 copy];
        int v13 = (void *)[v11 copy];
        [v12 setAnchorEventIdentifier:v13];

        id v14 = [[ATXAnchorModelPhase1Trainer alloc] initForAnchor:v12 anchorModelDataStoreWrapper:self->_dataStoreWrapper];
        id v15 = [[ATXAnchorModelPhase2Trainer alloc] initForAnchor:v12 anchorModelDataStoreWrapper:self->_dataStoreWrapper];
        id v16 = [[ATXAnchorModelPhase3Trainer alloc] initForAnchor:v12 anchorModelDataStoreWrapper:self->_dataStoreWrapper];
        uint64_t v17 = [(ATXAnchorModelTrainer *)self trainAnchorModel:v12 phase1Trainer:v14 phase2Trainer:v15 phase3Trainer:v16];
        [v25 addObjectsFromArray:v17];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  v18 = obj;

  v19 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v6;
    _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_INFO, "Finished training for Anchor %@.", buf, 0xCu);
  }

  v20 = v25;
  id v21 = v25;
LABEL_17:

  return v21;
}

- (id)trainAnchorModel:(id)a3 phase1Trainer:(id)a4 phase2Trainer:(id)a5 phase3Trainer:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v10 anchorEventIdentifier];
    int v24 = 138412546;
    uint64_t v25 = (uint64_t)v10;
    __int16 v26 = 2112;
    long long v27 = v15;
    _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "Starting training of Anchor Model for anchor: %@, event identifier: %@...", (uint8_t *)&v24, 0x16u);
  }
  if ([(ATXXPCActivity *)self->_xpcActivity didDefer])
  {
    id v16 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      uint64_t v25 = (uint64_t)v10;
      _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "Deferring training of additional anchors in the middle of training anchor model for anchor %@ because XPC activity asked for deferral. Not going to process any other anchors for now.", (uint8_t *)&v24, 0xCu);
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v16 = [v11 trainPhase1];
    v18 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [v10 anchorEventIdentifier];
      uint64_t v20 = [v16 count];
      int v24 = 138412802;
      uint64_t v25 = (uint64_t)v10;
      __int16 v26 = 2112;
      long long v27 = v19;
      __int16 v28 = 2048;
      uint64_t v29 = v20;
      _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, "Finished training Anchor Model Phase 1 for anchor: %@, event identifier: %@. Completing training for each of %lu candidates...", (uint8_t *)&v24, 0x20u);
    }
    uint64_t v17 = [(ATXAnchorModelTrainer *)self trainModelPerCandidateSelectedInPhase1:v10 phase2Trainer:v12 phase3Trainer:v13 phase1Results:v16];
    id v21 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [v17 count];
      int v24 = 134217984;
      uint64_t v25 = v22;
      _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_DEFAULT, "Done training. Returning %lu training results.", (uint8_t *)&v24, 0xCu);
    }
  }
  return v17;
}

- (id)trainModelPerCandidateSelectedInPhase1:(id)a3 phase2Trainer:(id)a4 phase3Trainer:(id)a5 phase1Results:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = (ATXAnchorModelTrainingResult *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(ATXXPCActivity *)self->_xpcActivity didDefer])
  {
    id v14 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v10;
      _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "Deferring training of additional anchors in the middle of training anchor model for anchor %@ because XPC activity asked for deferral. Not going to process any other anchors for now.", buf, 0xCu);
    }

    id v15 = (id)objc_opt_new();
  }
  else
  {
    id v16 = objc_opt_new();
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obj = v13;
    uint64_t v43 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v43)
    {
      uint64_t v42 = *(void *)v46;
      id v37 = v12;
      id v38 = v11;
      id v36 = v13;
      v39 = v16;
LABEL_7:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v46 != v42) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v45 + 1) + 8 * v17);
        v19 = (void *)MEMORY[0x1D25F6CC0]();
        if ([(ATXXPCActivity *)self->_xpcActivity didDefer])
        {
          id v32 = __atxlog_handle_anchor();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v51 = v10;
            _os_log_impl(&dword_1D0FA3000, v32, OS_LOG_TYPE_DEFAULT, "Deferring training of additional anchors in the middle of training anchor model for anchor %@ because XPC activity asked for deferral. Not going to process any other anchors for now.", buf, 0xCu);
          }

          id v15 = (id)objc_opt_new();
          goto LABEL_41;
        }
        uint64_t v20 = [v18 candidateId];
        uint64_t v21 = [(ATXAnchorModelTrainer *)self candidateTypeFromCandidateId:v20];
        if (v21)
        {
          uint64_t v22 = v21;
          if ([(ATXXPCActivity *)self->_xpcActivity didDefer])
          {
            uint64_t v33 = __atxlog_handle_anchor();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v51 = v10;
              _os_log_impl(&dword_1D0FA3000, v33, OS_LOG_TYPE_DEFAULT, "Deferring training of additional anchors in the middle of training anchor model for anchor %@ because XPC activity asked for deferral. Not going to process any other anchors for now.", buf, 0xCu);
            }

            id v15 = (id)objc_opt_new();
            goto LABEL_40;
          }
          v44 = [v11 trainPhase2ForCandidate:v20 candidateType:v22];
          if (v44)
          {
            if ([(ATXXPCActivity *)self->_xpcActivity didDefer])
            {
              v34 = __atxlog_handle_anchor();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v51 = v10;
                _os_log_impl(&dword_1D0FA3000, v34, OS_LOG_TYPE_DEFAULT, "Deferring training of additional anchors in the middle of training anchor model for anchor %@ because XPC activity asked for deferral. Not going to process any other anchors for now.", buf, 0xCu);
              }

              id v15 = (id)objc_opt_new();
LABEL_40:

LABEL_41:

              id v13 = v36;
              id v16 = v39;
              goto LABEL_42;
            }
            uint64_t v23 = [v12 trainPhase3ForCandidate:v20];
            if (v23)
            {
              int v24 = v10;
              v40 = (void *)v23;
              uint64_t v25 = v10;
              __int16 v26 = -[ATXAnchorModelTrainingResult initWithAnchor:candidateId:candidateType:phase1TrainingResult:candidateClassifier:candidateClassifierType:offsetFromAnchorToShowPrediction:]([ATXAnchorModelTrainingResult alloc], "initWithAnchor:candidateId:candidateType:phase1TrainingResult:candidateClassifier:candidateClassifierType:offsetFromAnchorToShowPrediction:", v10, v20, v22, v18, v44, [v44 classifierType], v23);
              [v39 addObject:v26];
              int v27 = [(ATXXPCActivity *)self->_xpcActivity didDefer];
              __int16 v28 = __atxlog_handle_anchor();
              BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
              if (v27)
              {
                id v10 = v24;
                if (v29)
                {
                  *(_DWORD *)buf = 138412290;
                  v51 = v25;
                  _os_log_impl(&dword_1D0FA3000, v28, OS_LOG_TYPE_DEFAULT, "Deferring training of additional anchors in the middle of training anchor model for anchor %@ because XPC activity asked for deferral. Not going to process any other anchors for now.", buf, 0xCu);
                }

                id v15 = (id)objc_opt_new();
                id v12 = v37;
                id v11 = v38;
                goto LABEL_41;
              }
              if (v29)
              {
                *(_DWORD *)buf = 138412290;
                v51 = v26;
                _os_log_impl(&dword_1D0FA3000, v28, OS_LOG_TYPE_DEFAULT, "Added training result: %@", buf, 0xCu);
              }

              id v10 = v24;
              id v12 = v37;
              id v11 = v38;
            }
            else
            {
              v31 = __atxlog_handle_anchor();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v51 = v20;
                _os_log_error_impl(&dword_1D0FA3000, v31, OS_LOG_TYPE_ERROR, "Could not compute the offset seconds from the anchor to show the show the prediction for candidate: %@. Skipping the candidate.", buf, 0xCu);
              }
            }
          }
          else
          {
            uint64_t v30 = __atxlog_handle_anchor();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v51 = v20;
              _os_log_error_impl(&dword_1D0FA3000, v30, OS_LOG_TYPE_ERROR, "Could not train a classifier for candidate: %@. Skipping the candidate.", buf, 0xCu);
            }
          }
        }
        else
        {
          uint64_t v22 = __atxlog_handle_anchor();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v51 = v20;
            _os_log_error_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_ERROR, "Could not fetch the candidateType for candidate: %@. Skipping the candidate.", buf, 0xCu);
          }
        }

        if (v43 == ++v17)
        {
          id v13 = v36;
          id v16 = v39;
          uint64_t v43 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
          if (v43) {
            goto LABEL_7;
          }
          break;
        }
      }
    }

    id v15 = v16;
LABEL_42:
  }
  return v15;
}

- (id)candidateTypeFromCandidateId:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v4 candidateTypeForCandidateId:v3];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainingStartDate, 0);
  objc_storeStrong((id *)&self->_hyperparameters, 0);
  objc_storeStrong((id *)&self->_dataStoreWrapper, 0);
  objc_storeStrong((id *)&self->_xpcActivity, 0);
}

@end