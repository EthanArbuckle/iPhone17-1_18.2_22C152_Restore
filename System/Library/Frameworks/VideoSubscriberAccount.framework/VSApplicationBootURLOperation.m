@interface VSApplicationBootURLOperation
- (BOOL)isDeveloper;
- (BOOL)isForTesting;
- (BOOL)skipSystemTrustVerification;
- (BOOL)validateTrust:(__SecTrust *)a3;
- (BOOL)verifyCertificateIsSystemTrustedWithTrust:(__SecTrust *)a3;
- (NSDictionary)trustInfo;
- (NSURL)url;
- (VSApplicationBootURLOperation)init;
- (VSApplicationBootURLOperation)initWithBootURL:(id)a3 isDeveloper:(BOOL)a4;
- (VSFailable)urlOrError;
- (VSPreferences)preferences;
- (id)generateFilePathForURL:(id)a3;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)executionDidBegin;
- (void)setDeveloper:(BOOL)a3;
- (void)setPreferences:(id)a3;
- (void)setSkipSystemTrustVerification:(BOOL)a3;
- (void)setTest:(BOOL)a3;
- (void)setTrustInfo:(id)a3;
- (void)setUrl:(id)a3;
- (void)setUrlOrError:(id)a3;
@end

@implementation VSApplicationBootURLOperation

- (VSApplicationBootURLOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VSApplicationBootURLOperation)initWithBootURL:(id)a3 isDeveloper:(BOOL)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VSApplicationBootURLOperation;
  v8 = [(VSApplicationBootURLOperation *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_url, a3);
    v9->_developer = a4;
    v10 = objc_alloc_init(VSPreferences);
    preferences = v9->_preferences;
    v9->_preferences = v10;
  }
  return v9;
}

- (void)executionDidBegin
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v3 = [(VSApplicationBootURLOperation *)self url];
  uint64_t v4 = [v3 scheme];
  if ([(VSApplicationBootURLOperation *)self isForTesting])
  {
    int v5 = 0;
  }
  else
  {
    v6 = [(VSApplicationBootURLOperation *)self preferences];
    int v5 = [v6 allowInsecureAuthContext];
  }
  if ([(VSApplicationBootURLOperation *)self isDeveloper])
  {
    id v7 = VSDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1DA674000, v7, OS_LOG_TYPE_DEFAULT, "URL is for a developer added provider, skipping system trust verification.", (uint8_t *)&buf, 2u);
    }
LABEL_7:

    v8 = +[VSFailable failableWithObject:v3];
    [(VSApplicationBootURLOperation *)self setUrlOrError:v8];

    [(VSAsyncOperation *)self finishExecutionIfPossible];
    goto LABEL_19;
  }
  if ([(VSApplicationBootURLOperation *)self skipSystemTrustVerification])
  {
    id v7 = VSDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1DA674000, v7, OS_LOG_TYPE_DEFAULT, "System trust is set to be skipped, skipping system trust verification.", (uint8_t *)&buf, 2u);
    }
    goto LABEL_7;
  }
  if (v4
    && (([v4 isEqual:*MEMORY[0x1E4F289E0]] & 1) != 0
     || (([v4 isEqualToString:@"https"] | v5) & 1) != 0))
  {
    id v9 = objc_alloc(MEMORY[0x1E4F28E88]);
    v10 = [(VSApplicationBootURLOperation *)self url];
    v11 = (void *)[v9 initWithURL:v10];

    [v11 _setNonAppInitiated:1];
    v12 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
    if ([(VSApplicationBootURLOperation *)self isForTesting]) {
      [v12 setRequestCachePolicy:1];
    }
    objc_super v13 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v12 delegate:self delegateQueue:0];
    objc_initWeak(&buf, self);
    v14 = [(VSApplicationBootURLOperation *)self url];
    objc_initWeak(&location, v14);

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __50__VSApplicationBootURLOperation_executionDidBegin__block_invoke;
    v21[3] = &unk_1E6BD46F0;
    objc_copyWeak(&v22, &buf);
    objc_copyWeak(&v23, &location);
    v15 = [v13 dataTaskWithRequest:v11 completionHandler:v21];
    [v15 resume];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    objc_destroyWeak(&buf);
  }
  else
  {
    v16 = objc_msgSend(MEMORY[0x1E4F28B50], "vs_frameworkBundle");
    v17 = [v16 localizedStringForKey:@"URL_BAD_SCHEME_ERROR_DESCRIPTION" value:0 table:0];

    uint64_t v26 = *MEMORY[0x1E4F28568];
    v27[0] = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VSErrorDomain" code:0 userInfo:v18];
    v20 = +[VSFailable failableWithError:v19];
    [(VSApplicationBootURLOperation *)self setUrlOrError:v20];

    [(VSAsyncOperation *)self finishExecutionIfPossible];
  }
LABEL_19:
}

void __50__VSApplicationBootURLOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v7)
  {
    v10 = VSErrorLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __50__VSApplicationBootURLOperation_executionDidBegin__block_invoke_cold_4(v9, (uint64_t)v7, v10);
    }

    id v11 = v7;
    if ([v11 code] == -999)
    {
      v12 = objc_msgSend(MEMORY[0x1E4F28B50], "vs_frameworkBundle");
      objc_super v13 = [v12 localizedStringForKey:@"SYSTEM_TRUST_VERIFICATION_ERROR_DESCRIPTION" value:0 table:0];

      uint64_t v30 = *MEMORY[0x1E4F28568];
      v31[0] = v13;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
      v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VSErrorDomain" code:6 userInfo:v14];
      v16 = +[VSFailable failableWithError:v15];
      [WeakRetained setUrlOrError:v16];

LABEL_29:
LABEL_30:

      goto LABEL_31;
    }
LABEL_28:
    objc_super v13 = +[VSFailable failableWithError:v11];
    [WeakRetained setUrlOrError:v13];
    goto LABEL_29;
  }
  if (v6)
  {
    if ([WeakRetained isForTesting])
    {
      v17 = VSDefaultLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_1DA674000, v17, OS_LOG_TYPE_DEFAULT, "Boot URL fetched for testing or EV was skipped, skipping storage.", buf, 2u);
      }

      id v11 = +[VSFailable failableWithObject:v9];
      [WeakRetained setUrlOrError:v11];
      goto LABEL_30;
    }
    id v19 = v6;
    v20 = [WeakRetained generateFilePathForURL:v9];
    if (v20)
    {
      id v27 = 0;
      [v19 writeToFile:v20 options:0 error:&v27];
      id v11 = v27;
      if (v11)
      {
        v21 = VSErrorLogObject();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          __50__VSApplicationBootURLOperation_executionDidBegin__block_invoke_cold_3();
        }

        id v22 = v11;
      }
      else
      {
        v24 = VSDefaultLogObject();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id buf = 138412290;
          v29 = v20;
          _os_log_impl(&dword_1DA674000, v24, OS_LOG_TYPE_DEFAULT, "Wrote boot URL contents to %@", buf, 0xCu);
        }

        v25 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v20];
        uint64_t v26 = +[VSFailable failableWithObject:v25];
        [WeakRetained setUrlOrError:v26];
      }
    }
    else
    {
      id v23 = VSErrorLogObject();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        __50__VSApplicationBootURLOperation_executionDidBegin__block_invoke_cold_2();
      }

      id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VSErrorDomain" code:2 userInfo:0];
    }

    if (v11) {
      goto LABEL_28;
    }
  }
  else
  {
    v18 = VSErrorLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __50__VSApplicationBootURLOperation_executionDidBegin__block_invoke_cold_1(v9, v18);
    }

    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VSErrorDomain" code:1 userInfo:0];
    if (v11) {
      goto LABEL_28;
    }
  }
LABEL_31:
  [WeakRetained finishExecutionIfPossible];
}

- (id)generateFilePathForURL:(id)a3
{
  void v27[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = NSTemporaryDirectory();
  int v5 = (void *)v4;
  if (!v4)
  {
    id v9 = VSErrorLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[VSApplicationBootURLOperation generateFilePathForURL:]();
    }
    goto LABEL_12;
  }
  id v6 = (void *)MEMORY[0x1E4F1CB10];
  v27[0] = v4;
  v27[1] = @"com.apple.VideoSubscriberAccount";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  v8 = [v6 fileURLWithPathComponents:v7];
  id v9 = [v8 path];

  if (!v9)
  {
    v14 = VSErrorLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[VSApplicationBootURLOperation generateFilePathForURL:]();
    }

LABEL_12:
    v15 = 0;
    goto LABEL_20;
  }
  id v9 = v9;
  v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v25 = 0;
  [v10 createDirectoryAtPath:v9 withIntermediateDirectories:0 attributes:0 error:&v25];
  id v11 = v25;

  if (v11)
  {
    v12 = [v11 domain];
    if ([v12 isEqual:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v13 = [v11 code];

      if (v13 == 516) {
        goto LABEL_17;
      }
    }
    else
    {
    }
    v16 = VSErrorLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[VSApplicationBootURLOperation generateFilePathForURL:]((uint64_t)v11, v16);
    }
  }
LABEL_17:
  v17 = [v3 absoluteString];

  if (!v17) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [url absoluteString] parameter must not be nil."];
  }
  v18 = [v3 absoluteString];
  id v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "hash"));
  v20 = [v19 stringValue];

  v21 = (void *)MEMORY[0x1E4F1CB10];
  v26[0] = v5;
  v26[1] = @"com.apple.VideoSubscriberAccount";
  v26[2] = v20;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
  id v23 = [v21 fileURLWithPathComponents:v22];
  v15 = [v23 path];

LABEL_20:

  return v15;
}

- (BOOL)validateTrust:(__SecTrust *)a3
{
  CFErrorRef error = 0;
  BOOL v3 = SecTrustEvaluateWithError(a3, &error);
  if (!v3)
  {
    uint64_t v4 = VSErrorLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[VSApplicationBootURLOperation validateTrust:]((uint64_t *)&error, v4);
    }
  }
  return v3;
}

- (BOOL)verifyCertificateIsSystemTrustedWithTrust:(__SecTrust *)a3
{
  int v5 = [(VSApplicationBootURLOperation *)self preferences];
  int v6 = [v5 allowNonSystemTrust];

  if (!v6)
  {
    if (a3)
    {
      if ([(VSApplicationBootURLOperation *)self validateTrust:a3])
      {
        CFArrayRef v9 = SecTrustCopyCertificateChain(a3);
        id v7 = v9;
        if (v9)
        {
          if ([(__CFArray *)v9 lastObject])
          {
            BOOL v8 = 1;
            SecTrustStoreForDomain();
            if (SecTrustStoreContains()) {
              goto LABEL_22;
            }
            v10 = VSErrorLogObject();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
              -[VSApplicationBootURLOperation verifyCertificateIsSystemTrustedWithTrust:].cold.4();
            }
          }
          else
          {
            v10 = VSErrorLogObject();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
              -[VSApplicationBootURLOperation verifyCertificateIsSystemTrustedWithTrust:]();
            }
          }
        }
        else
        {
          v10 = VSErrorLogObject();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            -[VSApplicationBootURLOperation verifyCertificateIsSystemTrustedWithTrust:]();
          }
        }
      }
      else
      {
        id v7 = VSErrorLogObject();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[VSApplicationBootURLOperation verifyCertificateIsSystemTrustedWithTrust:].cold.5();
        }
      }
    }
    else
    {
      id v7 = VSErrorLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[VSApplicationBootURLOperation verifyCertificateIsSystemTrustedWithTrust:]();
      }
    }
    BOOL v8 = 0;
    goto LABEL_22;
  }
  id v7 = VSDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1DA674000, v7, OS_LOG_TYPE_DEFAULT, "Skipping system trust requirement due to default override.", v12, 2u);
  }
  BOOL v8 = 1;
LABEL_22:

  return v8;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7 = (void (**)(id, uint64_t, void *))a5;
  BOOL v8 = [a4 protectionSpace];
  uint64_t v9 = [v8 serverTrust];
  v10 = (void *)SecTrustCopyInfo();
  [(VSApplicationBootURLOperation *)self setTrustInfo:v10];
  id v11 = [v8 authenticationMethod];
  int v12 = [v11 isEqualToString:*MEMORY[0x1E4F28988]];

  if (v12)
  {
    if ([(VSApplicationBootURLOperation *)self verifyCertificateIsSystemTrustedWithTrust:v9])
    {
      uint64_t v13 = VSDefaultLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_1DA674000, v13, OS_LOG_TYPE_DEFAULT, "System trust verified.", buf, 2u);
      }

      v14 = objc_msgSend(MEMORY[0x1E4F29098], "credentialForTrust:", objc_msgSend(v8, "serverTrust"));
      uint64_t v15 = 0;
    }
    else
    {
      v17 = VSErrorLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[VSApplicationBootURLOperation URLSession:didReceiveChallenge:completionHandler:]();
      }

      v14 = 0;
      uint64_t v15 = 2;
    }
  }
  else
  {
    v16 = VSDefaultLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1DA674000, v16, OS_LOG_TYPE_DEFAULT, "Challenge was not server trust.", v18, 2u);
    }

    v14 = 0;
    uint64_t v15 = 1;
  }
  v7[2](v7, v15, v14);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (BOOL)isDeveloper
{
  return self->_developer;
}

- (void)setDeveloper:(BOOL)a3
{
  self->_developer = a3;
}

- (VSFailable)urlOrError
{
  return self->_urlOrError;
}

- (void)setUrlOrError:(id)a3
{
}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (BOOL)isForTesting
{
  return self->_test;
}

- (void)setTest:(BOOL)a3
{
  self->_test = a3;
}

- (BOOL)skipSystemTrustVerification
{
  return self->_skipSystemTrustVerification;
}

- (void)setSkipSystemTrustVerification:(BOOL)a3
{
  self->_skipSystemTrustVerification = a3;
}

- (NSDictionary)trustInfo
{
  return self->_trustInfo;
}

- (void)setTrustInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustInfo, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_urlOrError, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

void __50__VSApplicationBootURLOperation_executionDidBegin__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [a1 absoluteString];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Request to application boot URL %@ returned no contents.", (uint8_t *)&v4, 0xCu);
}

void __50__VSApplicationBootURLOperation_executionDidBegin__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA674000, v0, v1, "Error generating new temporary file path", v2, v3, v4, v5, v6);
}

void __50__VSApplicationBootURLOperation_executionDidBegin__block_invoke_cold_3()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1DA674000, v1, OS_LOG_TYPE_ERROR, "Error writing boot URL contents to %@: %@", v2, 0x16u);
}

void __50__VSApplicationBootURLOperation_executionDidBegin__block_invoke_cold_4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 absoluteString];
  OUTLINED_FUNCTION_2_1();
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1DA674000, a3, OS_LOG_TYPE_ERROR, "Error fetching application boot URL contents from %@: %@", v6, 0x16u);
}

- (void)generateFilePathForURL:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA674000, v0, v1, "Default temporary directory was nil", v2, v3, v4, v5, v6);
}

- (void)generateFilePathForURL:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA674000, v0, v1, "Temporary subdirectory was nil", v2, v3, v4, v5, v6);
}

- (void)generateFilePathForURL:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Error creating temporary directory: %@", (uint8_t *)&v2, 0xCu);
}

- (void)validateTrust:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Error validating certificate trust: %@", (uint8_t *)&v3, 0xCu);
}

- (void)verifyCertificateIsSystemTrustedWithTrust:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA674000, v0, v1, "Invalid trust provided for system trust verification.", v2, v3, v4, v5, v6);
}

- (void)verifyCertificateIsSystemTrustedWithTrust:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA674000, v0, v1, "No certificate chain, failing system trust validation.", v2, v3, v4, v5, v6);
}

- (void)verifyCertificateIsSystemTrustedWithTrust:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA674000, v0, v1, "No root certificate, failing system trust validation.", v2, v3, v4, v5, v6);
}

- (void)verifyCertificateIsSystemTrustedWithTrust:.cold.4()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA674000, v0, v1, "Root certificate is not system trusted, failing validation.", v2, v3, v4, v5, v6);
}

- (void)verifyCertificateIsSystemTrustedWithTrust:.cold.5()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA674000, v0, v1, "Certificate is not trusted.", v2, v3, v4, v5, v6);
}

- (void)URLSession:didReceiveChallenge:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA674000, v0, v1, "System trust verification failed.", v2, v3, v4, v5, v6);
}

@end