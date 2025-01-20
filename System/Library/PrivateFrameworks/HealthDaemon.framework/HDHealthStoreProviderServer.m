@interface HDHealthStoreProviderServer
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)_profileManager;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_clientMayAccessProfile:(void *)result;
- (void)remote_fetchAvailableIdentifiersWithCompletion:(id)a3;
- (void)remote_fetchForIdentifier:(id)a3 completion:(id)a4;
- (void)remote_requestAuthorizationToNewIdentifierToShareTypes:(id)a3 readTypes:(id)a4 completion:(id)a5;
- (void)remote_requestAuthorizationToNewIdentifierWithCompletion:(id)a3;
@end

@implementation HDHealthStoreProviderServer

- (id)_profileManager
{
  if (a1)
  {
    v1 = [a1 profile];
    v2 = [v1 daemon];
    v3 = [v2 profileManager];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_clientMayAccessProfile:(void *)result
{
  if (result)
  {
    v2 = result;
    id v3 = a2;
    v4 = [v2 client];
    uint64_t v5 = [v4 _isAuthorizedToAccessProfile:v3];

    return (void *)v5;
  }
  return result;
}

- (void)remote_fetchForIdentifier:(id)a3 completion:(id)a4
{
  id v11 = a3;
  v6 = (void (**)(id, uint64_t, void))a4;
  if ([v11 isPrimaryStoreIdentifier])
  {
    v6[2](v6, 1, 0);
  }
  else
  {
    v7 = -[HDHealthStoreProviderServer _profileManager](self);
    v8 = [v11 profileIdentifier];
    v9 = [v7 profileForIdentifier:v8];

    if (v9 && (-[HDHealthStoreProviderServer _clientMayAccessProfile:](self, v9) & 1) != 0)
    {
      v6[2](v6, 1, 0);
    }
    else
    {
      v10 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_healthStoreUnavailableError");
      ((void (**)(id, uint64_t, void *))v6)[2](v6, 0, v10);
    }
  }
}

- (void)remote_fetchAvailableIdentifiersWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  uint64_t v5 = -[HDHealthStoreProviderServer _profileManager](self);
  v6 = [v5 allProfileIdentifiers];

  v7 = [(HDStandardTaskServer *)self client];
  int v8 = [v7 hasEntitlement:*MEMORY[0x1E4F2A548]];

  if (v8)
  {
    id v9 = v6;
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __78__HDHealthStoreProviderServer_remote_fetchAvailableIdentifiersWithCompletion___block_invoke;
    v12[3] = &unk_1E62F5910;
    v12[4] = self;
    objc_msgSend(v6, "hk_filter:", v12);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  id v11 = objc_msgSend(v9, "hk_map:", &__block_literal_global_22);
  v4[2](v4, v11, 0);
}

void *__78__HDHealthStoreProviderServer_remote_fetchAvailableIdentifiersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = -[HDHealthStoreProviderServer _profileManager](v3);
  v6 = [v5 profileForIdentifier:v4];

  if (v6) {
    v7 = -[HDHealthStoreProviderServer _clientMayAccessProfile:](*(void **)(a1 + 32), v6);
  }
  else {
    v7 = 0;
  }

  return v7;
}

uint64_t __78__HDHealthStoreProviderServer_remote_fetchAvailableIdentifiersWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F2B0C8] identifierFromProfileIdentifier:a2];
}

- (void)remote_requestAuthorizationToNewIdentifierWithCompletion:(id)a3
{
  id v4 = a3;
  unimplementedError();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a3 + 2))(v4, 0, v5);
}

- (void)remote_requestAuthorizationToNewIdentifierToShareTypes:(id)a3 readTypes:(id)a4 completion:(id)a5
{
  id v6 = a5;
  unimplementedError();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a5 + 2))(v6, 0, v7);
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F40E7A08](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F40E7D28](self, a2);
}

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F2B0D0] taskIdentifier];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F29E48];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

@end