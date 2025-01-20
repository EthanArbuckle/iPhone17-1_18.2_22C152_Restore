@interface IMDServiceController
+ (IMDServiceController)sharedController;
- (BOOL)_bundleAllowedToLoadWithProperties:(id)a3;
- (IMDServiceController)init;
- (NSArray)allServices;
- (NSMutableDictionary)serviceCapabilityCache;
- (NSMutableDictionary)serviceNameCapabilityCache;
- (NSMutableDictionary)services;
- (id)serviceNamesSupportingCapability:(id)a3;
- (id)serviceWithName:(id)a3;
- (id)serviceWithReplicationSourceID:(int64_t)a3;
- (id)servicesSupportingCapability:(id)a3;
- (void)registerSessionClassWithBundle:(id)a3;
- (void)setServiceCapabilityCache:(id)a3;
- (void)setServiceNameCapabilityCache:(id)a3;
- (void)setServices:(id)a3;
@end

@implementation IMDServiceController

- (id)serviceWithName:(id)a3
{
  if (a3)
  {
    services = self->_services;
    v4 = [a3 lowercaseString];
    v5 = [(NSMutableDictionary *)services objectForKeyedSubscript:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (IMDServiceController)sharedController
{
  if (qword_1EBE2BC20 != -1) {
    dispatch_once(&qword_1EBE2BC20, &unk_1F3391300);
  }
  v2 = (void *)qword_1EBE2BC08;

  return (IMDServiceController *)v2;
}

- (id)serviceNamesSupportingCapability:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_serviceNameCapabilityCache objectForKey:v4];
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    v7 = [(IMDServiceController *)self servicesSupportingCapability:v4];
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "internalName", (void)v17);
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    v15 = (void *)[v8 copy];
    [(NSMutableDictionary *)self->_serviceNameCapabilityCache setObject:v15 forKey:v4];
    id v6 = v15;
  }

  return v6;
}

- (id)servicesSupportingCapability:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_serviceCapabilityCache objectForKey:v4];
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    services = self->_services;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = sub_1D968A278;
    v16 = &unk_1E6B75CD8;
    id v9 = v4;
    id v17 = v9;
    id v18 = v7;
    id v10 = v7;
    [(NSMutableDictionary *)services enumerateKeysAndObjectsUsingBlock:&v13];
    uint64_t v11 = objc_msgSend(v10, "copy", v13, v14, v15, v16);
    [(NSMutableDictionary *)self->_serviceCapabilityCache setObject:v11 forKey:v9];
    id v6 = v11;
  }

  return v6;
}

- (NSArray)allServices
{
  return (NSArray *)[(NSMutableDictionary *)self->_services allValues];
}

- (IMDServiceController)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMDServiceController;
  v2 = [(IMDServiceController *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    services = v2->_services;
    v2->_services = v3;
  }
  return v2;
}

- (BOOL)_bundleAllowedToLoadWithProperties:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F6C058]];
  v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isMessagesAppDeletionEnabled];

  if (!v6
    || ([MEMORY[0x1E4F6E730] isMessagesInstalled] & 1) != 0
    || ([v3 objectForKeyedSubscript:*MEMORY[0x1E4F6E1C0]],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 BOOLValue],
        v7,
        (v8 & 1) != 0))
  {
    BOOL v9 = 1;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        uint64_t v13 = v4;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "=> Skip loading this service, we don't allow it when Messages is uninstalled: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (void)registerSessionClassWithBundle:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1C9E8];
  int v6 = [v4 pathForResource:@"ServiceProperties" ofType:@"plist"];
  id v7 = [v5 dictionaryWithContentsOfFile:v6];

  if ([(IMDServiceController *)self _bundleAllowedToLoadWithProperties:v7])
  {
    char v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F6C058]];
    BOOL v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F6C0E0]];
    id v10 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F6C040]];
    int v11 = [v10 BOOLValue];

    if (IMOSLoggingEnabled())
    {
      int v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v23 = 138412290;
        id v24 = v4;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Registering bundle: %@", (uint8_t *)&v23, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v23 = 138412290;
        id v24 = v8;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "   => Internal service with name: %@", (uint8_t *)&v23, 0xCu);
      }
    }
    if (v8)
    {
      services = self->_services;
      v15 = [v8 lowercaseString];
      v16 = [(NSMutableDictionary *)services objectForKeyedSubscript:v15];
      LODWORD(services) = v16 == 0;

      if (services)
      {
        if (v11) {
          uint64_t v17 = [objc_alloc((Class)objc_opt_class()) initWithBundle:v4 subServiceName:v9];
        }
        else {
          uint64_t v17 = [objc_alloc((Class)objc_opt_class()) initWithBundle:v4];
        }
        long long v20 = (void *)v17;
        if (v17)
        {
          v21 = self->_services;
          uint64_t v22 = [v8 lowercaseString];
          [(NSMutableDictionary *)v21 setObject:v20 forKeyedSubscript:v22];

          [(NSMutableDictionary *)self->_serviceCapabilityCache removeAllObjects];
          [(NSMutableDictionary *)self->_serviceNameCapabilityCache removeAllObjects];
        }
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      long long v19 = [v4 bundlePath];
      int v23 = 138412290;
      id v24 = v19;
      _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Refusing to register service %@, not allowed", (uint8_t *)&v23, 0xCu);
    }
  }
}

- (id)serviceWithReplicationSourceID:(int64_t)a3
{
  if (a3)
  {
    uint64_t v7 = 0;
    char v8 = &v7;
    uint64_t v9 = 0x3032000000;
    id v10 = sub_1D975B3D4;
    int v11 = sub_1D975B3E4;
    id v12 = 0;
    services = self->_services;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_1D975B3EC;
    v6[3] = &unk_1E6B75CB0;
    v6[4] = &v7;
    v6[5] = a3;
    [(NSMutableDictionary *)services enumerateKeysAndObjectsUsingBlock:v6];
    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSMutableDictionary)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (NSMutableDictionary)serviceCapabilityCache
{
  return self->_serviceCapabilityCache;
}

- (void)setServiceCapabilityCache:(id)a3
{
}

- (NSMutableDictionary)serviceNameCapabilityCache
{
  return self->_serviceNameCapabilityCache;
}

- (void)setServiceNameCapabilityCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceNameCapabilityCache, 0);
  objc_storeStrong((id *)&self->_serviceCapabilityCache, 0);

  objc_storeStrong((id *)&self->_services, 0);
}

@end