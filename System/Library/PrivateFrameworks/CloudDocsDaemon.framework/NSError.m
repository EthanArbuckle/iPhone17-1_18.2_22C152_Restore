@interface NSError
@end

@implementation NSError

void __35__NSError_BRCAdditions__initialize__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel_description);
  v2 = class_getInstanceMethod(v0, sel_brc_description);
  method_exchangeImplementations(InstanceMethod, v2);
}

uint64_t __63__NSError_BRCSyncOperationThrottle__brc_syncOperationErrorKind__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "brc_isCloudKitErrorConsideredAsSuccessForZoneThrottle");
  if (result) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -1;
  }
  return result;
}

uint64_t __74__NSError_BRCAdditions__brc_containerResetErrorForSharedZone_resetReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F592A8]];

  if (v5)
  {
    if ([v3 code] == 18)
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
      if (*(void *)(v6 + 24) <= 1uLL)
      {
        *(void *)(v6 + 24) = 2;
        if (*(void *)(a1 + 40))
        {
          v7 = NSString;
          v8 = "BRErrorNeedsReset";
LABEL_6:
          uint64_t v9 = [v7 stringWithUTF8String:v8];
          v10 = *(void ***)(a1 + 40);
          v11 = *v10;
          *v10 = (void *)v9;

          goto LABEL_40;
        }
      }
    }
    goto LABEL_40;
  }
  v12 = [v3 domain];
  int v13 = [v12 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (!v13) {
    goto LABEL_40;
  }
  if ([v3 code] == 21)
  {
    v14 = [v3 userInfo];
    v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    v16 = [v15 domain];
    if ([v16 isEqualToString:*MEMORY[0x1E4F19CA0]])
    {
      uint64_t v17 = [v15 code];

      if (v17 == 2026)
      {
        v18 = brc_bread_crumbs();
        v19 = brc_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          __74__NSError_BRCAdditions__brc_containerResetErrorForSharedZone_resetReason___block_invoke_cold_1();
        }

        uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 8);
        if (*(void *)(v20 + 24) > 1uLL) {
          goto LABEL_30;
        }
        *(void *)(v20 + 24) = 2;
        if (!*(void *)(a1 + 40)) {
          goto LABEL_30;
        }
        v21 = NSString;
        v22 = "CKErrorInternalContainerReset";
LABEL_29:
        uint64_t v30 = [v21 stringWithUTF8String:v22];
        v31 = *(void ***)(a1 + 40);
        v32 = *v31;
        *v31 = (void *)v30;

LABEL_30:
        goto LABEL_40;
      }
    }
    else
    {
    }
    v27 = brc_bread_crumbs();
    v28 = brc_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      __74__NSError_BRCAdditions__brc_containerResetErrorForSharedZone_resetReason___block_invoke_cold_2();
    }

    uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(void *)(v29 + 24) > 1uLL) {
      goto LABEL_30;
    }
    *(void *)(v29 + 24) = 2;
    if (!*(void *)(a1 + 40)) {
      goto LABEL_30;
    }
    v21 = NSString;
    v22 = "CKErrorChangeTokenExpired";
    goto LABEL_29;
  }
  if ([v3 code] == 26)
  {
    v23 = brc_bread_crumbs();
    v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      __74__NSError_BRCAdditions__brc_containerResetErrorForSharedZone_resetReason___block_invoke_cold_3();
    }

    uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 8);
    unint64_t v26 = *(void *)(v25 + 24);
    if (*(unsigned char *)(a1 + 48))
    {
      if (v26 <= 2)
      {
        *(void *)(v25 + 24) = 3;
        if (*(void *)(a1 + 40))
        {
          v7 = NSString;
          v8 = "CKErrorSharedZoneNotFound";
          goto LABEL_6;
        }
      }
    }
    else if (v26 <= 1)
    {
      *(void *)(v25 + 24) = 2;
      if (*(void *)(a1 + 40))
      {
        v7 = NSString;
        v8 = "CKErrorZoneNotFound";
        goto LABEL_6;
      }
    }
  }
  else if ([v3 code] == 28)
  {
    v33 = brc_bread_crumbs();
    v34 = brc_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      __74__NSError_BRCAdditions__brc_containerResetErrorForSharedZone_resetReason___block_invoke_cold_4();
    }

    uint64_t v35 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(void *)(v35 + 24) <= 2uLL)
    {
      *(void *)(v35 + 24) = 3;
      if (*(void *)(a1 + 40))
      {
        v7 = NSString;
        v8 = "CKErrorUserDeletedZone";
        goto LABEL_6;
      }
    }
  }
LABEL_40:

  return 0;
}

uint64_t __40__NSError_BRCAdditions__brc_isRetriable__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 domain];
  if (([v3 isEqualToString:*MEMORY[0x1E4F281F8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F289A0]] & 1) != 0)
  {
LABEL_3:
    uint64_t v4 = 1;
    goto LABEL_4;
  }
  if (![v3 isEqualToString:*MEMORY[0x1E4F19C40]])
  {
    if ([v3 isEqualToString:*MEMORY[0x1E4F592A8]])
    {
LABEL_9:
      uint64_t v4 = 0;
      goto LABEL_4;
    }
    if (([v3 isEqualToString:*MEMORY[0x1E4F59368]] & 1) == 0)
    {
      v7 = brc_bread_crumbs();
      v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __40__NSError_BRCAdditions__brc_isRetriable__block_invoke_cold_1();
      }
    }
    goto LABEL_3;
  }
  uint64_t v6 = [v2 code];
  uint64_t v4 = 1;
  switch(v6)
  {
    case 10:
    case 15:
    case 16:
    case 17:
      goto LABEL_9;
    case 11:
      uint64_t v4 = objc_msgSend(v2, "_brc_isCloudKitInternalErrorCode:", 2003) ^ 1;
      break;
    case 12:
    case 13:
    case 14:
      break;
    default:
      uint64_t v4 = v6 != 1 && v6 != 25;
      break;
  }
LABEL_4:

  return v4;
}

uint64_t __55__NSError_BRCAdditions__brc_containsCloudKitErrorCode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_brc_isCloudKitErrorCode:", *(void *)(a1 + 32));
}

uint64_t __63__NSError_BRCAdditions__brc_containsCloudKitInternalErrorCode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_brc_isCloudKitInternalErrorCode:", *(void *)(a1 + 32));
}

uint64_t __54__NSError_BRCAdditions__brc_isRetriableForPCSChaining__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ((objc_msgSend(v2, "_brc_isCloudKitErrorCode:", 11) & 1) != 0
    || (objc_msgSend(v2, "_brc_isCloudKitInternalErrorCode:", 2041) & 1) != 0)
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = objc_msgSend(v2, "_brc_isCloudKitInternalErrorCode:", 2044);
  }

  return v3;
}

uint64_t __46__NSError_BRCAdditions__brc_isOutOfSpaceError__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 domain];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F281F8]];

  if (v4)
  {
    BOOL v5 = [v2 code] == 640;
    goto LABEL_6;
  }
  uint64_t v6 = [v2 domain];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F28798]];

  if (!v7)
  {
    if (([v2 isSqliteErrorCode:13] & 1) == 0)
    {
      if (![v2 isSqliteErrorCode:10]
        || ([v2 userInfo],
            uint64_t v9 = objc_claimAutoreleasedReturnValue(),
            [v9 objectForKeyedSubscript:@"SqliteExtendedCode"],
            v10 = objc_claimAutoreleasedReturnValue(),
            uint64_t v11 = [v10 longLongValue],
            v10,
            v9,
            (v11 & 0xFFFFFFFFFFFFFEFFLL) != 0x120A))
      {
        uint64_t v8 = 0;
        goto LABEL_14;
      }
    }
    goto LABEL_12;
  }
  if ([v2 code] == 28)
  {
LABEL_12:
    uint64_t v8 = 1;
    goto LABEL_14;
  }
  BOOL v5 = [v2 code] == 69;
LABEL_6:
  uint64_t v8 = v5;
LABEL_14:

  return v8;
}

uint64_t __67__NSError_BRCAdditions__brc_isCloudKitErrorZoneUndergoingMigration__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_brc_isCloudKitPluginErrorCode:", 3);
}

uint64_t __56__NSError_BRCAdditions__brc_isCloudKitErrorZoneMigrated__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_brc_isCloudKitPluginErrorCode:", 4);
}

uint64_t __56__NSError_BRCAdditions__brc_isCloudKitErrorNeedsPCSPrep__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_brc_isCloudKitPluginErrorCode:", 5);
}

void __42__NSError_BRCAdditions__brc_strippedError__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v9 recordName];
  }
  else
  {
    uint64_t v6 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v9 zoneName];

    uint64_t v6 = (void *)v7;
  }
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v5, "brc_isCloudKitAtomicFailure") & 1) == 0)
    {
      uint64_t v8 = objc_msgSend(v5, "brc_strippedError");
      [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v6];
    }
  }
}

void __42__NSError_BRCAdditions__brc_strippedError__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = objc_msgSend(v5, "brc_strippedError");
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
    }
  }
}

void __68__NSError_BRCAdditions__brc_telemetryReportableErrorWithRecordName___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v7 = a3;
  if ((objc_msgSend(v7, "brc_isCloudKitAtomicFailure") & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [v11 recordName];
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      *a4 = 1;
    }
  }
}

void __74__NSError_BRCAdditions__brc_containerResetErrorForSharedZone_resetReason___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Server container was reset, we need to reset ourselves%@", v2, v3, v4, v5, v6);
}

void __74__NSError_BRCAdditions__brc_containerResetErrorForSharedZone_resetReason___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Server change token expired, we need to reset ourselves%@", v2, v3, v4, v5, v6);
}

void __74__NSError_BRCAdditions__brc_containerResetErrorForSharedZone_resetReason___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Server container was reset, zone not found, we need to reset ourselves%@", v2, v3, v4, v5, v6);
}

void __74__NSError_BRCAdditions__brc_containerResetErrorForSharedZone_resetReason___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Server container was reset, user deleted zone, we need to reset ourselves%@", v2, v3, v4, v5, v6);
}

void __40__NSError_BRCAdditions__brc_isRetriable__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] unknown error domain: %@, we should retry%@");
}

@end