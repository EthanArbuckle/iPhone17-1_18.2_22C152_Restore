@interface _DKApplicationMetadataKey
+ (id)backboardState;
+ (id)dyldPlatform;
+ (id)exactBundleVersion;
+ (id)extensionContainingBundleIdentifier;
+ (id)extensionHostIdentifier;
+ (id)isNativeArchitecture;
+ (id)launchReason;
+ (id)processIdentifier;
+ (id)shortVersionString;
@end

@implementation _DKApplicationMetadataKey

+ (id)shortVersionString
{
  return @"_DKApplicationMetadataKey-shortVersionString";
}

+ (id)exactBundleVersion
{
  return @"_DKApplicationMetadataKey-exactBundleVersion";
}

+ (id)launchReason
{
  return @"_DKApplicationMetadataKey-launchReason";
}

+ (id)processIdentifier
{
  return @"_DKApplicationMetadataKey-processIdentifier";
}

+ (id)backboardState
{
  return @"_DKApplicationMetadataKey-backboardState";
}

+ (id)extensionHostIdentifier
{
  return @"_DKApplicationMetadataKey-extensionHostIdentifier";
}

+ (id)extensionContainingBundleIdentifier
{
  return @"_DKApplicationMetadataKey-extensionContainingBundleIdentifier";
}

+ (id)isNativeArchitecture
{
  return @"_DKApplicationMetadataKey-isNativeArchitecture";
}

+ (id)dyldPlatform
{
  return @"_DKApplicationMetadataKey-dyldPlatform";
}

@end