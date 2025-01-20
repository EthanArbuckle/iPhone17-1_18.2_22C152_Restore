@interface ATXFakeAnchorModelPhase3Trainer
- (ATXFakeAnchorModelPhase3Trainer)init;
- (id)candidateIdsForPhase3Training;
- (id)trainPhase3ForCandidate:(id)a3;
@end

@implementation ATXFakeAnchorModelPhase3Trainer

- (ATXFakeAnchorModelPhase3Trainer)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXFakeAnchorModelPhase3Trainer;
  v2 = [(ATXFakeAnchorModelPhase3Trainer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    candidateIdsForPhase3Training = v2->_candidateIdsForPhase3Training;
    v2->_candidateIdsForPhase3Training = (NSMutableArray *)v3;
  }
  return v2;
}

- (id)trainPhase3ForCandidate:(id)a3
{
  [(NSMutableArray *)self->_candidateIdsForPhase3Training addObject:a3];
  uint64_t v3 = [[ATXAnchorModelPredictionOffsetFromAnchorOccurrence alloc] initWithStartSecondsAfterAnchor:-1.0 endSecondsAfterAnchor:-1.0];
  return v3;
}

- (id)candidateIdsForPhase3Training
{
  return self->_candidateIdsForPhase3Training;
}

- (void).cxx_destruct
{
}

@end