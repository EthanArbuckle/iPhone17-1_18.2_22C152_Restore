@interface _DKIntentMetadataKey
+ (id)derivedIntentIdentifier;
+ (id)direction;
+ (id)donatedBySiri;
+ (id)intentClass;
+ (id)intentHandlingStatus;
+ (id)intentType;
+ (id)intentVerb;
+ (id)interactionIdentifier;
+ (id)relatedContactIdentifiers;
+ (id)serializedInteraction;
+ (id)serializedKeyImage;
+ (id)shortcutAvailability;
@end

@implementation _DKIntentMetadataKey

+ (id)serializedInteraction
{
  return @"_DKIntentMetadataKey-interaction";
}

+ (id)direction
{
  return @"_DKIntentMetadataKey-direction";
}

+ (id)intentClass
{
  return @"_DKIntentMetadataKey-intentClass";
}

+ (id)intentType
{
  return @"_DKIntentMetadataKey-intentType";
}

+ (id)intentVerb
{
  return @"_DKIntentMetadataKey-intentVerb";
}

+ (id)donatedBySiri
{
  return @"_DKIntentMetadataKey-donatedBySiri";
}

+ (id)intentHandlingStatus
{
  return @"_DKIntentMetadataKey-intentHandlingStatus";
}

+ (id)serializedKeyImage
{
  return @"_DKIntentMetadataKey-serializedKeyImage";
}

+ (id)derivedIntentIdentifier
{
  return @"_DKIntentMetadataKey-derivedIntentIdentifier";
}

+ (id)shortcutAvailability
{
  return @"_DKIntentMetadataKey-shortcutAvailability";
}

+ (id)interactionIdentifier
{
  return @"_DKIntentMetadataKey-interactionIdentifier";
}

+ (id)relatedContactIdentifiers
{
  return @"_DKIntentMetadataKey-relatedContactIdentifiers";
}

@end