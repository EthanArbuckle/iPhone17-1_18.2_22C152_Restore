@interface BMProcess
+ (BMProcess)processWithXPCConnection:(id)a3;
+ (id)current;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BMProcess)init;
- (BMProcess)initWithAuditToken:(id *)a3;
- (BOOL)BOOLForEntitlement:(id)a3;
- (BOOL)_canTrustApplicationIdentifierEntitlement;
- (BOOL)canPerformFileOperation:(id)a3 onPath:(id)a4 report:(BOOL)a5;
- (BOOL)canPerformGlobalMachLookup:(id)a3 report:(BOOL)a4;
- (BOOL)canPerformSyscall:(id)a3 report:(BOOL)a4;
- (BOOL)hasDatavaultEntitlement;
- (BOOL)hasNonEmptyArrayForEntitlement:(id)a3;
- (BOOL)hasNonEmptyDictionaryForEntitlement:(id)a3;
- (BOOL)isSandboxed;
- (NSSet)useCases;
- (NSString)executableName;
- (NSString)executablePath;
- (NSString)identifier;
- (id)_initWithAuditToken:(id *)a3;
- (id)description;
- (id)dictionaryForEntitlement:(id)a3;
- (id)nonnullArrayForEntitlement:(id)a3;
- (id)nonnullSetOfStringsForEntitlement:(id)a3;
- (id)stringForEntitlement:(id)a3;
- (id)valueForEntitlement:(id)a3;
- (int)pid;
- (unint64_t)processType;
- (unsigned)uid;
- (void)_initializeProcessProperties;
- (void)cacheValuesForEntitlements:(id)a3;
- (void)init;
@end

@implementation BMProcess

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)processType
{
  return self->_processType;
}

- (BOOL)BOOLForEntitlement:(id)a3
{
  v3 = [(BMProcess *)self valueForEntitlement:a3];
  char v4 = [v3 isEqual:MEMORY[0x1E4F1CC38]];

  return v4;
}

- (int)pid
{
  return self->_pid;
}

+ (BMProcess)processWithXPCConnection:(id)a3
{
  return -[NSXPCConnection bm_process]((BMProcess *)a3);
}

- (NSString)executableName
{
  v2 = [(BMProcess *)self executablePath];
  v3 = [v2 lastPathComponent];

  return (NSString *)v3;
}

- (NSString)executablePath
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  executablePath = self->_executablePath;
  if (!executablePath)
  {
    self->_executablePath = (NSString *)&stru_1F0B3A038;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (![(BMProcess *)self canPerformSyscall:&unk_1F0B42E80 report:0]) {
        goto LABEL_6;
      }
    }
    else
    {
      v5 = +[BMProcess current];
      int v6 = [v5 canPerformSyscall:&unk_1F0B42E80 report:0];

      if (!v6) {
        goto LABEL_6;
      }
    }
    int v7 = proc_pidpath_audittoken((audit_token_t *)&self->_auditToken, buffer, 0x1000u);
    if (v7 >= 1)
    {
      v8 = (NSString *)[[NSString alloc] initWithBytes:buffer length:v7 encoding:4];
      v9 = self->_executablePath;
      self->_executablePath = v8;
    }
    goto LABEL_10;
  }
  if ([(NSString *)executablePath isEqual:&stru_1F0B3A038])
  {
LABEL_6:
    char v4 = 0;
    goto LABEL_11;
  }
LABEL_10:
  char v4 = self->_executablePath;
LABEL_11:
  return v4;
}

+ (id)current
{
  if (current_onceToken != -1) {
    dispatch_once(&current_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)current_instance;
  return v2;
}

- (BOOL)canPerformGlobalMachLookup:(id)a3 report:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  p_machLookupCacheLock = &self->_machLookupCacheLock;
  os_unfair_lock_lock(&self->_machLookupCacheLock);
  v8 = [(NSMutableDictionary *)self->_machLookupCache objectForKeyedSubscript:v6];
  v9 = v8;
  if (v8)
  {
    BOOL v10 = 1;
    switch([v8 intValue])
    {
      case 0xFFFFFFFF:
        v11 = __biome_log_for_category(6);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[BMProcess canPerformGlobalMachLookup:report:]();
        }

        goto LABEL_11;
      case 0u:
        break;
      case 1u:
        if (v4) {
          goto LABEL_7;
        }
        goto LABEL_11;
      case 2u:
LABEL_11:
        BOOL v10 = 0;
        break;
      default:
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    if (v4) {
      unsigned int v12 = 2;
    }
    else {
      unsigned int v12 = *MEMORY[0x1E4F14100] | 2;
    }
    long long v13 = *(_OWORD *)&self->_auditToken.val[4];
    v17[0] = *(_OWORD *)self->_auditToken.val;
    v17[1] = v13;
    uint64_t v14 = BMSandboxCheck(v17, @"mach-lookup", v12, v6);
    v15 = [NSNumber numberWithInt:v14];
    [(NSMutableDictionary *)self->_machLookupCache setObject:v15 forKeyedSubscript:v6];

    BOOL v10 = v14 == 0;
  }

  os_unfair_lock_unlock(p_machLookupCacheLock);
  return v10;
}

- (BOOL)canPerformSyscall:(id)a3 report:(BOOL)a4
{
  long long v5 = *(_OWORD *)&self->_auditToken.val[4];
  if (a4) {
    unsigned int v6 = 14;
  }
  else {
    unsigned int v6 = *MEMORY[0x1E4F14100] | 0xE;
  }
  v8[0] = *(_OWORD *)self->_auditToken.val;
  v8[1] = v5;
  return BMSandboxCheck(v8, @"syscall-unix", v6, a3) == 0;
}

- (BOOL)hasNonEmptyArrayForEntitlement:(id)a3
{
  v3 = [(BMProcess *)self nonnullArrayForEntitlement:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)nonnullArrayForEntitlement:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = [(BMProcess *)self valueForEntitlement:a3];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
    }
    else
    {
      v7[0] = v3;
      id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    }
    long long v5 = v4;
  }
  else
  {
    long long v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (void)_initializeProcessProperties
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 executableName];
  int v5 = 138543618;
  unsigned int v6 = v4;
  __int16 v7 = 1024;
  int v8 = [a1 pid];
  _os_log_error_impl(&dword_1B30A0000, a2, OS_LOG_TYPE_ERROR, "Warning: Not trusting process %{public}@(%d)", (uint8_t *)&v5, 0x12u);
}

- (id)stringForEntitlement:(id)a3
{
  v3 = [(BMProcess *)self valueForEntitlement:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)nonnullSetOfStringsForEntitlement:(id)a3
{
  v3 = [(BMProcess *)self valueForEntitlement:a3];
  id v4 = BMNonnullSetOfStringsFromEntitlementValue(v3);

  return v4;
}

- (void)cacheValuesForEntitlements:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  os_unfair_lock_t lock = &self->_entitlementCacheLock;
  os_unfair_lock_lock(&self->_entitlementCacheLock);
  uint64_t v5 = xpc_copy_entitlement_for_token();
  unsigned int v6 = (void *)v5;
  if (!v5 || MEMORY[0x1B3EB6010](v5) == MEMORY[0x1E4F14590])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    __int16 v7 = v19;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v22;
      obj = v7;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(id *)(*((void *)&v21 + 1) + 8 * i);
          long long v13 = xpc_dictionary_get_value(v6, (const char *)[v12 UTF8String]);
          if (v13 && (uint64_t v14 = _CFXPCCreateCFObjectFromXPCObject(), (v15 = (void *)v14) != 0))
          {
            int v16 = 0;
            v17 = (void *)v14;
          }
          else
          {
            v3 = [MEMORY[0x1E4F1CA98] null];
            v15 = 0;
            int v16 = 1;
            v17 = v3;
          }
          [(NSMutableDictionary *)self->_entitlementCache setObject:v17 forKeyedSubscript:v12];
          if (v16) {
        }
          }
        __int16 v7 = obj;
        uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v30 count:16];
      }
      while (v9);
    }
  }
  else
  {
    __int16 v7 = __biome_log_for_category(6);
    *(void *)buf = 0;
    v27 = buf;
    uint64_t v28 = 0x2020000000;
    char v29 = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__BMProcess_cacheValuesForEntitlements___block_invoke;
    block[3] = &unk_1E60229E8;
    block[4] = buf;
    if (cacheValuesForEntitlements__onceToken != -1) {
      dispatch_once(&cacheValuesForEntitlements__onceToken, block);
    }
    os_log_type_t v8 = v27[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v7, v8))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B30A0000, v7, v8, "Failed to cache entitlements", buf, 2u);
    }
  }

  os_unfair_lock_unlock(lock);
}

- (id)valueForEntitlement:(id)a3
{
  id v4 = a3;
  p_entitlementCacheLock = &self->_entitlementCacheLock;
  os_unfair_lock_lock(&self->_entitlementCacheLock);
  unsigned int v6 = [(NSMutableDictionary *)self->_entitlementCache objectForKeyedSubscript:v4];
  if (v6)
  {
    __int16 v7 = [MEMORY[0x1E4F1CA98] null];
    if (v6 == v7) {
      os_log_type_t v8 = 0;
    }
    else {
      os_log_type_t v8 = v6;
    }
  }
  else
  {
    id v9 = v4;
    [v9 UTF8String];
    __int16 v7 = (void *)xpc_copy_entitlement_for_token();
    if (v7 && (uint64_t v10 = _CFXPCCreateCFObjectFromXPCObject(), (v8 = (void *)v10) != 0))
    {
      int v11 = 0;
      id v12 = (void *)v10;
    }
    else
    {
      id v12 = [MEMORY[0x1E4F1CA98] null];
      os_log_type_t v8 = 0;
      int v11 = 1;
    }
    [(NSMutableDictionary *)self->_entitlementCache setObject:v12 forKeyedSubscript:v9];
    if (v11) {

    }
    unsigned int v6 = v8;
  }
  id v13 = v8;

  os_unfair_lock_unlock(p_entitlementCacheLock);
  return v13;
}

- (BOOL)hasNonEmptyDictionaryForEntitlement:(id)a3
{
  v3 = [(BMProcess *)self dictionaryForEntitlement:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)dictionaryForEntitlement:(id)a3
{
  v3 = [(BMProcess *)self valueForEntitlement:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (BMProcess)initWithAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  v7[0] = *(_OWORD *)a3->var0;
  v7[1] = v3;
  id v4 = [(BMProcess *)self _initWithAuditToken:v7];
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1B3EB5880]();
    [(BMProcess *)v4 _initializeProcessProperties];
  }
  return v4;
}

- (id)_initWithAuditToken:(id *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)BMProcess;
  id v4 = [(BMProcess *)&v13 init];
  uint64_t v5 = v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)a3->var0;
    *(_OWORD *)(v4 + 24) = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)(v4 + 8) = v6;
    *((_DWORD *)v4 + 12) = 0;
    uint64_t v7 = objc_opt_new();
    os_log_type_t v8 = (void *)v5[7];
    v5[7] = v7;

    *((_DWORD *)v5 + 16) = 0;
    id v9 = (void *)v5[9];
    v5[9] = 0;

    *((_DWORD *)v5 + 20) = 0;
    uint64_t v10 = objc_opt_new();
    int v11 = (void *)v5[11];
    v5[11] = v10;

    v5[13] = 0;
  }
  return v5;
}

- (BOOL)_canTrustApplicationIdentifierEntitlement
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_machLookupCache, 0);
  objc_storeStrong((id *)&self->_reliesOnCoreDuetAccess, 0);
  objc_storeStrong((id *)&self->_entitlementCache, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
}

- (BOOL)canPerformFileOperation:(id)a3 onPath:(id)a4 report:(BOOL)a5
{
  long long v6 = *(_OWORD *)&self->_auditToken.val[4];
  if (a5) {
    unsigned int v7 = 1;
  }
  else {
    unsigned int v7 = *MEMORY[0x1E4F14100] | 1;
  }
  v9[0] = *(_OWORD *)self->_auditToken.val;
  v9[1] = v6;
  return BMSandboxCheck(v9, a3, v7, a4) == 0;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (BOOL)isSandboxed
{
  long long v2 = *(_OWORD *)&self->_auditToken.val[4];
  v4[0] = *(_OWORD *)self->_auditToken.val;
  v4[1] = v2;
  return BMSandboxCheck(v4, 0, 0, 0) != 0;
}

- (unsigned)uid
{
  return self->_uid;
}

void __20__BMProcess_current__block_invoke()
{
  *(_OWORD *)task_info_out = 0u;
  long long v7 = 0u;
  mach_msg_type_number_t task_info_outCnt = 8;
  if (task_info(*MEMORY[0x1E4F14960], 0xFu, task_info_out, &task_info_outCnt))
  {
    v0 = __biome_log_for_category(0);
    if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
      __20__BMProcess_current__block_invoke_cold_1();
    }

    uint64_t v1 = 0;
  }
  else
  {
    long long v2 = [BMProcessCurrent alloc];
    v4[0] = *(_OWORD *)task_info_out;
    v4[1] = v7;
    uint64_t v1 = [(BMProcess *)v2 initWithAuditToken:v4];
  }
  long long v3 = (void *)current_instance;
  current_instance = v1;
}

- (BMProcess)init
{
  long long v3 = __biome_log_for_category(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BMProcess init]();
  }

  return 0;
}

- (NSSet)useCases
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v32[0] = @"com.apple.private.intelligenceplatform.use-cases";
  long long v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  if (os_variant_allows_internal_security_policies())
  {
    uint64_t v31 = @"com.apple.internal.intelligenceplatform.use-cases";
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    uint64_t v5 = [v3 arrayByAddingObjectsFromArray:v4];

    long long v3 = (void *)v5;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        int v11 = [(BMProcess *)self dictionaryForEntitlement:v10];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v22;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v22 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [v2 addObject:v16];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v13);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  v17 = (void *)[v2 copy];
  return (NSSet *)v17;
}

uint64_t __40__BMProcess_cacheValuesForEntitlements___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (BOOL)hasDatavaultEntitlement
{
  return [(BMProcess *)self BOOLForEntitlement:@"com.apple.private.security.storage.Biome"];
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMProcess *)self executableName];
  uint64_t v5 = (void *)[v3 initWithFormat:@"<BMProcess %@(%d) %@>", v4, self->_pid, self->_identifier];

  return v5;
}

void __20__BMProcess_current__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_1B30A0000, v0, v1, "Failed to get audit token of self", v2, v3, v4, v5, v6);
}

- (void)init
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_1B30A0000, v0, v1, "BMProcess requires an audit token!", v2, v3, v4, v5, v6);
}

- (void)canPerformGlobalMachLookup:report:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_1B30A0000, v0, OS_LOG_TYPE_ERROR, "Skipping sandbox check, but cached value is an error", v1, 2u);
}

@end