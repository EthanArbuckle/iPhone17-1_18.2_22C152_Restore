@interface LSPlugInQuery
+ (BOOL)supportsSecureCoding;
+ (id)pluginQuery;
+ (id)pluginQueryWithIdentifier:(id)a3;
+ (id)pluginQueryWithQueryDictionary:(id)a3 applyFilter:(id)a4;
+ (id)pluginQueryWithURL:(id)a3;
+ (id)pluginQueryWithUUID:(id)a3;
- (BOOL)_remoteResolutionIsExpensive;
- (BOOL)_requiresDatabaseMappingEntitlement;
- (BOOL)isEqual:(id)a3;
- (id)_init;
- (unint64_t)hash;
- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)sort:(BOOL)a3 pluginIDs:(id)a4 andYield:(id)a5 context:(LSContext *)a6;
@end

@implementation LSPlugInQuery

- (BOOL)_requiresDatabaseMappingEntitlement
{
  return 0;
}

- (void)sort:(BOOL)a3 pluginIDs:(id)a4 andYield:(id)a5 context:(LSContext *)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  v12 = (uint64_t (**)(void, void, void))v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_22:
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"LSPlugInQuery.m", 96, @"Invalid parameter not satisfying: %@", @"yield != nil" object file lineNumber description];

    if (a6) {
      goto LABEL_4;
    }
    goto LABEL_23;
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"LSPlugInQuery.m", 95, @"Invalid parameter not satisfying: %@", @"pluginIDs != nil" object file lineNumber description];

  if (!v12) {
    goto LABEL_22;
  }
LABEL_3:
  if (a6) {
    goto LABEL_4;
  }
LABEL_23:
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"LSPlugInQuery.m", 97, @"Invalid parameter not satisfying: %@", @"context != NULL" object file lineNumber description];

LABEL_4:
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v10;
  uint64_t v13 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v33;
    v16 = &off_1E522B000;
    v30 = a6;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v32 + 1) + 8 * v17);
        v19 = (void *)MEMORY[0x18530F680]();
        uint64_t v20 = [v18 unsignedLongLongValue];
        v21 = [v16[49] plugInKitProxyForPlugin:v20 withContext:a6];
        if (v21)
        {
          if ((((uint64_t (**)(void, void *, void))v12)[2](v12, v21, 0) & 1) == 0)
          {

            goto LABEL_20;
          }
        }
        else
        {
          v22 = (uint64_t *)a6;
          v23 = v12;
          v24 = v16;
          if (_LSGetPlugin(*v22, v20)) {
            v25 = (__CFString *)_CSStringCopyCFString();
          }
          else {
            v25 = @"<unknown>";
          }
          v26 = _LSDefaultLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v37 = v25;
            __int16 v38 = 2048;
            uint64_t v39 = v20;
            _os_log_error_impl(&dword_182959000, v26, OS_LOG_TYPE_ERROR, "Failed to create LSPlugInKitProxy object (after sorting) for %@ (%llu)", buf, 0x16u);
          }

          v16 = v24;
          v12 = v23;
          a6 = v30;
        }

        ++v17;
      }
      while (v14 != v17);
      uint64_t v14 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v14);
  }
LABEL_20:
}

+ (id)pluginQueryWithUUID:(id)a3
{
  id v3 = a3;
  v4 = [LSPlugInQueryWithIdentifier alloc];
  v5 = [v3 UUIDString];

  id v6 = [(LSPlugInQueryWithIdentifier *)v4 _initWithIdentifier:v5 inMap:11];

  return v6;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)LSPlugInQuery;
  id v3 = [(_LSQuery *)&v6 _init];
  if (v3 && [v3 isMemberOfClass:objc_opt_class()])
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:v3 file:@"LSPlugInQuery.m" lineNumber:186 description:@"cannot directly instantiate LSPlugInQuery"];
  }
  return v3;
}

+ (id)pluginQueryWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [[LSPlugInQueryWithIdentifier alloc] _initWithIdentifier:v3 inMap:9];

  return v4;
}

+ (id)pluginQueryWithQueryDictionary:(id)a3 applyFilter:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[LSPlugInQueryWithQueryDictionary alloc] _initWithQueryDictionary:v6 applyFilter:v5];

  return v7;
}

+ (id)pluginQuery
{
  id v2 = [[LSPlugInQueryAll alloc] _init];

  return v2;
}

+ (id)pluginQueryWithURL:(id)a3
{
  id v3 = a3;
  id v4 = [[LSPlugInQueryWithURL alloc] _initWithURL:v3];

  return v4;
}

- (BOOL)_remoteResolutionIsExpensive
{
  return 0;
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  uint64_t v12 = 0;
  uint64_t v13 = (void **)&v12;
  uint64_t v14 = 0x3812000000;
  uint64_t v15 = __Block_byref_object_copy__39;
  v16 = __Block_byref_object_dispose__39;
  uint64_t v17 = 256;
  id v18 = 0;
  if (v6)
  {
    v8 = _LSDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[LSPlugInQuery _enumerateWithXPCConnection:block:](v8);
    }

    v9 = v13 + 6;
  }
  else
  {
    v9 = &v18;
  }
  int v10 = _LSContextInit(v9);
  if (v10)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v10, (uint64_t)"-[LSPlugInQuery _enumerateWithXPCConnection:block:]", 171, 0);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v11);
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1CA80] set];
    _CSStoreEnumerateUnits();
    [(LSPlugInQuery *)self sort:0 pluginIDs:v11 andYield:v7 context:v13 + 6];
    _LSContextDestroy(v13 + 6);
  }
  _Block_object_dispose(&v12, 8);
}

void __51__LSPlugInQuery__enumerateWithXPCConnection_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (_LSPluginIsValid(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 48), a2, a3, 0, 0, 0)
    && _LSPluginCheckExtensionPoint(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 48), a2, a3, 0))
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [NSNumber numberWithUnsignedInt:a2];
    [v6 addObject:v7];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)LSPlugInQuery;
  if ([(_LSQuery *)&v7 isEqual:v4])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)LSPlugInQuery;
  return [(_LSQuery *)&v3 hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([(id)__LSDefaultsGetSharedInstance() isServer] & 1) == 0)
  {
    __LAUNCH_SERVICES_IS_GENERATING_A_SANDBOX_EXCEPTION_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
    __LAUNCH_SERVICES_IS_ABORTING_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
  }
}

- (void)_enumerateWithXPCConnection:(os_log_t)log block:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "LSPlugInQuery for enumerating all plugins called from a processs that cannot map the database", v1, 2u);
}

@end