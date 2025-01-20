@interface CUPairingStream
- (BOOL)decryptInputBytes:(const void *)a3 inputLength:(unint64_t)a4 inputAADBytes:(const void *)a5 inputAADLength:(unint64_t)a6 inputAuthTagPtr:(const void *)a7 inputAuthTagLength:(unint64_t)a8 outputBytes:(void *)a9 error:(id *)a10;
- (BOOL)encryptInputBytes:(const void *)a3 inputLength:(unint64_t)a4 inputAADBytes:(const void *)a5 inputAADLength:(unint64_t)a6 outputBytes:(void *)a7 outputAuthTagBytes:(void *)a8 outputAuthTagLength:(unint64_t)a9 error:(id *)a10;
- (BOOL)prepareWithName:(id)a3 isClient:(BOOL)a4 pskData:(id)a5 error:(id *)a6;
- (CUPairingStream)init;
- (NSString)name;
- (id)decryptData:(id)a3 aadBytes:(const void *)a4 aadLength:(unint64_t)a5 error:(id *)a6;
- (id)decryptData:(id)a3 aadData:(id)a4 error:(id *)a5;
- (id)encryptData:(id)a3 aadBytes:(const void *)a4 aadLength:(unint64_t)a5 error:(id *)a6;
- (id)encryptData:(id)a3 aadData:(id)a4 error:(id *)a5;
- (unint64_t)authTagLength;
- (void)_cleanup;
- (void)dealloc;
- (void)setAuthTagLength:(unint64_t)a3;
- (void)setName:(id)a3;
@end

@implementation CUPairingStream

- (void).cxx_destruct
{
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setAuthTagLength:(unint64_t)a3
{
  self->_authTagLength = a3;
}

- (unint64_t)authTagLength
{
  return self->_authTagLength;
}

- (BOOL)decryptInputBytes:(const void *)a3 inputLength:(unint64_t)a4 inputAADBytes:(const void *)a5 inputAADLength:(unint64_t)a6 inputAuthTagPtr:(const void *)a7 inputAuthTagLength:(unint64_t)a8 outputBytes:(void *)a9 error:(id *)a10
{
  decryptAEAD = self->_decryptAEAD;
  if (decryptAEAD)
  {
    decryptNonce = self->_decryptNonce;
    v23 = a7;
    uint64_t v13 = (*(uint64_t (**)(void))(*((void *)decryptAEAD + 2) + 24))();
    uint64_t v14 = 0;
    do
    {
      if (++decryptNonce[v14]) {
        BOOL v16 = 1;
      }
      else {
        BOOL v16 = v14 == 11;
      }
      ++v14;
    }
    while (!v16);
    if (!v13)
    {
      BOOL v17 = 0;
      id v18 = 0;
      goto LABEL_10;
    }
    v21 = "DecryptFailed";
  }
  else
  {
    v21 = "DecryptWhenNotOpen";
    uint64_t v13 = 4294960541;
  }
  NSErrorWithOSStatusF(v13, (uint64_t)v21, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)a7, a8, (uint64_t)v23);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v17 = v18 != 0;
  if (a10) {
    BOOL v22 = v18 == 0;
  }
  else {
    BOOL v22 = 1;
  }
  if (!v22)
  {
    id v18 = v18;
    *a10 = v18;
    BOOL v17 = 1;
  }
LABEL_10:
  BOOL v19 = !v17;

  return v19;
}

- (BOOL)encryptInputBytes:(const void *)a3 inputLength:(unint64_t)a4 inputAADBytes:(const void *)a5 inputAADLength:(unint64_t)a6 outputBytes:(void *)a7 outputAuthTagBytes:(void *)a8 outputAuthTagLength:(unint64_t)a9 error:(id *)a10
{
  encryptAEAD = self->_encryptAEAD;
  if (encryptAEAD)
  {
    encryptNonce = self->_encryptNonce;
    v23 = a8;
    uint64_t v13 = (*(uint64_t (**)(void))(*((void *)encryptAEAD + 2) + 16))();
    uint64_t v14 = 0;
    do
    {
      if (++encryptNonce[v14]) {
        BOOL v16 = 1;
      }
      else {
        BOOL v16 = v14 == 11;
      }
      ++v14;
    }
    while (!v16);
    if (!v13)
    {
      BOOL v17 = 0;
      id v18 = 0;
      goto LABEL_10;
    }
    v21 = "EncryptFailed";
  }
  else
  {
    v21 = "EncryptWhenNotOpen";
    uint64_t v13 = 4294960541;
  }
  NSErrorWithOSStatusF(v13, (uint64_t)v21, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)a7, (uint64_t)a8, (uint64_t)v23);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v17 = v18 != 0;
  if (a10) {
    BOOL v22 = v18 == 0;
  }
  else {
    BOOL v22 = 1;
  }
  if (!v22)
  {
    id v18 = v18;
    *a10 = v18;
    BOOL v17 = 1;
  }
LABEL_10:
  BOOL v19 = !v17;

  return v19;
}

- (id)decryptData:(id)a3 aadBytes:(const void *)a4 aadLength:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  unint64_t v11 = [v10 length];
  unint64_t v18 = v11;
  unint64_t authTagLength = self->_authTagLength;
  if (v11 < authTagLength)
  {
    NSErrorWithOSStatusF(4294960553, (uint64_t)"Data too small for auth tag (%zu bytes)", v12, v13, v14, v15, v16, v17, v11);
LABEL_18:
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  uint64_t v20 = [v10 bytes];
  size_t v21 = v18 - authTagLength;
  if (!v21)
  {
    BOOL v22 = 0;
    goto LABEL_5;
  }
  BOOL v22 = malloc_type_malloc(v21, 0xD22C6E17uLL);
  if (!v22)
  {
    NSErrorWithOSStatusF(4294960568, (uint64_t)"Malloc %zu bytes failed", v23, v24, v25, v26, v27, v28, v21);
    goto LABEL_18;
  }
LABEL_5:
  unint64_t v29 = self->_authTagLength;
  id v41 = 0;
  BOOL v30 = [(CUPairingStream *)self decryptInputBytes:v20 inputLength:v21 inputAADBytes:a4 inputAADLength:a5 inputAuthTagPtr:v20 + v21 inputAuthTagLength:v29 outputBytes:v22 error:&v41];
  id v31 = v41;
  if (v30)
  {
    if (v22)
    {
      id v38 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v22 length:v21];
      if (!v38)
      {
        uint64_t v39 = NSErrorWithOSStatusF(4294960541, (uint64_t)"NSData %zu bytes failed", v32, v33, v34, v35, v36, v37, v21);

        id v31 = (id)v39;
LABEL_16:
        free(v22);
        goto LABEL_19;
      }
    }
    else
    {
      id v38 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
    }

    id v31 = 0;
    goto LABEL_11;
  }
  if (v22) {
    goto LABEL_16;
  }
LABEL_19:
  id v38 = 0;
  if (a6 && v31)
  {
    id v31 = v31;
    id v38 = 0;
    *a6 = v31;
  }
LABEL_11:

  return v38;
}

- (id)decryptData:(id)a3 aadData:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v8 bytes];
  uint64_t v11 = [v8 length];

  uint64_t v12 = [(CUPairingStream *)self decryptData:v9 aadBytes:v10 aadLength:v11 error:a5];

  return v12;
}

- (id)encryptData:(id)a3 aadBytes:(const void *)a4 aadLength:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v11 = [v10 length];
  size_t v12 = self->_authTagLength + v11;
  uint64_t v13 = (char *)malloc_type_malloc(v12, 0x53A317BuLL);
  if (v13)
  {
    uint64_t v20 = v13;
    uint64_t v21 = [v10 bytes];
    unint64_t authTagLength = self->_authTagLength;
    id v35 = 0;
    BOOL v23 = [(CUPairingStream *)self encryptInputBytes:v21 inputLength:v11 inputAADBytes:a4 inputAADLength:a5 outputBytes:v20 outputAuthTagBytes:&v20[v11] outputAuthTagLength:authTagLength error:&v35];
    id v24 = v35;
    if (v23)
    {
      uint64_t v25 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v20 length:v12];
      if (v25)
      {
        uint64_t v32 = (void *)v25;

        id v24 = 0;
        goto LABEL_5;
      }
      uint64_t v34 = NSErrorWithOSStatusF(4294960568, (uint64_t)"NSData %zu bytes failed", v26, v27, v28, v29, v30, v31, v12);

      id v24 = (id)v34;
    }
    free(v20);
  }
  else
  {
    NSErrorWithOSStatusF(4294960568, (uint64_t)"Malloc %zu bytes failed", v14, v15, v16, v17, v18, v19, v12);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v32 = 0;
  if (a6 && v24)
  {
    id v24 = v24;
    uint64_t v32 = 0;
    *a6 = v24;
  }
LABEL_5:

  return v32;
}

- (id)encryptData:(id)a3 aadData:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v8 bytes];
  uint64_t v11 = [v8 length];

  size_t v12 = [(CUPairingStream *)self encryptData:v9 aadBytes:v10 aadLength:v11 error:a5];

  return v12;
}

- (BOOL)prepareWithName:(id)a3 isClient:(BOOL)a4 pskData:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  uint64_t v13 = [v12 bytes];
  uint64_t v14 = [v12 length];
  unsigned int v35 = 0;
  __s = 0;
  if (![v11 length])
  {
    if (!a6) {
      goto LABEL_35;
    }
    uint64_t v31 = "EmptyName";
    uint64_t v32 = 4294960552;
LABEL_34:
    NSErrorWithOSStatusF(v32, (uint64_t)v31, v15, v16, v17, v18, v19, v20, v33);
    BOOL v29 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  objc_storeStrong((id *)&self->_name, a3);
  if ((unint64_t)[v12 length] <= 0x1F)
  {
    if (!a6) {
      goto LABEL_35;
    }
    uint64_t v31 = "PSK too small";
    uint64_t v32 = 4294960553;
    goto LABEL_34;
  }
  if (v8) {
    uint64_t v21 = "ClientEncrypt-%@";
  }
  else {
    uint64_t v21 = "ServerEncrypt-%@";
  }
  ASPrintF((void **)&__s, (uint64_t)v21, v15, v16, v17, v18, v19, v20, (uint64_t)v11);
  BOOL v22 = __s;
  if (!__s)
  {
    if (!a6) {
      goto LABEL_35;
    }
    uint64_t v31 = "CreateEncryptInfoFailed";
    goto LABEL_28;
  }
  size_t v23 = strlen(__s);
  CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, v13, v14, "", 0, (uint64_t)__s, v23, 0x20uLL, (uint64_t)v36);
  free(v22);
  id v24 = (CryptoAEADPrivate *)CryptoAEADCreate((uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))kCryptoAEADDescriptorChaCha20Poly1305[0], 1, (uint64_t)v36, 32, (int *)&v35);
  self->_encryptAEAD = v24;
  if (!v24)
  {
    if (a6)
    {
      if (v35) {
        uint64_t v32 = v35;
      }
      else {
        uint64_t v32 = 4294960596;
      }
      uint64_t v31 = "CreateEncryptAEADFailed";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  if (v8) {
    uint64_t v25 = "ServerEncrypt-%@";
  }
  else {
    uint64_t v25 = "ClientEncrypt-%@";
  }
  ASPrintF((void **)&__s, (uint64_t)v25, v15, v16, v17, v18, v19, v20, (uint64_t)v11);
  uint64_t v26 = __s;
  if (!__s)
  {
    if (!a6) {
      goto LABEL_35;
    }
    uint64_t v31 = "CreateDecryptInfoFailed";
LABEL_28:
    uint64_t v32 = 4294960568;
    goto LABEL_34;
  }
  size_t v27 = strlen(__s);
  CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, v13, v14, "", 0, (uint64_t)__s, v27, 0x20uLL, (uint64_t)v36);
  free(v26);
  uint64_t v28 = (CryptoAEADPrivate *)CryptoAEADCreate((uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))kCryptoAEADDescriptorChaCha20Poly1305[0], 2, (uint64_t)v36, 32, (int *)&v35);
  self->_decryptAEAD = v28;
  if (!v28)
  {
    if (a6)
    {
      if (v35) {
        uint64_t v32 = v35;
      }
      else {
        uint64_t v32 = 4294960596;
      }
      uint64_t v31 = "CreateDecryptAEADFailed";
      goto LABEL_34;
    }
LABEL_35:
    BOOL v29 = 0;
    goto LABEL_14;
  }
  memset_s(v36, 0x20uLL, 0, 0x20uLL);
  BOOL v29 = 1;
LABEL_14:

  return v29;
}

- (void)_cleanup
{
  encryptAEAD = self->_encryptAEAD;
  if (encryptAEAD)
  {
    CFRelease(encryptAEAD);
    self->_encryptAEAD = 0;
  }
  decryptAEAD = self->_decryptAEAD;
  if (decryptAEAD)
  {
    CFRelease(decryptAEAD);
    self->_decryptAEAD = 0;
  }
}

- (void)dealloc
{
  [(CUPairingStream *)self _cleanup];
  v3.receiver = self;
  v3.super_class = (Class)CUPairingStream;
  [(CUPairingStream *)&v3 dealloc];
}

- (CUPairingStream)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUPairingStream;
  v2 = [(CUPairingStream *)&v6 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_unint64_t authTagLength = 16;
    v4 = v2;
  }

  return v3;
}

@end