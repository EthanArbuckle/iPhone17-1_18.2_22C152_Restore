@interface NEUtilConfigurationClient
+ (id)allClients;
+ (id)clientWithName:(id)a3;
+ (void)removeClientWithName:(id)a3;
- (BOOL)addOnDemandRuleWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)addRelayWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)createConfigurationWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)disconnectOnDemandEnabled;
- (BOOL)enabled;
- (BOOL)isAlwaysOn;
- (BOOL)onDemandEnabled;
- (BOOL)onDemandUserOverrideDisabled;
- (BOOL)removeOnDemandRuleWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)removeRelayWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setAppPushParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setCommonParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setDNSParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setDNSProxyWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setFilterPluginWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setIPSecParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setPasswordWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setProtocolWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setProviderTypeWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setProxyParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setProxyServer:(id)a3 errorStr:(id *)a4;
- (BOOL)setRelayConditionsWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setSharedSecretWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)unsetAppPushParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)unsetCommonParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)unsetDNSParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)unsetDNSProxyWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)unsetFilterPluginParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)unsetIPSecParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)unsetPasswordWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)unsetProxyParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)unsetProxyServer:(id)a3 errorStr:(id *)a4;
- (BOOL)unsetRelayConditionsWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)unsetSharedSecretWithParameters:(id)a3 errorStr:(id *)a4;
- (NEAppPush)appPush;
- (NEDNSProxyProviderProtocol)dnsProxyConfiguration;
- (NEDNSSettingsBundle)dnsSettingsBundle;
- (NEFilterProviderConfiguration)filterConfiguration;
- (NEUtilConfigurationClient)initWithClientName:(id)a3;
- (NSArray)onDemandRules;
- (NSString)clientName;
- (id)initInternalWithClientName:(id)a3;
- (id)protocolForParameters:(id)a3;
- (id)relayConfiguration;
- (uint64_t)setPPPParameters:(void *)a3 errorStr:;
- (uint64_t)unsetPPPParameters:(void *)a3 errorStr:;
- (void)addAppRuleWithParameters:(void *)a3 errorStr:;
- (void)addPathRuleWithParameters:(__CFString *)a3 errorStr:;
- (void)dealloc;
- (void)handleCommand:(int)a3 forConfigWithName:(id)a4 withParameters:(id)a5 completionHandler:(id)a6;
- (void)loadConfigurationsForceRefresh:(void *)a3 completionHandler:;
- (void)removeAppRuleWithParameters:(void *)a3 errorStr:;
- (void)removePathRuleWithParameters:(void *)a3 errorStr:;
- (void)setAlwaysOnParameters:(__CFString *)a3 errorStr:;
- (void)setDisconnectOnDemandEnabled:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setOnDemandEnabled:(BOOL)a3;
- (void)setOnDemandRules:(id)a3;
- (void)setOnDemandUserOverrideDisabled:(BOOL)a3;
- (void)setPathControllerWithParameters:(void *)a3 errorStr:;
- (void)swapConfigurationTypeWithParameters:(void *)a3 errorStr:;
- (void)unsetAlwaysOnParameters:(__CFString *)a3 errorStr:;
@end

@implementation NEUtilConfigurationClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_identities, 0);
  objc_storeStrong((id *)&self->_currentConfigurations, 0);
  objc_storeStrong((id *)&self->_createdConfigurations, 0);
  objc_storeStrong((id *)&self->_manager, 0);

  objc_storeStrong((id *)&self->_clientName, 0);
}

- (BOOL)isAlwaysOn
{
  return self->_isAlwaysOn;
}

- (NSString)clientName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)handleCommand:(int)a3 forConfigWithName:(id)a4 withParameters:(id)a5 completionHandler:(id)a6
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v75 = a4;
  id v76 = a5;
  id v10 = a6;
  v11 = (void (**)(void, void))v10;
  if (a3 == 37)
  {
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke;
    v89[3] = &unk_1E59936F8;
    v89[4] = self;
    v13 = (void (**)(void, void))v10;
    id v90 = v10;
    v15 = v89;
    if (self)
    {
      objc_setProperty_atomic(self, v14, 0, 48);
      id Property = objc_getProperty(self, v16, 24, 1);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __69__NEUtilConfigurationClient_reloadIdentityListWithCompletionHandler___block_invoke;
      v98 = &unk_1E5992E30;
      v99 = self;
      v100 = v15;
      [Property copyIdentities:0 fromDomain:0 withCompletionQueue:MEMORY[0x1E4F14428] handler:buf];
    }
    goto LABEL_32;
  }
  if (a3 != 36)
  {
    if ((a3 & 0xFFFFFFFE) == 0x1E)
    {
      v73 = (void (**)(void, void))v10;
      v18 = [v76 objectForKeyedSubscript:@"configuration-file-path"];
      v72 = v18;
      v19 = v18;
      v11 = v73;
      if (v18)
      {
        if (([v18 hasPrefix:@"/"] & 1) == 0)
        {
          v40 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"Configuration file path must be an absolute file path.", 0);
          ((void (**)(void, void *))v73)[2](v73, v40);

LABEL_70:
          v11 = v73;
          goto LABEL_33;
        }
        v82[0] = MEMORY[0x1E4F143A8];
        v82[1] = 3221225472;
        v83 = __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2;
        v84 = &unk_1E5992E58;
        int v88 = a3;
        id v20 = v75;
        id v85 = v20;
        v86 = self;
        v87 = v73;
        id v68 = v19;
        id v74 = v20;
        v67 = v82;
        if (!self)
        {
LABEL_69:

          goto LABEL_70;
        }
        v71 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
        id v70 = v68;
        v21 = [MEMORY[0x1E4F28CB8] defaultManager];
        int v22 = [v21 isReadableFileAtPath:v70];

        if (!v22)
        {
          v41 = [MEMORY[0x1E4F28CB8] defaultManager];
          int v42 = [v41 fileExistsAtPath:v70];

          if (v42) {
            [NSString stringWithFormat:@"File %@ is unreadable\n", v70];
          }
          else {
          v43 = [NSString stringWithFormat:@"File %@ not found\n", v70];
          }
          id v44 = 0;
          v69 = 0;
          id v66 = 0;
          goto LABEL_47;
        }
        v95[0] = 0;
        v64 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v70 options:0 error:v95];
        id v63 = v95[0];
        if (!v64)
        {
          v45 = ne_log_obj();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v70;
            _os_log_error_impl(&dword_19DDAF000, v45, OS_LOG_TYPE_ERROR, "%@ Failed to read data from %@", buf, 0x16u);
          }

          v43 = [NSString stringWithFormat:@"Failed to read data from %@\n", v70];
          id v66 = 0;

          id v44 = 0;
          v69 = 0;
          goto LABEL_47;
        }
        v23 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v64 error:0];
        [v23 setClass:objc_opt_class() forClassName:@"NEVPNAppRule"];
        [v23 setClass:objc_opt_class() forClassName:@"NEVPNProtocolPlugin"];
        uint64_t v62 = [v23 decodeInt64ForKey:@"Version"];
        v24 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v25 = objc_opt_class();
        uint64_t v26 = objc_opt_class();
        uint64_t v27 = objc_opt_class();
        uint64_t v28 = objc_opt_class();
        v29 = objc_msgSend(v24, "setWithObjects:", v25, v26, v27, v28, objc_opt_class(), 0);
        v69 = [v23 decodeObjectOfClasses:v29 forKey:@"Index"];
        id v65 = v23;

        if (!v69 || v62)
        {
LABEL_46:

          id v44 = v65;
          v43 = 0;
          id v66 = v44;
LABEL_47:
          id v46 = v43;

          v47 = (__CFString *)v46;
          id v48 = v44;
          if (v47)
          {
            v49 = 0;
            v50 = 0;
          }
          else
          {
            if (v69)
            {
              v50 = [v69 objectForKeyedSubscript:@"AppGroupMap"];
              long long v93 = 0u;
              long long v94 = 0u;
              long long v91 = 0u;
              long long v92 = 0u;
              v51 = [v69 objectForKeyedSubscript:@"ConfigurationProperties"];
              uint64_t v52 = [v51 countByEnumeratingWithState:&v91 objects:buf count:16];
              if (v52)
              {
                uint64_t v53 = *(void *)v92;
LABEL_52:
                uint64_t v54 = 0;
                while (1)
                {
                  if (*(void *)v92 != v53) {
                    objc_enumerationMutation(v51);
                  }
                  id v55 = *(id *)(*((void *)&v91 + 1) + 8 * v54);
                  id v56 = v48;
                  uint64_t v57 = objc_opt_class();
                  v58 = [v55 UUIDString];
                  v49 = [v56 decodeObjectOfClass:v57 forKey:v58];

                  if (v49)
                  {
                    if (!v74
                      || ![v74 length]
                      || ([v49 name],
                          v59 = objc_claimAutoreleasedReturnValue(),
                          int v60 = [v74 isEqualToString:v59],
                          v59,
                          v60))
                    {
                      v61 = [v49 identifier];
                      [v71 setObject:v49 forKeyedSubscript:v61];

                      if ([v74 length]) {
                        break;
                      }
                    }
                  }

                  if (v52 == ++v54)
                  {
                    uint64_t v52 = [v51 countByEnumeratingWithState:&v91 objects:buf count:16];
                    if (v52) {
                      goto LABEL_52;
                    }
                    goto LABEL_62;
                  }
                }
              }
              else
              {
LABEL_62:
                v49 = 0;
              }
              v47 = 0;
            }
            else
            {
              v51 = ne_log_obj();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = self;
                _os_log_impl(&dword_19DDAF000, v51, OS_LOG_TYPE_INFO, "%@ empty configurations", buf, 0xCu);
              }
              v49 = 0;
              v50 = 0;
              v47 = @"Empty configuration";
            }
          }
          v83((uint64_t)v67, v47, v71, v49, v50);

          goto LABEL_69;
        }
        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        id v30 = v69;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v91 objects:buf count:16];
        if (v31)
        {
          v32 = 0;
          id v33 = 0;
          uint64_t v34 = *(void *)v92;
          do
          {
            for (uint64_t i = 0; i != v31; ++i)
            {
              if (*(void *)v92 != v34) {
                objc_enumerationMutation(v30);
              }
              uint64_t v36 = *(void *)(*((void *)&v91 + 1) + 8 * i);
              if (!v32)
              {
                v32 = [v30 objectForKeyedSubscript:*(void *)(*((void *)&v91 + 1) + 8 * i)];
              }
              v37 = [v32 allKeys];
              if (!v33) {
                id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              }
              [v33 setObject:v37 forKeyedSubscript:v36];
            }
            uint64_t v31 = [v30 countByEnumeratingWithState:&v91 objects:buf count:16];
          }
          while (v31);

          if (!v32 || !v33)
          {
            v69 = v30;
            goto LABEL_45;
          }
          v96[0] = @"ConfigurationProperties";
          v96[1] = @"UserMap";
          *(void *)v102 = v32;
          id v103 = v33;
          v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:v96 count:2];
        }
        else
        {
          id v33 = 0;
          v32 = 0;
          v69 = v30;
        }

LABEL_45:
        goto LABEL_46;
      }
    }
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_3;
    v77[3] = &unk_1E5992F28;
    v13 = v11;
    v80 = v11;
    v77[4] = self;
    int v81 = a3;
    id v78 = v76;
    id v79 = v75;
    id v38 = v79;
    v39 = v77;
    if (self)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __73__NEUtilConfigurationClient_loadConfigurationWithName_completionHandler___block_invoke;
      v98 = &unk_1E5992E08;
      v99 = self;
      v100 = v38;
      v101 = v39;
      -[NEUtilConfigurationClient loadConfigurationsForceRefresh:completionHandler:](self, 0, buf);
    }
LABEL_32:
    v11 = v13;
    goto LABEL_33;
  }
  v12 = [(NEUtilConfigurationClient *)self clientName];
  +[NEUtilConfigurationClient removeClientWithName:v12];

  v11[2](v11, MEMORY[0x1E4F1CBF0]);
LABEL_33:
}

void __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke(uint64_t a1)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"%-5s %-100s %-9s %-6s\n", "ID", "Subject Summary", "Validity", "Domain");
  unint64_t v3 = 0;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  while (1)
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v2, 48, 1);
    }
    if (v3 >= [Property count]) {
      break;
    }
    id v7 = *(id *)(a1 + 32);
    if (v7) {
      id v7 = objc_getProperty(v7, v6, 48, 1);
    }
    v8 = [v7 objectAtIndexedSubscript:v3];
    CFDataRef v9 = [v8 objectForKeyedSubscript:@"certificate-data"];
    if (v9)
    {
      SecCertificateRef v10 = SecCertificateCreateWithData(v4, v9);
      if (v10)
      {
        v11 = v10;
        int IsValid = NECertificateDateIsValid((uint64_t)v10);
        v13 = [v8 objectForKeyedSubscript:@"domain"];
        int v14 = [v13 intValue];

        v15 = (__CFString *)SecCertificateCopySubjectSummary(v11);
        SEL v16 = v15;
        if (v15)
        {
          uint64_t v17 = [(__CFString *)v15 UTF8String];
          v18 = "user";
          if (!v14) {
            v18 = "system";
          }
          objc_msgSend(v21, "appendFormat:", @"%-5lu %-100s %-9s %-6s\n", v3, v17, off_1E5992FC8[IsValid - 1], v18);
        }
        CFRelease(v11);
      }
    }

    ++v3;
  }
  uint64_t v19 = *(void *)(a1 + 40);
  v22[0] = v21;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);
}

void __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  CFDataRef v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v9) {
    goto LABEL_2;
  }
  int v14 = *(_DWORD *)(a1 + 56);
  if (v14 != 31)
  {
    if (v14 != 30)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unsupported command", v38);
      goto LABEL_21;
    }
    v15 = *(void **)(a1 + 32);
    if (v15 && [v15 length])
    {
      if (v11)
      {
        CFDataRef v9 = [v11 description];
LABEL_2:
        [v13 addObject:v9];

        goto LABEL_3;
      }
      [NSString stringWithFormat:@"Configuration '%@' not found", *(void *)(a1 + 32)];
LABEL_21:
      CFDataRef v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v9) {
        goto LABEL_3;
      }
      goto LABEL_2;
    }
    if ([v12 count])
    {
      if (*(void *)(a1 + 40))
      {
        uint64_t v25 = (objc_class *)MEMORY[0x1E4F28E78];
        id v26 = v12;
        uint64_t v27 = (void *)[[v25 alloc] initWithCapacity:0];
        [v27 appendString:@"{"];
        [v27 appendPrettyObject:v26 withName:@"app-group-map" andIndent:0 options:0];

        [v27 appendString:@"\n}"];
      }
      else
      {
        uint64_t v27 = 0;
      }
      uint64_t v28 = [NSString stringWithFormat:@"%@\n", v27];
      [v13 addObject:v28];
    }
    if (!v10 || ![v10 count])
    {
      CFDataRef v9 = @"Unreadable or empty file";
      goto LABEL_2;
    }
    id v39 = v12;
    id v40 = v11;
    uint64_t v41 = a1;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v29 = v10;
    id v30 = v10;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v47 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = NSString;
          uint64_t v36 = [v30 objectForKeyedSubscript:*(void *)(*((void *)&v46 + 1) + 8 * i)];
          v37 = [v35 stringWithFormat:@"%@\n", v36];
          [v13 addObject:v37];
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v32);
    }

    id v10 = v29;
LABEL_37:
    id v11 = v40;
    a1 = v41;
    id v12 = v39;
    goto LABEL_3;
  }
  if (v10 && [v10 count])
  {
    id v39 = v12;
    id v40 = v11;
    uint64_t v41 = a1;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v16 = v10;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v43 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [v16 objectForKeyedSubscript:*(void *)(*((void *)&v42 + 1) + 8 * j)];
          int v22 = NSString;
          v23 = [v21 name];
          v24 = [v22 stringWithFormat:@"%@\n", v23];
          [v13 addObject:v24];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v18);
    }

    goto LABEL_37;
  }
LABEL_3:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v286[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v276 = 0;
  v277 = &v276;
  uint64_t v278 = 0x3032000000;
  v279 = __Block_byref_object_copy__23571;
  v280 = __Block_byref_object_dispose__23572;
  id v281 = 0;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id newValue = v5;
  if (v6)
  {
    uint64_t v9 = *(void *)(a1 + 56);
    v286[0] = v6;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v286 count:1];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    goto LABEL_176;
  }
  id v11 = *(void **)(a1 + 32);
  if (v11) {
    objc_setProperty_atomic(v11, v7, v5, 56);
  }
  switch(*(_DWORD *)(a1 + 64))
  {
    case 1:
      if (v5)
      {
        uint64_t v12 = [NSString stringWithFormat:@"Configuration with name \"%@\" already exists", *(void *)(a1 + 48)];
        id v13 = (void *)v277[5];
        v277[5] = v12;
      }
      else
      {
        v174 = *(void **)(a1 + 32);
        uint64_t v175 = *(void *)(a1 + 40);
        v176 = (id *)(v277 + 5);
        id v275 = (id)v277[5];
        [v174 createConfigurationWithParameters:v175 errorStr:&v275];
        objc_storeStrong(v176, v275);
      }
      goto LABEL_173;
    case 2:
      if (!v5) {
        goto LABEL_105;
      }
      id v29 = *(void **)(a1 + 32);
      uint64_t v30 = *(void *)(a1 + 40);
      uint64_t v31 = (id *)(v277 + 5);
      id v267 = (id)v277[5];
      [v29 setProtocolWithParameters:v30 errorStr:&v267];
      objc_storeStrong(v31, v267);
      goto LABEL_173;
    case 3:
      if (!v5) {
        goto LABEL_105;
      }
      uint64_t v32 = *(void **)(a1 + 32);
      uint64_t v33 = *(void *)(a1 + 40);
      uint64_t v34 = (id *)(v277 + 5);
      id v266 = (id)v277[5];
      [v32 setFilterPluginWithParameters:v33 errorStr:&v266];
      objc_storeStrong(v34, v266);
      goto LABEL_173;
    case 4:
      if (!v5) {
        goto LABEL_105;
      }
      v35 = *(void **)(a1 + 32);
      uint64_t v36 = *(void *)(a1 + 40);
      v37 = (id *)(v277 + 5);
      id v265 = (id)v277[5];
      [v35 unsetFilterPluginParameters:v36 errorStr:&v265];
      objc_storeStrong(v37, v265);
      goto LABEL_173;
    case 5:
      if (!v5) {
        goto LABEL_105;
      }
      uint64_t v38 = *(void **)(a1 + 32);
      uint64_t v39 = *(void *)(a1 + 40);
      id v40 = (id *)(v277 + 5);
      id v264 = (id)v277[5];
      [v38 setDNSProxyWithParameters:v39 errorStr:&v264];
      objc_storeStrong(v40, v264);
      goto LABEL_173;
    case 6:
      if (!v5) {
        goto LABEL_105;
      }
      uint64_t v41 = *(void **)(a1 + 32);
      uint64_t v42 = *(void *)(a1 + 40);
      long long v43 = (id *)(v277 + 5);
      id v263 = (id)v277[5];
      [v41 unsetDNSProxyWithParameters:v42 errorStr:&v263];
      objc_storeStrong(v43, v263);
      goto LABEL_173;
    case 7:
      if (!v5) {
        goto LABEL_105;
      }
      long long v44 = *(void **)(a1 + 32);
      uint64_t v45 = *(void *)(a1 + 40);
      long long v46 = (id *)(v277 + 5);
      id v262 = (id)v277[5];
      [v44 setCommonParameters:v45 errorStr:&v262];
      objc_storeStrong(v46, v262);
      goto LABEL_173;
    case 8:
      if (!v5) {
        goto LABEL_105;
      }
      long long v47 = *(void **)(a1 + 32);
      uint64_t v48 = *(void *)(a1 + 40);
      long long v49 = (id *)(v277 + 5);
      id v261 = (id)v277[5];
      [v47 unsetCommonParameters:v48 errorStr:&v261];
      objc_storeStrong(v49, v261);
      goto LABEL_173;
    case 9:
      if (!v5) {
        goto LABEL_105;
      }
      v50 = *(void **)(a1 + 32);
      uint64_t v51 = *(void *)(a1 + 40);
      uint64_t v52 = (id *)(v277 + 5);
      id v260 = (id)v277[5];
      [v50 setIPSecParameters:v51 errorStr:&v260];
      objc_storeStrong(v52, v260);
      goto LABEL_173;
    case 0xA:
      if (!v5) {
        goto LABEL_105;
      }
      uint64_t v53 = *(void **)(a1 + 32);
      uint64_t v54 = *(void *)(a1 + 40);
      id v55 = (id *)(v277 + 5);
      id v259 = (id)v277[5];
      [v53 unsetIPSecParameters:v54 errorStr:&v259];
      objc_storeStrong(v55, v259);
      goto LABEL_173;
    case 0xB:
      if (!v5) {
        goto LABEL_105;
      }
      id v56 = *(void **)(a1 + 32);
      uint64_t v57 = *(void **)(a1 + 40);
      v58 = (id *)(v277 + 5);
      id v258 = (id)v277[5];
      -[NEUtilConfigurationClient setPPPParameters:errorStr:](v56, v57, &v258);
      objc_storeStrong(v58, v258);
      goto LABEL_173;
    case 0xC:
      if (!v5) {
        goto LABEL_105;
      }
      v59 = *(void **)(a1 + 32);
      int v60 = *(void **)(a1 + 40);
      v61 = (id *)(v277 + 5);
      id v257 = (id)v277[5];
      -[NEUtilConfigurationClient unsetPPPParameters:errorStr:](v59, v60, &v257);
      objc_storeStrong(v61, v257);
      goto LABEL_173;
    case 0xD:
      if (!v5) {
        goto LABEL_105;
      }
      uint64_t v62 = *(void **)(a1 + 32);
      uint64_t v63 = *(void *)(a1 + 40);
      v64 = (id *)(v277 + 5);
      id v256 = (id)v277[5];
      [v62 addOnDemandRuleWithParameters:v63 errorStr:&v256];
      objc_storeStrong(v64, v256);
      goto LABEL_173;
    case 0xE:
      if (!v5) {
        goto LABEL_105;
      }
      id v65 = *(void **)(a1 + 32);
      uint64_t v66 = *(void *)(a1 + 40);
      v67 = (id *)(v277 + 5);
      id v255 = (id)v277[5];
      [v65 removeOnDemandRuleWithParameters:v66 errorStr:&v255];
      objc_storeStrong(v67, v255);
      goto LABEL_173;
    case 0xF:
      if (!v5) {
        goto LABEL_105;
      }
      id v68 = *(void **)(a1 + 32);
      uint64_t v69 = *(void *)(a1 + 40);
      id v70 = (id *)(v277 + 5);
      id v224 = (id)v277[5];
      [v68 setProxyParameters:v69 errorStr:&v224];
      objc_storeStrong(v70, v224);
      goto LABEL_173;
    case 0x10:
      if (!v5) {
        goto LABEL_105;
      }
      v71 = *(void **)(a1 + 32);
      uint64_t v72 = *(void *)(a1 + 40);
      v73 = (id *)(v277 + 5);
      id v223 = (id)v277[5];
      [v71 unsetProxyParameters:v72 errorStr:&v223];
      objc_storeStrong(v73, v223);
      goto LABEL_173;
    case 0x11:
      if (!v5) {
        goto LABEL_105;
      }
      id v74 = *(void **)(a1 + 32);
      uint64_t v75 = *(void *)(a1 + 40);
      id v76 = (id *)(v277 + 5);
      id v222 = (id)v277[5];
      [v74 setProxyServer:v75 errorStr:&v222];
      objc_storeStrong(v76, v222);
      goto LABEL_173;
    case 0x12:
      if (!v5) {
        goto LABEL_105;
      }
      v77 = *(void **)(a1 + 32);
      uint64_t v78 = *(void *)(a1 + 40);
      id v79 = (id *)(v277 + 5);
      id v221 = (id)v277[5];
      [v77 unsetProxyServer:v78 errorStr:&v221];
      objc_storeStrong(v79, v221);
      goto LABEL_173;
    case 0x13:
      if (!v5) {
        goto LABEL_105;
      }
      v80 = *(void **)(a1 + 32);
      uint64_t v81 = *(void *)(a1 + 40);
      v82 = (id *)(v277 + 5);
      id v226 = (id)v277[5];
      [v80 setDNSParameters:v81 errorStr:&v226];
      objc_storeStrong(v82, v226);
      goto LABEL_173;
    case 0x14:
      if (!v5) {
        goto LABEL_105;
      }
      v83 = *(void **)(a1 + 32);
      uint64_t v84 = *(void *)(a1 + 40);
      id v85 = (id *)(v277 + 5);
      id v225 = (id)v277[5];
      [v83 unsetDNSParameters:v84 errorStr:&v225];
      objc_storeStrong(v85, v225);
      goto LABEL_173;
    case 0x19:
      if (!v5) {
        goto LABEL_105;
      }
      int v88 = *(void **)(a1 + 32);
      v89 = *(void **)(a1 + 40);
      id v90 = (id *)(v277 + 5);
      id v250 = (id)v277[5];
      -[NEUtilConfigurationClient addAppRuleWithParameters:errorStr:](v88, v89, &v250);
      objc_storeStrong(v90, v250);
      goto LABEL_173;
    case 0x1A:
      if (!v5) {
        goto LABEL_105;
      }
      long long v91 = *(void **)(a1 + 32);
      long long v92 = *(void **)(a1 + 40);
      long long v93 = (id *)(v277 + 5);
      id v249 = (id)v277[5];
      -[NEUtilConfigurationClient removeAppRuleWithParameters:errorStr:](v91, v92, &v249);
      objc_storeStrong(v93, v249);
      goto LABEL_173;
    case 0x1B:
      if (!v5) {
        goto LABEL_105;
      }
      long long v94 = *(void **)(a1 + 32);
      v95 = *(void **)(a1 + 40);
      v96 = (id *)(v277 + 5);
      id v248 = (id)v277[5];
      -[NEUtilConfigurationClient setPathControllerWithParameters:errorStr:](v94, v95, &v248);
      objc_storeStrong(v96, v248);
      goto LABEL_173;
    case 0x1C:
      if (!v5) {
        goto LABEL_105;
      }
      v97 = *(void **)(a1 + 32);
      v98 = *(void **)(a1 + 40);
      v99 = (id *)(v277 + 5);
      id v247 = (id)v277[5];
      -[NEUtilConfigurationClient addPathRuleWithParameters:errorStr:](v97, v98, (__CFString **)&v247);
      objc_storeStrong(v99, v247);
      goto LABEL_173;
    case 0x1D:
      if (!v5) {
        goto LABEL_105;
      }
      v100 = *(void **)(a1 + 32);
      v101 = *(void **)(a1 + 40);
      v102 = (id *)(v277 + 5);
      id v246 = (id)v277[5];
      -[NEUtilConfigurationClient removePathRuleWithParameters:errorStr:](v100, v101, &v246);
      objc_storeStrong(v102, v246);
      goto LABEL_173;
    case 0x1E:
      if (v5)
      {
        id v103 = [v5 description];
        [v8 addObject:v103];
      }
      else
      {
        v179 = NSString;
        id Property = *(id *)(a1 + 32);
        if (Property) {
          id Property = objc_getProperty(Property, v7, 24, 1);
        }
        id v181 = Property;
        v182 = [v181 debugDescription];
        v183 = [v179 stringWithFormat:@"%@\n", v182];
        [v8 addObject:v183];

        v185 = *(void **)(a1 + 32);
        if (v185)
        {
          id v186 = objc_getProperty(v185, v184, 40, 1);
          if (v186)
          {
            v188 = v186;
            id v189 = *(id *)(a1 + 32);
            if (v189) {
              id v189 = objc_getProperty(v189, v187, 40, 1);
            }
            id v190 = v189;
            BOOL v191 = [v190 count] == 0;

            if (!v191)
            {
              long long v244 = 0u;
              long long v245 = 0u;
              long long v242 = 0u;
              long long v243 = 0u;
              id v192 = *(id *)(a1 + 32);
              if (v192) {
                id v192 = objc_getProperty(v192, v187, 40, 1);
              }
              id v193 = v192;
              uint64_t v194 = [v193 countByEnumeratingWithState:&v242 objects:v285 count:16];
              if (v194)
              {
                uint64_t v195 = *(void *)v243;
                do
                {
                  for (uint64_t i = 0; i != v194; ++i)
                  {
                    if (*(void *)v243 != v195) {
                      objc_enumerationMutation(v193);
                    }
                    v197 = [NSString stringWithFormat:@"%@\n", *(void *)(*((void *)&v242 + 1) + 8 * i)];
                    [v8 addObject:v197];
                  }
                  uint64_t v194 = [v193 countByEnumeratingWithState:&v242 objects:v285 count:16];
                }
                while (v194);
              }
            }
          }
          v198 = *(void **)(a1 + 32);
          if (v198)
          {
            id v199 = objc_getProperty(v198, v187, 32, 1);
            if (v199)
            {
              v201 = v199;
              id v202 = *(id *)(a1 + 32);
              if (v202) {
                id v202 = objc_getProperty(v202, v200, 32, 1);
              }
              id v203 = v202;
              BOOL v204 = [v203 count] == 0;

              if (!v204)
              {
                [v8 addObject:@"New Configurations:\n"];
                long long v240 = 0u;
                long long v241 = 0u;
                long long v238 = 0u;
                long long v239 = 0u;
                id v206 = *(id *)(a1 + 32);
                if (v206) {
                  id v206 = objc_getProperty(v206, v205, 32, 1);
                }
                id v207 = v206;
                uint64_t v208 = [v207 countByEnumeratingWithState:&v238 objects:v284 count:16];
                if (v208)
                {
                  uint64_t v209 = *(void *)v239;
                  do
                  {
                    for (uint64_t j = 0; j != v208; ++j)
                    {
                      if (*(void *)v239 != v209) {
                        objc_enumerationMutation(v207);
                      }
                      v211 = [NSString stringWithFormat:@"%@\n", *(void *)(*((void *)&v238 + 1) + 8 * j)];
                      [v8 addObject:v211];
                    }
                    uint64_t v208 = [v207 countByEnumeratingWithState:&v238 objects:v284 count:16];
                  }
                  while (v208);
                }
              }
            }
          }
        }
      }
      goto LABEL_173;
    case 0x1F:
      int v14 = +[NEConfigurationManager sharedManagerForAllUsers];
      uint64_t v15 = MEMORY[0x1E4F14428];
      id v16 = MEMORY[0x1E4F14428];
      v235[0] = MEMORY[0x1E4F143A8];
      v235[1] = 3221225472;
      v235[2] = __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2_943;
      v235[3] = &unk_1E5992EA8;
      v235[4] = *(void *)(a1 + 32);
      id v236 = v8;
      id v237 = *(id *)(a1 + 56);
      [v14 loadIndexWithFilter:0 completionQueue:v15 handler:v235];

      goto LABEL_176;
    case 0x20:
      if (!v5) {
        goto LABEL_105;
      }
      id v104 = *(id *)(a1 + 32);
      if (v104) {
        id v104 = objc_getProperty(v104, v7, 24, 1);
      }
      id v105 = v104;
      uint64_t v106 = MEMORY[0x1E4F14428];
      id v107 = MEMORY[0x1E4F14428];
      v229[0] = MEMORY[0x1E4F143A8];
      v229[1] = 3221225472;
      v229[2] = __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_3_960;
      v229[3] = &unk_1E5992ED0;
      id v230 = *(id *)(a1 + 48);
      id v108 = v8;
      uint64_t v109 = *(void *)(a1 + 32);
      id v231 = v108;
      uint64_t v232 = v109;
      id v233 = v5;
      id v234 = *(id *)(a1 + 56);
      [v105 saveConfiguration:v233 withCompletionQueue:v106 handler:v229];

      goto LABEL_176;
    case 0x21:
      if (!v5) {
        goto LABEL_105;
      }
      id v110 = *(id *)(a1 + 32);
      if (v110) {
        id v110 = objc_getProperty(v110, v7, 24, 1);
      }
      id v111 = v110;
      uint64_t v112 = MEMORY[0x1E4F14428];
      id v113 = MEMORY[0x1E4F14428];
      v268[0] = MEMORY[0x1E4F143A8];
      v268[1] = 3221225472;
      v268[2] = __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_935;
      v268[3] = &unk_1E5992E80;
      v273 = &v276;
      id v114 = *(id *)(a1 + 48);
      uint64_t v115 = *(void *)(a1 + 32);
      id v269 = v114;
      uint64_t v270 = v115;
      id v271 = v5;
      id v272 = *(id *)(a1 + 56);
      [v111 removeConfiguration:v271 withCompletionQueue:v112 handler:v268];

      goto LABEL_176;
    case 0x22:
      v116 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"profile-file-path"];
      v117 = ne_log_obj();
      if (os_log_type_enabled(v117, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v283 = v116;
        _os_log_debug_impl(&dword_19DDAF000, v117, OS_LOG_TYPE_DEBUG, "process ingestion command, path %@", buf, 0xCu);
      }

      v118 = [[NEProfileIngestion alloc] initWithName:@"neutil"];
      v119 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:v116];
      v120 = [[NEProfilePayloadBase alloc] initWithPayload:v119];
      [(NEProfileIngestion *)v118 createConfigurationFromPayload:v120 payloadType:@"com.apple.vpn.managed"];
      v121 = [(NEProfileIngestion *)v118 ingestedConfiguration];

      if (v121) {
        [(NEProfileIngestion *)v118 saveIngestedConfiguration];
      }

      goto LABEL_173;
    case 0x26:
      if (!v5) {
        goto LABEL_105;
      }
      v122 = *(void **)(a1 + 32);
      v123 = *(void **)(a1 + 40);
      v124 = (id *)(v277 + 5);
      id v228 = (id)v277[5];
      -[NEUtilConfigurationClient setAlwaysOnParameters:errorStr:](v122, v123, (__CFString **)&v228);
      objc_storeStrong(v124, v228);
      goto LABEL_173;
    case 0x27:
      if (!v5) {
        goto LABEL_105;
      }
      v125 = *(void **)(a1 + 32);
      v126 = *(void **)(a1 + 40);
      v127 = (id *)(v277 + 5);
      id v227 = (id)v277[5];
      -[NEUtilConfigurationClient unsetAlwaysOnParameters:errorStr:](v125, v126, (__CFString **)&v227);
      objc_storeStrong(v127, v227);
      goto LABEL_173;
    case 0x28:
      if (!v5) {
        goto LABEL_105;
      }
      uint64_t v17 = *(void **)(a1 + 32);
      uint64_t v18 = *(void **)(a1 + 40);
      uint64_t v19 = (id *)(v277 + 5);
      obuint64_t j = (id)v277[5];
      -[NEUtilConfigurationClient swapConfigurationTypeWithParameters:errorStr:](v17, v18, &obj);
      objc_storeStrong(v19, obj);
      goto LABEL_173;
    case 0x2A:
      v128 = (void *)MEMORY[0x1E4F1C9E8];
      v129 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"profile-file-path"];
      v130 = [v128 dictionaryWithContentsOfFile:v129];

      if (!isa_nsdictionary(v130))
      {
        v171 = NSString;
        v132 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"profile-file-path"];
        uint64_t v172 = [v171 stringWithFormat:@"Failed to read from %@", v132];
        v173 = (void *)v277[5];
        v277[5] = v172;
LABEL_171:

        goto LABEL_172;
      }
      v132 = +[NEConfiguration configurationWithProfilePayload:v130 grade:1];
      if (!v132)
      {
        v212 = NSString;
        v173 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"profile-file-path"];
        uint64_t v213 = [v212 stringWithFormat:@"Failed to create a configuration from profile payload at %@. Make sure that the file only contains the configuration payload.", v173];
        v214 = (void *)v277[5];
        v277[5] = v213;

        v132 = 0;
        goto LABEL_171;
      }
      v133 = *(void **)(a1 + 32);
      if (!v133 || !objc_getProperty(v133, v131, 32, 1))
      {
        id v136 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v137 = *(void **)(a1 + 32);
        if (v137) {
          objc_setProperty_atomic(v137, v135, v136, 32);
        }
      }
      id v138 = *(id *)(a1 + 32);
      if (v138) {
        id v138 = objc_getProperty(v138, v134, 32, 1);
      }
      id v139 = v138;
      [v139 addObject:v132];

      v141 = *(void **)(a1 + 32);
      if (v141) {
        objc_setProperty_atomic(v141, v140, v132, 56);
      }
LABEL_172:

LABEL_173:
      if (v277[5]) {
        objc_msgSend(v8, "addObject:");
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_176:

      _Block_object_dispose(&v276, 8);
      return;
    case 0x2B:
      v142 = [NEConfiguration alloc];
      v143 = NSString;
      v144 = [v5 name];
      v145 = [v143 stringWithFormat:@"%@ Per-App", v144];
      v146 = -[NEConfiguration initWithName:grade:](v142, "initWithName:grade:", v145, [v5 grade]);

      v147 = objc_alloc_init(NEVPNApp);
      [(NEConfiguration *)v146 setAppVPN:v147];

      v148 = [v5 VPN];
      v149 = [v148 protocol];
      v150 = [(NEConfiguration *)v146 appVPN];
      [v150 setProtocol:v149];

      v151 = [(NEConfiguration *)v146 appVPN];
      [v151 setOnDemandEnabled:1];

      v152 = [v5 VPN];
      v153 = [v152 onDemandRules];
      v154 = (void *)[v153 copy];
      v155 = [(NEConfiguration *)v146 appVPN];
      [v155 setOnDemandRules:v154];

      v156 = [(NEConfiguration *)v146 appVPN];
      [v156 setEnabled:1];

      v157 = [(NEConfiguration *)v146 appVPN];
      [v157 setTunnelType:1];

      v158 = +[NEConfigurationManager sharedManager];
      uint64_t v159 = MEMORY[0x1E4F14428];
      id v160 = MEMORY[0x1E4F14428];
      v218[0] = MEMORY[0x1E4F143A8];
      v218[1] = 3221225472;
      v218[2] = __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_972;
      v218[3] = &unk_1E5992F00;
      v161 = v146;
      v219 = v161;
      v220 = &v276;
      [v158 saveConfiguration:v161 withCompletionQueue:v159 handler:v218];

      goto LABEL_173;
    case 0x2C:
      if (!v5) {
        goto LABEL_105;
      }
      v162 = *(void **)(a1 + 32);
      uint64_t v163 = *(void *)(a1 + 40);
      v164 = (id *)(v277 + 5);
      id v217 = (id)v277[5];
      [v162 setAppPushParameters:v163 errorStr:&v217];
      objc_storeStrong(v164, v217);
      goto LABEL_173;
    case 0x2D:
      if (!v5) {
        goto LABEL_105;
      }
      id v20 = *(void **)(a1 + 32);
      uint64_t v21 = *(void *)(a1 + 40);
      int v22 = (id *)(v277 + 5);
      id v216 = (id)v277[5];
      [v20 unsetAppPushParameters:v21 errorStr:&v216];
      objc_storeStrong(v22, v216);
      goto LABEL_173;
    case 0x2E:
      if (!v5) {
        goto LABEL_105;
      }
      v165 = *(void **)(a1 + 32);
      uint64_t v166 = *(void *)(a1 + 40);
      v167 = (id *)(v277 + 5);
      id v254 = (id)v277[5];
      [v165 addRelayWithParameters:v166 errorStr:&v254];
      objc_storeStrong(v167, v254);
      goto LABEL_173;
    case 0x2F:
      if (!v5) {
        goto LABEL_105;
      }
      v23 = *(void **)(a1 + 32);
      uint64_t v24 = *(void *)(a1 + 40);
      uint64_t v25 = (id *)(v277 + 5);
      id v253 = (id)v277[5];
      [v23 removeRelayWithParameters:v24 errorStr:&v253];
      objc_storeStrong(v25, v253);
      goto LABEL_173;
    case 0x30:
      if (!v5) {
        goto LABEL_105;
      }
      id v26 = *(void **)(a1 + 32);
      uint64_t v27 = *(void *)(a1 + 40);
      uint64_t v28 = (id *)(v277 + 5);
      id v252 = (id)v277[5];
      [v26 setRelayConditionsWithParameters:v27 errorStr:&v252];
      objc_storeStrong(v28, v252);
      goto LABEL_173;
    case 0x31:
      if (v5)
      {
        v168 = *(void **)(a1 + 32);
        uint64_t v169 = *(void *)(a1 + 40);
        v170 = (id *)(v277 + 5);
        id v251 = (id)v277[5];
        [v168 unsetRelayConditionsWithParameters:v169 errorStr:&v251];
        objc_storeStrong(v170, v251);
      }
      else
      {
LABEL_105:
        uint64_t v177 = [NSString stringWithFormat:@"Configuration with name \"%@\" does not exist", *(void *)(a1 + 48)];
        v178 = (void *)v277[5];
        v277[5] = v177;
      }
      goto LABEL_173;
    default:
      uint64_t v86 = [NSString stringWithFormat:@"Unknown command"];
      v87 = (void *)v277[5];
      v277[5] = v86;

      goto LABEL_173;
  }
}

void __73__NEUtilConfigurationClient_loadConfigurationWithName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v3, 40, 1);
  }
  id v6 = find_config_by_name(Property, *(void **)(a1 + 40));
  if (!v6)
  {
    id v7 = *(id *)(a1 + 32);
    if (v7) {
      id v7 = objc_getProperty(v7, v5, 32, 1);
    }
    id v6 = find_config_by_name(v7, *(void **)(a1 + 40));
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)loadConfigurationsForceRefresh:(void *)a3 completionHandler:
{
  id v6 = a3;
  if (a1)
  {
    if (!objc_getProperty(a1, v5, 40, 1) || a2)
    {
      id Property = objc_getProperty(a1, v7, 24, 1);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __78__NEUtilConfigurationClient_loadConfigurationsForceRefresh_completionHandler___block_invoke;
      v12[3] = &unk_1E5993720;
      v12[4] = a1;
      id v13 = v6;
      [Property loadConfigurationsWithCompletionQueue:MEMORY[0x1E4F14428] handler:v12];
      id v8 = v13;
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __78__NEUtilConfigurationClient_loadConfigurationsForceRefresh_completionHandler___block_invoke_2;
      block[3] = &unk_1E5993770;
      id v11 = v6;
      dispatch_async(MEMORY[0x1E4F14428], block);
      id v8 = v11;
    }
  }
}

void __78__NEUtilConfigurationClient_loadConfigurationsForceRefresh_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = NSString;
    uint64_t v9 = convert_error_to_string_23565(v6);
    id v10 = [v8 stringWithFormat:@"Failed to load the current configurations: %@", v9];
  }
  else
  {
    id v10 = 0;
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v13 = *(void **)(a1 + 32);
  if (v13) {
    objc_setProperty_atomic(v13, v11, v12, 40);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v5;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v14);
        }
        id v20 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id Property = *(id *)(a1 + 32);
        if (Property) {
          id Property = objc_getProperty(Property, v16, 40, 1);
        }
        id v22 = Property;
        v23 = (void *)[v20 copy];
        [v22 addObject:v23];
      }
      uint64_t v17 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v17);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __78__NEUtilConfigurationClient_loadConfigurationsForceRefresh_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)swapConfigurationTypeWithParameters:(void *)a3 errorStr:
{
  if (!a1) {
    return;
  }
  id v20 = [a2 objectForKeyedSubscript:@"type"];
  if (![v20 isEqualToString:@"vpn"])
  {
    if ([v20 isEqualToString:@"appvpn"])
    {
      uint64_t v14 = objc_msgSend(objc_getProperty(a1, v13, 56, 1), "VPN");
      if (v14)
      {
        id v7 = (void *)v14;
        id v8 = objc_alloc_init(NEVPNApp);
        -[NEVPN setEnabled:](v8, "setEnabled:", [v7 isEnabled]);
        -[NEVPN setOnDemandEnabled:](v8, "setOnDemandEnabled:", [v7 isOnDemandEnabled]);
        -[NEVPN setDisconnectOnDemandEnabled:](v8, "setDisconnectOnDemandEnabled:", [v7 isDisconnectOnDemandEnabled]);
        uint64_t v15 = [v7 onDemandRules];
        [(NEVPN *)v8 setOnDemandRules:v15];

        id v16 = [v7 protocol];
        [(NEVPN *)v8 setProtocol:v16];

        [(NEVPN *)v8 setTunnelType:1];
        objc_msgSend(objc_getProperty(a1, v17, 56, 1), "setVPN:", 0);
        objc_msgSend(objc_getProperty(a1, v18, 56, 1), "setAppVPN:", v8);
        goto LABEL_8;
      }
      [NSString stringWithFormat:@"No configuration found for swapping %@ -> %@", @"vpn", v20];
    }
    else
    {
      [NSString stringWithFormat:@"Invalid configuration type for swapping: %@", v20, v19];
    }
LABEL_12:
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  uint64_t v6 = objc_msgSend(objc_getProperty(a1, v5, 56, 1), "appVPN");
  if (!v6)
  {
    [NSString stringWithFormat:@"No configuration found for swapping %@ -> %@", @"appvpn", v20];
    goto LABEL_12;
  }
  id v7 = (void *)v6;
  id v8 = objc_alloc_init(NEVPN);
  -[NEVPN setEnabled:](v8, "setEnabled:", [v7 isEnabled]);
  -[NEVPN setOnDemandEnabled:](v8, "setOnDemandEnabled:", [v7 isOnDemandEnabled]);
  -[NEVPN setDisconnectOnDemandEnabled:](v8, "setDisconnectOnDemandEnabled:", [v7 isDisconnectOnDemandEnabled]);
  uint64_t v9 = [v7 onDemandRules];
  [(NEVPN *)v8 setOnDemandRules:v9];

  id v10 = [v7 protocol];
  [(NEVPN *)v8 setProtocol:v10];

  objc_msgSend(objc_getProperty(a1, v11, 56, 1), "setAppVPN:", 0);
  objc_msgSend(objc_getProperty(a1, v12, 56, 1), "setVPN:", v8);
LABEL_8:

LABEL_13:
}

void __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_935(void *a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v5 = v3;
  if (v3)
  {
    uint64_t v6 = NSString;
    uint64_t v7 = a1[4];
    id v8 = convert_error_to_string_23565(v3);
    uint64_t v9 = [v6 stringWithFormat:@"Failed to remove configuration \"%@\": %@", v7, v8];
    uint64_t v10 = *(void *)(a1[8] + 8);
    SEL v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    id Property = (id)a1[5];
    if (Property) {
      id Property = objc_getProperty(Property, v4, 32, 1);
    }
    [Property removeObjectIdenticalTo:a1[6]];
    id v14 = (id)a1[5];
    if (v14) {
      id v14 = objc_getProperty(v14, v13, 40, 1);
    }
    [v14 removeObjectIdenticalTo:a1[6]];
  }
  uint64_t v15 = a1[7];
  if (*(void *)(*(void *)(a1[8] + 8) + 40))
  {
    v17[0] = *(void *)(*(void *)(a1[8] + 8) + 40);
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);
  }
  else
  {
    (*(void (**)(void, void))(v15 + 16))(a1[7], 0);
  }
}

- (uint64_t)setPPPParameters:(void *)a3 errorStr:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    id v111 = v5;
    uint64_t v7 = [a1 protocolForParameters:v5];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      SEL v12 = 0;
      id v13 = 0;
      id v14 = 0;
      uint64_t v15 = 0;
      id v16 = 0;
      SEL v17 = 0;
      *a3 = @"Configuration VPN type is not L2TP";
LABEL_109:

      id v6 = v111;
      goto LABEL_110;
    }
    id v108 = a3;
    id v8 = [v111 objectForKeyedSubscript:@"authentication-method"];

    uint64_t v9 = v111;
    if (v8)
    {
      uint64_t v10 = [v111 objectForKeyedSubscript:@"authentication-method"];
      if ([v10 isEqualToString:@"password"])
      {
        uint64_t v11 = 1;
      }
      else if ([v10 isEqualToString:@"securID"])
      {
        uint64_t v11 = 2;
      }
      else if ([v10 isEqualToString:@"certificate"])
      {
        uint64_t v11 = 3;
      }
      else if ([v10 isEqualToString:@"kerberos"])
      {
        uint64_t v11 = 4;
      }
      else
      {
        if (([v10 isEqualToString:@"cryptocard"] & 1) == 0)
        {
          *id v108 = [NSString stringWithFormat:@"Invalid %@, valid values are \"password\", \"securID\", \"certificate\", \"kerberos\", and \"cryptocard\", @"authentication-method""];

          goto LABEL_117;
        }
        uint64_t v11 = 5;
      }
      [v7 setAuthenticationMethod:v11];

      uint64_t v9 = v111;
    }
    SEL v18 = [v9 objectForKeyedSubscript:@"verbose-logging-enabled"];

    if (v18)
    {
      uint64_t v19 = [v111 objectForKeyedSubscript:@"verbose-logging-enabled"];
      objc_msgSend(v7, "setVerboseLoggingEnabled:", objc_msgSend(v19, "BOOLValue"));
    }
    id v20 = [v111 objectForKeyedSubscript:@"ipv4-config-method"];

    uint64_t v21 = v111;
    if (!v20)
    {
LABEL_29:
      uint64_t v28 = [v21 objectForKeyedSubscript:@"ipv4-address"];

      self = a1;
      if (v28)
      {
        id v29 = objc_alloc(MEMORY[0x1E4F1C978]);
        uint64_t v30 = [v111 objectForKeyedSubscript:@"ipv4-address"];
        uint64_t v109 = objc_msgSend(v29, "initWithObjects:", v30, 0);
      }
      else
      {
        uint64_t v109 = 0;
      }
      uint64_t v31 = [v111 objectForKeyedSubscript:@"ipv4-subnet-mask"];

      if (v31)
      {
        id v32 = objc_alloc(MEMORY[0x1E4F1C978]);
        uint64_t v33 = [v111 objectForKeyedSubscript:@"ipv4-subnet-mask"];
        id v16 = objc_msgSend(v32, "initWithObjects:", v33, 0);
      }
      else
      {
        id v16 = 0;
      }
      SEL v17 = (void *)v109;
      uint64_t v34 = [v111 objectForKeyedSubscript:@"ipv4-router"];

      if (v34)
      {
        uint64_t v110 = [v111 objectForKeyedSubscript:@"ipv4-router"];
      }
      else
      {
        uint64_t v110 = 0;
      }
      uint64_t v35 = [v7 IPv4Settings];
      if (!v35) {
        goto LABEL_43;
      }
      uint64_t v36 = (void *)v35;
      v37 = [v7 IPv4Settings];
      uint64_t v38 = v16;
      uint64_t v39 = [v37 configMethod];

      BOOL v40 = v39 == 3;
      id v16 = v38;
      if (v40)
      {
        uint64_t v41 = [[NEIPv4Settings alloc] initWithAddresses:v109 subnetMasks:v38];
        [v7 setIPv4Settings:v41];

        uint64_t v42 = [v7 IPv4Settings];
        [v42 setConfigMethod:3];

        uint64_t v15 = (void *)v110;
        if (v110)
        {
          long long v43 = [v111 objectForKeyedSubscript:@"ipv4-router"];
          long long v44 = [v7 IPv4Settings];
          [v44 setRouter:v43];

          id v16 = v38;
        }
      }
      else
      {
LABEL_43:
        uint64_t v15 = (void *)v110;
        if (v109 || v16 || v110)
        {
          id v58 = [NSString stringWithFormat:@"%@ %@ %@ cannot be specified, %@ is not \"manual\", @"ipv4-address", @"ipv4-subnet-mask", @"ipv4-router", @"ipv4-config-method""];
          SEL v12 = 0;
          id v13 = 0;
          id v14 = 0;
          goto LABEL_88;
        }
      }
      id v107 = v16;
      uint64_t v45 = [v111 objectForKeyedSubscript:@"send-all-traffic"];

      if (v45)
      {
        long long v46 = [v7 IPv4Settings];

        if (!v46)
        {
          id v59 = [NSString stringWithFormat:@"%@ cannot be specified, %@ is not \"manual\" or \"ppp\", @"send-all-traffic", @"ipv4-config-method""];
          SEL v12 = 0;
          id v13 = 0;
          id v14 = 0;
LABEL_107:
          *id v108 = v59;
          goto LABEL_108;
        }
        long long v47 = [v111 objectForKeyedSubscript:@"send-all-traffic"];
        uint64_t v48 = [v47 BOOLValue];
        long long v49 = [v7 IPv4Settings];
        [v49 setOverridePrimary:v48];
      }
      v50 = [v111 objectForKeyedSubscript:@"ipv6-config-method"];

      uint64_t v51 = v111;
      if (v50)
      {
        uint64_t v52 = [v111 objectForKeyedSubscript:@"ipv6-config-method"];
        uint64_t v53 = [v7 IPv6Settings];

        if (!v53)
        {
          uint64_t v54 = [[NEIPv6Settings alloc] initWithConfigMethod:1];
          [v7 setIPv6Settings:v54];
        }
        if ([v52 isEqualToString:@"automatic"])
        {
          id v55 = [v7 IPv6Settings];
          id v56 = v55;
          uint64_t v57 = 1;
        }
        else if ([v52 isEqualToString:@"manual"])
        {
          id v55 = [v7 IPv6Settings];
          id v56 = v55;
          uint64_t v57 = 2;
        }
        else
        {
          if (![v52 isEqualToString:@"link-local"])
          {
            *id v108 = [NSString stringWithFormat:@"Invalid %@, valid values are \"automatic\", \"manual\", and \"link-local\", @"ipv6-config-method""];

            SEL v12 = 0;
            id v13 = 0;
            id v14 = 0;
            goto LABEL_108;
          }
          id v55 = [v7 IPv6Settings];
          id v56 = v55;
          uint64_t v57 = 3;
        }
        [v55 setConfigMethod:v57];

        uint64_t v51 = v111;
      }
      int v60 = [v51 objectForKeyedSubscript:@"ipv6-address"];

      if (v60)
      {
        id v61 = objc_alloc(MEMORY[0x1E4F1C978]);
        uint64_t v62 = [v111 objectForKeyedSubscript:@"ipv6-address"];
        id v14 = objc_msgSend(v61, "initWithObjects:", v62, 0);
      }
      else
      {
        id v14 = 0;
      }
      uint64_t v63 = [v111 objectForKeyedSubscript:@"ipv6-prefix-length"];

      if (v63)
      {
        id v64 = objc_alloc(MEMORY[0x1E4F1C978]);
        id v65 = [v111 objectForKeyedSubscript:@"ipv6-prefix-length"];
        id v13 = objc_msgSend(v64, "initWithObjects:", v65, 0);
      }
      else
      {
        id v13 = 0;
      }
      uint64_t v66 = [v111 objectForKeyedSubscript:@"ipv6-router"];

      if (v66)
      {
        SEL v12 = [v111 objectForKeyedSubscript:@"ipv6-router"];
      }
      else
      {
        SEL v12 = 0;
      }
      uint64_t v67 = [v7 IPv6Settings];
      if (v67
        && (id v68 = (void *)v67,
            [v7 IPv6Settings],
            uint64_t v69 = objc_claimAutoreleasedReturnValue(),
            uint64_t v70 = [v69 configMethod],
            v69,
            v68,
            v70 == 2))
      {
        v71 = [[NEIPv6Settings alloc] initWithAddresses:v14 networkPrefixLengths:v13];
        [v7 setIPv6Settings:v71];

        uint64_t v72 = [v7 IPv6Settings];
        [v72 setConfigMethod:2];

        v73 = [v7 IPv6Settings];

        if (v73)
        {
          id v74 = [v111 objectForKeyedSubscript:@"ipv6-router"];
          uint64_t v75 = [v7 IPv6Settings];
          [v75 setRouter:v74];
        }
      }
      else if (v14 || v13 || v12)
      {
        id v79 = [NSString stringWithFormat:@"%@ %@ %@ cannot be specified, %@ is not \"manual\", @"ipv6-address", @"ipv6-prefix-length", @"ipv6-router", @"ipv6-config-method""];
        v80 = v108;
        SEL v17 = (void *)v109;
        goto LABEL_84;
      }
      id v76 = [v111 objectForKeyedSubscript:@"machine-authentication-method"];

      SEL v17 = (void *)v109;
      uint64_t v15 = (void *)v110;
      if (!v76)
      {
LABEL_92:
        uint64_t v81 = @"shared-secret";
        v82 = [v111 objectForKeyedSubscript:@"shared-secret"];

        if (v82)
        {
          if ([v7 type] != 2) {
            goto LABEL_106;
          }
          v83 = [NEKeychainItem alloc];
          id v85 = [v111 objectForKeyedSubscript:@"shared-secret"];
          if (v7)
          {
            uint64_t v86 = v7[10];
            id Property = objc_getProperty(v7, v84, 88, 1);
          }
          else
          {
            uint64_t v86 = 0;
            id Property = 0;
          }
          id v88 = Property;
          v89 = [(NEKeychainItem *)v83 initWithPassword:v85 domain:v86 accessGroup:v88];
          [v7 setSharedSecretKeychainItem:v89];

          SEL v17 = (void *)v109;
          uint64_t v15 = (void *)v110;
        }
        uint64_t v81 = @"local-identifier";
        id v90 = [v111 objectForKeyedSubscript:@"local-identifier"];

        if (!v90)
        {
LABEL_100:
          uint64_t v81 = @"machine-identity";
          long long v92 = [v111 objectForKeyedSubscript:@"machine-identity"];

          if (!v92)
          {
LABEL_108:
            id v16 = v107;
            goto LABEL_109;
          }
          if ([v7 type] == 2)
          {
            long long v93 = [v111 objectForKeyedSubscript:@"machine-identity"];
            unint64_t v94 = [v93 integerValue];

            id v96 = objc_getProperty(self, v95, 48, 1);
            if (v96)
            {
              v98 = v96;
              unint64_t v99 = objc_msgSend(objc_getProperty(self, v97, 48, 1), "count");

              if (v94 < v99)
              {
                v101 = objc_msgSend(objc_getProperty(self, v100, 48, 1), "objectAtIndexedSubscript:", v94);
                v102 = [v101 objectForKeyedSubscript:@"domain"];
                uint64_t v103 = [v102 integerValue];

                if (v103)
                {
                  *id v108 = [NSString stringWithFormat:@"Invalid %@, an identity in the system keychain is required", @"machine-identity"];
                }
                else
                {
                  id v104 = [v101 objectForKeyedSubscript:@"persistent-reference"];
                  [v7 setMachineIdentityReference:v104];
                }
                goto LABEL_85;
              }
            }
            id v79 = [NSString stringWithFormat:@"Invalid %@ index, use the \"list-identities\" command to obtain a list of available identities and their indicies", @"machine-identity"];
            v80 = v108;
LABEL_84:
            void *v80 = v79;
LABEL_85:
            id v16 = v107;
LABEL_86:
            uint64_t v15 = (void *)v110;
            goto LABEL_109;
          }
          goto LABEL_106;
        }
        if ([v7 type] == 2)
        {
          long long v91 = [v111 objectForKeyedSubscript:@"local-identifier"];
          [v7 setLocalIdentifier:v91];

          goto LABEL_100;
        }
LABEL_106:
        id v59 = [NSString stringWithFormat:@"Invalid %@, VPN type is not L2TP", v81];
        goto LABEL_107;
      }
      id v16 = v107;
      if ([v7 type] == 2)
      {
        v77 = [v111 objectForKeyedSubscript:@"machine-authentication-method"];
        if ([v77 isEqualToString:@"shared-secret"])
        {
          uint64_t v78 = 1;
        }
        else
        {
          if (([v77 isEqualToString:@"certificate"] & 1) == 0)
          {
            *id v108 = [NSString stringWithFormat:@"Invalid %@, valid values are \"shared-secret\" and \"certificate\", @"machine-authentication-method""];

            goto LABEL_86;
          }
          uint64_t v78 = 2;
        }
        [v7 setMachineAuthenticationMethod:v78];

        uint64_t v15 = (void *)v110;
        goto LABEL_92;
      }
      id v58 = [NSString stringWithFormat:@"Invalid %@, VPN type is not L2TP", @"machine-authentication-method"];
LABEL_88:
      *id v108 = v58;
      goto LABEL_109;
    }
    id v22 = [v111 objectForKeyedSubscript:@"ipv4-config-method"];
    v23 = [v7 IPv4Settings];

    if (!v23)
    {
      long long v24 = [[NEIPv4Settings alloc] initWithConfigMethod:2];
      [v7 setIPv4Settings:v24];
    }
    if ([v22 isEqualToString:@"ppp"])
    {
      long long v25 = [v7 IPv4Settings];
      long long v26 = v25;
      uint64_t v27 = 2;
LABEL_27:
      [v25 setConfigMethod:v27];

LABEL_28:
      uint64_t v21 = v111;
      goto LABEL_29;
    }
    if ([v22 isEqualToString:@"manual"])
    {
      long long v25 = [v7 IPv4Settings];
      long long v26 = v25;
      uint64_t v27 = 3;
      goto LABEL_27;
    }
    if ([v22 isEqualToString:@"automatic"])
    {
      long long v25 = [v7 IPv4Settings];
      long long v26 = v25;
      uint64_t v27 = 1;
      goto LABEL_27;
    }
    if ([v22 isEqualToString:@"off"])
    {
      [v7 setIPv4Settings:0];
      goto LABEL_28;
    }
    *id v108 = [NSString stringWithFormat:@"Invalid %@, valid values are \"ppp\", \"manual\", \"automatic\", and \"off\", @"ipv4-config-method""];

LABEL_117:
    SEL v12 = 0;
    id v13 = 0;
    id v14 = 0;
    uint64_t v15 = 0;
    id v16 = 0;
    SEL v17 = 0;
    goto LABEL_109;
  }
LABEL_110:

  return MEMORY[0x1F41817F8](v5, v6);
}

- (uint64_t)unsetPPPParameters:(void *)a3 errorStr:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    uint64_t v45 = v5;
    uint64_t v7 = [a1 protocolForParameters:v5];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      SEL v17 = 0;
      SEL v18 = 0;
      uint64_t v19 = 0;
      id v20 = 0;
      *a3 = @"Configuration VPN type is not L2TP";
LABEL_59:

      id v6 = v45;
      goto LABEL_60;
    }
    id v8 = [v45 objectForKeyedSubscript:@"authentication-method"];

    if (v8) {
      [v7 setAuthenticationMethod:1];
    }
    uint64_t v9 = [v45 objectForKeyedSubscript:@"send-all-traffic"];

    if (v9)
    {
      uint64_t v10 = [v7 IPv4Settings];

      if (v10)
      {
        uint64_t v11 = [v7 IPv4Settings];
        [v11 setOverridePrimary:0];
      }
    }
    SEL v12 = [v45 objectForKeyedSubscript:@"verbose-logging-enabled"];

    if (v12) {
      [v7 setVerboseLoggingEnabled:0];
    }
    id v13 = [v45 objectForKeyedSubscript:@"ipv4-config-method"];

    if (v13)
    {
      id v14 = [v7 IPv4Settings];

      if (v14)
      {
        uint64_t v15 = [v7 IPv4Settings];
        [v15 setConfigMethod:2];
      }
    }
    id v16 = [v45 objectForKeyedSubscript:@"ipv4-address"];

    if (v16)
    {
      SEL v17 = 0;
    }
    else
    {
      SEL v17 = [v7 IPv4Settings];

      if (v17)
      {
        uint64_t v21 = [v7 IPv4Settings];
        SEL v17 = [v21 addresses];
      }
    }
    id v22 = [v45 objectForKeyedSubscript:@"ipv4-subnet-mask"];

    if (v22)
    {
      SEL v18 = 0;
    }
    else
    {
      SEL v18 = [v7 IPv4Settings];

      if (v18)
      {
        v23 = [v7 IPv4Settings];
        SEL v18 = [v23 subnetMasks];
      }
      if (!v16)
      {
LABEL_24:
        long long v25 = [v45 objectForKeyedSubscript:@"ipv4-router"];

        if (v25)
        {
          long long v26 = [v7 IPv4Settings];

          if (v26)
          {
            uint64_t v27 = [v7 IPv4Settings];
            [v27 setRouter:0];
          }
        }
        uint64_t v28 = [v45 objectForKeyedSubscript:@"ipv6-config-method"];

        if (v28)
        {
          id v29 = [v7 IPv6Settings];

          if (v29)
          {
            uint64_t v30 = [v7 IPv6Settings];
            [v30 setConfigMethod:1];
          }
        }
        uint64_t v31 = [v45 objectForKeyedSubscript:@"ipv6-address"];

        if (v31)
        {
          uint64_t v19 = 0;
        }
        else
        {
          uint64_t v19 = [v7 IPv6Settings];

          if (v19)
          {
            id v32 = [v7 IPv6Settings];
            uint64_t v19 = [v32 addresses];
          }
        }
        uint64_t v33 = [v45 objectForKeyedSubscript:@"ipv6-prefix-length"];

        if (v33)
        {
          id v20 = 0;
        }
        else
        {
          id v20 = [v7 IPv6Settings];

          if (v20)
          {
            uint64_t v34 = [v7 IPv6Settings];
            id v20 = [v34 networkPrefixLengths];
          }
          if (!v31) {
            goto LABEL_40;
          }
        }
        uint64_t v35 = [[NEIPv6Settings alloc] initWithAddresses:v19 networkPrefixLengths:v20];
        [v7 setIPv6Settings:v35];

LABEL_40:
        uint64_t v36 = [v45 objectForKeyedSubscript:@"ipv6-router"];

        if (v36)
        {
          v37 = [v7 IPv6Settings];

          if (v37)
          {
            uint64_t v38 = [v7 IPv6Settings];
            [v38 setRouter:0];
          }
        }
        uint64_t v39 = [v45 objectForKeyedSubscript:@"machine-authentication-method"];

        if (v39)
        {
          if ([v7 type] == 2)
          {
            [v7 setMachineAuthenticationMethod:1];
          }
          else
          {
            *a3 = [NSString stringWithFormat:@"Invalid %@, VPN type is not L2TP", @"machine-authentication-method"];
          }
        }
        BOOL v40 = [v45 objectForKeyedSubscript:@"shared-secret"];

        if (v40)
        {
          if ([v7 type] == 2)
          {
            uint64_t v41 = [v7 sharedSecretKeychainItem];
            [v41 setIdentifier:0];
          }
          else
          {
            *a3 = [NSString stringWithFormat:@"Invalid %@, VPN type is not L2TP", @"shared-secret"];
          }
        }
        uint64_t v42 = [v45 objectForKeyedSubscript:@"local-identifier"];

        if (v42)
        {
          if ([v7 type] == 2)
          {
            [v7 setLocalIdentifier:0];
          }
          else
          {
            *a3 = [NSString stringWithFormat:@"Invalid %@, VPN type is not L2TP", @"shared-secret"];
          }
        }
        long long v43 = [v45 objectForKeyedSubscript:@"machine-identity"];

        if (v43)
        {
          if ([v7 type] == 2)
          {
            [v7 setMachineIdentityReference:0];
          }
          else
          {
            *a3 = [NSString stringWithFormat:@"Invalid %@, VPN type is not L2TP", @"machine-identity"];
          }
        }
        goto LABEL_59;
      }
    }
    long long v24 = [[NEIPv4Settings alloc] initWithAddresses:v17 subnetMasks:v18];
    [v7 setIPv4Settings:v24];

    goto LABEL_24;
  }
LABEL_60:

  return MEMORY[0x1F41817F8](v5, v6);
}

- (void)addAppRuleWithParameters:(void *)a3 errorStr:
{
  v55[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v5 = a2;
    id v6 = [v5 objectForKeyedSubscript:@"match-signing-identifier"];
    uint64_t v7 = [v5 objectForKeyedSubscript:@"match-path"];
    id v8 = [v5 objectForKeyedSubscript:@"match-domains"];
    uint64_t v9 = [v5 objectForKeyedSubscript:@"match-account-identifiers"];

    uint64_t v11 = objc_msgSend(objc_getProperty(a1, v10, 56, 1), "appVPN");

    if (v11)
    {
      uint64_t v11 = objc_msgSend(objc_getProperty(a1, v12, 56, 1), "appVPN");
    }
    id v13 = objc_msgSend(objc_getProperty(a1, v12, 56, 1), "contentFilter");

    id Property = objc_getProperty(a1, v14, 56, 1);
    if (v13)
    {
      id v16 = [Property contentFilter];
      SEL v17 = [v16 perApp];

      if (!v17)
      {
        uint64_t v19 = objc_alloc_init(NEPerApp);
        uint64_t v21 = objc_msgSend(objc_getProperty(a1, v20, 56, 1), "contentFilter");
        [v21 setPerApp:v19];
      }
      id v22 = objc_msgSend(objc_getProperty(a1, v18, 56, 1), "contentFilter");
    }
    else
    {
      v23 = [Property dnsProxy];

      id v25 = objc_getProperty(a1, v24, 56, 1);
      if (v23)
      {
        long long v26 = [v25 dnsProxy];
        uint64_t v27 = [v26 perApp];

        if (!v27)
        {
          id v29 = objc_alloc_init(NEPerApp);
          uint64_t v31 = objc_msgSend(objc_getProperty(a1, v30, 56, 1), "dnsProxy");
          [v31 setPerApp:v29];
        }
        id v22 = objc_msgSend(objc_getProperty(a1, v28, 56, 1), "dnsProxy");
      }
      else
      {
        uint64_t v32 = [v25 relay];

        if (!v32) {
          goto LABEL_17;
        }
        uint64_t v34 = objc_msgSend(objc_getProperty(a1, v33, 56, 1), "relay");
        uint64_t v35 = [v34 perApp];

        if (!v35)
        {
          v37 = objc_alloc_init(NEPerApp);
          uint64_t v39 = objc_msgSend(objc_getProperty(a1, v38, 56, 1), "relay");
          [v39 setPerApp:v37];
        }
        id v22 = objc_msgSend(objc_getProperty(a1, v36, 56, 1), "relay");
      }
    }
    BOOL v40 = v22;
    uint64_t v32 = [v22 perApp];

LABEL_17:
    if (!(v11 | v32))
    {
      *a3 = @"No perApp configuration present to apply app rules to";
LABEL_41:

      return;
    }
    if (v11) {
      uint64_t v41 = (void *)v11;
    }
    else {
      uint64_t v41 = (void *)v32;
    }
    uint64_t v42 = (NEAppRule *)[v41 copyAppRuleByID:v6];
    if (v42)
    {
      if (v11)
      {
LABEL_24:
        long long v43 = (void *)v11;
LABEL_27:
        [v43 removeAppRuleByID:v6];
        [(NEAppRule *)v42 setMatchPath:v7];
        if (isa_nsarray(v8))
        {
          [(NEAppRule *)v42 setMatchDomains:v8];
        }
        else if (isa_nsstring(v8))
        {
          v55[0] = v8;
          long long v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
          [(NEAppRule *)v42 setMatchDomains:v44];
        }
        if (isa_nsarray(v9))
        {
          [(NEAppRule *)v42 setMatchAccountIdentifiers:v9];
        }
        else if (isa_nsstring(v9))
        {
          uint64_t v54 = v9;
          uint64_t v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
          [(NEAppRule *)v42 setMatchAccountIdentifiers:v45];
        }
        id v46 = objc_alloc(MEMORY[0x1E4F1CA48]);
        if (v11)
        {
          long long v47 = [(id)v11 appRules];
          uint64_t v48 = (void *)[v46 initWithArray:v47];

          [v48 addObject:v42];
          long long v49 = (void *)v11;
        }
        else
        {
          v50 = [(id)v32 appRules];
          uint64_t v48 = (void *)[v46 initWithArray:v50];

          [v48 addObject:v42];
          long long v49 = (void *)v32;
        }
        [v49 setAppRules:v48];
        uint64_t v52 = objc_msgSend(objc_getProperty(a1, v51, 56, 1), "externalIdentifier");

        if (!v52) {
          objc_msgSend(objc_getProperty(a1, v53, 56, 1), "setExternalIdentifier:", @"NEUTIL-PERAPP-UUID");
        }

        goto LABEL_41;
      }
    }
    else
    {
      uint64_t v42 = [[NEAppRule alloc] initWithSigningIdentifier:v6];
      if (v11) {
        goto LABEL_24;
      }
    }
    long long v43 = (void *)v32;
    goto LABEL_27;
  }
}

- (void)removeAppRuleWithParameters:(void *)a3 errorStr:
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:@"match-signing-identifier"];
    uint64_t v9 = objc_msgSend(objc_getProperty(a1, v8, 56, 1), "appVPN");

    if (v9)
    {
      uint64_t v9 = objc_msgSend(objc_getProperty(a1, v10, 56, 1), "appVPN");
    }
    uint64_t v11 = objc_msgSend(objc_getProperty(a1, v10, 56, 1), "contentFilter");

    id Property = objc_getProperty(a1, v12, 56, 1);
    if (v11)
    {
      SEL v14 = [Property contentFilter];
    }
    else
    {
      uint64_t v15 = [Property dnsProxy];

      id v17 = objc_getProperty(a1, v16, 56, 1);
      if (v15)
      {
        SEL v14 = [v17 dnsProxy];
      }
      else
      {
        uint64_t v18 = [v17 relay];

        if (!v18) {
          goto LABEL_11;
        }
        SEL v14 = objc_msgSend(objc_getProperty(a1, v19, 56, 1), "relay");
      }
    }
    SEL v20 = v14;
    uint64_t v18 = [v14 perApp];

LABEL_11:
    if (!(v9 | v18))
    {
      *a3 = @"No perApp configuration present to apply app rules to";
LABEL_39:

      goto LABEL_40;
    }
    long long v43 = a3;
    id v21 = objc_alloc(MEMORY[0x1E4F1CA48]);
    long long v44 = v6;
    if (v9) {
      id v22 = (void *)v9;
    }
    else {
      id v22 = (void *)v18;
    }
    v23 = [v22 appRules];
    SEL v24 = (void *)[v21 initWithArray:v23];

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v25 = v24;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v41 = (void *)v18;
      uint64_t v42 = (void *)v9;
      uint64_t v28 = 0;
      uint64_t v29 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v46 != v29) {
            objc_enumerationMutation(v25);
          }
          uint64_t v31 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          uint64_t v32 = objc_msgSend(v31, "matchSigningIdentifier", v41, v42);
          int v33 = [v32 isEqualToString:v7];

          if (v33)
          {
            id v34 = v31;

            uint64_t v28 = v34;
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v27);

      uint64_t v18 = (uint64_t)v41;
      uint64_t v9 = (uint64_t)v42;
      if (v28)
      {
        [v25 removeObject:v28];
        id v6 = v44;
        if ([v25 count])
        {
          if (v42) {
            uint64_t v35 = v42;
          }
          else {
            uint64_t v35 = v41;
          }
          [v35 setAppRules:v25];
        }
        else
        {
          if (v42) {
            uint64_t v36 = v42;
          }
          else {
            uint64_t v36 = v41;
          }
          [v36 setAppRules:0];
          SEL v38 = objc_msgSend(objc_getProperty(a1, v37, 56, 1), "externalIdentifier");
          int v39 = [v38 isEqualToString:@"NEUTIL-PERAPP-UUID"];

          if (v39) {
            objc_msgSend(objc_getProperty(a1, v40, 56, 1), "setExternalIdentifier:", 0);
          }
        }
        goto LABEL_38;
      }
    }
    else
    {
    }
    uint64_t v28 = 0;
    id v6 = v44;
    void *v43 = @"No matched rule";
LABEL_38:

    goto LABEL_39;
  }
LABEL_40:
}

- (void)setPathControllerWithParameters:(void *)a3 errorStr:
{
  id v5 = a2;
  if (a1)
  {
    id v22 = v5;
    uint64_t v7 = objc_msgSend(objc_getProperty(a1, v6, 56, 1), "pathController");

    if (!v7)
    {
      *a3 = @"No Path Controller configuration present";
LABEL_18:
      id v5 = v22;
      goto LABEL_19;
    }
    SEL v8 = [v22 objectForKeyedSubscript:@"enabled"];

    if (v8)
    {
      uint64_t v9 = [v22 objectForKeyedSubscript:@"enabled"];
      uint64_t v10 = [v9 BOOLValue];
      SEL v12 = objc_msgSend(objc_getProperty(a1, v11, 56, 1), "pathController");
      [v12 setEnabled:v10];
    }
    id v13 = [v22 objectForKeyedSubscript:@"cellular-fallback"];
    if ([v13 isEqualToString:@"default"])
    {
      uint64_t v15 = objc_msgSend(objc_getProperty(a1, v14, 56, 1), "pathController");
      SEL v16 = v15;
      uint64_t v17 = 0;
    }
    else if ([v13 isEqualToString:@"none"])
    {
      uint64_t v15 = objc_msgSend(objc_getProperty(a1, v18, 56, 1), "pathController");
      SEL v16 = v15;
      uint64_t v17 = 1;
    }
    else if ([v13 isEqualToString:@"foreground"])
    {
      uint64_t v15 = objc_msgSend(objc_getProperty(a1, v19, 56, 1), "pathController");
      SEL v16 = v15;
      uint64_t v17 = 3;
    }
    else if ([v13 isEqualToString:@"background"])
    {
      uint64_t v15 = objc_msgSend(objc_getProperty(a1, v20, 56, 1), "pathController");
      SEL v16 = v15;
      uint64_t v17 = 7;
    }
    else
    {
      if (![v13 isEqualToString:@"all"])
      {
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v15 = objc_msgSend(objc_getProperty(a1, v21, 56, 1), "pathController");
      SEL v16 = v15;
      uint64_t v17 = 11;
    }
    [v15 setCellularFallbackFlags:v17];

    goto LABEL_17;
  }
LABEL_19:
}

- (void)addPathRuleWithParameters:(__CFString *)a3 errorStr:
{
  v38[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v5 = a2;
    id v6 = [v5 objectForKeyedSubscript:@"match-signing-identifier"];
    uint64_t v7 = [v5 objectForKeyedSubscript:@"match-path"];
    SEL v8 = [v5 objectForKeyedSubscript:@"match-domains"];
    uint64_t v9 = [v5 objectForKeyedSubscript:@"match-account-identifiers"];
    uint64_t v10 = [v5 objectForKeyedSubscript:@"cellular-behavior"];
    SEL v11 = [v5 objectForKeyedSubscript:@"wifi-behavior"];

    id v13 = objc_msgSend(objc_getProperty(a1, v12, 56, 1), "pathController");
    SEL v14 = (NEPathRule *)[v13 copyPathRuleBySigningIdentifier:v6];

    if (!v14) {
      SEL v14 = [(NEAppRule *)[NEPathRule alloc] initWithSigningIdentifier:v6];
    }
    SEL v16 = objc_msgSend(objc_getProperty(a1, v15, 56, 1), "pathController");
    [v16 removePathRuleBySigningIdentifier:v6];

    [(NEAppRule *)v14 setMatchPath:v7];
    if (isa_nsarray(v8))
    {
      [(NEAppRule *)v14 setMatchDomains:v8];
    }
    else if (isa_nsstring(v8))
    {
      v38[0] = v8;
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
      [(NEAppRule *)v14 setMatchDomains:v17];
    }
    if (isa_nsarray(v9))
    {
      [(NEAppRule *)v14 setMatchAccountIdentifiers:v9];
    }
    else if (isa_nsstring(v9))
    {
      SEL v37 = v9;
      uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
      [(NEAppRule *)v14 setMatchAccountIdentifiers:v19];
    }
    if (v10)
    {
      if ([v10 isEqualToString:@"allow"])
      {
        uint64_t v20 = 0;
      }
      else if ([v10 isEqualToString:@"deny"])
      {
        uint64_t v20 = 1;
      }
      else
      {
        if (([v10 isEqualToString:@"allow-while-roaming"] & 1) == 0)
        {
          uint64_t v35 = @"Cellular behavior value not recognized";
          goto LABEL_31;
        }
        uint64_t v20 = 2;
      }
      [(NEPathRule *)v14 setCellularBehavior:v20];
    }
    if (v11)
    {
      if ([v11 isEqualToString:@"allow"])
      {
        uint64_t v21 = 0;
      }
      else if ([v11 isEqualToString:@"deny"])
      {
        uint64_t v21 = 1;
      }
      else
      {
        if (([v11 isEqualToString:@"allow-while-roaming"] & 1) == 0)
        {
          uint64_t v35 = @"WiFi behavior value not recognized";
          goto LABEL_31;
        }
        uint64_t v21 = 2;
      }
      [(NEPathRule *)v14 setWifiBehavior:v21];
    }
    id v22 = objc_msgSend(objc_getProperty(a1, v18, 56, 1), "pathController");

    if (v22)
    {
      id v23 = objc_alloc(MEMORY[0x1E4F1CA48]);
      id v25 = objc_msgSend(objc_getProperty(a1, v24, 56, 1), "pathController");
      [v25 pathRules];
      uint64_t v36 = v9;
      uint64_t v26 = v10;
      uint64_t v27 = v11;
      uint64_t v28 = v8;
      uint64_t v29 = v6;
      v31 = SEL v30 = v7;
      uint64_t v32 = (void *)[v23 initWithArray:v31];

      [v32 addObject:v14];
      id v34 = objc_msgSend(objc_getProperty(a1, v33, 56, 1), "pathController");
      [v34 setPathRules:v32];

      uint64_t v7 = v30;
      id v6 = v29;
      SEL v8 = v28;
      SEL v11 = v27;
      uint64_t v10 = v26;
      uint64_t v9 = v36;

LABEL_32:
      return;
    }
    uint64_t v35 = @"No Path Controller configuration present to apply path rules to";
LABEL_31:
    *a3 = v35;
    goto LABEL_32;
  }
}

- (void)removePathRuleWithParameters:(void *)a3 errorStr:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v5 = [a2 objectForKeyedSubscript:@"match-signing-identifier"];
    uint64_t v7 = objc_msgSend(objc_getProperty(a1, v6, 56, 1), "pathController");

    if (v7)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v10 = objc_msgSend(objc_getProperty(a1, v9, 56, 1), "pathController");
      SEL v11 = [v10 pathRules];
      SEL v12 = (void *)[v8 initWithArray:v11];

      if ([v12 count])
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        SEL v14 = objc_msgSend(objc_getProperty(a1, v13, 56, 1), "pathController", 0);
        uint64_t v15 = [v14 pathRules];

        uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v29 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              uint64_t v21 = [v20 matchSigningIdentifier];
              int v22 = [v21 isEqualToString:v5];

              if (v22) {
                [v12 removeObject:v20];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
          }
          while (v17);
        }

        uint64_t v23 = [v12 count];
        id v25 = objc_msgSend(objc_getProperty(a1, v24, 56, 1), "pathController");
        uint64_t v26 = v25;
        if (v23) {
          uint64_t v27 = v12;
        }
        else {
          uint64_t v27 = 0;
        }
        [v25 setPathRules:v27];
      }
      else
      {
        *a3 = @"No rules present";
      }
    }
    else
    {
      *a3 = @"No Path Controller configuration present to apply app rules to";
    }
  }
}

void __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2_943(uint64_t a1, void *a2)
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  int v60 = [a2 objectForKeyedSubscript:@"UserMap"];
  CFAllocatorRef v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = objc_getProperty(v4, v3, 40, 1);
    if (v5)
    {
      uint64_t v7 = v5;
      id Property = *(id *)(a1 + 32);
      if (Property) {
        id Property = objc_getProperty(Property, v6, 40, 1);
      }
      uint64_t v9 = [Property count];

      if (v9)
      {
        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        id v10 = *(id *)(a1 + 32);
        if (v10) {
          id v10 = objc_getProperty(v10, v6, 40, 1);
        }
        obuint64_t j = v10;
        uint64_t v61 = [obj countByEnumeratingWithState:&v77 objects:v86 count:16];
        if (v61)
        {
          uint64_t v58 = *(void *)v78;
          uint64_t v59 = a1;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v78 != v58) {
                objc_enumerationMutation(obj);
              }
              uint64_t v62 = v11;
              SEL v12 = *(void **)(*((void *)&v77 + 1) + 8 * v11);
              id v13 = NSString;
              SEL v14 = [v12 name];
              uint64_t v15 = objc_msgSend(v13, "stringWithFormat:", @"%@ (Users:"), v14;

              id v63 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              long long v73 = 0u;
              long long v74 = 0u;
              long long v75 = 0u;
              long long v76 = 0u;
              id v16 = v60;
              uint64_t v17 = [v16 countByEnumeratingWithState:&v73 objects:v85 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)v74;
                do
                {
                  for (uint64_t i = 0; i != v18; ++i)
                  {
                    if (*(void *)v74 != v19) {
                      objc_enumerationMutation(v16);
                    }
                    uint64_t v21 = *(void *)(*((void *)&v73 + 1) + 8 * i);
                    int v22 = [v16 objectForKeyedSubscript:v21];
                    uint64_t v23 = [v12 identifier];
                    int v24 = [v22 containsObject:v23];

                    if (v24) {
                      [v63 addObject:v21];
                    }
                  }
                  uint64_t v18 = [v16 countByEnumeratingWithState:&v73 objects:v85 count:16];
                }
                while (v18);
              }

              id v25 = v63;
              if ([v63 count])
              {
                long long v71 = 0u;
                long long v72 = 0u;
                long long v69 = 0u;
                long long v70 = 0u;
                id v26 = v63;
                uint64_t v27 = [v26 countByEnumeratingWithState:&v69 objects:v84 count:16];
                a1 = v59;
                if (v27)
                {
                  uint64_t v28 = v27;
                  uint64_t v29 = *(void *)v70;
                  do
                  {
                    uint64_t v30 = 0;
                    long long v31 = v15;
                    do
                    {
                      if (*(void *)v70 != v29) {
                        objc_enumerationMutation(v26);
                      }
                      uint64_t v32 = *(void **)(*((void *)&v69 + 1) + 8 * v30);
                      *(void *)id_type = 0;
                      *(void *)uu = 0;
                      uint64_t v83 = 0;
                      [v32 getUUIDBytes:uu];
                      mbr_uuid_to_id(uu, (id_t *)id_type, &id_type[1]);
                      if (id_type[0]
                        && (uint64_t v33 = getpwuid(id_type[0])) != 0
                        && (pw_name = v33->pw_name) != 0
                        && *pw_name)
                      {
                        uint64_t v35 = id_type[0];
                        uint64_t v36 = [v32 UUIDString];
                        [v31 stringByAppendingFormat:@" %s(%d)[%@]", pw_name, v35, v36];
                      }
                      else
                      {
                        uint64_t v37 = id_type[0];
                        uint64_t v36 = [v32 UUIDString];
                        [v31 stringByAppendingFormat:@" %d[%@]", v37, v36, v56];
                      uint64_t v15 = };

                      ++v30;
                      long long v31 = v15;
                    }
                    while (v28 != v30);
                    uint64_t v28 = [v26 countByEnumeratingWithState:&v69 objects:v84 count:16];
                  }
                  while (v28);
                }

                SEL v38 = [v15 stringByAppendingString:@"\n"]);
                id v25 = v63;
              }
              else
              {
                SEL v38 = [v15 stringByAppendingString:@" None\n"]);
                a1 = v59;
              }

              [*(id *)(a1 + 40) addObject:v38];
              uint64_t v11 = v62 + 1;
            }
            while (v62 + 1 != v61);
            uint64_t v61 = [obj countByEnumeratingWithState:&v77 objects:v86 count:16];
          }
          while (v61);
        }
      }
    }
    int v39 = *(void **)(a1 + 32);
    if (v39)
    {
      id v40 = objc_getProperty(v39, v6, 32, 1);
      if (v40)
      {
        uint64_t v42 = v40;
        id v43 = *(id *)(a1 + 32);
        if (v43) {
          id v43 = objc_getProperty(v43, v41, 32, 1);
        }
        uint64_t v44 = [v43 count];

        if (v44)
        {
          [*(id *)(a1 + 40) addObject:@"New Configurations:\n"];
          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          id v46 = *(id *)(a1 + 32);
          if (v46) {
            id v46 = objc_getProperty(v46, v45, 32, 1);
          }
          id v47 = v46;
          uint64_t v48 = [v47 countByEnumeratingWithState:&v64 objects:v81 count:16];
          if (v48)
          {
            uint64_t v49 = v48;
            uint64_t v50 = *(void *)v65;
            do
            {
              for (uint64_t j = 0; j != v49; ++j)
              {
                if (*(void *)v65 != v50) {
                  objc_enumerationMutation(v47);
                }
                uint64_t v52 = *(void **)(a1 + 40);
                uint64_t v53 = NSString;
                uint64_t v54 = [*(id *)(*((void *)&v64 + 1) + 8 * j) name];
                id v55 = [v53 stringWithFormat:@"%@\n", v54];
                [v52 addObject:v55];
              }
              uint64_t v49 = [v47 countByEnumeratingWithState:&v64 objects:v81 count:16];
            }
            while (v49);
          }
        }
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_3_960(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v12 = v3;
  if (v3)
  {
    id v5 = NSString;
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = convert_error_to_string_23565(v3);
    id v8 = [v5 stringWithFormat:@"Failed to save configuration \"%@\": %@", v6, v7];

    [*(id *)(a1 + 40) addObject:v8];
  }
  else
  {
    id Property = *(id *)(a1 + 48);
    if (Property) {
      id Property = objc_getProperty(Property, v4, 32, 1);
    }
    [Property removeObjectIdenticalTo:*(void *)(a1 + 56)];
    id v11 = *(id *)(a1 + 48);
    if (v11) {
      id v11 = objc_getProperty(v11, v10, 40, 1);
    }
    [v11 addObject:*(void *)(a1 + 56)];
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)setAlwaysOnParameters:(__CFString *)a3 errorStr:
{
  id v42 = a2;
  if (a1)
  {
    uint64_t v6 = objc_msgSend(objc_getProperty(a1, v5, 56, 1), "alwaysOnVPN");
    if (!v6) {
      *a3 = @"Requires AlwaysOn configuraton";
    }
    uint64_t v7 = [v42 objectForKeyedSubscript:@"ui-toggle-enabled"];

    if (v7)
    {
      id v8 = [v42 objectForKeyedSubscript:@"ui-toggle-enabled"];
      objc_msgSend(v6, "setToggleEnabled:", objc_msgSend(v8, "BOOLValue"));
    }
    uint64_t v9 = [v42 objectForKeyedSubscript:@"service-exception-name"];

    if (!v9)
    {
      uint64_t v18 = 0;
      goto LABEL_28;
    }
    id v10 = [v42 objectForKeyedSubscript:@"service-exception-name"];
    if (([v10 isEqualToString:@"AirPlay"] & 1) == 0)
    {
      id v11 = [v42 objectForKeyedSubscript:@"service-exception-name"];
      if (([v11 isEqualToString:@"AirPrint"] & 1) == 0)
      {
        id v12 = [v42 objectForKeyedSubscript:@"service-exception-name"];
        if (([v12 isEqualToString:@"AirDrop"] & 1) == 0)
        {
          id v13 = [v42 objectForKeyedSubscript:@"service-exception-name"];
          if (([v13 isEqualToString:@"VoiceMail"] & 1) == 0)
          {
            SEL v14 = [v42 objectForKeyedSubscript:@"service-exception-name"];
            if (([v14 isEqualToString:@"CellularServices"] & 1) == 0)
            {
              id v40 = [v42 objectForKeyedSubscript:@"service-exception-name"];
              char v41 = [v40 isEqualToString:@"DeviceCommunication"];

              if ((v41 & 1) == 0)
              {
                uint64_t v9 = 0;
                uint64_t v18 = 0;
                uint64_t v19 = @"Service must be: AirPlay, AirPrint, AirDrop, VoiceMail, CellularServices or DeviceCommunication";
                goto LABEL_40;
              }
              goto LABEL_17;
            }
          }
        }
      }
    }

LABEL_17:
    uint64_t v9 = [v42 objectForKeyedSubscript:@"service-exception-action"];

    if (!v9)
    {
      uint64_t v18 = 0;
      uint64_t v19 = @"Action is required";
LABEL_40:
      *a3 = v19;
      goto LABEL_41;
    }
    uint64_t v15 = [v42 objectForKeyedSubscript:@"service-exception-action"];
    char v16 = [v15 isEqualToString:@"Allow"];

    if (v16)
    {
      uint64_t v17 = 1;
    }
    else
    {
      uint64_t v20 = [v42 objectForKeyedSubscript:@"service-exception-action"];
      char v21 = [v20 isEqualToString:@"Drop"];

      if ((v21 & 1) == 0)
      {
        uint64_t v9 = 0;
        uint64_t v18 = 0;
        uint64_t v19 = @"Action must be Allow or Drop";
        goto LABEL_40;
      }
      uint64_t v17 = 2;
    }
    int v22 = [v6 serviceExceptions];

    if (v22)
    {
      uint64_t v23 = [v6 serviceExceptions];
      uint64_t v9 = (void *)[v23 mutableCopy];
    }
    else
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    }
    uint64_t v18 = objc_alloc_init(NEAOVPNException);
    int v24 = [v42 objectForKeyedSubscript:@"service-exception-name"];
    [(NEAOVPNException *)v18 setServiceName:v24];

    [(NEAOVPNException *)v18 setAction:v17];
    id v25 = [v42 objectForKeyedSubscript:@"service-exception-name"];
    [v9 setObject:v18 forKeyedSubscript:v25];

    [v6 setServiceExceptions:v9];
LABEL_28:
    id v26 = [v42 objectForKeyedSubscript:@"allow-all-cn-plugins"];

    if (v26)
    {
      uint64_t v27 = [v42 objectForKeyedSubscript:@"allow-all-cn-plugins"];
      objc_msgSend(v6, "setAllowAllCaptiveNetworkPlugins:", objc_msgSend(v27, "BOOLValue"));
    }
    uint64_t v28 = [v42 objectForKeyedSubscript:@"allow-websheet"];

    if (v28)
    {
      uint64_t v29 = [v42 objectForKeyedSubscript:@"allow-websheet"];
      objc_msgSend(v6, "setAllowCaptiveWebSheet:", objc_msgSend(v29, "BOOLValue"));
    }
    uint64_t v30 = [v42 objectForKeyedSubscript:@"cn-plugin-bundle-id"];

    if (!v30) {
      goto LABEL_41;
    }
    long long v31 = [v6 allowedCaptiveNetworkPlugins];

    if (v31)
    {
      uint64_t v32 = [v6 allowedCaptiveNetworkPlugins];
      uint64_t v33 = [v42 objectForKeyedSubscript:@"cn-plugin-bundle-id"];
      id v34 = [v32 objectForKeyedSubscript:v33];

      if (v34)
      {
        uint64_t v19 = @"BundleId already exists";
        goto LABEL_40;
      }
      uint64_t v36 = [v6 allowedCaptiveNetworkPlugins];
      uint64_t v35 = (void *)[v36 mutableCopy];

      uint64_t v9 = v36;
    }
    else
    {
      uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    }

    uint64_t v37 = objc_alloc_init(NEAOVPNException);
    SEL v38 = [v42 objectForKeyedSubscript:@"cn-plugin-bundle-id"];
    [(NEAOVPNException *)v37 setBundleIdentifier:v38];

    [(NEAOVPNException *)v37 setAction:1];
    int v39 = [v42 objectForKeyedSubscript:@"cn-plugin-bundle-id"];
    [v35 setObject:v37 forKeyedSubscript:v39];

    [v6 setAllowedCaptiveNetworkPlugins:v35];
    uint64_t v9 = v35;
    uint64_t v18 = v37;
LABEL_41:
  }
}

- (void)unsetAlwaysOnParameters:(__CFString *)a3 errorStr:
{
  id v28 = a2;
  if (a1)
  {
    uint64_t v6 = objc_msgSend(objc_getProperty(a1, v5, 56, 1), "alwaysOnVPN");
    if (!v6) {
      *a3 = @"Requires AlwaysOn configuraton";
    }
    uint64_t v7 = [v28 objectForKeyedSubscript:@"ui-toggle-enabled"];

    if (v7) {
      [v6 setToggleEnabled:0];
    }
    id v8 = [v28 objectForKeyedSubscript:@"service-exception-name"];

    if (v8)
    {
      id v8 = [v6 serviceExceptions];

      if (!v8)
      {
        uint64_t v27 = @"No existing service to be removed";
        goto LABEL_26;
      }
      uint64_t v9 = [v6 serviceExceptions];
      id v10 = [v28 objectForKeyedSubscript:@"service-exception-name"];
      id v11 = [v9 objectForKeyedSubscript:v10];

      if (!v11)
      {
        id v8 = 0;
        uint64_t v27 = @"Service does not exist";
        goto LABEL_26;
      }
      id v12 = [v6 serviceExceptions];
      id v8 = (void *)[v12 mutableCopy];

      id v13 = [v28 objectForKeyedSubscript:@"service-exception-name"];
      [v8 removeObjectForKey:v13];

      if ([v8 count]) {
        SEL v14 = v8;
      }
      else {
        SEL v14 = 0;
      }
      [v6 setServiceExceptions:v14];
    }
    uint64_t v15 = [v28 objectForKeyedSubscript:@"allow-all-cn-plugins"];

    if (v15) {
      [v6 setAllowAllCaptiveNetworkPlugins:0];
    }
    char v16 = [v28 objectForKeyedSubscript:@"allow-websheet"];

    if (v16) {
      [v6 setAllowCaptiveWebSheet:0];
    }
    uint64_t v17 = [v28 objectForKeyedSubscript:@"cn-plugin-bundle-id"];

    if (!v17) {
      goto LABEL_27;
    }
    uint64_t v18 = [v6 allowedCaptiveNetworkPlugins];

    if (v18)
    {
      uint64_t v19 = [v6 allowedCaptiveNetworkPlugins];
      uint64_t v20 = [v28 objectForKeyedSubscript:@"cn-plugin-bundle-id"];
      char v21 = [v19 objectForKeyedSubscript:v20];

      if (v21)
      {
        int v22 = [v6 allowedCaptiveNetworkPlugins];
        uint64_t v23 = (void *)[v22 mutableCopy];

        int v24 = [v28 objectForKeyedSubscript:@"cn-plugin-bundle-id"];
        [v23 removeObjectForKey:v24];

        if ([v23 count])
        {
          id v25 = v6;
          id v26 = v23;
        }
        else
        {
          id v25 = v6;
          id v26 = 0;
        }
        [v25 setAllowedCaptiveNetworkPlugins:v26];
        id v8 = v23;
        goto LABEL_27;
      }
      uint64_t v27 = @"BundleId does not exist";
    }
    else
    {
      uint64_t v27 = @"No existing CaptoveNetworkPlugin to be removed";
    }
LABEL_26:
    *a3 = v27;
LABEL_27:
  }
}

void __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_972(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    CFAllocatorRef v4 = ne_log_large_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      id v12 = v3;
      __int16 v13 = 2112;
      uint64_t v14 = v5;
      _os_log_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_INFO, "Save error: %@ for %@", buf, 0x16u);
    }

    uint64_t v6 = NSString;
    uint64_t v7 = [*(id *)(a1 + 32) name];
    uint64_t v8 = [v6 stringWithFormat:@"Save Configuration with name \"%@\" failed with error: %@", v7, v3];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

void __69__NEUtilConfigurationClient_reloadIdentityListWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(a1 + 32);
        if (v7)
        {
          uint64_t v8 = (objc_class *)MEMORY[0x1E4F1CA60];
          id v9 = *(id *)(*((void *)&v17 + 1) + 8 * v6);
          id v10 = (void *)[[v8 alloc] initWithDictionary:v9];

          id v11 = [NSNumber numberWithInteger:0];
          [v10 setObject:v11 forKeyedSubscript:@"domain"];

          if (!objc_getProperty(v7, v12, 48, 1))
          {
            id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            objc_setProperty_atomic(v7, v15, v14, 48);
          }
          objc_msgSend(objc_getProperty(v7, v13, 48, 1), "addObject:", v10);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)unsetProxyServer:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"type"];
  uint64_t v8 = [(NEUtilConfigurationClient *)self protocolForParameters:v6];

  if (v8)
  {
    uint64_t v9 = [v8 proxySettings];
    if (v9)
    {
      id v10 = (void *)v9;
      if ([v7 isEqualToString:@"http"])
      {
        [v10 setHTTPServer:0];
        [v10 setHTTPEnabled:0];
      }
      else if ([v7 isEqualToString:@"https"])
      {
        [v10 setHTTPSServer:0];
        [v10 setHTTPSEnabled:0];
      }
      else if ([v7 isEqualToString:@"ftp"])
      {
        [v10 setFTPServer:0];
        [v10 setFTPEnabled:0];
      }
      else if ([v7 isEqualToString:@"rtsp"])
      {
        [v10 setRTSPServer:0];
        [v10 setRTSPEnabled:0];
      }
      else if ([v7 isEqualToString:@"gopher"])
      {
        [v10 setGopherServer:0];
        [v10 setGopherEnabled:0];
      }
      else
      {
        if (![v7 isEqualToString:@"socks"])
        {
          *a4 = [NSString stringWithFormat:@"Invalid proxy type: %@, valid values are \"http\", \"https\", \"ftp\", \"rtsp\", \"gopher\", and \"socks\"", v7];

          BOOL v11 = 0;
          goto LABEL_18;
        }
        [v10 setSOCKSServer:0];
        [v10 setSOCKSEnabled:0];
      }
    }
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
    *a4 = @"Missing protocol";
  }
LABEL_18:

  return v11;
}

- (BOOL)setProxyServer:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"type"];
  uint64_t v8 = [(NEUtilConfigurationClient *)self protocolForParameters:v6];
  uint64_t v9 = v8;
  if (!v8)
  {
    BOOL v12 = 0;
    *a4 = @"Missing protocol";
    goto LABEL_35;
  }
  id v10 = [v8 proxySettings];
  if (!v10) {
    id v10 = objc_alloc_init(NEProxySettings);
  }
  if ([v7 isEqualToString:@"http"])
  {
    uint64_t v11 = 1;
  }
  else if ([v7 isEqualToString:@"https"])
  {
    uint64_t v11 = 2;
  }
  else if ([v7 isEqualToString:@"ftp"])
  {
    uint64_t v11 = 3;
  }
  else if ([v7 isEqualToString:@"rtsp"])
  {
    uint64_t v11 = 4;
  }
  else if ([v7 isEqualToString:@"gopher"])
  {
    uint64_t v11 = 6;
  }
  else
  {
    if (([v7 isEqualToString:@"socks"] & 1) == 0)
    {
      *a4 = [NSString stringWithFormat:@"Invalid proxy type: %@, valid values are \"http\", \"https\", \"ftp\", \"rtsp\", \"gopher\", and \"socks\"", v7];

      goto LABEL_28;
    }
    uint64_t v11 = 5;
  }
  __int16 v13 = [NEProxyServer alloc];
  id v14 = [v6 objectForKeyedSubscript:@"address"];
  SEL v15 = [v6 objectForKeyedSubscript:@"port"];
  char v16 = -[NEProxyServer initWithType:address:port:](v13, "initWithType:address:port:", v11, v14, (int)[v15 intValue]);

  long long v17 = [v6 objectForKeyedSubscript:@"authentication-required"];

  if (v17)
  {
    long long v18 = [v6 objectForKeyedSubscript:@"authentication-required"];
    -[NEProxyServer setAuthenticationRequired:](v16, "setAuthenticationRequired:", [v18 BOOLValue]);
  }
  if (![(NEProxyServer *)v16 authenticationRequired]) {
    goto LABEL_23;
  }
  long long v19 = [v6 objectForKeyedSubscript:@"username"];

  if (!v19)
  {
    uint64_t v23 = @"Authentication is required, but username is missing";
LABEL_27:
    *a4 = v23;

LABEL_28:
    BOOL v12 = 0;
    goto LABEL_35;
  }
  long long v20 = [v6 objectForKeyedSubscript:@"username"];
  [(NEProxyServer *)v16 setUsername:v20];

  char v21 = [v6 objectForKeyedSubscript:@"password"];

  if (!v21)
  {
    uint64_t v23 = @"Authentication is required, but password is missing";
    goto LABEL_27;
  }
  uint64_t v22 = [v6 objectForKeyedSubscript:@"password"];
  [(NEProxyServer *)v16 setPassword:v22];

LABEL_23:
  switch(v11)
  {
    case 1:
      [(NEProxySettings *)v10 setHTTPServer:v16];
      [(NEProxySettings *)v10 setHTTPEnabled:1];
      break;
    case 2:
      [(NEProxySettings *)v10 setHTTPSServer:v16];
      [(NEProxySettings *)v10 setHTTPSEnabled:1];
      break;
    case 3:
      [(NEProxySettings *)v10 setFTPServer:v16];
      [(NEProxySettings *)v10 setFTPEnabled:1];
      break;
    case 4:
      [(NEProxySettings *)v10 setRTSPServer:v16];
      [(NEProxySettings *)v10 setRTSPEnabled:1];
      break;
    case 5:
      [(NEProxySettings *)v10 setSOCKSServer:v16];
      [(NEProxySettings *)v10 setSOCKSEnabled:1];
      break;
    case 6:
      [(NEProxySettings *)v10 setGopherServer:v16];
      [(NEProxySettings *)v10 setGopherEnabled:1];
      break;
    default:
      break;
  }
  [v9 setProxySettings:v10];

  BOOL v12 = 1;
LABEL_35:

  return v12;
}

- (BOOL)unsetProxyParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(NEUtilConfigurationClient *)self protocolForParameters:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 proxySettings];
    if (v9)
    {
      id v10 = [v6 objectForKeyedSubscript:@"auto-proxy-discovery"];

      if (v10) {
        [v9 setAutoProxyDiscovery:0];
      }
      uint64_t v11 = [v6 objectForKeyedSubscript:@"auto-config-url"];

      if (v11)
      {
        [v9 setAutoProxyConfigurationEnabled:0];
        [v9 setProxyAutoConfigURL:0];
      }
      BOOL v12 = [v6 objectForKeyedSubscript:@"exclude-simple-hostnames"];

      if (v12) {
        [v9 setExcludeSimpleHostnames:0];
      }
      __int16 v13 = [v6 objectForKeyedSubscript:@"exception-list"];

      if (v13) {
        [v9 setExceptionList:0];
      }
      id v14 = [v6 objectForKeyedSubscript:@"use-passive-ftp"];

      if (v14) {
        [v9 setUsePassiveFTP:0];
      }
      SEL v15 = [v6 objectForKeyedSubscript:@"match-domains"];

      if (v15) {
        [v9 setMatchDomains:0];
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
    *a4 = @"Missing protocol";
  }

  return v8 != 0;
}

- (BOOL)setProxyParameters:(id)a3 errorStr:(id *)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(NEUtilConfigurationClient *)self protocolForParameters:v6];
  uint64_t v8 = v7;
  if (!v7)
  {
    *a4 = @"Missing protocol";
    goto LABEL_24;
  }
  uint64_t v9 = [v7 proxySettings];
  if (!v9) {
    uint64_t v9 = objc_alloc_init(NEProxySettings);
  }
  id v10 = [v6 objectForKeyedSubscript:@"auto-proxy-discovery"];

  if (v10)
  {
    uint64_t v11 = [v6 objectForKeyedSubscript:@"auto-proxy-discovery"];
    -[NEProxySettings setAutoProxyDiscovery:](v9, "setAutoProxyDiscovery:", [v11 BOOLValue]);
  }
  BOOL v12 = [v6 objectForKeyedSubscript:@"auto-config-url"];

  if (v12)
  {
    [(NEProxySettings *)v9 setAutoProxyConfigurationEnabled:1];
    __int16 v13 = (void *)MEMORY[0x1E4F1CB10];
    id v14 = [v6 objectForKeyedSubscript:@"auto-config-url"];
    SEL v15 = [v13 URLWithString:v14];
    [(NEProxySettings *)v9 setProxyAutoConfigurationURL:v15];
  }
  char v16 = [v6 objectForKeyedSubscript:@"exclude-simple-hostnames"];

  if (v16)
  {
    long long v17 = [v6 objectForKeyedSubscript:@"exclude-simple-hostnames"];
    -[NEProxySettings setExcludeSimpleHostnames:](v9, "setExcludeSimpleHostnames:", [v17 BOOLValue]);
  }
  long long v18 = [v6 objectForKeyedSubscript:@"exception-list"];

  if (v18)
  {
    long long v19 = [v6 objectForKeyedSubscript:@"exception-list"];
    int v20 = isa_nsstring(v19);

    char v21 = [v6 objectForKeyedSubscript:@"exception-list"];
    uint64_t v22 = v21;
    if (v20)
    {
      v31[0] = v21;
      uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
      [(NEProxySettings *)v9 setExceptionList:v23];

LABEL_16:
      goto LABEL_17;
    }
    int v24 = isa_nsarray(v21);

    if (v24)
    {
      uint64_t v22 = [v6 objectForKeyedSubscript:@"exception-list"];
      [(NEProxySettings *)v9 setExceptionList:v22];
      goto LABEL_16;
    }
  }
LABEL_17:
  id v25 = [v6 objectForKeyedSubscript:@"use-passive-ftp"];

  if (v25)
  {
    id v26 = [v6 objectForKeyedSubscript:@"use-passive-ftp"];
    -[NEProxySettings setUsePassiveFTP:](v9, "setUsePassiveFTP:", [v26 BOOLValue]);
  }
  uint64_t v27 = [v6 objectForKeyedSubscript:@"match-domains"];
  if (isa_nsarray(v27))
  {
    [(NEProxySettings *)v9 setMatchDomains:v27];
  }
  else if (isa_nsstring(v27))
  {
    uint64_t v30 = v27;
    id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
    [(NEProxySettings *)v9 setMatchDomains:v28];
  }
  [v8 setProxySettings:v9];

LABEL_24:
  return v8 != 0;
}

- (BOOL)unsetRelayConditionsWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  uint64_t v8 = [(NEUtilConfigurationClient *)self relayConfiguration];
  if (v8)
  {
    uint64_t v9 = [v6 objectForKeyedSubscript:@"match-domains"];

    if (v9) {
      [v8 setMatchDomains:0];
    }
    id v10 = [v6 objectForKeyedSubscript:@"excluded-domains"];

    if (v10) {
      [v8 setExcludedDomains:0];
    }
  }
  else
  {
    *a4 = @"Missing relay configuration";
  }

  return v8 != 0;
}

- (id)relayConfiguration
{
  if (a1)
  {
    a1 = objc_msgSend(objc_getProperty(a1, a2, 56, 1), "relay");
    uint64_t v2 = vars8;
  }
  return a1;
}

- (BOOL)setRelayConditionsWithParameters:(id)a3 errorStr:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v8 = [(NEUtilConfigurationClient *)self relayConfiguration];
  if (v8)
  {
    uint64_t v9 = [v6 objectForKeyedSubscript:@"match-domains"];
    if (isa_nsarray(v9))
    {
      [v8 setMatchDomains:v9];
    }
    else if (isa_nsstring(v9))
    {
      v15[0] = v9;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      [v8 setMatchDomains:v10];
    }
    uint64_t v11 = [v6 objectForKeyedSubscript:@"excluded-domains"];
    if (isa_nsarray(v11))
    {
      [v8 setExcludedDomains:v11];
    }
    else if (isa_nsstring(v11))
    {
      id v14 = v11;
      BOOL v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
      [v8 setExcludedDomains:v12];
    }
  }
  else
  {
    *a4 = @"Missing relay configuration";
  }

  return v8 != 0;
}

- (BOOL)removeRelayWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = [a3 objectForKeyedSubscript:@"index"];
  unint64_t v7 = [v6 integerValue];
  uint64_t v9 = [(NEUtilConfigurationClient *)self relayConfiguration];
  id v10 = v9;
  if (!v9)
  {
    BOOL v16 = 0;
    long long v17 = @"Missing relay configuration";
LABEL_6:
    *a4 = v17;
    goto LABEL_7;
  }
  uint64_t v11 = [v9 relays];
  unint64_t v12 = [v11 count];

  if (v7 >= v12)
  {
    BOOL v16 = 0;
    long long v17 = @"No relay configuration present with given index";
    goto LABEL_6;
  }
  id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v14 = [v10 relays];
  SEL v15 = (void *)[v13 initWithArray:v14];

  [v15 removeObjectAtIndex:v7];
  [v10 setRelays:v15];

  BOOL v16 = 1;
LABEL_7:

  return v16;
}

- (BOOL)addRelayWithParameters:(id)a3 errorStr:(id *)a4
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v8 = [(NEUtilConfigurationClient *)self relayConfiguration];
  if (v8)
  {
    long long v45 = a4;
    uint64_t v9 = objc_alloc_init(NERelay);
    id v10 = [v6 objectForKeyedSubscript:@"http3-url"];
    uint64_t v11 = [v10 stringByRemovingPercentEncoding];

    if (v11)
    {
      unint64_t v12 = [MEMORY[0x1E4F1CB10] URLWithString:v11];
      [(NERelay *)v9 setHTTP3RelayURL:v12];
    }
    id v47 = (void *)v11;
    id v13 = [v6 objectForKeyedSubscript:@"http2-url"];
    uint64_t v14 = [v13 stringByRemovingPercentEncoding];

    if (v14)
    {
      SEL v15 = [MEMORY[0x1E4F1CB10] URLWithString:v14];
      [(NERelay *)v9 setHTTP2RelayURL:v15];
    }
    id v46 = (void *)v14;
    BOOL v16 = [v6 objectForKeyedSubscript:@"doh-url"];
    long long v17 = [v16 stringByRemovingPercentEncoding];

    if (v17)
    {
      long long v18 = [MEMORY[0x1E4F1CB10] URLWithString:v17];
      [(NERelay *)v9 setDnsOverHTTPSURL:v18];
    }
    long long v19 = [v6 objectForKeyedSubscript:@"raw-public-key"];
    int v20 = [v19 stringByRemovingPercentEncoding];

    if (v20)
    {
      dispatch_data_t v21 = dispatch_data_create((const void *)[v20 UTF8String], objc_msgSend(v20, "length"), 0, 0);
      uint64_t v22 = (void *)dispatch_data_create_with_transform();

      if (v22)
      {
        v48[0] = v22;
        uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
        [(NERelay *)v9 setRawPublicKeys:v23];
      }
    }
    else
    {
      uint64_t v22 = 0;
    }
    id v25 = [v6 objectForKeyedSubscript:@"identity"];

    if (v25)
    {
      id v26 = [v6 objectForKeyedSubscript:@"identity"];
      unint64_t v27 = [v26 integerValue];

      if (!self
        || (id v29 = objc_getProperty(self, v28, 48, 1)) == 0
        || (long long v31 = v29, v32 = objc_msgSend(objc_getProperty(self, v30, 48, 1), "count"), v31, v27 >= v32))
      {
        [NSString stringWithFormat:@"Invalid %@ index, use the \"list-identities\" command to obtain a list of available identities and their indicies", @"identity"];
        BOOL v24 = 0;
        id *v45 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
      id v34 = objc_msgSend(objc_getProperty(self, v33, 48, 1), "objectAtIndexedSubscript:", v27);
      uint64_t v35 = [v34 objectForKeyedSubscript:@"domain"];
      uint64_t v36 = [v35 integerValue];

      if (v36)
      {
        id *v45 = [NSString stringWithFormat:@"Invalid %@, an identity in the %s keychain is required", @"identity", "system"];

        BOOL v24 = 0;
LABEL_27:

        goto LABEL_28;
      }
      uint64_t v37 = [v34 objectForKeyedSubscript:@"persistent-reference"];
      [(NERelay *)v9 setIdentityReference:v37];
    }
    id v38 = objc_alloc(MEMORY[0x1E4F1CA48]);
    int v39 = [v8 relays];
    id v40 = (void *)[v38 initWithArray:v39];

    char v41 = [v6 objectForKeyedSubscript:@"index"];
    unint64_t v42 = [v40 count];
    if (v41) {
      unint64_t v42 = [v41 integerValue];
    }
    unint64_t v43 = v42;
    if (v42 >= [v40 count]) {
      [v40 addObject:v9];
    }
    else {
      [v40 insertObject:v9 atIndex:v43];
    }
    [v8 setRelays:v40];

    BOOL v24 = 1;
    goto LABEL_27;
  }
  BOOL v24 = 0;
  *a4 = @"Missing relay configuration";
LABEL_28:

  return v24;
}

- (BOOL)unsetAppPushParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = [(NEUtilConfigurationClient *)self appPush];

  if (v6)
  {
    unint64_t v7 = [(NEUtilConfigurationClient *)self appPush];
    [v7 setMatchSSIDs:0];

    uint64_t v8 = [(NEUtilConfigurationClient *)self appPush];
    [v8 setProviderConfiguration:0];

    uint64_t v9 = [(NEUtilConfigurationClient *)self appPush];
    [v9 setPluginType:0];
  }
  else
  {
    *a4 = @"Missing app push provider configuration";
  }
  return v6 != 0;
}

- (BOOL)setAppPushParameters:(id)a3 errorStr:(id *)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [(NEUtilConfigurationClient *)self appPush];
  if (v7)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"match-ssids"];
    uint64_t v9 = v8;
    if (v8)
    {
      if (isa_nsarray(v8))
      {
        [v7 setMatchSSIDs:v9];
      }
      else if (isa_nsstring(v9))
      {
        v17[0] = v9;
        uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
        [v7 setMatchSSIDs:v11];
      }
      unint64_t v12 = [v6 objectForKeyedSubscript:@"vendor-config"];
      id v13 = v12;
      if (v12 && isa_nsdictionary(v12))
      {
        uint64_t v14 = [v6 objectForKeyedSubscript:@"vendor-config"];
        [v7 setProviderConfiguration:v14];

        SEL v15 = [v6 objectForKeyedSubscript:@"plugin-type"];
        if (v15) {
          [v7 setPluginType:v15];
        }

        BOOL v10 = 1;
      }
      else
      {
        BOOL v10 = 0;
        *a4 = @"Missing app push provider configuration dictionary";
      }
    }
    else
    {
      BOOL v10 = 0;
      *a4 = @"Missing matching SSIDs in the input parameters";
    }
  }
  else
  {
    BOOL v10 = 0;
    *a4 = @"Missing app push provider configuration";
  }

  return v10;
}

- (BOOL)unsetDNSParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = [(NEUtilConfigurationClient *)self protocolForParameters:a3];
  unint64_t v7 = [(NEUtilConfigurationClient *)self dnsSettingsBundle];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 setSettings:0];
  }
  else
  {
    if (!v6)
    {
      BOOL v9 = 0;
      *a4 = @"Missing DNS settings or VPN protocol";
      goto LABEL_6;
    }
    [v6 setDNSSettings:0];
  }
  BOOL v9 = 1;
LABEL_6:

  return v9;
}

- (BOOL)setDNSParameters:(id)a3 errorStr:(id *)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(NEUtilConfigurationClient *)self protocolForParameters:v6];
  uint64_t v8 = [(NEUtilConfigurationClient *)self dnsSettingsBundle];
  BOOL v9 = (v8 | v7) != 0;
  if (v8 | v7)
  {
    BOOL v10 = [v6 objectForKeyedSubscript:@"protocol"];
    uint64_t v11 = [v6 objectForKeyedSubscript:@"servers"];
    uint64_t v30 = v10;
    if (v11)
    {
      unint64_t v12 = v11;
      if (isa_nsstring(v11))
      {
        v33[0] = v12;
        uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];

        unint64_t v12 = (void *)v13;
      }
      if ([v10 isEqualToString:@"tls"])
      {
        uint64_t v14 = NEDNSOverTLSSettings;
      }
      else if ([v10 isEqualToString:@"https"])
      {
        uint64_t v14 = NEDNSOverHTTPSSettings;
      }
      else
      {
        uint64_t v14 = NEDNSSettings;
      }
      id v16 = (id)[[v14 alloc] initWithServers:v12];
    }
    else
    {
      if ([v10 isEqualToString:@"tls"])
      {
        SEL v15 = NEDNSOverTLSSettings;
      }
      else if ([v10 isEqualToString:@"https"])
      {
        SEL v15 = NEDNSOverHTTPSSettings;
      }
      else
      {
        SEL v15 = NEDNSSettings;
      }
      id v16 = objc_alloc_init(v15);
      unint64_t v12 = 0;
    }
    long long v17 = [v6 objectForKeyedSubscript:@"search-domains"];
    long long v18 = v17;
    if (v17)
    {
      if (isa_nsarray(v17))
      {
        [v16 setSearchDomains:v18];
      }
      else if (isa_nsstring(v18))
      {
        unint64_t v32 = v18;
        long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
        [v16 setSearchDomains:v19];
      }
    }
    int v20 = [v6 objectForKeyedSubscript:@"match-domains"];
    dispatch_data_t v21 = v20;
    if (v20)
    {
      if (isa_nsarray(v20))
      {
        [v16 setMatchDomains:v21];
      }
      else if (isa_nsstring(v21))
      {
        long long v31 = v21;
        uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
        [v16 setMatchDomains:v22];
      }
    }
    uint64_t v23 = [v6 objectForKeyedSubscript:@"domain-name"];
    if (isa_nsstring(v23)) {
      [v16 setDomainName:v23];
    }
    BOOL v24 = [v6 objectForKeyedSubscript:@"server-name"];
    if (isa_nsstring(v24))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v16 setServerName:v24];
      }
    }
    id v25 = [v6 objectForKeyedSubscript:@"url-path"];
    if (isa_nsstring(v24))
    {
      if (isa_nsstring(v25))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v27 = (void *)MEMORY[0x1E4F1CB10];
          id v29 = [NSString stringWithFormat:@"https://%@%@", v24, v25];
          id v28 = [v27 URLWithString:v29];
          [v16 setServerURL:v28];
        }
      }
    }
    if (v8)
    {
      [(id)v8 setSettings:v16];
    }
    else if (v7)
    {
      [(id)v7 setDNSSettings:v16];
    }

    BOOL v9 = (v8 | v7) != 0;
  }
  else
  {
    *a4 = @"Missing DNS settings or VPN protocol";
  }

  return v9;
}

- (BOOL)removeOnDemandRuleWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = [a3 objectForKeyedSubscript:@"index"];
  unint64_t v7 = [v6 integerValue];
  uint64_t v8 = [(NEUtilConfigurationClient *)self onDemandRules];
  unint64_t v9 = [v8 count];

  if (v7 >= v9)
  {
    *a4 = @"No rule present with given index";
  }
  else
  {
    BOOL v10 = [(NEUtilConfigurationClient *)self onDemandRules];

    if (v10)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
      unint64_t v12 = [(NEUtilConfigurationClient *)self onDemandRules];
      id v13 = (id)[v11 initWithArray:v12];
    }
    else
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    [v13 removeObjectAtIndex:v7];
    uint64_t v14 = [v13 count];
    if (v14) {
      id v15 = v13;
    }
    else {
      id v15 = 0;
    }
    [(NEUtilConfigurationClient *)self setOnDemandEnabled:v14 != 0];
    [(NEUtilConfigurationClient *)self setOnDemandRules:v15];
  }
  return v7 < v9;
}

- (BOOL)addOnDemandRuleWithParameters:(id)a3 errorStr:(id *)a4
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [v6 objectForKeyedSubscript:@"action"];
  if ([v7 isEqualToString:@"connect"])
  {
    uint64_t v8 = off_1E598D6D0;
  }
  else if ([v7 isEqualToString:@"disconnect"])
  {
    uint64_t v8 = off_1E598D6D8;
  }
  else if ([v7 isEqualToString:@"ignore"])
  {
    uint64_t v8 = off_1E598D6E8;
  }
  else
  {
    if (([v7 isEqualToString:@"evaluateconnection"] & 1) == 0)
    {
      BOOL v38 = 0;
      *a4 = @"Invalid action";
      goto LABEL_36;
    }
    uint64_t v8 = off_1E598D6E0;
  }
  id v9 = objc_alloc_init(*v8);
  BOOL v10 = [v6 objectForKeyedSubscript:@"dns-search-domain-match"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v12 = [v6 objectForKeyedSubscript:@"dns-search-domain-match"];
  id v13 = (void *)v12;
  if (isKindOfClass)
  {
    v42[0] = v12;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
    [v9 setDNSSearchDomainMatch:v14];
  }
  else
  {
    [v9 setDNSSearchDomainMatch:v12];
  }

  id v15 = [v6 objectForKeyedSubscript:@"dns-server-match"];
  objc_opt_class();
  char v16 = objc_opt_isKindOfClass();

  uint64_t v17 = [v6 objectForKeyedSubscript:@"dns-server-match"];
  long long v18 = (void *)v17;
  if (v16)
  {
    uint64_t v41 = v17;
    long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
    [v9 setDNSServerAddressMatch:v19];
  }
  else
  {
    [v9 setDNSServerAddressMatch:v17];
  }

  int v20 = [v6 objectForKeyedSubscript:@"interface-type"];
  dispatch_data_t v21 = v20;
  if (v20 && ([v20 isEqualToString:@"ethernet"] & 1) == 0)
  {
    if ([v21 isEqualToString:@"cellular"])
    {
      uint64_t v22 = 3;
LABEL_21:
      [v9 setInterfaceTypeMatch:v22];
      goto LABEL_22;
    }
    if ([v21 isEqualToString:@"wifi"])
    {
      uint64_t v22 = 2;
      goto LABEL_21;
    }
  }
LABEL_22:
  uint64_t v23 = [v6 objectForKeyedSubscript:@"ssid-match"];
  objc_opt_class();
  char v24 = objc_opt_isKindOfClass();

  uint64_t v25 = [v6 objectForKeyedSubscript:@"ssid-match"];
  id v26 = (void *)v25;
  if (v24)
  {
    uint64_t v40 = v25;
    unint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
    [v9 setSSIDMatch:v27];
  }
  else
  {
    [v9 setSSIDMatch:v25];
  }

  id v28 = [v6 objectForKeyedSubscript:@"probe-url"];
  id v29 = [v28 stringByRemovingPercentEncoding];

  if (v29)
  {
    uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v29];
    [v9 setProbeURL:v30];
  }
  long long v31 = [(NEUtilConfigurationClient *)self onDemandRules];

  if (v31)
  {
    id v32 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v33 = [(NEUtilConfigurationClient *)self onDemandRules];
    id v34 = (id)[v32 initWithArray:v33];
  }
  else
  {
    id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  uint64_t v35 = [v6 objectForKeyedSubscript:@"index"];
  unint64_t v36 = [v34 count];
  if (v35) {
    unint64_t v36 = [v35 integerValue];
  }
  unint64_t v37 = v36;
  if (v36 >= [v34 count]) {
    [v34 addObject:v9];
  }
  else {
    [v34 insertObject:v9 atIndex:v37];
  }
  BOOL v38 = 1;
  [(NEUtilConfigurationClient *)self setOnDemandEnabled:1];
  [(NEUtilConfigurationClient *)self setOnDemandRules:v34];

LABEL_36:
  return v38;
}

- (BOOL)unsetSharedSecretWithParameters:(id)a3 errorStr:(id *)a4
{
  id v5 = a3;
  id v6 = [(NEUtilConfigurationClient *)self protocolForParameters:v5];
  unint64_t v7 = [v5 objectForKeyedSubscript:@"shared-secret"];

  if (v7)
  {
    uint64_t v8 = [v6 sharedSecretKeychainItem];

    if (v8)
    {
      id v9 = [v6 sharedSecretKeychainItem];
      [v9 setIdentifier:0];
    }
  }

  return 1;
}

- (BOOL)unsetIPSecParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(NEUtilConfigurationClient *)self protocolForParameters:v6];
  if ([(NEUtilConfigurationClient *)self isAlwaysOn])
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"interface-name"];
    char v9 = isa_nsstring(v8);

    if ((v9 & 1) == 0)
    {
      BOOL v17 = 0;
      long long v18 = @"Missing interface name";
      goto LABEL_27;
    }
  }
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BOOL v17 = 0;
    long long v18 = @"Configuration VPN type is not IPSec";
LABEL_27:
    *a4 = v18;
    goto LABEL_28;
  }
  BOOL v10 = [v6 objectForKeyedSubscript:@"authentication-method"];

  if (v10) {
    [v7 setAuthenticationMethod:0];
  }
  id v11 = [v6 objectForKeyedSubscript:@"certificate-type"];

  if (v11 && [v7 type] == 5) {
    [v7 setCertificateType:1];
  }
  uint64_t v12 = [v6 objectForKeyedSubscript:@"use-internal-ip-subnet"];

  if (v12 && [v7 type] == 5) {
    [v7 setUseConfigurationAttributeInternalIPSubnet:0];
  }
  id v13 = [v6 objectForKeyedSubscript:@"disable-mobike"];

  if (v13 && [v7 type] == 5) {
    [v7 setDisableMOBIKE:0];
  }
  uint64_t v14 = [v6 objectForKeyedSubscript:@"disable-redirect"];

  if (v14 && [v7 type] == 5) {
    [v7 setDisableRedirect:0];
  }
  id v15 = [v6 objectForKeyedSubscript:@"enable-pfs"];

  if (v15 && [v7 type] == 5) {
    [v7 setEnablePFS:0];
  }
  char v16 = [v6 objectForKeyedSubscript:@"enable-revocation-check"];

  if (v16)
  {
    if ([v7 type] == 5)
    {
      [v7 setEnableRevocationCheck:0];
LABEL_31:
      [v7 setStrictRevocationCheck:0];
    }
  }
  else
  {
    int v20 = [v6 objectForKeyedSubscript:@"strict-revocation-check"];

    if (v20 && [v7 type] == 5) {
      goto LABEL_31;
    }
  }
  dispatch_data_t v21 = [v6 objectForKeyedSubscript:@"tls-minimum-version"];

  if (v21 && [v7 type] == 5) {
    [v7 setMinimumTLSVersion:0];
  }
  uint64_t v22 = [v6 objectForKeyedSubscript:@"tls-maximum-version"];

  if (v22 && [v7 type] == 5) {
    [v7 setMaximumTLSVersion:0];
  }
  if (![(NEUtilConfigurationClient *)self unsetSharedSecretWithParameters:v6 errorStr:a4])
  {
    BOOL v17 = 0;
    goto LABEL_28;
  }
  uint64_t v23 = [v6 objectForKeyedSubscript:@"local-identifier"];

  if (v23) {
    [v7 setLocalIdentifier:0];
  }
  char v24 = [v6 objectForKeyedSubscript:@"remote-identifier"];

  if (v24) {
    [v7 setRemoteIdentifier:0];
  }
  uint64_t v25 = [v6 objectForKeyedSubscript:@"use-extended-authentication"];

  if (v25) {
    [v7 setUseExtendedAuthentication:0];
  }
  id v26 = @"dead-peer-detection-rate";
  unint64_t v27 = [v6 objectForKeyedSubscript:@"dead-peer-detection-rate"];

  if (v27)
  {
    if ([v7 type] != 5) {
      goto LABEL_83;
    }
    [v7 setDeadPeerDetectionRate:0];
  }
  id v28 = [v6 objectForKeyedSubscript:@"server-CA-name"];

  if (v28 && [v7 type] == 5) {
    [v7 setServerCertificateIssuerCommonName:0];
  }
  id v29 = [v6 objectForKeyedSubscript:@"server-cert-name"];

  if (v29 && [v7 type] == 5) {
    [v7 setServerCertificateCommonName:0];
  }
  id v26 = @"encryption-algorithm";
  uint64_t v30 = [v6 objectForKeyedSubscript:@"encryption-algorithm"];

  if (v30)
  {
    if ([v7 type] != 5) {
      goto LABEL_83;
    }
    long long v31 = [v7 IKESecurityAssociationParameters];
    [v31 setEncryptionAlgorithm:4];
  }
  id v26 = @"integrity-algorithm";
  id v32 = [v6 objectForKeyedSubscript:@"integrity-algorithm"];

  if (v32)
  {
    if ([v7 type] != 5) {
      goto LABEL_83;
    }
    uint64_t v33 = [v7 IKESecurityAssociationParameters];
    [v33 setIntegrityAlgorithm:3];
  }
  id v26 = @"diffie-hellman-group";
  id v34 = [v6 objectForKeyedSubscript:@"diffie-hellman-group"];

  if (v34)
  {
    if ([v7 type] != 5) {
      goto LABEL_83;
    }
    uint64_t v35 = [v7 IKESecurityAssociationParameters];
    [v35 setDiffieHellmanGroup:14];
  }
  id v26 = @"life-time";
  unint64_t v36 = [v6 objectForKeyedSubscript:@"life-time"];

  if (v36)
  {
    if ([v7 type] != 5) {
      goto LABEL_83;
    }
    unint64_t v37 = [v7 IKESecurityAssociationParameters];
    [v37 setLifetimeMinutes:10];
  }
  id v26 = @"child-encryption-algorithm";
  BOOL v38 = [v6 objectForKeyedSubscript:@"child-encryption-algorithm"];

  if (v38)
  {
    if ([v7 type] != 5) {
      goto LABEL_83;
    }
    int v39 = [v7 childSecurityAssociationParameters];
    [v39 setEncryptionAlgorithm:4];
  }
  id v26 = @"child-integrity-algorithm";
  uint64_t v40 = [v6 objectForKeyedSubscript:@"child-integrity-algorithm"];

  if (v40)
  {
    if ([v7 type] != 5) {
      goto LABEL_83;
    }
    uint64_t v41 = [v7 childSecurityAssociationParameters];
    [v41 setIntegrityAlgorithm:3];
  }
  id v26 = @"child-diffie-hellman-group";
  unint64_t v42 = [v6 objectForKeyedSubscript:@"child-diffie-hellman-group"];

  if (v42)
  {
    if ([v7 type] != 5) {
      goto LABEL_83;
    }
    unint64_t v43 = [v7 childSecurityAssociationParameters];
    [v43 setDiffieHellmanGroup:14];
  }
  id v26 = @"child-life-time";
  uint64_t v44 = [v6 objectForKeyedSubscript:@"child-life-time"];

  if (!v44) {
    goto LABEL_78;
  }
  if ([v7 type] != 5)
  {
LABEL_83:
    [NSString stringWithFormat:@"%@ is only available for the IKEv2 protocol", v26];
    BOOL v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  long long v45 = [v7 childSecurityAssociationParameters];
  [v45 setLifetimeMinutes:10];

LABEL_78:
  id v46 = [v6 objectForKeyedSubscript:@"enable-fallback"];

  if (v46 && [v7 type] == 5) {
    [v7 setEnableFallback:0];
  }
  BOOL v17 = 1;
LABEL_28:

  return v17;
}

- (BOOL)setSharedSecretWithParameters:(id)a3 errorStr:(id *)a4
{
  id v5 = a3;
  id v6 = [(NEUtilConfigurationClient *)self protocolForParameters:v5];
  unint64_t v7 = [v5 objectForKeyedSubscript:@"shared-secret"];

  if (v7)
  {
    uint64_t v8 = [v6 sharedSecretKeychainItem];

    if (v8)
    {
      char v9 = [v5 objectForKeyedSubscript:@"shared-secret"];
      id v10 = [v6 sharedSecretKeychainItem];
      [v10 setPassword:v9];
    }
    else
    {
      id v11 = [NEKeychainItem alloc];
      char v9 = [v5 objectForKeyedSubscript:@"shared-secret"];
      if (v6)
      {
        uint64_t v13 = v6[10];
        id Property = objc_getProperty(v6, v12, 88, 1);
      }
      else
      {
        uint64_t v13 = 0;
        id Property = 0;
      }
      id v10 = Property;
      id v15 = [(NEKeychainItem *)v11 initWithPassword:v9 domain:v13 accessGroup:v10];
      [v6 setSharedSecretKeychainItem:v15];
    }
  }

  return 1;
}

- (BOOL)setIPSecParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(NEUtilConfigurationClient *)self protocolForParameters:v6];
  if ([(NEUtilConfigurationClient *)self isAlwaysOn])
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"interface-name"];
    char v9 = isa_nsstring(v8);

    if ((v9 & 1) == 0)
    {
      BOOL v13 = 0;
      uint64_t v14 = @"Missing interface name";
      goto LABEL_10;
    }
  }
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BOOL v13 = 0;
    uint64_t v14 = @"Configuration VPN type is not IPSec";
LABEL_10:
    *a4 = v14;
    goto LABEL_11;
  }
  id v10 = [v6 objectForKeyedSubscript:@"authentication-method"];

  if (v10)
  {
    id v11 = [v6 objectForKeyedSubscript:@"authentication-method"];
    if ([v11 isEqualToString:@"none"])
    {
      uint64_t v12 = 0;
    }
    else if ([v11 isEqualToString:@"certificate"])
    {
      uint64_t v12 = 1;
    }
    else
    {
      if (([v11 isEqualToString:@"shared-secret"] & 1) == 0)
      {
        *a4 = [NSString stringWithFormat:@"Invalid %@, valid values are \"none\", \"certificate\", and \"shared-secret\", @"authentication-method""];

        goto LABEL_84;
      }
      uint64_t v12 = 2;
    }
    [v7 setAuthenticationMethod:v12];
  }
  if (![(NEUtilConfigurationClient *)self setSharedSecretWithParameters:v6 errorStr:a4])
  {
LABEL_84:
    BOOL v13 = 0;
    goto LABEL_11;
  }
  char v16 = [v6 objectForKeyedSubscript:@"certificate-type"];

  if (v16 && [v7 type] == 5)
  {
    BOOL v17 = [v6 objectForKeyedSubscript:@"certificate-type"];
    if ([v17 isEqualToString:@"RSA"])
    {
      uint64_t v18 = 1;
    }
    else if ([v17 isEqualToString:@"ECDSA256"])
    {
      uint64_t v18 = 2;
    }
    else if ([v17 isEqualToString:@"ECDSA384"])
    {
      uint64_t v18 = 3;
    }
    else if ([v17 isEqualToString:@"ECDSA521"])
    {
      uint64_t v18 = 4;
    }
    else
    {
      if (([v17 isEqualToString:@"Ed25519"] & 1) == 0)
      {
        [NSString stringWithFormat:@"Invalid %@, valid values are \"RSA\", \"ECDSA256\", \"ECDSA384\", \"ECDSA521\", and \"Ed25519\", @"certificate-type"", v87, v88, v89, v90, v91, v92, v93];
        goto LABEL_83;
      }
      uint64_t v18 = 5;
    }
    [v7 setCertificateType:v18];
  }
  long long v19 = [v6 objectForKeyedSubscript:@"use-internal-ip-subnet"];

  if (v19 && [v7 type] == 5)
  {
    int v20 = [v6 objectForKeyedSubscript:@"use-internal-ip-subnet"];
    objc_msgSend(v7, "setUseConfigurationAttributeInternalIPSubnet:", objc_msgSend(v20, "BOOLValue"));
  }
  dispatch_data_t v21 = [v6 objectForKeyedSubscript:@"disable-mobike"];

  if (v21 && [v7 type] == 5)
  {
    uint64_t v22 = [v6 objectForKeyedSubscript:@"disable-mobike"];
    objc_msgSend(v7, "setDisableMOBIKE:", objc_msgSend(v22, "BOOLValue"));
  }
  uint64_t v23 = [v6 objectForKeyedSubscript:@"disable-redirect"];

  if (v23 && [v7 type] == 5)
  {
    char v24 = [v6 objectForKeyedSubscript:@"disable-redirect"];
    objc_msgSend(v7, "setDisableRedirect:", objc_msgSend(v24, "BOOLValue"));
  }
  uint64_t v25 = [v6 objectForKeyedSubscript:@"enable-pfs"];

  if (v25 && [v7 type] == 5)
  {
    id v26 = [v6 objectForKeyedSubscript:@"enable-pfs"];
    objc_msgSend(v7, "setEnablePFS:", objc_msgSend(v26, "BOOLValue"));
  }
  unint64_t v27 = [v6 objectForKeyedSubscript:@"enable-revocation-check"];

  if (v27)
  {
    if ([v7 type] == 5)
    {
      id v28 = [v6 objectForKeyedSubscript:@"enable-revocation-check"];
      objc_msgSend(v7, "setEnableRevocationCheck:", objc_msgSend(v28, "BOOLValue"));

      if (([v7 enableRevocationCheck] & 1) == 0) {
        [v7 setStrictRevocationCheck:0];
      }
    }
  }
  id v29 = [v6 objectForKeyedSubscript:@"strict-revocation-check"];

  if (v29 && [v7 type] == 5 && objc_msgSend(v7, "enableRevocationCheck"))
  {
    uint64_t v30 = [v6 objectForKeyedSubscript:@"strict-revocation-check"];
    objc_msgSend(v7, "setStrictRevocationCheck:", objc_msgSend(v30, "BOOLValue"));
  }
  long long v31 = [v6 objectForKeyedSubscript:@"tls-minimum-version"];

  if (v31 && [v7 type] == 5)
  {
    id v32 = @"tls-minimum-version";
    BOOL v17 = [v6 objectForKeyedSubscript:@"tls-minimum-version"];
    if ([v17 isEqualToString:@"1.0"])
    {
      uint64_t v33 = 1;
    }
    else if ([v17 isEqualToString:@"1.1"])
    {
      uint64_t v33 = 2;
    }
    else
    {
      if (([v17 isEqualToString:@"1.2"] & 1) == 0) {
        goto LABEL_82;
      }
      uint64_t v33 = 3;
    }
    [v7 setMinimumTLSVersion:v33];
  }
  id v34 = [v6 objectForKeyedSubscript:@"tls-maximum-version"];

  if (v34 && [v7 type] == 5)
  {
    id v32 = @"tls-maximum-version";
    BOOL v17 = [v6 objectForKeyedSubscript:@"tls-maximum-version"];
    if ([v17 isEqualToString:@"1.0"])
    {
      uint64_t v35 = 1;
LABEL_69:
      [v7 setMaximumTLSVersion:v35];

      goto LABEL_70;
    }
    if ([v17 isEqualToString:@"1.1"])
    {
      uint64_t v35 = 2;
      goto LABEL_69;
    }
    if ([v17 isEqualToString:@"1.2"])
    {
      uint64_t v35 = 3;
      goto LABEL_69;
    }
LABEL_82:
    [NSString stringWithFormat:@"Invalid %@, valid values are \"1.0\", \"1.1\", and \"1.2\"", v32, v87, v88, v89, v90, v91, v92, v93];
    goto LABEL_83;
  }
LABEL_70:
  unint64_t v36 = [v6 objectForKeyedSubscript:@"local-identifier"];

  if (v36)
  {
    unint64_t v37 = [v6 objectForKeyedSubscript:@"local-identifier"];
    [v7 setLocalIdentifier:v37];
  }
  BOOL v38 = [v6 objectForKeyedSubscript:@"remote-identifier"];

  if (v38)
  {
    int v39 = [v6 objectForKeyedSubscript:@"remote-identifier"];
    [v7 setRemoteIdentifier:v39];
  }
  uint64_t v40 = [v6 objectForKeyedSubscript:@"use-extended-authentication"];

  if (v40)
  {
    uint64_t v41 = [v6 objectForKeyedSubscript:@"use-extended-authentication"];
    objc_msgSend(v7, "setUseExtendedAuthentication:", objc_msgSend(v41, "BOOLValue"));
  }
  unint64_t v42 = @"dead-peer-detection-rate";
  unint64_t v43 = [v6 objectForKeyedSubscript:@"dead-peer-detection-rate"];

  if (v43)
  {
    if ([v7 type] != 5) {
      goto LABEL_187;
    }
    BOOL v17 = [v6 objectForKeyedSubscript:@"dead-peer-detection-rate"];
    if ([v17 isEqualToString:@"none"])
    {
      uint64_t v44 = 0;
LABEL_89:
      [v7 setDeadPeerDetectionRate:v44];

      goto LABEL_90;
    }
    if ([v17 isEqualToString:@"low"])
    {
      uint64_t v44 = 1;
      goto LABEL_89;
    }
    if ([v17 isEqualToString:@"medium"])
    {
      uint64_t v44 = 2;
      goto LABEL_89;
    }
    if ([v17 isEqualToString:@"high"])
    {
      uint64_t v44 = 3;
      goto LABEL_89;
    }
    [NSString stringWithFormat:@"Invalid %@, valid values are \"none\", \"low\", \"medium\", and \"high\", @"dead-peer-detection-rate"", v87, v88, v89, v90, v91, v92, v93];
LABEL_83:
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_84;
  }
LABEL_90:
  long long v45 = [v6 objectForKeyedSubscript:@"server-CA-name"];

  if (v45 && [v7 type] == 5)
  {
    id v46 = [v6 objectForKeyedSubscript:@"server-CA-name"];
    [v7 setServerCertificateIssuerCommonName:v46];
  }
  id v47 = [v6 objectForKeyedSubscript:@"server-cert-name"];

  if (v47 && [v7 type] == 5)
  {
    uint64_t v48 = [v6 objectForKeyedSubscript:@"server-cert-name"];
    [v7 setServerCertificateCommonName:v48];
  }
  unint64_t v42 = @"encryption-algorithm";
  uint64_t v49 = [v6 objectForKeyedSubscript:@"encryption-algorithm"];

  if (v49)
  {
    if ([v7 type] != 5) {
      goto LABEL_187;
    }
    uint64_t v50 = @"encryption-algorithm";
    BOOL v17 = [v6 objectForKeyedSubscript:@"encryption-algorithm"];
    if ([v17 isEqualToString:@"DES"])
    {
      SEL v51 = [v7 IKESecurityAssociationParameters];
      uint64_t v52 = v51;
      uint64_t v53 = 1;
    }
    else if ([v17 isEqualToString:@"3DES"])
    {
      SEL v51 = [v7 IKESecurityAssociationParameters];
      uint64_t v52 = v51;
      uint64_t v53 = 2;
    }
    else if ([v17 isEqualToString:@"AES-128"])
    {
      SEL v51 = [v7 IKESecurityAssociationParameters];
      uint64_t v52 = v51;
      uint64_t v53 = 3;
    }
    else if ([v17 isEqualToString:@"AES-256"])
    {
      SEL v51 = [v7 IKESecurityAssociationParameters];
      uint64_t v52 = v51;
      uint64_t v53 = 4;
    }
    else if ([v17 isEqualToString:@"AES-128-GCM"])
    {
      SEL v51 = [v7 IKESecurityAssociationParameters];
      uint64_t v52 = v51;
      uint64_t v53 = 5;
    }
    else if ([v17 isEqualToString:@"AES-256-GCM"])
    {
      SEL v51 = [v7 IKESecurityAssociationParameters];
      uint64_t v52 = v51;
      uint64_t v53 = 6;
    }
    else
    {
      if (![v17 isEqualToString:@"ChaCha20Poly1305"])
      {
LABEL_167:
        [NSString stringWithFormat:@"Invalid %@, valid values are \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", and \"%@\", v50, @"DES", @"3DES", @"AES-128", @"AES-256", @"AES-128-GCM", @"AES-256-GCM", @"ChaCha20Poly1305""];
        goto LABEL_83;
      }
      SEL v51 = [v7 IKESecurityAssociationParameters];
      uint64_t v52 = v51;
      uint64_t v53 = 7;
    }
    [v51 setEncryptionAlgorithm:v53];
  }
  unint64_t v42 = @"integrity-algorithm";
  uint64_t v54 = [v6 objectForKeyedSubscript:@"integrity-algorithm"];

  if (v54)
  {
    if ([v7 type] != 5) {
      goto LABEL_187;
    }
    id v55 = @"integrity-algorithm";
    BOOL v17 = [v6 objectForKeyedSubscript:@"integrity-algorithm"];
    if ([v17 isEqualToString:@"SHA1-96"])
    {
      uint64_t v56 = [v7 IKESecurityAssociationParameters];
      uint64_t v57 = v56;
      uint64_t v58 = 1;
    }
    else if ([v17 isEqualToString:@"SHA1-160"])
    {
      uint64_t v56 = [v7 IKESecurityAssociationParameters];
      uint64_t v57 = v56;
      uint64_t v58 = 2;
    }
    else if ([v17 isEqualToString:@"SHA2-256"])
    {
      uint64_t v56 = [v7 IKESecurityAssociationParameters];
      uint64_t v57 = v56;
      uint64_t v58 = 3;
    }
    else if ([v17 isEqualToString:@"SHA2-384"])
    {
      uint64_t v56 = [v7 IKESecurityAssociationParameters];
      uint64_t v57 = v56;
      uint64_t v58 = 4;
    }
    else
    {
      if (![v17 isEqualToString:@"SHA2-512"])
      {
LABEL_190:
        [NSString stringWithFormat:@"Invalid %@, valid values are \"%@\" and \"%@\", v55, @"SHA1-96", @"SHA1-160"", v89, v90, v91, v92, v93];
        goto LABEL_83;
      }
      uint64_t v56 = [v7 IKESecurityAssociationParameters];
      uint64_t v57 = v56;
      uint64_t v58 = 5;
    }
    [v56 setIntegrityAlgorithm:v58];
  }
  unint64_t v42 = @"diffie-hellman-group";
  uint64_t v59 = [v6 objectForKeyedSubscript:@"diffie-hellman-group"];

  if (v59)
  {
    if ([v7 type] != 5) {
      goto LABEL_187;
    }
    int v60 = [v6 objectForKeyedSubscript:@"diffie-hellman-group"];
    unsigned int v61 = [v60 intValue];

    if ((v61 > 0x20 || ((1 << v61) & 0x180000026) == 0) && v61 - 22 <= 0xFFFFFFF7) {
      goto LABEL_145;
    }
    uint64_t v62 = [v7 IKESecurityAssociationParameters];
    [v62 setDiffieHellmanGroup:v61];
  }
  unint64_t v42 = @"life-time";
  id v63 = [v6 objectForKeyedSubscript:@"life-time"];

  if (v63)
  {
    if ([v7 type] != 5) {
      goto LABEL_187;
    }
    long long v64 = [v6 objectForKeyedSubscript:@"life-time"];
    uint64_t v65 = [v64 intValue];

    if ((v65 - 10) > 0x596)
    {
      [NSString stringWithFormat:@"Invalid %@, valid values are in the range %d - %d minutes (24 hours)", @"life-time", 10, 1440];
LABEL_188:
      BOOL v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    long long v66 = [v7 IKESecurityAssociationParameters];
    [v66 setLifetimeMinutes:v65];
  }
  unint64_t v42 = @"child-encryption-algorithm";
  long long v67 = [v6 objectForKeyedSubscript:@"child-encryption-algorithm"];

  if (v67)
  {
    if ([v7 type] != 5) {
      goto LABEL_187;
    }
    uint64_t v50 = @"child-encryption-algorithm";
    BOOL v17 = [v6 objectForKeyedSubscript:@"child-encryption-algorithm"];
    if ([v17 isEqualToString:@"DES"])
    {
      id v68 = [v7 childSecurityAssociationParameters];
      long long v69 = v68;
      uint64_t v70 = 1;
LABEL_156:
      [v68 setEncryptionAlgorithm:v70];

      goto LABEL_157;
    }
    if ([v17 isEqualToString:@"3DES"])
    {
      id v68 = [v7 childSecurityAssociationParameters];
      long long v69 = v68;
      uint64_t v70 = 2;
      goto LABEL_156;
    }
    if ([v17 isEqualToString:@"AES-128"])
    {
      id v68 = [v7 childSecurityAssociationParameters];
      long long v69 = v68;
      uint64_t v70 = 3;
      goto LABEL_156;
    }
    if ([v17 isEqualToString:@"AES-256"])
    {
      id v68 = [v7 childSecurityAssociationParameters];
      long long v69 = v68;
      uint64_t v70 = 4;
      goto LABEL_156;
    }
    if ([v17 isEqualToString:@"AES-128-GCM"])
    {
      id v68 = [v7 childSecurityAssociationParameters];
      long long v69 = v68;
      uint64_t v70 = 5;
      goto LABEL_156;
    }
    if ([v17 isEqualToString:@"AES-256-GCM"])
    {
      id v68 = [v7 childSecurityAssociationParameters];
      long long v69 = v68;
      uint64_t v70 = 6;
      goto LABEL_156;
    }
    if ([v17 isEqualToString:@"ChaCha20Poly1305"])
    {
      id v68 = [v7 childSecurityAssociationParameters];
      long long v69 = v68;
      uint64_t v70 = 7;
      goto LABEL_156;
    }
    goto LABEL_167;
  }
LABEL_157:
  unint64_t v42 = @"child-integrity-algorithm";
  long long v71 = [v6 objectForKeyedSubscript:@"child-integrity-algorithm"];

  if (!v71) {
    goto LABEL_171;
  }
  if ([v7 type] != 5) {
    goto LABEL_187;
  }
  id v55 = @"child-integrity-algorithm";
  BOOL v17 = [v6 objectForKeyedSubscript:@"child-integrity-algorithm"];
  if (![v17 isEqualToString:@"SHA1-96"])
  {
    if ([v17 isEqualToString:@"SHA1-160"])
    {
      long long v72 = [v7 childSecurityAssociationParameters];
      long long v73 = v72;
      uint64_t v74 = 2;
      goto LABEL_170;
    }
    if ([v17 isEqualToString:@"SHA2-256"])
    {
      long long v72 = [v7 childSecurityAssociationParameters];
      long long v73 = v72;
      uint64_t v74 = 3;
      goto LABEL_170;
    }
    if ([v17 isEqualToString:@"SHA2-384"])
    {
      long long v72 = [v7 childSecurityAssociationParameters];
      long long v73 = v72;
      uint64_t v74 = 4;
      goto LABEL_170;
    }
    if ([v17 isEqualToString:@"SHA2-512"])
    {
      long long v72 = [v7 childSecurityAssociationParameters];
      long long v73 = v72;
      uint64_t v74 = 5;
      goto LABEL_170;
    }
    goto LABEL_190;
  }
  long long v72 = [v7 childSecurityAssociationParameters];
  long long v73 = v72;
  uint64_t v74 = 1;
LABEL_170:
  [v72 setIntegrityAlgorithm:v74];

LABEL_171:
  unint64_t v42 = @"child-diffie-hellman-group";
  long long v75 = [v6 objectForKeyedSubscript:@"child-diffie-hellman-group"];

  if (v75)
  {
    if ([v7 type] != 5) {
      goto LABEL_187;
    }
    long long v76 = [v6 objectForKeyedSubscript:@"child-diffie-hellman-group"];
    unsigned int v77 = [v76 intValue];

    if ((v77 > 0x20 || ((1 << v77) & 0x180000026) == 0) && v77 - 22 <= 0xFFFFFFF7)
    {
LABEL_145:
      [NSString stringWithFormat:@"Invalid %@, valid values are 1, 2, 5, 14-21, 31, 32", v42, v87, v88];
      goto LABEL_188;
    }
    long long v78 = [v7 childSecurityAssociationParameters];
    [v78 setDiffieHellmanGroup:v77];
  }
  unint64_t v42 = @"child-life-time";
  long long v79 = [v6 objectForKeyedSubscript:@"child-life-time"];

  if (v79)
  {
    if ([v7 type] == 5)
    {
      long long v80 = [v6 objectForKeyedSubscript:@"child-life-time"];
      uint64_t v81 = [v80 intValue];

      if ((v81 - 10) > 0x596)
      {
        [NSString stringWithFormat:@"Invalid %@, valid values are in the range 10 - 1440 minutes (24 hours)", @"child-life-time", v87, v88];
        goto LABEL_188;
      }
      v82 = [v7 childSecurityAssociationParameters];
      [v82 setLifetimeMinutes:v81];

      goto LABEL_180;
    }
LABEL_187:
    [NSString stringWithFormat:@"%@ is only available for the IKEv2 protocol", v42, v87, v88];
    goto LABEL_188;
  }
LABEL_180:
  uint64_t v83 = [v6 objectForKeyedSubscript:@"enable-fallback"];

  if (v83 && [v7 type] == 5)
  {
    uint64_t v84 = [v6 objectForKeyedSubscript:@"enable-fallback"];
    objc_msgSend(v7, "setEnableFallback:", objc_msgSend(v84, "BOOLValue"));
  }
  id v85 = [v6 objectForKeyedSubscript:@"mtu"];

  if (v85 && [v7 type] == 5)
  {
    uint64_t v86 = [v6 objectForKeyedSubscript:@"mtu"];
    objc_msgSend(v7, "setMtu:", (int)objc_msgSend(v86, "intValue"));
  }
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (BOOL)unsetPasswordWithParameters:(id)a3 errorStr:(id *)a4
{
  id v5 = a3;
  id v6 = [(NEUtilConfigurationClient *)self protocolForParameters:v5];
  unint64_t v7 = [v5 objectForKeyedSubscript:@"password"];

  if (v7)
  {
    uint64_t v8 = [v6 passwordKeychainItem];

    if (v8)
    {
      char v9 = [v6 passwordKeychainItem];
      [v9 setIdentifier:0];
    }
  }

  return 1;
}

- (BOOL)unsetCommonParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(NEUtilConfigurationClient *)self protocolForParameters:v6];
  if ([(NEUtilConfigurationClient *)self isAlwaysOn])
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"enabled"];
    char v9 = isa_nsstring(v8);

    if ((v9 & 1) == 0)
    {
      BOOL v26 = 0;
      unint64_t v27 = @"Missing interface name";
      goto LABEL_46;
    }
  }
  if (!v7)
  {
    BOOL v26 = 0;
    unint64_t v27 = @"Missing protocol";
    goto LABEL_46;
  }
  id v10 = [v6 objectForKeyedSubscript:@"enabled"];

  if (v10) {
    [(NEUtilConfigurationClient *)self setEnabled:0];
  }
  id v11 = [v6 objectForKeyedSubscript:@"server-address"];

  if (v11) {
    [v7 setServerAddress:0];
  }
  uint64_t v12 = [v6 objectForKeyedSubscript:@"username"];

  if (v12) {
    [v7 setUsername:0];
  }
  if (![(NEUtilConfigurationClient *)self unsetPasswordWithParameters:v6 errorStr:a4])
  {
    BOOL v26 = 0;
    goto LABEL_47;
  }
  BOOL v13 = [v6 objectForKeyedSubscript:@"disconnect-on-idle-timeout"];

  if (v13) {
    [v7 setDisconnectOnIdleTimeout:0];
  }
  uint64_t v14 = [v6 objectForKeyedSubscript:@"disconnect-on-sleep"];

  if (v14) {
    [v7 setDisconnectOnSleep:0];
  }
  id v15 = [v6 objectForKeyedSubscript:@"identity"];

  if (v15) {
    [v7 setIdentityReferenceInternal:0];
  }
  char v16 = [v6 objectForKeyedSubscript:@"provider-bundle-identifier"];

  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v26 = 0;
      unint64_t v27 = @"\"provider-bundle-identifier\" can only be specified for provider-based configurations";
      goto LABEL_46;
    }
    [v7 setProviderBundleIdentifier:0];
  }
  BOOL v17 = [v6 objectForKeyedSubscript:@"designated-requirement"];

  if (v17)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      [v7 setDesignatedRequirement:0];
      goto LABEL_24;
    }
    BOOL v26 = 0;
    unint64_t v27 = @"\"designated-requirement\" can only be specified for provider-based configurations";
LABEL_46:
    *a4 = v27;
    goto LABEL_47;
  }
LABEL_24:
  uint64_t v18 = [v6 objectForKeyedSubscript:@"extensible-sso-provider"];

  if (v18) {
    [v7 setExtensibleSSOProvider:0];
  }
  long long v19 = [v6 objectForKeyedSubscript:@"include-all-networks"];

  if (v19) {
    [v7 setIncludeAllNetworks:0];
  }
  int v20 = [v6 objectForKeyedSubscript:@"exclude-local-networks"];

  if (v20) {
    [v7 setExcludeLocalNetworks:0];
  }
  dispatch_data_t v21 = [v6 objectForKeyedSubscript:@"exclude-cellular-services"];

  if (v21) {
    [v7 setExcludeCellularServices:0];
  }
  uint64_t v22 = [v6 objectForKeyedSubscript:@"exclude-apns"];

  if (v22) {
    [v7 setExcludeAPNs:0];
  }
  uint64_t v23 = [v6 objectForKeyedSubscript:@"exclude-device-communication"];

  if (v23) {
    [v7 setExcludeDeviceCommunication:0];
  }
  char v24 = [v6 objectForKeyedSubscript:@"enforce-routes"];

  if (v24) {
    [v7 setEnforceRoutes:0];
  }
  uint64_t v25 = [v6 objectForKeyedSubscript:@"cellular-slice-UUID"];

  if (v25) {
    [v7 setSliceUUID:0];
  }
  BOOL v26 = 1;
LABEL_47:

  return v26;
}

- (BOOL)setProviderTypeWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(NEUtilConfigurationClient *)self protocolForParameters:v6];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"provider-type"];

  if (!v8)
  {
LABEL_16:
    BOOL v20 = 1;
    goto LABEL_17;
  }
  if (self) {
    id Property = objc_getProperty(self, v9, 56, 1);
  }
  else {
    id Property = 0;
  }
  uint64_t v11 = [Property appVPN];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    uint64_t v13 = [v7 type];

    if (v13 == 4)
    {
      uint64_t v14 = [v6 objectForKeyedSubscript:@"provider-type"];
      if ([v14 isEqualToString:@"app-proxy"])
      {
        if (self) {
          id v16 = objc_getProperty(self, v15, 56, 1);
        }
        else {
          id v16 = 0;
        }
        BOOL v17 = [v16 appVPN];
        uint64_t v18 = v17;
        uint64_t v19 = 2;
      }
      else
      {
        if (![v14 isEqualToString:@"packet-tunnel"])
        {
          *a4 = [NSString stringWithFormat:@"Invalid %@, must be either \"app-proxy\" or \"packet-tunnel\", @"provider-type""];

          BOOL v20 = 0;
          goto LABEL_17;
        }
        if (self) {
          id v22 = objc_getProperty(self, v21, 56, 1);
        }
        else {
          id v22 = 0;
        }
        BOOL v17 = [v22 appVPN];
        uint64_t v18 = v17;
        uint64_t v19 = 1;
      }
      [v17 setTunnelType:v19];

      goto LABEL_16;
    }
  }
  [NSString stringWithFormat:@"Provider type can only be set for plugin-based per-app VPN configurations"];
  BOOL v20 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v20;
}

- (BOOL)setPasswordWithParameters:(id)a3 errorStr:(id *)a4
{
  id v5 = a3;
  id v6 = [(NEUtilConfigurationClient *)self protocolForParameters:v5];
  unint64_t v7 = [v5 objectForKeyedSubscript:@"password"];

  if (v7)
  {
    uint64_t v8 = [v6 passwordKeychainItem];

    if (v8)
    {
      char v9 = [v5 objectForKeyedSubscript:@"password"];
      id v10 = [v6 passwordKeychainItem];
      [v10 setPassword:v9];
    }
    else
    {
      uint64_t v11 = [NEKeychainItem alloc];
      char v9 = [v5 objectForKeyedSubscript:@"password"];
      if (v6)
      {
        uint64_t v13 = v6[10];
        id Property = objc_getProperty(v6, v12, 88, 1);
      }
      else
      {
        uint64_t v13 = 0;
        id Property = 0;
      }
      id v10 = Property;
      id v15 = [(NEKeychainItem *)v11 initWithPassword:v9 domain:v13 accessGroup:v10];
      [v6 setPasswordKeychainItem:v15];
    }
  }

  return 1;
}

- (BOOL)setCommonParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(NEUtilConfigurationClient *)self protocolForParameters:v6];
  uint64_t v8 = [(NEUtilConfigurationClient *)self filterConfiguration];
  if ([(NEUtilConfigurationClient *)self isAlwaysOn])
  {
    char v9 = [v6 objectForKeyedSubscript:@"interface-name"];
    char v10 = isa_nsstring(v9);

    if ((v10 & 1) == 0)
    {
      BOOL v17 = 0;
      uint64_t v18 = @"Missing interface name";
      goto LABEL_9;
    }
  }
  uint64_t v11 = [v6 objectForKeyedSubscript:@"enabled"];

  if (v11)
  {
    uint64_t v12 = [v6 objectForKeyedSubscript:@"enabled"];
    -[NEUtilConfigurationClient setEnabled:](self, "setEnabled:", [v12 BOOLValue]);
  }
  uint64_t v13 = [v6 objectForKeyedSubscript:@"server-address"];

  if (v13)
  {
    if (v7)
    {
      uint64_t v14 = [v6 objectForKeyedSubscript:@"server-address"];
      id v15 = [v14 stringByRemovingPercentEncoding];
      id v16 = v7;
    }
    else
    {
      if (!v8) {
        goto LABEL_13;
      }
      uint64_t v14 = [v6 objectForKeyedSubscript:@"server-address"];
      id v15 = [v14 stringByRemovingPercentEncoding];
      id v16 = v8;
    }
    [v16 setServerAddress:v15];
  }
LABEL_13:
  uint64_t v19 = [v6 objectForKeyedSubscript:@"username"];

  if (v19)
  {
    if (v7)
    {
      BOOL v20 = [v6 objectForKeyedSubscript:@"username"];
      [v7 setUsername:v20];

      goto LABEL_17;
    }
    if (v8)
    {
      char v24 = [v6 objectForKeyedSubscript:@"username"];
      [v8 setUsername:v24];
LABEL_22:
    }
LABEL_23:
    BOOL v17 = 1;
    goto LABEL_77;
  }
  if (!v7) {
    goto LABEL_23;
  }
LABEL_17:
  if (![(NEUtilConfigurationClient *)self setPasswordWithParameters:v6 errorStr:a4])
  {
LABEL_76:
    BOOL v17 = 0;
    goto LABEL_77;
  }
  dispatch_data_t v21 = [v6 objectForKeyedSubscript:@"on-demand-enabled"];

  if (v21)
  {
    id v22 = [v6 objectForKeyedSubscript:@"on-demand-enabled"];
    uint64_t v23 = [v22 BOOLValue];
  }
  else
  {
    uint64_t v23 = 0;
  }
  uint64_t v25 = [v6 objectForKeyedSubscript:@"disconnect-on-demand-enabled"];

  if (!v25)
  {
    uint64_t v27 = 0;
    if (!v21) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  BOOL v26 = [v6 objectForKeyedSubscript:@"disconnect-on-demand-enabled"];
  uint64_t v27 = [v26 BOOLValue];

  if (v21) {
LABEL_27:
  }
    [(NEUtilConfigurationClient *)self setOnDemandEnabled:v23];
LABEL_28:
  if (v25) {
    [(NEUtilConfigurationClient *)self setDisconnectOnDemandEnabled:v27];
  }
  id v28 = [v6 objectForKeyedSubscript:@"on-demand-user-override-disabled"];

  if (v28)
  {
    id v29 = [v6 objectForKeyedSubscript:@"on-demand-user-override-disabled"];
    -[NEUtilConfigurationClient setOnDemandUserOverrideDisabled:](self, "setOnDemandUserOverrideDisabled:", [v29 BOOLValue]);
  }
  uint64_t v30 = [v6 objectForKeyedSubscript:@"disconnect-on-idle-timeout"];

  if (v30)
  {
    long long v31 = [v6 objectForKeyedSubscript:@"disconnect-on-idle-timeout"];
    objc_msgSend(v7, "setDisconnectOnIdleTimeout:", objc_msgSend(v31, "intValue"));
  }
  id v32 = [v6 objectForKeyedSubscript:@"disconnect-on-sleep"];

  if (v32)
  {
    uint64_t v33 = [v6 objectForKeyedSubscript:@"disconnect-on-sleep"];
    objc_msgSend(v7, "setDisconnectOnSleep:", objc_msgSend(v33, "BOOLValue"));
  }
  id v34 = [v6 objectForKeyedSubscript:@"identity"];

  if (v34)
  {
    uint64_t v35 = [v6 objectForKeyedSubscript:@"identity"];
    unint64_t v36 = [v35 integerValue];

    if (!self
      || (id v38 = objc_getProperty(self, v37, 48, 1)) == 0
      || (uint64_t v40 = v38, v41 = objc_msgSend(objc_getProperty(self, v39, 48, 1), "count"), v40, v36 >= v41))
    {
      [NSString stringWithFormat:@"Invalid %@ index, use the \"list-identities\" command to obtain a list of available identities and their indicies", @"identity"];
      BOOL v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_77;
    }
    unint64_t v43 = objc_msgSend(objc_getProperty(self, v42, 48, 1), "objectAtIndexedSubscript:", v36);
    uint64_t v44 = [v43 objectForKeyedSubscript:@"domain"];
    uint64_t v45 = [v44 integerValue];

    if (v45)
    {
      *a4 = [NSString stringWithFormat:@"Invalid %@, an identity in the %s keychain is required", @"identity", "system"];

      goto LABEL_76;
    }
    id v46 = [v43 objectForKeyedSubscript:@"persistent-reference"];
    [v7 setIdentityReferenceInternal:v46];
  }
  if (![(NEUtilConfigurationClient *)self setProviderTypeWithParameters:v6 errorStr:a4])goto LABEL_76; {
  id v47 = [v6 objectForKeyedSubscript:@"provider-bundle-identifier"];
  }

  if (v47)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v17 = 0;
      uint64_t v18 = @"\"provider-bundle-identifier\" can only be specified for provider-based configurations";
      goto LABEL_9;
    }
    uint64_t v48 = [v6 objectForKeyedSubscript:@"provider-bundle-identifier"];
    [v7 setProviderBundleIdentifier:v48];
  }
  uint64_t v49 = [v6 objectForKeyedSubscript:@"designated-requirement"];

  if (!v49)
  {
LABEL_54:
    uint64_t v52 = [v6 objectForKeyedSubscript:@"extensible-sso-provider"];

    if (v52)
    {
      uint64_t v53 = [v6 objectForKeyedSubscript:@"extensible-sso-provider"];
      uint64_t v54 = [v53 stringByRemovingPercentEncoding];
      [v7 setExtensibleSSOProvider:v54];
    }
    id v55 = [v6 objectForKeyedSubscript:@"access-group"];

    if (v55)
    {
      uint64_t v56 = [v7 passwordKeychainItem];

      if (v56)
      {
        uint64_t v58 = [v6 objectForKeyedSubscript:@"access-group"];
        uint64_t v59 = [v7 passwordKeychainItem];
        [v59 setAccessGroup:v58];
      }
      id v60 = objc_getProperty(v7, v57, 96, 1);

      if (v60)
      {
        unsigned int v61 = [v6 objectForKeyedSubscript:@"access-group"];
        id v63 = objc_getProperty(v7, v62, 96, 1);
        [v63 setAccessGroup:v61];
      }
    }
    long long v64 = [v6 objectForKeyedSubscript:@"include-all-networks"];

    if (v64)
    {
      uint64_t v65 = [v6 objectForKeyedSubscript:@"include-all-networks"];
      objc_msgSend(v7, "setIncludeAllNetworks:", objc_msgSend(v65, "BOOLValue"));
    }
    long long v66 = [v6 objectForKeyedSubscript:@"exclude-local-networks"];

    if (v66)
    {
      long long v67 = [v6 objectForKeyedSubscript:@"exclude-local-networks"];
      objc_msgSend(v7, "setExcludeLocalNetworks:", objc_msgSend(v67, "BOOLValue"));
    }
    id v68 = [v6 objectForKeyedSubscript:@"exclude-cellular-services"];

    if (v68)
    {
      long long v69 = [v6 objectForKeyedSubscript:@"exclude-cellular-services"];
      objc_msgSend(v7, "setExcludeCellularServices:", objc_msgSend(v69, "BOOLValue"));
    }
    uint64_t v70 = [v6 objectForKeyedSubscript:@"exclude-apns"];

    if (v70)
    {
      long long v71 = [v6 objectForKeyedSubscript:@"exclude-apns"];
      objc_msgSend(v7, "setExcludeAPNs:", objc_msgSend(v71, "BOOLValue"));
    }
    long long v72 = [v6 objectForKeyedSubscript:@"exclude-device-communication"];

    if (v72)
    {
      long long v73 = [v6 objectForKeyedSubscript:@"exclude-device-communication"];
      objc_msgSend(v7, "setExcludeDeviceCommunication:", objc_msgSend(v73, "BOOLValue"));
    }
    uint64_t v74 = [v6 objectForKeyedSubscript:@"enforce-routes"];

    if (v74)
    {
      long long v75 = [v6 objectForKeyedSubscript:@"enforce-routes"];
      objc_msgSend(v7, "setEnforceRoutes:", objc_msgSend(v75, "BOOLValue"));
    }
    long long v76 = [v6 objectForKeyedSubscript:@"cellular-slice-UUID"];

    if (!v76) {
      goto LABEL_23;
    }
    unsigned int v77 = [v6 objectForKeyedSubscript:@"cellular-slice-UUID"];
    char v24 = [v77 componentsSeparatedByString:@"/"];

    if ((unint64_t)[v24 count] >= 2)
    {
      id v78 = [NSString alloc];
      long long v79 = [v24 objectAtIndexedSubscript:0];
      long long v80 = [v24 objectAtIndexedSubscript:1];
      uint64_t v81 = (void *)[v78 initWithFormat:@"%@:%@", v79, v80];
      [v7 setSliceUUID:v81];
    }
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v50 = [v6 objectForKeyedSubscript:@"designated-requirement"];
    SEL v51 = [v50 stringByRemovingPercentEncoding];
    [v7 setDesignatedRequirement:v51];

    goto LABEL_54;
  }
  BOOL v17 = 0;
  uint64_t v18 = @"\"designated-requirement\" can only be specified for provider-based configurations";
LABEL_9:
  *a4 = v18;
LABEL_77:

  return v17;
}

- (BOOL)unsetDNSProxyWithParameters:(id)a3 errorStr:(id *)a4
{
  id v5 = a3;
  id v6 = [(NEUtilConfigurationClient *)self dnsProxyConfiguration];
  unint64_t v7 = [v5 objectForKeyedSubscript:@"vendor-config"];
  int v8 = isa_nsdictionary(v7);

  if (v8) {
    [v6 setProviderConfiguration:0];
  }
  char v9 = [v5 objectForKeyedSubscript:@"designated-requirement"];

  if (v9) {
    [v6 setDesignatedRequirement:0];
  }

  return 1;
}

- (BOOL)setDNSProxyWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(NEUtilConfigurationClient *)self dnsProxyConfiguration];
  if (v7)
  {
    int v8 = [v6 objectForKeyedSubscript:@"vendor-config"];
    int v9 = isa_nsdictionary(v8);

    if (v9)
    {
      char v10 = [v6 objectForKeyedSubscript:@"vendor-config"];
      [v7 setProviderConfiguration:v10];
    }
    uint64_t v11 = [v6 objectForKeyedSubscript:@"designated-requirement"];

    if (v11)
    {
      uint64_t v12 = [v6 objectForKeyedSubscript:@"designated-requirement"];
      uint64_t v13 = [v12 stringByRemovingPercentEncoding];
      [v7 setDesignatedRequirement:v13];
    }
  }
  else
  {
    *a4 = @"DNS Proxy plugin type has not been set yet";
  }

  return v7 != 0;
}

- (BOOL)unsetFilterPluginParameters:(id)a3 errorStr:(id *)a4
{
  id v5 = a3;
  id v6 = [(NEUtilConfigurationClient *)self filterConfiguration];
  unint64_t v7 = [v5 objectForKeyedSubscript:@"organization"];

  if (v7) {
    [v6 setOrganization:0];
  }
  int v8 = [v5 objectForKeyedSubscript:@"vendor-config"];

  if (v8) {
    [v6 setVendorConfiguration:0];
  }
  int v9 = [v5 objectForKeyedSubscript:@"designated-requirement"];

  if (v9) {
    [v6 setDataProviderDesignatedRequirement:0];
  }

  return 1;
}

- (BOOL)setFilterPluginWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(NEUtilConfigurationClient *)self filterConfiguration];
  if (v7)
  {
    int v8 = [v6 objectForKeyedSubscript:@"organization"];

    if (v8)
    {
      int v9 = [v6 objectForKeyedSubscript:@"organization"];
      [v7 setOrganization:v9];
    }
    char v10 = [v6 objectForKeyedSubscript:@"filter-browsers"];

    if (v10)
    {
      uint64_t v11 = [v6 objectForKeyedSubscript:@"filter-browsers"];
      objc_msgSend(v7, "setFilterBrowsers:", objc_msgSend(v11, "BOOLValue"));
    }
    uint64_t v12 = [v6 objectForKeyedSubscript:@"filter-sockets"];

    if (v12)
    {
      uint64_t v13 = [v6 objectForKeyedSubscript:@"filter-sockets"];
      objc_msgSend(v7, "setFilterSockets:", objc_msgSend(v13, "BOOLValue"));
    }
    uint64_t v14 = [v6 objectForKeyedSubscript:@"filter-packets"];

    if (v14)
    {
      id v15 = [v6 objectForKeyedSubscript:@"filter-packets"];
      objc_msgSend(v7, "setFilterPackets:", objc_msgSend(v15, "BOOLValue"));
    }
    id v16 = [v6 objectForKeyedSubscript:@"disable-default-drop"];

    if (v16)
    {
      BOOL v17 = [v6 objectForKeyedSubscript:@"disable-default-drop"];
      objc_msgSend(v7, "setDisableDefaultDrop:", objc_msgSend(v17, "BOOLValue"));
    }
    uint64_t v18 = [v6 objectForKeyedSubscript:@"preserve-existing-connections"];

    if (v18)
    {
      uint64_t v19 = [v6 objectForKeyedSubscript:@"preserve-existing-connections"];
      objc_msgSend(v7, "setPreserveExistingConnections:", objc_msgSend(v19, "BOOLValue"));
    }
    BOOL v20 = [v6 objectForKeyedSubscript:@"vendor-config"];
    int v21 = isa_nsdictionary(v20);

    if (v21)
    {
      id v22 = [v6 objectForKeyedSubscript:@"vendor-config"];
      [v7 setVendorConfiguration:v22];
    }
    uint64_t v23 = [v6 objectForKeyedSubscript:@"provider-bundle-identifier"];

    if (v23)
    {
      char v24 = [v6 objectForKeyedSubscript:@"provider-bundle-identifier"];
      [v7 setFilterDataProviderBundleIdentifier:v24];
    }
    uint64_t v25 = [v6 objectForKeyedSubscript:@"designated-requirement"];

    if (v25)
    {
      BOOL v26 = [v6 objectForKeyedSubscript:@"designated-requirement"];
      uint64_t v27 = [v26 stringByRemovingPercentEncoding];
      [v7 setDataProviderDesignatedRequirement:v27];
    }
    id v28 = [v6 objectForKeyedSubscript:@"packet-provider-bundle-identifier"];

    if (v28)
    {
      id v29 = [v6 objectForKeyedSubscript:@"packet-provider-bundle-identifier"];
      [v7 setFilterPacketProviderBundleIdentifier:v29];
    }
    uint64_t v30 = [v6 objectForKeyedSubscript:@"packet-provider-designated-requirement"];

    if (v30)
    {
      long long v31 = [v6 objectForKeyedSubscript:@"packet-provider-designated-requirement"];
      id v32 = [v31 stringByRemovingPercentEncoding];
      [v7 setPacketProviderDesignatedRequirement:v32];
    }
  }
  else
  {
    *a4 = @"Filter plugin type has not been set yet";
  }

  return v7 != 0;
}

- (BOOL)setProtocolWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [v6 objectForKeyedSubscript:@"type"];
  if ([v7 isEqualToString:@"ikev1"])
  {
    int v8 = NEVPNProtocolIPSec;
    goto LABEL_8;
  }
  if (![v7 isEqualToString:@"ikev2"])
  {
    if ([v7 isEqualToString:@"l2tp"])
    {
      int v8 = NEVPNProtocolL2TP;
      goto LABEL_8;
    }
    if (![v7 isEqualToString:@"aovpn"])
    {
      if ([v7 isEqualToString:@"plugin"])
      {
        uint64_t v50 = [v6 objectForKeyedSubscript:@"plugin-type"];
        if (v50)
        {
          SEL v51 = (void *)v50;
          char v10 = [[NETunnelProviderProtocol alloc] initWithPluginType:v50];

          if (self) {
            goto LABEL_9;
          }
          goto LABEL_57;
        }
        BOOL v34 = 0;
        long long v69 = @"Missing plugin type";
      }
      else
      {
        BOOL v34 = 0;
        long long v69 = @"Invalid protocol type";
      }
      *a4 = v69;
      goto LABEL_53;
    }
  }
  int v8 = NEVPNProtocolIKEv2;
LABEL_8:
  char v10 = (NETunnelProviderProtocol *)objc_alloc_init(v8);
  if (self)
  {
LABEL_9:
    id Property = objc_getProperty(self, v9, 56, 1);
    goto LABEL_10;
  }
LABEL_57:
  id Property = 0;
LABEL_10:
  uint64_t v12 = [Property alwaysOnVPN];

  if (!v12)
  {
    if (self) {
      id v25 = objc_getProperty(self, v13, 56, 1);
    }
    else {
      id v25 = 0;
    }
    BOOL v26 = [v25 appVPN];

    if (v26)
    {
      if ([(NEVPNProtocol *)v10 type] != 4
        && [(NEVPNProtocol *)v10 type] != 1
        && [(NEVPNProtocol *)v10 type] != 5)
      {
        uint64_t v33 = @"Only \"plugin\" and IKE protocols are supported with App VPN";
        goto LABEL_29;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (self) {
          id v29 = objc_getProperty(self, v28, 56, 1);
        }
        else {
          id v29 = 0;
        }
        uint64_t v30 = [v29 appVPN];
        long long v31 = v30;
        uint64_t v32 = 2;
      }
      else
      {
        if (self) {
          id v43 = objc_getProperty(self, v28, 56, 1);
        }
        else {
          id v43 = 0;
        }
        uint64_t v30 = [v43 appVPN];
        long long v31 = v30;
        uint64_t v32 = 1;
      }
      [v30 setTunnelType:v32];

      if (self) {
        id v45 = objc_getProperty(self, v44, 56, 1);
      }
      else {
        id v45 = 0;
      }
      id v46 = [v45 appVPN];
    }
    else
    {
      if (self) {
        id v38 = objc_getProperty(self, v27, 56, 1);
      }
      else {
        id v38 = 0;
      }
      int v39 = [v38 VPN];

      if (!v39)
      {
        if (self) {
          id v52 = objc_getProperty(self, v40, 56, 1);
        }
        else {
          id v52 = 0;
        }
        uint64_t v53 = [v52 contentFilter];
        if (v53
          && (id v55 = (void *)v53, objc_opt_class(), v56 = objc_opt_isKindOfClass(), v55, (v56 & 1) != 0))
        {
          uint64_t v57 = objc_alloc_init(NEFilterProviderConfiguration);
          uint64_t v58 = [(NETunnelProviderProtocol *)v10 pluginType];
          [(NEFilterProviderConfiguration *)v57 setPluginType:v58];

          if (self) {
            id v60 = objc_getProperty(self, v59, 56, 1);
          }
          else {
            id v60 = 0;
          }
          unsigned int v61 = [v60 contentFilter];
          [v61 setProvider:v57];
        }
        else
        {
          if (self) {
            id v62 = objc_getProperty(self, v54, 56, 1);
          }
          else {
            id v62 = 0;
          }
          uint64_t v63 = [v62 dnsProxy];
          if (!v63
            || (long long v64 = (void *)v63,
                objc_opt_class(),
                char isKindOfClass = objc_opt_isKindOfClass(),
                v64,
                (isKindOfClass & 1) == 0))
          {
            uint64_t v33 = @"Configuration does not have a VPN type";
            goto LABEL_29;
          }
          uint64_t v57 = objc_alloc_init(NEDNSProxyProviderProtocol);
          long long v66 = [(NETunnelProviderProtocol *)v10 pluginType];
          [(NEFilterProviderConfiguration *)v57 setPluginType:v66];

          if (self) {
            id v68 = objc_getProperty(self, v67, 56, 1);
          }
          else {
            id v68 = 0;
          }
          unsigned int v61 = [v68 dnsProxy];
          [v61 setProtocol:v57];
        }

LABEL_52:
        BOOL v34 = 1;
        goto LABEL_53;
      }
      if (self) {
        id v41 = objc_getProperty(self, v40, 56, 1);
      }
      else {
        id v41 = 0;
      }
      if ([v41 grade] == 2 && -[NEVPNProtocol type](v10, "type") == 2)
      {
        uint64_t v33 = @"PPP protocols are not supported with Personal VPN";
        goto LABEL_29;
      }
      if (self) {
        id v47 = objc_getProperty(self, v42, 56, 1);
      }
      else {
        id v47 = 0;
      }
      id v46 = [v47 VPN];
    }
    uint64_t v48 = v46;
    [v46 setProtocol:v10];

    goto LABEL_52;
  }
  uint64_t v14 = [v6 objectForKeyedSubscript:@"interface-name"];
  if (v14)
  {
    id v16 = (void *)v14;
    if (self) {
      id v17 = objc_getProperty(self, v15, 56, 1);
    }
    else {
      id v17 = 0;
    }
    uint64_t v18 = [v17 alwaysOnVPN];
    uint64_t v19 = [v18 interfaceProtocolMapping];

    if (v19)
    {
      if (self) {
        id v21 = objc_getProperty(self, v20, 56, 1);
      }
      else {
        id v21 = 0;
      }
      id v22 = [v21 alwaysOnVPN];
      uint64_t v23 = [v22 interfaceProtocolMapping];
      char v24 = (void *)[v23 mutableCopy];
    }
    else
    {
      char v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    }
    [v24 setObject:v10 forKeyedSubscript:v16];
    if (self) {
      id v36 = objc_getProperty(self, v35, 56, 1);
    }
    else {
      id v36 = 0;
    }
    unint64_t v37 = [v36 alwaysOnVPN];
    [v37 setInterfaceProtocolMapping:v24];

    goto LABEL_52;
  }
  uint64_t v33 = @"Missing interface name";
LABEL_29:
  *a4 = v33;

  BOOL v34 = 0;
LABEL_53:

  return v34;
}

- (BOOL)createConfigurationWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [v6 objectForKeyedSubscript:@"name"];
  int v8 = [v6 objectForKeyedSubscript:@"type"];
  int v9 = [v6 objectForKeyedSubscript:@"grade"];

  if (v9 && ([v9 isEqualToString:@"enterprise"] & 1) == 0)
  {
    if ([v9 isEqualToString:@"personal"])
    {
      uint64_t v10 = 2;
    }
    else
    {
      if (([v9 isEqualToString:@"system"] & 1) == 0)
      {
        [NSString stringWithFormat:@"Invalid configuration grade: %@", v9];
        BOOL v13 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      }
      uint64_t v10 = 3;
    }
  }
  else
  {
    uint64_t v10 = 1;
  }
  uint64_t v11 = [[NEConfiguration alloc] initWithName:v7 grade:v10];
  if ([v8 isEqualToString:@"vpn"])
  {
    uint64_t v12 = objc_alloc_init(NEVPN);
    [(NEConfiguration *)v11 setVPN:v12];
  }
  else if ([v8 isEqualToString:@"aovpn"])
  {
    uint64_t v12 = objc_alloc_init(NEAOVPN);
    [(NEConfiguration *)v11 setAlwaysOnVPN:v12];
  }
  else if ([v8 isEqualToString:@"appvpn"])
  {
    uint64_t v12 = objc_alloc_init(NEVPNApp);
    [(NEConfiguration *)v11 setAppVPN:v12];
  }
  else if ([v8 isEqualToString:@"contentfilter"])
  {
    uint64_t v12 = objc_alloc_init(NEContentFilter);
    [(NEConfiguration *)v11 setContentFilter:v12];
  }
  else if ([v8 isEqualToString:@"pathcontroller"])
  {
    uint64_t v12 = objc_alloc_init(NEPathController);
    [(NEConfiguration *)v11 setPathController:v12];
  }
  else if ([v8 isEqualToString:@"dnsproxy"])
  {
    uint64_t v12 = objc_alloc_init(NEDNSProxy);
    [(NEConfiguration *)v11 setDnsProxy:v12];
  }
  else if ([v8 isEqualToString:@"dnssettings"])
  {
    uint64_t v12 = objc_alloc_init(NEDNSSettingsBundle);
    [(NEConfiguration *)v11 setDnsSettings:v12];
  }
  else if ([v8 isEqualToString:@"appPush"])
  {
    uint64_t v12 = objc_alloc_init(NEAppPush);
    [(NEConfiguration *)v11 setAppPush:v12];
  }
  else
  {
    if (![v8 isEqualToString:@"relay"])
    {
      *a4 = [NSString stringWithFormat:@"Invalid configuration type: %@", v8];

      BOOL v13 = 0;
      goto LABEL_32;
    }
    uint64_t v12 = objc_alloc_init(NERelayConfiguration);
    [(NEConfiguration *)v11 setRelay:v12];
  }

  if (self)
  {
    if (!objc_getProperty(self, v14, 32, 1))
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_setProperty_atomic(self, v17, v16, 32);
    }
    id Property = objc_getProperty(self, v15, 32, 1);
  }
  else
  {

    id Property = 0;
  }
  [Property addObject:v11];
  currentConfiguration = self->_currentConfiguration;
  self->_currentConfiguration = v11;
  BOOL v20 = v11;

  BOOL v13 = 1;
LABEL_32:

  return v13;
}

- (NEAppPush)appPush
{
  if (self)
  {
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56, 1);
    uint64_t v2 = vars8;
  }
  return [(NEUtilConfigurationClient *)self appPush];
}

- (NEDNSSettingsBundle)dnsSettingsBundle
{
  if (self)
  {
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56, 1);
    uint64_t v2 = vars8;
  }
  return (NEDNSSettingsBundle *)[(NEUtilConfigurationClient *)self dnsSettings];
}

- (NEDNSProxyProviderProtocol)dnsProxyConfiguration
{
  if (self) {
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56, 1);
  }
  uint64_t v2 = [(NEUtilConfigurationClient *)self dnsProxy];
  uint64_t v3 = [v2 protocol];

  return (NEDNSProxyProviderProtocol *)v3;
}

- (NEFilterProviderConfiguration)filterConfiguration
{
  if (self) {
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56, 1);
  }
  uint64_t v2 = [(NEUtilConfigurationClient *)self contentFilter];
  uint64_t v3 = [v2 provider];

  return (NEFilterProviderConfiguration *)v3;
}

- (id)protocolForParameters:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 56, 1);
  }
  else {
    id Property = 0;
  }
  unint64_t v7 = [Property VPN];

  if (v7)
  {
    if (self) {
      id v9 = objc_getProperty(self, v8, 56, 1);
    }
    else {
      id v9 = 0;
    }
    uint64_t v10 = [v9 VPN];
LABEL_13:
    id v15 = v10;
    id v16 = [v10 protocol];
LABEL_14:

    goto LABEL_15;
  }
  if (self) {
    id v11 = objc_getProperty(self, v8, 56, 1);
  }
  else {
    id v11 = 0;
  }
  uint64_t v12 = [v11 appVPN];

  if (v12)
  {
    if (self) {
      id v14 = objc_getProperty(self, v13, 56, 1);
    }
    else {
      id v14 = 0;
    }
    uint64_t v10 = [v14 appVPN];
    goto LABEL_13;
  }
  if (self) {
    id v18 = objc_getProperty(self, v13, 56, 1);
  }
  else {
    id v18 = 0;
  }
  uint64_t v19 = [v18 alwaysOnVPN];

  if (v19)
  {
    id v15 = [v5 objectForKeyedSubscript:@"interface-name"];
    if (v15)
    {
      if (self) {
        id v21 = objc_getProperty(self, v20, 56, 1);
      }
      else {
        id v21 = 0;
      }
      id v22 = [v21 alwaysOnVPN];
      uint64_t v23 = [v22 interfaceProtocolMapping];
      id v16 = [v23 objectForKeyedSubscript:v15];
    }
    else
    {
      id v16 = 0;
    }
    goto LABEL_14;
  }
  id v16 = 0;
LABEL_15:

  return v16;
}

- (void)setOnDemandRules:(id)a3
{
  id v22 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 56, 1);
  }
  else {
    id Property = 0;
  }
  id v6 = [Property VPN];

  if (v6)
  {
    id v9 = (void *)[v22 copy];
    if (self) {
      id v10 = objc_getProperty(self, v8, 56, 1);
    }
    else {
      id v10 = 0;
    }
    id v11 = [v10 VPN];
  }
  else
  {
    if (self) {
      id v12 = objc_getProperty(self, v7, 56, 1);
    }
    else {
      id v12 = 0;
    }
    BOOL v13 = [v12 appVPN];

    if (v13)
    {
      id v9 = (void *)[v22 copy];
      if (self) {
        id v16 = objc_getProperty(self, v15, 56, 1);
      }
      else {
        id v16 = 0;
      }
      id v11 = [v16 appVPN];
    }
    else
    {
      if (self) {
        id v17 = objc_getProperty(self, v14, 56, 1);
      }
      else {
        id v17 = 0;
      }
      id v18 = [v17 dnsSettings];

      if (!v18) {
        goto LABEL_20;
      }
      id v9 = (void *)[v22 copy];
      if (self) {
        id v20 = objc_getProperty(self, v19, 56, 1);
      }
      else {
        id v20 = 0;
      }
      id v11 = [v20 dnsSettings];
    }
  }
  id v21 = v11;
  [v11 setOnDemandRules:v9];

LABEL_20:
}

- (NSArray)onDemandRules
{
  uint64_t v2 = self;
  if (self) {
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56, 1);
  }
  uint64_t v3 = [(NEUtilConfigurationClient *)self VPN];

  if (v3)
  {
    if (v2) {
      id Property = objc_getProperty(v2, v4, 56, 1);
    }
    else {
      id Property = 0;
    }
    id v6 = [Property VPN];
  }
  else
  {
    if (v2) {
      id v7 = objc_getProperty(v2, v4, 56, 1);
    }
    else {
      id v7 = 0;
    }
    int v8 = [v7 appVPN];

    if (v8)
    {
      if (v2) {
        id v10 = objc_getProperty(v2, v9, 56, 1);
      }
      else {
        id v10 = 0;
      }
      id v6 = [v10 appVPN];
    }
    else
    {
      if (v2) {
        id v11 = objc_getProperty(v2, v9, 56, 1);
      }
      else {
        id v11 = 0;
      }
      id v12 = [v11 dnsSettings];

      if (!v12) {
        goto LABEL_20;
      }
      if (v2) {
        id v14 = objc_getProperty(v2, v13, 56, 1);
      }
      else {
        id v14 = 0;
      }
      id v6 = [v14 dnsSettings];
    }
  }
  id v15 = v6;
  id v12 = [v6 onDemandRules];

LABEL_20:

  return (NSArray *)v12;
}

- (void)setDisconnectOnDemandEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  if (self) {
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56, 1);
  }
  id v5 = [(NEUtilConfigurationClient *)self VPN];

  if (v5)
  {
    if (v4) {
      id Property = objc_getProperty(v4, v6, 56, 1);
    }
    else {
      id Property = 0;
    }
    int v8 = [Property VPN];
LABEL_13:
    id v13 = v8;
    [v8 setDisconnectOnDemandEnabled:v3];

    return;
  }
  if (v4) {
    id v9 = objc_getProperty(v4, v6, 56, 1);
  }
  else {
    id v9 = 0;
  }
  id v10 = [v9 appVPN];

  if (v10)
  {
    if (v4) {
      id v12 = objc_getProperty(v4, v11, 56, 1);
    }
    else {
      id v12 = 0;
    }
    int v8 = [v12 appVPN];
    goto LABEL_13;
  }
}

- (BOOL)disconnectOnDemandEnabled
{
  uint64_t v2 = self;
  if (self) {
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56, 1);
  }
  BOOL v3 = [(NEUtilConfigurationClient *)self VPN];

  if (v3)
  {
    if (v2) {
      id Property = objc_getProperty(v2, v4, 56, 1);
    }
    else {
      id Property = 0;
    }
    id v6 = [Property VPN];
LABEL_13:
    id v11 = v6;
    char v12 = [v6 isDisconnectOnDemandEnabled];

    return v12;
  }
  if (v2) {
    id v7 = objc_getProperty(v2, v4, 56, 1);
  }
  else {
    id v7 = 0;
  }
  int v8 = [v7 appVPN];

  if (v8)
  {
    if (v2) {
      id v10 = objc_getProperty(v2, v9, 56, 1);
    }
    else {
      id v10 = 0;
    }
    id v6 = [v10 appVPN];
    goto LABEL_13;
  }
  return 0;
}

- (void)setOnDemandUserOverrideDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  if (self) {
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56, 1);
  }
  id v6 = [(NEUtilConfigurationClient *)self VPN];
  if (v6)
  {
    if (v4) {
      id Property = objc_getProperty(v4, v5, 56, 1);
    }
    else {
      id Property = 0;
    }
    uint64_t v8 = [Property VPN];
  }
  else
  {
    if (v4) {
      id v9 = objc_getProperty(v4, v5, 56, 1);
    }
    else {
      id v9 = 0;
    }
    uint64_t v8 = [v9 appVPN];
  }
  id v11 = (id)v8;

  id v10 = v11;
  if (v11)
  {
    [v11 setOnDemandUserOverrideDisabled:v3];
    id v10 = v11;
  }
}

- (BOOL)onDemandUserOverrideDisabled
{
  uint64_t v2 = self;
  if (self) {
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56, 1);
  }
  uint64_t v4 = [(NEUtilConfigurationClient *)self VPN];
  if (v4)
  {
    if (v2) {
      id Property = objc_getProperty(v2, v3, 56, 1);
    }
    else {
      id Property = 0;
    }
    uint64_t v6 = [Property VPN];
  }
  else
  {
    if (v2) {
      id v7 = objc_getProperty(v2, v3, 56, 1);
    }
    else {
      id v7 = 0;
    }
    uint64_t v6 = [v7 appVPN];
  }
  uint64_t v8 = (void *)v6;

  char v9 = [v8 isOnDemandUserOverrideDisabled];
  return v9;
}

- (void)setOnDemandEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  if (self) {
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56, 1);
  }
  id v5 = [(NEUtilConfigurationClient *)self VPN];

  if (v5)
  {
    if (v4) {
      id Property = objc_getProperty(v4, v6, 56, 1);
    }
    else {
      id Property = 0;
    }
    uint64_t v8 = [Property VPN];
LABEL_13:
    id v13 = v8;
    [v8 setOnDemandEnabled:v3];

    return;
  }
  if (v4) {
    id v9 = objc_getProperty(v4, v6, 56, 1);
  }
  else {
    id v9 = 0;
  }
  id v10 = [v9 appVPN];

  if (v10)
  {
    if (v4) {
      id v12 = objc_getProperty(v4, v11, 56, 1);
    }
    else {
      id v12 = 0;
    }
    uint64_t v8 = [v12 appVPN];
    goto LABEL_13;
  }
}

- (BOOL)onDemandEnabled
{
  uint64_t v2 = self;
  if (self) {
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56, 1);
  }
  BOOL v3 = [(NEUtilConfigurationClient *)self VPN];

  if (v3)
  {
    if (v2) {
      id Property = objc_getProperty(v2, v4, 56, 1);
    }
    else {
      id Property = 0;
    }
    uint64_t v6 = [Property VPN];
LABEL_13:
    id v11 = v6;
    char v12 = [v6 isOnDemandEnabled];

    return v12;
  }
  if (v2) {
    id v7 = objc_getProperty(v2, v4, 56, 1);
  }
  else {
    id v7 = 0;
  }
  uint64_t v8 = [v7 appVPN];

  if (v8)
  {
    if (v2) {
      id v10 = objc_getProperty(v2, v9, 56, 1);
    }
    else {
      id v10 = 0;
    }
    uint64_t v6 = [v10 appVPN];
    goto LABEL_13;
  }
  return 0;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  if (self) {
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56, 1);
  }
  id v5 = [(NEUtilConfigurationClient *)self VPN];

  if (v5)
  {
    if (v4) {
      id Property = objc_getProperty(v4, v6, 56, 1);
    }
    else {
      id Property = 0;
    }
    uint64_t v8 = [Property VPN];
LABEL_49:
    id v37 = v8;
    [v8 setEnabled:v3];

    return;
  }
  if (v4) {
    id v9 = objc_getProperty(v4, v6, 56, 1);
  }
  else {
    id v9 = 0;
  }
  id v10 = [v9 appVPN];

  if (v10)
  {
    if (v4) {
      id v12 = objc_getProperty(v4, v11, 56, 1);
    }
    else {
      id v12 = 0;
    }
    uint64_t v8 = [v12 appVPN];
    goto LABEL_49;
  }
  if (v4) {
    id v13 = objc_getProperty(v4, v11, 56, 1);
  }
  else {
    id v13 = 0;
  }
  id v14 = [v13 contentFilter];

  if (v14)
  {
    if (v4) {
      id v16 = objc_getProperty(v4, v15, 56, 1);
    }
    else {
      id v16 = 0;
    }
    uint64_t v8 = [v16 contentFilter];
    goto LABEL_49;
  }
  if (v4) {
    id v17 = objc_getProperty(v4, v15, 56, 1);
  }
  else {
    id v17 = 0;
  }
  id v18 = [v17 alwaysOnVPN];

  if (v18)
  {
    if (v4) {
      id v20 = objc_getProperty(v4, v19, 56, 1);
    }
    else {
      id v20 = 0;
    }
    uint64_t v8 = [v20 alwaysOnVPN];
    goto LABEL_49;
  }
  if (v4) {
    id v21 = objc_getProperty(v4, v19, 56, 1);
  }
  else {
    id v21 = 0;
  }
  id v22 = [v21 dnsSettings];

  if (v22)
  {
    if (v4) {
      id v24 = objc_getProperty(v4, v23, 56, 1);
    }
    else {
      id v24 = 0;
    }
    uint64_t v8 = [v24 dnsSettings];
    goto LABEL_49;
  }
  if (v4) {
    id v25 = objc_getProperty(v4, v23, 56, 1);
  }
  else {
    id v25 = 0;
  }
  BOOL v26 = [v25 dnsProxy];

  if (v26)
  {
    if (v4) {
      id v28 = objc_getProperty(v4, v27, 56, 1);
    }
    else {
      id v28 = 0;
    }
    uint64_t v8 = [v28 dnsProxy];
    goto LABEL_49;
  }
  if (v4) {
    id v29 = objc_getProperty(v4, v27, 56, 1);
  }
  else {
    id v29 = 0;
  }
  uint64_t v30 = [v29 pathController];

  if (v30)
  {
    if (v4) {
      id v32 = objc_getProperty(v4, v31, 56, 1);
    }
    else {
      id v32 = 0;
    }
    uint64_t v8 = [v32 pathController];
    goto LABEL_49;
  }
  if (v4) {
    id v33 = objc_getProperty(v4, v31, 56, 1);
  }
  else {
    id v33 = 0;
  }
  BOOL v34 = [v33 relay];

  if (v34)
  {
    if (v4) {
      id v36 = objc_getProperty(v4, v35, 56, 1);
    }
    else {
      id v36 = 0;
    }
    uint64_t v8 = [v36 relay];
    goto LABEL_49;
  }
}

- (BOOL)enabled
{
  uint64_t v2 = self;
  if (self) {
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56, 1);
  }
  BOOL v3 = [(NEUtilConfigurationClient *)self VPN];

  if (v3)
  {
    if (v2) {
      id Property = objc_getProperty(v2, v4, 56, 1);
    }
    else {
      id Property = 0;
    }
    uint64_t v6 = [Property VPN];
LABEL_43:
    long long v31 = v6;
    char v32 = [v6 isEnabled];

    return v32;
  }
  if (v2) {
    id v7 = objc_getProperty(v2, v4, 56, 1);
  }
  else {
    id v7 = 0;
  }
  uint64_t v8 = [v7 appVPN];

  if (v8)
  {
    if (v2) {
      id v10 = objc_getProperty(v2, v9, 56, 1);
    }
    else {
      id v10 = 0;
    }
    uint64_t v6 = [v10 appVPN];
    goto LABEL_43;
  }
  if (v2) {
    id v11 = objc_getProperty(v2, v9, 56, 1);
  }
  else {
    id v11 = 0;
  }
  id v12 = [v11 contentFilter];

  if (v12)
  {
    if (v2) {
      id v14 = objc_getProperty(v2, v13, 56, 1);
    }
    else {
      id v14 = 0;
    }
    uint64_t v6 = [v14 contentFilter];
    goto LABEL_43;
  }
  if (v2) {
    id v15 = objc_getProperty(v2, v13, 56, 1);
  }
  else {
    id v15 = 0;
  }
  id v16 = [v15 alwaysOnVPN];

  if (v16)
  {
    if (v2) {
      id v18 = objc_getProperty(v2, v17, 56, 1);
    }
    else {
      id v18 = 0;
    }
    uint64_t v6 = [v18 alwaysOnVPN];
    goto LABEL_43;
  }
  if (v2) {
    id v19 = objc_getProperty(v2, v17, 56, 1);
  }
  else {
    id v19 = 0;
  }
  id v20 = [v19 dnsProxy];

  if (v20)
  {
    if (v2) {
      id v22 = objc_getProperty(v2, v21, 56, 1);
    }
    else {
      id v22 = 0;
    }
    uint64_t v6 = [v22 dnsProxy];
    goto LABEL_43;
  }
  if (v2) {
    id v23 = objc_getProperty(v2, v21, 56, 1);
  }
  else {
    id v23 = 0;
  }
  id v24 = [v23 dnsSettings];

  if (v24)
  {
    if (v2) {
      id v26 = objc_getProperty(v2, v25, 56, 1);
    }
    else {
      id v26 = 0;
    }
    uint64_t v6 = [v26 dnsSettings];
    goto LABEL_43;
  }
  if (v2) {
    id v27 = objc_getProperty(v2, v25, 56, 1);
  }
  else {
    id v27 = 0;
  }
  id v28 = [v27 relay];

  if (v28)
  {
    if (v2) {
      id v30 = objc_getProperty(v2, v29, 56, 1);
    }
    else {
      id v30 = 0;
    }
    uint64_t v6 = [v30 relay];
    goto LABEL_43;
  }
  return 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NEUtilConfigurationClient;
  [(NEUtilConfigurationClient *)&v2 dealloc];
}

- (NEUtilConfigurationClient)initWithClientName:(id)a3
{
  id v4 = a3;
  id v5 = [(NEUtilConfigurationClient *)self initInternalWithClientName:v4];
  if (v5)
  {
    if (geteuid())
    {
      uint64_t v6 = objc_alloc_init(NEConfigurationManager);
    }
    else
    {
      uint64_t v6 = +[NEConfigurationManager sharedManagerForAllUsers];
    }
    manager = v5->_manager;
    v5->_manager = v6;

    objc_initWeak(&location, v5);
    uint64_t v8 = v5->_manager;
    uint64_t v9 = MEMORY[0x1E4F14428];
    id v10 = MEMORY[0x1E4F14428];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48__NEUtilConfigurationClient_initWithClientName___block_invoke;
    v12[3] = &unk_1E5992DE0;
    objc_copyWeak(&v13, &location);
    [(NEConfigurationManager *)v8 setChangedQueue:v9 andHandler:v12];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __48__NEUtilConfigurationClient_initWithClientName___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[NEUtilConfigurationClient loadConfigurationsForceRefresh:completionHandler:](WeakRetained, 1, &__block_literal_global_7_24333);
}

- (id)initInternalWithClientName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NEUtilConfigurationClient;
  id v5 = [(NEUtilConfigurationClient *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    clientName = v5->_clientName;
    v5->_clientName = (NSString *)v6;
  }
  return v5;
}

+ (void)removeClientWithName:(id)a3
{
  id v3 = a3;
  +[NEUtilConfigurationClient allClients]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 removeObjectForKey:v3];
}

+ (id)allClients
{
  self;
  if (allClients_g_initClients != -1) {
    dispatch_once(&allClients_g_initClients, &__block_literal_global_24343);
  }
  v0 = (void *)allClients_g_clients;

  return v0;
}

uint64_t __39__NEUtilConfigurationClient_allClients__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v1 = allClients_g_clients;
  allClients_g_clients = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)clientWithName:(id)a3
{
  id v3 = a3;
  id v4 = +[NEUtilConfigurationClient allClients]();
  id v5 = [v4 objectForKeyedSubscript:v3];
  if (!v5)
  {
    int v6 = [v3 hasPrefix:@"app:"];
    id v7 = off_1E598D7A0;
    if (!v6) {
      id v7 = off_1E598D830;
    }
    id v5 = (void *)[objc_alloc(*v7) initWithClientName:v3];
    if (v5) {
      [v4 setObject:v5 forKeyedSubscript:v3];
    }
  }

  return v5;
}

@end