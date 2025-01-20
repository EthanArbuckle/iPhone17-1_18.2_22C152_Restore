@interface _DKAudioMetadataKey
+ (id)channels;
+ (id)dataSources;
+ (id)identifier;
+ (id)portName;
+ (id)portType;
+ (id)preferredDataSource;
+ (id)routeChangeReason;
+ (id)selectedDataSource;
@end

@implementation _DKAudioMetadataKey

+ (id)portType
{
  return @"_DKAudioMetadataKey-portType";
}

+ (id)portName
{
  return @"_DKAudioMetadataKey-portName";
}

+ (id)identifier
{
  return @"_DKAudioMetadataKey-identifier";
}

+ (id)channels
{
  return @"_DKAudioMetadataKey-channels";
}

+ (id)dataSources
{
  return @"_DKAudioMetadataKey-dataSources";
}

+ (id)selectedDataSource
{
  return @"_DKAudioMetadataKey-selectedDataSource";
}

+ (id)preferredDataSource
{
  return @"_DKAudioMetadataKey-preferredDataSource";
}

+ (id)routeChangeReason
{
  return @"_DKAudioMetadataKey-routeChangeReason";
}

@end