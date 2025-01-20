@interface _DKAppClipUsageMetadataKey
+ (id)URLHash;
+ (id)appBundleID;
+ (id)clipBundleID;
+ (id)fullURL;
+ (id)launchReason;
+ (id)referrerBundleID;
+ (id)referrerURL;
+ (id)timeSinceDownload;
+ (id)webAppBundleID;
@end

@implementation _DKAppClipUsageMetadataKey

+ (id)appBundleID
{
  return @"_DKAppClipUsageMetadataKey-appBundleID";
}

+ (id)timeSinceDownload
{
  return @"_DKAppClipUsageMetadataKey-timeSinceDownload";
}

+ (id)URLHash
{
  return @"_DKAppClipUsageMetadataKey-URLHash";
}

+ (id)clipBundleID
{
  return @"_DKAppClipUsageMetadataKey-clipBundleID";
}

+ (id)webAppBundleID
{
  return @"_DKAppClipUsageMetadataKey-webAppBundleID";
}

+ (id)launchReason
{
  return @"_DKAppClipUsageMetadataKey-launchReason";
}

+ (id)fullURL
{
  return @"_DKAppClipUsageMetadataKey-fullURL";
}

+ (id)referrerURL
{
  return @"_DKAppClipUsageMetadataKey-referrerURL";
}

+ (id)referrerBundleID
{
  return @"_DKAppClipUsageMetadataKey-referrerBundleID";
}

@end