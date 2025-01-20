@interface HDSharingRecipientAuthorizationStoreServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (HDSharingRecipientAuthorizationStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_addSharingAuthorizations:(id)a3 completion:(id)a4;
- (void)remote_fetchSharingAuthorizationsMarkedForDeletionWithCompletion:(id)a3;
- (void)remote_fetchSharingAuthorizationsWithCompletion:(id)a3;
- (void)remote_registerObservers;
- (void)remote_removeSharingAuthorizations:(id)a3 completion:(id)a4;
- (void)remote_revokeWithCompletion:(id)a3;
- (void)remote_unregisterObservers;
- (void)sharingAuthorizationManager:(id)a3 didAddSharingAuthorizations:(id)a4 recipientIdentifier:(id)a5;
- (void)sharingAuthorizationManager:(id)a3 didRemoveSharingAuthorizations:(id)a4 recipientIdentifier:(id)a5;
- (void)sharingAuthorizationManager:(id)a3 didRevokeRecipientWithIdentifier:(id)a4;
@end

@implementation HDSharingRecipientAuthorizationStoreServer

- (HDSharingRecipientAuthorizationStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDSharingRecipientAuthorizationStoreServer;
  v11 = [(HDStandardTaskServer *)&v15 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    configuration = v11->_configuration;
    v11->_configuration = (HKSharingRecipientAuthorizationStoreTaskConfiguration *)v12;
  }
  return v11;
}

- (void)remote_fetchSharingAuthorizationsWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, id))a3;
  v5 = [(HDStandardTaskServer *)self profile];
  v6 = [v5 sharingAuthorizationManager];
  v7 = [(HKSharingRecipientAuthorizationStoreTaskConfiguration *)self->_configuration recipientIdentifier];
  id v10 = 0;
  v8 = [v6 sharingAuthorizationsForRecipientIdentifier:v7 error:&v10];
  id v9 = v10;

  v4[2](v4, v8, v9);
}

- (void)remote_fetchSharingAuthorizationsMarkedForDeletionWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, id))a3;
  v5 = [(HDStandardTaskServer *)self profile];
  v6 = [v5 sharingAuthorizationManager];
  v7 = [(HKSharingRecipientAuthorizationStoreTaskConfiguration *)self->_configuration recipientIdentifier];
  id v10 = 0;
  v8 = [v6 sharingAuthorizationsMarkedForDeletionForRecipientIdentifier:v7 error:&v10];
  id v9 = v10;

  v4[2](v4, v8, v9);
}

- (void)remote_addSharingAuthorizations:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, uint64_t, id))a4;
  id v7 = a3;
  v8 = [(HDStandardTaskServer *)self profile];
  id v9 = [v8 sharingAuthorizationManager];
  id v10 = [(HKSharingRecipientAuthorizationStoreTaskConfiguration *)self->_configuration recipientIdentifier];
  id v13 = 0;
  uint64_t v11 = [v9 addSharingAuthorizations:v7 recipientIdentifier:v10 error:&v13];

  id v12 = v13;
  v6[2](v6, v11, v12);
}

- (void)remote_removeSharingAuthorizations:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, uint64_t, id))a4;
  id v7 = a3;
  v8 = [(HDStandardTaskServer *)self profile];
  id v9 = [v8 sharingAuthorizationManager];
  id v10 = [(HKSharingRecipientAuthorizationStoreTaskConfiguration *)self->_configuration recipientIdentifier];
  id v13 = 0;
  uint64_t v11 = [v9 removeSharingAuthorizations:v7 recipientIdentifier:v10 error:&v13];

  id v12 = v13;
  v6[2](v6, v11, v12);
}

- (void)remote_revokeWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, id))a3;
  v5 = [(HDStandardTaskServer *)self profile];
  v6 = [v5 sharingAuthorizationManager];
  id v7 = [(HKSharingRecipientAuthorizationStoreTaskConfiguration *)self->_configuration recipientIdentifier];
  id v10 = 0;
  uint64_t v8 = [v6 revokeRecipientWithIdentifier:v7 error:&v10];
  id v9 = v10;

  v4[2](v4, v8, v9);
}

- (void)remote_registerObservers
{
  id v4 = [(HDStandardTaskServer *)self profile];
  v3 = [v4 sharingAuthorizationManager];
  [v3 registerObserver:self];
}

- (void)remote_unregisterObservers
{
  id v4 = [(HDStandardTaskServer *)self profile];
  v3 = [v4 sharingAuthorizationManager];
  [v3 unregisterObserver:self];
}

- (void)sharingAuthorizationManager:(id)a3 didAddSharingAuthorizations:(id)a4 recipientIdentifier:(id)a5
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __122__HDSharingRecipientAuthorizationStoreServer_sharingAuthorizationManager_didAddSharingAuthorizations_recipientIdentifier___block_invoke;
  v8[3] = &unk_1E62F3170;
  v8[4] = self;
  id v6 = a4;
  id v7 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v8];
  objc_msgSend(v7, "clientRemote_didAddSharingAuthorizations:", v6);
}

void __122__HDSharingRecipientAuthorizationStoreServer_sharingAuthorizationManager_didAddSharingAuthorizations_recipientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to notify client of added authorizations: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)sharingAuthorizationManager:(id)a3 didRemoveSharingAuthorizations:(id)a4 recipientIdentifier:(id)a5
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __125__HDSharingRecipientAuthorizationStoreServer_sharingAuthorizationManager_didRemoveSharingAuthorizations_recipientIdentifier___block_invoke;
  v8[3] = &unk_1E62F3170;
  v8[4] = self;
  id v6 = a4;
  uint64_t v7 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v8];
  objc_msgSend(v7, "clientRemote_didRemoveSharingAuthorizations:", v6);
}

void __125__HDSharingRecipientAuthorizationStoreServer_sharingAuthorizationManager_didRemoveSharingAuthorizations_recipientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to notify client of removed authorizations: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)sharingAuthorizationManager:(id)a3 didRevokeRecipientWithIdentifier:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  _HKInitializeLogging();
  int v6 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v10 = self;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Revoking Recipient with Identifier: %{public}@", buf, 0x16u);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __107__HDSharingRecipientAuthorizationStoreServer_sharingAuthorizationManager_didRevokeRecipientWithIdentifier___block_invoke;
  v8[3] = &unk_1E62F3170;
  v8[4] = self;
  uint64_t v7 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v8];
  objc_msgSend(v7, "clientRemote_wasRevoked");
}

void __107__HDSharingRecipientAuthorizationStoreServer_sharingAuthorizationManager_didRevokeRecipientWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to notify client of revoked authorizations: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F2A9E8];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  int v6 = [a3 recipientIdentifier];

  if (!v6) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"Missing recipient identifier");
  }
  return v6 != 0;
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2B4F0] serverInterface];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2B4F0] clientInterface];
}

- (void).cxx_destruct
{
}

@end