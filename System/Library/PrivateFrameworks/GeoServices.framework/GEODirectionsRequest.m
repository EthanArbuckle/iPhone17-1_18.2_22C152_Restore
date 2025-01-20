@interface GEODirectionsRequest
+ (BOOL)isValid:(id)a3;
+ (Class)deviceHistoricalLocationType;
+ (Class)displayedBannerIdType;
+ (Class)originalRouteEvInfoType;
+ (Class)originalRouteZilchPointsType;
+ (Class)serviceTagType;
+ (Class)trafficApiResponsesType;
+ (Class)trafficSnapshotIdsType;
+ (Class)waypointTypedType;
- (BOOL)getRouteForZilchPoints;
- (BOOL)hasAbClientMetadata;
- (BOOL)hasAdditionalEnabledMarkets;
- (BOOL)hasClientCapabilities;
- (BOOL)hasClientFeedbackInfo;
- (BOOL)hasCommonOptions;
- (BOOL)hasCurrentMapRegion;
- (BOOL)hasCurrentUserLocation;
- (BOOL)hasDepartureTime;
- (BOOL)hasFeedback;
- (BOOL)hasGetRouteForZilchPoints;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIsFromAPI;
- (BOOL)hasLastEtaDisplayed;
- (BOOL)hasLastKnownRoadLocation;
- (BOOL)hasLoggedAbExperiment;
- (BOOL)hasMainTransportTypeMaxRouteCount;
- (BOOL)hasNonRecommendedRoutesCache;
- (BOOL)hasNonRecommendedRoutesOption;
- (BOOL)hasOriginalDirectionsResponseID;
- (BOOL)hasOriginalRoute;
- (BOOL)hasOriginalRouteID;
- (BOOL)hasOriginalRoutePurpose;
- (BOOL)hasOriginalWaypointRoute;
- (BOOL)hasPrivacyMetadata;
- (BOOL)hasRecentLocationHistory;
- (BOOL)hasRequestTime;
- (BOOL)hasRouteAttributes;
- (BOOL)hasSequenceNumber;
- (BOOL)hasSessionID;
- (BOOL)hasSessionRelativeTimestamp;
- (BOOL)hasSessionState;
- (BOOL)hasTimeSinceLastRerouteRequest;
- (BOOL)hasTrafficSnapshotUnixTime;
- (BOOL)hasTripInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromAPI;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (GEOAdditionalEnabledMarkets)additionalEnabledMarkets;
- (GEOClientCapabilities)clientCapabilities;
- (GEOClientFeedbackInfo)clientFeedbackInfo;
- (GEOCommonOptions)commonOptions;
- (GEODirectionsRequest)init;
- (GEODirectionsRequest)initWithData:(id)a3;
- (GEODirectionsRequest)initWithDictionary:(id)a3;
- (GEODirectionsRequest)initWithFeedback:(id)a3;
- (GEODirectionsRequest)initWithFeedback:(id)a3 sessionID:(GEOSessionID)a4;
- (GEODirectionsRequest)initWithJSON:(id)a3;
- (GEODirectionsRequest)initWithQuickETARequest:(id)a3 withFeedback:(id)a4;
- (GEODirectionsRequestFeedback)feedback;
- (GEOLocation)currentUserLocation;
- (GEOLocation)lastKnownRoadLocation;
- (GEOMapRegion)currentMapRegion;
- (GEOOriginalRoute)originalRoute;
- (GEOOriginalWaypointRoute)originalWaypointRoute;
- (GEOPDABClientDatasetMetadata)abClientMetadata;
- (GEOPrivacyMetadata)privacyMetadata;
- (GEORecentLocationHistory)recentLocationHistory;
- (GEORouteAttributes)routeAttributes;
- (GEOSessionID)sessionID;
- (GEOTripInfo)tripInfo;
- (NSData)nonRecommendedRoutesCache;
- (NSData)originalDirectionsResponseID;
- (NSData)originalRouteID;
- (NSData)sessionState;
- (NSMutableArray)deviceHistoricalLocations;
- (NSMutableArray)displayedBannerIds;
- (NSMutableArray)originalRouteEvInfos;
- (NSMutableArray)originalRouteZilchPoints;
- (NSMutableArray)serviceTags;
- (NSMutableArray)trafficApiResponses;
- (NSMutableArray)trafficSnapshotIds;
- (NSMutableArray)waypointTypeds;
- (NSString)loggedAbExperiment;
- (PBUnknownFields)unknownFields;
- (double)requestTime;
- (double)sessionRelativeTimestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)deviceHistoricalLocationAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)displayedBannerIdAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)nonRecommendedRoutesOptionAsString:(int)a3;
- (id)originalRouteEvInfoAtIndex:(unint64_t)a3;
- (id)originalRoutePurposeAsString:(int)a3;
- (id)originalRouteZilchPointsAtIndex:(unint64_t)a3;
- (id)serviceTagAtIndex:(unint64_t)a3;
- (id)trafficApiResponsesAtIndex:(unint64_t)a3;
- (id)trafficSnapshotIdsAtIndex:(unint64_t)a3;
- (id)waypointTypedAtIndex:(unint64_t)a3;
- (int)StringAsNonRecommendedRoutesOption:(id)a3;
- (int)StringAsOriginalRoutePurpose:(id)a3;
- (int)departureTime;
- (int)nonRecommendedRoutesOption;
- (int)originalRoutePurpose;
- (unint64_t)deviceHistoricalLocationsCount;
- (unint64_t)displayedBannerIdsCount;
- (unint64_t)hash;
- (unint64_t)originalRouteEvInfosCount;
- (unint64_t)originalRouteZilchPointsCount;
- (unint64_t)serviceTagsCount;
- (unint64_t)trafficApiResponsesCount;
- (unint64_t)trafficSnapshotIdsCount;
- (unint64_t)waypointTypedsCount;
- (unsigned)lastEtaDisplayed;
- (unsigned)mainTransportTypeMaxRouteCount;
- (unsigned)requestTypeCode;
- (unsigned)sequenceNumber;
- (unsigned)timeSinceLastRerouteRequest;
- (unsigned)trafficSnapshotUnixTime;
- (void)_addNoFlagsDeviceHistoricalLocation:(uint64_t)a1;
- (void)_addNoFlagsDisplayedBannerId:(uint64_t)a1;
- (void)_addNoFlagsOriginalRouteEvInfo:(uint64_t)a1;
- (void)_addNoFlagsOriginalRouteZilchPoints:(uint64_t)a1;
- (void)_addNoFlagsServiceTag:(uint64_t)a1;
- (void)_addNoFlagsTrafficApiResponses:(uint64_t)a1;
- (void)_addNoFlagsTrafficSnapshotIds:(uint64_t)a1;
- (void)_addNoFlagsWaypointTyped:(uint64_t)a1;
- (void)_readAbClientMetadata;
- (void)_readAdditionalEnabledMarkets;
- (void)_readClientCapabilities;
- (void)_readClientFeedbackInfo;
- (void)_readCommonOptions;
- (void)_readCurrentMapRegion;
- (void)_readCurrentUserLocation;
- (void)_readDeviceHistoricalLocations;
- (void)_readDisplayedBannerIds;
- (void)_readFeedback;
- (void)_readLastKnownRoadLocation;
- (void)_readLoggedAbExperiment;
- (void)_readNonRecommendedRoutesCache;
- (void)_readOriginalDirectionsResponseID;
- (void)_readOriginalRoute;
- (void)_readOriginalRouteEvInfos;
- (void)_readOriginalRouteID;
- (void)_readOriginalRouteZilchPoints;
- (void)_readOriginalWaypointRoute;
- (void)_readPrivacyMetadata;
- (void)_readRecentLocationHistory;
- (void)_readRouteAttributes;
- (void)_readServiceTags;
- (void)_readSessionState;
- (void)_readTrafficApiResponses;
- (void)_readTrafficSnapshotIds;
- (void)_readTripInfo;
- (void)_readWaypointTypeds;
- (void)addDeviceHistoricalLocation:(id)a3;
- (void)addDisplayedBannerId:(id)a3;
- (void)addOriginalRouteEvInfo:(id)a3;
- (void)addOriginalRouteZilchPoints:(id)a3;
- (void)addServiceTag:(id)a3;
- (void)addTrafficApiResponses:(id)a3;
- (void)addTrafficSnapshotIds:(id)a3;
- (void)addWaypointTyped:(id)a3;
- (void)clearDeviceHistoricalLocations;
- (void)clearDisplayedBannerIds;
- (void)clearLocations;
- (void)clearOriginalRouteEvInfos;
- (void)clearOriginalRouteZilchPoints;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearServiceTags;
- (void)clearSessionId;
- (void)clearTrafficApiResponses;
- (void)clearTrafficSnapshotIds;
- (void)clearUnknownFields:(BOOL)a3;
- (void)clearWaypointTypeds;
- (void)copyTo:(id)a3;
- (void)initDefaultFeedbackInfo;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAbClientMetadata:(id)a3;
- (void)setAdditionalEnabledMarkets:(id)a3;
- (void)setClientCapabilities:(id)a3;
- (void)setClientFeedbackInfo:(id)a3;
- (void)setCommonOptions:(id)a3;
- (void)setCurrentMapRegion:(id)a3;
- (void)setCurrentUserLocation:(id)a3;
- (void)setDepartureTime:(int)a3;
- (void)setDeviceHistoricalLocations:(id)a3;
- (void)setDisplayedBannerIds:(id)a3;
- (void)setFeedback:(id)a3;
- (void)setGetRouteForZilchPoints:(BOOL)a3;
- (void)setHasDepartureTime:(BOOL)a3;
- (void)setHasGetRouteForZilchPoints:(BOOL)a3;
- (void)setHasIsFromAPI:(BOOL)a3;
- (void)setHasLastEtaDisplayed:(BOOL)a3;
- (void)setHasMainTransportTypeMaxRouteCount:(BOOL)a3;
- (void)setHasNonRecommendedRoutesOption:(BOOL)a3;
- (void)setHasOriginalRoutePurpose:(BOOL)a3;
- (void)setHasRequestTime:(BOOL)a3;
- (void)setHasSequenceNumber:(BOOL)a3;
- (void)setHasSessionID:(BOOL)a3;
- (void)setHasSessionRelativeTimestamp:(BOOL)a3;
- (void)setHasTimeSinceLastRerouteRequest:(BOOL)a3;
- (void)setHasTrafficSnapshotUnixTime:(BOOL)a3;
- (void)setIsFromAPI:(BOOL)a3;
- (void)setLastEtaDisplayed:(unsigned int)a3;
- (void)setLastKnownRoadLocation:(id)a3;
- (void)setLoggedAbExperiment:(id)a3;
- (void)setMainTransportTypeMaxRouteCount:(unsigned int)a3;
- (void)setNonRecommendedRoutesCache:(id)a3;
- (void)setNonRecommendedRoutesOption:(int)a3;
- (void)setOriginalDirectionsResponseID:(id)a3;
- (void)setOriginalRoute:(id)a3;
- (void)setOriginalRouteEvInfos:(id)a3;
- (void)setOriginalRouteID:(id)a3;
- (void)setOriginalRoutePurpose:(int)a3;
- (void)setOriginalRouteZilchPoints:(id)a3;
- (void)setOriginalWaypointRoute:(id)a3;
- (void)setPrivacyMetadata:(id)a3;
- (void)setRecentLocationHistory:(id)a3;
- (void)setRequestTime:(double)a3;
- (void)setRouteAttributes:(id)a3;
- (void)setSequenceNumber:(unsigned int)a3;
- (void)setServiceTags:(id)a3;
- (void)setSessionID:(GEOSessionID)a3;
- (void)setSessionRelativeTimestamp:(double)a3;
- (void)setSessionState:(id)a3;
- (void)setTimeSinceLastRerouteRequest:(unsigned int)a3;
- (void)setTrafficApiResponses:(id)a3;
- (void)setTrafficSnapshotIds:(id)a3;
- (void)setTrafficSnapshotUnixTime:(unsigned int)a3;
- (void)setTripInfo:(id)a3;
- (void)setWaypointTypeds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEODirectionsRequest

- (GEODirectionsRequest)initWithFeedback:(id)a3
{
  id v4 = a3;
  v5 = +[GEOUserSession sharedInstance];
  v6 = [v5 mapsUserSessionEntity];
  uint64_t v7 = [v6 sessionID];
  v9 = -[GEODirectionsRequest initWithFeedback:sessionID:](self, "initWithFeedback:sessionID:", v4, v7, v8);

  return v9;
}

- (GEODirectionsRequest)initWithFeedback:(id)a3 sessionID:(GEOSessionID)a4
{
  unint64_t low = a4._low;
  unint64_t high = a4._high;
  id v7 = a3;
  uint64_t v8 = [(GEODirectionsRequest *)self init];
  v9 = v8;
  if (v8)
  {
    -[GEODirectionsRequest setSessionID:](v8, "setSessionID:", high, low);
    v10 = +[GEOUserSession sharedInstance];
    v11 = [v10 mapsUserSessionEntity];
    [v11 sessionRelativeTimestamp];
    -[GEODirectionsRequest setSessionRelativeTimestamp:](v9, "setSessionRelativeTimestamp:");

    [(GEODirectionsRequest *)v9 setFeedback:v7];
  }

  return v9;
}

- (void)initDefaultFeedbackInfo
{
  if (![(GEODirectionsRequest *)self hasSessionID])
  {
    v3 = +[GEOUserSession sharedInstance];
    id v4 = [v3 mapsUserSessionEntity];
    uint64_t v5 = [v4 sessionID];
    -[GEODirectionsRequest setSessionID:](self, "setSessionID:", v5, v6);
  }
  if (![(GEODirectionsRequest *)self hasSessionRelativeTimestamp])
  {
    id v8 = +[GEOUserSession sharedInstance];
    id v7 = [v8 mapsUserSessionEntity];
    [v7 sessionRelativeTimestamp];
    -[GEODirectionsRequest setSessionRelativeTimestamp:](self, "setSessionRelativeTimestamp:");
  }
}

- (GEODirectionsRequest)initWithQuickETARequest:(id)a3 withFeedback:(id)a4
{
  id v6 = a3;
  id v7 = [(GEODirectionsRequest *)self initWithFeedback:a4];
  if (v7)
  {
    id v8 = +[GEOUserSession sharedInstance];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __83__GEODirectionsRequest_GEOQuickETARequester__initWithQuickETARequest_withFeedback___block_invoke;
    v33[3] = &unk_1E53DC588;
    v9 = v7;
    v34 = v9;
    [v8 shortSessionValues:v33];

    v10 = +[GEOAdditionalEnabledMarkets additionalEnabledMarkets];
    [(GEODirectionsRequest *)v9 setAdditionalEnabledMarkets:v10];

    v11 = objc_alloc_init(GEORouteAttributes);
    -[GEORouteAttributes setMainTransportType:](v11, "setMainTransportType:", [v6 transportType]);
    if (![v6 transportType])
    {
      v12 = objc_alloc_init(GEOAutomobileOptions);
      [(GEORouteAttributes *)v11 setAutomobileOptions:v12];

      v13 = [(GEORouteAttributes *)v11 automobileOptions];
      [v13 setIncludeHistoricTravelTime:1];

      v14 = [(GEORouteAttributes *)v11 automobileOptions];
      [v14 setTrafficType:3];

      [(GEORouteAttributes *)v11 setIncludeHistoricTravelTime:1];
      [(GEORouteAttributes *)v11 setTrafficType:3];
    }
    [(GEODirectionsRequest *)v9 setMainTransportTypeMaxRouteCount:1];
    v15 = [v6 arrivalDate];
    v16 = [v6 departureDate];
    v17 = v16;
    if ((v15 == 0) != (v16 != 0)) {
      goto LABEL_10;
    }
    if (v15)
    {
      v18 = v32;
      [v15 timeIntervalSinceReferenceDate];
      uint64_t v31 = 0;
      int v20 = 1;
      v21 = &v31;
    }
    else
    {
      if (!v16)
      {
LABEL_10:
        [(GEODirectionsRequest *)v9 setRouteAttributes:v11];
        v22 = [v6 currentLocation];
        [(GEODirectionsRequest *)v9 setCurrentUserLocation:v22];

        v23 = [v6 sourceWaypoint];
        v24 = [v23 geoWaypointTyped];
        [(GEODirectionsRequest *)v9 addWaypointTyped:v24];

        v25 = [v6 destinationWaypoint];
        v26 = [v25 geoWaypointTyped];
        [(GEODirectionsRequest *)v9 addWaypointTyped:v26];

        v27 = v9;
        goto LABEL_11;
      }
      v18 = v30;
      [v16 timeIntervalSinceReferenceDate];
      int v20 = 0;
      uint64_t v29 = 0;
      v21 = &v29;
    }
    v21[1] = v19;
    *((_DWORD *)v21 + 4) = v20;
    *((unsigned char *)v21 + 20) = 6;
    v18[2] = 0;
    *(_WORD *)v18 = 0;
    -[GEORouteAttributes setTimepoint:](v11, "setTimepoint:");
    goto LABEL_10;
  }
LABEL_11:

  return v7;
}

void __83__GEODirectionsRequest_GEOQuickETARequester__initWithQuickETARequest_withFeedback___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10)
{
  objc_msgSend(*(id *)(a1 + 32), "setSessionID:", a2, a3);
  [*(id *)(a1 + 32) setSessionRelativeTimestamp:a6];
  if (a10)
  {
    v15 = objc_alloc_init(GEOPrivacyMetadata);
    [*(id *)(a1 + 32) setPrivacyMetadata:v15];

    v16 = [*(id *)(a1 + 32) privacyMetadata];
    [v16 setIsUnderageAccount:a8];

    id v17 = [*(id *)(a1 + 32) privacyMetadata];
    [v17 setIsManagedAccount:a9];
  }
}

- (GEODirectionsRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEODirectionsRequest;
  v2 = [(GEODirectionsRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    [(GEODirectionsRequest *)v2 initDefaultFeedbackInfo];
    id v4 = v3;
  }

  return v3;
}

- (GEODirectionsRequest)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEODirectionsRequest;
  v3 = [(GEODirectionsRequest *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    [(GEODirectionsRequest *)v3 initDefaultFeedbackInfo];
    uint64_t v5 = v4;
  }

  return v4;
}

- (void)_readRouteAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 332) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteAttributes_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasRouteAttributes
{
  return self->_routeAttributes != 0;
}

- (GEORouteAttributes)routeAttributes
{
  -[GEODirectionsRequest _readRouteAttributes]((uint64_t)self);
  routeAttributes = self->_routeAttributes;

  return routeAttributes;
}

- (void)setRouteAttributes:(id)a3
{
  *(void *)&self->_flags |= 0x40800000000uLL;
  objc_storeStrong((id *)&self->_routeAttributes, a3);
}

- (void)_readWaypointTypeds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 333) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWaypointTypeds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)waypointTypeds
{
  -[GEODirectionsRequest _readWaypointTypeds]((uint64_t)self);
  waypointTypeds = self->_waypointTypeds;

  return waypointTypeds;
}

- (void)setWaypointTypeds:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  waypointTypeds = self->_waypointTypeds;
  self->_waypointTypeds = v4;
}

- (void)clearWaypointTypeds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  waypointTypeds = self->_waypointTypeds;

  [(NSMutableArray *)waypointTypeds removeAllObjects];
}

- (void)addWaypointTyped:(id)a3
{
  id v4 = a3;
  -[GEODirectionsRequest _readWaypointTypeds]((uint64_t)self);
  -[GEODirectionsRequest _addNoFlagsWaypointTyped:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
}

- (void)_addNoFlagsWaypointTyped:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 272);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 272);
      *(void *)(a1 + 272) = v5;

      id v4 = *(void **)(a1 + 272);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)waypointTypedsCount
{
  -[GEODirectionsRequest _readWaypointTypeds]((uint64_t)self);
  waypointTypeds = self->_waypointTypeds;

  return [(NSMutableArray *)waypointTypeds count];
}

- (id)waypointTypedAtIndex:(unint64_t)a3
{
  -[GEODirectionsRequest _readWaypointTypeds]((uint64_t)self);
  waypointTypeds = self->_waypointTypeds;

  return (id)[(NSMutableArray *)waypointTypeds objectAtIndex:a3];
}

+ (Class)waypointTypedType
{
  return (Class)objc_opt_class();
}

- (void)_readDisplayedBannerIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 330) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayedBannerIds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)displayedBannerIds
{
  -[GEODirectionsRequest _readDisplayedBannerIds]((uint64_t)self);
  displayedBannerIds = self->_displayedBannerIds;

  return displayedBannerIds;
}

- (void)setDisplayedBannerIds:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  displayedBannerIds = self->_displayedBannerIds;
  self->_displayedBannerIds = v4;
}

- (void)clearDisplayedBannerIds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  displayedBannerIds = self->_displayedBannerIds;

  [(NSMutableArray *)displayedBannerIds removeAllObjects];
}

- (void)addDisplayedBannerId:(id)a3
{
  id v4 = a3;
  -[GEODirectionsRequest _readDisplayedBannerIds]((uint64_t)self);
  -[GEODirectionsRequest _addNoFlagsDisplayedBannerId:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
}

- (void)_addNoFlagsDisplayedBannerId:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 104);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = v5;

      id v4 = *(void **)(a1 + 104);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)displayedBannerIdsCount
{
  -[GEODirectionsRequest _readDisplayedBannerIds]((uint64_t)self);
  displayedBannerIds = self->_displayedBannerIds;

  return [(NSMutableArray *)displayedBannerIds count];
}

- (id)displayedBannerIdAtIndex:(unint64_t)a3
{
  -[GEODirectionsRequest _readDisplayedBannerIds]((uint64_t)self);
  displayedBannerIds = self->_displayedBannerIds;

  return (id)[(NSMutableArray *)displayedBannerIds objectAtIndex:a3];
}

+ (Class)displayedBannerIdType
{
  return (Class)objc_opt_class();
}

- (void)_readClientFeedbackInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 330) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientFeedbackInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasClientFeedbackInfo
{
  return self->_clientFeedbackInfo != 0;
}

- (GEOClientFeedbackInfo)clientFeedbackInfo
{
  -[GEODirectionsRequest _readClientFeedbackInfo]((uint64_t)self);
  clientFeedbackInfo = self->_clientFeedbackInfo;

  return clientFeedbackInfo;
}

- (void)setClientFeedbackInfo:(id)a3
{
  *(void *)&self->_flags |= 0x40000020000uLL;
  objc_storeStrong((id *)&self->_clientFeedbackInfo, a3);
}

- (unsigned)mainTransportTypeMaxRouteCount
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $1FEE565F87D5293053496F1336AD4F5E flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x20) != 0) {
    return self->_mainTransportTypeMaxRouteCount;
  }
  else {
    return 1;
  }
}

- (void)setMainTransportTypeMaxRouteCount:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x40000000020uLL;
  self->_mainTransportTypeMaxRouteCount = a3;
}

- (void)setHasMainTransportTypeMaxRouteCount:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000000020;
  }
  self->_$1FEE565F87D5293053496F1336AD4F5E flags = ($1FEE565F87D5293053496F1336AD4F5E)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasMainTransportTypeMaxRouteCount
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (void)_readCurrentUserLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 330) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCurrentUserLocation_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasCurrentUserLocation
{
  return self->_currentUserLocation != 0;
}

- (GEOLocation)currentUserLocation
{
  -[GEODirectionsRequest _readCurrentUserLocation]((uint64_t)self);
  currentUserLocation = self->_currentUserLocation;

  return currentUserLocation;
}

- (void)setCurrentUserLocation:(id)a3
{
  *(void *)&self->_flags |= 0x40000100000uLL;
  objc_storeStrong((id *)&self->_currentUserLocation, a3);
}

- (void)_readCurrentMapRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 330) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCurrentMapRegion_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasCurrentMapRegion
{
  return self->_currentMapRegion != 0;
}

- (GEOMapRegion)currentMapRegion
{
  -[GEODirectionsRequest _readCurrentMapRegion]((uint64_t)self);
  currentMapRegion = self->_currentMapRegion;

  return currentMapRegion;
}

- (void)setCurrentMapRegion:(id)a3
{
  *(void *)&self->_flags |= 0x40000080000uLL;
  objc_storeStrong((id *)&self->_currentMapRegion, a3);
}

- (void)_readOriginalRouteID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 331) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalRouteID_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasOriginalRouteID
{
  return self->_originalRouteID != 0;
}

- (NSData)originalRouteID
{
  -[GEODirectionsRequest _readOriginalRouteID]((uint64_t)self);
  originalRouteID = self->_originalRouteID;

  return originalRouteID;
}

- (void)setOriginalRouteID:(id)a3
{
  *(void *)&self->_flags |= 0x40010000000uLL;
  objc_storeStrong((id *)&self->_originalRouteID, a3);
}

- (void)_readOriginalRouteZilchPoints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 331) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalRouteZilchPoints_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)originalRouteZilchPoints
{
  -[GEODirectionsRequest _readOriginalRouteZilchPoints]((uint64_t)self);
  originalRouteZilchPoints = self->_originalRouteZilchPoints;

  return originalRouteZilchPoints;
}

- (void)setOriginalRouteZilchPoints:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  originalRouteZilchPoints = self->_originalRouteZilchPoints;
  self->_originalRouteZilchPoints = v4;
}

- (void)clearOriginalRouteZilchPoints
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  originalRouteZilchPoints = self->_originalRouteZilchPoints;

  [(NSMutableArray *)originalRouteZilchPoints removeAllObjects];
}

- (void)addOriginalRouteZilchPoints:(id)a3
{
  id v4 = a3;
  -[GEODirectionsRequest _readOriginalRouteZilchPoints]((uint64_t)self);
  -[GEODirectionsRequest _addNoFlagsOriginalRouteZilchPoints:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
}

- (void)_addNoFlagsOriginalRouteZilchPoints:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 160);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 160);
      *(void *)(a1 + 160) = v5;

      id v4 = *(void **)(a1 + 160);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)originalRouteZilchPointsCount
{
  -[GEODirectionsRequest _readOriginalRouteZilchPoints]((uint64_t)self);
  originalRouteZilchPoints = self->_originalRouteZilchPoints;

  return [(NSMutableArray *)originalRouteZilchPoints count];
}

- (id)originalRouteZilchPointsAtIndex:(unint64_t)a3
{
  -[GEODirectionsRequest _readOriginalRouteZilchPoints]((uint64_t)self);
  originalRouteZilchPoints = self->_originalRouteZilchPoints;

  return (id)[(NSMutableArray *)originalRouteZilchPoints objectAtIndex:a3];
}

+ (Class)originalRouteZilchPointsType
{
  return (Class)objc_opt_class();
}

- (void)_readOriginalDirectionsResponseID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 331) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalDirectionsResponseID_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasOriginalDirectionsResponseID
{
  return self->_originalDirectionsResponseID != 0;
}

- (NSData)originalDirectionsResponseID
{
  -[GEODirectionsRequest _readOriginalDirectionsResponseID]((uint64_t)self);
  originalDirectionsResponseID = self->_originalDirectionsResponseID;

  return originalDirectionsResponseID;
}

- (void)setOriginalDirectionsResponseID:(id)a3
{
  *(void *)&self->_flags |= 0x40008000000uLL;
  objc_storeStrong((id *)&self->_originalDirectionsResponseID, a3);
}

- (void)_readOriginalRouteEvInfos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 331) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalRouteEvInfos_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)originalRouteEvInfos
{
  -[GEODirectionsRequest _readOriginalRouteEvInfos]((uint64_t)self);
  originalRouteEvInfos = self->_originalRouteEvInfos;

  return originalRouteEvInfos;
}

- (void)setOriginalRouteEvInfos:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  originalRouteEvInfos = self->_originalRouteEvInfos;
  self->_originalRouteEvInfos = v4;
}

- (void)clearOriginalRouteEvInfos
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  originalRouteEvInfos = self->_originalRouteEvInfos;

  [(NSMutableArray *)originalRouteEvInfos removeAllObjects];
}

- (void)addOriginalRouteEvInfo:(id)a3
{
  id v4 = a3;
  -[GEODirectionsRequest _readOriginalRouteEvInfos]((uint64_t)self);
  -[GEODirectionsRequest _addNoFlagsOriginalRouteEvInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
}

- (void)_addNoFlagsOriginalRouteEvInfo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 176);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 176);
      *(void *)(a1 + 176) = v5;

      id v4 = *(void **)(a1 + 176);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)originalRouteEvInfosCount
{
  -[GEODirectionsRequest _readOriginalRouteEvInfos]((uint64_t)self);
  originalRouteEvInfos = self->_originalRouteEvInfos;

  return [(NSMutableArray *)originalRouteEvInfos count];
}

- (id)originalRouteEvInfoAtIndex:(unint64_t)a3
{
  -[GEODirectionsRequest _readOriginalRouteEvInfos]((uint64_t)self);
  originalRouteEvInfos = self->_originalRouteEvInfos;

  return (id)[(NSMutableArray *)originalRouteEvInfos objectAtIndex:a3];
}

+ (Class)originalRouteEvInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readOriginalRoute
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 331) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalRoute_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasOriginalRoute
{
  return self->_originalRoute != 0;
}

- (GEOOriginalRoute)originalRoute
{
  -[GEODirectionsRequest _readOriginalRoute]((uint64_t)self);
  originalRoute = self->_originalRoute;

  return originalRoute;
}

- (void)setOriginalRoute:(id)a3
{
  *(void *)&self->_flags |= 0x40040000000uLL;
  objc_storeStrong((id *)&self->_originalRoute, a3);
}

- (void)_readOriginalWaypointRoute
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 332) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalWaypointRoute_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasOriginalWaypointRoute
{
  return self->_originalWaypointRoute != 0;
}

- (GEOOriginalWaypointRoute)originalWaypointRoute
{
  -[GEODirectionsRequest _readOriginalWaypointRoute]((uint64_t)self);
  originalWaypointRoute = self->_originalWaypointRoute;

  return originalWaypointRoute;
}

- (void)setOriginalWaypointRoute:(id)a3
{
  *(void *)&self->_flags |= 0x40100000000uLL;
  objc_storeStrong((id *)&self->_originalWaypointRoute, a3);
}

- (unsigned)timeSinceLastRerouteRequest
{
  return self->_timeSinceLastRerouteRequest;
}

- (void)setTimeSinceLastRerouteRequest:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x40000000200uLL;
  self->_timeSinceLastRerouteRequest = a3;
}

- (void)setHasTimeSinceLastRerouteRequest:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000000200;
  }
  self->_$1FEE565F87D5293053496F1336AD4F5E flags = ($1FEE565F87D5293053496F1336AD4F5E)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasTimeSinceLastRerouteRequest
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (void)_readClientCapabilities
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 330) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientCapabilities_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasClientCapabilities
{
  return self->_clientCapabilities != 0;
}

- (GEOClientCapabilities)clientCapabilities
{
  -[GEODirectionsRequest _readClientCapabilities]((uint64_t)self);
  clientCapabilities = self->_clientCapabilities;

  return clientCapabilities;
}

- (void)setClientCapabilities:(id)a3
{
  *(void *)&self->_flags |= 0x40000010000uLL;
  objc_storeStrong((id *)&self->_clientCapabilities, a3);
}

- (int)departureTime
{
  return self->_departureTime;
}

- (void)setDepartureTime:(int)a3
{
  *(void *)&self->_flags |= 0x40000000008uLL;
  self->_departureTime = a3;
}

- (void)setHasDepartureTime:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000000008;
  }
  self->_$1FEE565F87D5293053496F1336AD4F5E flags = ($1FEE565F87D5293053496F1336AD4F5E)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasDepartureTime
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (BOOL)getRouteForZilchPoints
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $1FEE565F87D5293053496F1336AD4F5E flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x800) != 0 && self->_getRouteForZilchPoints;
}

- (void)setGetRouteForZilchPoints:(BOOL)a3
{
  *(void *)&self->_flags |= 0x40000000800uLL;
  self->_getRouteForZilchPoints = a3;
}

- (void)setHasGetRouteForZilchPoints:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000000800;
  }
  self->_$1FEE565F87D5293053496F1336AD4F5E flags = ($1FEE565F87D5293053496F1336AD4F5E)(*(void *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasGetRouteForZilchPoints
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (GEOSessionID)sessionID
{
  p_sessionID = &self->_sessionID;
  unint64_t high = self->_sessionID._high;
  unint64_t low = p_sessionID->_low;
  result._unint64_t low = low;
  result._unint64_t high = high;
  return result;
}

- (void)setSessionID:(GEOSessionID)a3
{
  *(void *)&self->_flags |= 0x40000000001uLL;
  self->_sessionID = a3;
}

- (void)setHasSessionID:(BOOL)a3
{
  self->_$1FEE565F87D5293053496F1336AD4F5E flags = ($1FEE565F87D5293053496F1336AD4F5E)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x40000000000);
}

- (BOOL)hasSessionID
{
  return *(_DWORD *)&self->_flags & 1;
}

- (double)sessionRelativeTimestamp
{
  return self->_sessionRelativeTimestamp;
}

- (void)setSessionRelativeTimestamp:(double)a3
{
  *(void *)&self->_flags |= 0x40000000004uLL;
  self->_sessionRelativeTimestamp = a3;
}

- (void)setHasSessionRelativeTimestamp:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000000004;
  }
  self->_$1FEE565F87D5293053496F1336AD4F5E flags = ($1FEE565F87D5293053496F1336AD4F5E)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasSessionRelativeTimestamp
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readFeedback
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 330) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeedback_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasFeedback
{
  return self->_feedback != 0;
}

- (GEODirectionsRequestFeedback)feedback
{
  -[GEODirectionsRequest _readFeedback]((uint64_t)self);
  feedback = self->_feedback;

  return feedback;
}

- (void)setFeedback:(id)a3
{
  *(void *)&self->_flags |= 0x40000800000uLL;
  objc_storeStrong((id *)&self->_feedback, a3);
}

- (void)_readAdditionalEnabledMarkets
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 329) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAdditionalEnabledMarkets_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasAdditionalEnabledMarkets
{
  return self->_additionalEnabledMarkets != 0;
}

- (GEOAdditionalEnabledMarkets)additionalEnabledMarkets
{
  -[GEODirectionsRequest _readAdditionalEnabledMarkets]((uint64_t)self);
  additionalEnabledMarkets = self->_additionalEnabledMarkets;

  return additionalEnabledMarkets;
}

- (void)setAdditionalEnabledMarkets:(id)a3
{
  *(void *)&self->_flags |= 0x40000008000uLL;
  objc_storeStrong((id *)&self->_additionalEnabledMarkets, a3);
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x40000000100uLL;
  self->_sequenceNumber = a3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000000100;
  }
  self->_$1FEE565F87D5293053496F1336AD4F5E flags = ($1FEE565F87D5293053496F1336AD4F5E)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasSequenceNumber
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (void)_readSessionState
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 332) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSessionState_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasSessionState
{
  return self->_sessionState != 0;
}

- (NSData)sessionState
{
  -[GEODirectionsRequest _readSessionState]((uint64_t)self);
  sessionState = self->_sessionState;

  return sessionState;
}

- (void)setSessionState:(id)a3
{
  *(void *)&self->_flags |= 0x42000000000uLL;
  objc_storeStrong((id *)&self->_sessionState, a3);
}

- (BOOL)isFromAPI
{
  return self->_isFromAPI;
}

- (void)setIsFromAPI:(BOOL)a3
{
  *(void *)&self->_flags |= 0x40000001000uLL;
  self->_isFromAPI = a3;
}

- (void)setHasIsFromAPI:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000001000;
  }
  self->_$1FEE565F87D5293053496F1336AD4F5E flags = ($1FEE565F87D5293053496F1336AD4F5E)(*(void *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasIsFromAPI
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (void)_readCommonOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 330) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCommonOptions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasCommonOptions
{
  return self->_commonOptions != 0;
}

- (GEOCommonOptions)commonOptions
{
  -[GEODirectionsRequest _readCommonOptions]((uint64_t)self);
  commonOptions = self->_commonOptions;

  return commonOptions;
}

- (void)setCommonOptions:(id)a3
{
  *(void *)&self->_flags |= 0x40000040000uLL;
  objc_storeStrong((id *)&self->_commonOptions, a3);
}

- (void)_readLoggedAbExperiment
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 331) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLoggedAbExperiment_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasLoggedAbExperiment
{
  return self->_loggedAbExperiment != 0;
}

- (NSString)loggedAbExperiment
{
  -[GEODirectionsRequest _readLoggedAbExperiment]((uint64_t)self);
  loggedAbExperiment = self->_loggedAbExperiment;

  return loggedAbExperiment;
}

- (void)setLoggedAbExperiment:(id)a3
{
  *(void *)&self->_flags |= 0x40002000000uLL;
  objc_storeStrong((id *)&self->_loggedAbExperiment, a3);
}

- (void)_readLastKnownRoadLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 331) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLastKnownRoadLocation_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasLastKnownRoadLocation
{
  return self->_lastKnownRoadLocation != 0;
}

- (GEOLocation)lastKnownRoadLocation
{
  -[GEODirectionsRequest _readLastKnownRoadLocation]((uint64_t)self);
  lastKnownRoadLocation = self->_lastKnownRoadLocation;

  return lastKnownRoadLocation;
}

- (void)setLastKnownRoadLocation:(id)a3
{
  *(void *)&self->_flags |= 0x40001000000uLL;
  objc_storeStrong((id *)&self->_lastKnownRoadLocation, a3);
}

- (int)originalRoutePurpose
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $1FEE565F87D5293053496F1336AD4F5E flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x80) != 0) {
    return self->_originalRoutePurpose;
  }
  else {
    return 1;
  }
}

- (void)setOriginalRoutePurpose:(int)a3
{
  *(void *)&self->_flags |= 0x40000000080uLL;
  self->_originalRoutePurpose = a3;
}

- (void)setHasOriginalRoutePurpose:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000000080;
  }
  self->_$1FEE565F87D5293053496F1336AD4F5E flags = ($1FEE565F87D5293053496F1336AD4F5E)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasOriginalRoutePurpose
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (id)originalRoutePurposeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53F5778[a3];
  }

  return v3;
}

- (int)StringAsOriginalRoutePurpose:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ORIGINAL_ROUTE_PURPOSE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"REROUTING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ROUTE_FROM_ZILCH_POINTS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BIASED_DIRECTIONS_TO_POI"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BIASED_DIRECTIONS_FROM_POI"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readAbClientMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 329) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAbClientMetadata_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasAbClientMetadata
{
  return self->_abClientMetadata != 0;
}

- (GEOPDABClientDatasetMetadata)abClientMetadata
{
  -[GEODirectionsRequest _readAbClientMetadata]((uint64_t)self);
  abClientMetadata = self->_abClientMetadata;

  return abClientMetadata;
}

- (void)setAbClientMetadata:(id)a3
{
  *(void *)&self->_flags |= 0x40000004000uLL;
  objc_storeStrong((id *)&self->_abClientMetadata, a3);
}

- (void)_readDeviceHistoricalLocations
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 330) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceHistoricalLocations_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)deviceHistoricalLocations
{
  -[GEODirectionsRequest _readDeviceHistoricalLocations]((uint64_t)self);
  deviceHistoricalLocations = self->_deviceHistoricalLocations;

  return deviceHistoricalLocations;
}

- (void)setDeviceHistoricalLocations:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  deviceHistoricalLocations = self->_deviceHistoricalLocations;
  self->_deviceHistoricalLocations = v4;
}

- (void)clearDeviceHistoricalLocations
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  deviceHistoricalLocations = self->_deviceHistoricalLocations;

  [(NSMutableArray *)deviceHistoricalLocations removeAllObjects];
}

- (void)addDeviceHistoricalLocation:(id)a3
{
  id v4 = a3;
  -[GEODirectionsRequest _readDeviceHistoricalLocations]((uint64_t)self);
  -[GEODirectionsRequest _addNoFlagsDeviceHistoricalLocation:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
}

- (void)_addNoFlagsDeviceHistoricalLocation:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 96);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v5;

      id v4 = *(void **)(a1 + 96);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)deviceHistoricalLocationsCount
{
  -[GEODirectionsRequest _readDeviceHistoricalLocations]((uint64_t)self);
  deviceHistoricalLocations = self->_deviceHistoricalLocations;

  return [(NSMutableArray *)deviceHistoricalLocations count];
}

- (id)deviceHistoricalLocationAtIndex:(unint64_t)a3
{
  -[GEODirectionsRequest _readDeviceHistoricalLocations]((uint64_t)self);
  deviceHistoricalLocations = self->_deviceHistoricalLocations;

  return (id)[(NSMutableArray *)deviceHistoricalLocations objectAtIndex:a3];
}

+ (Class)deviceHistoricalLocationType
{
  return (Class)objc_opt_class();
}

- (int)nonRecommendedRoutesOption
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $1FEE565F87D5293053496F1336AD4F5E flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x40) != 0) {
    return self->_nonRecommendedRoutesOption;
  }
  else {
    return 0;
  }
}

- (void)setNonRecommendedRoutesOption:(int)a3
{
  *(void *)&self->_flags |= 0x40000000040uLL;
  self->_nonRecommendedRoutesOption = a3;
}

- (void)setHasNonRecommendedRoutesOption:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000000040;
  }
  self->_$1FEE565F87D5293053496F1336AD4F5E flags = ($1FEE565F87D5293053496F1336AD4F5E)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasNonRecommendedRoutesOption
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (id)nonRecommendedRoutesOptionAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53F57A0[a3];
  }

  return v3;
}

- (int)StringAsNonRecommendedRoutesOption:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NON_RECOMMENDED_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NON_RECOMMENDED_NONE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NON_RECOMMENDED_PREPARING_TO_LEAVE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NON_RECOMMENDED_WHILE_TRAVELING"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readNonRecommendedRoutesCache
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 331) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNonRecommendedRoutesCache_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasNonRecommendedRoutesCache
{
  return self->_nonRecommendedRoutesCache != 0;
}

- (NSData)nonRecommendedRoutesCache
{
  -[GEODirectionsRequest _readNonRecommendedRoutesCache]((uint64_t)self);
  nonRecommendedRoutesCache = self->_nonRecommendedRoutesCache;

  return nonRecommendedRoutesCache;
}

- (void)setNonRecommendedRoutesCache:(id)a3
{
  *(void *)&self->_flags |= 0x40004000000uLL;
  objc_storeStrong((id *)&self->_nonRecommendedRoutesCache, a3);
}

- (unsigned)lastEtaDisplayed
{
  return self->_lastEtaDisplayed;
}

- (void)setLastEtaDisplayed:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x40000000010uLL;
  self->_lastEtaDisplayed = a3;
}

- (void)setHasLastEtaDisplayed:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000000010;
  }
  self->_$1FEE565F87D5293053496F1336AD4F5E flags = ($1FEE565F87D5293053496F1336AD4F5E)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasLastEtaDisplayed
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (void)_readRecentLocationHistory
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 332) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRecentLocationHistory_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasRecentLocationHistory
{
  return self->_recentLocationHistory != 0;
}

- (GEORecentLocationHistory)recentLocationHistory
{
  -[GEODirectionsRequest _readRecentLocationHistory]((uint64_t)self);
  recentLocationHistory = self->_recentLocationHistory;

  return recentLocationHistory;
}

- (void)setRecentLocationHistory:(id)a3
{
  *(void *)&self->_flags |= 0x40400000000uLL;
  objc_storeStrong((id *)&self->_recentLocationHistory, a3);
}

- (void)_readPrivacyMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 332) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPrivacyMetadata_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasPrivacyMetadata
{
  return self->_privacyMetadata != 0;
}

- (GEOPrivacyMetadata)privacyMetadata
{
  -[GEODirectionsRequest _readPrivacyMetadata]((uint64_t)self);
  privacyMetadata = self->_privacyMetadata;

  return privacyMetadata;
}

- (void)setPrivacyMetadata:(id)a3
{
  *(void *)&self->_flags |= 0x40200000000uLL;
  objc_storeStrong((id *)&self->_privacyMetadata, a3);
}

- (void)_readTripInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 333) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTripInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasTripInfo
{
  return self->_tripInfo != 0;
}

- (GEOTripInfo)tripInfo
{
  -[GEODirectionsRequest _readTripInfo]((uint64_t)self);
  tripInfo = self->_tripInfo;

  return tripInfo;
}

- (void)setTripInfo:(id)a3
{
  *(void *)&self->_flags |= 0x50000000000uLL;
  objc_storeStrong((id *)&self->_tripInfo, a3);
}

- (void)_readServiceTags
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 332) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readServiceTags_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)serviceTags
{
  -[GEODirectionsRequest _readServiceTags]((uint64_t)self);
  serviceTags = self->_serviceTags;

  return serviceTags;
}

- (void)setServiceTags:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  serviceTags = self->_serviceTags;
  self->_serviceTags = v4;
}

- (void)clearServiceTags
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  serviceTags = self->_serviceTags;

  [(NSMutableArray *)serviceTags removeAllObjects];
}

- (void)addServiceTag:(id)a3
{
  id v4 = a3;
  -[GEODirectionsRequest _readServiceTags]((uint64_t)self);
  -[GEODirectionsRequest _addNoFlagsServiceTag:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
}

- (void)_addNoFlagsServiceTag:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 224);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 224);
      *(void *)(a1 + 224) = v5;

      id v4 = *(void **)(a1 + 224);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)serviceTagsCount
{
  -[GEODirectionsRequest _readServiceTags]((uint64_t)self);
  serviceTags = self->_serviceTags;

  return [(NSMutableArray *)serviceTags count];
}

- (id)serviceTagAtIndex:(unint64_t)a3
{
  -[GEODirectionsRequest _readServiceTags]((uint64_t)self);
  serviceTags = self->_serviceTags;

  return (id)[(NSMutableArray *)serviceTags objectAtIndex:a3];
}

+ (Class)serviceTagType
{
  return (Class)objc_opt_class();
}

- (void)_readTrafficApiResponses
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 332) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrafficApiResponses_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)trafficApiResponses
{
  -[GEODirectionsRequest _readTrafficApiResponses]((uint64_t)self);
  trafficApiResponses = self->_trafficApiResponses;

  return trafficApiResponses;
}

- (void)setTrafficApiResponses:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  trafficApiResponses = self->_trafficApiResponses;
  self->_trafficApiResponses = v4;
}

- (void)clearTrafficApiResponses
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  trafficApiResponses = self->_trafficApiResponses;

  [(NSMutableArray *)trafficApiResponses removeAllObjects];
}

- (void)addTrafficApiResponses:(id)a3
{
  id v4 = a3;
  -[GEODirectionsRequest _readTrafficApiResponses]((uint64_t)self);
  -[GEODirectionsRequest _addNoFlagsTrafficApiResponses:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
}

- (void)_addNoFlagsTrafficApiResponses:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 248);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 248);
      *(void *)(a1 + 248) = v5;

      id v4 = *(void **)(a1 + 248);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)trafficApiResponsesCount
{
  -[GEODirectionsRequest _readTrafficApiResponses]((uint64_t)self);
  trafficApiResponses = self->_trafficApiResponses;

  return [(NSMutableArray *)trafficApiResponses count];
}

- (id)trafficApiResponsesAtIndex:(unint64_t)a3
{
  -[GEODirectionsRequest _readTrafficApiResponses]((uint64_t)self);
  trafficApiResponses = self->_trafficApiResponses;

  return (id)[(NSMutableArray *)trafficApiResponses objectAtIndex:a3];
}

+ (Class)trafficApiResponsesType
{
  return (Class)objc_opt_class();
}

- (void)_readTrafficSnapshotIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 332) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrafficSnapshotIds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)trafficSnapshotIds
{
  -[GEODirectionsRequest _readTrafficSnapshotIds]((uint64_t)self);
  trafficSnapshotIds = self->_trafficSnapshotIds;

  return trafficSnapshotIds;
}

- (void)setTrafficSnapshotIds:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  trafficSnapshotIds = self->_trafficSnapshotIds;
  self->_trafficSnapshotIds = v4;
}

- (void)clearTrafficSnapshotIds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  trafficSnapshotIds = self->_trafficSnapshotIds;

  [(NSMutableArray *)trafficSnapshotIds removeAllObjects];
}

- (void)addTrafficSnapshotIds:(id)a3
{
  id v4 = a3;
  -[GEODirectionsRequest _readTrafficSnapshotIds]((uint64_t)self);
  -[GEODirectionsRequest _addNoFlagsTrafficSnapshotIds:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
}

- (void)_addNoFlagsTrafficSnapshotIds:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 256);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 256);
      *(void *)(a1 + 256) = v5;

      id v4 = *(void **)(a1 + 256);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)trafficSnapshotIdsCount
{
  -[GEODirectionsRequest _readTrafficSnapshotIds]((uint64_t)self);
  trafficSnapshotIds = self->_trafficSnapshotIds;

  return [(NSMutableArray *)trafficSnapshotIds count];
}

- (id)trafficSnapshotIdsAtIndex:(unint64_t)a3
{
  -[GEODirectionsRequest _readTrafficSnapshotIds]((uint64_t)self);
  trafficSnapshotIds = self->_trafficSnapshotIds;

  return (id)[(NSMutableArray *)trafficSnapshotIds objectAtIndex:a3];
}

+ (Class)trafficSnapshotIdsType
{
  return (Class)objc_opt_class();
}

- (unsigned)trafficSnapshotUnixTime
{
  return self->_trafficSnapshotUnixTime;
}

- (void)setTrafficSnapshotUnixTime:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x40000000400uLL;
  self->_trafficSnapshotUnixTime = a3;
}

- (void)setHasTrafficSnapshotUnixTime:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000000400;
  }
  self->_$1FEE565F87D5293053496F1336AD4F5E flags = ($1FEE565F87D5293053496F1336AD4F5E)(*(void *)&self->_flags & 0xFFFFFBFFFFFFFBFFLL | v3);
}

- (BOOL)hasTrafficSnapshotUnixTime
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEODirectionsRequest;
  id v4 = [(GEODirectionsRequest *)&v8 description];
  id v5 = [(GEODirectionsRequest *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEODirectionsRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v197 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v163 = 0;
    goto LABEL_234;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [(id)a1 routeAttributes];
  objc_super v6 = v5;
  if (v5)
  {
    if (a2) {
      [v5 jsonRepresentation];
    }
    else {
    id v7 = [v5 dictionaryRepresentation];
    }

    [v4 setObject:v7 forKey:@"routeAttributes"];
  }

  if ([*(id *)(a1 + 272) count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 272), "count"));
    long long v187 = 0u;
    long long v188 = 0u;
    long long v189 = 0u;
    long long v190 = 0u;
    id v9 = *(id *)(a1 + 272);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v187 objects:v196 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v188;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v188 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v187 + 1) + 8 * i);
          if (a2) {
            [v14 jsonRepresentation];
          }
          else {
          id v15 = [v14 dictionaryRepresentation];
          }

          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v187 objects:v196 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"waypointTyped"];
  }
  if (*(void *)(a1 + 104))
  {
    v16 = [(id)a1 displayedBannerIds];
    if (a2) {
      id v17 = @"displayedBannerId";
    }
    else {
      id v17 = @"displayed_banner_id";
    }
    [v4 setObject:v16 forKey:v17];
  }
  v18 = [(id)a1 clientFeedbackInfo];
  uint64_t v19 = v18;
  if (v18)
  {
    if (a2)
    {
      int v20 = [v18 jsonRepresentation];
      v21 = @"clientFeedbackInfo";
    }
    else
    {
      int v20 = [v18 dictionaryRepresentation];
      v21 = @"client_feedback_info";
    }
    id v22 = v20;

    [v4 setObject:v22 forKey:v21];
  }

  v23 = &OBJC_IVAR___GEOLocalizedBytes__unknownFields;
  if ((*(unsigned char *)(a1 + 328) & 0x20) != 0)
  {
    v24 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 300)];
    [v4 setObject:v24 forKey:@"mainTransportTypeMaxRouteCount"];
  }
  v25 = [(id)a1 currentUserLocation];
  v26 = v25;
  if (v25)
  {
    if (a2) {
      [v25 jsonRepresentation];
    }
    else {
    id v27 = [v25 dictionaryRepresentation];
    }

    [v4 setObject:v27 forKey:@"currentUserLocation"];
  }

  v28 = [(id)a1 currentMapRegion];
  uint64_t v29 = v28;
  if (v28)
  {
    if (a2) {
      [v28 jsonRepresentation];
    }
    else {
    id v30 = [v28 dictionaryRepresentation];
    }

    [v4 setObject:v30 forKey:@"currentMapRegion"];
  }

  uint64_t v31 = [(id)a1 originalRouteID];
  if (!v31)
  {
    if (!*(void *)(a1 + 160)) {
      goto LABEL_58;
    }
    if (a2) {
      goto LABEL_47;
    }
LABEL_56:
    v36 = [(id)a1 originalRouteZilchPoints];
LABEL_57:
    [v4 setObject:v36 forKey:@"originalRouteZilchPoints"];

    goto LABEL_58;
  }
  v32 = v31;
  if ((a2 & 1) == 0)
  {
    [v4 setObject:v31 forKey:@"originalRouteID"];

    if (!*(void *)(a1 + 160)) {
      goto LABEL_58;
    }
    goto LABEL_56;
  }
  v33 = [v31 base64EncodedStringWithOptions:0];
  [v4 setObject:v33 forKey:@"originalRouteID"];

  if (*(void *)(a1 + 160))
  {
LABEL_47:
    v34 = (void *)MEMORY[0x1E4F1CA48];
    v35 = [(id)a1 originalRouteZilchPoints];
    v36 = objc_msgSend(v34, "arrayWithCapacity:", objc_msgSend(v35, "count"));

    long long v185 = 0u;
    long long v186 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    v37 = [(id)a1 originalRouteZilchPoints];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v183 objects:v195 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v184;
      do
      {
        for (uint64_t j = 0; j != v39; ++j)
        {
          if (*(void *)v184 != v40) {
            objc_enumerationMutation(v37);
          }
          v42 = [*(id *)(*((void *)&v183 + 1) + 8 * j) base64EncodedStringWithOptions:0];
          [v36 addObject:v42];
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v183 objects:v195 count:16];
      }
      while (v39);
    }

    v23 = &OBJC_IVAR___GEOLocalizedBytes__unknownFields;
    goto LABEL_57;
  }
LABEL_58:
  v43 = [(id)a1 originalDirectionsResponseID];
  v44 = v43;
  if (v43)
  {
    if (a2)
    {
      v45 = [v43 base64EncodedStringWithOptions:0];
      [v4 setObject:v45 forKey:@"originalDirectionsResponseID"];
    }
    else
    {
      [v4 setObject:v43 forKey:@"originalDirectionsResponseID"];
    }
  }

  if ([*(id *)(a1 + 176) count])
  {
    v46 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 176), "count"));
    long long v179 = 0u;
    long long v180 = 0u;
    long long v181 = 0u;
    long long v182 = 0u;
    id v47 = *(id *)(a1 + 176);
    uint64_t v48 = [v47 countByEnumeratingWithState:&v179 objects:v194 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v180;
      do
      {
        for (uint64_t k = 0; k != v49; ++k)
        {
          if (*(void *)v180 != v50) {
            objc_enumerationMutation(v47);
          }
          v52 = *(void **)(*((void *)&v179 + 1) + 8 * k);
          if (a2) {
            [v52 jsonRepresentation];
          }
          else {
          id v53 = [v52 dictionaryRepresentation];
          }

          [v46 addObject:v53];
        }
        uint64_t v49 = [v47 countByEnumeratingWithState:&v179 objects:v194 count:16];
      }
      while (v49);
    }

    if (a2) {
      v54 = @"originalRouteEvInfo";
    }
    else {
      v54 = @"original_route_ev_info";
    }
    [v4 setObject:v46 forKey:v54];

    v23 = &OBJC_IVAR___GEOLocalizedBytes__unknownFields;
  }
  v55 = [(id)a1 originalRoute];
  v56 = v55;
  if (v55)
  {
    if (a2) {
      [v55 jsonRepresentation];
    }
    else {
    id v57 = [v55 dictionaryRepresentation];
    }

    [v4 setObject:v57 forKey:@"originalRoute"];
  }

  v58 = [(id)a1 originalWaypointRoute];
  v59 = v58;
  if (v58)
  {
    if (a2)
    {
      v60 = [v58 jsonRepresentation];
      v61 = @"originalWaypointRoute";
    }
    else
    {
      v60 = [v58 dictionaryRepresentation];
      v61 = @"original_waypoint_route";
    }
    id v62 = v60;

    [v4 setObject:v62 forKey:v61];
  }

  if ((*(unsigned char *)(a1 + v23[747] + 1) & 2) != 0)
  {
    v63 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 316)];
    [v4 setObject:v63 forKey:@"timeSinceLastRerouteRequest"];
  }
  v64 = [(id)a1 clientCapabilities];
  v65 = v64;
  if (v64)
  {
    if (a2) {
      [v64 jsonRepresentation];
    }
    else {
    id v66 = [v64 dictionaryRepresentation];
    }

    [v4 setObject:v66 forKey:@"clientCapabilities"];
  }

  uint64_t v67 = *(void *)(a1 + v23[747]);
  if ((v67 & 8) != 0)
  {
    v72 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 292)];
    [v4 setObject:v72 forKey:@"departureTime"];

    uint64_t v67 = *(void *)(a1 + 328);
    if ((v67 & 0x800) == 0)
    {
LABEL_96:
      if ((v67 & 1) == 0) {
        goto LABEL_97;
      }
LABEL_107:
      _GEOSessionIDDictionaryRepresentation((void *)(a1 + 24));
      id v74 = (id)objc_claimAutoreleasedReturnValue();

      [v4 setObject:v74 forKey:@"sessionID"];
      if ((*(void *)(a1 + 328) & 4) != 0) {
        goto LABEL_98;
      }
      goto LABEL_102;
    }
  }
  else if ((v67 & 0x800) == 0)
  {
    goto LABEL_96;
  }
  v73 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 324)];
  [v4 setObject:v73 forKey:@"getRouteForZilchPoints"];

  uint64_t v67 = *(void *)(a1 + 328);
  if (v67) {
    goto LABEL_107;
  }
LABEL_97:
  if ((v67 & 4) != 0)
  {
LABEL_98:
    v68 = [NSNumber numberWithDouble:*(double *)(a1 + 232)];
    if (a2) {
      v69 = @"sessionRelativeTimestamp";
    }
    else {
      v69 = @"session_relative_timestamp";
    }
    [v4 setObject:v68 forKey:v69];
  }
LABEL_102:
  v70 = [(id)a1 feedback];
  v71 = v70;
  if (v70)
  {
    if (a2) {
      [v70 jsonRepresentation];
    }
    else {
    id v75 = [v70 dictionaryRepresentation];
    }

    [v4 setObject:v75 forKey:@"feedback"];
  }

  v76 = [(id)a1 additionalEnabledMarkets];
  v77 = v76;
  if (v76)
  {
    if (a2) {
      [v76 jsonRepresentation];
    }
    else {
    id v78 = [v76 dictionaryRepresentation];
    }

    [v4 setObject:v78 forKey:@"additionalEnabledMarkets"];
  }

  if (*(unsigned char *)(a1 + v23[747] + 1))
  {
    v79 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 312)];
    [v4 setObject:v79 forKey:@"sequenceNumber"];
  }
  v80 = [(id)a1 sessionState];
  v81 = v80;
  if (v80)
  {
    if (a2)
    {
      v82 = [v80 base64EncodedStringWithOptions:0];
      [v4 setObject:v82 forKey:@"sessionState"];
    }
    else
    {
      [v4 setObject:v80 forKey:@"session_state"];
    }
  }

  if ((*(unsigned char *)(a1 + v23[747] + 1) & 0x10) != 0)
  {
    v83 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 325)];
    [v4 setObject:v83 forKey:@"isFromAPI"];
  }
  v84 = [(id)a1 commonOptions];
  v85 = v84;
  if (v84)
  {
    if (a2)
    {
      v86 = [v84 jsonRepresentation];
      v87 = @"commonOptions";
    }
    else
    {
      v86 = [v84 dictionaryRepresentation];
      v87 = @"common_options";
    }
    id v88 = v86;

    [v4 setObject:v88 forKey:v87];
  }

  v89 = [(id)a1 loggedAbExperiment];
  if (v89)
  {
    if (a2) {
      v90 = @"loggedAbExperiment";
    }
    else {
      v90 = @"logged_ab_experiment";
    }
    [v4 setObject:v89 forKey:v90];
  }

  v91 = [(id)a1 lastKnownRoadLocation];
  v92 = v91;
  if (v91)
  {
    if (a2)
    {
      v93 = [v91 jsonRepresentation];
      v94 = @"lastKnownRoadLocation";
    }
    else
    {
      v93 = [v91 dictionaryRepresentation];
      v94 = @"last_known_road_location";
    }
    id v95 = v93;

    [v4 setObject:v95 forKey:v94];
  }

  if ((*(unsigned char *)(a1 + v23[747]) & 0x80) != 0)
  {
    uint64_t v96 = *(int *)(a1 + 308);
    if (v96 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 308));
      v97 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v97 = off_1E53F5778[v96];
    }
    [v4 setObject:v97 forKey:@"originalRoutePurpose"];
  }
  v98 = [(id)a1 abClientMetadata];
  v99 = v98;
  if (v98)
  {
    if (a2)
    {
      v100 = [v98 jsonRepresentation];
      v101 = @"abClientMetadata";
    }
    else
    {
      v100 = [v98 dictionaryRepresentation];
      v101 = @"ab_client_metadata";
    }
    id v102 = v100;

    [v4 setObject:v102 forKey:v101];
  }

  if ([*(id *)(a1 + 96) count])
  {
    v103 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    long long v175 = 0u;
    long long v176 = 0u;
    long long v177 = 0u;
    long long v178 = 0u;
    id v104 = *(id *)(a1 + 96);
    uint64_t v105 = [v104 countByEnumeratingWithState:&v175 objects:v193 count:16];
    if (v105)
    {
      uint64_t v106 = v105;
      uint64_t v107 = *(void *)v176;
      do
      {
        for (uint64_t m = 0; m != v106; ++m)
        {
          if (*(void *)v176 != v107) {
            objc_enumerationMutation(v104);
          }
          v109 = *(void **)(*((void *)&v175 + 1) + 8 * m);
          if (a2) {
            [v109 jsonRepresentation];
          }
          else {
          id v110 = [v109 dictionaryRepresentation];
          }

          [v103 addObject:v110];
        }
        uint64_t v106 = [v104 countByEnumeratingWithState:&v175 objects:v193 count:16];
      }
      while (v106);
    }

    if (a2) {
      v111 = @"deviceHistoricalLocation";
    }
    else {
      v111 = @"device_historical_location";
    }
    [v4 setObject:v103 forKey:v111];

    v23 = &OBJC_IVAR___GEOLocalizedBytes__unknownFields;
  }
  if ((*(unsigned char *)(a1 + v23[747]) & 0x40) != 0)
  {
    uint64_t v112 = *(int *)(a1 + 304);
    if (v112 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 304));
      v113 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v113 = off_1E53F57A0[v112];
    }
    if (a2) {
      v114 = @"nonRecommendedRoutesOption";
    }
    else {
      v114 = @"non_recommended_routes_option";
    }
    [v4 setObject:v113 forKey:v114];
  }
  v115 = [(id)a1 nonRecommendedRoutesCache];
  v116 = v115;
  if (v115)
  {
    if (a2)
    {
      v117 = [v115 base64EncodedStringWithOptions:0];
      [v4 setObject:v117 forKey:@"nonRecommendedRoutesCache"];
    }
    else
    {
      [v4 setObject:v115 forKey:@"non_recommended_routes_cache"];
    }
  }

  if ((*(unsigned char *)(a1 + v23[747]) & 0x10) != 0)
  {
    v118 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 296)];
    if (a2) {
      v119 = @"lastEtaDisplayed";
    }
    else {
      v119 = @"last_eta_displayed";
    }
    [v4 setObject:v118 forKey:v119];
  }
  v120 = [(id)a1 recentLocationHistory];
  v121 = v120;
  if (v120)
  {
    if (a2)
    {
      v122 = [v120 jsonRepresentation];
      v123 = @"recentLocationHistory";
    }
    else
    {
      v122 = [v120 dictionaryRepresentation];
      v123 = @"recent_location_history";
    }
    id v124 = v122;

    [v4 setObject:v124 forKey:v123];
  }

  v125 = [(id)a1 privacyMetadata];
  v126 = v125;
  if (v125)
  {
    if (a2)
    {
      v127 = [v125 jsonRepresentation];
      v128 = @"privacyMetadata";
    }
    else
    {
      v127 = [v125 dictionaryRepresentation];
      v128 = @"privacy_metadata";
    }
    id v129 = v127;

    [v4 setObject:v129 forKey:v128];
  }

  v130 = [(id)a1 tripInfo];
  v131 = v130;
  if (v130)
  {
    if (a2)
    {
      v132 = [v130 jsonRepresentation];
      v133 = @"tripInfo";
    }
    else
    {
      v132 = [v130 dictionaryRepresentation];
      v133 = @"trip_info";
    }
    id v134 = v132;

    [v4 setObject:v134 forKey:v133];
  }

  if ([*(id *)(a1 + 224) count])
  {
    v135 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 224), "count"));
    long long v171 = 0u;
    long long v172 = 0u;
    long long v173 = 0u;
    long long v174 = 0u;
    id v136 = *(id *)(a1 + 224);
    uint64_t v137 = [v136 countByEnumeratingWithState:&v171 objects:v192 count:16];
    if (v137)
    {
      uint64_t v138 = v137;
      uint64_t v139 = *(void *)v172;
      do
      {
        for (uint64_t n = 0; n != v138; ++n)
        {
          if (*(void *)v172 != v139) {
            objc_enumerationMutation(v136);
          }
          v141 = *(void **)(*((void *)&v171 + 1) + 8 * n);
          if (a2) {
            [v141 jsonRepresentation];
          }
          else {
          id v142 = [v141 dictionaryRepresentation];
          }

          [v135 addObject:v142];
        }
        uint64_t v138 = [v136 countByEnumeratingWithState:&v171 objects:v192 count:16];
      }
      while (v138);
    }

    [v4 setObject:v135 forKey:@"serviceTag"];
    v23 = &OBJC_IVAR___GEOLocalizedBytes__unknownFields;
  }
  if (*(void *)(a1 + 248))
  {
    if (a2)
    {
      v143 = (void *)MEMORY[0x1E4F1CA48];
      v144 = [(id)a1 trafficApiResponses];
      v145 = objc_msgSend(v143, "arrayWithCapacity:", objc_msgSend(v144, "count"));

      long long v169 = 0u;
      long long v170 = 0u;
      long long v167 = 0u;
      long long v168 = 0u;
      v146 = [(id)a1 trafficApiResponses];
      uint64_t v147 = [v146 countByEnumeratingWithState:&v167 objects:v191 count:16];
      if (v147)
      {
        uint64_t v148 = v147;
        uint64_t v149 = *(void *)v168;
        do
        {
          for (iuint64_t i = 0; ii != v148; ++ii)
          {
            if (*(void *)v168 != v149) {
              objc_enumerationMutation(v146);
            }
            v151 = [*(id *)(*((void *)&v167 + 1) + 8 * ii) base64EncodedStringWithOptions:0];
            [v145 addObject:v151];
          }
          uint64_t v148 = [v146 countByEnumeratingWithState:&v167 objects:v191 count:16];
        }
        while (v148);
      }

      v23 = &OBJC_IVAR___GEOLocalizedBytes__unknownFields;
    }
    else
    {
      v145 = [(id)a1 trafficApiResponses];
    }
    [v4 setObject:v145 forKey:@"trafficApiResponses"];
  }
  if (*(void *)(a1 + 256))
  {
    v152 = [(id)a1 trafficSnapshotIds];
    [v4 setObject:v152 forKey:@"trafficSnapshotIds"];
  }
  uint64_t v153 = *(void *)(a1 + v23[747]);
  if ((v153 & 0x400) != 0)
  {
    v154 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 320)];
    if (a2) {
      v155 = @"trafficSnapshotUnixTime";
    }
    else {
      v155 = @"traffic_snapshot_unix_time";
    }
    [v4 setObject:v154 forKey:v155];

    uint64_t v153 = *(void *)(a1 + 328);
  }
  if ((v153 & 2) != 0)
  {
    v156 = [NSNumber numberWithDouble:*(double *)(a1 + 208)];
    [v4 setObject:v156 forKey:@"requestTime"];
  }
  v157 = *(void **)(a1 + 16);
  if (v157)
  {
    v158 = [v157 dictionaryRepresentation];
    v159 = v158;
    if (a2)
    {
      v160 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v158, "count"));
      v165[0] = MEMORY[0x1E4F143A8];
      v165[1] = 3221225472;
      v165[2] = __50__GEODirectionsRequest__dictionaryRepresentation___block_invoke;
      v165[3] = &unk_1E53D8860;
      id v161 = v160;
      id v166 = v161;
      [v159 enumerateKeysAndObjectsUsingBlock:v165];
      id v162 = v161;

      v159 = v162;
    }
    [v4 setObject:v159 forKey:@"Unknown Fields"];
  }
  id v163 = v4;

LABEL_234:

  return v163;
}

- (id)jsonRepresentation
{
  return -[GEODirectionsRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEODirectionsRequest__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEODirectionsRequest)initWithDictionary:(id)a3
{
  return (GEODirectionsRequest *)-[GEODirectionsRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v231 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_295;
  }
  a1 = (id)[a1 init];

  if (!a1) {
    goto LABEL_295;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"routeAttributes"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [GEORouteAttributes alloc];
    if (a3) {
      uint64_t v8 = [(GEORouteAttributes *)v7 initWithJSON:v6];
    }
    else {
      uint64_t v8 = [(GEORouteAttributes *)v7 initWithDictionary:v6];
    }
    id v9 = (void *)v8;
    [a1 setRouteAttributes:v8];
  }
  id v10 = [v5 objectForKeyedSubscript:@"waypointTyped"];
  objc_opt_class();
  id v188 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v221 = 0u;
    long long v222 = 0u;
    long long v219 = 0u;
    long long v220 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v219 objects:v230 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v220;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v220 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v219 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v17 = [GEOWaypointTyped alloc];
            if (a3) {
              uint64_t v18 = [(GEOWaypointTyped *)v17 initWithJSON:v16];
            }
            else {
              uint64_t v18 = [(GEOWaypointTyped *)v17 initWithDictionary:v16];
            }
            uint64_t v19 = (void *)v18;
            [a1 addWaypointTyped:v18];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v219 objects:v230 count:16];
      }
      while (v13);
    }

    id v5 = v188;
  }

  if (a3) {
    int v20 = @"displayedBannerId";
  }
  else {
    int v20 = @"displayed_banner_id";
  }
  v21 = [v5 objectForKeyedSubscript:v20];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v217 = 0u;
    long long v218 = 0u;
    long long v215 = 0u;
    long long v216 = 0u;
    id v22 = v21;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v215 objects:v229 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v216;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v216 != v25) {
            objc_enumerationMutation(v22);
          }
          id v27 = *(void **)(*((void *)&v215 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v28 = (void *)[v27 copy];
            [a1 addDisplayedBannerId:v28];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v215 objects:v229 count:16];
      }
      while (v24);
    }

    id v5 = v188;
  }

  if (a3) {
    uint64_t v29 = @"clientFeedbackInfo";
  }
  else {
    uint64_t v29 = @"client_feedback_info";
  }
  id v30 = [v5 objectForKeyedSubscript:v29];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v31 = [GEOClientFeedbackInfo alloc];
    if (a3) {
      uint64_t v32 = [(GEOClientFeedbackInfo *)v31 initWithJSON:v30];
    }
    else {
      uint64_t v32 = [(GEOClientFeedbackInfo *)v31 initWithDictionary:v30];
    }
    v33 = (void *)v32;
    [a1 setClientFeedbackInfo:v32];
  }
  v34 = [v5 objectForKeyedSubscript:@"mainTransportTypeMaxRouteCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setMainTransportTypeMaxRouteCount:", objc_msgSend(v34, "unsignedIntValue"));
  }

  v35 = [v5 objectForKeyedSubscript:@"currentUserLocation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v36 = [GEOLocation alloc];
    if (a3) {
      uint64_t v37 = [(GEOLocation *)v36 initWithJSON:v35];
    }
    else {
      uint64_t v37 = [(GEOLocation *)v36 initWithDictionary:v35];
    }
    uint64_t v38 = (void *)v37;
    [a1 setCurrentUserLocation:v37];
  }
  uint64_t v39 = [v5 objectForKeyedSubscript:@"currentMapRegion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v40 = [GEOMapRegion alloc];
    if (a3) {
      uint64_t v41 = [(GEOMapRegion *)v40 initWithJSON:v39];
    }
    else {
      uint64_t v41 = [(GEOMapRegion *)v40 initWithDictionary:v39];
    }
    v42 = (void *)v41;
    [a1 setCurrentMapRegion:v41];
  }
  v43 = [v5 objectForKeyedSubscript:@"originalRouteID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v44 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v43 options:0];
    [a1 setOriginalRouteID:v44];
  }
  v45 = [v5 objectForKeyedSubscript:@"originalRouteZilchPoints"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v213 = 0u;
    long long v214 = 0u;
    long long v211 = 0u;
    long long v212 = 0u;
    long long v184 = v45;
    id v46 = v45;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v211 objects:v228 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v212;
      do
      {
        for (uint64_t k = 0; k != v48; ++k)
        {
          if (*(void *)v212 != v49) {
            objc_enumerationMutation(v46);
          }
          uint64_t v51 = *(void *)(*((void *)&v211 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v52 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v51 options:0];
            [a1 addOriginalRouteZilchPoints:v52];
          }
        }
        uint64_t v48 = [v46 countByEnumeratingWithState:&v211 objects:v228 count:16];
      }
      while (v48);
    }

    v45 = v184;
    id v5 = v188;
  }

  id v53 = [v5 objectForKeyedSubscript:@"originalDirectionsResponseID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v54 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v53 options:0];
    [a1 setOriginalDirectionsResponseID:v54];
  }
  if (a3) {
    v55 = @"originalRouteEvInfo";
  }
  else {
    v55 = @"original_route_ev_info";
  }
  v56 = objc_msgSend(v5, "objectForKeyedSubscript:", v55, v184);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v209 = 0u;
    long long v210 = 0u;
    long long v207 = 0u;
    long long v208 = 0u;
    long long v185 = v56;
    id v57 = v56;
    uint64_t v58 = [v57 countByEnumeratingWithState:&v207 objects:v227 count:16];
    if (v58)
    {
      uint64_t v59 = v58;
      uint64_t v60 = *(void *)v208;
      do
      {
        for (uint64_t m = 0; m != v59; ++m)
        {
          if (*(void *)v208 != v60) {
            objc_enumerationMutation(v57);
          }
          uint64_t v62 = *(void *)(*((void *)&v207 + 1) + 8 * m);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v63 = [GEOStopStepEVInfo alloc];
            if (a3) {
              uint64_t v64 = [(GEOStopStepEVInfo *)v63 initWithJSON:v62];
            }
            else {
              uint64_t v64 = [(GEOStopStepEVInfo *)v63 initWithDictionary:v62];
            }
            v65 = (void *)v64;
            objc_msgSend(a1, "addOriginalRouteEvInfo:", v64, v185);
          }
        }
        uint64_t v59 = [v57 countByEnumeratingWithState:&v207 objects:v227 count:16];
      }
      while (v59);
    }

    v56 = v185;
    id v5 = v188;
  }

  id v66 = [v5 objectForKeyedSubscript:@"originalRoute"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v67 = [GEOOriginalRoute alloc];
    if (a3) {
      uint64_t v68 = [(GEOOriginalRoute *)v67 initWithJSON:v66];
    }
    else {
      uint64_t v68 = [(GEOOriginalRoute *)v67 initWithDictionary:v66];
    }
    v69 = (void *)v68;
    objc_msgSend(a1, "setOriginalRoute:", v68, v185);
  }
  if (a3) {
    v70 = @"originalWaypointRoute";
  }
  else {
    v70 = @"original_waypoint_route";
  }
  v71 = objc_msgSend(v5, "objectForKeyedSubscript:", v70, v185);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v72 = [GEOOriginalWaypointRoute alloc];
    if (a3) {
      uint64_t v73 = [(GEOOriginalWaypointRoute *)v72 initWithJSON:v71];
    }
    else {
      uint64_t v73 = [(GEOOriginalWaypointRoute *)v72 initWithDictionary:v71];
    }
    id v74 = (void *)v73;
    [a1 setOriginalWaypointRoute:v73];
  }
  id v75 = [v5 objectForKeyedSubscript:@"timeSinceLastRerouteRequest"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTimeSinceLastRerouteRequest:", objc_msgSend(v75, "unsignedIntValue"));
  }

  v76 = [v5 objectForKeyedSubscript:@"clientCapabilities"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v77 = [GEOClientCapabilities alloc];
    if (a3) {
      uint64_t v78 = [(GEOClientCapabilities *)v77 initWithJSON:v76];
    }
    else {
      uint64_t v78 = [(GEOClientCapabilities *)v77 initWithDictionary:v76];
    }
    v79 = (void *)v78;
    [a1 setClientCapabilities:v78];
  }
  v80 = [v5 objectForKeyedSubscript:@"departureTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDepartureTime:", objc_msgSend(v80, "intValue"));
  }

  v81 = [v5 objectForKeyedSubscript:@"getRouteForZilchPoints"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setGetRouteForZilchPoints:", objc_msgSend(v81, "BOOLValue"));
  }

  v82 = [v5 objectForKeyedSubscript:@"sessionID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v205 = 0;
    uint64_t v206 = 0;
    _GEOSessionIDFromDictionaryRepresentation(v82, &v205);
    objc_msgSend(a1, "setSessionID:", v205, v206);
  }

  if (a3) {
    v83 = @"sessionRelativeTimestamp";
  }
  else {
    v83 = @"session_relative_timestamp";
  }
  v84 = [v5 objectForKeyedSubscript:v83];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v84 doubleValue];
    objc_msgSend(a1, "setSessionRelativeTimestamp:");
  }

  v85 = [v5 objectForKeyedSubscript:@"feedback"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v86 = [GEODirectionsRequestFeedback alloc];
    if (a3) {
      uint64_t v87 = [(GEODirectionsRequestFeedback *)v86 initWithJSON:v85];
    }
    else {
      uint64_t v87 = [(GEODirectionsRequestFeedback *)v86 initWithDictionary:v85];
    }
    id v88 = (void *)v87;
    [a1 setFeedback:v87];
  }
  v89 = [v5 objectForKeyedSubscript:@"additionalEnabledMarkets"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v90 = [GEOAdditionalEnabledMarkets alloc];
    if (a3) {
      uint64_t v91 = [(GEOAdditionalEnabledMarkets *)v90 initWithJSON:v89];
    }
    else {
      uint64_t v91 = [(GEOAdditionalEnabledMarkets *)v90 initWithDictionary:v89];
    }
    v92 = (void *)v91;
    [a1 setAdditionalEnabledMarkets:v91];
  }
  v93 = [v5 objectForKeyedSubscript:@"sequenceNumber"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setSequenceNumber:", objc_msgSend(v93, "unsignedIntValue"));
  }

  if (a3) {
    v94 = @"sessionState";
  }
  else {
    v94 = @"session_state";
  }
  id v95 = [v5 objectForKeyedSubscript:v94];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v96 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v95 options:0];
    [a1 setSessionState:v96];
  }
  v97 = [v5 objectForKeyedSubscript:@"isFromAPI"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsFromAPI:", objc_msgSend(v97, "BOOLValue"));
  }

  if (a3) {
    v98 = @"commonOptions";
  }
  else {
    v98 = @"common_options";
  }
  v99 = [v5 objectForKeyedSubscript:v98];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v100 = [GEOCommonOptions alloc];
    if (a3) {
      uint64_t v101 = [(GEOCommonOptions *)v100 initWithJSON:v99];
    }
    else {
      uint64_t v101 = [(GEOCommonOptions *)v100 initWithDictionary:v99];
    }
    id v102 = (void *)v101;
    [a1 setCommonOptions:v101];
  }
  if (a3) {
    v103 = @"loggedAbExperiment";
  }
  else {
    v103 = @"logged_ab_experiment";
  }
  id v104 = [v5 objectForKeyedSubscript:v103];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v105 = (void *)[v104 copy];
    [a1 setLoggedAbExperiment:v105];
  }
  if (a3) {
    uint64_t v106 = @"lastKnownRoadLocation";
  }
  else {
    uint64_t v106 = @"last_known_road_location";
  }
  uint64_t v107 = [v5 objectForKeyedSubscript:v106];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v108 = [GEOLocation alloc];
    if (a3) {
      uint64_t v109 = [(GEOLocation *)v108 initWithJSON:v107];
    }
    else {
      uint64_t v109 = [(GEOLocation *)v108 initWithDictionary:v107];
    }
    id v110 = (void *)v109;
    [a1 setLastKnownRoadLocation:v109];
  }
  v111 = [v5 objectForKeyedSubscript:@"originalRoutePurpose"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v112 = v111;
    if ([v112 isEqualToString:@"UNKNOWN_ORIGINAL_ROUTE_PURPOSE"])
    {
      uint64_t v113 = 0;
    }
    else if ([v112 isEqualToString:@"REROUTING"])
    {
      uint64_t v113 = 1;
    }
    else if ([v112 isEqualToString:@"ROUTE_FROM_ZILCH_POINTS"])
    {
      uint64_t v113 = 2;
    }
    else if ([v112 isEqualToString:@"BIASED_DIRECTIONS_TO_POI"])
    {
      uint64_t v113 = 3;
    }
    else if ([v112 isEqualToString:@"BIASED_DIRECTIONS_FROM_POI"])
    {
      uint64_t v113 = 4;
    }
    else
    {
      uint64_t v113 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_175;
    }
    uint64_t v113 = [v111 intValue];
  }
  [a1 setOriginalRoutePurpose:v113];
LABEL_175:

  if (a3) {
    v114 = @"abClientMetadata";
  }
  else {
    v114 = @"ab_client_metadata";
  }
  v115 = [v5 objectForKeyedSubscript:v114];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v116 = [GEOPDABClientDatasetMetadata alloc];
    if (a3) {
      uint64_t v117 = [(GEOPDABClientDatasetMetadata *)v116 initWithJSON:v115];
    }
    else {
      uint64_t v117 = [(GEOPDABClientDatasetMetadata *)v116 initWithDictionary:v115];
    }
    v118 = (void *)v117;
    [a1 setAbClientMetadata:v117];
  }
  if (a3) {
    v119 = @"deviceHistoricalLocation";
  }
  else {
    v119 = @"device_historical_location";
  }
  v120 = [v5 objectForKeyedSubscript:v119];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v203 = 0u;
    long long v204 = 0u;
    long long v201 = 0u;
    long long v202 = 0u;
    long long v186 = v120;
    id v121 = v120;
    uint64_t v122 = [v121 countByEnumeratingWithState:&v201 objects:v226 count:16];
    if (v122)
    {
      uint64_t v123 = v122;
      uint64_t v124 = *(void *)v202;
      do
      {
        for (uint64_t n = 0; n != v123; ++n)
        {
          if (*(void *)v202 != v124) {
            objc_enumerationMutation(v121);
          }
          uint64_t v126 = *(void *)(*((void *)&v201 + 1) + 8 * n);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v127 = [GEOLocation alloc];
            if (a3) {
              uint64_t v128 = [(GEOLocation *)v127 initWithJSON:v126];
            }
            else {
              uint64_t v128 = [(GEOLocation *)v127 initWithDictionary:v126];
            }
            id v129 = (void *)v128;
            objc_msgSend(a1, "addDeviceHistoricalLocation:", v128, v186);
          }
        }
        uint64_t v123 = [v121 countByEnumeratingWithState:&v201 objects:v226 count:16];
      }
      while (v123);
    }

    v120 = v186;
    id v5 = v188;
  }

  if (a3) {
    v130 = @"nonRecommendedRoutesOption";
  }
  else {
    v130 = @"non_recommended_routes_option";
  }
  v131 = objc_msgSend(v5, "objectForKeyedSubscript:", v130, v186);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v132 = v131;
    if ([v132 isEqualToString:@"NON_RECOMMENDED_UNKNOWN"])
    {
      uint64_t v133 = 0;
    }
    else if ([v132 isEqualToString:@"NON_RECOMMENDED_NONE"])
    {
      uint64_t v133 = 1;
    }
    else if ([v132 isEqualToString:@"NON_RECOMMENDED_PREPARING_TO_LEAVE"])
    {
      uint64_t v133 = 2;
    }
    else if ([v132 isEqualToString:@"NON_RECOMMENDED_WHILE_TRAVELING"])
    {
      uint64_t v133 = 3;
    }
    else
    {
      uint64_t v133 = 0;
    }

    goto LABEL_216;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v133 = [v131 intValue];
LABEL_216:
    [a1 setNonRecommendedRoutesOption:v133];
  }

  if (a3) {
    id v134 = @"nonRecommendedRoutesCache";
  }
  else {
    id v134 = @"non_recommended_routes_cache";
  }
  v135 = [v5 objectForKeyedSubscript:v134];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v136 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v135 options:0];
    [a1 setNonRecommendedRoutesCache:v136];
  }
  if (a3) {
    uint64_t v137 = @"lastEtaDisplayed";
  }
  else {
    uint64_t v137 = @"last_eta_displayed";
  }
  uint64_t v138 = [v5 objectForKeyedSubscript:v137];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setLastEtaDisplayed:", objc_msgSend(v138, "unsignedIntValue"));
  }

  if (a3) {
    uint64_t v139 = @"recentLocationHistory";
  }
  else {
    uint64_t v139 = @"recent_location_history";
  }
  v140 = [v5 objectForKeyedSubscript:v139];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v141 = [GEORecentLocationHistory alloc];
    if (a3) {
      uint64_t v142 = [(GEORecentLocationHistory *)v141 initWithJSON:v140];
    }
    else {
      uint64_t v142 = [(GEORecentLocationHistory *)v141 initWithDictionary:v140];
    }
    v143 = (void *)v142;
    [a1 setRecentLocationHistory:v142];
  }
  if (a3) {
    v144 = @"privacyMetadata";
  }
  else {
    v144 = @"privacy_metadata";
  }
  v145 = [v5 objectForKeyedSubscript:v144];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v146 = [GEOPrivacyMetadata alloc];
    if (a3) {
      uint64_t v147 = [(GEOPrivacyMetadata *)v146 initWithJSON:v145];
    }
    else {
      uint64_t v147 = [(GEOPrivacyMetadata *)v146 initWithDictionary:v145];
    }
    uint64_t v148 = (void *)v147;
    [a1 setPrivacyMetadata:v147];
  }
  if (a3) {
    uint64_t v149 = @"tripInfo";
  }
  else {
    uint64_t v149 = @"trip_info";
  }
  v150 = [v5 objectForKeyedSubscript:v149];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v151 = [GEOTripInfo alloc];
    if (a3) {
      uint64_t v152 = [(GEOTripInfo *)v151 initWithJSON:v150];
    }
    else {
      uint64_t v152 = [(GEOTripInfo *)v151 initWithDictionary:v150];
    }
    uint64_t v153 = (void *)v152;
    [a1 setTripInfo:v152];
  }
  v154 = [v5 objectForKeyedSubscript:@"serviceTag"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v199 = 0u;
    long long v200 = 0u;
    long long v197 = 0u;
    long long v198 = 0u;
    long long v187 = v154;
    id v155 = v154;
    uint64_t v156 = [v155 countByEnumeratingWithState:&v197 objects:v225 count:16];
    if (v156)
    {
      uint64_t v157 = v156;
      uint64_t v158 = *(void *)v198;
      do
      {
        for (iuint64_t i = 0; ii != v157; ++ii)
        {
          if (*(void *)v198 != v158) {
            objc_enumerationMutation(v155);
          }
          uint64_t v160 = *(void *)(*((void *)&v197 + 1) + 8 * ii);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v161 = [GEOGeoServiceTag alloc];
            if (a3) {
              uint64_t v162 = [(GEOGeoServiceTag *)v161 initWithJSON:v160];
            }
            else {
              uint64_t v162 = [(GEOGeoServiceTag *)v161 initWithDictionary:v160];
            }
            id v163 = (void *)v162;
            objc_msgSend(a1, "addServiceTag:", v162, v187);
          }
        }
        uint64_t v157 = [v155 countByEnumeratingWithState:&v197 objects:v225 count:16];
      }
      while (v157);
    }

    v154 = v187;
    id v5 = v188;
  }

  v164 = [v5 objectForKeyedSubscript:@"trafficApiResponses"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v195 = 0u;
    long long v196 = 0u;
    long long v193 = 0u;
    long long v194 = 0u;
    id v165 = v164;
    uint64_t v166 = [v165 countByEnumeratingWithState:&v193 objects:v224 count:16];
    if (v166)
    {
      uint64_t v167 = v166;
      uint64_t v168 = *(void *)v194;
      do
      {
        for (juint64_t j = 0; jj != v167; ++jj)
        {
          if (*(void *)v194 != v168) {
            objc_enumerationMutation(v165);
          }
          uint64_t v170 = *(void *)(*((void *)&v193 + 1) + 8 * jj);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v171 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v170 options:0];
            [a1 addTrafficApiResponses:v171];
          }
        }
        uint64_t v167 = [v165 countByEnumeratingWithState:&v193 objects:v224 count:16];
      }
      while (v167);
    }

    id v5 = v188;
  }

  long long v172 = [v5 objectForKeyedSubscript:@"trafficSnapshotIds"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v191 = 0u;
    long long v192 = 0u;
    long long v189 = 0u;
    long long v190 = 0u;
    id v173 = v172;
    uint64_t v174 = [v173 countByEnumeratingWithState:&v189 objects:v223 count:16];
    if (v174)
    {
      uint64_t v175 = v174;
      uint64_t v176 = *(void *)v190;
      do
      {
        for (kuint64_t k = 0; kk != v175; ++kk)
        {
          if (*(void *)v190 != v176) {
            objc_enumerationMutation(v173);
          }
          long long v178 = *(void **)(*((void *)&v189 + 1) + 8 * kk);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v179 = (void *)[v178 copy];
            [a1 addTrafficSnapshotIds:v179];
          }
        }
        uint64_t v175 = [v173 countByEnumeratingWithState:&v189 objects:v223 count:16];
      }
      while (v175);
    }

    id v5 = v188;
  }

  if (a3) {
    long long v180 = @"trafficSnapshotUnixTime";
  }
  else {
    long long v180 = @"traffic_snapshot_unix_time";
  }
  long long v181 = objc_msgSend(v5, "objectForKeyedSubscript:", v180, v187);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTrafficSnapshotUnixTime:", objc_msgSend(v181, "unsignedIntValue"));
  }

  long long v182 = [v5 objectForKeyedSubscript:@"requestTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v182 doubleValue];
    objc_msgSend(a1, "setRequestTime:");
  }

  a1 = a1;
LABEL_295:

  return a1;
}

- (GEODirectionsRequest)initWithJSON:(id)a3
{
  return (GEODirectionsRequest *)-[GEODirectionsRequest _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_80;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_80;
    }
    GEODirectionsRequestReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEODirectionsRequestCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEODirectionsRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEODirectionsRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEODirectionsRequestIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v40 = self->_reader;
    objc_sync_enter(v40);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v41 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v41];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v40);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEODirectionsRequest *)self readAll:0];
    if (self->_routeAttributes) {
      PBDataWriterWriteSubmessage();
    }
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    objc_super v6 = self->_waypointTypeds;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v71 objects:v82 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v72;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v72 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v71 objects:v82 count:16];
      }
      while (v7);
    }

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v10 = self->_displayedBannerIds;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v67 objects:v81 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v68;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v68 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteStringField();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v67 objects:v81 count:16];
      }
      while (v11);
    }

    if (self->_clientFeedbackInfo) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_currentUserLocation) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_currentMapRegion) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_originalRouteID) {
      PBDataWriterWriteDataField();
    }
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    uint64_t v14 = self->_originalRouteZilchPoints;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v63 objects:v80 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v64;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v64 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteDataField();
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v63 objects:v80 count:16];
      }
      while (v15);
    }

    if (self->_originalDirectionsResponseID) {
      PBDataWriterWriteDataField();
    }
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v18 = self->_originalRouteEvInfos;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v59 objects:v79 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v60;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v60 != v20) {
            objc_enumerationMutation(v18);
          }
          PBDataWriterWriteSubmessage();
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v59 objects:v79 count:16];
      }
      while (v19);
    }

    if (self->_originalRoute) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_originalWaypointRoute) {
      PBDataWriterWriteSubmessage();
    }
    if ((*((unsigned char *)&self->_flags + 1) & 2) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_clientCapabilities) {
      PBDataWriterWriteSubmessage();
    }
    $1FEE565F87D5293053496F1336AD4F5E flags = self->_flags;
    if ((*(unsigned char *)&flags & 8) != 0)
    {
      PBDataWriterWriteSfixed32Field();
      $1FEE565F87D5293053496F1336AD4F5E flags = self->_flags;
    }
    if ((*(_WORD *)&flags & 0x800) != 0)
    {
      PBDataWriterWriteBOOLField();
      $1FEE565F87D5293053496F1336AD4F5E flags = self->_flags;
    }
    if (*(unsigned char *)&flags)
    {
      uint64_t v58 = 0;
      PBDataWriterPlaceMark();
      PBDataWriterWriteUint64Field();
      PBDataWriterWriteUint64Field();
      PBDataWriterRecallMark();
      $1FEE565F87D5293053496F1336AD4F5E flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 4) != 0) {
      PBDataWriterWriteDoubleField();
    }
    if (self->_feedback) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_additionalEnabledMarkets) {
      PBDataWriterWriteSubmessage();
    }
    if (*((unsigned char *)&self->_flags + 1)) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_sessionState) {
      PBDataWriterWriteDataField();
    }
    if ((*((unsigned char *)&self->_flags + 1) & 0x10) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_commonOptions) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_loggedAbExperiment) {
      PBDataWriterWriteStringField();
    }
    if (self->_lastKnownRoadLocation) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(unsigned char *)&self->_flags & 0x80) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_abClientMetadata) {
      PBDataWriterWriteSubmessage();
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    uint64_t v23 = self->_deviceHistoricalLocations;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v54 objects:v78 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v55;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v55 != v25) {
            objc_enumerationMutation(v23);
          }
          PBDataWriterWriteSubmessage();
          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v54 objects:v78 count:16];
      }
      while (v24);
    }

    if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_nonRecommendedRoutesCache) {
      PBDataWriterWriteDataField();
    }
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_recentLocationHistory) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_privacyMetadata) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_tripInfo) {
      PBDataWriterWriteSubmessage();
    }
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v27 = self->_serviceTags;
    uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v50 objects:v77 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v51;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v51 != v29) {
            objc_enumerationMutation(v27);
          }
          PBDataWriterWriteSubmessage();
          ++v30;
        }
        while (v28 != v30);
        uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v50 objects:v77 count:16];
      }
      while (v28);
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v31 = self->_trafficApiResponses;
    uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v46 objects:v76 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v47;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v47 != v33) {
            objc_enumerationMutation(v31);
          }
          PBDataWriterWriteDataField();
          ++v34;
        }
        while (v32 != v34);
        uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v46 objects:v76 count:16];
      }
      while (v32);
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v35 = self->_trafficSnapshotIds;
    uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v42 objects:v75 count:16];
    if (v36)
    {
      uint64_t v37 = *(void *)v43;
      do
      {
        uint64_t v38 = 0;
        do
        {
          if (*(void *)v43 != v37) {
            objc_enumerationMutation(v35);
          }
          PBDataWriterWriteStringField();
          ++v38;
        }
        while (v36 != v38);
        uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v42 objects:v75 count:16];
      }
      while (v36);
    }

    $1FEE565F87D5293053496F1336AD4F5E v39 = self->_flags;
    if ((*(_WORD *)&v39 & 0x400) != 0)
    {
      PBDataWriterWriteUint32Field();
      $1FEE565F87D5293053496F1336AD4F5E v39 = self->_flags;
    }
    if ((*(unsigned char *)&v39 & 2) != 0) {
      PBDataWriterWriteDoubleField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v42);
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  -[GEODirectionsRequest _readCurrentMapRegion]((uint64_t)self);
  if ([(GEOMapRegion *)self->_currentMapRegion hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEODirectionsRequest _readCurrentUserLocation]((uint64_t)self);
  if ([(GEOLocation *)self->_currentUserLocation hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEODirectionsRequest _readDeviceHistoricalLocations]((uint64_t)self);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = self->_deviceHistoricalLocations;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
LABEL_7:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v21 != v10) {
        objc_enumerationMutation(v7);
      }
      if ([*(id *)(*((void *)&v20 + 1) + 8 * v11) hasGreenTeaWithValue:v3]) {
        goto LABEL_24;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v9) {
          goto LABEL_7;
        }
        break;
      }
    }
  }

  -[GEODirectionsRequest _readLastKnownRoadLocation]((uint64_t)self);
  if (![(GEOLocation *)self->_lastKnownRoadLocation hasGreenTeaWithValue:v3])
  {
    -[GEODirectionsRequest _readOriginalWaypointRoute]((uint64_t)self);
    if (![(GEOOriginalWaypointRoute *)self->_originalWaypointRoute hasGreenTeaWithValue:v3])
    {
      -[GEODirectionsRequest _readWaypointTypeds]((uint64_t)self);
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v7 = self->_waypointTypeds;
      uint64_t v12 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (!v12)
      {
LABEL_23:
        BOOL v5 = 0;
LABEL_25:

        return v5;
      }
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
LABEL_17:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15), "hasGreenTeaWithValue:", v3, (void)v16)) {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v13) {
            goto LABEL_17;
          }
          goto LABEL_23;
        }
      }
LABEL_24:
      BOOL v5 = 1;
      goto LABEL_25;
    }
  }
  return 1;
}

- (unsigned)requestTypeCode
{
  return 44;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  uint64_t v40 = (id *)a3;
  [(GEODirectionsRequest *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v40 + 1, self->_reader);
  *((_DWORD *)v40 + 70) = self->_readerMarkPos;
  *((_DWORD *)v40 + 71) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_routeAttributes) {
    objc_msgSend(v40, "setRouteAttributes:");
  }
  if ([(GEODirectionsRequest *)self waypointTypedsCount])
  {
    [v40 clearWaypointTypeds];
    unint64_t v4 = [(GEODirectionsRequest *)self waypointTypedsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEODirectionsRequest *)self waypointTypedAtIndex:i];
        [v40 addWaypointTyped:v7];
      }
    }
  }
  if ([(GEODirectionsRequest *)self displayedBannerIdsCount])
  {
    [v40 clearDisplayedBannerIds];
    unint64_t v8 = [(GEODirectionsRequest *)self displayedBannerIdsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEODirectionsRequest *)self displayedBannerIdAtIndex:j];
        [v40 addDisplayedBannerId:v11];
      }
    }
  }
  if (self->_clientFeedbackInfo) {
    objc_msgSend(v40, "setClientFeedbackInfo:");
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    *((_DWORD *)v40 + 75) = self->_mainTransportTypeMaxRouteCount;
    v40[41] = (id)((unint64_t)v40[41] | 0x20);
  }
  if (self->_currentUserLocation) {
    objc_msgSend(v40, "setCurrentUserLocation:");
  }
  if (self->_currentMapRegion) {
    objc_msgSend(v40, "setCurrentMapRegion:");
  }
  if (self->_originalRouteID) {
    objc_msgSend(v40, "setOriginalRouteID:");
  }
  if ([(GEODirectionsRequest *)self originalRouteZilchPointsCount])
  {
    [v40 clearOriginalRouteZilchPoints];
    unint64_t v12 = [(GEODirectionsRequest *)self originalRouteZilchPointsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEODirectionsRequest *)self originalRouteZilchPointsAtIndex:k];
        [v40 addOriginalRouteZilchPoints:v15];
      }
    }
  }
  if (self->_originalDirectionsResponseID) {
    objc_msgSend(v40, "setOriginalDirectionsResponseID:");
  }
  if ([(GEODirectionsRequest *)self originalRouteEvInfosCount])
  {
    [v40 clearOriginalRouteEvInfos];
    unint64_t v16 = [(GEODirectionsRequest *)self originalRouteEvInfosCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        long long v19 = [(GEODirectionsRequest *)self originalRouteEvInfoAtIndex:m];
        [v40 addOriginalRouteEvInfo:v19];
      }
    }
  }
  if (self->_originalRoute) {
    objc_msgSend(v40, "setOriginalRoute:");
  }
  long long v20 = v40;
  if (self->_originalWaypointRoute)
  {
    objc_msgSend(v40, "setOriginalWaypointRoute:");
    long long v20 = v40;
  }
  if ((*((unsigned char *)&self->_flags + 1) & 2) != 0)
  {
    *((_DWORD *)v20 + 79) = self->_timeSinceLastRerouteRequest;
    v20[41] = (id)((unint64_t)v20[41] | 0x200);
  }
  if (self->_clientCapabilities)
  {
    objc_msgSend(v40, "setClientCapabilities:");
    long long v20 = v40;
  }
  $1FEE565F87D5293053496F1336AD4F5E flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    *((_DWORD *)v20 + 73) = self->_departureTime;
    v20[41] = (id)((unint64_t)v20[41] | 8);
    $1FEE565F87D5293053496F1336AD4F5E flags = self->_flags;
    if ((*(_WORD *)&flags & 0x800) == 0)
    {
LABEL_41:
      if ((*(unsigned char *)&flags & 1) == 0) {
        goto LABEL_42;
      }
      goto LABEL_101;
    }
  }
  else if ((*(_WORD *)&flags & 0x800) == 0)
  {
    goto LABEL_41;
  }
  *((unsigned char *)v20 + 324) = self->_getRouteForZilchPoints;
  v20[41] = (id)((unint64_t)v20[41] | 0x800);
  $1FEE565F87D5293053496F1336AD4F5E flags = self->_flags;
  if ((*(unsigned char *)&flags & 1) == 0)
  {
LABEL_42:
    if ((*(unsigned char *)&flags & 4) == 0) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
LABEL_101:
  *(GEOSessionID *)(v20 + 3) = self->_sessionID;
  v20[41] = (id)((unint64_t)v20[41] | 1);
  if ((*(void *)&self->_flags & 4) != 0)
  {
LABEL_43:
    v20[29] = *(id *)&self->_sessionRelativeTimestamp;
    v20[41] = (id)((unint64_t)v20[41] | 4);
  }
LABEL_44:
  if (self->_feedback)
  {
    objc_msgSend(v40, "setFeedback:");
    long long v20 = v40;
  }
  if (self->_additionalEnabledMarkets)
  {
    objc_msgSend(v40, "setAdditionalEnabledMarkets:");
    long long v20 = v40;
  }
  if (*((unsigned char *)&self->_flags + 1))
  {
    *((_DWORD *)v20 + 78) = self->_sequenceNumber;
    v20[41] = (id)((unint64_t)v20[41] | 0x100);
  }
  if (self->_sessionState)
  {
    objc_msgSend(v40, "setSessionState:");
    long long v20 = v40;
  }
  if ((*((unsigned char *)&self->_flags + 1) & 0x10) != 0)
  {
    *((unsigned char *)v20 + 325) = self->_isFromAPI;
    v20[41] = (id)((unint64_t)v20[41] | 0x1000);
  }
  if (self->_commonOptions)
  {
    objc_msgSend(v40, "setCommonOptions:");
    long long v20 = v40;
  }
  if (self->_loggedAbExperiment)
  {
    objc_msgSend(v40, "setLoggedAbExperiment:");
    long long v20 = v40;
  }
  if (self->_lastKnownRoadLocation)
  {
    objc_msgSend(v40, "setLastKnownRoadLocation:");
    long long v20 = v40;
  }
  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    *((_DWORD *)v20 + 77) = self->_originalRoutePurpose;
    v20[41] = (id)((unint64_t)v20[41] | 0x80);
  }
  if (self->_abClientMetadata) {
    objc_msgSend(v40, "setAbClientMetadata:");
  }
  if ([(GEODirectionsRequest *)self deviceHistoricalLocationsCount])
  {
    [v40 clearDeviceHistoricalLocations];
    unint64_t v22 = [(GEODirectionsRequest *)self deviceHistoricalLocationsCount];
    if (v22)
    {
      unint64_t v23 = v22;
      for (uint64_t n = 0; n != v23; ++n)
      {
        uint64_t v25 = [(GEODirectionsRequest *)self deviceHistoricalLocationAtIndex:n];
        [v40 addDeviceHistoricalLocation:v25];
      }
    }
  }
  uint64_t v26 = v40;
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    *((_DWORD *)v40 + 76) = self->_nonRecommendedRoutesOption;
    v40[41] = (id)((unint64_t)v40[41] | 0x40);
  }
  if (self->_nonRecommendedRoutesCache)
  {
    objc_msgSend(v40, "setNonRecommendedRoutesCache:");
    uint64_t v26 = v40;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *((_DWORD *)v26 + 74) = self->_lastEtaDisplayed;
    v26[41] = (id)((unint64_t)v26[41] | 0x10);
  }
  if (self->_recentLocationHistory) {
    objc_msgSend(v40, "setRecentLocationHistory:");
  }
  if (self->_privacyMetadata) {
    objc_msgSend(v40, "setPrivacyMetadata:");
  }
  if (self->_tripInfo) {
    objc_msgSend(v40, "setTripInfo:");
  }
  if ([(GEODirectionsRequest *)self serviceTagsCount])
  {
    [v40 clearServiceTags];
    unint64_t v27 = [(GEODirectionsRequest *)self serviceTagsCount];
    if (v27)
    {
      unint64_t v28 = v27;
      for (iuint64_t i = 0; ii != v28; ++ii)
      {
        uint64_t v30 = [(GEODirectionsRequest *)self serviceTagAtIndex:ii];
        [v40 addServiceTag:v30];
      }
    }
  }
  if ([(GEODirectionsRequest *)self trafficApiResponsesCount])
  {
    [v40 clearTrafficApiResponses];
    unint64_t v31 = [(GEODirectionsRequest *)self trafficApiResponsesCount];
    if (v31)
    {
      unint64_t v32 = v31;
      for (juint64_t j = 0; jj != v32; ++jj)
      {
        uint64_t v34 = [(GEODirectionsRequest *)self trafficApiResponsesAtIndex:jj];
        [v40 addTrafficApiResponses:v34];
      }
    }
  }
  if ([(GEODirectionsRequest *)self trafficSnapshotIdsCount])
  {
    [v40 clearTrafficSnapshotIds];
    unint64_t v35 = [(GEODirectionsRequest *)self trafficSnapshotIdsCount];
    if (v35)
    {
      unint64_t v36 = v35;
      for (kuint64_t k = 0; kk != v36; ++kk)
      {
        uint64_t v38 = [(GEODirectionsRequest *)self trafficSnapshotIdsAtIndex:kk];
        [v40 addTrafficSnapshotIds:v38];
      }
    }
  }
  $1FEE565F87D5293053496F1336AD4F5E v39 = self->_flags;
  if ((*(_WORD *)&v39 & 0x400) != 0)
  {
    *((_DWORD *)v40 + 80) = self->_trafficSnapshotUnixTime;
    v40[41] = (id)((unint64_t)v40[41] | 0x400);
    $1FEE565F87D5293053496F1336AD4F5E v39 = self->_flags;
  }
  if ((*(unsigned char *)&v39 & 2) != 0)
  {
    v40[26] = *(id *)&self->_requestTime;
    v40[41] = (id)((unint64_t)v40[41] | 2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 5) & 4) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEODirectionsRequestReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_85;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEODirectionsRequest *)self readAll:0];
  id v9 = [(GEORouteAttributes *)self->_routeAttributes copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v9;

  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  uint64_t v11 = self->_waypointTypeds;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v121 objects:v132 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v122;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v122 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = (void *)[*(id *)(*((void *)&v121 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addWaypointTyped:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v121 objects:v132 count:16];
    }
    while (v12);
  }

  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  unint64_t v16 = self->_displayedBannerIds;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v117 objects:v131 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v118;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v118 != v18) {
          objc_enumerationMutation(v16);
        }
        long long v20 = (void *)[*(id *)(*((void *)&v117 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addDisplayedBannerId:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v117 objects:v131 count:16];
    }
    while (v17);
  }

  id v21 = [(GEOClientFeedbackInfo *)self->_clientFeedbackInfo copyWithZone:a3];
  unint64_t v22 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v21;

  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 300) = self->_mainTransportTypeMaxRouteCount;
    *(void *)(v5 + 328) |= 0x20uLL;
  }
  id v23 = [(GEOLocation *)self->_currentUserLocation copyWithZone:a3];
  uint64_t v24 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v23;

  id v25 = [(GEOMapRegion *)self->_currentMapRegion copyWithZone:a3];
  uint64_t v26 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v25;

  uint64_t v27 = [(NSData *)self->_originalRouteID copyWithZone:a3];
  unint64_t v28 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v27;

  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  uint64_t v29 = self->_originalRouteZilchPoints;
  uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v113 objects:v130 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v114;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v114 != v31) {
          objc_enumerationMutation(v29);
        }
        uint64_t v33 = (void *)[*(id *)(*((void *)&v113 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addOriginalRouteZilchPoints:v33];
      }
      uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v113 objects:v130 count:16];
    }
    while (v30);
  }

  uint64_t v34 = [(NSData *)self->_originalDirectionsResponseID copyWithZone:a3];
  unint64_t v35 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v34;

  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  unint64_t v36 = self->_originalRouteEvInfos;
  uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v109 objects:v129 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v110;
    do
    {
      for (uint64_t m = 0; m != v37; ++m)
      {
        if (*(void *)v110 != v38) {
          objc_enumerationMutation(v36);
        }
        uint64_t v40 = (void *)[*(id *)(*((void *)&v109 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addOriginalRouteEvInfo:v40];
      }
      uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v109 objects:v129 count:16];
    }
    while (v37);
  }

  id v41 = [(GEOOriginalRoute *)self->_originalRoute copyWithZone:a3];
  long long v42 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v41;

  id v43 = [(GEOOriginalWaypointRoute *)self->_originalWaypointRoute copyWithZone:a3];
  long long v44 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v43;

  if ((*((unsigned char *)&self->_flags + 1) & 2) != 0)
  {
    *(_DWORD *)(v5 + 316) = self->_timeSinceLastRerouteRequest;
    *(void *)(v5 + 328) |= 0x200uLL;
  }
  id v45 = [(GEOClientCapabilities *)self->_clientCapabilities copyWithZone:a3];
  long long v46 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v45;

  $1FEE565F87D5293053496F1336AD4F5E flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 292) = self->_departureTime;
    *(void *)(v5 + 328) |= 8uLL;
    $1FEE565F87D5293053496F1336AD4F5E flags = self->_flags;
    if ((*(_WORD *)&flags & 0x800) == 0)
    {
LABEL_39:
      if ((*(unsigned char *)&flags & 1) == 0) {
        goto LABEL_40;
      }
LABEL_88:
      *(GEOSessionID *)(v5 + 24) = self->_sessionID;
      *(void *)(v5 + 328) |= 1uLL;
      if ((*(void *)&self->_flags & 4) == 0) {
        goto LABEL_42;
      }
      goto LABEL_41;
    }
  }
  else if ((*(_WORD *)&flags & 0x800) == 0)
  {
    goto LABEL_39;
  }
  *(unsigned char *)(v5 + 324) = self->_getRouteForZilchPoints;
  *(void *)(v5 + 328) |= 0x800uLL;
  $1FEE565F87D5293053496F1336AD4F5E flags = self->_flags;
  if (*(unsigned char *)&flags) {
    goto LABEL_88;
  }
LABEL_40:
  if ((*(unsigned char *)&flags & 4) != 0)
  {
LABEL_41:
    *(double *)(v5 + 232) = self->_sessionRelativeTimestamp;
    *(void *)(v5 + 328) |= 4uLL;
  }
LABEL_42:
  id v48 = [(GEODirectionsRequestFeedback *)self->_feedback copyWithZone:a3];
  long long v49 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v48;

  id v50 = [(GEOAdditionalEnabledMarkets *)self->_additionalEnabledMarkets copyWithZone:a3];
  long long v51 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v50;

  if (*((unsigned char *)&self->_flags + 1))
  {
    *(_DWORD *)(v5 + 312) = self->_sequenceNumber;
    *(void *)(v5 + 328) |= 0x100uLL;
  }
  uint64_t v52 = [(NSData *)self->_sessionState copyWithZone:a3];
  long long v53 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v52;

  if ((*((unsigned char *)&self->_flags + 1) & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 325) = self->_isFromAPI;
    *(void *)(v5 + 328) |= 0x1000uLL;
  }
  id v54 = [(GEOCommonOptions *)self->_commonOptions copyWithZone:a3];
  long long v55 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v54;

  uint64_t v56 = [(NSString *)self->_loggedAbExperiment copyWithZone:a3];
  long long v57 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v56;

  id v58 = [(GEOLocation *)self->_lastKnownRoadLocation copyWithZone:a3];
  long long v59 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v58;

  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 308) = self->_originalRoutePurpose;
    *(void *)(v5 + 328) |= 0x80uLL;
  }
  id v60 = [(GEOPDABClientDatasetMetadata *)self->_abClientMetadata copyWithZone:a3];
  long long v61 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v60;

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v62 = self->_deviceHistoricalLocations;
  uint64_t v63 = [(NSMutableArray *)v62 countByEnumeratingWithState:&v105 objects:v128 count:16];
  if (v63)
  {
    uint64_t v64 = *(void *)v106;
    do
    {
      for (uint64_t n = 0; n != v63; ++n)
      {
        if (*(void *)v106 != v64) {
          objc_enumerationMutation(v62);
        }
        long long v66 = (void *)[*(id *)(*((void *)&v105 + 1) + 8 * n) copyWithZone:a3];
        [(id)v5 addDeviceHistoricalLocation:v66];
      }
      uint64_t v63 = [(NSMutableArray *)v62 countByEnumeratingWithState:&v105 objects:v128 count:16];
    }
    while (v63);
  }

  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 304) = self->_nonRecommendedRoutesOption;
    *(void *)(v5 + 328) |= 0x40uLL;
  }
  uint64_t v67 = [(NSData *)self->_nonRecommendedRoutesCache copyWithZone:a3];
  long long v68 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v67;

  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 296) = self->_lastEtaDisplayed;
    *(void *)(v5 + 328) |= 0x10uLL;
  }
  id v69 = [(GEORecentLocationHistory *)self->_recentLocationHistory copyWithZone:a3];
  long long v70 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v69;

  id v71 = [(GEOPrivacyMetadata *)self->_privacyMetadata copyWithZone:a3];
  long long v72 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v71;

  id v73 = [(GEOTripInfo *)self->_tripInfo copyWithZone:a3];
  long long v74 = *(void **)(v5 + 264);
  *(void *)(v5 + 264) = v73;

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v75 = self->_serviceTags;
  uint64_t v76 = [(NSMutableArray *)v75 countByEnumeratingWithState:&v101 objects:v127 count:16];
  if (v76)
  {
    uint64_t v77 = *(void *)v102;
    do
    {
      for (iuint64_t i = 0; ii != v76; ++ii)
      {
        if (*(void *)v102 != v77) {
          objc_enumerationMutation(v75);
        }
        v79 = (void *)[*(id *)(*((void *)&v101 + 1) + 8 * ii) copyWithZone:a3];
        [(id)v5 addServiceTag:v79];
      }
      uint64_t v76 = [(NSMutableArray *)v75 countByEnumeratingWithState:&v101 objects:v127 count:16];
    }
    while (v76);
  }

  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  v80 = self->_trafficApiResponses;
  uint64_t v81 = [(NSMutableArray *)v80 countByEnumeratingWithState:&v97 objects:v126 count:16];
  if (v81)
  {
    uint64_t v82 = *(void *)v98;
    do
    {
      for (juint64_t j = 0; jj != v81; ++jj)
      {
        if (*(void *)v98 != v82) {
          objc_enumerationMutation(v80);
        }
        v84 = (void *)[*(id *)(*((void *)&v97 + 1) + 8 * jj) copyWithZone:a3];
        [(id)v5 addTrafficApiResponses:v84];
      }
      uint64_t v81 = [(NSMutableArray *)v80 countByEnumeratingWithState:&v97 objects:v126 count:16];
    }
    while (v81);
  }

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  v85 = self->_trafficSnapshotIds;
  uint64_t v86 = [(NSMutableArray *)v85 countByEnumeratingWithState:&v93 objects:v125 count:16];
  if (v86)
  {
    uint64_t v87 = *(void *)v94;
    do
    {
      for (kuint64_t k = 0; kk != v86; ++kk)
      {
        if (*(void *)v94 != v87) {
          objc_enumerationMutation(v85);
        }
        v89 = objc_msgSend(*(id *)(*((void *)&v93 + 1) + 8 * kk), "copyWithZone:", a3, (void)v93);
        [(id)v5 addTrafficSnapshotIds:v89];
      }
      uint64_t v86 = [(NSMutableArray *)v85 countByEnumeratingWithState:&v93 objects:v125 count:16];
    }
    while (v86);
  }

  $1FEE565F87D5293053496F1336AD4F5E v90 = self->_flags;
  if ((*(_WORD *)&v90 & 0x400) != 0)
  {
    *(_DWORD *)(v5 + 320) = self->_trafficSnapshotUnixTime;
    *(void *)(v5 + 328) |= 0x400uLL;
    $1FEE565F87D5293053496F1336AD4F5E v90 = self->_flags;
  }
  if ((*(unsigned char *)&v90 & 2) != 0)
  {
    *(double *)(v5 + 208) = self->_requestTime;
    *(void *)(v5 + 328) |= 2uLL;
  }
  uint64_t v91 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v91;
LABEL_85:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_136;
  }
  [(GEODirectionsRequest *)self readAll:1];
  [v4 readAll:1];
  routeAttributes = self->_routeAttributes;
  if ((unint64_t)routeAttributes | *((void *)v4 + 27))
  {
    if (!-[GEORouteAttributes isEqual:](routeAttributes, "isEqual:")) {
      goto LABEL_136;
    }
  }
  waypointTypeds = self->_waypointTypeds;
  if ((unint64_t)waypointTypeds | *((void *)v4 + 34))
  {
    if (!-[NSMutableArray isEqual:](waypointTypeds, "isEqual:")) {
      goto LABEL_136;
    }
  }
  displayedBannerIds = self->_displayedBannerIds;
  if ((unint64_t)displayedBannerIds | *((void *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](displayedBannerIds, "isEqual:")) {
      goto LABEL_136;
    }
  }
  clientFeedbackInfo = self->_clientFeedbackInfo;
  if ((unint64_t)clientFeedbackInfo | *((void *)v4 + 8))
  {
    if (!-[GEOClientFeedbackInfo isEqual:](clientFeedbackInfo, "isEqual:")) {
      goto LABEL_136;
    }
  }
  uint64_t v9 = *((void *)v4 + 41);
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_mainTransportTypeMaxRouteCount != *((_DWORD *)v4 + 75)) {
      goto LABEL_136;
    }
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_136;
  }
  currentUserLocatiouint64_t n = self->_currentUserLocation;
  if ((unint64_t)currentUserLocation | *((void *)v4 + 11)
    && !-[GEOLocation isEqual:](currentUserLocation, "isEqual:"))
  {
    goto LABEL_136;
  }
  currentMapRegiouint64_t n = self->_currentMapRegion;
  if ((unint64_t)currentMapRegion | *((void *)v4 + 10))
  {
    if (!-[GEOMapRegion isEqual:](currentMapRegion, "isEqual:")) {
      goto LABEL_136;
    }
  }
  originalRouteID = self->_originalRouteID;
  if ((unint64_t)originalRouteID | *((void *)v4 + 19))
  {
    if (!-[NSData isEqual:](originalRouteID, "isEqual:")) {
      goto LABEL_136;
    }
  }
  originalRouteZilchPoints = self->_originalRouteZilchPoints;
  if ((unint64_t)originalRouteZilchPoints | *((void *)v4 + 20))
  {
    if (!-[NSMutableArray isEqual:](originalRouteZilchPoints, "isEqual:")) {
      goto LABEL_136;
    }
  }
  originalDirectionsResponseID = self->_originalDirectionsResponseID;
  if ((unint64_t)originalDirectionsResponseID | *((void *)v4 + 18))
  {
    if (!-[NSData isEqual:](originalDirectionsResponseID, "isEqual:")) {
      goto LABEL_136;
    }
  }
  originalRouteEvInfos = self->_originalRouteEvInfos;
  if ((unint64_t)originalRouteEvInfos | *((void *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](originalRouteEvInfos, "isEqual:")) {
      goto LABEL_136;
    }
  }
  originalRoute = self->_originalRoute;
  if ((unint64_t)originalRoute | *((void *)v4 + 21))
  {
    if (!-[GEOOriginalRoute isEqual:](originalRoute, "isEqual:")) {
      goto LABEL_136;
    }
  }
  originalWaypointRoute = self->_originalWaypointRoute;
  if ((unint64_t)originalWaypointRoute | *((void *)v4 + 23))
  {
    if (!-[GEOOriginalWaypointRoute isEqual:](originalWaypointRoute, "isEqual:")) {
      goto LABEL_136;
    }
  }
  $1FEE565F87D5293053496F1336AD4F5E flags = self->_flags;
  uint64_t v19 = *((void *)v4 + 41);
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v19 & 0x200) == 0 || self->_timeSinceLastRerouteRequest != *((_DWORD *)v4 + 79)) {
      goto LABEL_136;
    }
  }
  else if ((v19 & 0x200) != 0)
  {
    goto LABEL_136;
  }
  clientCapabilities = self->_clientCapabilities;
  if ((unint64_t)clientCapabilities | *((void *)v4 + 7))
  {
    if (!-[GEOClientCapabilities isEqual:](clientCapabilities, "isEqual:")) {
      goto LABEL_136;
    }
    $1FEE565F87D5293053496F1336AD4F5E flags = self->_flags;
    uint64_t v19 = *((void *)v4 + 41);
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v19 & 8) == 0 || self->_departureTime != *((_DWORD *)v4 + 73)) {
      goto LABEL_136;
    }
  }
  else if ((v19 & 8) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v19 & 0x800) == 0) {
      goto LABEL_136;
    }
    if (self->_getRouteForZilchPoints)
    {
      if (!*((unsigned char *)v4 + 324)) {
        goto LABEL_136;
      }
    }
    else if (*((unsigned char *)v4 + 324))
    {
      goto LABEL_136;
    }
  }
  else if ((v19 & 0x800) != 0)
  {
    goto LABEL_136;
  }
  if (*(unsigned char *)&flags & 1) != 0 && (v19)
  {
    if (self->_sessionID._high != *((void *)v4 + 3) || self->_sessionID._low != *((void *)v4 + 4)) {
      goto LABEL_136;
    }
  }
  else if ((*(_DWORD *)&flags | v19))
  {
    goto LABEL_136;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v19 & 4) == 0 || self->_sessionRelativeTimestamp != *((double *)v4 + 29)) {
      goto LABEL_136;
    }
  }
  else if ((v19 & 4) != 0)
  {
    goto LABEL_136;
  }
  feedbacuint64_t k = self->_feedback;
  if ((unint64_t)feedback | *((void *)v4 + 14)
    && !-[GEODirectionsRequestFeedback isEqual:](feedback, "isEqual:"))
  {
    goto LABEL_136;
  }
  additionalEnabledMarkets = self->_additionalEnabledMarkets;
  if ((unint64_t)additionalEnabledMarkets | *((void *)v4 + 6))
  {
    if (!-[GEOAdditionalEnabledMarkets isEqual:](additionalEnabledMarkets, "isEqual:")) {
      goto LABEL_136;
    }
  }
  $1FEE565F87D5293053496F1336AD4F5E v24 = self->_flags;
  uint64_t v25 = *((void *)v4 + 41);
  if ((*(_WORD *)&v24 & 0x100) != 0)
  {
    if ((v25 & 0x100) == 0 || self->_sequenceNumber != *((_DWORD *)v4 + 78)) {
      goto LABEL_136;
    }
  }
  else if ((v25 & 0x100) != 0)
  {
    goto LABEL_136;
  }
  sessionState = self->_sessionState;
  if ((unint64_t)sessionState | *((void *)v4 + 30))
  {
    if (!-[NSData isEqual:](sessionState, "isEqual:")) {
      goto LABEL_136;
    }
    $1FEE565F87D5293053496F1336AD4F5E v24 = self->_flags;
    uint64_t v25 = *((void *)v4 + 41);
  }
  if ((*(_WORD *)&v24 & 0x1000) != 0)
  {
    if ((v25 & 0x1000) == 0) {
      goto LABEL_136;
    }
    if (self->_isFromAPI)
    {
      if (!*((unsigned char *)v4 + 325)) {
        goto LABEL_136;
      }
    }
    else if (*((unsigned char *)v4 + 325))
    {
      goto LABEL_136;
    }
  }
  else if ((v25 & 0x1000) != 0)
  {
    goto LABEL_136;
  }
  commonOptions = self->_commonOptions;
  if ((unint64_t)commonOptions | *((void *)v4 + 9) && !-[GEOCommonOptions isEqual:](commonOptions, "isEqual:")) {
    goto LABEL_136;
  }
  loggedAbExperiment = self->_loggedAbExperiment;
  if ((unint64_t)loggedAbExperiment | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](loggedAbExperiment, "isEqual:")) {
      goto LABEL_136;
    }
  }
  lastKnownRoadLocatiouint64_t n = self->_lastKnownRoadLocation;
  if ((unint64_t)lastKnownRoadLocation | *((void *)v4 + 15))
  {
    if (!-[GEOLocation isEqual:](lastKnownRoadLocation, "isEqual:")) {
      goto LABEL_136;
    }
  }
  uint64_t v30 = *((void *)v4 + 41);
  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    if ((v30 & 0x80) == 0 || self->_originalRoutePurpose != *((_DWORD *)v4 + 77)) {
      goto LABEL_136;
    }
  }
  else if ((v30 & 0x80) != 0)
  {
    goto LABEL_136;
  }
  abClientMetadata = self->_abClientMetadata;
  if ((unint64_t)abClientMetadata | *((void *)v4 + 5)
    && !-[GEOPDABClientDatasetMetadata isEqual:](abClientMetadata, "isEqual:"))
  {
    goto LABEL_136;
  }
  deviceHistoricalLocations = self->_deviceHistoricalLocations;
  if ((unint64_t)deviceHistoricalLocations | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](deviceHistoricalLocations, "isEqual:")) {
      goto LABEL_136;
    }
  }
  $1FEE565F87D5293053496F1336AD4F5E v33 = self->_flags;
  uint64_t v34 = *((void *)v4 + 41);
  if ((*(unsigned char *)&v33 & 0x40) != 0)
  {
    if ((v34 & 0x40) == 0 || self->_nonRecommendedRoutesOption != *((_DWORD *)v4 + 76)) {
      goto LABEL_136;
    }
  }
  else if ((v34 & 0x40) != 0)
  {
    goto LABEL_136;
  }
  nonRecommendedRoutesCache = self->_nonRecommendedRoutesCache;
  if ((unint64_t)nonRecommendedRoutesCache | *((void *)v4 + 17))
  {
    if (-[NSData isEqual:](nonRecommendedRoutesCache, "isEqual:"))
    {
      $1FEE565F87D5293053496F1336AD4F5E v33 = self->_flags;
      uint64_t v34 = *((void *)v4 + 41);
      goto LABEL_109;
    }
LABEL_136:
    BOOL v44 = 0;
    goto LABEL_137;
  }
LABEL_109:
  if ((*(unsigned char *)&v33 & 0x10) != 0)
  {
    if ((v34 & 0x10) == 0 || self->_lastEtaDisplayed != *((_DWORD *)v4 + 74)) {
      goto LABEL_136;
    }
  }
  else if ((v34 & 0x10) != 0)
  {
    goto LABEL_136;
  }
  recentLocationHistory = self->_recentLocationHistory;
  if ((unint64_t)recentLocationHistory | *((void *)v4 + 25)
    && !-[GEORecentLocationHistory isEqual:](recentLocationHistory, "isEqual:"))
  {
    goto LABEL_136;
  }
  privacyMetadata = self->_privacyMetadata;
  if ((unint64_t)privacyMetadata | *((void *)v4 + 24))
  {
    if (!-[GEOPrivacyMetadata isEqual:](privacyMetadata, "isEqual:")) {
      goto LABEL_136;
    }
  }
  tripInfo = self->_tripInfo;
  if ((unint64_t)tripInfo | *((void *)v4 + 33))
  {
    if (!-[GEOTripInfo isEqual:](tripInfo, "isEqual:")) {
      goto LABEL_136;
    }
  }
  serviceTags = self->_serviceTags;
  if ((unint64_t)serviceTags | *((void *)v4 + 28))
  {
    if (!-[NSMutableArray isEqual:](serviceTags, "isEqual:")) {
      goto LABEL_136;
    }
  }
  trafficApiResponses = self->_trafficApiResponses;
  if ((unint64_t)trafficApiResponses | *((void *)v4 + 31))
  {
    if (!-[NSMutableArray isEqual:](trafficApiResponses, "isEqual:")) {
      goto LABEL_136;
    }
  }
  trafficSnapshotIds = self->_trafficSnapshotIds;
  if ((unint64_t)trafficSnapshotIds | *((void *)v4 + 32))
  {
    if (!-[NSMutableArray isEqual:](trafficSnapshotIds, "isEqual:")) {
      goto LABEL_136;
    }
  }
  $1FEE565F87D5293053496F1336AD4F5E v42 = self->_flags;
  uint64_t v43 = *((void *)v4 + 41);
  if ((*(_WORD *)&v42 & 0x400) != 0)
  {
    if ((v43 & 0x400) == 0 || self->_trafficSnapshotUnixTime != *((_DWORD *)v4 + 80)) {
      goto LABEL_136;
    }
  }
  else if ((v43 & 0x400) != 0)
  {
    goto LABEL_136;
  }
  if ((*(unsigned char *)&v42 & 2) != 0)
  {
    if ((v43 & 2) == 0 || self->_requestTime != *((double *)v4 + 26)) {
      goto LABEL_136;
    }
    BOOL v44 = 1;
  }
  else
  {
    BOOL v44 = (*((void *)v4 + 41) & 2) == 0;
  }
LABEL_137:

  return v44;
}

- (unint64_t)hash
{
  [(GEODirectionsRequest *)self readAll:1];
  unint64_t v58 = [(GEORouteAttributes *)self->_routeAttributes hash];
  uint64_t v57 = [(NSMutableArray *)self->_waypointTypeds hash];
  uint64_t v56 = [(NSMutableArray *)self->_displayedBannerIds hash];
  unint64_t v55 = [(GEOClientFeedbackInfo *)self->_clientFeedbackInfo hash];
  if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
    uint64_t v54 = 2654435761 * self->_mainTransportTypeMaxRouteCount;
  }
  else {
    uint64_t v54 = 0;
  }
  unint64_t v53 = [(GEOLocation *)self->_currentUserLocation hash];
  unint64_t v52 = [(GEOMapRegion *)self->_currentMapRegion hash];
  uint64_t v51 = [(NSData *)self->_originalRouteID hash];
  uint64_t v50 = [(NSMutableArray *)self->_originalRouteZilchPoints hash];
  uint64_t v49 = [(NSData *)self->_originalDirectionsResponseID hash];
  uint64_t v48 = [(NSMutableArray *)self->_originalRouteEvInfos hash];
  unint64_t v47 = [(GEOOriginalRoute *)self->_originalRoute hash];
  unint64_t v46 = [(GEOOriginalWaypointRoute *)self->_originalWaypointRoute hash];
  if ((*((unsigned char *)&self->_flags + 1) & 2) != 0) {
    uint64_t v45 = 2654435761 * self->_timeSinceLastRerouteRequest;
  }
  else {
    uint64_t v45 = 0;
  }
  unint64_t v44 = [(GEOClientCapabilities *)self->_clientCapabilities hash];
  $1FEE565F87D5293053496F1336AD4F5E flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    uint64_t v43 = 2654435761 * self->_departureTime;
    if ((*(_WORD *)&flags & 0x800) != 0)
    {
LABEL_9:
      uint64_t v42 = 2654435761 * self->_getRouteForZilchPoints;
      if (*(unsigned char *)&flags) {
        goto LABEL_10;
      }
LABEL_20:
      uint64_t v41 = 0;
      if ((*(unsigned char *)&flags & 4) != 0) {
        goto LABEL_11;
      }
LABEL_21:
      unint64_t v40 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v43 = 0;
    if ((*(_WORD *)&flags & 0x800) != 0) {
      goto LABEL_9;
    }
  }
  uint64_t v42 = 0;
  if ((*(unsigned char *)&flags & 1) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v41 = PBHashBytes();
  if ((*(void *)&self->_flags & 4) == 0) {
    goto LABEL_21;
  }
LABEL_11:
  double sessionRelativeTimestamp = self->_sessionRelativeTimestamp;
  double v5 = -sessionRelativeTimestamp;
  if (sessionRelativeTimestamp >= 0.0) {
    double v5 = self->_sessionRelativeTimestamp;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  double v8 = fmod(v6, 1.84467441e19);
  unint64_t v9 = 2654435761u * (unint64_t)v8;
  unint64_t v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0) {
    unint64_t v10 = 2654435761u * (unint64_t)v8;
  }
  unint64_t v11 = v9 - (unint64_t)fabs(v7);
  if (v7 >= 0.0) {
    unint64_t v11 = v10;
  }
  unint64_t v40 = v11;
LABEL_22:
  unint64_t v39 = [(GEODirectionsRequestFeedback *)self->_feedback hash];
  unint64_t v38 = [(GEOAdditionalEnabledMarkets *)self->_additionalEnabledMarkets hash];
  if (*((unsigned char *)&self->_flags + 1)) {
    uint64_t v37 = 2654435761 * self->_sequenceNumber;
  }
  else {
    uint64_t v37 = 0;
  }
  uint64_t v36 = [(NSData *)self->_sessionState hash];
  if ((*((unsigned char *)&self->_flags + 1) & 0x10) != 0) {
    uint64_t v35 = 2654435761 * self->_isFromAPI;
  }
  else {
    uint64_t v35 = 0;
  }
  unint64_t v34 = [(GEOCommonOptions *)self->_commonOptions hash];
  NSUInteger v33 = [(NSString *)self->_loggedAbExperiment hash];
  unint64_t v32 = [(GEOLocation *)self->_lastKnownRoadLocation hash];
  if ((*(unsigned char *)&self->_flags & 0x80) != 0) {
    uint64_t v31 = 2654435761 * self->_originalRoutePurpose;
  }
  else {
    uint64_t v31 = 0;
  }
  unint64_t v30 = [(GEOPDABClientDatasetMetadata *)self->_abClientMetadata hash];
  uint64_t v29 = [(NSMutableArray *)self->_deviceHistoricalLocations hash];
  if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
    uint64_t v28 = 2654435761 * self->_nonRecommendedRoutesOption;
  }
  else {
    uint64_t v28 = 0;
  }
  uint64_t v27 = [(NSData *)self->_nonRecommendedRoutesCache hash];
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    uint64_t v12 = 2654435761 * self->_lastEtaDisplayed;
  }
  else {
    uint64_t v12 = 0;
  }
  unint64_t v13 = [(GEORecentLocationHistory *)self->_recentLocationHistory hash];
  unint64_t v14 = [(GEOPrivacyMetadata *)self->_privacyMetadata hash];
  unint64_t v15 = [(GEOTripInfo *)self->_tripInfo hash];
  uint64_t v16 = [(NSMutableArray *)self->_serviceTags hash];
  uint64_t v17 = [(NSMutableArray *)self->_trafficApiResponses hash];
  uint64_t v18 = [(NSMutableArray *)self->_trafficSnapshotIds hash];
  $1FEE565F87D5293053496F1336AD4F5E v19 = self->_flags;
  if ((*(_WORD *)&v19 & 0x400) != 0)
  {
    uint64_t v20 = 2654435761 * self->_trafficSnapshotUnixTime;
    if ((*(unsigned char *)&v19 & 2) != 0) {
      goto LABEL_39;
    }
LABEL_44:
    unint64_t v25 = 0;
    return v57 ^ v58 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v20 ^ v25;
  }
  uint64_t v20 = 0;
  if ((*(unsigned char *)&v19 & 2) == 0) {
    goto LABEL_44;
  }
LABEL_39:
  double requestTime = self->_requestTime;
  double v22 = -requestTime;
  if (requestTime >= 0.0) {
    double v22 = self->_requestTime;
  }
  long double v23 = floor(v22 + 0.5);
  double v24 = (v22 - v23) * 1.84467441e19;
  unint64_t v25 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
  if (v24 >= 0.0)
  {
    if (v24 > 0.0) {
      v25 += (unint64_t)v24;
    }
  }
  else
  {
    v25 -= (unint64_t)fabs(v24);
  }
  return v57 ^ v58 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v20 ^ v25;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v4 = (char *)a3;
  [v4 readAll:0];
  routeAttributes = self->_routeAttributes;
  uint64_t v6 = *((void *)v4 + 27);
  if (routeAttributes)
  {
    if (v6) {
      -[GEORouteAttributes mergeFrom:](routeAttributes, "mergeFrom:");
    }
  }
  else if (v6)
  {
    [(GEODirectionsRequest *)self setRouteAttributes:"setRouteAttributes:"];
  }
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v7 = *((id *)v4 + 34);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v105 objects:v116 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v106;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v106 != v10) {
          objc_enumerationMutation(v7);
        }
        [(GEODirectionsRequest *)self addWaypointTyped:*(void *)(*((void *)&v105 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v105 objects:v116 count:16];
    }
    while (v9);
  }

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v12 = *((id *)v4 + 13);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v101 objects:v115 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v102;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v102 != v15) {
          objc_enumerationMutation(v12);
        }
        [(GEODirectionsRequest *)self addDisplayedBannerId:*(void *)(*((void *)&v101 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v101 objects:v115 count:16];
    }
    while (v14);
  }

  clientFeedbackInfo = self->_clientFeedbackInfo;
  uint64_t v18 = *((void *)v4 + 8);
  if (clientFeedbackInfo)
  {
    if (v18) {
      -[GEOClientFeedbackInfo mergeFrom:](clientFeedbackInfo, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[GEODirectionsRequest setClientFeedbackInfo:](self, "setClientFeedbackInfo:");
  }
  if ((v4[328] & 0x20) != 0)
  {
    self->_mainTransportTypeMaxRouteCount = *((_DWORD *)v4 + 75);
    *(void *)&self->_flags |= 0x20uLL;
  }
  currentUserLocatiouint64_t n = self->_currentUserLocation;
  uint64_t v20 = *((void *)v4 + 11);
  if (currentUserLocation)
  {
    if (v20) {
      -[GEOLocation mergeFrom:](currentUserLocation, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[GEODirectionsRequest setCurrentUserLocation:](self, "setCurrentUserLocation:");
  }
  currentMapRegiouint64_t n = self->_currentMapRegion;
  uint64_t v22 = *((void *)v4 + 10);
  if (currentMapRegion)
  {
    if (v22) {
      -[GEOMapRegion mergeFrom:](currentMapRegion, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[GEODirectionsRequest setCurrentMapRegion:](self, "setCurrentMapRegion:");
  }
  if (*((void *)v4 + 19)) {
    [(GEODirectionsRequest *)self setOriginalRouteID:"setOriginalRouteID:"];
  }
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v23 = *((id *)v4 + 20);
  uint64_t v24 = [v23 countByEnumeratingWithState:&v97 objects:v114 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v98;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v98 != v26) {
          objc_enumerationMutation(v23);
        }
        [(GEODirectionsRequest *)self addOriginalRouteZilchPoints:*(void *)(*((void *)&v97 + 1) + 8 * k)];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v97 objects:v114 count:16];
    }
    while (v25);
  }

  if (*((void *)v4 + 18)) {
    -[GEODirectionsRequest setOriginalDirectionsResponseID:](self, "setOriginalDirectionsResponseID:");
  }
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v28 = *((id *)v4 + 22);
  uint64_t v29 = [v28 countByEnumeratingWithState:&v93 objects:v113 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v94;
    do
    {
      for (uint64_t m = 0; m != v30; ++m)
      {
        if (*(void *)v94 != v31) {
          objc_enumerationMutation(v28);
        }
        [(GEODirectionsRequest *)self addOriginalRouteEvInfo:*(void *)(*((void *)&v93 + 1) + 8 * m)];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v93 objects:v113 count:16];
    }
    while (v30);
  }

  originalRoute = self->_originalRoute;
  uint64_t v34 = *((void *)v4 + 21);
  if (originalRoute)
  {
    if (v34) {
      -[GEOOriginalRoute mergeFrom:](originalRoute, "mergeFrom:");
    }
  }
  else if (v34)
  {
    [(GEODirectionsRequest *)self setOriginalRoute:"setOriginalRoute:"];
  }
  originalWaypointRoute = self->_originalWaypointRoute;
  uint64_t v36 = *((void *)v4 + 23);
  if (originalWaypointRoute)
  {
    if (v36) {
      -[GEOOriginalWaypointRoute mergeFrom:](originalWaypointRoute, "mergeFrom:");
    }
  }
  else if (v36)
  {
    [(GEODirectionsRequest *)self setOriginalWaypointRoute:"setOriginalWaypointRoute:"];
  }
  if ((v4[329] & 2) != 0)
  {
    self->_timeSinceLastRerouteRequest = *((_DWORD *)v4 + 79);
    *(void *)&self->_flags |= 0x200uLL;
  }
  clientCapabilities = self->_clientCapabilities;
  uint64_t v38 = *((void *)v4 + 7);
  if (clientCapabilities)
  {
    if (v38) {
      -[GEOClientCapabilities mergeFrom:](clientCapabilities, "mergeFrom:");
    }
  }
  else if (v38)
  {
    -[GEODirectionsRequest setClientCapabilities:](self, "setClientCapabilities:");
  }
  uint64_t v39 = *((void *)v4 + 41);
  if ((v39 & 8) != 0)
  {
    self->_departureTime = *((_DWORD *)v4 + 73);
    *(void *)&self->_flags |= 8uLL;
    uint64_t v39 = *((void *)v4 + 41);
    if ((v39 & 0x800) == 0)
    {
LABEL_74:
      if ((v39 & 1) == 0) {
        goto LABEL_75;
      }
      goto LABEL_82;
    }
  }
  else if ((v39 & 0x800) == 0)
  {
    goto LABEL_74;
  }
  self->_getRouteForZilchPoints = v4[324];
  *(void *)&self->_flags |= 0x800uLL;
  uint64_t v39 = *((void *)v4 + 41);
  if ((v39 & 1) == 0)
  {
LABEL_75:
    if ((v39 & 4) == 0) {
      goto LABEL_77;
    }
    goto LABEL_76;
  }
LABEL_82:
  self->_sessionID = *(GEOSessionID *)(v4 + 24);
  *(void *)&self->_flags |= 1uLL;
  if ((*((void *)v4 + 41) & 4) != 0)
  {
LABEL_76:
    self->_double sessionRelativeTimestamp = *((double *)v4 + 29);
    *(void *)&self->_flags |= 4uLL;
  }
LABEL_77:
  feedbacuint64_t k = self->_feedback;
  uint64_t v41 = *((void *)v4 + 14);
  if (feedback)
  {
    if (v41) {
      -[GEODirectionsRequestFeedback mergeFrom:](feedback, "mergeFrom:");
    }
  }
  else if (v41)
  {
    -[GEODirectionsRequest setFeedback:](self, "setFeedback:");
  }
  additionalEnabledMarkets = self->_additionalEnabledMarkets;
  uint64_t v43 = *((void *)v4 + 6);
  if (additionalEnabledMarkets)
  {
    if (v43) {
      -[GEOAdditionalEnabledMarkets mergeFrom:](additionalEnabledMarkets, "mergeFrom:");
    }
  }
  else if (v43)
  {
    -[GEODirectionsRequest setAdditionalEnabledMarkets:](self, "setAdditionalEnabledMarkets:");
  }
  if (v4[329])
  {
    self->_sequenceNumber = *((_DWORD *)v4 + 78);
    *(void *)&self->_flags |= 0x100uLL;
  }
  if (*((void *)v4 + 30)) {
    -[GEODirectionsRequest setSessionState:](self, "setSessionState:");
  }
  if ((v4[329] & 0x10) != 0)
  {
    self->_isFromAPI = v4[325];
    *(void *)&self->_flags |= 0x1000uLL;
  }
  commonOptions = self->_commonOptions;
  uint64_t v45 = *((void *)v4 + 9);
  if (commonOptions)
  {
    if (v45) {
      -[GEOCommonOptions mergeFrom:](commonOptions, "mergeFrom:");
    }
  }
  else if (v45)
  {
    -[GEODirectionsRequest setCommonOptions:](self, "setCommonOptions:");
  }
  if (*((void *)v4 + 16)) {
    -[GEODirectionsRequest setLoggedAbExperiment:](self, "setLoggedAbExperiment:");
  }
  lastKnownRoadLocatiouint64_t n = self->_lastKnownRoadLocation;
  uint64_t v47 = *((void *)v4 + 15);
  if (lastKnownRoadLocation)
  {
    if (v47) {
      -[GEOLocation mergeFrom:](lastKnownRoadLocation, "mergeFrom:");
    }
  }
  else if (v47)
  {
    -[GEODirectionsRequest setLastKnownRoadLocation:](self, "setLastKnownRoadLocation:");
  }
  if (v4[328] < 0)
  {
    self->_originalRoutePurpose = *((_DWORD *)v4 + 77);
    *(void *)&self->_flags |= 0x80uLL;
  }
  abClientMetadata = self->_abClientMetadata;
  uint64_t v49 = *((void *)v4 + 5);
  if (abClientMetadata)
  {
    if (v49) {
      -[GEOPDABClientDatasetMetadata mergeFrom:](abClientMetadata, "mergeFrom:");
    }
  }
  else if (v49)
  {
    -[GEODirectionsRequest setAbClientMetadata:](self, "setAbClientMetadata:");
  }
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v50 = *((id *)v4 + 12);
  uint64_t v51 = [v50 countByEnumeratingWithState:&v89 objects:v112 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v90;
    do
    {
      for (uint64_t n = 0; n != v52; ++n)
      {
        if (*(void *)v90 != v53) {
          objc_enumerationMutation(v50);
        }
        [(GEODirectionsRequest *)self addDeviceHistoricalLocation:*(void *)(*((void *)&v89 + 1) + 8 * n)];
      }
      uint64_t v52 = [v50 countByEnumeratingWithState:&v89 objects:v112 count:16];
    }
    while (v52);
  }

  if ((v4[328] & 0x40) != 0)
  {
    self->_nonRecommendedRoutesOptiouint64_t n = *((_DWORD *)v4 + 76);
    *(void *)&self->_flags |= 0x40uLL;
  }
  if (*((void *)v4 + 17)) {
    [(GEODirectionsRequest *)self setNonRecommendedRoutesCache:"setNonRecommendedRoutesCache:"];
  }
  if ((v4[328] & 0x10) != 0)
  {
    self->_lastEtaDisplayed = *((_DWORD *)v4 + 74);
    *(void *)&self->_flags |= 0x10uLL;
  }
  recentLocationHistory = self->_recentLocationHistory;
  uint64_t v56 = *((void *)v4 + 25);
  if (recentLocationHistory)
  {
    if (v56) {
      -[GEORecentLocationHistory mergeFrom:](recentLocationHistory, "mergeFrom:");
    }
  }
  else if (v56)
  {
    -[GEODirectionsRequest setRecentLocationHistory:](self, "setRecentLocationHistory:");
  }
  privacyMetadata = self->_privacyMetadata;
  uint64_t v58 = *((void *)v4 + 24);
  if (privacyMetadata)
  {
    if (v58) {
      -[GEOPrivacyMetadata mergeFrom:](privacyMetadata, "mergeFrom:");
    }
  }
  else if (v58)
  {
    -[GEODirectionsRequest setPrivacyMetadata:](self, "setPrivacyMetadata:");
  }
  tripInfo = self->_tripInfo;
  uint64_t v60 = *((void *)v4 + 33);
  if (tripInfo)
  {
    if (v60) {
      -[GEOTripInfo mergeFrom:](tripInfo, "mergeFrom:");
    }
  }
  else if (v60)
  {
    -[GEODirectionsRequest setTripInfo:](self, "setTripInfo:");
  }
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v61 = *((id *)v4 + 28);
  uint64_t v62 = [v61 countByEnumeratingWithState:&v85 objects:v111 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = *(void *)v86;
    do
    {
      for (iuint64_t i = 0; ii != v63; ++ii)
      {
        if (*(void *)v86 != v64) {
          objc_enumerationMutation(v61);
        }
        [(GEODirectionsRequest *)self addServiceTag:*(void *)(*((void *)&v85 + 1) + 8 * ii)];
      }
      uint64_t v63 = [v61 countByEnumeratingWithState:&v85 objects:v111 count:16];
    }
    while (v63);
  }

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v66 = *((id *)v4 + 31);
  uint64_t v67 = [v66 countByEnumeratingWithState:&v81 objects:v110 count:16];
  if (v67)
  {
    uint64_t v68 = v67;
    uint64_t v69 = *(void *)v82;
    do
    {
      for (juint64_t j = 0; jj != v68; ++jj)
      {
        if (*(void *)v82 != v69) {
          objc_enumerationMutation(v66);
        }
        [(GEODirectionsRequest *)self addTrafficApiResponses:*(void *)(*((void *)&v81 + 1) + 8 * jj)];
      }
      uint64_t v68 = [v66 countByEnumeratingWithState:&v81 objects:v110 count:16];
    }
    while (v68);
  }

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v71 = *((id *)v4 + 32);
  uint64_t v72 = [v71 countByEnumeratingWithState:&v77 objects:v109 count:16];
  if (v72)
  {
    uint64_t v73 = v72;
    uint64_t v74 = *(void *)v78;
    do
    {
      for (kuint64_t k = 0; kk != v73; ++kk)
      {
        if (*(void *)v78 != v74) {
          objc_enumerationMutation(v71);
        }
        -[GEODirectionsRequest addTrafficSnapshotIds:](self, "addTrafficSnapshotIds:", *(void *)(*((void *)&v77 + 1) + 8 * kk), (void)v77);
      }
      uint64_t v73 = [v71 countByEnumeratingWithState:&v77 objects:v109 count:16];
    }
    while (v73);
  }

  uint64_t v76 = *((void *)v4 + 41);
  if ((v76 & 0x400) != 0)
  {
    self->_trafficSnapshotUnixTime = *((_DWORD *)v4 + 80);
    *(void *)&self->_flags |= 0x400uLL;
    uint64_t v76 = *((void *)v4 + 41);
  }
  if ((v76 & 2) != 0)
  {
    self->_double requestTime = *((double *)v4 + 26);
    *(void *)&self->_flags |= 2uLL;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((unsigned char *)&self->_flags + 1) & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      double v5 = reader;
      objc_sync_enter(v5);
      GEODirectionsRequestReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_16);
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
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40000002000uLL;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEODirectionsRequest *)self readAll:0];
    [(GEORouteAttributes *)self->_routeAttributes clearUnknownFields:1];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v7 = self->_waypointTypeds;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v40;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v39 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v9);
    }

    [(GEOClientFeedbackInfo *)self->_clientFeedbackInfo clearUnknownFields:1];
    [(GEOLocation *)self->_currentUserLocation clearUnknownFields:1];
    [(GEOMapRegion *)self->_currentMapRegion clearUnknownFields:1];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v12 = self->_originalRouteEvInfos;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v36;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v35 + 1) + 8 * v16++) clearUnknownFields:1];
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v14);
    }

    [(GEOOriginalRoute *)self->_originalRoute clearUnknownFields:1];
    [(GEOOriginalWaypointRoute *)self->_originalWaypointRoute clearUnknownFields:1];
    [(GEOClientCapabilities *)self->_clientCapabilities clearUnknownFields:1];
    [(GEODirectionsRequestFeedback *)self->_feedback clearUnknownFields:1];
    [(GEOAdditionalEnabledMarkets *)self->_additionalEnabledMarkets clearUnknownFields:1];
    [(GEOCommonOptions *)self->_commonOptions clearUnknownFields:1];
    [(GEOLocation *)self->_lastKnownRoadLocation clearUnknownFields:1];
    [(GEOPDABClientDatasetMetadata *)self->_abClientMetadata clearUnknownFields:1];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v17 = self->_deviceHistoricalLocations;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v32;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v31 + 1) + 8 * v21++) clearUnknownFields:1];
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
      }
      while (v19);
    }

    [(GEORecentLocationHistory *)self->_recentLocationHistory clearUnknownFields:1];
    [(GEOPrivacyMetadata *)self->_privacyMetadata clearUnknownFields:1];
    [(GEOTripInfo *)self->_tripInfo clearUnknownFields:1];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v22 = self->_serviceTags;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v28;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v28 != v25) {
            objc_enumerationMutation(v22);
          }
          objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v26++), "clearUnknownFields:", 1, (void)v27);
        }
        while (v24 != v26);
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
      }
      while (v24);
    }
  }
}

- (double)requestTime
{
  return self->_requestTime;
}

- (void)setRequestTime:(double)a3
{
  *(void *)&self->_flags |= 0x40000000002uLL;
  self->_double requestTime = a3;
}

- (void)setHasRequestTime:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000000002;
  }
  self->_$1FEE565F87D5293053496F1336AD4F5E flags = ($1FEE565F87D5293053496F1336AD4F5E)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasRequestTime
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointTypeds, 0);
  objc_storeStrong((id *)&self->_tripInfo, 0);
  objc_storeStrong((id *)&self->_trafficSnapshotIds, 0);
  objc_storeStrong((id *)&self->_trafficApiResponses, 0);
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_storeStrong((id *)&self->_serviceTags, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_recentLocationHistory, 0);
  objc_storeStrong((id *)&self->_privacyMetadata, 0);
  objc_storeStrong((id *)&self->_originalWaypointRoute, 0);
  objc_storeStrong((id *)&self->_originalRouteEvInfos, 0);
  objc_storeStrong((id *)&self->_originalRoute, 0);
  objc_storeStrong((id *)&self->_originalRouteZilchPoints, 0);
  objc_storeStrong((id *)&self->_originalRouteID, 0);
  objc_storeStrong((id *)&self->_originalDirectionsResponseID, 0);
  objc_storeStrong((id *)&self->_nonRecommendedRoutesCache, 0);
  objc_storeStrong((id *)&self->_loggedAbExperiment, 0);
  objc_storeStrong((id *)&self->_lastKnownRoadLocation, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong((id *)&self->_displayedBannerIds, 0);
  objc_storeStrong((id *)&self->_deviceHistoricalLocations, 0);
  objc_storeStrong((id *)&self->_currentUserLocation, 0);
  objc_storeStrong((id *)&self->_currentMapRegion, 0);
  objc_storeStrong((id *)&self->_commonOptions, 0);
  objc_storeStrong((id *)&self->_clientFeedbackInfo, 0);
  objc_storeStrong((id *)&self->_clientCapabilities, 0);
  objc_storeStrong((id *)&self->_additionalEnabledMarkets, 0);
  objc_storeStrong((id *)&self->_abClientMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)clearSessionId
{
  if ([(GEODirectionsRequest *)self hasSessionID])
  {
    -[GEODirectionsRequest setSessionID:](self, "setSessionID:", 0, 0);
    [(GEODirectionsRequest *)self setHasSessionID:0];
  }
}

- (void)clearLocations
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(GEODirectionsRequest *)self setDeviceHistoricalLocations:0];
  [(GEODirectionsRequest *)self setCurrentUserLocation:0];
  [(GEODirectionsRequest *)self setDeviceHistoricalLocations:0];
  uint64_t v3 = [(GEODirectionsRequest *)self waypointTypeds];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    double v5 = objc_opt_new();
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [(GEODirectionsRequest *)self waypointTypeds];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = (void *)[*(id *)(*((void *)&v12 + 1) + 8 * v10) copy];
          [v11 clearLocations];
          [v5 addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    [(GEODirectionsRequest *)self setWaypointTypeds:v5];
  }
}

@end