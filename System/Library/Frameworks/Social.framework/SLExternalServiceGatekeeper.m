@interface SLExternalServiceGatekeeper
- (BOOL)_gatekeepingIsNotAvailable;
- (id)initForPermissionToAccessURL:(id)a3 fromURLString:(id)a4 completion:(id)a5;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)_completeWithURLToLoad:(id)a3 error:(id)a4;
@end

@implementation SLExternalServiceGatekeeper

- (id)initForPermissionToAccessURL:(id)a3 fromURLString:(id)a4 completion:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v35.receiver = self;
  v35.super_class = (Class)SLExternalServiceGatekeeper;
  v13 = [(SLExternalServiceGatekeeper *)&v35 init];
  if (v13)
  {
    v14 = [MEMORY[0x1E4F1CB10] URLWithString:v11];
    uint64_t v15 = [v14 host];
    redirectHost = v13->_redirectHost;
    v13->_redirectHost = (NSString *)v15;

    objc_storeStrong((id *)&v13->_url, a3);
    uint64_t v17 = MEMORY[0x1C876A6A0](v12);
    id completion = v13->_completion;
    v13->_id completion = (id)v17;

    if ([(SLExternalServiceGatekeeper *)v13 _gatekeepingIsNotAvailable])
    {
      v19 = 0;
LABEL_12:
      v25 = objc_msgSend(MEMORY[0x1E4F290D0], "requestWithURL:cachePolicy:timeoutInterval:", v19, 1, 30.0, v33);
      _SLLog(v5, 7, @"SLExternalServiceGatekeeper loading modified URL: %{private}@");
      v26 = (void *)MEMORY[0x1E4F290E0];
      v27 = objc_msgSend(MEMORY[0x1E4F290F0], "ephemeralSessionConfiguration", v19);
      v28 = [MEMORY[0x1E4F28F08] mainQueue];
      v29 = [v26 sessionWithConfiguration:v27 delegate:v13 delegateQueue:v28];

      v30 = [v29 dataTaskWithRequest:v25];
      [v30 resume];

      v31 = v13;
      goto LABEL_13;
    }
    v20 = [MEMORY[0x1E4F29088] componentsWithURL:v10 resolvingAgainstBaseURL:1];
    v21 = [MEMORY[0x1E4F29088] componentsWithString:v11];
    v22 = [v20 host];
    v23 = [v20 path];
    if ([v22 length] && objc_msgSend(v23, "length"))
    {
      [NSString stringWithFormat:@"/%@%@", v22, v23];
    }
    else
    {
      if (![v22 length])
      {
        _SLLog(v5, 3, @"Failed to parse hostname from loginURL, this can't be good...");
        goto LABEL_11;
      }
      [NSString stringWithFormat:@"/%@", v22, v34];
    v24 = };
    [v21 setPath:v24];

LABEL_11:
    v19 = [v21 URL];
    v33 = v19;
    _SLLog(v5, 7, @"SLExternalServiceGatekeeper modified the URL: %{private}@");

    goto LABEL_12;
  }
LABEL_13:

  return v13;
}

- (BOOL)_gatekeepingIsNotAvailable
{
  return CFPreferencesGetAppBooleanValue(@"com.apple.social.yahoo.gatekeepingIsNotAvailable", @"com.apple.social.SLYahooAuth.SLYahooAuthService", 0) != 0;
}

- (void)_completeWithURLToLoad:(id)a3 error:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  id completion = (void (**)(id, id, id))v7->_completion;
  if (completion)
  {
    completion[2](completion, v10, v6);
    id v9 = v7->_completion;
    v7->_id completion = 0;
  }
  objc_sync_exit(v7);
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  v13 = (void (**)(id, void))a7;
  v14 = [v12 URL];
  v29 = [v14 host];
  _SLLog(v7, 7, @"SLExternalServiceGatekeeper willSendRequest called for host: %@");

  uint64_t v15 = objc_msgSend(v12, "URL", v29);
  v16 = [v15 host];
  uint64_t v17 = [(NSURL *)self->_url host];
  int v18 = [v16 isEqualToString:v17];

  if (v18)
  {
    [v11 invalidateAndCancel];
    [(SLExternalServiceGatekeeper *)self _completeWithURLToLoad:self->_url error:0];
LABEL_6:
    v13[2](v13, 0);
    goto LABEL_7;
  }
  v19 = [v12 URL];
  v20 = [v19 host];
  char v21 = [v20 isEqualToString:self->_redirectHost];

  v22 = [v12 URL];
  v23 = v22;
  if ((v21 & 1) == 0)
  {
    v31 = v22;
    _SLLog(v7, 3, @"SLExternalServiceGatekeeper continuing to load unexpected URL: %{private}@");

    v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    v25 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class(), v31, v32);
    v26 = [v25 localizedStringForKey:@"BAD_REDIRECT_ERROR_DESCRIPTION" value:&stru_1F1E28690 table:@"Localizable"];
    v33[0] = v26;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    v28 = [v24 errorWithDomain:@"SLErrorDomain" code:-2 userInfo:v27];
    [(SLExternalServiceGatekeeper *)self _completeWithURLToLoad:0 error:v28];

    goto LABEL_6;
  }
  v30 = [v22 host];
  _SLLog(v7, 7, @"SLExternalServiceGatekeeper continuing to load original URL with host: %@");

  ((void (**)(id, id))v13)[2](v13, v12);
LABEL_7:
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  v8 = (void (**)(id, void, void *))a6;
  id v9 = a5;
  _SLLog(v6, 7, @"SLExternalServiceGatekeeper received authentication challenge");
  id v10 = [v9 protectionSpace];
  uint64_t v11 = [v10 serverTrust];

  id v12 = [v9 protectionSpace];

  v13 = [v12 authenticationMethod];
  int v14 = [v13 isEqualToString:*MEMORY[0x1E4F28988]];

  if (v14)
  {
    int v20 = 0;
    if (!MEMORY[0x1C876A0B0](v11, &v20) && (v20 == 4 || v20 == 1))
    {
      uint64_t v15 = (void *)SecTrustCopyInfo();
      if (v15)
      {
        v16 = v15;
        uint64_t v17 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F3BCA8]];
        int v18 = v17;
        if (v17 && [v17 isEqualToString:@"Apple Inc."])
        {
          _SLLog(v6, 7, @"SLExternalServiceGatekeeper verified this challenge is Apple's EV SSL certificate");

          v19 = [MEMORY[0x1E4F29098] credentialForTrust:v11];
          v8[2](v8, 0, v19);

          goto LABEL_4;
        }
      }
    }
  }
  _SLLog(v6, 7, @"SLExternalServiceGatekeeper failed to identify Apple's EV certificate. Cancelling.");
  v8[2](v8, 2, 0);
LABEL_4:
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  if (self->_completion)
  {
    id v6 = a4;
    _SLLog(v4, 7, @"SLExternalServiceGatekeeper failed with error - %@");
    -[SLExternalServiceGatekeeper _completeWithURLToLoad:error:](self, "_completeWithURLToLoad:error:", 0, v6, v6);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  if (self->_completion)
  {
    id v7 = a5;
    _SLLog(v5, 7, @"SLExternalServiceGatekeeper completed with error - %@");
    -[SLExternalServiceGatekeeper _completeWithURLToLoad:error:](self, "_completeWithURLToLoad:error:", 0, v7, v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_redirectHost, 0);
}

@end