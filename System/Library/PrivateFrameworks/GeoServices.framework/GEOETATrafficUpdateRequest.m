@interface GEOETATrafficUpdateRequest
+ (BOOL)isValid:(id)a3;
+ (Class)destinationWaypointTypedType;
+ (Class)displayedBannerIdType;
+ (Class)routeType;
+ (Class)serviceTagType;
+ (Class)trafficApiResponsesType;
+ (Class)trafficSnapshotIdsType;
+ (Class)waypointTypedType;
- (BOOL)hasAbClientMetadata;
- (BOOL)hasAdditionalEnabledMarkets;
- (BOOL)hasClientCapabilities;
- (BOOL)hasClientFeedbackInfo;
- (BOOL)hasCommonOptions;
- (BOOL)hasCurrentUserLocation;
- (BOOL)hasDirectionsResponseID;
- (BOOL)hasDisplayedEta;
- (BOOL)hasEtauResponseID;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIncludeBetterRouteSuggestion;
- (BOOL)hasMaxAlternateRouteCount;
- (BOOL)hasPreviouslyRejectedRerouteSavings;
- (BOOL)hasPrivacyMetadata;
- (BOOL)hasPurpose;
- (BOOL)hasRecentLocationHistory;
- (BOOL)hasRequestingAppId;
- (BOOL)hasRerouteStatus;
- (BOOL)hasRouteAttributes;
- (BOOL)hasSessionID;
- (BOOL)hasSessionRelativeTimestamp;
- (BOOL)hasSessionState;
- (BOOL)hasTrafficSnapshotUnixTime;
- (BOOL)hasTripID;
- (BOOL)hasTripInfo;
- (BOOL)hasTripOrigin;
- (BOOL)hasWaypointRoute;
- (BOOL)hasXpcUuid;
- (BOOL)includeBetterRouteSuggestion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (GEOAdditionalEnabledMarkets)additionalEnabledMarkets;
- (GEOClientCapabilities)clientCapabilities;
- (GEOClientFeedbackInfo)clientFeedbackInfo;
- (GEOCommonOptions)commonOptions;
- (GEOETATrafficUpdateRequest)init;
- (GEOETATrafficUpdateRequest)initWithData:(id)a3;
- (GEOETATrafficUpdateRequest)initWithDictionary:(id)a3;
- (GEOETATrafficUpdateRequest)initWithJSON:(id)a3;
- (GEOETATrafficUpdateWaypointRoute)waypointRoute;
- (GEOLocation)currentUserLocation;
- (GEOLocation)tripOrigin;
- (GEOPDABClientDatasetMetadata)abClientMetadata;
- (GEOPrivacyMetadata)privacyMetadata;
- (GEORecentLocationHistory)recentLocationHistory;
- (GEORouteAttributes)routeAttributes;
- (GEOSessionID)sessionID;
- (GEOTripInfo)tripInfo;
- (NSData)directionsResponseID;
- (NSData)etauResponseID;
- (NSData)sessionState;
- (NSData)tripID;
- (NSMutableArray)destinationWaypointTypeds;
- (NSMutableArray)displayedBannerIds;
- (NSMutableArray)routes;
- (NSMutableArray)serviceTags;
- (NSMutableArray)trafficApiResponses;
- (NSMutableArray)trafficSnapshotIds;
- (NSMutableArray)waypointTypeds;
- (NSString)requestingAppId;
- (NSString)xpcUuid;
- (PBUnknownFields)unknownFields;
- (double)sessionRelativeTimestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)destinationWaypointTypedAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)displayedBannerIdAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)purposeAsString:(int)a3;
- (id)rerouteStatusAsString:(int)a3;
- (id)routeAtIndex:(unint64_t)a3;
- (id)serviceTagAtIndex:(unint64_t)a3;
- (id)trafficApiResponsesAtIndex:(unint64_t)a3;
- (id)trafficSnapshotIdsAtIndex:(unint64_t)a3;
- (id)waypointTypedAtIndex:(unint64_t)a3;
- (int)StringAsPurpose:(id)a3;
- (int)StringAsRerouteStatus:(id)a3;
- (int)purpose;
- (int)rerouteStatus;
- (unint64_t)destinationWaypointTypedsCount;
- (unint64_t)displayedBannerIdsCount;
- (unint64_t)hash;
- (unint64_t)routesCount;
- (unint64_t)serviceTagsCount;
- (unint64_t)trafficApiResponsesCount;
- (unint64_t)trafficSnapshotIdsCount;
- (unint64_t)waypointTypedsCount;
- (unsigned)displayedEta;
- (unsigned)maxAlternateRouteCount;
- (unsigned)previouslyRejectedRerouteSavings;
- (unsigned)requestTypeCode;
- (unsigned)trafficSnapshotUnixTime;
- (void)_addNoFlagsDestinationWaypointTyped:(uint64_t)a1;
- (void)_addNoFlagsDisplayedBannerId:(uint64_t)a1;
- (void)_addNoFlagsRoute:(uint64_t)a1;
- (void)_addNoFlagsServiceTag:(uint64_t)a1;
- (void)_addNoFlagsTrafficApiResponses:(uint64_t)a1;
- (void)_addNoFlagsTrafficSnapshotIds:(uint64_t)a1;
- (void)_addNoFlagsWaypointTyped:(uint64_t)a1;
- (void)_readAbClientMetadata;
- (void)_readAdditionalEnabledMarkets;
- (void)_readClientCapabilities;
- (void)_readClientFeedbackInfo;
- (void)_readCommonOptions;
- (void)_readCurrentUserLocation;
- (void)_readDestinationWaypointTypeds;
- (void)_readDirectionsResponseID;
- (void)_readDisplayedBannerIds;
- (void)_readEtauResponseID;
- (void)_readPrivacyMetadata;
- (void)_readRecentLocationHistory;
- (void)_readRequestingAppId;
- (void)_readRouteAttributes;
- (void)_readRoutes;
- (void)_readServiceTags;
- (void)_readSessionState;
- (void)_readTrafficApiResponses;
- (void)_readTrafficSnapshotIds;
- (void)_readTripID;
- (void)_readTripInfo;
- (void)_readTripOrigin;
- (void)_readWaypointRoute;
- (void)_readWaypointTypeds;
- (void)_readXpcUuid;
- (void)addDestinationWaypointTyped:(id)a3;
- (void)addDisplayedBannerId:(id)a3;
- (void)addRoute:(id)a3;
- (void)addServiceTag:(id)a3;
- (void)addTrafficApiResponses:(id)a3;
- (void)addTrafficSnapshotIds:(id)a3;
- (void)addWaypointTyped:(id)a3;
- (void)clearDestinationWaypointTypeds;
- (void)clearDisplayedBannerIds;
- (void)clearRoutes;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearServiceTags;
- (void)clearTrafficApiResponses;
- (void)clearTrafficSnapshotIds;
- (void)clearUnknownFields:(BOOL)a3;
- (void)clearWaypointTypeds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAbClientMetadata:(id)a3;
- (void)setAdditionalEnabledMarkets:(id)a3;
- (void)setClientCapabilities:(id)a3;
- (void)setClientFeedbackInfo:(id)a3;
- (void)setCommonOptions:(id)a3;
- (void)setCurrentUserLocation:(id)a3;
- (void)setDestinationWaypointTypeds:(id)a3;
- (void)setDirectionsResponseID:(id)a3;
- (void)setDisplayedBannerIds:(id)a3;
- (void)setDisplayedEta:(unsigned int)a3;
- (void)setEtauResponseID:(id)a3;
- (void)setHasDisplayedEta:(BOOL)a3;
- (void)setHasIncludeBetterRouteSuggestion:(BOOL)a3;
- (void)setHasMaxAlternateRouteCount:(BOOL)a3;
- (void)setHasPreviouslyRejectedRerouteSavings:(BOOL)a3;
- (void)setHasPurpose:(BOOL)a3;
- (void)setHasRerouteStatus:(BOOL)a3;
- (void)setHasSessionID:(BOOL)a3;
- (void)setHasSessionRelativeTimestamp:(BOOL)a3;
- (void)setHasTrafficSnapshotUnixTime:(BOOL)a3;
- (void)setIncludeBetterRouteSuggestion:(BOOL)a3;
- (void)setMaxAlternateRouteCount:(unsigned int)a3;
- (void)setPreviouslyRejectedRerouteSavings:(unsigned int)a3;
- (void)setPrivacyMetadata:(id)a3;
- (void)setPurpose:(int)a3;
- (void)setRecentLocationHistory:(id)a3;
- (void)setRequestingAppId:(id)a3;
- (void)setRerouteStatus:(int)a3;
- (void)setRouteAttributes:(id)a3;
- (void)setRoutes:(id)a3;
- (void)setServiceTags:(id)a3;
- (void)setSessionID:(GEOSessionID)a3;
- (void)setSessionRelativeTimestamp:(double)a3;
- (void)setSessionState:(id)a3;
- (void)setTrafficApiResponses:(id)a3;
- (void)setTrafficSnapshotIds:(id)a3;
- (void)setTrafficSnapshotUnixTime:(unsigned int)a3;
- (void)setTripID:(id)a3;
- (void)setTripInfo:(id)a3;
- (void)setTripOrigin:(id)a3;
- (void)setWaypointRoute:(id)a3;
- (void)setWaypointTypeds:(id)a3;
- (void)setXpcUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOETATrafficUpdateRequest

- (GEOETATrafficUpdateRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOETATrafficUpdateRequest;
  v2 = [(GEOETATrafficUpdateRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOETATrafficUpdateRequest)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOETATrafficUpdateRequest;
  v3 = [(GEOETATrafficUpdateRequest *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCurrentUserLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 289) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCurrentUserLocation_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasCurrentUserLocation
{
  return self->_currentUserLocation != 0;
}

- (GEOLocation)currentUserLocation
{
  -[GEOETATrafficUpdateRequest _readCurrentUserLocation]((uint64_t)self);
  currentUserLocation = self->_currentUserLocation;

  return currentUserLocation;
}

- (void)setCurrentUserLocation:(id)a3
{
  *(void *)&self->_flags |= 0x800008000uLL;
  objc_storeStrong((id *)&self->_currentUserLocation, a3);
}

- (void)_readRouteAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 290) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteAttributes_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasRouteAttributes
{
  return self->_routeAttributes != 0;
}

- (GEORouteAttributes)routeAttributes
{
  -[GEOETATrafficUpdateRequest _readRouteAttributes]((uint64_t)self);
  routeAttributes = self->_routeAttributes;

  return routeAttributes;
}

- (void)setRouteAttributes:(id)a3
{
  *(void *)&self->_flags |= 0x800800000uLL;
  objc_storeStrong((id *)&self->_routeAttributes, a3);
}

- (BOOL)includeBetterRouteSuggestion
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $A9051F91FD5D6DAB60BDAAD82EC423D1 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x100) == 0 || self->_includeBetterRouteSuggestion;
}

- (void)setIncludeBetterRouteSuggestion:(BOOL)a3
{
  *(void *)&self->_flags |= 0x800000100uLL;
  self->_includeBetterRouteSuggestion = a3;
}

- (void)setHasIncludeBetterRouteSuggestion:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (a3) {
    uint64_t v3 = 0x800000100;
  }
  self->_$A9051F91FD5D6DAB60BDAAD82EC423D1 flags = ($A9051F91FD5D6DAB60BDAAD82EC423D1)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasIncludeBetterRouteSuggestion
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (void)_readRoutes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 291) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRoutes_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (NSMutableArray)routes
{
  -[GEOETATrafficUpdateRequest _readRoutes]((uint64_t)self);
  routes = self->_routes;

  return routes;
}

- (void)setRoutes:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000uLL;
  routes = self->_routes;
  self->_routes = v4;
}

- (void)clearRoutes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000uLL;
  routes = self->_routes;

  [(NSMutableArray *)routes removeAllObjects];
}

- (void)addRoute:(id)a3
{
  id v4 = a3;
  -[GEOETATrafficUpdateRequest _readRoutes]((uint64_t)self);
  -[GEOETATrafficUpdateRequest _addNoFlagsRoute:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000uLL;
}

- (void)_addNoFlagsRoute:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 152);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 152);
      *(void *)(a1 + 152) = v5;

      id v4 = *(void **)(a1 + 152);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)routesCount
{
  -[GEOETATrafficUpdateRequest _readRoutes]((uint64_t)self);
  routes = self->_routes;

  return [(NSMutableArray *)routes count];
}

- (id)routeAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateRequest _readRoutes]((uint64_t)self);
  routes = self->_routes;

  return (id)[(NSMutableArray *)routes objectAtIndex:a3];
}

+ (Class)routeType
{
  return (Class)objc_opt_class();
}

- (void)_readWaypointRoute
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 292) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWaypointRoute_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasWaypointRoute
{
  return self->_waypointRoute != 0;
}

- (GEOETATrafficUpdateWaypointRoute)waypointRoute
{
  -[GEOETATrafficUpdateRequest _readWaypointRoute]((uint64_t)self);
  waypointRoute = self->_waypointRoute;

  return waypointRoute;
}

- (void)setWaypointRoute:(id)a3
{
  *(void *)&self->_flags |= 0x900000000uLL;
  objc_storeStrong((id *)&self->_waypointRoute, a3);
}

- (void)_readClientCapabilities
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 289) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientCapabilities_tags_1380);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasClientCapabilities
{
  return self->_clientCapabilities != 0;
}

- (GEOClientCapabilities)clientCapabilities
{
  -[GEOETATrafficUpdateRequest _readClientCapabilities]((uint64_t)self);
  clientCapabilities = self->_clientCapabilities;

  return clientCapabilities;
}

- (void)setClientCapabilities:(id)a3
{
  *(void *)&self->_flags |= 0x800001000uLL;
  objc_storeStrong((id *)&self->_clientCapabilities, a3);
}

- (void)_readDirectionsResponseID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 290) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsResponseID_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasDirectionsResponseID
{
  return self->_directionsResponseID != 0;
}

- (NSData)directionsResponseID
{
  -[GEOETATrafficUpdateRequest _readDirectionsResponseID]((uint64_t)self);
  directionsResponseID = self->_directionsResponseID;

  return directionsResponseID;
}

- (void)setDirectionsResponseID:(id)a3
{
  *(void *)&self->_flags |= 0x800020000uLL;
  objc_storeStrong((id *)&self->_directionsResponseID, a3);
}

- (void)_readEtauResponseID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 290) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEtauResponseID_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasEtauResponseID
{
  return self->_etauResponseID != 0;
}

- (NSData)etauResponseID
{
  -[GEOETATrafficUpdateRequest _readEtauResponseID]((uint64_t)self);
  etauResponseID = self->_etauResponseID;

  return etauResponseID;
}

- (void)setEtauResponseID:(id)a3
{
  *(void *)&self->_flags |= 0x800080000uLL;
  objc_storeStrong((id *)&self->_etauResponseID, a3);
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
  *(void *)&self->_flags |= 0x800000001uLL;
  self->_sessionID = a3;
}

- (void)setHasSessionID:(BOOL)a3
{
  self->_$A9051F91FD5D6DAB60BDAAD82EC423D1 flags = ($A9051F91FD5D6DAB60BDAAD82EC423D1)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x800000000);
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
  *(void *)&self->_flags |= 0x800000002uLL;
  self->_sessionRelativeTimestamp = a3;
}

- (void)setHasSessionRelativeTimestamp:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (a3) {
    uint64_t v3 = 0x800000002;
  }
  self->_$A9051F91FD5D6DAB60BDAAD82EC423D1 flags = ($A9051F91FD5D6DAB60BDAAD82EC423D1)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasSessionRelativeTimestamp
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readAdditionalEnabledMarkets
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 289) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAdditionalEnabledMarkets_tags_1381);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasAdditionalEnabledMarkets
{
  return self->_additionalEnabledMarkets != 0;
}

- (GEOAdditionalEnabledMarkets)additionalEnabledMarkets
{
  -[GEOETATrafficUpdateRequest _readAdditionalEnabledMarkets]((uint64_t)self);
  additionalEnabledMarkets = self->_additionalEnabledMarkets;

  return additionalEnabledMarkets;
}

- (void)setAdditionalEnabledMarkets:(id)a3
{
  *(void *)&self->_flags |= 0x800000800uLL;
  objc_storeStrong((id *)&self->_additionalEnabledMarkets, a3);
}

- (void)_readDestinationWaypointTypeds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 290) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDestinationWaypointTypeds_tags_1382);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (NSMutableArray)destinationWaypointTypeds
{
  -[GEOETATrafficUpdateRequest _readDestinationWaypointTypeds]((uint64_t)self);
  destinationWaypointTypeds = self->_destinationWaypointTypeds;

  return destinationWaypointTypeds;
}

- (void)setDestinationWaypointTypeds:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000uLL;
  destinationWaypointTypeds = self->_destinationWaypointTypeds;
  self->_destinationWaypointTypeds = v4;
}

- (void)clearDestinationWaypointTypeds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000uLL;
  destinationWaypointTypeds = self->_destinationWaypointTypeds;

  [(NSMutableArray *)destinationWaypointTypeds removeAllObjects];
}

- (void)addDestinationWaypointTyped:(id)a3
{
  id v4 = a3;
  -[GEOETATrafficUpdateRequest _readDestinationWaypointTypeds]((uint64_t)self);
  -[GEOETATrafficUpdateRequest _addNoFlagsDestinationWaypointTyped:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000uLL;
}

- (void)_addNoFlagsDestinationWaypointTyped:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 88);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v5;

      id v4 = *(void **)(a1 + 88);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)destinationWaypointTypedsCount
{
  -[GEOETATrafficUpdateRequest _readDestinationWaypointTypeds]((uint64_t)self);
  destinationWaypointTypeds = self->_destinationWaypointTypeds;

  return [(NSMutableArray *)destinationWaypointTypeds count];
}

- (id)destinationWaypointTypedAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateRequest _readDestinationWaypointTypeds]((uint64_t)self);
  destinationWaypointTypeds = self->_destinationWaypointTypeds;

  return (id)[(NSMutableArray *)destinationWaypointTypeds objectAtIndex:a3];
}

+ (Class)destinationWaypointTypedType
{
  return (Class)objc_opt_class();
}

- (void)_readWaypointTypeds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 292) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWaypointTypeds_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (NSMutableArray)waypointTypeds
{
  -[GEOETATrafficUpdateRequest _readWaypointTypeds]((uint64_t)self);
  waypointTypeds = self->_waypointTypeds;

  return waypointTypeds;
}

- (void)setWaypointTypeds:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000uLL;
  waypointTypeds = self->_waypointTypeds;
  self->_waypointTypeds = v4;
}

- (void)clearWaypointTypeds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000uLL;
  waypointTypeds = self->_waypointTypeds;

  [(NSMutableArray *)waypointTypeds removeAllObjects];
}

- (void)addWaypointTyped:(id)a3
{
  id v4 = a3;
  -[GEOETATrafficUpdateRequest _readWaypointTypeds]((uint64_t)self);
  -[GEOETATrafficUpdateRequest _addNoFlagsWaypointTyped:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000uLL;
}

- (void)_addNoFlagsWaypointTyped:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 232);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 232);
      *(void *)(a1 + 232) = v5;

      id v4 = *(void **)(a1 + 232);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)waypointTypedsCount
{
  -[GEOETATrafficUpdateRequest _readWaypointTypeds]((uint64_t)self);
  waypointTypeds = self->_waypointTypeds;

  return [(NSMutableArray *)waypointTypeds count];
}

- (id)waypointTypedAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateRequest _readWaypointTypeds]((uint64_t)self);
  waypointTypeds = self->_waypointTypeds;

  return (id)[(NSMutableArray *)waypointTypeds objectAtIndex:a3];
}

+ (Class)waypointTypedType
{
  return (Class)objc_opt_class();
}

- (unsigned)previouslyRejectedRerouteSavings
{
  return self->_previouslyRejectedRerouteSavings;
}

- (void)setPreviouslyRejectedRerouteSavings:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x800000010uLL;
  self->_previouslyRejectedRerouteSavings = a3;
}

- (void)setHasPreviouslyRejectedRerouteSavings:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (a3) {
    uint64_t v3 = 0x800000010;
  }
  self->_$A9051F91FD5D6DAB60BDAAD82EC423D1 flags = ($A9051F91FD5D6DAB60BDAAD82EC423D1)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasPreviouslyRejectedRerouteSavings
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (void)_readSessionState
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 291) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSessionState_tags_1383);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasSessionState
{
  return self->_sessionState != 0;
}

- (NSData)sessionState
{
  -[GEOETATrafficUpdateRequest _readSessionState]((uint64_t)self);
  sessionState = self->_sessionState;

  return sessionState;
}

- (void)setSessionState:(id)a3
{
  *(void *)&self->_flags |= 0x804000000uLL;
  objc_storeStrong((id *)&self->_sessionState, a3);
}

- (int)rerouteStatus
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $A9051F91FD5D6DAB60BDAAD82EC423D1 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x40) != 0) {
    return self->_rerouteStatus;
  }
  else {
    return 0;
  }
}

- (void)setRerouteStatus:(int)a3
{
  *(void *)&self->_flags |= 0x800000040uLL;
  self->_rerouteStatus = a3;
}

- (void)setHasRerouteStatus:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (a3) {
    uint64_t v3 = 0x800000040;
  }
  self->_$A9051F91FD5D6DAB60BDAAD82EC423D1 flags = ($A9051F91FD5D6DAB60BDAAD82EC423D1)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasRerouteStatus
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (id)rerouteStatusAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53F7360[a3];
  }

  return v3;
}

- (int)StringAsRerouteStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"REROUTE_INACTIVE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"REROUTE_PROPOSED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"REROUTE_DECLINED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"REROUTE_REJECTED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"REROUTE_ACCEPTED"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readCommonOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 289) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCommonOptions_tags_1384);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasCommonOptions
{
  return self->_commonOptions != 0;
}

- (GEOCommonOptions)commonOptions
{
  -[GEOETATrafficUpdateRequest _readCommonOptions]((uint64_t)self);
  commonOptions = self->_commonOptions;

  return commonOptions;
}

- (void)setCommonOptions:(id)a3
{
  *(void *)&self->_flags |= 0x800004000uLL;
  objc_storeStrong((id *)&self->_commonOptions, a3);
}

- (void)_readAbClientMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 289) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAbClientMetadata_tags_1385);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasAbClientMetadata
{
  return self->_abClientMetadata != 0;
}

- (GEOPDABClientDatasetMetadata)abClientMetadata
{
  -[GEOETATrafficUpdateRequest _readAbClientMetadata]((uint64_t)self);
  abClientMetadata = self->_abClientMetadata;

  return abClientMetadata;
}

- (void)setAbClientMetadata:(id)a3
{
  *(void *)&self->_flags |= 0x800000400uLL;
  objc_storeStrong((id *)&self->_abClientMetadata, a3);
}

- (unsigned)maxAlternateRouteCount
{
  return self->_maxAlternateRouteCount;
}

- (void)setMaxAlternateRouteCount:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x800000008uLL;
  self->_maxAlternateRouteCount = a3;
}

- (void)setHasMaxAlternateRouteCount:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (a3) {
    uint64_t v3 = 0x800000008;
  }
  self->_$A9051F91FD5D6DAB60BDAAD82EC423D1 flags = ($A9051F91FD5D6DAB60BDAAD82EC423D1)(*(void *)&self->_flags & 0xFFFFFFF7FFFFFFF7 | v3);
}

- (BOOL)hasMaxAlternateRouteCount
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (void)_readTripID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 291) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTripID_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasTripID
{
  return self->_tripID != 0;
}

- (NSData)tripID
{
  -[GEOETATrafficUpdateRequest _readTripID]((uint64_t)self);
  tripID = self->_tripID;

  return tripID;
}

- (void)setTripID:(id)a3
{
  *(void *)&self->_flags |= 0x820000000uLL;
  objc_storeStrong((id *)&self->_tripID, a3);
}

- (void)_readRequestingAppId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 290) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRequestingAppId_tags_1386);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasRequestingAppId
{
  return self->_requestingAppId != 0;
}

- (NSString)requestingAppId
{
  -[GEOETATrafficUpdateRequest _readRequestingAppId]((uint64_t)self);
  requestingAppId = self->_requestingAppId;

  return requestingAppId;
}

- (void)setRequestingAppId:(id)a3
{
  *(void *)&self->_flags |= 0x800400000uLL;
  objc_storeStrong((id *)&self->_requestingAppId, a3);
}

- (void)_readTripOrigin
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 291) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTripOrigin_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasTripOrigin
{
  return self->_tripOrigin != 0;
}

- (GEOLocation)tripOrigin
{
  -[GEOETATrafficUpdateRequest _readTripOrigin]((uint64_t)self);
  tripOrigin = self->_tripOrigin;

  return tripOrigin;
}

- (void)setTripOrigin:(id)a3
{
  *(void *)&self->_flags |= 0x880000000uLL;
  objc_storeStrong((id *)&self->_tripOrigin, a3);
}

- (void)_readDisplayedBannerIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 290) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayedBannerIds_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (NSMutableArray)displayedBannerIds
{
  -[GEOETATrafficUpdateRequest _readDisplayedBannerIds]((uint64_t)self);
  displayedBannerIds = self->_displayedBannerIds;

  return displayedBannerIds;
}

- (void)setDisplayedBannerIds:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000uLL;
  displayedBannerIds = self->_displayedBannerIds;
  self->_displayedBannerIds = v4;
}

- (void)clearDisplayedBannerIds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000uLL;
  displayedBannerIds = self->_displayedBannerIds;

  [(NSMutableArray *)displayedBannerIds removeAllObjects];
}

- (void)addDisplayedBannerId:(id)a3
{
  id v4 = a3;
  -[GEOETATrafficUpdateRequest _readDisplayedBannerIds]((uint64_t)self);
  -[GEOETATrafficUpdateRequest _addNoFlagsDisplayedBannerId:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000uLL;
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
  -[GEOETATrafficUpdateRequest _readDisplayedBannerIds]((uint64_t)self);
  displayedBannerIds = self->_displayedBannerIds;

  return [(NSMutableArray *)displayedBannerIds count];
}

- (id)displayedBannerIdAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateRequest _readDisplayedBannerIds]((uint64_t)self);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 289) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientFeedbackInfo_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasClientFeedbackInfo
{
  return self->_clientFeedbackInfo != 0;
}

- (GEOClientFeedbackInfo)clientFeedbackInfo
{
  -[GEOETATrafficUpdateRequest _readClientFeedbackInfo]((uint64_t)self);
  clientFeedbackInfo = self->_clientFeedbackInfo;

  return clientFeedbackInfo;
}

- (void)setClientFeedbackInfo:(id)a3
{
  *(void *)&self->_flags |= 0x800002000uLL;
  objc_storeStrong((id *)&self->_clientFeedbackInfo, a3);
}

- (void)_readRecentLocationHistory
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 290) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRecentLocationHistory_tags_1387);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasRecentLocationHistory
{
  return self->_recentLocationHistory != 0;
}

- (GEORecentLocationHistory)recentLocationHistory
{
  -[GEOETATrafficUpdateRequest _readRecentLocationHistory]((uint64_t)self);
  recentLocationHistory = self->_recentLocationHistory;

  return recentLocationHistory;
}

- (void)setRecentLocationHistory:(id)a3
{
  *(void *)&self->_flags |= 0x800200000uLL;
  objc_storeStrong((id *)&self->_recentLocationHistory, a3);
}

- (void)_readPrivacyMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 290) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPrivacyMetadata_tags_1388);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasPrivacyMetadata
{
  return self->_privacyMetadata != 0;
}

- (GEOPrivacyMetadata)privacyMetadata
{
  -[GEOETATrafficUpdateRequest _readPrivacyMetadata]((uint64_t)self);
  privacyMetadata = self->_privacyMetadata;

  return privacyMetadata;
}

- (void)setPrivacyMetadata:(id)a3
{
  *(void *)&self->_flags |= 0x800100000uLL;
  objc_storeStrong((id *)&self->_privacyMetadata, a3);
}

- (unsigned)displayedEta
{
  return self->_displayedEta;
}

- (void)setDisplayedEta:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x800000004uLL;
  self->_displayedEta = a3;
}

- (void)setHasDisplayedEta:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (a3) {
    uint64_t v3 = 0x800000004;
  }
  self->_$A9051F91FD5D6DAB60BDAAD82EC423D1 flags = ($A9051F91FD5D6DAB60BDAAD82EC423D1)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasDisplayedEta
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readTripInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 291) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTripInfo_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasTripInfo
{
  return self->_tripInfo != 0;
}

- (GEOTripInfo)tripInfo
{
  -[GEOETATrafficUpdateRequest _readTripInfo]((uint64_t)self);
  tripInfo = self->_tripInfo;

  return tripInfo;
}

- (void)setTripInfo:(id)a3
{
  *(void *)&self->_flags |= 0x840000000uLL;
  objc_storeStrong((id *)&self->_tripInfo, a3);
}

- (int)purpose
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $A9051F91FD5D6DAB60BDAAD82EC423D1 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x20) != 0) {
    return self->_purpose;
  }
  else {
    return 0;
  }
}

- (void)setPurpose:(int)a3
{
  *(void *)&self->_flags |= 0x800000020uLL;
  self->_purpose = a3;
}

- (void)setHasPurpose:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (a3) {
    uint64_t v3 = 0x800000020;
  }
  self->_$A9051F91FD5D6DAB60BDAAD82EC423D1 flags = ($A9051F91FD5D6DAB60BDAAD82EC423D1)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasPurpose
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (id)purposeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53F7388[a3];
  }

  return v3;
}

- (int)StringAsPurpose:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PURPOSE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"REGULAR_ETA_UPDATE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SERVER_INITIATED_ETA_UPDATE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"USER_ABORTED_TRIP"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"USER_PAUSED_TRIP_AT_WAYPOINT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"USER_COMPLETED_TRIP"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"USER_ADVANCED_TO_NEXT_LEG"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readServiceTags
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 291) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readServiceTags_tags_1389);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (NSMutableArray)serviceTags
{
  -[GEOETATrafficUpdateRequest _readServiceTags]((uint64_t)self);
  serviceTags = self->_serviceTags;

  return serviceTags;
}

- (void)setServiceTags:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000uLL;
  serviceTags = self->_serviceTags;
  self->_serviceTags = v4;
}

- (void)clearServiceTags
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000uLL;
  serviceTags = self->_serviceTags;

  [(NSMutableArray *)serviceTags removeAllObjects];
}

- (void)addServiceTag:(id)a3
{
  id v4 = a3;
  -[GEOETATrafficUpdateRequest _readServiceTags]((uint64_t)self);
  -[GEOETATrafficUpdateRequest _addNoFlagsServiceTag:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000uLL;
}

- (void)_addNoFlagsServiceTag:(uint64_t)a1
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

- (unint64_t)serviceTagsCount
{
  -[GEOETATrafficUpdateRequest _readServiceTags]((uint64_t)self);
  serviceTags = self->_serviceTags;

  return [(NSMutableArray *)serviceTags count];
}

- (id)serviceTagAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateRequest _readServiceTags]((uint64_t)self);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 291) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrafficApiResponses_tags_1390);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (NSMutableArray)trafficApiResponses
{
  -[GEOETATrafficUpdateRequest _readTrafficApiResponses]((uint64_t)self);
  trafficApiResponses = self->_trafficApiResponses;

  return trafficApiResponses;
}

- (void)setTrafficApiResponses:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000uLL;
  trafficApiResponses = self->_trafficApiResponses;
  self->_trafficApiResponses = v4;
}

- (void)clearTrafficApiResponses
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000uLL;
  trafficApiResponses = self->_trafficApiResponses;

  [(NSMutableArray *)trafficApiResponses removeAllObjects];
}

- (void)addTrafficApiResponses:(id)a3
{
  id v4 = a3;
  -[GEOETATrafficUpdateRequest _readTrafficApiResponses]((uint64_t)self);
  -[GEOETATrafficUpdateRequest _addNoFlagsTrafficApiResponses:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000uLL;
}

- (void)_addNoFlagsTrafficApiResponses:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 184);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 184);
      *(void *)(a1 + 184) = v5;

      id v4 = *(void **)(a1 + 184);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)trafficApiResponsesCount
{
  -[GEOETATrafficUpdateRequest _readTrafficApiResponses]((uint64_t)self);
  trafficApiResponses = self->_trafficApiResponses;

  return [(NSMutableArray *)trafficApiResponses count];
}

- (id)trafficApiResponsesAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateRequest _readTrafficApiResponses]((uint64_t)self);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 291) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrafficSnapshotIds_tags_1391);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (NSMutableArray)trafficSnapshotIds
{
  -[GEOETATrafficUpdateRequest _readTrafficSnapshotIds]((uint64_t)self);
  trafficSnapshotIds = self->_trafficSnapshotIds;

  return trafficSnapshotIds;
}

- (void)setTrafficSnapshotIds:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000uLL;
  trafficSnapshotIds = self->_trafficSnapshotIds;
  self->_trafficSnapshotIds = v4;
}

- (void)clearTrafficSnapshotIds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000uLL;
  trafficSnapshotIds = self->_trafficSnapshotIds;

  [(NSMutableArray *)trafficSnapshotIds removeAllObjects];
}

- (void)addTrafficSnapshotIds:(id)a3
{
  id v4 = a3;
  -[GEOETATrafficUpdateRequest _readTrafficSnapshotIds]((uint64_t)self);
  -[GEOETATrafficUpdateRequest _addNoFlagsTrafficSnapshotIds:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000uLL;
}

- (void)_addNoFlagsTrafficSnapshotIds:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 192);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 192);
      *(void *)(a1 + 192) = v5;

      id v4 = *(void **)(a1 + 192);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)trafficSnapshotIdsCount
{
  -[GEOETATrafficUpdateRequest _readTrafficSnapshotIds]((uint64_t)self);
  trafficSnapshotIds = self->_trafficSnapshotIds;

  return [(NSMutableArray *)trafficSnapshotIds count];
}

- (id)trafficSnapshotIdsAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateRequest _readTrafficSnapshotIds]((uint64_t)self);
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
  *(void *)&self->_flags |= 0x800000080uLL;
  self->_trafficSnapshotUnixTime = a3;
}

- (void)setHasTrafficSnapshotUnixTime:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (a3) {
    uint64_t v3 = 0x800000080;
  }
  self->_$A9051F91FD5D6DAB60BDAAD82EC423D1 flags = ($A9051F91FD5D6DAB60BDAAD82EC423D1)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasTrafficSnapshotUnixTime
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOETATrafficUpdateRequest;
  id v4 = [(GEOETATrafficUpdateRequest *)&v8 description];
  id v5 = [(GEOETATrafficUpdateRequest *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOETATrafficUpdateRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v173 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 currentUserLocation];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      id v7 = [v5 dictionaryRepresentation];
      }

      [v4 setObject:v7 forKey:@"currentUserLocation"];
    }

    objc_super v8 = [(id)a1 routeAttributes];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      id v10 = [v8 dictionaryRepresentation];
      }

      [v4 setObject:v10 forKey:@"routeAttributes"];
    }

    v11 = &OBJC_IVAR___GEORPFeedbackComponent__unknownFields;
    unint64_t v12 = 0x1E4F28000uLL;
    if (*(unsigned char *)(a1 + 289))
    {
      v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 284)];
      [v4 setObject:v13 forKey:@"includeBetterRouteSuggestion"];
    }
    if ([*(id *)(a1 + 152) count])
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 152), "count"));
      long long v164 = 0u;
      long long v165 = 0u;
      long long v166 = 0u;
      long long v167 = 0u;
      id v15 = *(id *)(a1 + 152);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v164 objects:v172 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v165;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v165 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v164 + 1) + 8 * i);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            id v21 = [v20 dictionaryRepresentation];
            }

            [v14 addObject:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v164 objects:v172 count:16];
        }
        while (v17);
      }

      [v4 setObject:v14 forKey:@"route"];
      unint64_t v12 = 0x1E4F28000uLL;
      v11 = &OBJC_IVAR___GEORPFeedbackComponent__unknownFields;
    }
    v22 = [(id)a1 waypointRoute];
    v23 = v22;
    if (v22)
    {
      if (a2)
      {
        v24 = [v22 jsonRepresentation];
        v25 = @"waypointRoute";
      }
      else
      {
        v24 = [v22 dictionaryRepresentation];
        v25 = @"waypoint_route";
      }
      id v26 = v24;

      [v4 setObject:v26 forKey:v25];
    }

    v27 = [(id)a1 clientCapabilities];
    v28 = v27;
    if (v27)
    {
      if (a2) {
        [v27 jsonRepresentation];
      }
      else {
      id v29 = [v27 dictionaryRepresentation];
      }

      [v4 setObject:v29 forKey:@"clientCapabilities"];
    }

    v30 = [(id)a1 directionsResponseID];
    v31 = v30;
    if (v30)
    {
      if (a2)
      {
        v32 = [v30 base64EncodedStringWithOptions:0];
        [v4 setObject:v32 forKey:@"directionsResponseID"];
      }
      else
      {
        [v4 setObject:v30 forKey:@"directionsResponseID"];
      }
    }

    v33 = [(id)a1 etauResponseID];
    if (v33)
    {
      v34 = v33;
      if (a2)
      {
        v35 = [v33 base64EncodedStringWithOptions:0];
        [v4 setObject:v35 forKey:@"etauResponseID"];
      }
      else
      {
        [v4 setObject:v33 forKey:@"etauResponseID"];
      }
    }
    uint64_t v36 = *(void *)(a1 + 288);
    if (v36)
    {
      _GEOSessionIDDictionaryRepresentation((void *)(a1 + 24));
      id v37 = (id)objc_claimAutoreleasedReturnValue();

      [v4 setObject:v37 forKey:@"sessionID"];
      uint64_t v36 = *(void *)(a1 + 288);
    }
    if ((v36 & 2) != 0)
    {
      v38 = [NSNumber numberWithDouble:*(double *)(a1 + 168)];
      if (a2) {
        v39 = @"sessionRelativeTimestamp";
      }
      else {
        v39 = @"session_relative_timestamp";
      }
      [v4 setObject:v38 forKey:v39];
    }
    v40 = [(id)a1 additionalEnabledMarkets];
    v41 = v40;
    if (v40)
    {
      if (a2) {
        [v40 jsonRepresentation];
      }
      else {
      id v42 = [v40 dictionaryRepresentation];
      }

      [v4 setObject:v42 forKey:@"additionalEnabledMarkets"];
    }

    if ([*(id *)(a1 + 88) count])
    {
      v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
      long long v160 = 0u;
      long long v161 = 0u;
      long long v162 = 0u;
      long long v163 = 0u;
      id v44 = *(id *)(a1 + 88);
      uint64_t v45 = [v44 countByEnumeratingWithState:&v160 objects:v171 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v161;
        do
        {
          for (uint64_t j = 0; j != v46; ++j)
          {
            if (*(void *)v161 != v47) {
              objc_enumerationMutation(v44);
            }
            v49 = *(void **)(*((void *)&v160 + 1) + 8 * j);
            if (a2) {
              [v49 jsonRepresentation];
            }
            else {
            id v50 = [v49 dictionaryRepresentation];
            }

            [v43 addObject:v50];
          }
          uint64_t v46 = [v44 countByEnumeratingWithState:&v160 objects:v171 count:16];
        }
        while (v46);
      }

      [v4 setObject:v43 forKey:@"destinationWaypointTyped"];
      unint64_t v12 = 0x1E4F28000;
      v11 = &OBJC_IVAR___GEORPFeedbackComponent__unknownFields;
    }
    if ([*(id *)(a1 + 232) count])
    {
      v51 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 232), "count"));
      long long v156 = 0u;
      long long v157 = 0u;
      long long v158 = 0u;
      long long v159 = 0u;
      id v52 = *(id *)(a1 + 232);
      uint64_t v53 = [v52 countByEnumeratingWithState:&v156 objects:v170 count:16];
      if (v53)
      {
        uint64_t v54 = v53;
        uint64_t v55 = *(void *)v157;
        do
        {
          for (uint64_t k = 0; k != v54; ++k)
          {
            if (*(void *)v157 != v55) {
              objc_enumerationMutation(v52);
            }
            v57 = *(void **)(*((void *)&v156 + 1) + 8 * k);
            if (a2) {
              [v57 jsonRepresentation];
            }
            else {
            id v58 = [v57 dictionaryRepresentation];
            }

            [v51 addObject:v58];
          }
          uint64_t v54 = [v52 countByEnumeratingWithState:&v156 objects:v170 count:16];
        }
        while (v54);
      }

      if (a2) {
        v59 = @"waypointTyped";
      }
      else {
        v59 = @"waypoint_typed";
      }
      [v4 setObject:v51 forKey:v59];

      unint64_t v12 = 0x1E4F28000uLL;
      v11 = &OBJC_IVAR___GEORPFeedbackComponent__unknownFields;
    }
    if ((*(unsigned char *)(a1 + v11[396]) & 0x10) != 0)
    {
      v60 = [*(id *)(v12 + 3792) numberWithUnsignedInt:*(unsigned int *)(a1 + 268)];
      if (a2) {
        v61 = @"previouslyRejectedRerouteSavings";
      }
      else {
        v61 = @"previously_rejected_reroute_savings";
      }
      [v4 setObject:v60 forKey:v61];
    }
    v62 = [(id)a1 sessionState];
    v63 = v62;
    if (v62)
    {
      if (a2)
      {
        v64 = [v62 base64EncodedStringWithOptions:0];
        [v4 setObject:v64 forKey:@"sessionState"];
      }
      else
      {
        [v4 setObject:v62 forKey:@"session_state"];
      }
    }

    if ((*(unsigned char *)(a1 + v11[396]) & 0x40) != 0)
    {
      uint64_t v65 = *(int *)(a1 + 276);
      if (v65 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 276));
        v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v66 = off_1E53F7360[v65];
      }
      if (a2) {
        v67 = @"rerouteStatus";
      }
      else {
        v67 = @"reroute_status";
      }
      [v4 setObject:v66 forKey:v67];
    }
    v68 = [(id)a1 commonOptions];
    v69 = v68;
    if (v68)
    {
      if (a2)
      {
        v70 = [v68 jsonRepresentation];
        v71 = @"commonOptions";
      }
      else
      {
        v70 = [v68 dictionaryRepresentation];
        v71 = @"common_options";
      }
      id v72 = v70;

      [v4 setObject:v72 forKey:v71];
    }

    v73 = [(id)a1 abClientMetadata];
    v74 = v73;
    if (v73)
    {
      if (a2)
      {
        v75 = [v73 jsonRepresentation];
        v76 = @"abClientMetadata";
      }
      else
      {
        v75 = [v73 dictionaryRepresentation];
        v76 = @"ab_client_metadata";
      }
      id v77 = v75;

      [v4 setObject:v77 forKey:v76];
    }

    if ((*(unsigned char *)(a1 + v11[396]) & 8) != 0)
    {
      v78 = [*(id *)(v12 + 3792) numberWithUnsignedInt:*(unsigned int *)(a1 + 264)];
      if (a2) {
        v79 = @"maxAlternateRouteCount";
      }
      else {
        v79 = @"max_alternate_route_count";
      }
      [v4 setObject:v78 forKey:v79];
    }
    v80 = [(id)a1 tripID];
    v81 = v80;
    if (v80)
    {
      if (a2)
      {
        v82 = [v80 base64EncodedStringWithOptions:0];
        [v4 setObject:v82 forKey:@"tripID"];
      }
      else
      {
        [v4 setObject:v80 forKey:@"tripID"];
      }
    }

    v83 = [(id)a1 requestingAppId];
    if (v83)
    {
      if (a2) {
        v84 = @"requestingAppId";
      }
      else {
        v84 = @"requesting_app_id";
      }
      [v4 setObject:v83 forKey:v84];
    }

    v85 = [(id)a1 tripOrigin];
    v86 = v85;
    if (v85)
    {
      if (a2)
      {
        v87 = [v85 jsonRepresentation];
        v88 = @"tripOrigin";
      }
      else
      {
        v87 = [v85 dictionaryRepresentation];
        v88 = @"trip_origin";
      }
      id v89 = v87;

      [v4 setObject:v89 forKey:v88];
    }

    if (*(void *)(a1 + 104))
    {
      v90 = [(id)a1 displayedBannerIds];
      if (a2) {
        v91 = @"displayedBannerId";
      }
      else {
        v91 = @"displayed_banner_id";
      }
      [v4 setObject:v90 forKey:v91];
    }
    v92 = [(id)a1 clientFeedbackInfo];
    v93 = v92;
    if (v92)
    {
      if (a2)
      {
        v94 = [v92 jsonRepresentation];
        v95 = @"clientFeedbackInfo";
      }
      else
      {
        v94 = [v92 dictionaryRepresentation];
        v95 = @"client_feedback_info";
      }
      id v96 = v94;

      [v4 setObject:v96 forKey:v95];
    }

    v97 = [(id)a1 recentLocationHistory];
    v98 = v97;
    if (v97)
    {
      if (a2)
      {
        v99 = [v97 jsonRepresentation];
        v100 = @"recentLocationHistory";
      }
      else
      {
        v99 = [v97 dictionaryRepresentation];
        v100 = @"recent_location_history";
      }
      id v101 = v99;

      [v4 setObject:v101 forKey:v100];
    }

    v102 = [(id)a1 privacyMetadata];
    v103 = v102;
    if (v102)
    {
      if (a2)
      {
        v104 = [v102 jsonRepresentation];
        v105 = @"privacyMetadata";
      }
      else
      {
        v104 = [v102 dictionaryRepresentation];
        v105 = @"privacy_metadata";
      }
      id v106 = v104;

      [v4 setObject:v106 forKey:v105];
    }

    if ((*(unsigned char *)(a1 + v11[396]) & 4) != 0)
    {
      v107 = [*(id *)(v12 + 3792) numberWithUnsignedInt:*(unsigned int *)(a1 + 260)];
      if (a2) {
        v108 = @"displayedEta";
      }
      else {
        v108 = @"displayed_eta";
      }
      [v4 setObject:v107 forKey:v108];
    }
    v109 = [(id)a1 tripInfo];
    v110 = v109;
    if (v109)
    {
      if (a2)
      {
        v111 = [v109 jsonRepresentation];
        v112 = @"tripInfo";
      }
      else
      {
        v111 = [v109 dictionaryRepresentation];
        v112 = @"trip_info";
      }
      id v113 = v111;

      [v4 setObject:v113 forKey:v112];
    }

    if ((*(unsigned char *)(a1 + v11[396]) & 0x20) != 0)
    {
      uint64_t v114 = *(int *)(a1 + 272);
      if (v114 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 272));
        v115 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v115 = off_1E53F7388[v114];
      }
      [v4 setObject:v115 forKey:@"purpose"];
    }
    if ([*(id *)(a1 + 160) count])
    {
      v116 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 160), "count"));
      long long v152 = 0u;
      long long v153 = 0u;
      long long v154 = 0u;
      long long v155 = 0u;
      id v117 = *(id *)(a1 + 160);
      uint64_t v118 = [v117 countByEnumeratingWithState:&v152 objects:v169 count:16];
      if (v118)
      {
        uint64_t v119 = v118;
        uint64_t v120 = *(void *)v153;
        do
        {
          for (uint64_t m = 0; m != v119; ++m)
          {
            if (*(void *)v153 != v120) {
              objc_enumerationMutation(v117);
            }
            v122 = *(void **)(*((void *)&v152 + 1) + 8 * m);
            if (a2) {
              [v122 jsonRepresentation];
            }
            else {
            id v123 = [v122 dictionaryRepresentation];
            }

            [v116 addObject:v123];
          }
          uint64_t v119 = [v117 countByEnumeratingWithState:&v152 objects:v169 count:16];
        }
        while (v119);
      }

      [v4 setObject:v116 forKey:@"serviceTag"];
      v11 = &OBJC_IVAR___GEORPFeedbackComponent__unknownFields;
    }
    if (*(void *)(a1 + 184))
    {
      if (a2)
      {
        v124 = (void *)MEMORY[0x1E4F1CA48];
        v125 = [(id)a1 trafficApiResponses];
        v126 = objc_msgSend(v124, "arrayWithCapacity:", objc_msgSend(v125, "count"));

        long long v150 = 0u;
        long long v151 = 0u;
        long long v148 = 0u;
        long long v149 = 0u;
        v127 = [(id)a1 trafficApiResponses];
        uint64_t v128 = [v127 countByEnumeratingWithState:&v148 objects:v168 count:16];
        if (v128)
        {
          uint64_t v129 = v128;
          uint64_t v130 = *(void *)v149;
          do
          {
            for (uint64_t n = 0; n != v129; ++n)
            {
              if (*(void *)v149 != v130) {
                objc_enumerationMutation(v127);
              }
              v132 = [*(id *)(*((void *)&v148 + 1) + 8 * n) base64EncodedStringWithOptions:0];
              [v126 addObject:v132];
            }
            uint64_t v129 = [v127 countByEnumeratingWithState:&v148 objects:v168 count:16];
          }
          while (v129);
        }

        v11 = &OBJC_IVAR___GEORPFeedbackComponent__unknownFields;
      }
      else
      {
        v126 = [(id)a1 trafficApiResponses];
      }
      [v4 setObject:v126 forKey:@"trafficApiResponses"];
    }
    if (*(void *)(a1 + 192))
    {
      v133 = [(id)a1 trafficSnapshotIds];
      [v4 setObject:v133 forKey:@"trafficSnapshotIds"];
    }
    if ((*(unsigned char *)(a1 + v11[396]) & 0x80) != 0)
    {
      v134 = [*(id *)(v12 + 3792) numberWithUnsignedInt:*(unsigned int *)(a1 + 280)];
      if (a2) {
        v135 = @"trafficSnapshotUnixTime";
      }
      else {
        v135 = @"traffic_snapshot_unix_time";
      }
      [v4 setObject:v134 forKey:v135];
    }
    v136 = [(id)a1 xpcUuid];
    if (v136)
    {
      if (a2) {
        v137 = @"xpcUuid";
      }
      else {
        v137 = @"xpc_uuid";
      }
      [v4 setObject:v136 forKey:v137];
    }

    v138 = *(void **)(a1 + 16);
    if (v138)
    {
      v139 = [v138 dictionaryRepresentation];
      v140 = v139;
      if (a2)
      {
        v141 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v139, "count"));
        v146[0] = MEMORY[0x1E4F143A8];
        v146[1] = 3221225472;
        v146[2] = __56__GEOETATrafficUpdateRequest__dictionaryRepresentation___block_invoke;
        v146[3] = &unk_1E53D8860;
        id v142 = v141;
        id v147 = v142;
        [v140 enumerateKeysAndObjectsUsingBlock:v146];
        id v143 = v142;

        v140 = v143;
      }
      [v4 setObject:v140 forKey:@"Unknown Fields"];
    }
    id v144 = v4;
  }
  else
  {
    id v144 = 0;
  }

  return v144;
}

- (id)jsonRepresentation
{
  return -[GEOETATrafficUpdateRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEOETATrafficUpdateRequest__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOETATrafficUpdateRequest)initWithDictionary:(id)a3
{
  return (GEOETATrafficUpdateRequest *)-[GEOETATrafficUpdateRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v204 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_272;
  }
  a1 = (id)[a1 init];

  if (!a1) {
    goto LABEL_272;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"currentUserLocation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [GEOLocation alloc];
    if (a3) {
      uint64_t v8 = [(GEOLocation *)v7 initWithJSON:v6];
    }
    else {
      uint64_t v8 = [(GEOLocation *)v7 initWithDictionary:v6];
    }
    v9 = (void *)v8;
    [a1 setCurrentUserLocation:v8];
  }
  id v10 = [v5 objectForKeyedSubscript:@"routeAttributes"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [GEORouteAttributes alloc];
    if (a3) {
      uint64_t v12 = [(GEORouteAttributes *)v11 initWithJSON:v10];
    }
    else {
      uint64_t v12 = [(GEORouteAttributes *)v11 initWithDictionary:v10];
    }
    v13 = (void *)v12;
    [a1 setRouteAttributes:v12];
  }
  v14 = [v5 objectForKeyedSubscript:@"includeBetterRouteSuggestion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIncludeBetterRouteSuggestion:", objc_msgSend(v14, "BOOLValue"));
  }

  id v15 = [v5 objectForKeyedSubscript:@"route"];
  objc_opt_class();
  id v166 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v195 = 0u;
    long long v196 = 0u;
    long long v193 = 0u;
    long long v194 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v193 objects:v203 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v194;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v194 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v193 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v22 = [GEOETARoute alloc];
            if (a3) {
              uint64_t v23 = [(GEOETARoute *)v22 initWithJSON:v21];
            }
            else {
              uint64_t v23 = [(GEOETARoute *)v22 initWithDictionary:v21];
            }
            v24 = (void *)v23;
            [a1 addRoute:v23];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v193 objects:v203 count:16];
      }
      while (v18);
    }
  }
  if (a3) {
    v25 = @"waypointRoute";
  }
  else {
    v25 = @"waypoint_route";
  }
  id v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = [GEOETATrafficUpdateWaypointRoute alloc];
    if (a3) {
      uint64_t v28 = [(GEOETATrafficUpdateWaypointRoute *)v27 initWithJSON:v26];
    }
    else {
      uint64_t v28 = [(GEOETATrafficUpdateWaypointRoute *)v27 initWithDictionary:v26];
    }
    id v29 = (void *)v28;
    [a1 setWaypointRoute:v28];
  }
  v30 = [v5 objectForKeyedSubscript:@"clientCapabilities"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v31 = [GEOClientCapabilities alloc];
    if (a3) {
      uint64_t v32 = [(GEOClientCapabilities *)v31 initWithJSON:v30];
    }
    else {
      uint64_t v32 = [(GEOClientCapabilities *)v31 initWithDictionary:v30];
    }
    v33 = (void *)v32;
    [a1 setClientCapabilities:v32];
  }
  v34 = [v5 objectForKeyedSubscript:@"directionsResponseID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v35 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v34 options:0];
    [a1 setDirectionsResponseID:v35];
  }
  uint64_t v36 = [v5 objectForKeyedSubscript:@"etauResponseID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v37 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v36 options:0];
    [a1 setEtauResponseID:v37];
  }
  v38 = [v5 objectForKeyedSubscript:@"sessionID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v191 = 0;
    uint64_t v192 = 0;
    _GEOSessionIDFromDictionaryRepresentation(v38, &v191);
    objc_msgSend(a1, "setSessionID:", v191, v192);
  }

  if (a3) {
    v39 = @"sessionRelativeTimestamp";
  }
  else {
    v39 = @"session_relative_timestamp";
  }
  v40 = [v5 objectForKeyedSubscript:v39];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v40 doubleValue];
    objc_msgSend(a1, "setSessionRelativeTimestamp:");
  }

  v41 = [v5 objectForKeyedSubscript:@"additionalEnabledMarkets"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v42 = [GEOAdditionalEnabledMarkets alloc];
    if (a3) {
      uint64_t v43 = [(GEOAdditionalEnabledMarkets *)v42 initWithJSON:v41];
    }
    else {
      uint64_t v43 = [(GEOAdditionalEnabledMarkets *)v42 initWithDictionary:v41];
    }
    id v44 = (void *)v43;
    [a1 setAdditionalEnabledMarkets:v43];
  }
  uint64_t v45 = [v5 objectForKeyedSubscript:@"destinationWaypointTyped"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v189 = 0u;
    long long v190 = 0u;
    long long v187 = 0u;
    long long v188 = 0u;
    long long v163 = v45;
    id v46 = v45;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v187 objects:v202 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v188;
      do
      {
        for (uint64_t j = 0; j != v48; ++j)
        {
          if (*(void *)v188 != v49) {
            objc_enumerationMutation(v46);
          }
          uint64_t v51 = *(void *)(*((void *)&v187 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v52 = [GEOWaypointTyped alloc];
            if (a3) {
              uint64_t v53 = [(GEOWaypointTyped *)v52 initWithJSON:v51];
            }
            else {
              uint64_t v53 = [(GEOWaypointTyped *)v52 initWithDictionary:v51];
            }
            uint64_t v54 = (void *)v53;
            objc_msgSend(a1, "addDestinationWaypointTyped:", v53, v163);
          }
        }
        uint64_t v48 = [v46 countByEnumeratingWithState:&v187 objects:v202 count:16];
      }
      while (v48);
    }

    uint64_t v45 = v163;
    id v5 = v166;
  }

  if (a3) {
    uint64_t v55 = @"waypointTyped";
  }
  else {
    uint64_t v55 = @"waypoint_typed";
  }
  v56 = objc_msgSend(v5, "objectForKeyedSubscript:", v55, v163);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v185 = 0u;
    long long v186 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    long long v164 = v56;
    id v57 = v56;
    uint64_t v58 = [v57 countByEnumeratingWithState:&v183 objects:v201 count:16];
    if (v58)
    {
      uint64_t v59 = v58;
      uint64_t v60 = *(void *)v184;
      do
      {
        for (uint64_t k = 0; k != v59; ++k)
        {
          if (*(void *)v184 != v60) {
            objc_enumerationMutation(v57);
          }
          uint64_t v62 = *(void *)(*((void *)&v183 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v63 = [GEOWaypointTyped alloc];
            if (a3) {
              uint64_t v64 = [(GEOWaypointTyped *)v63 initWithJSON:v62];
            }
            else {
              uint64_t v64 = [(GEOWaypointTyped *)v63 initWithDictionary:v62];
            }
            uint64_t v65 = (void *)v64;
            objc_msgSend(a1, "addWaypointTyped:", v64, v164);
          }
        }
        uint64_t v59 = [v57 countByEnumeratingWithState:&v183 objects:v201 count:16];
      }
      while (v59);
    }

    v56 = v164;
    id v5 = v166;
  }

  if (a3) {
    v66 = @"previouslyRejectedRerouteSavings";
  }
  else {
    v66 = @"previously_rejected_reroute_savings";
  }
  v67 = objc_msgSend(v5, "objectForKeyedSubscript:", v66, v164);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPreviouslyRejectedRerouteSavings:", objc_msgSend(v67, "unsignedIntValue"));
  }

  if (a3) {
    v68 = @"sessionState";
  }
  else {
    v68 = @"session_state";
  }
  v69 = [v5 objectForKeyedSubscript:v68];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v70 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v69 options:0];
    [a1 setSessionState:v70];
  }
  if (a3) {
    v71 = @"rerouteStatus";
  }
  else {
    v71 = @"reroute_status";
  }
  id v72 = [v5 objectForKeyedSubscript:v71];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v73 = v72;
    if ([v73 isEqualToString:@"REROUTE_INACTIVE"])
    {
      uint64_t v74 = 0;
    }
    else if ([v73 isEqualToString:@"REROUTE_PROPOSED"])
    {
      uint64_t v74 = 1;
    }
    else if ([v73 isEqualToString:@"REROUTE_DECLINED"])
    {
      uint64_t v74 = 2;
    }
    else if ([v73 isEqualToString:@"REROUTE_REJECTED"])
    {
      uint64_t v74 = 3;
    }
    else if ([v73 isEqualToString:@"REROUTE_ACCEPTED"])
    {
      uint64_t v74 = 4;
    }
    else
    {
      uint64_t v74 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_118;
    }
    uint64_t v74 = [v72 intValue];
  }
  [a1 setRerouteStatus:v74];
LABEL_118:

  if (a3) {
    v75 = @"commonOptions";
  }
  else {
    v75 = @"common_options";
  }
  v76 = [v5 objectForKeyedSubscript:v75];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v77 = [GEOCommonOptions alloc];
    if (a3) {
      uint64_t v78 = [(GEOCommonOptions *)v77 initWithJSON:v76];
    }
    else {
      uint64_t v78 = [(GEOCommonOptions *)v77 initWithDictionary:v76];
    }
    v79 = (void *)v78;
    [a1 setCommonOptions:v78];
  }
  if (a3) {
    v80 = @"abClientMetadata";
  }
  else {
    v80 = @"ab_client_metadata";
  }
  v81 = [v5 objectForKeyedSubscript:v80];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v82 = [GEOPDABClientDatasetMetadata alloc];
    if (a3) {
      uint64_t v83 = [(GEOPDABClientDatasetMetadata *)v82 initWithJSON:v81];
    }
    else {
      uint64_t v83 = [(GEOPDABClientDatasetMetadata *)v82 initWithDictionary:v81];
    }
    v84 = (void *)v83;
    [a1 setAbClientMetadata:v83];
  }
  if (a3) {
    v85 = @"maxAlternateRouteCount";
  }
  else {
    v85 = @"max_alternate_route_count";
  }
  v86 = [v5 objectForKeyedSubscript:v85];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setMaxAlternateRouteCount:", objc_msgSend(v86, "unsignedIntValue"));
  }

  v87 = [v5 objectForKeyedSubscript:@"tripID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v88 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v87 options:0];
    [a1 setTripID:v88];
  }
  if (a3) {
    id v89 = @"requestingAppId";
  }
  else {
    id v89 = @"requesting_app_id";
  }
  v90 = [v5 objectForKeyedSubscript:v89];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v91 = (void *)[v90 copy];
    [a1 setRequestingAppId:v91];
  }
  if (a3) {
    v92 = @"tripOrigin";
  }
  else {
    v92 = @"trip_origin";
  }
  v93 = [v5 objectForKeyedSubscript:v92];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v94 = [GEOLocation alloc];
    if (a3) {
      uint64_t v95 = [(GEOLocation *)v94 initWithJSON:v93];
    }
    else {
      uint64_t v95 = [(GEOLocation *)v94 initWithDictionary:v93];
    }
    id v96 = (void *)v95;
    [a1 setTripOrigin:v95];
  }
  if (a3) {
    v97 = @"displayedBannerId";
  }
  else {
    v97 = @"displayed_banner_id";
  }
  v98 = [v5 objectForKeyedSubscript:v97];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v181 = 0u;
    long long v182 = 0u;
    long long v179 = 0u;
    long long v180 = 0u;
    id v99 = v98;
    uint64_t v100 = [v99 countByEnumeratingWithState:&v179 objects:v200 count:16];
    if (v100)
    {
      uint64_t v101 = v100;
      uint64_t v102 = *(void *)v180;
      do
      {
        for (uint64_t m = 0; m != v101; ++m)
        {
          if (*(void *)v180 != v102) {
            objc_enumerationMutation(v99);
          }
          v104 = *(void **)(*((void *)&v179 + 1) + 8 * m);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v105 = (void *)[v104 copy];
            [a1 addDisplayedBannerId:v105];
          }
        }
        uint64_t v101 = [v99 countByEnumeratingWithState:&v179 objects:v200 count:16];
      }
      while (v101);
    }

    id v5 = v166;
  }

  if (a3) {
    id v106 = @"clientFeedbackInfo";
  }
  else {
    id v106 = @"client_feedback_info";
  }
  v107 = [v5 objectForKeyedSubscript:v106];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v108 = [GEOClientFeedbackInfo alloc];
    if (a3) {
      uint64_t v109 = [(GEOClientFeedbackInfo *)v108 initWithJSON:v107];
    }
    else {
      uint64_t v109 = [(GEOClientFeedbackInfo *)v108 initWithDictionary:v107];
    }
    v110 = (void *)v109;
    [a1 setClientFeedbackInfo:v109];
  }
  if (a3) {
    v111 = @"recentLocationHistory";
  }
  else {
    v111 = @"recent_location_history";
  }
  v112 = [v5 objectForKeyedSubscript:v111];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v113 = [GEORecentLocationHistory alloc];
    if (a3) {
      uint64_t v114 = [(GEORecentLocationHistory *)v113 initWithJSON:v112];
    }
    else {
      uint64_t v114 = [(GEORecentLocationHistory *)v113 initWithDictionary:v112];
    }
    v115 = (void *)v114;
    [a1 setRecentLocationHistory:v114];
  }
  if (a3) {
    v116 = @"privacyMetadata";
  }
  else {
    v116 = @"privacy_metadata";
  }
  id v117 = [v5 objectForKeyedSubscript:v116];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v118 = [GEOPrivacyMetadata alloc];
    if (a3) {
      uint64_t v119 = [(GEOPrivacyMetadata *)v118 initWithJSON:v117];
    }
    else {
      uint64_t v119 = [(GEOPrivacyMetadata *)v118 initWithDictionary:v117];
    }
    uint64_t v120 = (void *)v119;
    [a1 setPrivacyMetadata:v119];
  }
  if (a3) {
    v121 = @"displayedEta";
  }
  else {
    v121 = @"displayed_eta";
  }
  v122 = [v5 objectForKeyedSubscript:v121];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDisplayedEta:", objc_msgSend(v122, "unsignedIntValue"));
  }

  if (a3) {
    id v123 = @"tripInfo";
  }
  else {
    id v123 = @"trip_info";
  }
  v124 = [v5 objectForKeyedSubscript:v123];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v125 = [GEOTripInfo alloc];
    if (a3) {
      uint64_t v126 = [(GEOTripInfo *)v125 initWithJSON:v124];
    }
    else {
      uint64_t v126 = [(GEOTripInfo *)v125 initWithDictionary:v124];
    }
    v127 = (void *)v126;
    [a1 setTripInfo:v126];
  }
  uint64_t v128 = [v5 objectForKeyedSubscript:@"purpose"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v129 = v128;
    if ([v129 isEqualToString:@"PURPOSE_UNKNOWN"])
    {
      uint64_t v130 = 0;
    }
    else if ([v129 isEqualToString:@"REGULAR_ETA_UPDATE"])
    {
      uint64_t v130 = 1;
    }
    else if ([v129 isEqualToString:@"SERVER_INITIATED_ETA_UPDATE"])
    {
      uint64_t v130 = 2;
    }
    else if ([v129 isEqualToString:@"USER_ABORTED_TRIP"])
    {
      uint64_t v130 = 3;
    }
    else if ([v129 isEqualToString:@"USER_PAUSED_TRIP_AT_WAYPOINT"])
    {
      uint64_t v130 = 4;
    }
    else if ([v129 isEqualToString:@"USER_COMPLETED_TRIP"])
    {
      uint64_t v130 = 5;
    }
    else if ([v129 isEqualToString:@"USER_ADVANCED_TO_NEXT_LEG"])
    {
      uint64_t v130 = 6;
    }
    else
    {
      uint64_t v130 = 0;
    }

    goto LABEL_224;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v130 = [v128 intValue];
LABEL_224:
    [a1 setPurpose:v130];
  }

  v131 = [v5 objectForKeyedSubscript:@"serviceTag"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v177 = 0u;
    long long v178 = 0u;
    long long v175 = 0u;
    long long v176 = 0u;
    long long v165 = v131;
    id v132 = v131;
    uint64_t v133 = [v132 countByEnumeratingWithState:&v175 objects:v199 count:16];
    if (v133)
    {
      uint64_t v134 = v133;
      uint64_t v135 = *(void *)v176;
      do
      {
        for (uint64_t n = 0; n != v134; ++n)
        {
          if (*(void *)v176 != v135) {
            objc_enumerationMutation(v132);
          }
          uint64_t v137 = *(void *)(*((void *)&v175 + 1) + 8 * n);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v138 = [GEOGeoServiceTag alloc];
            if (a3) {
              uint64_t v139 = [(GEOGeoServiceTag *)v138 initWithJSON:v137];
            }
            else {
              uint64_t v139 = [(GEOGeoServiceTag *)v138 initWithDictionary:v137];
            }
            v140 = (void *)v139;
            objc_msgSend(a1, "addServiceTag:", v139, v165);
          }
        }
        uint64_t v134 = [v132 countByEnumeratingWithState:&v175 objects:v199 count:16];
      }
      while (v134);
    }

    v131 = v165;
    id v5 = v166;
  }

  v141 = [v5 objectForKeyedSubscript:@"trafficApiResponses"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v173 = 0u;
    long long v174 = 0u;
    long long v171 = 0u;
    long long v172 = 0u;
    id v142 = v141;
    uint64_t v143 = [v142 countByEnumeratingWithState:&v171 objects:v198 count:16];
    if (v143)
    {
      uint64_t v144 = v143;
      uint64_t v145 = *(void *)v172;
      do
      {
        for (iuint64_t i = 0; ii != v144; ++ii)
        {
          if (*(void *)v172 != v145) {
            objc_enumerationMutation(v142);
          }
          uint64_t v147 = *(void *)(*((void *)&v171 + 1) + 8 * ii);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v148 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v147 options:0];
            [a1 addTrafficApiResponses:v148];
          }
        }
        uint64_t v144 = [v142 countByEnumeratingWithState:&v171 objects:v198 count:16];
      }
      while (v144);
    }

    id v5 = v166;
  }

  long long v149 = [v5 objectForKeyedSubscript:@"trafficSnapshotIds"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v169 = 0u;
    long long v170 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    id v150 = v149;
    uint64_t v151 = [v150 countByEnumeratingWithState:&v167 objects:v197 count:16];
    if (v151)
    {
      uint64_t v152 = v151;
      uint64_t v153 = *(void *)v168;
      do
      {
        for (juint64_t j = 0; jj != v152; ++jj)
        {
          if (*(void *)v168 != v153) {
            objc_enumerationMutation(v150);
          }
          long long v155 = *(void **)(*((void *)&v167 + 1) + 8 * jj);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v156 = (void *)[v155 copy];
            [a1 addTrafficSnapshotIds:v156];
          }
        }
        uint64_t v152 = [v150 countByEnumeratingWithState:&v167 objects:v197 count:16];
      }
      while (v152);
    }
  }
  if (a3) {
    long long v157 = @"trafficSnapshotUnixTime";
  }
  else {
    long long v157 = @"traffic_snapshot_unix_time";
  }
  long long v158 = objc_msgSend(v5, "objectForKeyedSubscript:", v157, v165);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTrafficSnapshotUnixTime:", objc_msgSend(v158, "unsignedIntValue"));
  }

  if (a3) {
    long long v159 = @"xpcUuid";
  }
  else {
    long long v159 = @"xpc_uuid";
  }
  long long v160 = [v5 objectForKeyedSubscript:v159];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v161 = (void *)[v160 copy];
    [a1 setXpcUuid:v161];
  }
  a1 = a1;

LABEL_272:
  return a1;
}

- (GEOETATrafficUpdateRequest)initWithJSON:(id)a3
{
  return (GEOETATrafficUpdateRequest *)-[GEOETATrafficUpdateRequest _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_1486;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_1487;
    }
    GEOETATrafficUpdateRequestReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOETATrafficUpdateRequestCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOETATrafficUpdateRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOETATrafficUpdateRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOETATrafficUpdateRequestIsDirty((uint64_t)self) & 1) == 0)
  {
    v35 = self->_reader;
    objc_sync_enter(v35);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v36 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v36];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v35);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOETATrafficUpdateRequest *)self readAll:0];
    if (self->_currentUserLocation) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_routeAttributes) {
      PBDataWriterWriteSubmessage();
    }
    if (*((unsigned char *)&self->_flags + 1)) {
      PBDataWriterWriteBOOLField();
    }
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    objc_super v6 = self->_routes;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v62 objects:v72 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v63 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v62 objects:v72 count:16];
      }
      while (v7);
    }

    if (self->_waypointRoute) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_clientCapabilities) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_directionsResponseID) {
      PBDataWriterWriteDataField();
    }
    if (self->_etauResponseID) {
      PBDataWriterWriteDataField();
    }
    $A9051F91FD5D6DAB60BDAAD82EC423D1 flags = self->_flags;
    if (*(unsigned char *)&flags)
    {
      uint64_t v61 = 0;
      PBDataWriterPlaceMark();
      PBDataWriterWriteUint64Field();
      PBDataWriterWriteUint64Field();
      PBDataWriterRecallMark();
      $A9051F91FD5D6DAB60BDAAD82EC423D1 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 2) != 0) {
      PBDataWriterWriteDoubleField();
    }
    if (self->_additionalEnabledMarkets) {
      PBDataWriterWriteSubmessage();
    }
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v11 = self->_destinationWaypointTypeds;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v57 objects:v71 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v58 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v57 objects:v71 count:16];
      }
      while (v12);
    }

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v15 = self->_waypointTypeds;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v53 objects:v70 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v54;
      do
      {
        for (uint64_t k = 0; k != v16; ++k)
        {
          if (*(void *)v54 != v17) {
            objc_enumerationMutation(v15);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v53 objects:v70 count:16];
      }
      while (v16);
    }

    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_sessionState) {
      PBDataWriterWriteDataField();
    }
    if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_commonOptions) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_abClientMetadata) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_tripID) {
      PBDataWriterWriteDataField();
    }
    if (self->_requestingAppId) {
      PBDataWriterWriteStringField();
    }
    if (self->_tripOrigin) {
      PBDataWriterWriteSubmessage();
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v19 = self->_displayedBannerIds;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v49 objects:v69 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v50;
      do
      {
        for (uint64_t m = 0; m != v20; ++m)
        {
          if (*(void *)v50 != v21) {
            objc_enumerationMutation(v19);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v49 objects:v69 count:16];
      }
      while (v20);
    }

    if (self->_clientFeedbackInfo) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_recentLocationHistory) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_privacyMetadata) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_tripInfo) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
      PBDataWriterWriteInt32Field();
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v23 = self->_serviceTags;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v45 objects:v68 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v46;
      do
      {
        for (uint64_t n = 0; n != v24; ++n)
        {
          if (*(void *)v46 != v25) {
            objc_enumerationMutation(v23);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v45 objects:v68 count:16];
      }
      while (v24);
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v27 = self->_trafficApiResponses;
    uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v41 objects:v67 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v42;
      do
      {
        for (iuint64_t i = 0; ii != v28; ++ii)
        {
          if (*(void *)v42 != v29) {
            objc_enumerationMutation(v27);
          }
          PBDataWriterWriteDataField();
        }
        uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v41 objects:v67 count:16];
      }
      while (v28);
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v31 = self->_trafficSnapshotIds;
    uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v37 objects:v66 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v38;
      do
      {
        for (juint64_t j = 0; jj != v32; ++jj)
        {
          if (*(void *)v38 != v33) {
            objc_enumerationMutation(v31);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v37 objects:v66 count:16];
      }
      while (v32);
    }

    if ((*(unsigned char *)&self->_flags & 0x80) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_xpcUuid) {
      PBDataWriterWriteStringField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v37);
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  -[GEOETATrafficUpdateRequest _readCurrentUserLocation]((uint64_t)self);
  if ([(GEOLocation *)self->_currentUserLocation hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOETATrafficUpdateRequest _readDestinationWaypointTypeds]((uint64_t)self);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  objc_super v6 = self->_destinationWaypointTypeds;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
LABEL_5:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v29 != v9) {
        objc_enumerationMutation(v6);
      }
      if ([*(id *)(*((void *)&v28 + 1) + 8 * v10) hasGreenTeaWithValue:v3]) {
        goto LABEL_30;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v8) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  -[GEOETATrafficUpdateRequest _readRoutes]((uint64_t)self);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  objc_super v6 = self->_routes;
  uint64_t v11 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
LABEL_13:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v25 != v13) {
        objc_enumerationMutation(v6);
      }
      if ([*(id *)(*((void *)&v24 + 1) + 8 * v14) hasGreenTeaWithValue:v3]) {
        goto LABEL_30;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v24 objects:v33 count:16];
        if (v12) {
          goto LABEL_13;
        }
        break;
      }
    }
  }

  -[GEOETATrafficUpdateRequest _readTripOrigin]((uint64_t)self);
  if (![(GEOLocation *)self->_tripOrigin hasGreenTeaWithValue:v3])
  {
    -[GEOETATrafficUpdateRequest _readWaypointRoute]((uint64_t)self);
    if (![(GEOETATrafficUpdateWaypointRoute *)self->_waypointRoute hasGreenTeaWithValue:v3])
    {
      -[GEOETATrafficUpdateRequest _readWaypointTypeds]((uint64_t)self);
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      objc_super v6 = self->_waypointTypeds;
      uint64_t v15 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v32 count:16];
      if (!v15)
      {
LABEL_29:
        BOOL v5 = 0;
LABEL_31:

        return v5;
      }
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
LABEL_23:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v18), "hasGreenTeaWithValue:", v3, (void)v20)) {
          break;
        }
        if (v16 == ++v18)
        {
          uint64_t v16 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v32 count:16];
          if (v16) {
            goto LABEL_23;
          }
          goto LABEL_29;
        }
      }
LABEL_30:
      BOOL v5 = 1;
      goto LABEL_31;
    }
  }
  return 1;
}

- (unsigned)requestTypeCode
{
  return 48;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  long long v37 = (id *)a3;
  [(GEOETATrafficUpdateRequest *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v37 + 1, self->_reader);
  *((_DWORD *)v37 + 62) = self->_readerMarkPos;
  *((_DWORD *)v37 + 63) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_currentUserLocation) {
    objc_msgSend(v37, "setCurrentUserLocation:");
  }
  if (self->_routeAttributes) {
    objc_msgSend(v37, "setRouteAttributes:");
  }
  if (*((unsigned char *)&self->_flags + 1))
  {
    *((unsigned char *)v37 + 284) = self->_includeBetterRouteSuggestion;
    v37[36] = (id)((unint64_t)v37[36] | 0x100);
  }
  if ([(GEOETATrafficUpdateRequest *)self routesCount])
  {
    [v37 clearRoutes];
    unint64_t v4 = [(GEOETATrafficUpdateRequest *)self routesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOETATrafficUpdateRequest *)self routeAtIndex:i];
        [v37 addRoute:v7];
      }
    }
  }
  if (self->_waypointRoute) {
    objc_msgSend(v37, "setWaypointRoute:");
  }
  uint64_t v8 = v37;
  if (self->_clientCapabilities)
  {
    objc_msgSend(v37, "setClientCapabilities:");
    uint64_t v8 = v37;
  }
  if (self->_directionsResponseID)
  {
    objc_msgSend(v37, "setDirectionsResponseID:");
    uint64_t v8 = v37;
  }
  if (self->_etauResponseID)
  {
    objc_msgSend(v37, "setEtauResponseID:");
    uint64_t v8 = v37;
  }
  $A9051F91FD5D6DAB60BDAAD82EC423D1 flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
    *(GEOSessionID *)(v8 + 3) = self->_sessionID;
    v8[36] = (id)((unint64_t)v8[36] | 1);
    $A9051F91FD5D6DAB60BDAAD82EC423D1 flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    v8[21] = *(id *)&self->_sessionRelativeTimestamp;
    v8[36] = (id)((unint64_t)v8[36] | 2);
  }
  if (self->_additionalEnabledMarkets) {
    objc_msgSend(v37, "setAdditionalEnabledMarkets:");
  }
  if ([(GEOETATrafficUpdateRequest *)self destinationWaypointTypedsCount])
  {
    [v37 clearDestinationWaypointTypeds];
    unint64_t v10 = [(GEOETATrafficUpdateRequest *)self destinationWaypointTypedsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(GEOETATrafficUpdateRequest *)self destinationWaypointTypedAtIndex:j];
        [v37 addDestinationWaypointTyped:v13];
      }
    }
  }
  if ([(GEOETATrafficUpdateRequest *)self waypointTypedsCount])
  {
    [v37 clearWaypointTypeds];
    unint64_t v14 = [(GEOETATrafficUpdateRequest *)self waypointTypedsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
      {
        uint64_t v17 = [(GEOETATrafficUpdateRequest *)self waypointTypedAtIndex:k];
        [v37 addWaypointTyped:v17];
      }
    }
  }
  uint64_t v18 = v37;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *((_DWORD *)v37 + 67) = self->_previouslyRejectedRerouteSavings;
    v37[36] = (id)((unint64_t)v37[36] | 0x10);
  }
  if (self->_sessionState)
  {
    objc_msgSend(v37, "setSessionState:");
    uint64_t v18 = v37;
  }
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    *((_DWORD *)v18 + 69) = self->_rerouteStatus;
    v18[36] = (id)((unint64_t)v18[36] | 0x40);
  }
  if (self->_commonOptions)
  {
    objc_msgSend(v37, "setCommonOptions:");
    uint64_t v18 = v37;
  }
  if (self->_abClientMetadata)
  {
    objc_msgSend(v37, "setAbClientMetadata:");
    uint64_t v18 = v37;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v18 + 66) = self->_maxAlternateRouteCount;
    v18[36] = (id)((unint64_t)v18[36] | 8);
  }
  if (self->_tripID) {
    objc_msgSend(v37, "setTripID:");
  }
  if (self->_requestingAppId) {
    objc_msgSend(v37, "setRequestingAppId:");
  }
  if (self->_tripOrigin) {
    objc_msgSend(v37, "setTripOrigin:");
  }
  if ([(GEOETATrafficUpdateRequest *)self displayedBannerIdsCount])
  {
    [v37 clearDisplayedBannerIds];
    unint64_t v19 = [(GEOETATrafficUpdateRequest *)self displayedBannerIdsCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (uint64_t m = 0; m != v20; ++m)
      {
        long long v22 = [(GEOETATrafficUpdateRequest *)self displayedBannerIdAtIndex:m];
        [v37 addDisplayedBannerId:v22];
      }
    }
  }
  if (self->_clientFeedbackInfo) {
    objc_msgSend(v37, "setClientFeedbackInfo:");
  }
  long long v23 = v37;
  if (self->_recentLocationHistory)
  {
    objc_msgSend(v37, "setRecentLocationHistory:");
    long long v23 = v37;
  }
  if (self->_privacyMetadata)
  {
    objc_msgSend(v37, "setPrivacyMetadata:");
    long long v23 = v37;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v23 + 65) = self->_displayedEta;
    v23[36] = (id)((unint64_t)v23[36] | 4);
  }
  if (self->_tripInfo)
  {
    objc_msgSend(v37, "setTripInfo:");
    long long v23 = v37;
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    *((_DWORD *)v23 + 68) = self->_purpose;
    v23[36] = (id)((unint64_t)v23[36] | 0x20);
  }
  if ([(GEOETATrafficUpdateRequest *)self serviceTagsCount])
  {
    [v37 clearServiceTags];
    unint64_t v24 = [(GEOETATrafficUpdateRequest *)self serviceTagsCount];
    if (v24)
    {
      unint64_t v25 = v24;
      for (uint64_t n = 0; n != v25; ++n)
      {
        long long v27 = [(GEOETATrafficUpdateRequest *)self serviceTagAtIndex:n];
        [v37 addServiceTag:v27];
      }
    }
  }
  if ([(GEOETATrafficUpdateRequest *)self trafficApiResponsesCount])
  {
    [v37 clearTrafficApiResponses];
    unint64_t v28 = [(GEOETATrafficUpdateRequest *)self trafficApiResponsesCount];
    if (v28)
    {
      unint64_t v29 = v28;
      for (iuint64_t i = 0; ii != v29; ++ii)
      {
        long long v31 = [(GEOETATrafficUpdateRequest *)self trafficApiResponsesAtIndex:ii];
        [v37 addTrafficApiResponses:v31];
      }
    }
  }
  if ([(GEOETATrafficUpdateRequest *)self trafficSnapshotIdsCount])
  {
    [v37 clearTrafficSnapshotIds];
    unint64_t v32 = [(GEOETATrafficUpdateRequest *)self trafficSnapshotIdsCount];
    if (v32)
    {
      unint64_t v33 = v32;
      for (juint64_t j = 0; jj != v33; ++jj)
      {
        uint64_t v35 = [(GEOETATrafficUpdateRequest *)self trafficSnapshotIdsAtIndex:jj];
        [v37 addTrafficSnapshotIds:v35];
      }
    }
  }
  uint64_t v36 = v37;
  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    *((_DWORD *)v37 + 70) = self->_trafficSnapshotUnixTime;
    v37[36] = (id)((unint64_t)v37[36] | 0x80);
  }
  if (self->_xpcUuid)
  {
    objc_msgSend(v37, "setXpcUuid:");
    uint64_t v36 = v37;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 4) & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOETATrafficUpdateRequestReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_73;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOETATrafficUpdateRequest *)self readAll:0];
  id v9 = [(GEOLocation *)self->_currentUserLocation copyWithZone:a3];
  unint64_t v10 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v9;

  id v11 = [(GEORouteAttributes *)self->_routeAttributes copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v11;

  if (*((unsigned char *)&self->_flags + 1))
  {
    *(unsigned char *)(v5 + 284) = self->_includeBetterRouteSuggestion;
    *(void *)(v5 + 288) |= 0x100uLL;
  }
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  uint64_t v13 = self->_routes;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v107 objects:v117 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v108;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v108 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v107 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addRoute:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v107 objects:v117 count:16];
    }
    while (v14);
  }

  id v18 = [(GEOETATrafficUpdateWaypointRoute *)self->_waypointRoute copyWithZone:a3];
  unint64_t v19 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v18;

  id v20 = [(GEOClientCapabilities *)self->_clientCapabilities copyWithZone:a3];
  long long v21 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v20;

  uint64_t v22 = [(NSData *)self->_directionsResponseID copyWithZone:a3];
  long long v23 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v22;

  uint64_t v24 = [(NSData *)self->_etauResponseID copyWithZone:a3];
  unint64_t v25 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v24;

  $A9051F91FD5D6DAB60BDAAD82EC423D1 flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
    *(GEOSessionID *)(v5 + 24) = self->_sessionID;
    *(void *)(v5 + 288) |= 1uLL;
    $A9051F91FD5D6DAB60BDAAD82EC423D1 flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    *(double *)(v5 + 168) = self->_sessionRelativeTimestamp;
    *(void *)(v5 + 288) |= 2uLL;
  }
  id v27 = [(GEOAdditionalEnabledMarkets *)self->_additionalEnabledMarkets copyWithZone:a3];
  unint64_t v28 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v27;

  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  unint64_t v29 = self->_destinationWaypointTypeds;
  uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v103 objects:v116 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v104;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v104 != v31) {
          objc_enumerationMutation(v29);
        }
        unint64_t v33 = (void *)[*(id *)(*((void *)&v103 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addDestinationWaypointTyped:v33];
      }
      uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v103 objects:v116 count:16];
    }
    while (v30);
  }

  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  v34 = self->_waypointTypeds;
  uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v99 objects:v115 count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v100;
    do
    {
      for (uint64_t k = 0; k != v35; ++k)
      {
        if (*(void *)v100 != v36) {
          objc_enumerationMutation(v34);
        }
        long long v38 = (void *)[*(id *)(*((void *)&v99 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addWaypointTyped:v38];
      }
      uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v99 objects:v115 count:16];
    }
    while (v35);
  }

  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 268) = self->_previouslyRejectedRerouteSavings;
    *(void *)(v5 + 288) |= 0x10uLL;
  }
  uint64_t v39 = [(NSData *)self->_sessionState copyWithZone:a3];
  long long v40 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v39;

  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 276) = self->_rerouteStatus;
    *(void *)(v5 + 288) |= 0x40uLL;
  }
  id v41 = [(GEOCommonOptions *)self->_commonOptions copyWithZone:a3];
  long long v42 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v41;

  id v43 = [(GEOPDABClientDatasetMetadata *)self->_abClientMetadata copyWithZone:a3];
  long long v44 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v43;

  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 264) = self->_maxAlternateRouteCount;
    *(void *)(v5 + 288) |= 8uLL;
  }
  uint64_t v45 = [(NSData *)self->_tripID copyWithZone:a3];
  long long v46 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v45;

  uint64_t v47 = [(NSString *)self->_requestingAppId copyWithZone:a3];
  long long v48 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v47;

  id v49 = [(GEOLocation *)self->_tripOrigin copyWithZone:a3];
  long long v50 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v49;

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v51 = self->_displayedBannerIds;
  uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v95 objects:v114 count:16];
  if (v52)
  {
    uint64_t v53 = *(void *)v96;
    do
    {
      for (uint64_t m = 0; m != v52; ++m)
      {
        if (*(void *)v96 != v53) {
          objc_enumerationMutation(v51);
        }
        long long v55 = (void *)[*(id *)(*((void *)&v95 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addDisplayedBannerId:v55];
      }
      uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v95 objects:v114 count:16];
    }
    while (v52);
  }

  id v56 = [(GEOClientFeedbackInfo *)self->_clientFeedbackInfo copyWithZone:a3];
  long long v57 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v56;

  id v58 = [(GEORecentLocationHistory *)self->_recentLocationHistory copyWithZone:a3];
  long long v59 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v58;

  id v60 = [(GEOPrivacyMetadata *)self->_privacyMetadata copyWithZone:a3];
  uint64_t v61 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v60;

  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 260) = self->_displayedEta;
    *(void *)(v5 + 288) |= 4uLL;
  }
  id v62 = [(GEOTripInfo *)self->_tripInfo copyWithZone:a3];
  long long v63 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v62;

  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 272) = self->_purpose;
    *(void *)(v5 + 288) |= 0x20uLL;
  }
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v64 = self->_serviceTags;
  uint64_t v65 = [(NSMutableArray *)v64 countByEnumeratingWithState:&v91 objects:v113 count:16];
  if (v65)
  {
    uint64_t v66 = *(void *)v92;
    do
    {
      for (uint64_t n = 0; n != v65; ++n)
      {
        if (*(void *)v92 != v66) {
          objc_enumerationMutation(v64);
        }
        v68 = (void *)[*(id *)(*((void *)&v91 + 1) + 8 * n) copyWithZone:a3];
        [(id)v5 addServiceTag:v68];
      }
      uint64_t v65 = [(NSMutableArray *)v64 countByEnumeratingWithState:&v91 objects:v113 count:16];
    }
    while (v65);
  }

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  v69 = self->_trafficApiResponses;
  uint64_t v70 = [(NSMutableArray *)v69 countByEnumeratingWithState:&v87 objects:v112 count:16];
  if (v70)
  {
    uint64_t v71 = *(void *)v88;
    do
    {
      for (iuint64_t i = 0; ii != v70; ++ii)
      {
        if (*(void *)v88 != v71) {
          objc_enumerationMutation(v69);
        }
        uint64_t v73 = (void *)[*(id *)(*((void *)&v87 + 1) + 8 * ii) copyWithZone:a3];
        [(id)v5 addTrafficApiResponses:v73];
      }
      uint64_t v70 = [(NSMutableArray *)v69 countByEnumeratingWithState:&v87 objects:v112 count:16];
    }
    while (v70);
  }

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  uint64_t v74 = self->_trafficSnapshotIds;
  uint64_t v75 = [(NSMutableArray *)v74 countByEnumeratingWithState:&v83 objects:v111 count:16];
  if (v75)
  {
    uint64_t v76 = *(void *)v84;
    do
    {
      for (juint64_t j = 0; jj != v75; ++jj)
      {
        if (*(void *)v84 != v76) {
          objc_enumerationMutation(v74);
        }
        uint64_t v78 = objc_msgSend(*(id *)(*((void *)&v83 + 1) + 8 * jj), "copyWithZone:", a3, (void)v83);
        [(id)v5 addTrafficSnapshotIds:v78];
      }
      uint64_t v75 = [(NSMutableArray *)v74 countByEnumeratingWithState:&v83 objects:v111 count:16];
    }
    while (v75);
  }

  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 280) = self->_trafficSnapshotUnixTime;
    *(void *)(v5 + 288) |= 0x80uLL;
  }
  uint64_t v79 = -[NSString copyWithZone:](self->_xpcUuid, "copyWithZone:", a3, (void)v83);
  v80 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v79;

  v81 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v81;
LABEL_73:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_106;
  }
  [(GEOETATrafficUpdateRequest *)self readAll:1];
  [v4 readAll:1];
  currentUserLocatiouint64_t n = self->_currentUserLocation;
  if ((unint64_t)currentUserLocation | *((void *)v4 + 10))
  {
    if (!-[GEOLocation isEqual:](currentUserLocation, "isEqual:")) {
      goto LABEL_106;
    }
  }
  routeAttributes = self->_routeAttributes;
  if ((unint64_t)routeAttributes | *((void *)v4 + 18))
  {
    if (!-[GEORouteAttributes isEqual:](routeAttributes, "isEqual:")) {
      goto LABEL_106;
    }
  }
  uint64_t v7 = *((void *)v4 + 36);
  if (*((unsigned char *)&self->_flags + 1))
  {
    if ((v7 & 0x100) == 0) {
      goto LABEL_106;
    }
    if (self->_includeBetterRouteSuggestion)
    {
      if (!*((unsigned char *)v4 + 284)) {
        goto LABEL_106;
      }
    }
    else if (*((unsigned char *)v4 + 284))
    {
      goto LABEL_106;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_106;
  }
  routes = self->_routes;
  if ((unint64_t)routes | *((void *)v4 + 19) && !-[NSMutableArray isEqual:](routes, "isEqual:")) {
    goto LABEL_106;
  }
  waypointRoute = self->_waypointRoute;
  if ((unint64_t)waypointRoute | *((void *)v4 + 28))
  {
    if (!-[GEOETATrafficUpdateWaypointRoute isEqual:](waypointRoute, "isEqual:")) {
      goto LABEL_106;
    }
  }
  clientCapabilities = self->_clientCapabilities;
  if ((unint64_t)clientCapabilities | *((void *)v4 + 7))
  {
    if (!-[GEOClientCapabilities isEqual:](clientCapabilities, "isEqual:")) {
      goto LABEL_106;
    }
  }
  directionsResponseID = self->_directionsResponseID;
  if ((unint64_t)directionsResponseID | *((void *)v4 + 12))
  {
    if (!-[NSData isEqual:](directionsResponseID, "isEqual:")) {
      goto LABEL_106;
    }
  }
  etauResponseID = self->_etauResponseID;
  if ((unint64_t)etauResponseID | *((void *)v4 + 14))
  {
    if (!-[NSData isEqual:](etauResponseID, "isEqual:")) {
      goto LABEL_106;
    }
  }
  $A9051F91FD5D6DAB60BDAAD82EC423D1 flags = self->_flags;
  uint64_t v14 = *((void *)v4 + 36);
  if (*(unsigned char *)&flags)
  {
    if ((v14 & 1) == 0) {
      goto LABEL_106;
    }
    if (self->_sessionID._high != *((void *)v4 + 3) || self->_sessionID._low != *((void *)v4 + 4)) {
      goto LABEL_106;
    }
  }
  else if (v14)
  {
    goto LABEL_106;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_sessionRelativeTimestamp != *((double *)v4 + 21)) {
      goto LABEL_106;
    }
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_106;
  }
  additionalEnabledMarkets = self->_additionalEnabledMarkets;
  if ((unint64_t)additionalEnabledMarkets | *((void *)v4 + 6)
    && !-[GEOAdditionalEnabledMarkets isEqual:](additionalEnabledMarkets, "isEqual:"))
  {
    goto LABEL_106;
  }
  destinationWaypointTypeds = self->_destinationWaypointTypeds;
  if ((unint64_t)destinationWaypointTypeds | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](destinationWaypointTypeds, "isEqual:")) {
      goto LABEL_106;
    }
  }
  waypointTypeds = self->_waypointTypeds;
  if ((unint64_t)waypointTypeds | *((void *)v4 + 29))
  {
    if (!-[NSMutableArray isEqual:](waypointTypeds, "isEqual:")) {
      goto LABEL_106;
    }
  }
  $A9051F91FD5D6DAB60BDAAD82EC423D1 v19 = self->_flags;
  uint64_t v20 = *((void *)v4 + 36);
  if ((*(unsigned char *)&v19 & 0x10) != 0)
  {
    if ((v20 & 0x10) == 0 || self->_previouslyRejectedRerouteSavings != *((_DWORD *)v4 + 67)) {
      goto LABEL_106;
    }
  }
  else if ((v20 & 0x10) != 0)
  {
    goto LABEL_106;
  }
  sessionState = self->_sessionState;
  if ((unint64_t)sessionState | *((void *)v4 + 22))
  {
    if (!-[NSData isEqual:](sessionState, "isEqual:")) {
      goto LABEL_106;
    }
    $A9051F91FD5D6DAB60BDAAD82EC423D1 v19 = self->_flags;
    uint64_t v20 = *((void *)v4 + 36);
  }
  if ((*(unsigned char *)&v19 & 0x40) != 0)
  {
    if ((v20 & 0x40) == 0 || self->_rerouteStatus != *((_DWORD *)v4 + 69)) {
      goto LABEL_106;
    }
  }
  else if ((v20 & 0x40) != 0)
  {
    goto LABEL_106;
  }
  commonOptions = self->_commonOptions;
  if ((unint64_t)commonOptions | *((void *)v4 + 9) && !-[GEOCommonOptions isEqual:](commonOptions, "isEqual:")) {
    goto LABEL_106;
  }
  abClientMetadata = self->_abClientMetadata;
  if ((unint64_t)abClientMetadata | *((void *)v4 + 5))
  {
    if (!-[GEOPDABClientDatasetMetadata isEqual:](abClientMetadata, "isEqual:")) {
      goto LABEL_106;
    }
  }
  uint64_t v24 = *((void *)v4 + 36);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((v24 & 8) == 0 || self->_maxAlternateRouteCount != *((_DWORD *)v4 + 66)) {
      goto LABEL_106;
    }
  }
  else if ((v24 & 8) != 0)
  {
    goto LABEL_106;
  }
  tripID = self->_tripID;
  if ((unint64_t)tripID | *((void *)v4 + 25) && !-[NSData isEqual:](tripID, "isEqual:")) {
    goto LABEL_106;
  }
  requestingAppId = self->_requestingAppId;
  if ((unint64_t)requestingAppId | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](requestingAppId, "isEqual:")) {
      goto LABEL_106;
    }
  }
  tripOrigiuint64_t n = self->_tripOrigin;
  if ((unint64_t)tripOrigin | *((void *)v4 + 27))
  {
    if (!-[GEOLocation isEqual:](tripOrigin, "isEqual:")) {
      goto LABEL_106;
    }
  }
  displayedBannerIds = self->_displayedBannerIds;
  if ((unint64_t)displayedBannerIds | *((void *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](displayedBannerIds, "isEqual:")) {
      goto LABEL_106;
    }
  }
  clientFeedbackInfo = self->_clientFeedbackInfo;
  if ((unint64_t)clientFeedbackInfo | *((void *)v4 + 8))
  {
    if (!-[GEOClientFeedbackInfo isEqual:](clientFeedbackInfo, "isEqual:")) {
      goto LABEL_106;
    }
  }
  recentLocationHistory = self->_recentLocationHistory;
  if ((unint64_t)recentLocationHistory | *((void *)v4 + 16))
  {
    if (!-[GEORecentLocationHistory isEqual:](recentLocationHistory, "isEqual:")) {
      goto LABEL_106;
    }
  }
  privacyMetadata = self->_privacyMetadata;
  if ((unint64_t)privacyMetadata | *((void *)v4 + 15))
  {
    if (!-[GEOPrivacyMetadata isEqual:](privacyMetadata, "isEqual:")) {
      goto LABEL_106;
    }
  }
  $A9051F91FD5D6DAB60BDAAD82EC423D1 v32 = self->_flags;
  uint64_t v33 = *((void *)v4 + 36);
  if ((*(unsigned char *)&v32 & 4) != 0)
  {
    if ((v33 & 4) == 0 || self->_displayedEta != *((_DWORD *)v4 + 65)) {
      goto LABEL_106;
    }
  }
  else if ((v33 & 4) != 0)
  {
    goto LABEL_106;
  }
  tripInfo = self->_tripInfo;
  if ((unint64_t)tripInfo | *((void *)v4 + 26))
  {
    if (-[GEOTripInfo isEqual:](tripInfo, "isEqual:"))
    {
      $A9051F91FD5D6DAB60BDAAD82EC423D1 v32 = self->_flags;
      uint64_t v33 = *((void *)v4 + 36);
      goto LABEL_88;
    }
LABEL_106:
    char v40 = 0;
    goto LABEL_107;
  }
LABEL_88:
  if ((*(unsigned char *)&v32 & 0x20) != 0)
  {
    if ((v33 & 0x20) == 0 || self->_purpose != *((_DWORD *)v4 + 68)) {
      goto LABEL_106;
    }
  }
  else if ((v33 & 0x20) != 0)
  {
    goto LABEL_106;
  }
  serviceTags = self->_serviceTags;
  if ((unint64_t)serviceTags | *((void *)v4 + 20)
    && !-[NSMutableArray isEqual:](serviceTags, "isEqual:"))
  {
    goto LABEL_106;
  }
  trafficApiResponses = self->_trafficApiResponses;
  if ((unint64_t)trafficApiResponses | *((void *)v4 + 23))
  {
    if (!-[NSMutableArray isEqual:](trafficApiResponses, "isEqual:")) {
      goto LABEL_106;
    }
  }
  trafficSnapshotIds = self->_trafficSnapshotIds;
  if ((unint64_t)trafficSnapshotIds | *((void *)v4 + 24))
  {
    if (!-[NSMutableArray isEqual:](trafficSnapshotIds, "isEqual:")) {
      goto LABEL_106;
    }
  }
  uint64_t v38 = *((void *)v4 + 36);
  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    if ((v38 & 0x80) == 0 || self->_trafficSnapshotUnixTime != *((_DWORD *)v4 + 70)) {
      goto LABEL_106;
    }
  }
  else if ((v38 & 0x80) != 0)
  {
    goto LABEL_106;
  }
  xpcUuid = self->_xpcUuid;
  if ((unint64_t)xpcUuid | *((void *)v4 + 30)) {
    char v40 = -[NSString isEqual:](xpcUuid, "isEqual:");
  }
  else {
    char v40 = 1;
  }
LABEL_107:

  return v40;
}

- (unint64_t)hash
{
  [(GEOETATrafficUpdateRequest *)self readAll:1];
  unint64_t v45 = [(GEOLocation *)self->_currentUserLocation hash];
  unint64_t v44 = [(GEORouteAttributes *)self->_routeAttributes hash];
  if (*((unsigned char *)&self->_flags + 1)) {
    uint64_t v43 = 2654435761 * self->_includeBetterRouteSuggestion;
  }
  else {
    uint64_t v43 = 0;
  }
  uint64_t v42 = [(NSMutableArray *)self->_routes hash];
  unint64_t v41 = [(GEOETATrafficUpdateWaypointRoute *)self->_waypointRoute hash];
  unint64_t v40 = [(GEOClientCapabilities *)self->_clientCapabilities hash];
  uint64_t v39 = [(NSData *)self->_directionsResponseID hash];
  uint64_t v38 = [(NSData *)self->_etauResponseID hash];
  $A9051F91FD5D6DAB60BDAAD82EC423D1 flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
    uint64_t v37 = PBHashBytes();
    if ((*(void *)&self->_flags & 2) != 0) {
      goto LABEL_6;
    }
LABEL_14:
    unint64_t v36 = 0;
    goto LABEL_15;
  }
  uint64_t v37 = 0;
  if ((*(unsigned char *)&flags & 2) == 0) {
    goto LABEL_14;
  }
LABEL_6:
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
  unint64_t v36 = v11;
LABEL_15:
  unint64_t v35 = [(GEOAdditionalEnabledMarkets *)self->_additionalEnabledMarkets hash];
  uint64_t v34 = [(NSMutableArray *)self->_destinationWaypointTypeds hash];
  uint64_t v33 = [(NSMutableArray *)self->_waypointTypeds hash];
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    uint64_t v32 = 2654435761 * self->_previouslyRejectedRerouteSavings;
  }
  else {
    uint64_t v32 = 0;
  }
  uint64_t v31 = [(NSData *)self->_sessionState hash];
  if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
    uint64_t v30 = 2654435761 * self->_rerouteStatus;
  }
  else {
    uint64_t v30 = 0;
  }
  unint64_t v29 = [(GEOCommonOptions *)self->_commonOptions hash];
  unint64_t v28 = [(GEOPDABClientDatasetMetadata *)self->_abClientMetadata hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    uint64_t v27 = 2654435761 * self->_maxAlternateRouteCount;
  }
  else {
    uint64_t v27 = 0;
  }
  uint64_t v26 = [(NSData *)self->_tripID hash];
  NSUInteger v25 = [(NSString *)self->_requestingAppId hash];
  unint64_t v24 = [(GEOLocation *)self->_tripOrigin hash];
  uint64_t v23 = [(NSMutableArray *)self->_displayedBannerIds hash];
  unint64_t v22 = [(GEOClientFeedbackInfo *)self->_clientFeedbackInfo hash];
  unint64_t v21 = [(GEORecentLocationHistory *)self->_recentLocationHistory hash];
  unint64_t v12 = [(GEOPrivacyMetadata *)self->_privacyMetadata hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v13 = 2654435761 * self->_displayedEta;
  }
  else {
    uint64_t v13 = 0;
  }
  unint64_t v14 = [(GEOTripInfo *)self->_tripInfo hash];
  if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
    uint64_t v15 = 2654435761 * self->_purpose;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = [(NSMutableArray *)self->_serviceTags hash];
  uint64_t v17 = [(NSMutableArray *)self->_trafficApiResponses hash];
  uint64_t v18 = [(NSMutableArray *)self->_trafficSnapshotIds hash];
  if ((*(unsigned char *)&self->_flags & 0x80) != 0) {
    uint64_t v19 = 2654435761 * self->_trafficSnapshotUnixTime;
  }
  else {
    uint64_t v19 = 0;
  }
  return v44 ^ v45 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ [(NSString *)self->_xpcUuid hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v4 = (char *)a3;
  [v4 readAll:0];
  currentUserLocatiouint64_t n = self->_currentUserLocation;
  uint64_t v6 = *((void *)v4 + 10);
  if (currentUserLocation)
  {
    if (v6) {
      -[GEOLocation mergeFrom:](currentUserLocation, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOETATrafficUpdateRequest setCurrentUserLocation:](self, "setCurrentUserLocation:");
  }
  routeAttributes = self->_routeAttributes;
  uint64_t v8 = *((void *)v4 + 18);
  if (routeAttributes)
  {
    if (v8) {
      -[GEORouteAttributes mergeFrom:](routeAttributes, "mergeFrom:");
    }
  }
  else if (v8)
  {
    [(GEOETATrafficUpdateRequest *)self setRouteAttributes:"setRouteAttributes:"];
  }
  if (v4[289])
  {
    self->_includeBetterRouteSuggestiouint64_t n = v4[284];
    *(void *)&self->_flags |= 0x100uLL;
  }
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v9 = *((id *)v4 + 19);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v89 objects:v99 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v90;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v90 != v12) {
          objc_enumerationMutation(v9);
        }
        [(GEOETATrafficUpdateRequest *)self addRoute:*(void *)(*((void *)&v89 + 1) + 8 * i)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v89 objects:v99 count:16];
    }
    while (v11);
  }

  waypointRoute = self->_waypointRoute;
  uint64_t v15 = *((void *)v4 + 28);
  if (waypointRoute)
  {
    if (v15) {
      -[GEOETATrafficUpdateWaypointRoute mergeFrom:](waypointRoute, "mergeFrom:");
    }
  }
  else if (v15)
  {
    [(GEOETATrafficUpdateRequest *)self setWaypointRoute:"setWaypointRoute:"];
  }
  clientCapabilities = self->_clientCapabilities;
  uint64_t v17 = *((void *)v4 + 7);
  if (clientCapabilities)
  {
    if (v17) {
      -[GEOClientCapabilities mergeFrom:](clientCapabilities, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[GEOETATrafficUpdateRequest setClientCapabilities:](self, "setClientCapabilities:");
  }
  if (*((void *)v4 + 12)) {
    -[GEOETATrafficUpdateRequest setDirectionsResponseID:](self, "setDirectionsResponseID:");
  }
  if (*((void *)v4 + 14)) {
    -[GEOETATrafficUpdateRequest setEtauResponseID:](self, "setEtauResponseID:");
  }
  uint64_t v18 = *((void *)v4 + 36);
  if (v18)
  {
    self->_sessionID = *(GEOSessionID *)(v4 + 24);
    *(void *)&self->_flags |= 1uLL;
    uint64_t v18 = *((void *)v4 + 36);
  }
  if ((v18 & 2) != 0)
  {
    self->_double sessionRelativeTimestamp = *((double *)v4 + 21);
    *(void *)&self->_flags |= 2uLL;
  }
  additionalEnabledMarkets = self->_additionalEnabledMarkets;
  uint64_t v20 = *((void *)v4 + 6);
  if (additionalEnabledMarkets)
  {
    if (v20) {
      -[GEOAdditionalEnabledMarkets mergeFrom:](additionalEnabledMarkets, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[GEOETATrafficUpdateRequest setAdditionalEnabledMarkets:](self, "setAdditionalEnabledMarkets:");
  }
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v21 = *((id *)v4 + 11);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v85 objects:v98 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v86;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v86 != v24) {
          objc_enumerationMutation(v21);
        }
        [(GEOETATrafficUpdateRequest *)self addDestinationWaypointTyped:*(void *)(*((void *)&v85 + 1) + 8 * j)];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v85 objects:v98 count:16];
    }
    while (v23);
  }

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v26 = *((id *)v4 + 29);
  uint64_t v27 = [v26 countByEnumeratingWithState:&v81 objects:v97 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v82;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v82 != v29) {
          objc_enumerationMutation(v26);
        }
        [(GEOETATrafficUpdateRequest *)self addWaypointTyped:*(void *)(*((void *)&v81 + 1) + 8 * k)];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v81 objects:v97 count:16];
    }
    while (v28);
  }

  if ((v4[288] & 0x10) != 0)
  {
    self->_previouslyRejectedRerouteSavings = *((_DWORD *)v4 + 67);
    *(void *)&self->_flags |= 0x10uLL;
  }
  if (*((void *)v4 + 22)) {
    -[GEOETATrafficUpdateRequest setSessionState:](self, "setSessionState:");
  }
  if ((v4[288] & 0x40) != 0)
  {
    self->_rerouteStatus = *((_DWORD *)v4 + 69);
    *(void *)&self->_flags |= 0x40uLL;
  }
  commonOptions = self->_commonOptions;
  uint64_t v32 = *((void *)v4 + 9);
  if (commonOptions)
  {
    if (v32) {
      -[GEOCommonOptions mergeFrom:](commonOptions, "mergeFrom:");
    }
  }
  else if (v32)
  {
    -[GEOETATrafficUpdateRequest setCommonOptions:](self, "setCommonOptions:");
  }
  abClientMetadata = self->_abClientMetadata;
  uint64_t v34 = *((void *)v4 + 5);
  if (abClientMetadata)
  {
    if (v34) {
      -[GEOPDABClientDatasetMetadata mergeFrom:](abClientMetadata, "mergeFrom:");
    }
  }
  else if (v34)
  {
    -[GEOETATrafficUpdateRequest setAbClientMetadata:](self, "setAbClientMetadata:");
  }
  if ((v4[288] & 8) != 0)
  {
    self->_maxAlternateRouteCount = *((_DWORD *)v4 + 66);
    *(void *)&self->_flags |= 8uLL;
  }
  if (*((void *)v4 + 25)) {
    -[GEOETATrafficUpdateRequest setTripID:](self, "setTripID:");
  }
  if (*((void *)v4 + 17)) {
    -[GEOETATrafficUpdateRequest setRequestingAppId:](self, "setRequestingAppId:");
  }
  tripOrigiuint64_t n = self->_tripOrigin;
  uint64_t v36 = *((void *)v4 + 27);
  if (tripOrigin)
  {
    if (v36) {
      -[GEOLocation mergeFrom:](tripOrigin, "mergeFrom:");
    }
  }
  else if (v36)
  {
    -[GEOETATrafficUpdateRequest setTripOrigin:](self, "setTripOrigin:");
  }
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v37 = *((id *)v4 + 13);
  uint64_t v38 = [v37 countByEnumeratingWithState:&v77 objects:v96 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v78;
    do
    {
      for (uint64_t m = 0; m != v39; ++m)
      {
        if (*(void *)v78 != v40) {
          objc_enumerationMutation(v37);
        }
        [(GEOETATrafficUpdateRequest *)self addDisplayedBannerId:*(void *)(*((void *)&v77 + 1) + 8 * m)];
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v77 objects:v96 count:16];
    }
    while (v39);
  }

  clientFeedbackInfo = self->_clientFeedbackInfo;
  uint64_t v43 = *((void *)v4 + 8);
  if (clientFeedbackInfo)
  {
    if (v43) {
      -[GEOClientFeedbackInfo mergeFrom:](clientFeedbackInfo, "mergeFrom:");
    }
  }
  else if (v43)
  {
    -[GEOETATrafficUpdateRequest setClientFeedbackInfo:](self, "setClientFeedbackInfo:");
  }
  recentLocationHistory = self->_recentLocationHistory;
  uint64_t v45 = *((void *)v4 + 16);
  if (recentLocationHistory)
  {
    if (v45) {
      -[GEORecentLocationHistory mergeFrom:](recentLocationHistory, "mergeFrom:");
    }
  }
  else if (v45)
  {
    -[GEOETATrafficUpdateRequest setRecentLocationHistory:](self, "setRecentLocationHistory:");
  }
  privacyMetadata = self->_privacyMetadata;
  uint64_t v47 = *((void *)v4 + 15);
  if (privacyMetadata)
  {
    if (v47) {
      -[GEOPrivacyMetadata mergeFrom:](privacyMetadata, "mergeFrom:");
    }
  }
  else if (v47)
  {
    -[GEOETATrafficUpdateRequest setPrivacyMetadata:](self, "setPrivacyMetadata:");
  }
  if ((v4[288] & 4) != 0)
  {
    self->_displayedEta = *((_DWORD *)v4 + 65);
    *(void *)&self->_flags |= 4uLL;
  }
  tripInfo = self->_tripInfo;
  uint64_t v49 = *((void *)v4 + 26);
  if (tripInfo)
  {
    if (v49) {
      -[GEOTripInfo mergeFrom:](tripInfo, "mergeFrom:");
    }
  }
  else if (v49)
  {
    -[GEOETATrafficUpdateRequest setTripInfo:](self, "setTripInfo:");
  }
  if ((v4[288] & 0x20) != 0)
  {
    self->_purpose = *((_DWORD *)v4 + 68);
    *(void *)&self->_flags |= 0x20uLL;
  }
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v50 = *((id *)v4 + 20);
  uint64_t v51 = [v50 countByEnumeratingWithState:&v73 objects:v95 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v74;
    do
    {
      for (uint64_t n = 0; n != v52; ++n)
      {
        if (*(void *)v74 != v53) {
          objc_enumerationMutation(v50);
        }
        [(GEOETATrafficUpdateRequest *)self addServiceTag:*(void *)(*((void *)&v73 + 1) + 8 * n)];
      }
      uint64_t v52 = [v50 countByEnumeratingWithState:&v73 objects:v95 count:16];
    }
    while (v52);
  }

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v55 = *((id *)v4 + 23);
  uint64_t v56 = [v55 countByEnumeratingWithState:&v69 objects:v94 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v70;
    do
    {
      for (iuint64_t i = 0; ii != v57; ++ii)
      {
        if (*(void *)v70 != v58) {
          objc_enumerationMutation(v55);
        }
        [(GEOETATrafficUpdateRequest *)self addTrafficApiResponses:*(void *)(*((void *)&v69 + 1) + 8 * ii)];
      }
      uint64_t v57 = [v55 countByEnumeratingWithState:&v69 objects:v94 count:16];
    }
    while (v57);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v60 = *((id *)v4 + 24);
  uint64_t v61 = [v60 countByEnumeratingWithState:&v65 objects:v93 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v66;
    do
    {
      for (juint64_t j = 0; jj != v62; ++jj)
      {
        if (*(void *)v66 != v63) {
          objc_enumerationMutation(v60);
        }
        -[GEOETATrafficUpdateRequest addTrafficSnapshotIds:](self, "addTrafficSnapshotIds:", *(void *)(*((void *)&v65 + 1) + 8 * jj), (void)v65);
      }
      uint64_t v62 = [v60 countByEnumeratingWithState:&v65 objects:v93 count:16];
    }
    while (v62);
  }

  if (v4[288] < 0)
  {
    self->_trafficSnapshotUnixTime = *((_DWORD *)v4 + 70);
    *(void *)&self->_flags |= 0x80uLL;
  }
  if (*((void *)v4 + 30)) {
    -[GEOETATrafficUpdateRequest setXpcUuid:](self, "setXpcUuid:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((unsigned char *)&self->_flags + 1) & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      double v5 = reader;
      objc_sync_enter(v5);
      GEOETATrafficUpdateRequestReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_1492);
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
  *(void *)&self->_flags |= 0x800000200uLL;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOETATrafficUpdateRequest *)self readAll:0];
    [(GEOLocation *)self->_currentUserLocation clearUnknownFields:1];
    [(GEORouteAttributes *)self->_routeAttributes clearUnknownFields:1];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    double v7 = self->_routes;
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

    [(GEOETATrafficUpdateWaypointRoute *)self->_waypointRoute clearUnknownFields:1];
    [(GEOClientCapabilities *)self->_clientCapabilities clearUnknownFields:1];
    [(GEOAdditionalEnabledMarkets *)self->_additionalEnabledMarkets clearUnknownFields:1];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v12 = self->_destinationWaypointTypeds;
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

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v17 = self->_waypointTypeds;
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

    [(GEOCommonOptions *)self->_commonOptions clearUnknownFields:1];
    [(GEOPDABClientDatasetMetadata *)self->_abClientMetadata clearUnknownFields:1];
    [(GEOLocation *)self->_tripOrigin clearUnknownFields:1];
    [(GEOClientFeedbackInfo *)self->_clientFeedbackInfo clearUnknownFields:1];
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

- (void)_readXpcUuid
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 292) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readXpcUuid_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasXpcUuid
{
  return self->_xpcUuid != 0;
}

- (NSString)xpcUuid
{
  -[GEOETATrafficUpdateRequest _readXpcUuid]((uint64_t)self);
  xpcUuid = self->_xpcUuid;

  return xpcUuid;
}

- (void)setXpcUuid:(id)a3
{
  *(void *)&self->_flags |= 0xC00000000uLL;
  objc_storeStrong((id *)&self->_xpcUuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcUuid, 0);
  objc_storeStrong((id *)&self->_waypointTypeds, 0);
  objc_storeStrong((id *)&self->_waypointRoute, 0);
  objc_storeStrong((id *)&self->_tripOrigin, 0);
  objc_storeStrong((id *)&self->_tripInfo, 0);
  objc_storeStrong((id *)&self->_tripID, 0);
  objc_storeStrong((id *)&self->_trafficSnapshotIds, 0);
  objc_storeStrong((id *)&self->_trafficApiResponses, 0);
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_storeStrong((id *)&self->_serviceTags, 0);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_requestingAppId, 0);
  objc_storeStrong((id *)&self->_recentLocationHistory, 0);
  objc_storeStrong((id *)&self->_privacyMetadata, 0);
  objc_storeStrong((id *)&self->_etauResponseID, 0);
  objc_storeStrong((id *)&self->_displayedBannerIds, 0);
  objc_storeStrong((id *)&self->_directionsResponseID, 0);
  objc_storeStrong((id *)&self->_destinationWaypointTypeds, 0);
  objc_storeStrong((id *)&self->_currentUserLocation, 0);
  objc_storeStrong((id *)&self->_commonOptions, 0);
  objc_storeStrong((id *)&self->_clientFeedbackInfo, 0);
  objc_storeStrong((id *)&self->_clientCapabilities, 0);
  objc_storeStrong((id *)&self->_additionalEnabledMarkets, 0);
  objc_storeStrong((id *)&self->_abClientMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end