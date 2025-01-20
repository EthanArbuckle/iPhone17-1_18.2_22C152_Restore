@interface _EXExtensionValueIdentity
+ (BOOL)supportsSecureCoding;
- (BOOL)isSystemComponent;
- (_EXExtensionValueIdentity)initWithCoder:(id)a3;
- (id)UUID;
- (id)applicationExtensionRecord;
- (id)attributes;
- (id)bundleIdentifier;
- (id)bundleVersion;
- (id)containingBundleRecord;
- (id)containingURL;
- (id)developerName;
- (id)entitlementNamed:(id)a3 ofClass:(Class)a4;
- (id)entitlements;
- (id)extensionDictionary;
- (id)extensionPointIdentifier;
- (id)localizedName;
- (id)sdkDictionary;
- (id)url;
- (unsigned)defaultUserElection;
- (unsigned)platform;
- (unsigned)userElection;
@end

@implementation _EXExtensionValueIdentity

- (id)sdkDictionary
{
  return objc_getProperty(self, a2, 104, 1);
}

- (id)bundleIdentifier
{
  return objc_getProperty(self, a2, 40, 1);
}

- (id)extensionPointIdentifier
{
  return objc_getProperty(self, a2, 32, 1);
}

- (id)applicationExtensionRecord
{
  return 0;
}

- (_EXExtensionValueIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)_EXExtensionValueIdentity;
  v5 = [(_EXExtensionIdentity *)&v46 _init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionPointIdentifier"];
    extensionPointIdentifier = v5->_extensionPointIdentifier;
    v5->_extensionPointIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleVersion"];
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v10;

    v12 = [MEMORY[0x1E4F22420] sharedDatabaseContext];
    int v13 = [v12 canAccess];

    if (v13)
    {
      v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containingBundleRecordIdentifier"];
      if (v14)
      {
        uint64_t v15 = [objc_alloc(MEMORY[0x1E4F223C8]) initWithPersistentIdentifier:v14];
        containingBundleRecord = v5->_containingBundleRecord;
        v5->_containingBundleRecord = (LSBundleRecord *)v15;

        if (!v5->_containingBundleRecord)
        {
          v17 = _EXDefaultLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v45 = 0;
            _os_log_impl(&dword_191F29000, v17, OS_LOG_TYPE_DEFAULT, "Failed to locate container app bundle record. The process may not be entitled to access the LaunchServices database or the app may have moved.", v45, 2u);
          }
        }
      }
    }
    v5->_platform = [v4 decodeInt32ForKey:@"platform"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedName"];
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"developerName"];
    developerName = v5->_developerName;
    v5->_developerName = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containingURL"];
    containingURL = v5->_containingURL;
    v5->_containingURL = (NSURL *)v26;

    v28 = +[_EXDefaults sharedInstance];
    v29 = [v28 plistTypes];
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"sdkDictionary"];
    sdkDictionary = v5->_sdkDictionary;
    v5->_sdkDictionary = (NSDictionary *)v30;

    v32 = +[_EXDefaults sharedInstance];
    v33 = [v32 plistTypes];
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"extensionDictionary"];
    extensionDictionary = v5->_extensionDictionary;
    v5->_extensionDictionary = (NSDictionary *)v34;

    v36 = +[_EXDefaults sharedInstance];
    v37 = [v36 plistTypes];
    uint64_t v38 = [v4 decodeObjectOfClasses:v37 forKey:@"attributes"];
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v38;

    v40 = +[_EXDefaults sharedInstance];
    v41 = [v40 plistTypes];
    uint64_t v42 = [v4 decodeObjectOfClasses:v41 forKey:@"entitlements"];
    entitlements = v5->_entitlements;
    v5->_entitlements = (NSDictionary *)v42;

    v5->_userElection = [v4 decodeIntegerForKey:@"userElection"];
    v5->_defaultUserElection = [v4 decodeIntegerForKey:@"defaultUserElection"];
    v5->_systemComponent = [v4 decodeBoolForKey:@"isSystemComponent"];
  }

  return v5;
}

- (id)UUID
{
  return objc_getProperty(self, a2, 64, 1);
}

- (id)entitlements
{
  return objc_getProperty(self, a2, 128, 1);
}

- (id)attributes
{
  return objc_getProperty(self, a2, 120, 1);
}

- (id)url
{
  return objc_getProperty(self, a2, 88, 1);
}

- (unsigned)userElection
{
  return self->_userElection;
}

- (unsigned)platform
{
  return self->_platform;
}

- (id)localizedName
{
  return objc_getProperty(self, a2, 72, 1);
}

- (BOOL)isSystemComponent
{
  return self->_systemComponent;
}

- (id)extensionDictionary
{
  return objc_getProperty(self, a2, 112, 1);
}

- (id)developerName
{
  return objc_getProperty(self, a2, 80, 1);
}

- (unsigned)defaultUserElection
{
  return self->_defaultUserElection;
}

- (id)containingURL
{
  return objc_getProperty(self, a2, 96, 1);
}

- (id)containingBundleRecord
{
  return objc_getProperty(self, a2, 56, 1);
}

- (id)bundleVersion
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_extensionDictionary, 0);
  objc_storeStrong((id *)&self->_sdkDictionary, 0);
  objc_storeStrong((id *)&self->_containingURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_developerName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_containingBundleRecord, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_extensionPointIdentifier, 0);
}

- (id)entitlementNamed:(id)a3 ofClass:(Class)a4
{
  id v6 = a3;
  v7 = [(_EXExtensionValueIdentity *)self entitlements];
  uint64_t v8 = objc_msgSend(v7, "_EX_objectForKey:ofClass:", v6, a4);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end