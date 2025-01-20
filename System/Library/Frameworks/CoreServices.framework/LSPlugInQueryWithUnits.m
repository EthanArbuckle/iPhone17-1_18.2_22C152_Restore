@interface LSPlugInQueryWithUnits
+ (BOOL)supportsSecureCoding;
- (LSPlugInQueryWithUnits)initWithCoder:(id)a3;
- (LSPlugInQueryWithUnits)initWithPlugInUnits:(id)a3 forDatabaseWithUUID:(id)a4;
- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSPlugInQueryWithUnits

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSPlugInQueryWithUnits)initWithPlugInUnits:(id)a3 forDatabaseWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LSPlugInQueryWithUnits;
  v8 = [(LSPlugInQuery *)&v12 _init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    pluginUnits = v8->_pluginUnits;
    v8->_pluginUnits = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_dbUUID, a4);
  }

  return v8;
}

- (LSPlugInQueryWithUnits)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LSPlugInQueryWithUnits;
  v5 = [(LSPlugInQuery *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeArrayWithValuesOfClass:forKey:", objc_opt_class(), @"pluginUnits");
    pluginUnits = v5->_pluginUnits;
    v5->_pluginUnits = (NSArray *)v6;

    uint64_t v8 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"dbUUID");
    dbUUID = v5->_dbUUID;
    v5->_dbUUID = (NSUUID *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  pluginUnits = self->_pluginUnits;
  id v5 = a3;
  [v5 encodeObject:pluginUnits forKey:@"pluginUnits"];
  [v5 encodeObject:self->_dbUUID forKey:@"dbUUID"];
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, uint64_t))a4;
  id v20 = 0;
  v21 = 0;
  int inited = _LSContextInitReturningError(&v21, &v20);
  id v9 = v20;
  if (inited)
  {
    v10 = _LSDatabaseGetCacheGUID();
    int v11 = [v10 isEqual:self->_dbUUID];

    if (v11)
    {
      objc_super v12 = [MEMORY[0x1E4F1CAD0] setWithArray:self->_pluginUnits];
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v14 = v12;
      id v15 = v13;
      _CSStoreEnumerateUnits();
      if ([v15 isEqual:v14])
      {
        if ([v15 count]) {
          [(LSPlugInQuery *)self sort:0 pluginIDs:v14 andYield:v7 context:&v21];
        }
      }
      else
      {
        v16 = (void *)[v14 mutableCopy];
        [v16 minusSet:v15];
        v17 = _LSDefaultLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[LSPlugInQueryWithUnits _enumerateWithXPCConnection:block:]((uint64_t)v16, v17);
        }

        uint64_t v24 = *MEMORY[0x1E4F28228];
        v25[0] = @"specified plugin units were not available";
        v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
        uint64_t v19 = _LSMakeNSErrorImpl(@"LSApplicationWorkspaceErrorDomain", 114, (uint64_t)"-[LSPlugInQueryWithUnits _enumerateWithXPCConnection:block:]", 141, v18);

        v7[2](v7, 0, v19);
        id v9 = (id)v19;
      }
    }
    else
    {
      uint64_t v22 = *MEMORY[0x1E4F28228];
      v23 = @"DB UUID mismatch";
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      _LSMakeNSErrorImpl(@"LSApplicationWorkspaceErrorDomain", 114, (uint64_t)"-[LSPlugInQueryWithUnits _enumerateWithXPCConnection:block:]", 147, v14);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, (uint64_t)v15);
    }

    _LSContextDestroy(&v21);
  }
  else
  {
    v7[2](v7, 0, (uint64_t)v9);
  }
}

void __60__LSPlugInQueryWithUnits__enumerateWithXPCConnection_block___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = [NSNumber numberWithUnsignedInt:a2];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4)
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [NSNumber numberWithUnsignedInt:a2];
    [v6 addObject:v7];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbUUID, 0);

  objc_storeStrong((id *)&self->_pluginUnits, 0);
}

- (void)_enumerateWithXPCConnection:(uint64_t)a1 block:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_182959000, a2, OS_LOG_TYPE_ERROR, "LSPlugInQueryWithUnits: missing units %@", (uint8_t *)&v2, 0xCu);
}

@end