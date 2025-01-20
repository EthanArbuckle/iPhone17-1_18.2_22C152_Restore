@interface ISIconResourceLocator
+ (BOOL)supportsSecureCoding;
+ (id)genericIconrResourceLocator;
+ (id)resourceLocatorWithLSIconResourceLocator:(id)a3;
+ (id)resourceLocatorWithType:(id)a3;
- (BOOL)allowLocalizedIcon;
- (ISIconResourceLocator)initWithCoder:(id)a3;
- (NSDictionary)iconsDictionary;
- (NSString)bundleIdentifier;
- (NSString)preferedResourceName;
- (NSURL)resourceDirectoryURL;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setIconsDictionary:(id)a3;
- (void)setPreferedResourceName:(id)a3;
- (void)setResourceDirectoryURL:(id)a3;
@end

@implementation ISIconResourceLocator

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)resourceLocatorWithLSIconResourceLocator:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ISIconResourceLocator);
  v5 = [v3 applicationIdentifier];
  [(ISIconResourceLocator *)v4 setBundleIdentifier:v5];

  v6 = [v3 bundleIconsDictionary];
  [(ISIconResourceLocator *)v4 setIconsDictionary:v6];

  [(ISIconResourceLocator *)v4 setPreferedResourceName:0];
  v7 = [v3 resourcesDirectoryURL];

  [(ISIconResourceLocator *)v4 setResourceDirectoryURL:v7];
  return v4;
}

+ (id)resourceLocatorWithType:(id)a3
{
  id v3 = a3;
  v4 = [[ISIconTypeResourceLocator alloc] initWithType:v3];

  return v4;
}

+ (id)genericIconrResourceLocator
{
  if (genericIconrResourceLocator_onceToken != -1) {
    dispatch_once(&genericIconrResourceLocator_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)genericIconrResourceLocator_locator;
  return v2;
}

uint64_t __52__ISIconResourceLocator_genericIconrResourceLocator__block_invoke()
{
  v0 = objc_alloc_init(ISIconResourceLocator);
  v1 = (void *)genericIconrResourceLocator_locator;
  genericIconrResourceLocator_locator = (uint64_t)v0;

  [(id)genericIconrResourceLocator_locator setBundleIdentifier:@"com.apple.coretypes"];
  [(id)genericIconrResourceLocator_locator setIconsDictionary:0];
  v2 = (void *)genericIconrResourceLocator_locator;
  return [v2 setPreferedResourceName:0];
}

- (void)encodeWithCoder:(id)a3
{
  resourceDirectoryURL = self->_resourceDirectoryURL;
  id v5 = a3;
  [v5 encodeObject:resourceDirectoryURL forKey:@"_resourceDirectoryURL"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"_bundleIdentifier"];
  [v5 encodeObject:self->_iconsDictionary forKey:@"_iconsDictionary"];
  [v5 encodeObject:self->_preferedResourceName forKey:@"_preferedResourceName"];
}

- (ISIconResourceLocator)initWithCoder:(id)a3
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ISIconResourceLocator;
  id v5 = [(ISIconResourceLocator *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_resourceDirectoryURL"];
    resourceDirectoryURL = v5->_resourceDirectoryURL;
    v5->_resourceDirectoryURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v19[3] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
    v12 = [v10 setWithArray:v11];

    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"_iconsDictionary"];
    iconsDictionary = v5->_iconsDictionary;
    v5->_iconsDictionary = (NSDictionary *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_preferedResourceName"];
    preferedResourceName = v5->_preferedResourceName;
    v5->_preferedResourceName = (NSString *)v15;
  }
  return v5;
}

- (id)description
{
  preferedResourceName = (__CFString *)self->_preferedResourceName;
  if (!preferedResourceName) {
    preferedResourceName = @"DEFAULT";
  }
  return (id)[NSString stringWithFormat:@"Resources Bundle URL: %@, icons dict: %@, prefered name: %@", self->_resourceDirectoryURL, self->_iconsDictionary, preferedResourceName];
}

- (BOOL)allowLocalizedIcon
{
  v2 = [(ISIconResourceLocator *)self bundleIdentifier];
  char v3 = [v2 hasPrefix:@"com.apple."];

  return v3;
}

- (NSURL)resourceDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResourceDirectoryURL:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSDictionary)iconsDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIconsDictionary:(id)a3
{
}

- (NSString)preferedResourceName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPreferedResourceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferedResourceName, 0);
  objc_storeStrong((id *)&self->_iconsDictionary, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_resourceDirectoryURL, 0);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1AE771000, a2, OS_LOG_TYPE_FAULT, "Failed to decode ISIconResourceLocator with exception: %@", (uint8_t *)&v2, 0xCu);
}

@end