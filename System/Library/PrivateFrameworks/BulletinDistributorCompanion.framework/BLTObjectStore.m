@interface BLTObjectStore
- (BLTObjectStore)initWithPath:(id)a3 elementClass:(Class)a4;
- (id)keys;
- (id)objectForKey:(id)a3;
- (void)keys;
- (void)removeObjectForKey:(id)a3;
- (void)storeObject:(id)a3 withKey:(id)a4;
@end

@implementation BLTObjectStore

- (BLTObjectStore)initWithPath:(id)a3 elementClass:(Class)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BLTObjectStore;
  v8 = [(BLTObjectStore *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_path, a3);
    v9->_elementClass = a4;
  }

  return v9;
}

- (id)keys
{
  v37[1] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08850] defaultManager];
  path = self->_path;
  uint64_t v36 = *MEMORY[0x263F080A8];
  v37[0] = *MEMORY[0x263F080B0];
  v5 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
  id v34 = 0;
  [v3 createDirectoryAtPath:path withIntermediateDirectories:1 attributes:v5 error:&v34];
  id v6 = v34;

  if (v6)
  {
    id v7 = blt_general_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BLTObjectStore keys]();
    }
    id v27 = 0;
  }
  else
  {
    v8 = [MEMORY[0x263F08850] defaultManager];
    v9 = self->_path;
    id v33 = 0;
    id v7 = [v8 contentsOfDirectoryAtPath:v9 error:&v33];
    id v6 = v33;

    if (v6)
    {
      obj = blt_general_log();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
        -[BLTObjectStore keys]();
      }
      id v27 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", -[NSObject count](v7, "count"));
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      obj = v7;
      uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        v23 = v7;
        v24 = 0;
        uint64_t v12 = *(void *)v30;
        do
        {
          uint64_t v13 = 0;
          uint64_t v25 = v11;
          do
          {
            if (*(void *)v30 != v12) {
              objc_enumerationMutation(obj);
            }
            v14 = *(void **)(*((void *)&v29 + 1) + 8 * v13);
            v15 = objc_msgSend(v14, "fromHex", v23, v24);
            if (v15)
            {
              [v27 addObject:v15];
            }
            else
            {
              v16 = [v14 hex];
              v17 = [(NSString *)self->_path stringByAppendingPathComponent:v14];
              v18 = self;
              v19 = [(NSString *)self->_path stringByAppendingPathComponent:v16];
              v20 = [MEMORY[0x263F08850] defaultManager];
              id v28 = 0;
              [v20 moveItemAtPath:v17 toPath:v19 error:&v28];
              id v21 = v28;

              if (!v21) {
                [v27 addObject:v14];
              }

              self = v18;
              uint64_t v11 = v25;
            }

            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
        }
        while (v11);
        id v7 = v23;
        id v6 = v24;
      }
    }
  }
  return v27;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = [v4 hex];
  id v6 = [(NSString *)self->_path stringByAppendingPathComponent:v5];
  id v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v6];
  if (v7)
  {
    id v14 = 0;
    v8 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v7 error:&v14];
    id v9 = v14;
    if (v9)
    {
      uint64_t v10 = blt_general_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[BLTObjectStore objectForKey:]((uint64_t)v9, v10);
      }
    }
    uint64_t v11 = [v8 decodeObjectOfClass:self->_elementClass forKey:*MEMORY[0x263F081D0]];
    [v8 finishDecoding];
  }
  else
  {
    uint64_t v12 = blt_general_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[BLTObjectStore objectForKey:](v12);
    }

    uint64_t v11 = 0;
  }

  return v11;
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = [a3 hex];
  v5 = [(NSString *)self->_path stringByAppendingPathComponent:v4];
  id v6 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v7 = 0;
  [v6 removeItemAtPath:v5 error:&v7];
}

- (void)storeObject:(id)a3 withKey:(id)a4
{
  v27[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v25 = 0;
  v8 = [MEMORY[0x263F08850] defaultManager];
  char v9 = [v8 fileExistsAtPath:self->_path isDirectory:&v25];
  if (v25) {
    char v10 = v9;
  }
  else {
    char v10 = 0;
  }

  if (v10) {
    goto LABEL_6;
  }
  uint64_t v11 = [MEMORY[0x263F08850] defaultManager];
  path = self->_path;
  uint64_t v26 = *MEMORY[0x263F080A8];
  v27[0] = *MEMORY[0x263F080B0];
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
  id v24 = 0;
  [v11 createDirectoryAtPath:path withIntermediateDirectories:1 attributes:v13 error:&v24];
  id v14 = v24;

  if (!v14)
  {
LABEL_6:
    v15 = [v7 hex];
    v16 = [(NSString *)self->_path stringByAppendingPathComponent:v15];
    v17 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
    v18 = v17;
    if (v6 && v17)
    {
      [v17 encodeObject:v6 forKey:*MEMORY[0x263F081D0]];
      v19 = [v18 encodedData];
      id v23 = 0;
      [v19 writeToFile:v16 options:268435457 error:&v23];
      id v20 = v23;
    }
    else
    {
      id v21 = blt_general_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[BLTObjectStore storeObject:withKey:](v21);
      }

      id v20 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.bulletindistributor.objectstore" code:123 userInfo:&unk_26D607BE0];
    }
    if (v20)
    {
      v22 = blt_general_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[BLTObjectStore storeObject:withKey:]();
      }
    }
    id v14 = 0;
  }
}

- (void).cxx_destruct
{
}

- (void)keys
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_222F4C000, v0, v1, "%s error creating object store directory: %@", v2, v3, v4, v5, 2u);
}

- (void)objectForKey:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_222F4C000, log, OS_LOG_TYPE_ERROR, "object data not found in store", v1, 2u);
}

- (void)objectForKey:.cold.2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_222F4C000, v0, v1, "%s: %@ exception loading object from %@", v2);
}

- (void)objectForKey:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222F4C000, a2, OS_LOG_TYPE_ERROR, "Error initializing unarchiver for object store: %@", (uint8_t *)&v2, 0xCu);
}

- (void)storeObject:withKey:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_222F4C000, v0, v1, "%s: %@ error writing data to %@", v2);
}

- (void)storeObject:withKey:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_222F4C000, v0, v1, "%s: %@ exception archiving object", v2, v3, v4, v5, 2u);
}

- (void)storeObject:(os_log_t)log withKey:.cold.3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_222F4C000, log, OS_LOG_TYPE_ERROR, "Error storing object in object store", v1, 2u);
}

@end