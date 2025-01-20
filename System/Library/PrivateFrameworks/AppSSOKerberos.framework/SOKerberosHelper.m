@interface SOKerberosHelper
- (BOOL)_testForUPNForUser:(id)a3;
- (BOOL)authenticate:(gss_cred_id_t_desc_struct *)a3 toServer:(id)a4 returningToken:(id *)a5 andError:(id *)a6;
- (BOOL)changePasswordForUPN:(id)a3 realm:(id)a4 withOldPassword:(id)a5 withNewPassword:(id)a6 withError:(id *)a7;
- (BOOL)getPACForCred:(gss_cred_id_t_desc_struct *)a3 pac:(id *)a4;
- (BOOL)validatePassword:(id)a3 forUser:(id)a4;
- (gss_cred_id_t_desc_struct)acquireCredentialForUPN:(id)a3;
- (gss_cred_id_t_desc_struct)acquireCredentialForUUID:(id)a3;
- (gss_cred_id_t_desc_struct)createCredential:(id)a3 withOptions:(id)a4 andError:(id *)a5;
- (id)listCredentials;
- (unsigned)createGSSName:(id)a3 gname:(gss_name_t_desc_struct *)a4 error:(id *)a5;
- (void)destroyAllCredentials;
- (void)destroyCredential:(id)a3;
- (void)destroyCredentialForUPN:(id)a3;
@end

@implementation SOKerberosHelper

- (gss_cred_id_t_desc_struct)acquireCredentialForUUID:(id)a3
{
  id v3 = a3;
  v4 = SO_LOG_SOKerberosHelper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosHelper acquireCredentialForUUID:]();
  }

  if (!v3)
  {
    v8 = 0;
    goto LABEL_19;
  }
  v5 = [v3 UUIDString];
  if (([(__CFString *)v5 isEqualToString:&stru_26D3372C0] & 1) != 0
    || (CFUUIDRef v6 = CFUUIDCreateFromString(0, v5)) == 0)
  {
    *(void *)lifetime = 0;
    goto LABEL_14;
  }
  CFUUIDRef v7 = v6;
  v8 = GSSCreateCredentialFromUUID(v6);
  CFRelease(v7);
  *(void *)lifetime = 0;
  if (!v8)
  {
LABEL_14:
    v11 = NSString;
    v12 = [v3 UUIDString];
    v13 = [v11 stringWithFormat:@"failed to find credential: %@", v12];

    v14 = SO_LOG_SOKerberosHelper();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SOKerberosHelper acquireCredentialForUUID:]();
    }

    v8 = 0;
    goto LABEL_17;
  }
  OM_uint32 v9 = gss_inquire_cred(&lifetime[1], v8, 0, lifetime, 0, 0);
  if (lifetime[0]) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (!v10) {
    v8 = 0;
  }
LABEL_17:

LABEL_19:
  return v8;
}

- (gss_cred_id_t_desc_struct)acquireCredentialForUPN:(id)a3
{
  id v4 = a3;
  v5 = SO_LOG_SOKerberosHelper();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosHelper acquireCredentialForUPN:]();
  }

  *(void *)minor_status = 0;
  gss_cred_id_t output_cred_handle = 0;
  id v13 = 0;
  gss_name_t desired_name = 0;
  unsigned int v6 = [(SOKerberosHelper *)self createGSSName:v4 gname:&desired_name error:&v13];

  id v7 = v13;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      OM_uint32 v9 = SO_LOG_SOKerberosHelper();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[SOKerberosHelper acquireCredentialForUPN:]();
      }
    }
  }
  else
  {
    gss_OID_set oid_set = 0;
    gss_create_empty_oid_set(&minor_status[1], &oid_set);
    gss_add_oid_set_member(&minor_status[1], MEMORY[0x263F08E18], &oid_set);
    if (!gss_acquire_cred(&minor_status[1], desired_name, 0xFFFFFFFF, oid_set, 1, &output_cred_handle, 0, minor_status)&& !gss_inquire_cred(&minor_status[1], output_cred_handle, 0, minor_status, 0, 0)&& minor_status[0])
    {
      gss_release_name(&minor_status[1], &desired_name);
      gss_release_oid_set(&minor_status[1], &oid_set);
      BOOL v10 = output_cred_handle;
      goto LABEL_11;
    }
    gss_release_oid_set(&minor_status[1], &oid_set);
    gss_release_name(&minor_status[1], &desired_name);
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)_testForUPNForUser:(id)a3
{
  id v3 = (void *)MEMORY[0x263F08AE8];
  uint64_t v14 = 0;
  id v4 = a3;
  v5 = [v3 regularExpressionWithPattern:@"@" options:1 error:&v14];
  unint64_t v6 = objc_msgSend(v5, "numberOfMatchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

  id v7 = SO_LOG_SOKerberosHelper();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6 < 2)
  {
    if (v8)
    {
      __int16 v12 = 0;
      OM_uint32 v9 = "kerbGetTGTForUser: User entered a standard username in the username field.";
      BOOL v10 = (uint8_t *)&v12;
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    __int16 v13 = 0;
    OM_uint32 v9 = "kerbGetTGTForUser: User entered a UPN in the username field.";
    BOOL v10 = (uint8_t *)&v13;
LABEL_6:
    _os_log_impl(&dword_221304000, v7, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
  }

  return v6 > 1;
}

- (BOOL)changePasswordForUPN:(id)a3 realm:(id)a4 withOldPassword:(id)a5 withNewPassword:(id)a6 withError:(id *)a7
{
  v26[2] = *MEMORY[0x263EF8340];
  id v12 = a5;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  v16 = SO_LOG_SOKerberosHelper();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosHelper changePasswordForUPN:realm:withOldPassword:withNewPassword:withError:]();
  }

  CFErrorRef error = 0;
  id v17 = v14;
  [v17 UTF8String];

  __ApplePrivate_gsskrb5_set_default_realm();
  v25[0] = @"kGSSChangePasswordOldPassword";
  v25[1] = @"kGSSChangePasswordNewPassword";
  v26[0] = v12;
  v26[1] = v13;
  CFDictionaryRef v18 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
  gss_name_t name = 0;
  unsigned int v19 = [(SOKerberosHelper *)self createGSSName:v15 gname:&name error:a7];

  if (v19)
  {
    if (*a7)
    {
      v20 = SO_LOG_SOKerberosHelper();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[SOKerberosHelper changePasswordForUPN:realm:withOldPassword:withNewPassword:withError:]();
      }
    }
  }
  else
  {
    if (!gss_aapl_change_password(name, MEMORY[0x263F08E18], v18, &error))
    {
      BOOL v21 = 1;
      goto LABEL_9;
    }
    if (a7)
    {
      BOOL v21 = 0;
      *a7 = error;
      goto LABEL_9;
    }
    CFRelease(error);
  }
  BOOL v21 = 0;
LABEL_9:

  return v21;
}

- (BOOL)validatePassword:(id)a3 forUser:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = SO_LOG_SOKerberosHelper();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosHelper validatePassword:forUser:]();
  }

  krb5_context context = 0;
  krb5_principal v29 = 0;
  memset(creds, 0, sizeof(creds));
  krb5_error_code inited = krb5_init_context(&context);
  if (inited)
  {
    krb5_error_code v10 = inited;
    error_message = krb5_get_error_message(context, inited);
    id v12 = SO_LOG_SOKerberosHelper();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      krb5_error_code v32 = v10;
      __int16 v33 = 2080;
      v34 = error_message;
      id v13 = "kerbValidatePassword: krb5_init_context failed with error: %d - %s";
LABEL_17:
      _os_log_impl(&dword_221304000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0x12u);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  BOOL v14 = [(SOKerberosHelper *)self _testForUPNForUser:v7];
  id v15 = context;
  v16 = (const char *)[v7 UTF8String];
  if (v14) {
    krb5_error_code v17 = krb5_parse_name_flags(v15, v16, 4, &v29);
  }
  else {
    krb5_error_code v17 = krb5_parse_name(v15, v16, &v29);
  }
  krb5_error_code v18 = v17;
  if (v17)
  {
    unsigned int v19 = krb5_get_error_message(context, v17);
    id v12 = SO_LOG_SOKerberosHelper();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      krb5_error_code v32 = v18;
      __int16 v33 = 2080;
      v34 = v19;
      id v13 = "kerbValidatePassword: krb5_parse_name failed with error: %d - %s";
      goto LABEL_17;
    }
LABEL_18:

    BOOL v20 = 0;
    goto LABEL_19;
  }
  opt = 0;
  krb5_get_init_creds_opt_alloc(context, &opt);
  krb5_principal_get_realm();
  krb5_get_init_creds_opt_set_default_flags();
  if (v14) {
    krb5_get_init_creds_opt_set_win2k();
  }
  BOOL v20 = 1;
  krb5_get_init_creds_opt_set_pac_request();
  krb5_get_init_creds_opt_set_forwardable(opt, 1);
  BOOL v21 = context;
  v22 = v29;
  v23 = (char *)[v6 UTF8String];
  krb5_error_code init_creds_password = krb5_get_init_creds_password(v21, (krb5_creds *)creds, v22, v23, 0, 0, 0, 0, opt);
  krb5_get_init_creds_opt_free(context, opt);
  if (init_creds_password)
  {
    v25 = krb5_get_error_message(context, init_creds_password);
    id v12 = SO_LOG_SOKerberosHelper();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      krb5_error_code v32 = init_creds_password;
      __int16 v33 = 2080;
      v34 = v25;
      id v13 = "kerbValidatePassword: krb5_get_init_creds_password failed with error: %d - %s";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
LABEL_19:
  krb5_free_cred_contents(context, (krb5_creds *)creds);
  if (v29) {
    krb5_free_principal(context, v29);
  }
  if (context) {
    MEMORY[0x223C7EFD0]();
  }

  return v20;
}

- (unsigned)createGSSName:(id)a3 gname:(gss_name_t_desc_struct *)a4 error:(id *)a5
{
  id v7 = a3;
  BOOL v8 = SO_LOG_SOKerberosHelper();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosHelper createGSSName:gname:error:].cold.4();
  }

  OM_uint32 minor_status = 0;
  CFErrorRef error = 0;
  OM_uint32 v9 = [v7 componentsSeparatedByString:@"@"];
  uint64_t v10 = [v9 count] - 1;

  if (v10 < 2)
  {
    BOOL v14 = GSSCreateName(v7, MEMORY[0x263F08E00], &error);
    *a4 = v14;
    if (v14)
    {
      OM_uint32 v12 = 0;
    }
    else
    {
      id v15 = SO_LOG_SOKerberosHelper();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[SOKerberosHelper createGSSName:gname:error:]();
      }

      if (a5) {
        *a5 = error;
      }
      else {
        CFRelease(error);
      }
      OM_uint32 v12 = 851968;
    }
  }
  else
  {
    krb5_principal v18 = 0;
    krb5_error_code v11 = krb5_parse_name_flags(0, (const char *)[v7 UTF8String], 4, &v18);
    if (v11)
    {
      OM_uint32 v12 = v11;
      id v13 = SO_LOG_SOKerberosHelper();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[SOKerberosHelper createGSSName:gname:error:]();
      }
LABEL_12:

      goto LABEL_19;
    }
    input_name_buffer.length = 8;
    input_name_buffer.value = &v18;
    OM_uint32 v12 = gss_import_name(&minor_status, &input_name_buffer, MEMORY[0x263F08E28], a4);
    if (v12)
    {
      id v13 = SO_LOG_SOKerberosHelper();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[SOKerberosHelper createGSSName:gname:error:]();
      }
      goto LABEL_12;
    }
  }
LABEL_19:

  return v12;
}

- (gss_cred_id_t_desc_struct)createCredential:(id)a3 withOptions:(id)a4 andError:(id *)a5
{
  CFDictionaryRef v8 = (const __CFDictionary *)a4;
  id v9 = a3;
  uint64_t v10 = SO_LOG_SOKerberosHelper();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosHelper createCredential:withOptions:andError:]();
  }

  CFErrorRef error = 0;
  gss_cred_id_t output_cred_handle = 0;
  OM_uint32 minor_status = 0;
  gss_name_t desired_name = 0;
  unsigned int v11 = [(SOKerberosHelper *)self createGSSName:v9 gname:&desired_name error:a5];

  if (v11)
  {
    if (*a5)
    {
      OM_uint32 v12 = SO_LOG_SOKerberosHelper();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SOKerberosHelper changePasswordForUPN:realm:withOldPassword:withNewPassword:withError:]();
      }
    }
  }
  else
  {
    OM_uint32 v15 = gss_aapl_initial_cred(desired_name, MEMORY[0x263F08E18], v8, &output_cred_handle, &error);
    gss_release_name(&minor_status, &desired_name);
    if (!v15)
    {
      id v13 = output_cred_handle;
      goto LABEL_9;
    }
    v16 = SO_LOG_SOKerberosHelper();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SOKerberosHelper createCredential:withOptions:andError:]();
    }

    if (a5)
    {
      id v13 = 0;
      *a5 = error;
      goto LABEL_9;
    }
    CFRelease(error);
  }
  id v13 = 0;
LABEL_9:

  return v13;
}

- (void)destroyAllCredentials
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_1(&dword_221304000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

uint64_t __41__SOKerberosHelper_destroyAllCredentials__block_invoke(uint64_t a1, uint64_t a2, gss_cred_id_t_desc_struct *a3)
{
  gss_cred_id_t cred_handle = a3;
  OM_uint32 min_stat = 0;
  return gss_destroy_cred(&min_stat, &cred_handle);
}

- (void)destroyCredential:(id)a3
{
  id v3 = a3;
  uint64_t v4 = SO_LOG_SOKerberosHelper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosHelper destroyCredential:]();
  }

  if (v3)
  {
    OM_uint32 min_stat = 0;
    gss_cred_id_t cred_handle = 0;
    uint64_t v5 = [v3 UUIDString];
    if ([(__CFString *)v5 isEqualToString:&stru_26D3372C0])
    {
      id v6 = NSString;
      id v7 = [v3 UUIDString];
      CFDictionaryRef v8 = [v6 stringWithFormat:@"failed to find credential to destroy: %@", v7];

      id v9 = SO_LOG_SOKerberosHelper();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
LABEL_12:
      }
        -[SOKerberosHelper acquireCredentialForUUID:]();
    }
    else
    {
      CFUUIDRef v10 = CFUUIDCreateFromString(0, v5);
      if (v10)
      {
        CFUUIDRef v11 = v10;
        gss_cred_id_t cred_handle = GSSCreateCredentialFromUUID(v10);
        CFRelease(v11);
        if (cred_handle)
        {
          gss_destroy_cred(&min_stat, &cred_handle);
          if (cred_handle) {
            gss_release_cred(&min_stat, &cred_handle);
          }
        }
        goto LABEL_14;
      }
      OM_uint32 v12 = NSString;
      id v13 = [v3 UUIDString];
      CFDictionaryRef v8 = [v12 stringWithFormat:@"failed to find credential to destroy: %@", v13];

      id v9 = SO_LOG_SOKerberosHelper();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
    }

LABEL_14:
  }
}

- (void)destroyCredentialForUPN:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SO_LOG_SOKerberosHelper();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosHelper destroyCredentialForUPN:]();
  }

  if (v4)
  {
    OM_uint32 min_stat = 0;
    gss_cred_id_t v7 = [(SOKerberosHelper *)self acquireCredentialForUPN:v4];
    if (v7)
    {
      gss_destroy_cred(&min_stat, &v7);
      if (v7) {
        gss_release_cred(&min_stat, &v7);
      }
    }
  }
  else
  {
    id v6 = SO_LOG_SOKerberosHelper();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SOKerberosHelper destroyCredentialForUPN:]();
    }
  }
}

- (BOOL)authenticate:(gss_cred_id_t_desc_struct *)a3 toServer:(id)a4 returningToken:(id *)a5 andError:(id *)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v9 = a4;
  CFUUIDRef v10 = SO_LOG_SOKerberosHelper();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosHelper authenticate:toServer:returningToken:andError:]();
  }

  gss_ctx_id_t context_handle = 0;
  buffer.length = 0;
  buffer.value = 0;
  OM_uint32 minor_status = 0;
  CFErrorRef error = 0;
  CFUUIDRef v11 = GSSCreateName(v9, MEMORY[0x263F08DF8], &error);
  input_gss_name_t name = v11;
  if (v11)
  {
    OM_uint32 v12 = v11;
    id v13 = [v9 lowercaseString];
    if ([v13 hasPrefix:@"http"]) {
      BOOL v14 = (gss_OID_desc *)MEMORY[0x263F08E40];
    }
    else {
      BOOL v14 = (gss_OID_desc *)MEMORY[0x263F08E18];
    }

    OM_uint32 inited = gss_init_sec_context(&minor_status, a3, &context_handle, v12, v14, 0x803Eu, 0xFFFFFFFF, 0, 0, 0, &buffer, 0, 0);
    BOOL v16 = inited < 2;
    if (inited >= 2)
    {
      OM_uint32 v21 = inited;
      CFErrorRef v22 = GSSCreateError(v14, inited, minor_status);
      v23 = SO_LOG_SOKerberosHelper();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        id v31 = v9;
        __int16 v32 = 1024;
        OM_uint32 v33 = v21;
        __int16 v34 = 1024;
        OM_uint32 v35 = minor_status;
        __int16 v36 = 2114;
        CFErrorRef v37 = v22;
        _os_log_error_impl(&dword_221304000, v23, OS_LOG_TYPE_ERROR, "gss_init_sec_context failed server: %@, maj_stat: %d, min_stat: %d, %{public}@", buf, 0x22u);
      }

      if (a6) {
        *a6 = v22;
      }
      else {
        CFRelease(v22);
      }
    }
    else
    {
      krb5_error_code v17 = SO_LOG_SOKerberosHelper();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v31) = buffer.length;
        _os_log_impl(&dword_221304000, v17, OS_LOG_TYPE_INFO, "have a buffer of length: %d, success", buf, 8u);
      }

      id v18 = objc_alloc(MEMORY[0x263EFF8F8]);
      id v19 = (id) [v18 initWithBytes:buffer.value length:buffer.length];
      *a5 = v19;
    }
    gss_release_name(&minor_status, &input_name);
    gss_release_buffer(&minor_status, &buffer);
  }
  else
  {
    BOOL v20 = SO_LOG_SOKerberosHelper();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[SOKerberosHelper authenticate:toServer:returningToken:andError:]();
    }

    if (a6)
    {
      BOOL v16 = 0;
      *a6 = error;
    }
    else
    {
      CFRelease(error);
      BOOL v16 = 0;
    }
  }

  return v16;
}

- (id)listCredentials
{
  OM_uint32 min_stat = 0;
  uint64_t v2 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__SOKerberosHelper_listCredentials__block_invoke;
  v5[3] = &unk_2645A2688;
  id v3 = v2;
  id v6 = v3;
  gss_iter_creds(&min_stat, 0, MEMORY[0x263F08E18], v5);

  return v3;
}

void __35__SOKerberosHelper_listCredentials__block_invoke(uint64_t a1, uint64_t a2, gss_cred_id_t_desc_struct *a3)
{
  if (a3)
  {
    CFUUIDRef v11 = objc_alloc_init(SOKerberosCredential);
    CFUUIDRef v5 = GSSCredentialCopyUUID(a3);
    if (v5)
    {
      CFUUIDRef v6 = v5;
      gss_cred_id_t v7 = (__CFString *)CFUUIDCreateString(0, v5);
      [(SOKerberosCredential *)v11 setUuid:v7];

      [(SOKerberosCredential *)v11 setLifetime:GSSCredentialGetLifetime(a3)];
      CFDictionaryRef v8 = GSSCredentialCopyName(a3);
      if (v8)
      {
        id v9 = v8;
        CFStringRef DisplayString = GSSNameCreateDisplayString(v8);
        CFRelease(v9);
        if (DisplayString)
        {
          [(SOKerberosCredential *)v11 setName:DisplayString];
          CFRelease(DisplayString);
        }
      }
      [*(id *)(a1 + 32) addObject:v11];
      CFRelease(v6);
    }
    CFRelease(a3);
  }
}

- (BOOL)getPACForCred:(gss_cred_id_t_desc_struct *)a3 pac:(id *)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  CFUUIDRef v6 = SO_LOG_SOKerberosHelper();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosHelper getPACForCred:pac:]8();
  }

  if (a4) {
    *a4 = 0;
  }
  krb5_ccache v40 = 0;
  *(void *)&v41.byte0 = 0;
  krb5_principal principal = 0;
  uint64_t v38 = 0;
  krb5_principal v35 = 0;
  krb5_context v36 = 0;
  *(void *)&v41.byte8 = 0;
  uint64_t v34 = 0;
  uint64_t v33 = 0;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v28 = 0;
  uint64_t v27 = 0;
  uint64_t v26 = 0;
  memset(creds, 0, sizeof(creds));
  if (!a3)
  {
    gss_cred_id_t v7 = SO_LOG_SOKerberosHelper();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SOKerberosHelper getPACForCred:pac:]();
    }
    goto LABEL_11;
  }
  if (krb5_init_context(&v36))
  {
    gss_cred_id_t v7 = SO_LOG_SOKerberosHelper();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SOKerberosHelper getPACForCred:pac:]7();
    }
LABEL_11:

    return 0;
  }
  CFUUIDRef v10 = GSSCredentialCopyUUID(a3);
  if (!v10)
  {
    id v13 = SO_LOG_SOKerberosHelper();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SOKerberosHelper getPACForCred:pac:]();
    }

    BOOL v14 = 0;
    BOOL v8 = 1;
    goto LABEL_28;
  }
  CFUUIDRef v11 = v10;
  CFUUIDBytes v41 = CFUUIDGetUUIDBytes(v10);
  CFRelease(v11);
  if (!krb5_cc_resolve_by_uuid())
  {
    if (krb5_cc_get_principal(v36, v40, &principal))
    {
      OM_uint32 v12 = SO_LOG_SOKerberosHelper();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SOKerberosHelper getPACForCred:pac:]5();
      }
      goto LABEL_26;
    }
    uint64_t realm = krb5_principal_get_realm();
    if (krb5_make_principal())
    {
      OM_uint32 v12 = SO_LOG_SOKerberosHelper();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SOKerberosHelper getPACForCred:pac:]4();
      }
      goto LABEL_26;
    }
    long long v25 = 0u;
    memset(&mcreds[16], 0, 112);
    krb5_cc_clear_mcred();
    *(void *)&mcreds[8] = v35;
    *(void *)mcreds = principal;
    if (krb5_cc_retrieve_cred(v36, v40, 0, (krb5_creds *)mcreds, (krb5_creds *)creds))
    {
      OM_uint32 v15 = SO_LOG_SOKerberosHelper();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[SOKerberosHelper getPACForCred:pac:]3();
      }

      krb5_cc_clear_mcred();
      goto LABEL_27;
    }
    krb5_cc_clear_mcred();
    krb5_free_principal(v36, v35);
    krb5_principal v35 = 0;
    if (krb5_get_creds_opt_alloc())
    {
      OM_uint32 v12 = SO_LOG_SOKerberosHelper();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SOKerberosHelper getPACForCred:pac:]2();
      }
      goto LABEL_26;
    }
    krb5_get_creds_opt_set_impersonate();
    krb5_get_creds_opt_add_options();
    krb5_get_creds_opt_add_options();
    krb5_get_creds_opt_add_options();
    uint64_t v23 = 0;
    memset(&v22[26], 0, 64);
    if (decode_Ticket())
    {
      OM_uint32 v12 = SO_LOG_SOKerberosHelper();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SOKerberosHelper getPACForCred:pac:]1();
      }
      goto LABEL_26;
    }
    int creds_opt_set_ticket = krb5_get_creds_opt_set_ticket();
    free_Ticket();
    if (creds_opt_set_ticket)
    {
      OM_uint32 v12 = SO_LOG_SOKerberosHelper();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SOKerberosHelper getPACForCred:pac:]0();
      }
      goto LABEL_26;
    }
    if (krb5_get_creds())
    {
      OM_uint32 v12 = SO_LOG_SOKerberosHelper();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SOKerberosHelper getPACForCred:pac:].cold.9();
      }
      goto LABEL_26;
    }
    if (decode_Ticket())
    {
      OM_uint32 v12 = SO_LOG_SOKerberosHelper();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SOKerberosHelper getPACForCred:pac:].cold.8();
      }
      goto LABEL_26;
    }
    OM_uint32 v21 = (krb5_ticket *)malloc_type_calloc(1uLL, 0x98uLL, 0x10B0040764A81A9uLL);
    int v17 = krb5_decrypt_ticket();
    free_Ticket();
    if (v17)
    {
      id v18 = SO_LOG_SOKerberosHelper();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[SOKerberosHelper getPACForCred:pac:].cold.7();
      }
    }
    else if (krb5_ticket_get_authorization_data_type())
    {
      id v18 = SO_LOG_SOKerberosHelper();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[SOKerberosHelper getPACForCred:pac:].cold.6();
      }
    }
    else
    {
      int v19 = krb5_pac_parse();
      krb5_data_free();
      if (v19)
      {
        id v18 = SO_LOG_SOKerberosHelper();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[SOKerberosHelper getPACForCred:pac:].cold.5();
        }
      }
      else if (krb5_pac_verify())
      {
        id v18 = SO_LOG_SOKerberosHelper();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[SOKerberosHelper getPACForCred:pac:].cold.4();
        }
      }
      else
      {
        krb5_data_zero();
        if (!krb5_pac_get_buffer())
        {
          memset(v22, 0, 416);
          if (!get_kerbvalidationinfo(v27, v26, (uint64_t)v22))
          {
            if (a4) {
              *a4 = -[SOKerberosPacData initWithValidationInfo:]([SOKerberosPacData alloc], "initWithValidationInfo:", v22, "krbtgt", realm, 0);
            }
            free_kerbvalidationinfo(v22);
          }
          krb5_data_free();
          krb5_pac_free();
          uint64_t v28 = 0;
          BOOL v8 = 1;
          goto LABEL_79;
        }
        id v18 = SO_LOG_SOKerberosHelper();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[SOKerberosHelper getPACForCred:pac:]();
        }
      }
    }

    BOOL v8 = 0;
LABEL_79:
    BOOL v14 = v21;
    goto LABEL_28;
  }
  OM_uint32 v12 = SO_LOG_SOKerberosHelper();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[SOKerberosHelper getPACForCred:pac:]6();
  }
LABEL_26:

LABEL_27:
  BOOL v14 = 0;
  BOOL v8 = 0;
LABEL_28:
  krb5_free_cred_contents(v36, (krb5_creds *)creds);
  if (v38)
  {
    krb5_free_creds(v36, v38);
    uint64_t v38 = 0;
  }
  if (v40)
  {
    krb5_cc_close(v36, v40);
    krb5_ccache v40 = 0;
  }
  if (principal)
  {
    krb5_free_principal(v36, principal);
    krb5_principal principal = 0;
  }
  if (v35)
  {
    krb5_free_principal(v36, v35);
    krb5_principal v35 = 0;
  }
  if (v34)
  {
    krb5_get_creds_opt_free();
    uint64_t v34 = 0;
  }
  if (v14) {
    krb5_free_ticket(v36, v14);
  }
  if (v28)
  {
    krb5_pac_free();
    uint64_t v28 = 0;
  }
  if (v36) {
    MEMORY[0x223C7EFD0]();
  }
  return v8;
}

- (void)acquireCredentialForUUID:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_1(&dword_221304000, v0, v1, "Error using cached credential: %{public}@", v2, v3, v4, v5, v6);
}

- (void)acquireCredentialForUUID:.cold.2()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_1(&dword_221304000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)acquireCredentialForUPN:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_1(&dword_221304000, v0, v1, "createGSSName failed with: %{public}@", v2, v3, v4, v5, v6);
}

- (void)acquireCredentialForUPN:.cold.2()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_1(&dword_221304000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)changePasswordForUPN:realm:withOldPassword:withNewPassword:withError:.cold.1()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_221304000, v0, v1, "createGSSName failed with: %{public}@", v2, v3, v4, v5, v6);
}

- (void)changePasswordForUPN:realm:withOldPassword:withNewPassword:withError:.cold.2()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_1(&dword_221304000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)validatePassword:forUser:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_1(&dword_221304000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)createGSSName:gname:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_221304000, v0, v1, "error importing krb5 principal", v2, v3, v4, v5, v6);
}

- (void)createGSSName:gname:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_221304000, v0, v1, "error parsing krb5 principal", v2, v3, v4, v5, v6);
}

- (void)createGSSName:gname:error:.cold.3()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_221304000, v0, v1, "GSSCreateName failed with: %{public}@", v2, v3, v4, v5, v6);
}

- (void)createGSSName:gname:error:.cold.4()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_1(&dword_221304000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)createCredential:withOptions:andError:.cold.1()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_221304000, v0, v1, "gss_aapl_initial_cred failed with: %{public}@", v2, v3, v4, v5, v6);
}

- (void)createCredential:withOptions:andError:.cold.3()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_1(&dword_221304000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)destroyCredential:.cold.3()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_1(&dword_221304000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)destroyCredentialForUPN:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_221304000, v0, v1, "destroyCredentialForUPN - no UPN", v2, v3, v4, v5, v6);
}

- (void)destroyCredentialForUPN:.cold.2()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_1(&dword_221304000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)authenticate:toServer:returningToken:andError:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_221304000, v1, OS_LOG_TYPE_ERROR, "failed to import %@: %{public}@", v2, 0x16u);
}

- (void)authenticate:toServer:returningToken:andError:.cold.2()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_1(&dword_221304000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)getPACForCred:pac:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_221304000, v0, v1, "gsscred is not specified", v2, v3, v4, v5, v6);
}

- (void)getPACForCred:pac:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_221304000, v0, v1, "Error copying cred uuid", v2, v3, v4, v5, v6);
}

- (void)getPACForCred:pac:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_221304000, v0, v1, "Error getting logon info from pac: %d", v2, v3, v4, v5, v6);
}

- (void)getPACForCred:pac:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_221304000, v0, v1, "Error verifying pac: %d", v2, v3, v4, v5, v6);
}

- (void)getPACForCred:pac:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_221304000, v0, v1, "Error parsing pac: %d", v2, v3, v4, v5, v6);
}

- (void)getPACForCred:pac:.cold.6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_221304000, v0, v1, "Error retrieving pac: %d", v2, v3, v4, v5, v6);
}

- (void)getPACForCred:pac:.cold.7()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_221304000, v0, v1, "Error decrypting ticket: %d", v2, v3, v4, v5, v6);
}

- (void)getPACForCred:pac:.cold.8()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_221304000, v0, v1, "Error decoding delegation ticket: %d", v2, v3, v4, v5, v6);
}

- (void)getPACForCred:pac:.cold.9()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_221304000, v0, v1, "Error completing delegation to self: %d", v2, v3, v4, v5, v6);
}

- (void)getPACForCred:pac:.cold.10()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_221304000, v0, v1, "Error setting second ticket: %d", v2, v3, v4, v5, v6);
}

- (void)getPACForCred:pac:.cold.11()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_221304000, v0, v1, "Error decoding ticket: %d", v2, v3, v4, v5, v6);
}

- (void)getPACForCred:pac:.cold.12()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_221304000, v0, v1, "Error allocating cred opts: %d", v2, v3, v4, v5, v6);
}

- (void)getPACForCred:pac:.cold.13()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_221304000, v0, v1, "Error retrieving TGT from cache: %d", v2, v3, v4, v5, v6);
}

- (void)getPACForCred:pac:.cold.14()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_221304000, v0, v1, "Error creating TGT principal: %d", v2, v3, v4, v5, v6);
}

- (void)getPACForCred:pac:.cold.15()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_221304000, v0, v1, "Error retrieving principal from cache: %d", v2, v3, v4, v5, v6);
}

- (void)getPACForCred:pac:.cold.16()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_221304000, v0, v1, "Error resolving cache by uuid: %d", v2, v3, v4, v5, v6);
}

- (void)getPACForCred:pac:.cold.17()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_221304000, v0, v1, "Error initializing context: %d", v2, v3, v4, v5, v6);
}

- (void)getPACForCred:pac:.cold.18()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_1(&dword_221304000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

@end