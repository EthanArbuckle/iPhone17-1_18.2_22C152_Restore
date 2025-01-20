@interface AAFCertificateTrustValidator
- (BOOL)_checkPinningPolicy:(id)a3 type:(unint64_t)a4;
- (BOOL)_trySSLPinning:(id)a3;
- (__SecPolicy)_policyForType:(unint64_t)a3 host:(id)a4;
- (int64_t)validateCertificateTrustWithChallenge:(id)a3 type:(unint64_t)a4;
@end

@implementation AAFCertificateTrustValidator

- (int64_t)validateCertificateTrustWithChallenge:(id)a3 type:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v6 = [a3 protectionSpace];
  v7 = [v6 authenticationMethod];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F28988]];

  v9 = _AAFLogSystem();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (!v10) {
      goto LABEL_11;
    }
    LOWORD(v16) = 0;
    v11 = "Unsupported authentication method detected, proceed with default handling.";
LABEL_9:
    v12 = v9;
    uint32_t v13 = 2;
    goto LABEL_10;
  }
  if (v10)
  {
    int v16 = 134217984;
    unint64_t v17 = a4;
    _os_log_impl(&dword_1DD937000, v9, OS_LOG_TYPE_DEFAULT, "Validating certificate trust for type %lu.", (uint8_t *)&v16, 0xCu);
  }

  if ([(AAFCertificateTrustValidator *)self _checkPinningPolicy:v6 type:a4])
  {
    v9 = _AAFLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134217984;
      unint64_t v17 = a4;
      v11 = "Certificate type %lu is trusted.";
      v12 = v9;
      uint32_t v13 = 12;
LABEL_10:
      _os_log_impl(&dword_1DD937000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, v13);
    }
LABEL_11:
    int64_t v14 = 1;
    goto LABEL_12;
  }
  if (a4 && [(AAFCertificateTrustValidator *)self _trySSLPinning:v6])
  {
    v9 = _AAFLogSystem();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    LOWORD(v16) = 0;
    v11 = "SSL Certificate is trusted.";
    goto LABEL_9;
  }
  v9 = _AAFLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    int64_t v14 = 2;
    _os_log_impl(&dword_1DD937000, v9, OS_LOG_TYPE_DEFAULT, "Server cert validity check failed!", (uint8_t *)&v16, 2u);
  }
  else
  {
    int64_t v14 = 2;
  }
LABEL_12:

  return v14;
}

- (BOOL)_checkPinningPolicy:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v7 = (__SecTrust *)[v6 serverTrust];
  int v8 = [v6 host];

  v9 = [(AAFCertificateTrustValidator *)self _policyForType:a4 host:v8];
  if (!v9)
  {
    int64_t v14 = _AAFLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[AAFCertificateTrustValidator _checkPinningPolicy:type:](v14);
    }

    goto LABEL_9;
  }
  BOOL v10 = v9;
  OSStatus v11 = SecTrustSetPolicies(v7, v9);
  if (v11)
  {
    v12 = (__CFString *)SecCopyErrorMessageString(v11, 0);
    uint32_t v13 = _AAFLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[AAFCertificateTrustValidator _checkPinningPolicy:type:]((uint64_t)v12, v13);
    }

    CFRelease(v10);
LABEL_9:
    BOOL v15 = 0;
    goto LABEL_15;
  }
  CFErrorRef error = 0;
  BOOL v15 = SecTrustEvaluateWithError(v7, &error);
  if (error)
  {
    int v16 = _AAFLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[AAFCertificateTrustValidator _checkPinningPolicy:type:]((uint64_t *)&error, v16);
    }

    CFRelease(error);
    CFErrorRef error = 0;
  }
  CFRelease(v10);
LABEL_15:

  return v15;
}

- (__SecPolicy)_policyForType:(unint64_t)a3 host:(id)a4
{
  id v6 = (__CFString *)a4;
  switch(a3)
  {
    case 0uLL:
      uint64_t SSL = (uint64_t)SecPolicyCreateSSL(1u, v6);
      goto LABEL_7;
    case 2uLL:
      uint64_t SSL = SecPolicyCreateAppleiCloudSetupService();
      goto LABEL_7;
    case 1uLL:
      uint64_t SSL = SecPolicyCreateAppleGSService();
LABEL_7:
      v4 = (__SecPolicy *)SSL;
      break;
  }

  return v4;
}

- (BOOL)_trySSLPinning:(id)a3
{
  id v4 = a3;
  if (+[AFUtilities isInternalBuild]
    && CFPreferencesGetAppBooleanValue(@"AAFDisableCertPinning", @"com.apple.AAAFoundation", 0))
  {
    v5 = _AAFLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl(&dword_1DD937000, v5, OS_LOG_TYPE_DEFAULT, "Standard pinning is diabled, falling back to SSL pinning.", v8, 2u);
    }

    BOOL v6 = [(AAFCertificateTrustValidator *)self _checkPinningPolicy:v4 type:0];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_checkPinningPolicy:(os_log_t)log type:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD937000, log, OS_LOG_TYPE_ERROR, "Error creating trust policy.", v1, 2u);
}

- (void)_checkPinningPolicy:(uint64_t *)a1 type:(NSObject *)a2 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DD937000, a2, OS_LOG_TYPE_ERROR, "Error evaluating certificate trust: %@", (uint8_t *)&v3, 0xCu);
}

- (void)_checkPinningPolicy:(uint64_t)a1 type:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DD937000, a2, OS_LOG_TYPE_ERROR, "Error setting trust policy: %@", (uint8_t *)&v2, 0xCu);
}

@end