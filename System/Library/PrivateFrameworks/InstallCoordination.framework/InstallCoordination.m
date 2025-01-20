void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

double OUTLINED_FUNCTION_0_2(void *a1, _OWORD *a2)
{
  *a1 = 0;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_4()
{
  return _os_crash_msg();
}

void OUTLINED_FUNCTION_4_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_2_2(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_7(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(a2 + 4) = v3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = a3;
  *(_WORD *)(a2 + 22) = 2112;
  *(void *)(a2 + 24) = result;
  *(_WORD *)(a2 + 32) = 2112;
  *(void *)(a2 + 34) = 0;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0x16u);
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return _os_log_send_and_compose_impl();
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x20u);
}

BOOL OUTLINED_FUNCTION_3_2()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_17@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 40) = a2;
  return a1;
}

uint64_t OUTLINED_FUNCTION_10(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + 4) = v3;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = result;
  *(_WORD *)(a3 + 22) = 2112;
  *(void *)(a3 + 24) = a2;
  *(_WORD *)(a3 + 32) = 2112;
  *(void *)(a3 + 34) = 0;
  return result;
}

void OUTLINED_FUNCTION_16_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

__CFString *IXStringForPlaceholderDisposition(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown IXPlaceholderDisposition value: %lu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5D16BF0[a1];
  }

  return v1;
}

__CFString *IXStringForUninstallDisposition(unint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown uninstall disposition: %lu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5D16C10[a1];
  }

  return v1;
}

__CFString *IXStringForIXError(void *a1, unint64_t a2)
{
  id v3 = a1;
  if ([v3 isEqualToString:@"IXUserPresentableErrorDomain"])
  {
    uint64_t v4 = @"Unknown error.";
    switch(a2)
    {
      case 0uLL:
        break;
      case 1uLL:
        uint64_t v4 = @"Could not install at this time.";
        break;
      case 2uLL:
        uint64_t v4 = @"Could not install.";
        break;
      case 3uLL:
        uint64_t v4 = @"User canceled.";
        break;
      case 4uLL:
        uint64_t v4 = @"Incompatible device architecture.";
        break;
      case 5uLL:
        uint64_t v4 = @"Device lacks required capabilities.";
        break;
      case 6uLL:
        uint64_t v4 = @"Incompatible platform.";
        break;
      case 7uLL:
        uint64_t v4 = @"Needs reinstallation from MDM.";
        break;
      case 8uLL:
        uint64_t v4 = @"Needs manual reinstallation.";
        break;
      case 9uLL:
        uint64_t v4 = @"No longer available in App Store.";
        break;
      case 0xAuLL:
        uint64_t v4 = @"Content is not owned by this user.";
        break;
      case 0xBuLL:
        uint64_t v4 = @"Insufficient storage.";
        break;
      case 0xCuLL:
        uint64_t v4 = @"User data for this app failed to restore from backup.";
        break;
      case 0xDuLL:
        uint64_t v4 = @"Forbidden.";
        break;
      case 0xEuLL:
        uint64_t v4 = @"Unable to verify integrity.";
        break;
      case 0xFuLL:
        uint64_t v4 = @"SINF not for this platform.";
        break;
      case 0x10uLL:
        uint64_t v4 = @"Device OS version is too low to run this app.";
        break;
      case 0x11uLL:
        uint64_t v4 = @"Code signature version is no longer supported.";
        break;
      case 0x12uLL:
        uint64_t v4 = @"Device is not eligible to install this app.";
        break;
      default:
        if (a2 != 54)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"Unhandled reason for code: %lu in domain IXUserPresentableErrorDomain", a2, v6);
          goto LABEL_9;
        }
        uint64_t v4 = @"Reached code meant only for testing.";
        break;
    }
  }
  else
  {
    if ([v3 isEqualToString:@"IXErrorDomain"])
    {
      if (a2 < 0x3A)
      {
        uint64_t v4 = off_1E5D16C68[a2];
        goto LABEL_10;
      }
      objc_msgSend(NSString, "stringWithFormat:", @"Unhandled reason for code: %lu in domain IXErrorDomain", a2, v6);
    }
    else
    {
      [NSString stringWithFormat:@"Unhandled error domain %@, code %lu", v3, a2];
    }
LABEL_9:
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:

  return v4;
}

id IXCreateUserPresentableError(unint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = objc_opt_new();
    v7 = v6;
    v8 = (void *)MEMORY[0x1E4F28588];
    uint64_t v9 = (void *)MEMORY[0x1E4F28568];
    if (v5)
    {
      [v6 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
      uint64_t v10 = [v5 userInfo];
      v11 = [v10 objectForKeyedSubscript:*v9];

      if (v11)
      {
        [v7 setObject:v11 forKeyedSubscript:*v8];
        [v7 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F285A0]];
      }
    }
    if (a2) {
      [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"AlertUser"];
    }
    uint64_t v12 = IXStringForIXError(@"IXUserPresentableErrorDomain", a1);
    [v7 setObject:v12 forKeyedSubscript:*v8];

    if (a1 >= 0x13)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unhandled IXUserPresentableErrorCode %lu", a1);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E5D16E38[a1 - 1];
    }
    [v7 setObject:v13 forKeyedSubscript:*v9];

    v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IXUserPresentableErrorDomain" code:a1 userInfo:v7];
  }
  else
  {
    v14 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      IXCreateUserPresentableError_cold_1(v14);
    }

    v15 = 0;
  }

  return v15;
}

uint64_t IXUserPresentableErrorCodeIsHardError(unint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1D) {
    unsigned int v2 = 1;
  }
  else {
    unsigned int v2 = (0xF7FFFFDu >> a2) & 1;
  }
  if (((1 << a1) & 0x34010) != 0) {
    unsigned int v3 = v2;
  }
  else {
    unsigned int v3 = 0;
  }
  if (((1 << a1) & 0xA1E4) != 0) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a1 <= 0x11) {
    return v4;
  }
  else {
    return 0;
  }
}

id IXStringifyObject(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v2 = v1;
    }
    else
    {
      id v2 = [v1 description];
    }
    unsigned int v3 = v2;
  }
  else
  {
    unsigned int v3 = 0;
  }

  return v3;
}

uint64_t IXArrayContainsOnlyClass(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = _EnumerateAndCheckClass(v1);
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t _EnumerateAndCheckClass(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v6 = 1;
LABEL_11:

  return v6;
}

uint64_t IXSetContainsOnlyClass(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = _EnumerateAndCheckClass(v1);
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t IXDictionaryContainsOnlyClassesCheckingValueTypes(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9 = a1;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __IXDictionaryContainsOnlyClassesCheckingValueTypes_block_invoke;
  v15[3] = &unk_1E5D16ED0;
  v15[4] = &v16;
  v15[5] = a2;
  v15[6] = a3;
  v15[7] = v10;
  v15[8] = a4;
  v15[9] = a5;
  v15[10] = v11;
  v15[11] = v12;
  [v9 enumerateKeysAndObjectsUsingBlock:v15];
  uint64_t v13 = *((unsigned __int8 *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return v13;
}

void sub_1A7B30AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __IXDictionaryContainsOnlyClassesCheckingValueTypes_block_invoke(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass())
  {
    uint64_t v6 = a1[6];
    if (v6 == a1[7])
    {
      char v7 = IXDictionaryContainsOnlyClassesCheckingValueTypes(v8, a1[8], a1[9], 0, 0);
    }
    else if (v6 == a1[10])
    {
      char v7 = IXArrayContainsOnlyClass(v8);
    }
    else
    {
      if (v6 != a1[11]) {
        goto LABEL_11;
      }
      char v7 = IXSetContainsOnlyClass(v8);
    }
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = v7;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
  }
LABEL_11:
  if (!*(unsigned char *)(*(void *)(a1[4] + 8) + 24)) {
    *a4 = 1;
  }
}

uint64_t IXDictionaryContainsOnlyClasses(void *a1, uint64_t a2, uint64_t a3)
{
  return IXDictionaryContainsOnlyClassesCheckingValueTypes(a1, a2, a3, 0, 0);
}

BOOL IXDictionaryContainsOnlyPlistContent(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  BOOL v2 = (objc_opt_isKindOfClass() & 1) != 0 && CFPropertyListIsValid(v1, kCFPropertyListBinaryFormat_v1_0) == 1;

  return v2;
}

uint64_t IXBooleanValue(void *a1, uint64_t a2)
{
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a2 = [v3 BOOLValue];
  }

  return a2;
}

id IXArrayifyThing(void *a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (IXArrayContainsOnlyClass(v1))
      {
        id v2 = v1;
LABEL_7:
        id v3 = v2;
        goto LABEL_12;
      }
    }
    else
    {
      if (objc_opt_isKindOfClass())
      {
        v6[0] = v1;
        id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
        goto LABEL_7;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v4 = [v1 allObjects];
        if (IXArrayContainsOnlyClass(v4)) {
          id v3 = v4;
        }
        else {
          id v3 = 0;
        }

        goto LABEL_12;
      }
    }
  }
  id v3 = 0;
LABEL_12:

  return v3;
}

id IXFilterArrayForClass(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v1, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v3, "addObject:", v9, (void)v12);
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    uint64_t v10 = (void *)[v3 copy];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

id IXFilterDictionaryForClass(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA60];
    id v6 = a1;
    uint64_t v7 = objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __IXFilterDictionaryForClass_block_invoke;
    v11[3] = &unk_1E5D16EF8;
    uint64_t v13 = a2;
    uint64_t v14 = a3;
    id v12 = v7;
    id v8 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:v11];

    uint64_t v9 = (void *)[v8 copy];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void __IXFilterDictionaryForClass_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (*(void *)(a1 + 40)) {
    int v6 = objc_opt_isKindOfClass() ^ 1;
  }
  else {
    int v6 = 0;
  }
  if (*(void *)(a1 + 48)) {
    int v7 = objc_opt_isKindOfClass() ^ 1;
  }
  else {
    int v7 = 0;
  }
  if (((v6 | v7) & 1) == 0) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v8];
  }
}

__CFString *IXCopyProcessNameForPid()
{
  int v0 = MEMORY[0x1F4188790]();
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v1 = proc_pidpath(v0, buffer, 0x1000u);
  if (v1 < 1)
  {
    id v3 = @"Unknown Process Name";
  }
  else
  {
    id v2 = (void *)[[NSString alloc] initWithBytes:buffer length:v1 encoding:4];
    id v3 = [v2 lastPathComponent];
  }

  return v3;
}

id IXCopyClientNameForConnection(void *a1)
{
  uint64_t v1 = [a1 processIdentifier];
  id v2 = NSString;
  id v3 = IXCopyProcessNameForPid();
  id v4 = [v2 stringWithFormat:@"%@ (pid %d)", v3, v1];

  return v4;
}

uint64_t IXHasTrueValueForEntitlement(void *a1, uint64_t a2)
{
  id v2 = [a1 valueForEntitlement:a2];
  if (objc_opt_respondsToSelector()) {
    uint64_t v3 = [v2 BOOLValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t IXHasMobileInstallationSPIEntitlement(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 valueForEntitlement:@"com.apple.private.mobileinstall.allowedSPI"];
  if (!v4) {
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (([v4 isEqualToString:v3] & 1) == 0)
    {
LABEL_8:
      uint64_t v5 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ([v4 containsObject:v3] & 1) == 0) {
      goto LABEL_8;
    }
  }
  uint64_t v5 = 1;
LABEL_9:

  return v5;
}

id IXValidateMobileInstallationSPIEntitlement(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (IXHasMobileInstallationSPIEntitlement(v3, v4))
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      IXValidateMobileInstallationSPIEntitlement_cold_1(v3, (uint64_t)v4, v6);
    }

    int v7 = IXCopyClientNameForConnection(v3);
    uint64_t v5 = _CreateError((uint64_t)"IXValidateMobileInstallationSPIEntitlement", 84, @"IXErrorDomain", 0x19uLL, 0, 0, @"Process %@ is required to have an entitlement named \"%@\" with an array containing \"%@\" to call this SPI.", v8, (uint64_t)v7);
  }

  return v5;
}

id IXCopyAllowedLinkedParentBundleIDsForConnection(void *a1)
{
  uint64_t v1 = [a1 valueForEntitlement:@"com.apple.private.mobileinstall.allowed-linked-parents"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (v3 && (objc_opt_class(), IXArrayContainsOnlyClass(v3))) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

__CFString *IXStringForQOSClass(uint64_t a1)
{
  if ((int)a1 > 20)
  {
    switch(a1)
    {
      case 0x15:
        id v2 = @"QOS_CLASS_DEFAULT";
        break;
      case 0x21:
        id v2 = @"QOS_CLASS_USER_INTERACTIVE";
        break;
      case 0x19:
        id v2 = @"QOS_CLASS_USER_INITIATED";
        break;
      default:
LABEL_26:
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown Class: %u", a1);
        id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v2;
    }
  }
  else if (a1)
  {
    if (a1 != 9)
    {
      if (a1 == 17)
      {
        id v2 = @"QOS_CLASS_UTILITY";
        return v2;
      }
      goto LABEL_26;
    }
    id v2 = @"QOS_CLASS_BACKGROUND";
  }
  else
  {
    id v2 = @"QOS_CLASS_UNSPECIFIED";
  }
  return v2;
}

id IXSanitizeAndValidateRestrictedStoreMetadata(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a1;
  uint64_t v10 = (void *)[v9 copy];
  char v11 = IXHasTrueValueForEntitlement(v7, @"com.apple.private.install.distributor-info-source");
  id v12 = [v9 distributorInfo];

  if ((v11 & 1) != 0 || !v12)
  {
    id v18 = v10;
    uint64_t v17 = 0;
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  uint64_t v13 = [v12 distributorID];
  uint64_t v14 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v20 = IXCopyClientNameForConnection(v7);
    *(_DWORD *)buf = 136316418;
    v22 = "IXSanitizeAndValidateRestrictedStoreMetadata";
    __int16 v23 = 2112;
    v24 = v20;
    __int16 v25 = 2112;
    id v26 = v8;
    __int16 v27 = 2112;
    v28 = @"com.apple.private.install.distributor-info-source";
    __int16 v29 = 2112;
    v30 = v13;
    __int16 v31 = 2112;
    uint64_t v32 = 0;
    _os_log_error_impl(&dword_1A7B2D000, v14, OS_LOG_TYPE_ERROR, "%s: Client %@ setting the %@ did not have the required entitlement \"%@\" = TRUE to allow the distribution info in the store metadata to be set (supplied distributor ID was '%@'). : %@", buf, 0x3Eu);
  }
  long long v15 = IXCopyClientNameForConnection(v7);
  uint64_t v17 = _CreateError((uint64_t)"IXSanitizeAndValidateRestrictedStoreMetadata", 142, @"IXErrorDomain", 0x19uLL, 0, 0, @"Client %@ setting the %@ did not have the required entitlement \"%@\" = TRUE to allow the distribution info in the store metadata to be set (supplied distributor ID was '%@').", v16, (uint64_t)v15);

  id v18 = 0;
  if (a4)
  {
LABEL_8:
    if (!v18) {
      *a4 = v17;
    }
  }
LABEL_10:

  return v18;
}

id IXFrameworkBundle()
{
  if (IXFrameworkBundle_onceToken != -1) {
    dispatch_once(&IXFrameworkBundle_onceToken, &__block_literal_global);
  }
  int v0 = (void *)IXFrameworkBundle_sharedFrameworkBundle;

  return v0;
}

void __IXFrameworkBundle_block_invoke()
{
  int v0 = +[IXGlobalConfiguration sharedInstance];
  uint64_t v1 = [v0 frameworkURL];

  uint64_t v2 = [MEMORY[0x1E4F28B50] bundleWithURL:v1];
  id v3 = (void *)IXFrameworkBundle_sharedFrameworkBundle;
  IXFrameworkBundle_sharedFrameworkBundle = v2;

  if (!IXFrameworkBundle_sharedFrameworkBundle)
  {
    id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __IXFrameworkBundle_block_invoke_cold_1();
    }
  }
}

__CFString *IXStringKeyForError(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x11) {
    return @"kIXUserPresentableUnknownError";
  }
  else {
    return off_1E5D17080[a1 - 1];
  }
}

void IXPresentErrorHighlightingLocalizedAppName(void *a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = [v13 count];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __IXPresentErrorHighlightingLocalizedAppName_block_invoke;
  block[3] = &unk_1E5D17018;
  uint64_t v28 = v16;
  uint64_t v29 = a4;
  id v23 = v11;
  id v24 = v15;
  id v26 = v13;
  id v27 = v14;
  id v25 = v12;
  id v17 = v13;
  id v18 = v12;
  id v19 = v14;
  id v20 = v15;
  id v21 = v11;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __IXPresentErrorHighlightingLocalizedAppName_block_invoke(uint64_t a1)
{
  uint64_t v2 = IXFrameworkBundle();
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = MEMORY[0x1E4F1CC38];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"DismissOnLock"];
  [v3 setObject:v4 forKeyedSubscript:@"SBUserNotificationAllowMenuButtonDismissal"];
  uint64_t v5 = IXLocalizedTitleForFirstAppName(*(void **)(a1 + 32), *(void *)(a1 + 72), *(void *)(a1 + 80));
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F1D990]];

  uint64_t v6 = *(void *)(a1 + 80);
  if (v6 == 16) {
    IXLocalizedBodyForOSVersionError(*(void **)(a1 + 40), *(void **)(a1 + 32), *(void *)(a1 + 72));
  }
  else {
  id v7 = IXLocalizedBodyForFirstAppName(*(void **)(a1 + 32), *(void *)(a1 + 72), v6);
  }
  [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F1D9A8]];

  switch(*(void *)(a1 + 80))
  {
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 0xDLL:
    case 0xFLL:
    case 0x11:
    case 0x12:
      if (*(void *)(a1 + 72) != 1) {
        goto LABEL_10;
      }
      id v8 = [v2 localizedStringForKey:@"BUTTON_TITLE_DELETE" value:&stru_1EFDF6C00 table:@"IXUserPresentableErrors"];
      [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];

      [v3 setObject:&unk_1EFE06AE0 forKeyedSubscript:@"SBUserNotificationDefaultButtonPresentationStyle"];
      id v9 = [v2 localizedStringForKey:@"BUTTON_TITLE_KEEP" value:&stru_1EFDF6C00 table:@"IXUserPresentableErrors"];
      [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F1D9D0]];

      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __IXPresentErrorHighlightingLocalizedAppName_block_invoke_99;
      v27[3] = &unk_1E5D16FA0;
      id v28 = *(id *)(a1 + 64);
      uint64_t v10 = (void *)MEMORY[0x1AD0D48B0](v27);
      id v11 = v28;
      goto LABEL_7;
    case 0xALL:
      if (*(void *)(a1 + 72) != 1) {
        goto LABEL_10;
      }
      id v12 = [v2 localizedStringForKey:@"BUTTON_TITLE_VIEW_IN_APP_STORE" value:&stru_1EFDF6C00 table:@"IXUserPresentableErrors"];
      [v3 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];

      id v13 = [v2 localizedStringForKey:@"BUTTON_TITLE_OK" value:&stru_1EFDF6C00 table:@"IXUserPresentableErrors"];
      [v3 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F1D9D0]];

      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __IXPresentErrorHighlightingLocalizedAppName_block_invoke_2_103;
      v23[3] = &unk_1E5D16FF0;
      uint64_t v26 = *(void *)(a1 + 72);
      id v24 = *(id *)(a1 + 48);
      id v25 = *(id *)(a1 + 56);
      uint64_t v10 = (void *)MEMORY[0x1AD0D48B0](v23);

      id v11 = v24;
LABEL_7:

      break;
    case 0xBLL:
      id v19 = [v2 localizedStringForKey:@"BUTTON_TITLE_SETTINGS" value:&stru_1EFDF6C00 table:@"IXUserPresentableErrors"];
      [v3 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];

      id v20 = [v2 localizedStringForKey:@"BUTTON_TITLE_OK" value:&stru_1EFDF6C00 table:@"IXUserPresentableErrors"];
      [v3 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F1D9D0]];

      uint64_t v10 = &__block_literal_global_77;
      break;
    case 0x10:
      id v21 = [v2 localizedStringForKey:@"BUTTON_TITLE_SETTINGS" value:&stru_1EFDF6C00 table:@"IXUserPresentableErrors"];
      [v3 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];

      v22 = [v2 localizedStringForKey:@"BUTTON_TITLE_OK" value:&stru_1EFDF6C00 table:@"IXUserPresentableErrors"];
      [v3 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F1D9D0]];

      uint64_t v10 = &__block_literal_global_85;
      break;
    default:
LABEL_10:
      id v14 = [v2 localizedStringForKey:@"BUTTON_TITLE_OK" value:&stru_1EFDF6C00 table:@"IXUserPresentableErrors"];
      [v3 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];

      uint64_t v10 = 0;
      break;
  }
  if (*(void *)(a1 + 72) == 1) {
    [*(id *)(a1 + 56) objectAtIndexedSubscript:0];
  }
  else {
  id v15 = objc_msgSend(NSString, "stringWithFormat:", @"<%lu bundleIDs>", *(void *)(a1 + 72));
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ShowUserNotice_block_invoke;
  block[3] = &unk_1E5D17040;
  id v30 = v3;
  id v31 = v15;
  id v32 = v10;
  id v33 = 0;
  id v16 = v10;
  id v17 = v3;
  id v18 = v15;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

id IXLocalizedTitleForFirstAppName(void *a1, unint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = IXStringKeyForError(a3);
  id v7 = v6;
  if (a2 >= 2) {
    id v8 = @"_TITLE_MULTIPLE";
  }
  else {
    id v8 = @"_TITLE";
  }
  id v9 = [v6 stringByAppendingString:v8];
  uint64_t v10 = IXFrameworkBundle();
  id v11 = [v10 localizedStringForKey:v9 value:&stru_1EFDF6C00 table:@"IXUserPresentableErrors"];

  id v12 = objc_msgSend(NSString, "stringWithFormat:", v11, v5);

  return v12;
}

id IXLocalizedBodyForOSVersionError(void *a1, void *a2, unint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  if (v5)
  {
    id v7 = [v5 userInfo];
    id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F6F560]];

    id v9 = [v5 userInfo];
    uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F6F558]];

    id v11 = @"kIXUserPresentableDeviceOSVersionTooLowError";
    if (v10)
    {
      if ([v10 unsignedIntegerValue] != 1 && a3 < 2) {
        id v11 = @"kIXUserPresentableDeviceOSVersionTooLowDiffPlatformError";
      }
    }
  }
  else
  {
    id v13 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      IXLocalizedBodyForOSVersionError_cold_1();
    }

    id v8 = 0;
    id v11 = @"kIXUserPresentableDeviceOSVersionTooLowError";
  }
  id v14 = IXLocalizedBody(v11, v8, v6, a3);

  return v14;
}

id IXLocalizedBodyForFirstAppName(void *a1, unint64_t a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = IXStringKeyForError(a3);
  id v7 = IXLocalizedBody(v6, v5, v5, a2);

  return v7;
}

void __IXPresentErrorHighlightingLocalizedAppName_block_invoke_2()
{
  int v0 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=General&path=STORAGE_MGMT"];
  uint64_t v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v5 = 0;
  char v2 = [v1 openSensitiveURL:v0 withOptions:0 error:&v5];
  id v3 = v5;

  if ((v2 & 1) == 0)
  {
    uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __IXPresentErrorHighlightingLocalizedAppName_block_invoke_2_cold_1();
    }
  }
}

void __IXPresentErrorHighlightingLocalizedAppName_block_invoke_83()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v0 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=General&path=SOFTWARE_UPDATE_LINK"];
  uint64_t v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  char v2 = [v1 openSensitiveURL:v0 withOptions:0];

  if ((v2 & 1) == 0)
  {
    id v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      id v5 = "IXPresentErrorHighlightingLocalizedAppName_block_invoke";
      _os_log_impl(&dword_1A7B2D000, v3, OS_LOG_TYPE_DEFAULT, "%s: Failed to open software update Settings", (uint8_t *)&v4, 0xCu);
    }
  }
}

uint64_t __IXPresentErrorHighlightingLocalizedAppName_block_invoke_99(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __IXPresentErrorHighlightingLocalizedAppName_block_invoke_2_103(uint64_t a1)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 48) == 1
    && (char v2 = *(void **)(a1 + 32)) != 0
    && ([v2 iTunesMetadata],
        id v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 storeItemIdentifier],
        v3,
        v4))
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F29088]);
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"action" value:@"lookup"];
    id v7 = objc_alloc(MEMORY[0x1E4F290C8]);
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", v4);
    id v9 = (void *)[v7 initWithName:@"ids" value:v8];

    [v5 setScheme:@"itms-apps"];
    [v5 setHost:&stru_1EFDF6C00];
    v15[0] = v6;
    v15[1] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    [v5 setQueryItems:v10];

    id v11 = [v5 URL];

    id v12 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __IXPresentErrorHighlightingLocalizedAppName_block_invoke_3;
    v13[3] = &unk_1E5D16FC8;
    id v14 = *(id *)(a1 + 40);
    [v12 openURL:v11 configuration:0 completionHandler:v13];
  }
  else
  {
    _LaunchAppStore();
  }
}

void _LaunchAppStore()
{
  id v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openApplicationWithBundleIdentifier:@"com.apple.AppStore" configuration:0 completionHandler:&__block_literal_global_153];
}

void __IXPresentErrorHighlightingLocalizedAppName_block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
      int v7 = 136315650;
      id v8 = "IXPresentErrorHighlightingLocalizedAppName_block_invoke_3";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to open app with bundle ID %@ in the App Store. Error: %@", (uint8_t *)&v7, 0x20u);
    }
  }
}

id IXLocalizedBody(void *a1, void *a2, void *a3, unint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if (a4 >= 2) {
    uint64_t v10 = @"_BODY_MULTIPLE";
  }
  else {
    uint64_t v10 = @"_BODY";
  }
  __int16 v11 = [v7 stringByAppendingString:v10];
  id v12 = IXFrameworkBundle();
  uint64_t v13 = [v12 localizedStringForKey:v11 value:&stru_1EFDF6C00 table:@"IXUserPresentableErrors"];

  if (a4 > 1) {
    objc_msgSend(NSString, "stringWithFormat:", v13, v9, a4 - 1);
  }
  else {
  id v14 = objc_msgSend(NSString, "stringWithFormat:", v13, v8, v16);
  }

  return v14;
}

id IXGetLoggingHandle(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __IXGetLoggingHandle_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (IXGetLoggingHandle_onceToken != -1) {
    dispatch_once(&IXGetLoggingHandle_onceToken, block);
  }
  uint64_t v1 = (void *)IXGetLoggingHandle_logHandle;

  return v1;
}

uint64_t __IXGetLoggingHandle_block_invoke(uint64_t a1)
{
  IXGetLoggingHandle_logHandle = (uint64_t)os_log_create(*(const char **)(a1 + 32), "framework");

  return MEMORY[0x1F41817F8]();
}

void sub_1A7B37AD8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

__CFString *_StringForIXCoordinatorIntent(unint64_t a1)
{
  if (a1 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown intent value %lu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5D17AB8[a1];
  }

  return v1;
}

void sub_1A7B388E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1A7B3992C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v10);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__48(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__49(uint64_t a1)
{
}

void sub_1A7B3AFE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

void sub_1A7B3B4CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _CheckCancelRequestSanity(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (v3)
  {
    if (a2)
    {
      id v4 = 0;
      goto LABEL_11;
    }
    id v9 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      _CheckCancelRequestSanity_cold_2();
    }

    id v7 = @"Cancellation method on IXAppInstallCoordinator was called with client of IXClientNone which is invalid";
    uint64_t v8 = 671;
  }
  else
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      _CheckCancelRequestSanity_cold_1();
    }

    id v7 = @"Reason passed to IXAppInstallCoordinator cancellation method was nil!";
    uint64_t v8 = 667;
  }
  id v4 = _CreateError((uint64_t)"_CheckCancelRequestSanity", v8, @"IXErrorDomain", 4uLL, 0, 0, v7, v6, v11);
LABEL_11:

  return v4;
}

void sub_1A7B3BD68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B3C46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B3C9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B3CF40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B3DC9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1A7B3EAB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B3F20C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B3F678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B40680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

id _ProcessRemovabilityMetadataListMap(void *a1)
{
  id v1 = a1;
  char v2 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = ___ProcessRemovabilityMetadataListMap_block_invoke;
  v6[3] = &unk_1E5D17A98;
  id v7 = v2;
  id v3 = v2;
  [v1 enumerateKeysAndObjectsUsingBlock:v6];

  id v4 = (void *)[v3 copy];

  return v4;
}

void sub_1A7B40E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B41558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B41FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B42494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B42C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1A7B4309C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B435C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B43A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B43E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B44388(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B44720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B44AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B44E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B4531C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1A7B45690(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B45A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B45E20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B46254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B46794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
}

void sub_1A7B46F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_1A7B47320(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B47778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B47BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B480E0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B48470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B488A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B48EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B49388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B497C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B49D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B4A1E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B4A5E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B4AA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B4AF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
}

void sub_1A7B4B704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_1A7B4BB84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B4C698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B4CACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B4CEDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B4D310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B4D6F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B4DA50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B4DDE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B4E264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B4E6C0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B4EC90(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B4F224(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B4FB80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 192), 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B4FFEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B50288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B5053C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B507F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B50B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B51088(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B54918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B54E34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1A7B553F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B556B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B5583C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B55B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B55E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B561B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B5671C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1A7B56A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B57234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1A7B58008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

BOOL _CompareObjects(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  BOOL v6 = (v3 != 0) == (v4 != 0) && (!v3 || !v4 || [v3 isEqual:v4]);

  return v6;
}

void sub_1A7B59CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1A7B5A114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B5A528(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id IXEncodeRootObject(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v4 encodeObject:v3 forKey:*MEMORY[0x1E4F284E8]];
  id v5 = [v4 encodedData];

  if (a2 && !v5) {
    *a2 = 0;
  }

  return v5;
}

id IXUserPresentableErrorForInsufficientSpaceError(void *a1)
{
  id v1 = a1;
  char v2 = [v1 domain];
  if ([v2 isEqualToString:@"IXUserPresentableErrorDomain"])
  {
    uint64_t v3 = [v1 code];

    if (v3 == 11)
    {
      id v4 = v1;
      goto LABEL_16;
    }
  }
  else
  {
  }
  id v5 = v1;
  id v4 = v5;
  if (v5)
  {
    uint64_t v6 = *MEMORY[0x1E4F28798];
    uint64_t v7 = *MEMORY[0x1E4F28A50];
    uint64_t v8 = v5;
    while (1)
    {
      id v9 = [v8 domain];
      if ([v9 isEqualToString:v6])
      {
        uint64_t v10 = [v8 code];

        if (v10 == 28)
        {
          uint64_t v13 = [v4 domain];
          int v14 = [v13 isEqual:@"IXUserPresentableErrorDomain"];

          if (v14)
          {
            uint64_t v15 = [v4 userInfo];
            uint64_t v16 = [v15 objectForKeyedSubscript:@"AlertUser"];
            int v14 = IXBooleanValue(v16, 0);
          }
          IXCreateUserPresentableError(0xBuLL, v14, v4);
          id v4 = (id)objc_claimAutoreleasedReturnValue();

          break;
        }
      }
      else
      {
      }
      uint64_t v11 = [v8 userInfo];
      uint64_t v12 = [v11 objectForKeyedSubscript:v7];

      uint64_t v8 = (void *)v12;
      if (!v12)
      {
        id v4 = 0;
        break;
      }
    }
  }
LABEL_16:

  return v4;
}

void IXDispatchAsyncWithAutoreleasePool(NSObject *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __IXDispatchAsyncWithAutoreleasePool_block_invoke;
  block[3] = &unk_1E5D16FA0;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(a1, block);
}

void __IXDispatchAsyncWithAutoreleasePool_block_invoke(uint64_t a1)
{
  char v2 = (void *)MEMORY[0x1AD0D4670]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void IXAsyncTransaction(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = (void *)os_transaction_create();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __IXAsyncTransaction_block_invoke;
  v8[3] = &unk_1E5D17190;
  id v9 = v5;
  id v10 = v3;
  id v6 = v5;
  id v7 = v3;
  dispatch_async(v4, v8);
}

void __IXAsyncTransaction_block_invoke(uint64_t a1)
{
  char v2 = (void *)MEMORY[0x1AD0D4670]();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

dispatch_queue_global_t IXQueueForConcurrentOperations()
{
  intptr_t v0 = qos_class_self();

  return dispatch_get_global_queue(v0, 0);
}

uint64_t IXBuildHasInternalDiagnostics()
{
  return MEMORY[0x1F40CD650]("com.apple.installcoordination");
}

uint64_t _SelectorsRespondedToByDelegate()
{
  uint64_t v0 = 0;
  uint64_t v1 = 0;
  v5[26] = *MEMORY[0x1E4F143B8];
  v5[0] = sel_coordinatorShouldPrioritize_;
  v5[1] = 1;
  v5[2] = sel_coordinatorShouldResume_;
  v5[3] = 2;
  v5[4] = sel_coordinatorShouldPause_;
  v5[5] = 4;
  v5[6] = sel_coordinator_configuredPromiseDidBeginFulfillment_;
  v5[7] = 8;
  v5[8] = sel_coordinatorDidInstallPlaceholder_;
  v5[9] = 16;
  v5[10] = sel_coordinatorDidCompleteSuccessfully_;
  v5[11] = 32;
  v5[12] = sel_coordinator_canceledWithReason_client_;
  v5[13] = 64;
  v5[14] = sel_shouldPrioritizeAppWithBundleID_;
  v5[15] = 128;
  v5[16] = sel_coordinatorShouldBeginRestoringUserData_;
  v5[17] = 256;
  v5[18] = sel_coordinatorDidInstallPlaceholder_forApplicationRecord_;
  v5[19] = 2048;
  v5[20] = sel_coordinatorDidCompleteSuccessfully_forApplicationRecord_;
  v5[21] = 4096;
  v5[22] = sel_shouldPrioritizeAppWithIdentity_;
  v5[23] = 0x2000;
  v5[24] = sel_coordinatorShouldBeginPostProcessing_forApplicationRecord_;
  v5[25] = 0x4000;
  do
  {
    uint64_t v2 = v5[v0 + 1];
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = v2;
    }
    else {
      uint64_t v3 = 0;
    }
    v1 |= v3;
    v0 += 2;
  }
  while (v0 != 26);
  return v1;
}

id _IXStringForObserverRespondsToSelectors(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28E78] stringWithString:@"["];
  uint64_t v3 = v2;
  if (a1)
  {
    if ((unint64_t)[v2 length] <= 1) {
      id v7 = @"%s";
    }
    else {
      id v7 = @" %s";
    }
    objc_msgSend(v3, "appendFormat:", v7, "Prioritize");
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  if ((unint64_t)[v3 length] <= 1) {
    uint64_t v8 = @"%s";
  }
  else {
    uint64_t v8 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v8, "Resume");
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
LABEL_29:
  if ((unint64_t)[v3 length] <= 1) {
    id v9 = @"%s";
  }
  else {
    id v9 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v9, "Pause");
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_37;
  }
LABEL_33:
  if ((unint64_t)[v3 length] <= 1) {
    id v10 = @"%s";
  }
  else {
    id v10 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v10, "PromiseBegin");
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if ((a1 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_41;
  }
LABEL_37:
  if ((unint64_t)[v3 length] <= 1) {
    uint64_t v11 = @"%s";
  }
  else {
    uint64_t v11 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v11, "InstallPlaceholder");
  if ((a1 & 0x20) == 0)
  {
LABEL_7:
    if ((a1 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_45;
  }
LABEL_41:
  if ((unint64_t)[v3 length] <= 1) {
    uint64_t v12 = @"%s";
  }
  else {
    uint64_t v12 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v12, "Complete");
  if ((a1 & 0x40) == 0)
  {
LABEL_8:
    if ((a1 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_49;
  }
LABEL_45:
  if ((unint64_t)[v3 length] <= 1) {
    uint64_t v13 = @"%s";
  }
  else {
    uint64_t v13 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v13, "Cancel");
  if ((a1 & 0x80) == 0)
  {
LABEL_9:
    if ((a1 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_53;
  }
LABEL_49:
  if ((unint64_t)[v3 length] <= 1) {
    int v14 = @"%s";
  }
  else {
    int v14 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v14, "PrioritizeBundleID");
  if ((a1 & 0x100) == 0)
  {
LABEL_10:
    if ((a1 & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_57;
  }
LABEL_53:
  if ((unint64_t)[v3 length] <= 1) {
    uint64_t v15 = @"%s";
  }
  else {
    uint64_t v15 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v15, "BeginRestoringUserData");
  if ((a1 & 0x800) == 0)
  {
LABEL_11:
    if ((a1 & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_61;
  }
LABEL_57:
  if ((unint64_t)[v3 length] <= 1) {
    uint64_t v16 = @"%s";
  }
  else {
    uint64_t v16 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v16, "InstallPlaceholderForRecord");
  if ((a1 & 0x1000) == 0)
  {
LABEL_12:
    if ((a1 & 0x2000) == 0) {
      goto LABEL_13;
    }
LABEL_65:
    if ((unint64_t)[v3 length] <= 1) {
      uint64_t v18 = @"%s";
    }
    else {
      uint64_t v18 = @" %s";
    }
    objc_msgSend(v3, "appendFormat:", v18, "PrioritizeAppWithIdentity");
    if ((a1 & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
LABEL_61:
  if ((unint64_t)[v3 length] <= 1) {
    uint64_t v17 = @"%s";
  }
  else {
    uint64_t v17 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v17, "CompleteForRecord");
  if ((a1 & 0x2000) != 0) {
    goto LABEL_65;
  }
LABEL_13:
  if ((a1 & 0x4000) != 0)
  {
LABEL_14:
    if ((unint64_t)[v3 length] <= 1) {
      id v4 = @"%s";
    }
    else {
      id v4 = @" %s";
    }
    objc_msgSend(v3, "appendFormat:", v4, "ShouldBeginPostProcessing");
  }
LABEL_18:
  objc_msgSend(v3, "appendFormat:", @" (%lu)]", a1);
  id v5 = (void *)[v3 copy];

  return v5;
}

BOOL IXIsAppExtensionForPlaceholderType(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

__CFString *IXStringForClientID(unint64_t a1)
{
  if (a1 >= 0x1D)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown IXClientIdentifier: %lu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5D17D78[a1];
  }

  return v1;
}

void sub_1A7B5F9B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_1A7B5FD14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void IXSyncLSDatabase(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "IXSyncLSDatabase";
    __int16 v7 = 2112;
    id v8 = v1;
    _os_log_impl(&dword_1A7B2D000, v2, OS_LOG_TYPE_DEFAULT, "%s: %@; re-fetching local LS database",
      (uint8_t *)&v5,
      0x16u);
  }

  uint64_t v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v3 acquireDatabase];

  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "IXSyncLSDatabase";
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Fetch of local LS database complete", (uint8_t *)&v5, 0xCu);
  }
}

id IXApplicationRecordForRecordPromise(void *a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (!v3)
  {
    uint64_t v9 = @"Did not receive a LSRecordPromise";
    goto LABEL_19;
  }
  id v35 = 0;
  int v5 = [v3 fulfillReturningError:&v35];
  id v6 = v35;
  __int16 v7 = v6;
  if (!v5)
  {
    id v10 = [v6 domain];
    if ([v10 isEqualToString:*MEMORY[0x1E4F28760]])
    {
      uint64_t v11 = [v7 code];

      if (v11 == -10814)
      {
        uint64_t v12 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v38 = "_FulfillLSRecordPromise";
          __int16 v39 = 2112;
          id v40 = v3;
          _os_log_impl(&dword_1A7B2D000, v12, OS_LOG_TYPE_DEFAULT, "%s: Could not fulfill record promise %@; the record was likely superseded or the app was uninstalled. Fallin"
            "g back to fetching the current record",
            buf,
            0x16u);
        }
        goto LABEL_15;
      }
    }
    else
    {
    }
    uint64_t v12 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      IXApplicationRecordForRecordPromise_cold_2();
    }
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v12 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      IXApplicationRecordForRecordPromise_cold_3((uint64_t)v3, (uint64_t)v5, v12);
    }
LABEL_15:

    id v8 = 0;
    goto LABEL_16;
  }
  id v8 = v5;
LABEL_16:

  if (v8)
  {
    id v29 = v3;
    id v13 = v4;
    int v14 = 0;
LABEL_22:
    uint64_t v16 = objc_opt_new();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v17 = [v8 applicationExtensionRecords];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v23 = [v22 extensionPointRecord];
          if (v23) {
            [v16 addObject:v23];
          }
          [v16 addObject:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v19);
    }

    [v16 addObject:v8];
    id v24 = (void *)MEMORY[0x1E4F22468];
    id v25 = [v16 copy];
    [v24 resolveAllPropertiesOfRecords:v25 andDetachOnQueue:0];

    id v4 = v13;
    id v3 = v29;
    goto LABEL_32;
  }
  uint64_t v9 = @"Could not fulfill LSRecordPromise";
LABEL_19:
  IXSyncLSDatabase(v9);
  if (v4)
  {
    id v34 = 0;
    id v8 = (id)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v4 allowPlaceholder:1 error:&v34];
    id v15 = v34;
    int v14 = v15;
    if (v8)
    {
      id v29 = v3;
      id v13 = v4;
      goto LABEL_22;
    }
    id v27 = [v15 domain];
    if ([v27 isEqualToString:*MEMORY[0x1E4F28760]])
    {
      uint64_t v28 = [v14 code];

      if (v28 == -10814)
      {
        uint64_t v16 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v38 = "IXApplicationRecordForRecordPromise";
          __int16 v39 = 2112;
          id v40 = v4;
          _os_log_impl(&dword_1A7B2D000, v16, OS_LOG_TYPE_DEFAULT, "%s: Application record for %@ was not found and its LSRecordPromise could not be fulfilled; likely the appli"
            "cation was uninstalled. Caller will get a nil LSApplicationRecord",
            buf,
            0x16u);
        }
LABEL_44:
        id v8 = 0;
LABEL_32:

        goto LABEL_34;
      }
    }
    else
    {
    }
    uint64_t v16 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      IXApplicationRecordForRecordPromise_cold_1();
    }
    goto LABEL_44;
  }
  int v14 = 0;
  id v8 = 0;
LABEL_34:

  return v8;
}

id IXApplicationRecordForIdentityInDomain(void *a1, uint64_t a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__4;
  v37 = __Block_byref_object_dispose__4;
  id v38 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  long long v30 = __Block_byref_object_copy__4;
  long long v31 = __Block_byref_object_dispose__4;
  id v32 = 0;
  id v6 = [v5 bundleID];
  switch(a2)
  {
    case 1:
      char v7 = 0;
      break;
    case 2:
LABEL_10:
      id v13 = [MEMORY[0x1E4F22420] sharedDatabaseContext];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __IXApplicationRecordForIdentityInDomain_block_invoke;
      v22[3] = &unk_1E5D17E68;
      id v24 = &v27;
      id v25 = &v33;
      id v23 = v6;
      [v13 accessSystemScopeUsingBlock:v22];

LABEL_14:
      goto LABEL_15;
    case 3:
      char v7 = 1;
      break;
    default:
      int v14 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = MIStringForInstallationDomain();
        IXApplicationRecordForIdentityInDomain_cold_1(v15, buf, v14);
      }

      uint64_t v16 = MIStringForInstallationDomain();
      uint64_t v18 = _CreateError((uint64_t)"IXApplicationRecordForIdentityInDomain", 139, @"IXErrorDomain", 1uLL, 0, 0, @"Unexpected value for installation domain: %@", v17, (uint64_t)v16);

      id v13 = (void *)v28[5];
      v28[5] = v18;
      goto LABEL_14;
  }
  id v8 = objc_alloc(MEMORY[0x1E4F223C8]);
  uint64_t v9 = (id *)(v28 + 5);
  id obj = (id)v28[5];
  uint64_t v10 = [v8 initWithBundleIdentifier:v6 allowPlaceholder:1 error:&obj];
  objc_storeStrong(v9, obj);
  uint64_t v11 = (void *)v34[5];
  v34[5] = v10;

  if (v34[5]) {
    char v12 = 1;
  }
  else {
    char v12 = v7;
  }
  if ((v12 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_15:
  uint64_t v19 = (void *)v34[5];
  if (a3 && !v19)
  {
    *a3 = (id) v28[5];
    uint64_t v19 = (void *)v34[5];
  }
  id v20 = v19;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v20;
}

void sub_1A7B6082C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __IXApplicationRecordForIdentityInDomain_block_invoke(void *a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6 || (a2 & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4F223C8]);
    uint64_t v8 = a1[4];
    uint64_t v9 = *(void *)(a1[5] + 8);
    id obj = *(id *)(v9 + 40);
    uint64_t v10 = [v7 initWithBundleIdentifier:v8 allowPlaceholder:1 error:&obj];
    objc_storeStrong((id *)(v9 + 40), obj);
    uint64_t v11 = *(void *)(a1[6] + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

id IXApplicationRecordPromiseForIdentityInDomain(void *a1, uint64_t a2, void *a3)
{
  id v10 = 0;
  id v4 = IXApplicationRecordForIdentityInDomain(a1, a2, &v10);
  id v5 = v10;
  if (v4)
  {
    id v9 = v5;
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F22470]) initWithRecord:v4 error:&v9];
    id v7 = v9;

    id v5 = v7;
    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    id v6 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }
  if (!v6) {
    *a3 = v5;
  }
LABEL_7:

  return v6;
}

void sub_1A7B65778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_1A7B65C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B66038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B66570(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B66B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_1A7B66FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B6751C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B67A98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B67EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B68350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B68778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B68CB0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B690A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B694C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B69A00(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B6A04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1A7B6A71C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_1A7B6AB14(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B6AEA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B6B7A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B6BC20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B6BF7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B6C3F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B6C648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B6C820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B6CEF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B6D1B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void IXDisplayUserPresentableErrorForAppWithIdentity(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = +[IXServerConnection sharedConnection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __IXDisplayUserPresentableErrorForAppWithIdentity_block_invoke;
  v6[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v6[4] = a2;
  id v5 = [v4 remoteObjectProxyWithErrorHandler:v6];
  objc_msgSend(v5, "_remote_displayUserPresentableErrorForApp:code:", v3, a2);
}

void __IXDisplayUserPresentableErrorForAppWithIdentity_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __IXDisplayUserPresentableErrorForAppWithIdentity_block_invoke_cold_1();
  }
}

void IXDisplayUserPresentableErrorForAppsWithIdentitites(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = +[IXServerConnection sharedConnection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __IXDisplayUserPresentableErrorForAppsWithIdentitites_block_invoke;
  v6[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v6[4] = a2;
  id v5 = [v4 remoteObjectProxyWithErrorHandler:v6];
  objc_msgSend(v5, "_remote_displayUserPresentableErrorForApps:code:", v3, a2);
}

void __IXDisplayUserPresentableErrorForAppsWithIdentitites_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __IXDisplayUserPresentableErrorForAppsWithIdentitites_block_invoke_cold_1();
  }
}

void IXDisplayUserPresentableErrorForApp(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v3];

  IXDisplayUserPresentableErrorForAppWithIdentity(v4, a2);
}

void IXDisplayUserPresentableErrorForApps(uint64_t a1, uint64_t a2)
{
  id v3 = +[IXApplicationIdentity identitiesForBundleIdentifiers:a1];
  IXDisplayUserPresentableErrorForAppsWithIdentitites(v3, a2);
}

void IXDisplayUserPresentableErrorForAppWithLocalizedName(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = +[IXServerConnection sharedConnection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __IXDisplayUserPresentableErrorForAppWithLocalizedName_block_invoke;
  v6[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v6[4] = a2;
  id v5 = [v4 remoteObjectProxyWithErrorHandler:v6];
  objc_msgSend(v5, "_remote_displayUserPresentableErrorForAppWithLocalizedName:code:", v3, a2);
}

void __IXDisplayUserPresentableErrorForAppWithLocalizedName_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __IXDisplayUserPresentableErrorForAppWithLocalizedName_block_invoke_cold_1();
  }
}

__CFString *IXStringForCoordinatorImportance(unint64_t a1)
{
  if (a1 > 4) {
    return @"Unhandled";
  }
  else {
    return off_1E5D17F98[a1];
  }
}

BOOL IXOncePerBootWorkNeeded(void *a1)
{
  uint64_t v1 = (const char *)[a1 UTF8String];
  size_t v2 = strlen(v1);
  if (v2 >= 0x20) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Identifier %s must be less <= %d bytes in length but was %ld bytes", v1, 31, v2);
  }
  id v3 = sem_open(v1, 0);
  id v4 = v3;
  if (v3 != (sem_t *)-1) {
    sem_close(v3);
  }
  return v4 == (sem_t *)-1;
}

void IXSetOncePerBootWorkCompleted(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (const char *)[a1 UTF8String];
  size_t v2 = strlen(v1);
  if (v2 >= 0x20) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Identifier %s must be less <= %d bytes in length but was %ld bytes", v1, 31, v2);
  }
  id v3 = sem_open(v1, 512, 256, 0);
  if (v3 == (sem_t *)-1)
  {
    id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = __error();
      id v6 = strerror(*v5);
      *(_DWORD *)buf = 136315650;
      uint64_t v8 = "IXSetOncePerBootWorkCompleted";
      __int16 v9 = 2080;
      id v10 = v1;
      __int16 v11 = 2080;
      uint64_t v12 = v6;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to create semaphore %s: %s", buf, 0x20u);
    }
  }
  else
  {
    sem_close(v3);
  }
}

BOOL IXRunOncePerBootWork(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = IXOncePerBootWorkNeeded(v3);
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1AD0D4670]();
    v4[2](v4);
    IXSetOncePerBootWorkCompleted(v3);
  }

  return v5;
}

void _RemoveDelegateFromMap(void *a1)
{
  uint64_t v1 = sAppInstallCoordinatorQueue;
  id v2 = a1;
  dispatch_assert_queue_V2(v1);
  [(id)sOutstandingDelegates removeObject:v2];
}

void sub_1A7B6FA40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void _AddDelegateToMap(void *a1)
{
  uint64_t v1 = sAppInstallCoordinatorQueue;
  id v2 = a1;
  dispatch_assert_queue_V2(v1);
  [(id)sOutstandingDelegates addObject:v2];
}

void sub_1A7B70614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B7091C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B714D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_1A7B71EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B72220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

__CFString *IXStringForAppRemovability(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown IXAppRemovability value: %lu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5D18150[a1];
  }

  return v1;
}

__CFString *IXStringForAppRemovabilityClient(unint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown IXAppRemovabilityClient value: %lu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5D18170[a1];
  }

  return v1;
}

void sub_1A7B73334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *IXStringForCoordinatorScopeRequirement(unsigned int a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown Coordinator Scope Requirement: %hhu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5D18238[(char)a1];
  }

  return v1;
}

BOOL IXCoordinatorScopeRequirementIsDefinedValue(unsigned int a1)
{
  return a1 < 3;
}

void sub_1A7B75950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B764FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B7A6A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_1A7B7AA44(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B7ADCC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B7B298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B7B600(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B7C3C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B7CB28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A7B7D040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B7D434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7B7D814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

__CFString *IXStringForCoordinatorScope(unsigned int a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown IXCoordinatorScope value %hhu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5D18368[(char)a1];
  }

  return v1;
}

id IXCopyRemovabilityStorageURL()
{
  if (_sRemovabilityStorageURLOverride)
  {
    id v0 = (id)_sRemovabilityStorageURLOverride;
  }
  else
  {
    uint64_t v1 = +[IXGlobalConfiguration sharedInstance];
    id v6 = 0;
    id v2 = [v1 removabilityDirectoryWithError:&v6];
    id v3 = v6;

    if (v2)
    {
      id v0 = [v2 URLByAppendingPathComponent:@"RemovabilityMetadataWithMultipleSources.plist" isDirectory:0];
    }
    else
    {
      id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        IXCopyRemovabilityStorageURL_cold_1();
      }

      id v0 = 0;
    }
  }

  return v0;
}

id IXCopyRemovabilityStorageWithChangeClockURL()
{
  if (_sRemovabilityStorageWithChangeClockURLOverride)
  {
    id v0 = (id)_sRemovabilityStorageWithChangeClockURLOverride;
  }
  else
  {
    uint64_t v1 = +[IXGlobalConfiguration sharedInstance];
    id v6 = 0;
    id v2 = [v1 removabilityDirectoryWithError:&v6];
    id v3 = v6;

    if (v2)
    {
      id v0 = [v2 URLByAppendingPathComponent:@"ClockedRemovabilityMetadata.plist" isDirectory:0];
    }
    else
    {
      id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        IXCopyRemovabilityStorageWithChangeClockURL_cold_1();
      }

      id v0 = 0;
    }
  }

  return v0;
}

void IXSetRemovabilityStorageURLOverride(id obj)
{
}

void IXSetRemovabilityStorageWithChangeClockURLOverride(id obj)
{
}

IXAppRemovabilityMetadata *IXGetRemovabilityMetadataForApp(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = [a1 objectForKeyedSubscript:a2];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 mostRestrictiveRemovabilityMetadata];
    __int16 v9 = v8;
    if (v8) {
      id v10 = v8;
    }
    else {
      id v10 = [[IXAppRemovabilityMetadata alloc] initWithRemovability:a3 client:a4];
    }
    __int16 v11 = v10;
  }
  else
  {
    __int16 v11 = [[IXAppRemovabilityMetadata alloc] initWithRemovability:a3 client:a4];
  }

  return v11;
}

uint64_t IXGetRemovabilityForAppByClient(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = [a1 objectForKeyedSubscript:a2];
  id v7 = v6;
  if (v6) {
    a3 = [v6 removabilityForClient:a4 notFoundRemovability:a3];
  }

  return a3;
}

uint64_t IXGetUncachedRemovabilityMetadataForAppByClient(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  uint64_t v8 = _GetRemovabilityData(v7, a4);
  __int16 v9 = v8;
  if (v8) {
    uint64_t v10 = IXGetRemovabilityForAppByClient(v8, (uint64_t)v7, a3, a2);
  }
  else {
    uint64_t v10 = 0;
  }

  return v10;
}

id _GetRemovabilityData(void *a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = IXCopyRemovabilityStorageURL();
  BOOL v5 = _CopyRemovabilityDataFromURL(v4);

  if (v5)
  {
    id v29 = 0;
    char v6 = [v3 resolvePersonaRespectingSandboxingWithError:&v29];
    id v7 = v29;
    uint64_t v8 = v7;
    if (v6)
    {
      id v23 = a2;
      id v24 = v7;
      id v22 = v3;
      __int16 v9 = [v3 possibleSerializationsForPlistKey];
      uint64_t v10 = objc_opt_new();
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v11 = v9;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = [NSString stringWithFormat:@"%@:%@", @"RemovabilityEntries", *(void *)(*((void *)&v25 + 1) + 8 * i)];
            [v10 addObject:v16];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v13);
      }

      uint64_t v17 = [NSString stringWithFormat:@"%@:%@", @"RemovabilityChangeClock", @"sequenceNumber"];
      [v10 addObject:v17];

      uint64_t v18 = [NSString stringWithFormat:@"%@:%@", @"RemovabilityChangeClock", @"guid"];
      [v10 addObject:v18];

      uint64_t v19 = [v10 copy];
      _CFPropertyListCreateFiltered();

      id v20 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      id v3 = v22;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        _GetRemovabilityData_cold_7();
      }

      if (v23) {
        *id v23 = 0;
      }

      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v19 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        _GetRemovabilityData_cold_8();
      }
    }
  }

  return 0;
}

IXAppRemovabilityMetadata *IXGetUncachedRemovabilityMetadataForApp(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  uint64_t v8 = _GetRemovabilityData(v7, a4);
  __int16 v9 = v8;
  if (v8)
  {
    IXGetRemovabilityMetadataForApp(v8, (uint64_t)v7, a2, a3);
    uint64_t v10 = (IXAppRemovabilityMetadata *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v10 = [[IXAppRemovabilityMetadata alloc] initWithRemovability:0 client:0];
  }
  id v11 = v10;

  return v11;
}

NSObject *IXGetUncachedRemovabilityDataStore(void *a1)
{
  id v2 = IXCopyRemovabilityStorageURL();
  id v3 = _CopyRemovabilityDataFromURL(v2);

  if (!v3)
  {
    id v11 = 0;
    goto LABEL_49;
  }
  id v25 = 0;
  id v4 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:0 error:&v25];
  id v5 = v25;
  if (v4)
  {
    objc_opt_class();
    id v6 = v4;
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      uint64_t v8 = [v7 objectForKeyedSubscript:@"RemovabilityEntries"];
      if (v8)
      {
        objc_opt_class();
        id v9 = v8;
        if (objc_opt_isKindOfClass()) {
          id v10 = v9;
        }
        else {
          id v10 = 0;
        }

        if (v10)
        {
          uint64_t v12 = [v7 objectForKeyedSubscript:@"RemovabilityChangeClock"];
          if (v12)
          {
            objc_opt_class();
            uint64_t v13 = v12;
            if (objc_opt_isKindOfClass()) {
              uint64_t v14 = v13;
            }
            else {
              uint64_t v14 = 0;
            }

            if (v14)
            {
              id v24 = _RemovabilityPListToMetadata(v9);
              if (v24)
              {
                uint64_t v18 = +[IXDataStoreClock newClockWithDictionary:v13];
                if (v18)
                {
                  uint64_t v19 = v18;
                  if (a1) {
                    *a1 = v18;
                  }
                  uint64_t v15 = v24;
                  int v16 = 1;
                  goto LABEL_42;
                }
                id v20 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
                  IXGetUncachedRemovabilityDataStore_cold_7();
                }

                uint64_t v15 = 0;
                uint64_t v19 = 0;
              }
              else
              {
                uint64_t v19 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
                  IXGetUncachedRemovabilityDataStore_cold_6();
                }
                uint64_t v15 = 0;
              }
              int v16 = 0;
LABEL_42:

              uint64_t v17 = v24;
              goto LABEL_43;
            }
            uint64_t v17 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              IXGetUncachedRemovabilityDataStore_cold_5();
            }
          }
          else
          {
            uint64_t v17 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              IXGetUncachedRemovabilityDataStore_cold_4();
            }
          }
          uint64_t v15 = 0;
          int v16 = 0;
LABEL_43:

          goto LABEL_44;
        }
        uint64_t v12 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          IXGetUncachedRemovabilityDataStore_cold_3();
        }
      }
      else
      {
        uint64_t v12 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          IXGetUncachedRemovabilityDataStore_cold_2();
        }
      }
      uint64_t v15 = 0;
      int v16 = 0;
LABEL_44:

      id v21 = v15;
      id v22 = v21;
      if (v16) {
        id v11 = v21;
      }
      else {
        id v11 = 0;
      }

      goto LABEL_48;
    }

    id v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      IXGetUncachedRemovabilityDataStore_cold_8(v7);
    }
  }
  else
  {
    id v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      IXGetUncachedRemovabilityDataStore_cold_1();
    }
  }
  id v11 = 0;
LABEL_48:

LABEL_49:

  return v11;
}

id _CopyRemovabilityDataFromURL(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v18 = 0;
    id v2 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v1 options:1 error:&v18];
    id v3 = v18;
    id v4 = v3;
    if (v2) {
      goto LABEL_21;
    }
    id v5 = [v3 domain];
    uint64_t v6 = *MEMORY[0x1E4F281F8];
    if ([v5 isEqualToString:*MEMORY[0x1E4F281F8]] && -[NSObject code](v4, "code") == 257)
    {
      id v7 = [v4 userInfo];
      uint64_t v8 = *MEMORY[0x1E4F28A50];
      id v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
      id v10 = [v9 domain];
      if ([v10 isEqualToString:*MEMORY[0x1E4F28798]])
      {
        id v11 = [v4 userInfo];
        uint64_t v12 = [v11 objectForKeyedSubscript:v8];
        uint64_t v17 = [v12 code];

        if (v17 == 1)
        {
          uint64_t v13 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
            _CopyRemovabilityDataFromURL_cold_2(v1, v13);
          }
LABEL_20:

          goto LABEL_21;
        }
LABEL_14:
        uint64_t v14 = [v4 domain];
        if ([v14 isEqualToString:v6])
        {
          uint64_t v15 = [v4 code];

          if (v15 == 260) {
            goto LABEL_21;
          }
        }
        else
        {
        }
        uint64_t v13 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          _CopyRemovabilityDataFromURL_cold_3(v1, (uint64_t)v4, v13);
        }
        goto LABEL_20;
      }
    }
    goto LABEL_14;
  }
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    _CopyRemovabilityDataFromURL_cold_1(v4);
  }
  id v2 = 0;
LABEL_21:

  return v2;
}

id _IXValidateObject(void *a1)
{
  id v1 = a1;
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id _RemovabilityPListToMetadata(void *a1)
{
  id v1 = a1;
  id v2 = objc_opt_new();
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = ___RemovabilityPListToMetadata_block_invoke;
  id v9 = &unk_1E5D18388;
  id v10 = v2;
  uint64_t v11 = 3;
  id v3 = v2;
  [v1 enumerateKeysAndObjectsUsingBlock:&v6];

  id v4 = objc_msgSend(v3, "copy", v6, v7, v8, v9);

  return v4;
}

id LoadInfoPlistFromBundleAtURL(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  Unique = (__CFBundle *)_CFBundleCreateUnique();
  if (Unique)
  {
    uint64_t v8 = Unique;
    id v15 = 0;
    id v9 = LoadInfoPlistFromBundle(Unique, v6, &v15);
    id v10 = v15;
    CFRelease(v8);
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  uint64_t v11 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    LoadInfoPlistFromBundleAtURL_cold_1(v5);
  }

  uint64_t v12 = [v5 path];
  _CreateError((uint64_t)"LoadInfoPlistFromBundleAtURL", 24, @"IXErrorDomain", 0xAuLL, 0, 0, @"Failed to create CFBundle from %@", v13, (uint64_t)v12);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = 0;
  if (a3)
  {
LABEL_7:
    if (!v9) {
      *a3 = v10;
    }
  }
LABEL_9:

  return v9;
}

id LoadInfoPlistFromBundle(__CFBundle *a1, void *a2, void *a3)
{
  id v5 = a2;
  if (!v5)
  {
    uint64_t v8 = CFBundleGetInfoDictionary(a1);
    FilteredInfoPlist = v8;
    if (v8)
    {
      id v9 = (void *)[v8 mutableCopy];
      uint64_t v7 = v9;
      if (v9) {
        [v9 removeObjectForKey:@"CFBundleInfoPlistURL"];
      }
      goto LABEL_8;
    }
    int v16 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      LoadInfoPlistFromBundle_cold_1();
    }

    _CreateError((uint64_t)"LoadInfoPlistFromBundle", 72, @"IXErrorDomain", 0xFuLL, 0, 0, @"CFBundleGetInfoDictionary returned NULL for bundle %@", v17, (uint64_t)a1);
    goto LABEL_18;
  }
  FilteredInfoPlist = (void *)_CFBundleCreateFilteredInfoPlist();
  if (!FilteredInfoPlist)
  {
    uint64_t v11 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      LoadInfoPlistFromBundle_cold_2((uint64_t)v5, (uint64_t)a1, v11);
    }

    _CreateError((uint64_t)"LoadInfoPlistFromBundle", 55, @"IXErrorDomain", 0xFuLL, 0, 0, @"Failed to get filtered Info.plist with keys %@ from bundle %@", v12, (uint64_t)v5);
    id v10 = LABEL_18:;
LABEL_19:
    uint64_t v7 = 0;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      LoadInfoPlistFromBundle_cold_3((uint64_t)a1, (uint64_t)FilteredInfoPlist, v13);
    }

    uint64_t v14 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v14);
    id v10 = _CreateError((uint64_t)"LoadInfoPlistFromBundle", 60, @"IXErrorDomain", 0x10uLL, 0, 0, @"Object returned from _CFBundleCreateFilteredInfoPlist for %@ was not a dictionary, was type %@", v15, (uint64_t)a1);

    goto LABEL_19;
  }
  uint64_t v7 = (void *)[FilteredInfoPlist mutableCopy];
LABEL_8:
  id v10 = 0;
LABEL_20:

  if (a3 && !v7) {
    *a3 = v10;
  }

  return v7;
}

id AppURLFromExtractedPayloadDir(void *a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v26 = 0;
  id v4 = IXUrlsForItemsInDirectoryAtURL(v3, 1, &v26);
  id v5 = v26;
  if (!v4)
  {
LABEL_16:
    if (a2)
    {
      id v5 = v5;
      id v14 = 0;
      *a2 = v5;
    }
    else
    {
      id v14 = 0;
    }
    goto LABEL_19;
  }
  id v20 = a2;
  id v21 = v3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (!v7)
  {
LABEL_10:

LABEL_13:
    uint64_t v15 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    id v3 = v21;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      AppURLFromExtractedPayloadDir_cold_1(v21);
    }

    int v16 = [v21 path];
    uint64_t v18 = _CreateError((uint64_t)"AppURLFromExtractedPayloadDir", 112, @"IXErrorDomain", 0xAuLL, 0, 0, @"Failed to find a \".app\" inside the extracted contents at %@", v17, (uint64_t)v16);

    id v5 = (id)v18;
    a2 = v20;
    goto LABEL_16;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v23;
LABEL_4:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v23 != v9) {
      objc_enumerationMutation(v6);
    }
    uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
    uint64_t v12 = [v11 pathExtension];
    char v13 = [v12 isEqualToString:@"app"];

    if (v13) {
      break;
    }
    if (v8 == ++v10)
    {
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v8) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  id v14 = v11;

  if (!v14) {
    goto LABEL_13;
  }
  id v3 = v21;
LABEL_19:

  return v14;
}

void _RemoveDelegateFromMap_0(void *a1)
{
  id v1 = sAppInstallCoordinatorQueue_0;
  id v2 = a1;
  dispatch_assert_queue_V2(v1);
  [(id)sOutstandingDelegates_0 removeObject:v2];
}

void _AddDelegateToMap_0(void *a1)
{
  id v1 = sAppInstallCoordinatorQueue_0;
  id v2 = a1;
  dispatch_assert_queue_V2(v1);
  [(id)sOutstandingDelegates_0 addObject:v2];
}

void sub_1A7B80894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_1A7B80AE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

__CFString *IXStatusForInstallationProgress(int a1)
{
  if (a1 <= 39)
  {
    if (a1 > 19)
    {
      switch(a1)
      {
        case 20:
          return @"InspectingPackage";
        case 30:
          return @"PreflightingApplication";
        case 35:
          return @"PatchingApplication";
      }
    }
    else
    {
      switch(a1)
      {
        case 0:
          return @"InstallingEmbeddedProfile";
        case 5:
          return @"CreatingStagingDirectory";
        case 15:
          return @"ExtractingPackage";
      }
    }
  }
  else if (a1 <= 69)
  {
    switch(a1)
    {
      case '(':
        return @"VerifyingApplication";
      case '2':
        return @"CreatingContainer";
      case '<':
        return @"InstallingApplication";
    }
  }
  else if (a1 > 89)
  {
    if (a1 == 90) {
      return @"GeneratingApplicationMap";
    }
    if (a1 == 100) {
      return @"InstallComplete";
    }
  }
  else
  {
    if (a1 == 70) {
      return @"PostflightingApplication";
    }
    if (a1 == 80) {
      return @"SandboxingApplication";
    }
  }
  return @"UnknownStatus";
}

__CFString *IXStatusForUninstallationProgress(int a1)
{
  id v1 = @"UnknownStatus";
  if (a1 == 90) {
    id v1 = @"GeneratingApplicationMap";
  }
  if (a1 == 50) {
    return @"RemovingApplication";
  }
  else {
    return v1;
  }
}

void sub_1A7B81B6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A7B822B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void sub_1A7B82580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t IXRemoveItemAtURL(void *a1, int a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = removefile_state_alloc();
  uint64_t v8 = v6;
  int value = 0;
  if (!v5)
  {
    id v20 = (void *)*MEMORY[0x1E4F28798];
    id v21 = @"nil url passed to -removeItemAtURL:error:";
    uint64_t v22 = 54;
    unint64_t v23 = 14;
LABEL_19:
    _CreateError((uint64_t)"IXRemoveItemAtURL", v22, v20, v23, 0, 0, v21, v7, v30);
    goto LABEL_20;
  }
  if (removefile_state_set(v6, 3u, _removefile_error_callback))
  {
    uint64_t v9 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = __error();
      uint64_t v11 = strerror(*v10);
      *(_DWORD *)buf = 136315394;
      uint64_t v33 = "IXRemoveItemAtURL";
      __int16 v34 = 2080;
      uint64_t v35 = v11;
      _os_log_impl(&dword_1A7B2D000, v9, OS_LOG_TYPE_DEFAULT, "%s: removefile_state_set REMOVEFILE_STATE_ERROR_CALLBACK failed: %s", buf, 0x16u);
    }
  }
  if (removefile_state_set(v8, 4u, &value))
  {
    uint64_t v12 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      char v13 = __error();
      id v14 = strerror(*v13);
      *(_DWORD *)buf = 136315394;
      uint64_t v33 = "IXRemoveItemAtURL";
      __int16 v34 = 2080;
      uint64_t v35 = v14;
      _os_log_impl(&dword_1A7B2D000, v12, OS_LOG_TYPE_DEFAULT, "%s: removefile_state_set REMOVEFILE_STATE_ERROR_CONTEXT failed: %s", buf, 0x16u);
    }
  }
  if (a2) {
    removefile_flags_t v15 = 3;
  }
  else {
    removefile_flags_t v15 = 1;
  }
  id v16 = v5;
  if (removefile((const char *)[v16 fileSystemRepresentation], v8, v15) && *__error() != 2)
  {
    long long v24 = (void *)*MEMORY[0x1E4F28798];
    unint64_t v25 = *__error();
    id v26 = __error();
    uint64_t v30 = (uint64_t)v16;
    strerror(*v26);
    id v21 = @"removefile of %@ failed: %s";
    uint64_t v22 = 75;
    id v20 = v24;
    unint64_t v23 = v25;
    goto LABEL_19;
  }
  unint64_t v17 = value;
  if ((value & 0xFFFFFFFD) == 0)
  {
    removefile_state_free(v8);
    id v27 = 0;
    uint64_t v28 = 1;
    goto LABEL_24;
  }
  uint64_t v18 = (void *)*MEMORY[0x1E4F28798];
  strerror(value);
  _CreateError((uint64_t)"IXRemoveItemAtURL", 81, v18, v17, 0, 0, @"removefile of %@ failed: %s", v19, (uint64_t)v16);
LABEL_20:
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  removefile_state_free(v8);
  if (a3)
  {
    id v27 = v27;
    uint64_t v28 = 0;
    *a3 = v27;
  }
  else
  {
    uint64_t v28 = 0;
  }
LABEL_24:

  return v28;
}

uint64_t _removefile_error_callback(_removefile_state *a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int dst = 0;
  if (removefile_state_get(a1, 5u, &dst))
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "_removefile_error_callback";
      __int16 v12 = 2080;
      uint64_t v13 = a2;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: removefile hit error for %s but we failed to get the error number", buf, 0x16u);
    }

    int dst = 2;
  }
  else if (dst != 2)
  {
    id v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = strerror(dst);
      *(_DWORD *)buf = 136315650;
      uint64_t v11 = "_removefile_error_callback";
      __int16 v12 = 2080;
      uint64_t v13 = a2;
      __int16 v14 = 2080;
      removefile_flags_t v15 = v7;
      _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, "%s: removefile hit error for %s : %s", buf, 0x20u);
    }
  }
  if (a3 && !*a3) {
    *a3 = dst;
  }
  return 0;
}

BOOL IXCopyItemAtURL(void *a1, void *a2, char a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  if ((a3 & 1) != 0
    || (memset(&v23, 0, sizeof(v23)),
        id v9 = v7,
        !lstat((const char *)[v9 fileSystemRepresentation], &v23)))
  {
    id v12 = v7;
    if (!copyfile((const char *)[v12 fileSystemRepresentation], (const char *)objc_msgSend(v8, "fileSystemRepresentation"), 0, 0x10C800Fu))
    {
      id v21 = 0;
      BOOL v11 = 1;
      goto LABEL_14;
    }
    uint64_t v13 = (void *)*MEMORY[0x1E4F28798];
    unint64_t v14 = *__error();
    removefile_flags_t v15 = __error();
    strerror(*v15);
    _CreateError((uint64_t)"IXCopyItemAtURL", 121, v13, v14, 0, 0, @"copyfile of %@ to %@ failed: %s", v16, (uint64_t)v12);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v11 = 0;
    if (!a4) {
      goto LABEL_14;
    }
  }
  else
  {
    int v10 = *__error();
    BOOL v11 = v10 == 2;
    if (v10 == 2)
    {
      id v21 = 0;
      if (!a4) {
        goto LABEL_14;
      }
    }
    else
    {
      unint64_t v17 = (void *)*MEMORY[0x1E4F28798];
      unint64_t v18 = *__error();
      uint64_t v19 = __error();
      strerror(*v19);
      _CreateError((uint64_t)"IXCopyItemAtURL", 106, v17, v18, 0, 0, @"stat of %@ failed: %s", v20, (uint64_t)v9);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      if (!a4) {
        goto LABEL_14;
      }
    }
  }
  if (!v11)
  {
    id v21 = v21;
    BOOL v11 = 0;
    *a4 = v21;
  }
LABEL_14:

  return v11;
}

BOOL IXItemExistsAtURL(void *a1, BOOL *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  memset(&v14, 0, sizeof(v14));
  id v5 = a1;
  int v6 = lstat((const char *)[v5 fileSystemRepresentation], &v14);
  if (v6)
  {
    unint64_t v7 = *__error();
    if (v7 != 2)
    {
      id v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = strerror(v7);
        *(_DWORD *)buf = 136315650;
        uint64_t v16 = "IXItemExistsAtURL";
        __int16 v17 = 2112;
        id v18 = v5;
        __int16 v19 = 2080;
        uint64_t v20 = v9;
        _os_log_impl(&dword_1A7B2D000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to determine if %@ exists: %s", buf, 0x20u);
      }
    }
    if (a3)
    {
      int v10 = (void *)*MEMORY[0x1E4F28798];
      uint64_t v11 = [v5 fileSystemRepresentation];
      strerror(v7);
      _CreateError((uint64_t)"IXItemExistsAtURL", 155, v10, v7, 0, 0, @"lstat of %s failed: %s", v12, v11);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (a2)
  {
    *a2 = (v14.st_mode & 0xF000) == 0x4000;
  }

  return v6 == 0;
}

BOOL IXCreateDirectoryAtURL(void *a1, int a2, mode_t a3, uint64_t a4, void *a5)
{
  id v9 = a1;
  int v10 = (const char *)[v9 fileSystemRepresentation];
  if (a2)
  {
    int v11 = mkpath_np(v10, a3);
    if (v11)
    {
      int v12 = v11;
      if (v11 != 17)
      {
        uint64_t v13 = (void *)*MEMORY[0x1E4F28798];
        stat v14 = [v9 path];
        strerror(v12);
        _CreateError((uint64_t)"IXCreateDirectoryAtURL", 171, v13, v12, 0, 0, @"mkpath_np of %@ failed: %s", v15, (uint64_t)v14);
        id v16 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }
    }
  }
  else if (mkdir(v10, a3) && *__error() != 17)
  {
    uint64_t v28 = (void *)*MEMORY[0x1E4F28798];
    unint64_t v29 = *__error();
    uint64_t v30 = [v9 path];
    uint64_t v31 = __error();
    strerror(*v31);
    _CreateError((uint64_t)"IXCreateDirectoryAtURL", 177, v28, v29, 0, 0, @"mkdir of %@ failed: %s", v32, (uint64_t)v30);
LABEL_14:
    id v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
    BOOL v22 = 0;
    if (!a5) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  if (a4 == -1)
  {
    id v16 = 0;
    BOOL v22 = 1;
    goto LABEL_21;
  }
  id v17 = v9;
  id v18 = opendir((const char *)[v17 fileSystemRepresentation]);
  if (!v18)
  {
    uint64_t v33 = (void *)*MEMORY[0x1E4F28798];
    unint64_t v34 = *__error();
    uint64_t v30 = [v17 path];
    uint64_t v35 = __error();
    strerror(*v35);
    _CreateError((uint64_t)"IXCreateDirectoryAtURL", 189, v33, v34, 0, 0, @"opendir of %@ failed: %s", v36, (uint64_t)v30);
    goto LABEL_14;
  }
  __int16 v19 = v18;
  int v20 = dirfd(v18);
  int v21 = fcntl(v20, 64, a4);
  BOOL v22 = v21 == 0;
  if (v21)
  {
    stat v23 = (void *)*MEMORY[0x1E4F28798];
    unint64_t v24 = *__error();
    unint64_t v25 = [v17 path];
    id v26 = __error();
    strerror(*v26);
    _CreateError((uint64_t)"IXCreateDirectoryAtURL", 195, v23, v24, 0, 0, @"Failed to setclass(%d) on directory %@: %s", v27, a4);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v16 = 0;
  }
  closedir(v19);
  if (a5)
  {
LABEL_19:
    if (!v22)
    {
      id v16 = v16;
      BOOL v22 = 0;
      *a5 = v16;
    }
  }
LABEL_21:

  return v22;
}

id IXUrlsForItemsInDirectoryAtURL(void *a1, char a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  int v6 = objc_opt_new();
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  unint64_t v7 = v39;
  v39[0] = __IXUrlsForItemsInDirectoryAtURL_block_invoke;
  v39[1] = &unk_1E5D18540;
  char v42 = a2;
  id v8 = v5;
  id v40 = v8;
  id v9 = v6;
  id v41 = v9;
  id v10 = v8;
  int v11 = v38;
  memset(&v45, 0, 512);
  v43 = 0;
  id v12 = v10;
  int v13 = open((const char *)[v12 fileSystemRepresentation], 1048832);
  if (v13 < 0)
  {
    int v16 = *__error();
  }
  else
  {
    v37 = v12;
    stat v14 = fdopendir(v13);
    if (v14)
    {
      uint64_t v15 = v14;
      id v35 = v9;
      uint64_t v36 = a3;
      while (1)
      {
        int v16 = readdir_r(v15, &v45, &v43);
        if (v16 || !v43)
        {
LABEL_17:
          closedir(v15);
          id v9 = v35;
          a3 = v36;
          goto LABEL_20;
        }
        id v17 = (void *)MEMORY[0x1AD0D4670]();
        id v18 = v43;
        if (!v43->d_type) {
          break;
        }
LABEL_16:
        char v28 = ((uint64_t (*)(void *, dirent *))v39[0])(v11, v18);
        if ((v28 & 1) == 0) {
          goto LABEL_17;
        }
      }
      __int16 v19 = v7;
      memset(&v44, 0, sizeof(v44));
      int v20 = NSString;
      uint64_t d_namlen = v43->d_namlen;
      id v22 = v37;
      stat v23 = [v20 stringWithFileSystemRepresentation:v18->d_name length:d_namlen];
      unint64_t v24 = [v22 URLByAppendingPathComponent:v23 isDirectory:0];

      id v25 = v24;
      if (!lstat((const char *)[v25 fileSystemRepresentation], &v44))
      {
        int v26 = v44.st_mode & 0xF000;
        switch(v26)
        {
          case 16384:
            char v27 = 4;
            goto LABEL_14;
          case 32768:
            char v27 = 8;
            goto LABEL_14;
          case 40960:
            char v27 = 10;
LABEL_14:
            v18->d_type = v27;
            break;
        }
      }

      id v18 = v43;
      unint64_t v7 = v19;
      goto LABEL_16;
    }
    int v16 = *__error();
LABEL_20:
    id v12 = v37;
  }

  if (v16)
  {
    unint64_t v29 = (void *)*MEMORY[0x1E4F28798];
    uint64_t v30 = [v12 fileSystemRepresentation];
    strerror(v16);
    uint64_t v32 = _CreateError((uint64_t)"IXUrlsForItemsInDirectoryAtURL", 298, v29, v16, 0, 0, @"_IterateDirectory for %s returned %s", v31, v30);
    uint64_t v33 = 0;
    if (!a3) {
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v33 = (void *)[v9 copy];
    uint64_t v32 = 0;
    if (!a3) {
      goto LABEL_27;
    }
  }
  if (!v33) {
    *a3 = v32;
  }
LABEL_27:

  return v33;
}

uint64_t __IXUrlsForItemsInDirectoryAtURL_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (const char *)(a2 + 21);
  if (strcmp((const char *)(a2 + 21), ".") && strcmp(v4, ".."))
  {
    if (*(unsigned char *)(a2 + 20) == 10 && *(unsigned char *)(a1 + 48))
    {
      id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __IXUrlsForItemsInDirectoryAtURL_block_invoke_cold_1(a1, (uint64_t)v4, v5);
      }
    }
    else
    {
      int v6 = *(void **)(a1 + 32);
      unint64_t v7 = [NSString stringWithFileSystemRepresentation:v4 length:*(unsigned __int16 *)(a2 + 18)];
      id v5 = [v6 URLByAppendingPathComponent:v7 isDirectory:*(unsigned __int8 *)(a2 + 20) == 4];

      if (v5)
      {
        [*(id *)(a1 + 40) addObject:v5];
      }
      else
      {
        id v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = [*(id *)(a1 + 32) path];
          int v11 = 136315650;
          id v12 = "IXUrlsForItemsInDirectoryAtURL_block_invoke";
          __int16 v13 = 2080;
          stat v14 = v4;
          __int16 v15 = 2112;
          int v16 = v9;
          _os_log_impl(&dword_1A7B2D000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to create URL by appending %s to %@", (uint8_t *)&v11, 0x20u);
        }
      }
    }
  }
  return 1;
}

id IXCreateTemporaryDirectoryInDirectoryURL(void *a1, void *a2)
{
  id v3 = [a1 URLByAppendingPathComponent:@"temp.XXXXXX" isDirectory:1];
  id v4 = strdup((const char *)[v3 fileSystemRepresentation]);
  if (mkdtemp(v4))
  {
    id v5 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v4 isDirectory:1 relativeToURL:0];
    int v6 = 0;
    if (!a2) {
      goto LABEL_7;
    }
  }
  else
  {
    unint64_t v7 = __error();
    int v6 = _CreateError((uint64_t)"IXCreateTemporaryDirectoryInDirectoryURL", 321, (void *)*MEMORY[0x1E4F28798], *v7, 0, 0, @"Failed to create temp dir at path %s", v8, (uint64_t)v4);
    id v5 = 0;
    if (!a2) {
      goto LABEL_7;
    }
  }
  if (!v5) {
    *a2 = v6;
  }
LABEL_7:
  free(v4);

  return v5;
}

void sub_1A7B868DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _ClientProcessLookupMachPortName(uint64_t a1, void *a2)
{
  getpid();
  int v4 = sandbox_check();
  if (v4)
  {
    if (v4 == 1)
    {
      id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        _ClientProcessLookupMachPortName_cold_2(a1, v5);
      }

      _CreateError((uint64_t)"_ClientProcessLookupMachPortName", 311, @"IXErrorDomain", 1uLL, 0, 0, @"This process does not have sandbox access to mach-lookup %s", v6, a1);
    }
    else
    {
      int v9 = *__error();
      id v10 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        _ClientProcessLookupMachPortName_cold_1(a1, v9, v10);
      }

      strerror(v9);
      _CreateError((uint64_t)"_ClientProcessLookupMachPortName", 316, @"IXErrorDomain", 1uLL, 0, 0, @"sandbox_check returned an error when checking if this process can mach-lookup %s : %s", v11, a1);
    }
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (a2)
    {
      id v7 = v7;
      uint64_t v8 = 0;
      *a2 = v7;
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    id v7 = 0;
    uint64_t v8 = 1;
  }

  return v8;
}

id _CreateErrorV(uint64_t a1, uint64_t a2, void *a3, unint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v17) {
    uint64_t v19 = [v17 mutableCopy];
  }
  else {
    uint64_t v19 = objc_opt_new();
  }
  int v20 = (void *)v19;
  int v21 = IXStringForIXError(v15, a4);
  [v20 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F28588]];

  if (v18)
  {
    id v22 = (void *)[[NSString alloc] initWithFormat:v18 arguments:a8];
    [v20 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  }
  if (v16) {
    [v20 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  stat v23 = [NSString stringWithUTF8String:a1];
  [v20 setObject:v23 forKeyedSubscript:@"FunctionName"];

  unint64_t v24 = [NSNumber numberWithInt:a2];
  [v20 setObject:v24 forKeyedSubscript:@"SourceFileLine"];

  id v25 = [MEMORY[0x1E4F28C58] errorWithDomain:v15 code:a4 userInfo:v20];

  return v25;
}

id _CreateError(uint64_t a1, uint64_t a2, void *a3, unint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  int v9 = _CreateErrorV(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);

  return v9;
}

void sub_1A7B88430(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A7B889B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A7B88D40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void IXCreateUserPresentableError_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  id v2 = "IXCreateUserPresentableError";
  _os_log_error_impl(&dword_1A7B2D000, log, OS_LOG_TYPE_ERROR, "%s: Client attempted to create IXUserPresentableError with invalid code (kIXUserPresentableUnknownError)", (uint8_t *)&v1, 0xCu);
}

void IXValidateMobileInstallationSPIEntitlement_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = IXCopyClientNameForConnection(a1);
  int v6 = 136316162;
  id v7 = "IXValidateMobileInstallationSPIEntitlement";
  __int16 v8 = 2112;
  int v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = @"com.apple.private.mobileinstall.allowedSPI";
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  __int16 v14 = 2112;
  uint64_t v15 = 0;
  _os_log_error_impl(&dword_1A7B2D000, a3, OS_LOG_TYPE_ERROR, "%s: Process %@ is required to have an entitlement named \"%@\" with an array containing \"%@\" to call this SPI. : %@", (uint8_t *)&v6, 0x34u);
}

void __IXFrameworkBundle_block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1A7B2D000, v0, OS_LOG_TYPE_ERROR, "%s: Failed to load bundle for our framework at %@", (uint8_t *)v1, 0x16u);
}

void IXLocalizedBodyForOSVersionError_cold_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1A7B2D000, v1, OS_LOG_TYPE_ERROR, "%s: Underlying error was nil when constructing OS version error for app name %@ and number of apps %lu", (uint8_t *)v2, 0x20u);
}

void __IXPresentErrorHighlightingLocalizedAppName_block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1A7B2D000, v0, OS_LOG_TYPE_ERROR, "%s: Failed to open Settings : %@", (uint8_t *)v1, 0x16u);
}

void _CheckCancelRequestSanity_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Reason passed to IXAppInstallCoordinator cancellation method was nil! : %@", v2, v3, v4, v5, 2u);
}

void _CheckCancelRequestSanity_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Cancellation method on IXAppInstallCoordinator was called with client of IXClientNone which is invalid : %@", v2, v3, v4, v5, 2u);
}

void IXEncodeRootObject_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = 136315906;
  uint64_t v4 = "IXEncodeRootObject";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  __int16 v9 = 2112;
  uint64_t v10 = 0;
  _os_log_error_impl(&dword_1A7B2D000, log, OS_LOG_TYPE_ERROR, "%s: Got exception while trying to encode object %@ : %@ : %@", (uint8_t *)&v3, 0x2Au);
}

void IXApplicationRecordForRecordPromise_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1A7B2D000, v0, v1, "%s: Failed to look up LSApplicationRecord from fallback bundle ID %@ : %@", v2);
}

void IXApplicationRecordForRecordPromise_cold_2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1A7B2D000, v0, v1, "%s: Failed to fulfill record promise %@ : %@", v2);
}

void IXApplicationRecordForRecordPromise_cold_3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (objc_class *)objc_opt_class();
  __int16 v7 = NSStringFromClass(v6);
  int v8 = 136315906;
  __int16 v9 = "_FulfillLSRecordPromise";
  __int16 v10 = 2112;
  uint64_t v11 = a1;
  __int16 v12 = 2112;
  uint64_t v13 = v7;
  __int16 v14 = 2112;
  uint64_t v15 = a2;
  _os_log_fault_impl(&dword_1A7B2D000, a3, OS_LOG_TYPE_FAULT, "%s: Expected LSApplicationRecord instance from fulfilling LSRecord promise %@ but got instance with class %@ instead (%@)", (uint8_t *)&v8, 0x2Au);
}

void IXApplicationRecordForIdentityInDomain_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315650;
  *(void *)(buf + 4) = "IXApplicationRecordForIdentityInDomain";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2112;
  *((void *)buf + 3) = 0;
  _os_log_error_impl(&dword_1A7B2D000, log, OS_LOG_TYPE_ERROR, "%s: Unexpected value for installation domain: %@ : %@", buf, 0x20u);
}

void __IXDisplayUserPresentableErrorForAppWithIdentity_block_invoke_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_4_1(&dword_1A7B2D000, v0, v1, "%s: Failed to contact installcoordinationd to present error %lu : %@", v2);
}

void __IXDisplayUserPresentableErrorForAppsWithIdentitites_block_invoke_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_4_1(&dword_1A7B2D000, v0, v1, "%s: Failed to contact installcoordinationd to present error %lu : %@", v2);
}

void __IXDisplayUserPresentableErrorForAppWithLocalizedName_block_invoke_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_4_1(&dword_1A7B2D000, v0, v1, "%s: Failed to contact installcoordinationd to present error %lu : %@", v2);
}

void IXCopyRemovabilityStorageURL_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Failed to get removability directory URL: %@", v2, v3, v4, v5, 2u);
}

void IXCopyRemovabilityStorageWithChangeClockURL_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Failed to get removability directory URL: %@", v2, v3, v4, v5, 2u);
}

void _GetRemovabilityData_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, v0, (uint64_t)v0, "%s: Received non dictionary object for requested keys %@ : %@", (uint8_t *)v1);
}

void _GetRemovabilityData_cold_2()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_3_0();
  uint64_t v4 = @"RemovabilityEntries";
  __int16 v5 = v0;
  uint64_t v6 = 0;
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, v1, v2, "%s: Deserialized removability plist is missing key %@ : %@", (uint8_t *)v3);
}

void _GetRemovabilityData_cold_3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, v0, v1, "%s: Received non dictionary object for %@ : %@", (uint8_t *)v2);
}

void _GetRemovabilityData_cold_4()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Failed to fetch removability metadata from %@", v2, v3, v4, v5, 2u);
}

void _GetRemovabilityData_cold_5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Deserialized removability plist is missing key %@", v2, v3, v4, v5, 2u);
}

void _GetRemovabilityData_cold_6()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, v0, v1, "%s: Received non dictionary object for %@ : %@", (uint8_t *)v2);
}

void _GetRemovabilityData_cold_7()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, v0, (uint64_t)v0, "%s: Failed to fetch removability for %@ : %@", (uint8_t *)v1);
}

void _GetRemovabilityData_cold_8()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_4();
  _os_log_fault_impl(&dword_1A7B2D000, v0, OS_LOG_TYPE_FAULT, "%s: Failed to read removability data because the persona for %@ couldn't be resolved. This defeats a daemon launch avoidance optimization: %@", (uint8_t *)v1, 0x20u);
}

void IXGetUncachedRemovabilityDataStore_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Failed to deserialize removability plist: %@", v2, v3, v4, v5, 2u);
}

void IXGetUncachedRemovabilityDataStore_cold_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, v0, v1, "%s: Deserialized removability plist is missing key %@ : %@", (uint8_t *)v2);
}

void IXGetUncachedRemovabilityDataStore_cold_3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Received non dictionary object for removability entries in deserialized removability plist: %@", v2, v3, v4, v5, 2u);
}

void IXGetUncachedRemovabilityDataStore_cold_4()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, v0, v1, "%s: Deserialized removability plist is missing key %@ : %@", (uint8_t *)v2);
}

void IXGetUncachedRemovabilityDataStore_cold_5()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Received non dictionary object for change clock in deserialized removability plist: %@", v2, v3, v4, v5, 2u);
}

void IXGetUncachedRemovabilityDataStore_cold_6()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Failed to extract removability entries from deserialized removability plist: %@", v2, v3, v4, v5, 2u);
}

void IXGetUncachedRemovabilityDataStore_cold_7()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Failed to extract change clock from deserialized removability plist: %@", v2, v3, v4, v5, 2u);
}

void IXGetUncachedRemovabilityDataStore_cold_8(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "IXGetUncachedRemovabilityDataStore";
  _os_log_error_impl(&dword_1A7B2D000, log, OS_LOG_TYPE_ERROR, "%s: Deserialized removability plist is not dictionary", (uint8_t *)&v1, 0xCu);
}

void _CopyRemovabilityDataFromURL_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "_CopyRemovabilityDataFromURL";
  _os_log_fault_impl(&dword_1A7B2D000, log, OS_LOG_TYPE_FAULT, "%s: removabilityURL was nil, so returning nil.", (uint8_t *)&v1, 0xCu);
}

void _CopyRemovabilityDataFromURL_cold_2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 path];
  v4[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_1A7B2D000, a2, OS_LOG_TYPE_FAULT, "%s: Failed to read removability data from %@ because it wasn't accessible due to sandboxing restrictions on this process. This defeats a daemon launch avoidance optimization.", (uint8_t *)v4, 0x16u);
}

void _CopyRemovabilityDataFromURL_cold_3(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 path];
  int v7 = 136315650;
  int v8 = "_CopyRemovabilityDataFromURL";
  __int16 v9 = 2112;
  __int16 v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, a3, v6, "%s: Failed to read removability data from %@ : %@", (uint8_t *)&v7);
}

void LoadInfoPlistFromBundleAtURL_cold_1(void *a1)
{
  int v1 = [a1 path];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_2(&dword_1A7B2D000, v2, v3, "%s: Failed to create CFBundle from %@ : %@", v4, v5, v6, v7, 2u);
}

void LoadInfoPlistFromBundle_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_13();
  _os_log_error_impl(&dword_1A7B2D000, v0, OS_LOG_TYPE_ERROR, "%s: CFBundleGetInfoDictionary returned NULL for bundle %@ : %@", (uint8_t *)v1, 0x20u);
}

void LoadInfoPlistFromBundle_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = 136315906;
  uint64_t v4 = "LoadInfoPlistFromBundle";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  __int16 v9 = 2112;
  uint64_t v10 = 0;
  _os_log_error_impl(&dword_1A7B2D000, log, OS_LOG_TYPE_ERROR, "%s: Failed to get filtered Info.plist with keys %@ from bundle %@ : %@", (uint8_t *)&v3, 0x2Au);
}

void LoadInfoPlistFromBundle_cold_3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  __int16 v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  int v7 = 136315906;
  uint64_t v8 = "LoadInfoPlistFromBundle";
  __int16 v9 = 2112;
  uint64_t v10 = a1;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  __int16 v13 = 2112;
  uint64_t v14 = 0;
  _os_log_error_impl(&dword_1A7B2D000, a3, OS_LOG_TYPE_ERROR, "%s: Object returned from _CFBundleCreateFilteredInfoPlist for %@ was not a dictionary, was type %@ : %@", (uint8_t *)&v7, 0x2Au);
}

void AppURLFromExtractedPayloadDir_cold_1(void *a1)
{
  int v1 = [a1 path];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_2(&dword_1A7B2D000, v2, v3, "%s: Failed to find a \".app\" inside the extracted contents at %@ : %@", v4, v5, v6, v7, 2u);
}

void __IXUrlsForItemsInDirectoryAtURL_block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a1 + 32) fileSystemRepresentation];
  int v6 = 136315650;
  uint64_t v7 = "IXUrlsForItemsInDirectoryAtURL_block_invoke";
  __int16 v8 = 2080;
  uint64_t v9 = v5;
  __int16 v10 = 2080;
  uint64_t v11 = a2;
  _os_log_debug_impl(&dword_1A7B2D000, a3, OS_LOG_TYPE_DEBUG, "%s: Ignoring symlink at %s/%s", (uint8_t *)&v6, 0x20u);
}

void _ClientProcessLookupMachPortName_cold_1(uint64_t a1, int __errnum, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v4 = 136315906;
  uint64_t v5 = "_ClientProcessLookupMachPortName";
  __int16 v6 = 2080;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  uint64_t v9 = strerror(__errnum);
  __int16 v10 = 2112;
  uint64_t v11 = 0;
  _os_log_error_impl(&dword_1A7B2D000, a3, OS_LOG_TYPE_ERROR, "%s: sandbox_check returned an error when checking if this process can mach-lookup %s : %s : %@", (uint8_t *)&v4, 0x2Au);
}

void _ClientProcessLookupMachPortName_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = "_ClientProcessLookupMachPortName";
  __int16 v4 = 2080;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = 0;
  _os_log_error_impl(&dword_1A7B2D000, a2, OS_LOG_TYPE_ERROR, "%s: This process does not have sandbox access to mach-lookup %s : %@", (uint8_t *)&v2, 0x20u);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7470](bundle);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7578](bundle);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40D75D0](bundle, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7990](allocator, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFPropertyListIsValid(CFPropertyListRef plist, CFPropertyListFormat format)
{
  return MEMORY[0x1F40D7F68](plist, format);
}

void CFRelease(CFTypeRef cf)
{
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1F40D8A68](userNotification, responseFlags, timeout);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

uint64_t IFCaptureIconContent()
{
  return MEMORY[0x1F4124C98]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1F417CE38]();
}

uint64_t MIStringForInstallationDomain()
{
  return MEMORY[0x1F4124E58]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

OSStatus SecCodeCopySigningInformation(SecStaticCodeRef code, SecCSFlags flags, CFDictionaryRef *information)
{
  return MEMORY[0x1F40F6D48](code, *(void *)&flags, information);
}

OSStatus SecStaticCodeCreateWithPath(CFURLRef path, SecCSFlags flags, SecStaticCodeRef *staticCode)
{
  return MEMORY[0x1F40F7120](path, *(void *)&flags, staticCode);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCopyInfoPlistURL()
{
  return MEMORY[0x1F40D8BE8]();
}

uint64_t _CFBundleCreateFilteredInfoPlist()
{
  return MEMORY[0x1F40D8C20]();
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1F40D8C30]();
}

uint64_t _CFBundleFlushBundleCaches()
{
  return MEMORY[0x1F40D8C48]();
}

uint64_t _CFPropertyListCreateFiltered()
{
  return MEMORY[0x1F40D9030]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1F40C9FA0]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1F40C9FA8]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1F40C9FF8]();
}

int acl_free(void *obj_p)
{
  return MEMORY[0x1F40CA270](obj_p);
}

acl_t acl_get_link_np(const char *path_p, acl_type_t type)
{
  return (acl_t)MEMORY[0x1F40CA2A8](path_p, *(void *)&type);
}

acl_t acl_init(int count)
{
  return (acl_t)MEMORY[0x1F40CA2D0](*(void *)&count);
}

int acl_set_fd(int fd, acl_t acl)
{
  return MEMORY[0x1F40CA2D8](*(void *)&fd, acl);
}

int acl_set_link_np(const char *path_p, acl_type_t type, acl_t acl)
{
  return MEMORY[0x1F40CA2F8](path_p, *(void *)&type, acl);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1F40CB400](a1);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x1F40CB438](*(void *)&a1, a2, a3);
}

uint64_t container_create_or_lookup_for_current_user()
{
  return MEMORY[0x1F40CB578]();
}

uint64_t container_delete_all_container_content()
{
  return MEMORY[0x1F40CB5B0]();
}

uint64_t container_free_object()
{
  return MEMORY[0x1F40CB618]();
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x1F40CB7F8]();
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1F40CB880](from, to, state, *(void *)&flags);
}

int dirfd(DIR *dirp)
{
  return MEMORY[0x1F40CB900](dirp);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

DIR *__cdecl fdopendir(int a1)
{
  return (DIR *)MEMORY[0x1F40CC078](*(void *)&a1);
}

void free(void *a1)
{
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1F40CC2F8](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1F40CC300](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1F40CC308](a1);
}

int getattrlistbulk(int a1, void *a2, void *a3, size_t a4, uint64_t a5)
{
  return MEMORY[0x1F40CC370](*(void *)&a1, a2, a3, a4, a5);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1F40CC4E0](a1, a2, a3, a4, a5);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

int lchmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CC7F0](a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CCDD0](a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1F40CCDE0](a1);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x1F40CCE00](path, omode);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1F40CD120](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8B8](*(void *)&pid, buffer, *(void *)&buffersize);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return MEMORY[0x1F40CDC68](a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1F40CDC70](a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CDC98](a1, a2);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1F40CDD18](path, state, *(void *)&flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return (removefile_state_t)MEMORY[0x1F40CDD20]();
}

int removefile_state_free(removefile_state_t a1)
{
  return MEMORY[0x1F40CDD28](a1);
}

int removefile_state_get(removefile_state_t state, uint32_t key, void *dst)
{
  return MEMORY[0x1F40CDD30](state, *(void *)&key, dst);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return MEMORY[0x1F40CDD38](state, *(void *)&key, value);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

int sem_close(sem_t *a1)
{
  return MEMORY[0x1F40CDEE8](a1);
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  return (sem_t *)MEMORY[0x1F40CDEF0](a1, *(void *)&a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE360](a1, a2);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1F40CE3B8](*(void *)&a1);
}