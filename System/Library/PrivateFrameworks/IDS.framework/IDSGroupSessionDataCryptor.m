@interface IDSGroupSessionDataCryptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCryptor:(id)a3;
- (IDSGroupSessionDataCryptor)initWithCoder:(id)a3;
- (IDSGroupSessionDataCryptor)initWithTopic:(id)a3;
- (IDSGroupSessionDataCryptor)initWithTopic:(id)a3 keyManager:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)decryptData:(id)a3 keyID:(id)a4 sequenceNumber:(unint64_t)a5 error:(id *)a6;
- (id)description;
- (id)encryptData:(id)a3 sequenceNumber:(unint64_t)a4 error:(id *)a5;
- (id)getDecryptionKeyIDSet;
- (id)getEncryptionKeyID;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSGroupSessionDataCryptor

- (IDSGroupSessionDataCryptor)initWithTopic:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IDSGroupSessionDataCryptor;
  v5 = [(IDSGroupSessionDataCryptor *)&v12 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [v4 copy];
    topic = v6->_topic;
    v6->_topic = (NSString *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:1282 capacity:32];
    decryptionCryptorsByKeyID = v6->_decryptionCryptorsByKeyID;
    v6->_decryptionCryptorsByKeyID = (NSMapTable *)v9;
  }
  return v6;
}

- (IDSGroupSessionDataCryptor)initWithTopic:(id)a3 keyManager:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(IDSGroupSessionDataCryptor *)self initWithTopic:a3];
  v8 = v7;
  if (v7)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_191925DB0;
    v22[3] = &unk_1E5729658;
    uint64_t v9 = v7;
    v23 = v9;
    [v6 useCurrentEncryptionkeyWithHandler:v22];
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    id v11 = v9[7];
    v9[7] = (id)v10;

    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = sub_191925E54;
    v20 = &unk_1E5729658;
    objc_super v12 = v9;
    v21 = v12;
    [v6 enumerateDecryptingKeysAndSaltsUsingBlock:&v17];
    v13 = objc_msgSend(MEMORY[0x1E4F6B460], "GroupSessionDataCryptor", v17, v18, v19, v20);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [v12 debugDescription];
      *(_DWORD *)buf = 138412290;
      v25 = v14;
      _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "Created IDSGroupSessionDataCryptor: %@", buf, 0xCu);
    }
    if (v12[3])
    {
      v15 = [MEMORY[0x1E4F6C3A8] pairWithFirst:v12[4] second:v12[5]];
      [v9[7] setObject:v15 forKeyedSubscript:v12[3]];
    }
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  encryptingCryptor = self->_encryptingCryptor;
  if (encryptingCryptor) {
    CCCryptorRelease(encryptingCryptor);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_decryptionCryptorsByKeyID;
  uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(const void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [(NSMapTable *)self->_decryptionCryptorsByKeyID objectForKey:v9];
        value = (void *)0xAAAAAAAAAAAAAAAALL;
        if (NSMapMember(self->_decryptionCryptorsByKeyID, v9, 0, &value) && value) {
          CCCryptorRelease((CCCryptorRef)value);
        }
      }
      uint64_t v6 = [(NSMapTable *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  v11.receiver = self;
  v11.super_class = (Class)IDSGroupSessionDataCryptor;
  [(IDSGroupSessionDataCryptor *)&v11 dealloc];
}

- (id)encryptData:(id)a3 sequenceNumber:(unint64_t)a4 error:(id *)a5
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ((unint64_t)[v8 length] < 0xFFFFFFF1)
  {
    v62 = a5;
    if (self->_encryptingCryptor
      || (CCCryptorStatus v21 = CCCryptorCreateWithMode(0, 0xBu, 0, 0, 0, [(NSData *)self->_encryptingKey bytes], [(NSData *)self->_encryptingKey length], 0, 0, 0, 0, &self->_encryptingCryptor)) == 0)
    {
      objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", objc_msgSend(v8, "length") + 29);
      id v13 = objc_claimAutoreleasedReturnValue();
      long long v16 = (unsigned char *)[v13 mutableBytes];
      *long long v16 = 1;
      if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], 0xCuLL, v16 + 1)) {
        __assert_rtn("-[IDSGroupSessionDataCryptor encryptData:sequenceNumber:error:]", "IDSGroupSessionDataCryptor.m", 197, "0 == SecRandomCopyBytes(kSecRandomDefault, IDSGROUPSESSIONCRYPTOR_NONCE_SIZE_NBYTES, nonceBytes)");
      }
      int v17 = CCCryptorGCMSetIV();
      if (v17)
      {
        uint64_t v18 = [MEMORY[0x1E4F6B460] GroupSessionDataCryptor];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          topic = self->_topic;
          uint64_t v20 = v17;
          *(_DWORD *)buf = 138412546;
          v80 = topic;
          __int16 v81 = 2048;
          uint64_t v82 = v17;
          _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "encryptData: failed to set IV for topic %@ error %ld", buf, 0x16u);
        }
        else
        {
          uint64_t v20 = v17;
        }

        v29 = [NSString stringWithFormat:@"Encryption failed - CommonCryptor failed to set IV for topic %@ error %ld", self->_topic, v20];
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v73 = *MEMORY[0x1E4F28568];
        v74 = v29;
        v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
        id *v62 = (id)[v30 initWithDomain:@"com.apple.identityservices.error" code:2 userInfo:v31];
      }
      else
      {
        unint64_t v71 = 0xAAAAAAAAAAAAAAAALL;
        char v72 = -86;
        LOBYTE(v71) = *v16;
        BYTE1(v71) = HIBYTE(a4);
        BYTE2(v71) = BYTE6(a4);
        BYTE3(v71) = BYTE5(a4);
        BYTE4(v71) = BYTE4(a4);
        BYTE5(v71) = BYTE3(a4);
        BYTE6(v71) = BYTE2(a4);
        HIBYTE(v71) = BYTE1(a4);
        char v72 = a4;
        int v25 = CCCryptorGCMAddAAD();
        if (v25)
        {
          uint64_t v26 = [MEMORY[0x1E4F6B460] GroupSessionDataCryptor];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = self->_topic;
            uint64_t v28 = v25;
            *(_DWORD *)buf = 138412546;
            v80 = v27;
            __int16 v81 = 2048;
            uint64_t v82 = v25;
            _os_log_impl(&dword_19190B000, v26, OS_LOG_TYPE_DEFAULT, "encryptData: failed to add AAD for topic %@ error %ld", buf, 0x16u);
          }
          else
          {
            uint64_t v28 = v25;
          }

          v40 = [NSString stringWithFormat:@"Encryption failed - CommonCryptor failed to add AAD for topic %@ error %ld", self->_topic, v28];
          id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v69 = *MEMORY[0x1E4F28568];
          v70 = v40;
          v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
          id *v62 = (id)[v41 initWithDomain:@"com.apple.identityservices.error" code:2 userInfo:v42];
        }
        else
        {
          encryptingCryptor = self->_encryptingCryptor;
          id v35 = v8;
          int v36 = MEMORY[0x192FDEF00](encryptingCryptor, [v35 bytes], objc_msgSend(v35, "length"), v16 + 13);
          if (v36)
          {
            v37 = [MEMORY[0x1E4F6B460] GroupSessionDataCryptor];
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              v38 = self->_topic;
              uint64_t v39 = v36;
              *(_DWORD *)buf = 138412546;
              v80 = v38;
              __int16 v81 = 2048;
              uint64_t v82 = v36;
              _os_log_impl(&dword_19190B000, v37, OS_LOG_TYPE_DEFAULT, "encryptData: failed to encrypt for topic %@ error %ld", buf, 0x16u);
            }
            else
            {
              uint64_t v39 = v36;
            }

            v47 = [NSString stringWithFormat:@"Encryption failed - CommonCryptor failed to encrypt for topic %@ error %ld", self->_topic, v39];
            id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v67 = *MEMORY[0x1E4F28568];
            v68 = v47;
            v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
            id *v62 = (id)[v48 initWithDomain:@"com.apple.identityservices.error" code:2 userInfo:v49];
          }
          else
          {
            [v35 length];
            int v43 = CCCryptorGCMFinalize();
            if (v43)
            {
              v44 = [MEMORY[0x1E4F6B460] GroupSessionDataCryptor];
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                v45 = self->_topic;
                uint64_t v46 = v43;
                *(_DWORD *)buf = 138412546;
                v80 = v45;
                __int16 v81 = 2048;
                uint64_t v82 = v43;
                _os_log_impl(&dword_19190B000, v44, OS_LOG_TYPE_DEFAULT, "encryptData: failed to create auth tag for topic %@ error %ld", buf, 0x16u);
              }
              else
              {
                uint64_t v46 = v43;
              }

              v54 = [NSString stringWithFormat:@"Encryption failed - CommonCryptor failed to create auth tag for topic %@ error %ld", self->_topic, v46];
              id v55 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v65 = *MEMORY[0x1E4F28568];
              v66 = v54;
              v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
              id *v62 = (id)[v55 initWithDomain:@"com.apple.identityservices.error" code:2 userInfo:v56];
            }
            else
            {
              int v50 = CCCryptorGCMReset();
              if (!v50)
              {
                id v57 = v13;
                goto LABEL_39;
              }
              v51 = [MEMORY[0x1E4F6B460] GroupSessionDataCryptor];
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
              {
                v52 = self->_topic;
                uint64_t v53 = v50;
                *(_DWORD *)buf = 138412546;
                v80 = v52;
                __int16 v81 = 2048;
                uint64_t v82 = v50;
                _os_log_impl(&dword_19190B000, v51, OS_LOG_TYPE_DEFAULT, "encryptData: failed to reset cryptor for topic %@ error %ld", buf, 0x16u);
              }
              else
              {
                uint64_t v53 = v50;
              }

              v58 = [NSString stringWithFormat:@"Encryption failed - CommonCryptor failed to reset for topic %@ error %ld", self->_topic, v53];
              id v59 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v63 = *MEMORY[0x1E4F28568];
              v64 = v58;
              v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
              id *v62 = (id)[v59 initWithDomain:@"com.apple.identityservices.error" code:2 userInfo:v60];
            }
          }
        }
      }
    }
    else
    {
      v22 = [MEMORY[0x1E4F6B460] GroupSessionDataCryptor];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = self->_topic;
        uint64_t v24 = v21;
        *(_DWORD *)buf = 138412546;
        v80 = v23;
        __int16 v81 = 2048;
        uint64_t v82 = v21;
        _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "encryptData: failed to create CommonCrypto cryptor for topic %@ error %ld", buf, 0x16u);
      }
      else
      {
        uint64_t v24 = v21;
      }

      id v13 = [NSString stringWithFormat:@"Encryption failed - failed to create CommonCrypto cryptor for topic %@ error %ld", self->_topic, v24];
      id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v75 = *MEMORY[0x1E4F28568];
      id v76 = v13;
      v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
      id *v62 = (id)[v32 initWithDomain:@"com.apple.identityservices.error" code:2 userInfo:v33];
    }
  }
  else
  {
    id v10 = a5;
    objc_super v11 = [MEMORY[0x1E4F6B460] GroupSessionDataCryptor];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v12 = self->_topic;
      *(_DWORD *)buf = 138412546;
      v80 = v12;
      __int16 v81 = 2048;
      uint64_t v82 = [v8 length];
      _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "encryptData: plaintext larger than GCM can support for topic %@ data.length %lu", buf, 0x16u);
    }

    id v13 = [NSString stringWithFormat:@"Encryption failed - plaintext larger than GCM can support for topic %@ data.length %lu", self->_topic, objc_msgSend(v8, "length")];
    id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v77 = *MEMORY[0x1E4F28568];
    id v78 = v13;
    long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
    *id v10 = (id)[v14 initWithDomain:@"com.apple.identityservices.error" code:4 userInfo:v15];
  }
  id v57 = 0;
LABEL_39:

  os_unfair_lock_unlock(p_lock);

  return v57;
}

- (id)getEncryptionKeyID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSUUID *)self->_encryptingKeyID copy];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)decryptData:(id)a3 keyID:(id)a4 sequenceNumber:(unint64_t)a5 error:(id *)a6
{
  v108[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v80 = a6;
  if ((unint64_t)[v10 length] > 0x1D)
  {
    value = (void *)0xAAAAAAAAAAAAAAAALL;
    CCCryptorRef cryptorRef = (CCCryptorRef)0xAAAAAAAAAAAAAAAALL;
    v19 = [(NSMutableDictionary *)self->_decryptionKeysByKeyID objectForKeyedSubscript:v11];
    if (NSMapMember(self->_decryptionCryptorsByKeyID, v11, 0, &value))
    {
      CCCryptorRef cryptorRef = (CCCryptorRef)value;
    }
    else
    {
      if (!v19)
      {
        int v36 = [MEMORY[0x1E4F6B460] GroupSessionDataCryptor];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          topic = self->_topic;
          *(_DWORD *)buf = 138412546;
          v100 = topic;
          __int16 v101 = 2112;
          uint64_t v102 = (uint64_t)v11;
          _os_log_impl(&dword_19190B000, v36, OS_LOG_TYPE_DEFAULT, "decryptData: unknown keyID for topic %@ keyID %@", buf, 0x16u);
        }

        v38 = [NSString stringWithFormat:@"Decryption failed - unknown keyID %@", v11];
        id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v105 = *MEMORY[0x1E4F28568];
        v106 = v38;
        v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
        id *v80 = (id)[v39 initWithDomain:@"com.apple.identityservices.error" code:1 userInfo:v40];

        goto LABEL_29;
      }
      id v27 = [v19 first];
      LODWORD(v28) = CCCryptorCreateWithMode(1u, 0xBu, 0, 0, 0, (const void *)[v27 bytes], objc_msgSend(v27, "length"), 0, 0, 0, 0, &cryptorRef);
      if (v28)
      {
        v29 = [MEMORY[0x1E4F6B460] GroupSessionDataCryptor];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          id v30 = self->_topic;
          uint64_t v28 = (int)v28;
          *(_DWORD *)buf = 138412802;
          v100 = v30;
          __int16 v101 = 2112;
          uint64_t v102 = (uint64_t)v11;
          __int16 v103 = 2048;
          uint64_t v104 = (int)v28;
          _os_log_impl(&dword_19190B000, v29, OS_LOG_TYPE_DEFAULT, "decryptData: failed to create cryptor for topic %@ keyID %@ error %ld", buf, 0x20u);
        }
        else
        {
          uint64_t v28 = (int)v28;
        }

        int v43 = [NSString stringWithFormat:@"Decryption failed - CommonCryptor fails to create cryptor for topic %@ keyID %@ error %ld", self->_topic, v11, v28];
        id v44 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v97 = *MEMORY[0x1E4F28568];
        v98 = v43;
        v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
        id *v80 = (id)[v44 initWithDomain:@"com.apple.identityservices.error" code:2 userInfo:v45];

        goto LABEL_29;
      }
      [(NSMapTable *)self->_decryptionCryptorsByKeyID setObject:cryptorRef forKey:v11];
    }
    id v20 = v10;
    CCCryptorStatus v21 = (unsigned char *)[v20 bytes];
    uint64_t v22 = *v21;
    if (v22 != 1)
    {
      v31 = [MEMORY[0x1E4F6B460] GroupSessionDataCryptor];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        id v32 = self->_topic;
        *(_DWORD *)buf = 138412802;
        v100 = v32;
        __int16 v101 = 2112;
        uint64_t v102 = (uint64_t)v11;
        __int16 v103 = 1024;
        LODWORD(v104) = v22;
        _os_log_impl(&dword_19190B000, v31, OS_LOG_TYPE_DEFAULT, "decryptData: unknown version for topic %@ keyID %@ version %u", buf, 0x1Cu);
      }

      v33 = [NSString stringWithFormat:@"Decryption failed - unknown version for topic %@ keyID %@ version %u", self->_topic, v11, v22];
      id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v95 = *MEMORY[0x1E4F28568];
      v96 = v33;
      id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
      id *v80 = (id)[v34 initWithDomain:@"com.apple.identityservices.error" code:6 userInfo:v35];

      goto LABEL_29;
    }
    int v23 = CCCryptorGCMSetIV();
    if (v23)
    {
      uint64_t v24 = [MEMORY[0x1E4F6B460] GroupSessionDataCryptor];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = self->_topic;
        uint64_t v26 = v23;
        *(_DWORD *)buf = 138412802;
        v100 = v25;
        __int16 v101 = 2112;
        uint64_t v102 = (uint64_t)v11;
        __int16 v103 = 2048;
        uint64_t v104 = v23;
        _os_log_impl(&dword_19190B000, v24, OS_LOG_TYPE_DEFAULT, "decryptData: failed to set IV for topic %@ keyID %@ error %ld", buf, 0x20u);
      }
      else
      {
        uint64_t v26 = v23;
      }

      uint64_t v46 = [NSString stringWithFormat:@"Decryption failed - CommonCryptor fails to set IV for topic %@ keyID %@ error %ld", self->_topic, v11, v26];
      id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v93 = *MEMORY[0x1E4F28568];
      v94 = v46;
      id v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
      id *v80 = (id)[v47 initWithDomain:@"com.apple.identityservices.error" code:2 userInfo:v48];

LABEL_29:
      uint64_t v18 = 0;
LABEL_30:

      goto LABEL_31;
    }
    unint64_t v91 = 0xAAAAAAAAAAAAAAAALL;
    char v92 = -86;
    LOBYTE(v91) = *v21;
    BYTE1(v91) = HIBYTE(a5);
    BYTE2(v91) = BYTE6(a5);
    BYTE3(v91) = BYTE5(a5);
    BYTE4(v91) = BYTE4(a5);
    BYTE5(v91) = BYTE3(a5);
    BYTE6(v91) = BYTE2(a5);
    HIBYTE(v91) = BYTE1(a5);
    char v92 = a5;
    LODWORD(a5) = CCCryptorGCMAddAAD();
    if (a5)
    {
      id v41 = [MEMORY[0x1E4F6B460] GroupSessionDataCryptor];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v42 = self->_topic;
        a5 = (int)a5;
        *(_DWORD *)buf = 138412546;
        v100 = v42;
        __int16 v101 = 2048;
        uint64_t v102 = (int)a5;
        _os_log_impl(&dword_19190B000, v41, OS_LOG_TYPE_DEFAULT, "encryptData: failed to add AAD for topic %@ error %ld", buf, 0x16u);
      }
      else
      {
        a5 = (int)a5;
      }

      uint64_t v57 = [NSString stringWithFormat:@"Encryption failed - CommonCryptor failed to add AAD for topic %@ error %ld", self->_topic, a5];
      id v58 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v89 = *MEMORY[0x1E4F28568];
      uint64_t v90 = v57;
      id v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
      v60 = (void *)v57;
      id *v80 = (id)[v58 initWithDomain:@"com.apple.identityservices.error" code:2 userInfo:v59];

      uint64_t v18 = 0;
      id v61 = v60;
      goto LABEL_53;
    }
    uint64_t v50 = [v20 length] - 29;
    v51 = [MEMORY[0x1E4F1CA58] dataWithLength:v50];
    CCCryptorRef v52 = cryptorRef;
    id v79 = v51;
    int v53 = MEMORY[0x192FDEEF0](v52, v21 + 13, v50, [v79 mutableBytes]);
    if (v53)
    {
      v54 = [MEMORY[0x1E4F6B460] GroupSessionDataCryptor];
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        id v55 = self->_topic;
        uint64_t v56 = v53;
        *(_DWORD *)buf = 138412802;
        v100 = v55;
        __int16 v101 = 2112;
        uint64_t v102 = (uint64_t)v11;
        __int16 v103 = 2048;
        uint64_t v104 = v53;
        _os_log_impl(&dword_19190B000, v54, OS_LOG_TYPE_DEFAULT, "decryptData: failed to decrypt for topic %@ keyID %@ error %ld", buf, 0x20u);
      }
      else
      {
        uint64_t v56 = v53;
      }

      v66 = [NSString stringWithFormat:@"Decryption failed - CommonCryptor failed to decrypt for topic %@ keyID %@ error %ld", self->_topic, v11, v56];
      id v67 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v87 = *MEMORY[0x1E4F28568];
      v88 = v66;
      v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
      id *v80 = (id)[v67 initWithDomain:@"com.apple.identityservices.error" code:2 userInfo:v68];
    }
    else
    {
      int v62 = CCCryptorGCMFinalize();
      if (v62)
      {
        uint64_t v63 = [MEMORY[0x1E4F6B460] GroupSessionDataCryptor];
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          v64 = self->_topic;
          uint64_t v65 = v62;
          *(_DWORD *)buf = 138412802;
          v100 = v64;
          __int16 v101 = 2112;
          uint64_t v102 = (uint64_t)v11;
          __int16 v103 = 2048;
          uint64_t v104 = v62;
          _os_log_impl(&dword_19190B000, v63, OS_LOG_TYPE_DEFAULT, "decryptData: failed to verify auth tag for topic %@ keyID %@ error %ld", buf, 0x20u);
        }
        else
        {
          uint64_t v65 = v62;
        }

        uint64_t v73 = [NSString stringWithFormat:@"Decryption failed - failed to verify auth tag for topic %@ keyID %@ error %ld", self->_topic, v11, v65];
        id v74 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v85 = *MEMORY[0x1E4F28568];
        v86 = v73;
        uint64_t v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
        id *v80 = (id)[v74 initWithDomain:@"com.apple.identityservices.error" code:3 userInfo:v75];
      }
      else
      {
        int v69 = CCCryptorGCMReset();
        if (!v69)
        {
          id v61 = v79;
          uint64_t v18 = v61;
LABEL_53:

          goto LABEL_30;
        }
        v70 = [MEMORY[0x1E4F6B460] GroupSessionDataCryptor];
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v71 = self->_topic;
          uint64_t v72 = v69;
          *(_DWORD *)buf = 138412802;
          v100 = v71;
          __int16 v101 = 2112;
          uint64_t v102 = (uint64_t)v11;
          __int16 v103 = 2048;
          uint64_t v104 = v69;
          _os_log_impl(&dword_19190B000, v70, OS_LOG_TYPE_DEFAULT, "decryptData: failed to reset cryptor for topic %@ keyID %@ error %ld", buf, 0x20u);
        }
        else
        {
          uint64_t v72 = v69;
        }

        id v76 = [NSString stringWithFormat:@"Decryption failed - CommonCryptor failed to reset for topic %@ keyID %@ error %ld", self->_topic, v11, v72];
        id v77 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v83 = *MEMORY[0x1E4F28568];
        v84 = v76;
        id v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
        id *v80 = (id)[v77 initWithDomain:@"com.apple.identityservices.error" code:2 userInfo:v78];
      }
    }
    uint64_t v18 = 0;
    id v61 = v79;
    goto LABEL_53;
  }
  id v13 = [MEMORY[0x1E4F6B460] GroupSessionDataCryptor];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = self->_topic;
    *(_DWORD *)buf = 138412546;
    v100 = v14;
    __int16 v101 = 2048;
    uint64_t v102 = [v10 length];
    _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "decryptData: insufficient incoming data for topic %@ size %lu", buf, 0x16u);
  }

  long long v15 = [NSString stringWithFormat:@"Decryption failed - data has insufficient bytes to decrypt for topic %@ keyID %@", self->_topic, v11];
  id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v107 = *MEMORY[0x1E4F28568];
  v108[0] = v15;
  int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:&v107 count:1];
  id *v80 = (id)[v16 initWithDomain:@"com.apple.identityservices.error" code:4 userInfo:v17];

  uint64_t v18 = 0;
LABEL_31:
  os_unfair_lock_unlock(p_lock);

  return v18;
}

- (id)getDecryptionKeyIDSet
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableDictionary *)self->_decryptionKeysByKeyID allKeys];
  uint64_t v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = v5 == objc_opt_class() && [(IDSGroupSessionDataCryptor *)self isEqualToCryptor:v4];

  return v6;
}

- (BOOL)isEqualToCryptor:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  if ([(NSUUID *)self->_encryptingKeyID isEqual:v4[3]]
    && [(NSData *)self->_encryptingKey isEqual:v4[4]]
    && [(NSData *)self->_encryptingKeySalt isEqual:v4[5]]
    && (uint64_t v5 = -[NSMutableDictionary count](self->_decryptionKeysByKeyID, "count"), v5 == [v4[7] count]))
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    BOOL v6 = self->_decryptionKeysByKeyID;
    uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          objc_super v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_decryptionKeysByKeyID, "objectForKeyedSubscript:", v11, (void)v17);
          id v13 = [v4[7] objectForKeyedSubscript:v11];
          int v14 = [v12 isEqual:v13];

          if (!v14)
          {
            BOOL v15 = 0;
            goto LABEL_17;
          }
        }
        uint64_t v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v15 = 1;
LABEL_17:
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"{Class:%@, Topic:%@, EncryptionKeyID:%@, DecryptionKeyCount:%lu}", objc_opt_class(), self->_topic, self->_encryptingKeyID, -[NSMutableDictionary count](self->_decryptionKeysByKeyID, "count")];
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  topic = self->_topic;
  encryptingKeyID = self->_encryptingKeyID;
  uint64_t v7 = [(NSMutableDictionary *)self->_decryptionKeysByKeyID allKeys];
  uint64_t v8 = [v3 stringWithFormat:@"{Object:%p, Class:%@, Topic:%@, EncryptionKeyID:%@, DecryptionKeys:%@}", self, v4, topic, encryptingKeyID, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 encodeObject:self->_topic forKey:@"topic"];
  [v4 encodeObject:self->_encryptingKeyID forKey:@"encryptingKeyID"];
  [v4 encodeObject:self->_encryptingKey forKey:@"encryptingKey"];
  long long v17 = v4;
  [v4 encodeObject:self->_encryptingKeySalt forKey:@"encryptingKeySalt"];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  BOOL v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = self->_decryptionKeysByKeyID;
  uint64_t v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        int v14 = [(NSMutableDictionary *)self->_decryptionKeysByKeyID objectForKeyedSubscript:v13];
        [v5 addObject:v13];
        BOOL v15 = [v14 first];
        [v6 addObject:v15];

        id v16 = [v14 second];
        [v7 addObject:v16];
      }
      uint64_t v10 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  [v17 encodeObject:v5 forKey:@"decryptingKeyIDs"];
  [v17 encodeObject:v6 forKey:@"decryptingKeys"];
  [v17 encodeObject:v7 forKey:@"decryptingKeySalts"];
}

- (IDSGroupSessionDataCryptor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"topic"];
  BOOL v6 = [(IDSGroupSessionDataCryptor *)self initWithTopic:v5];
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptingKeyID"];
    encryptingKeyID = v6->_encryptingKeyID;
    v6->_encryptingKeyID = (NSUUID *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptingKey"];
    encryptingKey = v6->_encryptingKey;
    v6->_encryptingKey = (NSData *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptingKeySalt"];
    encryptingKeySalt = v6->_encryptingKeySalt;
    v6->_encryptingKeySalt = (NSData *)v11;

    uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    BOOL v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    id v16 = [v4 decodeObjectOfClasses:v15 forKey:@"decryptingKeyIDs"];

    long long v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    long long v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    long long v20 = [v4 decodeObjectOfClasses:v19 forKey:@"decryptingKeys"];

    long long v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"decryptingKeySalts"];

    uint64_t v25 = [v16 count];
    if (v25 != [v20 count] || (uint64_t v26 = objc_msgSend(v16, "count"), v26 != objc_msgSend(v24, "count")))
    {

      int v36 = 0;
      goto LABEL_10;
    }
    v38 = v5;
    id v39 = v4;
    uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
    decryptionKeysByKeyID = v6->_decryptionKeysByKeyID;
    v6->_decryptionKeysByKeyID = (NSMutableDictionary *)v27;

    if ([v16 count])
    {
      unint64_t v29 = 0;
      do
      {
        id v30 = (void *)MEMORY[0x1E4F6C3A8];
        v31 = [v20 objectAtIndexedSubscript:v29];
        id v32 = [v24 objectAtIndexedSubscript:v29];
        v33 = [v30 pairWithFirst:v31 second:v32];
        id v34 = v6->_decryptionKeysByKeyID;
        id v35 = [v16 objectAtIndexedSubscript:v29];
        [(NSMutableDictionary *)v34 setObject:v33 forKeyedSubscript:v35];

        ++v29;
      }
      while (v29 < [v16 count]);
    }

    uint64_t v5 = v38;
    id v4 = v39;
  }
  int v36 = v6;
LABEL_10:

  return v36;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [IDSGroupSessionDataCryptor alloc];
  topic = self->_topic;

  return [(IDSGroupSessionDataCryptor *)v4 initWithTopic:topic];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decryptionCryptorsByKeyID, 0);
  objc_storeStrong((id *)&self->_decryptionKeysByKeyID, 0);
  objc_storeStrong((id *)&self->_encryptingKeySalt, 0);
  objc_storeStrong((id *)&self->_encryptingKey, 0);
  objc_storeStrong((id *)&self->_encryptingKeyID, 0);

  objc_storeStrong((id *)&self->_topic, 0);
}

@end