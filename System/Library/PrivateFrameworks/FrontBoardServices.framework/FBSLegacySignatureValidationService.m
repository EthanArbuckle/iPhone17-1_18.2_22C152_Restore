@interface FBSLegacySignatureValidationService
- (BOOL)_workQueue_signatureNeedsExplicitUserTrust;
- (FBSLegacySignatureValidationService)initWithApplicationInfo:(id)a3 andProvisioningProfiles:(id)a4 isManaged:(BOOL)a5;
- (id)_workQueue_expirationDateForProvisioningProfile;
- (unint64_t)trustStateForApplication:(id)a3;
- (void)_initializeProfiles:(id)a3;
@end

@implementation FBSLegacySignatureValidationService

- (FBSLegacySignatureValidationService)initWithApplicationInfo:(id)a3 andProvisioningProfiles:(id)a4 isManaged:(BOOL)a5
{
  id v10 = a3;
  id v11 = a4;
  if (!v10)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"appInfo"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSLegacySignatureValidationService initWithApplicationInfo:andProvisioningProfiles:isManaged:](a2, (uint64_t)self, (uint64_t)v16);
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
  }
  v12 = v11;
  v17.receiver = self;
  v17.super_class = (Class)FBSLegacySignatureValidationService;
  v13 = [(FBSLegacySignatureValidationService *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_appInfo, a3);
    v14->_isManaged = a5;
    [(FBSLegacySignatureValidationService *)v14 _initializeProfiles:v12];
    BSDispatchQueueCreateSerial();
  }

  return 0;
}

- (unint64_t)trustStateForApplication:(id)a3
{
  v5 = (FBSApplicationInfo *)a3;
  if (self->_appInfo != v5)
  {
    id v10 = [NSString stringWithFormat:@"App info objects must match or we've done something wrong."];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(FBSLegacySignatureValidationService *)a2 trustStateForApplication:(uint64_t)v10];
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
  }
  v6 = v5;
  kdebug_trace();
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 8;
  workQueue = self->_workQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__FBSLegacySignatureValidationService_trustStateForApplication___block_invoke;
  v11[3] = &unk_1E58F5230;
  v11[4] = self;
  v11[5] = &v12;
  dispatch_sync(workQueue, v11);
  kdebug_trace();
  unint64_t v8 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __64__FBSLegacySignatureValidationService_trustStateForApplication___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) type];
  int v3 = [*(id *)(*(void *)(a1 + 32) + 8) isBeta];
  if (v2 == 1)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 8;
    return;
  }
  int v4 = v3;
  v5 = [*(id *)(*(void *)(a1 + 32) + 8) signerIdentity];

  if (v5)
  {
    char v6 = [*(id *)(*(void *)(a1 + 32) + 8) isProvisioningProfileValidated];
    v7 = *(id **)(a1 + 32);
    if (v6)
    {
      unint64_t v8 = [v7 _workQueue_expirationDateForProvisioningProfile];
      v9 = [*(id *)(*(void *)(a1 + 32) + 8) bundleURL];
      id v10 = [v9 path];

      if (v10)
      {
        uint64_t v11 = soft_MISAppApprovalState((uint64_t)v10, 0);
        if (v11 == 4)
        {
          uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v13 = 2;
LABEL_28:
          *(void *)(v12 + 24) = v13;
          goto LABEL_29;
        }
      }
      else
      {
        uint64_t v11 = 0;
      }
      if (v8 && ([v8 timeIntervalSinceNow], v16 < 0.0)
        || v4 && ![*(id *)(*(void *)(a1 + 32) + 24) count])
      {
        uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v13 = 3;
        goto LABEL_28;
      }
      objc_super v17 = *(unsigned char **)(a1 + 32);
      if (v17[16] || v17[17])
      {
        if (v11 == 3) {
          goto LABEL_29;
        }
        if (v11)
        {
          *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 7;
          if (v11 == 1)
          {
            v32 = v8;
            *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 6;
            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            id v23 = *(id *)(*(void *)(a1 + 32) + 24);
            uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v41 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v36;
              do
              {
                for (uint64_t i = 0; i != v25; ++i)
                {
                  if (*(void *)v36 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  v28 = *(void **)(*((void *)&v35 + 1) + 8 * i);
                  if ([v28 provisionsAllDevices] == YES) {
                    || [v28 isFreeDeveloperProfile])
                  {
                    v29 = [v28 UUID];
                    v30 = dispatch_get_global_queue(0, 0);
                    v33[0] = MEMORY[0x1E4F143A8];
                    v33[1] = 3221225472;
                    v33[2] = __64__FBSLegacySignatureValidationService_trustStateForApplication___block_invoke_2;
                    v33[3] = &unk_1E58F7608;
                    id v34 = v29;
                    id v31 = v29;
                    soft_MISValidateUPP((uint64_t)v31, v30, v33);
                  }
                }
                uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v41 count:16];
              }
              while (v25);
            }

            unint64_t v8 = v32;
          }
          goto LABEL_29;
        }
      }
      else if (v4)
      {
        uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v13 = 8;
        goto LABEL_28;
      }
      if ([v17 _workQueue_signatureNeedsExplicitUserTrust])
      {
        uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v13 = 7;
        goto LABEL_28;
      }
LABEL_29:

      goto LABEL_30;
    }
    uint64_t v14 = [v7[1] cachedCDHashInfo];
    unint64_t v8 = v14;
    if (v14)
    {
      if (soft_MISQueryBlacklistForCdHash([v14 cachedCodeDirectoryHash], [v14 cachedCodeDirectoryHashType], 1, 0, 0))
      {
LABEL_10:
        uint64_t v15 = 2;
LABEL_26:
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v15;
LABEL_30:

        return;
      }
    }
    else
    {
      unsigned int v40 = 26;
      v39 = 0;
      v18 = [*(id *)(*(void *)(a1 + 32) + 8) bundleURL];
      char v19 = soft_MISQueryBlacklistForBundle([v18 path], 0, 1, 0, (uint64_t)&v39, (uint64_t)&v40, 0);

      v20 = v39;
      if (v39)
      {
        v21 = *(void **)(*(void *)(a1 + 32) + 8);
        v22 = +[_FBSCDHashCacheInfo cacheInfoWithData:v39 hashType:v40];
        [v21 setCachedCDHashInfo:v22];
      }
      if (v19) {
        goto LABEL_10;
      }
    }
    uint64_t v15 = 8;
    goto LABEL_26;
  }
}

void __64__FBSLegacySignatureValidationService_trustStateForApplication___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v5 = FBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __64__FBSLegacySignatureValidationService_trustStateForApplication___block_invoke_2_cold_1(a1, a3, v5);
    }
  }
}

- (void)_initializeProfiles:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (([v11 isAppleInternalProfile] & 1) == 0)
        {
          int v12 = [(FBSApplicationInfo *)self->_appInfo isBeta];
          if (v12 != [v11 isBeta]) {
            continue;
          }
          uint64_t v13 = [(FBSApplicationInfo *)self->_appInfo _appIDEntitlement];
          int v14 = [v11 allowsApplicationIdentifierEntitlement:v13];

          if (!v14) {
            continue;
          }
        }
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v8);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v5;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    int v18 = 0;
    int v19 = 0;
    uint64_t v20 = *(void *)v26;
    while (2)
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v15);
        }
        v22 = *(void **)(*((void *)&v25 + 1) + 8 * j);
        v18 |= [v22 provisionsAllDevices:v25];
        v19 |= [v22 isFreeDeveloperProfile];
        if (v18 & 1) != 0 && (v19)
        {
          LOBYTE(v18) = 1;
          LOBYTE(v19) = 1;
          goto LABEL_24;
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
  else
  {
    LOBYTE(v18) = 0;
    LOBYTE(v19) = 0;
  }
LABEL_24:

  id v23 = (NSArray *)[v6 copy];
  provisioningProfiles = self->_provisioningProfiles;
  self->_provisioningProfiles = v23;

  self->_hasUniversalProvisioningProfile = v18 & 1;
  self->_hasFreeDeveloperProvisioningProfile = v19 & 1;
}

- (id)_workQueue_expirationDateForProvisioningProfile
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (![(FBSApplicationInfo *)self->_appInfo isProvisioningProfileValidated]) {
    goto LABEL_20;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v3 = self->_provisioningProfiles;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v4)
  {
    id v6 = v3;
LABEL_19:

LABEL_20:
    id v6 = 0;
    goto LABEL_21;
  }
  uint64_t v5 = v4;
  id v6 = 0;
  uint64_t v7 = *(void *)v16;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v3);
      }
      uint64_t v9 = [*(id *)(*((void *)&v15 + 1) + 8 * i) expirationDate:v15];
      if (v9)
      {
        if (v6) {
          goto LABEL_11;
        }
      }
      else
      {
        uint64_t v9 = [MEMORY[0x1E4F1C9C8] distantFuture];
        if (v6)
        {
LABEL_11:
          [v9 timeIntervalSinceDate:v6];
          if (v10 <= 0.0) {
            goto LABEL_13;
          }
        }
      }
      uint64_t v11 = v9;

      id v6 = v11;
LABEL_13:
    }
    uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v5);

  if (v6)
  {
    int v12 = [MEMORY[0x1E4F1C9C8] distantFuture];
    int v13 = [(NSArray *)v6 isEqual:v12];

    if (v13) {
      goto LABEL_19;
    }
  }
LABEL_21:

  return v6;
}

- (BOOL)_workQueue_signatureNeedsExplicitUserTrust
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (![(FBSApplicationInfo *)self->_appInfo isProvisioningProfileValidated]
    || self->_isManaged)
  {
    return 0;
  }
  uint64_t v5 = [getMCProfileConnectionClass() sharedConnection];
  id v6 = [v5 trustedCodeSigningIdentities];

  uint64_t v7 = [(FBSApplicationInfo *)self->_appInfo signerIdentity];
  char v8 = [v6 containsObject:v7];

  if (v8)
  {
    BOOL v3 = 0;
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v9 = self->_provisioningProfiles;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          int v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v14 provisionsAllDevices:v15] == YES) {
            || ([v14 isFreeDeveloperProfile] & 1) != 0)
          {
            BOOL v3 = 1;
            goto LABEL_19;
          }
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        BOOL v3 = 0;
        if (v11) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v3 = 0;
    }
LABEL_19:
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_provisioningProfiles, 0);

  objc_storeStrong((id *)&self->_appInfo, 0);
}

- (void)initWithApplicationInfo:(const char *)a1 andProvisioningProfiles:(uint64_t)a2 isManaged:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  OUTLINED_FUNCTION_0_1();
  uint64_t v10 = a2;
  __int16 v11 = v8;
  uint64_t v12 = @"FBSLegacySignatureValidationService.m";
  __int16 v13 = 1024;
  int v14 = 33;
  __int16 v15 = v8;
  uint64_t v16 = a3;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v9, 0x3Au);
}

- (void)trustStateForApplication:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  OUTLINED_FUNCTION_0_1();
  uint64_t v10 = a2;
  __int16 v11 = v8;
  uint64_t v12 = @"FBSLegacySignatureValidationService.m";
  __int16 v13 = 1024;
  int v14 = 49;
  __int16 v15 = v8;
  uint64_t v16 = a3;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v9, 0x3Au);
}

void __64__FBSLegacySignatureValidationService_trustStateForApplication___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_19C680000, log, OS_LOG_TYPE_ERROR, "Failed to verify universal provisioning profile %{public}@ with error %lld", (uint8_t *)&v4, 0x16u);
}

@end