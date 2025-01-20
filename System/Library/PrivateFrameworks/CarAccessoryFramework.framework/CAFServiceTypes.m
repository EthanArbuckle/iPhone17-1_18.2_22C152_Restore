@interface CAFServiceTypes
+ (NSDictionary)serviceNameByType;
+ (NSDictionary)serviceTypeByName;
+ (NSSet)stateCaptureValues;
+ (id)serviceNameFor:(id)a3;
+ (id)serviceNameForType:(id)a3;
+ (id)serviceTypeFor:(id)a3;
@end

@implementation CAFServiceTypes

+ (NSDictionary)serviceTypeByName
{
  if (serviceTypeByName_onceToken != -1) {
    dispatch_once(&serviceTypeByName_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)serviceTypeByName__serviceTypeByName;
  return (NSDictionary *)v2;
}

void __36__CAFServiceTypes_serviceTypeByName__block_invoke()
{
  v3[76] = *MEMORY[0x263EF8340];
  v2[0] = @"AutoClimateControl";
  v2[1] = @"BatteryLevel";
  v3[0] = @"0x0000000011000008";
  v3[1] = @"0x000000001A000006";
  v2[2] = @"BatteryTemperature";
  v2[3] = @"BooleanSetting";
  v3[2] = @"0x000000001A000011";
  v3[3] = @"0x0000000016000001";
  v2[4] = @"ButtonSetting";
  v2[5] = @"Cabin";
  v3[4] = @"0x0000000016000002";
  v3[5] = @"0x0000000011000001";
  v2[6] = @"CameraButton";
  v2[7] = @"CameraGeneral";
  v3[6] = @"0x000000001F000002";
  v3[7] = @"0x000000001F000001";
  v2[8] = @"ChargingRate";
  v2[9] = @"ChargingStatus";
  v3[8] = @"0x0000000019000003";
  v3[9] = @"0x0000000019000002";
  v2[10] = @"ChargingTime";
  v2[11] = @"ClimateControlsLocked";
  v3[10] = @"0x0000000019000007";
  v3[11] = @"0x0000000011000010";
  v2[12] = @"ClosureState";
  v2[13] = @"CriticalInputStream";
  v3[12] = @"0x000000001D000001";
  v3[13] = @"0x000000001C000001";
  v2[14] = @"DeepLinkSetting";
  v2[15] = @"Defrost";
  v3[14] = @"0x0000000016000006";
  v3[15] = @"0x0000000011000005";
  v2[16] = @"DisplayUnits";
  v2[17] = @"DisplayedSpeed";
  v3[16] = @"0x000000001F000008";
  v3[17] = @"0x000000001A000009";
  v2[18] = @"DriveMode";
  v2[19] = @"EnginePower";
  v3[18] = @"0x000000001A000008";
  v3[19] = @"0x000000001A00000D";
  v2[20] = @"EngineRPM";
  v2[21] = @"EngineTemperature";
  v3[20] = @"0x000000001A00000F";
  v3[21] = @"0x000000001A000010";
  v2[22] = @"Equalizer";
  v2[23] = @"ExteriorConditions";
  v3[22] = @"0x0000000013000003";
  v3[23] = @"0x0000000011000009";
  v2[24] = @"Fan";
  v2[25] = @"FloatSetting";
  v3[24] = @"0x0000000011000007";
  v3[25] = @"0x0000000016000003";
  v2[26] = @"FuelConsumption";
  v2[27] = @"FuelLevel";
  v3[26] = @"0x000000001A000014";
  v3[27] = @"0x000000001A000005";
  v2[28] = @"GearRecommendation";
  v2[29] = @"HistoricalNotification";
  v3[28] = @"0x000000001A000007";
  v3[29] = @"0x0000000021000001";
  v2[30] = @"IntegerSetting";
  v2[31] = @"InteriorConditions";
  v3[30] = @"0x0000000016000007";
  v3[31] = @"0x0000000011000013";
  v2[32] = @"LocalNotification";
  v2[33] = @"MediaSource";
  v3[32] = @"0x0000000017000002";
  v3[33] = @"0x0000000014000006";
  v2[34] = @"MultipleSelectImageSetting";
  v2[35] = @"MultipleSelectSetting";
  v3[34] = @"0x0000000016000017";
  v3[35] = @"0x0000000016000005";
  v2[36] = @"NowPlaying";
  v2[37] = @"Odometer";
  v3[36] = @"0x0000000014000001";
  v3[37] = @"0x000000001A00000A";
  v2[38] = @"PairedDevicesAction";
  v2[39] = @"PairedDevicesInformation";
  v3[38] = @"0x0000000016000019";
  v3[39] = @"0x0000000016000018";
  v2[40] = @"Picker";
  v2[41] = @"ProtocolPerfTest";
  v3[40] = @"0x0000000017000003";
  v3[41] = @"0x00000000FE000006";
  v2[42] = @"Recirculation";
  v2[43] = @"RemainingRange";
  v3[42] = @"0x0000000011000011";
  v3[43] = @"0x000000001A00000B";
  v2[44] = @"RemoteNotification";
  v2[45] = @"RequestContent";
  v3[44] = @"0x0000000017000001";
  v3[45] = @"0x0000000017000004";
  v2[46] = @"SeatBelt";
  v2[47] = @"SeatFan";
  v3[46] = @"0x0000000022000004";
  v3[47] = @"0x0000000022000002";
  v2[48] = @"SeatHeatingCooling";
  v2[49] = @"SettingsSection";
  v3[48] = @"0x0000000022000001";
  v3[49] = @"0x0000000016000020";
  v2[50] = @"SingleSelectImageSetting";
  v2[51] = @"SingleSelectSetting";
  v3[50] = @"0x0000000016000016";
  v3[51] = @"0x0000000016000004";
  v2[52] = @"SoundDistribution";
  v2[53] = @"StaticSetting";
  v3[52] = @"0x0000000013000005";
  v3[53] = @"0x0000000016000015";
  v2[54] = @"SteeringWheelHeatingCooling";
  v2[55] = @"TargetSpeed";
  v3[54] = @"0x0000000011000003";
  v3[55] = @"0x000000001E000004";
  v2[56] = @"Temperature";
  v2[57] = @"TestControlAsync";
  v3[56] = @"0x0000000011000002";
  v3[57] = @"0x00000000FE000009";
  v2[58] = @"TestControlEvent";
  v2[59] = @"TestControlSync";
  v3[58] = @"0x00000000FE00000A";
  v3[59] = @"0x00000000FE000008";
  v2[60] = @"TirePressure";
  v2[61] = @"TirePressureMonitoringSystem";
  v3[60] = @"0x000000001B000001";
  v3[61] = @"0x000000001B000006";
  v2[62] = @"TransmissionStatus";
  v2[63] = @"Trip";
  v3[62] = @"0x000000001A000003";
  v3[63] = @"0x0000000015000002";
  v2[64] = @"TypeTest";
  v3[64] = @"0x00000000FE000001";
  v2[65] = @"TypeTestIndexByPosition";
  v3[65] = @"0x00000000FE000004";
  v2[66] = @"TypeTestIndexByUnit";
  v3[66] = @"0x00000000FE000005";
  v2[67] = @"TypeTestMulti";
  v3[67] = @"0x00000000FE000003";
  v2[68] = @"TypeTestWithStates";
  v3[68] = @"0x00000000FE000007";
  v2[69] = @"UIInputDeviceButton";
  v3[69] = @"0x0000000011100002";
  v2[70] = @"UIState";
  v3[70] = @"0x0000000011100001";
  v2[71] = @"VehicleInformation";
  v3[71] = @"0x000000001A000013";
  v2[72] = @"VehicleVariant";
  v3[72] = @"0x0000000020000001";
  v2[73] = @"Vent";
  v3[73] = @"0x0000000011000006";
  v2[74] = @"Volume";
  v3[74] = @"0x0000000013000002";
  v2[75] = @"ZonesSynced";
  v3[75] = @"0x0000000011000012";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:76];
  v1 = (void *)serviceTypeByName__serviceTypeByName;
  serviceTypeByName__serviceTypeByName = v0;
}

+ (NSDictionary)serviceNameByType
{
  if (serviceNameByType_onceToken != -1) {
    dispatch_once(&serviceNameByType_onceToken, &__block_literal_global_477);
  }
  v2 = (void *)serviceNameByType__serviceNameByType;
  return (NSDictionary *)v2;
}

void __36__CAFServiceTypes_serviceNameByType__block_invoke()
{
  v3[76] = *MEMORY[0x263EF8340];
  v2[0] = @"0x0000000011000008";
  v2[1] = @"0x000000001A000006";
  v3[0] = @"AutoClimateControl";
  v3[1] = @"BatteryLevel";
  v2[2] = @"0x000000001A000011";
  v2[3] = @"0x0000000016000001";
  v3[2] = @"BatteryTemperature";
  v3[3] = @"BooleanSetting";
  v2[4] = @"0x0000000016000002";
  v2[5] = @"0x0000000011000001";
  v3[4] = @"ButtonSetting";
  v3[5] = @"Cabin";
  v2[6] = @"0x000000001F000002";
  v2[7] = @"0x000000001F000001";
  v3[6] = @"CameraButton";
  v3[7] = @"CameraGeneral";
  v2[8] = @"0x0000000019000003";
  v2[9] = @"0x0000000019000002";
  v3[8] = @"ChargingRate";
  v3[9] = @"ChargingStatus";
  v2[10] = @"0x0000000019000007";
  v2[11] = @"0x0000000011000010";
  v3[10] = @"ChargingTime";
  v3[11] = @"ClimateControlsLocked";
  v2[12] = @"0x000000001D000001";
  v2[13] = @"0x000000001C000001";
  v3[12] = @"ClosureState";
  v3[13] = @"CriticalInputStream";
  v2[14] = @"0x0000000016000006";
  v2[15] = @"0x0000000011000005";
  v3[14] = @"DeepLinkSetting";
  v3[15] = @"Defrost";
  v2[16] = @"0x000000001F000008";
  v2[17] = @"0x000000001A000009";
  v3[16] = @"DisplayUnits";
  v3[17] = @"DisplayedSpeed";
  v2[18] = @"0x000000001A000008";
  v2[19] = @"0x000000001A00000D";
  v3[18] = @"DriveMode";
  v3[19] = @"EnginePower";
  v2[20] = @"0x000000001A00000F";
  v2[21] = @"0x000000001A000010";
  v3[20] = @"EngineRPM";
  v3[21] = @"EngineTemperature";
  v2[22] = @"0x0000000013000003";
  v2[23] = @"0x0000000011000009";
  v3[22] = @"Equalizer";
  v3[23] = @"ExteriorConditions";
  v2[24] = @"0x0000000011000007";
  v2[25] = @"0x0000000016000003";
  v3[24] = @"Fan";
  v3[25] = @"FloatSetting";
  v2[26] = @"0x000000001A000014";
  v2[27] = @"0x000000001A000005";
  v3[26] = @"FuelConsumption";
  v3[27] = @"FuelLevel";
  v2[28] = @"0x000000001A000007";
  v2[29] = @"0x0000000021000001";
  v3[28] = @"GearRecommendation";
  v3[29] = @"HistoricalNotification";
  v2[30] = @"0x0000000016000007";
  v2[31] = @"0x0000000011000013";
  v3[30] = @"IntegerSetting";
  v3[31] = @"InteriorConditions";
  v2[32] = @"0x0000000017000002";
  v2[33] = @"0x0000000014000006";
  v3[32] = @"LocalNotification";
  v3[33] = @"MediaSource";
  v2[34] = @"0x0000000016000017";
  v2[35] = @"0x0000000016000005";
  v3[34] = @"MultipleSelectImageSetting";
  v3[35] = @"MultipleSelectSetting";
  v2[36] = @"0x0000000014000001";
  v2[37] = @"0x000000001A00000A";
  v3[36] = @"NowPlaying";
  v3[37] = @"Odometer";
  v2[38] = @"0x0000000016000019";
  v2[39] = @"0x0000000016000018";
  v3[38] = @"PairedDevicesAction";
  v3[39] = @"PairedDevicesInformation";
  v2[40] = @"0x0000000017000003";
  v2[41] = @"0x00000000FE000006";
  v3[40] = @"Picker";
  v3[41] = @"ProtocolPerfTest";
  v2[42] = @"0x0000000011000011";
  v2[43] = @"0x000000001A00000B";
  v3[42] = @"Recirculation";
  v3[43] = @"RemainingRange";
  v2[44] = @"0x0000000017000001";
  v2[45] = @"0x0000000017000004";
  v3[44] = @"RemoteNotification";
  v3[45] = @"RequestContent";
  v2[46] = @"0x0000000022000004";
  v2[47] = @"0x0000000022000002";
  v3[46] = @"SeatBelt";
  v3[47] = @"SeatFan";
  v2[48] = @"0x0000000022000001";
  v2[49] = @"0x0000000016000020";
  v3[48] = @"SeatHeatingCooling";
  v3[49] = @"SettingsSection";
  v2[50] = @"0x0000000016000016";
  v2[51] = @"0x0000000016000004";
  v3[50] = @"SingleSelectImageSetting";
  v3[51] = @"SingleSelectSetting";
  v2[52] = @"0x0000000013000005";
  v2[53] = @"0x0000000016000015";
  v3[52] = @"SoundDistribution";
  v3[53] = @"StaticSetting";
  v2[54] = @"0x0000000011000003";
  v2[55] = @"0x000000001E000004";
  v3[54] = @"SteeringWheelHeatingCooling";
  v3[55] = @"TargetSpeed";
  v2[56] = @"0x0000000011000002";
  v2[57] = @"0x00000000FE000009";
  v3[56] = @"Temperature";
  v3[57] = @"TestControlAsync";
  v2[58] = @"0x00000000FE00000A";
  v2[59] = @"0x00000000FE000008";
  v3[58] = @"TestControlEvent";
  v3[59] = @"TestControlSync";
  v2[60] = @"0x000000001B000001";
  v2[61] = @"0x000000001B000006";
  v3[60] = @"TirePressure";
  v3[61] = @"TirePressureMonitoringSystem";
  v2[62] = @"0x000000001A000003";
  v2[63] = @"0x0000000015000002";
  v3[62] = @"TransmissionStatus";
  v3[63] = @"Trip";
  v2[64] = @"0x00000000FE000001";
  v3[64] = @"TypeTest";
  v2[65] = @"0x00000000FE000004";
  v3[65] = @"TypeTestIndexByPosition";
  v2[66] = @"0x00000000FE000005";
  v3[66] = @"TypeTestIndexByUnit";
  v2[67] = @"0x00000000FE000003";
  v3[67] = @"TypeTestMulti";
  v2[68] = @"0x00000000FE000007";
  v3[68] = @"TypeTestWithStates";
  v2[69] = @"0x0000000011100002";
  v3[69] = @"UIInputDeviceButton";
  v2[70] = @"0x0000000011100001";
  v3[70] = @"UIState";
  v2[71] = @"0x000000001A000013";
  v3[71] = @"VehicleInformation";
  v2[72] = @"0x0000000020000001";
  v3[72] = @"VehicleVariant";
  v2[73] = @"0x0000000011000006";
  v3[73] = @"Vent";
  v2[74] = @"0x0000000013000002";
  v3[74] = @"Volume";
  v2[75] = @"0x0000000011000012";
  v3[75] = @"ZonesSynced";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:76];
  v1 = (void *)serviceNameByType__serviceNameByType;
  serviceNameByType__serviceNameByType = v0;
}

+ (NSSet)stateCaptureValues
{
  if (stateCaptureValues_onceToken_1 != -1) {
    dispatch_once(&stateCaptureValues_onceToken_1, &__block_literal_global_479);
  }
  v2 = (void *)stateCaptureValues__stateCaptureValues_1;
  return (NSSet *)v2;
}

void __37__CAFServiceTypes_stateCaptureValues__block_invoke()
{
  v4[67] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = @"0x0000000011000008";
  v4[1] = @"0x000000001A000006";
  v4[2] = @"0x000000001A000011";
  v4[3] = @"0x0000000016000001";
  v4[4] = @"0x0000000016000002";
  v4[5] = @"0x0000000011000001";
  v4[6] = @"0x000000001F000002";
  v4[7] = @"0x000000001F000001";
  v4[8] = @"0x0000000019000003";
  v4[9] = @"0x0000000019000002";
  v4[10] = @"0x0000000019000007";
  v4[11] = @"0x0000000011000010";
  v4[12] = @"0x000000001D000001";
  v4[13] = @"0x000000001C000001";
  v4[14] = @"0x0000000016000006";
  v4[15] = @"0x0000000011000005";
  v4[16] = @"0x000000001F000008";
  v4[17] = @"0x000000001A000009";
  v4[18] = @"0x000000001A000008";
  v4[19] = @"0x000000001A00000D";
  v4[20] = @"0x000000001A00000F";
  v4[21] = @"0x000000001A000010";
  v4[22] = @"0x0000000013000003";
  v4[23] = @"0x0000000011000009";
  v4[24] = @"0x0000000011000007";
  v4[25] = @"0x0000000016000003";
  v4[26] = @"0x000000001A000014";
  v4[27] = @"0x000000001A000005";
  v4[28] = @"0x000000001A000007";
  v4[29] = @"0x0000000021000001";
  v4[30] = @"0x0000000016000007";
  v4[31] = @"0x0000000011000013";
  v4[32] = @"0x0000000017000002";
  v4[33] = @"0x0000000014000006";
  v4[34] = @"0x0000000016000017";
  v4[35] = @"0x0000000016000005";
  v4[36] = @"0x0000000014000001";
  v4[37] = @"0x000000001A00000A";
  v4[38] = @"0x0000000016000019";
  v4[39] = @"0x0000000016000018";
  v4[40] = @"0x0000000017000003";
  v4[41] = @"0x0000000011000011";
  v4[42] = @"0x000000001A00000B";
  v4[43] = @"0x0000000017000001";
  v4[44] = @"0x0000000017000004";
  v4[45] = @"0x0000000022000004";
  v4[46] = @"0x0000000022000002";
  v4[47] = @"0x0000000022000001";
  v4[48] = @"0x0000000016000020";
  v4[49] = @"0x0000000016000016";
  v4[50] = @"0x0000000016000004";
  v4[51] = @"0x0000000013000005";
  v4[52] = @"0x0000000016000015";
  v4[53] = @"0x0000000011000003";
  v4[54] = @"0x000000001E000004";
  v4[55] = @"0x0000000011000002";
  v4[56] = @"0x000000001B000001";
  v4[57] = @"0x000000001B000006";
  v4[58] = @"0x000000001A000003";
  v4[59] = @"0x0000000015000002";
  v4[60] = @"0x0000000011100002";
  v4[61] = @"0x0000000011100001";
  v4[62] = @"0x000000001A000013";
  v4[63] = @"0x0000000020000001";
  v4[64] = @"0x0000000011000006";
  v4[65] = @"0x0000000013000002";
  v4[66] = @"0x0000000011000012";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:67];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)stateCaptureValues__stateCaptureValues_1;
  stateCaptureValues__stateCaptureValues_1 = v2;
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

+ (id)serviceNameFor:(id)a3
{
  id v4 = [a1 serviceTypeFor:a3];
  v5 = [a1 serviceNameForType:v4];

  return v5;
}

+ (id)serviceTypeFor:(id)a3
{
  return (id)[a3 serviceType];
}

@end