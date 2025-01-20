@interface _LSBoundIconInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)documentAllowOverride;
- (BOOL)isBadge;
- (NSDictionary)bundleIconsDictionary;
- (NSString)applicationIdentifier;
- (NSURL)resourcesDirectoryURL;
- (_LSBoundIconInfo)initWithCoder:(id)a3;
- (uint64_t)fileNames;
- (uint64_t)iconsDictionary;
- (uint64_t)setBadge:(uint64_t)result;
- (uint64_t)setDocumentAllowOverride:(uint64_t)result;
- (uint64_t)setPrerendered:(uint64_t)result;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setCacheKey:(void *)a1;
- (void)setContainerURL:(uint64_t)a1;
- (void)setDataContainerURL:(uint64_t)a1;
- (void)setFileNames:(void *)a1;
- (void)setIconsDictionary:(void *)a1;
- (void)setResourcesDirectoryURL:(id)a3;
@end

@implementation _LSBoundIconInfo

- (void)setResourcesDirectoryURL:(id)a3
{
}

- (uint64_t)setPrerendered:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 8) = a2;
  }
  return result;
}

- (void)setIconsDictionary:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 48);
  }
}

- (void)setFileNames:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 64);
  }
}

- (void)setDataContainerURL:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)setContainerURL:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)setCacheKey:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 56);
  }
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileNames, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_iconsDictionary, 0);
  objc_storeStrong((id *)&self->_dataContainerURL, 0);
  objc_storeStrong((id *)&self->_containerURL, 0);
  objc_storeStrong((id *)&self->_resourcesDirectoryURL, 0);

  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

- (_LSBoundIconInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_LSBoundIconInfo;
  v5 = [(_LSBoundIconInfo *)&v21 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"applicationIdentifier");
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"containerURL");
    containerURL = v5->_containerURL;
    v5->_containerURL = (NSURL *)v8;

    uint64_t v10 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"dataContainerURL");
    dataContainerURL = v5->_dataContainerURL;
    v5->_dataContainerURL = (NSURL *)v10;

    uint64_t v12 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"resourcesDirectoryURL");
    resourcesDirectoryURL = v5->_resourcesDirectoryURL;
    v5->_resourcesDirectoryURL = (NSURL *)v12;

    uint64_t v14 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"iconsDictionary");
    iconsDictionary = v5->_iconsDictionary;
    v5->_iconsDictionary = (_LSLazyPropertyList *)v14;

    uint64_t v16 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"cacheKey");
    cacheKey = v5->_cacheKey;
    v5->_cacheKey = (NSString *)v16;

    uint64_t v18 = objc_msgSend(v4, "ls_decodeArrayWithValuesOfClass:forKey:", objc_opt_class(), @"fileNames");
    fileNames = v5->_fileNames;
    v5->_fileNames = (NSArray *)v18;

    v5->_prerendered = [v4 decodeBoolForKey:@"prerendered"];
    v5->_badge = [v4 decodeBoolForKey:@"badge"];
    v5->_documentAllowOverride = [v4 decodeBoolForKey:@"documentAllowOverride"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  applicationIdentifier = self->_applicationIdentifier;
  id v5 = a3;
  [v5 encodeObject:applicationIdentifier forKey:@"applicationIdentifier"];
  [v5 encodeObject:self->_containerURL forKey:@"containerURL"];
  [v5 encodeObject:self->_dataContainerURL forKey:@"dataContainerURL"];
  [v5 encodeObject:self->_resourcesDirectoryURL forKey:@"resourcesDirectoryURL"];
  [v5 encodeObject:self->_iconsDictionary forKey:@"iconsDictionary"];
  [v5 encodeObject:self->_cacheKey forKey:@"cacheKey"];
  [v5 encodeObject:self->_fileNames forKey:@"fileNames"];
  [v5 encodeBool:self->_prerendered forKey:@"prerendered"];
  [v5 encodeBool:self->_badge forKey:@"badge"];
  [v5 encodeBool:self->_documentAllowOverride forKey:@"documentAllowOverride"];
}

- (NSDictionary)bundleIconsDictionary
{
  v2 = self;
  v20[1] = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (_LSBoundIconInfo *)self->_iconsDictionary;
  }
  v3 = -[_LSLazyPropertyList propertyList](self);
  if (v2) {
    iconsDictionary = v2->_iconsDictionary;
  }
  else {
    iconsDictionary = 0;
  }
  id v5 = iconsDictionary;
  uint64_t v6 = [(_LSLazyPropertyList *)v5 objectForKey:@"CFBundlePrimaryIcon" ofClass:objc_opt_class()];

  if (v6) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v2 == 0;
  }
  if (!v7)
  {
    uint64_t v8 = v2->_fileNames;
    if (v8)
    {
      v9 = v8;
      if ([(NSArray *)v8 count] < 2)
      {
        uint64_t v10 = [(NSArray *)v9 firstObject];
        char v11 = [v10 isEqual:@"-"];

        if (v11) {
          goto LABEL_14;
        }
      }
      else
      {
      }
      v17 = @"CFBundleIconFiles";
      fileNames = v2->_fileNames;
      v19 = @"CFBundlePrimaryIcon";
      uint64_t v12 = (void *)MEMORY[0x1E4F1C9E8];
      v13 = fileNames;
      uint64_t v14 = [v12 dictionaryWithObjects:&fileNames forKeys:&v17 count:1];
      v20[0] = v14;
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];

      v3 = (void *)v15;
    }
  }
LABEL_14:

  return (NSDictionary *)v3;
}

- (uint64_t)iconsDictionary
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (uint64_t)fileNames
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (NSURL)resourcesDirectoryURL
{
  return self->_resourcesDirectoryURL;
}

- (BOOL)isBadge
{
  if (result) {
    return *(unsigned char *)(result + 9) != 0;
  }
  return result;
}

- (uint64_t)setBadge:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 9) = a2;
  }
  return result;
}

- (BOOL)documentAllowOverride
{
  if (result) {
    return *(unsigned char *)(result + 10) != 0;
  }
  return result;
}

- (uint64_t)setDocumentAllowOverride:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 10) = a2;
  }
  return result;
}

@end