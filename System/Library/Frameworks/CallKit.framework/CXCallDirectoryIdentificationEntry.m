@interface CXCallDirectoryIdentificationEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)fromCache;
- (CXCallDirectoryIdentificationEntry)initWithCoder:(id)a3;
- (NSString)extensionIdentifier;
- (NSString)localizedExtensionContainingAppName;
- (NSString)localizedExtensionName;
- (NSString)localizedLabel;
- (NSURL)iconURL;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setExtensionIdentifier:(id)a3;
- (void)setFromCache:(BOOL)a3;
- (void)setIconURL:(id)a3;
- (void)setLocalizedExtensionContainingAppName:(id)a3;
- (void)setLocalizedExtensionName:(id)a3;
- (void)setLocalizedLabel:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CXCallDirectoryIdentificationEntry

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CXCallDirectoryIdentificationEntry *)self extensionIdentifier];
  v6 = [(CXCallDirectoryIdentificationEntry *)self localizedExtensionName];
  v7 = [(CXCallDirectoryIdentificationEntry *)self localizedExtensionContainingAppName];
  v8 = [(CXCallDirectoryIdentificationEntry *)self localizedLabel];
  v9 = [(CXCallDirectoryIdentificationEntry *)self iconURL];
  v10 = [v3 stringWithFormat:@"<%@ %p extensionIdentifier=%@ localizedExtensionName=%@ localizedExtensionContainingAppName=%@ localizedLabel=%@ iconURL=%@ type=%ld>", v4, self, v5, v6, v7, v8, v9, -[CXCallDirectoryIdentificationEntry type](self, "type")];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXCallDirectoryIdentificationEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallDirectoryIdentificationEntry *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_extensionIdentifier);
    v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    uint64_t v9 = [v8 copy];
    extensionIdentifier = v5->_extensionIdentifier;
    v5->_extensionIdentifier = (NSString *)v9;

    uint64_t v11 = objc_opt_class();
    v12 = NSStringFromSelector(sel_localizedExtensionName);
    v13 = [v4 decodeObjectOfClass:v11 forKey:v12];
    uint64_t v14 = [v13 copy];
    localizedExtensionName = v5->_localizedExtensionName;
    v5->_localizedExtensionName = (NSString *)v14;

    uint64_t v16 = objc_opt_class();
    v17 = NSStringFromSelector(sel_localizedExtensionContainingAppName);
    v18 = [v4 decodeObjectOfClass:v16 forKey:v17];
    uint64_t v19 = [v18 copy];
    localizedExtensionContainingAppName = v5->_localizedExtensionContainingAppName;
    v5->_localizedExtensionContainingAppName = (NSString *)v19;

    uint64_t v21 = objc_opt_class();
    v22 = NSStringFromSelector(sel_localizedLabel);
    v23 = [v4 decodeObjectOfClass:v21 forKey:v22];
    uint64_t v24 = [v23 copy];
    localizedLabel = v5->_localizedLabel;
    v5->_localizedLabel = (NSString *)v24;

    uint64_t v26 = objc_opt_class();
    v27 = NSStringFromSelector(sel_iconURL);
    v28 = [v4 decodeObjectOfClass:v26 forKey:v27];
    uint64_t v29 = [v28 copy];
    iconURL = v5->_iconURL;
    v5->_iconURL = (NSURL *)v29;

    v31 = NSStringFromSelector(sel_type);
    v5->_type = (int)[v4 decodeIntForKey:v31];

    v32 = NSStringFromSelector(sel_fromCache);
    v5->_fromCache = [v4 decodeBoolForKey:v32];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallDirectoryIdentificationEntry *)self extensionIdentifier];
  uint64_t v6 = NSStringFromSelector(sel_extensionIdentifier);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(CXCallDirectoryIdentificationEntry *)self localizedExtensionName];
  v8 = NSStringFromSelector(sel_localizedExtensionName);
  [v4 encodeObject:v7 forKey:v8];

  uint64_t v9 = [(CXCallDirectoryIdentificationEntry *)self localizedExtensionContainingAppName];
  v10 = NSStringFromSelector(sel_localizedExtensionContainingAppName);
  [v4 encodeObject:v9 forKey:v10];

  uint64_t v11 = [(CXCallDirectoryIdentificationEntry *)self localizedLabel];
  v12 = NSStringFromSelector(sel_localizedLabel);
  [v4 encodeObject:v11 forKey:v12];

  v13 = [(CXCallDirectoryIdentificationEntry *)self iconURL];
  uint64_t v14 = NSStringFromSelector(sel_iconURL);
  [v4 encodeObject:v13 forKey:v14];

  int64_t v15 = [(CXCallDirectoryIdentificationEntry *)self type];
  uint64_t v16 = NSStringFromSelector(sel_type);
  [v4 encodeInt:v15 forKey:v16];

  BOOL v17 = [(CXCallDirectoryIdentificationEntry *)self fromCache];
  NSStringFromSelector(sel_fromCache);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v17 forKey:v18];
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void)setExtensionIdentifier:(id)a3
{
}

- (NSString)localizedExtensionName
{
  return self->_localizedExtensionName;
}

- (void)setLocalizedExtensionName:(id)a3
{
}

- (NSString)localizedExtensionContainingAppName
{
  return self->_localizedExtensionContainingAppName;
}

- (void)setLocalizedExtensionContainingAppName:(id)a3
{
}

- (NSString)localizedLabel
{
  return self->_localizedLabel;
}

- (void)setLocalizedLabel:(id)a3
{
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)fromCache
{
  return self->_fromCache;
}

- (void)setFromCache:(BOOL)a3
{
  self->_fromCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_localizedLabel, 0);
  objc_storeStrong((id *)&self->_localizedExtensionContainingAppName, 0);
  objc_storeStrong((id *)&self->_localizedExtensionName, 0);

  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
}

@end