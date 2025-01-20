@interface NEVPNProtocolL2TP
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)needToUpdateKeychain;
- (BOOL)setServiceProtocolsInService:(__SCNetworkService *)a3;
- (BOOL)updateWithServiceProtocolsFromService:(__SCNetworkService *)a3;
- (NEKeychainItem)sharedSecretKeychainItem;
- (NEVPNProtocolL2TP)init;
- (NEVPNProtocolL2TP)initWithCoder:(id)a3;
- (NSArray)userPreferences;
- (NSData)machineIdentityReference;
- (NSData)sharedSecretReference;
- (NSString)localIdentifier;
- (__SCNetworkInterface)createInterface;
- (id)copyLegacyIPSecDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (int64_t)machineAuthenticationMethod;
- (void)encodeWithCoder:(id)a3;
- (void)migratePasswordsFromPreferences:(__SCPreferences *)a3;
- (void)removeKeychainItemsInDomain:(int64_t)a3 keepIdentity:(BOOL)a4;
- (void)setIPSecSettingsFromLegacyDictionary:(id)a3;
- (void)setLocalIdentifier:(id)a3;
- (void)setMachineAuthenticationMethod:(int64_t)a3;
- (void)setMachineIdentityReference:(id)a3;
- (void)setSharedSecretKeychainItem:(id)a3;
- (void)setSharedSecretReference:(id)a3;
- (void)setUserPreferences:(id)a3;
- (void)syncWithKeychainInDomain:(int64_t)a3 configuration:(id)a4 suffix:(id)a5;
@end

@implementation NEVPNProtocolL2TP

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machineIdentityDataInternal, 0);
  objc_storeStrong((id *)&self->_machineIdentity, 0);
  objc_storeStrong((id *)&self->_userPreferences, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);

  objc_storeStrong((id *)&self->_sharedSecretKeychainItem, 0);
}

- (void)setUserPreferences:(id)a3
{
}

- (NSArray)userPreferences
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setLocalIdentifier:(id)a3
{
}

- (NSString)localIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setSharedSecretKeychainItem:(id)a3
{
}

- (NEKeychainItem)sharedSecretKeychainItem
{
  return (NEKeychainItem *)objc_getProperty(self, a2, 224, 1);
}

- (void)setMachineAuthenticationMethod:(int64_t)a3
{
  self->_machineAuthenticationMethod = a3;
}

- (int64_t)machineAuthenticationMethod
{
  return self->_machineAuthenticationMethod;
}

- (BOOL)updateWithServiceProtocolsFromService:(__SCNetworkService *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NEVPNProtocolL2TP;
  BOOL v5 = -[NEVPNProtocolPPP updateWithServiceProtocolsFromService:](&v9, sel_updateWithServiceProtocolsFromService_);
  if (v5)
  {
    Interface = SCNetworkServiceGetInterface(a3);
    if (Interface)
    {
      CFDictionaryRef ExtendedConfiguration = SCNetworkInterfaceGetExtendedConfiguration(Interface, (CFStringRef)*MEMORY[0x1E4F41B60]);
      if (ExtendedConfiguration) {
        [(NEVPNProtocolL2TP *)self setIPSecSettingsFromLegacyDictionary:ExtendedConfiguration];
      }
    }
  }
  return v5;
}

- (BOOL)setServiceProtocolsInService:(__SCNetworkService *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)NEVPNProtocolL2TP;
  BOOL v5 = -[NEVPNProtocolPPP setServiceProtocolsInService:](&v17, sel_setServiceProtocolsInService_);
  if (v5)
  {
    SCNetworkInterfaceRef Interface = SCNetworkServiceGetInterface(a3);
    if (Interface)
    {
      v7 = Interface;
      CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F41B60];
      CFDictionaryRef v9 = [(NEVPNProtocolL2TP *)self copyLegacyIPSecDictionary];
      LODWORD(v7) = SCNetworkInterfaceSetExtendedConfiguration(v7, v8, v9);

      if (v7)
      {
        LOBYTE(v5) = 1;
        return v5;
      }
      v10 = ne_log_obj();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_8:

        LOBYTE(v5) = 0;
        return v5;
      }
      int v14 = SCError();
      v15 = SCErrorString(v14);
      *(_DWORD *)buf = 136315138;
      v19 = v15;
      v11 = "SCNetworkInterfaceSetExtendedConfiguration failed: %s";
      v12 = v10;
      uint32_t v13 = 12;
    }
    else
    {
      v10 = ne_log_obj();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      *(_WORD *)buf = 0;
      v11 = "Cannot set IPSec settings in service, interface is NULL";
      v12 = v10;
      uint32_t v13 = 2;
    }
    _os_log_error_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    goto LABEL_8;
  }
  return v5;
}

- (__SCNetworkInterface)createInterface
{
  result = SCNetworkInterfaceCreateWithInterface((SCNetworkInterfaceRef)*MEMORY[0x1E4F41B50], (CFStringRef)*MEMORY[0x1E4F41B68]);
  if (result)
  {
    v3 = result;
    v4 = SCNetworkInterfaceCreateWithInterface(result, (CFStringRef)*MEMORY[0x1E4F41B70]);
    CFRelease(v3);
    return v4;
  }
  return result;
}

- (void)setIPSecSettingsFromLegacyDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F41C18];
  id v29 = v4;
  v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41C18]];
  int v7 = isa_nsstring(v6);

  if (v7)
  {
    CFStringRef v8 = [NEKeychainItem alloc];
    v10 = [v29 objectForKeyedSubscript:v5];
    if (self)
    {
      int64_t keychainDomain = self->super.super._keychainDomain;
      id Property = objc_getProperty(self, v9, 88, 1);
    }
    else
    {
      int64_t keychainDomain = 0;
      id Property = 0;
    }
    id v13 = Property;
    int v14 = [(NEKeychainItem *)v8 initWithLegacyIdentifier:v10 domain:keychainDomain accessGroup:v13];
    [(NEVPNProtocolL2TP *)self setSharedSecretKeychainItem:v14];

    uint64_t v15 = 1;
  }
  else
  {
    uint64_t v16 = *MEMORY[0x1E4F41BF8];
    objc_super v17 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F41BF8]];
    int v18 = isa_nsdata(v17);

    if (!v18) {
      goto LABEL_8;
    }
    v10 = [v29 objectForKeyedSubscript:v16];
    [(NEVPNProtocolL2TP *)self setMachineIdentityReference:v10];
    uint64_t v15 = 2;
  }

  [(NEVPNProtocolL2TP *)self setMachineAuthenticationMethod:v15];
LABEL_8:
  uint64_t v19 = *MEMORY[0x1E4F41C00];
  uint64_t v20 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F41C00]];
  int v21 = isa_nsstring(v20);

  if (v21)
  {
    v22 = [v29 objectForKeyedSubscript:v19];
    v23 = (void *)[v22 copy];
    [(NEVPNProtocolL2TP *)self setLocalIdentifier:v23];
  }
  uint64_t v24 = *MEMORY[0x1E4F41BF0];
  v25 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F41BF0]];
  int v26 = isa_nsstring(v25);

  if (v26)
  {
    v27 = [v29 objectForKeyedSubscript:v24];
    if ([v27 isEqualToString:*MEMORY[0x1E4F42058]])
    {
      uint64_t v28 = 1;
    }
    else
    {
      if (![v27 isEqualToString:*MEMORY[0x1E4F42050]])
      {
LABEL_16:

        goto LABEL_17;
      }
      uint64_t v28 = 2;
    }
    [(NEVPNProtocolL2TP *)self setMachineAuthenticationMethod:v28];
    goto LABEL_16;
  }
LABEL_17:
}

- (id)copyLegacyIPSecDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(NEVPNProtocolL2TP *)self machineIdentityReference];

  if (v4)
  {
    if (self) {
      id Property = objc_getProperty(self, v5, 248, 1);
    }
    else {
      id Property = 0;
    }
    int v7 = [Property persistentReference];
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F41BF8]];

    CFStringRef v8 = (void *)MEMORY[0x1E4F42050];
  }
  else
  {
    CFStringRef v8 = (void *)MEMORY[0x1E4F42058];
  }
  [v3 setObject:*v8 forKeyedSubscript:*MEMORY[0x1E4F41BF0]];
  CFDictionaryRef v9 = [(NEVPNProtocolL2TP *)self sharedSecretKeychainItem];

  if (v9)
  {
    v10 = [(NEVPNProtocolL2TP *)self sharedSecretKeychainItem];
    v11 = [v10 password];

    v12 = [(NEVPNProtocolL2TP *)self sharedSecretKeychainItem];
    id v13 = v12;
    if (v11)
    {
      uint64_t v14 = [v12 password];
    }
    else
    {
      uint64_t v15 = [v12 identifier];

      if (!v15) {
        goto LABEL_13;
      }
      id v13 = [(NEVPNProtocolL2TP *)self sharedSecretKeychainItem];
      uint64_t v14 = [v13 identifier];
    }
    uint64_t v16 = (void *)v14;

    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F41C18]];
      [v3 setObject:*MEMORY[0x1E4F42068] forKeyedSubscript:*MEMORY[0x1E4F41C20]];
    }
  }
LABEL_13:
  objc_super v17 = [(NEVPNProtocolL2TP *)self localIdentifier];

  if (v17)
  {
    int v18 = [(NEVPNProtocolL2TP *)self localIdentifier];
    [v3 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F41C00]];

    [v3 setObject:*MEMORY[0x1E4F42060] forKeyedSubscript:*MEMORY[0x1E4F41C08]];
  }
  return v3;
}

- (void)migratePasswordsFromPreferences:(__SCPreferences *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NEVPNProtocolL2TP;
  -[NEVPNProtocol migratePasswordsFromPreferences:](&v6, sel_migratePasswordsFromPreferences_);
  uint64_t v5 = [(NEVPNProtocolL2TP *)self sharedSecretKeychainItem];
  [v5 migrateFromPreferences:a3];
}

- (void)removeKeychainItemsInDomain:(int64_t)a3 keepIdentity:(BOOL)a4
{
  v11.receiver = self;
  v11.super_class = (Class)NEVPNProtocolL2TP;
  [(NEVPNProtocol *)&v11 removeKeychainItemsInDomain:a3 keepIdentity:a4];
  uint64_t v6 = [(NEVPNProtocolL2TP *)self sharedSecretKeychainItem];
  if (v6)
  {
    int v7 = (void *)v6;
    CFStringRef v8 = [(NEVPNProtocolL2TP *)self sharedSecretKeychainItem];
    uint64_t v9 = [v8 domain];

    if (v9 == a3)
    {
      v10 = [(NEVPNProtocolL2TP *)self sharedSecretKeychainItem];
      [v10 setIdentifier:0];
    }
  }
}

- (BOOL)needToUpdateKeychain
{
  v10.receiver = self;
  v10.super_class = (Class)NEVPNProtocolL2TP;
  if ([(NEVPNProtocol *)&v10 needToUpdateKeychain]) {
    return 1;
  }
  id v4 = [(NEVPNProtocolL2TP *)self sharedSecretKeychainItem];
  if (v4)
  {
    uint64_t v5 = [(NEVPNProtocolL2TP *)self sharedSecretKeychainItem];
    uint64_t v6 = [v5 password];
    if (v6)
    {
      int v7 = [(NEVPNProtocolL2TP *)self sharedSecretKeychainItem];
      CFStringRef v8 = [v7 password];
      BOOL v3 = [v8 length] != 0;
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)syncWithKeychainInDomain:(int64_t)a3 configuration:(id)a4 suffix:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_super v10 = v9;
  if (v9)
  {
    objc_super v11 = [v9 stringByAppendingString:@".SS"];
  }
  else
  {
    objc_super v11 = @"SS";
  }
  v35.receiver = self;
  v35.super_class = (Class)NEVPNProtocolL2TP;
  [(NEVPNProtocol *)&v35 syncWithKeychainInDomain:a3 configuration:v8 suffix:v10];
  if (self)
  {
    id v13 = objc_getProperty(self, v12, 248, 1);
    if (v13)
    {
      uint64_t v15 = v13;
      uint64_t v16 = objc_msgSend(objc_getProperty(self, v14, 248, 1), "domain");

      if (v16 == a3) {
        objc_msgSend(objc_getProperty(self, v17, 248, 1), "sync");
      }
    }
  }
  if ([(NEVPNProtocolL2TP *)self machineAuthenticationMethod] == 1)
  {
    int v18 = [(NEVPNProtocolL2TP *)self sharedSecretKeychainItem];

    if (!v18)
    {
      uint64_t v19 = NSString;
      uint64_t v20 = [v8 identifier];
      int v21 = [v20 UUIDString];
      v22 = [v19 stringWithFormat:@"%@.%@", v21, v11];

      uint64_t v24 = [NEKeychainItem alloc];
      if (self)
      {
        int64_t keychainDomain = self->super.super._keychainDomain;
        id Property = objc_getProperty(self, v23, 88, 1);
      }
      else
      {
        int64_t keychainDomain = 0;
        id Property = 0;
      }
      id v27 = Property;
      uint64_t v28 = [(NEKeychainItem *)v24 initWithIdentifier:v22 domain:keychainDomain accessGroup:v27];
      [(NEVPNProtocolL2TP *)self setSharedSecretKeychainItem:v28];
    }
  }
  uint64_t v29 = [(NEVPNProtocolL2TP *)self sharedSecretKeychainItem];
  if (v29)
  {
    v30 = (void *)v29;
    v31 = [(NEVPNProtocolL2TP *)self sharedSecretKeychainItem];
    uint64_t v32 = [v31 domain];

    if (v32 == a3)
    {
      v33 = [(NEVPNProtocolL2TP *)self sharedSecretKeychainItem];
      v34 = [(NEVPNProtocolL2TP *)self localIdentifier];
      [v33 syncUsingConfiguration:v8 accountName:v34 passwordType:2 identifierSuffix:v11];
    }
  }
}

- (NSData)machineIdentityReference
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2 && objc_getProperty(v2, v3, 248, 1))
  {
    id v5 = objc_getProperty(v2, v4, 248, 1);
    uint64_t v6 = [v5 persistentReference];
  }
  else
  {
    uint64_t v6 = 0;
  }
  objc_sync_exit(v2);

  return (NSData *)v6;
}

- (void)setMachineIdentityReference:(id)a3
{
  id v14 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v14)
  {
    if (v4 && objc_getProperty(v4, v5, 248, 1))
    {
      id v7 = objc_getProperty(v4, v6, 248, 1);
      [v7 setPersistentReference:v14];
    }
    else
    {
      id v9 = [NEIdentityKeychainItem alloc];
      if (v4)
      {
        int64_t keychainDomain = v4->super.super._keychainDomain;
        id Property = objc_getProperty(v4, v8, 88, 1);
      }
      else
      {
        int64_t keychainDomain = 0;
        id Property = 0;
      }
      id v7 = Property;
      id v13 = [(NEKeychainItem *)v9 initWithPersistentReference:v14 domain:keychainDomain accessGroup:v7];
      if (v4) {
        objc_setProperty_atomic(v4, v12, v13, 248);
      }
    }
  }
  else if (v4)
  {
    objc_setProperty_atomic(v4, v5, 0, 248);
  }
  objc_sync_exit(v4);
}

- (NSData)sharedSecretReference
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NEVPNProtocolL2TP *)v2 sharedSecretKeychainItem];

  if (v3)
  {
    id v4 = [(NEVPNProtocolL2TP *)v2 sharedSecretKeychainItem];
    BOOL v3 = [v4 persistentReference];
  }
  objc_sync_exit(v2);

  return (NSData *)v3;
}

- (void)setSharedSecretReference:(id)a3
{
  id v12 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(NEVPNProtocolL2TP *)v4 sharedSecretKeychainItem];

  if (v5)
  {
    id v6 = [(NEVPNProtocolL2TP *)v4 sharedSecretKeychainItem];
    [v6 setPersistentReference:v12];
  }
  else
  {
    id v8 = [NEKeychainItem alloc];
    if (v4)
    {
      int64_t keychainDomain = v4->super.super._keychainDomain;
      id Property = objc_getProperty(v4, v7, 88, 1);
    }
    else
    {
      int64_t keychainDomain = 0;
      id Property = 0;
    }
    id v6 = Property;
    objc_super v11 = [(NEKeychainItem *)v8 initWithPersistentReference:v12 domain:keychainDomain accessGroup:v6];
    [(NEVPNProtocolL2TP *)v4 setSharedSecretKeychainItem:v11];
  }
  objc_sync_exit(v4);
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x1E4F28E78]);
  v16.receiver = self;
  v16.super_class = (Class)NEVPNProtocolL2TP;
  id v8 = [(NEVPNProtocolPPP *)&v16 descriptionWithIndent:v5 options:a4];
  id v9 = (void *)[v7 initWithString:v8];

  objc_msgSend(v9, "appendPrettyInt:withName:andIndent:options:", -[NEVPNProtocolL2TP machineAuthenticationMethod](self, "machineAuthenticationMethod"), @"machineAuthenticationMethod", v5, a4);
  objc_super v10 = [(NEVPNProtocolL2TP *)self sharedSecretKeychainItem];
  [v9 appendPrettyObject:v10 withName:@"sharedSecretReference" andIndent:v5 options:a4];

  if (self)
  {
    objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v11, 248, 1), @"machineIdentity", v5, a4);
    objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v12, 256, 1), @"machineIdentityDataInternal", v5, a4);
    BOOL machineIdentityDataImported = self->_machineIdentityDataImported;
  }
  else
  {
    [v9 appendPrettyObject:0 withName:@"machineIdentity" andIndent:v5 options:a4];
    [v9 appendPrettyObject:0 withName:@"machineIdentityDataInternal" andIndent:v5 options:a4];
    BOOL machineIdentityDataImported = 0;
  }
  [v9 appendPrettyBOOL:machineIdentityDataImported withName:@"machineIdentityDataImported" andIndent:v5 options:a4];
  id v14 = [(NEVPNProtocolL2TP *)self localIdentifier];
  [v9 appendPrettyObject:v14 withName:@"localIdentifier" andIndent:v5 options:a4 | 1];

  return v9;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NEVPNProtocolL2TP;
  unsigned int v6 = [(NEVPNProtocolPPP *)&v19 checkValidityAndCollectErrors:v4];
  if (self
    && ((id v7 = objc_getProperty(self, v5, 248, 1)) != 0
     || (id v7 = objc_getProperty(self, v8, 256, 1)) != 0))
  {
  }
  else if ([(NEVPNProtocolL2TP *)self machineAuthenticationMethod] == 2)
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Missing machine identity", v4);
    unsigned int v6 = 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = [(NEVPNProtocolL2TP *)self userPreferences];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        v6 &= [*(id *)(*((void *)&v15 + 1) + 8 * i) checkValidityAndCollectErrors:v4];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v11);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NEVPNProtocolL2TP;
  id v4 = [(NEVPNProtocolPPP *)&v13 copyWithZone:a3];
  objc_msgSend(v4, "setMachineAuthenticationMethod:", -[NEVPNProtocolL2TP machineAuthenticationMethod](self, "machineAuthenticationMethod"));
  uint64_t v5 = [(NEVPNProtocolL2TP *)self sharedSecretKeychainItem];
  [v4 setSharedSecretKeychainItem:v5];

  if (self)
  {
    id Property = objc_getProperty(self, v6, 248, 1);
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id Property = 0;
  if (v4) {
LABEL_3:
  }
    objc_setProperty_atomic(v4, v6, Property, 248);
LABEL_4:
  if (self)
  {
    id v8 = objc_getProperty(self, v6, 256, 1);
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v8 = 0;
  if (v4) {
LABEL_6:
  }
    objc_setProperty_atomic_copy(v4, v6, v8, 256);
LABEL_7:
  if (!self)
  {
    BOOL machineIdentityDataImported = 0;
    if (!v4) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  BOOL machineIdentityDataImported = self->_machineIdentityDataImported;
  if (v4) {
LABEL_9:
  }
    v4[208] = machineIdentityDataImported;
LABEL_10:
  uint64_t v10 = [(NEVPNProtocolL2TP *)self localIdentifier];
  [v4 setLocalIdentifier:v10];

  uint64_t v11 = [(NEVPNProtocolL2TP *)self userPreferences];
  [v4 setUserPreferences:v11];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NEVPNProtocolL2TP;
  [(NEVPNProtocolPPP *)&v10 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolL2TP machineAuthenticationMethod](self, "machineAuthenticationMethod"), @"MachineAuthenticationMethod");
  uint64_t v5 = [(NEVPNProtocolL2TP *)self sharedSecretKeychainItem];
  [v4 encodeObject:v5 forKey:@"SharedSecret"];

  if (self)
  {
    objc_msgSend(v4, "encodeObject:forKey:", objc_getProperty(self, v6, 248, 1), @"MachineIdentity");
    objc_msgSend(v4, "encodeObject:forKey:", objc_getProperty(self, v7, 256, 1), @"MachineIdentityData");
    BOOL machineIdentityDataImported = self->_machineIdentityDataImported;
  }
  else
  {
    [v4 encodeObject:0 forKey:@"MachineIdentity"];
    [v4 encodeObject:0 forKey:@"MachineIdentityData"];
    BOOL machineIdentityDataImported = 0;
  }
  [v4 encodeBool:machineIdentityDataImported forKey:@"MachineIdentityDataImported"];
  id v9 = [(NEVPNProtocolL2TP *)self localIdentifier];
  [v4 encodeObject:v9 forKey:@"LocalIdentifier"];
}

- (NEVPNProtocolL2TP)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NEVPNProtocolL2TP;
  uint64_t v5 = [(NEVPNProtocolPPP *)&v15 initWithCoder:v4];
  if (v5)
  {
    v5->_machineAuthenticationMethod = (int)[v4 decodeInt32ForKey:@"MachineAuthenticationMethod"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SharedSecret"];
    sharedSecretKeychainItem = v5->_sharedSecretKeychainItem;
    v5->_sharedSecretKeychainItem = (NEKeychainItem *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MachineIdentity"];
    machineIdentity = v5->_machineIdentity;
    v5->_machineIdentity = (NEIdentityKeychainItem *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MachineIdentityData"];
    machineIdentityDataInternal = v5->_machineIdentityDataInternal;
    v5->_machineIdentityDataInternal = (NSData *)v10;

    v5->_BOOL machineIdentityDataImported = [v4 decodeBoolForKey:@"MachineIdentityDataImported"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LocalIdentifier"];
    localIdentifier = v5->_localIdentifier;
    v5->_localIdentifier = (NSString *)v12;
  }
  return v5;
}

- (NEVPNProtocolL2TP)init
{
  v3.receiver = self;
  v3.super_class = (Class)NEVPNProtocolL2TP;
  return [(NEVPNProtocolPPP *)&v3 initWithType:2];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end