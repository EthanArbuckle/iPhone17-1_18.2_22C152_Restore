@interface WKNetworkSessionDelegateAllowingOnlyNonRedirectedJSON
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
@end

@implementation WKNetworkSessionDelegateAllowingOnlyNonRedirectedJSON

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  MEMORY[0x19972EAD0](&v11, objc_msgSend(a5, "MIMEType", a3, a4));
  unsigned int isSupportedJSONMIMEType = WebCore::MIMETypeRegistry::isSupportedJSONMIMEType((WebCore::MIMETypeRegistry *)&v11, v7);
  v10 = v11;
  v11 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v8);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  (*((void (**)(id, void))a6 + 2))(a6, isSupportedJSONMIMEType);
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  v8 = objc_msgSend((id)objc_msgSend(a5, "protectionSpace", a3, a4), "authenticationMethod");
  if ([v8 isEqualToString:*MEMORY[0x1E4F18CB8]]
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "protectionSpace"), "host"), "isEqualToString:", @"127.0.0.1"))
  {
    {
      v9 = (WebCore *)allowedLocalTestServerTrust(void)::serverTrust;
      if (allowedLocalTestServerTrust(void)::serverTrust)
      {
        v10 = (__SecTrust *)objc_msgSend((id)objc_msgSend(a5, "protectionSpace"), "serverTrust");
        if (WebCore::certificatesMatch(v9, v10, v11))
        {
          uint64_t v12 = objc_msgSend(MEMORY[0x1E4F18D88], "credentialForTrust:", objc_msgSend((id)objc_msgSend(a5, "protectionSpace"), "serverTrust"));
          v13 = (void (*)(id, uint64_t, uint64_t))*((void *)a6 + 2);
          id v14 = a6;
          uint64_t v15 = 0;
          goto LABEL_9;
        }
      }
    }
    else
    {
      allowedLocalTestServerTrust(void)::serverTrust = 0;
    }
  }
  v13 = (void (*)(id, uint64_t, uint64_t))*((void *)a6 + 2);
  id v14 = a6;
  uint64_t v15 = 1;
  uint64_t v12 = 0;
LABEL_9:

  v13(v14, v15, v12);
}

@end