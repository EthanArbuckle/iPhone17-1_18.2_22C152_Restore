@interface HDAuthorizationStoreWriteServer
+ (BOOL)validateClient:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_setAuthorizationStatuses:(id)a3 authorizationModes:(id)a4 forBundleIdentifier:(id)a5 options:(unint64_t)a6 completion:(id)a7;
- (void)remote_setObjectAuthorizationStatuses:(id)a3 objectType:(id)a4 bundleIdentifier:(id)a5 sessionIdentifier:(id)a6 completion:(id)a7;
- (void)remote_setRequestedAuthorizationForBundleIdentifier:(id)a3 shareTypes:(id)a4 readTypes:(id)a5 completion:(id)a6;
@end

@implementation HDAuthorizationStoreWriteServer

+ (BOOL)validateClient:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x1E4F29748];
  if ([v5 hasRequiredEntitlement:*MEMORY[0x1E4F29748] error:a4])
  {
    v7 = [v5 valueForEntitlement:v6];
    objc_opt_class();
    int v8 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  char v9 = v8 | [v5 hasRequiredArrayEntitlement:v6 containing:*MEMORY[0x1E4F29B28] error:a4];

  return v9 & 1;
}

- (void)remote_setAuthorizationStatuses:(id)a3 authorizationModes:(id)a4 forBundleIdentifier:(id)a5 options:(unint64_t)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v17 = [(HDStandardTaskServer *)self profile];
  v16 = [v17 authorizationManager];
  [v16 setAuthorizationStatuses:v15 authorizationModes:v14 forBundleIdentifier:v13 options:a6 completion:v12];
}

- (void)remote_setRequestedAuthorizationForBundleIdentifier:(id)a3 shareTypes:(id)a4 readTypes:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  id v14 = [(HDStandardTaskServer *)self profile];
  id v15 = [v14 authorizationManager];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __119__HDAuthorizationStoreWriteServer_remote_setRequestedAuthorizationForBundleIdentifier_shareTypes_readTypes_completion___block_invoke;
  v18[3] = &unk_1E6304DF8;
  id v19 = v12;
  id v16 = v12;
  id v17 = (id)[v15 enqueueAuthorizationRequestForBundleIdentifier:v13 writeTypes:v10 readTypes:v11 authorizationNeededHandler:0 completion:v18];
  [v15 handleAuthorizationRequestsForBundleIdentifier:v13 promptHandler:0 completion:0];
}

uint64_t __119__HDAuthorizationStoreWriteServer_remote_setRequestedAuthorizationForBundleIdentifier_shareTypes_readTypes_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)remote_setObjectAuthorizationStatuses:(id)a3 objectType:(id)a4 bundleIdentifier:(id)a5 sessionIdentifier:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v18 = [(HDStandardTaskServer *)self profile];
  id v17 = [v18 authorizationManager];
  [v17 setObjectAuthorizationStatuses:v16 forObjectType:v15 bundleIdentifier:v14 sessionIdentifier:v13 completion:v12];
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F40E7AE0](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F40E7AC8](self, a2);
}

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F2AC68] writeTaskIdentifier];
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end