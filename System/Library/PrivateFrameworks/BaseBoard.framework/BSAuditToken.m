@interface BSAuditToken
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)invalidToken;
+ (id)tokenForCurrentProcess;
+ (id)tokenFromAuditToken:(id *)a3;
+ (id)tokenFromAuditTokenRef:(id *)a3;
+ (id)tokenFromMachMessage:(id *)a3;
+ (id)tokenFromNSXPCConnection:(id)a3;
+ (id)tokenFromXPCConnection:(id)a3;
+ (id)tokenFromXPCMessage:(id)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)realToken;
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)hasSameProcessAsAuditToken:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInvalid;
- (BSAuditToken)initWithAuditToken:(id *)a3;
- (BSAuditToken)initWithBSXPCCoder:(id)a3;
- (BSAuditToken)initWithCoder:(id)a3;
- (BSAuditToken)initWithXPCDictionary:(id)a3;
- (NSString)bundleID;
- (NSString)description;
- (id)_auditTokenAsData;
- (id)_bundleIDGeneratingIfNeeded:(void *)a1;
- (id)_initWithData:(void *)a3 bundleID:;
- (id)valueForEntitlement:(id)a3;
- (int)asid;
- (int)pid;
- (int64_t)versionedPID;
- (unint64_t)hash;
- (unsigned)egid;
- (unsigned)euid;
- (void)_accessSecTask:(uint64_t)a1;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BSAuditToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BSAuditToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"auditTokenValue"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
  v7 = (void *)[v6 copy];

  v8 = (BSAuditToken *)-[BSAuditToken _initWithData:bundleID:](self, v5, v7);
  return v8;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = +[BSXPCCoder coderWithMessage:a3];
  -[BSAuditToken encodeWithBSXPCCoder:](self, "encodeWithBSXPCCoder:");
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secTask, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v6 = a3;
  id v4 = -[BSAuditToken _auditTokenAsData]((uint64_t)self);
  [v6 encodeObject:v4 forKey:@"auditTokenValue"];
  v5 = -[BSAuditToken _bundleIDGeneratingIfNeeded:](self, 0);
  [v6 encodeObject:v5 forKey:@"bundleID"];
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = -[BSAuditToken _auditTokenAsData]((uint64_t)self);
  [v6 encodeObject:v4 forKey:@"auditTokenValue"];
  v5 = -[BSAuditToken _bundleIDGeneratingIfNeeded:](self, 0);
  [v6 encodeObject:v5 forKey:@"bundleID"];
}

- (id)_bundleIDGeneratingIfNeeded:(void *)a1
{
  if (a1)
  {
    v3 = a1;
    objc_sync_enter(v3);
    if (a2 && !*((void *)v3 + 5) && !v3[56])
    {
      v3[56] = 1;
      id v4 = BSBundleIDForAuditToken((long long *)(v3 + 8));
      uint64_t v5 = [v4 copy];
      id v6 = (void *)*((void *)v3 + 5);
      *((void *)v3 + 5) = v5;
    }
    id v7 = *((id *)v3 + 5);
    objc_sync_exit(v3);
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)_auditTokenAsData
{
  if (a1)
  {
    [MEMORY[0x1E4F29238] value:a1 + 8 withObjCType:"{?=[8I]}"];
    id v1 = (id)objc_claimAutoreleasedReturnValue();
    v2 = v1;
    if (v1)
    {
      NSUInteger sizep = 0;
      id v4 = v1;
      NSGetSizeAndAlignment((const char *)[v4 objCType], &sizep, 0);
      uint64_t v5 = malloc_type_malloc(sizep, 0x3DB21FE0uLL);
      [v4 getValue:v5];
      v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v5 length:sizep];
      free(v5);
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)tokenFromXPCConnection:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"BSAuditToken.m", 65, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];
  }
  *(void *)&long long v6 = -1;
  *((void *)&v6 + 1) = -1;
  long long v11 = v6;
  long long v12 = v6;
  xpc_connection_get_audit_token();
  v10[0] = v11;
  v10[1] = v12;
  id v7 = [a1 tokenFromAuditToken:v10];

  return v7;
}

+ (id)tokenFromAuditToken:(id *)a3
{
  id v4 = objc_alloc((Class)a1);
  long long v5 = *(_OWORD *)&a3->var0[4];
  v8[0] = *(_OWORD *)a3->var0;
  v8[1] = v5;
  long long v6 = (void *)[v4 initWithAuditToken:v8];
  return v6;
}

- (id)_initWithData:(void *)a3 bundleID:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!a1)
  {
    id v16 = 0;
    goto LABEL_13;
  }
  id v7 = v5;
  v8 = v7;
  if (!v7
    || (uint64_t v9 = [v7 length], sizep[0] = 0, NSGetSizeAndAlignment("{?=[8I]}", sizep, 0), v9 != sizep[0]))
  {

    goto LABEL_9;
  }
  v10 = (void *)MEMORY[0x1E4F29238];
  id v11 = v8;
  long long v12 = objc_msgSend(v10, "valueWithBytes:objCType:", objc_msgSend(v11, "bytes"), "{?=[8I]}");

  if (!v12)
  {
LABEL_9:
    v17 = BSLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_opt_class();
      LODWORD(sizep[0]) = 138543362;
      *(NSUInteger *)((char *)sizep + 4) = (NSUInteger)v19;
      id v20 = v19;
      _os_log_error_impl(&dword_18AAA8000, v17, OS_LOG_TYPE_ERROR, "Failed to decode audit token for %{public}@ - returning nil from initializer", (uint8_t *)sizep, 0xCu);
    }
    long long v12 = 0;
    id v16 = 0;
    goto LABEL_12;
  }
  *(void *)&long long v13 = -1;
  *((void *)&v13 + 1) = -1;
  *(_OWORD *)NSUInteger sizep = v13;
  long long v23 = v13;
  [v12 getValue:sizep];
  v21[0] = *(_OWORD *)sizep;
  v21[1] = v23;
  uint64_t v14 = [a1 initWithAuditToken:v21];
  v15 = (void *)v14;
  if (v14) {
    objc_storeStrong((id *)(v14 + 40), a3);
  }
  a1 = v15;
  id v16 = a1;
LABEL_12:

LABEL_13:
  return v16;
}

- (BSAuditToken)initWithAuditToken:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BSAuditToken;
  id v4 = [(BSAuditToken *)&v9 init];
  if (v4)
  {
    BOOL IsValid = BSAuditTokenIsValid((uint64_t)a3);
    id v6 = ($115C4C562B26FF47E01F9F4EA65B5887 *)&BSInvalidAuditToken;
    if (IsValid) {
      id v6 = a3;
    }
    long long v7 = *(_OWORD *)&v6->var0[4];
    *(_OWORD *)(v4 + 8) = *(_OWORD *)v6->var0;
    *(_OWORD *)(v4 + 24) = v7;
  }
  return (BSAuditToken *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BSAuditToken *)a3;
  id v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      BOOL v10 = 1;
    }
    else
    {
      [(BSAuditToken *)v4 realToken];
      long long v6 = *(_OWORD *)&self->_auditToken.val[4];
      long long v12 = *(_OWORD *)self->_auditToken.val;
      BOOL v10 = (void)v12 == v13 && *((void *)&v12 + 1) == v14 && (void)v6 == v15 && *((void *)&v6 + 1) == v16;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  return [(BSAuditToken *)self pid];
}

- ($115C4C562B26FF47E01F9F4EA65B5887)realToken
{
  long long v3 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (int)pid
{
  return BSPIDForAuditToken(self->_auditToken.val);
}

+ (id)tokenForCurrentProcess
{
  id v2 = objc_alloc((Class)a1);
  BSAuditTokenForCurrentProcess(v9);
  long long v3 = (void *)[v2 initWithAuditToken:v9];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28B50] mainBundle];
    id v5 = [v4 bundleIdentifier];
    uint64_t v6 = [v5 copy];
    long long v7 = (void *)v3[5];
    v3[5] = v6;
  }
  return v3;
}

+ (id)tokenFromNSXPCConnection:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 auditToken];
  }
  else
  {
    objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"BSAuditToken.m", 72, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];

    memset(v10, 0, sizeof(v10));
  }
  long long v7 = [a1 tokenFromAuditToken:v10];

  return v7;
}

- (NSString)bundleID
{
  return (NSString *)-[BSAuditToken _bundleIDGeneratingIfNeeded:](self, 1);
}

- (BOOL)hasSameProcessAsAuditToken:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    [v4 realToken];
    long long v6 = *(_OWORD *)&self->_auditToken.val[4];
    v9[0] = *(_OWORD *)self->_auditToken.val;
    v9[1] = v6;
    BOOL v7 = BSEqualProcessAuditTokens(v9, &v10);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)valueForEntitlement:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__8;
  uint64_t v15 = __Block_byref_object_dispose__8;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _OWORD v8[2] = __36__BSAuditToken_valueForEntitlement___block_invoke;
  v8[3] = &unk_1E5446D80;
  id v9 = v4;
  long long v10 = &v11;
  id v5 = v4;
  -[BSAuditToken _accessSecTask:]((uint64_t)self, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (BOOL)hasEntitlement:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__BSAuditToken_hasEntitlement___block_invoke;
  v7[3] = &unk_1E5446D80;
  id v8 = v4;
  id v9 = &v10;
  id v5 = v4;
  -[BSAuditToken _accessSecTask:]((uint64_t)self, v7);
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (void)_accessSecTask:(uint64_t)a1
{
  id v3 = a2;
  id v4 = (void (**)(void, void))v3;
  if (a1)
  {
    if (!v3)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:sel__accessSecTask_, a1, @"BSAuditToken.m", 215, @"Invalid parameter not satisfying: %@", @"secTaskBlock" object file lineNumber description];
    }
    uint64_t v5 = *(void *)(a1 + 48);
    if (!v5)
    {
      long long v6 = *(_OWORD *)(a1 + 24);
      v10[0] = *(_OWORD *)(a1 + 8);
      v10[1] = v6;
      uint64_t v7 = +[BSSecTask secTaskForAuditToken:]((uint64_t)BSSecTask, v10);
      id v8 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v7;

      uint64_t v5 = *(void *)(a1 + 48);
    }
    v4[2](v4, v5);
  }
}

void __31__BSAuditToken_hasEntitlement___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -[BSSecTask BOOLForEntitlement:]((uint64_t)v3, *(void **)(a1 + 32));
}

- (int64_t)versionedPID
{
  long long v2 = *(_OWORD *)&self->_auditToken.val[4];
  v4[0] = *(_OWORD *)self->_auditToken.val;
  v4[1] = v2;
  return BSVersionedPIDForAuditToken(v4);
}

void __36__BSAuditToken_valueForEntitlement___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = -[BSSecTask valueForEntitlement:]((uint64_t)v6, *(void **)(a1 + 32));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (BSAuditToken)initWithXPCDictionary:(id)a3
{
  uint64_t v4 = +[BSXPCCoder coderWithMessage:a3];
  uint64_t v5 = [(BSAuditToken *)self initWithBSXPCCoder:v4];

  return v5;
}

- (BSAuditToken)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"auditTokenValue"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
  uint64_t v7 = (void *)[v6 copy];

  id v8 = (BSAuditToken *)-[BSAuditToken _initWithData:bundleID:](self, v5, v7);
  return v8;
}

- (BOOL)isInvalid
{
  return !BSAuditTokenIsValid((uint64_t)&self->_auditToken);
}

+ (id)tokenFromAuditTokenRef:(id *)a3
{
  if (!a3)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"BSAuditToken.m", 44, @"Invalid parameter not satisfying: %@", @"auditToken" object file lineNumber description];
  }
  long long v5 = *(_OWORD *)&a3->var0[4];
  v10[0] = *(_OWORD *)a3->var0;
  v10[1] = v5;
  id v6 = [a1 tokenFromAuditToken:v10];
  return v6;
}

+ (id)tokenFromMachMessage:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"BSAuditToken.m", 54, @"Invalid parameter not satisfying: %@", @"message" object file lineNumber description];
  }
  long long v5 = (char *)a3 + ((a3->var1 + 3) & 0x1FFFFFFFCLL);
  if (*(_DWORD *)v5 || *((_DWORD *)v5 + 1) < 0x20u)
  {
    uint64_t v7 = 0;
  }
  else
  {
    long long v6 = *(_OWORD *)(v5 + 36);
    long long v12 = *(_OWORD *)(v5 + 20);
    long long v13 = v6;
    v11[0] = v12;
    v11[1] = v6;
    uint64_t v7 = (void *)[objc_alloc((Class)a1) initWithAuditToken:v11];
  }
  return v7;
}

+ (id)invalidToken
{
  *(void *)&long long v2 = -1;
  *((void *)&v2 + 1) = -1;
  v5[0] = v2;
  v5[1] = v2;
  uint64_t v3 = +[BSAuditToken tokenFromAuditToken:v5];
  return v3;
}

+ (id)tokenFromXPCMessage:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"BSAuditToken.m", 49, @"Invalid parameter not satisfying: %@", @"message" object file lineNumber description];
  }
  id v6 = objc_alloc((Class)a1);
  id v7 = v5;
  if (v6)
  {
    if (!v5)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:sel_initWithXPCMessage_, v6, @"BSAuditToken.m", 88, @"Invalid parameter not satisfying: %@", @"message" object file lineNumber description];
    }
    *(void *)&long long v8 = -1;
    *((void *)&v8 + 1) = -1;
    long long v19 = v8;
    long long v20 = v8;
    xpc_dictionary_get_audit_token();
    v18[0] = v19;
    v18[1] = v20;
    id v9 = (void *)[v6 initWithAuditToken:v18];
    if (v9)
    {
      uint64_t v10 = xpc_dictionary_get_remote_connection(v7);
      uint64_t v11 = v10;
      if (v10)
      {
        long long v12 = _BSBundleIDForXPCConnectionAndIKnowWhatImDoingISwear(v10);
        uint64_t v13 = [v12 copy];
        uint64_t v14 = (void *)v9[5];
        v9[5] = v13;
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  uint64_t v3 = +[BSDescriptionBuilder builderWithObject:self];
  if ([(BSAuditToken *)self isInvalid])
  {
    [v3 appendString:@"INVALID" withName:0];
  }
  else
  {
    long long v4 = *(_OWORD *)&self->_auditToken.val[4];
    *(_OWORD *)v23.val = *(_OWORD *)self->_auditToken.val;
    *(_OWORD *)&v23.val[4] = v4;
    id v5 = (id)[v3 appendUnsignedInteger:audit_token_to_auid(&v23) withName:@"AUID"];
    p_auditToken = &self->_auditToken;
    long long v7 = *(_OWORD *)&p_auditToken->val[4];
    *(_OWORD *)v23.val = *(_OWORD *)p_auditToken->val;
    *(_OWORD *)&v23.val[4] = v7;
    id v8 = (id)[v3 appendUnsignedInteger:audit_token_to_euid(&v23) withName:@"EUID"];
    long long v9 = *(_OWORD *)&p_auditToken->val[4];
    *(_OWORD *)v23.val = *(_OWORD *)p_auditToken->val;
    *(_OWORD *)&v23.val[4] = v9;
    id v10 = (id)[v3 appendUnsignedInteger:audit_token_to_egid(&v23) withName:@"EGID"];
    long long v11 = *(_OWORD *)&p_auditToken->val[4];
    *(_OWORD *)v23.val = *(_OWORD *)p_auditToken->val;
    *(_OWORD *)&v23.val[4] = v11;
    id v12 = (id)[v3 appendUnsignedInteger:audit_token_to_ruid(&v23) withName:@"RUID"];
    long long v13 = *(_OWORD *)&p_auditToken->val[4];
    *(_OWORD *)v23.val = *(_OWORD *)p_auditToken->val;
    *(_OWORD *)&v23.val[4] = v13;
    id v14 = (id)[v3 appendUnsignedInteger:audit_token_to_rgid(&v23) withName:@"RGID"];
    long long v15 = *(_OWORD *)&p_auditToken->val[4];
    *(_OWORD *)v23.val = *(_OWORD *)p_auditToken->val;
    *(_OWORD *)&v23.val[4] = v15;
    id v16 = (id)[v3 appendUnsignedInteger:audit_token_to_pid(&v23) withName:@"PID"];
    long long v17 = *(_OWORD *)&p_auditToken->val[4];
    *(_OWORD *)v23.val = *(_OWORD *)p_auditToken->val;
    *(_OWORD *)&v23.val[4] = v17;
    id v18 = (id)[v3 appendUnsignedInteger:audit_token_to_asid(&v23) withName:@"ASID"];
    long long v19 = *(_OWORD *)&p_auditToken->val[4];
    *(_OWORD *)v23.val = *(_OWORD *)p_auditToken->val;
    *(_OWORD *)&v23.val[4] = v19;
    id v20 = (id)[v3 appendUnsignedInteger:audit_token_to_pidversion(&v23) withName:@"PIDVersion"];
  }
  v21 = [v3 build];

  return (NSString *)v21;
}

- (int)asid
{
  return BSASIDForAuditToken(self->_auditToken.val);
}

- (unsigned)euid
{
  return BSEUIDForAuditToken(self->_auditToken.val);
}

- (unsigned)egid
{
  return BSEGIDForAuditToken(self->_auditToken.val);
}

@end