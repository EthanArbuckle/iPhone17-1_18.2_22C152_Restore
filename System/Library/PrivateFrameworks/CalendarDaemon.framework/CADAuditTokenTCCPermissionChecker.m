@interface CADAuditTokenTCCPermissionChecker
- (CADAuditTokenTCCPermissionChecker)initWithAuditToken:(id *)a3;
- (unint64_t)_authorizationForService:(__CFString *)a3;
- (unint64_t)eventAuthorization;
- (unint64_t)remindersAuthorization;
- (void)requestAuthorization:(unint64_t)a3 forService:(__CFString *)a4 clientDictionary:(id)a5 completion:(id)a6;
@end

@implementation CADAuditTokenTCCPermissionChecker

- (unint64_t)_authorizationForService:(__CFString *)a3
{
  return tcc_authorization_check_audit_token();
}

- (unint64_t)remindersAuthorization
{
  return [(CADAuditTokenTCCPermissionChecker *)self _authorizationForService:*MEMORY[0x1E4FA9AF0]];
}

- (unint64_t)eventAuthorization
{
  return [(CADAuditTokenTCCPermissionChecker *)self _authorizationForService:*MEMORY[0x1E4FA9A30]];
}

- (CADAuditTokenTCCPermissionChecker)initWithAuditToken:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CADAuditTokenTCCPermissionChecker;
  result = [(CADAuditTokenTCCPermissionChecker *)&v6 init];
  if (result)
  {
    long long v5 = *(_OWORD *)a3->var0;
    *(_OWORD *)&result->_auditToken.val[4] = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)result->_auditToken.val = v5;
  }
  return result;
}

- (void)requestAuthorization:(unint64_t)a3 forService:(__CFString *)a4 clientDictionary:(id)a5 completion:(id)a6
{
  id v10 = a6;
  long long v11 = *(_OWORD *)&self->_auditToken.val[4];
  long long v18 = *(_OWORD *)self->_auditToken.val;
  long long v19 = v11;
  id v12 = a5;
  v13 = (void *)tcc_credential_create_for_process_with_audit_token();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __97__CADAuditTokenTCCPermissionChecker_requestAuthorization_forService_clientDictionary_completion___block_invoke;
  v15[3] = &unk_1E624E228;
  id v16 = v10;
  v17 = a4;
  v15[4] = self;
  id v14 = v10;
  CalRequestAuthorizationForServiceWithCompletion(a3, v13, (uint64_t)a4, v12, v15);
}

uint64_t __97__CADAuditTokenTCCPermissionChecker_requestAuthorization_forService_clientDictionary_completion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3) {
    [*(id *)(a1 + 32) _authorizationForService:*(void *)(a1 + 48)];
  }
  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

@end