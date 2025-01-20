@interface AACertificatePinner
+ (AACertificatePinner)sharedPinner;
+ (BOOL)isSetupServiceHost:(id)a3;
+ (BOOL)isValidCertificateTrust:(__SecTrust *)a3;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)connection:(id)a3 willSendRequestForAuthenticationChallenge:(id)a4;
@end

@implementation AACertificatePinner

+ (AACertificatePinner)sharedPinner
{
  if (sharedPinner_onceToken != -1) {
    dispatch_once(&sharedPinner_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedPinner_sharedPinner;

  return (AACertificatePinner *)v2;
}

uint64_t __35__AACertificatePinner_sharedPinner__block_invoke()
{
  sharedPinner_sharedPinner = objc_alloc_init(AACertificatePinner);

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)isSetupServiceHost:(id)a3
{
  id v3 = a3;
  BOOL v4 = ([v3 isEqualToString:@"setup.icloud.com"] & 1) != 0
    || [v3 rangeOfString:@"^p\\d{2}-setup\\.icloud\\.com\\z" options:1024] != 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

+ (BOOL)isValidCertificateTrust:(__SecTrust *)a3
{
  if (!a3)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"AACertificatePinner.m", 40, @"Invalid parameter not satisfying: %@", @"trustRef" object file lineNumber description];
  }
  if (SecTrustSetPinningPolicyName()) {
    return 0;
  }
  int v9 = 0;
  if (MEMORY[0x1A622EE40](a3, &v9)) {
    return 0;
  }
  return v9 == 4 || v9 == 1;
}

- (void)connection:(id)a3 willSendRequestForAuthenticationChallenge:(id)a4
{
  id v4 = a4;
  v5 = [v4 protectionSpace];
  v6 = [v5 authenticationMethod];
  char v7 = [v6 isEqualToString:*MEMORY[0x1E4F18CB8]];

  if ((v7 & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v8 = objc_opt_class();
  int v9 = [v4 protectionSpace];
  v10 = [v9 host];
  LOBYTE(v8) = [(id)v8 isSetupServiceHost:v10];

  if ((v8 & 1) == 0)
  {
LABEL_6:
    v13 = [v4 sender];
    [v13 performDefaultHandlingForAuthenticationChallenge:v4];
    goto LABEL_7;
  }
  v11 = [v4 protectionSpace];
  uint64_t v12 = [v11 serverTrust];

  if (!v12)
  {
    v15 = _AALogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[AACertificatePinner(NSURLUtilities) connection:willSendRequestForAuthenticationChallenge:]();
    }
    goto LABEL_12;
  }
  if (([(id)objc_opt_class() isValidCertificateTrust:v12] & 1) == 0)
  {
    v15 = _AALogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[AACertificatePinner(NSURLUtilities) connection:willSendRequestForAuthenticationChallenge:]();
    }
LABEL_12:

    v13 = [v4 sender];
    [v13 cancelAuthenticationChallenge:v4];
    goto LABEL_7;
  }
  v13 = [v4 sender];
  v14 = [MEMORY[0x1E4F18D88] credentialForTrust:v12];
  [v13 useCredential:v14 forAuthenticationChallenge:v4];

LABEL_7:
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v6 = a4;
  char v7 = (void (**)(id, uint64_t, void))a5;
  uint64_t v8 = [v6 protectionSpace];
  int v9 = [v8 authenticationMethod];
  char v10 = [v9 isEqualToString:*MEMORY[0x1E4F18CB8]];

  if ((v10 & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = [v6 protectionSpace];
  v13 = [v12 host];
  LOBYTE(v11) = [(id)v11 isSetupServiceHost:v13];

  if ((v11 & 1) == 0)
  {
LABEL_6:
    v7[2](v7, 1, 0);
    goto LABEL_7;
  }
  v14 = [v6 protectionSpace];
  uint64_t v15 = [v14 serverTrust];

  if (!v15)
  {
    v17 = _AALogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[AACertificatePinner(NSURLUtilities) connection:willSendRequestForAuthenticationChallenge:]();
    }
    goto LABEL_12;
  }
  if (([(id)objc_opt_class() isValidCertificateTrust:v15] & 1) == 0)
  {
    v17 = _AALogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[AACertificatePinner(NSURLUtilities) connection:willSendRequestForAuthenticationChallenge:]();
    }
LABEL_12:

    v7[2](v7, 2, 0);
    goto LABEL_7;
  }
  v16 = [MEMORY[0x1E4F18D88] credentialForTrust:v15];
  ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v16);

LABEL_7:
}

@end