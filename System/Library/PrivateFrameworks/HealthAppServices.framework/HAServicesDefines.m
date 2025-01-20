@interface HAServicesDefines
+ (NSString)authorizationManagementHostName;
+ (NSString)categoryTypeHostName;
+ (NSString)dataTypeDetailHostName;
+ (NSString)externalHealthAppURLHost;
+ (NSString)externalHealthAppURLScheme;
+ (NSString)externalSourceAssistantService;
+ (NSString)healthAppBrowseHostName;
+ (NSString)healthAppMedicalIDPath;
+ (NSString)healthAppNotificationSettingsPath;
+ (NSString)healthAppSharingInviteFlowPath;
+ (NSString)healthAppSharingProfilePath;
+ (NSString)healthAppSummaryHostName;
+ (NSString)healthAppVisionRXIngestionURLPath;
+ (NSString)healthProfileResourceSpecifier;
+ (NSString)healthSettingsSourcesHostName;
+ (NSString)healthTrendsHostName;
+ (NSString)internalHealthAppURLScheme;
+ (NSString)internalSettingsAppURLScheme;
+ (NSString)nanoHealthSettingsBundleIdentifier;
+ (NSString)nanoInternalSettingsAppURLScheme;
+ (NSString)queryParameterNameDataTypeCode;
+ (NSString)queryParameterNameDate;
+ (NSString)queryParameterNameEndDate;
+ (NSString)queryParameterNameSource;
+ (NSString)queryParameterNameStartDate;
+ (NSString)queryParameterNameTrendOverlay;
+ (NSString)sampleTypeHostName;
+ (NSString)sharingOverviewHostName;
@end

@implementation HAServicesDefines

+ (NSString)internalHealthAppURLScheme
{
  return (NSString *)(id)*MEMORY[0x1E4F29E20];
}

+ (NSString)internalSettingsAppURLScheme
{
  return (NSString *)@"prefs";
}

+ (NSString)externalHealthAppURLScheme
{
  return (NSString *)@"https";
}

+ (NSString)externalHealthAppURLHost
{
  return (NSString *)@"health.apple.com";
}

+ (NSString)nanoHealthSettingsBundleIdentifier
{
  return (NSString *)@"com.apple.NanoHealthSettings";
}

+ (NSString)nanoInternalSettingsAppURLScheme
{
  return (NSString *)@"prefs";
}

+ (NSString)healthProfileResourceSpecifier
{
  return (NSString *)@"HealthProfile";
}

+ (NSString)healthAppBrowseHostName
{
  return (NSString *)@"browse";
}

+ (NSString)healthAppSummaryHostName
{
  return (NSString *)@"summary";
}

+ (NSString)dataTypeDetailHostName
{
  return (NSString *)@"dataTypeDetail";
}

+ (NSString)healthTrendsHostName
{
  return (NSString *)@"allTrends";
}

+ (NSString)sampleTypeHostName
{
  return (NSString *)@"SampleType";
}

+ (NSString)categoryTypeHostName
{
  return (NSString *)@"CategoryType";
}

+ (NSString)sharingOverviewHostName
{
  return (NSString *)@"sharingOverview";
}

+ (NSString)authorizationManagementHostName
{
  return (NSString *)@"AuthorizationManagement";
}

+ (NSString)healthSettingsSourcesHostName
{
  return (NSString *)@"SOURCES_ITEM";
}

+ (NSString)healthAppMedicalIDPath
{
  return (NSString *)@"MedicalID";
}

+ (NSString)healthAppNotificationSettingsPath
{
  return (NSString *)@"notificationSettings";
}

+ (NSString)healthAppSharingInviteFlowPath
{
  return (NSString *)@"SharingInviteFlow";
}

+ (NSString)healthAppSharingProfilePath
{
  return (NSString *)@"SharingProfile";
}

+ (NSString)healthAppVisionRXIngestionURLPath
{
  return (NSString *)@"add-vrx";
}

+ (NSString)queryParameterNameDate
{
  return (NSString *)@"date";
}

+ (NSString)queryParameterNameStartDate
{
  return (NSString *)@"startDate";
}

+ (NSString)queryParameterNameEndDate
{
  return (NSString *)@"endDate";
}

+ (NSString)queryParameterNameDataTypeCode
{
  return (NSString *)@"dataType";
}

+ (NSString)queryParameterNameTrendOverlay
{
  return (NSString *)@"trendTimescope";
}

+ (NSString)queryParameterNameSource
{
  return (NSString *)@"urlSource";
}

+ (NSString)externalSourceAssistantService
{
  return (NSString *)(id)*MEMORY[0x1E4F2BF50];
}

@end