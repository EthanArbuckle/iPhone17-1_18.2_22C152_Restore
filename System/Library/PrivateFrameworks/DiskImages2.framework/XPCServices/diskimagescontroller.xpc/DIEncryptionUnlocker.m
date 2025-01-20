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
  v2 = [(DIEncryptionFrontend *)self diParams];
  v3 = [v2 inputURL];
  v4 = [v3 lastPathComponent];
  v5 = +[NSString stringWithFormat:@"Enter password to access “%@”", v4];

  return v5;
}

- (id)GUIPassphraseLabel
{
  return @"Password";
}

- (id)CLIPassphrasePrompt
{
  v2 = [(DIEncryptionFrontend *)self diParams];
  v3 = [v2 inputURL];
  v4 = [v3 lastPathComponent];
  v5 = +[NSString stringWithFormat:@"Enter password to access “%@”: ", v4];

  return v5;
}

- (BOOL)keychainUnlockWithIsSystemKeychain:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  CFTypeRef result = 0;
  v54[0] = kSecClassGenericPassword;
  v53[0] = kSecClass;
  v53[1] = kSecAttrAccount;
  v7 = [(DIEncryptionFrontend *)self encryptionUUID];
  v8 = [v7 UUIDString];
  v54[1] = v8;
  v54[2] = kSecAttrSynchronizableAny;
  v53[2] = kSecAttrSynchronizable;
  v53[3] = kSecReturnData;
  v54[3] = &__kCFBooleanTrue;
  v9 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:4];
  CFDictionaryRef v10 = +[NSMutableDictionary dictionaryWithDictionary:v9];

  if (v5
    && !+[DIEncryptionFrontend updateSystemKeychainAttrWithDict:v10 isStoring:0 error:0])
  {
    goto LABEL_50;
  }
  int v11 = *__error();
  if (sub_1000D850C())
  {
    uint64_t v45 = 0;
    v12 = sub_1000D848C();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    v13 = "iCloud";
    *(_DWORD *)buf = 68158210;
    int v48 = 65;
    v50 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
    __int16 v49 = 2080;
    if (v5) {
      v13 = "system";
    }
    __int16 v51 = 2080;
    v52 = v13;
    LODWORD(v43) = 28;
    v42 = buf;
    v14 = (char *)_os_log_send_and_compose_impl();

    if (v14)
    {
      fprintf(__stderrp, "%s\n", v14);
      free(v14);
    }
  }
  else
  {
    v15 = sub_1000D848C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = "iCloud";
      *(_DWORD *)buf = 68158210;
      int v48 = 65;
      v50 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
      __int16 v49 = 2080;
      if (v5) {
        v16 = "system";
      }
      __int16 v51 = 2080;
      v52 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%.*s: Looking for encrypted image passphrase in the %s keychain", buf, 0x1Cu);
    }
  }
  *__error() = v11;
  OSStatus v17 = SecItemCopyMatching(v10, &result);
  OSStatus v18 = v17;
  if (v17 == -25308)
  {
    int v19 = *__error();
    if (!sub_1000D850C())
    {
      v39 = sub_1000D848C();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v48 = 65;
        __int16 v49 = 2080;
        v50 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%.*s: Keychain item requires ACL upgrade", buf, 0x12u);
      }

      goto LABEL_45;
    }
    uint64_t v45 = 0;
    v25 = sub_1000D848C();
    os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v48 = 65;
    __int16 v49 = 2080;
    v50 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
    LODWORD(v43) = 18;
    v42 = buf;
    v21 = (char *)_os_log_send_and_compose_impl();

    if (v21)
    {
LABEL_24:
      fprintf(__stderrp, "%s\n", v21);
      free(v21);
    }
LABEL_45:
    *__error() = v19;
    BOOL v37 = 1;
    -[DIEncryptionFrontend setAllowStoringInKeychain:](self, "setAllowStoringInKeychain:", 1, v42, v43);
    goto LABEL_51;
  }
  if (v17)
  {
    if (v17 == -25300)
    {
      int v19 = *__error();
      if (!sub_1000D850C())
      {
        v38 = sub_1000D848C();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          int v48 = 65;
          __int16 v49 = 2080;
          v50 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%.*s: No matching item found in keychain", buf, 0x12u);
        }

        goto LABEL_45;
      }
      uint64_t v45 = 0;
      v20 = sub_1000D848C();
      os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v48 = 65;
      __int16 v49 = 2080;
      v50 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
      LODWORD(v43) = 18;
      v42 = buf;
      v21 = (char *)_os_log_send_and_compose_impl();

      if (v21) {
        goto LABEL_24;
      }
      goto LABEL_45;
    }
    int v26 = *__error();
    if (sub_1000D850C())
    {
      uint64_t v45 = 0;
      v27 = sub_1000D848C();
      os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68158210;
      int v48 = 65;
      __int16 v49 = 2080;
      v50 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
      __int16 v51 = 1024;
      LODWORD(v52) = v18;
      v28 = (char *)_os_log_send_and_compose_impl();

      if (v28)
      {
        fprintf(__stderrp, "%s\n", v28);
        free(v28);
      }
    }
    else
    {
      v40 = sub_1000D848C();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        int v48 = 65;
        __int16 v49 = 2080;
        v50 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
        __int16 v51 = 1024;
        LODWORD(v52) = v18;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%.*s: Keychain lookup returned %d", buf, 0x18u);
      }
    }
    *__error() = v26;
LABEL_50:
    BOOL v37 = 1;
    goto LABEL_51;
  }
  int v22 = *__error();
  if (sub_1000D850C())
  {
    uint64_t v45 = 0;
    v23 = sub_1000D848C();
    os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v48 = 65;
    __int16 v49 = 2080;
    v50 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
    v24 = (char *)_os_log_send_and_compose_impl();

    if (v24)
    {
      fprintf(__stderrp, "%s\n", v24);
      free(v24);
    }
  }
  else
  {
    v29 = sub_1000D848C();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v48 = 65;
      __int16 v49 = 2080;
      v50 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%.*s: Passphrase found in keychain, unlocking the image", buf, 0x12u);
    }
  }
  *__error() = v22;
  v30 = (void *)result;
  v31 = [(DIEncryptionFrontend *)self diParams];
  id v32 = v30;
  id v44 = 0;
  unsigned __int8 v33 = objc_msgSend(v31, "setPassphrase:error:", objc_msgSend(v32, "bytes"), &v44);
  id v34 = v44;

  if ((v33 & 1) != 0 || ((uint64_t v35 = (uint64_t)[v34 code], v35 >= 0) ? (v36 = v35) : (v36 = -v35), v36 == 80))
  {
    BOOL v37 = 1;
  }
  else
  {
    BOOL v37 = 0;
    if (a4) {
      *a4 = v34;
    }
  }

LABEL_51:
  return v37;
}

- (BOOL)keychainUnlockWithError:(id *)a3
{
  char v8 = 0;
  unsigned int v5 = [(DIEncryptionFrontend *)self checkWithHasIcloudKeychain:&v8 error:a3];
  BOOL result = 0;
  if (v5)
  {
    if (!v8) {
      return 1;
    }
    unsigned int v7 = [(DIEncryptionUnlocker *)self keychainUnlockWithIsSystemKeychain:0 error:a3];
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
  memset(v14, 0, 89);
  unsigned int v7 = [(DIEncryptionFrontend *)self diParams];
  char v8 = [v7 diskImageParamsXPC];
  v9 = [v8 backendXPC];
  unsigned __int8 v10 = +[DICryptoHelper getPassphraseUsingSaksWithBackendXPC:v9 passPhrase:v14 error:a4];

  if ((v10 & 1) == 0) {
    return 0;
  }
  if (!LOBYTE(v14[0])) {
    return 1;
  }
  if (a3) {
    *a3 = 1;
  }
  int v11 = [(DIEncryptionFrontend *)self diParams];
  unsigned __int8 v12 = [v11 setPassphrase:v14 error:a4];

  return v12;
}

- (BOOL)unlockWithXpcHandler:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [(DIEncryptionFrontend *)self flags];
  unsigned __int8 v8 = v7;
  if ((v7 & 8) != 0)
  {
    unsigned __int8 v10 = [(DIEncryptionFrontend *)self consoleAskForPassphraseWithUseStdin:1 error:a4];
LABEL_7:
    unsigned __int8 v9 = v10;
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
        unsigned __int8 v9 = 1;
LABEL_23:
        id v13 = 0;
        goto LABEL_24;
      }
      if ((v8 & 2) == 0) {
        goto LABEL_14;
      }
      if ([(DIEncryptionFrontend *)self consoleAskForPassphraseWithUseStdin:0 error:a4])
      {
        v16 = [(DIEncryptionFrontend *)self diParams];
        unsigned __int8 v17 = [v16 hasUnlockedBackend];

        if (v17) {
          goto LABEL_5;
        }
LABEL_14:
        if ((v8 & 4) != 0)
        {
          int v19 = 0;
          uint64_t v20 = 2;
          while (1)
          {
            id v27 = v19;
            unsigned __int8 v9 = [v6 GUIAskForPassphraseWithEncryptionFrontend:self error:&v27];
            id v21 = v27;

            if (v9) {
              break;
            }
            uint64_t v22 = (uint64_t)[v21 code];
            if (v22 >= 0) {
              uint64_t v23 = v22;
            }
            else {
              uint64_t v23 = -v22;
            }
            BOOL v24 = v23 != 80 || v20-- == 0;
            int v19 = v21;
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
        unsigned __int8 v10 = +[DIError failWithPOSIXCode:25 verboseInfo:@"Cannot retrieve passphrase from user via TTY or GUI" error:a4];
        goto LABEL_7;
      }
    }
    unsigned __int8 v9 = 0;
    goto LABEL_23;
  }
  int v11 = [(DIEncryptionFrontend *)self diParams];
  id v29 = 0;
  unsigned __int8 v12 = [v11 tryUnlockUsingKeychainCertificateWithError:&v29];
  id v13 = v29;

  if (v12) {
    goto LABEL_9;
  }
  if (v13)
  {
    if (a4)
    {
      id v13 = v13;
      unsigned __int8 v9 = 0;
      *a4 = v13;
      goto LABEL_24;
    }
LABEL_43:
    unsigned __int8 v9 = 0;
    goto LABEL_24;
  }
  if (![v6 keychainUnlockWithEncryptionUnlocker:self error:a4]) {
    goto LABEL_42;
  }
  v14 = [(DIEncryptionFrontend *)self diParams];
  unsigned __int8 v15 = [v14 hasUnlockedBackend];

  if ((v15 & 1) == 0)
  {
    if (![(DIEncryptionFrontend *)self allowStoringInKeychain]) {
      goto LABEL_3;
    }
    if ([(DIEncryptionUnlocker *)self lookupLegacyKeychainWithXpcHandler:v6 error:a4])
    {
      v25 = [(DIEncryptionFrontend *)self diParams];
      unsigned __int8 v26 = [v25 hasUnlockedBackend];

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
  unsigned __int8 v9 = 1;
LABEL_24:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end