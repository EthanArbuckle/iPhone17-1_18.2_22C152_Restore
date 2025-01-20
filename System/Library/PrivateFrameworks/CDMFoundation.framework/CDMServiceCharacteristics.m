@interface CDMServiceCharacteristics
+ (BOOL)isRunningDaemon;
@end

@implementation CDMServiceCharacteristics

+ (BOOL)isRunningDaemon
{
  return +[CDMFeatureFlags isCDMClientXPCEnabled];
}

@end