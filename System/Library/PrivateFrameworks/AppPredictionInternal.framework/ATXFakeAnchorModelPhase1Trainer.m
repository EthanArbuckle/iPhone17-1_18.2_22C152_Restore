@interface ATXFakeAnchorModelPhase1Trainer
- (ATXFakeAnchorModelPhase1Trainer)init;
- (BOOL)phase1TrainerCalled;
- (id)trainPhase1;
@end

@implementation ATXFakeAnchorModelPhase1Trainer

- (ATXFakeAnchorModelPhase1Trainer)init
{
  v3.receiver = self;
  v3.super_class = (Class)ATXFakeAnchorModelPhase1Trainer;
  result = [(ATXFakeAnchorModelPhase1Trainer *)&v3 init];
  if (result) {
    result->_phase1TrainerCalled = 0;
  }
  return result;
}

- (id)trainPhase1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_phase1TrainerCalled = 1;
  v2 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [&unk_1F27F3690 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(&unk_1F27F3690);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        v8 = objc_opt_new();
        [v8 setCandidateId:v7];
        [v2 addObject:v8];
      }
      uint64_t v4 = [&unk_1F27F3690 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  return v2;
}

- (BOOL)phase1TrainerCalled
{
  return self->_phase1TrainerCalled;
}

@end