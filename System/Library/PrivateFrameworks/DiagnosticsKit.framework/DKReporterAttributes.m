@interface DKReporterAttributes
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToReportGeneratorAttributes:(id)a3;
- (BOOL)isHeadless;
- (DKReporterAttributes)initWithExtension:(id)a3;
- (NSExtension)extension;
- (NSSet)manifest;
- (NSString)bundleIdentifier;
- (NSString)name;
- (NSString)version;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_validateAndAddDomain:(id)a3 withInfo:(id)a4 toManifest:(id)a5;
- (void)_validateAndAddExtensionManifest:(id)a3 toManifest:(id)a4;
- (void)setUuid:(id)a3;
@end

@implementation DKReporterAttributes

- (void)_validateAndAddDomain:(id)a3 withInfo:(id)a4 toManifest:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v19 = a5;
  v9 = [v8 alwaysGetKey:@"DKReporterManifestVersion" ofType:objc_opt_class()];
  v10 = [v8 alwaysGetKey:@"DKReporterManifestResources" ofType:objc_opt_class()];
  v11 = [MEMORY[0x263EFF9C0] set];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v11 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  v18 = +[DKComponentIdentity componentIdentityWithDomain:v7 version:v9 resources:v11];
  if (v18) {
    [v19 addObject:v18];
  }
}

- (void)_validateAndAddExtensionManifest:(id)a3 toManifest:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = [v6 alwaysGetKey:v12 ofType:objc_opt_class()];
          [(DKReporterAttributes *)self _validateAndAddDomain:v12 withInfo:v13 toManifest:v7];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (DKReporterAttributes)initWithExtension:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DKReporterAttributes;
  id v6 = [(DKReporterAttributes *)&v23 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F08C38] UUID];
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v7;

    objc_storeStrong((id *)&v6->_extension, a3);
    uint64_t v9 = [v5 infoDictionary];
    uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263EFFAA0]];
    version = v6->_version;
    v6->_version = (NSString *)v10;

    uint64_t v12 = [v5 attributes];
    uint64_t v13 = [v12 objectForKeyedSubscript:@"DKReporterName"];
    name = v6->_name;
    v6->_name = (NSString *)v13;

    long long v15 = [v5 attributes];
    uint64_t v16 = [v15 objectForKeyedSubscript:@"DKBundleIdentifier"];
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v16;

    if (!v6->_bundleIdentifier) {
      objc_storeStrong((id *)&v6->_bundleIdentifier, @"Default");
    }
    v6->_headless = 1;
    uint64_t v18 = [MEMORY[0x263EFF9C0] set];
    uint64_t v19 = [v5 attributes];
    long long v20 = [v19 alwaysGetKey:@"DKReporterManifest" ofType:objc_opt_class()];

    [(DKReporterAttributes *)v6 _validateAndAddExtensionManifest:v20 toManifest:v18];
    manifest = v6->_manifest;
    v6->_manifest = (NSSet *)v18;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_version copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSString *)self->_name copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSSet *)self->_manifest copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  objc_storeStrong((id *)(v5 + 16), self->_extension);
  uint64_t v12 = [(NSUUID *)self->_uuid copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  return (id)v5;
}

- (unint64_t)hash
{
  v2 = [(DKReporterAttributes *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqualToReportGeneratorAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DKReporterAttributes *)self uuid];
  uint64_t v6 = [v4 uuid];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DKReporterAttributes *)a3;
  BOOL v5 = self == v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = [(DKReporterAttributes *)self isEqualToReportGeneratorAttributes:v4];
  }

  return v5;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  uint64_t v6 = [(DKReporterAttributes *)self name];
  uint64_t v7 = [(DKReporterAttributes *)self version];
  uint64_t v8 = [(DKReporterAttributes *)self uuid];
  uint64_t v9 = [v3 stringWithFormat:@"<%@: %p; %@, version: %@, uuid: %@>", v5, self, v6, v7, v8];

  return v9;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (BOOL)isHeadless
{
  return self->_headless;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)version
{
  return self->_version;
}

- (NSSet)manifest
{
  return self->_manifest;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

@end