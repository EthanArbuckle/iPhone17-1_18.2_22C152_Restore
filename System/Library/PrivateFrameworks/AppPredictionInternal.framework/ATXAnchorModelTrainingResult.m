@interface ATXAnchorModelTrainingResult
- (ATXAnchor)anchor;
- (ATXAnchorModelCandidateClassifierProtocol)candidateClassifier;
- (ATXAnchorModelPhase1TrainingResult)phase1TrainingResult;
- (ATXAnchorModelPredictionOffsetFromAnchorOccurrence)offsetFromAnchorToShowPrediction;
- (ATXAnchorModelTrainingResult)initWithAnchor:(id)a3 candidateId:(id)a4 candidateType:(id)a5 phase1TrainingResult:(id)a6 candidateClassifier:(id)a7 candidateClassifierType:(int64_t)a8 offsetFromAnchorToShowPrediction:(id)a9;
- (NSString)candidateId;
- (NSString)candidateType;
- (id)description;
- (int64_t)candidateClassifierType;
@end

@implementation ATXAnchorModelTrainingResult

- (ATXAnchorModelTrainingResult)initWithAnchor:(id)a3 candidateId:(id)a4 candidateType:(id)a5 phase1TrainingResult:(id)a6 candidateClassifier:(id)a7 candidateClassifierType:(int64_t)a8 offsetFromAnchorToShowPrediction:(id)a9
{
  id v28 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  v29.receiver = self;
  v29.super_class = (Class)ATXAnchorModelTrainingResult;
  v20 = [(ATXAnchorModelTrainingResult *)&v29 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_anchor, a3);
    uint64_t v22 = [v15 copy];
    candidateId = v21->_candidateId;
    v21->_candidateId = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    candidateType = v21->_candidateType;
    v21->_candidateType = (NSString *)v24;

    objc_storeStrong((id *)&v21->_phase1TrainingResult, a6);
    objc_storeStrong((id *)&v21->_candidateClassifier, a7);
    v21->_candidateClassifierType = a8;
    objc_storeStrong((id *)&v21->_offsetFromAnchorToShowPrediction, a9);
  }

  return v21;
}

- (id)description
{
  id v3 = [NSString alloc];
  anchor = self->_anchor;
  v5 = [(ATXAnchor *)anchor anchorEventIdentifier];
  v6 = (void *)[v3 initWithFormat:@"Anchor: %@, Anchor Event Identifier: %@, Candidate: %@, Candidate type: %@, Phase 1 training result: %@, Candidate classifier: %@, Candidate Classifier Type: %ld, Offset from anchor: %@", anchor, v5, self->_candidateId, self->_candidateType, self->_phase1TrainingResult, self->_candidateClassifier, self->_candidateClassifierType, self->_offsetFromAnchorToShowPrediction];

  return v6;
}

- (ATXAnchor)anchor
{
  return self->_anchor;
}

- (NSString)candidateId
{
  return self->_candidateId;
}

- (NSString)candidateType
{
  return self->_candidateType;
}

- (ATXAnchorModelPhase1TrainingResult)phase1TrainingResult
{
  return self->_phase1TrainingResult;
}

- (ATXAnchorModelCandidateClassifierProtocol)candidateClassifier
{
  return self->_candidateClassifier;
}

- (int64_t)candidateClassifierType
{
  return self->_candidateClassifierType;
}

- (ATXAnchorModelPredictionOffsetFromAnchorOccurrence)offsetFromAnchorToShowPrediction
{
  return self->_offsetFromAnchorToShowPrediction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offsetFromAnchorToShowPrediction, 0);
  objc_storeStrong((id *)&self->_candidateClassifier, 0);
  objc_storeStrong((id *)&self->_phase1TrainingResult, 0);
  objc_storeStrong((id *)&self->_candidateType, 0);
  objc_storeStrong((id *)&self->_candidateId, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
}

@end