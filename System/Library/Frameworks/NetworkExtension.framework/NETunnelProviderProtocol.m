@interface NETunnelProviderProtocol
+ (BOOL)isLegacyPluginType:(id)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)setServiceProtocolsInService:(__SCNetworkService *)a3;
- (BOOL)updateWithServiceProtocolsFromService:(__SCNetworkService *)a3;
- (NETunnelProviderProtocol)init;
- (NETunnelProviderProtocol)initWithCoder:(id)a3;
- (NETunnelProviderProtocol)initWithPluginType:(id)a3;
- (NSDictionary)providerConfiguration;
- (NSDictionary)vendorInfo;
- (NSString)authenticationPluginType;
- (NSString)designatedRequirement;
- (NSString)pluginType;
- (NSString)providerBundleIdentifier;
- (__SCNetworkInterface)createInterface;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (int64_t)authenticationMethod;
- (void)copyPasswordsFromKeychainInDomain:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeKeychainItemsInDomain:(int64_t)a3 keepIdentity:(BOOL)a4;
- (void)setAuthenticationMethod:(int64_t)a3;
- (void)setAuthenticationPluginType:(id)a3;
- (void)setDesignatedRequirement:(id)a3;
- (void)setPluginType:(id)a3;
- (void)setProviderBundleIdentifier:(NSString *)providerBundleIdentifier;
- (void)setProviderConfiguration:(NSDictionary *)providerConfiguration;
- (void)setVendorInfo:(id)a3;
- (void)syncWithKeychainInDomain:(int64_t)a3 configuration:(id)a4 suffix:(id)a5;
@end

@implementation NETunnelProviderProtocol

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorInfo, 0);
  objc_storeStrong((id *)&self->_authenticationPluginType, 0);
  objc_storeStrong((id *)&self->_designatedRequirement, 0);
  objc_storeStrong((id *)&self->_pluginType, 0);
  objc_storeStrong((id *)&self->_providerBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_providerConfiguration, 0);
}

- (void)setAuthenticationMethod:(int64_t)a3
{
  self->_authenticationMethod = a3;
}

- (int64_t)authenticationMethod
{
  return self->_authenticationMethod;
}

- (void)setVendorInfo:(id)a3
{
}

- (NSDictionary)vendorInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (void)setAuthenticationPluginType:(id)a3
{
}

- (NSString)authenticationPluginType
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setDesignatedRequirement:(id)a3
{
}

- (NSString)designatedRequirement
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (NSString)pluginType
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setProviderBundleIdentifier:(NSString *)providerBundleIdentifier
{
}

- (NSString)providerBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setProviderConfiguration:(NSDictionary *)providerConfiguration
{
}

- (NSDictionary)providerConfiguration
{
  return (NSDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (void)syncWithKeychainInDomain:(int64_t)a3 configuration:(id)a4 suffix:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)NETunnelProviderProtocol;
  [(NEVPNProtocol *)&v14 syncWithKeychainInDomain:a3 configuration:a4 suffix:a5];
  if (a3 == 1)
  {
    uint64_t v7 = [(NEVPNProtocol *)self passwordKeychainItem];
    if (v7)
    {
      v8 = (void *)v7;
      v9 = [(NEVPNProtocol *)self passwordKeychainItem];
      if ([v9 domain] == 1)
      {
        v10 = [(NEVPNProtocol *)self passwordKeychainItem];
        uint64_t v11 = [v10 persistentReference];
        if (v11)
        {
          v12 = (void *)v11;
          v13 = [(NEVPNProtocol *)self passwordReference];

          if (v13) {
            return;
          }
          v8 = [(NEVPNProtocol *)self passwordKeychainItem];
          v9 = [v8 persistentReference];
          [(NEVPNProtocol *)self setPasswordReference:v9];
        }
        else
        {
        }
      }
    }
  }
}

- (void)removeKeychainItemsInDomain:(int64_t)a3 keepIdentity:(BOOL)a4
{
  if (a3 == 1)
  {
    id v7 = [(NEVPNProtocol *)self passwordKeychainItem];
    if ([v7 domain] == 1)
    {
      v5 = [(NEVPNProtocol *)self passwordKeychainItem];
      v6 = [v5 accessGroup];

      if (!v6) {
        return;
      }
      id v7 = [(NEVPNProtocol *)self passwordKeychainItem];
      [v7 setIdentifier:0];
    }
  }
  else if (!a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)NETunnelProviderProtocol;
    [(NEVPNProtocol *)&v8 removeKeychainItemsInDomain:0 keepIdentity:a4];
  }
}

- (void)copyPasswordsFromKeychainInDomain:(int64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)NETunnelProviderProtocol;
  -[NEVPNProtocol copyPasswordsFromKeychainInDomain:](&v16, sel_copyPasswordsFromKeychainInDomain_);
  uint64_t v5 = [(NEVPNProtocol *)self passwordKeychainItem];
  if (v5)
  {
    v6 = (void *)v5;
    id v7 = [(NEVPNProtocol *)self passwordKeychainItem];
    uint64_t v8 = [v7 domain];

    if (v8 == a3)
    {
      uint64_t v9 = [(NEVPNProtocol *)self passwordEncryption];
      if (!v9
        || (v10 = (void *)v9,
            [(NEVPNProtocol *)self passwordEncryption],
            uint64_t v11 = objc_claimAutoreleasedReturnValue(),
            char v12 = [v11 isEqualToString:*MEMORY[0x1E4F42138]],
            v11,
            v10,
            (v12 & 1) == 0))
      {
        v13 = [(NEVPNProtocol *)self passwordKeychainItem];
        objc_super v14 = (void *)[v13 copyData];
        v15 = [(NEVPNProtocol *)self passwordKeychainItem];
        [v15 setData:v14];
      }
    }
  }
}

- (BOOL)updateWithServiceProtocolsFromService:(__SCNetworkService *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NETunnelProviderProtocol;
  BOOL v5 = -[NEVPNProtocol updateWithServiceProtocolsFromService:](&v9, sel_updateWithServiceProtocolsFromService_);
  if (v5)
  {
    Interface = SCNetworkServiceGetInterface(a3);
    if (Interface)
    {
      id v7 = SCNetworkInterfaceGetInterface(Interface);
      if (v7) {
        [(NETunnelProviderProtocol *)self setProviderConfiguration:SCNetworkInterfaceGetConfiguration(v7)];
      }
    }
  }
  return v5;
}

- (BOOL)setServiceProtocolsInService:(__SCNetworkService *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)NETunnelProviderProtocol;
  BOOL v5 = -[NEVPNProtocol setServiceProtocolsInService:](&v14, sel_setServiceProtocolsInService_);
  if (v5)
  {
    Interface = SCNetworkServiceGetInterface(a3);
    if (Interface
      && (SCNetworkInterfaceRef v7 = SCNetworkInterfaceGetInterface(Interface)) != 0
      && (uint64_t v8 = v7,
          [(NETunnelProviderProtocol *)self providerConfiguration],
          CFDictionaryRef v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(),
          LODWORD(v8) = SCNetworkInterfaceSetConfiguration(v8, v9),
          v9,
          !v8))
    {
      v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = SCError();
        char v12 = SCErrorString(v11);
        *(_DWORD *)buf = 136315394;
        objc_super v16 = "-[NETunnelProviderProtocol setServiceProtocolsInService:]";
        __int16 v17 = 2080;
        v18 = v12;
        _os_log_error_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_ERROR, "%s: SCNetworkInterfaceSetConfiguration failed: %s", buf, 0x16u);
      }

      LOBYTE(v5) = 0;
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (__SCNetworkInterface)createInterface
{
  v2 = (const __SCNetworkInterface *)*MEMORY[0x1E4F41B50];
  v3 = [(NETunnelProviderProtocol *)self pluginType];
  v4 = SCNetworkInterfaceCreateWithInterface(v2, v3);

  if (!v4) {
    return 0;
  }
  BOOL v5 = SCNetworkInterfaceCreateWithInterface(v4, (CFStringRef)*MEMORY[0x1E4F41B78]);
  CFRelease(v4);
  return v5;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NETunnelProviderProtocol;
  BOOL v5 = [(NEVPNProtocol *)&v24 initFromLegacyDictionary:v4];
  if (!v5) {
    goto LABEL_15;
  }
  if (initFromLegacyDictionary__initOurKeys != -1) {
    dispatch_once(&initFromLegacyDictionary__initOurKeys, &__block_literal_global_22977);
  }
  v6 = [v4 objectForKeyedSubscript:@"__NEVPNPluginType"];
  [v5 setPluginType:v6];

  SCNetworkInterfaceRef v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41F40]];
  if (isa_nsstring(v7))
  {
    if ([v7 isEqualToString:*MEMORY[0x1E4F42148]])
    {
      uint64_t v8 = 0;
LABEL_9:
      v5[28] = v8;
      goto LABEL_10;
    }
    if ([v7 isEqualToString:*MEMORY[0x1E4F42140]])
    {
      uint64_t v8 = 1;
      goto LABEL_9;
    }
  }
LABEL_10:
  uint64_t v9 = *MEMORY[0x1E4F41F38];
  v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41F38]];
  int v11 = isa_nsstring(v10);

  if (v11)
  {
    char v12 = [v4 objectForKeyedSubscript:v9];
    uint64_t v13 = [v12 copy];
    objc_super v14 = (void *)v5[26];
    v5[26] = v13;
  }
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v4];
  [v15 removeObjectsForKeys:initFromLegacyDictionary__nsprotocolkeys];
  if (![v15 count])
  {

    v15 = 0;
  }
  objc_super v16 = (void *)v5[27];
  v5[27] = v15;
  id v17 = v15;

  uint64_t v18 = [v4 objectForKeyedSubscript:@"NEProviderBundleIdentifier"];
  uint64_t v19 = (void *)v5[23];
  v5[23] = v18;

  uint64_t v20 = [v4 objectForKeyedSubscript:@"DesignatedRequirement"];
  v21 = (void *)v5[25];
  v5[25] = v20;

  v22 = v5;
LABEL_15:

  return v5;
}

void __53__NETunnelProviderProtocol_initFromLegacyDictionary___block_invoke()
{
  v16[36] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F41F18];
  v16[0] = *MEMORY[0x1E4F41F10];
  v16[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F41F28];
  v16[2] = *MEMORY[0x1E4F41F20];
  v16[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F41F38];
  v16[4] = *MEMORY[0x1E4F41F30];
  v16[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F41F48];
  v16[6] = *MEMORY[0x1E4F41F40];
  v16[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F41F58];
  v16[8] = *MEMORY[0x1E4F41F50];
  v16[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F41F68];
  v16[10] = *MEMORY[0x1E4F41F60];
  v16[11] = v5;
  uint64_t v6 = *MEMORY[0x1E4F41F78];
  v16[12] = *MEMORY[0x1E4F41F70];
  v16[13] = v6;
  uint64_t v7 = *MEMORY[0x1E4F41F88];
  v16[14] = *MEMORY[0x1E4F41F80];
  v16[15] = v7;
  uint64_t v8 = *MEMORY[0x1E4F41F98];
  v16[16] = *MEMORY[0x1E4F41F90];
  v16[17] = v8;
  uint64_t v9 = *MEMORY[0x1E4F41FA8];
  v16[18] = *MEMORY[0x1E4F41FA0];
  v16[19] = v9;
  uint64_t v10 = *MEMORY[0x1E4F41FC0];
  v16[20] = *MEMORY[0x1E4F41FB0];
  v16[21] = v10;
  uint64_t v11 = *MEMORY[0x1E4F42020];
  v16[22] = *MEMORY[0x1E4F41FB8];
  v16[23] = v11;
  uint64_t v12 = *MEMORY[0x1E4F42030];
  v16[24] = *MEMORY[0x1E4F42028];
  v16[25] = v12;
  uint64_t v13 = *MEMORY[0x1E4F42040];
  v16[26] = *MEMORY[0x1E4F42038];
  v16[27] = v13;
  v16[28] = *MEMORY[0x1E4F42048];
  v16[29] = @"ReassertionTimer";
  v16[30] = *MEMORY[0x1E4F41B40];
  v16[31] = @"__NEVPNProtocolType";
  v16[32] = @"__NEVPNPluginType";
  v16[33] = @"__NEVPNProtocolIdentifier";
  v16[34] = @"NEProviderBundleIdentifier";
  v16[35] = @"DesignatedRequirement";
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:36];
  v15 = (void *)initFromLegacyDictionary__nsprotocolkeys;
  initFromLegacyDictionary__nsprotocolkeys = v14;
}

- (id)copyLegacyDictionary
{
  v12.receiver = self;
  v12.super_class = (Class)NETunnelProviderProtocol;
  id v3 = [(NEVPNProtocol *)&v12 copyLegacyDictionary];
  int64_t v4 = [(NETunnelProviderProtocol *)self authenticationMethod];
  if (v4)
  {
    if (v4 != 1) {
      goto LABEL_6;
    }
    uint64_t v5 = (void *)MEMORY[0x1E4F42140];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F42148];
  }
  [v3 setObject:*v5 forKeyedSubscript:*MEMORY[0x1E4F41F40]];
LABEL_6:
  uint64_t v6 = [(NETunnelProviderProtocol *)self authenticationPluginType];

  if (v6)
  {
    uint64_t v7 = [(NETunnelProviderProtocol *)self authenticationPluginType];
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F41F38]];
  }
  uint64_t v8 = [(NETunnelProviderProtocol *)self vendorInfo];

  if (v8) {
    [v3 addEntriesFromDictionary:self->_vendorInfo];
  }
  uint64_t v9 = [(NETunnelProviderProtocol *)self providerBundleIdentifier];
  [v3 setObject:v9 forKeyedSubscript:@"NEProviderBundleIdentifier"];

  uint64_t v10 = [(NETunnelProviderProtocol *)self designatedRequirement];
  [v3 setObject:v10 forKeyedSubscript:@"DesignatedRequirement"];

  return v3;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x1E4F28E78]);
  v18.receiver = self;
  v18.super_class = (Class)NETunnelProviderProtocol;
  uint64_t v8 = [(NEVPNProtocol *)&v18 descriptionWithIndent:v5 options:a4];
  uint64_t v9 = (void *)[v7 initWithString:v8];

  unint64_t v10 = a4 & 0xFFFFFFFFFFFFFFF7;
  uint64_t v11 = [(NETunnelProviderProtocol *)self pluginType];
  [v9 appendPrettyObject:v11 withName:@"pluginType" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  objc_super v12 = [(NETunnelProviderProtocol *)self vendorInfo];
  [v9 appendPrettyObject:v12 withName:@"vendorInfo" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  uint64_t v13 = [(NETunnelProviderProtocol *)self authenticationPluginType];
  [v9 appendPrettyObject:v13 withName:@"authenticationPluginType" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  objc_msgSend(v9, "appendPrettyInt:withName:andIndent:options:", -[NETunnelProviderProtocol authenticationMethod](self, "authenticationMethod"), @"authenticationMethod", v5, a4 & 0xFFFFFFFFFFFFFFF7);
  uint64_t v14 = [(NETunnelProviderProtocol *)self providerConfiguration];
  a4 |= 8uLL;
  [v9 appendPrettyObject:v14 withName:@"providerConfiguration" andIndent:v5 options:a4];

  v15 = [(NETunnelProviderProtocol *)self providerBundleIdentifier];
  [v9 appendPrettyObject:v15 withName:@"providerBundleIdentifier" andIndent:v5 options:a4];

  objc_super v16 = [(NETunnelProviderProtocol *)self designatedRequirement];
  [v9 appendPrettyObject:v16 withName:@"designatedRequirement" andIndent:v5 options:v10];

  return v9;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NETunnelProviderProtocol;
  BOOL v5 = [(NEVPNProtocol *)&v8 checkValidityAndCollectErrors:v4];
  uint64_t v6 = [(NETunnelProviderProtocol *)self pluginType];

  if (!v6)
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Missing plugin type", v4);
    BOOL v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)NETunnelProviderProtocol;
  id v4 = [(NEVPNProtocol *)&v16 copyWithZone:a3];
  BOOL v5 = [(NETunnelProviderProtocol *)self pluginType];
  [v4 setPluginType:v5];

  uint64_t v6 = [(NETunnelProviderProtocol *)self vendorInfo];
  [v4 setVendorInfo:v6];

  id v7 = [(NETunnelProviderProtocol *)self authenticationPluginType];
  [v4 setAuthenticationPluginType:v7];

  objc_msgSend(v4, "setAuthenticationMethod:", -[NETunnelProviderProtocol authenticationMethod](self, "authenticationMethod"));
  objc_super v8 = [(NETunnelProviderProtocol *)self providerConfiguration];
  [v4 setProviderConfiguration:v8];

  if (self) {
    id Property = objc_getProperty(self, v9, 88, 1);
  }
  else {
    id Property = 0;
  }
  id v12 = Property;
  if (v4) {
    objc_setProperty_atomic(v4, v11, v12, 88);
  }

  uint64_t v13 = [(NETunnelProviderProtocol *)self providerBundleIdentifier];
  [v4 setProviderBundleIdentifier:v13];

  uint64_t v14 = [(NETunnelProviderProtocol *)self designatedRequirement];
  [v4 setDesignatedRequirement:v14];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NETunnelProviderProtocol;
  id v4 = a3;
  [(NEVPNProtocol *)&v11 encodeWithCoder:v4];
  BOOL v5 = [(NETunnelProviderProtocol *)self pluginType];
  [v4 encodeObject:v5 forKey:@"PluginType"];

  uint64_t v6 = [(NETunnelProviderProtocol *)self vendorInfo];
  [v4 encodeObject:v6 forKey:@"VendorInfo"];

  id v7 = [(NETunnelProviderProtocol *)self authenticationPluginType];
  [v4 encodeObject:v7 forKey:@"AuthenticationPluginType"];

  objc_msgSend(v4, "encodeInt32:forKey:", -[NETunnelProviderProtocol authenticationMethod](self, "authenticationMethod"), @"AuthenticationMethod");
  objc_super v8 = [(NETunnelProviderProtocol *)self providerConfiguration];
  [v4 encodeObject:v8 forKey:@"VendorConfiguration"];

  uint64_t v9 = [(NETunnelProviderProtocol *)self providerBundleIdentifier];
  [v4 encodeObject:v9 forKey:@"NEProviderBundleIdentifier"];

  unint64_t v10 = [(NETunnelProviderProtocol *)self designatedRequirement];
  [v4 encodeObject:v10 forKey:@"DesignatedRequirement"];
}

- (NETunnelProviderProtocol)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)NETunnelProviderProtocol;
  BOOL v5 = [(NEVPNProtocol *)&v30 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PluginType"];
    [(NETunnelProviderProtocol *)v5 setPluginType:v6];

    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    id v12 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"VendorInfo"];
    vendorInfo = v5->_vendorInfo;
    v5->_vendorInfo = (NSDictionary *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AuthenticationPluginType"];
    authenticationPluginType = v5->_authenticationPluginType;
    v5->_authenticationPluginType = (NSString *)v15;

    v5->_authenticationMethod = (int)[v4 decodeInt32ForKey:@"AuthenticationMethod"];
    id v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v17, "setWithObjects:", v18, v19, v20, v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"VendorConfiguration"];
    providerConfiguration = v5->_providerConfiguration;
    v5->_providerConfiguration = (NSDictionary *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NEProviderBundleIdentifier"];
    providerBundleIdentifier = v5->_providerBundleIdentifier;
    v5->_providerBundleIdentifier = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DesignatedRequirement"];
    designatedRequirement = v5->_designatedRequirement;
    v5->_designatedRequirement = (NSString *)v27;
  }
  return v5;
}

- (NETunnelProviderProtocol)initWithPluginType:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NETunnelProviderProtocol;
  BOOL v5 = [(NEVPNProtocol *)&v8 initWithType:4];
  uint64_t v6 = v5;
  if (v5)
  {
    [(NETunnelProviderProtocol *)v5 setPluginType:v4];
    v6->_authenticationMethod = 0;
  }

  return v6;
}

- (NETunnelProviderProtocol)init
{
  v3.receiver = self;
  v3.super_class = (Class)NETunnelProviderProtocol;
  result = [(NEVPNProtocol *)&v3 initWithType:4];
  if (result) {
    result->super._keychainDomain = 0;
  }
  return result;
}

- (void)setPluginType:(id)a3
{
  id v11 = a3;
  if (!self->_pluginType)
  {
    id v4 = (NSString *)[v11 copy];
    pluginType = self->_pluginType;
    self->_pluginType = v4;
  }
  uint64_t v6 = [(NETunnelProviderProtocol *)self pluginType];
  BOOL v7 = +[NETunnelProviderProtocol isLegacyPluginType:v6];

  if (v7)
  {
    self->super._keychainDomain = 0;
    uint64_t v9 = self;
    uint64_t v10 = 0;
  }
  else
  {
    self->super._keychainDomain = 1;
    uint64_t v10 = @"com.apple.managed.vpn.shared";
    uint64_t v9 = self;
  }
  objc_setProperty_atomic(v9, v8, v10, 88);
}

+ (BOOL)isLegacyPluginType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"com.cisco.anyconnect.applevpn.plugin"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.ac-otc-authen.vpn.plugin"] & 1) != 0
    || ([v3 isEqualToString:@"net.juniper.sslvpn"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 hasSuffix:@".vpnplugin"];
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end