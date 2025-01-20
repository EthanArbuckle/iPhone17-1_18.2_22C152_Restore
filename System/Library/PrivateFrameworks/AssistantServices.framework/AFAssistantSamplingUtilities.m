@interface AFAssistantSamplingUtilities
+ (id)component;
+ (id)sampledCachesSubDirectoryPath;
+ (id)sampledSubDirectoryPath;
+ (id)samplingDateAsString;
@end

@implementation AFAssistantSamplingUtilities

+ (id)samplingDateAsString
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  v3 = [(id)objc_opt_class() dateFormatter];
  v4 = [v3 stringFromDate:v2];

  return v4;
}

+ (id)sampledCachesSubDirectoryPath
{
  return @"com.apple.assistantd/AssistantSampled";
}

+ (id)sampledSubDirectoryPath
{
  return @"/Assistant/AssistantSampled";
}

+ (id)component
{
  return @"Assistant";
}

@end