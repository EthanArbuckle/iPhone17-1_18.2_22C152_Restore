@interface AppleEthernetConfigurator
- (AppleEthernetConfigurator)initWithInterface:(id)a3;
- (AppleEthernetInterface)interface;
- (BOOL)getPrivateRelayDisabledForService:(__SCNetworkService *)a3;
- (BOOL)setNotificationKeys;
- (BOOL)setPrivateRelayDisabledForService:(__SCNetworkService *)a3 withPrivateRelayDisabled:(BOOL)a4;
- (BOOL)updatePreferencesForService:(__SCNetworkService *)a3 withConfig:(id)a4;
- (NSArray)configurators;
- (OS_dispatch_queue)queue;
- (SettingsDelegate)settingsDelegate;
- (WFNetworkSettingsConfig)previousState;
- (__SCDynamicStore)dynamicStore;
- (__SCNetworkService)findServiceForInterface:(id)a3;
- (__SCPreferences)preferences;
- (id)currentConfig;
- (id)getDynamicSettingsForKey:(__CFString *)a3 inService:(__SCNetworkService *)a4;
- (id)getManualSettingsForKey:(__CFString *)a3 inService:(__SCNetworkService *)a4;
- (id)getPersistentSettingsForKey:(__CFString *)a3 inService:(__SCNetworkService *)a4;
- (id)getSettingsForKey:(__CFString *)a3 inService:(__SCNetworkService *)a4 withManualMode:(BOOL)a5;
- (int)commitAndApplyChangesToPreferences;
- (int)lockPreferences;
- (int)unlockPreferences;
- (void)dealloc;
- (void)renewLease;
- (void)saveConfig:(id)a3;
- (void)setConfigurators:(id)a3;
- (void)setDynamicStore:(__SCDynamicStore *)a3;
- (void)setInterface:(id)a3;
- (void)setPreferences:(__SCPreferences *)a3;
- (void)setPreviousState:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSettingsDelegate:(id)a3;
@end

@implementation AppleEthernetConfigurator

- (AppleEthernetConfigurator)initWithInterface:(id)a3
{
  id v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)AppleEthernetConfigurator;
  v6 = [(AppleEthernetConfigurator *)&v37 init];
  if (!v6) {
    goto LABEL_16;
  }
  v7 = objc_alloc_init(AppleEthernetIPv4Configurator);
  v8 = objc_alloc_init(AppleEthernetIPv6Configurator);
  v9 = objc_alloc_init(AppleEthernetDNSConfigurator);
  v10 = objc_alloc_init(AppleEthernetProxyConfigurator);
  v11 = objc_alloc_init(AppleEthernetPrivateRelayConfigurator);
  uint64_t v12 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v7, v8, v9, v10, v11, 0);
  configurators = v6->_configurators;
  v6->_configurators = (NSArray *)v12;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v14 = v6->_configurators;
  id v15 = [(NSArray *)v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v34;
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v33 + 1) + 8 * (void)v18) setDelegate:v6];
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [(NSArray *)v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v16);
  }

  objc_storeStrong((id *)&v6->_interface, a3);
  previousState = v6->_previousState;
  v6->_previousState = 0;

  id v20 = [v5 BSDName];
  dispatch_queue_t v21 = dispatch_queue_create((const char *)[v20 UTF8String], 0);
  queue = v6->_queue;
  v6->_queue = (OS_dispatch_queue *)v21;

  v23 = v6->_queue;
  if (!v23
    || (v24 = v6,
        dispatch_set_context(v23, v24),
        +[NSString stringWithFormat:@"%s-%@", getprogname(), @"AppleEthernetController"], (CFStringRef v25 = (const __CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_16:
    v29 = 0;
LABEL_17:

    v24 = 0;
    goto LABEL_18;
  }
  v26 = (__CFString *)v25;
  SCPreferencesRef v27 = SCPreferencesCreateWithAuthorization(kCFAllocatorDefault, v25, 0, 0);
  v24->_preferences = v27;
  if (!v27)
  {
    v29 = v26;
    goto LABEL_17;
  }
  v28 = [(AppleEthernetInterface *)v6->_interface BSDName];
  v29 = +[NSString stringWithFormat:@"%@-%@", @"AppleEthernetConfigurator", v28];

  if (!v29) {
    goto LABEL_17;
  }
  memset(&context, 0, sizeof(context));
  context.info = v6->_queue;
  SCDynamicStoreRef v30 = SCDynamicStoreCreate(kCFAllocatorDefault, v29, (SCDynamicStoreCallBack)sub_1CD4, &context);
  v24->_dynamicStore = v30;
  if (!v30 || ![(AppleEthernetConfigurator *)v24 setNotificationKeys]) {
    goto LABEL_17;
  }
  SCDynamicStoreSetDispatchQueue(v24->_dynamicStore, (dispatch_queue_t)v6->_queue);
LABEL_18:

  return v24;
}

- (void)dealloc
{
  preferences = self->_preferences;
  if (preferences) {
    CFRelease(preferences);
  }
  self->_preferences = 0;
  SCDynamicStoreSetDispatchQueue(self->_dynamicStore, 0);
  dynamicStore = self->_dynamicStore;
  if (dynamicStore) {
    CFRelease(dynamicStore);
  }
  self->_dynamicStore = 0;
  v5.receiver = self;
  v5.super_class = (Class)AppleEthernetConfigurator;
  [(AppleEthernetConfigurator *)&v5 dealloc];
}

- (BOOL)setNotificationKeys
{
  v3 = +[NSMutableArray array];
  if ([(AppleEthernetConfigurator *)self lockPreferences]) {
    goto LABEL_16;
  }
  v4 = [(AppleEthernetConfigurator *)self findServiceForInterface:self->_interface];
  if (!v4)
  {
    [(AppleEthernetConfigurator *)self unlockPreferences];
LABEL_16:
    BOOL v17 = 0;
    goto LABEL_14;
  }
  objc_super v5 = v4;
  CFStringRef ServiceID = SCNetworkServiceGetServiceID(v4);
  if (!ServiceID)
  {
    id v20 = 0;
    NetworkServiceEntity = 0;
    v8 = 0;
    v10 = 0;
    v11 = 0;
    uint64_t v12 = 0;
    BOOL v17 = 0;
    goto LABEL_13;
  }
  CFStringRef v7 = ServiceID;
  v19 = v5;
  v8 = (__CFString *)SCDynamicStoreKeyCreate(kCFAllocatorDefault, kSCDynamicStoreDomainSetup);
  if (!v8)
  {
    id v20 = 0;
    NetworkServiceEntity = 0;
    goto LABEL_20;
  }
  [v3 addObject:v8];
  NetworkServiceEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v7, kSCEntNetIPv4);
  id v20 = v8;
  if (!NetworkServiceEntity)
  {
    v8 = 0;
    goto LABEL_20;
  }
  [v3 addObject:NetworkServiceEntity];
  v8 = (__CFString *)SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v7, kSCEntNetIPv6);
  if (!v8)
  {
LABEL_20:
    v10 = 0;
    goto LABEL_21;
  }
  [v3 addObject:v8];
  v10 = (__CFString *)SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v7, kSCEntNetDHCP);
  if (!v10)
  {
LABEL_21:
    v11 = 0;
    goto LABEL_22;
  }
  [v3 addObject:v10];
  v11 = (__CFString *)SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v7, kSCEntNetDNS);
  if (!v11)
  {
LABEL_22:
    uint64_t v12 = 0;
LABEL_23:
    BOOL v17 = 0;
    goto LABEL_12;
  }
  [v3 addObject:v11];
  uint64_t v12 = (__CFString *)SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v7, kSCEntNetProxies);
  if (!v12) {
    goto LABEL_23;
  }
  [v3 addObject:v12];
  CFStringRef v13 = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainSetup, v7, kSCCompAnyRegex);
  if (!v13) {
    goto LABEL_23;
  }
  v14 = (__CFString *)v13;
  dynamicStore = self->_dynamicStore;
  CFStringRef v21 = v13;
  CFArrayRef v16 = +[NSArray arrayWithObjects:&v21 count:1];
  BOOL v17 = SCDynamicStoreSetNotificationKeys(dynamicStore, (CFArrayRef)v3, v16) != 0;

LABEL_12:
  objc_super v5 = v19;
LABEL_13:
  [(AppleEthernetConfigurator *)self unlockPreferences];
  CFRelease(v5);

LABEL_14:
  return v17;
}

- (id)currentConfig
{
  v3 = objc_alloc_init(AppleEthernetSettingsConfig);
  v4 = [(AppleEthernetInterface *)self->_interface displayName];
  [(AppleEthernetSettingsConfig *)v3 setSsid:v4];

  if (![(AppleEthernetConfigurator *)self lockPreferences])
  {
    objc_super v5 = [(AppleEthernetConfigurator *)self findServiceForInterface:self->_interface];
    if (v5)
    {
      v6 = v5;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      CFStringRef v7 = self->_configurators;
      id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "setValuesForConfig:fromService:", v3, v6, (void)v13);
          }
          id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v9);
      }

      [(AppleEthernetConfigurator *)self unlockPreferences];
      CFRelease(v6);
    }
    else
    {
      [(AppleEthernetConfigurator *)self unlockPreferences];
    }
  }
  objc_storeStrong((id *)&self->_previousState, v3);

  return v3;
}

- (void)renewLease
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2288;
  block[3] = &unk_C498;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)saveConfig:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_23B4;
  v7[3] = &unk_C4C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (BOOL)updatePreferencesForService:(__SCNetworkService *)a3 withConfig:(id)a4
{
  id v6 = a4;
  CFStringRef v7 = v6;
  BOOL v8 = 0;
  if (a3 && v6)
  {
    if (self->_previousState
      || (id v9 = objc_alloc_init(AppleEthernetSettingsConfig),
          previousState = self->_previousState,
          self->_previousState = (WFNetworkSettingsConfig *)v9,
          previousState,
          self->_previousState))
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      v11 = self->_configurators;
      id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v18;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v18 != v14) {
              objc_enumerationMutation(v11);
            }
            objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "updateSettingsFromCurrentConfig:toNewConfig:forService:", self->_previousState, v7, a3, (void)v17);
          }
          id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v13);
      }

      BOOL v8 = 1;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)getPersistentSettingsForKey:(__CFString *)a3 inService:(__SCNetworkService *)a4
{
  id v4 = SCNetworkServiceCopyProtocol(a4, a3);
  if (v4)
  {
    objc_super v5 = v4;
    id v6 = SCNetworkProtocolGetConfiguration(v4);
    CFRelease(v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)getDynamicSettingsForKey:(__CFString *)a3 inService:(__SCNetworkService *)a4
{
  return [(AppleEthernetConfigurator *)self getSettingsForKey:a3 inService:a4 withManualMode:0];
}

- (id)getManualSettingsForKey:(__CFString *)a3 inService:(__SCNetworkService *)a4
{
  return [(AppleEthernetConfigurator *)self getSettingsForKey:a3 inService:a4 withManualMode:1];
}

- (id)getSettingsForKey:(__CFString *)a3 inService:(__SCNetworkService *)a4 withManualMode:(BOOL)a5
{
  BOOL v5 = a5;
  SCNetworkProtocolRef v9 = SCNetworkServiceCopyProtocol(a4, a3);
  if (v9)
  {
    SCNetworkProtocolRef v10 = v9;
    CFStringRef ServiceID = SCNetworkServiceGetServiceID(a4);
    if (!ServiceID) {
      goto LABEL_11;
    }
    id v12 = (CFStringRef *)&kSCDynamicStoreDomainState;
    if (v5) {
      id v12 = (CFStringRef *)&kSCDynamicStoreDomainSetup;
    }
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, *v12, ServiceID, a3);
    if (NetworkServiceEntity)
    {
      CFStringRef v14 = NetworkServiceEntity;
      long long v15 = (void *)SCDynamicStoreCopyValue(self->_dynamicStore, NetworkServiceEntity);
      CFRelease(v10);
      SCNetworkProtocolRef v10 = (SCNetworkProtocolRef)v14;
    }
    else
    {
LABEL_11:
      long long v15 = 0;
    }
    CFRelease(v10);
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

- (BOOL)getPrivateRelayDisabledForService:(__SCNetworkService *)a3
{
  SCNetworkInterfaceRef Interface = SCNetworkServiceGetInterface(a3);
  if (Interface) {
    LOBYTE(Interface) = SCNetworkInterfaceGetDisablePrivateRelay() != 0;
  }
  return (char)Interface;
}

- (BOOL)setPrivateRelayDisabledForService:(__SCNetworkService *)a3 withPrivateRelayDisabled:(BOOL)a4
{
  SCNetworkInterfaceRef Interface = SCNetworkServiceGetInterface(a3);
  if (Interface) {
    LOBYTE(Interface) = SCNetworkInterfaceSetDisablePrivateRelay() != 0;
  }
  return (char)Interface;
}

- (int)lockPreferences
{
  if (SCPreferencesLock(self->_preferences, 1u)) {
    return 0;
  }
  SCPreferencesSynchronize(self->_preferences);
  if (SCPreferencesLock(self->_preferences, 1u)) {
    return 0;
  }

  return SCError();
}

- (int)unlockPreferences
{
  if (SCPreferencesUnlock(self->_preferences)) {
    return 0;
  }

  return SCError();
}

- (int)commitAndApplyChangesToPreferences
{
  if (SCPreferencesCommitChanges(self->_preferences) && SCPreferencesApplyChanges(self->_preferences)) {
    return 0;
  }

  return SCError();
}

- (__SCNetworkService)findServiceForInterface:(id)a3
{
  id v4 = a3;
  if (v4 && (BOOL v5 = SCNetworkSetCopyCurrent(self->_preferences)) != 0)
  {
    id v6 = v5;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    CFArrayRef v7 = SCNetworkSetCopyServices(v5);
    id v8 = [(__CFArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      id v9 = v8;
      SCNetworkProtocolRef v10 = 0;
      uint64_t v11 = *(void *)v21;
LABEL_5:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = (const __SCNetworkService *)*(id *)(*((void *)&v20 + 1) + 8 * v12);
        SCNetworkInterfaceRef Interface = SCNetworkServiceGetInterface(v13);
        if (Interface)
        {
          uint64_t v15 = SCNetworkInterfaceGetBSDName(Interface);

          if (!v15)
          {
            SCNetworkProtocolRef v10 = 0;
            if (!v13) {
              goto LABEL_13;
            }
LABEL_12:
            CFRelease(v13);
            goto LABEL_13;
          }
          long long v16 = objc_msgSend(v4, "BSDName", (void)v20);
          unsigned __int8 v17 = [v16 isEqualToString:v15];

          SCNetworkProtocolRef v10 = (void *)v15;
          if (v17)
          {
            SCNetworkProtocolRef v10 = (void *)v15;
            goto LABEL_21;
          }
        }
        if (v13) {
          goto LABEL_12;
        }
LABEL_13:
        if (v9 == (id)++v12)
        {
          id v18 = [(__CFArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
          id v9 = v18;
          if (!v18)
          {
            id v13 = 0;
            goto LABEL_21;
          }
          goto LABEL_5;
        }
      }
    }
    id v13 = 0;
    SCNetworkProtocolRef v10 = 0;
LABEL_21:

    CFRelease(v6);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (SettingsDelegate)settingsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsDelegate);

  return (SettingsDelegate *)WeakRetained;
}

- (void)setSettingsDelegate:(id)a3
{
}

- (__SCPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(__SCPreferences *)a3
{
  self->_preferences = a3;
}

- (__SCDynamicStore)dynamicStore
{
  return self->_dynamicStore;
}

- (void)setDynamicStore:(__SCDynamicStore *)a3
{
  self->_dynamicStore = a3;
}

- (NSArray)configurators
{
  return self->_configurators;
}

- (void)setConfigurators:(id)a3
{
}

- (AppleEthernetInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (WFNetworkSettingsConfig)previousState
{
  return self->_previousState;
}

- (void)setPreviousState:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_previousState, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_configurators, 0);

  objc_destroyWeak((id *)&self->_settingsDelegate);
}

@end