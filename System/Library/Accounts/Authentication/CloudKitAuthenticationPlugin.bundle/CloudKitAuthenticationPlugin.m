void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x270ED8080](dso, log, type, format, buf, *(void *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

RY[0x263EFB2B0]] & 1) == 0
    && ([v9 hasEntitlement:*MEMORY[0x263EFB2B8]] & 1) == 0)
  {
    if (*MEMORY[0x263EFD8B8] != -1) {
      dispatch_once(MEMORY[0x263EFD8B8], (dispatch_block_t)*MEMORY[0x263EFD8B0]);
    }
    v20 = *MEMORY[0x263EFD8A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263EFD8A8], OS_LOG_TYPE_INFO))
    {
      v22 = 138412290;
      v23 = v9;
      _os_log_impl(&dword_2404F6000, v20, OS_LOG_TYPE_INFO, "Cannot return the CloudKit app token, since %@ is a non-entitled client.", (uint8_t *)&v22, 0xCu);
    }
    goto LABEL_15;
  }
  if (![(CloudKitAuthenticationPlugin *)self _accountAccessIsAllowedForAccount:v8 client:v9])
  {
LABEL_15:
    v19 = 0;
    goto LABEL_16;
  }
  v10 = (void *)MEMORY[0x263F25898];
  v11 = [v8 parentAccount];
  v12 = [v11 username];
  v13 = [v10 passwordForServiceName:@"com.apple.appleaccount.cloudkit.token" username:v12 accessGroup:@"appleaccount"];

  if (v13)
  {
    if (*MEMORY[0x263EFD8B8] != -1) {
      dispatch_once(MEMORY[0x263EFD8B8], (dispatch_block_t)*MEMORY[0x263EFD8B0]);
    }
    v14 = *MEMORY[0x263EFD8A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263EFD8A8], OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_2404F6000, v14, OS_LOG_TYPE_INFO, "Found stashed cloudKitToken.", (uint8_t *)&v22, 2u);
    }
    v15 = objc_alloc_init(MEMORY[0x263EFB200]);
    [v15 setToken:v13];
    [v8 setCredential:v15];
    [MEMORY[0x263F230F0] setCredentialForAccount:v8 error:0];
    v16 = (void *)MEMORY[0x263F25898];
    v17 = [v8 parentAccount];
    v18 = [v17 username];
    [v16 removePasswordForService:@"com.apple.appleaccount.cloudkit.token" username:v18 accessGroup:@"appleaccount"];
  }
  v19 = [MEMORY[0x263F230F0] credentialForAccount:v8 clientID:0 error:0];

LABEL_16:
  return v19;
}

- (BOOL)_accountAccessIsAllowedForAccount:(id)a3 client:(id)a4
{
  v4 = [a3 parentAccount];
  v5 = v4;
  if (v4)
  {
    if (!objc_msgSend(v4, "aa_isSuspended"))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
    if (*MEMORY[0x263EFD8B8] != -1) {
      dispatch_once(MEMORY[0x263EFD8B8], (dispatch_block_t)*MEMORY[0x263EFD8B0]);
    }
    v6 = *MEMORY[0x263EFD8A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263EFD8A8], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_2404F6000, v6, OS_LOG_TYPE_INFO, "Cannot return the CloudKit app token, since you need to verify your iCloud T&Cs or your account is in suspended mode.", v10, 2u);
    }
  }
  else
  {
    if (*MEMORY[0x263EFD8B8] != -1) {
      dispatch_once(MEMORY[0x263EFD8B8], (dispatch_block_t)*MEMORY[0x263EFD8B0]);
    }
    v7 = *MEMORY[0x263EFD8A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263EFD8A8], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2404F6000, v7, OS_LOG_TYPE_ERROR, "CloudKit account has no parent!", buf, 2u);
    }
  }
  BOOL v8 = 0;
LABEL_13:

  return v8;
}

+ (BOOL)supportsAccountType:(id)a3
{
  v3 = [a3 identifier];
  char v4 = [v3 isEqualToString:*MEMORY[0x263EFAEA0]];

  return v4;
}

- (void)verifyCredentialsForAccount:(id)a3 accountStore:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (*MEMORY[0x263EFD8B8] != -1) {
    dispatch_once(MEMORY[0x263EFD8B8], (dispatch_block_t)*MEMORY[0x263EFD8B0]);
  }
  v10 = *MEMORY[0x263EFD8A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263EFD8A8], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v11 = 0;
    _os_log_error_impl(&dword_2404F6000, v10, OS_LOG_TYPE_ERROR, "verifyCredentialsForAccount: is not supported for CloudKit Accounts", v11, 2u);
  }
  (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
}

- (void)renewCredentialsForAccount:(id)a3 accountStore:(id)a4 reason:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, uint64_t, void *))a6;
  if (*MEMORY[0x263EFD8B8] != -1) {
    dispatch_once(MEMORY[0x263EFD8B8], (dispatch_block_t)*MEMORY[0x263EFD8B0]);
  }
  v13 = *MEMORY[0x263EFD8A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263EFD8A8], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v15 = 0;
    _os_log_error_impl(&dword_2404F6000, v13, OS_LOG_TYPE_ERROR, "renewCredentialsForAccount: is not supported for CloudKit Accounts", v15, 2u);
  }
  v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:4 userInfo:0];
  v12[2](v12, 2, v14);
}

@end