@interface ICLAppExtensionRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (ICLAppExtensionRecord)initWithCoder:(id)a3;
- (ICLAppExtensionRecord)initWithLegacyRecordDictionary:(id)a3;
- (NSString)extensionOwnerBundleID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)legacyRecordDictionary;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setExtensionOwnerBundleID:(id)a3;
@end

@implementation ICLAppExtensionRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICLAppExtensionRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICLAppExtensionRecord;
  v5 = [(ICLBundleRecord *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionOwnerBundleID"];
    extensionOwnerBundleID = v5->_extensionOwnerBundleID;
    v5->_extensionOwnerBundleID = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICLAppExtensionRecord;
  id v4 = a3;
  [(ICLBundleRecord *)&v6 encodeWithCoder:v4];
  v5 = [(ICLAppExtensionRecord *)self extensionOwnerBundleID];
  [v4 encodeObject:v5 forKey:@"extensionOwnerBundleID"];
}

- (ICLAppExtensionRecord)initWithLegacyRecordDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICLAppExtensionRecord;
  v5 = [(ICLBundleRecord *)&v10 initWithLegacyRecordDictionary:v4];
  if (v5)
  {
    objc_super v6 = [v4 objectForKeyedSubscript:@"PluginOwnerBundleID"];
    objc_opt_class();
    id v7 = v6;
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    [(ICLAppExtensionRecord *)v5 setExtensionOwnerBundleID:v8];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ICLAppExtensionRecord;
  id v5 = -[ICLBundleRecord copyWithZone:](&v9, sel_copyWithZone_);
  objc_super v6 = [(ICLAppExtensionRecord *)self extensionOwnerBundleID];
  id v7 = (void *)[v6 copyWithZone:a3];
  [v5 setExtensionOwnerBundleID:v7];

  return v5;
}

- (id)legacyRecordDictionary
{
  v3 = objc_opt_new();
  v8.receiver = self;
  v8.super_class = (Class)ICLAppExtensionRecord;
  id v4 = [(ICLBundleRecord *)&v8 legacyRecordDictionary];
  [v3 addEntriesFromDictionary:v4];

  [v3 setObject:@"PluginKitPlugin" forKeyedSubscript:@"ApplicationType"];
  id v5 = [(ICLAppExtensionRecord *)self extensionOwnerBundleID];
  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"PluginOwnerBundleID"];
  }

  objc_super v6 = (void *)[v3 copy];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICLAppExtensionRecord *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v10.receiver = self,
          v10.super_class = (Class)ICLAppExtensionRecord,
          [(ICLBundleRecord *)&v10 isEqual:v4]))
    {
      id v5 = v4;
      objc_super v6 = [(ICLAppExtensionRecord *)self extensionOwnerBundleID];
      id v7 = [(ICLAppExtensionRecord *)v5 extensionOwnerBundleID];
      BOOL v8 = MICompareObjects(v6, v7);

      if (!v8 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)) {
        MOLogWrite();
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)ICLAppExtensionRecord;
  unint64_t v3 = [(ICLBundleRecord *)&v7 hash];
  id v4 = [(ICLAppExtensionRecord *)self extensionOwnerBundleID];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (NSString)extensionOwnerBundleID
{
  return self->_extensionOwnerBundleID;
}

- (void)setExtensionOwnerBundleID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end