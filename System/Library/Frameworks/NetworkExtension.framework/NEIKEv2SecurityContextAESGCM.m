@interface NEIKEv2SecurityContextAESGCM
- (id)constructEncryptedPacketFromPayloadData:(id)a3 authenticatedHeaders:(id)a4;
- (id)decryptPayloadData:(id)a3 authenticatedHeaders:(id)a4;
- (id)initWithEncryptionProtocol:(void *)a3 outgoingEncryptionKey:(void *)a4 incomingEncryptionKey:;
@end

@implementation NEIKEv2SecurityContextAESGCM

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingEncryptionSalt, 0);
  objc_storeStrong((id *)&self->_decryptionContext, 0);

  objc_storeStrong((id *)&self->_encryptionContext, 0);
}

- (id)decryptPayloadData:(id)a3 authenticatedHeaders:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_36;
    }
    int __s = 136315138;
    v34 = "-[NEIKEv2SecurityContextAESGCM decryptPayloadData:authenticatedHeaders:]";
    v22 = "%s called with null payloadData";
LABEL_23:
    _os_log_fault_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_FAULT, v22, (uint8_t *)&__s, 0xCu);
    goto LABEL_36;
  }
  if (!v7)
  {
    v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_36;
    }
    int __s = 136315138;
    v34 = "-[NEIKEv2SecurityContextAESGCM decryptPayloadData:authenticatedHeaders:]";
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
        int __s = 67109120;
        LODWORD(v34) = v10;
        _os_log_error_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_ERROR, "Cannot decrypt, encrypted data length %u too short", (uint8_t *)&__s, 8u);
      }
      goto LABEL_36;
    }
    decryptionContext = self->_decryptionContext;
  }
  else
  {
    decryptionContext = 0;
  }
  v12 = decryptionContext;
  [v12 mutableBytes];
  ccaes_gcm_decrypt_mode();
  int v13 = ccgcm_reset();
  if (!v13)
  {
    int v36 = 0;
    uint64_t v35 = 0;
    if (self) {
      incomingEncryptionSalt = self->_incomingEncryptionSalt;
    }
    else {
      incomingEncryptionSalt = 0;
    }
    [(NSData *)incomingEncryptionSalt getBytes:&v35 length:4];
    [v6 getBytes:(char *)&v35 + 4 length:8];
    int v15 = ccgcm_set_iv();
    if (v15)
    {
      int v25 = v15;
      v17 = ne_log_obj();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        goto LABEL_39;
      }
      int __s = 67109120;
      LODWORD(v34) = v25;
      v26 = "ccgcm_set_iv failed: %d";
    }
    else
    {
      [v8 length];
      [v8 bytes];
      int v16 = ccgcm_aad();
      if (!v16)
      {
        v17 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v10 - 24];
        [v6 bytes];
        [v17 mutableBytes];
        int v18 = ccgcm_update();
        if (v18)
        {
          int v28 = v18;
          v29 = ne_log_obj();
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
            goto LABEL_38;
          }
          int __s = 67109120;
          LODWORD(v34) = v28;
          v30 = "ccgcm_update failed: %d";
          p_s = (uint8_t *)&__s;
        }
        else
        {
          objc_msgSend(v6, "getBytes:range:", &__s, v10 - 16, 16);
          int v19 = ccgcm_finalize();
          memset_s(&__s, 0x10uLL, 0, 0x10uLL);
          if (!v19)
          {
            if (+[NEIKEv2SecurityContext removePaddingFromDecryptedPayload:]((uint64_t)NEIKEv2SecurityContext, v17))
            {
              v20 = v17;
LABEL_15:

              goto LABEL_16;
            }
LABEL_39:
            v20 = 0;
            goto LABEL_15;
          }
          v29 = ne_log_obj();
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
          {
LABEL_38:

            goto LABEL_39;
          }
          v32[0] = 67109120;
          v32[1] = v19;
          v30 = "ccgcm_finalize failed: %d";
          p_s = (uint8_t *)v32;
        }
        _os_log_fault_impl(&dword_19DDAF000, v29, OS_LOG_TYPE_FAULT, v30, p_s, 8u);
        goto LABEL_38;
      }
      int v27 = v16;
      v17 = ne_log_obj();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        goto LABEL_39;
      }
      int __s = 67109120;
      LODWORD(v34) = v27;
      v26 = "ccgcm_aad failed: %d";
    }
    _os_log_fault_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_FAULT, v26, (uint8_t *)&__s, 8u);
    goto LABEL_39;
  }
  int v23 = v13;
  v24 = ne_log_obj();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
  {
    int __s = 67109120;
    LODWORD(v34) = v23;
    _os_log_fault_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_FAULT, "ccgcm_reset failed: %d", (uint8_t *)&__s, 8u);
  }

LABEL_36:
  v20 = 0;
LABEL_16:

  return v20;
}

- (id)constructEncryptedPacketFromPayloadData:(id)a3 authenticatedHeaders:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (self) {
      encryptionContext = self->_encryptionContext;
    }
    else {
      encryptionContext = 0;
    }
    unsigned int v9 = encryptionContext;
    [v9 mutableBytes];
    ccaes_gcm_encrypt_mode();
    uint64_t v10 = [v6 length];
    int v11 = [v7 length];
    unsigned int v12 = [(NEIKEv2SecurityContext *)self overheadForPlaintextLength:v10];
    int v13 = ccgcm_reset();
    if (!v13)
    {
      *(_DWORD *)&__s[8] = 0;
      *(void *)int __s = 0;
      int v14 = ccgcm_inc_iv();
      if (v14)
      {
        int v23 = v14;
        memset_s(__s, 0xCuLL, 0, 0xCuLL);
        int v15 = ne_log_obj();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v31 = v23;
          _os_log_fault_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_FAULT, "ccgcm_inc_iv failed: %d", buf, 8u);
        }
        goto LABEL_28;
      }
      int v15 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v11 + v10 + v12];
      [v15 appendData:v7];
      [v15 appendBytes:&__s[4] length:8];
      memset_s(__s, 0xCuLL, 0, 0xCuLL);
      [v15 appendData:v6];
      char v29 = 0;
      [v15 appendBytes:&v29 length:1];
      [v15 setLength:[v15 length] + 16];
      [v15 bytes];
      int v16 = ccgcm_aad();
      if (v16)
      {
        int v24 = v16;
        int v25 = ne_log_obj();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v31 = v24;
          v26 = "ccgcm_aad failed: %d";
LABEL_30:
          _os_log_fault_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_FAULT, v26, buf, 8u);
        }
      }
      else
      {
        [v15 mutableBytes];
        int v17 = ccgcm_update();
        if (!v17)
        {
          int v18 = ccgcm_finalize();
          if (!v18)
          {
            int v19 = v15;
LABEL_10:

            goto LABEL_11;
          }
          int v28 = v18;
          int v25 = ne_log_obj();
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
            goto LABEL_27;
          }
          *(_DWORD *)buf = 67109120;
          int v31 = v28;
          v26 = "ccgcm_finalize failed: %d";
          goto LABEL_30;
        }
        int v27 = v17;
        int v25 = ne_log_obj();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v31 = v27;
          v26 = "ccgcm_update failed: %d";
          goto LABEL_30;
        }
      }
LABEL_27:

LABEL_28:
      int v19 = 0;
      goto LABEL_10;
    }
    int v21 = v13;
    v22 = ne_log_obj();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)int __s = 67109120;
      *(_DWORD *)&__s[4] = v21;
      _os_log_fault_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_FAULT, "ccgcm_reset failed: %d", __s, 8u);
    }
  }
  else
  {
    unsigned int v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)int __s = 136315138;
      *(void *)&__s[4] = "-[NEIKEv2SecurityContextAESGCM constructEncryptedPacketFromPayloadData:authenticatedHeaders:]";
      _os_log_fault_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_FAULT, "%s called with null authenticatedHeaders", __s, 0xCu);
    }
  }
  int v19 = 0;
LABEL_11:

  return v19;
}

- (id)initWithEncryptionProtocol:(void *)a3 outgoingEncryptionKey:(void *)a4 incomingEncryptionKey:
{
  *(void *)&v32[5] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1) {
    goto LABEL_14;
  }
  if (!v7)
  {
    int v13 = ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      int __s = 136315138;
      *(void *)v32 = "-[NEIKEv2SecurityContextAESGCM initWithEncryptionProtocol:outgoingEncryptionKey:incomingEncryptionKey:]";
      _os_log_fault_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_FAULT, "%s called with null encryptionProtocol", (uint8_t *)&__s, 0xCu);
    }
    int v11 = 0;
    goto LABEL_20;
  }
  unint64_t v10 = v7[2];
  if (v10 > 0x1E)
  {
LABEL_14:
    int v11 = 0;
    goto LABEL_21;
  }
  int v11 = 0;
  if (((0x401C0000u >> v10) & 1) != 0 && v10 - 29 >= 3)
  {
    a1 = (id *)-[NEIKEv2SecurityContext initWithMinimumEncryptedPayloadSize:](a1, 25);
    if (a1)
    {
      ccaes_gcm_encrypt_mode();
      CFIndex v12 = ccgcm_context_size();
      int v13 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x1E4F1CA58], v12);
      if (v13)
      {
        int v14 = +[NEIKEv2Crypto createRandomWithSize:]((uint64_t)NEIKEv2Crypto, 8u);
        if (v14)
        {
          int v15 = v14;
          objc_msgSend(v8, "getBytes:range:", &__s, objc_msgSend(v8, "length") - 4, 4);
          [v15 getBytes:v32 length:8];
          [v13 mutableBytes];
          [v8 length];
          [v8 bytes];
          int v16 = ccgcm_init_with_iv();
          memset_s(&__s, 0xCuLL, 0, 0xCuLL);
          if (v16)
          {
            int v19 = ne_log_obj();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
            {
              LOWORD(v29) = 0;
              _os_log_fault_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_FAULT, "ccgcm_init_with_iv failed", (uint8_t *)&v29, 2u);
            }
            goto LABEL_17;
          }
          objc_storeStrong(a1 + 2, v13);
          ccaes_gcm_decrypt_mode();
          CFIndex v17 = ccgcm_context_size();
          int v18 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x1E4F1CA58], v17);
          if (!v18)
          {
            int v28 = ne_log_obj();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
            {
              int v29 = 134217984;
              CFIndex v30 = v17;
              _os_log_fault_impl(&dword_19DDAF000, v28, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%zu] failed", (uint8_t *)&v29, 0xCu);
            }

            int v19 = 0;
            goto LABEL_17;
          }
          int v19 = v18;
          [(__CFData *)v18 mutableBytes];
          [v9 length];
          [v9 bytes];
          if (ccgcm_init())
          {
            int v24 = ne_log_obj();
            if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
              goto LABEL_16;
            }
            LOWORD(v29) = 0;
            v26 = "ccgcm_init failed";
          }
          else
          {
            objc_storeStrong(a1 + 3, v19);
            uint64_t v20 = [v9 bytes];
            uint64_t v21 = [v9 length];
            CFDataRef v22 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x1E4F1C9B8], (const UInt8 *)(v20 + v21 - 4), 4);
            id v23 = a1[4];
            a1[4] = v22;

            if (a1[4])
            {
              int v11 = a1;
LABEL_18:

LABEL_19:
LABEL_20:

              goto LABEL_21;
            }
            int v24 = ne_log_obj();
            if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
              goto LABEL_16;
            }
            LOWORD(v29) = 0;
            v26 = "[NESensitiveData sensitiveDataWithBytes:length:IKEv2_CRYPTO_GCM_SALT_LEN] failed";
          }
          _os_log_fault_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_FAULT, v26, (uint8_t *)&v29, 2u);
LABEL_16:

LABEL_17:
          int v11 = 0;
          goto LABEL_18;
        }
        int v27 = ne_log_obj();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          int __s = 67109120;
          v32[0] = 8;
          _os_log_fault_impl(&dword_19DDAF000, v27, OS_LOG_TYPE_FAULT, "[NEIKEv2Crypto createRandomWithSize:%u] failed", (uint8_t *)&__s, 8u);
        }

        int v15 = 0;
      }
      else
      {
        int v15 = ne_log_obj();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          int __s = 134217984;
          *(void *)v32 = v12;
          _os_log_fault_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%zu] failed", (uint8_t *)&__s, 0xCu);
        }
      }
      int v11 = 0;
      goto LABEL_19;
    }
    goto LABEL_14;
  }
LABEL_21:

  return v11;
}

@end