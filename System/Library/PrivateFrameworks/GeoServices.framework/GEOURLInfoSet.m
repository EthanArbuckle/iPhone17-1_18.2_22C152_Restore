@interface GEOURLInfoSet
+ (BOOL)isValid:(id)a3;
+ (Class)alternateResourcesURLType;
- (BOOL)hasAbExperimentURL;
- (BOOL)hasAddressCorrectionInitURL;
- (BOOL)hasAddressCorrectionTaggedLocationURL;
- (BOOL)hasAddressCorrectionUpdateURL;
- (BOOL)hasAnalyticsCohortSessionURL;
- (BOOL)hasAnalyticsLongSessionURL;
- (BOOL)hasAnalyticsSessionlessURL;
- (BOOL)hasAnalyticsShortSessionURL;
- (BOOL)hasAnnouncementsURL;
- (BOOL)hasAuthProxyURL;
- (BOOL)hasAuthenticatedClientFeatureFlagURL;
- (BOOL)hasBackgroundDispatcherURL;
- (BOOL)hasBackgroundRevGeoURL;
- (BOOL)hasBatchReverseGeocoderPlaceRequestURL;
- (BOOL)hasBatchReverseGeocoderURL;
- (BOOL)hasBatchTrafficProbeURL;
- (BOOL)hasBcxDispatcherURL;
- (BOOL)hasBluePOIDispatcherURL;
- (BOOL)hasBusinessPortalBaseURL;
- (BOOL)hasDataSet;
- (BOOL)hasDirectionsURL;
- (BOOL)hasDispatcherURL;
- (BOOL)hasEnrichmentSubmissionURL;
- (BOOL)hasEtaURL;
- (BOOL)hasFeedbackLookupURL;
- (BOOL)hasFeedbackSubmissionURL;
- (BOOL)hasJunctionImageServiceURL;
- (BOOL)hasLogMessageUsageURL;
- (BOOL)hasLogMessageUsageV3URL;
- (BOOL)hasMuninBaseURL;
- (BOOL)hasNetworkSelectionHarvestURL;
- (BOOL)hasOfflineDataBatchListURL;
- (BOOL)hasOfflineDataDownloadBaseURL;
- (BOOL)hasOfflineDataSizeURL;
- (BOOL)hasPoiBusynessActivityCollectionURL;
- (BOOL)hasPolyLocationShiftURL;
- (BOOL)hasPressureProbeDataURL;
- (BOOL)hasProactiveAppClipURL;
- (BOOL)hasProactiveRoutingURL;
- (BOOL)hasProblemCategoriesURL;
- (BOOL)hasProblemOptInURL;
- (BOOL)hasProblemStatusURL;
- (BOOL)hasProblemSubmissionURL;
- (BOOL)hasRapWebBundleURL;
- (BOOL)hasRealtimeTrafficProbeURL;
- (BOOL)hasResourcesURL;
- (BOOL)hasReverseGeocoderVersionsURL;
- (BOOL)hasSearchAttributionManifestURL;
- (BOOL)hasSimpleETAURL;
- (BOOL)hasSpatialLookupURL;
- (BOOL)hasTokenAuthenticationURL;
- (BOOL)hasUgcLogDiscardURL;
- (BOOL)hasWebModuleBaseURL;
- (BOOL)hasWifiConnectionQualityProbeURL;
- (BOOL)hasWifiQualityTileURL;
- (BOOL)hasWifiQualityURL;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOURLInfo)abExperimentURL;
- (GEOURLInfo)addressCorrectionInitURL;
- (GEOURLInfo)addressCorrectionTaggedLocationURL;
- (GEOURLInfo)addressCorrectionUpdateURL;
- (GEOURLInfo)analyticsCohortSessionURL;
- (GEOURLInfo)analyticsLongSessionURL;
- (GEOURLInfo)analyticsSessionlessURL;
- (GEOURLInfo)analyticsShortSessionURL;
- (GEOURLInfo)announcementsURL;
- (GEOURLInfo)authProxyURL;
- (GEOURLInfo)authenticatedClientFeatureFlagURL;
- (GEOURLInfo)backgroundDispatcherURL;
- (GEOURLInfo)backgroundRevGeoURL;
- (GEOURLInfo)batchReverseGeocoderPlaceRequestURL;
- (GEOURLInfo)batchReverseGeocoderURL;
- (GEOURLInfo)batchTrafficProbeURL;
- (GEOURLInfo)bcxDispatcherURL;
- (GEOURLInfo)bluePOIDispatcherURL;
- (GEOURLInfo)businessPortalBaseURL;
- (GEOURLInfo)directionsURL;
- (GEOURLInfo)dispatcherURL;
- (GEOURLInfo)enrichmentSubmissionURL;
- (GEOURLInfo)etaURL;
- (GEOURLInfo)feedbackLookupURL;
- (GEOURLInfo)feedbackSubmissionURL;
- (GEOURLInfo)junctionImageServiceURL;
- (GEOURLInfo)logMessageUsageURL;
- (GEOURLInfo)logMessageUsageV3URL;
- (GEOURLInfo)muninBaseURL;
- (GEOURLInfo)networkSelectionHarvestURL;
- (GEOURLInfo)offlineDataBatchListURL;
- (GEOURLInfo)offlineDataDownloadBaseURL;
- (GEOURLInfo)offlineDataSizeURL;
- (GEOURLInfo)poiBusynessActivityCollectionURL;
- (GEOURLInfo)polyLocationShiftURL;
- (GEOURLInfo)pressureProbeDataURL;
- (GEOURLInfo)proactiveAppClipURL;
- (GEOURLInfo)proactiveRoutingURL;
- (GEOURLInfo)problemCategoriesURL;
- (GEOURLInfo)problemOptInURL;
- (GEOURLInfo)problemStatusURL;
- (GEOURLInfo)problemSubmissionURL;
- (GEOURLInfo)rapWebBundleURL;
- (GEOURLInfo)realtimeTrafficProbeURL;
- (GEOURLInfo)resourcesURL;
- (GEOURLInfo)reverseGeocoderVersionsURL;
- (GEOURLInfo)searchAttributionManifestURL;
- (GEOURLInfo)simpleETAURL;
- (GEOURLInfo)spatialLookupURL;
- (GEOURLInfo)tokenAuthenticationURL;
- (GEOURLInfo)ugcLogDiscardURL;
- (GEOURLInfo)webModuleBaseURL;
- (GEOURLInfo)wifiConnectionQualityProbeURL;
- (GEOURLInfo)wifiQualityTileURL;
- (GEOURLInfo)wifiQualityURL;
- (GEOURLInfoSet)init;
- (GEOURLInfoSet)initWithData:(id)a3;
- (GEOURLInfoSet)initWithDictionary:(id)a3;
- (GEOURLInfoSet)initWithJSON:(id)a3;
- (NSArray)alternateResourcesNSURLs;
- (NSMutableArray)alternateResourcesURLs;
- (NSURL)resourcesProxyURL;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(char)a3 isJSON:;
- (id)alternateResourcesURLAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)alternateResourcesURLsCount;
- (unint64_t)hash;
- (unsigned)dataSet;
- (void)_addNoFlagsAlternateResourcesURL:(uint64_t)a1;
- (void)_readAbExperimentURL;
- (void)_readAddressCorrectionInitURL;
- (void)_readAddressCorrectionTaggedLocationURL;
- (void)_readAddressCorrectionUpdateURL;
- (void)_readAlternateResourcesURLs;
- (void)_readAnalyticsCohortSessionURL;
- (void)_readAnalyticsLongSessionURL;
- (void)_readAnalyticsSessionlessURL;
- (void)_readAnalyticsShortSessionURL;
- (void)_readAnnouncementsURL;
- (void)_readAuthProxyURL;
- (void)_readAuthenticatedClientFeatureFlagURL;
- (void)_readBackgroundDispatcherURL;
- (void)_readBackgroundRevGeoURL;
- (void)_readBatchReverseGeocoderPlaceRequestURL;
- (void)_readBatchReverseGeocoderURL;
- (void)_readBatchTrafficProbeURL;
- (void)_readBcxDispatcherURL;
- (void)_readBluePOIDispatcherURL;
- (void)_readBusinessPortalBaseURL;
- (void)_readDirectionsURL;
- (void)_readDispatcherURL;
- (void)_readEnrichmentSubmissionURL;
- (void)_readEtaURL;
- (void)_readFeedbackLookupURL;
- (void)_readFeedbackSubmissionURL;
- (void)_readJunctionImageServiceURL;
- (void)_readLogMessageUsageURL;
- (void)_readLogMessageUsageV3URL;
- (void)_readMuninBaseURL;
- (void)_readNetworkSelectionHarvestURL;
- (void)_readOfflineDataBatchListURL;
- (void)_readOfflineDataDownloadBaseURL;
- (void)_readOfflineDataSizeURL;
- (void)_readPoiBusynessActivityCollectionURL;
- (void)_readPolyLocationShiftURL;
- (void)_readPressureProbeDataURL;
- (void)_readProactiveAppClipURL;
- (void)_readProactiveRoutingURL;
- (void)_readProblemCategoriesURL;
- (void)_readProblemOptInURL;
- (void)_readProblemStatusURL;
- (void)_readProblemSubmissionURL;
- (void)_readRapWebBundleURL;
- (void)_readRealtimeTrafficProbeURL;
- (void)_readResourcesURL;
- (void)_readReverseGeocoderVersionsURL;
- (void)_readSearchAttributionManifestURL;
- (void)_readSimpleETAURL;
- (void)_readSpatialLookupURL;
- (void)_readTokenAuthenticationURL;
- (void)_readUgcLogDiscardURL;
- (void)_readWebModuleBaseURL;
- (void)_readWifiConnectionQualityProbeURL;
- (void)_readWifiQualityTileURL;
- (void)_readWifiQualityURL;
- (void)addAlternateResourcesURL:(id)a3;
- (void)clearAlternateResourcesURLs;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAbExperimentURL:(id)a3;
- (void)setAddressCorrectionInitURL:(id)a3;
- (void)setAddressCorrectionTaggedLocationURL:(id)a3;
- (void)setAddressCorrectionUpdateURL:(id)a3;
- (void)setAlternateResourcesURLs:(id)a3;
- (void)setAnalyticsCohortSessionURL:(id)a3;
- (void)setAnalyticsLongSessionURL:(id)a3;
- (void)setAnalyticsSessionlessURL:(id)a3;
- (void)setAnalyticsShortSessionURL:(id)a3;
- (void)setAnnouncementsURL:(id)a3;
- (void)setAuthProxyURL:(id)a3;
- (void)setAuthenticatedClientFeatureFlagURL:(id)a3;
- (void)setBackgroundDispatcherURL:(id)a3;
- (void)setBackgroundRevGeoURL:(id)a3;
- (void)setBatchReverseGeocoderPlaceRequestURL:(id)a3;
- (void)setBatchReverseGeocoderURL:(id)a3;
- (void)setBatchTrafficProbeURL:(id)a3;
- (void)setBcxDispatcherURL:(id)a3;
- (void)setBluePOIDispatcherURL:(id)a3;
- (void)setBusinessPortalBaseURL:(id)a3;
- (void)setDataSet:(unsigned int)a3;
- (void)setDirectionsURL:(id)a3;
- (void)setDispatcherURL:(id)a3;
- (void)setEnrichmentSubmissionURL:(id)a3;
- (void)setEtaURL:(id)a3;
- (void)setFeedbackLookupURL:(id)a3;
- (void)setFeedbackSubmissionURL:(id)a3;
- (void)setHasDataSet:(BOOL)a3;
- (void)setJunctionImageServiceURL:(id)a3;
- (void)setLogMessageUsageURL:(id)a3;
- (void)setLogMessageUsageV3URL:(id)a3;
- (void)setMuninBaseURL:(id)a3;
- (void)setNetworkSelectionHarvestURL:(id)a3;
- (void)setOfflineDataBatchListURL:(id)a3;
- (void)setOfflineDataDownloadBaseURL:(id)a3;
- (void)setOfflineDataSizeURL:(id)a3;
- (void)setPoiBusynessActivityCollectionURL:(id)a3;
- (void)setPolyLocationShiftURL:(id)a3;
- (void)setPressureProbeDataURL:(id)a3;
- (void)setProactiveAppClipURL:(id)a3;
- (void)setProactiveRoutingURL:(id)a3;
- (void)setProblemCategoriesURL:(id)a3;
- (void)setProblemOptInURL:(id)a3;
- (void)setProblemStatusURL:(id)a3;
- (void)setProblemSubmissionURL:(id)a3;
- (void)setRapWebBundleURL:(id)a3;
- (void)setRealtimeTrafficProbeURL:(id)a3;
- (void)setResourcesURL:(id)a3;
- (void)setReverseGeocoderVersionsURL:(id)a3;
- (void)setSearchAttributionManifestURL:(id)a3;
- (void)setSimpleETAURL:(id)a3;
- (void)setSpatialLookupURL:(id)a3;
- (void)setTokenAuthenticationURL:(id)a3;
- (void)setUgcLogDiscardURL:(id)a3;
- (void)setWebModuleBaseURL:(id)a3;
- (void)setWifiConnectionQualityProbeURL:(id)a3;
- (void)setWifiQualityTileURL:(id)a3;
- (void)setWifiQualityURL:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOURLInfoSet

- (GEOURLInfoSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOURLInfoSet;
  v2 = [(GEOURLInfoSet *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOURLInfo)polyLocationShiftURL
{
  -[GEOURLInfoSet _readPolyLocationShiftURL]((uint64_t)self);
  polyLocationShiftURL = self->_polyLocationShiftURL;

  return polyLocationShiftURL;
}

- (void)_readPolyLocationShiftURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 492) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPolyLocationShiftURL_tags_1507);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (GEOURLInfo)dispatcherURL
{
  -[GEOURLInfoSet _readDispatcherURL]((uint64_t)self);
  dispatcherURL = self->_dispatcherURL;

  return dispatcherURL;
}

- (void)_readDispatcherURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 490) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDispatcherURL_tags_1513);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (GEOURLInfo)simpleETAURL
{
  -[GEOURLInfoSet _readSimpleETAURL]((uint64_t)self);
  simpleETAURL = self->_simpleETAURL;

  return simpleETAURL;
}

- (GEOURLInfo)offlineDataDownloadBaseURL
{
  -[GEOURLInfoSet _readOfflineDataDownloadBaseURL]((uint64_t)self);
  offlineDataDownloadBaseURL = self->_offlineDataDownloadBaseURL;

  return offlineDataDownloadBaseURL;
}

- (void)_readSimpleETAURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 494) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSimpleETAURL_tags_1504);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readOfflineDataDownloadBaseURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 492) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOfflineDataDownloadBaseURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (GEOURLInfo)wifiQualityURL
{
  -[GEOURLInfoSet _readWifiQualityURL]((uint64_t)self);
  wifiQualityURL = self->_wifiQualityURL;

  return wifiQualityURL;
}

- (GEOURLInfo)wifiQualityTileURL
{
  -[GEOURLInfoSet _readWifiQualityTileURL]((uint64_t)self);
  wifiQualityTileURL = self->_wifiQualityTileURL;

  return wifiQualityTileURL;
}

- (GEOURLInfo)wifiConnectionQualityProbeURL
{
  -[GEOURLInfoSet _readWifiConnectionQualityProbeURL]((uint64_t)self);
  wifiConnectionQualityProbeURL = self->_wifiConnectionQualityProbeURL;

  return wifiConnectionQualityProbeURL;
}

- (GEOURLInfo)webModuleBaseURL
{
  -[GEOURLInfoSet _readWebModuleBaseURL]((uint64_t)self);
  webModuleBaseURL = self->_webModuleBaseURL;

  return webModuleBaseURL;
}

- (GEOURLInfo)ugcLogDiscardURL
{
  -[GEOURLInfoSet _readUgcLogDiscardURL]((uint64_t)self);
  ugcLogDiscardURL = self->_ugcLogDiscardURL;

  return ugcLogDiscardURL;
}

- (GEOURLInfo)tokenAuthenticationURL
{
  -[GEOURLInfoSet _readTokenAuthenticationURL]((uint64_t)self);
  tokenAuthenticationURL = self->_tokenAuthenticationURL;

  return tokenAuthenticationURL;
}

- (GEOURLInfo)spatialLookupURL
{
  -[GEOURLInfoSet _readSpatialLookupURL]((uint64_t)self);
  spatialLookupURL = self->_spatialLookupURL;

  return spatialLookupURL;
}

- (GEOURLInfo)realtimeTrafficProbeURL
{
  -[GEOURLInfoSet _readRealtimeTrafficProbeURL]((uint64_t)self);
  realtimeTrafficProbeURL = self->_realtimeTrafficProbeURL;

  return realtimeTrafficProbeURL;
}

- (GEOURLInfo)rapWebBundleURL
{
  -[GEOURLInfoSet _readRapWebBundleURL]((uint64_t)self);
  rapWebBundleURL = self->_rapWebBundleURL;

  return rapWebBundleURL;
}

- (GEOURLInfo)problemSubmissionURL
{
  -[GEOURLInfoSet _readProblemSubmissionURL]((uint64_t)self);
  problemSubmissionURL = self->_problemSubmissionURL;

  return problemSubmissionURL;
}

- (GEOURLInfo)problemStatusURL
{
  -[GEOURLInfoSet _readProblemStatusURL]((uint64_t)self);
  problemStatusURL = self->_problemStatusURL;

  return problemStatusURL;
}

- (GEOURLInfo)problemOptInURL
{
  -[GEOURLInfoSet _readProblemOptInURL]((uint64_t)self);
  problemOptInURL = self->_problemOptInURL;

  return problemOptInURL;
}

- (GEOURLInfo)problemCategoriesURL
{
  -[GEOURLInfoSet _readProblemCategoriesURL]((uint64_t)self);
  problemCategoriesURL = self->_problemCategoriesURL;

  return problemCategoriesURL;
}

- (GEOURLInfo)proactiveRoutingURL
{
  -[GEOURLInfoSet _readProactiveRoutingURL]((uint64_t)self);
  proactiveRoutingURL = self->_proactiveRoutingURL;

  return proactiveRoutingURL;
}

- (GEOURLInfo)pressureProbeDataURL
{
  -[GEOURLInfoSet _readPressureProbeDataURL]((uint64_t)self);
  pressureProbeDataURL = self->_pressureProbeDataURL;

  return pressureProbeDataURL;
}

- (GEOURLInfo)poiBusynessActivityCollectionURL
{
  -[GEOURLInfoSet _readPoiBusynessActivityCollectionURL]((uint64_t)self);
  poiBusynessActivityCollectionURL = self->_poiBusynessActivityCollectionURL;

  return poiBusynessActivityCollectionURL;
}

- (GEOURLInfo)offlineDataSizeURL
{
  -[GEOURLInfoSet _readOfflineDataSizeURL]((uint64_t)self);
  offlineDataSizeURL = self->_offlineDataSizeURL;

  return offlineDataSizeURL;
}

- (GEOURLInfo)offlineDataBatchListURL
{
  -[GEOURLInfoSet _readOfflineDataBatchListURL]((uint64_t)self);
  offlineDataBatchListURL = self->_offlineDataBatchListURL;

  return offlineDataBatchListURL;
}

- (GEOURLInfo)networkSelectionHarvestURL
{
  -[GEOURLInfoSet _readNetworkSelectionHarvestURL]((uint64_t)self);
  networkSelectionHarvestURL = self->_networkSelectionHarvestURL;

  return networkSelectionHarvestURL;
}

- (GEOURLInfo)muninBaseURL
{
  -[GEOURLInfoSet _readMuninBaseURL]((uint64_t)self);
  muninBaseURL = self->_muninBaseURL;

  return muninBaseURL;
}

- (GEOURLInfo)logMessageUsageV3URL
{
  -[GEOURLInfoSet _readLogMessageUsageV3URL]((uint64_t)self);
  logMessageUsageV3URL = self->_logMessageUsageV3URL;

  return logMessageUsageV3URL;
}

- (GEOURLInfo)logMessageUsageURL
{
  -[GEOURLInfoSet _readLogMessageUsageURL]((uint64_t)self);
  logMessageUsageURL = self->_logMessageUsageURL;

  return logMessageUsageURL;
}

- (GEOURLInfo)junctionImageServiceURL
{
  -[GEOURLInfoSet _readJunctionImageServiceURL]((uint64_t)self);
  junctionImageServiceURL = self->_junctionImageServiceURL;

  return junctionImageServiceURL;
}

- (GEOURLInfo)feedbackSubmissionURL
{
  -[GEOURLInfoSet _readFeedbackSubmissionURL]((uint64_t)self);
  feedbackSubmissionURL = self->_feedbackSubmissionURL;

  return feedbackSubmissionURL;
}

- (GEOURLInfo)feedbackLookupURL
{
  -[GEOURLInfoSet _readFeedbackLookupURL]((uint64_t)self);
  feedbackLookupURL = self->_feedbackLookupURL;

  return feedbackLookupURL;
}

- (GEOURLInfo)etaURL
{
  -[GEOURLInfoSet _readEtaURL]((uint64_t)self);
  etaURL = self->_etaURL;

  return etaURL;
}

- (GEOURLInfo)enrichmentSubmissionURL
{
  -[GEOURLInfoSet _readEnrichmentSubmissionURL]((uint64_t)self);
  enrichmentSubmissionURL = self->_enrichmentSubmissionURL;

  return enrichmentSubmissionURL;
}

- (GEOURLInfo)directionsURL
{
  -[GEOURLInfoSet _readDirectionsURL]((uint64_t)self);
  directionsURL = self->_directionsURL;

  return directionsURL;
}

- (GEOURLInfo)businessPortalBaseURL
{
  -[GEOURLInfoSet _readBusinessPortalBaseURL]((uint64_t)self);
  businessPortalBaseURL = self->_businessPortalBaseURL;

  return businessPortalBaseURL;
}

- (GEOURLInfo)bluePOIDispatcherURL
{
  -[GEOURLInfoSet _readBluePOIDispatcherURL]((uint64_t)self);
  bluePOIDispatcherURL = self->_bluePOIDispatcherURL;

  return bluePOIDispatcherURL;
}

- (GEOURLInfo)bcxDispatcherURL
{
  -[GEOURLInfoSet _readBcxDispatcherURL]((uint64_t)self);
  bcxDispatcherURL = self->_bcxDispatcherURL;

  return bcxDispatcherURL;
}

- (GEOURLInfo)batchTrafficProbeURL
{
  -[GEOURLInfoSet _readBatchTrafficProbeURL]((uint64_t)self);
  batchTrafficProbeURL = self->_batchTrafficProbeURL;

  return batchTrafficProbeURL;
}

- (GEOURLInfo)batchReverseGeocoderPlaceRequestURL
{
  -[GEOURLInfoSet _readBatchReverseGeocoderPlaceRequestURL]((uint64_t)self);
  batchReverseGeocoderPlaceRequestURL = self->_batchReverseGeocoderPlaceRequestURL;

  return batchReverseGeocoderPlaceRequestURL;
}

- (GEOURLInfo)backgroundRevGeoURL
{
  -[GEOURLInfoSet _readBackgroundRevGeoURL]((uint64_t)self);
  backgroundRevGeoURL = self->_backgroundRevGeoURL;

  return backgroundRevGeoURL;
}

- (GEOURLInfo)backgroundDispatcherURL
{
  -[GEOURLInfoSet _readBackgroundDispatcherURL]((uint64_t)self);
  backgroundDispatcherURL = self->_backgroundDispatcherURL;

  return backgroundDispatcherURL;
}

- (GEOURLInfo)authenticatedClientFeatureFlagURL
{
  -[GEOURLInfoSet _readAuthenticatedClientFeatureFlagURL]((uint64_t)self);
  authenticatedClientFeatureFlagURL = self->_authenticatedClientFeatureFlagURL;

  return authenticatedClientFeatureFlagURL;
}

- (GEOURLInfo)authProxyURL
{
  -[GEOURLInfoSet _readAuthProxyURL]((uint64_t)self);
  authProxyURL = self->_authProxyURL;

  return authProxyURL;
}

- (GEOURLInfo)announcementsURL
{
  -[GEOURLInfoSet _readAnnouncementsURL]((uint64_t)self);
  announcementsURL = self->_announcementsURL;

  return announcementsURL;
}

- (GEOURLInfo)analyticsShortSessionURL
{
  -[GEOURLInfoSet _readAnalyticsShortSessionURL]((uint64_t)self);
  analyticsShortSessionURL = self->_analyticsShortSessionURL;

  return analyticsShortSessionURL;
}

- (GEOURLInfo)analyticsSessionlessURL
{
  -[GEOURLInfoSet _readAnalyticsSessionlessURL]((uint64_t)self);
  analyticsSessionlessURL = self->_analyticsSessionlessURL;

  return analyticsSessionlessURL;
}

- (GEOURLInfo)analyticsLongSessionURL
{
  -[GEOURLInfoSet _readAnalyticsLongSessionURL]((uint64_t)self);
  analyticsLongSessionURL = self->_analyticsLongSessionURL;

  return analyticsLongSessionURL;
}

- (GEOURLInfo)analyticsCohortSessionURL
{
  -[GEOURLInfoSet _readAnalyticsCohortSessionURL]((uint64_t)self);
  analyticsCohortSessionURL = self->_analyticsCohortSessionURL;

  return analyticsCohortSessionURL;
}

- (GEOURLInfo)addressCorrectionTaggedLocationURL
{
  -[GEOURLInfoSet _readAddressCorrectionTaggedLocationURL]((uint64_t)self);
  addressCorrectionTaggedLocationURL = self->_addressCorrectionTaggedLocationURL;

  return addressCorrectionTaggedLocationURL;
}

- (GEOURLInfo)abExperimentURL
{
  -[GEOURLInfoSet _readAbExperimentURL]((uint64_t)self);
  abExperimentURL = self->_abExperimentURL;

  return abExperimentURL;
}

- (void)_readWifiQualityURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 495) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWifiQualityURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readWifiQualityTileURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 495) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWifiQualityTileURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readWifiConnectionQualityProbeURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 494) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWifiConnectionQualityProbeURL_tags_1526);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readWebModuleBaseURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 494) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWebModuleBaseURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readUgcLogDiscardURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 494) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUgcLogDiscardURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readTokenAuthenticationURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 494) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTokenAuthenticationURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readSpatialLookupURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 494) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpatialLookupURL_tags_1518);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readRealtimeTrafficProbeURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 493) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRealtimeTrafficProbeURL_tags_1519);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readRapWebBundleURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 493) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRapWebBundleURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readProblemSubmissionURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 493) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblemSubmissionURL_tags_1508);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readProblemStatusURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 493) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblemStatusURL_tags_1509);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readProblemOptInURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 493) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblemOptInURL_tags_1514);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readProblemCategoriesURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 493) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblemCategoriesURL_tags_1511);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readProactiveRoutingURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 493) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProactiveRoutingURL_tags_1521);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readPressureProbeDataURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 492) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPressureProbeDataURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readPoiBusynessActivityCollectionURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 492) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPoiBusynessActivityCollectionURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readOfflineDataSizeURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 492) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOfflineDataSizeURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readOfflineDataBatchListURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 492) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOfflineDataBatchListURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readNetworkSelectionHarvestURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 492) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNetworkSelectionHarvestURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readMuninBaseURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 491) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMuninBaseURL_tags_1527);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readLogMessageUsageV3URL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 491) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLogMessageUsageV3URL_tags_1522);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readLogMessageUsageURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 491) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLogMessageUsageURL_tags_1517);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readJunctionImageServiceURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 491) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readJunctionImageServiceURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readFeedbackSubmissionURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 491) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeedbackSubmissionURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readFeedbackLookupURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 491) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeedbackLookupURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readEtaURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 491) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEtaURL_tags_1502);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readEnrichmentSubmissionURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 491) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEnrichmentSubmissionURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readDirectionsURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 490) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsURL_tags_1501);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readBusinessPortalBaseURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 490) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBusinessPortalBaseURL_tags_1516);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readBluePOIDispatcherURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 490) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBluePOIDispatcherURL_tags_1524);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readBcxDispatcherURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 490) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBcxDispatcherURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readBatchTrafficProbeURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 490) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBatchTrafficProbeURL_tags_1520);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readBatchReverseGeocoderPlaceRequestURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 490) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBatchReverseGeocoderPlaceRequestURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readBackgroundRevGeoURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 489) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBackgroundRevGeoURL_tags_1525);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readBackgroundDispatcherURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 489) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBackgroundDispatcherURL_tags_1523);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readAuthenticatedClientFeatureFlagURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 489) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAuthenticatedClientFeatureFlagURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readAnnouncementsURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 489) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnnouncementsURL_tags_1512);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readAnalyticsShortSessionURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 489) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnalyticsShortSessionURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readAnalyticsSessionlessURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 489) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnalyticsSessionlessURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readAnalyticsLongSessionURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 489) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnalyticsLongSessionURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readAnalyticsCohortSessionURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 488) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnalyticsCohortSessionURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readAddressCorrectionTaggedLocationURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 488) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressCorrectionTaggedLocationURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)_readAbExperimentURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 488) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAbExperimentURL_tags_1515);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (GEOURLInfo)reverseGeocoderVersionsURL
{
  -[GEOURLInfoSet _readReverseGeocoderVersionsURL]((uint64_t)self);
  reverseGeocoderVersionsURL = self->_reverseGeocoderVersionsURL;

  return reverseGeocoderVersionsURL;
}

- (void)_readReverseGeocoderVersionsURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 494) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readReverseGeocoderVersionsURL_tags_1510);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (NSArray)alternateResourcesNSURLs
{
  id v3 = _getValue(GeoServicesConfig_AlternateResourceURLs, (uint64_t)off_1E9113918, 1, 0, 0, 0);
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[GEOURLInfoSet alternateResourcesURLsCount](self, "alternateResourcesURLsCount"));
  v5 = [(GEOURLInfoSet *)self alternateResourcesURLs];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__GEOURLInfoSet_Extras__alternateResourcesNSURLs__block_invoke;
  v11[3] = &unk_1E53E98C0;
  id v12 = v3;
  id v6 = v4;
  id v13 = v6;
  id v7 = v3;
  [v5 enumerateObjectsUsingBlock:v11];

  v8 = v13;
  v9 = (NSArray *)v6;

  return v9;
}

- (NSMutableArray)alternateResourcesURLs
{
  -[GEOURLInfoSet _readAlternateResourcesURLs]((uint64_t)self);
  alternateResourcesURLs = self->_alternateResourcesURLs;

  return alternateResourcesURLs;
}

- (void)_readAlternateResourcesURLs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 488) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAlternateResourcesURLs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (unint64_t)alternateResourcesURLsCount
{
  -[GEOURLInfoSet _readAlternateResourcesURLs]((uint64_t)self);
  alternateResourcesURLs = self->_alternateResourcesURLs;

  return [(NSMutableArray *)alternateResourcesURLs count];
}

void __49__GEOURLInfoSet_Extras__alternateResourcesNSURLs__block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  if ([*(id *)(a1 + 32) count] > a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CB10];
    v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    v9 = [v7 URLWithString:v8];

    if (v9) {
      goto LABEL_4;
    }
  }
  v9 = [v10 nsURL];
  if (v9)
  {
LABEL_4:
    [*(id *)(a1 + 40) addObject:v9];
  }
  else
  {
    [*(id *)(a1 + 40) removeAllObjects];
    *a4 = 1;
  }
}

- (GEOURLInfo)resourcesURL
{
  -[GEOURLInfoSet _readResourcesURL]((uint64_t)self);
  resourcesURL = self->_resourcesURL;

  return resourcesURL;
}

- (void)_readResourcesURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 493) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResourcesURL_tags_1499);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (NSURL)resourcesProxyURL
{
  if (GEOAuthProxyEnabledForURLInfoSet(self)
    && ([(GEOURLInfoSet *)self resourcesURL],
        id v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 useAuthProxy],
        v3,
        v4))
  {
    v5 = GEOGetURLIgnoringManifest(39);
    if (!v5)
    {
      id v6 = (void *)MEMORY[0x1E4F1CB10];
      id v7 = [(GEOURLInfoSet *)self authProxyURL];
      v8 = [v7 url];
      v5 = [v6 URLWithString:v8];
    }
  }
  else
  {
    v5 = 0;
  }

  return (NSURL *)v5;
}

- (BOOL)hasAuthProxyURL
{
  return self->_authProxyURL != 0;
}

- (void)_readAuthProxyURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 489) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAuthProxyURL_tags_1528);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (GEOURLInfo)searchAttributionManifestURL
{
  -[GEOURLInfoSet _readSearchAttributionManifestURL]((uint64_t)self);
  searchAttributionManifestURL = self->_searchAttributionManifestURL;

  return searchAttributionManifestURL;
}

- (void)_readSearchAttributionManifestURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 494) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchAttributionManifestURL_tags_1500);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasSearchAttributionManifestURL
{
  return self->_searchAttributionManifestURL != 0;
}

- (BOOL)hasDataSet
{
  return *(_DWORD *)&self->_flags & 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_119;
  }
  [(GEOURLInfoSet *)self readAll:1];
  [v4 readAll:1];
  uint64_t v5 = *((void *)v4 + 61);
  if (*(unsigned char *)&self->_flags)
  {
    if ((v5 & 1) == 0 || self->_dataSet != *((_DWORD *)v4 + 121)) {
      goto LABEL_119;
    }
  }
  else if (v5)
  {
LABEL_119:
    char v62 = 0;
    goto LABEL_120;
  }
  resourcesURL = self->_resourcesURL;
  if ((unint64_t)resourcesURL | *((void *)v4 + 48) && !-[GEOURLInfo isEqual:](resourcesURL, "isEqual:")) {
    goto LABEL_119;
  }
  searchAttributionManifestURL = self->_searchAttributionManifestURL;
  if ((unint64_t)searchAttributionManifestURL | *((void *)v4 + 50))
  {
    if (!-[GEOURLInfo isEqual:](searchAttributionManifestURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  directionsURL = self->_directionsURL;
  if ((unint64_t)directionsURL | *((void *)v4 + 23))
  {
    if (!-[GEOURLInfo isEqual:](directionsURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  etaURL = self->_etaURL;
  if ((unint64_t)etaURL | *((void *)v4 + 26))
  {
    if (!-[GEOURLInfo isEqual:](etaURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  batchReverseGeocoderURL = self->_batchReverseGeocoderURL;
  if ((unint64_t)batchReverseGeocoderURL | *((void *)v4 + 18))
  {
    if (!-[GEOURLInfo isEqual:](batchReverseGeocoderURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  simpleETAURL = self->_simpleETAURL;
  if ((unint64_t)simpleETAURL | *((void *)v4 + 51))
  {
    if (!-[GEOURLInfo isEqual:](simpleETAURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  addressCorrectionInitURL = self->_addressCorrectionInitURL;
  if ((unint64_t)addressCorrectionInitURL | *((void *)v4 + 4))
  {
    if (!-[GEOURLInfo isEqual:](addressCorrectionInitURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  addressCorrectionUpdateURL = self->_addressCorrectionUpdateURL;
  if ((unint64_t)addressCorrectionUpdateURL | *((void *)v4 + 6))
  {
    if (!-[GEOURLInfo isEqual:](addressCorrectionUpdateURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  polyLocationShiftURL = self->_polyLocationShiftURL;
  if ((unint64_t)polyLocationShiftURL | *((void *)v4 + 38))
  {
    if (!-[GEOURLInfo isEqual:](polyLocationShiftURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  problemSubmissionURL = self->_problemSubmissionURL;
  if ((unint64_t)problemSubmissionURL | *((void *)v4 + 45))
  {
    if (!-[GEOURLInfo isEqual:](problemSubmissionURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  problemStatusURL = self->_problemStatusURL;
  if ((unint64_t)problemStatusURL | *((void *)v4 + 44))
  {
    if (!-[GEOURLInfo isEqual:](problemStatusURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  reverseGeocoderVersionsURL = self->_reverseGeocoderVersionsURL;
  if ((unint64_t)reverseGeocoderVersionsURL | *((void *)v4 + 49))
  {
    if (!-[GEOURLInfo isEqual:](reverseGeocoderVersionsURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  problemCategoriesURL = self->_problemCategoriesURL;
  if ((unint64_t)problemCategoriesURL | *((void *)v4 + 42))
  {
    if (!-[GEOURLInfo isEqual:](problemCategoriesURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  announcementsURL = self->_announcementsURL;
  if ((unint64_t)announcementsURL | *((void *)v4 + 12))
  {
    if (!-[GEOURLInfo isEqual:](announcementsURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  dispatcherURL = self->_dispatcherURL;
  if ((unint64_t)dispatcherURL | *((void *)v4 + 24))
  {
    if (!-[GEOURLInfo isEqual:](dispatcherURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  problemOptInURL = self->_problemOptInURL;
  if ((unint64_t)problemOptInURL | *((void *)v4 + 43))
  {
    if (!-[GEOURLInfo isEqual:](problemOptInURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  abExperimentURL = self->_abExperimentURL;
  if ((unint64_t)abExperimentURL | *((void *)v4 + 3))
  {
    if (!-[GEOURLInfo isEqual:](abExperimentURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  businessPortalBaseURL = self->_businessPortalBaseURL;
  if ((unint64_t)businessPortalBaseURL | *((void *)v4 + 22))
  {
    if (!-[GEOURLInfo isEqual:](businessPortalBaseURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  logMessageUsageURL = self->_logMessageUsageURL;
  if ((unint64_t)logMessageUsageURL | *((void *)v4 + 30))
  {
    if (!-[GEOURLInfo isEqual:](logMessageUsageURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  spatialLookupURL = self->_spatialLookupURL;
  if ((unint64_t)spatialLookupURL | *((void *)v4 + 52))
  {
    if (!-[GEOURLInfo isEqual:](spatialLookupURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  realtimeTrafficProbeURL = self->_realtimeTrafficProbeURL;
  if ((unint64_t)realtimeTrafficProbeURL | *((void *)v4 + 47))
  {
    if (!-[GEOURLInfo isEqual:](realtimeTrafficProbeURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  batchTrafficProbeURL = self->_batchTrafficProbeURL;
  if ((unint64_t)batchTrafficProbeURL | *((void *)v4 + 19))
  {
    if (!-[GEOURLInfo isEqual:](batchTrafficProbeURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  proactiveRoutingURL = self->_proactiveRoutingURL;
  if ((unint64_t)proactiveRoutingURL | *((void *)v4 + 41))
  {
    if (!-[GEOURLInfo isEqual:](proactiveRoutingURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  logMessageUsageV3URL = self->_logMessageUsageV3URL;
  if ((unint64_t)logMessageUsageV3URL | *((void *)v4 + 31))
  {
    if (!-[GEOURLInfo isEqual:](logMessageUsageV3URL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  backgroundDispatcherURL = self->_backgroundDispatcherURL;
  if ((unint64_t)backgroundDispatcherURL | *((void *)v4 + 15))
  {
    if (!-[GEOURLInfo isEqual:](backgroundDispatcherURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  bluePOIDispatcherURL = self->_bluePOIDispatcherURL;
  if ((unint64_t)bluePOIDispatcherURL | *((void *)v4 + 21))
  {
    if (!-[GEOURLInfo isEqual:](bluePOIDispatcherURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  backgroundRevGeoURL = self->_backgroundRevGeoURL;
  if ((unint64_t)backgroundRevGeoURL | *((void *)v4 + 16))
  {
    if (!-[GEOURLInfo isEqual:](backgroundRevGeoURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  wifiConnectionQualityProbeURL = self->_wifiConnectionQualityProbeURL;
  if ((unint64_t)wifiConnectionQualityProbeURL | *((void *)v4 + 56))
  {
    if (!-[GEOURLInfo isEqual:](wifiConnectionQualityProbeURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  muninBaseURL = self->_muninBaseURL;
  if ((unint64_t)muninBaseURL | *((void *)v4 + 32))
  {
    if (!-[GEOURLInfo isEqual:](muninBaseURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  authProxyURL = self->_authProxyURL;
  if ((unint64_t)authProxyURL | *((void *)v4 + 13))
  {
    if (!-[GEOURLInfo isEqual:](authProxyURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  wifiQualityURL = self->_wifiQualityURL;
  if ((unint64_t)wifiQualityURL | *((void *)v4 + 58))
  {
    if (!-[GEOURLInfo isEqual:](wifiQualityURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  feedbackSubmissionURL = self->_feedbackSubmissionURL;
  if ((unint64_t)feedbackSubmissionURL | *((void *)v4 + 28))
  {
    if (!-[GEOURLInfo isEqual:](feedbackSubmissionURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  feedbackLookupURL = self->_feedbackLookupURL;
  if ((unint64_t)feedbackLookupURL | *((void *)v4 + 27))
  {
    if (!-[GEOURLInfo isEqual:](feedbackLookupURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  junctionImageServiceURL = self->_junctionImageServiceURL;
  if ((unint64_t)junctionImageServiceURL | *((void *)v4 + 29))
  {
    if (!-[GEOURLInfo isEqual:](junctionImageServiceURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  analyticsCohortSessionURL = self->_analyticsCohortSessionURL;
  if ((unint64_t)analyticsCohortSessionURL | *((void *)v4 + 8))
  {
    if (!-[GEOURLInfo isEqual:](analyticsCohortSessionURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  analyticsLongSessionURL = self->_analyticsLongSessionURL;
  if ((unint64_t)analyticsLongSessionURL | *((void *)v4 + 9))
  {
    if (!-[GEOURLInfo isEqual:](analyticsLongSessionURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  analyticsShortSessionURL = self->_analyticsShortSessionURL;
  if ((unint64_t)analyticsShortSessionURL | *((void *)v4 + 11))
  {
    if (!-[GEOURLInfo isEqual:](analyticsShortSessionURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  analyticsSessionlessURL = self->_analyticsSessionlessURL;
  if ((unint64_t)analyticsSessionlessURL | *((void *)v4 + 10))
  {
    if (!-[GEOURLInfo isEqual:](analyticsSessionlessURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  webModuleBaseURL = self->_webModuleBaseURL;
  if ((unint64_t)webModuleBaseURL | *((void *)v4 + 55))
  {
    if (!-[GEOURLInfo isEqual:](webModuleBaseURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  wifiQualityTileURL = self->_wifiQualityTileURL;
  if ((unint64_t)wifiQualityTileURL | *((void *)v4 + 57))
  {
    if (!-[GEOURLInfo isEqual:](wifiQualityTileURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  alternateResourcesURLs = self->_alternateResourcesURLs;
  if ((unint64_t)alternateResourcesURLs | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](alternateResourcesURLs, "isEqual:")) {
      goto LABEL_119;
    }
  }
  tokenAuthenticationURL = self->_tokenAuthenticationURL;
  if ((unint64_t)tokenAuthenticationURL | *((void *)v4 + 53))
  {
    if (!-[GEOURLInfo isEqual:](tokenAuthenticationURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  authenticatedClientFeatureFlagURL = self->_authenticatedClientFeatureFlagURL;
  if ((unint64_t)authenticatedClientFeatureFlagURL | *((void *)v4 + 14))
  {
    if (!-[GEOURLInfo isEqual:](authenticatedClientFeatureFlagURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  addressCorrectionTaggedLocationURL = self->_addressCorrectionTaggedLocationURL;
  if ((unint64_t)addressCorrectionTaggedLocationURL | *((void *)v4 + 5))
  {
    if (!-[GEOURLInfo isEqual:](addressCorrectionTaggedLocationURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  proactiveAppClipURL = self->_proactiveAppClipURL;
  if ((unint64_t)proactiveAppClipURL | *((void *)v4 + 40))
  {
    if (!-[GEOURLInfo isEqual:](proactiveAppClipURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  enrichmentSubmissionURL = self->_enrichmentSubmissionURL;
  if ((unint64_t)enrichmentSubmissionURL | *((void *)v4 + 25))
  {
    if (!-[GEOURLInfo isEqual:](enrichmentSubmissionURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  ugcLogDiscardURL = self->_ugcLogDiscardURL;
  if ((unint64_t)ugcLogDiscardURL | *((void *)v4 + 54))
  {
    if (!-[GEOURLInfo isEqual:](ugcLogDiscardURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  batchReverseGeocoderPlaceRequestURL = self->_batchReverseGeocoderPlaceRequestURL;
  if ((unint64_t)batchReverseGeocoderPlaceRequestURL | *((void *)v4 + 17))
  {
    if (!-[GEOURLInfo isEqual:](batchReverseGeocoderPlaceRequestURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  pressureProbeDataURL = self->_pressureProbeDataURL;
  if ((unint64_t)pressureProbeDataURL | *((void *)v4 + 39))
  {
    if (!-[GEOURLInfo isEqual:](pressureProbeDataURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  poiBusynessActivityCollectionURL = self->_poiBusynessActivityCollectionURL;
  if ((unint64_t)poiBusynessActivityCollectionURL | *((void *)v4 + 37))
  {
    if (!-[GEOURLInfo isEqual:](poiBusynessActivityCollectionURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  rapWebBundleURL = self->_rapWebBundleURL;
  if ((unint64_t)rapWebBundleURL | *((void *)v4 + 46))
  {
    if (!-[GEOURLInfo isEqual:](rapWebBundleURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  networkSelectionHarvestURL = self->_networkSelectionHarvestURL;
  if ((unint64_t)networkSelectionHarvestURL | *((void *)v4 + 33))
  {
    if (!-[GEOURLInfo isEqual:](networkSelectionHarvestURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  offlineDataBatchListURL = self->_offlineDataBatchListURL;
  if ((unint64_t)offlineDataBatchListURL | *((void *)v4 + 34))
  {
    if (!-[GEOURLInfo isEqual:](offlineDataBatchListURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  offlineDataSizeURL = self->_offlineDataSizeURL;
  if ((unint64_t)offlineDataSizeURL | *((void *)v4 + 36))
  {
    if (!-[GEOURLInfo isEqual:](offlineDataSizeURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  offlineDataDownloadBaseURL = self->_offlineDataDownloadBaseURL;
  if ((unint64_t)offlineDataDownloadBaseURL | *((void *)v4 + 35))
  {
    if (!-[GEOURLInfo isEqual:](offlineDataDownloadBaseURL, "isEqual:")) {
      goto LABEL_119;
    }
  }
  bcxDispatcherURL = self->_bcxDispatcherURL;
  if ((unint64_t)bcxDispatcherURL | *((void *)v4 + 20)) {
    char v62 = -[GEOURLInfo isEqual:](bcxDispatcherURL, "isEqual:");
  }
  else {
    char v62 = 1;
  }
LABEL_120:

  return v62;
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      v8 = (int *)&readAll__recursiveTag_1608;
    }
    else {
      v8 = (int *)&readAll__nonRecursiveTag_1609;
    }
    GEOURLInfoSetReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOURLInfoSetCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (void)_addNoFlagsAlternateResourcesURL:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      id v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (GEOURLInfoSet)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOURLInfoSet;
  id v3 = [(GEOURLInfoSet *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (unsigned)dataSet
{
  return self->_dataSet;
}

- (void)setDataSet:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x400000000000001uLL;
  self->_dataSet = a3;
}

- (void)setHasDataSet:(BOOL)a3
{
  self->_flags = ($849DB59CDEB6081B285FC803EA4BE0F6)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x400000000000000);
}

- (BOOL)hasResourcesURL
{
  return self->_resourcesURL != 0;
}

- (void)setResourcesURL:(id)a3
{
  *(void *)&self->_flags |= 0x400800000000000uLL;
  objc_storeStrong((id *)&self->_resourcesURL, a3);
}

- (void)setSearchAttributionManifestURL:(id)a3
{
  *(void *)&self->_flags |= 0x402000000000000uLL;
  objc_storeStrong((id *)&self->_searchAttributionManifestURL, a3);
}

- (BOOL)hasDirectionsURL
{
  return self->_directionsURL != 0;
}

- (void)setDirectionsURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000000400000uLL;
  objc_storeStrong((id *)&self->_directionsURL, a3);
}

- (BOOL)hasEtaURL
{
  return self->_etaURL != 0;
}

- (void)setEtaURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000002000000uLL;
  objc_storeStrong((id *)&self->_etaURL, a3);
}

- (void)_readBatchReverseGeocoderURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 490) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBatchReverseGeocoderURL_tags_1503);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasBatchReverseGeocoderURL
{
  return self->_batchReverseGeocoderURL != 0;
}

- (GEOURLInfo)batchReverseGeocoderURL
{
  -[GEOURLInfoSet _readBatchReverseGeocoderURL]((uint64_t)self);
  batchReverseGeocoderURL = self->_batchReverseGeocoderURL;

  return batchReverseGeocoderURL;
}

- (void)setBatchReverseGeocoderURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000000020000uLL;
  objc_storeStrong((id *)&self->_batchReverseGeocoderURL, a3);
}

- (BOOL)hasSimpleETAURL
{
  return self->_simpleETAURL != 0;
}

- (void)setSimpleETAURL:(id)a3
{
  *(void *)&self->_flags |= 0x404000000000000uLL;
  objc_storeStrong((id *)&self->_simpleETAURL, a3);
}

- (void)_readAddressCorrectionInitURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 488) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressCorrectionInitURL_tags_1505);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasAddressCorrectionInitURL
{
  return self->_addressCorrectionInitURL != 0;
}

- (GEOURLInfo)addressCorrectionInitURL
{
  -[GEOURLInfoSet _readAddressCorrectionInitURL]((uint64_t)self);
  addressCorrectionInitURL = self->_addressCorrectionInitURL;

  return addressCorrectionInitURL;
}

- (void)setAddressCorrectionInitURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000000000008uLL;
  objc_storeStrong((id *)&self->_addressCorrectionInitURL, a3);
}

- (void)_readAddressCorrectionUpdateURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 488) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressCorrectionUpdateURL_tags_1506);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasAddressCorrectionUpdateURL
{
  return self->_addressCorrectionUpdateURL != 0;
}

- (GEOURLInfo)addressCorrectionUpdateURL
{
  -[GEOURLInfoSet _readAddressCorrectionUpdateURL]((uint64_t)self);
  addressCorrectionUpdateURL = self->_addressCorrectionUpdateURL;

  return addressCorrectionUpdateURL;
}

- (void)setAddressCorrectionUpdateURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000000000020uLL;
  objc_storeStrong((id *)&self->_addressCorrectionUpdateURL, a3);
}

- (BOOL)hasPolyLocationShiftURL
{
  return self->_polyLocationShiftURL != 0;
}

- (void)setPolyLocationShiftURL:(id)a3
{
  *(void *)&self->_flags |= 0x400002000000000uLL;
  objc_storeStrong((id *)&self->_polyLocationShiftURL, a3);
}

- (BOOL)hasProblemSubmissionURL
{
  return self->_problemSubmissionURL != 0;
}

- (void)setProblemSubmissionURL:(id)a3
{
  *(void *)&self->_flags |= 0x400100000000000uLL;
  objc_storeStrong((id *)&self->_problemSubmissionURL, a3);
}

- (BOOL)hasProblemStatusURL
{
  return self->_problemStatusURL != 0;
}

- (void)setProblemStatusURL:(id)a3
{
  *(void *)&self->_flags |= 0x400080000000000uLL;
  objc_storeStrong((id *)&self->_problemStatusURL, a3);
}

- (BOOL)hasReverseGeocoderVersionsURL
{
  return self->_reverseGeocoderVersionsURL != 0;
}

- (void)setReverseGeocoderVersionsURL:(id)a3
{
  *(void *)&self->_flags |= 0x401000000000000uLL;
  objc_storeStrong((id *)&self->_reverseGeocoderVersionsURL, a3);
}

- (BOOL)hasProblemCategoriesURL
{
  return self->_problemCategoriesURL != 0;
}

- (void)setProblemCategoriesURL:(id)a3
{
  *(void *)&self->_flags |= 0x400020000000000uLL;
  objc_storeStrong((id *)&self->_problemCategoriesURL, a3);
}

- (BOOL)hasAnnouncementsURL
{
  return self->_announcementsURL != 0;
}

- (void)setAnnouncementsURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000000000800uLL;
  objc_storeStrong((id *)&self->_announcementsURL, a3);
}

- (BOOL)hasDispatcherURL
{
  return self->_dispatcherURL != 0;
}

- (void)setDispatcherURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000000800000uLL;
  objc_storeStrong((id *)&self->_dispatcherURL, a3);
}

- (BOOL)hasProblemOptInURL
{
  return self->_problemOptInURL != 0;
}

- (void)setProblemOptInURL:(id)a3
{
  *(void *)&self->_flags |= 0x400040000000000uLL;
  objc_storeStrong((id *)&self->_problemOptInURL, a3);
}

- (BOOL)hasAbExperimentURL
{
  return self->_abExperimentURL != 0;
}

- (void)setAbExperimentURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000000000004uLL;
  objc_storeStrong((id *)&self->_abExperimentURL, a3);
}

- (BOOL)hasBusinessPortalBaseURL
{
  return self->_businessPortalBaseURL != 0;
}

- (void)setBusinessPortalBaseURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000000200000uLL;
  objc_storeStrong((id *)&self->_businessPortalBaseURL, a3);
}

- (BOOL)hasLogMessageUsageURL
{
  return self->_logMessageUsageURL != 0;
}

- (void)setLogMessageUsageURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000020000000uLL;
  objc_storeStrong((id *)&self->_logMessageUsageURL, a3);
}

- (BOOL)hasSpatialLookupURL
{
  return self->_spatialLookupURL != 0;
}

- (void)setSpatialLookupURL:(id)a3
{
  *(void *)&self->_flags |= 0x408000000000000uLL;
  objc_storeStrong((id *)&self->_spatialLookupURL, a3);
}

- (BOOL)hasRealtimeTrafficProbeURL
{
  return self->_realtimeTrafficProbeURL != 0;
}

- (void)setRealtimeTrafficProbeURL:(id)a3
{
  *(void *)&self->_flags |= 0x400400000000000uLL;
  objc_storeStrong((id *)&self->_realtimeTrafficProbeURL, a3);
}

- (BOOL)hasBatchTrafficProbeURL
{
  return self->_batchTrafficProbeURL != 0;
}

- (void)setBatchTrafficProbeURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000000040000uLL;
  objc_storeStrong((id *)&self->_batchTrafficProbeURL, a3);
}

- (BOOL)hasProactiveRoutingURL
{
  return self->_proactiveRoutingURL != 0;
}

- (void)setProactiveRoutingURL:(id)a3
{
  *(void *)&self->_flags |= 0x400010000000000uLL;
  objc_storeStrong((id *)&self->_proactiveRoutingURL, a3);
}

- (BOOL)hasLogMessageUsageV3URL
{
  return self->_logMessageUsageV3URL != 0;
}

- (void)setLogMessageUsageV3URL:(id)a3
{
  *(void *)&self->_flags |= 0x400000040000000uLL;
  objc_storeStrong((id *)&self->_logMessageUsageV3URL, a3);
}

- (BOOL)hasBackgroundDispatcherURL
{
  return self->_backgroundDispatcherURL != 0;
}

- (void)setBackgroundDispatcherURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000000004000uLL;
  objc_storeStrong((id *)&self->_backgroundDispatcherURL, a3);
}

- (BOOL)hasBluePOIDispatcherURL
{
  return self->_bluePOIDispatcherURL != 0;
}

- (void)setBluePOIDispatcherURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000000100000uLL;
  objc_storeStrong((id *)&self->_bluePOIDispatcherURL, a3);
}

- (BOOL)hasBackgroundRevGeoURL
{
  return self->_backgroundRevGeoURL != 0;
}

- (void)setBackgroundRevGeoURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000000008000uLL;
  objc_storeStrong((id *)&self->_backgroundRevGeoURL, a3);
}

- (BOOL)hasWifiConnectionQualityProbeURL
{
  return self->_wifiConnectionQualityProbeURL != 0;
}

- (void)setWifiConnectionQualityProbeURL:(id)a3
{
  *(void *)&self->_flags |= 0x480000000000000uLL;
  objc_storeStrong((id *)&self->_wifiConnectionQualityProbeURL, a3);
}

- (BOOL)hasMuninBaseURL
{
  return self->_muninBaseURL != 0;
}

- (void)setMuninBaseURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000080000000uLL;
  objc_storeStrong((id *)&self->_muninBaseURL, a3);
}

- (void)setAuthProxyURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000000001000uLL;
  objc_storeStrong((id *)&self->_authProxyURL, a3);
}

- (BOOL)hasWifiQualityURL
{
  return self->_wifiQualityURL != 0;
}

- (void)setWifiQualityURL:(id)a3
{
  *(void *)&self->_flags |= 0x600000000000000uLL;
  objc_storeStrong((id *)&self->_wifiQualityURL, a3);
}

- (BOOL)hasFeedbackSubmissionURL
{
  return self->_feedbackSubmissionURL != 0;
}

- (void)setFeedbackSubmissionURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000008000000uLL;
  objc_storeStrong((id *)&self->_feedbackSubmissionURL, a3);
}

- (BOOL)hasFeedbackLookupURL
{
  return self->_feedbackLookupURL != 0;
}

- (void)setFeedbackLookupURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000004000000uLL;
  objc_storeStrong((id *)&self->_feedbackLookupURL, a3);
}

- (BOOL)hasJunctionImageServiceURL
{
  return self->_junctionImageServiceURL != 0;
}

- (void)setJunctionImageServiceURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000010000000uLL;
  objc_storeStrong((id *)&self->_junctionImageServiceURL, a3);
}

- (BOOL)hasAnalyticsCohortSessionURL
{
  return self->_analyticsCohortSessionURL != 0;
}

- (void)setAnalyticsCohortSessionURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000000000080uLL;
  objc_storeStrong((id *)&self->_analyticsCohortSessionURL, a3);
}

- (BOOL)hasAnalyticsLongSessionURL
{
  return self->_analyticsLongSessionURL != 0;
}

- (void)setAnalyticsLongSessionURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000000000100uLL;
  objc_storeStrong((id *)&self->_analyticsLongSessionURL, a3);
}

- (BOOL)hasAnalyticsShortSessionURL
{
  return self->_analyticsShortSessionURL != 0;
}

- (void)setAnalyticsShortSessionURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000000000400uLL;
  objc_storeStrong((id *)&self->_analyticsShortSessionURL, a3);
}

- (BOOL)hasAnalyticsSessionlessURL
{
  return self->_analyticsSessionlessURL != 0;
}

- (void)setAnalyticsSessionlessURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000000000200uLL;
  objc_storeStrong((id *)&self->_analyticsSessionlessURL, a3);
}

- (BOOL)hasWebModuleBaseURL
{
  return self->_webModuleBaseURL != 0;
}

- (void)setWebModuleBaseURL:(id)a3
{
  *(void *)&self->_flags |= 0x440000000000000uLL;
  objc_storeStrong((id *)&self->_webModuleBaseURL, a3);
}

- (BOOL)hasWifiQualityTileURL
{
  return self->_wifiQualityTileURL != 0;
}

- (void)setWifiQualityTileURL:(id)a3
{
  *(void *)&self->_flags |= 0x500000000000000uLL;
  objc_storeStrong((id *)&self->_wifiQualityTileURL, a3);
}

- (void)setAlternateResourcesURLs:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x400000000000000uLL;
  alternateResourcesURLs = self->_alternateResourcesURLs;
  self->_alternateResourcesURLs = v4;
}

- (void)clearAlternateResourcesURLs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x400000000000000uLL;
  alternateResourcesURLs = self->_alternateResourcesURLs;

  [(NSMutableArray *)alternateResourcesURLs removeAllObjects];
}

- (void)addAlternateResourcesURL:(id)a3
{
  id v4 = a3;
  -[GEOURLInfoSet _readAlternateResourcesURLs]((uint64_t)self);
  -[GEOURLInfoSet _addNoFlagsAlternateResourcesURL:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x400000000000000uLL;
}

- (id)alternateResourcesURLAtIndex:(unint64_t)a3
{
  -[GEOURLInfoSet _readAlternateResourcesURLs]((uint64_t)self);
  alternateResourcesURLs = self->_alternateResourcesURLs;

  return (id)[(NSMutableArray *)alternateResourcesURLs objectAtIndex:a3];
}

+ (Class)alternateResourcesURLType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTokenAuthenticationURL
{
  return self->_tokenAuthenticationURL != 0;
}

- (void)setTokenAuthenticationURL:(id)a3
{
  *(void *)&self->_flags |= 0x410000000000000uLL;
  objc_storeStrong((id *)&self->_tokenAuthenticationURL, a3);
}

- (BOOL)hasAuthenticatedClientFeatureFlagURL
{
  return self->_authenticatedClientFeatureFlagURL != 0;
}

- (void)setAuthenticatedClientFeatureFlagURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000000002000uLL;
  objc_storeStrong((id *)&self->_authenticatedClientFeatureFlagURL, a3);
}

- (BOOL)hasAddressCorrectionTaggedLocationURL
{
  return self->_addressCorrectionTaggedLocationURL != 0;
}

- (void)setAddressCorrectionTaggedLocationURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000000000010uLL;
  objc_storeStrong((id *)&self->_addressCorrectionTaggedLocationURL, a3);
}

- (void)_readProactiveAppClipURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 492) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProactiveAppClipURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasProactiveAppClipURL
{
  return self->_proactiveAppClipURL != 0;
}

- (GEOURLInfo)proactiveAppClipURL
{
  -[GEOURLInfoSet _readProactiveAppClipURL]((uint64_t)self);
  proactiveAppClipURL = self->_proactiveAppClipURL;

  return proactiveAppClipURL;
}

- (void)setProactiveAppClipURL:(id)a3
{
  *(void *)&self->_flags |= 0x400008000000000uLL;
  objc_storeStrong((id *)&self->_proactiveAppClipURL, a3);
}

- (BOOL)hasEnrichmentSubmissionURL
{
  return self->_enrichmentSubmissionURL != 0;
}

- (void)setEnrichmentSubmissionURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000001000000uLL;
  objc_storeStrong((id *)&self->_enrichmentSubmissionURL, a3);
}

- (BOOL)hasUgcLogDiscardURL
{
  return self->_ugcLogDiscardURL != 0;
}

- (void)setUgcLogDiscardURL:(id)a3
{
  *(void *)&self->_flags |= 0x420000000000000uLL;
  objc_storeStrong((id *)&self->_ugcLogDiscardURL, a3);
}

- (BOOL)hasBatchReverseGeocoderPlaceRequestURL
{
  return self->_batchReverseGeocoderPlaceRequestURL != 0;
}

- (void)setBatchReverseGeocoderPlaceRequestURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000000010000uLL;
  objc_storeStrong((id *)&self->_batchReverseGeocoderPlaceRequestURL, a3);
}

- (BOOL)hasPressureProbeDataURL
{
  return self->_pressureProbeDataURL != 0;
}

- (void)setPressureProbeDataURL:(id)a3
{
  *(void *)&self->_flags |= 0x400004000000000uLL;
  objc_storeStrong((id *)&self->_pressureProbeDataURL, a3);
}

- (BOOL)hasPoiBusynessActivityCollectionURL
{
  return self->_poiBusynessActivityCollectionURL != 0;
}

- (void)setPoiBusynessActivityCollectionURL:(id)a3
{
  *(void *)&self->_flags |= 0x400001000000000uLL;
  objc_storeStrong((id *)&self->_poiBusynessActivityCollectionURL, a3);
}

- (BOOL)hasRapWebBundleURL
{
  return self->_rapWebBundleURL != 0;
}

- (void)setRapWebBundleURL:(id)a3
{
  *(void *)&self->_flags |= 0x400200000000000uLL;
  objc_storeStrong((id *)&self->_rapWebBundleURL, a3);
}

- (BOOL)hasNetworkSelectionHarvestURL
{
  return self->_networkSelectionHarvestURL != 0;
}

- (void)setNetworkSelectionHarvestURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000100000000uLL;
  objc_storeStrong((id *)&self->_networkSelectionHarvestURL, a3);
}

- (BOOL)hasOfflineDataBatchListURL
{
  return self->_offlineDataBatchListURL != 0;
}

- (void)setOfflineDataBatchListURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000200000000uLL;
  objc_storeStrong((id *)&self->_offlineDataBatchListURL, a3);
}

- (BOOL)hasOfflineDataSizeURL
{
  return self->_offlineDataSizeURL != 0;
}

- (void)setOfflineDataSizeURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000800000000uLL;
  objc_storeStrong((id *)&self->_offlineDataSizeURL, a3);
}

- (BOOL)hasOfflineDataDownloadBaseURL
{
  return self->_offlineDataDownloadBaseURL != 0;
}

- (void)setOfflineDataDownloadBaseURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000400000000uLL;
  objc_storeStrong((id *)&self->_offlineDataDownloadBaseURL, a3);
}

- (BOOL)hasBcxDispatcherURL
{
  return self->_bcxDispatcherURL != 0;
}

- (void)setBcxDispatcherURL:(id)a3
{
  *(void *)&self->_flags |= 0x400000000080000uLL;
  objc_storeStrong((id *)&self->_bcxDispatcherURL, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOURLInfoSet;
  id v4 = [(GEOURLInfoSet *)&v8 description];
  id v5 = [(GEOURLInfoSet *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOURLInfoSet _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v194 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 488))
    {
      id v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 484)];
      [v4 setObject:v5 forKey:@"dataSet"];
    }
    id v6 = [(id)a1 resourcesURL];
    objc_super v7 = v6;
    if (v6)
    {
      if (a2) {
        [v6 jsonRepresentation];
      }
      else {
      id v8 = [v6 dictionaryRepresentation];
      }

      [v4 setObject:v8 forKey:@"resourcesURL"];
    }

    v9 = [(id)a1 searchAttributionManifestURL];
    id v10 = v9;
    if (v9)
    {
      if (a2) {
        [v9 jsonRepresentation];
      }
      else {
      id v11 = [v9 dictionaryRepresentation];
      }

      [v4 setObject:v11 forKey:@"searchAttributionManifestURL"];
    }

    id v12 = [(id)a1 directionsURL];
    id v13 = v12;
    if (v12)
    {
      if (a2) {
        [v12 jsonRepresentation];
      }
      else {
      id v14 = [v12 dictionaryRepresentation];
      }

      [v4 setObject:v14 forKey:@"directionsURL"];
    }

    v15 = [(id)a1 etaURL];
    v16 = v15;
    if (v15)
    {
      if (a2) {
        [v15 jsonRepresentation];
      }
      else {
      id v17 = [v15 dictionaryRepresentation];
      }

      [v4 setObject:v17 forKey:@"etaURL"];
    }

    v18 = [(id)a1 batchReverseGeocoderURL];
    v19 = v18;
    if (v18)
    {
      if (a2) {
        [v18 jsonRepresentation];
      }
      else {
      id v20 = [v18 dictionaryRepresentation];
      }

      [v4 setObject:v20 forKey:@"batchReverseGeocoderURL"];
    }

    v21 = [(id)a1 simpleETAURL];
    v22 = v21;
    if (v21)
    {
      if (a2) {
        [v21 jsonRepresentation];
      }
      else {
      id v23 = [v21 dictionaryRepresentation];
      }

      [v4 setObject:v23 forKey:@"simpleETAURL"];
    }

    v24 = [(id)a1 addressCorrectionInitURL];
    v25 = v24;
    if (v24)
    {
      if (a2) {
        [v24 jsonRepresentation];
      }
      else {
      id v26 = [v24 dictionaryRepresentation];
      }

      [v4 setObject:v26 forKey:@"addressCorrectionInitURL"];
    }

    v27 = [(id)a1 addressCorrectionUpdateURL];
    v28 = v27;
    if (v27)
    {
      if (a2) {
        [v27 jsonRepresentation];
      }
      else {
      id v29 = [v27 dictionaryRepresentation];
      }

      [v4 setObject:v29 forKey:@"addressCorrectionUpdateURL"];
    }

    v30 = [(id)a1 polyLocationShiftURL];
    v31 = v30;
    if (v30)
    {
      if (a2) {
        [v30 jsonRepresentation];
      }
      else {
      id v32 = [v30 dictionaryRepresentation];
      }

      [v4 setObject:v32 forKey:@"polyLocationShiftURL"];
    }

    v33 = [(id)a1 problemSubmissionURL];
    v34 = v33;
    if (v33)
    {
      if (a2) {
        [v33 jsonRepresentation];
      }
      else {
      id v35 = [v33 dictionaryRepresentation];
      }

      [v4 setObject:v35 forKey:@"problemSubmissionURL"];
    }

    v36 = [(id)a1 problemStatusURL];
    v37 = v36;
    if (v36)
    {
      if (a2) {
        [v36 jsonRepresentation];
      }
      else {
      id v38 = [v36 dictionaryRepresentation];
      }

      [v4 setObject:v38 forKey:@"problemStatusURL"];
    }

    v39 = [(id)a1 reverseGeocoderVersionsURL];
    v40 = v39;
    if (v39)
    {
      if (a2) {
        [v39 jsonRepresentation];
      }
      else {
      id v41 = [v39 dictionaryRepresentation];
      }

      [v4 setObject:v41 forKey:@"reverseGeocoderVersionsURL"];
    }

    v42 = [(id)a1 problemCategoriesURL];
    v43 = v42;
    if (v42)
    {
      if (a2) {
        [v42 jsonRepresentation];
      }
      else {
      id v44 = [v42 dictionaryRepresentation];
      }

      [v4 setObject:v44 forKey:@"problemCategoriesURL"];
    }

    v45 = [(id)a1 announcementsURL];
    v46 = v45;
    if (v45)
    {
      if (a2) {
        [v45 jsonRepresentation];
      }
      else {
      id v47 = [v45 dictionaryRepresentation];
      }

      [v4 setObject:v47 forKey:@"announcementsURL"];
    }

    v48 = [(id)a1 dispatcherURL];
    v49 = v48;
    if (v48)
    {
      if (a2) {
        [v48 jsonRepresentation];
      }
      else {
      id v50 = [v48 dictionaryRepresentation];
      }

      [v4 setObject:v50 forKey:@"dispatcherURL"];
    }

    v51 = [(id)a1 problemOptInURL];
    v52 = v51;
    if (v51)
    {
      if (a2) {
        [v51 jsonRepresentation];
      }
      else {
      id v53 = [v51 dictionaryRepresentation];
      }

      [v4 setObject:v53 forKey:@"problemOptInURL"];
    }

    v54 = [(id)a1 abExperimentURL];
    v55 = v54;
    if (v54)
    {
      if (a2) {
        [v54 jsonRepresentation];
      }
      else {
      id v56 = [v54 dictionaryRepresentation];
      }

      [v4 setObject:v56 forKey:@"abExperimentURL"];
    }

    v57 = [(id)a1 businessPortalBaseURL];
    v58 = v57;
    if (v57)
    {
      if (a2) {
        [v57 jsonRepresentation];
      }
      else {
      id v59 = [v57 dictionaryRepresentation];
      }

      [v4 setObject:v59 forKey:@"businessPortalBaseURL"];
    }

    v60 = [(id)a1 logMessageUsageURL];
    v61 = v60;
    if (v60)
    {
      if (a2) {
        [v60 jsonRepresentation];
      }
      else {
      id v62 = [v60 dictionaryRepresentation];
      }

      [v4 setObject:v62 forKey:@"logMessageUsageURL"];
    }

    v63 = [(id)a1 spatialLookupURL];
    v64 = v63;
    if (v63)
    {
      if (a2) {
        [v63 jsonRepresentation];
      }
      else {
      id v65 = [v63 dictionaryRepresentation];
      }

      [v4 setObject:v65 forKey:@"spatialLookupURL"];
    }

    v66 = [(id)a1 realtimeTrafficProbeURL];
    v67 = v66;
    if (v66)
    {
      if (a2) {
        [v66 jsonRepresentation];
      }
      else {
      id v68 = [v66 dictionaryRepresentation];
      }

      [v4 setObject:v68 forKey:@"realtimeTrafficProbeURL"];
    }

    v69 = [(id)a1 batchTrafficProbeURL];
    v70 = v69;
    if (v69)
    {
      if (a2) {
        [v69 jsonRepresentation];
      }
      else {
      id v71 = [v69 dictionaryRepresentation];
      }

      [v4 setObject:v71 forKey:@"batchTrafficProbeURL"];
    }

    v72 = [(id)a1 proactiveRoutingURL];
    v73 = v72;
    if (v72)
    {
      if (a2) {
        [v72 jsonRepresentation];
      }
      else {
      id v74 = [v72 dictionaryRepresentation];
      }

      [v4 setObject:v74 forKey:@"proactiveRoutingURL"];
    }

    v75 = [(id)a1 logMessageUsageV3URL];
    v76 = v75;
    if (v75)
    {
      if (a2) {
        [v75 jsonRepresentation];
      }
      else {
      id v77 = [v75 dictionaryRepresentation];
      }

      [v4 setObject:v77 forKey:@"logMessageUsageV3URL"];
    }

    v78 = [(id)a1 backgroundDispatcherURL];
    v79 = v78;
    if (v78)
    {
      if (a2) {
        [v78 jsonRepresentation];
      }
      else {
      id v80 = [v78 dictionaryRepresentation];
      }

      [v4 setObject:v80 forKey:@"backgroundDispatcherURL"];
    }

    v81 = [(id)a1 bluePOIDispatcherURL];
    v82 = v81;
    if (v81)
    {
      if (a2) {
        [v81 jsonRepresentation];
      }
      else {
      id v83 = [v81 dictionaryRepresentation];
      }

      [v4 setObject:v83 forKey:@"bluePOIDispatcherURL"];
    }

    v84 = [(id)a1 backgroundRevGeoURL];
    v85 = v84;
    if (v84)
    {
      if (a2) {
        [v84 jsonRepresentation];
      }
      else {
      id v86 = [v84 dictionaryRepresentation];
      }

      [v4 setObject:v86 forKey:@"backgroundRevGeoURL"];
    }

    v87 = [(id)a1 wifiConnectionQualityProbeURL];
    v88 = v87;
    if (v87)
    {
      if (a2) {
        [v87 jsonRepresentation];
      }
      else {
      id v89 = [v87 dictionaryRepresentation];
      }

      [v4 setObject:v89 forKey:@"wifiConnectionQualityProbeURL"];
    }

    v90 = [(id)a1 muninBaseURL];
    v91 = v90;
    if (v90)
    {
      if (a2) {
        [v90 jsonRepresentation];
      }
      else {
      id v92 = [v90 dictionaryRepresentation];
      }

      [v4 setObject:v92 forKey:@"muninBaseURL"];
    }

    v93 = [(id)a1 authProxyURL];
    v94 = v93;
    if (v93)
    {
      if (a2) {
        [v93 jsonRepresentation];
      }
      else {
      id v95 = [v93 dictionaryRepresentation];
      }

      [v4 setObject:v95 forKey:@"authProxyURL"];
    }

    v96 = [(id)a1 wifiQualityURL];
    v97 = v96;
    if (v96)
    {
      if (a2) {
        [v96 jsonRepresentation];
      }
      else {
      id v98 = [v96 dictionaryRepresentation];
      }

      [v4 setObject:v98 forKey:@"wifiQualityURL"];
    }

    v99 = [(id)a1 feedbackSubmissionURL];
    v100 = v99;
    if (v99)
    {
      if (a2) {
        [v99 jsonRepresentation];
      }
      else {
      id v101 = [v99 dictionaryRepresentation];
      }

      [v4 setObject:v101 forKey:@"feedbackSubmissionURL"];
    }

    v102 = [(id)a1 feedbackLookupURL];
    v103 = v102;
    if (v102)
    {
      if (a2) {
        [v102 jsonRepresentation];
      }
      else {
      id v104 = [v102 dictionaryRepresentation];
      }

      [v4 setObject:v104 forKey:@"feedbackLookupURL"];
    }

    v105 = [(id)a1 junctionImageServiceURL];
    v106 = v105;
    if (v105)
    {
      if (a2) {
        [v105 jsonRepresentation];
      }
      else {
      id v107 = [v105 dictionaryRepresentation];
      }

      [v4 setObject:v107 forKey:@"junctionImageServiceURL"];
    }

    v108 = [(id)a1 analyticsCohortSessionURL];
    v109 = v108;
    if (v108)
    {
      if (a2) {
        [v108 jsonRepresentation];
      }
      else {
      id v110 = [v108 dictionaryRepresentation];
      }

      [v4 setObject:v110 forKey:@"analyticsCohortSessionURL"];
    }

    v111 = [(id)a1 analyticsLongSessionURL];
    v112 = v111;
    if (v111)
    {
      if (a2) {
        [v111 jsonRepresentation];
      }
      else {
      id v113 = [v111 dictionaryRepresentation];
      }

      [v4 setObject:v113 forKey:@"analyticsLongSessionURL"];
    }

    v114 = [(id)a1 analyticsShortSessionURL];
    v115 = v114;
    if (v114)
    {
      if (a2) {
        [v114 jsonRepresentation];
      }
      else {
      id v116 = [v114 dictionaryRepresentation];
      }

      [v4 setObject:v116 forKey:@"analyticsShortSessionURL"];
    }

    v117 = [(id)a1 analyticsSessionlessURL];
    v118 = v117;
    if (v117)
    {
      if (a2) {
        [v117 jsonRepresentation];
      }
      else {
      id v119 = [v117 dictionaryRepresentation];
      }

      [v4 setObject:v119 forKey:@"analyticsSessionlessURL"];
    }

    v120 = [(id)a1 webModuleBaseURL];
    v121 = v120;
    if (v120)
    {
      if (a2) {
        [v120 jsonRepresentation];
      }
      else {
      id v122 = [v120 dictionaryRepresentation];
      }

      [v4 setObject:v122 forKey:@"webModuleBaseURL"];
    }

    v123 = [(id)a1 wifiQualityTileURL];
    v124 = v123;
    if (v123)
    {
      if (a2) {
        [v123 jsonRepresentation];
      }
      else {
      id v125 = [v123 dictionaryRepresentation];
      }

      [v4 setObject:v125 forKey:@"wifiQualityTileURL"];
    }

    if ([*(id *)(a1 + 56) count])
    {
      v126 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v189 = 0u;
      long long v190 = 0u;
      long long v191 = 0u;
      long long v192 = 0u;
      id v127 = *(id *)(a1 + 56);
      uint64_t v128 = [v127 countByEnumeratingWithState:&v189 objects:v193 count:16];
      if (v128)
      {
        uint64_t v129 = v128;
        uint64_t v130 = *(void *)v190;
        do
        {
          for (uint64_t i = 0; i != v129; ++i)
          {
            if (*(void *)v190 != v130) {
              objc_enumerationMutation(v127);
            }
            v132 = *(void **)(*((void *)&v189 + 1) + 8 * i);
            if (a2) {
              [v132 jsonRepresentation];
            }
            else {
            id v133 = [v132 dictionaryRepresentation];
            }

            [v126 addObject:v133];
          }
          uint64_t v129 = [v127 countByEnumeratingWithState:&v189 objects:v193 count:16];
        }
        while (v129);
      }

      [v4 setObject:v126 forKey:@"alternateResourcesURL"];
    }
    v134 = [(id)a1 tokenAuthenticationURL];
    v135 = v134;
    if (v134)
    {
      if (a2) {
        [v134 jsonRepresentation];
      }
      else {
      id v136 = [v134 dictionaryRepresentation];
      }

      [v4 setObject:v136 forKey:@"tokenAuthenticationURL"];
    }

    v137 = [(id)a1 authenticatedClientFeatureFlagURL];
    v138 = v137;
    if (v137)
    {
      if (a2) {
        [v137 jsonRepresentation];
      }
      else {
      id v139 = [v137 dictionaryRepresentation];
      }

      [v4 setObject:v139 forKey:@"authenticatedClientFeatureFlagURL"];
    }

    v140 = [(id)a1 addressCorrectionTaggedLocationURL];
    v141 = v140;
    if (v140)
    {
      if (a2) {
        [v140 jsonRepresentation];
      }
      else {
      id v142 = [v140 dictionaryRepresentation];
      }

      [v4 setObject:v142 forKey:@"addressCorrectionTaggedLocationURL"];
    }

    v143 = [(id)a1 proactiveAppClipURL];
    v144 = v143;
    if (v143)
    {
      if (a2) {
        [v143 jsonRepresentation];
      }
      else {
      id v145 = [v143 dictionaryRepresentation];
      }

      [v4 setObject:v145 forKey:@"proactiveAppClipURL"];
    }

    v146 = [(id)a1 enrichmentSubmissionURL];
    v147 = v146;
    if (v146)
    {
      if (a2) {
        [v146 jsonRepresentation];
      }
      else {
      id v148 = [v146 dictionaryRepresentation];
      }

      [v4 setObject:v148 forKey:@"enrichmentSubmissionURL"];
    }

    v149 = [(id)a1 ugcLogDiscardURL];
    v150 = v149;
    if (v149)
    {
      if (a2) {
        [v149 jsonRepresentation];
      }
      else {
      id v151 = [v149 dictionaryRepresentation];
      }

      [v4 setObject:v151 forKey:@"ugcLogDiscardURL"];
    }

    v152 = [(id)a1 batchReverseGeocoderPlaceRequestURL];
    v153 = v152;
    if (v152)
    {
      if (a2) {
        [v152 jsonRepresentation];
      }
      else {
      id v154 = [v152 dictionaryRepresentation];
      }

      [v4 setObject:v154 forKey:@"batchReverseGeocoderPlaceRequestURL"];
    }

    v155 = [(id)a1 pressureProbeDataURL];
    v156 = v155;
    if (v155)
    {
      if (a2) {
        [v155 jsonRepresentation];
      }
      else {
      id v157 = [v155 dictionaryRepresentation];
      }

      [v4 setObject:v157 forKey:@"pressureProbeDataURL"];
    }

    v158 = [(id)a1 poiBusynessActivityCollectionURL];
    v159 = v158;
    if (v158)
    {
      if (a2) {
        [v158 jsonRepresentation];
      }
      else {
      id v160 = [v158 dictionaryRepresentation];
      }

      [v4 setObject:v160 forKey:@"poiBusynessActivityCollectionURL"];
    }

    v161 = [(id)a1 rapWebBundleURL];
    v162 = v161;
    if (v161)
    {
      if (a2) {
        [v161 jsonRepresentation];
      }
      else {
      id v163 = [v161 dictionaryRepresentation];
      }

      [v4 setObject:v163 forKey:@"rapWebBundleURL"];
    }

    v164 = [(id)a1 networkSelectionHarvestURL];
    v165 = v164;
    if (v164)
    {
      if (a2) {
        [v164 jsonRepresentation];
      }
      else {
      id v166 = [v164 dictionaryRepresentation];
      }

      [v4 setObject:v166 forKey:@"networkSelectionHarvestURL"];
    }

    v167 = [(id)a1 offlineDataBatchListURL];
    v168 = v167;
    if (v167)
    {
      if (a2) {
        [v167 jsonRepresentation];
      }
      else {
      id v169 = [v167 dictionaryRepresentation];
      }

      [v4 setObject:v169 forKey:@"offlineDataBatchListURL"];
    }

    v170 = [(id)a1 offlineDataSizeURL];
    v171 = v170;
    if (v170)
    {
      if (a2) {
        [v170 jsonRepresentation];
      }
      else {
      id v172 = [v170 dictionaryRepresentation];
      }

      [v4 setObject:v172 forKey:@"offlineDataSizeURL"];
    }

    v173 = [(id)a1 offlineDataDownloadBaseURL];
    v174 = v173;
    if (v173)
    {
      if (a2) {
        [v173 jsonRepresentation];
      }
      else {
      id v175 = [v173 dictionaryRepresentation];
      }

      [v4 setObject:v175 forKey:@"offlineDataDownloadBaseURL"];
    }

    v176 = [(id)a1 bcxDispatcherURL];
    v177 = v176;
    if (v176)
    {
      if (a2) {
        [v176 jsonRepresentation];
      }
      else {
      id v178 = [v176 dictionaryRepresentation];
      }

      [v4 setObject:v178 forKey:@"bcxDispatcherURL"];
    }

    v179 = *(void **)(a1 + 16);
    if (v179)
    {
      v180 = [v179 dictionaryRepresentation];
      v181 = v180;
      if (a2)
      {
        v182 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v180, "count"));
        v187[0] = MEMORY[0x1E4F143A8];
        v187[1] = 3221225472;
        v187[2] = __43__GEOURLInfoSet__dictionaryRepresentation___block_invoke;
        v187[3] = &unk_1E53D8860;
        id v183 = v182;
        id v188 = v183;
        [v181 enumerateKeysAndObjectsUsingBlock:v187];
        id v184 = v183;

        v181 = v184;
      }
      [v4 setObject:v181 forKey:@"Unknown Fields"];
    }
    id v185 = v4;
  }
  else
  {
    id v185 = 0;
  }

  return v185;
}

- (id)jsonRepresentation
{
  return -[GEOURLInfoSet _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __43__GEOURLInfoSet__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOURLInfoSet)initWithDictionary:(id)a3
{
  return (GEOURLInfoSet *)-[GEOURLInfoSet _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v244 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (id)[a1 init];

    if (a1)
    {
      id v6 = [v5 objectForKeyedSubscript:@"dataSet"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDataSet:", objc_msgSend(v6, "unsignedIntValue"));
      }

      objc_super v7 = [v5 objectForKeyedSubscript:@"resourcesURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v9 = [(GEOURLInfo *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOURLInfo *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setResourcesURL:v9];
      }
      id v11 = [v5 objectForKeyedSubscript:@"searchAttributionManifestURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v13 = [(GEOURLInfo *)v12 initWithJSON:v11];
        }
        else {
          uint64_t v13 = [(GEOURLInfo *)v12 initWithDictionary:v11];
        }
        id v14 = (void *)v13;
        [a1 setSearchAttributionManifestURL:v13];
      }
      v15 = [v5 objectForKeyedSubscript:@"directionsURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v17 = [(GEOURLInfo *)v16 initWithJSON:v15];
        }
        else {
          uint64_t v17 = [(GEOURLInfo *)v16 initWithDictionary:v15];
        }
        v18 = (void *)v17;
        [a1 setDirectionsURL:v17];
      }
      v19 = [v5 objectForKeyedSubscript:@"etaURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v20 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v21 = [(GEOURLInfo *)v20 initWithJSON:v19];
        }
        else {
          uint64_t v21 = [(GEOURLInfo *)v20 initWithDictionary:v19];
        }
        v22 = (void *)v21;
        [a1 setEtaURL:v21];
      }
      id v23 = [v5 objectForKeyedSubscript:@"batchReverseGeocoderURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v24 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v25 = [(GEOURLInfo *)v24 initWithJSON:v23];
        }
        else {
          uint64_t v25 = [(GEOURLInfo *)v24 initWithDictionary:v23];
        }
        id v26 = (void *)v25;
        [a1 setBatchReverseGeocoderURL:v25];
      }
      v27 = [v5 objectForKeyedSubscript:@"simpleETAURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v28 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v29 = [(GEOURLInfo *)v28 initWithJSON:v27];
        }
        else {
          uint64_t v29 = [(GEOURLInfo *)v28 initWithDictionary:v27];
        }
        v30 = (void *)v29;
        [a1 setSimpleETAURL:v29];
      }
      v31 = [v5 objectForKeyedSubscript:@"addressCorrectionInitURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v32 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v33 = [(GEOURLInfo *)v32 initWithJSON:v31];
        }
        else {
          uint64_t v33 = [(GEOURLInfo *)v32 initWithDictionary:v31];
        }
        v34 = (void *)v33;
        [a1 setAddressCorrectionInitURL:v33];
      }
      id v35 = [v5 objectForKeyedSubscript:@"addressCorrectionUpdateURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v36 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v37 = [(GEOURLInfo *)v36 initWithJSON:v35];
        }
        else {
          uint64_t v37 = [(GEOURLInfo *)v36 initWithDictionary:v35];
        }
        id v38 = (void *)v37;
        [a1 setAddressCorrectionUpdateURL:v37];
      }
      v39 = [v5 objectForKeyedSubscript:@"polyLocationShiftURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v40 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v41 = [(GEOURLInfo *)v40 initWithJSON:v39];
        }
        else {
          uint64_t v41 = [(GEOURLInfo *)v40 initWithDictionary:v39];
        }
        v42 = (void *)v41;
        [a1 setPolyLocationShiftURL:v41];
      }
      v43 = [v5 objectForKeyedSubscript:@"problemSubmissionURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v44 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v45 = [(GEOURLInfo *)v44 initWithJSON:v43];
        }
        else {
          uint64_t v45 = [(GEOURLInfo *)v44 initWithDictionary:v43];
        }
        v46 = (void *)v45;
        [a1 setProblemSubmissionURL:v45];
      }
      id v47 = [v5 objectForKeyedSubscript:@"problemStatusURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v48 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v49 = [(GEOURLInfo *)v48 initWithJSON:v47];
        }
        else {
          uint64_t v49 = [(GEOURLInfo *)v48 initWithDictionary:v47];
        }
        id v50 = (void *)v49;
        [a1 setProblemStatusURL:v49];
      }
      v51 = [v5 objectForKeyedSubscript:@"reverseGeocoderVersionsURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v52 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v53 = [(GEOURLInfo *)v52 initWithJSON:v51];
        }
        else {
          uint64_t v53 = [(GEOURLInfo *)v52 initWithDictionary:v51];
        }
        v54 = (void *)v53;
        [a1 setReverseGeocoderVersionsURL:v53];
      }
      v55 = [v5 objectForKeyedSubscript:@"problemCategoriesURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v56 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v57 = [(GEOURLInfo *)v56 initWithJSON:v55];
        }
        else {
          uint64_t v57 = [(GEOURLInfo *)v56 initWithDictionary:v55];
        }
        v58 = (void *)v57;
        [a1 setProblemCategoriesURL:v57];
      }
      id v59 = [v5 objectForKeyedSubscript:@"announcementsURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v60 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v61 = [(GEOURLInfo *)v60 initWithJSON:v59];
        }
        else {
          uint64_t v61 = [(GEOURLInfo *)v60 initWithDictionary:v59];
        }
        id v62 = (void *)v61;
        [a1 setAnnouncementsURL:v61];
      }
      v63 = [v5 objectForKeyedSubscript:@"dispatcherURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v64 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v65 = [(GEOURLInfo *)v64 initWithJSON:v63];
        }
        else {
          uint64_t v65 = [(GEOURLInfo *)v64 initWithDictionary:v63];
        }
        v66 = (void *)v65;
        [a1 setDispatcherURL:v65];
      }
      v67 = [v5 objectForKeyedSubscript:@"problemOptInURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v68 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v69 = [(GEOURLInfo *)v68 initWithJSON:v67];
        }
        else {
          uint64_t v69 = [(GEOURLInfo *)v68 initWithDictionary:v67];
        }
        v70 = (void *)v69;
        [a1 setProblemOptInURL:v69];
      }
      id v71 = [v5 objectForKeyedSubscript:@"abExperimentURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v72 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v73 = [(GEOURLInfo *)v72 initWithJSON:v71];
        }
        else {
          uint64_t v73 = [(GEOURLInfo *)v72 initWithDictionary:v71];
        }
        id v74 = (void *)v73;
        [a1 setAbExperimentURL:v73];
      }
      v75 = [v5 objectForKeyedSubscript:@"businessPortalBaseURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v76 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v77 = [(GEOURLInfo *)v76 initWithJSON:v75];
        }
        else {
          uint64_t v77 = [(GEOURLInfo *)v76 initWithDictionary:v75];
        }
        v78 = (void *)v77;
        [a1 setBusinessPortalBaseURL:v77];
      }
      v79 = [v5 objectForKeyedSubscript:@"logMessageUsageURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v80 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v81 = [(GEOURLInfo *)v80 initWithJSON:v79];
        }
        else {
          uint64_t v81 = [(GEOURLInfo *)v80 initWithDictionary:v79];
        }
        v82 = (void *)v81;
        [a1 setLogMessageUsageURL:v81];
      }
      id v83 = [v5 objectForKeyedSubscript:@"spatialLookupURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v84 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v85 = [(GEOURLInfo *)v84 initWithJSON:v83];
        }
        else {
          uint64_t v85 = [(GEOURLInfo *)v84 initWithDictionary:v83];
        }
        id v86 = (void *)v85;
        [a1 setSpatialLookupURL:v85];
      }
      v87 = [v5 objectForKeyedSubscript:@"realtimeTrafficProbeURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v88 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v89 = [(GEOURLInfo *)v88 initWithJSON:v87];
        }
        else {
          uint64_t v89 = [(GEOURLInfo *)v88 initWithDictionary:v87];
        }
        v90 = (void *)v89;
        [a1 setRealtimeTrafficProbeURL:v89];
      }
      v91 = [v5 objectForKeyedSubscript:@"batchTrafficProbeURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v92 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v93 = [(GEOURLInfo *)v92 initWithJSON:v91];
        }
        else {
          uint64_t v93 = [(GEOURLInfo *)v92 initWithDictionary:v91];
        }
        v94 = (void *)v93;
        [a1 setBatchTrafficProbeURL:v93];
      }
      id v95 = [v5 objectForKeyedSubscript:@"proactiveRoutingURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v96 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v97 = [(GEOURLInfo *)v96 initWithJSON:v95];
        }
        else {
          uint64_t v97 = [(GEOURLInfo *)v96 initWithDictionary:v95];
        }
        id v98 = (void *)v97;
        [a1 setProactiveRoutingURL:v97];
      }
      v99 = [v5 objectForKeyedSubscript:@"logMessageUsageV3URL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v100 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v101 = [(GEOURLInfo *)v100 initWithJSON:v99];
        }
        else {
          uint64_t v101 = [(GEOURLInfo *)v100 initWithDictionary:v99];
        }
        v102 = (void *)v101;
        [a1 setLogMessageUsageV3URL:v101];
      }
      v103 = [v5 objectForKeyedSubscript:@"backgroundDispatcherURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v104 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v105 = [(GEOURLInfo *)v104 initWithJSON:v103];
        }
        else {
          uint64_t v105 = [(GEOURLInfo *)v104 initWithDictionary:v103];
        }
        v106 = (void *)v105;
        [a1 setBackgroundDispatcherURL:v105];
      }
      id v107 = [v5 objectForKeyedSubscript:@"bluePOIDispatcherURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v108 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v109 = [(GEOURLInfo *)v108 initWithJSON:v107];
        }
        else {
          uint64_t v109 = [(GEOURLInfo *)v108 initWithDictionary:v107];
        }
        id v110 = (void *)v109;
        [a1 setBluePOIDispatcherURL:v109];
      }
      v111 = [v5 objectForKeyedSubscript:@"backgroundRevGeoURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v112 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v113 = [(GEOURLInfo *)v112 initWithJSON:v111];
        }
        else {
          uint64_t v113 = [(GEOURLInfo *)v112 initWithDictionary:v111];
        }
        v114 = (void *)v113;
        [a1 setBackgroundRevGeoURL:v113];
      }
      v115 = [v5 objectForKeyedSubscript:@"wifiConnectionQualityProbeURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v116 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v117 = [(GEOURLInfo *)v116 initWithJSON:v115];
        }
        else {
          uint64_t v117 = [(GEOURLInfo *)v116 initWithDictionary:v115];
        }
        v118 = (void *)v117;
        [a1 setWifiConnectionQualityProbeURL:v117];
      }
      id v119 = [v5 objectForKeyedSubscript:@"muninBaseURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v120 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v121 = [(GEOURLInfo *)v120 initWithJSON:v119];
        }
        else {
          uint64_t v121 = [(GEOURLInfo *)v120 initWithDictionary:v119];
        }
        id v122 = (void *)v121;
        [a1 setMuninBaseURL:v121];
      }
      v123 = [v5 objectForKeyedSubscript:@"authProxyURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v124 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v125 = [(GEOURLInfo *)v124 initWithJSON:v123];
        }
        else {
          uint64_t v125 = [(GEOURLInfo *)v124 initWithDictionary:v123];
        }
        v126 = (void *)v125;
        [a1 setAuthProxyURL:v125];
      }
      id v127 = [v5 objectForKeyedSubscript:@"wifiQualityURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v128 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v129 = [(GEOURLInfo *)v128 initWithJSON:v127];
        }
        else {
          uint64_t v129 = [(GEOURLInfo *)v128 initWithDictionary:v127];
        }
        uint64_t v130 = (void *)v129;
        [a1 setWifiQualityURL:v129];
      }
      v131 = [v5 objectForKeyedSubscript:@"feedbackSubmissionURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v132 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v133 = [(GEOURLInfo *)v132 initWithJSON:v131];
        }
        else {
          uint64_t v133 = [(GEOURLInfo *)v132 initWithDictionary:v131];
        }
        v134 = (void *)v133;
        [a1 setFeedbackSubmissionURL:v133];
      }
      v135 = [v5 objectForKeyedSubscript:@"feedbackLookupURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v136 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v137 = [(GEOURLInfo *)v136 initWithJSON:v135];
        }
        else {
          uint64_t v137 = [(GEOURLInfo *)v136 initWithDictionary:v135];
        }
        v138 = (void *)v137;
        [a1 setFeedbackLookupURL:v137];
      }
      id v139 = [v5 objectForKeyedSubscript:@"junctionImageServiceURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v140 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v141 = [(GEOURLInfo *)v140 initWithJSON:v139];
        }
        else {
          uint64_t v141 = [(GEOURLInfo *)v140 initWithDictionary:v139];
        }
        id v142 = (void *)v141;
        [a1 setJunctionImageServiceURL:v141];
      }
      v143 = [v5 objectForKeyedSubscript:@"analyticsCohortSessionURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v144 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v145 = [(GEOURLInfo *)v144 initWithJSON:v143];
        }
        else {
          uint64_t v145 = [(GEOURLInfo *)v144 initWithDictionary:v143];
        }
        v146 = (void *)v145;
        [a1 setAnalyticsCohortSessionURL:v145];
      }
      v147 = [v5 objectForKeyedSubscript:@"analyticsLongSessionURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v148 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v149 = [(GEOURLInfo *)v148 initWithJSON:v147];
        }
        else {
          uint64_t v149 = [(GEOURLInfo *)v148 initWithDictionary:v147];
        }
        v150 = (void *)v149;
        [a1 setAnalyticsLongSessionURL:v149];
      }
      id v151 = [v5 objectForKeyedSubscript:@"analyticsShortSessionURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v152 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v153 = [(GEOURLInfo *)v152 initWithJSON:v151];
        }
        else {
          uint64_t v153 = [(GEOURLInfo *)v152 initWithDictionary:v151];
        }
        id v154 = (void *)v153;
        [a1 setAnalyticsShortSessionURL:v153];
      }
      v155 = [v5 objectForKeyedSubscript:@"analyticsSessionlessURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v156 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v157 = [(GEOURLInfo *)v156 initWithJSON:v155];
        }
        else {
          uint64_t v157 = [(GEOURLInfo *)v156 initWithDictionary:v155];
        }
        v158 = (void *)v157;
        [a1 setAnalyticsSessionlessURL:v157];
      }
      v159 = [v5 objectForKeyedSubscript:@"webModuleBaseURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v160 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v161 = [(GEOURLInfo *)v160 initWithJSON:v159];
        }
        else {
          uint64_t v161 = [(GEOURLInfo *)v160 initWithDictionary:v159];
        }
        v162 = (void *)v161;
        [a1 setWebModuleBaseURL:v161];
      }
      id v163 = [v5 objectForKeyedSubscript:@"wifiQualityTileURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v164 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v165 = [(GEOURLInfo *)v164 initWithJSON:v163];
        }
        else {
          uint64_t v165 = [(GEOURLInfo *)v164 initWithDictionary:v163];
        }
        id v166 = (void *)v165;
        [a1 setWifiQualityTileURL:v165];
      }
      v167 = [v5 objectForKeyedSubscript:@"alternateResourcesURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v238 = v5;
        long long v241 = 0u;
        long long v242 = 0u;
        long long v239 = 0u;
        long long v240 = 0u;
        id v168 = v167;
        uint64_t v169 = [v168 countByEnumeratingWithState:&v239 objects:v243 count:16];
        if (v169)
        {
          uint64_t v170 = v169;
          uint64_t v171 = *(void *)v240;
          do
          {
            for (uint64_t i = 0; i != v170; ++i)
            {
              if (*(void *)v240 != v171) {
                objc_enumerationMutation(v168);
              }
              uint64_t v173 = *(void *)(*((void *)&v239 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v174 = [GEOURLInfo alloc];
                if (a3) {
                  uint64_t v175 = [(GEOURLInfo *)v174 initWithJSON:v173];
                }
                else {
                  uint64_t v175 = [(GEOURLInfo *)v174 initWithDictionary:v173];
                }
                v176 = (void *)v175;
                [a1 addAlternateResourcesURL:v175];
              }
            }
            uint64_t v170 = [v168 countByEnumeratingWithState:&v239 objects:v243 count:16];
          }
          while (v170);
        }

        id v5 = v238;
      }

      v177 = [v5 objectForKeyedSubscript:@"tokenAuthenticationURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v178 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v179 = [(GEOURLInfo *)v178 initWithJSON:v177];
        }
        else {
          uint64_t v179 = [(GEOURLInfo *)v178 initWithDictionary:v177];
        }
        v180 = (void *)v179;
        [a1 setTokenAuthenticationURL:v179];
      }
      v181 = [v5 objectForKeyedSubscript:@"authenticatedClientFeatureFlagURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v182 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v183 = [(GEOURLInfo *)v182 initWithJSON:v181];
        }
        else {
          uint64_t v183 = [(GEOURLInfo *)v182 initWithDictionary:v181];
        }
        id v184 = (void *)v183;
        [a1 setAuthenticatedClientFeatureFlagURL:v183];
      }
      id v185 = [v5 objectForKeyedSubscript:@"addressCorrectionTaggedLocationURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v186 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v187 = [(GEOURLInfo *)v186 initWithJSON:v185];
        }
        else {
          uint64_t v187 = [(GEOURLInfo *)v186 initWithDictionary:v185];
        }
        id v188 = (void *)v187;
        [a1 setAddressCorrectionTaggedLocationURL:v187];
      }
      long long v189 = [v5 objectForKeyedSubscript:@"proactiveAppClipURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v190 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v191 = [(GEOURLInfo *)v190 initWithJSON:v189];
        }
        else {
          uint64_t v191 = [(GEOURLInfo *)v190 initWithDictionary:v189];
        }
        long long v192 = (void *)v191;
        [a1 setProactiveAppClipURL:v191];
      }
      v193 = [v5 objectForKeyedSubscript:@"enrichmentSubmissionURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v194 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v195 = [(GEOURLInfo *)v194 initWithJSON:v193];
        }
        else {
          uint64_t v195 = [(GEOURLInfo *)v194 initWithDictionary:v193];
        }
        v196 = (void *)v195;
        [a1 setEnrichmentSubmissionURL:v195];
      }
      v197 = [v5 objectForKeyedSubscript:@"ugcLogDiscardURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v198 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v199 = [(GEOURLInfo *)v198 initWithJSON:v197];
        }
        else {
          uint64_t v199 = [(GEOURLInfo *)v198 initWithDictionary:v197];
        }
        v200 = (void *)v199;
        [a1 setUgcLogDiscardURL:v199];
      }
      v201 = [v5 objectForKeyedSubscript:@"batchReverseGeocoderPlaceRequestURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v202 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v203 = [(GEOURLInfo *)v202 initWithJSON:v201];
        }
        else {
          uint64_t v203 = [(GEOURLInfo *)v202 initWithDictionary:v201];
        }
        v204 = (void *)v203;
        [a1 setBatchReverseGeocoderPlaceRequestURL:v203];
      }
      v205 = [v5 objectForKeyedSubscript:@"pressureProbeDataURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v206 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v207 = [(GEOURLInfo *)v206 initWithJSON:v205];
        }
        else {
          uint64_t v207 = [(GEOURLInfo *)v206 initWithDictionary:v205];
        }
        v208 = (void *)v207;
        [a1 setPressureProbeDataURL:v207];
      }
      v209 = [v5 objectForKeyedSubscript:@"poiBusynessActivityCollectionURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v210 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v211 = [(GEOURLInfo *)v210 initWithJSON:v209];
        }
        else {
          uint64_t v211 = [(GEOURLInfo *)v210 initWithDictionary:v209];
        }
        v212 = (void *)v211;
        [a1 setPoiBusynessActivityCollectionURL:v211];
      }
      v213 = [v5 objectForKeyedSubscript:@"rapWebBundleURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v214 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v215 = [(GEOURLInfo *)v214 initWithJSON:v213];
        }
        else {
          uint64_t v215 = [(GEOURLInfo *)v214 initWithDictionary:v213];
        }
        v216 = (void *)v215;
        [a1 setRapWebBundleURL:v215];
      }
      v217 = [v5 objectForKeyedSubscript:@"networkSelectionHarvestURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v218 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v219 = [(GEOURLInfo *)v218 initWithJSON:v217];
        }
        else {
          uint64_t v219 = [(GEOURLInfo *)v218 initWithDictionary:v217];
        }
        v220 = (void *)v219;
        [a1 setNetworkSelectionHarvestURL:v219];
      }
      v221 = [v5 objectForKeyedSubscript:@"offlineDataBatchListURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v222 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v223 = [(GEOURLInfo *)v222 initWithJSON:v221];
        }
        else {
          uint64_t v223 = [(GEOURLInfo *)v222 initWithDictionary:v221];
        }
        v224 = (void *)v223;
        [a1 setOfflineDataBatchListURL:v223];
      }
      v225 = [v5 objectForKeyedSubscript:@"offlineDataSizeURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v226 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v227 = [(GEOURLInfo *)v226 initWithJSON:v225];
        }
        else {
          uint64_t v227 = [(GEOURLInfo *)v226 initWithDictionary:v225];
        }
        v228 = (void *)v227;
        [a1 setOfflineDataSizeURL:v227];
      }
      v229 = [v5 objectForKeyedSubscript:@"offlineDataDownloadBaseURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v230 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v231 = [(GEOURLInfo *)v230 initWithJSON:v229];
        }
        else {
          uint64_t v231 = [(GEOURLInfo *)v230 initWithDictionary:v229];
        }
        v232 = (void *)v231;
        [a1 setOfflineDataDownloadBaseURL:v231];
      }
      v233 = [v5 objectForKeyedSubscript:@"bcxDispatcherURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v234 = [GEOURLInfo alloc];
        if (a3) {
          uint64_t v235 = [(GEOURLInfo *)v234 initWithJSON:v233];
        }
        else {
          uint64_t v235 = [(GEOURLInfo *)v234 initWithDictionary:v233];
        }
        v236 = (void *)v235;
        [a1 setBcxDispatcherURL:v235];
      }
      a1 = a1;
    }
  }

  return a1;
}

- (GEOURLInfoSet)initWithJSON:(id)a3
{
  return (GEOURLInfoSet *)-[GEOURLInfoSet _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOURLInfoSetIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOURLInfoSetReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader
    && (os_unfair_lock_assert_owner(&self->_readerLock), (*(void *)&self->_flags & 0x7FFFFFFFFFFFFFCLL) == 0))
  {
    id v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOURLInfoSet *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_resourcesURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_searchAttributionManifestURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_directionsURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_etaURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_batchReverseGeocoderURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_simpleETAURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_addressCorrectionInitURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_addressCorrectionUpdateURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_polyLocationShiftURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_problemSubmissionURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_problemStatusURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_reverseGeocoderVersionsURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_problemCategoriesURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_announcementsURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_dispatcherURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_problemOptInURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_abExperimentURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_businessPortalBaseURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_logMessageUsageURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_spatialLookupURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_realtimeTrafficProbeURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_batchTrafficProbeURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_proactiveRoutingURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_logMessageUsageV3URL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_backgroundDispatcherURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_bluePOIDispatcherURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_backgroundRevGeoURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_wifiConnectionQualityProbeURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_muninBaseURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_authProxyURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_wifiQualityURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_feedbackSubmissionURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_feedbackLookupURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_junctionImageServiceURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_analyticsCohortSessionURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_analyticsLongSessionURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_analyticsShortSessionURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_analyticsSessionlessURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_webModuleBaseURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_wifiQualityTileURL) {
      PBDataWriterWriteSubmessage();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_alternateResourcesURLs;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (self->_tokenAuthenticationURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_authenticatedClientFeatureFlagURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_addressCorrectionTaggedLocationURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_proactiveAppClipURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_enrichmentSubmissionURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_ugcLogDiscardURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_batchReverseGeocoderPlaceRequestURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_pressureProbeDataURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_poiBusynessActivityCollectionURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_rapWebBundleURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_networkSelectionHarvestURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_offlineDataBatchListURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_offlineDataSizeURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_offlineDataDownloadBaseURL) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_bcxDispatcherURL) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = (id *)a3;
  [(GEOURLInfoSet *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 118) = self->_readerMarkPos;
  *((_DWORD *)v9 + 119) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v9 + 121) = self->_dataSet;
    v9[61] = (id)((unint64_t)v9[61] | 1);
  }
  if (self->_resourcesURL) {
    objc_msgSend(v9, "setResourcesURL:");
  }
  if (self->_searchAttributionManifestURL) {
    objc_msgSend(v9, "setSearchAttributionManifestURL:");
  }
  if (self->_directionsURL) {
    objc_msgSend(v9, "setDirectionsURL:");
  }
  if (self->_etaURL) {
    objc_msgSend(v9, "setEtaURL:");
  }
  if (self->_batchReverseGeocoderURL) {
    objc_msgSend(v9, "setBatchReverseGeocoderURL:");
  }
  if (self->_simpleETAURL) {
    objc_msgSend(v9, "setSimpleETAURL:");
  }
  if (self->_addressCorrectionInitURL) {
    objc_msgSend(v9, "setAddressCorrectionInitURL:");
  }
  if (self->_addressCorrectionUpdateURL) {
    objc_msgSend(v9, "setAddressCorrectionUpdateURL:");
  }
  if (self->_polyLocationShiftURL) {
    objc_msgSend(v9, "setPolyLocationShiftURL:");
  }
  if (self->_problemSubmissionURL) {
    objc_msgSend(v9, "setProblemSubmissionURL:");
  }
  if (self->_problemStatusURL) {
    objc_msgSend(v9, "setProblemStatusURL:");
  }
  if (self->_reverseGeocoderVersionsURL) {
    objc_msgSend(v9, "setReverseGeocoderVersionsURL:");
  }
  if (self->_problemCategoriesURL) {
    objc_msgSend(v9, "setProblemCategoriesURL:");
  }
  if (self->_announcementsURL) {
    objc_msgSend(v9, "setAnnouncementsURL:");
  }
  if (self->_dispatcherURL) {
    objc_msgSend(v9, "setDispatcherURL:");
  }
  if (self->_problemOptInURL) {
    objc_msgSend(v9, "setProblemOptInURL:");
  }
  if (self->_abExperimentURL) {
    objc_msgSend(v9, "setAbExperimentURL:");
  }
  if (self->_businessPortalBaseURL) {
    objc_msgSend(v9, "setBusinessPortalBaseURL:");
  }
  if (self->_logMessageUsageURL) {
    objc_msgSend(v9, "setLogMessageUsageURL:");
  }
  if (self->_spatialLookupURL) {
    objc_msgSend(v9, "setSpatialLookupURL:");
  }
  if (self->_realtimeTrafficProbeURL) {
    objc_msgSend(v9, "setRealtimeTrafficProbeURL:");
  }
  if (self->_batchTrafficProbeURL) {
    objc_msgSend(v9, "setBatchTrafficProbeURL:");
  }
  if (self->_proactiveRoutingURL) {
    objc_msgSend(v9, "setProactiveRoutingURL:");
  }
  if (self->_logMessageUsageV3URL) {
    objc_msgSend(v9, "setLogMessageUsageV3URL:");
  }
  if (self->_backgroundDispatcherURL) {
    objc_msgSend(v9, "setBackgroundDispatcherURL:");
  }
  if (self->_bluePOIDispatcherURL) {
    objc_msgSend(v9, "setBluePOIDispatcherURL:");
  }
  if (self->_backgroundRevGeoURL) {
    objc_msgSend(v9, "setBackgroundRevGeoURL:");
  }
  if (self->_wifiConnectionQualityProbeURL) {
    objc_msgSend(v9, "setWifiConnectionQualityProbeURL:");
  }
  if (self->_muninBaseURL) {
    objc_msgSend(v9, "setMuninBaseURL:");
  }
  if (self->_authProxyURL) {
    objc_msgSend(v9, "setAuthProxyURL:");
  }
  if (self->_wifiQualityURL) {
    objc_msgSend(v9, "setWifiQualityURL:");
  }
  if (self->_feedbackSubmissionURL) {
    objc_msgSend(v9, "setFeedbackSubmissionURL:");
  }
  if (self->_feedbackLookupURL) {
    objc_msgSend(v9, "setFeedbackLookupURL:");
  }
  if (self->_junctionImageServiceURL) {
    objc_msgSend(v9, "setJunctionImageServiceURL:");
  }
  if (self->_analyticsCohortSessionURL) {
    objc_msgSend(v9, "setAnalyticsCohortSessionURL:");
  }
  if (self->_analyticsLongSessionURL) {
    objc_msgSend(v9, "setAnalyticsLongSessionURL:");
  }
  if (self->_analyticsShortSessionURL) {
    objc_msgSend(v9, "setAnalyticsShortSessionURL:");
  }
  if (self->_analyticsSessionlessURL) {
    objc_msgSend(v9, "setAnalyticsSessionlessURL:");
  }
  if (self->_webModuleBaseURL) {
    objc_msgSend(v9, "setWebModuleBaseURL:");
  }
  if (self->_wifiQualityTileURL) {
    objc_msgSend(v9, "setWifiQualityTileURL:");
  }
  if ([(GEOURLInfoSet *)self alternateResourcesURLsCount])
  {
    [v9 clearAlternateResourcesURLs];
    unint64_t v4 = [(GEOURLInfoSet *)self alternateResourcesURLsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOURLInfoSet *)self alternateResourcesURLAtIndex:i];
        [v9 addAlternateResourcesURL:v7];
      }
    }
  }
  if (self->_tokenAuthenticationURL) {
    objc_msgSend(v9, "setTokenAuthenticationURL:");
  }
  uint64_t v8 = v9;
  if (self->_authenticatedClientFeatureFlagURL)
  {
    objc_msgSend(v9, "setAuthenticatedClientFeatureFlagURL:");
    uint64_t v8 = v9;
  }
  if (self->_addressCorrectionTaggedLocationURL)
  {
    objc_msgSend(v9, "setAddressCorrectionTaggedLocationURL:");
    uint64_t v8 = v9;
  }
  if (self->_proactiveAppClipURL)
  {
    objc_msgSend(v9, "setProactiveAppClipURL:");
    uint64_t v8 = v9;
  }
  if (self->_enrichmentSubmissionURL)
  {
    objc_msgSend(v9, "setEnrichmentSubmissionURL:");
    uint64_t v8 = v9;
  }
  if (self->_ugcLogDiscardURL)
  {
    objc_msgSend(v9, "setUgcLogDiscardURL:");
    uint64_t v8 = v9;
  }
  if (self->_batchReverseGeocoderPlaceRequestURL)
  {
    objc_msgSend(v9, "setBatchReverseGeocoderPlaceRequestURL:");
    uint64_t v8 = v9;
  }
  if (self->_pressureProbeDataURL)
  {
    objc_msgSend(v9, "setPressureProbeDataURL:");
    uint64_t v8 = v9;
  }
  if (self->_poiBusynessActivityCollectionURL)
  {
    objc_msgSend(v9, "setPoiBusynessActivityCollectionURL:");
    uint64_t v8 = v9;
  }
  if (self->_rapWebBundleURL)
  {
    objc_msgSend(v9, "setRapWebBundleURL:");
    uint64_t v8 = v9;
  }
  if (self->_networkSelectionHarvestURL)
  {
    objc_msgSend(v9, "setNetworkSelectionHarvestURL:");
    uint64_t v8 = v9;
  }
  if (self->_offlineDataBatchListURL)
  {
    objc_msgSend(v9, "setOfflineDataBatchListURL:");
    uint64_t v8 = v9;
  }
  if (self->_offlineDataSizeURL)
  {
    objc_msgSend(v9, "setOfflineDataSizeURL:");
    uint64_t v8 = v9;
  }
  if (self->_offlineDataDownloadBaseURL)
  {
    objc_msgSend(v9, "setOfflineDataDownloadBaseURL:");
    uint64_t v8 = v9;
  }
  if (self->_bcxDispatcherURL)
  {
    objc_msgSend(v9, "setBcxDispatcherURL:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 7) & 4) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOURLInfoSetReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOURLInfoSet *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 484) = self->_dataSet;
    *(void *)(v5 + 488) |= 1uLL;
  }
  id v9 = [(GEOURLInfo *)self->_resourcesURL copyWithZone:a3];
  id v10 = *(void **)(v5 + 384);
  *(void *)(v5 + 384) = v9;

  id v11 = [(GEOURLInfo *)self->_searchAttributionManifestURL copyWithZone:a3];
  long long v12 = *(void **)(v5 + 400);
  *(void *)(v5 + 400) = v11;

  id v13 = [(GEOURLInfo *)self->_directionsURL copyWithZone:a3];
  long long v14 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v13;

  id v15 = [(GEOURLInfo *)self->_etaURL copyWithZone:a3];
  v16 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v15;

  id v17 = [(GEOURLInfo *)self->_batchReverseGeocoderURL copyWithZone:a3];
  v18 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v17;

  id v19 = [(GEOURLInfo *)self->_simpleETAURL copyWithZone:a3];
  id v20 = *(void **)(v5 + 408);
  *(void *)(v5 + 408) = v19;

  id v21 = [(GEOURLInfo *)self->_addressCorrectionInitURL copyWithZone:a3];
  v22 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v21;

  id v23 = [(GEOURLInfo *)self->_addressCorrectionUpdateURL copyWithZone:a3];
  v24 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v23;

  id v25 = [(GEOURLInfo *)self->_polyLocationShiftURL copyWithZone:a3];
  id v26 = *(void **)(v5 + 304);
  *(void *)(v5 + 304) = v25;

  id v27 = [(GEOURLInfo *)self->_problemSubmissionURL copyWithZone:a3];
  v28 = *(void **)(v5 + 360);
  *(void *)(v5 + 360) = v27;

  id v29 = [(GEOURLInfo *)self->_problemStatusURL copyWithZone:a3];
  v30 = *(void **)(v5 + 352);
  *(void *)(v5 + 352) = v29;

  id v31 = [(GEOURLInfo *)self->_reverseGeocoderVersionsURL copyWithZone:a3];
  id v32 = *(void **)(v5 + 392);
  *(void *)(v5 + 392) = v31;

  id v33 = [(GEOURLInfo *)self->_problemCategoriesURL copyWithZone:a3];
  v34 = *(void **)(v5 + 336);
  *(void *)(v5 + 336) = v33;

  id v35 = [(GEOURLInfo *)self->_announcementsURL copyWithZone:a3];
  v36 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v35;

  id v37 = [(GEOURLInfo *)self->_dispatcherURL copyWithZone:a3];
  id v38 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v37;

  id v39 = [(GEOURLInfo *)self->_problemOptInURL copyWithZone:a3];
  v40 = *(void **)(v5 + 344);
  *(void *)(v5 + 344) = v39;

  id v41 = [(GEOURLInfo *)self->_abExperimentURL copyWithZone:a3];
  v42 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v41;

  id v43 = [(GEOURLInfo *)self->_businessPortalBaseURL copyWithZone:a3];
  id v44 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v43;

  id v45 = [(GEOURLInfo *)self->_logMessageUsageURL copyWithZone:a3];
  v46 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v45;

  id v47 = [(GEOURLInfo *)self->_spatialLookupURL copyWithZone:a3];
  v48 = *(void **)(v5 + 416);
  *(void *)(v5 + 416) = v47;

  id v49 = [(GEOURLInfo *)self->_realtimeTrafficProbeURL copyWithZone:a3];
  id v50 = *(void **)(v5 + 376);
  *(void *)(v5 + 376) = v49;

  id v51 = [(GEOURLInfo *)self->_batchTrafficProbeURL copyWithZone:a3];
  v52 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v51;

  id v53 = [(GEOURLInfo *)self->_proactiveRoutingURL copyWithZone:a3];
  v54 = *(void **)(v5 + 328);
  *(void *)(v5 + 328) = v53;

  id v55 = [(GEOURLInfo *)self->_logMessageUsageV3URL copyWithZone:a3];
  id v56 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = v55;

  id v57 = [(GEOURLInfo *)self->_backgroundDispatcherURL copyWithZone:a3];
  v58 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v57;

  id v59 = [(GEOURLInfo *)self->_bluePOIDispatcherURL copyWithZone:a3];
  v60 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v59;

  id v61 = [(GEOURLInfo *)self->_backgroundRevGeoURL copyWithZone:a3];
  id v62 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v61;

  id v63 = [(GEOURLInfo *)self->_wifiConnectionQualityProbeURL copyWithZone:a3];
  v64 = *(void **)(v5 + 448);
  *(void *)(v5 + 448) = v63;

  id v65 = [(GEOURLInfo *)self->_muninBaseURL copyWithZone:a3];
  v66 = *(void **)(v5 + 256);
  *(void *)(v5 + 256) = v65;

  id v67 = [(GEOURLInfo *)self->_authProxyURL copyWithZone:a3];
  id v68 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v67;

  id v69 = [(GEOURLInfo *)self->_wifiQualityURL copyWithZone:a3];
  v70 = *(void **)(v5 + 464);
  *(void *)(v5 + 464) = v69;

  id v71 = [(GEOURLInfo *)self->_feedbackSubmissionURL copyWithZone:a3];
  v72 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v71;

  id v73 = [(GEOURLInfo *)self->_feedbackLookupURL copyWithZone:a3];
  id v74 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v73;

  id v75 = [(GEOURLInfo *)self->_junctionImageServiceURL copyWithZone:a3];
  v76 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = v75;

  id v77 = [(GEOURLInfo *)self->_analyticsCohortSessionURL copyWithZone:a3];
  v78 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v77;

  id v79 = [(GEOURLInfo *)self->_analyticsLongSessionURL copyWithZone:a3];
  id v80 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v79;

  id v81 = [(GEOURLInfo *)self->_analyticsShortSessionURL copyWithZone:a3];
  v82 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v81;

  id v83 = [(GEOURLInfo *)self->_analyticsSessionlessURL copyWithZone:a3];
  v84 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v83;

  id v85 = [(GEOURLInfo *)self->_webModuleBaseURL copyWithZone:a3];
  id v86 = *(void **)(v5 + 440);
  *(void *)(v5 + 440) = v85;

  id v87 = [(GEOURLInfo *)self->_wifiQualityTileURL copyWithZone:a3];
  v88 = *(void **)(v5 + 456);
  *(void *)(v5 + 456) = v87;

  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  uint64_t v89 = self->_alternateResourcesURLs;
  uint64_t v90 = [(NSMutableArray *)v89 countByEnumeratingWithState:&v126 objects:v130 count:16];
  if (v90)
  {
    uint64_t v91 = *(void *)v127;
    do
    {
      for (uint64_t i = 0; i != v90; ++i)
      {
        if (*(void *)v127 != v91) {
          objc_enumerationMutation(v89);
        }
        uint64_t v93 = objc_msgSend(*(id *)(*((void *)&v126 + 1) + 8 * i), "copyWithZone:", a3, (void)v126);
        [(id)v5 addAlternateResourcesURL:v93];
      }
      uint64_t v90 = [(NSMutableArray *)v89 countByEnumeratingWithState:&v126 objects:v130 count:16];
    }
    while (v90);
  }

  id v94 = [(GEOURLInfo *)self->_tokenAuthenticationURL copyWithZone:a3];
  id v95 = *(void **)(v5 + 424);
  *(void *)(v5 + 424) = v94;

  id v96 = [(GEOURLInfo *)self->_authenticatedClientFeatureFlagURL copyWithZone:a3];
  uint64_t v97 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v96;

  id v98 = [(GEOURLInfo *)self->_addressCorrectionTaggedLocationURL copyWithZone:a3];
  v99 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v98;

  id v100 = [(GEOURLInfo *)self->_proactiveAppClipURL copyWithZone:a3];
  uint64_t v101 = *(void **)(v5 + 320);
  *(void *)(v5 + 320) = v100;

  id v102 = [(GEOURLInfo *)self->_enrichmentSubmissionURL copyWithZone:a3];
  v103 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v102;

  id v104 = [(GEOURLInfo *)self->_ugcLogDiscardURL copyWithZone:a3];
  uint64_t v105 = *(void **)(v5 + 432);
  *(void *)(v5 + 432) = v104;

  id v106 = [(GEOURLInfo *)self->_batchReverseGeocoderPlaceRequestURL copyWithZone:a3];
  id v107 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v106;

  id v108 = [(GEOURLInfo *)self->_pressureProbeDataURL copyWithZone:a3];
  uint64_t v109 = *(void **)(v5 + 312);
  *(void *)(v5 + 312) = v108;

  id v110 = [(GEOURLInfo *)self->_poiBusynessActivityCollectionURL copyWithZone:a3];
  v111 = *(void **)(v5 + 296);
  *(void *)(v5 + 296) = v110;

  id v112 = [(GEOURLInfo *)self->_rapWebBundleURL copyWithZone:a3];
  uint64_t v113 = *(void **)(v5 + 368);
  *(void *)(v5 + 368) = v112;

  id v114 = [(GEOURLInfo *)self->_networkSelectionHarvestURL copyWithZone:a3];
  v115 = *(void **)(v5 + 264);
  *(void *)(v5 + 264) = v114;

  id v116 = [(GEOURLInfo *)self->_offlineDataBatchListURL copyWithZone:a3];
  uint64_t v117 = *(void **)(v5 + 272);
  *(void *)(v5 + 272) = v116;

  id v118 = [(GEOURLInfo *)self->_offlineDataSizeURL copyWithZone:a3];
  id v119 = *(void **)(v5 + 288);
  *(void *)(v5 + 288) = v118;

  id v120 = [(GEOURLInfo *)self->_offlineDataDownloadBaseURL copyWithZone:a3];
  uint64_t v121 = *(void **)(v5 + 280);
  *(void *)(v5 + 280) = v120;

  id v122 = [(GEOURLInfo *)self->_bcxDispatcherURL copyWithZone:a3];
  v123 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v122;

  v124 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v124;
LABEL_15:

  return (id)v5;
}

- (unint64_t)hash
{
  [(GEOURLInfoSet *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_dataSet;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOURLInfo *)self->_resourcesURL hash] ^ v3;
  unint64_t v5 = [(GEOURLInfo *)self->_searchAttributionManifestURL hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEOURLInfo *)self->_directionsURL hash];
  unint64_t v7 = [(GEOURLInfo *)self->_etaURL hash];
  unint64_t v8 = v7 ^ [(GEOURLInfo *)self->_batchReverseGeocoderURL hash];
  unint64_t v9 = v6 ^ v8 ^ [(GEOURLInfo *)self->_simpleETAURL hash];
  unint64_t v10 = [(GEOURLInfo *)self->_addressCorrectionInitURL hash];
  unint64_t v11 = v10 ^ [(GEOURLInfo *)self->_addressCorrectionUpdateURL hash];
  unint64_t v12 = v11 ^ [(GEOURLInfo *)self->_polyLocationShiftURL hash];
  unint64_t v13 = v9 ^ v12 ^ [(GEOURLInfo *)self->_problemSubmissionURL hash];
  unint64_t v14 = [(GEOURLInfo *)self->_problemStatusURL hash];
  unint64_t v15 = v14 ^ [(GEOURLInfo *)self->_reverseGeocoderVersionsURL hash];
  unint64_t v16 = v15 ^ [(GEOURLInfo *)self->_problemCategoriesURL hash];
  unint64_t v17 = v16 ^ [(GEOURLInfo *)self->_announcementsURL hash];
  unint64_t v18 = v13 ^ v17 ^ [(GEOURLInfo *)self->_dispatcherURL hash];
  unint64_t v19 = [(GEOURLInfo *)self->_problemOptInURL hash];
  unint64_t v20 = v19 ^ [(GEOURLInfo *)self->_abExperimentURL hash];
  unint64_t v21 = v20 ^ [(GEOURLInfo *)self->_businessPortalBaseURL hash];
  unint64_t v22 = v21 ^ [(GEOURLInfo *)self->_logMessageUsageURL hash];
  unint64_t v23 = v22 ^ [(GEOURLInfo *)self->_spatialLookupURL hash];
  unint64_t v24 = v18 ^ v23 ^ [(GEOURLInfo *)self->_realtimeTrafficProbeURL hash];
  unint64_t v25 = [(GEOURLInfo *)self->_batchTrafficProbeURL hash];
  unint64_t v26 = v25 ^ [(GEOURLInfo *)self->_proactiveRoutingURL hash];
  unint64_t v27 = v26 ^ [(GEOURLInfo *)self->_logMessageUsageV3URL hash];
  unint64_t v28 = v27 ^ [(GEOURLInfo *)self->_backgroundDispatcherURL hash];
  unint64_t v29 = v28 ^ [(GEOURLInfo *)self->_bluePOIDispatcherURL hash];
  unint64_t v30 = v29 ^ [(GEOURLInfo *)self->_backgroundRevGeoURL hash];
  unint64_t v31 = v24 ^ v30 ^ [(GEOURLInfo *)self->_wifiConnectionQualityProbeURL hash];
  unint64_t v32 = [(GEOURLInfo *)self->_muninBaseURL hash];
  unint64_t v33 = v32 ^ [(GEOURLInfo *)self->_authProxyURL hash];
  unint64_t v34 = v33 ^ [(GEOURLInfo *)self->_wifiQualityURL hash];
  unint64_t v35 = v34 ^ [(GEOURLInfo *)self->_feedbackSubmissionURL hash];
  unint64_t v36 = v35 ^ [(GEOURLInfo *)self->_feedbackLookupURL hash];
  unint64_t v37 = v36 ^ [(GEOURLInfo *)self->_junctionImageServiceURL hash];
  unint64_t v38 = v37 ^ [(GEOURLInfo *)self->_analyticsCohortSessionURL hash];
  unint64_t v39 = v31 ^ v38 ^ [(GEOURLInfo *)self->_analyticsLongSessionURL hash];
  unint64_t v40 = [(GEOURLInfo *)self->_analyticsShortSessionURL hash];
  unint64_t v41 = v40 ^ [(GEOURLInfo *)self->_analyticsSessionlessURL hash];
  unint64_t v42 = v41 ^ [(GEOURLInfo *)self->_webModuleBaseURL hash];
  unint64_t v43 = v42 ^ [(GEOURLInfo *)self->_wifiQualityTileURL hash];
  uint64_t v44 = v43 ^ [(NSMutableArray *)self->_alternateResourcesURLs hash];
  unint64_t v45 = v44 ^ [(GEOURLInfo *)self->_tokenAuthenticationURL hash];
  unint64_t v46 = v45 ^ [(GEOURLInfo *)self->_authenticatedClientFeatureFlagURL hash];
  unint64_t v47 = v46 ^ [(GEOURLInfo *)self->_addressCorrectionTaggedLocationURL hash];
  unint64_t v48 = v39 ^ v47 ^ [(GEOURLInfo *)self->_proactiveAppClipURL hash];
  unint64_t v49 = [(GEOURLInfo *)self->_enrichmentSubmissionURL hash];
  unint64_t v50 = v49 ^ [(GEOURLInfo *)self->_ugcLogDiscardURL hash];
  unint64_t v51 = v50 ^ [(GEOURLInfo *)self->_batchReverseGeocoderPlaceRequestURL hash];
  unint64_t v52 = v51 ^ [(GEOURLInfo *)self->_pressureProbeDataURL hash];
  unint64_t v53 = v52 ^ [(GEOURLInfo *)self->_poiBusynessActivityCollectionURL hash];
  unint64_t v54 = v53 ^ [(GEOURLInfo *)self->_rapWebBundleURL hash];
  unint64_t v55 = v54 ^ [(GEOURLInfo *)self->_networkSelectionHarvestURL hash];
  unint64_t v56 = v55 ^ [(GEOURLInfo *)self->_offlineDataBatchListURL hash];
  unint64_t v57 = v56 ^ [(GEOURLInfo *)self->_offlineDataSizeURL hash];
  unint64_t v58 = v48 ^ v57 ^ [(GEOURLInfo *)self->_offlineDataDownloadBaseURL hash];
  return v58 ^ [(GEOURLInfo *)self->_bcxDispatcherURL hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((unsigned char *)v4 + 488))
  {
    self->_dataSet = *((_DWORD *)v4 + 121);
    *(void *)&self->_flags |= 1uLL;
  }
  resourcesURL = self->_resourcesURL;
  uint64_t v6 = *((void *)v4 + 48);
  if (resourcesURL)
  {
    if (v6) {
      -[GEOURLInfo mergeFrom:](resourcesURL, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOURLInfoSet setResourcesURL:](self, "setResourcesURL:");
  }
  searchAttributionManifestURL = self->_searchAttributionManifestURL;
  uint64_t v8 = *((void *)v4 + 50);
  if (searchAttributionManifestURL)
  {
    if (v8) {
      -[GEOURLInfo mergeFrom:](searchAttributionManifestURL, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[GEOURLInfoSet setSearchAttributionManifestURL:](self, "setSearchAttributionManifestURL:");
  }
  directionsURL = self->_directionsURL;
  uint64_t v10 = *((void *)v4 + 23);
  if (directionsURL)
  {
    if (v10) {
      -[GEOURLInfo mergeFrom:](directionsURL, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[GEOURLInfoSet setDirectionsURL:](self, "setDirectionsURL:");
  }
  etaURL = self->_etaURL;
  uint64_t v12 = *((void *)v4 + 26);
  if (etaURL)
  {
    if (v12) {
      -[GEOURLInfo mergeFrom:](etaURL, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[GEOURLInfoSet setEtaURL:](self, "setEtaURL:");
  }
  batchReverseGeocoderURL = self->_batchReverseGeocoderURL;
  uint64_t v14 = *((void *)v4 + 18);
  if (batchReverseGeocoderURL)
  {
    if (v14) {
      -[GEOURLInfo mergeFrom:](batchReverseGeocoderURL, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[GEOURLInfoSet setBatchReverseGeocoderURL:](self, "setBatchReverseGeocoderURL:");
  }
  simpleETAURL = self->_simpleETAURL;
  uint64_t v16 = *((void *)v4 + 51);
  if (simpleETAURL)
  {
    if (v16) {
      -[GEOURLInfo mergeFrom:](simpleETAURL, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[GEOURLInfoSet setSimpleETAURL:](self, "setSimpleETAURL:");
  }
  addressCorrectionInitURL = self->_addressCorrectionInitURL;
  uint64_t v18 = *((void *)v4 + 4);
  if (addressCorrectionInitURL)
  {
    if (v18) {
      -[GEOURLInfo mergeFrom:](addressCorrectionInitURL, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[GEOURLInfoSet setAddressCorrectionInitURL:](self, "setAddressCorrectionInitURL:");
  }
  addressCorrectionUpdateURL = self->_addressCorrectionUpdateURL;
  uint64_t v20 = *((void *)v4 + 6);
  if (addressCorrectionUpdateURL)
  {
    if (v20) {
      -[GEOURLInfo mergeFrom:](addressCorrectionUpdateURL, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[GEOURLInfoSet setAddressCorrectionUpdateURL:](self, "setAddressCorrectionUpdateURL:");
  }
  polyLocationShiftURL = self->_polyLocationShiftURL;
  uint64_t v22 = *((void *)v4 + 38);
  if (polyLocationShiftURL)
  {
    if (v22) {
      -[GEOURLInfo mergeFrom:](polyLocationShiftURL, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[GEOURLInfoSet setPolyLocationShiftURL:](self, "setPolyLocationShiftURL:");
  }
  problemSubmissionURL = self->_problemSubmissionURL;
  uint64_t v24 = *((void *)v4 + 45);
  if (problemSubmissionURL)
  {
    if (v24) {
      -[GEOURLInfo mergeFrom:](problemSubmissionURL, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[GEOURLInfoSet setProblemSubmissionURL:](self, "setProblemSubmissionURL:");
  }
  problemStatusURL = self->_problemStatusURL;
  uint64_t v26 = *((void *)v4 + 44);
  if (problemStatusURL)
  {
    if (v26) {
      -[GEOURLInfo mergeFrom:](problemStatusURL, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[GEOURLInfoSet setProblemStatusURL:](self, "setProblemStatusURL:");
  }
  reverseGeocoderVersionsURL = self->_reverseGeocoderVersionsURL;
  uint64_t v28 = *((void *)v4 + 49);
  if (reverseGeocoderVersionsURL)
  {
    if (v28) {
      -[GEOURLInfo mergeFrom:](reverseGeocoderVersionsURL, "mergeFrom:");
    }
  }
  else if (v28)
  {
    -[GEOURLInfoSet setReverseGeocoderVersionsURL:](self, "setReverseGeocoderVersionsURL:");
  }
  problemCategoriesURL = self->_problemCategoriesURL;
  uint64_t v30 = *((void *)v4 + 42);
  if (problemCategoriesURL)
  {
    if (v30) {
      -[GEOURLInfo mergeFrom:](problemCategoriesURL, "mergeFrom:");
    }
  }
  else if (v30)
  {
    -[GEOURLInfoSet setProblemCategoriesURL:](self, "setProblemCategoriesURL:");
  }
  announcementsURL = self->_announcementsURL;
  uint64_t v32 = *((void *)v4 + 12);
  if (announcementsURL)
  {
    if (v32) {
      -[GEOURLInfo mergeFrom:](announcementsURL, "mergeFrom:");
    }
  }
  else if (v32)
  {
    -[GEOURLInfoSet setAnnouncementsURL:](self, "setAnnouncementsURL:");
  }
  dispatcherURL = self->_dispatcherURL;
  uint64_t v34 = *((void *)v4 + 24);
  if (dispatcherURL)
  {
    if (v34) {
      -[GEOURLInfo mergeFrom:](dispatcherURL, "mergeFrom:");
    }
  }
  else if (v34)
  {
    -[GEOURLInfoSet setDispatcherURL:](self, "setDispatcherURL:");
  }
  problemOptInURL = self->_problemOptInURL;
  uint64_t v36 = *((void *)v4 + 43);
  if (problemOptInURL)
  {
    if (v36) {
      -[GEOURLInfo mergeFrom:](problemOptInURL, "mergeFrom:");
    }
  }
  else if (v36)
  {
    -[GEOURLInfoSet setProblemOptInURL:](self, "setProblemOptInURL:");
  }
  abExperimentURL = self->_abExperimentURL;
  uint64_t v38 = *((void *)v4 + 3);
  if (abExperimentURL)
  {
    if (v38) {
      -[GEOURLInfo mergeFrom:](abExperimentURL, "mergeFrom:");
    }
  }
  else if (v38)
  {
    -[GEOURLInfoSet setAbExperimentURL:](self, "setAbExperimentURL:");
  }
  businessPortalBaseURL = self->_businessPortalBaseURL;
  uint64_t v40 = *((void *)v4 + 22);
  if (businessPortalBaseURL)
  {
    if (v40) {
      -[GEOURLInfo mergeFrom:](businessPortalBaseURL, "mergeFrom:");
    }
  }
  else if (v40)
  {
    -[GEOURLInfoSet setBusinessPortalBaseURL:](self, "setBusinessPortalBaseURL:");
  }
  logMessageUsageURL = self->_logMessageUsageURL;
  uint64_t v42 = *((void *)v4 + 30);
  if (logMessageUsageURL)
  {
    if (v42) {
      -[GEOURLInfo mergeFrom:](logMessageUsageURL, "mergeFrom:");
    }
  }
  else if (v42)
  {
    -[GEOURLInfoSet setLogMessageUsageURL:](self, "setLogMessageUsageURL:");
  }
  spatialLookupURL = self->_spatialLookupURL;
  uint64_t v44 = *((void *)v4 + 52);
  if (spatialLookupURL)
  {
    if (v44) {
      -[GEOURLInfo mergeFrom:](spatialLookupURL, "mergeFrom:");
    }
  }
  else if (v44)
  {
    -[GEOURLInfoSet setSpatialLookupURL:](self, "setSpatialLookupURL:");
  }
  realtimeTrafficProbeURL = self->_realtimeTrafficProbeURL;
  uint64_t v46 = *((void *)v4 + 47);
  if (realtimeTrafficProbeURL)
  {
    if (v46) {
      -[GEOURLInfo mergeFrom:](realtimeTrafficProbeURL, "mergeFrom:");
    }
  }
  else if (v46)
  {
    -[GEOURLInfoSet setRealtimeTrafficProbeURL:](self, "setRealtimeTrafficProbeURL:");
  }
  batchTrafficProbeURL = self->_batchTrafficProbeURL;
  uint64_t v48 = *((void *)v4 + 19);
  if (batchTrafficProbeURL)
  {
    if (v48) {
      -[GEOURLInfo mergeFrom:](batchTrafficProbeURL, "mergeFrom:");
    }
  }
  else if (v48)
  {
    -[GEOURLInfoSet setBatchTrafficProbeURL:](self, "setBatchTrafficProbeURL:");
  }
  proactiveRoutingURL = self->_proactiveRoutingURL;
  uint64_t v50 = *((void *)v4 + 41);
  if (proactiveRoutingURL)
  {
    if (v50) {
      -[GEOURLInfo mergeFrom:](proactiveRoutingURL, "mergeFrom:");
    }
  }
  else if (v50)
  {
    [(GEOURLInfoSet *)self setProactiveRoutingURL:"setProactiveRoutingURL:"];
  }
  logMessageUsageV3URL = self->_logMessageUsageV3URL;
  uint64_t v52 = *((void *)v4 + 31);
  if (logMessageUsageV3URL)
  {
    if (v52) {
      -[GEOURLInfo mergeFrom:](logMessageUsageV3URL, "mergeFrom:");
    }
  }
  else if (v52)
  {
    -[GEOURLInfoSet setLogMessageUsageV3URL:](self, "setLogMessageUsageV3URL:");
  }
  backgroundDispatcherURL = self->_backgroundDispatcherURL;
  uint64_t v54 = *((void *)v4 + 15);
  if (backgroundDispatcherURL)
  {
    if (v54) {
      -[GEOURLInfo mergeFrom:](backgroundDispatcherURL, "mergeFrom:");
    }
  }
  else if (v54)
  {
    -[GEOURLInfoSet setBackgroundDispatcherURL:](self, "setBackgroundDispatcherURL:");
  }
  bluePOIDispatcherURL = self->_bluePOIDispatcherURL;
  uint64_t v56 = *((void *)v4 + 21);
  if (bluePOIDispatcherURL)
  {
    if (v56) {
      -[GEOURLInfo mergeFrom:](bluePOIDispatcherURL, "mergeFrom:");
    }
  }
  else if (v56)
  {
    -[GEOURLInfoSet setBluePOIDispatcherURL:](self, "setBluePOIDispatcherURL:");
  }
  backgroundRevGeoURL = self->_backgroundRevGeoURL;
  uint64_t v58 = *((void *)v4 + 16);
  if (backgroundRevGeoURL)
  {
    if (v58) {
      -[GEOURLInfo mergeFrom:](backgroundRevGeoURL, "mergeFrom:");
    }
  }
  else if (v58)
  {
    -[GEOURLInfoSet setBackgroundRevGeoURL:](self, "setBackgroundRevGeoURL:");
  }
  wifiConnectionQualityProbeURL = self->_wifiConnectionQualityProbeURL;
  uint64_t v60 = *((void *)v4 + 56);
  if (wifiConnectionQualityProbeURL)
  {
    if (v60) {
      -[GEOURLInfo mergeFrom:](wifiConnectionQualityProbeURL, "mergeFrom:");
    }
  }
  else if (v60)
  {
    -[GEOURLInfoSet setWifiConnectionQualityProbeURL:](self, "setWifiConnectionQualityProbeURL:");
  }
  muninBaseURL = self->_muninBaseURL;
  uint64_t v62 = *((void *)v4 + 32);
  if (muninBaseURL)
  {
    if (v62) {
      -[GEOURLInfo mergeFrom:](muninBaseURL, "mergeFrom:");
    }
  }
  else if (v62)
  {
    -[GEOURLInfoSet setMuninBaseURL:](self, "setMuninBaseURL:");
  }
  authProxyURL = self->_authProxyURL;
  uint64_t v64 = *((void *)v4 + 13);
  if (authProxyURL)
  {
    if (v64) {
      -[GEOURLInfo mergeFrom:](authProxyURL, "mergeFrom:");
    }
  }
  else if (v64)
  {
    -[GEOURLInfoSet setAuthProxyURL:](self, "setAuthProxyURL:");
  }
  wifiQualityURL = self->_wifiQualityURL;
  uint64_t v66 = *((void *)v4 + 58);
  if (wifiQualityURL)
  {
    if (v66) {
      -[GEOURLInfo mergeFrom:](wifiQualityURL, "mergeFrom:");
    }
  }
  else if (v66)
  {
    -[GEOURLInfoSet setWifiQualityURL:](self, "setWifiQualityURL:");
  }
  feedbackSubmissionURL = self->_feedbackSubmissionURL;
  uint64_t v68 = *((void *)v4 + 28);
  if (feedbackSubmissionURL)
  {
    if (v68) {
      -[GEOURLInfo mergeFrom:](feedbackSubmissionURL, "mergeFrom:");
    }
  }
  else if (v68)
  {
    -[GEOURLInfoSet setFeedbackSubmissionURL:](self, "setFeedbackSubmissionURL:");
  }
  feedbackLookupURL = self->_feedbackLookupURL;
  uint64_t v70 = *((void *)v4 + 27);
  if (feedbackLookupURL)
  {
    if (v70) {
      -[GEOURLInfo mergeFrom:](feedbackLookupURL, "mergeFrom:");
    }
  }
  else if (v70)
  {
    -[GEOURLInfoSet setFeedbackLookupURL:](self, "setFeedbackLookupURL:");
  }
  junctionImageServiceURL = self->_junctionImageServiceURL;
  uint64_t v72 = *((void *)v4 + 29);
  if (junctionImageServiceURL)
  {
    if (v72) {
      -[GEOURLInfo mergeFrom:](junctionImageServiceURL, "mergeFrom:");
    }
  }
  else if (v72)
  {
    -[GEOURLInfoSet setJunctionImageServiceURL:](self, "setJunctionImageServiceURL:");
  }
  analyticsCohortSessionURL = self->_analyticsCohortSessionURL;
  uint64_t v74 = *((void *)v4 + 8);
  if (analyticsCohortSessionURL)
  {
    if (v74) {
      -[GEOURLInfo mergeFrom:](analyticsCohortSessionURL, "mergeFrom:");
    }
  }
  else if (v74)
  {
    -[GEOURLInfoSet setAnalyticsCohortSessionURL:](self, "setAnalyticsCohortSessionURL:");
  }
  analyticsLongSessionURL = self->_analyticsLongSessionURL;
  uint64_t v76 = *((void *)v4 + 9);
  if (analyticsLongSessionURL)
  {
    if (v76) {
      -[GEOURLInfo mergeFrom:](analyticsLongSessionURL, "mergeFrom:");
    }
  }
  else if (v76)
  {
    -[GEOURLInfoSet setAnalyticsLongSessionURL:](self, "setAnalyticsLongSessionURL:");
  }
  analyticsShortSessionURL = self->_analyticsShortSessionURL;
  uint64_t v78 = *((void *)v4 + 11);
  if (analyticsShortSessionURL)
  {
    if (v78) {
      -[GEOURLInfo mergeFrom:](analyticsShortSessionURL, "mergeFrom:");
    }
  }
  else if (v78)
  {
    -[GEOURLInfoSet setAnalyticsShortSessionURL:](self, "setAnalyticsShortSessionURL:");
  }
  analyticsSessionlessURL = self->_analyticsSessionlessURL;
  uint64_t v80 = *((void *)v4 + 10);
  if (analyticsSessionlessURL)
  {
    if (v80) {
      -[GEOURLInfo mergeFrom:](analyticsSessionlessURL, "mergeFrom:");
    }
  }
  else if (v80)
  {
    -[GEOURLInfoSet setAnalyticsSessionlessURL:](self, "setAnalyticsSessionlessURL:");
  }
  webModuleBaseURL = self->_webModuleBaseURL;
  uint64_t v82 = *((void *)v4 + 55);
  if (webModuleBaseURL)
  {
    if (v82) {
      -[GEOURLInfo mergeFrom:](webModuleBaseURL, "mergeFrom:");
    }
  }
  else if (v82)
  {
    -[GEOURLInfoSet setWebModuleBaseURL:](self, "setWebModuleBaseURL:");
  }
  wifiQualityTileURL = self->_wifiQualityTileURL;
  uint64_t v84 = *((void *)v4 + 57);
  if (wifiQualityTileURL)
  {
    if (v84) {
      -[GEOURLInfo mergeFrom:](wifiQualityTileURL, "mergeFrom:");
    }
  }
  else if (v84)
  {
    -[GEOURLInfoSet setWifiQualityTileURL:](self, "setWifiQualityTileURL:");
  }
  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id v85 = *((id *)v4 + 7);
  uint64_t v86 = [v85 countByEnumeratingWithState:&v120 objects:v124 count:16];
  if (v86)
  {
    uint64_t v87 = v86;
    uint64_t v88 = *(void *)v121;
    do
    {
      for (uint64_t i = 0; i != v87; ++i)
      {
        if (*(void *)v121 != v88) {
          objc_enumerationMutation(v85);
        }
        -[GEOURLInfoSet addAlternateResourcesURL:](self, "addAlternateResourcesURL:", *(void *)(*((void *)&v120 + 1) + 8 * i), (void)v120);
      }
      uint64_t v87 = [v85 countByEnumeratingWithState:&v120 objects:v124 count:16];
    }
    while (v87);
  }

  tokenAuthenticationURL = self->_tokenAuthenticationURL;
  uint64_t v91 = *((void *)v4 + 53);
  if (tokenAuthenticationURL)
  {
    if (v91) {
      -[GEOURLInfo mergeFrom:](tokenAuthenticationURL, "mergeFrom:");
    }
  }
  else if (v91)
  {
    -[GEOURLInfoSet setTokenAuthenticationURL:](self, "setTokenAuthenticationURL:");
  }
  authenticatedClientFeatureFlagURL = self->_authenticatedClientFeatureFlagURL;
  uint64_t v93 = *((void *)v4 + 14);
  if (authenticatedClientFeatureFlagURL)
  {
    if (v93) {
      -[GEOURLInfo mergeFrom:](authenticatedClientFeatureFlagURL, "mergeFrom:");
    }
  }
  else if (v93)
  {
    -[GEOURLInfoSet setAuthenticatedClientFeatureFlagURL:](self, "setAuthenticatedClientFeatureFlagURL:");
  }
  addressCorrectionTaggedLocationURL = self->_addressCorrectionTaggedLocationURL;
  uint64_t v95 = *((void *)v4 + 5);
  if (addressCorrectionTaggedLocationURL)
  {
    if (v95) {
      -[GEOURLInfo mergeFrom:](addressCorrectionTaggedLocationURL, "mergeFrom:");
    }
  }
  else if (v95)
  {
    -[GEOURLInfoSet setAddressCorrectionTaggedLocationURL:](self, "setAddressCorrectionTaggedLocationURL:");
  }
  proactiveAppClipURL = self->_proactiveAppClipURL;
  uint64_t v97 = *((void *)v4 + 40);
  if (proactiveAppClipURL)
  {
    if (v97) {
      -[GEOURLInfo mergeFrom:](proactiveAppClipURL, "mergeFrom:");
    }
  }
  else if (v97)
  {
    -[GEOURLInfoSet setProactiveAppClipURL:](self, "setProactiveAppClipURL:");
  }
  enrichmentSubmissionURL = self->_enrichmentSubmissionURL;
  uint64_t v99 = *((void *)v4 + 25);
  if (enrichmentSubmissionURL)
  {
    if (v99) {
      -[GEOURLInfo mergeFrom:](enrichmentSubmissionURL, "mergeFrom:");
    }
  }
  else if (v99)
  {
    -[GEOURLInfoSet setEnrichmentSubmissionURL:](self, "setEnrichmentSubmissionURL:");
  }
  ugcLogDiscardURL = self->_ugcLogDiscardURL;
  uint64_t v101 = *((void *)v4 + 54);
  if (ugcLogDiscardURL)
  {
    if (v101) {
      -[GEOURLInfo mergeFrom:](ugcLogDiscardURL, "mergeFrom:");
    }
  }
  else if (v101)
  {
    -[GEOURLInfoSet setUgcLogDiscardURL:](self, "setUgcLogDiscardURL:");
  }
  batchReverseGeocoderPlaceRequestURL = self->_batchReverseGeocoderPlaceRequestURL;
  uint64_t v103 = *((void *)v4 + 17);
  if (batchReverseGeocoderPlaceRequestURL)
  {
    if (v103) {
      -[GEOURLInfo mergeFrom:](batchReverseGeocoderPlaceRequestURL, "mergeFrom:");
    }
  }
  else if (v103)
  {
    -[GEOURLInfoSet setBatchReverseGeocoderPlaceRequestURL:](self, "setBatchReverseGeocoderPlaceRequestURL:");
  }
  pressureProbeDataURL = self->_pressureProbeDataURL;
  uint64_t v105 = *((void *)v4 + 39);
  if (pressureProbeDataURL)
  {
    if (v105) {
      -[GEOURLInfo mergeFrom:](pressureProbeDataURL, "mergeFrom:");
    }
  }
  else if (v105)
  {
    -[GEOURLInfoSet setPressureProbeDataURL:](self, "setPressureProbeDataURL:");
  }
  poiBusynessActivityCollectionURL = self->_poiBusynessActivityCollectionURL;
  uint64_t v107 = *((void *)v4 + 37);
  if (poiBusynessActivityCollectionURL)
  {
    if (v107) {
      -[GEOURLInfo mergeFrom:](poiBusynessActivityCollectionURL, "mergeFrom:");
    }
  }
  else if (v107)
  {
    -[GEOURLInfoSet setPoiBusynessActivityCollectionURL:](self, "setPoiBusynessActivityCollectionURL:");
  }
  rapWebBundleURL = self->_rapWebBundleURL;
  uint64_t v109 = *((void *)v4 + 46);
  if (rapWebBundleURL)
  {
    if (v109) {
      -[GEOURLInfo mergeFrom:](rapWebBundleURL, "mergeFrom:");
    }
  }
  else if (v109)
  {
    -[GEOURLInfoSet setRapWebBundleURL:](self, "setRapWebBundleURL:");
  }
  networkSelectionHarvestURL = self->_networkSelectionHarvestURL;
  uint64_t v111 = *((void *)v4 + 33);
  if (networkSelectionHarvestURL)
  {
    if (v111) {
      -[GEOURLInfo mergeFrom:](networkSelectionHarvestURL, "mergeFrom:");
    }
  }
  else if (v111)
  {
    -[GEOURLInfoSet setNetworkSelectionHarvestURL:](self, "setNetworkSelectionHarvestURL:");
  }
  offlineDataBatchListURL = self->_offlineDataBatchListURL;
  uint64_t v113 = *((void *)v4 + 34);
  if (offlineDataBatchListURL)
  {
    if (v113) {
      -[GEOURLInfo mergeFrom:](offlineDataBatchListURL, "mergeFrom:");
    }
  }
  else if (v113)
  {
    -[GEOURLInfoSet setOfflineDataBatchListURL:](self, "setOfflineDataBatchListURL:");
  }
  offlineDataSizeURL = self->_offlineDataSizeURL;
  uint64_t v115 = *((void *)v4 + 36);
  if (offlineDataSizeURL)
  {
    if (v115) {
      -[GEOURLInfo mergeFrom:](offlineDataSizeURL, "mergeFrom:");
    }
  }
  else if (v115)
  {
    -[GEOURLInfoSet setOfflineDataSizeURL:](self, "setOfflineDataSizeURL:");
  }
  offlineDataDownloadBaseURL = self->_offlineDataDownloadBaseURL;
  uint64_t v117 = *((void *)v4 + 35);
  if (offlineDataDownloadBaseURL)
  {
    if (v117) {
      -[GEOURLInfo mergeFrom:](offlineDataDownloadBaseURL, "mergeFrom:");
    }
  }
  else if (v117)
  {
    -[GEOURLInfoSet setOfflineDataDownloadBaseURL:](self, "setOfflineDataDownloadBaseURL:");
  }
  bcxDispatcherURL = self->_bcxDispatcherURL;
  uint64_t v119 = *((void *)v4 + 20);
  if (bcxDispatcherURL)
  {
    if (v119) {
      -[GEOURLInfo mergeFrom:](bcxDispatcherURL, "mergeFrom:");
    }
  }
  else if (v119)
  {
    -[GEOURLInfoSet setBcxDispatcherURL:](self, "setBcxDispatcherURL:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOURLInfoSetReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1613);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000000000002uLL;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOURLInfoSet *)self readAll:0];
    [(GEOURLInfo *)self->_resourcesURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_searchAttributionManifestURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_directionsURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_etaURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_batchReverseGeocoderURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_simpleETAURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_addressCorrectionInitURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_addressCorrectionUpdateURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_polyLocationShiftURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_problemSubmissionURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_problemStatusURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_reverseGeocoderVersionsURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_problemCategoriesURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_announcementsURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_dispatcherURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_problemOptInURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_abExperimentURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_businessPortalBaseURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_logMessageUsageURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_spatialLookupURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_realtimeTrafficProbeURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_batchTrafficProbeURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_proactiveRoutingURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_logMessageUsageV3URL clearUnknownFields:1];
    [(GEOURLInfo *)self->_backgroundDispatcherURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_bluePOIDispatcherURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_backgroundRevGeoURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_wifiConnectionQualityProbeURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_muninBaseURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_authProxyURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_wifiQualityURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_feedbackSubmissionURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_feedbackLookupURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_junctionImageServiceURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_analyticsCohortSessionURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_analyticsLongSessionURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_analyticsShortSessionURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_analyticsSessionlessURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_webModuleBaseURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_wifiQualityTileURL clearUnknownFields:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    unint64_t v7 = self->_alternateResourcesURLs;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    [(GEOURLInfo *)self->_tokenAuthenticationURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_authenticatedClientFeatureFlagURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_addressCorrectionTaggedLocationURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_proactiveAppClipURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_enrichmentSubmissionURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_ugcLogDiscardURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_batchReverseGeocoderPlaceRequestURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_pressureProbeDataURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_poiBusynessActivityCollectionURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_rapWebBundleURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_networkSelectionHarvestURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_offlineDataBatchListURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_offlineDataSizeURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_offlineDataDownloadBaseURL clearUnknownFields:1];
    [(GEOURLInfo *)self->_bcxDispatcherURL clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiQualityURL, 0);
  objc_storeStrong((id *)&self->_wifiQualityTileURL, 0);
  objc_storeStrong((id *)&self->_wifiConnectionQualityProbeURL, 0);
  objc_storeStrong((id *)&self->_webModuleBaseURL, 0);
  objc_storeStrong((id *)&self->_ugcLogDiscardURL, 0);
  objc_storeStrong((id *)&self->_tokenAuthenticationURL, 0);
  objc_storeStrong((id *)&self->_spatialLookupURL, 0);
  objc_storeStrong((id *)&self->_simpleETAURL, 0);
  objc_storeStrong((id *)&self->_searchAttributionManifestURL, 0);
  objc_storeStrong((id *)&self->_reverseGeocoderVersionsURL, 0);
  objc_storeStrong((id *)&self->_resourcesURL, 0);
  objc_storeStrong((id *)&self->_realtimeTrafficProbeURL, 0);
  objc_storeStrong((id *)&self->_rapWebBundleURL, 0);
  objc_storeStrong((id *)&self->_problemSubmissionURL, 0);
  objc_storeStrong((id *)&self->_problemStatusURL, 0);
  objc_storeStrong((id *)&self->_problemOptInURL, 0);
  objc_storeStrong((id *)&self->_problemCategoriesURL, 0);
  objc_storeStrong((id *)&self->_proactiveRoutingURL, 0);
  objc_storeStrong((id *)&self->_proactiveAppClipURL, 0);
  objc_storeStrong((id *)&self->_pressureProbeDataURL, 0);
  objc_storeStrong((id *)&self->_polyLocationShiftURL, 0);
  objc_storeStrong((id *)&self->_poiBusynessActivityCollectionURL, 0);
  objc_storeStrong((id *)&self->_offlineDataSizeURL, 0);
  objc_storeStrong((id *)&self->_offlineDataDownloadBaseURL, 0);
  objc_storeStrong((id *)&self->_offlineDataBatchListURL, 0);
  objc_storeStrong((id *)&self->_networkSelectionHarvestURL, 0);
  objc_storeStrong((id *)&self->_muninBaseURL, 0);
  objc_storeStrong((id *)&self->_logMessageUsageV3URL, 0);
  objc_storeStrong((id *)&self->_logMessageUsageURL, 0);
  objc_storeStrong((id *)&self->_junctionImageServiceURL, 0);
  objc_storeStrong((id *)&self->_feedbackSubmissionURL, 0);
  objc_storeStrong((id *)&self->_feedbackLookupURL, 0);
  objc_storeStrong((id *)&self->_etaURL, 0);
  objc_storeStrong((id *)&self->_enrichmentSubmissionURL, 0);
  objc_storeStrong((id *)&self->_dispatcherURL, 0);
  objc_storeStrong((id *)&self->_directionsURL, 0);
  objc_storeStrong((id *)&self->_businessPortalBaseURL, 0);
  objc_storeStrong((id *)&self->_bluePOIDispatcherURL, 0);
  objc_storeStrong((id *)&self->_bcxDispatcherURL, 0);
  objc_storeStrong((id *)&self->_batchTrafficProbeURL, 0);
  objc_storeStrong((id *)&self->_batchReverseGeocoderURL, 0);
  objc_storeStrong((id *)&self->_batchReverseGeocoderPlaceRequestURL, 0);
  objc_storeStrong((id *)&self->_backgroundRevGeoURL, 0);
  objc_storeStrong((id *)&self->_backgroundDispatcherURL, 0);
  objc_storeStrong((id *)&self->_authenticatedClientFeatureFlagURL, 0);
  objc_storeStrong((id *)&self->_authProxyURL, 0);
  objc_storeStrong((id *)&self->_announcementsURL, 0);
  objc_storeStrong((id *)&self->_analyticsShortSessionURL, 0);
  objc_storeStrong((id *)&self->_analyticsSessionlessURL, 0);
  objc_storeStrong((id *)&self->_analyticsLongSessionURL, 0);
  objc_storeStrong((id *)&self->_analyticsCohortSessionURL, 0);
  objc_storeStrong((id *)&self->_alternateResourcesURLs, 0);
  objc_storeStrong((id *)&self->_addressCorrectionUpdateURL, 0);
  objc_storeStrong((id *)&self->_addressCorrectionTaggedLocationURL, 0);
  objc_storeStrong((id *)&self->_addressCorrectionInitURL, 0);
  objc_storeStrong((id *)&self->_abExperimentURL, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end