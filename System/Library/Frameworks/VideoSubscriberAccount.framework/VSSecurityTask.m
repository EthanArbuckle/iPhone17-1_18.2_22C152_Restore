@interface VSSecurityTask
+ (VSSecurityTask)securityTaskForCurrentConnection;
+ (VSSecurityTask)securityTaskWithAuditToken:(id *)a3;
+ (id)currentSecurityTask;
+ (void)setSecurityTaskForCurrentConnection:(id)a3;
- (BOOL)getValue:(id *)a3 forEntitlement:(id)a4 error:(id *)a5;
- (BOOL)shouldAllowAccessForBooleanEntitlement:(id)a3;
- (BOOL)shouldAllowAccessToSubscriberIdentifierHashModifier:(id)a3;
- (NSString)signingIdentifier;
- (VSSecurityTask)init;
- (VSSecurityTask)initWithAuditToken:(id *)a3 createWithAuditTokenProc:(void *)a4 copyValueForEntitlementProc:(void *)a5;
- (VSSecurityTask)initWithCreateFromSelfProc:(void *)a3 copyValueForEntitlementProc:(void *)a4;
- (__SecTask)_taskRef;
- (void)_copySigningIdentifier;
- (void)dealloc;
- (void)signingIdentifier;
@end

@implementation VSSecurityTask

+ (id)currentSecurityTask
{
  v2 = [VSSecurityTask alloc];
  v3 = [(VSSecurityTask *)v2 initWithCreateFromSelfProc:MEMORY[0x1E4F3B4A0] copyValueForEntitlementProc:MEMORY[0x1E4F3B498]];

  return v3;
}

+ (VSSecurityTask)securityTaskWithAuditToken:(id *)a3
{
  v4 = [VSSecurityTask alloc];
  long long v5 = *(_OWORD *)&a3->var0[4];
  v8[0] = *(_OWORD *)a3->var0;
  v8[1] = v5;
  v6 = [(VSSecurityTask *)v4 initWithAuditToken:v8 createWithAuditTokenProc:MEMORY[0x1E4F3B4A8] copyValueForEntitlementProc:MEMORY[0x1E4F3B498]];

  return v6;
}

+ (VSSecurityTask)securityTaskForCurrentConnection
{
  id v2 = (id)_securityTaskForCurrentConnection;
  if (!v2)
  {
    v3 = [MEMORY[0x1E4F29268] currentConnection];
    v4 = v3;
    if (v3)
    {
      long long v7 = 0u;
      long long v8 = 0u;
      [v3 auditToken];
      v6[0] = v7;
      v6[1] = v8;
      id v2 = +[VSSecurityTask securityTaskWithAuditToken:v6];
    }
    else
    {
      id v2 = 0;
    }
  }

  return (VSSecurityTask *)v2;
}

+ (void)setSecurityTaskForCurrentConnection:(id)a3
{
}

- (VSSecurityTask)initWithAuditToken:(id *)a3 createWithAuditTokenProc:(void *)a4 copyValueForEntitlementProc:(void *)a5
{
  v10.receiver = self;
  v10.super_class = (Class)VSSecurityTask;
  result = [(VSSecurityTask *)&v10 init];
  if (result)
  {
    result->_kind = 1;
    long long v9 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)result->_auditToken.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&result->_auditToken.val[4] = v9;
    result->_createWithAuditToken = a4;
    result->_copyValueForEntitlement = a5;
  }
  return result;
}

- (VSSecurityTask)initWithCreateFromSelfProc:(void *)a3 copyValueForEntitlementProc:(void *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)VSSecurityTask;
  result = [(VSSecurityTask *)&v7 init];
  if (result)
  {
    result->_kind = 0;
    result->_createFromSelf = a3;
    result->_copyValueForEntitlement = a4;
  }
  return result;
}

- (void)dealloc
{
  taskRef = self->_taskRef;
  if (taskRef) {
    CFRelease(taskRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)VSSecurityTask;
  [(VSSecurityTask *)&v4 dealloc];
}

- (VSSecurityTask)init
{
  return 0;
}

- (void)_copySigningIdentifier
{
  result = self->_copySigningIdentifier;
  if (!result)
  {
    result = (void *)MEMORY[0x1E4F3B490];
    self->_copySigningIdentifier = (void *)MEMORY[0x1E4F3B490];
  }
  return result;
}

- (__SecTask)_taskRef
{
  result = self->_taskRef;
  if (!result)
  {
    unint64_t kind = self->_kind;
    if (kind == 1)
    {
      createWithAuditToken = (uint64_t (*)(uint64_t, _OWORD *))self->_createWithAuditToken;
      uint64_t v6 = *MEMORY[0x1E4F1CF80];
      long long v7 = *(_OWORD *)&self->_auditToken.val[4];
      v8[0] = *(_OWORD *)self->_auditToken.val;
      v8[1] = v7;
      result = (__SecTask *)createWithAuditToken(v6, v8);
      goto LABEL_6;
    }
    if (!kind)
    {
      result = (__SecTask *)((uint64_t (*)(void, SEL))self->_createFromSelf)(*MEMORY[0x1E4F1CF80], a2);
LABEL_6:
      self->_taskRef = result;
      return result;
    }
    return 0;
  }
  return result;
}

- (BOOL)getValue:(id *)a3 forEntitlement:(id)a4 error:(id *)a5
{
  id v8 = a4;
  long long v9 = [(VSSecurityTask *)self _taskRef];
  if (v9)
  {
    id v14 = 0;
    objc_super v10 = (void *)((uint64_t (*)(__SecTask *, id, id *))self->_copyValueForEntitlement)(v9, v8, &v14);
    if (v10)
    {
      if (a3) {
        *a3 = v10;
      }
      else {
        CFRelease(v10);
      }
LABEL_15:
      BOOL v12 = 1;
      goto LABEL_16;
    }
    if (!v14)
    {
      if (a3) {
        *a3 = 0;
      }
      goto LABEL_15;
    }
    if (a5)
    {
      id v11 = v14;
      goto LABEL_10;
    }
LABEL_11:
    BOOL v12 = 0;
    goto LABEL_16;
  }
  if (!a5) {
    goto LABEL_11;
  }
  id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
LABEL_10:
  BOOL v12 = 0;
  *a5 = v11;
LABEL_16:

  return v12;
}

- (BOOL)shouldAllowAccessForBooleanEntitlement:(id)a3
{
  id v4 = a3;
  long long v5 = (void *)MEMORY[0x1E0173AA0]();
  id v12 = 0;
  id v13 = 0;
  BOOL v6 = [(VSSecurityTask *)self getValue:&v13 forEntitlement:v4 error:&v12];
  id v7 = v13;
  id v8 = v12;
  if (!v6)
  {
    objc_super v10 = VSErrorLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[VSSecurityTask shouldAllowAccessForBooleanEntitlement:]();
    }

    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_7:
    char v9 = 0;
    goto LABEL_8;
  }
  char v9 = [v7 BOOLValue];
LABEL_8:

  return v9;
}

- (BOOL)shouldAllowAccessToSubscriberIdentifierHashModifier:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = (void *)MEMORY[0x1E0173AA0]();
  id v51 = 0;
  id v50 = 0;
  BOOL v6 = [(VSSecurityTask *)self getValue:&v51 forEntitlement:@"com.apple.private.subscriptionservce.subscriber-identifier-hash-modifiers" error:&v50];
  id v7 = v51;
  id v8 = v50;
  if (v6)
  {
    if (v7)
    {
      char v9 = v7;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_super v10 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v11 = *MEMORY[0x1E4F1C3C8];
          id v12 = (objc_class *)objc_opt_class();
          id v13 = NSStringFromClass(v12);
          [v10 raise:v11, @"Unexpectedly, allowedHashModifiers was %@, instead of NSArray.", v13 format];
        }
        id v14 = v9;
        if ([v14 count])
        {
          v44 = v5;
          id v45 = v4;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          v15 = v14;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v46 objects:v52 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v47;
            while (2)
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v47 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void *)(*((void *)&v46 + 1) + 8 * i);
                v21 = (void *)MEMORY[0x1E0173AA0]();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v35 = VSErrorLogObject();
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
                    -[VSSecurityTask shouldAllowAccessToSubscriberIdentifierHashModifier:].cold.4(v20, v35, v36, v37, v38, v39, v40, v41);
                  }

                  long long v5 = v44;
                  id v4 = v45;
                  goto LABEL_32;
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v46 objects:v52 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }

          id v4 = v45;
          if ([v15 containsObject:v45])
          {
            BOOL v22 = 1;
            long long v5 = v44;
LABEL_34:

            goto LABEL_35;
          }
          v42 = VSErrorLogObject();
          long long v5 = v44;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
            -[VSSecurityTask shouldAllowAccessToSubscriberIdentifierHashModifier:]();
          }
          v15 = v42;
        }
        else
        {
          v15 = VSErrorLogObject();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            -[VSSecurityTask shouldAllowAccessToSubscriberIdentifierHashModifier:](v15);
          }
        }
LABEL_32:
      }
      else
      {
        id v14 = VSErrorLogObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[VSSecurityTask shouldAllowAccessToSubscriberIdentifierHashModifier:].cold.5((uint64_t)v9, v14, v29, v30, v31, v32, v33, v34);
        }
      }
      BOOL v22 = 0;
      goto LABEL_34;
    }
    char v9 = VSErrorLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[VSSecurityTask shouldAllowAccessToSubscriberIdentifierHashModifier:](v9);
    }
  }
  else
  {
    char v9 = VSErrorLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[VSSecurityTask shouldAllowAccessToSubscriberIdentifierHashModifier:].cold.6((uint64_t)v8, v9, v23, v24, v25, v26, v27, v28);
    }
  }
  BOOL v22 = 0;
LABEL_35:

  return v22;
}

- (NSString)signingIdentifier
{
  v3 = [(VSSecurityTask *)self _taskRef];
  if (v3)
  {
    id v12 = 0;
    v3 = (__SecTask *)((uint64_t (*)(__SecTask *, void **))[(VSSecurityTask *)self _copySigningIdentifier])(v3, &v12);
    if (!v3)
    {
      id v4 = VSErrorLogObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        [(VSSecurityTask *)&v12 signingIdentifier];
      }
    }
  }

  return (NSString *)v3;
}

- (void)shouldAllowAccessForBooleanEntitlement:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DA674000, v0, v1, "Unable to get value for entitlement %@: %@");
}

- (void)shouldAllowAccessToSubscriberIdentifierHashModifier:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DA674000, log, OS_LOG_TYPE_ERROR, "Nil value for hash modifier entitlement.", v1, 2u);
}

- (void)shouldAllowAccessToSubscriberIdentifierHashModifier:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DA674000, log, OS_LOG_TYPE_ERROR, "Value for hash modifier entitlement is empty.", v1, 2u);
}

- (void)shouldAllowAccessToSubscriberIdentifierHashModifier:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DA674000, v0, v1, "Value for hash modifier entitlement (%@) did not contain provided hash modifier: %@");
}

- (void)shouldAllowAccessToSubscriberIdentifierHashModifier:(uint64_t)a3 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)shouldAllowAccessToSubscriberIdentifierHashModifier:(uint64_t)a3 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)shouldAllowAccessToSubscriberIdentifierHashModifier:(uint64_t)a3 .cold.6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)signingIdentifier
{
  uint64_t v8 = *a1;
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, a2, a3, "Error getting signing identifier: %@", a5, a6, a7, a8, 2u);
}

@end