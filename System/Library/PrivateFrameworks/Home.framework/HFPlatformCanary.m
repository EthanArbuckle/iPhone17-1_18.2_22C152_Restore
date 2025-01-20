@interface HFPlatformCanary
+ (BOOL)isiOSBuild;
+ (id)tweet;
@end

@implementation HFPlatformCanary

+ (id)tweet
{
  v2 = [MEMORY[0x263F1C550] redColor];
  uint64_t v7 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  [v2 getRed:&v7 green:&v6 blue:&v5 alpha:0];
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"This is not a mac: red %f green %f blue %f", v7, v6, v5);

  return v3;
}

+ (BOOL)isiOSBuild
{
  return 1;
}

@end