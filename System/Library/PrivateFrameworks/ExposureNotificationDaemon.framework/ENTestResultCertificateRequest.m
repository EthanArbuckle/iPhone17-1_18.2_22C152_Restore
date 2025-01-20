@interface ENTestResultCertificateRequest
+ (id)certificateRequestWithToken:(id)a3 temporaryExposureKeys:(id)a4 APIKey:(id)a5 requestURL:(id)a6 URLSession:(id)a7 queue:(id)a8 error:(id *)a9;
+ (id)deriveHMACForTemporaryExposureKeys:(id)a3 symmetricKey:(id)a4;
- (NSData)HMAC;
- (NSData)symmetricKey;
- (NSString)certificate;
- (NSString)token;
- (id)bodyJSON;
- (id)handleResponse:(id)a3 body:(id)a4;
@end

@implementation ENTestResultCertificateRequest

+ (id)certificateRequestWithToken:(id)a3 temporaryExposureKeys:(id)a4 APIKey:(id)a5 requestURL:(id)a6 URLSession:(id)a7 queue:(id)a8 error:(id *)a9
{
  v15 = a9;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  v22 = NSRandomData();
  id v23 = 0;
  if (v22)
  {
    v15 = (id *)[objc_alloc((Class)a1) initWithRequestURL:v19 URLSession:v20 queue:v21];
    [v15 setAPIKey:v18];
    uint64_t v24 = [v16 copy];
    id v25 = v15[10];
    v15[10] = (id)v24;

    uint64_t v26 = [v22 copy];
    id v27 = v15[11];
    v15[11] = (id)v26;

    uint64_t v28 = [(id)objc_opt_class() deriveHMACForTemporaryExposureKeys:v17 symmetricKey:v22];
    id v29 = v15[12];
    v15[12] = (id)v28;
  }
  else if (a9)
  {
    ENNestedErrorF();
    v15 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)bodyJSON
{
  v7[2] = *MEMORY[0x1E4F143B8];
  token = self->_token;
  v6[0] = @"token";
  v6[1] = @"ekeyhmac";
  v7[0] = token;
  v3 = [(NSData *)self->_HMAC base64EncodedStringWithOptions:0];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E0] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (id)handleResponse:(id)a3 body:(id)a4
{
  id v5 = a4;
  CFStringGetTypeID();
  v6 = CFDictionaryGetTypedValue();

  if (v6)
  {
    objc_storeStrong((id *)&self->_certificate, v6);
    v7 = 0;
  }
  else
  {
    v7 = ENTestResultErrorF(4);
  }

  return v7;
}

+ (id)deriveHMACForTemporaryExposureKeys:(id)a3 symmetricKey:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v29 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA68]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v13 = [v12 keyData];
        v14 = [v13 base64EncodedStringWithOptions:0];

        [v6 setObject:v12 forKeyedSubscript:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v9);
  }
  v30 = v7;

  id v15 = objc_alloc_init(MEMORY[0x1E4F28E70]);
  id v16 = [v6 allKeys];
  id v17 = [v16 sortedArrayUsingSelector:sel_compare_];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v17;
  uint64_t v18 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 8 * j);
        id v23 = [v6 objectForKeyedSubscript:v22];
        if ([v15 length]) {
          [v15 appendString:@","];
        }
        [v15 appendFormat:@"%@.%u.%u.%u", v22, objc_msgSend(v23, "rollingStartNumber"), objc_msgSend(v23, "rollingPeriod"), objc_msgSend(v23, "transmissionRiskLevel")];
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v19);
  }

  id v24 = v15;
  id v25 = (const char *)[v24 UTF8String];
  memset(v40, 0, sizeof(v40));
  ccsha256_di();
  [v29 length];
  id v26 = v29;
  [v26 bytes];
  strlen(v25);
  cchmac();
  id v27 = [MEMORY[0x1E4F1C9B0] dataWithBytes:v40 length:32];

  return v27;
}

- (NSString)token
{
  return self->_token;
}

- (NSData)symmetricKey
{
  return self->_symmetricKey;
}

- (NSData)HMAC
{
  return self->_HMAC;
}

- (NSString)certificate
{
  return self->_certificate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_HMAC, 0);
  objc_storeStrong((id *)&self->_symmetricKey, 0);

  objc_storeStrong((id *)&self->_token, 0);
}

@end