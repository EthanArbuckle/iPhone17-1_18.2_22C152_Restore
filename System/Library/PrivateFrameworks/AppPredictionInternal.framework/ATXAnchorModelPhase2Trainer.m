@interface ATXAnchorModelPhase2Trainer
- (id)initForAnchor:(id)a3;
- (id)initForAnchor:(id)a3 anchorModelDataStoreWrapper:(id)a4;
- (id)trainClassifierForCandidateId:(id)a3 candidateType:(id)a4;
- (id)trainGamePlayKitDecisionTreeCandidateClassifierForCandidate:(id)a3 candidateType:(id)a4;
- (id)trainNaivePositiveCandidateClassifierForCandidate:(id)a3 candidateType:(id)a4;
- (id)trainPhase2ForCandidate:(id)a3 candidateType:(id)a4;
- (id)trainStrictContextMatchCandidateClassifierForCandidate:(id)a3 candidateType:(id)a4;
- (int64_t)candidateClassifierType;
@end

@implementation ATXAnchorModelPhase2Trainer

- (id)initForAnchor:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = [(ATXAnchorModelPhase2Trainer *)self initForAnchor:v4 anchorModelDataStoreWrapper:v5];

  return v6;
}

- (id)initForAnchor:(id)a3 anchorModelDataStoreWrapper:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXAnchorModelPhase2Trainer;
  v9 = [(ATXAnchorModelPhase2Trainer *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_anchor, a3);
    objc_storeStrong((id *)&v10->_storeWrapper, a4);
    uint64_t v11 = +[ATXAnchorModelHyperParameters sharedInstance];
    hyperParameters = v10->_hyperParameters;
    v10->_hyperParameters = (ATXAnchorModelHyperParameters *)v11;
  }
  return v10;
}

- (int64_t)candidateClassifierType
{
  return [(ATXAnchorModelHyperParameters *)self->_hyperParameters candidateClassifierTypeForPhase2];
}

- (id)trainPhase2ForCandidate:(id)a3 candidateType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelPhase2Trainer trainPhase2ForCandidate:candidateType:]((uint64_t)v6, v8);
  }

  v9 = [(ATXAnchorModelPhase2Trainer *)self trainClassifierForCandidateId:v6 candidateType:v7];

  v10 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelPhase2Trainer trainPhase2ForCandidate:candidateType:]((uint64_t)v6, v10);
  }

  return v9;
}

- (id)trainClassifierForCandidateId:(id)a3 candidateType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(ATXAnchorModelPhase2Trainer *)self candidateClassifierType];
  if (v8 == 3)
  {
    uint64_t v9 = [(ATXAnchorModelPhase2Trainer *)self trainGamePlayKitDecisionTreeCandidateClassifierForCandidate:v6 candidateType:v7];
  }
  else
  {
    if (v8 == 1) {
      [(ATXAnchorModelPhase2Trainer *)self trainNaivePositiveCandidateClassifierForCandidate:v6 candidateType:v7];
    }
    else {
    uint64_t v9 = [(ATXAnchorModelPhase2Trainer *)self trainStrictContextMatchCandidateClassifierForCandidate:v6 candidateType:v7];
    }
  }
  v10 = (void *)v9;

  return v10;
}

- (id)trainGamePlayKitDecisionTreeCandidateClassifierForCandidate:(id)a3 candidateType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = [[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier alloc] initWithCandidateId:v7 candidateType:v6 anchor:self->_anchor hyperParameters:self->_hyperParameters];

  [(ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *)v8 train];
  return v8;
}

- (id)trainNaivePositiveCandidateClassifierForCandidate:(id)a3 candidateType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = [[ATXNaivePositiveAnchorModelCandidateClassifier alloc] initWithCandidateId:v7 candidateType:v6 anchor:self->_anchor];

  [(ATXNaivePositiveAnchorModelCandidateClassifier *)v8 train];
  return v8;
}

- (id)trainStrictContextMatchCandidateClassifierForCandidate:(id)a3 candidateType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)[ATXStrictContextMatchAnchorModelCandidateClassifier alloc] initWithCandidateId:v7 candidateType:v6 anchor:self->_anchor];

  [(ATXNaivePositiveAnchorModelCandidateClassifier *)v8 train];
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_storeWrapper, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
}

- (void)trainPhase2ForCandidate:(uint64_t)a1 candidateType:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "Done training Phase 2 Candidate Classifier for candidate: %@", (uint8_t *)&v2, 0xCu);
}

- (void)trainPhase2ForCandidate:(uint64_t)a1 candidateType:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "Training Phase 2 Candidate Classifier for candidate: %@", (uint8_t *)&v2, 0xCu);
}

@end