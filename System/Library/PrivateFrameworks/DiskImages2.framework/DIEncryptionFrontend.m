@interface DIEncryptionFrontend
+ (BOOL)hasGUIaccess;
+ (BOOL)supportsSecureCoding;
+ (BOOL)updateSystemKeychainAttrWithDict:(id)a3 isStoring:(BOOL)a4 error:(id *)a5;
- (BOOL)GUIAskForPassphraseWithError:(id *)a3;
- (BOOL)allowStoringInKeychain;
- (BOOL)askPermissionWithRememberPassword:(BOOL *)a3 error:(id *)a4;
- (BOOL)checkWithHasIcloudKeychain:(BOOL *)a3 error:(id *)a4;
- (BOOL)consoleAskForPassphraseWithUseStdin:(BOOL)a3 error:(id *)a4;
- (BOOL)storeInKeychainWithPassphrase:(id)a3 forceSystemKeychain:(BOOL)a4 error:(id *)a5;
- (BOOL)updateDiskImageParamsWithFrontend:(id)a3 error:(id *)a4;
- (BOOL)validateDeserializationWithError:(id *)a3;
- (DIBaseParams)diParams;
- (DIEncryptionFrontend)initWithCoder:(id)a3;
- (DIEncryptionFrontend)initWithParams:(id)a3;
- (NSString)CLIPassphrasePrompt;
- (NSString)CLIVerifyPassphrasePrompt;
- (NSString)GUIPassphraseLabel;
- (NSString)GUIPassphrasePrompt;
- (NSString)GUIVerifyPassphraseLabel;
- (NSUUID)encryptionUUID;
- (id)getCertificateWithCertificatePath:(id)a3 error:(id *)a4;
- (id)getCertificateWithPublicKey:(id)a3 error:(id *)a4;
- (unint64_t)flags;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowStoringInKeychain:(BOOL)a3;
@end

@implementation DIEncryptionFrontend

- (DIEncryptionFrontend)initWithParams:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DIEncryptionFrontend;
  v6 = [(DIEncryptionFrontend *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_diParams, a3);
    if ([(DIEncryptionFrontend *)v7 validateDeserializationWithError:0])
    {
      uint64_t v8 = [v5 encryptionUUID];
      encryptionUUID = v7->_encryptionUUID;
      v7->_encryptionUUID = (NSUUID *)v8;
    }
  }

  return v7;
}

- (unint64_t)flags
{
  v2 = [(DIEncryptionFrontend *)self diParams];
  uint64_t v3 = [v2 readPassphraseFlags];

  int v4 = isatty(0);
  uint64_t v5 = 2;
  if (!v4) {
    uint64_t v5 = 8;
  }
  unint64_t v6 = v3 & 0xFFFFFFFFFFFFFFFDLL;
  if (v4) {
    unint64_t v6 = v3;
  }
  if ((v3 & 8) != 0) {
    unint64_t v7 = v5;
  }
  else {
    unint64_t v7 = v6;
  }
  if (+[DIEncryptionFrontend hasGUIaccess]) {
    return v7;
  }
  else {
    return v7 & 0xFFFFFFFFFFFFFFFBLL;
  }
}

- (id)getCertificateWithCertificatePath:(id)a3 error:(id *)a4
{
  uint64_t v5 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:a3];
  if (!v5)
  {
    uint64_t v5 = +[DIError nilWithPOSIXCode:*__error() description:@"Failed to read from certificate file " error:a4];
  }
  return v5;
}

- (id)getCertificateWithPublicKey:(id)a3 error:(id *)a4
{
  v15[3] = *MEMORY[0x263EF8340];
  id v5 = a3;
  CFTypeRef v13 = 0;
  unint64_t v6 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v7 = *MEMORY[0x263F17070];
  v14[0] = *MEMORY[0x263F171B8];
  v14[1] = v7;
  v15[0] = *MEMORY[0x263F171C0];
  v15[1] = v5;
  v14[2] = *MEMORY[0x263F17520];
  v15[2] = MEMORY[0x263EFFA88];
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  CFDictionaryRef v9 = [v6 dictionaryWithDictionary:v8];

  uint64_t v10 = SecItemCopyMatching(v9, &v13);
  if (v10)
  {
    objc_super v11 = +[DIError nilWithOSStatus:v10 verboseInfo:@"Failed to find keychain item using hashed key" error:a4];
  }
  else
  {
    objc_super v11 = (void *)v13;
  }

  return v11;
}

- (BOOL)consoleAskForPassphraseWithUseStdin:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v34 = *MEMORY[0x263EF8340];
  int v7 = *__error();
  if (DIForwardLogs())
  {
    uint64_t v8 = getDIOSLog();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v30 = 66;
    __int16 v31 = 2080;
    v32 = "-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]";
    LODWORD(v28) = 18;
    v27 = buf;
    CFDictionaryRef v9 = (char *)_os_log_send_and_compose_impl();

    if (v9)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v9);
      free(v9);
    }
  }
  else
  {
    uint64_t v10 = getDIOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v30 = 66;
      __int16 v31 = 2080;
      v32 = "-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]";
      _os_log_impl(&dword_21E237000, v10, OS_LOG_TYPE_DEFAULT, "%.*s: Asking for passphrase using readpassphrase", buf, 0x12u);
    }
  }
  *__error() = v7;
  id v11 = [(DIEncryptionFrontend *)self CLIPassphrasePrompt];
  v12 = (const char *)[v11 UTF8String];
  if (v5) {
    int v13 = 32;
  }
  else {
    int v13 = 2;
  }
  v14 = readpassphrase(v12, __s1, 0x102uLL, v13);

  if (v14)
  {
    if (!v5)
    {
      v15 = [(DIEncryptionFrontend *)self CLIVerifyPassphrasePrompt];
      BOOL v16 = v15 == 0;

      if (!v16)
      {
        id v17 = [(DIEncryptionFrontend *)self CLIVerifyPassphrasePrompt];
        v18 = readpassphrase((const char *)[v17 UTF8String], (char *)buf, 0x102uLL, 2);

        if (!v18) {
          return +[DIError failWithPOSIXCode:25 verboseInfo:@"Failed to read passphrase" error:a4];
        }
        if (strncmp(__s1, (const char *)buf, 0x101uLL)) {
          return +[DIError failWithPOSIXCode:80 verboseInfo:@"Passphrases doesn't match" error:a4];
        }
      }
    }
    v20 = [(DIEncryptionFrontend *)self diParams];
    char v21 = [v20 setPassphrase:__s1 error:a4];
  }
  else
  {
    if (v5) {
      return +[DIError failWithPOSIXCode:25 verboseInfo:@"Failed to read passphrase from stdin" error:a4];
    }
    int v22 = *__error();
    if (DIForwardLogs())
    {
      v23 = getDIOSLog();
      os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v30 = 66;
      __int16 v31 = 2080;
      v32 = "-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]";
      v24 = (char *)_os_log_send_and_compose_impl();

      if (v24)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v24);
        free(v24);
      }
    }
    else
    {
      v25 = getDIOSLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v30 = 66;
        __int16 v31 = 2080;
        v32 = "-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]";
        _os_log_impl(&dword_21E237000, v25, OS_LOG_TYPE_DEFAULT, "%.*s: Failed to read passphrase from TTY", buf, 0x12u);
      }
    }
    *__error() = v22;
    return 1;
  }
  return v21;
}

- (BOOL)checkWithHasIcloudKeychain:(BOOL *)a3 error:(id *)a4
{
  *a3 = 1;
  return 1;
}

+ (BOOL)updateSystemKeychainAttrWithDict:(id)a3 isStoring:(BOOL)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)storeInKeychainWithPassphrase:(id)a3 forceSystemKeychain:(BOOL)a4 error:(id *)a5
{
  v43[7] = *MEMORY[0x263EF8340];
  id v8 = a3;
  CFDictionaryRef v9 = [(DIEncryptionFrontend *)self diParams];
  uint64_t v10 = [v9 inputURL];
  id v11 = [v10 path];
  v12 = [v11 lastPathComponent];

  id v13 = v8;
  v14 = (const char *)[v13 UTF8String];
  if (v14 && *v14)
  {
    uint64_t v34 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v14 length:strlen(v14)];
    v15 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v16 = *MEMORY[0x263F171B8];
    v43[0] = *MEMORY[0x263F171C8];
    uint64_t v17 = *MEMORY[0x263F16ED8];
    v42[0] = v16;
    v42[1] = v17;
    v18 = [(DIEncryptionFrontend *)self encryptionUUID];
    v19 = [v18 UUIDString];
    v43[1] = v19;
    v43[2] = @"disk image password";
    uint64_t v20 = *MEMORY[0x263F17000];
    v42[2] = *MEMORY[0x263F16F20];
    v42[3] = v20;
    uint64_t v21 = *MEMORY[0x263F17090];
    v43[3] = v12;
    v43[4] = v12;
    uint64_t v22 = *MEMORY[0x263F170B0];
    v42[4] = v21;
    v42[5] = v22;
    v42[6] = *MEMORY[0x263F175A8];
    v43[5] = MEMORY[0x263EFFA88];
    v43[6] = v34;
    v23 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:7];
    v24 = [v15 dictionaryWithDictionary:v23];

    char v35 = 0;
    if (a4) {
      goto LABEL_28;
    }
    if (![(DIEncryptionFrontend *)self checkWithHasIcloudKeychain:&v35 error:a5])
    {
LABEL_14:
      BOOL v25 = 0;
LABEL_24:

      goto LABEL_25;
    }
    if (!v35)
    {
LABEL_28:
      if (!+[DIEncryptionFrontend updateSystemKeychainAttrWithDict:v24 isStoring:1 error:a5])goto LABEL_14; {
    }
      }
    int v26 = *__error();
    if (DIForwardLogs())
    {
      v27 = getDIOSLog();
      os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      uint64_t v28 = "iCloud";
      *(_DWORD *)buf = 68158210;
      int v37 = 80;
      v39 = "-[DIEncryptionFrontend storeInKeychainWithPassphrase:forceSystemKeychain:error:]";
      __int16 v38 = 2080;
      if (!v35) {
        uint64_t v28 = "system";
      }
      __int16 v40 = 2080;
      v41 = v28;
      v29 = (char *)_os_log_send_and_compose_impl();

      if (v29)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v29);
        free(v29);
      }
    }
    else
    {
      int v30 = getDIOSLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        if (v35) {
          __int16 v31 = "iCloud";
        }
        else {
          __int16 v31 = "system";
        }
        *(_DWORD *)buf = 68158210;
        int v37 = 80;
        __int16 v38 = 2080;
        v39 = "-[DIEncryptionFrontend storeInKeychainWithPassphrase:forceSystemKeychain:error:]";
        __int16 v40 = 2080;
        v41 = v31;
        _os_log_impl(&dword_21E237000, v30, OS_LOG_TYPE_DEFAULT, "%.*s: Storing passphrase in the %s keychain", buf, 0x1Cu);
      }
    }
    *__error() = v26;
    uint64_t v32 = SecItemAdd((CFDictionaryRef)v24, 0);
    if (v32) {
      BOOL v25 = +[DIError failWithOSStatus:v32 description:@"Failed to store the passphrase in the keychain" error:a5];
    }
    else {
      BOOL v25 = 1;
    }
    goto LABEL_24;
  }
  BOOL v25 = +[DIError failWithEnumValue:154 verboseInfo:@"Cannot store an empty passphrase" error:a5];
LABEL_25:

  return v25;
}

- (BOOL)askPermissionWithRememberPassword:(BOOL *)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (![(DIEncryptionFrontend *)self allowStoringInKeychain]) {
    return 1;
  }
  int v6 = *__error();
  if (DIForwardLogs())
  {
    *(void *)error = 0;
    int v7 = getDIOSLog();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    *(_DWORD *)&uint8_t buf[4] = 64;
    __int16 v23 = 2080;
    v24 = "-[DIEncryptionFrontend askPermissionWithRememberPassword:error:]";
    id v8 = (char *)_os_log_send_and_compose_impl();

    if (v8)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v8);
      free(v8);
    }
  }
  else
  {
    CFDictionaryRef v9 = getDIOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      *(_DWORD *)&uint8_t buf[4] = 64;
      __int16 v23 = 2080;
      v24 = "-[DIEncryptionFrontend askPermissionWithRememberPassword:error:]";
      _os_log_impl(&dword_21E237000, v9, OS_LOG_TYPE_DEFAULT, "%.*s: Asking user permission to store the passphrase in the keychain", buf, 0x12u);
    }
  }
  *__error() = v6;
  error[0] = 0;
  uint64_t v10 = *MEMORY[0x263F00000];
  v20[0] = *MEMORY[0x263EFFFC8];
  v20[1] = v10;
  v21[0] = @"Remember password in my keychain?";
  v21[1] = @"Yes";
  uint64_t v11 = *MEMORY[0x263EFFFE8];
  v20[2] = *MEMORY[0x263F00020];
  v20[3] = v11;
  v21[2] = @"No";
  v21[3] = @"Cancel";
  CFDictionaryRef v12 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];
  id v13 = CFUserNotificationCreate(0, 0.0, 3uLL, error, v12);
  v14 = v13;
  if (!v13)
  {
    uint64_t v17 = [NSString stringWithFormat:@"CFUserNotificationCreate failed, error code %d", error[0]];
    BOOL v16 = +[DIError failWithEnumValue:154 verboseInfo:v17 error:a4];

    return v16;
  }
  *(void *)buf = 0;
  if (!CFUserNotificationReceiveResponse(v13, 0.0, (CFOptionFlags *)buf))
  {
    if (*(void *)buf != 2)
    {
      if (*(void *)buf)
      {
        BOOL v15 = +[DIError failWithPOSIXCode:89 description:@"The operation was cancelled by the user" error:a4];
        goto LABEL_11;
      }
      *a3 = 1;
    }

    return 1;
  }
  BOOL v15 = +[DIError failWithEnumValue:154 verboseInfo:@"CFUserNotificationReceiveResponse failed" error:a4];
LABEL_11:
  BOOL v16 = v15;

  return v16;
}

- (BOOL)GUIAskForPassphraseWithError:(id *)a3
{
  v34[4] = *MEMORY[0x263EF8340];
  SInt32 error = 0;
  BOOL v5 = (void *)MEMORY[0x263EFF980];
  int v6 = [(DIEncryptionFrontend *)self GUIPassphraseLabel];
  int v7 = [v5 arrayWithObject:v6];

  id v8 = [(DIEncryptionFrontend *)self GUIVerifyPassphraseLabel];
  CFOptionFlags v9 = 65539;

  if (v8)
  {
    uint64_t v10 = [(DIEncryptionFrontend *)self GUIVerifyPassphraseLabel];
    [v7 addObject:v10];

    CFOptionFlags v9 = 196611;
  }
  uint64_t v11 = (void *)MEMORY[0x263EFF9A0];
  v33[0] = *MEMORY[0x263EFFFC8];
  CFDictionaryRef v12 = [(DIEncryptionFrontend *)self GUIPassphrasePrompt];
  uint64_t v13 = *MEMORY[0x263F00000];
  v34[0] = v12;
  v34[1] = @"OK";
  uint64_t v14 = *MEMORY[0x263EFFFE8];
  v33[1] = v13;
  v33[2] = v14;
  v33[3] = *MEMORY[0x263F00028];
  v34[2] = @"Cancel";
  v34[3] = v7;
  BOOL v15 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:4];
  CFDictionaryRef v16 = [v11 dictionaryWithDictionary:v15];

  uint64_t v17 = CFUserNotificationCreate(0, 0.0, v9, &error, v16);
  v18 = v17;
  if (!v17)
  {
    uint64_t v20 = [NSString stringWithFormat:@"CFUserNotificationCreate failed, error code %d", error];
    BOOL v19 = +[DIError failWithEnumValue:154 verboseInfo:v20 error:a3];

    goto LABEL_24;
  }
  CFOptionFlags responseFlags = 0;
  if (!CFUserNotificationReceiveResponse(v17, 0.0, &responseFlags))
  {
    char v30 = BYTE1(responseFlags) & 1;
    if ((responseFlags & 3) != 0)
    {
      id v21 = 0;
      BOOL v22 = +[DIError failWithPOSIXCode:89 description:@"The operation was cancelled by the user" error:a3];
    }
    else
    {
      CFStringRef v23 = (const __CFString *)*MEMORY[0x263F00030];
      CFUserNotificationGetResponseValue(v18, (CFStringRef)*MEMORY[0x263F00030], 0);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v24 = CFUserNotificationGetResponseValue(v18, v23, 1);
        if (![v21 isEqualToString:v24])
        {
          BOOL v19 = +[DIError failWithPOSIXCode:80 description:@"Passwords don’t match" error:a3];

          goto LABEL_23;
        }
      }
      uint64_t v25 = [(DIEncryptionFrontend *)self diParams];
      id v21 = v21;
      char v26 = objc_msgSend(v25, "setPassphrase:error:", objc_msgSend(v21, "UTF8String"), a3);

      if ((v26 & 1) == 0
        || ![(DIEncryptionFrontend *)self askPermissionWithRememberPassword:&v30 error:a3])
      {
        BOOL v19 = 0;
        goto LABEL_23;
      }
      BOOL v27 = [(DIEncryptionFrontend *)self allowStoringInKeychain];
      if (v30) {
        BOOL v28 = v27;
      }
      else {
        BOOL v28 = 0;
      }
      if (!v28)
      {
        BOOL v19 = 1;
        goto LABEL_23;
      }
      BOOL v22 = [(DIEncryptionFrontend *)self storeInKeychainWithPassphrase:v21 forceSystemKeychain:0 error:a3];
    }
    BOOL v19 = v22;
LABEL_23:

    goto LABEL_24;
  }
  BOOL v19 = +[DIError failWithEnumValue:154 verboseInfo:@"CFUserNotificationReceiveResponse failed" error:a3];
LABEL_24:

  return v19;
}

+ (BOOL)hasGUIaccess
{
  return 1;
}

- (BOOL)updateDiskImageParamsWithFrontend:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v7 = [v6 validateDeserializationWithError:a4];
  if (v7)
  {
    id v8 = [v6 diParams];
    CFOptionFlags v9 = [v8 diskImageParamsXPC];
    uint64_t v10 = [(DIEncryptionFrontend *)self diParams];
    [v10 setDiskImageParamsXPC:v9];

    -[DIEncryptionFrontend setAllowStoringInKeychain:](self, "setAllowStoringInKeychain:", [v6 allowStoringInKeychain]);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIEncryptionFrontend)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"diParams"];
  id v6 = [(DIEncryptionFrontend *)self initWithParams:v5];
  if (v6) {
    v6->_allowStoringInKeychain = [v4 decodeBoolForKey:@"allowStoringInKeychain"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(DIEncryptionFrontend *)self diParams];
  [v5 encodeObject:v4 forKey:@"diParams"];

  objc_msgSend(v5, "encodeBool:forKey:", -[DIEncryptionFrontend allowStoringInKeychain](self, "allowStoringInKeychain"), @"allowStoringInKeychain");
}

- (BOOL)validateDeserializationWithError:(id *)a3
{
  id v4 = [(DIEncryptionFrontend *)self diParams];
  LOBYTE(a3) = [v4 validateDeserializationWithError:a3];

  return (char)a3;
}

- (NSString)GUIPassphrasePrompt
{
  return self->_GUIPassphrasePrompt;
}

- (NSString)GUIPassphraseLabel
{
  return self->_GUIPassphraseLabel;
}

- (NSString)GUIVerifyPassphraseLabel
{
  return self->_GUIVerifyPassphraseLabel;
}

- (NSString)CLIPassphrasePrompt
{
  return self->_CLIPassphrasePrompt;
}

- (NSString)CLIVerifyPassphrasePrompt
{
  return self->_CLIVerifyPassphrasePrompt;
}

- (DIBaseParams)diParams
{
  return self->_diParams;
}

- (NSUUID)encryptionUUID
{
  return self->_encryptionUUID;
}

- (BOOL)allowStoringInKeychain
{
  return self->_allowStoringInKeychain;
}

- (void)setAllowStoringInKeychain:(BOOL)a3
{
  self->_allowStoringInKeychain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionUUID, 0);
  objc_storeStrong((id *)&self->_diParams, 0);
  objc_storeStrong((id *)&self->_CLIVerifyPassphrasePrompt, 0);
  objc_storeStrong((id *)&self->_CLIPassphrasePrompt, 0);
  objc_storeStrong((id *)&self->_GUIVerifyPassphraseLabel, 0);
  objc_storeStrong((id *)&self->_GUIPassphraseLabel, 0);
  objc_storeStrong((id *)&self->_GUIPassphrasePrompt, 0);
}

@end