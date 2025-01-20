@interface DBHomeKitServiceTypes
+ (NSDictionary)serviceNameByType;
+ (NSDictionary)serviceTypeByName;
+ (id)serviceNameForType:(id)a3;
@end

@implementation DBHomeKitServiceTypes

+ (NSDictionary)serviceTypeByName
{
  if (serviceTypeByName_onceToken != -1) {
    dispatch_once(&serviceTypeByName_onceToken, &__block_literal_global_27);
  }
  v2 = (void *)serviceTypeByName__serviceTypeByName;
  return (NSDictionary *)v2;
}

void __42__DBHomeKitServiceTypes_serviceTypeByName__block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  v2 = @"GarageDoorOpener";
  v3[0] = *MEMORY[0x263F0D6F8];
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)serviceTypeByName__serviceTypeByName;
  serviceTypeByName__serviceTypeByName = v0;
}

+ (NSDictionary)serviceNameByType
{
  if (serviceNameByType_onceToken != -1) {
    dispatch_once(&serviceNameByType_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)serviceNameByType__serviceNameByType;
  return (NSDictionary *)v2;
}

void __42__DBHomeKitServiceTypes_serviceNameByType__block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F0D6F8];
  v3[0] = @"GarageDoorOpener";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)serviceNameByType__serviceNameByType;
  serviceNameByType__serviceNameByType = v0;
}

+ (id)serviceNameForType:(id)a3
{
  id v4 = a3;
  v5 = [a1 serviceNameByType];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6) {
    id v6 = v4;
  }

  return v6;
}

@end