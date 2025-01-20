@interface APSystemInfo
+ (BOOL)firstRunSinceReboot;
+ (NSString)bundleIdentifier;
+ (NSString)deviceModel;
+ (NSString)locale;
+ (NSString)longBuildVersion;
+ (NSString)modelType;
+ (NSString)osIdentifier;
+ (NSString)osName;
+ (NSString)osVersion;
+ (NSString)shortBuildVersion;
+ (NSString)systemDescription;
@end

@implementation APSystemInfo

+ (NSString)osIdentifier
{
  return (NSString *)MEMORY[0x1F4181798](SystemInfoInternal, sel_osIdentifier);
}

+ (NSString)osName
{
  return (NSString *)MEMORY[0x1F4181798](SystemInfoInternal, sel_osName);
}

+ (NSString)osVersion
{
  return (NSString *)MEMORY[0x1F4181798](SystemInfoInternal, sel_osVersion);
}

+ (NSString)longBuildVersion
{
  return (NSString *)MEMORY[0x1F4181798](SystemInfoInternal, sel_longBuildVersion);
}

+ (NSString)shortBuildVersion
{
  return (NSString *)MEMORY[0x1F4181798](SystemInfoInternal, sel_shortBuildVersion);
}

+ (NSString)systemDescription
{
  return (NSString *)MEMORY[0x1F4181798](SystemInfoInternal, sel_systemDescription);
}

+ (NSString)bundleIdentifier
{
  return +[SystemInfoInternal bundleIdentifier];
}

+ (NSString)locale
{
  return (NSString *)MEMORY[0x1F4181798](SystemInfoInternal, sel_locale);
}

+ (NSString)deviceModel
{
  return +[SystemInfoInternal deviceModel];
}

+ (NSString)modelType
{
  return (NSString *)MEMORY[0x1F4181798](SystemInfoInternal, sel_modelType);
}

+ (BOOL)firstRunSinceReboot
{
  return MEMORY[0x1F4181798](SystemInfoInternal, sel_firstRunSinceReboot);
}

@end