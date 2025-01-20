@interface HKHealthWrapEncryptor
- (BOOL)_appendEncryptedBytes:(const char *)a3 length:(unint64_t)a4 error:(id *)a5;
- (BOOL)_finalizeCryptorWithError:(id *)a3;
- (BOOL)_startCryptorWithError:(id *)a3;
- (BOOL)_updateCryptorWithData:(id)a3 error:(id *)a4;
- (BOOL)_updateHeaderWithKey:(id)a3 iv:(id)a4 hmacKey:(id)a5 error:(id *)a6;
- (BOOL)_writeStream:(const char *)a3 length:(unint64_t)a4 hash:(BOOL)a5 error:(id *)a6;
- (BOOL)finalizeWithError:(id *)a3;
- (BOOL)startWithError:(id *)a3;
- (HKHealthWrapEncryptor)initWithOutputStream:(id)a3 certificate:(__SecCertificate *)a4 algorithm:(unsigned int)a5 options:(unsigned int)a6 keySize:(unsigned int)a7 uuid:(id)a8 studyUUID:(id)a9 compressionEnabled:(BOOL)a10;
- (__SecKey)_copyAndVerifyPublicKeyFromCertificate:(__SecCertificate *)a3 error:(id *)a4;
- (id)_encryptData:(id)a3 withCertificate:(__SecCertificate *)a4 error:(id *)a5;
- (void)dealloc;
@end

@implementation HKHealthWrapEncryptor

- (HKHealthWrapEncryptor)initWithOutputStream:(id)a3 certificate:(__SecCertificate *)a4 algorithm:(unsigned int)a5 options:(unsigned int)a6 keySize:(unsigned int)a7 uuid:(id)a8 studyUUID:(id)a9 compressionEnabled:(BOOL)a10
{
  id v16 = a3;
  id v17 = a8;
  id v18 = a9;
  v24.receiver = self;
  v24.super_class = (Class)HKHealthWrapEncryptor;
  v19 = [(HKHealthWrapEncryptor *)&v24 init];
  if (v19)
  {
    if (!a4)
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2, v19, @"HKHealthWrapEncryptor.m", 67, @"Invalid parameter not satisfying: %@", @"certificate != NULL" object file lineNumber description];
    }
    objc_storeStrong((id *)&v19->_outputStream, a3);
    v19->_certificate = (__SecCertificate *)CFRetain(a4);
    v19->_algorithm = a5;
    v19->_options = a6;
    v19->_keySize = a7;
    v19->_cryptor = 0;
    objc_storeStrong((id *)&v19->_uuid, a8);
    objc_storeStrong((id *)&v19->_studyUUID, a9);
    v19->_hmacAlgorithm = 2;
    v19->_encryptedBytesCount = 0;
    v19->_compressionEnabled = a10;
  }

  return v19;
}

- (void)dealloc
{
  certificate = self->_certificate;
  if (certificate)
  {
    CFRelease(certificate);
    self->_certificate = 0;
  }
  cryptor = self->_cryptor;
  if (cryptor)
  {
    CCCryptorRelease(cryptor);
    self->_cryptor = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)HKHealthWrapEncryptor;
  [(HKHealthWrapEncryptor *)&v5 dealloc];
}

- (__SecKey)_copyAndVerifyPublicKeyFromCertificate:(__SecCertificate *)a3 error:(id *)a4
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HKHealthWrapEncryptor.m", 95, @"Invalid parameter not satisfying: %@", @"certificate != NULL" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"HKHealthWrapEncryptor.m", 96, @"Invalid parameter not satisfying: %@", @"error != NULL" object file lineNumber description];

LABEL_3:
  v8 = SecCertificateCopyKey(a3);
  if (!v8) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 100, @"No public key found in certificate");
  }
  return v8;
}

- (id)_encryptData:(id)a3 withCertificate:(__SecCertificate *)a4 error:(id *)a5
{
  CFDataRef v9 = (const __CFData *)a3;
  if (v9)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_15:
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HKHealthWrapEncryptor.m", 117, @"Invalid parameter not satisfying: %@", @"certificate != NULL" object file lineNumber description];

    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_16;
  }
  id v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"HKHealthWrapEncryptor.m", 116, @"Invalid parameter not satisfying: %@", @"data != nil" object file lineNumber description];

  if (!a4) {
    goto LABEL_15;
  }
LABEL_3:
  if (a5) {
    goto LABEL_4;
  }
LABEL_16:
  id v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"HKHealthWrapEncryptor.m", 118, @"Invalid parameter not satisfying: %@", @"error != NULL" object file lineNumber description];

LABEL_4:
  v10 = [(HKHealthWrapEncryptor *)self _copyAndVerifyPublicKeyFromCertificate:a4 error:a5];
  if (v10)
  {
    v11 = v10;
    CFErrorRef error = 0;
    CFDataRef v12 = SecKeyCreateEncryptedData(v10, (SecKeyAlgorithm)*MEMORY[0x1E4F3BAB8], v9, &error);
    CFRelease(v11);
    v13 = error;
    v14 = v13;
    if (v13)
    {
      if (a5) {
        *a5 = v13;
      }
      else {
        _HKLogDroppedError(v13);
      }
    }
  }
  else
  {
    CFDataRef v12 = 0;
  }

  return v12;
}

- (BOOL)_updateHeaderWithKey:(id)a3 iv:(id)a4 hmacKey:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_11:
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"HKHealthWrapEncryptor.m", 141, @"Invalid parameter not satisfying: %@", @"iv != nil" object file lineNumber description];

    if (a6) {
      goto LABEL_4;
    }
    goto LABEL_12;
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"HKHealthWrapEncryptor.m", 140, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];

  if (!v12) {
    goto LABEL_11;
  }
LABEL_3:
  if (a6) {
    goto LABEL_4;
  }
LABEL_12:
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"HKHealthWrapEncryptor.m", 142, @"Invalid parameter not satisfying: %@", @"error != NULL" object file lineNumber description];

LABEL_4:
  v14 = objc_alloc_init(HKHealthWrapCodableMessageKey);
  [(HKHealthWrapCodableMessageKey *)v14 setKey:v11];
  [(HKHealthWrapCodableMessageKey *)v14 setIv:v12];
  v15 = [(HKHealthWrapCodableMessageKey *)v14 data];
  id v16 = [(HKHealthWrapEncryptor *)self _encryptData:v15 withCertificate:self->_certificate error:a6];

  if (v16)
  {
    [(HKHealthWrapCodableMessageHeader *)self->_header setEncryptedMessageKey:v16];
    id v17 = [(HKHealthWrapEncryptor *)self _encryptData:v13 withCertificate:self->_certificate error:a6];
    BOOL v18 = v17 != 0;
    if (v17) {
      [(HKHealthWrapCodableMessageHeader *)self->_header setEncryptedHMACKey:v17];
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)_startCryptorWithError:(id *)a3
{
  self->_encryptedBytesCount = 0;
  CCCryptorRef cryptorRef = 0;
  objc_super v5 = [MEMORY[0x1E4F1CA58] dataWithLength:16];
  v6 = (const __SecRandom *)*MEMORY[0x1E4F3BC60];
  size_t v7 = [v5 length];
  id v8 = v5;
  if (!SecRandomCopyBytes(v6, v7, (void *)[v8 mutableBytes]))
  {
    v10 = [MEMORY[0x1E4F1CA58] dataWithLength:self->_keySize];
    size_t keySize = self->_keySize;
    id v12 = v10;
    if (SecRandomCopyBytes(v6, keySize, (void *)[v12 mutableBytes]))
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 100, @"Key generation: %d", *__error());
      BOOL v9 = 0;
LABEL_14:

      goto LABEL_15;
    }
    id v13 = [MEMORY[0x1E4F1CA58] dataWithLength:32];
    if (SecRandomCopyBytes(v6, 0x20uLL, (void *)[v13 mutableBytes]))
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 100, @"HMAC key generation: %d", *__error());
    }
    else if ([(HKHealthWrapEncryptor *)self _updateHeaderWithKey:v12 iv:v8 hmacKey:v13 error:a3])
    {
      CCHmacInit((CCHmacContext *)&self->_hmacContext, self->_hmacAlgorithm, (const void *)[v13 bytes], 0x20uLL);
      id v14 = v8;
      CCHmacUpdate((CCHmacContext *)&self->_hmacContext, (const void *)[v14 bytes], objc_msgSend(v14, "length"));
      v15 = [(HKHealthWrapCodableMessageHeader *)self->_header studyUUID];
      if ([v15 length])
      {
        id v16 = v15;
        CCHmacUpdate((CCHmacContext *)&self->_hmacContext, (const void *)[v16 bytes], objc_msgSend(v16, "length"));
      }
      unsigned int data = bswap32([(HKHealthWrapCodableMessageHeader *)self->_header trailingHMACLength]);
      unsigned int v19 = bswap32([(HKHealthWrapCodableMessageHeader *)self->_header trailingSHALength]);
      CCHmacUpdate((CCHmacContext *)&self->_hmacContext, &data, 4uLL);
      CCHmacUpdate((CCHmacContext *)&self->_hmacContext, &v19, 4uLL);
      uint64_t v17 = CCCryptorCreate(0, self->_algorithm, self->_options, (const void *)[v12 bytes], self->_keySize, (const void *)objc_msgSend(objc_retainAutorelease(v14), "bytes"), &cryptorRef);
      BOOL v9 = v17 == 0;
      if (v17) {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 100, @"cryptor create: %d", v17);
      }
      else {
        self->_cryptor = cryptorRef;
      }

      goto LABEL_13;
    }
    BOOL v9 = 0;
LABEL_13:

    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 100, @"IV generation: %d", *__error());
  BOOL v9 = 0;
LABEL_15:

  return v9;
}

- (BOOL)startWithError:(id *)a3
{
  CC_SHA256_Init(&self->_sha256Context);
  objc_super v5 = objc_alloc_init(HKHealthWrapCodableMessageHeader);
  header = self->_header;
  self->_header = v5;

  [(HKHealthWrapCodableMessageHeader *)self->_header setVersion:3];
  size_t v7 = [(NSUUID *)self->_uuid hk_dataForUUIDBytes];
  [(HKHealthWrapCodableMessageHeader *)self->_header setUploadUUID:v7];

  id v8 = [(NSUUID *)self->_studyUUID hk_dataForUUIDBytes];
  [(HKHealthWrapCodableMessageHeader *)self->_header setStudyUUID:v8];

  [(HKHealthWrapCodableMessageHeader *)self->_header setTrailingHMACLength:32];
  [(HKHealthWrapCodableMessageHeader *)self->_header setTrailingSHALength:32];
  [(HKHealthWrapCodableMessageHeader *)self->_header setCompressed:self->_compressionEnabled];
  BOOL v9 = [MEMORY[0x1E4F1CA58] dataWithLength:0x2000];
  buffer = self->_buffer;
  self->_buffer = v9;

  if (self->_buffer && self->_header)
  {
    CFDataRef v11 = SecCertificateCopyData(self->_certificate);
    if (v11)
    {
      [(HKHealthWrapCodableMessageHeader *)self->_header setEncryptionIdentity:v11];
      if ([(HKHealthWrapEncryptor *)self _startCryptorWithError:a3])
      {
        [(NSOutputStream *)self->_outputStream open];
        id v12 = [(HKHealthWrapCodableMessageHeader *)self->_header data];
        unsigned int v16 = bswap32([v12 length]);
        if ([(HKHealthWrapEncryptor *)self _writeStream:&v16 length:4 hash:1 error:a3])
        {
          id v13 = v12;
          BOOL v14 = -[HKHealthWrapEncryptor _writeStream:length:hash:error:](self, "_writeStream:length:hash:error:", [v13 bytes], objc_msgSend(v13, "length"), 1, a3);
        }
        else
        {
          BOOL v14 = 0;
        }

        goto LABEL_12;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 100, @"Could not copy certificate");
    }
    BOOL v14 = 0;
LABEL_12:

    return v14;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 100, @"Could not allocate buffer or header");
  return 0;
}

- (BOOL)_writeStream:(const char *)a3 length:(unint64_t)a4 hash:(BOOL)a5 error:(id *)a6
{
  unint64_t v7 = a4;
  id v8 = a3;
  if (a5)
  {
    if (a4 >= 0xFFFFFFFF) {
      -[HKHealthWrapEncryptor _writeStream:length:hash:error:]();
    }
    CC_SHA256_Update(&self->_sha256Context, a3, a4);
  }
  if (!v7) {
    return 1;
  }
  while (1)
  {
    uint64_t v10 = [(NSOutputStream *)self->_outputStream write:v8 maxLength:v7];
    if (v10 <= 0) {
      break;
    }
    BOOL v11 = v7 >= v10;
    v7 -= v10;
    if (!v11) {
      -[HKHealthWrapEncryptor _writeStream:length:hash:error:]();
    }
    v8 += v10;
    if (!v7) {
      return 1;
    }
  }
  if (!a6) {
    return 0;
  }
  id v13 = [(NSOutputStream *)self->_outputStream streamError];
  BOOL result = 0;
  *a6 = v13;
  return result;
}

- (BOOL)_appendEncryptedBytes:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  CCHmacUpdate((CCHmacContext *)&self->_hmacContext, a3, a4);
  self->_encryptedBytesCount += a4;

  return [(HKHealthWrapEncryptor *)self _writeStream:a3 length:a4 hash:1 error:a5];
}

- (BOOL)_updateCryptorWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 length];
  id v8 = v6;
  uint64_t v9 = [v8 bytes];
  if ([v8 length])
  {
    unint64_t v10 = 0;
    while (1)
    {
      size_t v11 = v7 - v10 >= 0x1FF0 ? 8176 : v7 - v10;
      size_t dataOutMoved = 0;
      uint64_t v12 = CCCryptorUpdate(self->_cryptor, (const void *)(v9 + v10), v11, [(NSMutableData *)self->_buffer mutableBytes], 0x2000uLL, &dataOutMoved);
      if (v12) {
        break;
      }
      if (dataOutMoved)
      {
        uint64_t v13 = [(NSMutableData *)self->_buffer bytes];
        if (![(HKHealthWrapEncryptor *)self _appendEncryptedBytes:v13 length:dataOutMoved error:a4])goto LABEL_12; {
      }
        }
      v10 += v11;
      if (v10 >= [v8 length]) {
        goto LABEL_10;
      }
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 100, @"crpytor update: %d", v12);
LABEL_12:
    BOOL v14 = 0;
  }
  else
  {
LABEL_10:
    BOOL v14 = 1;
  }

  return v14;
}

- (BOOL)_finalizeCryptorWithError:(id *)a3
{
  size_t dataOutMoved = 0;
  uint64_t v5 = CCCryptorFinal(self->_cryptor, [(NSMutableData *)self->_buffer mutableBytes], 0x2000uLL, &dataOutMoved);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 100, @"crpytor update: %d", v5);
    LOBYTE(v6) = 0;
  }
  else if (!dataOutMoved {
         || (uint64_t v7 = [(NSMutableData *)self->_buffer bytes],
  }
             BOOL v6 = [(HKHealthWrapEncryptor *)self _appendEncryptedBytes:v7 length:dataOutMoved error:a3]))
  {
    unint64_t data = bswap64(self->_encryptedBytesCount);
    CCHmacUpdate((CCHmacContext *)&self->_hmacContext, &data, 8uLL);
    LOBYTE(v6) = [(HKHealthWrapEncryptor *)self _writeStream:&data length:8 hash:1 error:a3];
  }
  return v6;
}

- (BOOL)finalizeWithError:(id *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (-[HKHealthWrapEncryptor _finalizeCryptorWithError:](self, "_finalizeCryptorWithError:")
    && (CCHmacFinal((CCHmacContext *)&self->_hmacContext, macOut),
        [(HKHealthWrapEncryptor *)self _writeStream:macOut length:32 hash:1 error:a3]))
  {
    CC_SHA256_Final(md, &self->_sha256Context);
    BOOL v5 = [(HKHealthWrapEncryptor *)self _writeStream:md length:32 hash:0 error:a3];
    if (v5) {
      [(NSOutputStream *)self->_outputStream close];
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_studyUUID, 0);
  objc_storeStrong((id *)&self->_buffer, 0);

  objc_storeStrong((id *)&self->_outputStream, 0);
}

- (void)_writeStream:length:hash:error:.cold.1()
{
}

- (void)_writeStream:length:hash:error:.cold.2()
{
  __assert_rtn("-[HKHealthWrapEncryptor _writeStream:length:hash:error:]", "HKHealthWrapEncryptor.m", 280, "(size_t)bytesWritten <= length");
}

@end