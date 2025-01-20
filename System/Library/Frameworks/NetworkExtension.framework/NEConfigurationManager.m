@interface NEConfigurationManager
+ (id)networkPrivacyConfigurationName;
+ (id)sharedManager;
+ (id)sharedManagerForAllUsers;
+ (void)disableConfiguration:(uint64_t)a1 onDemandOnly:(void *)a2;
+ (void)updateFlags:(void *)a3 withConfiguration:;
- (BOOL)appGroupsChanged;
- (BOOL)hasVPNAPIEntitlement;
- (NEConfigurationManager)init;
- (NEConfigurationManager)initWithPluginType:(id)a3;
- (NSString)pluginType;
- (NSUUID)userUUID;
- (_BYTE)removeConfigurationFromDisk:(const __SCPreferences *)a3 updateSCPreferences:;
- (char)initWithUserUUID:(char *)a1;
- (id)copyAppGroupMapDidChange:(BOOL *)a3;
- (id)copyCurrentIndexWithConfigurationIDsExpunged:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)errorWithCode:(void *)a3 specifics:;
- (id)filterIndexWithFilter:(void *)a1;
- (id)getCurrentUserUUIDForConfigurationID:(id)a3 fromIndex:(id)a4;
- (id)incomingMessageHandler;
- (id)initForAllUsers;
- (id)initSynchronous;
- (id)makeMutableCopyOfIndex:(id)a1;
- (id)saveConfigurationToDisk:(const __SCPreferences *)a3 updateSCPreferences:(void *)a4 currentSignature:(void *)a5 userUUID:(int)a6 notifyNow:(char)a7 isUpgrade:;
- (int64_t)configurationChangeSource;
- (uint64_t)configurationHasChanged:(void *)a1;
- (void)addGroups:(id)a3 forApp:(id)a4;
- (void)clearLoadedConfigurationsWithIDs:(void *)a1;
- (void)copyChangedConfigurationIDs:(void *)a1;
- (void)copyIdentities:(id)a3 fromDomain:(int64_t)a4 withCompletionQueue:(id)a5 handler:(id)a6;
- (void)dealloc;
- (void)didLoadConfiguration:(void *)a1;
- (void)executeCallbackOnQueue:(void *)a3 callback:;
- (void)fetchClientListenerWithBundleID:(id)a3 completionQueue:(id)a4 handler:(id)a5;
- (void)fetchUpgradeInfoForPluginType:(id)a3 completionQueue:(id)a4 handler:(id)a5;
- (void)getCurrentIndexWithCompletionHandler:(unsigned char *)a1;
- (void)handleApplicationsRemoved:(id)a3 completionQueue:(id)a4 withCompletionHandler:(id)a5;
- (void)handleFileRemovedWithCompletionQueue:(id)a3 completionHandler:(id)a4;
- (void)loadConfigurationAndUserWithID:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5;
- (void)loadConfigurationWithID:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5;
- (void)loadConfigurations:(id)a3 withFilter:(id)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)loadConfigurationsInternal:(void *)a3 withCompletionHandler:;
- (void)loadConfigurationsWithCompletionQueue:(id)a3 handler:(id)a4;
- (void)loadIndexWithFilter:(id)a3 completionQueue:(id)a4 handler:(id)a5;
- (void)notifyChanges;
- (void)postChangeNotificationWithGeneration:(uint64_t)a3 andFlags:(int)a4 onlyIfChanged:;
- (void)postGeneration;
- (void)registerForChangeNotifications;
- (void)removeConfiguration:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5;
- (void)removeConfigurationFromDisk:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)removeGroupsForApp:(uint64_t)a1;
- (void)repopulateNetworkPrivacyConfigurationResetAll:(BOOL)a3;
- (void)saveConfiguration:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5;
- (void)saveConfigurationToDisk:(id)a3 currentSignature:(id)a4 userUUID:(id)a5 isUpgrade:(BOOL)a6 completionQueue:(id)a7 completionHandler:(id)a8;
- (void)sendRequest:(void *)a3 responseHandler:;
- (void)setAppGroupMap:(uint64_t)a1;
- (void)setAppGroupsChanged:(BOOL)a3;
- (void)setChangedQueue:(id)a3 andHandler:(id)a4;
- (void)setConfigurationChangeSource:(int64_t)a3;
- (void)setHasVPNAPIEntitlement:(BOOL)a3;
- (void)setIncomingMessageHandler:(id)a3;
- (void)showLocalNetworkAlertForApp:(id)a3 pid:(int)a4 uuid:(id)a5 query:(id)a6 hasEntitlement:(BOOL)a7 completionQueue:(id)a8 handler:(id)a9;
- (void)showLocalNetworkAlertForApp:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5;
- (void)showLocalNetworkAlertForApp:(id)a3 withCompletionQueue:(id)a4 query:(id)a5 hasEntitlement:(BOOL)a6 handler:(id)a7;
- (void)syncConfigurationsWithSC:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)triggerLocalAuthenticationForConfigurationWithID:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5;
@end

@implementation NEConfigurationManager

void __53__NEConfigurationManager_setChangedQueue_andHandler___block_invoke(uint64_t a1, const char *a2)
{
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_atomic(v3, a2, *(id *)(a1 + 40), 64);
    v5 = *(void **)(a1 + 32);
    if (v5)
    {
      v6 = *(void **)(a1 + 48);
      objc_setProperty_atomic_copy(v5, v4, v6, 72);
    }
  }
}

void __63__NEConfigurationManager_getCurrentIndexWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  -[NEConfigurationManager registerForChangeNotifications](*(id *)(a1 + 32));
  uint64_t v122 = a1;
  v3 = *(void **)(a1 + 32);
  if (!v3) {
    goto LABEL_84;
  }
  id v4 = objc_getProperty(v3, v2, 56, 1);
  if (!v4) {
    goto LABEL_25;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    int v7 = *(_DWORD *)(v6 + 28);

    if (v7 == -1) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  state64[0] = 0;
  uint64_t v8 = *(void *)(v122 + 32);
  if (v8) {
    int v9 = *(_DWORD *)(v8 + 28);
  }
  else {
    int v9 = 0;
  }
  uint32_t state = notify_get_state(v9, state64);
  uint32_t v11 = state;
  if (state == 9)
  {
    v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(v122 + 32);
      if (v17) {
        LODWORD(v17) = *(_DWORD *)(v17 + 28);
      }
      *(_DWORD *)buf = 136315394;
      v150 = "com.apple.neconfigurationchanged";
      __int16 v151 = 1024;
      *(_DWORD *)v152 = v17;
      v16 = "Failed to get the current %s (token %u) notification state because the server is not found";
      goto LABEL_22;
    }
LABEL_24:

    goto LABEL_25;
  }
  if (state == 1)
  {
    v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(v122 + 32);
      if (v15) {
        LODWORD(v15) = *(_DWORD *)(v15 + 28);
      }
      *(_DWORD *)buf = 136315394;
      v150 = "com.apple.neconfigurationchanged";
      __int16 v151 = 1024;
      *(_DWORD *)v152 = v15;
      v16 = "Failed to get the current %s (token %u) notification state because the notification does not exist";
LABEL_22:
      _os_log_error_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_ERROR, v16, buf, 0x12u);
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  if (state)
  {
    v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      uint64_t v119 = *(void *)(v122 + 32);
      if (v119) {
        LODWORD(v119) = *(_DWORD *)(v119 + 28);
      }
      *(_DWORD *)buf = 136315650;
      v150 = "com.apple.neconfigurationchanged";
      __int16 v151 = 1024;
      *(_DWORD *)v152 = v119;
      *(_WORD *)&v152[4] = 1024;
      *(_DWORD *)&v152[6] = v11;
      _os_log_fault_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_FAULT, "Failed to get the current %s (token %u) notification state: %u", buf, 0x18u);
    }
    goto LABEL_24;
  }
  uint64_t v12 = state64[0] & 0x1FFFFFFFFFFFFFLL;
  uint64_t v13 = *(void *)(v122 + 32);
  if (v13) {
    uint64_t v13 = *(void *)(v13 + 104);
  }
  if (v13 == v12)
  {
    (*(void (**)(void))(*(void *)(v122 + 40) + 16))();
    return;
  }
  v47 = ne_log_obj();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    uint64_t v48 = *(void *)(v122 + 32);
    if (v48) {
      uint64_t v48 = *(void *)(v48 + 104);
    }
    *(_DWORD *)buf = 134218240;
    v150 = (const char *)v48;
    __int16 v151 = 2048;
    *(void *)v152 = v12;
    _os_log_impl(&dword_19DDAF000, v47, OS_LOG_TYPE_INFO, "current generation (%lld) does not equal posted generation (%llu), fetching a new index", buf, 0x16u);
  }

  if (!v12)
  {
    v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    uint64_t v49 = *(void *)(v122 + 32);
    if (v49) {
      LODWORD(v49) = *(_DWORD *)(v49 + 28);
    }
    *(_DWORD *)buf = 134218240;
    v150 = (const char *)state64[0];
    __int16 v151 = 1024;
    *(_DWORD *)v152 = v49;
    v16 = "current generation is 0, notification state == %llu, token == %u";
    goto LABEL_22;
  }
LABEL_25:
  v18 = *(void **)(v122 + 32);
  if (!v18) {
    goto LABEL_84;
  }
  objc_setProperty_atomic(v18, v5, 0, 56);
  uint64_t v19 = *(void *)(v122 + 32);
  if (!v19 || (*(unsigned char *)(v19 + 21) & 1) != 0) {
    goto LABEL_84;
  }
  self = *(id *)(v122 + 32);
  v20 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v21 = [v20 isReadableFileAtPath:@"/Library/Preferences/com.apple.networkextension.plist"];

  if (v21)
  {
    id v142 = 0;
    obuint64_t j = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:@"/Library/Preferences/com.apple.networkextension.plist" options:0 error:&v142];
    id v128 = v142;
    *((unsigned char *)self + 20) = 1;
    if (obj)
    {
      v22 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:obj error:0];
      [v22 setClass:objc_opt_class() forClassName:@"NEVPNAppRule"];
      [v22 setClass:objc_opt_class() forClassName:@"NEVPNProtocolPlugin"];
      uint64_t v123 = [v22 decodeInt64ForKey:@"Generation"];
      uint64_t v125 = [v22 decodeInt64ForKey:@"Version"];
      v23 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v24 = objc_opt_class();
      uint64_t v25 = objc_opt_class();
      uint64_t v26 = objc_opt_class();
      uint64_t v27 = objc_opt_class();
      v28 = objc_msgSend(v23, "setWithObjects:", v24, v25, v26, v27, objc_opt_class(), 0);
      v29 = [v22 decodeObjectOfClasses:v28 forKey:@"Index"];

      if (!v29 || v125)
      {
        v46 = v29;
LABEL_73:
        if (v125)
        {
          v45 = [v22 decodeObjectOfClass:objc_opt_class() forKey:@"SCPreferencesSignature2"];
        }
        else
        {
          v50 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v51 = objc_opt_class();
          uint64_t v52 = objc_opt_class();
          v53 = objc_msgSend(v50, "setWithObjects:", v51, v52, objc_opt_class(), 0);
          v54 = [v22 decodeObjectOfClasses:v53 forKey:@"SCPreferencesSignature"];

          memset(v137, 0, sizeof(v137));
          id v55 = v54;
          if ([v55 countByEnumeratingWithState:v137 objects:state64 count:16])
          {
            v45 = [v55 objectForKeyedSubscript:**((void **)&v137[0] + 1)];
          }
          else
          {
            v45 = 0;
          }
        }
        goto LABEL_80;
      }
      long long v140 = 0u;
      long long v141 = 0u;
      long long v138 = 0u;
      long long v139 = 0u;
      id v30 = v29;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v138 objects:buf count:16];
      if (v31)
      {
        v32 = 0;
        id v33 = 0;
        uint64_t v34 = *(void *)v139;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v139 != v34) {
              objc_enumerationMutation(v30);
            }
            uint64_t v36 = *(void *)(*((void *)&v138 + 1) + 8 * i);
            if (!v32)
            {
              v32 = [v30 objectForKeyedSubscript:*(void *)(*((void *)&v138 + 1) + 8 * i)];
            }
            v37 = [v32 allKeys];
            if (!v33) {
              id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            }
            [v33 setObject:v37 forKeyedSubscript:v36];
          }
          uint64_t v31 = [v30 countByEnumeratingWithState:&v138 objects:buf count:16];
        }
        while (v31);

        if (!v32 || !v33)
        {
          uint64_t v38 = (uint64_t)v30;
          goto LABEL_72;
        }
        v147[0] = @"ConfigurationProperties";
        v147[1] = @"UserMap";
        v148[0] = v32;
        v148[1] = v33;
        uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v148 forKeys:v147 count:2];
      }
      else
      {
        id v33 = 0;
        v32 = 0;
        uint64_t v38 = (uint64_t)v30;
      }

LABEL_72:
      v46 = (void *)v38;
      goto LABEL_73;
    }
    v43 = ne_log_obj();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v150 = (const char *)self;
      __int16 v151 = 2112;
      *(void *)v152 = @"/Library/Preferences/com.apple.networkextension.plist";
      _os_log_error_impl(&dword_19DDAF000, v43, OS_LOG_TYPE_ERROR, "%@ Failed to read data from %@", buf, 0x16u);
    }

    uint64_t v44 = -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)self, 1, 0);

    v22 = 0;
    id v128 = (id)v44;

LABEL_57:
    v45 = 0;
    v46 = 0;
    goto LABEL_81;
  }
  BOOL v39 = geteuid() == 0;
  v40 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v41 = [v40 fileExistsAtPath:@"/Library/Preferences/com.apple.networkextension.plist"];

  if (!v39)
  {
    if (v41) {
      -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)self, 10, 0);
    }
    else {
      -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)self, 18, 0);
    }
    id v128 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
  if (v41)
  {
    -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)self, 19, 0);
    id v128 = (id)objc_claimAutoreleasedReturnValue();
LABEL_56:
    v22 = 0;
    goto LABEL_57;
  }
  v22 = 0;
  uint64_t v123 = 0;
  v45 = 0;
  v46 = 0;
  id v128 = 0;
LABEL_80:
  objc_setProperty_atomic(self, v42, v22, 96);
  *((void *)self + 13) = v123;
  objc_setProperty_atomic(self, v56, v45, 120);
LABEL_81:
  id v57 = v128;
  id newValue = v46;

  v59 = (char *)v57;
  v60 = self;
  if (*((unsigned char *)self + 20))
  {
    v120 = v59;
    if (v59)
    {
      v65 = ne_log_obj();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v150 = v120;
        _os_log_error_impl(&dword_19DDAF000, v65, OS_LOG_TYPE_ERROR, "Failed to read the index: %@", buf, 0xCu);
      }

      v60 = self;
    }
    if (!newValue)
    {
      v113 = ne_log_obj();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v150 = (const char *)self;
        _os_log_impl(&dword_19DDAF000, v113, OS_LOG_TYPE_DEFAULT, "%@ No configurations exist", buf, 0xCu);
      }

      objc_setProperty_atomic(self, v114, 0, 96);
      goto LABEL_135;
    }
    objc_setProperty_atomic(v60, v58, newValue, 56);
    v66 = [self userUUID];
    BOOL v67 = v66 == 0;

    if (!v67)
    {
      v144 = @"user-uuid";
      v69 = [self userUUID];
      v145 = v69;
      v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v145 forKeys:&v144 count:1];
      v71 = -[NEConfigurationManager filterIndexWithFilter:](self, v70);
      objc_setProperty_atomic(self, v72, v71, 56);
    }
    [(NEConfigurationManager *)self notifyChanges];
    if (objc_getProperty(self, v73, 80, 1))
    {
      v75 = objc_msgSend(objc_getProperty(self, v74, 80, 1), "allKeys");
      -[NEConfigurationManager clearLoadedConfigurationsWithIDs:](self, v75);
    }
    if (objc_getProperty(self, v74, 56, 1))
    {
      long long v135 = 0u;
      long long v136 = 0u;
      long long v133 = 0u;
      long long v134 = 0u;
      objc_msgSend(objc_getProperty(self, v76, 56, 1), "objectForKeyedSubscript:", @"ConfigurationProperties");
      id obja = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v77 = [obja countByEnumeratingWithState:&v133 objects:v143 count:16];
      if (v77)
      {
        v124 = 0;
        v78 = 0;
        id v129 = *(id *)v134;
        while (1)
        {
          for (uint64_t j = 0; j != v77; ++j)
          {
            if (*(id *)v134 != v129) {
              objc_enumerationMutation(obja);
            }
            v80 = *(char **)(*((void *)&v133 + 1) + 8 * j);
            v81 = ne_log_obj();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v150 = v80;
              _os_log_impl(&dword_19DDAF000, v81, OS_LOG_TYPE_INFO, "Decoding %@", buf, 0xCu);
            }

            v82 = v80;
            id v84 = objc_getProperty(self, v83, 96, 1);
            uint64_t v85 = objc_opt_class();
            v86 = [v82 UUIDString];
            v87 = [v84 decodeObjectOfClass:v85 forKey:v86];

            if (v87)
            {
              v88 = [v87 VPN];
              v89 = [v88 protocol];
              BOOL v90 = [v89 type] == 3;

              if (!v90)
              {
                -[NEConfigurationManager didLoadConfiguration:](self, v87);
                v91 = [v87 applicationIdentifier];
                BOOL v92 = v91 == 0;

                if (!v92)
                {
                  v94 = objc_msgSend(objc_getProperty(self, v93, 56, 1), "objectForKeyedSubscript:", @"ConfigurationProperties");
                  v95 = [v94 objectForKeyedSubscript:v82];

                  v96 = [v95 objectForKeyedSubscript:@"ApplicationID"];
                  if (!isa_nsstring(v96)) {
                    goto LABEL_110;
                  }
                  v97 = [v87 applicationIdentifier];
                  v98 = [v95 objectForKeyedSubscript:@"ApplicationID"];
                  char v99 = [v97 isEqualToString:v98];

                  if ((v99 & 1) == 0)
                  {
                    v96 = (void *)[v95 mutableCopy];
                    v100 = [v87 applicationIdentifier];
                    [v96 setObject:v100 forKeyedSubscript:@"ApplicationID"];

                    if (!v124)
                    {
                      v102 = objc_msgSend(objc_getProperty(self, v101, 56, 1), "objectForKeyedSubscript:", @"ConfigurationProperties");
                      v124 = (void *)[v102 mutableCopy];
                    }
                    v103 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v96];
                    [v124 setObject:v103 forKeyedSubscript:v82];

LABEL_110:
                  }
                }
              }
            }
            else
            {
              v104 = ne_log_obj();
              if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                v150 = v82;
                _os_log_fault_impl(&dword_19DDAF000, v104, OS_LOG_TYPE_FAULT, "Failed to decode %@", buf, 0xCu);
              }

              id v105 = v78;
              if (!v78) {
                id v105 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              v78 = v105;
              [v105 addObject:v82];
              v87 = 0;
            }
          }
          uint64_t v77 = [obja countByEnumeratingWithState:&v133 objects:v143 count:16];
          if (!v77)
          {

            if (v124)
            {
              v107 = objc_msgSend(objc_getProperty(self, v106, 56, 1), "mutableCopy");
              v108 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v124];
              [v107 setObject:v108 forKeyedSubscript:@"ConfigurationProperties"];

              v109 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v107];
              objc_setProperty_atomic(self, v110, v109, 56);
            }
            v111 = self;
            if (v78)
            {
              id obja = (id)[self copyCurrentIndexWithConfigurationIDsExpunged:v78];
              objc_setProperty_atomic(self, v112, obja, 56);
              goto LABEL_127;
            }
            goto LABEL_128;
          }
        }
      }
      v124 = 0;
      v78 = 0;
LABEL_127:

      v111 = self;
LABEL_128:
      v115 = objc_msgSend(objc_getProperty(v111, v106, 56, 1), "objectForKeyedSubscript:", @"AppGroupMap");
      os_unfair_lock_lock((os_unfair_lock_t)self + 4);
      if (v115) {
        id v116 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v115];
      }
      else {
        id v116 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      v117 = v116;
      -[NEConfigurationManager setAppGroupMap:]((uint64_t)self, v116);

      [self setAppGroupsChanged:0];
      os_unfair_lock_unlock((os_unfair_lock_t)self + 4);
    }
    objc_setProperty_atomic(self, v76, 0, 96);
    v118 = ne_log_obj();
    if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19DDAF000, v118, OS_LOG_TYPE_DEFAULT, "Reload from disk complete", buf, 2u);
    }

    goto LABEL_135;
  }
  v61 = v59;

  uint64_t v62 = *(void *)(v122 + 32);
  if (!v62 || (*(unsigned char *)(v62 + 23) & 1) == 0)
  {
LABEL_84:
    xpc_object_t v63 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v63, "config-operation", 1);
    v64 = *(void **)(v122 + 32);
    v131[0] = MEMORY[0x1E4F143A8];
    v131[1] = 3221225472;
    v131[2] = __63__NEConfigurationManager_getCurrentIndexWithCompletionHandler___block_invoke_123;
    v131[3] = &unk_1E598FF40;
    v131[4] = v64;
    id v132 = *(id *)(v122 + 40);
    -[NEConfigurationManager sendRequest:responseHandler:](v64, v63, v131);

    return;
  }
LABEL_135:
  (*(void (**)(void))(*(void *)(v122 + 40) + 16))();
}

void __75__NEConfigurationManager_loadConfigurationsInternal_withCompletionHandler___block_invoke(id *a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4 || (id v11 = a1[4]) == 0 || !objc_getProperty(v11, v3, 56, 1))
  {
    id v5 = a1[4];
    if (v5 && objc_getProperty(v5, v3, 80, 1))
    {
      id v7 = a1[4];
      if (v7) {
        id Property = objc_getProperty(a1[4], v6, 80, 1);
      }
      else {
        id Property = 0;
      }
      int v9 = [Property allKeys];
      -[NEConfigurationManager clearLoadedConfigurationsWithIDs:](v7, v9);
    }
    if (v4)
    {
      v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v21 = a1[4];
        *(_DWORD *)buf = 138412546;
        id v25 = v21;
        __int16 v26 = 2112;
        id v27 = v4;
        _os_log_error_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_ERROR, "%@ Failed to load configurations: %@", buf, 0x16u);
      }
    }
    goto LABEL_11;
  }
  uint64_t v12 = a1[4];
  if (!v12)
  {

LABEL_11:
    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_12;
  }
  if (v12[20]) {
    goto LABEL_11;
  }
  if (v12[23]) {
    goto LABEL_11;
  }
  uint64_t v13 = -[NEConfigurationManager copyChangedConfigurationIDs:](v12, a1[5]);
  if (!v13) {
    goto LABEL_11;
  }
  v14 = v13;
  xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  uint64_t v17 = ne_log_obj();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_DEFAULT, "Sending load command to nehelper", buf, 2u);
  }

  [v16 encodeObject:v14 forKey:@"config-identifiers"];
  [v16 finishEncoding];
  v18 = [v16 encodedData];
  xpc_object_t v19 = xpc_data_create((const void *)[v18 bytes], objc_msgSend(v18, "length"));
  -[NEConfigurationManager clearLoadedConfigurationsWithIDs:](a1[4], v14);
  xpc_dictionary_set_int64(v15, "config-operation", 2);
  xpc_dictionary_set_value(v15, "config-ids-data", v19);
  id v20 = a1[4];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __75__NEConfigurationManager_loadConfigurationsInternal_withCompletionHandler___block_invoke_202;
  v22[3] = &unk_1E598FF40;
  v22[4] = v20;
  id v23 = a1[6];
  -[NEConfigurationManager sendRequest:responseHandler:](v20, v15, v22);

LABEL_12:
}

void __72__NEConfigurationManager_loadConfigurationsWithCompletionQueue_handler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = *(void **)(a1 + 32);
  if (!v5 || !objc_getProperty(v5, v3, 88, 1)) {
    goto LABEL_7;
  }
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v6, 88, 1);
  }
  uint64_t v8 = [Property allValues];
  if (v8)
  {
    int v9 = (void *)v8;
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v8];
  }
  else
  {
LABEL_7:
    v10 = 0;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void **)(a1 + 40);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__NEConfigurationManager_loadConfigurationsWithCompletionQueue_handler___block_invoke_2;
  v16[3] = &unk_1E5992CA0;
  id v13 = *(id *)(a1 + 48);
  id v18 = v4;
  id v19 = v13;
  id v17 = v10;
  id v14 = v4;
  id v15 = v10;
  -[NEConfigurationManager executeCallbackOnQueue:callback:](v11, v12, v16);
}

- (void)registerForChangeNotifications
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (val && *((_DWORD *)val + 7) == -1)
  {
    int out_token = -1;
    objc_initWeak(&location, val);
    v3 = objc_getProperty(val, v2, 40, 1);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __56__NEConfigurationManager_registerForChangeNotifications__block_invoke;
    handler[3] = &unk_1E5992C30;
    objc_copyWeak(&v7, &location);
    uint32_t v4 = notify_register_dispatch("com.apple.neconfigurationchanged", &out_token, v3, handler);

    if (v4)
    {
      id v5 = ne_log_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        uint32_t v11 = v4;
        _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "notify_register_dispatch failed: %d", buf, 8u);
      }
    }
    else
    {
      *((_DWORD *)val + 7) = out_token;
    }
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)executeCallbackOnQueue:(void *)a3 callback:
{
  queue = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 24)) {
      v5[2](v5);
    }
    else {
      dispatch_async(queue, v5);
    }
  }
}

- (uint64_t)configurationHasChanged:(void *)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (!a1)
  {
    uint64_t v11 = 0;
    goto LABEL_22;
  }
  if (objc_getProperty(a1, v3, 56, 1))
  {
    uint64_t v6 = objc_msgSend(objc_getProperty(a1, v5, 56, 1), "objectForKeyedSubscript:", @"ConfigurationProperties");
    id v7 = [v6 objectForKeyedSubscript:v4];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"Signature"];
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (objc_getProperty(a1, v5, 80, 1))
  {
    uint64_t v10 = objc_msgSend(objc_getProperty(a1, v9, 80, 1), "objectForKeyedSubscript:", v4);
  }
  else
  {
    uint64_t v10 = 0;
  }
  if (!(v8 | v10)) {
    goto LABEL_11;
  }
  if (!v8)
  {
    uint64_t v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v4;
      id v13 = "Configuration %@ was removed";
LABEL_19:
      _os_log_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v16, 0xCu);
    }
LABEL_20:

    uint64_t v11 = 1;
    goto LABEL_21;
  }
  if (([(id)v8 isEqualToData:v10] & 1) == 0)
  {
    uint64_t v12 = ne_log_obj();
    BOOL v14 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (v14)
      {
        int v16 = 138412290;
        id v17 = v4;
        id v13 = "Configuration %@ has changed";
        goto LABEL_19;
      }
    }
    else if (v14)
    {
      int v16 = 138412290;
      id v17 = v4;
      id v13 = "Configuration %@ has not been loaded yet";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
LABEL_11:
  uint64_t v11 = 0;
LABEL_21:

LABEL_22:
  return v11;
}

- (void)didLoadConfiguration:(void *)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  id v3 = a2;
  objc_msgSend(objc_getProperty(a1, v4, 56, 1), "objectForKeyedSubscript:", @"ConfigurationProperties");
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v3 identifier];
  uint64_t v6 = [v23 objectForKeyedSubscript:v5];
  id v7 = [v6 objectForKeyedSubscript:@"Signature"];
  id v8 = v3;
  id v9 = v7;
  uint64_t v10 = ne_log_obj();
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v8 identifier];
      *(_DWORD *)buf = 138412290;
      id v25 = v12;
      _os_log_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_DEFAULT, "Adding %@ to the loaded configurations", buf, 0xCu);
    }
    if (!objc_getProperty(a1, v13, 80, 1))
    {
      id v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
      objc_setProperty_atomic(a1, v16, v15, 80);

      id v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
      objc_setProperty_atomic(a1, v18, v17, 88);
    }
    id v19 = objc_getProperty(a1, v14, 80, 1);
    id v20 = [v8 identifier];
    [v19 setObject:v9 forKeyedSubscript:v20];

    id v22 = objc_getProperty(a1, v21, 88, 1);
    uint64_t v11 = [v8 identifier];
    [v22 setObject:v8 forKeyedSubscript:v11];
  }
  else
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    id v22 = [v8 identifier];
    *(_DWORD *)buf = 138412290;
    id v25 = v22;
    _os_log_fault_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_FAULT, "Missing a signature for %@", buf, 0xCu);
  }

LABEL_10:
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAppGroupsChanged:(BOOL)a3
{
  self->_appGroupsChanged = a3;
}

- (void)setAppGroupMap:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 128), a2);
  }
}

- (void)notifyChanges
{
  if (a1)
  {
    id v3 = objc_getProperty(a1, a2, 64, 1);
    if (v3)
    {
      id v5 = v3;
      id Property = objc_getProperty(a1, v4, 72, 1);

      if (Property)
      {
        id v8 = -[NEConfigurationManager copyChangedConfigurationIDs:](a1, 0);
        if (v8)
        {
          id v9 = objc_getProperty(a1, v7, 40, 1);
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          v10[2] = __39__NEConfigurationManager_notifyChanges__block_invoke;
          v10[3] = &unk_1E5992328;
          v10[4] = a1;
          id v11 = v8;
          dispatch_async(v9, v10);
        }
      }
    }
  }
}

- (void)copyChangedConfigurationIDs:(void *)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v6 = v4;
    if (v3)
    {
      [v4 addObjectsFromArray:v3];
    }
    else
    {
      if (objc_getProperty(a1, v5, 56, 1))
      {
        id v8 = objc_msgSend(objc_getProperty(a1, v7, 56, 1), "objectForKeyedSubscript:", @"ConfigurationProperties");
        id v9 = [v8 allKeys];
        [v6 addObjectsFromArray:v9];
      }
      if (objc_getProperty(a1, v7, 80, 1))
      {
        id v11 = objc_msgSend(objc_getProperty(a1, v10, 80, 1), "allKeys");
        [v6 addObjectsFromArray:v11];
      }
    }
    if (v6)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v12 = v6;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        id v15 = 0;
        uint64_t v16 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v22 != v16) {
              objc_enumerationMutation(v12);
            }
            SEL v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            if (-[NEConfigurationManager configurationHasChanged:](a1, v18))
            {
              if (!v15)
              {
                id v19 = objc_alloc(MEMORY[0x1E4F1CA48]);
                id v15 = objc_msgSend(v19, "initWithCapacity:", 0, (void)v21);
              }
              objc_msgSend(v15, "addObject:", v18, (void)v21);
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v14);

        if (v15)
        {
          a1 = [MEMORY[0x1E4F1C978] arrayWithArray:v15];
LABEL_25:

          goto LABEL_26;
        }
LABEL_24:
        a1 = 0;
        goto LABEL_25;
      }
    }
    id v15 = 0;
    goto LABEL_24;
  }
LABEL_26:

  return a1;
}

- (void)loadConfigurationsWithCompletionQueue:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_INFO, "Loading all configurations", buf, 2u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__NEConfigurationManager_loadConfigurationsWithCompletionQueue_handler___block_invoke;
  v11[3] = &unk_1E59923F0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](self, 0, v11);
}

- (void)loadConfigurationsInternal:(void *)a3 withCompletionHandler:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __75__NEConfigurationManager_loadConfigurationsInternal_withCompletionHandler___block_invoke;
    v7[3] = &unk_1E59923F0;
    v7[4] = a1;
    id v8 = v5;
    id v9 = v6;
    -[NEConfigurationManager getCurrentIndexWithCompletionHandler:](a1, v7);
  }
}

- (void)getCurrentIndexWithCompletionHandler:(unsigned char *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    id v11 = __63__NEConfigurationManager_getCurrentIndexWithCompletionHandler___block_invoke;
    id v12 = &unk_1E59936F8;
    id v13 = a1;
    id v14 = v3;
    id v5 = v10;
    id v7 = v5;
    if (a1[24])
    {
      if (a1[25])
      {
        v11((uint64_t)v5);
      }
      else
      {
        id Property = objc_getProperty(a1, v6, 40, 1);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __39__NEConfigurationManager_executeBlock___block_invoke;
        block[3] = &unk_1E59936F8;
        block[4] = a1;
        id v16 = v7;
        dispatch_sync(Property, block);
      }
    }
    else
    {
      id v9 = objc_getProperty(a1, v6, 40, 1);
      dispatch_async(v9, v7);
    }
  }
}

uint64_t __72__NEConfigurationManager_loadConfigurationsWithCompletionQueue_handler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __39__NEConfigurationManager_notifyChanges__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setChangedQueue:(id)a3 andHandler:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  if (self) {
    id Property = objc_getProperty(self, v7, 40, 1);
  }
  else {
    id Property = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__NEConfigurationManager_setChangedQueue_andHandler___block_invoke;
  block[3] = &unk_1E5992CA0;
  block[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  dispatch_sync(Property, block);
}

- (char)initWithUserUUID:(char *)a1
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_20;
  }
  v26.receiver = a1;
  v26.super_class = (Class)NEConfigurationManager;
  a1 = (char *)objc_msgSendSuper2(&v26, sel_init);
  if (!a1) {
    goto LABEL_20;
  }
  id v4 = SecTaskCreateFromSelf(0);
  uint64_t v5 = [v3 copy];
  id v6 = (void *)*((void *)a1 + 17);
  *((void *)a1 + 17) = v5;

  id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v8 = dispatch_queue_create("NEConfigurationManager_inner", v7);
  id v9 = (void *)*((void *)a1 + 5);
  *((void *)a1 + 5) = v8;

  id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v11 = dispatch_queue_create("NEConfigurationManager_outer", v10);
  id v12 = (void *)*((void *)a1 + 6);
  *((void *)a1 + 6) = v11;

  *((_DWORD *)a1 + 7) = -1;
  id v13 = (void *)*((void *)a1 + 1);
  *((void *)a1 + 1) = &stru_1EF054CB8;

  *(_WORD *)(a1 + 21) = 0;
  id v14 = a1 + 21;
  *((_DWORD *)a1 + 4) = 0;
  if (v4)
  {
    CFTypeRef v15 = SecTaskCopyValueForEntitlement(v4, @"com.apple.developer.networking.vpn.api", 0);
    if (!v15)
    {
      CFTypeRef v15 = SecTaskCopyValueForEntitlement(v4, @"com.apple.developer.networking.networkextension", 0);
      if (!v15)
      {
        CFTypeRef v15 = SecTaskCopyValueForEntitlement(v4, @"com.apple.private.AuthorizationServices", 0);
        if (!v15)
        {
LABEL_9:
          CFTypeRef v16 = SecTaskCopyValueForEntitlement(v4, @"com.apple.private.neconfiguration-write-access", 0);
          CFTypeID TypeID = CFBooleanGetTypeID();
          if (v16)
          {
            if (CFGetTypeID(v16) == TypeID && CFBooleanGetValue((CFBooleanRef)v16)) {
              a1[23] = 1;
            }
            CFRelease(v16);
          }
          CFRelease(v4);
          goto LABEL_15;
        }
        id v14 = a1 + 22;
      }
    }
    unsigned char *v14 = 1;
    CFRelease(v15);
    goto LABEL_9;
  }
LABEL_15:
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v19 = v18;
  if (!*((void *)a1 + 17)) {
    [v18 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"no-app-filter"];
  }
  id v20 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  if ([v20 count]) {
    [v19 setObject:v20 forKeyedSubscript:@"preferred-languages"];
  }
  long long v21 = [NEHelper alloc];
  long long v23 = [(NEHelper *)v21 initWithDelegateClassID:6 queue:objc_getProperty(a1, v22, 40, 1) additionalProperties:v19];
  objc_setProperty_atomic(a1, v24, v23, 112);

LABEL_20:
  return a1;
}

- (id)initForAllUsers
{
  return -[NEConfigurationManager initWithUserUUID:]((char *)self, 0);
}

void __39__NEConfigurationManager_notifyChanges__block_invoke(uint64_t a1, const char *a2)
{
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id v4 = objc_getProperty(v3, a2, 64, 1);
    if (v4)
    {
      id v15 = v4;
      id v6 = *(void **)(a1 + 32);
      if (v6)
      {
        id Property = objc_getProperty(v6, v5, 72, 1);

        if (Property)
        {
          id v9 = *(id *)(a1 + 32);
          if (v9) {
            id v9 = objc_getProperty(v9, v8, 72, 1);
          }
          id v11 = v9;
          id v12 = *(void **)(a1 + 32);
          if (v12) {
            id v13 = objc_getProperty(v12, v10, 64, 1);
          }
          else {
            id v13 = 0;
          }
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __39__NEConfigurationManager_notifyChanges__block_invoke_2;
          block[3] = &unk_1E59936F8;
          id v18 = v11;
          id v17 = *(id *)(a1 + 40);
          id v14 = v11;
          dispatch_async(v13, block);
        }
      }
      else
      {
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_appGroupMap, 0);
  objc_storeStrong((id *)&self->_SCPreferencesSignature, 0);
  objc_storeStrong((id *)&self->_helper, 0);
  objc_storeStrong((id *)&self->_decoder, 0);
  objc_storeStrong((id *)&self->_loadedConfigurations, 0);
  objc_storeStrong((id *)&self->_loadedIndex, 0);
  objc_storeStrong(&self->_changedHandler, 0);
  objc_storeStrong((id *)&self->_changedQueue, 0);
  objc_storeStrong((id *)&self->_currentIndex, 0);
  objc_storeStrong((id *)&self->_outerQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pluginType, 0);

  objc_storeStrong((id *)&self->_description, 0);
}

- (BOOL)appGroupsChanged
{
  return self->_appGroupsChanged;
}

- (void)setConfigurationChangeSource:(int64_t)a3
{
  self->_configurationChangeSource = a3;
}

- (int64_t)configurationChangeSource
{
  return self->_configurationChangeSource;
}

- (void)setHasVPNAPIEntitlement:(BOOL)a3
{
  self->_hasVPNAPIEntitlement = a3;
}

- (BOOL)hasVPNAPIEntitlement
{
  return self->_hasVPNAPIEntitlement;
}

- (NSString)pluginType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (id)debugDescription
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  [v3 appendString:@"{"];
  os_unfair_lock_lock(&self->_lock);
  if (self) {
    appGroupMap = self->_appGroupMap;
  }
  else {
    appGroupMap = 0;
  }
  [v3 appendPrettyObject:appGroupMap withName:@"app-group-map" andIndent:0 options:0];
  os_unfair_lock_unlock(&self->_lock);
  [v3 appendString:@"\n}"];

  return v3;
}

- (void)addGroups:(id)a3 forApp:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (!self || !self->_appGroupMap)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    -[NEConfigurationManager setAppGroupMap:]((uint64_t)self, v8);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * v13);
        if (self) {
          appGroupMap = self->_appGroupMap;
        }
        else {
          appGroupMap = 0;
        }
        CFTypeRef v16 = -[NSMutableDictionary objectForKeyedSubscript:](appGroupMap, "objectForKeyedSubscript:", *(void *)(*((void *)&v20 + 1) + 8 * v13), (void)v20);
        id v17 = v16;
        if (!v16 || ([v16 isEqualToString:v7] & 1) == 0) {
          [(NEConfigurationManager *)self setAppGroupsChanged:1];
        }
        if (self) {
          id v18 = self->_appGroupMap;
        }
        else {
          id v18 = 0;
        }
        [(NSMutableDictionary *)v18 setObject:v7 forKeyedSubscript:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v19 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v11 = v19;
    }
    while (v19);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (id)copyAppGroupMapDidChange:(BOOL *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self || !self->_appGroupMap)
  {
    id v6 = 0;
    if (!a3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:self->_appGroupMap];
  if (a3) {
LABEL_4:
  }
    *a3 = [(NEConfigurationManager *)self appGroupsChanged];
LABEL_5:
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)getCurrentUserUUIDForConfigurationID:(id)a3 fromIndex:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = objc_msgSend(v6, "objectForKeyedSubscript:", @"UserMap", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = [v6 objectForKeyedSubscript:@"UserMap"];
        uint64_t v14 = [v13 objectForKeyedSubscript:v12];

        if isa_nsarray(v14) && ([v14 containsObject:v5])
        {
          id v15 = v12;

          goto LABEL_12;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_12:

  return v15;
}

- (void)fetchUpgradeInfoForPluginType:(id)a3 completionQueue:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v11, "config-operation", 9);
  id v12 = v10;
  uint64_t v13 = (const char *)[v12 UTF8String];

  xpc_dictionary_set_string(v11, "config-plugin-type", v13);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__NEConfigurationManager_fetchUpgradeInfoForPluginType_completionQueue_handler___block_invoke;
  v16[3] = &unk_1E598F7F8;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v14 = v9;
  id v15 = v8;
  -[NEConfigurationManager sendRequest:responseHandler:](self, v11, v16);
}

void __80__NEConfigurationManager_fetchUpgradeInfoForPluginType_completionQueue_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = v5;
  if (v5 && MEMORY[0x19F3B92C0](v5) == MEMORY[0x1E4F14590]) {
    id v7 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    id v7 = 0;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__NEConfigurationManager_fetchUpgradeInfoForPluginType_completionQueue_handler___block_invoke_2;
  v12[3] = &unk_1E59936F8;
  id v10 = *(id *)(a1 + 48);
  id v13 = v7;
  id v14 = v10;
  id v11 = v7;
  -[NEConfigurationManager executeCallbackOnQueue:callback:](v8, v9, v12);
}

- (void)sendRequest:(void *)a3 responseHandler:
{
  xpc_object_t xdict = a2;
  if (a1)
  {
    id v5 = a3;
    id v6 = [a1 pluginType];

    if (v6)
    {
      id v8 = [a1 pluginType];
      xpc_dictionary_set_string(xdict, "config-plugin-type", (const char *)[v8 UTF8String]);
    }
    objc_msgSend(objc_getProperty(a1, v7, 112, 1), "sendRequest:responseHandler:", xdict, v5);
  }
}

uint64_t __80__NEConfigurationManager_fetchUpgradeInfoForPluginType_completionQueue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)fetchClientListenerWithBundleID:(id)a3 completionQueue:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v11, "config-operation", 8);
  id v12 = v10;
  id v13 = (const char *)[v12 UTF8String];

  xpc_dictionary_set_string(v11, "client-name", v13);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__NEConfigurationManager_fetchClientListenerWithBundleID_completionQueue_handler___block_invoke;
  v16[3] = &unk_1E598FF40;
  id v17 = v8;
  id v18 = v9;
  id v14 = v9;
  id v15 = v8;
  -[NEConfigurationManager sendRequest:responseHandler:](self, v11, v16);
}

void __82__NEConfigurationManager_fetchClientListenerWithBundleID_completionQueue_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__NEConfigurationManager_fetchClientListenerWithBundleID_completionQueue_handler___block_invoke_2;
  v9[3] = &unk_1E59936F8;
  id v6 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, v9);
}

uint64_t __82__NEConfigurationManager_fetchClientListenerWithBundleID_completionQueue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)repopulateNetworkPrivacyConfigurationResetAll:(BOOL)a3
{
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(xdict, "config-operation", 17);
  xpc_dictionary_set_BOOL(xdict, "reset-all", a3);
  -[NEConfigurationManager sendRequest:responseHandler:](self, xdict, 0);
}

- (void)showLocalNetworkAlertForApp:(id)a3 pid:(int)a4 uuid:(id)a5 query:(id)a6 hasEntitlement:(BOOL)a7 completionQueue:(id)a8 handler:(id)a9
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = a9;
  id v19 = a3;
  xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v20, "config-operation", 16);
  id v21 = v19;
  uint64_t v22 = (const char *)[v21 UTF8String];

  if (v22)
  {
    xpc_dictionary_set_string(v20, "bundle-id", v22);
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v29 = ne_log_obj();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uuid = 0;
    _os_log_error_impl(&dword_19DDAF000, v29, OS_LOG_TYPE_ERROR, "Failed to extract bundle ID string", uuid, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __108__NEConfigurationManager_showLocalNetworkAlertForApp_pid_uuid_query_hasEntitlement_completionQueue_handler___block_invoke;
  block[3] = &unk_1E5993770;
  id v36 = v18;
  dispatch_async(v17, block);

  if (a4) {
LABEL_3:
  }
    xpc_dictionary_set_int64(v20, "pid", a4);
LABEL_4:
  if (v15)
  {
    *(_OWORD *)uuid = 0uLL;
    [v15 getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(v20, "uuid", uuid);
  }
  if (!v16)
  {
    uint64_t v25 = ne_log_obj();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uuid = 0;
      objc_super v26 = "No query string provided";
      id v27 = v25;
      uint32_t v28 = 2;
      goto LABEL_18;
    }
LABEL_15:

    goto LABEL_16;
  }
  id v23 = v16;
  SEL v24 = (const char *)[v23 UTF8String];
  if (v24)
  {
    xpc_dictionary_set_string(v20, "query", v24);
    uint64_t v25 = ne_log_obj();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uuid = 138412290;
      *(void *)&uuid[4] = v23;
      objc_super v26 = "Set query string: %@";
      id v27 = v25;
      uint32_t v28 = 12;
LABEL_18:
      _os_log_debug_impl(&dword_19DDAF000, v27, OS_LOG_TYPE_DEBUG, v26, uuid, v28);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
LABEL_16:
  xpc_dictionary_set_BOOL(v20, "has-entitlement", a7);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __108__NEConfigurationManager_showLocalNetworkAlertForApp_pid_uuid_query_hasEntitlement_completionQueue_handler___block_invoke_258;
  v32[3] = &unk_1E598FF40;
  id v33 = v17;
  id v34 = v18;
  id v30 = v18;
  uint64_t v31 = v17;
  -[NEConfigurationManager sendRequest:responseHandler:](self, v20, v32);
}

uint64_t __108__NEConfigurationManager_showLocalNetworkAlertForApp_pid_uuid_query_hasEntitlement_completionQueue_handler___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  SEL v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4[0] = 67109120;
    v4[1] = 0;
    _os_log_error_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_ERROR, "Calling handler with failure: %u", (uint8_t *)v4, 8u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __108__NEConfigurationManager_showLocalNetworkAlertForApp_pid_uuid_query_hasEntitlement_completionQueue_handler___block_invoke_258(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = ne_log_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v16 = a3;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_debug_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_DEBUG, "Got response, result_code: %llu, response_data: %@", buf, 0x16u);
  }

  if (a3 == 36)
  {
    id v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v10 = "Alert was blocked, defaulting to no";
LABEL_13:
      _os_log_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_INFO, v10, buf, 2u);
    }
LABEL_14:
    LOBYTE(value) = 0;
LABEL_15:

    goto LABEL_16;
  }
  if (a3 == 16)
  {
    id v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v10 = "App wasn't foreground, didn't show alert";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (!a3 && v6 && MEMORY[0x19F3B92C0](v6) == MEMORY[0x1E4F14570])
  {
    BOOL value = xpc_BOOL_get_value(v6);
    id v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = value;
      _os_log_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_INFO, "App got response: %u", buf, 8u);
    }
    goto LABEL_15;
  }
  LOBYTE(value) = 0;
LABEL_16:
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __108__NEConfigurationManager_showLocalNetworkAlertForApp_pid_uuid_query_hasEntitlement_completionQueue_handler___block_invoke_259;
  v12[3] = &unk_1E5992D40;
  BOOL v14 = value;
  id v11 = *(NSObject **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  dispatch_async(v11, v12);
}

uint64_t __108__NEConfigurationManager_showLocalNetworkAlertForApp_pid_uuid_query_hasEntitlement_completionQueue_handler___block_invoke_259(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  SEL v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_INFO, "Calling handler with newly allowed state: %u", (uint8_t *)v5, 8u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showLocalNetworkAlertForApp:(id)a3 withCompletionQueue:(id)a4 query:(id)a5 hasEntitlement:(BOOL)a6 handler:(id)a7
{
}

- (void)showLocalNetworkAlertForApp:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5
{
}

- (void)triggerLocalAuthenticationForConfigurationWithID:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  memset(uu, 0, sizeof(uu));
  xpc_dictionary_set_int64(v11, "config-operation", 7);
  uuid_clear(uu);
  [v10 getUUIDBytes:uu];

  xpc_dictionary_set_uuid(v11, "config-identifier", uu);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __103__NEConfigurationManager_triggerLocalAuthenticationForConfigurationWithID_withCompletionQueue_handler___block_invoke;
  v14[3] = &unk_1E598FF40;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  -[NEConfigurationManager sendRequest:responseHandler:](self, v11, v14);
}

void __103__NEConfigurationManager_triggerLocalAuthenticationForConfigurationWithID_withCompletionQueue_handler___block_invoke(uint64_t a1)
{
}

- (void)copyIdentities:(id)a3 fromDomain:(int64_t)a4 withCompletionQueue:(id)a5 handler:(id)a6
{
  id v10 = a3;
  xpc_object_t v11 = a5;
  id v12 = a6;
  id v13 = v12;
  if (a4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__NEConfigurationManager_copyIdentities_fromDomain_withCompletionQueue_handler___block_invoke_2;
    block[3] = &unk_1E59936F8;
    id v18 = v12;
    id v17 = v10;
    dispatch_async(v11, block);

    xpc_object_t v14 = v18;
  }
  else
  {
    xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v14, "config-operation", 5);
    if (v10)
    {
      id v15 = v10;
      xpc_dictionary_set_data(v14, "identity-reference", (const void *)[v15 bytes], objc_msgSend(v15, "length"));
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __80__NEConfigurationManager_copyIdentities_fromDomain_withCompletionQueue_handler___block_invoke;
    v19[3] = &unk_1E598F7F8;
    v19[4] = self;
    xpc_object_t v20 = v11;
    id v21 = v13;
    -[NEConfigurationManager sendRequest:responseHandler:](self, v14, v19);
  }
}

void __80__NEConfigurationManager_copyIdentities_fromDomain_withCompletionQueue_handler___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    uint64_t v18 = v9;
    __int16 v19 = 1024;
    int v20 = a2;
    __int16 v21 = 2048;
    uint64_t v22 = a3;
    __int16 v23 = 2048;
    id v24 = v7;
    _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_INFO, "%@ Loaded identities from nehelper, ipc_success = %d, result_code = %lld, response_data = %p", buf, 0x26u);
  }

  if (v7 && MEMORY[0x19F3B92C0](v7) == MEMORY[0x1E4F14568]) {
    id v10 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    id v10 = 0;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__NEConfigurationManager_copyIdentities_fromDomain_withCompletionQueue_handler___block_invoke_248;
  v14[3] = &unk_1E59936F8;
  xpc_object_t v11 = *(NSObject **)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v15 = v10;
  id v16 = v12;
  id v13 = v10;
  dispatch_async(v11, v14);
}

void __80__NEConfigurationManager_copyIdentities_fromDomain_withCompletionQueue_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = +[NEIdentityKeychainItem copyIdentities:*(void *)(a1 + 32) fromDomain:1];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __80__NEConfigurationManager_copyIdentities_fromDomain_withCompletionQueue_handler___block_invoke_248(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)handleApplicationsRemoved:(id)a3 completionQueue:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  xpc_object_t v11 = v10;
  if (self) {
    outerQueue = self->_outerQueue;
  }
  else {
    outerQueue = 0;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__NEConfigurationManager_handleApplicationsRemoved_completionQueue_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E5992508;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v11;
  dispatch_async(outerQueue, v16);
}

void __90__NEConfigurationManager_handleApplicationsRemoved_completionQueue_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = getWriterSemaphore();
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  int v3 = *(unsigned char **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  _DWORD v5[2] = __90__NEConfigurationManager_handleApplicationsRemoved_completionQueue_withCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E5992ED0;
  v5[4] = v3;
  uint64_t v6 = v2;
  id v9 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v4 = v2;
  -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](v3, 0, v5);
}

void __90__NEConfigurationManager_handleApplicationsRemoved_completionQueue_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4) {
    goto LABEL_83;
  }
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v3, 88, 1);
  }
  v71 = [Property allValues];
  uint64_t v6 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"NEConfigurationManager remove prefs", 0);
  id v7 = ne_log_obj();
  id v8 = v7;
  SCPreferencesRef prefs = v6;
  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v66 = SCError();
      *(_DWORD *)buf = 136315394;
      uint64_t v85 = SCErrorString(v66);
      __int16 v86 = 1024;
      LODWORD(v87) = SCError();
      _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "SCPreferencesCreate failed while handling application removal: %s (%d)", buf, 0x12u);
    }

    goto LABEL_81;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v85 = "-[NEConfigurationManager handleApplicationsRemoved:completionQueue:withCompletionHandler:]_block_invoke";
    __int16 v86 = 1024;
    LODWORD(v87) = 2571;
    _os_log_debug_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEBUG, "%s:%d: Locking SCPreferences", buf, 0x12u);
  }

  if (!SCPreferencesLock(v6, 1u))
  {
    v65 = ne_log_obj();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      int v67 = SCError();
      v68 = SCErrorString(v67);
      int v69 = SCError();
      *(_DWORD *)buf = 136315394;
      uint64_t v85 = v68;
      __int16 v86 = 1024;
      LODWORD(v87) = v69;
      _os_log_error_impl(&dword_19DDAF000, v65, OS_LOG_TYPE_ERROR, "SCPreferencesLock failed while handling application removal: %s (%d)", buf, 0x12u);
    }

    CFRelease(prefs);
LABEL_81:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_82;
  }
  v70 = 0;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  obuint64_t j = v71;
  uint64_t v9 = [obj countByEnumeratingWithState:&v80 objects:v90 count:16];
  if (!v9) {
    goto LABEL_72;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v81;
  uint64_t v79 = a1;
  uint64_t v72 = *(void *)v81;
  do
  {
    uint64_t v12 = 0;
    uint64_t v75 = v10;
    do
    {
      if (*(void *)v81 != v11) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(void **)(*((void *)&v80 + 1) + 8 * v12);
      id v14 = objc_msgSend(v13, "pluginType", v70);
      id v15 = [v13 payloadInfo];
      if (v15) {
        goto LABEL_32;
      }
      uint64_t v16 = [v13 application];
      if (v16)
      {
        id v15 = (void *)v16;
        id v17 = *(void **)(a1 + 48);
        id v18 = [v13 application];
        if ([v17 containsObject:v18])
        {

          goto LABEL_22;
        }
        if (v14)
        {
          char v19 = [*(id *)(a1 + 48) containsObject:v14];

          if ((v19 & 1) == 0) {
            goto LABEL_33;
          }
LABEL_22:
          int v20 = ne_log_obj();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            __int16 v21 = [v13 name];
            *(_DWORD *)buf = 138412290;
            uint64_t v85 = v21;
            _os_log_impl(&dword_19DDAF000, v20, OS_LOG_TYPE_INFO, "Removing configuration %@ because the corresponding VPN application has been removed", buf, 0xCu);
          }
          if (v14) {
            -[NEConfigurationManager removeGroupsForApp:](*(void *)(a1 + 32), v14);
          }
          uint64_t v22 = [v13 applicationIdentifier];

          if (v22)
          {
            uint64_t v23 = *(void *)(a1 + 32);
            id v24 = [v13 applicationIdentifier];
            -[NEConfigurationManager removeGroupsForApp:](v23, v24);
          }
          uint64_t v25 = *(unsigned char **)(a1 + 32);
          objc_super v26 = [v13 identifier];
          id v15 = -[NEConfigurationManager removeConfigurationFromDisk:updateSCPreferences:](v25, v26, prefs);

          if (v15)
          {
            id v18 = ne_log_obj();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              v61 = [v13 name];
              *(_DWORD *)buf = 136315650;
              uint64_t v85 = "-[NEConfigurationManager handleApplicationsRemoved:completionQueue:withCompletionHandler:]_block_invoke";
              __int16 v86 = 2112;
              v87 = v61;
              __int16 v88 = 2112;
              v89 = v15;
              _os_log_error_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_ERROR, "%s: failed to remove configuration %@: %@", buf, 0x20u);
            }
            goto LABEL_31;
          }
        }
        else
        {
LABEL_31:
        }
LABEL_32:

        goto LABEL_33;
      }
      if (v14 && [*(id *)(a1 + 48) containsObject:v14]) {
        goto LABEL_22;
      }
LABEL_33:
      id v27 = [v13 appVPN];
      uint32_t v28 = [v13 contentFilter];
      v29 = [v28 perApp];

      v78 = v14;
      if (v29)
      {
        id v30 = [v13 contentFilter];
      }
      else
      {
        uint64_t v31 = [v13 dnsProxy];
        v32 = [v31 perApp];

        if (v32)
        {
          id v30 = [v13 dnsProxy];
        }
        else
        {
          id v33 = [v13 relay];
          id v34 = [v33 perApp];

          if (!v34)
          {
            id v36 = 0;
            if (!v27)
            {
              BOOL v39 = 0;
              goto LABEL_66;
            }
            goto LABEL_40;
          }
          id v30 = [v13 relay];
        }
      }
      v35 = v30;
      id v36 = [v30 perApp];

      if (!v27)
      {
        if (!v36)
        {
          BOOL v39 = 0;
          goto LABEL_66;
        }
        int v37 = 1;
        uint64_t v38 = v36;
        goto LABEL_43;
      }
LABEL_40:
      int v37 = 0;
      uint64_t v38 = v27;
LABEL_43:
      BOOL v39 = [v38 appRules];
      if (v39)
      {
        v40 = [v13 externalIdentifier];

        if (v40)
        {
          int v74 = v37;
          uint64_t v77 = (void *)[v39 mutableCopy];
          uint64_t v41 = [v39 count];
          if (v41 >= 1)
          {
            unint64_t v42 = v41 + 1;
            while (1)
            {
              unint64_t v43 = v42 - 2;
              uint64_t v44 = [v39 objectAtIndexedSubscript:v42 - 2];
              v45 = *(void **)(a1 + 48);
              v46 = [v44 matchSigningIdentifier];
              LODWORD(v45) = [v45 containsObject:v46];

              if (v45) {
                break;
              }

              --v42;
              a1 = v79;
              if (v42 <= 1) {
                goto LABEL_54;
              }
            }
            v47 = ne_log_obj();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              uint64_t v48 = [v44 matchSigningIdentifier];
              uint64_t v49 = [v13 name];
              *(_DWORD *)buf = 138412546;
              uint64_t v85 = v48;
              __int16 v86 = 2112;
              v87 = v49;
              _os_log_impl(&dword_19DDAF000, v47, OS_LOG_TYPE_INFO, "Removing app rule %@ from configuration %@ because the corresponding application has been removed", buf, 0x16u);
            }
            [v77 removeObjectAtIndex:v43];

            a1 = v79;
          }
LABEL_54:
          v50 = v77;
          uint64_t v51 = [v77 count];
          uint64_t v11 = v72;
          uint64_t v10 = v75;
          if (v51 != [v39 count])
          {
            v53 = v27;
            if (!v74 || (v53 = v36) != 0) {
              [v53 setAppRules:v77];
            }
            uint64_t v54 = *(void *)(a1 + 32);
            if (v54) {
              id v55 = objc_getProperty(*(id *)(a1 + 32), v52, 80, 1);
            }
            else {
              id v55 = 0;
            }
            id v56 = v55;
            id v57 = [v13 identifier];
            v58 = [v56 objectForKeyedSubscript:v57];

            v59 = -[NEConfigurationManager saveConfigurationToDisk:updateSCPreferences:currentSignature:userUUID:notifyNow:isUpgrade:](v54, v13, prefs, v58, 0, 1, 0);

            uint64_t v10 = v75;
            if (v59)
            {
              v60 = ne_log_obj();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
              {
                uint64_t v62 = [v13 name];
                *(_DWORD *)buf = 136315650;
                uint64_t v85 = "-[NEConfigurationManager handleApplicationsRemoved:completionQueue:withCompletionHandler:]_block_invoke";
                __int16 v86 = 2112;
                v87 = v62;
                __int16 v88 = 2112;
                v89 = v59;
                _os_log_error_impl(&dword_19DDAF000, v60, OS_LOG_TYPE_ERROR, "%s: failed to save %@: %@", buf, 0x20u);
              }
            }

            a1 = v79;
            v50 = v77;
          }
        }
      }
LABEL_66:

      ++v12;
    }
    while (v12 != v10);
    uint64_t v63 = [obj countByEnumeratingWithState:&v80 objects:v90 count:16];
    uint64_t v10 = v63;
  }
  while (v63);
LABEL_72:

  v64 = ne_log_obj();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v85 = "-[NEConfigurationManager handleApplicationsRemoved:completionQueue:withCompletionHandler:]_block_invoke";
    __int16 v86 = 1024;
    LODWORD(v87) = 2645;
    _os_log_debug_impl(&dword_19DDAF000, v64, OS_LOG_TYPE_DEBUG, "%s:%d: Unlocking SCPreferences", buf, 0x12u);
  }

  SCPreferencesUnlock(prefs);
  CFRelease(prefs);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  dispatch_async(*(dispatch_queue_t *)(a1 + 56), *(dispatch_block_t *)(a1 + 64));
  id v4 = v70;
LABEL_82:

LABEL_83:
}

uint64_t __39__NEConfigurationManager_executeBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    *(unsigned char *)(v2 + 25) = 1;
  }
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    *(unsigned char *)(v4 + 25) = 0;
  }
  return result;
}

void __63__NEConfigurationManager_getCurrentIndexWithCompletionHandler___block_invoke_123(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  xpc_object_t xdata = a4;
  if (xdata && MEMORY[0x19F3B92C0](xdata) == MEMORY[0x1E4F14580])
  {
    id v7 = (void *)MEMORY[0x1E4F1C9B8];
    bytes_ptr = xpc_data_get_bytes_ptr(xdata);
    uint64_t v9 = [v7 dataWithBytesNoCopy:bytes_ptr length:xpc_data_get_length(xdata) freeWhenDone:0];
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v9 error:0];
    uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, objc_opt_class(), 0);
    id v17 = [v10 decodeObjectOfClasses:v16 forKey:@"config-index"];

    uint64_t v18 = [v10 decodeInt64ForKey:@"config-generation"];
    if (isa_nsdictionary(v17))
    {
      int v20 = *(void **)(a1 + 32);
      if (v20) {
        objc_setProperty_atomic(v20, v19, v17, 56);
      }
    }
    uint64_t v21 = *(void *)(a1 + 32);
    if (v21) {
      *(void *)(v21 + 104) = v18;
    }
  }
  if (a2) {
    uint64_t v22 = a3;
  }
  else {
    uint64_t v22 = 11;
  }
  if (v22)
  {
    uint64_t v23 = -[NEConfigurationManager errorWithCode:specifics:](*(void *)(a1 + 32), v22, 0);
  }
  else
  {
    uint64_t v23 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)errorWithCode:(void *)a3 specifics:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = @"configuration is corrupted";
    switch(a2)
    {
      case 1:
        break;
      case 2:
        [NSString stringWithFormat:@"configuration is invalid: %@", v5];
        goto LABEL_14;
      case 3:
        uint64_t v6 = @"configuration type is wrong";
        break;
      case 4:
        uint64_t v6 = @"configuration owner application is wrong";
        break;
      case 5:
        uint64_t v6 = @"configuration is stale";
        break;
      case 6:
        uint64_t v6 = @"failed to write configuration to disk";
        break;
      case 7:
        uint64_t v6 = @"configuration does not exist";
        break;
      case 8:
        uint64_t v6 = @"invalid configuration operation request";
        break;
      case 9:
        uint64_t v6 = @"configuration is unchanged";
        break;
      case 10:
        uint64_t v6 = @"permission denied";
        break;
      case 11:
        uint64_t v6 = @"IPC failed";
        break;
      case 12:
        [NSString stringWithFormat:@"failed to make changes in SCPreferences: %@", v5];
LABEL_14:
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case 13:
        uint64_t v6 = @"failed to copy keychain items";
        break;
      case 14:
        uint64_t v6 = @"failed into import certificates into keychain";
        break;
      case 15:
        uint64_t v6 = @"unknown certificate format";
        break;
      case 16:
        uint64_t v6 = @"failed to import certificate";
        break;
      case 17:
        uint64_t v6 = @"internal failure with certificate installation";
        break;
      case 18:
        uint64_t v6 = @"file not found";
        break;
      case 20:
        uint64_t v6 = @"total NetworkExtension configuration size limit exceeded";
        break;
      case 21:
        uint64_t v6 = @"MDM required";
        break;
      default:
        uint64_t v6 = @"<unknown>";
        break;
    }
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = v6;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    uint64_t v9 = [v7 errorWithDomain:@"NEConfigurationErrorDomain" code:a2 userInfo:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)filterIndexWithFilter:(void *)a1
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (!a1 || !objc_getProperty(a1, v3, 56, 1))
  {
    uint64_t v51 = 0;
    goto LABEL_57;
  }
  if (!v4
    || ([v4 objectForKeyedSubscript:@"user-uuid"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = isa_nsuuid(v6),
        v6,
        !v7))
  {
    id v8 = (id)objc_msgSend(objc_getProperty(a1, v5, 56, 1), "mutableCopy");
    [v8 removeObjectForKey:@"AppGroupMap"];
    uint64_t v51 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v8];
    goto LABEL_56;
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v58 = [v4 objectForKeyedSubscript:@"plugin-types"];
  id v56 = [v4 objectForKeyedSubscript:@"application-id"];
  uint64_t v10 = objc_msgSend(objc_getProperty(a1, v9, 56, 1), "objectForKeyedSubscript:", @"UserMap");
  uint64_t v11 = [v4 objectForKeyedSubscript:@"user-uuid"];
  uint64_t v12 = [v10 objectForKeyedSubscript:v11];
  [v8 addObjectsFromArray:v12];

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  self = a1;
  uint64_t v14 = objc_msgSend(objc_getProperty(a1, v13, 56, 1), "objectForKeyedSubscript:", @"UserMap");
  uint64_t v15 = NEGetNullUUID();
  uint64_t v16 = [v14 objectForKeyedSubscript:v15];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v67 objects:v77 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v68 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v67 + 1) + 8 * i);
        if (([v8 containsObject:v21] & 1) == 0) {
          [v8 addObject:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v67 objects:v77 count:16];
    }
    while (v18);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v23 = objc_msgSend(objc_getProperty(self, v22, 56, 1), "objectForKeyedSubscript:", @"UserMap");
  id v24 = NEGetRootUUID();
  uint64_t v25 = [v23 objectForKeyedSubscript:v24];

  uint64_t v26 = [v25 countByEnumeratingWithState:&v63 objects:v76 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v64;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v64 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v63 + 1) + 8 * j);
        if (([v8 containsObject:v30] & 1) == 0) {
          [v8 addObject:v30];
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v63 objects:v76 count:16];
    }
    while (v27);
  }

  if (!v8)
  {
    uint64_t v51 = 0;
    goto LABEL_55;
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v31 = v8;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v59 objects:v75 count:16];
  if (!v32)
  {
    uint64_t v51 = 0;
LABEL_53:

    goto LABEL_55;
  }
  uint64_t v34 = v32;
  v53 = v4;
  id v57 = 0;
  v35 = @"ConfigurationProperties";
  uint64_t v36 = *(void *)v60;
  int v37 = self;
  do
  {
    uint64_t v38 = 0;
    uint64_t v55 = v34;
    do
    {
      if (*(void *)v60 != v36) {
        objc_enumerationMutation(v31);
      }
      uint64_t v39 = *(void *)(*((void *)&v59 + 1) + 8 * v38);
      v40 = objc_msgSend(objc_getProperty(v37, v33, 56, 1), "objectForKeyedSubscript:", v35);
      uint64_t v41 = [v40 objectForKeyedSubscript:v39];

      if (isa_nsdictionary(v41))
      {
        unint64_t v42 = v35;
        id v43 = v31;
        if ((isa_nsarray(v58) & 1) == 0 && !isa_nsstring(v56)) {
          goto LABEL_41;
        }
        uint64_t v44 = objc_msgSend(v41, "objectForKeyedSubscript:", @"PluginType", v53);
        v45 = [v41 objectForKeyedSubscript:@"ApplicationID"];
        if (isa_nsarray(v58) && isa_nsstring(v44)) {
          int v46 = [v58 containsObject:v44];
        }
        else {
          int v46 = 0;
        }
        if (isa_nsstring(v56)
          && isa_nsstring(v45)
          && [v56 isEqualToString:v45])
        {

          int v37 = self;
          goto LABEL_41;
        }

        int v37 = self;
        if (v46)
        {
LABEL_41:
          id v47 = v57;
          if (!v57) {
            id v47 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          }
          id v57 = v47;
          objc_msgSend(v47, "setObject:forKeyedSubscript:", v41, v39, v53);
        }
        id v31 = v43;
        v35 = v42;
        uint64_t v34 = v55;
      }

      ++v38;
    }
    while (v34 != v38);
    uint64_t v34 = [v31 countByEnumeratingWithState:&v59 objects:v75 count:16];
  }
  while (v34);

  if (v57)
  {
    v73[0] = @"UserMap";
    id v4 = v53;
    uint64_t v48 = [v53 objectForKeyedSubscript:@"user-uuid"];
    v71 = v48;
    uint64_t v49 = [v57 allKeys];
    uint64_t v72 = v49;
    v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
    v73[1] = v35;
    v74[0] = v50;
    v74[1] = v57;
    uint64_t v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:2];

    id v31 = v57;
    goto LABEL_53;
  }
  uint64_t v51 = 0;
  id v4 = v53;
LABEL_55:

LABEL_56:
LABEL_57:

  return v51;
}

- (void)clearLoadedConfigurationsWithIDs:(void *)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v11 = ne_log_obj();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v18 = v10;
            _os_log_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_DEFAULT, "Clearing %@ from the loaded configurations", buf, 0xCu);
          }
        }
        uint64_t v7 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
      }
      while (v7);
    }
    objc_msgSend(objc_getProperty(a1, v6, 88, 1), "removeObjectsForKeys:", v4);
    objc_msgSend(objc_getProperty(a1, v12, 80, 1), "removeObjectsForKeys:", v4);
  }
}

void __56__NEConfigurationManager_registerForChangeNotifications__block_invoke(uint64_t a1, int a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "com.apple.neconfigurationchanged";
    __int16 v19 = 1024;
    int v20 = a2;
    _os_log_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEFAULT, "Received a %s notification with token %d", buf, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = objc_getProperty(WeakRetained, v6, 72, 1);
    if (v8)
    {
      uint64_t v10 = v8;
      id Property = objc_getProperty(v7, v9, 64, 1);

      if (Property)
      {
        uint64_t v12 = MEMORY[0x1E4F143A8];
        uint64_t v13 = 3221225472;
        long long v14 = __56__NEConfigurationManager_registerForChangeNotifications__block_invoke_136;
        long long v15 = &unk_1E5993618;
        id v16 = v7;
        -[NEConfigurationManager getCurrentIndexWithCompletionHandler:]();
      }
    }
  }
}

uint64_t __56__NEConfigurationManager_registerForChangeNotifications__block_invoke_136(uint64_t a1, void *a2)
{
  if (!a2)
  {
    id v3 = *(unsigned char **)(a1 + 32);
    if (v3)
    {
      if ((v3[20] & 1) == 0) {
        [(NEConfigurationManager *)v3 notifyChanges];
      }
    }
  }

  return MEMORY[0x1F41817F8]();
}

void __75__NEConfigurationManager_loadConfigurationsInternal_withCompletionHandler___block_invoke_202(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = v7;
  if (v7 && MEMORY[0x19F3B92C0](v7) == MEMORY[0x1E4F14580])
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28DC0]);
    uint64_t v11 = (void *)MEMORY[0x1E4F1C9B8];
    bytes_ptr = xpc_data_get_bytes_ptr(v8);
    uint64_t v13 = [v11 dataWithBytesNoCopy:bytes_ptr length:xpc_data_get_length(v8) freeWhenDone:0];
    SEL v9 = [v10 initForReadingFromData:v13 error:0];

    long long v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    id v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v9 decodeObjectOfClasses:v16 forKey:@"config-objects"];

    if (isa_nsarray(v17))
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v26;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v26 != v21) {
              objc_enumerationMutation(v18);
            }
            -[NEConfigurationManager didLoadConfiguration:](*(void **)(a1 + 32), *(void **)(*((void *)&v25 + 1) + 8 * v22++));
          }
          while (v20 != v22);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v31 count:16];
        }
        while (v20);
      }
    }
  }
  else
  {
    SEL v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_DEFAULT, "No response data", buf, 2u);
    }
  }

  if (a2)
  {
    if (!a3) {
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v23 = ne_log_obj();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_ERROR, "IPC with nehelper failed", buf, 2u);
    }

    a3 = 11;
  }
  id v24 = ne_log_obj();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v30 = a3;
    _os_log_error_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_ERROR, "load failed with error: %lld", buf, 0xCu);
  }

  a3 = -[NEConfigurationManager errorWithCode:specifics:](*(void *)(a1 + 32), a3, 0);
LABEL_24:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)removeGroupsForApp:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = *(id *)(a1 + 128);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v11 = [*(id *)(a1 + 128) objectForKeyedSubscript:v10];
          int v12 = [v11 isEqualToString:v3];

          if (v12) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    if ([v4 count])
    {
      [(id)a1 setAppGroupsChanged:1];
      [*(id *)(a1 + 128) removeObjectsForKeys:v4];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  }
}

- (_BYTE)removeConfigurationFromDisk:(const __SCPreferences *)a3 updateSCPreferences:
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (a1)
  {
    uint64_t v84 = 0;
    char v83 = 0;
    if ((a1[23] & 1) == 0)
    {
      -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)a1, 10, 0);
      a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_55;
    }
    id Property = objc_getProperty(a1, v5, 56, 1);
    uint64_t v8 = -[NEConfigurationManager makeMutableCopyOfIndex:](a1, Property);
    SEL v9 = [v8 objectForKeyedSubscript:@"ConfigurationProperties"];
    uint64_t v10 = [v9 objectForKeyedSubscript:v6];
    char v11 = isa_nsdictionary(v10);

    if ((v11 & 1) == 0)
    {
      -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)a1, 7, 0);
      a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
LABEL_54:

      goto LABEL_55;
    }
    SCPreferencesRef prefs = a3;
    uint64_t v74 = (uint64_t)a1;
    int v12 = [v8 objectForKeyedSubscript:@"ConfigurationProperties"];
    [v12 removeObjectForKey:v6];

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v13 = [v8 objectForKeyedSubscript:@"UserMap"];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v79 objects:v87 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v80 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v79 + 1) + 8 * i);
          uint64_t v19 = [v8 objectForKeyedSubscript:@"UserMap"];
          uint64_t v20 = [v19 objectForKeyedSubscript:v18];

          [v20 removeObject:v6];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v79 objects:v87 count:16];
      }
      while (v15);
    }

    uint64_t v21 = (void *)v74;
    uint64_t v22 = [(id)v74 copyAppGroupMapDidChange:&v83];
    if (v22 && v83)
    {
      [v8 setObject:v22 forKeyedSubscript:@"AppGroupMap"];
      os_unfair_lock_lock((os_unfair_lock_t)(v74 + 16));
      [(id)v74 setAppGroupsChanged:0];
      os_unfair_lock_unlock((os_unfair_lock_t)(v74 + 16));
    }
    uint64_t v72 = (void *)v22;
    unint64_t v23 = *(void *)(v74 + 104);
    if (v23 <= 0x1FFFFFFFFFFFFELL) {
      uint64_t v24 = v23 + 1;
    }
    else {
      uint64_t v24 = 1;
    }
    long long v25 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    v71 = (const char *)v24;
    [v25 encodeInt64:v24 forKey:@"Generation"];
    [v25 encodeInt64:1 forKey:@"Version"];
    [v25 encodeObject:v8 forKey:@"Index"];
    if (objc_getProperty((id)v74, v26, 56, 1))
    {
      long long v28 = objc_msgSend(objc_getProperty((id)v74, v27, 88, 1), "objectForKeyedSubscript:", v6);
      v29 = v28;
      if (v28) {
        [v28 clearSystemKeychain];
      }
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      uint64_t v30 = [v8 objectForKeyedSubscript:@"ConfigurationProperties"];
      uint64_t v31 = [v30 countByEnumeratingWithState:&v75 objects:v86 count:16];
      if (v31)
      {
        uint64_t v33 = v31;
        uint64_t v34 = *(void *)v76;
        do
        {
          uint64_t v35 = 0;
          uint64_t v36 = v29;
          do
          {
            if (*(void *)v76 != v34) {
              objc_enumerationMutation(v30);
            }
            v29 = objc_msgSend(objc_getProperty(v21, v32, 88, 1), "objectForKeyedSubscript:", *(void *)(*((void *)&v75 + 1) + 8 * v35));

            if (v29)
            {
              int v37 = [v29 identifier];
              uint64_t v38 = [v37 UUIDString];
              [v25 encodeObject:v29 forKey:v38];

              uint64_t v21 = (void *)v74;
              +[NEConfigurationManager updateFlags:withConfiguration:]((uint64_t)NEConfigurationManager, (unint64_t *)&v84, v29);
            }
            ++v35;
            uint64_t v36 = v29;
          }
          while (v33 != v35);
          uint64_t v33 = [v30 countByEnumeratingWithState:&v75 objects:v86 count:16];
        }
        while (v33);
      }
    }
    if (!prefs) {
      goto LABEL_43;
    }
    id v39 = v6;
    self;
    CFStringRef v40 = (const __CFString *)[v39 UUIDString];

    SCNetworkServiceRef v41 = SCNetworkServiceCopy(prefs, v40);
    if (!v41) {
      goto LABEL_43;
    }
    CFRelease(v41);
    id v42 = v39;
    self;
    id v43 = SCNetworkServiceCopy(prefs, (CFStringRef)[v42 UUIDString]);
    if (v43)
    {
      uint64_t v44 = v43;
      if (!SCNetworkServiceRemove(v43))
      {
        long long v59 = ne_log_obj();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          long long v65 = [v42 UUIDString];
          int v66 = SCError();
          long long v67 = SCErrorString(v66);
          *(_DWORD *)buf = 138412546;
          v89 = v65;
          __int16 v90 = 2080;
          uint64_t v91 = v67;
          _os_log_error_impl(&dword_19DDAF000, v59, OS_LOG_TYPE_ERROR, "SCNetworkServiceRemove failed for configuration %@: %s", buf, 0x16u);
        }
        CFRelease(v44);

        long long v60 = NSString;
        int v61 = SCError();
        long long v62 = [v60 stringWithCString:SCErrorString(v61) encoding:4];
        -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)v21, 12, v62);
        a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();

        goto LABEL_53;
      }
      CFRelease(v44);
    }

    v45 = prefs;
    if (SCPreferencesCommitChanges(prefs))
    {
      if (!SCPreferencesApplyChanges(prefs))
      {
        id v47 = ne_log_obj();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          long long v68 = [v42 UUIDString];
          int v69 = SCError();
          long long v70 = SCErrorString(v69);
          *(_DWORD *)buf = 138412546;
          v89 = v68;
          __int16 v90 = 2080;
          uint64_t v91 = v70;
          _os_log_error_impl(&dword_19DDAF000, v47, OS_LOG_TYPE_ERROR, "SCPreferencesApplyChanges failed while removing configuration %@: %s", buf, 0x16u);
        }
        v45 = prefs;
      }
      if (objc_getProperty(v21, v46, 120, 1))
      {
        CFDataRef Signature = SCPreferencesGetSignature(v45);
        objc_setProperty_atomic(v21, v49, Signature, 120);
      }
LABEL_43:
      objc_msgSend(v25, "encodeObject:forKey:", objc_getProperty(v21, v27, 120, 1), @"SCPreferencesSignature2");
      [v25 finishEncoding];
      v50 = [v25 encodedData];
      char v51 = [v50 writeToFile:@"/Library/Preferences/com.apple.networkextension.plist" atomically:1];

      if (v51)
      {
        v21[13] = v71;
        uint64_t v52 = (void *)[v8 copy];
        objc_setProperty_atomic(v21, v53, v52, 56);

        id v85 = v6;
        uint64_t v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
        -[NEConfigurationManager clearLoadedConfigurationsWithIDs:](v21, v54);

        -[NEConfigurationManager postChangeNotificationWithGeneration:andFlags:onlyIfChanged:](v21, v71, v84, 0);
        a1 = 0;
        goto LABEL_55;
      }
      -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)v21, 6, 0);
      a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_53;
    }
    uint64_t v55 = NSString;
    int v56 = SCError();
    id v57 = [v55 stringWithCString:SCErrorString(v56) encoding:4];
    v58 = ne_log_obj();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      long long v64 = [v42 UUIDString];
      *(_DWORD *)buf = 138412546;
      v89 = v64;
      __int16 v90 = 2112;
      uint64_t v91 = v57;
      _os_log_error_impl(&dword_19DDAF000, v58, OS_LOG_TYPE_ERROR, "SCPreferencesCommitChanges failed while removing configuration %@: %@", buf, 0x16u);
    }
    -[NEConfigurationManager errorWithCode:specifics:](v74, 12, v57);
    a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();

LABEL_53:
    goto LABEL_54;
  }
LABEL_55:

  return a1;
}

- (id)saveConfigurationToDisk:(const __SCPreferences *)a3 updateSCPreferences:(void *)a4 currentSignature:(void *)a5 userUUID:(int)a6 notifyNow:(char)a7 isUpgrade:
{
  uint64_t v460 = *MEMORY[0x1E4F143B8];
  id v12 = a2;
  id v13 = a4;
  id v14 = a5;
  v405 = v12;
  v406 = v14;
  if (a1)
  {
    uint64_t v15 = v14;
    int v400 = a6;
    uint64_t v16 = [v12 pluginType];
    uint64_t v436 = 0;
    uint64_t v17 = NEConfigurationManager;
    id v18 = v12;
    self;
    uint64_t v19 = [v18 alwaysOnVPN];
    v408 = v16;
    uint64_t v409 = a1;
    v407 = v18;
    if (v19)
    {
      id v12 = [v18 alwaysOnVPN];
      if ([v12 isEnabled])
      {
        char v425 = 1;
LABEL_45:

LABEL_46:
        unsigned __int8 v435 = 0;
        if ((*(unsigned char *)(a1 + 23) & 1) == 0)
        {
          uint64_t v33 = v13;
          uint64_t v34 = -[NEConfigurationManager errorWithCode:specifics:](a1, 10, 0);
          id v35 = 0;
          uint64_t v36 = 0;
          int v37 = 0;
          uint64_t v38 = 0;
          id v39 = 0;
          CFStringRef v40 = 0;
          SCNetworkServiceRef v41 = 0;
          id v42 = 0;
          id v43 = 0;
LABEL_115:

          goto LABEL_116;
        }
        id v44 = objc_getProperty((id)a1, v32, 88, 1);
        v45 = [v18 identifier];
        id v35 = [v44 objectForKeyedSubscript:v45];

        if (!v35 || v35 == v18) {
          goto LABEL_103;
        }
        id v46 = v35;
        obuint64_t j = (__objc2_class *)v18;
        uint64_t v47 = [v46 VPN];
        if (!v47) {
          goto LABEL_58;
        }
        uint64_t v48 = (void *)v47;
        uint64_t v49 = [(__objc2_class *)obj VPN];
        if (v49)
        {
          v50 = (void *)v49;
          id v373 = v13;
          v379 = v35;
          char v51 = [v46 VPN];
          uint64_t v52 = [v51 protocol];
          if (!v52)
          {

            uint64_t v15 = v406;
            uint64_t v16 = v408;
            a1 = v409;
            id v13 = v373;
            goto LABEL_58;
          }
          SEL v53 = (void *)v52;
          uint64_t v54 = [v46 VPN];
          uint64_t v55 = [v54 protocol];
          uint64_t v421 = [v55 type];
          int v56 = [(__objc2_class *)obj VPN];
          [v56 protocol];
          v58 = char v57 = a7;
          uint64_t v418 = [v58 type];

          a7 = v57;
          id v18 = v407;

          uint64_t v15 = v406;
          uint64_t v16 = v408;
          a1 = v409;
          id v35 = v379;
          id v13 = v373;
          if (v421 == v418)
          {
LABEL_58:
            uint64_t v61 = [v46 appVPN];
            if (!v61
              || (long long v62 = (void *)v61,
                  [(__objc2_class *)obj appVPN],
                  long long v63 = objc_claimAutoreleasedReturnValue(),
                  v63,
                  v62,
                  v63))
            {
LABEL_76:
              uint64_t v79 = [v46 alwaysOnVPN];
              if (!v79
                || (long long v80 = (void *)v79,
                    [(__objc2_class *)obj alwaysOnVPN],
                    long long v81 = objc_claimAutoreleasedReturnValue(),
                    v81,
                    v80,
                    v81))
              {

                goto LABEL_103;
              }
              long long v445 = 0u;
              long long v446 = 0u;
              long long v443 = 0u;
              long long v444 = 0u;
              long long v82 = [v46 alwaysOnVPN];
              char v83 = [v82 interfaceProtocolMapping];

              uint64_t v84 = [v83 countByEnumeratingWithState:&v443 objects:v447 count:16];
              if (!v84) {
                goto LABEL_99;
              }
              uint64_t v85 = v84;
              char v415 = a7;
              v380 = v35;
              id v374 = v13;
              __int16 v86 = 0;
              uint64_t v87 = *(void *)v444;
              while (1)
              {
                uint64_t v88 = 0;
                v89 = v86;
                do
                {
                  if (*(void *)v444 != v87) {
                    objc_enumerationMutation(v83);
                  }
                  uint64_t v90 = *(void *)(*((void *)&v443 + 1) + 8 * v88);
                  uint64_t v91 = [v46 alwaysOnVPN];
                  uint64_t v92 = [v91 interfaceProtocolMapping];
                  __int16 v86 = [v92 objectForKeyedSubscript:v90];

                  if ([v86 type] != 5)
                  {
                    v102 = ne_log_obj();
                    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
                    {
                      int v103 = [v86 type];
                      *(_DWORD *)buf = 136315394;
                      *(void *)&uint8_t buf[4] = "-[NEConfigurationManager resetKeychainItemsAfterProtocolChange:newConfiguration:]";
                      *(_WORD *)&buf[12] = 1024;
                      *(_DWORD *)&buf[14] = v103;
                      _os_log_error_impl(&dword_19DDAF000, v102, OS_LOG_TYPE_ERROR, "%s: unsupported protocol type %d for Always-on VPN", buf, 0x12u);
                    }
                    goto LABEL_95;
                  }
                  id Property = [v86 ppkConfiguration];
                  v95 = Property;
                  if (Property) {
                    id Property = objc_getProperty(Property, v94, 32, 1);
                  }
                  id v96 = Property;

                  if (v96)
                  {
                    v97 = [v86 ppkConfiguration];
                    char v99 = v97;
                    if (v97) {
                      v97 = objc_getProperty(v97, v98, 32, 1);
                    }
                    id v100 = v97;
                    [v100 setIdentifier:0];
                  }
                  v101 = [v86 sharedSecretKeychainItem];

                  if (v101)
                  {
                    v102 = [v86 sharedSecretKeychainItem];
                    [v102 setIdentifier:0];
LABEL_95:
                  }
                  ++v88;
                  v89 = v86;
                }
                while (v85 != v88);
                uint64_t v85 = [v83 countByEnumeratingWithState:&v443 objects:v447 count:16];
                if (!v85)
                {

                  id v13 = v374;
                  uint64_t v15 = v406;
                  id v18 = v407;
                  uint64_t v16 = v408;
                  id v35 = v380;
                  a7 = v415;
LABEL_99:

                  a1 = v409;
LABEL_100:

                  v104 = ne_log_obj();
                  if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)v447 = 136315138;
                    v448 = "-[NEConfigurationManager saveConfigurationToDisk:updateSCPreferences:currentSignature:userUUI"
                           "D:notifyNow:isUpgrade:]";
                    _os_log_debug_impl(&dword_19DDAF000, v104, OS_LOG_TYPE_DEBUG, "%s clean up system keychain for reset protocol", v447, 0xCu);
                  }

                  -[NEConfiguration syncWithKeychainInDomain:](v46, 0);
LABEL_103:
                  if (v18) {
                    -[NEConfiguration syncWithKeychainInDomain:](v18, 0);
                  }
                  SCNetworkServiceRef v41 = [v18 generateSignature];
                  uint64_t v402 = [(id)a1 copyAppGroupMapDidChange:&v435];
                  id v106 = objc_getProperty((id)a1, v105, 56, 1);
                  v411 = -[NEConfigurationManager makeMutableCopyOfIndex:]((id)a1, v106);
                  v107 = [v411 objectForKeyedSubscript:@"ConfigurationProperties"];
                  v108 = [v18 identifier];
                  id v42 = [v107 objectForKeyedSubscript:v108];

                  if (v42)
                  {
                    if (v13)
                    {
                      v109 = [v42 objectForKeyedSubscript:@"Signature"];
                      char v110 = [v13 isEqualToData:v109];

                      if (v110)
                      {
                        v111 = v42;
                        v381 = v35;
                        id v112 = v13;
                        v370 = v111;
                        v113 = [v111 objectForKeyedSubscript:@"Signature"];
                        int v114 = [v41 isEqualToData:v113];
                        int v115 = v435;

                        if (v114 && !v115)
                        {
                          uint64_t v34 = -[NEConfigurationManager errorWithCode:specifics:](a1, 9, 0);
                          uint64_t v36 = 0;
                          uint64_t v38 = 0;
                          id v39 = 0;
                          CFStringRef v40 = 0;
                          uint64_t v33 = v112;
                          id v35 = v381;
                          goto LABEL_393;
                        }
                        v376 = v41;
                        id v35 = v381;
                        if (a7)
                        {
LABEL_120:
                          id v117 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                          [v117 setObject:v376 forKeyedSubscript:@"Signature"];
                          if (v16) {
                            [v117 setObject:v16 forKeyedSubscript:@"PluginType"];
                          }
                          v118 = v407;
                          uint64_t v119 = [v407 applicationIdentifier];

                          v120 = &off_1E598D000;
                          if (v119)
                          {
                            v121 = [v407 applicationIdentifier];
                            [v117 setObject:v121 forKeyedSubscript:@"ApplicationID"];
                          }
                          v382 = v35;
                          id v375 = v13;
                          uint64_t v122 = [v411 objectForKeyedSubscript:@"ConfigurationProperties"];
                          uint64_t v123 = [v407 identifier];
                          v404 = v117;
                          [v122 setObject:v117 forKeyedSubscript:v123];

                          if (v435 && v402)
                          {
                            [v411 setObject:v402 forKeyedSubscript:@"AppGroupMap"];
                            os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
                            [(id)a1 setAppGroupsChanged:0];
                            os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
                          }
                          if (v15 && !-[NEConfiguration isSupportedBySC](v407)
                            || (NEGetNullUUID(),
                                uint64_t v124 = objc_claimAutoreleasedReturnValue(),
                                v15,
                                (uint64_t v15 = (void *)v124) != 0))
                          {
                            uint64_t v125 = [v411 objectForKeyedSubscript:@"UserMap"];
                            v126 = [v125 objectForKeyedSubscript:v15];
                            char v127 = isa_nsarray(v126);

                            if ((v127 & 1) == 0)
                            {
                              id v128 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                              id v129 = [v411 objectForKeyedSubscript:@"UserMap"];
                              [v129 setObject:v128 forKeyedSubscript:v15];
                            }
                            v130 = [v411 objectForKeyedSubscript:@"UserMap"];
                            v131 = [v130 objectForKeyedSubscript:v15];

                            id v132 = [v407 identifier];
                            char v133 = [v131 containsObject:v132];

                            if ((v133 & 1) == 0)
                            {
                              long long v134 = [v407 identifier];
                              [v131 addObject:v134];
                            }
                          }
                          unint64_t v135 = *(void *)(a1 + 104);
                          if (v135 <= 0x1FFFFFFFFFFFFELL) {
                            uint64_t v136 = v135 + 1;
                          }
                          else {
                            uint64_t v136 = 1;
                          }
                          CFStringRef v40 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
                          id v422 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                          v358 = (const char *)v136;
                          [v40 encodeInt64:v136 forKey:@"Generation"];
                          [v40 encodeInt64:1 forKey:@"Version"];
                          v416 = v40;
                          v406 = v15;
                          if (objc_getProperty((id)a1, v137, 56, 1))
                          {
                            objc_msgSend(objc_getProperty((id)a1, v138, 56, 1), "objectForKeyedSubscript:", @"ConfigurationProperties");
                            long long v431 = 0u;
                            long long v432 = 0u;
                            long long v433 = 0u;
                            long long v434 = 0u;
                            id obja = (id)objc_claimAutoreleasedReturnValue();
                            uint64_t v139 = [obja countByEnumeratingWithState:&v431 objects:v442 count:16];
                            if (!v139)
                            {
                              char v371 = 0;
                              goto LABEL_340;
                            }
                            uint64_t v140 = v139;
                            uint64_t v343 = 0;
                            char v371 = 0;
                            uint64_t v141 = *(void *)v432;
                            uint64_t v419 = *(void *)v432;
                            while (1)
                            {
                              uint64_t v142 = 0;
                              do
                              {
                                if (*(void *)v432 != v141) {
                                  objc_enumerationMutation(obja);
                                }
                                v143 = *(void **)(*((void *)&v431 + 1) + 8 * v142);
                                v144 = [v118 identifier];
                                char v145 = [v143 isEqual:v144];

                                if ((v145 & 1) == 0)
                                {
                                  v147 = objc_msgSend(objc_getProperty((id)a1, v146, 88, 1), "objectForKeyedSubscript:", v143);
                                  if (!v147) {
                                    goto LABEL_174;
                                  }
                                  if ((v425 & 1) == 0)
                                  {
                                    char v425 = 0;
                                    goto LABEL_173;
                                  }
                                  uint64_t v148 = a1;
                                  id v149 = v118;
                                  id v150 = v147;
                                  self;
                                  v426 = v150;
                                  __int16 v151 = [v150 alwaysOnVPN];

                                  if (v151)
                                  {
                                    v152 = [v149 contentFilter];

                                    if (v152) {
                                      uint64_t v153 = 0;
                                    }
                                    else {
                                      uint64_t v153 = -1;
                                    }
LABEL_154:
                                    a1 = v148;

                                    if (v153 != -1)
                                    {
                                      if (v153 == 1) {
                                        goto LABEL_156;
                                      }
                                      char v425 = 1;
                                      CFStringRef v40 = v416;
                                      uint64_t v141 = v419;
LABEL_173:
                                      [v422 addObject:v147];
                                      v166 = [v143 UUIDString];
                                      [v40 encodeObject:v147 forKey:v166];

                                      +[NEConfigurationManager updateFlags:withConfiguration:]((uint64_t)v120[25], (unint64_t *)&v436, v147);
LABEL_174:

                                      goto LABEL_175;
                                    }
                                    uint64_t v141 = v419;
LABEL_161:
                                    +[NEConfigurationManager disableConfiguration:onDemandOnly:]((uint64_t)v120[25], v149);
                                    v157 = [v149 generateSignature];
                                    [v404 setObject:v157 forKeyedSubscript:@"Signature"];
                                    char v425 = 0;
                                    CFStringRef v40 = v416;
LABEL_172:

                                    goto LABEL_173;
                                  }
                                  v154 = [v149 alwaysOnVPN];

                                  if (v154)
                                  {
                                    v155 = [v150 contentFilter];
                                    uint64_t v153 = v155 == 0;

                                    goto LABEL_154;
                                  }
                                  uint64_t v160 = [v149 grade];
                                  if (v160 == [v150 grade])
                                  {
                                    a1 = v148;
                                    uint64_t v161 = [v149 VPN];
                                    if (v161)
                                    {
                                      v162 = (void *)v161;
                                      v163 = [v149 VPN];
                                      if ([v163 isEnabled]
                                        && ([v426 VPN], (uint64_t v164 = objc_claimAutoreleasedReturnValue()) != 0))
                                      {
                                        v165 = (void *)v164;
                                        v359 = [v426 VPN];
                                        char v384 = [v359 isEnabled];

                                        v118 = v407;
                                        v120 = &off_1E598D000;
                                        if (v384) {
                                          goto LABEL_328;
                                        }
                                      }
                                      else
                                      {

                                        v120 = &off_1E598D000;
                                      }
                                    }
                                  }
                                  uint64_t v167 = [v149 grade];
                                  if (v167 != [v426 grade]) {
                                    goto LABEL_191;
                                  }
                                  uint64_t v168 = [v149 contentFilter];
                                  if (!v168) {
                                    goto LABEL_191;
                                  }
                                  v169 = (void *)v168;
                                  v170 = [v149 contentFilter];
                                  if ([v170 isEnabled])
                                  {
                                    uint64_t v171 = [v426 contentFilter];
                                    if (v171)
                                    {
                                      id v385 = (id)v171;
                                      v360 = [v426 contentFilter];
                                      if ([v360 isEnabled])
                                      {
                                        v346 = [v149 contentFilter];
                                        uint64_t v354 = [v346 grade];
                                        v172 = [v426 contentFilter];
                                        uint64_t v350 = [v172 grade];

                                        if (v354 == v350)
                                        {
                                          v173 = [v426 externalIdentifier];

                                          v120 = &off_1E598D000;
                                          if (v173)
                                          {
                                            unint64_t v174 = v343 + 1;
                                            v175 = [v149 externalIdentifier];
                                            v118 = v407;
                                            ++v343;
                                            if (v175)
                                            {
                                              a1 = v148;

                                              uint64_t v141 = v419;
                                              if (v174 >= 7)
                                              {
                                                v176 = ne_log_obj();
                                                if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT))
                                                {
                                                  v177 = [v149 name];
                                                  *(_DWORD *)v456 = 136315394;
                                                  v457 = "+[NEConfigurationManager configuration:overlapsWithOtherConfigu"
                                                         "ration:sameTypeCount:perAppCount:]";
                                                  __int16 v458 = 2112;
                                                  v459 = v177;
                                                  _os_log_impl(&dword_19DDAF000, v176, OS_LOG_TYPE_DEFAULT, "%s: Exceeded perApp Content Filter limit, %@ superceded", v456, 0x16u);

                                                  v120 = &off_1E598D000;
                                                }
                                                goto LABEL_223;
                                              }
LABEL_192:
                                              uint64_t v178 = [v149 appVPN];
                                              v179 = v426;
                                              if (v178)
                                              {
                                                v180 = v178;
                                                v181 = [v149 appVPN];
                                                if (![v181 isEnabled]
                                                  || ([v426 appVPN],
                                                      (uint64_t v182 = objc_claimAutoreleasedReturnValue()) == 0))
                                                {

                                                  v120 = &off_1E598D000;
                                                  goto LABEL_213;
                                                }
                                                v183 = (void *)v182;
                                                [v426 appVPN];
                                                v184 = v361 = v180;
                                                int v386 = [v184 isEnabled];

                                                v120 = &off_1E598D000;
                                                if (v386)
                                                {
                                                  long long v454 = 0u;
                                                  long long v455 = 0u;
                                                  memset(buf, 0, sizeof(buf));
                                                  v185 = [v149 appVPN];
                                                  v180 = [v185 appRules];

                                                  uint64_t v351 = [v180 countByEnumeratingWithState:buf objects:v447 count:16];
                                                  if (v351)
                                                  {
                                                    uint64_t v186 = **(void **)&buf[16];
                                                    v362 = v180;
                                                    uint64_t v347 = **(void **)&buf[16];
                                                    do
                                                    {
                                                      uint64_t v187 = 0;
                                                      do
                                                      {
                                                        if (**(void **)&buf[16] != v186)
                                                        {
                                                          uint64_t v188 = v187;
                                                          objc_enumerationMutation(v180);
                                                          uint64_t v187 = v188;
                                                        }
                                                        uint64_t v355 = v187;
                                                        v189 = *(void **)(*(void *)&buf[8] + 8 * v187);
                                                        long long v437 = 0u;
                                                        long long v438 = 0u;
                                                        long long v439 = 0u;
                                                        long long v440 = 0u;
                                                        v190 = [v179 appVPN];
                                                        v191 = [v190 appRules];

                                                        id v387 = v191;
                                                        uint64_t v192 = [v191 countByEnumeratingWithState:&v437 objects:&v443 count:16];
                                                        if (v192)
                                                        {
                                                          uint64_t v193 = v192;
                                                          uint64_t v194 = *(void *)v438;
                                                          while (2)
                                                          {
                                                            for (uint64_t i = 0; i != v193; ++i)
                                                            {
                                                              if (*(void *)v438 != v194) {
                                                                objc_enumerationMutation(v387);
                                                              }
                                                              if ([v189 overlapsWithRule:*(void *)(*((void *)&v437 + 1) + 8 * i)])
                                                              {

                                                                a1 = v409;
                                                                v118 = v407;
                                                                v120 = &off_1E598D000;
                                                                goto LABEL_327;
                                                              }
                                                            }
                                                            uint64_t v193 = [v387 countByEnumeratingWithState:&v437 objects:&v443 count:16];
                                                            if (v193) {
                                                              continue;
                                                            }
                                                            break;
                                                          }
                                                        }

                                                        uint64_t v187 = v355 + 1;
                                                        v120 = &off_1E598D000;
                                                        v179 = v426;
                                                        v180 = v362;
                                                        uint64_t v186 = v347;
                                                      }
                                                      while (v355 + 1 != v351);
                                                      uint64_t v351 = [v362 countByEnumeratingWithState:buf objects:v447 count:16];
                                                    }
                                                    while (v351);
                                                  }
LABEL_213:
                                                }
                                              }
                                              uint64_t v196 = [v149 dnsProxy];
                                              if (!v196) {
                                                goto LABEL_225;
                                              }
                                              v197 = (void *)v196;
                                              v198 = [v149 dnsProxy];
                                              if (![v198 isEnabled]
                                                || ([v426 dnsProxy],
                                                    (uint64_t v199 = objc_claimAutoreleasedReturnValue()) == 0))
                                              {

                                                v120 = &off_1E598D000;
                                                goto LABEL_225;
                                              }
                                              v200 = (void *)v199;
                                              v201 = [v426 dnsProxy];
                                              int v388 = [v201 isEnabled];

                                              a1 = v409;
                                              v120 = &off_1E598D000;
                                              if (!v388) {
                                                goto LABEL_225;
                                              }
                                              v202 = [v149 externalIdentifier];

                                              v203 = [v426 externalIdentifier];

                                              if (v202)
                                              {
                                                v120 = &off_1E598D000;
                                                if (!v203)
                                                {
                                                  v176 = ne_log_obj();
                                                  if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    v204 = [v149 name];
                                                    *(_DWORD *)v456 = 136315394;
                                                    v457 = "+[NEConfigurationManager configuration:overlapsWithOtherConfi"
                                                           "guration:sameTypeCount:perAppCount:]";
                                                    __int16 v458 = 2112;
                                                    v459 = v204;
                                                    _os_log_impl(&dword_19DDAF000, v176, OS_LOG_TYPE_DEFAULT, "%s: Concurrent perApp and system DNS Proxy not allowed, %@ superceded", v456, 0x16u);

                                                    v120 = &off_1E598D000;
                                                  }
                                                  v118 = v407;
LABEL_223:

LABEL_316:
                                                  goto LABEL_161;
                                                }
LABEL_225:
                                                uint64_t v205 = [v149 dnsSettings];
                                                if (v205)
                                                {
                                                  v206 = (void *)v205;
                                                  v207 = [v149 dnsSettings];
                                                  if (![v207 isEnabled]) {
                                                    goto LABEL_241;
                                                  }
                                                  uint64_t v208 = [v426 dnsSettings];
                                                  if (!v208) {
                                                    goto LABEL_240;
                                                  }
                                                  v209 = (void *)v208;
                                                  v210 = [v426 dnsSettings];
                                                  int v389 = [v210 isEnabled];

                                                  a1 = v409;
                                                  v120 = &off_1E598D000;
                                                  if (v389)
                                                  {
                                                    v206 = [v149 dnsSettings];
                                                    v207 = [v206 settings];
                                                    v352 = [v426 dnsSettings];
                                                    id v390 = [v352 settings];
                                                    if (v207)
                                                    {
                                                      v211 = [v207 matchDomains];
                                                      uint64_t v356 = [v211 count];

                                                      v363 = [v390 matchDomains];
                                                      uint64_t v212 = [v363 count];

                                                      uint64_t v364 = v212;
                                                      if (!(v356 | v212))
                                                      {
LABEL_315:

                                                        uint64_t v282 = [v426 grade];
                                                        v118 = v407;
                                                        v120 = &off_1E598D000;
                                                        if (v282 >= [v149 grade]) {
                                                          goto LABEL_328;
                                                        }
                                                        goto LABEL_316;
                                                      }
                                                      if (v356 && v212)
                                                      {
                                                        uint64_t v213 = 0;
                                                        v344 = v206;
                                                        v348 = v207;
                                                        while (2)
                                                        {
                                                          v214 = [v207 matchDomains];
                                                          uint64_t v342 = v213;
                                                          v215 = [v214 objectAtIndexedSubscript:v213];

                                                          uint64_t v216 = 0;
                                                          do
                                                          {
                                                            v217 = [v390 matchDomains];
                                                            v218 = [v217 objectAtIndexedSubscript:v216];

                                                            if (([v215 hasSuffix:v218] & 1) != 0
                                                              || ([v218 hasSuffix:v215] & 1) != 0)
                                                            {

                                                              a1 = v409;
                                                              v206 = v344;
                                                              v207 = v348;
                                                              goto LABEL_315;
                                                            }

                                                            ++v216;
                                                          }
                                                          while (v364 != v216);

                                                          uint64_t v213 = v342 + 1;
                                                          v206 = v344;
                                                          v207 = v348;
                                                          if (v342 + 1 != v356) {
                                                            continue;
                                                          }
                                                          break;
                                                        }
                                                      }
                                                    }

LABEL_240:
                                                    v120 = &off_1E598D000;
LABEL_241:
                                                  }
                                                }
                                                v219 = [v149 externalIdentifier];
                                                if (!v219)
                                                {
                                                  uint64_t v220 = [v149 dnsProxy];
                                                  if (!v220) {
                                                    goto LABEL_250;
                                                  }
                                                  v219 = (void *)v220;
                                                  v221 = [v149 dnsProxy];
                                                  if ([v221 isEnabled])
                                                  {
                                                    uint64_t v222 = [v426 dnsSettings];
                                                    if (v222)
                                                    {
                                                      v223 = (void *)v222;
                                                      v224 = [v426 dnsSettings];
                                                      char v391 = [v224 isEnabled];

                                                      a1 = v409;
                                                      v120 = &off_1E598D000;
                                                      if (v391) {
                                                        goto LABEL_309;
                                                      }
LABEL_250:
                                                      v225 = [v426 externalIdentifier];
                                                      if (!v225)
                                                      {
                                                        uint64_t v226 = [v426 dnsProxy];
                                                        if (!v226) {
                                                          goto LABEL_258;
                                                        }
                                                        v225 = (void *)v226;
                                                        v227 = [v426 dnsProxy];
                                                        if ([v227 isEnabled])
                                                        {
                                                          uint64_t v228 = [v149 dnsSettings];
                                                          if (v228)
                                                          {
                                                            v229 = (void *)v228;
                                                            v230 = [v149 dnsSettings];
                                                            char v392 = [v230 isEnabled];

                                                            a1 = v409;
                                                            v120 = &off_1E598D000;
                                                            if (v392) {
                                                              goto LABEL_309;
                                                            }
LABEL_258:
                                                            uint64_t v231 = [v149 appPush];
                                                            if (!v231) {
                                                              goto LABEL_267;
                                                            }
                                                            v232 = (void *)v231;
                                                            v233 = [v149 appPush];
                                                            if ([v233 isEnabled])
                                                            {
                                                              uint64_t v234 = [v426 appPush];
                                                              if (v234)
                                                              {
                                                                id v393 = (id)v234;
                                                                v365 = [v426 appPush];
                                                                if ([v365 isEnabled])
                                                                {
                                                                  v357 = [v149 appPush];
                                                                  v345 = [v357 pluginType];
                                                                  v349 = [v426 appPush];
                                                                  v235 = [v349 pluginType];
                                                                  int v353 = [v345 isEqualToString:v235];

                                                                  v120 = &off_1E598D000;
                                                                  if (v353)
                                                                  {
                                                                    v236 = [v149 appPush];
                                                                    v237 = [v426 appPush];
                                                                    char v238 = [v236 overlapsWithConfiguration:v237];

                                                                    v120 = &off_1E598D000;
                                                                    if (v238)
                                                                    {
                                                                      a1 = v409;
LABEL_309:
                                                                      v118 = v407;
                                                                      goto LABEL_328;
                                                                    }
                                                                  }
LABEL_267:
                                                                  uint64_t v239 = [v149 relay];
                                                                  if (v239)
                                                                  {
                                                                    v240 = (void *)v239;
                                                                    v241 = [v149 relay];
                                                                    if ([v241 isEnabled]
                                                                      && ([v426 relay],
                                                                          (uint64_t v242 = objc_claimAutoreleasedReturnValue()) != 0))
                                                                    {
                                                                      v243 = (void *)v242;
                                                                      v244 = [v426 relay];
                                                                      int v394 = [v244 isEnabled];

                                                                      v120 = &off_1E598D000;
                                                                      if (v394)
                                                                      {
                                                                        v245 = [v149 relay];
                                                                        v246 = [v426 relay];
                                                                        int v247 = [v245 overlapsWithRelayConfiguration:v246];

                                                                        v120 = &off_1E598D000;
                                                                        if (v247)
                                                                        {
                                                                          uint64_t v248 = [v426 grade];
                                                                          if (v248 < [v149 grade])
                                                                          {
                                                                            a1 = v409;
                                                                            v118 = v407;
                                                                            goto LABEL_316;
                                                                          }
                                                                          v283 = [v426 payloadInfo];
                                                                          a1 = v409;
                                                                          v118 = v407;
                                                                          if ([v283 profileSource] == 2)
                                                                          {
                                                                            v284 = [v149 payloadInfo];
                                                                            id v399 = (id)[v284 profileSource];

                                                                            v120 = &off_1E598D000;
                                                                            if (v399 == (id)2)
                                                                            {
LABEL_328:
                                                                              uint64_t v148 = a1;

LABEL_156:
                                                                              CFStringRef v40 = v416;
                                                                              +[NEConfigurationManager disableConfiguration:onDemandOnly:]((uint64_t)v120[25], v426);
                                                                              v156 = [obja objectForKeyedSubscript:v143];
                                                                              v157 = (void *)[v156 mutableCopy];

                                                                              v158 = [v426 generateSignature];
                                                                              [v157 setObject:v158 forKeyedSubscript:@"Signature"];

                                                                              v159 = [v411 objectForKeyedSubscript:@"ConfigurationProperties"];
                                                                              [v159 setObject:v157 forKeyedSubscript:v143];

                                                                              if (a3)
                                                                              {
                                                                                v120 = &off_1E598D000;
                                                                                if (-[NEConfiguration isSupportedBySC](v426))
                                                                                {
                                                                                  if ((-[NEConfiguration applyChangesToSCServiceInPreferences:](v426, a3) & 1) == 0)
                                                                                  {
                                                                                    v323 = NSString;
                                                                                    int v324 = SCError();
                                                                                    v325 = [v323 stringWithCString:SCErrorString(v324) encoding:4];
                                                                                    uint64_t v34 = -[NEConfigurationManager errorWithCode:specifics:](v148, 12, v325);

                                                                                    uint64_t v36 = 0;
                                                                                    uint64_t v33 = v375;
                                                                                    SCNetworkServiceRef v41 = v376;
                                                                                    id v35 = v382;
                                                                                    goto LABEL_373;
                                                                                  }
                                                                                  char v371 = 1;
                                                                                }
                                                                                char v425 = 1;
                                                                              }
                                                                              else
                                                                              {
                                                                                char v425 = 1;
                                                                                v120 = &off_1E598D000;
                                                                              }
                                                                              a1 = v148;
                                                                              uint64_t v141 = v419;
                                                                              goto LABEL_172;
                                                                            }
                                                                            goto LABEL_316;
                                                                          }
                                                                          v362 = v283;
LABEL_327:

                                                                          goto LABEL_328;
                                                                        }
                                                                      }
                                                                    }
                                                                    else
                                                                    {

                                                                      v120 = &off_1E598D000;
                                                                    }
                                                                  }
                                                                  uint64_t v249 = [v149 grade];
                                                                  a1 = v409;
                                                                  if (v249 != [v426 grade]) {
                                                                    goto LABEL_312;
                                                                  }
                                                                  uint64_t v250 = [v149 relay];
                                                                  if (!v250) {
                                                                    goto LABEL_285;
                                                                  }
                                                                  v251 = (void *)v250;
                                                                  v252 = [v149 relay];
                                                                  if ([v252 isEnabled])
                                                                  {
                                                                    uint64_t v253 = [v426 VPN];
                                                                    if (v253)
                                                                    {
                                                                      id v395 = (id)v253;
                                                                      v254 = [v426 VPN];
                                                                      if ([v254 isEnabled])
                                                                      {
                                                                        v255 = [v149 relay];
                                                                        v256 = [v426 VPN];
                                                                        char v366 = [v255 overlapsWithVPNConfiguration:v256];

                                                                        a1 = v409;
                                                                        v120 = &off_1E598D000;
                                                                        uint64_t v141 = v419;
                                                                        if (v366) {
                                                                          goto LABEL_309;
                                                                        }
LABEL_285:
                                                                        uint64_t v257 = [v149 VPN];
                                                                        if (v257)
                                                                        {
                                                                          v258 = (void *)v257;
                                                                          v259 = [v149 VPN];
                                                                          if ([v259 isEnabled])
                                                                          {
                                                                            uint64_t v260 = [v426 relay];
                                                                            if (v260)
                                                                            {
                                                                              id v396 = (id)v260;
                                                                              v261 = [v426 relay];
                                                                              if ([v261 isEnabled])
                                                                              {
                                                                                v262 = [v426 relay];
                                                                                v263 = [v149 VPN];
                                                                                char v367 = [v262 overlapsWithVPNConfiguration:v263];

                                                                                a1 = v409;
                                                                                v120 = &off_1E598D000;
                                                                                uint64_t v141 = v419;
                                                                                if (v367) {
                                                                                  goto LABEL_309;
                                                                                }
                                                                                goto LABEL_296;
                                                                              }

                                                                              v120 = &off_1E598D000;
                                                                              uint64_t v141 = v419;
                                                                            }
                                                                          }
                                                                        }
LABEL_296:
                                                                        uint64_t v268 = [v149 relay];
                                                                        if (v268)
                                                                        {
                                                                          v269 = (void *)v268;
                                                                          v270 = [v149 relay];
                                                                          if ([v270 isEnabled])
                                                                          {
                                                                            uint64_t v271 = [v426 appVPN];
                                                                            if (v271)
                                                                            {
                                                                              id v397 = (id)v271;
                                                                              v272 = [v426 appVPN];
                                                                              if ([v272 isEnabled])
                                                                              {
                                                                                v273 = [v149 relay];
                                                                                v274 = [v426 appVPN];
                                                                                char v368 = [v273 overlapsWithAppVPNConfiguration:v274];

                                                                                a1 = v409;
                                                                                v120 = &off_1E598D000;
                                                                                uint64_t v141 = v419;
                                                                                if (v368) {
                                                                                  goto LABEL_309;
                                                                                }
                                                                                goto LABEL_304;
                                                                              }

                                                                              v120 = &off_1E598D000;
                                                                              uint64_t v141 = v419;
                                                                            }
                                                                          }
                                                                        }
LABEL_304:
                                                                        uint64_t v275 = [v149 appVPN];
                                                                        if (v275)
                                                                        {
                                                                          v276 = (void *)v275;
                                                                          v277 = [v149 appVPN];
                                                                          if ([v277 isEnabled])
                                                                          {
                                                                            uint64_t v278 = [v426 relay];
                                                                            if (v278)
                                                                            {
                                                                              id v398 = (id)v278;
                                                                              v279 = [v426 relay];
                                                                              if ([v279 isEnabled])
                                                                              {
                                                                                v280 = [v426 relay];
                                                                                v281 = [v149 appVPN];
                                                                                char v369 = [v280 overlapsWithAppVPNConfiguration:v281];

                                                                                a1 = v409;
                                                                                v120 = &off_1E598D000;
                                                                                uint64_t v141 = v419;
                                                                                if (v369) {
                                                                                  goto LABEL_309;
                                                                                }
                                                                                goto LABEL_312;
                                                                              }

                                                                              v120 = &off_1E598D000;
                                                                              uint64_t v141 = v419;
                                                                            }
                                                                          }
                                                                        }
LABEL_312:

                                                                        char v425 = 1;
                                                                        v118 = v407;
                                                                        CFStringRef v40 = v416;
                                                                        goto LABEL_173;
                                                                      }

                                                                      v120 = &off_1E598D000;
                                                                      a1 = v409;
                                                                      uint64_t v141 = v419;
                                                                    }
                                                                  }

                                                                  goto LABEL_285;
                                                                }
                                                              }
                                                            }

                                                            goto LABEL_267;
                                                          }
                                                        }

                                                        v120 = &off_1E598D000;
                                                      }

                                                      goto LABEL_258;
                                                    }
                                                  }

                                                  v120 = &off_1E598D000;
                                                }

                                                goto LABEL_250;
                                              }
                                              v362 = ne_log_obj();
                                              BOOL v264 = os_log_type_enabled(v362, OS_LOG_TYPE_DEFAULT);
                                              v118 = v407;
                                              v120 = &off_1E598D000;
                                              if (v203)
                                              {
                                                if (!v264) {
                                                  goto LABEL_327;
                                                }
                                                v265 = [v149 name];
                                                *(_DWORD *)v456 = 136315394;
                                                v457 = "+[NEConfigurationManager configuration:overlapsWithOtherConfigura"
                                                       "tion:sameTypeCount:perAppCount:]";
                                                __int16 v458 = 2112;
                                                v459 = v265;
                                                v266 = v362;
                                                v267 = "%s: Concurrent perApp and system DNS Proxy not allowed, %@ supercedes";
                                              }
                                              else
                                              {
                                                if (!v264) {
                                                  goto LABEL_327;
                                                }
                                                v265 = [v149 name];
                                                *(_DWORD *)v456 = 136315394;
                                                v457 = "+[NEConfigurationManager configuration:overlapsWithOtherConfigura"
                                                       "tion:sameTypeCount:perAppCount:]";
                                                __int16 v458 = 2112;
                                                v459 = v265;
                                                v266 = v362;
                                                v267 = "%s: Only one system DNS Proxy is allowed, %@ supercedes";
                                              }
LABEL_325:
                                              _os_log_impl(&dword_19DDAF000, v266, OS_LOG_TYPE_DEFAULT, v267, v456, 0x16u);

                                              goto LABEL_327;
                                            }
                                          }
                                          else
                                          {
                                            v285 = [v149 externalIdentifier];

                                            v118 = v407;
                                            if (!v285)
                                            {
                                              a1 = v148;
                                              v286 = ne_log_obj();
                                              v362 = v286;
                                              if (!os_log_type_enabled(v286, OS_LOG_TYPE_DEFAULT)) {
                                                goto LABEL_327;
                                              }
                                              v265 = [v149 name];
                                              *(_DWORD *)v456 = 136315394;
                                              v457 = "+[NEConfigurationManager configuration:overlapsWithOtherConfigurati"
                                                     "on:sameTypeCount:perAppCount:]";
                                              __int16 v458 = 2112;
                                              v459 = v265;
                                              v266 = v286;
                                              v267 = "%s: Only one system Content Filter is allowed, %@ supercedes";
                                              goto LABEL_325;
                                            }
                                          }
                                        }
                                        else
                                        {
                                          v120 = &off_1E598D000;
                                        }
LABEL_191:
                                        uint64_t v141 = v419;
                                        goto LABEL_192;
                                      }
                                    }
                                  }

                                  goto LABEL_191;
                                }
LABEL_175:
                                ++v142;
                              }
                              while (v142 != v140);
                              uint64_t v287 = [obja countByEnumeratingWithState:&v431 objects:v442 count:16];
                              uint64_t v140 = v287;
                              if (!v287)
                              {
LABEL_340:

                                int v288 = v371 & 1;
                                goto LABEL_341;
                              }
                            }
                          }
                          int v288 = 0;
LABEL_341:
                          [v422 addObject:v118];
                          v297 = [v118 identifier];
                          v298 = [v297 UUIDString];
                          [v40 encodeObject:v118 forKey:v298];

                          +[NEConfigurationManager updateFlags:withConfiguration:]((uint64_t)v120[25], (unint64_t *)&v436, v118);
                          [v40 encodeObject:v411 forKey:@"Index"];
                          BOOL v299 = -[NEConfiguration isSupportedBySC](v118);
                          v301 = a3;
                          if (a3 && v299)
                          {
                            uint64_t v33 = v375;
                            SCNetworkServiceRef v41 = v376;
                            id v35 = v382;
                            if ((-[NEConfiguration applyChangesToSCServiceInPreferences:](v118, a3) & 1) == 0)
                            {
                              v302 = NSString;
                              int v303 = SCError();
                              v304 = [v302 stringWithCString:SCErrorString(v303) encoding:4];
                              uint64_t v34 = -[NEConfigurationManager errorWithCode:specifics:](a1, 12, v304);

                              uint64_t v36 = 0;
LABEL_373:
                              id v43 = v411;
                              int v37 = (void *)v402;
                              id v39 = v404;
                              id v42 = v370;
                              goto LABEL_374;
                            }
LABEL_346:
                            if (SCPreferencesCommitChanges(a3))
                            {
                              if (!SCPreferencesApplyChanges(a3))
                              {
                                v306 = ne_log_obj();
                                if (os_log_type_enabled(v306, OS_LOG_TYPE_ERROR))
                                {
                                  v339 = [v118 name];
                                  int v340 = SCError();
                                  v341 = SCErrorString(v340);
                                  *(_DWORD *)v447 = 138412802;
                                  v448 = (const char *)a1;
                                  __int16 v449 = 2112;
                                  v450 = v339;
                                  __int16 v451 = 2080;
                                  v452 = v341;
                                  _os_log_error_impl(&dword_19DDAF000, v306, OS_LOG_TYPE_ERROR, "%@: SCPreferencesApplyChanges failed with configuration %@: %s", v447, 0x20u);
                                }
                                v301 = a3;
                              }
                              if (objc_getProperty((id)a1, v305, 120, 1))
                              {
                                CFDataRef Signature = SCPreferencesGetSignature(v301);
                                objc_setProperty_atomic((id)a1, v308, Signature, 120);
                              }
                              goto LABEL_353;
                            }
                            v319 = NSString;
                            int v320 = SCError();
                            v321 = [v319 stringWithCString:SCErrorString(v320) encoding:4];
                            v322 = ne_log_obj();
                            if (os_log_type_enabled(v322, OS_LOG_TYPE_ERROR))
                            {
                              v337 = [v118 name];
                              *(_DWORD *)v447 = 138412802;
                              v448 = (const char *)a1;
                              __int16 v449 = 2112;
                              v450 = v337;
                              __int16 v451 = 2112;
                              v452 = v321;
                              _os_log_error_impl(&dword_19DDAF000, v322, OS_LOG_TYPE_ERROR, "%@: SCPreferencesCommitChanges failed with configuration %@: %@", v447, 0x20u);
                            }
                            uint64_t v34 = -[NEConfigurationManager errorWithCode:specifics:](a1, 12, v321);

                            uint64_t v36 = 0;
                          }
                          else
                          {
                            SCNetworkServiceRef v41 = v376;
                            if (v288) {
                              goto LABEL_346;
                            }
LABEL_353:
                            objc_msgSend(v40, "encodeObject:forKey:", objc_getProperty((id)a1, v300, 120, 1), @"SCPreferencesSignature2");
                            [v40 finishEncoding];
                            uint64_t v36 = [v40 encodedData];
                            if ((unint64_t)[v36 length] <= 0x200000)
                            {
                              v377 = v41;
                              if ([v36 writeToFile:@"/Library/Preferences/com.apple.networkextension.plist" atomically:1])
                              {
                                objc_setProperty_atomic((id)a1, v310, 0, 80);
                                objc_setProperty_atomic((id)a1, v311, 0, 88);
                                *(void *)(a1 + 104) = v358;
                                id v43 = v411;
                                v312 = (void *)[v411 copy];
                                objc_setProperty_atomic((id)a1, v313, v312, 56);

                                long long v429 = 0u;
                                long long v430 = 0u;
                                long long v427 = 0u;
                                long long v428 = 0u;
                                id v314 = v422;
                                uint64_t v315 = [v314 countByEnumeratingWithState:&v427 objects:v441 count:16];
                                id v42 = v370;
                                if (v315)
                                {
                                  uint64_t v316 = v315;
                                  uint64_t v317 = *(void *)v428;
                                  do
                                  {
                                    for (uint64_t j = 0; j != v316; ++j)
                                    {
                                      if (*(void *)v428 != v317) {
                                        objc_enumerationMutation(v314);
                                      }
                                      -[NEConfigurationManager didLoadConfiguration:]((void *)a1, *(void **)(*((void *)&v427 + 1) + 8 * j));
                                    }
                                    uint64_t v316 = [v314 countByEnumeratingWithState:&v427 objects:v441 count:16];
                                  }
                                  while (v316);
                                }
                                uint64_t v38 = v314;

                                if (v400) {
                                  -[NEConfigurationManager postChangeNotificationWithGeneration:andFlags:onlyIfChanged:]((_DWORD *)a1, v358, v436, 0);
                                }
                                uint64_t v34 = 0;
                                uint64_t v33 = v375;
                                id v35 = v382;
                                int v37 = (void *)v402;
                                id v39 = v404;
                                CFStringRef v40 = v416;
                              }
                              else
                              {
                                v326 = ne_log_obj();
                                if (os_log_type_enabled(v326, OS_LOG_TYPE_ERROR))
                                {
                                  v338 = [v118 name];
                                  *(_DWORD *)v447 = 138412802;
                                  v448 = (const char *)a1;
                                  __int16 v449 = 2112;
                                  v450 = v338;
                                  __int16 v451 = 2080;
                                  v452 = "/Library/Preferences/com.apple.networkextension.plist";
                                  _os_log_error_impl(&dword_19DDAF000, v326, OS_LOG_TYPE_ERROR, "%@: Cannot save configuration %@, failed to write to %s", v447, 0x20u);
                                }
                                uint64_t v34 = -[NEConfigurationManager errorWithCode:specifics:](a1, 6, 0);
                                uint64_t v33 = v375;
                                id v35 = v382;
                                id v43 = v411;
                                int v37 = (void *)v402;
                                id v39 = v404;
                                id v42 = v370;
                                CFStringRef v40 = v416;
                                uint64_t v38 = v422;
                              }
                              SCNetworkServiceRef v41 = v377;
                              goto LABEL_115;
                            }
                            v309 = ne_log_obj();
                            if (os_log_type_enabled(v309, OS_LOG_TYPE_ERROR))
                            {
                              v335 = [v118 name];
                              uint64_t v336 = [v36 length];
                              *(_DWORD *)v447 = 138412802;
                              v448 = (const char *)a1;
                              __int16 v449 = 2112;
                              v450 = v335;
                              __int16 v451 = 2048;
                              v452 = (const char *)v336;
                              _os_log_error_impl(&dword_19DDAF000, v309, OS_LOG_TYPE_ERROR, "%@: Cannot save configuration %@, the total size of the NetworkExtension configuration is too large (%lu bytes)", v447, 0x20u);
                            }
                            uint64_t v34 = -[NEConfigurationManager errorWithCode:specifics:](a1, 20, 0);
                          }
                          uint64_t v33 = v375;
                          id v35 = v382;
                          id v43 = v411;
                          int v37 = (void *)v402;
                          id v39 = v404;
                          id v42 = v370;
                          CFStringRef v40 = v416;
LABEL_374:
                          uint64_t v38 = v422;
                          goto LABEL_115;
                        }
                        if (v16)
                        {
                          uint64_t v289 = [v370 objectForKeyedSubscript:@"PluginType"];
                          if (!v289
                            || (v290 = (void *)v289,
                                [v370 objectForKeyedSubscript:@"PluginType"],
                                v291 = objc_claimAutoreleasedReturnValue(),
                                char v292 = [v16 isEqualToString:v291],
                                v291,
                                v290,
                                (v292 & 1) == 0))
                          {
                            uint64_t v33 = v13;
                            uint64_t v327 = a1;
                            uint64_t v328 = 3;
                            goto LABEL_392;
                          }
                        }
                        uint64_t v293 = [v407 applicationIdentifier];
                        if (!v293) {
                          goto LABEL_120;
                        }
                        v294 = (void *)v293;
                        v295 = [v370 objectForKeyedSubscript:@"ApplicationID"];
                        if (v295)
                        {
                          v296 = [v407 applicationIdentifier];
                          a1 = [v370 objectForKeyedSubscript:@"ApplicationID"];
                          if ([(__objc2_class *)v296 isEqualToString:a1])
                          {

                            a1 = v409;
                            goto LABEL_120;
                          }
                          obuint64_t j = v296;
                          if (!v16) {
                            goto LABEL_389;
                          }
LABEL_383:
                          uint64_t v329 = [v370 objectForKeyedSubscript:@"PluginType"];
                          if (v329)
                          {
                            v330 = (void *)v329;
                            v331 = v16;
                            v332 = [v370 objectForKeyedSubscript:@"PluginType"];
                            v333 = v331;
                            char v334 = [v331 isEqualToString:v332];

                            if (v295)
                            {
                            }
                            uint64_t v16 = v333;
                            a1 = v409;
                            id v35 = v381;
                            id v13 = v112;
                            if (v334) {
                              goto LABEL_120;
                            }
LABEL_391:
                            uint64_t v33 = v13;
                            uint64_t v327 = a1;
                            uint64_t v328 = 4;
LABEL_392:
                            uint64_t v34 = -[NEConfigurationManager errorWithCode:specifics:](v327, v328, 0);
                            uint64_t v36 = 0;
                            uint64_t v38 = 0;
                            id v39 = 0;
                            CFStringRef v40 = 0;
                            SCNetworkServiceRef v41 = v376;
LABEL_393:
                            id v43 = v411;
                            int v37 = (void *)v402;
                            id v42 = v370;
                            goto LABEL_115;
                          }
                          if (v295)
                          {
LABEL_389:
                          }
                        }
                        else if (v16)
                        {
                          goto LABEL_383;
                        }

                        a1 = v409;
                        goto LABEL_391;
                      }
                    }
                    uint64_t v33 = v13;
                    uint64_t v34 = -[NEConfigurationManager errorWithCode:specifics:](a1, 5, 0);
                    uint64_t v36 = 0;
                    uint64_t v38 = 0;
                    id v39 = 0;
                    CFStringRef v40 = 0;
                  }
                  else
                  {
                    v370 = 0;
                    v376 = v41;
                    if (!v13) {
                      goto LABEL_120;
                    }
                    uint64_t v33 = v13;
                    uint64_t v34 = -[NEConfigurationManager errorWithCode:specifics:](a1, 5, 0);
                    uint64_t v36 = 0;
                    uint64_t v38 = 0;
                    id v39 = 0;
                    CFStringRef v40 = 0;
                    id v42 = 0;
                  }
                  id v43 = v411;
                  int v37 = (void *)v402;
                  goto LABEL_115;
                }
              }
            }
            char v59 = a7;
            long long v60 = [v46 appVPN];
LABEL_61:
            long long v64 = v60;
            long long v65 = [v60 protocol];

            a7 = v59;
            if (v65)
            {
              int v66 = [v65 passwordKeychainItem];

              if (v66)
              {
                long long v67 = [v65 passwordKeychainItem];
                [v67 setIdentifier:0];
              }
              uint64_t v68 = [v65 type];
              if (v68 != 1 && v68 != 2)
              {
                if (v68 != 5)
                {
LABEL_75:

                  goto LABEL_100;
                }
                char v414 = a7;
                int v69 = [v65 ppkConfiguration];
                v71 = v69;
                if (v69) {
                  int v69 = objc_getProperty(v69, v70, 32, 1);
                }
                id v72 = v69;

                a7 = v414;
                if (v72)
                {
                  SEL v73 = [v65 ppkConfiguration];
                  long long v75 = v73;
                  if (v73) {
                    SEL v73 = objc_getProperty(v73, v74, 32, 1);
                  }
                  id v76 = v73;
                  [v76 setIdentifier:0];

                  a7 = v414;
                }
              }
              long long v77 = [v65 sharedSecretKeychainItem];

              if (v77)
              {
                long long v78 = [v65 sharedSecretKeychainItem];
                [v78 setIdentifier:0];
              }
              goto LABEL_75;
            }
            goto LABEL_76;
          }
        }
        else
        {

          a1 = v409;
        }
        char v59 = a7;
        long long v60 = [v46 VPN];
        goto LABEL_61;
      }
    }
    uint64_t v20 = [v18 VPN];
    if (v20)
    {
      uint64_t v17 = [v18 VPN];
      if ([(__objc2_class *)v17 isEnabled])
      {
        char v425 = 1;
LABEL_43:

LABEL_44:
        a1 = v409;
        if (!v19) {
          goto LABEL_46;
        }
        goto LABEL_45;
      }
    }
    uint64_t v21 = [v18 appVPN];
    if (v21)
    {
      v420 = [v18 appVPN];
      if ([v420 isEnabled])
      {
        char v425 = 1;
LABEL_41:

LABEL_42:
        uint64_t v16 = v408;
        if (!v20) {
          goto LABEL_44;
        }
        goto LABEL_43;
      }
      obuint64_t j = v17;
    }
    else
    {
      obuint64_t j = v17;
    }
    uint64_t v22 = [v18 contentFilter];
    if (v22)
    {
      v417 = [v18 contentFilter];
      if ([v417 isEnabled])
      {
        char v425 = 1;
LABEL_39:

LABEL_40:
        uint64_t v17 = obj;
        if (!v21) {
          goto LABEL_42;
        }
        goto LABEL_41;
      }
    }
    uint64_t v23 = [v18 dnsProxy];
    uint64_t v24 = v18;
    long long v25 = (void *)v23;
    if (v23)
    {
      v403 = [v24 dnsProxy];
      if ([v403 isEnabled])
      {
        char v425 = 1;
LABEL_37:

LABEL_38:
        id v18 = v407;
        if (!v22) {
          goto LABEL_40;
        }
        goto LABEL_39;
      }
      char v413 = a7;
    }
    else
    {
      char v413 = a7;
    }
    uint64_t v410 = [v407 dnsSettings];
    if (v410)
    {
      id v383 = [v407 dnsSettings];
      if ([v383 isEnabled])
      {
        char v425 = 1;
        char v26 = v413;
        long long v27 = (void *)v410;
LABEL_35:

LABEL_36:
        a7 = v26;
        if (!v25) {
          goto LABEL_38;
        }
        goto LABEL_37;
      }
    }
    uint64_t v401 = [v407 appPush];
    if (v401)
    {
      v378 = [v407 appPush];
      if ([v378 isEnabled])
      {
        char v425 = 1;
        char v26 = v413;
        long long v28 = (void *)v401;
        goto LABEL_33;
      }
      id v372 = v13;
    }
    else
    {
      id v372 = v13;
    }
    uint64_t v29 = [v407 relay];
    if (v29)
    {
      uint64_t v30 = (void *)v29;
      uint64_t v31 = [v407 relay];
      char v425 = [v31 isEnabled];
    }
    else
    {
      char v425 = 0;
    }
    id v13 = v372;
    char v26 = v413;
    long long v28 = (void *)v401;
    if (!v401)
    {
LABEL_34:
      long long v27 = (void *)v410;
      if (!v410) {
        goto LABEL_36;
      }
      goto LABEL_35;
    }
LABEL_33:

    goto LABEL_34;
  }
  uint64_t v33 = v13;
  uint64_t v34 = 0;
LABEL_116:

  return v34;
}

- (id)makeMutableCopyOfIndex:(id)a1
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!a1) {
    goto LABEL_19;
  }
  if ((isa_nsdictionary(v3) & 1) == 0)
  {
    a1 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = 0;
    id v5 = 0;
LABEL_7:
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    goto LABEL_8;
  }
  id v5 = [v4 objectForKeyedSubscript:@"ConfigurationProperties"];
  id v6 = [v4 objectForKeyedSubscript:@"UserMap"];
  a1 = (id)[v4 mutableCopy];
  if (!v5 || !isa_nsdictionary(v5)) {
    goto LABEL_7;
  }
  id v7 = (id)[v5 mutableCopy];
LABEL_8:
  uint64_t v8 = v7;
  [a1 setObject:v7 forKeyedSubscript:@"ConfigurationProperties"];

  int v9 = isa_nsdictionary(v6);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v9)
  {
    uint64_t v20 = v6;
    uint64_t v21 = v5;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v17 = objc_msgSend(v11, "objectForKeyedSubscript:", v16, v20, v21, (void)v22);
          id v18 = (void *)[v17 mutableCopy];
          [v10 setObject:v18 forKeyedSubscript:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }

    [a1 setObject:v10 forKeyedSubscript:@"UserMap"];
    id v6 = v20;
    id v5 = v21;
  }
  else
  {
    [a1 setObject:v10 forKeyedSubscript:@"UserMap"];
  }
LABEL_19:

  return a1;
}

+ (void)disableConfiguration:(uint64_t)a1 onDemandOnly:(void *)a2
{
  id v18 = a2;
  self;
  uint64_t v2 = [v18 VPN];

  if (v2)
  {
    id v3 = [v18 VPN];
    [v3 setEnabled:0];
  }
  id v4 = [v18 appVPN];

  if (v4)
  {
    id v5 = [v18 appVPN];
    [v5 setEnabled:0];
  }
  id v6 = [v18 alwaysOnVPN];

  if (v6)
  {
    id v7 = [v18 alwaysOnVPN];
    [v7 setEnabled:0];
  }
  uint64_t v8 = [v18 contentFilter];

  if (v8)
  {
    int v9 = [v18 contentFilter];
    [v9 setEnabled:0];
  }
  id v10 = [v18 dnsProxy];

  if (v10)
  {
    id v11 = [v18 dnsProxy];
    [v11 setEnabled:0];
  }
  uint64_t v12 = [v18 dnsSettings];

  if (v12)
  {
    uint64_t v13 = [v18 dnsSettings];
    [v13 setEnabled:0];
  }
  uint64_t v14 = [v18 appPush];

  if (v14)
  {
    uint64_t v15 = [v18 appPush];
    [v15 setEnabled:0];
  }
  uint64_t v16 = [v18 relay];

  if (v16)
  {
    uint64_t v17 = [v18 relay];
    [v17 setEnabled:0];
  }
}

+ (void)updateFlags:(void *)a3 withConfiguration:
{
  id v60 = a3;
  self;
  id v5 = [v60 VPN];
  id v6 = v60;
  if (!v5) {
    goto LABEL_13;
  }
  id v7 = [v60 VPN];
  if (([v7 isEnabled] & 1) == 0)
  {
LABEL_12:

    id v6 = v60;
    goto LABEL_13;
  }
  uint64_t v8 = [v60 VPN];
  char v9 = [v8 isOnDemandEnabled];
  if ((v9 & 1) == 0)
  {
    id v3 = [v60 VPN];
    if (![v3 isDisconnectOnDemandEnabled])
    {

      goto LABEL_12;
    }
  }
  id v10 = [v60 VPN];
  id v11 = [v10 onDemandRules];

  if ((v9 & 1) == 0) {
  id v6 = v60;
  }
  if (v11)
  {
    *a2 |= 0x8000000000000000;
    uint64_t v12 = [v60 VPN];
    int v13 = [v12 isOnDemandEnabled];

    id v6 = v60;
    if (v13)
    {
      uint64_t v14 = [v60 VPN];
      uint64_t v15 = [v14 onDemandRules];
      uint64_t v16 = [v15 indexOfObjectPassingTest:&__block_literal_global_103];

      id v6 = v60;
      if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
        *a2 |= 0x40000000000000uLL;
      }
    }
  }
LABEL_13:
  uint64_t v17 = [v6 VPN];
  if (v17)
  {
    id v18 = (void *)v17;
    uint64_t v19 = [v60 VPN];
    if ([v19 isEnabled])
    {
      uint64_t v20 = [v60 VPN];
      uint64_t v21 = [v20 protocol];
      int v22 = [v21 includeAllNetworks];

      if (v22) {
        *a2 |= 0x80000000000000uLL;
      }
    }
    else
    {
    }
  }
  long long v23 = [v60 appVPN];
  long long v24 = v60;
  if (v23)
  {
    long long v25 = [v60 appVPN];
    if ([v25 isEnabled])
    {
      uint64_t v26 = [v60 grade];

      long long v24 = v60;
      if (v26 != 3)
      {
        uint64_t v27 = [v60 appVPN];
        if ([v27 isOnDemandEnabled])
        {
        }
        else
        {
          long long v28 = [v60 appVPN];
          char v29 = [v28 isDisconnectOnDemandEnabled];

          if ((v29 & 1) == 0)
          {
            unint64_t v30 = *a2;
            goto LABEL_27;
          }
        }
        unint64_t v30 = *a2 | 0x8000000000000000;
LABEL_27:
        long long v24 = v60;
        *a2 = v30 | 0x4000000000000000;
      }
    }
    else
    {

      long long v24 = v60;
    }
  }
  uint64_t v31 = [v24 alwaysOnVPN];
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    uint64_t v33 = [v60 alwaysOnVPN];
    int v34 = [v33 isEnabled];

    if (v34) {
      *a2 |= 0x2000000000000000uLL;
    }
  }
  uint64_t v35 = [v60 dnsProxy];
  if (v35)
  {
    uint64_t v36 = (void *)v35;
    int v37 = [v60 dnsProxy];
    int v38 = [v37 isEnabled];

    if (v38) {
      *a2 |= 0x800000000000000uLL;
    }
  }
  uint64_t v39 = [v60 contentFilter];
  if (v39)
  {
    CFStringRef v40 = (void *)v39;
    SCNetworkServiceRef v41 = [v60 contentFilter];
    int v42 = [v41 isEnabled];

    if (v42) {
      *a2 |= 0x1000000000000000uLL;
    }
  }
  uint64_t v43 = [v60 dnsSettings];
  if (v43)
  {
    id v44 = (void *)v43;
    v45 = [v60 dnsSettings];
    int v46 = [v45 isEnabled];

    if (v46) {
      *a2 |= 0x200000000000000uLL;
    }
  }
  uint64_t v47 = [v60 pathController];
  if (v47)
  {
    uint64_t v48 = (void *)v47;
    uint64_t v49 = [v60 pathController];
    if ([v49 isEnabled])
    {
      v50 = [v60 pathController];
      int v51 = [v50 hasNonDefaultRules];

      if (v51) {
        *a2 |= 0x400000000000000uLL;
      }
    }
    else
    {
    }
  }
  uint64_t v52 = [v60 appPush];
  if (v52)
  {
    SEL v53 = (void *)v52;
    uint64_t v54 = [v60 appPush];
    int v55 = [v54 isEnabled];

    if (v55) {
      *a2 |= 0x100000000000000uLL;
    }
  }
  uint64_t v56 = [v60 relay];
  if (v56)
  {
    char v57 = (void *)v56;
    v58 = [v60 relay];
    int v59 = [v58 isEnabled];

    if (v59) {
      *a2 |= 0x20000000000000uLL;
    }
  }
}

- (void)postChangeNotificationWithGeneration:(uint64_t)a3 andFlags:(int)a4 onlyIfChanged:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  -[NEConfigurationManager registerForChangeNotifications](a1);
  int v8 = a1[7];
  if (v8 == -1) {
    return;
  }
  if (a4)
  {
    uint64_t state64 = 0;
    if (!notify_get_state(v8, &state64) && (a3 & 0xFFE0000000000000 | (unint64_t)a2) == state64)
    {
      char v9 = ne_log_obj();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
LABEL_13:

        return;
      }
      *(_DWORD *)buf = 134217984;
      unint64_t v30 = (const char *)state64;
      id v10 = "Not posting a change notification because the current notify state is equal to the new notify state (%llx)";
      id v11 = v9;
      uint32_t v12 = 12;
LABEL_8:
      _os_log_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      goto LABEL_13;
    }
    int v8 = a1[7];
  }
  uint32_t v13 = notify_set_state(v8, a3 & 0xFFE0000000000000 | (unint64_t)a2);
  if (v13)
  {
    uint32_t v14 = v13;
    char v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v27 = a1[7];
      *(_DWORD *)buf = 136315650;
      unint64_t v30 = "com.apple.neconfigurationchanged";
      __int16 v31 = 1024;
      int v32 = v27;
      __int16 v33 = 1024;
      uint32_t v34 = v14;
      _os_log_fault_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_FAULT, "Failed to set the %s (token %u) notification state: %u", buf, 0x18u);
    }
    goto LABEL_13;
  }
  uint32_t v15 = notify_post("com.apple.neconfigurationchanged");
  uint64_t v16 = ne_log_obj();
  uint64_t v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v30 = "com.apple.neconfigurationchanged";
      _os_log_fault_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_FAULT, "Failed to post the %s notification", buf, 0xCu);
    }

    return;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v30 = a2;
    _os_log_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_DEFAULT, "Successfully posted generation %lld", buf, 0xCu);
  }

  if (a3 < 0)
  {
    id v18 = ne_log_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_DEFAULT, "On Demand configuration is enabled", buf, 2u);
    }

    if ((a3 & 0x80000000000000) == 0)
    {
LABEL_23:
      if ((a3 & 0x4000000000000000) == 0) {
        goto LABEL_24;
      }
      goto LABEL_38;
    }
  }
  else if ((a3 & 0x80000000000000) == 0)
  {
    goto LABEL_23;
  }
  uint64_t v19 = ne_log_obj();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_DEFAULT, "VPN IncludeAllNetworks configuration is enabled", buf, 2u);
  }

  if ((a3 & 0x4000000000000000) == 0)
  {
LABEL_24:
    if ((a3 & 0x2000000000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_41;
  }
LABEL_38:
  uint64_t v20 = ne_log_obj();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19DDAF000, v20, OS_LOG_TYPE_DEFAULT, "App VPN configuration is enabled", buf, 2u);
  }

  if ((a3 & 0x2000000000000000) == 0)
  {
LABEL_25:
    if ((a3 & 0x800000000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_44;
  }
LABEL_41:
  uint64_t v21 = ne_log_obj();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19DDAF000, v21, OS_LOG_TYPE_DEFAULT, "Always On VPN is enabled", buf, 2u);
  }

  if ((a3 & 0x800000000000000) == 0)
  {
LABEL_26:
    if ((a3 & 0x200000000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_47;
  }
LABEL_44:
  int v22 = ne_log_obj();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_DEFAULT, "DNS proxy is enabled", buf, 2u);
  }

  if ((a3 & 0x200000000000000) == 0)
  {
LABEL_27:
    if ((a3 & 0x1000000000000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_50;
  }
LABEL_47:
  long long v23 = ne_log_obj();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_DEFAULT, "DNS settings are enabled", buf, 2u);
  }

  if ((a3 & 0x1000000000000000) == 0)
  {
LABEL_28:
    if ((a3 & 0x400000000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_53;
  }
LABEL_50:
  long long v24 = ne_log_obj();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_DEFAULT, "Content Filter is enabled", buf, 2u);
  }

  if ((a3 & 0x400000000000000) == 0)
  {
LABEL_29:
    if ((a3 & 0x100000000000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_56;
  }
LABEL_53:
  long long v25 = ne_log_obj();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_DEFAULT, "Path Controller is enabled", buf, 2u);
  }

  if ((a3 & 0x100000000000000) == 0)
  {
LABEL_30:
    if ((a3 & 0x20000000000000) == 0) {
      return;
    }
LABEL_59:
    char v9 = ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    id v10 = "Relay configuration is enabled";
    id v11 = v9;
    uint32_t v12 = 2;
    goto LABEL_8;
  }
LABEL_56:
  uint64_t v26 = ne_log_obj();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_DEFAULT, "App push is enabled", buf, 2u);
  }

  if ((a3 & 0x20000000000000) != 0) {
    goto LABEL_59;
  }
}

uint64_t __56__NEConfigurationManager_updateFlags_withConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)handleFileRemovedWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  if (self) {
    id Property = objc_getProperty(self, v7, 40, 1);
  }
  else {
    id Property = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__NEConfigurationManager_handleFileRemovedWithCompletionQueue_completionHandler___block_invoke;
  block[3] = &unk_1E5992CA0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  dispatch_async(Property, block);
}

void __81__NEConfigurationManager_handleFileRemovedWithCompletionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    unint64_t v3 = *(void *)(v2 + 104);
  }
  else {
    unint64_t v3 = 0;
  }
  id v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v6 = 0;
    _os_log_debug_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEBUG, "handleFileRemoved\n", v6, 2u);
  }
  if (v3 <= 0x1FFFFFFFFFFFFELL) {
    uint64_t v5 = v3 + 1;
  }
  else {
    uint64_t v5 = 1;
  }

  -[NEConfigurationManager postChangeNotificationWithGeneration:andFlags:onlyIfChanged:](*(_DWORD **)(a1 + 32), (const char *)v5, 0, 0);
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), *(dispatch_block_t *)(a1 + 48));
}

- (void)removeConfiguration:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__NEConfigurationManager_removeConfiguration_withCompletionQueue_handler___block_invoke;
  v14[3] = &unk_1E598F758;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  -[NEConfigurationManager getCurrentIndexWithCompletionHandler:](self, v14);
}

void __74__NEConfigurationManager_removeConfiguration_withCompletionQueue_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      id v17 = [*(id *)(a1 + 40) name];
      *(_DWORD *)buf = 138412802;
      uint64_t v26 = v16;
      __int16 v27 = 2112;
      long long v28 = v17;
      __int16 v29 = 2112;
      id v30 = v3;
      _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "%@: Failed to get the configuration index while removing configuration %@: %@", buf, 0x20u);
    }
    uint64_t v5 = *(void *)(a1 + 32);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __74__NEConfigurationManager_removeConfiguration_withCompletionQueue_handler___block_invoke_246;
    v18[3] = &unk_1E59936F8;
    id v6 = *(void **)(a1 + 48);
    id v20 = *(id *)(a1 + 56);
    id v19 = v3;
    -[NEConfigurationManager executeCallbackOnQueue:callback:](v5, v6, v18);
  }
  else
  {
    *(void *)uuid = 0;
    uint64_t v33 = 0;
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    id v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = [*(id *)(a1 + 40) name];
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = v9;
      __int16 v27 = 2112;
      long long v28 = v10;
      _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEFAULT, "%@: Removing configuration %@", buf, 0x16u);
    }
    id v11 = *(void **)(a1 + 32);
    id v12 = [*(id *)(a1 + 40) identifier];
    __int16 v31 = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    -[NEConfigurationManager clearLoadedConfigurationsWithIDs:](v11, v13);

    id v14 = [*(id *)(a1 + 40) identifier];
    [v14 getUUIDBytes:uuid];

    xpc_dictionary_set_int64(v7, "config-operation", 4);
    xpc_dictionary_set_uuid(v7, "config-identifier", uuid);
    id v15 = *(void **)(a1 + 32);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __74__NEConfigurationManager_removeConfiguration_withCompletionQueue_handler___block_invoke_244;
    v21[3] = &unk_1E598F7D0;
    v21[4] = v15;
    id v22 = *(id *)(a1 + 40);
    id v23 = *(id *)(a1 + 48);
    id v24 = *(id *)(a1 + 56);
    -[NEConfigurationManager sendRequest:responseHandler:](v15, v7, v21);
  }
}

void __74__NEConfigurationManager_removeConfiguration_withCompletionQueue_handler___block_invoke_244(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (a2) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = 11;
  }
  if (v8
    && (-[NEConfigurationManager errorWithCode:specifics:](*(void *)(a1 + 32), v8, 0),
        (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v10 = (void *)v9;
    id v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v21 = [*(id *)(a1 + 40) name];
      *(_DWORD *)buf = 138412802;
      uint64_t v26 = v20;
      __int16 v27 = 2112;
      long long v28 = v21;
      __int16 v29 = 2112;
      id v30 = v10;
      _os_log_error_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_ERROR, "%@: Failed to remove configuration %@: %@", buf, 0x20u);
    }
  }
  else
  {
    id v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      id v14 = [*(id *)(a1 + 40) name];
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = v13;
      __int16 v27 = 2112;
      long long v28 = v14;
      _os_log_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_DEFAULT, "%@: Successfully removed configuration %@", buf, 0x16u);
    }
    id v15 = *(void **)(a1 + 40);
    if (v15) {
      -[NEConfiguration clearKeychainInDomain:](v15, 1);
    }
    id v10 = 0;
  }
  uint64_t v16 = *(void *)(a1 + 32);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __74__NEConfigurationManager_removeConfiguration_withCompletionQueue_handler___block_invoke_245;
  v22[3] = &unk_1E59936F8;
  id v17 = *(void **)(a1 + 48);
  id v18 = *(id *)(a1 + 56);
  id v23 = v10;
  id v24 = v18;
  id v19 = v10;
  -[NEConfigurationManager executeCallbackOnQueue:callback:](v16, v17, v22);
}

uint64_t __74__NEConfigurationManager_removeConfiguration_withCompletionQueue_handler___block_invoke_246(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __74__NEConfigurationManager_removeConfiguration_withCompletionQueue_handler___block_invoke_245(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)saveConfiguration:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  if (([v9 checkValidityAndCollectErrors:v12] & 1) == 0)
  {
    uint64_t v49 = [v12 componentsJoinedByString:@"\n"];
    v50 = -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)self, 2, v49);

    int v51 = ne_log_obj();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      id v60 = [v9 name];
      *(_DWORD *)buf = 138412802;
      char v99 = self;
      __int16 v100 = 2112;
      id v101 = v60;
      __int16 v102 = 2112;
      int v103 = v50;
      _os_log_error_impl(&dword_19DDAF000, v51, OS_LOG_TYPE_ERROR, "%@ Failed to save configuration %@ because it is invalid: %@", buf, 0x20u);
    }
    v94[0] = MEMORY[0x1E4F143A8];
    v94[1] = 3221225472;
    v94[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke;
    v94[3] = &unk_1E59936F8;
    id v95 = v50;
    id v96 = v11;
    id v52 = v50;
    -[NEConfigurationManager executeCallbackOnQueue:callback:]((uint64_t)self, v10, v94);

    goto LABEL_52;
  }
  uint64_t v13 = [v9 externalIdentifier];
  if (v13)
  {
  }
  else
  {
    v58 = [v9 contentFilter];
    if (!v58)
    {
      uint64_t v5 = [v9 dnsProxy];
      if (!v5) {
        goto LABEL_44;
      }
    }
    int v59 = [v9 payloadInfo];

    if (v58)
    {

      if (!v59) {
        goto LABEL_44;
      }
    }
    else
    {

      if (!v59) {
        goto LABEL_44;
      }
    }
  }
  if (self) {
    id Property = objc_getProperty(self, v14, 88, 1);
  }
  else {
    id Property = 0;
  }
  [Property allKeys];
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v76 = [v16 countByEnumeratingWithState:&v90 objects:v97 count:16];
  if (!v76)
  {
LABEL_43:

LABEL_44:
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_2_224;
    v77[3] = &unk_1E598F758;
    v77[4] = self;
    id v78 = v9;
    id v79 = v10;
    id v80 = v11;
    -[NEConfigurationManager getCurrentIndexWithCompletionHandler:](self, v77);

    goto LABEL_52;
  }
  v71 = v12;
  id v72 = v11;
  id v18 = 0;
  uint64_t v75 = *(void *)v91;
  SEL v73 = v10;
  id v74 = v9;
LABEL_8:
  uint64_t v19 = 0;
  while (1)
  {
    uint64_t v20 = v18;
    if (*(void *)v91 != v75) {
      objc_enumerationMutation(v16);
    }
    uint64_t v21 = *(void *)(*((void *)&v90 + 1) + 8 * v19);
    if (self) {
      id v22 = objc_getProperty(self, v17, 88, 1);
    }
    else {
      id v22 = 0;
    }
    id v18 = [v22 objectForKeyedSubscript:v21];

    if (!v18) {
      goto LABEL_27;
    }
    id v23 = v16;
    id v24 = self;
    long long v25 = [v9 contentFilter];

    if (v25)
    {
      uint64_t v26 = [v18 contentFilter];
      goto LABEL_18;
    }
    __int16 v27 = [v9 dnsProxy];

    if (v27) {
      break;
    }
LABEL_22:
    id v30 = [v18 payloadInfo];
    if (([v30 isSetAside] & 1) == 0)
    {
      uint64_t v31 = [v18 identifier];
      int v32 = [v9 identifier];
      if (![v31 isEqual:v32])
      {
        uint64_t v33 = [v18 externalIdentifier];
        uint64_t v34 = [v9 externalIdentifier];
        int v35 = [v33 isEqual:v34];

        id v9 = v74;
        self = v24;
        id v16 = v23;
        if (v35)
        {
          SEL v53 = ne_log_obj();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            long long v65 = (NEConfigurationManager *)objc_opt_class();
            int v66 = v65;
            long long v67 = [v18 externalIdentifier];
            uint64_t v68 = [v18 name];
            *(_DWORD *)buf = 138412802;
            char v99 = v65;
            __int16 v100 = 2112;
            id v101 = v67;
            __int16 v102 = 2112;
            int v103 = v68;
            _os_log_error_impl(&dword_19DDAF000, v53, OS_LOG_TYPE_ERROR, "%@ saveConfiguration: failed to save - perApp UUID %@ already assigned to another configuration - %@", buf, 0x20u);

            id v9 = v74;
          }

          uint64_t v54 = -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)v24, 2, @"Duplicate perApp UUID");
          v81[0] = MEMORY[0x1E4F143A8];
          v81[1] = 3221225472;
          v81[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_223;
          v81[3] = &unk_1E59936F8;
          id v11 = v72;
          id v82 = v54;
          id v83 = v72;
          id v55 = v54;
          uint64_t v56 = (uint64_t)v24;
          id v10 = v73;
          -[NEConfigurationManager executeCallbackOnQueue:callback:](v56, v73, v81);

          id v57 = v83;
          goto LABEL_51;
        }
        goto LABEL_27;
      }
    }
    self = v24;
    id v16 = v23;
LABEL_27:
    if (v76 == ++v19)
    {
      uint64_t v48 = [v16 countByEnumeratingWithState:&v90 objects:v97 count:16];
      uint64_t v76 = v48;
      if (!v48)
      {

        id v11 = v72;
        id v10 = v73;
        id v12 = v71;
        goto LABEL_43;
      }
      goto LABEL_8;
    }
  }
  uint64_t v26 = [v18 dnsProxy];
LABEL_18:
  long long v28 = v26;

  if (!v28) {
    goto LABEL_22;
  }
  __int16 v29 = [v18 externalIdentifier];
  if (v29 || ([v9 externalIdentifier], (__int16 v29 = objc_claimAutoreleasedReturnValue()) != 0))
  {

    goto LABEL_22;
  }
  uint64_t v36 = [v18 identifier];
  int v37 = [v9 identifier];
  if ([v36 isEqual:v37])
  {

    goto LABEL_22;
  }
  int v38 = [v18 payloadInfo];

  if (!v38) {
    goto LABEL_22;
  }
  uint64_t v39 = [v9 contentFilter];
  if (v39) {
    CFStringRef v40 = "Content Filter";
  }
  else {
    CFStringRef v40 = "DNS proxy";
  }

  SCNetworkServiceRef v41 = [v18 payloadInfo];
  int v42 = [v41 profileIdentifier];
  uint64_t v43 = [v9 payloadInfo];
  id v44 = [v43 profileIdentifier];
  char v45 = [v42 isEqualToString:v44];

  if (v45)
  {
    if (v24) {
      id v47 = objc_getProperty(v24, v46, 40, 1);
    }
    else {
      id v47 = 0;
    }
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    id v9 = v74;
    v84[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_2;
    v84[3] = &unk_1E598F7A8;
    v84[4] = v24;
    __int16 v86 = v40;
    id v85 = v18;
    [(NEConfigurationManager *)v24 removeConfiguration:v85 withCompletionQueue:v47 handler:v84];

    goto LABEL_22;
  }
  objc_msgSend(NSString, "stringWithFormat:", @"multiple system-wide %s configurations are not allowed", v40);
  id v55 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v61 = ne_log_obj();
  id v16 = v23;
  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
  {
    int v69 = (NEConfigurationManager *)objc_opt_class();
    *(_DWORD *)buf = 138412546;
    char v99 = v69;
    __int16 v100 = 2112;
    id v101 = v55;
    long long v70 = v69;
    _os_log_error_impl(&dword_19DDAF000, v61, OS_LOG_TYPE_ERROR, "%@ saveConfiguration: %@", buf, 0x16u);
  }
  long long v62 = -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)v24, 10, v55);
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_219;
  v87[3] = &unk_1E59936F8;
  id v11 = v72;
  id v63 = v72;
  id v88 = v62;
  id v89 = v63;
  id v57 = v62;
  uint64_t v64 = (uint64_t)v24;
  id v10 = v73;
  -[NEConfigurationManager executeCallbackOnQueue:callback:](v64, v73, v87);

  id v9 = v74;
LABEL_51:
  id v12 = v71;

LABEL_52:
}

uint64_t __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = objc_opt_class();
      uint64_t v8 = a1 + 40;
      id v6 = *(void **)(a1 + 40);
      uint64_t v7 = *(void *)(v8 + 8);
      id v9 = v5;
      id v10 = [v6 name];
      int v11 = 138413058;
      id v12 = v5;
      __int16 v13 = 2080;
      uint64_t v14 = v7;
      __int16 v15 = 2112;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "%@ saveConfiguration: failed to remove old %s config: %@: %@", (uint8_t *)&v11, 0x2Au);
    }
  }
}

uint64_t __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_219(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_223(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_2_224(uint64_t a1, void *a2)
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = *(void *)(a1 + 32);
      int v35 = [*(id *)(a1 + 40) name];
      *(_DWORD *)buf = 138412802;
      uint64_t v110 = v34;
      __int16 v111 = 2112;
      id v112 = v35;
      __int16 v113 = 2112;
      uint64_t v114 = (uint64_t)v4;
      _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "%@: Failed to get the configuration index while saving configuration %@: %@", buf, 0x20u);
    }
    uint64_t v6 = *(void *)(a1 + 32);
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_242;
    v87[3] = &unk_1E59936F8;
    uint64_t v7 = *(void **)(a1 + 48);
    id v8 = *(id *)(a1 + 56);
    id v88 = v4;
    id v89 = v8;
    id v9 = v4;
    -[NEConfigurationManager executeCallbackOnQueue:callback:](v6, v7, v87);

    id v10 = v89;
    goto LABEL_56;
  }
  int v11 = *(void **)(a1 + 32);
  id v12 = [*(id *)(a1 + 40) identifier];
  LODWORD(v11) = -[NEConfigurationManager configurationHasChanged:](v11, v12);

  if (!v11)
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v13, 80, 1);
    }
    uint64_t v20 = *(void **)(a1 + 40);
    id v21 = Property;
    id v22 = [v20 identifier];
    id v9 = [v21 objectForKeyedSubscript:v22];

    id v23 = ne_log_obj();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = *(void *)(a1 + 32);
      long long v25 = [*(id *)(a1 + 40) name];
      *(_DWORD *)buf = 138412802;
      uint64_t v110 = v24;
      __int16 v111 = 2112;
      id v112 = v25;
      __int16 v113 = 2112;
      uint64_t v114 = (uint64_t)v9;
      _os_log_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_DEFAULT, "%@ Saving configuration %@ with existing signature %@", buf, 0x20u);
    }
    uint64_t v26 = *(void **)(a1 + 40);
    if (v26)
    {
      -[NEConfiguration syncWithKeychainInDomain:](v26, 1);
      uint64_t v26 = *(void **)(a1 + 40);
    }
    __int16 v27 = [v26 generateSignature];
    id v10 = v27;
    if (!v9 || ![v27 isEqualToData:v9]) {
      goto LABEL_40;
    }
    long long v28 = *(void **)(a1 + 40);
    if (v28)
    {
      uint64_t v29 = [*(id *)(a1 + 40) VPN];
      if (!v29) {
        goto LABEL_21;
      }
      id v30 = (void *)v29;
      uint64_t v31 = [v28 VPN];
      int v32 = [v31 protocol];

      if (v32)
      {
        uint64_t v33 = [v28 VPN];
      }
      else
      {
LABEL_21:
        uint64_t v36 = [v28 appVPN];
        if (!v36) {
          goto LABEL_26;
        }
        int v37 = (void *)v36;
        int v38 = [v28 appVPN];
        uint64_t v39 = [v38 protocol];

        if (!v39)
        {
LABEL_26:
          uint64_t v43 = [v28 alwaysOnVPN];

          if (v43)
          {
            long long v107 = 0u;
            long long v108 = 0u;
            long long v105 = 0u;
            long long v106 = 0u;
            id v44 = [v28 alwaysOnVPN];
            char v45 = [v44 interfaceProtocolMapping];

            obuint64_t j = v45;
            uint64_t v46 = [v45 countByEnumeratingWithState:&v105 objects:buf count:16];
            if (v46)
            {
              uint64_t v47 = v46;
              uint64_t v48 = *(void *)v106;
              while (2)
              {
                for (uint64_t i = 0; i != v47; ++i)
                {
                  if (*(void *)v106 != v48) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v50 = *(void *)(*((void *)&v105 + 1) + 8 * i);
                  uint64_t v51 = [v28 alwaysOnVPN];
                  id v52 = [(id)v51 interfaceProtocolMapping];
                  SEL v53 = [v52 objectForKeyedSubscript:v50];

                  LOBYTE(v51) = [v53 needToUpdateKeychain];
                  if (v51)
                  {

                    goto LABEL_40;
                  }
                }
                uint64_t v47 = [obj countByEnumeratingWithState:&v105 objects:buf count:16];
                if (v47) {
                  continue;
                }
                break;
              }
            }
          }
          goto LABEL_36;
        }
        uint64_t v33 = [v28 appVPN];
      }
      CFStringRef v40 = v33;
      SCNetworkServiceRef v41 = [v33 protocol];
      char v42 = [v41 needToUpdateKeychain];

      if (v42)
      {
LABEL_40:
        id v60 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
        [v60 encodeObject:*(void *)(a1 + 40) forKey:@"config-object"];
        [v60 finishEncoding];
        id v63 = [v60 encodedData];
        if ((unint64_t)[v63 length] <= 0x80000)
        {
          if ((unint64_t)[v63 length] <= 0x80000)
          {
            xpc_object_t v69 = xpc_dictionary_create(0, 0, 0);
            xpc_dictionary_set_int64(v69, "config-operation", 3);
            xpc_dictionary_set_data(v69, "config-data", (const void *)[v63 bytes], objc_msgSend(v63, "length"));
            if (v9)
            {
              id v76 = v9;
              xpc_dictionary_set_data(v69, "config-signature", (const void *)[v76 bytes], objc_msgSend(v76, "length"));
            }
            long long v77 = *(void **)(a1 + 40);
            if (v77)
            {
              int64_t v78 = v77[20];
              if (v78)
              {
                xpc_dictionary_set_int64(v69, "permission-type", v78);
                long long v77 = *(void **)(a1 + 40);
              }
            }
            id v79 = *(void **)(a1 + 32);
            v90[0] = MEMORY[0x1E4F143A8];
            v90[1] = 3221225472;
            v90[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_2_238;
            v90[3] = &unk_1E598F7D0;
            v90[4] = v79;
            long long v91 = v77;
            id v92 = *(id *)(a1 + 48);
            id v93 = *(id *)(a1 + 56);
            -[NEConfigurationManager sendRequest:responseHandler:](v79, v69, v90);

            long long v70 = v91;
          }
          else
          {
            v71 = ne_log_obj();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
            {
              uint64_t v83 = *(void *)(a1 + 32);
              uint64_t v84 = [*(id *)(a1 + 40) identifier];
              uint64_t v85 = [v63 length];
              *(_DWORD *)buf = 138412802;
              uint64_t v110 = v83;
              __int16 v111 = 2112;
              id v112 = v84;
              __int16 v113 = 2048;
              uint64_t v114 = v85;
              _os_log_error_impl(&dword_19DDAF000, v71, OS_LOG_TYPE_ERROR, "%@ Configuration %@ is too large (%lu)", buf, 0x20u);
            }
            id v72 = objc_msgSend([NSString alloc], "initWithFormat:", @"The configuration is too large (%lu bytes). The maximum size is %d bytes", objc_msgSend(v63, "length"), 0x80000);
            uint64_t v73 = *(void *)(a1 + 32);
            v94[0] = MEMORY[0x1E4F143A8];
            v94[1] = 3221225472;
            v94[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_234;
            v94[3] = &unk_1E5992CA0;
            id v74 = *(void **)(a1 + 48);
            id v75 = *(id *)(a1 + 56);
            id v95 = v72;
            id v96 = v75;
            void v94[4] = *(void *)(a1 + 32);
            xpc_object_t v69 = v72;
            -[NEConfigurationManager executeCallbackOnQueue:callback:](v73, v74, v94);

            long long v70 = v96;
          }
        }
        else
        {
          uint64_t v64 = ne_log_obj();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            uint64_t v80 = *(void *)(a1 + 32);
            long long v81 = [*(id *)(a1 + 40) identifier];
            uint64_t v82 = [v63 length];
            *(_DWORD *)buf = 138412802;
            uint64_t v110 = v80;
            __int16 v111 = 2112;
            id v112 = v81;
            __int16 v113 = 2048;
            uint64_t v114 = v82;
            _os_log_error_impl(&dword_19DDAF000, v64, OS_LOG_TYPE_ERROR, "%@ Configuration %@ is too large (%lu)", buf, 0x20u);
          }
          long long v65 = objc_msgSend([NSString alloc], "initWithFormat:", @"The configuration is too large (%lu bytes). The maximum size is %d bytes", objc_msgSend(v63, "length"), 0x80000);
          uint64_t v66 = *(void *)(a1 + 32);
          v97[0] = MEMORY[0x1E4F143A8];
          v97[1] = 3221225472;
          v97[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_233;
          v97[3] = &unk_1E5992CA0;
          long long v67 = *(void **)(a1 + 48);
          id v68 = *(id *)(a1 + 56);
          id v98 = v65;
          id v99 = v68;
          v97[4] = *(void *)(a1 + 32);
          xpc_object_t v69 = v65;
          -[NEConfigurationManager executeCallbackOnQueue:callback:](v66, v67, v97);

          long long v70 = v99;
        }

LABEL_55:
        goto LABEL_56;
      }
    }
LABEL_36:
    uint64_t v54 = ne_log_obj();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v55 = *(void *)(a1 + 32);
      uint64_t v56 = [*(id *)(a1 + 40) name];
      *(_DWORD *)buf = 138412546;
      uint64_t v110 = v55;
      __int16 v111 = 2112;
      id v112 = v56;
      _os_log_impl(&dword_19DDAF000, v54, OS_LOG_TYPE_DEFAULT, "%@ Configuration %@ is unchanged", buf, 0x16u);
    }
    uint64_t v57 = *(void *)(a1 + 32);
    v100[0] = MEMORY[0x1E4F143A8];
    v100[1] = 3221225472;
    v100[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_226;
    v100[3] = &unk_1E59936F8;
    v58 = *(void **)(a1 + 48);
    id v59 = *(id *)(a1 + 56);
    v100[4] = *(void *)(a1 + 32);
    id v101 = v59;
    -[NEConfigurationManager executeCallbackOnQueue:callback:](v57, v58, v100);
    id v60 = v101;
    goto LABEL_55;
  }
  uint64_t v14 = ne_log_obj();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uint64_t v61 = *(void *)(a1 + 32);
    long long v62 = [*(id *)(a1 + 40) name];
    *(_DWORD *)buf = 138412546;
    uint64_t v110 = v61;
    __int16 v111 = 2112;
    id v112 = v62;
    _os_log_error_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_ERROR, "%@ Failed to save configuration %@ because the local copy is stale", buf, 0x16u);
  }
  __int16 v15 = -[NEConfigurationManager errorWithCode:specifics:](*(void *)(a1 + 32), 5, 0);
  uint64_t v16 = *(void *)(a1 + 32);
  v102[0] = MEMORY[0x1E4F143A8];
  v102[1] = 3221225472;
  v102[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_225;
  v102[3] = &unk_1E59936F8;
  __int16 v17 = *(void **)(a1 + 48);
  id v18 = *(id *)(a1 + 56);
  id v103 = v15;
  id v104 = v18;
  id v9 = v15;
  -[NEConfigurationManager executeCallbackOnQueue:callback:](v16, v17, v102);

  id v10 = v104;
LABEL_56:
}

uint64_t __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_225(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_226(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  -[NEConfigurationManager errorWithCode:specifics:](*(void *)(a1 + 32), 9, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_233(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  -[NEConfigurationManager errorWithCode:specifics:](*(void *)(a1 + 32), 2, *(void **)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_234(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  -[NEConfigurationManager errorWithCode:specifics:](*(void *)(a1 + 32), 2, *(void **)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_2_238(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (a2) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = 11;
  }
  if (v8
    && (-[NEConfigurationManager errorWithCode:specifics:](*(void *)(a1 + 32), v8, 0),
        (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v10 = (void *)v9;
    int v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      uint64_t v24 = [*(id *)(a1 + 40) name];
      *(_DWORD *)buf = 138412802;
      uint64_t v34 = v23;
      __int16 v35 = 2112;
      uint64_t v36 = v24;
      __int16 v37 = 2112;
      int v38 = v10;
      _os_log_error_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_ERROR, "%@ Failed to save configuration %@: %@", buf, 0x20u);
    }
    uint64_t v12 = *(void *)(a1 + 32);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_239;
    v29[3] = &unk_1E59936F8;
    __int16 v13 = *(void **)(a1 + 48);
    id v14 = *(id *)(a1 + 56);
    id v30 = v10;
    id v31 = v14;
    id v15 = v10;
    -[NEConfigurationManager executeCallbackOnQueue:callback:](v12, v13, v29);
  }
  else
  {
    uint64_t v16 = ne_log_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      id v18 = [*(id *)(a1 + 40) name];
      *(_DWORD *)buf = 138412546;
      uint64_t v34 = v17;
      __int16 v35 = 2112;
      uint64_t v36 = v18;
      _os_log_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_DEFAULT, "%@ Successfully saved configuration %@", buf, 0x16u);
    }
    uint64_t v19 = *(unsigned char **)(a1 + 32);
    uint64_t v20 = [*(id *)(a1 + 40) identifier];
    int v32 = v20;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_240;
    v25[3] = &unk_1E598F758;
    id v22 = *(void **)(a1 + 40);
    v25[4] = *(void *)(a1 + 32);
    id v26 = v22;
    id v27 = *(id *)(a1 + 48);
    id v28 = *(id *)(a1 + 56);
    -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](v19, v21, v25);
  }
}

uint64_t __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_242(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_239(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_240(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = [*(id *)(a1 + 40) name];
      uint64_t v9 = [*(id *)(a1 + 40) identifier];
      *(_DWORD *)buf = 138413058;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "%@ Failed to load %@ (%@) after saving it: %@", buf, 0x2Au);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_241;
  v10[3] = &unk_1E5993770;
  uint64_t v6 = *(void **)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  -[NEConfigurationManager executeCallbackOnQueue:callback:](v5, v6, v10);
}

uint64_t __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_241(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadConfigurationAndUserWithID:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v8;
      _os_log_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_INFO, "Loading configuration with identifier %@", buf, 0xCu);
    }

    id v24 = v8;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __85__NEConfigurationManager_loadConfigurationAndUserWithID_withCompletionQueue_handler___block_invoke;
    v20[3] = &unk_1E598F758;
    v20[4] = self;
    id v21 = v8;
    id v22 = v9;
    id v23 = v10;
    id v13 = v10;
    -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](self, v12, v20);

    __int16 v14 = v21;
  }
  else
  {
    id v15 = -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)self, 7, 0);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __85__NEConfigurationManager_loadConfigurationAndUserWithID_withCompletionQueue_handler___block_invoke_2;
    v17[3] = &unk_1E59936F8;
    id v18 = v15;
    id v19 = v10;
    id v16 = v10;
    id v12 = v15;
    -[NEConfigurationManager executeCallbackOnQueue:callback:]((uint64_t)self, v9, v17);

    __int16 v14 = v19;
  }
}

void __85__NEConfigurationManager_loadConfigurationAndUserWithID_withCompletionQueue_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = *(id *)(a1 + 32);
  if (v5)
  {
    if (objc_getProperty(v5, v3, 88, 1))
    {
      id Property = *(id *)(a1 + 32);
      if (Property) {
        id Property = objc_getProperty(Property, v6, 88, 1);
      }
      id v8 = [Property objectForKeyedSubscript:*(void *)(a1 + 40)];
      if (v8)
      {
        uint64_t v36 = a1;
        id v37 = v4;
        id v9 = *(void **)(a1 + 32);
        id v11 = v8;
        if (v9)
        {
          id v12 = objc_msgSend(objc_getProperty(v9, v10, 56, 1), "objectForKeyedSubscript:", @"UserMap");
          id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          id v14 = v12;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v43 objects:buf count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v44;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v44 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = *(void *)(*((void *)&v43 + 1) + 8 * i);
                uint64_t v20 = objc_msgSend(v14, "objectForKeyedSubscript:", v19, v36, v37);
                id v21 = [v11 identifier];
                int v22 = [v20 containsObject:v21];

                if (v22) {
                  [v13 addObject:v19];
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v43 objects:buf count:16];
            }
            while (v16);
          }

          if ([v13 count]) {
            id v23 = v13;
          }
          else {
            id v23 = 0;
          }
          id v24 = v23;
        }
        else
        {
          id v24 = 0;
        }
        a1 = v36;
        id v4 = v37;
        goto LABEL_28;
      }
    }
    id v5 = *(id *)(a1 + 32);
    if (v5) {
      id v5 = objc_getProperty(v5, v6, 56, 1);
    }
  }
  long long v25 = [v5 objectForKeyedSubscript:@"ConfigurationProperties"];
  id v26 = [v25 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v27 = [v26 objectForKeyedSubscript:@"Signature"];

  if (v27)
  {
    id v28 = ne_log_obj();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      uint64_t v35 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v48 = v35;
      __int16 v49 = 2112;
      id v50 = v4;
      _os_log_fault_impl(&dword_19DDAF000, v28, OS_LOG_TYPE_FAULT, "Failed to load configuration with identifier %@: %@", buf, 0x16u);
    }
  }
  id v11 = 0;
  id v24 = 0;
LABEL_28:

  uint64_t v29 = *(void *)(a1 + 32);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __85__NEConfigurationManager_loadConfigurationAndUserWithID_withCompletionQueue_handler___block_invoke_210;
  v38[3] = &unk_1E5992508;
  id v30 = *(void **)(a1 + 48);
  id v31 = *(id *)(a1 + 56);
  id v39 = v11;
  id v40 = v24;
  id v41 = v4;
  id v42 = v31;
  id v32 = v4;
  id v33 = v24;
  id v34 = v11;
  -[NEConfigurationManager executeCallbackOnQueue:callback:](v29, v30, v38);
}

uint64_t __85__NEConfigurationManager_loadConfigurationAndUserWithID_withCompletionQueue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

uint64_t __85__NEConfigurationManager_loadConfigurationAndUserWithID_withCompletionQueue_handler___block_invoke_210(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)loadConfigurationWithID:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v8;
      _os_log_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_INFO, "Loading configuration with identifier %@", buf, 0xCu);
    }

    id v24 = v8;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __78__NEConfigurationManager_loadConfigurationWithID_withCompletionQueue_handler___block_invoke;
    v20[3] = &unk_1E598F758;
    v20[4] = self;
    id v21 = v8;
    id v22 = v9;
    id v23 = v10;
    id v13 = v10;
    -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](self, v12, v20);

    id v14 = v21;
  }
  else
  {
    uint64_t v15 = -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)self, 7, 0);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __78__NEConfigurationManager_loadConfigurationWithID_withCompletionQueue_handler___block_invoke_2;
    v17[3] = &unk_1E59936F8;
    id v18 = v15;
    id v19 = v10;
    id v16 = v10;
    id v12 = v15;
    -[NEConfigurationManager executeCallbackOnQueue:callback:]((uint64_t)self, v9, v17);

    id v14 = v19;
  }
}

void __78__NEConfigurationManager_loadConfigurationWithID_withCompletionQueue_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = *(id *)(a1 + 32);
  if (!v5)
  {
LABEL_8:
    id v9 = [v5 objectForKeyedSubscript:@"ConfigurationProperties"];
    id v10 = [v9 objectForKeyedSubscript:*(void *)(a1 + 40)];
    id v11 = [v10 objectForKeyedSubscript:@"Signature"];

    if (v11)
    {
      id v12 = ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        uint64_t v18 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        uint64_t v24 = v18;
        __int16 v25 = 2112;
        id v26 = v4;
        _os_log_fault_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_FAULT, "Failed to load configuration with identifier %@: %@", buf, 0x16u);
      }
    }
    id v8 = 0;
    goto LABEL_13;
  }
  if (!objc_getProperty(v5, v3, 88, 1)) {
    goto LABEL_6;
  }
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v6, 88, 1);
  }
  id v8 = [Property objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v8)
  {
LABEL_6:
    id v5 = *(id *)(a1 + 32);
    if (v5) {
      id v5 = objc_getProperty(v5, v6, 56, 1);
    }
    goto LABEL_8;
  }
LABEL_13:
  uint64_t v13 = *(void *)(a1 + 32);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __78__NEConfigurationManager_loadConfigurationWithID_withCompletionQueue_handler___block_invoke_209;
  v19[3] = &unk_1E5992CA0;
  id v14 = *(void **)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  id v21 = v4;
  id v22 = v15;
  id v20 = v8;
  id v16 = v4;
  id v17 = v8;
  -[NEConfigurationManager executeCallbackOnQueue:callback:](v13, v14, v19);
}

uint64_t __78__NEConfigurationManager_loadConfigurationWithID_withCompletionQueue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __78__NEConfigurationManager_loadConfigurationWithID_withCompletionQueue_handler___block_invoke_209(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)loadConfigurations:(id)a3 withFilter:(id)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __90__NEConfigurationManager_loadConfigurations_withFilter_completionQueue_completionHandler___block_invoke;
  v18[3] = &unk_1E5992ED0;
  void v18[4] = self;
  id v19 = v11;
  id v20 = v10;
  id v21 = v12;
  id v22 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v10;
  id v17 = v11;
  -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](self, v16, v18);
}

void __90__NEConfigurationManager_loadConfigurations_withFilter_completionQueue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = *(void **)(a1 + 32);
  if (!v5)
  {
    uint64_t v6 = 0;
LABEL_33:
    int v38 = 0;
    id v19 = 0;
    goto LABEL_34;
  }
  uint64_t v6 = v5[13];
  if (!objc_getProperty(v5, v3, 88, 1)) {
    goto LABEL_33;
  }
  uint64_t v7 = -[NEConfigurationManager filterIndexWithFilter:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  if (!v7) {
    goto LABEL_33;
  }
  id v8 = (void *)v7;
  id v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"filtering-only"];
  uint64_t v10 = [v9 BOOLValue];

  id v11 = *(id *)(a1 + 48);
  long long v44 = v8;
  id v12 = [v8 objectForKeyedSubscript:@"ConfigurationProperties"];
  id v13 = [v12 allKeys];

  if (!v11)
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v14, 88, 1);
    }
    id v11 = [Property allKeys];
  }
  uint64_t v45 = v6;
  id v46 = v4;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v16 = v11;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (!v17)
  {
    id v19 = 0;
    goto LABEL_31;
  }
  uint64_t v18 = v17;
  id v19 = 0;
  uint64_t v20 = *(void *)v55;
  uint64_t v47 = v13;
  do
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      if (*(void *)v55 != v20) {
        objc_enumerationMutation(v16);
      }
      uint64_t v22 = *(void *)(*((void *)&v54 + 1) + 8 * i);
      if ([v13 containsObject:v22])
      {
        id v24 = *(id *)(a1 + 32);
        if (v24) {
          id v24 = objc_getProperty(v24, v23, 88, 1);
        }
        __int16 v25 = [v24 objectForKeyedSubscript:v22];
        id v26 = v25;
        if (!v25) {
          goto LABEL_26;
        }
        if (v10)
        {
          id v27 = v16;
          id v28 = v19;
          uint64_t v29 = a1;
          uint64_t v30 = v10;
          uint64_t v31 = [v25 contentFilter];
          if (!v31) {
            goto LABEL_21;
          }
          id v32 = (void *)v31;
          id v33 = [v26 VPN];
          if (v33)
          {

LABEL_21:
            uint64_t v10 = v30;
            a1 = v29;
            id v19 = v28;
            id v16 = v27;
            id v13 = v47;
LABEL_26:

            continue;
          }
          id v34 = [v26 appVPN];

          uint64_t v10 = v30;
          a1 = v29;
          id v19 = v28;
          id v16 = v27;
          id v13 = v47;
          if (v34) {
            goto LABEL_26;
          }
        }
        if (!v19)
        {
          id v35 = objc_alloc(MEMORY[0x1E4F1CA48]);
          uint64_t v36 = [*(id *)(a1 + 48) count];
          id v37 = v35;
          id v13 = v47;
          id v19 = (void *)[v37 initWithCapacity:v36];
        }
        [v19 addObject:v26];
        goto LABEL_26;
      }
    }
    uint64_t v18 = [v16 countByEnumeratingWithState:&v54 objects:v58 count:16];
  }
  while (v18);
LABEL_31:

  uint64_t v6 = v45;
  id v4 = v46;
  int v38 = v44;
LABEL_34:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__NEConfigurationManager_loadConfigurations_withFilter_completionQueue_completionHandler___block_invoke_2;
  block[3] = &unk_1E598F780;
  id v39 = *(NSObject **)(a1 + 56);
  id v40 = *(id *)(a1 + 64);
  id v49 = v19;
  id v50 = v4;
  id v52 = v40;
  uint64_t v53 = v6;
  id v51 = v38;
  id v41 = v38;
  id v42 = v4;
  id v43 = v19;
  dispatch_async(v39, block);
}

uint64_t __90__NEConfigurationManager_loadConfigurations_withFilter_completionQueue_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[8], a1[6]);
}

- (void)loadIndexWithFilter:(id)a3 completionQueue:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__NEConfigurationManager_loadIndexWithFilter_completionQueue_handler___block_invoke;
  v14[3] = &unk_1E598F758;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  -[NEConfigurationManager getCurrentIndexWithCompletionHandler:](self, v14);
}

void __70__NEConfigurationManager_loadIndexWithFilter_completionQueue_handler___block_invoke(uint64_t a1)
{
  id v2 = -[NEConfigurationManager filterIndexWithFilter:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 104);
  }
  else {
    uint64_t v4 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__NEConfigurationManager_loadIndexWithFilter_completionQueue_handler___block_invoke_2;
  block[3] = &unk_1E5992D90;
  id v5 = *(NSObject **)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v9 = v2;
  id v10 = v6;
  uint64_t v11 = v4;
  id v7 = v2;
  dispatch_async(v5, block);
}

uint64_t __70__NEConfigurationManager_loadIndexWithFilter_completionQueue_handler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

- (void)syncConfigurationsWithSC:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && MEMORY[0x19F3B92C0](v8) == MEMORY[0x1E4F14568] && xpc_array_get_count(v8))
  {
    if (self) {
      outerQueue = self->_outerQueue;
    }
    else {
      outerQueue = 0;
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke_2;
    v15[3] = &unk_1E5992508;
    v15[4] = self;
    id v16 = v8;
    id v17 = v9;
    id v18 = v10;
    id v14 = v10;
    dispatch_async(outerQueue, v15);

    id v12 = v16;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke;
    block[3] = &unk_1E5993770;
    id v20 = v10;
    id v11 = v10;
    dispatch_async(v9, block);
    id v12 = v20;
  }
}

uint64_t __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = getWriterSemaphore();
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v3 = *(unsigned char **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  _DWORD v5[2] = __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke_3;
  v5[3] = &unk_1E5992ED0;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 40);
  id v7 = v2;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  uint64_t v4 = v2;
  -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](v3, 0, v5);
}

void __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v63 = a2;
  if (v63)
  {
    uint64_t v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[NEConfigurationManager syncConfigurationsWithSC:completionQueue:completionHandler:]_block_invoke_3";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v63;
      _os_log_error_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_ERROR, "%s failed to load configurations: %@", buf, 0x16u);
    }
LABEL_4:

LABEL_5:
    xpc_object_t v4 = 0;
    id newValue = 0;
    id v65 = 0;
    goto LABEL_6;
  }
  SCPreferencesRef prefs = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"NEConfigurationManager prefs sync", 0);
  id v8 = ne_log_obj();
  uint64_t v3 = v8;
  if (!prefs)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v59 = SCError();
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = SCErrorString(v59);
      _os_log_error_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_ERROR, "SCPreferencesCreate failed: %s", buf, 0xCu);
    }
    goto LABEL_4;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[NEConfigurationManager syncConfigurationsWithSC:completionQueue:completionHandler:]_block_invoke";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1899;
    _os_log_debug_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_DEBUG, "%s:%d: Locking SCPreferences", buf, 0x12u);
  }

  if (!SCPreferencesLock(prefs, 1u))
  {
    id v27 = ne_log_obj();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      int v60 = SCError();
      uint64_t v61 = SCErrorString(v60);
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v61;
      _os_log_error_impl(&dword_19DDAF000, v27, OS_LOG_TYPE_ERROR, "SCPreferencesLock failed: %s", buf, 0xCu);
    }

    CFRelease(prefs);
    goto LABEL_5;
  }
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v9, 120, 1);
  }
  id v65 = Property;
  SCPreferencesGetSignature(prefs);
  id newValue = (id)objc_claimAutoreleasedReturnValue();
  if (v65 && ([v65 isEqualToData:newValue] & 1) != 0)
  {
    id v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_INFO, "SCPreferences signature matches saved signature, change origin was NetworkExtension", buf, 2u);
    }

    goto LABEL_67;
  }
  uint64_t v77 = 0;
  int64_t v78 = &v77;
  uint64_t v79 = 0x2020000000;
  char v80 = 0;
  id v12 = ne_log_obj();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = newValue;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v65;
    _os_log_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_INFO, "SCPreferences signature (%@) does not match saved signature (%@), checking updated configurations", buf, 0x16u);
  }

  id v14 = *(void **)(a1 + 32);
  if (v14)
  {
    objc_setProperty_atomic(v14, v13, newValue, 120);
    uint64_t v15 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v15 = 0;
  }
  id v16 = *(void **)(a1 + 40);
  applier[0] = MEMORY[0x1E4F143A8];
  applier[1] = 3221225472;
  applier[2] = __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke_195;
  applier[3] = &unk_1E598F730;
  applier[4] = v15;
  id v74 = 0;
  id v75 = &v77;
  SCPreferencesRef v76 = prefs;
  xpc_array_apply(v16, applier);
  id v18 = v78;
  uint64_t v19 = *(void *)(a1 + 32);
  if (*((unsigned char *)v78 + 24))
  {
    if (v19)
    {
      *(void *)long long v81 = 0;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      id v20 = objc_getProperty((id)v19, v17, 88, 1);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v82 objects:buf count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v83;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v83 != v23) {
              objc_enumerationMutation(v20);
            }
            __int16 v25 = objc_msgSend(objc_getProperty((id)v19, v21, 88, 1), "objectForKeyedSubscript:", *(void *)(*((void *)&v82 + 1) + 8 * i));
            +[NEConfigurationManager updateFlags:withConfiguration:]((uint64_t)NEConfigurationManager, (unint64_t *)v81, v25);
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v82 objects:buf count:16];
        }
        while (v22);
        uint64_t v26 = *(void *)v81;
      }
      else
      {
        uint64_t v26 = 0;
      }

      -[NEConfigurationManager postChangeNotificationWithGeneration:andFlags:onlyIfChanged:]((_DWORD *)v19, *(const char **)(v19 + 104), v26, 0);
      id v18 = v78;
    }
    if (*((unsigned char *)v18 + 24)) {
      goto LABEL_66;
    }
    uint64_t v19 = *(void *)(a1 + 32);
  }
  if (v19)
  {
    id v28 = ne_log_obj();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19DDAF000, v28, OS_LOG_TYPE_INFO, "Updating the saved SCPreferences signature", buf, 2u);
    }

    if (*(unsigned char *)(v19 + 23))
    {
      uint64_t v30 = [objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
      uint64_t v29 = v30;
      if (*(uint64_t *)(v19 + 104) >= 1) {
        -[NSObject encodeInt64:forKey:](v30, "encodeInt64:forKey:");
      }
      [v29 encodeInt64:1, @"Version", prefs forKey];
      if (objc_getProperty((id)v19, v31, 56, 1))
      {
        [v29 encodeObject:objc_getProperty((id)v19, v32, 56, 1) forKey:@"Index"];
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        id v34 = objc_msgSend(objc_getProperty((id)v19, v33, 56, 1), "objectForKeyedSubscript:", @"ConfigurationProperties");
        uint64_t v36 = [v34 countByEnumeratingWithState:&v82 objects:buf count:16];
        if (v36)
        {
          uint64_t v37 = *(void *)v83;
          do
          {
            for (uint64_t j = 0; j != v36; ++j)
            {
              if (*(void *)v83 != v37) {
                objc_enumerationMutation(v34);
              }
              id v39 = objc_msgSend(objc_getProperty((id)v19, v35, 88, 1), "objectForKeyedSubscript:", *(void *)(*((void *)&v82 + 1) + 8 * j));
              id v40 = v39;
              if (v39)
              {
                id v41 = [v39 identifier];
                id v42 = [v41 UUIDString];
                [v29 encodeObject:v40 forKey:v42];
              }
            }
            uint64_t v36 = [v34 countByEnumeratingWithState:&v82 objects:buf count:16];
          }
          while (v36);
        }
      }
      [v29 encodeObject:objc_getProperty((id)v19, v32, 120, 1) forKey:@"SCPreferencesSignature2"];
      [v29 finishEncoding];
      id v43 = [v29 encodedData];
      char v44 = [v43 writeToFile:@"/Library/Preferences/com.apple.networkextension.plist" atomically:1];

      if ((v44 & 1) == 0)
      {
        uint64_t v45 = ne_log_obj();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long v81 = 0;
          _os_log_error_impl(&dword_19DDAF000, v45, OS_LOG_TYPE_ERROR, "Failed to write the new file while updating the SCPreferences signature", v81, 2u);
        }
      }
    }
    else
    {
      uint64_t v29 = ne_log_obj();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19DDAF000, v29, OS_LOG_TYPE_ERROR, "Some non-nehelper process is trying to save the SCPreferences signature", buf, 2u);
      }
    }
  }
LABEL_66:

  _Block_object_dispose(&v77, 8);
LABEL_67:
  id v46 = ne_log_obj();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[NEConfigurationManager syncConfigurationsWithSC:completionQueue:completionHandler:]_block_invoke";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1985;
    _os_log_debug_impl(&dword_19DDAF000, v46, OS_LOG_TYPE_DEBUG, "%s:%d: Unlocking SCPreferences", buf, 0x12u);
  }

  SCPreferencesUnlock(prefs);
  CFRelease(prefs);
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v48 = *(id *)(a1 + 32);
  if (v48) {
    id v48 = objc_getProperty(v48, v47, 88, 1);
  }
  id v49 = v48;
  xpc_object_t v4 = 0;
  uint64_t v51 = [v49 countByEnumeratingWithState:&v69 objects:v86 count:16];
  if (v51)
  {
    uint64_t v52 = *(void *)v70;
    do
    {
      for (uint64_t k = 0; k != v51; ++k)
      {
        if (*(void *)v70 != v52) {
          objc_enumerationMutation(v49);
        }
        uint64_t v54 = *(void *)(*((void *)&v69 + 1) + 8 * k);
        id v55 = *(id *)(a1 + 32);
        if (v55) {
          id v55 = objc_getProperty(v55, v50, 88, 1);
        }
        long long v56 = objc_msgSend(v55, "objectForKeyedSubscript:", v54, prefs);
        if (-[NEConfiguration isSupportedBySC](v56))
        {
          if (!v4) {
            xpc_object_t v4 = xpc_array_create(0, 0);
          }
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          long long v57 = [v56 identifier];
          [v57 getUUIDBytes:buf];

          xpc_object_t v58 = xpc_uuid_create(buf);
          xpc_array_append_value(v4, v58);
        }
      }
      uint64_t v51 = [v49 countByEnumeratingWithState:&v69 objects:v86 count:16];
    }
    while (v51);
  }

LABEL_6:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke_197;
  block[3] = &unk_1E59936F8;
  id v5 = *(NSObject **)(a1 + 56);
  id v6 = *(id *)(a1 + 64);
  id v67 = v4;
  id v68 = v6;
  id v7 = v4;
  dispatch_async(v5, block);
}

uint64_t __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke_195(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  xpc_object_t v4 = (objc_class *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = [v4 alloc];
  bytes = xpc_uuid_get_bytes(v5);

  id v8 = (void *)[v6 initWithUUIDBytes:bytes];
  id v9 = *(const __SCPreferences **)(a1 + 56);
  id v10 = [v8 UUIDString];
  id v11 = SCNetworkServiceCopy(v9, v10);

  CFTypeID TypeID = SCNetworkServiceGetTypeID();
  if (v11 && CFGetTypeID(v11) == TypeID && _SCNetworkServiceIsVPN())
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v13, 80, 1);
    }
    id v16 = [Property objectForKeyedSubscript:v8];
    if (v16)
    {
      id v17 = *(id *)(a1 + 32);
      if (v17) {
        id v17 = objc_getProperty(v17, v15, 88, 1);
      }
      id v18 = [v17 objectForKeyedSubscript:v8];
      uint64_t v19 = (NEConfiguration *)[v18 copy];

      if (!v19) {
        goto LABEL_41;
      }
      id v20 = ne_log_obj();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = [(NEConfiguration *)v19 name];
        int v39 = 138412290;
        Name = v21;
        _os_log_impl(&dword_19DDAF000, v20, OS_LOG_TYPE_INFO, "Updating configuration \"%@\" from the corresponding SCNetworkService", (uint8_t *)&v39, 0xCu);
      }
      int v22 = -[NEConfiguration updateFromSCService:](v19, v11);
    }
    else
    {
      id v28 = ne_log_obj();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        int v39 = 138412290;
        Name = (__CFString *)SCNetworkServiceGetName(v11);
        uint64_t v29 = Name;
        _os_log_impl(&dword_19DDAF000, v28, OS_LOG_TYPE_INFO, "Creating a new configuration corresponding to SCNetworkService \"%@\"", (uint8_t *)&v39, 0xCu);
      }
      uint64_t v19 = [NEConfiguration alloc];
      if (v19)
      {
        uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:SCNetworkServiceGetServiceID(v11)];
        SEL v31 = -[NEConfiguration initWithIdentifier:]((id *)&v19->super.isa, v30);
        id v32 = v31;
        if (v31 && !-[NEConfiguration updateFromSCService:](v31, v11)) {
          uint64_t v19 = 0;
        }
        else {
          uint64_t v19 = v32;
        }
      }
      int v22 = v19 != 0;
      if (!v19) {
        goto LABEL_41;
      }
    }
    if (v22)
    {
      -[NEConfigurationManager saveConfigurationToDisk:updateSCPreferences:currentSignature:userUUID:notifyNow:isUpgrade:](*(void *)(a1 + 32), v19, 0, v16, *(void **)(a1 + 40), 0, 0);
      SEL v33 = (NEConfiguration *)objc_claimAutoreleasedReturnValue();
      id v34 = v33;
      if (v33)
      {
        if ([(NEConfiguration *)v33 code] != 9)
        {
          id v35 = ne_log_obj();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            int v38 = [(NEConfiguration *)v19 name];
            int v39 = 138412546;
            Name = v38;
            __int16 v41 = 2112;
            id v42 = v34;
            _os_log_error_impl(&dword_19DDAF000, v35, OS_LOG_TYPE_ERROR, "Failed to save configuration \"%@\": %@", (uint8_t *)&v39, 0x16u);
          }
        }
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
    }
LABEL_41:

    goto LABEL_42;
  }
  id v23 = *(id *)(a1 + 32);
  if (v23) {
    id v23 = objc_getProperty(v23, v13, 88, 1);
  }
  id v24 = [v23 objectForKeyedSubscript:v8];
  id v16 = v24;
  if (v24 && -[NEConfiguration isSupportedBySC](v24))
  {
    __int16 v25 = ne_log_obj();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      uint64_t v26 = [v16 name];
      int v39 = 138412290;
      Name = v26;
      _os_log_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_INFO, "Configuration \"%@\" no longer has a corresponding SCNetworkService, removing it", (uint8_t *)&v39, 0xCu);
    }
    -[NEConfigurationManager removeConfigurationFromDisk:updateSCPreferences:](*(unsigned char **)(a1 + 32), v8, 0);
    uint64_t v19 = (NEConfiguration *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      id v27 = ne_log_obj();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v37 = [v16 name];
        int v39 = 138412546;
        Name = v37;
        __int16 v41 = 2112;
        id v42 = v19;
        _os_log_error_impl(&dword_19DDAF000, v27, OS_LOG_TYPE_ERROR, "Failed to remove configuration \"%@\": %@", (uint8_t *)&v39, 0x16u);
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    goto LABEL_41;
  }
LABEL_42:

  if (v11) {
    CFRelease(v11);
  }

  return 1;
}

uint64_t __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke_197(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)removeConfigurationFromDisk:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self) {
    outerQueue = self->_outerQueue;
  }
  else {
    outerQueue = 0;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__NEConfigurationManager_removeConfigurationFromDisk_completionQueue_completionHandler___block_invoke;
  v15[3] = &unk_1E5992508;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(outerQueue, v15);
}

void __88__NEConfigurationManager_removeConfigurationFromDisk_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = getWriterSemaphore();
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v3 = *(unsigned char **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __88__NEConfigurationManager_removeConfigurationFromDisk_completionQueue_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5992ED0;
  v6[4] = v3;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  id v9 = v2;
  id v10 = v4;
  id v5 = v2;
  -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](v3, 0, v6);
}

void __88__NEConfigurationManager_removeConfigurationFromDisk_completionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  SCPreferencesRef v2 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"NEConfigurationManager remove prefs", 0);
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      id v23 = "-[NEConfigurationManager removeConfigurationFromDisk:completionQueue:completionHandler:]_block_invoke";
      __int16 v24 = 1024;
      LODWORD(v25) = 1795;
      _os_log_debug_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEBUG, "%s:%d: Locking SCPreferences", buf, 0x12u);
    }

    if (SCPreferencesLock(v3, 1u)) {
      goto LABEL_13;
    }
    uint64_t v5 = SCError();
    objc_msgSend(NSString, "stringWithFormat:", @"%s (%d)", SCErrorString(v5), v5);
    id v6 = (char *)objc_claimAutoreleasedReturnValue();
    id v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v6;
      _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "SCPreferencesLock failed while removing a configuration: %@", buf, 0xCu);
    }

    id v8 = -[NEConfigurationManager errorWithCode:specifics:](*(void *)(a1 + 32), 12, v6);
    CFRelease(v3);
  }
  else
  {
    uint64_t v9 = SCError();
    objc_msgSend(NSString, "stringWithFormat:", @"%s (%d)", SCErrorString(v9), v9);
    id v6 = (char *)objc_claimAutoreleasedReturnValue();
    id v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v6;
      _os_log_error_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_ERROR, "SCPreferencesCreate failed: %@", buf, 0xCu);
    }

    id v8 = -[NEConfigurationManager errorWithCode:specifics:](*(void *)(a1 + 32), 12, v6);
  }

  if (v8)
  {
LABEL_18:
    id v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = *(const char **)(a1 + 32);
      id v14 = [*(id *)(a1 + 40) UUIDString];
      *(_DWORD *)buf = 138412802;
      id v23 = v13;
      __int16 v24 = 2112;
      __int16 v25 = v14;
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_error_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_ERROR, "%@ Failed to remove configuration %@ from disk: %@", buf, 0x20u);
    }
    goto LABEL_23;
  }
  uint64_t v3 = 0;
LABEL_13:
  id v8 = -[NEConfigurationManager removeConfigurationFromDisk:updateSCPreferences:](*(unsigned char **)(a1 + 32), *(void **)(a1 + 40), v3);
  if (v3)
  {
    id v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      id v23 = "-[NEConfigurationManager removeConfigurationFromDisk:completionQueue:completionHandler:]_block_invoke";
      __int16 v24 = 1024;
      LODWORD(v25) = 1811;
      _os_log_debug_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_DEBUG, "%s:%d: Unlocking SCPreferences", buf, 0x12u);
    }

    SCPreferencesUnlock(v3);
    CFRelease(v3);
  }
  if (v8) {
    goto LABEL_18;
  }
  id v12 = ne_log_obj();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = *(const char **)(a1 + 32);
    id v16 = [*(id *)(a1 + 40) UUIDString];
    *(_DWORD *)buf = 138412546;
    id v23 = v15;
    __int16 v24 = 2112;
    __int16 v25 = v16;
    _os_log_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_INFO, "%@ Successfully removed configuration %@ from disk", buf, 0x16u);
  }
  id v8 = 0;
LABEL_23:

  id v17 = *(NSObject **)(a1 + 48);
  if (v17)
  {
    id v18 = *(void **)(a1 + 64);
    if (v18)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __88__NEConfigurationManager_removeConfigurationFromDisk_completionQueue_completionHandler___block_invoke_190;
      block[3] = &unk_1E59936F8;
      id v21 = v18;
      id v20 = v8;
      dispatch_async(v17, block);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

uint64_t __88__NEConfigurationManager_removeConfigurationFromDisk_completionQueue_completionHandler___block_invoke_190(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)saveConfigurationToDisk:(id)a3 currentSignature:(id)a4 userUUID:(id)a5 isUpgrade:(BOOL)a6 completionQueue:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (self) {
    outerQueue = self->_outerQueue;
  }
  else {
    outerQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __120__NEConfigurationManager_saveConfigurationToDisk_currentSignature_userUUID_isUpgrade_completionQueue_completionHandler___block_invoke;
  block[3] = &unk_1E598F708;
  void block[4] = self;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  BOOL v31 = a6;
  id v29 = v17;
  id v30 = v18;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  dispatch_async(outerQueue, block);
}

void __120__NEConfigurationManager_saveConfigurationToDisk_currentSignature_userUUID_isUpgrade_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  SCPreferencesRef v2 = getWriterSemaphore();
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v3 = *(unsigned char **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __120__NEConfigurationManager_saveConfigurationToDisk_currentSignature_userUUID_isUpgrade_completionQueue_completionHandler___block_invoke_2;
  v6[3] = &unk_1E598F6E0;
  v6[4] = v3;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  char v13 = *(unsigned char *)(a1 + 80);
  id v10 = *(id *)(a1 + 64);
  id v4 = *(id *)(a1 + 72);
  id v11 = v2;
  id v12 = v4;
  uint64_t v5 = v2;
  -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](v3, 0, v6);
}

void __120__NEConfigurationManager_saveConfigurationToDisk_currentSignature_userUUID_isUpgrade_completionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  SCPreferencesRef v2 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"NEConfigurationManager save prefs", 0);
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      id v29 = "-[NEConfigurationManager saveConfigurationToDisk:currentSignature:userUUID:isUpgrade:completionQueue:complet"
            "ionHandler:]_block_invoke";
      __int16 v30 = 1024;
      LODWORD(v31) = 1626;
      _os_log_debug_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEBUG, "%s:%d: Locking SCPreferences", buf, 0x12u);
    }

    if (SCPreferencesLock(v3, 1u)) {
      goto LABEL_13;
    }
    uint64_t v5 = SCError();
    objc_msgSend(NSString, "stringWithFormat:", @"%s (%d)", SCErrorString(v5), v5);
    id v6 = (char *)objc_claimAutoreleasedReturnValue();
    id v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v6;
      _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "SCPreferencesLock failed while saving a configuration: %@", buf, 0xCu);
    }

    id v8 = -[NEConfigurationManager errorWithCode:specifics:](*(void *)(a1 + 32), 12, v6);
    CFRelease(v3);
  }
  else
  {
    uint64_t v9 = SCError();
    objc_msgSend(NSString, "stringWithFormat:", @"%s (%d)", SCErrorString(v9), v9);
    id v6 = (char *)objc_claimAutoreleasedReturnValue();
    id v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v6;
      _os_log_error_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_ERROR, "SCPreferencesCreate failed: %@", buf, 0xCu);
    }

    id v8 = -[NEConfigurationManager errorWithCode:specifics:](*(void *)(a1 + 32), 12, v6);
  }

  if (v8) {
    goto LABEL_18;
  }
  uint64_t v3 = 0;
LABEL_13:
  id v8 = -[NEConfigurationManager saveConfigurationToDisk:updateSCPreferences:currentSignature:userUUID:notifyNow:isUpgrade:](*(void *)(a1 + 32), *(void **)(a1 + 40), v3, *(void **)(a1 + 48), *(void **)(a1 + 56), 1, *(unsigned char *)(a1 + 88));
  if (v3)
  {
    id v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      id v29 = "-[NEConfigurationManager saveConfigurationToDisk:currentSignature:userUUID:isUpgrade:completionQueue:complet"
            "ionHandler:]_block_invoke";
      __int16 v30 = 1024;
      LODWORD(v31) = 1642;
      _os_log_debug_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_DEBUG, "%s:%d: Unlocking SCPreferences", buf, 0x12u);
    }

    SCPreferencesUnlock(v3);
    CFRelease(v3);
  }
  if (!v8)
  {
    id v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v20 = *(const char **)(a1 + 32);
      id v21 = [*(id *)(a1 + 40) identifier];
      id v22 = [v21 UUIDString];
      *(_DWORD *)buf = 138412546;
      id v29 = v20;
      __int16 v30 = 2112;
      BOOL v31 = v22;
      _os_log_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_INFO, "%@ Successfully saved configuration %@ to disk", buf, 0x16u);
    }
    id v8 = 0;
    goto LABEL_27;
  }
LABEL_18:
  uint64_t v12 = [v8 code];
  char v13 = ne_log_obj();
  id v14 = v13;
  if (v12 != 9)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    id v18 = *(const char **)(a1 + 32);
    id v16 = [*(id *)(a1 + 40) identifier];
    id v17 = [v16 UUIDString];
    uint64_t v19 = [v8 code];
    *(_DWORD *)buf = 138412802;
    id v29 = v18;
    __int16 v30 = 2112;
    BOOL v31 = v17;
    __int16 v32 = 2048;
    uint64_t v33 = v19;
    _os_log_error_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_ERROR, "%@ Failed to save configuration %@ to disk: %ld", buf, 0x20u);
    goto LABEL_21;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v15 = *(const char **)(a1 + 32);
    id v16 = [*(id *)(a1 + 40) identifier];
    id v17 = [v16 UUIDString];
    *(_DWORD *)buf = 138412546;
    id v29 = v15;
    __int16 v30 = 2112;
    BOOL v31 = v17;
    _os_log_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_INFO, "%@ Skipped saving configuration %@ to disk, because it is unchanged", buf, 0x16u);
LABEL_21:
  }
LABEL_27:

  id v23 = *(NSObject **)(a1 + 64);
  if (v23)
  {
    id v24 = *(void **)(a1 + 80);
    if (v24)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __120__NEConfigurationManager_saveConfigurationToDisk_currentSignature_userUUID_isUpgrade_completionQueue_completionHandler___block_invoke_186;
      block[3] = &unk_1E59936F8;
      id v27 = v24;
      id v26 = v8;
      dispatch_async(v23, block);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
}

uint64_t __120__NEConfigurationManager_saveConfigurationToDisk_currentSignature_userUUID_isUpgrade_completionQueue_completionHandler___block_invoke_186(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)copyCurrentIndexWithConfigurationIDsExpunged:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self)
  {
    id Property = objc_getProperty(self, v4, 56, 1);
    id v7 = self;
  }
  else
  {
    id v7 = 0;
    id Property = 0;
  }
  id v8 = -[NEConfigurationManager makeMutableCopyOfIndex:](v7, Property);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = v5;
  uint64_t v9 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v47;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v47 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v46 + 1) + 8 * v12);
        id v14 = [v8 objectForKeyedSubscript:@"ConfigurationProperties"];
        [v14 removeObjectForKey:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v10);
  }

  id v15 = [v8 objectForKeyedSubscript:@"UserMap"];
  id v16 = [v15 allKeys];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v33 = v16;
  uint64_t v35 = [v33 countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v43;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v43 != v34) {
          objc_enumerationMutation(v33);
        }
        uint64_t v37 = v17;
        uint64_t v18 = *(void *)(*((void *)&v42 + 1) + 8 * v17);
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v19 = obj;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v50 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v39;
          do
          {
            uint64_t v23 = 0;
            do
            {
              if (*(void *)v39 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void *)(*((void *)&v38 + 1) + 8 * v23);
              __int16 v25 = [v8 objectForKeyedSubscript:@"UserMap"];
              id v26 = [v25 objectForKeyedSubscript:v18];
              [v26 removeObject:v24];

              ++v23;
            }
            while (v21 != v23);
            uint64_t v21 = [v19 countByEnumeratingWithState:&v38 objects:v50 count:16];
          }
          while (v21);
        }

        id v27 = [v8 objectForKeyedSubscript:@"UserMap"];
        id v28 = [v27 objectForKeyedSubscript:v18];
        uint64_t v29 = [v28 count];

        if (!v29)
        {
          __int16 v30 = [v8 objectForKeyedSubscript:@"UserMap"];
          [v30 removeObjectForKey:v18];
        }
        uint64_t v17 = v37 + 1;
      }
      while (v37 + 1 != v35);
      uint64_t v35 = [v33 countByEnumeratingWithState:&v42 objects:v51 count:16];
    }
    while (v35);
  }

  BOOL v31 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v8];
  return v31;
}

- (void)postGeneration
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __40__NEConfigurationManager_postGeneration__block_invoke;
  v2[3] = &unk_1E5993618;
  v2[4] = self;
  -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](self, 0, v2);
}

void __40__NEConfigurationManager_postGeneration__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[NEConfigurationManager postGeneration]_block_invoke";
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "%s: failed to load the configurations: %@", buf, 0x16u);
    }

    goto LABEL_22;
  }
  *(void *)buf = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v3, 88, 1);
  }
  id v7 = Property;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v13 = *(id *)(a1 + 32);
        if (v13) {
          id v13 = objc_getProperty(v13, v8, 88, 1);
        }
        id v14 = objc_msgSend(v13, "objectForKeyedSubscript:", v12, (void)v16);
        +[NEConfigurationManager updateFlags:withConfiguration:]((uint64_t)NEConfigurationManager, (unint64_t *)buf, v14);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v23 count:16];
    }
    while (v9);
    uint64_t v9 = *(void *)buf;

    if ((v9 & 0x3080000000000000) != 0) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  NEPolicySetDropPriorityLevel(0, 1);
LABEL_20:
  uint64_t v15 = *(void *)(a1 + 32);
  if (v15) {
    -[NEConfigurationManager postChangeNotificationWithGeneration:andFlags:onlyIfChanged:]((_DWORD *)v15, *(const char **)(v15 + 104), v9, 1);
  }
LABEL_22:
}

- (id)incomingMessageHandler
{
  if (self)
  {
    self = (NEConfigurationManager *)objc_getProperty(self, a2, 112, 1);
    uint64_t v2 = vars8;
  }
  return [(NEConfigurationManager *)self incomingMessageHandler];
}

- (void)setIncomingMessageHandler:(id)a3
{
  id v6 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 112, 1);
  }
  else {
    id Property = 0;
  }
  [Property setIncomingMessageHandler:v6];
}

- (id)description
{
  return self->_description;
}

- (void)dealloc
{
  uint64_t v2 = self;
  if (!self || (LODWORD(self) = self->_changedNotifyToken, (self & 0x80000000) == 0)) {
    notify_cancel((int)self);
  }
  v3.receiver = v2;
  v3.super_class = (Class)NEConfigurationManager;
  [(NEConfigurationManager *)&v3 dealloc];
}

- (id)initSynchronous
{
  uint64_t v2 = [(NEConfigurationManager *)self init];
  id v4 = v2;
  if (v2)
  {
    v2->_isSynchronous = 1;
    objc_msgSend(objc_getProperty(v2, v3, 112, 1), "setIsSynchronous:", 1);
    v4->_lock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (NEConfigurationManager)initWithPluginType:(id)a3
{
  id v5 = a3;
  id v6 = [(NEConfigurationManager *)self init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pluginType, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (NEConfigurationManager)init
{
  uid_t v3 = geteuid();
  id v4 = NECopyUserUUIDSimple(v3);
  if (v4)
  {
    self = -[NEConfigurationManager initWithUserUUID:]((char *)self, v4);
    id v5 = self;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)networkPrivacyConfigurationName
{
  return @"com.apple.preferences.networkprivacy";
}

+ (id)sharedManagerForAllUsers
{
  if (sharedManagerForAllUsers_init_manager != -1) {
    dispatch_once(&sharedManagerForAllUsers_init_manager, &__block_literal_global_28);
  }
  uint64_t v2 = (void *)sharedManagerForAllUsers_g_manager;

  return v2;
}

uint64_t __50__NEConfigurationManager_sharedManagerForAllUsers__block_invoke()
{
  sharedManagerForAllUsers_g_manager = (uint64_t)-[NEConfigurationManager initWithUserUUID:]((char *)[NEConfigurationManager alloc], 0);

  return MEMORY[0x1F41817F8]();
}

+ (id)sharedManager
{
  if (sharedManager_init_manager != -1) {
    dispatch_once(&sharedManager_init_manager, &__block_literal_global_1124);
  }
  uint64_t v2 = (void *)sharedManager_g_manager;

  return v2;
}

uint64_t __39__NEConfigurationManager_sharedManager__block_invoke()
{
  sharedManager_g_manager = objc_alloc_init(NEConfigurationManager);

  return MEMORY[0x1F41817F8]();
}

@end