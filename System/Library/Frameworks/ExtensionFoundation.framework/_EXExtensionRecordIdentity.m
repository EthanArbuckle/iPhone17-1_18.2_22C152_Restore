@interface _EXExtensionRecordIdentity
+ (BOOL)supportsSecureCoding;
- (BOOL)isSystemComponent;
- (BOOL)setUserElection:(unsigned __int8)a3 error:(id *)a4;
- (Class)classForCoder;
- (LSApplicationExtensionRecord)record;
- (LSExtensionPointRecord)extensionPoint;
- (_EXExtensionRecordIdentity)initWithApplicationExtensionRecord:(id)a3;
- (_EXExtensionRecordIdentity)initWithCoder:(id)a3;
- (_EXExtensionRecordIdentity)initWithPlugInKitProxy:(id)a3;
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
- (id)extensionSettingsKey;
- (id)localizedName;
- (id)sdkDictionary;
- (id)url;
- (unsigned)defaultUserElection;
- (unsigned)platform;
- (unsigned)userElection;
@end

@implementation _EXExtensionRecordIdentity

- (id)bundleIdentifier
{
  return (id)[(LSApplicationExtensionRecord *)self->_record bundleIdentifier];
}

- (id)extensionPointIdentifier
{
  v2 = [(LSApplicationExtensionRecord *)self->_record extensionPointRecord];
  v3 = [v2 identifier];

  return v3;
}

- (id)sdkDictionary
{
  v2 = [(LSApplicationExtensionRecord *)self->_record extensionPointRecord];
  v3 = [v2 SDKDictionary];

  if (objc_opt_respondsToSelector())
  {
    v4 = [v3 _expensiveDictionaryRepresentation];
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v4;
}

- (id)applicationExtensionRecord
{
  return self->_record;
}

- (_EXExtensionRecordIdentity)initWithApplicationExtensionRecord:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_EXExtensionRecordIdentity;
  v6 = [(_EXExtensionIdentity *)&v11 _init];
  v7 = (_EXExtensionRecordIdentity *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 3, a3);
    uint64_t v8 = [v5 extensionPointRecord];
    extensionPoint = v7->_extensionPoint;
    v7->_extensionPoint = (LSExtensionPointRecord *)v8;
  }
  return v7;
}

- (id)attributes
{
  v2 = [(_EXExtensionRecordIdentity *)self record];
  v3 = [v2 infoDictionary];
  v4 = [v3 objectForKey:@"EXAppExtensionAttributes" ofClass:objc_opt_class()];

  return v4;
}

- (LSApplicationExtensionRecord)record
{
  return (LSApplicationExtensionRecord *)objc_getProperty(self, a2, 24, 1);
}

- (id)url
{
  return (id)[(LSApplicationExtensionRecord *)self->_record URL];
}

- (id)entitlements
{
  v2 = [(LSApplicationExtensionRecord *)self->_record entitlements];
  if (objc_opt_respondsToSelector())
  {
    v3 = [v2 _expensiveDictionaryRepresentation];
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v3;
}

- (id)containingBundleRecord
{
  return (id)[(LSApplicationExtensionRecord *)self->_record containingBundleRecord];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionPoint, 0);

  objc_storeStrong((id *)&self->_record, 0);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (id)entitlementNamed:(id)a3 ofClass:(Class)a4
{
  id v6 = a3;
  v7 = [(_EXExtensionRecordIdentity *)self record];
  uint64_t v8 = [v7 entitlements];
  v9 = [v8 objectForKey:v6 ofClass:a4];

  return v9;
}

- (id)UUID
{
  return (id)[(LSApplicationExtensionRecord *)self->_record uniqueIdentifier];
}

- (unsigned)userElection
{
  v2 = [(_EXExtensionRecordIdentity *)self extensionSettingsKey];
  v3 = [NSClassFromString(&cfstr_Lssettingsstor.isa) sharedInstance];
  unsigned __int8 v4 = [v3 userElectionForExtensionKey:v2];

  return v4;
}

- (unsigned)platform
{
  return [(LSApplicationExtensionRecord *)self->_record platform];
}

- (id)localizedName
{
  return (id)[(LSApplicationExtensionRecord *)self->_record localizedName];
}

- (BOOL)isSystemComponent
{
  v2 = [(LSApplicationExtensionRecord *)self->_record containingBundleRecord];
  v3 = v2;
  if (v2) {
    BOOL v4 = [v2 developerType] == 1;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (id)extensionSettingsKey
{
  v26[5] = *MEMORY[0x1E4F143B8];
  v3 = [(_EXExtensionRecordIdentity *)self extensionPointIdentifier];
  int v4 = [v3 hasPrefix:@"com.apple."];

  if (v4)
  {
    id v5 = [(_EXExtensionRecordIdentity *)self bundleIdentifier];
  }
  else
  {
    v25 = [(_EXExtensionRecordIdentity *)self extensionPoint];
    v24 = [v25 parentAppRecord];
    uint64_t v6 = [v24 bundleIdentifier];
    v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = (__CFString *)v6;
    }
    else {
      uint64_t v8 = &stru_1EE2CDC90;
    }
    v26[0] = v8;
    v9 = [(_EXExtensionRecordIdentity *)self extensionPoint];
    v10 = [v9 parentAppRecord];
    uint64_t v11 = [v10 teamIdentifier];
    v12 = (void *)v11;
    if (v11) {
      v13 = (__CFString *)v11;
    }
    else {
      v13 = &stru_1EE2CDC90;
    }
    v26[1] = v13;
    uint64_t v14 = [(_EXExtensionRecordIdentity *)self extensionPointIdentifier];
    v15 = (void *)v14;
    if (v14) {
      v16 = (__CFString *)v14;
    }
    else {
      v16 = &stru_1EE2CDC90;
    }
    v26[2] = v16;
    v17 = [(_EXExtensionRecordIdentity *)self bundleIdentifier];
    v26[3] = v17;
    v18 = [(_EXExtensionRecordIdentity *)self record];
    uint64_t v19 = [v18 teamIdentifier];
    v20 = (void *)v19;
    if (v19) {
      v21 = (__CFString *)v19;
    }
    else {
      v21 = &stru_1EE2CDC90;
    }
    v26[4] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:5];
    id v5 = [v22 componentsJoinedByString:@":"];
  }

  return v5;
}

- (id)extensionDictionary
{
  v2 = [(LSApplicationExtensionRecord *)self->_record infoDictionary];
  v3 = [v2 objectForKey:@"NSExtension" ofClass:objc_opt_class()];

  return v3;
}

- (id)developerName
{
  v2 = [(LSApplicationExtensionRecord *)self->_record containingBundleRecord];
  int v3 = [v2 developerType];

  if (v3 == 1) {
    return @"Apple";
  }
  else {
    return &stru_1EE2CDC90;
  }
}

- (unsigned)defaultUserElection
{
  int v3 = [(_EXExtensionRecordIdentity *)self sdkDictionary];
  int v4 = objc_msgSend(v3, "_EX_objectForKey:ofClass:", @"EXDefaultUserElection", objc_opt_class());
  unsigned __int8 v5 = [v4 integerValue];

  if (v5 > 2uLL) {
    unsigned __int8 v5 = 0;
  }
  if (v5 == 1) {
    return 1;
  }
  v7 = [(LSApplicationExtensionRecord *)self->_record extensionPointRecord];
  uint64_t v8 = [v7 parentAppRecord];

  v9 = [(LSApplicationExtensionRecord *)self->_record containingBundleRecord];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v9 = 0;
  }
  if ([v8 isEqual:v9]) {
    unsigned __int8 v6 = 1;
  }
  else {
    unsigned __int8 v6 = v5;
  }

  return v6;
}

- (id)containingURL
{
  v2 = [(LSApplicationExtensionRecord *)self->_record containingBundleRecord];
  int v3 = [v2 URL];

  return v3;
}

- (id)bundleVersion
{
  return (id)[(LSApplicationExtensionRecord *)self->_record bundleVersion];
}

- (_EXExtensionRecordIdentity)initWithPlugInKitProxy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_EXExtensionRecordIdentity;
  unsigned __int8 v5 = [(_EXExtensionIdentity *)&v13 _init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F223A0]);
    v7 = [v4 pluginUUID];
    uint64_t v8 = [v6 initWithUUID:v7 error:0];
    record = v5->_record;
    v5->_record = (LSApplicationExtensionRecord *)v8;

    uint64_t v10 = [(LSApplicationExtensionRecord *)v5->_record extensionPointRecord];
    extensionPoint = v5->_extensionPoint;
    v5->_extensionPoint = (LSExtensionPointRecord *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXExtensionRecordIdentity)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = _EXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    unsigned __int8 v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    int v8 = 136315906;
    v9 = "false";
    __int16 v10 = 2080;
    uint64_t v11 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/EXExtension/Extension/EXE"
          "xtensionIdentity.m";
    __int16 v12 = 1024;
    int v13 = 94;
    __int16 v14 = 2112;
    v15 = v6;
    _os_log_fault_impl(&dword_191F29000, v4, OS_LOG_TYPE_FAULT, "%s - %s:%d: %@ cannot be decoded.", (uint8_t *)&v8, 0x26u);
  }
  __break(1u);
  return result;
}

- (BOOL)setUserElection:(unsigned __int8)a3 error:(id *)a4
{
  uint64_t v5 = a3;
  id v6 = [(_EXExtensionRecordIdentity *)self extensionSettingsKey];
  v7 = [NSClassFromString(&cfstr_Lssettingsstor.isa) sharedInstance];
  LOBYTE(a4) = [v7 setUserElection:v5 forExtensionKey:v6 error:a4];

  return (char)a4;
}

- (LSExtensionPointRecord)extensionPoint
{
  return (LSExtensionPointRecord *)objc_getProperty(self, a2, 32, 1);
}

@end