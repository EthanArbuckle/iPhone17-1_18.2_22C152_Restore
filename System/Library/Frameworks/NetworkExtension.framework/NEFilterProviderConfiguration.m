@interface NEFilterProviderConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)disableDefaultDrop;
- (BOOL)filterBrowsers;
- (BOOL)filterPackets;
- (BOOL)filterSockets;
- (BOOL)preserveExistingConnections;
- (NEFilterProviderConfiguration)initWithCoder:(id)a3;
- (NSData)identityReference;
- (NSData)passwordReference;
- (NSDictionary)vendorConfiguration;
- (NSString)dataProviderDesignatedRequirement;
- (NSString)filterDataProviderBundleIdentifier;
- (NSString)filterPacketProviderBundleIdentifier;
- (NSString)organization;
- (NSString)packetProviderDesignatedRequirement;
- (NSString)pluginType;
- (NSString)serverAddress;
- (NSString)username;
- (NSURL)dataProviderURL;
- (NSURL)packetProviderURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setDataProviderDesignatedRequirement:(id)a3;
- (void)setDataProviderURL:(id)a3;
- (void)setDisableDefaultDrop:(BOOL)a3;
- (void)setFilterBrowsers:(BOOL)filterBrowsers;
- (void)setFilterDataProviderBundleIdentifier:(NSString *)filterDataProviderBundleIdentifier;
- (void)setFilterPacketProviderBundleIdentifier:(NSString *)filterPacketProviderBundleIdentifier;
- (void)setFilterPackets:(BOOL)filterPackets;
- (void)setFilterSockets:(BOOL)filterSockets;
- (void)setIdentityReference:(NSData *)identityReference;
- (void)setOrganization:(NSString *)organization;
- (void)setPacketProviderDesignatedRequirement:(id)a3;
- (void)setPacketProviderURL:(id)a3;
- (void)setPasswordReference:(NSData *)passwordReference;
- (void)setPluginType:(id)a3;
- (void)setPreserveExistingConnections:(BOOL)a3;
- (void)setServerAddress:(NSString *)serverAddress;
- (void)setUsername:(NSString *)username;
- (void)setVendorConfiguration:(NSDictionary *)vendorConfiguration;
@end

@implementation NEFilterProviderConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProviderDesignatedRequirement, 0);
  objc_storeStrong((id *)&self->_packetProviderURL, 0);
  objc_storeStrong((id *)&self->_dataProviderURL, 0);
  objc_storeStrong((id *)&self->_keychainAccessGroup, 0);
  objc_storeStrong((id *)&self->_packetProviderDesignatedRequirement, 0);
  objc_storeStrong((id *)&self->_pluginType, 0);
  objc_storeStrong((id *)&self->_filterPacketProviderBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_filterDataProviderBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identityReference, 0);
  objc_storeStrong((id *)&self->_passwordReference, 0);
  objc_storeStrong((id *)&self->_organization, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_serverAddress, 0);

  objc_storeStrong((id *)&self->_vendorConfiguration, 0);
}

- (void)setDataProviderDesignatedRequirement:(id)a3
{
}

- (NSString)dataProviderDesignatedRequirement
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPacketProviderURL:(id)a3
{
}

- (NSURL)packetProviderURL
{
  return (NSURL *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDataProviderURL:(id)a3
{
}

- (NSURL)dataProviderURL
{
  return (NSURL *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPreserveExistingConnections:(BOOL)a3
{
  self->_preserveExistingConnections = a3;
}

- (BOOL)preserveExistingConnections
{
  return self->_preserveExistingConnections;
}

- (void)setDisableDefaultDrop:(BOOL)a3
{
  self->_disableDefaultDrop = a3;
}

- (BOOL)disableDefaultDrop
{
  return self->_disableDefaultDrop;
}

- (void)setPacketProviderDesignatedRequirement:(id)a3
{
}

- (NSString)packetProviderDesignatedRequirement
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPluginType:(id)a3
{
}

- (NSString)pluginType
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFilterPacketProviderBundleIdentifier:(NSString *)filterPacketProviderBundleIdentifier
{
}

- (NSString)filterPacketProviderBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFilterDataProviderBundleIdentifier:(NSString *)filterDataProviderBundleIdentifier
{
}

- (NSString)filterDataProviderBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setIdentityReference:(NSData *)identityReference
{
}

- (NSData)identityReference
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPasswordReference:(NSData *)passwordReference
{
}

- (NSData)passwordReference
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOrganization:(NSString *)organization
{
}

- (NSString)organization
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUsername:(NSString *)username
{
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setServerAddress:(NSString *)serverAddress
{
}

- (NSString)serverAddress
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVendorConfiguration:(NSDictionary *)vendorConfiguration
{
}

- (NSDictionary)vendorConfiguration
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFilterPackets:(BOOL)filterPackets
{
  self->_filterPackets = filterPackets;
}

- (BOOL)filterPackets
{
  return self->_filterPackets;
}

- (void)setFilterSockets:(BOOL)filterSockets
{
  self->_filterSockets = filterSockets;
}

- (BOOL)filterSockets
{
  return self->_filterSockets;
}

- (void)setFilterBrowsers:(BOOL)filterBrowsers
{
  self->_filterBrowsers = filterBrowsers;
}

- (BOOL)filterBrowsers
{
  return self->_filterBrowsers;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  v8 = [(NEFilterProviderConfiguration *)self pluginType];
  [v7 appendPrettyObject:v8 withName:@"pluginType" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  v9 = [(NEFilterProviderConfiguration *)self dataProviderDesignatedRequirement];
  [v7 appendPrettyObject:v9 withName:@"dataProviderDesignatedRequirement" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  v10 = [(NEFilterProviderConfiguration *)self packetProviderDesignatedRequirement];
  [v7 appendPrettyObject:v10 withName:@"packetProviderDesignatedRequirement" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  v11 = [(NEFilterProviderConfiguration *)self filterDataProviderBundleIdentifier];
  [v7 appendPrettyObject:v11 withName:@"dataProviderBundleIdentifier" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  v12 = [(NEFilterProviderConfiguration *)self filterPacketProviderBundleIdentifier];
  [v7 appendPrettyObject:v12 withName:@"packetProviderBundleIdentifier" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  v13 = [(NEFilterProviderConfiguration *)self dataProviderURL];
  [v7 appendPrettyObject:v13 withName:@"dataProviderURL" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  v14 = [(NEFilterProviderConfiguration *)self packetProviderURL];
  [v7 appendPrettyObject:v14 withName:@"packetProviderURL" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  v15 = [(NEFilterProviderConfiguration *)self vendorConfiguration];
  unint64_t v16 = a4 | 8;
  [v7 appendPrettyObject:v15 withName:@"vendorConfiguration" andIndent:v5 options:a4 | 8];

  v17 = [(NEFilterProviderConfiguration *)self serverAddress];
  a4 |= 9uLL;
  [v7 appendPrettyObject:v17 withName:@"serverAddress" andIndent:v5 options:a4];

  v18 = [(NEFilterProviderConfiguration *)self username];
  [v7 appendPrettyObject:v18 withName:@"username" andIndent:v5 options:a4];

  v19 = [(NEFilterProviderConfiguration *)self organization];
  [v7 appendPrettyObject:v19 withName:@"organization" andIndent:v5 options:a4];

  v20 = [(NEFilterProviderConfiguration *)self passwordReference];
  [v7 appendPrettyObject:v20 withName:@"passwordReference" andIndent:v5 options:v16];

  v21 = [(NEFilterProviderConfiguration *)self identityReference];
  [v7 appendPrettyObject:v21 withName:@"identityReference" andIndent:v5 options:v16];

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEFilterProviderConfiguration filterBrowsers](self, "filterBrowsers"), @"filterBrowsers", v5, v16);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEFilterProviderConfiguration filterPackets](self, "filterPackets"), @"filterPackets", v5, v16);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEFilterProviderConfiguration filterSockets](self, "filterSockets"), @"filterSockets", v5, v16);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEFilterProviderConfiguration disableDefaultDrop](self, "disableDefaultDrop"), @"disableDefaultDrop", v5, v16);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEFilterProviderConfiguration preserveExistingConnections](self, "preserveExistingConnections"), @"preserveExistingConnections", v5, v16);

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NEFilterProviderConfiguration *)self pluginType];
  BOOL v6 = v5 != 0;

  if (!v5) {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Missing plugin type", v4);
  }
  if (![(NEFilterProviderConfiguration *)self filterBrowsers]
    && ![(NEFilterProviderConfiguration *)self filterSockets]
    && ![(NEFilterProviderConfiguration *)self filterPackets])
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"At least one of filterBrowsers, filterSockets, or filterPackets must be enabled", v4);
    BOOL v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NEFilterProviderConfiguration allocWithZone:a3] init];
  [(NEFilterProviderConfiguration *)v4 setFilterBrowsers:[(NEFilterProviderConfiguration *)self filterBrowsers]];
  [(NEFilterProviderConfiguration *)v4 setFilterPackets:[(NEFilterProviderConfiguration *)self filterPackets]];
  [(NEFilterProviderConfiguration *)v4 setFilterSockets:[(NEFilterProviderConfiguration *)self filterSockets]];
  [(NEFilterProviderConfiguration *)v4 setDisableDefaultDrop:[(NEFilterProviderConfiguration *)self disableDefaultDrop]];
  [(NEFilterProviderConfiguration *)v4 setPreserveExistingConnections:[(NEFilterProviderConfiguration *)self preserveExistingConnections]];
  uint64_t v5 = [(NEFilterProviderConfiguration *)self vendorConfiguration];
  [(NEFilterProviderConfiguration *)v4 setVendorConfiguration:v5];

  BOOL v6 = [(NEFilterProviderConfiguration *)self serverAddress];
  [(NEFilterProviderConfiguration *)v4 setServerAddress:v6];

  v7 = [(NEFilterProviderConfiguration *)self username];
  [(NEFilterProviderConfiguration *)v4 setUsername:v7];

  v8 = [(NEFilterProviderConfiguration *)self organization];
  [(NEFilterProviderConfiguration *)v4 setOrganization:v8];

  v9 = [(NEFilterProviderConfiguration *)self passwordReference];
  [(NEFilterProviderConfiguration *)v4 setPasswordReference:v9];

  v10 = [(NEFilterProviderConfiguration *)self identityReference];
  [(NEFilterProviderConfiguration *)v4 setIdentityReference:v10];

  v11 = [(NEFilterProviderConfiguration *)self pluginType];
  [(NEFilterProviderConfiguration *)v4 setPluginType:v11];

  v12 = [(NEFilterProviderConfiguration *)self dataProviderDesignatedRequirement];
  [(NEFilterProviderConfiguration *)v4 setDataProviderDesignatedRequirement:v12];

  v13 = [(NEFilterProviderConfiguration *)self packetProviderDesignatedRequirement];
  [(NEFilterProviderConfiguration *)v4 setPacketProviderDesignatedRequirement:v13];

  v14 = [(NEFilterProviderConfiguration *)self dataProviderURL];
  [(NEFilterProviderConfiguration *)v4 setDataProviderURL:v14];

  v15 = [(NEFilterProviderConfiguration *)self packetProviderURL];
  [(NEFilterProviderConfiguration *)v4 setPacketProviderURL:v15];

  if (self)
  {
    BOOL controlProviderInitialized = self->_controlProviderInitialized;
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  BOOL controlProviderInitialized = 0;
  if (v4) {
LABEL_3:
  }
    v4->_BOOL controlProviderInitialized = controlProviderInitialized;
LABEL_4:
  if (!self)
  {
    id Property = 0;
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id Property = objc_getProperty(self, v16, 96, 1);
  if (v4) {
LABEL_6:
  }
    objc_setProperty_atomic_copy(v4, v16, Property, 96);
LABEL_7:
  v19 = [(NEFilterProviderConfiguration *)self filterDataProviderBundleIdentifier];
  [(NEFilterProviderConfiguration *)v4 setFilterDataProviderBundleIdentifier:v19];

  v20 = [(NEFilterProviderConfiguration *)self filterPacketProviderBundleIdentifier];
  [(NEFilterProviderConfiguration *)v4 setFilterPacketProviderBundleIdentifier:v20];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v19 = a3;
  objc_msgSend(v19, "encodeBool:forKey:", -[NEFilterProviderConfiguration filterBrowsers](self, "filterBrowsers"), @"FilterBrowsers");
  objc_msgSend(v19, "encodeBool:forKey:", -[NEFilterProviderConfiguration filterPackets](self, "filterPackets"), @"FilterPackets");
  objc_msgSend(v19, "encodeBool:forKey:", -[NEFilterProviderConfiguration filterSockets](self, "filterSockets"), @"FilterSockets");
  objc_msgSend(v19, "encodeBool:forKey:", -[NEFilterProviderConfiguration disableDefaultDrop](self, "disableDefaultDrop"), @"DisableDefaultDrop");
  objc_msgSend(v19, "encodeBool:forKey:", -[NEFilterProviderConfiguration preserveExistingConnections](self, "preserveExistingConnections"), @"PreserveExistingConnections");
  id v4 = [(NEFilterProviderConfiguration *)self vendorConfiguration];
  [v19 encodeObject:v4 forKey:@"VendorConfiguration"];

  uint64_t v5 = [(NEFilterProviderConfiguration *)self serverAddress];
  [v19 encodeObject:v5 forKey:@"ServerAddress"];

  BOOL v6 = [(NEFilterProviderConfiguration *)self username];
  [v19 encodeObject:v6 forKey:@"Username"];

  v7 = [(NEFilterProviderConfiguration *)self organization];
  [v19 encodeObject:v7 forKey:@"Organization"];

  v8 = [(NEFilterProviderConfiguration *)self passwordReference];
  [v19 encodeObject:v8 forKey:@"Password"];

  v9 = [(NEFilterProviderConfiguration *)self identityReference];
  [v19 encodeObject:v9 forKey:@"Identity"];

  v10 = [(NEFilterProviderConfiguration *)self pluginType];
  [v19 encodeObject:v10 forKey:@"PluginType"];

  v11 = [(NEFilterProviderConfiguration *)self dataProviderDesignatedRequirement];
  [v19 encodeObject:v11 forKey:@"DataProviderDesignatedRequirement"];

  v12 = [(NEFilterProviderConfiguration *)self packetProviderDesignatedRequirement];
  [v19 encodeObject:v12 forKey:@"PacketProviderDesignatedRequirement"];

  v13 = [(NEFilterProviderConfiguration *)self dataProviderURL];
  [v19 encodeObject:v13 forKey:@"DataProviderURL"];

  v14 = [(NEFilterProviderConfiguration *)self packetProviderURL];
  [v19 encodeObject:v14 forKey:@"PacketProviderURL"];

  if (self)
  {
    [v19 encodeBool:self->_controlProviderInitialized forKey:@"ControlProviderInitialized"];
    id Property = objc_getProperty(self, v15, 96, 1);
  }
  else
  {
    [v19 encodeBool:0 forKey:@"ControlProviderInitialized"];
    id Property = 0;
  }
  [v19 encodeObject:Property forKey:@"KeychainAccessGroup"];
  v17 = [(NEFilterProviderConfiguration *)self filterDataProviderBundleIdentifier];
  [v19 encodeObject:v17 forKey:@"DataProviderBundleIdentifier"];

  v18 = [(NEFilterProviderConfiguration *)self filterPacketProviderBundleIdentifier];
  [v19 encodeObject:v18 forKey:@"PacketProviderBundleIdentifier"];
}

- (NEFilterProviderConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)NEFilterProviderConfiguration;
  uint64_t v5 = [(NEFilterProviderConfiguration *)&v41 init];
  if (v5)
  {
    v5->_filterBrowsers = [v4 decodeBoolForKey:@"FilterBrowsers"];
    v5->_filterPackets = [v4 decodeBoolForKey:@"FilterPackets"];
    v5->_filterSockets = [v4 decodeBoolForKey:@"FilterSockets"];
    v5->_disableDefaultDrop = [v4 decodeBoolForKey:@"DisableDefaultDrop"];
    v5->_preserveExistingConnections = [v4 decodeBoolForKey:@"PreserveExistingConnections"];
    BOOL v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"VendorConfiguration"];
    vendorConfiguration = v5->_vendorConfiguration;
    v5->_vendorConfiguration = (NSDictionary *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ServerAddress"];
    serverAddress = v5->_serverAddress;
    v5->_serverAddress = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Username"];
    username = v5->_username;
    v5->_username = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Organization"];
    organization = v5->_organization;
    v5->_organization = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Password"];
    passwordReference = v5->_passwordReference;
    v5->_passwordReference = (NSData *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identity"];
    identityReference = v5->_identityReference;
    v5->_identityReference = (NSData *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PluginType"];
    pluginType = v5->_pluginType;
    v5->_pluginType = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DataProviderDesignatedRequirement"];
    dataProviderDesignatedRequirement = v5->_dataProviderDesignatedRequirement;
    v5->_dataProviderDesignatedRequirement = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PacketProviderDesignatedRequirement"];
    packetProviderDesignatedRequirement = v5->_packetProviderDesignatedRequirement;
    v5->_packetProviderDesignatedRequirement = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DataProviderURL"];
    dataProviderURL = v5->_dataProviderURL;
    v5->_dataProviderURL = (NSURL *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PacketProviderURL"];
    packetProviderURL = v5->_packetProviderURL;
    v5->_packetProviderURL = (NSURL *)v32;

    v5->_BOOL controlProviderInitialized = [v4 decodeBoolForKey:@"ControlProviderInitialized"];
    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"KeychainAccessGroup"];
    keychainAccessGroup = v5->_keychainAccessGroup;
    v5->_keychainAccessGroup = (NSString *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DataProviderBundleIdentifier"];
    filterDataProviderBundleIdentifier = v5->_filterDataProviderBundleIdentifier;
    v5->_filterDataProviderBundleIdentifier = (NSString *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PacketProviderBundleIdentifier"];
    filterPacketProviderBundleIdentifier = v5->_filterPacketProviderBundleIdentifier;
    v5->_filterPacketProviderBundleIdentifier = (NSString *)v38;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end