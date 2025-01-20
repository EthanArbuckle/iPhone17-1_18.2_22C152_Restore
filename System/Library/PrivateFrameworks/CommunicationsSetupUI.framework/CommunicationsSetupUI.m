void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_21ED1C334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21ED1C564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21ED1CD34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21ED1CF08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

id MessagesSettingsLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = CommunicationsSetupUIBundle();
  v3 = [v2 localizedStringForKey:v1 value:v1 table:@"Messages"];

  return v3;
}

uint64_t _CNFRegShouldLog()
{
  return DLCShouldLogLevel();
}

void _CNFRegLog(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (DLCShouldLogLevel()) {
    DLCLogWithLevelV();
  }
}

void CNFRegLogBacktraceToDepth(uint64_t a1, size_t a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (DLCShouldLogLevel())
  {
    id v4 = CNFCopyBacktraceToDepth(a1);
    v13[1] = v13;
    MEMORY[0x270FA5388]();
    v5 = (char *)v13 - ((a2 + 16) & 0xFFFFFFFFFFFFFFF0);
    memset(v5, 32, a2);
    v5[a2] = 0;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v7)
    {
      uint64_t v9 = *(void *)v16;
      *(void *)&long long v8 = 136315394;
      long long v14 = v8;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          v12 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            v20 = v5;
            __int16 v21 = 2112;
            uint64_t v22 = v11;
            _os_log_impl(&dword_21ED18000, v12, OS_LOG_TYPE_DEFAULT, "%s%@", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (IMShouldLog()) {
              IMLogString();
            }
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v7);
    }
  }
}

void CNFRegLogBacktrace()
{
}

void CNFRegLogBacktraceWithMessage(void *a1)
{
  id v1 = a1;
  if (DLCShouldLogLevel())
  {
    DLCLogWithLevelV();
    CNFRegLogBacktraceToDepth(128, 4uLL);
  }
}

void CNFRegLogIndent()
{
}

void CNFRegLogOutdent()
{
  if (sLogIndent) {
    --sLogIndent;
  }
}

id _CNFRegLogCopySpace()
{
  if (sLogIndent)
  {
    id v0 = objc_alloc(MEMORY[0x263F089D8]);
    id v1 = (id)[v0 initWithCapacity:2 * sLogIndent];
    if (sLogIndent)
    {
      unint64_t v2 = 0;
      do
      {
        [v1 appendString:@"  "];
        ++v2;
      }
      while (v2 < sLogIndent);
    }
    [v1 appendString:@"=> "];
  }
  else
  {
    id v1 = objc_alloc_init(NSString);
  }
  return v1;
}

BOOL CNFRegCurrentStringTableMatchesType(uint64_t a1)
{
  if (!a1)
  {
    uint64_t v1 = sStringTableName;
    unint64_t v2 = @"CNFRegistration";
    return v1 == (void)v2;
  }
  if (a1 == 1)
  {
    uint64_t v1 = sStringTableName;
    unint64_t v2 = @"MadridRegistration";
    return v1 == (void)v2;
  }
  return 0;
}

uint64_t CNFRegSetStringTableForServiceType(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v1 = @"CNFRegistration";
  unint64_t v2 = (void *)sStringTableName;
  if (a1 == 1) {
    uint64_t v1 = @"MadridRegistration";
  }
  sStringTableName = (uint64_t)v1;

  id v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v6 = sStringTableName;
    _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Setting string table name to: %@", buf, 0xCu);
  }

  uint64_t result = os_log_shim_legacy_logging_enabled();
  if (result)
  {
    uint64_t result = IMShouldLog();
    if (result) {
      return IMLogString();
    }
  }
  return result;
}

__CFString *CNFRegStringTableNameForServiceType(uint64_t a1)
{
  if (a1 == 1) {
    return @"MadridRegistration";
  }
  else {
    return @"CNFRegistration";
  }
}

id CNFRegStringTableName()
{
  id v0 = (void *)sStringTableName;
  if (!sStringTableName)
  {
    sStringTableName = @"CNFRegistration";

    id v0 = (void *)sStringTableName;
  }
  return v0;
}

id CNFRegLoadSpecifiers(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = objc_alloc(NSDictionary);
  v32 = v11;
  long long v15 = [v10 pathForResource:v11 ofType:@"plist"];
  long long v16 = (void *)[v14 initWithContentsOfFile:v15];

  long long v17 = CNFRegStringTableName();
  id v39 = 0;
  v30 = v13;
  v33 = v10;
  v34 = v9;
  v31 = v12;
  long long v18 = SpecifiersFromPlist();
  id v29 = v39;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v19 = v18;
  uint64_t v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v40, 16, &v39);
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v36;
    uint64_t v23 = *MEMORY[0x263F60118];
    uint64_t v24 = *MEMORY[0x263F600C0];
    v25 = (int *)MEMORY[0x263F5FE10];
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v36 != v22) {
          objc_enumerationMutation(v19);
        }
        v27 = *(char **)(*((void *)&v35 + 1) + 8 * i);
        if (!*(void *)&v27[*v25])
        {
          [*(id *)(*((void *)&v35 + 1) + 8 * i) setProperty:@"CNFRegTableHeaderLabel" forKey:v23];
          [v27 setProperty:@"CNFRegTableFooterLabel" forKey:v24];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v21);
  }

  return v19;
}

id CNFRegLoadSpecifiersFromPlist(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  long long v8 = [v7 specifier];
  id v9 = [v7 bundle];
  id v10 = CNFRegLoadSpecifiers(v8, v9, v6, v5, v7);

  [v7 setSpecifierID:0];
  [v7 setTitle:0];

  return v10;
}

__CFString *CNFRegNonLocStringForRegistrationFailure(unint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a1 >= 0x13)
  {
    id v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v6 = a1;
      _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Unexpected IMAccountRegistrationFailureReason: %ld", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    objc_msgSend(NSString, "stringWithFormat:", @"Unexpected failure reason: %ld", a1);
    unint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v2 = off_2644F05E0[a1];
  }
  return v2;
}

__CFString *CNFRegStringForRegistrationFailure(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = CNFShouldShowTechnicalFailureUI();
  switch(a1)
  {
    case 0:
      goto LABEL_41;
    case 1:
    case 2:
    case 3:
      if ([v3 length])
      {
        unint64_t v6 = NSString;
        uint64_t v7 = CommunicationsSetupUIBundle();
        long long v8 = CNFRegStringTableName();
        id v9 = [v7 localizedStringForKey:@"FACETIME_SIGNIN_ERROR_INVALID_CREDENTIALS_FOR_%@" value:&stru_26D05D4F8 table:v8];
        objc_msgSend(v6, "stringWithFormat:", v9, v3);
        id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v7 = CommunicationsSetupUIBundle();
        long long v8 = CNFRegStringTableName();
        uint64_t v10 = [v7 localizedStringForKey:@"FACETIME_SIGNIN_ERROR_BLANK_USERNAME" value:&stru_26D05D4F8 table:v8];
LABEL_39:
        id v5 = (__CFString *)v10;
      }

      if (!v5)
      {
LABEL_41:
        id v14 = CommunicationsSetupUIBundle();
        long long v15 = CNFRegStringTableName();
        id v5 = [v14 localizedStringForKey:@"FACETIME_SIGNIN_ERROR_GENERIC" value:&stru_26D05D4F8 table:v15];
      }
      break;
    case 4:
      uint64_t v7 = CommunicationsSetupUIBundle();
      long long v8 = CNFRegStringTableName();
      uint64_t v10 = [v7 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_GENERIC" value:&stru_26D05D4F8 table:v8];
      goto LABEL_39;
    case 5:
      if (!v4) {
        goto LABEL_41;
      }
      id v5 = @"INTERNAL: Bad Device ID";
      break;
    case 6:
      if (!v4) {
        goto LABEL_41;
      }
      id v5 = @"INTERNAL: Bad Push Token";
      break;
    case 7:
      if (!v4) {
        goto LABEL_41;
      }
      id v5 = @"INTERNAL: Server denied";
      break;
    case 8:
      if (!v4) {
        goto LABEL_41;
      }
      id v5 = @"INTERNAL: Too many registration attempts";
      break;
    case 9:
      if (!v4) {
        goto LABEL_41;
      }
      id v5 = @"INTERNAL: Account updated needed";
      break;
    case 10:
      char v11 = _os_feature_enabled_impl();
      uint64_t v7 = CommunicationsSetupUIBundle();
      long long v8 = CNFRegStringTableName();
      if (v11) {
        [v7 localizedStringForKey:@"FACETIME_SIGNIN_ERROR_ACCOUNT_NOT_AUTHORIZED_APPLEACCOUNT" value:&stru_26D05D4F8 table:v8];
      }
      else {
        [v7 localizedStringForKey:@"FACETIME_SIGNIN_ERROR_ACCOUNT_NOT_AUTHORIZED" value:&stru_26D05D4F8 table:v8];
      }
      goto LABEL_15;
    case 11:
      char v12 = _os_feature_enabled_impl();
      uint64_t v7 = CommunicationsSetupUIBundle();
      long long v8 = CNFRegStringTableName();
      if (v12) {
        [v7 localizedStringForKey:@"FACETIME_SIGNIN_ERROR_NEW_PASSWORD_NEEDED_APPLEACCOUNT" value:&stru_26D05D4F8 table:v8];
      }
      else {
        [v7 localizedStringForKey:@"FACETIME_SIGNIN_ERROR_NEW_PASSWORD_NEEDED" value:&stru_26D05D4F8 table:v8];
      }
      uint64_t v10 = LABEL_15:;
      goto LABEL_39;
    case 12:
      if (!v4) {
        goto LABEL_41;
      }
      id v5 = @"INTERNAL: Account permanently blocked";
      break;
    case 13:
      if (!v4) {
        goto LABEL_41;
      }
      id v5 = @"INTERNAL: Account temporarily blocked";
      break;
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
      if (!v4) {
        goto LABEL_41;
      }
      id v5 = @"INTERNAL: Server Error";
      break;
    case 20:
      if (!v4) {
        goto LABEL_41;
      }
      id v5 = @"INTERNAL: Server Denied/Disabled";
      break;
    case 21:
      uint64_t v7 = CommunicationsSetupUIBundle();
      long long v8 = CNFRegStringTableName();
      uint64_t v10 = [v7 localizedStringForKey:@"FACETIME_SIGNIN_ERROR_NO_VALID_ALIASES_MESSAGE" value:&stru_26D05D4F8 table:v8];
      goto LABEL_39;
    case 26:
      if (!v4) {
        goto LABEL_41;
      }
      id v5 = @"INTERNAL: Rejected by server (irreparable)";
      break;
    default:
      id v13 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v18 = a1;
        _os_log_impl(&dword_21ED18000, v13, OS_LOG_TYPE_DEFAULT, "Unexpected IMAccountRegistrationFailureReason: %ld", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
      goto LABEL_41;
  }

  return v5;
}

id CNFRegStringForAliasValidationStatus(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v1 = 0;
  switch(a1)
  {
    case -1:
      unint64_t v2 = CommunicationsSetupUIBundle();
      id v3 = CNFRegStringTableName();
      uint64_t v4 = [v2 localizedStringForKey:@"FACETIME_ALIAS_STATUS_FAILURE" value:&stru_26D05D4F8 table:v3];
      goto LABEL_10;
    case 0:
    case 1:
      unint64_t v2 = CommunicationsSetupUIBundle();
      id v3 = CNFRegStringTableName();
      uint64_t v4 = [v2 localizedStringForKey:@"FACETIME_ALIAS_STATUS_DEFAULT" value:&stru_26D05D4F8 table:v3];
      goto LABEL_10;
    case 2:
      unint64_t v2 = CommunicationsSetupUIBundle();
      id v3 = CNFRegStringTableName();
      uint64_t v4 = [v2 localizedStringForKey:@"FACETIME_ALIAS_STATUS_VALIDATING" value:&stru_26D05D4F8 table:v3];
LABEL_10:
      uint64_t v1 = (void *)v4;

      break;
    case 3:
      break;
    default:
      unint64_t v6 = CommunicationsSetupUIBundle();
      uint64_t v7 = CNFRegStringTableName();
      uint64_t v1 = [v6 localizedStringForKey:@"FACETIME_ALIAS_STATUS_DEFAULT" value:&stru_26D05D4F8 table:v7];

      long long v8 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v11 = a1;
        _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "Unexpected IMAccountAliasValidationStatus: %ld", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
      break;
  }
  return v1;
}

__CFString *CNFRegNonLocStringForAliasValidationStatus(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ((unint64_t)(a1 + 1) >= 5)
  {
    id v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v6 = a1;
      _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Unexpected IMAccountAliasValidationStatus: %ld", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    objc_msgSend(NSString, "stringWithFormat:", @"Bad status (%ld)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_2644F06B0[a1 + 1];
  }
  return v1;
}

__CFString *CNFRegStringForAliasValidationFailure(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v2 = CNFShouldShowTechnicalFailureUI();
  switch(a1)
  {
    case 0:
      if (!v2) {
        goto LABEL_18;
      }
      id v3 = @"INTERNAL: Unknown Error";
      goto LABEL_19;
    case 1:
      if (!v2) {
        goto LABEL_18;
      }
      id v3 = @"INTERNAL: Server Error";
      goto LABEL_19;
    case 2:
      if (!v2) {
        goto LABEL_18;
      }
      id v3 = @"INTERNAL: Server Denied";
      goto LABEL_19;
    case 3:
      if (!v2) {
        goto LABEL_18;
      }
      id v3 = @"INTERNAL: Server Alias Not Confirmed";
      goto LABEL_19;
    case 4:
      id v5 = CommunicationsSetupUIBundle();
      uint64_t v6 = CNFRegStringTableName();
      uint64_t v7 = [v5 localizedStringForKey:@"FACETIME_EMAIL_ERROR_IN_USE" value:&stru_26D05D4F8 table:v6];
      goto LABEL_17;
    case 5:
      id v5 = CommunicationsSetupUIBundle();
      uint64_t v6 = CNFRegStringTableName();
      uint64_t v7 = [v5 localizedStringForKey:@"FACETIME_EMAIL_ERROR_NOT_AVAILABLE" value:&stru_26D05D4F8 table:v6];
LABEL_17:
      id v3 = (__CFString *)v7;

      if (!v3) {
        goto LABEL_18;
      }
      goto LABEL_19;
    default:
      uint64_t v4 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v12 = a1;
        _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_DEFAULT, "Unexpected IMAccountAliasValidationErrorReason: %ld", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
LABEL_18:
      long long v8 = CommunicationsSetupUIBundle();
      id v9 = CNFRegStringTableName();
      id v3 = [v8 localizedStringForKey:@"FACETIME_EMAIL_ERROR_GENERIC" value:&stru_26D05D4F8 table:v9];

LABEL_19:
      return v3;
  }
}

__CFString *CNFRegStringForAccount(void *a1)
{
  id v1 = a1;
  BOOL v2 = v1;
  if (v1)
  {
    id v3 = [v1 login];
    uint64_t v4 = [v2 uniqueID];
    id v5 = [v2 service];
    uint64_t v6 = [v5 name];

    if (v3) {
      [NSString stringWithFormat:@"IMAccount<%p>(%@): [%@]{%@}", v2, v6, v3, v4];
    }
    else {
    uint64_t v7 = [NSString stringWithFormat:@"IMAccount<%p>(%@): {%@}", v2, v6, v4, v9];
    }
  }
  else
  {
    uint64_t v7 = @"(No Account)";
  }

  return v7;
}

__CFString *CNFRegNonLocStringForRegistrationStatus(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ((unint64_t)(a1 + 1) >= 7)
  {
    id v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v6 = a1;
      _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Unexpected IMAccountRegistrationStatus: %ld", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    objc_msgSend(NSString, "stringWithFormat:", @"Bad status (%ld)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_2644F0678[a1 + 1];
  }
  return v1;
}

__CFString *CNFRegNonLocStringForProfileValidationStatus(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ((unint64_t)(a1 + 1) < 5) {
    return off_2644F06B0[a1 + 1];
  }
  id v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v5 = a1;
    _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Unexpected IMAccountProfileValidationStatus: %ld", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (IMShouldLog()) {
      IMLogString();
    }
  }
  return @"Unknown";
}

__CFString *CNFRegStringForProfileValidationFailure(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v2 = CNFShouldShowTechnicalFailureUI();
  switch(a1)
  {
    case -1:
      if (!v2) {
        goto LABEL_14;
      }
      id v3 = @"INTERNAL: No Error";
      break;
    case 0:
      if (!v2) {
        goto LABEL_14;
      }
      id v3 = @"INTERNAL: Unknown Error";
      break;
    case 1:
      if (!v2) {
        goto LABEL_14;
      }
      id v3 = @"INTERNAL: Server Error";
      break;
    case 2:
      uint64_t v5 = CommunicationsSetupUIBundle();
      uint64_t v6 = CNFRegStringTableName();
      id v3 = [v5 localizedStringForKey:@"FACETIME_LOCALE_ERROR_INVALID_PROFILE" value:&stru_26D05D4F8 table:v6];

      if (!v3) {
        goto LABEL_14;
      }
      break;
    default:
      uint64_t v4 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v11 = a1;
        _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_DEFAULT, "Unexpected IMAccountProfileValidationErrorReason: %ld", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
LABEL_14:
      uint64_t v7 = CommunicationsSetupUIBundle();
      long long v8 = CNFRegStringTableName();
      id v3 = [v7 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_GENERIC" value:&stru_26D05D4F8 table:v8];

      break;
  }
  return v3;
}

id CNFRegFormattedPhoneNumberForString(void *a1)
{
  id v1 = a1;
  BOOL v2 = v1;
  if ([v1 _appearsToBePhoneNumber])
  {
    active = (void *)CPPhoneNumberCopyActiveCountryCode();
    BOOL v2 = (void *)PNCopyFormattedStringWithCountry();
  }
  return v2;
}

id CNFRegLocalPhoneNumberString()
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v0 = objc_msgSend(MEMORY[0x263F4A520], "sharedInstance", 0);
  id v1 = [v0 activeAccounts];

  uint64_t v2 = [v1 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v2)
  {

    uint64_t v4 = 0;
LABEL_17:
    uint64_t v10 = CTSettingCopyMyPhoneNumber();

    uint64_t v4 = (void *)v10;
    goto LABEL_18;
  }
  uint64_t v3 = v2;
  uint64_t v4 = 0;
  uint64_t v5 = *(void *)v13;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v13 != v5) {
        objc_enumerationMutation(v1);
      }
      uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
      if ([v7 accountType] == 2 && objc_msgSend(v7, "CNFRegSignInComplete"))
      {
        long long v8 = [v7 aliasesForType:2];
        if ([v8 count])
        {
          uint64_t v9 = [v8 objectAtIndex:0];

          uint64_t v4 = (void *)v9;
        }
      }
    }
    uint64_t v3 = [v1 countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v3);

  if (!v4 || ![v4 length]) {
    goto LABEL_17;
  }
LABEL_18:
  return v4;
}

id CNFRegLocalPhoneNumberDisplayString()
{
  id v0 = CNFRegLocalPhoneNumberString();
  id v1 = v0;
  if (!v0 || ![v0 length])
  {
    uint64_t v3 = 0;
LABEL_7:
    uint64_t v5 = CommunicationsSetupUIBundle();
    uint64_t v6 = CNFRegStringTableName();
    uint64_t v4 = [v5 localizedStringForKey:@"YOUR_NUMBER_STRING" value:&stru_26D05D4F8 table:v6];

    goto LABEL_8;
  }
  uint64_t v2 = CNFRegFormattedPhoneNumberForString(v1);
  uint64_t v3 = v2;
  if (!v2) {
    goto LABEL_7;
  }
  uint64_t v4 = v2;
  if (![v2 length]) {
    goto LABEL_7;
  }
LABEL_8:

  return v4;
}

uint64_t CNFRegSupportsLocalPhoneNumberSentinelAlias()
{
  id v0 = [MEMORY[0x263F4A1F0] sharedInstance];
  uint64_t v1 = [v0 supportsIdentification];

  return v1;
}

id CNFRegLocalizedSplashScreenURL()
{
  id v0 = CommunicationsSetupUIBundle();
  uint64_t v1 = CNFRegStringTableName();
  uint64_t v2 = [v0 localizedStringForKey:@"FACETIME_SPLASH_LEARN_MORE_URL" value:&stru_26D05D4F8 table:v1];

  uint64_t v3 = [NSURL URLWithString:v2];

  return v3;
}

id CNFRegiForgotURL()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v0 = [MEMORY[0x263F3BB58] sharedInstance];
  uint64_t v1 = [v0 urlWithKey:@"ds-iforgot-url"];
  if (!v1)
  {
    uint64_t v2 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v6 = @"https://iforgot.apple.com";
      _os_log_impl(&dword_21ED18000, v2, OS_LOG_TYPE_DEFAULT, "Could not obtain iForgot url from bag. Falling back to %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      uint64_t v4 = @"https://iforgot.apple.com";
      IMLogString();
    }
    uint64_t v1 = objc_msgSend(NSURL, "URLWithString:", @"https://iforgot.apple.com", v4);
  }

  return v1;
}

id CNFRegAppleIDLearnMoreURL()
{
  id v0 = CNFRegStringTableName();
  uint64_t v1 = CommunicationsSetupUIBundle();
  uint64_t v2 = CNFLocalizedStringFromTableInBundleWithFallback(@"FACETIME_APPLE_ID_LEARN_MORE_URL", v0, v1);

  uint64_t v3 = [NSURL URLWithString:v2];

  return v3;
}

uint64_t CNFRegGlobalAppearanceStyle()
{
  uint64_t result = _sGlobalAppearanceStyle;
  if (!_sGlobalAppearanceStyle)
  {
    uint64_t result = 1;
    _sGlobalAppearanceStyle = 1;
  }
  return result;
}

uint64_t CNFRegSetGlobalAppearanceStyle(uint64_t result)
{
  _sGlobalAppearanceStyle = result;
  return result;
}

id CNFRegGlobalAppearanceController()
{
  return +[CNFRegAppearanceController globalAppearanceController];
}

BOOL CNFRegShouldRotateToOrientation(uint64_t a1)
{
  return a1 == 1 || _sGlobalRotationSupport != 0;
}

uint64_t CNFRegSupportsAutoRotation()
{
  return _sGlobalRotationSupport;
}

uint64_t CNFRegSetSupportsAutoRotation(uint64_t result)
{
  _sGlobalRotationSupport = result;
  return result;
}

uint64_t FTCServiceTypeForService(void *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [a1 name];
  if ([v1 isEqualToString:*MEMORY[0x263F3BAC8]])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F3BAD0]])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F3BAC0]])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_21ED22C44(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21ED2B708(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    objc_end_catch();
    JUMPOUT(0x21ED2B58CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_21ED34814(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x21ED34724);
  }
  _Unwind_Resume(a1);
}

__CFString *CKStringFromCTLazuliToggleStateType(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 3) {
    return @"???";
  }
  else {
    return off_2644F0960[a1 + 1];
  }
}

id CNFRegGetSSAccountStoreClass()
{
  if (CNFRegControllerLoadStoreServicesLibraryIfNecessary_predicate != -1) {
    dispatch_once(&CNFRegControllerLoadStoreServicesLibraryIfNecessary_predicate, &__block_literal_global_5);
  }
  if (CNFRegControllerLoadStoreServicesLibraryIfNecessary___SSLibraryHandle) {
    id v0 = (void *)__SSAccountStoreClass;
  }
  else {
    id v0 = 0;
  }
  return v0;
}

void __CNFRegControllerLoadStoreServicesLibraryIfNecessary_block_invoke()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v0 = MEMORY[0x223C3A4C0]();
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"System/Library/PrivateFrameworks/StoreServices.framework/StoreServices"];

  id v2 = v1;
  uint64_t v3 = (const char *)[v2 fileSystemRepresentation];
  CNFRegControllerLoadStoreServicesLibraryIfNecessary___SSLibraryHandle = (uint64_t)dlopen(v3, 2);
  if (CNFRegControllerLoadStoreServicesLibraryIfNecessary___SSLibraryHandle)
  {
    __SSAccountStoreClass = (uint64_t)NSClassFromString(&cfstr_Ssaccountstore.isa);
  }
  else
  {
    uint64_t v4 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      long long v8 = dlerror();
      _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_DEFAULT, "Could not load framework {%s} : %s", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      dlerror();
      IMLogString();
    }
  }
}

void sub_21ED40D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _cacheSpecifierMatchingID(void *a1, void *a2, id *a3)
{
  id v6 = a2;
  id v7 = v6;
  uint64_t v8 = 0;
  if (a1 && v6 && a3)
  {
    id v9 = a1;
    uint64_t v10 = [v7 identifier];
    int v11 = [v10 isEqualToString:v9];

    if (v11)
    {
      if (*a3 != v7) {
        objc_storeStrong(a3, a2);
      }
      uint64_t v8 = 1;
    }
    else
    {
      uint64_t v8 = 0;
    }
  }

  return v8;
}

uint64_t _cacheSpecifierGroupMatchingID(void *a1, void *a2, void *a3, void **a4)
{
  id v7 = a3;
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  if (a1 && a2 && v7 && a4)
  {
    id v10 = a1;
    int v11 = [a2 identifier];
    int v12 = [v11 isEqualToString:v10];

    if (v12)
    {
      if (*a4 != v8)
      {
        uint64_t v13 = [v8 copy];
        long long v14 = *a4;
        *a4 = (void *)v13;
      }
      uint64_t v9 = 1;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }

  return v9;
}

void sub_21ED47C04(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x21ED477F0);
  }
  _Unwind_Resume(a1);
}

void sub_21ED48600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21ED48AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4CNFRegLogBacktraceToDepth(128, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4CNFRegLogBacktraceToDepth(128, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_21ED4BE64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
}

uint64_t _parseKeyValuePair(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = v5;
  if (v5 && [v5 length])
  {
    id v7 = [v6 componentsSeparatedByString:@"="];
    if ([v7 count] == 2)
    {
      uint64_t v8 = [v7 objectAtIndex:0];
      id v9 = [v7 objectAtIndex:1];
      if ([v8 length] && objc_msgSend(v9, "length"))
      {
        id v10 = [v8 stringByRemovingPercentEncoding];

        int v11 = [v9 stringByRemovingPercentEncoding];

        if (a2 && v10) {
          *a2 = v10;
        }
        uint64_t v12 = 1;
        if (a3 && v11)
        {
          id v9 = v11;
          *a3 = v9;
          uint64_t v8 = v10;
        }
        else
        {
          uint64_t v8 = v10;
          id v9 = v11;
        }
      }
      else
      {
        uint64_t v12 = 0;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

__CFString *_queryStringFromCNFQueryDictionary(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1 && [v1 count])
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v2, "count"));
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = ___queryStringFromCNFQueryDictionary_block_invoke;
    v7[3] = &unk_2644F0CD8;
    id v8 = v3;
    id v4 = v3;
    [v2 enumerateKeysAndObjectsUsingBlock:v7];
    id v5 = [v4 componentsJoinedByString:@"&"];
  }
  else
  {
    id v5 = &stru_26D05D4F8;
  }

  return v5;
}

void ___queryStringFromCNFQueryDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x263F08708];
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 URLQueryAllowedCharacterSet];
  id v12 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:v8];

  id v9 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
  id v10 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v9];

  int v11 = (void *)[[NSString alloc] initWithFormat:@"%@=%@", v12, v10];
  [*(id *)(a1 + 32) addObject:v11];
}

void _handleSIMSubscriptionsUpdateNotification(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  im_dispatch_after();
}

uint64_t ___handleSIMSubscriptionsUpdateNotification_block_invoke(uint64_t a1)
{
  id v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21ED18000, v2, OS_LOG_TYPE_DEFAULT, "Subscriptions changed. Resetting extension matching", v4, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  [*(id *)(a1 + 32) endMatchingExtensions];
  return [*(id *)(a1 + 32) findSpamExtensions];
}

void sub_21ED60A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKSettingsHostingViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!MessagesSettingsUILibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __MessagesSettingsUILibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2644F0DA8;
    uint64_t v5 = 0;
    MessagesSettingsUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MessagesSettingsUILibraryCore_frameworkLibrary) {
    __getCKSettingsHostingViewControllerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("CKSettingsHostingViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCKSettingsHostingViewControllerClass_block_invoke_cold_2();
  }
  getCKSettingsHostingViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MessagesSettingsUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MessagesSettingsUILibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t csui_log()
{
  if (csui_log_onceToken != -1) {
    dispatch_once(&csui_log_onceToken, &__block_literal_global_12);
  }
  return csui_log_sLog;
}

os_log_t __csui_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.CommunicationsSetupUI", "default");
  csui_log_sLog = (uint64_t)result;
  return result;
}

void sub_21ED68A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4CNFRegLogBacktraceToDepth(128, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4CNFRegLogBacktraceToDepth(128, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_21ED69D40(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x21ED69D0CLL);
  }
  _Unwind_Resume(a1);
}

void sub_21ED6A178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id MadridLocalizedString(void *a1)
{
  id v1 = a1;
  id v2 = CommunicationsSetupUIBundle();
  id v3 = [v2 localizedStringForKey:v1 value:v1 table:@"MadridRegistration"];

  return v3;
}

void sub_21ED6A5D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21ED6B0E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21ED6B234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21ED6F510(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21ED6F7D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21ED72BE8(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x21ED7293CLL);
  }
  _Unwind_Resume(a1);
}

void sub_21ED78744(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21ED7D3B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4CNFRegLogBacktraceToDepth(128, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4CNFRegLogBacktraceToDepth(128, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_21ED7D540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21ED7E4C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21ED80F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4CNFRegLogBacktraceToDepth(128, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4CNFRegLogBacktraceToDepth(128, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

uint64_t _SMSRelayActiveDevicesChanged(uint64_t a1, void *a2)
{
  return [a2 reload];
}

void sub_21ED84060(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x21ED84000);
  }
  _Unwind_Resume(a1);
}

void _TechnicalFailureUIPrefChangedCallback()
{
  gShouldShowTechnicalFailureUI = -1;
}

BOOL CNFShouldShowTechnicalFailureUI()
{
  int v0 = gShouldShowTechnicalFailureUI;
  if (gShouldShowTechnicalFailureUI == -1)
  {
    if ((CNFShouldShowTechnicalFailureUI_sIsObserving & 1) == 0)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_TechnicalFailureUIPrefChangedCallback, @"kCNFTechnicalFailureUIPrefChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      CNFShouldShowTechnicalFailureUI_sIsObserving = 1;
    }
    CNFSyncPreferences();
    int v0 = CNFGetAppBooleanValueForKey(@"showDebugErrorDialogs");
    gShouldShowTechnicalFailureUI = v0;
  }
  return v0 != 0;
}

CFIndex CNFiMessageLogLevel()
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v0 = _CNFiMessageDebugLoggingDefaults();
  if ([v0 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v1 = v0;
    uint64_t v2 = [v1 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v19;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v19 != v4) {
            objc_enumerationMutation(v1);
          }
          CFStringRef v6 = *(const __CFString **)(*((void *)&v18 + 1) + 8 * v5);
          long long v14 = 0u;
          long long v15 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          id v7 = objc_msgSend(v1, "objectForKey:", v6, 0);
          uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v15;
            while (2)
            {
              uint64_t v11 = 0;
              do
              {
                if (*(void *)v15 != v10) {
                  objc_enumerationMutation(v7);
                }
                if (!CFPreferencesGetAppBooleanValue(*(CFStringRef *)(*((void *)&v14 + 1) + 8 * v11), v6, 0))
                {

                  goto LABEL_19;
                }
                ++v11;
              }
              while (v9 != v11);
              uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
              if (v9) {
                continue;
              }
              break;
            }
          }

          ++v5;
        }
        while (v5 != v3);
        uint64_t v3 = [v1 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v3);
    }

    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"MadridLoggingLevel", @"com.apple.logging", 0);
  }
  else
  {
LABEL_19:
    CFIndex AppIntegerValue = -1;
  }

  return AppIntegerValue;
}

id _CNFiMessageDebugLoggingDefaults()
{
  int v0 = (void *)_CNFiMessageDebugLoggingDefaults_defaults;
  if (!_CNFiMessageDebugLoggingDefaults_defaults)
  {
    id v1 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v2 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"MadridLogging", 0);
    [v1 setObject:v2 forKey:@"com.apple.logging"];

    uint64_t v3 = [v1 copy];
    uint64_t v4 = (void *)_CNFiMessageDebugLoggingDefaults_defaults;
    _CNFiMessageDebugLoggingDefaults_defaults = v3;

    int v0 = (void *)_CNFiMessageDebugLoggingDefaults_defaults;
  }
  return v0;
}

void CNFSetiMessageLogLevel(uint64_t a1)
{
  uint64_t v2 = _CNFiMessageDebugLoggingDefaults();
  _CNFSetDefaultsDictionary(a1 >= 0, v2);

  if (CNFSetiMessageLogLevel__pred_MMCSSetLogLevelMMCS == -1)
  {
    if ((a1 & 0x8000000000000000) == 0)
    {
LABEL_3:
      uint64_t v3 = (void *)[objc_alloc(NSNumber) initWithInteger:a1];
      CFPreferencesSetAppValue(@"MadridLoggingLevel", v3, @"com.apple.logging");
      uint64_t v4 = [NSNumber numberWithInt:3];
      CFPreferencesSetAppValue(@"DebugLevel", v4, @"com.apple.mmcs");

      CFPreferencesSetAppValue(@"fig_notes", @"public", @"com.apple.coremedia");
      if (CNFSetiMessageLogLevel__MMCSSetLogLevel) {
        CNFSetiMessageLogLevel__MMCSSetLogLevel(7, 4);
      }

      goto LABEL_9;
    }
  }
  else
  {
    dispatch_once(&CNFSetiMessageLogLevel__pred_MMCSSetLogLevelMMCS, &__block_literal_global_16);
    if ((a1 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
  }
  CFPreferencesSetAppValue(@"MadridLoggingLevel", 0, @"com.apple.logging");
  CFPreferencesSetAppValue(@"DebugLevel", 0, @"com.apple.mmcs");
  CFPreferencesSetAppValue(@"fig_notes", 0, @"com.apple.coremedia");
  if (CNFSetiMessageLogLevel__MMCSSetLogLevel) {
    CNFSetiMessageLogLevel__MMCSSetLogLevel(3, 3);
  }
LABEL_9:
  CFPreferencesAppSynchronize(@"com.apple.coremedia");
  CFPreferencesAppSynchronize(@"com.apple.mmcs");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kMarcoSyncLoggingPrefs", 0, 0, 1u);
  CFStringRef v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v6, @"PCLoggingSettingsDidChangeNotification", 0, 0, 1u);
}

void _CNFSetDefaultsDictionary(int a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [v3 allKeys];
  uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    if (a1) {
      id v7 = (const void *)*MEMORY[0x263EFFB40];
    }
    else {
      id v7 = 0;
    }
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v9 = *(const __CFString **)(*((void *)&v20 + 1) + 8 * v8);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v10 = [v3 objectForKey:v9];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v17;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v17 != v13) {
                objc_enumerationMutation(v10);
              }
              CFPreferencesSetAppValue(*(CFStringRef *)(*((void *)&v16 + 1) + 8 * v14++), v7, v9);
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v12);
        }

        CFPreferencesAppSynchronize(v9);
        ++v8;
      }
      while (v8 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }
}

void CNFDumpiMessageLogs(void *a1)
{
  id v1 = a1;
  if (v1) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = @"CNFDumpiMessageLogs";
  }
  id v3 = v2;
  MarcoAction();
}

uint64_t CNFRegistrationLogLevel()
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v0 = _CNFRegistrationLoggingDefaults();
  if ([v0 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v1 = v0;
    uint64_t v2 = [v1 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v19 != v4) {
            objc_enumerationMutation(v1);
          }
          CFStringRef v6 = *(const __CFString **)(*((void *)&v18 + 1) + 8 * i);
          long long v14 = 0u;
          long long v15 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          id v7 = objc_msgSend(v1, "objectForKey:", v6, 0);
          uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v15;
            while (2)
            {
              for (uint64_t j = 0; j != v9; ++j)
              {
                if (*(void *)v15 != v10) {
                  objc_enumerationMutation(v7);
                }
                if (!CFPreferencesGetAppBooleanValue(*(CFStringRef *)(*((void *)&v14 + 1) + 8 * j), v6, 0))
                {

                  uint64_t v12 = -1;
                  goto LABEL_21;
                }
              }
              uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
              if (v9) {
                continue;
              }
              break;
            }
          }
        }
        uint64_t v3 = [v1 countByEnumeratingWithState:&v18 objects:v23 count:16];
        uint64_t v12 = 0;
      }
      while (v3);
    }
    else
    {
      uint64_t v12 = 0;
    }
LABEL_21:
  }
  else
  {
    uint64_t v12 = -1;
  }

  return v12;
}

id _CNFRegistrationLoggingDefaults()
{
  int v0 = (void *)_CNFRegistrationLoggingDefaults_defaults;
  if (!_CNFRegistrationLoggingDefaults_defaults)
  {
    id v1 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v2 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"RegistrationLogging", 0);
    [v1 setObject:v2 forKey:@"com.apple.logging"];

    uint64_t v3 = [v1 copy];
    uint64_t v4 = (void *)_CNFRegistrationLoggingDefaults_defaults;
    _CNFRegistrationLoggingDefaults_defaults = v3;

    int v0 = (void *)_CNFRegistrationLoggingDefaults_defaults;
  }
  return v0;
}

uint64_t CNFSetRegistrationLogLevel(uint64_t a1)
{
  uint64_t v2 = _CNFRegistrationLoggingDefaults();
  _CNFSetDefaultsDictionary(a1 >= 0, v2);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kMarcoSyncLoggingPrefs", 0, 0, 1u);
  uint64_t v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v4, @"PCLoggingSettingsDidChangeNotification", 0, 0, 1u);
  return MEMORY[0x270F3CE10]("killall -USR2 imagent");
}

void CNFDumpRegistrationLogs(void *a1)
{
  id v1 = a1;
  if (v1) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = @"CNFDumpRegistrationLogs";
  }
  uint64_t v3 = v2;
  MarcoAction();
}

uint64_t CNFIsPushLoggingEnabled()
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v0 = _CNFPushLoggingDefaults();
  if ([v0 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v1 = v0;
    uint64_t v2 = [v1 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v19 != v4) {
            objc_enumerationMutation(v1);
          }
          CFStringRef v6 = *(const __CFString **)(*((void *)&v18 + 1) + 8 * i);
          long long v14 = 0u;
          long long v15 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          id v7 = objc_msgSend(v1, "objectForKey:", v6, 0);
          uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v15;
            while (2)
            {
              for (uint64_t j = 0; j != v9; ++j)
              {
                if (*(void *)v15 != v10) {
                  objc_enumerationMutation(v7);
                }
                if (!CFPreferencesGetAppBooleanValue(*(CFStringRef *)(*((void *)&v14 + 1) + 8 * j), v6, 0))
                {

                  uint64_t v12 = 0;
                  goto LABEL_21;
                }
              }
              uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
              if (v9) {
                continue;
              }
              break;
            }
          }
        }
        uint64_t v3 = [v1 countByEnumeratingWithState:&v18 objects:v23 count:16];
        uint64_t v12 = 1;
      }
      while (v3);
    }
    else
    {
      uint64_t v12 = 1;
    }
LABEL_21:
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

id _CNFPushLoggingDefaults()
{
  int v0 = (void *)_CNFPushLoggingDefaults_defaults;
  if (!_CNFPushLoggingDefaults_defaults)
  {
    id v1 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v2 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"Log", @"PCWriteLogs", @"APSFullNetworkLogging", 0);
    [v1 setObject:v2 forKey:@"com.apple.persistentconnection"];

    uint64_t v3 = [NSDictionary dictionaryWithDictionary:v1];
    uint64_t v4 = (void *)_CNFPushLoggingDefaults_defaults;
    _CNFPushLoggingDefaults_defaults = v3;

    int v0 = (void *)_CNFPushLoggingDefaults_defaults;
  }
  return v0;
}

void CNFSetPushLoggingEnabled(int a1)
{
  uint64_t v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  id v18 = [v2 lastObject];

  uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v4 = v3;
  if (!a1)
  {
    uint64_t v11 = [v18 stringByAppendingPathComponent:@"Preferences/com.apple.aps.tcpdump.en0.plist"];
    [v4 removeItemAtPath:v11 error:0];

    uint64_t v12 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v13 = [v18 stringByAppendingPathComponent:@"Preferences/com.apple.aps.tcpdump.pdp_ip0.plist"];
    [v12 removeItemAtPath:v13 error:0];

    long long v14 = [MEMORY[0x263F08850] defaultManager];
    long long v15 = [v18 stringByAppendingPathComponent:@"Caches/com.apple.aps.tcpdump.en0.plist"];
    [v14 removeItemAtPath:v15 error:0];

    uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v10 = [v18 stringByAppendingPathComponent:@"Caches/com.apple.aps.tcpdump.pdp_ip0.plist"];
    [v9 removeItemAtPath:v10 error:0];
    goto LABEL_6;
  }
  int v5 = [v3 fileExistsAtPath:@"/usr/sbin/tcpdump"];

  if (v5)
  {
    CFStringRef v6 = [MEMORY[0x263EFF8F8] data];
    id v7 = [v18 stringByAppendingPathComponent:@"Caches/com.apple.aps.tcpdump.en0.plist"];
    [v6 writeToFile:v7 options:0 error:0];

    uint64_t v8 = [MEMORY[0x263F3BB18] sharedInstance];
    LODWORD(v7) = [v8 supportsCellularData];

    if (v7)
    {
      uint64_t v9 = [MEMORY[0x263EFF8F8] data];
      uint64_t v10 = [v18 stringByAppendingPathComponent:@"Caches/com.apple.aps.tcpdump.pdp_ip0.plist"];
      [v9 writeToFile:v10 options:0 error:0];
LABEL_6:
    }
  }
  long long v16 = _CNFPushLoggingDefaults();
  _CNFSetDefaultsDictionary(a1, v16);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"PCLoggingSettingsDidChangeNotification", 0, 0, 1u);
}

void CNFSetBasebandLoggingEnabled(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = [NSNumber numberWithBool:1];
    CNFSetBasebandValue(v2);

    CNFSetBasebandValue(@"512");
    uint64_t v3 = [NSNumber numberWithBool:1];
    CNFSetBasebandValue(v3);

    CNFSetBasebandValue(@"1");
    CNFSetBasebandValue(@"2");
    CNFSetBasebandValue(@"512");
    uint64_t v4 = @"default";
  }
  else
  {
    int v5 = [NSNumber numberWithBool:0];
    CNFSetBasebandValue(v5);

    CNFSetBasebandValue(@"64");
    CFStringRef v6 = [NSNumber numberWithBool:0];
    CNFSetBasebandValue(v6);

    CNFSetBasebandValue(@"0");
    uint64_t v4 = @"0";
  }
  CNFSetBasebandValue(v4);
  id v7 = [NSNumber numberWithBool:a1];
  CNFSetBasebandValue(v7);
}

void CNFSetBasebandValue(void *a1)
{
  id v1 = a1;
  uint64_t v2 = _CTServerConnectionCreate();
  if (v2)
  {
    uint64_t v3 = (const void *)v2;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    int v5 = v1;
    if ((isKindOfClass & 1) == 0)
    {
      int v6 = [(__CFString *)v1 BOOLValue];
      int v5 = @"false";
      if (v6) {
        int v5 = @"true";
      }
    }
    id v7 = v5;
    _CTServerConnectionSetTraceProperty();
    CFRelease(v3);
  }
}

void CNFSetIDSLoggingEnabled(int a1)
{
  if (a1)
  {
    CFPreferencesSetAppValue(@"IDSLogging", (CFPropertyListRef)[NSNumber numberWithBool:1], @"com.apple.logging");
    id v1 = (const void *)[NSNumber numberWithBool:1];
  }
  else
  {
    CFPreferencesSetAppValue(@"IDSLogging", 0, @"com.apple.logging");
    id v1 = 0;
  }
  CFPreferencesSetAppValue(@"IDSIDQuery", v1, @"com.apple.logging");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kMarcoSyncLoggingPrefs", 0, 0, 1u);
}

void _reloadSpecifiersFromNotification(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 reloadSpecifiers];
  }
}

void sub_21ED8AF6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void _removeSpecifiersWithIdentifiers(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [v3 specifierForID:*(void *)(*((void *)&v10 + 1) + 8 * v8)];
        [v3 removeObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

void sub_21ED93CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21ED941B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__778(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4CNFRegLogBacktraceToDepth(128, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4CNFRegLogBacktraceToDepth(128, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__779(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4CNFRegLogBacktraceToDepth(128, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4CNFRegLogBacktraceToDepth(128, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

uint64_t CNFGetSharedBooleanValueForKey(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (__CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  if (v3)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    if (CFPreferencesGetAppBooleanValue(v2, v3, &keyExistsAndHasValidFormat)) {
      BOOL v4 = keyExistsAndHasValidFormat == 0;
    }
    else {
      BOOL v4 = 1;
    }
    uint64_t v5 = !v4;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

BOOL CNFGetDomainBooleanValueForKey(CFStringRef applicationID, CFStringRef key)
{
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(key, applicationID, &keyExistsAndHasValidFormat)) {
    BOOL v2 = keyExistsAndHasValidFormat == 0;
  }
  else {
    BOOL v2 = 1;
  }
  return !v2;
}

uint64_t CNFGetDomainBooleanValueForKeyDefaultValue(CFStringRef applicationID, CFStringRef key, unsigned int a3)
{
  Boolean keyExistsAndHasValidFormat = 0;
  BOOL v4 = CFPreferencesGetAppBooleanValue(key, applicationID, &keyExistsAndHasValidFormat) != 0;
  if (keyExistsAndHasValidFormat) {
    return v4;
  }
  else {
    return a3;
  }
}

uint64_t CNFGetAppBooleanValueForKey(void *a1)
{
  return CNFGetSharedBooleanValueForKey(@"com.apple.conference", a1);
}

uint64_t CNFSetDomainBooleanForKey(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = NSNumber;
  uint64_t v6 = a2;
  id v7 = a1;
  uint64_t v8 = [v5 numberWithBool:a3];
  _CNFSetDomainValueForKey(v7, v6, v8);

  return 1;
}

void _CNFSetDomainValueForKey(void *a1, const __CFString *a2, const void *a3)
{
  applicationID = a1;
  CFPreferencesSetAppValue(a2, a3, applicationID);
  CFPreferencesAppSynchronize(applicationID);
}

BOOL CNFSetSharedBooleanValueForKey(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  uint64_t v5 = (void *)CPCopySharedResourcesPreferencesDomainForDomain();
  uint64_t v6 = v5;
  if (v5) {
    CNFSetDomainBooleanForKey(v5, v4, a3);
  }

  return v6 != 0;
}

BOOL CNFSetAppBooleanValueForKey(void *a1, uint64_t a2)
{
  return CNFSetSharedBooleanValueForKey(@"com.apple.conference", a1, a2);
}

CFPropertyListRef _CNFCopyDomainValueForKey(CFStringRef applicationID, CFStringRef key)
{
  return CFPreferencesCopyAppValue(key, applicationID);
}

double CNFGetDomainCGSizeForKey(CFStringRef applicationID, CFStringRef key, double a3)
{
  id v4 = (NSString *)CFPreferencesCopyAppValue(key, applicationID);
  if (v4)
  {
    uint64_t v5 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      *(void *)&a3 = *(_OWORD *)&CGSizeFromString(v5);
    }
    CFRelease(v5);
  }
  return a3;
}

double CNFGetSharedCGSizeForKey(double a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  CFStringRef v5 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  if (v5)
  {
    CFStringRef v6 = v5;
    a1 = CNFGetDomainCGSizeForKey(v5, v4, a1);
    CFRelease(v6);
  }

  return a1;
}

double CNFGetAppCGSizeForKey(void *a1, double a2)
{
  return CNFGetSharedCGSizeForKey(a2, @"com.apple.conference", a1);
}

id CNFCopyDomainStringForKey(const __CFString *a1, const __CFString *a2, void *a3)
{
  id v5 = a3;
  CFPropertyListRef v6 = CFPreferencesCopyAppValue(a2, a1);
  id v7 = v5;
  if (v6)
  {
    uint64_t v8 = (void *)v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v8;
    }
    else
    {
      CFRelease(v8);
      id v7 = v5;
    }
  }

  return v7;
}

id CNFCopySharedStringForKey(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  CFPropertyListRef v6 = (__CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  id v7 = v5;
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v8 = CNFCopyDomainStringForKey(v6, v4, v7);
  }
  return v8;
}

id CNFCopyAppStringForKey(void *a1, void *a2)
{
  return CNFCopySharedStringForKey(@"com.apple.conference", a1, a2);
}

uint64_t CNFGetDomainIntegerForKey(CFStringRef applicationID, CFStringRef key, uint64_t a3)
{
  CFPropertyListRef v4 = CFPreferencesCopyAppValue(key, applicationID);
  if (v4)
  {
    id v5 = (void *)v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      a3 = [v5 integerValue];
    }
    CFRelease(v5);
  }
  return a3;
}

uint64_t CNFGetSharedIntegerForKey(uint64_t a1, void *a2, uint64_t a3)
{
  CFPropertyListRef v4 = a2;
  CFStringRef v5 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  if (v5)
  {
    CFStringRef v6 = v5;
    a3 = CNFGetDomainIntegerForKey(v5, v4, a3);
    CFRelease(v6);
  }

  return a3;
}

uint64_t CNFGetAppIntegerForKey(void *a1, uint64_t a2)
{
  return CNFGetSharedIntegerForKey(@"com.apple.conference", a1, a2);
}

uint64_t CNFSetDomainIntegerForKey(void *a1, void *a2, uint64_t a3)
{
  CFStringRef v5 = NSNumber;
  CFStringRef v6 = a2;
  id v7 = a1;
  uint64_t v8 = [v5 numberWithInteger:a3];
  _CNFSetDomainValueForKey(v7, v6, v8);

  return 1;
}

BOOL CNFSetSharedIntegerForKey(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  CFStringRef v5 = (void *)CPCopySharedResourcesPreferencesDomainForDomain();
  CFStringRef v6 = v5;
  if (v5)
  {
    CNFSetDomainIntegerForKey(v5, v4, a3);
    CFRelease(v6);
  }

  return v6 != 0;
}

BOOL CNFSetAppIntegerForKey(void *a1, uint64_t a2)
{
  return CNFSetSharedIntegerForKey(@"com.apple.conference", a1, a2);
}

double CNFGetDomainFloatForKey(CFStringRef applicationID, CFStringRef key, double a3)
{
  CFPropertyListRef v4 = CFPreferencesCopyAppValue(key, applicationID);
  if (v4)
  {
    CFStringRef v5 = (void *)v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      [v5 floatValue];
      a3 = v6;
    }
    CFRelease(v5);
  }
  return a3;
}

double CNFGetSharedFloatForKey(double a1, uint64_t a2, void *a3)
{
  CFPropertyListRef v4 = a3;
  CFStringRef v5 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  if (v5)
  {
    CFStringRef v6 = v5;
    a1 = CNFGetDomainFloatForKey(v5, v4, a1);
    CFRelease(v6);
  }

  return a1;
}

double CNFGetAppFloatForKey(void *a1, double a2)
{
  return CNFGetSharedFloatForKey(a2, @"com.apple.conference", a1);
}

void CNFAssert(char a1, uint64_t a2, void *a3)
{
  if ((a1 & 1) == 0) {
    _CNFLogv(a2, a3);
  }
}

void _CNFLogv(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (DLCSessionShouldLogLevel()) {
    DLCSessionLogWithLevelV();
  }
}

id CNFCopyBacktraceToDepth(uint64_t a1)
{
  v16[1] = *MEMORY[0x263EF8340];
  if ((unint64_t)(a1 + 1) < 0x80) {
    uint64_t v1 = a1 + 1;
  }
  else {
    uint64_t v1 = 128;
  }
  id v2 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v1];
  MEMORY[0x270FA5388]();
  CFStringRef v5 = (void **)((char *)v16 - v4);
  if (v3 >= 0x200) {
    size_t v6 = 512;
  }
  else {
    size_t v6 = v3;
  }
  bzero((char *)v16 - v4, v6);
  int v7 = backtrace(v5, v1);
  uint64_t v8 = backtrace_symbols(v5, v7);
  uint64_t v9 = v8;
  if (v7 >= 2)
  {
    long long v10 = (uint64_t *)(v8 + 1);
    uint64_t v11 = v7 - 1;
    do
    {
      id v12 = [NSString alloc];
      uint64_t v13 = *v10++;
      long long v14 = (void *)[v12 initWithUTF8String:v13];
      [v2 addObject:v14];

      --v11;
    }
    while (v11);
  }
  free(v9);
  return v2;
}

void CNFLogBacktraceToDepth(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (DLCSessionShouldLogLevel())
  {
    uint64_t v4 = CNFCopyBacktraceToDepth(a2);
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          _CNFLog(a1, *(void **)(*((void *)&v9 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

void _CNFLog(uint64_t a1, void *a2)
{
}

id CommunicationsSetupUIBundle()
{
  int v0 = (void *)CommunicationsSetupUIBundle___communicationsSetupUIBundle;
  if (!CommunicationsSetupUIBundle___communicationsSetupUIBundle)
  {
    uint64_t v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v2 = (void *)CommunicationsSetupUIBundle___communicationsSetupUIBundle;
    CommunicationsSetupUIBundle___communicationsSetupUIBundle = v1;

    int v0 = (void *)CommunicationsSetupUIBundle___communicationsSetupUIBundle;
  }
  return v0;
}

BOOL CNFSyncDomainPreferences(const __CFString *a1)
{
  return CFPreferencesAppSynchronize(a1) != 0;
}

BOOL CNFSyncSharedPreferences()
{
  CFStringRef v0 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  uint64_t v1 = (__CFString *)v0;
  if (v0) {
    BOOL v2 = CFPreferencesAppSynchronize(v0) != 0;
  }
  else {
    BOOL v2 = 0;
  }

  return v2;
}

BOOL CNFSyncPreferences()
{
  return CNFSyncSharedPreferences();
}

uint64_t CNFSyncLoggingPrefs()
{
  CNFSyncSharedPreferences();
  CNFGetSharedBooleanValueForKey(@"com.apple.conference", @"Log");
  return CNFGetSharedBooleanValueForKey(@"com.apple.conference", @"Log.Everything");
}

id CNFStringKeyForProduct(void *a1)
{
  id v1 = a1;
  if (CNFProductName_onceToken != -1) {
    dispatch_once(&CNFProductName_onceToken, &__block_literal_global_18);
  }
  BOOL v2 = v1;
  if (CNFProductName_sProductName)
  {
    BOOL v2 = [NSString stringWithFormat:@"%@%@", v1, CNFProductName_sProductName];
  }
  return v2;
}

id CNFStringKeyForIdiom(void *a1)
{
  id v1 = a1;
  if (CNFIdiomName_onceToken != -1) {
    dispatch_once(&CNFIdiomName_onceToken, &__block_literal_global_126);
  }
  BOOL v2 = v1;
  if (CNFIdiomName_sIdiomName)
  {
    BOOL v2 = [NSString stringWithFormat:@"%@%@", v1, CNFIdiomName_sIdiomName];
  }
  return v2;
}

id CNFStringKeyForNetwork(void *a1)
{
  id v1 = (void *)MEMORY[0x263F3BB18];
  id v2 = a1;
  unint64_t v3 = [v1 sharedInstance];
  int v4 = [v3 supportsWLAN];

  if (v4) {
    uint64_t v5 = @"%@_WLAN";
  }
  else {
    uint64_t v5 = @"%@_WIFI";
  }
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", v5, v2);

  return v6;
}

id CNFStringKeyForNetworkAndProduct(void *a1)
{
  id v1 = CNFStringKeyForNetwork(a1);
  id v2 = CNFStringKeyForProduct(v1);

  return v2;
}

id CNFLocalizedStringFromTableInBundleWithFallback(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = CNFStringKeyForProduct(v5);
  long long v9 = CommunicationsSetupUIBundle();
  long long v10 = CNFRegStringTableName();
  long long v11 = [v9 localizedStringForKey:v8 value:&stru_26D05D4F8 table:v10];

  if (v11 && ([v11 isEqualToString:v8] & 1) == 0)
  {
    id v16 = v11;
    id v18 = v16;
  }
  else
  {
    long long v12 = csui_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      CNFLocalizedStringFromTableInBundleWithFallback_cold_1((uint64_t)v5, (uint64_t)v8, v12);
    }

    uint64_t v13 = CNFStringKeyForIdiom(v5);
    uint64_t v14 = [v7 localizedStringForKey:v13 value:&stru_26D05D4F8 table:v6];

    if (v14 && ([v14 isEqualToString:v13] & 1) == 0)
    {
      NSLog(&cfstr_WeDidAFallback.isa, v13, v8);
      id v16 = v14;
      id v18 = v16;
    }
    else
    {
      uint64_t v15 = [NSString stringWithFormat:@"%@%@", v5, @"_iphone"];
      id v16 = [v7 localizedStringForKey:v15 value:&stru_26D05D4F8 table:v6];

      if (v16 && ([v16 isEqualToString:v15] & 1) == 0)
      {
        NSLog(&cfstr_WeDidAFallback.isa, v15, v8);
        id v18 = v16;
      }
      else
      {
        NSLog(&cfstr_ErrorWeAreMiss.isa, v5);
        long long v17 = CNFStringKeyForProduct(v5);
        id v18 = [v7 localizedStringForKey:v17 value:&stru_26D05D4F8 table:v6];
      }
    }
  }
  return v18;
}

void __CNFProductName_block_invoke()
{
  _CFGetProductName();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if ([v7 length])
  {
    uint64_t v0 = [[NSString alloc] initWithFormat:@"_%@", v7];
    id v1 = (void *)CNFProductName_sProductName;
    CNFProductName_sProductName = v0;
  }
  else
  {
    id v2 = [MEMORY[0x263F82670] currentDevice];
    id v1 = [v2 model];

    if (v1)
    {
      [v1 rangeOfString:@"iPad" options:9];
      if (v3)
      {
        int v4 = @"_ipad";
      }
      else
      {
        [v1 rangeOfString:@"iPod" options:9];
        int v4 = @"_ipod";
        if (!v5) {
          int v4 = @"_iphone";
        }
      }
      id v6 = (void *)CNFProductName_sProductName;
      CNFProductName_sProductName = (uint64_t)v4;
    }
  }
}

void __CNFIdiomName_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  BOOL v2 = v1 == 1 || v1 == 6;
  uint64_t v3 = @"_iphone";
  if (v2) {
    uint64_t v3 = @"_ipad";
  }
  int v4 = (void *)CNFIdiomName_sIdiomName;
  CNFIdiomName_sIdiomName = (uint64_t)v3;
}

BOOL sub_21ED99E00(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_21ED99E10()
{
  return sub_21ED9D3A8();
}

uint64_t sub_21ED99E38()
{
  return sub_21ED9D3B8();
}

BOOL sub_21ED99E80(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21ED99E94()
{
  return sub_21ED9D3B8();
}

uint64_t sub_21ED99EDC()
{
  return sub_21ED9D3A8();
}

uint64_t sub_21ED99F08()
{
  return sub_21ED9D3B8();
}

uint64_t sub_21ED99F4C()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC21CommunicationsSetupUI28CKSettingsCheckInDevicesList_view + 8);
}

id CKSettingsCheckInDevicesList.__allocating_init(fullDataSharing:)(char a1)
{
  id v3 = objc_allocWithZone(v1);
  if (a1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  uint64_t v5 = self;
  id v6 = (char *)v3;
  id v7 = objc_msgSend(v5, sel_mainScreen);
  objc_msgSend(v7, sel_bounds);
  uint64_t v9 = v8;

  long long v10 = &v6[OBJC_IVAR____TtC21CommunicationsSetupUI28CKSettingsCheckInDevicesList_view];
  *(void *)long long v10 = v9;
  v10[8] = v4;

  v12.receiver = v6;
  v12.super_class = v1;
  return objc_msgSendSuper2(&v12, sel_init);
}

id CKSettingsCheckInDevicesList.init(fullDataSharing:)(char a1)
{
  if (a1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  id v3 = self;
  char v4 = v1;
  id v5 = objc_msgSend(v3, sel_mainScreen);
  objc_msgSend(v5, sel_bounds);
  uint64_t v7 = v6;

  uint64_t v8 = &v4[OBJC_IVAR____TtC21CommunicationsSetupUI28CKSettingsCheckInDevicesList_view];
  *(void *)uint64_t v8 = v7;
  v8[8] = v2;

  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for CKSettingsCheckInDevicesList();
  return objc_msgSendSuper2(&v10, sel_init);
}

uint64_t type metadata accessor for CKSettingsCheckInDevicesList()
{
  return self;
}

uint64_t sub_21ED9A1C4()
{
  sub_21ED9D238();
  MEMORY[0x270FA5388]();
  id v0 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_267EA6E00));
  uint64_t v1 = sub_21ED9D1F8();
  sub_21ED9D228();
  sub_21ED9D1E8();
  return v1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

id CKSettingsCheckInDevicesList.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void CKSettingsCheckInDevicesList.init()()
{
}

id CKSettingsCheckInDevicesList.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CKSettingsCheckInDevicesList();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21ED9A468@<X0>(char a1@<W0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EA6E08);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = &v27[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EA6E10);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  objc_super v12 = &v27[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(void *)uint64_t v8 = sub_21ED9D1D8();
  *((void *)v8 + 1) = 0x4024000000000000;
  v8[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EA6E18);
  double v28 = a3;
  char v29 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EA6E20);
  sub_21ED9C3A4(&qword_267EA6E28, &qword_267EA6E20);
  sub_21ED9D338();
  char v13 = sub_21ED9D258();
  sub_21ED9D188();
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  sub_21ED9A88C((uint64_t)v8, (uint64_t)v12, &qword_267EA6E08);
  long long v22 = &v12[*(int *)(v10 + 44)];
  *long long v22 = v13;
  *((void *)v22 + 1) = v15;
  *((void *)v22 + 2) = v17;
  *((void *)v22 + 3) = v19;
  *((void *)v22 + 4) = v21;
  v22[40] = 0;
  sub_21ED9A8F0((uint64_t)v8, &qword_267EA6E08);
  id v23 = objc_msgSend(self, sel_secondarySystemGroupedBackgroundColor);
  uint64_t v24 = MEMORY[0x223C39D10](v23);
  LOBYTE(v8) = sub_21ED9D258();
  sub_21ED9A88C((uint64_t)v12, a2, &qword_267EA6E10);
  uint64_t v25 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267EA6E30) + 36);
  *(void *)uint64_t v25 = v24;
  *(unsigned char *)(v25 + 8) = (_BYTE)v8;
  return sub_21ED9A8F0((uint64_t)v12, &qword_267EA6E10);
}

uint64_t sub_21ED9A6AC@<X0>(char a1@<W0>, unsigned char *a2@<X8>)
{
  uint64_t v4 = sub_21ED9D328();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v16[-v9];
  sub_21ED9D318();
  char v18 = 0;
  uint64_t v11 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 16);
  v11(v8, v10, v4);
  char v17 = 1;
  *a2 = v18;
  a2[1] = a1;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EA6EB8);
  v11(&a2[*(int *)(v12 + 48)], v8, v4);
  char v13 = &a2[*(int *)(v12 + 64)];
  *char v13 = v17;
  v13[1] = a1;
  uint64_t v14 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
  v14(v10, v4);
  return ((uint64_t (*)(unsigned char *, uint64_t))v14)(v8, v4);
}

uint64_t sub_21ED9A83C@<X0>(unsigned char *a1@<X8>)
{
  return sub_21ED9A6AC(*(unsigned char *)(v1 + 24), a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_21ED9A88C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21ED9A8F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21ED9A94C(char a1, int a2)
{
  return a1 & 1 | (a2 << 8);
}

uint64_t sub_21ED9A960()
{
  return sub_21ED9D2D8();
}

uint64_t sub_21ED9A97C@<X0>(uint64_t a1@<X8>)
{
  return sub_21ED9A468(*(unsigned char *)(v1 + 8), a1, *(double *)v1);
}

uint64_t sub_21ED9A988(char a1)
{
  return a1 & 1;
}

uint64_t sub_21ED9A990(__int16 a1)
{
  return HIBYTE(a1);
}

void *sub_21ED9A998@<X0>(__int16 a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_21ED9D1C8();
  sub_21ED9AA18(a1 & 0xFF01, (uint64_t)v6);
  memcpy(&__src[7], v6, 0x184uLL);
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  return memcpy((void *)(a2 + 17), __src, 0x18BuLL);
}

uint64_t sub_21ED9AA18@<X0>(__int16 a1@<W0>, uint64_t a2@<X8>)
{
  __int16 v3 = a1 & 1;
  uint64_t v4 = sub_21ED9D308();
  uint64_t v5 = sub_21ED9D268();
  uint64_t KeyPath = swift_getKeyPath();
  if ((a1 & 0xFF00) == 0x200)
  {
    *(void *)&__src[0] = sub_21ED9B328();
    *((void *)&__src[0] + 1) = v6;
    sub_21ED9C65C();
    uint64_t v7 = sub_21ED9D2A8();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    char v13 = v12 & 1;
    uint64_t v14 = sub_21ED9D348();
    sub_21ED9B4F4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)__src, 0.0, 1, 0.0, 1, v14, v15, v7, v9, v13, v11);
    sub_21ED9C64C(v7, v9, v13);
    swift_bridgeObjectRelease();
    v63[5] = __src[5];
    v63[6] = __src[6];
    v63[7] = __src[7];
    v63[8] = __src[8];
    v63[2] = __src[2];
    v63[3] = __src[3];
    v63[4] = __src[4];
    v63[0] = __src[0];
    v63[1] = __src[1];
    sub_21ED9C6B0((uint64_t)v63);
    sub_21ED9C2C8((uint64_t)v63, (uint64_t)v61);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EA6E90);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EA6E98);
    sub_21ED9C330();
    sub_21ED9C3A4(&qword_267EA6EA8, &qword_267EA6E98);
  }
  else
  {
    uint64_t v54 = sub_21ED9D1D8();
    *(void *)&__src[0] = sub_21ED9B328();
    *((void *)&__src[0] + 1) = v16;
    sub_21ED9C65C();
    uint64_t v56 = v5;
    uint64_t v17 = sub_21ED9D2A8();
    uint64_t v19 = v18;
    uint64_t v21 = v20;
    char v23 = v22 & 1;
    uint64_t v24 = sub_21ED9D348();
    sub_21ED9B4F4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)__src, 0.0, 1, 0.0, 1, v24, v25, v17, v19, v23, v21);
    sub_21ED9C64C(v17, v19, v23);
    swift_bridgeObjectRelease();
    long long v79 = __src[5];
    long long v80 = __src[6];
    long long v81 = __src[7];
    long long v82 = __src[8];
    long long v75 = __src[1];
    long long v76 = __src[2];
    long long v77 = __src[3];
    long long v78 = __src[4];
    long long v74 = __src[0];
    *(void *)&__src[0] = sub_21ED9B6E8(SHIBYTE(a1), v3);
    *((void *)&__src[0] + 1) = v26;
    uint64_t v27 = sub_21ED9D2A8();
    uint64_t v29 = v28;
    char v31 = v30 & 1;
    LODWORD(__src[0]) = sub_21ED9D218();
    uint64_t v32 = sub_21ED9D288();
    uint64_t v34 = v33;
    uint64_t v57 = v4;
    char v36 = v35 & 1;
    sub_21ED9C64C(v27, v29, v31);
    swift_bridgeObjectRelease();
    sub_21ED9D278();
    uint64_t v37 = sub_21ED9D298();
    uint64_t v39 = v38;
    char v41 = v40;
    __int16 v55 = v3;
    uint64_t v43 = v42;
    swift_release();
    sub_21ED9C64C(v32, v34, v36);
    uint64_t v5 = v56;
    swift_bridgeObjectRelease();
    uint64_t v44 = sub_21ED9D348();
    sub_21ED9B4F4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)__src, 0.0, 1, 0.0, 1, v44, v45, v37, v39, v41 & 1, v43);
    sub_21ED9C64C(v37, v39, v41 & 1);
    swift_bridgeObjectRelease();
    long long v70 = __src[5];
    long long v71 = __src[6];
    long long v72 = __src[7];
    long long v73 = __src[8];
    long long v66 = __src[1];
    long long v67 = __src[2];
    long long v68 = __src[3];
    long long v69 = __src[4];
    long long v65 = __src[0];
    v83[5] = v79;
    v83[6] = v80;
    v83[7] = v81;
    v83[8] = v82;
    v83[1] = v75;
    v83[2] = v76;
    v83[3] = v77;
    v83[4] = v78;
    v83[0] = v74;
    v60[6] = __src[6];
    v60[7] = __src[7];
    v60[8] = __src[8];
    v60[2] = __src[2];
    v60[3] = __src[3];
    v60[4] = __src[4];
    v60[5] = __src[5];
    v60[0] = __src[0];
    v60[1] = __src[1];
    __src[5] = v79;
    __src[6] = v80;
    __src[7] = v81;
    __src[8] = v82;
    __src[1] = v75;
    __src[2] = v76;
    __src[3] = v77;
    __src[4] = v78;
    __src[0] = v74;
    __src[14] = v70;
    __src[15] = v71;
    __src[16] = v72;
    __src[17] = v73;
    __src[10] = v66;
    __src[11] = v67;
    __src[12] = v68;
    __src[13] = v69;
    __src[9] = v65;
    memcpy(__dst, __src, sizeof(__dst));
    v61[6] = v71;
    v61[7] = v72;
    v61[8] = v73;
    v61[2] = v67;
    v61[3] = v68;
    v61[4] = v69;
    v61[5] = v70;
    v61[0] = v65;
    v61[1] = v66;
    sub_21ED9C6B8((uint64_t)v83);
    sub_21ED9C6B8((uint64_t)v60);
    sub_21ED9C6F8((uint64_t)v61);
    v63[5] = v79;
    v63[6] = v80;
    v63[7] = v81;
    v63[8] = v82;
    v63[2] = v76;
    v63[3] = v77;
    v63[4] = v78;
    v63[0] = v74;
    v63[1] = v75;
    sub_21ED9C6F8((uint64_t)v63);
    LOBYTE(v83[0]) = 1;
    memcpy((char *)v60 + 7, __dst, 0x120uLL);
    v63[0] = (unint64_t)v54;
    LOBYTE(v63[1]) = 1;
    memcpy((char *)&v63[1] + 1, v60, 0x127uLL);
    sub_21ED9C2BC((uint64_t)v63);
    sub_21ED9C2C8((uint64_t)v63, (uint64_t)v61);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EA6E90);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EA6E98);
    sub_21ED9C330();
    sub_21ED9C3A4(&qword_267EA6EA8, &qword_267EA6E98);
    uint64_t v4 = v57;
    __int16 v3 = v55;
  }
  sub_21ED9D208();
  if (v3)
  {
    uint64_t v46 = 0;
    uint64_t v50 = 0;
    uint64_t v48 = 0;
    int v49 = 0;
  }
  else
  {
    uint64_t v46 = sub_21ED9D2F8();
    unsigned int v47 = sub_21ED9D218();
    uint64_t v48 = sub_21ED9D2F8();
    int v49 = sub_21ED9D218();
    uint64_t v50 = v47;
  }
  uint64_t v51 = sub_21ED9D308();
  int v52 = sub_21ED9D218();
  memcpy(v60, __src, 0x139uLL);
  memcpy(v61, __src, 0x139uLL);
  memcpy((void *)(a2 + 24), __src, 0x139uLL);
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = KeyPath;
  *(void *)(a2 + 16) = v5;
  *(void *)(a2 + 344) = v46;
  *(void *)(a2 + 352) = v50;
  *(void *)(a2 + 36CNFRegLogBacktraceToDepth(128, 0) = v48;
  *(_DWORD *)(a2 + 368) = v49;
  *(void *)(a2 + 376) = v51;
  *(_DWORD *)(a2 + 384) = v52;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_21ED9C514((uint64_t)v61, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_21ED9C3E8);
  sub_21ED9C494(v46);
  sub_21ED9C4D4(v46);
  memcpy(v63, v60, 0x139uLL);
  sub_21ED9C514((uint64_t)v63, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_21ED9C5B0);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_21ED9B2E4(char a1)
{
  if (a1) {
    return 0x746177656C707061;
  }
  else {
    return 0x672E656E6F687069;
  }
}

uint64_t sub_21ED9B328()
{
  uint64_t v0 = sub_21ED9D148();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_21ED9D368();
  MEMORY[0x270FA5388](v1 - 8);
  sub_21ED9D358();
  sub_21ED9B4B4();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_21ED9D138();
  return sub_21ED9D378();
}

unint64_t sub_21ED9B4B4()
{
  unint64_t result = qword_267EA6E38;
  if (!qword_267EA6E38)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267EA6E38);
  }
  return result;
}

uint64_t sub_21ED9B4F4@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20 = a19;
  char v21 = a18;
  uint64_t v22 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_21ED9D388();
    char v31 = (void *)sub_21ED9D248();
    sub_21ED9D178();

    char v21 = a18;
    uint64_t v20 = a19;
    uint64_t v22 = a17;
  }
  sub_21ED9D198();
  *(void *)a9 = a16;
  *(void *)(a9 + 8) = v22;
  *(unsigned char *)(a9 + 16) = v21 & 1;
  *(void *)(a9 + 24) = v20;
  *(_OWORD *)(a9 + 96) = v37;
  *(_OWORD *)(a9 + 112) = v38;
  *(_OWORD *)(a9 + 128) = v39;
  *(_OWORD *)(a9 + 32) = v33;
  *(_OWORD *)(a9 + 48) = v34;
  *(_OWORD *)(a9 + 64) = v35;
  *(_OWORD *)(a9 + 8CNFRegLogBacktraceToDepth(128, 0) = v36;
  sub_21ED9C484(a16, v22, v21 & 1);
  return swift_bridgeObjectRetain();
}

uint64_t sub_21ED9B6E8(char a1, char a2)
{
  uint64_t v4 = sub_21ED9D148();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = sub_21ED9D368();
  MEMORY[0x270FA5388](v5 - 8);
  if (a2)
  {
    if (a1 != 2) {
      goto LABEL_3;
    }
  }
  else if (a1 != 2)
  {
LABEL_3:
    sub_21ED9D358();
    sub_21ED9B4B4();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v7 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    sub_21ED9D138();
    return sub_21ED9D378();
  }
  return 0;
}

BOOL sub_21ED9B8A0(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

unint64_t sub_21ED9B8B0()
{
  return 0xD000000000000011;
}

void *sub_21ED9B8E4@<X0>(uint64_t a1@<X8>)
{
  __int16 v3 = *v1;
  __int16 v4 = v1[1];
  uint64_t v5 = sub_21ED9D1C8();
  sub_21ED9AA18(v3 | (v4 << 8), (uint64_t)v7);
  memcpy(&__src[7], v7, 0x184uLL);
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  return memcpy((void *)(a1 + 17), __src, 0x18BuLL);
}

uint64_t sub_21ED9B970()
{
  return sub_21ED9D3A8();
}

uint64_t sub_21ED9B998()
{
  return sub_21ED9D3B8();
}

BOOL sub_21ED9B9E0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_21ED9B9FC()
{
  unint64_t result = qword_267EA6E40;
  if (!qword_267EA6E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EA6E40);
  }
  return result;
}

uint64_t sub_21ED9BA50(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &unk_21EDBA394, 1);
}

uint64_t sub_21ED9BA6C(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &unk_21EDBA3BC, 1);
}

unint64_t sub_21ED9BA8C()
{
  unint64_t result = qword_267EA6E48;
  if (!qword_267EA6E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EA6E48);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DataSharingType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for DataSharingType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x21ED9BC4CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_21ED9BC74(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_21ED9BC7C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DataSharingType()
{
  return &type metadata for DataSharingType;
}

uint64_t method lookup function for CKSettingsCheckInDevicesList(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CKSettingsCheckInDevicesList);
}

uint64_t dispatch thunk of CKSettingsCheckInDevicesList.__allocating_init(fullDataSharing:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of CKSettingsCheckInDevicesList.getView()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for CKSettingsDevicesListView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  BOOL v4 = v3 >= 3;
  int v5 = v3 - 3;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for CKSettingsDevicesListView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CKSettingsDevicesListView()
{
  return &type metadata for CKSettingsDevicesListView;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CKSettingsSampleDeviceListRow(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 65281 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 65281 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 16)) - 65281;
    }
    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((unsigned char *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }
LABEL_17:
  unsigned int v6 = *(unsigned __int8 *)a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CKSettingsSampleDeviceListRow(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65281 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65281 < 0xFF0000) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 16) + 1;
    *(_WORD *)unint64_t result = a2 - 255;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        break;
      case 2:
        *(_WORD *)(result + 2) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x21ED9BF0CLL);
      case 4:
        *(_DWORD *)(result + 2) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *(unsigned char *)unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CKSettingsSampleDeviceListRow()
{
  return &type metadata for CKSettingsSampleDeviceListRow;
}

uint64_t getEnumTagSinglePayload for CKSettingsSampleDeviceData(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CKSettingsSampleDeviceData(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x21ED9C0A0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_21ED9C0C8(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CKSettingsSampleDeviceData()
{
  return &type metadata for CKSettingsSampleDeviceData;
}

unint64_t sub_21ED9C0E8()
{
  unint64_t result = qword_267EA6E50;
  if (!qword_267EA6E50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EA6E30);
    sub_21ED9C188();
    sub_21ED9C3A4(&qword_267EA6E68, &qword_267EA6E70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EA6E50);
  }
  return result;
}

unint64_t sub_21ED9C188()
{
  unint64_t result = qword_267EA6E58;
  if (!qword_267EA6E58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EA6E10);
    sub_21ED9C3A4(&qword_267EA6E60, &qword_267EA6E08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EA6E58);
  }
  return result;
}

uint64_t sub_21ED9C228()
{
  return sub_21ED9C3A4(&qword_267EA6E78, &qword_267EA6E80);
}

uint64_t sub_21ED9C264@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21ED9D1A8();
  *a1 = result;
  return result;
}

uint64_t sub_21ED9C290()
{
  return sub_21ED9D1B8();
}

uint64_t sub_21ED9C2BC(uint64_t result)
{
  *(unsigned char *)(result + 312) = 1;
  return result;
}

uint64_t sub_21ED9C2C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EA6E88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_21ED9C330()
{
  unint64_t result = qword_267EA6EA0;
  if (!qword_267EA6EA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EA6E90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EA6EA0);
  }
  return result;
}

uint64_t sub_21ED9C3A4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21ED9C3E8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  if (a40)
  {
    sub_21ED9C484(a4, a5, a6 & 1);
    swift_bridgeObjectRetain();
    sub_21ED9C484(a22, a23, a24 & 1);
  }
  else
  {
    sub_21ED9C484(a1, a2, a3 & 1);
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_21ED9C484(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_21ED9C494(uint64_t result)
{
  if (result)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_21ED9C4D4(uint64_t result)
{
  if (result)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_21ED9C514(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v8 = *(unsigned char *)(a1 + 312);
  long long v6 = *(_OWORD *)(a1 + 272);
  long long v7 = *(_OWORD *)(a1 + 288);
  long long v4 = *(_OWORD *)(a1 + 240);
  long long v5 = *(_OWORD *)(a1 + 256);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    *(void *)(a1 + 224),
    *(void *)(a1 + 232),
    v4,
    *((void *)&v4 + 1),
    v5,
    *((void *)&v5 + 1),
    v6,
    *((void *)&v6 + 1),
    v7,
    *((void *)&v7 + 1),
    *(void *)(a1 + 304),
    v8);
  return a1;
}

uint64_t sub_21ED9C5B0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  if (a40)
  {
    sub_21ED9C64C(a4, a5, a6 & 1);
    swift_bridgeObjectRelease();
    sub_21ED9C64C(a22, a23, a24 & 1);
  }
  else
  {
    sub_21ED9C64C(a1, a2, a3 & 1);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_21ED9C64C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_21ED9C65C()
{
  unint64_t result = qword_267EA6EB0;
  if (!qword_267EA6EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EA6EB0);
  }
  return result;
}

uint64_t sub_21ED9C6B0(uint64_t result)
{
  *(unsigned char *)(result + 312) = 0;
  return result;
}

uint64_t sub_21ED9C6B8(uint64_t a1)
{
  return a1;
}

uint64_t sub_21ED9C6F8(uint64_t a1)
{
  return a1;
}

uint64_t sub_21ED9C73C()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

id sub_21ED9C74C()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_267EA74F0 = (uint64_t)result;
  return result;
}

uint64_t sub_21ED9C7A0(uint64_t a1)
{
  return sub_21ED9C868(a1, qword_267EA7508);
}

uint64_t sub_21ED9C7C4()
{
  return sub_21ED9C930(&qword_267EA74F8, (uint64_t)qword_267EA7508);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_21ED9C820@<X0>(uint64_t a1@<X8>)
{
  return sub_21ED9C9A8(&qword_267EA74F8, (uint64_t)qword_267EA7508, a1);
}

uint64_t sub_21ED9C844(uint64_t a1)
{
  return sub_21ED9C868(a1, qword_267EA7520);
}

uint64_t sub_21ED9C868(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_21ED9D168();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_267EA74E8 != -1) {
    swift_once();
  }
  id v4 = (id)qword_267EA74F0;
  return sub_21ED9D158();
}

uint64_t sub_21ED9C90C()
{
  return sub_21ED9C930(&qword_267EA7500, (uint64_t)qword_267EA7520);
}

uint64_t sub_21ED9C930(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_21ED9D168();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_21ED9C984@<X0>(uint64_t a1@<X8>)
{
  return sub_21ED9C9A8(&qword_267EA7500, (uint64_t)qword_267EA7520, a1);
}

uint64_t sub_21ED9C9A8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_21ED9D168();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  long long v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void __getCKSettingsHostingViewControllerClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *MessagesSettingsUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKModernSettingsViewController.m", 10, @"%s", *a1);

  __break(1u);
}

void __getCKSettingsHostingViewControllerClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCKSettingsHostingViewControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKModernSettingsViewController.m", 12, @"Unable to find class %s", "CKSettingsHostingViewController");

  __break(1u);
}

void CNFLocalizedStringFromTableInBundleWithFallback_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_21ED18000, log, OS_LOG_TYPE_FAULT, "ERROR! We are missing a string in our bundle for the key %@ for our current platform (key = %@). This means the user could be seeing the incorrect copy text.", (uint8_t *)&v3, 0x16u);
}

uint64_t sub_21ED9D138()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_21ED9D148()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_21ED9D158()
{
  return MEMORY[0x270EEB1D0]();
}

uint64_t sub_21ED9D168()
{
  return MEMORY[0x270EEB1E0]();
}

uint64_t sub_21ED9D178()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_21ED9D188()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_21ED9D198()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_21ED9D1A8()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_21ED9D1B8()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_21ED9D1C8()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_21ED9D1D8()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_21ED9D1E8()
{
  return MEMORY[0x270F01660]();
}

uint64_t sub_21ED9D1F8()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_21ED9D208()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_21ED9D218()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_21ED9D228()
{
  return MEMORY[0x270F02888]();
}

uint64_t sub_21ED9D238()
{
  return MEMORY[0x270F02898]();
}

uint64_t sub_21ED9D248()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_21ED9D258()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_21ED9D268()
{
  return MEMORY[0x270F02B90]();
}

uint64_t sub_21ED9D278()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_21ED9D288()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_21ED9D298()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_21ED9D2A8()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_21ED9D2B8()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_21ED9D2C8()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_21ED9D2D8()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_21ED9D2E8()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_21ED9D2F8()
{
  return MEMORY[0x270F04648]();
}

uint64_t sub_21ED9D308()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_21ED9D318()
{
  return MEMORY[0x270F04C20]();
}

uint64_t sub_21ED9D328()
{
  return MEMORY[0x270F04C30]();
}

uint64_t sub_21ED9D338()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_21ED9D348()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_21ED9D358()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_21ED9D368()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_21ED9D378()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_21ED9D388()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_21ED9D398()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21ED9D3A8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_21ED9D3B8()
{
  return MEMORY[0x270F9FC90]();
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x270EE45E8](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x270EE4600]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x270F1B710]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x270EE5210]();
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGSize CGSizeFromString(NSString *string)
{
  MEMORY[0x270F82BB0](string);
  result.height = v2;
  result.width = v1;
  return result;
}

uint64_t CPCopySharedResourcesPreferencesDomainForDomain()
{
  return MEMORY[0x270F0CD20]();
}

uint64_t CPPhoneNumberCopyActiveCountryCode()
{
  return MEMORY[0x270F0CD98]();
}

uint64_t CTSIMSupportGetSIMStatus()
{
  return MEMORY[0x270EE86F0]();
}

uint64_t CTSettingCopyMyPhoneNumber()
{
  return MEMORY[0x270EE8700]();
}

uint64_t CUTWeakLinkClass()
{
  return MEMORY[0x270F183D8]();
}

uint64_t CUTWeakLinkSymbol()
{
  return MEMORY[0x270F183E0]();
}

uint64_t CreateDetailControllerInstanceWithClass()
{
  return MEMORY[0x270F55198]();
}

uint64_t DLCLogWithLevelV()
{
  return MEMORY[0x270F26050]();
}

uint64_t DLCSessionLogWithLevelV()
{
  return MEMORY[0x270F26058]();
}

uint64_t DLCSessionShouldLogLevel()
{
  return MEMORY[0x270F26060]();
}

uint64_t DLCShouldLogLevel()
{
  return MEMORY[0x270F26068]();
}

uint64_t FTCServiceNameForServiceType()
{
  return MEMORY[0x270F281E0]();
}

uint64_t IDSParseAuthDictionary()
{
  return MEMORY[0x270F3CA40]();
}

uint64_t IDSRegistrationControlEnableRegistrationType()
{
  return MEMORY[0x270F3C9D8]();
}

uint64_t IDSRegistrationControlGetStateForRegistrationType()
{
  return MEMORY[0x270F3C9E0]();
}

uint64_t IMAreObjectsLogicallySame()
{
  return MEMORY[0x270F3CCB8]();
}

uint64_t IMGenerateLoginID()
{
  return MEMORY[0x270F3CD00]();
}

uint64_t IMGetDomainBoolForKey()
{
  return MEMORY[0x270F3CD28]();
}

uint64_t IMGetDomainBoolForKeyWithDefaultValue()
{
  return MEMORY[0x270F3CD30]();
}

uint64_t IMGetDomainValueForKey()
{
  return MEMORY[0x270F3CD38]();
}

uint64_t IMLogHandleForCategory()
{
  return MEMORY[0x270F3D080]();
}

uint64_t IMLogString()
{
  return MEMORY[0x270F3CDF0]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x270F3CE08]();
}

uint64_t IMPreferredAccountForService()
{
  return MEMORY[0x270F3CB20]();
}

uint64_t IMSetDomainBoolForKey()
{
  return MEMORY[0x270F3CE30]();
}

uint64_t IMSetPreferredAccountForService()
{
  return MEMORY[0x270F3CB88]();
}

uint64_t IMSetUserLoginIntent()
{
  return MEMORY[0x270F3D0D0]();
}

uint64_t IMSharedHelperDeviceHasMultipleActiveSubscriptions()
{
  return MEMORY[0x270F3D0D8]();
}

uint64_t IMSharedHelperDeviceHasMultipleSubscriptions()
{
  return MEMORY[0x270F3D0E0]();
}

uint64_t IMShouldLog()
{
  return MEMORY[0x270F3CE40]();
}

uint64_t IMSingleObjectArray()
{
  return MEMORY[0x270F3CE58]();
}

uint64_t IMStripLoginID()
{
  return MEMORY[0x270F3CE88]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x270F3CEA8]();
}

uint64_t IMWeakLinkSymbol()
{
  return MEMORY[0x270F3CEB0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MarcoAction()
{
  return MEMORY[0x270F496A0]();
}

uint64_t MarcoLogRegistration()
{
  return MEMORY[0x270F496C8]();
}

uint64_t MarcoShouldLogRegistration()
{
  return MEMORY[0x270F496F0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t OSLogHandleForIDSCategory()
{
  return MEMORY[0x270F3CEF0]();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x270F3CF00]();
}

uint64_t ObjectAndOffsetForURLPair()
{
  return MEMORY[0x270F551A8]();
}

uint64_t PNCopyFormattedStringWithCountry()
{
  return MEMORY[0x270F1B728]();
}

uint64_t PSIsNanoMirroringDomain()
{
  return MEMORY[0x270F55240]();
}

uint64_t PreferencesTableViewCellLeftPad()
{
  return MEMORY[0x270F55350]();
}

uint64_t PreferencesTableViewCellRightPad()
{
  return MEMORY[0x270F55358]();
}

uint64_t PreferencesTableViewFooterFont()
{
  return MEMORY[0x270F55368]();
}

uint64_t SBGetApplicationNetworkFlags()
{
  return MEMORY[0x270F770D8]();
}

uint64_t SBSLaunchApplicationWithIdentifier()
{
  return MEMORY[0x270F77188]();
}

uint64_t SBSSpringBoardServerPort()
{
  return MEMORY[0x270F771E8]();
}

uint64_t SBSetApplicationNetworkFlags()
{
  return MEMORY[0x270F77220]();
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x270EFD980](query);
}

uint64_t SpecifiersFromPlist()
{
  return MEMORY[0x270F55398]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

uint64_t UIKeyboardDisableAutomaticAppearance()
{
  return MEMORY[0x270F82E00]();
}

uint64_t UIKeyboardEnableAutomaticAppearance()
{
  return MEMORY[0x270F82E08]();
}

uint64_t UIKeyboardIsAutomaticAppearanceEnabled()
{
  return MEMORY[0x270F82E18]();
}

uint64_t UISystemRootDirectory()
{
  return MEMORY[0x270F82F28]();
}

uint64_t UserInterfaceIdiom()
{
  return MEMORY[0x270F553A8]();
}

uint64_t _AXSFaceTimeCaptionsEnabled()
{
  return MEMORY[0x270F90748]();
}

uint64_t _AXSSetFaceTimeCaptionsEnabled()
{
  return MEMORY[0x270F90A28]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFGetProductName()
{
  return MEMORY[0x270EE5628]();
}

uint64_t _CTServerConnectionCreate()
{
  return MEMORY[0x270EE87B0]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x270EE87C0]();
}

uint64_t _CTServerConnectionSetCellularUsagePolicy()
{
  return MEMORY[0x270EE8898]();
}

uint64_t _CTServerConnectionSetTraceProperty()
{
  return MEMORY[0x270EE88B8]();
}

uint64_t _IDSCopyMyPhoneNumbers()
{
  return MEMORY[0x270F3CA60]();
}

uint64_t _IDSCopyOrderedAliasStrings()
{
  return MEMORY[0x270F3CA68]();
}

uint64_t _IDSCopyOrderedAliases()
{
  return MEMORY[0x270F3CA70]();
}

uint64_t _PNCopyFormattedNumberSuggestionForDigitsWithCountry()
{
  return MEMORY[0x270F1B748]();
}

uint64_t _PNCreateStringByStrippingFormattingAndNotVisiblyAllowable()
{
  return MEMORY[0x270F1B760]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x270ED8718](a1, *(void *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x270ED8730](a1, *(void *)&a2);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void free(void *a1)
{
}

uint64_t im_dispatch_after()
{
  return MEMORY[0x270F3CFC8]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

uint64_t os_log_shim_legacy_logging_enabled()
{
  return MEMORY[0x270EDA9C0]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}