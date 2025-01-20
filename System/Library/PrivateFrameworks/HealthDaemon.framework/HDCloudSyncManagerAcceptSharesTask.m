@interface HDCloudSyncManagerAcceptSharesTask
- (BOOL)requiresExistingShareOwnerParticipant;
- (HDCloudSyncManagerAcceptSharesTask)initWithManager:(id)a3 context:(id)a4 shareSetupMetadata:(id)a5 accessibilityAssertion:(id)a6 completion:(id)a7;
- (NSArray)acceptedShares;
- (id)pipelineForRepository:(id)a3;
@end

@implementation HDCloudSyncManagerAcceptSharesTask

- (HDCloudSyncManagerAcceptSharesTask)initWithManager:(id)a3 context:(id)a4 shareSetupMetadata:(id)a5 accessibilityAssertion:(id)a6 completion:(id)a7
{
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HDCloudSyncManagerAcceptSharesTask;
  v14 = [(HDCloudSyncManagerPipelineTask *)&v17 initWithManager:a3 context:a4 accessibilityAssertion:a6 completion:a7];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_shareSetupMetadata, a5);
  }

  return v15;
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

  v11 = [v10 operationGroup];
  v12 = [v11 defaultConfiguration];
  [v12 setQualityOfService:17];

  id v13 = [HDCloudSyncAcceptSharesOperation alloc];
  v14 = [v10 operationConfiguration];
  v15 = [(HDCloudSyncShareSetupMetadata *)self->_shareSetupMetadata shareURLs];
  v16 = [(HDCloudSyncShareSetupMetadata *)self->_shareSetupMetadata invitationTokensByShareURL];
  objc_super v17 = [(HDCloudSyncAcceptSharesOperation *)v13 initWithConfiguration:v14 cloudState:0 shareURLs:v15 invitationTokensByShareURL:v16];
  acceptSharesOperation = self->_acceptSharesOperation;
  self->_acceptSharesOperation = v17;

  v19 = [(HDCloudSyncOperation *)self->_acceptSharesOperation asPipelineStage];
  [v10 addStage:v19];

  return v10;
}

- (BOOL)requiresExistingShareOwnerParticipant
{
  return 0;
}

- (NSArray)acceptedShares
{
  return [(HDCloudSyncAcceptSharesOperation *)self->_acceptSharesOperation acceptedShares];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptSharesOperation, 0);

  objc_storeStrong((id *)&self->_shareSetupMetadata, 0);
}

@end