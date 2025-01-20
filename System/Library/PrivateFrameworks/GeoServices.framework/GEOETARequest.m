@interface GEOETARequest
+ (BOOL)isValid:(id)a3;
+ (Class)destinationType;
+ (Class)destinationWaypointTypedType;
+ (Class)deviceHistoricalLocationType;
+ (Class)intermediateWaypointTypedType;
+ (Class)originalRouteZilchPointsType;
+ (Class)serviceTagType;
+ (Class)trafficApiResponsesType;
+ (Class)trafficSnapshotIdsType;
- (BOOL)allowPartialResults;
- (BOOL)hasAbClientMetadata;
- (BOOL)hasAdditionalEnabledMarkets;
- (BOOL)hasAllowPartialResults;
- (BOOL)hasAutomobileOptions;
- (BOOL)hasClientCapabilities;
- (BOOL)hasCommonOptions;
- (BOOL)hasCyclingOptions;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIncludeDistance;
- (BOOL)hasIncludeEtaRouteIncidents;
- (BOOL)hasIncludeHistoricTravelTime;
- (BOOL)hasIncludeRouteTrafficDetail;
- (BOOL)hasIncludeShortTrafficSummary;
- (BOOL)hasIsFromAPI;
- (BOOL)hasLastKnownRoadLocation;
- (BOOL)hasOrigin;
- (BOOL)hasOriginWaypointTyped;
- (BOOL)hasOriginalRouteID;
- (BOOL)hasOriginalWaypointRoute;
- (BOOL)hasPathComputationOptions;
- (BOOL)hasPhoneticLocaleIdentifier;
- (BOOL)hasPrivacyMetadata;
- (BOOL)hasRecentLocationHistory;
- (BOOL)hasRequestingAppId;
- (BOOL)hasSessionID;
- (BOOL)hasSessionRelativeTimestamp;
- (BOOL)hasSessionState;
- (BOOL)hasTimepoint;
- (BOOL)hasTrafficSnapshotUnixTime;
- (BOOL)hasTransitOptions;
- (BOOL)hasTransportType;
- (BOOL)hasWalkingLimitMeters;
- (BOOL)hasWalkingOptions;
- (BOOL)includeDistance;
- (BOOL)includeEtaRouteIncidents;
- (BOOL)includeHistoricTravelTime;
- (BOOL)includeRouteTrafficDetail;
- (BOOL)includeShortTrafficSummary;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromAPI;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (GEOAdditionalEnabledMarkets)additionalEnabledMarkets;
- (GEOAutomobileOptions)automobileOptions;
- (GEOClientCapabilities)clientCapabilities;
- (GEOCommonOptions)commonOptions;
- (GEOCyclingOptions)cyclingOptions;
- (GEOETARequest)init;
- (GEOETARequest)initWithData:(id)a3;
- (GEOETARequest)initWithDictionary:(id)a3;
- (GEOETARequest)initWithJSON:(id)a3;
- (GEOETARequest)initWithQuickETARequest:(id)a3;
- (GEOLocation)lastKnownRoadLocation;
- (GEOOriginalWaypointRoute)originalWaypointRoute;
- (GEOPDABClientDatasetMetadata)abClientMetadata;
- (GEOPathComputationOptions)pathComputationOptions;
- (GEOPrivacyMetadata)privacyMetadata;
- (GEORecentLocationHistory)recentLocationHistory;
- (GEOSessionID)sessionID;
- (GEOTimepoint)timepoint;
- (GEOTransitOptions)transitOptions;
- (GEOWalkingOptions)walkingOptions;
- (GEOWaypoint)origin;
- (GEOWaypointTyped)originWaypointTyped;
- (NSData)originalRouteID;
- (NSData)sessionState;
- (NSMutableArray)destinationWaypointTypeds;
- (NSMutableArray)destinations;
- (NSMutableArray)deviceHistoricalLocations;
- (NSMutableArray)intermediateWaypointTypeds;
- (NSMutableArray)originalRouteZilchPoints;
- (NSMutableArray)serviceTags;
- (NSMutableArray)trafficApiResponses;
- (NSMutableArray)trafficSnapshotIds;
- (NSString)phoneticLocaleIdentifier;
- (NSString)requestingAppId;
- (PBUnknownFields)unknownFields;
- (double)sessionRelativeTimestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)destinationAtIndex:(unint64_t)a3;
- (id)destinationWaypointTypedAtIndex:(unint64_t)a3;
- (id)deviceHistoricalLocationAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)intermediateWaypointTypedAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)originalRouteZilchPointsAtIndex:(unint64_t)a3;
- (id)serviceTagAtIndex:(unint64_t)a3;
- (id)trafficApiResponsesAtIndex:(unint64_t)a3;
- (id)trafficSnapshotIdsAtIndex:(unint64_t)a3;
- (id)transportTypeAsString:(int)a3;
- (int)StringAsTransportType:(id)a3;
- (int)transportType;
- (unint64_t)destinationWaypointTypedsCount;
- (unint64_t)destinationsCount;
- (unint64_t)deviceHistoricalLocationsCount;
- (unint64_t)hash;
- (unint64_t)intermediateWaypointTypedsCount;
- (unint64_t)originalRouteZilchPointsCount;
- (unint64_t)serviceTagsCount;
- (unint64_t)trafficApiResponsesCount;
- (unint64_t)trafficSnapshotIdsCount;
- (unsigned)requestTypeCode;
- (unsigned)trafficSnapshotUnixTime;
- (unsigned)walkingLimitMeters;
- (void)_addNoFlagsDestination:(uint64_t)a1;
- (void)_addNoFlagsDestinationWaypointTyped:(uint64_t)a1;
- (void)_addNoFlagsDeviceHistoricalLocation:(uint64_t)a1;
- (void)_addNoFlagsIntermediateWaypointTyped:(uint64_t)a1;
- (void)_addNoFlagsOriginalRouteZilchPoints:(uint64_t)a1;
- (void)_addNoFlagsServiceTag:(uint64_t)a1;
- (void)_addNoFlagsTrafficApiResponses:(uint64_t)a1;
- (void)_addNoFlagsTrafficSnapshotIds:(uint64_t)a1;
- (void)_readAbClientMetadata;
- (void)_readAdditionalEnabledMarkets;
- (void)_readAutomobileOptions;
- (void)_readClientCapabilities;
- (void)_readCommonOptions;
- (void)_readCyclingOptions;
- (void)_readDestinationWaypointTypeds;
- (void)_readDestinations;
- (void)_readDeviceHistoricalLocations;
- (void)_readIntermediateWaypointTypeds;
- (void)_readLastKnownRoadLocation;
- (void)_readOrigin;
- (void)_readOriginWaypointTyped;
- (void)_readOriginalRouteID;
- (void)_readOriginalRouteZilchPoints;
- (void)_readOriginalWaypointRoute;
- (void)_readPathComputationOptions;
- (void)_readPhoneticLocaleIdentifier;
- (void)_readPrivacyMetadata;
- (void)_readRecentLocationHistory;
- (void)_readRequestingAppId;
- (void)_readServiceTags;
- (void)_readSessionState;
- (void)_readTrafficApiResponses;
- (void)_readTrafficSnapshotIds;
- (void)_readTransitOptions;
- (void)_readWalkingOptions;
- (void)addDestination:(id)a3;
- (void)addDestinationWaypointTyped:(id)a3;
- (void)addDeviceHistoricalLocation:(id)a3;
- (void)addIntermediateWaypointTyped:(id)a3;
- (void)addOriginalRouteZilchPoints:(id)a3;
- (void)addServiceTag:(id)a3;
- (void)addTrafficApiResponses:(id)a3;
- (void)addTrafficSnapshotIds:(id)a3;
- (void)clearDestinationWaypointTypeds;
- (void)clearDestinations;
- (void)clearDeviceHistoricalLocations;
- (void)clearIntermediateWaypointTypeds;
- (void)clearOriginalRouteZilchPoints;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearServiceTags;
- (void)clearTrafficApiResponses;
- (void)clearTrafficSnapshotIds;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAbClientMetadata:(id)a3;
- (void)setAdditionalEnabledMarkets:(id)a3;
- (void)setAllowPartialResults:(BOOL)a3;
- (void)setAutomobileOptions:(id)a3;
- (void)setClientCapabilities:(id)a3;
- (void)setCommonOptions:(id)a3;
- (void)setCyclingOptions:(id)a3;
- (void)setDestinationWaypointTypeds:(id)a3;
- (void)setDestinations:(id)a3;
- (void)setDeviceHistoricalLocations:(id)a3;
- (void)setHasAllowPartialResults:(BOOL)a3;
- (void)setHasIncludeDistance:(BOOL)a3;
- (void)setHasIncludeEtaRouteIncidents:(BOOL)a3;
- (void)setHasIncludeHistoricTravelTime:(BOOL)a3;
- (void)setHasIncludeRouteTrafficDetail:(BOOL)a3;
- (void)setHasIncludeShortTrafficSummary:(BOOL)a3;
- (void)setHasIsFromAPI:(BOOL)a3;
- (void)setHasSessionID:(BOOL)a3;
- (void)setHasSessionRelativeTimestamp:(BOOL)a3;
- (void)setHasTimepoint:(BOOL)a3;
- (void)setHasTrafficSnapshotUnixTime:(BOOL)a3;
- (void)setHasTransportType:(BOOL)a3;
- (void)setHasWalkingLimitMeters:(BOOL)a3;
- (void)setIncludeDistance:(BOOL)a3;
- (void)setIncludeEtaRouteIncidents:(BOOL)a3;
- (void)setIncludeHistoricTravelTime:(BOOL)a3;
- (void)setIncludeRouteTrafficDetail:(BOOL)a3;
- (void)setIncludeShortTrafficSummary:(BOOL)a3;
- (void)setIntermediateWaypointTypeds:(id)a3;
- (void)setIsFromAPI:(BOOL)a3;
- (void)setLastKnownRoadLocation:(id)a3;
- (void)setOrigin:(id)a3;
- (void)setOriginWaypointTyped:(id)a3;
- (void)setOriginalRouteID:(id)a3;
- (void)setOriginalRouteZilchPoints:(id)a3;
- (void)setOriginalWaypointRoute:(id)a3;
- (void)setPathComputationOptions:(id)a3;
- (void)setPhoneticLocaleIdentifier:(id)a3;
- (void)setPrivacyMetadata:(id)a3;
- (void)setRecentLocationHistory:(id)a3;
- (void)setRequestingAppId:(id)a3;
- (void)setServiceTags:(id)a3;
- (void)setSessionID:(GEOSessionID)a3;
- (void)setSessionRelativeTimestamp:(double)a3;
- (void)setSessionState:(id)a3;
- (void)setTimepoint:(GEOTimepoint *)a3;
- (void)setTrafficApiResponses:(id)a3;
- (void)setTrafficSnapshotIds:(id)a3;
- (void)setTrafficSnapshotUnixTime:(unsigned int)a3;
- (void)setTransitOptions:(id)a3;
- (void)setTransportType:(int)a3;
- (void)setWalkingLimitMeters:(unsigned int)a3;
- (void)setWalkingOptions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOETARequest

- (GEOETARequest)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOETARequest;
  v3 = [(GEOETARequest *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)requestTypeCode
{
  return 52;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

void __63__GEOETARequest_GEOQuickETARequester__initWithQuickETARequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10)
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

- (void)setSessionRelativeTimestamp:(double)a3
{
  *(void *)&self->_flags |= 0x20000000004uLL;
  self->_sessionRelativeTimestamp = a3;
}

- (void)setSessionID:(GEOSessionID)a3
{
  *(void *)&self->_flags |= 0x20000000002uLL;
  self->_sessionID = a3;
}

- (BOOL)readFrom:(id)a3
{
  return GEOETARequestReadAllFrom((uint64_t)self, a3, 0);
}

- (GEOAutomobileOptions)automobileOptions
{
  -[GEOETARequest _readAutomobileOptions]((uint64_t)self);
  automobileOptions = self->_automobileOptions;

  return automobileOptions;
}

- (void)_readAutomobileOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 322) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAutomobileOptions_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (GEOETARequest)initWithQuickETARequest:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)GEOETARequest;
  v5 = [(GEOETARequest *)&v60 init];
  if (v5)
  {
    v6 = +[GEOUserSession sharedInstance];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __63__GEOETARequest_GEOQuickETARequester__initWithQuickETARequest___block_invoke;
    v58[3] = &unk_1E53DC588;
    objc_super v7 = v5;
    v59 = v7;
    [v6 shortSessionValues:v58];

    v8 = +[GEOAdditionalEnabledMarkets additionalEnabledMarkets];
    [(GEOETARequest *)v7 setAdditionalEnabledMarkets:v8];

    [(GEOETARequest *)v7 setWalkingLimitMeters:0];
    v9 = [v4 sourceWaypoint];
    v10 = [v9 geoWaypointTyped];
    [(GEOETARequest *)v7 setOriginWaypointTyped:v10];

    v11 = [v4 destinationWaypoint];
    v12 = [v11 geoWaypointTyped];
    [(GEOETARequest *)v7 addDestinationWaypointTyped:v12];

    [(GEOETARequest *)v7 setIncludeHistoricTravelTime:1];
    -[GEOETARequest setTransportType:](v7, "setTransportType:", [v4 transportType]);
    v13 = [v4 automobileOptions];
    v14 = (void *)[v13 copy];
    [(GEOETARequest *)v7 setAutomobileOptions:v14];

    v15 = [v4 transitOptions];
    v16 = (void *)[v15 copy];
    [(GEOETARequest *)v7 setTransitOptions:v16];

    id v17 = [v4 walkingOptions];
    v18 = (void *)[v17 copy];
    [(GEOETARequest *)v7 setWalkingOptions:v18];

    v19 = [v4 cyclingOptions];
    v20 = (void *)[v19 copy];
    [(GEOETARequest *)v7 setCyclingOptions:v20];

    v21 = [(GEOETARequest *)v7 automobileOptions];
    if (v21)
    {
    }
    else if (![(GEOETARequest *)v7 transportType])
    {
      v25 = objc_alloc_init(GEOAutomobileOptions);
      [(GEOETARequest *)v7 setAutomobileOptions:v25];

      v26 = [(GEOETARequest *)v7 automobileOptions];
      [v26 setIncludeHistoricTravelTime:1];

      v23 = [(GEOETARequest *)v7 automobileOptions];
      [(GEOTransitOptions *)v23 setTrafficType:3];
      goto LABEL_17;
    }
    v22 = [(GEOETARequest *)v7 transitOptions];
    if (v22)
    {
    }
    else if ([(GEOETARequest *)v7 transportType] == 1)
    {
      v23 = objc_alloc_init(GEOTransitOptions);
      [(GEOETARequest *)v7 setTransitOptions:v23];
      goto LABEL_17;
    }
    v24 = [(GEOETARequest *)v7 walkingOptions];
    if (v24)
    {
    }
    else if ([(GEOETARequest *)v7 transportType] == 2)
    {
      v23 = objc_alloc_init(GEOWalkingOptions);
      [(GEOETARequest *)v7 setWalkingOptions:v23];
      goto LABEL_17;
    }
    v23 = [(GEOETARequest *)v7 cyclingOptions];
    if (!v23)
    {
      if ([(GEOETARequest *)v7 transportType] != 3) {
        goto LABEL_18;
      }
      v23 = objc_alloc_init(GEOCyclingOptions);
      [(GEOETARequest *)v7 setCyclingOptions:v23];
    }
LABEL_17:

LABEL_18:
    v27 = [v4 additionalTransportTypesRequested];

    if (v27)
    {
      id v49 = v4;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      v28 = [v4 additionalTransportTypesRequested];
      uint64_t v29 = [v28 countByEnumeratingWithState:&v54 objects:v61 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v55 != v31) {
              objc_enumerationMutation(v28);
            }
            switch([*(id *)(*((void *)&v54 + 1) + 8 * i) integerValue])
            {
              case 0:
                v33 = [(GEOETARequest *)v7 automobileOptions];

                if (!v33)
                {
                  v34 = objc_alloc_init(GEOAutomobileOptions);
                  [(GEOETARequest *)v7 setAutomobileOptions:v34];

                  v35 = [(GEOETARequest *)v7 automobileOptions];
                  [v35 setIncludeHistoricTravelTime:1];

                  v36 = [(GEOETARequest *)v7 automobileOptions];
                  [(GEOTransitOptions *)v36 setTrafficType:3];
                  goto LABEL_33;
                }
                break;
              case 1:
                v37 = [(GEOETARequest *)v7 transitOptions];

                if (!v37)
                {
                  v36 = objc_alloc_init(GEOTransitOptions);
                  [(GEOETARequest *)v7 setTransitOptions:v36];
                  goto LABEL_33;
                }
                break;
              case 2:
                v38 = [(GEOETARequest *)v7 walkingOptions];

                if (!v38)
                {
                  v36 = objc_alloc_init(GEOWalkingOptions);
                  [(GEOETARequest *)v7 setWalkingOptions:v36];
                  goto LABEL_33;
                }
                break;
              case 3:
                v39 = [(GEOETARequest *)v7 cyclingOptions];

                if (!v39)
                {
                  v36 = objc_alloc_init(GEOCyclingOptions);
                  [(GEOETARequest *)v7 setCyclingOptions:v36];
LABEL_33:
                }
                break;
              default:
                continue;
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v54 objects:v61 count:16];
        }
        while (v30);
      }

      id v4 = v49;
    }
    -[GEOETARequest setIncludeDistance:](v7, "setIncludeDistance:", [v4 includeDistance]);
    v40 = [v4 arrivalDate];
    v41 = [v4 departureDate];
    v42 = v41;
    if ((v40 == 0) != (v41 != 0)) {
      goto LABEL_43;
    }
    if (v40)
    {
      v43 = v53;
      [v40 timeIntervalSinceReferenceDate];
      uint64_t v52 = 0;
      int v45 = 1;
      v46 = &v52;
    }
    else
    {
      if (!v41)
      {
LABEL_43:
        v47 = v7;

        goto LABEL_44;
      }
      v43 = v51;
      [v41 timeIntervalSinceReferenceDate];
      int v45 = 0;
      uint64_t v50 = 0;
      v46 = &v50;
    }
    v46[1] = v44;
    *((_DWORD *)v46 + 4) = v45;
    *((unsigned char *)v46 + 20) = 6;
    v43[2] = 0;
    *(_WORD *)v43 = 0;
    -[GEOETARequest setTimepoint:](v7, "setTimepoint:");
    goto LABEL_43;
  }
LABEL_44:

  return v5;
}

- (int)transportType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $D0E8D0B55C880D94E0AADD8662313484 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x10) != 0) {
    return self->_transportType;
  }
  else {
    return 0;
  }
}

- (void)setOriginWaypointTyped:(id)a3
{
  *(void *)&self->_flags |= 0x20002000000uLL;
  objc_storeStrong((id *)&self->_originWaypointTyped, a3);
}

- (GEOWalkingOptions)walkingOptions
{
  -[GEOETARequest _readWalkingOptions]((uint64_t)self);
  walkingOptions = self->_walkingOptions;

  return walkingOptions;
}

- (GEOTransitOptions)transitOptions
{
  -[GEOETARequest _readTransitOptions]((uint64_t)self);
  transitOptions = self->_transitOptions;

  return transitOptions;
}

- (void)setWalkingOptions:(id)a3
{
  *(void *)&self->_flags |= 0x30000000000uLL;
  objc_storeStrong((id *)&self->_walkingOptions, a3);
}

- (void)setWalkingLimitMeters:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x20000000020uLL;
  self->_walkingLimitMeters = a3;
}

- (void)setTransportType:(int)a3
{
  *(void *)&self->_flags |= 0x20000000010uLL;
  self->_transportType = a3;
}

- (void)setTransitOptions:(id)a3
{
  *(void *)&self->_flags |= 0x28000000000uLL;
  objc_storeStrong((id *)&self->_transitOptions, a3);
}

- (void)setTimepoint:(GEOTimepoint *)a3
{
  *(void *)&self->_flags |= 0x20000000001uLL;
  uint64_t v3 = *(void *)&a3->_type;
  *(_OWORD *)&self->_timepoint._currentUserTime = *(_OWORD *)&a3->_currentUserTime;
  *(void *)&self->_timepoint._type = v3;
}

- (void)setIncludeHistoricTravelTime:(BOOL)a3
{
  *(void *)&self->_flags |= 0x20000000100uLL;
  self->_includeHistoricTravelTime = a3;
}

- (void)setIncludeDistance:(BOOL)a3
{
  *(void *)&self->_flags |= 0x20000000080uLL;
  self->_includeDistance = a3;
}

- (void)setCyclingOptions:(id)a3
{
  *(void *)&self->_flags |= 0x20000080000uLL;
  objc_storeStrong((id *)&self->_cyclingOptions, a3);
}

- (void)setAutomobileOptions:(id)a3
{
  *(void *)&self->_flags |= 0x20000010000uLL;
  objc_storeStrong((id *)&self->_automobileOptions, a3);
}

- (void)setAdditionalEnabledMarkets:(id)a3
{
  *(void *)&self->_flags |= 0x20000008000uLL;
  objc_storeStrong((id *)&self->_additionalEnabledMarkets, a3);
}

- (GEOCyclingOptions)cyclingOptions
{
  -[GEOETARequest _readCyclingOptions]((uint64_t)self);
  cyclingOptions = self->_cyclingOptions;

  return cyclingOptions;
}

- (void)addDestinationWaypointTyped:(id)a3
{
  id v4 = a3;
  -[GEOETARequest _readDestinationWaypointTypeds]((uint64_t)self);
  -[GEOETARequest _addNoFlagsDestinationWaypointTyped:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x20000000000uLL;
}

- (void)_readDestinationWaypointTypeds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 322) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDestinationWaypointTypeds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (void)_addNoFlagsDestinationWaypointTyped:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 112);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = v5;

      id v4 = *(void **)(a1 + 112);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readWalkingOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 325) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWalkingOptions_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (void)_readTransitOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 324) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitOptions_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (void)_readCyclingOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 322) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCyclingOptions_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (void)setAbClientMetadata:(id)a3
{
  *(void *)&self->_flags |= 0x20000004000uLL;
  objc_storeStrong((id *)&self->_abClientMetadata, a3);
}

- (void)setRequestingAppId:(id)a3
{
  *(void *)&self->_flags |= 0x20400000000uLL;
  objc_storeStrong((id *)&self->_requestingAppId, a3);
}

- (void)setIsFromAPI:(BOOL)a3
{
  *(void *)&self->_flags |= 0x20000001000uLL;
  self->_isFromAPI = a3;
}

- (GEOWaypointTyped)originWaypointTyped
{
  -[GEOETARequest _readOriginWaypointTyped]((uint64_t)self);
  originWaypointTyped = self->_originWaypointTyped;

  return originWaypointTyped;
}

- (void)_readOriginWaypointTyped
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 323) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginWaypointTyped_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (GEOWaypoint)origin
{
  -[GEOETARequest _readOrigin]((uint64_t)self);
  origin = self->_origin;

  return origin;
}

- (void)_readOrigin
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 323) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOrigin_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (void)setClientCapabilities:(id)a3
{
  *(void *)&self->_flags |= 0x20000020000uLL;
  objc_storeStrong((id *)&self->_clientCapabilities, a3);
}

- (GEOLocation)lastKnownRoadLocation
{
  -[GEOETARequest _readLastKnownRoadLocation]((uint64_t)self);
  lastKnownRoadLocation = self->_lastKnownRoadLocation;

  return lastKnownRoadLocation;
}

- (void)_readLastKnownRoadLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 323) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLastKnownRoadLocation_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasOrigin
{
  return self->_origin != 0;
}

- (BOOL)hasOriginWaypointTyped
{
  return self->_originWaypointTyped != 0;
}

- (BOOL)hasLastKnownRoadLocation
{
  return self->_lastKnownRoadLocation != 0;
}

- (GEOClientCapabilities)clientCapabilities
{
  -[GEOETARequest _readClientCapabilities]((uint64_t)self);
  clientCapabilities = self->_clientCapabilities;

  return clientCapabilities;
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (void)_readIntermediateWaypointTypeds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 322) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIntermediateWaypointTypeds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (void)_readDeviceHistoricalLocations
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 322) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceHistoricalLocations_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (void)_readDestinations
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 322) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDestinations_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (void)_readClientCapabilities
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 322) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientCapabilities_tags_4);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_trafficSnapshotIds, 0);
  objc_storeStrong((id *)&self->_trafficApiResponses, 0);
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_storeStrong((id *)&self->_serviceTags, 0);
  objc_storeStrong((id *)&self->_requestingAppId, 0);
  objc_storeStrong((id *)&self->_recentLocationHistory, 0);
  objc_storeStrong((id *)&self->_privacyMetadata, 0);
  objc_storeStrong((id *)&self->_phoneticLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_pathComputationOptions, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_originalWaypointRoute, 0);
  objc_storeStrong((id *)&self->_originalRouteZilchPoints, 0);
  objc_storeStrong((id *)&self->_originalRouteID, 0);
  objc_storeStrong((id *)&self->_originWaypointTyped, 0);
  objc_storeStrong((id *)&self->_lastKnownRoadLocation, 0);
  objc_storeStrong((id *)&self->_intermediateWaypointTypeds, 0);
  objc_storeStrong((id *)&self->_deviceHistoricalLocations, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_destinationWaypointTypeds, 0);
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_commonOptions, 0);
  objc_storeStrong((id *)&self->_clientCapabilities, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_additionalEnabledMarkets, 0);
  objc_storeStrong((id *)&self->_abClientMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)addServiceTag:(id)a3
{
  id v4 = a3;
  -[GEOETARequest _readServiceTags]((uint64_t)self);
  -[GEOETARequest _addNoFlagsServiceTag:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x20000000000uLL;
}

- (unint64_t)serviceTagsCount
{
  -[GEOETARequest _readServiceTags]((uint64_t)self);
  serviceTags = self->_serviceTags;

  return [(NSMutableArray *)serviceTags count];
}

- (void)_readServiceTags
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 324) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readServiceTags_tags_4);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (void)_addNoFlagsServiceTag:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 232);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 232);
      *(void *)(a1 + 232) = v5;

      id v4 = *(void **)(a1 + 232);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOETARequestIsDirty((uint64_t)self) & 1) == 0)
  {
    v41 = self->_reader;
    objc_sync_enter(v41);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v42 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v42];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v41);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOETARequest *)self readAll:0];
    $D0E8D0B55C880D94E0AADD8662313484 flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x10) != 0)
    {
      PBDataWriterWriteInt32Field();
      $D0E8D0B55C880D94E0AADD8662313484 flags = self->_flags;
    }
    if (*(unsigned char *)&flags)
    {
      uint64_t v75 = 0;
      PBDataWriterPlaceMark();
      GEOTimepointWriteTo((uint64_t)&self->_timepoint);
      PBDataWriterRecallMark();
    }
    if (self->_origin) {
      PBDataWriterWriteSubmessage();
    }
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v7 = self->_destinations;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v71 objects:v83 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v72 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v71 objects:v83 count:16];
      }
      while (v8);
    }

    $D0E8D0B55C880D94E0AADD8662313484 v11 = self->_flags;
    if ((*(_WORD *)&v11 & 0x100) != 0)
    {
      PBDataWriterWriteBOOLField();
      $D0E8D0B55C880D94E0AADD8662313484 v11 = self->_flags;
    }
    if ((*(unsigned char *)&v11 & 0x40) != 0)
    {
      PBDataWriterWriteBOOLField();
      $D0E8D0B55C880D94E0AADD8662313484 v11 = self->_flags;
    }
    if ((*(unsigned char *)&v11 & 0x80) != 0)
    {
      PBDataWriterWriteBOOLField();
      $D0E8D0B55C880D94E0AADD8662313484 v11 = self->_flags;
    }
    if ((*(unsigned char *)&v11 & 2) != 0)
    {
      uint64_t v75 = 0;
      PBDataWriterPlaceMark();
      PBDataWriterWriteUint64Field();
      PBDataWriterWriteUint64Field();
      PBDataWriterRecallMark();
      $D0E8D0B55C880D94E0AADD8662313484 v11 = self->_flags;
    }
    if ((*(unsigned char *)&v11 & 4) != 0)
    {
      PBDataWriterWriteDoubleField();
      $D0E8D0B55C880D94E0AADD8662313484 v11 = self->_flags;
    }
    if ((*(unsigned char *)&v11 & 0x20) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_additionalEnabledMarkets) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_originWaypointTyped) {
      PBDataWriterWriteSubmessage();
    }
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v12 = self->_destinationWaypointTypeds;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v67 objects:v82 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v68;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v68 != v14) {
            objc_enumerationMutation(v12);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v67 objects:v82 count:16];
      }
      while (v13);
    }

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v16 = self->_intermediateWaypointTypeds;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v63 objects:v81 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v64;
      do
      {
        for (uint64_t k = 0; k != v17; ++k)
        {
          if (*(void *)v64 != v18) {
            objc_enumerationMutation(v16);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v63 objects:v81 count:16];
      }
      while (v17);
    }

    if (self->_automobileOptions) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_cyclingOptions) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_transitOptions) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_walkingOptions) {
      PBDataWriterWriteSubmessage();
    }
    if ((*((unsigned char *)&self->_flags + 1) & 0x10) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_commonOptions) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_sessionState) {
      PBDataWriterWriteDataField();
    }
    if (self->_originalRouteID) {
      PBDataWriterWriteDataField();
    }
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v20 = self->_originalRouteZilchPoints;
    uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v59 objects:v80 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v60;
      do
      {
        for (uint64_t m = 0; m != v21; ++m)
        {
          if (*(void *)v60 != v22) {
            objc_enumerationMutation(v20);
          }
          PBDataWriterWriteDataField();
        }
        uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v59 objects:v80 count:16];
      }
      while (v21);
    }

    if (self->_originalWaypointRoute) {
      PBDataWriterWriteSubmessage();
    }
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v24 = self->_deviceHistoricalLocations;
    uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v55 objects:v79 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v56;
      do
      {
        for (uint64_t n = 0; n != v25; ++n)
        {
          if (*(void *)v56 != v26) {
            objc_enumerationMutation(v24);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v55 objects:v79 count:16];
      }
      while (v25);
    }

    if (self->_clientCapabilities) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_lastKnownRoadLocation) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_abClientMetadata) {
      PBDataWriterWriteSubmessage();
    }
    $D0E8D0B55C880D94E0AADD8662313484 v28 = self->_flags;
    if ((*(_WORD *)&v28 & 0x400) != 0)
    {
      PBDataWriterWriteBOOLField();
      $D0E8D0B55C880D94E0AADD8662313484 v28 = self->_flags;
    }
    if ((*(_WORD *)&v28 & 0x800) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_phoneticLocaleIdentifier) {
      PBDataWriterWriteStringField();
    }
    if (self->_requestingAppId) {
      PBDataWriterWriteStringField();
    }
    if ((*((unsigned char *)&self->_flags + 1) & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_recentLocationHistory) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_privacyMetadata) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_pathComputationOptions) {
      PBDataWriterWriteSubmessage();
    }
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v29 = self->_serviceTags;
    uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v51 objects:v78 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v52;
      do
      {
        for (iuint64_t i = 0; ii != v30; ++ii)
        {
          if (*(void *)v52 != v31) {
            objc_enumerationMutation(v29);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v51 objects:v78 count:16];
      }
      while (v30);
    }

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v33 = self->_trafficApiResponses;
    uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v47 objects:v77 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v48;
      do
      {
        for (juint64_t j = 0; jj != v34; ++jj)
        {
          if (*(void *)v48 != v35) {
            objc_enumerationMutation(v33);
          }
          PBDataWriterWriteDataField();
        }
        uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v47 objects:v77 count:16];
      }
      while (v34);
    }

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v37 = self->_trafficSnapshotIds;
    uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v43 objects:v76 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v44;
      do
      {
        for (kuint64_t k = 0; kk != v38; ++kk)
        {
          if (*(void *)v44 != v39) {
            objc_enumerationMutation(v37);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v43 objects:v76 count:16];
      }
      while (v38);
    }

    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      PBDataWriterWriteUint32Field();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v43);
  }
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
      uint64_t v8 = (int *)&readAll__recursiveTag_89;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_89;
    }
    GEOETARequestReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOETARequestCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOETARequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOETARequest;
  v2 = [(GEOETARequest *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (void)setHasTransportType:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (a3) {
    uint64_t v3 = 0x20000000010;
  }
  self->_$D0E8D0B55C880D94E0AADD8662313484 flags = ($D0E8D0B55C880D94E0AADD8662313484)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasTransportType
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53F72E8[a3];
  }

  return v3;
}

- (int)StringAsTransportType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTOMOBILE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BICYCLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FERRY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RIDESHARE"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (GEOTimepoint)timepoint
{
  *retstr = self[1];
  return self;
}

- (void)setHasTimepoint:(BOOL)a3
{
  self->_$D0E8D0B55C880D94E0AADD8662313484 flags = ($D0E8D0B55C880D94E0AADD8662313484)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x20000000000);
}

- (BOOL)hasTimepoint
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)setOrigin:(id)a3
{
  *(void *)&self->_flags |= 0x20020000000uLL;
  objc_storeStrong((id *)&self->_origin, a3);
}

- (NSMutableArray)destinations
{
  -[GEOETARequest _readDestinations]((uint64_t)self);
  destinations = self->_destinations;

  return destinations;
}

- (void)setDestinations:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x20000000000uLL;
  destinations = self->_destinations;
  self->_destinations = v4;
}

- (void)clearDestinations
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x20000000000uLL;
  destinations = self->_destinations;

  [(NSMutableArray *)destinations removeAllObjects];
}

- (void)addDestination:(id)a3
{
  id v4 = a3;
  -[GEOETARequest _readDestinations]((uint64_t)self);
  -[GEOETARequest _addNoFlagsDestination:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x20000000000uLL;
}

- (void)_addNoFlagsDestination:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 120);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 120);
      *(void *)(a1 + 120) = v5;

      id v4 = *(void **)(a1 + 120);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)destinationsCount
{
  -[GEOETARequest _readDestinations]((uint64_t)self);
  destinations = self->_destinations;

  return [(NSMutableArray *)destinations count];
}

- (id)destinationAtIndex:(unint64_t)a3
{
  -[GEOETARequest _readDestinations]((uint64_t)self);
  destinations = self->_destinations;

  return (id)[(NSMutableArray *)destinations objectAtIndex:a3];
}

+ (Class)destinationType
{
  return (Class)objc_opt_class();
}

- (BOOL)includeHistoricTravelTime
{
  return self->_includeHistoricTravelTime;
}

- (void)setHasIncludeHistoricTravelTime:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (a3) {
    uint64_t v3 = 0x20000000100;
  }
  self->_$D0E8D0B55C880D94E0AADD8662313484 flags = ($D0E8D0B55C880D94E0AADD8662313484)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasIncludeHistoricTravelTime
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (BOOL)allowPartialResults
{
  return self->_allowPartialResults;
}

- (void)setAllowPartialResults:(BOOL)a3
{
  *(void *)&self->_flags |= 0x20000000040uLL;
  self->_allowPartialResults = a3;
}

- (void)setHasAllowPartialResults:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (a3) {
    uint64_t v3 = 0x20000000040;
  }
  self->_$D0E8D0B55C880D94E0AADD8662313484 flags = ($D0E8D0B55C880D94E0AADD8662313484)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasAllowPartialResults
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (BOOL)includeDistance
{
  return self->_includeDistance;
}

- (void)setHasIncludeDistance:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (a3) {
    uint64_t v3 = 0x20000000080;
  }
  self->_$D0E8D0B55C880D94E0AADD8662313484 flags = ($D0E8D0B55C880D94E0AADD8662313484)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasIncludeDistance
{
  return *(unsigned char *)&self->_flags >> 7;
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

- (void)setHasSessionID:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (a3) {
    uint64_t v3 = 0x20000000002;
  }
  self->_$D0E8D0B55C880D94E0AADD8662313484 flags = ($D0E8D0B55C880D94E0AADD8662313484)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasSessionID
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (double)sessionRelativeTimestamp
{
  return self->_sessionRelativeTimestamp;
}

- (void)setHasSessionRelativeTimestamp:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (a3) {
    uint64_t v3 = 0x20000000004;
  }
  self->_$D0E8D0B55C880D94E0AADD8662313484 flags = ($D0E8D0B55C880D94E0AADD8662313484)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasSessionRelativeTimestamp
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unsigned)walkingLimitMeters
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $D0E8D0B55C880D94E0AADD8662313484 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x20) != 0) {
    return self->_walkingLimitMeters;
  }
  else {
    return 800000;
  }
}

- (void)setHasWalkingLimitMeters:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (a3) {
    uint64_t v3 = 0x20000000020;
  }
  self->_$D0E8D0B55C880D94E0AADD8662313484 flags = ($D0E8D0B55C880D94E0AADD8662313484)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasWalkingLimitMeters
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (void)_readAdditionalEnabledMarkets
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 321) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAdditionalEnabledMarkets_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasAdditionalEnabledMarkets
{
  return self->_additionalEnabledMarkets != 0;
}

- (GEOAdditionalEnabledMarkets)additionalEnabledMarkets
{
  -[GEOETARequest _readAdditionalEnabledMarkets]((uint64_t)self);
  additionalEnabledMarkets = self->_additionalEnabledMarkets;

  return additionalEnabledMarkets;
}

- (NSMutableArray)destinationWaypointTypeds
{
  -[GEOETARequest _readDestinationWaypointTypeds]((uint64_t)self);
  destinationWaypointTypeds = self->_destinationWaypointTypeds;

  return destinationWaypointTypeds;
}

- (void)setDestinationWaypointTypeds:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x20000000000uLL;
  destinationWaypointTypeds = self->_destinationWaypointTypeds;
  self->_destinationWaypointTypeds = v4;
}

- (void)clearDestinationWaypointTypeds
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x20000000000uLL;
  destinationWaypointTypeds = self->_destinationWaypointTypeds;

  [(NSMutableArray *)destinationWaypointTypeds removeAllObjects];
}

- (unint64_t)destinationWaypointTypedsCount
{
  -[GEOETARequest _readDestinationWaypointTypeds]((uint64_t)self);
  destinationWaypointTypeds = self->_destinationWaypointTypeds;

  return [(NSMutableArray *)destinationWaypointTypeds count];
}

- (id)destinationWaypointTypedAtIndex:(unint64_t)a3
{
  -[GEOETARequest _readDestinationWaypointTypeds]((uint64_t)self);
  destinationWaypointTypeds = self->_destinationWaypointTypeds;

  return (id)[(NSMutableArray *)destinationWaypointTypeds objectAtIndex:a3];
}

+ (Class)destinationWaypointTypedType
{
  return (Class)objc_opt_class();
}

- (NSMutableArray)intermediateWaypointTypeds
{
  -[GEOETARequest _readIntermediateWaypointTypeds]((uint64_t)self);
  intermediateWaypointTypeds = self->_intermediateWaypointTypeds;

  return intermediateWaypointTypeds;
}

- (void)setIntermediateWaypointTypeds:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x20000000000uLL;
  intermediateWaypointTypeds = self->_intermediateWaypointTypeds;
  self->_intermediateWaypointTypeds = v4;
}

- (void)clearIntermediateWaypointTypeds
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x20000000000uLL;
  intermediateWaypointTypeds = self->_intermediateWaypointTypeds;

  [(NSMutableArray *)intermediateWaypointTypeds removeAllObjects];
}

- (void)addIntermediateWaypointTyped:(id)a3
{
  id v4 = a3;
  -[GEOETARequest _readIntermediateWaypointTypeds]((uint64_t)self);
  -[GEOETARequest _addNoFlagsIntermediateWaypointTyped:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x20000000000uLL;
}

- (void)_addNoFlagsIntermediateWaypointTyped:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 136);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 136);
      *(void *)(a1 + 136) = v5;

      id v4 = *(void **)(a1 + 136);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)intermediateWaypointTypedsCount
{
  -[GEOETARequest _readIntermediateWaypointTypeds]((uint64_t)self);
  intermediateWaypointTypeds = self->_intermediateWaypointTypeds;

  return [(NSMutableArray *)intermediateWaypointTypeds count];
}

- (id)intermediateWaypointTypedAtIndex:(unint64_t)a3
{
  -[GEOETARequest _readIntermediateWaypointTypeds]((uint64_t)self);
  intermediateWaypointTypeds = self->_intermediateWaypointTypeds;

  return (id)[(NSMutableArray *)intermediateWaypointTypeds objectAtIndex:a3];
}

+ (Class)intermediateWaypointTypedType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAutomobileOptions
{
  return self->_automobileOptions != 0;
}

- (BOOL)hasCyclingOptions
{
  return self->_cyclingOptions != 0;
}

- (BOOL)hasTransitOptions
{
  return self->_transitOptions != 0;
}

- (BOOL)hasWalkingOptions
{
  return self->_walkingOptions != 0;
}

- (BOOL)isFromAPI
{
  return self->_isFromAPI;
}

- (void)setHasIsFromAPI:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (a3) {
    uint64_t v3 = 0x20000001000;
  }
  self->_$D0E8D0B55C880D94E0AADD8662313484 flags = ($D0E8D0B55C880D94E0AADD8662313484)(*(void *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasIsFromAPI
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (void)_readCommonOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 322) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCommonOptions_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasCommonOptions
{
  return self->_commonOptions != 0;
}

- (GEOCommonOptions)commonOptions
{
  -[GEOETARequest _readCommonOptions]((uint64_t)self);
  commonOptions = self->_commonOptions;

  return commonOptions;
}

- (void)setCommonOptions:(id)a3
{
  *(void *)&self->_flags |= 0x20000040000uLL;
  objc_storeStrong((id *)&self->_commonOptions, a3);
}

- (void)_readSessionState
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 324) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSessionState_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasSessionState
{
  return self->_sessionState != 0;
}

- (NSData)sessionState
{
  -[GEOETARequest _readSessionState]((uint64_t)self);
  sessionState = self->_sessionState;

  return sessionState;
}

- (void)setSessionState:(id)a3
{
  *(void *)&self->_flags |= 0x21000000000uLL;
  objc_storeStrong((id *)&self->_sessionState, a3);
}

- (void)_readOriginalRouteID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 323) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalRouteID_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasOriginalRouteID
{
  return self->_originalRouteID != 0;
}

- (NSData)originalRouteID
{
  -[GEOETARequest _readOriginalRouteID]((uint64_t)self);
  originalRouteID = self->_originalRouteID;

  return originalRouteID;
}

- (void)setOriginalRouteID:(id)a3
{
  *(void *)&self->_flags |= 0x20004000000uLL;
  objc_storeStrong((id *)&self->_originalRouteID, a3);
}

- (void)_readOriginalRouteZilchPoints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 323) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalRouteZilchPoints_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (NSMutableArray)originalRouteZilchPoints
{
  -[GEOETARequest _readOriginalRouteZilchPoints]((uint64_t)self);
  originalRouteZilchPoints = self->_originalRouteZilchPoints;

  return originalRouteZilchPoints;
}

- (void)setOriginalRouteZilchPoints:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x20000000000uLL;
  originalRouteZilchPoints = self->_originalRouteZilchPoints;
  self->_originalRouteZilchPoints = v4;
}

- (void)clearOriginalRouteZilchPoints
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x20000000000uLL;
  originalRouteZilchPoints = self->_originalRouteZilchPoints;

  [(NSMutableArray *)originalRouteZilchPoints removeAllObjects];
}

- (void)addOriginalRouteZilchPoints:(id)a3
{
  id v4 = a3;
  -[GEOETARequest _readOriginalRouteZilchPoints]((uint64_t)self);
  -[GEOETARequest _addNoFlagsOriginalRouteZilchPoints:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x20000000000uLL;
}

- (void)_addNoFlagsOriginalRouteZilchPoints:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 168);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 168);
      *(void *)(a1 + 168) = v5;

      id v4 = *(void **)(a1 + 168);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)originalRouteZilchPointsCount
{
  -[GEOETARequest _readOriginalRouteZilchPoints]((uint64_t)self);
  originalRouteZilchPoints = self->_originalRouteZilchPoints;

  return [(NSMutableArray *)originalRouteZilchPoints count];
}

- (id)originalRouteZilchPointsAtIndex:(unint64_t)a3
{
  -[GEOETARequest _readOriginalRouteZilchPoints]((uint64_t)self);
  originalRouteZilchPoints = self->_originalRouteZilchPoints;

  return (id)[(NSMutableArray *)originalRouteZilchPoints objectAtIndex:a3];
}

+ (Class)originalRouteZilchPointsType
{
  return (Class)objc_opt_class();
}

- (void)_readOriginalWaypointRoute
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 323) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalWaypointRoute_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasOriginalWaypointRoute
{
  return self->_originalWaypointRoute != 0;
}

- (GEOOriginalWaypointRoute)originalWaypointRoute
{
  -[GEOETARequest _readOriginalWaypointRoute]((uint64_t)self);
  originalWaypointRoute = self->_originalWaypointRoute;

  return originalWaypointRoute;
}

- (void)setOriginalWaypointRoute:(id)a3
{
  *(void *)&self->_flags |= 0x20010000000uLL;
  objc_storeStrong((id *)&self->_originalWaypointRoute, a3);
}

- (NSMutableArray)deviceHistoricalLocations
{
  -[GEOETARequest _readDeviceHistoricalLocations]((uint64_t)self);
  deviceHistoricalLocations = self->_deviceHistoricalLocations;

  return deviceHistoricalLocations;
}

- (void)setDeviceHistoricalLocations:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x20000000000uLL;
  deviceHistoricalLocations = self->_deviceHistoricalLocations;
  self->_deviceHistoricalLocations = v4;
}

- (void)clearDeviceHistoricalLocations
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x20000000000uLL;
  deviceHistoricalLocations = self->_deviceHistoricalLocations;

  [(NSMutableArray *)deviceHistoricalLocations removeAllObjects];
}

- (void)addDeviceHistoricalLocation:(id)a3
{
  id v4 = a3;
  -[GEOETARequest _readDeviceHistoricalLocations]((uint64_t)self);
  -[GEOETARequest _addNoFlagsDeviceHistoricalLocation:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x20000000000uLL;
}

- (void)_addNoFlagsDeviceHistoricalLocation:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 128);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = v5;

      id v4 = *(void **)(a1 + 128);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)deviceHistoricalLocationsCount
{
  -[GEOETARequest _readDeviceHistoricalLocations]((uint64_t)self);
  deviceHistoricalLocations = self->_deviceHistoricalLocations;

  return [(NSMutableArray *)deviceHistoricalLocations count];
}

- (id)deviceHistoricalLocationAtIndex:(unint64_t)a3
{
  -[GEOETARequest _readDeviceHistoricalLocations]((uint64_t)self);
  deviceHistoricalLocations = self->_deviceHistoricalLocations;

  return (id)[(NSMutableArray *)deviceHistoricalLocations objectAtIndex:a3];
}

+ (Class)deviceHistoricalLocationType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasClientCapabilities
{
  return self->_clientCapabilities != 0;
}

- (void)setLastKnownRoadLocation:(id)a3
{
  *(void *)&self->_flags |= 0x20001000000uLL;
  objc_storeStrong((id *)&self->_lastKnownRoadLocation, a3);
}

- (void)_readAbClientMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 321) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAbClientMetadata_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasAbClientMetadata
{
  return self->_abClientMetadata != 0;
}

- (GEOPDABClientDatasetMetadata)abClientMetadata
{
  -[GEOETARequest _readAbClientMetadata]((uint64_t)self);
  abClientMetadata = self->_abClientMetadata;

  return abClientMetadata;
}

- (BOOL)includeRouteTrafficDetail
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $D0E8D0B55C880D94E0AADD8662313484 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x400) != 0 && self->_includeRouteTrafficDetail;
}

- (void)setIncludeRouteTrafficDetail:(BOOL)a3
{
  *(void *)&self->_flags |= 0x20000000400uLL;
  self->_includeRouteTrafficDetail = a3;
}

- (void)setHasIncludeRouteTrafficDetail:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (a3) {
    uint64_t v3 = 0x20000000400;
  }
  self->_$D0E8D0B55C880D94E0AADD8662313484 flags = ($D0E8D0B55C880D94E0AADD8662313484)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasIncludeRouteTrafficDetail
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (BOOL)includeShortTrafficSummary
{
  return self->_includeShortTrafficSummary;
}

- (void)setIncludeShortTrafficSummary:(BOOL)a3
{
  *(void *)&self->_flags |= 0x20000000800uLL;
  self->_includeShortTrafficSummary = a3;
}

- (void)setHasIncludeShortTrafficSummary:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (a3) {
    uint64_t v3 = 0x20000000800;
  }
  self->_$D0E8D0B55C880D94E0AADD8662313484 flags = ($D0E8D0B55C880D94E0AADD8662313484)(*(void *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasIncludeShortTrafficSummary
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (void)_readPhoneticLocaleIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 323) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhoneticLocaleIdentifier_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasPhoneticLocaleIdentifier
{
  return self->_phoneticLocaleIdentifier != 0;
}

- (NSString)phoneticLocaleIdentifier
{
  -[GEOETARequest _readPhoneticLocaleIdentifier]((uint64_t)self);
  phoneticLocaleIdentifier = self->_phoneticLocaleIdentifier;

  return phoneticLocaleIdentifier;
}

- (void)setPhoneticLocaleIdentifier:(id)a3
{
  *(void *)&self->_flags |= 0x20080000000uLL;
  objc_storeStrong((id *)&self->_phoneticLocaleIdentifier, a3);
}

- (void)_readRequestingAppId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 324) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRequestingAppId_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasRequestingAppId
{
  return self->_requestingAppId != 0;
}

- (NSString)requestingAppId
{
  -[GEOETARequest _readRequestingAppId]((uint64_t)self);
  requestingAppId = self->_requestingAppId;

  return requestingAppId;
}

- (BOOL)includeEtaRouteIncidents
{
  return self->_includeEtaRouteIncidents;
}

- (void)setIncludeEtaRouteIncidents:(BOOL)a3
{
  *(void *)&self->_flags |= 0x20000000200uLL;
  self->_includeEtaRouteIncidents = a3;
}

- (void)setHasIncludeEtaRouteIncidents:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (a3) {
    uint64_t v3 = 0x20000000200;
  }
  self->_$D0E8D0B55C880D94E0AADD8662313484 flags = ($D0E8D0B55C880D94E0AADD8662313484)(*(void *)&self->_flags & 0xFFFFFDFFFFFFFDFFLL | v3);
}

- (BOOL)hasIncludeEtaRouteIncidents
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (void)_readRecentLocationHistory
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 324) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRecentLocationHistory_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasRecentLocationHistory
{
  return self->_recentLocationHistory != 0;
}

- (GEORecentLocationHistory)recentLocationHistory
{
  -[GEOETARequest _readRecentLocationHistory]((uint64_t)self);
  recentLocationHistory = self->_recentLocationHistory;

  return recentLocationHistory;
}

- (void)setRecentLocationHistory:(id)a3
{
  *(void *)&self->_flags |= 0x20200000000uLL;
  objc_storeStrong((id *)&self->_recentLocationHistory, a3);
}

- (void)_readPrivacyMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 324) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPrivacyMetadata_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasPrivacyMetadata
{
  return self->_privacyMetadata != 0;
}

- (GEOPrivacyMetadata)privacyMetadata
{
  -[GEOETARequest _readPrivacyMetadata]((uint64_t)self);
  privacyMetadata = self->_privacyMetadata;

  return privacyMetadata;
}

- (void)setPrivacyMetadata:(id)a3
{
  *(void *)&self->_flags |= 0x20100000000uLL;
  objc_storeStrong((id *)&self->_privacyMetadata, a3);
}

- (void)_readPathComputationOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 323) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPathComputationOptions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasPathComputationOptions
{
  return self->_pathComputationOptions != 0;
}

- (GEOPathComputationOptions)pathComputationOptions
{
  -[GEOETARequest _readPathComputationOptions]((uint64_t)self);
  pathComputationOptions = self->_pathComputationOptions;

  return pathComputationOptions;
}

- (void)setPathComputationOptions:(id)a3
{
  *(void *)&self->_flags |= 0x20040000000uLL;
  objc_storeStrong((id *)&self->_pathComputationOptions, a3);
}

- (NSMutableArray)serviceTags
{
  -[GEOETARequest _readServiceTags]((uint64_t)self);
  serviceTags = self->_serviceTags;

  return serviceTags;
}

- (void)setServiceTags:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x20000000000uLL;
  serviceTags = self->_serviceTags;
  self->_serviceTags = v4;
}

- (void)clearServiceTags
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x20000000000uLL;
  serviceTags = self->_serviceTags;

  [(NSMutableArray *)serviceTags removeAllObjects];
}

- (id)serviceTagAtIndex:(unint64_t)a3
{
  -[GEOETARequest _readServiceTags]((uint64_t)self);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 324) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrafficApiResponses_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (NSMutableArray)trafficApiResponses
{
  -[GEOETARequest _readTrafficApiResponses]((uint64_t)self);
  trafficApiResponses = self->_trafficApiResponses;

  return trafficApiResponses;
}

- (void)setTrafficApiResponses:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x20000000000uLL;
  trafficApiResponses = self->_trafficApiResponses;
  self->_trafficApiResponses = v4;
}

- (void)clearTrafficApiResponses
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x20000000000uLL;
  trafficApiResponses = self->_trafficApiResponses;

  [(NSMutableArray *)trafficApiResponses removeAllObjects];
}

- (void)addTrafficApiResponses:(id)a3
{
  id v4 = a3;
  -[GEOETARequest _readTrafficApiResponses]((uint64_t)self);
  -[GEOETARequest _addNoFlagsTrafficApiResponses:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x20000000000uLL;
}

- (void)_addNoFlagsTrafficApiResponses:(uint64_t)a1
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

- (unint64_t)trafficApiResponsesCount
{
  -[GEOETARequest _readTrafficApiResponses]((uint64_t)self);
  trafficApiResponses = self->_trafficApiResponses;

  return [(NSMutableArray *)trafficApiResponses count];
}

- (id)trafficApiResponsesAtIndex:(unint64_t)a3
{
  -[GEOETARequest _readTrafficApiResponses]((uint64_t)self);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 324) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrafficSnapshotIds_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (NSMutableArray)trafficSnapshotIds
{
  -[GEOETARequest _readTrafficSnapshotIds]((uint64_t)self);
  trafficSnapshotIds = self->_trafficSnapshotIds;

  return trafficSnapshotIds;
}

- (void)setTrafficSnapshotIds:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x20000000000uLL;
  trafficSnapshotIds = self->_trafficSnapshotIds;
  self->_trafficSnapshotIds = v4;
}

- (void)clearTrafficSnapshotIds
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x20000000000uLL;
  trafficSnapshotIds = self->_trafficSnapshotIds;

  [(NSMutableArray *)trafficSnapshotIds removeAllObjects];
}

- (void)addTrafficSnapshotIds:(id)a3
{
  id v4 = a3;
  -[GEOETARequest _readTrafficSnapshotIds]((uint64_t)self);
  -[GEOETARequest _addNoFlagsTrafficSnapshotIds:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x20000000000uLL;
}

- (void)_addNoFlagsTrafficSnapshotIds:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 264);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 264);
      *(void *)(a1 + 264) = v5;

      id v4 = *(void **)(a1 + 264);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)trafficSnapshotIdsCount
{
  -[GEOETARequest _readTrafficSnapshotIds]((uint64_t)self);
  trafficSnapshotIds = self->_trafficSnapshotIds;

  return [(NSMutableArray *)trafficSnapshotIds count];
}

- (id)trafficSnapshotIdsAtIndex:(unint64_t)a3
{
  -[GEOETARequest _readTrafficSnapshotIds]((uint64_t)self);
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
  *(void *)&self->_flags |= 0x20000000008uLL;
  self->_trafficSnapshotUnixTime = a3;
}

- (void)setHasTrafficSnapshotUnixTime:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (a3) {
    uint64_t v3 = 0x20000000008;
  }
  self->_$D0E8D0B55C880D94E0AADD8662313484 flags = ($D0E8D0B55C880D94E0AADD8662313484)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasTrafficSnapshotUnixTime
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOETARequest;
  id v4 = [(GEOETARequest *)&v8 description];
  id v5 = [(GEOETARequest *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOETARequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v202 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v163 = 0;
    goto LABEL_235;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = &OBJC_IVAR___GEORPFeedbackComponent__unknownFields;
  uint64_t v6 = *(void *)(a1 + 320);
  if ((v6 & 0x10) != 0)
  {
    uint64_t v7 = *(int *)(a1 + 304);
    if (v7 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 304));
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E53F72E8[v7];
    }
    [v4 setObject:v8 forKey:@"transportType"];

    uint64_t v6 = *(void *)(a1 + 320);
  }
  if (v6)
  {
    _GEOTimepointDictionaryRepresentation(a1 + 24, a2);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    [v4 setObject:v9 forKey:@"timepoint"];
  }
  v10 = [(id)a1 origin];
  $D0E8D0B55C880D94E0AADD8662313484 v11 = v10;
  if (v10)
  {
    if (a2) {
      [v10 jsonRepresentation];
    }
    else {
    id v12 = [v10 dictionaryRepresentation];
    }

    [v4 setObject:v12 forKey:@"origin"];
  }

  if ([*(id *)(a1 + 120) count])
  {
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 120), "count"));
    long long v191 = 0u;
    long long v192 = 0u;
    long long v193 = 0u;
    long long v194 = 0u;
    id v14 = *(id *)(a1 + 120);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v191 objects:v201 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v192;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v192 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v191 + 1) + 8 * i);
          if (a2) {
            [v19 jsonRepresentation];
          }
          else {
          id v20 = [v19 dictionaryRepresentation];
          }

          [v13 addObject:v20];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v191 objects:v201 count:16];
      }
      while (v16);
    }

    [v4 setObject:v13 forKey:@"destination"];
    id v5 = &OBJC_IVAR___GEORPFeedbackComponent__unknownFields;
  }
  uint64_t v21 = *(void *)(a1 + 320);
  if ((v21 & 0x100) != 0)
  {
    uint64_t v25 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 314)];
    [v4 setObject:v25 forKey:@"includeHistoricTravelTime"];

    uint64_t v21 = *(void *)(a1 + 320);
    if ((v21 & 0x40) == 0)
    {
LABEL_28:
      if ((v21 & 0x80) == 0) {
        goto LABEL_29;
      }
      goto LABEL_38;
    }
  }
  else if ((v21 & 0x40) == 0)
  {
    goto LABEL_28;
  }
  uint64_t v26 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 312)];
  [v4 setObject:v26 forKey:@"allowPartialResults"];

  uint64_t v21 = *(void *)(a1 + 320);
  if ((v21 & 0x80) == 0)
  {
LABEL_29:
    if ((v21 & 2) == 0) {
      goto LABEL_30;
    }
    goto LABEL_39;
  }
LABEL_38:
  v27 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 313)];
  [v4 setObject:v27 forKey:@"includeDistance"];

  uint64_t v21 = *(void *)(a1 + 320);
  if ((v21 & 2) == 0)
  {
LABEL_30:
    if ((v21 & 4) == 0) {
      goto LABEL_31;
    }
    goto LABEL_40;
  }
LABEL_39:
  _GEOSessionIDDictionaryRepresentation((void *)(a1 + 48));
  id v28 = (id)objc_claimAutoreleasedReturnValue();

  [v4 setObject:v28 forKey:@"sessionID"];
  uint64_t v21 = *(void *)(a1 + 320);
  if ((v21 & 4) == 0)
  {
LABEL_31:
    if ((v21 & 0x20) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_40:
  uint64_t v29 = [NSNumber numberWithDouble:*(double *)(a1 + 240)];
  if (a2) {
    uint64_t v30 = @"sessionRelativeTimestamp";
  }
  else {
    uint64_t v30 = @"session_relative_timestamp";
  }
  [v4 setObject:v29 forKey:v30];

  if ((*(void *)(a1 + 320) & 0x20) != 0)
  {
LABEL_32:
    uint64_t v22 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 308)];
    [v4 setObject:v22 forKey:@"walkingLimitMeters"];
  }
LABEL_33:
  v23 = [(id)a1 additionalEnabledMarkets];
  v24 = v23;
  if (v23)
  {
    if (a2) {
      [v23 jsonRepresentation];
    }
    else {
    id v31 = [v23 dictionaryRepresentation];
    }

    [v4 setObject:v31 forKey:@"additionalEnabledMarkets"];
  }

  v32 = [(id)a1 originWaypointTyped];
  v33 = v32;
  if (v32)
  {
    if (a2) {
      [v32 jsonRepresentation];
    }
    else {
    id v34 = [v32 dictionaryRepresentation];
    }

    [v4 setObject:v34 forKey:@"originWaypointTyped"];
  }

  if ([*(id *)(a1 + 112) count])
  {
    uint64_t v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 112), "count"));
    long long v187 = 0u;
    long long v188 = 0u;
    long long v189 = 0u;
    long long v190 = 0u;
    id v36 = *(id *)(a1 + 112);
    uint64_t v37 = [v36 countByEnumeratingWithState:&v187 objects:v200 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v188;
      do
      {
        for (uint64_t j = 0; j != v38; ++j)
        {
          if (*(void *)v188 != v39) {
            objc_enumerationMutation(v36);
          }
          v41 = *(void **)(*((void *)&v187 + 1) + 8 * j);
          if (a2) {
            [v41 jsonRepresentation];
          }
          else {
          id v42 = [v41 dictionaryRepresentation];
          }

          [v35 addObject:v42];
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v187 objects:v200 count:16];
      }
      while (v38);
    }

    [v4 setObject:v35 forKey:@"destinationWaypointTyped"];
    id v5 = &OBJC_IVAR___GEORPFeedbackComponent__unknownFields;
  }
  if ([*(id *)(a1 + 136) count])
  {
    long long v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 136), "count"));
    long long v183 = 0u;
    long long v184 = 0u;
    long long v185 = 0u;
    long long v186 = 0u;
    id v44 = *(id *)(a1 + 136);
    uint64_t v45 = [v44 countByEnumeratingWithState:&v183 objects:v199 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v184;
      do
      {
        for (uint64_t k = 0; k != v46; ++k)
        {
          if (*(void *)v184 != v47) {
            objc_enumerationMutation(v44);
          }
          long long v49 = *(void **)(*((void *)&v183 + 1) + 8 * k);
          if (a2) {
            [v49 jsonRepresentation];
          }
          else {
          id v50 = [v49 dictionaryRepresentation];
          }

          [v43 addObject:v50];
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v183 objects:v199 count:16];
      }
      while (v46);
    }

    if (a2) {
      long long v51 = @"intermediateWaypointTyped";
    }
    else {
      long long v51 = @"intermediate_waypoint_typed";
    }
    [v4 setObject:v43 forKey:v51];

    id v5 = &OBJC_IVAR___GEORPFeedbackComponent__unknownFields;
  }
  long long v52 = [(id)a1 automobileOptions];
  long long v53 = v52;
  if (v52)
  {
    if (a2) {
      [v52 jsonRepresentation];
    }
    else {
    id v54 = [v52 dictionaryRepresentation];
    }

    [v4 setObject:v54 forKey:@"automobileOptions"];
  }

  long long v55 = [(id)a1 cyclingOptions];
  long long v56 = v55;
  if (v55)
  {
    if (a2) {
      [v55 jsonRepresentation];
    }
    else {
    id v57 = [v55 dictionaryRepresentation];
    }

    [v4 setObject:v57 forKey:@"cyclingOptions"];
  }

  long long v58 = [(id)a1 transitOptions];
  long long v59 = v58;
  if (v58)
  {
    if (a2) {
      [v58 jsonRepresentation];
    }
    else {
    id v60 = [v58 dictionaryRepresentation];
    }

    [v4 setObject:v60 forKey:@"transitOptions"];
  }

  long long v61 = [(id)a1 walkingOptions];
  long long v62 = v61;
  if (v61)
  {
    if (a2) {
      [v61 jsonRepresentation];
    }
    else {
    id v63 = [v61 dictionaryRepresentation];
    }

    [v4 setObject:v63 forKey:@"walkingOptions"];
  }

  if ((*(unsigned char *)(a1 + v5[261] + 1) & 0x10) != 0)
  {
    long long v64 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 318)];
    [v4 setObject:v64 forKey:@"isFromAPI"];
  }
  long long v65 = [(id)a1 commonOptions];
  long long v66 = v65;
  if (v65)
  {
    if (a2)
    {
      long long v67 = [v65 jsonRepresentation];
      long long v68 = @"commonOptions";
    }
    else
    {
      long long v67 = [v65 dictionaryRepresentation];
      long long v68 = @"common_options";
    }
    id v69 = v67;

    [v4 setObject:v69 forKey:v68];
  }

  long long v70 = [(id)a1 sessionState];
  long long v71 = v70;
  if (v70)
  {
    if (a2)
    {
      long long v72 = [v70 base64EncodedStringWithOptions:0];
      [v4 setObject:v72 forKey:@"sessionState"];
    }
    else
    {
      [v4 setObject:v70 forKey:@"session_state"];
    }
  }

  long long v73 = [(id)a1 originalRouteID];
  if (v73)
  {
    long long v74 = v73;
    if (a2)
    {
      uint64_t v75 = [v73 base64EncodedStringWithOptions:0];
      [v4 setObject:v75 forKey:@"originalRouteID"];

      if (!*(void *)(a1 + 168)) {
        goto LABEL_127;
      }
      goto LABEL_116;
    }
    [v4 setObject:v73 forKey:@"originalRouteID"];

    if (*(void *)(a1 + 168)) {
      goto LABEL_125;
    }
  }
  else if (*(void *)(a1 + 168))
  {
    if (a2)
    {
LABEL_116:
      v76 = (void *)MEMORY[0x1E4F1CA48];
      v77 = [(id)a1 originalRouteZilchPoints];
      v78 = objc_msgSend(v76, "arrayWithCapacity:", objc_msgSend(v77, "count"));

      long long v181 = 0u;
      long long v182 = 0u;
      long long v179 = 0u;
      long long v180 = 0u;
      v79 = [(id)a1 originalRouteZilchPoints];
      uint64_t v80 = [v79 countByEnumeratingWithState:&v179 objects:v198 count:16];
      if (v80)
      {
        uint64_t v81 = v80;
        uint64_t v82 = *(void *)v180;
        do
        {
          for (uint64_t m = 0; m != v81; ++m)
          {
            if (*(void *)v180 != v82) {
              objc_enumerationMutation(v79);
            }
            uint64_t v84 = [*(id *)(*((void *)&v179 + 1) + 8 * m) base64EncodedStringWithOptions:0];
            [v78 addObject:v84];
          }
          uint64_t v81 = [v79 countByEnumeratingWithState:&v179 objects:v198 count:16];
        }
        while (v81);
      }

      id v5 = &OBJC_IVAR___GEORPFeedbackComponent__unknownFields;
      goto LABEL_126;
    }
LABEL_125:
    v78 = [(id)a1 originalRouteZilchPoints];
LABEL_126:
    [v4 setObject:v78 forKey:@"originalRouteZilchPoints"];
  }
LABEL_127:
  v85 = [(id)a1 originalWaypointRoute];
  v86 = v85;
  if (v85)
  {
    if (a2)
    {
      v87 = [v85 jsonRepresentation];
      v88 = @"originalWaypointRoute";
    }
    else
    {
      v87 = [v85 dictionaryRepresentation];
      v88 = @"original_waypoint_route";
    }
    id v89 = v87;

    [v4 setObject:v89 forKey:v88];
  }

  if ([*(id *)(a1 + 128) count])
  {
    v90 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 128), "count"));
    long long v175 = 0u;
    long long v176 = 0u;
    long long v177 = 0u;
    long long v178 = 0u;
    id v91 = *(id *)(a1 + 128);
    uint64_t v92 = [v91 countByEnumeratingWithState:&v175 objects:v197 count:16];
    if (v92)
    {
      uint64_t v93 = v92;
      uint64_t v94 = *(void *)v176;
      do
      {
        for (uint64_t n = 0; n != v93; ++n)
        {
          if (*(void *)v176 != v94) {
            objc_enumerationMutation(v91);
          }
          v96 = *(void **)(*((void *)&v175 + 1) + 8 * n);
          if (a2) {
            [v96 jsonRepresentation];
          }
          else {
          id v97 = [v96 dictionaryRepresentation];
          }

          [v90 addObject:v97];
        }
        uint64_t v93 = [v91 countByEnumeratingWithState:&v175 objects:v197 count:16];
      }
      while (v93);
    }

    [v4 setObject:v90 forKey:@"deviceHistoricalLocation"];
    id v5 = &OBJC_IVAR___GEORPFeedbackComponent__unknownFields;
  }
  v98 = [(id)a1 clientCapabilities];
  v99 = v98;
  if (v98)
  {
    if (a2) {
      [v98 jsonRepresentation];
    }
    else {
    id v100 = [v98 dictionaryRepresentation];
    }

    [v4 setObject:v100 forKey:@"clientCapabilities"];
  }

  v101 = [(id)a1 lastKnownRoadLocation];
  v102 = v101;
  if (v101)
  {
    if (a2)
    {
      v103 = [v101 jsonRepresentation];
      v104 = @"lastKnownRoadLocation";
    }
    else
    {
      v103 = [v101 dictionaryRepresentation];
      v104 = @"last_known_road_location";
    }
    id v105 = v103;

    [v4 setObject:v105 forKey:v104];
  }

  v106 = [(id)a1 abClientMetadata];
  v107 = v106;
  if (v106)
  {
    if (a2)
    {
      v108 = [v106 jsonRepresentation];
      v109 = @"abClientMetadata";
    }
    else
    {
      v108 = [v106 dictionaryRepresentation];
      v109 = @"ab_client_metadata";
    }
    id v110 = v108;

    [v4 setObject:v110 forKey:v109];
  }

  uint64_t v111 = *(void *)(a1 + v5[261]);
  if ((v111 & 0x400) != 0)
  {
    v112 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 316)];
    if (a2) {
      v113 = @"includeRouteTrafficDetail";
    }
    else {
      v113 = @"include_route_traffic_detail";
    }
    [v4 setObject:v112 forKey:v113];

    uint64_t v111 = *(void *)(a1 + 320);
  }
  if ((v111 & 0x800) != 0)
  {
    v114 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 317)];
    if (a2) {
      v115 = @"includeShortTrafficSummary";
    }
    else {
      v115 = @"include_short_traffic_summary";
    }
    [v4 setObject:v114 forKey:v115];
  }
  v116 = [(id)a1 phoneticLocaleIdentifier];
  if (v116)
  {
    if (a2) {
      v117 = @"phoneticLocaleIdentifier";
    }
    else {
      v117 = @"phonetic_locale_identifier";
    }
    [v4 setObject:v116 forKey:v117];
  }

  v118 = [(id)a1 requestingAppId];
  if (v118)
  {
    if (a2) {
      v119 = @"requestingAppId";
    }
    else {
      v119 = @"requesting_app_id";
    }
    [v4 setObject:v118 forKey:v119];
  }

  if ((*(unsigned char *)(a1 + v5[261] + 1) & 2) != 0)
  {
    v120 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 315)];
    if (a2) {
      v121 = @"includeEtaRouteIncidents";
    }
    else {
      v121 = @"include_eta_route_incidents";
    }
    [v4 setObject:v120 forKey:v121];
  }
  v122 = [(id)a1 recentLocationHistory];
  v123 = v122;
  if (v122)
  {
    if (a2)
    {
      v124 = [v122 jsonRepresentation];
      v125 = @"recentLocationHistory";
    }
    else
    {
      v124 = [v122 dictionaryRepresentation];
      v125 = @"recent_location_history";
    }
    id v126 = v124;

    [v4 setObject:v126 forKey:v125];
  }

  v127 = [(id)a1 privacyMetadata];
  v128 = v127;
  if (v127)
  {
    if (a2)
    {
      v129 = [v127 jsonRepresentation];
      v130 = @"privacyMetadata";
    }
    else
    {
      v129 = [v127 dictionaryRepresentation];
      v130 = @"privacy_metadata";
    }
    id v131 = v129;

    [v4 setObject:v131 forKey:v130];
  }

  v132 = [(id)a1 pathComputationOptions];
  v133 = v132;
  if (v132)
  {
    if (a2)
    {
      v134 = [v132 jsonRepresentation];
      v135 = @"pathComputationOptions";
    }
    else
    {
      v134 = [v132 dictionaryRepresentation];
      v135 = @"path_computation_options";
    }
    id v136 = v134;

    [v4 setObject:v136 forKey:v135];
  }

  if ([*(id *)(a1 + 232) count])
  {
    v137 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 232), "count"));
    long long v171 = 0u;
    long long v172 = 0u;
    long long v173 = 0u;
    long long v174 = 0u;
    id v138 = *(id *)(a1 + 232);
    uint64_t v139 = [v138 countByEnumeratingWithState:&v171 objects:v196 count:16];
    if (v139)
    {
      uint64_t v140 = v139;
      uint64_t v141 = *(void *)v172;
      do
      {
        for (iuint64_t i = 0; ii != v140; ++ii)
        {
          if (*(void *)v172 != v141) {
            objc_enumerationMutation(v138);
          }
          v143 = *(void **)(*((void *)&v171 + 1) + 8 * ii);
          if (a2) {
            [v143 jsonRepresentation];
          }
          else {
          id v144 = [v143 dictionaryRepresentation];
          }

          [v137 addObject:v144];
        }
        uint64_t v140 = [v138 countByEnumeratingWithState:&v171 objects:v196 count:16];
      }
      while (v140);
    }

    [v4 setObject:v137 forKey:@"serviceTag"];
  }
  if (*(void *)(a1 + 256))
  {
    if (a2)
    {
      v145 = (void *)MEMORY[0x1E4F1CA48];
      v146 = [(id)a1 trafficApiResponses];
      v147 = objc_msgSend(v145, "arrayWithCapacity:", objc_msgSend(v146, "count"));

      long long v169 = 0u;
      long long v170 = 0u;
      long long v167 = 0u;
      long long v168 = 0u;
      v148 = [(id)a1 trafficApiResponses];
      uint64_t v149 = [v148 countByEnumeratingWithState:&v167 objects:v195 count:16];
      if (v149)
      {
        uint64_t v150 = v149;
        uint64_t v151 = *(void *)v168;
        do
        {
          for (juint64_t j = 0; jj != v150; ++jj)
          {
            if (*(void *)v168 != v151) {
              objc_enumerationMutation(v148);
            }
            v153 = [*(id *)(*((void *)&v167 + 1) + 8 * jj) base64EncodedStringWithOptions:0];
            [v147 addObject:v153];
          }
          uint64_t v150 = [v148 countByEnumeratingWithState:&v167 objects:v195 count:16];
        }
        while (v150);
      }
    }
    else
    {
      v147 = [(id)a1 trafficApiResponses];
    }
    [v4 setObject:v147 forKey:@"trafficApiResponses"];
  }
  if (*(void *)(a1 + 264))
  {
    v154 = [(id)a1 trafficSnapshotIds];
    [v4 setObject:v154 forKey:@"trafficSnapshotIds"];
  }
  if ((*(unsigned char *)(a1 + v5[261]) & 8) != 0)
  {
    v155 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 300)];
    if (a2) {
      v156 = @"trafficSnapshotUnixTime";
    }
    else {
      v156 = @"traffic_snapshot_unix_time";
    }
    [v4 setObject:v155 forKey:v156];
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
      v165[2] = __43__GEOETARequest__dictionaryRepresentation___block_invoke;
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

LABEL_235:

  return v163;
}

- (id)jsonRepresentation
{
  return -[GEOETARequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __43__GEOETARequest__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
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

- (GEOETARequest)initWithDictionary:(id)a3
{
  return (GEOETARequest *)-[GEOETARequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v234 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_298;
  }
  a1 = (id)[a1 init];

  if (!a1) {
    goto LABEL_298;
  }
  uint64_t v6 = [v5 objectForKeyedSubscript:@"transportType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"AUTOMOBILE"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"TRANSIT"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"WALKING"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"BICYCLE"])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
    {
      uint64_t v8 = 4;
    }
    else if ([v7 isEqualToString:@"FERRY"])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:@"RIDESHARE"])
    {
      uint64_t v8 = 6;
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_23;
    }
    uint64_t v8 = [v6 intValue];
  }
  [a1 setTransportType:v8];
LABEL_23:

  id v9 = [v5 objectForKeyedSubscript:@"timepoint"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v224 = 0uLL;
    uint64_t v225 = 0;
    _GEOTimepointFromDictionaryRepresentation(v9, (uint64_t)&v224, a3);
    long long v222 = v224;
    uint64_t v223 = v225;
    [a1 setTimepoint:&v222];
  }

  id v10 = [v5 objectForKeyedSubscript:@"origin"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    $D0E8D0B55C880D94E0AADD8662313484 v11 = [GEOWaypoint alloc];
    if (a3) {
      uint64_t v12 = [(GEOWaypoint *)v11 initWithJSON:v10];
    }
    else {
      uint64_t v12 = [(GEOWaypoint *)v11 initWithDictionary:v10];
    }
    uint64_t v13 = (void *)v12;
    [a1 setOrigin:v12];
  }
  id v14 = [v5 objectForKeyedSubscript:@"destination"];
  objc_opt_class();
  id v189 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v220 = 0u;
    long long v221 = 0u;
    long long v218 = 0u;
    long long v219 = 0u;
    long long v183 = v14;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v218 objects:v233 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v219;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v219 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v218 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v21 = [GEOWaypoint alloc];
            if (a3) {
              uint64_t v22 = [(GEOWaypoint *)v21 initWithJSON:v20];
            }
            else {
              uint64_t v22 = [(GEOWaypoint *)v21 initWithDictionary:v20];
            }
            v23 = (void *)v22;
            objc_msgSend(a1, "addDestination:", v22, v183);
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v218 objects:v233 count:16];
      }
      while (v17);
    }

    id v14 = v183;
    id v5 = v189;
  }

  v24 = [v5 objectForKeyedSubscript:@"includeHistoricTravelTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIncludeHistoricTravelTime:", objc_msgSend(v24, "BOOLValue"));
  }

  uint64_t v25 = [v5 objectForKeyedSubscript:@"allowPartialResults"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setAllowPartialResults:", objc_msgSend(v25, "BOOLValue"));
  }

  uint64_t v26 = [v5 objectForKeyedSubscript:@"includeDistance"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIncludeDistance:", objc_msgSend(v26, "BOOLValue"));
  }

  v27 = [v5 objectForKeyedSubscript:@"sessionID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v224 = 0uLL;
    _GEOSessionIDFromDictionaryRepresentation(v27, &v224);
    [a1 setSessionID:v224];
  }

  if (a3) {
    id v28 = @"sessionRelativeTimestamp";
  }
  else {
    id v28 = @"session_relative_timestamp";
  }
  uint64_t v29 = objc_msgSend(v5, "objectForKeyedSubscript:", v28, v183);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v29 doubleValue];
    objc_msgSend(a1, "setSessionRelativeTimestamp:");
  }

  uint64_t v30 = [v5 objectForKeyedSubscript:@"walkingLimitMeters"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWalkingLimitMeters:", objc_msgSend(v30, "unsignedIntValue"));
  }

  id v31 = [v5 objectForKeyedSubscript:@"additionalEnabledMarkets"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v32 = [GEOAdditionalEnabledMarkets alloc];
    if (a3) {
      uint64_t v33 = [(GEOAdditionalEnabledMarkets *)v32 initWithJSON:v31];
    }
    else {
      uint64_t v33 = [(GEOAdditionalEnabledMarkets *)v32 initWithDictionary:v31];
    }
    id v34 = (void *)v33;
    [a1 setAdditionalEnabledMarkets:v33];
  }
  uint64_t v35 = [v5 objectForKeyedSubscript:@"originWaypointTyped"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v36 = [GEOWaypointTyped alloc];
    if (a3) {
      uint64_t v37 = [(GEOWaypointTyped *)v36 initWithJSON:v35];
    }
    else {
      uint64_t v37 = [(GEOWaypointTyped *)v36 initWithDictionary:v35];
    }
    uint64_t v38 = (void *)v37;
    [a1 setOriginWaypointTyped:v37];
  }
  uint64_t v39 = [v5 objectForKeyedSubscript:@"destinationWaypointTyped"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v216 = 0u;
    long long v217 = 0u;
    long long v214 = 0u;
    long long v215 = 0u;
    long long v184 = v39;
    id v40 = v39;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v214 objects:v232 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v215;
      do
      {
        for (uint64_t j = 0; j != v42; ++j)
        {
          if (*(void *)v215 != v43) {
            objc_enumerationMutation(v40);
          }
          uint64_t v45 = *(void *)(*((void *)&v214 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v46 = [GEOWaypointTyped alloc];
            if (a3) {
              uint64_t v47 = [(GEOWaypointTyped *)v46 initWithJSON:v45];
            }
            else {
              uint64_t v47 = [(GEOWaypointTyped *)v46 initWithDictionary:v45];
            }
            long long v48 = (void *)v47;
            objc_msgSend(a1, "addDestinationWaypointTyped:", v47, v184);
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v214 objects:v232 count:16];
      }
      while (v42);
    }

    uint64_t v39 = v184;
    id v5 = v189;
  }

  if (a3) {
    long long v49 = @"intermediateWaypointTyped";
  }
  else {
    long long v49 = @"intermediate_waypoint_typed";
  }
  id v50 = objc_msgSend(v5, "objectForKeyedSubscript:", v49, v184);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v212 = 0u;
    long long v213 = 0u;
    long long v210 = 0u;
    long long v211 = 0u;
    long long v185 = v50;
    id v51 = v50;
    uint64_t v52 = [v51 countByEnumeratingWithState:&v210 objects:v231 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v211;
      do
      {
        for (uint64_t k = 0; k != v53; ++k)
        {
          if (*(void *)v211 != v54) {
            objc_enumerationMutation(v51);
          }
          uint64_t v56 = *(void *)(*((void *)&v210 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v57 = [GEOWaypointTyped alloc];
            if (a3) {
              uint64_t v58 = [(GEOWaypointTyped *)v57 initWithJSON:v56];
            }
            else {
              uint64_t v58 = [(GEOWaypointTyped *)v57 initWithDictionary:v56];
            }
            long long v59 = (void *)v58;
            objc_msgSend(a1, "addIntermediateWaypointTyped:", v58, v185);
          }
        }
        uint64_t v53 = [v51 countByEnumeratingWithState:&v210 objects:v231 count:16];
      }
      while (v53);
    }

    id v50 = v185;
    id v5 = v189;
  }

  id v60 = [v5 objectForKeyedSubscript:@"automobileOptions"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v61 = [GEOAutomobileOptions alloc];
    if (a3) {
      uint64_t v62 = [(GEOAutomobileOptions *)v61 initWithJSON:v60];
    }
    else {
      uint64_t v62 = [(GEOAutomobileOptions *)v61 initWithDictionary:v60];
    }
    id v63 = (void *)v62;
    objc_msgSend(a1, "setAutomobileOptions:", v62, v185);
  }
  long long v64 = [v5 objectForKeyedSubscript:@"cyclingOptions"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v65 = [GEOCyclingOptions alloc];
    if (a3) {
      uint64_t v66 = [(GEOCyclingOptions *)v65 initWithJSON:v64];
    }
    else {
      uint64_t v66 = [(GEOCyclingOptions *)v65 initWithDictionary:v64];
    }
    long long v67 = (void *)v66;
    objc_msgSend(a1, "setCyclingOptions:", v66, v185);
  }
  long long v68 = [v5 objectForKeyedSubscript:@"transitOptions"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v69 = [GEOTransitOptions alloc];
    if (a3) {
      uint64_t v70 = [(GEOTransitOptions *)v69 initWithJSON:v68];
    }
    else {
      uint64_t v70 = [(GEOTransitOptions *)v69 initWithDictionary:v68];
    }
    long long v71 = (void *)v70;
    objc_msgSend(a1, "setTransitOptions:", v70, v185);
  }
  long long v72 = [v5 objectForKeyedSubscript:@"walkingOptions"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v73 = [GEOWalkingOptions alloc];
    if (a3) {
      uint64_t v74 = [(GEOWalkingOptions *)v73 initWithJSON:v72];
    }
    else {
      uint64_t v74 = [(GEOWalkingOptions *)v73 initWithDictionary:v72];
    }
    uint64_t v75 = (void *)v74;
    objc_msgSend(a1, "setWalkingOptions:", v74, v185);
  }
  v76 = [v5 objectForKeyedSubscript:@"isFromAPI"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsFromAPI:", objc_msgSend(v76, "BOOLValue"));
  }

  if (a3) {
    v77 = @"commonOptions";
  }
  else {
    v77 = @"common_options";
  }
  v78 = objc_msgSend(v5, "objectForKeyedSubscript:", v77, v185);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v79 = [GEOCommonOptions alloc];
    if (a3) {
      uint64_t v80 = [(GEOCommonOptions *)v79 initWithJSON:v78];
    }
    else {
      uint64_t v80 = [(GEOCommonOptions *)v79 initWithDictionary:v78];
    }
    uint64_t v81 = (void *)v80;
    [a1 setCommonOptions:v80];
  }
  if (a3) {
    uint64_t v82 = @"sessionState";
  }
  else {
    uint64_t v82 = @"session_state";
  }
  v83 = [v5 objectForKeyedSubscript:v82];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v84 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v83 options:0];
    [a1 setSessionState:v84];
  }
  v85 = [v5 objectForKeyedSubscript:@"originalRouteID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v86 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v85 options:0];
    [a1 setOriginalRouteID:v86];
  }
  v87 = [v5 objectForKeyedSubscript:@"originalRouteZilchPoints"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v208 = 0u;
    long long v209 = 0u;
    long long v206 = 0u;
    long long v207 = 0u;
    long long v186 = v87;
    id v88 = v87;
    uint64_t v89 = [v88 countByEnumeratingWithState:&v206 objects:v230 count:16];
    if (v89)
    {
      uint64_t v90 = v89;
      uint64_t v91 = *(void *)v207;
      do
      {
        for (uint64_t m = 0; m != v90; ++m)
        {
          if (*(void *)v207 != v91) {
            objc_enumerationMutation(v88);
          }
          uint64_t v93 = *(void *)(*((void *)&v206 + 1) + 8 * m);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v94 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v93 options:0];
            [a1 addOriginalRouteZilchPoints:v94];
          }
        }
        uint64_t v90 = [v88 countByEnumeratingWithState:&v206 objects:v230 count:16];
      }
      while (v90);
    }

    v87 = v186;
    id v5 = v189;
  }

  if (a3) {
    v95 = @"originalWaypointRoute";
  }
  else {
    v95 = @"original_waypoint_route";
  }
  v96 = objc_msgSend(v5, "objectForKeyedSubscript:", v95, v186);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v97 = [GEOOriginalWaypointRoute alloc];
    if (a3) {
      uint64_t v98 = [(GEOOriginalWaypointRoute *)v97 initWithJSON:v96];
    }
    else {
      uint64_t v98 = [(GEOOriginalWaypointRoute *)v97 initWithDictionary:v96];
    }
    v99 = (void *)v98;
    [a1 setOriginalWaypointRoute:v98];
  }
  id v100 = [v5 objectForKeyedSubscript:@"deviceHistoricalLocation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v204 = 0u;
    long long v205 = 0u;
    long long v202 = 0u;
    long long v203 = 0u;
    long long v187 = v100;
    id v101 = v100;
    uint64_t v102 = [v101 countByEnumeratingWithState:&v202 objects:v229 count:16];
    if (v102)
    {
      uint64_t v103 = v102;
      uint64_t v104 = *(void *)v203;
      do
      {
        for (uint64_t n = 0; n != v103; ++n)
        {
          if (*(void *)v203 != v104) {
            objc_enumerationMutation(v101);
          }
          uint64_t v106 = *(void *)(*((void *)&v202 + 1) + 8 * n);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v107 = [GEOLocation alloc];
            if (a3) {
              uint64_t v108 = [(GEOLocation *)v107 initWithJSON:v106];
            }
            else {
              uint64_t v108 = [(GEOLocation *)v107 initWithDictionary:v106];
            }
            v109 = (void *)v108;
            objc_msgSend(a1, "addDeviceHistoricalLocation:", v108, v187);
          }
        }
        uint64_t v103 = [v101 countByEnumeratingWithState:&v202 objects:v229 count:16];
      }
      while (v103);
    }

    id v100 = v187;
    id v5 = v189;
  }

  id v110 = [v5 objectForKeyedSubscript:@"clientCapabilities"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v111 = [GEOClientCapabilities alloc];
    if (a3) {
      uint64_t v112 = [(GEOClientCapabilities *)v111 initWithJSON:v110];
    }
    else {
      uint64_t v112 = [(GEOClientCapabilities *)v111 initWithDictionary:v110];
    }
    v113 = (void *)v112;
    objc_msgSend(a1, "setClientCapabilities:", v112, v187);
  }
  if (a3) {
    v114 = @"lastKnownRoadLocation";
  }
  else {
    v114 = @"last_known_road_location";
  }
  v115 = objc_msgSend(v5, "objectForKeyedSubscript:", v114, v187);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v116 = [GEOLocation alloc];
    if (a3) {
      uint64_t v117 = [(GEOLocation *)v116 initWithJSON:v115];
    }
    else {
      uint64_t v117 = [(GEOLocation *)v116 initWithDictionary:v115];
    }
    v118 = (void *)v117;
    [a1 setLastKnownRoadLocation:v117];
  }
  if (a3) {
    v119 = @"abClientMetadata";
  }
  else {
    v119 = @"ab_client_metadata";
  }
  v120 = [v5 objectForKeyedSubscript:v119];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v121 = [GEOPDABClientDatasetMetadata alloc];
    if (a3) {
      uint64_t v122 = [(GEOPDABClientDatasetMetadata *)v121 initWithJSON:v120];
    }
    else {
      uint64_t v122 = [(GEOPDABClientDatasetMetadata *)v121 initWithDictionary:v120];
    }
    v123 = (void *)v122;
    [a1 setAbClientMetadata:v122];
  }
  if (a3) {
    v124 = @"includeRouteTrafficDetail";
  }
  else {
    v124 = @"include_route_traffic_detail";
  }
  v125 = [v5 objectForKeyedSubscript:v124];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIncludeRouteTrafficDetail:", objc_msgSend(v125, "BOOLValue"));
  }

  if (a3) {
    id v126 = @"includeShortTrafficSummary";
  }
  else {
    id v126 = @"include_short_traffic_summary";
  }
  v127 = [v5 objectForKeyedSubscript:v126];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIncludeShortTrafficSummary:", objc_msgSend(v127, "BOOLValue"));
  }

  if (a3) {
    v128 = @"phoneticLocaleIdentifier";
  }
  else {
    v128 = @"phonetic_locale_identifier";
  }
  v129 = [v5 objectForKeyedSubscript:v128];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v130 = (void *)[v129 copy];
    [a1 setPhoneticLocaleIdentifier:v130];
  }
  if (a3) {
    id v131 = @"requestingAppId";
  }
  else {
    id v131 = @"requesting_app_id";
  }
  v132 = [v5 objectForKeyedSubscript:v131];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v133 = (void *)[v132 copy];
    [a1 setRequestingAppId:v133];
  }
  if (a3) {
    v134 = @"includeEtaRouteIncidents";
  }
  else {
    v134 = @"include_eta_route_incidents";
  }
  v135 = [v5 objectForKeyedSubscript:v134];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIncludeEtaRouteIncidents:", objc_msgSend(v135, "BOOLValue"));
  }

  if (a3) {
    id v136 = @"recentLocationHistory";
  }
  else {
    id v136 = @"recent_location_history";
  }
  v137 = [v5 objectForKeyedSubscript:v136];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v138 = [GEORecentLocationHistory alloc];
    if (a3) {
      uint64_t v139 = [(GEORecentLocationHistory *)v138 initWithJSON:v137];
    }
    else {
      uint64_t v139 = [(GEORecentLocationHistory *)v138 initWithDictionary:v137];
    }
    uint64_t v140 = (void *)v139;
    [a1 setRecentLocationHistory:v139];
  }
  if (a3) {
    uint64_t v141 = @"privacyMetadata";
  }
  else {
    uint64_t v141 = @"privacy_metadata";
  }
  v142 = [v5 objectForKeyedSubscript:v141];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v143 = [GEOPrivacyMetadata alloc];
    if (a3) {
      uint64_t v144 = [(GEOPrivacyMetadata *)v143 initWithJSON:v142];
    }
    else {
      uint64_t v144 = [(GEOPrivacyMetadata *)v143 initWithDictionary:v142];
    }
    v145 = (void *)v144;
    [a1 setPrivacyMetadata:v144];
  }
  if (a3) {
    v146 = @"pathComputationOptions";
  }
  else {
    v146 = @"path_computation_options";
  }
  v147 = [v5 objectForKeyedSubscript:v146];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_256;
  }
  v148 = [GEOPathComputationOptions alloc];
  if (v148)
  {
    id v149 = v147;
    v148 = [(GEOPathComputationOptions *)v148 init];
    if (!v148)
    {
LABEL_254:

      goto LABEL_255;
    }
    if (a3) {
      uint64_t v150 = @"pathComputationMethod";
    }
    else {
      uint64_t v150 = @"path_computation_method";
    }
    uint64_t v151 = [v149 objectForKeyedSubscript:v150];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v152 = v151;
      long long v188 = v152;
      if ([v152 isEqualToString:@"BEST_EFFORT"])
      {
        int v153 = 0;
      }
      else if (objc_msgSend(v152, "isEqualToString:", @"ECONOMIC", v152))
      {
        int v153 = 1;
      }
      else if ([v152 isEqualToString:@"QUALITATIVE"])
      {
        int v153 = 2;
      }
      else
      {
        int v153 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_253:

        goto LABEL_254;
      }
      int v153 = [v151 intValue];
    }
    *(unsigned char *)&v148->_flags |= 1u;
    v148->_pathComputationMethod = v153;
    id v5 = v189;
    goto LABEL_253;
  }
LABEL_255:
  objc_msgSend(a1, "setPathComputationOptions:", v148, v188);

LABEL_256:
  v154 = [v5 objectForKeyedSubscript:@"serviceTag"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v200 = 0u;
    long long v201 = 0u;
    long long v198 = 0u;
    long long v199 = 0u;
    long long v188 = v154;
    id v155 = v154;
    uint64_t v156 = [v155 countByEnumeratingWithState:&v198 objects:v228 count:16];
    if (v156)
    {
      uint64_t v157 = v156;
      uint64_t v158 = *(void *)v199;
      do
      {
        for (iuint64_t i = 0; ii != v157; ++ii)
        {
          if (*(void *)v199 != v158) {
            objc_enumerationMutation(v155);
          }
          uint64_t v160 = *(void *)(*((void *)&v198 + 1) + 8 * ii);
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
            objc_msgSend(a1, "addServiceTag:", v162, v188);
          }
        }
        uint64_t v157 = [v155 countByEnumeratingWithState:&v198 objects:v228 count:16];
      }
      while (v157);
    }

    v154 = v188;
    id v5 = v189;
  }

  v164 = [v5 objectForKeyedSubscript:@"trafficApiResponses"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v196 = 0u;
    long long v197 = 0u;
    long long v194 = 0u;
    long long v195 = 0u;
    id v165 = v164;
    uint64_t v166 = [v165 countByEnumeratingWithState:&v194 objects:v227 count:16];
    if (v166)
    {
      uint64_t v167 = v166;
      uint64_t v168 = *(void *)v195;
      do
      {
        for (juint64_t j = 0; jj != v167; ++jj)
        {
          if (*(void *)v195 != v168) {
            objc_enumerationMutation(v165);
          }
          uint64_t v170 = *(void *)(*((void *)&v194 + 1) + 8 * jj);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v171 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v170 options:0];
            [a1 addTrafficApiResponses:v171];
          }
        }
        uint64_t v167 = [v165 countByEnumeratingWithState:&v194 objects:v227 count:16];
      }
      while (v167);
    }

    id v5 = v189;
  }

  long long v172 = [v5 objectForKeyedSubscript:@"trafficSnapshotIds"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v192 = 0u;
    long long v193 = 0u;
    long long v190 = 0u;
    long long v191 = 0u;
    id v173 = v172;
    uint64_t v174 = [v173 countByEnumeratingWithState:&v190 objects:v226 count:16];
    if (v174)
    {
      uint64_t v175 = v174;
      uint64_t v176 = *(void *)v191;
      do
      {
        for (kuint64_t k = 0; kk != v175; ++kk)
        {
          if (*(void *)v191 != v176) {
            objc_enumerationMutation(v173);
          }
          long long v178 = *(void **)(*((void *)&v190 + 1) + 8 * kk);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v179 = (void *)[v178 copy];
            [a1 addTrafficSnapshotIds:v179];
          }
        }
        uint64_t v175 = [v173 countByEnumeratingWithState:&v190 objects:v226 count:16];
      }
      while (v175);
    }
  }
  if (a3) {
    long long v180 = @"trafficSnapshotUnixTime";
  }
  else {
    long long v180 = @"traffic_snapshot_unix_time";
  }
  long long v181 = objc_msgSend(v5, "objectForKeyedSubscript:", v180, v188);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTrafficSnapshotUnixTime:", objc_msgSend(v181, "unsignedIntValue"));
  }

  a1 = a1;
LABEL_298:

  return a1;
}

- (GEOETARequest)initWithJSON:(id)a3
{
  return (GEOETARequest *)-[GEOETARequest _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOETARequestIsValid((char *)a3);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  -[GEOETARequest _readDestinations]((uint64_t)self);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = self->_destinations;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v36;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v36 != v8) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v35 + 1) + 8 * v9) hasGreenTeaWithValue:v3]) {
        goto LABEL_37;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v35 objects:v42 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  -[GEOETARequest _readDestinationWaypointTypeds]((uint64_t)self);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = self->_destinationWaypointTypeds;
  uint64_t v10 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
LABEL_11:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v32 != v12) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v31 + 1) + 8 * v13) hasGreenTeaWithValue:v3]) {
        goto LABEL_37;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v31 objects:v41 count:16];
        if (v11) {
          goto LABEL_11;
        }
        break;
      }
    }
  }

  -[GEOETARequest _readDeviceHistoricalLocations]((uint64_t)self);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = self->_deviceHistoricalLocations;
  uint64_t v14 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v27 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
LABEL_19:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v28 != v16) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v27 + 1) + 8 * v17) hasGreenTeaWithValue:v3]) {
        goto LABEL_37;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v27 objects:v40 count:16];
        if (v15) {
          goto LABEL_19;
        }
        break;
      }
    }
  }

  -[GEOETARequest _readIntermediateWaypointTypeds]((uint64_t)self);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = self->_intermediateWaypointTypeds;
  uint64_t v18 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v39 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
LABEL_27:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v24 != v20) {
        objc_enumerationMutation(v5);
      }
      if (objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v21), "hasGreenTeaWithValue:", v3, (void)v23)) {
        break;
      }
      if (v19 == ++v21)
      {
        uint64_t v19 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v39 count:16];
        if (v19) {
          goto LABEL_27;
        }
        goto LABEL_33;
      }
    }
LABEL_37:

    return 1;
  }
LABEL_33:

  -[GEOETARequest _readLastKnownRoadLocation]((uint64_t)self);
  if (![(GEOLocation *)self->_lastKnownRoadLocation hasGreenTeaWithValue:v3])
  {
    -[GEOETARequest _readOrigin]((uint64_t)self);
    if (![(GEOWaypoint *)self->_origin hasGreenTeaWithValue:v3])
    {
      -[GEOETARequest _readOriginWaypointTyped]((uint64_t)self);
      if (![(GEOWaypointTyped *)self->_originWaypointTyped hasGreenTeaWithValue:v3])
      {
        -[GEOETARequest _readOriginalWaypointRoute]((uint64_t)self);
        return [(GEOOriginalWaypointRoute *)self->_originalWaypointRoute hasGreenTeaWithValue:v3];
      }
    }
  }
  return 1;
}

- (void)copyTo:(id)a3
{
  uint64_t v42 = (char *)a3;
  [(GEOETARequest *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v42 + 1, self->_reader);
  *((_DWORD *)v42 + 72) = self->_readerMarkPos;
  *((_DWORD *)v42 + 73) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  $D0E8D0B55C880D94E0AADD8662313484 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    *((_DWORD *)v42 + 76) = self->_transportType;
    *((void *)v42 + 40) |= 0x10uLL;
    $D0E8D0B55C880D94E0AADD8662313484 flags = self->_flags;
  }
  if (*(unsigned char *)&flags)
  {
    uint64_t v5 = *(void *)&self->_timepoint._type;
    *(_OWORD *)(v42 + 24) = *(_OWORD *)&self->_timepoint._currentUserTime;
    *((void *)v42 + 5) = v5;
    *((void *)v42 + 40) |= 1uLL;
  }
  if (self->_origin) {
    objc_msgSend(v42, "setOrigin:");
  }
  if ([(GEOETARequest *)self destinationsCount])
  {
    [v42 clearDestinations];
    unint64_t v6 = [(GEOETARequest *)self destinationsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(GEOETARequest *)self destinationAtIndex:i];
        [v42 addDestination:v9];
      }
    }
  }
  $D0E8D0B55C880D94E0AADD8662313484 v10 = self->_flags;
  if ((*(_WORD *)&v10 & 0x100) != 0)
  {
    v42[314] = self->_includeHistoricTravelTime;
    *((void *)v42 + 40) |= 0x100uLL;
    $D0E8D0B55C880D94E0AADD8662313484 v10 = self->_flags;
    if ((*(unsigned char *)&v10 & 0x40) == 0)
    {
LABEL_13:
      if ((*(unsigned char *)&v10 & 0x80) == 0) {
        goto LABEL_14;
      }
      goto LABEL_97;
    }
  }
  else if ((*(unsigned char *)&v10 & 0x40) == 0)
  {
    goto LABEL_13;
  }
  v42[312] = self->_allowPartialResults;
  *((void *)v42 + 40) |= 0x40uLL;
  $D0E8D0B55C880D94E0AADD8662313484 v10 = self->_flags;
  if ((*(unsigned char *)&v10 & 0x80) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&v10 & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_98;
  }
LABEL_97:
  v42[313] = self->_includeDistance;
  *((void *)v42 + 40) |= 0x80uLL;
  $D0E8D0B55C880D94E0AADD8662313484 v10 = self->_flags;
  if ((*(unsigned char *)&v10 & 2) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&v10 & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_99;
  }
LABEL_98:
  *((_OWORD *)v42 + 3) = self->_sessionID;
  *((void *)v42 + 40) |= 2uLL;
  $D0E8D0B55C880D94E0AADD8662313484 v10 = self->_flags;
  if ((*(unsigned char *)&v10 & 4) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&v10 & 0x20) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_99:
  *((void *)v42 + 30) = *(void *)&self->_sessionRelativeTimestamp;
  *((void *)v42 + 40) |= 4uLL;
  if ((*(void *)&self->_flags & 0x20) != 0)
  {
LABEL_17:
    *((_DWORD *)v42 + 77) = self->_walkingLimitMeters;
    *((void *)v42 + 40) |= 0x20uLL;
  }
LABEL_18:
  if (self->_additionalEnabledMarkets) {
    objc_msgSend(v42, "setAdditionalEnabledMarkets:");
  }
  if (self->_originWaypointTyped) {
    objc_msgSend(v42, "setOriginWaypointTyped:");
  }
  if ([(GEOETARequest *)self destinationWaypointTypedsCount])
  {
    [v42 clearDestinationWaypointTypeds];
    unint64_t v11 = [(GEOETARequest *)self destinationWaypointTypedsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t j = 0; j != v12; ++j)
      {
        uint64_t v14 = [(GEOETARequest *)self destinationWaypointTypedAtIndex:j];
        [v42 addDestinationWaypointTyped:v14];
      }
    }
  }
  if ([(GEOETARequest *)self intermediateWaypointTypedsCount])
  {
    [v42 clearIntermediateWaypointTypeds];
    unint64_t v15 = [(GEOETARequest *)self intermediateWaypointTypedsCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t k = 0; k != v16; ++k)
      {
        uint64_t v18 = [(GEOETARequest *)self intermediateWaypointTypedAtIndex:k];
        [v42 addIntermediateWaypointTyped:v18];
      }
    }
  }
  if (self->_automobileOptions) {
    objc_msgSend(v42, "setAutomobileOptions:");
  }
  uint64_t v19 = v42;
  if (self->_cyclingOptions)
  {
    objc_msgSend(v42, "setCyclingOptions:");
    uint64_t v19 = v42;
  }
  if (self->_transitOptions)
  {
    objc_msgSend(v42, "setTransitOptions:");
    uint64_t v19 = v42;
  }
  if (self->_walkingOptions)
  {
    objc_msgSend(v42, "setWalkingOptions:");
    uint64_t v19 = v42;
  }
  if ((*((unsigned char *)&self->_flags + 1) & 0x10) != 0)
  {
    v19[318] = self->_isFromAPI;
    *((void *)v19 + 40) |= 0x1000uLL;
  }
  if (self->_commonOptions) {
    objc_msgSend(v42, "setCommonOptions:");
  }
  if (self->_sessionState) {
    objc_msgSend(v42, "setSessionState:");
  }
  if (self->_originalRouteID) {
    objc_msgSend(v42, "setOriginalRouteID:");
  }
  if ([(GEOETARequest *)self originalRouteZilchPointsCount])
  {
    [v42 clearOriginalRouteZilchPoints];
    unint64_t v20 = [(GEOETARequest *)self originalRouteZilchPointsCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (uint64_t m = 0; m != v21; ++m)
      {
        long long v23 = [(GEOETARequest *)self originalRouteZilchPointsAtIndex:m];
        [v42 addOriginalRouteZilchPoints:v23];
      }
    }
  }
  if (self->_originalWaypointRoute) {
    objc_msgSend(v42, "setOriginalWaypointRoute:");
  }
  if ([(GEOETARequest *)self deviceHistoricalLocationsCount])
  {
    [v42 clearDeviceHistoricalLocations];
    unint64_t v24 = [(GEOETARequest *)self deviceHistoricalLocationsCount];
    if (v24)
    {
      unint64_t v25 = v24;
      for (uint64_t n = 0; n != v25; ++n)
      {
        long long v27 = [(GEOETARequest *)self deviceHistoricalLocationAtIndex:n];
        [v42 addDeviceHistoricalLocation:v27];
      }
    }
  }
  if (self->_clientCapabilities) {
    objc_msgSend(v42, "setClientCapabilities:");
  }
  long long v28 = v42;
  if (self->_lastKnownRoadLocation)
  {
    objc_msgSend(v42, "setLastKnownRoadLocation:");
    long long v28 = v42;
  }
  if (self->_abClientMetadata)
  {
    objc_msgSend(v42, "setAbClientMetadata:");
    long long v28 = v42;
  }
  $D0E8D0B55C880D94E0AADD8662313484 v29 = self->_flags;
  if ((*(_WORD *)&v29 & 0x400) != 0)
  {
    v28[316] = self->_includeRouteTrafficDetail;
    *((void *)v28 + 40) |= 0x400uLL;
    $D0E8D0B55C880D94E0AADD8662313484 v29 = self->_flags;
  }
  if ((*(_WORD *)&v29 & 0x800) != 0)
  {
    v28[317] = self->_includeShortTrafficSummary;
    *((void *)v28 + 40) |= 0x800uLL;
  }
  if (self->_phoneticLocaleIdentifier)
  {
    objc_msgSend(v42, "setPhoneticLocaleIdentifier:");
    long long v28 = v42;
  }
  if (self->_requestingAppId)
  {
    objc_msgSend(v42, "setRequestingAppId:");
    long long v28 = v42;
  }
  if ((*((unsigned char *)&self->_flags + 1) & 2) != 0)
  {
    v28[315] = self->_includeEtaRouteIncidents;
    *((void *)v28 + 40) |= 0x200uLL;
  }
  if (self->_recentLocationHistory) {
    objc_msgSend(v42, "setRecentLocationHistory:");
  }
  if (self->_privacyMetadata) {
    objc_msgSend(v42, "setPrivacyMetadata:");
  }
  if (self->_pathComputationOptions) {
    objc_msgSend(v42, "setPathComputationOptions:");
  }
  if ([(GEOETARequest *)self serviceTagsCount])
  {
    [v42 clearServiceTags];
    unint64_t v30 = [(GEOETARequest *)self serviceTagsCount];
    if (v30)
    {
      unint64_t v31 = v30;
      for (iuint64_t i = 0; ii != v31; ++ii)
      {
        long long v33 = [(GEOETARequest *)self serviceTagAtIndex:ii];
        [v42 addServiceTag:v33];
      }
    }
  }
  if ([(GEOETARequest *)self trafficApiResponsesCount])
  {
    [v42 clearTrafficApiResponses];
    unint64_t v34 = [(GEOETARequest *)self trafficApiResponsesCount];
    if (v34)
    {
      unint64_t v35 = v34;
      for (juint64_t j = 0; jj != v35; ++jj)
      {
        long long v37 = [(GEOETARequest *)self trafficApiResponsesAtIndex:jj];
        [v42 addTrafficApiResponses:v37];
      }
    }
  }
  if ([(GEOETARequest *)self trafficSnapshotIdsCount])
  {
    [v42 clearTrafficSnapshotIds];
    unint64_t v38 = [(GEOETARequest *)self trafficSnapshotIdsCount];
    if (v38)
    {
      unint64_t v39 = v38;
      for (kuint64_t k = 0; kk != v39; ++kk)
      {
        uint64_t v41 = [(GEOETARequest *)self trafficSnapshotIdsAtIndex:kk];
        [v42 addTrafficSnapshotIds:v41];
      }
    }
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v42 + 75) = self->_trafficSnapshotUnixTime;
    *((void *)v42 + 40) |= 8uLL;
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
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 5) & 2) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOETARequestReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_83;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOETARequest *)self readAll:0];
  $D0E8D0B55C880D94E0AADD8662313484 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 304) = self->_transportType;
    *(void *)(v5 + 320) |= 0x10uLL;
    $D0E8D0B55C880D94E0AADD8662313484 flags = self->_flags;
  }
  if (*(unsigned char *)&flags)
  {
    uint64_t v10 = *(void *)&self->_timepoint._type;
    *(_OWORD *)(v5 + 24) = *(_OWORD *)&self->_timepoint._currentUserTime;
    *(void *)(v5 + 40) = v10;
    *(void *)(v5 + 320) |= 1uLL;
  }
  id v11 = [(GEOWaypoint *)self->_origin copyWithZone:a3];
  unint64_t v12 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v11;

  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  uint64_t v13 = self->_destinations;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v121 objects:v132 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v122;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v122 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v121 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addDestination:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v121 objects:v132 count:16];
    }
    while (v14);
  }

  $D0E8D0B55C880D94E0AADD8662313484 v18 = self->_flags;
  if ((*(_WORD *)&v18 & 0x100) != 0)
  {
    *(unsigned char *)(v5 + 314) = self->_includeHistoricTravelTime;
    *(void *)(v5 + 320) |= 0x100uLL;
    $D0E8D0B55C880D94E0AADD8662313484 v18 = self->_flags;
    if ((*(unsigned char *)&v18 & 0x40) == 0)
    {
LABEL_18:
      if ((*(unsigned char *)&v18 & 0x80) == 0) {
        goto LABEL_19;
      }
      goto LABEL_86;
    }
  }
  else if ((*(unsigned char *)&v18 & 0x40) == 0)
  {
    goto LABEL_18;
  }
  *(unsigned char *)(v5 + 312) = self->_allowPartialResults;
  *(void *)(v5 + 320) |= 0x40uLL;
  $D0E8D0B55C880D94E0AADD8662313484 v18 = self->_flags;
  if ((*(unsigned char *)&v18 & 0x80) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v18 & 2) == 0) {
      goto LABEL_20;
    }
    goto LABEL_87;
  }
LABEL_86:
  *(unsigned char *)(v5 + 313) = self->_includeDistance;
  *(void *)(v5 + 320) |= 0x80uLL;
  $D0E8D0B55C880D94E0AADD8662313484 v18 = self->_flags;
  if ((*(unsigned char *)&v18 & 2) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&v18 & 4) == 0) {
      goto LABEL_21;
    }
LABEL_88:
    *(double *)(v5 + 240) = self->_sessionRelativeTimestamp;
    *(void *)(v5 + 320) |= 4uLL;
    if ((*(void *)&self->_flags & 0x20) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_87:
  *(GEOSessionID *)(v5 + 48) = self->_sessionID;
  *(void *)(v5 + 320) |= 2uLL;
  $D0E8D0B55C880D94E0AADD8662313484 v18 = self->_flags;
  if ((*(unsigned char *)&v18 & 4) != 0) {
    goto LABEL_88;
  }
LABEL_21:
  if ((*(unsigned char *)&v18 & 0x20) != 0)
  {
LABEL_22:
    *(_DWORD *)(v5 + 308) = self->_walkingLimitMeters;
    *(void *)(v5 + 320) |= 0x20uLL;
  }
LABEL_23:
  id v19 = [(GEOAdditionalEnabledMarkets *)self->_additionalEnabledMarkets copyWithZone:a3];
  unint64_t v20 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v19;

  id v21 = [(GEOWaypointTyped *)self->_originWaypointTyped copyWithZone:a3];
  uint64_t v22 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v21;

  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v23 = self->_destinationWaypointTypeds;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v117 objects:v131 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v118;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v118 != v25) {
          objc_enumerationMutation(v23);
        }
        long long v27 = (void *)[*(id *)(*((void *)&v117 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addDestinationWaypointTyped:v27];
      }
      uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v117 objects:v131 count:16];
    }
    while (v24);
  }

  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v28 = self->_intermediateWaypointTypeds;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v113 objects:v130 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v114;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v114 != v30) {
          objc_enumerationMutation(v28);
        }
        long long v32 = (void *)[*(id *)(*((void *)&v113 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addIntermediateWaypointTyped:v32];
      }
      uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v113 objects:v130 count:16];
    }
    while (v29);
  }

  id v33 = [(GEOAutomobileOptions *)self->_automobileOptions copyWithZone:a3];
  unint64_t v34 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v33;

  id v35 = [(GEOCyclingOptions *)self->_cyclingOptions copyWithZone:a3];
  long long v36 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v35;

  id v37 = [(GEOTransitOptions *)self->_transitOptions copyWithZone:a3];
  unint64_t v38 = *(void **)(v5 + 272);
  *(void *)(v5 + 272) = v37;

  id v39 = [(GEOWalkingOptions *)self->_walkingOptions copyWithZone:a3];
  id v40 = *(void **)(v5 + 280);
  *(void *)(v5 + 280) = v39;

  if ((*((unsigned char *)&self->_flags + 1) & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 318) = self->_isFromAPI;
    *(void *)(v5 + 320) |= 0x1000uLL;
  }
  id v41 = [(GEOCommonOptions *)self->_commonOptions copyWithZone:a3];
  uint64_t v42 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v41;

  uint64_t v43 = [(NSData *)self->_sessionState copyWithZone:a3];
  id v44 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = v43;

  uint64_t v45 = [(NSData *)self->_originalRouteID copyWithZone:a3];
  uint64_t v46 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v45;

  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  uint64_t v47 = self->_originalRouteZilchPoints;
  uint64_t v48 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v109 objects:v129 count:16];
  if (v48)
  {
    uint64_t v49 = *(void *)v110;
    do
    {
      for (uint64_t m = 0; m != v48; ++m)
      {
        if (*(void *)v110 != v49) {
          objc_enumerationMutation(v47);
        }
        id v51 = (void *)[*(id *)(*((void *)&v109 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addOriginalRouteZilchPoints:v51];
      }
      uint64_t v48 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v109 objects:v129 count:16];
    }
    while (v48);
  }

  id v52 = [(GEOOriginalWaypointRoute *)self->_originalWaypointRoute copyWithZone:a3];
  uint64_t v53 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v52;

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  uint64_t v54 = self->_deviceHistoricalLocations;
  uint64_t v55 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v105 objects:v128 count:16];
  if (v55)
  {
    uint64_t v56 = *(void *)v106;
    do
    {
      for (uint64_t n = 0; n != v55; ++n)
      {
        if (*(void *)v106 != v56) {
          objc_enumerationMutation(v54);
        }
        uint64_t v58 = (void *)[*(id *)(*((void *)&v105 + 1) + 8 * n) copyWithZone:a3];
        [(id)v5 addDeviceHistoricalLocation:v58];
      }
      uint64_t v55 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v105 objects:v128 count:16];
    }
    while (v55);
  }

  id v59 = [(GEOClientCapabilities *)self->_clientCapabilities copyWithZone:a3];
  id v60 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v59;

  id v61 = [(GEOLocation *)self->_lastKnownRoadLocation copyWithZone:a3];
  uint64_t v62 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v61;

  id v63 = [(GEOPDABClientDatasetMetadata *)self->_abClientMetadata copyWithZone:a3];
  long long v64 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v63;

  $D0E8D0B55C880D94E0AADD8662313484 v65 = self->_flags;
  if ((*(_WORD *)&v65 & 0x400) != 0)
  {
    *(unsigned char *)(v5 + 316) = self->_includeRouteTrafficDetail;
    *(void *)(v5 + 320) |= 0x400uLL;
    $D0E8D0B55C880D94E0AADD8662313484 v65 = self->_flags;
  }
  if ((*(_WORD *)&v65 & 0x800) != 0)
  {
    *(unsigned char *)(v5 + 317) = self->_includeShortTrafficSummary;
    *(void *)(v5 + 320) |= 0x800uLL;
  }
  uint64_t v66 = [(NSString *)self->_phoneticLocaleIdentifier copyWithZone:a3];
  long long v67 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v66;

  uint64_t v68 = [(NSString *)self->_requestingAppId copyWithZone:a3];
  id v69 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v68;

  if ((*((unsigned char *)&self->_flags + 1) & 2) != 0)
  {
    *(unsigned char *)(v5 + 315) = self->_includeEtaRouteIncidents;
    *(void *)(v5 + 320) |= 0x200uLL;
  }
  id v70 = [(GEORecentLocationHistory *)self->_recentLocationHistory copyWithZone:a3];
  long long v71 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v70;

  id v72 = [(GEOPrivacyMetadata *)self->_privacyMetadata copyWithZone:a3];
  long long v73 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v72;

  id v74 = [(GEOPathComputationOptions *)self->_pathComputationOptions copyWithZone:a3];
  uint64_t v75 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v74;

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  v76 = self->_serviceTags;
  uint64_t v77 = [(NSMutableArray *)v76 countByEnumeratingWithState:&v101 objects:v127 count:16];
  if (v77)
  {
    uint64_t v78 = *(void *)v102;
    do
    {
      for (iuint64_t i = 0; ii != v77; ++ii)
      {
        if (*(void *)v102 != v78) {
          objc_enumerationMutation(v76);
        }
        uint64_t v80 = (void *)[*(id *)(*((void *)&v101 + 1) + 8 * ii) copyWithZone:a3];
        [(id)v5 addServiceTag:v80];
      }
      uint64_t v77 = [(NSMutableArray *)v76 countByEnumeratingWithState:&v101 objects:v127 count:16];
    }
    while (v77);
  }

  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  uint64_t v81 = self->_trafficApiResponses;
  uint64_t v82 = [(NSMutableArray *)v81 countByEnumeratingWithState:&v97 objects:v126 count:16];
  if (v82)
  {
    uint64_t v83 = *(void *)v98;
    do
    {
      for (juint64_t j = 0; jj != v82; ++jj)
      {
        if (*(void *)v98 != v83) {
          objc_enumerationMutation(v81);
        }
        v85 = (void *)[*(id *)(*((void *)&v97 + 1) + 8 * jj) copyWithZone:a3];
        [(id)v5 addTrafficApiResponses:v85];
      }
      uint64_t v82 = [(NSMutableArray *)v81 countByEnumeratingWithState:&v97 objects:v126 count:16];
    }
    while (v82);
  }

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  v86 = self->_trafficSnapshotIds;
  uint64_t v87 = [(NSMutableArray *)v86 countByEnumeratingWithState:&v93 objects:v125 count:16];
  if (v87)
  {
    uint64_t v88 = *(void *)v94;
    do
    {
      for (kuint64_t k = 0; kk != v87; ++kk)
      {
        if (*(void *)v94 != v88) {
          objc_enumerationMutation(v86);
        }
        uint64_t v90 = objc_msgSend(*(id *)(*((void *)&v93 + 1) + 8 * kk), "copyWithZone:", a3, (void)v93);
        [(id)v5 addTrafficSnapshotIds:v90];
      }
      uint64_t v87 = [(NSMutableArray *)v86 countByEnumeratingWithState:&v93 objects:v125 count:16];
    }
    while (v87);
  }

  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 300) = self->_trafficSnapshotUnixTime;
    *(void *)(v5 + 320) |= 8uLL;
  }
  uint64_t v91 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v91;
LABEL_83:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_153;
  }
  [(GEOETARequest *)self readAll:1];
  [v4 readAll:1];
  $D0E8D0B55C880D94E0AADD8662313484 flags = self->_flags;
  uint64_t v6 = *((void *)v4 + 40);
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_transportType != *((_DWORD *)v4 + 76)) {
      goto LABEL_153;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_153;
  }
  if (*(unsigned char *)&flags & 1) != 0 && (v6)
  {
    if (*(void *)&self->_timepoint._currentUserTime != *((void *)v4 + 3)
      || *(void *)&self->_timepoint._time != *((void *)v4 + 4)
      || *(void *)&self->_timepoint._type != *((void *)v4 + 5))
    {
      goto LABEL_153;
    }
  }
  else if ((*(_DWORD *)&flags | v6))
  {
    goto LABEL_153;
  }
  origiuint64_t n = self->_origin;
  if ((unint64_t)origin | *((void *)v4 + 23) && !-[GEOWaypoint isEqual:](origin, "isEqual:")) {
    goto LABEL_153;
  }
  destinations = self->_destinations;
  if ((unint64_t)destinations | *((void *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](destinations, "isEqual:")) {
      goto LABEL_153;
    }
  }
  $D0E8D0B55C880D94E0AADD8662313484 v11 = self->_flags;
  uint64_t v12 = *((void *)v4 + 40);
  if ((*(_WORD *)&v11 & 0x100) != 0)
  {
    if ((v12 & 0x100) == 0) {
      goto LABEL_153;
    }
    if (self->_includeHistoricTravelTime)
    {
      if (!*((unsigned char *)v4 + 314)) {
        goto LABEL_153;
      }
    }
    else if (*((unsigned char *)v4 + 314))
    {
      goto LABEL_153;
    }
  }
  else if ((v12 & 0x100) != 0)
  {
    goto LABEL_153;
  }
  if ((*(unsigned char *)&v11 & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0) {
      goto LABEL_153;
    }
    if (self->_allowPartialResults)
    {
      if (!*((unsigned char *)v4 + 312)) {
        goto LABEL_153;
      }
    }
    else if (*((unsigned char *)v4 + 312))
    {
      goto LABEL_153;
    }
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_153;
  }
  if ((*(unsigned char *)&v11 & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0) {
      goto LABEL_153;
    }
    if (self->_includeDistance)
    {
      if (!*((unsigned char *)v4 + 313)) {
        goto LABEL_153;
      }
    }
    else if (*((unsigned char *)v4 + 313))
    {
      goto LABEL_153;
    }
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_153;
  }
  if ((*(unsigned char *)&v11 & 2) != 0 && (v12 & 2) != 0)
  {
    if (self->_sessionID._high != *((void *)v4 + 6) || self->_sessionID._low != *((void *)v4 + 7)) {
      goto LABEL_153;
    }
  }
  else if (((*(_DWORD *)&v11 | v12) & 2) != 0)
  {
    goto LABEL_153;
  }
  if ((*(unsigned char *)&v11 & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_sessionRelativeTimestamp != *((double *)v4 + 30)) {
      goto LABEL_153;
    }
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_153;
  }
  if ((*(unsigned char *)&v11 & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_walkingLimitMeters != *((_DWORD *)v4 + 77)) {
      goto LABEL_153;
    }
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_153;
  }
  additionalEnabledMarkets = self->_additionalEnabledMarkets;
  if ((unint64_t)additionalEnabledMarkets | *((void *)v4 + 9)
    && !-[GEOAdditionalEnabledMarkets isEqual:](additionalEnabledMarkets, "isEqual:"))
  {
    goto LABEL_153;
  }
  originWaypointTyped = self->_originWaypointTyped;
  if ((unint64_t)originWaypointTyped | *((void *)v4 + 19))
  {
    if (!-[GEOWaypointTyped isEqual:](originWaypointTyped, "isEqual:")) {
      goto LABEL_153;
    }
  }
  destinationWaypointTypeds = self->_destinationWaypointTypeds;
  if ((unint64_t)destinationWaypointTypeds | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](destinationWaypointTypeds, "isEqual:")) {
      goto LABEL_153;
    }
  }
  intermediateWaypointTypeds = self->_intermediateWaypointTypeds;
  if ((unint64_t)intermediateWaypointTypeds | *((void *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](intermediateWaypointTypeds, "isEqual:")) {
      goto LABEL_153;
    }
  }
  automobileOptions = self->_automobileOptions;
  if ((unint64_t)automobileOptions | *((void *)v4 + 10))
  {
    if (!-[GEOAutomobileOptions isEqual:](automobileOptions, "isEqual:")) {
      goto LABEL_153;
    }
  }
  cyclingOptions = self->_cyclingOptions;
  if ((unint64_t)cyclingOptions | *((void *)v4 + 13))
  {
    if (!-[GEOCyclingOptions isEqual:](cyclingOptions, "isEqual:")) {
      goto LABEL_153;
    }
  }
  transitOptions = self->_transitOptions;
  if ((unint64_t)transitOptions | *((void *)v4 + 34))
  {
    if (!-[GEOTransitOptions isEqual:](transitOptions, "isEqual:")) {
      goto LABEL_153;
    }
  }
  walkingOptions = self->_walkingOptions;
  if ((unint64_t)walkingOptions | *((void *)v4 + 35))
  {
    if (!-[GEOWalkingOptions isEqual:](walkingOptions, "isEqual:")) {
      goto LABEL_153;
    }
  }
  uint64_t v22 = *((void *)v4 + 40);
  if ((*((unsigned char *)&self->_flags + 1) & 0x10) != 0)
  {
    if ((v22 & 0x1000) == 0) {
      goto LABEL_153;
    }
    if (self->_isFromAPI)
    {
      if (!*((unsigned char *)v4 + 318)) {
        goto LABEL_153;
      }
    }
    else if (*((unsigned char *)v4 + 318))
    {
      goto LABEL_153;
    }
  }
  else if ((v22 & 0x1000) != 0)
  {
    goto LABEL_153;
  }
  commonOptions = self->_commonOptions;
  if ((unint64_t)commonOptions | *((void *)v4 + 12)
    && !-[GEOCommonOptions isEqual:](commonOptions, "isEqual:"))
  {
    goto LABEL_153;
  }
  sessionState = self->_sessionState;
  if ((unint64_t)sessionState | *((void *)v4 + 31))
  {
    if (!-[NSData isEqual:](sessionState, "isEqual:")) {
      goto LABEL_153;
    }
  }
  originalRouteID = self->_originalRouteID;
  if ((unint64_t)originalRouteID | *((void *)v4 + 20))
  {
    if (!-[NSData isEqual:](originalRouteID, "isEqual:")) {
      goto LABEL_153;
    }
  }
  originalRouteZilchPoints = self->_originalRouteZilchPoints;
  if ((unint64_t)originalRouteZilchPoints | *((void *)v4 + 21))
  {
    if (!-[NSMutableArray isEqual:](originalRouteZilchPoints, "isEqual:")) {
      goto LABEL_153;
    }
  }
  originalWaypointRoute = self->_originalWaypointRoute;
  if ((unint64_t)originalWaypointRoute | *((void *)v4 + 22))
  {
    if (!-[GEOOriginalWaypointRoute isEqual:](originalWaypointRoute, "isEqual:")) {
      goto LABEL_153;
    }
  }
  deviceHistoricalLocations = self->_deviceHistoricalLocations;
  if ((unint64_t)deviceHistoricalLocations | *((void *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](deviceHistoricalLocations, "isEqual:")) {
      goto LABEL_153;
    }
  }
  clientCapabilities = self->_clientCapabilities;
  if ((unint64_t)clientCapabilities | *((void *)v4 + 11))
  {
    if (!-[GEOClientCapabilities isEqual:](clientCapabilities, "isEqual:")) {
      goto LABEL_153;
    }
  }
  lastKnownRoadLocatiouint64_t n = self->_lastKnownRoadLocation;
  if ((unint64_t)lastKnownRoadLocation | *((void *)v4 + 18))
  {
    if (!-[GEOLocation isEqual:](lastKnownRoadLocation, "isEqual:")) {
      goto LABEL_153;
    }
  }
  abClientMetadata = self->_abClientMetadata;
  if ((unint64_t)abClientMetadata | *((void *)v4 + 8))
  {
    if (!-[GEOPDABClientDatasetMetadata isEqual:](abClientMetadata, "isEqual:")) {
      goto LABEL_153;
    }
  }
  $D0E8D0B55C880D94E0AADD8662313484 v32 = self->_flags;
  uint64_t v33 = *((void *)v4 + 40);
  if ((*(_WORD *)&v32 & 0x400) != 0)
  {
    if ((v33 & 0x400) == 0) {
      goto LABEL_153;
    }
    if (self->_includeRouteTrafficDetail)
    {
      if (!*((unsigned char *)v4 + 316)) {
        goto LABEL_153;
      }
    }
    else if (*((unsigned char *)v4 + 316))
    {
      goto LABEL_153;
    }
  }
  else if ((v33 & 0x400) != 0)
  {
    goto LABEL_153;
  }
  if ((*(_WORD *)&v32 & 0x800) != 0)
  {
    if ((v33 & 0x800) == 0) {
      goto LABEL_153;
    }
    if (self->_includeShortTrafficSummary)
    {
      if (!*((unsigned char *)v4 + 317)) {
        goto LABEL_153;
      }
    }
    else if (*((unsigned char *)v4 + 317))
    {
      goto LABEL_153;
    }
  }
  else if ((v33 & 0x800) != 0)
  {
    goto LABEL_153;
  }
  phoneticLocaleIdentifier = self->_phoneticLocaleIdentifier;
  if ((unint64_t)phoneticLocaleIdentifier | *((void *)v4 + 25)
    && !-[NSString isEqual:](phoneticLocaleIdentifier, "isEqual:"))
  {
    goto LABEL_153;
  }
  requestingAppId = self->_requestingAppId;
  if ((unint64_t)requestingAppId | *((void *)v4 + 28))
  {
    if (!-[NSString isEqual:](requestingAppId, "isEqual:")) {
      goto LABEL_153;
    }
  }
  uint64_t v36 = *((void *)v4 + 40);
  if ((*((unsigned char *)&self->_flags + 1) & 2) != 0)
  {
    if ((v36 & 0x200) != 0)
    {
      if (self->_includeEtaRouteIncidents)
      {
        if (!*((unsigned char *)v4 + 315)) {
          goto LABEL_153;
        }
        goto LABEL_136;
      }
      if (!*((unsigned char *)v4 + 315)) {
        goto LABEL_136;
      }
    }
LABEL_153:
    BOOL v43 = 0;
    goto LABEL_154;
  }
  if ((v36 & 0x200) != 0) {
    goto LABEL_153;
  }
LABEL_136:
  recentLocationHistory = self->_recentLocationHistory;
  if ((unint64_t)recentLocationHistory | *((void *)v4 + 27)
    && !-[GEORecentLocationHistory isEqual:](recentLocationHistory, "isEqual:"))
  {
    goto LABEL_153;
  }
  privacyMetadata = self->_privacyMetadata;
  if ((unint64_t)privacyMetadata | *((void *)v4 + 26))
  {
    if (!-[GEOPrivacyMetadata isEqual:](privacyMetadata, "isEqual:")) {
      goto LABEL_153;
    }
  }
  pathComputationOptions = self->_pathComputationOptions;
  if ((unint64_t)pathComputationOptions | *((void *)v4 + 24))
  {
    if (!-[GEOPathComputationOptions isEqual:](pathComputationOptions, "isEqual:")) {
      goto LABEL_153;
    }
  }
  serviceTags = self->_serviceTags;
  if ((unint64_t)serviceTags | *((void *)v4 + 29))
  {
    if (!-[NSMutableArray isEqual:](serviceTags, "isEqual:")) {
      goto LABEL_153;
    }
  }
  trafficApiResponses = self->_trafficApiResponses;
  if ((unint64_t)trafficApiResponses | *((void *)v4 + 32))
  {
    if (!-[NSMutableArray isEqual:](trafficApiResponses, "isEqual:")) {
      goto LABEL_153;
    }
  }
  trafficSnapshotIds = self->_trafficSnapshotIds;
  if ((unint64_t)trafficSnapshotIds | *((void *)v4 + 33))
  {
    if (!-[NSMutableArray isEqual:](trafficSnapshotIds, "isEqual:")) {
      goto LABEL_153;
    }
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((void *)v4 + 40) & 8) == 0 || self->_trafficSnapshotUnixTime != *((_DWORD *)v4 + 75)) {
      goto LABEL_153;
    }
    BOOL v43 = 1;
  }
  else
  {
    BOOL v43 = (*((void *)v4 + 40) & 8) == 0;
  }
LABEL_154:

  return v43;
}

- (unint64_t)hash
{
  [(GEOETARequest *)self readAll:1];
  $D0E8D0B55C880D94E0AADD8662313484 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    uint64_t v51 = 2654435761 * self->_transportType;
    if (*(unsigned char *)&flags) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v51 = 0;
    if (*(unsigned char *)&flags)
    {
LABEL_3:
      uint64_t v50 = PBHashBytes();
      goto LABEL_6;
    }
  }
  uint64_t v50 = 0;
LABEL_6:
  unint64_t v49 = [(GEOWaypoint *)self->_origin hash];
  uint64_t v48 = [(NSMutableArray *)self->_destinations hash];
  $D0E8D0B55C880D94E0AADD8662313484 v4 = self->_flags;
  if ((*(_WORD *)&v4 & 0x100) != 0)
  {
    uint64_t v47 = 2654435761 * self->_includeHistoricTravelTime;
    if ((*(unsigned char *)&v4 & 0x40) != 0)
    {
LABEL_8:
      uint64_t v46 = 2654435761 * self->_allowPartialResults;
      if ((*(unsigned char *)&v4 & 0x80) != 0) {
        goto LABEL_9;
      }
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v47 = 0;
    if ((*(unsigned char *)&v4 & 0x40) != 0) {
      goto LABEL_8;
    }
  }
  uint64_t v46 = 0;
  if ((*(unsigned char *)&v4 & 0x80) != 0)
  {
LABEL_9:
    uint64_t v45 = 2654435761 * self->_includeDistance;
    if ((*(unsigned char *)&v4 & 2) != 0) {
      goto LABEL_10;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v45 = 0;
  if ((*(unsigned char *)&v4 & 2) != 0)
  {
LABEL_10:
    uint64_t v44 = PBHashBytes();
    $D0E8D0B55C880D94E0AADD8662313484 v4 = self->_flags;
    if ((*(unsigned char *)&v4 & 4) != 0) {
      goto LABEL_11;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v44 = 0;
  if ((*(unsigned char *)&v4 & 4) != 0)
  {
LABEL_11:
    double sessionRelativeTimestamp = self->_sessionRelativeTimestamp;
    double v6 = -sessionRelativeTimestamp;
    if (sessionRelativeTimestamp >= 0.0) {
      double v6 = self->_sessionRelativeTimestamp;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v9 += (unint64_t)v8;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v8);
    }
    unint64_t v43 = v9;
    if ((*(unsigned char *)&v4 & 0x20) == 0) {
      goto LABEL_24;
    }
LABEL_20:
    uint64_t v42 = 2654435761 * self->_walkingLimitMeters;
    goto LABEL_25;
  }
LABEL_19:
  unint64_t v43 = 0;
  if ((*(unsigned char *)&v4 & 0x20) != 0) {
    goto LABEL_20;
  }
LABEL_24:
  uint64_t v42 = 0;
LABEL_25:
  unint64_t v41 = [(GEOAdditionalEnabledMarkets *)self->_additionalEnabledMarkets hash];
  unint64_t v40 = [(GEOWaypointTyped *)self->_originWaypointTyped hash];
  uint64_t v39 = [(NSMutableArray *)self->_destinationWaypointTypeds hash];
  uint64_t v38 = [(NSMutableArray *)self->_intermediateWaypointTypeds hash];
  unint64_t v37 = [(GEOAutomobileOptions *)self->_automobileOptions hash];
  unint64_t v36 = [(GEOCyclingOptions *)self->_cyclingOptions hash];
  unint64_t v35 = [(GEOTransitOptions *)self->_transitOptions hash];
  unint64_t v34 = [(GEOWalkingOptions *)self->_walkingOptions hash];
  if ((*((unsigned char *)&self->_flags + 1) & 0x10) != 0) {
    uint64_t v33 = 2654435761 * self->_isFromAPI;
  }
  else {
    uint64_t v33 = 0;
  }
  unint64_t v32 = [(GEOCommonOptions *)self->_commonOptions hash];
  uint64_t v31 = [(NSData *)self->_sessionState hash];
  uint64_t v30 = [(NSData *)self->_originalRouteID hash];
  uint64_t v29 = [(NSMutableArray *)self->_originalRouteZilchPoints hash];
  unint64_t v28 = [(GEOOriginalWaypointRoute *)self->_originalWaypointRoute hash];
  uint64_t v27 = [(NSMutableArray *)self->_deviceHistoricalLocations hash];
  unint64_t v26 = [(GEOClientCapabilities *)self->_clientCapabilities hash];
  unint64_t v25 = [(GEOLocation *)self->_lastKnownRoadLocation hash];
  unint64_t v24 = [(GEOPDABClientDatasetMetadata *)self->_abClientMetadata hash];
  $D0E8D0B55C880D94E0AADD8662313484 v10 = self->_flags;
  if ((*(_WORD *)&v10 & 0x400) != 0)
  {
    uint64_t v23 = 2654435761 * self->_includeRouteTrafficDetail;
    if ((*(_WORD *)&v10 & 0x800) != 0) {
      goto LABEL_30;
    }
  }
  else
  {
    uint64_t v23 = 0;
    if ((*(_WORD *)&v10 & 0x800) != 0)
    {
LABEL_30:
      uint64_t v22 = 2654435761 * self->_includeShortTrafficSummary;
      goto LABEL_33;
    }
  }
  uint64_t v22 = 0;
LABEL_33:
  NSUInteger v21 = [(NSString *)self->_phoneticLocaleIdentifier hash];
  NSUInteger v20 = [(NSString *)self->_requestingAppId hash];
  if ((*((unsigned char *)&self->_flags + 1) & 2) != 0) {
    uint64_t v11 = 2654435761 * self->_includeEtaRouteIncidents;
  }
  else {
    uint64_t v11 = 0;
  }
  unint64_t v12 = [(GEORecentLocationHistory *)self->_recentLocationHistory hash];
  unint64_t v13 = [(GEOPrivacyMetadata *)self->_privacyMetadata hash];
  unint64_t v14 = [(GEOPathComputationOptions *)self->_pathComputationOptions hash];
  uint64_t v15 = [(NSMutableArray *)self->_serviceTags hash];
  uint64_t v16 = [(NSMutableArray *)self->_trafficApiResponses hash];
  uint64_t v17 = [(NSMutableArray *)self->_trafficSnapshotIds hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    uint64_t v18 = 2654435761 * self->_trafficSnapshotUnixTime;
  }
  else {
    uint64_t v18 = 0;
  }
  return v50 ^ v51 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  $D0E8D0B55C880D94E0AADD8662313484 v4 = (char *)a3;
  [v4 readAll:0];
  uint64_t v5 = *((void *)v4 + 40);
  if ((v5 & 0x10) != 0)
  {
    self->_transportType = *((_DWORD *)v4 + 76);
    *(void *)&self->_flags |= 0x10uLL;
    uint64_t v5 = *((void *)v4 + 40);
  }
  if (v5)
  {
    uint64_t v6 = *((void *)v4 + 5);
    *(_OWORD *)&self->_timepoint._currentUserTime = *(_OWORD *)(v4 + 24);
    *(void *)&self->_timepoint._type = v6;
    *(void *)&self->_flags |= 1uLL;
  }
  origiuint64_t n = self->_origin;
  uint64_t v8 = *((void *)v4 + 23);
  if (origin)
  {
    if (v8) {
      -[GEOWaypoint mergeFrom:](origin, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[GEOETARequest setOrigin:](self, "setOrigin:");
  }
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v9 = *((id *)v4 + 15);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v108 objects:v119 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v109;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v109 != v12) {
          objc_enumerationMutation(v9);
        }
        [(GEOETARequest *)self addDestination:*(void *)(*((void *)&v108 + 1) + 8 * i)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v108 objects:v119 count:16];
    }
    while (v11);
  }

  uint64_t v14 = *((void *)v4 + 40);
  if ((v14 & 0x100) != 0)
  {
    self->_includeHistoricTravelTime = v4[314];
    *(void *)&self->_flags |= 0x100uLL;
    uint64_t v14 = *((void *)v4 + 40);
    if ((v14 & 0x40) == 0)
    {
LABEL_19:
      if ((v14 & 0x80) == 0) {
        goto LABEL_20;
      }
      goto LABEL_29;
    }
  }
  else if ((v14 & 0x40) == 0)
  {
    goto LABEL_19;
  }
  self->_allowPartialResults = v4[312];
  *(void *)&self->_flags |= 0x40uLL;
  uint64_t v14 = *((void *)v4 + 40);
  if ((v14 & 0x80) == 0)
  {
LABEL_20:
    if ((v14 & 2) == 0) {
      goto LABEL_21;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_includeDistance = v4[313];
  *(void *)&self->_flags |= 0x80uLL;
  uint64_t v14 = *((void *)v4 + 40);
  if ((v14 & 2) == 0)
  {
LABEL_21:
    if ((v14 & 4) == 0) {
      goto LABEL_22;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_sessionID = (GEOSessionID)*((_OWORD *)v4 + 3);
  *(void *)&self->_flags |= 2uLL;
  uint64_t v14 = *((void *)v4 + 40);
  if ((v14 & 4) == 0)
  {
LABEL_22:
    if ((v14 & 0x20) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_31:
  self->_double sessionRelativeTimestamp = *((double *)v4 + 30);
  *(void *)&self->_flags |= 4uLL;
  if ((*((void *)v4 + 40) & 0x20) != 0)
  {
LABEL_23:
    self->_walkingLimitMeters = *((_DWORD *)v4 + 77);
    *(void *)&self->_flags |= 0x20uLL;
  }
LABEL_24:
  additionalEnabledMarkets = self->_additionalEnabledMarkets;
  uint64_t v16 = *((void *)v4 + 9);
  if (additionalEnabledMarkets)
  {
    if (v16) {
      -[GEOAdditionalEnabledMarkets mergeFrom:](additionalEnabledMarkets, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[GEOETARequest setAdditionalEnabledMarkets:](self, "setAdditionalEnabledMarkets:");
  }
  originWaypointTyped = self->_originWaypointTyped;
  uint64_t v18 = *((void *)v4 + 19);
  if (originWaypointTyped)
  {
    if (v18) {
      -[GEOWaypointTyped mergeFrom:](originWaypointTyped, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[GEOETARequest setOriginWaypointTyped:](self, "setOriginWaypointTyped:");
  }
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v19 = *((id *)v4 + 14);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v104 objects:v118 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v105;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v105 != v22) {
          objc_enumerationMutation(v19);
        }
        [(GEOETARequest *)self addDestinationWaypointTyped:*(void *)(*((void *)&v104 + 1) + 8 * j)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v104 objects:v118 count:16];
    }
    while (v21);
  }

  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v24 = *((id *)v4 + 17);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v100 objects:v117 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v101;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v101 != v27) {
          objc_enumerationMutation(v24);
        }
        [(GEOETARequest *)self addIntermediateWaypointTyped:*(void *)(*((void *)&v100 + 1) + 8 * k)];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v100 objects:v117 count:16];
    }
    while (v26);
  }

  automobileOptions = self->_automobileOptions;
  uint64_t v30 = *((void *)v4 + 10);
  if (automobileOptions)
  {
    if (v30) {
      -[GEOAutomobileOptions mergeFrom:](automobileOptions, "mergeFrom:");
    }
  }
  else if (v30)
  {
    -[GEOETARequest setAutomobileOptions:](self, "setAutomobileOptions:");
  }
  cyclingOptions = self->_cyclingOptions;
  uint64_t v32 = *((void *)v4 + 13);
  if (cyclingOptions)
  {
    if (v32) {
      -[GEOCyclingOptions mergeFrom:](cyclingOptions, "mergeFrom:");
    }
  }
  else if (v32)
  {
    -[GEOETARequest setCyclingOptions:](self, "setCyclingOptions:");
  }
  transitOptions = self->_transitOptions;
  uint64_t v34 = *((void *)v4 + 34);
  if (transitOptions)
  {
    if (v34) {
      -[GEOTransitOptions mergeFrom:](transitOptions, "mergeFrom:");
    }
  }
  else if (v34)
  {
    -[GEOETARequest setTransitOptions:](self, "setTransitOptions:");
  }
  walkingOptions = self->_walkingOptions;
  uint64_t v36 = *((void *)v4 + 35);
  if (walkingOptions)
  {
    if (v36) {
      -[GEOWalkingOptions mergeFrom:](walkingOptions, "mergeFrom:");
    }
  }
  else if (v36)
  {
    -[GEOETARequest setWalkingOptions:](self, "setWalkingOptions:");
  }
  if ((v4[321] & 0x10) != 0)
  {
    self->_isFromAPI = v4[318];
    *(void *)&self->_flags |= 0x1000uLL;
  }
  commonOptions = self->_commonOptions;
  uint64_t v38 = *((void *)v4 + 12);
  if (commonOptions)
  {
    if (v38) {
      -[GEOCommonOptions mergeFrom:](commonOptions, "mergeFrom:");
    }
  }
  else if (v38)
  {
    -[GEOETARequest setCommonOptions:](self, "setCommonOptions:");
  }
  if (*((void *)v4 + 31)) {
    -[GEOETARequest setSessionState:](self, "setSessionState:");
  }
  if (*((void *)v4 + 20)) {
    [(GEOETARequest *)self setOriginalRouteID:"setOriginalRouteID:"];
  }
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v39 = *((id *)v4 + 21);
  uint64_t v40 = [v39 countByEnumeratingWithState:&v96 objects:v116 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v97;
    do
    {
      for (uint64_t m = 0; m != v41; ++m)
      {
        if (*(void *)v97 != v42) {
          objc_enumerationMutation(v39);
        }
        [(GEOETARequest *)self addOriginalRouteZilchPoints:*(void *)(*((void *)&v96 + 1) + 8 * m)];
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v96 objects:v116 count:16];
    }
    while (v41);
  }

  originalWaypointRoute = self->_originalWaypointRoute;
  uint64_t v45 = *((void *)v4 + 22);
  if (originalWaypointRoute)
  {
    if (v45) {
      -[GEOOriginalWaypointRoute mergeFrom:](originalWaypointRoute, "mergeFrom:");
    }
  }
  else if (v45)
  {
    [(GEOETARequest *)self setOriginalWaypointRoute:"setOriginalWaypointRoute:"];
  }
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v46 = *((id *)v4 + 16);
  uint64_t v47 = [v46 countByEnumeratingWithState:&v92 objects:v115 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v93;
    do
    {
      for (uint64_t n = 0; n != v48; ++n)
      {
        if (*(void *)v93 != v49) {
          objc_enumerationMutation(v46);
        }
        [(GEOETARequest *)self addDeviceHistoricalLocation:*(void *)(*((void *)&v92 + 1) + 8 * n)];
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v92 objects:v115 count:16];
    }
    while (v48);
  }

  clientCapabilities = self->_clientCapabilities;
  uint64_t v52 = *((void *)v4 + 11);
  if (clientCapabilities)
  {
    if (v52) {
      -[GEOClientCapabilities mergeFrom:](clientCapabilities, "mergeFrom:");
    }
  }
  else if (v52)
  {
    -[GEOETARequest setClientCapabilities:](self, "setClientCapabilities:");
  }
  lastKnownRoadLocatiouint64_t n = self->_lastKnownRoadLocation;
  uint64_t v54 = *((void *)v4 + 18);
  if (lastKnownRoadLocation)
  {
    if (v54) {
      -[GEOLocation mergeFrom:](lastKnownRoadLocation, "mergeFrom:");
    }
  }
  else if (v54)
  {
    -[GEOETARequest setLastKnownRoadLocation:](self, "setLastKnownRoadLocation:");
  }
  abClientMetadata = self->_abClientMetadata;
  uint64_t v56 = *((void *)v4 + 8);
  if (abClientMetadata)
  {
    if (v56) {
      -[GEOPDABClientDatasetMetadata mergeFrom:](abClientMetadata, "mergeFrom:");
    }
  }
  else if (v56)
  {
    -[GEOETARequest setAbClientMetadata:](self, "setAbClientMetadata:");
  }
  uint64_t v57 = *((void *)v4 + 40);
  if ((v57 & 0x400) != 0)
  {
    self->_includeRouteTrafficDetail = v4[316];
    *(void *)&self->_flags |= 0x400uLL;
    uint64_t v57 = *((void *)v4 + 40);
  }
  if ((v57 & 0x800) != 0)
  {
    self->_includeShortTrafficSummary = v4[317];
    *(void *)&self->_flags |= 0x800uLL;
  }
  if (*((void *)v4 + 25)) {
    -[GEOETARequest setPhoneticLocaleIdentifier:](self, "setPhoneticLocaleIdentifier:");
  }
  if (*((void *)v4 + 28)) {
    -[GEOETARequest setRequestingAppId:](self, "setRequestingAppId:");
  }
  if ((v4[321] & 2) != 0)
  {
    self->_includeEtaRouteIncidents = v4[315];
    *(void *)&self->_flags |= 0x200uLL;
  }
  recentLocationHistory = self->_recentLocationHistory;
  uint64_t v59 = *((void *)v4 + 27);
  if (recentLocationHistory)
  {
    if (v59) {
      -[GEORecentLocationHistory mergeFrom:](recentLocationHistory, "mergeFrom:");
    }
  }
  else if (v59)
  {
    -[GEOETARequest setRecentLocationHistory:](self, "setRecentLocationHistory:");
  }
  privacyMetadata = self->_privacyMetadata;
  uint64_t v61 = *((void *)v4 + 26);
  if (privacyMetadata)
  {
    if (v61) {
      -[GEOPrivacyMetadata mergeFrom:](privacyMetadata, "mergeFrom:");
    }
  }
  else if (v61)
  {
    -[GEOETARequest setPrivacyMetadata:](self, "setPrivacyMetadata:");
  }
  pathComputationOptions = self->_pathComputationOptions;
  id v63 = (void *)*((void *)v4 + 24);
  if (pathComputationOptions)
  {
    if (v63)
    {
      long long v64 = v63;
      if (v64[5])
      {
        pathComputationOptions->_pathComputationMethod = v64[4];
        *(unsigned char *)&pathComputationOptions->_flags |= 1u;
      }
    }
  }
  else if (v63)
  {
    -[GEOETARequest setPathComputationOptions:](self, "setPathComputationOptions:");
  }
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v65 = *((id *)v4 + 29);
  uint64_t v66 = [v65 countByEnumeratingWithState:&v88 objects:v114 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v89;
    do
    {
      for (iuint64_t i = 0; ii != v67; ++ii)
      {
        if (*(void *)v89 != v68) {
          objc_enumerationMutation(v65);
        }
        [(GEOETARequest *)self addServiceTag:*(void *)(*((void *)&v88 + 1) + 8 * ii)];
      }
      uint64_t v67 = [v65 countByEnumeratingWithState:&v88 objects:v114 count:16];
    }
    while (v67);
  }

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v70 = *((id *)v4 + 32);
  uint64_t v71 = [v70 countByEnumeratingWithState:&v84 objects:v113 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v85;
    do
    {
      for (juint64_t j = 0; jj != v72; ++jj)
      {
        if (*(void *)v85 != v73) {
          objc_enumerationMutation(v70);
        }
        [(GEOETARequest *)self addTrafficApiResponses:*(void *)(*((void *)&v84 + 1) + 8 * jj)];
      }
      uint64_t v72 = [v70 countByEnumeratingWithState:&v84 objects:v113 count:16];
    }
    while (v72);
  }

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v75 = *((id *)v4 + 33);
  uint64_t v76 = [v75 countByEnumeratingWithState:&v80 objects:v112 count:16];
  if (v76)
  {
    uint64_t v77 = v76;
    uint64_t v78 = *(void *)v81;
    do
    {
      for (kuint64_t k = 0; kk != v77; ++kk)
      {
        if (*(void *)v81 != v78) {
          objc_enumerationMutation(v75);
        }
        -[GEOETARequest addTrafficSnapshotIds:](self, "addTrafficSnapshotIds:", *(void *)(*((void *)&v80 + 1) + 8 * kk), (void)v80);
      }
      uint64_t v77 = [v75 countByEnumeratingWithState:&v80 objects:v112 count:16];
    }
    while (v77);
  }

  if ((v4[320] & 8) != 0)
  {
    self->_trafficSnapshotUnixTime = *((_DWORD *)v4 + 75);
    *(void *)&self->_flags |= 8uLL;
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
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOETARequestReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_19);
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
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000002000uLL;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOETARequest *)self readAll:0];
    [(GEOWaypoint *)self->_origin clearUnknownFields:1];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long double v7 = self->_destinations;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v51;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v51 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v50 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v50 objects:v58 count:16];
      }
      while (v9);
    }

    [(GEOAdditionalEnabledMarkets *)self->_additionalEnabledMarkets clearUnknownFields:1];
    [(GEOWaypointTyped *)self->_originWaypointTyped clearUnknownFields:1];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v12 = self->_destinationWaypointTypeds;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v46 objects:v57 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v47;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v47 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v46 + 1) + 8 * v16++) clearUnknownFields:1];
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v46 objects:v57 count:16];
      }
      while (v14);
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v17 = self->_intermediateWaypointTypeds;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v42 objects:v56 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v43;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v43 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v42 + 1) + 8 * v21++) clearUnknownFields:1];
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v42 objects:v56 count:16];
      }
      while (v19);
    }

    [(GEOAutomobileOptions *)self->_automobileOptions clearUnknownFields:1];
    [(GEOCyclingOptions *)self->_cyclingOptions clearUnknownFields:1];
    [(GEOTransitOptions *)self->_transitOptions clearUnknownFields:1];
    [(GEOWalkingOptions *)self->_walkingOptions clearUnknownFields:1];
    [(GEOCommonOptions *)self->_commonOptions clearUnknownFields:1];
    [(GEOOriginalWaypointRoute *)self->_originalWaypointRoute clearUnknownFields:1];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v22 = self->_deviceHistoricalLocations;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v38 objects:v55 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v39;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v39 != v25) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v38 + 1) + 8 * v26++) clearUnknownFields:1];
        }
        while (v24 != v26);
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v38 objects:v55 count:16];
      }
      while (v24);
    }

    [(GEOClientCapabilities *)self->_clientCapabilities clearUnknownFields:1];
    [(GEOLocation *)self->_lastKnownRoadLocation clearUnknownFields:1];
    [(GEOPDABClientDatasetMetadata *)self->_abClientMetadata clearUnknownFields:1];
    [(GEORecentLocationHistory *)self->_recentLocationHistory clearUnknownFields:1];
    [(GEOPrivacyMetadata *)self->_privacyMetadata clearUnknownFields:1];
    pathComputationOptions = self->_pathComputationOptions;
    if (pathComputationOptions)
    {
      unint64_t v28 = pathComputationOptions->_unknownFields;
      pathComputationOptions->_unknownFields = 0;
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v29 = self->_serviceTags;
    uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v34 objects:v54 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v35;
      do
      {
        uint64_t v33 = 0;
        do
        {
          if (*(void *)v35 != v32) {
            objc_enumerationMutation(v29);
          }
          objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * v33++), "clearUnknownFields:", 1, (void)v34);
        }
        while (v31 != v33);
        uint64_t v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v34 objects:v54 count:16];
      }
      while (v31);
    }
  }
}

@end