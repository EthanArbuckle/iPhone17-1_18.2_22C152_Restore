@interface NEProfilePayloadBaseVPN
- (BOOL)setPostprocessedPayloadContents:(id)a3;
- (NEProfilePayloadBaseVPN)initWithPayload:(id)a3;
- (id)getPreprocessedPayloadContents;
- (id)validatePayload;
@end

@implementation NEProfilePayloadBaseVPN

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pin, 0);
  objc_storeStrong((id *)&self->_sharedSecret, 0);
  objc_storeStrong((id *)&self->_proxyPassword, 0);
  objc_storeStrong((id *)&self->_proxyUserName, 0);
  objc_storeStrong((id *)&self->_password, 0);

  objc_storeStrong((id *)&self->_userName, 0);
}

- (BOOL)setPostprocessedPayloadContents:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = ne_log_large_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v26 = 138412546;
    *(void *)&v26[4] = objc_opt_class();
    *(_WORD *)&v26[12] = 2112;
    *(void *)&v26[14] = v4;
    id v25 = *(id *)&v26[4];
    _os_log_debug_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEBUG, "%@ setPostprocessedPayloadContents newContents %@", v26, 0x16u);
  }
  v6 = [v4 objectForKeyedSubscript:@"AuthName"];

  if (v6)
  {
    v7 = [v4 objectForKeyedSubscript:@"AuthName"];
    userName = self->_userName;
    self->_userName = v7;
  }
  v9 = objc_msgSend(v4, "objectForKeyedSubscript:", @"AuthPassword", *(_OWORD *)v26, *(void *)&v26[16], v27);

  if (v9)
  {
    v10 = [v4 objectForKeyedSubscript:@"AuthPassword"];
    password = self->_password;
    self->_password = v10;
  }
  v12 = [v4 objectForKeyedSubscript:@"HTTPProxyUsername"];

  if (v12)
  {
    v13 = [v4 objectForKeyedSubscript:@"HTTPProxyUsername"];
    proxyUserName = self->_proxyUserName;
    self->_proxyUserName = v13;
  }
  v15 = [v4 objectForKeyedSubscript:@"HTTPProxyPassword"];

  if (v15)
  {
    v16 = [v4 objectForKeyedSubscript:@"HTTPProxyPassword"];
    proxyPassword = self->_proxyPassword;
    self->_proxyPassword = v16;
  }
  v18 = [v4 objectForKeyedSubscript:@"SharedSecret"];

  if (v18)
  {
    v19 = [v4 objectForKeyedSubscript:@"SharedSecret"];
    sharedSecret = self->_sharedSecret;
    self->_sharedSecret = v19;
  }
  v21 = [v4 objectForKeyedSubscript:@"PromptForVPNPIN"];

  if (v21)
  {
    v22 = [v4 objectForKeyedSubscript:@"PromptForVPNPIN"];
    pin = self->_pin;
    self->_pin = v22;
  }
  return 1;
}

- (id)getPreprocessedPayloadContents
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  userName = self->_userName;
  if (userName) {
    [v3 setValue:userName forKey:@"AuthName"];
  }
  if (self->_userNameRequired) {
    [v4 setValue:@"1" forKey:@"AuthNameRequired"];
  }
  password = self->_password;
  if (password) {
    [v4 setValue:password forKey:@"AuthPassword"];
  }
  if (self->_passwordRequired) {
    [v4 setValue:@"1" forKey:@"AuthPasswordRequired"];
  }
  proxyUserName = self->_proxyUserName;
  if (proxyUserName) {
    [v4 setValue:proxyUserName forKey:@"HTTPProxyUsername"];
  }
  if (self->_proxyUserNameRequired) {
    [v4 setValue:@"1" forKey:@"HTTPProxyUsernameRequired"];
  }
  proxyPassword = self->_proxyPassword;
  if (proxyPassword) {
    [v4 setValue:proxyPassword forKey:@"HTTPProxyPassword"];
  }
  if (self->_proxyPasswordRequired) {
    [v4 setValue:self->_proxyPassword forKey:@"HTTPProxyPasswordRequired"];
  }
  sharedSecret = self->_sharedSecret;
  if (sharedSecret) {
    [v4 setValue:sharedSecret forKey:@"SharedSecret"];
  }
  if (self->_sharedSecretRequired) {
    [v4 setValue:@"1" forKey:@"SharedSecretRequired"];
  }
  pin = self->_pin;
  if (pin) {
    [v4 setValue:pin forKey:@"PromptForVPNPIN"];
  }
  if (self->_pinRequired) {
    [v4 setValue:@"1" forKey:@"PromptForVPNPINRequired"];
  }
  v11 = ne_log_large_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412290;
    v14 = v4;
    _os_log_debug_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_DEBUG, "NEProfilePayloadBaseVPN getPreprocessedPayloadContents: dict %@", (uint8_t *)&v13, 0xCu);
  }

  return v4;
}

- (id)validatePayload
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = ne_log_large_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = [(NEProfilePayloadBase *)self payloadAtom];
    int v6 = 138412290;
    v7 = v5;
    _os_log_debug_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_DEBUG, "NEProfilePayloadBaseVPN validate: To-Do. dict %@", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

- (NEProfilePayloadBaseVPN)initWithPayload:(id)a3
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = ne_log_large_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v108 = (id)objc_opt_class();
    __int16 v109 = 2112;
    id v110 = v4;
    id v40 = v108;
    _os_log_debug_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEBUG, "%@ NEProfilePayloadVPNBase initWithPayload: payloadDict %@", buf, 0x16u);
  }
  v106.receiver = self;
  v106.super_class = (Class)NEProfilePayloadBaseVPN;
  int v6 = [(NEProfilePayloadBase *)&v106 initWithPayload:v4];
  v7 = ne_log_large_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v41 = [(NEProfilePayloadBase *)v6 payloadAtom];
    *(_DWORD *)buf = 138412546;
    id v108 = v6;
    __int16 v109 = 2112;
    id v110 = v41;
    _os_log_debug_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_DEBUG, "NEProfilePayloadVPNBase initWithPayload: self %@,  cached atom %@", buf, 0x16u);
  }
  id v8 = v4;
  if (v6)
  {
    v9 = ne_log_large_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v42 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      id v108 = v42;
      __int16 v109 = 2112;
      id v110 = v8;
      id v43 = v42;
      _os_log_debug_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_DEBUG, "%@ extractPayloadContents: payloadDict %@", buf, 0x16u);
    }
    if (v8)
    {
      v10 = [v8 objectForKeyedSubscript:@"Proxies"];
      v11 = v10;
      if (v10)
      {
        v12 = [v10 objectForKeyedSubscript:@"HTTPProxyAuthenticated"];
        if (v12)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v6->_proxyUserNameRequired = [v12 intValue] != 0;
          }
          uint64_t v13 = [v11 objectForKeyedSubscript:@"HTTPProxyUsername"];
          proxyUserName = v6->_proxyUserName;
          v6->_proxyUserName = (NSString *)v13;
        }
        else
        {
          uint64_t v16 = [v11 objectForKeyedSubscript:@"HTTPProxyUsername"];
          v17 = v6->_proxyUserName;
          v6->_proxyUserName = (NSString *)v16;

          v6->_proxyUserNameRequired = v6->_proxyUserName != 0;
        }
        v6->_proxyPasswordRequired = v6->_proxyUserNameRequired;
        uint64_t v15 = [v11 objectForKeyedSubscript:@"HTTPProxyPassword"];
      }
      else
      {
        uint64_t v15 = 0;
      }
      if (isa_nsdata(v15)) {
        v18 = (NSString *)[[NSString alloc] initWithData:v15 encoding:4];
      }
      else {
        v18 = v15;
      }
      proxyPassword = v6->_proxyPassword;
      v6->_proxyPassword = v18;

      id v20 = v8;
      v21 = [v20 objectForKeyedSubscript:@"PPP"];
      v22 = v21;
      if (v21)
      {
        v23 = [v21 objectForKeyedSubscript:@"AuthEAPPlugins"];
        v24 = v23;
        if (v23) {
          int v25 = [v23 containsObject:@"EAP-RSA"];
        }
        else {
          int v25 = 0;
        }
      }
      else
      {
        int v25 = 0;
      }
      v26 = [v20 objectForKeyedSubscript:@"IPSec"];

      if (v26)
      {
        uint64_t v27 = [v26 objectForKeyedSubscript:@"XAuthPasswordEncryption"];
        v28 = v27;
        if (v27) {
          int v29 = [v27 isEqualToString:@"Prompt"];
        }
        else {
          int v29 = 0;
        }
      }
      else
      {
        int v29 = 0;
      }
      v30 = [v20 objectForKeyedSubscript:@"VPNType"];
      if ([v30 isEqualToString:@"IPSec"])
      {
        v31 = [v20 objectForKeyedSubscript:@"IPSec"];

        if (v31)
        {
          v32 = [v31 objectForKeyedSubscript:@"AuthenticationMethod"];
          v26 = v32;
          if (v32)
          {
            if ([v32 isEqualToString:@"SharedSecret"])
            {
              uint64_t v33 = [v31 objectForKeyedSubscript:@"XAuthName"];
              userName = v6->_userName;
              v6->_userName = (NSString *)v33;

              v6->_userNameRequired = 1;
            }
            if (v25 && v29 || ([v26 isEqualToString:@"Certificate"] & 1) != 0) {
              goto LABEL_60;
            }
          }
          else if (v25 && v29)
          {
            goto LABEL_60;
          }
          v39 = [v31 objectForKeyedSubscript:@"PayloadCertificateUUID"];
          if (v39)
          {
          }
          else
          {
            v44 = [v31 objectForKeyedSubscript:@"PayloadCertificateIdentityUUID"];

            if (!v44)
            {
              v35 = [v31 objectForKeyedSubscript:@"XAuthPassword"];
              v6->_passwordRequired = 1;
              goto LABEL_61;
            }
          }
LABEL_60:
          v35 = 0;
LABEL_61:

          goto LABEL_62;
        }
LABEL_54:
        v35 = 0;
        goto LABEL_62;
      }
      if ([v30 isEqualToString:@"IKEv2"])
      {
        v31 = [v20 objectForKeyedSubscript:@"IKEv2"];

        if (!v31) {
          goto LABEL_54;
        }
        v35 = [v31 objectForKeyedSubscript:@"ExtendedAuthEnabled"];
        if (!v35) {
          goto LABEL_62;
        }
        v36 = [v31 objectForKeyedSubscript:@"LocalCertificate"];
        if (v36
          || ([v31 objectForKeyedSubscript:@"PayloadCertificateUUID"],
              (v36 = objc_claimAutoreleasedReturnValue()) != 0)
          || ([v31 objectForKeyedSubscript:@"PayloadCertificateFileName"],
              (v36 = objc_claimAutoreleasedReturnValue()) != 0)
          || ([v31 objectForKeyedSubscript:@"PayloadCertificateIdentityUUID"],
              (v36 = objc_claimAutoreleasedReturnValue()) != 0))
        {

          goto LABEL_54;
        }
        v96 = [v31 objectForKeyedSubscript:@"ExtensibleSSOProvider"];

        if (v96) {
          goto LABEL_54;
        }
        uint64_t v97 = [v31 objectForKeyedSubscript:@"AuthName"];
        v98 = v6->_userName;
        v6->_userName = (NSString *)v97;

        v35 = [v31 objectForKeyedSubscript:@"AuthPassword"];
        v6->_userNameRequired = 1;
      }
      else
      {
        if ([v30 isEqualToString:@"VPN"])
        {
          v35 = 0;
          v31 = v26;
          goto LABEL_62;
        }
        v31 = [v20 objectForKeyedSubscript:@"PPP"];

        v6->_userNameRequired = 1;
        if (!v31) {
          goto LABEL_54;
        }
        uint64_t v37 = [v31 objectForKeyedSubscript:@"AuthName"];
        v38 = v6->_userName;
        v6->_userName = (NSString *)v37;

        if (v25)
        {
          if (v29) {
            goto LABEL_54;
          }
        }
        v35 = [v31 objectForKeyedSubscript:@"AuthPassword"];
      }
      v6->_passwordRequired = 1;
LABEL_62:
      if (isa_nsdata(v35)) {
        v45 = (NSString *)[[NSString alloc] initWithData:v35 encoding:4];
      }
      else {
        v45 = v35;
      }
      password = v6->_password;
      v6->_password = v45;

      id v47 = v20;
      v48 = ne_log_large_obj();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        v60 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        id v108 = v60;
        __int16 v109 = 2112;
        id v110 = v47;
        id v61 = v60;
        _os_log_debug_impl(&dword_19DDAF000, v48, OS_LOG_TYPE_DEBUG, "%@ extractPayloadContentsSharedSecret: dict %@", buf, 0x16u);
      }
      v49 = [v47 objectForKeyedSubscript:@"VPNType"];
      v50 = v49;
      if (!v49)
      {
LABEL_127:

        id v85 = v47;
        v86 = [v85 objectForKeyedSubscript:@"VPNType"];
        if ([v86 isEqualToString:@"IPSec"])
        {
          v87 = [v85 objectForKeyedSubscript:@"IPSec"];
          v88 = v87;
          if (v87)
          {
            v89 = [v87 objectForKeyedSubscript:@"PromptForVPNPIN"];
            if (v89)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && [v89 intValue] == 1) {
                v6->_pinRequired = 1;
              }
            }
            goto LABEL_135;
          }
        }
        else
        {
          v88 = 0;
        }
        v89 = 0;
LABEL_135:

        goto LABEL_136;
      }
      if (([v49 isEqualToString:@"IPSec"] & 1) != 0
        || ([v50 isEqualToString:@"L2TP"] & 1) != 0)
      {
        v51 = kNEIPSecKey;
      }
      else
      {
        if (![v50 isEqualToString:@"IKEv2"]) {
          goto LABEL_127;
        }
        v51 = kNEIKEv2Key;
      }
      v52 = [v47 objectForKeyedSubscript:*v51];
      if (!v52) {
        goto LABEL_127;
      }
      v53 = v52;
      v54 = [v52 objectForKeyedSubscript:@"AuthenticationMethod"];
      v55 = v54;
      if (!v54 || ([v54 isEqualToString:@"Certificate"] & 1) == 0)
      {
        id v56 = [v53 objectForKeyedSubscript:@"PayloadCertificateUUID"];
        if (!v56)
        {
          v26 = [v53 objectForKeyedSubscript:@"PayloadCertificateIdentityUUID"];
          if (!v26) {
            goto LABEL_88;
          }
        }
        v57 = [v53 objectForKeyedSubscript:@"ExtendedAuthEnabled"];
        if (!isa_nsnumber(v57))
        {

          if (!v56) {
            id v56 = v26;
          }
          goto LABEL_125;
        }
        v104 = v55;
        v58 = [v53 objectForKeyedSubscript:@"ExtendedAuthEnabled"];
        int v59 = [v58 BOOLValue];

        if (v56)
        {

          v55 = v104;
          if (!v59) {
            goto LABEL_126;
          }
LABEL_88:
          id v56 = [v53 objectForKeyedSubscript:@"IPSecSharedSecret"];
          if (v56
            || ([v53 objectForKeyedSubscript:@"SharedSecret"],
                (id v56 = (id)objc_claimAutoreleasedReturnValue()) != 0))
          {
            if (!isa_nsdata(v56))
            {
              if (isa_nsstring(v56)) {
                goto LABEL_115;
              }
              v64 = ne_log_obj();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
              {
                v99 = v55;
                v100 = objc_opt_class();
                id v101 = v100;
                v102 = objc_opt_class();
                *(_DWORD *)buf = 138412546;
                id v108 = v100;
                __int16 v109 = 2112;
                id v110 = v102;
                id v103 = v102;
                _os_log_debug_impl(&dword_19DDAF000, v64, OS_LOG_TYPE_DEBUG, "%@ extractPayloadContentsSharedSecret: Invalid shared secret object type %@, setting to nil", buf, 0x16u);

                v55 = v99;
              }

              v63 = 0;
              goto LABEL_114;
            }
            CFStringRef v62 = (CFStringRef)[[NSString alloc] initWithData:v56 encoding:4];
          }
          else
          {
            v65 = [v53 objectForKeyedSubscript:@"ExportedSharedSecret"];
            if (v65)
            {
              id v56 = v65;
              if ([v56 length])
              {
                v66 = v55;
                size_t v67 = [v56 length];
                v68 = (char *)malloc_type_malloc(v67, 0x9AA3A2uLL);
                [v56 getBytes:v68 length:v67];
                if (v67)
                {
                  v69 = &kVPNObfuscationKey;
                  v70 = v68;
                  do
                  {
                    char v71 = *v69++;
                    *v70++ ^= v71;
                    if (v69 == "؛[]y<I@") {
                      v69 = &kVPNObfuscationKey;
                    }
                    --v67;
                  }
                  while (v67);
                }
                size_t v72 = strlen(v68);
                v63 = (__CFString *)[[NSString alloc] initWithBytes:v68 length:v72 encoding:4];
                memset_s(v68, v72, 0, v72);
                free(v68);
                v55 = v66;
              }
              else
              {
                v63 = &stru_1EF054CB8;
              }

              goto LABEL_114;
            }
            v73 = [v53 objectForKeyedSubscript:@"IPSecSharedSecretObf"];
            id v56 = v73;
            if (!v73) {
              goto LABEL_115;
            }
            if (![v73 length])
            {
              v63 = &stru_1EF054CB8;
              goto LABEL_114;
            }
            v74 = v55;
            if (*CFDataGetBytePtr((CFDataRef)v56)) {
              int v75 = 335544576;
            }
            else {
              int v75 = 268435712;
            }
            BytePtr = (const char *)CFDataGetBytePtr((CFDataRef)v56);
            CFIndex v77 = strlen(BytePtr);
            CFAllocatorRef v78 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
            v79 = CFDataGetBytePtr((CFDataRef)v56);
            CFStringEncoding v80 = v75;
            v55 = v74;
            CFStringRef v62 = CFStringCreateWithBytes(v78, v79, v77, v80, 0);
          }
          v63 = (__CFString *)v62;
LABEL_114:

          id v56 = v63;
LABEL_115:
          v6->_sharedSecretRequired = 1;
          objc_storeStrong((id *)&v6->_sharedSecret, v56);
          if (v6->_sharedSecretRequired
            && [v50 isEqualToString:@"IKEv2"]
            && [v55 isEqualToString:@"None"])
          {
            v81 = [v53 objectForKeyedSubscript:@"ExtendedAuthEnabled"];
            if (isa_nsnumber(v81))
            {
              [v53 objectForKeyedSubscript:@"ExtendedAuthEnabled"];
              v82 = v105 = v55;
              int v83 = [v82 BOOLValue];

              v55 = v105;
              if (v83) {
                v6->_sharedSecretRequired = 0;
              }
            }
            else
            {
            }
          }
          v84 = ne_log_obj();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
          {
            v91 = v55;
            v92 = objc_opt_class();
            id v93 = v92;
            v94 = objc_opt_class();
            *(_DWORD *)buf = 138412546;
            id v108 = v92;
            __int16 v109 = 2112;
            id v110 = v94;
            id v95 = v94;
            _os_log_debug_impl(&dword_19DDAF000, v84, OS_LOG_TYPE_DEBUG, "%@ extractPayloadContentsSharedSecret: (value class %@)", buf, 0x16u);

            v55 = v91;
          }

LABEL_125:
          goto LABEL_126;
        }

        v55 = v104;
        if (v59) {
          goto LABEL_88;
        }
      }
LABEL_126:

      goto LABEL_127;
    }
  }
LABEL_136:

  return v6;
}

@end