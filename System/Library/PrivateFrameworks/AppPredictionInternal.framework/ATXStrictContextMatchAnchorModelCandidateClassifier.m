@interface ATXStrictContextMatchAnchorModelCandidateClassifier
- (BOOL)isEqual:(id)a3;
- (id)classifyCandidateForAnchorOccurrence:(id)a3 trainingResult:(id)a4;
- (id)description;
- (int64_t)classifierType;
@end

@implementation ATXStrictContextMatchAnchorModelCandidateClassifier

- (id)classifyCandidateForAnchorOccurrence:(id)a3 trainingResult:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self candidateId];
    int v21 = 138412546;
    v22 = v8;
    __int16 v23 = 2112;
    uint64_t v24 = (uint64_t)v9;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "%@ making a prediction for candidate: %@", (uint8_t *)&v21, 0x16u);
  }
  v10 = objc_opt_new();
  v11 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self anchor];
  v12 = [v10 featurizeAnchorEvent:v5 anchor:v11];

  v13 = objc_opt_new();
  v14 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self candidateId];
  v15 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self anchor];
  uint64_t v16 = [v13 numCandidateIdOccurrencesInJointAnchorContext:v14 anchor:v15 anchorMetadata:v12];

  v17 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self candidateId];
    int v21 = 138412546;
    v22 = v18;
    __int16 v23 = 2048;
    uint64_t v24 = v16;
    _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_INFO, "Candidate %@ has %ld occurrences in the joint context of the anchor.", (uint8_t *)&v21, 0x16u);
  }
  v19 = [[ATXAnchorModelClassificationResult alloc] initWithShouldPredictCandidate:v16 > 0 score:(double)v16];

  return v19;
}

- (int64_t)classifierType
{
  return 2;
}

- (id)description
{
  return @"Strict Anchor Model candidate classifier. YES if candidate has been performed at the hour, DoW, and LOI of the anchor occurrence, and the candidate has occurred in the last 7 days.";
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXStrictContextMatchAnchorModelCandidateClassifier *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self candidateId];
      v7 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)v5 candidateId];
      int v8 = [v6 isEqualToString:v7];

      if (v8)
      {
        v9 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self anchor];
        v10 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)v5 anchor];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

@end