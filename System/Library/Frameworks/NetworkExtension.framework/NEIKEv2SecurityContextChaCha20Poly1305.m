@interface NEIKEv2SecurityContextChaCha20Poly1305
- (id)constructEncryptedPacketFromPayloadData:(id)a3 authenticatedHeaders:(id)a4;
- (id)decryptPayloadData:(id)a3 authenticatedHeaders:(id)a4;
- (id)initWithEncryptionProtocol:(void *)a3 outgoingEncryptionKey:(void *)a4 incomingEncryptionKey:;
@end

@implementation NEIKEv2SecurityContextChaCha20Poly1305

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingEncryptionSalt, 0);
  objc_storeStrong((id *)&self->_outgoingEncryptionSalt, 0);
  objc_storeStrong((id *)&self->_incomingEncryptionContext, 0);

  objc_storeStrong((id *)&self->_outgoingEncryptionContext, 0);
}

- (id)decryptPayloadData:(id)a3 authenticatedHeaders:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_36;
    }
    *(_DWORD *)__s = 136315138;
    *(void *)&__s[4] = "-[NEIKEv2SecurityContextChaCha20Poly1305 decryptPayloadData:authenticatedHeaders:]";
    v22 = "%s called with null payloadData";
LABEL_23:
    _os_log_fault_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_FAULT, v22, __s, 0xCu);
    goto LABEL_36;
  }
  if (!v7)
  {
    v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_36;
    }
    *(_DWORD *)__s = 136315138;
    *(void *)&__s[4] = "-[NEIKEv2SecurityContextChaCha20Poly1305 decryptPayloadData:authenticatedHeaders:]";
    v22 = "%s called with null authenticatedHeaders";
    goto LABEL_23;
  }
  unsigned int v9 = [v6 length];
  unsigned int v10 = v9;
  if (self)
  {
    if (self->super._minimumEncryptedPayloadSize > v9)
    {
      v12 = ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__s = 67109120;
        *(_DWORD *)&__s[4] = v10;
        _os_log_error_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_ERROR, "Cannot decrypt, encrypted data length %u too short", __s, 8u);
      }
      goto LABEL_36;
    }
    incomingEncryptionContext = self->_incomingEncryptionContext;
  }
  else
  {
    incomingEncryptionContext = 0;
  }
  v12 = incomingEncryptionContext;
  [v12 mutableBytes];
  ccchacha20poly1305_info();
  int v13 = ccchacha20poly1305_reset();
  if (!v13)
  {
    *(_DWORD *)&__s[8] = 0;
    *(void *)__s = 0;
    if (self) {
      incomingEncryptionSalt = self->_incomingEncryptionSalt;
    }
    else {
      incomingEncryptionSalt = 0;
    }
    [(NSData *)incomingEncryptionSalt getBytes:__s length:4];
    [v6 getBytes:&__s[4] length:8];
    int v15 = ccchacha20poly1305_setnonce();
    memset_s(__s, 0xCuLL, 0, 0xCuLL);
    if (v15)
    {
      v17 = ne_log_obj();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        goto LABEL_39;
      }
      int v31 = 67109120;
      int v32 = v15;
      v25 = "ccchacha20poly1305_setnonce failed: %d";
    }
    else
    {
      [v8 length];
      [v8 bytes];
      int v16 = ccchacha20poly1305_aad();
      if (!v16)
      {
        v17 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v10 - 24];
        [v6 bytes];
        [v17 mutableBytes];
        int v18 = ccchacha20poly1305_decrypt();
        if (v18)
        {
          int v27 = v18;
          v28 = ne_log_obj();
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
            goto LABEL_38;
          }
          int v31 = 67109120;
          int v32 = v27;
          v29 = "ccchacha20poly1305_decrypt failed: %d";
        }
        else
        {
          int v19 = ccchacha20poly1305_verify();
          if (!v19)
          {
            if (+[NEIKEv2SecurityContext removePaddingFromDecryptedPayload:]((uint64_t)NEIKEv2SecurityContext, v17))
            {
              v17 = v17;
              v20 = v17;
LABEL_15:

              goto LABEL_16;
            }
LABEL_39:
            v20 = 0;
            goto LABEL_15;
          }
          int v30 = v19;
          v28 = ne_log_obj();
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          {
LABEL_38:

            goto LABEL_39;
          }
          int v31 = 67109120;
          int v32 = v30;
          v29 = "ccchacha20poly1305_verify failed: %d";
        }
        _os_log_fault_impl(&dword_19DDAF000, v28, OS_LOG_TYPE_FAULT, v29, (uint8_t *)&v31, 8u);
        goto LABEL_38;
      }
      int v26 = v16;
      v17 = ne_log_obj();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        goto LABEL_39;
      }
      int v31 = 67109120;
      int v32 = v26;
      v25 = "ccchacha20poly1305_aad failed: %d";
    }
    _os_log_fault_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_FAULT, v25, (uint8_t *)&v31, 8u);
    goto LABEL_39;
  }
  int v23 = v13;
  v24 = ne_log_obj();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)__s = 67109120;
    *(_DWORD *)&__s[4] = v23;
    _os_log_fault_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_FAULT, "ccchacha20poly1305_reset failed: %d", __s, 8u);
  }

LABEL_36:
  v20 = 0;
LABEL_16:

  return v20;
}

- (id)constructEncryptedPacketFromPayloadData:(id)a3 authenticatedHeaders:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (self) {
      outgoingEncryptionContext = self->_outgoingEncryptionContext;
    }
    else {
      outgoingEncryptionContext = 0;
    }
    unsigned int v9 = outgoingEncryptionContext;
    [v9 mutableBytes];
    ccchacha20poly1305_info();
    id v10 = v6;
    uint64_t v11 = [v6 length];
    int v12 = [v7 length];
    unsigned int v13 = [(NEIKEv2SecurityContext *)self overheadForPlaintextLength:v11];
    int v14 = ccchacha20poly1305_reset();
    if (!v14)
    {
      *(_DWORD *)&__s[8] = 0;
      *(void *)__s = 0;
      if (self)
      {
        [(NSData *)self->_outgoingEncryptionSalt getBytes:__s length:4];
        unint64_t currentOutgoingIV = self->_currentOutgoingIV;
        self->_unint64_t currentOutgoingIV = currentOutgoingIV + 1;
      }
      else
      {
        [0 getBytes:__s length:4];
        unint64_t currentOutgoingIV = 0;
      }
      *(void *)&__s[4] = currentOutgoingIV;
      int v16 = ccchacha20poly1305_setnonce();
      if (v16)
      {
        int v25 = v16;
        memset_s(__s, 0xCuLL, 0, 0xCuLL);
        v17 = ne_log_obj();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v33 = v25;
          _os_log_fault_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_FAULT, "ccchacha20poly1305_setnonce failed: %d", buf, 8u);
        }
        v21 = 0;
        id v6 = v10;
        goto LABEL_12;
      }
      v17 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v12 + v11 + v13];
      [v17 appendData:v7];
      [v17 appendBytes:&__s[4] length:8];
      memset_s(__s, 0xCuLL, 0, 0xCuLL);
      [v17 appendData:v6];
      char v31 = 0;
      [v17 appendBytes:&v31 length:1];
      [v17 setLength:[v17 length] + 16];
      [v17 bytes];
      int v18 = ccchacha20poly1305_aad();
      if (v18)
      {
        int v26 = v18;
        int v27 = ne_log_obj();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v33 = v26;
          _os_log_fault_impl(&dword_19DDAF000, v27, OS_LOG_TYPE_FAULT, "ccchacha20poly1305_aad failed: %d", buf, 8u);
        }
        goto LABEL_27;
      }
      [v17 mutableBytes];
      int v19 = ccchacha20poly1305_encrypt();
      if (v19)
      {
        int v28 = v19;
        int v27 = ne_log_obj();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 67109120;
        int v33 = v28;
        v29 = "ccchacha20poly1305_encrypt failed: %d";
      }
      else
      {
        int v20 = ccchacha20poly1305_finalize();
        if (!v20)
        {
          v21 = v17;
LABEL_12:

          goto LABEL_13;
        }
        int v30 = v20;
        int v27 = ne_log_obj();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
LABEL_27:

          v21 = 0;
          goto LABEL_12;
        }
        *(_DWORD *)buf = 67109120;
        int v33 = v30;
        v29 = "ccchacha20poly1305_finalize failed: %d";
      }
      _os_log_fault_impl(&dword_19DDAF000, v27, OS_LOG_TYPE_FAULT, v29, buf, 8u);
      goto LABEL_27;
    }
    int v23 = v14;
    v24 = ne_log_obj();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__s = 67109120;
      *(_DWORD *)&__s[4] = v23;
      _os_log_fault_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_FAULT, "ccchacha20poly1305_reset failed: %d", __s, 8u);
    }

    v21 = 0;
    id v6 = v10;
  }
  else
  {
    unsigned int v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__s = 136315138;
      *(void *)&__s[4] = "-[NEIKEv2SecurityContextChaCha20Poly1305 constructEncryptedPacketFromPayloadData:authenticatedHeaders:]";
      _os_log_fault_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_FAULT, "%s called with null authenticatedHeaders", __s, 0xCu);
    }
    v21 = 0;
  }
LABEL_13:

  return v21;
}

- (id)initWithEncryptionProtocol:(void *)a3 outgoingEncryptionKey:(void *)a4 incomingEncryptionKey:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1) {
    goto LABEL_14;
  }
  if (!v7)
  {
    int v23 = ne_log_obj();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v35 = (uint64_t)"-[NEIKEv2SecurityContextChaCha20Poly1305 initWithEncryptionProtocol:outgoingEncryptionKey:incomingEncryptionKey:]";
    int v25 = "%s called with null encryptionProtocol";
    int v26 = v23;
    uint32_t v27 = 12;
    goto LABEL_20;
  }
  if (v7[2] != 28) {
    goto LABEL_14;
  }
  a1 = (id *)-[NEIKEv2SecurityContext initWithMinimumEncryptedPayloadSize:](a1, 25);
  if (!a1) {
    goto LABEL_14;
  }
  uint64_t v10 = [v8 bytes];
  uint64_t v11 = [v8 length];
  CFDataRef v12 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x1E4F1C9B8], (const UInt8 *)(v10 + v11 - 4), 4);
  id v13 = a1[4];
  a1[4] = v12;

  if (a1[4])
  {
    int v33 = 0;
    int v14 = +[NEIKEv2Crypto createRandomWithSize:]((uint64_t)NEIKEv2Crypto, 8u);
    [v14 getBytes:&v33 length:8];
    a1[6] = v33;
    int v15 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x1E4F1CA58], 256);
    if (v15)
    {
      ccchacha20poly1305_info();
      [(__CFData *)v15 mutableBytes];
      [v8 bytes];
      if (ccchacha20poly1305_init())
      {
        v21 = ne_log_obj();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
          goto LABEL_16;
        }
        *(_WORD *)buf = 0;
        int v28 = "ccchacha20poly1305_init failed";
      }
      else
      {
        objc_storeStrong(a1 + 2, v15);
        uint64_t v16 = [v9 bytes];
        uint64_t v17 = [v9 length];
        CFDataRef v18 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x1E4F1C9B8], (const UInt8 *)(v16 + v17 - 4), 4);
        id v19 = a1[5];
        a1[5] = v18;

        if (a1[5])
        {
          int v20 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x1E4F1CA58], 256);
          if (v20)
          {
            v21 = v20;
            ccchacha20poly1305_info();
            [v21 mutableBytes];
            [v9 bytes];
            if (!ccchacha20poly1305_init())
            {
              objc_storeStrong(a1 + 3, v21);
              v22 = a1;
LABEL_17:

              goto LABEL_18;
            }
            int v32 = ne_log_obj();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_19DDAF000, v32, OS_LOG_TYPE_FAULT, "ccchacha20poly1305_init failed", buf, 2u);
            }
          }
          else
          {
            char v31 = ne_log_obj();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 134217984;
              uint64_t v35 = 256;
              _os_log_fault_impl(&dword_19DDAF000, v31, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%zu] failed", buf, 0xCu);
            }

            v21 = 0;
          }
LABEL_16:
          v22 = 0;
          goto LABEL_17;
        }
        v21 = ne_log_obj();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
          goto LABEL_16;
        }
        *(_WORD *)buf = 0;
        int v28 = "[NESensitiveData sensitiveDataWithBytes:length:IKEv2_CRYPTO_CHACHAPOLY_SALT_LEN] failed";
      }
      v29 = v21;
      uint32_t v30 = 2;
    }
    else
    {
      v21 = ne_log_obj();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        goto LABEL_16;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v35 = 256;
      int v28 = "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%zu] failed";
      v29 = v21;
      uint32_t v30 = 12;
    }
    _os_log_fault_impl(&dword_19DDAF000, v29, OS_LOG_TYPE_FAULT, v28, buf, v30);
    goto LABEL_16;
  }
  int v23 = ne_log_obj();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    int v25 = "[NESensitiveData sensitiveDataWithBytes:length:IKEv2_CRYPTO_CHACHAPOLY_SALT_LEN] failed";
    int v26 = v23;
    uint32_t v27 = 2;
LABEL_20:
    _os_log_fault_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_FAULT, v25, buf, v27);
  }
LABEL_13:

LABEL_14:
  v22 = 0;
LABEL_18:

  return v22;
}

@end