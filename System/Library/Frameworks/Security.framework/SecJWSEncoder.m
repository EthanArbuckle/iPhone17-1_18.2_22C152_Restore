@interface SecJWSEncoder
- (BOOL)appendPaddedToData:(id)a3 ptr:(const char *)a4 len:(unint64_t)a5 expected:(unint64_t)a6;
- (SecJWSEncoder)init;
- (SecJWSEncoder)initWithPublicKey:(__SecKey *)a3 privateKey:(__SecKey *)a4;
- (__SecKey)privateKey;
- (__SecKey)publicKey;
- (id)base64URLEncodedStringRepresentationWithData:(id)a3;
- (id)base64URLEncodedStringRepresentationWithDictionary:(id)a3;
- (id)compactJSONStringRepresentationWithDictionary:(id)a3;
- (id)createKeyPair;
- (id)encodedJWSWithPayload:(id)a3 kid:(id)a4 nonce:(id)a5 url:(id)a6 error:(id *)a7;
- (id)jwkPublicKey;
- (id)signatureWithProtectedHeader:(id)a3 payload:(id)a4;
- (void)dealloc;
- (void)setPrivateKey:(__SecKey *)a3;
- (void)setPublicKey:(__SecKey *)a3;
@end

@implementation SecJWSEncoder

- (void)setPrivateKey:(__SecKey *)a3
{
  self->_privateKey = a3;
}

- (__SecKey)privateKey
{
  return self->_privateKey;
}

- (void)setPublicKey:(__SecKey *)a3
{
  self->_publicKey = a3;
}

- (__SecKey)publicKey
{
  return self->_publicKey;
}

- (id)compactJSONStringRepresentationWithDictionary:(id)a3
{
  uint64_t v8 = 0;
  v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a3 options:10 error:&v8];
  id v4 = [NSString alloc];
  id v5 = v3;
  v6 = objc_msgSend(v4, "initWithBytes:length:encoding:", objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"), 4);

  return v6;
}

- (id)base64URLEncodedStringRepresentationWithDictionary:(id)a3
{
  uint64_t v9 = 0;
  v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a3 options:10 error:&v9];
  id v4 = [v3 base64EncodedStringWithOptions:0];
  id v5 = [v4 stringByReplacingOccurrencesOfString:@"+" withString:@"-"];

  v6 = [v5 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];

  if ([v6 length])
  {
    while ([v6 hasSuffix:@"="])
    {
      v7 = objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1);

      v6 = v7;
      if (![v7 length]) {
        goto LABEL_6;
      }
    }
  }
  v7 = v6;
LABEL_6:

  return v7;
}

- (id)base64URLEncodedStringRepresentationWithData:(id)a3
{
  v3 = [a3 base64EncodedStringWithOptions:0];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@"+" withString:@"-"];

  id v5 = [v4 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];

  if ((unint64_t)[v5 length] >= 2)
  {
    while ([v5 hasSuffix:@"="])
    {
      v6 = objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - 1);

      id v5 = v6;
      if ((unint64_t)[v6 length] <= 1) {
        goto LABEL_6;
      }
    }
  }
  v6 = v5;
LABEL_6:

  return v6;
}

- (id)encodedJWSWithPayload:(id)a3 kid:(id)a4 nonce:(id)a5 url:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (self->_privateKey && self->_publicKey)
  {
    v16 = 0;
  }
  else
  {
    v16 = [(SecJWSEncoder *)self createKeyPair];
  }
  v17 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  [v17 setObject:@"ES256" forKeyedSubscript:@"alg"];
  if (v13)
  {
    [v17 setObject:v13 forKeyedSubscript:@"kid"];
  }
  else
  {
    v18 = [(SecJWSEncoder *)self jwkPublicKey];
    [v17 setObject:v18 forKeyedSubscript:@"jwk"];
  }
  [v17 setObject:v14 forKeyedSubscript:@"nonce"];
  [v17 setObject:v15 forKeyedSubscript:@"url"];
  if (v16)
  {
    v19 = 0;
    if (!a7) {
      goto LABEL_11;
    }
  }
  else
  {
    id v24 = v12;
    if (v12)
    {
      v21 = [(SecJWSEncoder *)self base64URLEncodedStringRepresentationWithDictionary:v12];
    }
    else
    {
      v21 = &stru_1ED84D0B0;
    }
    v22 = [(SecJWSEncoder *)self base64URLEncodedStringRepresentationWithDictionary:v17];
    v23 = [(SecJWSEncoder *)self signatureWithProtectedHeader:v22 payload:v21];
    v19 = [MEMORY[0x1E4F28E78] stringWithCapacity:0];
    [v19 appendString:@"{"];
    [v19 appendFormat:@"\"protected\":\"%@\",", v22];
    [v19 appendFormat:@"\"payload\":\"%@\",", v21];
    [v19 appendFormat:@"\"signature\":\"%@\"", v23];
    [v19 appendString:@"}"];

    id v12 = v24;
    if (!a7) {
      goto LABEL_11;
    }
  }
  *a7 = v16;
LABEL_11:

  return v19;
}

- (id)signatureWithProtectedHeader:(id)a3 payload:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = [NSString stringWithFormat:@"%@.%@", a3, a4];
  CFDataRef v6 = [v5 dataUsingEncoding:4];

  CFErrorRef error = 0;
  CFDataRef v7 = SecKeyCreateSignature(self->_privateKey, @"algid:sign:ECDSA:message-X962:SHA256", v6, &error);
  if (error)
  {
    uint64_t v8 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = error;
      _os_log_impl(&dword_18B299000, v8, OS_LOG_TYPE_DEFAULT, "Failed to create signature: %@", buf, 0xCu);
    }

    CFErrorRef v9 = error;
    if (error)
    {
      CFErrorRef error = 0;
      CFRelease(v9);
    }
  }
  if (!v7)
  {
    id v13 = 0;
    goto LABEL_26;
  }
  v10 = [MEMORY[0x1E4F1CA58] dataWithCapacity:0];
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v11;
  long long v26 = v11;
  v19[0] = CFDataGetBytePtr(v7);
  v19[1] = CFDataGetLength(v7);
  int v12 = DERParseSequence((uint64_t)v19, 2u, (uint64_t)&DER_ECDSASigItemSpecs, (unint64_t)buf, 0x20uLL);
  if (v12 || !*(void *)buf || !*(void *)&buf[8] || !(void)v26 || !*((void *)&v26 + 1))
  {
    id v14 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v21 = 67109120;
      LODWORD(v22) = v12;
      id v15 = "Failed to parse signature: %d";
      v16 = v14;
      uint32_t v17 = 8;
LABEL_23:
      _os_log_impl(&dword_18B299000, v16, OS_LOG_TYPE_DEFAULT, v15, v21, v17);
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  if (!-[SecJWSEncoder appendPaddedToData:ptr:len:expected:](self, "appendPaddedToData:ptr:len:expected:", v10))
  {
    id v14 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v21 = 134218240;
      uint64_t v22 = *(void *)&buf[8];
      __int16 v23 = 2048;
      uint64_t v24 = 32;
      id v15 = "Non-compliant signature: r is %lld bytes, expected %lld";
LABEL_22:
      v16 = v14;
      uint32_t v17 = 22;
      goto LABEL_23;
    }
LABEL_24:

    id v13 = 0;
    goto LABEL_25;
  }
  if (!-[SecJWSEncoder appendPaddedToData:ptr:len:expected:](self, "appendPaddedToData:ptr:len:expected:", v10, v26, 32))
  {
    id v14 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v21 = 134218240;
      uint64_t v22 = *((void *)&v26 + 1);
      __int16 v23 = 2048;
      uint64_t v24 = 32;
      id v15 = "Non-compliant signature: s is %lld bytes, expected %lld";
      goto LABEL_22;
    }
    goto LABEL_24;
  }
  id v13 = [(SecJWSEncoder *)self base64URLEncodedStringRepresentationWithData:v10];
LABEL_25:
  CFRelease(v7);

LABEL_26:

  return v13;
}

- (BOOL)appendPaddedToData:(id)a3 ptr:(const char *)a4 len:(unint64_t)a5 expected:(unint64_t)a6
{
  id v9 = a3;
  if (a5 <= a6)
  {
    if (a5 < a6)
    {
      char v15 = 0;
      do
      {
        [v9 appendBytes:&v15 length:1];
        --a6;
      }
      while (a5 != a6);
    }
    a6 = a5;
    goto LABEL_13;
  }
  if (!*a4)
  {
    do
    {
      int v10 = *(unsigned __int8 *)++a4;
      --a5;
      if (v10) {
        BOOL v11 = 0;
      }
      else {
        BOOL v11 = a5 > a6;
      }
    }
    while (v11);
  }
  if (a5 == a6)
  {
LABEL_13:
    id v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a4 length:a6];
    [v9 appendData:v13];

    BOOL v12 = 1;
    goto LABEL_14;
  }
  BOOL v12 = 0;
LABEL_14:

  return v12;
}

- (id)jwkPublicKey
{
  v19[4] = *MEMORY[0x1E4F143B8];
  CFErrorRef v17 = 0;
  CFDataRef v3 = SecKeyCopyExternalRepresentation(self->_publicKey, &v17);
  if (v3)
  {
    CFDataRef v4 = v3;
    id v5 = (unsigned char *)[(__CFData *)v4 bytes];
    BOOL v6 = (unint64_t)[(__CFData *)v4 length] < 0x41 || v5 == 0;
    if (v6 || *v5 != 4)
    {
      id v14 = 0;
    }
    else
    {
      CFDataRef v7 = v5 + 1;
      unint64_t v8 = [(__CFData *)v4 length] - 1;
      uint64_t v9 = [(__CFData *)v4 length] + ~(v8 >> 1);
      int v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v5 + 1 length:v8 >> 1];
      BOOL v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v7[v8 >> 1] length:v9];
      BOOL v12 = [(SecJWSEncoder *)self base64URLEncodedStringRepresentationWithData:v10];
      id v13 = [(SecJWSEncoder *)self base64URLEncodedStringRepresentationWithData:v11];
      v18[0] = @"kty";
      v18[1] = @"crv";
      v19[0] = @"EC";
      v19[1] = @"P-256";
      v18[2] = @"x";
      v18[3] = @"y";
      void v19[2] = v12;
      v19[3] = v13;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];
    }
    CFRelease(v4);
    id v15 = v14;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)createKeyPair
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  v11[0] = @"type";
  v11[1] = @"bsiz";
  v12[0] = @"73";
  v12[1] = &unk_1ED86CCA8;
  CFDictionaryRef v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  RandomKey = SecKeyCreateRandomKey(v3, (CFErrorRef *)&v10);
  self->_privateKey = RandomKey;
  if (RandomKey)
  {
    id v5 = SecKeyCopyPublicKey(RandomKey);
    self->_publicKey = v5;
    if (self->_privateKey)
    {
      if ((unint64_t)v5 | v10)
      {
        if (!v10) {
          goto LABEL_12;
        }
        goto LABEL_8;
      }
LABEL_7:
      uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-26275 userInfo:0];
      if (!v10) {
        goto LABEL_12;
      }
LABEL_8:
      privateKey = self->_privateKey;
      if (privateKey)
      {
        self->_privateKey = 0;
        CFRelease(privateKey);
      }
      goto LABEL_10;
    }
  }
  if (!v10) {
    goto LABEL_7;
  }
LABEL_10:
  publicKey = self->_publicKey;
  if (publicKey)
  {
    self->_publicKey = 0;
    CFRelease(publicKey);
  }
LABEL_12:
  CFErrorRef v8 = (CFErrorRef)v10;

  return v8;
}

- (void)dealloc
{
  publicKey = self->_publicKey;
  if (publicKey)
  {
    self->_publicKey = 0;
    CFRelease(publicKey);
  }
  privateKey = self->_privateKey;
  if (privateKey)
  {
    self->_privateKey = 0;
    CFRelease(privateKey);
  }
  v5.receiver = self;
  v5.super_class = (Class)SecJWSEncoder;
  [(SecJWSEncoder *)&v5 dealloc];
}

- (SecJWSEncoder)initWithPublicKey:(__SecKey *)a3 privateKey:(__SecKey *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SecJWSEncoder;
  result = [(SecJWSEncoder *)&v7 init];
  if (result)
  {
    result->_publicKey = a3;
    result->_privateKey = a4;
  }
  return result;
}

- (SecJWSEncoder)init
{
  v3.receiver = self;
  v3.super_class = (Class)SecJWSEncoder;
  return [(SecJWSEncoder *)&v3 init];
}

@end