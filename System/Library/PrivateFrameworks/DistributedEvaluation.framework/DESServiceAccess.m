@interface DESServiceAccess
+ (BOOL)hasMLRCtlEntitlement:(id)a3;
+ (BOOL)hasOnDemandLaunchEntitlement:(id)a3;
+ (BOOL)hasRecordAccessToBundleId:(id)a3 connection:(id)a4 error:(id *)a5;
+ (BOOL)hasToolEntitlement:(id)a3;
@end

@implementation DESServiceAccess

+ (BOOL)hasToolEntitlement:(id)a3
{
  if (!a3) {
    return 1;
  }
  v3 = [a3 valueForEntitlement:@"com.apple.private.des_tool"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)hasRecordAccessToBundleId:(id)a3 connection:(id)a4 error:(id *)a5
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v8)
  {
    if (a5)
    {
      v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F281F8];
      uint64_t v32 = *MEMORY[0x1E4F28568];
      v33[0] = @"The connection does not exist";
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
      v15 = v12;
      uint64_t v16 = v13;
      uint64_t v17 = 4099;
LABEL_13:
      [v15 errorWithDomain:v16 code:v17 userInfo:v14];
      BOOL v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

      goto LABEL_22;
    }
LABEL_14:
    BOOL v11 = 0;
    goto LABEL_22;
  }
  int v10 = [v8 processIdentifier];
  if (v10 != getpid())
  {
    v18 = +[DESBundleRegistry sharedInstance];
    char v19 = [v18 containsBundleId:v7];

    if (v19)
    {
      v14 = [@"com.apple.private.DistributedEvaluation.RecordAccess-" stringByAppendingString:v7];
      v20 = [v9 valueForEntitlement:v14];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && ([v20 BOOLValue] & 1) != 0
        || +[DESServiceAccess hasToolEntitlement:v9])
      {
        BOOL v11 = 1;
      }
      else
      {
        if (a5)
        {
          v23 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v24 = *MEMORY[0x1E4F281F8];
          uint64_t v28 = *MEMORY[0x1E4F28568];
          v29 = @"Missing entitlement; programmer error!";
          v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
          *a5 = [v23 errorWithDomain:v24 code:3328 userInfo:v25];
        }
        v26 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          +[DESServiceAccess hasRecordAccessToBundleId:connection:error:]((uint64_t)v7, v26);
        }

        BOOL v11 = 0;
      }

      goto LABEL_21;
    }
    if (a5)
    {
      v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F281F8];
      uint64_t v30 = *MEMORY[0x1E4F28568];
      v31 = @"Fail to locate plugin.";
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      v15 = v21;
      uint64_t v16 = v22;
      uint64_t v17 = 3328;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  BOOL v11 = 1;
LABEL_22:

  return v11;
}

+ (BOOL)hasMLRCtlEntitlement:(id)a3
{
  v3 = [a3 valueForEntitlement:@"com.apple.mlruntime.mlrctl"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)hasOnDemandLaunchEntitlement:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([a1 hasMLRCtlEntitlement:v4])
  {
    v5 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      +[DESServiceAccess hasOnDemandLaunchEntitlement:](v5);
    }
    BOOL v6 = 1;
  }
  else
  {
    v5 = [v4 valueForEntitlement:@"com.apple.mlruntime.host.ondemandplugin"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [MEMORY[0x1E4F28B50] mainBundle];
      id v8 = [v7 bundleIdentifier];

      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      v9 = v5;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && (-[NSObject isEqualToString:](v8, "isEqualToString:", v14, (void)v16) & 1) != 0)
            {
              BOOL v6 = 1;
              goto LABEL_22;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      v9 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[DESServiceAccess hasOnDemandLaunchEntitlement:]((uint64_t)v8, v9);
      }
      BOOL v6 = 0;
LABEL_22:
    }
    else
    {
      id v8 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[DESServiceAccess hasOnDemandLaunchEntitlement:](v8);
      }
      BOOL v6 = 0;
    }
  }
  return v6;
}

+ (void)hasRecordAccessToBundleId:(uint64_t)a1 connection:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BECCB000, a2, OS_LOG_TYPE_ERROR, "No record access to the bundle=%@", (uint8_t *)&v2, 0xCu);
}

+ (void)hasOnDemandLaunchEntitlement:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  int v2 = @"com.apple.mlruntime.host.ondemandplugin";
  _os_log_debug_impl(&dword_1BECCB000, log, OS_LOG_TYPE_DEBUG, "Bypass check for %@ for internal tool", (uint8_t *)&v1, 0xCu);
}

+ (void)hasOnDemandLaunchEntitlement:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = @"com.apple.mlruntime.host.ondemandplugin";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1BECCB000, a2, OS_LOG_TYPE_ERROR, "Missing element in key=%@ with expected value=%@", (uint8_t *)&v2, 0x16u);
}

+ (void)hasOnDemandLaunchEntitlement:(os_log_t)log .cold.3(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  int v2 = @"com.apple.mlruntime.host.ondemandplugin";
  _os_log_error_impl(&dword_1BECCB000, log, OS_LOG_TYPE_ERROR, "Missing key=%@ or wrong type", (uint8_t *)&v1, 0xCu);
}

@end