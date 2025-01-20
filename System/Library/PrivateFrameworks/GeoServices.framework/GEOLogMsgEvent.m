@interface GEOLogMsgEvent
+ (BOOL)isValid:(id)a3;
+ (Class)logMsgStateType;
- (BOOL)hasAnalyticTag;
- (BOOL)hasArSessionUsage;
- (BOOL)hasBatchTrafficProbeCollection;
- (BOOL)hasClientAcSuggestions;
- (BOOL)hasCommuteWindow;
- (BOOL)hasCuratedCollectionStats;
- (BOOL)hasCuratedCollectionUsage;
- (BOOL)hasDailyUseSummary;
- (BOOL)hasDeviceSyncStatus;
- (BOOL)hasDirectionsEvent;
- (BOOL)hasDirectionsRequestDetails;
- (BOOL)hasDisplayAnalytic;
- (BOOL)hasEvRoutingVehicleDetails;
- (BOOL)hasEvTrip;
- (BOOL)hasEventType;
- (BOOL)hasFullNavTrace;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasGridDuration;
- (BOOL)hasHardStop;
- (BOOL)hasImpressionEvent;
- (BOOL)hasListInteractionSession;
- (BOOL)hasLogDiscard;
- (BOOL)hasMapKitCounts;
- (BOOL)hasMapLaunchEvent;
- (BOOL)hasMapsDeviceSettings;
- (BOOL)hasMapsEngagement;
- (BOOL)hasMapsEnvironment;
- (BOOL)hasMapsInteraction;
- (BOOL)hasMapsWidgetsInteractionSession;
- (BOOL)hasMarcoLiteUsage;
- (BOOL)hasNetworkEvent;
- (BOOL)hasNetworkEventSummary;
- (BOOL)hasNetworkSelectionHarvest;
- (BOOL)hasParkedCar;
- (BOOL)hasPeriodicSettingsSummary;
- (BOOL)hasPlaceCacheLookup;
- (BOOL)hasPlaceDataCacheEvent;
- (BOOL)hasPoiBusynessData;
- (BOOL)hasPredExTrainingData;
- (BOOL)hasPressureData;
- (BOOL)hasProactiveSuggestionInteractionSessionEvent;
- (BOOL)hasRealtimeTrafficProbeCollection;
- (BOOL)hasRefineSearchSession;
- (BOOL)hasRideBookedSession;
- (BOOL)hasRideBookingSession;
- (BOOL)hasServiceMetadata;
- (BOOL)hasShowcaseSuppression;
- (BOOL)hasStateTimingEvent;
- (BOOL)hasTableBookedSession;
- (BOOL)hasTableBookingSession;
- (BOOL)hasTelemetric;
- (BOOL)hasThermalPressure;
- (BOOL)hasThrottleEvent;
- (BOOL)hasTileCacheAnalytic;
- (BOOL)hasTileSetStateEvent;
- (BOOL)hasTimeToLeaveHypothesisEvent;
- (BOOL)hasTimeToLeaveInitialTravelTimeEvent;
- (BOOL)hasTransitAppLaunchEvent;
- (BOOL)hasTripDepartureFeedback;
- (BOOL)hasUsageEventTime;
- (BOOL)hasUserActionEvent;
- (BOOL)hasVlfUsage;
- (BOOL)hasWifiConnectionQualityProbeEvent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEvent)init;
- (GEOLogMsgEvent)initWithData:(id)a3;
- (GEOLogMsgEvent)initWithDictionary:(id)a3;
- (GEOLogMsgEvent)initWithJSON:(id)a3;
- (GEOLogMsgEventARSessionUsage)arSessionUsage;
- (GEOLogMsgEventBatchTrafficProbe)batchTrafficProbeCollection;
- (GEOLogMsgEventClientACSuggestions)clientAcSuggestions;
- (GEOLogMsgEventCommuteWindow)commuteWindow;
- (GEOLogMsgEventCuratedCollectionStats)curatedCollectionStats;
- (GEOLogMsgEventCuratedCollectionUsage)curatedCollectionUsage;
- (GEOLogMsgEventDailyUseSummary)dailyUseSummary;
- (GEOLogMsgEventDeviceSyncStatus)deviceSyncStatus;
- (GEOLogMsgEventDirections)directionsEvent;
- (GEOLogMsgEventDirectionsRequestDetails)directionsRequestDetails;
- (GEOLogMsgEventDisplayAnalytic)displayAnalytic;
- (GEOLogMsgEventEVRoutingVehicleDetails)evRoutingVehicleDetails;
- (GEOLogMsgEventEVTrip)evTrip;
- (GEOLogMsgEventFullNavTrace)fullNavTrace;
- (GEOLogMsgEventGridDuration)gridDuration;
- (GEOLogMsgEventHardStop)hardStop;
- (GEOLogMsgEventId)analyticTag;
- (GEOLogMsgEventImpressionEvent)impressionEvent;
- (GEOLogMsgEventListInteractionSession)listInteractionSession;
- (GEOLogMsgEventLogDiscard)logDiscard;
- (GEOLogMsgEventMapKitCounts)mapKitCounts;
- (GEOLogMsgEventMapLaunch)mapLaunchEvent;
- (GEOLogMsgEventMapsDeviceSettings)mapsDeviceSettings;
- (GEOLogMsgEventMapsEngagement)mapsEngagement;
- (GEOLogMsgEventMapsInteraction)mapsInteraction;
- (GEOLogMsgEventMapsWidgetsInteractionSession)mapsWidgetsInteractionSession;
- (GEOLogMsgEventMarcoLiteUsage)marcoLiteUsage;
- (GEOLogMsgEventNetwork)networkEvent;
- (GEOLogMsgEventNetworkEventSummary)networkEventSummary;
- (GEOLogMsgEventNetworkSelectionHarvest)networkSelectionHarvest;
- (GEOLogMsgEventPOIBusynessData)poiBusynessData;
- (GEOLogMsgEventParkedCar)parkedCar;
- (GEOLogMsgEventPeriodicSettingsSummary)periodicSettingsSummary;
- (GEOLogMsgEventPlaceCacheLookup)placeCacheLookup;
- (GEOLogMsgEventPlaceDataCache)placeDataCacheEvent;
- (GEOLogMsgEventPredExTrainingData)predExTrainingData;
- (GEOLogMsgEventPressureData)pressureData;
- (GEOLogMsgEventProactiveSuggestionInteractionSession)proactiveSuggestionInteractionSessionEvent;
- (GEOLogMsgEventRealtimeTrafficProbe)realtimeTrafficProbeCollection;
- (GEOLogMsgEventRefineSearchSession)refineSearchSession;
- (GEOLogMsgEventRideBookedSession)rideBookedSession;
- (GEOLogMsgEventRideBookingSession)rideBookingSession;
- (GEOLogMsgEventServiceMetadata)serviceMetadata;
- (GEOLogMsgEventShowcaseSuppression)showcaseSuppression;
- (GEOLogMsgEventStateTiming)stateTimingEvent;
- (GEOLogMsgEventTableBookedSession)tableBookedSession;
- (GEOLogMsgEventTableBookingSession)tableBookingSession;
- (GEOLogMsgEventTelemetric)telemetric;
- (GEOLogMsgEventThermalPressure)thermalPressure;
- (GEOLogMsgEventThrottle)throttleEvent;
- (GEOLogMsgEventTileCacheAnalytic)tileCacheAnalytic;
- (GEOLogMsgEventTileSetState)tileSetStateEvent;
- (GEOLogMsgEventTimeToLeaveHypothesis)timeToLeaveHypothesisEvent;
- (GEOLogMsgEventTimeToLeaveInitialTravelTime)timeToLeaveInitialTravelTimeEvent;
- (GEOLogMsgEventTransitAppLaunch)transitAppLaunchEvent;
- (GEOLogMsgEventTripDepartureFeedback)tripDepartureFeedback;
- (GEOLogMsgEventUserAction)userActionEvent;
- (GEOLogMsgEventVLFUsage)vlfUsage;
- (GEOLogMsgEventWifiConnectionQualityProbe)wifiConnectionQualityProbeEvent;
- (NSMutableArray)logMsgStates;
- (NSString)mapsEnvironment;
- (double)usageEventTime;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventTypeAsString:(int)a3;
- (id)jsonRepresentation;
- (id)logMsgStateAtIndex:(unint64_t)a3;
- (int)StringAsEventType:(id)a3;
- (int)eventType;
- (unint64_t)hash;
- (unint64_t)logMsgStatesCount;
- (void)_addNoFlagsLogMsgState:(uint64_t)a1;
- (void)_readAnalyticTag;
- (void)_readArSessionUsage;
- (void)_readBatchTrafficProbeCollection;
- (void)_readClientAcSuggestions;
- (void)_readCommuteWindow;
- (void)_readCuratedCollectionStats;
- (void)_readCuratedCollectionUsage;
- (void)_readDailyUseSummary;
- (void)_readDeviceSyncStatus;
- (void)_readDirectionsEvent;
- (void)_readDirectionsRequestDetails;
- (void)_readDisplayAnalytic;
- (void)_readEvRoutingVehicleDetails;
- (void)_readEvTrip;
- (void)_readFullNavTrace;
- (void)_readGridDuration;
- (void)_readHardStop;
- (void)_readImpressionEvent;
- (void)_readListInteractionSession;
- (void)_readLogDiscard;
- (void)_readLogMsgStates;
- (void)_readMapKitCounts;
- (void)_readMapLaunchEvent;
- (void)_readMapsDeviceSettings;
- (void)_readMapsEngagement;
- (void)_readMapsEnvironment;
- (void)_readMapsInteraction;
- (void)_readMapsWidgetsInteractionSession;
- (void)_readMarcoLiteUsage;
- (void)_readNetworkEvent;
- (void)_readNetworkEventSummary;
- (void)_readNetworkSelectionHarvest;
- (void)_readParkedCar;
- (void)_readPeriodicSettingsSummary;
- (void)_readPlaceCacheLookup;
- (void)_readPlaceDataCacheEvent;
- (void)_readPoiBusynessData;
- (void)_readPredExTrainingData;
- (void)_readPressureData;
- (void)_readProactiveSuggestionInteractionSessionEvent;
- (void)_readRealtimeTrafficProbeCollection;
- (void)_readRefineSearchSession;
- (void)_readRideBookedSession;
- (void)_readRideBookingSession;
- (void)_readServiceMetadata;
- (void)_readShowcaseSuppression;
- (void)_readStateTimingEvent;
- (void)_readTableBookedSession;
- (void)_readTableBookingSession;
- (void)_readTelemetric;
- (void)_readThermalPressure;
- (void)_readThrottleEvent;
- (void)_readTileCacheAnalytic;
- (void)_readTileSetStateEvent;
- (void)_readTimeToLeaveHypothesisEvent;
- (void)_readTimeToLeaveInitialTravelTimeEvent;
- (void)_readTransitAppLaunchEvent;
- (void)_readTripDepartureFeedback;
- (void)_readUserActionEvent;
- (void)_readVlfUsage;
- (void)_readWifiConnectionQualityProbeEvent;
- (void)addLogMsgState:(id)a3;
- (void)clearLogMsgStates;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAnalyticTag:(id)a3;
- (void)setArSessionUsage:(id)a3;
- (void)setBatchTrafficProbeCollection:(id)a3;
- (void)setClientAcSuggestions:(id)a3;
- (void)setCommuteWindow:(id)a3;
- (void)setCuratedCollectionStats:(id)a3;
- (void)setCuratedCollectionUsage:(id)a3;
- (void)setDailyUseSummary:(id)a3;
- (void)setDeviceSyncStatus:(id)a3;
- (void)setDirectionsEvent:(id)a3;
- (void)setDirectionsRequestDetails:(id)a3;
- (void)setDisplayAnalytic:(id)a3;
- (void)setEvRoutingVehicleDetails:(id)a3;
- (void)setEvTrip:(id)a3;
- (void)setEventType:(int)a3;
- (void)setFullNavTrace:(id)a3;
- (void)setGridDuration:(id)a3;
- (void)setHardStop:(id)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)setHasUsageEventTime:(BOOL)a3;
- (void)setImpressionEvent:(id)a3;
- (void)setListInteractionSession:(id)a3;
- (void)setLogDiscard:(id)a3;
- (void)setLogMsgStates:(id)a3;
- (void)setMapKitCounts:(id)a3;
- (void)setMapLaunchEvent:(id)a3;
- (void)setMapsDeviceSettings:(id)a3;
- (void)setMapsEngagement:(id)a3;
- (void)setMapsEnvironment:(id)a3;
- (void)setMapsInteraction:(id)a3;
- (void)setMapsWidgetsInteractionSession:(id)a3;
- (void)setMarcoLiteUsage:(id)a3;
- (void)setNetworkEvent:(id)a3;
- (void)setNetworkEventSummary:(id)a3;
- (void)setNetworkSelectionHarvest:(id)a3;
- (void)setParkedCar:(id)a3;
- (void)setPeriodicSettingsSummary:(id)a3;
- (void)setPlaceCacheLookup:(id)a3;
- (void)setPlaceDataCacheEvent:(id)a3;
- (void)setPoiBusynessData:(id)a3;
- (void)setPredExTrainingData:(id)a3;
- (void)setPressureData:(id)a3;
- (void)setProactiveSuggestionInteractionSessionEvent:(id)a3;
- (void)setRealtimeTrafficProbeCollection:(id)a3;
- (void)setRefineSearchSession:(id)a3;
- (void)setRideBookedSession:(id)a3;
- (void)setRideBookingSession:(id)a3;
- (void)setServiceMetadata:(id)a3;
- (void)setShowcaseSuppression:(id)a3;
- (void)setStateTimingEvent:(id)a3;
- (void)setTableBookedSession:(id)a3;
- (void)setTableBookingSession:(id)a3;
- (void)setTelemetric:(id)a3;
- (void)setThermalPressure:(id)a3;
- (void)setThrottleEvent:(id)a3;
- (void)setTileCacheAnalytic:(id)a3;
- (void)setTileSetStateEvent:(id)a3;
- (void)setTimeToLeaveHypothesisEvent:(id)a3;
- (void)setTimeToLeaveInitialTravelTimeEvent:(id)a3;
- (void)setTransitAppLaunchEvent:(id)a3;
- (void)setTripDepartureFeedback:(id)a3;
- (void)setUsageEventTime:(double)a3;
- (void)setUserActionEvent:(id)a3;
- (void)setVlfUsage:(id)a3;
- (void)setWifiConnectionQualityProbeEvent:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEvent

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (NSMutableArray)logMsgStates
{
  -[GEOLogMsgEvent _readLogMsgStates]((uint64_t)self);
  logMsgStates = self->_logMsgStates;

  return logMsgStates;
}

- (void)addLogMsgState:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEvent _readLogMsgStates]((uint64_t)self);
  -[GEOLogMsgEvent _addNoFlagsLogMsgState:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x8000000000000000;
}

- (void)_readLogMsgStates
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 530) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLogMsgStates_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (void)_addNoFlagsLogMsgState:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 176);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 176);
      *(void *)(a1 + 176) = v5;

      id v4 = *(void **)(a1 + 176);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (GEOLogMsgEventWifiConnectionQualityProbe)wifiConnectionQualityProbeEvent
{
  -[GEOLogMsgEvent _readWifiConnectionQualityProbeEvent]((uint64_t)self);
  wifiConnectionQualityProbeEvent = self->_wifiConnectionQualityProbeEvent;

  return wifiConnectionQualityProbeEvent;
}

- (BOOL)hasWifiConnectionQualityProbeEvent
{
  return self->_wifiConnectionQualityProbeEvent != 0;
}

- (void)_readWifiConnectionQualityProbeEvent
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 535) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWifiConnectionQualityProbeEvent_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasDirectionsEvent
{
  return self->_directionsEvent != 0;
}

- (GEOLogMsgEventDirections)directionsEvent
{
  -[GEOLogMsgEvent _readDirectionsEvent]((uint64_t)self);
  directionsEvent = self->_directionsEvent;

  return directionsEvent;
}

- (void)_readDirectionsEvent
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 529) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsEvent_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (GEOLogMsgEventUserAction)userActionEvent
{
  -[GEOLogMsgEvent _readUserActionEvent]((uint64_t)self);
  userActionEvent = self->_userActionEvent;

  return userActionEvent;
}

- (void)_readUserActionEvent
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 535) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserActionEvent_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (int)eventType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $6A63E7CDA14C5D1C599C38C8531A0EC3 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 2) != 0) {
    return self->_eventType;
  }
  else {
    return 0;
  }
}

- (void)setEventType:(int)a3
{
  *(void *)&self->_flags |= 0x8000000000000002;
  self->_eventType = a3;
}

- (void)setUserActionEvent:(id)a3
{
  *(void *)&self->_flags |= 0x9000000000000000;
  objc_storeStrong((id *)&self->_userActionEvent, a3);
}

- (GEOLogMsgEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEvent;
  v2 = [(GEOLogMsgEvent *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventMapsEngagement)mapsEngagement
{
  -[GEOLogMsgEvent _readMapsEngagement]((uint64_t)self);
  mapsEngagement = self->_mapsEngagement;

  return mapsEngagement;
}

- (void)_readMapsEngagement
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 531) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsEngagement_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (void)setMapsEngagement:(id)a3
{
  *(void *)&self->_flags |= 0x8000000004000000;
  objc_storeStrong((id *)&self->_mapsEngagement, a3);
}

- (GEOLogMsgEventEVTrip)evTrip
{
  -[GEOLogMsgEvent _readEvTrip]((uint64_t)self);
  evTrip = self->_evTrip;

  return evTrip;
}

- (void)_readEvTrip
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 529) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEvTrip_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiConnectionQualityProbeEvent, 0);
  objc_storeStrong((id *)&self->_vlfUsage, 0);
  objc_storeStrong((id *)&self->_userActionEvent, 0);
  objc_storeStrong((id *)&self->_tripDepartureFeedback, 0);
  objc_storeStrong((id *)&self->_transitAppLaunchEvent, 0);
  objc_storeStrong((id *)&self->_timeToLeaveInitialTravelTimeEvent, 0);
  objc_storeStrong((id *)&self->_timeToLeaveHypothesisEvent, 0);
  objc_storeStrong((id *)&self->_tileSetStateEvent, 0);
  objc_storeStrong((id *)&self->_tileCacheAnalytic, 0);
  objc_storeStrong((id *)&self->_throttleEvent, 0);
  objc_storeStrong((id *)&self->_thermalPressure, 0);
  objc_storeStrong((id *)&self->_telemetric, 0);
  objc_storeStrong((id *)&self->_tableBookingSession, 0);
  objc_storeStrong((id *)&self->_tableBookedSession, 0);
  objc_storeStrong((id *)&self->_stateTimingEvent, 0);
  objc_storeStrong((id *)&self->_showcaseSuppression, 0);
  objc_storeStrong((id *)&self->_serviceMetadata, 0);
  objc_storeStrong((id *)&self->_rideBookingSession, 0);
  objc_storeStrong((id *)&self->_rideBookedSession, 0);
  objc_storeStrong((id *)&self->_refineSearchSession, 0);
  objc_storeStrong((id *)&self->_realtimeTrafficProbeCollection, 0);
  objc_storeStrong((id *)&self->_proactiveSuggestionInteractionSessionEvent, 0);
  objc_storeStrong((id *)&self->_pressureData, 0);
  objc_storeStrong((id *)&self->_predExTrainingData, 0);
  objc_storeStrong((id *)&self->_poiBusynessData, 0);
  objc_storeStrong((id *)&self->_placeDataCacheEvent, 0);
  objc_storeStrong((id *)&self->_placeCacheLookup, 0);
  objc_storeStrong((id *)&self->_periodicSettingsSummary, 0);
  objc_storeStrong((id *)&self->_parkedCar, 0);
  objc_storeStrong((id *)&self->_networkSelectionHarvest, 0);
  objc_storeStrong((id *)&self->_networkEvent, 0);
  objc_storeStrong((id *)&self->_networkEventSummary, 0);
  objc_storeStrong((id *)&self->_marcoLiteUsage, 0);
  objc_storeStrong((id *)&self->_mapsWidgetsInteractionSession, 0);
  objc_storeStrong((id *)&self->_mapsInteraction, 0);
  objc_storeStrong((id *)&self->_mapsEnvironment, 0);
  objc_storeStrong((id *)&self->_mapsEngagement, 0);
  objc_storeStrong((id *)&self->_mapsDeviceSettings, 0);
  objc_storeStrong((id *)&self->_mapLaunchEvent, 0);
  objc_storeStrong((id *)&self->_mapKitCounts, 0);
  objc_storeStrong((id *)&self->_logMsgStates, 0);
  objc_storeStrong((id *)&self->_logDiscard, 0);
  objc_storeStrong((id *)&self->_listInteractionSession, 0);
  objc_storeStrong((id *)&self->_impressionEvent, 0);
  objc_storeStrong((id *)&self->_hardStop, 0);
  objc_storeStrong((id *)&self->_gridDuration, 0);
  objc_storeStrong((id *)&self->_fullNavTrace, 0);
  objc_storeStrong((id *)&self->_evTrip, 0);
  objc_storeStrong((id *)&self->_evRoutingVehicleDetails, 0);
  objc_storeStrong((id *)&self->_displayAnalytic, 0);
  objc_storeStrong((id *)&self->_directionsRequestDetails, 0);
  objc_storeStrong((id *)&self->_directionsEvent, 0);
  objc_storeStrong((id *)&self->_deviceSyncStatus, 0);
  objc_storeStrong((id *)&self->_dailyUseSummary, 0);
  objc_storeStrong((id *)&self->_curatedCollectionUsage, 0);
  objc_storeStrong((id *)&self->_curatedCollectionStats, 0);
  objc_storeStrong((id *)&self->_commuteWindow, 0);
  objc_storeStrong((id *)&self->_clientAcSuggestions, 0);
  objc_storeStrong((id *)&self->_batchTrafficProbeCollection, 0);
  objc_storeStrong((id *)&self->_arSessionUsage, 0);
  objc_storeStrong((id *)&self->_analyticTag, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)_readPressureData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 533) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPressureData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (void)setArSessionUsage:(id)a3
{
  *(void *)&self->_flags |= 0x8000000000000008;
  objc_storeStrong((id *)&self->_arSessionUsage, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLogMsgEventIsDirty((uint64_t)self) & 1) == 0)
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgEvent *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_logMsgStates;
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

    if (self->_analyticTag) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapsEnvironment) {
      PBDataWriterWriteStringField();
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_userActionEvent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_stateTimingEvent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_tileSetStateEvent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_placeDataCacheEvent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_networkEvent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_directionsEvent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_transitAppLaunchEvent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_timeToLeaveHypothesisEvent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_timeToLeaveInitialTravelTimeEvent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapsWidgetsInteractionSession) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_listInteractionSession) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_refineSearchSession) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_proactiveSuggestionInteractionSessionEvent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapLaunchEvent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_rideBookingSession) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_rideBookedSession) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_tableBookingSession) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_tableBookedSession) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_fullNavTrace) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_telemetric) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_clientAcSuggestions) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_realtimeTrafficProbeCollection) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_batchTrafficProbeCollection) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_commuteWindow) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_wifiConnectionQualityProbeEvent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_parkedCar) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_tileCacheAnalytic) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_gridDuration) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_displayAnalytic) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_throttleEvent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapKitCounts) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_predExTrainingData) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_marcoLiteUsage) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_tripDepartureFeedback) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_directionsRequestDetails) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_evRoutingVehicleDetails) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_evTrip) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_curatedCollectionStats) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_curatedCollectionUsage) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapsDeviceSettings) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_hardStop) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_vlfUsage) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_logDiscard) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_dailyUseSummary) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_pressureData) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_poiBusynessData) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_periodicSettingsSummary) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_thermalPressure) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_arSessionUsage) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_networkSelectionHarvest) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_impressionEvent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_showcaseSuppression) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_placeCacheLookup) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_deviceSyncStatus) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapsInteraction) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_networkEventSummary) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_serviceMetadata) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapsEngagement) {
      PBDataWriterWriteSubmessage();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteDoubleField();
    }
  }
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_1231;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_1232;
    }
    GEOLogMsgEventReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLogMsgEventCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (BOOL)hasLogDiscard
{
  return self->_logDiscard != 0;
}

- (void)_readLogDiscard
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 530) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLogDiscard_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (void)_readCuratedCollectionUsage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 529) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCuratedCollectionUsage_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (GEOLogMsgEventCuratedCollectionStats)curatedCollectionStats
{
  -[GEOLogMsgEvent _readCuratedCollectionStats]((uint64_t)self);
  curatedCollectionStats = self->_curatedCollectionStats;

  return curatedCollectionStats;
}

- (void)_readCuratedCollectionStats
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 528) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCuratedCollectionStats_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (void)_readVlfUsage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 535) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVlfUsage_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (void)_readThermalPressure
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 534) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readThermalPressure_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v327 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_637;
  }
  a1 = (id)[a1 init];

  if (!a1) {
    goto LABEL_637;
  }
  if (a3) {
    objc_super v6 = @"logMsgState";
  }
  else {
    objc_super v6 = @"log_msg_state";
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v321 = v5;
    long long v324 = 0u;
    long long v325 = 0u;
    long long v322 = 0u;
    long long v323 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v322 objects:v326 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v323;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v323 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v322 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v14 = [GEOLogMsgState alloc];
            if (a3) {
              uint64_t v15 = [(GEOLogMsgState *)v14 initWithJSON:v13];
            }
            else {
              uint64_t v15 = [(GEOLogMsgState *)v14 initWithDictionary:v13];
            }
            v16 = (void *)v15;
            [a1 addLogMsgState:v15];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v322 objects:v326 count:16];
      }
      while (v10);
    }

    id v5 = v321;
  }

  if (a3) {
    uint64_t v17 = @"analyticTag";
  }
  else {
    uint64_t v17 = @"analytic_tag";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = [GEOLogMsgEventId alloc];
    if (a3) {
      uint64_t v20 = [(GEOLogMsgEventId *)v19 initWithJSON:v18];
    }
    else {
      uint64_t v20 = [(GEOLogMsgEventId *)v19 initWithDictionary:v18];
    }
    v21 = (void *)v20;
    [a1 setAnalyticTag:v20];
  }
  if (a3) {
    v22 = @"mapsEnvironment";
  }
  else {
    v22 = @"maps_environment";
  }
  v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v24 = (void *)[v23 copy];
    [a1 setMapsEnvironment:v24];
  }
  if (a3) {
    v25 = @"eventType";
  }
  else {
    v25 = @"event_type";
  }
  v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v27 = v26;
    if ([v27 isEqualToString:@"LOG_MSG_EVENT_TYPE_UNKNOWN"])
    {
      uint64_t v28 = 0;
    }
    else if ([v27 isEqualToString:@"USER_ACTION"])
    {
      uint64_t v28 = 1;
    }
    else if ([v27 isEqualToString:@"STATE_TIMING"])
    {
      uint64_t v28 = 2;
    }
    else if ([v27 isEqualToString:@"TILE_SET_STATE"])
    {
      uint64_t v28 = 4;
    }
    else if ([v27 isEqualToString:@"PLACE_DATA_CACHE"])
    {
      uint64_t v28 = 5;
    }
    else if ([v27 isEqualToString:@"NETWORK"])
    {
      uint64_t v28 = 6;
    }
    else if ([v27 isEqualToString:@"CACHE_HIT"])
    {
      uint64_t v28 = 7;
    }
    else if ([v27 isEqualToString:@"DIRECTIONS"])
    {
      uint64_t v28 = 8;
    }
    else if ([v27 isEqualToString:@"TRANSIT_APP_LAUNCH"])
    {
      uint64_t v28 = 9;
    }
    else if ([v27 isEqualToString:@"TIME_TO_LEAVE_HYPOTHESIS"])
    {
      uint64_t v28 = 10;
    }
    else if ([v27 isEqualToString:@"TIME_TO_LEAVE_INITIAL_TRAVEL_TIME"])
    {
      uint64_t v28 = 11;
    }
    else if ([v27 isEqualToString:@"LOG_FRAMEWORK"])
    {
      uint64_t v28 = 12;
    }
    else if ([v27 isEqualToString:@"MAPS_WIDGETS_SESSION"])
    {
      uint64_t v28 = 13;
    }
    else if ([v27 isEqualToString:@"LIST_INTERACTION_SESSION"])
    {
      uint64_t v28 = 14;
    }
    else if ([v27 isEqualToString:@"REFINE_SEARCH_SESSION"])
    {
      uint64_t v28 = 15;
    }
    else if ([v27 isEqualToString:@"PROACTIVE_SUGGESTION_SESSION"])
    {
      uint64_t v28 = 16;
    }
    else if ([v27 isEqualToString:@"MAP_LAUNCH"])
    {
      uint64_t v28 = 17;
    }
    else if ([v27 isEqualToString:@"RIDE_BOOKING_SESSION"])
    {
      uint64_t v28 = 18;
    }
    else if ([v27 isEqualToString:@"RIDE_BOOKED_SESSION"])
    {
      uint64_t v28 = 19;
    }
    else if ([v27 isEqualToString:@"TABLE_BOOKING_SESSION"])
    {
      uint64_t v28 = 20;
    }
    else if ([v27 isEqualToString:@"TABLE_BOOKED_SESSION"])
    {
      uint64_t v28 = 21;
    }
    else if ([v27 isEqualToString:@"STALE_RESOURCE"])
    {
      uint64_t v28 = 22;
    }
    else if ([v27 isEqualToString:@"FULL_NAV_TRACE"])
    {
      uint64_t v28 = 23;
    }
    else if ([v27 isEqualToString:@"TELEMETRIC"])
    {
      uint64_t v28 = 24;
    }
    else if ([v27 isEqualToString:@"CLIENT_AC_SUGGESTIONS"])
    {
      uint64_t v28 = 25;
    }
    else if ([v27 isEqualToString:@"REALTIME_TRAFFIC_PROBE_COLLECTION"])
    {
      uint64_t v28 = 26;
    }
    else if ([v27 isEqualToString:@"BATCH_TRAFFIC_PROBE_COLLECTION"])
    {
      uint64_t v28 = 27;
    }
    else if ([v27 isEqualToString:@"OFFLINE_REQUEST_RESPONSE"])
    {
      uint64_t v28 = 28;
    }
    else if ([v27 isEqualToString:@"COMMUTE_WINDOW"])
    {
      uint64_t v28 = 29;
    }
    else if ([v27 isEqualToString:@"GENERIC_APP_ERROR"])
    {
      uint64_t v28 = 30;
    }
    else if ([v27 isEqualToString:@"WIFI_CONNECTION_QUALITY_PROBE"])
    {
      uint64_t v28 = 31;
    }
    else if ([v27 isEqualToString:@"PARKED_CAR"])
    {
      uint64_t v28 = 32;
    }
    else if ([v27 isEqualToString:@"TILE_CACHE_ANALYTIC"])
    {
      uint64_t v28 = 33;
    }
    else if ([v27 isEqualToString:@"GRID_DURATION"])
    {
      uint64_t v28 = 34;
    }
    else if ([v27 isEqualToString:@"DISPLAY_ANALYTIC"])
    {
      uint64_t v28 = 35;
    }
    else if ([v27 isEqualToString:@"THROTTLE"])
    {
      uint64_t v28 = 36;
    }
    else if ([v27 isEqualToString:@"MAP_KIT_COUNTS"])
    {
      uint64_t v28 = 37;
    }
    else if ([v27 isEqualToString:@"PRED_EX_TRAINING"])
    {
      uint64_t v28 = 38;
    }
    else if ([v27 isEqualToString:@"MARCOLITE_USAGE"])
    {
      uint64_t v28 = 39;
    }
    else if ([v27 isEqualToString:@"TRIP_DEPARTURE"])
    {
      uint64_t v28 = 40;
    }
    else if ([v27 isEqualToString:@"DIRECTIONS_REQUEST_DETAILS"])
    {
      uint64_t v28 = 41;
    }
    else if ([v27 isEqualToString:@"EV_ROUTING_VEHICLE_DETAILS"])
    {
      uint64_t v28 = 42;
    }
    else if ([v27 isEqualToString:@"EV_TRIP"])
    {
      uint64_t v28 = 43;
    }
    else if ([v27 isEqualToString:@"CURATED_COLLECTION_STATS"])
    {
      uint64_t v28 = 44;
    }
    else if ([v27 isEqualToString:@"CURATED_COLLECTION_USAGE"])
    {
      uint64_t v28 = 45;
    }
    else if ([v27 isEqualToString:@"MAPS_DEVICE_SETTINGS"])
    {
      uint64_t v28 = 46;
    }
    else if ([v27 isEqualToString:@"HARD_STOP"])
    {
      uint64_t v28 = 47;
    }
    else if ([v27 isEqualToString:@"VLF_USAGE"])
    {
      uint64_t v28 = 48;
    }
    else if ([v27 isEqualToString:@"LOG_DISCARD"])
    {
      uint64_t v28 = 49;
    }
    else if ([v27 isEqualToString:@"DAILY_USE_SUMMARY"])
    {
      uint64_t v28 = 50;
    }
    else if ([v27 isEqualToString:@"PRESSURE_DATA"])
    {
      uint64_t v28 = 51;
    }
    else if ([v27 isEqualToString:@"POI_BUSYNESS_DATA"])
    {
      uint64_t v28 = 52;
    }
    else if ([v27 isEqualToString:@"PERIODIC_SETTINGS_SUMMARY"])
    {
      uint64_t v28 = 53;
    }
    else if ([v27 isEqualToString:@"THERMAL_PRESSURE"])
    {
      uint64_t v28 = 54;
    }
    else if ([v27 isEqualToString:@"AR_SESSION_USAGE"])
    {
      uint64_t v28 = 55;
    }
    else if ([v27 isEqualToString:@"NETWORK_SELECTION_HARVEST"])
    {
      uint64_t v28 = 56;
    }
    else if ([v27 isEqualToString:@"IMPRESSION_EVENT"])
    {
      uint64_t v28 = 57;
    }
    else if ([v27 isEqualToString:@"SHOWCASE_SUPPRESSION"])
    {
      uint64_t v28 = 58;
    }
    else if ([v27 isEqualToString:@"PLACE_CACHE_LOOKUP"])
    {
      uint64_t v28 = 59;
    }
    else if ([v27 isEqualToString:@"DEVICE_SYNC_STATUS"])
    {
      uint64_t v28 = 60;
    }
    else if ([v27 isEqualToString:@"MAPS_INTERACTION"])
    {
      uint64_t v28 = 61;
    }
    else if ([v27 isEqualToString:@"NETWORK_EVENT_SUMMARY"])
    {
      uint64_t v28 = 62;
    }
    else if ([v27 isEqualToString:@"SERVICE_METADATA"])
    {
      uint64_t v28 = 63;
    }
    else if ([v27 isEqualToString:@"MAPS_ENGAGEMENT"])
    {
      uint64_t v28 = 64;
    }
    else
    {
      uint64_t v28 = 0;
    }

    goto LABEL_169;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v28 = [v26 intValue];
LABEL_169:
    [a1 setEventType:v28];
  }

  if (a3) {
    v29 = @"userActionEvent";
  }
  else {
    v29 = @"user_action_event";
  }
  v30 = [v5 objectForKeyedSubscript:v29];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v31 = [GEOLogMsgEventUserAction alloc];
    if (a3) {
      uint64_t v32 = [(GEOLogMsgEventUserAction *)v31 initWithJSON:v30];
    }
    else {
      uint64_t v32 = [(GEOLogMsgEventUserAction *)v31 initWithDictionary:v30];
    }
    v33 = (void *)v32;
    [a1 setUserActionEvent:v32];
  }
  if (a3) {
    v34 = @"stateTimingEvent";
  }
  else {
    v34 = @"state_timing_event";
  }
  v35 = [v5 objectForKeyedSubscript:v34];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v36 = [GEOLogMsgEventStateTiming alloc];
    if (a3) {
      uint64_t v37 = [(GEOLogMsgEventStateTiming *)v36 initWithJSON:v35];
    }
    else {
      uint64_t v37 = [(GEOLogMsgEventStateTiming *)v36 initWithDictionary:v35];
    }
    v38 = (void *)v37;
    [a1 setStateTimingEvent:v37];
  }
  if (a3) {
    v39 = @"tileSetStateEvent";
  }
  else {
    v39 = @"tile_set_state_event";
  }
  v40 = [v5 objectForKeyedSubscript:v39];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v41 = [GEOLogMsgEventTileSetState alloc];
    if (a3) {
      uint64_t v42 = [(GEOLogMsgEventTileSetState *)v41 initWithJSON:v40];
    }
    else {
      uint64_t v42 = [(GEOLogMsgEventTileSetState *)v41 initWithDictionary:v40];
    }
    v43 = (void *)v42;
    [a1 setTileSetStateEvent:v42];
  }
  if (a3) {
    v44 = @"placeDataCacheEvent";
  }
  else {
    v44 = @"place_data_cache_event";
  }
  v45 = [v5 objectForKeyedSubscript:v44];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v46 = [GEOLogMsgEventPlaceDataCache alloc];
    if (a3) {
      uint64_t v47 = [(GEOLogMsgEventPlaceDataCache *)v46 initWithJSON:v45];
    }
    else {
      uint64_t v47 = [(GEOLogMsgEventPlaceDataCache *)v46 initWithDictionary:v45];
    }
    v48 = (void *)v47;
    [a1 setPlaceDataCacheEvent:v47];
  }
  if (a3) {
    v49 = @"networkEvent";
  }
  else {
    v49 = @"network_event";
  }
  v50 = [v5 objectForKeyedSubscript:v49];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v51 = [GEOLogMsgEventNetwork alloc];
    if (a3) {
      uint64_t v52 = [(GEOLogMsgEventNetwork *)v51 initWithJSON:v50];
    }
    else {
      uint64_t v52 = [(GEOLogMsgEventNetwork *)v51 initWithDictionary:v50];
    }
    v53 = (void *)v52;
    [a1 setNetworkEvent:v52];
  }
  if (a3) {
    v54 = @"directionsEvent";
  }
  else {
    v54 = @"directions_event";
  }
  v55 = [v5 objectForKeyedSubscript:v54];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v56 = [GEOLogMsgEventDirections alloc];
    if (a3) {
      uint64_t v57 = [(GEOLogMsgEventDirections *)v56 initWithJSON:v55];
    }
    else {
      uint64_t v57 = [(GEOLogMsgEventDirections *)v56 initWithDictionary:v55];
    }
    v58 = (void *)v57;
    [a1 setDirectionsEvent:v57];
  }
  if (a3) {
    v59 = @"transitAppLaunchEvent";
  }
  else {
    v59 = @"transit_app_launch_event";
  }
  v60 = [v5 objectForKeyedSubscript:v59];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v61 = [GEOLogMsgEventTransitAppLaunch alloc];
    if (a3) {
      uint64_t v62 = [(GEOLogMsgEventTransitAppLaunch *)v61 initWithJSON:v60];
    }
    else {
      uint64_t v62 = [(GEOLogMsgEventTransitAppLaunch *)v61 initWithDictionary:v60];
    }
    v63 = (void *)v62;
    [a1 setTransitAppLaunchEvent:v62];
  }
  if (a3) {
    v64 = @"timeToLeaveHypothesisEvent";
  }
  else {
    v64 = @"time_to_leave_hypothesis_event";
  }
  v65 = [v5 objectForKeyedSubscript:v64];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v66 = [GEOLogMsgEventTimeToLeaveHypothesis alloc];
    if (a3) {
      uint64_t v67 = [(GEOLogMsgEventTimeToLeaveHypothesis *)v66 initWithJSON:v65];
    }
    else {
      uint64_t v67 = [(GEOLogMsgEventTimeToLeaveHypothesis *)v66 initWithDictionary:v65];
    }
    v68 = (void *)v67;
    [a1 setTimeToLeaveHypothesisEvent:v67];
  }
  if (a3) {
    v69 = @"timeToLeaveInitialTravelTimeEvent";
  }
  else {
    v69 = @"time_to_leave_initial_travel_time_event";
  }
  v70 = [v5 objectForKeyedSubscript:v69];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v71 = [GEOLogMsgEventTimeToLeaveInitialTravelTime alloc];
    if (a3) {
      uint64_t v72 = [(GEOLogMsgEventTimeToLeaveInitialTravelTime *)v71 initWithJSON:v70];
    }
    else {
      uint64_t v72 = [(GEOLogMsgEventTimeToLeaveInitialTravelTime *)v71 initWithDictionary:v70];
    }
    v73 = (void *)v72;
    [a1 setTimeToLeaveInitialTravelTimeEvent:v72];
  }
  if (a3) {
    v74 = @"mapsWidgetsInteractionSession";
  }
  else {
    v74 = @"maps_widgets_interaction_session";
  }
  v75 = [v5 objectForKeyedSubscript:v74];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v76 = [GEOLogMsgEventMapsWidgetsInteractionSession alloc];
    if (a3) {
      uint64_t v77 = [(GEOLogMsgEventMapsWidgetsInteractionSession *)v76 initWithJSON:v75];
    }
    else {
      uint64_t v77 = [(GEOLogMsgEventMapsWidgetsInteractionSession *)v76 initWithDictionary:v75];
    }
    v78 = (void *)v77;
    [a1 setMapsWidgetsInteractionSession:v77];
  }
  if (a3) {
    v79 = @"listInteractionSession";
  }
  else {
    v79 = @"list_interaction_session";
  }
  v80 = [v5 objectForKeyedSubscript:v79];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v81 = [GEOLogMsgEventListInteractionSession alloc];
    if (a3) {
      uint64_t v82 = [(GEOLogMsgEventListInteractionSession *)v81 initWithJSON:v80];
    }
    else {
      uint64_t v82 = [(GEOLogMsgEventListInteractionSession *)v81 initWithDictionary:v80];
    }
    v83 = (void *)v82;
    [a1 setListInteractionSession:v82];
  }
  if (a3) {
    v84 = @"refineSearchSession";
  }
  else {
    v84 = @"refine_search_session";
  }
  v85 = [v5 objectForKeyedSubscript:v84];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v86 = [GEOLogMsgEventRefineSearchSession alloc];
    if (a3) {
      uint64_t v87 = [(GEOLogMsgEventRefineSearchSession *)v86 initWithJSON:v85];
    }
    else {
      uint64_t v87 = [(GEOLogMsgEventRefineSearchSession *)v86 initWithDictionary:v85];
    }
    v88 = (void *)v87;
    [a1 setRefineSearchSession:v87];
  }
  if (a3) {
    v89 = @"proactiveSuggestionInteractionSessionEvent";
  }
  else {
    v89 = @"proactive_suggestion_interaction_session_event";
  }
  v90 = [v5 objectForKeyedSubscript:v89];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v91 = [GEOLogMsgEventProactiveSuggestionInteractionSession alloc];
    if (a3) {
      uint64_t v92 = [(GEOLogMsgEventProactiveSuggestionInteractionSession *)v91 initWithJSON:v90];
    }
    else {
      uint64_t v92 = [(GEOLogMsgEventProactiveSuggestionInteractionSession *)v91 initWithDictionary:v90];
    }
    v93 = (void *)v92;
    [a1 setProactiveSuggestionInteractionSessionEvent:v92];
  }
  if (a3) {
    v94 = @"mapLaunchEvent";
  }
  else {
    v94 = @"map_launch_event";
  }
  v95 = [v5 objectForKeyedSubscript:v94];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v96 = [GEOLogMsgEventMapLaunch alloc];
    if (a3) {
      uint64_t v97 = [(GEOLogMsgEventMapLaunch *)v96 initWithJSON:v95];
    }
    else {
      uint64_t v97 = [(GEOLogMsgEventMapLaunch *)v96 initWithDictionary:v95];
    }
    v98 = (void *)v97;
    [a1 setMapLaunchEvent:v97];
  }
  if (a3) {
    v99 = @"rideBookingSession";
  }
  else {
    v99 = @"ride_booking_session";
  }
  v100 = [v5 objectForKeyedSubscript:v99];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v101 = [GEOLogMsgEventRideBookingSession alloc];
    if (a3) {
      uint64_t v102 = [(GEOLogMsgEventRideBookingSession *)v101 initWithJSON:v100];
    }
    else {
      uint64_t v102 = [(GEOLogMsgEventRideBookingSession *)v101 initWithDictionary:v100];
    }
    v103 = (void *)v102;
    [a1 setRideBookingSession:v102];
  }
  if (a3) {
    v104 = @"rideBookedSession";
  }
  else {
    v104 = @"ride_booked_session";
  }
  v105 = [v5 objectForKeyedSubscript:v104];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v106 = [GEOLogMsgEventRideBookedSession alloc];
    if (a3) {
      uint64_t v107 = [(GEOLogMsgEventRideBookedSession *)v106 initWithJSON:v105];
    }
    else {
      uint64_t v107 = [(GEOLogMsgEventRideBookedSession *)v106 initWithDictionary:v105];
    }
    v108 = (void *)v107;
    [a1 setRideBookedSession:v107];
  }
  if (a3) {
    v109 = @"tableBookingSession";
  }
  else {
    v109 = @"table_booking_session";
  }
  v110 = [v5 objectForKeyedSubscript:v109];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v111 = [GEOLogMsgEventTableBookingSession alloc];
    if (a3) {
      uint64_t v112 = [(GEOLogMsgEventTableBookingSession *)v111 initWithJSON:v110];
    }
    else {
      uint64_t v112 = [(GEOLogMsgEventTableBookingSession *)v111 initWithDictionary:v110];
    }
    v113 = (void *)v112;
    [a1 setTableBookingSession:v112];
  }
  if (a3) {
    v114 = @"tableBookedSession";
  }
  else {
    v114 = @"table_booked_session";
  }
  v115 = [v5 objectForKeyedSubscript:v114];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v116 = [GEOLogMsgEventTableBookedSession alloc];
    if (a3) {
      uint64_t v117 = [(GEOLogMsgEventTableBookedSession *)v116 initWithJSON:v115];
    }
    else {
      uint64_t v117 = [(GEOLogMsgEventTableBookedSession *)v116 initWithDictionary:v115];
    }
    v118 = (void *)v117;
    [a1 setTableBookedSession:v117];
  }
  if (a3) {
    v119 = @"fullNavTrace";
  }
  else {
    v119 = @"full_nav_trace";
  }
  v120 = [v5 objectForKeyedSubscript:v119];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v121 = [GEOLogMsgEventFullNavTrace alloc];
    if (a3) {
      uint64_t v122 = [(GEOLogMsgEventFullNavTrace *)v121 initWithJSON:v120];
    }
    else {
      uint64_t v122 = [(GEOLogMsgEventFullNavTrace *)v121 initWithDictionary:v120];
    }
    v123 = (void *)v122;
    [a1 setFullNavTrace:v122];
  }
  v124 = [v5 objectForKeyedSubscript:@"telemetric"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v125 = [GEOLogMsgEventTelemetric alloc];
    if (a3) {
      uint64_t v126 = [(GEOLogMsgEventTelemetric *)v125 initWithJSON:v124];
    }
    else {
      uint64_t v126 = [(GEOLogMsgEventTelemetric *)v125 initWithDictionary:v124];
    }
    v127 = (void *)v126;
    [a1 setTelemetric:v126];
  }
  if (a3) {
    v128 = @"clientAcSuggestions";
  }
  else {
    v128 = @"client_ac_suggestions";
  }
  v129 = [v5 objectForKeyedSubscript:v128];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v130 = [GEOLogMsgEventClientACSuggestions alloc];
    if (a3) {
      uint64_t v131 = [(GEOLogMsgEventClientACSuggestions *)v130 initWithJSON:v129];
    }
    else {
      uint64_t v131 = [(GEOLogMsgEventClientACSuggestions *)v130 initWithDictionary:v129];
    }
    v132 = (void *)v131;
    [a1 setClientAcSuggestions:v131];
  }
  if (a3) {
    v133 = @"realtimeTrafficProbeCollection";
  }
  else {
    v133 = @"realtime_traffic_probe_collection";
  }
  v134 = [v5 objectForKeyedSubscript:v133];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v135 = [GEOLogMsgEventRealtimeTrafficProbe alloc];
    if (a3) {
      uint64_t v136 = [(GEOLogMsgEventRealtimeTrafficProbe *)v135 initWithJSON:v134];
    }
    else {
      uint64_t v136 = [(GEOLogMsgEventRealtimeTrafficProbe *)v135 initWithDictionary:v134];
    }
    v137 = (void *)v136;
    [a1 setRealtimeTrafficProbeCollection:v136];
  }
  if (a3) {
    v138 = @"batchTrafficProbeCollection";
  }
  else {
    v138 = @"batch_traffic_probe_collection";
  }
  v139 = [v5 objectForKeyedSubscript:v138];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v140 = [GEOLogMsgEventBatchTrafficProbe alloc];
    if (a3) {
      uint64_t v141 = [(GEOLogMsgEventBatchTrafficProbe *)v140 initWithJSON:v139];
    }
    else {
      uint64_t v141 = [(GEOLogMsgEventBatchTrafficProbe *)v140 initWithDictionary:v139];
    }
    v142 = (void *)v141;
    [a1 setBatchTrafficProbeCollection:v141];
  }
  if (a3) {
    v143 = @"commuteWindow";
  }
  else {
    v143 = @"commute_window";
  }
  v144 = [v5 objectForKeyedSubscript:v143];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v145 = [GEOLogMsgEventCommuteWindow alloc];
    if (a3) {
      uint64_t v146 = [(GEOLogMsgEventCommuteWindow *)v145 initWithJSON:v144];
    }
    else {
      uint64_t v146 = [(GEOLogMsgEventCommuteWindow *)v145 initWithDictionary:v144];
    }
    v147 = (void *)v146;
    [a1 setCommuteWindow:v146];
  }
  if (a3) {
    v148 = @"wifiConnectionQualityProbeEvent";
  }
  else {
    v148 = @"wifi_connection_quality_probe_event";
  }
  v149 = [v5 objectForKeyedSubscript:v148];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v150 = [GEOLogMsgEventWifiConnectionQualityProbe alloc];
    if (a3) {
      uint64_t v151 = [(GEOLogMsgEventWifiConnectionQualityProbe *)v150 initWithJSON:v149];
    }
    else {
      uint64_t v151 = [(GEOLogMsgEventWifiConnectionQualityProbe *)v150 initWithDictionary:v149];
    }
    v152 = (void *)v151;
    [a1 setWifiConnectionQualityProbeEvent:v151];
  }
  if (a3) {
    v153 = @"parkedCar";
  }
  else {
    v153 = @"parked_car";
  }
  v154 = [v5 objectForKeyedSubscript:v153];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v155 = [GEOLogMsgEventParkedCar alloc];
    if (a3) {
      uint64_t v156 = [(GEOLogMsgEventParkedCar *)v155 initWithJSON:v154];
    }
    else {
      uint64_t v156 = [(GEOLogMsgEventParkedCar *)v155 initWithDictionary:v154];
    }
    v157 = (void *)v156;
    [a1 setParkedCar:v156];
  }
  if (a3) {
    v158 = @"tileCacheAnalytic";
  }
  else {
    v158 = @"tile_cache_analytic";
  }
  v159 = [v5 objectForKeyedSubscript:v158];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v160 = [GEOLogMsgEventTileCacheAnalytic alloc];
    if (a3) {
      uint64_t v161 = [(GEOLogMsgEventTileCacheAnalytic *)v160 initWithJSON:v159];
    }
    else {
      uint64_t v161 = [(GEOLogMsgEventTileCacheAnalytic *)v160 initWithDictionary:v159];
    }
    v162 = (void *)v161;
    [a1 setTileCacheAnalytic:v161];
  }
  if (a3) {
    v163 = @"gridDuration";
  }
  else {
    v163 = @"grid_duration";
  }
  v164 = [v5 objectForKeyedSubscript:v163];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v165 = [GEOLogMsgEventGridDuration alloc];
    if (a3) {
      uint64_t v166 = [(GEOLogMsgEventGridDuration *)v165 initWithJSON:v164];
    }
    else {
      uint64_t v166 = [(GEOLogMsgEventGridDuration *)v165 initWithDictionary:v164];
    }
    v167 = (void *)v166;
    [a1 setGridDuration:v166];
  }
  if (a3) {
    v168 = @"displayAnalytic";
  }
  else {
    v168 = @"display_analytic";
  }
  v169 = [v5 objectForKeyedSubscript:v168];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v170 = [GEOLogMsgEventDisplayAnalytic alloc];
    if (a3) {
      uint64_t v171 = [(GEOLogMsgEventDisplayAnalytic *)v170 initWithJSON:v169];
    }
    else {
      uint64_t v171 = [(GEOLogMsgEventDisplayAnalytic *)v170 initWithDictionary:v169];
    }
    v172 = (void *)v171;
    [a1 setDisplayAnalytic:v171];
  }
  if (a3) {
    v173 = @"throttleEvent";
  }
  else {
    v173 = @"throttle_event";
  }
  v174 = [v5 objectForKeyedSubscript:v173];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v175 = [GEOLogMsgEventThrottle alloc];
    if (a3) {
      uint64_t v176 = [(GEOLogMsgEventThrottle *)v175 initWithJSON:v174];
    }
    else {
      uint64_t v176 = [(GEOLogMsgEventThrottle *)v175 initWithDictionary:v174];
    }
    v177 = (void *)v176;
    [a1 setThrottleEvent:v176];
  }
  if (a3) {
    v178 = @"mapKitCounts";
  }
  else {
    v178 = @"map_kit_counts";
  }
  v179 = [v5 objectForKeyedSubscript:v178];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v180 = [GEOLogMsgEventMapKitCounts alloc];
    if (a3) {
      uint64_t v181 = [(GEOLogMsgEventMapKitCounts *)v180 initWithJSON:v179];
    }
    else {
      uint64_t v181 = [(GEOLogMsgEventMapKitCounts *)v180 initWithDictionary:v179];
    }
    v182 = (void *)v181;
    [a1 setMapKitCounts:v181];
  }
  if (a3) {
    v183 = @"predExTrainingData";
  }
  else {
    v183 = @"pred_ex_training_data";
  }
  v184 = [v5 objectForKeyedSubscript:v183];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v185 = [GEOLogMsgEventPredExTrainingData alloc];
    if (a3) {
      uint64_t v186 = [(GEOLogMsgEventPredExTrainingData *)v185 initWithJSON:v184];
    }
    else {
      uint64_t v186 = [(GEOLogMsgEventPredExTrainingData *)v185 initWithDictionary:v184];
    }
    v187 = (void *)v186;
    [a1 setPredExTrainingData:v186];
  }
  if (a3) {
    v188 = @"marcoLiteUsage";
  }
  else {
    v188 = @"marco_lite_usage";
  }
  v189 = [v5 objectForKeyedSubscript:v188];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v190 = [GEOLogMsgEventMarcoLiteUsage alloc];
    if (a3) {
      uint64_t v191 = [(GEOLogMsgEventMarcoLiteUsage *)v190 initWithJSON:v189];
    }
    else {
      uint64_t v191 = [(GEOLogMsgEventMarcoLiteUsage *)v190 initWithDictionary:v189];
    }
    v192 = (void *)v191;
    [a1 setMarcoLiteUsage:v191];
  }
  if (a3) {
    v193 = @"tripDepartureFeedback";
  }
  else {
    v193 = @"trip_departure_feedback";
  }
  v194 = [v5 objectForKeyedSubscript:v193];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v195 = [GEOLogMsgEventTripDepartureFeedback alloc];
    if (a3) {
      uint64_t v196 = [(GEOLogMsgEventTripDepartureFeedback *)v195 initWithJSON:v194];
    }
    else {
      uint64_t v196 = [(GEOLogMsgEventTripDepartureFeedback *)v195 initWithDictionary:v194];
    }
    v197 = (void *)v196;
    [a1 setTripDepartureFeedback:v196];
  }
  if (a3) {
    v198 = @"directionsRequestDetails";
  }
  else {
    v198 = @"directions_request_details";
  }
  v199 = [v5 objectForKeyedSubscript:v198];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v200 = [GEOLogMsgEventDirectionsRequestDetails alloc];
    if (a3) {
      uint64_t v201 = [(GEOLogMsgEventDirectionsRequestDetails *)v200 initWithJSON:v199];
    }
    else {
      uint64_t v201 = [(GEOLogMsgEventDirectionsRequestDetails *)v200 initWithDictionary:v199];
    }
    v202 = (void *)v201;
    [a1 setDirectionsRequestDetails:v201];
  }
  if (a3) {
    v203 = @"evRoutingVehicleDetails";
  }
  else {
    v203 = @"ev_routing_vehicle_details";
  }
  v204 = [v5 objectForKeyedSubscript:v203];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v205 = [GEOLogMsgEventEVRoutingVehicleDetails alloc];
    if (a3) {
      uint64_t v206 = [(GEOLogMsgEventEVRoutingVehicleDetails *)v205 initWithJSON:v204];
    }
    else {
      uint64_t v206 = [(GEOLogMsgEventEVRoutingVehicleDetails *)v205 initWithDictionary:v204];
    }
    v207 = (void *)v206;
    [a1 setEvRoutingVehicleDetails:v206];
  }
  if (a3) {
    v208 = @"evTrip";
  }
  else {
    v208 = @"ev_trip";
  }
  v209 = [v5 objectForKeyedSubscript:v208];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v210 = [GEOLogMsgEventEVTrip alloc];
    if (a3) {
      uint64_t v211 = [(GEOLogMsgEventEVTrip *)v210 initWithJSON:v209];
    }
    else {
      uint64_t v211 = [(GEOLogMsgEventEVTrip *)v210 initWithDictionary:v209];
    }
    v212 = (void *)v211;
    [a1 setEvTrip:v211];
  }
  if (a3) {
    v213 = @"curatedCollectionStats";
  }
  else {
    v213 = @"curated_collection_stats";
  }
  v214 = [v5 objectForKeyedSubscript:v213];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v215 = [GEOLogMsgEventCuratedCollectionStats alloc];
    if (a3) {
      uint64_t v216 = [(GEOLogMsgEventCuratedCollectionStats *)v215 initWithJSON:v214];
    }
    else {
      uint64_t v216 = [(GEOLogMsgEventCuratedCollectionStats *)v215 initWithDictionary:v214];
    }
    v217 = (void *)v216;
    [a1 setCuratedCollectionStats:v216];
  }
  if (a3) {
    v218 = @"curatedCollectionUsage";
  }
  else {
    v218 = @"curated_collection_usage";
  }
  v219 = [v5 objectForKeyedSubscript:v218];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v220 = [GEOLogMsgEventCuratedCollectionUsage alloc];
    if (a3) {
      uint64_t v221 = [(GEOLogMsgEventCuratedCollectionUsage *)v220 initWithJSON:v219];
    }
    else {
      uint64_t v221 = [(GEOLogMsgEventCuratedCollectionUsage *)v220 initWithDictionary:v219];
    }
    v222 = (void *)v221;
    [a1 setCuratedCollectionUsage:v221];
  }
  if (a3) {
    v223 = @"mapsDeviceSettings";
  }
  else {
    v223 = @"maps_device_settings";
  }
  v224 = [v5 objectForKeyedSubscript:v223];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v225 = [GEOLogMsgEventMapsDeviceSettings alloc];
    if (a3) {
      uint64_t v226 = [(GEOLogMsgEventMapsDeviceSettings *)v225 initWithJSON:v224];
    }
    else {
      uint64_t v226 = [(GEOLogMsgEventMapsDeviceSettings *)v225 initWithDictionary:v224];
    }
    v227 = (void *)v226;
    [a1 setMapsDeviceSettings:v226];
  }
  if (a3) {
    v228 = @"hardStop";
  }
  else {
    v228 = @"hard_stop";
  }
  v229 = [v5 objectForKeyedSubscript:v228];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v230 = [GEOLogMsgEventHardStop alloc];
    if (a3) {
      uint64_t v231 = [(GEOLogMsgEventHardStop *)v230 initWithJSON:v229];
    }
    else {
      uint64_t v231 = [(GEOLogMsgEventHardStop *)v230 initWithDictionary:v229];
    }
    v232 = (void *)v231;
    [a1 setHardStop:v231];
  }
  if (a3) {
    v233 = @"vlfUsage";
  }
  else {
    v233 = @"vlf_usage";
  }
  v234 = [v5 objectForKeyedSubscript:v233];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v235 = [GEOLogMsgEventVLFUsage alloc];
    if (a3) {
      uint64_t v236 = [(GEOLogMsgEventVLFUsage *)v235 initWithJSON:v234];
    }
    else {
      uint64_t v236 = [(GEOLogMsgEventVLFUsage *)v235 initWithDictionary:v234];
    }
    v237 = (void *)v236;
    [a1 setVlfUsage:v236];
  }
  if (a3) {
    v238 = @"logDiscard";
  }
  else {
    v238 = @"log_discard";
  }
  v239 = [v5 objectForKeyedSubscript:v238];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v240 = [GEOLogMsgEventLogDiscard alloc];
    if (a3) {
      uint64_t v241 = [(GEOLogMsgEventLogDiscard *)v240 initWithJSON:v239];
    }
    else {
      uint64_t v241 = [(GEOLogMsgEventLogDiscard *)v240 initWithDictionary:v239];
    }
    v242 = (void *)v241;
    [a1 setLogDiscard:v241];
  }
  if (a3) {
    v243 = @"dailyUseSummary";
  }
  else {
    v243 = @"daily_use_summary";
  }
  v244 = [v5 objectForKeyedSubscript:v243];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v245 = [GEOLogMsgEventDailyUseSummary alloc];
    if (a3) {
      uint64_t v246 = [(GEOLogMsgEventDailyUseSummary *)v245 initWithJSON:v244];
    }
    else {
      uint64_t v246 = [(GEOLogMsgEventDailyUseSummary *)v245 initWithDictionary:v244];
    }
    v247 = (void *)v246;
    [a1 setDailyUseSummary:v246];
  }
  if (a3) {
    v248 = @"pressureData";
  }
  else {
    v248 = @"pressure_data";
  }
  v249 = [v5 objectForKeyedSubscript:v248];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v250 = [GEOLogMsgEventPressureData alloc];
    if (a3) {
      uint64_t v251 = [(GEOLogMsgEventPressureData *)v250 initWithJSON:v249];
    }
    else {
      uint64_t v251 = [(GEOLogMsgEventPressureData *)v250 initWithDictionary:v249];
    }
    v252 = (void *)v251;
    [a1 setPressureData:v251];
  }
  if (a3) {
    v253 = @"poiBusynessData";
  }
  else {
    v253 = @"poi_busyness_data";
  }
  v254 = [v5 objectForKeyedSubscript:v253];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v255 = [GEOLogMsgEventPOIBusynessData alloc];
    if (a3) {
      uint64_t v256 = [(GEOLogMsgEventPOIBusynessData *)v255 initWithJSON:v254];
    }
    else {
      uint64_t v256 = [(GEOLogMsgEventPOIBusynessData *)v255 initWithDictionary:v254];
    }
    v257 = (void *)v256;
    [a1 setPoiBusynessData:v256];
  }
  if (a3) {
    v258 = @"periodicSettingsSummary";
  }
  else {
    v258 = @"periodic_settings_summary";
  }
  v259 = [v5 objectForKeyedSubscript:v258];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v260 = [GEOLogMsgEventPeriodicSettingsSummary alloc];
    if (a3) {
      uint64_t v261 = [(GEOLogMsgEventPeriodicSettingsSummary *)v260 initWithJSON:v259];
    }
    else {
      uint64_t v261 = [(GEOLogMsgEventPeriodicSettingsSummary *)v260 initWithDictionary:v259];
    }
    v262 = (void *)v261;
    [a1 setPeriodicSettingsSummary:v261];
  }
  if (a3) {
    v263 = @"thermalPressure";
  }
  else {
    v263 = @"thermal_pressure";
  }
  v264 = [v5 objectForKeyedSubscript:v263];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v265 = [GEOLogMsgEventThermalPressure alloc];
    if (a3) {
      uint64_t v266 = [(GEOLogMsgEventThermalPressure *)v265 initWithJSON:v264];
    }
    else {
      uint64_t v266 = [(GEOLogMsgEventThermalPressure *)v265 initWithDictionary:v264];
    }
    v267 = (void *)v266;
    [a1 setThermalPressure:v266];
  }
  if (a3) {
    v268 = @"arSessionUsage";
  }
  else {
    v268 = @"ar_session_usage";
  }
  v269 = [v5 objectForKeyedSubscript:v268];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v270 = [GEOLogMsgEventARSessionUsage alloc];
    if (a3) {
      uint64_t v271 = [(GEOLogMsgEventARSessionUsage *)v270 initWithJSON:v269];
    }
    else {
      uint64_t v271 = [(GEOLogMsgEventARSessionUsage *)v270 initWithDictionary:v269];
    }
    v272 = (void *)v271;
    [a1 setArSessionUsage:v271];
  }
  if (a3) {
    v273 = @"networkSelectionHarvest";
  }
  else {
    v273 = @"network_selection_harvest";
  }
  v274 = [v5 objectForKeyedSubscript:v273];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v275 = [GEOLogMsgEventNetworkSelectionHarvest alloc];
    if (a3) {
      uint64_t v276 = [(GEOLogMsgEventNetworkSelectionHarvest *)v275 initWithJSON:v274];
    }
    else {
      uint64_t v276 = [(GEOLogMsgEventNetworkSelectionHarvest *)v275 initWithDictionary:v274];
    }
    v277 = (void *)v276;
    [a1 setNetworkSelectionHarvest:v276];
  }
  if (a3) {
    v278 = @"impressionEvent";
  }
  else {
    v278 = @"impression_event";
  }
  v279 = [v5 objectForKeyedSubscript:v278];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v280 = [GEOLogMsgEventImpressionEvent alloc];
    if (a3) {
      uint64_t v281 = [(GEOLogMsgEventImpressionEvent *)v280 initWithJSON:v279];
    }
    else {
      uint64_t v281 = [(GEOLogMsgEventImpressionEvent *)v280 initWithDictionary:v279];
    }
    v282 = (void *)v281;
    [a1 setImpressionEvent:v281];
  }
  if (a3) {
    v283 = @"showcaseSuppression";
  }
  else {
    v283 = @"showcase_suppression";
  }
  v284 = [v5 objectForKeyedSubscript:v283];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v285 = [GEOLogMsgEventShowcaseSuppression alloc];
    if (a3) {
      uint64_t v286 = [(GEOLogMsgEventShowcaseSuppression *)v285 initWithJSON:v284];
    }
    else {
      uint64_t v286 = [(GEOLogMsgEventShowcaseSuppression *)v285 initWithDictionary:v284];
    }
    v287 = (void *)v286;
    [a1 setShowcaseSuppression:v286];
  }
  if (a3) {
    v288 = @"placeCacheLookup";
  }
  else {
    v288 = @"place_cache_lookup";
  }
  v289 = [v5 objectForKeyedSubscript:v288];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v290 = [GEOLogMsgEventPlaceCacheLookup alloc];
    if (a3) {
      uint64_t v291 = [(GEOLogMsgEventPlaceCacheLookup *)v290 initWithJSON:v289];
    }
    else {
      uint64_t v291 = [(GEOLogMsgEventPlaceCacheLookup *)v290 initWithDictionary:v289];
    }
    v292 = (void *)v291;
    [a1 setPlaceCacheLookup:v291];
  }
  if (a3) {
    v293 = @"deviceSyncStatus";
  }
  else {
    v293 = @"device_sync_status";
  }
  v294 = [v5 objectForKeyedSubscript:v293];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v295 = [GEOLogMsgEventDeviceSyncStatus alloc];
    if (a3) {
      uint64_t v296 = [(GEOLogMsgEventDeviceSyncStatus *)v295 initWithJSON:v294];
    }
    else {
      uint64_t v296 = [(GEOLogMsgEventDeviceSyncStatus *)v295 initWithDictionary:v294];
    }
    v297 = (void *)v296;
    [a1 setDeviceSyncStatus:v296];
  }
  if (a3) {
    v298 = @"mapsInteraction";
  }
  else {
    v298 = @"maps_interaction";
  }
  v299 = [v5 objectForKeyedSubscript:v298];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v300 = [GEOLogMsgEventMapsInteraction alloc];
    if (a3) {
      uint64_t v301 = [(GEOLogMsgEventMapsInteraction *)v300 initWithJSON:v299];
    }
    else {
      uint64_t v301 = [(GEOLogMsgEventMapsInteraction *)v300 initWithDictionary:v299];
    }
    v302 = (void *)v301;
    [a1 setMapsInteraction:v301];
  }
  if (a3) {
    v303 = @"networkEventSummary";
  }
  else {
    v303 = @"network_event_summary";
  }
  v304 = [v5 objectForKeyedSubscript:v303];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v305 = [GEOLogMsgEventNetworkEventSummary alloc];
    if (a3) {
      uint64_t v306 = [(GEOLogMsgEventNetworkEventSummary *)v305 initWithJSON:v304];
    }
    else {
      uint64_t v306 = [(GEOLogMsgEventNetworkEventSummary *)v305 initWithDictionary:v304];
    }
    v307 = (void *)v306;
    [a1 setNetworkEventSummary:v306];
  }
  if (a3) {
    v308 = @"serviceMetadata";
  }
  else {
    v308 = @"service_metadata";
  }
  v309 = [v5 objectForKeyedSubscript:v308];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v310 = [GEOLogMsgEventServiceMetadata alloc];
    if (a3) {
      uint64_t v311 = [(GEOLogMsgEventServiceMetadata *)v310 initWithJSON:v309];
    }
    else {
      uint64_t v311 = [(GEOLogMsgEventServiceMetadata *)v310 initWithDictionary:v309];
    }
    v312 = (void *)v311;
    [a1 setServiceMetadata:v311];
  }
  if (a3) {
    v313 = @"mapsEngagement";
  }
  else {
    v313 = @"maps_engagement";
  }
  v314 = [v5 objectForKeyedSubscript:v313];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v315 = [GEOLogMsgEventMapsEngagement alloc];
    if (a3) {
      uint64_t v316 = [(GEOLogMsgEventMapsEngagement *)v315 initWithJSON:v314];
    }
    else {
      uint64_t v316 = [(GEOLogMsgEventMapsEngagement *)v315 initWithDictionary:v314];
    }
    v317 = (void *)v316;
    [a1 setMapsEngagement:v316];
  }
  if (a3) {
    v318 = @"usageEventTime";
  }
  else {
    v318 = @"usage_event_time";
  }
  v319 = [v5 objectForKeyedSubscript:v318];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v319 doubleValue];
    objc_msgSend(a1, "setUsageEventTime:");
  }

  a1 = a1;
LABEL_637:

  return a1;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v320 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 176) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 176), "count"));
      long long v315 = 0u;
      long long v316 = 0u;
      long long v317 = 0u;
      long long v318 = 0u;
      id v6 = *(id *)(a1 + 176);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v315 objects:v319 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v316;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v316 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void **)(*((void *)&v315 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            id v12 = [v11 dictionaryRepresentation];
            }

            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v315 objects:v319 count:16];
        }
        while (v8);
      }

      if (a2) {
        uint64_t v13 = @"logMsgState";
      }
      else {
        uint64_t v13 = @"log_msg_state";
      }
      [v4 setObject:v5 forKey:v13];
    }
    long long v14 = [(id)a1 analyticTag];
    uint64_t v15 = v14;
    if (v14)
    {
      if (a2)
      {
        v16 = [v14 jsonRepresentation];
        uint64_t v17 = @"analyticTag";
      }
      else
      {
        v16 = [v14 dictionaryRepresentation];
        uint64_t v17 = @"analytic_tag";
      }
      id v18 = v16;

      [v4 setObject:v18 forKey:v17];
    }

    v19 = [(id)a1 mapsEnvironment];
    if (v19)
    {
      if (a2) {
        uint64_t v20 = @"mapsEnvironment";
      }
      else {
        uint64_t v20 = @"maps_environment";
      }
      [v4 setObject:v19 forKey:v20];
    }

    if ((*(unsigned char *)(a1 + 528) & 2) != 0)
    {
      v21 = @"LOG_MSG_EVENT_TYPE_UNKNOWN";
      switch(*(_DWORD *)(a1 + 524))
      {
        case 0:
          break;
        case 1:
          v21 = @"USER_ACTION";
          break;
        case 2:
          v21 = @"STATE_TIMING";
          break;
        case 4:
          v21 = @"TILE_SET_STATE";
          break;
        case 5:
          v21 = @"PLACE_DATA_CACHE";
          break;
        case 6:
          v21 = @"NETWORK";
          break;
        case 7:
          v21 = @"CACHE_HIT";
          break;
        case 8:
          v21 = @"DIRECTIONS";
          break;
        case 9:
          v21 = @"TRANSIT_APP_LAUNCH";
          break;
        case 0xA:
          v21 = @"TIME_TO_LEAVE_HYPOTHESIS";
          break;
        case 0xB:
          v21 = @"TIME_TO_LEAVE_INITIAL_TRAVEL_TIME";
          break;
        case 0xC:
          v21 = @"LOG_FRAMEWORK";
          break;
        case 0xD:
          v21 = @"MAPS_WIDGETS_SESSION";
          break;
        case 0xE:
          v21 = @"LIST_INTERACTION_SESSION";
          break;
        case 0xF:
          v21 = @"REFINE_SEARCH_SESSION";
          break;
        case 0x10:
          v21 = @"PROACTIVE_SUGGESTION_SESSION";
          break;
        case 0x11:
          v21 = @"MAP_LAUNCH";
          break;
        case 0x12:
          v21 = @"RIDE_BOOKING_SESSION";
          break;
        case 0x13:
          v21 = @"RIDE_BOOKED_SESSION";
          break;
        case 0x14:
          v21 = @"TABLE_BOOKING_SESSION";
          break;
        case 0x15:
          v21 = @"TABLE_BOOKED_SESSION";
          break;
        case 0x16:
          v21 = @"STALE_RESOURCE";
          break;
        case 0x17:
          v21 = @"FULL_NAV_TRACE";
          break;
        case 0x18:
          v21 = @"TELEMETRIC";
          break;
        case 0x19:
          v21 = @"CLIENT_AC_SUGGESTIONS";
          break;
        case 0x1A:
          v21 = @"REALTIME_TRAFFIC_PROBE_COLLECTION";
          break;
        case 0x1B:
          v21 = @"BATCH_TRAFFIC_PROBE_COLLECTION";
          break;
        case 0x1C:
          v21 = @"OFFLINE_REQUEST_RESPONSE";
          break;
        case 0x1D:
          v21 = @"COMMUTE_WINDOW";
          break;
        case 0x1E:
          v21 = @"GENERIC_APP_ERROR";
          break;
        case 0x1F:
          v21 = @"WIFI_CONNECTION_QUALITY_PROBE";
          break;
        case 0x20:
          v21 = @"PARKED_CAR";
          break;
        case 0x21:
          v21 = @"TILE_CACHE_ANALYTIC";
          break;
        case 0x22:
          v21 = @"GRID_DURATION";
          break;
        case 0x23:
          v21 = @"DISPLAY_ANALYTIC";
          break;
        case 0x24:
          v21 = @"THROTTLE";
          break;
        case 0x25:
          v21 = @"MAP_KIT_COUNTS";
          break;
        case 0x26:
          v21 = @"PRED_EX_TRAINING";
          break;
        case 0x27:
          v21 = @"MARCOLITE_USAGE";
          break;
        case 0x28:
          v21 = @"TRIP_DEPARTURE";
          break;
        case 0x29:
          v21 = @"DIRECTIONS_REQUEST_DETAILS";
          break;
        case 0x2A:
          v21 = @"EV_ROUTING_VEHICLE_DETAILS";
          break;
        case 0x2B:
          v21 = @"EV_TRIP";
          break;
        case 0x2C:
          v21 = @"CURATED_COLLECTION_STATS";
          break;
        case 0x2D:
          v21 = @"CURATED_COLLECTION_USAGE";
          break;
        case 0x2E:
          v21 = @"MAPS_DEVICE_SETTINGS";
          break;
        case 0x2F:
          v21 = @"HARD_STOP";
          break;
        case 0x30:
          v21 = @"VLF_USAGE";
          break;
        case 0x31:
          v21 = @"LOG_DISCARD";
          break;
        case 0x32:
          v21 = @"DAILY_USE_SUMMARY";
          break;
        case 0x33:
          v21 = @"PRESSURE_DATA";
          break;
        case 0x34:
          v21 = @"POI_BUSYNESS_DATA";
          break;
        case 0x35:
          v21 = @"PERIODIC_SETTINGS_SUMMARY";
          break;
        case 0x36:
          v21 = @"THERMAL_PRESSURE";
          break;
        case 0x37:
          v21 = @"AR_SESSION_USAGE";
          break;
        case 0x38:
          v21 = @"NETWORK_SELECTION_HARVEST";
          break;
        case 0x39:
          v21 = @"IMPRESSION_EVENT";
          break;
        case 0x3A:
          v21 = @"SHOWCASE_SUPPRESSION";
          break;
        case 0x3B:
          v21 = @"PLACE_CACHE_LOOKUP";
          break;
        case 0x3C:
          v21 = @"DEVICE_SYNC_STATUS";
          break;
        case 0x3D:
          v21 = @"MAPS_INTERACTION";
          break;
        case 0x3E:
          v21 = @"NETWORK_EVENT_SUMMARY";
          break;
        case 0x3F:
          v21 = @"SERVICE_METADATA";
          break;
        case 0x40:
          v21 = @"MAPS_ENGAGEMENT";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 524));
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      if (a2) {
        v22 = @"eventType";
      }
      else {
        v22 = @"event_type";
      }
      [v4 setObject:v21 forKey:v22];
    }
    v23 = [(id)a1 userActionEvent];
    v24 = v23;
    if (v23)
    {
      if (a2)
      {
        v25 = [v23 jsonRepresentation];
        v26 = @"userActionEvent";
      }
      else
      {
        v25 = [v23 dictionaryRepresentation];
        v26 = @"user_action_event";
      }
      id v27 = v25;

      [v4 setObject:v27 forKey:v26];
    }

    uint64_t v28 = [(id)a1 stateTimingEvent];
    v29 = v28;
    if (v28)
    {
      if (a2)
      {
        v30 = [v28 jsonRepresentation];
        v31 = @"stateTimingEvent";
      }
      else
      {
        v30 = [v28 dictionaryRepresentation];
        v31 = @"state_timing_event";
      }
      id v32 = v30;

      [v4 setObject:v32 forKey:v31];
    }

    v33 = [(id)a1 tileSetStateEvent];
    v34 = v33;
    if (v33)
    {
      if (a2)
      {
        v35 = [v33 jsonRepresentation];
        v36 = @"tileSetStateEvent";
      }
      else
      {
        v35 = [v33 dictionaryRepresentation];
        v36 = @"tile_set_state_event";
      }
      id v37 = v35;

      [v4 setObject:v37 forKey:v36];
    }

    v38 = [(id)a1 placeDataCacheEvent];
    v39 = v38;
    if (v38)
    {
      if (a2)
      {
        v40 = [v38 jsonRepresentation];
        v41 = @"placeDataCacheEvent";
      }
      else
      {
        v40 = [v38 dictionaryRepresentation];
        v41 = @"place_data_cache_event";
      }
      id v42 = v40;

      [v4 setObject:v42 forKey:v41];
    }

    v43 = [(id)a1 networkEvent];
    v44 = v43;
    if (v43)
    {
      if (a2)
      {
        v45 = [v43 jsonRepresentation];
        v46 = @"networkEvent";
      }
      else
      {
        v45 = [v43 dictionaryRepresentation];
        v46 = @"network_event";
      }
      id v47 = v45;

      [v4 setObject:v47 forKey:v46];
    }

    v48 = [(id)a1 directionsEvent];
    v49 = v48;
    if (v48)
    {
      if (a2)
      {
        v50 = [v48 jsonRepresentation];
        v51 = @"directionsEvent";
      }
      else
      {
        v50 = [v48 dictionaryRepresentation];
        v51 = @"directions_event";
      }
      id v52 = v50;

      [v4 setObject:v52 forKey:v51];
    }

    v53 = [(id)a1 transitAppLaunchEvent];
    v54 = v53;
    if (v53)
    {
      if (a2)
      {
        v55 = [v53 jsonRepresentation];
        v56 = @"transitAppLaunchEvent";
      }
      else
      {
        v55 = [v53 dictionaryRepresentation];
        v56 = @"transit_app_launch_event";
      }
      id v57 = v55;

      [v4 setObject:v57 forKey:v56];
    }

    v58 = [(id)a1 timeToLeaveHypothesisEvent];
    v59 = v58;
    if (v58)
    {
      if (a2)
      {
        v60 = [v58 jsonRepresentation];
        v61 = @"timeToLeaveHypothesisEvent";
      }
      else
      {
        v60 = [v58 dictionaryRepresentation];
        v61 = @"time_to_leave_hypothesis_event";
      }
      id v62 = v60;

      [v4 setObject:v62 forKey:v61];
    }

    v63 = [(id)a1 timeToLeaveInitialTravelTimeEvent];
    v64 = v63;
    if (v63)
    {
      if (a2)
      {
        v65 = [v63 jsonRepresentation];
        v66 = @"timeToLeaveInitialTravelTimeEvent";
      }
      else
      {
        v65 = [v63 dictionaryRepresentation];
        v66 = @"time_to_leave_initial_travel_time_event";
      }
      id v67 = v65;

      [v4 setObject:v67 forKey:v66];
    }

    v68 = [(id)a1 mapsWidgetsInteractionSession];
    v69 = v68;
    if (v68)
    {
      if (a2)
      {
        v70 = [v68 jsonRepresentation];
        v71 = @"mapsWidgetsInteractionSession";
      }
      else
      {
        v70 = [v68 dictionaryRepresentation];
        v71 = @"maps_widgets_interaction_session";
      }
      id v72 = v70;

      [v4 setObject:v72 forKey:v71];
    }

    v73 = [(id)a1 listInteractionSession];
    v74 = v73;
    if (v73)
    {
      if (a2)
      {
        v75 = [v73 jsonRepresentation];
        v76 = @"listInteractionSession";
      }
      else
      {
        v75 = [v73 dictionaryRepresentation];
        v76 = @"list_interaction_session";
      }
      id v77 = v75;

      [v4 setObject:v77 forKey:v76];
    }

    v78 = [(id)a1 refineSearchSession];
    v79 = v78;
    if (v78)
    {
      if (a2)
      {
        v80 = [v78 jsonRepresentation];
        v81 = @"refineSearchSession";
      }
      else
      {
        v80 = [v78 dictionaryRepresentation];
        v81 = @"refine_search_session";
      }
      id v82 = v80;

      [v4 setObject:v82 forKey:v81];
    }

    v83 = [(id)a1 proactiveSuggestionInteractionSessionEvent];
    v84 = v83;
    if (v83)
    {
      if (a2)
      {
        v85 = [v83 jsonRepresentation];
        v86 = @"proactiveSuggestionInteractionSessionEvent";
      }
      else
      {
        v85 = [v83 dictionaryRepresentation];
        v86 = @"proactive_suggestion_interaction_session_event";
      }
      id v87 = v85;

      [v4 setObject:v87 forKey:v86];
    }

    v88 = [(id)a1 mapLaunchEvent];
    v89 = v88;
    if (v88)
    {
      if (a2)
      {
        v90 = [v88 jsonRepresentation];
        v91 = @"mapLaunchEvent";
      }
      else
      {
        v90 = [v88 dictionaryRepresentation];
        v91 = @"map_launch_event";
      }
      id v92 = v90;

      [v4 setObject:v92 forKey:v91];
    }

    v93 = [(id)a1 rideBookingSession];
    v94 = v93;
    if (v93)
    {
      if (a2)
      {
        v95 = [v93 jsonRepresentation];
        v96 = @"rideBookingSession";
      }
      else
      {
        v95 = [v93 dictionaryRepresentation];
        v96 = @"ride_booking_session";
      }
      id v97 = v95;

      [v4 setObject:v97 forKey:v96];
    }

    v98 = [(id)a1 rideBookedSession];
    v99 = v98;
    if (v98)
    {
      if (a2)
      {
        v100 = [v98 jsonRepresentation];
        v101 = @"rideBookedSession";
      }
      else
      {
        v100 = [v98 dictionaryRepresentation];
        v101 = @"ride_booked_session";
      }
      id v102 = v100;

      [v4 setObject:v102 forKey:v101];
    }

    v103 = [(id)a1 tableBookingSession];
    v104 = v103;
    if (v103)
    {
      if (a2)
      {
        v105 = [v103 jsonRepresentation];
        v106 = @"tableBookingSession";
      }
      else
      {
        v105 = [v103 dictionaryRepresentation];
        v106 = @"table_booking_session";
      }
      id v107 = v105;

      [v4 setObject:v107 forKey:v106];
    }

    v108 = [(id)a1 tableBookedSession];
    v109 = v108;
    if (v108)
    {
      if (a2)
      {
        v110 = [v108 jsonRepresentation];
        v111 = @"tableBookedSession";
      }
      else
      {
        v110 = [v108 dictionaryRepresentation];
        v111 = @"table_booked_session";
      }
      id v112 = v110;

      [v4 setObject:v112 forKey:v111];
    }

    v113 = [(id)a1 fullNavTrace];
    v114 = v113;
    if (v113)
    {
      if (a2)
      {
        v115 = [v113 jsonRepresentation];
        v116 = @"fullNavTrace";
      }
      else
      {
        v115 = [v113 dictionaryRepresentation];
        v116 = @"full_nav_trace";
      }
      id v117 = v115;

      [v4 setObject:v117 forKey:v116];
    }

    v118 = [(id)a1 telemetric];
    v119 = v118;
    if (v118)
    {
      if (a2) {
        [v118 jsonRepresentation];
      }
      else {
      id v120 = [v118 dictionaryRepresentation];
      }

      [v4 setObject:v120 forKey:@"telemetric"];
    }

    v121 = [(id)a1 clientAcSuggestions];
    uint64_t v122 = v121;
    if (v121)
    {
      if (a2)
      {
        v123 = [v121 jsonRepresentation];
        v124 = @"clientAcSuggestions";
      }
      else
      {
        v123 = [v121 dictionaryRepresentation];
        v124 = @"client_ac_suggestions";
      }
      id v125 = v123;

      [v4 setObject:v125 forKey:v124];
    }

    uint64_t v126 = [(id)a1 realtimeTrafficProbeCollection];
    v127 = v126;
    if (v126)
    {
      if (a2)
      {
        v128 = [v126 jsonRepresentation];
        v129 = @"realtimeTrafficProbeCollection";
      }
      else
      {
        v128 = [v126 dictionaryRepresentation];
        v129 = @"realtime_traffic_probe_collection";
      }
      id v130 = v128;

      [v4 setObject:v130 forKey:v129];
    }

    uint64_t v131 = [(id)a1 batchTrafficProbeCollection];
    v132 = v131;
    if (v131)
    {
      if (a2)
      {
        v133 = [v131 jsonRepresentation];
        v134 = @"batchTrafficProbeCollection";
      }
      else
      {
        v133 = [v131 dictionaryRepresentation];
        v134 = @"batch_traffic_probe_collection";
      }
      id v135 = v133;

      [v4 setObject:v135 forKey:v134];
    }

    uint64_t v136 = [(id)a1 commuteWindow];
    v137 = v136;
    if (v136)
    {
      if (a2)
      {
        v138 = [v136 jsonRepresentation];
        v139 = @"commuteWindow";
      }
      else
      {
        v138 = [v136 dictionaryRepresentation];
        v139 = @"commute_window";
      }
      id v140 = v138;

      [v4 setObject:v140 forKey:v139];
    }

    uint64_t v141 = [(id)a1 wifiConnectionQualityProbeEvent];
    v142 = v141;
    if (v141)
    {
      if (a2)
      {
        v143 = [v141 jsonRepresentation];
        v144 = @"wifiConnectionQualityProbeEvent";
      }
      else
      {
        v143 = [v141 dictionaryRepresentation];
        v144 = @"wifi_connection_quality_probe_event";
      }
      id v145 = v143;

      [v4 setObject:v145 forKey:v144];
    }

    uint64_t v146 = [(id)a1 parkedCar];
    v147 = v146;
    if (v146)
    {
      if (a2)
      {
        v148 = [v146 jsonRepresentation];
        v149 = @"parkedCar";
      }
      else
      {
        v148 = [v146 dictionaryRepresentation];
        v149 = @"parked_car";
      }
      id v150 = v148;

      [v4 setObject:v150 forKey:v149];
    }

    uint64_t v151 = [(id)a1 tileCacheAnalytic];
    v152 = v151;
    if (v151)
    {
      if (a2)
      {
        v153 = [v151 jsonRepresentation];
        v154 = @"tileCacheAnalytic";
      }
      else
      {
        v153 = [v151 dictionaryRepresentation];
        v154 = @"tile_cache_analytic";
      }
      id v155 = v153;

      [v4 setObject:v155 forKey:v154];
    }

    uint64_t v156 = [(id)a1 gridDuration];
    v157 = v156;
    if (v156)
    {
      if (a2)
      {
        v158 = [v156 jsonRepresentation];
        v159 = @"gridDuration";
      }
      else
      {
        v158 = [v156 dictionaryRepresentation];
        v159 = @"grid_duration";
      }
      id v160 = v158;

      [v4 setObject:v160 forKey:v159];
    }

    uint64_t v161 = [(id)a1 displayAnalytic];
    v162 = v161;
    if (v161)
    {
      if (a2)
      {
        v163 = [v161 jsonRepresentation];
        v164 = @"displayAnalytic";
      }
      else
      {
        v163 = [v161 dictionaryRepresentation];
        v164 = @"display_analytic";
      }
      id v165 = v163;

      [v4 setObject:v165 forKey:v164];
    }

    uint64_t v166 = [(id)a1 throttleEvent];
    v167 = v166;
    if (v166)
    {
      if (a2)
      {
        v168 = [v166 jsonRepresentation];
        v169 = @"throttleEvent";
      }
      else
      {
        v168 = [v166 dictionaryRepresentation];
        v169 = @"throttle_event";
      }
      id v170 = v168;

      [v4 setObject:v170 forKey:v169];
    }

    uint64_t v171 = [(id)a1 mapKitCounts];
    v172 = v171;
    if (v171)
    {
      if (a2)
      {
        v173 = [v171 jsonRepresentation];
        v174 = @"mapKitCounts";
      }
      else
      {
        v173 = [v171 dictionaryRepresentation];
        v174 = @"map_kit_counts";
      }
      id v175 = v173;

      [v4 setObject:v175 forKey:v174];
    }

    uint64_t v176 = [(id)a1 predExTrainingData];
    v177 = v176;
    if (v176)
    {
      if (a2)
      {
        v178 = [v176 jsonRepresentation];
        v179 = @"predExTrainingData";
      }
      else
      {
        v178 = [v176 dictionaryRepresentation];
        v179 = @"pred_ex_training_data";
      }
      id v180 = v178;

      [v4 setObject:v180 forKey:v179];
    }

    uint64_t v181 = [(id)a1 marcoLiteUsage];
    v182 = v181;
    if (v181)
    {
      if (a2)
      {
        v183 = [v181 jsonRepresentation];
        v184 = @"marcoLiteUsage";
      }
      else
      {
        v183 = [v181 dictionaryRepresentation];
        v184 = @"marco_lite_usage";
      }
      id v185 = v183;

      [v4 setObject:v185 forKey:v184];
    }

    uint64_t v186 = [(id)a1 tripDepartureFeedback];
    v187 = v186;
    if (v186)
    {
      if (a2)
      {
        v188 = [v186 jsonRepresentation];
        v189 = @"tripDepartureFeedback";
      }
      else
      {
        v188 = [v186 dictionaryRepresentation];
        v189 = @"trip_departure_feedback";
      }
      id v190 = v188;

      [v4 setObject:v190 forKey:v189];
    }

    uint64_t v191 = [(id)a1 directionsRequestDetails];
    v192 = v191;
    if (v191)
    {
      if (a2)
      {
        v193 = [v191 jsonRepresentation];
        v194 = @"directionsRequestDetails";
      }
      else
      {
        v193 = [v191 dictionaryRepresentation];
        v194 = @"directions_request_details";
      }
      id v195 = v193;

      [v4 setObject:v195 forKey:v194];
    }

    uint64_t v196 = [(id)a1 evRoutingVehicleDetails];
    v197 = v196;
    if (v196)
    {
      if (a2)
      {
        v198 = [v196 jsonRepresentation];
        v199 = @"evRoutingVehicleDetails";
      }
      else
      {
        v198 = [v196 dictionaryRepresentation];
        v199 = @"ev_routing_vehicle_details";
      }
      id v200 = v198;

      [v4 setObject:v200 forKey:v199];
    }

    uint64_t v201 = [(id)a1 evTrip];
    v202 = v201;
    if (v201)
    {
      if (a2)
      {
        v203 = [v201 jsonRepresentation];
        v204 = @"evTrip";
      }
      else
      {
        v203 = [v201 dictionaryRepresentation];
        v204 = @"ev_trip";
      }
      id v205 = v203;

      [v4 setObject:v205 forKey:v204];
    }

    uint64_t v206 = [(id)a1 curatedCollectionStats];
    v207 = v206;
    if (v206)
    {
      if (a2)
      {
        v208 = [v206 jsonRepresentation];
        v209 = @"curatedCollectionStats";
      }
      else
      {
        v208 = [v206 dictionaryRepresentation];
        v209 = @"curated_collection_stats";
      }
      id v210 = v208;

      [v4 setObject:v210 forKey:v209];
    }

    uint64_t v211 = [(id)a1 curatedCollectionUsage];
    v212 = v211;
    if (v211)
    {
      if (a2)
      {
        v213 = [v211 jsonRepresentation];
        v214 = @"curatedCollectionUsage";
      }
      else
      {
        v213 = [v211 dictionaryRepresentation];
        v214 = @"curated_collection_usage";
      }
      id v215 = v213;

      [v4 setObject:v215 forKey:v214];
    }

    uint64_t v216 = [(id)a1 mapsDeviceSettings];
    v217 = v216;
    if (v216)
    {
      if (a2)
      {
        v218 = [v216 jsonRepresentation];
        v219 = @"mapsDeviceSettings";
      }
      else
      {
        v218 = [v216 dictionaryRepresentation];
        v219 = @"maps_device_settings";
      }
      id v220 = v218;

      [v4 setObject:v220 forKey:v219];
    }

    uint64_t v221 = [(id)a1 hardStop];
    v222 = v221;
    if (v221)
    {
      if (a2)
      {
        v223 = [v221 jsonRepresentation];
        v224 = @"hardStop";
      }
      else
      {
        v223 = [v221 dictionaryRepresentation];
        v224 = @"hard_stop";
      }
      id v225 = v223;

      [v4 setObject:v225 forKey:v224];
    }

    uint64_t v226 = [(id)a1 vlfUsage];
    v227 = v226;
    if (v226)
    {
      if (a2)
      {
        v228 = [v226 jsonRepresentation];
        v229 = @"vlfUsage";
      }
      else
      {
        v228 = [v226 dictionaryRepresentation];
        v229 = @"vlf_usage";
      }
      id v230 = v228;

      [v4 setObject:v230 forKey:v229];
    }

    uint64_t v231 = [(id)a1 logDiscard];
    v232 = v231;
    if (v231)
    {
      if (a2)
      {
        v233 = [v231 jsonRepresentation];
        v234 = @"logDiscard";
      }
      else
      {
        v233 = [v231 dictionaryRepresentation];
        v234 = @"log_discard";
      }
      id v235 = v233;

      [v4 setObject:v235 forKey:v234];
    }

    uint64_t v236 = [(id)a1 dailyUseSummary];
    v237 = v236;
    if (v236)
    {
      if (a2)
      {
        v238 = [v236 jsonRepresentation];
        v239 = @"dailyUseSummary";
      }
      else
      {
        v238 = [v236 dictionaryRepresentation];
        v239 = @"daily_use_summary";
      }
      id v240 = v238;

      [v4 setObject:v240 forKey:v239];
    }

    uint64_t v241 = [(id)a1 pressureData];
    v242 = v241;
    if (v241)
    {
      if (a2)
      {
        v243 = [v241 jsonRepresentation];
        v244 = @"pressureData";
      }
      else
      {
        v243 = [v241 dictionaryRepresentation];
        v244 = @"pressure_data";
      }
      id v245 = v243;

      [v4 setObject:v245 forKey:v244];
    }

    uint64_t v246 = [(id)a1 poiBusynessData];
    v247 = v246;
    if (v246)
    {
      if (a2)
      {
        v248 = [v246 jsonRepresentation];
        v249 = @"poiBusynessData";
      }
      else
      {
        v248 = [v246 dictionaryRepresentation];
        v249 = @"poi_busyness_data";
      }
      id v250 = v248;

      [v4 setObject:v250 forKey:v249];
    }

    uint64_t v251 = [(id)a1 periodicSettingsSummary];
    v252 = v251;
    if (v251)
    {
      if (a2)
      {
        v253 = [v251 jsonRepresentation];
        v254 = @"periodicSettingsSummary";
      }
      else
      {
        v253 = [v251 dictionaryRepresentation];
        v254 = @"periodic_settings_summary";
      }
      id v255 = v253;

      [v4 setObject:v255 forKey:v254];
    }

    uint64_t v256 = [(id)a1 thermalPressure];
    v257 = v256;
    if (v256)
    {
      if (a2)
      {
        v258 = [v256 jsonRepresentation];
        v259 = @"thermalPressure";
      }
      else
      {
        v258 = [v256 dictionaryRepresentation];
        v259 = @"thermal_pressure";
      }
      id v260 = v258;

      [v4 setObject:v260 forKey:v259];
    }

    uint64_t v261 = [(id)a1 arSessionUsage];
    v262 = v261;
    if (v261)
    {
      if (a2)
      {
        v263 = [v261 jsonRepresentation];
        v264 = @"arSessionUsage";
      }
      else
      {
        v263 = [v261 dictionaryRepresentation];
        v264 = @"ar_session_usage";
      }
      id v265 = v263;

      [v4 setObject:v265 forKey:v264];
    }

    uint64_t v266 = [(id)a1 networkSelectionHarvest];
    v267 = v266;
    if (v266)
    {
      if (a2)
      {
        v268 = [v266 jsonRepresentation];
        v269 = @"networkSelectionHarvest";
      }
      else
      {
        v268 = [v266 dictionaryRepresentation];
        v269 = @"network_selection_harvest";
      }
      id v270 = v268;

      [v4 setObject:v270 forKey:v269];
    }

    uint64_t v271 = [(id)a1 impressionEvent];
    v272 = v271;
    if (v271)
    {
      if (a2)
      {
        v273 = [v271 jsonRepresentation];
        v274 = @"impressionEvent";
      }
      else
      {
        v273 = [v271 dictionaryRepresentation];
        v274 = @"impression_event";
      }
      id v275 = v273;

      [v4 setObject:v275 forKey:v274];
    }

    uint64_t v276 = [(id)a1 showcaseSuppression];
    v277 = v276;
    if (v276)
    {
      if (a2)
      {
        v278 = [v276 jsonRepresentation];
        v279 = @"showcaseSuppression";
      }
      else
      {
        v278 = [v276 dictionaryRepresentation];
        v279 = @"showcase_suppression";
      }
      id v280 = v278;

      [v4 setObject:v280 forKey:v279];
    }

    uint64_t v281 = [(id)a1 placeCacheLookup];
    v282 = v281;
    if (v281)
    {
      if (a2)
      {
        v283 = [v281 jsonRepresentation];
        v284 = @"placeCacheLookup";
      }
      else
      {
        v283 = [v281 dictionaryRepresentation];
        v284 = @"place_cache_lookup";
      }
      id v285 = v283;

      [v4 setObject:v285 forKey:v284];
    }

    uint64_t v286 = [(id)a1 deviceSyncStatus];
    v287 = v286;
    if (v286)
    {
      if (a2)
      {
        v288 = [v286 jsonRepresentation];
        v289 = @"deviceSyncStatus";
      }
      else
      {
        v288 = [v286 dictionaryRepresentation];
        v289 = @"device_sync_status";
      }
      id v290 = v288;

      [v4 setObject:v290 forKey:v289];
    }

    uint64_t v291 = [(id)a1 mapsInteraction];
    v292 = v291;
    if (v291)
    {
      if (a2)
      {
        v293 = [v291 jsonRepresentation];
        v294 = @"mapsInteraction";
      }
      else
      {
        v293 = [v291 dictionaryRepresentation];
        v294 = @"maps_interaction";
      }
      id v295 = v293;

      [v4 setObject:v295 forKey:v294];
    }

    uint64_t v296 = [(id)a1 networkEventSummary];
    v297 = v296;
    if (v296)
    {
      if (a2)
      {
        v298 = [v296 jsonRepresentation];
        v299 = @"networkEventSummary";
      }
      else
      {
        v298 = [v296 dictionaryRepresentation];
        v299 = @"network_event_summary";
      }
      id v300 = v298;

      [v4 setObject:v300 forKey:v299];
    }

    uint64_t v301 = [(id)a1 serviceMetadata];
    v302 = v301;
    if (v301)
    {
      if (a2)
      {
        v303 = [v301 jsonRepresentation];
        v304 = @"serviceMetadata";
      }
      else
      {
        v303 = [v301 dictionaryRepresentation];
        v304 = @"service_metadata";
      }
      id v305 = v303;

      [v4 setObject:v305 forKey:v304];
    }

    uint64_t v306 = [(id)a1 mapsEngagement];
    v307 = v306;
    if (v306)
    {
      if (a2)
      {
        v308 = [v306 jsonRepresentation];
        v309 = @"mapsEngagement";
      }
      else
      {
        v308 = [v306 dictionaryRepresentation];
        v309 = @"maps_engagement";
      }
      id v310 = v308;

      [v4 setObject:v310 forKey:v309];
    }

    if (*(unsigned char *)(a1 + 528))
    {
      uint64_t v311 = [NSNumber numberWithDouble:*(double *)(a1 + 480)];
      if (a2) {
        v312 = @"usageEventTime";
      }
      else {
        v312 = @"usage_event_time";
      }
      [v4 setObject:v311 forKey:v312];
    }
    id v313 = v4;
  }
  else
  {
    id v313 = 0;
  }

  return v313;
}

- (GEOLogMsgEvent)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEvent;
  id v3 = [(GEOLogMsgEvent *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)setLogMsgStates:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x8000000000000000;
  logMsgStates = self->_logMsgStates;
  self->_logMsgStates = v4;
}

- (void)clearLogMsgStates
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x8000000000000000;
  logMsgStates = self->_logMsgStates;

  [(NSMutableArray *)logMsgStates removeAllObjects];
}

- (unint64_t)logMsgStatesCount
{
  -[GEOLogMsgEvent _readLogMsgStates]((uint64_t)self);
  logMsgStates = self->_logMsgStates;

  return [(NSMutableArray *)logMsgStates count];
}

- (id)logMsgStateAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEvent _readLogMsgStates]((uint64_t)self);
  logMsgStates = self->_logMsgStates;

  return (id)[(NSMutableArray *)logMsgStates objectAtIndex:a3];
}

+ (Class)logMsgStateType
{
  return (Class)objc_opt_class();
}

- (void)_readAnalyticTag
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 528) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnalyticTag_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasAnalyticTag
{
  return self->_analyticTag != 0;
}

- (GEOLogMsgEventId)analyticTag
{
  -[GEOLogMsgEvent _readAnalyticTag]((uint64_t)self);
  analyticTag = self->_analyticTag;

  return analyticTag;
}

- (void)setAnalyticTag:(id)a3
{
  *(void *)&self->_flags |= 0x8000000000000004;
  objc_storeStrong((id *)&self->_analyticTag, a3);
}

- (void)_readMapsEnvironment
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 531) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsEnvironment_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasMapsEnvironment
{
  return self->_mapsEnvironment != 0;
}

- (NSString)mapsEnvironment
{
  -[GEOLogMsgEvent _readMapsEnvironment]((uint64_t)self);
  mapsEnvironment = self->_mapsEnvironment;

  return mapsEnvironment;
}

- (void)setMapsEnvironment:(id)a3
{
  *(void *)&self->_flags |= 0x8000000008000000;
  objc_storeStrong((id *)&self->_mapsEnvironment, a3);
}

- (void)setHasEventType:(BOOL)a3
{
  unint64_t v3 = 0x8000000000000002;
  if (!a3) {
    unint64_t v3 = 0x8000000000000000;
  }
  self->_$6A63E7CDA14C5D1C599C38C8531A0EC3 flags = ($6A63E7CDA14C5D1C599C38C8531A0EC3)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasEventType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)eventTypeAsString:(int)a3
{
  id v4 = @"LOG_MSG_EVENT_TYPE_UNKNOWN";
  switch(a3)
  {
    case 0:
      goto LABEL_9;
    case 1:
      id v4 = @"USER_ACTION";
      break;
    case 2:
      id v4 = @"STATE_TIMING";
      break;
    case 4:
      id v4 = @"TILE_SET_STATE";
      break;
    case 5:
      id v4 = @"PLACE_DATA_CACHE";
      break;
    case 6:
      id v4 = @"NETWORK";
      break;
    case 7:
      id v4 = @"CACHE_HIT";
      break;
    case 8:
      id v4 = @"DIRECTIONS";
      break;
    case 9:
      id v4 = @"TRANSIT_APP_LAUNCH";
      break;
    case 10:
      id v4 = @"TIME_TO_LEAVE_HYPOTHESIS";
      break;
    case 11:
      id v4 = @"TIME_TO_LEAVE_INITIAL_TRAVEL_TIME";
      break;
    case 12:
      id v4 = @"LOG_FRAMEWORK";
      break;
    case 13:
      id v4 = @"MAPS_WIDGETS_SESSION";
      break;
    case 14:
      id v4 = @"LIST_INTERACTION_SESSION";
      break;
    case 15:
      id v4 = @"REFINE_SEARCH_SESSION";
      break;
    case 16:
      id v4 = @"PROACTIVE_SUGGESTION_SESSION";
      break;
    case 17:
      id v4 = @"MAP_LAUNCH";
      break;
    case 18:
      id v4 = @"RIDE_BOOKING_SESSION";
      break;
    case 19:
      id v4 = @"RIDE_BOOKED_SESSION";
      break;
    case 20:
      id v4 = @"TABLE_BOOKING_SESSION";
      break;
    case 21:
      id v4 = @"TABLE_BOOKED_SESSION";
      break;
    case 22:
      id v4 = @"STALE_RESOURCE";
      break;
    case 23:
      id v4 = @"FULL_NAV_TRACE";
      break;
    case 24:
      id v4 = @"TELEMETRIC";
      break;
    case 25:
      id v4 = @"CLIENT_AC_SUGGESTIONS";
      break;
    case 26:
      id v4 = @"REALTIME_TRAFFIC_PROBE_COLLECTION";
      break;
    case 27:
      id v4 = @"BATCH_TRAFFIC_PROBE_COLLECTION";
      break;
    case 28:
      id v4 = @"OFFLINE_REQUEST_RESPONSE";
      break;
    case 29:
      id v4 = @"COMMUTE_WINDOW";
      break;
    case 30:
      id v4 = @"GENERIC_APP_ERROR";
      break;
    case 31:
      id v4 = @"WIFI_CONNECTION_QUALITY_PROBE";
      break;
    case 32:
      id v4 = @"PARKED_CAR";
      break;
    case 33:
      id v4 = @"TILE_CACHE_ANALYTIC";
      break;
    case 34:
      id v4 = @"GRID_DURATION";
      break;
    case 35:
      id v4 = @"DISPLAY_ANALYTIC";
      break;
    case 36:
      id v4 = @"THROTTLE";
      break;
    case 37:
      id v4 = @"MAP_KIT_COUNTS";
      break;
    case 38:
      id v4 = @"PRED_EX_TRAINING";
      break;
    case 39:
      id v4 = @"MARCOLITE_USAGE";
      break;
    case 40:
      id v4 = @"TRIP_DEPARTURE";
      break;
    case 41:
      id v4 = @"DIRECTIONS_REQUEST_DETAILS";
      break;
    case 42:
      id v4 = @"EV_ROUTING_VEHICLE_DETAILS";
      break;
    case 43:
      id v4 = @"EV_TRIP";
      break;
    case 44:
      id v4 = @"CURATED_COLLECTION_STATS";
      break;
    case 45:
      id v4 = @"CURATED_COLLECTION_USAGE";
      break;
    case 46:
      id v4 = @"MAPS_DEVICE_SETTINGS";
      break;
    case 47:
      id v4 = @"HARD_STOP";
      break;
    case 48:
      id v4 = @"VLF_USAGE";
      break;
    case 49:
      id v4 = @"LOG_DISCARD";
      break;
    case 50:
      id v4 = @"DAILY_USE_SUMMARY";
      break;
    case 51:
      id v4 = @"PRESSURE_DATA";
      break;
    case 52:
      id v4 = @"POI_BUSYNESS_DATA";
      break;
    case 53:
      id v4 = @"PERIODIC_SETTINGS_SUMMARY";
      break;
    case 54:
      id v4 = @"THERMAL_PRESSURE";
      break;
    case 55:
      id v4 = @"AR_SESSION_USAGE";
      break;
    case 56:
      id v4 = @"NETWORK_SELECTION_HARVEST";
      break;
    case 57:
      id v4 = @"IMPRESSION_EVENT";
      break;
    case 58:
      id v4 = @"SHOWCASE_SUPPRESSION";
      break;
    case 59:
      id v4 = @"PLACE_CACHE_LOOKUP";
      break;
    case 60:
      id v4 = @"DEVICE_SYNC_STATUS";
      break;
    case 61:
      id v4 = @"MAPS_INTERACTION";
      break;
    case 62:
      id v4 = @"NETWORK_EVENT_SUMMARY";
      break;
    case 63:
      id v4 = @"SERVICE_METADATA";
      break;
    case 64:
      id v4 = @"MAPS_ENGAGEMENT";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      break;
  }
  return v4;
}

- (int)StringAsEventType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LOG_MSG_EVENT_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"USER_ACTION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STATE_TIMING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TILE_SET_STATE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PLACE_DATA_CACHE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"NETWORK"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CACHE_HIT"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"TRANSIT_APP_LAUNCH"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"TIME_TO_LEAVE_HYPOTHESIS"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"TIME_TO_LEAVE_INITIAL_TRAVEL_TIME"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"LOG_FRAMEWORK"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGETS_SESSION"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"LIST_INTERACTION_SESSION"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"REFINE_SEARCH_SESSION"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_SUGGESTION_SESSION"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"MAP_LAUNCH"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"RIDE_BOOKING_SESSION"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"RIDE_BOOKED_SESSION"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"TABLE_BOOKING_SESSION"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"TABLE_BOOKED_SESSION"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"STALE_RESOURCE"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"FULL_NAV_TRACE"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"TELEMETRIC"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"CLIENT_AC_SUGGESTIONS"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"REALTIME_TRAFFIC_PROBE_COLLECTION"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"BATCH_TRAFFIC_PROBE_COLLECTION"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"OFFLINE_REQUEST_RESPONSE"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"COMMUTE_WINDOW"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"GENERIC_APP_ERROR"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"WIFI_CONNECTION_QUALITY_PROBE"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"PARKED_CAR"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"TILE_CACHE_ANALYTIC"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"GRID_DURATION"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"DISPLAY_ANALYTIC"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"THROTTLE"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"MAP_KIT_COUNTS"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"PRED_EX_TRAINING"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"MARCOLITE_USAGE"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"TRIP_DEPARTURE"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_REQUEST_DETAILS"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"EV_ROUTING_VEHICLE_DETAILS"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"EV_TRIP"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTION_STATS"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTION_USAGE"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"MAPS_DEVICE_SETTINGS"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"HARD_STOP"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"VLF_USAGE"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"LOG_DISCARD"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"DAILY_USE_SUMMARY"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"PRESSURE_DATA"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"POI_BUSYNESS_DATA"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"PERIODIC_SETTINGS_SUMMARY"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"THERMAL_PRESSURE"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"AR_SESSION_USAGE"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"NETWORK_SELECTION_HARVEST"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"IMPRESSION_EVENT"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"SHOWCASE_SUPPRESSION"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"PLACE_CACHE_LOOKUP"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"DEVICE_SYNC_STATUS"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"MAPS_INTERACTION"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"NETWORK_EVENT_SUMMARY"])
  {
    int v4 = 62;
  }
  else if ([v3 isEqualToString:@"SERVICE_METADATA"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"MAPS_ENGAGEMENT"])
  {
    int v4 = 64;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasUserActionEvent
{
  return self->_userActionEvent != 0;
}

- (void)_readStateTimingEvent
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 534) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStateTimingEvent_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasStateTimingEvent
{
  return self->_stateTimingEvent != 0;
}

- (GEOLogMsgEventStateTiming)stateTimingEvent
{
  -[GEOLogMsgEvent _readStateTimingEvent]((uint64_t)self);
  stateTimingEvent = self->_stateTimingEvent;

  return stateTimingEvent;
}

- (void)setStateTimingEvent:(id)a3
{
  *(void *)&self->_flags |= 0x8001000000000000;
  objc_storeStrong((id *)&self->_stateTimingEvent, a3);
}

- (void)_readTileSetStateEvent
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 534) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTileSetStateEvent_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasTileSetStateEvent
{
  return self->_tileSetStateEvent != 0;
}

- (GEOLogMsgEventTileSetState)tileSetStateEvent
{
  -[GEOLogMsgEvent _readTileSetStateEvent]((uint64_t)self);
  tileSetStateEvent = self->_tileSetStateEvent;

  return tileSetStateEvent;
}

- (void)setTileSetStateEvent:(id)a3
{
  *(void *)&self->_flags |= 0x8080000000000000;
  objc_storeStrong((id *)&self->_tileSetStateEvent, a3);
}

- (void)_readPlaceDataCacheEvent
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 532) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceDataCacheEvent_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasPlaceDataCacheEvent
{
  return self->_placeDataCacheEvent != 0;
}

- (GEOLogMsgEventPlaceDataCache)placeDataCacheEvent
{
  -[GEOLogMsgEvent _readPlaceDataCacheEvent]((uint64_t)self);
  placeDataCacheEvent = self->_placeDataCacheEvent;

  return placeDataCacheEvent;
}

- (void)setPlaceDataCacheEvent:(id)a3
{
  *(void *)&self->_flags |= 0x8000002000000000;
  objc_storeStrong((id *)&self->_placeDataCacheEvent, a3);
}

- (void)_readNetworkEvent
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 532) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNetworkEvent_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasNetworkEvent
{
  return self->_networkEvent != 0;
}

- (GEOLogMsgEventNetwork)networkEvent
{
  -[GEOLogMsgEvent _readNetworkEvent]((uint64_t)self);
  networkEvent = self->_networkEvent;

  return networkEvent;
}

- (void)setNetworkEvent:(id)a3
{
  *(void *)&self->_flags |= 0x8000000100000000;
  objc_storeStrong((id *)&self->_networkEvent, a3);
}

- (void)setDirectionsEvent:(id)a3
{
  *(void *)&self->_flags |= 0x8000000000000800;
  objc_storeStrong((id *)&self->_directionsEvent, a3);
}

- (void)_readTransitAppLaunchEvent
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 535) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitAppLaunchEvent_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasTransitAppLaunchEvent
{
  return self->_transitAppLaunchEvent != 0;
}

- (GEOLogMsgEventTransitAppLaunch)transitAppLaunchEvent
{
  -[GEOLogMsgEvent _readTransitAppLaunchEvent]((uint64_t)self);
  transitAppLaunchEvent = self->_transitAppLaunchEvent;

  return transitAppLaunchEvent;
}

- (void)setTransitAppLaunchEvent:(id)a3
{
  *(void *)&self->_flags |= 0x8400000000000000;
  objc_storeStrong((id *)&self->_transitAppLaunchEvent, a3);
}

- (void)_readTimeToLeaveHypothesisEvent
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 535) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimeToLeaveHypothesisEvent_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasTimeToLeaveHypothesisEvent
{
  return self->_timeToLeaveHypothesisEvent != 0;
}

- (GEOLogMsgEventTimeToLeaveHypothesis)timeToLeaveHypothesisEvent
{
  -[GEOLogMsgEvent _readTimeToLeaveHypothesisEvent]((uint64_t)self);
  timeToLeaveHypothesisEvent = self->_timeToLeaveHypothesisEvent;

  return timeToLeaveHypothesisEvent;
}

- (void)setTimeToLeaveHypothesisEvent:(id)a3
{
  *(void *)&self->_flags |= 0x8100000000000000;
  objc_storeStrong((id *)&self->_timeToLeaveHypothesisEvent, a3);
}

- (void)_readTimeToLeaveInitialTravelTimeEvent
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 535) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimeToLeaveInitialTravelTimeEvent_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasTimeToLeaveInitialTravelTimeEvent
{
  return self->_timeToLeaveInitialTravelTimeEvent != 0;
}

- (GEOLogMsgEventTimeToLeaveInitialTravelTime)timeToLeaveInitialTravelTimeEvent
{
  -[GEOLogMsgEvent _readTimeToLeaveInitialTravelTimeEvent]((uint64_t)self);
  timeToLeaveInitialTravelTimeEvent = self->_timeToLeaveInitialTravelTimeEvent;

  return timeToLeaveInitialTravelTimeEvent;
}

- (void)setTimeToLeaveInitialTravelTimeEvent:(id)a3
{
  *(void *)&self->_flags |= 0x8200000000000000;
  objc_storeStrong((id *)&self->_timeToLeaveInitialTravelTimeEvent, a3);
}

- (void)_readMapsWidgetsInteractionSession
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 531) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsWidgetsInteractionSession_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasMapsWidgetsInteractionSession
{
  return self->_mapsWidgetsInteractionSession != 0;
}

- (GEOLogMsgEventMapsWidgetsInteractionSession)mapsWidgetsInteractionSession
{
  -[GEOLogMsgEvent _readMapsWidgetsInteractionSession]((uint64_t)self);
  mapsWidgetsInteractionSession = self->_mapsWidgetsInteractionSession;

  return mapsWidgetsInteractionSession;
}

- (void)setMapsWidgetsInteractionSession:(id)a3
{
  *(void *)&self->_flags |= 0x8000000020000000;
  objc_storeStrong((id *)&self->_mapsWidgetsInteractionSession, a3);
}

- (void)_readListInteractionSession
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 530) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readListInteractionSession_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasListInteractionSession
{
  return self->_listInteractionSession != 0;
}

- (GEOLogMsgEventListInteractionSession)listInteractionSession
{
  -[GEOLogMsgEvent _readListInteractionSession]((uint64_t)self);
  listInteractionSession = self->_listInteractionSession;

  return listInteractionSession;
}

- (void)setListInteractionSession:(id)a3
{
  *(void *)&self->_flags |= 0x8000000000100000;
  objc_storeStrong((id *)&self->_listInteractionSession, a3);
}

- (void)_readRefineSearchSession
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 533) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRefineSearchSession_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasRefineSearchSession
{
  return self->_refineSearchSession != 0;
}

- (GEOLogMsgEventRefineSearchSession)refineSearchSession
{
  -[GEOLogMsgEvent _readRefineSearchSession]((uint64_t)self);
  refineSearchSession = self->_refineSearchSession;

  return refineSearchSession;
}

- (void)setRefineSearchSession:(id)a3
{
  *(void *)&self->_flags |= 0x8000080000000000;
  objc_storeStrong((id *)&self->_refineSearchSession, a3);
}

- (void)_readProactiveSuggestionInteractionSessionEvent
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 533) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProactiveSuggestionInteractionSessionEvent_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasProactiveSuggestionInteractionSessionEvent
{
  return self->_proactiveSuggestionInteractionSessionEvent != 0;
}

- (GEOLogMsgEventProactiveSuggestionInteractionSession)proactiveSuggestionInteractionSessionEvent
{
  -[GEOLogMsgEvent _readProactiveSuggestionInteractionSessionEvent]((uint64_t)self);
  proactiveSuggestionInteractionSessionEvent = self->_proactiveSuggestionInteractionSessionEvent;

  return proactiveSuggestionInteractionSessionEvent;
}

- (void)setProactiveSuggestionInteractionSessionEvent:(id)a3
{
  *(void *)&self->_flags |= 0x8000020000000000;
  objc_storeStrong((id *)&self->_proactiveSuggestionInteractionSessionEvent, a3);
}

- (void)_readMapLaunchEvent
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 531) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapLaunchEvent_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasMapLaunchEvent
{
  return self->_mapLaunchEvent != 0;
}

- (GEOLogMsgEventMapLaunch)mapLaunchEvent
{
  -[GEOLogMsgEvent _readMapLaunchEvent]((uint64_t)self);
  mapLaunchEvent = self->_mapLaunchEvent;

  return mapLaunchEvent;
}

- (void)setMapLaunchEvent:(id)a3
{
  *(void *)&self->_flags |= 0x8000000001000000;
  objc_storeStrong((id *)&self->_mapLaunchEvent, a3);
}

- (void)_readRideBookingSession
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 533) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRideBookingSession_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasRideBookingSession
{
  return self->_rideBookingSession != 0;
}

- (GEOLogMsgEventRideBookingSession)rideBookingSession
{
  -[GEOLogMsgEvent _readRideBookingSession]((uint64_t)self);
  rideBookingSession = self->_rideBookingSession;

  return rideBookingSession;
}

- (void)setRideBookingSession:(id)a3
{
  *(void *)&self->_flags |= 0x8000200000000000;
  objc_storeStrong((id *)&self->_rideBookingSession, a3);
}

- (void)_readRideBookedSession
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 533) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRideBookedSession_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasRideBookedSession
{
  return self->_rideBookedSession != 0;
}

- (GEOLogMsgEventRideBookedSession)rideBookedSession
{
  -[GEOLogMsgEvent _readRideBookedSession]((uint64_t)self);
  rideBookedSession = self->_rideBookedSession;

  return rideBookedSession;
}

- (void)setRideBookedSession:(id)a3
{
  *(void *)&self->_flags |= 0x8000100000000000;
  objc_storeStrong((id *)&self->_rideBookedSession, a3);
}

- (void)_readTableBookingSession
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 534) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTableBookingSession_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasTableBookingSession
{
  return self->_tableBookingSession != 0;
}

- (GEOLogMsgEventTableBookingSession)tableBookingSession
{
  -[GEOLogMsgEvent _readTableBookingSession]((uint64_t)self);
  tableBookingSession = self->_tableBookingSession;

  return tableBookingSession;
}

- (void)setTableBookingSession:(id)a3
{
  *(void *)&self->_flags |= 0x8004000000000000;
  objc_storeStrong((id *)&self->_tableBookingSession, a3);
}

- (void)_readTableBookedSession
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 534) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTableBookedSession_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasTableBookedSession
{
  return self->_tableBookedSession != 0;
}

- (GEOLogMsgEventTableBookedSession)tableBookedSession
{
  -[GEOLogMsgEvent _readTableBookedSession]((uint64_t)self);
  tableBookedSession = self->_tableBookedSession;

  return tableBookedSession;
}

- (void)setTableBookedSession:(id)a3
{
  *(void *)&self->_flags |= 0x8002000000000000;
  objc_storeStrong((id *)&self->_tableBookedSession, a3);
}

- (void)_readFullNavTrace
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 530) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFullNavTrace_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasFullNavTrace
{
  return self->_fullNavTrace != 0;
}

- (GEOLogMsgEventFullNavTrace)fullNavTrace
{
  -[GEOLogMsgEvent _readFullNavTrace]((uint64_t)self);
  fullNavTrace = self->_fullNavTrace;

  return fullNavTrace;
}

- (void)setFullNavTrace:(id)a3
{
  *(void *)&self->_flags |= 0x8000000000010000;
  objc_storeStrong((id *)&self->_fullNavTrace, a3);
}

- (void)_readTelemetric
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 534) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTelemetric_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasTelemetric
{
  return self->_telemetric != 0;
}

- (GEOLogMsgEventTelemetric)telemetric
{
  -[GEOLogMsgEvent _readTelemetric]((uint64_t)self);
  telemetric = self->_telemetric;

  return telemetric;
}

- (void)setTelemetric:(id)a3
{
  *(void *)&self->_flags |= 0x8008000000000000;
  objc_storeStrong((id *)&self->_telemetric, a3);
}

- (void)_readClientAcSuggestions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 528) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientAcSuggestions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasClientAcSuggestions
{
  return self->_clientAcSuggestions != 0;
}

- (GEOLogMsgEventClientACSuggestions)clientAcSuggestions
{
  -[GEOLogMsgEvent _readClientAcSuggestions]((uint64_t)self);
  clientAcSuggestions = self->_clientAcSuggestions;

  return clientAcSuggestions;
}

- (void)setClientAcSuggestions:(id)a3
{
  *(void *)&self->_flags |= 0x8000000000000020;
  objc_storeStrong((id *)&self->_clientAcSuggestions, a3);
}

- (void)_readRealtimeTrafficProbeCollection
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 533) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRealtimeTrafficProbeCollection_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasRealtimeTrafficProbeCollection
{
  return self->_realtimeTrafficProbeCollection != 0;
}

- (GEOLogMsgEventRealtimeTrafficProbe)realtimeTrafficProbeCollection
{
  -[GEOLogMsgEvent _readRealtimeTrafficProbeCollection]((uint64_t)self);
  realtimeTrafficProbeCollection = self->_realtimeTrafficProbeCollection;

  return realtimeTrafficProbeCollection;
}

- (void)setRealtimeTrafficProbeCollection:(id)a3
{
  *(void *)&self->_flags |= 0x8000040000000000;
  objc_storeStrong((id *)&self->_realtimeTrafficProbeCollection, a3);
}

- (void)_readBatchTrafficProbeCollection
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 528) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBatchTrafficProbeCollection_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasBatchTrafficProbeCollection
{
  return self->_batchTrafficProbeCollection != 0;
}

- (GEOLogMsgEventBatchTrafficProbe)batchTrafficProbeCollection
{
  -[GEOLogMsgEvent _readBatchTrafficProbeCollection]((uint64_t)self);
  batchTrafficProbeCollection = self->_batchTrafficProbeCollection;

  return batchTrafficProbeCollection;
}

- (void)setBatchTrafficProbeCollection:(id)a3
{
  *(void *)&self->_flags |= 0x8000000000000010;
  objc_storeStrong((id *)&self->_batchTrafficProbeCollection, a3);
}

- (void)_readCommuteWindow
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 528) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCommuteWindow_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasCommuteWindow
{
  return self->_commuteWindow != 0;
}

- (GEOLogMsgEventCommuteWindow)commuteWindow
{
  -[GEOLogMsgEvent _readCommuteWindow]((uint64_t)self);
  commuteWindow = self->_commuteWindow;

  return commuteWindow;
}

- (void)setCommuteWindow:(id)a3
{
  *(void *)&self->_flags |= 0x8000000000000040;
  objc_storeStrong((id *)&self->_commuteWindow, a3);
}

- (void)setWifiConnectionQualityProbeEvent:(id)a3
{
  *(void *)&self->_flags |= 0xC000000000000000;
  objc_storeStrong((id *)&self->_wifiConnectionQualityProbeEvent, a3);
}

- (void)_readParkedCar
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 532) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readParkedCar_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasParkedCar
{
  return self->_parkedCar != 0;
}

- (GEOLogMsgEventParkedCar)parkedCar
{
  -[GEOLogMsgEvent _readParkedCar]((uint64_t)self);
  parkedCar = self->_parkedCar;

  return parkedCar;
}

- (void)setParkedCar:(id)a3
{
  *(void *)&self->_flags |= 0x8000000400000000;
  objc_storeStrong((id *)&self->_parkedCar, a3);
}

- (void)_readTileCacheAnalytic
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 534) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTileCacheAnalytic_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasTileCacheAnalytic
{
  return self->_tileCacheAnalytic != 0;
}

- (GEOLogMsgEventTileCacheAnalytic)tileCacheAnalytic
{
  -[GEOLogMsgEvent _readTileCacheAnalytic]((uint64_t)self);
  tileCacheAnalytic = self->_tileCacheAnalytic;

  return tileCacheAnalytic;
}

- (void)setTileCacheAnalytic:(id)a3
{
  *(void *)&self->_flags |= 0x8040000000000000;
  objc_storeStrong((id *)&self->_tileCacheAnalytic, a3);
}

- (void)_readGridDuration
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 530) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGridDuration_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasGridDuration
{
  return self->_gridDuration != 0;
}

- (GEOLogMsgEventGridDuration)gridDuration
{
  -[GEOLogMsgEvent _readGridDuration]((uint64_t)self);
  gridDuration = self->_gridDuration;

  return gridDuration;
}

- (void)setGridDuration:(id)a3
{
  *(void *)&self->_flags |= 0x8000000000020000;
  objc_storeStrong((id *)&self->_gridDuration, a3);
}

- (void)_readDisplayAnalytic
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 529) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayAnalytic_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasDisplayAnalytic
{
  return self->_displayAnalytic != 0;
}

- (GEOLogMsgEventDisplayAnalytic)displayAnalytic
{
  -[GEOLogMsgEvent _readDisplayAnalytic]((uint64_t)self);
  displayAnalytic = self->_displayAnalytic;

  return displayAnalytic;
}

- (void)setDisplayAnalytic:(id)a3
{
  *(void *)&self->_flags |= 0x8000000000002000;
  objc_storeStrong((id *)&self->_displayAnalytic, a3);
}

- (void)_readThrottleEvent
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 534) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readThrottleEvent_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasThrottleEvent
{
  return self->_throttleEvent != 0;
}

- (GEOLogMsgEventThrottle)throttleEvent
{
  -[GEOLogMsgEvent _readThrottleEvent]((uint64_t)self);
  throttleEvent = self->_throttleEvent;

  return throttleEvent;
}

- (void)setThrottleEvent:(id)a3
{
  *(void *)&self->_flags |= 0x8020000000000000;
  objc_storeStrong((id *)&self->_throttleEvent, a3);
}

- (void)_readMapKitCounts
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 530) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapKitCounts_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasMapKitCounts
{
  return self->_mapKitCounts != 0;
}

- (GEOLogMsgEventMapKitCounts)mapKitCounts
{
  -[GEOLogMsgEvent _readMapKitCounts]((uint64_t)self);
  mapKitCounts = self->_mapKitCounts;

  return mapKitCounts;
}

- (void)setMapKitCounts:(id)a3
{
  *(void *)&self->_flags |= 0x8000000000800000;
  objc_storeStrong((id *)&self->_mapKitCounts, a3);
}

- (void)_readPredExTrainingData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 532) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPredExTrainingData_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasPredExTrainingData
{
  return self->_predExTrainingData != 0;
}

- (GEOLogMsgEventPredExTrainingData)predExTrainingData
{
  -[GEOLogMsgEvent _readPredExTrainingData]((uint64_t)self);
  predExTrainingData = self->_predExTrainingData;

  return predExTrainingData;
}

- (void)setPredExTrainingData:(id)a3
{
  *(void *)&self->_flags |= 0x8000008000000000;
  objc_storeStrong((id *)&self->_predExTrainingData, a3);
}

- (void)_readMarcoLiteUsage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 531) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMarcoLiteUsage_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasMarcoLiteUsage
{
  return self->_marcoLiteUsage != 0;
}

- (GEOLogMsgEventMarcoLiteUsage)marcoLiteUsage
{
  -[GEOLogMsgEvent _readMarcoLiteUsage]((uint64_t)self);
  marcoLiteUsage = self->_marcoLiteUsage;

  return marcoLiteUsage;
}

- (void)setMarcoLiteUsage:(id)a3
{
  *(void *)&self->_flags |= 0x8000000040000000;
  objc_storeStrong((id *)&self->_marcoLiteUsage, a3);
}

- (void)_readTripDepartureFeedback
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 535) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTripDepartureFeedback_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasTripDepartureFeedback
{
  return self->_tripDepartureFeedback != 0;
}

- (GEOLogMsgEventTripDepartureFeedback)tripDepartureFeedback
{
  -[GEOLogMsgEvent _readTripDepartureFeedback]((uint64_t)self);
  tripDepartureFeedback = self->_tripDepartureFeedback;

  return tripDepartureFeedback;
}

- (void)setTripDepartureFeedback:(id)a3
{
  *(void *)&self->_flags |= 0x8800000000000000;
  objc_storeStrong((id *)&self->_tripDepartureFeedback, a3);
}

- (void)_readDirectionsRequestDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 529) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsRequestDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasDirectionsRequestDetails
{
  return self->_directionsRequestDetails != 0;
}

- (GEOLogMsgEventDirectionsRequestDetails)directionsRequestDetails
{
  -[GEOLogMsgEvent _readDirectionsRequestDetails]((uint64_t)self);
  directionsRequestDetails = self->_directionsRequestDetails;

  return directionsRequestDetails;
}

- (void)setDirectionsRequestDetails:(id)a3
{
  *(void *)&self->_flags |= 0x8000000000001000;
  objc_storeStrong((id *)&self->_directionsRequestDetails, a3);
}

- (void)_readEvRoutingVehicleDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 529) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEvRoutingVehicleDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasEvRoutingVehicleDetails
{
  return self->_evRoutingVehicleDetails != 0;
}

- (GEOLogMsgEventEVRoutingVehicleDetails)evRoutingVehicleDetails
{
  -[GEOLogMsgEvent _readEvRoutingVehicleDetails]((uint64_t)self);
  evRoutingVehicleDetails = self->_evRoutingVehicleDetails;

  return evRoutingVehicleDetails;
}

- (void)setEvRoutingVehicleDetails:(id)a3
{
  *(void *)&self->_flags |= 0x8000000000004000;
  objc_storeStrong((id *)&self->_evRoutingVehicleDetails, a3);
}

- (BOOL)hasEvTrip
{
  return self->_evTrip != 0;
}

- (void)setEvTrip:(id)a3
{
  *(void *)&self->_flags |= 0x8000000000008000;
  objc_storeStrong((id *)&self->_evTrip, a3);
}

- (BOOL)hasCuratedCollectionStats
{
  return self->_curatedCollectionStats != 0;
}

- (void)setCuratedCollectionStats:(id)a3
{
  *(void *)&self->_flags |= 0x8000000000000080;
  objc_storeStrong((id *)&self->_curatedCollectionStats, a3);
}

- (BOOL)hasCuratedCollectionUsage
{
  return self->_curatedCollectionUsage != 0;
}

- (GEOLogMsgEventCuratedCollectionUsage)curatedCollectionUsage
{
  -[GEOLogMsgEvent _readCuratedCollectionUsage]((uint64_t)self);
  curatedCollectionUsage = self->_curatedCollectionUsage;

  return curatedCollectionUsage;
}

- (void)setCuratedCollectionUsage:(id)a3
{
  *(void *)&self->_flags |= 0x8000000000000100;
  objc_storeStrong((id *)&self->_curatedCollectionUsage, a3);
}

- (void)_readMapsDeviceSettings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 531) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsDeviceSettings_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasMapsDeviceSettings
{
  return self->_mapsDeviceSettings != 0;
}

- (GEOLogMsgEventMapsDeviceSettings)mapsDeviceSettings
{
  -[GEOLogMsgEvent _readMapsDeviceSettings]((uint64_t)self);
  mapsDeviceSettings = self->_mapsDeviceSettings;

  return mapsDeviceSettings;
}

- (void)setMapsDeviceSettings:(id)a3
{
  *(void *)&self->_flags |= 0x8000000002000000;
  objc_storeStrong((id *)&self->_mapsDeviceSettings, a3);
}

- (void)_readHardStop
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 530) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHardStop_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasHardStop
{
  return self->_hardStop != 0;
}

- (GEOLogMsgEventHardStop)hardStop
{
  -[GEOLogMsgEvent _readHardStop]((uint64_t)self);
  hardStop = self->_hardStop;

  return hardStop;
}

- (void)setHardStop:(id)a3
{
  *(void *)&self->_flags |= 0x8000000000040000;
  objc_storeStrong((id *)&self->_hardStop, a3);
}

- (BOOL)hasVlfUsage
{
  return self->_vlfUsage != 0;
}

- (GEOLogMsgEventVLFUsage)vlfUsage
{
  -[GEOLogMsgEvent _readVlfUsage]((uint64_t)self);
  vlfUsage = self->_vlfUsage;

  return vlfUsage;
}

- (void)setVlfUsage:(id)a3
{
  *(void *)&self->_flags |= 0xA000000000000000;
  objc_storeStrong((id *)&self->_vlfUsage, a3);
}

- (GEOLogMsgEventLogDiscard)logDiscard
{
  -[GEOLogMsgEvent _readLogDiscard]((uint64_t)self);
  logDiscard = self->_logDiscard;

  return logDiscard;
}

- (void)setLogDiscard:(id)a3
{
  *(void *)&self->_flags |= 0x8000000000200000;
  objc_storeStrong((id *)&self->_logDiscard, a3);
}

- (void)_readDailyUseSummary
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 529) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDailyUseSummary_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasDailyUseSummary
{
  return self->_dailyUseSummary != 0;
}

- (GEOLogMsgEventDailyUseSummary)dailyUseSummary
{
  -[GEOLogMsgEvent _readDailyUseSummary]((uint64_t)self);
  dailyUseSummary = self->_dailyUseSummary;

  return dailyUseSummary;
}

- (void)setDailyUseSummary:(id)a3
{
  *(void *)&self->_flags |= 0x8000000000000200;
  objc_storeStrong((id *)&self->_dailyUseSummary, a3);
}

- (BOOL)hasPressureData
{
  return self->_pressureData != 0;
}

- (GEOLogMsgEventPressureData)pressureData
{
  -[GEOLogMsgEvent _readPressureData]((uint64_t)self);
  pressureData = self->_pressureData;

  return pressureData;
}

- (void)setPressureData:(id)a3
{
  *(void *)&self->_flags |= 0x8000010000000000;
  objc_storeStrong((id *)&self->_pressureData, a3);
}

- (void)_readPoiBusynessData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 532) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPoiBusynessData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasPoiBusynessData
{
  return self->_poiBusynessData != 0;
}

- (GEOLogMsgEventPOIBusynessData)poiBusynessData
{
  -[GEOLogMsgEvent _readPoiBusynessData]((uint64_t)self);
  poiBusynessData = self->_poiBusynessData;

  return poiBusynessData;
}

- (void)setPoiBusynessData:(id)a3
{
  *(void *)&self->_flags |= 0x8000004000000000;
  objc_storeStrong((id *)&self->_poiBusynessData, a3);
}

- (void)_readPeriodicSettingsSummary
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 532) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPeriodicSettingsSummary_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasPeriodicSettingsSummary
{
  return self->_periodicSettingsSummary != 0;
}

- (GEOLogMsgEventPeriodicSettingsSummary)periodicSettingsSummary
{
  -[GEOLogMsgEvent _readPeriodicSettingsSummary]((uint64_t)self);
  periodicSettingsSummary = self->_periodicSettingsSummary;

  return periodicSettingsSummary;
}

- (void)setPeriodicSettingsSummary:(id)a3
{
  *(void *)&self->_flags |= 0x8000000800000000;
  objc_storeStrong((id *)&self->_periodicSettingsSummary, a3);
}

- (BOOL)hasThermalPressure
{
  return self->_thermalPressure != 0;
}

- (GEOLogMsgEventThermalPressure)thermalPressure
{
  -[GEOLogMsgEvent _readThermalPressure]((uint64_t)self);
  thermalPressure = self->_thermalPressure;

  return thermalPressure;
}

- (void)setThermalPressure:(id)a3
{
  *(void *)&self->_flags |= 0x8010000000000000;
  objc_storeStrong((id *)&self->_thermalPressure, a3);
}

- (void)_readArSessionUsage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 528) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArSessionUsage_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasArSessionUsage
{
  return self->_arSessionUsage != 0;
}

- (GEOLogMsgEventARSessionUsage)arSessionUsage
{
  -[GEOLogMsgEvent _readArSessionUsage]((uint64_t)self);
  arSessionUsage = self->_arSessionUsage;

  return arSessionUsage;
}

- (void)_readNetworkSelectionHarvest
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 532) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNetworkSelectionHarvest_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasNetworkSelectionHarvest
{
  return self->_networkSelectionHarvest != 0;
}

- (GEOLogMsgEventNetworkSelectionHarvest)networkSelectionHarvest
{
  -[GEOLogMsgEvent _readNetworkSelectionHarvest]((uint64_t)self);
  networkSelectionHarvest = self->_networkSelectionHarvest;

  return networkSelectionHarvest;
}

- (void)setNetworkSelectionHarvest:(id)a3
{
  *(void *)&self->_flags |= 0x8000000200000000;
  objc_storeStrong((id *)&self->_networkSelectionHarvest, a3);
}

- (void)_readImpressionEvent
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 530) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImpressionEvent_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasImpressionEvent
{
  return self->_impressionEvent != 0;
}

- (GEOLogMsgEventImpressionEvent)impressionEvent
{
  -[GEOLogMsgEvent _readImpressionEvent]((uint64_t)self);
  impressionEvent = self->_impressionEvent;

  return impressionEvent;
}

- (void)setImpressionEvent:(id)a3
{
  *(void *)&self->_flags |= 0x8000000000080000;
  objc_storeStrong((id *)&self->_impressionEvent, a3);
}

- (void)_readShowcaseSuppression
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 533) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readShowcaseSuppression_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasShowcaseSuppression
{
  return self->_showcaseSuppression != 0;
}

- (GEOLogMsgEventShowcaseSuppression)showcaseSuppression
{
  -[GEOLogMsgEvent _readShowcaseSuppression]((uint64_t)self);
  showcaseSuppression = self->_showcaseSuppression;

  return showcaseSuppression;
}

- (void)setShowcaseSuppression:(id)a3
{
  *(void *)&self->_flags |= 0x8000800000000000;
  objc_storeStrong((id *)&self->_showcaseSuppression, a3);
}

- (void)_readPlaceCacheLookup
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 532) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceCacheLookup_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasPlaceCacheLookup
{
  return self->_placeCacheLookup != 0;
}

- (GEOLogMsgEventPlaceCacheLookup)placeCacheLookup
{
  -[GEOLogMsgEvent _readPlaceCacheLookup]((uint64_t)self);
  placeCacheLookup = self->_placeCacheLookup;

  return placeCacheLookup;
}

- (void)setPlaceCacheLookup:(id)a3
{
  *(void *)&self->_flags |= 0x8000001000000000;
  objc_storeStrong((id *)&self->_placeCacheLookup, a3);
}

- (void)_readDeviceSyncStatus
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 529) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceSyncStatus_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasDeviceSyncStatus
{
  return self->_deviceSyncStatus != 0;
}

- (GEOLogMsgEventDeviceSyncStatus)deviceSyncStatus
{
  -[GEOLogMsgEvent _readDeviceSyncStatus]((uint64_t)self);
  deviceSyncStatus = self->_deviceSyncStatus;

  return deviceSyncStatus;
}

- (void)setDeviceSyncStatus:(id)a3
{
  *(void *)&self->_flags |= 0x8000000000000400;
  objc_storeStrong((id *)&self->_deviceSyncStatus, a3);
}

- (void)_readMapsInteraction
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 531) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsInteraction_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasMapsInteraction
{
  return self->_mapsInteraction != 0;
}

- (GEOLogMsgEventMapsInteraction)mapsInteraction
{
  -[GEOLogMsgEvent _readMapsInteraction]((uint64_t)self);
  mapsInteraction = self->_mapsInteraction;

  return mapsInteraction;
}

- (void)setMapsInteraction:(id)a3
{
  *(void *)&self->_flags |= 0x8000000010000000;
  objc_storeStrong((id *)&self->_mapsInteraction, a3);
}

- (void)_readNetworkEventSummary
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 531) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNetworkEventSummary_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasNetworkEventSummary
{
  return self->_networkEventSummary != 0;
}

- (GEOLogMsgEventNetworkEventSummary)networkEventSummary
{
  -[GEOLogMsgEvent _readNetworkEventSummary]((uint64_t)self);
  networkEventSummary = self->_networkEventSummary;

  return networkEventSummary;
}

- (void)setNetworkEventSummary:(id)a3
{
  *(void *)&self->_flags |= 0x8000000080000000;
  objc_storeStrong((id *)&self->_networkEventSummary, a3);
}

- (void)_readServiceMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(unsigned char *)(a1 + 533) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readServiceMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasServiceMetadata
{
  return self->_serviceMetadata != 0;
}

- (GEOLogMsgEventServiceMetadata)serviceMetadata
{
  -[GEOLogMsgEvent _readServiceMetadata]((uint64_t)self);
  serviceMetadata = self->_serviceMetadata;

  return serviceMetadata;
}

- (void)setServiceMetadata:(id)a3
{
  *(void *)&self->_flags |= 0x8000400000000000;
  objc_storeStrong((id *)&self->_serviceMetadata, a3);
}

- (BOOL)hasMapsEngagement
{
  return self->_mapsEngagement != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEvent;
  int v4 = [(GEOLogMsgEvent *)&v8 description];
  id v5 = [(GEOLogMsgEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEvent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEvent _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEvent)initWithDictionary:(id)a3
{
  return (GEOLogMsgEvent *)-[GEOLogMsgEvent _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEOLogMsgEvent)initWithJSON:(id)a3
{
  return (GEOLogMsgEvent *)-[GEOLogMsgEvent _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  -[GEOLogMsgEvent _readArSessionUsage]((uint64_t)self);
  if ([(GEOLogMsgEventARSessionUsage *)self->_arSessionUsage hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOLogMsgEvent _readDirectionsEvent]((uint64_t)self);
  if ([(GEOLogMsgEventDirections *)self->_directionsEvent hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOLogMsgEvent _readLogMsgStates]((uint64_t)self);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_logMsgStates;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3, (void)v11))
        {

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  -[GEOLogMsgEvent _readMapsWidgetsInteractionSession]((uint64_t)self);
  if ([(GEOLogMsgEventMapsWidgetsInteractionSession *)self->_mapsWidgetsInteractionSession hasGreenTeaWithValue:v3])
  {
    return 1;
  }
  -[GEOLogMsgEvent _readParkedCar]((uint64_t)self);
  if ([(GEOLogMsgEventParkedCar *)self->_parkedCar hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOLogMsgEvent _readPoiBusynessData]((uint64_t)self);
  if ([(GEOLogMsgEventPOIBusynessData *)self->_poiBusynessData hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOLogMsgEvent _readPredExTrainingData]((uint64_t)self);
  if ([(GEOLogMsgEventPredExTrainingData *)self->_predExTrainingData hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOLogMsgEvent _readRideBookingSession]((uint64_t)self);
  if ([(GEOLogMsgEventRideBookingSession *)self->_rideBookingSession hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOLogMsgEvent _readTransitAppLaunchEvent]((uint64_t)self);
  if ([(GEOLogMsgEventTransitAppLaunch *)self->_transitAppLaunchEvent hasGreenTeaWithValue:v3])
  {
    return 1;
  }
  -[GEOLogMsgEvent _readVlfUsage]((uint64_t)self);
  if ([(GEOLogMsgEventVLFUsage *)self->_vlfUsage hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOLogMsgEvent _readWifiConnectionQualityProbeEvent]((uint64_t)self);
  return [(GEOLogMsgEventWifiConnectionQualityProbe *)self->_wifiConnectionQualityProbeEvent hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = (id *)a3;
  [(GEOLogMsgEvent *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 128) = self->_readerMarkPos;
  *((_DWORD *)v9 + 129) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOLogMsgEvent *)self logMsgStatesCount])
  {
    [v9 clearLogMsgStates];
    unint64_t v4 = [(GEOLogMsgEvent *)self logMsgStatesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLogMsgEvent *)self logMsgStateAtIndex:i];
        [v9 addLogMsgState:v7];
      }
    }
  }
  if (self->_analyticTag) {
    objc_msgSend(v9, "setAnalyticTag:");
  }
  uint64_t v8 = v9;
  if (self->_mapsEnvironment)
  {
    objc_msgSend(v9, "setMapsEnvironment:");
    uint64_t v8 = v9;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v8 + 131) = self->_eventType;
    v8[66] = (id)((unint64_t)v8[66] | 2);
  }
  if (self->_userActionEvent)
  {
    objc_msgSend(v9, "setUserActionEvent:");
    uint64_t v8 = v9;
  }
  if (self->_stateTimingEvent)
  {
    objc_msgSend(v9, "setStateTimingEvent:");
    uint64_t v8 = v9;
  }
  if (self->_tileSetStateEvent)
  {
    objc_msgSend(v9, "setTileSetStateEvent:");
    uint64_t v8 = v9;
  }
  if (self->_placeDataCacheEvent)
  {
    objc_msgSend(v9, "setPlaceDataCacheEvent:");
    uint64_t v8 = v9;
  }
  if (self->_networkEvent)
  {
    objc_msgSend(v9, "setNetworkEvent:");
    uint64_t v8 = v9;
  }
  if (self->_directionsEvent)
  {
    objc_msgSend(v9, "setDirectionsEvent:");
    uint64_t v8 = v9;
  }
  if (self->_transitAppLaunchEvent)
  {
    objc_msgSend(v9, "setTransitAppLaunchEvent:");
    uint64_t v8 = v9;
  }
  if (self->_timeToLeaveHypothesisEvent)
  {
    objc_msgSend(v9, "setTimeToLeaveHypothesisEvent:");
    uint64_t v8 = v9;
  }
  if (self->_timeToLeaveInitialTravelTimeEvent)
  {
    objc_msgSend(v9, "setTimeToLeaveInitialTravelTimeEvent:");
    uint64_t v8 = v9;
  }
  if (self->_mapsWidgetsInteractionSession)
  {
    objc_msgSend(v9, "setMapsWidgetsInteractionSession:");
    uint64_t v8 = v9;
  }
  if (self->_listInteractionSession)
  {
    objc_msgSend(v9, "setListInteractionSession:");
    uint64_t v8 = v9;
  }
  if (self->_refineSearchSession)
  {
    objc_msgSend(v9, "setRefineSearchSession:");
    uint64_t v8 = v9;
  }
  if (self->_proactiveSuggestionInteractionSessionEvent)
  {
    objc_msgSend(v9, "setProactiveSuggestionInteractionSessionEvent:");
    uint64_t v8 = v9;
  }
  if (self->_mapLaunchEvent)
  {
    objc_msgSend(v9, "setMapLaunchEvent:");
    uint64_t v8 = v9;
  }
  if (self->_rideBookingSession)
  {
    objc_msgSend(v9, "setRideBookingSession:");
    uint64_t v8 = v9;
  }
  if (self->_rideBookedSession)
  {
    objc_msgSend(v9, "setRideBookedSession:");
    uint64_t v8 = v9;
  }
  if (self->_tableBookingSession)
  {
    objc_msgSend(v9, "setTableBookingSession:");
    uint64_t v8 = v9;
  }
  if (self->_tableBookedSession)
  {
    objc_msgSend(v9, "setTableBookedSession:");
    uint64_t v8 = v9;
  }
  if (self->_fullNavTrace)
  {
    objc_msgSend(v9, "setFullNavTrace:");
    uint64_t v8 = v9;
  }
  if (self->_telemetric)
  {
    objc_msgSend(v9, "setTelemetric:");
    uint64_t v8 = v9;
  }
  if (self->_clientAcSuggestions)
  {
    objc_msgSend(v9, "setClientAcSuggestions:");
    uint64_t v8 = v9;
  }
  if (self->_realtimeTrafficProbeCollection)
  {
    objc_msgSend(v9, "setRealtimeTrafficProbeCollection:");
    uint64_t v8 = v9;
  }
  if (self->_batchTrafficProbeCollection)
  {
    objc_msgSend(v9, "setBatchTrafficProbeCollection:");
    uint64_t v8 = v9;
  }
  if (self->_commuteWindow)
  {
    objc_msgSend(v9, "setCommuteWindow:");
    uint64_t v8 = v9;
  }
  if (self->_wifiConnectionQualityProbeEvent)
  {
    objc_msgSend(v9, "setWifiConnectionQualityProbeEvent:");
    uint64_t v8 = v9;
  }
  if (self->_parkedCar)
  {
    objc_msgSend(v9, "setParkedCar:");
    uint64_t v8 = v9;
  }
  if (self->_tileCacheAnalytic)
  {
    objc_msgSend(v9, "setTileCacheAnalytic:");
    uint64_t v8 = v9;
  }
  if (self->_gridDuration)
  {
    objc_msgSend(v9, "setGridDuration:");
    uint64_t v8 = v9;
  }
  if (self->_displayAnalytic)
  {
    objc_msgSend(v9, "setDisplayAnalytic:");
    uint64_t v8 = v9;
  }
  if (self->_throttleEvent)
  {
    objc_msgSend(v9, "setThrottleEvent:");
    uint64_t v8 = v9;
  }
  if (self->_mapKitCounts)
  {
    objc_msgSend(v9, "setMapKitCounts:");
    uint64_t v8 = v9;
  }
  if (self->_predExTrainingData)
  {
    objc_msgSend(v9, "setPredExTrainingData:");
    uint64_t v8 = v9;
  }
  if (self->_marcoLiteUsage)
  {
    objc_msgSend(v9, "setMarcoLiteUsage:");
    uint64_t v8 = v9;
  }
  if (self->_tripDepartureFeedback)
  {
    objc_msgSend(v9, "setTripDepartureFeedback:");
    uint64_t v8 = v9;
  }
  if (self->_directionsRequestDetails)
  {
    objc_msgSend(v9, "setDirectionsRequestDetails:");
    uint64_t v8 = v9;
  }
  if (self->_evRoutingVehicleDetails)
  {
    objc_msgSend(v9, "setEvRoutingVehicleDetails:");
    uint64_t v8 = v9;
  }
  if (self->_evTrip)
  {
    objc_msgSend(v9, "setEvTrip:");
    uint64_t v8 = v9;
  }
  if (self->_curatedCollectionStats)
  {
    objc_msgSend(v9, "setCuratedCollectionStats:");
    uint64_t v8 = v9;
  }
  if (self->_curatedCollectionUsage)
  {
    objc_msgSend(v9, "setCuratedCollectionUsage:");
    uint64_t v8 = v9;
  }
  if (self->_mapsDeviceSettings)
  {
    objc_msgSend(v9, "setMapsDeviceSettings:");
    uint64_t v8 = v9;
  }
  if (self->_hardStop)
  {
    objc_msgSend(v9, "setHardStop:");
    uint64_t v8 = v9;
  }
  if (self->_vlfUsage)
  {
    objc_msgSend(v9, "setVlfUsage:");
    uint64_t v8 = v9;
  }
  if (self->_logDiscard)
  {
    objc_msgSend(v9, "setLogDiscard:");
    uint64_t v8 = v9;
  }
  if (self->_dailyUseSummary)
  {
    objc_msgSend(v9, "setDailyUseSummary:");
    uint64_t v8 = v9;
  }
  if (self->_pressureData)
  {
    objc_msgSend(v9, "setPressureData:");
    uint64_t v8 = v9;
  }
  if (self->_poiBusynessData)
  {
    objc_msgSend(v9, "setPoiBusynessData:");
    uint64_t v8 = v9;
  }
  if (self->_periodicSettingsSummary)
  {
    objc_msgSend(v9, "setPeriodicSettingsSummary:");
    uint64_t v8 = v9;
  }
  if (self->_thermalPressure)
  {
    objc_msgSend(v9, "setThermalPressure:");
    uint64_t v8 = v9;
  }
  if (self->_arSessionUsage)
  {
    objc_msgSend(v9, "setArSessionUsage:");
    uint64_t v8 = v9;
  }
  if (self->_networkSelectionHarvest)
  {
    objc_msgSend(v9, "setNetworkSelectionHarvest:");
    uint64_t v8 = v9;
  }
  if (self->_impressionEvent)
  {
    objc_msgSend(v9, "setImpressionEvent:");
    uint64_t v8 = v9;
  }
  if (self->_showcaseSuppression)
  {
    objc_msgSend(v9, "setShowcaseSuppression:");
    uint64_t v8 = v9;
  }
  if (self->_placeCacheLookup)
  {
    objc_msgSend(v9, "setPlaceCacheLookup:");
    uint64_t v8 = v9;
  }
  if (self->_deviceSyncStatus)
  {
    objc_msgSend(v9, "setDeviceSyncStatus:");
    uint64_t v8 = v9;
  }
  if (self->_mapsInteraction)
  {
    objc_msgSend(v9, "setMapsInteraction:");
    uint64_t v8 = v9;
  }
  if (self->_networkEventSummary)
  {
    objc_msgSend(v9, "setNetworkEventSummary:");
    uint64_t v8 = v9;
  }
  if (self->_serviceMetadata)
  {
    objc_msgSend(v9, "setServiceMetadata:");
    uint64_t v8 = v9;
  }
  if (self->_mapsEngagement)
  {
    objc_msgSend(v9, "setMapsEngagement:");
    uint64_t v8 = v9;
  }
  if (*(unsigned char *)&self->_flags)
  {
    v8[60] = *(id *)&self->_usageEventTime;
    v8[66] = (id)((unint64_t)v8[66] | 1);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(void *)&self->_flags & 0x8000000000000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLogMsgEventReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEvent *)self readAll:0];
  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  uint64_t v9 = self->_logMsgStates;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v135 objects:v139 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v136;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v136 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v135 + 1) + 8 * i), "copyWithZone:", a3, (void)v135);
        [(id)v5 addLogMsgState:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v135 objects:v139 count:16];
    }
    while (v10);
  }

  id v14 = [(GEOLogMsgEventId *)self->_analyticTag copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v14;

  uint64_t v16 = [(NSString *)self->_mapsEnvironment copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v16;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 524) = self->_eventType;
    *(void *)(v5 + 528) |= 2uLL;
  }
  id v18 = -[GEOLogMsgEventUserAction copyWithZone:](self->_userActionEvent, "copyWithZone:", a3, (void)v135);
  v19 = *(void **)(v5 + 488);
  *(void *)(v5 + 488) = v18;

  id v20 = [(GEOLogMsgEventStateTiming *)self->_stateTimingEvent copyWithZone:a3];
  v21 = *(void **)(v5 + 384);
  *(void *)(v5 + 384) = v20;

  id v22 = [(GEOLogMsgEventTileSetState *)self->_tileSetStateEvent copyWithZone:a3];
  v23 = *(void **)(v5 + 440);
  *(void *)(v5 + 440) = v22;

  id v24 = [(GEOLogMsgEventPlaceDataCache *)self->_placeDataCacheEvent copyWithZone:a3];
  v25 = *(void **)(v5 + 296);
  *(void *)(v5 + 296) = v24;

  id v26 = [(GEOLogMsgEventNetwork *)self->_networkEvent copyWithZone:a3];
  id v27 = *(void **)(v5 + 256);
  *(void *)(v5 + 256) = v26;

  id v28 = [(GEOLogMsgEventDirections *)self->_directionsEvent copyWithZone:a3];
  v29 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v28;

  id v30 = [(GEOLogMsgEventTransitAppLaunch *)self->_transitAppLaunchEvent copyWithZone:a3];
  v31 = *(void **)(v5 + 464);
  *(void *)(v5 + 464) = v30;

  id v32 = [(GEOLogMsgEventTimeToLeaveHypothesis *)self->_timeToLeaveHypothesisEvent copyWithZone:a3];
  v33 = *(void **)(v5 + 448);
  *(void *)(v5 + 448) = v32;

  id v34 = [(GEOLogMsgEventTimeToLeaveInitialTravelTime *)self->_timeToLeaveInitialTravelTimeEvent copyWithZone:a3];
  v35 = *(void **)(v5 + 456);
  *(void *)(v5 + 456) = v34;

  id v36 = [(GEOLogMsgEventMapsWidgetsInteractionSession *)self->_mapsWidgetsInteractionSession copyWithZone:a3];
  id v37 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = v36;

  id v38 = [(GEOLogMsgEventListInteractionSession *)self->_listInteractionSession copyWithZone:a3];
  v39 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v38;

  id v40 = [(GEOLogMsgEventRefineSearchSession *)self->_refineSearchSession copyWithZone:a3];
  v41 = *(void **)(v5 + 344);
  *(void *)(v5 + 344) = v40;

  id v42 = [(GEOLogMsgEventProactiveSuggestionInteractionSession *)self->_proactiveSuggestionInteractionSessionEvent copyWithZone:a3];
  v43 = *(void **)(v5 + 328);
  *(void *)(v5 + 328) = v42;

  id v44 = [(GEOLogMsgEventMapLaunch *)self->_mapLaunchEvent copyWithZone:a3];
  v45 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v44;

  id v46 = [(GEOLogMsgEventRideBookingSession *)self->_rideBookingSession copyWithZone:a3];
  id v47 = *(void **)(v5 + 360);
  *(void *)(v5 + 360) = v46;

  id v48 = [(GEOLogMsgEventRideBookedSession *)self->_rideBookedSession copyWithZone:a3];
  v49 = *(void **)(v5 + 352);
  *(void *)(v5 + 352) = v48;

  id v50 = [(GEOLogMsgEventTableBookingSession *)self->_tableBookingSession copyWithZone:a3];
  v51 = *(void **)(v5 + 400);
  *(void *)(v5 + 400) = v50;

  id v52 = [(GEOLogMsgEventTableBookedSession *)self->_tableBookedSession copyWithZone:a3];
  v53 = *(void **)(v5 + 392);
  *(void *)(v5 + 392) = v52;

  id v54 = [(GEOLogMsgEventFullNavTrace *)self->_fullNavTrace copyWithZone:a3];
  v55 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v54;

  id v56 = [(GEOLogMsgEventTelemetric *)self->_telemetric copyWithZone:a3];
  id v57 = *(void **)(v5 + 408);
  *(void *)(v5 + 408) = v56;

  id v58 = [(GEOLogMsgEventClientACSuggestions *)self->_clientAcSuggestions copyWithZone:a3];
  v59 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v58;

  id v60 = [(GEOLogMsgEventRealtimeTrafficProbe *)self->_realtimeTrafficProbeCollection copyWithZone:a3];
  v61 = *(void **)(v5 + 336);
  *(void *)(v5 + 336) = v60;

  id v62 = [(GEOLogMsgEventBatchTrafficProbe *)self->_batchTrafficProbeCollection copyWithZone:a3];
  v63 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v62;

  id v64 = [(GEOLogMsgEventCommuteWindow *)self->_commuteWindow copyWithZone:a3];
  v65 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v64;

  id v66 = [(GEOLogMsgEventWifiConnectionQualityProbe *)self->_wifiConnectionQualityProbeEvent copyWithZone:a3];
  id v67 = *(void **)(v5 + 504);
  *(void *)(v5 + 504) = v66;

  id v68 = [(GEOLogMsgEventParkedCar *)self->_parkedCar copyWithZone:a3];
  v69 = *(void **)(v5 + 272);
  *(void *)(v5 + 272) = v68;

  id v70 = [(GEOLogMsgEventTileCacheAnalytic *)self->_tileCacheAnalytic copyWithZone:a3];
  v71 = *(void **)(v5 + 432);
  *(void *)(v5 + 432) = v70;

  id v72 = [(GEOLogMsgEventGridDuration *)self->_gridDuration copyWithZone:a3];
  v73 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v72;

  id v74 = [(GEOLogMsgEventDisplayAnalytic *)self->_displayAnalytic copyWithZone:a3];
  v75 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v74;

  id v76 = [(GEOLogMsgEventThrottle *)self->_throttleEvent copyWithZone:a3];
  id v77 = *(void **)(v5 + 424);
  *(void *)(v5 + 424) = v76;

  id v78 = [(GEOLogMsgEventMapKitCounts *)self->_mapKitCounts copyWithZone:a3];
  v79 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v78;

  id v80 = [(GEOLogMsgEventPredExTrainingData *)self->_predExTrainingData copyWithZone:a3];
  v81 = *(void **)(v5 + 312);
  *(void *)(v5 + 312) = v80;

  id v82 = [(GEOLogMsgEventMarcoLiteUsage *)self->_marcoLiteUsage copyWithZone:a3];
  v83 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v82;

  id v84 = [(GEOLogMsgEventTripDepartureFeedback *)self->_tripDepartureFeedback copyWithZone:a3];
  v85 = *(void **)(v5 + 472);
  *(void *)(v5 + 472) = v84;

  id v86 = [(GEOLogMsgEventDirectionsRequestDetails *)self->_directionsRequestDetails copyWithZone:a3];
  id v87 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v86;

  id v88 = [(GEOLogMsgEventEVRoutingVehicleDetails *)self->_evRoutingVehicleDetails copyWithZone:a3];
  v89 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v88;

  id v90 = [(GEOLogMsgEventEVTrip *)self->_evTrip copyWithZone:a3];
  v91 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v90;

  id v92 = [(GEOLogMsgEventCuratedCollectionStats *)self->_curatedCollectionStats copyWithZone:a3];
  v93 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v92;

  id v94 = [(GEOLogMsgEventCuratedCollectionUsage *)self->_curatedCollectionUsage copyWithZone:a3];
  v95 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v94;

  id v96 = [(GEOLogMsgEventMapsDeviceSettings *)self->_mapsDeviceSettings copyWithZone:a3];
  id v97 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v96;

  id v98 = [(GEOLogMsgEventHardStop *)self->_hardStop copyWithZone:a3];
  v99 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v98;

  id v100 = [(GEOLogMsgEventVLFUsage *)self->_vlfUsage copyWithZone:a3];
  v101 = *(void **)(v5 + 496);
  *(void *)(v5 + 496) = v100;

  id v102 = [(GEOLogMsgEventLogDiscard *)self->_logDiscard copyWithZone:a3];
  v103 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v102;

  id v104 = [(GEOLogMsgEventDailyUseSummary *)self->_dailyUseSummary copyWithZone:a3];
  v105 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v104;

  id v106 = [(GEOLogMsgEventPressureData *)self->_pressureData copyWithZone:a3];
  id v107 = *(void **)(v5 + 320);
  *(void *)(v5 + 320) = v106;

  id v108 = [(GEOLogMsgEventPOIBusynessData *)self->_poiBusynessData copyWithZone:a3];
  v109 = *(void **)(v5 + 304);
  *(void *)(v5 + 304) = v108;

  id v110 = [(GEOLogMsgEventPeriodicSettingsSummary *)self->_periodicSettingsSummary copyWithZone:a3];
  v111 = *(void **)(v5 + 280);
  *(void *)(v5 + 280) = v110;

  id v112 = [(GEOLogMsgEventThermalPressure *)self->_thermalPressure copyWithZone:a3];
  v113 = *(void **)(v5 + 416);
  *(void *)(v5 + 416) = v112;

  id v114 = [(GEOLogMsgEventARSessionUsage *)self->_arSessionUsage copyWithZone:a3];
  v115 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v114;

  id v116 = [(GEOLogMsgEventNetworkSelectionHarvest *)self->_networkSelectionHarvest copyWithZone:a3];
  id v117 = *(void **)(v5 + 264);
  *(void *)(v5 + 264) = v116;

  id v118 = [(GEOLogMsgEventImpressionEvent *)self->_impressionEvent copyWithZone:a3];
  v119 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v118;

  id v120 = [(GEOLogMsgEventShowcaseSuppression *)self->_showcaseSuppression copyWithZone:a3];
  v121 = *(void **)(v5 + 376);
  *(void *)(v5 + 376) = v120;

  id v122 = [(GEOLogMsgEventPlaceCacheLookup *)self->_placeCacheLookup copyWithZone:a3];
  v123 = *(void **)(v5 + 288);
  *(void *)(v5 + 288) = v122;

  id v124 = [(GEOLogMsgEventDeviceSyncStatus *)self->_deviceSyncStatus copyWithZone:a3];
  id v125 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v124;

  id v126 = [(GEOLogMsgEventMapsInteraction *)self->_mapsInteraction copyWithZone:a3];
  v127 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v126;

  id v128 = [(GEOLogMsgEventNetworkEventSummary *)self->_networkEventSummary copyWithZone:a3];
  v129 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = v128;

  id v130 = [(GEOLogMsgEventServiceMetadata *)self->_serviceMetadata copyWithZone:a3];
  uint64_t v131 = *(void **)(v5 + 368);
  *(void *)(v5 + 368) = v130;

  id v132 = [(GEOLogMsgEventMapsEngagement *)self->_mapsEngagement copyWithZone:a3];
  v133 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v132;

  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v5 + 480) = self->_usageEventTime;
    *(void *)(v5 + 528) |= 1uLL;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_134;
  }
  [(GEOLogMsgEvent *)self readAll:1];
  [v4 readAll:1];
  logMsgStates = self->_logMsgStates;
  if ((unint64_t)logMsgStates | *((void *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](logMsgStates, "isEqual:")) {
      goto LABEL_134;
    }
  }
  analyticTag = self->_analyticTag;
  if ((unint64_t)analyticTag | *((void *)v4 + 2))
  {
    if (!-[GEOLogMsgEventId isEqual:](analyticTag, "isEqual:")) {
      goto LABEL_134;
    }
  }
  mapsEnvironment = self->_mapsEnvironment;
  if ((unint64_t)mapsEnvironment | *((void *)v4 + 27))
  {
    if (!-[NSString isEqual:](mapsEnvironment, "isEqual:")) {
      goto LABEL_134;
    }
  }
  uint64_t v8 = *((void *)v4 + 66);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_eventType != *((_DWORD *)v4 + 131)) {
      goto LABEL_134;
    }
  }
  else if ((v8 & 2) != 0)
  {
LABEL_134:
    BOOL v67 = 0;
    goto LABEL_135;
  }
  userActionEvent = self->_userActionEvent;
  if ((unint64_t)userActionEvent | *((void *)v4 + 61)
    && !-[GEOLogMsgEventUserAction isEqual:](userActionEvent, "isEqual:"))
  {
    goto LABEL_134;
  }
  stateTimingEvent = self->_stateTimingEvent;
  if ((unint64_t)stateTimingEvent | *((void *)v4 + 48))
  {
    if (!-[GEOLogMsgEventStateTiming isEqual:](stateTimingEvent, "isEqual:")) {
      goto LABEL_134;
    }
  }
  tileSetStateEvent = self->_tileSetStateEvent;
  if ((unint64_t)tileSetStateEvent | *((void *)v4 + 55))
  {
    if (!-[GEOLogMsgEventTileSetState isEqual:](tileSetStateEvent, "isEqual:")) {
      goto LABEL_134;
    }
  }
  placeDataCacheEvent = self->_placeDataCacheEvent;
  if ((unint64_t)placeDataCacheEvent | *((void *)v4 + 37))
  {
    if (!-[GEOLogMsgEventPlaceDataCache isEqual:](placeDataCacheEvent, "isEqual:")) {
      goto LABEL_134;
    }
  }
  networkEvent = self->_networkEvent;
  if ((unint64_t)networkEvent | *((void *)v4 + 32))
  {
    if (!-[GEOLogMsgEventNetwork isEqual:](networkEvent, "isEqual:")) {
      goto LABEL_134;
    }
  }
  directionsEvent = self->_directionsEvent;
  if ((unint64_t)directionsEvent | *((void *)v4 + 11))
  {
    if (!-[GEOLogMsgEventDirections isEqual:](directionsEvent, "isEqual:")) {
      goto LABEL_134;
    }
  }
  transitAppLaunchEvent = self->_transitAppLaunchEvent;
  if ((unint64_t)transitAppLaunchEvent | *((void *)v4 + 58))
  {
    if (!-[GEOLogMsgEventTransitAppLaunch isEqual:](transitAppLaunchEvent, "isEqual:")) {
      goto LABEL_134;
    }
  }
  timeToLeaveHypothesisEvent = self->_timeToLeaveHypothesisEvent;
  if ((unint64_t)timeToLeaveHypothesisEvent | *((void *)v4 + 56))
  {
    if (!-[GEOLogMsgEventTimeToLeaveHypothesis isEqual:](timeToLeaveHypothesisEvent, "isEqual:")) {
      goto LABEL_134;
    }
  }
  timeToLeaveInitialTravelTimeEvent = self->_timeToLeaveInitialTravelTimeEvent;
  if ((unint64_t)timeToLeaveInitialTravelTimeEvent | *((void *)v4 + 57))
  {
    if (!-[GEOLogMsgEventTimeToLeaveInitialTravelTime isEqual:](timeToLeaveInitialTravelTimeEvent, "isEqual:")) {
      goto LABEL_134;
    }
  }
  mapsWidgetsInteractionSession = self->_mapsWidgetsInteractionSession;
  if ((unint64_t)mapsWidgetsInteractionSession | *((void *)v4 + 29))
  {
    if (!-[GEOLogMsgEventMapsWidgetsInteractionSession isEqual:](mapsWidgetsInteractionSession, "isEqual:")) {
      goto LABEL_134;
    }
  }
  listInteractionSession = self->_listInteractionSession;
  if ((unint64_t)listInteractionSession | *((void *)v4 + 20))
  {
    if (!-[GEOLogMsgEventListInteractionSession isEqual:](listInteractionSession, "isEqual:")) {
      goto LABEL_134;
    }
  }
  refineSearchSession = self->_refineSearchSession;
  if ((unint64_t)refineSearchSession | *((void *)v4 + 43))
  {
    if (!-[GEOLogMsgEventRefineSearchSession isEqual:](refineSearchSession, "isEqual:")) {
      goto LABEL_134;
    }
  }
  proactiveSuggestionInteractionSessionEvent = self->_proactiveSuggestionInteractionSessionEvent;
  if ((unint64_t)proactiveSuggestionInteractionSessionEvent | *((void *)v4 + 41))
  {
    if (!-[GEOLogMsgEventProactiveSuggestionInteractionSession isEqual:](proactiveSuggestionInteractionSessionEvent, "isEqual:"))goto LABEL_134; {
  }
    }
  mapLaunchEvent = self->_mapLaunchEvent;
  if ((unint64_t)mapLaunchEvent | *((void *)v4 + 24))
  {
    if (!-[GEOLogMsgEventMapLaunch isEqual:](mapLaunchEvent, "isEqual:")) {
      goto LABEL_134;
    }
  }
  rideBookingSession = self->_rideBookingSession;
  if ((unint64_t)rideBookingSession | *((void *)v4 + 45))
  {
    if (!-[GEOLogMsgEventRideBookingSession isEqual:](rideBookingSession, "isEqual:")) {
      goto LABEL_134;
    }
  }
  rideBookedSession = self->_rideBookedSession;
  if ((unint64_t)rideBookedSession | *((void *)v4 + 44))
  {
    if (!-[GEOLogMsgEventRideBookedSession isEqual:](rideBookedSession, "isEqual:")) {
      goto LABEL_134;
    }
  }
  tableBookingSession = self->_tableBookingSession;
  if ((unint64_t)tableBookingSession | *((void *)v4 + 50))
  {
    if (!-[GEOLogMsgEventTableBookingSession isEqual:](tableBookingSession, "isEqual:")) {
      goto LABEL_134;
    }
  }
  tableBookedSession = self->_tableBookedSession;
  if ((unint64_t)tableBookedSession | *((void *)v4 + 49))
  {
    if (!-[GEOLogMsgEventTableBookedSession isEqual:](tableBookedSession, "isEqual:")) {
      goto LABEL_134;
    }
  }
  fullNavTrace = self->_fullNavTrace;
  if ((unint64_t)fullNavTrace | *((void *)v4 + 16))
  {
    if (!-[GEOLogMsgEventFullNavTrace isEqual:](fullNavTrace, "isEqual:")) {
      goto LABEL_134;
    }
  }
  telemetric = self->_telemetric;
  if ((unint64_t)telemetric | *((void *)v4 + 51))
  {
    if (!-[GEOLogMsgEventTelemetric isEqual:](telemetric, "isEqual:")) {
      goto LABEL_134;
    }
  }
  clientAcSuggestions = self->_clientAcSuggestions;
  if ((unint64_t)clientAcSuggestions | *((void *)v4 + 5))
  {
    if (!-[GEOLogMsgEventClientACSuggestions isEqual:](clientAcSuggestions, "isEqual:")) {
      goto LABEL_134;
    }
  }
  realtimeTrafficProbeCollection = self->_realtimeTrafficProbeCollection;
  if ((unint64_t)realtimeTrafficProbeCollection | *((void *)v4 + 42))
  {
    if (!-[GEOLogMsgEventRealtimeTrafficProbe isEqual:](realtimeTrafficProbeCollection, "isEqual:")) {
      goto LABEL_134;
    }
  }
  batchTrafficProbeCollection = self->_batchTrafficProbeCollection;
  if ((unint64_t)batchTrafficProbeCollection | *((void *)v4 + 4))
  {
    if (!-[GEOLogMsgEventBatchTrafficProbe isEqual:](batchTrafficProbeCollection, "isEqual:")) {
      goto LABEL_134;
    }
  }
  commuteWindow = self->_commuteWindow;
  if ((unint64_t)commuteWindow | *((void *)v4 + 6))
  {
    if (!-[GEOLogMsgEventCommuteWindow isEqual:](commuteWindow, "isEqual:")) {
      goto LABEL_134;
    }
  }
  wifiConnectionQualityProbeEvent = self->_wifiConnectionQualityProbeEvent;
  if ((unint64_t)wifiConnectionQualityProbeEvent | *((void *)v4 + 63))
  {
    if (!-[GEOLogMsgEventWifiConnectionQualityProbe isEqual:](wifiConnectionQualityProbeEvent, "isEqual:")) {
      goto LABEL_134;
    }
  }
  parkedCar = self->_parkedCar;
  if ((unint64_t)parkedCar | *((void *)v4 + 34))
  {
    if (!-[GEOLogMsgEventParkedCar isEqual:](parkedCar, "isEqual:")) {
      goto LABEL_134;
    }
  }
  tileCacheAnalytic = self->_tileCacheAnalytic;
  if ((unint64_t)tileCacheAnalytic | *((void *)v4 + 54))
  {
    if (!-[GEOLogMsgEventTileCacheAnalytic isEqual:](tileCacheAnalytic, "isEqual:")) {
      goto LABEL_134;
    }
  }
  gridDuration = self->_gridDuration;
  if ((unint64_t)gridDuration | *((void *)v4 + 17))
  {
    if (!-[GEOLogMsgEventGridDuration isEqual:](gridDuration, "isEqual:")) {
      goto LABEL_134;
    }
  }
  displayAnalytic = self->_displayAnalytic;
  if ((unint64_t)displayAnalytic | *((void *)v4 + 13))
  {
    if (!-[GEOLogMsgEventDisplayAnalytic isEqual:](displayAnalytic, "isEqual:")) {
      goto LABEL_134;
    }
  }
  throttleEvent = self->_throttleEvent;
  if ((unint64_t)throttleEvent | *((void *)v4 + 53))
  {
    if (!-[GEOLogMsgEventThrottle isEqual:](throttleEvent, "isEqual:")) {
      goto LABEL_134;
    }
  }
  mapKitCounts = self->_mapKitCounts;
  if ((unint64_t)mapKitCounts | *((void *)v4 + 23))
  {
    if (!-[GEOLogMsgEventMapKitCounts isEqual:](mapKitCounts, "isEqual:")) {
      goto LABEL_134;
    }
  }
  predExTrainingData = self->_predExTrainingData;
  if ((unint64_t)predExTrainingData | *((void *)v4 + 39))
  {
    if (!-[GEOLogMsgEventPredExTrainingData isEqual:](predExTrainingData, "isEqual:")) {
      goto LABEL_134;
    }
  }
  marcoLiteUsage = self->_marcoLiteUsage;
  if ((unint64_t)marcoLiteUsage | *((void *)v4 + 30))
  {
    if (!-[GEOLogMsgEventMarcoLiteUsage isEqual:](marcoLiteUsage, "isEqual:")) {
      goto LABEL_134;
    }
  }
  tripDepartureFeedback = self->_tripDepartureFeedback;
  if ((unint64_t)tripDepartureFeedback | *((void *)v4 + 59))
  {
    if (!-[GEOLogMsgEventTripDepartureFeedback isEqual:](tripDepartureFeedback, "isEqual:")) {
      goto LABEL_134;
    }
  }
  directionsRequestDetails = self->_directionsRequestDetails;
  if ((unint64_t)directionsRequestDetails | *((void *)v4 + 12))
  {
    if (!-[GEOLogMsgEventDirectionsRequestDetails isEqual:](directionsRequestDetails, "isEqual:")) {
      goto LABEL_134;
    }
  }
  evRoutingVehicleDetails = self->_evRoutingVehicleDetails;
  if ((unint64_t)evRoutingVehicleDetails | *((void *)v4 + 14))
  {
    if (!-[GEOLogMsgEventEVRoutingVehicleDetails isEqual:](evRoutingVehicleDetails, "isEqual:")) {
      goto LABEL_134;
    }
  }
  evTrip = self->_evTrip;
  if ((unint64_t)evTrip | *((void *)v4 + 15))
  {
    if (!-[GEOLogMsgEventEVTrip isEqual:](evTrip, "isEqual:")) {
      goto LABEL_134;
    }
  }
  curatedCollectionStats = self->_curatedCollectionStats;
  if ((unint64_t)curatedCollectionStats | *((void *)v4 + 7))
  {
    if (!-[GEOLogMsgEventCuratedCollectionStats isEqual:](curatedCollectionStats, "isEqual:")) {
      goto LABEL_134;
    }
  }
  curatedCollectionUsage = self->_curatedCollectionUsage;
  if ((unint64_t)curatedCollectionUsage | *((void *)v4 + 8))
  {
    if (!-[GEOLogMsgEventCuratedCollectionUsage isEqual:](curatedCollectionUsage, "isEqual:")) {
      goto LABEL_134;
    }
  }
  mapsDeviceSettings = self->_mapsDeviceSettings;
  if ((unint64_t)mapsDeviceSettings | *((void *)v4 + 25))
  {
    if (!-[GEOLogMsgEventMapsDeviceSettings isEqual:](mapsDeviceSettings, "isEqual:")) {
      goto LABEL_134;
    }
  }
  hardStop = self->_hardStop;
  if ((unint64_t)hardStop | *((void *)v4 + 18))
  {
    if (!-[GEOLogMsgEventHardStop isEqual:](hardStop, "isEqual:")) {
      goto LABEL_134;
    }
  }
  vlfUsage = self->_vlfUsage;
  if ((unint64_t)vlfUsage | *((void *)v4 + 62))
  {
    if (!-[GEOLogMsgEventVLFUsage isEqual:](vlfUsage, "isEqual:")) {
      goto LABEL_134;
    }
  }
  logDiscard = self->_logDiscard;
  if ((unint64_t)logDiscard | *((void *)v4 + 21))
  {
    if (!-[GEOLogMsgEventLogDiscard isEqual:](logDiscard, "isEqual:")) {
      goto LABEL_134;
    }
  }
  dailyUseSummary = self->_dailyUseSummary;
  if ((unint64_t)dailyUseSummary | *((void *)v4 + 9))
  {
    if (!-[GEOLogMsgEventDailyUseSummary isEqual:](dailyUseSummary, "isEqual:")) {
      goto LABEL_134;
    }
  }
  pressureData = self->_pressureData;
  if ((unint64_t)pressureData | *((void *)v4 + 40))
  {
    if (!-[GEOLogMsgEventPressureData isEqual:](pressureData, "isEqual:")) {
      goto LABEL_134;
    }
  }
  poiBusynessData = self->_poiBusynessData;
  if ((unint64_t)poiBusynessData | *((void *)v4 + 38))
  {
    if (!-[GEOLogMsgEventPOIBusynessData isEqual:](poiBusynessData, "isEqual:")) {
      goto LABEL_134;
    }
  }
  periodicSettingsSummary = self->_periodicSettingsSummary;
  if ((unint64_t)periodicSettingsSummary | *((void *)v4 + 35))
  {
    if (!-[GEOLogMsgEventPeriodicSettingsSummary isEqual:](periodicSettingsSummary, "isEqual:")) {
      goto LABEL_134;
    }
  }
  thermalPressure = self->_thermalPressure;
  if ((unint64_t)thermalPressure | *((void *)v4 + 52))
  {
    if (!-[GEOLogMsgEventThermalPressure isEqual:](thermalPressure, "isEqual:")) {
      goto LABEL_134;
    }
  }
  arSessionUsage = self->_arSessionUsage;
  if ((unint64_t)arSessionUsage | *((void *)v4 + 3))
  {
    if (!-[GEOLogMsgEventARSessionUsage isEqual:](arSessionUsage, "isEqual:")) {
      goto LABEL_134;
    }
  }
  networkSelectionHarvest = self->_networkSelectionHarvest;
  if ((unint64_t)networkSelectionHarvest | *((void *)v4 + 33))
  {
    if (!-[GEOLogMsgEventNetworkSelectionHarvest isEqual:](networkSelectionHarvest, "isEqual:")) {
      goto LABEL_134;
    }
  }
  impressionEvent = self->_impressionEvent;
  if ((unint64_t)impressionEvent | *((void *)v4 + 19))
  {
    if (!-[GEOLogMsgEventImpressionEvent isEqual:](impressionEvent, "isEqual:")) {
      goto LABEL_134;
    }
  }
  showcaseSuppression = self->_showcaseSuppression;
  if ((unint64_t)showcaseSuppression | *((void *)v4 + 47))
  {
    if (!-[GEOLogMsgEventShowcaseSuppression isEqual:](showcaseSuppression, "isEqual:")) {
      goto LABEL_134;
    }
  }
  placeCacheLookup = self->_placeCacheLookup;
  if ((unint64_t)placeCacheLookup | *((void *)v4 + 36))
  {
    if (!-[GEOLogMsgEventPlaceCacheLookup isEqual:](placeCacheLookup, "isEqual:")) {
      goto LABEL_134;
    }
  }
  deviceSyncStatus = self->_deviceSyncStatus;
  if ((unint64_t)deviceSyncStatus | *((void *)v4 + 10))
  {
    if (!-[GEOLogMsgEventDeviceSyncStatus isEqual:](deviceSyncStatus, "isEqual:")) {
      goto LABEL_134;
    }
  }
  mapsInteraction = self->_mapsInteraction;
  if ((unint64_t)mapsInteraction | *((void *)v4 + 28))
  {
    if (!-[GEOLogMsgEventMapsInteraction isEqual:](mapsInteraction, "isEqual:")) {
      goto LABEL_134;
    }
  }
  networkEventSummary = self->_networkEventSummary;
  if ((unint64_t)networkEventSummary | *((void *)v4 + 31))
  {
    if (!-[GEOLogMsgEventNetworkEventSummary isEqual:](networkEventSummary, "isEqual:")) {
      goto LABEL_134;
    }
  }
  serviceMetadata = self->_serviceMetadata;
  if ((unint64_t)serviceMetadata | *((void *)v4 + 46))
  {
    if (!-[GEOLogMsgEventServiceMetadata isEqual:](serviceMetadata, "isEqual:")) {
      goto LABEL_134;
    }
  }
  mapsEngagement = self->_mapsEngagement;
  if ((unint64_t)mapsEngagement | *((void *)v4 + 26))
  {
    if (!-[GEOLogMsgEventMapsEngagement isEqual:](mapsEngagement, "isEqual:")) {
      goto LABEL_134;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((void *)v4 + 66) & 1) == 0 || self->_usageEventTime != *((double *)v4 + 60)) {
      goto LABEL_134;
    }
    BOOL v67 = 1;
  }
  else
  {
    BOOL v67 = (*((void *)v4 + 66) & 1) == 0;
  }
LABEL_135:

  return v67;
}

- (unint64_t)hash
{
  [(GEOLogMsgEvent *)self readAll:1];
  uint64_t v70 = [(NSMutableArray *)self->_logMsgStates hash];
  unint64_t v69 = [(GEOLogMsgEventId *)self->_analyticTag hash];
  NSUInteger v68 = [(NSString *)self->_mapsEnvironment hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v67 = 2654435761 * self->_eventType;
  }
  else {
    uint64_t v67 = 0;
  }
  unint64_t v66 = [(GEOLogMsgEventUserAction *)self->_userActionEvent hash];
  unint64_t v65 = [(GEOLogMsgEventStateTiming *)self->_stateTimingEvent hash];
  unint64_t v64 = [(GEOLogMsgEventTileSetState *)self->_tileSetStateEvent hash];
  unint64_t v63 = [(GEOLogMsgEventPlaceDataCache *)self->_placeDataCacheEvent hash];
  unint64_t v62 = [(GEOLogMsgEventNetwork *)self->_networkEvent hash];
  unint64_t v61 = [(GEOLogMsgEventDirections *)self->_directionsEvent hash];
  unint64_t v60 = [(GEOLogMsgEventTransitAppLaunch *)self->_transitAppLaunchEvent hash];
  unint64_t v59 = [(GEOLogMsgEventTimeToLeaveHypothesis *)self->_timeToLeaveHypothesisEvent hash];
  unint64_t v58 = [(GEOLogMsgEventTimeToLeaveInitialTravelTime *)self->_timeToLeaveInitialTravelTimeEvent hash];
  unint64_t v57 = [(GEOLogMsgEventMapsWidgetsInteractionSession *)self->_mapsWidgetsInteractionSession hash];
  unint64_t v56 = [(GEOLogMsgEventListInteractionSession *)self->_listInteractionSession hash];
  unint64_t v55 = [(GEOLogMsgEventRefineSearchSession *)self->_refineSearchSession hash];
  unint64_t v54 = [(GEOLogMsgEventProactiveSuggestionInteractionSession *)self->_proactiveSuggestionInteractionSessionEvent hash];
  unint64_t v53 = [(GEOLogMsgEventMapLaunch *)self->_mapLaunchEvent hash];
  unint64_t v52 = [(GEOLogMsgEventRideBookingSession *)self->_rideBookingSession hash];
  unint64_t v51 = [(GEOLogMsgEventRideBookedSession *)self->_rideBookedSession hash];
  unint64_t v50 = [(GEOLogMsgEventTableBookingSession *)self->_tableBookingSession hash];
  unint64_t v49 = [(GEOLogMsgEventTableBookedSession *)self->_tableBookedSession hash];
  unint64_t v48 = [(GEOLogMsgEventFullNavTrace *)self->_fullNavTrace hash];
  unint64_t v47 = [(GEOLogMsgEventTelemetric *)self->_telemetric hash];
  unint64_t v46 = [(GEOLogMsgEventClientACSuggestions *)self->_clientAcSuggestions hash];
  unint64_t v45 = [(GEOLogMsgEventRealtimeTrafficProbe *)self->_realtimeTrafficProbeCollection hash];
  unint64_t v44 = [(GEOLogMsgEventBatchTrafficProbe *)self->_batchTrafficProbeCollection hash];
  unint64_t v43 = [(GEOLogMsgEventCommuteWindow *)self->_commuteWindow hash];
  unint64_t v42 = [(GEOLogMsgEventWifiConnectionQualityProbe *)self->_wifiConnectionQualityProbeEvent hash];
  unint64_t v41 = [(GEOLogMsgEventParkedCar *)self->_parkedCar hash];
  unint64_t v40 = [(GEOLogMsgEventTileCacheAnalytic *)self->_tileCacheAnalytic hash];
  unint64_t v39 = [(GEOLogMsgEventGridDuration *)self->_gridDuration hash];
  unint64_t v38 = [(GEOLogMsgEventDisplayAnalytic *)self->_displayAnalytic hash];
  unint64_t v37 = [(GEOLogMsgEventThrottle *)self->_throttleEvent hash];
  unint64_t v36 = [(GEOLogMsgEventMapKitCounts *)self->_mapKitCounts hash];
  unint64_t v35 = [(GEOLogMsgEventPredExTrainingData *)self->_predExTrainingData hash];
  unint64_t v34 = [(GEOLogMsgEventMarcoLiteUsage *)self->_marcoLiteUsage hash];
  unint64_t v33 = [(GEOLogMsgEventTripDepartureFeedback *)self->_tripDepartureFeedback hash];
  unint64_t v32 = [(GEOLogMsgEventDirectionsRequestDetails *)self->_directionsRequestDetails hash];
  unint64_t v31 = [(GEOLogMsgEventEVRoutingVehicleDetails *)self->_evRoutingVehicleDetails hash];
  unint64_t v30 = [(GEOLogMsgEventEVTrip *)self->_evTrip hash];
  unint64_t v29 = [(GEOLogMsgEventCuratedCollectionStats *)self->_curatedCollectionStats hash];
  unint64_t v28 = [(GEOLogMsgEventCuratedCollectionUsage *)self->_curatedCollectionUsage hash];
  unint64_t v27 = [(GEOLogMsgEventMapsDeviceSettings *)self->_mapsDeviceSettings hash];
  unint64_t v26 = [(GEOLogMsgEventHardStop *)self->_hardStop hash];
  unint64_t v25 = [(GEOLogMsgEventVLFUsage *)self->_vlfUsage hash];
  unint64_t v24 = [(GEOLogMsgEventLogDiscard *)self->_logDiscard hash];
  unint64_t v23 = [(GEOLogMsgEventDailyUseSummary *)self->_dailyUseSummary hash];
  unint64_t v22 = [(GEOLogMsgEventPressureData *)self->_pressureData hash];
  unint64_t v21 = [(GEOLogMsgEventPOIBusynessData *)self->_poiBusynessData hash];
  unint64_t v20 = [(GEOLogMsgEventPeriodicSettingsSummary *)self->_periodicSettingsSummary hash];
  unint64_t v19 = [(GEOLogMsgEventThermalPressure *)self->_thermalPressure hash];
  unint64_t v18 = [(GEOLogMsgEventARSessionUsage *)self->_arSessionUsage hash];
  unint64_t v3 = [(GEOLogMsgEventNetworkSelectionHarvest *)self->_networkSelectionHarvest hash];
  unint64_t v4 = [(GEOLogMsgEventImpressionEvent *)self->_impressionEvent hash];
  unint64_t v5 = [(GEOLogMsgEventShowcaseSuppression *)self->_showcaseSuppression hash];
  unint64_t v6 = [(GEOLogMsgEventPlaceCacheLookup *)self->_placeCacheLookup hash];
  unint64_t v7 = [(GEOLogMsgEventDeviceSyncStatus *)self->_deviceSyncStatus hash];
  unint64_t v8 = [(GEOLogMsgEventMapsInteraction *)self->_mapsInteraction hash];
  unint64_t v9 = [(GEOLogMsgEventNetworkEventSummary *)self->_networkEventSummary hash];
  unint64_t v10 = [(GEOLogMsgEventServiceMetadata *)self->_serviceMetadata hash];
  unint64_t v11 = [(GEOLogMsgEventMapsEngagement *)self->_mapsEngagement hash];
  if (*(unsigned char *)&self->_flags)
  {
    double usageEventTime = self->_usageEventTime;
    double v14 = -usageEventTime;
    if (usageEventTime >= 0.0) {
      double v14 = self->_usageEventTime;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  return v69 ^ v70 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  id v5 = *((id *)v4 + 22);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v128 objects:v132 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v129;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v129 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOLogMsgEvent addLogMsgState:](self, "addLogMsgState:", *(void *)(*((void *)&v128 + 1) + 8 * i), (void)v128);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v128 objects:v132 count:16];
    }
    while (v7);
  }

  analyticTag = self->_analyticTag;
  uint64_t v11 = *((void *)v4 + 2);
  if (analyticTag)
  {
    if (v11) {
      -[GEOLogMsgEventId mergeFrom:](analyticTag, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEOLogMsgEvent setAnalyticTag:](self, "setAnalyticTag:");
  }
  if (*((void *)v4 + 27)) {
    -[GEOLogMsgEvent setMapsEnvironment:](self, "setMapsEnvironment:");
  }
  if ((*((unsigned char *)v4 + 528) & 2) != 0)
  {
    self->_eventType = *((_DWORD *)v4 + 131);
    *(void *)&self->_flags |= 2uLL;
  }
  userActionEvent = self->_userActionEvent;
  uint64_t v13 = *((void *)v4 + 61);
  if (userActionEvent)
  {
    if (v13) {
      -[GEOLogMsgEventUserAction mergeFrom:](userActionEvent, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEOLogMsgEvent setUserActionEvent:](self, "setUserActionEvent:");
  }
  stateTimingEvent = self->_stateTimingEvent;
  uint64_t v15 = *((void *)v4 + 48);
  if (stateTimingEvent)
  {
    if (v15) {
      -[GEOLogMsgEventStateTiming mergeFrom:](stateTimingEvent, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[GEOLogMsgEvent setStateTimingEvent:](self, "setStateTimingEvent:");
  }
  tileSetStateEvent = self->_tileSetStateEvent;
  uint64_t v17 = *((void *)v4 + 55);
  if (tileSetStateEvent)
  {
    if (v17) {
      -[GEOLogMsgEventTileSetState mergeFrom:](tileSetStateEvent, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[GEOLogMsgEvent setTileSetStateEvent:](self, "setTileSetStateEvent:");
  }
  placeDataCacheEvent = self->_placeDataCacheEvent;
  uint64_t v19 = *((void *)v4 + 37);
  if (placeDataCacheEvent)
  {
    if (v19) {
      -[GEOLogMsgEventPlaceDataCache mergeFrom:](placeDataCacheEvent, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[GEOLogMsgEvent setPlaceDataCacheEvent:](self, "setPlaceDataCacheEvent:");
  }
  networkEvent = self->_networkEvent;
  uint64_t v21 = *((void *)v4 + 32);
  if (networkEvent)
  {
    if (v21) {
      -[GEOLogMsgEventNetwork mergeFrom:](networkEvent, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[GEOLogMsgEvent setNetworkEvent:](self, "setNetworkEvent:");
  }
  directionsEvent = self->_directionsEvent;
  uint64_t v23 = *((void *)v4 + 11);
  if (directionsEvent)
  {
    if (v23) {
      -[GEOLogMsgEventDirections mergeFrom:](directionsEvent, "mergeFrom:");
    }
  }
  else if (v23)
  {
    -[GEOLogMsgEvent setDirectionsEvent:](self, "setDirectionsEvent:");
  }
  transitAppLaunchEvent = self->_transitAppLaunchEvent;
  uint64_t v25 = *((void *)v4 + 58);
  if (transitAppLaunchEvent)
  {
    if (v25) {
      -[GEOLogMsgEventTransitAppLaunch mergeFrom:](transitAppLaunchEvent, "mergeFrom:");
    }
  }
  else if (v25)
  {
    -[GEOLogMsgEvent setTransitAppLaunchEvent:](self, "setTransitAppLaunchEvent:");
  }
  timeToLeaveHypothesisEvent = self->_timeToLeaveHypothesisEvent;
  uint64_t v27 = *((void *)v4 + 56);
  if (timeToLeaveHypothesisEvent)
  {
    if (v27) {
      -[GEOLogMsgEventTimeToLeaveHypothesis mergeFrom:](timeToLeaveHypothesisEvent, "mergeFrom:");
    }
  }
  else if (v27)
  {
    -[GEOLogMsgEvent setTimeToLeaveHypothesisEvent:](self, "setTimeToLeaveHypothesisEvent:");
  }
  timeToLeaveInitialTravelTimeEvent = self->_timeToLeaveInitialTravelTimeEvent;
  uint64_t v29 = *((void *)v4 + 57);
  if (timeToLeaveInitialTravelTimeEvent)
  {
    if (v29) {
      -[GEOLogMsgEventTimeToLeaveInitialTravelTime mergeFrom:](timeToLeaveInitialTravelTimeEvent, "mergeFrom:");
    }
  }
  else if (v29)
  {
    -[GEOLogMsgEvent setTimeToLeaveInitialTravelTimeEvent:](self, "setTimeToLeaveInitialTravelTimeEvent:");
  }
  mapsWidgetsInteractionSession = self->_mapsWidgetsInteractionSession;
  uint64_t v31 = *((void *)v4 + 29);
  if (mapsWidgetsInteractionSession)
  {
    if (v31) {
      -[GEOLogMsgEventMapsWidgetsInteractionSession mergeFrom:](mapsWidgetsInteractionSession, "mergeFrom:");
    }
  }
  else if (v31)
  {
    -[GEOLogMsgEvent setMapsWidgetsInteractionSession:](self, "setMapsWidgetsInteractionSession:");
  }
  listInteractionSession = self->_listInteractionSession;
  uint64_t v33 = *((void *)v4 + 20);
  if (listInteractionSession)
  {
    if (v33) {
      -[GEOLogMsgEventListInteractionSession mergeFrom:](listInteractionSession, "mergeFrom:");
    }
  }
  else if (v33)
  {
    -[GEOLogMsgEvent setListInteractionSession:](self, "setListInteractionSession:");
  }
  refineSearchSession = self->_refineSearchSession;
  uint64_t v35 = *((void *)v4 + 43);
  if (refineSearchSession)
  {
    if (v35) {
      -[GEOLogMsgEventRefineSearchSession mergeFrom:](refineSearchSession, "mergeFrom:");
    }
  }
  else if (v35)
  {
    -[GEOLogMsgEvent setRefineSearchSession:](self, "setRefineSearchSession:");
  }
  proactiveSuggestionInteractionSessionEvent = self->_proactiveSuggestionInteractionSessionEvent;
  uint64_t v37 = *((void *)v4 + 41);
  if (proactiveSuggestionInteractionSessionEvent)
  {
    if (v37) {
      -[GEOLogMsgEventProactiveSuggestionInteractionSession mergeFrom:](proactiveSuggestionInteractionSessionEvent, "mergeFrom:");
    }
  }
  else if (v37)
  {
    -[GEOLogMsgEvent setProactiveSuggestionInteractionSessionEvent:](self, "setProactiveSuggestionInteractionSessionEvent:");
  }
  mapLaunchEvent = self->_mapLaunchEvent;
  uint64_t v39 = *((void *)v4 + 24);
  if (mapLaunchEvent)
  {
    if (v39) {
      -[GEOLogMsgEventMapLaunch mergeFrom:](mapLaunchEvent, "mergeFrom:");
    }
  }
  else if (v39)
  {
    -[GEOLogMsgEvent setMapLaunchEvent:](self, "setMapLaunchEvent:");
  }
  rideBookingSession = self->_rideBookingSession;
  uint64_t v41 = *((void *)v4 + 45);
  if (rideBookingSession)
  {
    if (v41) {
      -[GEOLogMsgEventRideBookingSession mergeFrom:](rideBookingSession, "mergeFrom:");
    }
  }
  else if (v41)
  {
    -[GEOLogMsgEvent setRideBookingSession:](self, "setRideBookingSession:");
  }
  rideBookedSession = self->_rideBookedSession;
  uint64_t v43 = *((void *)v4 + 44);
  if (rideBookedSession)
  {
    if (v43) {
      -[GEOLogMsgEventRideBookedSession mergeFrom:](rideBookedSession, "mergeFrom:");
    }
  }
  else if (v43)
  {
    -[GEOLogMsgEvent setRideBookedSession:](self, "setRideBookedSession:");
  }
  tableBookingSession = self->_tableBookingSession;
  uint64_t v45 = *((void *)v4 + 50);
  if (tableBookingSession)
  {
    if (v45) {
      -[GEOLogMsgEventTableBookingSession mergeFrom:](tableBookingSession, "mergeFrom:");
    }
  }
  else if (v45)
  {
    -[GEOLogMsgEvent setTableBookingSession:](self, "setTableBookingSession:");
  }
  tableBookedSession = self->_tableBookedSession;
  uint64_t v47 = *((void *)v4 + 49);
  if (tableBookedSession)
  {
    if (v47) {
      -[GEOLogMsgEventTableBookedSession mergeFrom:](tableBookedSession, "mergeFrom:");
    }
  }
  else if (v47)
  {
    -[GEOLogMsgEvent setTableBookedSession:](self, "setTableBookedSession:");
  }
  fullNavTrace = self->_fullNavTrace;
  uint64_t v49 = *((void *)v4 + 16);
  if (fullNavTrace)
  {
    if (v49) {
      -[GEOLogMsgEventFullNavTrace mergeFrom:](fullNavTrace, "mergeFrom:");
    }
  }
  else if (v49)
  {
    -[GEOLogMsgEvent setFullNavTrace:](self, "setFullNavTrace:");
  }
  telemetric = self->_telemetric;
  uint64_t v51 = *((void *)v4 + 51);
  if (telemetric)
  {
    if (v51) {
      -[GEOLogMsgEventTelemetric mergeFrom:](telemetric, "mergeFrom:");
    }
  }
  else if (v51)
  {
    -[GEOLogMsgEvent setTelemetric:](self, "setTelemetric:");
  }
  clientAcSuggestions = self->_clientAcSuggestions;
  uint64_t v53 = *((void *)v4 + 5);
  if (clientAcSuggestions)
  {
    if (v53) {
      -[GEOLogMsgEventClientACSuggestions mergeFrom:](clientAcSuggestions, "mergeFrom:");
    }
  }
  else if (v53)
  {
    -[GEOLogMsgEvent setClientAcSuggestions:](self, "setClientAcSuggestions:");
  }
  realtimeTrafficProbeCollection = self->_realtimeTrafficProbeCollection;
  uint64_t v55 = *((void *)v4 + 42);
  if (realtimeTrafficProbeCollection)
  {
    if (v55) {
      -[GEOLogMsgEventRealtimeTrafficProbe mergeFrom:](realtimeTrafficProbeCollection, "mergeFrom:");
    }
  }
  else if (v55)
  {
    -[GEOLogMsgEvent setRealtimeTrafficProbeCollection:](self, "setRealtimeTrafficProbeCollection:");
  }
  batchTrafficProbeCollection = self->_batchTrafficProbeCollection;
  uint64_t v57 = *((void *)v4 + 4);
  if (batchTrafficProbeCollection)
  {
    if (v57) {
      -[GEOLogMsgEventBatchTrafficProbe mergeFrom:](batchTrafficProbeCollection, "mergeFrom:");
    }
  }
  else if (v57)
  {
    -[GEOLogMsgEvent setBatchTrafficProbeCollection:](self, "setBatchTrafficProbeCollection:");
  }
  commuteWindow = self->_commuteWindow;
  uint64_t v59 = *((void *)v4 + 6);
  if (commuteWindow)
  {
    if (v59) {
      -[GEOLogMsgEventCommuteWindow mergeFrom:](commuteWindow, "mergeFrom:");
    }
  }
  else if (v59)
  {
    -[GEOLogMsgEvent setCommuteWindow:](self, "setCommuteWindow:");
  }
  wifiConnectionQualityProbeEvent = self->_wifiConnectionQualityProbeEvent;
  uint64_t v61 = *((void *)v4 + 63);
  if (wifiConnectionQualityProbeEvent)
  {
    if (v61) {
      -[GEOLogMsgEventWifiConnectionQualityProbe mergeFrom:](wifiConnectionQualityProbeEvent, "mergeFrom:");
    }
  }
  else if (v61)
  {
    -[GEOLogMsgEvent setWifiConnectionQualityProbeEvent:](self, "setWifiConnectionQualityProbeEvent:");
  }
  parkedCar = self->_parkedCar;
  uint64_t v63 = *((void *)v4 + 34);
  if (parkedCar)
  {
    if (v63) {
      -[GEOLogMsgEventParkedCar mergeFrom:](parkedCar, "mergeFrom:");
    }
  }
  else if (v63)
  {
    -[GEOLogMsgEvent setParkedCar:](self, "setParkedCar:");
  }
  tileCacheAnalytic = self->_tileCacheAnalytic;
  uint64_t v65 = *((void *)v4 + 54);
  if (tileCacheAnalytic)
  {
    if (v65) {
      -[GEOLogMsgEventTileCacheAnalytic mergeFrom:](tileCacheAnalytic, "mergeFrom:");
    }
  }
  else if (v65)
  {
    -[GEOLogMsgEvent setTileCacheAnalytic:](self, "setTileCacheAnalytic:");
  }
  gridDuration = self->_gridDuration;
  uint64_t v67 = *((void *)v4 + 17);
  if (gridDuration)
  {
    if (v67) {
      -[GEOLogMsgEventGridDuration mergeFrom:](gridDuration, "mergeFrom:");
    }
  }
  else if (v67)
  {
    -[GEOLogMsgEvent setGridDuration:](self, "setGridDuration:");
  }
  displayAnalytic = self->_displayAnalytic;
  uint64_t v69 = *((void *)v4 + 13);
  if (displayAnalytic)
  {
    if (v69) {
      -[GEOLogMsgEventDisplayAnalytic mergeFrom:](displayAnalytic, "mergeFrom:");
    }
  }
  else if (v69)
  {
    -[GEOLogMsgEvent setDisplayAnalytic:](self, "setDisplayAnalytic:");
  }
  throttleEvent = self->_throttleEvent;
  uint64_t v71 = *((void *)v4 + 53);
  if (throttleEvent)
  {
    if (v71) {
      -[GEOLogMsgEventThrottle mergeFrom:](throttleEvent, "mergeFrom:");
    }
  }
  else if (v71)
  {
    -[GEOLogMsgEvent setThrottleEvent:](self, "setThrottleEvent:");
  }
  mapKitCounts = self->_mapKitCounts;
  uint64_t v73 = *((void *)v4 + 23);
  if (mapKitCounts)
  {
    if (v73) {
      -[GEOLogMsgEventMapKitCounts mergeFrom:](mapKitCounts, "mergeFrom:");
    }
  }
  else if (v73)
  {
    -[GEOLogMsgEvent setMapKitCounts:](self, "setMapKitCounts:");
  }
  predExTrainingData = self->_predExTrainingData;
  uint64_t v75 = *((void *)v4 + 39);
  if (predExTrainingData)
  {
    if (v75) {
      -[GEOLogMsgEventPredExTrainingData mergeFrom:](predExTrainingData, "mergeFrom:");
    }
  }
  else if (v75)
  {
    -[GEOLogMsgEvent setPredExTrainingData:](self, "setPredExTrainingData:");
  }
  marcoLiteUsage = self->_marcoLiteUsage;
  uint64_t v77 = *((void *)v4 + 30);
  if (marcoLiteUsage)
  {
    if (v77) {
      -[GEOLogMsgEventMarcoLiteUsage mergeFrom:](marcoLiteUsage, "mergeFrom:");
    }
  }
  else if (v77)
  {
    -[GEOLogMsgEvent setMarcoLiteUsage:](self, "setMarcoLiteUsage:");
  }
  tripDepartureFeedback = self->_tripDepartureFeedback;
  uint64_t v79 = *((void *)v4 + 59);
  if (tripDepartureFeedback)
  {
    if (v79) {
      -[GEOLogMsgEventTripDepartureFeedback mergeFrom:](tripDepartureFeedback, "mergeFrom:");
    }
  }
  else if (v79)
  {
    -[GEOLogMsgEvent setTripDepartureFeedback:](self, "setTripDepartureFeedback:");
  }
  directionsRequestDetails = self->_directionsRequestDetails;
  uint64_t v81 = *((void *)v4 + 12);
  if (directionsRequestDetails)
  {
    if (v81) {
      -[GEOLogMsgEventDirectionsRequestDetails mergeFrom:](directionsRequestDetails, "mergeFrom:");
    }
  }
  else if (v81)
  {
    -[GEOLogMsgEvent setDirectionsRequestDetails:](self, "setDirectionsRequestDetails:");
  }
  evRoutingVehicleDetails = self->_evRoutingVehicleDetails;
  uint64_t v83 = *((void *)v4 + 14);
  if (evRoutingVehicleDetails)
  {
    if (v83) {
      -[GEOLogMsgEventEVRoutingVehicleDetails mergeFrom:](evRoutingVehicleDetails, "mergeFrom:");
    }
  }
  else if (v83)
  {
    [(GEOLogMsgEvent *)self setEvRoutingVehicleDetails:"setEvRoutingVehicleDetails:"];
  }
  evTrip = self->_evTrip;
  uint64_t v85 = *((void *)v4 + 15);
  if (evTrip)
  {
    if (v85) {
      -[GEOLogMsgEventEVTrip mergeFrom:](evTrip, "mergeFrom:");
    }
  }
  else if (v85)
  {
    -[GEOLogMsgEvent setEvTrip:](self, "setEvTrip:");
  }
  curatedCollectionStats = self->_curatedCollectionStats;
  uint64_t v87 = *((void *)v4 + 7);
  if (curatedCollectionStats)
  {
    if (v87) {
      -[GEOLogMsgEventCuratedCollectionStats mergeFrom:](curatedCollectionStats, "mergeFrom:");
    }
  }
  else if (v87)
  {
    -[GEOLogMsgEvent setCuratedCollectionStats:](self, "setCuratedCollectionStats:");
  }
  curatedCollectionUsage = self->_curatedCollectionUsage;
  uint64_t v89 = *((void *)v4 + 8);
  if (curatedCollectionUsage)
  {
    if (v89) {
      -[GEOLogMsgEventCuratedCollectionUsage mergeFrom:](curatedCollectionUsage, "mergeFrom:");
    }
  }
  else if (v89)
  {
    -[GEOLogMsgEvent setCuratedCollectionUsage:](self, "setCuratedCollectionUsage:");
  }
  mapsDeviceSettings = self->_mapsDeviceSettings;
  uint64_t v91 = *((void *)v4 + 25);
  if (mapsDeviceSettings)
  {
    if (v91) {
      -[GEOLogMsgEventMapsDeviceSettings mergeFrom:](mapsDeviceSettings, "mergeFrom:");
    }
  }
  else if (v91)
  {
    -[GEOLogMsgEvent setMapsDeviceSettings:](self, "setMapsDeviceSettings:");
  }
  hardStop = self->_hardStop;
  uint64_t v93 = *((void *)v4 + 18);
  if (hardStop)
  {
    if (v93) {
      -[GEOLogMsgEventHardStop mergeFrom:](hardStop, "mergeFrom:");
    }
  }
  else if (v93)
  {
    -[GEOLogMsgEvent setHardStop:](self, "setHardStop:");
  }
  vlfUsage = self->_vlfUsage;
  uint64_t v95 = *((void *)v4 + 62);
  if (vlfUsage)
  {
    if (v95) {
      -[GEOLogMsgEventVLFUsage mergeFrom:](vlfUsage, "mergeFrom:");
    }
  }
  else if (v95)
  {
    -[GEOLogMsgEvent setVlfUsage:](self, "setVlfUsage:");
  }
  logDiscard = self->_logDiscard;
  uint64_t v97 = *((void *)v4 + 21);
  if (logDiscard)
  {
    if (v97) {
      -[GEOLogMsgEventLogDiscard mergeFrom:](logDiscard, "mergeFrom:");
    }
  }
  else if (v97)
  {
    -[GEOLogMsgEvent setLogDiscard:](self, "setLogDiscard:");
  }
  dailyUseSummary = self->_dailyUseSummary;
  uint64_t v99 = *((void *)v4 + 9);
  if (dailyUseSummary)
  {
    if (v99) {
      -[GEOLogMsgEventDailyUseSummary mergeFrom:](dailyUseSummary, "mergeFrom:");
    }
  }
  else if (v99)
  {
    -[GEOLogMsgEvent setDailyUseSummary:](self, "setDailyUseSummary:");
  }
  pressureData = self->_pressureData;
  uint64_t v101 = *((void *)v4 + 40);
  if (pressureData)
  {
    if (v101) {
      -[GEOLogMsgEventPressureData mergeFrom:](pressureData, "mergeFrom:");
    }
  }
  else if (v101)
  {
    -[GEOLogMsgEvent setPressureData:](self, "setPressureData:");
  }
  poiBusynessData = self->_poiBusynessData;
  uint64_t v103 = *((void *)v4 + 38);
  if (poiBusynessData)
  {
    if (v103) {
      -[GEOLogMsgEventPOIBusynessData mergeFrom:](poiBusynessData, "mergeFrom:");
    }
  }
  else if (v103)
  {
    -[GEOLogMsgEvent setPoiBusynessData:](self, "setPoiBusynessData:");
  }
  periodicSettingsSummary = self->_periodicSettingsSummary;
  uint64_t v105 = *((void *)v4 + 35);
  if (periodicSettingsSummary)
  {
    if (v105) {
      -[GEOLogMsgEventPeriodicSettingsSummary mergeFrom:](periodicSettingsSummary, "mergeFrom:");
    }
  }
  else if (v105)
  {
    -[GEOLogMsgEvent setPeriodicSettingsSummary:](self, "setPeriodicSettingsSummary:");
  }
  thermalPressure = self->_thermalPressure;
  uint64_t v107 = *((void *)v4 + 52);
  if (thermalPressure)
  {
    if (v107) {
      -[GEOLogMsgEventThermalPressure mergeFrom:](thermalPressure, "mergeFrom:");
    }
  }
  else if (v107)
  {
    -[GEOLogMsgEvent setThermalPressure:](self, "setThermalPressure:");
  }
  arSessionUsage = self->_arSessionUsage;
  uint64_t v109 = *((void *)v4 + 3);
  if (arSessionUsage)
  {
    if (v109) {
      -[GEOLogMsgEventARSessionUsage mergeFrom:](arSessionUsage, "mergeFrom:");
    }
  }
  else if (v109)
  {
    -[GEOLogMsgEvent setArSessionUsage:](self, "setArSessionUsage:");
  }
  networkSelectionHarvest = self->_networkSelectionHarvest;
  uint64_t v111 = *((void *)v4 + 33);
  if (networkSelectionHarvest)
  {
    if (v111) {
      -[GEOLogMsgEventNetworkSelectionHarvest mergeFrom:](networkSelectionHarvest, "mergeFrom:");
    }
  }
  else if (v111)
  {
    -[GEOLogMsgEvent setNetworkSelectionHarvest:](self, "setNetworkSelectionHarvest:");
  }
  impressionEvent = self->_impressionEvent;
  uint64_t v113 = *((void *)v4 + 19);
  if (impressionEvent)
  {
    if (v113) {
      -[GEOLogMsgEventImpressionEvent mergeFrom:](impressionEvent, "mergeFrom:");
    }
  }
  else if (v113)
  {
    -[GEOLogMsgEvent setImpressionEvent:](self, "setImpressionEvent:");
  }
  showcaseSuppression = self->_showcaseSuppression;
  uint64_t v115 = *((void *)v4 + 47);
  if (showcaseSuppression)
  {
    if (v115) {
      -[GEOLogMsgEventShowcaseSuppression mergeFrom:](showcaseSuppression, "mergeFrom:");
    }
  }
  else if (v115)
  {
    -[GEOLogMsgEvent setShowcaseSuppression:](self, "setShowcaseSuppression:");
  }
  placeCacheLookup = self->_placeCacheLookup;
  uint64_t v117 = *((void *)v4 + 36);
  if (placeCacheLookup)
  {
    if (v117) {
      -[GEOLogMsgEventPlaceCacheLookup mergeFrom:](placeCacheLookup, "mergeFrom:");
    }
  }
  else if (v117)
  {
    -[GEOLogMsgEvent setPlaceCacheLookup:](self, "setPlaceCacheLookup:");
  }
  deviceSyncStatus = self->_deviceSyncStatus;
  uint64_t v119 = *((void *)v4 + 10);
  if (deviceSyncStatus)
  {
    if (v119) {
      -[GEOLogMsgEventDeviceSyncStatus mergeFrom:](deviceSyncStatus, "mergeFrom:");
    }
  }
  else if (v119)
  {
    -[GEOLogMsgEvent setDeviceSyncStatus:](self, "setDeviceSyncStatus:");
  }
  mapsInteraction = self->_mapsInteraction;
  uint64_t v121 = *((void *)v4 + 28);
  if (mapsInteraction)
  {
    if (v121) {
      -[GEOLogMsgEventMapsInteraction mergeFrom:](mapsInteraction, "mergeFrom:");
    }
  }
  else if (v121)
  {
    -[GEOLogMsgEvent setMapsInteraction:](self, "setMapsInteraction:");
  }
  networkEventSummary = self->_networkEventSummary;
  uint64_t v123 = *((void *)v4 + 31);
  if (networkEventSummary)
  {
    if (v123) {
      -[GEOLogMsgEventNetworkEventSummary mergeFrom:](networkEventSummary, "mergeFrom:");
    }
  }
  else if (v123)
  {
    -[GEOLogMsgEvent setNetworkEventSummary:](self, "setNetworkEventSummary:");
  }
  serviceMetadata = self->_serviceMetadata;
  uint64_t v125 = *((void *)v4 + 46);
  if (serviceMetadata)
  {
    if (v125) {
      -[GEOLogMsgEventServiceMetadata mergeFrom:](serviceMetadata, "mergeFrom:");
    }
  }
  else if (v125)
  {
    -[GEOLogMsgEvent setServiceMetadata:](self, "setServiceMetadata:");
  }
  mapsEngagement = self->_mapsEngagement;
  uint64_t v127 = *((void *)v4 + 26);
  if (mapsEngagement)
  {
    if (v127) {
      -[GEOLogMsgEventMapsEngagement mergeFrom:](mapsEngagement, "mergeFrom:");
    }
  }
  else if (v127)
  {
    -[GEOLogMsgEvent setMapsEngagement:](self, "setMapsEngagement:");
  }
  if (*((unsigned char *)v4 + 528))
  {
    self->_double usageEventTime = *((double *)v4 + 60);
    *(void *)&self->_flags |= 1uLL;
  }
}

- (double)usageEventTime
{
  return self->_usageEventTime;
}

- (void)setUsageEventTime:(double)a3
{
  *(void *)&self->_flags |= 0x8000000000000001;
  self->_double usageEventTime = a3;
}

- (void)setHasUsageEventTime:(BOOL)a3
{
  self->_$6A63E7CDA14C5D1C599C38C8531A0EC3 flags = ($6A63E7CDA14C5D1C599C38C8531A0EC3)(*(void *)&self->_flags & 0x7FFFFFFFFFFFFFFELL | a3 | 0x8000000000000000);
}

- (BOOL)hasUsageEventTime
{
  return *(_DWORD *)&self->_flags & 1;
}

@end