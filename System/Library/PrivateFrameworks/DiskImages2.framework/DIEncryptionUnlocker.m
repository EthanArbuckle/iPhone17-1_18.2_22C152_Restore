@interface DIEncryptionUnlocker
+ (BOOL)supportsSecureCoding;
- (BOOL)keychainUnlockWithError:(id *)a3;
- (BOOL)keychainUnlockWithIsSystemKeychain:(BOOL)a3 error:(id *)a4;
- (BOOL)lookupLegacyKeychainWithXpcHandler:(id)a3 error:(id *)a4;
- (BOOL)tryUnlockUsingSaksWithHasSaksKey:(BOOL *)a3 error:(id *)a4;
- (BOOL)unlockWithXpcHandler:(id)a3 error:(id *)a4;
- (id)CLIPassphrasePrompt;
- (id)GUIPassphraseLabel;
- (id)GUIPassphrasePrompt;
@end

@implementation DIEncryptionUnlocker

- (id)GUIPassphrasePrompt
{
  v2 = NSString;
  v3 = [(DIEncryptionFrontend *)self diParams];
  v4 = [v3 inputURL];
  v5 = [v4 lastPathComponent];
  v6 = [v2 stringWithFormat:@"Enter password to access “%@”", v5];

  return v6;
}

- (id)GUIPassphraseLabel
{
  return @"Password";
}

- (id)CLIPassphrasePrompt
{
  v2 = NSString;
  v3 = [(DIEncryptionFrontend *)self diParams];
  v4 = [v3 inputURL];
  v5 = [v4 lastPathComponent];
  v6 = [v2 stringWithFormat:@"Enter password to access “%@”: ", v5];

  return v6;
}

- (BOOL)keychainUnlockWithIsSystemKeychain:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  v60[4] = *MEMORY[0x263EF8340];
  CFTypeRef result = 0;
  v7 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v8 = *MEMORY[0x263F171B8];
  v60[0] = *MEMORY[0x263F171C8];
  uint64_t v9 = *MEMORY[0x263F16ED8];
  v59[0] = v8;
  v59[1] = v9;
  v10 = [(DIEncryptionFrontend *)self encryptionUUID];
  v11 = [v10 UUIDString];
  uint64_t v12 = *MEMORY[0x263F170B0];
  uint64_t v13 = *MEMORY[0x263F170B8];
  v60[1] = v11;
  v60[2] = v13;
  uint64_t v14 = *MEMORY[0x263F17520];
  v59[2] = v12;
  v59[3] = v14;
  v60[3] = MEMORY[0x263EFFA88];
  v15 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:4];
  CFDictionaryRef v16 = [v7 dictionaryWithDictionary:v15];

  if (v5
    && !+[DIEncryptionFrontend updateSystemKeychainAttrWithDict:v16 isStoring:0 error:0])
  {
    goto LABEL_50;
  }
  int v17 = *__error();
  if (DIForwardLogs())
  {
    uint64_t v51 = 0;
    v18 = getDIOSLog();
    os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    v19 = "iCloud";
    *(_DWORD *)buf = 68158210;
    int v54 = 65;
    v56 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
    __int16 v55 = 2080;
    if (v5) {
      v19 = "system";
    }
    __int16 v57 = 2080;
    v58 = v19;
    LODWORD(v49) = 28;
    v48 = buf;
    v20 = (char *)_os_log_send_and_compose_impl();

    if (v20)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v20);
      free(v20);
    }
  }
  else
  {
    v21 = getDIOSLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = "iCloud";
      *(_DWORD *)buf = 68158210;
      int v54 = 65;
      v56 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
      __int16 v55 = 2080;
      if (v5) {
        v22 = "system";
      }
      __int16 v57 = 2080;
      v58 = v22;
      _os_log_impl(&dword_21E237000, v21, OS_LOG_TYPE_DEFAULT, "%.*s: Looking for encrypted image passphrase in the %s keychain", buf, 0x1Cu);
    }
  }
  *__error() = v17;
  OSStatus v23 = SecItemCopyMatching(v16, &result);
  OSStatus v24 = v23;
  if (v23 == -25308)
  {
    int v25 = *__error();
    if (!DIForwardLogs())
    {
      v45 = getDIOSLog();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v54 = 65;
        __int16 v55 = 2080;
        v56 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
        _os_log_impl(&dword_21E237000, v45, OS_LOG_TYPE_DEFAULT, "%.*s: Keychain item requires ACL upgrade", buf, 0x12u);
      }

      goto LABEL_45;
    }
    uint64_t v51 = 0;
    v31 = getDIOSLog();
    os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v54 = 65;
    __int16 v55 = 2080;
    v56 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
    LODWORD(v49) = 18;
    v48 = buf;
    v27 = (char *)_os_log_send_and_compose_impl();

    if (v27)
    {
LABEL_24:
      fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v27);
      free(v27);
    }
LABEL_45:
    *__error() = v25;
    BOOL v43 = 1;
    -[DIEncryptionFrontend setAllowStoringInKeychain:](self, "setAllowStoringInKeychain:", 1, v48, v49);
    goto LABEL_51;
  }
  if (v23)
  {
    if (v23 == -25300)
    {
      int v25 = *__error();
      if (!DIForwardLogs())
      {
        v44 = getDIOSLog();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          int v54 = 65;
          __int16 v55 = 2080;
          v56 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
          _os_log_impl(&dword_21E237000, v44, OS_LOG_TYPE_DEFAULT, "%.*s: No matching item found in keychain", buf, 0x12u);
        }

        goto LABEL_45;
      }
      uint64_t v51 = 0;
      v26 = getDIOSLog();
      os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v54 = 65;
      __int16 v55 = 2080;
      v56 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
      LODWORD(v49) = 18;
      v48 = buf;
      v27 = (char *)_os_log_send_and_compose_impl();

      if (v27) {
        goto LABEL_24;
      }
      goto LABEL_45;
    }
    int v32 = *__error();
    if (DIForwardLogs())
    {
      uint64_t v51 = 0;
      v33 = getDIOSLog();
      os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68158210;
      int v54 = 65;
      __int16 v55 = 2080;
      v56 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
      __int16 v57 = 1024;
      LODWORD(v58) = v24;
      v34 = (char *)_os_log_send_and_compose_impl();

      if (v34)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v34);
        free(v34);
      }
    }
    else
    {
      v46 = getDIOSLog();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        int v54 = 65;
        __int16 v55 = 2080;
        v56 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
        __int16 v57 = 1024;
        LODWORD(v58) = v24;
        _os_log_impl(&dword_21E237000, v46, OS_LOG_TYPE_DEFAULT, "%.*s: Keychain lookup returned %d", buf, 0x18u);
      }
    }
    *__error() = v32;
LABEL_50:
    BOOL v43 = 1;
    goto LABEL_51;
  }
  int v28 = *__error();
  if (DIForwardLogs())
  {
    uint64_t v51 = 0;
    v29 = getDIOSLog();
    os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v54 = 65;
    __int16 v55 = 2080;
    v56 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
    v30 = (char *)_os_log_send_and_compose_impl();

    if (v30)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v30);
      free(v30);
    }
  }
  else
  {
    v35 = getDIOSLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v54 = 65;
      __int16 v55 = 2080;
      v56 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
      _os_log_impl(&dword_21E237000, v35, OS_LOG_TYPE_DEFAULT, "%.*s: Passphrase found in keychain, unlocking the image", buf, 0x12u);
    }
  }
  *__error() = v28;
  v36 = (void *)result;
  v37 = [(DIEncryptionFrontend *)self diParams];
  id v38 = v36;
  id v50 = 0;
  char v39 = objc_msgSend(v37, "setPassphrase:error:", objc_msgSend(v38, "bytes"), &v50);
  id v40 = v50;

  if ((v39 & 1) != 0 || ((uint64_t v41 = [v40 code], v41 >= 0) ? (v42 = v41) : (v42 = -v41), v42 == 80))
  {
    BOOL v43 = 1;
  }
  else
  {
    BOOL v43 = 0;
    if (a4) {
      *a4 = v40;
    }
  }

LABEL_51:
  return v43;
}

- (BOOL)keychainUnlockWithError:(id *)a3
{
  char v8 = 0;
  BOOL v5 = [(DIEncryptionFrontend *)self checkWithHasIcloudKeychain:&v8 error:a3];
  BOOL result = 0;
  if (v5)
  {
    if (!v8) {
      return 1;
    }
    BOOL v7 = [(DIEncryptionUnlocker *)self keychainUnlockWithIsSystemKeychain:0 error:a3];
    BOOL result = 0;
    if (v7) {
      return 1;
    }
  }
  return result;
}

- (BOOL)lookupLegacyKeychainWithXpcHandler:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)tryUnlockUsingSaksWithHasSaksKey:(BOOL *)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  memset(v14, 0, 89);
  BOOL v7 = [(DIEncryptionFrontend *)self diParams];
  char v8 = [v7 diskImageParamsXPC];
  uint64_t v9 = [v8 backendXPC];
  BOOL v10 = +[DICryptoHelper getPassphraseUsingSaksWithBackendXPC:v9 passPhrase:v14 error:a4];

  if (!v10) {
    return 0;
  }
  if (!LOBYTE(v14[0])) {
    return 1;
  }
  if (a3) {
    *a3 = 1;
  }
  v11 = [(DIEncryptionFrontend *)self diParams];
  char v12 = [v11 setPassphrase:v14 error:a4];

  return v12;
}

- (BOOL)unlockWithXpcHandler:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v7 = [(DIEncryptionFrontend *)self flags];
  char v8 = v7;
  if ((v7 & 8) != 0)
  {
    BOOL v10 = [(DIEncryptionFrontend *)self consoleAskForPassphraseWithUseStdin:1 error:a4];
LABEL_7:
    char v9 = v10;
    goto LABEL_23;
  }
  if ((v7 & 1) == 0)
  {
LABEL_3:
    char v28 = 0;
    if ([(DIEncryptionUnlocker *)self tryUnlockUsingSaksWithHasSaksKey:&v28 error:a4])
    {
      if (v28)
      {
LABEL_5:
        char v9 = 1;
LABEL_23:
        id v13 = 0;
        goto LABEL_24;
      }
      if ((v8 & 2) == 0) {
        goto LABEL_14;
      }
      if ([(DIEncryptionFrontend *)self consoleAskForPassphraseWithUseStdin:0 error:a4])
      {
        CFDictionaryRef v16 = [(DIEncryptionFrontend *)self diParams];
        char v17 = [v16 hasUnlockedBackend];

        if (v17) {
          goto LABEL_5;
        }
LABEL_14:
        if ((v8 & 4) != 0)
        {
          v19 = 0;
          uint64_t v20 = 2;
          while (1)
          {
            id v27 = v19;
            char v9 = [v6 GUIAskForPassphraseWithEncryptionFrontend:self error:&v27];
            id v21 = v27;

            if (v9) {
              break;
            }
            uint64_t v22 = [v21 code];
            if (v22 >= 0) {
              uint64_t v23 = v22;
            }
            else {
              uint64_t v23 = -v22;
            }
            BOOL v24 = v23 != 80 || v20-- == 0;
            v19 = v21;
            if (v24)
            {
              if (a4) {
                *a4 = v21;
              }
              break;
            }
          }

          goto LABEL_23;
        }
        BOOL v10 = +[DIError failWithPOSIXCode:25 verboseInfo:@"Cannot retrieve passphrase from user via TTY or GUI" error:a4];
        goto LABEL_7;
      }
    }
    char v9 = 0;
    goto LABEL_23;
  }
  v11 = [(DIEncryptionFrontend *)self diParams];
  id v29 = 0;
  char v12 = [v11 tryUnlockUsingKeychainCertificateWithError:&v29];
  id v13 = v29;

  if (v12) {
    goto LABEL_9;
  }
  if (v13)
  {
    if (a4)
    {
      id v13 = v13;
      char v9 = 0;
      *a4 = v13;
      goto LABEL_24;
    }
LABEL_43:
    char v9 = 0;
    goto LABEL_24;
  }
  if (![v6 keychainUnlockWithEncryptionUnlocker:self error:a4]) {
    goto LABEL_42;
  }
  uint64_t v14 = [(DIEncryptionFrontend *)self diParams];
  char v15 = [v14 hasUnlockedBackend];

  if ((v15 & 1) == 0)
  {
    if (![(DIEncryptionFrontend *)self allowStoringInKeychain]) {
      goto LABEL_3;
    }
    if ([(DIEncryptionUnlocker *)self lookupLegacyKeychainWithXpcHandler:v6 error:a4])
    {
      int v25 = [(DIEncryptionFrontend *)self diParams];
      char v26 = [v25 hasUnlockedBackend];

      if ((v26 & 1) == 0) {
        goto LABEL_3;
      }
      goto LABEL_18;
    }
LABEL_42:
    id v13 = 0;
    goto LABEL_43;
  }
LABEL_18:
  id v13 = 0;
LABEL_9:
  char v9 = 1;
LABEL_24:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end