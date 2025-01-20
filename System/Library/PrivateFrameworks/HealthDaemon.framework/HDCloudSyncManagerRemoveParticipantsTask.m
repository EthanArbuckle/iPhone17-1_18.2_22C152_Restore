@interface HDCloudSyncManagerRemoveParticipantsTask
- (HDCloudSyncManagerRemoveParticipantsTask)initWithManager:(id)a3 context:(id)a4 removeAllParticipants:(BOOL)a5 participantsToRemove:(id)a6 accessibilityAssertion:(id)a7 completion:(id)a8;
- (id)pipelineForRepository:(id)a3;
@end

@implementation HDCloudSyncManagerRemoveParticipantsTask

- (HDCloudSyncManagerRemoveParticipantsTask)initWithManager:(id)a3 context:(id)a4 removeAllParticipants:(BOOL)a5 participantsToRemove:(id)a6 accessibilityAssertion:(id)a7 completion:(id)a8
{
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HDCloudSyncManagerRemoveParticipantsTask;
  v15 = [(HDCloudSyncManagerPipelineTask *)&v20 initWithManager:a3 context:a4 accessibilityAssertion:a7 completion:a8];
  v16 = v15;
  if (v15)
  {
    v15->_removeAllParticipants = a5;
    uint64_t v17 = [v14 copy];
    participantsToRemove = v16->_participantsToRemove;
    v16->_participantsToRemove = (NSSet *)v17;
  }
  return v16;
}

- (id)pipelineForRepository:(id)a3
{
  id v4 = a3;
  v5 = [HDCloudSyncPipeline alloc];
  v6 = [(HDCloudSyncManagerRepositoryTask *)self context];
  v7 = [(HDCloudSyncManagerPipelineTask *)self accessibilityAssertion];
  v8 = [(HDCloudSyncManagerRepositoryTask *)self manager];
  v9 = [v8 queue];
  id v10 = [(HDCloudSyncPipeline *)v5 initForContext:v6 repository:v4 accessibilityAssertion:v7 queue:v9];

  v11 = [HDCloudSyncPipelineStageFetchAndUpdateCache alloc];
  v12 = [v10 operationConfiguration];
  v13 = [(HDCloudSyncPipelineStage *)v11 initWithConfiguration:v12 cloudState:0];
  [v10 addStage:v13];

  id v14 = [HDCloudSyncPipelineStageSynchronize alloc];
  v15 = [v10 operationConfiguration];
  v16 = [(HDCloudSyncPipelineStage *)v14 initWithConfiguration:v15 cloudState:0];
  [v10 addStage:v16];

  uint64_t v17 = [HDCloudSyncPipelineStageRemoveSharingParticipants alloc];
  v18 = [v10 operationConfiguration];
  v19 = [(HDCloudSyncPipelineStage *)v17 initWithConfiguration:v18 cloudState:0];

  if (self->_removeAllParticipants) {
    [(HDCloudSyncPipelineStageRemoveSharingParticipants *)v19 setRemoveAllParticipants:1];
  }
  else {
    [(HDCloudSyncPipelineStageRemoveSharingParticipants *)v19 setParticipantsToRemove:self->_participantsToRemove];
  }
  [v10 addStage:v19];

  return v10;
}

- (void).cxx_destruct
{
}

@end