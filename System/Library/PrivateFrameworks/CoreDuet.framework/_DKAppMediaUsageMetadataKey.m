@interface _DKAppMediaUsageMetadataKey
+ (id)URL;
+ (id)mediaURL;
@end

@implementation _DKAppMediaUsageMetadataKey

+ (id)URL
{
  return @"_DKAppMediaUsageMetadataKey-URL";
}

+ (id)mediaURL
{
  return @"_DKAppMediaUsageMetadataKey-mediaURL";
}

@end