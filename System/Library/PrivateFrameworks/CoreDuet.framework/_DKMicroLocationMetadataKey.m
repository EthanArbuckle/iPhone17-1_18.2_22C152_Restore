@interface _DKMicroLocationMetadataKey
+ (id)domain;
+ (id)locationDistribution;
+ (id)microLocationDistribution;
+ (id)microLocationIsStable;
+ (id)probabilityVector;
@end

@implementation _DKMicroLocationMetadataKey

+ (id)domain
{
  return @"_DKMicroLocationMetadataKey-domain";
}

+ (id)probabilityVector
{
  return @"_DKMicroLocationMetadataKey-probabilityVector";
}

+ (id)locationDistribution
{
  return @"_DKMicroLocationMetadataKey-locationDistribution";
}

+ (id)microLocationDistribution
{
  return @"_DKMicroLocationMetadataKey-microLocationDistribution";
}

+ (id)microLocationIsStable
{
  return @"_DKMicroLocationMetadataKey-microLocationIsStable";
}

@end