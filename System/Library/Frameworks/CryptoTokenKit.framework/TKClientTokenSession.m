@interface TKClientTokenSession
- (BOOL)_testing_AuthenticateInternally;
- (BOOL)_testing_ForceAuthenticationNeeded;
- (BOOL)authenticateWhenNeeded;
- (BOOL)deleteObject:(id)a3 error:(id *)a4;
- (BOOL)evaluateAccessControl:(id)a3 forOperation:(id)a4 error:(id *)a5;
- (BOOL)isValidWithError:(id *)a3;
- (LAContext)LAContext;
- (NSArray)certificates;
- (NSArray)identities;
- (NSArray)keys;
- (NSDictionary)parameters;
- (NSString)slotName;
- (TKClientToken)token;
- (TKClientTokenSession)initWithToken:(id)a3 LAContext:(id)a4 parameters:(id)a5 error:(id *)a6;
- (TKClientTokenSession)initWithTokenID:(id)a3 LAContext:(id)a4 error:(id *)a5;
- (id)_initWithToken:(id)a3 LAContext:(id)a4 parameters:(id)a5 error:(id *)a6;
- (id)_testing_AuthContextUsed;
- (id)createObjectWithAttributes:(id)a3 error:(id *)a4;
- (id)objectForObjectID:(id)a3 error:(id *)a4;
- (id)processObjectCreationAttributes:(id)a3 authContext:(id *)a4 error:(id *)a5;
- (void)setAuthenticateWhenNeeded:(BOOL)a3;
- (void)setLAContext:(id)a3;
- (void)set_testing_AuthContextUsed:(id)a3;
- (void)set_testing_AuthenticateInternally:(BOOL)a3;
- (void)set_testing_ForceAuthenticationNeeded:(BOOL)a3;
@end

@implementation TKClientTokenSession

- (BOOL)_testing_ForceAuthenticationNeeded
{
  return self->__testing_ForceAuthenticationNeeded;
}

- (BOOL)isValidWithError:(id *)a3
{
  return 1;
}

- (id)_initWithToken:(id)a3 LAContext:(id)a4 parameters:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)TKClientTokenSession;
  v14 = [(TKClientTokenSession *)&v18 init];
  p_isa = (id *)&v14->super.isa;
  if (v14
    && (v14->_authenticateWhenNeeded = 1,
        objc_storeStrong((id *)&v14->_token, a3),
        objc_storeStrong(p_isa + 2, a4),
        objc_storeStrong(p_isa + 3, a5),
        ![p_isa isValidWithError:a6]))
  {
    v16 = 0;
  }
  else
  {
    v16 = p_isa;
  }

  return v16;
}

- (TKClientTokenSession)initWithToken:(id)a3 LAContext:(id)a4 parameters:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v14 = off_1E63C7BB0;
  if ((isKindOfClass & 1) == 0) {
    v14 = off_1E63C7BA0;
  }
  v15 = (TKClientTokenSession *)[objc_alloc(*v14) initWithToken:v10 LAContext:v12 parameters:v11 error:a6];

  return v15;
}

- (TKClientTokenSession)initWithTokenID:(id)a3 LAContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [[TKClientToken alloc] initWithTokenID:v9];

  id v11 = [(TKClientTokenSession *)self initWithToken:v10 LAContext:v8 parameters:MEMORY[0x1E4F1CC08] error:a5];
  return v11;
}

- (BOOL)deleteObject:(id)a3 error:(id *)a4
{
  v5 = -[TKClientTokenSession objectForObjectID:error:](self, "objectForObjectID:error:", a3);
  LOBYTE(a4) = [v5 deleteWithError:a4];

  return (char)a4;
}

- (BOOL)evaluateAccessControl:(id)a3 forOperation:(id)a4 error:(id *)a5
{
  if (a5)
  {
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:MEMORY[0x1E4F1CC08]];
  }
  return 0;
}

- (id)objectForObjectID:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)createObjectWithAttributes:(id)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:MEMORY[0x1E4F1CC08]];
  }
  return 0;
}

- (id)processObjectCreationAttributes:(id)a3 authContext:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  v27 = a5;
  uint64_t v9 = *MEMORY[0x1E4F3B548];
  id v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F3B548]];
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = SecAccessControlCreateFromData();
      if (!v11)
      {
        v17 = TK_LOG_client_0();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          -[TKClientTokenSession processObjectCreationAttributes:authContext:error:]();
        }
        goto LABEL_13;
      }
      id v12 = (void *)v11;

      id v10 = v12;
    }
    if (SecAccessControlIsBound())
    {
      id v13 = [(TKClientTokenSession *)self _testing_AuthContextUsed];

      if (!v13) {
        goto LABEL_24;
      }
      v14 = [(TKClientTokenSession *)self LAContext];
      if (v14)
      {
        [(TKClientTokenSession *)self set_testing_AuthContextUsed:v14];
      }
      else
      {
        id v22 = objc_alloc_init(MEMORY[0x1E4F30B50]);
        [(TKClientTokenSession *)self set_testing_AuthContextUsed:v22];
      }
LABEL_23:

LABEL_24:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v23 = SecAccessControlCopyData();

        v24 = (void *)[v8 mutableCopy];
        [v24 setObject:v23 forKeyedSubscript:v9];
        uint64_t v25 = [v24 copy];

        id v10 = (void *)v23;
        id v8 = (id)v25;
      }
      goto LABEL_26;
    }
    v15 = [(TKClientTokenSession *)self LAContext];
    v16 = v15;
    if (v15)
    {
      *a4 = v15;
    }
    else
    {
      id v18 = objc_alloc_init(MEMORY[0x1E4F30B50]);
      *a4 = v18;
    }
    v19 = [(TKClientTokenSession *)self _testing_AuthContextUsed];

    if (v19) {
      [(TKClientTokenSession *)self set_testing_AuthContextUsed:*a4];
    }
    uint64_t v20 = [*a4 evaluateAccessControl:v10 aksOperation:&stru_1F19EDBB0 options:MEMORY[0x1E4F1CC08] error:v27];
    if (v20)
    {
      v14 = (void *)v20;
      SecAccessControlSetBound();
      goto LABEL_23;
    }
    if (!v27 || *v27)
    {
LABEL_21:
      v21 = 0;
      goto LABEL_27;
    }
    id *v27 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F30B38] code:-1000 userInfo:0];
    v17 = TK_LOG_client_0();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[TKClientTokenSession processObjectCreationAttributes:authContext:error:]((uint64_t **)&v27, v17);
    }
LABEL_13:

    goto LABEL_21;
  }
LABEL_26:
  id v8 = v8;
  v21 = v8;
LABEL_27:

  return v21;
}

- (LAContext)LAContext
{
  return self->_LAContext;
}

- (void)setLAContext:(id)a3
{
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (TKClientToken)token
{
  return self->_token;
}

- (BOOL)authenticateWhenNeeded
{
  return self->_authenticateWhenNeeded;
}

- (void)setAuthenticateWhenNeeded:(BOOL)a3
{
  self->_authenticateWhenNeeded = a3;
}

- (NSArray)keys
{
  return self->_keys;
}

- (NSArray)certificates
{
  return self->_certificates;
}

- (NSArray)identities
{
  return self->_identities;
}

- (NSString)slotName
{
  return self->_slotName;
}

- (BOOL)_testing_AuthenticateInternally
{
  return self->__testing_AuthenticateInternally;
}

- (void)set_testing_AuthenticateInternally:(BOOL)a3
{
  self->__testing_AuthenticateInternally = a3;
}

- (void)set_testing_ForceAuthenticationNeeded:(BOOL)a3
{
  self->__testing_ForceAuthenticationNeeded = a3;
}

- (id)_testing_AuthContextUsed
{
  return self->__testing_AuthContextUsed;
}

- (void)set_testing_AuthContextUsed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__testing_AuthContextUsed, 0);
  objc_storeStrong((id *)&self->_slotName, 0);
  objc_storeStrong((id *)&self->_identities, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_LAContext, 0);
}

- (void)processObjectCreationAttributes:authContext:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_11();
  _os_log_fault_impl(&dword_1BED55000, v0, OS_LOG_TYPE_FAULT, "Unable to deserialize AC %{public}@, error: %{public}@", v1, 0x16u);
}

- (void)processObjectCreationAttributes:(uint64_t *)a1 authContext:(NSObject *)a2 error:.cold.2(uint64_t **a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = **a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BED55000, a2, OS_LOG_TYPE_ERROR, "-[LAContext evaluateAccessControl:] failed but did not provide an error, syntesizing: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end