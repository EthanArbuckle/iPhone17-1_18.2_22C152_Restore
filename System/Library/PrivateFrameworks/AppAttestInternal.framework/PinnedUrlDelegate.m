@interface PinnedUrlDelegate
- (PinnedUrlDelegate)initWithHost:(id)a3;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
@end

@implementation PinnedUrlDelegate

- (PinnedUrlDelegate)initWithHost:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PinnedUrlDelegate;
  v6 = [(PinnedUrlDelegate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->m_host, a3);
  }

  return v7;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v6 = a4;
  v7 = (void (**)(id, uint64_t, void))a5;
  if (!os_variant_allows_internal_security_policies())
  {
LABEL_7:
    v10 = [v6 protectionSpace];
    v11 = [v10 authenticationMethod];
    int v12 = [v11 isEqualToString:*MEMORY[0x263F08560]];

    if (!v12)
    {
      v7[2](v7, 1, 0);
      goto LABEL_17;
    }
    uint64_t AppleSSLPinned = SecPolicyCreateAppleSSLPinned();
    if (AppleSSLPinned)
    {
      v14 = (const void *)AppleSSLPinned;
      v15 = [v6 protectionSpace];
      v16 = (__SecTrust *)[v15 serverTrust];

      LODWORD(v15) = SecTrustSetPolicies(v16, v14);
      CFRelease(v14);
      if (!v15)
      {
        CFErrorRef error = 0;
        if (SecTrustEvaluateWithError(v16, &error))
        {
          v17 = [MEMORY[0x263F08BB8] credentialForTrust:v16];
          ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v17);

          goto LABEL_17;
        }
        v18 = _DCAALogSystem();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          -[PinnedUrlDelegate URLSession:didReceiveChallenge:completionHandler:]((uint64_t *)&error, v18);
        }
      }
    }
    v7[2](v7, 2, 0);
    goto LABEL_17;
  }
  v8 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.DeviceCheck"];
  if (![v8 BOOLForKey:@"AAADisablePinning"])
  {

    goto LABEL_7;
  }
  objc_super v9 = _DCAALogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PinnedUrlDelegate URLSession:didReceiveChallenge:completionHandler:](v9);
  }

  v7[2](v7, 1, 0);
LABEL_17:
}

- (void).cxx_destruct
{
}

- (void)URLSession:(os_log_t)log didReceiveChallenge:completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22216A000, log, OS_LOG_TYPE_DEBUG, "WARNING: pinning disabled\n", v1, 2u);
}

- (void)URLSession:(uint64_t *)a1 didReceiveChallenge:(NSObject *)a2 completionHandler:.cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_22216A000, a2, OS_LOG_TYPE_DEBUG, "Failed pinning check - (%@)\n", (uint8_t *)&v3, 0xCu);
}

@end