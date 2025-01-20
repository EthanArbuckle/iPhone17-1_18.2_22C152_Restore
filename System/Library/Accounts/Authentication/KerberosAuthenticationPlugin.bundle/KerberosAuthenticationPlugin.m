void sub_240514BF8(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  BOOL v16;
  void (*v17)(void);
  void *v18;
  void *v19;
  void v20[4];
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  int v25;

  v7 = a3;
  v8 = a4;
  if (a2)
  {
    v9 = _ACDLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_24051553C();
    }

    v11 = *(void **)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v12 = *(void *)(a1 + 48);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = sub_240514DF8;
    v20[3] = &unk_2650BDA28;
    v21 = v10;
    v13 = *(id *)(a1 + 56);
    v25 = *(_DWORD *)(a1 + 64);
    v14 = *(void *)(a1 + 32);
    v24 = v13;
    v22 = v14;
    v23 = *(id *)(a1 + 48);
    [v11 _authenticateAccount:v21 password:v7 certificate:0 client:v12 completion:v20];
  }
  else
  {
    v15 = _ACDLogSystem();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v16) {
        sub_2405155A4((uint64_t)v8, v15);
      }

      v17 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    else
    {
      if (v16) {
        sub_240515570();
      }

      v18 = (void *)MEMORY[0x263F087E8];
      v19 = [NSDictionary dictionaryWithObject:@"User canceled password prompt" forKey:*MEMORY[0x263F08320]];
      v8 = [v18 errorWithDomain:@"KerberosAuthenticationPlugin" code:0 userInfo:v19];

      v17 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    v17();
  }
}

void sub_240514DF8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    v10 = _ACDLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_24051561C();
    }

    v11 = [*(id *)(a1 + 32) credential];
    [v11 setToken:v5];

    v12 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_12;
  }
  unsigned int v7 = *(_DWORD *)(a1 + 64);
  v8 = _ACDLogSystem();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7 < 2)
  {
    if (v9) {
      sub_240515684();
    }

    v12 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_12:
    v12();
    goto LABEL_13;
  }
  if (v9) {
    sub_240515650();
  }

  [*(id *)(a1 + 40) _promptForPasswordAndAuthenticateAccount:*(void *)(a1 + 32) authAttemptsRemaining:(*(_DWORD *)(a1 + 64) - 1) client:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
LABEL_13:
}

void sub_240514FF8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned int v7 = _ACDLogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8) {
      sub_2405156B8();
    }

    BOOL v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (v8) {
      sub_24051561C();
    }

    v10 = [*(id *)(a1 + 32) credential];
    [v10 setToken:v5];

    BOOL v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
}

void sub_2405152DC(uint64_t a1)
{
  v2 = _ACDLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_2405156EC(a1, v2);
  }

  v3 = [*(id *)(a1 + 32) accountPropertyForKey:@"kGSSICCertificate"];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = [*(id *)(a1 + 48) client];
  uint64_t v7 = *(void *)(a1 + 56);
  if (v3) {
    [v5 _useCertificate:v3 toAuthenticateAccount:v4 client:v6 withCompletion:v7];
  }
  else {
    [v5 _promptForPasswordAndAuthenticateAccount:v4 authAttemptsRemaining:3 client:v6 completion:v7];
  }
}

uint64_t sub_24051539C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2405153AC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_2405153D4()
{
  sub_2405153C8();
  sub_2405153AC(&dword_240513000, v0, v1, "\"KerberosAuthenticationPlugin credentialForAccount:client:error:\"", v2, v3, v4, v5, v6);
}

void sub_240515408()
{
  sub_2405153C8();
  _os_log_error_impl(&dword_240513000, v0, OS_LOG_TYPE_ERROR, "\"KerberosAuthenticationPlugin -verifyCredentialsForAccount:store:completion: is not implemented.\"", v1, 2u);
}

void sub_240515448(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_240513000, a2, OS_LOG_TYPE_ERROR, "\"gss_aapl_initial_cred failed: %@\"", (uint8_t *)&v3, 0xCu);
}

void sub_2405154C4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_240513000, a2, OS_LOG_TYPE_DEBUG, "\"passing kGSSICAppIdentifierACL %@\"", (uint8_t *)&v2, 0xCu);
}

void sub_24051553C()
{
  sub_2405153C8();
  sub_2405153AC(&dword_240513000, v0, v1, "\"Kerberos auth plugin: User entered password. Trying to authenticate...\"", v2, v3, v4, v5, v6);
}

void sub_240515570()
{
  sub_2405153C8();
  sub_2405153AC(&dword_240513000, v0, v1, "\"Kerberos auth plugin: User cancelled.\"", v2, v3, v4, v5, v6);
}

void sub_2405155A4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_240513000, a2, OS_LOG_TYPE_DEBUG, "\"Kerberos auth plugin got error %@\"", (uint8_t *)&v2, 0xCu);
}

void sub_24051561C()
{
  sub_2405153C8();
  sub_2405153AC(&dword_240513000, v0, v1, "\"Kerberos authentication succeeded. Saving token.\"", v2, v3, v4, v5, v6);
}

void sub_240515650()
{
  sub_2405153C8();
  sub_2405153AC(&dword_240513000, v0, v1, "\"Kerberos authentication failed. Prompting the user again.\"", v2, v3, v4, v5, v6);
}

void sub_240515684()
{
  sub_2405153C8();
  sub_2405153AC(&dword_240513000, v0, v1, "\"Kerberos authentication failed. No more retries remaining. Sorry!\"", v2, v3, v4, v5, v6);
}

void sub_2405156B8()
{
  sub_2405153C8();
  sub_2405153AC(&dword_240513000, v0, v1, "\"Kerberos authentication failed.\"", v2, v3, v4, v5, v6);
}

void sub_2405156EC(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*(id *)(a1 + 32) username];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_240513000, a2, OS_LOG_TYPE_DEBUG, "\"Renewing Kerberos credentials for account %@\"", (uint8_t *)&v4, 0xCu);
}

void CFRelease(CFTypeRef cf)
{
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x270EE5470](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x270EE5488](alloc, uuid);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

CFStringRef CFUserNotificationGetResponseValue(CFUserNotificationRef userNotification, CFStringRef key, CFIndex idx)
{
  return (CFStringRef)MEMORY[0x270EE54F0](userNotification, key, idx);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x270EE5500](userNotification, responseFlags, timeout);
}

gss_name_t GSSCreateName(CFTypeRef name, gss_const_OID name_type, CFErrorRef *error)
{
  return (gss_name_t)MEMORY[0x270EF2CD8](name, name_type, error);
}

CFUUIDRef GSSCredentialCopyUUID(gss_cred_id_t credential)
{
  return (CFUUIDRef)MEMORY[0x270EF2CE8](credential);
}

uint64_t _ACDLogSystem()
{
  return MEMORY[0x270F0A578]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

OM_uint32 gss_aapl_initial_cred(gss_name_t desired_name, gss_const_OID desired_mech, CFDictionaryRef attributes, gss_cred_id_t *output_cred_handle, CFErrorRef *error)
{
  return MEMORY[0x270EF2D28](desired_name, desired_mech, attributes, output_cred_handle, error);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

v43 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  error = 0;
  if (gss_aapl_initial_cred(desired_name, MEMORY[0x263F08E18], v43, &output_cred_handle, &error))
  {
    v44 = _ACDLogSystem();
    v13 = v49;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_240515448((uint64_t *)&error, v44);
    }

    v45 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:3 userInfo:0];
    v49[2](v49, 0, v45);
  }
  else
  {
    v46 = GSSCredentialCopyUUID(output_cred_handle);
    CFRelease(output_cred_handle);
    v13 = v49;
    if (v46)
    {
      v47 = CFUUIDCreateString(0, v46);

      CFRelease(v46);
      ((void (**)(id, CFStringRef, void *))v49)[2](v49, v47, 0);
      v45 = 0;
      v50 = (void *)v47;
    }
    else
    {
      v45 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:3 userInfo:0];
      v49[2](v49, 0, v45);
    }
  }
  v12 = v52;

LABEL_32:
}

- (void)_promptForPasswordAndAuthenticateAccount:(id)a3 authAttemptsRemaining:(unsigned int)a4 client:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_240514BF8;
  v16[3] = &unk_2650BDA50;
  v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  unsigned int v20 = a4;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [(KerberosAuthenticationPlugin *)self _presentAuthenticationDialogForAccount:v15 completion:v16];
}

- (void)_useCertificate:(id)a3 toAuthenticateAccount:(id)a4 client:(id)a5 withCompletion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_240514FF8;
  v14[3] = &unk_2650BDA78;
  id v15 = v10;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  [(KerberosAuthenticationPlugin *)self _authenticateAccount:v13 password:0 certificate:a3 client:a5 completion:v14];
}

- (void)renewCredentialsForAccount:(id)a3 accountStore:(id)a4 reason:(id)a5 completion:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_2405152DC;
  v20[3] = &unk_2650BDAA0;
  id v12 = v9;
  id v21 = v12;
  v22 = self;
  id v13 = v10;
  id v23 = v13;
  id v14 = v11;
  id v24 = v14;
  id v15 = (void (**)(void))MEMORY[0x2455E9E80](v20);
  if ([v12 isAuthenticated])
  {
    id v16 = _ACDLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v12 identifier];
      *(_DWORD *)buf = 138412290;
      v26 = v17;
      _os_log_impl(&dword_240513000, v16, OS_LOG_TYPE_DEFAULT, "\"Kerberos plugin marking account with identifier %@ as un-authenticated\"", buf, 0xCu);
    }
    [v12 setAuthenticated:0];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = sub_24051539C;
    v18[3] = &unk_2650BDAC8;
    id v19 = v15;
    [v13 saveAccount:v12 withHandler:v18];
  }
  else
  {
    v15[2](v15);
  }
}

@end