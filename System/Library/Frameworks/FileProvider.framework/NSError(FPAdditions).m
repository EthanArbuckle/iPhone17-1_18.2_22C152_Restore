@interface NSError(FPAdditions)
+ (id)_fp_errorWithPOSIXCode:()FPAdditions itemURL:debugDescription:message:;
+ (id)fp_disallowedByManagement:()FPAdditions;
+ (id)fp_errorWithPOSIXCode:()FPAdditions description:;
+ (id)fp_externalDomainRejectedErrorWithUnderlyingError:()FPAdditions;
+ (id)fp_invalidArgumentError:()FPAdditions;
+ (id)fp_translocatedError:()FPAdditions;
+ (uint64_t)fp_errorWithPOSIXCode:()FPAdditions;
+ (uint64_t)fp_errorWithPOSIXCode:()FPAdditions itemURL:debugDescription:;
+ (void)fp_initLocalizationStrings;
- (BOOL)fp_isCocoaErrorCode:()FPAdditions;
- (BOOL)fp_isFeatureUnsupportedError;
- (BOOL)fp_isNameTooLongError;
- (BOOL)fp_isNotPermittedError;
- (BOOL)fp_isPOSIXErrorCode:()FPAdditions;
- (FPErrorRedactionHelper)fp_prettyDescription:()FPAdditions;
- (id)fp_annotatedErrorWithItem:()FPAdditions variant:;
- (id)fp_annotatedErrorWithItems:()FPAdditions variant:;
- (id)fp_annotatedErrorWithName:()FPAdditions path:variant:;
- (id)fp_annotatedErrorWithOperationItem:()FPAdditions;
- (id)fp_annotatedErrorWithRecoveryAttempter:()FPAdditions fpProviderDomainId:;
- (id)fp_annotatedErrorWithURL:()FPAdditions variant:;
- (id)fp_asWarning;
- (id)fp_genericPreflightError;
- (id)fp_internalErrorForVendorErrorWithCallerDescription:()FPAdditions itemCreationBlock:;
- (id)fp_recoverableErrorWithBlock:()FPAdditions fpProviderDomainId:operationService:;
- (id)fp_strippedError;
- (id)fp_unwrappedErrorForDomains:()FPAdditions;
- (id)fp_unwrappedInternalError;
- (id)fp_userInfoFPItem;
- (id)fp_userInfoItem;
- (id)fp_userInfoValueForKey:()FPAdditions;
- (uint64_t)fp_annotatedErrorWithName:()FPAdditions;
- (uint64_t)fp_isFileProviderError:()FPAdditions;
- (uint64_t)fp_isFileProviderInternalError:()FPAdditions;
- (uint64_t)fp_isGenericPreflightError;
- (uint64_t)fp_isRemoteCrashError;
- (uint64_t)fp_isSyncAnchorExpiredError;
- (uint64_t)fp_isWarning;
- (uint64_t)fp_prettyDescription;
@end

@implementation NSError(FPAdditions)

+ (uint64_t)fp_errorWithPOSIXCode:()FPAdditions
{
  return objc_msgSend(a1, "_fp_errorWithPOSIXCode:itemURL:debugDescription:message:", a3, 0, 0, 0);
}

+ (id)_fp_errorWithPOSIXCode:()FPAdditions itemURL:debugDescription:message:
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  objc_msgSend(a1, "fp_initLocalizationStrings");
  v13 = [MEMORY[0x1E4F1CA60] dictionary];
  [v13 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F289D0]];

  [v13 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F28228]];
  if (v10) {
    [v13 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F1D140]];
  }
  v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:a3 userInfo:v13];

  return v14;
}

+ (void)fp_initLocalizationStrings
{
  if (fp_initLocalizationStrings_pred != -1) {
    dispatch_once(&fp_initLocalizationStrings_pred, &__block_literal_global_58);
  }
}

- (uint64_t)fp_isSyncAnchorExpiredError
{
  return objc_msgSend(a1, "fp_isFileProviderError:", -1002);
}

- (uint64_t)fp_isFileProviderError:()FPAdditions
{
  v5 = [a1 domain];
  if ([v5 isEqualToString:@"NSFileProviderErrorDomain"])
  {
    uint64_t v6 = [a1 code];

    if (v6 == a3) {
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

+ (id)fp_errorWithPOSIXCode:()FPAdditions description:
{
  id v11 = (objc_class *)NSString;
  id v12 = a4;
  v13 = (void *)[[v11 alloc] initWithFormat:v12 arguments:&a9];

  v14 = objc_msgSend(a1, "_fp_errorWithPOSIXCode:itemURL:debugDescription:message:", a3, 0, 0, v13);

  return v14;
}

+ (uint64_t)fp_errorWithPOSIXCode:()FPAdditions itemURL:debugDescription:
{
  return objc_msgSend(a1, "_fp_errorWithPOSIXCode:itemURL:debugDescription:message:", a3, a4, a5, 0);
}

+ (id)fp_invalidArgumentError:()FPAdditions
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  objc_msgSend(a1, "fp_initLocalizationStrings");
  id v11 = (void *)[[NSString alloc] initWithFormat:v10 arguments:&a9];

  uint64_t v15 = *MEMORY[0x1E4F1D140];
  v16[0] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v12];

  return v13;
}

+ (id)fp_disallowedByManagement:()FPAdditions
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = *MEMORY[0x1E4F28798];
  uint64_t v10 = *MEMORY[0x1E4F28568];
  v11[0] = a3;
  v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a3;
  v7 = [v5 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8 = [v3 errorWithDomain:v4 code:1 userInfo:v7];

  return v8;
}

+ (id)fp_translocatedError:()FPAdditions
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend(a1, "fp_initLocalizationStrings");
  v5 = [NSString stringWithFormat:@"The executable currently located at %@ is translocated and can't be launched."];
  id v6 = (void *)MEMORY[0x1E4F28C58];
  v20[0] = *MEMORY[0x1E4F28568];
  v14 = FPLoc(@"ExecutableTranslocated", v7, v8, v9, v10, v11, v12, v13, (uint64_t)v4);
  uint64_t v15 = *MEMORY[0x1E4F28228];
  v21[0] = v14;
  v21[1] = v5;
  uint64_t v16 = *MEMORY[0x1E4F289D0];
  v20[1] = v15;
  v20[2] = v16;
  v21[2] = v4;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
  v18 = [v6 errorWithDomain:@"NSFileProviderErrorDomain" code:-2002 userInfo:v17];

  return v18;
}

+ (id)fp_externalDomainRejectedErrorWithUnderlyingError:()FPAdditions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend(a1, "fp_initLocalizationStrings");
  v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28A50];
  v10[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v5 errorWithDomain:@"NSFileProviderInternalErrorDomain" code:23 userInfo:v6];

  return v7;
}

- (uint64_t)fp_isFileProviderInternalError:()FPAdditions
{
  v5 = [a1 domain];
  if ([v5 isEqualToString:@"NSFileProviderInternalErrorDomain"])
  {
    uint64_t v6 = [a1 code];

    if (v6 == a3) {
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

- (BOOL)fp_isCocoaErrorCode:()FPAdditions
{
  v5 = [a1 domain];
  if ([v5 isEqualToString:*MEMORY[0x1E4F281F8]]) {
    BOOL v6 = [a1 code] == a3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)fp_isPOSIXErrorCode:()FPAdditions
{
  v5 = [a1 domain];
  if ([v5 isEqualToString:*MEMORY[0x1E4F28798]]) {
    BOOL v6 = [a1 code] == a3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)fp_strippedError
{
  objc_msgSend(MEMORY[0x1E4F28C58], "fp_initLocalizationStrings");
  v2 = objc_opt_new();
  v3 = [a1 userInfo];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __40__NSError_FPAdditions__fp_strippedError__block_invoke;
  v11[3] = &unk_1E5AF1740;
  id v12 = v2;
  id v4 = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:v11];

  v5 = [a1 localizedDescription];
  [v4 setValue:v5 forKey:*MEMORY[0x1E4F28568]];

  BOOL v6 = [a1 debugDescription];
  [v4 setValue:v6 forKey:*MEMORY[0x1E4F28228]];

  uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = [a1 domain];
  uint64_t v9 = objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, objc_msgSend(a1, "code"), v4);

  return v9;
}

- (id)fp_internalErrorForVendorErrorWithCallerDescription:()FPAdditions itemCreationBlock:
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = a4;
  objc_msgSend(MEMORY[0x1E4F28C58], "fp_initLocalizationStrings");
  uint64_t v8 = [a1 domain];
  uint64_t v9 = fp_current_or_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[NSError(FPAdditions) fp_internalErrorForVendorErrorWithCallerDescription:itemCreationBlock:]((uint64_t)v6, a1, v9);
  }

  if ((objc_msgSend(a1, "fp_isFileProviderError:", -1001) & 1) != 0
    || objc_msgSend(a1, "fp_isFileProviderError:", -1006))
  {
    uint64_t v10 = objc_msgSend(a1, "fp_userInfoItem");
    uint64_t v11 = v10;
    if (!v10)
    {
      uint64_t v13 = fp_current_or_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[NSError(FPAdditions) fp_internalErrorForVendorErrorWithCallerDescription:itemCreationBlock:]((uint64_t)a1, v13, v14, v15, v16, v17, v18, v19);
      }

      v20 = objc_msgSend(a1, "fp_strippedError");
      goto LABEL_20;
    }
    if (v7)
    {
      id v12 = v7[2](v7, v10);
      if ([a1 code] == -1001) {
        [MEMORY[0x1E4F28C58] fileProviderErrorForCollisionWithItem:v12];
      }
      else {
      v20 = [MEMORY[0x1E4F28C58] fileProviderErrorForRejectedDeletionOfItem:v12];
      }

LABEL_20:
      goto LABEL_21;
    }
  }
  if ([v8 isEqualToString:@"Swift.CancellationError"])
  {
    uint64_t v21 = FPUserCancelledError();
LABEL_17:
    v20 = (void *)v21;
    goto LABEL_21;
  }
  v22 = +[FPXPCSanitizer permittedErrorDomains];
  char v23 = [v22 containsObject:v8];

  if (v23)
  {
    uint64_t v21 = objc_msgSend(a1, "fp_strippedError");
    goto LABEL_17;
  }
  __FILEPROVIDER_UNSUPPORTED_ERROR__(v8, [a1 code]);
  v25 = fp_current_or_default_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    -[NSError(FPAdditions) fp_internalErrorForVendorErrorWithCallerDescription:itemCreationBlock:]((uint64_t)a1, v25, v26, v27, v28, v29, v30, v31);
  }

  v32 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v33 = *MEMORY[0x1E4F281F8];
  uint64_t v34 = *MEMORY[0x1E4F28228];
  v39[0] = @"Provider returned unsupported error";
  uint64_t v35 = *MEMORY[0x1E4F28A50];
  v38[0] = v34;
  v38[1] = v35;
  v36 = objc_msgSend(a1, "fp_strippedError");
  v39[1] = v36;
  v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
  v20 = [v32 errorWithDomain:v33 code:4101 userInfo:v37];

LABEL_21:

  return v20;
}

- (id)fp_genericPreflightError
{
  objc_msgSend(MEMORY[0x1E4F28C58], "fp_initLocalizationStrings");
  v2 = [a1 userInfo];
  v3 = (void *)[v2 mutableCopy];

  [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"NSFileProviderErrorIsGenericPreflightError"];
  id v4 = (void *)MEMORY[0x1E4F28C58];
  v5 = [a1 domain];
  id v6 = objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, objc_msgSend(a1, "code"), v3);

  return v6;
}

- (uint64_t)fp_isGenericPreflightError
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"NSFileProviderErrorIsGenericPreflightError"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (id)fp_asWarning
{
  v13[2] = *MEMORY[0x1E4F143B8];
  objc_msgSend(MEMORY[0x1E4F28C58], "fp_initLocalizationStrings");
  v2 = [a1 userInfo];
  uint64_t v3 = (void *)[v2 mutableCopy];

  [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"NSFileProviderErrorIsSoftError"];
  id v4 = [a1 localizedRecoveryOptions];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    id v6 = FPLocalizedErrorStringForKey(@"Preflight-Cancel");
    v13[0] = v6;
    uint64_t v7 = FPLocalizedErrorStringForKey(@"Preflight-Continue");
    v13[1] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28590]];
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = [a1 domain];
  uint64_t v11 = objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, objc_msgSend(a1, "code"), v3);

  return v11;
}

- (uint64_t)fp_isWarning
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"NSFileProviderErrorIsSoftError"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)fp_isRemoteCrashError
{
  v2 = [a1 domain];
  int v3 = [v2 isEqualToString:*MEMORY[0x1E4F281F8]];

  if (!v3) {
    return 0;
  }
  if ([a1 code] == 4099 || objc_msgSend(a1, "code") == 4097) {
    return 1;
  }
  if ([a1 code] != 4101) {
    return 0;
  }
  uint64_t v5 = [a1 userInfo];
  id v6 = [v5 objectForKey:*MEMORY[0x1E4F28A50]];

  if (v6) {
    uint64_t v4 = objc_msgSend(v6, "fp_isRemoteCrashError");
  }
  else {
    uint64_t v4 = 1;
  }

  return v4;
}

- (id)fp_unwrappedErrorForDomains:()FPAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 domain];
  if (![v5 isEqualToString:*MEMORY[0x1E4F281F8]])
  {

    goto LABEL_8;
  }
  uint64_t v6 = [a1 code];

  if (v6 != 4101)
  {
LABEL_8:
    id v11 = a1;
    goto LABEL_9;
  }
  uint64_t v7 = [a1 userInfo];
  uint64_t v8 = [v7 objectForKey:*MEMORY[0x1E4F28A50]];

  if (v8)
  {
    uint64_t v9 = [v8 domain];
    int v10 = [v4 containsObject:v9];

    if (v10) {
      a1 = v8;
    }
  }
  id v11 = a1;

LABEL_9:

  return v11;
}

- (id)fp_unwrappedInternalError
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"NSFileProviderInternalErrorDomain";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  int v3 = objc_msgSend(a1, "fp_unwrappedErrorForDomains:", v2);

  return v3;
}

- (BOOL)fp_isFeatureUnsupportedError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x1E4F281F8]]) {
    BOOL v3 = [a1 code] == 3328;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)fp_isNotPermittedError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x1E4F281F8]]) {
    BOOL v3 = [a1 code] == 257;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)fp_isNameTooLongError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x1E4F28798]]) {
    BOOL v3 = [a1 code] == 63;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)fp_annotatedErrorWithItems:()FPAdditions variant:
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend(MEMORY[0x1E4F28C58], "fp_initLocalizationStrings");
  uint64_t v8 = [a1 userInfo];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"NSFileProviderErrorNonExistentItemIdentifier"];

  if (v9)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__NSError_FPAdditions__fp_annotatedErrorWithItems_variant___block_invoke;
    v14[3] = &unk_1E5AF62E0;
    id v15 = v9;
    uint64_t v10 = [v6 indexOfObjectPassingTest:v14];
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v11 = objc_msgSend(a1, "fp_annotatedErrorWithItem:variant:", 0, v7);
    }
    else
    {
      id v12 = [v6 objectAtIndex:v10];
      id v11 = objc_msgSend(a1, "fp_annotatedErrorWithItem:variant:", v12, v7);
    }
  }
  else
  {
    id v11 = objc_msgSend(a1, "fp_annotatedErrorWithItem:variant:", 0, v7);
  }

  return v11;
}

- (id)fp_annotatedErrorWithName:()FPAdditions path:variant:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_msgSend(MEMORY[0x1E4F28C58], "fp_initLocalizationStrings");
  id v11 = [a1 domain];
  if ([v11 isEqualToString:@"NSFileProviderErrorDomain"])
  {

LABEL_4:
    uint64_t v14 = [a1 userInfo];
    id v15 = (void *)[v14 mutableCopy];

    [v15 setValue:v8 forKey:@"NSFileProviderErrorItemName"];
    [v15 setValue:v10 forKey:@"NSUserStringVariant"];
    [v15 setValue:v9 forKey:*MEMORY[0x1E4F28328]];
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = [a1 domain];
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, objc_msgSend(a1, "code"), v15);
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  id v12 = [a1 domain];
  char v13 = [v12 isEqualToString:*MEMORY[0x1E4F281F8]];

  if (v13) {
    goto LABEL_4;
  }
  id v18 = a1;
LABEL_6:

  return v18;
}

- (uint64_t)fp_annotatedErrorWithName:()FPAdditions
{
  return objc_msgSend(a1, "fp_annotatedErrorWithName:path:variant:", a3, 0, 0);
}

- (id)fp_annotatedErrorWithURL:()FPAdditions variant:
{
  id v13 = 0;
  uint64_t v6 = *MEMORY[0x1E4F1C6C8];
  id v7 = a4;
  id v8 = a3;
  [v8 getPromisedItemResourceValue:&v13 forKey:v6 error:0];
  id v9 = v13;
  id v10 = [v8 path];

  id v11 = objc_msgSend(a1, "fp_annotatedErrorWithName:path:variant:", v9, v10, v7);

  return v11;
}

- (id)fp_annotatedErrorWithItem:()FPAdditions variant:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 displayName];
  id v9 = [v7 filename];

  id v10 = objc_msgSend(a1, "fp_annotatedErrorWithName:path:variant:", v8, v9, v6);

  return v10;
}

- (id)fp_annotatedErrorWithRecoveryAttempter:()FPAdditions fpProviderDomainId:
{
  id v4 = (void *)MEMORY[0x1E4F28C58];
  id v5 = a3;
  objc_msgSend(v4, "fp_initLocalizationStrings");
  id v6 = [a1 userInfo];
  id v7 = (void *)[v6 mutableCopy];

  [v7 setValue:v5 forKey:*MEMORY[0x1E4F288B8]];
  id v8 = (void *)MEMORY[0x1E4F28C58];
  id v9 = [a1 domain];
  id v10 = objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, objc_msgSend(a1, "code"), v7);

  return v10;
}

- (id)fp_recoverableErrorWithBlock:()FPAdditions fpProviderDomainId:operationService:
{
  id v8 = (void *)MEMORY[0x1E4F28C58];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  objc_msgSend(v8, "fp_initLocalizationStrings");
  id v12 = [[FPBlockRecoveryAttempter alloc] initWithBlock:v11 operationService:v9];

  id v13 = objc_msgSend(a1, "fp_annotatedErrorWithRecoveryAttempter:fpProviderDomainId:", v12, v10);

  [(FPBlockRecoveryAttempter *)v12 setExpectedError:v13];

  return v13;
}

- (id)fp_annotatedErrorWithOperationItem:()FPAdditions
{
  id v4 = (void *)MEMORY[0x1E4F28C58];
  id v5 = a3;
  objc_msgSend(v4, "fp_initLocalizationStrings");
  id v6 = [a1 userInfo];
  id v7 = (void *)[v6 mutableCopy];

  [v7 setValue:v5 forKey:@"NSFileProviderErrorOperationItemKey"];
  id v8 = (void *)MEMORY[0x1E4F28C58];
  id v9 = [a1 domain];
  id v10 = objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, objc_msgSend(a1, "code"), v7);

  return v10;
}

- (id)fp_userInfoValueForKey:()FPAdditions
{
  v57[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 domain];
  int v6 = [v5 isEqualToString:@"NSFileProviderErrorDomain"];

  if (!v6)
  {
    id v15 = 0;
    goto LABEL_36;
  }
  id v7 = [a1 userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"NSUserStringVariant"];

  id v9 = [a1 userInfo];
  id v10 = [v9 objectForKeyedSubscript:@"NSFileProviderErrorItemName"];

  id v11 = objc_msgSend(a1, "fp_userInfoItem");
  id v12 = [a1 userInfo];
  id v13 = [v12 objectForKeyedSubscript:@"NSFileProviderErrorOperationItemKey"];

  if ([v4 isEqualToString:*MEMORY[0x1E4F28568]])
  {
    uint64_t v14 = &stru_1EF68D1F8;
    goto LABEL_9;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F28588]])
  {
    uint64_t v14 = @"-C";
    goto LABEL_9;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F285A0]])
  {
    uint64_t v14 = @"-R";
LABEL_9:
    uint64_t v16 = [a1 code];
    switch(v16)
    {
      case -1006:
        v20 = @"DeletionRejected";
        goto LABEL_33;
      case -1005:
        v20 = @"NoSuchItem";
        goto LABEL_33;
      case -1004:
        v20 = @"ServerUnreachable";
        goto LABEL_33;
      case -1003:
        v20 = @"InsufficientQuota";
        goto LABEL_33;
      case -1002:
        goto LABEL_13;
      case -1001:
        uint64_t v35 = [a1 recoveryAttempter];

        if (v35) {
          v36 = @"Recovery-";
        }
        else {
          v36 = 0;
        }
        v37 = [v11 contentModificationDate];
        uint64_t v38 = [v13 contentModificationDate];
        v39 = (void *)v38;
        v40 = @"ItemExists";
        v54 = v13;
        if (!v37 || !v38) {
          goto LABEL_43;
        }
        uint64_t v41 = [v37 compare:v38];
        if (v41 == -1)
        {
          v42 = @"Older";
        }
        else
        {
          if (v41 != 1) {
            goto LABEL_43;
          }
          v42 = @"Newer";
        }
        v40 = [(__CFString *)v42 stringByAppendingString:@"ItemExists"];
LABEL_43:
        uint64_t v46 = [v11 filename];
        v50 = v37;
        v51 = (void *)v46;
        if (v46) {
          v52 = (void *)v46;
        }
        else {
          v52 = v10;
        }
        id v15 = FPLocalizedStringWithKeyAndVariant(v36, v40, v14, v8, v52, v47, v48, v49, v53);

        id v13 = v54;
        goto LABEL_35;
      case -1000:
        v20 = @"NotAuthenticated";
LABEL_33:
        uint64_t v29 = 0;
        uint64_t v30 = v14;
        uint64_t v31 = v8;
        goto LABEL_34;
      default:
        if (v16 == -2011)
        {
          uint64_t v21 = [a1 userInfo];
          v22 = [v21 objectForKeyedSubscript:@"NSFileProviderProviderDisplayName"];

          id v15 = FPLocalizedStringWithKeyAndVariantLiteral(v23, v24, v14, v8, v10, v25, v26, v27, (uint64_t)v22);

          goto LABEL_35;
        }
LABEL_13:
        if ([a1 code] != -5007) {
          goto LABEL_51;
        }
        uint64_t v28 = [a1 recoveryAttempter];

        if (v28) {
          uint64_t v29 = @"Recovery-";
        }
        else {
          uint64_t v29 = 0;
        }
        v20 = @"UnsafeDisconnect";
        uint64_t v30 = v14;
        uint64_t v31 = 0;
LABEL_34:
        id v15 = FPLocalizedStringWithKeyAndVariant(v29, v20, v30, v31, v10, v17, v18, v19, v53);
        break;
    }
    goto LABEL_35;
  }
  if (![v4 isEqualToString:*MEMORY[0x1E4F28590]]) {
    goto LABEL_51;
  }
  if ([a1 code] != -1001)
  {
    if ([a1 code] == -5007)
    {
      v32 = FPLocalizedErrorStringForKey(@"Disconnect-Cancel");
      v56[0] = v32;
      uint64_t v33 = FPLocalizedErrorStringForKey(@"Disconnect-Force");
      v56[1] = v33;
      v44 = (void *)MEMORY[0x1E4F1C978];
      v45 = v56;
LABEL_49:
      id v15 = [v44 arrayWithObjects:v45 count:2];
      goto LABEL_50;
    }
    if (objc_msgSend(a1, "fp_isGenericPreflightError"))
    {
      v32 = FPLocalizedErrorStringForKey(@"Preflight-Cancel");
      v55[0] = v32;
      uint64_t v33 = FPLocalizedErrorStringForKey(@"Preflight-Continue");
      v55[1] = v33;
      v44 = (void *)MEMORY[0x1E4F1C978];
      v45 = v55;
      goto LABEL_49;
    }
LABEL_51:
    id v15 = 0;
    goto LABEL_35;
  }
  v32 = FPLocalizedErrorStringForKey(@"Copy-Stop");
  v57[0] = v32;
  uint64_t v33 = FPLocalizedErrorStringForKey(@"Copy-Replace");
  v57[1] = v33;
  uint64_t v34 = FPLocalizedErrorStringForKey(@"Copy-Keep Both");
  v57[2] = v34;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:3];

LABEL_50:
LABEL_35:

LABEL_36:

  return v15;
}

- (id)fp_userInfoItem
{
  if ((objc_msgSend(a1, "fp_isFileProviderError:", -1001) & 1) != 0
    || objc_msgSend(a1, "fp_isFileProviderError:", -1006))
  {
    v2 = [a1 userInfo];
    BOOL v3 = [v2 objectForKeyedSubscript:@"NSFileProviderErrorItem"];
    id v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      int v6 = [a1 userInfo];
      id v5 = [v6 objectForKeyedSubscript:@"NSFileProviderErrorCollidingItem"];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)fp_userInfoFPItem
{
  id v4 = objc_msgSend(a1, "fp_userInfoItem");
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      goto LABEL_6;
    }
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, a1, @"NSError+FPAdditions.m", 821, @"we shouldn't have requested an FPItem from the error, it's doesn't contain the right type" object file lineNumber description];
  }
  id v5 = 0;
LABEL_6:

  return v5;
}

- (uint64_t)fp_prettyDescription
{
  return objc_msgSend(a1, "fp_prettyDescription:", 0);
}

- (FPErrorRedactionHelper)fp_prettyDescription:()FPAdditions
{
  BOOL v3 = [[FPErrorRedactionHelper alloc] initWithError:a1 depth:a3];

  return v3;
}

- (void)fp_internalErrorForVendorErrorWithCallerDescription:()FPAdditions itemCreationBlock:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)fp_internalErrorForVendorErrorWithCallerDescription:()FPAdditions itemCreationBlock:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)fp_internalErrorForVendorErrorWithCallerDescription:()FPAdditions itemCreationBlock:.cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(a2, "fp_prettyDescription");
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_ERROR, "[ERROR] Creating internal error for \"%@\", original error was: %@", (uint8_t *)&v6, 0x16u);
}

@end