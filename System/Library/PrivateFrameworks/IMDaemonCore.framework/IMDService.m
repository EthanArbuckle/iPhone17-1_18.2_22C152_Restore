@interface IMDService
- (BOOL)chatsIgnoreLoginStatus;
- (BOOL)clearOneTimeImportAccounts;
- (BOOL)demandsBroadcasting;
- (BOOL)disallowDeactivation;
- (BOOL)fallbackHashIsContentBased;
- (BOOL)groupsMergeDisplayNames;
- (BOOL)handleIDInsensitivityIsCarrierBased;
- (BOOL)ignoresNetworkConnectivity;
- (BOOL)isDiscontinued;
- (BOOL)isIDSBased;
- (BOOL)needsLogin;
- (BOOL)needsPassword;
- (BOOL)requiresHost;
- (BOOL)requiresSingleAccount;
- (BOOL)shouldBeAlwaysLoggedIn;
- (BOOL)shouldCreateActiveAccounts;
- (BOOL)shouldForceAccountsActive;
- (BOOL)shouldForceAccountsConnected;
- (BOOL)supportsAuthorization;
- (BOOL)supportsCapability:(id)a3;
- (BOOL)supportsDatabase;
- (BOOL)supportsMutatingGroupMembers;
- (BOOL)supportsOneSessionForAllAccounts;
- (BOOL)supportsRegistration;
- (BOOL)supportsRelay;
- (BOOL)wantsNullHostReachability;
- (Class)accountClass;
- (Class)sessionClass;
- (IMDService)initWithBundle:(id)a3;
- (NSArray)relayMessageDelegates;
- (NSArray)replicationServices;
- (NSBundle)bundle;
- (NSDictionary)defaultAccountSettings;
- (NSDictionary)serviceDefaults;
- (NSDictionary)serviceDefaultsForSetup;
- (NSDictionary)serviceProperties;
- (NSString)internalName;
- (NSString)serviceDomain;
- (id)_defaultDefaults;
- (id)_oldServiceDomain;
- (id)_serviceDefaultsForDomain:(id)a3;
- (id)_serviceDomain;
- (id)_supportedCapabilities;
- (id)createDiscontinuedAccount;
- (id)description;
- (id)newAccountWithAccountDefaults:(id)a3 accountID:(id)a4;
- (id)oldInternalName;
- (int64_t)protocolVersion;
- (int64_t)replicationSourceID;
- (int64_t)replicationSourceIDForSending;
- (int64_t)transcodeTarget;
- (unint64_t)caseInsensitivityByHandleType;
- (unsigned)idSensitivity;
- (void)_reallyUnloadServiceBundle;
- (void)dealloc;
- (void)delayedSaveSettings;
- (void)loadServiceBundle;
- (void)purgeMemoryCaches;
- (void)saveSettings;
- (void)setServiceProperties:(id)a3;
- (void)systemDidStartBackup;
@end

@implementation IMDService

- (NSDictionary)serviceProperties
{
  return self->_serviceProperties;
}

- (NSDictionary)defaultAccountSettings
{
  accountDefaults = self->_accountDefaults;
  if (accountDefaults)
  {
    v3 = accountDefaults;
    goto LABEL_10;
  }
  v5 = NSString;
  v6 = [(IMDService *)self internalName];
  v7 = [v5 stringWithFormat:@"%@AccountDefaults", v6];

  v8 = [(NSBundle *)self->_bundle pathForResource:v7 ofType:@"plist"];
  if (!v8)
  {
    v10 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
LABEL_7:
    v11 = self->_accountDefaults;
    self->_accountDefaults = v10;

    v9 = self->_accountDefaults;
    if (!v9)
    {
      v12 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
      v13 = self->_accountDefaults;
      self->_accountDefaults = v12;

      v9 = self->_accountDefaults;
    }
    goto LABEL_9;
  }
  v9 = self->_accountDefaults;
  if (!v9)
  {
    v10 = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v8];
    goto LABEL_7;
  }
LABEL_9:
  v3 = v9;

LABEL_10:

  return v3;
}

- (NSDictionary)serviceDefaultsForSetup
{
  if (self->_cachedSetupServiceDefaults)
  {
    v3 = 0;
  }
  else
  {
    v4 = [(IMDService *)self serviceDomain];
    v3 = [(IMDService *)self _serviceDefaultsForDomain:v4];

    [(NSDictionary *)v3 removeObjectForKey:*MEMORY[0x1E4F6C680]];
    [(NSDictionary *)v3 removeObjectForKey:*MEMORY[0x1E4F6C678]];
    [(NSDictionary *)v3 removeObjectForKey:*MEMORY[0x1E4F6C690]];
    [(NSDictionary *)v3 removeObjectForKey:*MEMORY[0x1E4F6C730]];
    if ([(NSDictionary *)v3 count]) {
      v5 = v3;
    }
    else {
      v5 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    cachedSetupServiceDefaults = self->_cachedSetupServiceDefaults;
    self->_cachedSetupServiceDefaults = v5;
  }
  if (self->_cachedSetupServiceDefaults) {
    v7 = self->_cachedSetupServiceDefaults;
  }
  else {
    v7 = v3;
  }
  v8 = v7;

  return v8;
}

- (BOOL)supportsCapability:(id)a3
{
  id v4 = a3;
  v5 = [(IMDService *)self _supportedCapabilities];
  v6 = [v5 objectForKey:v4];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v7 = [v6 BOOLValue];
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)_supportedCapabilities
{
  v2 = [(NSDictionary *)self->_serviceProperties objectForKey:*MEMORY[0x1E4F6E1C8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)groupsMergeDisplayNames
{
  return [(IMDService *)self supportsCapability:*MEMORY[0x1E4F6E048]];
}

- (NSString)internalName
{
  if (![(NSString *)self->_internalName length])
  {
    id v3 = [(IMDService *)self serviceProperties];
    id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F6C058]];
    internalName = self->_internalName;
    self->_internalName = v4;
  }
  v6 = self->_internalName;

  return v6;
}

- (IMDService)initWithBundle:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v14.receiver = self;
    v14.super_class = (Class)IMDService;
    v6 = [(IMDService *)&v14 init];
    char v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_bundle, a3);
      uint64_t v8 = IMServicePropertiesFromIMServiceBundle();
      serviceProperties = v7->_serviceProperties;
      v7->_serviceProperties = (NSDictionary *)v8;

      if (IMOSLoggingEnabled())
      {
        v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v16 = v5;
          _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Loading internal party service with bundle: %@", buf, 0xCu);
        }
      }
      v11 = [MEMORY[0x1E4F6C3E0] sharedInstance];
      [v11 addListener:v7];

      [(IMDService *)v7 synchronizeServiceDefaults];
    }
    self = v7;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F6C3E0] sharedInstance];
  [v3 removeListener:self];

  v4.receiver = self;
  v4.super_class = (Class)IMDService;
  [(IMDService *)&v4 dealloc];
}

- (void)loadServiceBundle
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1D98FE0BC((uint64_t)self);
  }

  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__reallyUnloadServiceBundle object:0];
  p_bundle = (id *)&self->_bundle;
  bundle = self->_bundle;
  if (bundle && (![(NSBundle *)bundle isLoaded] || !self->_sessionClass))
  {
    v6 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1D98FDFD0((uint64_t)self, (id *)&self->_bundle);
    }

    if ([*p_bundle isLoaded])
    {
      id v7 = 0;
      int v8 = 0;
    }
    else
    {
      id v9 = *p_bundle;
      id v22 = 0;
      int v10 = [v9 loadAndReturnError:&v22];
      id v7 = v22;
      int v8 = v10 ^ 1;
    }
    v11 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v21 = @"YES";
      *(_DWORD *)buf = 138412802;
      v24 = self;
      __int16 v25 = 2112;
      if (v8) {
        v21 = @"NO";
      }
      v26 = v21;
      __int16 v27 = 2112;
      id v28 = v7;
      _os_log_debug_impl(&dword_1D967A000, v11, OS_LOG_TYPE_DEBUG, "%@: Load success: %@    (Error: %@)", buf, 0x20u);
    }

    v12 = [(NSDictionary *)self->_serviceProperties objectForKey:*MEMORY[0x1E4F6C0C0]];
    self->_sessionClass = NSClassFromString(v12);

    v13 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1D98FDF24((uint64_t)self, &self->_sessionClass);
    }

    objc_super v14 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_1D98FDE98((uint64_t)self, (uint64_t *)&self->_serviceProperties, v14);
    }

    if (v8)
    {
      v15 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1D98FDE10((uint64_t)self, (uint64_t)v7, v15);
      }

      id v16 = +[IMDAccountController sharedAccountController];
      uint64_t v17 = [v16 activeAccountsForService:self];
      v18 = [v17 arrayByApplyingSelector:sel_accountID];

      if ([v18 count])
      {
        v19 = [MEMORY[0x1E4F6C3B8] registration];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          sub_1D98FDD98((uint64_t)v18, v19);
        }

        v20 = +[IMDAccountController sharedAccountController];
        [v20 deactivateAccounts:v18];
      }
    }
  }
}

- (void)_reallyUnloadServiceBundle
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__reallyUnloadServiceBundle object:0];
  bundle = self->_bundle;
  if (bundle)
  {
    if ([(NSBundle *)bundle isLoaded])
    {
      [(NSBundle *)self->_bundle unload];
      self->_sessionClass = 0;
    }
  }
}

- (id)createDiscontinuedAccount
{
  id v3 = [NSString alloc];
  objc_super v4 = [(IMDService *)self internalName];
  id v5 = (void *)[v3 initWithFormat:@"Discontinued-%@", v4];

  v6 = [IMDAccount alloc];
  id v7 = [(IMDService *)self defaultAccountSettings];
  int v8 = [(IMDAccount *)v6 initWithAccountID:v5 defaults:v7 service:self];

  return v8;
}

- (id)oldInternalName
{
  v2 = [(IMDService *)self serviceProperties];
  id v3 = [v2 objectForKey:*MEMORY[0x1E4F6C090]];

  return v3;
}

- (id)_serviceDomain
{
  int64_t v2 = [(IMDService *)self protocolVersion];
  id v3 = (void **)MEMORY[0x1E4F6C710];
  if (!v2) {
    id v3 = (void **)MEMORY[0x1E4F6C580];
  }
  objc_super v4 = *v3;

  return v4;
}

- (unsigned)idSensitivity
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!self->_idSensitivity)
  {
    id v3 = [(IMDService *)self serviceProperties];
    objc_super v4 = [v3 valueForKey:*MEMORY[0x1E4F6C048]];
    self->_idSensitivity = [v4 intValue];

    if ([(IMDService *)self handleIDInsensitivityIsCarrierBased])
    {
      id v5 = [MEMORY[0x1E4F6E660] IMPhoneNumbersEnabledForMultipleSubscriptionDevice];
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (!v6) {
        goto LABEL_14;
      }
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      LOBYTE(v9) = 1;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          if (v9) {
            int v9 = [MEMORY[0x1E4F6E660] SMSAllowCaseSensitiveSenderIDForPhoneNumber:*(void *)(*((void *)&v13 + 1) + 8 * i)];
          }
          else {
            int v9 = 0;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
      if (!v9) {
        unsigned int v11 = 1;
      }
      else {
LABEL_14:
      }
        unsigned int v11 = 0;
      self->_idSensitivity = v11;
    }
  }
  return self->_idSensitivity;
}

- (unint64_t)caseInsensitivityByHandleType
{
  int64_t v2 = [(IMDService *)self serviceProperties];
  id v3 = [v2 objectForKey:*MEMORY[0x1E4F6E1E8]];
  unint64_t v4 = (int)[v3 intValue];

  return v4;
}

- (NSString)serviceDomain
{
  id v3 = NSString;
  unint64_t v4 = [(IMDService *)self _serviceDomain];
  id v5 = [(IMDService *)self internalName];
  uint64_t v6 = [v3 stringWithFormat:@"%@.%@", v4, v5];

  return (NSString *)v6;
}

- (id)_oldServiceDomain
{
  id v3 = NSString;
  unint64_t v4 = [(IMDService *)self _serviceDomain];
  id v5 = [(IMDService *)self oldInternalName];
  uint64_t v6 = [v3 stringWithFormat:@"%@.%@", v4, v5];

  return v6;
}

- (Class)sessionClass
{
  if (self->_bundle)
  {
    sessionClass = self->_sessionClass;
    if (sessionClass) {
      goto LABEL_6;
    }
    [(IMDService *)self loadServiceBundle];
  }
  sessionClass = self->_sessionClass;
  if (!sessionClass) {
    sessionClass = [(NSBundle *)self->_bundle principalClass];
  }
LABEL_6:

  return sessionClass;
}

- (Class)accountClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isIDSBased
{
  int64_t v2 = [(IMDService *)self serviceProperties];
  id v3 = [v2 objectForKey:*MEMORY[0x1E4F6C040]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)handleIDInsensitivityIsCarrierBased
{
  int64_t v2 = [(IMDService *)self serviceProperties];
  id v3 = [v2 objectForKey:*MEMORY[0x1E4F6E1F0]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isDiscontinued
{
  int64_t v2 = [(IMDService *)self serviceProperties];
  id v3 = [v2 objectForKey:*MEMORY[0x1E4F6E1D8]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)demandsBroadcasting
{
  int64_t v2 = [(IMDService *)self serviceProperties];
  id v3 = [v2 objectForKey:*MEMORY[0x1E4F6E1D0]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)_defaultDefaults
{
  serviceDefaults = self->_serviceDefaults;
  if (!serviceDefaults)
  {
    char v4 = (void *)MEMORY[0x1E016A370]();
    id v5 = [NSString alloc];
    uint64_t v6 = [(IMDService *)self internalName];
    uint64_t v7 = (void *)[v5 initWithFormat:@"%@Defaults", v6];

    uint64_t v8 = [(NSBundle *)self->_bundle pathForResource:v7 ofType:@"plist"];
    if (v8
      && ([MEMORY[0x1E4F28CB8] defaultManager],
          int v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v9 fileExistsAtPath:v8],
          v9,
          v10))
    {
      unsigned int v11 = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v8];
    }
    else
    {
      unsigned int v11 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    }
    v12 = self->_serviceDefaults;
    self->_serviceDefaults = v11;

    serviceDefaults = self->_serviceDefaults;
  }
  long long v13 = serviceDefaults;

  return v13;
}

- (id)_serviceDefaultsForDomain:(id)a3
{
  char v4 = (__CFString *)a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v6 = (void *)MEMORY[0x1E016A370]();
  uint64_t v7 = [(IMDService *)self _defaultDefaults];
  if (v7) {
    [v5 addEntriesFromDictionary:v7];
  }
  CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFArrayRef v10 = CFPreferencesCopyKeyList(v4, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFArrayRef v11 = v10;
  if (v10)
  {
    CFDictionaryRef v12 = CFPreferencesCopyMultiple(v10, v4, v8, v9);
    if ([(__CFDictionary *)v12 count]) {
      [v5 addEntriesFromDictionary:v12];
    }
  }
  CFStringRef v13 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  CFArrayRef v14 = CFPreferencesCopyKeyList(v4, v8, (CFStringRef)*MEMORY[0x1E4F1D3E0]);

  if (v14)
  {
    CFDictionaryRef v15 = CFPreferencesCopyMultiple(v14, v4, v8, v13);
    if ([(__CFDictionary *)v15 count]) {
      [v5 addEntriesFromDictionary:v15];
    }
  }

  return v5;
}

- (NSDictionary)serviceDefaults
{
  if (self->_cachedServiceDefaults)
  {
    id v3 = 0;
  }
  else
  {
    char v4 = [(IMDService *)self serviceDomain];
    id v3 = [(IMDService *)self _serviceDefaultsForDomain:v4];

    if (![(NSDictionary *)v3 count])
    {
      id v5 = [(IMDService *)self _oldServiceDomain];
      uint64_t v6 = [(IMDService *)self _serviceDefaultsForDomain:v5];

      id v3 = (NSDictionary *)v6;
    }
    if ([(NSDictionary *)v3 count]) {
      uint64_t v7 = v3;
    }
    else {
      uint64_t v7 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    cachedServiceDefaults = self->_cachedServiceDefaults;
    self->_cachedServiceDefaults = v7;
  }
  if (self->_cachedServiceDefaults) {
    CFStringRef v9 = self->_cachedServiceDefaults;
  }
  else {
    CFStringRef v9 = v3;
  }
  CFArrayRef v10 = v9;

  return v10;
}

- (BOOL)clearOneTimeImportAccounts
{
  if (self->_blockPrefWriting) {
    return 0;
  }
  CFStringRef v3 = [(IMDService *)self serviceDomain];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F6C688];
  id v5 = (void *)CFPreferencesCopyAppValue((CFStringRef)*MEMORY[0x1E4F6C688], v3);
  BOOL v2 = v5 != 0;
  if (v5)
  {
    CFPreferencesSetAppValue(v4, 0, v3);
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFPreferencesSynchronize(v3, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    CFPreferencesSynchronize(v3, v6, (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    _CFPreferencesFlushCachesForIdentifier();
  }

  return v2;
}

- (void)delayedSaveSettings
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_saveSettings object:0];
  if (!self->_blockPrefWriting)
  {
    [(IMDService *)self performSelector:sel_saveSettings withObject:0 afterDelay:5.0];
  }
}

- (void)saveSettings
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_saveSettings object:0];
  if (!self->_blockPrefWriting)
  {
    context = (void *)MEMORY[0x1E016A370](v3);
    id v50 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id value = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    CFStringRef v4 = +[IMDAccountController sharedAccountController];
    v47 = self;
    id v5 = [v4 accountsForService:self];

    id obj = v5;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v59 objects:v64 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v60;
      uint64_t v49 = *(void *)v60;
      do
      {
        uint64_t v9 = 0;
        uint64_t v51 = v7;
        do
        {
          if (*(void *)v60 != v8) {
            objc_enumerationMutation(obj);
          }
          CFArrayRef v10 = *(void **)(*((void *)&v59 + 1) + 8 * v9);
          char v11 = [v10 isManaged];
          CFDictionaryRef v12 = [v10 accountDefaults];
          CFStringRef v13 = (void *)[v12 mutableCopy];

          CFArrayRef v14 = [v10 accountID];
          if ((v11 & 1) == 0 && v13)
          {
            long long v57 = 0u;
            long long v58 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            CFDictionaryRef v15 = [v13 allKeys];
            uint64_t v16 = [v15 countByEnumeratingWithState:&v55 objects:v63 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v56;
              do
              {
                for (uint64_t i = 0; i != v17; ++i)
                {
                  if (*(void *)v56 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v20 = *(void *)(*((void *)&v55 + 1) + 8 * i);
                  v21 = [v13 objectForKey:v20];
                  if (([v21 isNull] & 1) != 0
                    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ![v21 length])
                  {
                    [v13 removeObjectForKey:v20];
                  }
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v55 objects:v63 count:16];
              }
              while (v17);
            }

            [v50 setObject:v13 forKey:v14];
            uint64_t v8 = v49;
            uint64_t v7 = v51;
          }

          ++v9;
        }
        while (v9 != v7);
        uint64_t v7 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
      }
      while (v7);
    }

    id v22 = +[IMDAccountController sharedAccountController];
    v23 = [v22 activeAccountsForService:v47];

    CFStringRef v24 = [(IMDService *)v47 serviceDomain];
    id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v23) {
      [v23 arrayByApplyingSelector:sel_accountID];
    }
    else {
    v26 = [MEMORY[0x1E4F1C978] array];
    }
    [v25 setObject:v26 forKey:*MEMORY[0x1E4F6C690]];

    if (![(IMDService *)v47 isIDSBased]) {
      [v25 setObject:v50 forKey:*MEMORY[0x1E4F6C680]];
    }
    __int16 v27 = +[IMDAccountController sharedAccountController];
    id v28 = [v27 connectedAccountsForService:v47];

    uint64_t v29 = +[IMDAccountController sharedAccountController];
    v30 = [v29 connectingAccountsForService:v47];

    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v28 count]) {
      [v31 addObjectsFromArray:v28];
    }
    if ([v30 count]) {
      [v31 addObjectsFromArray:v30];
    }
    v52 = v28;
    id obja = v23;
    v32 = [v31 arrayByApplyingSelector:sel_accountID];
    [v25 setObject:v32 forKey:*MEMORY[0x1E4F6C730]];

    uint64_t v33 = *MEMORY[0x1E4F6BFD8];
    uint64_t v34 = [(NSDictionary *)v47->_serviceProperties objectForKey:*MEMORY[0x1E4F6BFD8]];
    if (v34)
    {
      v35 = (void *)v34;
      v36 = [(NSDictionary *)v47->_serviceProperties objectForKey:v33];
      int v37 = [v36 intValue];

      CFStringRef v38 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
      CFStringRef v39 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
      CFStringRef v40 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
      CFStringRef v41 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
      if (v37)
      {
LABEL_37:
        CFPreferencesSetMultiple((CFDictionaryRef)v25, 0, v24, v38, v41);
        uint64_t v42 = *MEMORY[0x1E4F6C678];
        CFPreferencesSetValue((CFStringRef)*MEMORY[0x1E4F6C678], value, v24, v38, v39);
        CFPreferencesSynchronize(v24, v38, v39);
        CFPreferencesSynchronize(v24, v38, v40);
        [v25 setObject:value forKey:v42];
        v43 = +[IMDBroadcastController sharedProvider];
        v44 = [v43 broadcasterForListenersSupportingService:v47];
        v45 = [(IMDService *)v47 internalName];
        [v44 defaultsChanged:v25 forService:v45];

        [(IMDService *)v47 purgeMemoryCaches];
        return;
      }
    }
    else
    {
      CFStringRef v38 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
      CFStringRef v39 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
      CFStringRef v40 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
    }
    CFStringRef v41 = v40;
    goto LABEL_37;
  }
}

- (id)newAccountWithAccountDefaults:(id)a3 accountID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[IMDAccount alloc] initWithAccountID:v6 defaults:v7 service:self];

  return v8;
}

- (BOOL)disallowDeactivation
{
  uint64_t v3 = *MEMORY[0x1E4F6C028];
  CFStringRef v4 = [(NSDictionary *)self->_serviceProperties objectForKey:*MEMORY[0x1E4F6C028]];
  if (v4)
  {
    id v5 = [(NSDictionary *)self->_serviceProperties objectForKey:v3];
    BOOL v6 = [v5 intValue] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)supportsDatabase
{
  return [(IMDService *)self supportsCapability:*MEMORY[0x1E4F6E000]];
}

- (BOOL)supportsRegistration
{
  return [(IMDService *)self supportsCapability:*MEMORY[0x1E4F6E0D0]];
}

- (BOOL)supportsRelay
{
  return [(IMDService *)self supportsCapability:*MEMORY[0x1E4F6E0D8]];
}

- (BOOL)supportsAuthorization
{
  return [(IMDService *)self supportsCapability:*MEMORY[0x1E4F6DFE0]];
}

- (BOOL)ignoresNetworkConnectivity
{
  uint64_t v3 = *MEMORY[0x1E4F6C050];
  CFStringRef v4 = [(NSDictionary *)self->_serviceProperties objectForKey:*MEMORY[0x1E4F6C050]];
  if (v4)
  {
    id v5 = [(NSDictionary *)self->_serviceProperties objectForKey:v3];
    BOOL v6 = [v5 intValue] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)wantsNullHostReachability
{
  uint64_t v3 = *MEMORY[0x1E4F6C0F0];
  CFStringRef v4 = [(NSDictionary *)self->_serviceProperties objectForKey:*MEMORY[0x1E4F6C0F0]];
  if (v4)
  {
    id v5 = [(NSDictionary *)self->_serviceProperties objectForKey:v3];
    BOOL v6 = [v5 intValue] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)shouldCreateActiveAccounts
{
  uint64_t v3 = *MEMORY[0x1E4F6C000];
  CFStringRef v4 = [(NSDictionary *)self->_serviceProperties objectForKey:*MEMORY[0x1E4F6C000]];
  if (v4)
  {
    id v5 = [(NSDictionary *)self->_serviceProperties objectForKey:v3];
    BOOL v6 = [v5 intValue] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)shouldForceAccountsActive
{
  uint64_t v3 = *MEMORY[0x1E4F6BFC8];
  CFStringRef v4 = [(NSDictionary *)self->_serviceProperties objectForKey:*MEMORY[0x1E4F6BFC8]];
  if (v4)
  {
    id v5 = [(NSDictionary *)self->_serviceProperties objectForKey:v3];
    BOOL v6 = [v5 intValue] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)shouldForceAccountsConnected
{
  uint64_t v3 = *MEMORY[0x1E4F6BFD0];
  CFStringRef v4 = [(NSDictionary *)self->_serviceProperties objectForKey:*MEMORY[0x1E4F6BFD0]];
  if (v4)
  {
    id v5 = [(NSDictionary *)self->_serviceProperties objectForKey:v3];
    BOOL v6 = [v5 intValue] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)needsLogin
{
  uint64_t v3 = *MEMORY[0x1E4F6C070];
  CFStringRef v4 = [(NSDictionary *)self->_serviceProperties objectForKey:*MEMORY[0x1E4F6C070]];
  if (v4)
  {
    id v5 = [(NSDictionary *)self->_serviceProperties objectForKey:v3];
    BOOL v6 = [v5 intValue] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)needsPassword
{
  uint64_t v3 = *MEMORY[0x1E4F6C098];
  CFStringRef v4 = [(NSDictionary *)self->_serviceProperties objectForKey:*MEMORY[0x1E4F6C098]];
  if (v4)
  {
    id v5 = [(NSDictionary *)self->_serviceProperties objectForKey:v3];
    BOOL v6 = [v5 intValue] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)shouldBeAlwaysLoggedIn
{
  uint64_t v3 = *MEMORY[0x1E4F6BFD0];
  CFStringRef v4 = [(NSDictionary *)self->_serviceProperties objectForKey:*MEMORY[0x1E4F6BFD0]];
  if (v4)
  {
    id v5 = [(NSDictionary *)self->_serviceProperties objectForKey:v3];
    BOOL v6 = [v5 intValue] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)requiresHost
{
  uint64_t v3 = *MEMORY[0x1E4F6C0B0];
  CFStringRef v4 = [(NSDictionary *)self->_serviceProperties objectForKey:*MEMORY[0x1E4F6C0B0]];
  if (v4)
  {
    id v5 = [(NSDictionary *)self->_serviceProperties objectForKey:v3];
    BOOL v6 = [v5 intValue] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)chatsIgnoreLoginStatus
{
  uint64_t v3 = *MEMORY[0x1E4F6C6F0];
  CFStringRef v4 = [(NSDictionary *)self->_serviceProperties objectForKey:*MEMORY[0x1E4F6C6F0]];
  if (v4)
  {
    id v5 = [(NSDictionary *)self->_serviceProperties objectForKey:v3];
    BOOL v6 = [v5 intValue] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)supportsOneSessionForAllAccounts
{
  return [(IMDService *)self supportsCapability:*MEMORY[0x1E4F6E0B0]];
}

- (int64_t)protocolVersion
{
  uint64_t v3 = *MEMORY[0x1E4F6C0A0];
  CFStringRef v4 = [(NSDictionary *)self->_serviceProperties objectForKey:*MEMORY[0x1E4F6C0A0]];
  if (v4)
  {
    id v5 = [(NSDictionary *)self->_serviceProperties objectForKey:v3];
    int64_t v6 = (int)[v5 intValue];
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (BOOL)requiresSingleAccount
{
  uint64_t v3 = *MEMORY[0x1E4F6C0D8];
  CFStringRef v4 = [(NSDictionary *)self->_serviceProperties objectForKey:*MEMORY[0x1E4F6C0D8]];
  if (v4)
  {
    id v5 = [(NSDictionary *)self->_serviceProperties objectForKey:v3];
    BOOL v6 = [v5 intValue] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (int64_t)replicationSourceID
{
  uint64_t v3 = *MEMORY[0x1E4F6E230];
  CFStringRef v4 = [(NSDictionary *)self->_serviceProperties objectForKey:*MEMORY[0x1E4F6E230]];
  if (v4)
  {
    id v5 = [(NSDictionary *)self->_serviceProperties objectForKey:v3];
    int64_t v6 = (int)[v5 intValue];
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (int64_t)replicationSourceIDForSending
{
  uint64_t v3 = *MEMORY[0x1E4F6E238];
  CFStringRef v4 = [(NSDictionary *)self->_serviceProperties objectForKey:*MEMORY[0x1E4F6E238]];
  if (v4)
  {
    id v5 = [(NSDictionary *)self->_serviceProperties objectForKey:v3];
    int v6 = [v5 intValue];
    if (v6) {
      int64_t v7 = v6;
    }
    else {
      int64_t v7 = [(IMDService *)self replicationSourceID];
    }
  }
  else
  {
    int64_t v7 = [(IMDService *)self replicationSourceID];
  }

  return v7;
}

- (NSArray)replicationServices
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isReplicationEnabled];

  if (v4)
  {
    id v5 = [(IMDService *)self serviceProperties];
    int v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F6E228]];

    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          CFArrayRef v14 = +[IMDServiceController sharedController];
          CFDictionaryRef v15 = [v14 serviceWithName:v13];

          if (v15) {
            [v7 addObject:v15];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v7;
}

- (int64_t)transcodeTarget
{
  uint64_t v3 = [(NSDictionary *)self->_serviceProperties objectForKey:@"TranscodeTarget"];
  if (v3)
  {
    int v4 = [(NSDictionary *)self->_serviceProperties objectForKey:@"TranscodeTarget"];
    int64_t v5 = (int)[v4 intValue];
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (NSArray)relayMessageDelegates
{
  BOOL v2 = [(IMDService *)self serviceProperties];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F6E220]];

  return (NSArray *)v3;
}

- (BOOL)fallbackHashIsContentBased
{
  BOOL v2 = [(IMDService *)self serviceProperties];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F6E1E0]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)purgeMemoryCaches
{
  cachedServiceDefaults = self->_cachedServiceDefaults;
  self->_cachedServiceDefaults = 0;

  cachedSetupServiceDefaults = self->_cachedSetupServiceDefaults;
  self->_cachedSetupServiceDefaults = 0;
}

- (id)description
{
  BOOL v2 = NSString;
  uint64_t v3 = [(IMDService *)self internalName];
  char v4 = [v2 stringWithFormat:@"IMDService (%@)", v3];

  return v4;
}

- (void)systemDidStartBackup
{
  self->_blockPrefWriting = 1;
}

- (BOOL)supportsMutatingGroupMembers
{
  return [(IMDService *)self supportsCapability:*MEMORY[0x1E4F6E090]];
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setServiceProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSetupServiceDefaults, 0);
  objc_storeStrong((id *)&self->_cachedServiceDefaults, 0);
  objc_storeStrong((id *)&self->_serviceProperties, 0);
  objc_storeStrong((id *)&self->_serviceDefaults, 0);
  objc_storeStrong((id *)&self->_accountDefaults, 0);
  objc_storeStrong((id *)&self->_internalName, 0);

  objc_storeStrong((id *)&self->_bundle, 0);
}

@end