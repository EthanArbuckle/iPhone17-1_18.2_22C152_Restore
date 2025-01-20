@interface HDSharingAuthorizationRecipientStoreServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (HDSharingAuthorizationRecipientStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_fetchRecipientIdentifiersWithCompletion:(id)a3;
- (void)remote_registerObservers;
- (void)remote_unregisterObservers;
- (void)sharingAuthorizationManager:(id)a3 didAddSharingAuthorizations:(id)a4 recipientIdentifier:(id)a5;
- (void)sharingAuthorizationManager:(id)a3 didRemoveSharingAuthorizations:(id)a4 recipientIdentifier:(id)a5;
- (void)sharingAuthorizationManager:(id)a3 didRevokeRecipientWithIdentifier:(id)a4;
@end

@implementation HDSharingAuthorizationRecipientStoreServer

- (HDSharingAuthorizationRecipientStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDSharingAuthorizationRecipientStoreServer;
  v11 = [(HDStandardTaskServer *)&v15 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    configuration = v11->_configuration;
    v11->_configuration = (HKSharingAuthorizationRecipientStoreTaskConfiguration *)v12;
  }
  return v11;
}

- (void)remote_fetchRecipientIdentifiersWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, id))a3;
  v5 = [(HDStandardTaskServer *)self profile];
  v6 = [v5 sharingAuthorizationManager];
  v7 = [(HKSharingAuthorizationRecipientStoreTaskConfiguration *)self->_configuration sharingAuthorizations];
  id v10 = 0;
  v8 = [v6 recipientIdentifiersForSharingAuthorizations:v7 error:&v10];
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
  id v7 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __122__HDSharingAuthorizationRecipientStoreServer_sharingAuthorizationManager_didAddSharingAuthorizations_recipientIdentifier___block_invoke;
  v12[3] = &unk_1E62F3170;
  v12[4] = self;
  id v8 = a4;
  id v9 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __122__HDSharingAuthorizationRecipientStoreServer_sharingAuthorizationManager_didAddSharingAuthorizations_recipientIdentifier___block_invoke_278;
  v11[3] = &unk_1E62F3448;
  v11[4] = self;
  id v10 = objc_msgSend(v8, "hk_filter:", v11);

  if ([v10 count]) {
    objc_msgSend(v9, "clientRemote_didAddRecipientIdentifier:sharingAuthorizations:", v7, v10);
  }
}

void __122__HDSharingAuthorizationRecipientStoreServer_sharingAuthorizationManager_didAddSharingAuthorizations_recipientIdentifier___block_invoke(uint64_t a1, void *a2)
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

uint64_t __122__HDSharingAuthorizationRecipientStoreServer_sharingAuthorizationManager_didAddSharingAuthorizations_recipientIdentifier___block_invoke_278(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  id v3 = a2;
  id v4 = [v2 sharingAuthorizations];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

- (void)sharingAuthorizationManager:(id)a3 didRemoveSharingAuthorizations:(id)a4 recipientIdentifier:(id)a5
{
  id v7 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __125__HDSharingAuthorizationRecipientStoreServer_sharingAuthorizationManager_didRemoveSharingAuthorizations_recipientIdentifier___block_invoke;
  v12[3] = &unk_1E62F3170;
  v12[4] = self;
  id v8 = a4;
  id v9 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __125__HDSharingAuthorizationRecipientStoreServer_sharingAuthorizationManager_didRemoveSharingAuthorizations_recipientIdentifier___block_invoke_280;
  v11[3] = &unk_1E62F3448;
  v11[4] = self;
  uint64_t v10 = objc_msgSend(v8, "hk_filter:", v11);

  if ([v10 count]) {
    objc_msgSend(v9, "clientRemote_didRemoveRecipientIdentifier:sharingAuthorizations:", v7, v10);
  }
}

void __125__HDSharingAuthorizationRecipientStoreServer_sharingAuthorizationManager_didRemoveSharingAuthorizations_recipientIdentifier___block_invoke(uint64_t a1, void *a2)
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

uint64_t __125__HDSharingAuthorizationRecipientStoreServer_sharingAuthorizationManager_didRemoveSharingAuthorizations_recipientIdentifier___block_invoke_280(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  id v3 = a2;
  id v4 = [v2 sharingAuthorizations];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

- (void)sharingAuthorizationManager:(id)a3 didRevokeRecipientWithIdentifier:(id)a4
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __107__HDSharingAuthorizationRecipientStoreServer_sharingAuthorizationManager_didRevokeRecipientWithIdentifier___block_invoke;
  v7[3] = &unk_1E62F3170;
  v7[4] = self;
  id v5 = a4;
  int v6 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v7];
  objc_msgSend(v6, "clientRemote_didRevokeRecipientIdentifier:", v5);
}

void __107__HDSharingAuthorizationRecipientStoreServer_sharingAuthorizationManager_didRevokeRecipientWithIdentifier___block_invoke(uint64_t a1, void *a2)
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

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F2A9E0];
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
  int v6 = [a3 sharingAuthorizations];
  uint64_t v7 = [v6 count];

  if (!v7) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"Missing authorization identifiers");
  }
  return v7 != 0;
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2B4E0] serverInterface];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2B4E0] clientInterface];
}

- (void).cxx_destruct
{
}

@end