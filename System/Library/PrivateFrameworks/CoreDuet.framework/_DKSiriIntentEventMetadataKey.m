@interface _DKSiriIntentEventMetadataKey
+ (id)eventData;
+ (id)eventType;
@end

@implementation _DKSiriIntentEventMetadataKey

+ (id)eventType
{
  return @"_DKSiriIntentEventMetadataKey-eventType";
}

+ (id)eventData
{
  return @"_DKSiriIntentEventMetadataKey-eventData";
}

@end