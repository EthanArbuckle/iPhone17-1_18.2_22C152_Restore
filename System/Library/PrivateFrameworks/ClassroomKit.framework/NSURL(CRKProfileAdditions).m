@interface NSURL(CRKProfileAdditions)
+ (id)crk_macOSProfileURL;
+ (uint64_t)crk_iOSPlaceholderProfileURL;
@end

@implementation NSURL(CRKProfileAdditions)

+ (id)crk_macOSProfileURL
{
  v7[4] = *MEMORY[0x263EF8340];
  v0 = objc_msgSend(MEMORY[0x263F08850], "crk_nonContainerizedHomeDirectoryURL");
  v1 = NSString;
  v2 = [v0 path];
  v7[0] = v2;
  v7[1] = @"Library";
  v7[2] = @"Apple Education Configuration";
  v7[3] = @"Configuration.plist";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:4];
  v4 = [v1 pathWithComponents:v3];

  v5 = [NSURL fileURLWithPath:v4];

  return v5;
}

+ (uint64_t)crk_iOSPlaceholderProfileURL
{
  return [NSURL fileURLWithPath:@"/var/mobile/Library/Classroom/StudentConfiguration.plist"];
}

@end