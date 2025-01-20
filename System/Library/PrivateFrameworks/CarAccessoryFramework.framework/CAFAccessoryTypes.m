@interface CAFAccessoryTypes
+ (NSDictionary)accessoryNameByType;
+ (NSDictionary)accessoryTypeByName;
+ (NSSet)stateCaptureValues;
+ (id)accessoryNameFor:(id)a3;
+ (id)accessoryNameForType:(id)a3;
+ (id)accessoryTypeFor:(id)a3;
@end

@implementation CAFAccessoryTypes

+ (NSDictionary)accessoryTypeByName
{
  if (accessoryTypeByName_onceToken != -1) {
    dispatch_once(&accessoryTypeByName_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)accessoryTypeByName__accessoryTypeByName;
  return (NSDictionary *)v2;
}

void __40__CAFAccessoryTypes_accessoryTypeByName__block_invoke()
{
  v3[28] = *MEMORY[0x263EF8340];
  v2[0] = @"AudioSettings";
  v2[1] = @"AutomakerExteriorCamera";
  v3[0] = @"0x0000000002000001";
  v3[1] = @"0x0000000001300001";
  v2[2] = @"AutomakerInputStreams";
  v2[3] = @"AutomakerNotificationHistory";
  v3[2] = @"0x000000000C000001";
  v3[3] = @"0x0000000001400001";
  v2[4] = @"AutomakerNotifications";
  v2[5] = @"AutomakerRequestContent";
  v3[4] = @"0x0000000006000001";
  v3[5] = @"0x0000000001200001";
  v2[6] = @"AutomakerSettings";
  v2[7] = @"Charging";
  v3[6] = @"0x0000000005000001";
  v3[7] = @"0x0000000009000008";
  v2[8] = @"Climate";
  v2[9] = @"Closure";
  v3[8] = @"0x0000000001000001";
  v3[9] = @"0x000000000D000001";
  v2[10] = @"DriveState";
  v2[11] = @"DriverAssistance";
  v3[10] = @"0x0000000009000003";
  v3[11] = @"0x000000000E000001";
  v2[12] = @"ElectricEngine";
  v2[13] = @"EnvironmentalConditions";
  v3[12] = @"0x0000000009000004";
  v3[13] = @"0x0000000001600001";
  v2[14] = @"Fuel";
  v2[15] = @"HighVoltageBattery";
  v3[14] = @"0x0000000009000006";
  v3[15] = @"0x0000000009000007";
  v2[16] = @"InternalCombustionEngine";
  v2[17] = @"Media";
  v3[16] = @"0x0000000009000005";
  v3[17] = @"0x0000000003000001";
  v2[18] = @"NowPlayingInformation";
  v2[19] = @"PairedDevices";
  v3[18] = @"0x000000000F000001";
  v3[19] = @"0x000000000B000001";
  v2[20] = @"Seat";
  v2[21] = @"TestingUseOnly";
  v3[20] = @"0x0000000001500001";
  v3[21] = @"0x00000000FD000001";
  v2[22] = @"Tire";
  v2[23] = @"TripComputer";
  v3[22] = @"0x000000000A000001";
  v3[23] = @"0x0000000004000001";
  v2[24] = @"UIControl";
  v2[25] = @"VehicleMotion";
  v3[24] = @"0x0000000001100001";
  v3[25] = @"0x0000000009000001";
  v2[26] = @"VehicleResources";
  v2[27] = @"VehicleUnits";
  v3[26] = @"0x0000000001200002";
  v3[27] = @"0x0000000001700001";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:28];
  v1 = (void *)accessoryTypeByName__accessoryTypeByName;
  accessoryTypeByName__accessoryTypeByName = v0;
}

+ (NSDictionary)accessoryNameByType
{
  if (accessoryNameByType_onceToken != -1) {
    dispatch_once(&accessoryNameByType_onceToken, &__block_literal_global_189);
  }
  v2 = (void *)accessoryNameByType__accessoryNameByType;
  return (NSDictionary *)v2;
}

void __40__CAFAccessoryTypes_accessoryNameByType__block_invoke()
{
  v3[28] = *MEMORY[0x263EF8340];
  v2[0] = @"0x0000000002000001";
  v2[1] = @"0x0000000001300001";
  v3[0] = @"AudioSettings";
  v3[1] = @"AutomakerExteriorCamera";
  v2[2] = @"0x000000000C000001";
  v2[3] = @"0x0000000001400001";
  v3[2] = @"AutomakerInputStreams";
  v3[3] = @"AutomakerNotificationHistory";
  v2[4] = @"0x0000000006000001";
  v2[5] = @"0x0000000001200001";
  v3[4] = @"AutomakerNotifications";
  v3[5] = @"AutomakerRequestContent";
  v2[6] = @"0x0000000005000001";
  v2[7] = @"0x0000000009000008";
  v3[6] = @"AutomakerSettings";
  v3[7] = @"Charging";
  v2[8] = @"0x0000000001000001";
  v2[9] = @"0x000000000D000001";
  v3[8] = @"Climate";
  v3[9] = @"Closure";
  v2[10] = @"0x0000000009000003";
  v2[11] = @"0x000000000E000001";
  v3[10] = @"DriveState";
  v3[11] = @"DriverAssistance";
  v2[12] = @"0x0000000009000004";
  v2[13] = @"0x0000000001600001";
  v3[12] = @"ElectricEngine";
  v3[13] = @"EnvironmentalConditions";
  v2[14] = @"0x0000000009000006";
  v2[15] = @"0x0000000009000007";
  v3[14] = @"Fuel";
  v3[15] = @"HighVoltageBattery";
  v2[16] = @"0x0000000009000005";
  v2[17] = @"0x0000000003000001";
  v3[16] = @"InternalCombustionEngine";
  v3[17] = @"Media";
  v2[18] = @"0x000000000F000001";
  v2[19] = @"0x000000000B000001";
  v3[18] = @"NowPlayingInformation";
  v3[19] = @"PairedDevices";
  v2[20] = @"0x0000000001500001";
  v2[21] = @"0x00000000FD000001";
  v3[20] = @"Seat";
  v3[21] = @"TestingUseOnly";
  v2[22] = @"0x000000000A000001";
  v2[23] = @"0x0000000004000001";
  v3[22] = @"Tire";
  v3[23] = @"TripComputer";
  v2[24] = @"0x0000000001100001";
  v2[25] = @"0x0000000009000001";
  v3[24] = @"UIControl";
  v3[25] = @"VehicleMotion";
  v2[26] = @"0x0000000001200002";
  v2[27] = @"0x0000000001700001";
  v3[26] = @"VehicleResources";
  v3[27] = @"VehicleUnits";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:28];
  v1 = (void *)accessoryNameByType__accessoryNameByType;
  accessoryNameByType__accessoryNameByType = v0;
}

+ (NSSet)stateCaptureValues
{
  if (stateCaptureValues_onceToken_0 != -1) {
    dispatch_once(&stateCaptureValues_onceToken_0, &__block_literal_global_191);
  }
  v2 = (void *)stateCaptureValues__stateCaptureValues_0;
  return (NSSet *)v2;
}

void __39__CAFAccessoryTypes_stateCaptureValues__block_invoke()
{
  v4[23] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = @"0x0000000002000001";
  v4[1] = @"0x0000000001300001";
  v4[2] = @"0x000000000C000001";
  v4[3] = @"0x0000000006000001";
  v4[4] = @"0x0000000001200001";
  v4[5] = @"0x0000000009000008";
  v4[6] = @"0x0000000001000001";
  v4[7] = @"0x000000000D000001";
  v4[8] = @"0x0000000009000003";
  v4[9] = @"0x000000000E000001";
  v4[10] = @"0x0000000009000004";
  v4[11] = @"0x0000000001600001";
  v4[12] = @"0x0000000009000006";
  v4[13] = @"0x0000000009000007";
  v4[14] = @"0x0000000009000005";
  v4[15] = @"0x0000000003000001";
  v4[16] = @"0x000000000F000001";
  v4[17] = @"0x0000000001500001";
  v4[18] = @"0x000000000A000001";
  v4[19] = @"0x0000000004000001";
  v4[20] = @"0x0000000001100001";
  v4[21] = @"0x0000000009000001";
  v4[22] = @"0x0000000001700001";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:23];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)stateCaptureValues__stateCaptureValues_0;
  stateCaptureValues__stateCaptureValues_0 = v2;
}

+ (id)accessoryNameForType:(id)a3
{
  id v4 = a3;
  v5 = [a1 accessoryNameByType];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6) {
    id v6 = v4;
  }

  return v6;
}

+ (id)accessoryNameFor:(id)a3
{
  id v4 = [a1 accessoryTypeFor:a3];
  v5 = [a1 accessoryNameForType:v4];

  return v5;
}

+ (id)accessoryTypeFor:(id)a3
{
  return (id)[a3 categoryType];
}

@end