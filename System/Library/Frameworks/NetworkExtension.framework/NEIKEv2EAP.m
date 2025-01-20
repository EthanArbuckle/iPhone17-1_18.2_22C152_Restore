@interface NEIKEv2EAP
+ (uint64_t)codeForPayload:(uint64_t)a1;
+ (uint64_t)loadModuleForType:(uint64_t)a1;
+ (uint64_t)typeForPayload:(uint64_t)a1;
- (CFDataRef)sessionKey;
- (NEIKEv2EAP)init;
- (id)createPayloadResponseForRequest:(void *)a1 type:(char)a2 typeData:(void *)a3 typeString:(void *)a4;
- (id)createPayloadResponseForRequest:(void *)a3 ikeSA:(BOOL *)a4 success:(BOOL *)a5 reportEAPError:;
- (void)dealloc;
@end

@implementation NEIKEv2EAP

- (void).cxx_destruct
{
}

- (NEIKEv2EAP)init
{
  if (MEMORY[0x1E4F5FBA0])
  {
    v7.receiver = self;
    v7.super_class = (Class)NEIKEv2EAP;
    v3 = [(NEIKEv2EAP *)&v7 init];
    if (v3)
    {
      *((void *)v3 + 19) = 0;
      *(_OWORD *)(v3 + 136) = 0u;
      *(_OWORD *)(v3 + 120) = 0u;
      *(_OWORD *)(v3 + 104) = 0u;
      *(_OWORD *)(v3 + 88) = 0u;
      *(_OWORD *)(v3 + 72) = 0u;
      *(_OWORD *)(v3 + 56) = 0u;
      *(_OWORD *)(v3 + 40) = 0u;
      *(_OWORD *)(v3 + 24) = 0u;
      *(_OWORD *)(v3 + 8) = 0u;
      self = v3;
      v2 = self;
      goto LABEL_5;
    }
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_FAULT, "[super init] failed", v6, 2u);
    }

    self = 0;
  }
  v2 = 0;
LABEL_5:

  return v2;
}

- (void)dealloc
{
  if (self && self->_module)
  {
    EAPClientModulePluginFree();
    self->_module = 0;
  }
  properties = self->_pluginData.properties;
  if (properties)
  {
    CFRelease(properties);
    self->_pluginData.properties = 0;
  }
  sec_identity = self->_pluginData.sec_identity;
  if (sec_identity)
  {
    CFRelease(sec_identity);
    self->_pluginData.sec_identity = 0;
  }
  encryptedEAPIdentity = self->_pluginData.encryptedEAPIdentity;
  if (encryptedEAPIdentity)
  {
    CFRelease(encryptedEAPIdentity);
    self->_pluginData.encryptedEAPIdentity = 0;
  }
  username = self->_pluginData.username;
  if (username)
  {
    free(username);
    self->_pluginData.username = 0;
  }
  password = self->_pluginData.password;
  if (password)
  {
    memset_s(password, self->_pluginData.password_length, 0, self->_pluginData.password_length);
    free(self->_pluginData.password);
    self->_pluginData.password = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2EAP;
  [(NEIKEv2EAP *)&v8 dealloc];
}

uint64_t __26__NEIKEv2EAP_getAKAModule__block_invoke()
{
  return EAPClientModuleAddBuiltinModule();
}

uint64_t __26__NEIKEv2EAP_getSIMModule__block_invoke()
{
  return EAPClientModuleAddBuiltinModule();
}

uint64_t __31__NEIKEv2EAP_getMSCHAPv2Module__block_invoke()
{
  return EAPClientModuleAddBuiltinModule();
}

uint64_t __26__NEIKEv2EAP_getGTCModule__block_invoke()
{
  return EAPClientModuleAddBuiltinModule();
}

uint64_t __26__NEIKEv2EAP_getTLSModule__block_invoke()
{
  return EAPClientModuleAddBuiltinModule();
}

uint64_t __27__NEIKEv2EAP_getPEAPModule__block_invoke()
{
  uint64_t result = EAPClientModuleAddBuiltinModule();
  if (!result)
  {
    return EAPClientModuleAddBuiltinModule();
  }
  return result;
}

+ (uint64_t)codeForPayload:(uint64_t)a1
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  if ((unint64_t)[v2 length] <= 3)
  {
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136315138;
      objc_super v7 = "+[NEIKEv2EAP codeForPayload:]";
      _os_log_fault_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_FAULT, "%s called with null (payload.length >= sizeof(EAPPacket))", (uint8_t *)&v6, 0xCu);
    }

    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = *(unsigned __int8 *)[v2 bytes];
  }

  return v3;
}

+ (uint64_t)typeForPayload:(uint64_t)a1
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  if (v2)
  {
    if ((unint64_t)[v2 length] >= 5
      && +[NEIKEv2EAP codeForPayload:]((uint64_t)NEIKEv2EAP, v2) - 3 >= 0xFFFFFFFE)
    {
      uint64_t v3 = *(unsigned __int8 *)([v2 bytes] + 4);
      goto LABEL_6;
    }
  }
  else
  {
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136315138;
      objc_super v7 = "+[NEIKEv2EAP typeForPayload:]";
      _os_log_fault_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_FAULT, "%s called with null payload", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v3 = 0;
LABEL_6:

  return v3;
}

- (id)createPayloadResponseForRequest:(void *)a1 type:(char)a2 typeData:(void *)a3 typeString:(void *)a4
{
  id v7 = a1;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v7 bytes];
  if (!v8 && v9)
  {
    id v8 = [v9 dataUsingEncoding:4];
  }
  v13[0] = 2;
  __int16 v14 = bswap32([v8 length] + 5) >> 16;
  v13[1] = *(unsigned char *)(v10 + 1);
  char v15 = a2;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  [v11 appendBytes:v13 length:5];
  if ([v8 length]) {
    [v11 appendData:v8];
  }

  return v11;
}

+ (uint64_t)loadModuleForType:(uint64_t)a1
{
  self;
  switch(a2)
  {
    case 18:
      self;
      if (!MEMORY[0x1E4F5FBC8]) {
        return 0;
      }
      if (getSIMModule_onceToken == -1) {
        goto LABEL_25;
      }
      v5 = &getSIMModule_onceToken;
      int v6 = &__block_literal_global_2;
      goto LABEL_34;
    case 19:
    case 20:
    case 21:
    case 22:
    case 24:
      return 0;
    case 23:
      self;
      if (!MEMORY[0x1E4F5FBB0]) {
        return 0;
      }
      if (getAKAModule_onceToken == -1) {
        goto LABEL_25;
      }
      v5 = &getAKAModule_onceToken;
      int v6 = &__block_literal_global_9022;
      goto LABEL_34;
    case 25:
      self;
      if (MEMORY[0x1E4F5FBD8]) {
        BOOL v3 = MEMORY[0x1E4F5FBC0] == 0;
      }
      else {
        BOOL v3 = 1;
      }
      if (v3) {
        return 0;
      }
      if (getPEAPModule_onceToken == -1) {
        goto LABEL_25;
      }
      v5 = &getPEAPModule_onceToken;
      int v6 = &__block_literal_global_10_9024;
      goto LABEL_34;
    case 26:
      self;
      if (!MEMORY[0x1E4F5FBC0]) {
        return 0;
      }
      if (getMSCHAPv2Module_onceToken == -1) {
        goto LABEL_25;
      }
      v5 = &getMSCHAPv2Module_onceToken;
      int v6 = &__block_literal_global_4;
      goto LABEL_34;
    default:
      if (a2 != 6)
      {
        if (a2 == 13)
        {
          self;
          if (MEMORY[0x1E4F5FBD0])
          {
            if (getTLSModule_onceToken == -1) {
              goto LABEL_25;
            }
            v5 = &getTLSModule_onceToken;
            int v6 = &__block_literal_global_8;
            goto LABEL_34;
          }
        }
        return 0;
      }
      self;
      if (!MEMORY[0x1E4F5FBB8]) {
        return 0;
      }
      if (getGTCModule_onceToken != -1)
      {
        v5 = &getGTCModule_onceToken;
        int v6 = &__block_literal_global_6;
LABEL_34:
        dispatch_once(v5, v6);
      }
LABEL_25:
      return EAPClientModuleLookup();
  }
}

- (id)createPayloadResponseForRequest:(void *)a3 ikeSA:(BOOL *)a4 success:(BOOL *)a5 reportEAPError:
{
  uint64_t v214 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  uint64_t v10 = a3;
  if (!a1) {
    goto LABEL_184;
  }
  if (a4) {
    *a4 = 0;
  }
  if (!v9)
  {
    v172 = ne_log_obj();
    if (os_log_type_enabled(v172, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[NEIKEv2EAP createPayloadResponseForRequest:ikeSA:success:reportEAPError:]";
      _os_log_fault_impl(&dword_19DDAF000, v172, OS_LOG_TYPE_FAULT, "%s called with null request", buf, 0xCu);
    }

    goto LABEL_184;
  }
  if (*(void *)(a1 + 168))
  {
    id v11 = 0;
    goto LABEL_7;
  }
  id v27 = v9;
  v28 = v10;
  self = v28;
  if (v28)
  {
    id v29 = v28;
    int v205 = 0;
    int v30 = +[NEIKEv2EAP codeForPayload:]((uint64_t)NEIKEv2EAP, v27);
    if (v30 != 1)
    {
      int v51 = v30;
      log = ne_log_obj();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v51;
        _os_log_error_impl(&dword_19DDAF000, log, OS_LOG_TYPE_ERROR, "error: received EAP packet with code %u", buf, 8u);
      }
      id v11 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_179;
    }
    v193 = a4;
    int v31 = +[NEIKEv2EAP typeForPayload:]((uint64_t)NEIKEv2EAP, v27);
    v32 = v29;
    int v33 = v31;
    v35 = objc_getProperty(v32, v34, 96, 1);
    log = v35;
    if (v33 != 1)
    {
      [v35 eapProtocols];
      v37 = v36 = a5;
      uint64_t v38 = [v37 count];

      a5 = v36;
      if (v38)
      {
        id v188 = v27;
        v190 = v10;
        long long v203 = 0u;
        long long v204 = 0u;
        long long v201 = 0u;
        long long v202 = 0u;
        v39 = [log eapProtocols];
        uint64_t v40 = [v39 countByEnumeratingWithState:&v201 objects:v207 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v202;
          while (2)
          {
            for (uint64_t i = 0; i != v41; ++i)
            {
              if (*(void *)v202 != v42) {
                objc_enumerationMutation(v39);
              }
              v44 = *(void **)(*((void *)&v201 + 1) + 8 * i);
              if (v44)
              {
                unint64_t v46 = [*(id *)(*((void *)&v201 + 1) + 8 * i) method] - 2;
                if (v46 <= 5 && dword_19DF9D178[v46] == v33)
                {
                  objc_setProperty_atomic((id)a1, v45, v44, 160);
                  goto LABEL_74;
                }
              }
            }
            uint64_t v41 = [v39 countByEnumeratingWithState:&v201 objects:v207 count:16];
            if (v41) {
              continue;
            }
            break;
          }
        }
LABEL_74:

        id v27 = v188;
        uint64_t v10 = v190;
        a5 = v36;
        if (!objc_getProperty((id)a1, v61, 160, 1))
        {
          v64 = [log eapProtocols];
          id v11 = [v64 copy];
LABEL_178:

          a4 = v193;
LABEL_179:

          goto LABEL_180;
        }
      }
    }
    uint64_t v62 = +[NEIKEv2EAP loadModuleForType:]((uint64_t)NEIKEv2EAP, v33);
    *(void *)(a1 + 168) = v62;
    if (v33 != 1 && !v62)
    {
      v64 = ne_log_obj();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v33;
        _os_log_error_impl(&dword_19DDAF000, v64, OS_LOG_TYPE_ERROR, "error: module is null for type %u", buf, 8u);
      }
      id v11 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_178;
    }
    switch((char)v33)
    {
      case 18:
        id v65 = v27;
        v66 = objc_msgSend(objc_getProperty((id)a1, v63, 160, 1), "properties");
        v67 = v66;
        v68 = @"EAPSIMProperties";
        goto LABEL_92;
      case 19:
      case 20:
      case 21:
      case 22:
      case 24:
        goto LABEL_86;
      case 23:
        id v65 = v27;
        v66 = objc_msgSend(objc_getProperty((id)a1, v63, 160, 1), "properties");
        v67 = v66;
        v68 = @"EAPAKAProperties";
        goto LABEL_92;
      case 25:
        id v65 = v27;
        v66 = objc_msgSend(objc_getProperty((id)a1, v63, 160, 1), "properties");
        v67 = v66;
        v68 = @"EAPPEAPProperties";
        goto LABEL_92;
      case 26:
        id v65 = v27;
        v66 = objc_msgSend(objc_getProperty((id)a1, v63, 160, 1), "properties");
        v67 = v66;
        v68 = @"EAPMSCHAPv2Properties";
        goto LABEL_92;
      default:
        if (v33 == 6)
        {
          id v65 = v27;
          v66 = objc_msgSend(objc_getProperty((id)a1, v63, 160, 1), "properties");
          v67 = v66;
          v68 = @"EAPGTCProperties";
        }
        else
        {
          if (v33 != 13)
          {
LABEL_86:
            if (!v62)
            {
              v64 = 0;
              id v11 = 0;
              goto LABEL_178;
            }
            *(_OWORD *)(a1 + 8) = 0u;
            *(void *)(a1 + 152) = 0;
            *(_OWORD *)(a1 + 120) = 0u;
            *(_OWORD *)(a1 + 136) = 0u;
            *(_OWORD *)(a1 + 88) = 0u;
            *(_OWORD *)(a1 + 104) = 0u;
            *(_OWORD *)(a1 + 56) = 0u;
            *(_OWORD *)(a1 + 72) = 0u;
            *(_OWORD *)(a1 + 24) = 0u;
            *(_OWORD *)(a1 + 40) = 0u;
            goto LABEL_96;
          }
          id v65 = v27;
          v66 = objc_msgSend(objc_getProperty((id)a1, v63, 160, 1), "properties");
          v67 = v66;
          v68 = @"EAPTLSProperties";
        }
LABEL_92:
        v64 = [v66 objectForKeyedSubscript:v68];

        if (!*(void *)(a1 + 168))
        {
          id v11 = 0;
          id v27 = v65;
          goto LABEL_178;
        }
        *(_OWORD *)(a1 + 8) = 0u;
        *(void *)(a1 + 152) = 0;
        *(_OWORD *)(a1 + 120) = 0u;
        *(_OWORD *)(a1 + 136) = 0u;
        *(_OWORD *)(a1 + 88) = 0u;
        *(_OWORD *)(a1 + 104) = 0u;
        *(_OWORD *)(a1 + 56) = 0u;
        *(_OWORD *)(a1 + 72) = 0u;
        *(_OWORD *)(a1 + 24) = 0u;
        *(_OWORD *)(a1 + 40) = 0u;
        id v27 = v65;
        if (v64)
        {
          v191 = v10;
          id v187 = [v64 mutableCopy];
          goto LABEL_97;
        }
LABEL_96:
        v191 = v10;
        id v187 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v64 = 0;
LABEL_97:
        v186 = v64;
        id v70 = objc_getProperty((id)a1, v69, 160, 1);
        v72 = v70;
        v184 = a5;
        id v189 = v27;
        if (v70
          && ([v70 method] == 4 || objc_msgSend(v72, "method") == 5 || objc_msgSend(v72, "method") == 7))
        {
          BOOL v73 = 1;
        }
        else
        {
          BOOL v73 = 0;
          if (v33 != 23 && v33 != 18) {
            goto LABEL_106;
          }
        }
        id v27 = objc_getProperty(self, v71, 88, 1);
        v64 = [v27 username];
        uint64_t v74 = [v64 length];
        if (v73)
        {
          uint64_t v75 = v74;

          v77 = self;
          if (v75)
          {
LABEL_104:
            id v78 = objc_getProperty(v77, v76, 88, 1);
            v79 = [v78 username];
            uint64_t v10 = v191;
            goto LABEL_116;
          }
LABEL_113:
          id v80 = objc_getProperty(v77, v76, 88, 1);
          v81 = [v80 localPrivateEAPIdentity];

          id v83 = objc_getProperty(v77, v82, 88, 1);
          id v78 = v83;
          uint64_t v10 = v191;
          if (v81)
          {
            v79 = [v83 localPrivateEAPIdentity];
          }
          else
          {
            v84 = [v83 localIdentifier];
            v79 = [v84 stringValue];
          }
LABEL_116:

          if (v79)
          {
            size_t v86 = [v79 maximumLengthOfBytesUsingEncoding:4];
            v87 = malloc_type_malloc(v86, 0x6DA5E840uLL);
            *(void *)(a1 + 48) = v87;
            [v79 getCString:v87 maxLength:v86 encoding:4];
            *(_DWORD *)(a1 + 56) = strnlen(*(const char **)(a1 + 48), v86);
          }
          v185 = v79;
          id v88 = objc_getProperty(v77, v85, 88, 1);
          v89 = [v88 localEncryptedEAPIdentity];

          id v27 = v189;
          if (v89)
          {
            id v91 = objc_getProperty(v77, v90, 88, 1);
            *(void *)(a1 + 64) = [v91 localEncryptedEAPIdentity];
          }
          id v92 = objc_getProperty((id)a1, v90, 160, 1);
          if (v92)
          {
            v94 = v92;
            if ([v92 method] == 4 || objc_msgSend(v94, "method") == 5)
            {

              goto LABEL_124;
            }
            uint64_t v118 = [v94 method];

            if (v118 == 7)
            {
LABEL_124:
              if (!objc_getProperty(v77, v93, 88, 1))
              {
                id v115 = v189;
                v116 = ne_log_obj();
                a5 = v184;
                if (os_log_type_enabled(v116, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  *(void *)&buf[4] = "-[NEIKEv2IKESA password]";
                  _os_log_fault_impl(&dword_19DDAF000, v116, OS_LOG_TYPE_FAULT, "%s called with null self.sessionConfiguration", buf, 0xCu);
                }

                v117 = 0;
                goto LABEL_174;
              }
              if (!objc_getProperty(v77, v95, 512, 1))
              {
                v97 = objc_msgSend(objc_getProperty(v77, v96, 88, 1), "passwordReference");

                if (v97)
                {
                  v99 = objc_msgSend(objc_getProperty(v77, v98, 88, 1), "passwordReference");
                  v100 = +[NEIKEv2Crypto copyDataFromPersistentReference:]((uint64_t)NEIKEv2Crypto, v99);
                  objc_setProperty_atomic(v77, v101, v100, 512);

                  if (!objc_getProperty(v77, v102, 512, 1))
                  {
                    v103 = ne_log_obj();
                    if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)&buf[4] = v77;
                      _os_log_error_impl(&dword_19DDAF000, v103, OS_LOG_TYPE_ERROR, "%@ Failed to retrieve password by reference", buf, 0xCu);
                    }
                  }
                }
                id v105 = objc_getProperty(v77, v98, 512, 1);
                if (v105) {
                  goto LABEL_134;
                }
                v106 = objc_msgSend(objc_getProperty(v77, v104, 88, 1), "password");

                if (v106)
                {
                  uint64_t v107 = MEMORY[0x1E4F1C9B8];
                  objc_msgSend(objc_getProperty(v77, v96, 88, 1), "password");
                  id v105 = (id)objc_claimAutoreleasedReturnValue();
                  v108 = [v105 dataUsingEncoding:4];
                  CFDataRef v109 = +[NSData sensitiveDataWithData:](v107, v108);
                  objc_setProperty_atomic(v77, v110, v109, 512);

                  id v27 = v189;
LABEL_134:
                }
              }
              v111 = objc_getProperty(v77, v96, 512, 1);
              if (v111)
              {
                v112 = v111;
                v113 = malloc_type_malloc([v111 length] + 1, 0x31382A17uLL);
                if (!v113)
                {
                  v117 = v112;
                  id v115 = v27;
                  v135 = ne_log_obj();
                  if (os_log_type_enabled(v135, OS_LOG_TYPE_FAULT))
                  {
                    uint64_t v173 = [v117 length];
                    *(_DWORD *)buf = 134217984;
                    *(void *)&buf[4] = v173 + 1;
                    _os_log_fault_impl(&dword_19DDAF000, v135, OS_LOG_TYPE_FAULT, "malloc(%zu) failed", buf, 0xCu);
                  }
                  a5 = v184;
                  v64 = v186;
                  goto LABEL_175;
                }
                v114 = v113;
                memcpy(v113, (const void *)[v112 bytes], [v112 length]);
                v114[[v112 length]] = 0;
                *(void *)(a1 + 72) = v114;
                *(_DWORD *)(a1 + 80) = [v112 length];
                if (v185)
                {

                  goto LABEL_143;
                }
                v117 = v112;
                id v115 = v27;
              }
              else
              {
                id v115 = v27;
                v117 = 0;
              }
              a5 = v184;
LABEL_174:
              v64 = v186;
              v135 = ne_log_obj();
              if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR))
              {
                v137 = "password";
                if (!v185) {
                  v137 = "username";
                }
                *(_DWORD *)buf = 136315138;
                *(void *)&buf[4] = v137;
                _os_log_error_impl(&dword_19DDAF000, v135, OS_LOG_TYPE_ERROR, "EAP plugin data initialization failed, missing %s", buf, 0xCu);
              }
LABEL_175:

              id v27 = v115;
              v134 = v117;
LABEL_176:

              id v11 = (id)MEMORY[0x1E4F1CBF0];
LABEL_177:

              goto LABEL_178;
            }
          }
LABEL_143:
          id v119 = objc_getProperty((id)a1, v93, 160, 1);
          v64 = v186;
          if (!v119) {
            goto LABEL_221;
          }
          v120 = v119;
          if ([v119 method] == 6)
          {
          }
          else
          {
            uint64_t v122 = [v120 method];

            BOOL v123 = v122 == 7;
            v64 = v186;
            if (!v123) {
              goto LABEL_221;
            }
          }
          uint64_t v124 = [(NEIKEv2IKESA *)v77 copyLocalSecIdentity];
          *(void *)(a1 + 104) = v124;
          if (!v124)
          {
            v134 = ne_log_obj();
            a5 = v184;
            if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_19DDAF000, v134, OS_LOG_TYPE_ERROR, "EAP plugin data initialization failed, missing identity certificate", buf, 2u);
            }
            goto LABEL_176;
          }
          [v187 setObject:*MEMORY[0x1E4F1CFD0] forKeyedSubscript:@"TLSCertificateIsRequired"];
          id v125 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v192 = v10;
          if (v125)
          {
            id v126 = -[NEIKEv2IKESA copyRemoteCertificateAuthorityArray](self);
            if (v126)
            {
              long long v212 = 0u;
              long long v213 = 0u;
              long long v210 = 0u;
              long long v211 = 0u;
              v127 = v126;
              uint64_t v128 = [v127 countByEnumeratingWithState:&v210 objects:buf count:16];
              if (v128)
              {
                uint64_t v129 = v128;
                uint64_t v130 = *(void *)v211;
                do
                {
                  for (uint64_t j = 0; j != v129; ++j)
                  {
                    if (*(void *)v211 != v130) {
                      objc_enumerationMutation(v127);
                    }
                    CFDataRef v132 = SecCertificateCopyData(*(SecCertificateRef *)(*((void *)&v210 + 1) + 8 * j));
                    if (v132)
                    {
                      [v125 addObject:v132];
                    }
                    else
                    {
                      v133 = ne_log_obj();
                      if (os_log_type_enabled(v133, OS_LOG_TYPE_FAULT))
                      {
                        *(_WORD *)v200 = 0;
                        _os_log_fault_impl(&dword_19DDAF000, v133, OS_LOG_TYPE_FAULT, "SecCertificateCopyData failed", v200, 2u);
                      }
                    }
                  }
                  uint64_t v129 = [v127 countByEnumeratingWithState:&v210 objects:buf count:16];
                }
                while (v129);
              }

              v134 = v125;
              id v27 = v189;
LABEL_201:

              if ([v134 count])
              {
                [v187 setObject:v134 forKeyedSubscript:@"TLSTrustedCertificates"];
                v140 = 0;
                uint64_t v10 = v192;
                goto LABEL_211;
              }
              id v141 = objc_getProperty(self, v139, 88, 1);
              v140 = [v141 remoteCertificateHostname];

              uint64_t v10 = v192;
              if (v140)
              {
LABEL_210:
                *(void *)&long long v210 = v140;
                v153 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v210, 1, v182);
                [v187 setObject:v153 forKeyedSubscript:@"TLSTrustedServerNames"];

                goto LABEL_211;
              }
              v183 = v134;
              id v143 = objc_getProperty(self, v142, 88, 1);
              v144 = [v143 remoteIdentifier];
              if ([v144 identifierType] != 2)
              {
                id v146 = objc_getProperty(self, v145, 88, 1);
                v147 = [v146 remoteIdentifier];
                if ([v147 identifierType] != 1)
                {
                  id v175 = objc_getProperty(self, v148, 88, 1);
                  v176 = [v175 remoteIdentifier];
                  uint64_t v182 = [v176 identifierType];

                  if (v182 != 5)
                  {
                    id v177 = objc_getProperty(self, v149, 80, 1);
                    v178 = [v177 remoteEndpoint];
                    objc_opt_class();
                    char isKindOfClass = objc_opt_isKindOfClass();

                    if ((isKindOfClass & 1) == 0)
                    {
                      v140 = 0;
                      uint64_t v10 = v192;
                      id v27 = v189;
                      v134 = v183;
LABEL_211:
                      uint64_t v154 = [v134 count];
                      if (!v140 && !v154)
                      {
                        v156 = ne_log_obj();
                        a5 = v184;
                        if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_error_impl(&dword_19DDAF000, v156, OS_LOG_TYPE_ERROR, "EAP plugin data initialization failed, missing server certificate validation info", buf, 2u);
                        }

                        v64 = v186;
                        goto LABEL_176;
                      }
                      id v157 = objc_getProperty(self, v155, 88, 1);
                      v158 = [v157 tlsMinimumVersion];

                      if (v158)
                      {
                        id v160 = objc_getProperty(self, v159, 88, 1);
                        v161 = [v160 tlsMinimumVersion];
                        [v187 setObject:v161 forKeyedSubscript:@"TLSMinimumVersion"];
                      }
                      id v162 = objc_getProperty(self, v159, 88, 1);
                      v163 = [v162 tlsMaximumVersion];

                      if (v163)
                      {
                        id v165 = objc_getProperty(self, v164, 88, 1);
                        v166 = [v165 tlsMaximumVersion];
                        [v187 setObject:v166 forKeyedSubscript:@"TLSMaximumVersion"];
                      }
                      v64 = v186;
LABEL_221:
                      id v167 = v27;
                      *(_DWORD *)(a1 + 24) = 1024;
                      *(void *)(a1 + 88) = v187;
                      *(void *)v200 = 0;
                      int v168 = EAPClientModulePluginInit();
                      if (*(void *)v200)
                      {
                        CFRelease(*(CFTypeRef *)v200);
                        *(void *)v200 = 0;
                      }
                      a5 = v184;
                      if (v168)
                      {
                        v169 = ne_log_obj();
                        if (os_log_type_enabled(v169, OS_LOG_TYPE_ERROR))
                        {
                          id Property = objc_getProperty((id)a1, v170, 160, 1);
                          *(_DWORD *)buf = 138412546;
                          *(void *)&buf[4] = Property;
                          *(_WORD *)&buf[12] = 1024;
                          int v209 = v168;
                          _os_log_error_impl(&dword_19DDAF000, v169, OS_LOG_TYPE_ERROR, "%@ EAP client module init failed with status %u", buf, 0x12u);
                        }

                        objc_setProperty_atomic((id)a1, v171, 0, 160);
                        *(void *)(a1 + 168) = 0;
                        id v11 = (id)MEMORY[0x1E4F1CBF0];
                      }
                      else
                      {
                        id v11 = 0;
                      }
                      id v27 = v167;
                      goto LABEL_177;
                    }
                    id v150 = objc_getProperty(self, v180, 80, 1);
                    v151 = [v150 remoteEndpoint];
                    uint64_t v152 = [v151 hostname];
                    goto LABEL_209;
                  }
LABEL_208:
                  id v150 = objc_getProperty(self, v149, 88, 1);
                  v151 = [v150 remoteIdentifier];
                  uint64_t v152 = [v151 stringValue];
LABEL_209:
                  v140 = (void *)v152;
                  uint64_t v10 = v192;

                  id v27 = v189;
                  v134 = v183;
                  if (!v140) {
                    goto LABEL_211;
                  }
                  goto LABEL_210;
                }
              }
              goto LABEL_208;
            }
            v138 = ne_log_obj();
            if (os_log_type_enabled(v138, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_19DDAF000, v138, OS_LOG_TYPE_FAULT, "[self copyRemoteCertificateAuthorityArray] failed", buf, 2u);
            }

            v127 = 0;
          }
          else
          {
            v127 = ne_log_obj();
            if (os_log_type_enabled(v127, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_19DDAF000, v127, OS_LOG_TYPE_FAULT, "[[NSMutableArray alloc] init] failed", buf, 2u);
            }
          }
          v134 = 0;
          goto LABEL_201;
        }
        BOOL v73 = v74 != 0;
LABEL_106:
        if ((v33 == 23 || v33 == 18)
          && ((v64, v33 == 23) || v33 == 18))
        {

          v77 = self;
          if (v73) {
            goto LABEL_104;
          }
        }
        else
        {

          v77 = self;
          if (v73) {
            goto LABEL_104;
          }
        }
        goto LABEL_113;
    }
  }
  v181 = ne_log_obj();
  if (os_log_type_enabled(v181, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[NEIKEv2EAP selectModuleForPayload:ikeSA:]";
    _os_log_fault_impl(&dword_19DDAF000, v181, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", buf, 0xCu);
  }

  id v11 = (id)MEMORY[0x1E4F1CBF0];
LABEL_180:

  if (v11 && ![v11 count])
  {
    v47 = ne_log_obj();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
LABEL_183:

LABEL_184:
      v24 = 0;
      goto LABEL_185;
    }
    *(_WORD *)buf = 0;
    v48 = "Failed to select EAP module";
    v49 = v47;
    uint32_t v50 = 2;
LABEL_189:
    _os_log_error_impl(&dword_19DDAF000, v49, OS_LOG_TYPE_ERROR, v48, buf, v50);
    goto LABEL_183;
  }
LABEL_7:
  int v12 = +[NEIKEv2EAP codeForPayload:]((uint64_t)NEIKEv2EAP, v9);
  if (v12 != 1)
  {
    int v25 = 0;
LABEL_23:
    if (*(void *)(a1 + 168))
    {
      *(void *)buf = 0;
      v207[0] = 0;
      LODWORD(v210) = 0;
      [v9 bytes];
      int v26 = EAPClientModulePluginProcess();
      if (*(void *)buf)
      {
        v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytes:length:");
        if (!a5) {
          goto LABEL_60;
        }
      }
      else
      {
        v24 = 0;
        if (!a5) {
          goto LABEL_60;
        }
      }
      if (v210) {
        *a5 = v210 == 19;
      }
LABEL_60:
      if (v26 == 1)
      {
        if (v10)
        {
          v10[18] = 1;
          v10[20] = 1;
        }
        if (!a4) {
          goto LABEL_72;
        }
        BOOL v60 = 1;
        goto LABEL_71;
      }
      if (v26 || v207[0])
      {
        if (a4)
        {
          BOOL v60 = 0;
LABEL_71:
          *a4 = v60;
        }
      }
      else if (a4)
      {
        BOOL v60 = *(void *)buf != 0;
        goto LABEL_71;
      }
LABEL_72:
      EAPClientModulePluginFreePacket();

      goto LABEL_185;
    }
    v47 = ne_log_obj();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      goto LABEL_183;
    }
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v12;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v25;
    v48 = "EAP payload could not be processed (code %d type %d)\n";
    v49 = v47;
    uint32_t v50 = 14;
    goto LABEL_189;
  }
  int v13 = +[NEIKEv2EAP typeForPayload:]((uint64_t)NEIKEv2EAP, v9);
  if (v11)
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    long long v196 = 0u;
    long long v197 = 0u;
    long long v198 = 0u;
    long long v199 = 0u;
    id v16 = v11;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v196 objects:v206 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v197;
      do
      {
        for (uint64_t k = 0; k != v18; ++k)
        {
          if (*(void *)v197 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v196 + 1) + 8 * k);
          buf[0] = 0;
          if (v21)
          {
            unint64_t v22 = [v21 method] - 2;
            if (v22 <= 5)
            {
              buf[0] = 0x190D061A1712uLL >> (8 * v22);
              [v15 appendBytes:buf length:1];
            }
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v196 objects:v206 count:16];
      }
      while (v18);
    }

    uint64_t v23 = -[NEIKEv2EAP createPayloadResponseForRequest:type:typeData:typeString:](v9, 3, v15, 0);
    v24 = (void *)v23;
    if (a4) {
      *a4 = v23 != 0;
    }

    goto LABEL_185;
  }
  int v25 = v13;
  if (v13 != 1) {
    goto LABEL_23;
  }
  if (v10) {
    id v52 = objc_getProperty(v10, v14, 88, 1);
  }
  else {
    id v52 = 0;
  }
  id v53 = v52;
  v54 = [v53 username];

  if (!v54)
  {
    if (v10) {
      id v56 = objc_getProperty(v10, v55, 88, 1);
    }
    else {
      id v56 = 0;
    }
    id v57 = v56;
    v58 = [v57 localIdentifier];
    v54 = [v58 stringValue];
  }
  uint64_t v59 = -[NEIKEv2EAP createPayloadResponseForRequest:type:typeData:typeString:](v9, 1, 0, v54);
  v24 = (void *)v59;
  if (a4) {
    *a4 = v59 != 0;
  }

LABEL_185:

  return v24;
}

- (CFDataRef)sessionKey
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (*(void *)(a1 + 168))
    {
      int v1 = EAPClientModulePluginMasterSessionKeyCopyBytes();
      if (v1 >= 1)
      {
        rsize_t v2 = v1;
        self;
        CFAllocatorRef v3 = (const __CFAllocator *)SecCFAllocatorZeroize();
        CFDataRef v4 = CFDataCreate(v3, (const UInt8 *)&v7, v2);
        memset_s(&v7, 0x40uLL, 0, v2);
        goto LABEL_9;
      }
    }
    else
    {
      v5 = ne_log_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        int v7 = 136315138;
        id v8 = "-[NEIKEv2EAP sessionKey]";
        _os_log_fault_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_FAULT, "%s called with null self.module", (uint8_t *)&v7, 0xCu);
      }
    }
  }
  CFDataRef v4 = 0;
LABEL_9:

  return v4;
}

@end