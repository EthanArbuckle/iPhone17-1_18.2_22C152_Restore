@interface HDCloudSyncPipelineStageLookupParticipant
- (CKShareParticipant)participant;
- (HDCloudSyncPipelineStageLookupParticipant)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncPipelineStageLookupParticipant)initWithConfiguration:(id)a3 cloudState:(id)a4 identityLookupInfo:(id)a5;
- (void)main;
@end

@implementation HDCloudSyncPipelineStageLookupParticipant

- (HDCloudSyncPipelineStageLookupParticipant)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncPipelineStageLookupParticipant)initWithConfiguration:(id)a3 cloudState:(id)a4 identityLookupInfo:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncPipelineStageLookupParticipant;
  v10 = [(HDCloudSyncPipelineStage *)&v13 initWithConfiguration:a3 cloudState:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_identityLookupInfo, a5);
  }

  return v11;
}

- (void)main
{
  v3 = [HDCloudSyncLookupParticipantOperation alloc];
  v4 = [(HDCloudSyncOperation *)self configuration];
  v5 = [(HDCloudSyncOperation *)self cloudState];
  uint64_t v6 = [(HDCloudSyncLookupParticipantOperation *)v3 initWithConfiguration:v4 cloudState:v5 identityLookupInfo:self->_identityLookupInfo];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__HDCloudSyncPipelineStageLookupParticipant_main__block_invoke;
  v11[3] = &unk_1E630C2D8;
  v11[4] = self;
  [(HDCloudSyncOperation *)v6 setOnSuccess:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__HDCloudSyncPipelineStageLookupParticipant_main__block_invoke_2;
  v10[3] = &unk_1E62F2950;
  v10[4] = self;
  [(HDCloudSyncOperation *)v6 setOnError:v10];
  v7 = [(HDCloudSyncOperation *)self progress];
  v8 = [(HDCloudSyncOperation *)v6 progress];
  id v9 = [(HDCloudSyncOperation *)self progress];
  objc_msgSend(v7, "addChild:withPendingUnitCount:", v8, objc_msgSend(v9, "totalUnitCount"));

  [(HDCloudSyncOperation *)v6 start];
}

uint64_t __49__HDCloudSyncPipelineStageLookupParticipant_main__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 participant];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v4;

  v7 = [v3 cloudState];

  [*(id *)(a1 + 32) setCloudState:v7];
  v8 = *(void **)(a1 + 32);

  return [v8 finishWithSuccess:1 error:0];
}

void __49__HDCloudSyncPipelineStageLookupParticipant_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  uint64_t v5 = [a2 cloudState];
  [*(id *)(a1 + 32) setCloudState:v5];

  [*(id *)(a1 + 32) finishWithSuccess:0 error:v6];
}

- (CKShareParticipant)participant
{
  return (CKShareParticipant *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityLookupInfo, 0);

  objc_storeStrong((id *)&self->_participant, 0);
}

@end