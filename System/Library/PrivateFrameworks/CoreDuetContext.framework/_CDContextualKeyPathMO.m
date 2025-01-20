@interface _CDContextualKeyPathMO
+ (id)materializedContextValueFrom:(id)a3;
+ (id)materializedKeyPathFrom:(id)a3;
+ (void)hydrateMO:(id)a3 fromKeyPath:(id)a4 andValue:(id)a5;
@end

@implementation _CDContextualKeyPathMO

+ (void)hydrateMO:(id)a3 fromKeyPath:(id)a4 andValue:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [v10 key];
  [v8 setKey:v11];

  v12 = [v10 deviceID];
  [v8 setDeviceIDString:v12];

  objc_msgSend(v8, "setIsUserCentric:", objc_msgSend(v10, "isUserCentric"));
  uint64_t v13 = [v10 isEphemeral];

  [v8 setIsEphemeral:v13];
  v14 = [v9 lastModifiedDate];
  [v8 setLastModifiedDate:v14];

  id v18 = 0;
  v15 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v18];

  id v16 = v18;
  if (v15)
  {
    [v8 setValue:v15];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    +[_CDContextualKeyPathMO hydrateMO:fromKeyPath:andValue:]((objc_class *)a1, (uint64_t)v16);
  }
  v17 = [MEMORY[0x1E4F1C9C8] date];
  [v8 setCreationDate:v17];
}

+ (id)materializedKeyPathFrom:(id)a3
{
  id v3 = a3;
  v4 = [_CDContextualKeyPath alloc];
  v5 = [v3 key];
  v6 = [v3 deviceIDString];
  uint64_t v7 = [v3 isUserCentric];
  uint64_t v8 = [v3 isEphemeral];

  id v9 = [(_CDContextualKeyPath *)v4 initWithKey:v5 forDeviceID:v6 isUserCentric:v7 isEphemeral:v8];
  return v9;
}

+ (id)materializedContextValueFrom:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28DC0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = [v4 value];

  uint64_t v7 = [v3 unarchivedObjectOfClass:v5 fromData:v6 error:0];

  return v7;
}

+ (void)hydrateMO:(objc_class *)a1 fromKeyPath:(uint64_t)a2 andValue:.cold.1(objc_class *a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = NSStringFromClass(a1);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_18EC9B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@: Error setting mo.value: %@", (uint8_t *)&v4, 0x16u);
}

@end