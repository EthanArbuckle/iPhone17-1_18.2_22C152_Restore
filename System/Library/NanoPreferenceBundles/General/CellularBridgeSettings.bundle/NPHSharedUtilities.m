@interface NPHSharedUtilities
+ (BOOL)isActiveDeviceTinker;
+ (BOOL)isActiveWatchChinaRegionCellular;
+ (BOOL)pairedDeviceHasHomeButton;
@end

@implementation NPHSharedUtilities

+ (BOOL)isActiveDeviceTinker
{
  v2 = +[NRDevice activeDevice];
  unsigned int v3 = [v2 isTinker];

  v4 = nph_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "+[NPHSharedUtilities isActiveDeviceTinker]";
    __int16 v8 = 1024;
    unsigned int v9 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%s : %d", (uint8_t *)&v6, 0x12u);
  }

  return v3;
}

+ (BOOL)pairedDeviceHasHomeButton
{
  if (qword_22F90 != -1) {
    dispatch_once(&qword_22F90, &stru_1C818);
  }
  return byte_22F98;
}

+ (BOOL)isActiveWatchChinaRegionCellular
{
  v2 = +[NRDevice activeDevice];
  unsigned int v3 = [v2 valueForProperty:NRDevicePropertyGreenTeaDevice];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

@end