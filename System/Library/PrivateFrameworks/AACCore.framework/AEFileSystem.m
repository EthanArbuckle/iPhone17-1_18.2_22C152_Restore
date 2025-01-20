@interface AEFileSystem
+ (NSURL)assessmentAgentContainerURL;
+ (NSURL)assessmentAgentPolicyStoreDirectoryURL;
+ (NSURL)assessmentModeFileURL;
+ (id)baseURLForGloballyAvailableFiles;
@end

@implementation AEFileSystem

+ (NSURL)assessmentAgentContainerURL
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, a1, @"AEFileSystem.m", 53, @"%@ is unimplemented on iOS", v5 object file lineNumber description];

  return 0;
}

+ (NSURL)assessmentAgentPolicyStoreDirectoryURL
{
  v2 = +[AEFileSystem baseURLForGloballyAvailableFiles]();
  v3 = [v2 URLByAppendingPathComponent:@"PolicyStore" isDirectory:1];

  return (NSURL *)v3;
}

+ (id)baseURLForGloballyAvailableFiles
{
  self;
  self;
  v0 = [NSURL fileURLWithPath:@"/private/var/mobile" isDirectory:1];
  v1 = [v0 URLByAppendingPathComponent:@"Library" isDirectory:1];

  v2 = [v1 URLByAppendingPathComponent:@"com.apple.assessmentagent" isDirectory:1];

  return v2;
}

+ (NSURL)assessmentModeFileURL
{
  v2 = +[AEFileSystem baseURLForGloballyAvailableFiles]();
  v3 = [v2 URLByAppendingPathComponent:@"ModeActive"];

  return (NSURL *)v3;
}

@end