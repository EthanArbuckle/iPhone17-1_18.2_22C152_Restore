@interface AppUsageMetricsEvent
- (id)description;
@end

@implementation AppUsageMetricsEvent

- (id)description
{
  v2 = [(AppUsageMetricsEvent *)self underlyingDictionary];
  v3 = +[NSString stringWithFormat:@"<AppUsageMetricsEvent: %@>", v2];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekStartDate, 0);
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_shortVersion, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_osBuild, 0);
  objc_storeStrong((id *)&self->_OS, 0);
  objc_storeStrong((id *)&self->_ocelotSubscriptionState, 0);
  objc_storeStrong((id *)&self->_ocelotID, 0);
  objc_storeStrong((id *)&self->_ocelotDeviceID, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_hardwareModel, 0);
  objc_storeStrong((id *)&self->_hardwareFamily, 0);
  objc_storeStrong((id *)&self->_foregroundEvents, 0);
  objc_storeStrong((id *)&self->_eventTimeOverride, 0);
  objc_storeStrong((id *)&self->_evid, 0);
  objc_storeStrong((id *)&self->_collectionTime, 0);
  objc_storeStrong((id *)&self->_cohort, 0);
  objc_storeStrong((id *)&self->_clipThirdPartyWithNoAppReferrer, 0);
  objc_storeStrong((id *)&self->_clipRefType, 0);
  objc_storeStrong((id *)&self->_clipProviderToken, 0);
  objc_storeStrong((id *)&self->_clipRefSource, 0);
  objc_storeStrong((id *)&self->_clipInstallRefType, 0);
  objc_storeStrong((id *)&self->_clipInstallRefSource, 0);
  objc_storeStrong((id *)&self->_clipInstallProviderToken, 0);
  objc_storeStrong((id *)&self->_clipInstallCampaignToken, 0);
  objc_storeStrong((id *)&self->_clipInstallAffiliateToken, 0);
  objc_storeStrong((id *)&self->_clipCampaignToken, 0);
  objc_storeStrong((id *)&self->_clipCampaign, 0);
  objc_storeStrong((id *)&self->_clipAffiliateToken, 0);
  objc_storeStrong((id *)&self->_clipAppType, 0);
  objc_storeStrong((id *)&self->_clientEventID, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_appSessionReporterKey, 0);
  objc_storeStrong((id *)&self->_actorID, 0);
  objc_storeStrong((id *)&self->_tempDeviceIdentifer, 0);
  objc_storeStrong((id *)&self->_tempUserId, 0);
  objc_storeStrong((id *)&self->_beta, 0);
  objc_storeStrong((id *)&self->_appSessionReporterKeyRepaired, 0);
}

@end