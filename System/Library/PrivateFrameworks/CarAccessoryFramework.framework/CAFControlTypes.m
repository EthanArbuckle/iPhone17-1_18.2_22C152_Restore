@interface CAFControlTypes
+ (NSDictionary)controlNameByType;
+ (NSDictionary)controlTypeByName;
+ (id)controlNameFor:(id)a3;
+ (id)controlNameForType:(id)a3;
+ (id)controlTypeFor:(id)a3;
@end

@implementation CAFControlTypes

+ (NSDictionary)controlTypeByName
{
  if (controlTypeByName_onceToken != -1) {
    dispatch_once(&controlTypeByName_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)controlTypeByName__controlTypeByName;
  return (NSDictionary *)v2;
}

void __36__CAFControlTypes_controlTypeByName__block_invoke()
{
  v3[30] = *MEMORY[0x263EF8340];
  v2[0] = @"BeginSeekBackward";
  v2[1] = @"BeginSeekForward";
  v3[0] = @"0x000000000F000038";
  v3[1] = @"0x000000000F000037";
  v2[2] = @"ChangeMediaSource";
  v2[3] = @"ConnectDevice";
  v3[2] = @"0x000000000F00004D";
  v3[3] = @"0x000000003600001A";
  v2[4] = @"DisconnectDevice";
  v2[5] = @"EndSeek";
  v3[4] = @"0x000000003600001B";
  v3[5] = @"0x000000000F000039";
  v2[6] = @"ForgetDevice";
  v2[7] = @"JumpBackward";
  v3[6] = @"0x000000003600001C";
  v3[7] = @"0x000000000F00004A";
  v2[8] = @"JumpForward";
  v2[9] = @"NextItem";
  v3[8] = @"0x000000000F000040";
  v3[9] = @"0x000000000F000035";
  v2[10] = @"Pause";
  v2[11] = @"Play";
  v3[10] = @"0x000000000F000033";
  v3[11] = @"0x000000000F000032";
  v2[12] = @"PreviousItem";
  v2[13] = @"Reset";
  v3[12] = @"0x000000000F000036";
  v3[13] = @"0x0000000030000062";
  v2[14] = @"SetArtistSongNotification";
  v2[15] = @"Stop";
  v3[14] = @"0x000000000F00004E";
  v3[15] = @"0x000000000F000034";
  v2[16] = @"TestAccEventNoParams";
  v2[17] = @"TestAccEventWithParams";
  v3[16] = @"0x00000000FF000032";
  v3[17] = @"0x00000000FF000033";
  v2[18] = @"TestAccRequestNoParams";
  v2[19] = @"TestAccRequestWithReqAndResParams";
  v3[18] = @"0x00000000FF00002E";
  v3[19] = @"0x00000000FF000031";
  v2[20] = @"TestAccRequestWithReqParams";
  v2[21] = @"TestAccRequestWithResParams";
  v3[20] = @"0x00000000FF00002F";
  v3[21] = @"0x00000000FF000030";
  v2[22] = @"TestDevEventNoParams";
  v2[23] = @"TestDevEventWithParams";
  v3[22] = @"0x00000000FF00002C";
  v3[23] = @"0x00000000FF00002D";
  v2[24] = @"TestDevRequestNoParams";
  v2[25] = @"TestDevRequestWithReqAndResParams";
  v3[24] = @"0x00000000FF000028";
  v3[25] = @"0x00000000FF00002B";
  v2[26] = @"TestDevRequestWithReqParams";
  v2[27] = @"TestDevRequestWithResParams";
  v3[26] = @"0x00000000FF000029";
  v3[27] = @"0x00000000FF00002A";
  v2[28] = @"TuneToFrequency";
  v2[29] = @"TuneToIdentifier";
  v3[28] = @"0x000000000F00004C";
  v3[29] = @"0x000000000F00004B";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:30];
  v1 = (void *)controlTypeByName__controlTypeByName;
  controlTypeByName__controlTypeByName = v0;
}

+ (NSDictionary)controlNameByType
{
  if (controlNameByType_onceToken != -1) {
    dispatch_once(&controlNameByType_onceToken, &__block_literal_global_201);
  }
  v2 = (void *)controlNameByType__controlNameByType;
  return (NSDictionary *)v2;
}

void __36__CAFControlTypes_controlNameByType__block_invoke()
{
  v3[30] = *MEMORY[0x263EF8340];
  v2[0] = @"0x000000000F000038";
  v2[1] = @"0x000000000F000037";
  v3[0] = @"BeginSeekBackward";
  v3[1] = @"BeginSeekForward";
  v2[2] = @"0x000000000F00004D";
  v2[3] = @"0x000000003600001A";
  v3[2] = @"ChangeMediaSource";
  v3[3] = @"ConnectDevice";
  v2[4] = @"0x000000003600001B";
  v2[5] = @"0x000000000F000039";
  v3[4] = @"DisconnectDevice";
  v3[5] = @"EndSeek";
  v2[6] = @"0x000000003600001C";
  v2[7] = @"0x000000000F00004A";
  v3[6] = @"ForgetDevice";
  v3[7] = @"JumpBackward";
  v2[8] = @"0x000000000F000040";
  v2[9] = @"0x000000000F000035";
  v3[8] = @"JumpForward";
  v3[9] = @"NextItem";
  v2[10] = @"0x000000000F000033";
  v2[11] = @"0x000000000F000032";
  v3[10] = @"Pause";
  v3[11] = @"Play";
  v2[12] = @"0x000000000F000036";
  v2[13] = @"0x0000000030000062";
  v3[12] = @"PreviousItem";
  v3[13] = @"Reset";
  v2[14] = @"0x000000000F00004E";
  v2[15] = @"0x000000000F000034";
  v3[14] = @"SetArtistSongNotification";
  v3[15] = @"Stop";
  v2[16] = @"0x00000000FF000032";
  v2[17] = @"0x00000000FF000033";
  v3[16] = @"TestAccEventNoParams";
  v3[17] = @"TestAccEventWithParams";
  v2[18] = @"0x00000000FF00002E";
  v2[19] = @"0x00000000FF000031";
  v3[18] = @"TestAccRequestNoParams";
  v3[19] = @"TestAccRequestWithReqAndResParams";
  v2[20] = @"0x00000000FF00002F";
  v2[21] = @"0x00000000FF000030";
  v3[20] = @"TestAccRequestWithReqParams";
  v3[21] = @"TestAccRequestWithResParams";
  v2[22] = @"0x00000000FF00002C";
  v2[23] = @"0x00000000FF00002D";
  v3[22] = @"TestDevEventNoParams";
  v3[23] = @"TestDevEventWithParams";
  v2[24] = @"0x00000000FF000028";
  v2[25] = @"0x00000000FF00002B";
  v3[24] = @"TestDevRequestNoParams";
  v3[25] = @"TestDevRequestWithReqAndResParams";
  v2[26] = @"0x00000000FF000029";
  v2[27] = @"0x00000000FF00002A";
  v3[26] = @"TestDevRequestWithReqParams";
  v3[27] = @"TestDevRequestWithResParams";
  v2[28] = @"0x000000000F00004C";
  v2[29] = @"0x000000000F00004B";
  v3[28] = @"TuneToFrequency";
  v3[29] = @"TuneToIdentifier";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:30];
  v1 = (void *)controlNameByType__controlNameByType;
  controlNameByType__controlNameByType = v0;
}

+ (id)controlNameForType:(id)a3
{
  id v4 = a3;
  v5 = [a1 controlNameByType];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6) {
    id v6 = v4;
  }

  return v6;
}

+ (id)controlNameFor:(id)a3
{
  id v4 = [a1 controlTypeFor:a3];
  v5 = [a1 controlNameForType:v4];

  return v5;
}

+ (id)controlTypeFor:(id)a3
{
  return (id)[a3 controlType];
}

@end