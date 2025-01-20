@interface ANAnnounceFeatureStatus
+ (BOOL)isAnnounceEnabled;
+ (BOOL)isCommunicationUserNotificationsEnabled;
+ (BOOL)isEnabled;
+ (BOOL)isEnabledForPersonalDevices;
+ (BOOL)isSiriEndpointsATVEnabled;
+ (BOOL)shouldStopPlaybackOnSiriActivation;
@end

@implementation ANAnnounceFeatureStatus

+ (BOOL)isEnabled
{
  return +[ANAnnounceFeatureStatus isAnnounceEnabled];
}

+ (BOOL)isAnnounceEnabled
{
  return 1;
}

+ (BOOL)isSiriEndpointsATVEnabled
{
  return MEMORY[0x270ED8070]("Home", "SiriEndpointsATV");
}

+ (BOOL)shouldStopPlaybackOnSiriActivation
{
  v2 = +[ANDefaults sharedInstance];
  char v3 = [v2 BOOLForDefault:@"siri_interruption_stops_playback"];

  return v3;
}

+ (BOOL)isCommunicationUserNotificationsEnabled
{
  return MEMORY[0x270ED8070]("Intercom", "CommunicationUserNotifications");
}

+ (BOOL)isEnabledForPersonalDevices
{
  return 1;
}

@end