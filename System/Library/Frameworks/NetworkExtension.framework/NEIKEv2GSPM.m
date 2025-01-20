@interface NEIKEv2GSPM
- (id)initWithIKESA:(id *)a1;
- (void)createLocalSignedOctets;
- (void)createRemoteSignedOctets;
@end

@implementation NEIKEv2GSPM

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstPeerMessage, 0);
  objc_storeStrong((id *)&self->_firstLocalMessage, 0);
  objc_storeStrong((id *)&self->_spake2Handler, 0);
  objc_storeStrong((id *)&self->_nextMessage, 0);

  objc_storeStrong((id *)&self->_sessionKey, 0);
}

- (id)initWithIKESA:(id *)a1
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  v4 = v3;
  if (!a1)
  {
    v37 = 0;
    goto LABEL_30;
  }
  if (v3) {
    v5 = (void *)v3[13];
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (!v6)
  {
    v38 = ne_log_obj();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    v54 = "-[NEIKEv2GSPM initWithIKESA:]";
    v39 = "%s called with null ikeSA.remoteSecurePasswordMethod";
LABEL_27:
    _os_log_fault_impl(&dword_19DDAF000, v38, OS_LOG_TYPE_FAULT, v39, buf, 0xCu);
    goto LABEL_28;
  }
  v8 = [(NEIKEv2IKESA *)v4 sharedSecret];

  if (!v8)
  {
    v38 = ne_log_obj();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    v54 = "-[NEIKEv2GSPM initWithIKESA:]";
    v39 = "%s called with null ikeSA.sharedSecret";
    goto LABEL_27;
  }
  v10 = [(NEIKEv2IKESA *)v4 copyInitiatorIdentifier];

  if (!v10)
  {
    v38 = ne_log_obj();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    v54 = "-[NEIKEv2GSPM initWithIKESA:]";
    v39 = "%s called with null ikeSA.copyInitiatorIdentifier";
    goto LABEL_27;
  }
  v12 = [(NEIKEv2IKESA *)v4 copyResponderIdentifier];

  if (!v12)
  {
    v38 = ne_log_obj();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    v54 = "-[NEIKEv2GSPM initWithIKESA:]";
    v39 = "%s called with null ikeSA.copyResponderIdentifier";
    goto LABEL_27;
  }
  if (v4) {
    v13 = (void *)*((void *)v4 + 13);
  }
  else {
    v13 = 0;
  }
  id v14 = v13;
  uint64_t v15 = [v14 securePasswordMethod];

  if (v15 == 11001)
  {
    id location = 0;
    v16 = -[NEIKEv2IKESA createConcatedNoncesAndReturnError:](v4, (char *)&location);
    v48 = v16;
    if (!v16)
    {
      v18 = ne_log_obj();
      BOOL v46 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
      id v41 = location;
      if (v46)
      {
        *(_DWORD *)buf = 138412546;
        v54 = (const char *)location;
        __int16 v55 = 2112;
        v56 = v4;
        _os_log_error_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_ERROR, "Failed to retrieve concatenated nonces %@ for %@", buf, 0x16u);
      }
      v37 = 0;
      goto LABEL_34;
    }
    v17 = v16;
    v18 = -[NEIKEv2IKESA createConcatenatedSPIsAndReturnError:](v4, (char *)&location);
    if (v18)
    {
      v51.receiver = a1;
      v51.super_class = (Class)NEIKEv2GSPM;
      v19 = (id *)objc_msgSendSuper2(&v51, sel_init);
      if (!v19)
      {
        v35 = ne_log_obj();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_19DDAF000, v35, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
        }
        a1 = 0;
        goto LABEL_32;
      }
      a1 = v19;
      v20 = [_TtC16NetworkExtension26NEIKEv2CryptoKitSPAKE2Plus alloc];
      v22 = [(NEIKEv2IKESA *)v4 sharedSecret];
      v24 = [(NEIKEv2IKESA *)v4 copyInitiatorIdentifier];
      v25 = [v24 identifierData];
      v27 = [(NEIKEv2IKESA *)v4 copyResponderIdentifier];
      v28 = [v27 identifierData];
      if (v4) {
        uint64_t v29 = v4[9] & 1;
      }
      else {
        uint64_t v29 = 0;
      }
      id obj = location;
      uint64_t v30 = [(NEIKEv2CryptoKitSPAKE2Plus *)v20 initWithSeed:v22 initiatorID:v25 responderID:v28 salt:v17 context:v18 forInitiator:v29 error:&obj];
      id v31 = obj;
      objc_storeStrong(&location, obj);
      id v32 = a1[3];
      a1[3] = (id)v30;

      id v33 = a1[3];
      if (v33)
      {
        id v49 = v31;
        id v34 = v33;
        v35 = [v34 getFirstMessageAndReturnError:&v49];
        id v36 = v49;
        id location = v36;

        if (v35)
        {
          objc_storeStrong(a1 + 4, v35);
          objc_storeStrong(a1 + 2, v35);
          a1 = a1;
          v37 = a1;
LABEL_33:

          id v41 = location;
LABEL_34:

          goto LABEL_29;
        }
        v47 = ne_log_obj();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v54 = (const char *)v36;
          _os_log_error_impl(&dword_19DDAF000, v47, OS_LOG_TYPE_ERROR, "Failed to get first message from SPAKE2 handler %@", buf, 0xCu);
        }

        v35 = 0;
LABEL_32:
        v37 = 0;
        goto LABEL_33;
      }
      v35 = ne_log_obj();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        goto LABEL_32;
      }
      *(_DWORD *)buf = 138412290;
      v54 = (const char *)v31;
      v42 = "Failed to create SPAKE2 handler %@";
      v43 = v35;
      uint32_t v44 = 12;
    }
    else
    {
      v35 = ne_log_obj();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        goto LABEL_32;
      }
      *(_DWORD *)buf = 138412546;
      v54 = (const char *)location;
      __int16 v55 = 2112;
      v56 = v4;
      v42 = "Failed to retrieve concatenated SPIs %@ for %@";
      v43 = v35;
      uint32_t v44 = 22;
    }
    _os_log_error_impl(&dword_19DDAF000, v43, OS_LOG_TYPE_ERROR, v42, buf, v44);
    goto LABEL_32;
  }
  v38 = ne_log_obj();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
  {
    String = NEIKEv2SecurePasswordMethodCreateString(v15);
    *(_DWORD *)buf = 138412290;
    v54 = (const char *)String;
    _os_log_fault_impl(&dword_19DDAF000, v38, OS_LOG_TYPE_FAULT, "Support for secure password method %@ is not implemented", buf, 0xCu);
  }
LABEL_28:

  v37 = 0;
LABEL_29:

LABEL_30:
  return v37;
}

- (void)createLocalSignedOctets
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (!*(void *)(a1 + 32))
  {
    v7 = ne_log_obj();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      return 0;
    }
    int v10 = 136315138;
    v11 = "-[NEIKEv2GSPM createLocalSignedOctets]";
    v8 = "%s called with null self.firstLocalMessage";
LABEL_12:
    _os_log_fault_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v10, 0xCu);
    goto LABEL_8;
  }
  v2 = *(void **)(a1 + 40);
  if (!v2)
  {
    v7 = ne_log_obj();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    int v10 = 136315138;
    v11 = "-[NEIKEv2GSPM createLocalSignedOctets]";
    v8 = "%s called with null self.firstPeerMessage";
    goto LABEL_12;
  }
  id v3 = v2;
  uint64_t v4 = [v3 length];
  uint64_t v5 = [*(id *)(a1 + 40) length] + v4;

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v5];
  [v6 appendData:*(void *)(a1 + 32)];
  [v6 appendData:*(void *)(a1 + 40)];
  return v6;
}

- (void)createRemoteSignedOctets
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v2 = *(void **)(a1 + 40);
  if (!v2)
  {
    v7 = ne_log_obj();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      return 0;
    }
    int v10 = 136315138;
    v11 = "-[NEIKEv2GSPM createRemoteSignedOctets]";
    v8 = "%s called with null self.firstPeerMessage";
LABEL_12:
    _os_log_fault_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v10, 0xCu);
    goto LABEL_8;
  }
  if (!*(void *)(a1 + 32))
  {
    v7 = ne_log_obj();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    int v10 = 136315138;
    v11 = "-[NEIKEv2GSPM createRemoteSignedOctets]";
    v8 = "%s called with null self.firstLocalMessage";
    goto LABEL_12;
  }
  id v3 = v2;
  uint64_t v4 = [v3 length];
  uint64_t v5 = [*(id *)(a1 + 40) length] + v4;

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v5];
  [v6 appendData:*(void *)(a1 + 40)];
  [v6 appendData:*(void *)(a1 + 32)];
  return v6;
}

@end