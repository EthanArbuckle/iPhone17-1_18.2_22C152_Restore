@interface NEProviderAppConfigurationClient
- (BOOL)createConfigurationWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)enabled;
- (BOOL)isAlwaysOn;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)onDemandEnabled;
- (BOOL)setPasswordWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setProtocolWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setProviderTypeWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setSharedSecretWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)unsetPasswordWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)unsetSharedSecretWithParameters:(id)a3 errorStr:(id *)a4;
- (NEProviderAppConfigurationClient)initWithClientName:(id)a3;
- (id)dnsProxyConfiguration;
- (id)dnsSettingsBundle;
- (id)filterConfiguration;
- (id)listenerEndpoint;
- (id)onDemandRules;
- (id)protocolForParameters:(id)a3;
- (uint64_t)deleteKeychainItemWithPersistentReference:(uint64_t)a1;
- (uint64_t)setKeychainItemData:(void *)a3 withName:(uint64_t *)a4 persistentReference:;
- (void)handleCommand:(int)a3 forConfigWithName:(id)a4 withParameters:(id)a5 completionHandler:(id)a6;
- (void)handleConfigChanged:(id)a3;
- (void)loadAllWithCompletionHandler:(void *)a1;
- (void)setEnabled:(BOOL)a3;
- (void)setOnDemandEnabled:(BOOL)a3;
- (void)setOnDemandRules:(id)a3;
@end

@implementation NEProviderAppConfigurationClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_targetAppBundleID, 0);
  objc_storeStrong((id *)&self->_currentManagers, 0);
  objc_storeStrong((id *)&self->_createdManagers, 0);
  objc_storeStrong((id *)&self->_dnsSettingsManager, 0);
  objc_storeStrong((id *)&self->_dnsProxyManager, 0);
  objc_storeStrong((id *)&self->_filterManager, 0);
  objc_storeStrong((id *)&self->_currentManager, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)handleCommand:(int)a3 forConfigWithName:(id)a4 withParameters:(id)a5 completionHandler:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  id v13 = a6;
  if (self && self->_isServerMode)
  {
    if (v8 == 31)
    {
      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2_161;
      v43[3] = &unk_1E5992E08;
      v43[4] = self;
      id v44 = v27;
      id v45 = v13;
      id v28 = v27;
      -[NEProviderAppConfigurationClient loadAllWithCompletionHandler:](self, v43);

      v29 = v44;
    }
    else
    {
      if (v8 != 30 || [v10 length])
      {
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_3;
        v37[3] = &unk_1E5992B88;
        id v38 = v10;
        int v42 = v8;
        id v41 = v13;
        v39 = self;
        id v40 = v11;
        id v18 = v38;
        v19 = v37;
        location[0] = (id)MEMORY[0x1E4F143A8];
        location[1] = (id)3221225472;
        location[2] = __80__NEProviderAppConfigurationClient_loadConfigurationWithName_completionHandler___block_invoke;
        location[3] = &unk_1E5992E08;
        location[4] = self;
        id v20 = v18;
        id v56 = v20;
        v21 = v19;
        id v57 = v21;
        -[NEProviderAppConfigurationClient loadAllWithCompletionHandler:](self, location);

        goto LABEL_22;
      }
      id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_154;
      v46[3] = &unk_1E5992E08;
      v46[4] = self;
      id v47 = v36;
      id v48 = v13;
      id v28 = v36;
      -[NEProviderAppConfigurationClient loadAllWithCompletionHandler:](self, v46);

      v29 = v47;
    }

    goto LABEL_22;
  }
  if (v8 == 102 || v8 == 36)
  {
    v14 = [(NEUtilConfigurationClient *)self clientName];
    +[NEUtilConfigurationClient removeClientWithName:v14];

    if (self)
    {
      objc_msgSend(objc_getProperty(self, v15, 136, 1), "invalidate");
      objc_setProperty_atomic(self, v16, 0, 136);
      objc_setProperty_atomic(self, v17, 0, 144);
    }
    else
    {
      [0 invalidate];
    }
    (*((void (**)(id, void))v13 + 2))(v13, MEMORY[0x1E4F1CBF0]);
  }
  else if (self {
         && (id v22 = objc_getProperty(self, v12, 136, 1)) != 0
  }
         && (v24 = v22, id v25 = objc_getProperty(self, v23, 144, 1), v24, v25))
  {
    objc_msgSend(objc_getProperty(self, v26, 144, 1), "handleCommand:forConfigWithName:withParameters:completionHandler:", v8, v10, v11, v13);
  }
  else
  {
    objc_initWeak(location, self);
    v31 = +[NEConfigurationManager sharedManager];
    if (self) {
      id Property = objc_getProperty(self, v30, 128, 1);
    }
    else {
      id Property = 0;
    }
    id v33 = Property;
    uint64_t v34 = MEMORY[0x1E4F14428];
    id v35 = MEMORY[0x1E4F14428];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke;
    v49[3] = &unk_1E5992B38;
    objc_copyWeak(&v53, location);
    int v54 = v8;
    id v50 = v10;
    id v51 = v11;
    id v52 = v13;
    [v31 fetchClientListenerWithBundleID:v33 completionQueue:v34 handler:v49];

    objc_destroyWeak(&v53);
    objc_destroyWeak(location);
  }
LABEL_22:
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!v3 || (MEMORY[0x19F3B92C0](v3) == MEMORY[0x1E4F145A0] ? (BOOL v6 = WeakRetained == 0) : (BOOL v6 = 1), v6))
  {
    v7 = NSString;
    if (WeakRetained) {
      id Property = objc_getProperty(WeakRetained, v4, 128, 1);
    }
    else {
      id Property = 0;
    }
    v9 = [v7 stringWithFormat:@"Failed to establish an IPC connection to target app %@", Property];
    v24[0] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F292A0]);
    [v10 _setEndpoint:v3];
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v10];
    objc_setProperty_atomic(WeakRetained, v12, v11, 136);

    id v13 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF09F3C0];
    objc_msgSend(objc_getProperty(WeakRetained, v14, 136, 1), "setRemoteObjectInterface:", v13);

    id v16 = objc_getProperty(WeakRetained, v15, 136, 1);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2;
    v22[3] = &unk_1E5993618;
    id v17 = WeakRetained;
    id v23 = v17;
    id v18 = [v16 remoteObjectProxyWithErrorHandler:v22];
    objc_setProperty_atomic(v17, v19, v18, 144);

    objc_msgSend(objc_getProperty(v17, v20, 136, 1), "resume");
    objc_msgSend(objc_getProperty(v17, v21, 144, 1), "handleCommand:forConfigWithName:withParameters:completionHandler:", *(unsigned int *)(a1 + 64), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_154(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v3, 120, 1);
  }
  id v6 = Property;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(a1 + 40);
        SEL v12 = [NSString stringWithFormat:@"%@\n", *(void *)(*((void *)&v28 + 1) + 8 * v10)];
        [v11 addObject:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v8);
  }

  id v14 = *(id *)(a1 + 32);
  if (v14) {
    id v14 = objc_getProperty(v14, v13, 112, 1);
  }
  if ([v14 count])
  {
    [*(id *)(a1 + 40) addObject:@"Newly-created (unsaved) configurations:\n"];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v16 = *(id *)(a1 + 32);
    if (v16) {
      id v16 = objc_getProperty(v16, v15, 112, 1);
    }
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(a1 + 40);
          id v23 = [NSString stringWithFormat:@"%@\n", *(void *)(*((void *)&v24 + 1) + 8 * v21)];
          [v22 addObject:v23];

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v19);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)loadAllWithCompletionHandler:(void *)a1
{
  id v3 = a2;
  if (objc_getProperty(a1, v4, 120, 1))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_7;
    block[3] = &unk_1E5993770;
    id v8 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
    v5 = v8;
  }
  else
  {
    id v6 = +[NEVPNManager sharedManager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke;
    v9[3] = &unk_1E5993798;
    v9[4] = a1;
    id v10 = v3;
    [v6 loadFromPreferencesWithCompletionHandler:v9];

    v5 = v10;
  }
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2_161(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id Property = *(id *)(a1 + 32);
  uint64_t v34 = v4;
  if (Property) {
    id Property = objc_getProperty(Property, v3, 120, 1);
  }
  id v6 = Property;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v40;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v39 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          SEL v12 = *(void **)(a1 + 40);
          id v13 = NSString;
          id v14 = [v11 localizedDescription];
          [v13 stringWithFormat:@"%@ (filter)", v14, v34];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            SEL v12 = *(void **)(a1 + 40);
            SEL v15 = NSString;
            id v14 = [v11 localizedDescription];
            [v15 stringWithFormat:@"%@ (app-proxy)", v14, v34];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              SEL v12 = *(void **)(a1 + 40);
              id v16 = NSString;
              id v14 = [v11 localizedDescription];
              [v16 stringWithFormat:@"%@ (packet-tunnel)", v14, v34];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                SEL v12 = *(void **)(a1 + 40);
                id v17 = NSString;
                id v14 = [v11 localizedDescription];
                [v17 stringWithFormat:@"%@ (lite)", v14, v34];
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  SEL v12 = *(void **)(a1 + 40);
                  uint64_t v18 = NSString;
                  id v14 = [v11 localizedDescription];
                  [v18 stringWithFormat:@"%@ (dns-proxy)", v14, v34];
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    goto LABEL_21;
                  }
                  SEL v12 = *(void **)(a1 + 40);
                  uint64_t v19 = NSString;
                  id v14 = [v11 localizedDescription];
                  [v19 stringWithFormat:@"%@ (dns-settings)", v14, v34];
                }
              }
            }
          }
        uint64_t v20 = };
        [v12 addObject:v20];

LABEL_21:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v8);
  }

  id v22 = *(id *)(a1 + 32);
  if (v22) {
    id v22 = objc_getProperty(v22, v21, 112, 1);
  }
  if ([v22 count])
  {
    [*(id *)(a1 + 40) addObject:@"Newly-created (unsaved) configurations:\n"];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v24 = *(id *)(a1 + 32);
    if (v24) {
      id v24 = objc_getProperty(v24, v23, 112, 1);
    }
    id v25 = v24;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v36;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v36 != v28) {
            objc_enumerationMutation(v25);
          }
          long long v30 = *(void **)(a1 + 40);
          long long v31 = NSString;
          v32 = [*(id *)(*((void *)&v35 + 1) + 8 * v29) localizedDescription];
          id v33 = [v31 stringWithFormat:@"%@ (packet-tunnel)\n", v32];
          [v30 addObject:v33];

          ++v29;
        }
        while (v27 != v29);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v27);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v165[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v158 = 0;
  v159 = &v158;
  uint64_t v160 = 0x3032000000;
  v161 = __Block_byref_object_copy__21734;
  v162 = __Block_byref_object_dispose__21735;
  id v163 = 0;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v6)
  {
    uint64_t v9 = [NSString stringWithFormat:@"Failed to load configuration %@: %@", *(void *)(a1 + 32), v6];
    uint64_t v10 = (void *)v159[5];
    v159[5] = v9;

    uint64_t v11 = *(void *)(a1 + 56);
    v165[0] = v159[5];
    SEL v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v165 count:1];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
    goto LABEL_3;
  }
  if (!v5 && *(_DWORD *)(a1 + 64) != 1)
  {
    uint64_t v23 = [NSString stringWithFormat:@"Configuration with name \"%@\" does not exist", *(void *)(a1 + 32)];
    id v24 = (void *)v159[5];
    v159[5] = v23;

    uint64_t v25 = *(void *)(a1 + 56);
    uint64_t v164 = v159[5];
    SEL v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v164 count:1];
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v12);
    goto LABEL_3;
  }
  id v13 = *(void **)(a1 + 40);
  if (v13)
  {
    objc_setProperty_atomic(v13, v7, 0, 80);
    SEL v15 = *(void **)(a1 + 40);
    if (v15)
    {
      objc_setProperty_atomic(v15, v14, 0, 88);
      id v17 = *(void **)(a1 + 40);
      if (v17)
      {
        objc_setProperty_atomic(v17, v16, 0, 96);
        uint64_t v19 = *(void **)(a1 + 40);
        if (v19) {
          objc_setProperty_atomic(v19, v18, 0, 104);
        }
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v21 = *(void **)(a1 + 40);
    if (!v21) {
      goto LABEL_25;
    }
    id v22 = &OBJC_IVAR___NEProviderAppConfigurationClient__currentManager;
    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v21 = *(void **)(a1 + 40);
    if (!v21) {
      goto LABEL_25;
    }
    id v22 = &OBJC_IVAR___NEProviderAppConfigurationClient__filterManager;
    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v21 = *(void **)(a1 + 40);
    if (!v21) {
      goto LABEL_25;
    }
    id v22 = &OBJC_IVAR___NEProviderAppConfigurationClient__dnsProxyManager;
    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v21 = *(void **)(a1 + 40);
    if (v21)
    {
      id v22 = &OBJC_IVAR___NEProviderAppConfigurationClient__dnsSettingsManager;
LABEL_24:
      objc_setProperty_atomic(v21, v20, v5, *v22);
    }
  }
LABEL_25:
  int v26 = *(_DWORD *)(a1 + 64);
  switch(v26)
  {
    case 1:
      uint64_t v27 = *(void **)(a1 + 40);
      uint64_t v28 = *(void *)(a1 + 48);
      uint64_t v29 = v159;
      v157 = (void *)v159[5];
      [v27 createConfigurationWithParameters:v28 errorStr:&v157];
      long long v30 = v157;
      goto LABEL_64;
    case 2:
      long long v37 = *(void **)(a1 + 40);
      uint64_t v38 = *(void *)(a1 + 48);
      uint64_t v29 = v159;
      v152 = (void *)v159[5];
      [v37 setProtocolWithParameters:v38 errorStr:&v152];
      long long v30 = v152;
      goto LABEL_64;
    case 3:
      long long v39 = *(void **)(a1 + 40);
      uint64_t v40 = *(void *)(a1 + 48);
      uint64_t v29 = v159;
      v151 = (void *)v159[5];
      [v39 setFilterPluginWithParameters:v40 errorStr:&v151];
      long long v30 = v151;
      goto LABEL_64;
    case 4:
      long long v41 = *(void **)(a1 + 40);
      uint64_t v42 = *(void *)(a1 + 48);
      uint64_t v29 = v159;
      v150 = (void *)v159[5];
      [v41 unsetFilterPluginParameters:v42 errorStr:&v150];
      long long v30 = v150;
      goto LABEL_64;
    case 5:
      v43 = *(void **)(a1 + 40);
      uint64_t v44 = *(void *)(a1 + 48);
      uint64_t v29 = v159;
      v149 = (void *)v159[5];
      [v43 setDNSProxyWithParameters:v44 errorStr:&v149];
      long long v30 = v149;
      goto LABEL_64;
    case 6:
      uint64_t v45 = *(void **)(a1 + 40);
      uint64_t v46 = *(void *)(a1 + 48);
      uint64_t v29 = v159;
      v148 = (void *)v159[5];
      [v45 unsetDNSProxyWithParameters:v46 errorStr:&v148];
      long long v30 = v148;
      goto LABEL_64;
    case 7:
      id v47 = *(void **)(a1 + 40);
      uint64_t v48 = *(void *)(a1 + 48);
      uint64_t v29 = v159;
      v147 = (void *)v159[5];
      [v47 setCommonParameters:v48 errorStr:&v147];
      long long v30 = v147;
      goto LABEL_64;
    case 8:
      v49 = *(void **)(a1 + 40);
      uint64_t v50 = *(void *)(a1 + 48);
      uint64_t v29 = v159;
      v146 = (void *)v159[5];
      [v49 unsetCommonParameters:v50 errorStr:&v146];
      long long v30 = v146;
      goto LABEL_64;
    case 9:
      id v51 = *(void **)(a1 + 40);
      uint64_t v52 = *(void *)(a1 + 48);
      uint64_t v29 = v159;
      v145 = (void *)v159[5];
      [v51 setIPSecParameters:v52 errorStr:&v145];
      long long v30 = v145;
      goto LABEL_64;
    case 10:
      id v53 = *(void **)(a1 + 40);
      uint64_t v54 = *(void *)(a1 + 48);
      uint64_t v29 = v159;
      v144 = (void *)v159[5];
      [v53 unsetIPSecParameters:v54 errorStr:&v144];
      long long v30 = v144;
      goto LABEL_64;
    case 11:
    case 12:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 31:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
LABEL_81:
      uint64_t v103 = [NSString stringWithFormat:@"Unknown command"];
      id v71 = (id)v159[5];
      v159[5] = v103;
      goto LABEL_65;
    case 13:
      v55 = *(void **)(a1 + 40);
      uint64_t v56 = *(void *)(a1 + 48);
      uint64_t v29 = v159;
      v143 = (void *)v159[5];
      [v55 addOnDemandRuleWithParameters:v56 errorStr:&v143];
      long long v30 = v143;
      goto LABEL_64;
    case 14:
      id v57 = *(void **)(a1 + 40);
      uint64_t v58 = *(void *)(a1 + 48);
      uint64_t v29 = v159;
      v142 = (void *)v159[5];
      [v57 removeOnDemandRuleWithParameters:v58 errorStr:&v142];
      long long v30 = v142;
      goto LABEL_64;
    case 15:
      v59 = *(void **)(a1 + 40);
      uint64_t v60 = *(void *)(a1 + 48);
      uint64_t v29 = v159;
      v129 = (void *)v159[5];
      [v59 setProxyParameters:v60 errorStr:&v129];
      long long v30 = v129;
      goto LABEL_64;
    case 16:
      v61 = *(void **)(a1 + 40);
      uint64_t v62 = *(void *)(a1 + 48);
      uint64_t v29 = v159;
      v128 = (void *)v159[5];
      [v61 unsetProxyParameters:v62 errorStr:&v128];
      long long v30 = v128;
      goto LABEL_64;
    case 17:
      v63 = *(void **)(a1 + 40);
      uint64_t v64 = *(void *)(a1 + 48);
      uint64_t v29 = v159;
      v127 = (void *)v159[5];
      [v63 setProxyServer:v64 errorStr:&v127];
      long long v30 = v127;
      goto LABEL_64;
    case 18:
      v65 = *(void **)(a1 + 40);
      uint64_t v66 = *(void *)(a1 + 48);
      uint64_t v29 = v159;
      v126 = (void *)v159[5];
      [v65 unsetProxyServer:v66 errorStr:&v126];
      long long v30 = v126;
      goto LABEL_64;
    case 19:
      v67 = *(void **)(a1 + 40);
      uint64_t v68 = *(void *)(a1 + 48);
      uint64_t v29 = v159;
      v133 = (void *)v159[5];
      [v67 setDNSParameters:v68 errorStr:&v133];
      long long v30 = v133;
      goto LABEL_64;
    case 20:
      v69 = *(void **)(a1 + 40);
      uint64_t v70 = *(void *)(a1 + 48);
      uint64_t v29 = v159;
      v132 = (void *)v159[5];
      [v69 unsetDNSParameters:v70 errorStr:&v132];
      long long v30 = v132;
      goto LABEL_64;
    case 30:
      id v71 = [v5 description];
      [v8 addObject:v71];
      goto LABEL_65;
    case 32:
      id Property = *(id *)(a1 + 40);
      if (!Property) {
        goto LABEL_102;
      }
      if (objc_getProperty(Property, v20, 88, 1))
      {
        id v74 = +[NEFilterManager sharedManager];
        v75 = v137;
        v137[0] = MEMORY[0x1E4F143A8];
        v137[1] = 3221225472;
        v137[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_5;
        v137[3] = &unk_1E5992B60;
        v137[7] = &v158;
        id v76 = *(id *)(a1 + 32);
        uint64_t v77 = *(void *)(a1 + 40);
        v137[4] = v76;
        v137[5] = v77;
        v137[6] = *(id *)(a1 + 56);
        [v74 saveToPreferencesWithCompletionHandler:v137];
        goto LABEL_106;
      }
      id Property = *(id *)(a1 + 40);
      if (!Property) {
        goto LABEL_102;
      }
      if (objc_getProperty(Property, v73, 96, 1))
      {
        id v74 = +[NEDNSProxyManager sharedManager];
        v75 = v136;
        v136[0] = MEMORY[0x1E4F143A8];
        v136[1] = 3221225472;
        v136[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_6;
        v136[3] = &unk_1E5992B60;
        v136[7] = &v158;
        id v105 = *(id *)(a1 + 32);
        uint64_t v106 = *(void *)(a1 + 40);
        v136[4] = v105;
        v136[5] = v106;
        v136[6] = *(id *)(a1 + 56);
        [v74 saveToPreferencesWithCompletionHandler:v136];
        goto LABEL_106;
      }
      id Property = *(id *)(a1 + 40);
      if (!Property) {
        goto LABEL_102;
      }
      if (objc_getProperty(Property, v104, 104, 1))
      {
        id v74 = +[NEDNSSettingsManager sharedManager];
        v75 = v135;
        v135[0] = MEMORY[0x1E4F143A8];
        v135[1] = 3221225472;
        v135[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_7;
        v135[3] = &unk_1E5992B60;
        v135[7] = &v158;
        id v116 = *(id *)(a1 + 32);
        uint64_t v117 = *(void *)(a1 + 40);
        v135[4] = v116;
        v135[5] = v117;
        v135[6] = *(id *)(a1 + 56);
        [v74 saveToPreferencesWithCompletionHandler:v135];
      }
      else
      {
        id Property = *(id *)(a1 + 40);
        if (Property) {
          id Property = objc_getProperty(Property, v115, 80, 1);
        }
LABEL_102:
        id v74 = Property;
        v75 = v134;
        v134[0] = MEMORY[0x1E4F143A8];
        v134[1] = 3221225472;
        v134[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_8;
        v134[3] = &unk_1E5992B60;
        v134[7] = &v158;
        id v121 = *(id *)(a1 + 32);
        uint64_t v122 = *(void *)(a1 + 40);
        v134[4] = v121;
        v134[5] = v122;
        v134[6] = *(id *)(a1 + 56);
        [v74 saveToPreferencesWithCompletionHandler:v134];
      }
      goto LABEL_106;
    case 33:
      id v78 = *(id *)(a1 + 40);
      if (!v78) {
        goto LABEL_105;
      }
      if (objc_getProperty(v78, v20, 88, 1))
      {
        id v74 = +[NEFilterManager sharedManager];
        v75 = v156;
        v156[0] = MEMORY[0x1E4F143A8];
        v156[1] = 3221225472;
        v156[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_189;
        v156[3] = &unk_1E5992B60;
        v156[7] = &v158;
        id v80 = *(id *)(a1 + 32);
        uint64_t v81 = *(void *)(a1 + 40);
        v156[4] = v80;
        v156[5] = v81;
        v156[6] = *(id *)(a1 + 56);
        [v74 removeFromPreferencesWithCompletionHandler:v156];
        goto LABEL_106;
      }
      id v78 = *(id *)(a1 + 40);
      if (!v78) {
        goto LABEL_105;
      }
      if (objc_getProperty(v78, v79, 96, 1))
      {
        id v74 = +[NEDNSProxyManager sharedManager];
        v75 = v155;
        v155[0] = MEMORY[0x1E4F143A8];
        v155[1] = 3221225472;
        v155[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2_193;
        v155[3] = &unk_1E5992B60;
        v155[7] = &v158;
        id v108 = *(id *)(a1 + 32);
        uint64_t v109 = *(void *)(a1 + 40);
        v155[4] = v108;
        v155[5] = v109;
        v155[6] = *(id *)(a1 + 56);
        [v74 removeFromPreferencesWithCompletionHandler:v155];
        goto LABEL_106;
      }
      id v78 = *(id *)(a1 + 40);
      if (!v78) {
        goto LABEL_105;
      }
      if (objc_getProperty(v78, v107, 104, 1))
      {
        id v74 = +[NEDNSSettingsManager sharedManager];
        v75 = v154;
        v154[0] = MEMORY[0x1E4F143A8];
        v154[1] = 3221225472;
        v154[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_3_194;
        v154[3] = &unk_1E5992B60;
        v154[7] = &v158;
        id v119 = *(id *)(a1 + 32);
        uint64_t v120 = *(void *)(a1 + 40);
        v154[4] = v119;
        v154[5] = v120;
        v154[6] = *(id *)(a1 + 56);
        [v74 removeFromPreferencesWithCompletionHandler:v154];
      }
      else
      {
        id v78 = *(id *)(a1 + 40);
        if (v78) {
          id v78 = objc_getProperty(v78, v118, 80, 1);
        }
LABEL_105:
        id v74 = v78;
        v75 = v153;
        v153[0] = MEMORY[0x1E4F143A8];
        v153[1] = 3221225472;
        v153[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_4;
        v153[3] = &unk_1E5992B60;
        v153[7] = &v158;
        id v123 = *(id *)(a1 + 32);
        uint64_t v124 = *(void *)(a1 + 40);
        v153[4] = v123;
        v153[5] = v124;
        v153[6] = *(id *)(a1 + 56);
        [v74 removeFromPreferencesWithCompletionHandler:v153];
      }
LABEL_106:

      SEL v12 = (void *)v75[4];
      break;
    case 44:
      v82 = *(void **)(a1 + 40);
      uint64_t v83 = *(void *)(a1 + 48);
      uint64_t v29 = v159;
      v131 = (void *)v159[5];
      [v82 setAppPushParameters:v83 errorStr:&v131];
      long long v30 = v131;
      goto LABEL_64;
    case 45:
      v84 = *(void **)(a1 + 40);
      uint64_t v85 = *(void *)(a1 + 48);
      uint64_t v29 = v159;
      v130 = (void *)v159[5];
      [v84 unsetAppPushParameters:v85 errorStr:&v130];
      long long v30 = v130;
      goto LABEL_64;
    case 46:
      v86 = *(void **)(a1 + 40);
      uint64_t v87 = *(void *)(a1 + 48);
      uint64_t v29 = v159;
      v141 = (void *)v159[5];
      [v86 addRelayWithParameters:v87 errorStr:&v141];
      long long v30 = v141;
      goto LABEL_64;
    case 47:
      v88 = *(void **)(a1 + 40);
      uint64_t v89 = *(void *)(a1 + 48);
      uint64_t v29 = v159;
      v140 = (void *)v159[5];
      [v88 removeRelayWithParameters:v89 errorStr:&v140];
      long long v30 = v140;
      goto LABEL_64;
    case 48:
      v90 = *(void **)(a1 + 40);
      uint64_t v91 = *(void *)(a1 + 48);
      uint64_t v29 = v159;
      v139 = (void *)v159[5];
      [v90 setRelayConditionsWithParameters:v91 errorStr:&v139];
      long long v30 = v139;
      goto LABEL_64;
    case 49:
      v92 = *(void **)(a1 + 40);
      uint64_t v93 = *(void *)(a1 + 48);
      uint64_t v29 = v159;
      v138 = (void *)v159[5];
      [v92 unsetRelayConditionsWithParameters:v93 errorStr:&v138];
      long long v30 = v138;
LABEL_64:
      id v94 = v30;
      id v71 = (id)v29[5];
      v29[5] = (uint64_t)v94;
      goto LABEL_65;
    default:
      switch(v26)
      {
        case 'e':
          goto LABEL_66;
        case 'g':
        case 'h':
          long long v31 = *(void **)(a1 + 40);
          if (v31 && objc_getProperty(v31, v20, 80, 1))
          {
            id v33 = *(id *)(a1 + 40);
            if (v33) {
              id v33 = objc_getProperty(v33, v32, 80, 1);
            }
            id v34 = v33;
            long long v35 = [v34 connection];
            unint64_t v36 = [v35 status];

            if (v36 <= 5) {
              [v8 addObject:off_1E5992BA8[v36]];
            }
          }
          goto LABEL_66;
        case 'i':
          v95 = *(void **)(a1 + 40);
          if (!v95 || !objc_getProperty(v95, v20, 80, 1)) {
            goto LABEL_66;
          }
          v96 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"stop-current-session"];
          if (isa_nsstring(v96))
          {
            if ([v96 BOOLValue]) {
              v98 = &unk_1EF08D468;
            }
            else {
              v98 = 0;
            }
          }
          else
          {
            v98 = 0;
          }
          id v110 = *(id *)(a1 + 40);
          if (v110) {
            id v110 = objc_getProperty(v110, v97, 80, 1);
          }
          id v111 = v110;
          v112 = [v111 connection];
          id v125 = 0;
          [v112 startVPNTunnelWithOptions:v98 andReturnError:&v125];
          id v71 = v125;

          if (v71)
          {
            uint64_t v113 = [NSString stringWithFormat:@"Failed to start the tunnel: %@", v71];
            v114 = (void *)v159[5];
            v159[5] = v113;
          }
          break;
        case 'j':
          v99 = *(void **)(a1 + 40);
          if (!v99 || !objc_getProperty(v99, v20, 80, 1)) {
            goto LABEL_66;
          }
          id v101 = *(id *)(a1 + 40);
          if (v101) {
            id v101 = objc_getProperty(v101, v100, 80, 1);
          }
          id v71 = v101;
          v102 = [v71 connection];
          [v102 stopVPNTunnel];

          break;
        default:
          goto LABEL_81;
      }
LABEL_65:

LABEL_66:
      if (v159[5]) {
        objc_msgSend(v8, "addObject:");
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      goto LABEL_69;
  }
LABEL_3:

LABEL_69:
  _Block_object_dispose(&v158, 8);
}

void __80__NEProviderAppConfigurationClient_loadConfigurationWithName_completionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id Property = (id)a1[4];
  id v24 = v4;
  if (Property) {
    id Property = objc_getProperty(Property, v3, 120, 1);
  }
  id v6 = Property;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
LABEL_5:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v30 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          objc_opt_isKindOfClass();
        }
      }
      SEL v12 = [v11 localizedDescription];
      char v13 = [v12 isEqualToString:a1[5]];

      if (v13) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v8) {
          goto LABEL_5;
        }
        goto LABEL_14;
      }
    }
    id v16 = v11;

    SEL v15 = v24;
    if (v16) {
      goto LABEL_29;
    }
  }
  else
  {
LABEL_14:

    SEL v15 = v24;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v17 = (id)a1[4];
  if (v17) {
    id v17 = objc_getProperty(v17, v14, 112, 1);
  }
  id v18 = v17;
  id v16 = (id)[v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v16)
  {
    uint64_t v19 = *(void *)v26;
    while (2)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v18);
        }
        uint64_t v21 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v22 = [v21 localizedDescription];
        int v23 = [v22 isEqualToString:a1[5]];

        if (v23)
        {
          id v16 = v21;
          goto LABEL_28;
        }
      }
      id v16 = (id)[v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_28:

LABEL_29:
  (*(void (**)(void))(a1[6] + 16))();
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_189(void *a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Failed to remove configuration \"%@\": %@", a1[4], v4];
    uint64_t v6 = *(void *)(a1[7] + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    id Property = (id)a1[5];
    if (Property) {
      id Property = objc_getProperty(Property, v3, 120, 1);
    }
    id v9 = Property;
    uint64_t v7 = +[NEFilterManager sharedManager];
    [v9 removeObjectIdenticalTo:v7];
  }
  uint64_t v10 = a1[6];
  if (*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    v12[0] = *(void *)(*(void *)(a1[7] + 8) + 40);
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }
  else
  {
    (*(void (**)(void, void))(v10 + 16))(a1[6], 0);
  }
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2_193(void *a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Failed to remove configuration \"%@\": %@", a1[4], v4];
    uint64_t v6 = *(void *)(a1[7] + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    id Property = (id)a1[5];
    if (Property) {
      id Property = objc_getProperty(Property, v3, 120, 1);
    }
    id v9 = Property;
    uint64_t v7 = +[NEDNSProxyManager sharedManager];
    [v9 removeObjectIdenticalTo:v7];
  }
  uint64_t v10 = a1[6];
  if (*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    v12[0] = *(void *)(*(void *)(a1[7] + 8) + 40);
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }
  else
  {
    (*(void (**)(void, void))(v10 + 16))(a1[6], 0);
  }
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_3_194(void *a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Failed to remove configuration \"%@\": %@", a1[4], v4];
    uint64_t v6 = *(void *)(a1[7] + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    id Property = (id)a1[5];
    if (Property) {
      id Property = objc_getProperty(Property, v3, 120, 1);
    }
    id v9 = Property;
    uint64_t v7 = +[NEDNSSettingsManager sharedManager];
    [v9 removeObjectIdenticalTo:v7];
  }
  uint64_t v10 = a1[6];
  if (*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    v12[0] = *(void *)(*(void *)(a1[7] + 8) + 40);
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }
  else
  {
    (*(void (**)(void, void))(v10 + 16))(a1[6], 0);
  }
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_4(void *a1, void *a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Failed to remove configuration \"%@\": %@", a1[4], v4];
    uint64_t v6 = *(void *)(a1[7] + 8);
    id v7 = *(id *)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    id Property = (id)a1[5];
    if (Property) {
      id Property = objc_getProperty(Property, v3, 112, 1);
    }
    id v10 = Property;
    uint64_t v11 = (void *)a1[5];
    if (v11) {
      id v12 = objc_getProperty(v11, v9, 80, 1);
    }
    else {
      id v12 = 0;
    }
    [v10 removeObjectIdenticalTo:v12];

    id v14 = (id)a1[5];
    if (v14) {
      id v14 = objc_getProperty(v14, v13, 120, 1);
    }
    id v7 = v14;
    id v16 = (void *)a1[5];
    if (v16) {
      id v17 = objc_getProperty(v16, v15, 80, 1);
    }
    else {
      id v17 = 0;
    }
    [v7 removeObjectIdenticalTo:v17];
  }

  uint64_t v18 = a1[6];
  if (*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    v20[0] = *(void *)(*(void *)(a1[7] + 8) + 40);
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);
  }
  else
  {
    (*(void (**)(void, void))(v18 + 16))(a1[6], 0);
  }
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_5(void *a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Failed to save configuration \"%@\": %@", a1[4], v4];
    uint64_t v6 = *(void *)(a1[7] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  uint64_t v8 = (void *)a1[5];
  if (v8) {
    objc_setProperty_atomic(v8, v3, 0, 120);
  }
  uint64_t v9 = a1[6];
  if (*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    v11[0] = *(void *)(*(void *)(a1[7] + 8) + 40);
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
  else
  {
    (*(void (**)(void, void))(v9 + 16))(a1[6], 0);
  }
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_6(void *a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Failed to save configuration \"%@\": %@", a1[4], v4];
    uint64_t v6 = *(void *)(a1[7] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  uint64_t v8 = (void *)a1[5];
  if (v8) {
    objc_setProperty_atomic(v8, v3, 0, 120);
  }
  uint64_t v9 = a1[6];
  if (*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    v11[0] = *(void *)(*(void *)(a1[7] + 8) + 40);
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
  else
  {
    (*(void (**)(void, void))(v9 + 16))(a1[6], 0);
  }
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_7(void *a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Failed to save configuration \"%@\": %@", a1[4], v4];
    uint64_t v6 = *(void *)(a1[7] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  uint64_t v8 = (void *)a1[5];
  if (v8) {
    objc_setProperty_atomic(v8, v3, 0, 120);
  }
  uint64_t v9 = a1[6];
  if (*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    v11[0] = *(void *)(*(void *)(a1[7] + 8) + 40);
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
  else
  {
    (*(void (**)(void, void))(v9 + 16))(a1[6], 0);
  }
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_8(void *a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Failed to save configuration \"%@\": %@", a1[4], v4];
    uint64_t v6 = *(void *)(a1[7] + 8);
    id v7 = *(id *)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    id Property = (id)a1[5];
    if (Property) {
      id Property = objc_getProperty(Property, v3, 112, 1);
    }
    id v7 = Property;
    id v10 = (void *)a1[5];
    if (v10) {
      id v11 = objc_getProperty(v10, v9, 80, 1);
    }
    else {
      id v11 = 0;
    }
    [v7 removeObjectIdenticalTo:v11];
  }

  char v13 = (void *)a1[5];
  if (v13) {
    objc_setProperty_atomic(v13, v12, 0, 120);
  }
  uint64_t v14 = a1[6];
  if (*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    v16[0] = *(void *)(*(void *)(a1[7] + 8) + 40);
    SEL v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
  }
  else
  {
    (*(void (**)(void, void))(v14 + 16))(a1[6], 0);
  }
}

void __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = +[NEVPNManager sharedManager];
  id v3 = [v2 connection];
  uint64_t v4 = [v3 status];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = +[NEVPNManager sharedManager];
    uint64_t v8 = objc_msgSend(v5, "initWithObjects:", v6, 0);
    uint64_t v9 = *(void **)(a1 + 32);
    if (v9) {
      objc_setProperty_atomic(v9, v7, v8, 120);
    }
  }
  id v10 = +[NEFilterManager sharedManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E5993798;
  id v11 = *(void **)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  id v13 = v11;
  [v10 loadFromPreferencesWithCompletionHandler:v12];
}

uint64_t __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v2 = +[NEFilterManager sharedManager];
  id v3 = [v2 providerConfiguration];

  if (v3)
  {
    id v5 = *(void **)(a1 + 32);
    if (v5 && objc_getProperty(v5, v4, 120, 1))
    {
      id Property = *(id *)(a1 + 32);
      if (Property) {
        id Property = objc_getProperty(Property, v6, 120, 1);
      }
      id v8 = Property;
      uint64_t v9 = +[NEFilterManager sharedManager];
      [v8 addObject:v9];
    }
    else
    {
      id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v9 = +[NEFilterManager sharedManager];
      id v8 = (id)objc_msgSend(v10, "initWithObjects:", v9, 0);
      id v12 = *(void **)(a1 + 32);
      if (v12) {
        objc_setProperty_atomic(v12, v11, v8, 120);
      }
    }
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_3;
  v14[3] = &unk_1E5993720;
  id v13 = *(void **)(a1 + 40);
  v14[4] = *(void *)(a1 + 32);
  id v15 = v13;
  +[NETunnelProviderManager loadAllFromPreferencesWithCompletionHandler:v14];
}

void __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    id v5 = *(void **)(a1 + 32);
    if (v5 && objc_getProperty(v5, v4, 120, 1))
    {
      id Property = *(id *)(a1 + 32);
      if (Property) {
        id Property = objc_getProperty(Property, v6, 120, 1);
      }
      [Property addObjectsFromArray:v3];
    }
    else
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v3];
      id v10 = *(void **)(a1 + 32);
      if (v10) {
        objc_setProperty_atomic(v10, v8, v9, 120);
      }
    }
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_4;
  v12[3] = &unk_1E5993720;
  id v11 = *(void **)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  id v13 = v11;
  +[NEAppProxyProviderManager loadAllFromPreferencesWithCompletionHandler:v12];
}

void __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    id v5 = *(void **)(a1 + 32);
    if (v5 && objc_getProperty(v5, v4, 120, 1))
    {
      id Property = *(id *)(a1 + 32);
      if (Property) {
        id Property = objc_getProperty(Property, v6, 120, 1);
      }
      [Property addObjectsFromArray:v3];
    }
    else
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v3];
      id v10 = *(void **)(a1 + 32);
      if (v10) {
        objc_setProperty_atomic(v10, v8, v9, 120);
      }
    }
  }
  id v11 = +[NEDNSProxyManager sharedManager];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_5;
  v13[3] = &unk_1E5993798;
  id v12 = *(void **)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  id v14 = v12;
  [v11 loadFromPreferencesWithCompletionHandler:v13];
}

void __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = *(void **)(a1 + 32);
  if (v5 && objc_getProperty(v5, v3, 120, 1))
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v6, 120, 1);
    }
    id v8 = Property;
    uint64_t v9 = +[NEDNSProxyManager sharedManager];
    [v8 addObject:v9];
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v9 = +[NEDNSProxyManager sharedManager];
    id v8 = (id)objc_msgSend(v10, "initWithObjects:", v9, 0);
    id v12 = *(void **)(a1 + 32);
    if (v12) {
      objc_setProperty_atomic(v12, v11, v8, 120);
    }
  }

  id v13 = +[NEDNSSettingsManager sharedManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_6;
  v15[3] = &unk_1E5993798;
  id v14 = *(void **)(a1 + 40);
  v15[4] = *(void *)(a1 + 32);
  id v16 = v14;
  [v13 loadFromPreferencesWithCompletionHandler:v15];
}

void __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4 && objc_getProperty(v4, v3, 120, 1))
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 120, 1);
    }
    id v7 = Property;
    id v8 = +[NEDNSSettingsManager sharedManager];
    [v7 addObject:v8];
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v8 = +[NEDNSSettingsManager sharedManager];
    id v7 = (id)objc_msgSend(v9, "initWithObjects:", v8, 0);
    id v11 = *(void **)(a1 + 32);
    if (v11) {
      objc_setProperty_atomic(v11, v10, v7, 120);
    }
  }

  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0);
  }
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "Got an error on the connection with the app: %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_setProperty_atomic(v6, v5, 0, 136);
    id v8 = *(void **)(a1 + 32);
    if (v8) {
      objc_setProperty_atomic(v8, v7, 0, 144);
    }
  }
}

- (BOOL)setProviderTypeWithParameters:(id)a3 errorStr:(id *)a4
{
  id v5 = [a3 objectForKeyedSubscript:@"provider-type"];

  if (v5) {
    *a4 = @"The provider type cannot be specified for this configuration type";
  }
  return v5 == 0;
}

- (BOOL)unsetSharedSecretWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  id v7 = [(NEProviderAppConfigurationClient *)self protocolForParameters:v6];
  id v8 = [v6 objectForKeyedSubscript:@"shared-secret"];

  LODWORD(v6) = isa_nsstring(v8);
  if (v6
    && ([v7 sharedSecretReference], int v9 = objc_claimAutoreleasedReturnValue(),
                                                   v9,
                                                   v9)
    && ([v7 sharedSecretReference],
        id v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = -[NEProviderAppConfigurationClient deleteKeychainItemWithPersistentReference:]((uint64_t)self, v10),
        v10,
        v11))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Failed to delete the shared secret keychain item: %d", v11);
    BOOL v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (uint64_t)deleteKeychainItemWithPersistentReference:(uint64_t)a1
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v2 = *MEMORY[0x1E4F3B988];
  uint64_t v3 = *MEMORY[0x1E4F3BD40];
  v9[0] = *MEMORY[0x1E4F3B978];
  v9[1] = v3;
  v10[0] = v2;
  v10[1] = a2;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a2;
  CFDictionaryRef v6 = [v4 dictionaryWithObjects:v10 forKeys:v9 count:2];

  uint64_t v7 = SecItemDelete(v6);
  return v7;
}

- (BOOL)setSharedSecretWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(NEProviderAppConfigurationClient *)self protocolForParameters:v6];
  id v8 = [v6 objectForKeyedSubscript:@"shared-secret"];
  int v9 = isa_nsstring(v8);

  if (v9)
  {
    id v10 = [v7 sharedSecretReference];
    uint64_t v11 = [v6 objectForKeyedSubscript:@"shared-secret"];
    BOOL v12 = [v11 dataUsingEncoding:4];

    id v14 = NSString;
    if (self) {
      id Property = objc_getProperty(self, v13, 80, 1);
    }
    else {
      id Property = 0;
    }
    id v16 = [Property localizedDescription];
    id v17 = [v14 stringWithFormat:@"%@.SHAREDSECRET", v16];
    id v22 = v10;
    uint64_t v18 = -[NEProviderAppConfigurationClient setKeychainItemData:withName:persistentReference:](self, v12, v17, (uint64_t *)&v22);
    id v19 = v22;

    BOOL v20 = v18 == 0;
    if (v18)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Failed to set the shared secret in the keychain: %d", v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      [v7 setSharedSecretReference:v19];
    }
  }
  else
  {
    BOOL v20 = 1;
  }

  return v20;
}

- (uint64_t)setKeychainItemData:(void *)a3 withName:(uint64_t *)a4 persistentReference:
{
  v40[3] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v9 = a3;
  if (a1)
  {
    uint64_t v10 = *a4;
    uint64_t v11 = *MEMORY[0x1E4F1CFD0];
    uint64_t v12 = *MEMORY[0x1E4F3BD20];
    unint64_t v13 = 0x1E4F1C000uLL;
    if (!*a4) {
      goto LABEL_5;
    }
    uint64_t v14 = *MEMORY[0x1E4F3BC68];
    v39[0] = *MEMORY[0x1E4F3BD40];
    v39[1] = v14;
    v40[0] = v10;
    v40[1] = v11;
    v39[2] = v12;
    v40[2] = v11;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];
    CFTypeRef result = 0;
    if (SecItemCopyMatching((CFDictionaryRef)v15, &result))
    {

      goto LABEL_5;
    }
    long long v27 = (id)result;
    int v28 = isa_nsdictionary(v27);
    if (v28)
    {
      id v35 = v9;
      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v29 setObject:*MEMORY[0x1E4F3B988] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
      uint64_t v30 = *MEMORY[0x1E4F3B850];
      [v27 objectForKeyedSubscript:*MEMORY[0x1E4F3B850]];
      v31 = int v34 = v28;
      [v29 setObject:v31 forKeyedSubscript:v30];

      [v29 setObject:v11 forKeyedSubscript:v12];
      long long v32 = (void *)[v27 mutableCopy];
      [v32 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F3BD38]];
      uint64_t v24 = SecItemUpdate((CFDictionaryRef)v29, (CFDictionaryRef)v32);

      int v28 = v34;
      id v9 = v35;
      if (v24 != -25300)
      {

LABEL_14:
        goto LABEL_15;
      }
    }

    unint64_t v13 = 0x1E4F1C000;
    if (((*a4 != 0) & ~v28) == 0)
    {
LABEL_5:
      v37[0] = *MEMORY[0x1E4F3B850];
      id v16 = NSString;
      id v17 = objc_msgSend(objc_getProperty(a1, v8, 80, 1), "localizedDescription");
      uint64_t v18 = [v16 stringWithFormat:@"%@.PASSWORD", v17];
      uint64_t v19 = *MEMORY[0x1E4F3BD38];
      v38[0] = v18;
      v38[1] = v7;
      uint64_t v20 = *MEMORY[0x1E4F3B558];
      v37[1] = v19;
      v37[2] = v20;
      uint64_t v21 = *MEMORY[0x1E4F3B978];
      uint64_t v22 = *MEMORY[0x1E4F3B988];
      v38[2] = *MEMORY[0x1E4F3B570];
      v38[3] = v22;
      uint64_t v23 = *MEMORY[0x1E4F3BC78];
      v37[3] = v21;
      void v37[4] = v23;
      v37[5] = v12;
      v38[4] = v11;
      v38[5] = v11;
      id v15 = [*(id *)(v13 + 2536) dictionaryWithObjects:v38 forKeys:v37 count:6];

      CFTypeRef result = 0;
      uint64_t v24 = SecItemAdd((CFDictionaryRef)v15, &result);
      if (!v24)
      {
        long long v25 = (id)result;
        if (isa_nsdata(v25))
        {
          id v26 = v25;
          *a4 = (uint64_t)v26;
        }
        else
        {

          uint64_t v24 = 4294965226;
        }
      }
      goto LABEL_14;
    }
  }
  uint64_t v24 = 0;
LABEL_15:

  return v24;
}

- (BOOL)unsetPasswordWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  id v7 = [(NEProviderAppConfigurationClient *)self protocolForParameters:v6];
  id v8 = [v6 objectForKeyedSubscript:@"password"];

  LODWORD(v6) = isa_nsstring(v8);
  if (v6
    && ([v7 passwordReference], id v9 = objc_claimAutoreleasedReturnValue(), v9, v9)
    && ([v7 passwordReference],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = -[NEProviderAppConfigurationClient deleteKeychainItemWithPersistentReference:]((uint64_t)self, v10),
        v10,
        v11))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Failed to delete the password keychain item: %d", v11);
    BOOL v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (BOOL)setPasswordWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  id v7 = [(NEProviderAppConfigurationClient *)self protocolForParameters:v6];
  id v8 = [v6 objectForKeyedSubscript:@"password"];
  int v9 = isa_nsstring(v8);

  if (v9)
  {
    uint64_t v10 = [v7 passwordReference];
    uint64_t v11 = [v6 objectForKeyedSubscript:@"password"];
    BOOL v12 = [v11 dataUsingEncoding:4];

    uint64_t v14 = NSString;
    if (self) {
      id Property = objc_getProperty(self, v13, 80, 1);
    }
    else {
      id Property = 0;
    }
    id v16 = [Property localizedDescription];
    id v17 = [v14 stringWithFormat:@"%@.PASSWORD", v16];
    id v22 = v10;
    uint64_t v18 = -[NEProviderAppConfigurationClient setKeychainItemData:withName:persistentReference:](self, v12, v17, (uint64_t *)&v22);
    id v19 = v22;

    BOOL v20 = v18 == 0;
    if (v18)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Failed to set the password in the keychain: %d", v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      [v7 setPasswordReference:v19];
    }
  }
  else
  {
    BOOL v20 = 1;
  }

  return v20;
}

- (BOOL)setProtocolWithParameters:(id)a3 errorStr:(id *)a4
{
  id v7 = [a3 objectForKeyedSubscript:@"type"];
  if (self) {
    id Property = objc_getProperty(self, v6, 80, 1);
  }
  else {
    id Property = 0;
  }
  id v9 = Property;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    || (!self ? (id v12 = 0) : (id v12 = objc_getProperty(self, v11, 80, 1)),
        id v13 = v12,
        objc_opt_class(),
        char v14 = objc_opt_isKindOfClass(),
        v13,
        (v14 & 1) != 0))
  {
    if ([v7 isEqualToString:@"provider"])
    {
      id v16 = (objc_class *)NETunnelProviderProtocol;
LABEL_9:
      id v18 = objc_alloc_init(v16);
      if (self) {
        id v19 = objc_getProperty(self, v17, 80, 1);
      }
      else {
        id v19 = 0;
      }
      [v19 setProtocolConfiguration:v18];

      goto LABEL_12;
    }
    BOOL v20 = 0;
    uint64_t v21 = @"Invalid protocol type, valid type is \"provider\"";
LABEL_14:
    *a4 = v21;
    goto LABEL_15;
  }
  if (self) {
    id v23 = objc_getProperty(self, v15, 80, 1);
  }
  else {
    id v23 = 0;
  }
  id v24 = v23;
  objc_opt_class();
  char v25 = objc_opt_isKindOfClass();

  if (v25)
  {
    if ([v7 isEqualToString:@"ikev1"])
    {
      long long v27 = off_1E598D890;
    }
    else
    {
      if (([v7 isEqualToString:@"ikev2"] & 1) == 0)
      {
        BOOL v20 = 0;
        uint64_t v21 = @"Invalid protocol type, valid types are \"ikev1\" and \"ikev2\"";
        goto LABEL_14;
      }
      long long v27 = off_1E598D888;
    }
    id v16 = (objc_class *)*v27;
    goto LABEL_9;
  }
  if (self)
  {
    if (objc_getProperty(self, v26, 88, 1))
    {
      if (([v7 isEqualToString:@"provider"] & 1) == 0)
      {
        BOOL v20 = 0;
        uint64_t v21 = @"Invalid filter type, valid type is \"provider\"";
        goto LABEL_14;
      }
      id v29 = objc_alloc_init(NEFilterProviderConfiguration);
      BOOL v20 = 1;
      objc_msgSend(objc_getProperty(self, v30, 88, 1), "setProviderConfiguration:", v29);
    }
    else
    {
      BOOL v20 = 1;
      if (!objc_getProperty(self, v28, 96, 1)) {
        goto LABEL_15;
      }
      if (([v7 isEqualToString:@"provider"] & 1) == 0)
      {
        BOOL v20 = 0;
        uint64_t v21 = @"Invalid DNS proxy type, valid type is \"provider\"";
        goto LABEL_14;
      }
      id v29 = objc_alloc_init(NEDNSProxyProviderProtocol);
      objc_msgSend(objc_getProperty(self, v31, 96, 1), "setProviderProtocol:", v29);
    }

    goto LABEL_15;
  }
LABEL_12:
  BOOL v20 = 1;
LABEL_15:

  return v20;
}

- (BOOL)createConfigurationWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"name"];
  id v8 = [v6 objectForKeyedSubscript:@"type"];

  if ([v8 isEqualToString:@"lite"])
  {
    id v9 = +[NEVPNManager sharedManager];
    [v9 setLocalizedDescription:v7];

    uint64_t v10 = +[NEVPNManager sharedManager];
    id v12 = v10;
    if (self)
    {
      objc_setProperty_atomic(self, v11, v10, 80);

      if (!objc_getProperty(self, v13, 112, 1))
      {
        id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        objc_setProperty_atomic(self, v16, v15, 112);
      }
LABEL_10:
      id v24 = objc_getProperty(self, v14, 112, 1);
      id Property = objc_getProperty(self, v25, 80, 1);
LABEL_11:
      [v24 addObject:Property];

      goto LABEL_31;
    }

    goto LABEL_36;
  }
  if ([v8 isEqualToString:@"packet-tunnel"])
  {
    id v17 = objc_alloc_init(NETunnelProviderManager);
    id v19 = v17;
    if (self)
    {
      objc_setProperty_atomic(self, v18, v17, 80);

      objc_msgSend(objc_getProperty(self, v20, 80, 1), "setLocalizedDescription:", v7);
      if (!objc_getProperty(self, v21, 112, 1))
      {
        id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        objc_setProperty_atomic(self, v23, v22, 112);
      }
      goto LABEL_10;
    }

    [0 setLocalizedDescription:v7];
LABEL_36:

    id v24 = 0;
    id Property = 0;
    goto LABEL_11;
  }
  if ([v8 isEqualToString:@"filter"])
  {
    long long v27 = +[NEFilterManager sharedManager];
    [v27 setLocalizedDescription:v7];

    if (self)
    {
      if (!objc_getProperty(self, v28, 112, 1))
      {
        id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        objc_setProperty_atomic(self, v31, v30, 112);
      }
      id v32 = objc_getProperty(self, v29, 112, 1);
    }
    else
    {

      id v32 = 0;
    }
    id v33 = NEFilterManager;
  }
  else if ([v8 isEqualToString:@"dns-proxy"])
  {
    int v34 = +[NEDNSProxyManager sharedManager];
    [v34 setLocalizedDescription:v7];

    if (self)
    {
      if (!objc_getProperty(self, v35, 112, 1))
      {
        id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        objc_setProperty_atomic(self, v38, v37, 112);
      }
      id v32 = objc_getProperty(self, v36, 112, 1);
    }
    else
    {

      id v32 = 0;
    }
    id v33 = NEDNSProxyManager;
  }
  else
  {
    if (![v8 isEqualToString:@"dns-settings"])
    {
      [NSString stringWithFormat:@"Invalid configuration type, valid types are \"lite\", \"packet-tunnel\", \"filter\", \"dns-proxy\", and \"dns-settings\""];
      BOOL v46 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
    long long v39 = +[NEDNSSettingsManager sharedManager];
    [v39 setLocalizedDescription:v7];

    if (self)
    {
      if (!objc_getProperty(self, v40, 112, 1))
      {
        id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        objc_setProperty_atomic(self, v43, v42, 112);
      }
      id v32 = objc_getProperty(self, v41, 112, 1);
    }
    else
    {

      id v32 = 0;
    }
    id v33 = NEDNSSettingsManager;
  }
  id v44 = v32;
  uint64_t v45 = [(__objc2_class *)v33 sharedManager];
  [v44 addObject:v45];

LABEL_31:
  BOOL v46 = 1;
LABEL_32:

  return v46;
}

- (id)dnsSettingsBundle
{
  if (self)
  {
    self = (NEProviderAppConfigurationClient *)objc_getProperty(self, a2, 104, 1);
    if (self) {
      self = (NEProviderAppConfigurationClient *)objc_getProperty(self, v2, 40, 1);
    }
  }
  uint64_t v3 = self;
  id v4 = [(NEProviderAppConfigurationClient *)v3 dnsSettings];

  return v4;
}

- (id)dnsProxyConfiguration
{
  if (self)
  {
    self = (NEProviderAppConfigurationClient *)objc_getProperty(self, a2, 96, 1);
    uint64_t v2 = vars8;
  }
  return (id)[(NEProviderAppConfigurationClient *)self providerProtocol];
}

- (id)filterConfiguration
{
  if (self)
  {
    self = (NEProviderAppConfigurationClient *)objc_getProperty(self, a2, 88, 1);
    uint64_t v2 = vars8;
  }
  return (id)[(NEProviderAppConfigurationClient *)self providerConfiguration];
}

- (id)protocolForParameters:(id)a3
{
  if (self)
  {
    self = (NEProviderAppConfigurationClient *)objc_getProperty(self, a2, 80, 1);
    uint64_t v3 = vars8;
  }
  return (id)[(NEProviderAppConfigurationClient *)self protocolConfiguration];
}

- (BOOL)isAlwaysOn
{
  return 0;
}

- (void)setOnDemandRules:(id)a3
{
  id v6 = (id)[a3 copy];
  if (self) {
    id Property = objc_getProperty(self, v4, 80, 1);
  }
  else {
    id Property = 0;
  }
  [Property setOnDemandRules:v6];
}

- (id)onDemandRules
{
  if (self)
  {
    self = (NEProviderAppConfigurationClient *)objc_getProperty(self, a2, 80, 1);
    uint64_t v2 = vars8;
  }
  return [(NEProviderAppConfigurationClient *)self onDemandRules];
}

- (void)setOnDemandEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (self) {
    self = (NEProviderAppConfigurationClient *)objc_getProperty(self, a2, 80, 1);
  }

  [(NEProviderAppConfigurationClient *)self setOnDemandEnabled:v3];
}

- (BOOL)onDemandEnabled
{
  if (self)
  {
    self = (NEProviderAppConfigurationClient *)objc_getProperty(self, a2, 80, 1);
    uint64_t v2 = vars8;
  }
  return [(NEProviderAppConfigurationClient *)self isOnDemandEnabled];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (self)
  {
    id v4 = self;
    id v5 = &OBJC_IVAR___NEProviderAppConfigurationClient__filterManager;
    if (!objc_getProperty(self, a2, 88, 1))
    {
      id v5 = &OBJC_IVAR___NEProviderAppConfigurationClient__dnsProxyManager;
      if (!objc_getProperty(v4, v6, 96, 1))
      {
        id v5 = &OBJC_IVAR___NEProviderAppConfigurationClient__dnsSettingsManager;
        if (!objc_getProperty(v4, v6, 104, 1)) {
          id v5 = &OBJC_IVAR___NEProviderAppConfigurationClient__currentManager;
        }
      }
    }
    self = (NEProviderAppConfigurationClient *)objc_getProperty(v4, v6, *v5, 1);
  }

  [(NEProviderAppConfigurationClient *)self setEnabled:v3];
}

- (BOOL)enabled
{
  if (self)
  {
    BOOL v3 = self;
    id v4 = &OBJC_IVAR___NEProviderAppConfigurationClient__filterManager;
    if (!objc_getProperty(self, a2, 88, 1))
    {
      id v4 = &OBJC_IVAR___NEProviderAppConfigurationClient__dnsProxyManager;
      if (!objc_getProperty(v3, v5, 96, 1))
      {
        id v4 = &OBJC_IVAR___NEProviderAppConfigurationClient__dnsSettingsManager;
        if (!objc_getProperty(v3, v5, 104, 1)) {
          id v4 = &OBJC_IVAR___NEProviderAppConfigurationClient__currentManager;
        }
      }
    }
    self = (NEProviderAppConfigurationClient *)objc_getProperty(v3, v5, *v4, 1);
    uint64_t v2 = vars8;
  }
  return [(NEProviderAppConfigurationClient *)self isEnabled];
}

- (void)handleConfigChanged:(id)a3
{
  if (self) {
    objc_setProperty_atomic(self, a2, 0, 120);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF09F3C0];
  [v7 setExportedInterface:v8];

  [v7 setExportedObject:self];
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__NEProviderAppConfigurationClient_listener_shouldAcceptNewConnection___block_invoke;
  v13[3] = &unk_1E5992C58;
  objc_copyWeak(&v14, &location);
  [v7 setInvalidationHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __71__NEProviderAppConfigurationClient_listener_shouldAcceptNewConnection___block_invoke_2;
  v11[3] = &unk_1E5992C58;
  objc_copyWeak(&v12, &location);
  [v7 setInterruptionHandler:v11];
  [v7 resume];
  if (self) {
    objc_setProperty_atomic(self, v9, v7, 136);
  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return 1;
}

void __71__NEProviderAppConfigurationClient_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  self = objc_loadWeakRetained((id *)(a1 + 32));
  if (self)
  {
    objc_setProperty_atomic(self, v1, 0, 80);
    objc_setProperty_atomic(self, v2, 0, 120);
    objc_setProperty_atomic(self, v3, 0, 112);
  }
}

void __71__NEProviderAppConfigurationClient_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  self = objc_loadWeakRetained((id *)(a1 + 32));
  if (self)
  {
    objc_setProperty_atomic(self, v1, 0, 80);
    objc_setProperty_atomic(self, v2, 0, 120);
    objc_setProperty_atomic(self, v3, 0, 112);
  }
}

- (NEProviderAppConfigurationClient)initWithClientName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NEProviderAppConfigurationClient;
  id v5 = [(NEUtilConfigurationClient *)&v10 initInternalWithClientName:v4];
  if (v5)
  {
    id v6 = [v4 componentsSeparatedByString:@":"];
    if ((unint64_t)[v6 count] < 2)
    {
      id v7 = (NSString *)v4;
    }
    else
    {
      id v7 = [v6 objectAtIndexedSubscript:1];
    }
    targetAppBundleID = v5->_targetAppBundleID;
    v5->_targetAppBundleID = v7;
  }
  return v5;
}

- (id)listenerEndpoint
{
  if (a1)
  {
    a1 = objc_msgSend(objc_getProperty(a1, a2, 72, 1), "endpoint");
    uint64_t v2 = vars8;
  }
  return a1;
}

@end