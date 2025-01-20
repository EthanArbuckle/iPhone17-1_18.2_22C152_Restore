@interface _DKSearchFeedbackMetadataKey
+ (id)client;
+ (id)contactID;
+ (id)interactionType;
+ (id)suggestionType;
@end

@implementation _DKSearchFeedbackMetadataKey

+ (id)client
{
  return @"_DKSearchFeedbackMetadataKey-client";
}

+ (id)interactionType
{
  return @"_DKSearchFeedbackMetadataKey-interactionType";
}

+ (id)suggestionType
{
  return @"_DKSearchFeedbackMetadataKey-suggestionType";
}

+ (id)contactID
{
  return @"_DKSearchFeedbackMetadataKey-contactID";
}

@end