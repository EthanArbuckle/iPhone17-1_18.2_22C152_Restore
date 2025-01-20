@interface DOCErrorStore
+ (id)_augmentedErrorForError:(id)a3 localizedDescription:(id)a4 recoverySuggestion:(id)a5;
+ (id)augmentedErrorForError:(id)a3;
@end

@implementation DOCErrorStore

+ (id)augmentedErrorForError:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 domain];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F08438]];

  if (v6)
  {
    uint64_t v7 = [v4 code];
    if (v7 > 56)
    {
      if (v7 == 57)
      {
        v9 = _DocumentManagerBundle();
        v22 = [v9 localizedStringForKey:@"POSIX.ENOTCONN.title" value:@"There was a problem connecting to the server." table:@"LocalizableErrors"];
        v23 = _DocumentManagerBundle();
        v24 = [v23 localizedStringForKey:@"POSIX.ENOTCONN.recovery", @"Check the server name or IP address, and then try again. If you continue to have problems, contact your system administrator.", @"LocalizableErrors" value table];
        v21 = [a1 _augmentedErrorForError:v4 localizedDescription:v22 recoverySuggestion:v24];

LABEL_28:
        goto LABEL_29;
      }
      if (v7 == 80)
      {
        v8 = _DocumentManagerBundle();
        v9 = v8;
        v10 = @"POSIX.EAUTH.title";
        v13 = @"You entered an invalid username or password for the server.";
        goto LABEL_27;
      }
    }
    else if (v7 == 5 || v7 == 9)
    {
      v8 = _DocumentManagerBundle();
      v9 = v8;
      v10 = @"POSIX.EBADF.title";
LABEL_9:
      v13 = @"The operation can’t be completed because an unexpected error occurred.";
LABEL_27:
      v25 = [v8 localizedStringForKey:v10 value:v13 table:@"LocalizableErrors"];
      v21 = [a1 _augmentedErrorForError:v4 localizedDescription:v25 recoverySuggestion:0];

      goto LABEL_28;
    }
  }
  else
  {
    v11 = [v4 domain];
    int v12 = [v11 isEqualToString:*MEMORY[0x263F07F70]];

    if (v12)
    {
      if ([v4 code] == 4097)
      {
        v8 = _DocumentManagerBundle();
        v9 = v8;
        v10 = @"Cocoa.XPCConnectionInterrupted.title";
        goto LABEL_9;
      }
    }
    else
    {
      v14 = [v4 domain];
      int v15 = [v14 isEqualToString:*MEMORY[0x263F08570]];

      if (v15)
      {
        uint64_t v16 = [v4 code];
        if (v16 == -1000)
        {
          v8 = _DocumentManagerBundle();
          v9 = v8;
          v10 = @"URL.BadURL.title";
          v13 = @"The operation can’t be completed because this URL is not valid.";
          goto LABEL_27;
        }
        if (v16 == -1002)
        {
          v8 = _DocumentManagerBundle();
          v9 = v8;
          v10 = @"URL.UnsupportedURL.title";
          v13 = @"The operation can’t be completed because this URL is not supported.";
          goto LABEL_27;
        }
      }
      else
      {
        v17 = [v4 domain];
        int v18 = [v17 isEqualToString:*MEMORY[0x263F05370]];

        if (v18 && [v4 code] == -2001)
        {
          v8 = _DocumentManagerBundle();
          v9 = v8;
          v10 = @"FileProvider.ProviderNotFound.title";
          v13 = @"The file provider supporting this action is not available anymore";
          goto LABEL_27;
        }
      }
    }
  }
  v19 = (NSObject **)MEMORY[0x263F3AC28];
  v20 = *MEMORY[0x263F3AC28];
  if (!*MEMORY[0x263F3AC28])
  {
    DOCInitLogging();
    v20 = *v19;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    int v27 = 138412290;
    id v28 = v4;
    _os_log_impl(&dword_21361D000, v20, OS_LOG_TYPE_INFO, "No replacement error found for error: %@", (uint8_t *)&v27, 0xCu);
  }
  v21 = 0;
LABEL_29:

  return v21;
}

+ (id)_augmentedErrorForError:(id)a3 localizedDescription:(id)a4 recoverySuggestion:(id)a5
{
  v33[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = (__CFString *)a5;
  v10 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v11 = *MEMORY[0x263F08608];
  v32[0] = *MEMORY[0x263F08320];
  v32[1] = v11;
  v33[0] = v8;
  v33[1] = v7;
  int v12 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
  v13 = [v10 dictionaryWithDictionary:v12];

  if (DOCIsInternalBuild())
  {
    v14 = &stru_26C3FA950;
    if (v9) {
      int v15 = v9;
    }
    else {
      int v15 = &stru_26C3FA950;
    }
    uint64_t v16 = [v7 code];
    v17 = [v7 userInfo];
    if (v17)
    {
      v31 = [v7 userInfo];
      if ([v31 count])
      {
        int v18 = NSString;
        v30 = [v7 userInfo];
        v14 = [v18 stringWithFormat:@"\n\n%@", v30];
        int v19 = 1;
      }
      else
      {
        int v19 = 0;
      }
    }
    else
    {
      int v19 = 0;
    }
    v20 = [v7 domain];
    uint64_t v21 = [(__CFString *)v15 stringByAppendingFormat:@"\n\n[INTERNAL BUILD]\nError %ld%@ (%@)", v16, v14, v20];

    if (v19)
    {
    }
    if (v17) {

    }
    v9 = (__CFString *)v21;
  }
  if (v9) {
    [v13 setObject:v9 forKey:*MEMORY[0x263F08348]];
  }
  v22 = [v7 localizedRecoveryOptions];

  if (v22)
  {
    v23 = [v7 localizedRecoveryOptions];
    [v13 setObject:v23 forKey:*MEMORY[0x263F08340]];
  }
  v24 = [v7 recoveryAttempter];

  if (v24)
  {
    v25 = [v7 recoveryAttempter];
    [v13 setObject:v25 forKey:*MEMORY[0x263F084A8]];
  }
  v26 = (void *)MEMORY[0x263F087E8];
  int v27 = [v7 domain];
  id v28 = objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, objc_msgSend(v7, "code"), v13);

  return v28;
}

@end