@interface _DKApplicationActivityMetadataKey
+ (id)activityType;
+ (id)beginningOfActivity;
+ (id)contentDescription;
+ (id)expirationDate;
+ (id)isEligibleForPrediction;
+ (id)isPubliclyIndexable;
+ (id)itemIdentifier;
+ (id)itemRelatedContentURL;
+ (id)itemRelatedUniqueIdentifier;
+ (id)shortcutAvailability;
+ (id)suggestedInvocationPhrase;
+ (id)title;
+ (id)userActivityRequiredString;
+ (id)userActivityUUID;
@end

@implementation _DKApplicationActivityMetadataKey

+ (id)title
{
  return @"_DKApplicationActivityMetadataKey-title";
}

+ (id)userActivityUUID
{
  return @"_DKApplicationActivityMetadataKey-userActivityUUID";
}

+ (id)activityType
{
  return @"_DKApplicationActivityMetadataKey-activityType";
}

+ (id)itemIdentifier
{
  return @"_DKApplicationActivityMetadataKey-itemIdentifier";
}

+ (id)itemRelatedUniqueIdentifier
{
  return @"_DKApplicationActivityMetadataKey-itemRelatedUniqueIdentifier";
}

+ (id)itemRelatedContentURL
{
  return @"_DKApplicationActivityMetadataKey-itemRelatedContentURL";
}

+ (id)isPubliclyIndexable
{
  return @"_DKApplicationActivityMetadataKey-isPubliclyIndexable";
}

+ (id)isEligibleForPrediction
{
  return @"_DKApplicationActivityMetadataKey-isEligibleForPrediction";
}

+ (id)expirationDate
{
  return @"_DKApplicationActivityMetadataKey-expirationDate";
}

+ (id)userActivityRequiredString
{
  return @"_DKApplicationActivityMetadataKey-userActivityRequiredString";
}

+ (id)contentDescription
{
  return @"_DKApplicationActivityMetadataKey-contentDescription";
}

+ (id)suggestedInvocationPhrase
{
  return @"_DKApplicationActivityMetadataKey-suggestedInvocationPhrase";
}

+ (id)beginningOfActivity
{
  return @"_DKApplicationActivityMetadataKey-beginningOfActivity";
}

+ (id)shortcutAvailability
{
  return @"_DKApplicationActivityMetadataKey-shortcutAvailability";
}

@end