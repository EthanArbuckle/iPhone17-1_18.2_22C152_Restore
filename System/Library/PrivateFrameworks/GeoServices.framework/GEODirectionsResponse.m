@interface GEODirectionsResponse
+ (BOOL)isValid:(id)a3;
+ (Class)arrivalParametersType;
+ (Class)incidentsOffRoutesType;
+ (Class)incidentsOnRoutesType;
+ (Class)internalErrorType;
+ (Class)placeSearchResponseType;
+ (Class)routeType;
+ (Class)serviceGapType;
+ (Class)suggestedRouteType;
+ (Class)trafficCameraType;
+ (Class)trafficSignalType;
+ (Class)transitPaymentMethodSuggestionType;
+ (Class)waypointRouteType;
- (BOOL)hasAdvisoriesInfo;
- (BOOL)hasAnalyticData;
- (BOOL)hasClientMetrics;
- (BOOL)hasDataVersion;
- (BOOL)hasDatasetAbStatus;
- (BOOL)hasDebugData;
- (BOOL)hasDecoderData;
- (BOOL)hasDirectionsResponseID;
- (BOOL)hasDisplayHints;
- (BOOL)hasFailureAlert;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHasKhSegments;
- (BOOL)hasInstructionSignFillColor;
- (BOOL)hasIsNavigable;
- (BOOL)hasIsOfflineResponse;
- (BOOL)hasKhSegments;
- (BOOL)hasLiveRouteSavingsSeconds;
- (BOOL)hasLocalDistanceUnits;
- (BOOL)hasNonRecommendedRoutesCache;
- (BOOL)hasResponseAttributes;
- (BOOL)hasRouteDeviatesFromOriginal;
- (BOOL)hasSelectedRouteIndex;
- (BOOL)hasServiceVersion;
- (BOOL)hasSessionState;
- (BOOL)hasSnapScoreMetadataDebug;
- (BOOL)hasStyleAttributes;
- (BOOL)hasTimepointUsed;
- (BOOL)hasTransitDataVersion;
- (BOOL)hasTransitIncidentMessage;
- (BOOL)hasTransitRouteUpdateConfiguration;
- (BOOL)hasTripId;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNavigable;
- (BOOL)isOfflineResponse;
- (BOOL)readFrom:(id)a3;
- (BOOL)routeDeviatesFromOriginal;
- (GEOAdvisoriesInfo)advisoriesInfo;
- (GEOAlert)failureAlert;
- (GEOClientMetrics)clientMetrics;
- (GEOCommonResponseAttributes)responseAttributes;
- (GEODirectionsRequestResponseAnalyticsData)analyticData;
- (GEODirectionsResponse)init;
- (GEODirectionsResponse)initWithData:(id)a3;
- (GEODirectionsResponse)initWithDictionary:(id)a3;
- (GEODirectionsResponse)initWithJSON:(id)a3;
- (GEOPBTransitRoutingIncidentMessage)transitIncidentMessage;
- (GEOPDDatasetABStatus)datasetAbStatus;
- (GEOProblemDetail)problemDetailAtIndex:(unint64_t)a3;
- (GEOProblemDetail)problemDetails;
- (GEORouteDisplayHints)displayHints;
- (GEOSnapScoreMetadata)snapScoreMetadataDebug;
- (GEOStyleAttributes)styleAttributes;
- (GEOTimepoint)timepointUsed;
- (GEOTransitDecoderData)decoderData;
- (GEOTransitRouteUpdateConfiguration)transitRouteUpdateConfiguration;
- (GEOUUID)tripId;
- (NSData)directionsResponseID;
- (NSData)nonRecommendedRoutesCache;
- (NSData)sessionState;
- (NSMutableArray)arrivalParameters;
- (NSMutableArray)incidentsOffRoutes;
- (NSMutableArray)incidentsOnRoutes;
- (NSMutableArray)internalErrors;
- (NSMutableArray)placeSearchResponses;
- (NSMutableArray)routes;
- (NSMutableArray)serviceGaps;
- (NSMutableArray)suggestedRoutes;
- (NSMutableArray)trafficCameras;
- (NSMutableArray)trafficSignals;
- (NSMutableArray)transitPaymentMethodSuggestions;
- (NSMutableArray)waypointRoutes;
- (NSString)dataVersion;
- (NSString)debugData;
- (NSString)description;
- (NSString)serviceVersion;
- (NSString)transitDataVersion;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_geoTrafficCameras;
- (id)_geoTrafficSignals;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)arrivalParametersAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)incidentsOffRoutesAtIndex:(unint64_t)a3;
- (id)incidentsOnRoutesAtIndex:(unint64_t)a3;
- (id)instanceCompatibleWithProtocolVersion:(unint64_t)a3;
- (id)instructionSignFillColorAsString:(int)a3;
- (id)internalErrorAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)localDistanceUnitsAsString:(int)a3;
- (id)placeSearchResponseAtIndex:(unint64_t)a3;
- (id)preJupiterCompatibleDirectionsResponseWithRoute:(id)a3;
- (id)routeAtIndex:(unint64_t)a3;
- (id)serviceGapAtIndex:(unint64_t)a3;
- (id)statusAsString:(int)a3;
- (id)suggestedRouteAtIndex:(unint64_t)a3;
- (id)supportedTransportTypesAsString:(int)a3;
- (id)trafficCameraAtIndex:(unint64_t)a3;
- (id)trafficSignalAtIndex:(unint64_t)a3;
- (id)transitPaymentMethodSuggestionAtIndex:(unint64_t)a3;
- (id)waypointRouteAtIndex:(unint64_t)a3;
- (int)StringAsInstructionSignFillColor:(id)a3;
- (int)StringAsLocalDistanceUnits:(id)a3;
- (int)StringAsStatus:(id)a3;
- (int)StringAsSupportedTransportTypes:(id)a3;
- (int)instructionSignFillColor;
- (int)liveRouteSavingsSeconds;
- (int)localDistanceUnits;
- (int)status;
- (int)supportedTransportTypeAtIndex:(unint64_t)a3;
- (int)supportedTransportTypes;
- (uint64_t)_reserveProblemDetails:(uint64_t)a1;
- (unint64_t)arrivalParametersCount;
- (unint64_t)hash;
- (unint64_t)incidentsOffRoutesCount;
- (unint64_t)incidentsOnRoutesCount;
- (unint64_t)internalErrorsCount;
- (unint64_t)placeSearchResponsesCount;
- (unint64_t)problemDetailsCount;
- (unint64_t)routesCount;
- (unint64_t)serviceGapsCount;
- (unint64_t)suggestedRoutesCount;
- (unint64_t)supportedTransportTypesCount;
- (unint64_t)trafficCamerasCount;
- (unint64_t)trafficSignalsCount;
- (unint64_t)transitPaymentMethodSuggestionsCount;
- (unint64_t)waypointRoutesCount;
- (unsigned)selectedRouteIndex;
- (void)_addNoFlagsArrivalParameters:(uint64_t)a1;
- (void)_addNoFlagsIncidentsOffRoutes:(uint64_t)a1;
- (void)_addNoFlagsIncidentsOnRoutes:(uint64_t)a1;
- (void)_addNoFlagsInternalError:(uint64_t)a1;
- (void)_addNoFlagsPlaceSearchResponse:(uint64_t)a1;
- (void)_addNoFlagsRoute:(uint64_t)a1;
- (void)_addNoFlagsServiceGap:(uint64_t)a1;
- (void)_addNoFlagsSuggestedRoute:(uint64_t)a1;
- (void)_addNoFlagsTrafficCamera:(uint64_t)a1;
- (void)_addNoFlagsTrafficSignal:(uint64_t)a1;
- (void)_addNoFlagsTransitPaymentMethodSuggestion:(uint64_t)a1;
- (void)_addNoFlagsWaypointRoute:(uint64_t)a1;
- (void)_clearJupiterFieldsForTesting;
- (void)_readAdvisoriesInfo;
- (void)_readAnalyticData;
- (void)_readArrivalParameters;
- (void)_readClientMetrics;
- (void)_readDataVersion;
- (void)_readDatasetAbStatus;
- (void)_readDebugData;
- (void)_readDecoderData;
- (void)_readDirectionsResponseID;
- (void)_readDisplayHints;
- (void)_readFailureAlert;
- (void)_readIncidentsOffRoutes;
- (void)_readIncidentsOnRoutes;
- (void)_readInternalErrors;
- (void)_readNonRecommendedRoutesCache;
- (void)_readPlaceSearchResponses;
- (void)_readProblemDetails;
- (void)_readResponseAttributes;
- (void)_readRoutes;
- (void)_readServiceGaps;
- (void)_readServiceVersion;
- (void)_readSessionState;
- (void)_readSnapScoreMetadataDebug;
- (void)_readStyleAttributes;
- (void)_readSuggestedRoutes;
- (void)_readSupportedTransportTypes;
- (void)_readTrafficCameras;
- (void)_readTrafficSignals;
- (void)_readTransitDataVersion;
- (void)_readTransitIncidentMessage;
- (void)_readTransitPaymentMethodSuggestions;
- (void)_readTransitRouteUpdateConfiguration;
- (void)_readTripId;
- (void)_readWaypointRoutes;
- (void)addArrivalParameters:(id)a3;
- (void)addIncidentsOffRoutes:(id)a3;
- (void)addIncidentsOnRoutes:(id)a3;
- (void)addInternalError:(id)a3;
- (void)addPlaceSearchResponse:(id)a3;
- (void)addProblemDetail:(GEOProblemDetail)a3;
- (void)addRoute:(id)a3;
- (void)addServiceGap:(id)a3;
- (void)addSuggestedRoute:(id)a3;
- (void)addSupportedTransportType:(int)a3;
- (void)addTrafficCamera:(id)a3;
- (void)addTrafficSignal:(id)a3;
- (void)addTransitPaymentMethodSuggestion:(id)a3;
- (void)addWaypointRoute:(id)a3;
- (void)clearArrivalParameters;
- (void)clearIncidentsOffRoutes;
- (void)clearIncidentsOnRoutes;
- (void)clearInternalErrors;
- (void)clearLocations;
- (void)clearPlaceSearchResponses;
- (void)clearProblemDetails;
- (void)clearRoutes;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearServiceGaps;
- (void)clearSuggestedRoutes;
- (void)clearSupportedTransportTypes;
- (void)clearTrafficCameras;
- (void)clearTrafficSignals;
- (void)clearTransitPaymentMethodSuggestions;
- (void)clearUnknownFields:(BOOL)a3;
- (void)clearWaypointRoutes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAdvisoriesInfo:(id)a3;
- (void)setAnalyticData:(id)a3;
- (void)setArrivalParameters:(id)a3;
- (void)setClientMetrics:(id)a3;
- (void)setDataVersion:(id)a3;
- (void)setDatasetAbStatus:(id)a3;
- (void)setDebugData:(id)a3;
- (void)setDecoderData:(id)a3;
- (void)setDirectionsResponseID:(id)a3;
- (void)setDisplayHints:(id)a3;
- (void)setFailureAlert:(id)a3;
- (void)setHasHasKhSegments:(BOOL)a3;
- (void)setHasInstructionSignFillColor:(BOOL)a3;
- (void)setHasIsNavigable:(BOOL)a3;
- (void)setHasIsOfflineResponse:(BOOL)a3;
- (void)setHasKhSegments:(BOOL)a3;
- (void)setHasLiveRouteSavingsSeconds:(BOOL)a3;
- (void)setHasLocalDistanceUnits:(BOOL)a3;
- (void)setHasRouteDeviatesFromOriginal:(BOOL)a3;
- (void)setHasSelectedRouteIndex:(BOOL)a3;
- (void)setHasTimepointUsed:(BOOL)a3;
- (void)setIncidentsOffRoutes:(id)a3;
- (void)setIncidentsOnRoutes:(id)a3;
- (void)setInstructionSignFillColor:(int)a3;
- (void)setInternalErrors:(id)a3;
- (void)setIsNavigable:(BOOL)a3;
- (void)setIsOfflineResponse:(BOOL)a3;
- (void)setLiveRouteSavingsSeconds:(int)a3;
- (void)setLocalDistanceUnits:(int)a3;
- (void)setNonRecommendedRoutesCache:(id)a3;
- (void)setPlaceSearchResponses:(id)a3;
- (void)setProblemDetails:(GEOProblemDetail *)a3 count:(unint64_t)a4;
- (void)setResponseAttributes:(id)a3;
- (void)setRouteDeviatesFromOriginal:(BOOL)a3;
- (void)setRoutes:(id)a3;
- (void)setSelectedRouteIndex:(unsigned int)a3;
- (void)setServiceGaps:(id)a3;
- (void)setServiceVersion:(id)a3;
- (void)setSessionState:(id)a3;
- (void)setSnapScoreMetadataDebug:(id)a3;
- (void)setStatus:(int)a3;
- (void)setStyleAttributes:(id)a3;
- (void)setSuggestedRoutes:(id)a3;
- (void)setSupportedTransportTypes:(int *)a3 count:(unint64_t)a4;
- (void)setTimepointUsed:(GEOTimepoint *)a3;
- (void)setTrafficCameras:(id)a3;
- (void)setTrafficSignals:(id)a3;
- (void)setTransitDataVersion:(id)a3;
- (void)setTransitIncidentMessage:(id)a3;
- (void)setTransitPaymentMethodSuggestions:(id)a3;
- (void)setTransitRouteUpdateConfiguration:(id)a3;
- (void)setTripId:(id)a3;
- (void)setWaypointRoutes:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEODirectionsResponse

- (id)instanceCompatibleWithProtocolVersion:(unint64_t)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a3 - 3;
  v6 = GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    if (v7)
    {
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138412802;
      v37 = v12;
      __int16 v38 = 2048;
      v39 = self;
      __int16 v40 = 2048;
      unint64_t v41 = a3;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "%@<%p> is not compatible with protocol version %lu", buf, 0x20u);
    }
    v10 = (GEODirectionsResponse *)[(GEODirectionsResponse *)self copy];
    v13 = [(GEODirectionsResponse *)v10 decoderData];
    v14 = [v13 steps];
    migrateTransitSteps(v14, a3);

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v15 = [(GEODirectionsResponse *)v10 suggestedRoutes];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v21 = [v20 displayStrings];
          v22 = [v21 planningDescription];
          migrateFormattedString(v22, a3);

          v23 = [v20 displayStrings];
          v24 = [v23 duration];
          migrateFormattedString(v24, a3);

          v25 = [v20 displayStrings];
          v26 = [v25 travelDescription];
          migrateFormattedString(v26, a3);

          v27 = [v20 displayStrings];
          v28 = [v27 badge];
          migrateFormattedString(v28, a3);

          v29 = [v20 steps];
          migrateTransitSteps(v29, a3);
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v17);
    }
  }
  else
  {
    if (v7)
    {
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138412802;
      v37 = v9;
      __int16 v38 = 2048;
      v39 = self;
      __int16 v40 = 2048;
      unint64_t v41 = a3;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "%@<%p> is compatible with protocol version %lu", buf, 0x20u);
    }
    v10 = self;
  }

  return v10;
}

- (id)_geoTrafficCameras
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA60];
  v4 = [(GEODirectionsResponse *)self trafficCameras];
  unint64_t v5 = objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(GEODirectionsResponse *)self trafficCameras];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = [v11 identifier];

        if (v12)
        {
          v13 = [v11 identifier];
          [v5 setObject:v11 forKeyedSubscript:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_geoTrafficSignals
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA60];
  v4 = [(GEODirectionsResponse *)self trafficSignals];
  unint64_t v5 = objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(GEODirectionsResponse *)self trafficSignals];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = [v11 identifier];

        if (v12)
        {
          v13 = [v11 identifier];
          [v5 setObject:v11 forKeyedSubscript:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (GEODirectionsResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEODirectionsResponse;
  v2 = [(GEODirectionsResponse *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEODirectionsResponse)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEODirectionsResponse;
  v3 = [(GEODirectionsResponse *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    unint64_t v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  [(GEODirectionsResponse *)self clearProblemDetails];
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEODirectionsResponse;
  [(GEODirectionsResponse *)&v3 dealloc];
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  *(void *)&self->_flags |= 0x100000000000uLL;
  self->_status = a3;
}

- (id)statusAsString:(int)a3
{
  if (a3 <= 29)
  {
    v4 = @"STATUS_SUCCESS";
    switch(a3)
    {
      case 0:
        goto LABEL_22;
      case 1:
        v4 = @"STATUS_FAILED";
        break;
      case 2:
        v4 = @"STATUS_INCOMPLETE";
        break;
      case 3:
      case 4:
        goto LABEL_21;
      case 5:
        v4 = @"INVALID_REQUEST";
        break;
      default:
        if (a3 != 20) {
          goto LABEL_21;
        }
        v4 = @"FAILED_NO_RESULT";
        break;
    }
    return v4;
  }
  if (a3 > 49)
  {
    if (a3 == 50)
    {
      v4 = @"STATUS_DEDUPED";
    }
    else
    {
      if (a3 != 60) {
        goto LABEL_21;
      }
      v4 = @"VERSION_MISMATCH";
    }
  }
  else
  {
    if (a3 != 30)
    {
      if (a3 == 40)
      {
        v4 = @"FAILED_NOT_AUTHORIZED";
        return v4;
      }
LABEL_21:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_22:
      return v4;
    }
    v4 = @"NEEDS_REFINEMENT";
  }
  return v4;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"STATUS_SUCCESS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STATUS_FAILED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STATUS_INCOMPLETE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"INVALID_REQUEST"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FAILED_NO_RESULT"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"NEEDS_REFINEMENT"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"STATUS_DEDUPED"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"VERSION_MISMATCH"])
  {
    int v4 = 60;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readRoutes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 391) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRoutes_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (NSMutableArray)routes
{
  -[GEODirectionsResponse _readRoutes]((uint64_t)self);
  routes = self->_routes;

  return routes;
}

- (void)setRoutes:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
  routes = self->_routes;
  self->_routes = v4;
}

- (void)clearRoutes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
  routes = self->_routes;

  [(NSMutableArray *)routes removeAllObjects];
}

- (void)addRoute:(id)a3
{
  id v4 = a3;
  -[GEODirectionsResponse _readRoutes]((uint64_t)self);
  -[GEODirectionsResponse _addNoFlagsRoute:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
}

- (void)_addNoFlagsRoute:(uint64_t)a1
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

- (unint64_t)routesCount
{
  -[GEODirectionsResponse _readRoutes]((uint64_t)self);
  routes = self->_routes;

  return [(NSMutableArray *)routes count];
}

- (id)routeAtIndex:(unint64_t)a3
{
  -[GEODirectionsResponse _readRoutes]((uint64_t)self);
  routes = self->_routes;

  return (id)[(NSMutableArray *)routes objectAtIndex:a3];
}

+ (Class)routeType
{
  return (Class)objc_opt_class();
}

- (void)_readWaypointRoutes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 393) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWaypointRoutes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (NSMutableArray)waypointRoutes
{
  -[GEODirectionsResponse _readWaypointRoutes]((uint64_t)self);
  waypointRoutes = self->_waypointRoutes;

  return waypointRoutes;
}

- (void)setWaypointRoutes:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
  waypointRoutes = self->_waypointRoutes;
  self->_waypointRoutes = v4;
}

- (void)clearWaypointRoutes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
  waypointRoutes = self->_waypointRoutes;

  [(NSMutableArray *)waypointRoutes removeAllObjects];
}

- (void)addWaypointRoute:(id)a3
{
  id v4 = a3;
  -[GEODirectionsResponse _readWaypointRoutes]((uint64_t)self);
  -[GEODirectionsResponse _addNoFlagsWaypointRoute:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
}

- (void)_addNoFlagsWaypointRoute:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 344);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 344);
      *(void *)(a1 + 344) = v5;

      id v4 = *(void **)(a1 + 344);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)waypointRoutesCount
{
  -[GEODirectionsResponse _readWaypointRoutes]((uint64_t)self);
  waypointRoutes = self->_waypointRoutes;

  return [(NSMutableArray *)waypointRoutes count];
}

- (id)waypointRouteAtIndex:(unint64_t)a3
{
  -[GEODirectionsResponse _readWaypointRoutes]((uint64_t)self);
  waypointRoutes = self->_waypointRoutes;

  return (id)[(NSMutableArray *)waypointRoutes objectAtIndex:a3];
}

+ (Class)waypointRouteType
{
  return (Class)objc_opt_class();
}

- (void)_readPlaceSearchResponses
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 391) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceSearchResponses_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (NSMutableArray)placeSearchResponses
{
  -[GEODirectionsResponse _readPlaceSearchResponses]((uint64_t)self);
  placeSearchResponses = self->_placeSearchResponses;

  return placeSearchResponses;
}

- (void)setPlaceSearchResponses:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
  placeSearchResponses = self->_placeSearchResponses;
  self->_placeSearchResponses = v4;
}

- (void)clearPlaceSearchResponses
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
  placeSearchResponses = self->_placeSearchResponses;

  [(NSMutableArray *)placeSearchResponses removeAllObjects];
}

- (void)addPlaceSearchResponse:(id)a3
{
  id v4 = a3;
  -[GEODirectionsResponse _readPlaceSearchResponses]((uint64_t)self);
  -[GEODirectionsResponse _addNoFlagsPlaceSearchResponse:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
}

- (void)_addNoFlagsPlaceSearchResponse:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 216);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 216);
      *(void *)(a1 + 216) = v5;

      id v4 = *(void **)(a1 + 216);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)placeSearchResponsesCount
{
  -[GEODirectionsResponse _readPlaceSearchResponses]((uint64_t)self);
  placeSearchResponses = self->_placeSearchResponses;

  return [(NSMutableArray *)placeSearchResponses count];
}

- (id)placeSearchResponseAtIndex:(unint64_t)a3
{
  -[GEODirectionsResponse _readPlaceSearchResponses]((uint64_t)self);
  placeSearchResponses = self->_placeSearchResponses;

  return (id)[(NSMutableArray *)placeSearchResponses objectAtIndex:a3];
}

+ (Class)placeSearchResponseType
{
  return (Class)objc_opt_class();
}

- (int)localDistanceUnits
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $BB24C2ED400A1348441C88FA4FCB4848 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 8) != 0) {
    return self->_localDistanceUnits;
  }
  else {
    return 0;
  }
}

- (void)setLocalDistanceUnits:(int)a3
{
  *(void *)&self->_flags |= 0x100000000008uLL;
  self->_localDistanceUnits = a3;
}

- (void)setHasLocalDistanceUnits:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (a3) {
    uint64_t v3 = 0x100000000008;
  }
  self->_$BB24C2ED400A1348441C88FA4FCB4848 flags = ($BB24C2ED400A1348441C88FA4FCB4848)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasLocalDistanceUnits
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)localDistanceUnitsAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53F57C0[a3];
  }

  return v3;
}

- (int)StringAsLocalDistanceUnits:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"METRIC"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IMPERIAL"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)routeDeviatesFromOriginal
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $BB24C2ED400A1348441C88FA4FCB4848 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x100) != 0 && self->_routeDeviatesFromOriginal;
}

- (void)setRouteDeviatesFromOriginal:(BOOL)a3
{
  *(void *)&self->_flags |= 0x100000000100uLL;
  self->_routeDeviatesFromOriginal = a3;
}

- (void)setHasRouteDeviatesFromOriginal:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (a3) {
    uint64_t v3 = 0x100000000100;
  }
  self->_$BB24C2ED400A1348441C88FA4FCB4848 flags = ($BB24C2ED400A1348441C88FA4FCB4848)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasRouteDeviatesFromOriginal
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (void)_readDirectionsResponseID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 390) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsResponseID_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasDirectionsResponseID
{
  return self->_directionsResponseID != 0;
}

- (NSData)directionsResponseID
{
  -[GEODirectionsResponse _readDirectionsResponseID]((uint64_t)self);
  directionsResponseID = self->_directionsResponseID;

  return directionsResponseID;
}

- (void)setDirectionsResponseID:(id)a3
{
  *(void *)&self->_flags |= 0x100000100000uLL;
  objc_storeStrong((id *)&self->_directionsResponseID, a3);
}

- (void)_readTripId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 393) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTripId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasTripId
{
  return self->_tripId != 0;
}

- (GEOUUID)tripId
{
  -[GEODirectionsResponse _readTripId]((uint64_t)self);
  tripId = self->_tripId;

  return tripId;
}

- (void)setTripId:(id)a3
{
  *(void *)&self->_flags |= 0x140000000000uLL;
  objc_storeStrong((id *)&self->_tripId, a3);
}

- (BOOL)isNavigable
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $BB24C2ED400A1348441C88FA4FCB4848 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(unsigned char *)&flags & 0x40) != 0 && self->_isNavigable;
}

- (void)setIsNavigable:(BOOL)a3
{
  *(void *)&self->_flags |= 0x100000000040uLL;
  self->_isNavigable = a3;
}

- (void)setHasIsNavigable:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (a3) {
    uint64_t v3 = 0x100000000040;
  }
  self->_$BB24C2ED400A1348441C88FA4FCB4848 flags = ($BB24C2ED400A1348441C88FA4FCB4848)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasIsNavigable
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (int)instructionSignFillColor
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $BB24C2ED400A1348441C88FA4FCB4848 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 2) != 0) {
    return self->_instructionSignFillColor;
  }
  else {
    return 2;
  }
}

- (void)setInstructionSignFillColor:(int)a3
{
  *(void *)&self->_flags |= 0x100000000002uLL;
  self->_instructionSignFillColor = a3;
}

- (void)setHasInstructionSignFillColor:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (a3) {
    uint64_t v3 = 0x100000000002;
  }
  self->_$BB24C2ED400A1348441C88FA4FCB4848 flags = ($BB24C2ED400A1348441C88FA4FCB4848)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasInstructionSignFillColor
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)instructionSignFillColorAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53F57D8[a3];
  }

  return v3;
}

- (int)StringAsInstructionSignFillColor:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"BLACK"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GREEN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"YELLOW"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BLUE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PURPLE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CYAN"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"WHITE"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readIncidentsOnRoutes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 391) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIncidentsOnRoutes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (NSMutableArray)incidentsOnRoutes
{
  -[GEODirectionsResponse _readIncidentsOnRoutes]((uint64_t)self);
  incidentsOnRoutes = self->_incidentsOnRoutes;

  return incidentsOnRoutes;
}

- (void)setIncidentsOnRoutes:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
  incidentsOnRoutes = self->_incidentsOnRoutes;
  self->_incidentsOnRoutes = v4;
}

- (void)clearIncidentsOnRoutes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
  incidentsOnRoutes = self->_incidentsOnRoutes;

  [(NSMutableArray *)incidentsOnRoutes removeAllObjects];
}

- (void)addIncidentsOnRoutes:(id)a3
{
  id v4 = a3;
  -[GEODirectionsResponse _readIncidentsOnRoutes]((uint64_t)self);
  -[GEODirectionsResponse _addNoFlagsIncidentsOnRoutes:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
}

- (void)_addNoFlagsIncidentsOnRoutes:(uint64_t)a1
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

- (unint64_t)incidentsOnRoutesCount
{
  -[GEODirectionsResponse _readIncidentsOnRoutes]((uint64_t)self);
  incidentsOnRoutes = self->_incidentsOnRoutes;

  return [(NSMutableArray *)incidentsOnRoutes count];
}

- (id)incidentsOnRoutesAtIndex:(unint64_t)a3
{
  -[GEODirectionsResponse _readIncidentsOnRoutes]((uint64_t)self);
  incidentsOnRoutes = self->_incidentsOnRoutes;

  return (id)[(NSMutableArray *)incidentsOnRoutes objectAtIndex:a3];
}

+ (Class)incidentsOnRoutesType
{
  return (Class)objc_opt_class();
}

- (void)_readIncidentsOffRoutes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 390) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIncidentsOffRoutes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (NSMutableArray)incidentsOffRoutes
{
  -[GEODirectionsResponse _readIncidentsOffRoutes]((uint64_t)self);
  incidentsOffRoutes = self->_incidentsOffRoutes;

  return incidentsOffRoutes;
}

- (void)setIncidentsOffRoutes:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
  incidentsOffRoutes = self->_incidentsOffRoutes;
  self->_incidentsOffRoutes = v4;
}

- (void)clearIncidentsOffRoutes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
  incidentsOffRoutes = self->_incidentsOffRoutes;

  [(NSMutableArray *)incidentsOffRoutes removeAllObjects];
}

- (void)addIncidentsOffRoutes:(id)a3
{
  id v4 = a3;
  -[GEODirectionsResponse _readIncidentsOffRoutes]((uint64_t)self);
  -[GEODirectionsResponse _addNoFlagsIncidentsOffRoutes:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
}

- (void)_addNoFlagsIncidentsOffRoutes:(uint64_t)a1
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

- (unint64_t)incidentsOffRoutesCount
{
  -[GEODirectionsResponse _readIncidentsOffRoutes]((uint64_t)self);
  incidentsOffRoutes = self->_incidentsOffRoutes;

  return [(NSMutableArray *)incidentsOffRoutes count];
}

- (id)incidentsOffRoutesAtIndex:(unint64_t)a3
{
  -[GEODirectionsResponse _readIncidentsOffRoutes]((uint64_t)self);
  incidentsOffRoutes = self->_incidentsOffRoutes;

  return (id)[(NSMutableArray *)incidentsOffRoutes objectAtIndex:a3];
}

+ (Class)incidentsOffRoutesType
{
  return (Class)objc_opt_class();
}

- (void)_readProblemDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 389) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblemDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (unint64_t)problemDetailsCount
{
  return self->_problemDetailsCount;
}

- (GEOProblemDetail)problemDetails
{
  return self->_problemDetails;
}

- (uint64_t)_reserveProblemDetails:(uint64_t)a1
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    unint64_t v4 = *(void *)(a1 + 32);
    unint64_t v5 = v4 + a2;
    if (v4 + a2 <= v4) {
      return 0;
    }
    unint64_t v6 = *(void *)(a1 + 40);
    if (v6 >= v5) {
      return 1;
    }
    unint64_t v7 = v6 + a2;
    if (v6 + a2)
    {
      unint64_t v8 = 1;
      while (1)
      {
        unint64_t v9 = v8;
        if (v8 >= v7) {
          break;
        }
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          unint64_t v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      unint64_t v9 = 0;
    }
    if (v9 < a2) {
      return 0;
    }
LABEL_12:
    if (12 * v9 < v9) {
      return 0;
    }
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 24), 12 * v9, 0xDDB0EE88uLL);
    if (result)
    {
      *(void *)(a1 + 40) = v9;
      *(void *)(a1 + 24) = result;
      bzero((void *)(result + 12 * *(void *)(a1 + 32)), 12 * (v9 - *(void *)(a1 + 32)));
      return 1;
    }
  }
  return result;
}

- (void)clearProblemDetails
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
  self->_problemDetailsSpace = 0;
  self->_problemDetailsCount = 0;
  free(self->_problemDetails);
  self->_problemDetails = 0;
}

- (void)addProblemDetail:(GEOProblemDetail)a3
{
  $7D24B5AD5894795FD85A0EE1D817D743 var2 = a3.var2;
  uint64_t v4 = *(void *)&a3.var0;
  -[GEODirectionsResponse _readProblemDetails]((uint64_t)self);
  if (self && -[GEODirectionsResponse _reserveProblemDetails:]((uint64_t)self, 1uLL))
  {
    unint64_t v6 = &self->_problemDetails[self->_problemDetailsCount];
    *(void *)&v6->var0 = v4;
    v6->$7D24B5AD5894795FD85A0EE1D817D743 var2 = var2;
    ++self->_problemDetailsCount;
  }
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
}

- (GEOProblemDetail)problemDetailAtIndex:(unint64_t)a3
{
  -[GEODirectionsResponse _readProblemDetails]((uint64_t)self);
  unint64_t problemDetailsCount = self->_problemDetailsCount;
  if (problemDetailsCount <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, problemDetailsCount);
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  v10 = &self->_problemDetails[a3];
  uint64_t v11 = *(void *)&v10->var0;
  $7D24B5AD5894795FD85A0EE1D817D743 var2 = v10->var2;
  result.var0 = v11;
  result.var1 = HIDWORD(v11);
  result.$7D24B5AD5894795FD85A0EE1D817D743 var2 = var2;
  return result;
}

- (void)setProblemDetails:(GEOProblemDetail *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
  [(GEODirectionsResponse *)self clearProblemDetails];
  if (-[GEODirectionsResponse _reserveProblemDetails:]((uint64_t)self, a4))
  {
    memcpy(self->_problemDetails, a3, 12 * a4);
    self->_unint64_t problemDetailsCount = a4;
  }
}

- (void)_readSupportedTransportTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 389) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedTransportTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (unint64_t)supportedTransportTypesCount
{
  return self->_supportedTransportTypes.count;
}

- (int)supportedTransportTypes
{
  return self->_supportedTransportTypes.list;
}

- (void)clearSupportedTransportTypes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;

  PBRepeatedInt32Clear();
}

- (void)addSupportedTransportType:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
}

- (int)supportedTransportTypeAtIndex:(unint64_t)a3
{
  -[GEODirectionsResponse _readSupportedTransportTypes]((uint64_t)self);
  p_supportedTransportTypes = &self->_supportedTransportTypes;
  unint64_t count = self->_supportedTransportTypes.count;
  if (count <= a3)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    unint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_supportedTransportTypes->list[a3];
}

- (void)setSupportedTransportTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;

  MEMORY[0x1F4147390](&self->_supportedTransportTypes, a3, a4);
}

- (id)supportedTransportTypesAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F5818[a3];
  }

  return v3;
}

- (int)StringAsSupportedTransportTypes:(id)a3
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

- (void)_readServiceGaps
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 391) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readServiceGaps_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (NSMutableArray)serviceGaps
{
  -[GEODirectionsResponse _readServiceGaps]((uint64_t)self);
  serviceGaps = self->_serviceGaps;

  return serviceGaps;
}

- (void)setServiceGaps:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
  serviceGaps = self->_serviceGaps;
  self->_serviceGaps = v4;
}

- (void)clearServiceGaps
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
  serviceGaps = self->_serviceGaps;

  [(NSMutableArray *)serviceGaps removeAllObjects];
}

- (void)addServiceGap:(id)a3
{
  id v4 = a3;
  -[GEODirectionsResponse _readServiceGaps]((uint64_t)self);
  -[GEODirectionsResponse _addNoFlagsServiceGap:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
}

- (void)_addNoFlagsServiceGap:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 240);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 240);
      *(void *)(a1 + 240) = v5;

      id v4 = *(void **)(a1 + 240);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)serviceGapsCount
{
  -[GEODirectionsResponse _readServiceGaps]((uint64_t)self);
  serviceGaps = self->_serviceGaps;

  return [(NSMutableArray *)serviceGaps count];
}

- (id)serviceGapAtIndex:(unint64_t)a3
{
  -[GEODirectionsResponse _readServiceGaps]((uint64_t)self);
  serviceGaps = self->_serviceGaps;

  return (id)[(NSMutableArray *)serviceGaps objectAtIndex:a3];
}

+ (Class)serviceGapType
{
  return (Class)objc_opt_class();
}

- (unsigned)selectedRouteIndex
{
  return self->_selectedRouteIndex;
}

- (void)setSelectedRouteIndex:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x100000000010uLL;
  self->_selectedRouteIndex = a3;
}

- (void)setHasSelectedRouteIndex:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (a3) {
    uint64_t v3 = 0x100000000010;
  }
  self->_$BB24C2ED400A1348441C88FA4FCB4848 flags = ($BB24C2ED400A1348441C88FA4FCB4848)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasSelectedRouteIndex
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (void)_readTransitIncidentMessage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 392) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitIncidentMessage_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasTransitIncidentMessage
{
  return self->_transitIncidentMessage != 0;
}

- (GEOPBTransitRoutingIncidentMessage)transitIncidentMessage
{
  -[GEODirectionsResponse _readTransitIncidentMessage]((uint64_t)self);
  transitIncidentMessage = self->_transitIncidentMessage;

  return transitIncidentMessage;
}

- (void)setTransitIncidentMessage:(id)a3
{
  *(void *)&self->_flags |= 0x108000000000uLL;
  objc_storeStrong((id *)&self->_transitIncidentMessage, a3);
}

- (void)_readDisplayHints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 390) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayHints_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasDisplayHints
{
  return self->_displayHints != 0;
}

- (GEORouteDisplayHints)displayHints
{
  -[GEODirectionsResponse _readDisplayHints]((uint64_t)self);
  displayHints = self->_displayHints;

  return displayHints;
}

- (void)setDisplayHints:(id)a3
{
  *(void *)&self->_flags |= 0x100000200000uLL;
  objc_storeStrong((id *)&self->_displayHints, a3);
}

- (void)_readStyleAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 392) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleAttributes_tags_8);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasStyleAttributes
{
  return self->_styleAttributes != 0;
}

- (GEOStyleAttributes)styleAttributes
{
  -[GEODirectionsResponse _readStyleAttributes]((uint64_t)self);
  styleAttributes = self->_styleAttributes;

  return styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  *(void *)&self->_flags |= 0x100400000000uLL;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (void)_readSessionState
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 392) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSessionState_tags_616);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasSessionState
{
  return self->_sessionState != 0;
}

- (NSData)sessionState
{
  -[GEODirectionsResponse _readSessionState]((uint64_t)self);
  sessionState = self->_sessionState;

  return sessionState;
}

- (void)setSessionState:(id)a3
{
  *(void *)&self->_flags |= 0x100100000000uLL;
  objc_storeStrong((id *)&self->_sessionState, a3);
}

- (void)_readFailureAlert
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 390) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFailureAlert_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasFailureAlert
{
  return self->_failureAlert != 0;
}

- (GEOAlert)failureAlert
{
  -[GEODirectionsResponse _readFailureAlert]((uint64_t)self);
  failureAlert = self->_failureAlert;

  return failureAlert;
}

- (void)setFailureAlert:(id)a3
{
  *(void *)&self->_flags |= 0x100000400000uLL;
  objc_storeStrong((id *)&self->_failureAlert, a3);
}

- (int)liveRouteSavingsSeconds
{
  return self->_liveRouteSavingsSeconds;
}

- (void)setLiveRouteSavingsSeconds:(int)a3
{
  *(void *)&self->_flags |= 0x100000000004uLL;
  self->_liveRouteSavingsSeconds = a3;
}

- (void)setHasLiveRouteSavingsSeconds:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (a3) {
    uint64_t v3 = 0x100000000004;
  }
  self->_$BB24C2ED400A1348441C88FA4FCB4848 flags = ($BB24C2ED400A1348441C88FA4FCB4848)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasLiveRouteSavingsSeconds
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readDatasetAbStatus
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 390) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDatasetAbStatus_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasDatasetAbStatus
{
  return self->_datasetAbStatus != 0;
}

- (GEOPDDatasetABStatus)datasetAbStatus
{
  -[GEODirectionsResponse _readDatasetAbStatus]((uint64_t)self);
  datasetAbStatus = self->_datasetAbStatus;

  return datasetAbStatus;
}

- (void)setDatasetAbStatus:(id)a3
{
  *(void *)&self->_flags |= 0x100000020000uLL;
  objc_storeStrong((id *)&self->_datasetAbStatus, a3);
}

- (void)_readTrafficCameras
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 392) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrafficCameras_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (NSMutableArray)trafficCameras
{
  -[GEODirectionsResponse _readTrafficCameras]((uint64_t)self);
  trafficCameras = self->_trafficCameras;

  return trafficCameras;
}

- (void)setTrafficCameras:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
  trafficCameras = self->_trafficCameras;
  self->_trafficCameras = v4;
}

- (void)clearTrafficCameras
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
  trafficCameras = self->_trafficCameras;

  [(NSMutableArray *)trafficCameras removeAllObjects];
}

- (void)addTrafficCamera:(id)a3
{
  id v4 = a3;
  -[GEODirectionsResponse _readTrafficCameras]((uint64_t)self);
  -[GEODirectionsResponse _addNoFlagsTrafficCamera:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
}

- (void)_addNoFlagsTrafficCamera:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 288);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 288);
      *(void *)(a1 + 288) = v5;

      id v4 = *(void **)(a1 + 288);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)trafficCamerasCount
{
  -[GEODirectionsResponse _readTrafficCameras]((uint64_t)self);
  trafficCameras = self->_trafficCameras;

  return [(NSMutableArray *)trafficCameras count];
}

- (id)trafficCameraAtIndex:(unint64_t)a3
{
  -[GEODirectionsResponse _readTrafficCameras]((uint64_t)self);
  trafficCameras = self->_trafficCameras;

  return (id)[(NSMutableArray *)trafficCameras objectAtIndex:a3];
}

+ (Class)trafficCameraType
{
  return (Class)objc_opt_class();
}

- (void)_readNonRecommendedRoutesCache
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 391) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNonRecommendedRoutesCache_tags_618);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasNonRecommendedRoutesCache
{
  return self->_nonRecommendedRoutesCache != 0;
}

- (NSData)nonRecommendedRoutesCache
{
  -[GEODirectionsResponse _readNonRecommendedRoutesCache]((uint64_t)self);
  nonRecommendedRoutesCache = self->_nonRecommendedRoutesCache;

  return nonRecommendedRoutesCache;
}

- (void)setNonRecommendedRoutesCache:(id)a3
{
  *(void *)&self->_flags |= 0x100004000000uLL;
  objc_storeStrong((id *)&self->_nonRecommendedRoutesCache, a3);
}

- (BOOL)isOfflineResponse
{
  return self->_isOfflineResponse;
}

- (void)setIsOfflineResponse:(BOOL)a3
{
  *(void *)&self->_flags |= 0x100000000080uLL;
  self->_isOfflineResponse = a3;
}

- (void)setHasIsOfflineResponse:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (a3) {
    uint64_t v3 = 0x100000000080;
  }
  self->_$BB24C2ED400A1348441C88FA4FCB4848 flags = ($BB24C2ED400A1348441C88FA4FCB4848)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasIsOfflineResponse
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (void)_readSnapScoreMetadataDebug
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 392) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSnapScoreMetadataDebug_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasSnapScoreMetadataDebug
{
  return self->_snapScoreMetadataDebug != 0;
}

- (GEOSnapScoreMetadata)snapScoreMetadataDebug
{
  -[GEODirectionsResponse _readSnapScoreMetadataDebug]((uint64_t)self);
  snapScoreMetadataDebug = self->_snapScoreMetadataDebug;

  return snapScoreMetadataDebug;
}

- (void)setSnapScoreMetadataDebug:(id)a3
{
  *(void *)&self->_flags |= 0x100200000000uLL;
  objc_storeStrong((id *)&self->_snapScoreMetadataDebug, a3);
}

- (BOOL)hasKhSegments
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $BB24C2ED400A1348441C88FA4FCB4848 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(unsigned char *)&flags & 0x20) != 0 && self->_hasKhSegments;
}

- (void)setHasKhSegments:(BOOL)a3
{
  *(void *)&self->_flags |= 0x100000000020uLL;
  self->_hasKhSegments = a3;
}

- (void)setHasHasKhSegments:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (a3) {
    uint64_t v3 = 0x100000000020;
  }
  self->_$BB24C2ED400A1348441C88FA4FCB4848 flags = ($BB24C2ED400A1348441C88FA4FCB4848)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasHasKhSegments
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (void)_readDebugData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 390) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDebugData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasDebugData
{
  return self->_debugData != 0;
}

- (NSString)debugData
{
  -[GEODirectionsResponse _readDebugData]((uint64_t)self);
  debugData = self->_debugData;

  return debugData;
}

- (void)setDebugData:(id)a3
{
  *(void *)&self->_flags |= 0x100000040000uLL;
  objc_storeStrong((id *)&self->_debugData, a3);
}

- (void)_readArrivalParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 389) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArrivalParameters_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (NSMutableArray)arrivalParameters
{
  -[GEODirectionsResponse _readArrivalParameters]((uint64_t)self);
  arrivalParameters = self->_arrivalParameters;

  return arrivalParameters;
}

- (void)setArrivalParameters:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
  arrivalParameters = self->_arrivalParameters;
  self->_arrivalParameters = v4;
}

- (void)clearArrivalParameters
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
  arrivalParameters = self->_arrivalParameters;

  [(NSMutableArray *)arrivalParameters removeAllObjects];
}

- (void)addArrivalParameters:(id)a3
{
  id v4 = a3;
  -[GEODirectionsResponse _readArrivalParameters]((uint64_t)self);
  -[GEODirectionsResponse _addNoFlagsArrivalParameters:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
}

- (void)_addNoFlagsArrivalParameters:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 112);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = v5;

      id v4 = *(void **)(a1 + 112);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)arrivalParametersCount
{
  -[GEODirectionsResponse _readArrivalParameters]((uint64_t)self);
  arrivalParameters = self->_arrivalParameters;

  return [(NSMutableArray *)arrivalParameters count];
}

- (id)arrivalParametersAtIndex:(unint64_t)a3
{
  -[GEODirectionsResponse _readArrivalParameters]((uint64_t)self);
  arrivalParameters = self->_arrivalParameters;

  return (id)[(NSMutableArray *)arrivalParameters objectAtIndex:a3];
}

+ (Class)arrivalParametersType
{
  return (Class)objc_opt_class();
}

- (void)_readTrafficSignals
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 392) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrafficSignals_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (NSMutableArray)trafficSignals
{
  -[GEODirectionsResponse _readTrafficSignals]((uint64_t)self);
  trafficSignals = self->_trafficSignals;

  return trafficSignals;
}

- (void)setTrafficSignals:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
  trafficSignals = self->_trafficSignals;
  self->_trafficSignals = v4;
}

- (void)clearTrafficSignals
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
  trafficSignals = self->_trafficSignals;

  [(NSMutableArray *)trafficSignals removeAllObjects];
}

- (void)addTrafficSignal:(id)a3
{
  id v4 = a3;
  -[GEODirectionsResponse _readTrafficSignals]((uint64_t)self);
  -[GEODirectionsResponse _addNoFlagsTrafficSignal:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
}

- (void)_addNoFlagsTrafficSignal:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 296);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 296);
      *(void *)(a1 + 296) = v5;

      id v4 = *(void **)(a1 + 296);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)trafficSignalsCount
{
  -[GEODirectionsResponse _readTrafficSignals]((uint64_t)self);
  trafficSignals = self->_trafficSignals;

  return [(NSMutableArray *)trafficSignals count];
}

- (id)trafficSignalAtIndex:(unint64_t)a3
{
  -[GEODirectionsResponse _readTrafficSignals]((uint64_t)self);
  trafficSignals = self->_trafficSignals;

  return (id)[(NSMutableArray *)trafficSignals objectAtIndex:a3];
}

+ (Class)trafficSignalType
{
  return (Class)objc_opt_class();
}

- (void)_readTransitRouteUpdateConfiguration
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 393) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitRouteUpdateConfiguration_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasTransitRouteUpdateConfiguration
{
  return self->_transitRouteUpdateConfiguration != 0;
}

- (GEOTransitRouteUpdateConfiguration)transitRouteUpdateConfiguration
{
  -[GEODirectionsResponse _readTransitRouteUpdateConfiguration]((uint64_t)self);
  transitRouteUpdateConfiguration = self->_transitRouteUpdateConfiguration;

  return transitRouteUpdateConfiguration;
}

- (void)setTransitRouteUpdateConfiguration:(id)a3
{
  *(void *)&self->_flags |= 0x120000000000uLL;
  objc_storeStrong((id *)&self->_transitRouteUpdateConfiguration, a3);
}

- (void)_readTransitPaymentMethodSuggestions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 393) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitPaymentMethodSuggestions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (NSMutableArray)transitPaymentMethodSuggestions
{
  -[GEODirectionsResponse _readTransitPaymentMethodSuggestions]((uint64_t)self);
  transitPaymentMethodSuggestions = self->_transitPaymentMethodSuggestions;

  return transitPaymentMethodSuggestions;
}

- (void)setTransitPaymentMethodSuggestions:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
  transitPaymentMethodSuggestions = self->_transitPaymentMethodSuggestions;
  self->_transitPaymentMethodSuggestions = v4;
}

- (void)clearTransitPaymentMethodSuggestions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
  transitPaymentMethodSuggestions = self->_transitPaymentMethodSuggestions;

  [(NSMutableArray *)transitPaymentMethodSuggestions removeAllObjects];
}

- (void)addTransitPaymentMethodSuggestion:(id)a3
{
  id v4 = a3;
  -[GEODirectionsResponse _readTransitPaymentMethodSuggestions]((uint64_t)self);
  -[GEODirectionsResponse _addNoFlagsTransitPaymentMethodSuggestion:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
}

- (void)_addNoFlagsTransitPaymentMethodSuggestion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 320);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 320);
      *(void *)(a1 + 320) = v5;

      id v4 = *(void **)(a1 + 320);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)transitPaymentMethodSuggestionsCount
{
  -[GEODirectionsResponse _readTransitPaymentMethodSuggestions]((uint64_t)self);
  transitPaymentMethodSuggestions = self->_transitPaymentMethodSuggestions;

  return [(NSMutableArray *)transitPaymentMethodSuggestions count];
}

- (id)transitPaymentMethodSuggestionAtIndex:(unint64_t)a3
{
  -[GEODirectionsResponse _readTransitPaymentMethodSuggestions]((uint64_t)self);
  transitPaymentMethodSuggestions = self->_transitPaymentMethodSuggestions;

  return (id)[(NSMutableArray *)transitPaymentMethodSuggestions objectAtIndex:a3];
}

+ (Class)transitPaymentMethodSuggestionType
{
  return (Class)objc_opt_class();
}

- (void)_readAnalyticData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 389) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnalyticData_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasAnalyticData
{
  return self->_analyticData != 0;
}

- (GEODirectionsRequestResponseAnalyticsData)analyticData
{
  -[GEODirectionsResponse _readAnalyticData]((uint64_t)self);
  analyticData = self->_analyticData;

  return analyticData;
}

- (void)setAnalyticData:(id)a3
{
  *(void *)&self->_flags |= 0x100000002000uLL;
  objc_storeStrong((id *)&self->_analyticData, a3);
}

- (void)_readAdvisoriesInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 389) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAdvisoriesInfo_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasAdvisoriesInfo
{
  return self->_advisoriesInfo != 0;
}

- (GEOAdvisoriesInfo)advisoriesInfo
{
  -[GEODirectionsResponse _readAdvisoriesInfo]((uint64_t)self);
  advisoriesInfo = self->_advisoriesInfo;

  return advisoriesInfo;
}

- (void)setAdvisoriesInfo:(id)a3
{
  *(void *)&self->_flags |= 0x100000001000uLL;
  objc_storeStrong((id *)&self->_advisoriesInfo, a3);
}

- (void)_readResponseAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 391) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResponseAttributes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasResponseAttributes
{
  return self->_responseAttributes != 0;
}

- (GEOCommonResponseAttributes)responseAttributes
{
  -[GEODirectionsResponse _readResponseAttributes]((uint64_t)self);
  responseAttributes = self->_responseAttributes;

  return responseAttributes;
}

- (void)setResponseAttributes:(id)a3
{
  *(void *)&self->_flags |= 0x100010000000uLL;
  objc_storeStrong((id *)&self->_responseAttributes, a3);
}

- (void)_readInternalErrors
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 391) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInternalErrors_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (NSMutableArray)internalErrors
{
  -[GEODirectionsResponse _readInternalErrors]((uint64_t)self);
  internalErrors = self->_internalErrors;

  return internalErrors;
}

- (void)setInternalErrors:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
  internalErrors = self->_internalErrors;
  self->_internalErrors = v4;
}

- (void)clearInternalErrors
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
  internalErrors = self->_internalErrors;

  [(NSMutableArray *)internalErrors removeAllObjects];
}

- (void)addInternalError:(id)a3
{
  id v4 = a3;
  -[GEODirectionsResponse _readInternalErrors]((uint64_t)self);
  -[GEODirectionsResponse _addNoFlagsInternalError:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
}

- (void)_addNoFlagsInternalError:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 200);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 200);
      *(void *)(a1 + 200) = v5;

      id v4 = *(void **)(a1 + 200);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)internalErrorsCount
{
  -[GEODirectionsResponse _readInternalErrors]((uint64_t)self);
  internalErrors = self->_internalErrors;

  return [(NSMutableArray *)internalErrors count];
}

- (id)internalErrorAtIndex:(unint64_t)a3
{
  -[GEODirectionsResponse _readInternalErrors]((uint64_t)self);
  internalErrors = self->_internalErrors;

  return (id)[(NSMutableArray *)internalErrors objectAtIndex:a3];
}

+ (Class)internalErrorType
{
  return (Class)objc_opt_class();
}

- (void)_readServiceVersion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 391) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readServiceVersion_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasServiceVersion
{
  return self->_serviceVersion != 0;
}

- (NSString)serviceVersion
{
  -[GEODirectionsResponse _readServiceVersion]((uint64_t)self);
  serviceVersion = self->_serviceVersion;

  return serviceVersion;
}

- (void)setServiceVersion:(id)a3
{
  *(void *)&self->_flags |= 0x100080000000uLL;
  objc_storeStrong((id *)&self->_serviceVersion, a3);
}

- (void)_readDataVersion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 390) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDataVersion_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasDataVersion
{
  return self->_dataVersion != 0;
}

- (NSString)dataVersion
{
  -[GEODirectionsResponse _readDataVersion]((uint64_t)self);
  dataVersion = self->_dataVersion;

  return dataVersion;
}

- (void)setDataVersion:(id)a3
{
  *(void *)&self->_flags |= 0x100000010000uLL;
  objc_storeStrong((id *)&self->_dataVersion, a3);
}

- (void)_readSuggestedRoutes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 392) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSuggestedRoutes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (NSMutableArray)suggestedRoutes
{
  -[GEODirectionsResponse _readSuggestedRoutes]((uint64_t)self);
  suggestedRoutes = self->_suggestedRoutes;

  return suggestedRoutes;
}

- (void)setSuggestedRoutes:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
  suggestedRoutes = self->_suggestedRoutes;
  self->_suggestedRoutes = v4;
}

- (void)clearSuggestedRoutes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
  suggestedRoutes = self->_suggestedRoutes;

  [(NSMutableArray *)suggestedRoutes removeAllObjects];
}

- (void)addSuggestedRoute:(id)a3
{
  id v4 = a3;
  -[GEODirectionsResponse _readSuggestedRoutes]((uint64_t)self);
  -[GEODirectionsResponse _addNoFlagsSuggestedRoute:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000000uLL;
}

- (void)_addNoFlagsSuggestedRoute:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 280);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 280);
      *(void *)(a1 + 280) = v5;

      id v4 = *(void **)(a1 + 280);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)suggestedRoutesCount
{
  -[GEODirectionsResponse _readSuggestedRoutes]((uint64_t)self);
  suggestedRoutes = self->_suggestedRoutes;

  return [(NSMutableArray *)suggestedRoutes count];
}

- (id)suggestedRouteAtIndex:(unint64_t)a3
{
  -[GEODirectionsResponse _readSuggestedRoutes]((uint64_t)self);
  suggestedRoutes = self->_suggestedRoutes;

  return (id)[(NSMutableArray *)suggestedRoutes objectAtIndex:a3];
}

+ (Class)suggestedRouteType
{
  return (Class)objc_opt_class();
}

- (GEOTimepoint)timepointUsed
{
  *retstr = self[3];
  return self;
}

- (void)setTimepointUsed:(GEOTimepoint *)a3
{
  *(void *)&self->_flags |= 0x100000000001uLL;
  uint64_t v3 = *(void *)&a3->_type;
  *(_OWORD *)&self->_timepointUsed._currentUserTime = *(_OWORD *)&a3->_currentUserTime;
  *(void *)&self->_timepointUsed._type = v3;
}

- (void)setHasTimepointUsed:(BOOL)a3
{
  self->_$BB24C2ED400A1348441C88FA4FCB4848 flags = ($BB24C2ED400A1348441C88FA4FCB4848)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x100000000000);
}

- (BOOL)hasTimepointUsed
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readDecoderData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 390) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDecoderData_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasDecoderData
{
  return self->_decoderData != 0;
}

- (GEOTransitDecoderData)decoderData
{
  -[GEODirectionsResponse _readDecoderData]((uint64_t)self);
  decoderData = self->_decoderData;

  return decoderData;
}

- (void)setDecoderData:(id)a3
{
  *(void *)&self->_flags |= 0x100000080000uLL;
  objc_storeStrong((id *)&self->_decoderData, a3);
}

- (void)_readTransitDataVersion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 392) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitDataVersion_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasTransitDataVersion
{
  return self->_transitDataVersion != 0;
}

- (NSString)transitDataVersion
{
  -[GEODirectionsResponse _readTransitDataVersion]((uint64_t)self);
  transitDataVersion = self->_transitDataVersion;

  return transitDataVersion;
}

- (void)setTransitDataVersion:(id)a3
{
  *(void *)&self->_flags |= 0x104000000000uLL;
  objc_storeStrong((id *)&self->_transitDataVersion, a3);
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEODirectionsResponse;
  id v4 = [(GEODirectionsResponse *)&v8 description];
  id v5 = [(GEODirectionsResponse *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEODirectionsResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v276 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v217 = 0;
    goto LABEL_331;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  int v5 = *(_DWORD *)(a1 + 380);
  if (v5 <= 29)
  {
    unint64_t v6 = @"STATUS_SUCCESS";
    switch(v5)
    {
      case 0:
        goto LABEL_19;
      case 1:
        unint64_t v6 = @"STATUS_FAILED";
        break;
      case 2:
        unint64_t v6 = @"STATUS_INCOMPLETE";
        break;
      case 3:
      case 4:
        goto LABEL_14;
      case 5:
        unint64_t v6 = @"INVALID_REQUEST";
        break;
      default:
        if (v5 != 20) {
          goto LABEL_14;
        }
        unint64_t v6 = @"FAILED_NO_RESULT";
        break;
    }
    goto LABEL_19;
  }
  if (v5 > 49)
  {
    if (v5 == 50)
    {
      unint64_t v6 = @"STATUS_DEDUPED";
      goto LABEL_19;
    }
    if (v5 == 60)
    {
      unint64_t v6 = @"VERSION_MISMATCH";
      goto LABEL_19;
    }
LABEL_14:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 380));
    unint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (v5 == 30)
  {
    unint64_t v6 = @"NEEDS_REFINEMENT";
    goto LABEL_19;
  }
  if (v5 != 40) {
    goto LABEL_14;
  }
  unint64_t v6 = @"FAILED_NOT_AUTHORIZED";
LABEL_19:
  [v4 setObject:v6 forKey:@"status"];

  if ([*(id *)(a1 + 232) count])
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 232), "count"));
    long long v261 = 0u;
    long long v262 = 0u;
    long long v263 = 0u;
    long long v264 = 0u;
    id v8 = *(id *)(a1 + 232);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v261 objects:v275 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v262;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v262 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v261 + 1) + 8 * i);
          if (a2) {
            [v13 jsonRepresentation];
          }
          else {
          id v14 = [v13 dictionaryRepresentation];
          }

          [v7 addObject:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v261 objects:v275 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"route"];
  }
  if ([*(id *)(a1 + 344) count])
  {
    long long v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 344), "count"));
    long long v257 = 0u;
    long long v258 = 0u;
    long long v259 = 0u;
    long long v260 = 0u;
    id v16 = *(id *)(a1 + 344);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v257 objects:v274 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v258;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v258 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v257 + 1) + 8 * j);
          if (a2) {
            [v21 jsonRepresentation];
          }
          else {
          id v22 = [v21 dictionaryRepresentation];
          }

          [v15 addObject:v22];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v257 objects:v274 count:16];
      }
      while (v18);
    }

    if (a2) {
      v23 = @"waypointRoute";
    }
    else {
      v23 = @"waypoint_route";
    }
    [v4 setObject:v15 forKey:v23];
  }
  if ([*(id *)(a1 + 216) count])
  {
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 216), "count"));
    long long v253 = 0u;
    long long v254 = 0u;
    long long v255 = 0u;
    long long v256 = 0u;
    id v25 = *(id *)(a1 + 216);
    uint64_t v26 = [v25 countByEnumeratingWithState:&v253 objects:v273 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v254;
      do
      {
        for (uint64_t k = 0; k != v27; ++k)
        {
          if (*(void *)v254 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v253 + 1) + 8 * k);
          if (a2) {
            [v30 jsonRepresentation];
          }
          else {
          id v31 = [v30 dictionaryRepresentation];
          }

          [v24 addObject:v31];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v253 objects:v273 count:16];
      }
      while (v27);
    }

    [v4 setObject:v24 forKey:@"placeSearchResponse"];
  }
  uint64_t v32 = *(void *)(a1 + 388);
  if ((v32 & 8) != 0)
  {
    uint64_t v33 = *(int *)(a1 + 372);
    if (v33 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 372));
      long long v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v34 = off_1E53F57C0[v33];
    }
    [v4 setObject:v34 forKey:@"localDistanceUnits"];

    uint64_t v32 = *(void *)(a1 + 388);
  }
  if ((v32 & 0x100) != 0)
  {
    v35 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 387)];
    [v4 setObject:v35 forKey:@"routeDeviatesFromOriginal"];
  }
  v36 = [(id)a1 directionsResponseID];
  v37 = v36;
  if (v36)
  {
    if (a2)
    {
      __int16 v38 = [v36 base64EncodedStringWithOptions:0];
      [v4 setObject:v38 forKey:@"directionsResponseID"];
    }
    else
    {
      [v4 setObject:v36 forKey:@"directionsResponseID"];
    }
  }

  v39 = [(id)a1 tripId];
  __int16 v40 = v39;
  if (v39)
  {
    if (a2)
    {
      unint64_t v41 = [v39 jsonRepresentation];
      uint64_t v42 = @"tripId";
    }
    else
    {
      unint64_t v41 = [v39 dictionaryRepresentation];
      uint64_t v42 = @"trip_id";
    }
    id v43 = v41;

    [v4 setObject:v43 forKey:v42];
  }

  uint64_t v44 = *(void *)(a1 + 388);
  if ((v44 & 0x40) != 0)
  {
    v45 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 385)];
    [v4 setObject:v45 forKey:@"isNavigable"];

    uint64_t v44 = *(void *)(a1 + 388);
  }
  if ((v44 & 2) != 0)
  {
    uint64_t v46 = *(int *)(a1 + 364);
    if (v46 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 364));
      v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v47 = off_1E53F57D8[v46];
    }
    [v4 setObject:v47 forKey:@"instructionSignFillColor"];
  }
  if ([*(id *)(a1 + 192) count])
  {
    v48 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 192), "count"));
    long long v249 = 0u;
    long long v250 = 0u;
    long long v251 = 0u;
    long long v252 = 0u;
    id v49 = *(id *)(a1 + 192);
    uint64_t v50 = [v49 countByEnumeratingWithState:&v249 objects:v272 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v250;
      do
      {
        for (uint64_t m = 0; m != v51; ++m)
        {
          if (*(void *)v250 != v52) {
            objc_enumerationMutation(v49);
          }
          v54 = *(void **)(*((void *)&v249 + 1) + 8 * m);
          if (a2) {
            [v54 jsonRepresentation];
          }
          else {
          id v55 = [v54 dictionaryRepresentation];
          }

          [v48 addObject:v55];
        }
        uint64_t v51 = [v49 countByEnumeratingWithState:&v249 objects:v272 count:16];
      }
      while (v51);
    }

    [v4 setObject:v48 forKey:@"incidentsOnRoutes"];
  }
  if ([*(id *)(a1 + 184) count])
  {
    v56 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 184), "count"));
    long long v245 = 0u;
    long long v246 = 0u;
    long long v247 = 0u;
    long long v248 = 0u;
    id v57 = *(id *)(a1 + 184);
    uint64_t v58 = [v57 countByEnumeratingWithState:&v245 objects:v271 count:16];
    if (v58)
    {
      uint64_t v59 = v58;
      uint64_t v60 = *(void *)v246;
      do
      {
        for (uint64_t n = 0; n != v59; ++n)
        {
          if (*(void *)v246 != v60) {
            objc_enumerationMutation(v57);
          }
          v62 = *(void **)(*((void *)&v245 + 1) + 8 * n);
          if (a2) {
            [v62 jsonRepresentation];
          }
          else {
          id v63 = [v62 dictionaryRepresentation];
          }

          [v56 addObject:v63];
        }
        uint64_t v59 = [v57 countByEnumeratingWithState:&v245 objects:v271 count:16];
      }
      while (v59);
    }

    [v4 setObject:v56 forKey:@"incidentsOffRoutes"];
  }
  if (*(void *)(a1 + 32))
  {
    v64 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 32)];
    if (*(void *)(a1 + 32))
    {
      uint64_t v65 = 0;
      unint64_t v66 = 0;
      do
      {
        _GEOProblemDetailDictionaryRepresentation((unsigned int *)(*(void *)(a1 + 24) + v65));
        id v67 = (id)objc_claimAutoreleasedReturnValue();

        [v64 addObject:v67];
        ++v66;
        v65 += 12;
      }
      while (v66 < *(void *)(a1 + 32));
    }
    [v4 setObject:v64 forKey:@"problemDetail"];
  }
  if (*(void *)(a1 + 56))
  {
    v68 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v69 = (void *)(a1 + 48);
    if (*(void *)(a1 + 56))
    {
      unint64_t v70 = 0;
      do
      {
        uint64_t v71 = *(int *)(*v69 + 4 * v70);
        if (v71 >= 7)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v71);
          v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v72 = off_1E53F5818[v71];
        }
        [v68 addObject:v72];

        ++v70;
        v69 = (void *)(a1 + 48);
      }
      while (v70 < *(void *)(a1 + 56));
    }
    [v4 setObject:v68 forKey:@"supportedTransportType"];
  }
  if ([*(id *)(a1 + 240) count])
  {
    v73 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 240), "count"));
    long long v241 = 0u;
    long long v242 = 0u;
    long long v243 = 0u;
    long long v244 = 0u;
    id v74 = *(id *)(a1 + 240);
    uint64_t v75 = [v74 countByEnumeratingWithState:&v241 objects:v270 count:16];
    if (v75)
    {
      uint64_t v76 = v75;
      uint64_t v77 = *(void *)v242;
      do
      {
        for (iuint64_t i = 0; ii != v76; ++ii)
        {
          if (*(void *)v242 != v77) {
            objc_enumerationMutation(v74);
          }
          v79 = *(void **)(*((void *)&v241 + 1) + 8 * ii);
          if (a2) {
            [v79 jsonRepresentation];
          }
          else {
          id v80 = [v79 dictionaryRepresentation];
          }

          [v73 addObject:v80];
        }
        uint64_t v76 = [v74 countByEnumeratingWithState:&v241 objects:v270 count:16];
      }
      while (v76);
    }

    if (a2) {
      v81 = @"serviceGap";
    }
    else {
      v81 = @"service_gap";
    }
    [v4 setObject:v73 forKey:v81];
  }
  if ((*(unsigned char *)(a1 + 388) & 0x10) != 0)
  {
    v82 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 376)];
    if (a2) {
      v83 = @"selectedRouteIndex";
    }
    else {
      v83 = @"selected_route_index";
    }
    [v4 setObject:v82 forKey:v83];
  }
  v84 = [(id)a1 transitIncidentMessage];
  v85 = v84;
  if (v84)
  {
    if (a2)
    {
      v86 = [v84 jsonRepresentation];
      v87 = @"transitIncidentMessage";
    }
    else
    {
      v86 = [v84 dictionaryRepresentation];
      v87 = @"transit_incident_message";
    }
    id v88 = v86;

    [v4 setObject:v88 forKey:v87];
  }

  v89 = [(id)a1 displayHints];
  v90 = v89;
  if (v89)
  {
    if (a2)
    {
      v91 = [v89 jsonRepresentation];
      v92 = @"displayHints";
    }
    else
    {
      v91 = [v89 dictionaryRepresentation];
      v92 = @"display_hints";
    }
    id v93 = v91;

    [v4 setObject:v93 forKey:v92];
  }

  v94 = [(id)a1 styleAttributes];
  v95 = v94;
  if (v94)
  {
    if (a2)
    {
      v96 = [v94 jsonRepresentation];
      v97 = @"styleAttributes";
    }
    else
    {
      v96 = [v94 dictionaryRepresentation];
      v97 = @"style_attributes";
    }
    id v98 = v96;

    [v4 setObject:v98 forKey:v97];
  }

  v99 = [(id)a1 sessionState];
  v100 = v99;
  if (v99)
  {
    if (a2)
    {
      v101 = [v99 base64EncodedStringWithOptions:0];
      [v4 setObject:v101 forKey:@"sessionState"];
    }
    else
    {
      [v4 setObject:v99 forKey:@"session_state"];
    }
  }

  v102 = [(id)a1 failureAlert];
  v103 = v102;
  if (v102)
  {
    if (a2)
    {
      v104 = [v102 jsonRepresentation];
      v105 = @"failureAlert";
    }
    else
    {
      v104 = [v102 dictionaryRepresentation];
      v105 = @"failure_alert";
    }
    id v106 = v104;

    [v4 setObject:v106 forKey:v105];
  }

  if ((*(unsigned char *)(a1 + 388) & 4) != 0)
  {
    v107 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 368)];
    if (a2) {
      v108 = @"liveRouteSavingsSeconds";
    }
    else {
      v108 = @"live_route_savings_seconds";
    }
    [v4 setObject:v107 forKey:v108];
  }
  v109 = [(id)a1 datasetAbStatus];
  v110 = v109;
  if (v109)
  {
    if (a2)
    {
      v111 = [v109 jsonRepresentation];
      v112 = @"datasetAbStatus";
    }
    else
    {
      v111 = [v109 dictionaryRepresentation];
      v112 = @"dataset_ab_status";
    }
    id v113 = v111;

    [v4 setObject:v113 forKey:v112];
  }

  if ([*(id *)(a1 + 288) count])
  {
    v114 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 288), "count"));
    long long v237 = 0u;
    long long v238 = 0u;
    long long v239 = 0u;
    long long v240 = 0u;
    id v115 = *(id *)(a1 + 288);
    uint64_t v116 = [v115 countByEnumeratingWithState:&v237 objects:v269 count:16];
    if (v116)
    {
      uint64_t v117 = v116;
      uint64_t v118 = *(void *)v238;
      do
      {
        for (juint64_t j = 0; jj != v117; ++jj)
        {
          if (*(void *)v238 != v118) {
            objc_enumerationMutation(v115);
          }
          v120 = *(void **)(*((void *)&v237 + 1) + 8 * jj);
          if (a2) {
            [v120 jsonRepresentation];
          }
          else {
          id v121 = [v120 dictionaryRepresentation];
          }

          [v114 addObject:v121];
        }
        uint64_t v117 = [v115 countByEnumeratingWithState:&v237 objects:v269 count:16];
      }
      while (v117);
    }

    if (a2) {
      v122 = @"trafficCamera";
    }
    else {
      v122 = @"traffic_camera";
    }
    [v4 setObject:v114 forKey:v122];
  }
  v123 = [(id)a1 nonRecommendedRoutesCache];
  v124 = v123;
  if (v123)
  {
    if (a2)
    {
      v125 = [v123 base64EncodedStringWithOptions:0];
      [v4 setObject:v125 forKey:@"nonRecommendedRoutesCache"];
    }
    else
    {
      [v4 setObject:v123 forKey:@"non_recommended_routes_cache"];
    }
  }

  if ((*(unsigned char *)(a1 + 388) & 0x80) != 0)
  {
    v126 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 386)];
    if (a2) {
      v127 = @"isOfflineResponse";
    }
    else {
      v127 = @"is_offline_response";
    }
    [v4 setObject:v126 forKey:v127];
  }
  v128 = [(id)a1 snapScoreMetadataDebug];
  v129 = v128;
  if (v128)
  {
    if (a2)
    {
      v130 = [v128 jsonRepresentation];
      v131 = @"snapScoreMetadataDebug";
    }
    else
    {
      v130 = [v128 dictionaryRepresentation];
      v131 = @"snap_score_metadata_debug";
    }
    id v132 = v130;

    [v4 setObject:v132 forKey:v131];
  }

  if ((*(unsigned char *)(a1 + 388) & 0x20) != 0)
  {
    v133 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 384)];
    if (a2) {
      v134 = @"hasKhSegments";
    }
    else {
      v134 = @"has_kh_segments";
    }
    [v4 setObject:v133 forKey:v134];
  }
  v135 = [(id)a1 debugData];
  if (v135)
  {
    if (a2) {
      v136 = @"debugData";
    }
    else {
      v136 = @"debug_data";
    }
    [v4 setObject:v135 forKey:v136];
  }

  if ([*(id *)(a1 + 112) count])
  {
    v137 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 112), "count"));
    long long v233 = 0u;
    long long v234 = 0u;
    long long v235 = 0u;
    long long v236 = 0u;
    id v138 = *(id *)(a1 + 112);
    uint64_t v139 = [v138 countByEnumeratingWithState:&v233 objects:v268 count:16];
    if (v139)
    {
      uint64_t v140 = v139;
      uint64_t v141 = *(void *)v234;
      do
      {
        for (kuint64_t k = 0; kk != v140; ++kk)
        {
          if (*(void *)v234 != v141) {
            objc_enumerationMutation(v138);
          }
          v143 = *(void **)(*((void *)&v233 + 1) + 8 * kk);
          if (a2) {
            [v143 jsonRepresentation];
          }
          else {
          id v144 = [v143 dictionaryRepresentation];
          }

          [v137 addObject:v144];
        }
        uint64_t v140 = [v138 countByEnumeratingWithState:&v233 objects:v268 count:16];
      }
      while (v140);
    }

    if (a2) {
      v145 = @"arrivalParameters";
    }
    else {
      v145 = @"arrival_parameters";
    }
    [v4 setObject:v137 forKey:v145];
  }
  if ([*(id *)(a1 + 296) count])
  {
    v146 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 296), "count"));
    long long v229 = 0u;
    long long v230 = 0u;
    long long v231 = 0u;
    long long v232 = 0u;
    id v147 = *(id *)(a1 + 296);
    uint64_t v148 = [v147 countByEnumeratingWithState:&v229 objects:v267 count:16];
    if (v148)
    {
      uint64_t v149 = v148;
      uint64_t v150 = *(void *)v230;
      do
      {
        for (muint64_t m = 0; mm != v149; ++mm)
        {
          if (*(void *)v230 != v150) {
            objc_enumerationMutation(v147);
          }
          v152 = *(void **)(*((void *)&v229 + 1) + 8 * mm);
          if (a2) {
            [v152 jsonRepresentation];
          }
          else {
          id v153 = [v152 dictionaryRepresentation];
          }

          [v146 addObject:v153];
        }
        uint64_t v149 = [v147 countByEnumeratingWithState:&v229 objects:v267 count:16];
      }
      while (v149);
    }

    if (a2) {
      v154 = @"trafficSignal";
    }
    else {
      v154 = @"traffic_signal";
    }
    [v4 setObject:v146 forKey:v154];
  }
  v155 = [(id)a1 transitRouteUpdateConfiguration];
  v156 = v155;
  if (v155)
  {
    if (a2)
    {
      v157 = [v155 jsonRepresentation];
      v158 = @"transitRouteUpdateConfiguration";
    }
    else
    {
      v157 = [v155 dictionaryRepresentation];
      v158 = @"transit_route_update_configuration";
    }
    id v159 = v157;

    [v4 setObject:v159 forKey:v158];
  }

  if ([*(id *)(a1 + 320) count])
  {
    v160 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 320), "count"));
    long long v225 = 0u;
    long long v226 = 0u;
    long long v227 = 0u;
    long long v228 = 0u;
    id v161 = *(id *)(a1 + 320);
    uint64_t v162 = [v161 countByEnumeratingWithState:&v225 objects:v266 count:16];
    if (v162)
    {
      uint64_t v163 = v162;
      uint64_t v164 = *(void *)v226;
      do
      {
        for (nuint64_t n = 0; nn != v163; ++nn)
        {
          if (*(void *)v226 != v164) {
            objc_enumerationMutation(v161);
          }
          v166 = *(void **)(*((void *)&v225 + 1) + 8 * nn);
          if (a2) {
            [v166 jsonRepresentation];
          }
          else {
          id v167 = [v166 dictionaryRepresentation];
          }

          [v160 addObject:v167];
        }
        uint64_t v163 = [v161 countByEnumeratingWithState:&v225 objects:v266 count:16];
      }
      while (v163);
    }

    if (a2) {
      v168 = @"transitPaymentMethodSuggestion";
    }
    else {
      v168 = @"transit_payment_method_suggestion";
    }
    [v4 setObject:v160 forKey:v168];
  }
  v169 = [(id)a1 analyticData];
  v170 = v169;
  if (v169)
  {
    if (a2)
    {
      v171 = [v169 jsonRepresentation];
      v172 = @"analyticData";
    }
    else
    {
      v171 = [v169 dictionaryRepresentation];
      v172 = @"analytic_data";
    }
    id v173 = v171;

    [v4 setObject:v173 forKey:v172];
  }

  v174 = [(id)a1 advisoriesInfo];
  v175 = v174;
  if (v174)
  {
    if (a2)
    {
      v176 = [v174 jsonRepresentation];
      v177 = @"advisoriesInfo";
    }
    else
    {
      v176 = [v174 dictionaryRepresentation];
      v177 = @"advisories_info";
    }
    id v178 = v176;

    [v4 setObject:v178 forKey:v177];
  }

  v179 = [(id)a1 responseAttributes];
  v180 = v179;
  if (v179)
  {
    if (a2)
    {
      v181 = [v179 jsonRepresentation];
      v182 = @"responseAttributes";
    }
    else
    {
      v181 = [v179 dictionaryRepresentation];
      v182 = @"response_attributes";
    }
    id v183 = v181;

    [v4 setObject:v183 forKey:v182];
  }

  if (*(void *)(a1 + 200))
  {
    v184 = [(id)a1 internalErrors];
    if (a2) {
      v185 = @"internalError";
    }
    else {
      v185 = @"internal_error";
    }
    [v4 setObject:v184 forKey:v185];
  }
  v186 = [(id)a1 serviceVersion];
  if (v186)
  {
    if (a2) {
      v187 = @"serviceVersion";
    }
    else {
      v187 = @"service_version";
    }
    [v4 setObject:v186 forKey:v187];
  }

  v188 = [(id)a1 dataVersion];
  if (v188)
  {
    if (a2) {
      v189 = @"dataVersion";
    }
    else {
      v189 = @"data_version";
    }
    [v4 setObject:v188 forKey:v189];
  }

  if ([*(id *)(a1 + 280) count])
  {
    v190 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 280), "count"));
    long long v221 = 0u;
    long long v222 = 0u;
    long long v223 = 0u;
    long long v224 = 0u;
    id v191 = *(id *)(a1 + 280);
    uint64_t v192 = [v191 countByEnumeratingWithState:&v221 objects:v265 count:16];
    if (v192)
    {
      uint64_t v193 = v192;
      uint64_t v194 = *(void *)v222;
      do
      {
        for (uint64_t i1 = 0; i1 != v193; ++i1)
        {
          if (*(void *)v222 != v194) {
            objc_enumerationMutation(v191);
          }
          v196 = *(void **)(*((void *)&v221 + 1) + 8 * i1);
          if (a2) {
            [v196 jsonRepresentation];
          }
          else {
          id v197 = [v196 dictionaryRepresentation];
          }

          [v190 addObject:v197];
        }
        uint64_t v193 = [v191 countByEnumeratingWithState:&v221 objects:v265 count:16];
      }
      while (v193);
    }

    if (a2) {
      v198 = @"suggestedRoute";
    }
    else {
      v198 = @"suggested_route";
    }
    [v4 setObject:v190 forKey:v198];
  }
  if (*(unsigned char *)(a1 + 388))
  {
    if (a2) {
      v199 = @"timepointUsed";
    }
    else {
      v199 = @"timepoint_used";
    }
    _GEOTimepointDictionaryRepresentation(a1 + 72, a2);
    id v200 = (id)objc_claimAutoreleasedReturnValue();

    [v4 setObject:v200 forKey:v199];
  }
  v201 = [(id)a1 decoderData];
  v202 = v201;
  if (v201)
  {
    if (a2)
    {
      v203 = [v201 jsonRepresentation];
      v204 = @"decoderData";
    }
    else
    {
      v203 = [v201 dictionaryRepresentation];
      v204 = @"decoder_data";
    }
    id v205 = v203;

    [v4 setObject:v205 forKey:v204];
  }

  v206 = [(id)a1 transitDataVersion];
  if (v206)
  {
    if (a2) {
      v207 = @"transitDataVersion";
    }
    else {
      v207 = @"transit_data_version";
    }
    [v4 setObject:v206 forKey:v207];
  }

  v208 = [(id)a1 clientMetrics];
  v209 = v208;
  if (v208)
  {
    if (a2) {
      [v208 jsonRepresentation];
    }
    else {
    id v210 = [v208 dictionaryRepresentation];
    }

    [v4 setObject:v210 forKey:@"clientMetrics"];
  }

  v211 = *(void **)(a1 + 16);
  if (v211)
  {
    v212 = [v211 dictionaryRepresentation];
    v213 = v212;
    if (a2)
    {
      v214 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v212, "count"));
      v219[0] = MEMORY[0x1E4F143A8];
      v219[1] = 3221225472;
      v219[2] = __51__GEODirectionsResponse__dictionaryRepresentation___block_invoke;
      v219[3] = &unk_1E53D8860;
      id v215 = v214;
      id v220 = v215;
      [v213 enumerateKeysAndObjectsUsingBlock:v219];
      id v216 = v215;

      v213 = v216;
    }
    [v4 setObject:v213 forKey:@"Unknown Fields"];
  }
  id v217 = v4;

LABEL_331:

  return v217;
}

- (id)jsonRepresentation
{
  return -[GEODirectionsResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEODirectionsResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEODirectionsResponse)initWithDictionary:(id)a3
{
  return (GEODirectionsResponse *)-[GEODirectionsResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v328 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_450;
  }
  id v6 = (id)[a1 init];

  if (!v6)
  {
    a1 = 0;
    goto LABEL_450;
  }
  id v7 = [v5 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"STATUS_SUCCESS"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"STATUS_FAILED"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"STATUS_INCOMPLETE"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"INVALID_REQUEST"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"FAILED_NO_RESULT"])
    {
      uint64_t v9 = 20;
    }
    else if ([v8 isEqualToString:@"NEEDS_REFINEMENT"])
    {
      uint64_t v9 = 30;
    }
    else if ([v8 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
    {
      uint64_t v9 = 40;
    }
    else if ([v8 isEqualToString:@"STATUS_DEDUPED"])
    {
      uint64_t v9 = 50;
    }
    else if ([v8 isEqualToString:@"VERSION_MISMATCH"])
    {
      uint64_t v9 = 60;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_28;
    }
    uint64_t v9 = [v7 intValue];
  }
  [v6 setStatus:v9];
LABEL_28:

  id v10 = [v5 objectForKeyedSubscript:@"route"];
  unint64_t v11 = 0x1E4F1C000uLL;
  objc_opt_class();
  id v253 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v312 = 0u;
    long long v313 = 0u;
    long long v310 = 0u;
    long long v311 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v310 objects:v327 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v311;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v311 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v310 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v18 = [GEORoute alloc];
            if (a3) {
              uint64_t v19 = [(GEORoute *)v18 initWithJSON:v17];
            }
            else {
              uint64_t v19 = [(GEORoute *)v18 initWithDictionary:v17];
            }
            uint64_t v20 = (void *)v19;
            [v6 addRoute:v19];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v310 objects:v327 count:16];
      }
      while (v14);
    }

    id v5 = v253;
    unint64_t v11 = 0x1E4F1C000uLL;
  }

  if (a3) {
    v21 = @"waypointRoute";
  }
  else {
    v21 = @"waypoint_route";
  }
  id v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v308 = 0u;
    long long v309 = 0u;
    long long v306 = 0u;
    long long v307 = 0u;
    id v23 = v22;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v306 objects:v326 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v307;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v307 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v306 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v29 = [GEOWaypointRoute alloc];
            if (a3) {
              uint64_t v30 = [(GEOWaypointRoute *)v29 initWithJSON:v28];
            }
            else {
              uint64_t v30 = [(GEOWaypointRoute *)v29 initWithDictionary:v28];
            }
            id v31 = (void *)v30;
            [v6 addWaypointRoute:v30];
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v306 objects:v326 count:16];
      }
      while (v25);
    }

    id v5 = v253;
    unint64_t v11 = 0x1E4F1C000uLL;
  }

  uint64_t v32 = [v5 objectForKeyedSubscript:@"placeSearchResponse"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v304 = 0u;
    long long v305 = 0u;
    long long v302 = 0u;
    long long v303 = 0u;
    id v33 = v32;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v302 objects:v325 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v303;
      do
      {
        for (uint64_t k = 0; k != v35; ++k)
        {
          if (*(void *)v303 != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v38 = *(void *)(*((void *)&v302 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v39 = [GEOPlaceSearchResponse alloc];
            if (a3) {
              uint64_t v40 = [(GEOPlaceSearchResponse *)v39 initWithJSON:v38];
            }
            else {
              uint64_t v40 = [(GEOPlaceSearchResponse *)v39 initWithDictionary:v38];
            }
            unint64_t v41 = (void *)v40;
            [v6 addPlaceSearchResponse:v40];
          }
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v302 objects:v325 count:16];
      }
      while (v35);
    }

    id v5 = v253;
    unint64_t v11 = 0x1E4F1C000uLL;
  }

  uint64_t v42 = [v5 objectForKeyedSubscript:@"localDistanceUnits"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v43 = v42;
    if ([v43 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v44 = 0;
    }
    else if ([v43 isEqualToString:@"METRIC"])
    {
      uint64_t v44 = 1;
    }
    else if ([v43 isEqualToString:@"IMPERIAL"])
    {
      uint64_t v44 = 2;
    }
    else
    {
      uint64_t v44 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_85;
    }
    uint64_t v44 = [v42 intValue];
  }
  [v6 setLocalDistanceUnits:v44];
LABEL_85:

  v45 = [v5 objectForKeyedSubscript:@"routeDeviatesFromOriginal"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setRouteDeviatesFromOriginal:", objc_msgSend(v45, "BOOLValue"));
  }

  uint64_t v46 = [v5 objectForKeyedSubscript:@"directionsResponseID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v47 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v46 options:0];
    [v6 setDirectionsResponseID:v47];
  }
  if (a3) {
    v48 = @"tripId";
  }
  else {
    v48 = @"trip_id";
  }
  id v49 = [v5 objectForKeyedSubscript:v48];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v50 = [GEOUUID alloc];
    if (v50) {
      uint64_t v51 = (void *)-[GEOUUID _initWithDictionary:isJSON:]((uint64_t)v50, v49);
    }
    else {
      uint64_t v51 = 0;
    }
    [v6 setTripId:v51];
  }
  uint64_t v52 = [v5 objectForKeyedSubscript:@"isNavigable"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIsNavigable:", objc_msgSend(v52, "BOOLValue"));
  }

  v53 = [v5 objectForKeyedSubscript:@"instructionSignFillColor"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v54 = v53;
    if ([v54 isEqualToString:@"BLACK"])
    {
      uint64_t v55 = 0;
    }
    else if ([v54 isEqualToString:@"RED"])
    {
      uint64_t v55 = 1;
    }
    else if ([v54 isEqualToString:@"GREEN"])
    {
      uint64_t v55 = 2;
    }
    else if ([v54 isEqualToString:@"YELLOW"])
    {
      uint64_t v55 = 3;
    }
    else if ([v54 isEqualToString:@"BLUE"])
    {
      uint64_t v55 = 4;
    }
    else if ([v54 isEqualToString:@"PURPLE"])
    {
      uint64_t v55 = 5;
    }
    else if ([v54 isEqualToString:@"CYAN"])
    {
      uint64_t v55 = 6;
    }
    else if ([v54 isEqualToString:@"WHITE"])
    {
      uint64_t v55 = 7;
    }
    else
    {
      uint64_t v55 = 0;
    }

    goto LABEL_119;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v55 = [v53 intValue];
LABEL_119:
    [v6 setInstructionSignFillColor:v55];
  }

  v56 = [v5 objectForKeyedSubscript:@"incidentsOnRoutes"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v300 = 0u;
    long long v301 = 0u;
    long long v298 = 0u;
    long long v299 = 0u;
    id v57 = v56;
    uint64_t v58 = [v57 countByEnumeratingWithState:&v298 objects:v324 count:16];
    if (v58)
    {
      uint64_t v59 = v58;
      uint64_t v60 = *(void *)v299;
      do
      {
        for (uint64_t m = 0; m != v59; ++m)
        {
          if (*(void *)v299 != v60) {
            objc_enumerationMutation(v57);
          }
          uint64_t v62 = *(void *)(*((void *)&v298 + 1) + 8 * m);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v63 = [GEORouteIncident alloc];
            if (a3) {
              uint64_t v64 = [(GEORouteIncident *)v63 initWithJSON:v62];
            }
            else {
              uint64_t v64 = [(GEORouteIncident *)v63 initWithDictionary:v62];
            }
            uint64_t v65 = (void *)v64;
            [v6 addIncidentsOnRoutes:v64];
          }
        }
        uint64_t v59 = [v57 countByEnumeratingWithState:&v298 objects:v324 count:16];
      }
      while (v59);
    }

    id v5 = v253;
    unint64_t v11 = 0x1E4F1C000uLL;
  }

  unint64_t v66 = [v5 objectForKeyedSubscript:@"incidentsOffRoutes"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v296 = 0u;
    long long v297 = 0u;
    long long v294 = 0u;
    long long v295 = 0u;
    id v67 = v66;
    uint64_t v68 = [v67 countByEnumeratingWithState:&v294 objects:v323 count:16];
    if (v68)
    {
      uint64_t v69 = v68;
      uint64_t v70 = *(void *)v295;
      do
      {
        for (uint64_t n = 0; n != v69; ++n)
        {
          if (*(void *)v295 != v70) {
            objc_enumerationMutation(v67);
          }
          uint64_t v72 = *(void *)(*((void *)&v294 + 1) + 8 * n);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v73 = [GEORouteIncident alloc];
            if (a3) {
              uint64_t v74 = [(GEORouteIncident *)v73 initWithJSON:v72];
            }
            else {
              uint64_t v74 = [(GEORouteIncident *)v73 initWithDictionary:v72];
            }
            uint64_t v75 = (void *)v74;
            [v6 addIncidentsOffRoutes:v74];
          }
        }
        uint64_t v69 = [v67 countByEnumeratingWithState:&v294 objects:v323 count:16];
      }
      while (v69);
    }

    id v5 = v253;
    unint64_t v11 = 0x1E4F1C000uLL;
  }

  uint64_t v76 = [v5 objectForKeyedSubscript:@"problemDetail"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v292 = 0u;
    long long v293 = 0u;
    long long v290 = 0u;
    long long v291 = 0u;
    id v77 = v76;
    uint64_t v78 = [v77 countByEnumeratingWithState:&v290 objects:v322 count:16];
    if (v78)
    {
      uint64_t v79 = v78;
      uint64_t v80 = *(void *)v291;
      do
      {
        for (iuint64_t i = 0; ii != v79; ++ii)
        {
          if (*(void *)v291 != v80) {
            objc_enumerationMutation(v77);
          }
          v82 = *(void **)(*((void *)&v290 + 1) + 8 * ii);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            DWORD2(v256) = 0;
            *(void *)&long long v256 = 0;
            _GEOProblemDetailFromDictionaryRepresentation(v82, (uint64_t)&v256);
            unint64_t v11 = v11 & 0xFFFFFFFF00000000 | DWORD2(v256);
            objc_msgSend(v6, "addProblemDetail:", (void)v256, v11);
          }
        }
        uint64_t v79 = [v77 countByEnumeratingWithState:&v290 objects:v322 count:16];
      }
      while (v79);
    }

    id v5 = v253;
  }

  v83 = [v5 objectForKeyedSubscript:@"supportedTransportType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v288 = 0u;
    long long v289 = 0u;
    long long v286 = 0u;
    long long v287 = 0u;
    long long v252 = v83;
    id v84 = v83;
    uint64_t v85 = [v84 countByEnumeratingWithState:&v286 objects:v321 count:16];
    if (!v85) {
      goto LABEL_187;
    }
    uint64_t v86 = v85;
    uint64_t v87 = *(void *)v287;
    while (1)
    {
      for (juint64_t j = 0; jj != v86; ++jj)
      {
        if (*(void *)v287 != v87) {
          objc_enumerationMutation(v84);
        }
        v89 = *(void **)(*((void *)&v286 + 1) + 8 * jj);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v90 = v89;
          if ([v90 isEqualToString:@"AUTOMOBILE"])
          {
            uint64_t v91 = 0;
          }
          else if ([v90 isEqualToString:@"TRANSIT"])
          {
            uint64_t v91 = 1;
          }
          else if ([v90 isEqualToString:@"WALKING"])
          {
            uint64_t v91 = 2;
          }
          else if ([v90 isEqualToString:@"BICYCLE"])
          {
            uint64_t v91 = 3;
          }
          else if ([v90 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
          {
            uint64_t v91 = 4;
          }
          else if ([v90 isEqualToString:@"FERRY"])
          {
            uint64_t v91 = 5;
          }
          else if ([v90 isEqualToString:@"RIDESHARE"])
          {
            uint64_t v91 = 6;
          }
          else
          {
            uint64_t v91 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v91 = [v89 intValue];
        }
        objc_msgSend(v6, "addSupportedTransportType:", v91, v252);
      }
      uint64_t v86 = [v84 countByEnumeratingWithState:&v286 objects:v321 count:16];
      if (!v86)
      {
LABEL_187:

        v83 = v252;
        id v5 = v253;
        break;
      }
    }
  }

  if (a3) {
    v92 = @"serviceGap";
  }
  else {
    v92 = @"service_gap";
  }
  id v93 = objc_msgSend(v5, "objectForKeyedSubscript:", v92, v252);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v284 = 0u;
    long long v285 = 0u;
    long long v282 = 0u;
    long long v283 = 0u;
    id v94 = v93;
    uint64_t v95 = [v94 countByEnumeratingWithState:&v282 objects:v320 count:16];
    if (v95)
    {
      uint64_t v96 = v95;
      uint64_t v97 = *(void *)v283;
      do
      {
        for (kuint64_t k = 0; kk != v96; ++kk)
        {
          if (*(void *)v283 != v97) {
            objc_enumerationMutation(v94);
          }
          uint64_t v99 = *(void *)(*((void *)&v282 + 1) + 8 * kk);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v100 = [GEOTransitServiceGap alloc];
            if (a3) {
              uint64_t v101 = [(GEOTransitServiceGap *)v100 initWithJSON:v99];
            }
            else {
              uint64_t v101 = [(GEOTransitServiceGap *)v100 initWithDictionary:v99];
            }
            v102 = (void *)v101;
            [v6 addServiceGap:v101];
          }
        }
        uint64_t v96 = [v94 countByEnumeratingWithState:&v282 objects:v320 count:16];
      }
      while (v96);
    }

    id v5 = v253;
  }

  if (a3) {
    v103 = @"selectedRouteIndex";
  }
  else {
    v103 = @"selected_route_index";
  }
  v104 = [v5 objectForKeyedSubscript:v103];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSelectedRouteIndex:", objc_msgSend(v104, "unsignedIntValue"));
  }

  if (a3) {
    v105 = @"transitIncidentMessage";
  }
  else {
    v105 = @"transit_incident_message";
  }
  id v106 = [v5 objectForKeyedSubscript:v105];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v107 = [GEOPBTransitRoutingIncidentMessage alloc];
    if (v107) {
      v108 = (void *)-[GEOPBTransitRoutingIncidentMessage _initWithDictionary:isJSON:]((uint64_t)v107, v106, a3);
    }
    else {
      v108 = 0;
    }
    [v6 setTransitIncidentMessage:v108];
  }
  if (a3) {
    v109 = @"displayHints";
  }
  else {
    v109 = @"display_hints";
  }
  v110 = [v5 objectForKeyedSubscript:v109];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v111 = [GEORouteDisplayHints alloc];
    if (a3) {
      uint64_t v112 = [(GEORouteDisplayHints *)v111 initWithJSON:v110];
    }
    else {
      uint64_t v112 = [(GEORouteDisplayHints *)v111 initWithDictionary:v110];
    }
    id v113 = (void *)v112;
    [v6 setDisplayHints:v112];
  }
  if (a3) {
    v114 = @"styleAttributes";
  }
  else {
    v114 = @"style_attributes";
  }
  id v115 = [v5 objectForKeyedSubscript:v114];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v116 = [GEOStyleAttributes alloc];
    if (a3) {
      uint64_t v117 = [(GEOStyleAttributes *)v116 initWithJSON:v115];
    }
    else {
      uint64_t v117 = [(GEOStyleAttributes *)v116 initWithDictionary:v115];
    }
    uint64_t v118 = (void *)v117;
    [v6 setStyleAttributes:v117];
  }
  if (a3) {
    v119 = @"sessionState";
  }
  else {
    v119 = @"session_state";
  }
  v120 = [v5 objectForKeyedSubscript:v119];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v121 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v120 options:0];
    [v6 setSessionState:v121];
  }
  if (a3) {
    v122 = @"failureAlert";
  }
  else {
    v122 = @"failure_alert";
  }
  v123 = [v5 objectForKeyedSubscript:v122];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v124 = [GEOAlert alloc];
    if (v124) {
      v125 = -[GEOAlert _initWithDictionary:isJSON:](v124, v123, a3);
    }
    else {
      v125 = 0;
    }
    [v6 setFailureAlert:v125];
  }
  if (a3) {
    v126 = @"liveRouteSavingsSeconds";
  }
  else {
    v126 = @"live_route_savings_seconds";
  }
  v127 = [v5 objectForKeyedSubscript:v126];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setLiveRouteSavingsSeconds:", objc_msgSend(v127, "intValue"));
  }

  if (a3) {
    v128 = @"datasetAbStatus";
  }
  else {
    v128 = @"dataset_ab_status";
  }
  v129 = [v5 objectForKeyedSubscript:v128];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v130 = [GEOPDDatasetABStatus alloc];
    if (a3) {
      uint64_t v131 = [(GEOPDDatasetABStatus *)v130 initWithJSON:v129];
    }
    else {
      uint64_t v131 = [(GEOPDDatasetABStatus *)v130 initWithDictionary:v129];
    }
    id v132 = (void *)v131;
    [v6 setDatasetAbStatus:v131];
  }
  if (a3) {
    v133 = @"trafficCamera";
  }
  else {
    v133 = @"traffic_camera";
  }
  v134 = [v5 objectForKeyedSubscript:v133];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v280 = 0u;
    long long v281 = 0u;
    long long v278 = 0u;
    long long v279 = 0u;
    id v135 = v134;
    uint64_t v136 = [v135 countByEnumeratingWithState:&v278 objects:v319 count:16];
    if (v136)
    {
      uint64_t v137 = v136;
      uint64_t v138 = *(void *)v279;
      do
      {
        for (muint64_t m = 0; mm != v137; ++mm)
        {
          if (*(void *)v279 != v138) {
            objc_enumerationMutation(v135);
          }
          uint64_t v140 = *(void *)(*((void *)&v278 + 1) + 8 * mm);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v141 = [GEOTrafficCamera alloc];
            if (a3) {
              uint64_t v142 = [(GEOTrafficCamera *)v141 initWithJSON:v140];
            }
            else {
              uint64_t v142 = [(GEOTrafficCamera *)v141 initWithDictionary:v140];
            }
            v143 = (void *)v142;
            [v6 addTrafficCamera:v142];
          }
        }
        uint64_t v137 = [v135 countByEnumeratingWithState:&v278 objects:v319 count:16];
      }
      while (v137);
    }

    id v5 = v253;
  }

  if (a3) {
    id v144 = @"nonRecommendedRoutesCache";
  }
  else {
    id v144 = @"non_recommended_routes_cache";
  }
  v145 = [v5 objectForKeyedSubscript:v144];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v146 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v145 options:0];
    [v6 setNonRecommendedRoutesCache:v146];
  }
  if (a3) {
    id v147 = @"isOfflineResponse";
  }
  else {
    id v147 = @"is_offline_response";
  }
  uint64_t v148 = [v5 objectForKeyedSubscript:v147];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIsOfflineResponse:", objc_msgSend(v148, "BOOLValue"));
  }

  if (a3) {
    uint64_t v149 = @"snapScoreMetadataDebug";
  }
  else {
    uint64_t v149 = @"snap_score_metadata_debug";
  }
  uint64_t v150 = [v5 objectForKeyedSubscript:v149];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v151 = [GEOSnapScoreMetadata alloc];
    if (v151) {
      v152 = -[GEOSnapScoreMetadata _initWithDictionary:isJSON:](v151, v150, a3);
    }
    else {
      v152 = 0;
    }
    [v6 setSnapScoreMetadataDebug:v152];
  }
  if (a3) {
    id v153 = @"hasKhSegments";
  }
  else {
    id v153 = @"has_kh_segments";
  }
  v154 = [v5 objectForKeyedSubscript:v153];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setHasKhSegments:", objc_msgSend(v154, "BOOLValue"));
  }

  if (a3) {
    v155 = @"debugData";
  }
  else {
    v155 = @"debug_data";
  }
  v156 = [v5 objectForKeyedSubscript:v155];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v157 = (void *)[v156 copy];
    [v6 setDebugData:v157];
  }
  if (a3) {
    v158 = @"arrivalParameters";
  }
  else {
    v158 = @"arrival_parameters";
  }
  id v159 = [v5 objectForKeyedSubscript:v158];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v276 = 0u;
    long long v277 = 0u;
    long long v274 = 0u;
    long long v275 = 0u;
    id v160 = v159;
    uint64_t v161 = [v160 countByEnumeratingWithState:&v274 objects:v318 count:16];
    if (v161)
    {
      uint64_t v162 = v161;
      uint64_t v163 = *(void *)v275;
      do
      {
        for (nuint64_t n = 0; nn != v162; ++nn)
        {
          if (*(void *)v275 != v163) {
            objc_enumerationMutation(v160);
          }
          uint64_t v165 = *(void *)(*((void *)&v274 + 1) + 8 * nn);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v166 = [GEOArrivalParameters alloc];
            if (a3) {
              uint64_t v167 = [(GEOArrivalParameters *)v166 initWithJSON:v165];
            }
            else {
              uint64_t v167 = [(GEOArrivalParameters *)v166 initWithDictionary:v165];
            }
            v168 = (void *)v167;
            [v6 addArrivalParameters:v167];
          }
        }
        uint64_t v162 = [v160 countByEnumeratingWithState:&v274 objects:v318 count:16];
      }
      while (v162);
    }

    id v5 = v253;
  }

  if (a3) {
    v169 = @"trafficSignal";
  }
  else {
    v169 = @"traffic_signal";
  }
  v170 = [v5 objectForKeyedSubscript:v169];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v272 = 0u;
    long long v273 = 0u;
    long long v270 = 0u;
    long long v271 = 0u;
    id v171 = v170;
    uint64_t v172 = [v171 countByEnumeratingWithState:&v270 objects:v317 count:16];
    if (v172)
    {
      uint64_t v173 = v172;
      uint64_t v174 = *(void *)v271;
      do
      {
        for (uint64_t i1 = 0; i1 != v173; ++i1)
        {
          if (*(void *)v271 != v174) {
            objc_enumerationMutation(v171);
          }
          uint64_t v176 = *(void *)(*((void *)&v270 + 1) + 8 * i1);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v177 = [GEOTrafficSignal alloc];
            if (a3) {
              uint64_t v178 = [(GEOTrafficSignal *)v177 initWithJSON:v176];
            }
            else {
              uint64_t v178 = [(GEOTrafficSignal *)v177 initWithDictionary:v176];
            }
            v179 = (void *)v178;
            [v6 addTrafficSignal:v178];
          }
        }
        uint64_t v173 = [v171 countByEnumeratingWithState:&v270 objects:v317 count:16];
      }
      while (v173);
    }

    id v5 = v253;
  }

  if (a3) {
    v180 = @"transitRouteUpdateConfiguration";
  }
  else {
    v180 = @"transit_route_update_configuration";
  }
  v181 = [v5 objectForKeyedSubscript:v180];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v182 = [GEOTransitRouteUpdateConfiguration alloc];
    if (a3) {
      uint64_t v183 = [(GEOTransitRouteUpdateConfiguration *)v182 initWithJSON:v181];
    }
    else {
      uint64_t v183 = [(GEOTransitRouteUpdateConfiguration *)v182 initWithDictionary:v181];
    }
    v184 = (void *)v183;
    [v6 setTransitRouteUpdateConfiguration:v183];
  }
  if (a3) {
    v185 = @"transitPaymentMethodSuggestion";
  }
  else {
    v185 = @"transit_payment_method_suggestion";
  }
  v186 = [v5 objectForKeyedSubscript:v185];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v268 = 0u;
    long long v269 = 0u;
    long long v266 = 0u;
    long long v267 = 0u;
    id v187 = v186;
    uint64_t v188 = [v187 countByEnumeratingWithState:&v266 objects:v316 count:16];
    if (v188)
    {
      uint64_t v189 = v188;
      uint64_t v190 = *(void *)v267;
      do
      {
        for (uint64_t i2 = 0; i2 != v189; ++i2)
        {
          if (*(void *)v267 != v190) {
            objc_enumerationMutation(v187);
          }
          uint64_t v192 = *(void *)(*((void *)&v266 + 1) + 8 * i2);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v193 = [GEOPBTransitPaymentMethodSuggestion alloc];
            if (a3) {
              uint64_t v194 = [(GEOPBTransitPaymentMethodSuggestion *)v193 initWithJSON:v192];
            }
            else {
              uint64_t v194 = [(GEOPBTransitPaymentMethodSuggestion *)v193 initWithDictionary:v192];
            }
            v195 = (void *)v194;
            [v6 addTransitPaymentMethodSuggestion:v194];
          }
        }
        uint64_t v189 = [v187 countByEnumeratingWithState:&v266 objects:v316 count:16];
      }
      while (v189);
    }

    id v5 = v253;
  }

  if (a3) {
    v196 = @"analyticData";
  }
  else {
    v196 = @"analytic_data";
  }
  id v197 = [v5 objectForKeyedSubscript:v196];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v198 = [GEODirectionsRequestResponseAnalyticsData alloc];
    if (a3) {
      uint64_t v199 = [(GEODirectionsRequestResponseAnalyticsData *)v198 initWithJSON:v197];
    }
    else {
      uint64_t v199 = [(GEODirectionsRequestResponseAnalyticsData *)v198 initWithDictionary:v197];
    }
    id v200 = (void *)v199;
    [v6 setAnalyticData:v199];
  }
  if (a3) {
    v201 = @"advisoriesInfo";
  }
  else {
    v201 = @"advisories_info";
  }
  v202 = [v5 objectForKeyedSubscript:v201];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v203 = [GEOAdvisoriesInfo alloc];
    if (a3) {
      uint64_t v204 = [(GEOAdvisoriesInfo *)v203 initWithJSON:v202];
    }
    else {
      uint64_t v204 = [(GEOAdvisoriesInfo *)v203 initWithDictionary:v202];
    }
    id v205 = (void *)v204;
    [v6 setAdvisoriesInfo:v204];
  }
  if (a3) {
    v206 = @"responseAttributes";
  }
  else {
    v206 = @"response_attributes";
  }
  v207 = [v5 objectForKeyedSubscript:v206];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v208 = [GEOCommonResponseAttributes alloc];
    if (a3) {
      uint64_t v209 = [(GEOCommonResponseAttributes *)v208 initWithJSON:v207];
    }
    else {
      uint64_t v209 = [(GEOCommonResponseAttributes *)v208 initWithDictionary:v207];
    }
    id v210 = (void *)v209;
    [v6 setResponseAttributes:v209];
  }
  if (a3) {
    v211 = @"internalError";
  }
  else {
    v211 = @"internal_error";
  }
  v212 = [v5 objectForKeyedSubscript:v211];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v264 = 0u;
    long long v265 = 0u;
    long long v262 = 0u;
    long long v263 = 0u;
    id v213 = v212;
    uint64_t v214 = [v213 countByEnumeratingWithState:&v262 objects:v315 count:16];
    if (v214)
    {
      uint64_t v215 = v214;
      uint64_t v216 = *(void *)v263;
      do
      {
        for (uint64_t i3 = 0; i3 != v215; ++i3)
        {
          if (*(void *)v263 != v216) {
            objc_enumerationMutation(v213);
          }
          v218 = *(void **)(*((void *)&v262 + 1) + 8 * i3);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v219 = (void *)[v218 copy];
            [v6 addInternalError:v219];
          }
        }
        uint64_t v215 = [v213 countByEnumeratingWithState:&v262 objects:v315 count:16];
      }
      while (v215);
    }
  }
  if (a3) {
    id v220 = @"serviceVersion";
  }
  else {
    id v220 = @"service_version";
  }
  long long v221 = [v5 objectForKeyedSubscript:v220];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v222 = (void *)[v221 copy];
    [v6 setServiceVersion:v222];
  }
  if (a3) {
    long long v223 = @"dataVersion";
  }
  else {
    long long v223 = @"data_version";
  }
  long long v224 = [v5 objectForKeyedSubscript:v223];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v225 = (void *)[v224 copy];
    [v6 setDataVersion:v225];
  }
  if (a3) {
    long long v226 = @"suggestedRoute";
  }
  else {
    long long v226 = @"suggested_route";
  }
  long long v227 = [v5 objectForKeyedSubscript:v226];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v260 = 0u;
    long long v261 = 0u;
    long long v258 = 0u;
    long long v259 = 0u;
    id v228 = v227;
    uint64_t v229 = [v228 countByEnumeratingWithState:&v258 objects:v314 count:16];
    if (v229)
    {
      uint64_t v230 = v229;
      uint64_t v231 = *(void *)v259;
      do
      {
        for (uint64_t i4 = 0; i4 != v230; ++i4)
        {
          if (*(void *)v259 != v231) {
            objc_enumerationMutation(v228);
          }
          uint64_t v233 = *(void *)(*((void *)&v258 + 1) + 8 * i4);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v234 = [GEOTransitSuggestedRoute alloc];
            if (a3) {
              uint64_t v235 = [(GEOTransitSuggestedRoute *)v234 initWithJSON:v233];
            }
            else {
              uint64_t v235 = [(GEOTransitSuggestedRoute *)v234 initWithDictionary:v233];
            }
            long long v236 = (void *)v235;
            [v6 addSuggestedRoute:v235];
          }
        }
        uint64_t v230 = [v228 countByEnumeratingWithState:&v258 objects:v314 count:16];
      }
      while (v230);
    }

    id v5 = v253;
  }

  if (a3) {
    long long v237 = @"timepointUsed";
  }
  else {
    long long v237 = @"timepoint_used";
  }
  long long v238 = [v5 objectForKeyedSubscript:v237];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v256 = 0uLL;
    uint64_t v257 = 0;
    _GEOTimepointFromDictionaryRepresentation(v238, (uint64_t)&v256, a3);
    long long v254 = v256;
    uint64_t v255 = v257;
    [v6 setTimepointUsed:&v254];
  }

  if (a3) {
    long long v239 = @"decoderData";
  }
  else {
    long long v239 = @"decoder_data";
  }
  long long v240 = [v5 objectForKeyedSubscript:v239];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v241 = [GEOTransitDecoderData alloc];
    if (a3) {
      uint64_t v242 = [(GEOTransitDecoderData *)v241 initWithJSON:v240];
    }
    else {
      uint64_t v242 = [(GEOTransitDecoderData *)v241 initWithDictionary:v240];
    }
    long long v243 = (void *)v242;
    [v6 setDecoderData:v242];
  }
  if (a3) {
    long long v244 = @"transitDataVersion";
  }
  else {
    long long v244 = @"transit_data_version";
  }
  long long v245 = [v5 objectForKeyedSubscript:v244];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v246 = (void *)[v245 copy];
    [v6 setTransitDataVersion:v246];
  }
  long long v247 = [v5 objectForKeyedSubscript:@"clientMetrics"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v248 = [GEOClientMetrics alloc];
    if (a3) {
      uint64_t v249 = [(GEOClientMetrics *)v248 initWithJSON:v247];
    }
    else {
      uint64_t v249 = [(GEOClientMetrics *)v248 initWithDictionary:v247];
    }
    long long v250 = (void *)v249;
    [v6 setClientMetrics:v249];
  }
  a1 = v6;

LABEL_450:
  return a1;
}

- (GEODirectionsResponse)initWithJSON:(id)a3
{
  return (GEODirectionsResponse *)-[GEODirectionsResponse _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_849;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_850;
    }
    GEODirectionsResponseReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEODirectionsResponseCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEODirectionsResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEODirectionsResponseReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEODirectionsResponseIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v59 = self->_reader;
    objc_sync_enter(v59);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v60 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v60];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v59);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEODirectionsResponse *)self readAll:0];
    PBDataWriterWriteInt32Field();
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v6 = self->_routes;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v106 objects:v121 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v107;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v107 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v106 objects:v121 count:16];
      }
      while (v7);
    }

    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    id v10 = self->_waypointRoutes;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v102 objects:v120 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v103;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v103 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v102 objects:v120 count:16];
      }
      while (v11);
    }

    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    uint64_t v14 = self->_placeSearchResponses;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v98 objects:v119 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v99;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v99 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v98 objects:v119 count:16];
      }
      while (v15);
    }

    $BB24C2ED400A1348441C88FA4FCB4848 flags = self->_flags;
    if ((*(unsigned char *)&flags & 8) != 0)
    {
      PBDataWriterWriteInt32Field();
      $BB24C2ED400A1348441C88FA4FCB4848 flags = self->_flags;
    }
    if ((*(_WORD *)&flags & 0x100) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_directionsResponseID) {
      PBDataWriterWriteDataField();
    }
    if (self->_tripId) {
      PBDataWriterWriteSubmessage();
    }
    $BB24C2ED400A1348441C88FA4FCB4848 v19 = self->_flags;
    if ((*(unsigned char *)&v19 & 0x40) != 0)
    {
      PBDataWriterWriteBOOLField();
      $BB24C2ED400A1348441C88FA4FCB4848 v19 = self->_flags;
    }
    if ((*(unsigned char *)&v19 & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    uint64_t v20 = self->_incidentsOnRoutes;
    uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v94 objects:v118 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v95;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v95 != v22) {
            objc_enumerationMutation(v20);
          }
          PBDataWriterWriteSubmessage();
          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v94 objects:v118 count:16];
      }
      while (v21);
    }

    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    uint64_t v24 = self->_incidentsOffRoutes;
    uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v90 objects:v117 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v91;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v91 != v26) {
            objc_enumerationMutation(v24);
          }
          PBDataWriterWriteSubmessage();
          ++v27;
        }
        while (v25 != v27);
        uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v90 objects:v117 count:16];
      }
      while (v25);
    }

    if (self->_problemDetailsCount)
    {
      uint64_t v28 = 0;
      unint64_t v29 = 0;
      do
      {
        uint64_t v89 = 0;
        PBDataWriterPlaceMark();
        GEOProblemDetailWriteTo((uint64_t)&self->_problemDetails[v28]);
        PBDataWriterRecallMark();
        ++v29;
        ++v28;
      }
      while (v29 < self->_problemDetailsCount);
    }
    if (self->_supportedTransportTypes.count)
    {
      unint64_t v30 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v30;
      }
      while (v30 < self->_supportedTransportTypes.count);
    }
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v31 = self->_serviceGaps;
    uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v85 objects:v116 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v86;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v86 != v33) {
            objc_enumerationMutation(v31);
          }
          PBDataWriterWriteSubmessage();
          ++v34;
        }
        while (v32 != v34);
        uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v85 objects:v116 count:16];
      }
      while (v32);
    }

    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_transitIncidentMessage) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_displayHints) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_styleAttributes) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_sessionState) {
      PBDataWriterWriteDataField();
    }
    if (self->_failureAlert) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_datasetAbStatus) {
      PBDataWriterWriteSubmessage();
    }
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    uint64_t v35 = self->_trafficCameras;
    uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v81 objects:v115 count:16];
    if (v36)
    {
      uint64_t v37 = *(void *)v82;
      do
      {
        uint64_t v38 = 0;
        do
        {
          if (*(void *)v82 != v37) {
            objc_enumerationMutation(v35);
          }
          PBDataWriterWriteSubmessage();
          ++v38;
        }
        while (v36 != v38);
        uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v81 objects:v115 count:16];
      }
      while (v36);
    }

    if (self->_nonRecommendedRoutesCache) {
      PBDataWriterWriteDataField();
    }
    if ((*(unsigned char *)&self->_flags & 0x80) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_snapScoreMetadataDebug) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_debugData) {
      PBDataWriterWriteStringField();
    }
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    v39 = self->_arrivalParameters;
    uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v77 objects:v114 count:16];
    if (v40)
    {
      uint64_t v41 = *(void *)v78;
      do
      {
        uint64_t v42 = 0;
        do
        {
          if (*(void *)v78 != v41) {
            objc_enumerationMutation(v39);
          }
          PBDataWriterWriteSubmessage();
          ++v42;
        }
        while (v40 != v42);
        uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v77 objects:v114 count:16];
      }
      while (v40);
    }

    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v43 = self->_trafficSignals;
    uint64_t v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v73 objects:v113 count:16];
    if (v44)
    {
      uint64_t v45 = *(void *)v74;
      do
      {
        uint64_t v46 = 0;
        do
        {
          if (*(void *)v74 != v45) {
            objc_enumerationMutation(v43);
          }
          PBDataWriterWriteSubmessage();
          ++v46;
        }
        while (v44 != v46);
        uint64_t v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v73 objects:v113 count:16];
      }
      while (v44);
    }

    if (self->_transitRouteUpdateConfiguration) {
      PBDataWriterWriteSubmessage();
    }
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v47 = self->_transitPaymentMethodSuggestions;
    uint64_t v48 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v69 objects:v112 count:16];
    if (v48)
    {
      uint64_t v49 = *(void *)v70;
      do
      {
        uint64_t v50 = 0;
        do
        {
          if (*(void *)v70 != v49) {
            objc_enumerationMutation(v47);
          }
          PBDataWriterWriteSubmessage();
          ++v50;
        }
        while (v48 != v50);
        uint64_t v48 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v69 objects:v112 count:16];
      }
      while (v48);
    }

    if (self->_analyticData) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_advisoriesInfo) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_responseAttributes) {
      PBDataWriterWriteSubmessage();
    }
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    uint64_t v51 = self->_internalErrors;
    uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v65 objects:v111 count:16];
    if (v52)
    {
      uint64_t v53 = *(void *)v66;
      do
      {
        uint64_t v54 = 0;
        do
        {
          if (*(void *)v66 != v53) {
            objc_enumerationMutation(v51);
          }
          PBDataWriterWriteStringField();
          ++v54;
        }
        while (v52 != v54);
        uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v65 objects:v111 count:16];
      }
      while (v52);
    }

    if (self->_serviceVersion) {
      PBDataWriterWriteStringField();
    }
    if (self->_dataVersion) {
      PBDataWriterWriteStringField();
    }
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    uint64_t v55 = self->_suggestedRoutes;
    uint64_t v56 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v61 objects:v110 count:16];
    if (v56)
    {
      uint64_t v57 = *(void *)v62;
      do
      {
        uint64_t v58 = 0;
        do
        {
          if (*(void *)v62 != v57) {
            objc_enumerationMutation(v55);
          }
          PBDataWriterWriteSubmessage();
          ++v58;
        }
        while (v56 != v58);
        uint64_t v56 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v61 objects:v110 count:16];
      }
      while (v56);
    }

    if (*(unsigned char *)&self->_flags)
    {
      uint64_t v89 = 0;
      PBDataWriterPlaceMark();
      GEOTimepointWriteTo((uint64_t)&self->_timepointUsed);
      PBDataWriterRecallMark();
    }
    if (self->_decoderData) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_transitDataVersion) {
      PBDataWriterWriteStringField();
    }
    if (self->_clientMetrics) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v61);
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  -[GEODirectionsResponse _readAdvisoriesInfo]((uint64_t)self);
  if ([(GEOAdvisoriesInfo *)self->_advisoriesInfo hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEODirectionsResponse _readArrivalParameters]((uint64_t)self);
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v6 = self->_arrivalParameters;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v76 objects:v88 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v77;
LABEL_5:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v77 != v9) {
        objc_enumerationMutation(v6);
      }
      if ([*(id *)(*((void *)&v76 + 1) + 8 * v10) hasGreenTeaWithValue:v3]) {
        goto LABEL_78;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v76 objects:v88 count:16];
        if (v8) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  -[GEODirectionsResponse _readDecoderData]((uint64_t)self);
  if (![(GEOTransitDecoderData *)self->_decoderData hasGreenTeaWithValue:v3])
  {
    -[GEODirectionsResponse _readIncidentsOffRoutes]((uint64_t)self);
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v6 = self->_incidentsOffRoutes;
    uint64_t v11 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v72 objects:v87 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v73;
LABEL_14:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v73 != v13) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v72 + 1) + 8 * v14) hasGreenTeaWithValue:v3]) {
          goto LABEL_78;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v72 objects:v87 count:16];
          if (v12) {
            goto LABEL_14;
          }
          break;
        }
      }
    }

    -[GEODirectionsResponse _readIncidentsOnRoutes]((uint64_t)self);
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v6 = self->_incidentsOnRoutes;
    uint64_t v15 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v68 objects:v86 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v69;
LABEL_22:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v69 != v17) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v68 + 1) + 8 * v18) hasGreenTeaWithValue:v3]) {
          goto LABEL_78;
        }
        if (v16 == ++v18)
        {
          uint64_t v16 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v68 objects:v86 count:16];
          if (v16) {
            goto LABEL_22;
          }
          break;
        }
      }
    }

    -[GEODirectionsResponse _readPlaceSearchResponses]((uint64_t)self);
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v6 = self->_placeSearchResponses;
    uint64_t v19 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v64 objects:v85 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v65;
LABEL_30:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v65 != v21) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v64 + 1) + 8 * v22) hasGreenTeaWithValue:v3]) {
          goto LABEL_78;
        }
        if (v20 == ++v22)
        {
          uint64_t v20 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v64 objects:v85 count:16];
          if (v20) {
            goto LABEL_30;
          }
          break;
        }
      }
    }

    -[GEODirectionsResponse _readRoutes]((uint64_t)self);
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v6 = self->_routes;
    uint64_t v23 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v60 objects:v84 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v61;
LABEL_38:
      uint64_t v26 = 0;
      while (1)
      {
        if (*(void *)v61 != v25) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v60 + 1) + 8 * v26) hasGreenTeaWithValue:v3]) {
          goto LABEL_78;
        }
        if (v24 == ++v26)
        {
          uint64_t v24 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v60 objects:v84 count:16];
          if (v24) {
            goto LABEL_38;
          }
          break;
        }
      }
    }

    -[GEODirectionsResponse _readSnapScoreMetadataDebug]((uint64_t)self);
    if ((-[GEOSnapScoreMetadata hasGreenTeaWithValue:]((uint64_t)self->_snapScoreMetadataDebug, v3) & 1) == 0)
    {
      -[GEODirectionsResponse _readSuggestedRoutes]((uint64_t)self);
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v6 = self->_suggestedRoutes;
      uint64_t v27 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v56 objects:v83 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v57;
LABEL_47:
        uint64_t v30 = 0;
        while (1)
        {
          if (*(void *)v57 != v29) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v56 + 1) + 8 * v30) hasGreenTeaWithValue:v3]) {
            break;
          }
          if (v28 == ++v30)
          {
            uint64_t v28 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v56 objects:v83 count:16];
            if (v28) {
              goto LABEL_47;
            }
            goto LABEL_53;
          }
        }
      }
      else
      {
LABEL_53:

        -[GEODirectionsResponse _readTrafficCameras]((uint64_t)self);
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v6 = self->_trafficCameras;
        uint64_t v31 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v52 objects:v82 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v53;
LABEL_55:
          uint64_t v34 = 0;
          while (1)
          {
            if (*(void *)v53 != v33) {
              objc_enumerationMutation(v6);
            }
            if ([*(id *)(*((void *)&v52 + 1) + 8 * v34) hasGreenTeaWithValue:v3]) {
              break;
            }
            if (v32 == ++v34)
            {
              uint64_t v32 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v52 objects:v82 count:16];
              if (v32) {
                goto LABEL_55;
              }
              goto LABEL_61;
            }
          }
        }
        else
        {
LABEL_61:

          -[GEODirectionsResponse _readTrafficSignals]((uint64_t)self);
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          id v6 = self->_trafficSignals;
          uint64_t v35 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v48 objects:v81 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            uint64_t v37 = *(void *)v49;
LABEL_63:
            uint64_t v38 = 0;
            while (1)
            {
              if (*(void *)v49 != v37) {
                objc_enumerationMutation(v6);
              }
              if ([*(id *)(*((void *)&v48 + 1) + 8 * v38) hasGreenTeaWithValue:v3]) {
                break;
              }
              if (v36 == ++v38)
              {
                uint64_t v36 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v48 objects:v81 count:16];
                if (v36) {
                  goto LABEL_63;
                }
                goto LABEL_69;
              }
            }
          }
          else
          {
LABEL_69:

            -[GEODirectionsResponse _readWaypointRoutes]((uint64_t)self);
            long long v46 = 0u;
            long long v47 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            id v6 = self->_waypointRoutes;
            uint64_t v39 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v44 objects:v80 count:16];
            if (!v39)
            {
LABEL_77:
              BOOL v5 = 0;
LABEL_79:

              return v5;
            }
            uint64_t v40 = v39;
            uint64_t v41 = *(void *)v45;
LABEL_71:
            uint64_t v42 = 0;
            while (1)
            {
              if (*(void *)v45 != v41) {
                objc_enumerationMutation(v6);
              }
              if (objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * v42), "hasGreenTeaWithValue:", v3, (void)v44)) {
                break;
              }
              if (v40 == ++v42)
              {
                uint64_t v40 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v44 objects:v80 count:16];
                if (v40) {
                  goto LABEL_71;
                }
                goto LABEL_77;
              }
            }
          }
        }
      }
LABEL_78:
      BOOL v5 = 1;
      goto LABEL_79;
    }
  }
  return 1;
}

- (void)copyTo:(id)a3
{
  long long v67 = (char *)a3;
  [(GEODirectionsResponse *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v67 + 1, self->_reader);
  *((_DWORD *)v67 + 88) = self->_readerMarkPos;
  *((_DWORD *)v67 + 89) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_DWORD *)v67 + 95) = self->_status;
  if ([(GEODirectionsResponse *)self routesCount])
  {
    [v67 clearRoutes];
    unint64_t v4 = [(GEODirectionsResponse *)self routesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEODirectionsResponse *)self routeAtIndex:i];
        [v67 addRoute:v7];
      }
    }
  }
  if ([(GEODirectionsResponse *)self waypointRoutesCount])
  {
    [v67 clearWaypointRoutes];
    unint64_t v8 = [(GEODirectionsResponse *)self waypointRoutesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEODirectionsResponse *)self waypointRouteAtIndex:j];
        [v67 addWaypointRoute:v11];
      }
    }
  }
  if ([(GEODirectionsResponse *)self placeSearchResponsesCount])
  {
    [v67 clearPlaceSearchResponses];
    unint64_t v12 = [(GEODirectionsResponse *)self placeSearchResponsesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEODirectionsResponse *)self placeSearchResponseAtIndex:k];
        [v67 addPlaceSearchResponse:v15];
      }
    }
  }
  $BB24C2ED400A1348441C88FA4FCB4848 flags = self->_flags;
  uint64_t v17 = v67;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    *((_DWORD *)v67 + 93) = self->_localDistanceUnits;
    *(void *)(v67 + 388) |= 8uLL;
    $BB24C2ED400A1348441C88FA4FCB4848 flags = self->_flags;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    v67[387] = self->_routeDeviatesFromOriginal;
    *(void *)(v67 + 388) |= 0x100uLL;
  }
  if (self->_directionsResponseID)
  {
    objc_msgSend(v67, "setDirectionsResponseID:");
    uint64_t v17 = v67;
  }
  if (self->_tripId)
  {
    objc_msgSend(v67, "setTripId:");
    uint64_t v17 = v67;
  }
  $BB24C2ED400A1348441C88FA4FCB4848 v18 = self->_flags;
  if ((*(unsigned char *)&v18 & 0x40) != 0)
  {
    v17[385] = self->_isNavigable;
    *(void *)(v17 + 388) |= 0x40uLL;
    $BB24C2ED400A1348441C88FA4FCB4848 v18 = self->_flags;
  }
  if ((*(unsigned char *)&v18 & 2) != 0)
  {
    *((_DWORD *)v17 + 91) = self->_instructionSignFillColor;
    *(void *)(v17 + 388) |= 2uLL;
  }
  if ([(GEODirectionsResponse *)self incidentsOnRoutesCount])
  {
    [v67 clearIncidentsOnRoutes];
    unint64_t v19 = [(GEODirectionsResponse *)self incidentsOnRoutesCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (uint64_t m = 0; m != v20; ++m)
      {
        uint64_t v22 = [(GEODirectionsResponse *)self incidentsOnRoutesAtIndex:m];
        [v67 addIncidentsOnRoutes:v22];
      }
    }
  }
  if ([(GEODirectionsResponse *)self incidentsOffRoutesCount])
  {
    [v67 clearIncidentsOffRoutes];
    unint64_t v23 = [(GEODirectionsResponse *)self incidentsOffRoutesCount];
    if (v23)
    {
      unint64_t v24 = v23;
      for (uint64_t n = 0; n != v24; ++n)
      {
        uint64_t v26 = [(GEODirectionsResponse *)self incidentsOffRoutesAtIndex:n];
        [v67 addIncidentsOffRoutes:v26];
      }
    }
  }
  if ([(GEODirectionsResponse *)self problemDetailsCount])
  {
    [v67 clearProblemDetails];
    unint64_t v27 = [(GEODirectionsResponse *)self problemDetailsCount];
    if (v27)
    {
      unint64_t v28 = v27;
      for (iuint64_t i = 0; ii != v28; ++ii)
      {
        uint64_t v30 = [(GEODirectionsResponse *)self problemDetailAtIndex:ii];
        objc_msgSend(v67, "addProblemDetail:", v30, v31);
      }
    }
  }
  if ([(GEODirectionsResponse *)self supportedTransportTypesCount])
  {
    [v67 clearSupportedTransportTypes];
    unint64_t v32 = [(GEODirectionsResponse *)self supportedTransportTypesCount];
    if (v32)
    {
      unint64_t v33 = v32;
      for (juint64_t j = 0; jj != v33; ++jj)
        objc_msgSend(v67, "addSupportedTransportType:", -[GEODirectionsResponse supportedTransportTypeAtIndex:](self, "supportedTransportTypeAtIndex:", jj));
    }
  }
  if ([(GEODirectionsResponse *)self serviceGapsCount])
  {
    [v67 clearServiceGaps];
    unint64_t v35 = [(GEODirectionsResponse *)self serviceGapsCount];
    if (v35)
    {
      unint64_t v36 = v35;
      for (kuint64_t k = 0; kk != v36; ++kk)
      {
        uint64_t v38 = [(GEODirectionsResponse *)self serviceGapAtIndex:kk];
        [v67 addServiceGap:v38];
      }
    }
  }
  uint64_t v39 = v67;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *((_DWORD *)v67 + 94) = self->_selectedRouteIndex;
    *(void *)(v67 + 388) |= 0x10uLL;
  }
  if (self->_transitIncidentMessage)
  {
    objc_msgSend(v67, "setTransitIncidentMessage:");
    uint64_t v39 = v67;
  }
  if (self->_displayHints)
  {
    objc_msgSend(v67, "setDisplayHints:");
    uint64_t v39 = v67;
  }
  if (self->_styleAttributes)
  {
    objc_msgSend(v67, "setStyleAttributes:");
    uint64_t v39 = v67;
  }
  if (self->_sessionState)
  {
    objc_msgSend(v67, "setSessionState:");
    uint64_t v39 = v67;
  }
  if (self->_failureAlert)
  {
    objc_msgSend(v67, "setFailureAlert:");
    uint64_t v39 = v67;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v39 + 92) = self->_liveRouteSavingsSeconds;
    *(void *)(v39 + 388) |= 4uLL;
  }
  if (self->_datasetAbStatus) {
    objc_msgSend(v67, "setDatasetAbStatus:");
  }
  if ([(GEODirectionsResponse *)self trafficCamerasCount])
  {
    [v67 clearTrafficCameras];
    unint64_t v40 = [(GEODirectionsResponse *)self trafficCamerasCount];
    if (v40)
    {
      unint64_t v41 = v40;
      for (muint64_t m = 0; mm != v41; ++mm)
      {
        id v43 = [(GEODirectionsResponse *)self trafficCameraAtIndex:mm];
        [v67 addTrafficCamera:v43];
      }
    }
  }
  if (self->_nonRecommendedRoutesCache) {
    objc_msgSend(v67, "setNonRecommendedRoutesCache:");
  }
  long long v44 = v67;
  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    v67[386] = self->_isOfflineResponse;
    *(void *)(v67 + 388) |= 0x80uLL;
  }
  if (self->_snapScoreMetadataDebug)
  {
    objc_msgSend(v67, "setSnapScoreMetadataDebug:");
    long long v44 = v67;
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    v44[384] = self->_hasKhSegments;
    *(void *)(v44 + 388) |= 0x20uLL;
  }
  if (self->_debugData) {
    objc_msgSend(v67, "setDebugData:");
  }
  if ([(GEODirectionsResponse *)self arrivalParametersCount])
  {
    [v67 clearArrivalParameters];
    unint64_t v45 = [(GEODirectionsResponse *)self arrivalParametersCount];
    if (v45)
    {
      unint64_t v46 = v45;
      for (nuint64_t n = 0; nn != v46; ++nn)
      {
        long long v48 = [(GEODirectionsResponse *)self arrivalParametersAtIndex:nn];
        [v67 addArrivalParameters:v48];
      }
    }
  }
  if ([(GEODirectionsResponse *)self trafficSignalsCount])
  {
    [v67 clearTrafficSignals];
    unint64_t v49 = [(GEODirectionsResponse *)self trafficSignalsCount];
    if (v49)
    {
      unint64_t v50 = v49;
      for (uint64_t i1 = 0; i1 != v50; ++i1)
      {
        long long v52 = [(GEODirectionsResponse *)self trafficSignalAtIndex:i1];
        [v67 addTrafficSignal:v52];
      }
    }
  }
  if (self->_transitRouteUpdateConfiguration) {
    objc_msgSend(v67, "setTransitRouteUpdateConfiguration:");
  }
  if ([(GEODirectionsResponse *)self transitPaymentMethodSuggestionsCount])
  {
    [v67 clearTransitPaymentMethodSuggestions];
    unint64_t v53 = [(GEODirectionsResponse *)self transitPaymentMethodSuggestionsCount];
    if (v53)
    {
      unint64_t v54 = v53;
      for (uint64_t i2 = 0; i2 != v54; ++i2)
      {
        long long v56 = [(GEODirectionsResponse *)self transitPaymentMethodSuggestionAtIndex:i2];
        [v67 addTransitPaymentMethodSuggestion:v56];
      }
    }
  }
  if (self->_analyticData) {
    objc_msgSend(v67, "setAnalyticData:");
  }
  if (self->_advisoriesInfo) {
    objc_msgSend(v67, "setAdvisoriesInfo:");
  }
  if (self->_responseAttributes) {
    objc_msgSend(v67, "setResponseAttributes:");
  }
  if ([(GEODirectionsResponse *)self internalErrorsCount])
  {
    [v67 clearInternalErrors];
    unint64_t v57 = [(GEODirectionsResponse *)self internalErrorsCount];
    if (v57)
    {
      unint64_t v58 = v57;
      for (uint64_t i3 = 0; i3 != v58; ++i3)
      {
        long long v60 = [(GEODirectionsResponse *)self internalErrorAtIndex:i3];
        [v67 addInternalError:v60];
      }
    }
  }
  if (self->_serviceVersion) {
    objc_msgSend(v67, "setServiceVersion:");
  }
  if (self->_dataVersion) {
    objc_msgSend(v67, "setDataVersion:");
  }
  if ([(GEODirectionsResponse *)self suggestedRoutesCount])
  {
    [v67 clearSuggestedRoutes];
    unint64_t v61 = [(GEODirectionsResponse *)self suggestedRoutesCount];
    if (v61)
    {
      unint64_t v62 = v61;
      for (uint64_t i4 = 0; i4 != v62; ++i4)
      {
        long long v64 = [(GEODirectionsResponse *)self suggestedRouteAtIndex:i4];
        [v67 addSuggestedRoute:v64];
      }
    }
  }
  long long v65 = v67;
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v66 = *(void *)&self->_timepointUsed._type;
    *(_OWORD *)(v67 + 72) = *(_OWORD *)&self->_timepointUsed._currentUserTime;
    *((void *)v67 + 11) = v66;
    *(void *)(v67 + 388) |= 1uLL;
  }
  if (self->_decoderData)
  {
    objc_msgSend(v67, "setDecoderData:");
    long long v65 = v67;
  }
  if (self->_transitDataVersion)
  {
    objc_msgSend(v67, "setTransitDataVersion:");
    long long v65 = v67;
  }
  if (self->_clientMetrics)
  {
    objc_msgSend(v67, "setClientMetrics:");
    long long v65 = v67;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v175 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 5) & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEODirectionsResponseReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_110;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEODirectionsResponse *)self readAll:0];
  *(_DWORD *)(v5 + 380) = self->_status;
  long long v161 = 0u;
  long long v162 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  unint64_t v9 = self->_routes;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v159 objects:v174 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v160;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v160 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v159 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addRoute:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v159 objects:v174 count:16];
    }
    while (v10);
  }

  long long v157 = 0u;
  long long v158 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  uint64_t v14 = self->_waypointRoutes;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v155 objects:v173 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v156;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v156 != v16) {
          objc_enumerationMutation(v14);
        }
        $BB24C2ED400A1348441C88FA4FCB4848 v18 = (void *)[*(id *)(*((void *)&v155 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addWaypointRoute:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v155 objects:v173 count:16];
    }
    while (v15);
  }

  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  unint64_t v19 = self->_placeSearchResponses;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v151 objects:v172 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v152;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v152 != v21) {
          objc_enumerationMutation(v19);
        }
        unint64_t v23 = (void *)[*(id *)(*((void *)&v151 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addPlaceSearchResponse:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v151 objects:v172 count:16];
    }
    while (v20);
  }

  $BB24C2ED400A1348441C88FA4FCB4848 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 372) = self->_localDistanceUnits;
    *(void *)(v5 + 388) |= 8uLL;
    $BB24C2ED400A1348441C88FA4FCB4848 flags = self->_flags;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    *(unsigned char *)(v5 + 387) = self->_routeDeviatesFromOriginal;
    *(void *)(v5 + 388) |= 0x100uLL;
  }
  uint64_t v25 = [(NSData *)self->_directionsResponseID copyWithZone:a3];
  uint64_t v26 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v25;

  id v27 = [(GEOUUID *)self->_tripId copyWithZone:a3];
  unint64_t v28 = *(void **)(v5 + 336);
  *(void *)(v5 + 336) = v27;

  $BB24C2ED400A1348441C88FA4FCB4848 v29 = self->_flags;
  if ((*(unsigned char *)&v29 & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 385) = self->_isNavigable;
    *(void *)(v5 + 388) |= 0x40uLL;
    $BB24C2ED400A1348441C88FA4FCB4848 v29 = self->_flags;
  }
  if ((*(unsigned char *)&v29 & 2) != 0)
  {
    *(_DWORD *)(v5 + 364) = self->_instructionSignFillColor;
    *(void *)(v5 + 388) |= 2uLL;
  }
  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  uint64_t v30 = self->_incidentsOnRoutes;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v147 objects:v171 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v148;
    do
    {
      for (uint64_t m = 0; m != v31; ++m)
      {
        if (*(void *)v148 != v32) {
          objc_enumerationMutation(v30);
        }
        uint64_t v34 = (void *)[*(id *)(*((void *)&v147 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addIncidentsOnRoutes:v34];
      }
      uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v147 objects:v171 count:16];
    }
    while (v31);
  }

  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  unint64_t v35 = self->_incidentsOffRoutes;
  uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v143 objects:v170 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v144;
    do
    {
      for (uint64_t n = 0; n != v36; ++n)
      {
        if (*(void *)v144 != v37) {
          objc_enumerationMutation(v35);
        }
        uint64_t v39 = (void *)[*(id *)(*((void *)&v143 + 1) + 8 * n) copyWithZone:a3];
        [(id)v5 addIncidentsOffRoutes:v39];
      }
      uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v143 objects:v170 count:16];
    }
    while (v36);
  }

  unint64_t problemDetailsCount = self->_problemDetailsCount;
  if (problemDetailsCount)
  {
    -[GEODirectionsResponse _reserveProblemDetails:](v5, problemDetailsCount);
    memcpy(*(void **)(v5 + 24), self->_problemDetails, 12 * self->_problemDetailsCount);
    *(void *)(v5 + 32) = self->_problemDetailsCount;
  }
  PBRepeatedInt32Copy();
  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  unint64_t v41 = self->_serviceGaps;
  uint64_t v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v139 objects:v169 count:16];
  if (v42)
  {
    uint64_t v43 = *(void *)v140;
    do
    {
      for (iuint64_t i = 0; ii != v42; ++ii)
      {
        if (*(void *)v140 != v43) {
          objc_enumerationMutation(v41);
        }
        unint64_t v45 = (void *)[*(id *)(*((void *)&v139 + 1) + 8 * ii) copyWithZone:a3];
        [(id)v5 addServiceGap:v45];
      }
      uint64_t v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v139 objects:v169 count:16];
    }
    while (v42);
  }

  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 376) = self->_selectedRouteIndex;
    *(void *)(v5 + 388) |= 0x10uLL;
  }
  id v46 = [(GEOPBTransitRoutingIncidentMessage *)self->_transitIncidentMessage copyWithZone:a3];
  long long v47 = *(void **)(v5 + 312);
  *(void *)(v5 + 312) = v46;

  id v48 = [(GEORouteDisplayHints *)self->_displayHints copyWithZone:a3];
  unint64_t v49 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v48;

  id v50 = [(GEOStyleAttributes *)self->_styleAttributes copyWithZone:a3];
  long long v51 = *(void **)(v5 + 272);
  *(void *)(v5 + 272) = v50;

  uint64_t v52 = [(NSData *)self->_sessionState copyWithZone:a3];
  unint64_t v53 = *(void **)(v5 + 256);
  *(void *)(v5 + 256) = v52;

  id v54 = [(GEOAlert *)self->_failureAlert copyWithZone:a3];
  long long v55 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v54;

  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 368) = self->_liveRouteSavingsSeconds;
    *(void *)(v5 + 388) |= 4uLL;
  }
  id v56 = [(GEOPDDatasetABStatus *)self->_datasetAbStatus copyWithZone:a3];
  unint64_t v57 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v56;

  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  unint64_t v58 = self->_trafficCameras;
  uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v135 objects:v168 count:16];
  if (v59)
  {
    uint64_t v60 = *(void *)v136;
    do
    {
      for (juint64_t j = 0; jj != v59; ++jj)
      {
        if (*(void *)v136 != v60) {
          objc_enumerationMutation(v58);
        }
        unint64_t v62 = (void *)[*(id *)(*((void *)&v135 + 1) + 8 * jj) copyWithZone:a3];
        [(id)v5 addTrafficCamera:v62];
      }
      uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v135 objects:v168 count:16];
    }
    while (v59);
  }

  uint64_t v63 = [(NSData *)self->_nonRecommendedRoutesCache copyWithZone:a3];
  long long v64 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v63;

  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 386) = self->_isOfflineResponse;
    *(void *)(v5 + 388) |= 0x80uLL;
  }
  id v65 = [(GEOSnapScoreMetadata *)self->_snapScoreMetadataDebug copyWithZone:a3];
  uint64_t v66 = *(void **)(v5 + 264);
  *(void *)(v5 + 264) = v65;

  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 384) = self->_hasKhSegments;
    *(void *)(v5 + 388) |= 0x20uLL;
  }
  uint64_t v67 = [(NSString *)self->_debugData copyWithZone:a3];
  long long v68 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v67;

  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  long long v69 = self->_arrivalParameters;
  uint64_t v70 = [(NSMutableArray *)v69 countByEnumeratingWithState:&v131 objects:v167 count:16];
  if (v70)
  {
    uint64_t v71 = *(void *)v132;
    do
    {
      for (kuint64_t k = 0; kk != v70; ++kk)
      {
        if (*(void *)v132 != v71) {
          objc_enumerationMutation(v69);
        }
        long long v73 = (void *)[*(id *)(*((void *)&v131 + 1) + 8 * kk) copyWithZone:a3];
        [(id)v5 addArrivalParameters:v73];
      }
      uint64_t v70 = [(NSMutableArray *)v69 countByEnumeratingWithState:&v131 objects:v167 count:16];
    }
    while (v70);
  }

  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v74 = self->_trafficSignals;
  uint64_t v75 = [(NSMutableArray *)v74 countByEnumeratingWithState:&v127 objects:v166 count:16];
  if (v75)
  {
    uint64_t v76 = *(void *)v128;
    do
    {
      for (muint64_t m = 0; mm != v75; ++mm)
      {
        if (*(void *)v128 != v76) {
          objc_enumerationMutation(v74);
        }
        long long v78 = (void *)[*(id *)(*((void *)&v127 + 1) + 8 * mm) copyWithZone:a3];
        [(id)v5 addTrafficSignal:v78];
      }
      uint64_t v75 = [(NSMutableArray *)v74 countByEnumeratingWithState:&v127 objects:v166 count:16];
    }
    while (v75);
  }

  id v79 = [(GEOTransitRouteUpdateConfiguration *)self->_transitRouteUpdateConfiguration copyWithZone:a3];
  long long v80 = *(void **)(v5 + 328);
  *(void *)(v5 + 328) = v79;

  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v81 = self->_transitPaymentMethodSuggestions;
  uint64_t v82 = [(NSMutableArray *)v81 countByEnumeratingWithState:&v123 objects:v165 count:16];
  if (v82)
  {
    uint64_t v83 = *(void *)v124;
    do
    {
      for (nuint64_t n = 0; nn != v82; ++nn)
      {
        if (*(void *)v124 != v83) {
          objc_enumerationMutation(v81);
        }
        long long v85 = (void *)[*(id *)(*((void *)&v123 + 1) + 8 * nn) copyWithZone:a3];
        [(id)v5 addTransitPaymentMethodSuggestion:v85];
      }
      uint64_t v82 = [(NSMutableArray *)v81 countByEnumeratingWithState:&v123 objects:v165 count:16];
    }
    while (v82);
  }

  id v86 = [(GEODirectionsRequestResponseAnalyticsData *)self->_analyticData copyWithZone:a3];
  long long v87 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v86;

  id v88 = [(GEOAdvisoriesInfo *)self->_advisoriesInfo copyWithZone:a3];
  uint64_t v89 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v88;

  id v90 = [(GEOCommonResponseAttributes *)self->_responseAttributes copyWithZone:a3];
  long long v91 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v90;

  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v92 = self->_internalErrors;
  uint64_t v93 = [(NSMutableArray *)v92 countByEnumeratingWithState:&v119 objects:v164 count:16];
  if (v93)
  {
    uint64_t v94 = *(void *)v120;
    do
    {
      for (uint64_t i1 = 0; i1 != v93; ++i1)
      {
        if (*(void *)v120 != v94) {
          objc_enumerationMutation(v92);
        }
        long long v96 = (void *)[*(id *)(*((void *)&v119 + 1) + 8 * i1) copyWithZone:a3];
        [(id)v5 addInternalError:v96];
      }
      uint64_t v93 = [(NSMutableArray *)v92 countByEnumeratingWithState:&v119 objects:v164 count:16];
    }
    while (v93);
  }

  uint64_t v97 = [(NSString *)self->_serviceVersion copyWithZone:a3];
  long long v98 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = v97;

  uint64_t v99 = [(NSString *)self->_dataVersion copyWithZone:a3];
  long long v100 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v99;

  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v101 = self->_suggestedRoutes;
  uint64_t v102 = [(NSMutableArray *)v101 countByEnumeratingWithState:&v115 objects:v163 count:16];
  if (v102)
  {
    uint64_t v103 = *(void *)v116;
    do
    {
      for (uint64_t i2 = 0; i2 != v102; ++i2)
      {
        if (*(void *)v116 != v103) {
          objc_enumerationMutation(v101);
        }
        long long v105 = objc_msgSend(*(id *)(*((void *)&v115 + 1) + 8 * i2), "copyWithZone:", a3, (void)v115);
        [(id)v5 addSuggestedRoute:v105];
      }
      uint64_t v102 = [(NSMutableArray *)v101 countByEnumeratingWithState:&v115 objects:v163 count:16];
    }
    while (v102);
  }

  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v106 = *(void *)&self->_timepointUsed._type;
    *(_OWORD *)(v5 + 72) = *(_OWORD *)&self->_timepointUsed._currentUserTime;
    *(void *)(v5 + 88) = v106;
    *(void *)(v5 + 388) |= 1uLL;
  }
  id v107 = -[GEOTransitDecoderData copyWithZone:](self->_decoderData, "copyWithZone:", a3, (void)v115);
  long long v108 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v107;

  uint64_t v109 = [(NSString *)self->_transitDataVersion copyWithZone:a3];
  v110 = *(void **)(v5 + 304);
  *(void *)(v5 + 304) = v109;

  id v111 = [(GEOClientMetrics *)self->_clientMetrics copyWithZone:a3];
  uint64_t v112 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v111;

  id v113 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v113;
LABEL_110:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_135;
  }
  [(GEODirectionsResponse *)self readAll:1];
  [v4 readAll:1];
  if (self->_status != *((_DWORD *)v4 + 95)) {
    goto LABEL_135;
  }
  routes = self->_routes;
  if ((unint64_t)routes | *((void *)v4 + 29))
  {
    if (!-[NSMutableArray isEqual:](routes, "isEqual:")) {
      goto LABEL_135;
    }
  }
  waypointRoutes = self->_waypointRoutes;
  if ((unint64_t)waypointRoutes | *((void *)v4 + 43))
  {
    if (!-[NSMutableArray isEqual:](waypointRoutes, "isEqual:")) {
      goto LABEL_135;
    }
  }
  placeSearchResponses = self->_placeSearchResponses;
  if ((unint64_t)placeSearchResponses | *((void *)v4 + 27))
  {
    if (!-[NSMutableArray isEqual:](placeSearchResponses, "isEqual:")) {
      goto LABEL_135;
    }
  }
  $BB24C2ED400A1348441C88FA4FCB4848 flags = self->_flags;
  uint64_t v9 = *(void *)(v4 + 388);
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_localDistanceUnits != *((_DWORD *)v4 + 93)) {
      goto LABEL_135;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v9 & 0x100) == 0) {
      goto LABEL_135;
    }
    if (self->_routeDeviatesFromOriginal)
    {
      if (!v4[387]) {
        goto LABEL_135;
      }
    }
    else if (v4[387])
    {
      goto LABEL_135;
    }
  }
  else if ((v9 & 0x100) != 0)
  {
    goto LABEL_135;
  }
  directionsResponseID = self->_directionsResponseID;
  if ((unint64_t)directionsResponseID | *((void *)v4 + 20)
    && !-[NSData isEqual:](directionsResponseID, "isEqual:"))
  {
    goto LABEL_135;
  }
  tripId = self->_tripId;
  if ((unint64_t)tripId | *((void *)v4 + 42))
  {
    if (!-[GEOUUID isEqual:](tripId, "isEqual:")) {
      goto LABEL_135;
    }
  }
  $BB24C2ED400A1348441C88FA4FCB4848 v12 = self->_flags;
  uint64_t v13 = *(void *)(v4 + 388);
  if ((*(unsigned char *)&v12 & 0x40) != 0)
  {
    if ((v13 & 0x40) == 0) {
      goto LABEL_135;
    }
    if (self->_isNavigable)
    {
      if (!v4[385]) {
        goto LABEL_135;
      }
    }
    else if (v4[385])
    {
      goto LABEL_135;
    }
  }
  else if ((v13 & 0x40) != 0)
  {
    goto LABEL_135;
  }
  if ((*(unsigned char *)&v12 & 2) != 0)
  {
    if ((v13 & 2) == 0 || self->_instructionSignFillColor != *((_DWORD *)v4 + 91)) {
      goto LABEL_135;
    }
  }
  else if ((v13 & 2) != 0)
  {
    goto LABEL_135;
  }
  incidentsOnRoutes = self->_incidentsOnRoutes;
  if ((unint64_t)incidentsOnRoutes | *((void *)v4 + 24)
    && !-[NSMutableArray isEqual:](incidentsOnRoutes, "isEqual:"))
  {
    goto LABEL_135;
  }
  incidentsOffRoutes = self->_incidentsOffRoutes;
  if ((unint64_t)incidentsOffRoutes | *((void *)v4 + 23))
  {
    if (!-[NSMutableArray isEqual:](incidentsOffRoutes, "isEqual:")) {
      goto LABEL_135;
    }
  }
  unint64_t problemDetailsCount = self->_problemDetailsCount;
  if (problemDetailsCount != *((void *)v4 + 4)) {
    goto LABEL_135;
  }
  if (memcmp(self->_problemDetails, *((const void **)v4 + 3), 12 * problemDetailsCount)) {
    goto LABEL_135;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_135;
  }
  serviceGaps = self->_serviceGaps;
  if ((unint64_t)serviceGaps | *((void *)v4 + 30))
  {
    if (!-[NSMutableArray isEqual:](serviceGaps, "isEqual:")) {
      goto LABEL_135;
    }
  }
  uint64_t v18 = *(void *)(v4 + 388);
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((v18 & 0x10) == 0 || self->_selectedRouteIndex != *((_DWORD *)v4 + 94)) {
      goto LABEL_135;
    }
  }
  else if ((v18 & 0x10) != 0)
  {
    goto LABEL_135;
  }
  transitIncidentMessage = self->_transitIncidentMessage;
  if ((unint64_t)transitIncidentMessage | *((void *)v4 + 39)
    && !-[GEOPBTransitRoutingIncidentMessage isEqual:](transitIncidentMessage, "isEqual:"))
  {
    goto LABEL_135;
  }
  displayHints = self->_displayHints;
  if ((unint64_t)displayHints | *((void *)v4 + 21))
  {
    if (!-[GEORouteDisplayHints isEqual:](displayHints, "isEqual:")) {
      goto LABEL_135;
    }
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((void *)v4 + 34))
  {
    if (!-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:")) {
      goto LABEL_135;
    }
  }
  sessionState = self->_sessionState;
  if ((unint64_t)sessionState | *((void *)v4 + 32))
  {
    if (!-[NSData isEqual:](sessionState, "isEqual:")) {
      goto LABEL_135;
    }
  }
  failureAlert = self->_failureAlert;
  if ((unint64_t)failureAlert | *((void *)v4 + 22))
  {
    if (!-[GEOAlert isEqual:](failureAlert, "isEqual:")) {
      goto LABEL_135;
    }
  }
  uint64_t v24 = *(void *)(v4 + 388);
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((v24 & 4) == 0 || self->_liveRouteSavingsSeconds != *((_DWORD *)v4 + 92)) {
      goto LABEL_135;
    }
  }
  else if ((v24 & 4) != 0)
  {
    goto LABEL_135;
  }
  datasetAbStatus = self->_datasetAbStatus;
  if ((unint64_t)datasetAbStatus | *((void *)v4 + 17)
    && !-[GEOPDDatasetABStatus isEqual:](datasetAbStatus, "isEqual:"))
  {
    goto LABEL_135;
  }
  trafficCameras = self->_trafficCameras;
  if ((unint64_t)trafficCameras | *((void *)v4 + 36))
  {
    if (!-[NSMutableArray isEqual:](trafficCameras, "isEqual:")) {
      goto LABEL_135;
    }
  }
  nonRecommendedRoutesCache = self->_nonRecommendedRoutesCache;
  if ((unint64_t)nonRecommendedRoutesCache | *((void *)v4 + 26))
  {
    if (!-[NSData isEqual:](nonRecommendedRoutesCache, "isEqual:")) {
      goto LABEL_135;
    }
  }
  $BB24C2ED400A1348441C88FA4FCB4848 v28 = self->_flags;
  uint64_t v29 = *(void *)(v4 + 388);
  if ((*(unsigned char *)&v28 & 0x80) != 0)
  {
    if ((v29 & 0x80) == 0) {
      goto LABEL_135;
    }
    if (self->_isOfflineResponse)
    {
      if (!v4[386]) {
        goto LABEL_135;
      }
    }
    else if (v4[386])
    {
      goto LABEL_135;
    }
  }
  else if ((v29 & 0x80) != 0)
  {
    goto LABEL_135;
  }
  snapScoreMetadataDebug = self->_snapScoreMetadataDebug;
  if ((unint64_t)snapScoreMetadataDebug | *((void *)v4 + 33))
  {
    if (!-[GEOSnapScoreMetadata isEqual:](snapScoreMetadataDebug, "isEqual:")) {
      goto LABEL_135;
    }
    $BB24C2ED400A1348441C88FA4FCB4848 v28 = self->_flags;
    uint64_t v29 = *(void *)(v4 + 388);
  }
  if ((*(unsigned char *)&v28 & 0x20) != 0)
  {
    if ((v29 & 0x20) != 0)
    {
      if (self->_hasKhSegments)
      {
        if (!v4[384]) {
          goto LABEL_135;
        }
        goto LABEL_93;
      }
      if (!v4[384]) {
        goto LABEL_93;
      }
    }
LABEL_135:
    char v49 = 0;
    goto LABEL_136;
  }
  if ((v29 & 0x20) != 0) {
    goto LABEL_135;
  }
LABEL_93:
  debugData = self->_debugData;
  if ((unint64_t)debugData | *((void *)v4 + 18) && !-[NSString isEqual:](debugData, "isEqual:")) {
    goto LABEL_135;
  }
  arrivalParameters = self->_arrivalParameters;
  if ((unint64_t)arrivalParameters | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](arrivalParameters, "isEqual:")) {
      goto LABEL_135;
    }
  }
  trafficSignals = self->_trafficSignals;
  if ((unint64_t)trafficSignals | *((void *)v4 + 37))
  {
    if (!-[NSMutableArray isEqual:](trafficSignals, "isEqual:")) {
      goto LABEL_135;
    }
  }
  transitRouteUpdateConfiguratiouint64_t n = self->_transitRouteUpdateConfiguration;
  if ((unint64_t)transitRouteUpdateConfiguration | *((void *)v4 + 41))
  {
    if (!-[GEOTransitRouteUpdateConfiguration isEqual:](transitRouteUpdateConfiguration, "isEqual:")) {
      goto LABEL_135;
    }
  }
  transitPaymentMethodSuggestions = self->_transitPaymentMethodSuggestions;
  if ((unint64_t)transitPaymentMethodSuggestions | *((void *)v4 + 40))
  {
    if (!-[NSMutableArray isEqual:](transitPaymentMethodSuggestions, "isEqual:")) {
      goto LABEL_135;
    }
  }
  analyticData = self->_analyticData;
  if ((unint64_t)analyticData | *((void *)v4 + 13))
  {
    if (!-[GEODirectionsRequestResponseAnalyticsData isEqual:](analyticData, "isEqual:")) {
      goto LABEL_135;
    }
  }
  advisoriesInfo = self->_advisoriesInfo;
  if ((unint64_t)advisoriesInfo | *((void *)v4 + 12))
  {
    if (!-[GEOAdvisoriesInfo isEqual:](advisoriesInfo, "isEqual:")) {
      goto LABEL_135;
    }
  }
  responseAttributes = self->_responseAttributes;
  if ((unint64_t)responseAttributes | *((void *)v4 + 28))
  {
    if (!-[GEOCommonResponseAttributes isEqual:](responseAttributes, "isEqual:")) {
      goto LABEL_135;
    }
  }
  internalErrors = self->_internalErrors;
  if ((unint64_t)internalErrors | *((void *)v4 + 25))
  {
    if (!-[NSMutableArray isEqual:](internalErrors, "isEqual:")) {
      goto LABEL_135;
    }
  }
  serviceVersiouint64_t n = self->_serviceVersion;
  if ((unint64_t)serviceVersion | *((void *)v4 + 31))
  {
    if (!-[NSString isEqual:](serviceVersion, "isEqual:")) {
      goto LABEL_135;
    }
  }
  dataVersiouint64_t n = self->_dataVersion;
  if ((unint64_t)dataVersion | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](dataVersion, "isEqual:")) {
      goto LABEL_135;
    }
  }
  suggestedRoutes = self->_suggestedRoutes;
  if ((unint64_t)suggestedRoutes | *((void *)v4 + 35))
  {
    if (!-[NSMutableArray isEqual:](suggestedRoutes, "isEqual:")) {
      goto LABEL_135;
    }
  }
  uint64_t v43 = *(void *)(v4 + 388);
  if (*(unsigned char *)&self->_flags)
  {
    if ((v43 & 1) == 0) {
      goto LABEL_135;
    }
    BOOL v44 = *(void *)&self->_timepointUsed._currentUserTime == *((void *)v4 + 9)
       && *(void *)&self->_timepointUsed._time == *((void *)v4 + 10);
    if (!v44 || *(void *)&self->_timepointUsed._type != *((void *)v4 + 11)) {
      goto LABEL_135;
    }
  }
  else if (v43)
  {
    goto LABEL_135;
  }
  decoderData = self->_decoderData;
  if ((unint64_t)decoderData | *((void *)v4 + 19)
    && !-[GEOTransitDecoderData isEqual:](decoderData, "isEqual:"))
  {
    goto LABEL_135;
  }
  transitDataVersiouint64_t n = self->_transitDataVersion;
  if ((unint64_t)transitDataVersion | *((void *)v4 + 38))
  {
    if (!-[NSString isEqual:](transitDataVersion, "isEqual:")) {
      goto LABEL_135;
    }
  }
  clientMetrics = self->_clientMetrics;
  if ((unint64_t)clientMetrics | *((void *)v4 + 15)) {
    char v49 = -[GEOClientMetrics isEqual:](clientMetrics, "isEqual:");
  }
  else {
    char v49 = 1;
  }
LABEL_136:

  return v49;
}

- (unint64_t)hash
{
  [(GEODirectionsResponse *)self readAll:1];
  uint64_t status = self->_status;
  uint64_t v47 = [(NSMutableArray *)self->_routes hash];
  uint64_t v46 = [(NSMutableArray *)self->_waypointRoutes hash];
  uint64_t v45 = [(NSMutableArray *)self->_placeSearchResponses hash];
  $BB24C2ED400A1348441C88FA4FCB4848 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    uint64_t v44 = 2654435761 * self->_localDistanceUnits;
    if ((*(_WORD *)&flags & 0x100) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v44 = 0;
    if ((*(_WORD *)&flags & 0x100) != 0)
    {
LABEL_3:
      uint64_t v43 = 2654435761 * self->_routeDeviatesFromOriginal;
      goto LABEL_6;
    }
  }
  uint64_t v43 = 0;
LABEL_6:
  uint64_t v42 = [(NSData *)self->_directionsResponseID hash];
  unint64_t v41 = [(GEOUUID *)self->_tripId hash];
  $BB24C2ED400A1348441C88FA4FCB4848 v4 = self->_flags;
  if ((*(unsigned char *)&v4 & 0x40) != 0)
  {
    uint64_t v40 = 2654435761 * self->_isNavigable;
    if ((*(unsigned char *)&v4 & 2) != 0) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v40 = 0;
    if ((*(unsigned char *)&v4 & 2) != 0)
    {
LABEL_8:
      uint64_t v39 = 2654435761 * self->_instructionSignFillColor;
      goto LABEL_11;
    }
  }
  uint64_t v39 = 0;
LABEL_11:
  uint64_t v38 = [(NSMutableArray *)self->_incidentsOnRoutes hash];
  uint64_t v37 = [(NSMutableArray *)self->_incidentsOffRoutes hash];
  uint64_t v36 = PBHashBytes();
  uint64_t v35 = PBRepeatedInt32Hash();
  uint64_t v34 = [(NSMutableArray *)self->_serviceGaps hash];
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    uint64_t v33 = 2654435761 * self->_selectedRouteIndex;
  }
  else {
    uint64_t v33 = 0;
  }
  unint64_t v32 = [(GEOPBTransitRoutingIncidentMessage *)self->_transitIncidentMessage hash];
  unint64_t v31 = [(GEORouteDisplayHints *)self->_displayHints hash];
  unint64_t v30 = [(GEOStyleAttributes *)self->_styleAttributes hash];
  uint64_t v29 = [(NSData *)self->_sessionState hash];
  unint64_t v28 = [(GEOAlert *)self->_failureAlert hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v27 = 2654435761 * self->_liveRouteSavingsSeconds;
  }
  else {
    uint64_t v27 = 0;
  }
  unint64_t v26 = [(GEOPDDatasetABStatus *)self->_datasetAbStatus hash];
  uint64_t v25 = [(NSMutableArray *)self->_trafficCameras hash];
  uint64_t v24 = [(NSData *)self->_nonRecommendedRoutesCache hash];
  if ((*(unsigned char *)&self->_flags & 0x80) != 0) {
    uint64_t v23 = 2654435761 * self->_isOfflineResponse;
  }
  else {
    uint64_t v23 = 0;
  }
  unint64_t v22 = [(GEOSnapScoreMetadata *)self->_snapScoreMetadataDebug hash];
  if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
    uint64_t v21 = 2654435761 * self->_hasKhSegments;
  }
  else {
    uint64_t v21 = 0;
  }
  NSUInteger v20 = [(NSString *)self->_debugData hash];
  uint64_t v19 = [(NSMutableArray *)self->_arrivalParameters hash];
  uint64_t v18 = [(NSMutableArray *)self->_trafficSignals hash];
  unint64_t v17 = [(GEOTransitRouteUpdateConfiguration *)self->_transitRouteUpdateConfiguration hash];
  uint64_t v5 = [(NSMutableArray *)self->_transitPaymentMethodSuggestions hash];
  unint64_t v6 = [(GEODirectionsRequestResponseAnalyticsData *)self->_analyticData hash];
  unint64_t v7 = [(GEOAdvisoriesInfo *)self->_advisoriesInfo hash];
  unint64_t v8 = [(GEOCommonResponseAttributes *)self->_responseAttributes hash];
  uint64_t v9 = [(NSMutableArray *)self->_internalErrors hash];
  NSUInteger v10 = [(NSString *)self->_serviceVersion hash];
  NSUInteger v11 = [(NSString *)self->_dataVersion hash];
  uint64_t v12 = [(NSMutableArray *)self->_suggestedRoutes hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v13 = PBHashBytes();
  }
  else {
    uint64_t v13 = 0;
  }
  unint64_t v14 = v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ [(GEOTransitDecoderData *)self->_decoderData hash];
  NSUInteger v15 = v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ (2654435761 * status) ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v5 ^ v14 ^ [(NSString *)self->_transitDataVersion hash];
  return v15 ^ [(GEOClientMetrics *)self->_clientMetrics hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  $BB24C2ED400A1348441C88FA4FCB4848 v4 = (char *)a3;
  [v4 readAll:0];
  self->_uint64_t status = *((_DWORD *)v4 + 95);
  long long v146 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  id v5 = *((id *)v4 + 29);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v146 objects:v161 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v147;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v147 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEODirectionsResponse *)self addRoute:*(void *)(*((void *)&v146 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v146 objects:v161 count:16];
    }
    while (v7);
  }

  long long v144 = 0u;
  long long v145 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  id v10 = *((id *)v4 + 43);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v142 objects:v160 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v143;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v143 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEODirectionsResponse *)self addWaypointRoute:*(void *)(*((void *)&v142 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v142 objects:v160 count:16];
    }
    while (v12);
  }

  long long v140 = 0u;
  long long v141 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  id v15 = *((id *)v4 + 27);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v138 objects:v159 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v139;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v139 != v18) {
          objc_enumerationMutation(v15);
        }
        [(GEODirectionsResponse *)self addPlaceSearchResponse:*(void *)(*((void *)&v138 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v138 objects:v159 count:16];
    }
    while (v17);
  }

  uint64_t v20 = *(void *)(v4 + 388);
  if ((v20 & 8) != 0)
  {
    self->_localDistanceUnits = *((_DWORD *)v4 + 93);
    *(void *)&self->_flags |= 8uLL;
    uint64_t v20 = *(void *)(v4 + 388);
  }
  if ((v20 & 0x100) != 0)
  {
    self->_routeDeviatesFromOriginal = v4[387];
    *(void *)&self->_flags |= 0x100uLL;
  }
  if (*((void *)v4 + 20)) {
    -[GEODirectionsResponse setDirectionsResponseID:](self, "setDirectionsResponseID:");
  }
  tripId = self->_tripId;
  unint64_t v22 = (void *)*((void *)v4 + 42);
  if (tripId)
  {
    if (v22) {
      -[GEOUUID mergeFrom:]((uint64_t)tripId, v22);
    }
  }
  else if (v22)
  {
    [(GEODirectionsResponse *)self setTripId:*((void *)v4 + 42)];
  }
  uint64_t v23 = *(void *)(v4 + 388);
  if ((v23 & 0x40) != 0)
  {
    self->_isNavigable = v4[385];
    *(void *)&self->_flags |= 0x40uLL;
    uint64_t v23 = *(void *)(v4 + 388);
  }
  if ((v23 & 2) != 0)
  {
    self->_instructionSignFillColor = *((_DWORD *)v4 + 91);
    *(void *)&self->_flags |= 2uLL;
  }
  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  id v24 = *((id *)v4 + 24);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v134 objects:v158 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v135;
    do
    {
      for (uint64_t m = 0; m != v26; ++m)
      {
        if (*(void *)v135 != v27) {
          objc_enumerationMutation(v24);
        }
        [(GEODirectionsResponse *)self addIncidentsOnRoutes:*(void *)(*((void *)&v134 + 1) + 8 * m)];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v134 objects:v158 count:16];
    }
    while (v26);
  }

  long long v132 = 0u;
  long long v133 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  id v29 = *((id *)v4 + 23);
  uint64_t v30 = [v29 countByEnumeratingWithState:&v130 objects:v157 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v131;
    do
    {
      for (uint64_t n = 0; n != v31; ++n)
      {
        if (*(void *)v131 != v32) {
          objc_enumerationMutation(v29);
        }
        [(GEODirectionsResponse *)self addIncidentsOffRoutes:*(void *)(*((void *)&v130 + 1) + 8 * n)];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v130 objects:v157 count:16];
    }
    while (v31);
  }

  uint64_t v34 = [v4 problemDetailsCount];
  if (v34)
  {
    uint64_t v35 = v34;
    for (iuint64_t i = 0; ii != v35; ++ii)
    {
      uint64_t v37 = [v4 problemDetailAtIndex:ii];
      -[GEODirectionsResponse addProblemDetail:](self, "addProblemDetail:", v37, v38);
    }
  }
  uint64_t v39 = [v4 supportedTransportTypesCount];
  if (v39)
  {
    uint64_t v40 = v39;
    for (juint64_t j = 0; jj != v40; ++jj)
      -[GEODirectionsResponse addSupportedTransportType:](self, "addSupportedTransportType:", [v4 supportedTransportTypeAtIndex:jj]);
  }
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  id v42 = *((id *)v4 + 30);
  uint64_t v43 = [v42 countByEnumeratingWithState:&v126 objects:v156 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v127;
    do
    {
      for (kuint64_t k = 0; kk != v44; ++kk)
      {
        if (*(void *)v127 != v45) {
          objc_enumerationMutation(v42);
        }
        [(GEODirectionsResponse *)self addServiceGap:*(void *)(*((void *)&v126 + 1) + 8 * kk)];
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v126 objects:v156 count:16];
    }
    while (v44);
  }

  if ((v4[388] & 0x10) != 0)
  {
    self->_selectedRouteIndex = *((_DWORD *)v4 + 94);
    *(void *)&self->_flags |= 0x10uLL;
  }
  transitIncidentMessage = self->_transitIncidentMessage;
  id v48 = (void *)*((void *)v4 + 39);
  if (transitIncidentMessage)
  {
    if (v48) {
      -[GEOPBTransitRoutingIncidentMessage mergeFrom:]((uint64_t)transitIncidentMessage, v48);
    }
  }
  else if (v48)
  {
    [(GEODirectionsResponse *)self setTransitIncidentMessage:*((void *)v4 + 39)];
  }
  displayHints = self->_displayHints;
  uint64_t v50 = *((void *)v4 + 21);
  if (displayHints)
  {
    if (v50) {
      -[GEORouteDisplayHints mergeFrom:](displayHints, "mergeFrom:");
    }
  }
  else if (v50)
  {
    -[GEODirectionsResponse setDisplayHints:](self, "setDisplayHints:");
  }
  styleAttributes = self->_styleAttributes;
  uint64_t v52 = *((void *)v4 + 34);
  if (styleAttributes)
  {
    if (v52) {
      -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
    }
  }
  else if (v52)
  {
    -[GEODirectionsResponse setStyleAttributes:](self, "setStyleAttributes:");
  }
  if (*((void *)v4 + 32)) {
    -[GEODirectionsResponse setSessionState:](self, "setSessionState:");
  }
  failureAlert = self->_failureAlert;
  id v54 = (void *)*((void *)v4 + 22);
  if (failureAlert)
  {
    if (v54) {
      -[GEOAlert mergeFrom:]((uint64_t)failureAlert, v54);
    }
  }
  else if (v54)
  {
    [(GEODirectionsResponse *)self setFailureAlert:*((void *)v4 + 22)];
  }
  if ((v4[388] & 4) != 0)
  {
    self->_liveRouteSavingsSeconds = *((_DWORD *)v4 + 92);
    *(void *)&self->_flags |= 4uLL;
  }
  datasetAbStatus = self->_datasetAbStatus;
  uint64_t v56 = *((void *)v4 + 17);
  if (datasetAbStatus)
  {
    if (v56) {
      -[GEOPDDatasetABStatus mergeFrom:](datasetAbStatus, "mergeFrom:");
    }
  }
  else if (v56)
  {
    -[GEODirectionsResponse setDatasetAbStatus:](self, "setDatasetAbStatus:");
  }
  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id v57 = *((id *)v4 + 36);
  uint64_t v58 = [v57 countByEnumeratingWithState:&v122 objects:v155 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v123;
    do
    {
      for (muint64_t m = 0; mm != v59; ++mm)
      {
        if (*(void *)v123 != v60) {
          objc_enumerationMutation(v57);
        }
        [(GEODirectionsResponse *)self addTrafficCamera:*(void *)(*((void *)&v122 + 1) + 8 * mm)];
      }
      uint64_t v59 = [v57 countByEnumeratingWithState:&v122 objects:v155 count:16];
    }
    while (v59);
  }

  if (*((void *)v4 + 26)) {
    [(GEODirectionsResponse *)self setNonRecommendedRoutesCache:"setNonRecommendedRoutesCache:"];
  }
  if (v4[388] < 0)
  {
    self->_isOfflineResponse = v4[386];
    *(void *)&self->_flags |= 0x80uLL;
  }
  snapScoreMetadataDebug = self->_snapScoreMetadataDebug;
  uint64_t v63 = (void *)*((void *)v4 + 33);
  if (snapScoreMetadataDebug)
  {
    if (v63) {
      -[GEOSnapScoreMetadata mergeFrom:]((uint64_t)snapScoreMetadataDebug, v63);
    }
  }
  else if (v63)
  {
    [(GEODirectionsResponse *)self setSnapScoreMetadataDebug:*((void *)v4 + 33)];
  }
  if ((v4[388] & 0x20) != 0)
  {
    self->_hasKhSegments = v4[384];
    *(void *)&self->_flags |= 0x20uLL;
  }
  if (*((void *)v4 + 18)) {
    -[GEODirectionsResponse setDebugData:](self, "setDebugData:");
  }
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id v64 = *((id *)v4 + 14);
  uint64_t v65 = [v64 countByEnumeratingWithState:&v118 objects:v154 count:16];
  if (v65)
  {
    uint64_t v66 = v65;
    uint64_t v67 = *(void *)v119;
    do
    {
      for (nuint64_t n = 0; nn != v66; ++nn)
      {
        if (*(void *)v119 != v67) {
          objc_enumerationMutation(v64);
        }
        [(GEODirectionsResponse *)self addArrivalParameters:*(void *)(*((void *)&v118 + 1) + 8 * nn)];
      }
      uint64_t v66 = [v64 countByEnumeratingWithState:&v118 objects:v154 count:16];
    }
    while (v66);
  }

  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id v69 = *((id *)v4 + 37);
  uint64_t v70 = [v69 countByEnumeratingWithState:&v114 objects:v153 count:16];
  if (v70)
  {
    uint64_t v71 = v70;
    uint64_t v72 = *(void *)v115;
    do
    {
      for (uint64_t i1 = 0; i1 != v71; ++i1)
      {
        if (*(void *)v115 != v72) {
          objc_enumerationMutation(v69);
        }
        [(GEODirectionsResponse *)self addTrafficSignal:*(void *)(*((void *)&v114 + 1) + 8 * i1)];
      }
      uint64_t v71 = [v69 countByEnumeratingWithState:&v114 objects:v153 count:16];
    }
    while (v71);
  }

  transitRouteUpdateConfiguratiouint64_t n = self->_transitRouteUpdateConfiguration;
  uint64_t v75 = *((void *)v4 + 41);
  if (transitRouteUpdateConfiguration)
  {
    if (v75) {
      -[GEOTransitRouteUpdateConfiguration mergeFrom:](transitRouteUpdateConfiguration, "mergeFrom:");
    }
  }
  else if (v75)
  {
    [(GEODirectionsResponse *)self setTransitRouteUpdateConfiguration:"setTransitRouteUpdateConfiguration:"];
  }
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id v76 = *((id *)v4 + 40);
  uint64_t v77 = [v76 countByEnumeratingWithState:&v110 objects:v152 count:16];
  if (v77)
  {
    uint64_t v78 = v77;
    uint64_t v79 = *(void *)v111;
    do
    {
      for (uint64_t i2 = 0; i2 != v78; ++i2)
      {
        if (*(void *)v111 != v79) {
          objc_enumerationMutation(v76);
        }
        [(GEODirectionsResponse *)self addTransitPaymentMethodSuggestion:*(void *)(*((void *)&v110 + 1) + 8 * i2)];
      }
      uint64_t v78 = [v76 countByEnumeratingWithState:&v110 objects:v152 count:16];
    }
    while (v78);
  }

  analyticData = self->_analyticData;
  uint64_t v82 = *((void *)v4 + 13);
  if (analyticData)
  {
    if (v82) {
      -[GEODirectionsRequestResponseAnalyticsData mergeFrom:](analyticData, "mergeFrom:");
    }
  }
  else if (v82)
  {
    -[GEODirectionsResponse setAnalyticData:](self, "setAnalyticData:");
  }
  advisoriesInfo = self->_advisoriesInfo;
  uint64_t v84 = *((void *)v4 + 12);
  if (advisoriesInfo)
  {
    if (v84) {
      -[GEOAdvisoriesInfo mergeFrom:](advisoriesInfo, "mergeFrom:");
    }
  }
  else if (v84)
  {
    -[GEODirectionsResponse setAdvisoriesInfo:](self, "setAdvisoriesInfo:");
  }
  responseAttributes = self->_responseAttributes;
  uint64_t v86 = *((void *)v4 + 28);
  if (responseAttributes)
  {
    if (v86) {
      -[GEOCommonResponseAttributes mergeFrom:](responseAttributes, "mergeFrom:");
    }
  }
  else if (v86)
  {
    -[GEODirectionsResponse setResponseAttributes:](self, "setResponseAttributes:");
  }
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v87 = *((id *)v4 + 25);
  uint64_t v88 = [v87 countByEnumeratingWithState:&v106 objects:v151 count:16];
  if (v88)
  {
    uint64_t v89 = v88;
    uint64_t v90 = *(void *)v107;
    do
    {
      for (uint64_t i3 = 0; i3 != v89; ++i3)
      {
        if (*(void *)v107 != v90) {
          objc_enumerationMutation(v87);
        }
        [(GEODirectionsResponse *)self addInternalError:*(void *)(*((void *)&v106 + 1) + 8 * i3)];
      }
      uint64_t v89 = [v87 countByEnumeratingWithState:&v106 objects:v151 count:16];
    }
    while (v89);
  }

  if (*((void *)v4 + 31)) {
    -[GEODirectionsResponse setServiceVersion:](self, "setServiceVersion:");
  }
  if (*((void *)v4 + 16)) {
    -[GEODirectionsResponse setDataVersion:](self, "setDataVersion:");
  }
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id v92 = *((id *)v4 + 35);
  uint64_t v93 = [v92 countByEnumeratingWithState:&v102 objects:v150 count:16];
  if (v93)
  {
    uint64_t v94 = v93;
    uint64_t v95 = *(void *)v103;
    do
    {
      for (uint64_t i4 = 0; i4 != v94; ++i4)
      {
        if (*(void *)v103 != v95) {
          objc_enumerationMutation(v92);
        }
        -[GEODirectionsResponse addSuggestedRoute:](self, "addSuggestedRoute:", *(void *)(*((void *)&v102 + 1) + 8 * i4), (void)v102);
      }
      uint64_t v94 = [v92 countByEnumeratingWithState:&v102 objects:v150 count:16];
    }
    while (v94);
  }

  if (v4[388])
  {
    uint64_t v97 = *((void *)v4 + 11);
    *(_OWORD *)&self->_timepointUsed._currentUserTime = *(_OWORD *)(v4 + 72);
    *(void *)&self->_timepointUsed._type = v97;
    *(void *)&self->_flags |= 1uLL;
  }
  decoderData = self->_decoderData;
  uint64_t v99 = *((void *)v4 + 19);
  if (decoderData)
  {
    if (v99) {
      -[GEOTransitDecoderData mergeFrom:](decoderData, "mergeFrom:");
    }
  }
  else if (v99)
  {
    -[GEODirectionsResponse setDecoderData:](self, "setDecoderData:");
  }
  if (*((void *)v4 + 38)) {
    -[GEODirectionsResponse setTransitDataVersion:](self, "setTransitDataVersion:");
  }
  clientMetrics = self->_clientMetrics;
  uint64_t v101 = *((void *)v4 + 15);
  if (clientMetrics)
  {
    if (v101) {
      -[GEOClientMetrics mergeFrom:](clientMetrics, "mergeFrom:");
    }
  }
  else if (v101)
  {
    -[GEODirectionsResponse setClientMetrics:](self, "setClientMetrics:");
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
      id v5 = reader;
      objc_sync_enter(v5);
      GEODirectionsResponseReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_854);
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
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000000200uLL;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEODirectionsResponse *)self readAll:0];
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    uint64_t v7 = self->_routes;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v104 objects:v118 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v105;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v105 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v104 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v104 objects:v118 count:16];
      }
      while (v9);
    }

    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    uint64_t v12 = self->_waypointRoutes;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v100 objects:v117 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v101;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v101 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v100 + 1) + 8 * v16++) clearUnknownFields:1];
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v100 objects:v117 count:16];
      }
      while (v14);
    }

    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    uint64_t v17 = self->_placeSearchResponses;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v96 objects:v116 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v97;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v97 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v96 + 1) + 8 * v21++) clearUnknownFields:1];
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v96 objects:v116 count:16];
      }
      while (v19);
    }

    tripId = self->_tripId;
    if (tripId)
    {
      uint64_t v23 = tripId->_unknownFields;
      tripId->_unknownFields = 0;
    }
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v24 = self->_incidentsOnRoutes;
    uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v92 objects:v115 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v93;
      do
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v93 != v27) {
            objc_enumerationMutation(v24);
          }
          [*(id *)(*((void *)&v92 + 1) + 8 * v28++) clearUnknownFields:1];
        }
        while (v26 != v28);
        uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v92 objects:v115 count:16];
      }
      while (v26);
    }

    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v29 = self->_incidentsOffRoutes;
    uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v88 objects:v114 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v89;
      do
      {
        uint64_t v33 = 0;
        do
        {
          if (*(void *)v89 != v32) {
            objc_enumerationMutation(v29);
          }
          [*(id *)(*((void *)&v88 + 1) + 8 * v33++) clearUnknownFields:1];
        }
        while (v31 != v33);
        uint64_t v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v88 objects:v114 count:16];
      }
      while (v31);
    }

    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    uint64_t v34 = self->_serviceGaps;
    uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v84 objects:v113 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v85;
      do
      {
        uint64_t v38 = 0;
        do
        {
          if (*(void *)v85 != v37) {
            objc_enumerationMutation(v34);
          }
          [*(id *)(*((void *)&v84 + 1) + 8 * v38++) clearUnknownFields:1];
        }
        while (v36 != v38);
        uint64_t v36 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v84 objects:v113 count:16];
      }
      while (v36);
    }

    -[GEOPBTransitRoutingIncidentMessage clearUnknownFields:]((uint64_t)self->_transitIncidentMessage, 1);
    [(GEORouteDisplayHints *)self->_displayHints clearUnknownFields:1];
    [(GEOStyleAttributes *)self->_styleAttributes clearUnknownFields:1];
    -[GEOAlert clearUnknownFields:]((uint64_t)self->_failureAlert, 1);
    [(GEOPDDatasetABStatus *)self->_datasetAbStatus clearUnknownFields:1];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    uint64_t v39 = self->_trafficCameras;
    uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v80 objects:v112 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v81;
      do
      {
        uint64_t v43 = 0;
        do
        {
          if (*(void *)v81 != v42) {
            objc_enumerationMutation(v39);
          }
          [*(id *)(*((void *)&v80 + 1) + 8 * v43++) clearUnknownFields:1];
        }
        while (v41 != v43);
        uint64_t v41 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v80 objects:v112 count:16];
      }
      while (v41);
    }

    -[GEOSnapScoreMetadata clearUnknownFields:]((uint64_t)self->_snapScoreMetadataDebug, 1);
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    uint64_t v44 = self->_arrivalParameters;
    uint64_t v45 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v76 objects:v111 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v77;
      do
      {
        uint64_t v48 = 0;
        do
        {
          if (*(void *)v77 != v47) {
            objc_enumerationMutation(v44);
          }
          [*(id *)(*((void *)&v76 + 1) + 8 * v48++) clearUnknownFields:1];
        }
        while (v46 != v48);
        uint64_t v46 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v76 objects:v111 count:16];
      }
      while (v46);
    }

    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    char v49 = self->_trafficSignals;
    uint64_t v50 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v72 objects:v110 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v73;
      do
      {
        uint64_t v53 = 0;
        do
        {
          if (*(void *)v73 != v52) {
            objc_enumerationMutation(v49);
          }
          [*(id *)(*((void *)&v72 + 1) + 8 * v53++) clearUnknownFields:1];
        }
        while (v51 != v53);
        uint64_t v51 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v72 objects:v110 count:16];
      }
      while (v51);
    }

    [(GEOTransitRouteUpdateConfiguration *)self->_transitRouteUpdateConfiguration clearUnknownFields:1];
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v54 = self->_transitPaymentMethodSuggestions;
    uint64_t v55 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v68 objects:v109 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v69;
      do
      {
        uint64_t v58 = 0;
        do
        {
          if (*(void *)v69 != v57) {
            objc_enumerationMutation(v54);
          }
          [*(id *)(*((void *)&v68 + 1) + 8 * v58++) clearUnknownFields:1];
        }
        while (v56 != v58);
        uint64_t v56 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v68 objects:v109 count:16];
      }
      while (v56);
    }

    [(GEODirectionsRequestResponseAnalyticsData *)self->_analyticData clearUnknownFields:1];
    [(GEOAdvisoriesInfo *)self->_advisoriesInfo clearUnknownFields:1];
    [(GEOCommonResponseAttributes *)self->_responseAttributes clearUnknownFields:1];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    uint64_t v59 = self->_suggestedRoutes;
    uint64_t v60 = [(NSMutableArray *)v59 countByEnumeratingWithState:&v64 objects:v108 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = *(void *)v65;
      do
      {
        uint64_t v63 = 0;
        do
        {
          if (*(void *)v65 != v62) {
            objc_enumerationMutation(v59);
          }
          objc_msgSend(*(id *)(*((void *)&v64 + 1) + 8 * v63++), "clearUnknownFields:", 1, (void)v64);
        }
        while (v61 != v63);
        uint64_t v61 = [(NSMutableArray *)v59 countByEnumeratingWithState:&v64 objects:v108 count:16];
      }
      while (v61);
    }

    [(GEOTransitDecoderData *)self->_decoderData clearUnknownFields:1];
    [(GEOClientMetrics *)self->_clientMetrics clearUnknownFields:1];
  }
}

- (void)_readClientMetrics
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(unsigned char *)(a1 + 389) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientMetrics_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasClientMetrics
{
  return self->_clientMetrics != 0;
}

- (GEOClientMetrics)clientMetrics
{
  -[GEODirectionsResponse _readClientMetrics]((uint64_t)self);
  clientMetrics = self->_clientMetrics;

  return clientMetrics;
}

- (void)setClientMetrics:(id)a3
{
  *(void *)&self->_flags |= 0x100000008000uLL;
  objc_storeStrong((id *)&self->_clientMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointRoutes, 0);
  objc_storeStrong((id *)&self->_tripId, 0);
  objc_storeStrong((id *)&self->_transitRouteUpdateConfiguration, 0);
  objc_storeStrong((id *)&self->_transitPaymentMethodSuggestions, 0);
  objc_storeStrong((id *)&self->_transitIncidentMessage, 0);
  objc_storeStrong((id *)&self->_transitDataVersion, 0);
  objc_storeStrong((id *)&self->_trafficSignals, 0);
  objc_storeStrong((id *)&self->_trafficCameras, 0);
  objc_storeStrong((id *)&self->_suggestedRoutes, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_snapScoreMetadataDebug, 0);
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_storeStrong((id *)&self->_serviceVersion, 0);
  objc_storeStrong((id *)&self->_serviceGaps, 0);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_responseAttributes, 0);
  objc_storeStrong((id *)&self->_placeSearchResponses, 0);
  objc_storeStrong((id *)&self->_nonRecommendedRoutesCache, 0);
  objc_storeStrong((id *)&self->_internalErrors, 0);
  objc_storeStrong((id *)&self->_incidentsOnRoutes, 0);
  objc_storeStrong((id *)&self->_incidentsOffRoutes, 0);
  objc_storeStrong((id *)&self->_failureAlert, 0);
  objc_storeStrong((id *)&self->_displayHints, 0);
  objc_storeStrong((id *)&self->_directionsResponseID, 0);
  objc_storeStrong((id *)&self->_decoderData, 0);
  objc_storeStrong((id *)&self->_debugData, 0);
  objc_storeStrong((id *)&self->_datasetAbStatus, 0);
  objc_storeStrong((id *)&self->_dataVersion, 0);
  objc_storeStrong((id *)&self->_clientMetrics, 0);
  objc_storeStrong((id *)&self->_arrivalParameters, 0);
  objc_storeStrong((id *)&self->_analyticData, 0);
  objc_storeStrong((id *)&self->_advisoriesInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)clearLocations
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v2 = [(GEODirectionsResponse *)self routes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * v6);
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        uint64_t v8 = objc_msgSend(v7, "guidanceEvents", 0);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v14;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v14 != v11) {
                objc_enumerationMutation(v8);
              }
              [*(id *)(*((void *)&v13 + 1) + 8 * v12++) setSpokenGuidance:0];
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }
}

- (id)preJupiterCompatibleDirectionsResponseWithRoute:(id)a3
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 usesZilch])
  {
LABEL_8:
    long long v13 = self;
    goto LABEL_63;
  }
  unint64_t v5 = [v4 indexInResponse];
  uint64_t v6 = [(GEODirectionsResponse *)self waypointRoutes];
  unint64_t v7 = [v6 count];

  if (v5 >= v7)
  {
    long long v14 = GEOGetCompanionExtrasLog_0();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = [v4 indexInResponse];
      long long v16 = [(GEODirectionsResponse *)self waypointRoutes];
      *(_DWORD *)buf = 67109376;
      int v125 = v15;
      __int16 v126 = 1024;
      int v127 = [v16 count];
      _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_ERROR, "Error creating backwards compatible directions response. Route's indexInResponse (%d) is greater than the number of routes in response (%d). Returning original response.", buf, 0xEu);
    }
    goto LABEL_8;
  }
  uint64_t v8 = [(GEODirectionsResponse *)self waypointRoutes];
  uint64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "indexInResponse"));

  long long v100 = v9;
  uint64_t v10 = [v9 routeLegs];
  uint64_t v11 = [v10 firstObject];
  uint64_t v12 = [v11 zilchPoints];

  if (v12)
  {
    long long v13 = self;
  }
  else
  {
    long long v99 = (GEODirectionsResponse *)[(GEODirectionsResponse *)self copy];
    long long v17 = [(GEODirectionsResponse *)v99 waypointRoutes];
    long long v18 = objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v4, "indexInResponse"));

    long long v19 = [v18 routeLegs];
    uint64_t v20 = [v19 count];
    uint64_t v21 = [v4 legs];
    uint64_t v22 = [v21 count];

    if (v20 != v22)
    {
      uint64_t v23 = GEOGetCompanionExtrasLog_0();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = [v18 routeLegs];
        int v25 = [v24 count];
        uint64_t v26 = [v4 legs];
        *(_DWORD *)buf = 67109376;
        int v125 = v25;
        __int16 v126 = 1024;
        int v127 = [v26 count];
        _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_ERROR, "Error creating backwards compatible directions response. Legs count mismatch in directions response (%d legs) and route (%d legs). Attempting to continue anyway like.", buf, 0xEu);
      }
    }
    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    uint64_t v27 = [v18 routeLegs];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v117 objects:v123 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = 0;
      uint64_t v31 = *(void *)v118;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v118 != v31) {
            objc_enumerationMutation(v27);
          }
          uint64_t v33 = [*(id *)(*((void *)&v117 + 1) + 8 * i) steps];
          v30 += [v33 count];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v117 objects:v123 count:16];
      }
      while (v29);
    }
    else
    {
      uint64_t v30 = 0;
    }

    uint64_t v34 = [v4 steps];
    uint64_t v35 = [v34 count];

    if (v30 != v35)
    {
      uint64_t v36 = GEOGetCompanionExtrasLog_0();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        uint64_t v37 = [v4 steps];
        int v38 = [v37 count];
        *(_DWORD *)buf = 67109376;
        int v125 = v30;
        __int16 v126 = 1024;
        int v127 = v38;
        _os_log_impl(&dword_188D96000, v36, OS_LOG_TYPE_ERROR, "Error creating backwards compatible directions response. Steps count mismatch in directions response (%d steps) and route (%d steps). Attempting to continue anyway.", buf, 0xEu);
      }
    }
    uint64_t v39 = [v18 routeLegs];
    uint64_t v40 = [v39 count];

    if (v40)
    {
      uint64_t v107 = 0;
      uint64_t v108 = 0;
      unint64_t v41 = 0;
      long long v101 = v18;
      do
      {
        uint64_t v42 = [v18 routeLegs];
        uint64_t v43 = [v42 objectAtIndexedSubscript:v41];

        uint64_t v44 = [v4 legs];
        unint64_t v45 = [v44 count];

        if (v41 < v45)
        {
          uint64_t v46 = [v4 legs];
          unint64_t v104 = v41;
          uint64_t v47 = [v46 objectAtIndexedSubscript:v41];

          long long v103 = v47;
          uint64_t v48 = [v47 pointCount];
          char v49 = (char *)malloc_type_malloc(16 * v48, 0x852E71A1uLL);
          uint64_t v50 = v49;
          if (v48)
          {
            uint64_t v51 = v49 + 8;
            uint64_t v52 = v107;
            uint64_t v53 = v48;
            do
            {
              [v4 pointAt:v52];
              *(v51 - 1) = v54;
              *uint64_t v51 = v55;
              v51 += 2;
              ++v52;
              --v53;
            }
            while (v53);
          }
          uint64_t v105 = v48;
          long long v102 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v50 length:16 * v48 freeWhenDone:1];
          objc_msgSend(v43, "setUnpackedLatLngVertices:");
          [v43 setBasicPoints:0];
          uint64_t v56 = [v43 steps];
          uint64_t v57 = [v56 count];

          if (v57)
          {
            unint64_t v58 = 0;
            unsigned int v106 = v48 - 1;
            do
            {
              uint64_t v59 = [v43 steps];
              uint64_t v60 = [v59 objectAtIndexedSubscript:v58];

              uint64_t v61 = [v4 steps];
              unint64_t v62 = [v61 count];

              if (v58 + v108 < v62)
              {
                uint64_t v63 = [v4 steps];
                long long v64 = [v63 objectAtIndexedSubscript:v58 + v108];

                [v64 distance];
                *(float *)&double v65 = v65;
                [v60 setDistanceMeters:v65];
                [v64 distance];
                LODWORD(v67) = vcvtad_u64_f64(v66);
                [v60 setDistance:v67];
                uint64_t v68 = [v64 maneuverStartRouteCoordinate];
                LODWORD(v69) = HIDWORD(v68);
                int v70 = vcvtas_u32_f32((float)v68 + *((float *)&v68 + 1));
                if (*((float *)&v68 + 1) < 0.0) {
                  int v70 = -1;
                }
                objc_msgSend(v60, "setManeuverStartZilchIndex:", (v70 - v107), v69);
                uint64_t v71 = [v64 endRouteCoordinate];
                LODWORD(v72) = HIDWORD(v71);
                int v73 = vcvtas_u32_f32((float)v71 + *((float *)&v71 + 1));
                if (*((float *)&v71 + 1) < 0.0) {
                  int v73 = -1;
                }
                objc_msgSend(v60, "setManeuverEndZilchIndex:", (v73 - v107), v72);
                long long v74 = [v43 steps];
                uint64_t v75 = [v74 count] - 1;

                if (v58 == v75) {
                  [v60 setManeuverEndZilchIndex:v106];
                }
                objc_msgSend(v4, "distanceFromStartToRouteCoordinate:", objc_msgSend(v64, "endRouteCoordinate"));
                double v77 = v76;
                long long v113 = 0u;
                long long v114 = 0u;
                long long v115 = 0u;
                long long v116 = 0u;
                long long v78 = [v60 guidanceEvents];
                uint64_t v79 = [v78 countByEnumeratingWithState:&v113 objects:v122 count:16];
                if (v79)
                {
                  uint64_t v80 = v79;
                  uint64_t v81 = *(void *)v114;
                  do
                  {
                    for (uint64_t j = 0; j != v80; ++j)
                    {
                      if (*(void *)v114 != v81) {
                        objc_enumerationMutation(v78);
                      }
                      long long v83 = *(void **)(*((void *)&v113 + 1) + 8 * j);
                      LODWORD(v84) = vcvtpd_s64_f64(v77 - (float)[v83 startValidDistanceOffsetCm]* 0.01);
                      [v83 setStartValidDistance:v84];
                      LODWORD(v85) = vcvtmd_s64_f64(v77 - (float)[v83 endValidDistanceOffsetCm]* 0.01);
                      [v83 setEndValidDistance:v85];
                      if ([v83 hasDistanceReferenceEndpointOffsetCm])
                      {
                        LODWORD(v86) = llround(v77+ (float)[v83 distanceReferenceEndpointOffsetCm]* -0.01);
                        [v83 setOffsetForDistanceString:v86];
                      }
                      objc_msgSend(v83, "setDistanceZilchIndex:", objc_msgSend(v60, "maneuverEndZilchIndex"));
                    }
                    uint64_t v80 = [v78 countByEnumeratingWithState:&v113 objects:v122 count:16];
                  }
                  while (v80);
                }
              }
              ++v58;
              long long v87 = [v43 steps];
              unint64_t v88 = [v87 count];
            }
            while (v58 < v88);
          }
          long long v111 = 0u;
          long long v112 = 0u;
          long long v109 = 0u;
          long long v110 = 0u;
          long long v89 = [v43 guidanceEvents];
          uint64_t v90 = [v89 countByEnumeratingWithState:&v109 objects:v121 count:16];
          long long v18 = v101;
          if (v90)
          {
            uint64_t v91 = v90;
            uint64_t v92 = *(void *)v110;
            do
            {
              for (uint64_t k = 0; k != v91; ++k)
              {
                if (*(void *)v110 != v92) {
                  objc_enumerationMutation(v89);
                }
                long long v94 = *(void **)(*((void *)&v109 + 1) + 8 * k);
                objc_msgSend(v94, "setStartValidDistance:", (int)((float)objc_msgSend(v94, "endValidDistanceOffsetCm") * 0.01));
                objc_msgSend(v94, "setEndValidDistance:", (int)((float)objc_msgSend(v94, "startValidDistanceOffsetCm") * 0.01));
                [v94 setDistanceZilchIndex:(v105 - 1)];
              }
              uint64_t v91 = [v89 countByEnumeratingWithState:&v109 objects:v121 count:16];
            }
            while (v91);
          }

          v107 += v105;
          long long v95 = [v43 steps];
          v108 += [v95 count];

          unint64_t v41 = v104;
        }

        ++v41;
        long long v96 = [v18 routeLegs];
        unint64_t v97 = [v96 count];
      }
      while (v41 < v97);
    }

    long long v13 = v99;
  }

LABEL_63:

  return v13;
}

- (void)_clearJupiterFieldsForTesting
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obuint64_t j = [(GEODirectionsResponse *)self waypointRoutes];
  uint64_t v26 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v49;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v49 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v2;
        uint64_t v3 = *(void **)(*((void *)&v48 + 1) + 8 * v2);
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v28 = [v3 routeLegs];
        uint64_t v30 = [v28 countByEnumeratingWithState:&v44 objects:v55 count:16];
        if (v30)
        {
          uint64_t v29 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v30; ++i)
            {
              if (*(void *)v45 != v29) {
                objc_enumerationMutation(v28);
              }
              unint64_t v5 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              [v5 setPathLeg:0];
              long long v42 = 0u;
              long long v43 = 0u;
              long long v40 = 0u;
              long long v41 = 0u;
              uint64_t v31 = v5;
              uint64_t v6 = [v5 steps];
              uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v54 count:16];
              if (v7)
              {
                uint64_t v8 = v7;
                uint64_t v9 = *(void *)v41;
                do
                {
                  for (uint64_t j = 0; j != v8; ++j)
                  {
                    if (*(void *)v41 != v9) {
                      objc_enumerationMutation(v6);
                    }
                    uint64_t v11 = *(void **)(*((void *)&v40 + 1) + 8 * j);
                    [v11 setDistanceCm:0];
                    [v11 setHasDistanceCm:0];
                    [v11 setManeuverStartPointOffsetCm:0];
                    [v11 setHasManeuverStartPointOffsetCm:0];
                    long long v38 = 0u;
                    long long v39 = 0u;
                    long long v36 = 0u;
                    long long v37 = 0u;
                    uint64_t v12 = [v11 guidanceEvents];
                    uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v53 count:16];
                    if (v13)
                    {
                      uint64_t v14 = v13;
                      uint64_t v15 = *(void *)v37;
                      do
                      {
                        for (uint64_t k = 0; k != v14; ++k)
                        {
                          if (*(void *)v37 != v15) {
                            objc_enumerationMutation(v12);
                          }
                          long long v17 = *(void **)(*((void *)&v36 + 1) + 8 * k);
                          [v17 setStartValidDistanceOffsetCm:0];
                          [v17 setHasStartValidDistanceOffsetCm:0];
                          [v17 setEndValidDistanceOffsetCm:0];
                          [v17 setHasEndValidDistanceOffsetCm:0];
                          [v17 setDistanceReferenceEndpointOffsetCm:0];
                          [v17 setHasDistanceReferenceEndpointOffsetCm:0];
                        }
                        uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v53 count:16];
                      }
                      while (v14);
                    }
                  }
                  uint64_t v8 = [v6 countByEnumeratingWithState:&v40 objects:v54 count:16];
                }
                while (v8);
              }

              long long v34 = 0u;
              long long v35 = 0u;
              long long v32 = 0u;
              long long v33 = 0u;
              long long v18 = [v31 guidanceEvents];
              uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v52 count:16];
              if (v19)
              {
                uint64_t v20 = v19;
                uint64_t v21 = *(void *)v33;
                do
                {
                  for (uint64_t m = 0; m != v20; ++m)
                  {
                    if (*(void *)v33 != v21) {
                      objc_enumerationMutation(v18);
                    }
                    uint64_t v23 = *(void **)(*((void *)&v32 + 1) + 8 * m);
                    [v23 setStartValidDistanceOffsetCm:0];
                    [v23 setHasStartValidDistanceOffsetCm:0];
                    [v23 setEndValidDistanceOffsetCm:0];
                    [v23 setHasEndValidDistanceOffsetCm:0];
                    [v23 setDistanceReferenceEndpointOffsetCm:0];
                    [v23 setHasDistanceReferenceEndpointOffsetCm:0];
                  }
                  uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v52 count:16];
                }
                while (v20);
              }
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v44 objects:v55 count:16];
          }
          while (v30);
        }

        uint64_t v2 = v27 + 1;
      }
      while (v27 + 1 != v26);
      uint64_t v26 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v26);
  }
}

@end