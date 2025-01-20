@interface HDCloudSyncPipelineStageSharedSummaryRevokeParticipant
- (HDCloudSyncPipelineStageSharedSummaryRevokeParticipant)initWithOutgoingSummarySharingEntry:(id)a3 configuration:(id)a4;
- (void)main;
@end

@implementation HDCloudSyncPipelineStageSharedSummaryRevokeParticipant

- (HDCloudSyncPipelineStageSharedSummaryRevokeParticipant)initWithOutgoingSummarySharingEntry:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDCloudSyncPipelineStageSharedSummaryRevokeParticipant;
  v7 = [(HDCloudSyncPipelineStage *)&v11 initWithConfiguration:a4 cloudState:0];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    codableEntry = v7->_codableEntry;
    v7->_codableEntry = (HDCodableSummarySharingEntry *)v8;
  }
  return v7;
}

- (void)main
{
  v3 = [HDCloudSyncSharedSummaryRevokeParticipantOperation alloc];
  v4 = [(HDCloudSyncOperation *)self configuration];
  v5 = [(HDCloudSyncSharedSummaryRevokeParticipantOperation *)v3 initWithConfiguration:v4 codableEntry:self->_codableEntry];

  [(HDCloudSyncOperation *)self delegateToOperation:v5];
}

- (void).cxx_destruct
{
}

@end