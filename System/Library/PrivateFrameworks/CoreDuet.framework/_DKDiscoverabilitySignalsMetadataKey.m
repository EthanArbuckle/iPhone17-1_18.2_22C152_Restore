@interface _DKDiscoverabilitySignalsMetadataKey
+ (id)context;
+ (id)osBuild;
+ (id)userInfo;
@end

@implementation _DKDiscoverabilitySignalsMetadataKey

+ (id)context
{
  return @"_DKDiscoverabilitySignalsMetadataKey-context";
}

+ (id)userInfo
{
  return @"_DKDiscoverabilitySignalsMetadataKey-userInfo";
}

+ (id)osBuild
{
  return @"_DKDiscoverabilitySignalsMetadataKey-osBuild";
}

@end