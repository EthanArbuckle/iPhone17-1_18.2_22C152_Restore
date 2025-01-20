@interface DAEASOAuthJWTValidator
+ (id)base64URLDecode:(id)a3;
+ (id)base64URLEncode:(id)a3;
- (BOOL)_signatureValid:(id)a3;
- (BOOL)idTokenValidWithJWKS:(id)a3 withAudience:(id)a4 withIssuer:(id)a5;
- (BOOL)personalAccount;
- (DAEASOAuthJWTValidator)init;
- (DAEASOAuthJWTValidator)initWithIdToken:(id)a3;
- (NSData)decodedHeader;
- (NSData)decodedPayload;
- (NSData)decodedSignature;
- (NSString)rawHeader;
- (NSString)rawPayload;
- (NSString)rawSignature;
- (id)headerJSONObject;
- (id)payloadJSONObject;
- (void)setDecodedHeader:(id)a3;
- (void)setDecodedPayload:(id)a3;
- (void)setDecodedSignature:(id)a3;
- (void)setHeaderJSONObject:(id)a3;
- (void)setPayloadJSONObject:(id)a3;
- (void)setRawHeader:(id)a3;
- (void)setRawPayload:(id)a3;
- (void)setRawSignature:(id)a3;
@end

@implementation DAEASOAuthJWTValidator

- (DAEASOAuthJWTValidator)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"DAEASOAuthJWTValidator.m" lineNumber:41 description:@"DAEASOAuthJWTValidator cannot be initialized with this method."];

  return 0;
}

- (DAEASOAuthJWTValidator)initWithIdToken:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v36 = [MEMORY[0x263F08690] currentHandler];
    [v36 handleFailureInMethod:a2 object:self file:@"DAEASOAuthJWTValidator.m" lineNumber:46 description:@"DAEASOAuthJWTValidator cannot be initialized with nil idToken"];
  }
  v39.receiver = self;
  v39.super_class = (Class)DAEASOAuthJWTValidator;
  v6 = [(DAEASOAuthJWTValidator *)&v39 init];
  if (!v6) {
    goto LABEL_19;
  }
  v7 = [v5 componentsSeparatedByString:@"."];
  if ((unint64_t)[v7 count] <= 2)
  {
    v8 = DALoggingwithCategory();
    os_log_type_t v9 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = [v7 count];
      *(_DWORD *)buf = 138412546;
      id v41 = v7;
      __int16 v42 = 2048;
      uint64_t v43 = v10;
      _os_log_impl(&dword_22C076000, v8, v9, "DAEASOAuthJWTValidator Error separating idToken components: %@ %lu", buf, 0x16u);
    }
    id v11 = 0;
    goto LABEL_12;
  }
  uint64_t v12 = [v7 objectAtIndexedSubscript:0];
  rawHeader = v6->_rawHeader;
  v6->_rawHeader = (NSString *)v12;

  uint64_t v14 = [v7 objectAtIndexedSubscript:1];
  rawPayload = v6->_rawPayload;
  v6->_rawPayload = (NSString *)v14;

  uint64_t v16 = [v7 objectAtIndexedSubscript:2];
  rawSignature = v6->_rawSignature;
  v6->_rawSignature = (NSString *)v16;

  uint64_t v18 = +[DAEASOAuthJWTValidator base64URLDecode:v6->_rawHeader];
  decodedHeader = v6->_decodedHeader;
  v6->_decodedHeader = (NSData *)v18;

  uint64_t v20 = +[DAEASOAuthJWTValidator base64URLDecode:v6->_rawPayload];
  decodedPayload = v6->_decodedPayload;
  v6->_decodedPayload = (NSData *)v20;

  uint64_t v22 = +[DAEASOAuthJWTValidator base64URLDecode:v6->_rawSignature];
  decodedSignature = v6->_decodedSignature;
  v6->_decodedSignature = (NSData *)v22;

  v24 = v6->_decodedHeader;
  id v38 = 0;
  uint64_t v25 = [MEMORY[0x263F08900] JSONObjectWithData:v24 options:4 error:&v38];
  id v11 = v38;
  id headerJSONObject = v6->_headerJSONObject;
  v6->_id headerJSONObject = (id)v25;

  if (v11 || !v6->_headerJSONObject)
  {
    v8 = DALoggingwithCategory();
    os_log_type_t v27 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v8, v27))
    {
      v28 = v6->_rawHeader;
      *(_DWORD *)buf = 138412546;
      id v41 = v11;
      __int16 v42 = 2112;
      uint64_t v43 = (uint64_t)v28;
      v29 = "DAEASOAuthJWTValidator Error parsing JWT header: %@ %@";
LABEL_11:
      _os_log_impl(&dword_22C076000, v8, v27, v29, buf, 0x16u);
    }
  }
  else
  {
    v31 = v6->_decodedPayload;
    id v37 = 0;
    uint64_t v32 = [MEMORY[0x263F08900] JSONObjectWithData:v31 options:1 error:&v37];
    id v11 = v37;
    id payloadJSONObject = v6->_payloadJSONObject;
    v6->_id payloadJSONObject = (id)v32;

    if (!v11 && v6->_payloadJSONObject)
    {

LABEL_19:
      v30 = v6;
      goto LABEL_20;
    }
    v8 = DALoggingwithCategory();
    os_log_type_t v27 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v8, v27))
    {
      v34 = v6->_rawPayload;
      *(_DWORD *)buf = 138412546;
      id v41 = v11;
      __int16 v42 = 2112;
      uint64_t v43 = (uint64_t)v34;
      v29 = "DAEASOAuthJWTValidator Error parsing JWT payload: %@ %@";
      goto LABEL_11;
    }
  }
LABEL_12:

  v30 = 0;
LABEL_20:

  return v30;
}

- (BOOL)personalAccount
{
  v3 = [(DAEASOAuthJWTValidator *)self payloadJSONObject];
  v4 = [v3 objectForKeyedSubscript:@"tid"];

  BOOL result = 0;
  if (v4)
  {
    id v5 = [(DAEASOAuthJWTValidator *)self payloadJSONObject];
    v6 = [v5 objectForKeyedSubscript:@"tid"];
    char v7 = [v6 isEqualToString:@"9188040d-6c67-4c5b-b112-36a304b66dad"];

    if (v7) {
      return 1;
    }
  }
  return result;
}

- (BOOL)idTokenValidWithJWKS:(id)a3 withAudience:(id)a4 withIssuer:(id)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v8 = (__CFString *)a3;
  os_log_type_t v9 = (__CFString *)a4;
  id v10 = a5;
  id v11 = v10;
  if (!v8 || !v9 || !v10)
  {
    uint64_t v14 = DALoggingwithCategory();
    os_log_type_t v21 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (!os_log_type_enabled(v14, v21)) {
      goto LABEL_16;
    }
    int v45 = 138412802;
    v46 = v8;
    __int16 v47 = 2112;
    v48 = v9;
    __int16 v49 = 2112;
    v50 = v11;
    uint64_t v22 = "DAEASOAuthJWTValidator idToken could not be validated, nil params %@ %@ %@";
    v23 = v14;
    os_log_type_t v24 = v21;
    uint32_t v25 = 32;
LABEL_15:
    _os_log_impl(&dword_22C076000, v23, v24, v22, (uint8_t *)&v45, v25);
    goto LABEL_16;
  }
  if (![(DAEASOAuthJWTValidator *)self _signatureValid:v8])
  {
    uint64_t v14 = DALoggingwithCategory();
    os_log_type_t v26 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
    if (!os_log_type_enabled(v14, v26)) {
      goto LABEL_16;
    }
    LOWORD(v45) = 0;
    uint64_t v22 = "DAEASOAuthJWTValidator idToken could not be validated, invalid signature";
    v23 = v14;
    os_log_type_t v24 = v26;
    uint32_t v25 = 2;
    goto LABEL_15;
  }
  uint64_t v12 = [self->_payloadJSONObject objectForKeyedSubscript:@"iss"];

  if (v12)
  {
    v13 = [self->_payloadJSONObject objectForKeyedSubscript:@"tid"];
    uint64_t v14 = [v11 stringByReplacingOccurrencesOfString:@"{tenantid}" withString:v13];

    v15 = [self->_payloadJSONObject objectForKeyedSubscript:@"iss"];
    uint64_t v16 = [v14 caseInsensitiveCompare:v15];

    if (v16)
    {
      v17 = DALoggingwithCategory();
      os_log_type_t v18 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
      if (os_log_type_enabled(v17, v18))
      {
        v19 = [self->_payloadJSONObject objectForKeyedSubscript:@"iss"];
        int v45 = 138412546;
        v46 = (__CFString *)v14;
        __int16 v47 = 2112;
        v48 = v19;
        uint64_t v20 = "DAEASOAuthJWTValidator idToken could not be validated, issuer mismatch: %@ %@";
LABEL_24:
        _os_log_impl(&dword_22C076000, v17, v18, v20, (uint8_t *)&v45, 0x16u);
      }
    }
    else
    {
      v31 = [self->_payloadJSONObject objectForKeyedSubscript:@"aud"];
      uint64_t v32 = [v31 isEqualToString:v9];

      if (v32)
      {
        v33 = [self->_payloadJSONObject objectForKeyedSubscript:@"nbf"];
        double v34 = (double)[v33 integerValue];

        v35 = [objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSinceNow:300.0];
        [v35 timeIntervalSince1970];
        if (v36 >= v34)
        {
          v40 = [self->_payloadJSONObject objectForKeyedSubscript:@"exp"];
          double v41 = (double)[v40 integerValue];

          v17 = [objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSinceNow:-300.0];
          [v17 timeIntervalSince1970];
          if (v42 <= v41)
          {
            BOOL v29 = 1;
            goto LABEL_26;
          }
          id v37 = DALoggingwithCategory();
          os_log_type_t v43 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
          if (os_log_type_enabled(v37, v43))
          {
            [v17 timeIntervalSince1970];
            int v45 = 134218240;
            v46 = *(__CFString **)&v41;
            __int16 v47 = 2048;
            v48 = v44;
            _os_log_impl(&dword_22C076000, v37, v43, "DAEASOAuthJWTValidator idToken could not be validated, exp validation failed: %f %f", (uint8_t *)&v45, 0x16u);
          }
          v35 = v17;
        }
        else
        {
          id v37 = DALoggingwithCategory();
          os_log_type_t v38 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
          if (os_log_type_enabled(v37, v38))
          {
            [v35 timeIntervalSince1970];
            int v45 = 134218240;
            v46 = *(__CFString **)&v34;
            __int16 v47 = 2048;
            v48 = v39;
            _os_log_impl(&dword_22C076000, v37, v38, "DAEASOAuthJWTValidator idToken could not be validated, nbf validation failed: %f %f", (uint8_t *)&v45, 0x16u);
          }
        }

        BOOL v29 = 0;
        v17 = v35;
        goto LABEL_26;
      }
      v17 = DALoggingwithCategory();
      os_log_type_t v18 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
      if (os_log_type_enabled(v17, v18))
      {
        v19 = [self->_payloadJSONObject objectForKeyedSubscript:@"aud"];
        int v45 = 138412546;
        v46 = v9;
        __int16 v47 = 2112;
        v48 = v19;
        uint64_t v20 = "DAEASOAuthJWTValidator idToken could not be validated, audience mismatch: %@ %@";
        goto LABEL_24;
      }
    }
    BOOL v29 = 0;
LABEL_26:

    goto LABEL_17;
  }
  uint64_t v14 = DALoggingwithCategory();
  os_log_type_t v27 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v14, v27))
  {
    id payloadJSONObject = (__CFString *)self->_payloadJSONObject;
    int v45 = 138412546;
    v46 = @"iss";
    __int16 v47 = 2112;
    v48 = payloadJSONObject;
    uint64_t v22 = "DAEASOAuthJWTValidator idToken could not be validated, payload didn't contain the required key: %@ %@";
    v23 = v14;
    os_log_type_t v24 = v27;
    uint32_t v25 = 22;
    goto LABEL_15;
  }
LABEL_16:
  BOOL v29 = 0;
LABEL_17:

  return v29;
}

- (BOOL)_signatureValid:(id)a3
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  v4 = (__CFString *)a3;
  uint64_t v5 = [self->_headerJSONObject objectForKeyedSubscript:@"kid"];
  if (v5
    && (v6 = (void *)v5,
        [self->_payloadJSONObject objectForKeyedSubscript:@"iss"],
        char v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    id v59 = 0;
    v8 = [MEMORY[0x263F08900] JSONObjectWithData:v4 options:0 error:&v59];
    os_log_type_t v9 = v59;
    if (v9 || !v8)
    {
      id v10 = DALoggingwithCategory();
      os_log_type_t v24 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
      if (os_log_type_enabled(v10, v24))
      {
        *(_DWORD *)buf = 138412546;
        id v62 = v9;
        __int16 v63 = 2112;
        v64 = v4;
        _os_log_impl(&dword_22C076000, v10, v24, "DAEASOAuthJWTValidator signature could not be validated: %@ %@", buf, 0x16u);
      }
      BOOL v23 = 0;
    }
    else
    {
      v53 = v4;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      v52 = v8;
      id v10 = [v8 objectForKeyedSubscript:@"keys"];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v55 objects:v60 count:16];
      uint64_t v12 = MEMORY[0x263F38F90];
      if (v11)
      {
        uint64_t v13 = v11;
        uint64_t v14 = *(void *)v56;
LABEL_7:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v56 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void **)(*((void *)&v55 + 1) + 8 * v15);
          v17 = [v16 objectForKeyedSubscript:@"kid"];
          os_log_type_t v18 = [self->_headerJSONObject objectForKeyedSubscript:@"kid"];
          int v19 = [v17 isEqualToString:v18];

          if (v19) {
            break;
          }
          if (v13 == ++v15)
          {
            uint64_t v13 = [v10 countByEnumeratingWithState:&v55 objects:v60 count:16];
            uint64_t v12 = MEMORY[0x263F38F90];
            if (v13) {
              goto LABEL_7;
            }
            goto LABEL_45;
          }
        }
        uint32_t v25 = NSString;
        os_log_type_t v26 = [(DAEASOAuthJWTValidator *)self rawHeader];
        os_log_type_t v27 = [(DAEASOAuthJWTValidator *)self rawPayload];
        v28 = [v25 stringWithFormat:@"%@.%@", v26, v27];

        CFDataRef signedData = [v28 dataUsingEncoding:1];
        BOOL v29 = [v16 objectForKeyedSubscript:@"x5c"];
        v30 = [v29 firstObject];

        CFDataRef v31 = (const __CFData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v30 options:0];
        if (v31)
        {
          v50 = v28;
          uint64_t v32 = SecCertificateCreateWithData(0, v31);
          v33 = SecCertificateCopyKey(v32);
          uint64_t v12 = MEMORY[0x263F38F90];
          if (v32) {
            CFRelease(v32);
          }
          CFErrorRef error = 0;
          double v34 = [self->_headerJSONObject objectForKeyedSubscript:@"alg"];
          if ([v34 isEqualToString:@"RS256"]) {
            v35 = (SecKeyAlgorithm *)MEMORY[0x263F173A0];
          }
          else {
            v35 = (SecKeyAlgorithm *)MEMORY[0x263F17300];
          }

          CFDataRef v36 = signedData;
          if (v33)
          {
            if (signedData)
            {
              decodedSignature = self->_decodedSignature;
              if (decodedSignature)
              {
                int v38 = SecKeyVerifySignature(v33, *v35, signedData, (CFDataRef)decodedSignature, &error);
                goto LABEL_34;
              }
            }
          }
          objc_super v39 = DALoggingwithCategory();
          os_log_type_t v40 = *(unsigned char *)(v12 + 7);
          if (os_log_type_enabled(v39, v40))
          {
            double v41 = self->_decodedSignature;
            *(_DWORD *)buf = 138412802;
            id v62 = v33;
            __int16 v63 = 2112;
            v64 = (__CFString *)signedData;
            __int16 v65 = 2112;
            CFErrorRef v66 = (CFErrorRef)v41;
            _os_log_impl(&dword_22C076000, v39, v40, "DAEASOAuthJWTValidator SecKeyVerifySignature not invoked with invalid params: %@ %@ %@", buf, 0x20u);
          }

          if (v33)
          {
            int v38 = 0;
LABEL_34:
            CFRelease(v33);
            if (error)
            {
              double v42 = DALoggingwithCategory();
              os_log_type_t v43 = *(unsigned char *)(v12 + 7);
              if (os_log_type_enabled(v42, v43))
              {
                uint64_t v44 = self->_decodedSignature;
                *(_DWORD *)buf = 138412802;
                id v62 = signedData;
                __int16 v63 = 2112;
                v64 = (__CFString *)v44;
                __int16 v65 = 2112;
                CFErrorRef v66 = error;
                _os_log_impl(&dword_22C076000, v42, v43, "DAEASOAuthJWTValidator Error occurred while verifying signature: %@ %@ %@", buf, 0x20u);
              }
            }
            v28 = v50;
            if (v38 == 1)
            {

              BOOL v23 = 1;
              goto LABEL_48;
            }
            goto LABEL_44;
          }
          v28 = v50;
        }
        else
        {
          int v45 = DALoggingwithCategory();
          uint64_t v12 = MEMORY[0x263F38F90];
          os_log_type_t v46 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
          if (os_log_type_enabled(v45, v46))
          {
            *(_DWORD *)buf = 138412290;
            id v62 = 0;
            _os_log_impl(&dword_22C076000, v45, v46, "DAEASOAuthJWTValidator SecCertificateCreateWithData not invoked with invalid param: %@ ", buf, 0xCu);
          }

          CFDataRef v36 = signedData;
        }
LABEL_44:
      }
LABEL_45:

      id v10 = DALoggingwithCategory();
      os_log_type_t v47 = *(unsigned char *)(v12 + 7);
      if (os_log_type_enabled(v10, v47))
      {
        id headerJSONObject = (__CFString *)self->_headerJSONObject;
        *(_DWORD *)buf = 138412546;
        v8 = v52;
        id v62 = v52;
        __int16 v63 = 2112;
        v64 = headerJSONObject;
        _os_log_impl(&dword_22C076000, v10, v47, "DAEASOAuthJWTValidator signature could not be validated: %@ %@", buf, 0x16u);
        BOOL v23 = 0;
        os_log_type_t v9 = 0;
        v4 = v53;
      }
      else
      {
        BOOL v23 = 0;
LABEL_48:
        os_log_type_t v9 = 0;
        v4 = v53;
        v8 = v52;
      }
    }
  }
  else
  {
    os_log_type_t v9 = DALoggingwithCategory();
    os_log_type_t v20 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v9, v20))
    {
      id v21 = self->_headerJSONObject;
      id payloadJSONObject = (__CFError *)self->_payloadJSONObject;
      *(_DWORD *)buf = 138413058;
      id v62 = v21;
      __int16 v63 = 2112;
      v64 = @"kid";
      __int16 v65 = 2112;
      CFErrorRef v66 = payloadJSONObject;
      __int16 v67 = 2112;
      v68 = @"iss";
      _os_log_impl(&dword_22C076000, v9, v20, "DAEASOAuthJWTValidator signature could not be validated, keys not found %@ %@ %@ %@", buf, 0x2Au);
    }
    BOOL v23 = 0;
  }

  return v23;
}

+ (id)base64URLDecode:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v4 = v3;
    int v5 = [v3 length] & 3;
    if (v5)
    {
      uint64_t v6 = (4 - v5);
      char v7 = [NSString string];
      [v7 stringByPaddingToLength:v6 withString:@"=" startingAtIndex:0];
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = &stru_26DF7DF88;
    }
    uint64_t v12 = [v4 stringByAppendingString:v8];

    uint64_t v13 = [v12 stringByReplacingOccurrencesOfString:@"-" withString:@"+"];

    os_log_type_t v9 = [v13 stringByReplacingOccurrencesOfString:@"_" withString:@"/"];

    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v9 options:0];
  }
  else
  {
    os_log_type_t v9 = DALoggingwithCategory();
    os_log_type_t v10 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v9, v10))
    {
      int v15 = 138412290;
      uint64_t v16 = 0;
      _os_log_impl(&dword_22C076000, v9, v10, "DAEASOAuthJWTValidator cannot base64URLDecode: %@", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)base64URLEncode:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v3 = [a3 base64EncodedStringWithOptions:0];
    v4 = [v3 stringByReplacingOccurrencesOfString:@"+" withString:@"-"];

    int v5 = [v4 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];

    uint64_t v6 = [v5 stringByReplacingOccurrencesOfString:@"=" withString:&stru_26DF7DF88];
  }
  else
  {
    char v7 = DALoggingwithCategory();
    os_log_type_t v8 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v7, v8))
    {
      int v10 = 138412290;
      uint64_t v11 = 0;
      _os_log_impl(&dword_22C076000, v7, v8, "DAEASOAuthJWTValidator cannot base64URLEncode: %@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v6 = 0;
  }
  return v6;
}

- (NSString)rawHeader
{
  return self->_rawHeader;
}

- (void)setRawHeader:(id)a3
{
}

- (NSString)rawPayload
{
  return self->_rawPayload;
}

- (void)setRawPayload:(id)a3
{
}

- (NSString)rawSignature
{
  return self->_rawSignature;
}

- (void)setRawSignature:(id)a3
{
}

- (NSData)decodedHeader
{
  return self->_decodedHeader;
}

- (void)setDecodedHeader:(id)a3
{
}

- (NSData)decodedPayload
{
  return self->_decodedPayload;
}

- (void)setDecodedPayload:(id)a3
{
}

- (NSData)decodedSignature
{
  return self->_decodedSignature;
}

- (void)setDecodedSignature:(id)a3
{
}

- (id)headerJSONObject
{
  return self->_headerJSONObject;
}

- (void)setHeaderJSONObject:(id)a3
{
}

- (id)payloadJSONObject
{
  return self->_payloadJSONObject;
}

- (void)setPayloadJSONObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_payloadJSONObject, 0);
  objc_storeStrong(&self->_headerJSONObject, 0);
  objc_storeStrong((id *)&self->_decodedSignature, 0);
  objc_storeStrong((id *)&self->_decodedPayload, 0);
  objc_storeStrong((id *)&self->_decodedHeader, 0);
  objc_storeStrong((id *)&self->_rawSignature, 0);
  objc_storeStrong((id *)&self->_rawPayload, 0);
  objc_storeStrong((id *)&self->_rawHeader, 0);
}

@end