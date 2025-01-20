@interface CMSJSONWebSignature
- (BOOL)_validateJWSProtectedHeader:(id)a3;
- (CMSJSONWebSignature)initWithJWSCompactEncodedString:(id)a3 keyID:(id)a4 publicKey:(id)a5;
- (NSData)payload;
- (NSError)verificationError;
- (NSString)keyID;
- (__SecKey)_createPublicKeyFromPEM:(id)a3;
- (id)_createASN1SignatureFromJWSSignature:(id)a3;
- (void)_validateJWSSignature:(id)a3 ofHeader:(id)a4 andPayload:(id)a5 withPublicKey:(__SecKey *)a6;
@end

@implementation CMSJSONWebSignature

- (CMSJSONWebSignature)initWithJWSCompactEncodedString:(id)a3 keyID:(id)a4 publicKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v33.receiver = self;
  v33.super_class = (Class)CMSJSONWebSignature;
  v11 = [(CMSJSONWebSignature *)&v33 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_keyID, a4);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [v8 componentsSeparatedByString:@"."];
      if ([v13 count] != 3)
      {
        uint64_t v27 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.jsonwebsignature" code:1 userInfo:0];
        verificationError = v12->_verificationError;
        v12->_verificationError = (NSError *)v27;
LABEL_15:

        goto LABEL_16;
      }
      v14 = [v13 objectAtIndexedSubscript:0];
      BOOL v15 = [(CMSJSONWebSignature *)v12 _validateJWSProtectedHeader:v14];

      if (v15)
      {
        verificationError = [v13 objectAtIndexedSubscript:1];
        uint64_t v17 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64URLEncodedString:verificationError];
        payload = v12->_payload;
        v12->_payload = (NSData *)v17;

        id v19 = objc_alloc(MEMORY[0x263EFF8F8]);
        v20 = [v13 objectAtIndexedSubscript:2];
        v21 = (void *)[v19 initWithBase64URLEncodedString:v20];

        if (v12->_payload && v21)
        {
          uint64_t v22 = [(CMSJSONWebSignature *)v12 _createPublicKeyFromPEM:v10];
          if (v22)
          {
            v23 = (const void *)v22;
            v24 = [v13 objectAtIndexedSubscript:0];
            v25 = [v13 objectAtIndexedSubscript:1];
            [(CMSJSONWebSignature *)v12 _validateJWSSignature:v21 ofHeader:v24 andPayload:v25 withPublicKey:v23];

            CFRelease(v23);
LABEL_14:

            goto LABEL_15;
          }
          v28 = (void *)MEMORY[0x263F087E8];
          uint64_t v29 = 10;
        }
        else
        {
          v28 = (void *)MEMORY[0x263F087E8];
          uint64_t v29 = 3;
        }
        uint64_t v30 = [v28 errorWithDomain:@"com.apple.cloudextension.errors.jsonwebsignature" code:v29 userInfo:0];
        v31 = v12->_verificationError;
        v12->_verificationError = (NSError *)v30;

        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v26 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.jsonwebsignature" code:0 userInfo:0];
      v13 = v12->_verificationError;
      v12->_verificationError = (NSError *)v26;
    }
LABEL_16:
  }
  return v12;
}

- (BOOL)_validateJWSProtectedHeader:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263EFF8F8];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithBase64URLEncodedString:v5];

  if (v6)
  {
    id v33 = 0;
    v7 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:&v33];
    id v8 = v33;
    id v9 = v8;
    if (v8)
    {
      id v10 = (NSError *)v8;
LABEL_19:
      char v13 = 0;
      verificationError = self->_verificationError;
      self->_verificationError = v10;
LABEL_20:

      goto LABEL_21;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v10 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.jsonwebsignature" code:5 userInfo:0];
      goto LABEL_19;
    }
    verificationError = v7;
    if ((unint64_t)[(NSError *)verificationError count] >= 2)
    {
      BOOL v15 = [(NSError *)verificationError objectForKeyedSubscript:@"alg"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = [(NSError *)verificationError objectForKeyedSubscript:@"kid"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v18 = [(NSError *)verificationError objectForKeyedSubscript:@"alg"];
          if ([v18 isEqualToString:@"ES256"])
          {
            id v19 = [(NSError *)verificationError objectForKeyedSubscript:@"kid"];
            v20 = [(CMSJSONWebSignature *)self keyID];
            char v13 = [v20 isEqualToString:v19];

            if (v13)
            {
              v21 = [(NSError *)verificationError objectForKeyedSubscript:@"typ"];
              uint64_t v22 = v21;
              if (v21 && [(NSError *)v21 caseInsensitiveCompare:@"JOSE"])
              {
                v23 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.jsonwebsignature" code:9 userInfo:0];
                v24 = self->_verificationError;
                self->_verificationError = v23;
              }
              v25 = [(NSError *)verificationError objectForKeyedSubscript:@"cty"];
              uint64_t v26 = v25;
              if (v25 && [v25 caseInsensitiveCompare:@"JSON"])
              {
                uint64_t v27 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.jsonwebsignature" code:9 userInfo:0];
                v28 = self->_verificationError;
                self->_verificationError = v27;
              }
            }
            else
            {
              v32 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.jsonwebsignature" code:8 userInfo:0];
              uint64_t v22 = self->_verificationError;
              self->_verificationError = v32;
            }
          }
          else
          {
            v31 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.jsonwebsignature" code:7 userInfo:0];
            char v13 = 0;
            id v19 = self->_verificationError;
            self->_verificationError = v31;
          }

          goto LABEL_24;
        }
      }
      else
      {
      }
    }
    uint64_t v30 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.jsonwebsignature" code:6 userInfo:0];
    char v13 = 0;
    v18 = self->_verificationError;
    self->_verificationError = v30;
LABEL_24:

    goto LABEL_20;
  }
  v11 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.jsonwebsignature" code:4 userInfo:0];
  v12 = self->_verificationError;
  self->_verificationError = v11;

  char v13 = 0;
LABEL_21:

  return v13;
}

- (void)_validateJWSSignature:(id)a3 ofHeader:(id)a4 andPayload:(id)a5 withPublicKey:(__SecKey *)a6
{
  id v10 = NSString;
  id v11 = a3;
  v12 = [v10 stringWithFormat:@"%@.%@", a4, a5];
  CFDataRef v13 = [v12 dataUsingEncoding:4];

  CFDataRef v14 = [(CMSJSONWebSignature *)self _createASN1SignatureFromJWSSignature:v11];

  if (!v14)
  {
    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = 11;
    goto LABEL_8;
  }
  CFErrorRef error = 0;
  if (SecKeyVerifySignature(a6, (SecKeyAlgorithm)*MEMORY[0x263F172E8], v13, v14, &error)) {
    BOOL v15 = error == 0;
  }
  else {
    BOOL v15 = 0;
  }
  if (!v15)
  {
    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = 12;
LABEL_8:
    v18 = [v16 errorWithDomain:@"com.apple.cloudextension.errors.jsonwebsignature" code:v17 userInfo:0];
    verificationError = self->_verificationError;
    self->_verificationError = v18;
  }
}

- (__SecKey)_createPublicKeyFromPEM:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
    v6 = [v5 componentsSeparatedByString:@"-----BEGIN PUBLIC KEY-----"];
    if ((unint64_t)[v6 count] < 2)
    {
      v7 = 0;
LABEL_21:

      goto LABEL_22;
    }
    id v8 = [v6 objectAtIndexedSubscript:1];

    id v9 = [v8 componentsSeparatedByString:@"-----END PUBLIC KEY-----"];
    if ((unint64_t)[v9 count] < 2)
    {
      v7 = 0;
LABEL_20:

      id v5 = v8;
      goto LABEL_21;
    }
    id v10 = [v9 objectAtIndexedSubscript:0];

    id v11 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    v12 = [v10 componentsSeparatedByCharactersInSet:v11];
    id v8 = [v12 componentsJoinedByString:&stru_26DE5AB78];

    CFDataRef v13 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v8 options:0];
    if (v13)
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long dest = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      LODWORD(v43) = 16;
      LODWORD(v44) = 32;
      DWORD2(v44) = 6;
      *(void *)&long long v46 = 0x1000000500;
      *(void *)&templates.kind = 16;
      templates.sub = 0;
      templates.size = 48;
      uint64_t v34 = 2048;
      v35 = &v43;
      int v36 = 0;
      uint64_t v37 = 0x2000000003;
      uint64_t v38 = 0;
      int v39 = 0;
      uint64_t v41 = 0;
      uint64_t v42 = 0;
      uint64_t v40 = 0;
      SecAsn1CoderRef coder = 0;
      v7 = 0;
      if (SecAsn1CoderCreate(&coder))
      {
LABEL_19:

        goto LABEL_20;
      }
      CFDataRef v14 = coder;
      id v15 = v13;
      if (!SecAsn1Decode(v14, (const void *)[v15 bytes], objc_msgSend(v15, "length"), &templates, &dest)
        && ((void)dest == 7 && !memcmp(*((const void **)&dest + 1), &_oidEcPubKey, 7uLL) ? (int v16 = 0) : (int v16 = 1),
            (size_t v17 = v29 - 2, (void)v29 == 10)
         && **((unsigned char **)&v29 + 1) == 6
         && v17 == *(unsigned __int8 *)(*((void *)&v29 + 1) + 1)
         && ((memcmp((const void *)(*((void *)&v29 + 1) + 2), &_oidEcPrime256v1, v17) == 0) & ~v16) != 0))
      {
        if ((v30 & 7) != 0) {
          unint64_t v19 = ((unint64_t)v30 >> 3) + 1;
        }
        else {
          unint64_t v19 = (unint64_t)v30 >> 3;
        }
        CFDataRef v20 = [MEMORY[0x263EFF8F8] dataWithBytes:*((void *)&v30 + 1) length:v19];
        SecAsn1CoderRelease(coder);
        if (v20)
        {
          uint64_t v21 = *MEMORY[0x263F16FB8];
          uint64_t v22 = *MEMORY[0x263F16F68];
          v31[0] = *MEMORY[0x263F16FA8];
          v31[1] = v22;
          uint64_t v23 = *MEMORY[0x263F16F80];
          v32[0] = v21;
          v32[1] = v23;
          v31[2] = *MEMORY[0x263F16F98];
          v32[2] = &unk_26DE63EE0;
          CFDictionaryRef v24 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];
          CFErrorRef v26 = 0;
          SecKeyRef v25 = SecKeyCreateWithData(v20, v24, &v26);
          v7 = v25;
          if (v26 && v25)
          {
            CFRelease(v25);
            v7 = 0;
          }

          goto LABEL_19;
        }
      }
      else
      {
        SecAsn1CoderRelease(coder);
      }
    }
    v7 = 0;
    goto LABEL_19;
  }
  v7 = 0;
LABEL_22:

  return v7;
}

- (id)_createASN1SignatureFromJWSSignature:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 length] == 64)
  {
    v4 = objc_msgSend(v3, "subdataWithRange:", 0, 32);
    uint64_t v5 = objc_msgSend(v3, "subdataWithRange:", 32, 32);
    v6 = (void *)v5;
    v7 = 0;
    if (v4)
    {
      if (v5)
      {
        src[0] = [v4 length];
        src[1] = [v4 bytes];
        src[2] = [v6 length];
        src[3] = [v6 bytes];
        memset(templates, 0, sizeof(templates));
        long long v15 = 0u;
        long long v16 = 0u;
        long long v13 = 0u;
        *(_DWORD *)SecAsn1Template templates = 16;
        *(_DWORD *)&templates[16] = 32;
        *(_DWORD *)&templates[24] = 2;
        long long v14 = 0x1000000002uLL;
        dest.Data = 0;
        SecAsn1CoderRef coder = 0;
        dest.Length = 0;
        v7 = 0;
        if (!SecAsn1CoderCreate(&coder))
        {
          if (SecAsn1EncodeItem(coder, src, (const SecAsn1Template *)templates, &dest)) {
            SecAsn1CoderRelease(coder);
          }
          v7 = [MEMORY[0x263EFF8F8] dataWithBytes:dest.Data length:dest.Length];
          SecAsn1CoderRelease(coder);
        }
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)keyID
{
  return self->_keyID;
}

- (NSData)payload
{
  return self->_payload;
}

- (NSError)verificationError
{
  return self->_verificationError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationError, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_keyID, 0);
}

@end