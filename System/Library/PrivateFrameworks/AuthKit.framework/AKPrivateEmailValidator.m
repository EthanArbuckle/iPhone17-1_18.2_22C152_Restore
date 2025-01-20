@interface AKPrivateEmailValidator
+ (BOOL)canPerformRequestWithAccount:(id)a3 error:(id *)a4;
@end

@implementation AKPrivateEmailValidator

+ (BOOL)canPerformRequestWithAccount:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[AKAccountManager sharedInstance];
  if ([v6 securityLevelForAccount:v5] != 4)
  {
    v11 = _AKLogHme();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[AKPrivateEmailValidator canPerformRequestWithAccount:error:](v11);
    }

    if (a4)
    {
      v12 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7070);
LABEL_15:
      BOOL v10 = 0;
      *a4 = v12;
      goto LABEL_17;
    }
LABEL_16:
    BOOL v10 = 0;
    goto LABEL_17;
  }
  v7 = [v6 reachableEmailAddressesForAccount:v5];
  uint64_t v8 = [v7 count];

  if ([v6 phoneAsAppleIDForAccount:v5]) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    v13 = _AKLogHme();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[AKPrivateEmailValidator canPerformRequestWithAccount:error:](v13);
    }

    if (a4)
    {
      v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKPrivateEmailError" code:-11007 userInfo:0];
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  BOOL v10 = 1;
LABEL_17:

  return v10;
}

+ (void)canPerformRequestWithAccount:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "Cannot perform HME request - Phone as AppleID Account without reachable emails", v1, 2u);
}

+ (void)canPerformRequestWithAccount:(os_log_t)log error:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "Cannot perform HME request - Insufficient security level", v1, 2u);
}

@end