@interface LACClientInfoProvider
+ (BOOL)_isNonUiExtensionPointIdentifier:(id)a3;
+ (BOOL)processId:(int)a3 toAuditToken:(id *)a4;
+ (id)_infoForClientWithApplicationIdentityData:(id)a3;
+ (id)_infoForClientWithAuditToken:(id *)a3;
+ (id)_infoForClientWithAuditTokenData:(id)a3;
+ (id)_infoForClientWithBundleRecord:(id)a3;
+ (id)applicationIdentityDataForProcessId:(int)a3;
+ (id)auditTokenDataForProcessId:(int)a3;
+ (id)infoForXPCClient:(id)a3;
+ (id)infoForXPCClient:(id)a3 evaluationOptions:(id)a4;
@end

@implementation LACClientInfoProvider

+ (id)infoForXPCClient:(id)a3
{
  return (id)[a1 infoForXPCClient:a3 evaluationOptions:0];
}

+ (id)infoForXPCClient:(id)a3 evaluationOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [NSNumber numberWithInteger:1038];
  v9 = [v7 objectForKeyedSubscript:v8];

  v10 = [NSNumber numberWithInteger:1080];
  v11 = [v7 objectForKeyedSubscript:v10];
  char v12 = [v11 integerValue];

  v13 = [NSNumber numberWithInteger:1021];
  uint64_t v14 = [v7 objectForKeyedSubscript:v13];
  if (v14)
  {
    v15 = (void *)v14;
    int v16 = [v6 checkEntitlement:@"com.apple.private.LocalAuthentication.CallerName"];

    if (!v16)
    {
      v17 = 0;
      if (v9) {
        goto LABEL_6;
      }
      goto LABEL_10;
    }
    v13 = [NSNumber numberWithInteger:1021];
    v17 = [v7 objectForKeyedSubscript:v13];
  }
  else
  {
    v17 = 0;
  }

  if (v9)
  {
LABEL_6:
    if ((v12 & 4) != 0) {
      [a1 _infoForClientWithApplicationIdentityData:v9];
    }
    else {
    uint64_t v18 = [a1 _infoForClientWithAuditTokenData:v9];
    }
    goto LABEL_15;
  }
LABEL_10:
  if (v6)
  {
    [v6 auditToken];
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
  }
  uint64_t v18 = [a1 _infoForClientWithAuditToken:&v24];
LABEL_15:
  v19 = (void *)v18;
  if (objc_msgSend(v17, "length", v24, v25))
  {
    v20 = [LACClientInfo alloc];
    v21 = [v19 bundleId];
    uint64_t v22 = [(LACClientInfo *)v20 initWithBundleId:v21 displayName:v17];

    v19 = (void *)v22;
  }

  return v19;
}

+ (id)auditTokenDataForProcessId:(int)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  memset(v9, 0, sizeof(v9));
  if ([a1 processId:*(void *)&a3 toAuditToken:v9])
  {
    [MEMORY[0x263F08D40] value:v9 withObjCType:"{?=[8I]}"];
    NSUInteger sizep = 0;
    id v3 = objc_claimAutoreleasedReturnValue();
    NSGetSizeAndAlignment((const char *)[v3 objCType], &sizep, 0);
    v4 = (char *)&v7 - ((sizep + 15) & 0xFFFFFFFFFFFFFFF0);
    [v3 getValue:v4];
    v5 = [MEMORY[0x263EFF8F8] dataWithBytes:v4 length:sizep];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)applicationIdentityDataForProcessId:(int)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  if ([a1 processId:*(void *)&a3 toAuditToken:&v16])
  {
    id v15 = 0;
    v14[0] = v16;
    v14[1] = v17;
    id v3 = [MEMORY[0x263F01890] bundleRecordForAuditToken:v14 error:&v15];
    id v4 = v15;
    if (v3)
    {
      id v5 = objc_alloc(MEMORY[0x263F01860]);
      id v6 = [v3 bundleIdentifier];
      uint64_t v7 = [v5 initWithBundleIdentifier:v6 URL:0 personaUniqueString:0 personaType:4];

      if (v7)
      {
        id v13 = v4;
        v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v13];
        id v9 = v13;

        if (v8)
        {
          v8 = v8;
          uint64_t v10 = v8;
        }
        else
        {
          v11 = LACLogDefault();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            +[LACClientInfoProvider applicationIdentityDataForProcessId:]();
          }

          uint64_t v10 = 0;
        }
      }
      else
      {
        v8 = LACLogDefault();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          +[LACClientInfoProvider applicationIdentityDataForProcessId:]();
        }
        uint64_t v10 = 0;
        id v9 = v4;
      }

      id v4 = v9;
    }
    else
    {
      uint64_t v7 = LACLogDefault();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[LACClientInfoProvider applicationIdentityDataForProcessId:]();
      }
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

+ (BOOL)processId:(int)a3 toAuditToken:(id *)a4
{
  kern_return_t v8;
  NSObject *v9;
  NSObject *v10;
  mach_msg_type_number_t task_info_outCnt;
  mach_port_name_t tn;

  tn = 0;
  if (task_name_for_pid(*MEMORY[0x263EF8960], a3, &tn))
  {
    id v6 = LACLogDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[LACClientInfoProvider processId:toAuditToken:](a3, v6);
    }

    return 0;
  }
  else
  {
    task_info_outCnt = 8;
    v8 = task_info(tn, 0xFu, (task_info_t)a4, &task_info_outCnt);
    BOOL v7 = v8 == 0;
    id v9 = LACLogDefault();
    uint64_t v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[LACClientInfoProvider processId:toAuditToken:](a3, v10);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      +[LACClientInfoProvider processId:toAuditToken:](a3, v10);
    }
  }
  return v7;
}

+ (id)_infoForClientWithAuditTokenData:(id)a3
{
  if (a3)
  {
    id v4 = objc_msgSend(MEMORY[0x263F08D40], "valueWithBytes:objCType:", objc_msgSend(objc_retainAutorelease(a3), "bytes"), "{?=[8I]}");
    id v5 = v4;
    if (v4)
    {
      long long v11 = 0u;
      long long v12 = 0u;
      [v4 getValue:&v11];
      v10[0] = v11;
      v10[1] = v12;
      uint64_t v6 = [a1 _infoForClientWithAuditToken:v10];
    }
    else
    {
      v8 = LACLogDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[LACClientInfoProvider _infoForClientWithAuditTokenData:](v8);
      }

      uint64_t v6 = +[LACClientInfo emptyClientInfo];
    }
    BOOL v7 = (void *)v6;
  }
  else
  {
    BOOL v7 = +[LACClientInfo emptyClientInfo];
  }
  return v7;
}

+ (id)_infoForClientWithApplicationIdentityData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v16 = 0;
    id v5 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v16];
    id v6 = v16;
    BOOL v7 = v6;
    if (v5)
    {
      id v15 = v6;
      v8 = [v5 findApplicationRecordWithError:&v15];
      id v9 = v15;

      if (v8)
      {
        uint64_t v10 = [a1 _infoForClientWithBundleRecord:v8];
      }
      else
      {
        id v13 = LACLogDefault();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          +[LACClientInfoProvider _infoForClientWithApplicationIdentityData:]();
        }

        uint64_t v10 = +[LACClientInfo emptyClientInfo];
      }
      long long v11 = (void *)v10;

      BOOL v7 = v9;
    }
    else
    {
      long long v12 = LACLogDefault();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[LACClientInfoProvider _infoForClientWithApplicationIdentityData:]();
      }

      long long v11 = +[LACClientInfo emptyClientInfo];
    }
  }
  else
  {
    long long v11 = +[LACClientInfo emptyClientInfo];
  }

  return v11;
}

+ (id)_infoForClientWithAuditToken:(id *)a3
{
  id v12 = 0;
  long long v4 = *(_OWORD *)&a3->var0[4];
  v11[0] = *(_OWORD *)a3->var0;
  v11[1] = v4;
  id v5 = [MEMORY[0x263F01890] bundleRecordForAuditToken:v11 error:&v12];
  id v6 = v12;
  if (v5)
  {
    uint64_t v7 = [a1 _infoForClientWithBundleRecord:v5];
  }
  else
  {
    v8 = LACLogDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[LACClientInfoProvider _infoForClientWithAuditToken:]();
    }

    uint64_t v7 = +[LACClientInfo emptyClientInfo];
  }
  id v9 = (void *)v7;

  return v9;
}

+ (id)_infoForClientWithBundleRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bundleIdentifier];
  if (v4)
  {
    id v6 = [v4 localizedName];
    uint64_t v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v9 = [v4 localizedShortName];
      uint64_t v10 = v9;
      if (v9)
      {
        id v8 = v9;
      }
      else
      {
        uint64_t v11 = [v4 bundleIdentifier];
        id v12 = (void *)v11;
        if (v11) {
          id v13 = (void *)v11;
        }
        else {
          id v13 = v5;
        }
        id v8 = v13;
      }
    }
  }
  else
  {
    id v8 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v4;
    id v15 = v14;
    if (v4)
    {
      id v16 = [v14 extensionPointRecord];
      long long v17 = [v16 identifier];

      if ([v17 isEqualToString:@"com.apple.intents-service"])
      {

        id v5 = @"com.apple.siri";
      }
      if (([a1 _isNonUiExtensionPointIdentifier:v17] & 1) == 0)
      {
        uint64_t v18 = [v15 containingBundleRecord];
        uint64_t v19 = [v18 bundleIdentifier];

        id v8 = (id)v19;
      }
    }
  }
  v20 = [[LACClientInfo alloc] initWithBundleId:v5 displayName:v8];

  return v20;
}

+ (BOOL)_isNonUiExtensionPointIdentifier:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"com.apple.services"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.ctk-tokens"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"com.apple.Safari.web-extension"];
  }

  return v4;
}

+ (void)applicationIdentityDataForProcessId:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_254F14000, v0, v1, "Failed to find LSBundleRecord: %@", v2, v3, v4, v5, v6);
}

+ (void)applicationIdentityDataForProcessId:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_254F14000, v0, v1, "Failed to create LSApplicationIdentity from %@", v2, v3, v4, v5, v6);
}

+ (void)applicationIdentityDataForProcessId:.cold.3()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_254F14000, v0, v1, "Failed to encode %@: %@");
}

+ (void)processId:(int)a1 toAuditToken:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_254F14000, a2, OS_LOG_TYPE_DEBUG, "Successfully acquired audit token for PID %u", (uint8_t *)v2, 8u);
}

+ (void)processId:(int)a1 toAuditToken:(NSObject *)a2 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_254F14000, a2, OS_LOG_TYPE_ERROR, "Failed to get audit token for PID %u", (uint8_t *)v2, 8u);
}

+ (void)processId:(int)a1 toAuditToken:(NSObject *)a2 .cold.3(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_254F14000, a2, OS_LOG_TYPE_ERROR, "Failed to determine task name for PID %u", (uint8_t *)v2, 8u);
}

+ (void)_infoForClientWithAuditTokenData:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_254F14000, log, OS_LOG_TYPE_ERROR, "Unable to get audit token from data", v1, 2u);
}

+ (void)_infoForClientWithApplicationIdentityData:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_254F14000, v0, v1, "Unable to unarchive application identity error: %@", v2, v3, v4, v5, v6);
}

+ (void)_infoForClientWithApplicationIdentityData:.cold.2()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_254F14000, v0, v1, "Unable to find application record for identity: %@ error: %@");
}

+ (void)_infoForClientWithAuditToken:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_254F14000, v0, v1, "Unable to find bundle record for audit token error: %@", v2, v3, v4, v5, v6);
}

@end