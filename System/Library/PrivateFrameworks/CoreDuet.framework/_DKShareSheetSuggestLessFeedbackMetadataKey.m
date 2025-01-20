@interface _DKShareSheetSuggestLessFeedbackMetadataKey
+ (id)bundleId;
+ (id)contactId;
+ (id)conversationIdentifier;
+ (id)derivedIntentIdentifier;
+ (id)handle;
@end

@implementation _DKShareSheetSuggestLessFeedbackMetadataKey

+ (id)bundleId
{
  return @"_DKShareSheetSuggestLessFeedbackMetadataKey-bundleId";
}

+ (id)conversationIdentifier
{
  return @"_DKShareSheetSuggestLessFeedbackMetadataKey-conversationIdentifier";
}

+ (id)derivedIntentIdentifier
{
  return @"_DKShareSheetSuggestLessFeedbackMetadataKey-derivedIntentIdentifier";
}

+ (id)handle
{
  return @"_DKShareSheetSuggestLessFeedbackMetadataKey-handle";
}

+ (id)contactId
{
  return @"_DKShareSheetSuggestLessFeedbackMetadataKey-contactId";
}

@end