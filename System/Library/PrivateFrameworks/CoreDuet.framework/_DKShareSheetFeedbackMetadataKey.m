@interface _DKShareSheetFeedbackMetadataKey
+ (id)adaptedModelRecipeID;
+ (id)attachments;
+ (id)derivedIntentIdentifier;
+ (id)engagementType;
+ (id)extensionContextUUID;
+ (id)iCloudFamilyInvocation;
+ (id)indexSelected;
+ (id)isAdaptedModelCreated;
+ (id)isAdaptedModelUsed;
+ (id)locationUUIDs;
+ (id)modelSuggestionProxies;
+ (id)numberOfVisibleSuggestions;
+ (id)peopleSuggestionsDisabled;
+ (id)photoSuggestedContacts;
+ (id)reason;
+ (id)reasonType;
+ (id)sourceBundleID;
+ (id)supportedBundleIDs;
+ (id)targetBundleID;
+ (id)trackingID;
+ (id)transportBundleID;
@end

@implementation _DKShareSheetFeedbackMetadataKey

+ (id)derivedIntentIdentifier
{
  return @"_DKShareSheetSuggestionMetadataKey-derivedIntentIdentifier";
}

+ (id)targetBundleID
{
  return @"_DKShareSheetSuggestionMetadataKey-targetBundleID";
}

+ (id)extensionContextUUID
{
  return @"_DKShareSheetSuggestionMetadataKey-extensionContextUUID";
}

+ (id)attachments
{
  return @"_DKShareSheetSuggestionMetadataKey-attachments";
}

+ (id)locationUUIDs
{
  return @"_DKShareSheetSuggestionMetadataKey-locationUUIDs";
}

+ (id)photoSuggestedContacts
{
  return @"_DKShareSheetSuggestionMetadataKey-photoSuggestedContacts";
}

+ (id)modelSuggestionProxies
{
  return @"_DKShareSheetSuggestionMetadataKey-modelSuggestionProxies";
}

+ (id)adaptedModelRecipeID
{
  return @"_DKShareSheetSuggestionMetadataKey-adaptedModelRecipeID";
}

+ (id)isAdaptedModelCreated
{
  return @"_DKShareSheetSuggestionMetadataKey-isAdaptedModelCreated";
}

+ (id)isAdaptedModelUsed
{
  return @"_DKShareSheetSuggestionMetadataKey-isAdaptedModelUsed";
}

+ (id)peopleSuggestionsDisabled
{
  return @"_DKShareSheetSuggestionMetadataKey-peopleSuggestionsDisabled";
}

+ (id)sourceBundleID
{
  return @"_DKShareSheetSuggestionMetadataKey-sourceBundleID";
}

+ (id)supportedBundleIDs
{
  return @"_DKShareSheetSuggestionMetadataKey-supportedBundleIDs";
}

+ (id)transportBundleID
{
  return @"_DKShareSheetSuggestionMetadataKey-transportBundleID";
}

+ (id)trackingID
{
  return @"_DKShareSheetSuggestionMetadataKey-trackingID";
}

+ (id)iCloudFamilyInvocation
{
  return @"_DKShareSheetSuggestionMetadataKey-iCloudFamilyInvocation";
}

+ (id)numberOfVisibleSuggestions
{
  return @"_DKShareSheetSuggestionMetadataKey-numberOfVisibleSuggestions";
}

+ (id)engagementType
{
  return @"_DKShareSheetSuggestionMetadataKey-engagementType";
}

+ (id)indexSelected
{
  return @"_DKShareSheetSuggestionMetadataKey-indexSelected";
}

+ (id)reason
{
  return @"_DKShareSheetSuggestionMetadataKey-reason";
}

+ (id)reasonType
{
  return @"_DKShareSheetSuggestionMetadataKey-reasonType";
}

@end