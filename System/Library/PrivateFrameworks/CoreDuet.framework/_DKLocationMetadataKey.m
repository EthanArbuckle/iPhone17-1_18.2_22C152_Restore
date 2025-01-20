@interface _DKLocationMetadataKey
+ (id)altitude;
+ (id)identifier;
+ (id)latitude;
+ (id)longitude;
@end

@implementation _DKLocationMetadataKey

+ (id)latitude
{
  return @"_DKLocationMetadataKey-latitude";
}

+ (id)longitude
{
  return @"_DKLocationMetadataKey-longitude";
}

+ (id)altitude
{
  return @"_DKLocationMetadataKey-altitude";
}

+ (id)identifier
{
  return @"_DKLocationMetadataKey-identifier";
}

@end