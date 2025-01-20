@interface FSModuleIdentity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEnabled;
- (BOOL)isSystem;
- (FSModuleIdentity)initWithApplicationExtensionRecord:(id)a3 isEnabled:(BOOL)a4;
- (FSModuleIdentity)initWithApplicationExtensionRecord:(id)a3 isEnabled:(BOOL)a4 isSystem:(BOOL)a5;
- (FSModuleIdentity)initWithCoder:(id)a3;
- (NSDictionary)attributes;
- (NSString)bundleIdentifier;
- (NSString)desc;
- (NSString)localizedName;
- (NSURL)url;
- (NSUUID)uuid;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation FSModuleIdentity

- (FSModuleIdentity)initWithApplicationExtensionRecord:(id)a3 isEnabled:(BOOL)a4 isSystem:(BOOL)a5
{
  id v8 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FSModuleIdentity;
  v9 = [(FSModuleIdentity *)&v26 init];
  if (v9)
  {
    uint64_t v10 = [v8 bundleIdentifier];
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)v10;

    v12 = [v8 infoDictionary];
    uint64_t v13 = [v12 objectForKey:@"EXAppExtensionAttributes" ofClass:objc_opt_class()];
    attributes = v9->_attributes;
    v9->_attributes = (NSDictionary *)v13;

    uint64_t v15 = [v8 URL];
    url = v9->_url;
    v9->_url = (NSURL *)v15;

    uint64_t v17 = [v8 uniqueIdentifier];
    uuid = v9->_uuid;
    v9->_uuid = (NSUUID *)v17;

    v19 = NSString;
    v20 = [v8 uniqueIdentifier];
    uint64_t v21 = [v19 stringWithFormat:@"Extension identity [%@]: %@ platform: %u", v20, v9->_bundleIdentifier, objc_msgSend(v8, "platform")];
    desc = v9->_desc;
    v9->_desc = (NSString *)v21;

    v9->_enabled = a4;
    v9->_system = a5;
    uint64_t v23 = [v8 localizedName];
    localizedName = v9->_localizedName;
    v9->_localizedName = (NSString *)v23;
  }
  return v9;
}

- (FSModuleIdentity)initWithApplicationExtensionRecord:(id)a3 isEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 bundleIdentifier];
  uint64_t v8 = [v7 hasPrefix:@"com.apple."];

  v9 = [(FSModuleIdentity *)self initWithApplicationExtensionRecord:v6 isEnabled:v8 | v4 isSystem:v8];
  return v9;
}

- (id)description
{
  return self->_desc;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)encodeWithCoder:(id)a3
{
  bundleIdentifier = self->_bundleIdentifier;
  id v5 = a3;
  [v5 encodeObject:bundleIdentifier forKey:@"FSModuleIdentity.bundleID"];
  [v5 encodeObject:self->_attributes forKey:@"FSModuleIdentity.attributes"];
  [v5 encodeObject:self->_url forKey:@"FSModuleIdentity.url"];
  [v5 encodeObject:self->_uuid forKey:@"FSModuleIdentity.uuid"];
  [v5 encodeObject:self->_desc forKey:@"FSModuleIdentity.description"];
  [v5 encodeBool:self->_enabled forKey:@"FSModuleIdentity.enabled"];
  [v5 encodeBool:self->_system forKey:@"FSModuleIdentity.system"];
  [v5 encodeObject:self->_localizedName forKey:@"FSModuleIdentity.locName"];
}

- (FSModuleIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSModuleIdentity.bundleID"];
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v5;

  v7 = +[FSKitConstants plistTypes];
  uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"FSModuleIdentity.attributes"];
  attributes = self->_attributes;
  self->_attributes = v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSModuleIdentity.url"];
  url = self->_url;
  self->_url = v10;

  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSModuleIdentity.uuid"];
  uuid = self->_uuid;
  self->_uuid = v12;

  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSModuleIdentity.description"];
  desc = self->_desc;
  self->_desc = v14;

  self->_enabled = [v4 decodeBoolForKey:@"FSModuleIdentity.enabled"];
  self->_system = [v4 decodeBoolForKey:@"FSModuleIdentity.system"];
  v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSModuleIdentity.locName"];

  localizedName = self->_localizedName;
  self->_localizedName = v16;

  return self;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isSystem
{
  return self->_system;
}

- (NSString)desc
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)localizedName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_desc, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end