@interface EKLocalTCCPermissionChecker
- (unint64_t)_authorizationForService:(__CFString *)a3;
- (unint64_t)eventAuthorization;
- (unint64_t)remindersAuthorization;
- (void)requestAuthorization:(unint64_t)a3 forService:(__CFString *)a4 clientDictionary:(id)a5 completion:(id)a6;
@end

@implementation EKLocalTCCPermissionChecker

- (unint64_t)_authorizationForService:(__CFString *)a3
{
  return MEMORY[0x1F415CC58](a3, 0);
}

- (unint64_t)remindersAuthorization
{
  return [(EKLocalTCCPermissionChecker *)self _authorizationForService:*MEMORY[0x1E4FA9AF0]];
}

- (unint64_t)eventAuthorization
{
  return [(EKLocalTCCPermissionChecker *)self _authorizationForService:*MEMORY[0x1E4FA9A30]];
}

- (void)requestAuthorization:(unint64_t)a3 forService:(__CFString *)a4 clientDictionary:(id)a5 completion:(id)a6
{
  id v7 = a6;
  id v8 = a5;
  v9 = tcc_credential_singleton_for_self();
  id v10 = v7;
  CalRequestAuthorizationForServiceWithCompletion();
}

uint64_t __91__EKLocalTCCPermissionChecker_requestAuthorization_forService_clientDictionary_completion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3) {
    [*(id *)(a1 + 32) _authorizationForService:*(void *)(a1 + 48)];
  }
  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

@end