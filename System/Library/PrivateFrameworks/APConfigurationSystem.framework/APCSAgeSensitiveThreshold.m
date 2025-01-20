@interface APCSAgeSensitiveThreshold
+ (id)path;
@end

@implementation APCSAgeSensitiveThreshold

+ (id)path
{
  return @"Policy/AgeSensitiveEnforcement/EligibilityThreshold";
}

@end