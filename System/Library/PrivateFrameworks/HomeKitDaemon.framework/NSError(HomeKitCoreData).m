@interface NSError(HomeKitCoreData)
+ (id)hmd_validationErrorWithDescription:()HomeKitCoreData;
+ (id)hmd_validationErrorWithDescription:()HomeKitCoreData managedObject:attributeName:;
@end

@implementation NSError(HomeKitCoreData)

+ (id)hmd_validationErrorWithDescription:()HomeKitCoreData managedObject:attributeName:
{
  v16[3] = *MEMORY[0x263EF8340];
  uint64_t v7 = *MEMORY[0x263EFF190];
  v15[0] = *MEMORY[0x263F08320];
  v15[1] = v7;
  v16[0] = a3;
  v16[1] = a4;
  v15[2] = *MEMORY[0x263EFF188];
  v16[2] = a5;
  v8 = NSDictionary;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 dictionaryWithObjects:v16 forKeys:v15 count:3];
  v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:1550 userInfo:v12];

  return v13;
}

+ (id)hmd_validationErrorWithDescription:()HomeKitCoreData
{
  v11[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F07F70];
  uint64_t v10 = *MEMORY[0x263F08320];
  v11[0] = a3;
  v5 = NSDictionary;
  id v6 = a3;
  uint64_t v7 = [v5 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8 = [v3 errorWithDomain:v4 code:1550 userInfo:v7];

  return v8;
}

@end