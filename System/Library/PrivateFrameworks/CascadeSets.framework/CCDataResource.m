@interface CCDataResource
+ (BOOL)databaseExistsAtURL:(id)a3;
+ (BOOL)directoryContainsDataResource:(id)a3;
+ (BOOL)enumerateDataResources:(id *)a3 setIdentifier:(id)a4 descriptors:(id)a5 container:(id)a6 includingTombstoned:(BOOL)a7 usingBlock:(id)a8;
+ (id)_databaseDirectoryURLFromResourceDirectoryURL:(id)a3;
+ (id)dataResourceForSet:(id)a3 inContainer:(id)a4;
+ (id)dataResourceFromSpecifier:(id)a3 inContainer:(id)a4;
+ (id)databaseURLFromParentDirectoryURL:(id)a3;
- (BMResourceContainer)container;
- (BMResourceSpecifier)specifier;
- (BOOL)clearTombstoneStatus:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)markTombstoned:(id)a3 error:(id *)a4;
- (CCDataResource)initWithSpecifier:(id)a3 container:(id)a4 resourceDirectoryURL:(id)a5;
- (NSURL)databaseDirectoryURL;
- (NSURL)databaseURL;
- (NSURL)resourceDirectoryURL;
- (id)description;
- (id)setWithError:(id *)a3;
- (id)tombstoneDate:(id *)a3;
- (unint64_t)hash;
- (unsigned)resourceStatus;
@end

@implementation CCDataResource

+ (id)dataResourceForSet:(id)a3 inContainer:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_class();
  v8 = [v6 toResourceSpecifier];

  v9 = [v7 dataResourceFromSpecifier:v8 inContainer:v5];

  return v9;
}

+ (id)dataResourceFromSpecifier:(id)a3 inContainer:(id)a4
{
  id v5 = (void *)MEMORY[0x263F29E70];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 pathForResource:v7 inContainer:v6];
  v9 = [NSURL fileURLWithPath:v8 isDirectory:1];
  v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSpecifier:v7 container:v6 resourceDirectoryURL:v9];

  return v10;
}

- (CCDataResource)initWithSpecifier:(id)a3 container:(id)a4 resourceDirectoryURL:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CCDataResource;
  v12 = [(CCDataResource *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_specifier, a3);
    objc_storeStrong((id *)&v13->_container, a4);
    objc_storeStrong((id *)&v13->_resourceDirectoryURL, a5);
    uint64_t v14 = [(id)objc_opt_class() _databaseDirectoryURLFromResourceDirectoryURL:v13->_resourceDirectoryURL];
    databaseDirectoryURL = v13->_databaseDirectoryURL;
    v13->_databaseDirectoryURL = (NSURL *)v14;

    v16 = objc_opt_class();
    v17 = [(CCDataResource *)v13 databaseDirectoryURL];
    uint64_t v18 = [v16 databaseURLFromParentDirectoryURL:v17];
    databaseURL = v13->_databaseURL;
    v13->_databaseURL = (NSURL *)v18;
  }
  return v13;
}

- (NSURL)databaseDirectoryURL
{
  return self->_databaseDirectoryURL;
}

+ (id)databaseURLFromParentDirectoryURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"Set.db"];
}

+ (id)_databaseDirectoryURLFromResourceDirectoryURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"Database"];
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"CCDataResource: %@", self->_resourceDirectoryURL];

  return v2;
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

+ (BOOL)databaseExistsAtURL:(id)a3
{
  return access((const char *)[a3 fileSystemRepresentation], 0) == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong((id *)&self->_databaseDirectoryURL, 0);
  objc_storeStrong((id *)&self->_resourceDirectoryURL, 0);
  objc_storeStrong((id *)&self->_container, 0);

  objc_storeStrong((id *)&self->_specifier, 0);
}

+ (BOOL)directoryContainsDataResource:(id)a3
{
  id v3 = a1;
  v4 = [a1 _databaseDirectoryURLFromResourceDirectoryURL:a3];
  id v5 = [v3 databaseURLFromParentDirectoryURL:v4];
  LOBYTE(v3) = [v3 databaseExistsAtURL:v5];

  return (char)v3;
}

- (unsigned)resourceStatus
{
  uint64_t v10 = 0;
  uint64_t v2 = [(CCDataResource *)self tombstoneDate:&v10];
  id v3 = (void *)v2;
  if (v10)
  {
    unsigned __int8 v4 = 0;
  }
  else if (v2)
  {
    id v5 = objc_opt_new();
    [v5 timeIntervalSinceDate:v3];
    double v7 = v6;

    if (v7 >= *(double *)&CCDataResourceTombstonedInterval) {
      char v8 = 3;
    }
    else {
      char v8 = 2;
    }
    if (v7 >= *(double *)&CCDataResourceDeletingInterval) {
      unsigned __int8 v4 = 4;
    }
    else {
      unsigned __int8 v4 = v8;
    }
  }
  else
  {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (id)tombstoneDate:(id *)a3
{
  unint64_t value = 0;
  ssize_t v4 = getxattr([(NSURL *)self->_databaseDirectoryURL fileSystemRepresentation], "com.apple.cascade.tombstonedate", &value, 8uLL, 0, 0);
  if (v4)
  {
    if (v4 < 0)
    {
      if (*__error() != 93)
      {
        id v5 = __biome_log_for_category();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          -[CCDataResource tombstoneDate:]();
        }

        double v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
        CCSetError(a3, v6);
      }
      ssize_t v4 = 0;
    }
    else
    {
      ssize_t v4 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)(value / 0xF4240)];
    }
  }

  return (id)v4;
}

- (BOOL)markTombstoned:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = [(CCDataResource *)self tombstoneDate:0];
  if (v7)
  {
    char v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v17 = self;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_249B92000, v8, OS_LOG_TYPE_DEFAULT, "Resesource: %@, has existing tombstone date: %@, not resetting", buf, 0x16u);
    }

    BOOL v9 = 1;
  }
  else
  {
    [v6 timeIntervalSince1970];
    uint64_t value = (uint64_t)(v10 * 1000000.0);
    int v11 = setxattr([(NSURL *)self->_databaseDirectoryURL fileSystemRepresentation], "com.apple.cascade.tombstonedate", &value, 8uLL, 0, 0);
    BOOL v9 = v11 == 0;
    v12 = __biome_log_for_category();
    v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CCDataResource markTombstoned:error:]();
      }

      v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
      CCSetError(a4, v13);
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v17 = self;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_249B92000, v13, OS_LOG_TYPE_DEFAULT, "Successfully set tombstone date for resource: %@, date: %@", buf, 0x16u);
    }
  }
  return v9;
}

- (BOOL)clearTombstoneStatus:(id *)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = [(CCDataResource *)self tombstoneDate:0];

  if (!v5)
  {
    char v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CCDataResource clearTombstoneStatus:]((uint64_t)self, v8);
    }
    goto LABEL_10;
  }
  int v6 = removexattr([(NSURL *)self->_databaseDirectoryURL fileSystemRepresentation], "com.apple.cascade.tombstonedate", 0);
  double v7 = __biome_log_for_category();
  char v8 = v7;
  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      v12 = self;
      _os_log_impl(&dword_249B92000, v8, OS_LOG_TYPE_DEFAULT, "Successfully cleared tombstone date for resource: %@", (uint8_t *)&v11, 0xCu);
    }
LABEL_10:
    BOOL v9 = 1;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[CCDataResource clearTombstoneStatus:]();
  }

  char v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
  CCSetError(a3, v8);
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (id)setWithError:(id *)a3
{
  return +[CCSet setFromResourceSpecifier:self->_specifier inContainer:self->_container error:a3];
}

- (unint64_t)hash
{
  return [(NSURL *)self->_resourceDirectoryURL hash];
}

- (BOOL)isEqual:(id)a3
{
  ssize_t v4 = (CCDataResource *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v6 = [(NSURL *)self->_resourceDirectoryURL path];
    double v7 = [(CCDataResource *)v5 resourceDirectoryURL];
    char v8 = [v7 path];
    char v9 = [v6 isEqualToString:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (BOOL)enumerateDataResources:(id *)a3 setIdentifier:(id)a4 descriptors:(id)a5 container:(id)a6 includingTombstoned:(BOOL)a7 usingBlock:(id)a8
{
  BOOL v38 = a7;
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v35 = a4;
  id v34 = a5;
  id v11 = a6;
  v37 = (void (**)(id, CCDataResource *, unsigned char *))a8;
  char v50 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__7;
  v48 = __Block_byref_object_dispose__7;
  id v49 = 0;
  v12 = NSURL;
  uint64_t v13 = [MEMORY[0x263F29E70] setsDirectoryInContainer:v11];
  uint64_t v14 = [v12 fileURLWithPath:v13 isDirectory:1];

  if (v35)
  {
    objc_msgSend(MEMORY[0x263F29E98], "resourceFromContainer:withType:name:descriptors:", v11, 4);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = [MEMORY[0x263F29E70] pathForResource:v15 inContainer:v11];
    v36 = [NSURL fileURLWithPath:v16 isDirectory:1];

    if (+[CCDataResource directoryContainsDataResource:v36])
    {
      v17 = [[CCDataResource alloc] initWithSpecifier:v15 container:v11 resourceDirectoryURL:v36];
      if (!CCDataResourceStatusIsNotDiscoverable([(CCDataResource *)v17 resourceStatus])
        || v38)
      {
        v37[2](v37, v17, &v50);
        if (v50)
        {

          BOOL v18 = 1;
          goto LABEL_30;
        }
      }
    }
  }
  else
  {
    v36 = v14;
  }
  id v19 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v20 = objc_opt_new();
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __108__CCDataResource_enumerateDataResources_setIdentifier_descriptors_container_includingTombstoned_usingBlock___block_invoke;
  v43[3] = &unk_26527A970;
  v43[4] = &v44;
  id v15 = [v19 enumeratorAtURL:v36 includingPropertiesForKeys:v20 options:4 errorHandler:v43];

  if (v15)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v15 = v15;
    uint64_t v21 = [v15 countByEnumeratingWithState:&v39 objects:v51 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v40;
LABEL_13:
      uint64_t v23 = 0;
      while (1)
      {
        if (*(void *)v40 != v22) {
          objc_enumerationMutation(v15);
        }
        v24 = *(void **)(*((void *)&v39 + 1) + 8 * v23);
        v25 = (void *)MEMORY[0x24C5B1100]();
        if (+[CCDataResource directoryContainsDataResource:v24])
        {
          v26 = (void *)MEMORY[0x263F29E70];
          v27 = [v24 path];
          v28 = [v26 resourceFromDataResourcePath:v27 inContainer:v11];

          v29 = [[CCDataResource alloc] initWithSpecifier:v28 container:v11 resourceDirectoryURL:v24];
          if (CCDataResourceStatusIsNotDiscoverable([(CCDataResource *)v29 resourceStatus])
            && !v38)
          {
            BOOL v31 = 1;
          }
          else
          {
            v37[2](v37, v29, &v50);
            BOOL v31 = v50 == 0;
          }
        }
        else
        {
          BOOL v31 = 1;
        }
        if (!v31) {
          break;
        }
        if (v21 == ++v23)
        {
          uint64_t v21 = [v15 countByEnumeratingWithState:&v39 objects:v51 count:16];
          if (v21) {
            goto LABEL_13;
          }
          break;
        }
      }
    }

    CCSetError(a3, (id)v45[5]);
    BOOL v18 = v45[5] == 0;
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_30:

  _Block_object_dispose(&v44, 8);
  return v18;
}

uint64_t __108__CCDataResource_enumerateDataResources_setIdentifier_descriptors_container_includingTombstoned_usingBlock___block_invoke(uint64_t a1, int a2, id obj)
{
  return 0;
}

- (BMResourceSpecifier)specifier
{
  return self->_specifier;
}

- (BMResourceContainer)container
{
  return self->_container;
}

- (NSURL)resourceDirectoryURL
{
  return self->_resourceDirectoryURL;
}

- (void)tombstoneDate:.cold.1()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_249B92000, v1, v2, "Could not retrieve tombstone xattr for resource: %@, error: %s", v3, v4, v5, v6, v7);
}

- (void)markTombstoned:error:.cold.1()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_249B92000, v1, v2, "Could not set tombstone xattr for resource: %@, error: %s", v3, v4, v5, v6, v7);
}

- (void)clearTombstoneStatus:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_249B92000, a2, OS_LOG_TYPE_DEBUG, "Resource: %@ has no existing tombstone date, not clearing", (uint8_t *)&v2, 0xCu);
}

- (void)clearTombstoneStatus:.cold.2()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_249B92000, v1, v2, "Could not remove tombstone xattr for resource: %@, error: %s", v3, v4, v5, v6, v7);
}

@end