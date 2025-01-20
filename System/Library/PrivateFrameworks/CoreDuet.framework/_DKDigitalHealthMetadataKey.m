@interface _DKDigitalHealthMetadataKey
+ (id)isUsageTrusted;
+ (id)safariProfileID;
+ (id)usageType;
+ (id)webDomain;
+ (id)webpageURL;
@end

@implementation _DKDigitalHealthMetadataKey

+ (id)usageType
{
  return @"_DKDigitalHealthMetadataKey-usageType";
}

+ (id)isUsageTrusted
{
  return @"_DKDigitalHealthMetadataKey-isUsageTrusted";
}

+ (id)webDomain
{
  return @"_DKDigitalHealthMetadataKey-webDomain";
}

+ (id)webpageURL
{
  return @"_DKDigitalHealthMetadataKey-webpageURL";
}

+ (id)safariProfileID
{
  return @"_DKDigitalHealthMetadataKey-safariProfileID";
}

@end