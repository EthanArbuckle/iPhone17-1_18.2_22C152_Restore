@interface NEProfileIngestion
+ (id)getServiceIDForPayload:(id)a3;
- (BOOL)createConfigurationFromPayload:(id)a3 payloadType:(id)a4;
- (BOOL)enableAlwaysOnVpn;
- (BOOL)isInstalled:(id)a3;
- (BOOL)loadConfigurationsForceReloadFromDisk;
- (BOOL)lockConfigurations;
- (BOOL)removeConfiguration:(id)a3;
- (BOOL)removeConfigurationWithIdentifier:(id)a3;
- (BOOL)removeIngestedConfiguration;
- (BOOL)saveConfiguration:(void *)a3 returnError:;
- (BOOL)saveIngestedConfiguration;
- (BOOL)saveIngestedConfiguration:(id *)a3;
- (BOOL)updateAccountIdentifiers:(id)a3;
- (BOOL)updateAppLayerVPNMappingRules:(id)a3;
- (BOOL)updateDefaultAfterAddingConfiguration;
- (BOOL)updateDefaultAfterDeletingConfiguration;
- (BOOL)updateManagedAppRules:(id)a3;
- (BOOL)updatePerAppMappingRules:(id)a3;
- (NEConfiguration)ingestedConfiguration;
- (NEConfigurationManager)manager;
- (NEProfileIngestion)initWithName:(id)a3;
- (NEProfileIngestion)initWithNameAndType:(id)a3 payloadType:(id)a4;
- (NSMutableArray)currentConfigurations;
- (NSString)clientName;
- (NSString)payloadType;
- (id)copyManagedConfigurationIDs;
- (id)findConfigurationByConfigurationID:(id)a3;
- (id)findConfigurationByName:(id)a3;
- (id)findConfigurationByPayloadUUID:(id)a3;
- (id)getCertificatesForConfigurationWithIdentifier:(id)a3;
- (id)setAsideConfigurationName:(id)a3 unsetAside:(BOOL)a4;
- (uint64_t)enableAlwaysOnVpnInternal:(void *)a1;
- (uint64_t)matchConfigAppUUID:(void *)a3 configUUIDType:(void *)a4 configAppUUID:;
- (void)dealloc;
- (void)enableDefaultService;
- (void)removeAllConfigurationsWithPayload:(id)a3 profile:(id)a4;
- (void)setCurrentConfigurations:(id)a3;
- (void)setIngestedConfiguration:(id)a3;
- (void)unlockConfigurations;
@end

@implementation NEProfileIngestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ingestedConfiguration, 0);
  objc_storeStrong((id *)&self->_currentConfigurations, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_payloadType, 0);

  objc_storeStrong((id *)&self->_clientName, 0);
}

- (void)setIngestedConfiguration:(id)a3
{
}

- (NEConfiguration)ingestedConfiguration
{
  return (NEConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCurrentConfigurations:(id)a3
{
}

- (NSMutableArray)currentConfigurations
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (NEConfigurationManager)manager
{
  return (NEConfigurationManager *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)payloadType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)clientName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)updateManagedAppRules:(id)a3
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v67 = a3;
  v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v112 = (id)objc_opt_class();
    __int16 v113 = 2112;
    id v114 = v67;
    id v65 = v112;
    _os_log_debug_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEBUG, "%@ updateManagedAppRules %@", buf, 0x16u);
  }
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  obuint64_t j = [(NEProfileIngestion *)self currentConfigurations];
  uint64_t v70 = [obj countByEnumeratingWithState:&v95 objects:v109 count:16];
  if (v70)
  {
    uint64_t v69 = *(void *)v96;
    *(void *)&long long v5 = 138412802;
    long long v66 = v5;
    v73 = self;
    do
    {
      for (uint64_t i = 0; i != v70; ++i)
      {
        if (*(void *)v96 != v69) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v95 + 1) + 8 * i);
        if (objc_msgSend(v7, "grade", v66) != 1) {
          continue;
        }
        uint64_t v71 = i;
        Property = [v7 pathController];
        v10 = Property;
        if (Property) {
          Property = objc_getProperty(Property, v9, 32, 1);
        }
        id v11 = Property;
        int v12 = isa_nsarray(v11);

        uint64_t i = v71;
        if (!v12) {
          continue;
        }
        v72 = [MEMORY[0x1E4F1CA48] array];
        long long v91 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        id v75 = v67;
        uint64_t v79 = [v75 countByEnumeratingWithState:&v91 objects:v108 count:16];
        if (!v79) {
          goto LABEL_70;
        }
        uint64_t v78 = *(void *)v92;
        v74 = v7;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v92 != v78) {
              objc_enumerationMutation(v75);
            }
            v14 = *(void **)(*((void *)&v91 + 1) + 8 * v13);
            if (isa_nsstring(v14))
            {
              id v15 = v14;
              id v16 = v7;
              id v85 = v15;
              if (self)
              {
                v17 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"*"];
                long long v103 = 0u;
                long long v104 = 0u;
                long long v105 = 0u;
                long long v106 = 0u;
                v18 = [v16 pathController];
                v20 = v18;
                if (v18) {
                  v18 = objc_getProperty(v18, v19, 32, 1);
                }
                id v76 = v16;
                uint64_t v77 = v13;
                id v21 = v18;

                uint64_t v22 = [v21 countByEnumeratingWithState:&v103 objects:buf count:16];
                if (v22)
                {
                  uint64_t v23 = v22;
                  unint64_t v24 = 0;
                  id v25 = 0;
                  uint64_t v26 = *(void *)v104;
                  uint64_t v80 = *(void *)v104;
                  id v81 = v21;
                  do
                  {
                    uint64_t v27 = 0;
                    uint64_t v82 = v23;
                    do
                    {
                      if (*(void *)v104 != v26)
                      {
                        uint64_t v28 = v27;
                        objc_enumerationMutation(v21);
                        uint64_t v27 = v28;
                      }
                      uint64_t v84 = v27;
                      v29 = *(void **)(*((void *)&v103 + 1) + 8 * v27);
                      if (isa_nsdictionary(v29))
                      {
                        v30 = [v29 objectForKeyedSubscript:@"AppIdentifierMatches"];
                        if (v30)
                        {
                          v86 = v29;
                          v31 = v30;
                          if (isa_nsarray(v30))
                          {
                            long long v101 = 0u;
                            long long v102 = 0u;
                            long long v99 = 0u;
                            long long v100 = 0u;
                            v83 = v31;
                            id v32 = v31;
                            uint64_t v33 = [v32 countByEnumeratingWithState:&v99 objects:v110 count:16];
                            if (v33)
                            {
                              uint64_t v34 = v33;
                              uint64_t v35 = *(void *)v100;
                              do
                              {
                                for (uint64_t j = 0; j != v34; ++j)
                                {
                                  if (*(void *)v100 != v35) {
                                    objc_enumerationMutation(v32);
                                  }
                                  v37 = *(void **)(*((void *)&v99 + 1) + 8 * j);
                                  if (isa_nsstring(v37))
                                  {
                                    v38 = [v37 stringByTrimmingCharactersInSet:v17];
                                    if ([v15 hasPrefix:v38])
                                    {
                                      unint64_t v39 = [v38 length];
                                      unint64_t v40 = v39;
                                      if (!v25 || v24 < v39)
                                      {
                                        id v41 = v86;

                                        unint64_t v24 = v40;
                                        id v25 = v41;
                                        id v15 = v85;
                                      }
                                    }
                                  }
                                }
                                uint64_t v34 = [v32 countByEnumeratingWithState:&v99 objects:v110 count:16];
                              }
                              while (v34);
                            }

                            uint64_t v26 = v80;
                            id v21 = v81;
                            uint64_t v23 = v82;
                            v30 = v83;
                          }
                          else
                          {
                            v30 = v31;
                          }
                        }
                        else if (!v25)
                        {
                          id v25 = v29;
                          v30 = 0;
                          unint64_t v24 = 0;
                        }
                      }
                      uint64_t v27 = v84 + 1;
                    }
                    while (v84 + 1 != v23);
                    uint64_t v23 = [v21 countByEnumeratingWithState:&v103 objects:buf count:16];
                  }
                  while (v23);
                }
                else
                {
                  id v25 = 0;
                }

                self = v73;
                v7 = v74;
                id v16 = v76;
                uint64_t v13 = v77;
              }
              else
              {
                id v25 = 0;
              }

              if (isa_nsdictionary(v25))
              {
                v42 = [v25 objectForKeyedSubscript:@"AllowRoamingCellularData"];
                v43 = [v25 objectForKeyedSubscript:@"AllowCellularData"];
                if (isa_nsnumber(v42))
                {
                  char v44 = [v42 BOOLValue];
                  if ((isa_nsnumber(v43) & 1) == 0)
                  {
                    if ((v44 & 1) == 0)
                    {
                      uint64_t v45 = 0;
                      goto LABEL_61;
                    }
                    goto LABEL_64;
                  }
                }
                else
                {
                  if (!isa_nsnumber(v43)) {
                    goto LABEL_64;
                  }
                  char v44 = 1;
                }
                uint64_t v45 = [v43 BOOLValue] ^ 1;
                if ((v45 & 1) != 0 || (v44 & 1) == 0)
                {
LABEL_61:
                  v46 = [(NEAppRule *)[NEPathRule alloc] initWithSigningIdentifier:v85];
                  [(NEPathRule *)v46 setCellularBehavior:v45];
                  if (v46) {
                    [v72 addObject:v46];
                  }
                }
LABEL_64:
              }
            }
            ++v13;
          }
          while (v13 != v79);
          uint64_t v47 = [v75 countByEnumeratingWithState:&v91 objects:v108 count:16];
          uint64_t v79 = v47;
        }
        while (v47);
LABEL_70:

        v48 = ne_log_obj();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          v61 = objc_opt_class();
          id v62 = v61;
          v63 = [v7 name];
          *(_DWORD *)buf = v66;
          id v112 = v61;
          __int16 v113 = 2112;
          id v114 = v63;
          __int16 v115 = 2112;
          v116 = v72;
          _os_log_debug_impl(&dword_19DDAF000, v48, OS_LOG_TYPE_DEBUG, "%@ newPathRules for %@: %@", buf, 0x20u);
        }
        v49 = [v7 pathController];
        v50 = [v49 pathRules];
        uint64_t v51 = [v50 count];
        v52 = v72;
        uint64_t v53 = [v72 count];

        if (v51 == v53)
        {
          long long v89 = 0u;
          long long v90 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          v54 = [v7 pathController];
          v55 = [v54 pathRules];

          uint64_t v56 = [v55 countByEnumeratingWithState:&v87 objects:v107 count:16];
          if (v56)
          {
            uint64_t v57 = v56;
            uint64_t v58 = *(void *)v88;
            while (2)
            {
              for (uint64_t k = 0; k != v57; ++k)
              {
                if (*(void *)v88 != v58) {
                  objc_enumerationMutation(v55);
                }
                if (![v72 containsObject:*(void *)(*((void *)&v87 + 1) + 8 * k)])
                {

                  v52 = v72;
                  goto LABEL_83;
                }
              }
              uint64_t v57 = [v55 countByEnumeratingWithState:&v87 objects:v107 count:16];
              if (v57) {
                continue;
              }
              break;
            }
          }

          v52 = v72;
        }
        else
        {
LABEL_83:
          v60 = [v7 pathController];
          [v60 setPathRules:v52];

          -[NEProfileIngestion saveConfiguration:returnError:](self, v7, 0);
        }

        uint64_t i = v71;
      }
      uint64_t v70 = [obj countByEnumeratingWithState:&v95 objects:v109 count:16];
    }
    while (v70);
  }

  return 1;
}

- (BOOL)saveConfiguration:(void *)a3 returnError:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = v5;
  if (a1)
  {
    uint64_t v39 = 0;
    unint64_t v40 = &v39;
    uint64_t v41 = 0x2020000000;
    char v42 = 0;
    uint64_t v33 = 0;
    uint64_t v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__20686;
    v37 = __Block_byref_object_dispose__20687;
    id v38 = 0;
    if (!v5
      || ([v5 name],
          v7 = objc_claimAutoreleasedReturnValue(),
          BOOL v8 = [v7 length] == 0,
          v7,
          v8))
    {
      v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        id v44 = v23;
        id v24 = v23;
        _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, "%@ saveConfigurationByConfiguration failed: empty configuration or configuration name", buf, 0xCu);
      }
    }
    v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v18 = (id)objc_opt_class();
      v19 = [v6 name];
      *(_DWORD *)buf = 138412546;
      id v44 = v18;
      __int16 v45 = 2112;
      v46 = v19;
      _os_log_debug_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_DEBUG, "%@ saveConfiguration: '%@'", buf, 0x16u);
    }
    id v11 = [a1 manager];
    uint64_t v12 = MEMORY[0x1E4F14428];
    id v13 = MEMORY[0x1E4F14428];
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    uint64_t v27 = __52__NEProfileIngestion_saveConfiguration_returnError___block_invoke;
    uint64_t v28 = &unk_1E5992950;
    v29 = a1;
    id v14 = v6;
    id v30 = v14;
    v31 = &v33;
    id v32 = &v39;
    [v11 saveConfiguration:v14 withCompletionQueue:v12 handler:&v25];

    id v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v20 = (id)objc_opt_class();
      id v21 = objc_msgSend(v14, "name", v25, v26, v27, v28, v29);
      int v22 = *((unsigned __int8 *)v40 + 24);
      *(_DWORD *)buf = 138413058;
      id v44 = v20;
      __int16 v45 = 2112;
      v46 = v21;
      __int16 v47 = 1024;
      int v48 = v22;
      __int16 v49 = 2112;
      id v50 = v14;
      _os_log_debug_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_DEBUG, "%@ saveConfiguration '%@', ouint64_t k = %d, configuration %@", buf, 0x26u);
    }
    if (a3) {
      *a3 = (id) v34[5];
    }
    BOOL v16 = *((unsigned char *)v40 + 24) != 0;

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v39, 8);
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

void __52__NEProfileIngestion_saveConfiguration_returnError___block_invoke(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (v3 && [v3 code] != 9)
  {
    id v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v14 = objc_opt_class();
      id v15 = (void *)a1[5];
      id v16 = v14;
      v17 = [v15 name];
      id v18 = convert_error_to_string(v4);
      int v19 = 138412802;
      id v20 = v14;
      __int16 v21 = 2112;
      int v22 = v17;
      __int16 v23 = 2112;
      id v24 = v18;
      _os_log_error_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_ERROR, "%@ Error occurred when saving configuration '%@': %@", (uint8_t *)&v19, 0x20u);
    }
    uint64_t v12 = *(void *)(a1[6] + 8);
    id v13 = v4;
    id v5 = *(NSObject **)(v12 + 40);
    *(void *)(v12 + 40) = v13;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    id v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = objc_opt_class();
      v7 = (void *)a1[5];
      id v8 = v6;
      v9 = [v7 name];
      v10 = convert_error_to_string(v4);
      int v19 = 138412802;
      id v20 = v6;
      __int16 v21 = 2112;
      int v22 = v9;
      __int16 v23 = 2112;
      id v24 = v10;
      _os_log_debug_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEBUG, "%@ saved configuration '%@': %@", (uint8_t *)&v19, 0x20u);
    }
  }
}

- (BOOL)updateAccountIdentifiers:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v31 = self;
  obuint64_t j = [(NEProfileIngestion *)self currentConfigurations];
  uint64_t v4 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v32 = *(void *)v38;
    int v6 = 1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v38 != v32) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        v9 = [v8 appVPN];

        if (v9)
        {
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          uint64_t v10 = [&unk_1EF08D408 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v34;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v34 != v12) {
                  objc_enumerationMutation(&unk_1EF08D408);
                }
                uint64_t v14 = *(void *)(*((void *)&v33 + 1) + 8 * j);
                id v15 = [v8 appVPN];
                [v15 removeAppRuleByID:v14];
              }
              uint64_t v11 = [&unk_1EF08D408 countByEnumeratingWithState:&v33 objects:v41 count:16];
            }
            while (v11);
          }
          id v16 = [v8 externalIdentifier];

          if (v16)
          {
            v17 = [v8 externalIdentifier];
            id v18 = [v29 objectForKeyedSubscript:v17];

            int v19 = [v18 mailAccountIdentifiers];
            uint64_t v20 = [v19 count];

            if (v20)
            {
              __int16 v21 = [v18 mailAccountIdentifiers];
              [v8 setMailDomains:0 accountIdentifiers:v21];
            }
            int v22 = [v18 calendarAccountIdentifiers];
            uint64_t v23 = [v22 count];

            if (v23)
            {
              id v24 = [v18 calendarAccountIdentifiers];
              [v8 setCalendarDomains:0 accountIdentifiers:v24];
            }
            uint64_t v25 = [v18 contactsAccountIdentifiers];
            uint64_t v26 = [v25 count];

            if (v26)
            {
              uint64_t v27 = [v18 contactsAccountIdentifiers];
              [v8 setContactsDomains:0 accountIdentifiers:v27];
            }
          }
          v6 &= -[NEProfileIngestion saveConfiguration:returnError:](v31, v8, 0);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6 & 1;
}

- (BOOL)updateAppLayerVPNMappingRules:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412802;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 2080;
    uint64_t v12 = "-[NEProfileIngestion updateAppLayerVPNMappingRules:]";
    __int16 v13 = 2112;
    id v14 = v4;
    id v8 = v10;
    _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "%@ %s %@", (uint8_t *)&v9, 0x20u);
  }
  BOOL v6 = [(NEProfileIngestion *)self updatePerAppMappingRules:v4];

  return v6;
}

- (BOOL)updatePerAppMappingRules:(id)a3
{
  uint64_t v178 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v168 = (id)objc_opt_class();
    __int16 v169 = 2112;
    id v170 = v4;
    id v108 = v168;
    _os_log_debug_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEBUG, "%@ updatePerAppMappingRules %@", buf, 0x16u);
  }
  v133 = self;

  BOOL v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v159 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  obuint64_t j = v4;
  uint64_t v129 = [obj countByEnumeratingWithState:&v159 objects:v177 count:16];
  if (v129)
  {
    uint64_t v126 = *(void *)v160;
    do
    {
      for (uint64_t i = 0; i != v129; ++i)
      {
        if (*(void *)v160 != v126) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v159 + 1) + 8 * i);
        int v9 = [obj objectForKey:v8];
        long long v155 = 0u;
        long long v156 = 0u;
        long long v157 = 0u;
        long long v158 = 0u;
        v131 = v9;
        id v10 = [v9 allValues];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v155 objects:v176 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v156;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v156 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v155 + 1) + 8 * j);
              id v16 = [v6 objectForKeyedSubscript:v15];
              if (!v16)
              {
                id v16 = [MEMORY[0x1E4F1CA80] set];
                [v6 setObject:v16 forKeyedSubscript:v15];
              }
              [v16 addObject:v8];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v155 objects:v176 count:16];
          }
          while (v12);
        }
      }
      uint64_t v129 = [obj countByEnumeratingWithState:&v159 objects:v177 count:16];
    }
    while (v129);
  }

  v17 = ne_log_obj();
  id v18 = v133;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v109 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    id v168 = v109;
    __int16 v169 = 2112;
    id v170 = v6;
    id v110 = v109;
    _os_log_debug_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_DEBUG, "%@ updatePerAppMappingRules appIDsByPerAppUUID %@", buf, 0x16u);
  }
  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  id v116 = [(NEProfileIngestion *)v133 currentConfigurations];
  uint64_t v19 = [v116 countByEnumeratingWithState:&v151 objects:v175 count:16];
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v152;
    *(void *)&long long v20 = 138413058;
    long long v111 = v20;
    uint64_t v112 = *(void *)v152;
    do
    {
      uint64_t v23 = 0;
      uint64_t v114 = v21;
      do
      {
        if (*(void *)v152 != v22) {
          objc_enumerationMutation(v116);
        }
        id v24 = *(void **)(*((void *)&v151 + 1) + 8 * v23);
        v130 = objc_msgSend(v24, "externalIdentifier", v111);
        if (v130)
        {
          v122 = [MEMORY[0x1E4F1CA48] array];
          uint64_t v25 = [v24 appVPN];

          v118 = v24;
          if (v25)
          {
            uint64_t v26 = [v24 appVPN];
            uint64_t v27 = @"VPNUUID";
            v124 = 0;
            v127 = @"VPNUUID";
            uint64_t v28 = v26;
          }
          else
          {
            id v29 = [v24 relay];

            if (v29)
            {
              id v30 = [v24 relay];
              uint64_t v26 = [v30 perApp];

              v31 = @"RelayUUID";
              uint64_t v28 = 0;
              v124 = v26;
              v127 = @"RelayUUID";
            }
            else
            {
              uint64_t v32 = v23;
              long long v33 = [v24 contentFilter];
              long long v34 = [v33 perApp];
              if (v34) {
                [v24 contentFilter];
              }
              else {
              long long v35 = [v24 dnsProxy];
              }
              uint64_t v26 = [v35 perApp];

              long long v36 = [v24 contentFilter];
              long long v37 = [v36 perApp];
              long long v38 = @"ContentFilterUUID";
              if (!v37) {
                long long v38 = @"DNSProxyUUID";
              }
              v127 = v38;

              uint64_t v28 = 0;
              v124 = v26;
              id v18 = v133;
              uint64_t v23 = v32;
            }
          }
          uint64_t v39 = [(__CFString *)v26 copyAppRuleIDs];
          if (v39)
          {
            long long v40 = (void *)v39;
            uint64_t v120 = v23;
            uint64_t v41 = ne_log_obj();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              v63 = objc_opt_class();
              id v64 = v63;
              id v65 = [v118 name];
              *(_DWORD *)buf = v111;
              id v168 = v63;
              __int16 v169 = 2112;
              id v170 = v65;
              __int16 v171 = 2112;
              v172 = v130;
              __int16 v173 = 2112;
              v174 = v40;
              _os_log_debug_impl(&dword_19DDAF000, v41, OS_LOG_TYPE_DEBUG, "%@ updatePerAppMappingRules config %@ perAppUUID %@, existing appRules %@", buf, 0x2Au);
            }
            long long v149 = 0u;
            long long v150 = 0u;
            long long v147 = 0u;
            long long v148 = 0u;
            char v42 = v40;
            uint64_t v43 = [(__CFString *)v42 countByEnumeratingWithState:&v147 objects:v166 count:16];
            if (v43)
            {
              uint64_t v44 = v43;
              uint64_t v45 = *(void *)v148;
              do
              {
                uint64_t v46 = 0;
                do
                {
                  if (*(void *)v148 != v45) {
                    objc_enumerationMutation(v42);
                  }
                  id v47 = *(id *)(*((void *)&v147 + 1) + 8 * v46);
                  int v48 = v47;
                  if (!v18)
                  {

LABEL_49:
                    id v50 = [obj objectForKey:v48];
                    if ((-[NEProfileIngestion matchConfigAppUUID:configUUIDType:configAppUUID:]((uint64_t)v18, v50, v127, v130) & 1) == 0)[v122 addObject:v48]; {

                    }
                    goto LABEL_52;
                  }
                  if (isAutoCreatedRule__onceToken != -1) {
                    dispatch_once(&isAutoCreatedRule__onceToken, &__block_literal_global_20783);
                  }
                  char v49 = [(id)isAutoCreatedRule__autoRuleIdentifiers containsObject:v48];

                  if ((v49 & 1) == 0) {
                    goto LABEL_49;
                  }
LABEL_52:
                  ++v46;
                }
                while (v44 != v46);
                uint64_t v51 = [(__CFString *)v42 countByEnumeratingWithState:&v147 objects:v166 count:16];
                uint64_t v44 = v51;
              }
              while (v51);
            }

            long long v145 = 0u;
            long long v146 = 0u;
            long long v143 = 0u;
            long long v144 = 0u;
            id v52 = v122;
            uint64_t v53 = [v52 countByEnumeratingWithState:&v143 objects:v165 count:16];
            if (v53)
            {
              uint64_t v54 = v53;
              char v55 = 0;
              uint64_t v56 = *(void *)v144;
              do
              {
                for (uint64_t k = 0; k != v54; ++k)
                {
                  if (*(void *)v144 != v56) {
                    objc_enumerationMutation(v52);
                  }
                  uint64_t v58 = *(void **)(*((void *)&v143 + 1) + 8 * k);
                  v59 = ne_log_obj();
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v168 = v58;
                    _os_log_impl(&dword_19DDAF000, v59, OS_LOG_TYPE_DEFAULT, "updatePerAppMappingRules: Removing PerApp rule for identifier %@.", buf, 0xCu);
                  }

                  if (v28) {
                    v60 = v28;
                  }
                  else {
                    v60 = v124;
                  }
                  if ([(__CFString *)v60 removeAppRuleByID:v58])
                  {
                    char v55 = 1;
                  }
                  else
                  {
                    v61 = ne_log_obj();
                    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v168 = v58;
                      _os_log_error_impl(&dword_19DDAF000, v61, OS_LOG_TYPE_ERROR, "updatePerAppMappingRules: Could not remove perApp rule for identifier %@.", buf, 0xCu);
                    }
                  }
                }
                uint64_t v54 = [v52 countByEnumeratingWithState:&v143 objects:v165 count:16];
              }
              while (v54);

              id v18 = v133;
              if (v55) {
                -[NEProfileIngestion saveConfiguration:returnError:](v133, v118, 0);
              }
            }
            else
            {
            }
            id v62 = v124;
            uint64_t v22 = v112;
            uint64_t v21 = v114;
            uint64_t v23 = v120;
          }
          else
          {
            char v42 = v28;
            uint64_t v28 = v124;
            id v62 = v127;
          }
        }
        ++v23;
      }
      while (v23 != v21);
      uint64_t v21 = [v116 countByEnumeratingWithState:&v151 objects:v175 count:16];
    }
    while (v21);
  }

  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  id v117 = [(NEProfileIngestion *)v18 currentConfigurations];
  uint64_t v66 = [v117 countByEnumeratingWithState:&v139 objects:v164 count:16];
  if (!v66) {
    goto LABEL_132;
  }
  uint64_t v67 = v66;
  uint64_t v68 = *(void *)v140;
  uint64_t v113 = *(void *)v140;
  do
  {
    uint64_t v69 = 0;
    uint64_t v115 = v67;
    do
    {
      if (*(void *)v140 != v68) {
        objc_enumerationMutation(v117);
      }
      uint64_t v70 = *(void **)(*((void *)&v139 + 1) + 8 * v69);
      uint64_t v71 = [v70 externalIdentifier];
      if (v71)
      {
        v121 = [v6 objectForKeyedSubscript:v71];
        v72 = [v70 appVPN];

        if (v72)
        {
          uint64_t v132 = [v70 appVPN];
          v73 = @"VPNUUID";
          v74 = @"VPNUUID";
        }
        else
        {
          uint64_t v132 = 0;
          v73 = 0;
        }
        id v75 = [v70 contentFilter];

        if (v75)
        {
          id v76 = [v70 contentFilter];
          uint64_t v77 = [v76 perApp];

          if (!v77)
          {
            uint64_t v78 = objc_alloc_init(NEPerApp);
            uint64_t v79 = [v70 contentFilter];
            [v79 setPerApp:v78];
          }
          uint64_t v80 = v70;
          id v81 = [v70 contentFilter];
          uint64_t v82 = @"ContentFilterUUID";
          goto LABEL_102;
        }
        v83 = [v70 dnsProxy];

        if (v83)
        {
          uint64_t v84 = [v70 dnsProxy];
          id v85 = [v84 perApp];

          if (!v85)
          {
            v86 = objc_alloc_init(NEPerApp);
            long long v87 = [v70 dnsProxy];
            [v87 setPerApp:v86];
          }
          uint64_t v80 = v70;
          id v81 = [v70 dnsProxy];
          uint64_t v82 = @"DNSProxyUUID";
          goto LABEL_102;
        }
        long long v88 = [v70 relay];

        if (v88)
        {
          long long v89 = [v70 relay];
          long long v90 = [v89 perApp];

          if (!v90)
          {
            long long v91 = objc_alloc_init(NEPerApp);
            long long v92 = [v70 relay];
            [v92 setPerApp:v91];
          }
          uint64_t v80 = v70;
          id v81 = [v70 relay];
          uint64_t v82 = @"RelayUUID";
LABEL_102:
          uint64_t v93 = [v81 perApp];

          long long v94 = v82;
          v73 = v94;
          uint64_t v70 = v80;
        }
        else
        {
          uint64_t v93 = 0;
        }
        if (v132 | v93)
        {
          uint64_t v119 = v69;
          long long v137 = 0u;
          long long v138 = 0u;
          long long v135 = 0u;
          long long v136 = 0u;
          id v95 = v121;
          uint64_t v96 = [v95 countByEnumeratingWithState:&v135 objects:v163 count:16];
          if (v96)
          {
            uint64_t v97 = v96;
            v125 = (void *)v93;
            v128 = v70;
            char v123 = 0;
            uint64_t v98 = *(void *)v136;
            do
            {
              for (uint64_t m = 0; m != v97; ++m)
              {
                if (*(void *)v136 != v98) {
                  objc_enumerationMutation(v95);
                }
                long long v100 = *(void **)(*((void *)&v135 + 1) + 8 * m);
                long long v101 = [obj objectForKey:v100];
                if (-[NEProfileIngestion matchConfigAppUUID:configUUIDType:configAppUUID:]((uint64_t)v133, v101, v73, v71))
                {
                  long long v102 = (void *)v132;
                  if (!v132) {
                    long long v102 = v125;
                  }
                  long long v103 = [v102 copyAppRuleByID:v100];
                  if (!v103)
                  {
                    long long v104 = ne_log_obj();
                    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v168 = v100;
                      _os_log_impl(&dword_19DDAF000, v104, OS_LOG_TYPE_DEFAULT, "updatePerAppMappingRules: Adding PerApp rule for identifier %@.", buf, 0xCu);
                    }

                    if ([v128 setPerAppRuleSettings:MEMORY[0x1E4F1CC08] withAppIdentifier:v100])
                    {
                      long long v103 = 0;
                      char v123 = 1;
                    }
                    else
                    {
                      long long v105 = ne_log_obj();
                      if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        id v168 = v100;
                        _os_log_error_impl(&dword_19DDAF000, v105, OS_LOG_TYPE_ERROR, "updatePerAppMappingRules: Could not set PerApp rule for identifier %@", buf, 0xCu);
                      }

                      long long v103 = 0;
                    }
                  }
                }
                else
                {
                  long long v103 = ne_log_obj();
                  if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v168 = v100;
                    _os_log_impl(&dword_19DDAF000, v103, OS_LOG_TYPE_DEFAULT, "updatePerAppMappingRules: Add for appID %@ failed - UUID/type mismatch ", buf, 0xCu);
                  }
                }
              }
              uint64_t v97 = [v95 countByEnumeratingWithState:&v135 objects:v163 count:16];
            }
            while (v97);

            uint64_t v68 = v113;
            uint64_t v67 = v115;
            uint64_t v69 = v119;
            uint64_t v93 = (uint64_t)v125;
            if (v123) {
              -[NEProfileIngestion saveConfiguration:returnError:](v133, v128, 0);
            }
          }
          else
          {

            uint64_t v67 = v115;
            uint64_t v69 = v119;
          }
        }
      }
      ++v69;
    }
    while (v69 != v67);
    uint64_t v106 = [v117 countByEnumeratingWithState:&v139 objects:v164 count:16];
    uint64_t v67 = v106;
  }
  while (v106);
LABEL_132:

  return 1;
}

- (uint64_t)matchConfigAppUUID:(void *)a3 configUUIDType:(void *)a4 configAppUUID:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend(v10, "objectForKeyedSubscript:", v14, (void)v17);
          if ([v14 isEqual:v8] && objc_msgSend(v15, "isEqual:", v9))
          {

            uint64_t v11 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

void __40__NEProfileIngestion_isAutoCreatedRule___block_invoke()
{
  v0 = (void *)isAutoCreatedRule__autoRuleIdentifiers;
  isAutoCreatedRule__autoRuleIdentifiers = (uint64_t)&unk_1EF08D3F0;
}

- (void)enableDefaultService
{
  v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v3 = 0;
    _os_log_debug_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEBUG, "TO-DO: enableDefaultService: activate last service after removing current service", v3, 2u);
  }
}

- (void)unlockConfigurations
{
  v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v3 = 0;
    _os_log_debug_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEBUG, "TO-DO: unlockConfigurations", v3, 2u);
  }
}

- (BOOL)lockConfigurations
{
  v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_debug_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEBUG, "TO-DO: lockConfigurations", v4, 2u);
  }

  return 1;
}

- (BOOL)enableAlwaysOnVpn
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = (id)objc_opt_class();
    id v5 = v7;
    _os_log_debug_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_DEBUG, "%@ enableAlwaysOnVpn", (uint8_t *)&v6, 0xCu);
  }
  return -[NEProfileIngestion enableAlwaysOnVpnInternal:](self, 1);
}

- (uint64_t)enableAlwaysOnVpnInternal:(void *)a1
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v3 = a1;
  id v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v55 = (id)objc_opt_class();
    __int16 v56 = 1024;
    LODWORD(v57[0]) = a2;
    id v41 = v55;
    _os_log_debug_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEBUG, "%@ enableAlwaysOnVpnInternal with sanityCheck %d", buf, 0x12u);
  }
  [v3 loadConfigurationsForceReloadFromDisk];
  id v5 = [v3 currentConfigurations];

  if (v5)
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    int v6 = [v3 currentConfigurations];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      int v48 = a2;
      id v9 = 0;
      int v10 = 0;
      int v11 = 0;
      uint64_t v12 = *(void *)v51;
      char v49 = v3;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v51 != v12) {
            objc_enumerationMutation(v6);
          }
          id v14 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          uint64_t v15 = [v14 alwaysOnVPN];

          if (v15)
          {
            id v16 = v14;

            long long v17 = [v16 payloadInfo];
            int v18 = [v17 isSetAside];

            long long v19 = ne_log_obj();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              long long v20 = objc_opt_class();
              *(_DWORD *)buf = 138412546;
              id v55 = v20;
              __int16 v56 = 2112;
              v57[0] = v16;
              id v21 = v20;
              _os_log_debug_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_DEBUG, "%@ enableAlwaysOnVpnInternal: Always-On VPN configs found %@", buf, 0x16u);

              id v3 = v49;
            }
            ++v11;
            v10 += v18;

            id v9 = v16;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v50 objects:v58 count:16];
      }
      while (v8);

      if (v11 >= 2)
      {
        if (v48)
        {
          uint64_t v22 = ne_log_obj();
          uint64_t v23 = v22;
          if (v11 == 2 && v10 == 1)
          {
            if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
LABEL_28:

              goto LABEL_30;
            }
            id v24 = objc_opt_class();
            *(_DWORD *)buf = 138412802;
            id v55 = v24;
            __int16 v56 = 1024;
            LODWORD(v57[0]) = 2;
            WORD2(v57[0]) = 1024;
            *(_DWORD *)((char *)v57 + 6) = 1;
            id v25 = v24;
            uint64_t v26 = "%@ enableAlwaysOnVpnInternal: Sanity check OK, %d Always-On VPN configs found (%d set aside).";
            uint64_t v27 = v23;
            uint32_t v28 = 24;
LABEL_42:
            _os_log_debug_impl(&dword_19DDAF000, v27, OS_LOG_TYPE_DEBUG, v26, buf, v28);

            goto LABEL_28;
          }
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
LABEL_38:

            uint64_t v35 = 0;
            goto LABEL_31;
          }
          id v47 = objc_opt_class();
          *(_DWORD *)buf = 138412802;
          id v55 = v47;
          __int16 v56 = 1024;
          LODWORD(v57[0]) = v11;
          WORD2(v57[0]) = 1024;
          *(_DWORD *)((char *)v57 + 6) = v10;
          id v38 = v47;
          uint64_t v39 = "%@ enableAlwaysOnVpnInternal: Sanity check failed. %d Always-On VPN configs found (%d set aside). Enabli"
                "ng will be disallowed.";
        }
        else
        {
          uint64_t v23 = ne_log_obj();
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            goto LABEL_38;
          }
          long long v37 = objc_opt_class();
          *(_DWORD *)buf = 138412802;
          id v55 = v37;
          __int16 v56 = 1024;
          LODWORD(v57[0]) = v11;
          WORD2(v57[0]) = 1024;
          *(_DWORD *)((char *)v57 + 6) = v10;
          id v38 = v37;
          uint64_t v39 = "%@ enableAlwaysOnVpnInternal: %d Always-On VPN configs found (%d set aside), skip enabling new AOVpn configs.";
        }
        _os_log_error_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_ERROR, v39, buf, 0x18u);

        goto LABEL_38;
      }
      if (v9)
      {
        uint64_t v32 = [v9 alwaysOnVPN];
        char v33 = [v32 isEnabled];

        uint64_t v23 = ne_log_obj();
        BOOL v34 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
        if ((v33 & 1) == 0)
        {
          if (v34)
          {
            uint64_t v44 = objc_opt_class();
            uint64_t v45 = "";
            if (v48) {
              uint64_t v45 = " anyway";
            }
            *(_DWORD *)buf = 138412546;
            id v55 = v44;
            __int16 v56 = 2080;
            v57[0] = v45;
            id v46 = v44;
            _os_log_debug_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_DEBUG, "%@ enableAlwaysOnVpnInternal: enable the only Always-On VPN config%s.", buf, 0x16u);
          }
          long long v40 = [v9 alwaysOnVPN];
          uint64_t v35 = 1;
          [v40 setEnabled:1];

          -[NEProfileIngestion saveConfiguration:returnError:](v3, v9, 0);
          goto LABEL_31;
        }
        if (!v34) {
          goto LABEL_28;
        }
        uint64_t v43 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        id v55 = v43;
        id v25 = v43;
        uint64_t v26 = "%@ enableAlwaysOnVpnInternal: the only Always-On VPN config is already enabled.";
        uint64_t v27 = v23;
        uint32_t v28 = 12;
        goto LABEL_42;
      }
    }
    else
    {
    }
    id v9 = ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_30;
    }
    char v42 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v55 = v42;
    id v30 = v42;
    v31 = "%@ enableAlwaysOnVpnInternal: no Always-On VPN configs to enable";
LABEL_40:
    _os_log_debug_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_DEBUG, v31, buf, 0xCu);

    goto LABEL_30;
  }
  id v9 = ne_log_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v29 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v55 = v29;
    id v30 = v29;
    v31 = "%@ enableAlwaysOnVpnInternal: empty configuration database";
    goto LABEL_40;
  }
LABEL_30:
  uint64_t v35 = 1;
LABEL_31:

  return v35;
}

- (id)copyManagedConfigurationIDs
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(NEProfileIngestion *)self currentConfigurations];

  if (v4)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = [(NEProfileIngestion *)self currentConfigurations];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          int v11 = [v10 payloadInfo];
          uint64_t v12 = [v11 payloadUUID];

          if (v12)
          {
            uint64_t v13 = [v10 identifier];
            id v14 = [v13 UUIDString];
            [v3 addObject:v14];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
  }
  uint64_t v15 = (void *)[v3 copy];

  return v15;
}

- (BOOL)updateDefaultAfterDeletingConfiguration
{
  v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_debug_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEBUG, "To-DO: updateDefaultAfterDeletingConfiguration", v4, 2u);
  }

  return 1;
}

- (BOOL)updateDefaultAfterAddingConfiguration
{
  v2 = self;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v3 = [(NEProfileIngestion *)self ingestedConfiguration];
  id v4 = [v3 name];

  if (v4)
  {
    int v48 = v4;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v5 = [(NEProfileIngestion *)v2 currentConfigurations];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v56 objects:v64 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v57;
      long long v50 = v5;
      long long v51 = v2;
      uint64_t v49 = *(void *)v57;
LABEL_4:
      uint64_t v9 = 0;
      uint64_t v55 = v7;
      while (1)
      {
        if (*(void *)v57 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v56 + 1) + 8 * v9);
        uint64_t v11 = [v10 payloadInfo];
        if (!v11) {
          goto LABEL_13;
        }
        uint64_t v12 = (void *)v11;
        uint64_t v13 = [v10 payloadInfo];
        if (![v13 isSetAside]) {
          goto LABEL_11;
        }
        id v14 = [v10 identifier];
        uint64_t v15 = [(NEProfileIngestion *)v2 ingestedConfiguration];
        id v16 = [v15 identifier];
        if ([v14 isEqual:v16]) {
          break;
        }
        uint64_t v54 = [v10 payloadInfo];
        [v54 profileIdentifier];
        v17 = long long v52 = v14;
        long long v18 = [(NEProfileIngestion *)v2 ingestedConfiguration];
        long long v19 = [v18 payloadInfo];
        long long v20 = [v19 profileIdentifier];
        int v53 = [v17 isEqualToString:v20];

        id v5 = v50;
        uint64_t v8 = v49;

        v2 = v51;
        uint64_t v7 = v55;
        if (!v53) {
          goto LABEL_13;
        }
        id v21 = [(NEProfileIngestion *)v51 ingestedConfiguration];
        uint64_t v22 = [v21 name];
        uint64_t v23 = [v10 identifier];
        id v24 = [(id)v23 UUIDString];
        uint64_t v12 = [v22 stringByAppendingString:v24];

        id v25 = [v10 name];
        LOBYTE(v23) = [v25 isEqualToString:v12];

        if (v23)
        {
          uint64_t v27 = v10;

          v2 = v51;
          if (!v27) {
            goto LABEL_25;
          }
          id v30 = [v27 VPN];
          if (v30) {
            [v27 VPN];
          }
          else {
          char v33 = [v27 appVPN];
          }

          BOOL v34 = [(NEProfileIngestion *)v51 ingestedConfiguration];
          uint64_t v35 = [v34 VPN];
          long long v36 = [(NEProfileIngestion *)v51 ingestedConfiguration];
          long long v37 = v36;
          if (v35) {
            [v36 VPN];
          }
          else {
          id v38 = [v36 appVPN];
          }

          if (v33
            && v38
            && (uint64_t v39 = objc_opt_class(), [v39 isEqual:objc_opt_class()]))
          {
            long long v40 = ne_log_obj();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              id v41 = [(NEProfileIngestion *)v51 ingestedConfiguration];
              char v42 = [v41 name];
              int v43 = [v33 isOnDemandEnabled];
              *(_DWORD *)buf = 138412546;
              v61 = v42;
              __int16 v62 = 1024;
              int v63 = v43;
              _os_log_impl(&dword_19DDAF000, v40, OS_LOG_TYPE_DEFAULT, "%@: Using onDemandEnabled setting from set-aside configuration (%d)", buf, 0x12u);
            }
            objc_msgSend(v38, "setOnDemandEnabled:", objc_msgSend(v33, "isOnDemandEnabled"));
          }
          else
          {
            uint64_t v44 = ne_log_obj();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v45 = [(NEProfileIngestion *)v51 ingestedConfiguration];
              id v46 = [v45 name];
              *(_DWORD *)buf = 138412290;
              v61 = v46;
              _os_log_impl(&dword_19DDAF000, v44, OS_LOG_TYPE_DEFAULT, "%@: VPN type mis-match with set-aside configuration", buf, 0xCu);
            }
          }

          goto LABEL_41;
        }
        id v5 = v50;
        v2 = v51;
        uint64_t v8 = v49;
LABEL_12:

LABEL_13:
        if (v7 == ++v9)
        {
          uint64_t v26 = [v5 countByEnumeratingWithState:&v56 objects:v64 count:16];
          uint64_t v7 = v26;
          if (v26) {
            goto LABEL_4;
          }
          goto LABEL_19;
        }
      }

      uint64_t v7 = v55;
LABEL_11:

      goto LABEL_12;
    }
LABEL_19:

LABEL_25:
    uint64_t v27 = ne_log_obj();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v31 = [(NEProfileIngestion *)v2 ingestedConfiguration];
      uint64_t v32 = [v31 name];
      *(_DWORD *)buf = 138412290;
      v61 = v32;
      _os_log_impl(&dword_19DDAF000, v27, OS_LOG_TYPE_DEFAULT, "%@: No set-aside configuration", buf, 0xCu);
    }
LABEL_41:
    id v4 = v48;
  }
  else
  {
    uint64_t v27 = ne_log_obj();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint32_t v28 = [(NEProfileIngestion *)v2 ingestedConfiguration];
      id v29 = [v28 identifier];
      *(_DWORD *)buf = 138412290;
      v61 = v29;
      _os_log_error_impl(&dword_19DDAF000, v27, OS_LOG_TYPE_ERROR, "The ingested configuration (%@) has no name, cannot update from the set aside version of the configuration", buf, 0xCu);
    }
  }

  return v4 != 0;
}

- (BOOL)removeIngestedConfiguration
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(NEProfileIngestion *)self ingestedConfiguration];

  if (!v3)
  {
    uint64_t v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      id v10 = (id)objc_opt_class();
      id v8 = v10;
      _os_log_debug_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_DEBUG, "%@ removeIngestedConfiguration skipped: current configuration does not exist", (uint8_t *)&v9, 0xCu);
    }
    return 1;
  }
  id v4 = [(NEProfileIngestion *)self ingestedConfiguration];
  BOOL v5 = [(NEProfileIngestion *)self removeConfiguration:v4];

  if (v5)
  {
    [(NEProfileIngestion *)self setIngestedConfiguration:0];
    return 1;
  }
  return 0;
}

- (id)getCertificatesForConfigurationWithIdentifier:(id)a3
{
  id v3 = [(NEProfileIngestion *)self findConfigurationByConfigurationID:a3];
  id v4 = [v3 getCertificates];

  return v4;
}

- (BOOL)removeConfigurationWithIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(NEProfileIngestion *)self findConfigurationByConfigurationID:v4];
  if (v5)
  {
    [(NEProfileIngestion *)self removeConfiguration:v5];
  }
  else
  {
    uint64_t v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412546;
      id v10 = (id)objc_opt_class();
      __int16 v11 = 2112;
      id v12 = v4;
      id v8 = v10;
      _os_log_debug_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_DEBUG, "%@ removeConfigurationWithIdentifier failed: no configuration found with id %@", (uint8_t *)&v9, 0x16u);
    }
  }

  return 1;
}

- (BOOL)removeConfiguration:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 payloadInfo];
  int v38 = [v5 isSetAside];

  uint64_t v42 = 0;
  int v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  if (v4)
  {
    uint64_t v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v29 = (id)objc_opt_class();
      id v30 = [v4 name];
      *(_DWORD *)buf = 138412546;
      id v47 = v29;
      __int16 v48 = 2112;
      uint64_t v49 = v30;
      _os_log_debug_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_DEBUG, "%@ removeConfiguration: '%@'", buf, 0x16u);
    }
    uint64_t v7 = [(NEProfileIngestion *)self manager];
    uint64_t v8 = MEMORY[0x1E4F14428];
    id v9 = MEMORY[0x1E4F14428];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __42__NEProfileIngestion_removeConfiguration___block_invoke;
    v39[3] = &unk_1E5992F00;
    id v10 = v4;
    long long v40 = v10;
    id v41 = &v42;
    [v7 removeConfiguration:v10 withCompletionQueue:v8 handler:v39];

    __int16 v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v31 = (id)objc_opt_class();
      uint64_t v32 = [v10 name];
      int v33 = *((unsigned __int8 *)v43 + 24);
      *(_DWORD *)buf = 138412802;
      id v47 = v31;
      __int16 v48 = 2112;
      uint64_t v49 = v32;
      __int16 v50 = 1024;
      int v51 = v33;
      _os_log_debug_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_DEBUG, "%@ removeConfiguration '%@', ouint64_t k = %d", buf, 0x1Cu);
    }
    id v12 = [(NEProfileIngestion *)self currentConfigurations];
    BOOL v13 = v12 == 0;

    if (!v13)
    {
      for (unint64_t i = 0; ; ++i)
      {
        uint64_t v15 = [(NEProfileIngestion *)self currentConfigurations];
        BOOL v16 = i < [v15 count];

        if (!v16) {
          break;
        }
        long long v17 = [(NEProfileIngestion *)self currentConfigurations];
        long long v18 = [v17 objectAtIndex:i];

        long long v19 = [v18 identifier];
        long long v20 = [v19 UUIDString];
        id v21 = [v10 identifier];
        uint64_t v22 = [v21 UUIDString];
        int v23 = [v20 isEqualToString:v22];

        if (v23)
        {
          uint64_t v26 = [(NEProfileIngestion *)self currentConfigurations];
          [v26 removeObjectAtIndex:i];

          uint64_t v27 = ne_log_obj();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            id v36 = (id)objc_opt_class();
            long long v37 = [v10 name];
            *(_DWORD *)buf = 138412546;
            id v47 = v36;
            __int16 v48 = 2112;
            uint64_t v49 = v37;
            _os_log_debug_impl(&dword_19DDAF000, v27, OS_LOG_TYPE_DEBUG, "%@ removeConfiguration '%@' from cached list", buf, 0x16u);
          }
          break;
        }
      }
    }
    if (v38) {
      -[NEProfileIngestion enableAlwaysOnVpnInternal:](self, 0);
    }
    BOOL v25 = *((unsigned char *)v43 + 24) != 0;
    id v24 = v40;
  }
  else
  {
    id v24 = ne_log_obj();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      BOOL v34 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v47 = v34;
      id v35 = v34;
      _os_log_debug_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_DEBUG, "%@ removeConfiguration skipped: empty configuration.", buf, 0xCu);
    }
    BOOL v25 = 1;
  }

  _Block_object_dispose(&v42, 8);
  return v25;
}

void __42__NEProfileIngestion_removeConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      BOOL v5 = [*(id *)(a1 + 32) name];
      uint64_t v6 = convert_error_to_string(v3);
      int v7 = 138412546;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      id v10 = v6;
      _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "Error occurred when removing configurations '%@': %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)saveIngestedConfiguration:(id *)a3
{
  BOOL v5 = [(NEProfileIngestion *)self ingestedConfiguration];
  LOBYTE(a3) = -[NEProfileIngestion saveConfiguration:returnError:](self, v5, a3);

  return (char)a3;
}

- (BOOL)saveIngestedConfiguration
{
  v2 = self;
  id v3 = [(NEProfileIngestion *)self ingestedConfiguration];
  LOBYTE(v2) = -[NEProfileIngestion saveConfiguration:returnError:](v2, v3, 0);

  return (char)v2;
}

- (BOOL)createConfigurationFromPayload:(id)a3 payloadType:(id)a4
{
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 payloadAtom];
  __int16 v9 = [v8 objectForKeyedSubscript:@"UserDefinedName"];
  id v10 = [v8 objectForKeyedSubscript:@"VPNSubType"];
  if (!v9)
  {
    __int16 v9 = [v8 objectForKeyedSubscript:@"PayloadDisplayName"];
    if (!v9)
    {
      if ([v7 isEqualToString:@"com.apple.webcontent-filter"])
      {
        uint64_t v11 = kNECFPluginBundleIDKey;
      }
      else
      {
        int v12 = [v7 isEqualToString:@"com.apple.dnsProxy.managed"];
        uint64_t v11 = kNEVPNTypeKey;
        if (v12) {
          uint64_t v11 = &kNEDNSProxyAppBundleIdentifierKey;
        }
      }
      __int16 v9 = [v8 objectForKeyedSubscript:*v11];
    }
  }
  BOOL v13 = ne_log_obj();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v158 = v7;
    __int16 v159 = 2112;
    long long v160 = v9;
    _os_log_debug_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_DEBUG, "createConfigurationFromPayload type %@, name '%@'", buf, 0x16u);
  }

  uint64_t v14 = [(NEProfileIngestion *)self findConfigurationByName:v9];
  uint64_t v15 = (void *)v14;
  uint64_t v129 = self;
  if (!v14) {
    goto LABEL_130;
  }
  char v123 = (void *)v14;
  uint64_t v126 = v10;
  BOOL v16 = v9;
  long long v17 = self;
  long long v18 = v16;
  v118 = v8;
  id v120 = v6;
  if (v17)
  {
    long long v19 = [v16 componentsSeparatedByString:@" "];
    unint64_t v20 = [v19 count];
    unint64_t v21 = v20 - 1;
    if (v20 > 1)
    {
      id v24 = v7;
      BOOL v25 = [v19 objectAtIndex:v21];
      uint64_t v26 = [v25 length];
      uint64_t v27 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789 "];
      uint32_t v28 = [v25 stringByTrimmingCharactersInSet:v27];

      if ([v28 length])
      {
        uint64_t v22 = v18;
        uint64_t v23 = 0;
      }
      else
      {
        id v29 = [v19 objectAtIndex:v21];
        uint64_t v23 = (int)[v29 intValue];

        objc_msgSend(v18, "substringToIndex:", objc_msgSend(v18, "length") - v26);
        uint64_t v22 = (char *)objc_claimAutoreleasedReturnValue();
      }

      id v7 = v24;
    }
    else
    {
      uint64_t v22 = v18;
      uint64_t v23 = 0;
    }
    id v30 = [(NEProfileIngestion *)v129 currentConfigurations];

    if (v30)
    {
      id v31 = 0;
      uint64_t v32 = v23 + 1;
      do
      {
        objc_msgSend(v22, "stringByAppendingFormat:", @" %ld", v32);
        __int16 v9 = (char *)objc_claimAutoreleasedReturnValue();

        int v33 = [(NEProfileIngestion *)v129 findConfigurationByName:v9];

        ++v32;
        id v31 = v9;
      }
      while (v33);
    }
    else
    {
      BOOL v34 = ne_log_obj();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19DDAF000, v34, OS_LOG_TYPE_ERROR, "resolveConfigurationNameConflict system configurations disappeared", buf, 2u);
      }

      __int16 v9 = 0;
    }
  }
  else
  {
    __int16 v9 = 0;
  }

  id v35 = ne_log_obj();
  uint64_t v8 = v118;
  id v6 = v120;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v84 = objc_opt_class();
    *(_DWORD *)buf = 138412802;
    id v158 = v84;
    __int16 v159 = 2112;
    long long v160 = v18;
    __int16 v161 = 2112;
    long long v162 = v9;
    id v85 = v84;
    _os_log_debug_impl(&dword_19DDAF000, v35, OS_LOG_TYPE_DEBUG, "%@ createConfigurationFromPayload: rename %@ to %@", buf, 0x20u);
  }
  uint64_t v15 = v123;
  id v10 = v126;
  self = v129;
  if (v9)
  {
LABEL_130:
    if (isa_nsstring(v10)
      && +[NETunnelProviderProtocol isLegacyPluginType:v10])
    {
      id v36 = [(NEProfileIngestion *)self manager];
      v150[0] = MEMORY[0x1E4F143A8];
      v150[1] = 3221225472;
      v150[2] = __65__NEProfileIngestion_createConfigurationFromPayload_payloadType___block_invoke;
      v150[3] = &unk_1E59928F8;
      id v151 = v6;
      [v36 fetchUpgradeInfoForPluginType:v10 completionQueue:MEMORY[0x1E4F14428] handler:v150];
    }
    if ([v7 isEqualToString:@"com.apple.vpn.managed"])
    {
      long long v37 = [v8 objectForKeyedSubscript:@"VPNType"];
      int v38 = [v37 isEqualToString:@"PPTP"];

      if (v38)
      {
        uint64_t v39 = ne_log_obj();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_19DDAF000, v39, OS_LOG_TYPE_DEBUG, "ingesting PPTP not supported", buf, 2u);
        }

        [(NEProfileIngestion *)self setIngestedConfiguration:0];
        BOOL v40 = 1;
LABEL_57:

        goto LABEL_58;
      }
      id v117 = v7;
      id v54 = v6;
      uint64_t v55 = -[NEConfiguration initWithVPNPayload:configurationName:grade:]([NEConfiguration alloc], v6, v9, 1);
      goto LABEL_54;
    }
    if ([v7 isEqualToString:@"com.apple.vpn.managed.alwayson"])
    {
      id v41 = [(NEProfileIngestion *)self currentConfigurations];

      if (v41)
      {
        id v121 = v6;
        v124 = v15;
        v127 = v10;
        uint64_t v42 = v8;
        id v43 = v7;
        long long v148 = 0u;
        long long v149 = 0u;
        long long v146 = 0u;
        long long v147 = 0u;
        uint64_t v44 = [(NEProfileIngestion *)self currentConfigurations];
        uint64_t v45 = [v44 countByEnumeratingWithState:&v146 objects:v156 count:16];
        if (v45)
        {
          uint64_t v46 = v45;
          uint64_t v47 = *(void *)v147;
          while (2)
          {
            for (uint64_t i = 0; i != v46; ++i)
            {
              if (*(void *)v147 != v47) {
                objc_enumerationMutation(v44);
              }
              uint64_t v49 = *(void **)(*((void *)&v146 + 1) + 8 * i);
              uint64_t v50 = [v49 alwaysOnVPN];
              if (v50)
              {
                int v51 = (void *)v50;
                uint64_t v52 = [v49 payloadInfo];
                char v53 = [v52 isSetAside];

                if ((v53 & 1) == 0)
                {
                  v83 = ne_log_obj();
                  if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v114 = objc_opt_class();
                    *(_DWORD *)buf = 138412290;
                    id v158 = v114;
                    id v115 = v114;
                    _os_log_error_impl(&dword_19DDAF000, v83, OS_LOG_TYPE_ERROR, "%@ createConfigurationFromPayload: installations of multiple Always-On VPN configs are not allowed.", buf, 0xCu);
                  }
                  BOOL v40 = 0;
                  id v7 = v43;
                  uint64_t v8 = v42;
                  uint64_t v15 = v124;
                  id v10 = v127;
                  id v6 = v121;
                  goto LABEL_57;
                }
              }
            }
            uint64_t v46 = [v44 countByEnumeratingWithState:&v146 objects:v156 count:16];
            if (v46) {
              continue;
            }
            break;
          }
        }

        id v7 = v43;
        uint64_t v8 = v42;
        uint64_t v15 = v124;
        id v10 = v127;
        self = v129;
        id v6 = v121;
      }
      id v117 = v7;
      id v54 = v6;
      uint64_t v55 = -[NEConfiguration initWithAlwaysOnVPNPayload:configurationName:grade:]((__CFString *)[NEConfiguration alloc], v6, v9, 1);
      goto LABEL_54;
    }
    id v117 = v7;
    if ([v7 isEqualToString:@"com.apple.vpn.managed.applayer"])
    {
      id v54 = v6;
      uint64_t v55 = -[NEConfiguration initWithAppLayerVPNPayload:configurationName:grade:]([NEConfiguration alloc], v6, v9, 1);
LABEL_54:
      id v56 = v55;
      [(NEProfileIngestion *)self setIngestedConfiguration:v55];
LABEL_55:

      long long v57 = [(NEProfileIngestion *)self ingestedConfiguration];
      BOOL v40 = v57 != 0;

      long long v58 = ne_log_obj();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      {
        v86 = objc_opt_class();
        long long v87 = "no";
        if (v57) {
          long long v87 = "yes";
        }
        *(_DWORD *)buf = 138412546;
        id v158 = v86;
        __int16 v159 = 2080;
        long long v160 = v87;
        id v88 = v86;
        _os_log_debug_impl(&dword_19DDAF000, v58, OS_LOG_TYPE_DEBUG, "%@ createConfigurationFromPayload: configuration created (%s)", buf, 0x16u);
      }
      id v6 = v54;
      id v7 = v117;
      goto LABEL_57;
    }
    if ([v7 isEqualToString:@"com.apple.webcontent-filter"])
    {
      v125 = v15;
      v128 = v10;
      uint64_t v119 = v8;
      id v60 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v61 = [(NEProfileIngestion *)self currentConfigurations];

      if (v61)
      {
        long long v144 = 0u;
        long long v145 = 0u;
        long long v142 = 0u;
        long long v143 = 0u;
        __int16 v62 = [(NEProfileIngestion *)self currentConfigurations];
        uint64_t v63 = [v62 countByEnumeratingWithState:&v142 objects:v155 count:16];
        if (v63)
        {
          uint64_t v64 = v63;
          uint64_t v65 = *(void *)v143;
          do
          {
            for (uint64_t j = 0; j != v64; ++j)
            {
              if (*(void *)v143 != v65) {
                objc_enumerationMutation(v62);
              }
              uint64_t v67 = *(void **)(*((void *)&v142 + 1) + 8 * j);
              uint64_t v68 = [v67 contentFilter];

              if (v68)
              {
                uint64_t v69 = [v67 payloadInfo];

                if (!v69) {
                  [v60 addObject:v67];
                }
              }
            }
            uint64_t v64 = [v62 countByEnumeratingWithState:&v142 objects:v155 count:16];
          }
          while (v64);
        }

        self = v129;
      }
      uint64_t v70 = -[NEConfiguration initWithContentFilterPayload:configurationName:grade:]([NEConfiguration alloc], v6, v9, 1);
      [(NEProfileIngestion *)self setIngestedConfiguration:v70];

      uint64_t v71 = [(NEProfileIngestion *)self ingestedConfiguration];

      if (!v71)
      {
        id v54 = v6;
        uint64_t v8 = v119;
        id v10 = v128;
        id v56 = v60;
        goto LABEL_118;
      }
      id v122 = v6;
      v72 = [(NEProfileIngestion *)self ingestedConfiguration];
      [v72 setName:v9];

      long long v140 = 0u;
      long long v141 = 0u;
      long long v138 = 0u;
      long long v139 = 0u;
      id v73 = v60;
      uint64_t v74 = [v73 countByEnumeratingWithState:&v138 objects:v154 count:16];
      if (v74)
      {
        uint64_t v75 = v74;
        uint64_t v76 = *(void *)v139;
        do
        {
          for (uint64_t k = 0; k != v75; ++k)
          {
            if (*(void *)v139 != v76) {
              objc_enumerationMutation(v73);
            }
            uint64_t v78 = *(void **)(*((void *)&v138 + 1) + 8 * k);
            uint64_t v79 = ne_log_obj();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v80 = objc_opt_class();
              id v81 = v80;
              uint64_t v82 = [v78 identifier];
              *(_DWORD *)buf = 138412546;
              id v158 = v80;
              __int16 v159 = 2112;
              long long v160 = v82;
              _os_log_impl(&dword_19DDAF000, v79, OS_LOG_TYPE_DEFAULT, "%@ createConfigurationFromPayload: Removing overridden content filter configuration %@.", buf, 0x16u);

              self = v129;
            }

            [(NEProfileIngestion *)self removeConfiguration:v78];
          }
          uint64_t v75 = [v73 countByEnumeratingWithState:&v138 objects:v154 count:16];
        }
        while (v75);
      }
      id v56 = v73;
    }
    else
    {
      if ([v7 isEqualToString:@"com.apple.networkusagerules"])
      {
        id v54 = v6;
        uint64_t v55 = -[NEConfiguration initWithPathControllerPayload:configurationName:grade:]([NEConfiguration alloc], v6, v9, 1);
        goto LABEL_54;
      }
      if (![v7 isEqualToString:@"com.apple.dnsProxy.managed"])
      {
        if ([v7 isEqualToString:@"com.apple.dnsSettings.managed"])
        {
          id v54 = v6;
          uint64_t v55 = -[NEConfiguration initWithDNSSettingsPayload:configurationName:grade:]([NEConfiguration alloc], v6, v9, 2);
        }
        else
        {
          if (![v7 isEqualToString:@"com.apple.relay.managed"])
          {
            id v116 = ne_log_obj();
            if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v158 = v7;
              _os_log_error_impl(&dword_19DDAF000, v116, OS_LOG_TYPE_ERROR, "NEProfileIngestion createConfigurationFromPayload: unsupported payload type '%@'", buf, 0xCu);
            }

            BOOL v40 = 0;
            goto LABEL_57;
          }
          id v54 = v6;
          uint64_t v55 = -[NEConfiguration initWithRelayPayload:configurationName:grade:]([NEConfiguration alloc], v6, v9, 1);
        }
        goto LABEL_54;
      }
      v125 = v15;
      v128 = v10;
      uint64_t v119 = v8;
      long long v89 = v6;
      id v56 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v90 = [(NEProfileIngestion *)self currentConfigurations];

      if (v90)
      {
        long long v91 = self;
        long long v92 = v89;
        long long v136 = 0u;
        long long v137 = 0u;
        long long v134 = 0u;
        long long v135 = 0u;
        uint64_t v93 = [(NEProfileIngestion *)v91 currentConfigurations];
        uint64_t v94 = [v93 countByEnumeratingWithState:&v134 objects:v153 count:16];
        if (v94)
        {
          uint64_t v95 = v94;
          uint64_t v96 = *(void *)v135;
          do
          {
            for (uint64_t m = 0; m != v95; ++m)
            {
              if (*(void *)v135 != v96) {
                objc_enumerationMutation(v93);
              }
              uint64_t v98 = *(void **)(*((void *)&v134 + 1) + 8 * m);
              uint64_t v99 = [v98 dnsProxy];
              if (v99)
              {
                long long v100 = (void *)v99;
                long long v101 = [v98 payloadInfo];

                if (!v101) {
                  [v56 addObject:v98];
                }
              }
            }
            uint64_t v95 = [v93 countByEnumeratingWithState:&v134 objects:v153 count:16];
          }
          while (v95);
        }

        long long v89 = v92;
        self = v129;
      }
      id v102 = -[NEConfiguration initWithDNSProxyPayload:configurationName:grade:]([NEConfiguration alloc], v89, v9);
      [(NEProfileIngestion *)self setIngestedConfiguration:v102];

      long long v103 = [(NEProfileIngestion *)self ingestedConfiguration];

      if (!v103)
      {
        id v54 = v89;
        goto LABEL_84;
      }
      id v122 = v89;
      long long v104 = [(NEProfileIngestion *)self ingestedConfiguration];
      [v104 setName:v9];

      long long v132 = 0u;
      long long v133 = 0u;
      long long v130 = 0u;
      long long v131 = 0u;
      id v56 = v56;
      uint64_t v105 = [v56 countByEnumeratingWithState:&v130 objects:v152 count:16];
      if (v105)
      {
        uint64_t v106 = v105;
        uint64_t v107 = *(void *)v131;
        do
        {
          for (uint64_t n = 0; n != v106; ++n)
          {
            if (*(void *)v131 != v107) {
              objc_enumerationMutation(v56);
            }
            v109 = *(void **)(*((void *)&v130 + 1) + 8 * n);
            id v110 = ne_log_obj();
            if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
            {
              long long v111 = objc_opt_class();
              id v112 = v111;
              uint64_t v113 = [v109 identifier];
              *(_DWORD *)buf = 138412546;
              id v158 = v111;
              __int16 v159 = 2112;
              long long v160 = v113;
              _os_log_impl(&dword_19DDAF000, v110, OS_LOG_TYPE_INFO, "%@ createConfigurationFromPayload: Removing overridden DNS proxy configuration %@.", buf, 0x16u);

              self = v129;
            }

            [(NEProfileIngestion *)self removeConfiguration:v109];
          }
          uint64_t v106 = [v56 countByEnumeratingWithState:&v130 objects:v152 count:16];
        }
        while (v106);
      }
    }

    id v54 = v122;
LABEL_84:
    uint64_t v8 = v119;
    id v10 = v128;
LABEL_118:
    uint64_t v15 = v125;
    goto LABEL_55;
  }
  BOOL v40 = 0;
LABEL_58:

  return v40;
}

uint64_t __65__NEProfileIngestion_createConfigurationFromPayload_payloadType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setPluginUpgradeInfo:a2];
}

- (void)removeAllConfigurationsWithPayload:(id)a3 profile:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if isa_nsstring(v6) && (isa_nsstring(v7))
  {
    uint64_t v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v38 = v6;
      __int16 v39 = 2112;
      id v40 = v7;
      _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEFAULT, "Removing existing configurations with payload UUID %@ and profile UUID %@", buf, 0x16u);
    }

    __int16 v9 = (void *)MEMORY[0x1E4F28F60];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __65__NEProfileIngestion_removeAllConfigurationsWithPayload_profile___block_invoke;
    v33[3] = &unk_1E5992898;
    id v28 = v6;
    BOOL v34 = v6;
    id v27 = v7;
    id v35 = v7;
    uint64_t v10 = [v9 predicateWithBlock:v33];
    uint64_t v11 = [(NEProfileIngestion *)self currentConfigurations];
    uint64_t v26 = (void *)v10;
    int v12 = [v11 filteredArrayUsingPredicate:v10];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = *(void **)(*((void *)&v29 + 1) + 8 * v17);
          BOOL v19 = [(NEProfileIngestion *)self removeConfiguration:v18];
          unint64_t v20 = ne_log_obj();
          unint64_t v21 = v20;
          if (v19)
          {
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_15;
            }
            uint64_t v22 = [v18 name];
            uint64_t v23 = [v18 identifier];
            *(_DWORD *)buf = 138412546;
            id v38 = v22;
            __int16 v39 = 2112;
            id v40 = v23;
            _os_log_impl(&dword_19DDAF000, v21, OS_LOG_TYPE_DEFAULT, "Removed duplicate configuration %@ (%@)", buf, 0x16u);
            goto LABEL_13;
          }
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            uint64_t v22 = [v18 name];
            uint64_t v23 = [v18 identifier];
            *(_DWORD *)buf = 138412546;
            id v38 = v22;
            __int16 v39 = 2112;
            id v40 = v23;
            _os_log_error_impl(&dword_19DDAF000, v21, OS_LOG_TYPE_ERROR, "Failed to remove duplicate configuration %@ (%@)", buf, 0x16u);
LABEL_13:
          }
LABEL_15:

          ++v17;
        }
        while (v15 != v17);
        uint64_t v24 = [v13 countByEnumeratingWithState:&v29 objects:v36 count:16];
        uint64_t v15 = v24;
      }
      while (v24);
    }

    BOOL v25 = v34;
    id v7 = v27;
    id v6 = v28;
  }
  else
  {
    BOOL v25 = ne_log_obj();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v38 = v6;
      __int16 v39 = 2112;
      id v40 = v7;
      _os_log_error_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_ERROR, "Payload UUID (%@) and/or profile UUID (%@) is invalid", buf, 0x16u);
    }
  }
}

uint64_t __65__NEProfileIngestion_removeAllConfigurationsWithPayload_profile___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 payloadInfo];
    if (v4)
    {
      BOOL v5 = [v3 payloadInfo];
      id v6 = [v5 payloadUUID];
      if ([v6 isEqualToString:*(void *)(a1 + 32)])
      {
        id v7 = [v3 payloadInfo];
        uint64_t v8 = [v7 profileUUID];
        uint64_t v9 = [v8 isEqualToString:*(void *)(a1 + 40)];
      }
      else
      {
        uint64_t v9 = 0;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)isInstalled:(id)a3
{
  id v3 = [(NEProfileIngestion *)self findConfigurationByPayloadUUID:a3];

  return v3 != 0;
}

- (id)findConfigurationByConfigurationID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = v4;
  if (v4 && [v4 length])
  {
    id v6 = [(NEProfileIngestion *)self currentConfigurations];

    if (!v6) {
      goto LABEL_17;
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = [(NEProfileIngestion *)self currentConfigurations];
    id v6 = (id)[v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v6)
    {
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v7);
          }
          uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v11 = [v10 identifier];
          int v12 = [v11 UUIDString];
          char v13 = [v12 isEqualToString:v5];

          if (v13)
          {
            id v6 = v10;
            goto LABEL_16;
          }
        }
        id v6 = (id)[v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    id v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_DEBUG, "findConfigurationByConfigurationID failed: empty identifier", buf, 2u);
    }
    id v6 = 0;
  }
LABEL_16:

LABEL_17:

  return v6;
}

- (id)findConfigurationByPayloadUUID:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v4;
    _os_log_debug_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEBUG, "findConfigurationByPayloadUUID for payloadUUID %@", buf, 0xCu);
  }

  id v6 = [(NEProfileIngestion *)self currentConfigurations];

  if (v6)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = [(NEProfileIngestion *)self currentConfigurations];
    id v6 = (id)[v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v6)
    {
      uint64_t v8 = *(void *)v23;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v7);
          }
          uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v9);
          uint64_t v11 = ne_log_obj();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            long long v17 = [v10 payloadInfo];
            if (v17)
            {
              long long v18 = [v10 payloadInfo];
              BOOL v19 = [v18 payloadUUID];
              *(_DWORD *)buf = 138412290;
              id v28 = v19;
              _os_log_debug_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_DEBUG, "findConfigurationByPayloadUUID check config with payloadUUID %@", buf, 0xCu);
            }
            else
            {
              *(_DWORD *)buf = 138412290;
              id v28 = 0;
              _os_log_debug_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_DEBUG, "findConfigurationByPayloadUUID check config with payloadUUID %@", buf, 0xCu);
            }
          }
          uint64_t v12 = [v10 payloadInfo];
          if (v12)
          {
            char v13 = (void *)v12;
            uint64_t v14 = [v10 payloadInfo];
            long long v15 = [v14 payloadUUID];
            char v16 = [v15 isEqualToString:v4];

            if (v16)
            {
              id v6 = v10;
              goto LABEL_21;
            }
          }
          uint64_t v9 = (char *)v9 + 1;
        }
        while (v6 != v9);
        uint64_t v20 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
        id v6 = (id)v20;
      }
      while (v20);
    }
LABEL_21:
  }

  return v6;
}

- (id)setAsideConfigurationName:(id)a3 unsetAside:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(NEProfileIngestion *)self findConfigurationByConfigurationID:v6];
  uint64_t v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 138412802;
    *(void *)id v27 = v6;
    *(_WORD *)&v27[8] = 1024;
    *(_DWORD *)&v27[10] = v4;
    __int16 v28 = 2112;
    uint64_t v29 = v7;
    _os_log_debug_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEBUG, "setAsideConfigurationName: configID %@, unset %d, configurations %@", (uint8_t *)&v26, 0x1Cu);
  }

  if (!v7)
  {
    char v16 = ne_log_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v26 = 138412290;
      *(void *)id v27 = v6;
      _os_log_debug_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_DEBUG, "setAsideConfigurationName can't find configuration of ID  %@", (uint8_t *)&v26, 0xCu);
    }
    goto LABEL_16;
  }
  uint64_t v9 = [v7 name];
  uint64_t v10 = v9;
  if (v4)
  {
    int v11 = [v9 hasSuffix:v6];

    if (!v11)
    {
      char v16 = ne_log_obj();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v26 = 138412290;
        *(void *)id v27 = v6;
        long long v17 = "setAsideConfigurationName: unset-aside failed. Name '%@' is not a set-aside name";
        goto LABEL_28;
      }
LABEL_16:
      id v21 = 0;
      goto LABEL_17;
    }
    uint64_t v12 = [v7 name];
    uint64_t v13 = [v12 length];
    uint64_t v14 = [v6 length];

    uint64_t v15 = v13 - v14;
    if (v13 == v14)
    {
      char v16 = ne_log_obj();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v26 = 138412290;
        *(void *)id v27 = v6;
        long long v17 = "setAsideConfigurationName: unset-aside failed. Name '%@' would be empty after unset-aside";
LABEL_28:
        _os_log_error_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v26, 0xCu);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
    uint64_t v10 = [v7 name];
    uint64_t v18 = [v10 substringToIndex:v15];
  }
  else
  {
    uint64_t v18 = [v9 stringByAppendingString:v6];
  }
  char v16 = v18;

  BOOL v19 = [(NEProfileIngestion *)self findConfigurationByName:v16];

  if (v19)
  {
    uint64_t v20 = ne_log_obj();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
LABEL_14:

      goto LABEL_16;
    }
    int v26 = 67109378;
    *(_DWORD *)id v27 = v4;
    *(_WORD *)&v27[4] = 2112;
    *(void *)&v27[6] = v16;
    long long v25 = "setAsideConfigurationName failed (unSetAside = %d), name '%@' in use.";
LABEL_26:
    _os_log_error_impl(&dword_19DDAF000, v20, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v26, 0x12u);
    goto LABEL_14;
  }
  long long v23 = [v7 payloadInfo];

  if (!v23)
  {
    uint64_t v20 = ne_log_obj();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    int v26 = 67109378;
    *(_DWORD *)id v27 = v4;
    *(_WORD *)&v27[4] = 2112;
    *(void *)&v27[6] = v16;
    long long v25 = "setAsideConfigurationName failed (unSetAside = %d), configuration '%@' is missing payload info.";
    goto LABEL_26;
  }
  long long v24 = [v7 payloadInfo];
  [v24 setIsSetAside:!v4];

  [v7 setName:v16];
  -[NEProfileIngestion saveConfiguration:returnError:](self, v7, 0);
  id v21 = v7;
LABEL_17:

  return v21;
}

- (id)findConfigurationByName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NEProfileIngestion *)self currentConfigurations];

  if (v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = [(NEProfileIngestion *)self currentConfigurations];
    id v5 = (id)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v6);
          }
          uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v10 = [v9 name];
          int v11 = [v10 isEqualToString:v4];

          if (v11)
          {
            id v5 = v9;
            goto LABEL_12;
          }
        }
        id v5 = (id)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }

  return v5;
}

- (BOOL)loadConfigurationsForceReloadFromDisk
{
  v2 = self;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    uint64_t v13 = 0;
    long long v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 1;
    [(NEProfileIngestion *)self currentConfigurations];

    id v3 = [(NEProfileIngestion *)v2 manager];
    uint64_t v4 = MEMORY[0x1E4F14428];
    id v5 = MEMORY[0x1E4F14428];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__NEProfileIngestion_loadConfigurationsWithRefreshOption___block_invoke;
    v12[3] = &unk_1E5992870;
    v12[4] = v2;
    v12[5] = &v13;
    [v3 loadConfigurationsWithCompletionQueue:v4 handler:v12];

    id v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v8 = (id)objc_opt_class();
      int v9 = *((unsigned __int8 *)v14 + 24);
      uint64_t v10 = [(NEProfileIngestion *)v2 currentConfigurations];
      uint64_t v11 = [v10 count];
      *(_DWORD *)buf = 138413058;
      id v18 = v8;
      __int16 v19 = 1024;
      int v20 = 1;
      __int16 v21 = 1024;
      int v22 = v9;
      __int16 v23 = 2048;
      uint64_t v24 = v11;
      _os_log_debug_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_DEBUG, "%@ loadConfigurationsWithRefreshOption (refresh = %d) done, error = %d, #configs loaded %lu", buf, 0x22u);
    }
    LOBYTE(v2) = *((unsigned char *)v14 + 24) == 0;
    _Block_object_dispose(&v13, 8);
  }
  return (char)v2;
}

void __58__NEProfileIngestion_loadConfigurationsWithRefreshOption___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      long long v14 = convert_error_to_string(v6);
      int v15 = 138412290;
      char v16 = v14;
      _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "loadConfigurationsWithRefreshOption Failed to load the current configurations: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  id v8 = (void *)[v5 mutableCopy];
  [*(id *)(a1 + 32) setCurrentConfigurations:v8];

  int v9 = [*(id *)(a1 + 32) ingestedConfiguration];

  if (v9)
  {
    uint64_t v10 = [*(id *)(a1 + 32) ingestedConfiguration];
    uint64_t v11 = [v10 identifier];
    uint64_t v12 = [v11 UUIDString];

    uint64_t v13 = [*(id *)(a1 + 32) findConfigurationByConfigurationID:v12];
    if (v13) {
      [*(id *)(a1 + 32) setIngestedConfiguration:v13];
    }
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NEProfileIngestion;
  [(NEProfileIngestion *)&v2 dealloc];
}

- (NEProfileIngestion)initWithName:(id)a3
{
  return [(NEProfileIngestion *)self initWithNameAndType:a3 payloadType:0];
}

- (NEProfileIngestion)initWithNameAndType:(id)a3 payloadType:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)NEProfileIngestion;
  id v8 = [(NEProfileIngestion *)&v19 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    clientName = v8->_clientName;
    v8->_clientName = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    payloadType = v8->_payloadType;
    v8->_payloadType = (NSString *)v11;

    uint64_t v13 = [[NEConfigurationManager alloc] initSynchronous];
    manager = v8->_manager;
    v8->_manager = v13;

    if (!v8->_manager)
    {

      id v8 = 0;
    }
  }
  int v15 = ne_log_obj();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = objc_opt_class();
    *(_DWORD *)buf = 138412802;
    __int16 v21 = v17;
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    id v18 = v17;
    _os_log_debug_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_DEBUG, "%@ initWithNameAndType name %@, type %@", buf, 0x20u);
  }
  return v8;
}

+ (id)getServiceIDForPayload:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"PayloadType"];
  id v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v37 = (uint64_t)v3;
    _os_log_debug_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEBUG, "getServiceIDForPayload start with payload stub %@", buf, 0xCu);
  }

  if (([v4 isEqualToString:@"com.apple.vpn.managed"] & 1) == 0
    && ([v4 isEqualToString:@"com.apple.vpn.managed.applayer"] & 1) == 0
    && ([v4 isEqualToString:@"com.apple.vpn.managed.alwayson"] & 1) == 0
    && ([v4 isEqualToString:@"com.apple.webcontent-filter"] & 1) == 0
    && ([v4 isEqualToString:@"com.apple.networkusagerules"] & 1) == 0
    && ([v4 isEqualToString:@"com.apple.dnsSettings.managed"] & 1) == 0
    && ([v4 isEqualToString:@"com.apple.relay.managed"] & 1) == 0)
  {
    log = ne_log_obj();
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19DDAF000, log, OS_LOG_TYPE_DEBUG, "getServiceIDForPayload: ignore non-NetworkExtension payload", buf, 2u);
    }
    goto LABEL_40;
  }
  log = [v3 objectForKeyedSubscript:@"PayloadUUID"];
  if (!log)
  {
    log = ne_log_obj();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, log, OS_LOG_TYPE_ERROR, "getServiceIDForPayload payload stub has no payload UUID", buf, 2u);
    }
    goto LABEL_40;
  }
  id v6 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"NEProfileIngestion Migrator", 0);
  if (!v6)
  {
    __int16 v24 = ne_log_obj();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_ERROR, "getServiceIDForPayload failed to create SCPreference", buf, 2u);
    }

LABEL_40:
    __int16 v22 = 0;
    goto LABEL_49;
  }
  id v7 = v6;
  CFArrayRef v8 = SCNetworkServiceCopyAll(v6);
  if (!v8)
  {
    __int16 v22 = 0;
    goto LABEL_46;
  }
  CFArrayRef v9 = v8;
  uint64_t v10 = ne_log_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v27 = [(__CFArray *)v9 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v37 = v27;
    _os_log_debug_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_DEBUG, "getServiceIDForPayload found %lu services", buf, 0xCu);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  CFArrayRef v11 = v9;
  uint64_t v12 = [(__CFArray *)v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v12)
  {
    __int16 v22 = 0;
    goto LABEL_45;
  }
  uint64_t v13 = v12;
  __int16 v28 = v4;
  id v29 = v3;
  uint64_t v14 = *(void *)v32;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v32 != v14) {
        objc_enumerationMutation(v11);
      }
      char v16 = *(const __SCNetworkService **)(*((void *)&v31 + 1) + 8 * i);
      if (!v16
        || (uint64_t v17 = SCNetworkServiceCopyProtocol(*(SCNetworkServiceRef *)(*((void *)&v31 + 1) + 8 * i), @"com.apple.payload")) == 0)
      {
        int v20 = 0;
        __int16 v21 = 0;
        goto LABEL_32;
      }
      id v18 = v17;
      objc_super v19 = SCNetworkProtocolGetConfiguration(v17);
      int v20 = v19;
      if (!v19)
      {
        __int16 v21 = 0;
LABEL_31:
        CFRelease(v18);
        goto LABEL_32;
      }
      __int16 v21 = [v19 objectForKeyedSubscript:@"PayloadUUID"];
      if (!isa_nsstring(v21) || ![v21 isEqualToString:log]) {
        goto LABEL_31;
      }
      __int16 v22 = (void *)[[NSString alloc] initWithString:SCNetworkServiceGetServiceID(v16)];
      id v23 = ne_log_obj();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v37 = (uint64_t)v22;
        _os_log_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_DEFAULT, "getServiceIDForPayload found matching service '%@'", buf, 0xCu);
      }

      CFRelease(v18);
      if (v22)
      {

        goto LABEL_43;
      }
LABEL_32:
    }
    uint64_t v13 = [(__CFArray *)v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v13) {
      continue;
    }
    break;
  }
  __int16 v22 = 0;
LABEL_43:
  uint64_t v4 = v28;
  id v3 = v29;
LABEL_45:

  CFRelease(v11);
LABEL_46:
  CFRelease(v7);
  id v25 = ne_log_obj();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v37 = (uint64_t)v22;
    _os_log_debug_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_DEBUG, "getServiceIDForPayload found matching service %@", buf, 0xCu);
  }

LABEL_49:

  return v22;
}

@end