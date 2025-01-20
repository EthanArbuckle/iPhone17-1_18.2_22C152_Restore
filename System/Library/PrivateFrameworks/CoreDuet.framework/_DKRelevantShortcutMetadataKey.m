@interface _DKRelevantShortcutMetadataKey
+ (id)keyImageProxyIdentifier;
+ (id)serializedKeyImage;
+ (id)serializedRelevantShortcut;
@end

@implementation _DKRelevantShortcutMetadataKey

+ (id)serializedRelevantShortcut
{
  return @"_DKRelevantShortcutMetadataKey-serializedRelevantShortcut";
}

+ (id)keyImageProxyIdentifier
{
  return @"_DKRelevantShortcutMetadataKey-keyImageProxyIdentifier";
}

+ (id)serializedKeyImage
{
  return @"_DKRelevantShortcutMetadataKey-serializedKeyImage";
}

@end