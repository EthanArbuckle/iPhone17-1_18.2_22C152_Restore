@interface HKURLSessionCertVerificationDelegate
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
@end

@implementation HKURLSessionCertVerificationDelegate

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  v8 = (void (**)(id, uint64_t, void))a5;
  v9 = [v7 protectionSpace];
  uint64_t v10 = [v9 serverTrust];

  if (!v10)
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
      -[HKURLSessionCertVerificationDelegate URLSession:didReceiveChallenge:completionHandler:]((uint64_t)self, v16);
    }
    goto LABEL_10;
  }
  v11 = [v7 protectionSpace];
  int v12 = HKAcceptAuthenticationChallengeWithTrust((__SecTrust *)[v11 serverTrust]);

  _HKInitializeLogging();
  v13 = *MEMORY[0x263F09908];
  v14 = *MEMORY[0x263F09908];
  if (!v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[HKURLSessionCertVerificationDelegate URLSession:didReceiveChallenge:completionHandler:]((uint64_t)self, v13);
    }
LABEL_10:
    uint64_t v15 = 2;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[HKURLSessionCertVerificationDelegate URLSession:didReceiveChallenge:completionHandler:]((uint64_t)self, v13);
  }
  uint64_t v15 = 1;
LABEL_11:
  v8[2](v8, v15, 0);
}

- (void)URLSession:(uint64_t)a1 didReceiveChallenge:(NSObject *)a2 completionHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_221D38000, a2, OS_LOG_TYPE_ERROR, "%{public}@: Could not retrieve serverTrust from FHIR API connection", (uint8_t *)&v2, 0xCu);
}

- (void)URLSession:(uint64_t)a1 didReceiveChallenge:(NSObject *)a2 completionHandler:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_221D38000, a2, OS_LOG_TYPE_ERROR, "%{public}@: Failed authentication challenge for serverTrust!", (uint8_t *)&v2, 0xCu);
}

- (void)URLSession:(uint64_t)a1 didReceiveChallenge:(NSObject *)a2 completionHandler:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_221D38000, a2, OS_LOG_TYPE_DEBUG, "%{public}@: SecTrustStore verification passed for root cert from FHIR API", (uint8_t *)&v2, 0xCu);
}

@end