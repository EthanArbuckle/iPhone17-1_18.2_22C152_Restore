@interface GEOComposedRoute
+ (BOOL)supportsSecureCoding;
- ($1AB5FA073B851C12C2339EC22442E995)endLocationCoordinate;
- ($1AB5FA073B851C12C2339EC22442E995)locationAtDistance:(double)a3 from:(id)a4;
- ($1AB5FA073B851C12C2339EC22442E995)pointAt:(unint64_t)a3;
- ($1AB5FA073B851C12C2339EC22442E995)pointAtRouteCoordinate:(PolylineCoordinate)a3;
- ($1AB5FA073B851C12C2339EC22442E995)startLocationCoordinate;
- ($212C09783140BCCD23384160D545CE0D)routeCoordinateForDistance:(double)a3 afterRouteCoordinate:(id)a4;
- ($212C09783140BCCD23384160D545CE0D)routeCoordinateForDistance:(double)a3 afterStartOfLegIndex:(unint64_t)a4;
- ($212C09783140BCCD23384160D545CE0D)routeCoordinateForDistance:(double)a3 beforeEndOfLegIndex:(unint64_t)a4;
- ($212C09783140BCCD23384160D545CE0D)routeCoordinateForDistance:(double)a3 beforeRouteCoordinate:(id)a4;
- ($212C09783140BCCD23384160D545CE0D)routeCoordinateForDistanceAfterStart:(double)a3;
- ($212C09783140BCCD23384160D545CE0D)routeCoordinateForDistanceBeforeEnd:(double)a3;
- ($3314123FD9D86BC79D52D2D985513A44)coarseBoundsForRange:(SEL)a3;
- ($3314123FD9D86BC79D52D2D985513A44)coarseBoundsForRange:(SEL)a3 sampleLength:(GEOPolylineCoordinateRange)a4;
- (BOOL)_MapsCarPlay_isEqual:(id)a3;
- (BOOL)_meetsMinimumPathLengthBetweenStart:(unsigned int)a3 end:(unsigned int)a4;
- (BOOL)allowsNetworkTileLoad;
- (BOOL)avoidsHighways;
- (BOOL)avoidsTolls;
- (BOOL)avoidsTraffic;
- (BOOL)checkDrivingArrivalForCoordinate:(id)a3 coordinateOnRoute:(id)a4 routePointIndex:(unsigned int)a5 distanceFromRoute:(double)a6 arrivalMapRegion:(id)a7 checkArrivalRadius:(BOOL)a8 checkDistanceAlongRoute:(BOOL)a9 checkRoadAccessPoints:(BOOL)a10 isOnRoute:(BOOL)a11;
- (BOOL)hasArrivalMapRegion;
- (BOOL)hasExpectedTime;
- (BOOL)hasHistoricTravelTime;
- (BOOL)hasInitialPromptType:(int)a3;
- (BOOL)isEVRoute;
- (BOOL)isNavigable;
- (BOOL)isNewProtocolRoute;
- (BOOL)isOfflineRoute;
- (BOOL)isSnapping;
- (BOOL)isStopInTerminalStructure:(id)a3;
- (BOOL)isWalkingOnlyTransitRoute;
- (BOOL)maneuverDisplayEnabled;
- (BOOL)shouldShowSchedule;
- (BOOL)supportsRideClusters;
- (BOOL)supportsSnapping;
- (BOOL)usesRoutingPathPoints;
- (BOOL)usesZilch;
- (GEOAddressObject)address;
- (GEOComposedGeometryRoutePersistentData)persistentData;
- (GEOComposedRoute)init;
- (GEOComposedRoute)initWithCoder:(id)a3;
- (GEOComposedRoute)initWithCompanionRoute:(id)a3;
- (GEOComposedRoute)initWithGeoWaypointRoute:(id)a3 initializerData:(id)a4;
- (GEOComposedRoute)initWithSuggestedRoute:(id)a3 initializerData:(id)a4;
- (GEOComposedRoute)initWithSuggestedRoute:(id)a3 initializerData:(id)a4 uniqueRouteID:(id)a5;
- (GEOComposedRoute)initWithSuggestedRoute:(id)a3 initializerData:(id)a4 updateRequest:(id)a5;
- (GEOComposedRoute)initWithTransitGeometry:(id)a3 andLine:(id)a4 andStops:(id)a5;
- (GEOComposedRouteAnchorPointList)anchorPoints;
- (GEOComposedRouteMutableData)mutableData;
- (GEOComposedRouteTraffic)traffic;
- (GEOComposedString)hikeTypeString;
- (GEOComposedString)infrastructureDescriptionString;
- (GEOComposedString)pickingDurationString;
- (GEOComposedString)planningDescriptionString;
- (GEOComposedString)planningDistanceString;
- (GEOComposedString)previewDurationString;
- (GEOComposedString)routeLabelDescriptionString;
- (GEOComposedString)transitDescriptionString;
- (GEOComposedString)transitRouteBadgeString;
- (GEOComposedWaypoint)destination;
- (GEOComposedWaypoint)origin;
- (GEOElevationProfile)elevationProfile;
- (GEOLabelAction)routeLabelAction;
- (GEOMapItemIdentifier)tourIdentifier;
- (GEOMapRegion)arrivalMapRegion;
- (GEOMapRegion)boundingMapRegion;
- (GEOPBTransitArtwork)trafficDescriptionArtwork;
- (GEOPDURLData)disclaimerURL;
- (GEOPolylineCoordinateRange)routeCoordinateRange;
- (GEORouteAttributes)routeAttributes;
- (GEORouteDisplayHints)displayHints;
- (GEORouteInitializerData)routeInitializerData;
- (GEORouteRestrictionZoneInfo)restrictionZoneInfo;
- (GEOServerFormattedString)infrastructureDescription;
- (GEOServerFormattedString)pickingDurationFormatString;
- (GEOServerFormattedString)planningDescriptionFormatString;
- (GEOServerFormattedString)planningDistanceFormatString;
- (GEOServerFormattedString)previewDurationFormatString;
- (GEOServerFormattedString)routeLabelDescription;
- (GEOServerFormattedString)transitDescriptionFormatString;
- (GEOServerFormattedString)transitRouteBadge;
- (GEOStyleAttributes)styleAttributes;
- (GEOTransitArtworkDataSource)routeLabelArtwork;
- (GEOTransitRouteUpdateRequest)transitRouteUpdateRequest;
- (GEOTransitRoutingIncidentMessage)transitRoutingIncidentMessage;
- (GEOTransitSuggestedRoute)originalSuggestedRoute;
- (GEOTransitSuggestedRoute)suggestedRoute;
- (GEOWaypointRoute)geoWaypointRoute;
- (NSArray)advisories;
- (NSArray)baseTransitFares;
- (NSArray)cameraInfos;
- (NSArray)composedGuidanceEvents;
- (NSArray)enrouteNotices;
- (NSArray)etauPositions;
- (NSArray)halls;
- (NSArray)legs;
- (NSArray)maneuverDisplaySteps;
- (NSArray)rideSelections;
- (NSArray)routeDescriptions;
- (NSArray)routePlanningArtworks;
- (NSArray)sections;
- (NSArray)segments;
- (NSArray)stations;
- (NSArray)steps;
- (NSArray)stops;
- (NSArray)transitPaymentMethods;
- (NSArray)visualInfos;
- (NSArray)visualInfosForRouteNameLabels;
- (NSArray)waypoints;
- (NSData)directionsResponseID;
- (NSData)etauResponseID;
- (NSData)serverRouteID;
- (NSDate)startDate;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)disclaimerText;
- (NSString)name;
- (NSString)planningSeparatorString;
- (NSString)trafficDescription;
- (NSString)userProvidedName;
- (NSString)userProvidedNotes;
- (NSUUID)revisionIdentifier;
- (NSUUID)storageID;
- (NSUUID)uniqueRouteID;
- (PolylineCoordinate)_findRouteCoordinateWithOffset:(float)a3 aPos:(const void *)a4 aCoord:(const PolylineCoordinate *)a5 bCoord:(const PolylineCoordinate *)a6 pointOnSegment:(const void *)a7 bounds:(id *)a8;
- (PolylineCoordinate)closestPointOnRoute:(id)a3;
- (PolylineCoordinate)coordinateAtOffset:(double)a3;
- (PolylineCoordinate)coordinateAtOffset:(double)a3 fromRouteCoordinate:(PolylineCoordinate)a4;
- (PolylineCoordinate)coordinateAtOffset:(double)a3 fromRoutePoint:(unint64_t)a4;
- (PolylineCoordinate)coordinateAtTimeInterval:(double)a3 afterCoordinate:(PolylineCoordinate)a4 etaRoute:(id)a5;
- (PolylineCoordinate)coordinateAtTimeInterval:(double)a3 beforeCoordinate:(PolylineCoordinate)a4 etaRoute:(id)a5;
- (PolylineCoordinate)endRouteCoordinate;
- (PolylineCoordinate)routeCoordinateAtDistance:(double)a3 beforeRouteCoordinate:(PolylineCoordinate)a4;
- (PolylineCoordinate)startRouteCoordinate;
- (double)_hypothesis_travelDuration;
- (double)_hypothesis_travelDurationFromStep:(id)a3 stepRemainingDistance:(double)a4;
- (double)chargingDuration;
- (double)courseAtRouteCoordinateIndex:(unsigned int)a3;
- (double)distance;
- (double)distanceBetweenIndex:(unint64_t)a3 andIndex:(unint64_t)a4;
- (double)distanceBetweenLocation:(id)a3 nextPointIndex:(unsigned int)a4 toPointIndex:(unsigned int)a5;
- (double)distanceBetweenRouteCoordinate:(id)a3 andRouteCoordinate:(id)a4;
- (double)distanceBetweenRoutePointIndex:(unsigned int)a3 toPointIndex:(unsigned int)a4;
- (double)distanceBetweenStep:(id)a3 andStep:(id)a4;
- (double)distanceFromPoint:(PolylineCoordinate)a3 toPoint:(PolylineCoordinate)a4;
- (double)distanceFromPointIndex:(unint64_t)a3 toPointIndex:(unint64_t)a4;
- (double)distanceFromStartToIndex:(unint64_t)a3;
- (double)distanceFromStartToRouteCoordinate:(id)a3;
- (double)distanceToEndFromIndex:(unint64_t)a3;
- (double)distanceToEndFromRouteCoordinate:(id)a3;
- (double)freeflowTravelTime;
- (double)pointLength;
- (double)remainingDistanceAlongRouteFromStepIndex:(unint64_t)a3 currentStepRemainingDistance:(double)a4;
- (double)remainingDistanceToEndOfLeg:(unint64_t)a3 currentStepRemainingDistance:(double)a4;
- (double)remainingTimeAlongRouteFromStepIndex:(unint64_t)a3 currentStepRemainingDistance:(double)a4;
- (double)remainingTimeToEndOfCurrentLegFrom:(PolylineCoordinate)a3 etaRoute:(id)a4;
- (double)remainingTimeToEndOfLeg:(unint64_t)a3 currentStepRemainingDistance:(double)a4;
- (double)remainingTimeToEndOfRouteFrom:(PolylineCoordinate)a3 etaRoute:(id)a4;
- (double)stepDistanceFromPoint:(PolylineCoordinate)a3 toPoint:(PolylineCoordinate)a4;
- (double)totalAscent;
- (double)totalDescent;
- (double)transitUpdateInitialDelay;
- (double)travelAndChargingDuration;
- (double)travelTimeAggressiveEstimate;
- (double)travelTimeConservativeEstimate;
- (id)_geoETAWaypointRouteWithZilchFromRouteCoordinate:(PolylineCoordinate)a3;
- (id)_nextOptionForOption:(id)a3 rideIndex:(unint64_t)a4;
- (id)boardStepForSection:(id)a3;
- (id)coordinates;
- (id)firstEVStep;
- (id)geoETAWaypointRoute;
- (id)geoETAWaypointRouteFromRouteCoordinate:(PolylineCoordinate)a3 includeOriginWaypointInfo:(BOOL)a4 startPathSegment:(id)a5;
- (id)geoOriginalWaypointRouteFromRouteCoordinate:(PolylineCoordinate)a3 purpose:(int)a4;
- (id)geoOriginalWaypointRouteFromRouteCoordinate:(PolylineCoordinate)a3 purpose:(int)a4 userPosition:(PolylineCoordinate)a5 origin:(id)a6 startPathSegment:(id)a7;
- (id)geoTrafficBannerTexts;
- (id)getHallForStop:(id)a3;
- (id)getSnappedPathsForLocation:(id)a3 radius:(double)a4 observer:(id)a5;
- (id)getSnappedPathsForVisibleRect:(id)a3 rectsToSnap:(id *)a4 rectsToSnapCount:(unint64_t)a5 observer:(id)a6;
- (id)getSnappedPathsForVisibleRect:(id)a3 rectsToSnap:(id *)a4 rectsToSnapCount:(unint64_t)a5 observer:(id)a6 completionHandler:(id)a7;
- (id)getStationForHall:(id)a3;
- (id)getStationForStop:(id)a3;
- (id)lastEVStep;
- (id)lastEVStepInLegWithIndex:(unint64_t)a3;
- (id)roadFeatureAtPointIndex:(unsigned int)a3;
- (id)routeMatchAtDistance:(double)a3 from:(id)a4 stopAtEndOfTunnel:(BOOL)a5 stopAtEndOfManeuver:(BOOL)a6 date:(id)a7;
- (id)routingPathDataFromStart:(PolylineCoordinate)a3;
- (id)sectionOptionForTripIndex:(unint64_t)a3;
- (id)sectionOptionForTripSegment:(id)a3;
- (id)segmentForPointIndex:(unsigned int)a3;
- (id)segmentForStepIndex:(unint64_t)a3;
- (id)stepAtIndex:(unint64_t)a3;
- (id)stepForPointIndex:(unsigned int)a3;
- (id)ticketingSegmentsForSelectedRides;
- (id)truncatedTrafficFromRouteCoordinate:(PolylineCoordinate)a3;
- (id)waypointDisplayInfoForWaypoint:(id)a3;
- (id)waypointsFromRouteCoordinate:(PolylineCoordinate)a3;
- (id)zilchDataArrayToEndOfRouteFromStepIndex:(unint64_t)a3;
- (id)zilchDataFromStepIndex:(unint64_t)a3;
- (int)_routeCreationMethod;
- (int)elevationModel;
- (int)estimatedCellularCoverageForOffset:(double)a3;
- (int)formOfWayAt:(unsigned int)a3;
- (int)routeType;
- (int)transportType;
- (int)transportTypeForStep:(id)a3;
- (unint64_t)_tripIndexForTripSegment:(id)a3;
- (unint64_t)currentDisplayStep;
- (unint64_t)indexInResponse;
- (unint64_t)indexOfSuggestedRoute;
- (unint64_t)lastStepIndexOfLegAtStepIndex:(unint64_t)a3;
- (unint64_t)legIndexForRouteCoordinate:(id)a3;
- (unint64_t)legIndexForStepIndex:(unint64_t)a3;
- (unint64_t)mapItemMuid;
- (unint64_t)numberOfTransitStops;
- (unint64_t)segmentIndexForPointIndex:(unint64_t)a3;
- (unint64_t)segmentIndexForRouteCoordinate:(id)a3;
- (unint64_t)segmentIndexForStepIndex:(unint64_t)a3;
- (unint64_t)selectedSegmentIndex;
- (unint64_t)serverIdentifier;
- (unint64_t)source;
- (unint64_t)stepIndexForPointIndex:(unint64_t)a3;
- (unint64_t)stepIndexForRouteCoordinate:(id)a3;
- (unint64_t)stepsCount;
- (unint64_t)tourMuid;
- (unsigned)expectedTime;
- (unsigned)firstVisiblePoint;
- (unsigned)historicTravelTime;
- (unsigned)laneCountAtRouteCoordinate:(PolylineCoordinate)a3;
- (unsigned)pointCount;
- (void)_addPaths:(id)a3 forObserver:(id)a4;
- (void)_addSnappedPolylinePathsForSection:(id)a3 toPaths:(id)a4 rects:(id *)a5 rectsCount:(unint64_t)a6;
- (void)_enumerateAllStepsWithBlock:(id)a3;
- (void)_ingestRouteBuilderOutput:(id)a3;
- (void)_initAdvisoriesForRoute:(id)a3 initializerData:(id)a4;
- (void)_initOtherRouteFeatures:(id)a3 initializerData:(id)a4;
- (void)_initStringsForTransitRouteDisplayStrings:(id)a3;
- (void)_initializeManeuverDisplaySteps;
- (void)_iterateTravelTimeRangesForRouteCoordinate:(PolylineCoordinate)a3 etaRoute:(id)a4 fromOrigin:(BOOL)a5 handler:(id)a6;
- (void)_iterateTravelTimeRangesForStep:(id)a3 handler:(id)a4;
- (void)_populateArtworkForSuggestedRoute:(id)a3 decoderData:(id)a4;
- (void)_rebuildRouteForRideChange;
- (void)_snapPaths:(id)a3 completionHandler:(id)a4;
- (void)_updateRevisionIdentifier;
- (void)applyCompanionUpdates:(id)a3;
- (void)applyUpdatesToTransitRoute:(id)a3;
- (void)clearSnappedPathsForObserver:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateCellularCoverageRangesWithBlock:(id)a3;
- (void)forEachSnappedPath:(id)a3;
- (void)getFormOfWay:(int *)a3 roadClass:(int *)a4 at:(unsigned int)a5;
- (void)iterateTravelTimeRangesFromRouteCoordinate:(PolylineCoordinate)a3 etaRoute:(id)a4 handler:(id)a5;
- (void)iterateTravelTimeRangesToRouteCoordinate:(PolylineCoordinate)a3 etaRoute:(id)a4 handler:(id)a5;
- (void)nextWaypointOrAnchorPointFromRouteCoordinate:(PolylineCoordinate)a3 outWaypoint:(id *)a4 outAnchorPoint:(id *)a5;
- (void)registerObserver:(id)a3;
- (void)roadFeaturesForRouteCoordinate:(PolylineCoordinate)a3 distanceAhead:(double)a4 handler:(id)a5;
- (void)roadFeaturesForRouteCoordinate:(void *)a1 distanceAhead:handler:;
- (void)setAddress:(id)a3;
- (void)setAnchorPoints:(id)a3;
- (void)setBoundingMapRegion:(id)a3;
- (void)setComposedGuidanceEvents:(id)a3;
- (void)setCoordinates:(id)a3;
- (void)setCurrentDisplayStep:(unint64_t)a3;
- (void)setDisclaimerText:(id)a3;
- (void)setDisclaimerURL:(id)a3;
- (void)setDistance:(double)a3;
- (void)setElevationModel:(int)a3;
- (void)setElevationProfile:(id)a3;
- (void)setExpectedTime:(unsigned int)a3;
- (void)setFirstVisiblePoint:(unsigned int)a3;
- (void)setHikeTypeString:(id)a3;
- (void)setIsNavigable:(BOOL)a3;
- (void)setIsWalkingOnlyTransitRoute:(BOOL)a3;
- (void)setLegs:(id)a3;
- (void)setManeuverDisplayEnabled:(BOOL)a3;
- (void)setManeuverDisplaySteps:(id)a3;
- (void)setMapItemMuid:(unint64_t)a3;
- (void)setMutableData:(id)a3;
- (void)setName:(id)a3;
- (void)setRevisionIdentifier:(id)a3;
- (void)setSections:(id)a3;
- (void)setSegments:(id)a3;
- (void)setSelectedSegmentIndex:(unint64_t)a3;
- (void)setServerRouteID:(id)a3;
- (void)setSource:(unint64_t)a3;
- (void)setSteps:(id)a3;
- (void)setStorageID:(id)a3;
- (void)setSuggestedRoute:(id)a3;
- (void)setTotalAscent:(double)a3;
- (void)setTotalDescent:(double)a3;
- (void)setTourIdentifier:(id)a3;
- (void)setTourMuid:(unint64_t)a3;
- (void)setTransitPaymentMethods:(id)a3;
- (void)setTransitUpdateInitialDelay:(double)a3;
- (void)setTransportType:(int)a3;
- (void)setUniqueRouteID:(id)a3;
- (void)setUserProvidedName:(id)a3;
- (void)setUserProvidedNotes:(id)a3;
- (void)setVisualInfos:(id)a3;
- (void)setVisualInfosForRouteNameLabels:(id)a3;
- (void)tripSegment:(id)a3 didSelectRide:(unint64_t)a4;
- (void)unregisterObserver:(id)a3;
- (void)updateRouteWithRideSelections:(id)a3;
- (void)updateTransitRouteUpdateRequest:(id)a3;
- (void)updateWithPersistentData:(id)a3;
@end

@implementation GEOComposedRoute

- (GEOComposedRoute)init
{
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedRoute;
  v2 = [(GEOComposedRoute *)&v12 init];
  if (v2)
  {
    uint64_t v3 = geo_reentrant_isolater_create();
    snappedRoutesIsolater = v2->_snappedRoutesIsolater;
    v2->_snappedRoutesIsolater = (geo_reentrant_isolater *)v3;

    uint64_t v5 = geo_isolater_create();
    mutableDataLock = v2->_mutableDataLock;
    v2->_mutableDataLock = (geo_isolater *)v5;

    uint64_t v7 = geo_isolater_create();
    encodeIsolater = v2->_encodeIsolater;
    v2->_encodeIsolater = (geo_isolater *)v7;

    uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
    uniqueRouteID = v2->_uniqueRouteID;
    v2->_uniqueRouteID = (NSUUID *)v9;

    v2->_indexInResponse = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v2;
}

- (GEOComposedRoute)initWithGeoWaypointRoute:(id)a3 initializerData:(id)a4
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 waypoints];
  unint64_t v10 = [v9 count];

  if (v10 <= 1)
  {
    v11 = GEOGetGEOComposedRouteLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_super v12 = [v8 waypoints];
      *(_DWORD *)buf = 67109120;
      int v113 = [v12 count];
      _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "Attempting to initialize GEOComposedRoute with insufficient waypoints. This is no longer allowed. Waypoint count: %d", buf, 8u);
    }
    v13 = 0;
    goto LABEL_28;
  }
  self = [(GEOComposedRoute *)self init];
  if (self)
  {
    v11 = [v8 directionsResponse];
    v111 = [v8 etaTrafficUpdateResponse];
    v14 = [v7 routePlanningInfo];
    objc_storeStrong((id *)&self->_geoWaypointRoute, a3);
    objc_storeStrong((id *)&self->_routeInitializerData, a4);
    v15 = [v8 routeAttributes];
    routeAttributes = self->_routeAttributes;
    self->_routeAttributes = v15;

    self->_serverIdentifier = [v7 identifier];
    v17 = [v11 directionsResponseID];
    directionsResponseID = self->_directionsResponseID;
    self->_directionsResponseID = v17;

    v19 = [v111 responseId];
    etauResponseID = self->_etauResponseID;
    self->_etauResponseID = v19;

    v21 = [MEMORY[0x1E4F29128] UUID];
    uniqueRouteID = self->_uniqueRouteID;
    self->_uniqueRouteID = v21;

    objc_storeStrong((id *)&self->_revisionIdentifier, self->_uniqueRouteID);
    self->_source = 1;
    self->_offlineRoute = [v11 isOfflineResponse];
    if (v11)
    {
      v23 = [v11 waypointRoutes];
      self->_indexInResponse = [v23 indexOfObject:v7];

      v24 = [v11 responseAttributes];
      int v25 = [v24 elevationModel];
    }
    else
    {
      if (!v111) {
        goto LABEL_12;
      }
      v26 = [v111 waypointRoute];
      v27 = (void *)[v26 newWaypointRoutes];
      self->_indexInResponse = [v27 indexOfObject:v7];

      v24 = [v111 responseAttributes];
      int v25 = [v24 elevationModel];
    }
    self->_elevationModel = v25;

LABEL_12:
    v28 = [v7 names];
    v29 = [v28 firstObject];
    v30 = [v29 name];
    v31 = (NSString *)[v30 copy];
    name = self->_name;
    self->_name = v31;

    v33 = [v14 trafficDescriptionText];
    v34 = [v33 formatStrings];
    v35 = [v34 firstObject];
    trafficDescription = self->_trafficDescription;
    self->_trafficDescription = v35;

    v37 = [v14 trafficDescriptionArtwork];
    trafficDescriptionArtwork = self->_trafficDescriptionArtwork;
    self->_trafficDescriptionArtwork = v37;

    v39 = [GEOComposedString alloc];
    v40 = [v14 labelDetailText];
    v41 = [(GEOComposedString *)v39 initWithGeoFormattedString:v40];
    routeLabelDescriptionString = self->_routeLabelDescriptionString;
    self->_routeLabelDescriptionString = v41;

    v43 = [v14 labelAction];
    routeLabelAction = self->_routeLabelAction;
    self->_routeLabelAction = v43;

    v45 = [v14 labelDetailText];
    routeLabelDescription = self->_routeLabelDescription;
    self->_routeLabelDescription = v45;

    v47 = [v14 labelArtwork];
    routeLabelArtwork = self->_routeLabelArtwork;
    self->_routeLabelArtwork = v47;

    v49 = [GEOComposedString alloc];
    v50 = [v14 infrastructureDescription];
    v51 = [(GEOComposedString *)v49 initWithGeoFormattedString:v50];
    infrastructureDescriptionString = self->_infrastructureDescriptionString;
    self->_infrastructureDescriptionString = v51;

    v53 = [v14 infrastructureDescription];
    infrastructureDescription = self->_infrastructureDescription;
    self->_infrastructureDescription = v53;

    v55 = [GEOComposedString alloc];
    v56 = [v14 routePlanningDescription];
    v57 = -[GEORouteInformation duration](v56);
    v58 = [(GEOComposedString *)v55 initWithGeoFormattedString:v57];
    previewDurationString = self->_previewDurationString;
    self->_previewDurationString = v58;

    v60 = [GEOComposedString alloc];
    v61 = [v14 routePlanningDescription];
    v62 = -[GEORouteInformation routeDescription](v61);
    v63 = [(GEOComposedString *)v60 initWithGeoFormattedString:v62];
    planningDescriptionString = self->_planningDescriptionString;
    self->_planningDescriptionString = v63;

    v65 = [GEOComposedString alloc];
    v66 = [v14 routePlanningDescription];
    v67 = -[GEORouteInformation distance](v66);
    v68 = [(GEOComposedString *)v65 initWithGeoFormattedString:v67];
    planningDistanceString = self->_planningDistanceString;
    self->_planningDistanceString = v68;

    v70 = [v14 routePlanningDescription];
    -[GEORouteInformation duration](v70);
    v71 = (GEOServerFormattedString *)objc_claimAutoreleasedReturnValue();
    previewDurationFormatString = self->_previewDurationFormatString;
    self->_previewDurationFormatString = v71;

    v73 = [v14 routePlanningDescription];
    -[GEORouteInformation routeDescription](v73);
    v74 = (GEOServerFormattedString *)objc_claimAutoreleasedReturnValue();
    planningDescriptionFormatString = self->_planningDescriptionFormatString;
    self->_planningDescriptionFormatString = v74;

    v76 = [v14 routePlanningDescription];
    -[GEORouteInformation distance](v76);
    v77 = (GEOServerFormattedString *)objc_claimAutoreleasedReturnValue();
    planningDistanceFormatString = self->_planningDistanceFormatString;
    self->_planningDistanceFormatString = v77;

    v79 = [v14 routePlanningDescription];
    -[GEORouteInformation separator](v79);
    v80 = (NSString *)objc_claimAutoreleasedReturnValue();
    planningSeparatorString = self->_planningSeparatorString;
    self->_planningSeparatorString = v80;

    self->_isNavigable = [v11 isNavigable];
    self->_transportType = [v7 transportType];
    v82 = [v7 traversalTimes];
    self->_expectedTime = [v82 estimatedSeconds];

    v83 = [v7 traversalTimes];
    self->_historicTravelTime = [v83 historicalEstimatedSeconds];

    v84 = [v7 traversalTimes];
    self->_freeflowTravelTime = (double)[v84 freeflowEstimatedSeconds];

    v85 = [v7 traversalTimes];
    self->_travelTimeAggressiveEstimate = (double)[v85 aggressiveEstimatedSeconds];

    v86 = [v7 traversalTimes];
    self->_travelTimeConservativeEstimate = (double)[v86 conservativeEstimatedSeconds];

    v87 = [v7 feature];
    self->_avoidsTolls = [v87 avoidsTolls];

    v88 = [v7 feature];
    self->_avoidsHighways = [v88 avoidsHighways];

    v89 = [v7 feature];
    self->_avoidsTraffic = [v89 avoidsTraffic];

    v90 = [v8 styleAttributes];
    styleAttributes = self->_styleAttributes;
    self->_styleAttributes = v90;

    v92 = [v8 address];
    address = self->_address;
    self->_address = v92;

    v94 = +[GEORouteBuilder outputForGeoWaypointRoute:v7 initializerData:v8 custodian:self];
    if (v94)
    {
      [(GEOComposedRoute *)self _ingestRouteBuilderOutput:v94];
      [(GEOComposedRoute *)self _initOtherRouteFeatures:v7 initializerData:v8];
      v95 = +[GEOEnrouteNoticesUtil createEnrouteNoticesForComposedRoute:self routeInitializerData:v8];
      enrouteNotices = self->_enrouteNotices;
      self->_enrouteNotices = v95;

      [(GEOComposedRoute *)self _initializeManeuverDisplaySteps];
      v97 = objc_alloc_init(GEOComposedRouteMutableData);
      mutableData = self->_mutableData;
      self->_mutableData = v97;

      [(GEOComposedRouteMutableData *)self->_mutableData initializeForRoute:self];
      v99 = [(NSArray *)self->_legs firstObject];
      v100 = [v99 origin];
      if (v100)
      {
        v101 = [(NSArray *)self->_legs lastObject];
        v102 = [v101 destination];

        if (v102)
        {
          for (unint64_t i = 0; i < [v7 initialPromptTypesCount]; ++i)
            self->_initialPromptTypes |= 1 << *(_DWORD *)([v7 initialPromptTypes] + 4 * i);
          v13 = self;
          goto LABEL_27;
        }
      }
      else
      {
      }
      v105 = GEOGetGEOComposedRouteLog();
      if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
      {
        v110 = [(NSArray *)self->_legs firstObject];
        v109 = [v110 origin];
        v106 = [(NSArray *)self->_legs lastObject];
        v107 = [v106 destination];
        *(_DWORD *)buf = 67109376;
        int v113 = v109 != 0;
        __int16 v114 = 1024;
        BOOL v115 = v107 != 0;
        _os_log_impl(&dword_188D96000, v105, OS_LOG_TYPE_ERROR, "GEOComposedRoute was built without a proper origin and destination. This is an error with the route builder. Origin: %d, Destination: %d", buf, 0xEu);
      }
    }
    else
    {
      v104 = GEOGetGEOComposedRouteLog();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v104, OS_LOG_TYPE_ERROR, "Error getting builder output for GEOComposedRoute. This could be either due to a bad server response or error with the route builder", buf, 2u);
      }
    }
    v13 = 0;
LABEL_27:

LABEL_28:
    goto LABEL_29;
  }
  v13 = 0;
LABEL_29:

  return v13;
}

- (GEOComposedRoute)initWithTransitGeometry:(id)a3 andLine:(id)a4 andStops:(id)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v46 = a4;
  id v47 = a5;
  id v8 = [(GEOComposedRoute *)self init];
  v48 = v8;
  if (v8)
  {
    id obj = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [obj UUIDString];
    uint64_t v10 = [v9 dataUsingEncoding:4];
    serverRouteID = v8->_serverRouteID;
    v8->_serverRouteID = (NSData *)v10;

    objc_storeStrong((id *)&v8->_uniqueRouteID, obj);
    objc_storeStrong((id *)&v8->_revisionIdentifier, obj);
    v8->_source = 5;
    v50 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v47, "count"));
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v49 = v47;
    uint64_t v12 = [v49 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v12)
    {
      uint64_t v13 = 0;
      uint64_t v14 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v52 != v14) {
            objc_enumerationMutation(v49);
          }
          v16 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          v17 = objc_alloc_init(GEOPBTransitStop);
          [(GEOPBTransitStop *)v17 setStopIndex:v13 + i];
          -[GEOPBTransitStop setMuid:](v17, "setMuid:", [v16 stationIdentifier]);
          v18 = [v16 location];
          [(GEOPBTransitStop *)v17 setLatLng:v18];

          v19 = [v16 displayName];
          [(GEOPBTransitStop *)v17 setNameDisplayString:v19];

          v20 = objc_alloc_init(GEOPBTransitZoomRangeString);
          [(GEOPBTransitZoomRangeString *)v20 setMinZoom:0];
          v21 = [v16 displayName];
          [(GEOPBTransitZoomRangeString *)v20 setLabelText:v21];

          v59 = v20;
          v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
          v23 = (void *)[v22 mutableCopy];
          [(GEOPBTransitStop *)v17 setZoomNames:v23];

          v24 = [v16 styleAttributes];
          [(GEOPBTransitStop *)v17 setStyleAttributes:v24];

          [v50 addObject:v17];
        }
        uint64_t v12 = [v49 countByEnumeratingWithState:&v51 objects:v60 count:16];
        uint64_t v13 = (v13 + i);
      }
      while (v12);
    }

    uint64_t v25 = [v50 copy];
    stops = v48->_stops;
    v48->_stops = (NSArray *)v25;

    v27 = +[GEOTransitRouteBuilder outputForGeometry:v45 andLine:v46 andStops:v49 andCustodian:v48];
    [(GEOComposedRoute *)v48 _ingestRouteBuilderOutput:v27];
    v28 = objc_alloc_init(GEORouteAttributes);
    routeAttributes = v48->_routeAttributes;
    v48->_routeAttributes = v28;

    [(GEORouteAttributes *)v48->_routeAttributes setMainTransportType:1];
    v48->_transportType = 1;
    v48->_selectedSegmentIndex = 0x7FFFFFFFFFFFFFFFLL;
    [(GEOComposedRoute *)v48 _initializeManeuverDisplaySteps];
    v30 = objc_alloc_init(GEOComposedRouteMutableData);
    mutableData = v48->_mutableData;
    v48->_mutableData = v30;

    [(GEOComposedRouteMutableData *)v48->_mutableData initializeForRoute:"initializeForRoute:"];
    v32 = [(NSArray *)v48->_legs firstObject];
    v33 = [v32 origin];
    if (v33)
    {
      v34 = [(NSArray *)v48->_legs lastObject];
      v35 = [v34 destination];
      BOOL v36 = v35 == 0;

      if (!v36)
      {
        v37 = v48;
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
    }
    v38 = GEOGetGEOComposedRouteLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = [(NSArray *)v48->_legs firstObject];
      v40 = [v39 origin];
      v41 = [(NSArray *)v48->_legs lastObject];
      v42 = [v41 destination];
      *(_DWORD *)buf = 67109376;
      BOOL v56 = v40 != 0;
      __int16 v57 = 1024;
      BOOL v58 = v42 != 0;
      _os_log_impl(&dword_188D96000, v38, OS_LOG_TYPE_ERROR, "GEOComposedRoute was built without a proper origin and destination. This is an error with the route builder. Origin: %d, Destination: %d", buf, 0xEu);
    }
    v37 = 0;
    goto LABEL_17;
  }
  v37 = 0;
LABEL_18:

  return v37;
}

- (GEOComposedRoute)initWithSuggestedRoute:(id)a3 initializerData:(id)a4
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  id v113 = a3;
  id v114 = a4;
  id v7 = [v114 waypoints];
  unint64_t v8 = [v7 count];

  if (v8 <= 1)
  {
    uint64_t v9 = GEOGetGEOComposedRouteLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [v114 waypoints];
      *(_DWORD *)buf = 67109120;
      int v124 = [v10 count];
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "Attempting to initialize GEOComposedRoute with insufficient waypoints. This is no longer allowed. Waypoint count: %d", buf, 8u);
    }
    v11 = 0;
    goto LABEL_60;
  }
  uint64_t v12 = [(GEOComposedRoute *)self init];
  if (v12)
  {
    if (!v113 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "GEOComposedRoute initWithSuggestedRoute:initializerData: suggestedRoute is nil", buf, 2u);
    }
    if (v114)
    {
      uint64_t v13 = [v114 directionsResponse];
      BOOL v14 = v13 == 0;

      if (v14)
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
          goto LABEL_19;
        }
        *(_WORD *)buf = 0;
        v18 = MEMORY[0x1E4F14500];
        v19 = "GEOComposedRoute initWithSuggestedRoute:initializerData: directionsResponse is nil";
      }
      else
      {
        v15 = [v114 directionsResponse];
        v16 = [v15 decoderData];
        BOOL v17 = v16 == 0;

        if (!v17 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
          goto LABEL_19;
        }
        *(_WORD *)buf = 0;
        v18 = MEMORY[0x1E4F14500];
        v19 = "GEOComposedRoute initWithSuggestedRoute:initializerData: decoderData is nil";
      }
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
        goto LABEL_19;
      }
      *(_WORD *)buf = 0;
      v18 = MEMORY[0x1E4F14500];
      v19 = "GEOComposedRoute initWithSuggestedRoute:initializerData: initializerData is nil";
    }
    _os_log_fault_impl(&dword_188D96000, v18, OS_LOG_TYPE_FAULT, v19, buf, 2u);
LABEL_19:
    id obj = [MEMORY[0x1E4F29128] UUID];
    v20 = [obj UUIDString];
    uint64_t v21 = [v20 dataUsingEncoding:4];
    serverRouteID = v12->_serverRouteID;
    v12->_serverRouteID = (NSData *)v21;

    objc_storeStrong((id *)&v12->_uniqueRouteID, obj);
    objc_storeStrong((id *)&v12->_revisionIdentifier, obj);
    v12->_source = 1;
    objc_storeStrong((id *)&v12->_routeInitializerData, a4);
    v23 = [v114 directionsResponse];
    v12->_isNavigable = [v23 isNavigable];

    v24 = [v114 directionsResponse];
    uint64_t v25 = [v24 styleAttributes];
    styleAttributes = v12->_styleAttributes;
    v12->_styleAttributes = (GEOStyleAttributes *)v25;

    uint64_t v27 = [v114 routeAttributes];
    routeAttributes = v12->_routeAttributes;
    v12->_routeAttributes = (GEORouteAttributes *)v27;

    uint64_t v29 = [v114 address];
    address = v12->_address;
    v12->_address = (GEOAddressObject *)v29;

    objc_storeStrong((id *)&v12->_originalSuggestedRoute, a3);
    v31 = [v114 directionsResponse];
    uint64_t v32 = [v31 decoderData];
    decoderData = v12->_decoderData;
    v12->_decoderData = (GEOTransitDecoderData *)v32;

    p_suggestedRoute = (id *)&v12->_suggestedRoute;
    objc_storeStrong((id *)&v12->_suggestedRoute, a3);
    if (v113)
    {
      v34 = [v114 directionsResponse];
      v35 = [v34 suggestedRoutes];
      v12->_indexInResponse = [v35 indexOfObject:v113];
    }
    else
    {
      v12->_indexInResponse = 0;
    }
    BOOL v36 = [(GEOTransitDecoderData *)v12->_decoderData stations];
    uint64_t v37 = [v36 copy];
    stations = v12->_stations;
    v12->_stations = (NSArray *)v37;

    v39 = [(GEOTransitDecoderData *)v12->_decoderData stops];
    uint64_t v40 = [v39 copy];
    stops = v12->_stops;
    v12->_stops = (NSArray *)v40;

    v42 = [(GEOTransitDecoderData *)v12->_decoderData halls];
    uint64_t v43 = [v42 copy];
    halls = v12->_halls;
    v12->_halls = (NSArray *)v43;

    id v45 = [v114 directionsResponse];
    uint64_t v46 = [v45 directionsResponseID];
    directionsResponseID = v12->_directionsResponseID;
    v12->_directionsResponseID = (NSData *)v46;

    v48 = [v114 directionsResponse];
    id v49 = [v48 decoderData];
    v50 = [v114 waypoints];
    v112 = +[GEOTransitRouteBuilder outputForSuggestedRoute:v113 withDecoderData:v49 andWaypoints:v50 andArrivalParameters:0 andCustodian:v12];

    [(GEOComposedRoute *)v12 _ingestRouteBuilderOutput:v112];
    v12->_isWalkingOnlyTransitRoute = [v112 isWalkingOnlyRoute];
    long long v51 = [v112 rideSelections];
    uint64_t v52 = [v51 copy];
    initialRideSelections = v12->_initialRideSelections;
    v12->_initialRideSelections = (NSArray *)v52;

    long long v54 = [v112 sectionOptions];
    uint64_t v55 = [v54 copy];
    currentSectionOptions = v12->_currentSectionOptions;
    v12->_currentSectionOptions = (NSArray *)v55;

    if (v12->_isWalkingOnlyTransitRoute) {
      int v57 = 2;
    }
    else {
      int v57 = 1;
    }
    v12->_transportType = v57;
    BOOL v58 = [v114 directionsResponse];
    uint64_t v59 = [v58 displayHints];
    displayHints = v12->_displayHints;
    v12->_displayHints = (GEORouteDisplayHints *)v59;

    if ([v113 hasTransitIncidentMessage])
    {
      uint64_t v61 = [_GEOTransitRoutingIncidentMessage alloc];
      v62 = [v113 transitIncidentMessage];
      uint64_t v63 = [(_GEOTransitRoutingIncidentMessage *)v61 initWithIncidentMessage:v62 decoderData:v12->_decoderData];
      transitRoutingIncidentMessage = v12->_transitRoutingIncidentMessage;
      v12->_transitRoutingIncidentMessage = (GEOTransitRoutingIncidentMessage *)v63;
    }
    v65 = [v113 advisoriesInfo];
    v66 = [v65 genericAdvisorys];
    BOOL v67 = v66 == 0;

    if (!v67)
    {
      v68 = objc_opt_new();
      long long v121 = 0u;
      long long v122 = 0u;
      long long v119 = 0u;
      long long v120 = 0u;
      v69 = [v113 advisoriesInfo];
      v70 = [v69 genericAdvisorys];

      uint64_t v71 = [v70 countByEnumeratingWithState:&v119 objects:v128 count:16];
      if (v71)
      {
        uint64_t v72 = *(void *)v120;
        do
        {
          for (uint64_t i = 0; i != v71; ++i)
          {
            if (*(void *)v120 != v72) {
              objc_enumerationMutation(v70);
            }
            uint64_t v74 = *(void *)(*((void *)&v119 + 1) + 8 * i);
            v75 = [GEOComposedRouteAdvisory alloc];
            v76 = [(GEOTransitDecoderData *)v12->_decoderData transitIncidents];
            v77 = [(GEOComposedRouteAdvisory *)v75 initWithGeoAdvisoryNotice:v74 transitIncidents:v76];
            [v68 addObject:v77];
          }
          uint64_t v71 = [v70 countByEnumeratingWithState:&v119 objects:v128 count:16];
        }
        while (v71);
      }

      uint64_t v78 = [v68 copy];
      advisories = v12->_advisories;
      v12->_advisories = (NSArray *)v78;
    }
    v80 = [v113 displayStrings];
    [(GEOComposedRoute *)v12 _initStringsForTransitRouteDisplayStrings:v80];

    if (v12->_isWalkingOnlyTransitRoute)
    {
      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      v81 = [v113 steps];
      uint64_t v82 = [v81 countByEnumeratingWithState:&v115 objects:v127 count:16];
      if (v82)
      {
        uint64_t v83 = *(void *)v116;
        while (2)
        {
          for (uint64_t j = 0; j != v82; ++j)
          {
            if (*(void *)v116 != v83) {
              objc_enumerationMutation(v81);
            }
            v85 = *(void **)(*((void *)&v115 + 1) + 8 * j);
            if ([v85 maneuverType] == 2
              && [v85 hasWalkingIndex])
            {
              unsigned int v86 = [v85 walkingIndex];
              v87 = [(GEOTransitDecoderData *)v12->_decoderData walkings];
              BOOL v88 = [v87 count] > (unint64_t)v86;

              if (v88)
              {
                v89 = [(GEOTransitDecoderData *)v12->_decoderData walkings];
                v90 = [v89 objectAtIndexedSubscript:v86];
                v91 = [v90 name];
                uint64_t v92 = [v91 copy];
                name = v12->_name;
                v12->_name = (NSString *)v92;
              }
              goto LABEL_49;
            }
          }
          uint64_t v82 = [v81 countByEnumeratingWithState:&v115 objects:v127 count:16];
          if (v82) {
            continue;
          }
          break;
        }
      }
LABEL_49:
    }
    if ([*p_suggestedRoute hasAbsStartTime])
    {
      uint64_t v94 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(*p_suggestedRoute, "absStartTime"));
      startDate = v12->_startDate;
      v12->_startDate = (NSDate *)v94;
    }
    int v96 = [*p_suggestedRoute absEndTime];
    v12->_expectedTime = v96 - [*p_suggestedRoute absStartTime];
    [(GEOComposedRoute *)v12 _populateArtworkForSuggestedRoute:v113 decoderData:v12->_decoderData];
    v12->_selectedSegmentIndex = 0x7FFFFFFFFFFFFFFFLL;
    [(GEOComposedRoute *)v12 _initializeManeuverDisplaySteps];
    v97 = objc_alloc_init(GEOComposedRouteMutableData);
    mutableData = v12->_mutableData;
    v12->_mutableData = v97;

    [(GEOComposedRouteMutableData *)v12->_mutableData initializeForRoute:v12];
    v99 = [(NSArray *)v12->_legs firstObject];
    v100 = [v99 origin];
    if (v100)
    {
      v101 = [(NSArray *)v12->_legs lastObject];
      v102 = [v101 destination];
      BOOL v103 = v102 == 0;

      if (!v103)
      {
        v11 = v12;
LABEL_59:

        self = v12;
        uint64_t v9 = obj;
LABEL_60:

        goto LABEL_61;
      }
    }
    else
    {
    }
    v104 = GEOGetGEOComposedRouteLog();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
    {
      v105 = [(NSArray *)v12->_legs firstObject];
      v106 = [v105 origin];
      v107 = [(NSArray *)v12->_legs lastObject];
      v108 = [v107 destination];
      *(_DWORD *)buf = 67109376;
      int v124 = v106 != 0;
      __int16 v125 = 1024;
      BOOL v126 = v108 != 0;
      _os_log_impl(&dword_188D96000, v104, OS_LOG_TYPE_ERROR, "GEOComposedRoute was built without a proper origin and destination. This is an error with the route builder. Origin: %d, Destination: %d", buf, 0xEu);
    }
    v11 = 0;
    goto LABEL_59;
  }
  v11 = 0;
LABEL_61:

  return v11;
}

- (GEOComposedRoute)initWithSuggestedRoute:(id)a3 initializerData:(id)a4 updateRequest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(GEOComposedRoute *)self initWithSuggestedRoute:v8 initializerData:v9];
  [(GEOComposedRoute *)v11 updateTransitRouteUpdateRequest:v10];

  return v11;
}

- (GEOComposedRoute)initWithSuggestedRoute:(id)a3 initializerData:(id)a4 uniqueRouteID:(id)a5
{
  id v9 = a5;
  id v10 = [(GEOComposedRoute *)self initWithSuggestedRoute:a3 initializerData:a4];
  v11 = v10;
  if (v9)
  {
    objc_storeStrong((id *)&v10->_uniqueRouteID, a5);
    objc_storeStrong((id *)&v11->_revisionIdentifier, a5);
  }

  return v11;
}

- (void)_initOtherRouteFeatures:(id)a3 initializerData:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v21 = a4;
  v22 = v6;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [v6 routeLegs];
  uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v8)
  {
    unsigned int v26 = 0;
    uint64_t v24 = *(void *)v32;
    do
    {
      uint64_t v9 = 0;
      uint64_t v25 = v8;
      do
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        v11 = [v10 updateLocations];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v28 != v13) {
                objc_enumerationMutation(v11);
              }
              v15 = [[GEOComposedRouteETAUPosition alloc] initWithComposedRoute:self andUpdateLocation:*(void *)(*((void *)&v27 + 1) + 8 * i) offset:(double)v26];
              [v7 addObject:v15];
            }
            uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v12);
        }

        v26 += [v10 distance];
        ++v9;
      }
      while (v9 != v25);
      uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v8);
  }

  v16 = [v7 sortedArrayUsingSelector:sel_compare_];
  etauPositions = self->_etauPositions;
  self->_etauPositions = v16;

  if ([v22 hasRestrictionZoneInfo])
  {
    v18 = [[GEORouteRestrictionZoneInfo alloc] initWithGeoWaypointRoute:v22];
    restrictionZoneInfo = self->_restrictionZoneInfo;
    self->_restrictionZoneInfo = v18;
  }
  [(GEOComposedRoute *)self _initAdvisoriesForRoute:v22 initializerData:v21];
  v20 = [v21 anchorPoints];
  -[GEOComposedRouteAnchorPointList updateWithRoute:](v20, self);
  [(GEOComposedRoute *)self setAnchorPoints:v20];
}

- (void)_initAdvisoriesForRoute:(id)a3 initializerData:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 routePlanningInfo];
  id v6 = [v5 advisoriesInfo];
  id v7 = [v6 genericAdvisorys];

  if (v7)
  {
    uint64_t v8 = (NSArray *)objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v9 = [v4 routePlanningInfo];
    id v10 = [v9 advisoriesInfo];
    v11 = [v10 genericAdvisorys];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v22;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * v14);
          v16 = [GEOComposedRouteAdvisory alloc];
          BOOL v17 = [v4 incidentsOnRouteLegs];
          v18 = [(GEOComposedRouteAdvisory *)v16 initWithGeoAdvisoryNotice:v15 incidents:v17];
          [(NSArray *)v8 addObject:v18];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v12);
    }

    advisories = self->_advisories;
    self->_advisories = v8;
  }
}

- (void)_initStringsForTransitRouteDisplayStrings:(id)a3
{
  id v39 = a3;
  id v4 = [v39 duration];

  if (v4)
  {
    uint64_t v5 = [GEOComposedString alloc];
    id v6 = [v39 duration];
    id v7 = [(GEOComposedString *)v5 initWithGeoFormattedString:v6];
    previewDurationString = self->_previewDurationString;
    self->_previewDurationString = v7;

    uint64_t v9 = [v39 duration];
    previewDurationFormatString = self->_previewDurationFormatString;
    self->_previewDurationFormatString = v9;
  }
  v11 = [v39 durationList];

  if (v11)
  {
    uint64_t v12 = [GEOComposedString alloc];
    uint64_t v13 = [v39 durationList];
    uint64_t v14 = [(GEOComposedString *)v12 initWithGeoFormattedString:v13];
    pickingDurationString = self->_pickingDurationString;
    self->_pickingDurationString = v14;

    v16 = [v39 durationList];
    pickingDurationFormatString = self->_pickingDurationFormatString;
    self->_pickingDurationFormatString = v16;
  }
  v18 = [v39 planningDescription];

  if (v18)
  {
    v19 = [GEOComposedString alloc];
    v20 = [v39 planningDescription];
    long long v21 = [(GEOComposedString *)v19 initWithGeoFormattedString:v20];
    planningDescriptionString = self->_planningDescriptionString;
    self->_planningDescriptionString = v21;

    long long v23 = [v39 planningDescription];
    planningDescriptionFormatString = self->_planningDescriptionFormatString;
    self->_planningDescriptionFormatString = v23;
  }
  uint64_t v25 = [v39 travelDescription];

  if (v25)
  {
    uint64_t v26 = [GEOComposedString alloc];
    long long v27 = [v39 travelDescription];
    long long v28 = [(GEOComposedString *)v26 initWithGeoFormattedString:v27];
    transitDescriptionString = self->_transitDescriptionString;
    self->_transitDescriptionString = v28;

    long long v30 = [v39 travelDescription];
    transitDescriptionFormatString = self->_transitDescriptionFormatString;
    self->_transitDescriptionFormatString = v30;
  }
  long long v32 = [v39 badge];

  if (v32)
  {
    long long v33 = [GEOComposedString alloc];
    long long v34 = [v39 badge];
    v35 = [(GEOComposedString *)v33 initWithGeoFormattedString:v34];
    transitRouteBadgeString = self->_transitRouteBadgeString;
    self->_transitRouteBadgeString = v35;

    uint64_t v37 = [v39 badge];
    transitRouteBadge = self->_transitRouteBadge;
    self->_transitRouteBadge = v37;
  }
}

- (void)_ingestRouteBuilderOutput:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v38 = v4;
    uint64_t v5 = [v4 coordinatesArray];
    coordinates = self->_coordinates;
    self->_coordinates = v5;

    id v7 = [v38 legs];
    uint64_t v8 = (NSArray *)[v7 copy];
    legs = self->_legs;
    self->_legs = v8;

    id v10 = [v38 segments];
    v11 = (NSArray *)[v10 copy];
    segments = self->_segments;
    self->_segments = v11;

    uint64_t v13 = [v38 steps];
    uint64_t v14 = (NSArray *)[v13 copy];
    steps = self->_steps;
    self->_steps = v14;

    v16 = [v38 guidanceEvents];
    BOOL v17 = (NSArray *)[v16 copy];
    composedGuidanceEvents = self->_composedGuidanceEvents;
    self->_composedGuidanceEvents = v17;

    v19 = [v38 enrouteNotices];
    enrouteNotices = self->_enrouteNotices;
    self->_enrouteNotices = v19;

    self->_usesZilch = [(GEOComposedRouteCoordinateArray *)self->_coordinates usesZilch];
    self->_elevationModel = [v38 elevationModel];
    self->_source = [v38 source];
    long long v21 = [v38 pointSections];
    long long v22 = (NSArray *)[v21 copy];
    sections = self->_sections;
    self->_sections = v22;

    long long v24 = [v38 boundingMapRegion];
    uint64_t v25 = (GEOMapRegion *)[v24 copy];
    boundingMapRegion = self->_boundingMapRegion;
    self->_boundingMapRegion = v25;

    [v38 distance];
    self->_distance = v27;
    long long v28 = [v38 elevationProfile];
    elevationProfile = self->_elevationProfile;
    self->_elevationProfile = v28;

    self->_totalAscent = (float)[(GEOElevationProfile *)self->_elevationProfile sumElevationGainCm]
                       * 0.01;
    self->_totalDescent = (float)[(GEOElevationProfile *)self->_elevationProfile sumElevationLossCm]* 0.01;
    long long v30 = [v38 cellularCoverage];
    cellularCoverage = self->_cellularCoverage;
    self->_cellularCoverage = v30;

    long long v32 = [v38 visualInfos];
    visualInfos = self->_visualInfos;
    self->_visualInfos = v32;

    long long v34 = [v38 visualInfosForRouteNameLabels];
    visualInfosForRouteNameLabels = self->_visualInfosForRouteNameLabels;
    self->_visualInfosForRouteNameLabels = v34;

    BOOL v36 = [v38 cameraInfos];
    cameraInfos = self->_cameraInfos;
    self->_cameraInfos = v36;

    id v4 = v38;
  }
}

- (void)_populateArtworkForSuggestedRoute:(id)a3 decoderData:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v5 = a4;
  if (!v5)
  {
    id v6 = +[GEOPlatform sharedPlatform];
    if ([v6 isInternalInstall])
    {
      char BOOL = GEOConfigGetBOOL(GeoServicesConfig_ShouldRecoverFromMissingDecoderData, (uint64_t)off_1E9113B88);

      if (BOOL) {
        goto LABEL_53;
      }
    }
    else
    {
    }
  }
  long long v34 = [MEMORY[0x1E4F1CA48] array];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = [v30 routePlanningArtworks];
  uint64_t v32 = [obj countByEnumeratingWithState:&v53 objects:v64 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v54 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
        if ([v8 clustersCount])
        {
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v38 = [v8 clusters];
          uint64_t v37 = [v38 countByEnumeratingWithState:&v49 objects:v63 count:16];
          if (v37)
          {
            uint64_t v36 = *(void *)v50;
            do
            {
              for (uint64_t j = 0; j != v37; ++j)
              {
                if (*(void *)v50 != v36) {
                  objc_enumerationMutation(v38);
                }
                id v10 = *(void **)(*((void *)&v49 + 1) + 8 * j);
                if ([v10 artworkItemsCount])
                {
                  long long v47 = 0u;
                  long long v48 = 0u;
                  long long v45 = 0u;
                  long long v46 = 0u;
                  v11 = [v10 artworkItems];
                  uint64_t v12 = [v11 countByEnumeratingWithState:&v45 objects:v62 count:16];
                  if (v12)
                  {
                    uint64_t v13 = *(void *)v46;
                    do
                    {
                      for (uint64_t k = 0; k != v12; ++k)
                      {
                        if (*(void *)v46 != v13) {
                          objc_enumerationMutation(v11);
                        }
                        uint64_t v15 = *(void **)(*((void *)&v45 + 1) + 8 * k);
                        if ([v15 hasArtworkIndex])
                        {
                          int v44 = [v15 artworkIndex];
                          v16 = [v5 artworkFromIndices:&v44 count:1];
                          if (v16)
                          {
                            [v9 addObject:v16];
                          }
                          else
                          {
                            GEOFindOrCreateLog("com.apple.GeoServices", "GEOComposedRoute");
                            v18 = (id)objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                            {
                              unsigned int v19 = [v15 artworkIndex];
                              *(_DWORD *)buf = 134217984;
                              unint64_t v61 = v19;
                              _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_ERROR, "artworkCluster is nil for artworkIndex: %lu", buf, 0xCu);
                            }
                          }
                        }
                        else
                        {
                          uint64_t v59 = v15;
                          BOOL v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
                          [v9 addObject:v17];
                        }
                      }
                      uint64_t v12 = [v11 countByEnumeratingWithState:&v45 objects:v62 count:16];
                    }
                    while (v12);
                  }
                }
                else
                {
                  v11 = objc_msgSend(v5, "artworkFromIndices:count:", objc_msgSend(v10, "artworkIndexs"), objc_msgSend(v10, "artworkIndexsCount"));
                  if (v11)
                  {
                    [v9 addObject:v11];
                  }
                  else
                  {
                    GEOFindOrCreateLog("com.apple.GeoServices", "GEOComposedRoute");
                    v20 = (id)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                    {
                      long long v21 = objc_msgSend(v10, "_maps_artworkIndicesAsString");
                      *(_DWORD *)buf = 138412290;
                      unint64_t v61 = (unint64_t)v21;
                      _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_ERROR, "artworkCluster is nil for artworkIndices: %@", buf, 0xCu);
                    }
                    v11 = 0;
                  }
                }
              }
              uint64_t v37 = [v38 countByEnumeratingWithState:&v49 objects:v63 count:16];
            }
            while (v37);
          }
        }
        else
        {
          long long v22 = objc_msgSend(v5, "artworkFromIndices:count:", objc_msgSend(v8, "artworkIndexs"), objc_msgSend(v8, "artworkIndexsCount"));
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v38 = v22;
          uint64_t v23 = [v38 countByEnumeratingWithState:&v40 objects:v58 count:16];
          if (v23)
          {
            uint64_t v24 = *(void *)v41;
            do
            {
              for (uint64_t m = 0; m != v23; ++m)
              {
                if (*(void *)v41 != v24) {
                  objc_enumerationMutation(v38);
                }
                uint64_t v57 = *(void *)(*((void *)&v40 + 1) + 8 * m);
                uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
                [v9 addObject:v26];
              }
              uint64_t v23 = [v38 countByEnumeratingWithState:&v40 objects:v58 count:16];
            }
            while (v23);
          }
        }
        [v34 addObject:v9];
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v53 objects:v64 count:16];
    }
    while (v32);
  }

  double v27 = (NSArray *)[v34 copy];
  routePlanningArtworks = self->_routePlanningArtworks;
  self->_routePlanningArtworks = v27;

LABEL_53:
}

- (void)_enumerateAllStepsWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *, uint64_t, char *))a3;
  if (v4)
  {
    uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[GEOTransitDecoderData stepsCount](self->_decoderData, "stepsCount"));
    if ([(GEOComposedRoute *)self supportsRideClusters])
    {
      [(GEOComposedRoute *)self sectionOptionForTripIndex:0];
      v23 = char v28 = 0;
      if (v23)
      {
        uint64_t v5 = 0;
        while (1)
        {
          id v6 = [(GEOComposedRoute *)self rideSelections];
          id v7 = [v6 objectAtIndexedSubscript:v5];
          unint64_t v8 = [v7 unsignedIntegerValue];

          unsigned int v9 = v8 >= [v23 sectionsCount]
             ? [v23 defaultSectionIndex]
             : [v23 sectionAtIndex:v8];
          unsigned int v10 = v9;
          v11 = [(GEOComposedRoute *)self suggestedRoute];
          if ([v11 sectionsCount] <= (unint64_t)v10)
          {
            uint64_t v13 = 0;
          }
          else
          {
            uint64_t v12 = [(GEOComposedRoute *)self suggestedRoute];
            uint64_t v13 = [v12 sectionAtIndex:v10];
          }
          for (unint64_t i = 0; i < [v13 stepIndexsCount]; ++i)
          {
            unsigned int v15 = [v13 stepIndexAtIndex:i];
            v16 = [(GEOTransitDecoderData *)self->_decoderData steps];
            uint64_t v17 = v15;
            if ([v16 count] <= (unint64_t)v15)
            {

              unsigned int v19 = 0;
            }
            else
            {
              v18 = [(GEOTransitDecoderData *)self->_decoderData steps];
              unsigned int v19 = [v18 objectAtIndex:v17];

              if (v19)
              {
                [v24 addObject:v19];
                v4[2](v4, v19, v17, &v28);
                if (v28)
                {

                  break;
                }
              }
            }
          }
          if (v28) {
            break;
          }
          uint64_t v20 = [(GEOComposedRoute *)self sectionOptionForTripIndex:++v5];

          uint64_t v23 = (void *)v20;
          if (!v20) {
            goto LABEL_23;
          }
        }
      }
    }
LABEL_23:
    steps = self->_steps;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __48__GEOComposedRoute__enumerateAllStepsWithBlock___block_invoke;
    v25[3] = &unk_1E53DDBB0;
    id v22 = v24;
    id v26 = v22;
    double v27 = v4;
    [(NSArray *)steps enumerateObjectsUsingBlock:v25];
  }
}

void __48__GEOComposedRoute__enumerateAllStepsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 transitStep];
  if (v3 && ([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v3];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = self->_steps;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v6++) setComposedRoute:0];
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v4);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = self->_segments;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v10++) setComposedRoute:0];
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v8);
  }

  v11.receiver = self;
  v11.super_class = (Class)GEOComposedRoute;
  [(GEOComposedRoute *)&v11 dealloc];
}

- (BOOL)_MapsCarPlay_isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uniqueRouteID = self->_uniqueRouteID;
    id v7 = [v4 uniqueRouteID];
    char v8 = [(NSUUID *)uniqueRouteID isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    uint64_t v6 = [[GEOObserverHashTable alloc] initWithProtocol:&unk_1ED835ED0 queue:0];
    id v7 = self->_observers;
    self->_observers = v6;

    observers = self->_observers;
    id v4 = v8;
  }
  [(GEOObserverHashTable *)observers registerObserver:v4];
}

- (void)unregisterObserver:(id)a3
{
}

- (GEORouteInitializerData)routeInitializerData
{
  return self->_routeInitializerData;
}

- (GEORouteAttributes)routeAttributes
{
  return self->_routeAttributes;
}

- (unint64_t)indexOfSuggestedRoute
{
  return self->_indexInResponse;
}

- (BOOL)isNewProtocolRoute
{
  return self->_geoWaypointRoute != 0;
}

- (double)chargingDuration
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_legs;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    double v5 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "chargingDuration", (void)v9);
        double v5 = v5 + v7;
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)travelAndChargingDuration
{
  LODWORD(v2) = self->_expectedTime;
  double v3 = (double)v2;
  [(GEOComposedRoute *)self chargingDuration];
  return v4 + v3;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (void)setName:(id)a3
{
  id v6 = a3;
  double v4 = (NSString *)[v6 copy];
  name = self->_name;
  self->_name = v4;
}

- (void)setUserProvidedName:(id)a3
{
  id v6 = a3;
  double v4 = (NSString *)[v6 copy];
  userProvidedName = self->_userProvidedName;
  self->_userProvidedName = v4;
}

- (void)setUserProvidedNotes:(id)a3
{
  id v6 = a3;
  double v4 = (NSString *)[v6 copy];
  userProvidedNotes = self->_userProvidedNotes;
  self->_userProvidedNotes = v4;
}

- (void)setStorageID:(id)a3
{
}

- (void)setTourIdentifier:(id)a3
{
}

- (void)setTourMuid:(unint64_t)a3
{
  self->_tourMuid = a3;
}

- (void)setMapItemMuid:(unint64_t)a3
{
  self->_mapItemMuid = a3;
}

- (void)setDisclaimerText:(id)a3
{
  id v6 = a3;
  double v4 = (NSString *)[v6 copy];
  disclaimerText = self->_disclaimerText;
  self->_disclaimerText = v4;
}

- (void)setDisclaimerURL:(id)a3
{
  id v6 = a3;
  double v4 = (GEOPDURLData *)[v6 copy];
  disclaimerURL = self->_disclaimerURL;
  self->_disclaimerURL = v4;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (void)setTotalAscent:(double)a3
{
  self->_totalAscent = a3;
}

- (void)setTotalDescent:(double)a3
{
  self->_totalDescent = a3;
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

- (double)pointLength
{
  if ([(GEOComposedRouteCoordinateArray *)self->_coordinates coordinateCount] < 2) {
    return 0.0;
  }
  coordinates = self->_coordinates;
  uint64_t v5 = [(GEOComposedRouteCoordinateArray *)coordinates coordinateCount] - 1;

  [(GEOComposedRouteCoordinateArray *)coordinates distanceFromStartToIndex:v5];
  return result;
}

- (id)coordinates
{
  return self->_coordinates;
}

- (void)setIsWalkingOnlyTransitRoute:(BOOL)a3
{
  self->_isWalkingOnlyTransitRoute = a3;
}

- (BOOL)isEVRoute
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v2 = self->_steps;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "evInfo", (void)v9);
        BOOL v7 = v6 == 0;

        if (!v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)firstEVStep
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v2 = [(GEOComposedRoute *)self steps];
  id v3 = (id)[v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        BOOL v7 = [v6 evInfo];
        BOOL v8 = v7 == 0;

        if (!v8)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)lastEVStep
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v2 = [(GEOComposedRoute *)self steps];
  id v3 = [v2 reverseObjectEnumerator];

  id v4 = (id)[v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        BOOL v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        BOOL v8 = [v7 evInfo];
        BOOL v9 = v8 == 0;

        if (!v9)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)lastEVStepInLegWithIndex:(unint64_t)a3
{
  id v4 = [(NSArray *)self->_legs objectAtIndexedSubscript:a3];
  for (int64_t i = [v4 endStepIndex]; i >= objc_msgSend(v4, "startStepIndex"); --i)
  {
    if ((i & 0x8000000000000000) == 0 && i < (int64_t)[(GEOComposedRoute *)self stepsCount])
    {
      id v6 = [(GEOComposedRoute *)self steps];
      BOOL v7 = [v6 objectAtIndexedSubscript:i];

      BOOL v8 = [v7 evInfo];

      if (v8) {
        goto LABEL_9;
      }
    }
  }
  BOOL v7 = 0;
LABEL_9:

  return v7;
}

- (GEOComposedWaypoint)origin
{
  unint64_t v2 = [(NSArray *)self->_legs firstObject];
  id v3 = [v2 origin];

  return (GEOComposedWaypoint *)v3;
}

- (GEOComposedWaypoint)destination
{
  unint64_t v2 = [(NSArray *)self->_legs lastObject];
  id v3 = [v2 destination];

  return (GEOComposedWaypoint *)v3;
}

- (NSArray)waypoints
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_legs count])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = self->_legs;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v4);
          }
          BOOL v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "origin", (void)v12);
          [v3 addObject:v8];
        }
        uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }

    BOOL v9 = [(NSArray *)self->_legs lastObject];
    long long v10 = [v9 destination];
    [v3 addObject:v10];
  }
  else
  {
    id v3 = 0;
  }

  return (NSArray *)v3;
}

- (id)waypointsFromRouteCoordinate:(PolylineCoordinate)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_legs;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "endRouteCoordinate", (void)v15);
        if (a3.index >= v11 && (a3.index != v11 || a3.offset > *((float *)&v11 + 1))) {
          continue;
        }
        long long v13 = [v10 destination];
        [v5 addObject:v13];
      }
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)waypointDisplayInfoForWaypoint:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 displayInfo];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = self->_legs;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          long long v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          long long v13 = objc_msgSend(v12, "origin", (void)v17);
          int v14 = [v13 isEqual:v4];

          if (v14)
          {
            id v7 = [v12 originDisplayInfo];

            goto LABEL_13;
          }
        }
        uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    long long v15 = [(NSArray *)self->_legs lastObject];
    id v7 = [v15 destinationDisplayInfo];
  }
LABEL_13:

  return v7;
}

- (void)setHikeTypeString:(id)a3
{
}

- (void)setCoordinates:(id)a3
{
}

- (void)setAnchorPoints:(id)a3
{
  id v6 = a3;
  id v4 = (GEOComposedRouteAnchorPointList *)[v6 copy];
  anchorPoints = self->_anchorPoints;
  self->_anchorPoints = v4;

  -[GEOComposedRouteAnchorPointList updateWithRoute:]((id *)&self->_anchorPoints->super.isa, self);
}

- (void)setLegs:(id)a3
{
}

- (void)setSegments:(id)a3
{
}

- (void)setComposedGuidanceEvents:(id)a3
{
}

- (void)setSteps:(id)a3
{
}

- (void)setSections:(id)a3
{
}

- (void)setBoundingMapRegion:(id)a3
{
}

- (void)setIsNavigable:(BOOL)a3
{
  self->_isNavigable = a3;
}

- (void)setAddress:(id)a3
{
}

- (void)setElevationProfile:(id)a3
{
}

- (void)setElevationModel:(int)a3
{
  self->_elevationModel = a3;
}

- (void)setVisualInfos:(id)a3
{
  id v6 = a3;
  id v4 = (NSArray *)[v6 copy];
  visualInfos = self->_visualInfos;
  self->_visualInfos = v4;
}

- (void)setVisualInfosForRouteNameLabels:(id)a3
{
  id v6 = a3;
  id v4 = (NSArray *)[v6 copy];
  visualInfosForRouteNameLabels = self->_visualInfosForRouteNameLabels;
  self->_visualInfosForRouteNameLabels = v4;
}

- (NSArray)routeDescriptions
{
  return 0;
}

- (unint64_t)numberOfTransitStops
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v2 = [(GEOComposedRoute *)self segments];
  unint64_t v3 = 0;
  uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v3 += [*(id *)(*((void *)&v8 + 1) + 8 * v6++) numberOfTransitStops];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return v3;
}

- (NSArray)baseTransitFares
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(GEOComposedRoute *)self suggestedRoute];
  uint64_t v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "stepsCount"));

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [(GEOComposedRoute *)self suggestedRoute];
  id v7 = [v6 steps];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        long long v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v11 hasBaseFare])
        {
          long long v12 = [v11 baseFare];
          BOOL v13 = v12 == 0;

          if (!v13)
          {
            int v14 = [v11 baseFare];
            [v5 addObject:v14];
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  long long v15 = (void *)[v5 copy];

  return (NSArray *)v15;
}

- (BOOL)hasInitialPromptType:(int)a3
{
  return (self->_initialPromptTypes & (1 << a3)) != 0;
}

- (GEOComposedRouteMutableData)mutableData
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__15;
  uint64_t v8 = __Block_byref_object_dispose__15;
  id v9 = 0;
  geo_isolate_sync();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (GEOComposedRouteMutableData *)v2;
}

void __31__GEOComposedRoute_mutableData__block_invoke(uint64_t a1)
{
}

- (void)setMutableData:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync();
}

void __35__GEOComposedRoute_setMutableData___block_invoke(uint64_t a1)
{
}

- (GEOComposedGeometryRoutePersistentData)persistentData
{
  id v3 = objc_opt_new();
  if (self->_geoWaypointRoute)
  {
    id v4 = [[GEORawRouteGeometry alloc] initWithGeoWaypointRoute:self->_geoWaypointRoute];
  }
  else
  {
    id v4 = [(GEOComposedRouteCoordinateArray *)self->_coordinates rawRouteGeometry];
  }
  uint64_t v5 = v4;
  [v3 setRawRouteGeometry:v4];
  [v3 setAnchorPoints:self->_anchorPoints];
  [v3 setAddress:self->_address];
  [v3 setBoundingMapRegion:self->_boundingMapRegion];
  [v3 setDistance:self->_distance];
  LODWORD(v6) = self->_expectedTime;
  [v3 setDuration:(double)v6];
  [v3 setElevationProfile:self->_elevationProfile];
  id v7 = [(NSArray *)self->_visualInfos _geo_filtered:&__block_literal_global_39];
  [v3 setTravelDirectionArrows:v7];

  [v3 setRouteNameLabels:self->_visualInfosForRouteNameLabels];
  [v3 setRouteID:self->_uniqueRouteID];
  [v3 setRouteName:self->_name];
  [v3 setSource:self->_source];
  [v3 setStorageID:self->_storageID];
  [v3 setUserProvidedName:self->_userProvidedName];
  [v3 setUserProvidedNotes:self->_userProvidedNotes];
  [v3 setTourIdentifier:self->_tourIdentifier];
  [v3 setTourMuid:self->_tourMuid];
  [v3 setMapItemMuid:self->_mapItemMuid];
  [v3 setTransportType:self->_transportType];
  [v3 setDisclaimerText:self->_disclaimerText];
  [v3 setDisclaimerURL:self->_disclaimerURL];
  if ((self->_source & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    [v3 setRouteAttributes:self->_routeAttributes];
    uint64_t v8 = [(GEOComposedRoute *)self waypoints];
    [v3 setWaypoints:v8];
  }

  return (GEOComposedGeometryRoutePersistentData *)v3;
}

BOOL __34__GEOComposedRoute_persistentData__block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 191;
}

- (NSArray)transitPaymentMethods
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [(GEOTransitDecoderData *)self->_decoderData paymentMethods];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v9 = [GEOTransitPaymentMethod alloc];
        long long v10 = -[GEOTransitPaymentMethod initWithPaymentMethod:](v9, "initWithPaymentMethod:", v8, (void)v13);
        [v3 addObject:v10];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  long long v11 = (void *)[v3 copy];

  return (NSArray *)v11;
}

- (void)_initializeManeuverDisplaySteps
{
  id v3 = [(GEOComposedRoute *)self steps];
  maneuverDisplaySteps = self->_maneuverDisplaySteps;
  self->_maneuverDisplaySteps = v3;
}

- (void)setManeuverDisplaySteps:(id)a3
{
  uint64_t v5 = (NSArray *)a3;
  if (self->_maneuverDisplaySteps != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_maneuverDisplaySteps, a3);
    uint64_t v5 = v6;
  }
}

- (void)setCurrentDisplayStep:(unint64_t)a3
{
  BOOL v3 = a3 == 0x7FFFFFFFFFFFFFFFLL || self->_currentDisplayStep == a3;
  if (!v3 && [(NSArray *)self->_maneuverDisplaySteps count] > a3) {
    self->_currentDisplayStep = a3;
  }
}

- (unsigned)pointCount
{
  return [(GEOComposedRouteCoordinateArray *)self->_coordinates coordinateCount];
}

- (PolylineCoordinate)startRouteCoordinate
{
  return (PolylineCoordinate)0;
}

- (PolylineCoordinate)endRouteCoordinate
{
  return (PolylineCoordinate)([(GEOComposedRouteCoordinateArray *)self->_coordinates coordinateCount]- 1);
}

- (GEOPolylineCoordinateRange)routeCoordinateRange
{
  PolylineCoordinate v3 = [(GEOComposedRoute *)self startRouteCoordinate];
  PolylineCoordinate v4 = [(GEOComposedRoute *)self endRouteCoordinate];
  PolylineCoordinate v5 = v3;
  result.end = v4;
  result.start = v5;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)startLocationCoordinate
{
  [(GEOComposedRouteCoordinateArray *)self->_coordinates coordinateOnRouteAt:0];
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)endLocationCoordinate
{
  coordinates = self->_coordinates;
  uint64_t v3 = [(GEOComposedRouteCoordinateArray *)coordinates coordinateCount] - 1;

  [(GEOComposedRouteCoordinateArray *)coordinates coordinateOnRouteAt:v3];
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (BOOL)usesRoutingPathPoints
{
  return [(GEOComposedRouteCoordinateArray *)self->_coordinates usesRoutingPathPoints];
}

- ($1AB5FA073B851C12C2339EC22442E995)pointAt:(unint64_t)a3
{
  [(GEOComposedRouteCoordinateArray *)self->_coordinates coordinateOnRouteAt:a3];
  result.var2 = v5;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (PolylineCoordinate)coordinateAtOffset:(double)a3
{
  return (PolylineCoordinate)[(GEOComposedRouteCoordinateArray *)self->_coordinates routeCoordinateForDistanceAfterStart:a3];
}

- ($1AB5FA073B851C12C2339EC22442E995)pointAtRouteCoordinate:(PolylineCoordinate)a3
{
  [(GEOComposedRouteCoordinateArray *)self->_coordinates coordinateForRouteCoordinate:a3];
  result.var2 = v5;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (PolylineCoordinate)coordinateAtOffset:(double)a3 fromRoutePoint:(unint64_t)a4
{
  return (PolylineCoordinate)[(GEOComposedRouteCoordinateArray *)self->_coordinates routeCoordinateForDistance:a4 afterRouteCoordinate:a3];
}

- (PolylineCoordinate)coordinateAtOffset:(double)a3 fromRouteCoordinate:(PolylineCoordinate)a4
{
  return (PolylineCoordinate)[(GEOComposedRouteCoordinateArray *)self->_coordinates routeCoordinateForDistance:a4 afterRouteCoordinate:a3];
}

- (PolylineCoordinate)routeCoordinateAtDistance:(double)a3 beforeRouteCoordinate:(PolylineCoordinate)a4
{
  LODWORD(v4) = a4.index;
  [(GEOComposedRoute *)self pointAtRouteCoordinate:"pointAtRouteCoordinate:"];
  float v9 = 0.0;
  if ((v4 & 0x80000000) != 0)
  {
LABEL_6:
    LODWORD(v4) = 0;
  }
  else
  {
    double v10 = v7;
    double v11 = v8;
    uint64_t v4 = v4;
    while (1)
    {
      [(GEOComposedRoute *)self pointAt:v4];
      double v13 = v12;
      double v15 = v14;
      double v16 = GEOCalculateDistanceRadius(v12, v14, v10, v11, 6367000.0);
      a3 = a3 - v16;
      if (a3 <= 0.0) {
        break;
      }
      double v10 = v13;
      double v11 = v15;
      if (v4-- <= 0) {
        goto LABEL_6;
      }
    }
    double v19 = -a3 / v16;
    if (v19 < 0.0) {
      double v19 = 0.0;
    }
    if (v19 > 1.0) {
      double v19 = 1.0;
    }
    float v9 = v19;
    if (v9 >= 1.0)
    {
      LODWORD(v4) = vcvtms_u32_f32(v9) + v4;
      float v9 = v9 - (float)floorf(v9);
    }
  }
  return (PolylineCoordinate)(v4 | ((unint64_t)LODWORD(v9) << 32));
}

- (double)distanceFromPoint:(PolylineCoordinate)a3 toPoint:(PolylineCoordinate)a4
{
  unsigned int index = a3.index;
  float offset = a3.offset;
  *(float *)&double v4 = a4.offset;
  if (a4.index < a3.index || a4.index == a3.index && a4.offset < a3.offset)
  {
    float v8 = a4.offset;
    unsigned int v9 = a4.index;
  }
  else
  {
    float v8 = a3.offset;
    unsigned int v9 = a3.index;
    float offset = a4.offset;
    unsigned int index = a4.index;
  }
  uint64_t v10 = [(GEOComposedRoute *)self pointCount];
  [(GEOComposedRoute *)self pointAt:v9];
  double v12 = 0.0;
  double v13 = 1.0 / GEOMapPointsPerMeterAtLatitude(v11);
  if (v8 <= 0.0)
  {
    unint64_t v14 = v9;
  }
  else
  {
    unint64_t v14 = v9 + 1;
    if (v14 >= v10) {
      return v12;
    }
    [(GEOComposedRoute *)self pointAt:v9];
    double v17 = GEOTilePointForCoordinate(v15, v16, 20.0);
    double v19 = v18;
    [(GEOComposedRoute *)self pointAt:v9 + 1];
    double v22 = GEOTilePointForCoordinate(v20, v21, 20.0);
    double v24 = sqrt((v22 - v17) * (v22 - v17) + (v23 - v19) * (v23 - v19));
    if (v9 == index) {
      return v13 * (v24 * (float)(offset - v8));
    }
    double v12 = v13 * ((1.0 - v8) * v24);
    ++v9;
  }
  [(GEOComposedRoute *)self pointAt:v14];
  double v27 = GEOTilePointForCoordinate(v25, v26, 20.0);
  double v29 = v27;
  double v30 = v28;
  unint64_t v31 = v10 - 1;
  if (v31 >= index) {
    unint64_t v32 = index;
  }
  else {
    unint64_t v32 = v31;
  }
  if (v32 <= v14)
  {
    double v38 = v28;
    double v36 = v27;
  }
  else
  {
    unint64_t v33 = v9;
    do
    {
      [(GEOComposedRoute *)self pointAt:++v33];
      double v36 = GEOTilePointForCoordinate(v34, v35, 20.0);
      double v38 = v37;
      double v12 = v12 + sqrt((v36 - v29) * (v36 - v29) + (v37 - v30) * (v37 - v30)) * v13;
      double v30 = v37;
      double v29 = v36;
    }
    while (v32 > v33);
  }
  if (offset > 0.0 && v31 > index)
  {
    [(GEOComposedRoute *)self pointAt:index + 1];
    double v41 = GEOTilePointForCoordinate(v39, v40, 20.0);
    return v12 + sqrt((v41 - v36) * (v41 - v36) + (v42 - v38) * (v42 - v38)) * offset * v13;
  }
  return v12;
}

- (double)distanceFromPointIndex:(unint64_t)a3 toPointIndex:(unint64_t)a4
{
  double v4 = 0.0;
  if (a3 + 1 <= a4)
  {
    unint64_t v6 = a3;
    do
    {
      [(GEOComposedRoute *)self pointAt:v6];
      double v9 = v8;
      double v11 = v10;
      [(GEOComposedRoute *)self pointAt:v6 + 1];
      double v4 = v4 + GEOCalculateDistanceRadius(v9, v11, v12, v13, 6367000.0);
      unint64_t v14 = v6 + 2;
      ++v6;
    }
    while (v14 <= a4);
  }
  return v4;
}

- (double)stepDistanceFromPoint:(PolylineCoordinate)a3 toPoint:(PolylineCoordinate)a4
{
  [(GEOComposedRouteCoordinateArray *)self->_coordinates distanceBetweenRouteCoordinate:a3 andRouteCoordinate:a4];
  return result;
}

- (PolylineCoordinate)closestPointOnRoute:(id)a3
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x3812000000;
  double v8 = __Block_byref_object_copy__89;
  double v9 = __Block_byref_object_dispose__90;
  double v10 = "";
  unint64_t v11 = 0xBF80000000000000;
  geo_reentrant_isolate_sync();
  PolylineCoordinate v3 = (PolylineCoordinate)v6[6];
  _Block_object_dispose(&v5, 8);
  return v3;
}

void __40__GEOComposedRoute_closestPointOnRoute___block_invoke(uint64_t a1)
{
  uint64_t v5 = [[GEORouteMatcher alloc] initWithRoute:*(void *)(a1 + 32) auditToken:0];
  double v2 = -[GEOLocation initWithGEOCoordinate:]([GEOLocation alloc], "initWithGEOCoordinate:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  PolylineCoordinate v3 = [(GEORouteMatcher *)v5 matchToClosestPointOnRouteWithLocation:v2];
  double v4 = v3;
  if (v3) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) = [v3 routeCoordinate];
  }
}

- (unint64_t)stepsCount
{
  return [(NSArray *)self->_steps count];
}

- (id)stepAtIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_steps count] <= a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(NSArray *)self->_steps objectAtIndex:a3];
  }

  return v5;
}

- (id)stepForPointIndex:(unsigned int)a3
{
  unint64_t v4 = [(GEOComposedRoute *)self stepIndexForPointIndex:a3];

  return [(GEOComposedRoute *)self stepAtIndex:v4];
}

- (unint64_t)stepIndexForPointIndex:(unint64_t)a3
{
  unsigned int v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(GEOComposedRoute *)self pointCount] <= a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v5 = [(GEOComposedRoute *)self steps];
  uint64_t v6 = [v5 count];

  if (!v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  [(GEOComposedRoute *)self steps];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      uint64_t v11 = 0;
      uint64_t v12 = v8 + v9;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "endPointIndex", (void)v16) > v3)
        {
          unint64_t v14 = v9 + v11;
          double v13 = v7;
          goto LABEL_14;
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v9 = v12;
      if (v8) {
        continue;
      }
      break;
    }
  }

  double v13 = [(GEOComposedRoute *)self steps];
  unint64_t v14 = [v13 count] - 1;
LABEL_14:

  return v14;
}

- (unint64_t)segmentIndexForPointIndex:(unint64_t)a3
{
  unsigned int v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(GEOComposedRoute *)self pointCount] <= a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v5 = [(GEOComposedRoute *)self segments];
  uint64_t v6 = [v5 count];

  if (!v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  [(GEOComposedRoute *)self segments];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      uint64_t v11 = 0;
      uint64_t v12 = v8 + v9;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "endPointIndex", (void)v16) > v3)
        {
          unint64_t v14 = v9 + v11;
          double v13 = v7;
          goto LABEL_14;
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v9 = v12;
      if (v8) {
        continue;
      }
      break;
    }
  }

  double v13 = [(GEOComposedRoute *)self segments];
  unint64_t v14 = [v13 count] - 1;
LABEL_14:

  return v14;
}

- (int)estimatedCellularCoverageForOffset:(double)a3
{
  [(GEOComposedRoute *)self distance];
  if (v5 <= a3) {
    return 0;
  }
  cellularCoverage = self->_cellularCoverage;
  if (!cellularCoverage) {
    return 0;
  }

  return [(GEOComposedRouteCellularCoverage *)cellularCoverage cellularCoverageAtOffset:a3];
}

- (void)enumerateCellularCoverageRangesWithBlock:(id)a3
{
}

- (unint64_t)segmentIndexForStepIndex:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v4 = [(GEOComposedRoute *)self segments];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      uint64_t v9 = v5 + v6;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v10 = [*(id *)(*((void *)&v15 + 1) + 8 * v8) stepRange];
        if (a3 >= v10 && a3 - v10 < v11)
        {
          unint64_t v13 = v6 + v8;
          goto LABEL_14;
        }
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v6 = v9;
    }
    while (v5);
  }
  unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:

  return v13;
}

- (id)segmentForStepIndex:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v4 = [(GEOComposedRoute *)self segments];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unint64_t v9 = [v8 stepRange];
        if (a3 >= v9 && a3 - v9 < v10)
        {
          id v12 = v8;
          goto LABEL_14;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  id v12 = 0;
LABEL_14:

  return v12;
}

- (id)segmentForPointIndex:(unsigned int)a3
{
  unint64_t v4 = [(GEOComposedRoute *)self stepIndexForPointIndex:a3];

  return [(GEOComposedRoute *)self segmentForStepIndex:v4];
}

- (unint64_t)legIndexForStepIndex:(unint64_t)a3
{
  if (![(NSArray *)self->_legs count]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v5 = 0;
  while (1)
  {
    uint64_t v6 = [(NSArray *)self->_legs objectAtIndexedSubscript:v5];
    unint64_t v7 = [v6 stepRange];
    unint64_t v9 = v8;

    if (a3 >= v7 && a3 - v7 < v9) {
      break;
    }
    if (++v5 >= [(NSArray *)self->_legs count]) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v5;
}

- (unint64_t)lastStepIndexOfLegAtStepIndex:(unint64_t)a3
{
  unint64_t v4 = [(GEOComposedRoute *)self legIndexForStepIndex:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)unint64_t v8 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: legIndex != NSNotFound", v8, 2u);
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v5 = [(NSArray *)self->_legs objectAtIndexedSubscript:v4];
    unint64_t v6 = [v5 endStepIndex];
  }
  return v6;
}

- (void)setSelectedSegmentIndex:(unint64_t)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  unint64_t selectedSegmentIndex = self->_selectedSegmentIndex;
  if (selectedSegmentIndex == a3) {
    return;
  }
  self->_unint64_t selectedSegmentIndex = a3;
  unint64_t v6 = GEOGetGEOComposedRouteLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    unint64_t v7 = [(GEOComposedRoute *)self uniqueRouteID];
    unint64_t v8 = self->_selectedSegmentIndex;
    *(_DWORD *)buf = 138543874;
    long long v51 = v7;
    __int16 v52 = 2048;
    unint64_t v53 = selectedSegmentIndex;
    __int16 v54 = 2048;
    unint64_t v55 = v8;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_INFO, "%{public}@: Updated selected segment index %lu -> %lu", buf, 0x20u);
  }
  unint64_t v9 = [(GEOComposedRoute *)self segments];
  if ([v9 count] <= a3)
  {
    unint64_t v11 = 0;
  }
  else
  {
    unint64_t v10 = [(GEOComposedRoute *)self segments];
    unint64_t v11 = [v10 objectAtIndex:a3];
  }
  id v12 = [(GEOComposedRoute *)self segments];
  if (selectedSegmentIndex >= [v12 count])
  {
    long long v14 = 0;
  }
  else
  {
    unint64_t v13 = [(GEOComposedRoute *)self segments];
    long long v14 = [v13 objectAtIndex:selectedSegmentIndex];
  }
  if (!v11)
  {
    id v15 = 0;
    if (v14) {
      goto LABEL_12;
    }
LABEL_14:
    id v16 = 0;
    goto LABEL_15;
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v14) {
    goto LABEL_14;
  }
LABEL_12:
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
LABEL_15:
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  int v44 = self;
  long long v17 = self->_sections;
  uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v46 != v19) {
          objc_enumerationMutation(v17);
        }
        uint64_t v21 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        unsigned int v22 = [v21 startPointIndex];
        unint64_t v23 = [v11 pointRange];
        BOOL v25 = v22 < v23 || v22 - v23 >= v24;
        if (!v25
          && ((v26 = [v21 endPointIndex], unint64_t v27 = objc_msgSend(v11, "pointRange"), v26 >= v27)
            ? (BOOL v29 = v26 - v27 >= v28)
            : (BOOL v29 = 1),
              !v29)
          || ![v11 pointCount]
          && (int v30 = [v21 startPointIndex], v30 == objc_msgSend(v11, "startPointIndex"))
          && (int v31 = [v21 endPointIndex], v31 == objc_msgSend(v11, "endPointIndex")))
        {
          [v15 addObject:v21];
        }
        unsigned int v32 = [v21 startPointIndex];
        unint64_t v33 = [v14 pointRange];
        BOOL v35 = v32 < v33 || v32 - v33 >= v34;
        if (v35
          || (unsigned int v38 = [v21 endPointIndex],
              unint64_t v39 = [v14 pointRange],
              v38 < v39 || v38 - v39 >= v40))
        {
          if ([v14 pointCount]) {
            continue;
          }
          int v36 = [v21 startPointIndex];
          if (v36 != [v14 startPointIndex]) {
            continue;
          }
          int v37 = [v21 endPointIndex];
          if (v37 != [v14 endPointIndex]) {
            continue;
          }
        }
        [v16 addObject:v21];
      }
      uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v18);
  }

  double v41 = GEOGetGEOComposedRouteLog();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    double v42 = [(GEOComposedRoute *)v44 uniqueRouteID];
    uint64_t v43 = [(GEOObserverHashTable *)v44->_observers count];
    *(_DWORD *)buf = 138543618;
    long long v51 = v42;
    __int16 v52 = 2048;
    unint64_t v53 = v43;
    _os_log_impl(&dword_188D96000, v41, OS_LOG_TYPE_INFO, "%{public}@: Will notify %lu observers of updated selected segment index", buf, 0x16u);
  }
  [(GEOObserverHashTable *)v44->_observers composedRoute:v44 selectedSections:v15 deselectedSections:v16];
}

- (BOOL)hasArrivalMapRegion
{
  return 0;
}

- (GEOMapRegion)arrivalMapRegion
{
  return 0;
}

- (BOOL)hasExpectedTime
{
  return self->_expectedTime != 0;
}

- (void)setExpectedTime:(unsigned int)a3
{
  self->_expectedTime = a3;
}

- (BOOL)hasHistoricTravelTime
{
  return self->_historicTravelTime != 0;
}

- (void)getFormOfWay:(int *)a3 roadClass:(int *)a4 at:(unsigned int)a5
{
  if (a3)
  {
    if (a4)
    {
      LODWORD(i) = a5;
      *a3 = 0;
      *a4 = 9;
      if ([(GEOComposedRouteCoordinateArray *)self->_coordinates usesZilch])
      {
        for (uint64_t i = i; i != -1; --i)
        {
          if (*a3) {
            break;
          }
          coordinates = self->_coordinates;
          if (coordinates) {
            [(GEOComposedRouteCoordinateArray *)coordinates zilchControlPointAt:i];
          }
          else {
            memset(v11, 0, sizeof(v11));
          }
          if (!zilch::ControlPoint::dummy((zilch::ControlPoint *)v11))
          {
            int v10 = zilch::ControlPoint::formOfWay((zilch::ControlPoint *)v11);
            *a3 = zilch::FormOfWay::type((zilch::FormOfWay *)&v10);
            int v10 = zilch::ControlPoint::functionalClass((zilch::ControlPoint *)v11);
            *a4 = zilch::FunctionalClass::toInteger((zilch::FunctionalClass *)&v10);
          }
        }
      }
    }
  }
}

- (int)formOfWayAt:(unsigned int)a3
{
  int v5 = 0;
  int v4 = 9;
  [(GEOComposedRoute *)self getFormOfWay:&v5 roadClass:&v4 at:*(void *)&a3];
  return v5;
}

- (id)roadFeatureAtPointIndex:(unsigned int)a3
{
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__15;
  unint64_t v13 = __Block_byref_object_dispose__15;
  id v14 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__GEOComposedRoute_roadFeatureAtPointIndex___block_invoke;
  v5[3] = &unk_1E53DDC48;
  v5[4] = &v9;
  unsigned int v6 = a3;
  unsigned int v7 = a3;
  int v8 = 0;
  [(GEOComposedRoute *)self forEachSnappedPath:v5];
  id v3 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v3;
}

void __44__GEOComposedRoute_roadFeatureAtPointIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = v3;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    unsigned int v5 = *(_DWORD *)(a1 + 40);
    if (v5 >= [v3 routeStartIndex]
      && [v4 routeEndIndex] > *(_DWORD *)(a1 + 40))
    {
      uint64_t v6 = [v4 mapMatchingSection];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __44__GEOComposedRoute_roadFeatureAtPointIndex___block_invoke_2;
      v8[3] = &unk_1E53DDC20;
      uint64_t v7 = *(void *)(a1 + 44);
      v8[4] = *(void *)(a1 + 32);
      v8[5] = v7;
      (*(void (**)(uint64_t, void *))(*(void *)v6 + 40))(v6, v8);
    }
  }
}

uint64_t __44__GEOComposedRoute_roadFeatureAtPointIndex___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v10 = a6;
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void *)(v11 + 40);
  id v12 = (id *)(v11 + 40);
  if (!v13)
  {
    unsigned int v15 = *(_DWORD *)(a1 + 40);
    if (*(_DWORD *)a4 >= v15 && (*(_DWORD *)a4 != v15 || *(float *)(a4 + 4) > *(float *)(a1 + 44))
      || v15 >= *(_DWORD *)a5 && (v15 != *(_DWORD *)a5 || *(float *)(a1 + 44) >= *(float *)(a5 + 4)))
    {
      uint64_t v14 = 0;
      goto LABEL_11;
    }
    objc_storeStrong(v12, a6);
  }
  uint64_t v14 = 1;
LABEL_11:

  return v14;
}

- (int)transportTypeForStep:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(GEOComposedRoute *)self steps];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __41__GEOComposedRoute_transportTypeForStep___block_invoke;
  v12[3] = &unk_1E53DDC70;
  id v6 = v4;
  id v13 = v6;
  uint64_t v7 = [v5 indexOfObjectPassingTest:v12];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v8 = 4;
  }
  else
  {
    uint64_t v9 = [(GEOComposedRoute *)self steps];
    id v10 = [v9 objectAtIndex:v7];
    int v8 = [v10 transportType];
  }
  return v8;
}

uint64_t __41__GEOComposedRoute_transportTypeForStep___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [v6 geoStep];
  uint64_t v8 = [v7 isEqual:*(void *)(a1 + 32)];

  *a4 = v8;
  return v8;
}

- (id)zilchDataFromStepIndex:(unint64_t)a3
{
  if ([(GEOComposedRouteCoordinateArray *)self->_coordinates usesZilch])
  {
    unsigned int v5 = [(GEOComposedRoute *)self stepAtIndex:a3];
    id v6 = -[GEOComposedRouteCoordinateArray compressedZilchDataToEndOfPathFromIndex:](self->_coordinates, "compressedZilchDataToEndOfPathFromIndex:", [v5 startPointIndex]);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)zilchDataArrayToEndOfRouteFromStepIndex:(unint64_t)a3
{
  if ([(GEOComposedRouteCoordinateArray *)self->_coordinates usesZilch])
  {
    unsigned int v5 = objc_opt_new();
    id v6 = [(GEOComposedRoute *)self stepAtIndex:a3];
    uint64_t v7 = -[GEOComposedRouteCoordinateArray compressedZilchDataToEndOfPathFromIndex:](self->_coordinates, "compressedZilchDataToEndOfPathFromIndex:", [v6 startPointIndex]);
    if (v7) {
      [v5 addObject:v7];
    }
    for (unint64_t i = [(GEOComposedRoute *)self legIndexForStepIndex:a3] + 1;
          i < [(NSArray *)self->_legs count];
          ++i)
    {
      coordinates = self->_coordinates;
      id v10 = [(NSArray *)self->_legs objectAtIndexedSubscript:i];
      uint64_t v11 = -[GEOComposedRouteCoordinateArray compressedZilchDataToEndOfPathFromIndex:](coordinates, "compressedZilchDataToEndOfPathFromIndex:", [v10 startPointIndex]);
      [v5 addObject:v11];
    }
    id v12 = (void *)[v5 copy];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)routingPathDataFromStart:(PolylineCoordinate)a3
{
  if (![(GEOComposedRoute *)self usesRoutingPathPoints])
  {
    id v15 = 0;
    goto LABEL_19;
  }
  unint64_t v5 = [(GEOComposedRoute *)self legIndexForRouteCoordinate:a3];
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_legs, "count") - v5 + 1);
  for (uint64_t i = 0; v5 + i < [(NSArray *)self->_legs count]; ++i)
  {
    uint64_t v8 = -[NSArray objectAtIndexedSubscript:](self->_legs, "objectAtIndexedSubscript:");
    uint64_t v9 = v8;
    PolylineCoordinate v10 = a3;
    if (i) {
      PolylineCoordinate v10 = (PolylineCoordinate)[v8 startRouteCoordinate];
    }
    uint64_t v11 = [v9 endRouteCoordinate];
    if (v11 == v10.index)
    {
      *(float *)&double v12 = v10.offset;
      LODWORD(v13) = HIDWORD(v11);
      if (*((float *)&v11 + 1) <= v10.offset) {
        goto LABEL_13;
      }
    }
    else if (v11 < v10.index)
    {
      goto LABEL_13;
    }
    uint64_t v14 = -[GEOComposedRouteCoordinateArray routingPathDataWithSupportPointFromStart:toEnd:supportPointsOnly:startPathSegment:](self->_coordinates, "routingPathDataWithSupportPointFromStart:toEnd:supportPointsOnly:startPathSegment:", v10, v12, v13);
    if (v14) {
      [v6 addObject:v14];
    }

LABEL_13:
  }
  if ([v6 count]) {
    id v16 = v6;
  }
  else {
    id v16 = 0;
  }
  id v15 = v16;

LABEL_19:

  return v15;
}

- (int)routeType
{
  return [(GEOWaypointRoute *)self->_geoWaypointRoute type];
}

- (double)distanceBetweenRoutePointIndex:(unsigned int)a3 toPointIndex:(unsigned int)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v7 = self->_steps;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v36;
    double v10 = 0.0;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v35 + 1) + 8 * v11);
        if ([v12 endPointIndex] >= a3)
        {
          if ([v12 startPointIndex] > a4) {
            goto LABEL_25;
          }
          if ([v12 startPointIndex] < a3
            && [v12 endPointIndex] >= a3)
          {
            [(GEOComposedRoute *)self pointAt:a3];
            double v25 = v24;
            double v27 = v26;
            double v18 = 0.0;
            for (unsigned int i = a3 + 1; i <= [v12 endPointIndex]; ++i)
            {
              [(GEOComposedRoute *)self pointAt:i];
              double v30 = v29;
              double v32 = v31;
              double v18 = v18 + GEOCalculateDistanceRadius(v25, v27, v29, v31, 6367000.0);
              double v27 = v32;
              double v25 = v30;
            }
          }
          else if ([v12 startPointIndex] > a4 {
                 || [v12 endPointIndex] <= a4)
          }
          {
            [v12 distance];
            double v18 = v23;
          }
          else
          {
            -[GEOComposedRoute pointAt:](self, "pointAt:", [v12 startPointIndex]);
            double v14 = v13;
            double v16 = v15;
            unsigned int v17 = [v12 startPointIndex] + 1;
            double v18 = 0.0;
            while (v17 <= a4)
            {
              [(GEOComposedRoute *)self pointAt:v17];
              double v20 = v19;
              double v22 = v21;
              double v18 = v18 + GEOCalculateDistanceRadius(v14, v16, v19, v21, 6367000.0);
              ++v17;
              double v16 = v22;
              double v14 = v20;
            }
          }
          double v10 = v10 + v18;
        }
        ++v11;
      }
      while (v11 != v8);
      uint64_t v33 = [(NSArray *)v7 countByEnumeratingWithState:&v35 objects:v39 count:16];
      uint64_t v8 = v33;
    }
    while (v33);
  }
  else
  {
    double v10 = 0.0;
  }
LABEL_25:

  return v10;
}

- (double)distanceBetweenLocation:(id)a3 nextPointIndex:(unsigned int)a4 toPointIndex:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  double var1 = a3.var1;
  double var0 = a3.var0;
  if ([(GEOComposedRoute *)self pointCount] - 1 <= a4) {
    uint64_t v6 = [(GEOComposedRoute *)self pointCount] - 1;
  }
  [(GEOComposedRoute *)self pointAt:v6];
  double v12 = GEOCalculateDistanceRadius(var0, var1, v10, v11, 6367000.0);
  [(GEOComposedRoute *)self distanceBetweenRoutePointIndex:v6 toPointIndex:v5];
  return v12 + v13;
}

- (double)distanceBetweenStep:(id)a3 andStep:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 maneuverEndIndex];
  if (v6) {
    uint64_t v8 = [v6 maneuverEndIndex];
  }
  else {
    uint64_t v8 = [(GEOComposedRoute *)self pointCount] - 1;
  }
  [(GEOComposedRoute *)self distanceBetweenRoutePointIndex:v7 toPointIndex:v8];
  double v10 = v9;

  return v10;
}

- (double)remainingTimeAlongRouteFromStepIndex:(unint64_t)a3 currentStepRemainingDistance:(double)a4
{
  unint64_t v5 = a3;
  double v7 = 0.0;
  if ([(GEOComposedRoute *)self stepsCount] - 1 >= a3
    && [(GEOComposedRoute *)self stepsCount] > v5)
  {
    do
    {
      uint64_t v8 = [(GEOComposedRoute *)self segmentForStepIndex:v5];
      [v8 remainingTimeAlongSegmentFromStepIndex:v5 currentStepRemainingDistance:a4];
      double v10 = v9;
      unint64_t v5 = [v8 endStepIndex] + 1;
      if (v5 < [(GEOComposedRoute *)self stepsCount])
      {
        double v11 = [(GEOComposedRoute *)self stepAtIndex:v5];
        [v11 distance];
        a4 = v12;
      }
      double v7 = v7 + v10;
    }
    while (v5 < [(GEOComposedRoute *)self stepsCount]);
  }
  return v7;
}

- (double)remainingTimeToEndOfLeg:(unint64_t)a3 currentStepRemainingDistance:(double)a4
{
  unint64_t v7 = -[GEOComposedRoute lastStepIndexOfLegAtStepIndex:](self, "lastStepIndexOfLegAtStepIndex:");
  double v8 = 0.0;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v9 = v7;
    if (v7 >= a3)
    {
      while (1)
      {
        double v10 = [(GEOComposedRoute *)self segmentForStepIndex:a3];
        [v10 remainingTimeAlongSegmentFromStepIndex:a3 currentStepRemainingDistance:a4];
        double v8 = v8 + v11;
        a3 = [v10 endStepIndex] + 1;
        if (a3 > v9) {
          break;
        }
        double v12 = [(GEOComposedRoute *)self stepAtIndex:a3];
        [v12 distance];
        a4 = v13;
      }
    }
  }
  return v8;
}

- (double)remainingDistanceToEndOfLeg:(unint64_t)a3 currentStepRemainingDistance:(double)a4
{
  unint64_t v7 = -[GEOComposedRoute lastStepIndexOfLegAtStepIndex:](self, "lastStepIndexOfLegAtStepIndex:");
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v9 = v7;
    while (++a3 <= v9)
    {
      double v10 = [(NSArray *)self->_steps objectAtIndexedSubscript:a3];
      [v10 distance];
      a4 = a4 + v11;
    }
  }
  return a4;
}

- (double)remainingDistanceAlongRouteFromStepIndex:(unint64_t)a3 currentStepRemainingDistance:(double)a4
{
  unint64_t v5 = a3;
  double v7 = 0.0;
  if ([(GEOComposedRoute *)self stepsCount] - 1 >= a3
    && [(GEOComposedRoute *)self stepsCount] > v5)
  {
    do
    {
      double v8 = [(GEOComposedRoute *)self segmentForStepIndex:v5];
      [v8 remainingDistanceAlongSegmentFromStepIndex:v5 currentStepRemainingDistance:a4];
      double v10 = v9;
      unint64_t v5 = [v8 endStepIndex] + 1;
      if (v5 < [(GEOComposedRoute *)self stepsCount])
      {
        double v11 = [(GEOComposedRoute *)self stepAtIndex:v5];
        [v11 distance];
        a4 = v12;
      }
      double v7 = v7 + v10;
    }
    while (v5 < [(GEOComposedRoute *)self stepsCount]);
  }
  return v7;
}

- (BOOL)checkDrivingArrivalForCoordinate:(id)a3 coordinateOnRoute:(id)a4 routePointIndex:(unsigned int)a5 distanceFromRoute:(double)a6 arrivalMapRegion:(id)a7 checkArrivalRadius:(BOOL)a8 checkDistanceAlongRoute:(BOOL)a9 checkRoadAccessPoints:(BOOL)a10 isOnRoute:(BOOL)a11
{
  BOOL v11 = a11;
  BOOL v12 = a10;
  BOOL v13 = a9;
  BOOL v14 = a8;
  double var1 = a4.var1;
  double var0 = a4.var0;
  double v19 = a3.var1;
  double v20 = a3.var0;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v22 = a7;
  if (v13)
  {
    if (v11) {
      a6 = 0.0;
    }
    -[GEOComposedRoute distanceBetweenLocation:nextPointIndex:toPointIndex:](self, "distanceBetweenLocation:nextPointIndex:toPointIndex:", a5 + 1, [(GEOComposedRoute *)self pointCount] - 1, var0, var1);
    if (a6 + v23 < 10.0) {
      goto LABEL_21;
    }
  }
  if (v14
    && ([(GEOComposedRoute *)self pointAt:[(GEOComposedRoute *)self pointCount] - 1],
        GEOCalculateDistanceRadius(v20, v19, v24, v25, 6367000.0) <= 30.0))
  {
LABEL_21:
    char v38 = 1;
  }
  else
  {
    if (v12)
    {
      double v26 = [(GEOComposedRoute *)self destination];
      double v27 = [v26 geoMapItem];
      unint64_t v28 = [v27 _roadAccessPoints];

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v29 = v28;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v41;
        while (2)
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v41 != v31) {
              objc_enumerationMutation(v29);
            }
            uint64_t v33 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            if (objc_msgSend(v33, "drivingDirection", (void)v40) == 1
              || [v33 drivingDirection] == 3)
            {
              unint64_t v34 = [v33 location];
              [v34 coordinate];
              double v37 = GEOCalculateDistanceRadius(v35, v36, v20, v19, 6367000.0);

              if (v37 < 30.0)
              {

                goto LABEL_21;
              }
            }
          }
          uint64_t v30 = [v29 countByEnumeratingWithState:&v40 objects:v44 count:16];
          if (v30) {
            continue;
          }
          break;
        }
      }
    }
    char v38 = objc_msgSend(v22, "containsCoordinate:", v20, v19, (void)v40);
  }

  return v38;
}

- (double)courseAtRouteCoordinateIndex:(unsigned int)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  double v5 = -1.0;
  if ([(GEOComposedRoute *)self pointCount] >= 2)
  {
    if (a3 + 1 >= [(GEOComposedRoute *)self pointCount]) {
      a3 = [(GEOComposedRoute *)self pointCount] - 2;
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = self->_legs;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v6);
          }
          if (a3 == objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "endPointIndex", (void)v19))
          {
            if (a3) {
              --a3;
            }
            else {
              a3 = 0;
            }
            goto LABEL_16;
          }
        }
        uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_16:

    [(GEOComposedRoute *)self pointAt:a3];
    double v11 = v10;
    double v13 = v12;
    [(GEOComposedRoute *)self pointAt:a3 + 1];
    if (vabdd_f64(v11, v14) >= 0.00000001 || vabdd_f64(v13, v15) >= 0.00000001)
    {
      long double v16 = GEOBearingFromCoordinateToCoordinate(v11, v13, v14, v15);
      long double v17 = fmod(v16, 360.0);
      return fmod(v17 + 360.0, 360.0) + 0.0;
    }
  }
  return v5;
}

- ($1AB5FA073B851C12C2339EC22442E995)locationAtDistance:(double)a3 from:(id)a4
{
  id v6 = a4;
  -[GEOComposedRoute pointAtRouteCoordinate:](self, "pointAtRouteCoordinate:", -[GEOComposedRoute coordinateAtOffset:fromRouteCoordinate:](self, "coordinateAtOffset:fromRouteCoordinate:", [v6 routeCoordinate], a3));
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v8;
  double v14 = v10;
  double v15 = v12;
  result.var2 = v15;
  result.double var1 = v14;
  result.double var0 = v13;
  return result;
}

- (id)routeMatchAtDistance:(double)a3 from:(id)a4 stopAtEndOfTunnel:(BOOL)a5 stopAtEndOfManeuver:(BOOL)a6 date:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a7;
  if (a3 < 0.0)
  {
    id v14 = 0;
    goto LABEL_34;
  }
  uint64_t v15 = [v12 routeCoordinate];
  unsigned int v16 = [(GEOComposedRoute *)self pointCount];
  if (v8)
  {
    long double v17 = -[GEOComposedRoute stepAtIndex:](self, "stepAtIndex:", [v12 stepIndex]);
    uint64_t v18 = [v17 maneuverStartPointIndex];
    if (v18 > v15
      || (uint64_t v19 = v15, v20 = v15, *((float *)&v15 + 1) < 0.0) && v18 == v15)
    {
      uint64_t v20 = v18;
      uint64_t v19 = v18;
    }
    unint64_t v21 = v20 & 0xFFFFFFFF00000000;
  }
  else
  {
    unint64_t v21 = 0;
    uint64_t v19 = v16 - 1;
  }
  [v12 locationCoordinate];
  long double v23 = GEOMapPointsPerMeterAtLatitude(v22);
  [v12 locationCoordinate];
  double v25 = v24;
  [v12 locationCoordinate];
  double v27 = GEOTilePointForCoordinate(v25, v26, 20.0);
  uint64_t v82 = 0;
  uint64_t v83 = &v82;
  uint64_t v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__15;
  unsigned int v86 = __Block_byref_object_dispose__15;
  id v87 = 0;
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x2020000000;
  v81[3] = 0x47EFFFFFE0000000;
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x2020000000;
  char v80 = 0;
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x2020000000;
  char v78 = 0;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x2020000000;
  char v74 = 1;
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x3812000000;
  v72[3] = __Block_byref_object_copy__89;
  v72[4] = __Block_byref_object_dispose__90;
  v72[5] = "";
  v72[6] = 0;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __89__GEOComposedRoute_routeMatchAtDistance_from_stopAtEndOfTunnel_stopAtEndOfManeuver_date___block_invoke;
  v56[3] = &unk_1E53DDCC0;
  double v64 = v27;
  uint64_t v65 = v28;
  unint64_t v29 = v21 | v19;
  uint64_t v68 = v15;
  unint64_t v69 = v29;
  uint64_t v59 = v73;
  v60 = v72;
  BOOL v58 = v79;
  v56[4] = self;
  uint64_t v70 = v15;
  unint64_t v61 = &v82;
  v62 = v81;
  double v66 = a3;
  long double v67 = v23;
  BOOL v71 = v9;
  uint64_t v63 = &v75;
  id v30 = v13;
  id v57 = v30;
  [(GEOComposedRoute *)self forEachSnappedPath:v56];
  if (!v9)
  {
    uint64_t v31 = v83;
    if (v83[5]) {
      goto LABEL_24;
    }
    PolylineCoordinate v35 = [(GEOComposedRoute *)self coordinateAtOffset:v15 fromRouteCoordinate:a3];
    if (v19 > v35.index || v19 == v35.index && v35.offset < *((float *)&v21 + 1))
    {
      uint64_t v19 = (uint64_t)v35;
      unint64_t v29 = (unint64_t)v35;
    }
    double v36 = [GEORouteMatch alloc];
    [(GEOComposedRoute *)self pointAtRouteCoordinate:v29];
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    unint64_t v43 = [(GEOComposedRoute *)self stepIndexForPointIndex:v19];
    [(GEOComposedRoute *)self courseAtRouteCoordinateIndex:v19];
    uint64_t v45 = -[GEORouteMatch initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:](v36, "initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:", self, v29, v43, v30, v38, v40, v42, v44);
    long long v46 = (void *)v83[5];
    v83[5] = v45;

    uint64_t v31 = v83;
    if (!v83[5]) {
      goto LABEL_24;
    }
    uint64_t v33 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOComposedRoute");
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    unint64_t v34 = "routeMatchAtDistance using unsnapped route line";
    goto LABEL_22;
  }
  uint64_t v31 = v83;
  if (!*((unsigned char *)v76 + 24))
  {
    double v32 = (void *)v83[5];
    v83[5] = 0;

    uint64_t v33 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOComposedRoute");
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
LABEL_23:

      uint64_t v31 = v83;
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    unint64_t v34 = "routeMatchAtDistance never found tunnel";
LABEL_22:
    _os_log_impl(&dword_188D96000, v33, OS_LOG_TYPE_DEBUG, v34, buf, 2u);
    goto LABEL_23;
  }
LABEL_24:
  if (v31[5])
  {
    long long v47 = [v12 projectedFrom];
    if (v47)
    {
      long long v48 = [v12 projectedFrom];
    }
    else
    {
      long long v48 = v12;
    }
    [(id)v83[5] setProjectedFrom:v48];
    if (v47) {

    }
    long long v49 = [(id)v83[5] projectedFrom];
    uint64_t v50 = [v49 isGoodMatch];
    [(id)v83[5] setIsGoodMatch:v50];

    long long v51 = [(id)v83[5] projectedFrom];
    [v51 modifiedHorizontalAccuracy];
    objc_msgSend((id)v83[5], "setModifiedHorizontalAccuracy:");

    __int16 v52 = [(id)v83[5] projectedFrom];
    [v52 modifiedCourseAccuracy];
    objc_msgSend((id)v83[5], "setModifiedCourseAccuracy:");
  }
  unint64_t v53 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOComposedRoute");
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v54 = v83[5];
    *(_DWORD *)buf = 138477827;
    uint64_t v89 = v54;
    _os_log_impl(&dword_188D96000, v53, OS_LOG_TYPE_DEBUG, "routeMatchAtDistance returning: %{private}@", buf, 0xCu);
  }

  id v14 = (id)v83[5];
  _Block_object_dispose(v72, 8);
  _Block_object_dispose(v73, 8);
  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(v79, 8);
  _Block_object_dispose(v81, 8);
  _Block_object_dispose(&v82, 8);

LABEL_34:

  return v14;
}

void __89__GEOComposedRoute_routeMatchAtDistance_from_stopAtEndOfTunnel_stopAtEndOfManeuver_date___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 mapMatchingSection];
  double v5 = [v3 section];
  id v6 = v5;
  if (v5)
  {
    [v5 bounds];
    double v7 = *((double *)&v36 + 1);
    double v8 = *(double *)&v36;
    double v10 = *((double *)&v37 + 1);
    double v9 = *(double *)&v38;
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v36 = 0u;
    double v9 = 0.0;
    double v10 = 0.0;
    double v7 = 0.0;
    double v8 = 0.0;
  }
  *(double *)double v39 = v8;
  *(double *)&v39[1] = v7;
  *(double *)&v39[2] = v10;
  *(double *)&v39[3] = v9;

  double v12 = *(double *)(a1 + 96);
  double v11 = *(double *)(a1 + 104);
  uint64_t v13 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 24))(v4);
  unsigned int v14 = *(_DWORD *)(a1 + 128);
  if ((v14 < v13 || v14 == v13 && *(float *)(a1 + 132) < *((float *)&v13 + 1))
    && !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    || (uint64_t v15 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 24))(v4),
        unsigned int v16 = *(_DWORD *)(a1 + 136),
        v16 < v15)
    || v16 == v15 && *(float *)(a1 + 140) < *((float *)&v15 + 1))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (!(*(unsigned int (**)(uint64_t))(*(void *)v4 + 16))(v4)
      || (uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8),
          uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 24))(v4),
          *(_DWORD *)(v17 + 48) != v18)
      || vabds_f32(*(float *)(v17 + 52), *((float *)&v18 + 1)) >= 0.00000011921)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    }
  }
  uint64_t v19 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 32))(v4);
  unsigned int v20 = *(_DWORD *)(a1 + 128);
  if (v20 > v19 || v20 == v19 && *(float *)(a1 + 132) > *((float *)&v19 + 1))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)
      && *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
      && (*(unsigned int (**)(uint64_t))(*(void *)v4 + 16))(v4))
    {
      float v21 = (v12 - v8) / v10;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __89__GEOComposedRoute_routeMatchAtDistance_from_stopAtEndOfTunnel_stopAtEndOfManeuver_date___block_invoke_2;
      v26[3] = &unk_1E53DDC98;
      v26[4] = *(void *)(a1 + 32);
      long long v22 = *(_OWORD *)(a1 + 136);
      float v23 = (v9 - (v11 - v7)) / v9;
      float v33 = v21;
      float v34 = v23;
      long long v31 = *(_OWORD *)(a1 + 112);
      long long v32 = v22;
      char v35 = *(unsigned char *)(a1 + 152);
      long long v28 = *(_OWORD *)(a1 + 80);
      uint64_t v29 = *(void *)(a1 + 72);
      id v30 = v39;
      long long v25 = *(_OWORD *)(a1 + 40);
      id v24 = (id)v25;
      long long v27 = v25;
      (*(void (**)(uint64_t, void *))(*(void *)v4 + 40))(v4, v26);
    }
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 48) = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 32))(v4);
  }
}

uint64_t __89__GEOComposedRoute_routeMatchAtDistance_from_stopAtEndOfTunnel_stopAtEndOfManeuver_date___block_invoke_2(uint64_t a1, float *a2, float *a3, uint64_t *a4, uint64_t *a5, void *a6)
{
  id v11 = a6;
  float v12 = *a2;
  float v13 = a2[1];
  float v14 = *a2;
  float v15 = v13;
  float v17 = *a3;
  float v16 = a3[1];
  uint64_t v18 = *a5;
  uint64_t v76 = v18;
  unsigned int v19 = *(_DWORD *)(a1 + 104);
  if (v19 < v18
    || (float v32 = *((float *)&v18 + 1), v19 == v18) && *(float *)(a1 + 108) < *((float *)&v18 + 1))
  {
    [*(id *)(a1 + 32) pointAtRouteCoordinate:*(void *)(a1 + 104)];
    float v22 = v17 - v14;
    float v23 = v16 - v13;
    float v24 = 0.0;
    float v25 = (float)((float)(v22 * v22) + 0.0) + (float)(v23 * v23);
    if (v25 > 1.0e-15)
    {
      double v26 = GEOTilePointForCoordinate(v20, v21, 20.0);
      long long v27 = *(double **)(a1 + 80);
      *(float *)&double v28 = (v27[3] - (v28 - v27[1])) / v27[3];
      *(float *)&double v26 = (v26 - *v27) / v27[2];
      float v29 = (float)((float)((float)((float)(*(float *)&v26 - v14) * v22) + 0.0)
                  + (float)((float)(*(float *)&v28 - v13) * v23))
          / v25;
      if (v29 < 0.0) {
        float v29 = 0.0;
      }
      if (v29 <= 1.0) {
        float v24 = v29;
      }
      else {
        float v24 = 1.0;
      }
    }
    uint64_t v76 = *(void *)(a1 + 104);
    int v30 = v76;
    long long v31 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOComposedRoute");
    float v32 = *((float *)&v76 + 1);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v31, OS_LOG_TYPE_DEBUG, "routeMatchAtDistance stopped for max coordinate (next maneuver)", buf, 2u);
    }
    float v17 = v14 + (float)(v22 * v24);
    float v16 = v13 + (float)(v23 * v24);

    char v33 = 0;
    LODWORD(v18) = v30;
  }
  else
  {
    char v33 = 1;
  }
  *(float *)buf = v12;
  float v75 = v13;
  uint64_t v34 = *a4;
  uint64_t v73 = *a4;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    unsigned int v39 = *(_DWORD *)(a1 + 112);
    if (v39 <= v34 && (v39 != v34 || *(float *)(a1 + 116) < *((float *)&v34 + 1))) {
      goto LABEL_49;
    }
    if (v39 >= v18 && (v39 != v18 || *(float *)(a1 + 116) > v32)) {
      goto LABEL_49;
    }
    float v40 = v17 - v14;
    float v41 = v16 - v13;
    float v42 = 0.0;
    float v43 = (float)((float)(v40 * v40) + 0.0) + (float)(v41 * v41);
    if (v43 > 1.0e-15)
    {
      float v44 = (float)((float)((float)((float)(*(float *)(a1 + 120) - v14) * v40) + 0.0)
                  + (float)((float)(*(float *)(a1 + 124) - v13) * v41))
          / v43;
      if (v44 < 0.0) {
        float v44 = 0.0;
      }
      float v42 = 1.0;
      if (v44 <= 1.0) {
        float v42 = v44;
      }
    }
    float v14 = v14 + (float)(v40 * v42);
    float v15 = v13 + (float)(v41 * v42);
    *(float *)buf = v14;
    float v75 = v15;
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(double *)(a1 + 88)
                                                                * *(double *)(a1 + 96)
                                                                / *(double *)(*(void *)(a1 + 80) + 16);
    uint64_t v73 = *(void *)(a1 + 112);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    uint64_t v45 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOComposedRoute");
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v71) = 0;
      _os_log_impl(&dword_188D96000, v45, OS_LOG_TYPE_DEBUG, "routeMatchAtDistance found start", (uint8_t *)&v71, 2u);
    }

    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      goto LABEL_49;
    }
  }
  float v35 = sqrtf((float)((float)((float)(v14 - v17) * (float)(v14 - v17)) + 0.0)+ (float)((float)(v15 - v16) * (float)(v15 - v16)));
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 24)
                                                              - v35;
  if (v11)
  {
    long long v36 = [v11 feature];
    long long v37 = [v36 attributes];
    int v38 = [v37 isTunnel];
  }
  else
  {
    int v38 = 0;
  }
  if (*(unsigned char *)(a1 + 128) && *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) && (v38 & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    if (v38 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      long long v46 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOComposedRoute");
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v71) = 0;
        _os_log_impl(&dword_188D96000, v46, OS_LOG_TYPE_DEBUG, "routeMatchAtDistance found tunnel", (uint8_t *)&v71, 2u);
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v38;
  }
  uint64_t v47 = *(void *)(*(void *)(a1 + 56) + 8);
  double v48 = *(double *)(v47 + 24);
  if (v48 <= 0.0) {
    char v49 = 1;
  }
  else {
    char v49 = v33;
  }
  if ((v49 & 1) == 0)
  {
    *(void *)(v47 + 24) = 0;
    double v48 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
  if (v48 <= 0.0)
  {
    float v71 = v17;
    float v72 = v16;
    double v51 = 0.0;
    if (v35 > 0.0)
    {
      double v51 = (v48 + v35) / v35;
      *(float *)&double v51 = v51;
      float v71 = v14 + (float)((float)(v17 - v14) * *(float *)&v51);
      float v72 = v15 + (float)((float)(v16 - v15) * *(float *)&v51);
    }
    uint64_t v52 = [*(id *)(a1 + 32) _findRouteCoordinateWithOffset:buf aPos:&v73 aCoord:&v76 bCoord:&v71 pointOnSegment:*(void *)(a1 + 80) bounds:v51];
    unint64_t v53 = *(double **)(a1 + 80);
    double v55 = *v53;
    double v54 = v53[1];
    double v57 = v53[2];
    double v56 = v53[3];
    float v59 = v71;
    float v58 = v72;
    v60 = [GEORouteMatch alloc];
    unint64_t v61 = *(void **)(a1 + 32);
    double v62 = GEOCoordinate2DForMapPoint(v55 + v59 * v57, v54 + (float)(1.0 - v58) * v56);
    double v64 = v63;
    uint64_t v65 = [v61 stepIndexForPointIndex:v52];
    [*(id *)(a1 + 32) courseAtRouteCoordinateIndex:v52];
    uint64_t v67 = -[GEORouteMatch initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:](v60, "initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:", v61, v52, v65, *(void *)(a1 + 40), v62, v64, 1.79769313e308, v66);
    uint64_t v68 = *(void *)(*(void *)(a1 + 72) + 8);
    unint64_t v69 = *(void **)(v68 + 40);
    *(void *)(v68 + 40) = v67;

    uint64_t v50 = 1;
  }
  else
  {
LABEL_49:
    uint64_t v50 = 0;
  }

  return v50;
}

- (PolylineCoordinate)_findRouteCoordinateWithOffset:(float)a3 aPos:(const void *)a4 aCoord:(const PolylineCoordinate *)a5 bCoord:(const PolylineCoordinate *)a6 pointOnSegment:(const void *)a7 bounds:(id *)a8
{
  unsigned int index = a5->index;
  float offset = a5->offset;
  if (a3 == 0.0)
  {
    if (offset >= 1.0)
    {
      index += vcvtms_u32_f32(offset);
      float v10 = offset - (float)floorf(offset);
    }
    else
    {
      float v10 = a5->offset;
    }
    return (PolylineCoordinate)(index | ((unint64_t)LODWORD(v10) << 32));
  }
  unsigned int v11 = a6->index;
  float v10 = a6->offset;
  if (a3 == 1.0)
  {
    if (v10 < 1.0)
    {
      unsigned int index = a6->index;
      return (PolylineCoordinate)(index | ((unint64_t)LODWORD(v10) << 32));
    }
    float v12 = floorf(v10);
    unsigned int index = v11 + vcvtms_u32_f32(v10);
LABEL_15:
    float v10 = v10 - (float)v12;
    return (PolylineCoordinate)(index | ((unint64_t)LODWORD(v10) << 32));
  }
  if (index == v11)
  {
    float v10 = offset + (float)((float)(v10 - offset) * a3);
    if (v10 < 1.0) {
      return (PolylineCoordinate)(index | ((unint64_t)LODWORD(v10) << 32));
    }
LABEL_14:
    float v12 = floorf(v10);
    index += vcvtms_u32_f32(v10);
    goto LABEL_15;
  }
  if (v10 == 0.0)
  {
    float v10 = offset + (float)((float)(1.0 - offset) * a3);
    if (v10 < 1.0) {
      return (PolylineCoordinate)(index | ((unint64_t)LODWORD(v10) << 32));
    }
    goto LABEL_14;
  }
  double v15 = GEOMetersBetweenMapPoints(a8->var0.var0 + *(float *)a4 * a8->var1.var0, a8->var0.var1 + (float)(1.0 - *((float *)a4 + 1)) * a8->var1.var1, a8->var0.var0 + *(float *)a7 * a8->var1.var0, a8->var0.var1 + (float)(1.0 - *((float *)a7 + 1)) * a8->var1.var1);
  LODWORD(v16) = index + vcvtms_u32_f32(offset);
  float v17 = offset - (float)floorf(offset);
  if (offset >= 1.0)
  {
    uint64_t v16 = v16;
  }
  else
  {
    float v17 = offset;
    uint64_t v16 = index;
  }
  PolylineCoordinate v18 = [(GEOComposedRoute *)self coordinateAtOffset:v16 | ((unint64_t)LODWORD(v17) << 32) fromRouteCoordinate:v15];
  float v10 = v18.offset;
  unsigned int index = v18.index;
  return (PolylineCoordinate)(index | ((unint64_t)LODWORD(v10) << 32));
}

- (void)roadFeaturesForRouteCoordinate:(PolylineCoordinate)a3 distanceAhead:(double)a4 handler:(id)a5
{
  double v8 = (void (**)(id, void, double, double, double, double))a5;
  if (v8)
  {
    PolylineCoordinate v9 = [(GEOComposedRoute *)self coordinateAtOffset:a3 fromRouteCoordinate:a4];
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__15;
    v28[4] = __Block_byref_object_dispose__15;
    id v29 = 0;
    uint64_t v21 = 0;
    float v22 = &v21;
    uint64_t v23 = 0x4812000000;
    float v24 = __Block_byref_object_copy__99;
    float v25 = __Block_byref_object_dispose__100;
    double v26 = "";
    memset(v27, 0, sizeof(v27));
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __73__GEOComposedRoute_roadFeaturesForRouteCoordinate_distanceAhead_handler___block_invoke;
    v20[3] = &unk_1E53DDD10;
    v20[6] = a3;
    v20[7] = v9;
    v20[4] = &v21;
    v20[5] = v28;
    [(GEOComposedRoute *)self forEachSnappedPath:v20];
    for (uint64_t i = v22[6]; i != v22[7]; i += 56)
    {
      double v11 = *(double *)(i + 8);
      double v12 = *(double *)(i + 16);
      double v13 = *(double *)(i + 24);
      double v14 = *(double *)(i + 32);
      double v15 = GEOCoordinate2DForMapPoint(v11 + *(float *)(i + 40) * v13, v12 + (float)(1.0 - *(float *)(i + 44)) * v14);
      double v17 = v16;
      long double v18 = GEOCoordinate2DForMapPoint(v11 + *(float *)(i + 48) * v13, v12 + (float)(1.0 - *(float *)(i + 52)) * v14);
      v8[2](v8, *(void *)i, v15, v17, v18, v19);
    }
    _Block_object_dispose(&v21, 8);
    std::vector<-[GEOComposedRoute roadFeaturesForRouteCoordinate:distanceAhead:handler:]::FeatureWithEndPoints>::~vector[abi:ne180100](v27);
    _Block_object_dispose(v28, 8);
  }
}

- (void)roadFeaturesForRouteCoordinate:(void *)a1 distanceAhead:handler:
{
  double v2 = (char *)*a1;
  if (*a1)
  {
    id v3 = (char *)a1[1];
    uint64_t v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        double v5 = (void *)*((void *)v3 - 7);
        v3 -= 56;
      }
      while (v3 != v2);
      uint64_t v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void __73__GEOComposedRoute_roadFeaturesForRouteCoordinate_distanceAhead_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 mapMatchingSection];
  if ((*(unsigned int (**)(uint64_t))(*(void *)v4 + 16))(v4))
  {
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 32))(v4);
    unsigned int v6 = *(_DWORD *)(a1 + 48);
    if (v6 < v5 || v6 == v5 && *(float *)(a1 + 52) < *((float *)&v5 + 1))
    {
      uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 24))(v4);
      unsigned int v8 = *(_DWORD *)(a1 + 56);
      if (v8 > v7 || v8 == v7 && *(float *)(a1 + 60) > *((float *)&v7 + 1))
      {
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        long long v9 = *(_OWORD *)(a1 + 48);
        long long v12 = *(_OWORD *)(a1 + 32);
        long long v13 = v9;
        v10[2] = __73__GEOComposedRoute_roadFeaturesForRouteCoordinate_distanceAhead_handler___block_invoke_2;
        v10[3] = &unk_1E53DDCE8;
        id v11 = v3;
        (*(void (**)(uint64_t, void *))(*(void *)v4 + 40))(v4, v10);
      }
    }
  }
}

uint64_t __73__GEOComposedRoute_roadFeaturesForRouteCoordinate_distanceAhead_handler___block_invoke_2(uint64_t a1, uint64_t *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v12 = a6;
  long long v13 = v12;
  if (v12)
  {
    unsigned int v14 = *(_DWORD *)(a1 + 56);
    if (v14 < *(_DWORD *)a5 || v14 == *(_DWORD *)a5 && *(float *)(a1 + 60) < *(float *)(a5 + 4))
    {
      unsigned int v15 = *(_DWORD *)(a1 + 64);
      if (*(_DWORD *)a4 < v15 || *(_DWORD *)a4 == v15 && *(float *)(a4 + 4) < *(float *)(a1 + 68))
      {
        uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v18 = *(void *)(v16 + 48);
        uint64_t v17 = *(void *)(v16 + 56);
        if (v18 != v17 && *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) == v12)
        {
          *(void *)(v17 - 8) = *a3;
LABEL_40:
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a6);
          goto LABEL_41;
        }
        id v19 = v12;
        double v20 = [*(id *)(a1 + 32) section];
        uint64_t v21 = v20;
        if (v20)
        {
          [v20 bounds];
          uint64_t v22 = v50;
          uint64_t v23 = v49;
          uint64_t v25 = v51;
          uint64_t v24 = v52;
        }
        else
        {
          uint64_t v24 = 0;
          uint64_t v25 = 0;
          uint64_t v22 = 0;
          uint64_t v23 = 0;
        }

        uint64_t v26 = *a2;
        uint64_t v27 = *a3;
        double v28 = *(void **)(*(void *)(a1 + 40) + 8);
        int v30 = (void *)v28[7];
        unint64_t v29 = v28[8];
        if ((unint64_t)v30 < v29)
        {
          void *v30 = v19;
          v30[1] = v23;
          v30[2] = v22;
          v30[3] = v25;
          v30[4] = v24;
          long long v31 = v30 + 7;
          v30[5] = v26;
          v30[6] = v27;
LABEL_39:
          v28[7] = v31;

          goto LABEL_40;
        }
        double v48 = v19;
        uint64_t v32 = v28[6];
        uint64_t v33 = 0x6DB6DB6DB6DB6DB7 * (((uint64_t)v30 - v32) >> 3);
        if ((unint64_t)(v33 + 1) > 0x492492492492492) {
          std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v34 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v29 - v32) >> 3);
        uint64_t v35 = 2 * v34;
        if (2 * v34 <= v33 + 1) {
          uint64_t v35 = v33 + 1;
        }
        if (v34 >= 0x249249249249249) {
          unint64_t v36 = 0x492492492492492;
        }
        else {
          unint64_t v36 = v35;
        }
        if (v36)
        {
          if (v36 > 0x492492492492492) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          long long v37 = (char *)operator new(56 * v36);
        }
        else
        {
          long long v37 = 0;
        }
        int v38 = &v37[56 * v33];
        *(void *)int v38 = v48;
        *((void *)v38 + 1) = v23;
        *((void *)v38 + 2) = v22;
        *((void *)v38 + 3) = v25;
        *((void *)v38 + 4) = v24;
        *((void *)v38 + 5) = v26;
        *((void *)v38 + 6) = v27;
        unsigned int v39 = (char *)v28[6];
        float v40 = (char *)v28[7];
        if (v40 == v39)
        {
          long long v31 = v38 + 56;
          v28[6] = v38;
          v28[7] = v38 + 56;
          v28[8] = &v37[56 * v36];
        }
        else
        {
          float v41 = v38;
          do
          {
            uint64_t v42 = *((void *)v40 - 7);
            v40 -= 56;
            *(void *)float v40 = 0;
            *((void *)v41 - 7) = v42;
            v41 -= 56;
            long long v43 = *(_OWORD *)(v40 + 8);
            long long v44 = *(_OWORD *)(v40 + 24);
            *(_OWORD *)(v41 + 40) = *(_OWORD *)(v40 + 40);
            *(_OWORD *)(v41 + 24) = v44;
            *(_OWORD *)(v41 + 8) = v43;
          }
          while (v40 != v39);
          float v40 = (char *)v28[6];
          uint64_t v45 = (char *)v28[7];
          long long v31 = v38 + 56;
          v28[6] = v41;
          v28[7] = v38 + 56;
          v28[8] = &v37[56 * v36];
          if (v45 != v40)
          {
            id v19 = v48;
            do
            {
              long long v46 = (void *)*((void *)v45 - 7);
              v45 -= 56;
            }
            while (v45 != v40);
LABEL_37:
            if (v40) {
              operator delete(v40);
            }
            goto LABEL_39;
          }
        }
        id v19 = v48;
        goto LABEL_37;
      }
    }
  }
LABEL_41:

  return 0;
}

- (id)geoTrafficBannerTexts
{
  geoWaypointRoute = self->_geoWaypointRoute;
  if (geoWaypointRoute)
  {
    geoWaypointRoute = [geoWaypointRoute trafficBannerTexts];
  }

  return geoWaypointRoute;
}

- (BOOL)_meetsMinimumPathLengthBetweenStart:(unsigned int)a3 end:(unsigned int)a4
{
  [(GEOComposedRoute *)self pointAt:a3];
  double v8 = v7;
  double v10 = v9;
  unsigned int v11 = a3 + 1;
  double v12 = 0.0;
  do
  {
    unsigned int v13 = v11;
    if (v11 > a4) {
      break;
    }
    [(GEOComposedRoute *)self pointAt:v11];
    double v15 = v14;
    double v17 = v16;
    double v12 = v12 + GEOCalculateDistanceRadius(v8, v10, v14, v16, 6367000.0);
    unsigned int v11 = v13 + 1;
    double v10 = v17;
    double v8 = v15;
  }
  while (v12 < 100.0);
  return v13 <= a4;
}

- (void)_addSnappedPolylinePathsForSection:(id)a3 toPaths:(id)a4 rects:(id *)a5 rectsCount:(unint64_t)a6
{
  id v7 = a3;
  id v10 = a4;
  id v8 = v10;
  id v9 = v7;
  geo_reentrant_isolate_sync();
}

void __80__GEOComposedRoute__addSnappedPolylinePathsForSection_toPaths_rects_rectsCount___block_invoke(uint64_t a1)
{
  long long v75 = 0u;
  long long v76 = 0u;
  long long v74 = 0u;
  double v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 bounds];
    double v3 = *((double *)&v74 + 1);
    double v4 = *(double *)&v74;
    double v6 = *((double *)&v75 + 1);
    double v5 = *(double *)&v76;
  }
  else
  {
    double v5 = 0.0;
    double v6 = 0.0;
    double v3 = 0.0;
    double v4 = 0.0;
  }
  unint64_t v7 = *(void *)(a1 + 56);
  if (v7)
  {
    id v8 = 0;
    id v9 = 0;
    id v10 = 0;
    for (unint64_t i = 0; i < v7; ++i)
    {
      double v12 = (double *)(*(void *)(a1 + 64) + 32 * i);
      double v13 = *v12;
      double v14 = v12[1];
      double v15 = v12[2];
      double v16 = v12[3];
      if (GEOMapRectIntersectsRect(*v12, v14, v15, v16, v4, v3, v6, v5))
      {
        uint64_t v17 = 0;
        long long v73 = xmmword_18A62BFC0;
        *(float *)&unsigned int v18 = (v13 - v4) / v6;
        *(float *)&unsigned int v19 = (v5 - (v14 - v3)) / v5;
        unint64_t v72 = __PAIR64__(v19, v18);
        char v20 = 1;
        do
        {
          char v21 = v20;
          float v22 = *((float *)&v72 + v17);
          float v23 = *((float *)&v73 + v17);
          if (v22 < v23) {
            float v23 = *((float *)&v72 + v17);
          }
          *((float *)&v73 + v17) = v23;
          if (*((float *)&v73 + v17 + 2) >= v22) {
            float v22 = *((float *)&v73 + v17 + 2);
          }
          *((float *)&v73 + v17 + 2) = v22;
          uint64_t v17 = 1;
          char v20 = 0;
        }
        while ((v21 & 1) != 0);
        uint64_t v24 = 0;
        *(float *)&unsigned int v25 = (v13 + v15 - v4) / v6;
        *(float *)&unsigned int v26 = (v5 - (v14 + v16 - v3)) / v5;
        unint64_t v72 = __PAIR64__(v26, v25);
        char v27 = 1;
        do
        {
          char v28 = v27;
          float v29 = *((float *)&v72 + v24);
          float v30 = *((float *)&v73 + v24);
          if (v29 < v30) {
            float v30 = *((float *)&v72 + v24);
          }
          *((float *)&v73 + v24) = v30;
          if (*((float *)&v73 + v24 + 2) >= v29) {
            float v29 = *((float *)&v73 + v24 + 2);
          }
          *((float *)&v73 + v24 + 2) = v29;
          uint64_t v24 = 1;
          char v27 = 0;
        }
        while ((v28 & 1) != 0);
        if (v9 >= v10)
        {
          uint64_t v31 = v9 - v8;
          unint64_t v32 = v31 + 1;
          if ((unint64_t)(v31 + 1) >> 60) {
            std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)v10 - (char *)v8) >> 3 > v32) {
            unint64_t v32 = ((char *)v10 - (char *)v8) >> 3;
          }
          if ((unint64_t)((char *)v10 - (char *)v8) >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v33 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v33 = v32;
          }
          if (v33)
          {
            if (v33 >> 60) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            unint64_t v34 = (char *)operator new(16 * v33);
          }
          else
          {
            unint64_t v34 = 0;
          }
          uint64_t v35 = (long long *)&v34[16 * v31];
          long long *v35 = v73;
          unint64_t v36 = v8;
          if (v9 == v8)
          {
            id v8 = (long long *)&v34[16 * v31];
          }
          else
          {
            long long v37 = &v34[16 * v31];
            do
            {
              id v8 = (long long *)(v37 - 16);
              *((_OWORD *)v37 - 1) = *--v9;
              v37 -= 16;
            }
            while (v9 != v36);
          }
          id v10 = (long long *)&v34[16 * v33];
          id v9 = v35 + 1;
          if (v36) {
            operator delete(v36);
          }
        }
        else
        {
          *v9++ = v73;
        }
        unint64_t v7 = *(void *)(a1 + 56);
      }
    }
    if (v8 == v9) {
      goto LABEL_95;
    }
    uint64_t v70 = [*(id *)(a1 + 32) points];
    unsigned int v68 = [*(id *)(a1 + 32) endPointIndex];
    for (unsigned int j = 0; [*(id *)(*(void *)(a1 + 40) + 576) count] > (unint64_t)j; ++j)
    {
      unsigned int v39 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 576), "objectAtIndex:");
      unsigned int v40 = [v39 routeEndIndex];
      unsigned int v41 = [*(id *)(a1 + 32) startPointIndex];

      if (v40 > v41) {
        break;
      }
    }
    unint64_t v42 = 0;
    id v43 = 0;
    unsigned int v71 = v68;
    uint64_t v67 = v8;
LABEL_46:
    if (v42 >= [*(id *)(a1 + 32) pointCount] - 1) {
      goto LABEL_92;
    }
    int v44 = [*(id *)(a1 + 32) startPointIndex];
    uint64_t v45 = 0;
    long long v73 = xmmword_18A62BFC0;
    unint64_t v72 = *(void *)(v70 + 12 * v42);
    char v46 = 1;
    do
    {
      char v47 = v46;
      float v48 = *((float *)&v72 + v45);
      float v49 = *((float *)&v73 + v45);
      if (v48 < v49) {
        float v49 = *((float *)&v72 + v45);
      }
      *((float *)&v73 + v45) = v49;
      if (*((float *)&v73 + v45 + 2) >= v48) {
        float v48 = *((float *)&v73 + v45 + 2);
      }
      *((float *)&v73 + v45 + 2) = v48;
      uint64_t v45 = 1;
      char v46 = 0;
    }
    while ((v47 & 1) != 0);
    uint64_t v50 = 0;
    unint64_t v69 = v42 + 1;
    unint64_t v72 = *(void *)(v70 + 12 * (v42 + 1));
    char v51 = 1;
    do
    {
      char v52 = v51;
      float v53 = *((float *)&v72 + v50);
      float v54 = *((float *)&v73 + v50);
      if (v53 < v54) {
        float v54 = *((float *)&v72 + v50);
      }
      *((float *)&v73 + v50) = v54;
      if (*((float *)&v73 + v50 + 2) >= v53) {
        float v53 = *((float *)&v73 + v50 + 2);
      }
      *((float *)&v73 + v50 + 2) = v53;
      uint64_t v50 = 1;
      char v51 = 0;
    }
    while ((v52 & 1) != 0);
    uint64_t v55 = (v44 + v42);
    double v56 = v8;
    do
    {
      uint64_t v57 = 0;
      char v58 = 1;
      while (*((float *)&v73 + v57 + 2) > *((float *)v56 + v57) && *((float *)&v73 + v57) < *((float *)v56 + v57 + 2))
      {
        char v59 = v58;
        char v58 = 0;
        uint64_t v57 = 1;
        if ((v59 & 1) == 0)
        {
          if (v43
            && [v43 routeStartIndex] <= v55
            && [v43 routeEndIndex] > v55)
          {
            int v61 = 1;
            goto LABEL_85;
          }
          while (2)
          {

            if ([*(id *)(*(void *)(a1 + 40) + 576) count] <= (unint64_t)j)
            {
              id v43 = 0;
            }
            else
            {
              objc_msgSend(*(id *)(*(void *)(a1 + 40) + 576), "objectAtIndex:");
              id v43 = (id)objc_claimAutoreleasedReturnValue();
              if ([v43 routeEndIndex] <= v55)
              {
                ++j;
                continue;
              }
              if (v43 && [v43 routeStartIndex] <= v55)
              {
                if (v71 < v68)
                {
                  double v62 = [[GEOSnappedRoutePath alloc] initWithRoute:*(void *)(a1 + 40) section:*(void *)(a1 + 32) routeStartIndex:v71 routeEndIndex:v55];
                  [*(id *)(a1 + 48) addObject:v62];

                  unsigned int v71 = v68;
                }
                [*(id *)(a1 + 48) addObject:v43];
                id v43 = v43;
                ++j;
                int v61 = 1;
                id v63 = v43;
LABEL_84:

                id v43 = v63;
                id v8 = v67;
LABEL_85:
                unsigned int v64 = v71;
                if (v71 < v68) {
                  int v65 = 1;
                }
                else {
                  int v65 = v61;
                }
                if (!v65) {
                  unsigned int v64 = v55;
                }
                unsigned int v71 = v64;
LABEL_91:
                unint64_t v42 = v69;
                goto LABEL_46;
              }
            }
            break;
          }
          id v63 = 0;
          int v61 = 0;
          goto LABEL_84;
        }
      }
      ++v56;
    }
    while (v56 != v9);
    if (v71 >= v68) {
      goto LABEL_91;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "_meetsMinimumPathLengthBetweenStart:end:", v55, objc_msgSend(*(id *)(a1 + 32), "endPointIndex")))
    {
      if ([*(id *)(a1 + 40) _meetsMinimumPathLengthBetweenStart:v71 end:v55])
      {
        v60 = [[GEOSnappedRoutePath alloc] initWithRoute:*(void *)(a1 + 40) section:*(void *)(a1 + 32) routeStartIndex:v71 routeEndIndex:v55];
        [*(id *)(a1 + 48) addObject:v60];

        id v43 = 0;
        unsigned int v71 = v68;
      }
      goto LABEL_91;
    }
LABEL_92:
    if (v71 < v68)
    {
      double v66 = -[GEOSnappedRoutePath initWithRoute:section:routeStartIndex:routeEndIndex:]([GEOSnappedRoutePath alloc], "initWithRoute:section:routeStartIndex:routeEndIndex:", *(void *)(a1 + 40), *(void *)(a1 + 32), v71, [*(id *)(a1 + 32) endPointIndex]);
      [*(id *)(a1 + 48) addObject:v66];
    }
LABEL_95:
    if (v8) {
      operator delete(v8);
    }
  }
}

- (void)_snapPaths:(id)a3 completionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v17 = a4;
  if (!self->_zilchDecoder)
  {
    unint64_t v7 = objc_alloc_init(GEOZilchDecoder);
    zilchDecoder = self->_zilchDecoder;
    self->_zilchDecoder = v7;

    [(GEOZilchDecoder *)self->_zilchDecoder setMapAccessRestrictions:self];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v10)
  {

    if (!v17)
    {
      unsigned int v11 = 0;
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  unsigned int v11 = 0;
  uint64_t v12 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v23 != v12) {
        objc_enumerationMutation(v9);
      }
      double v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      if (([v14 isMapMatching] & 1) == 0 && (objc_msgSend(v14, "hasCompletedMapMatching") & 1) == 0)
      {
        if (v17 && !v11) {
          unsigned int v11 = dispatch_group_create();
        }
        if (v11) {
          dispatch_group_enter(v11);
        }
        double v15 = self->_zilchDecoder;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __49__GEOComposedRoute__snapPaths_completionHandler___block_invoke;
        v20[3] = &unk_1E53DDD60;
        v20[4] = self;
        unsigned int v11 = v11;
        char v21 = v11;
        [v14 matchWithDecoder:v15 completionHandler:v20];
      }
    }
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v10);

  if (v17)
  {
    if (v11)
    {
      double v16 = [(GEOZilchDecoder *)self->_zilchDecoder decoderQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__GEOComposedRoute__snapPaths_completionHandler___block_invoke_2;
      block[3] = &unk_1E53DDD88;
      id v19 = v17;
      dispatch_group_notify(v11, v16, block);

      goto LABEL_24;
    }
LABEL_22:
    unsigned int v11 = 0;
    (*((void (**)(id, uint64_t))v17 + 2))(v17, 1);
  }
LABEL_24:
}

void __49__GEOComposedRoute__snapPaths_completionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 664), "composedRouteUpdatedSnappedPaths:");
  }
  double v3 = *(NSObject **)(a1 + 40);
  if (v3)
  {
    dispatch_group_leave(v3);
  }
}

uint64_t __49__GEOComposedRoute__snapPaths_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_addPaths:(id)a3 forObserver:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  geo_reentrant_isolate_sync();
}

void __42__GEOComposedRoute__addPaths_forObserver___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v3 = 0;
  unint64_t v4 = 0;
  while (v4 < [*(id *)(*(void *)(a1 + 32) + 576) count]
       || v3 < [*(id *)(a1 + 40) count])
  {
    if (v4 >= [*(id *)(*(void *)(a1 + 32) + 576) count])
    {
      id v5 = 0;
    }
    else
    {
      id v5 = [*(id *)(*(void *)(a1 + 32) + 576) objectAtIndex:v4];
    }
    if (v3 >= [*(id *)(a1 + 40) count])
    {
      id v6 = 0;
      if (!v5)
      {
LABEL_9:
        unsigned int v7 = [*(id *)(a1 + 32) pointCount];
        goto LABEL_12;
      }
    }
    else
    {
      id v6 = [*(id *)(a1 + 40) objectAtIndex:v3];
      if (!v5) {
        goto LABEL_9;
      }
    }
    unsigned int v7 = [v5 routeStartIndex];
LABEL_12:
    unsigned int v8 = v7;
    if (v6) {
      unsigned int v9 = [v6 routeStartIndex];
    }
    else {
      unsigned int v9 = [*(id *)(a1 + 32) pointCount];
    }
    if (v5 && v5 == v6)
    {
      [v5 registerObserver:*(void *)(a1 + 48)];
      [v2 addObject:v5];
      ++v4;
      ++v3;
      id v6 = v5;
    }
    else if (v8 >= v9)
    {
      if (!v6) {
        goto LABEL_25;
      }
      [v6 registerObserver:*(void *)(a1 + 48)];
      [v2 addObject:v6];
      ++v3;
    }
    else
    {
      if ([v5 unregisterObserver:*(void *)(a1 + 48)]) {
        [v2 addObject:v5];
      }
      ++v4;
    }

LABEL_25:
  }
  uint64_t v10 = *(void *)(a1 + 32);
  unsigned int v11 = *(void **)(v10 + 576);
  *(void *)(v10 + 576) = v2;
}

- (BOOL)supportsSnapping
{
  return +[GEOZilchDecoder decodingSupported];
}

- (id)getSnappedPathsForVisibleRect:(id)a3 rectsToSnap:(id *)a4 rectsToSnapCount:(unint64_t)a5 observer:(id)a6 completionHandler:(id)a7
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v12 = a3.var0.var1;
  double v13 = a3.var0.var0;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v27 = a6;
  id v15 = a7;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v17 = self->_sections;
  uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(v17);
        }
        uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        if (v21)
        {
          [*(id *)(*((void *)&v31 + 1) + 8 * i) bounds];
          double v23 = *((double *)&v28 + 1);
          double v22 = *(double *)&v28;
          double v24 = *((double *)&v29 + 1);
          double v25 = v30;
        }
        else
        {
          long long v29 = 0u;
          double v30 = 0.0;
          double v25 = 0.0;
          double v24 = 0.0;
          double v23 = 0.0;
          double v22 = 0.0;
          long long v28 = 0u;
        }
        if (GEOMapRectIntersectsRect(v13, v12, var0, var1, v22, v23, v24, v25)) {
          [(GEOComposedRoute *)self _addSnappedPolylinePathsForSection:v21 toPaths:v16 rects:a4 rectsCount:a5];
        }
      }
      uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v18);
  }

  [(GEOComposedRoute *)self _snapPaths:v16 completionHandler:v15];
  [(GEOComposedRoute *)self _addPaths:v16 forObserver:v27];

  return v16;
}

- (id)getSnappedPathsForVisibleRect:(id)a3 rectsToSnap:(id *)a4 rectsToSnapCount:(unint64_t)a5 observer:(id)a6
{
  id v6 = -[GEOComposedRoute getSnappedPathsForVisibleRect:rectsToSnap:rectsToSnapCount:observer:completionHandler:](self, "getSnappedPathsForVisibleRect:rectsToSnap:rectsToSnapCount:observer:completionHandler:", a4, a5, a6, 0, a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1);

  return v6;
}

- (id)getSnappedPathsForLocation:(id)a3 radius:(double)a4 observer:(id)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if (a4 >= 200.0) {
    double v10 = a4;
  }
  else {
    double v10 = 200.0;
  }
  double v32 = GEOMapRectMakeWithRadialDistance(var0, var1, v10);
  double v33 = v11;
  double v34 = v12;
  double v35 = v13;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v15 = self->_sections;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        if (v19)
        {
          [*(id *)(*((void *)&v28 + 1) + 8 * i) bounds];
          double v21 = *((double *)&v25 + 1);
          double v20 = *(double *)&v25;
          double v22 = *((double *)&v26 + 1);
          double v23 = v27;
        }
        else
        {
          long long v26 = 0u;
          double v27 = 0.0;
          double v23 = 0.0;
          double v22 = 0.0;
          double v21 = 0.0;
          double v20 = 0.0;
          long long v25 = 0u;
        }
        if (GEOMapRectIntersectsRect(v20, v21, v22, v23, v32, v33, v34, v35)) {
          [(GEOComposedRoute *)self _addSnappedPolylinePathsForSection:v19 toPaths:v14 rects:&v32 rectsCount:1];
        }
      }
      uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v16);
  }

  [(GEOComposedRoute *)self _snapPaths:v14 completionHandler:0];
  [(GEOComposedRoute *)self _addPaths:v14 forObserver:v9];

  return v14;
}

- (void)clearSnappedPathsForObserver:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_reentrant_isolate_sync();
}

void __49__GEOComposedRoute_clearSnappedPathsForObserver___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 576);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        unsigned int v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v7, "unregisterObserver:", *(void *)(a1 + 40), (void)v10)) {
          [v2 addObject:v7];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 576);
  *(void *)(v8 + 576) = v2;
}

- (void)forEachSnappedPath:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_reentrant_isolate_sync();
}

void __39__GEOComposedRoute_forEachSnappedPath___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 576);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (BOOL)isSnapping
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  geo_reentrant_isolate_sync();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __30__GEOComposedRoute_isSnapping__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 576);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * i), "isMapMatching", (void)v6))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (GEOComposedRouteTraffic)traffic
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  long long v7 = __Block_byref_object_copy__15;
  long long v8 = __Block_byref_object_dispose__15;
  id v9 = 0;
  geo_isolate_sync();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (GEOComposedRouteTraffic *)v2;
}

void __27__GEOComposedRoute_traffic__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 608) traffic];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSArray)rideSelections
{
  uint64_t v6 = 0;
  long long v7 = (id *)&v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__15;
  long long v10 = __Block_byref_object_dispose__15;
  id v11 = 0;
  geo_isolate_sync();
  id v3 = v7[5];
  if (!v3)
  {
    objc_storeStrong(v7 + 5, self->_initialRideSelections);
    id v3 = v7[5];
  }
  id v4 = v3;
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v4;
}

void __34__GEOComposedRoute_rideSelections__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 608) rideSelections];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)applyUpdatesToTransitRoute:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  if ([v28 count] && self->_suggestedRoute)
  {
    id v4 = GEOGetGEOComposedRouteLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = [(GEOComposedRoute *)self uniqueRouteID];
      *(_DWORD *)buf = 138543618;
      uint64_t v39 = (uint64_t)v5;
      __int16 v40 = 2048;
      uint64_t v41 = [v28 count];
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "%{public}@: Will apply %lu transit updates", buf, 0x16u);
    }
    os_log_t log = (os_log_t)[v28 mutableCopy];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = v28;
    uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v34 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if ([v9 status] == 1)
          {
            long long v10 = [v9 routeIdentifier];
            id v11 = [v10 clientRouteID];

            long long v12 = [(GEOComposedRoute *)self uniqueRouteID];
            char v13 = [v11 isEqual:v12];

            if (v13)
            {
              id v14 = [v9 alerts];
              transitRouteUpdateAlerts = self->_transitRouteUpdateAlerts;
              self->_transitRouteUpdateAlerts = v14;

              uint64_t v16 = [v9 displayStrings];
              transitRouteDisplayStrings = self->_transitRouteDisplayStrings;
              self->_transitRouteDisplayStrings = v16;

              uint64_t v18 = [v9 displayStrings];
              [(GEOComposedRoute *)self _initStringsForTransitRouteDisplayStrings:v18];

              id v19 = objc_alloc(MEMORY[0x1E4F1CA60]);
              double v20 = [v9 stepUpdates];
              double v21 = [v9 stepUpdates];
              double v22 = [v21 valueForKey:@"updateIdentifier"];
              double v23 = (void *)[v19 initWithObjects:v20 forKeys:v22];

              if ([v23 count])
              {
                v31[0] = MEMORY[0x1E4F143A8];
                v31[1] = 3221225472;
                v31[2] = __47__GEOComposedRoute_applyUpdatesToTransitRoute___block_invoke;
                v31[3] = &unk_1E53DDE28;
                id v32 = v23;
                [(GEOComposedRoute *)self _enumerateAllStepsWithBlock:v31];
              }
            }
            else
            {
              [log removeObject:v9];
            }
          }
          else
          {
            [log removeObject:v9];
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v6);
    }

    if ([log count])
    {
      [(GEOComposedRoute *)self _updateRevisionIdentifier];
      observers = self->_observers;
      id v25 = [log copy];
      [(GEOObserverHashTable *)observers composedRoute:self appliedTransitRouteUpdates:v25];
    }
  }
  else
  {
    GEOGetGEOComposedRouteLog();
    os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v26 = [v28 count];
      BOOL v27 = self->_suggestedRoute != 0;
      *(_DWORD *)buf = 134218240;
      uint64_t v39 = v26;
      __int16 v40 = 1026;
      LODWORD(v41) = v27;
      _os_log_impl(&dword_188D96000, log, OS_LOG_TYPE_DEBUG, "Will not apply transit updates (%lu updates, has suggested route: %{public}d", buf, 0x12u);
    }
  }
}

void __47__GEOComposedRoute_applyUpdatesToTransitRoute___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  uint64_t v6 = [v10 updateIdentifier];

  if (v6)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v10 updateIdentifier];
    id v9 = [v7 objectForKeyedSubscript:v8];

    if (v9)
    {
      [v10 updateTransitStep:v9];
      if (![*(id *)(a1 + 32) count]) {
        *a4 = 1;
      }
    }
  }
}

- (void)updateTransitRouteUpdateRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    uint64_t v5 = (GEOTransitRouteUpdateRequest *)[v4 copy];
    transitRouteUpdateRequest = self->_transitRouteUpdateRequest;
    self->_transitRouteUpdateRequest = v5;

    [(GEOTransitRouteUpdateRequest *)self->_transitRouteUpdateRequest clearRouteIdentifiers];
    uint64_t v7 = self->_transitRouteUpdateRequest;
    uint64_t v8 = +[GEOTransitRouteIdentifier routeIdentiferForComposedRoute:self];
    [(GEOTransitRouteUpdateRequest *)v7 addRouteIdentifier:v8];

    id v4 = v9;
  }
}

- (BOOL)shouldShowSchedule
{
  displayHints = self->_displayHints;
  return !displayHints || [(GEORouteDisplayHints *)displayHints showTransitSchedules];
}

- (id)getHallForStop:(id)a3
{
  id v4 = a3;
  if ([v4 hasHallIndex]
    && (unsigned int v5 = [v4 hallIndex], -[GEOTransitDecoderData hallsCount](self->_decoderData, "hallsCount") > v5))
  {
    uint64_t v6 = -[GEOTransitDecoderData hallAtIndex:](self->_decoderData, "hallAtIndex:", [v4 hallIndex]);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)getStationForHall:(id)a3
{
  id v4 = a3;
  if ([v4 hasStationIndex]
    && (unsigned int v5 = [v4 stationIndex],
        [(GEOTransitDecoderData *)self->_decoderData stationsCount] > v5))
  {
    uint64_t v6 = -[GEOTransitDecoderData stationAtIndex:](self->_decoderData, "stationAtIndex:", [v4 stationIndex]);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)getStationForStop:(id)a3
{
  id v4 = [(GEOComposedRoute *)self getHallForStop:a3];
  if (v4)
  {
    unsigned int v5 = [(GEOComposedRoute *)self getStationForHall:v4];
  }
  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (BOOL)isStopInTerminalStructure:(id)a3
{
  uint64_t v3 = [(GEOComposedRoute *)self getStationForStop:a3];
  id v4 = v3;
  if (v3) {
    int v5 = [v3 hasStructureType] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }
  if ([v4 hasStructureType])
  {
    int v6 = [v4 structureType];
    if ((v6 + 1) < 6) {
      int v5 = (0x39u >> (v6 + 1)) & 1;
    }
  }

  return v5;
}

- (GEOServerFormattedString)previewDurationFormatString
{
  previewDurationFormatString = [(GEOComposedRouteTransitDisplayStrings *)self->_transitRouteDisplayStrings previewDurationFormatString];
  id v4 = previewDurationFormatString;
  if (!previewDurationFormatString) {
    previewDurationFormatString = self->_previewDurationFormatString;
  }
  int v5 = previewDurationFormatString;

  return v5;
}

- (GEOServerFormattedString)pickingDurationFormatString
{
  pickingDurationFormatString = [(GEOComposedRouteTransitDisplayStrings *)self->_transitRouteDisplayStrings pickingDurationFormatString];
  id v4 = pickingDurationFormatString;
  if (!pickingDurationFormatString) {
    pickingDurationFormatString = self->_pickingDurationFormatString;
  }
  int v5 = pickingDurationFormatString;

  return v5;
}

- (GEOServerFormattedString)planningDescriptionFormatString
{
  planningDescriptionFormatString = [(GEOComposedRouteTransitDisplayStrings *)self->_transitRouteDisplayStrings planningDescriptionFormatString];
  id v4 = planningDescriptionFormatString;
  if (!planningDescriptionFormatString) {
    planningDescriptionFormatString = self->_planningDescriptionFormatString;
  }
  int v5 = planningDescriptionFormatString;

  return v5;
}

- (GEOServerFormattedString)transitDescriptionFormatString
{
  transitDescriptionFormatString = [(GEOComposedRouteTransitDisplayStrings *)self->_transitRouteDisplayStrings transitDescriptionFormatString];
  id v4 = transitDescriptionFormatString;
  if (!transitDescriptionFormatString) {
    transitDescriptionFormatString = self->_transitDescriptionFormatString;
  }
  int v5 = transitDescriptionFormatString;

  return v5;
}

- (GEOServerFormattedString)transitRouteBadge
{
  transitRouteBadge = [(GEOComposedRouteTransitDisplayStrings *)self->_transitRouteDisplayStrings transitRouteBadge];
  id v4 = transitRouteBadge;
  if (!transitRouteBadge) {
    transitRouteBadge = self->_transitRouteBadge;
  }
  int v5 = transitRouteBadge;

  return v5;
}

- (void)_updateRevisionIdentifier
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self->_revisionIdentifier;
  id v4 = [MEMORY[0x1E4F29128] UUID];
  revisionIdentifier = self->_revisionIdentifier;
  self->_revisionIdentifier = v4;

  int v6 = GEOGetGEOComposedRouteLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = [(GEOComposedRoute *)self uniqueRouteID];
    uint64_t v8 = self->_revisionIdentifier;
    int v9 = 138543874;
    id v10 = v7;
    __int16 v11 = 2114;
    long long v12 = v3;
    __int16 v13 = 2114;
    id v14 = v8;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: Updated revision ID %{public}@ -> %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)setRevisionIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_revisionIdentifier = &self->_revisionIdentifier;
  uint64_t v7 = self->_revisionIdentifier;
  objc_storeStrong((id *)&self->_revisionIdentifier, a3);
  uint64_t v8 = GEOGetGEOComposedRouteLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = [(GEOComposedRoute *)self uniqueRouteID];
    id v10 = *p_revisionIdentifier;
    int v11 = 138543874;
    long long v12 = v9;
    __int16 v13 = 2114;
    id v14 = v7;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: Setting revision ID %{public}@ -> %{public}@", (uint8_t *)&v11, 0x20u);
  }
}

- (BOOL)supportsRideClusters
{
  return [(GEOTransitSuggestedRoute *)self->_suggestedRoute sectionOptionsCount] != 0;
}

- (id)_nextOptionForOption:(id)a3 rideIndex:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 sectionsCount] <= a4) {
    unsigned int v7 = [v6 defaultSectionIndex];
  }
  else {
    unsigned int v7 = [v6 sectionAtIndex:a4];
  }
  if ([(GEOTransitSuggestedRoute *)self->_suggestedRoute sectionsCount] <= v7)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = -[GEOTransitSuggestedRoute sectionAtIndex:](self->_suggestedRoute, "sectionAtIndex:");
  }
  if ([v8 hasNextOptionsIndex])
  {
    int v9 = -[GEOTransitSuggestedRoute sectionOptionAtIndex:](self->_suggestedRoute, "sectionOptionAtIndex:", (int)[v8 nextOptionsIndex]);
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (unint64_t)_tripIndexForTripSegment:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(GEOComposedRoute *)self segments];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v12 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v10 == v4) {
            goto LABEL_12;
          }
          ++v7;
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:

  return v7;
}

- (id)sectionOptionForTripIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_currentSectionOptions count] <= a3)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(NSArray *)self->_currentSectionOptions objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (id)sectionOptionForTripSegment:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(GEOComposedRoute *)self _tripIndexForTripSegment:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [(GEOComposedRoute *)self sectionOptionForTripIndex:v5];
  }

  return v6;
}

- (id)boardStepForSection:(id)a3
{
  id v4 = a3;
  for (unint64_t i = 0; i < [v4 stepIndexsCount]; ++i)
  {
    unsigned int v6 = [v4 stepIndexAtIndex:i];
    unint64_t v7 = [(GEOTransitDecoderData *)self->_decoderData steps];
    if ([v7 count] <= (unint64_t)v6)
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v8 = [(GEOTransitDecoderData *)self->_decoderData steps];
      uint64_t v9 = [v8 objectAtIndex:v6];
    }
    if ([v9 maneuverType] == 3) {
      goto LABEL_9;
    }
  }
  uint64_t v9 = 0;
LABEL_9:

  return v9;
}

- (void)tripSegment:(id)a3 didSelectRide:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [(GEOComposedRoute *)self _tripIndexForTripSegment:v6];
  uint64_t v8 = [(GEOComposedRoute *)self rideSelections];
  uint64_t v9 = [v8 objectAtIndexedSubscript:v7];
  uint64_t v10 = [v9 unsignedIntegerValue];

  if (v10 != a4)
  {
    int v11 = GEOGetGEOComposedRouteLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      long long v12 = [(GEOComposedRoute *)self uniqueRouteID];
      *(_DWORD *)buf = 138543874;
      uint64_t v17 = v12;
      __int16 v18 = 2048;
      unint64_t v19 = a4;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_INFO, "%{public}@: Updating ride index %lu for trip segment %@", buf, 0x20u);
    }
    geo_isolate_sync();
    [(GEOComposedRoute *)self _rebuildRouteForRideChange];
    [(GEOComposedRoute *)self _updateRevisionIdentifier];
    long long v13 = GEOGetGEOComposedRouteLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      long long v14 = [(GEOComposedRoute *)self uniqueRouteID];
      unint64_t v15 = [(GEOObserverHashTable *)self->_observers count];
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v14;
      __int16 v18 = 2048;
      unint64_t v19 = v15;
      _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: Will notify %lu observers of updated ride index for trip segment", buf, 0x16u);
    }
    [(GEOObserverHashTable *)self->_observers composedRoute:self changedSelectedRideInClusteredSegment:v6 fromIndex:v10 toIndex:a4];
  }
}

void __46__GEOComposedRoute_tripSegment_didSelectRide___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 608) rideSelections];
  id v5 = (id)[v2 mutableCopy];

  uint64_t v3 = [NSNumber numberWithUnsignedInteger:a1[6]];
  [v5 setObject:v3 atIndexedSubscript:a1[5]];

  id v4 = (void *)[v5 copy];
  [*(id *)(a1[4] + 608) setRideSelections:v4];
}

- (void)_rebuildRouteForRideChange
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = GEOGetGEOComposedRouteLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(GEOComposedRoute *)self uniqueRouteID];
    *(_DWORD *)buf = 138543362;
    long long v12 = v4;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "%{public}@: Rebuilding route for ride change", buf, 0xCu);
  }
  id v5 = [(GEOComposedRoute *)self rideSelections];
  id v6 = +[GEOTransitRouteBuilder optionsForRideSelections:v5 forSuggestionRoute:self->_suggestedRoute];
  +[GEOTransitRouteBuilder preprocessClusteredSuggestedRoute:self->_suggestedRoute withSectionOptions:v6 andRideSelections:v5 andDecoderData:self->_decoderData];
  decoderData = self->_decoderData;
  suggestedRoute = self->_suggestedRoute;
  uint64_t v9 = [(GEORouteInitializerData *)self->_routeInitializerData waypoints];
  uint64_t v10 = +[GEOTransitRouteBuilder outputForSuggestedRoute:suggestedRoute withDecoderData:decoderData andWaypoints:v9 andArrivalParameters:0 andCustodian:self andRideSelections:v5 andSectionOptions:v6];

  [(GEOComposedRoute *)self _ingestRouteBuilderOutput:v10];
  [(GEOComposedRoute *)self _initializeManeuverDisplaySteps];
}

- (void)updateRouteWithRideSelections:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __int16 v20 = [(GEOComposedRoute *)self rideSelections];
  uint64_t v5 = [v20 count];
  if ([v4 count] | v5)
  {
    if (![v4 count] || objc_msgSend(v4, "count") != v5)
    {
      id v6 = GEOGetGEOComposedRouteLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = [(GEOComposedRoute *)self uniqueRouteID];
        *(_DWORD *)buf = 138543874;
        uint64_t v22 = v8;
        __int16 v23 = 2048;
        uint64_t v24 = v5;
        __int16 v25 = 2048;
        uint64_t v26 = [v4 count];
        _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Trying to set incorrect number of ride selections (expected %lu, received %lu)", buf, 0x20u);
      }
      goto LABEL_10;
    }
    if (v4 && [v4 isEqualToArray:v20])
    {
      id v6 = GEOGetGEOComposedRouteLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        unint64_t v7 = [(GEOComposedRoute *)self uniqueRouteID];
        *(_DWORD *)buf = 138543618;
        uint64_t v22 = v7;
        __int16 v23 = 2112;
        uint64_t v24 = (uint64_t)v4;
        _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_INFO, "%{public}@: Will not update route ride selections, already set to %@", buf, 0x16u);
      }
LABEL_10:

      goto LABEL_11;
    }
    uint64_t v9 = GEOGetGEOComposedRouteLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [(GEOComposedRoute *)self uniqueRouteID];
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v10;
      __int16 v23 = 2114;
      uint64_t v24 = (uint64_t)v4;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_INFO, "%{public}@: Updating route with ride selections: %{public}@", buf, 0x16u);
    }
    int v11 = [(GEOComposedRoute *)self segments];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      uint64_t v13 = 0;
      unint64_t v14 = 0;
      do
      {
        unint64_t v15 = [(GEOComposedRoute *)self segments];
        uint64_t v16 = [v15 objectAtIndexedSubscript:v13];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = v16;
          if (v14 < [v4 count])
          {
            __int16 v18 = [v4 objectAtIndexedSubscript:v14];
            unint64_t v19 = [v18 unsignedIntegerValue];

            if (v19 < [v17 rideOptionsCount]) {
              [v17 setSelectedRideOptionIndex:v19];
            }
            ++v14;
          }
        }
        ++v13;
      }
      while (v12 != v13);
    }
  }
LABEL_11:
}

- (id)ticketingSegmentsForSelectedRides
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v2 = [(GEOTransitSuggestedRoute *)self->_suggestedRoute sectionOptions];
  uint64_t v3 = [v2 objectAtIndex:0];

  __int16 v25 = (void *)v3;
  __int16 v20 = [(GEOComposedRoute *)self rideSelections];
  if (v3)
  {
    uint64_t v4 = 0;
    do
    {
      uint64_t v21 = v4;
      uint64_t v5 = objc_msgSend(v20, "objectAtIndexedSubscript:");
      uint64_t v24 = [v5 unsignedIntegerValue];

      id v6 = -[GEOTransitSuggestedRoute sectionAtIndex:](self->_suggestedRoute, "sectionAtIndex:", [v25 sectionAtIndex:v24]);
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v22 = v6;
      unint64_t v7 = [v6 ticketingSegments];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v28 != v9) {
              objc_enumerationMutation(v7);
            }
            int v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if ([v11 hasTicketingUrl])
            {
              uint64_t v12 = [v11 ticketingUrl];
              uint64_t v13 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
              unint64_t v14 = [v12 stringByAddingPercentEncodingWithAllowedCharacters:v13];

              unint64_t v15 = [MEMORY[0x1E4F1CB10] URLWithString:v14];
              if (v15)
              {
                uint64_t v16 = [[_GEOTransitTicketingSegment alloc] initWithSegment:v11];
                if (v16) {
                  [v26 addObject:v16];
                }
              }
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v8);
      }

      uint64_t v17 = [(GEOComposedRoute *)self _nextOptionForOption:v25 rideIndex:v24];

      uint64_t v4 = v21 + 1;
      __int16 v25 = (void *)v17;
    }
    while (v17);
  }
  __int16 v18 = objc_msgSend(v26, "copy", v4);

  return v18;
}

- (BOOL)allowsNetworkTileLoad
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRoute)initWithCoder:(id)a3
{
  uint64_t v230 = *MEMORY[0x1E4F143B8];
  id v197 = a3;
  uint64_t v4 = [(GEOComposedRoute *)self init];
  if (v4)
  {
    uint64_t v5 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_geoWaypointRoute"];
    geoWaypointRoute = v4->_geoWaypointRoute;
    v4->_geoWaypointRoute = (GEOWaypointRoute *)v5;

    uint64_t v7 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_decoderData"];
    decoderData = v4->_decoderData;
    v4->_decoderData = (GEOTransitDecoderData *)v7;

    uint64_t v9 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_suggestedRoute"];
    suggestedRoute = v4->_suggestedRoute;
    v4->_suggestedRoute = (GEOTransitSuggestedRoute *)v9;

    uint64_t v11 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_originalSuggestedRoute"];
    originalSuggestedRoute = v4->_originalSuggestedRoute;
    v4->_originalSuggestedRoute = (GEOTransitSuggestedRoute *)v11;

    v4->_usesZilch = [v197 decodeBoolForKey:@"_usesZilch"];
    v4->_source = [v197 decodeIntegerForKey:@"_source"];
    uint64_t v13 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_coordinates"];
    coordinates = v4->_coordinates;
    v4->_coordinates = (GEOComposedRouteCoordinateArray *)v13;

    uint64_t v15 = [v197 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_legs"];
    legs = v4->_legs;
    v4->_legs = (NSArray *)v15;

    long long v221 = 0u;
    long long v222 = 0u;
    long long v219 = 0u;
    long long v220 = 0u;
    uint64_t v17 = v4->_legs;
    uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v219 objects:v229 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v220;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v220 != v19) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v219 + 1) + 8 * i) setRoute:v4];
        }
        uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v219 objects:v229 count:16];
      }
      while (v18);
    }

    uint64_t v21 = [v197 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_segments"];
    segments = v4->_segments;
    v4->_segments = (NSArray *)v21;

    long long v217 = 0u;
    long long v218 = 0u;
    long long v215 = 0u;
    long long v216 = 0u;
    __int16 v23 = v4->_segments;
    uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v215 objects:v228 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v216;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v216 != v25) {
            objc_enumerationMutation(v23);
          }
          [*(id *)(*((void *)&v215 + 1) + 8 * j) setComposedRoute:v4];
        }
        uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v215 objects:v228 count:16];
      }
      while (v24);
    }

    uint64_t v27 = [v197 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_steps"];
    steps = v4->_steps;
    v4->_steps = (NSArray *)v27;

    long long v213 = 0u;
    long long v214 = 0u;
    long long v211 = 0u;
    long long v212 = 0u;
    long long v29 = v4->_steps;
    uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v211 objects:v227 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v212;
      do
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v212 != v31) {
            objc_enumerationMutation(v29);
          }
          [*(id *)(*((void *)&v211 + 1) + 8 * k) setComposedRoute:v4];
        }
        uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v211 objects:v227 count:16];
      }
      while (v30);
    }

    uint64_t v33 = [v197 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_composedGuidanceEvents"];
    composedGuidanceEvents = v4->_composedGuidanceEvents;
    v4->_composedGuidanceEvents = (NSArray *)v33;

    uint64_t v35 = [v197 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_enrouteNotices"];
    enrouteNotices = v4->_enrouteNotices;
    v4->_enrouteNotices = (NSArray *)v35;

    uint64_t v37 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_cellularCoverage"];
    cellularCoverage = v4->_cellularCoverage;
    v4->_cellularCoverage = (GEOComposedRouteCellularCoverage *)v37;

    uint64_t v39 = [v197 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_visualInfos"];
    visualInfos = v4->_visualInfos;
    v4->_visualInfos = (NSArray *)v39;

    uint64_t v41 = [v197 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_visualInfosForRouteNameLabels"];
    visualInfosForRouteNameLabels = v4->_visualInfosForRouteNameLabels;
    v4->_visualInfosForRouteNameLabels = (NSArray *)v41;

    uint64_t v43 = [v197 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_cameraInfos"];
    cameraInfos = v4->_cameraInfos;
    v4->_cameraInfos = (NSArray *)v43;

    uint64_t v45 = [MEMORY[0x1E4F1CA48] array];
    char v46 = v4->_geoWaypointRoute;
    if (v46)
    {
      long long v209 = 0u;
      long long v210 = 0u;
      long long v207 = 0u;
      long long v208 = 0u;
      char v47 = [(GEOWaypointRoute *)v46 routeLegs];
      id obj = v47;
      uint64_t v48 = [v47 countByEnumeratingWithState:&v207 objects:v226 count:16];
      if (v48)
      {
        unsigned int v200 = 0;
        uint64_t v198 = *(void *)v208;
        do
        {
          uint64_t v49 = 0;
          uint64_t v199 = v48;
          do
          {
            if (*(void *)v208 != v198) {
              objc_enumerationMutation(obj);
            }
            uint64_t v50 = *(void **)(*((void *)&v207 + 1) + 8 * v49);
            long long v203 = 0u;
            long long v204 = 0u;
            long long v205 = 0u;
            long long v206 = 0u;
            char v51 = [v50 updateLocations];
            uint64_t v52 = [v51 countByEnumeratingWithState:&v203 objects:v225 count:16];
            if (v52)
            {
              uint64_t v53 = *(void *)v204;
              do
              {
                for (uint64_t m = 0; m != v52; ++m)
                {
                  if (*(void *)v204 != v53) {
                    objc_enumerationMutation(v51);
                  }
                  uint64_t v55 = [[GEOComposedRouteETAUPosition alloc] initWithComposedRoute:v4 andUpdateLocation:*(void *)(*((void *)&v203 + 1) + 8 * m) offset:(double)v200];
                  [v45 addObject:v55];
                }
                uint64_t v52 = [v51 countByEnumeratingWithState:&v203 objects:v225 count:16];
              }
              while (v52);
            }

            v200 += [v50 distance];
            ++v49;
          }
          while (v49 != v199);
          char v47 = obj;
          uint64_t v48 = [obj countByEnumeratingWithState:&v207 objects:v226 count:16];
        }
        while (v48);
      }
    }
    uint64_t v56 = [v45 sortedArrayUsingSelector:sel_compare_];
    etauPositions = v4->_etauPositions;
    v4->_etauPositions = (NSArray *)v56;

    uint64_t v58 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    name = v4->_name;
    v4->_name = (NSString *)v58;

    uint64_t v60 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_userProvidedName"];
    userProvidedName = v4->_userProvidedName;
    v4->_userProvidedName = (NSString *)v60;

    uint64_t v62 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_userProvidedNotes"];
    userProvidedNotes = v4->_userProvidedNotes;
    v4->_userProvidedNotes = (NSString *)v62;

    uint64_t v64 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_storageID"];
    storageID = v4->_storageID;
    v4->_storageID = (NSUUID *)v64;

    uint64_t v66 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_tourIdentifier"];
    tourIdentifier = v4->_tourIdentifier;
    v4->_tourIdentifier = (GEOMapItemIdentifier *)v66;

    v4->_tourMuid = [v197 decodeInt64ForKey:@"_tourMuid"];
    v4->_mapItemMuid = [v197 decodeInt64ForKey:@"_mapItemMuid"];
    uint64_t v68 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_disclaimerText"];
    disclaimerText = v4->_disclaimerText;
    v4->_disclaimerText = (NSString *)v68;

    uint64_t v70 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_disclaimerURL"];
    disclaimerURL = v4->_disclaimerURL;
    v4->_disclaimerURL = (GEOPDURLData *)v70;

    v4->_serverIdentifier = [v197 decodeIntegerForKey:@"_serverIdentifier"];
    uint64_t v72 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_serverRouteID"];
    serverRouteID = v4->_serverRouteID;
    v4->_serverRouteID = (NSData *)v72;

    uint64_t v74 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_uniqueRouteID"];
    uniqueRouteID = v4->_uniqueRouteID;
    v4->_uniqueRouteID = (NSUUID *)v74;

    [v197 decodeDoubleForKey:@"_distance"];
    v4->_distance = v76;
    [v197 decodeDoubleForKey:@"_totalAscent"];
    v4->_totalAscent = v77;
    [v197 decodeDoubleForKey:@"_totalDescent"];
    v4->_totalDescent = v78;
    v4->_expectedTime = [v197 decodeIntegerForKey:@"_expectedTime"];
    v4->_historicTravelTime = [v197 decodeIntegerForKey:@"_historicTravelTime"];
    [v197 decodeDoubleForKey:@"_freeflowTravelTime"];
    v4->_freeflowTravelTime = v79;
    [v197 decodeDoubleForKey:@"_travelTimeAggressiveEstimate"];
    v4->_travelTimeAggressiveEstimate = v80;
    [v197 decodeDoubleForKey:@"_travelTimeConservativeEstimate"];
    v4->_travelTimeConservativeEstimate = v81;
    v4->_avoidsTolls = [v197 decodeBoolForKey:@"_avoidsTolls"];
    v4->_avoidsHighways = [v197 decodeBoolForKey:@"_avoidsHighways"];
    v4->_avoidsTraffic = [v197 decodeBoolForKey:@"_avoidsTraffic"];
    uint64_t v82 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_startDate"];
    startDate = v4->_startDate;
    v4->_startDate = (NSDate *)v82;

    v4->_isNavigable = [v197 decodeBoolForKey:@"_isNavigable"];
    v4->_transportType = [v197 decodeIntegerForKey:@"_transportType"];
    v4->_offlineRoute = [v197 decodeBoolForKey:@"_offlineRoute"];
    uint64_t v84 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_routeLabelDescriptionString"];
    routeLabelDescriptionString = v4->_routeLabelDescriptionString;
    v4->_routeLabelDescriptionString = (GEOComposedString *)v84;

    uint64_t v86 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_routeLabelDescription"];
    routeLabelDescription = v4->_routeLabelDescription;
    v4->_routeLabelDescription = (GEOServerFormattedString *)v86;

    uint64_t v88 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_routeLabelAction"];
    routeLabelAction = v4->_routeLabelAction;
    v4->_routeLabelAction = (GEOLabelAction *)v88;

    uint64_t v90 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_routeLabelArtwork"];
    routeLabelArtworuint64_t k = v4->_routeLabelArtwork;
    v4->_routeLabelArtworuint64_t k = (GEOTransitArtworkDataSource *)v90;

    uint64_t v92 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_trafficDescription"];
    trafficDescription = v4->_trafficDescription;
    v4->_trafficDescription = (NSString *)v92;

    uint64_t v94 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_trafficDescriptionArtwork"];
    trafficDescriptionArtworuint64_t k = v4->_trafficDescriptionArtwork;
    v4->_trafficDescriptionArtworuint64_t k = (GEOPBTransitArtwork *)v94;

    uint64_t v96 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_restrictionZoneInfo"];
    restrictionZoneInfo = v4->_restrictionZoneInfo;
    v4->_restrictionZoneInfo = (GEORouteRestrictionZoneInfo *)v96;

    uint64_t v98 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_infrastructureDescriptionString"];
    infrastructureDescriptionString = v4->_infrastructureDescriptionString;
    v4->_infrastructureDescriptionString = (GEOComposedString *)v98;

    uint64_t v100 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_infrastructureDescription"];
    infrastructureDescription = v4->_infrastructureDescription;
    v4->_infrastructureDescription = (GEOServerFormattedString *)v100;

    uint64_t v102 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_hikeTypeString"];
    hikeTypeString = v4->_hikeTypeString;
    v4->_hikeTypeString = (GEOComposedString *)v102;

    uint64_t v104 = [v197 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_maneuverDisplaySteps"];
    maneuverDisplaySteps = v4->_maneuverDisplaySteps;
    v4->_maneuverDisplaySteps = (NSArray *)v104;

    v4->_maneuverDisplayEnabled = [v197 decodeBoolForKey:@"_maneuverDisplayEnabled"];
    v4->_currentDisplayStep = [v197 decodeIntegerForKey:@"_currentDisplayStep"];
    v4->_unint64_t selectedSegmentIndex = [v197 decodeIntegerForKey:@"_selectedSegmentIndex"];
    v4->_firstVisiblePoint = [v197 decodeIntegerForKey:@"_firstVisiblePoint"];
    v106 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v107 = objc_opt_class();
    uint64_t v108 = objc_opt_class();
    v109 = objc_msgSend(v106, "setWithObjects:", v107, v108, objc_opt_class(), 0);
    uint64_t v110 = [v197 decodeObjectOfClasses:v109 forKey:@"_routePlanningArtworks"];
    routePlanningArtworks = v4->_routePlanningArtworks;
    v4->_routePlanningArtworks = (NSArray *)v110;

    uint64_t v112 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_transitRoutingIncidentMessage"];
    transitRoutingIncidentMessage = v4->_transitRoutingIncidentMessage;
    v4->_transitRoutingIncidentMessage = (GEOTransitRoutingIncidentMessage *)v112;

    uint64_t v114 = [v197 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_currentSectionOptions"];
    currentSectionOptions = v4->_currentSectionOptions;
    v4->_currentSectionOptions = (NSArray *)v114;

    uint64_t v116 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_displayHints"];
    displayHints = v4->_displayHints;
    v4->_displayHints = (GEORouteDisplayHints *)v116;

    uint64_t v118 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_previewDurationString"];
    previewDurationString = v4->_previewDurationString;
    v4->_previewDurationString = (GEOComposedString *)v118;

    uint64_t v120 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_pickingDurationString"];
    pickingDurationString = v4->_pickingDurationString;
    v4->_pickingDurationString = (GEOComposedString *)v120;

    uint64_t v122 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_planningDescriptionString"];
    planningDescriptionString = v4->_planningDescriptionString;
    v4->_planningDescriptionString = (GEOComposedString *)v122;

    uint64_t v124 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_planningDistanceString"];
    planningDistanceString = v4->_planningDistanceString;
    v4->_planningDistanceString = (GEOComposedString *)v124;

    uint64_t v126 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_previewDurationFormatString"];
    previewDurationFormatString = v4->_previewDurationFormatString;
    v4->_previewDurationFormatString = (GEOServerFormattedString *)v126;

    uint64_t v128 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_pickingDurationFormatString"];
    pickingDurationFormatString = v4->_pickingDurationFormatString;
    v4->_pickingDurationFormatString = (GEOServerFormattedString *)v128;

    uint64_t v130 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_planningDescriptionFormatString"];
    planningDescriptionFormatString = v4->_planningDescriptionFormatString;
    v4->_planningDescriptionFormatString = (GEOServerFormattedString *)v130;

    uint64_t v132 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_planningDistanceFormatString"];
    planningDistanceFormatString = v4->_planningDistanceFormatString;
    v4->_planningDistanceFormatString = (GEOServerFormattedString *)v132;

    uint64_t v134 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_planningSeparatorString"];
    planningSeparatorString = v4->_planningSeparatorString;
    v4->_planningSeparatorString = (NSString *)v134;

    uint64_t v136 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_transitDescriptionString"];
    transitDescriptionString = v4->_transitDescriptionString;
    v4->_transitDescriptionString = (GEOComposedString *)v136;

    uint64_t v138 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_transitDescriptionFormatString"];
    transitDescriptionFormatString = v4->_transitDescriptionFormatString;
    v4->_transitDescriptionFormatString = (GEOServerFormattedString *)v138;

    uint64_t v140 = [v197 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_advisories"];
    advisories = v4->_advisories;
    v4->_advisories = (NSArray *)v140;

    uint64_t v142 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_transitRouteBadgeString"];
    transitRouteBadgeString = v4->_transitRouteBadgeString;
    v4->_transitRouteBadgeString = (GEOComposedString *)v142;

    uint64_t v144 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_transitRouteBadge"];
    transitRouteBadge = v4->_transitRouteBadge;
    v4->_transitRouteBadge = (GEOServerFormattedString *)v144;

    [v197 decodeDoubleForKey:@"_transitUpdateInitialDelay"];
    v4->_transitUpdateInitialDelay = v146;
    v4->_isWalkingOnlyTransitRoute = [v197 decodeBoolForKey:@"_isWalkingOnlyTransitRoute"];
    uint64_t v147 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_routeInitializerData"];
    routeInitializerData = v4->_routeInitializerData;
    v4->_routeInitializerData = (GEORouteInitializerData *)v147;

    uint64_t v149 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_routeAttributes"];
    routeAttributes = v4->_routeAttributes;
    v4->_routeAttributes = (GEORouteAttributes *)v149;

    uint64_t v151 = [v197 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_stops"];
    stops = v4->_stops;
    v4->_stops = (NSArray *)v151;

    uint64_t v153 = [v197 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_stations"];
    stations = v4->_stations;
    v4->_stations = (NSArray *)v153;

    uint64_t v155 = [v197 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_halls"];
    halls = v4->_halls;
    v4->_halls = (NSArray *)v155;

    uint64_t v157 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_anchorPoints"];
    anchorPoints = v4->_anchorPoints;
    v4->_anchorPoints = (GEOComposedRouteAnchorPointList *)v157;

    uint64_t v159 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_transitRouteUpdateRequest"];
    transitRouteUpdateRequest = v4->_transitRouteUpdateRequest;
    v4->_transitRouteUpdateRequest = (GEOTransitRouteUpdateRequest *)v159;

    uint64_t v161 = [v197 decodeObjectOfClass:objc_opt_class() forKey:@"_revisionIdentifier"];
    revisionIdentifier = v4->_revisionIdentifier;
    v4->_revisionIdentifier = (NSUUID *)v161;

    v163 = v4;
    v201 = v163;
    id v164 = v197;
    v202 = v164;
    geo_isolate_sync();
    uint64_t v165 = [v164 decodeObjectOfClass:objc_opt_class() forKey:@"_directionsResponseID"];
    directionsResponseID = v163->_directionsResponseID;
    v163->_directionsResponseID = (NSData *)v165;

    uint64_t v167 = [v164 decodeObjectOfClass:objc_opt_class() forKey:@"_etauResponseID"];
    etauResponseID = v163->_etauResponseID;
    v163->_etauResponseID = (NSData *)v167;

    v163->_indexInResponse = [v164 decodeIntegerForKey:@"_indexInResponse"];
    uint64_t v169 = [v164 decodeObjectOfClass:objc_opt_class() forKey:@"_elevationProfile"];
    elevationProfile = v163->_elevationProfile;
    v163->_elevationProfile = (GEOElevationProfile *)v169;

    v163->_initialPromptTypes = [v164 decodeIntegerForKey:@"_initialPromptTypes"];
    v163->_elevationModel = [v164 decodeIntegerForKey:@"_elevationModel"];
    v171 = v4->_suggestedRoute;
    if (v171) {
      +[GEOTransitRouteBuilder buildRouteSectionsForSuggestedRoute:v171 fromSteps:v4->_steps andSegments:v4->_segments andCoordinates:v4->_coordinates andDecoderData:v4->_decoderData];
    }
    else {
    uint64_t v172 = +[GEORouteBuilder buildPointSectionsWithSteps:v4->_steps segments:v4->_segments coordinates:v4->_coordinates];
    }
    sections = v163->_sections;
    v163->_sections = (NSArray *)v172;

    uint64_t v175 = +[GEORouteBuilder buildMapRegionFromPointSections:v163->_sections];
    boundingMapRegion = v163->_boundingMapRegion;
    v163->_boundingMapRegion = (GEOMapRegion *)v175;

    uint64_t v177 = [v164 decodeObjectOfClass:objc_opt_class() forKey:@"_styleAttributes"];
    styleAttributes = v163->_styleAttributes;
    v163->_styleAttributes = (GEOStyleAttributes *)v177;

    uint64_t v179 = [v164 decodeObjectOfClass:objc_opt_class() forKey:@"_address"];
    address = v163->_address;
    v163->_address = (GEOAddressObject *)v179;

    v181 = [(NSArray *)v4->_legs firstObject];
    v182 = [v181 origin];
    if (v182)
    {
      v183 = [(NSArray *)v4->_legs lastObject];
      v184 = [v183 destination];
      BOOL v185 = v184 == 0;

      if (!v185)
      {
        v186 = [v164 error];
        v187 = v186;
        if (v186)
        {
          v188 = [v186 userInfo];
          v189 = [v188 objectForKeyedSubscript:*MEMORY[0x1E4F28228]];

          v190 = GEOGetGEOComposedRouteLog();
          if (os_log_type_enabled(v190, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v224 = v189;
            _os_log_impl(&dword_188D96000, v190, OS_LOG_TYPE_ERROR, "Error decoding GEOComposedRoute: %@", buf, 0xCu);
          }

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v224 = v189;
            _os_log_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Error decoding GEOComposedRoute: %@", buf, 0xCu);
          }
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: NO", buf, 2u);
          }
        }
        v173 = v163;
LABEL_58:

        goto LABEL_59;
      }
    }
    else
    {
    }
    v187 = GEOGetGEOComposedRouteLog();
    if (os_log_type_enabled(v187, OS_LOG_TYPE_ERROR))
    {
      v191 = [(NSArray *)v4->_legs firstObject];
      v192 = [v191 origin];
      v193 = [(NSArray *)v4->_legs lastObject];
      v194 = [v193 destination];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v224 = v192 != 0;
      *(_WORD *)&v224[4] = 1024;
      *(_DWORD *)&v224[6] = v194 != 0;
      _os_log_impl(&dword_188D96000, v187, OS_LOG_TYPE_ERROR, "GEOComposedRoute was deserialized without a proper origin and destination. This is either an error with the decoder or the incoming serialized data. Origin: %d, Destination: %d", buf, 0xEu);
    }
    v173 = 0;
    goto LABEL_58;
  }
  v173 = 0;
LABEL_59:

  return v173;
}

void __34__GEOComposedRoute_initWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) decodeObjectOfClass:objc_opt_class() forKey:@"_mutableData"];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 608);
  *(void *)(v3 + 608) = v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = self->_encodeIsolater;
  _geo_isolate_lock();
  [v4 encodeObject:self->_geoWaypointRoute forKey:@"_geoWaypointRoute"];
  [v4 encodeObject:self->_decoderData forKey:@"_decoderData"];
  [v4 encodeObject:self->_suggestedRoute forKey:@"_suggestedRoute"];
  [v4 encodeObject:self->_originalSuggestedRoute forKey:@"_originalSuggestedRoute"];
  [v4 encodeBool:self->_usesZilch forKey:@"_usesZilch"];
  [v4 encodeInteger:self->_source forKey:@"_source"];
  [v4 encodeObject:self->_coordinates forKey:@"_coordinates"];
  [v4 encodeObject:self->_legs forKey:@"_legs"];
  [v4 encodeObject:self->_segments forKey:@"_segments"];
  [v4 encodeObject:self->_steps forKey:@"_steps"];
  [v4 encodeObject:self->_composedGuidanceEvents forKey:@"_composedGuidanceEvents"];
  [v4 encodeObject:self->_enrouteNotices forKey:@"_enrouteNotices"];
  [v4 encodeObject:self->_cellularCoverage forKey:@"_cellularCoverage"];
  [v4 encodeObject:self->_visualInfos forKey:@"_visualInfos"];
  [v4 encodeObject:self->_visualInfosForRouteNameLabels forKey:@"_visualInfosForRouteNameLabels"];
  [v4 encodeObject:self->_cameraInfos forKey:@"_cameraInfos"];
  [v4 encodeObject:self->_name forKey:@"_name"];
  [v4 encodeObject:self->_userProvidedName forKey:@"_userProvidedName"];
  [v4 encodeObject:self->_userProvidedNotes forKey:@"_userProvidedNotes"];
  [v4 encodeObject:self->_storageID forKey:@"_storageID"];
  [v4 encodeObject:self->_tourIdentifier forKey:@"_tourIdentifier"];
  [v4 encodeInt64:self->_tourMuid forKey:@"_tourMuid"];
  [v4 encodeInt64:self->_mapItemMuid forKey:@"_mapItemMuid"];
  [v4 encodeObject:self->_disclaimerText forKey:@"_disclaimerText"];
  [v4 encodeObject:self->_disclaimerURL forKey:@"_disclaimerURL"];
  [v4 encodeInteger:self->_serverIdentifier forKey:@"_serverIdentifier"];
  [v4 encodeObject:self->_serverRouteID forKey:@"_serverRouteID"];
  [v4 encodeObject:self->_uniqueRouteID forKey:@"_uniqueRouteID"];
  [v4 encodeDouble:@"_distance" forKey:self->_distance];
  [v4 encodeDouble:@"_totalAscent" forKey:self->_totalAscent];
  [v4 encodeDouble:@"_totalDescent" forKey:self->_totalDescent];
  [v4 encodeInteger:self->_expectedTime forKey:@"_expectedTime"];
  [v4 encodeInteger:self->_historicTravelTime forKey:@"_historicTravelTime"];
  [v4 encodeDouble:@"_freeflowTravelTime" forKey:self->_freeflowTravelTime];
  [v4 encodeDouble:@"_travelTimeAggressiveEstimate" forKey:self->_travelTimeAggressiveEstimate];
  [v4 encodeDouble:@"_travelTimeConservativeEstimate" forKey:self->_travelTimeConservativeEstimate];
  [v4 encodeBool:self->_avoidsTolls forKey:@"_avoidsTolls"];
  [v4 encodeBool:self->_avoidsHighways forKey:@"_avoidsHighways"];
  [v4 encodeBool:self->_avoidsTraffic forKey:@"_avoidsTraffic"];
  [v4 encodeObject:self->_startDate forKey:@"_startDate"];
  [v4 encodeBool:self->_isNavigable forKey:@"_isNavigable"];
  [v4 encodeInteger:self->_transportType forKey:@"_transportType"];
  [v4 encodeBool:self->_offlineRoute forKey:@"_offlineRoute"];
  [v4 encodeObject:self->_routeLabelDescriptionString forKey:@"_routeLabelDescriptionString"];
  [v4 encodeObject:self->_routeLabelAction forKey:@"_routeLabelAction"];
  [v4 encodeObject:self->_routeLabelDescription forKey:@"_routeLabelDescription"];
  [v4 encodeObject:self->_routeLabelArtwork forKey:@"_routeLabelArtwork"];
  [v4 encodeObject:self->_trafficDescription forKey:@"_trafficDescription"];
  [v4 encodeObject:self->_trafficDescriptionArtwork forKey:@"_trafficDescriptionArtwork"];
  [v4 encodeObject:self->_restrictionZoneInfo forKey:@"_restrictionZoneInfo"];
  [v4 encodeObject:self->_infrastructureDescriptionString forKey:@"_infrastructureDescriptionString"];
  [v4 encodeObject:self->_infrastructureDescription forKey:@"_infrastructureDescription"];
  [v4 encodeObject:self->_hikeTypeString forKey:@"_hikeTypeString"];
  [v4 encodeObject:self->_maneuverDisplaySteps forKey:@"_maneuverDisplaySteps"];
  [v4 encodeBool:self->_maneuverDisplayEnabled forKey:@"_maneuverDisplayEnabled"];
  [v4 encodeInteger:self->_currentDisplayStep forKey:@"_currentDisplayStep"];
  [v4 encodeInteger:self->_selectedSegmentIndex forKey:@"_selectedSegmentIndex"];
  [v4 encodeInteger:self->_firstVisiblePoint forKey:@"_firstVisiblePoint"];
  [v4 encodeObject:self->_routePlanningArtworks forKey:@"_routePlanningArtworks"];
  [v4 encodeObject:self->_transitRoutingIncidentMessage forKey:@"_transitRoutingIncidentMessage"];
  [v4 encodeObject:self->_currentSectionOptions forKey:@"_currentSectionOptions"];
  [v4 encodeObject:self->_displayHints forKey:@"_displayHints"];
  [v4 encodeObject:self->_previewDurationString forKey:@"_previewDurationString"];
  [v4 encodeObject:self->_pickingDurationString forKey:@"_pickingDurationString"];
  [v4 encodeObject:self->_planningDescriptionString forKey:@"_planningDescriptionString"];
  [v4 encodeObject:self->_planningDistanceString forKey:@"_planningDistanceString"];
  [v4 encodeObject:self->_previewDurationFormatString forKey:@"_previewDurationFormatString"];
  [v4 encodeObject:self->_pickingDurationFormatString forKey:@"_pickingDurationFormatString"];
  [v4 encodeObject:self->_planningDescriptionFormatString forKey:@"_planningDescriptionFormatString"];
  [v4 encodeObject:self->_planningDistanceFormatString forKey:@"_planningDistanceFormatString"];
  [v4 encodeObject:self->_planningSeparatorString forKey:@"_planningSeparatorString"];
  [v4 encodeObject:self->_transitDescriptionString forKey:@"_transitDescriptionString"];
  [v4 encodeObject:self->_transitDescriptionFormatString forKey:@"_transitDescriptionFormatString"];
  [v4 encodeObject:self->_advisories forKey:@"_advisories"];
  [v4 encodeObject:self->_transitRouteBadgeString forKey:@"_transitRouteBadgeString"];
  [v4 encodeObject:self->_transitRouteBadge forKey:@"_transitRouteBadge"];
  [v4 encodeDouble:@"_transitUpdateInitialDelay" forKey:self->_transitUpdateInitialDelay];
  [v4 encodeBool:self->_isWalkingOnlyTransitRoute forKey:@"_isWalkingOnlyTransitRoute"];
  [v4 encodeObject:self->_routeInitializerData forKey:@"_routeInitializerData"];
  [v4 encodeObject:self->_routeAttributes forKey:@"_routeAttributes"];
  [v4 encodeObject:self->_stops forKey:@"_stops"];
  [v4 encodeObject:self->_stations forKey:@"_stations"];
  [v4 encodeObject:self->_halls forKey:@"_halls"];
  [v4 encodeObject:self->_anchorPoints forKey:@"_anchorPoints"];
  [v4 encodeObject:self->_transitRouteUpdateRequest forKey:@"_transitRouteUpdateRequest"];
  [v4 encodeObject:self->_revisionIdentifier forKey:@"_revisionIdentifier"];
  id v5 = v4;
  geo_isolate_sync();
  [v5 encodeObject:self->_directionsResponseID forKey:@"_directionsResponseID"];
  [v5 encodeObject:self->_etauResponseID forKey:@"_etauResponseID"];
  [v5 encodeInteger:self->_indexInResponse forKey:@"_indexInResponse"];
  [v5 encodeObject:self->_elevationProfile forKey:@"_elevationProfile"];
  [v5 encodeObject:self->_styleAttributes forKey:@"_styleAttributes"];
  [v5 encodeObject:self->_address forKey:@"_address"];
  [v5 encodeInteger:self->_initialPromptTypes forKey:@"_initialPromptTypes"];
  [v5 encodeInteger:self->_elevationModel forKey:@"_elevationModel"];

  _geo_isolate_unlock();
}

uint64_t __36__GEOComposedRoute_encodeWithCoder___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 608) forKey:@"_mutableData"];
}

- (unsigned)laneCountAtRouteCoordinate:(PolylineCoordinate)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  __int16 v23 = [MEMORY[0x1E4F1CA48] array];
  [v23 addObjectsFromArray:self->_cameraInfos];
  id v5 = [(GEOComposedRoute *)self mutableData];
  id v6 = [v5 updateableCameraInfos];
  [v23 addObjectsFromArray:v6];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v23;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v29;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v12 = [v11 laneChangeInfos];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (!v13) {
          goto LABEL_21;
        }
        uint64_t v14 = *(void *)v25;
        while (2)
        {
          for (uint64_t j = 0; j != v13; ++j)
          {
            if (*(void *)v25 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = *(void **)(*((void *)&v24 + 1) + 8 * j);
            uint64_t v17 = [v16 routeCoordinateRange];
            if (v17 == a3.index)
            {
              LODWORD(v20) = HIDWORD(v17);
              if (*((float *)&v17 + 1) > a3.offset) {
                continue;
              }
            }
            else if (v17 >= a3.index)
            {
              continue;
            }
            if (a3.index == v18)
            {
              *(float *)&double v20 = v19;
              if (a3.offset <= v19) {
                goto LABEL_24;
              }
            }
            else if (a3.index < v18)
            {
LABEL_24:
              unsigned int v21 = [v16 laneCount];

              goto LABEL_26;
            }
          }
          uint64_t v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16, v20);
          if (v13) {
            continue;
          }
          break;
        }
LABEL_21:
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
      unsigned int v21 = 0;
      if (!v8) {
        goto LABEL_26;
      }
    }
  }
  unsigned int v21 = 0;
LABEL_26:

  return v21;
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = NSString;
  id v5 = [(GEOComposedRoute *)self name];
  uint64_t v6 = [(GEOComposedRoute *)self transportType];
  if (v6 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = off_1E53DDE48[(int)v6];
  }
  uint64_t v8 = [(__CFString *)v7 capitalizedString];
  uint64_t v9 = [(GEOComposedRoute *)self uniqueRouteID];
  uint64_t v10 = [v4 stringWithFormat:@"%@ - %@ - %@", v5, v8, v9];
  [v3 addObject:v10];

  uint64_t v11 = NSString;
  [(GEOComposedRoute *)self distance];
  uint64_t v13 = [v11 stringWithFormat:@"  %0.1f meters, %d seconds (%0.1f minutes)", v12, -[GEOComposedRoute expectedTime](self, "expectedTime"), (double)-[GEOComposedRoute expectedTime](self, "expectedTime") / 60.0];
  [v3 addObject:v13];

  uint64_t v14 = NSString;
  uint64_t v15 = [(GEOComposedRoute *)self pointCount];
  uint64_t v16 = [(GEOComposedRoute *)self steps];
  uint64_t v17 = [v16 count];
  unsigned int v18 = [(GEOComposedRoute *)self segments];
  uint64_t v19 = [v18 count];
  double v20 = [(GEOComposedRoute *)self legs];
  unsigned int v21 = [v14 stringWithFormat:@"  %d coordinates, %d steps, %d segment(s), %d leg(s)", v15, v17, v19, objc_msgSend(v20, "count")];
  [v3 addObject:v21];

  if ([(GEOComposedRoute *)self transportType] == 1)
  {
    uint64_t v22 = NSString;
    __int16 v23 = [(GEOComposedRoute *)self stops];
    uint64_t v24 = [v23 count];
    long long v25 = [(GEOComposedRoute *)self halls];
    uint64_t v26 = [v25 count];
    long long v27 = [(GEOComposedRoute *)self stations];
    long long v28 = [v22 stringWithFormat:@"  %d stops, %d halls, %d stations", v24, v26, objc_msgSend(v27, "count")];
    [v3 addObject:v28];
  }
  long long v29 = [v3 componentsJoinedByString:@"\n"];

  return (NSString *)v29;
}

- (NSString)debugDescription
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithString:@"GEOComposedRoute:\n"];
  id v4 = [(GEOComposedRoute *)self name];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = [(GEOComposedRoute *)self name];
    [v3 appendFormat:@"%@ | ", v6];
  }
  uint64_t v7 = [(GEOComposedRoute *)self transportType];
  if (v7 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v7);
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = off_1E53DDE48[(int)v7];
  }
  uint64_t v9 = [(GEOComposedRoute *)self uniqueRouteID];
  [v3 appendFormat:@"%@ | %@\n", v8, v9];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = self->_legs;
  uint64_t v38 = [(NSArray *)obj countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v58 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        [v3 appendFormat:@"%@\n", v10];
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        __int16 v40 = self->_segments;
        uint64_t v11 = [(NSArray *)v40 countByEnumeratingWithState:&v53 objects:v64 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v54;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v54 != v12) {
                objc_enumerationMutation(v40);
              }
              uint64_t v14 = *(void **)(*((void *)&v53 + 1) + 8 * j);
              uint64_t v15 = [v10 startRouteCoordinate];
              uint64_t v16 = [v14 startRouteCoordinate];
              if (v15 == v16)
              {
                LODWORD(v17) = HIDWORD(v16);
                LODWORD(v18) = HIDWORD(v15);
                if (*((float *)&v15 + 1) > *((float *)&v16 + 1)) {
                  continue;
                }
              }
              else if (v15 >= v16)
              {
                continue;
              }
              uint64_t v19 = objc_msgSend(v14, "endRouteCoordinate", v17, v18);
              uint64_t v20 = [v10 endRouteCoordinate];
              if (v19 == v20)
              {
                LODWORD(v17) = HIDWORD(v20);
                LODWORD(v18) = HIDWORD(v19);
                if (*((float *)&v19 + 1) > *((float *)&v20 + 1)) {
                  continue;
                }
              }
              else if (v19 >= v20)
              {
                continue;
              }
              [v3 appendFormat:@"    %@\n", v17, v18, v14];
              for (unint64_t k = [v14 startStepIndex]; k <= objc_msgSend(v14, "endStepIndex"); ++k)
              {
                uint64_t v22 = [(NSArray *)self->_steps objectAtIndexedSubscript:k];
                [v3 appendFormat:@"        %@\n", v22];
              }
            }
            uint64_t v11 = -[NSArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v53, v64, 16, v17, v18);
          }
          while (v11);
        }
      }
      uint64_t v38 = [(NSArray *)obj countByEnumeratingWithState:&v57 objects:v65 count:16];
    }
    while (v38);
  }

  [v3 appendFormat:@"\nPoints (%d)\n%@\n", -[GEOComposedRoute pointCount](self, "pointCount"), self->_coordinates];
  if (self->_transportType == 1)
  {
    objc_msgSend(v3, "appendFormat:", @"\nStations (%d)\n", -[NSArray count](self->_stations, "count"));
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    __int16 v23 = self->_stations;
    uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v49 objects:v63 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v50;
      do
      {
        for (uint64_t m = 0; m != v24; ++m)
        {
          if (*(void *)v50 != v25) {
            objc_enumerationMutation(v23);
          }
          [v3 appendFormat:@"%@\n", *(void *)(*((void *)&v49 + 1) + 8 * m)];
        }
        uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v49 objects:v63 count:16];
      }
      while (v24);
    }

    objc_msgSend(v3, "appendFormat:", @"\nStops (%d)\n", -[NSArray count](self->_stops, "count"));
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v27 = self->_stops;
    uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v45 objects:v62 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v46;
      do
      {
        for (uint64_t n = 0; n != v28; ++n)
        {
          if (*(void *)v46 != v29) {
            objc_enumerationMutation(v27);
          }
          [v3 appendFormat:@"%@\n", *(void *)(*((void *)&v45 + 1) + 8 * n)];
        }
        uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v45 objects:v62 count:16];
      }
      while (v28);
    }

    objc_msgSend(v3, "appendFormat:", @"\nHalls (%d)\n", -[NSArray count](self->_halls, "count"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v31 = self->_halls;
    uint64_t v32 = [(NSArray *)v31 countByEnumeratingWithState:&v41 objects:v61 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v42;
      do
      {
        for (iuint64_t i = 0; ii != v32; ++ii)
        {
          if (*(void *)v42 != v33) {
            objc_enumerationMutation(v31);
          }
          [v3 appendFormat:@"%@\n", *(void *)(*((void *)&v41 + 1) + 8 * ii)];
        }
        uint64_t v32 = [(NSArray *)v31 countByEnumeratingWithState:&v41 objects:v61 count:16];
      }
      while (v32);
    }
  }

  return (NSString *)v3;
}

- (GEOWaypointRoute)geoWaypointRoute
{
  return self->_geoWaypointRoute;
}

- (unint64_t)serverIdentifier
{
  return self->_serverIdentifier;
}

- (NSUUID)uniqueRouteID
{
  return self->_uniqueRouteID;
}

- (void)setUniqueRouteID:(id)a3
{
}

- (unint64_t)source
{
  return self->_source;
}

- (unint64_t)currentDisplayStep
{
  return self->_currentDisplayStep;
}

- (BOOL)maneuverDisplayEnabled
{
  return self->_maneuverDisplayEnabled;
}

- (void)setManeuverDisplayEnabled:(BOOL)a3
{
  self->_maneuverDisplayEnabled = a3;
}

- (NSArray)maneuverDisplaySteps
{
  return self->_maneuverDisplaySteps;
}

- (unsigned)firstVisiblePoint
{
  return self->_firstVisiblePoint;
}

- (void)setFirstVisiblePoint:(unsigned int)a3
{
  self->_firstVisiblePoint = a3;
}

- (unint64_t)selectedSegmentIndex
{
  return self->_selectedSegmentIndex;
}

- (BOOL)usesZilch
{
  return self->_usesZilch;
}

- (NSArray)steps
{
  return self->_steps;
}

- (NSArray)segments
{
  return self->_segments;
}

- (NSArray)legs
{
  return self->_legs;
}

- (GEOComposedRouteAnchorPointList)anchorPoints
{
  return self->_anchorPoints;
}

- (NSArray)composedGuidanceEvents
{
  return self->_composedGuidanceEvents;
}

- (NSArray)enrouteNotices
{
  return self->_enrouteNotices;
}

- (NSArray)visualInfos
{
  return self->_visualInfos;
}

- (NSArray)visualInfosForRouteNameLabels
{
  return self->_visualInfosForRouteNameLabels;
}

- (NSArray)cameraInfos
{
  return self->_cameraInfos;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)userProvidedName
{
  return self->_userProvidedName;
}

- (NSString)userProvidedNotes
{
  return self->_userProvidedNotes;
}

- (NSUUID)storageID
{
  return self->_storageID;
}

- (GEOMapItemIdentifier)tourIdentifier
{
  return self->_tourIdentifier;
}

- (unint64_t)tourMuid
{
  return self->_tourMuid;
}

- (unint64_t)mapItemMuid
{
  return self->_mapItemMuid;
}

- (NSString)disclaimerText
{
  return self->_disclaimerText;
}

- (GEOPDURLData)disclaimerURL
{
  return self->_disclaimerURL;
}

- (NSData)serverRouteID
{
  return self->_serverRouteID;
}

- (void)setServerRouteID:(id)a3
{
}

- (double)distance
{
  return self->_distance;
}

- (double)totalAscent
{
  return self->_totalAscent;
}

- (double)totalDescent
{
  return self->_totalDescent;
}

- (unsigned)expectedTime
{
  return self->_expectedTime;
}

- (unsigned)historicTravelTime
{
  return self->_historicTravelTime;
}

- (double)freeflowTravelTime
{
  return self->_freeflowTravelTime;
}

- (double)travelTimeAggressiveEstimate
{
  return self->_travelTimeAggressiveEstimate;
}

- (double)travelTimeConservativeEstimate
{
  return self->_travelTimeConservativeEstimate;
}

- (GEOServerFormattedString)routeLabelDescription
{
  return self->_routeLabelDescription;
}

- (GEOTransitArtworkDataSource)routeLabelArtwork
{
  return self->_routeLabelArtwork;
}

- (NSString)trafficDescription
{
  return self->_trafficDescription;
}

- (GEOPBTransitArtwork)trafficDescriptionArtwork
{
  return self->_trafficDescriptionArtwork;
}

- (GEORouteRestrictionZoneInfo)restrictionZoneInfo
{
  return self->_restrictionZoneInfo;
}

- (GEOComposedString)infrastructureDescriptionString
{
  return self->_infrastructureDescriptionString;
}

- (GEOServerFormattedString)infrastructureDescription
{
  return self->_infrastructureDescription;
}

- (GEOComposedString)hikeTypeString
{
  return self->_hikeTypeString;
}

- (BOOL)avoidsTolls
{
  return self->_avoidsTolls;
}

- (BOOL)avoidsHighways
{
  return self->_avoidsHighways;
}

- (BOOL)avoidsTraffic
{
  return self->_avoidsTraffic;
}

- (NSArray)sections
{
  return self->_sections;
}

- (GEOMapRegion)boundingMapRegion
{
  return self->_boundingMapRegion;
}

- (GEOTransitSuggestedRoute)suggestedRoute
{
  return self->_suggestedRoute;
}

- (void)setSuggestedRoute:(id)a3
{
}

- (GEOTransitSuggestedRoute)originalSuggestedRoute
{
  return self->_originalSuggestedRoute;
}

- (NSArray)routePlanningArtworks
{
  return self->_routePlanningArtworks;
}

- (GEOTransitRoutingIncidentMessage)transitRoutingIncidentMessage
{
  return self->_transitRoutingIncidentMessage;
}

- (GEORouteDisplayHints)displayHints
{
  return self->_displayHints;
}

- (GEOComposedString)routeLabelDescriptionString
{
  return self->_routeLabelDescriptionString;
}

- (GEOLabelAction)routeLabelAction
{
  return self->_routeLabelAction;
}

- (GEOComposedString)previewDurationString
{
  return self->_previewDurationString;
}

- (GEOComposedString)pickingDurationString
{
  return self->_pickingDurationString;
}

- (GEOComposedString)planningDescriptionString
{
  return self->_planningDescriptionString;
}

- (GEOComposedString)planningDistanceString
{
  return self->_planningDistanceString;
}

- (GEOServerFormattedString)planningDistanceFormatString
{
  return self->_planningDistanceFormatString;
}

- (NSString)planningSeparatorString
{
  return self->_planningSeparatorString;
}

- (GEOComposedString)transitDescriptionString
{
  return self->_transitDescriptionString;
}

- (NSArray)advisories
{
  return self->_advisories;
}

- (GEOComposedString)transitRouteBadgeString
{
  return self->_transitRouteBadgeString;
}

- (BOOL)isWalkingOnlyTransitRoute
{
  return self->_isWalkingOnlyTransitRoute;
}

- (double)transitUpdateInitialDelay
{
  return self->_transitUpdateInitialDelay;
}

- (void)setTransitUpdateInitialDelay:(double)a3
{
  self->_transitUpdateInitialDelay = a3;
}

- (NSData)directionsResponseID
{
  return self->_directionsResponseID;
}

- (NSData)etauResponseID
{
  return self->_etauResponseID;
}

- (unint64_t)indexInResponse
{
  return self->_indexInResponse;
}

- (BOOL)isNavigable
{
  return self->_isNavigable;
}

- (int)transportType
{
  return self->_transportType;
}

- (GEOStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (GEOAddressObject)address
{
  return self->_address;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (GEOElevationProfile)elevationProfile
{
  return self->_elevationProfile;
}

- (void)setTransitPaymentMethods:(id)a3
{
}

- (NSArray)stations
{
  return self->_stations;
}

- (NSArray)stops
{
  return self->_stops;
}

- (NSArray)halls
{
  return self->_halls;
}

- (GEOTransitRouteUpdateRequest)transitRouteUpdateRequest
{
  return self->_transitRouteUpdateRequest;
}

- (NSUUID)revisionIdentifier
{
  return self->_revisionIdentifier;
}

- (NSArray)etauPositions
{
  return self->_etauPositions;
}

- (BOOL)isOfflineRoute
{
  return self->_offlineRoute;
}

- (int)elevationModel
{
  return self->_elevationModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitRouteUpdateRequest, 0);
  objc_storeStrong((id *)&self->_transitPaymentMethods, 0);
  objc_storeStrong((id *)&self->_transitRouteBadgeString, 0);
  objc_storeStrong((id *)&self->_transitDescriptionString, 0);
  objc_storeStrong((id *)&self->_planningDistanceString, 0);
  objc_storeStrong((id *)&self->_planningDescriptionString, 0);
  objc_storeStrong((id *)&self->_pickingDurationString, 0);
  objc_storeStrong((id *)&self->_previewDurationString, 0);
  objc_storeStrong((id *)&self->_routeLabelAction, 0);
  objc_storeStrong((id *)&self->_routeLabelDescriptionString, 0);
  objc_storeStrong((id *)&self->_hikeTypeString, 0);
  objc_storeStrong((id *)&self->_infrastructureDescriptionString, 0);
  objc_storeStrong((id *)&self->_disclaimerURL, 0);
  objc_storeStrong((id *)&self->_disclaimerText, 0);
  objc_storeStrong((id *)&self->_tourIdentifier, 0);
  objc_storeStrong((id *)&self->_storageID, 0);
  objc_storeStrong((id *)&self->_userProvidedNotes, 0);
  objc_storeStrong((id *)&self->_userProvidedName, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_maneuverDisplaySteps, 0);
  objc_storeStrong((id *)&self->_encodeIsolater, 0);
  objc_storeStrong((id *)&self->_mutableData, 0);
  objc_storeStrong((id *)&self->_mutableDataLock, 0);
  objc_storeStrong((id *)&self->_snappedRoutesIsolater, 0);
  objc_storeStrong((id *)&self->_zilchDecoder, 0);
  objc_storeStrong((id *)&self->_snappedPaths, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_transitRouteDisplayStrings, 0);
  objc_storeStrong((id *)&self->_transitRouteUpdateAlerts, 0);
  objc_storeStrong((id *)&self->_ticketedSegments, 0);
  objc_storeStrong((id *)&self->_transitRouteBadge, 0);
  objc_storeStrong((id *)&self->_displayHints, 0);
  objc_storeStrong((id *)&self->_currentSectionOptions, 0);
  objc_storeStrong((id *)&self->_initialRideSelections, 0);
  objc_storeStrong((id *)&self->_transitRoutingIncidentMessage, 0);
  objc_storeStrong((id *)&self->_routePlanningArtworks, 0);
  objc_storeStrong((id *)&self->_cameraInfos, 0);
  objc_storeStrong((id *)&self->_visualInfosForRouteNameLabels, 0);
  objc_storeStrong((id *)&self->_visualInfos, 0);
  objc_storeStrong((id *)&self->_cellularCoverage, 0);
  objc_storeStrong((id *)&self->_elevationProfile, 0);
  objc_storeStrong((id *)&self->_restrictionZoneInfo, 0);
  objc_storeStrong((id *)&self->_advisories, 0);
  objc_storeStrong((id *)&self->_etauPositions, 0);
  objc_storeStrong((id *)&self->_enrouteNotices, 0);
  objc_storeStrong((id *)&self->_composedGuidanceEvents, 0);
  objc_storeStrong((id *)&self->_anchorPoints, 0);
  objc_storeStrong((id *)&self->_stations, 0);
  objc_storeStrong((id *)&self->_halls, 0);
  objc_storeStrong((id *)&self->_stops, 0);
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_legs, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_boundingMapRegion, 0);
  objc_storeStrong((id *)&self->_coordinates, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_transitDescriptionFormatString, 0);
  objc_storeStrong((id *)&self->_planningSeparatorString, 0);
  objc_storeStrong((id *)&self->_planningDistanceFormatString, 0);
  objc_storeStrong((id *)&self->_planningDescriptionFormatString, 0);
  objc_storeStrong((id *)&self->_pickingDurationFormatString, 0);
  objc_storeStrong((id *)&self->_previewDurationFormatString, 0);
  objc_storeStrong((id *)&self->_infrastructureDescription, 0);
  objc_storeStrong((id *)&self->_routeLabelArtwork, 0);
  objc_storeStrong((id *)&self->_routeLabelDescription, 0);
  objc_storeStrong((id *)&self->_trafficDescriptionArtwork, 0);
  objc_storeStrong((id *)&self->_trafficDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_revisionIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueRouteID, 0);
  objc_storeStrong((id *)&self->_etauResponseID, 0);
  objc_storeStrong((id *)&self->_directionsResponseID, 0);
  objc_storeStrong((id *)&self->_serverRouteID, 0);
  objc_storeStrong((id *)&self->_originalSuggestedRoute, 0);
  objc_storeStrong((id *)&self->_suggestedRoute, 0);
  objc_storeStrong((id *)&self->_decoderData, 0);
  objc_storeStrong((id *)&self->_routeInitializerData, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);

  objc_storeStrong((id *)&self->_geoWaypointRoute, 0);
}

- (double)distanceFromStartToIndex:(unint64_t)a3
{
  id v4 = [(GEOComposedRoute *)self coordinates];
  [v4 distanceFromStartToIndex:a3];
  double v6 = v5;

  return v6;
}

- (double)distanceToEndFromIndex:(unint64_t)a3
{
  id v4 = [(GEOComposedRoute *)self coordinates];
  [v4 distanceToEndFromIndex:a3];
  double v6 = v5;

  return v6;
}

- (double)distanceBetweenIndex:(unint64_t)a3 andIndex:(unint64_t)a4
{
  double v6 = [(GEOComposedRoute *)self coordinates];
  [v6 distanceBetweenIndex:a3 andIndex:a4];
  double v8 = v7;

  return v8;
}

- (double)distanceFromStartToRouteCoordinate:(id)a3
{
  id v4 = [(GEOComposedRoute *)self coordinates];
  [v4 distanceFromStartToRouteCoordinate:a3];
  double v6 = v5;

  return v6;
}

- (double)distanceToEndFromRouteCoordinate:(id)a3
{
  id v4 = [(GEOComposedRoute *)self coordinates];
  [v4 distanceToEndFromRouteCoordinate:a3];
  double v6 = v5;

  return v6;
}

- (double)distanceBetweenRouteCoordinate:(id)a3 andRouteCoordinate:(id)a4
{
  double v6 = [(GEOComposedRoute *)self coordinates];
  [v6 distanceBetweenRouteCoordinate:a3 andRouteCoordinate:a4];
  double v8 = v7;

  return v8;
}

- ($212C09783140BCCD23384160D545CE0D)routeCoordinateForDistanceAfterStart:(double)a3
{
  id v4 = [(GEOComposedRoute *)self coordinates];
  $212C09783140BCCD23384160D545CE0D v5 = ($212C09783140BCCD23384160D545CE0D)[v4 routeCoordinateForDistanceAfterStart:a3];

  return v5;
}

- ($212C09783140BCCD23384160D545CE0D)routeCoordinateForDistanceBeforeEnd:(double)a3
{
  id v4 = [(GEOComposedRoute *)self coordinates];
  $212C09783140BCCD23384160D545CE0D v5 = ($212C09783140BCCD23384160D545CE0D)[v4 routeCoordinateForDistanceBeforeEnd:a3];

  return v5;
}

- ($212C09783140BCCD23384160D545CE0D)routeCoordinateForDistance:(double)a3 afterStartOfLegIndex:(unint64_t)a4
{
  double v6 = [(GEOComposedRoute *)self coordinates];
  $212C09783140BCCD23384160D545CE0D v7 = ($212C09783140BCCD23384160D545CE0D)[v6 routeCoordinateForDistance:a4 afterStartOfPathIndex:a3];

  return v7;
}

- ($212C09783140BCCD23384160D545CE0D)routeCoordinateForDistance:(double)a3 beforeEndOfLegIndex:(unint64_t)a4
{
  double v6 = [(GEOComposedRoute *)self coordinates];
  $212C09783140BCCD23384160D545CE0D v7 = ($212C09783140BCCD23384160D545CE0D)[v6 routeCoordinateForDistance:a4 beforeEndOfPathIndex:a3];

  return v7;
}

- ($212C09783140BCCD23384160D545CE0D)routeCoordinateForDistance:(double)a3 afterRouteCoordinate:(id)a4
{
  double v6 = [(GEOComposedRoute *)self coordinates];
  $212C09783140BCCD23384160D545CE0D v7 = ($212C09783140BCCD23384160D545CE0D)[v6 routeCoordinateForDistance:a4 afterRouteCoordinate:a3];

  return v7;
}

- ($212C09783140BCCD23384160D545CE0D)routeCoordinateForDistance:(double)a3 beforeRouteCoordinate:(id)a4
{
  double v6 = [(GEOComposedRoute *)self coordinates];
  $212C09783140BCCD23384160D545CE0D v7 = ($212C09783140BCCD23384160D545CE0D)[v6 routeCoordinateForDistance:a4 beforeRouteCoordinate:a3];

  return v7;
}

- (unint64_t)stepIndexForRouteCoordinate:(id)a3
{
  float var1 = a3.var1;
  if (a3.var1 < 0.0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unsigned int var0 = a3.var0;
  $212C09783140BCCD23384160D545CE0D v7 = [(GEOComposedRoute *)self steps];
  double v8 = [v7 lastObject];

  uint64_t v9 = [v8 endRouteCoordinate];
  if (v9 == var0)
  {
    LODWORD(v10) = HIDWORD(v9);
    if (*((float *)&v9 + 1) < var1) {
      goto LABEL_19;
    }
  }
  else if (v9 < var0)
  {
LABEL_19:
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_30;
  }
  uint64_t v11 = [(GEOComposedRoute *)self steps];
  unint64_t v12 = [v11 count] - 1;

  unint64_t v13 = 0;
  while (1)
  {
    unint64_t v14 = v12 + v13;
    unint64_t v15 = (v12 + v13) >> 1;
    uint64_t v16 = [(GEOComposedRoute *)self steps];
    double v17 = [v16 objectAtIndexedSubscript:v15];

    uint64_t v18 = [v17 startRouteCoordinate];
    if (var0 != v18) {
      break;
    }
    if (var1 >= *((float *)&v18 + 1)) {
      goto LABEL_10;
    }
LABEL_14:
    if (v14 < 2)
    {
      unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_29;
    }
    unint64_t v12 = v15 - 1;
LABEL_18:

    if (v13 > v12) {
      goto LABEL_19;
    }
  }
  if (var0 < v18) {
    goto LABEL_14;
  }
LABEL_10:
  uint64_t v19 = [v17 endRouteCoordinate];
  if (v19 == var0)
  {
    LODWORD(v20) = HIDWORD(v19);
    if (*((float *)&v19 + 1) >= var1) {
      goto LABEL_21;
    }
    goto LABEL_17;
  }
  if (v19 < var0)
  {
LABEL_17:
    unint64_t v13 = v15 + 1;
    goto LABEL_18;
  }
LABEL_21:
  uint64_t v21 = objc_msgSend(v17, "startRouteCoordinate", v20);
  float v22 = (float)var0 + var1;
  if (vabds_f32((float)v21 + *((float *)&v21 + 1), v22) >= 0.001 || v14 < 2) {
    goto LABEL_28;
  }
  uint64_t v24 = [(GEOComposedRoute *)self steps];
  unint64_t v4 = v15 - 1;
  uint64_t v25 = [v24 objectAtIndexedSubscript:v15 - 1];

  if (!v25
    || (uint64_t v26 = [v25 endRouteCoordinate],
        double v27 = vabds_f32((float)v26 + *((float *)&v26 + 1), v22),
        v25,
        v27 >= 0.001))
  {
LABEL_28:
    unint64_t v4 = (v12 + v13) >> 1;
  }
LABEL_29:

LABEL_30:
  return v4;
}

- (unint64_t)segmentIndexForRouteCoordinate:(id)a3
{
  unint64_t v4 = [(GEOComposedRoute *)self stepIndexForRouteCoordinate:a3];

  return [(GEOComposedRoute *)self segmentIndexForStepIndex:v4];
}

- (unint64_t)legIndexForRouteCoordinate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  float var1 = a3.var1;
  if (a3.var1 < 0.0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unsigned int var0 = a3.var0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  $212C09783140BCCD23384160D545CE0D v5 = [(GEOComposedRoute *)self legs];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v10 endRouteCoordinate];
        if (var0 == v11)
        {
          if (var1 <= *((float *)&v11 + 1)) {
            goto LABEL_14;
          }
        }
        else if (var0 < v11)
        {
LABEL_14:
          unint64_t v12 = [v10 legIndex];
          goto LABEL_15;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_15:

  return v12;
}

- ($3314123FD9D86BC79D52D2D985513A44)coarseBoundsForRange:(SEL)a3
{
  return -[GEOComposedRoute coarseBoundsForRange:sampleLength:](self, "coarseBoundsForRange:sampleLength:", *(void *)&a4.start, *(void *)&a4.end, 50.0);
}

- ($3314123FD9D86BC79D52D2D985513A44)coarseBoundsForRange:(SEL)a3 sampleLength:(GEOPolylineCoordinateRange)a4
{
  PolylineCoordinate end = a4.end;
  PolylineCoordinate start = a4.start;
  *retstr = *($3314123FD9D86BC79D52D2D985513A44 *)GEOMapBoxNull;
  uint64_t v10 = [(GEOComposedRoute *)self routeCoordinateRange];
  uint64_t v12 = v10;
  if (v11 == v10)
  {
    if (*((float *)&v11 + 1) == *((float *)&v10 + 1) || *((float *)&v11 + 1) >= *((float *)&v10 + 1)) {
      goto LABEL_6;
    }
  }
  else if (v11 >= v10)
  {
LABEL_6:
    uint64_t v14 = v10;
    uint64_t v12 = v11;
    goto LABEL_9;
  }
  uint64_t v14 = v11;
LABEL_9:
  float offset = *((float *)&v14 + 1);
  if (v14 != start.index)
  {
    uint64_t v17 = v14;
    if (v14 >= start.index) {
      goto LABEL_14;
    }
    goto LABEL_19;
  }
  BOOL v16 = *((float *)&v14 + 1) != start.offset && *((float *)&v14 + 1) < start.offset;
  uint64_t v17 = v14;
  if (v16)
  {
LABEL_19:
    float offset = start.offset;
    LODWORD(v14) = start.index;
    uint64_t v17 = (uint64_t)start;
  }
LABEL_14:
  if (v14 == v12)
  {
    if (offset == *((float *)&v12 + 1) || offset >= *((float *)&v12 + 1)) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (v14 < v12) {
LABEL_21:
  }
    uint64_t v12 = v17;
LABEL_22:
  PolylineCoordinate v18 = [(GEOComposedRoute *)self endRouteCoordinate];
  PolylineCoordinate v19 = v18;
  float v21 = v18.offset;
  unsigned int index = v18.index;
  if (end.index != v18.index)
  {
    if (end.index >= v18.index) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (end.offset != v18.offset && end.offset < v18.offset)
  {
LABEL_27:
    float v21 = end.offset;
    unsigned int index = end.index;
    PolylineCoordinate v19 = end;
  }
LABEL_28:
  while (index != v12)
  {
    float v22 = [(GEOComposedRoute *)self coordinates];
    if (index <= v12) {
      goto LABEL_35;
    }
LABEL_33:
    [v22 coordinateForRouteCoordinate:v12];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;

    double v29 = GEOTilePointForCoordinate(v24, v26, 20.0);
    long long v30 = *(_OWORD *)&retstr->var0.var2;
    long long v43 = *(_OWORD *)&retstr->var0.var0;
    long long v44 = v30;
    long long v45 = *(_OWORD *)&retstr->var1.var1;
    GEOBoundingMapBoxAddPoint((double *)&v43, &retstr->var0.var0, v29, v31, v28);
    uint64_t v32 = [(GEOComposedRoute *)self coordinates];
    uint64_t v12 = [v32 routeCoordinateForDistance:v12 afterRouteCoordinate:a5];
  }
  if (v21 != *((float *)&v12 + 1))
  {
    float v22 = [(GEOComposedRoute *)self coordinates];
    if (v21 <= *((float *)&v12 + 1)) {
      goto LABEL_35;
    }
    goto LABEL_33;
  }
  float v22 = [(GEOComposedRoute *)self coordinates];
LABEL_35:
  [v22 coordinateForRouteCoordinate:v19];
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;

  double v39 = GEOTilePointForCoordinate(v34, v36, 20.0);
  long long v40 = *(_OWORD *)&retstr->var0.var2;
  long long v43 = *(_OWORD *)&retstr->var0.var0;
  long long v44 = v40;
  long long v45 = *(_OWORD *)&retstr->var1.var1;
  $1AB5FA073B851C12C2339EC22442E995 result = ($3314123FD9D86BC79D52D2D985513A44 *)GEOBoundingMapBoxAddPoint((double *)&v43, &retstr->var0.var0, v39, v41, v38);
  *(float64x2_t *)&retstr->var1.unsigned int var0 = vmaxnmq_f64(*(float64x2_t *)&retstr->var1.var0, (float64x2_t)vdupq_n_s64(0x3EB0C6F7A0000000uLL));
  retstr->var1.var2 = fmax(retstr->var1.var2, 0.000000999999997);
  return result;
}

- (GEOComposedRoute)initWithCompanionRoute:(id)a3
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  if ((unint64_t)[v4 waypointsCount] >= 2) {
    uint64_t v6 = [v4 waypointsCount];
  }
  else {
    uint64_t v6 = 2;
  }
  uint64_t v7 = (void *)[v5 initWithCapacity:v6];
  if ([v4 waypointsCount])
  {
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    uint64_t v8 = [v4 waypoints];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v74 objects:v81 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v75;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v75 != v11) {
            objc_enumerationMutation(v8);
          }
          unint64_t v13 = [[GEOComposedWaypoint alloc] initWithCompanionWaypoint:*(void *)(*((void *)&v74 + 1) + 8 * i)];
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v74 objects:v81 count:16];
      }
      while (v10);
    }
  }
  else
  {
    uint64_t v8 = [v4 composedOrigin];
    uint64_t v14 = [v4 composedDestination];
    long long v15 = (void *)v14;
    if (v8 && v14)
    {
      [v7 addObject:v8];
      [v7 addObject:v15];
    }
  }
  if ((unint64_t)[v7 count] > 1)
  {
    BOOL v16 = [v4 request];
    PolylineCoordinate v18 = [v4 response];
    uint64_t v19 = [v4 etaResponse];
    double v20 = [GEORouteInitializerData alloc];
    float v21 = [v16 routeAttributes];
    unint64_t v69 = (void *)v19;
    if (v19)
    {
      float v22 = [v4 styleAttributes];
      double v23 = [(GEORouteInitializerData *)v20 initWithWaypoints:v7 routeAttributes:v21 etauResponse:v19 styleAttributes:v22];
    }
    else
    {
      double v23 = [(GEORouteInitializerData *)v20 initWithWaypoints:v7 routeAttributes:v21 directionsResponse:v18 directionsRequest:v16];
    }

    p_super = [v4 originalSuggestedRoute];
    uint64_t v72 = v18;
    uint64_t v70 = v23;
    if (p_super) {
      goto LABEL_25;
    }
    if ([v18 suggestedRoutesCount])
    {
      long long v49 = GEOGetCompanionExtrasLog();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v49, OS_LOG_TYPE_DEFAULT, "Found transit suggested route on response, using that", buf, 2u);
      }

      long long v50 = [v18 suggestedRoutes];
      p_super = [v50 firstObject];

      if (p_super)
      {
LABEL_25:
        uint64_t v25 = [v4 response];
        if (!v25) {
          goto LABEL_27;
        }
        double v26 = (void *)v25;
        double v27 = [v4 response];
        double v28 = [v27 decoderData];

        if (!v28)
        {
LABEL_27:
          double v29 = GEOGetCompanionExtrasLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)double v79 = v4;
            _os_log_impl(&dword_188D96000, v29, OS_LOG_TYPE_ERROR, "GEOCompanionRouteDetails is missing necessary parameters to create a transit route: %@", buf, 0xCu);
          }
        }
        long long v30 = GEOGetCompanionExtrasLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188D96000, v30, OS_LOG_TYPE_DEFAULT, "GEOComposedRoute created from suggested transit route", buf, 2u);
        }

        double v31 = [(GEOComposedRoute *)self initWithSuggestedRoute:p_super initializerData:v23];
        self = v31;
        if (!v31)
        {
LABEL_63:
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: composedRoute != ((void *)0)", buf, 2u);
          }
          uint64_t v17 = 0;
          goto LABEL_54;
        }
        goto LABEL_33;
      }
    }
    unsigned int v51 = [v4 routeIndex];
    long long v52 = [v18 waypointRoutes];
    unint64_t v53 = [v52 count];

    if (v53 <= v51)
    {
      long long v58 = [v69 waypointRoute];
      long long v59 = (void *)[v58 newWaypointRoutes];
      long long v60 = v16;
      unint64_t v61 = [v59 count];

      BOOL v62 = v61 > v51;
      BOOL v16 = v60;
      if (!v62) {
        goto LABEL_66;
      }
      long long v54 = [v69 waypointRoute];
      id v63 = (void *)[v54 newWaypointRoutes];
      long long v55 = [v63 objectAtIndexedSubscript:v51];
    }
    else
    {
      long long v54 = [v18 waypointRoutes];
      long long v55 = [v54 objectAtIndexedSubscript:v51];
    }

    if (v55)
    {
      double v31 = [[GEOComposedRoute alloc] initWithGeoWaypointRoute:v55 initializerData:v70];
      uint64_t v64 = GEOGetCompanionExtrasLog();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v64, OS_LOG_TYPE_DEFAULT, "GEOComposedRoute created from GEOWaypointRoute", buf, 2u);
      }

      p_super = 0;
      double v23 = v70;
      if (!v31) {
        goto LABEL_63;
      }
LABEL_33:
      unsigned int v71 = v16;
      uint64_t v68 = [v4 routeID];
      uint64_t v32 = objc_msgSend(MEMORY[0x1E4F29128], "_maps_UUIDWithData:");
      if (v32) {
        [(GEOComposedRoute *)v31 setUniqueRouteID:v32];
      }
      double v33 = [v4 revisionID];
      uint64_t v34 = objc_msgSend(MEMORY[0x1E4F29128], "_maps_UUIDWithData:", v33);
      double v35 = (void *)v34;
      if (v34) {
        double v36 = (void *)v34;
      }
      else {
        double v36 = v32;
      }
      [(GEOComposedRoute *)v31 setRevisionIdentifier:v36];
      -[GEOComposedRoute setSource:](v31, "setSource:", [v4 source]);
      double v37 = (void *)MEMORY[0x1E4F29128];
      double v38 = [v4 storageID];
      double v39 = objc_msgSend(v37, "_maps_UUIDWithData:", v38);
      [(GEOComposedRoute *)v31 setStorageID:v39];

      long long v40 = [v4 selectedRideIndices];
      [(GEOComposedRoute *)v31 updateRouteWithRideSelections:v40];

      double v41 = +[GEOTransitRouteUpdateRequest transitRouteUpdateRequestWithDirectionsRequest:v71 directionsResponse:v72];
      [(GEOComposedRoute *)v31 updateTransitRouteUpdateRequest:v41];

      long long v42 = [v4 anchorPointsData];
      uint64_t v43 = [v42 length];

      if (v43)
      {
        uint64_t v67 = self;
        long long v44 = (void *)MEMORY[0x1E4F28DC0];
        uint64_t v45 = objc_opt_class();
        long long v46 = [v4 anchorPointsData];
        id v73 = 0;
        long long v47 = [v44 unarchivedObjectOfClass:v45 fromData:v46 error:&v73];
        id v48 = v73;

        if (v48 || !v47)
        {
          long long v56 = GEOGetCompanionExtrasLog();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)double v79 = v48;
            _os_log_impl(&dword_188D96000, v56, OS_LOG_TYPE_ERROR, "Error deserializing anchor points: %@", buf, 0xCu);
          }
        }
        else
        {
          [(GEOComposedRoute *)v31 setAnchorPoints:v47];
        }

        self = v67;
      }
      uint64_t v17 = v31;

      p_super = &v17->super;
      BOOL v16 = v71;
LABEL_53:
      double v23 = v70;
LABEL_54:

      goto LABEL_55;
    }
LABEL_66:
    p_super = GEOGetCompanionExtrasLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
    {
      int v65 = [v18 waypointRoutes];
      int v66 = [v65 count];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)double v79 = v51;
      *(_WORD *)&v79[4] = 1024;
      *(_DWORD *)&v79[6] = v66;
      _os_log_impl(&dword_188D96000, p_super, OS_LOG_TYPE_FAULT, "Unable to create GEOComposedRoute from GEOCompanionRouteDetails because route index (%u) is out of bounds. waypointRoutesCount: %d", buf, 0xEu);
    }
    uint64_t v17 = 0;
    goto LABEL_53;
  }
  BOOL v16 = GEOGetCompanionExtrasLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)double v79 = v4;
    *(_WORD *)&v79[8] = 2050;
    id v80 = v4;
    _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_ERROR, "GEOCompanionRouteDetails does not at least 2 waypoints: %@ %{public}p", buf, 0x16u);
  }
  uint64_t v17 = 0;
LABEL_55:

  return v17;
}

- (void)applyCompanionUpdates:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v10, "type", (void)v14) == 1)
          {
            uint64_t v11 = [v10 transitRouteUpdate];

            if (v11)
            {
              uint64_t v12 = [v10 transitRouteUpdate];
              PolylineCoordinate v18 = v12;
              unint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
              [(GEOComposedRoute *)self applyUpdatesToTransitRoute:v13];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v7);
    }
  }
}

- (double)_hypothesis_travelDuration
{
  return (double)[(GEOComposedRoute *)self expectedTime];
}

- (double)_hypothesis_travelDurationFromStep:(id)a3 stepRemainingDistance:(double)a4
{
  id v6 = a3;
  -[GEOComposedRoute remainingTimeAlongRouteFromStepIndex:currentStepRemainingDistance:](self, "remainingTimeAlongRouteFromStepIndex:currentStepRemainingDistance:", [v6 stepIndex], a4);
  double v8 = v7;

  return v8;
}

- (id)geoOriginalWaypointRouteFromRouteCoordinate:(PolylineCoordinate)a3 purpose:(int)a4
{
  return [(GEOComposedRoute *)self geoOriginalWaypointRouteFromRouteCoordinate:a3 purpose:*(void *)&a4 userPosition:a3 origin:0 startPathSegment:0];
}

- (id)geoOriginalWaypointRouteFromRouteCoordinate:(PolylineCoordinate)a3 purpose:(int)a4 userPosition:(PolylineCoordinate)a5 origin:(id)a6 startPathSegment:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v69 = a6;
  id v68 = a7;
  if ([(GEOComposedRoute *)self transportType] != 1
    && ([(GEOComposedRoute *)self usesRoutingPathPoints]
     || [(GEOComposedRoute *)self usesZilch]))
  {
    float v12 = a3.offset - floorf(a3.offset);
    unsigned int v13 = vcvtms_u32_f32(a3.offset) + a3.index;
    if (a3.offset >= 0.0) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    if (a3.offset >= 0.0) {
      float v15 = v12;
    }
    else {
      float v15 = -1.0;
    }
    unint64_t v66 = v14 | ((unint64_t)LODWORD(v15) << 32);
    if ([(GEOComposedRoute *)self pointCount] - 1 == v14)
    {
      long long v16 = GEOGetGEOComposedRouteLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        GEOPolylineCoordinateAsString(v66, 1, 0, v17);
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        if (v9 >= 0xE)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v9);
          uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v19 = off_1E53EC088[(int)v9];
        }
        *(_DWORD *)buf = 138478083;
        id v80 = v18;
        __int16 v81 = 2112;
        uint64_t v82 = v19;
        _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_ERROR, "geoOriginalWaypointRouteFromRouteCoordinate: was passed a route coordinate [%{private}@] that is at the end of the route for purpose: %@", buf, 0x16u);
      }
    }
    [(GEOComposedRoute *)self distanceBetweenRouteCoordinate:v66 andRouteCoordinate:a5];
    double v21 = v20;
    id v73 = objc_alloc_init(GEOOriginalWaypointRoute);
    [(GEOOriginalWaypointRoute *)v73 setIdentifier:[(GEOComposedRoute *)self serverIdentifier]];
    [(GEOOriginalWaypointRoute *)v73 setPurpose:v9];
    if ([(GEOComposedRoute *)self isOfflineRoute]) {
      uint64_t v22 = 2;
    }
    else {
      uint64_t v22 = 1;
    }
    [(GEOOriginalWaypointRoute *)v73 setSource:v22];
    [(GEOOriginalWaypointRoute *)v73 setCreationMethod:[(GEOComposedRoute *)self _routeCreationMethod]];
    double v23 = v21 * 100.0;
    if (v21 < 0.0) {
      double v23 = 0.0;
    }
    [(GEOOriginalWaypointRoute *)v73 setLastValidUserOffsetCm:v23];
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id obj = [(GEOComposedRoute *)self legs];
    uint64_t v24 = [obj countByEnumeratingWithState:&v74 objects:v78 count:16];
    if (v24)
    {
      uint64_t v72 = *(void *)v75;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v75 != v72) {
            objc_enumerationMutation(obj);
          }
          double v26 = *(void **)(*((void *)&v74 + 1) + 8 * v25);
          uint64_t v27 = [v26 endRouteCoordinate];
          if (v14 == v27)
          {
            if (v15 >= *((float *)&v27 + 1)) {
              goto LABEL_63;
            }
          }
          else if (v14 > v27)
          {
            goto LABEL_63;
          }
          double v28 = objc_alloc_init(GEOOriginalRouteLeg);
          [(GEOOriginalRouteLeg *)v28 setEncryptedTourMuid:[(GEOComposedRoute *)self tourMuid]];
          uint64_t v29 = [v26 startRouteCoordinate];
          unint64_t v30 = v29;
          if (v14 != v29)
          {
            if (v14 <= v29) {
              goto LABEL_37;
            }
LABEL_41:
            unint64_t v30 = v14 | ((unint64_t)LODWORD(v15) << 32);
            goto LABEL_37;
          }
          if (v15 != *((float *)&v29 + 1) && v15 >= *((float *)&v29 + 1)) {
            goto LABEL_41;
          }
LABEL_37:
          if ([(GEOComposedRoute *)self usesRoutingPathPoints])
          {
            uint64_t v32 = [(GEOComposedRoute *)self coordinates];
            double v33 = objc_msgSend(v32, "routingPathDataWithSupportPointFromStart:toEnd:supportPointsOnly:startPathSegment:", v30, objc_msgSend(v26, "endRouteCoordinate"), 1, v68);

            if (!v33)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                uint64_t v61 = [v26 endRouteCoordinate];
                id v63 = GEOPolylineCoordinateRangeAsString(v66, v61, v62);
                *(_DWORD *)buf = 138412290;
                id v80 = v63;
              }
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: routingPathData != nil", buf, 2u);
              }
            }
            [(GEOOriginalRouteLeg *)v28 setPathLeg:v33];
          }
          else
          {
            if (![(GEOComposedRoute *)self usesZilch]) {
              goto LABEL_45;
            }
            uint64_t v34 = [(GEOComposedRoute *)self coordinates];
            double v33 = [v34 compressedZilchDataToEndOfPathFromIndex:v30];

            [(GEOOriginalRouteLeg *)v28 setZilchPoints:v33];
          }

LABEL_45:
          double v35 = [(GEOOriginalWaypointRoute *)v73 routeLegs];
          BOOL v36 = [v35 count] == 0;

          if (!v36)
          {
            double v37 = [v26 geoOriginWaypointInfo];
            double v38 = (GEOWaypointInfo *)[v37 copy];
            double v39 = v38;
            if (!v38)
            {
              uint64_t v67 = [[GEOWaypointInfo alloc] initWithSource:1];
              double v39 = v67;
            }
            [(GEOOriginalRouteLeg *)v28 setOriginWaypointInfo:v39];
            if (!v38) {

            }
            long long v40 = [v26 origin];
            double v41 = [v40 uniqueID];
            long long v42 = objc_msgSend(v41, "_geo_waypointUUID");
            uint64_t v43 = [(GEOOriginalRouteLeg *)v28 originWaypointInfo];
            [v43 setUniqueWaypointId:v42];

            goto LABEL_53;
          }
          if (v69)
          {
            long long v44 = objc_alloc_init(GEOWaypointInfo);
            [(GEOOriginalRouteLeg *)v28 setOriginWaypointInfo:v44];

            uint64_t v45 = [(GEOOriginalRouteLeg *)v28 originWaypointInfo];
            [v45 setSource:1];

            long long v40 = [v69 uniqueID];
            double v41 = objc_msgSend(v40, "_geo_waypointUUID");
            long long v42 = [(GEOOriginalRouteLeg *)v28 originWaypointInfo];
            [v42 setUniqueWaypointId:v41];
LABEL_53:
          }
          long long v46 = [v26 geoDestinationWaypointInfo];
          long long v47 = (GEOWaypointInfo *)[v46 copy];
          id v48 = v47;
          if (!v47)
          {
            uint64_t v70 = [[GEOWaypointInfo alloc] initWithSource:1];
            id v48 = v70;
          }
          [(GEOOriginalRouteLeg *)v28 setDestinationWaypointInfo:v48];
          if (!v47) {

          }
          long long v49 = [v26 destination];
          long long v50 = [v49 uniqueID];
          unsigned int v51 = objc_msgSend(v50, "_geo_waypointUUID");
          long long v52 = [(GEOOriginalRouteLeg *)v28 destinationWaypointInfo];
          [v52 setUniqueWaypointId:v51];

          unint64_t v53 = [v26 endStepIndex];
          long long v54 = [(GEOComposedRoute *)self steps];
          LODWORD(v53) = v53 < [v54 count];

          if (v53)
          {
            uint64_t v55 = [(GEOComposedRoute *)self steps];
            long long v56 = objc_msgSend((id)v55, "objectAtIndexedSubscript:", objc_msgSend(v26, "endStepIndex"));

            long long v57 = [v56 evInfo];
            LOBYTE(v55) = v57 == 0;

            if ((v55 & 1) == 0)
            {
              long long v58 = objc_alloc_init(GEOEVStateInfo);
              long long v59 = [v56 evInfo];
              -[GEOEVStateInfo setRemainingBatteryCharge:](v58, "setRemainingBatteryCharge:", [v59 remainingBatteryCharge]);

              long long v60 = [v56 evInfo];
              -[GEOEVStateInfo setRemainingBatteryPercentage:](v58, "setRemainingBatteryPercentage:", [v60 remainingBatteryPercentage]);

              [(GEOOriginalRouteLeg *)v28 setEvStateInfo:v58];
            }
          }
          else
          {
            long long v56 = 0;
          }
          [(GEOOriginalWaypointRoute *)v73 addRouteLeg:v28];

LABEL_63:
          ++v25;
        }
        while (v24 != v25);
        uint64_t v64 = [obj countByEnumeratingWithState:&v74 objects:v78 count:16];
        uint64_t v24 = v64;
      }
      while (v64);
    }
  }
  else
  {
    id v73 = 0;
  }

  return v73;
}

- (id)geoETAWaypointRoute
{
  return [(GEOComposedRoute *)self geoETAWaypointRouteFromRouteCoordinate:0 includeOriginWaypointInfo:0 startPathSegment:0];
}

- (id)geoETAWaypointRouteFromRouteCoordinate:(PolylineCoordinate)a3 includeOriginWaypointInfo:(BOOL)a4 startPathSegment:(id)a5
{
  BOOL v74 = a4;
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v76 = a5;
  if ([(GEOComposedRoute *)self usesZilch])
  {
    long long v77 = [(GEOComposedRoute *)self _geoETAWaypointRouteWithZilchFromRouteCoordinate:a3];
    goto LABEL_23;
  }
  if (![(GEOComposedRoute *)self usesRoutingPathPoints])
  {
    long long v77 = 0;
    goto LABEL_23;
  }
  id v80 = [(GEOComposedRoute *)self coordinates];
  if (a3.index >= (unint64_t)([v80 coordinateCount] - 1))
  {
    uint64_t v19 = [v80 coordinateCount] - 1;
    double v20 = GEOGetGEOComposedRouteLog();
    double v21 = v20;
    if (a3.index == v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        double v23 = GEOPolylineCoordinateAsString(*(void *)&a3, 1, 0, v22);
        *(_DWORD *)buf = 138477827;
        uint64_t v82 = v23;
        _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_DEFAULT, "geoETAWaypointRouteFromRouteCoordinate: called with route coordinate [%{private}@], which is the last coordinate on the route. Returning nil.", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = GEOPolylineCoordinateAsString(*(void *)&a3, 1, 0, v24);
      *(_DWORD *)buf = 138478083;
      uint64_t v82 = v25;
      __int16 v83 = 1024;
      int v84 = [v80 coordinateCount];
      _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_ERROR, "geoETAWaypointRouteFromRouteCoordinate: called with route coordinate [%{private}@]. Route coordinate count: %d", buf, 0x12u);
    }
  }
  else
  {
    uint64_t v7 = [v80 pathIndexForRouteCoordinate:a3];
    if (a3.index == objc_msgSend(v80, "routeIndexForLocalIndex:onPath:", objc_msgSend(v80, "coordinateCountForPathAtIndex:", v7) - 1, v7))
    {
      double v8 = GEOGetGEOComposedRouteLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = GEOPolylineCoordinateAsString(*(void *)&a3, 1, 0, v9);
        *(_DWORD *)buf = 138477827;
        uint64_t v82 = v10;
        _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEFAULT, "geoETAWaypointRouteFromRouteCoordinate: called with route coordinate [%{private}@], which is the last coordinate on a route path. Changing coordinate to first coordinate of next path.", buf, 0xCu);
      }
      a3 = (PolylineCoordinate)[v80 routeIndexForLocalIndex:0 onPath:v7 + 1];
    }
    unint64_t v11 = [(GEOComposedRoute *)self stepIndexForRouteCoordinate:a3];
    float v12 = [(GEOComposedRoute *)self steps];
    BOOL v13 = v11 < [v12 count];

    if (v13)
    {
      uint64_t v14 = [(GEOComposedRoute *)self steps];
      float v15 = [v14 objectAtIndexedSubscript:v11];
      uint64_t v16 = [v15 routeCoordinateRange];
      if (v17 == v16)
      {
        if (*((float *)&v17 + 1) == *((float *)&v16 + 1) || *((float *)&v17 + 1) >= *((float *)&v16 + 1)) {
          goto LABEL_13;
        }
      }
      else if (v17 >= v16)
      {
LABEL_13:
        uint64_t v18 = v17;
        uint64_t v17 = v16;
        goto LABEL_28;
      }
      uint64_t v18 = v16;
LABEL_28:
      float offset = *((float *)&v17 + 1);
      PolylineCoordinate v28 = (PolylineCoordinate)v17;
      if (v17 == a3.index)
      {
        if (*((float *)&v17 + 1) == a3.offset || *((float *)&v17 + 1) >= a3.offset)
        {
LABEL_34:
          if (v17 == v18)
          {
            if (offset == *((float *)&v18 + 1) || offset >= *((float *)&v18 + 1))
            {
LABEL_40:
              uint64_t v79 = v18;

              unint64_t v75 = [(GEOComposedRoute *)self legIndexForStepIndex:v11];
              uint64_t v29 = [(GEOComposedRoute *)self legs];
              BOOL v30 = v75 < [v29 count];

              if (v30)
              {
                long long v77 = objc_alloc_init(GEOETATrafficUpdateWaypointRoute);
                [(GEOETATrafficUpdateWaypointRoute *)v77 setIdentifier:[(GEOComposedRoute *)self serverIdentifier]];
                for (unint64_t i = v75; ; unint64_t i = v78 + 1)
                {
                  unint64_t v78 = i;
                  uint64_t v32 = [(GEOComposedRoute *)self legs];
                  BOOL v33 = v78 < [v32 count];

                  if (!v33) {
                    goto LABEL_22;
                  }
                  uint64_t v34 = [(GEOComposedRoute *)self legs];
                  double v35 = [v34 objectAtIndexedSubscript:v78];

                  BOOL v36 = objc_alloc_init(GEOETARoute);
                  uint64_t v38 = v79;
                  if (v78 != v75) {
                    uint64_t v38 = [v35 startRouteCoordinate];
                  }
                  LODWORD(v37) = HIDWORD(v38);
                  float v39 = *((float *)&v38 + 1) - floorf(*((float *)&v38 + 1));
                  uint64_t v40 = vcvtms_u32_f32(*((float *)&v38 + 1)) + v38;
                  float v41 = *((float *)&v38 + 1) >= 0.0 ? v39 : -1.0;
                  uint64_t v42 = *((float *)&v38 + 1) >= 0.0 ? v40 : 0;
                  uint64_t v43 = objc_msgSend(v35, "endRouteCoordinate", v37);
                  if (v42 == v43) {
                    break;
                  }
                  if (v42 < v43) {
                    goto LABEL_55;
                  }
LABEL_56:
                  if (v78 > v75 || v74)
                  {
                    long long v50 = [v35 geoOriginWaypointInfo];
                    unsigned int v51 = (void *)[v50 copy];
                    [(GEOETARoute *)v36 setOriginWaypointInfo:v51];

                    long long v47 = [v35 origin];
                    id v48 = [v47 uniqueID];
                    long long v49 = objc_msgSend(v48, "_geo_waypointUUID");
                    long long v52 = [(GEOETARoute *)v36 originWaypointInfo];
                    [v52 setUniqueWaypointId:v49];
                  }
                  else
                  {
                    uint64_t v45 = objc_alloc_init(GEOWaypointInfo);
                    [(GEOETARoute *)v36 setOriginWaypointInfo:v45];

                    long long v46 = [(GEOETARoute *)v36 originWaypointInfo];
                    [v46 setSource:1];

                    long long v47 = [MEMORY[0x1E4F29128] UUID];
                    id v48 = objc_msgSend(v47, "_geo_waypointUUID");
                    long long v49 = [(GEOETARoute *)v36 originWaypointInfo];
                    [v49 setUniqueWaypointId:v48];
                  }

                  unint64_t v53 = [v35 geoDestinationWaypointInfo];
                  long long v54 = (void *)[v53 copy];
                  [(GEOETARoute *)v36 setDestinationWaypointInfo:v54];

                  uint64_t v55 = [v35 destination];
                  long long v56 = [v55 uniqueID];
                  long long v57 = objc_msgSend(v56, "_geo_waypointUUID");
                  long long v58 = [(GEOETARoute *)v36 destinationWaypointInfo];
                  [v58 setUniqueWaypointId:v57];

                  unint64_t v59 = v11;
                  if (v11 <= [v35 startStepIndex]) {
                    unint64_t v59 = [v35 startStepIndex];
                  }
                  while (v59 <= [v35 endStepIndex])
                  {
                    long long v60 = [(GEOComposedRoute *)self steps];
                    uint64_t v61 = [v60 objectAtIndexedSubscript:v59];

                    double v62 = objc_alloc_init(GEOETAStep);
                    -[GEOETAStep setStepID:](v62, "setStepID:", [v61 stepID]);
                    [v61 distance];
                    double v64 = v63;
                    uint64_t v65 = [v61 duration];
                    if (v11 == v59)
                    {
                      objc_msgSend(v80, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v79, objc_msgSend(v61, "endRouteCoordinate"));
                      double v64 = v66;
                      [v61 distance];
                      if (v64 > v67 + 0.1)
                      {
                        [v61 distance];
                        double v64 = v68;
                      }
                      unsigned int v69 = [v61 duration];
                      [v61 distance];
                      uint64_t v71 = (v64 / v70 * (double)v69);
                    }
                    else
                    {
                      uint64_t v71 = v65;
                    }
                    [(GEOETAStep *)v62 setExpectedTime:v71];
                    [(GEOETAStep *)v62 setDistanceCm:(v64 * 100.0)];
                    uint64_t v72 = [v61 evInfo];
                    if (v72)
                    {
                      id v73 = objc_alloc_init(GEOEVStateInfo);
                      -[GEOEVStateInfo setRemainingBatteryCharge:](v73, "setRemainingBatteryCharge:", [v72 remainingBatteryCharge]);
                      -[GEOEVStateInfo setRemainingBatteryPercentage:](v73, "setRemainingBatteryPercentage:", [v72 remainingBatteryPercentage]);
                      [(GEOETAStep *)v62 setEvStateInfo:v73];
                    }
                    [(GEOETARoute *)v36 addStep:v62];

                    ++v59;
                  }
                  [(GEOETATrafficUpdateWaypointRoute *)v77 addRouteLeg:v36];
                }
                if (v41 >= *((float *)&v43 + 1)) {
                  goto LABEL_56;
                }
LABEL_55:
                long long v44 = objc_msgSend(v80, "routingPathDataWithSupportPointFromStart:toEnd:supportPointsOnly:startPathSegment:", v42 | ((unint64_t)LODWORD(v41) << 32), objc_msgSend(v35, "endRouteCoordinate"), 1, v76);
                [(GEOETARoute *)v36 setPathLeg:v44];

                goto LABEL_56;
              }
              goto LABEL_21;
            }
          }
          else if (v17 >= v18)
          {
            goto LABEL_40;
          }
          uint64_t v18 = (uint64_t)v28;
          goto LABEL_40;
        }
      }
      else if (v17 >= a3.index)
      {
        goto LABEL_34;
      }
      float offset = a3.offset;
      LODWORD(v17) = a3.index;
      PolylineCoordinate v28 = a3;
      goto LABEL_34;
    }
  }
LABEL_21:
  long long v77 = 0;
LABEL_22:

LABEL_23:

  return v77;
}

- (void)iterateTravelTimeRangesToRouteCoordinate:(PolylineCoordinate)a3 etaRoute:(id)a4 handler:(id)a5
{
}

- (void)iterateTravelTimeRangesFromRouteCoordinate:(PolylineCoordinate)a3 etaRoute:(id)a4 handler:(id)a5
{
}

- (double)remainingTimeToEndOfCurrentLegFrom:(PolylineCoordinate)a3 etaRoute:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(GEOComposedRoute *)self legIndexForRouteCoordinate:a3];
  double v8 = [(GEOComposedRoute *)self legs];
  unint64_t v9 = [v8 count];

  double v10 = 0.0;
  if (v7 < v9)
  {
    unint64_t v11 = [(GEOComposedRoute *)self legs];
    float v12 = [v11 objectAtIndexedSubscript:v7];

    uint64_t v13 = [v12 endRouteCoordinate];
    uint64_t v16 = 0;
    uint64_t v17 = (double *)&v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__GEOComposedRoute_Extras__remainingTimeToEndOfCurrentLegFrom_etaRoute___block_invoke;
    v15[3] = &unk_1E53EBFC8;
    v15[4] = &v16;
    v15[5] = v13;
    [(GEOComposedRoute *)self iterateTravelTimeRangesFromRouteCoordinate:a3 etaRoute:v6 handler:v15];
    double v10 = v17[3];
    _Block_object_dispose(&v16, 8);
  }
  return v10;
}

double __72__GEOComposedRoute_Extras__remainingTimeToEndOfCurrentLegFrom_etaRoute___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, uint64_t a5, unsigned char *a6)
{
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6 == a2)
  {
    LODWORD(result) = HIDWORD(a2);
    if (*((float *)&v6 + 1) <= *((float *)&a2 + 1))
    {
LABEL_3:
      *a6 = 1;
      return result;
    }
  }
  else if (v6 < a2)
  {
    goto LABEL_3;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = *(double *)(v8 + 24) + a4;
  *(double *)(v8 + 24) = result;
  return result;
}

- (double)remainingTimeToEndOfRouteFrom:(PolylineCoordinate)a3 etaRoute:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(GEOComposedRoute *)self legIndexForRouteCoordinate:a3];
  uint64_t v8 = [(GEOComposedRoute *)self legs];
  unint64_t v9 = [v8 count];

  double v10 = 0.0;
  if (v7 < v9)
  {
    [(GEOComposedRoute *)self remainingTimeToEndOfCurrentLegFrom:a3 etaRoute:v6];
    double v10 = v11;
    if (v6)
    {
      float v12 = [(GEOComposedRoute *)self legs];
      uint64_t v13 = [v12 count];
      uint64_t v14 = [v6 legs];
      uint64_t v15 = [v14 count];

      for (unint64_t i = v7 + v15 - v13 + 1; ; ++i)
      {
        uint64_t v17 = [v6 legs];
        unint64_t v18 = [v17 count];

        if (i >= v18) {
          break;
        }
        uint64_t v19 = [v6 legs];
        double v20 = [v19 objectAtIndexedSubscript:i];

        [v20 travelDuration];
        double v10 = v10 + v21;
      }
    }
    else
    {
      while (1)
      {
        ++v7;
        uint64_t v25 = [(GEOComposedRoute *)self legs];
        unint64_t v26 = [v25 count];

        if (v7 >= v26) {
          break;
        }
        double v22 = [(GEOComposedRoute *)self legs];
        double v23 = [v22 objectAtIndexedSubscript:v7];

        [v23 travelDuration];
        double v10 = v10 + v24;
      }
    }
  }

  return v10;
}

- (id)truncatedTrafficFromRouteCoordinate:(PolylineCoordinate)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  *(float *)&double v3 = a3.offset;
  if (a3.offset >= 0.0)
  {
    unint64_t v7 = [(GEOComposedRoute *)self coordinates];
    [v7 distanceFromStartToRouteCoordinate:a3];
    double v9 = v8;

    uint64_t v34 = [(GEOComposedRoute *)self traffic];
    if (fabs(v9) >= 0.00000001)
    {
      double v11 = [MEMORY[0x1E4F1CA48] array];
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      float v12 = [v34 routeTrafficColors];
      uint64_t v13 = [v12 reverseObjectEnumerator];

      uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v40;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v40 != v15) {
              objc_enumerationMutation(v13);
            }
            uint64_t v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            unint64_t v18 = objc_alloc_init(GEOComposedRouteTrafficColorInfo);
            -[GEOComposedRouteTrafficColorInfo setColor:](v18, "setColor:", [v17 color]);
            [v11 insertObject:v18 atIndex:0];
            [v17 offsetMeters];
            if (v19 <= v9)
            {
              [(GEOComposedRouteTrafficColorInfo *)v18 setOffsetMeters:0.0];
              [(GEOComposedRouteTrafficColorInfo *)v18 setRouteCoordinate:0];

              goto LABEL_15;
            }
            [v17 offsetMeters];
            [(GEOComposedRouteTrafficColorInfo *)v18 setOffsetMeters:v20 - v9];
            double v21 = [(GEOComposedRoute *)self coordinates];
            [(GEOComposedRouteTrafficColorInfo *)v18 offsetMeters];
            -[GEOComposedRouteTrafficColorInfo setRouteCoordinate:](v18, "setRouteCoordinate:", objc_msgSend(v21, "routeCoordinateForDistanceAfterStart:"));
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v44 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
LABEL_15:

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      double v22 = [v34 routeIncidents];
      double v23 = [v22 reverseObjectEnumerator];

      uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v36;
LABEL_17:
        uint64_t v26 = 0;
        while (1)
        {
          if (*(void *)v36 != v25) {
            objc_enumerationMutation(v23);
          }
          uint64_t v27 = *(void **)(*((void *)&v35 + 1) + 8 * v26);
          [v27 offsetMeters];
          if (v28 <= v9) {
            break;
          }
          uint64_t v29 = objc_alloc_init(GEOComposedRouteTrafficIncidentInfo);
          BOOL v30 = [v27 incident];
          [(GEOComposedRouteTrafficIncidentInfo *)v29 setIncident:v30];

          [v27 offsetMeters];
          [(GEOComposedRouteTrafficIncidentInfo *)v29 setOffsetMeters:v31 - v9];
          uint64_t v32 = [(GEOComposedRoute *)self coordinates];
          [(GEOComposedRouteTrafficIncidentInfo *)v29 offsetMeters];
          -[GEOComposedRouteTrafficIncidentInfo setRouteCoordinate:](v29, "setRouteCoordinate:", objc_msgSend(v32, "routeCoordinateForDistanceAfterStart:"));

          [0 insertObject:v29 atIndex:0];
          if (v24 == ++v26)
          {
            uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (v24) {
              goto LABEL_17;
            }
            break;
          }
        }
      }

      id v4 = [[GEOComposedRouteTraffic alloc] initWithColorInfos:v11 incidentInfos:0];
      double v10 = v34;
    }
    else
    {
      double v10 = v34;
      id v4 = v34;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (PolylineCoordinate)coordinateAtTimeInterval:(double)a3 beforeCoordinate:(PolylineCoordinate)a4 etaRoute:(id)a5
{
  id v8 = a5;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __79__GEOComposedRoute_Extras__coordinateAtTimeInterval_beforeCoordinate_etaRoute___block_invoke;
  v21[3] = &unk_1E53EBFF0;
  v21[4] = v22;
  [(GEOComposedRoute *)self iterateTravelTimeRangesToRouteCoordinate:a4 etaRoute:v8 handler:v21];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3812000000;
  uint64_t v17 = __Block_byref_object_copy__82;
  unint64_t v18 = __Block_byref_object_dispose__82;
  double v19 = "";
  PolylineCoordinate v20 = a4;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  _OWORD v11[2] = __79__GEOComposedRoute_Extras__coordinateAtTimeInterval_beforeCoordinate_etaRoute___block_invoke_13;
  v11[3] = &unk_1E53EC018;
  objc_copyWeak(v12, &location);
  v12[1] = *(id *)&a3;
  v11[5] = v22;
  v11[6] = &v14;
  v11[4] = self;
  [(GEOComposedRoute *)self iterateTravelTimeRangesToRouteCoordinate:a4 etaRoute:v8 handler:v11];
  PolylineCoordinate v9 = (PolylineCoordinate)v15[6];
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(v22, 8);

  return v9;
}

double __79__GEOComposedRoute_Extras__coordinateAtTimeInterval_beforeCoordinate_etaRoute___block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = *(double *)(v3 + 24) + a3;
  *(double *)(v3 + 24) = result;
  return result;
}

void __79__GEOComposedRoute_Extras__coordinateAtTimeInterval_beforeCoordinate_etaRoute___block_invoke_13(uint64_t a1, uint64_t a2, double a3, double a4, uint64_t a5, unsigned char *a6)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));

  if (!WeakRetained) {
    goto LABEL_4;
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  double v13 = *(double *)(v12 + 24) - a4;
  double v14 = *(double *)(a1 + 64);
  if (v13 < v14)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 48) = [*(id *)(a1 + 32) routeCoordinateForDistance:a2 afterRouteCoordinate:(a4 - v14) / a4 * a3];
LABEL_4:
    *a6 = 1;
    return;
  }
  *(double *)(v12 + 24) = v13;
}

- (PolylineCoordinate)coordinateAtTimeInterval:(double)a3 afterCoordinate:(PolylineCoordinate)a4 etaRoute:(id)a5
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3812000000;
  unint64_t v18 = __Block_byref_object_copy__82;
  double v19 = __Block_byref_object_dispose__82;
  PolylineCoordinate v20 = "";
  PolylineCoordinate v21 = a4;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  id v8 = a5;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  _OWORD v11[2] = __78__GEOComposedRoute_Extras__coordinateAtTimeInterval_afterCoordinate_etaRoute___block_invoke;
  v11[3] = &unk_1E53EC018;
  objc_copyWeak(v12, &location);
  v12[1] = *(id *)&a3;
  v11[5] = v14;
  v11[6] = &v15;
  v11[4] = self;
  [(GEOComposedRoute *)self iterateTravelTimeRangesFromRouteCoordinate:a4 etaRoute:v8 handler:v11];

  PolylineCoordinate v9 = (PolylineCoordinate)v16[6];
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v15, 8);
  return v9;
}

void __78__GEOComposedRoute_Extras__coordinateAtTimeInterval_afterCoordinate_etaRoute___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, uint64_t a5, unsigned char *a6)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));

  if (!WeakRetained) {
    goto LABEL_4;
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  double v13 = *(double *)(v12 + 24);
  double v14 = v13 + a4;
  double v15 = *(double *)(a1 + 64);
  if (v13 + a4 > v15)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 48) = objc_msgSend(*(id *)(a1 + 32), "routeCoordinateForDistance:afterRouteCoordinate:", a2, (v15 - v13) / a4 * a3, v14);
LABEL_4:
    *a6 = 1;
    return;
  }
  *(double *)(v12 + 24) = v14;
}

- (void)nextWaypointOrAnchorPointFromRouteCoordinate:(PolylineCoordinate)a3 outWaypoint:(id *)a4 outAnchorPoint:(id *)a5
{
  if (!a4) {
    return;
  }
  id v5 = a5;
  if (!a5) {
    return;
  }
  unint64_t v9 = [(GEOComposedRoute *)self legIndexForRouteCoordinate:"legIndexForRouteCoordinate:"];
  id v25 = [(GEOComposedRoute *)self legs];
  unint64_t v10 = [v25 count];

  if (v9 >= v10) {
    return;
  }
  double v11 = [(GEOComposedRoute *)self legs];
  id v26 = [v11 objectAtIndexedSubscript:v9];

  uint64_t v12 = [v26 endRouteCoordinate];
  double v13 = [v26 destination];
  double v14 = [(GEOComposedRoute *)self anchorPoints];
  double v15 = (void *)[v14 count];

  if (v15)
  {
    uint64_t v16 = [(GEOComposedRoute *)self anchorPoints];
    unint64_t v17 = [v16 nextAnchorPointIndexAfter:a3];

    if (v17
      && ([(GEOComposedRoute *)self anchorPoints],
          unint64_t v18 = objc_claimAutoreleasedReturnValue(),
          unint64_t v19 = [v18 count] - 1,
          v18,
          v17 < v19))
    {
      PolylineCoordinate v20 = [(GEOComposedRoute *)self anchorPoints];
      double v15 = [v20 objectAtIndexedSubscript:v17];
    }
    else
    {
      double v15 = 0;
    }
  }
  if (!v13 || v15)
  {
    if (v15 && !v13)
    {
      PolylineCoordinate v21 = v15;
      goto LABEL_15;
    }
    uint64_t v22 = [v15 routeCoordinate];
    BOOL v23 = v22 >= v12;
    if (v22 == v12)
    {
      BOOL v24 = *((float *)&v22 + 1) < *((float *)&v12 + 1);
      PolylineCoordinate v21 = v15;
      if (v24) {
        goto LABEL_15;
      }
    }
    else
    {
      PolylineCoordinate v21 = v15;
      if (!v23) {
        goto LABEL_15;
      }
    }
  }
  PolylineCoordinate v21 = v13;
  id v5 = a4;
LABEL_15:
  *id v5 = v21;
}

- (id)_geoETAWaypointRouteWithZilchFromRouteCoordinate:(PolylineCoordinate)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (![(GEOComposedRoute *)self usesZilch]) {
    goto LABEL_26;
  }
  PolylineCoordinate v45 = a3;
  unint64_t v5 = [(GEOComposedRoute *)self stepIndexForRouteCoordinate:a3];
  id v6 = [(GEOComposedRoute *)self steps];
  unint64_t v7 = [v6 count];

  if (v5 >= v7) {
    goto LABEL_26;
  }
  unint64_t v40 = [(GEOComposedRoute *)self legIndexForStepIndex:v5];
  id v8 = [(GEOComposedRoute *)self legs];
  unint64_t v9 = [v8 count];

  if (v40 < v9)
  {
    long long v46 = [(GEOComposedRoute *)self coordinates];
    long long v41 = objc_alloc_init(GEOETATrafficUpdateWaypointRoute);
    [(GEOETATrafficUpdateWaypointRoute *)v41 setIdentifier:[(GEOComposedRoute *)self serverIdentifier]];
    for (unint64_t i = v40; ; unint64_t i = v44 + 1)
    {
      unint64_t v44 = i;
      double v11 = [(GEOComposedRoute *)self legs];
      BOOL v12 = v44 < [v11 count];

      if (!v12) {
        break;
      }
      double v13 = [(GEOComposedRoute *)self legs];
      double v14 = [v13 objectAtIndexedSubscript:v44];

      unint64_t v15 = v5;
      if (v5 <= [v14 startStepIndex]) {
        unint64_t v15 = [v14 startStepIndex];
      }
      uint64_t v16 = [(GEOComposedRoute *)self steps];
      long long v42 = [v16 objectAtIndexedSubscript:v15];

      uint64_t v43 = objc_msgSend(v46, "compressedZilchDataToEndOfPathFromIndex:", objc_msgSend(v42, "startPointIndex"));
      unint64_t v17 = objc_alloc_init(GEOETARoute);
      [(GEOETARoute *)v17 addZilchPoints:v43];
      if (v44 > v40)
      {
        unint64_t v18 = [v14 geoOriginWaypointInfo];
        [(GEOETARoute *)v17 setOriginWaypointInfo:v18];
      }
      unint64_t v19 = [v14 geoDestinationWaypointInfo];
      [(GEOETARoute *)v17 setDestinationWaypointInfo:v19];

      LODWORD(v20) = 0;
      while (v15 <= [v14 endStepIndex])
      {
        PolylineCoordinate v21 = [(GEOComposedRoute *)self steps];
        uint64_t v22 = [v21 objectAtIndexedSubscript:v15];

        if ([v22 pointCount]) {
          int v23 = [v22 pointCount] - 1;
        }
        else {
          int v23 = 0;
        }
        BOOL v24 = objc_alloc_init(GEOETAStep);
        -[GEOETAStep setStepID:](v24, "setStepID:", [v22 stepID]);
        uint64_t v20 = (v23 + v20);
        [(GEOETAStep *)v24 setZilchPointIndex:v20];
        if (v5 == v15)
        {
          objc_msgSend(v46, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v45, objc_msgSend(v22, "endPointIndex"));
          double v26 = v25;
          [v22 distance];
          if (v26 > v28)
          {
            uint64_t v29 = GEOGetGEOComposedRouteLog();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              int v30 = [v22 stepID];
              [v22 distance];
              *(_DWORD *)buf = 67109632;
              int v48 = v30;
              __int16 v49 = 2048;
              double v50 = v26;
              __int16 v51 = 2048;
              uint64_t v52 = v31;
              _os_log_impl(&dword_188D96000, v29, OS_LOG_TYPE_ERROR, "ETA step (%d) has stepDistanceRemaining of %0.1fm, but total step distance is only %0.1fm. This is probably a server error", buf, 0x1Cu);
            }

            [v22 distance];
            double v26 = v32;
          }
          LODWORD(v27) = vcvtad_u64_f64(v26 * 100.0);
          [(GEOETAStep *)v24 setDistanceCm:v27];
          unsigned int v33 = [v22 duration];
          [v22 distance];
          [(GEOETAStep *)v24 setExpectedTime:(v26 / v34 * (double)v33)];
        }
        else
        {
          [v22 distance];
          LODWORD(v36) = vcvtad_u64_f64(v35 * 100.0);
          [(GEOETAStep *)v24 setDistanceCm:v36];
          -[GEOETAStep setExpectedTime:](v24, "setExpectedTime:", [v22 duration]);
        }
        long long v37 = [v22 evInfo];
        if (v37)
        {
          long long v38 = objc_alloc_init(GEOEVStateInfo);
          -[GEOEVStateInfo setRemainingBatteryCharge:](v38, "setRemainingBatteryCharge:", [v37 remainingBatteryCharge]);
          -[GEOEVStateInfo setRemainingBatteryPercentage:](v38, "setRemainingBatteryPercentage:", [v37 remainingBatteryPercentage]);
          [(GEOETAStep *)v24 setEvStateInfo:v38];
        }
        [(GEOETARoute *)v17 addStep:v24];

        ++v15;
      }
      [(GEOETATrafficUpdateWaypointRoute *)v41 addRouteLeg:v17];
    }
  }
  else
  {
LABEL_26:
    long long v41 = 0;
  }

  return v41;
}

- (void)_iterateTravelTimeRangesForRouteCoordinate:(PolylineCoordinate)a3 etaRoute:(id)a4 fromOrigin:(BOOL)a5 handler:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  if (v11)
  {
    if (v10)
    {
      uint64_t v12 = [v10 startRouteCoordinate];
      if (a3.index < v12 || a3.index == v12 && a3.offset < *((float *)&v12 + 1))
      {
        double v13 = GEOGetGEOComposedRouteLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          GEOPolylineCoordinateAsString(*(void *)&a3, 1, 0, v14);
          id v15 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v16 = [v10 startRouteCoordinate];
          unint64_t v18 = GEOPolylineCoordinateAsString(v16, 1, 0, v17);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v15;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v18;
          _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, "Input route coordinate is [%@], but provided ETA route starts from coordinate [%@]. Mixing travel times from directions responses and ETAU responses is not supported yet.", buf, 0x16u);
        }
        id v10 = 0;
      }
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v36 = 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __99__GEOComposedRoute_Extras___iterateTravelTimeRangesForRouteCoordinate_etaRoute_fromOrigin_handler___block_invoke;
    v29[3] = &unk_1E53EC068;
    BOOL v33 = a5;
    PolylineCoordinate v32 = a3;
    v29[4] = self;
    id v30 = v11;
    uint64_t v31 = buf;
    unint64_t v19 = (void *)MEMORY[0x18C120660](v29);
    if (v10)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v20 = objc_msgSend(v10, "legs", 0);
      uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v34 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v26;
LABEL_12:
        uint64_t v23 = 0;
        while (1)
        {
          if (*(void *)v26 != v22) {
            objc_enumerationMutation(v20);
          }
          BOOL v24 = [*(id *)(*((void *)&v25 + 1) + 8 * v23) steps];
          [v24 enumerateObjectsUsingBlock:v19];

          if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
            break;
          }
          if (v21 == ++v23)
          {
            uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v34 count:16];
            if (v21) {
              goto LABEL_12;
            }
            break;
          }
        }
      }
    }
    else
    {
      uint64_t v20 = [(GEOComposedRoute *)self steps];
      [v20 enumerateObjectsUsingBlock:v19];
    }

    _Block_object_dispose(buf, 8);
  }
}

void __99__GEOComposedRoute_Extras___iterateTravelTimeRangesForRouteCoordinate_etaRoute_fromOrigin_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  unint64_t v7 = v6;
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v8 = [v6 routeCoordinateRange];
    unsigned int v9 = *(_DWORD *)(a1 + 56);
    if (v9 < v8 || v9 == v8 && *(float *)(a1 + 60) < *((float *)&v8 + 1)) {
      goto LABEL_10;
    }
    if (*(unsigned char *)(a1 + 64))
    {
LABEL_9:
      double v13 = *(void **)(a1 + 32);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __99__GEOComposedRoute_Extras___iterateTravelTimeRangesForRouteCoordinate_etaRoute_fromOrigin_handler___block_invoke_2;
      v16[3] = &unk_1E53EC040;
      char v20 = *(unsigned char *)(a1 + 64);
      uint64_t v19 = *(void *)(a1 + 56);
      v16[4] = v13;
      id v14 = *(id *)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 48);
      id v17 = v14;
      uint64_t v18 = v15;
      [v13 _iterateTravelTimeRangesForStep:v7 handler:v16];
      *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

      goto LABEL_10;
    }
  }
  [v7 routeCoordinateRange];
  unsigned int v12 = *(_DWORD *)(a1 + 56);
  if (v12 <= v10 && (v12 != v10 || *(float *)(a1 + 60) <= v11)) {
    goto LABEL_9;
  }
LABEL_10:
}

uint64_t __99__GEOComposedRoute_Extras___iterateTravelTimeRangesForRouteCoordinate_etaRoute_fromOrigin_handler___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4, double a5, double a6)
{
  double v7 = a6;
  double v8 = a5;
  unsigned int v10 = (void *)result;
  LODWORD(a6) = HIDWORD(a2);
  LODWORD(a5) = HIDWORD(a3);
  int v11 = *(unsigned __int8 *)(result + 64);
  unsigned int v12 = *(_DWORD *)(result + 56);
  if (*(unsigned char *)(result + 64))
  {
    if (v12 < a2) {
      return result;
    }
    if (v12 == a2)
    {
      if (fabs(v8) >= 0.01 && *(float *)(result + 60) >= *((float *)&a2 + 1)) {
        goto LABEL_18;
      }
    }
    else if (fabs(v8) >= 0.01)
    {
      goto LABEL_18;
    }
  }
  else if (v12 <= a3)
  {
    BOOL v14 = v12 == a3 && *(float *)(result + 60) > *((float *)&a3 + 1);
    if (fabs(v8) >= 0.01 && !v14)
    {
LABEL_18:
      uint64_t v15 = *(void *)(result + 56);
      if (a2 == v15)
      {
        if (*((float *)&a2 + 1) > *((float *)&v15 + 1)) {
          goto LABEL_30;
        }
      }
      else if (a2 >= v15)
      {
        goto LABEL_30;
      }
      if (v15 == a3)
      {
        if (*((float *)&v15 + 1) > *((float *)&a3 + 1)) {
          goto LABEL_30;
        }
LABEL_26:
        uint64_t v16 = *(void **)(result + 32);
        if (v11)
        {
          uint64_t v17 = a2;
        }
        else
        {
          uint64_t v17 = v10[7];
          uint64_t v15 = a3;
        }
        objc_msgSend(v16, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v17, v15, a5, a6);
        double v7 = v18 / v8 * v7;
        double v8 = v18;
        goto LABEL_30;
      }
      if (v15 < a3) {
        goto LABEL_26;
      }
LABEL_30:
      double result = (*(uint64_t (**)(double, double))(v10[5] + 16))(v8, v7);
      *a4 = *(unsigned char *)(*(void *)(v10[6] + 8) + 24);
    }
  }
  return result;
}

- (void)_iterateTravelTimeRangesForStep:(id)a3 handler:(id)a4
{
  id v6 = a3;
  double v7 = (void (**)(id, uint64_t, uint64_t, unsigned char *, double, double))a4;
  if (v7)
  {
    char v34 = 0;
    double v8 = [v6 timeCheckpoints];
    if (v8)
    {
      uint64_t v9 = [v6 routeCoordinateRange];
      uint64_t v10 = [v8 timeToNextCheckpointsCount] - 1;
      __asm { FMOV            V9.2S, #-1.0 }
      do
      {
        if (v10 + 1 <= 0) {
          break;
        }
        unsigned int v16 = [v8 distToNextCheckpointAtIndex:v10];
        unsigned int v17 = [v8 timeToNextCheckpointAtIndex:v10];
        double v18 = (double)v16;
        if (v10)
        {
          $212C09783140BCCD23384160D545CE0D v19 = [(GEOComposedRoute *)self routeCoordinateForDistance:v9 afterRouteCoordinate:(double)v16];
        }
        else
        {
          [v6 routeCoordinateRange];
          $212C09783140BCCD23384160D545CE0D v19 = v20;
        }
        v21.i64[0] = v9;
        v21.u64[1] = (unint64_t)v19;
        *(int32x2_t *)v21.i8 = vshrn_n_s64(v21, 0x20uLL);
        int8x8_t v22 = (int8x8_t)vcltz_f32(*(float32x2_t *)v21.i8);
        v23.i64[0] = v22.i32[0];
        v23.i64[1] = v22.i32[1];
        int8x16_t v24 = v23;
        float32x2_t v25 = vrndm_f32(*(float32x2_t *)v21.i8);
        int32x2_t v26 = vadd_s32((int32x2_t)vcvt_u32_f32(v25), (int32x2_t)__PAIR64__(v19.var0, v9));
        v23.i64[0] = v26.u32[0];
        v23.i64[1] = v26.u32[1];
        int8x16_t v27 = vorrq_s8((int8x16_t)vshll_n_s32((int32x2_t)vbsl_s8(v22, _D9, (int8x8_t)vsub_f32(*(float32x2_t *)v21.i8, v25)), 0x20uLL), vbicq_s8(v23, v24));
        v7[2](v7, v27.i64[0], v27.i64[1], &v34, v18, (double)v17);
        --v10;
        uint64_t v9 = (uint64_t)v19;
      }
      while (!v34);
    }
    else
    {
      uint64_t v28 = [v6 routeCoordinateRange];
      uint64_t v30 = v29;
      [v6 distance];
      double v32 = v31;
      [v6 travelTime];
      v7[2](v7, v28, v30, &v34, v32, v33);
    }
  }
}

- (int)_routeCreationMethod
{
  unint64_t v2 = [(GEOComposedRoute *)self source];
  if (v2 == 3) {
    return 1;
  }
  else {
    return 2 * (v2 == 2);
  }
}

- (void)updateWithPersistentData:(id)a3
{
  id v10 = a3;
  id v4 = [(GEOComposedRoute *)self uniqueRouteID];
  unint64_t v5 = [v10 routeID];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    double v7 = [v10 userProvidedName];
    [(GEOComposedRoute *)self setUserProvidedName:v7];

    double v8 = [v10 userProvidedNotes];
    [(GEOComposedRoute *)self setUserProvidedNotes:v8];

    uint64_t v9 = [v10 storageID];
    [(GEOComposedRoute *)self setStorageID:v9];
  }
}

@end