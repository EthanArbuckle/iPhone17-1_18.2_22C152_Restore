@interface FamilyChecklistAnalytics
+ (_TtC14FamilyCircleUI24FamilyChecklistAnalytics)shared;
- (_TtC14FamilyCircleUI24FamilyChecklistAnalytics)init;
- (void)sendChecklistChildSettingsToggleAnalyticsEvent;
- (void)sendChecklistCommLimitsToggleAnalyticsEvent;
- (void)sendChecklistIcloudPlusToggleAnalyticsEvent;
- (void)sendChecklistLocationSharingToggleAnalyticsEvent;
- (void)sendChildSettingsAnalyticsEvent;
- (void)sendChildSettingsOnOffToggleEvent;
- (void)sendCommLimitsAnalyticsEvent;
- (void)sendCommLimitsOnOffToggleEvent;
- (void)sendEmergencyContactsAnalyticsEvent;
- (void)sendEmergencyContactsOnOffToggleEvent;
- (void)sendEmergencyContactsToggleAnalyticsEvent;
- (void)sendIcloudPlusSharingAnalyticsEvent;
- (void)sendLocationSharingAnalyticsEvent;
- (void)sendLocationSharingOnOffToggleEvent;
- (void)sendRecoveryContactsAnalyticsEvent;
- (void)sendRecoveryContactsOnOffToggleEvent;
- (void)sendRecoveryContactsToggleAnalyticsEvent;
- (void)sendTotalChecklistViewsAnalyticsEvent;
- (void)sendicloudPlusOnOffToggleEvent;
@end

@implementation FamilyChecklistAnalytics

+ (_TtC14FamilyCircleUI24FamilyChecklistAnalytics)shared
{
  if (qword_267BE84E8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_267BF0B60;
  return (_TtC14FamilyCircleUI24FamilyChecklistAnalytics *)v2;
}

- (void)sendChildSettingsAnalyticsEvent
{
}

- (void)sendCommLimitsAnalyticsEvent
{
}

- (void)sendLocationSharingAnalyticsEvent
{
}

- (void)sendIcloudPlusSharingAnalyticsEvent
{
}

- (void)sendRecoveryContactsAnalyticsEvent
{
}

- (void)sendEmergencyContactsAnalyticsEvent
{
}

- (void)sendChecklistChildSettingsToggleAnalyticsEvent
{
}

- (void)sendChecklistCommLimitsToggleAnalyticsEvent
{
}

- (void)sendChecklistLocationSharingToggleAnalyticsEvent
{
}

- (void)sendChecklistIcloudPlusToggleAnalyticsEvent
{
}

- (void)sendRecoveryContactsToggleAnalyticsEvent
{
}

- (void)sendEmergencyContactsToggleAnalyticsEvent
{
}

- (void)sendTotalChecklistViewsAnalyticsEvent
{
}

- (void)sendEmergencyContactsOnOffToggleEvent
{
}

- (void)sendCommLimitsOnOffToggleEvent
{
}

- (void)sendChildSettingsOnOffToggleEvent
{
}

- (void)sendLocationSharingOnOffToggleEvent
{
}

- (void)sendicloudPlusOnOffToggleEvent
{
}

- (void)sendRecoveryContactsOnOffToggleEvent
{
}

- (_TtC14FamilyCircleUI24FamilyChecklistAnalytics)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FamilyChecklistAnalytics();
  return [(FamilyChecklistAnalytics *)&v3 init];
}

@end