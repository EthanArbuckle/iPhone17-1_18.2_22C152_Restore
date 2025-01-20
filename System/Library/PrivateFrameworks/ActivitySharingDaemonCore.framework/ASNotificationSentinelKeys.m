@interface ASNotificationSentinelKeys
+ (NSString)awaitingSentinelKey;
+ (NSString)sentinelKey;
@end

@implementation ASNotificationSentinelKeys

+ (NSString)awaitingSentinelKey
{
  return (NSString *)&stru_26FB96980;
}

+ (NSString)sentinelKey
{
  return (NSString *)&stru_26FB96980;
}

@end