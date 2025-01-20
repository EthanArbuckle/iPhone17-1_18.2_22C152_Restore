@interface _DKNotificationUsageMetadataKey
+ (id)bundleID;
+ (id)identifier;
@end

@implementation _DKNotificationUsageMetadataKey

+ (id)identifier
{
  return @"_DKNotificationUsageMetadataKey-identifier";
}

+ (id)bundleID
{
  return @"_DKNotificationUsageMetadataKey-bundleID";
}

@end