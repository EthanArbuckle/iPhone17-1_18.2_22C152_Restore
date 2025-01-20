@interface HAPSecuritySessionEncryption
- (HAPSecuritySessionEncryption)init;
- (HAPSecuritySessionEncryption)initWithInputKey:(id)a3 outputKey:(id)a4;
- (NSData)inputKey;
- (NSData)outputKey;
- (NSMutableData)inputNonce;
- (NSMutableData)outputNonce;
- (id)decrypt:(const void *)a3 length:(unint64_t)a4 additionalAuthData:(const void *)a5 additionalAuthDataLength:(unint64_t)a6 authTagData:(const void *)a7 authTagDataLength:(unint64_t)a8 error:(id *)a9;
- (id)decrypt:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5;
- (id)encrypt:(id)a3 additionalAuthenticatedData:(id)a4;
- (void)setInputKey:(id)a3;
- (void)setInputNonce:(id)a3;
- (void)setOutputKey:(id)a3;
- (void)setOutputNonce:(id)a3;
@end

@implementation HAPSecuritySessionEncryption

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputNonce, 0);
  objc_storeStrong((id *)&self->_outputKey, 0);
  objc_storeStrong((id *)&self->_inputNonce, 0);

  objc_storeStrong((id *)&self->_inputKey, 0);
}

- (void)setOutputNonce:(id)a3
{
}

- (NSMutableData)outputNonce
{
  return self->_outputNonce;
}

- (void)setOutputKey:(id)a3
{
}

- (NSData)outputKey
{
  return self->_outputKey;
}

- (void)setInputNonce:(id)a3
{
}

- (NSMutableData)inputNonce
{
  return self->_inputNonce;
}

- (void)setInputKey:(id)a3
{
}

- (NSData)inputKey
{
  return self->_inputKey;
}

- (id)decrypt:(const void *)a3 length:(unint64_t)a4 additionalAuthData:(const void *)a5 additionalAuthDataLength:(unint64_t)a6 authTagData:(const void *)a7 authTagDataLength:(unint64_t)a8 error:(id *)a9
{
  if (a9)
  {
    *a9 = 0;
    if (a8 != 16)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hmfErrorWithCode:userInfo:", 3, 0, a5, a6, a7);
      id v10 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
  }
  else if (a8 != 16)
  {
    id v10 = 0;
    goto LABEL_19;
  }
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:a4];
  id v12 = [(HAPSecuritySessionEncryption *)self inputKey];
  [v12 bytes];
  id v13 = [(HAPSecuritySessionEncryption *)self inputNonce];
  [v13 bytes];
  id v14 = v11;
  [v14 mutableBytes];
  uint64_t v15 = chacha20_poly1305_decrypt_all_64x64();

  id v16 = [(HAPSecuritySessionEncryption *)self inputNonce];
  v17 = (unsigned char *)[v16 mutableBytes];
  v18 = [(HAPSecuritySessionEncryption *)self inputNonce];
  uint64_t v19 = [v18 length];
  if (v19)
  {
    uint64_t v20 = v19 - 1;
    do
    {
      if (++*v17++) {
        BOOL v22 = 1;
      }
      else {
        BOOL v22 = v20 == 0;
      }
      --v20;
    }
    while (!v22);
  }

  if (v15)
  {
    if (a9)
    {
      HMErrorFromOSStatus(v15);
      id v10 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = v14;
  }

LABEL_19:

  return v10;
}

- (id)decrypt:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5) {
    *a5 = 0;
  }
  objc_msgSend(v8, "subdataWithRange:", objc_msgSend(v8, "length", a5) - 16, 16);
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  id v35 = v8;
  id v10 = objc_msgSend(v8, "subdataWithRange:", 0, objc_msgSend(v8, "length") - 16);
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithLength:", objc_msgSend(v10, "length"));
  id v12 = [(HAPSecuritySessionEncryption *)self inputKey];
  [v12 bytes];
  id v13 = [(HAPSecuritySessionEncryption *)self inputNonce];
  [v13 bytes];
  id v14 = v9;
  [v14 bytes];
  v34 = v14;
  [v14 length];
  id v15 = v10;
  [v15 bytes];
  [v15 length];
  id v33 = v11;
  [v33 mutableBytes];
  id v32 = v31;
  [v32 bytes];
  int v16 = chacha20_poly1305_decrypt_all_64x64();

  id v17 = [(HAPSecuritySessionEncryption *)self inputNonce];
  v18 = (unsigned char *)[v17 mutableBytes];
  uint64_t v19 = [(HAPSecuritySessionEncryption *)self inputNonce];
  uint64_t v20 = [v19 length];
  if (v20)
  {
    uint64_t v21 = v20 - 1;
    do
    {
      if (++*v18++) {
        BOOL v23 = 1;
      }
      else {
        BOOL v23 = v21 == 0;
      }
      --v21;
    }
    while (!v23);
  }

  if (v16)
  {
    v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:v16 userInfo:0];
    v25 = v24;
    v26 = v35;
    v27 = v33;
    if (v30) {
      void *v30 = v24;
    }

    id v28 = 0;
  }
  else
  {
    v27 = v33;
    id v28 = v33;
    v26 = v35;
  }

  return v28;
}

- (id)encrypt:(id)a3 additionalAuthenticatedData:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithLength:", objc_msgSend(v6, "length"));
  id v9 = [(HAPSecuritySessionEncryption *)self outputKey];
  [v9 bytes];
  id v10 = [(HAPSecuritySessionEncryption *)self outputNonce];
  [v10 bytes];
  id v11 = v7;
  [v11 bytes];
  [v11 length];
  id v12 = v6;
  [v12 bytes];
  [v12 length];
  id v13 = v8;
  [v13 mutableBytes];
  chacha20_poly1305_encrypt_all_64x64();

  [v13 appendBytes:v22 length:16];
  id v14 = [(HAPSecuritySessionEncryption *)self outputNonce];
  id v15 = (unsigned char *)[v14 mutableBytes];
  int v16 = [(HAPSecuritySessionEncryption *)self outputNonce];
  uint64_t v17 = [v16 length];
  if (v17)
  {
    uint64_t v18 = v17 - 1;
    do
    {
      if (++*v15++) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = v18 == 0;
      }
      --v18;
    }
    while (!v20);
  }

  return v13;
}

- (HAPSecuritySessionEncryption)initWithInputKey:(id)a3 outputKey:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HAPSecuritySessionEncryption;
  id v9 = [(HAPSecuritySessionEncryption *)&v16 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_inputKey, a3);
    objc_storeStrong((id *)&v10->_outputKey, a4);
    memset_s(__s, 8uLL, 0, 8uLL);
    uint64_t v11 = [MEMORY[0x1E4F1CA58] dataWithBytes:__s length:8];
    inputNonce = v10->_inputNonce;
    v10->_inputNonce = (NSMutableData *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA58] dataWithBytes:__s length:8];
    outputNonce = v10->_outputNonce;
    v10->_outputNonce = (NSMutableData *)v13;
  }
  return v10;
}

- (HAPSecuritySessionEncryption)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPSecuritySessionEncryption;
  return [(HAPSecuritySessionEncryption *)&v3 init];
}

@end