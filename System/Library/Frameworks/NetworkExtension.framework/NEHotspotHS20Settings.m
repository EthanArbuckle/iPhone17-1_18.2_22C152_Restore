@interface NEHotspotHS20Settings
+ (BOOL)supportsSecureCoding;
- (BOOL)isRoamingEnabled;
- (NEHotspotHS20Settings)initWithCoder:(id)a3;
- (NEHotspotHS20Settings)initWithDomainName:(NSString *)domainName roamingEnabled:(BOOL)roamingEnabled;
- (NSArray)MCCAndMNCs;
- (NSArray)naiRealmNames;
- (NSArray)roamingConsortiumOIs;
- (NSString)domainName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setMCCAndMNCs:(NSArray *)MCCAndMNCs;
- (void)setNaiRealmNames:(NSArray *)naiRealmNames;
- (void)setRoamingConsortiumOIs:(NSArray *)roamingConsortiumOIs;
- (void)setRoamingEnabled:(BOOL)roamingEnabled;
@end

@implementation NEHotspotHS20Settings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MCCAndMNCs, 0);
  objc_storeStrong((id *)&self->_naiRealmNames, 0);
  objc_storeStrong((id *)&self->_roamingConsortiumOIs, 0);

  objc_storeStrong((id *)&self->_domainName, 0);
}

- (void)setMCCAndMNCs:(NSArray *)MCCAndMNCs
{
}

- (NSArray)MCCAndMNCs
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNaiRealmNames:(NSArray *)naiRealmNames
{
}

- (NSArray)naiRealmNames
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRoamingConsortiumOIs:(NSArray *)roamingConsortiumOIs
{
}

- (NSArray)roamingConsortiumOIs
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRoamingEnabled:(BOOL)roamingEnabled
{
  self->_roamingEnabled = roamingEnabled;
}

- (BOOL)isRoamingEnabled
{
  return self->_roamingEnabled;
}

- (NSString)domainName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NEHotspotHS20Settings *)self domainName];
  [v4 encodeObject:v5 forKey:@"DomainName"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NEHotspotHS20Settings isRoamingEnabled](self, "isRoamingEnabled"), @"IsRoamingEnabled");
  v6 = [(NEHotspotHS20Settings *)self roamingConsortiumOIs];
  [v4 encodeObject:v6 forKey:@"RoamingConsortiumOIs"];

  v7 = [(NEHotspotHS20Settings *)self naiRealmNames];
  [v4 encodeObject:v7 forKey:@"NAIRealmNames"];

  id v8 = [(NEHotspotHS20Settings *)self MCCAndMNCs];
  [v4 encodeObject:v8 forKey:@"MCCAndMNCs"];
}

- (NEHotspotHS20Settings)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NEHotspotHS20Settings *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DomainName"];
    domainName = v5->_domainName;
    v5->_domainName = (NSString *)v6;

    v5->_roamingEnabled = [v4 decodeBoolForKey:@"IsRoamingEnabled"];
    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"RoamingConsortiumOIs"];
    roamingConsortiumOIs = v5->_roamingConsortiumOIs;
    v5->_roamingConsortiumOIs = (NSArray *)v11;

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"NAIRealmNames"];
    naiRealmNames = v5->_naiRealmNames;
    v5->_naiRealmNames = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"MCCAndMNCs"];
    MCCAndMNCs = v5->_MCCAndMNCs;
    v5->_MCCAndMNCs = (NSArray *)v21;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[NEHotspotHS20Settings allocWithZone:a3];
  v5 = [(NEHotspotHS20Settings *)self domainName];
  uint64_t v6 = [(NEHotspotHS20Settings *)v4 initWithDomainName:v5 roamingEnabled:[(NEHotspotHS20Settings *)self isRoamingEnabled]];

  [(NEHotspotHS20Settings *)v6 setRoamingConsortiumOIs:self->_roamingConsortiumOIs];
  [(NEHotspotHS20Settings *)v6 setNaiRealmNames:self->_naiRealmNames];
  [(NEHotspotHS20Settings *)v6 setMCCAndMNCs:self->_MCCAndMNCs];
  return v6;
}

- (NEHotspotHS20Settings)initWithDomainName:(NSString *)domainName roamingEnabled:(BOOL)roamingEnabled
{
  uint64_t v6 = domainName;
  v11.receiver = self;
  v11.super_class = (Class)NEHotspotHS20Settings;
  v7 = [(NEHotspotHS20Settings *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [(NSString *)v6 copy];
    uint64_t v9 = v7->_domainName;
    v7->_domainName = (NSString *)v8;

    v7->_roamingEnabled = roamingEnabled;
  }

  return v7;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = [(NEHotspotHS20Settings *)self domainName];
  [v3 appendPrettyObject:v4 withName:@"Hotspot 2.0 Domain Name" andIndent:0 options:0];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end