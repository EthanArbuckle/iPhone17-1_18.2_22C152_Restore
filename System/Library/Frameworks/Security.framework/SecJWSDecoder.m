@interface SecJWSDecoder
- (BOOL)_validateJWSProtectedHeader:(id)a3;
- (NSData)payload;
- (NSData)signature;
- (NSError)verificationError;
- (NSString)keyID;
- (SecJWSDecoder)initWithJWSCompactEncodedString:(id)a3 keyID:(id)a4 publicKey:(__SecKey *)a5;
- (id)_createASN1SignatureFromJWSSignature:(id)a3;
- (id)dataWithBase64URLEncodedString:(id)a3;
- (void)_validateJWSSignature:(id)a3 ofHeader:(id)a4 andPayload:(id)a5 withPublicKey:(__SecKey *)a6;
@end

@implementation SecJWSDecoder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationError, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_payload, 0);

  objc_storeStrong((id *)&self->_keyID, 0);
}

- (NSError)verificationError
{
  return self->_verificationError;
}

- (NSData)signature
{
  return self->_signature;
}

- (NSData)payload
{
  return self->_payload;
}

- (NSString)keyID
{
  return self->_keyID;
}

- (id)dataWithBase64URLEncodedString:(id)a3
{
  v3 = [a3 stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
  v4 = [v3 stringByReplacingOccurrencesOfString:@"_" withString:@"/"];

  if (([v4 length] & 3) != 0)
  {
    do
    {
      v5 = [v4 stringByAppendingString:@"="];

      v4 = v5;
    }
    while (([v5 length] & 3) != 0);
  }
  else
  {
    v5 = v4;
  }
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v5 options:0];

  return v6;
}

- (id)_createASN1SignatureFromJWSSignature:(id)a3
{
  return 0;
}

- (void)_validateJWSSignature:(id)a3 ofHeader:(id)a4 andPayload:(id)a5 withPublicKey:(__SecKey *)a6
{
  v10 = NSString;
  id v11 = a3;
  v12 = [v10 stringWithFormat:@"%@.%@", a4, a5];
  CFDataRef v13 = [v12 dataUsingEncoding:4];

  CFDataRef v14 = [(SecJWSDecoder *)self _createASN1SignatureFromJWSSignature:v11];

  if (!v14)
  {
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = 11;
    goto LABEL_8;
  }
  CFErrorRef error = 0;
  if (SecKeyVerifySignature(a6, @"algid:sign:ECDSA:message-X962:SHA256", v13, v14, &error)) {
    BOOL v15 = error == 0;
  }
  else {
    BOOL v15 = 0;
  }
  if (!v15)
  {
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = 12;
LABEL_8:
    v18 = [v16 errorWithDomain:@"com.apple.security.errors.jws" code:v17 userInfo:0];
    verificationError = self->_verificationError;
    self->_verificationError = v18;
  }
}

- (BOOL)_validateJWSProtectedHeader:(id)a3
{
  v4 = [(SecJWSDecoder *)self dataWithBase64URLEncodedString:a3];
  if (v4)
  {
    id v34 = 0;
    v5 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:&v34];
    id v6 = v34;
    v7 = v6;
    if (v6)
    {
      v8 = (NSError *)v6;
LABEL_12:
      BOOL v11 = 0;
      verificationError = self->_verificationError;
      self->_verificationError = v8;
LABEL_13:

      goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.security.errors.jws" code:5 userInfo:0];
      goto LABEL_12;
    }
    verificationError = v5;
    if ([(NSError *)verificationError count])
    {
      CFDataRef v13 = [(NSError *)verificationError objectForKeyedSubscript:@"alg"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v14 = [(NSError *)verificationError objectForKeyedSubscript:@"kid"];
        if (!v14)
        {

LABEL_18:
          v20 = [(NSError *)verificationError objectForKeyedSubscript:@"alg"];
          if ([v20 isEqualToString:@"ES256"])
          {
            v21 = [(NSError *)verificationError objectForKeyedSubscript:@"kid"];
            if (v21
              && ([(SecJWSDecoder *)self keyID],
                  v22 = objc_claimAutoreleasedReturnValue(),
                  char v23 = [v22 isEqualToString:v21],
                  v22,
                  (v23 & 1) == 0))
            {
              v33 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.security.errors.jws" code:8 userInfo:0];
              BOOL v11 = 0;
              v25 = self->_verificationError;
              self->_verificationError = v33;
            }
            else
            {
              v24 = [(NSError *)verificationError objectForKeyedSubscript:@"typ"];
              v25 = v24;
              if (v24 && [(NSError *)v24 caseInsensitiveCompare:@"JOSE"])
              {
                v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.security.errors.jws" code:9 userInfo:0];
                v27 = self->_verificationError;
                self->_verificationError = v26;
              }
              v28 = [(NSError *)verificationError objectForKeyedSubscript:@"cty"];
              v29 = v28;
              if (v28 && [v28 caseInsensitiveCompare:@"JSON"])
              {
                v30 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.security.errors.jws" code:9 userInfo:0];
                v31 = self->_verificationError;
                self->_verificationError = v30;
              }
              BOOL v11 = 1;
            }
          }
          else
          {
            v32 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.security.errors.jws" code:7 userInfo:0];
            BOOL v11 = 0;
            v21 = self->_verificationError;
            self->_verificationError = v32;
          }

          goto LABEL_32;
        }
        BOOL v15 = (void *)v14;
        v16 = [(NSError *)verificationError objectForKeyedSubscript:@"kid"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          goto LABEL_18;
        }
      }
      else
      {
      }
    }
    v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.security.errors.jws" code:6 userInfo:0];
    BOOL v11 = 0;
    v20 = self->_verificationError;
    self->_verificationError = v19;
LABEL_32:

    goto LABEL_13;
  }
  v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.security.errors.jws" code:4 userInfo:0];
  v10 = self->_verificationError;
  self->_verificationError = v9;

  BOOL v11 = 0;
LABEL_14:

  return v11;
}

- (SecJWSDecoder)initWithJWSCompactEncodedString:(id)a3 keyID:(id)a4 publicKey:(__SecKey *)a5
{
  id v8 = a3;
  id v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)SecJWSDecoder;
  v10 = [(SecJWSDecoder *)&v31 init];
  BOOL v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_keyID, a4);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [v8 componentsSeparatedByString:@"."];
      if ([v12 count] != 3)
      {
        uint64_t v25 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.security.errors.jws" code:1 userInfo:0];
        verificationError = v11->_verificationError;
        v11->_verificationError = (NSError *)v25;
        goto LABEL_14;
      }
      CFDataRef v13 = [v12 objectAtIndexedSubscript:0];
      BOOL v14 = [(SecJWSDecoder *)v11 _validateJWSProtectedHeader:v13];

      if (v14)
      {
        verificationError = [v12 objectAtIndexedSubscript:1];
        uint64_t v16 = [(SecJWSDecoder *)v11 dataWithBase64URLEncodedString:verificationError];
        payload = v11->_payload;
        v11->_payload = (NSData *)v16;

        v18 = [v12 objectAtIndexedSubscript:2];
        uint64_t v19 = [(SecJWSDecoder *)v11 dataWithBase64URLEncodedString:v18];
        signature = v11->_signature;
        v11->_signature = (NSData *)v19;

        if (v11->_payload && v11->_signature)
        {
          if (a5)
          {
            CFRetain(a5);
            v21 = v11->_signature;
            v22 = [v12 objectAtIndexedSubscript:0];
            char v23 = [v12 objectAtIndexedSubscript:1];
            [(SecJWSDecoder *)v11 _validateJWSSignature:v21 ofHeader:v22 andPayload:v23 withPublicKey:a5];

            CFRelease(a5);
LABEL_14:

            goto LABEL_15;
          }
          v26 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v27 = 10;
        }
        else
        {
          v26 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v27 = 3;
        }
        uint64_t v28 = [v26 errorWithDomain:@"com.apple.security.errors.jws" code:v27 userInfo:0];
        v29 = v11->_verificationError;
        v11->_verificationError = (NSError *)v28;

        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.security.errors.jws" code:0 userInfo:0];
      v12 = v11->_verificationError;
      v11->_verificationError = (NSError *)v24;
    }
LABEL_15:
  }
  return v11;
}

@end