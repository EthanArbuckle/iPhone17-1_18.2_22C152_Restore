@interface CRKConcreteFeatureFlags
- (BOOL)areAppGroupsEnabled;
- (BOOL)isASMUserCachingEnabled;
- (BOOL)isDataSeparationEnabled;
- (BOOL)isRenderPDFThumbnailsEnabled;
- (BOOL)isSettingsEnhancedSearchEnabled;
- (BOOL)isZeroKeywordSearchEnabled;
@end

@implementation CRKConcreteFeatureFlags

- (BOOL)isDataSeparationEnabled
{
  return MEMORY[0x270ED8070]("Classroom", "DataSeparation");
}

- (BOOL)isASMUserCachingEnabled
{
  return MEMORY[0x270ED8070]("Classroom", "ASMUserCaching");
}

- (BOOL)isSettingsEnhancedSearchEnabled
{
  return MEMORY[0x270ED8070]("Classroom", "ClassroomSettingsEnhancedSearch");
}

- (BOOL)isZeroKeywordSearchEnabled
{
  return MEMORY[0x270ED8070]("SettingsApp", "ZeroKeywordSearch");
}

- (BOOL)areAppGroupsEnabled
{
  return MEMORY[0x270ED8070]("Classroom", "UseAppGroups");
}

- (BOOL)isRenderPDFThumbnailsEnabled
{
  return MEMORY[0x270ED8070]("Classroom", "RenderPDFThumbnailsEnabled");
}

@end