@interface BrandedCallingSessionDelegate
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)setPublicKeyHash:(id)a3;
@end

@implementation BrandedCallingSessionDelegate

- (void)setPublicKeyHash:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[objc_alloc((Class)NSString) initWithString:v6];
  fPublicKeyHash = self->fPublicKeyHash;
  self->fPublicKeyHash = v4;
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v47 = a3;
  id v48 = a4;
  id v9 = a5;
  v53 = (void (**)(id, uint64_t, void))a6;
  v50 = v9;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v42 = [(NSString *)self->fPublicKeyHash UTF8String];
    *(_DWORD *)buf = 136315138;
    v57 = v42;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Branded calling pinned public key SHA-256 hash %s", buf, 0xCu);
  }
  v10 = [v9 protectionSpace];
  v52 = [v10 authenticationMethod];

  if (![v52 isEqualToString:NSURLAuthenticationMethodServerTrust])
  {
LABEL_53:
    v53[2](v53, 2, 0);
    goto LABEL_56;
  }
  v11 = [v9 protectionSpace];
  v12 = (__SecTrust *)[v11 serverTrust];

  if (!SecTrustEvaluateWithError(v12, 0))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Branded calling server trust evaluation failed", buf, 2u);
    }
    v53[2](v53, 2, 0);
    goto LABEL_56;
  }
  CFArrayRef v13 = SecTrustCopyCertificateChain(v12);
  CFArrayRef v55 = v13;
  if (v13) {
    v14 = sub_100083F10;
  }
  else {
    v14 = 0;
  }
  if (!v14)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Branded calling certificate chain is null", buf, 2u);
    }
    goto LABEL_12;
  }
  CFIndex Count = CFArrayGetCount(v13);
  if (Count < 3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Branded calling intermediate CA is not available", buf, 2u);
    }
LABEL_12:
    v53[2](v53, 2, 0);
    goto LABEL_55;
  }
  uint64_t v16 = 2;
  while (1)
  {
    ValueAtIndex = (__SecCertificate *)CFArrayGetValueAtIndex(v55, v16 - 1);
    if (!ValueAtIndex)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Branded calling certificate is null", buf, 2u);
      }
      goto LABEL_51;
    }
    v54 = 0;
    v54 = SecCertificateCopyKey(ValueAtIndex);
    CFDataRef v51 = SecKeyCopyExternalRepresentation(v54, 0);
    CFDictionaryRef v45 = SecKeyCopyAttributes(v54);
    v46 = [(__CFDictionary *)v45 objectForKeyedSubscript:kSecAttrKeyType];
    v18 = [(__CFDictionary *)v45 objectForKeyedSubscript:kSecAttrKeySizeInBits];
    uint64_t v19 = (uint64_t)[v18 unsignedIntegerValue];

    id v20 = v46;
    v21 = v20;
    if (v19 <= 2047)
    {
      if (v19 == 256)
      {
        unsigned int v30 = [v20 isEqualToString:kSecAttrKeyTypeECSECPrimeRandom];

        unsigned __int8 v31 = [v21 isEqualToString:kSecAttrKeyTypeECSECPrimeRandom];
        if (v30) {
          v24 = &unk_101586252;
        }
        else {
          v24 = 0;
        }
        if (v31)
        {
          uint64_t v25 = 26;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
      if (v19 == 384)
      {
        unsigned int v22 = [v20 isEqualToString:kSecAttrKeyTypeECSECPrimeRandom];

        unsigned __int8 v23 = [v21 isEqualToString:kSecAttrKeyTypeECSECPrimeRandom];
        if (v22) {
          v24 = &unk_10158626C;
        }
        else {
          v24 = 0;
        }
        if (v23)
        {
          uint64_t v25 = 23;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_45:

      id v33 = v21;
      v24 = 0;
      goto LABEL_46;
    }
    if (v19 == 4096)
    {
      unsigned int v32 = [v20 isEqualToString:kSecAttrKeyTypeRSA];

      unsigned __int8 v27 = [v21 isEqualToString:kSecAttrKeyTypeRSA];
      BOOL v28 = v32 == 0;
      v29 = &unk_10158623A;
    }
    else
    {
      if (v19 != 2048) {
        goto LABEL_45;
      }
      unsigned int v26 = [v20 isEqualToString:kSecAttrKeyTypeRSA];

      unsigned __int8 v27 = [v21 isEqualToString:kSecAttrKeyTypeRSA];
      BOOL v28 = v26 == 0;
      v29 = &unk_101586222;
    }
    if (v28) {
      v24 = 0;
    }
    else {
      v24 = v29;
    }
    if (v27)
    {
      uint64_t v25 = 24;
      goto LABEL_47;
    }
LABEL_46:
    uint64_t v25 = 0;
LABEL_47:

    v34 = +[NSMutableData dataWithLength:32];
    v35 = +[NSMutableData dataWithBytes:v24 length:v25];
    [v35 appendData:v51];
    id v36 = v35;
    id v37 = [v36 bytes];
    CC_LONG v38 = [v36 length];
    id v39 = v34;
    CC_SHA256(v37, v38, (unsigned __int8 *)[v39 bytes]);
    v40 = [v39 base64EncodedStringWithOptions:0];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v41 = (const char *)[v40 UTF8String];
      *(_DWORD *)buf = 136315138;
      v57 = v41;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Branded calling intermediate CA public key SHA-256 hash %s", buf, 0xCu);
    }
    if ([v40 isEqualToString:self->fPublicKeyHash]) {
      break;
    }

    sub_100127DDC((const void **)&v54);
LABEL_51:
    if (Count == ++v16)
    {
      sub_100044D00((const void **)&v55);
      goto LABEL_53;
    }
  }
  v43 = [v50 protectionSpace];
  v44 = +[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", [v43 serverTrust]);
  ((void (**)(id, uint64_t, void *))v53)[2](v53, 0, v44);

  sub_100127DDC((const void **)&v54);
LABEL_55:
  sub_100044D00((const void **)&v55);
LABEL_56:
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = (void (**)(id, void))a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    uint64_t v16 = [v14 URL];
    id v17 = [v16 absoluteString];
    int v18 = 136315138;
    id v19 = [v17 UTF8String];
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Branded calling redirects are not allowed %s", (uint8_t *)&v18, 0xCu);
  }
  v15[2](v15, 0);
}

- (void).cxx_destruct
{
}

@end