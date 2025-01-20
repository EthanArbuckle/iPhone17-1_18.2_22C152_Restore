@interface CDMXPCSystemEventTypeNames
+ (id)getNameStringToEnumDict;
@end

@implementation CDMXPCSystemEventTypeNames

+ (id)getNameStringToEnumDict
{
  if (getNameStringToEnumDict_onceToken_8168 != -1) {
    dispatch_once(&getNameStringToEnumDict_onceToken_8168, &__block_literal_global_8169);
  }
  v2 = (void *)getNameStringToEnumDict_cdmXpcSystemEventTypeNameStringToEnum;
  return v2;
}

void __53__CDMXPCSystemEventTypeNames_getNameStringToEnumDict__block_invoke()
{
  v10[7] = *MEMORY[0x263EF8340];
  v9[0] = @"com.apple.siri.cdm.xpc_activity.maintenance";
  v0 = (void *)[objc_alloc(NSNumber) initWithInt:1];
  v10[0] = v0;
  v9[1] = @"com.apple.siri.cdm.xpc_activity.post_install";
  v1 = (void *)[objc_alloc(NSNumber) initWithInt:2];
  v10[1] = v1;
  v9[2] = @"com.apple.trial.NamespaceUpdate.SIRI_UNDERSTANDING_NL";
  v2 = (void *)[objc_alloc(NSNumber) initWithInt:3];
  v10[2] = v2;
  v9[3] = @"com.apple.siri.uaf.com.apple.siri.understanding";
  v3 = (void *)[objc_alloc(NSNumber) initWithInt:3];
  v10[3] = v3;
  v9[4] = @"com.apple.LaunchServices.applicationRegistered";
  v4 = (void *)[objc_alloc(NSNumber) initWithInt:4];
  v10[4] = v4;
  v9[5] = @"com.apple.LaunchServices.applicationUnregistered";
  v5 = (void *)[objc_alloc(NSNumber) initWithInt:5];
  v10[5] = v5;
  v9[6] = @"com.apple.siri.VoiceShortcuts.DataDidUpdateNotification";
  v6 = (void *)[objc_alloc(NSNumber) initWithInt:6];
  v10[6] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:7];
  v8 = (void *)getNameStringToEnumDict_cdmXpcSystemEventTypeNameStringToEnum;
  getNameStringToEnumDict_cdmXpcSystemEventTypeNameStringToEnum = v7;
}

@end