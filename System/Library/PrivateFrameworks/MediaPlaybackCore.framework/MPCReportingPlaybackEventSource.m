@interface MPCReportingPlaybackEventSource
- (BOOL)shouldReportPlayEventsToStore;
- (MPCReportingIdentityPropertiesLoading)identityPropertiesLoader;
- (MPCReportingPlaybackEventSource)init;
- (MPModelGenericObject)itemGenericObject;
- (MPModelPlayEvent)modelPlayEvent;
- (NSData)jingleTimedMetadata;
- (NSData)recommendationData;
- (NSData)trackInfo;
- (NSNumber)isPrivateListeningEnabled;
- (NSNumber)isSiriInitiated;
- (NSString)featureName;
- (NSString)lyricsID;
- (NSString)requestingBundleIdentifier;
- (NSString)requestingBundleVersion;
- (double)eventDuration;
- (int64_t)equivalencySourceAdamID;
- (unint64_t)overrideItemType;
- (void)setEquivalencySourceAdamID:(int64_t)a3;
- (void)setEventDuration:(double)a3;
- (void)setFeatureName:(id)a3;
- (void)setIdentityPropertiesLoader:(id)a3;
- (void)setItemGenericObject:(id)a3;
- (void)setJingleTimedMetadata:(id)a3;
- (void)setLyricsID:(id)a3;
- (void)setModelPlayEvent:(id)a3;
- (void)setOverrideItemType:(unint64_t)a3;
- (void)setPrivateListeningEnabled:(id)a3;
- (void)setRecommendationData:(id)a3;
- (void)setRequestingBundleIdentifier:(id)a3;
- (void)setRequestingBundleVersion:(id)a3;
- (void)setShouldReportPlayEventsToStore:(BOOL)a3;
- (void)setSiriInitiated:(id)a3;
- (void)setTrackInfo:(id)a3;
@end

@implementation MPCReportingPlaybackEventSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestingBundleVersion, 0);
  objc_storeStrong((id *)&self->_requestingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_recommendationData, 0);
  objc_storeStrong((id *)&self->_jingleTimedMetadata, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_modelPlayEvent, 0);
  objc_storeStrong((id *)&self->_trackInfo, 0);
  objc_storeStrong((id *)&self->_siriInitiated, 0);
  objc_storeStrong((id *)&self->_privateListeningEnabled, 0);
  objc_storeStrong((id *)&self->_itemGenericObject, 0);
  objc_storeStrong((id *)&self->_lyricsID, 0);

  objc_storeStrong((id *)&self->_identityPropertiesLoader, 0);
}

- (void)setRequestingBundleVersion:(id)a3
{
}

- (NSString)requestingBundleVersion
{
  return self->_requestingBundleVersion;
}

- (void)setRequestingBundleIdentifier:(id)a3
{
}

- (NSString)requestingBundleIdentifier
{
  return self->_requestingBundleIdentifier;
}

- (void)setRecommendationData:(id)a3
{
}

- (NSData)recommendationData
{
  return self->_recommendationData;
}

- (void)setJingleTimedMetadata:(id)a3
{
}

- (NSData)jingleTimedMetadata
{
  return self->_jingleTimedMetadata;
}

- (void)setFeatureName:(id)a3
{
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void)setModelPlayEvent:(id)a3
{
}

- (MPModelPlayEvent)modelPlayEvent
{
  return self->_modelPlayEvent;
}

- (void)setTrackInfo:(id)a3
{
}

- (NSData)trackInfo
{
  return self->_trackInfo;
}

- (void)setShouldReportPlayEventsToStore:(BOOL)a3
{
  self->_shouldReportPlayEventsToStore = a3;
}

- (BOOL)shouldReportPlayEventsToStore
{
  return self->_shouldReportPlayEventsToStore;
}

- (void)setSiriInitiated:(id)a3
{
}

- (NSNumber)isSiriInitiated
{
  return self->_siriInitiated;
}

- (void)setPrivateListeningEnabled:(id)a3
{
}

- (NSNumber)isPrivateListeningEnabled
{
  return self->_privateListeningEnabled;
}

- (void)setItemGenericObject:(id)a3
{
}

- (MPModelGenericObject)itemGenericObject
{
  return self->_itemGenericObject;
}

- (void)setLyricsID:(id)a3
{
}

- (NSString)lyricsID
{
  return self->_lyricsID;
}

- (void)setOverrideItemType:(unint64_t)a3
{
  self->_overrideItemType = a3;
}

- (unint64_t)overrideItemType
{
  return self->_overrideItemType;
}

- (void)setEventDuration:(double)a3
{
  self->_eventDuration = a3;
}

- (double)eventDuration
{
  return self->_eventDuration;
}

- (void)setEquivalencySourceAdamID:(int64_t)a3
{
  self->_equivalencySourceAdamID = a3;
}

- (int64_t)equivalencySourceAdamID
{
  return self->_equivalencySourceAdamID;
}

- (void)setIdentityPropertiesLoader:(id)a3
{
}

- (MPCReportingIdentityPropertiesLoading)identityPropertiesLoader
{
  return self->_identityPropertiesLoader;
}

- (MPCReportingPlaybackEventSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)MPCReportingPlaybackEventSource;
  v2 = [(MPCReportingPlaybackEventSource *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[MPCReportingDeviceIdentityPropertiesLoader sharedLoader];
    identityPropertiesLoader = v2->_identityPropertiesLoader;
    v2->_identityPropertiesLoader = (MPCReportingIdentityPropertiesLoading *)v3;
  }
  return v2;
}

@end