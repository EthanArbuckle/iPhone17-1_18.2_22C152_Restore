@interface DDSTrialAsset
+ (id)attributesWithLocalURL:(id)a3;
+ (id)createWithExperimentIdentifiers:(id)a3 localURL:(id)a4;
- (BOOL)isEqual:(id)a3;
- (DDSTrialAsset)initWithExperimentIdentifiers:(id)a3 attributes:(id)a4 localURL:(id)a5;
- (DDSTrialExperimentIdentifiers)experimentIdentifiers;
- (id)description;
- (unint64_t)hash;
@end

@implementation DDSTrialAsset

+ (id)attributesWithLocalURL:(id)a3
{
  v3 = [MEMORY[0x1E4F28B50] bundleWithURL:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 URLForResource:@"Info" withExtension:@"plist"];
    if (v5)
    {
      v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v5];
      v7 = [v6 objectForKey:@"MobileAssetProperties"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v8 = [v6 objectForKey:@"MobileAssetProperties"];
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)createWithExperimentIdentifiers:(id)a3 localURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 attributesWithLocalURL:v7];
  if (v8)
  {
    v9 = [v7 URLByAppendingPathComponent:@"AssetData"];

    v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    v11 = [v9 path];
    char v12 = [v10 fileExistsAtPath:v11];

    if (v12)
    {
      v13 = [[DDSTrialAsset alloc] initWithExperimentIdentifiers:v6 attributes:v8 localURL:v9];
    }
    else
    {
      v15 = DefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[DDSTrialAsset createWithExperimentIdentifiers:localURL:]((uint64_t)v9, v15);
      }

      v13 = 0;
    }
    id v7 = v9;
  }
  else
  {
    v14 = DefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[DDSTrialAsset createWithExperimentIdentifiers:localURL:]((uint64_t)v7, v14);
    }

    v13 = 0;
  }

  return v13;
}

- (DDSTrialAsset)initWithExperimentIdentifiers:(id)a3 attributes:(id)a4 localURL:(id)a5
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DDSTrialAsset;
  v10 = [(DDSAsset *)&v17 initWithAttributes:a4 localURL:v9];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    experimentIdentifiers = v10->_experimentIdentifiers;
    v10->_experimentIdentifiers = (DDSTrialExperimentIdentifiers *)v11;

    v18[0] = @"localURL";
    v18[1] = @"experimentIdentifiers";
    v19[0] = v9;
    v19[1] = v8;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    uint64_t v14 = [v13 description];
    description = v10->_description;
    v10->_description = (NSString *)v14;
  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6
    && (v11.receiver = self,
        v11.super_class = (Class)DDSTrialAsset,
        [(DDSAsset *)&v11 isEqual:v6]))
  {
    id v7 = [(DDSTrialAsset *)self experimentIdentifiers];
    id v8 = [v6 experimentIdentifiers];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)DDSTrialAsset;
  unint64_t v3 = [(DDSAsset *)&v7 hash];
  id v4 = [(DDSTrialAsset *)self experimentIdentifiers];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (id)description
{
  return objc_getProperty(self, a2, 120, 1);
}

- (DDSTrialExperimentIdentifiers)experimentIdentifiers
{
  return (DDSTrialExperimentIdentifiers *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentIdentifiers, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

+ (void)createWithExperimentIdentifiers:(uint64_t)a1 localURL:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E41D6000, a2, OS_LOG_TYPE_ERROR, "Failed to create trial asset for url attributes missing: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)createWithExperimentIdentifiers:(uint64_t)a1 localURL:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E41D6000, a2, OS_LOG_TYPE_ERROR, "Failed to create trial asset, AssetData directory doesn't exist: %@", (uint8_t *)&v2, 0xCu);
}

@end