@interface BMProcessCurrent
- (BOOL)isManagedByLaunchd;
- (BOOL)isManagedByRunningBoard;
- (BOOL)isRunningInUserContext;
- (BOOL)reliesOnDirectAccessForDomain:(unint64_t)a3;
- (id)_initWithAuditToken:(id *)a3;
- (id)runningBoardAssertionWithExplanation:(id)a3;
@end

@implementation BMProcessCurrent

- (BOOL)reliesOnDirectAccessForDomain:(unint64_t)a3
{
  if (![(BMProcess *)self processType]) {
    return 0;
  }
  if ([(BMProcess *)self processType] != 2)
  {
    p_reliesOnLegacyDirectAccessLock = &self->_reliesOnLegacyDirectAccessLock;
    os_unfair_lock_lock(&self->_reliesOnLegacyDirectAccessLock);
    reliesOnLegacyDirectAccess = self->_reliesOnLegacyDirectAccess;
    if (reliesOnLegacyDirectAccess)
    {
      char v4 = [(NSNumber *)reliesOnLegacyDirectAccess BOOLValue];
    }
    else
    {
      if ([(BMProcess *)self BOOLForEntitlement:@"com.apple.private.security.storage.Biome"])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [(BMProcess *)self processType] == 1)
        {
          v7 = [(BMProcess *)self executableName];
          char v8 = [&unk_1F0B433A8 containsObject:v7];

          if ((v8 & 1) == 0)
          {
            v14 = __biome_log_for_category(6);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
              -[BMProcessCurrent reliesOnDirectAccessForDomain:]();
            }

            id v15 = (id)objc_claimAutoreleasedReturnValue();
            objc_exception_throw(v15);
          }
        }
        if (os_variant_has_internal_diagnostics())
        {
          v9 = __biome_log_for_category(6);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v16 = 0;
            _os_log_impl(&dword_1B30A0000, v9, OS_LOG_TYPE_ERROR, "Warning: process needs to add mach-lookup for access service and remove datavault entitlement", v16, 2u);
          }
        }
        if (![(BMProcess *)self canPerformGlobalMachLookup:@"com.apple.biome.PublicStreamAccessService" report:0]&& ![(BMProcess *)self canPerformGlobalMachLookup:@"com.apple.biome.access.user" report:0]&& ![(BMProcess *)self canPerformGlobalMachLookup:@"com.apple.biome.access.system" report:0])
        {
          if ([(BMProcess *)self processType] == 2
            || [(BMProcess *)self processType] == 8
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
            || [(BMProcessCurrent *)self isRunningInUserContext])
          {
            v12 = self->_reliesOnLegacyDirectAccess;
            self->_reliesOnLegacyDirectAccess = (NSNumber *)MEMORY[0x1E4F1CC38];

            char v4 = 1;
            goto LABEL_19;
          }
          if (os_variant_has_internal_diagnostics())
          {
            v13 = __biome_log_for_category(6);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
              -[BMProcessCurrent reliesOnDirectAccessForDomain:]();
            }
          }
        }
      }
      v10 = self->_reliesOnLegacyDirectAccess;
      self->_reliesOnLegacyDirectAccess = (NSNumber *)MEMORY[0x1E4F1CC28];

      char v4 = 0;
    }
LABEL_19:
    os_unfair_lock_unlock(p_reliesOnLegacyDirectAccessLock);
    return v4;
  }
  return 1;
}

- (id)_initWithAuditToken:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BMProcessCurrent;
  long long v3 = *(_OWORD *)&a3->var0[4];
  v8[0] = *(_OWORD *)a3->var0;
  v8[1] = v3;
  id v4 = [(BMProcess *)&v9 _initWithAuditToken:v8];
  v5 = v4;
  if (v4)
  {
    *((_DWORD *)v4 + 30) = 0;
    v6 = (void *)*((void *)v4 + 16);
    *((void *)v4 + 16) = 0;
  }
  return v5;
}

- (id)runningBoardAssertionWithExplanation:(id)a3
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(BMProcessCurrent *)self isManagedByRunningBoard])
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2050000000;
    v5 = (void *)getRBSTargetClass_softClass;
    uint64_t v31 = getRBSTargetClass_softClass;
    if (!getRBSTargetClass_softClass)
    {
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      v25 = __getRBSTargetClass_block_invoke;
      v26 = &unk_1E60229E8;
      v27 = &v28;
      __getRBSTargetClass_block_invoke((uint64_t)&v23);
      v5 = (void *)v29[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v28, 8);
    v7 = [v6 targetWithPid:getpid()];
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2050000000;
    char v8 = (void *)getRBSAssertionClass_softClass;
    uint64_t v31 = getRBSAssertionClass_softClass;
    if (!getRBSAssertionClass_softClass)
    {
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      v25 = __getRBSAssertionClass_block_invoke;
      v26 = &unk_1E60229E8;
      v27 = &v28;
      __getRBSAssertionClass_block_invoke((uint64_t)&v23);
      char v8 = (void *)v29[3];
    }
    objc_super v9 = v8;
    _Block_object_dispose(&v28, 8);
    id v10 = [v9 alloc];
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2050000000;
    v11 = (void *)getRBSDomainAttributeClass_softClass;
    uint64_t v31 = getRBSDomainAttributeClass_softClass;
    if (!getRBSDomainAttributeClass_softClass)
    {
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      v25 = __getRBSDomainAttributeClass_block_invoke;
      v26 = &unk_1E60229E8;
      v27 = &v28;
      __getRBSDomainAttributeClass_block_invoke((uint64_t)&v23);
      v11 = (void *)v29[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v28, 8);
    v13 = [v12 attributeWithDomain:@"com.apple.common" name:@"FinishTaskNow"];
    v32[0] = v13;
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2050000000;
    v14 = (void *)getRBSAcquisitionCompletionAttributeClass_softClass;
    uint64_t v31 = getRBSAcquisitionCompletionAttributeClass_softClass;
    if (!getRBSAcquisitionCompletionAttributeClass_softClass)
    {
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      v25 = __getRBSAcquisitionCompletionAttributeClass_block_invoke;
      v26 = &unk_1E60229E8;
      v27 = &v28;
      __getRBSAcquisitionCompletionAttributeClass_block_invoke((uint64_t)&v23);
      v14 = (void *)v29[3];
    }
    id v15 = v14;
    _Block_object_dispose(&v28, 8);
    uint64_t v16 = [v15 attributeWithCompletionPolicy:1];
    v32[1] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    v18 = (void *)[v10 initWithExplanation:v4 target:v7 attributes:v17];

    id v22 = 0;
    LOBYTE(v16) = [v18 acquireWithError:&v22];
    id v19 = v22;
    if ((v16 & 1) == 0)
    {
      v20 = __biome_log_for_category(0);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[BMProcessCurrent runningBoardAssertionWithExplanation:]((uint64_t)v19, v20);
      }
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)isManagedByRunningBoard
{
  if (isManagedByRunningBoard_onceToken != -1) {
    dispatch_once(&isManagedByRunningBoard_onceToken, &__block_literal_global_213);
  }
  return isManagedByRunningBoard_isManaged;
}

- (BOOL)isManagedByLaunchd
{
  if (isManagedByLaunchd_onceToken != -1) {
    dispatch_once(&isManagedByLaunchd_onceToken, &__block_literal_global_193);
  }
  return isManagedByLaunchd_isManaged;
}

uint64_t __38__BMProcessCurrent_isManagedByLaunchd__block_invoke()
{
  uint64_t result = vproc_swap_integer();
  if (!result) {
    isManagedByLaunchd_isManaged = 0;
  }
  return result;
}

- (BOOL)isRunningInUserContext
{
  if (isRunningInUserContext_onceToken != -1) {
    dispatch_once(&isRunningInUserContext_onceToken, &__block_literal_global_195);
  }
  return isRunningInUserContext_userContext;
}

void __42__BMProcessCurrent_isRunningInUserContext__block_invoke()
{
  if (!vproc_swap_string())
  {
    isRunningInUserContext_userContext = geteuid() != 0;
    free(0);
  }
}

void __43__BMProcessCurrent_isManagedByRunningBoard__block_invoke()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getRBSProcessHandleClass_softClass;
  uint64_t v7 = getRBSProcessHandleClass_softClass;
  if (!getRBSProcessHandleClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getRBSProcessHandleClass_block_invoke;
    v3[3] = &unk_1E60229E8;
    v3[4] = &v4;
    __getRBSProcessHandleClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  v2 = [v1 currentProcess];
  isManagedByRunningBoard_isManaged = [v2 isManaged];
}

- (void).cxx_destruct
{
}

- (void)reliesOnDirectAccessForDomain:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_1B30A0000, v0, v1, "Client Error: root/system processes cannot access Biome using datavault entitlement", v2, v3, v4, v5, v6);
}

- (void)reliesOnDirectAccessForDomain:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
}

- (void)runningBoardAssertionWithExplanation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B30A0000, a2, OS_LOG_TYPE_ERROR, "Failed to acquire RunningBoard assertion with error: %@", (uint8_t *)&v2, 0xCu);
}

@end