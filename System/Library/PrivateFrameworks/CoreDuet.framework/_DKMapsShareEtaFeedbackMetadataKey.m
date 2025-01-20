@interface _DKMapsShareEtaFeedbackMetadataKey
+ (id)contactId;
+ (id)navigationEndLocationIdentifier;
+ (id)navigationStartLocationIdentifier;
@end

@implementation _DKMapsShareEtaFeedbackMetadataKey

+ (id)navigationStartLocationIdentifier
{
  return @"_DKMapsShareEtaFeedbackMetadataKey-locationStartId";
}

+ (id)navigationEndLocationIdentifier
{
  return @"_DKMapsShareEtaFeedbackMetadataKey-locationEndId";
}

+ (id)contactId
{
  return @"_DKMapsShareEtaFeedbackMetadataKey-contactId";
}

@end