@interface CAFASCTree
+ (id)_nodesOfType:(unsigned __int8)a3 fromDict:(id)a4;
- (BOOL)_hasAccessory:(id)a3 service:(id)a4 characteristicOrControl:(id)a5;
- (BOOL)hasAccessory:(id)a3;
- (BOOL)hasAccessory:(id)a3 service:(id)a4;
- (CAFASCTree)initWithContentsOfFile:(id)a3;
- (CAFASCTree)initWithDictionary:(id)a3;
- (NSDictionary)accessories;
- (NSMutableSet)missingRegistrations;
- (id)nodeForAccessory:(id)a3 serviceType:(id)a4;
- (id)treeLogLines;
- (void)logErrorIfNeededForMissingRegistration:(id)a3;
- (void)validateRegisteredForAccessory:(id)a3;
- (void)validateRegisteredForAccessory:(id)a3 service:(id)a4;
- (void)validateRegisteredForAccessory:(id)a3 service:(id)a4 characteristic:(id)a5;
- (void)validateRegisteredForAccessory:(id)a3 service:(id)a4 control:(id)a5;
@end

@implementation CAFASCTree

- (CAFASCTree)initWithContentsOfFile:(id)a3
{
  v4 = [NSDictionary dictionaryWithContentsOfFile:a3];
  v5 = [(CAFASCTree *)self initWithDictionary:v4];

  return v5;
}

- (CAFASCTree)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAFASCTree;
  v5 = [(CAFASCTree *)&v11 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    missingRegistrations = v5->_missingRegistrations;
    v5->_missingRegistrations = (NSMutableSet *)v6;

    uint64_t v8 = +[CAFASCTree _nodesOfType:0 fromDict:v4];
    accessories = v5->_accessories;
    v5->_accessories = (NSDictionary *)v8;
  }
  return v5;
}

+ (id)_nodesOfType:(unsigned __int8)a3 fromDict:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __36__CAFASCTree__nodesOfType_fromDict___block_invoke;
  v9[3] = &unk_265264AA8;
  unsigned __int8 v11 = a3;
  id v7 = v6;
  id v10 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  return v7;
}

void __36__CAFASCTree__nodesOfType_fromDict___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  id v5 = +[CAFASCTreeNode nodeType:*(unsigned __int8 *)(a1 + 40) withString:a2];
  if (v5)
  {
    objc_opt_class();
    id v6 = v12;
    if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    uint64_t v8 = +[CAFASCTree _nodesOfType:(*(unsigned char *)(a1 + 40) + 1) fromDict:v7];
    [v5 setChildren:v8];

    v9 = [v6 objectForKeyedSubscript:@"RegisteredValues"];
    [v5 setRegisteredValues:v9];

    id v10 = *(void **)(a1 + 32);
    unsigned __int8 v11 = [v5 type];
    [v10 setObject:v5 forKeyedSubscript:v11];
  }
}

- (BOOL)hasAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFASCTree *)self accessories];
  if ([v5 count])
  {
    id v6 = [(CAFASCTree *)self accessories];
    id v7 = [v6 objectForKeyedSubscript:v4];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (BOOL)hasAccessory:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CAFASCTree *)self hasAccessory:v6])
  {
    BOOL v8 = [(CAFASCTree *)self accessories];
    v9 = [v8 objectForKeyedSubscript:v6];
    id v10 = [v9 children];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      id v12 = [(CAFASCTree *)self nodeForAccessory:v6 serviceType:v7];
      BOOL v13 = v12 != 0;
    }
    else
    {
      BOOL v13 = 1;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_hasAccessory:(id)a3 service:(id)a4 characteristicOrControl:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CAFASCTree *)self hasAccessory:v8]
    && [(CAFASCTree *)self hasAccessory:v8 service:v9])
  {
    uint64_t v11 = [(CAFASCTree *)self accessories];
    id v12 = [v11 objectForKeyedSubscript:v8];
    BOOL v13 = [v12 children];
    v14 = [v13 objectForKeyedSubscript:v9];
    v15 = [v14 children];
    if ([v15 count])
    {
      v25 = [(CAFASCTree *)self accessories];
      [v25 objectForKeyedSubscript:v8];
      v24 = v27 = v11;
      [v24 children];
      v16 = v26 = v12;
      v17 = [v16 objectForKeyedSubscript:v9];
      [v17 children];
      v18 = v14;
      v20 = v19 = v13;
      v21 = [v20 objectForKeyedSubscript:v10];
      BOOL v22 = v21 != 0;

      BOOL v13 = v19;
      v14 = v18;

      id v12 = v26;
      uint64_t v11 = v27;
    }
    else
    {
      BOOL v22 = 1;
    }
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (id)nodeForAccessory:(id)a3 serviceType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CAFASCTree *)self accessories];
  id v9 = [v8 objectForKeyedSubscript:v7];

  id v10 = [v9 _childNodeMatchingType:v6];

  return v10;
}

- (id)treeLogLines
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(CAFASCTree *)self accessories];
  id v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) treeLogLinesIndent:0];
        [v3 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (void)validateRegisteredForAccessory:(id)a3
{
  id v7 = a3;
  if (!-[CAFASCTree hasAccessory:](self, "hasAccessory:"))
  {
    id v4 = NSString;
    id v5 = +[CAFAccessoryTypes accessoryNameForType:v7];
    uint64_t v6 = [v4 stringWithFormat:@"%@", v5];
    [(CAFASCTree *)self logErrorIfNeededForMissingRegistration:v6];
  }
}

- (void)validateRegisteredForAccessory:(id)a3 service:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (![(CAFASCTree *)self hasAccessory:v11 service:v6])
  {
    id v7 = NSString;
    uint64_t v8 = +[CAFAccessoryTypes accessoryNameForType:v11];
    id v9 = +[CAFServiceTypes serviceNameForType:v6];
    id v10 = [v7 stringWithFormat:@"%@.%@", v8, v9];
    [(CAFASCTree *)self logErrorIfNeededForMissingRegistration:v10];
  }
}

- (void)validateRegisteredForAccessory:(id)a3 service:(id)a4 characteristic:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  if (![(CAFASCTree *)self hasAccessory:v15 service:v8 characteristic:v9])
  {
    id v10 = NSString;
    id v11 = +[CAFAccessoryTypes accessoryNameForType:v15];
    long long v12 = +[CAFServiceTypes serviceNameForType:v8];
    long long v13 = +[CAFCharacteristicTypes characteristicNameForType:v9];
    long long v14 = [v10 stringWithFormat:@"%@.%@.%@", v11, v12, v13];
    [(CAFASCTree *)self logErrorIfNeededForMissingRegistration:v14];
  }
}

- (void)validateRegisteredForAccessory:(id)a3 service:(id)a4 control:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  if (![(CAFASCTree *)self hasAccessory:v15 service:v8 control:v9])
  {
    id v10 = NSString;
    id v11 = +[CAFAccessoryTypes accessoryNameForType:v15];
    long long v12 = +[CAFServiceTypes serviceNameForType:v8];
    long long v13 = +[CAFControlTypes controlNameForType:v9];
    long long v14 = [v10 stringWithFormat:@"%@.%@.%@", v11, v12, v13];
    [(CAFASCTree *)self logErrorIfNeededForMissingRegistration:v14];
  }
}

- (void)logErrorIfNeededForMissingRegistration:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFASCTree *)self missingRegistrations];
  objc_sync_enter(v5);
  id v6 = [(CAFASCTree *)self missingRegistrations];
  char v7 = [v6 containsObject:v4];

  if ((v7 & 1) == 0)
  {
    id v8 = [(CAFASCTree *)self missingRegistrations];
    [v8 addObject:v4];

    id v9 = CAFRegistrationLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CAFASCTree logErrorIfNeededForMissingRegistration:]((uint64_t)v4, v9);
    }
  }
  objc_sync_exit(v5);
}

- (NSDictionary)accessories
{
  return self->_accessories;
}

- (NSMutableSet)missingRegistrations
{
  return self->_missingRegistrations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_missingRegistrations, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
}

- (void)logErrorIfNeededForMissingRegistration:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_249710000, a2, OS_LOG_TYPE_ERROR, "!! This app is not registered for %@ !!", (uint8_t *)&v2, 0xCu);
}

@end