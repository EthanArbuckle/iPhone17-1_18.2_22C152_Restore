@interface CEMConfigurationBase
+ (NSSet)restrictionPayloadKeys;
+ (NSString)declarationClass;
+ (NSString)profileType;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (id)assetReferences;
- (id)payloadUUIDWithIdentifier:(id)a3 outUUIDs:(id)a4 oldUUIDs:(id)a5;
- (id)profilePayloadsByTypeWithAssetProviders:(id)a3;
- (id)synthesizeProfileOutUUIDs:(id)a3 withOldUUIDs:(id)a4 assetProviders:(id)a5;
- (id)synthesizeProfilePayloadOutUUIDs:(id)a3 withOldUUIDs:(id)a4 assetProviders:(id)a5;
- (int)activationLevel;
@end

@implementation CEMConfigurationBase

+ (NSString)declarationClass
{
  return (NSString *)@"configuration";
}

+ (NSString)profileType
{
  return (NSString *)&stru_26C838878;
}

+ (NSSet)restrictionPayloadKeys
{
  return (NSSet *)[MEMORY[0x263EFFA08] set];
}

- (BOOL)multipleAllowed
{
  return 1;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)activationLevel
{
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)synthesizeProfileOutUUIDs:(id)a3 withOldUUIDs:(id)a4 assetProviders:(id)a5
{
  v8 = (void *)MEMORY[0x263EFF9A0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 dictionary];
  v13 = NSString;
  v14 = [(CEMDeclarationBase *)self declarationType];
  v15 = [v14 substringFromIndex:24];
  v16 = [(CEMDeclarationBase *)self declarationIdentifier];
  v17 = [v13 stringWithFormat:@"%@.%@", v15, v16];
  [v12 setObject:v17 forKeyedSubscript:@"PayloadIdentifier"];

  v18 = [(CEMDeclarationBase *)self declarationIdentifier];
  [v12 setObject:v18 forKeyedSubscript:@"PayloadUUID"];

  [v12 setObject:@"Configuration" forKeyedSubscript:@"PayloadType"];
  [v12 setObject:&unk_26C894790 forKeyedSubscript:@"PayloadVersion"];
  v19 = [(CEMConfigurationBase *)self synthesizeProfilePayloadOutUUIDs:v11 withOldUUIDs:v10 assetProviders:v9];

  [v12 setObject:v19 forKeyedSubscript:@"PayloadContent"];
  v20 = (void *)[v12 copy];

  return v20;
}

- (id)payloadUUIDWithIdentifier:(id)a3 outUUIDs:(id)a4 oldUUIDs:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v9
    && ([v9 objectForKeyedSubscript:v7],
        id v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    v12 = [v10 objectForKeyedSubscript:v7];
  }
  else
  {
    v13 = [MEMORY[0x263F08C38] UUID];
    v12 = [v13 UUIDString];
  }
  [v8 setObject:v12 forKeyedSubscript:v7];

  return v12;
}

- (id)synthesizeProfilePayloadOutUUIDs:(id)a3 withOldUUIDs:(id)a4 assetProviders:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x263EFF980];
  id v11 = a5;
  v12 = [v10 arrayWithCapacity:2];
  v13 = [(CEMConfigurationBase *)self profilePayloadsByTypeWithAssetProviders:v11];

  v14 = [(id)objc_opt_class() profileType];
  v15 = [v13 objectForKeyedSubscript:v14];
  v42 = v14;
  if ([v14 length] && objc_msgSend(v15, "count"))
  {
    v16 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v15, "count") + 4);
    v17 = NSString;
    [(CEMDeclarationBase *)self declarationIdentifier];
    v18 = v15;
    v19 = v13;
    v20 = v12;
    id v21 = v9;
    v23 = id v22 = v8;
    uint64_t v24 = [v17 stringWithFormat:@"%@.%@", v42, v23];

    id v8 = v22;
    id v9 = v21;
    v12 = v20;
    v13 = v19;
    v15 = v18;
    [v16 setObject:v42 forKeyedSubscript:@"PayloadType"];
    [v16 setObject:&unk_26C894790 forKeyedSubscript:@"PayloadVersion"];
    v40 = (void *)v24;
    [v16 setObject:v24 forKeyedSubscript:@"PayloadIdentifier"];
    v25 = [(CEMConfigurationBase *)self payloadUUIDWithIdentifier:v24 outUUIDs:v8 oldUUIDs:v9];
    [v16 setObject:v25 forKeyedSubscript:@"PayloadUUID"];

    [v16 addEntriesFromDictionary:v18];
    v26 = (void *)[v16 copy];
    [v12 addObject:v26];
  }
  v27 = [v13 objectForKeyedSubscript:@"com.apple.applicationaccess"];
  if ([v27 count])
  {
    v28 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v27, "count") + 4);
    v41 = v13;
    v29 = v12;
    id v30 = v9;
    id v31 = v8;
    v32 = NSString;
    [(CEMDeclarationBase *)self declarationIdentifier];
    v34 = v33 = v15;
    v35 = [v32 stringWithFormat:@"%@.%@", @"com.apple.applicationaccess", v34];

    v15 = v33;
    [v28 setObject:@"com.apple.applicationaccess" forKeyedSubscript:@"PayloadType"];
    [v28 setObject:&unk_26C894790 forKeyedSubscript:@"PayloadVersion"];
    [v28 setObject:v35 forKeyedSubscript:@"PayloadIdentifier"];
    v36 = [(CEMConfigurationBase *)self payloadUUIDWithIdentifier:v35 outUUIDs:v31 oldUUIDs:v30];
    [v28 setObject:v36 forKeyedSubscript:@"PayloadUUID"];

    [v28 addEntriesFromDictionary:v27];
    v37 = (void *)[v28 copy];
    [v29 addObject:v37];

    id v8 = v31;
    id v9 = v30;
    v12 = v29;
    v13 = v41;
  }
  v38 = (void *)[v12 copy];

  return v38;
}

- (id)profilePayloadsByTypeWithAssetProviders:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_class();
  v6 = [v5 profileType];
  id v7 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  [v7 setObject:v8 forKeyedSubscript:v6];

  id v9 = [MEMORY[0x263EFF9A0] dictionary];
  [v7 setObject:v9 forKeyedSubscript:@"com.apple.applicationaccess"];

  v23 = v4;
  id v10 = [(CEMPayloadBase *)self serializePayloadWithAssetProviders:v4];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v16 = [v5 restrictionPayloadKeys];
        int v17 = [v16 containsObject:v15];

        v18 = [v10 objectForKeyedSubscript:v15];
        if (v17) {
          v19 = @"com.apple.applicationaccess";
        }
        else {
          v19 = v6;
        }
        v20 = [v7 objectForKeyedSubscript:v19];
        [v20 setObject:v18 forKeyedSubscript:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v12);
  }
  id v21 = (void *)[v7 copy];

  return v21;
}

@end