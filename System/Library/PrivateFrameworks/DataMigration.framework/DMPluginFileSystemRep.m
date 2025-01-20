@interface DMPluginFileSystemRep
+ (id)_pathsContainingPossiblePluginDirectory;
+ (id)allReps;
- (BOOL)isBundleValid;
- (DMPluginFileSystemRep)initWithName:(id)a3 atEnclosingPath:(id)a4;
- (NSString)bundleIdentifier;
- (NSString)name;
- (NSString)path;
@end

@implementation DMPluginFileSystemRep

+ (id)_pathsContainingPossiblePluginDirectory
{
  return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
}

+ (id)allReps
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v2 = [a1 _pathsContainingPossiblePluginDirectory];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v39;
    v6 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      uint64_t v7 = 0;
      v8 = v6;
      do
      {
        if (*(void *)v39 != v5) {
          objc_enumerationMutation(v2);
        }
        v9 = [*(id *)(*((void *)&v38 + 1) + 8 * v7) stringByAppendingPathComponent:@"DataClassMigrators"];
        v6 = [v8 arrayByAddingObject:v9];

        ++v7;
        v8 = v6;
      }
      while (v4 != v7);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v4);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v24 = v2;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v6;
  uint64_t v28 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v28)
  {
    uint64_t v26 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        v13 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v33 = 0;
        v14 = [v13 contentsOfDirectoryAtPath:v12 error:&v33];
        id v15 = v33;

        v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
        _DMLogFunc(v27, 7, @"Found %@ items in migration plugin directory %@. Error: %@");

        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v16 = v14;
        uint64_t v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v42, 16, v23, v12, v15, v24);
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v30;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v30 != v19) {
                objc_enumerationMutation(v16);
              }
              v21 = [[DMPluginFileSystemRep alloc] initWithName:*(void *)(*((void *)&v29 + 1) + 8 * j) atEnclosingPath:v12];
              if (v21) {
                [v10 addObject:v21];
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v42 count:16];
          }
          while (v18);
        }
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v28);
  }

  return v10;
}

- (DMPluginFileSystemRep)initWithName:(id)a3 atEnclosingPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)DMPluginFileSystemRep;
  v8 = [(DMPluginFileSystemRep *)&v18 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v7 stringByAppendingPathComponent:v6];
    path = v8->_path;
    v8->_path = (NSString *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28B50] bundleWithPath:v8->_path];
    bundle = v8->_bundle;
    v8->_bundle = (NSBundle *)v13;

    uint64_t v15 = [(NSBundle *)v8->_bundle bundleIdentifier];
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v15;
  }
  return v8;
}

- (BOOL)isBundleValid
{
  return self->_bundle != 0;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end