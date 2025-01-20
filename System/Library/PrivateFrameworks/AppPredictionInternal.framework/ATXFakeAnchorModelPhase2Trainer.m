@interface ATXFakeAnchorModelPhase2Trainer
- (ATXFakeAnchorModelPhase2Trainer)init;
- (id)candidateIdsForPhase2Training;
- (id)trainPhase2ForCandidate:(id)a3 candidateType:(id)a4;
- (int64_t)candidateClassifierType;
@end

@implementation ATXFakeAnchorModelPhase2Trainer

- (ATXFakeAnchorModelPhase2Trainer)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXFakeAnchorModelPhase2Trainer;
  v2 = [(ATXFakeAnchorModelPhase2Trainer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    candidateIdsForPhase2Training = v2->_candidateIdsForPhase2Training;
    v2->_candidateIdsForPhase2Training = (NSMutableArray *)v3;
  }
  return v2;
}

- (int64_t)candidateClassifierType
{
  return 1;
}

- (id)trainPhase2ForCandidate:(id)a3 candidateType:(id)a4
{
  candidateIdsForPhase2Training = self->_candidateIdsForPhase2Training;
  id v5 = a3;
  [(NSMutableArray *)candidateIdsForPhase2Training addObject:v5];
  objc_super v6 = [ATXNaivePositiveAnchorModelCandidateClassifier alloc];
  v7 = objc_opt_new();
  v8 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)v6 initWithCandidateId:v5 candidateType:@"action" anchor:v7];

  [(ATXNaivePositiveAnchorModelCandidateClassifier *)v8 train];
  return v8;
}

- (id)candidateIdsForPhase2Training
{
  return self->_candidateIdsForPhase2Training;
}

- (void).cxx_destruct
{
}

@end