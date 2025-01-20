@interface HDCloudSyncPipelineStageSharedSummaryUpdateParticipant
- (HDCloudSyncPipelineStageSharedSummaryUpdateParticipant)initWithSummarySharingEntry:(id)a3 configuration:(id)a4;
- (HDCloudSyncPipelineStageSharedSummaryUpdateParticipant)initWithSummarySharingEntry:(id)a3 configuration:(id)a4 authorizationIdentifiersToAdd:(id)a5 authorizationIdentifiersToDelete:(id)a6;
- (void)main;
@end

@implementation HDCloudSyncPipelineStageSharedSummaryUpdateParticipant

- (HDCloudSyncPipelineStageSharedSummaryUpdateParticipant)initWithSummarySharingEntry:(id)a3 configuration:(id)a4
{
  return [(HDCloudSyncPipelineStageSharedSummaryUpdateParticipant *)self initWithSummarySharingEntry:a3 configuration:a4 authorizationIdentifiersToAdd:MEMORY[0x1E4F1CBF0] authorizationIdentifiersToDelete:MEMORY[0x1E4F1CBF0]];
}

- (HDCloudSyncPipelineStageSharedSummaryUpdateParticipant)initWithSummarySharingEntry:(id)a3 configuration:(id)a4 authorizationIdentifiersToAdd:(id)a5 authorizationIdentifiersToDelete:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HDCloudSyncPipelineStageSharedSummaryUpdateParticipant;
  v13 = [(HDCloudSyncPipelineStage *)&v21 initWithConfiguration:a4 cloudState:0];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    codableEntry = v13->_codableEntry;
    v13->_codableEntry = (HDCodableSummarySharingEntry *)v14;

    uint64_t v16 = [v11 copy];
    authorizationIdentifiersToAdd = v13->_authorizationIdentifiersToAdd;
    v13->_authorizationIdentifiersToAdd = (NSArray *)v16;

    uint64_t v18 = [v12 copy];
    authorizationIdentifiersToDelete = v13->_authorizationIdentifiersToDelete;
    v13->_authorizationIdentifiersToDelete = (NSArray *)v18;
  }
  return v13;
}

- (void)main
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v3 = [HDCloudSyncCompoundOperation alloc];
  v4 = [(HDCloudSyncOperation *)self configuration];
  v5 = [(HDCloudSyncOperation *)self cloudState];
  v6 = [(HDCloudSyncCompoundOperation *)v3 initWithConfiguration:v4 cloudState:v5 name:@"Update Participant" continueOnSubOperationError:0];

  id v7 = objc_alloc(MEMORY[0x1E4F1A310]);
  v8 = (void *)MEMORY[0x1E4F1A320];
  v9 = [(HDCloudSyncOperation *)self configuration];
  id v10 = [v9 repository];
  id v11 = [v10 syncCircleIdentifier];
  id v12 = objc_msgSend(v8, "hd_unifiedSyncZoneIDForSyncCircleIdentifier:", v11);
  v13 = (void *)[v7 initWithZoneID:v12];

  uint64_t v14 = [HDCloudSyncCreateZonesOperation alloc];
  v15 = [(HDCloudSyncOperation *)self configuration];
  uint64_t v16 = [(HDCloudSyncOperation *)self cloudState];
  v25[0] = v13;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  uint64_t v18 = [(HDCloudSyncOperation *)self configuration];
  v19 = [v18 repository];
  v20 = [v19 primaryCKContainer];
  objc_super v21 = [(HDCloudSyncCreateZonesOperation *)v14 initWithConfiguration:v15 cloudState:v16 zones:v17 container:v20];

  [(HDCloudSyncCompoundOperation *)v6 addOperation:v21 transitionHandler:0];
  v22 = [HDCloudSyncSharedSummaryUpdateParticipantOperation alloc];
  v23 = [(HDCloudSyncOperation *)self configuration];
  v24 = [(HDCloudSyncSharedSummaryUpdateParticipantOperation *)v22 initWithConfiguration:v23 codableEntry:self->_codableEntry authorizationIdentifiersToAdd:self->_authorizationIdentifiersToAdd authorizationIdentifiersToDelete:self->_authorizationIdentifiersToDelete];

  [(HDCloudSyncCompoundOperation *)v6 addOperation:v24 transitionHandler:0];
  [(HDCloudSyncOperation *)self delegateToOperation:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationIdentifiersToDelete, 0);
  objc_storeStrong((id *)&self->_authorizationIdentifiersToAdd, 0);

  objc_storeStrong((id *)&self->_codableEntry, 0);
}

@end