@interface NETunnelProviderManager
+ (NETunnelProviderManager)forPerAppVPN;
+ (void)loadAllFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (BOOL)isProtocolTypeValid:(int64_t)a3;
- (NETunnelProviderManager)init;
- (NETunnelProviderManager)initWithSessionType:(int)a3 tunnelType:(int64_t)a4;
- (NETunnelProviderRoutingMethod)routingMethod;
- (NSArray)appRules;
- (NSArray)associatedDomains;
- (NSArray)calendarDomains;
- (NSArray)contactsDomains;
- (NSArray)copyAppRules;
- (NSArray)excludedDomains;
- (NSArray)mailDomains;
- (NSArray)safariDomains;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)additionalSetup;
- (void)loadAppRules;
- (void)loadFromPreferencesWithCompletionHandler:(id)a3;
- (void)setAppRules:(NSArray *)appRules;
- (void)setAssociatedDomains:(NSArray *)associatedDomains;
- (void)setCalendarDomains:(NSArray *)calendarDomains;
- (void)setContactsDomains:(NSArray *)contactsDomains;
- (void)setExcludedDomains:(NSArray *)excludedDomains;
- (void)setMailDomains:(NSArray *)mailDomains;
- (void)setSafariDomains:(NSArray *)safariDomains;
@end

@implementation NETunnelProviderManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedDomains, 0);
  objc_storeStrong((id *)&self->_excludedDomains, 0);
  objc_storeStrong((id *)&self->_appRules, 0);
  objc_storeStrong((id *)&self->_contactsDomains, 0);
  objc_storeStrong((id *)&self->_calendarDomains, 0);
  objc_storeStrong((id *)&self->_mailDomains, 0);

  objc_storeStrong((id *)&self->_safariDomains, 0);
}

- (void)setAssociatedDomains:(NSArray *)associatedDomains
{
}

- (NSArray)associatedDomains
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setExcludedDomains:(NSArray *)excludedDomains
{
}

- (NSArray)excludedDomains
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAppRules:(NSArray *)appRules
{
}

- (NSArray)appRules
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setContactsDomains:(NSArray *)contactsDomains
{
}

- (NSArray)contactsDomains
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCalendarDomains:(NSArray *)calendarDomains
{
}

- (NSArray)calendarDomains
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMailDomains:(NSArray *)mailDomains
{
}

- (NSArray)mailDomains
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSafariDomains:(NSArray *)safariDomains
{
}

- (NSArray)safariDomains
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NETunnelProviderRoutingMethod)routingMethod
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(NEVPNManager *)v2 configuration];
  v4 = [v3 appVPN];
  if (v4) {
    NETunnelProviderRoutingMethod v5 = NETunnelProviderRoutingMethodSourceApplication;
  }
  else {
    NETunnelProviderRoutingMethod v5 = NETunnelProviderRoutingMethodDestinationIP;
  }

  objc_sync_exit(v2);
  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x1E4F28E78]);
  v14.receiver = self;
  v14.super_class = (Class)NETunnelProviderManager;
  v8 = [(NEVPNManager *)&v14 descriptionWithIndent:v5 options:a4];
  v9 = (void *)[v7 initWithString:v8];

  v10 = [(NEVPNManager *)self configuration];
  v11 = [v10 appVPN];
  v12 = [v11 appRules];
  [v9 appendPrettyObject:v12 withName:@"appRules" andIndent:v5 options:a4];

  return v9;
}

- (NSArray)copyAppRules
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(NEVPNManager *)v2 configuration];
  v4 = [v3 appVPN];
  if (v4)
  {
    uint64_t v5 = [(NEVPNManager *)v2 configuration];
    v6 = [v5 appVPN];
    id v7 = [v6 appRules];

    if (!v7)
    {
      v4 = 0;
      goto LABEL_6;
    }
    id v8 = objc_alloc(MEMORY[0x1E4F1C978]);
    v3 = [(NEVPNManager *)v2 configuration];
    v9 = [v3 appVPN];
    v10 = [v9 appRules];
    v4 = (NSArray *)[v8 initWithArray:v10 copyItems:1];
  }
LABEL_6:
  objc_sync_exit(v2);

  return v4;
}

- (void)loadFromPreferencesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = +[NEVPNManager configurationManager]();
    v6 = [(NEVPNManager *)self configuration];
    id v7 = [v6 identifier];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__NETunnelProviderManager_loadFromPreferencesWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E5993748;
    v8[4] = self;
    id v9 = v4;
    [v5 loadConfigurationWithID:v7 withCompletionQueue:MEMORY[0x1E4F14428] handler:v8];
  }
}

void __68__NETunnelProviderManager_loadFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  if (v6)
  {
    id v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v28 = 138412290;
      id v29 = v6;
      _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "Failed to load the configuration: %@", (uint8_t *)&v28, 0xCu);
    }

    id v9 = +[NEVPNManager mapError:]((uint64_t)NEVPNManager, v6);

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_16;
  }
  v10 = *(void **)(a1 + 32);
  if (!v5)
  {
    v20 = [v10 configuration];
    v21 = [v20 appVPN];

    v22 = [*(id *)(a1 + 32) configuration];
    if (v21) {
      [v22 appVPN];
    }
    else {
    v23 = [v22 VPN];
    }
    [v23 setEnabled:0];

    v24 = +[NEVPNManager loadedManagers]();
    v25 = [*(id *)(a1 + 32) configuration];
    v26 = [v25 identifier];
    [v24 removeObjectForKey:v26];

    v27 = [*(id *)(a1 + 32) connection];
    -[NEVPNConnection destroySession](v27);

    goto LABEL_15;
  }
  [v10 setConfiguration:v5];
  -[NETunnelProviderManager loadAppRules](*(void **)(a1 + 32));
  uint64_t v11 = *(void *)(a1 + 32);
  v12 = +[NEVPNManager loadedManagers]();
  v13 = [*(id *)(a1 + 32) configuration];
  objc_super v14 = [v13 identifier];
  [v12 setObject:v11 forKeyedSubscript:v14];

  v15 = [*(id *)(a1 + 32) connection];
  if (v15)
  {
    uint64_t v16 = v15[7];

    if (v16)
    {
LABEL_15:
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      id v9 = 0;
      goto LABEL_16;
    }
  }
  v17 = [*(id *)(a1 + 32) connection];
  v18 = [*(id *)(a1 + 32) configuration];
  v19 = [v18 identifier];
  if (v17) {
    -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:](v17, v19, 0, *(void **)(a1 + 40));
  }

  id v9 = 0;
LABEL_16:
  objc_sync_exit(v7);
}

- (void)loadAppRules
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [a1 configuration];
    v3 = [v2 appVPN];
    id v4 = [v3 appRules];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1C978]);
      [a1 setMailDomains:v6];

      id v7 = objc_alloc_init(MEMORY[0x1E4F1C978]);
      [a1 setCalendarDomains:v7];

      id v8 = objc_alloc_init(MEMORY[0x1E4F1C978]);
      [a1 setContactsDomains:v8];

      id v9 = objc_alloc_init(MEMORY[0x1E4F1C978]);
      [a1 setSafariDomains:v9];

      id v10 = objc_alloc_init(MEMORY[0x1E4F1C978]);
      [a1 setExcludedDomains:v10];

      id v11 = objc_alloc_init(MEMORY[0x1E4F1C978]);
      [a1 setAssociatedDomains:v11];

      id v58 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v59 = a1;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      v12 = [a1 configuration];
      v13 = [v12 appVPN];
      objc_super v14 = [v13 appRules];

      id obj = v14;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v61 objects:v65 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v62;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v62 != v17) {
              objc_enumerationMutation(obj);
            }
            v19 = *(void **)(*((void *)&v61 + 1) + 8 * v18);
            v20 = [v19 matchSigningIdentifier];
            if ([v20 isEqualToString:@"com.apple.mobilemail"]) {
              goto LABEL_13;
            }
            v21 = [v19 matchSigningIdentifier];
            if ([v21 isEqualToString:@"com.apple.email.maild"]) {
              goto LABEL_12;
            }
            v22 = [v19 matchSigningIdentifier];
            if ([v22 isEqualToString:@"com.apple.datausage.dataaccess.activesync"])
            {

LABEL_12:
LABEL_13:

LABEL_14:
              v23 = [v19 matchSigningIdentifier];
              if ([v23 isEqualToString:@"com.apple.mobilemail"])
              {
                v24 = [v19 matchDomains];
                uint64_t v25 = [v24 count];

                if (!v25) {
                  goto LABEL_40;
                }
                v26 = [v19 matchDomains];
                [v59 setMailDomains:v26];
                goto LABEL_17;
              }
LABEL_39:

              goto LABEL_40;
            }
            v27 = [v19 matchSigningIdentifier];
            char v28 = [v27 isEqualToString:@"com.apple.mobilenotes"];

            if (v28) {
              goto LABEL_14;
            }
            id v29 = [v19 matchSigningIdentifier];
            if ([v29 isEqualToString:@"com.apple.mobilecal"]) {
              goto LABEL_22;
            }
            uint64_t v30 = [v19 matchSigningIdentifier];
            if ([v30 isEqualToString:@"com.apple.calaccessd"])
            {

LABEL_22:
LABEL_23:
              v23 = [v19 matchSigningIdentifier];
              if (([v23 isEqualToString:@"com.apple.mobilecal"] & 1) == 0) {
                goto LABEL_39;
              }
              v31 = [v19 matchDomains];
              uint64_t v32 = [v31 count];

              if (v32)
              {
                v26 = [v19 matchDomains];
                [v59 setCalendarDomains:v26];
LABEL_17:

                goto LABEL_40;
              }
              goto LABEL_40;
            }
            v33 = [v19 matchSigningIdentifier];
            char v34 = [v33 isEqualToString:@"com.apple.reminders"];

            if (v34) {
              goto LABEL_23;
            }
            v35 = [v19 matchSigningIdentifier];
            if ([v35 isEqualToString:@"com.apple.MobileAddressBook"])
            {

LABEL_30:
              v23 = [v19 matchSigningIdentifier];
              if (([v23 isEqualToString:@"com.apple.MobileAddressBook"] & 1) == 0) {
                goto LABEL_39;
              }
              v38 = [v19 matchDomains];
              uint64_t v39 = [v38 count];

              if (v39)
              {
                v26 = [v19 matchDomains];
                [v59 setContactsDomains:v26];
                goto LABEL_17;
              }
              goto LABEL_40;
            }
            v36 = [v19 matchSigningIdentifier];
            int v37 = [v36 isEqualToString:@"com.apple.dataaccessd"];

            if (v37) {
              goto LABEL_30;
            }
            v40 = [v19 matchSigningIdentifier];
            if ([v40 isEqualToString:@"com.apple.mobilesafari"])
            {
            }
            else
            {
              v41 = [v19 matchSigningIdentifier];
              int v42 = [v41 isEqualToString:@"com.apple.webapp"];

              if (!v42)
              {
                v45 = [v19 matchSigningIdentifier];
                int v46 = [v45 isEqualToString:@"com.apple.swcd"];

                if (v46)
                {
                  v47 = [v19 matchDomains];
                  uint64_t v48 = [v47 count];

                  if (v48)
                  {
                    v26 = [v19 matchDomains];
                    [v59 setAssociatedDomains:v26];
                    goto LABEL_17;
                  }
                }
                else
                {
                  [v58 addObject:v19];
                }
                goto LABEL_40;
              }
            }
            v23 = [v19 matchSigningIdentifier];
            if (([v23 isEqualToString:@"com.apple.mobilesafari"] & 1) == 0) {
              goto LABEL_39;
            }
            v43 = [v19 matchDomains];
            uint64_t v44 = [v43 count];

            if (v44)
            {
              v26 = [v19 matchDomains];
              [v59 setSafariDomains:v26];
              goto LABEL_17;
            }
LABEL_40:
            ++v18;
          }
          while (v16 != v18);
          uint64_t v49 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
          uint64_t v16 = v49;
        }
        while (v49);
      }

      v50 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v58];
      [v59 setAppRules:v50];

      v51 = [v59 configuration];
      v52 = [v51 appVPN];
      v53 = [v52 excludedDomains];
      uint64_t v54 = [v53 count];

      if (v54)
      {
        v55 = [v59 configuration];
        v56 = [v55 appVPN];
        v57 = [v56 excludedDomains];
        [v59 setExcludedDomains:v57];
      }
    }
  }
}

- (void)additionalSetup
{
  v3 = [(NEVPNManager *)self configuration];
  id v4 = [v3 appVPN];

  uint64_t v5 = [(NEVPNManager *)self configuration];
  id v6 = v5;
  if (v4)
  {
    id v7 = [v5 appVPN];
    id v16 = [v7 protocol];

    id v8 = [(NEVPNManager *)self configuration];
    [v8 appVPN];
  }
  else
  {
    id v9 = [v5 VPN];
    id v16 = [v9 protocol];

    id v8 = [(NEVPNManager *)self configuration];
    [v8 VPN];
  id v10 = };
  uint64_t v11 = [v10 tunnelType];

  if ((unint64_t)(v11 - 1) <= 1)
  {
    v12 = [v16 providerBundleIdentifier];
    self;
    [v16 setProviderBundleIdentifier:v12];
    v13 = [(NEVPNManager *)self configuration];
    if (v13) {
      v13[20] = 0;
    }
  }
  objc_super v14 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v15 = [v14 bundleIdentifier];
  [v16 setPluginType:v15];
}

- (BOOL)isProtocolTypeValid:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (NETunnelProviderManager)init
{
  return [(NETunnelProviderManager *)self initWithSessionType:1 tunnelType:1];
}

- (NETunnelProviderManager)initWithSessionType:(int)a3 tunnelType:(int64_t)a4
{
  id v6 = -[NEVPNConnection initWithType:]([NETunnelProviderSession alloc], a3);
  v21.receiver = self;
  v21.super_class = (Class)NETunnelProviderManager;
  id v7 = [(NEVPNManager *)&v21 initWithGrade:1 connection:v6 tunnelType:a4];

  if (v7)
  {
    *(_WORD *)&v7->super._hasLoaded = 1;
    id v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    mailDomains = v7->_mailDomains;
    v7->_mailDomains = v8;

    id v10 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    calendarDomains = v7->_calendarDomains;
    v7->_calendarDomains = v10;

    v12 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    contactsDomains = v7->_contactsDomains;
    v7->_contactsDomains = v12;

    objc_super v14 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    safariDomains = v7->_safariDomains;
    v7->_safariDomains = v14;

    id v16 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    excludedDomains = v7->_excludedDomains;
    v7->_excludedDomains = v16;

    uint64_t v18 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    associatedDomains = v7->_associatedDomains;
    v7->_associatedDomains = v18;
  }
  return v7;
}

+ (void)loadAllFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  if (v4)
  {
    id v5 = +[NEVPNManager loadedManagers]();
    id v6 = +[NEVPNManager configurationManager]();
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __71__NETunnelProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E59933C0;
    id v9 = a1;
    id v8 = v4;
    [v6 loadConfigurationsWithCompletionQueue:MEMORY[0x1E4F14428] handler:v7];
  }
}

void __71__NETunnelProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v32 = a2;
  id v5 = a3;
  uint64_t v30 = a1;
  id obj = *(id *)(a1 + 40);
  objc_sync_enter(obj);
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  uint64_t v49 = __Block_byref_object_copy__22874;
  v50 = __Block_byref_object_dispose__22875;
  id v6 = v5;
  id v51 = v6;
  id v29 = v6;
  if (v6)
  {
    uint64_t v7 = +[NEVPNManager mapError:]((uint64_t)NEVPNManager, v6);
    id v8 = (void *)v47[5];
    v47[5] = v7;

    uint64_t v9 = v47[5];
  }
  else
  {
    uint64_t v9 = 0;
  }
  if (!v32 || v9 || ![v32 count])
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_35;
  }
  group = dispatch_group_create();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v10 = v32;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v52 count:16];
  if (!v11) {
    goto LABEL_33;
  }
  uint64_t v12 = *(void *)v43;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v43 != v12) {
        objc_enumerationMutation(v10);
      }
      objc_super v14 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      uint64_t v15 = [v14 VPN];
      if (v15) {
        [v14 VPN];
      }
      else {
      id v16 = [v14 appVPN];
      }

      if (v16)
      {
        uint64_t v17 = [v16 protocol];
        if ([(NETunnelProviderManager *)v17 type] == 4)
        {
          BOOL v18 = [v16 tunnelType] == 1;

          if (!v18) {
            goto LABEL_31;
          }
          v19 = [v14 pluginType];
          if (v19)
          {
            if (+[NETunnelProviderProtocol isLegacyPluginType:v19])
            {
              uint64_t v17 = v19;
            }
            else
            {
              v20 = [v14 VPN];
              BOOL v21 = v20 == 0;

              if (v21)
              {
                v22 = [NETunnelProviderManager alloc];
                uint64_t v23 = [v16 tunnelType];
                uint64_t v24 = 2;
              }
              else
              {
                v22 = [NETunnelProviderManager alloc];
                uint64_t v23 = [v16 tunnelType];
                uint64_t v24 = 1;
              }
              uint64_t v17 = [(NETunnelProviderManager *)v22 initWithSessionType:v24 tunnelType:v23];
              [(NEVPNManager *)v17 setConfiguration:v14];
              -[NETunnelProviderManager loadAppRules](v17);
              [v33 addObject:v17];
              uint64_t v25 = +[NEVPNManager loadedManagers]();
              v26 = [v14 identifier];
              [v25 setObject:v17 forKeyedSubscript:v26];

              if (v17) {
                v17->super._hasLoaded = 1;
              }
              dispatch_group_enter(group);
              v27 = [(NEVPNManager *)v17 connection];
              char v28 = [v14 identifier];
              v39[0] = MEMORY[0x1E4F143A8];
              v39[1] = 3221225472;
              v39[2] = __71__NETunnelProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_46;
              v39[3] = &unk_1E5993370;
              v39[4] = v14;
              v41 = &v46;
              v40 = group;
              if (v27) {
                -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:](v27, v28, 0, v39);
              }
            }
          }
          else
          {
            uint64_t v17 = 0;
          }
        }
      }
LABEL_31:
    }
    uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v52 count:16];
  }
  while (v11);
LABEL_33:

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__NETunnelProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_48;
  block[3] = &unk_1E5993398;
  v38 = &v46;
  id v36 = v33;
  id v37 = *(id *)(v30 + 32);
  dispatch_group_notify(group, MEMORY[0x1E4F14428], block);

LABEL_35:
  _Block_object_dispose(&v46, 8);

  objc_sync_exit(obj);
}

void __71__NETunnelProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_46(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 32) identifier];
      int v7 = 138412546;
      id v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "Error creating connection for configuration %@: %@", (uint8_t *)&v7, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __71__NETunnelProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_48(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    [*(id *)(a1 + 32) removeAllObjects];
  }
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

+ (NETunnelProviderManager)forPerAppVPN
{
  v2 = [[NETunnelProviderManager alloc] initWithSessionType:2 tunnelType:1];

  return v2;
}

@end