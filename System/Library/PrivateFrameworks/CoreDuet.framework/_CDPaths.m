@interface _CDPaths
+ (id)DKKnowledgeTestDirectoryString;
+ (id)bundleBuiltInPlugInsPath;
+ (id)bundlePathForResource:(id)a3 ofType:(id)a4;
+ (id)defaultDirectoryPathForDataCollection;
+ (id)defaultSessionPathForDataCollection;
+ (id)defaultSleepPath;
+ (id)eventPlistPath;
+ (id)interactionCopyDirectory;
+ (id)interactionTestDirectory;
+ (id)knowledgeDirectory;
+ (id)knowledgeTestDirectory;
+ (id)modelDirectory;
+ (id)monitorBundlePath;
+ (id)otaSleepPath;
+ (id)peopleDirectory;
+ (id)policiesConfigPath;
+ (id)simulatorHomePathFor:(id)a3;
+ (id)simulatorSharedPathFor:(id)a3;
+ (id)simulatorSystemPathFor:(id)a3 withEnvVar:(id)a4;
+ (id)systemCachesDirectory;
+ (id)userKnowledgeDirectory;
@end

@implementation _CDPaths

+ (id)knowledgeDirectory
{
  return @"/var/mobile/Library/CoreDuet/Knowledge/";
}

+ (id)peopleDirectory
{
  return @"/var/mobile/Library/CoreDuet/People/";
}

+ (id)bundlePathForResource:(id)a3 ofType:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F28B50];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 bundleForClass:a1];
  v10 = [v9 pathForResource:v8 ofType:v7];

  return v10;
}

+ (id)bundleBuiltInPlugInsPath
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:a1];
  v3 = [v2 builtInPlugInsPath];

  return v3;
}

+ (id)simulatorSystemPathFor:(id)a3 withEnvVar:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F28F80];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 processInfo];
  v9 = [v8 environment];
  v10 = [v9 objectForKey:v6];

  v11 = [v10 stringByAppendingString:v7];

  return v11;
}

+ (id)simulatorHomePathFor:(id)a3
{
  id v3 = a3;
  v4 = NSHomeDirectory();
  v5 = [v4 stringByAppendingString:v3];

  return v5;
}

+ (id)simulatorSharedPathFor:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] arrayWithObject:@"/tmp"];
  [v4 addObject:@"Developer/CoreSimulator/Shared/data"];
  if (v3 && [v3 length]) {
    [v4 addObject:v3];
  }
  v5 = [NSString pathWithComponents:v4];

  return v5;
}

+ (id)eventPlistPath
{
  return (id)[a1 bundlePathForResource:@"com.apple.coreduet.systemevents" ofType:@"plist"];
}

+ (id)otaSleepPath
{
  return @"/var/mobile/Library/CoreDuet/CoreDuetSleepConfig.bundle";
}

+ (id)defaultSleepPath
{
  return @"/System/Library/CoreDuet/CoreDuetSleepConfig.bundle";
}

+ (id)systemCachesDirectory
{
  return @"/var/mobile/Library/CoreDuet/Caches/";
}

+ (id)modelDirectory
{
  return @"/var/mobile/Library/CoreDuet/Models/";
}

+ (id)userKnowledgeDirectory
{
  return +[_CDPaths knowledgeDirectory];
}

+ (id)policiesConfigPath
{
  return @"/System/Library/DuetKnowledgeBase/Events/com.apple.coreduet.interaction.policies.plist";
}

+ (id)monitorBundlePath
{
  return @"/System/Library/DuetKnowledgeBase/Monitors";
}

+ (id)knowledgeTestDirectory
{
  return @"/var/tmp/knowledgeTest";
}

+ (id)DKKnowledgeTestDirectoryString
{
  return +[_CDPaths knowledgeTestDirectory];
}

+ (id)interactionTestDirectory
{
  return @"/var/tmp/interactionStoreTest-";
}

+ (id)interactionCopyDirectory
{
  return @"/var/tmp/interactionTestAnonCopy";
}

+ (id)defaultSessionPathForDataCollection
{
  return @"/var/mobile/Library/CoreDuet/DataCollection/session.archive";
}

+ (id)defaultDirectoryPathForDataCollection
{
  v2 = NSTemporaryDirectory();
  id v3 = [v2 stringByAppendingPathComponent:@"CoreDuet/DataCollection"];

  return v3;
}

@end