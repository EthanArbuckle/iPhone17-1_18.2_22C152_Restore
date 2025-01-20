@interface APBrokerHTTPUtilsTaskDelegate
- (APBrokerHTTPUtilsTaskDelegate)initWithLogContext:(void *)a3 sslCertificateHostName:(id)a4;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)dealloc;
@end

@implementation APBrokerHTTPUtilsTaskDelegate

- (APBrokerHTTPUtilsTaskDelegate)initWithLogContext:(void *)a3 sslCertificateHostName:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)APBrokerHTTPUtilsTaskDelegate;
  v6 = [(APBrokerHTTPUtilsTaskDelegate *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_logContext = a3;
    if (a4)
    {
      v6->_sslCertificateHostName = (NSString *)a4;
    }
    else
    {
      APSLogErrorAt();

      return 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  self->_sslCertificateHostName = 0;
  v3.receiver = self;
  v3.super_class = (Class)APBrokerHTTPUtilsTaskDelegate;
  [(APBrokerHTTPUtilsTaskDelegate *)&v3 dealloc];
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  v24[1] = *MEMORY[0x1E4F143B8];
  CFErrorRef error = 0;
  v11 = (__SecTrust *)objc_msgSend((id)objc_msgSend(a5, "protectionSpace"), "serverTrust");
  if (gLogCategory_APBrokerHTTPUtils <= 30
    && (gLogCategory_APBrokerHTTPUtils != -1 || _LogCategory_Initialize()))
  {
    logContext = self->_logContext;
    id v21 = a4;
    uint64_t v22 = objc_msgSend((id)objc_msgSend(a5, "protectionSpace"), "authenticationMethod");
    v19 = logContext;
    id v20 = a3;
    LogPrintF();
  }
  v13 = objc_msgSend((id)objc_msgSend(a5, "protectionSpace", v19, v20, v21, v22), "authenticationMethod");
  if ([v13 isEqualToString:*MEMORY[0x1E4F28988]]) {
    BOOL v14 = v11 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    SecPolicyRef SSL = SecPolicyCreateSSL(1u, (CFStringRef)self->_sslCertificateHostName);
    SecPolicyRef v16 = SSL;
    if (SSL)
    {
      v24[0] = SSL;
      SecTrustSetPolicies(v11, (CFTypeRef)[MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1]);
      if (SecTrustEvaluateWithError(v11, &error))
      {
        uint64_t v15 = [MEMORY[0x1E4F29098] credentialForTrust:v11];
        uint64_t v17 = 0;
        goto LABEL_20;
      }
      if (gLogCategory_APBrokerHTTPUtils >= 91)
      {
        (*((void (**)(id, uint64_t, void))a6 + 2))(a6, 2, 0);
LABEL_25:
        CFRelease(v16);
        goto LABEL_26;
      }
      if (gLogCategory_APBrokerHTTPUtils != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
    }
    else
    {
      APSLogErrorAt();
    }
    uint64_t v15 = 0;
    uint64_t v17 = 2;
    goto LABEL_20;
  }
  uint64_t v15 = 0;
  SecPolicyRef v16 = 0;
  uint64_t v17 = 1;
LABEL_20:
  if (gLogCategory_APBrokerHTTPUtils <= 30
    && (gLogCategory_APBrokerHTTPUtils != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, uint64_t, uint64_t))a6 + 2))(a6, v17, v15);
  if (v16) {
    goto LABEL_25;
  }
LABEL_26:
  if (error) {
    CFRelease(error);
  }
}

@end