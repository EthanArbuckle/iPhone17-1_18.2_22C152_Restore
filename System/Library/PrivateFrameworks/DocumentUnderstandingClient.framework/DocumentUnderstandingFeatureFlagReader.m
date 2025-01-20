@interface DocumentUnderstandingFeatureFlagReader
+ (BOOL)isAutonamingFromMessagesEnabled;
+ (BOOL)isBackboneModelEnabled;
+ (BOOL)isCategoryClassificationModelEnabled;
+ (BOOL)isFoundInModelsEnabled;
+ (BOOL)isFoundInUseLLMEnabled;
+ (BOOL)isIndexNonfileDocumentsEnabled;
+ (BOOL)isSearchAndOrganizationDocumentIngestEnabled;
+ (BOOL)isTopicClassificationModelEnabled;
- (_TtC27DocumentUnderstandingClient38DocumentUnderstandingFeatureFlagReader)init;
@end

@implementation DocumentUnderstandingFeatureFlagReader

+ (BOOL)isSearchAndOrganizationDocumentIngestEnabled
{
  return 0;
}

+ (BOOL)isBackboneModelEnabled
{
  return 0;
}

+ (BOOL)isTopicClassificationModelEnabled
{
  return 0;
}

+ (BOOL)isCategoryClassificationModelEnabled
{
  return 0;
}

+ (BOOL)isFoundInModelsEnabled
{
  return static DocumentUnderstandingFeatureFlagReader.isFoundInModelsEnabled.getter() & 1;
}

+ (BOOL)isIndexNonfileDocumentsEnabled
{
  return 0;
}

+ (BOOL)isAutonamingFromMessagesEnabled
{
  return 0;
}

+ (BOOL)isFoundInUseLLMEnabled
{
  return static DocumentUnderstandingFeatureFlagReader.isFoundInUseLLMEnabled.getter() & 1;
}

- (_TtC27DocumentUnderstandingClient38DocumentUnderstandingFeatureFlagReader)init
{
  return (_TtC27DocumentUnderstandingClient38DocumentUnderstandingFeatureFlagReader *)DocumentUnderstandingFeatureFlagReader.init()();
}

@end