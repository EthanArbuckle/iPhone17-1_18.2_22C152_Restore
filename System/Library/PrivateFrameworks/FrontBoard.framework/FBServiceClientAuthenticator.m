@interface FBServiceClientAuthenticator
+ (BOOL)authenticateAuditToken:(id *)a3 forEntitlement:(id)a4 error:(id *)a5;
+ (id)_errorForCode:(int)a3 process:(id)a4 failedEntitlement:(id)a5;
+ (id)sharedForegroundUIAppClientAuthenticator;
+ (id)sharedSystemClientAuthenticator;
+ (id)sharedUIAppClientAuthenticator;
+ (int)_authenticateAuditToken:(id)a3 entitlement:(id)a4 credentials:(unint64_t)a5 error:(id *)a6 withResult:(id)a7;
- (BOOL)authenticateAuditToken:(id)a3;
- (BOOL)authenticateAuditToken:(id)a3 error:(id *)a4;
- (BOOL)authenticateAuditToken:(id)a3 forEntitlement:(id)a4 error:(id *)a5;
- (BOOL)authenticateClient:(id)a3;
- (BOOL)authenticateClient:(id)a3 error:(id *)a4;
- (FBServiceClientAuthenticator)init;
- (FBServiceClientAuthenticator)initWithCredentials:(unint64_t)a3;
- (FBServiceClientAuthenticator)initWithEntitlement:(id)a3;
- (FBServiceClientAuthenticator)initWithEntitlement:(id)a3 additionalCredentials:(unint64_t)a4;
- (NSString)entitlement;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int)authenticateAuditToken:(id *)a3 forEntitlement:(id)a4 withResult:(id)a5;
- (int)authenticateAuditToken:(id *)a3 withResult:(id)a4;
- (int)authenticateClient:(id)a3 withResult:(id)a4;
- (unint64_t)credentials;
@end

@implementation FBServiceClientAuthenticator

- (BOOL)authenticateClient:(id)a3
{
  return [(FBServiceClientAuthenticator *)self authenticateClient:a3 error:0];
}

- (BOOL)authenticateAuditToken:(id)a3 forEntitlement:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  LODWORD(a5) = [(id)objc_opt_class() _authenticateAuditToken:v9 entitlement:v8 credentials:self->_credentials error:a5 withResult:0];

  return a5 == 0;
}

- (BOOL)authenticateClient:(id)a3 error:(id *)a4
{
  v6 = [a3 processHandle];
  v7 = [v6 auditToken];

  LOBYTE(a4) = [(id)objc_opt_class() _authenticateAuditToken:v7 entitlement:self->_entitlement credentials:self->_credentials error:a4 withResult:0] == 0;
  return (char)a4;
}

+ (int)_authenticateAuditToken:(id)a3 entitlement:(id)a4 credentials:(unint64_t)a5 error:(id *)a6 withResult:(id)a7
{
  char v9 = a5;
  id v11 = a3;
  id v12 = a4;
  v13 = (void (**)(id, BOOL, void *))a7;
  v14 = +[FBProcessManager sharedInstance];
  if (v11)
  {
    [v11 realToken];
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
  }
  v15 = [v14 registerProcessForAuditToken:&v23];

  if (![v15 isRunning])
  {
    uint64_t v16 = 3;
    if (!a6) { {
      goto LABEL_34;
    }
    }
    goto LABEL_32;
  }
  if (v9)
  {
    int v17 = [v11 pid];
    BOOL v18 = v17 == getpid();
    int v19 = v18;
    if (!v12 || v18)
    {
LABEL_15:
      if (v9 & 4) == 0 || (v19)
      {
LABEL_18:
        if (v9 & 8) == 0 || (v19) { {
          goto LABEL_23;
        }
        }
        goto LABEL_20;
      }
LABEL_17:
      int v19 = objc_msgSend(v15, "isApplicationProcess", v23, v24);
      goto LABEL_18;
    }
LABEL_14:
    int v19 = objc_msgSend(v11, "hasEntitlement:", v12, v23, v24);
    goto LABEL_15;
  }
  if (v12) { {
    goto LABEL_14;
  }
  }
  if ((v9 & 4) != 0) { {
    goto LABEL_17;
  }
  }
  if ((v9 & 8) == 0) { {
    goto LABEL_22;
  }
  }
LABEL_20:
  if (!objc_msgSend(v15, "isApplicationProcess", v23, v24))
  {
LABEL_22:
    int v19 = 0;
    goto LABEL_23;
  }
  int v19 = [v15 isForeground];
LABEL_23:
  if ((v9 & 2) != 0 && (v19 & 1) == 0)
  {
    if ([v15 isApplicationProcess])
    {
      v20 = [v15 applicationInfo];
      int v19 = [v20 type] != 2;
    }
    else
    {
      int v19 = [v15 executableLivesOnSystemPartition];
    }
  }
  if (v19) { {
    uint64_t v16 = 0;
  }
  }
  else {
    uint64_t v16 = 13;
  }
  if (a6)
  {
LABEL_32:
    if (v16)
    {
      *a6 = +[FBServiceClientAuthenticator _errorForCode:v16 process:v15 failedEntitlement:v12];
    }
  }
LABEL_34:
  if (v13) { {
    v13[2](v13, v16 == 0, v15);
  }
  }
  if (v16) { {
    int v21 = 5;
  }
  }
  else {
    int v21 = 0;
  }

  return v21;
}

- (BOOL)authenticateAuditToken:(id)a3 error:(id *)a4
{
  return [(FBServiceClientAuthenticator *)self authenticateAuditToken:a3 forEntitlement:self->_entitlement error:a4];
}

+ (id)sharedSystemClientAuthenticator
{
  if (sharedSystemClientAuthenticator_onceToken != -1) { {
    dispatch_once(&sharedSystemClientAuthenticator_onceToken, &__block_literal_global_22);
  }
  }
  v2 = (void *)sharedSystemClientAuthenticator___authenticator;

  return v2;
}

+ (BOOL)authenticateAuditToken:(id *)a3 forEntitlement:(id)a4 error:(id *)a5
{
  id v9 = a4;
  if (v9)
  {
    v10 = v9;
    id v11 = objc_alloc(MEMORY[0x1E4F627F0]);
    long long v12 = *(_OWORD *)&a3->var0[4];
    v17[0] = *(_OWORD *)a3->var0;
    v17[1] = v12;
    v13 = (void *)[v11 initWithAuditToken:v17];
    BOOL v14 = [a1 _authenticateAuditToken:v13 entitlement:v10 credentials:0 error:a5 withResult:0] == 0;

    return v14;
  }
  else
  {
    uint64_t v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"entitlement"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBServiceClientAuthenticator authenticateAuditToken:forEntitlement:error:](a2, (uint64_t)a1, (uint64_t)v16);
    }
    }
    [v16 UTF8String];
    BOOL result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

void __63__FBServiceClientAuthenticator_sharedSystemClientAuthenticator__block_invoke()
{
  v0 = [[FBServiceClientAuthenticator alloc] initWithCredentials:3];
  v1 = (void *)sharedSystemClientAuthenticator___authenticator;
  sharedSystemClientAuthenticator___authenticator = (uint64_t)v0;
}

+ (id)sharedUIAppClientAuthenticator
{
  if (sharedUIAppClientAuthenticator_onceToken != -1) { {
    dispatch_once(&sharedUIAppClientAuthenticator_onceToken, &__block_literal_global_13_1);
  }
  }
  v2 = (void *)sharedUIAppClientAuthenticator___authenticator;

  return v2;
}

void __62__FBServiceClientAuthenticator_sharedUIAppClientAuthenticator__block_invoke()
{
  v0 = [[FBServiceClientAuthenticator alloc] initWithCredentials:5];
  v1 = (void *)sharedUIAppClientAuthenticator___authenticator;
  sharedUIAppClientAuthenticator___authenticator = (uint64_t)v0;
}

+ (id)sharedForegroundUIAppClientAuthenticator
{
  if (sharedForegroundUIAppClientAuthenticator_onceToken != -1) { {
    dispatch_once(&sharedForegroundUIAppClientAuthenticator_onceToken, &__block_literal_global_15);
  }
  }
  v2 = (void *)sharedForegroundUIAppClientAuthenticator___authenticator;

  return v2;
}

void __72__FBServiceClientAuthenticator_sharedForegroundUIAppClientAuthenticator__block_invoke()
{
  v0 = [[FBServiceClientAuthenticator alloc] initWithCredentials:9];
  v1 = (void *)sharedForegroundUIAppClientAuthenticator___authenticator;
  sharedForegroundUIAppClientAuthenticator___authenticator = (uint64_t)v0;
}

- (FBServiceClientAuthenticator)init
{
  v3.receiver = self;
  v3.super_class = (Class)FBServiceClientAuthenticator;
  BOOL result = [(FBServiceClientAuthenticator *)&v3 init];
  if (result) { {
    result->_credentials = 1;
  }
  }
  return result;
}

- (FBServiceClientAuthenticator)initWithCredentials:(unint64_t)a3
{
  BOOL result = [(FBServiceClientAuthenticator *)self init];
  if (result) { {
    result->_credentials = a3;
  }
  }
  return result;
}

- (FBServiceClientAuthenticator)initWithEntitlement:(id)a3
{
  return [(FBServiceClientAuthenticator *)self initWithEntitlement:a3 additionalCredentials:1];
}

- (FBServiceClientAuthenticator)initWithEntitlement:(id)a3 additionalCredentials:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(FBServiceClientAuthenticator *)self init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    entitlement = v7->_entitlement;
    v7->_entitlement = (NSString *)v8;

    v7->_credentials = a4;
  }

  return v7;
}

- (BOOL)authenticateAuditToken:(id)a3
{
  return [(FBServiceClientAuthenticator *)self authenticateAuditToken:a3 error:0];
}

- (int)authenticateClient:(id)a3 withResult:(id)a4
{
  id v6 = a4;
  v7 = [a3 processHandle];
  uint64_t v8 = [v7 auditToken];

  LODWORD(v7) = [(id)objc_opt_class() _authenticateAuditToken:v8 entitlement:self->_entitlement credentials:self->_credentials error:0 withResult:v6];
  return (int)v7;
}

- (int)authenticateAuditToken:(id *)a3 withResult:(id)a4
{
  return [(FBServiceClientAuthenticator *)self authenticateAuditToken:a3 forEntitlement:self->_entitlement withResult:a4];
}

- (int)authenticateAuditToken:(id *)a3 forEntitlement:(id)a4 withResult:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F627F0];
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 tokenFromAuditTokenRef:a3];
  LODWORD(self) = [(id)objc_opt_class() _authenticateAuditToken:v11 entitlement:v10 credentials:self->_credentials error:0 withResult:v9];

  return (int)self;
}

+ (id)_errorForCode:(int)a3 process:(id)a4 failedEntitlement:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if (a3 == 3)
  {
    id v10 = @"No such process.";
  }
  else if (a3 == 13 && v8)
  {
    id v10 = [NSString stringWithFormat:@"Entitlement \"%@\" is required to access this resource.", v8];
  }
  else
  {
    id v10 = @"Process lacks credentials to access this resource.";
  }
  id v11 = [NSString stringWithFormat:@"Authentication failed: %@", v10];
  long long v12 = [MEMORY[0x1E4F1CA60] dictionary];
  [v12 setObject:v11 forKey:*MEMORY[0x1E4F28568]];
  [v12 setObject:v10 forKey:*MEMORY[0x1E4F28588]];
  if (v9) { {
    [v12 setObject:v9 forKey:@"Entitlement"];
  }
  }
  if (v7)
  {
    v13 = FBSProcessPrettyDescription();
    [v12 setObject:v13 forKey:@"FBProcess"];
  }
  BOOL v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FBServiceClientAuthenticatorErrorDomain" code:a3 userInfo:v12];

  return v14;
}

- (id)succinctDescription
{
  v2 = [(FBServiceClientAuthenticator *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  objc_super v3 = [MEMORY[0x1E4F62810] builderWithObject:self];
  v4 = [(FBServiceClientAuthenticator *)self entitlement];
  id v5 = (id)[v3 appendObject:v4 withName:@"entitlement" skipIfNil:1];

  id v6 = (id)[v3 appendUnsignedInteger:self->_credentials withName:@"credentials"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(FBServiceClientAuthenticator *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (NSString)entitlement
{
  return self->_entitlement;
}

- (unint64_t)credentials
{
  return self->_credentials;
}

- (void).cxx_destruct
{
}

+ (void)authenticateAuditToken:(const char *)a1 forEntitlement:(uint64_t)a2 error:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  id v9 = v5;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"FBServiceClientAuthenticator.m";
  __int16 v16 = 1024;
  int v17 = 103;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end