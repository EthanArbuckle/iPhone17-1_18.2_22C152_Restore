@interface GEOMapServiceTraits
+ (BOOL)isValid:(id)a3;
+ (Class)deviceDisplayLanguageType;
+ (Class)evChargingPortType;
+ (Class)historicalLocationsType;
+ (Class)photoSizesType;
+ (Class)reviewUserPhotoSizesType;
- (BOOL)analyticsOptOut;
- (BOOL)appDarkMode;
- (BOOL)autocompleteOriginationEditingServerWaypoints;
- (BOOL)autocompleteRequestSupportsSectionHeader;
- (BOOL)containsSensitiveData;
- (BOOL)deviceDarkMode;
- (BOOL)deviceInVehicle;
- (BOOL)hasAddStopRouteInfo;
- (BOOL)hasAnalyticsAppIdentifier;
- (BOOL)hasAnalyticsOptOut;
- (BOOL)hasAppDarkMode;
- (BOOL)hasAppIdentifier;
- (BOOL)hasAppMajorVersion;
- (BOOL)hasAppMinorVersion;
- (BOOL)hasAutocompleteOriginationEditingServerWaypoints;
- (BOOL)hasAutocompleteOriginationPreviousLatlng;
- (BOOL)hasAutocompleteOriginationType;
- (BOOL)hasAutocompleteRequestSupportsSectionHeader;
- (BOOL)hasAutomobileOptions;
- (BOOL)hasAuxiliaryTierNumResults;
- (BOOL)hasCarHeadunitConnectionType;
- (BOOL)hasCarHeadunitInteractionModel;
- (BOOL)hasCarHeadunitManufacturer;
- (BOOL)hasCarHeadunitModel;
- (BOOL)hasCarHeadunitPixelHeight;
- (BOOL)hasCarHeadunitPixelWidth;
- (BOOL)hasContainsSensitiveData;
- (BOOL)hasCurrentLocaleCurrencySymbol;
- (BOOL)hasCyclingOptions;
- (BOOL)hasDeviceBatteryState;
- (BOOL)hasDeviceDarkMode;
- (BOOL)hasDeviceInVehicle;
- (BOOL)hasDeviceInterfaceOrientation;
- (BOOL)hasDeviceKeyboardLocale;
- (BOOL)hasDeviceLocation;
- (BOOL)hasDevicePlatform;
- (BOOL)hasDeviceSpokenLocale;
- (BOOL)hasDisplayRegion;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHardwareIdentifier;
- (BOOL)hasHttpRequestPriority;
- (BOOL)hasIsAPICall;
- (BOOL)hasIsRefund;
- (BOOL)hasIsRoutePlanningEditStopFillRequest;
- (BOOL)hasIsSettlement;
- (BOOL)hasIsTourist;
- (BOOL)hasIsWidgetRequest;
- (BOOL)hasIsWithinHikingBoundary;
- (BOOL)hasIsWithinHikingBufferRegion;
- (BOOL)hasMapRegion;
- (BOOL)hasMapZoomLevel;
- (BOOL)hasMode;
- (BOOL)hasNavigating;
- (BOOL)hasNavigationTransportType;
- (BOOL)hasOptimizeSearchRequestComponents;
- (BOOL)hasPhotoAlbumCount;
- (BOOL)hasPhotosCount;
- (BOOL)hasPlaceSummaryRevision;
- (BOOL)hasPreviousSearchViewport;
- (BOOL)hasPrivacyMetadata;
- (BOOL)hasProviderID;
- (BOOL)hasRatingsCount;
- (BOOL)hasRecentAutocompleteSessionData;
- (BOOL)hasRelatedPlaceItemCount;
- (BOOL)hasRequestMode;
- (BOOL)hasRequestPriority;
- (BOOL)hasRequestPurpose;
- (BOOL)hasResultRefinementQuery;
- (BOOL)hasReviewUserPhotosCount;
- (BOOL)hasRouteStopCount;
- (BOOL)hasSearchImplicitFilterInfo;
- (BOOL)hasSearchOriginationEditingServerWaypoints;
- (BOOL)hasSearchOriginationPreviousLatlng;
- (BOOL)hasSearchOriginationType;
- (BOOL)hasSearchRequestType;
- (BOOL)hasSequenceNumber;
- (BOOL)hasSessionId;
- (BOOL)hasSessionRelativeTimestamp;
- (BOOL)hasSource;
- (BOOL)hasSpotlightSearchPunchinEncodedString;
- (BOOL)hasSupportAutocompleteGuideResults;
- (BOOL)hasSupportAutocompletePublisherResults;
- (BOOL)hasSupportChildItems;
- (BOOL)hasSupportClientRankingCompositeFeatures;
- (BOOL)hasSupportClientRankingFeatureMetadata;
- (BOOL)hasSupportDirectionIntentAutocomplete;
- (BOOL)hasSupportDirectionIntentSearch;
- (BOOL)hasSupportDymSuggestion;
- (BOOL)hasSupportStructuredRapAffordance;
- (BOOL)hasSupportUnresolvedDirectionIntent;
- (BOOL)hasSupportsBrandFallback;
- (BOOL)hasTimeSinceMapEnteredForeground;
- (BOOL)hasTimeSinceMapViewportChanged;
- (BOOL)hasTransitOptions;
- (BOOL)hasTransitScheduleFilter;
- (BOOL)hasTransitTripStopTimeFilter;
- (BOOL)hasUserActionMetadata;
- (BOOL)hasVenueIdentifier;
- (BOOL)hasWalkingOptions;
- (BOOL)hasWantsBrandIcon;
- (BOOL)hasWantsRouteCreationTip;
- (BOOL)isAPICall;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRefund;
- (BOOL)isRoutePlanningEditStopFillRequest;
- (BOOL)isSettlement;
- (BOOL)isWidgetRequest;
- (BOOL)isWithinHikingBoundary;
- (BOOL)isWithinHikingBufferRegion;
- (BOOL)navigating;
- (BOOL)optimizeSearchRequestComponents;
- (BOOL)readFrom:(id)a3;
- (BOOL)searchOriginationEditingServerWaypoints;
- (BOOL)supportAutocompleteGuideResults;
- (BOOL)supportAutocompletePublisherResults;
- (BOOL)supportChildItems;
- (BOOL)supportClientRankingCompositeFeatures;
- (BOOL)supportClientRankingFeatureMetadata;
- (BOOL)supportDirectionIntentAutocomplete;
- (BOOL)supportDirectionIntentSearch;
- (BOOL)supportDymSuggestion;
- (BOOL)supportStructuredRapAffordance;
- (BOOL)supportUnresolvedDirectionIntent;
- (BOOL)supportsBrandFallback;
- (BOOL)useBackgroundUrl;
- (BOOL)wantsBrandIcon;
- (BOOL)wantsRouteCreationTip;
- (GEOAddStopRouteInfo)addStopRouteInfo;
- (GEOAutomobileOptions)automobileOptions;
- (GEOCyclingOptions)cyclingOptions;
- (GEOLatLng)autocompleteOriginationPreviousLatlng;
- (GEOLatLng)searchOriginationPreviousLatlng;
- (GEOLocation)deviceLocation;
- (GEOMapRegion)mapRegion;
- (GEOMapServiceTraits)init;
- (GEOMapServiceTraits)initWithData:(id)a3;
- (GEOMapServiceTraits)initWithDictionary:(id)a3;
- (GEOMapServiceTraits)initWithJSON:(id)a3;
- (GEOPDAutocompleteSessionData)recentAutocompleteSessionData;
- (GEOPDResultRefinementQuery)resultRefinementQuery;
- (GEOPDSSessionUserActionMetadata)userActionMetadata;
- (GEOPDVenueIdentifier)venueIdentifier;
- (GEOPDViewportInfo)previousSearchViewport;
- (GEOPrivacyMetadata)privacyMetadata;
- (GEOSearchImplicitFilterInfo)searchImplicitFilterInfo;
- (GEOSessionID)sessionId;
- (GEOTraitsTransitScheduleFilter)transitScheduleFilter;
- (GEOTraitsTransitScheduleFilter)transitTripStopTimeFilter;
- (GEOTransitOptions)transitOptions;
- (GEOWalkingOptions)walkingOptions;
- (NSMutableArray)deviceDisplayLanguages;
- (NSMutableArray)evChargingPorts;
- (NSMutableArray)historicalLocations;
- (NSMutableArray)photoSizes;
- (NSMutableArray)reviewUserPhotoSizes;
- (NSString)analyticsAppIdentifier;
- (NSString)appIdentifier;
- (NSString)appMajorVersion;
- (NSString)appMinorVersion;
- (NSString)carHeadunitManufacturer;
- (NSString)carHeadunitModel;
- (NSString)currentLocaleCurrencySymbol;
- (NSString)deviceKeyboardLocale;
- (NSString)deviceSpokenLocale;
- (NSString)displayRegion;
- (NSString)hardwareIdentifier;
- (NSString)providerID;
- (NSString)spotlightSearchPunchinEncodedString;
- (PBUnknownFields)unknownFields;
- (double)carHeadunitPixelHeight;
- (double)carHeadunitPixelWidth;
- (double)isTourist;
- (double)mapZoomLevel;
- (double)sessionRelativeTimestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)autocompleteOriginationTypeAsString:(int)a3;
- (id)carHeadunitConnectionTypeAsString:(int)a3;
- (id)carHeadunitInteractionModelAsString:(int)a3;
- (id)copyByIncrementingSessionCounters;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)deviceBatteryStateAsString:(int)a3;
- (id)deviceDisplayLanguageAtIndex:(unint64_t)a3;
- (id)deviceInterfaceOrientationAsString:(int)a3;
- (id)devicePlatformAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)engineTypesAsString:(int)a3;
- (id)evChargingPortAtIndex:(unint64_t)a3;
- (id)historicalLocationsAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)knownClientResolvedTypesAsString:(int)a3;
- (id)knownRefinementTypesAsString:(int)a3;
- (id)modeAsString:(int)a3;
- (id)navigationTransportTypeAsString:(int)a3;
- (id)photoSizesAtIndex:(unint64_t)a3;
- (id)requestModeAsString:(int)a3;
- (id)requestPriorityAsString:(int)a3;
- (id)requestPurposeAsString:(int)a3;
- (id)reviewUserPhotoSizesAtIndex:(unint64_t)a3;
- (id)searchOriginationTypeAsString:(int)a3;
- (id)searchRequestTypeAsString:(int)a3;
- (id)sourceAsString:(int)a3;
- (id)supportedAutocompleteListTypesAsString:(int)a3;
- (id)supportedAutocompleteResultCellTypesAsString:(int)a3;
- (id)supportedChildActionsAsString:(int)a3;
- (id)supportedPlaceSummaryFormatTypesAsString:(int)a3;
- (id)supportedSearchTierTypesAsString:(int)a3;
- (id)transportTypesAsString:(int)a3;
- (int)StringAsAutocompleteOriginationType:(id)a3;
- (int)StringAsCarHeadunitConnectionType:(id)a3;
- (int)StringAsCarHeadunitInteractionModel:(id)a3;
- (int)StringAsDeviceBatteryState:(id)a3;
- (int)StringAsDeviceInterfaceOrientation:(id)a3;
- (int)StringAsDevicePlatform:(id)a3;
- (int)StringAsEngineTypes:(id)a3;
- (int)StringAsKnownClientResolvedTypes:(id)a3;
- (int)StringAsKnownRefinementTypes:(id)a3;
- (int)StringAsMode:(id)a3;
- (int)StringAsNavigationTransportType:(id)a3;
- (int)StringAsRequestMode:(id)a3;
- (int)StringAsRequestPriority:(id)a3;
- (int)StringAsRequestPurpose:(id)a3;
- (int)StringAsSearchOriginationType:(id)a3;
- (int)StringAsSearchRequestType:(id)a3;
- (int)StringAsSource:(id)a3;
- (int)StringAsSupportedAutocompleteListTypes:(id)a3;
- (int)StringAsSupportedAutocompleteResultCellTypes:(id)a3;
- (int)StringAsSupportedChildActions:(id)a3;
- (int)StringAsSupportedPlaceSummaryFormatTypes:(id)a3;
- (int)StringAsSupportedSearchTierTypes:(id)a3;
- (int)StringAsTransportTypes:(id)a3;
- (int)autocompleteOriginationType;
- (int)carHeadunitConnectionType;
- (int)carHeadunitInteractionModel;
- (int)deviceBatteryState;
- (int)deviceInterfaceOrientation;
- (int)devicePlatform;
- (int)engineTypeAtIndex:(unint64_t)a3;
- (int)engineTypes;
- (int)knownClientResolvedTypeAtIndex:(unint64_t)a3;
- (int)knownClientResolvedTypes;
- (int)knownRefinementTypeAtIndex:(unint64_t)a3;
- (int)knownRefinementTypes;
- (int)mode;
- (int)navigationTransportType;
- (int)requestMode;
- (int)requestPriority;
- (int)requestPurpose;
- (int)searchOriginationType;
- (int)searchRequestType;
- (int)source;
- (int)supportedAutocompleteListTypeAtIndex:(unint64_t)a3;
- (int)supportedAutocompleteListTypes;
- (int)supportedAutocompleteResultCellTypeAtIndex:(unint64_t)a3;
- (int)supportedAutocompleteResultCellTypes;
- (int)supportedChildActionAtIndex:(unint64_t)a3;
- (int)supportedChildActions;
- (int)supportedPlaceSummaryFormatTypeAtIndex:(unint64_t)a3;
- (int)supportedPlaceSummaryFormatTypes;
- (int)supportedSearchTierTypeAtIndex:(unint64_t)a3;
- (int)supportedSearchTierTypes;
- (int)transportTypeAtIndex:(unint64_t)a3;
- (int)transportTypes;
- (unint64_t)deviceDisplayLanguagesCount;
- (unint64_t)engineTypesCount;
- (unint64_t)evChargingPortsCount;
- (unint64_t)hash;
- (unint64_t)historicalLocationsCount;
- (unint64_t)knownClientResolvedTypesCount;
- (unint64_t)knownRefinementTypesCount;
- (unint64_t)photoSizesCount;
- (unint64_t)preferredBrandAtIndex:(unint64_t)a3;
- (unint64_t)preferredBrands;
- (unint64_t)preferredBrandsCount;
- (unint64_t)reviewUserPhotoSizesCount;
- (unint64_t)supportedAutocompleteListTypesCount;
- (unint64_t)supportedAutocompleteResultCellTypesCount;
- (unint64_t)supportedChildActionsCount;
- (unint64_t)supportedPlaceSummaryFormatTypesCount;
- (unint64_t)supportedSearchTierTypesCount;
- (unint64_t)transportTypesCount;
- (unsigned)auxiliaryTierNumResults;
- (unsigned)httpRequestPriority;
- (unsigned)photoAlbumCount;
- (unsigned)photosCount;
- (unsigned)placeSummaryRevision;
- (unsigned)ratingsCount;
- (unsigned)relatedPlaceItemCount;
- (unsigned)reviewUserPhotosCount;
- (unsigned)routeStopCount;
- (unsigned)sequenceNumber;
- (unsigned)timeSinceMapEnteredForeground;
- (unsigned)timeSinceMapViewportChanged;
- (void)_addNoFlagsDeviceDisplayLanguage:(uint64_t)a1;
- (void)_addNoFlagsEvChargingPort:(uint64_t)a1;
- (void)_addNoFlagsHistoricalLocations:(uint64_t)a1;
- (void)_addNoFlagsPhotoSizes:(uint64_t)a1;
- (void)_addNoFlagsReviewUserPhotoSizes:(uint64_t)a1;
- (void)_internal_incrementSessionCounters;
- (void)_readAddStopRouteInfo;
- (void)_readAnalyticsAppIdentifier;
- (void)_readAppIdentifier;
- (void)_readAppMajorVersion;
- (void)_readAppMinorVersion;
- (void)_readAutocompleteOriginationPreviousLatlng;
- (void)_readAutomobileOptions;
- (void)_readCarHeadunitManufacturer;
- (void)_readCarHeadunitModel;
- (void)_readCurrentLocaleCurrencySymbol;
- (void)_readCyclingOptions;
- (void)_readDeviceDisplayLanguages;
- (void)_readDeviceKeyboardLocale;
- (void)_readDeviceLocation;
- (void)_readDeviceSpokenLocale;
- (void)_readDisplayRegion;
- (void)_readEngineTypes;
- (void)_readEvChargingPorts;
- (void)_readHardwareIdentifier;
- (void)_readHistoricalLocations;
- (void)_readKnownClientResolvedTypes;
- (void)_readKnownRefinementTypes;
- (void)_readMapRegion;
- (void)_readPhotoSizes;
- (void)_readPreferredBrands;
- (void)_readPreviousSearchViewport;
- (void)_readPrivacyMetadata;
- (void)_readProviderID;
- (void)_readRecentAutocompleteSessionData;
- (void)_readResultRefinementQuery;
- (void)_readReviewUserPhotoSizes;
- (void)_readSearchImplicitFilterInfo;
- (void)_readSearchOriginationPreviousLatlng;
- (void)_readSpotlightSearchPunchinEncodedString;
- (void)_readSupportedAutocompleteListTypes;
- (void)_readSupportedAutocompleteResultCellTypes;
- (void)_readSupportedChildActions;
- (void)_readSupportedPlaceSummaryFormatTypes;
- (void)_readSupportedSearchTierTypes;
- (void)_readTransitOptions;
- (void)_readTransitScheduleFilter;
- (void)_readTransitTripStopTimeFilter;
- (void)_readTransportTypes;
- (void)_readUserActionMetadata;
- (void)_readVenueIdentifier;
- (void)_readWalkingOptions;
- (void)addDeviceDisplayLanguage:(id)a3;
- (void)addEngineType:(int)a3;
- (void)addEvChargingPort:(id)a3;
- (void)addHistoricalLocations:(id)a3;
- (void)addKnownClientResolvedType:(int)a3;
- (void)addKnownRefinementType:(int)a3;
- (void)addPhotoSizes:(id)a3;
- (void)addPreferredBrand:(unint64_t)a3;
- (void)addReviewUserPhotoSizes:(id)a3;
- (void)addSupportedAutocompleteListType:(int)a3;
- (void)addSupportedAutocompleteResultCellType:(int)a3;
- (void)addSupportedChildAction:(int)a3;
- (void)addSupportedPlaceSummaryFormatType:(int)a3;
- (void)addSupportedSearchTierType:(int)a3;
- (void)addTransportType:(int)a3;
- (void)clearDeviceDisplayLanguages;
- (void)clearEngineTypes;
- (void)clearEvChargingPorts;
- (void)clearHistoricalLocations;
- (void)clearKnownClientResolvedTypes;
- (void)clearKnownRefinementTypes;
- (void)clearLocations;
- (void)clearPhotoSizes;
- (void)clearPreferredBrands;
- (void)clearReviewUserPhotoSizes;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearSessionId;
- (void)clearSupportedAutocompleteListTypes;
- (void)clearSupportedAutocompleteResultCellTypes;
- (void)clearSupportedChildActions;
- (void)clearSupportedPlaceSummaryFormatTypes;
- (void)clearSupportedSearchTierTypes;
- (void)clearTransportTypes;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddStopRouteInfo:(id)a3;
- (void)setAnalyticsAppIdentifier:(id)a3;
- (void)setAnalyticsOptOut:(BOOL)a3;
- (void)setAppDarkMode:(BOOL)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setAppMajorVersion:(id)a3;
- (void)setAppMinorVersion:(id)a3;
- (void)setAutocompleteOriginationEditingServerWaypoints:(BOOL)a3;
- (void)setAutocompleteOriginationPreviousLatlng:(id)a3;
- (void)setAutocompleteOriginationType:(int)a3;
- (void)setAutocompleteRequestSupportsSectionHeader:(BOOL)a3;
- (void)setAutomobileOptions:(id)a3;
- (void)setAuxiliaryTierNumResults:(unsigned int)a3;
- (void)setCarHeadunitConnectionType:(int)a3;
- (void)setCarHeadunitInteractionModel:(int)a3;
- (void)setCarHeadunitManufacturer:(id)a3;
- (void)setCarHeadunitModel:(id)a3;
- (void)setCarHeadunitPixelHeight:(double)a3;
- (void)setCarHeadunitPixelWidth:(double)a3;
- (void)setContainsSensitiveData:(BOOL)a3;
- (void)setCurrentLocaleCurrencySymbol:(id)a3;
- (void)setCyclingOptions:(id)a3;
- (void)setDeviceBatteryState:(int)a3;
- (void)setDeviceDarkMode:(BOOL)a3;
- (void)setDeviceDisplayLanguages:(id)a3;
- (void)setDeviceInVehicle:(BOOL)a3;
- (void)setDeviceInterfaceOrientation:(int)a3;
- (void)setDeviceKeyboardLocale:(id)a3;
- (void)setDeviceLocation:(id)a3;
- (void)setDevicePlatform:(int)a3;
- (void)setDeviceSpokenLocale:(id)a3;
- (void)setDisplayRegion:(id)a3;
- (void)setEngineTypes:(int *)a3 count:(unint64_t)a4;
- (void)setEvChargingPorts:(id)a3;
- (void)setHardwareIdentifier:(id)a3;
- (void)setHasAnalyticsOptOut:(BOOL)a3;
- (void)setHasAppDarkMode:(BOOL)a3;
- (void)setHasAutocompleteOriginationEditingServerWaypoints:(BOOL)a3;
- (void)setHasAutocompleteOriginationType:(BOOL)a3;
- (void)setHasAutocompleteRequestSupportsSectionHeader:(BOOL)a3;
- (void)setHasAuxiliaryTierNumResults:(BOOL)a3;
- (void)setHasCarHeadunitConnectionType:(BOOL)a3;
- (void)setHasCarHeadunitInteractionModel:(BOOL)a3;
- (void)setHasCarHeadunitPixelHeight:(BOOL)a3;
- (void)setHasCarHeadunitPixelWidth:(BOOL)a3;
- (void)setHasContainsSensitiveData:(BOOL)a3;
- (void)setHasDeviceBatteryState:(BOOL)a3;
- (void)setHasDeviceDarkMode:(BOOL)a3;
- (void)setHasDeviceInVehicle:(BOOL)a3;
- (void)setHasDeviceInterfaceOrientation:(BOOL)a3;
- (void)setHasDevicePlatform:(BOOL)a3;
- (void)setHasHttpRequestPriority:(BOOL)a3;
- (void)setHasIsAPICall:(BOOL)a3;
- (void)setHasIsRefund:(BOOL)a3;
- (void)setHasIsRoutePlanningEditStopFillRequest:(BOOL)a3;
- (void)setHasIsSettlement:(BOOL)a3;
- (void)setHasIsTourist:(BOOL)a3;
- (void)setHasIsWidgetRequest:(BOOL)a3;
- (void)setHasIsWithinHikingBoundary:(BOOL)a3;
- (void)setHasIsWithinHikingBufferRegion:(BOOL)a3;
- (void)setHasMapZoomLevel:(BOOL)a3;
- (void)setHasMode:(BOOL)a3;
- (void)setHasNavigating:(BOOL)a3;
- (void)setHasNavigationTransportType:(BOOL)a3;
- (void)setHasOptimizeSearchRequestComponents:(BOOL)a3;
- (void)setHasPhotoAlbumCount:(BOOL)a3;
- (void)setHasPhotosCount:(BOOL)a3;
- (void)setHasPlaceSummaryRevision:(BOOL)a3;
- (void)setHasRatingsCount:(BOOL)a3;
- (void)setHasRelatedPlaceItemCount:(BOOL)a3;
- (void)setHasRequestMode:(BOOL)a3;
- (void)setHasRequestPriority:(BOOL)a3;
- (void)setHasRequestPurpose:(BOOL)a3;
- (void)setHasReviewUserPhotosCount:(BOOL)a3;
- (void)setHasRouteStopCount:(BOOL)a3;
- (void)setHasSearchOriginationEditingServerWaypoints:(BOOL)a3;
- (void)setHasSearchOriginationType:(BOOL)a3;
- (void)setHasSearchRequestType:(BOOL)a3;
- (void)setHasSequenceNumber:(BOOL)a3;
- (void)setHasSessionId:(BOOL)a3;
- (void)setHasSessionRelativeTimestamp:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setHasSupportAutocompleteGuideResults:(BOOL)a3;
- (void)setHasSupportAutocompletePublisherResults:(BOOL)a3;
- (void)setHasSupportChildItems:(BOOL)a3;
- (void)setHasSupportClientRankingCompositeFeatures:(BOOL)a3;
- (void)setHasSupportClientRankingFeatureMetadata:(BOOL)a3;
- (void)setHasSupportDirectionIntentAutocomplete:(BOOL)a3;
- (void)setHasSupportDirectionIntentSearch:(BOOL)a3;
- (void)setHasSupportDymSuggestion:(BOOL)a3;
- (void)setHasSupportStructuredRapAffordance:(BOOL)a3;
- (void)setHasSupportUnresolvedDirectionIntent:(BOOL)a3;
- (void)setHasSupportsBrandFallback:(BOOL)a3;
- (void)setHasTimeSinceMapEnteredForeground:(BOOL)a3;
- (void)setHasTimeSinceMapViewportChanged:(BOOL)a3;
- (void)setHasWantsBrandIcon:(BOOL)a3;
- (void)setHasWantsRouteCreationTip:(BOOL)a3;
- (void)setHistoricalLocations:(id)a3;
- (void)setHttpRequestPriority:(unsigned int)a3;
- (void)setIsAPICall:(BOOL)a3;
- (void)setIsRefund:(BOOL)a3;
- (void)setIsRoutePlanningEditStopFillRequest:(BOOL)a3;
- (void)setIsSettlement:(BOOL)a3;
- (void)setIsTourist:(double)a3;
- (void)setIsWidgetRequest:(BOOL)a3;
- (void)setIsWithinHikingBoundary:(BOOL)a3;
- (void)setIsWithinHikingBufferRegion:(BOOL)a3;
- (void)setKnownClientResolvedTypes:(int *)a3 count:(unint64_t)a4;
- (void)setKnownRefinementTypes:(int *)a3 count:(unint64_t)a4;
- (void)setMapRegion:(id)a3;
- (void)setMapZoomLevel:(double)a3;
- (void)setMode:(int)a3;
- (void)setNavigating:(BOOL)a3;
- (void)setNavigationTransportType:(int)a3;
- (void)setOptimizeSearchRequestComponents:(BOOL)a3;
- (void)setPhotoAlbumCount:(unsigned int)a3;
- (void)setPhotoSizes:(id)a3;
- (void)setPhotosCount:(unsigned int)a3;
- (void)setPlaceSummaryRevision:(unsigned int)a3;
- (void)setPreferredBrands:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setPreviousSearchViewport:(id)a3;
- (void)setPrivacyMetadata:(id)a3;
- (void)setProviderID:(id)a3;
- (void)setRatingsCount:(unsigned int)a3;
- (void)setRecentAutocompleteSessionData:(id)a3;
- (void)setRelatedPlaceItemCount:(unsigned int)a3;
- (void)setRequestMode:(int)a3;
- (void)setRequestPriority:(int)a3;
- (void)setRequestPurpose:(int)a3;
- (void)setResultRefinementQuery:(id)a3;
- (void)setReviewUserPhotoSizes:(id)a3;
- (void)setReviewUserPhotosCount:(unsigned int)a3;
- (void)setRouteStopCount:(unsigned int)a3;
- (void)setSearchImplicitFilterInfo:(id)a3;
- (void)setSearchOriginationEditingServerWaypoints:(BOOL)a3;
- (void)setSearchOriginationPreviousLatlng:(id)a3;
- (void)setSearchOriginationType:(int)a3;
- (void)setSearchRequestType:(int)a3;
- (void)setSequenceNumber:(unsigned int)a3;
- (void)setSessionId:(GEOSessionID)a3;
- (void)setSessionRelativeTimestamp:(double)a3;
- (void)setSource:(int)a3;
- (void)setSpotlightSearchPunchinEncodedString:(id)a3;
- (void)setSupportAutocompleteGuideResults:(BOOL)a3;
- (void)setSupportAutocompletePublisherResults:(BOOL)a3;
- (void)setSupportChildItems:(BOOL)a3;
- (void)setSupportClientRankingCompositeFeatures:(BOOL)a3;
- (void)setSupportClientRankingFeatureMetadata:(BOOL)a3;
- (void)setSupportDirectionIntentAutocomplete:(BOOL)a3;
- (void)setSupportDirectionIntentSearch:(BOOL)a3;
- (void)setSupportDymSuggestion:(BOOL)a3;
- (void)setSupportStructuredRapAffordance:(BOOL)a3;
- (void)setSupportUnresolvedDirectionIntent:(BOOL)a3;
- (void)setSupportedAutocompleteListTypes:(int *)a3 count:(unint64_t)a4;
- (void)setSupportedAutocompleteResultCellTypes:(int *)a3 count:(unint64_t)a4;
- (void)setSupportedChildActions:(int *)a3 count:(unint64_t)a4;
- (void)setSupportedPlaceSummaryFormatTypes:(int *)a3 count:(unint64_t)a4;
- (void)setSupportedSearchTierTypes:(int *)a3 count:(unint64_t)a4;
- (void)setSupportsBrandFallback:(BOOL)a3;
- (void)setTimeSinceMapEnteredForeground:(unsigned int)a3;
- (void)setTimeSinceMapViewportChanged:(unsigned int)a3;
- (void)setTransitOptions:(id)a3;
- (void)setTransitScheduleFilter:(id)a3;
- (void)setTransitTripStopTimeFilter:(id)a3;
- (void)setTransportTypes:(int *)a3 count:(unint64_t)a4;
- (void)setUserActionMetadata:(id)a3;
- (void)setVenueIdentifier:(id)a3;
- (void)setWalkingOptions:(id)a3;
- (void)setWantsBrandIcon:(BOOL)a3;
- (void)setWantsRouteCreationTip:(BOOL)a3;
- (void)useOnlineToOfflineFailoverRequestModeIfAllowed;
- (void)writeTo:(id)a3;
@end

@implementation GEOMapServiceTraits

- (GEOMapServiceTraits)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOMapServiceTraits;
  v3 = [(GEOMapServiceTraits *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 13) & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOMapServiceTraitsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_141;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOMapServiceTraits *)self readAll:0];
  uint64_t flags = (uint64_t)self->_flags;
  if (flags)
  {
    *(GEOSessionID *)(v5 + 264) = self->_sessionId;
    *(void *)(v5 + 756) |= 1uLL;
    uint64_t flags = (uint64_t)self->_flags;
  }
  if ((flags & 0x10000000) != 0)
  {
    *(_DWORD *)(v5 + 708) = self->_sequenceNumber;
    *(void *)(v5 + 756) |= 0x10000000uLL;
  }
  uint64_t v10 = [(NSString *)self->_appIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 296);
  *(void *)(v5 + 296) = v10;

  uint64_t v12 = [(NSString *)self->_appMajorVersion copyWithZone:a3];
  v13 = *(void **)(v5 + 304);
  *(void *)(v5 + 304) = v12;

  uint64_t v14 = [(NSString *)self->_appMinorVersion copyWithZone:a3];
  v15 = *(void **)(v5 + 312);
  *(void *)(v5 + 312) = v14;

  id v16 = [(GEOLocation *)self->_deviceLocation copyWithZone:a3];
  v17 = *(void **)(v5 + 384);
  *(void *)(v5 + 384) = v16;

  PBRepeatedInt32Copy();
  id v18 = [(GEOMapRegion *)self->_mapRegion copyWithZone:a3];
  v19 = *(void **)(v5 + 456);
  *(void *)(v5 + 456) = v18;

  long long v142 = 0u;
  long long v143 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  v20 = self->_deviceDisplayLanguages;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v140 objects:v148 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v141;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v141 != v22) {
          objc_enumerationMutation(v20);
        }
        v24 = (void *)[*(id *)(*((void *)&v140 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addDeviceDisplayLanguage:v24];
      }
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v140 objects:v148 count:16];
    }
    while (v21);
  }

  uint64_t v25 = [(NSString *)self->_deviceKeyboardLocale copyWithZone:a3];
  v26 = *(void **)(v5 + 400);
  *(void *)(v5 + 400) = v25;

  uint64_t v27 = [(NSString *)self->_deviceSpokenLocale copyWithZone:a3];
  v28 = *(void **)(v5 + 408);
  *(void *)(v5 + 408) = v27;

  uint64_t v29 = (uint64_t)self->_flags;
  if ((v29 & 0x8000000000) != 0)
  {
    *(unsigned char *)(v5 + 731) = self->_isAPICall;
    *(void *)(v5 + 756) |= 0x8000000000uLL;
    uint64_t v29 = (uint64_t)self->_flags;
  }
  if ((v29 & 0x20000000) != 0)
  {
    *(_DWORD *)(v5 + 712) = self->_source;
    *(void *)(v5 + 756) |= 0x20000000uLL;
  }
  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  v30 = self->_photoSizes;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v136 objects:v147 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v137;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v137 != v32) {
          objc_enumerationMutation(v30);
        }
        v34 = (void *)[*(id *)(*((void *)&v136 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addPhotoSizes:v34];
      }
      uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v136 objects:v147 count:16];
    }
    while (v31);
  }

  if ((*((unsigned char *)&self->_flags + 2) & 2) != 0)
  {
    *(_DWORD *)(v5 + 664) = self->_photosCount;
    *(void *)(v5 + 756) |= 0x20000uLL;
  }
  long long v134 = 0u;
  long long v135 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  v35 = self->_reviewUserPhotoSizes;
  uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v132 objects:v146 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v133;
    do
    {
      for (uint64_t k = 0; k != v36; ++k)
      {
        if (*(void *)v133 != v37) {
          objc_enumerationMutation(v35);
        }
        v39 = (void *)[*(id *)(*((void *)&v132 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addReviewUserPhotoSizes:v39];
      }
      uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v132 objects:v146 count:16];
    }
    while (v36);
  }

  p_uint64_t flags = &self->_flags;
  uint64_t v41 = (uint64_t)self->_flags;
  if ((v41 & 0x1000000) != 0)
  {
    *(_DWORD *)(v5 + 692) = self->_reviewUserPhotosCount;
    *(void *)(v5 + 756) |= 0x1000000uLL;
    uint64_t v41 = *(void *)p_flags;
    if ((*(void *)p_flags & 0x40000000) == 0)
    {
LABEL_38:
      if ((v41 & 0x80000000) == 0) {
        goto LABEL_39;
      }
      goto LABEL_144;
    }
  }
  else if ((v41 & 0x40000000) == 0)
  {
    goto LABEL_38;
  }
  *(_DWORD *)(v5 + 716) = self->_timeSinceMapEnteredForeground;
  *(void *)(v5 + 756) |= 0x40000000uLL;
  uint64_t v41 = (uint64_t)self->_flags;
  if ((v41 & 0x80000000) == 0)
  {
LABEL_39:
    if ((v41 & 0x200) == 0) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
LABEL_144:
  *(_DWORD *)(v5 + 720) = self->_timeSinceMapViewportChanged;
  *(void *)(v5 + 756) |= 0x80000000uLL;
  if ((*(void *)&self->_flags & 0x200) != 0)
  {
LABEL_40:
    *(_DWORD *)(v5 + 632) = self->_carHeadunitInteractionModel;
    *(void *)(v5 + 756) |= 0x200uLL;
  }
LABEL_41:
  uint64_t v42 = [(NSString *)self->_carHeadunitManufacturer copyWithZone:a3];
  v43 = *(void **)(v5 + 336);
  *(void *)(v5 + 336) = v42;

  uint64_t v44 = [(NSString *)self->_carHeadunitModel copyWithZone:a3];
  v45 = *(void **)(v5 + 344);
  *(void *)(v5 + 344) = v44;

  uint64_t v46 = (uint64_t)self->_flags;
  if ((v46 & 4) != 0)
  {
    *(double *)(v5 + 360) = self->_carHeadunitPixelWidth;
    *(void *)(v5 + 756) |= 4uLL;
    uint64_t v46 = (uint64_t)self->_flags;
  }
  if ((v46 & 2) != 0)
  {
    *(double *)(v5 + 352) = self->_carHeadunitPixelHeight;
    *(void *)(v5 + 756) |= 2uLL;
  }
  id v47 = [(GEOTraitsTransitScheduleFilter *)self->_transitScheduleFilter copyWithZone:a3];
  v48 = *(void **)(v5 + 568);
  *(void *)(v5 + 568) = v47;

  uint64_t v49 = (uint64_t)self->_flags;
  if ((v49 & 0x10) != 0)
  {
    *(double *)(v5 + 464) = self->_mapZoomLevel;
    *(void *)(v5 + 756) |= 0x10uLL;
    uint64_t v49 = (uint64_t)self->_flags;
  }
  if ((v49 & 0x4000) != 0)
  {
    *(_DWORD *)(v5 + 652) = self->_mode;
    *(void *)(v5 + 756) |= 0x4000uLL;
  }
  uint64_t v50 = [(NSString *)self->_displayRegion copyWithZone:a3];
  v51 = *(void **)(v5 + 416);
  *(void *)(v5 + 416) = v50;

  uint64_t v52 = [(NSString *)self->_providerID copyWithZone:a3];
  v53 = *(void **)(v5 + 496);
  *(void *)(v5 + 496) = v52;

  v54 = &self->_flags;
  uint64_t v55 = (uint64_t)self->_flags;
  if ((v55 & 0x800) != 0)
  {
    *(_DWORD *)(v5 + 640) = self->_deviceInterfaceOrientation;
    *(void *)(v5 + 756) |= 0x800uLL;
    uint64_t v55 = *(void *)v54;
    if ((*(void *)v54 & 0x400) == 0)
    {
LABEL_51:
      if ((v55 & 0x100) == 0) {
        goto LABEL_52;
      }
      goto LABEL_148;
    }
  }
  else if ((v55 & 0x400) == 0)
  {
    goto LABEL_51;
  }
  *(_DWORD *)(v5 + 636) = self->_deviceBatteryState;
  *(void *)(v5 + 756) |= 0x400uLL;
  uint64_t v55 = (uint64_t)self->_flags;
  if ((v55 & 0x100) == 0)
  {
LABEL_52:
    if ((v55 & 0x400000000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
LABEL_148:
  *(_DWORD *)(v5 + 628) = self->_carHeadunitConnectionType;
  *(void *)(v5 + 756) |= 0x100uLL;
  if ((*(void *)&self->_flags & 0x400000000000) != 0)
  {
LABEL_53:
    *(unsigned char *)(v5 + 738) = self->_navigating;
    *(void *)(v5 + 756) |= 0x400000000000uLL;
  }
LABEL_54:
  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  v56 = self->_historicalLocations;
  uint64_t v57 = [(NSMutableArray *)v56 countByEnumeratingWithState:&v128 objects:v145 count:16];
  if (v57)
  {
    uint64_t v58 = *(void *)v129;
    do
    {
      for (uint64_t m = 0; m != v57; ++m)
      {
        if (*(void *)v129 != v58) {
          objc_enumerationMutation(v56);
        }
        v60 = (void *)[*(id *)(*((void *)&v128 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addHistoricalLocations:v60];
      }
      uint64_t v57 = [(NSMutableArray *)v56 countByEnumeratingWithState:&v128 objects:v145 count:16];
    }
    while (v57);
  }

  id v61 = [(GEOAutomobileOptions *)self->_automobileOptions copyWithZone:a3];
  v62 = *(void **)(v5 + 328);
  *(void *)(v5 + 328) = v61;

  id v63 = [(GEOTransitOptions *)self->_transitOptions copyWithZone:a3];
  v64 = *(void **)(v5 + 560);
  *(void *)(v5 + 560) = v63;

  id v65 = [(GEOWalkingOptions *)self->_walkingOptions copyWithZone:a3];
  v66 = *(void **)(v5 + 600);
  *(void *)(v5 + 600) = v65;

  PBRepeatedInt32Copy();
  v67 = &self->_flags;
  uint64_t v68 = (uint64_t)self->_flags;
  if ((v68 & 0x200000) != 0)
  {
    *(_DWORD *)(v5 + 680) = self->_requestMode;
    *(void *)(v5 + 756) |= 0x200000uLL;
    uint64_t v68 = *(void *)v67;
    if ((*(void *)v67 & 0x80000000000000) == 0)
    {
LABEL_63:
      if ((v68 & 0x100000000000000) == 0) {
        goto LABEL_65;
      }
      goto LABEL_64;
    }
  }
  else if ((v68 & 0x80000000000000) == 0)
  {
    goto LABEL_63;
  }
  *(unsigned char *)(v5 + 747) = self->_supportDirectionIntentSearch;
  *(void *)(v5 + 756) |= 0x80000000000000uLL;
  if ((*(void *)&self->_flags & 0x100000000000000) != 0)
  {
LABEL_64:
    *(unsigned char *)(v5 + 748) = self->_supportDymSuggestion;
    *(void *)(v5 + 756) |= 0x100000000000000uLL;
  }
LABEL_65:
  PBRepeatedInt32Copy();
  if ((*((unsigned char *)&self->_flags + 7) & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 752) = self->_wantsBrandIcon;
    *(void *)(v5 + 756) |= 0x1000000000000000uLL;
  }
  id v69 = [(GEOPDVenueIdentifier *)self->_venueIdentifier copyWithZone:a3];
  v70 = *(void **)(v5 + 592);
  *(void *)(v5 + 592) = v69;

  v71 = &self->_flags;
  uint64_t v72 = (uint64_t)self->_flags;
  if ((v72 & 0x4000000000) != 0)
  {
    *(unsigned char *)(v5 + 730) = self->_deviceInVehicle;
    *(void *)(v5 + 756) |= 0x4000000000uLL;
    uint64_t v72 = *(void *)v71;
    if ((*(void *)v71 & 0x400000) == 0)
    {
LABEL_69:
      if ((v72 & 0x2000) == 0) {
        goto LABEL_71;
      }
      goto LABEL_70;
    }
  }
  else if ((v72 & 0x400000) == 0)
  {
    goto LABEL_69;
  }
  *(_DWORD *)(v5 + 684) = self->_requestPriority;
  *(void *)(v5 + 756) |= 0x400000uLL;
  if ((*(void *)&self->_flags & 0x2000) != 0)
  {
LABEL_70:
    *(_DWORD *)(v5 + 648) = self->_httpRequestPriority;
    *(void *)(v5 + 756) |= 0x2000uLL;
  }
LABEL_71:
  uint64_t v73 = [(NSString *)self->_analyticsAppIdentifier copyWithZone:a3];
  v74 = *(void **)(v5 + 288);
  *(void *)(v5 + 288) = v73;

  v75 = &self->_flags;
  uint64_t v76 = (uint64_t)self->_flags;
  if ((v76 & 0x20) != 0)
  {
    *(double *)(v5 + 544) = self->_sessionRelativeTimestamp;
    *(void *)(v5 + 756) |= 0x20uLL;
    uint64_t v76 = *(void *)v75;
    if ((*(void *)v75 & 0x40000000000000) == 0)
    {
LABEL_73:
      if ((v76 & 0x400000000000000) == 0) {
        goto LABEL_74;
      }
      goto LABEL_158;
    }
  }
  else if ((v76 & 0x40000000000000) == 0)
  {
    goto LABEL_73;
  }
  *(unsigned char *)(v5 + 746) = self->_supportDirectionIntentAutocomplete;
  *(void *)(v5 + 756) |= 0x40000000000000uLL;
  uint64_t v76 = (uint64_t)self->_flags;
  if ((v76 & 0x400000000000000) == 0)
  {
LABEL_74:
    if ((v76 & 0x2000000000) == 0) {
      goto LABEL_75;
    }
    goto LABEL_159;
  }
LABEL_158:
  *(unsigned char *)(v5 + 750) = self->_supportUnresolvedDirectionIntent;
  *(void *)(v5 + 756) |= 0x400000000000000uLL;
  uint64_t v76 = (uint64_t)self->_flags;
  if ((v76 & 0x2000000000) == 0)
  {
LABEL_75:
    if ((v76 & 0x200000000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_160;
  }
LABEL_159:
  *(unsigned char *)(v5 + 729) = self->_deviceDarkMode;
  *(void *)(v5 + 756) |= 0x2000000000uLL;
  uint64_t v76 = (uint64_t)self->_flags;
  if ((v76 & 0x200000000) == 0)
  {
LABEL_76:
    if ((v76 & 0x800000000000000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_161;
  }
LABEL_160:
  *(unsigned char *)(v5 + 725) = self->_appDarkMode;
  *(void *)(v5 + 756) |= 0x200000000uLL;
  uint64_t v76 = (uint64_t)self->_flags;
  if ((v76 & 0x800000000000000) == 0)
  {
LABEL_77:
    if ((v76 & 0x800000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_78;
  }
LABEL_161:
  *(unsigned char *)(v5 + 751) = self->_supportsBrandFallback;
  *(void *)(v5 + 756) |= 0x800000000000000uLL;
  if ((*(void *)&self->_flags & 0x800000) != 0)
  {
LABEL_78:
    *(_DWORD *)(v5 + 688) = self->_requestPurpose;
    *(void *)(v5 + 756) |= 0x800000uLL;
  }
LABEL_79:
  PBRepeatedInt32Copy();
  if ((*((unsigned char *)&self->_flags + 5) & 4) != 0)
  {
    *(unsigned char *)(v5 + 734) = self->_isSettlement;
    *(void *)(v5 + 756) |= 0x40000000000uLL;
  }
  id v77 = [(GEOTraitsTransitScheduleFilter *)self->_transitTripStopTimeFilter copyWithZone:a3];
  v78 = *(void **)(v5 + 576);
  *(void *)(v5 + 576) = v77;

  if ((*((unsigned char *)&self->_flags + 6) & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 745) = self->_supportClientRankingFeatureMetadata;
    *(void *)(v5 + 756) |= 0x20000000000000uLL;
  }
  PBRepeatedInt32Copy();
  v79 = &self->_flags;
  uint64_t v80 = (uint64_t)self->_flags;
  if ((v80 & 0x8000000000000) != 0)
  {
    *(unsigned char *)(v5 + 743) = self->_supportChildItems;
    *(void *)(v5 + 756) |= 0x8000000000000uLL;
    uint64_t v80 = *(void *)v79;
    if ((*(void *)v79 & 0x10000000000) == 0)
    {
LABEL_85:
      if ((v80 & 0x800000000) == 0) {
        goto LABEL_87;
      }
      goto LABEL_86;
    }
  }
  else if ((v80 & 0x10000000000) == 0)
  {
    goto LABEL_85;
  }
  *(unsigned char *)(v5 + 732) = self->_isRefund;
  *(void *)(v5 + 756) |= 0x10000000000uLL;
  if ((*(void *)&self->_flags & 0x800000000) != 0)
  {
LABEL_86:
    *(unsigned char *)(v5 + 727) = self->_autocompleteRequestSupportsSectionHeader;
    *(void *)(v5 + 756) |= 0x800000000uLL;
  }
LABEL_87:
  PBRepeatedInt32Copy();
  if ((*((unsigned char *)&self->_flags + 1) & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 656) = self->_navigationTransportType;
    *(void *)(v5 + 756) |= 0x8000uLL;
  }
  id v81 = [(GEOCyclingOptions *)self->_cyclingOptions copyWithZone:a3];
  v82 = *(void **)(v5 + 376);
  *(void *)(v5 + 376) = v81;

  if ((*((unsigned char *)&self->_flags + 2) & 8) != 0)
  {
    *(_DWORD *)(v5 + 672) = self->_ratingsCount;
    *(void *)(v5 + 756) |= 0x80000uLL;
  }
  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  v83 = self->_evChargingPorts;
  uint64_t v84 = [(NSMutableArray *)v83 countByEnumeratingWithState:&v124 objects:v144 count:16];
  if (v84)
  {
    uint64_t v85 = *(void *)v125;
    do
    {
      for (uint64_t n = 0; n != v84; ++n)
      {
        if (*(void *)v125 != v85) {
          objc_enumerationMutation(v83);
        }
        v87 = objc_msgSend(*(id *)(*((void *)&v124 + 1) + 8 * n), "copyWithZone:", a3, (void)v124);
        [(id)v5 addEvChargingPort:v87];
      }
      uint64_t v84 = [(NSMutableArray *)v83 countByEnumeratingWithState:&v124 objects:v144 count:16];
    }
    while (v84);
  }

  if ((*((unsigned char *)&self->_flags + 5) & 8) != 0)
  {
    *(unsigned char *)(v5 + 735) = self->_isWidgetRequest;
    *(void *)(v5 + 756) |= 0x80000000000uLL;
  }
  PBRepeatedInt32Copy();
  v88 = &self->_flags;
  uint64_t v89 = (uint64_t)self->_flags;
  if ((v89 & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 624) = self->_auxiliaryTierNumResults;
    *(void *)(v5 + 756) |= 0x80uLL;
    uint64_t v89 = *(void *)v88;
    if ((*(void *)v88 & 0x40000) == 0)
    {
LABEL_102:
      if ((v89 & 8) == 0) {
        goto LABEL_104;
      }
      goto LABEL_103;
    }
  }
  else if ((v89 & 0x40000) == 0)
  {
    goto LABEL_102;
  }
  *(_DWORD *)(v5 + 668) = self->_placeSummaryRevision;
  *(void *)(v5 + 756) |= 0x40000uLL;
  if ((*(void *)&self->_flags & 8) != 0)
  {
LABEL_103:
    *(double *)(v5 + 448) = self->_isTourist;
    *(void *)(v5 + 756) |= 8uLL;
  }
LABEL_104:
  PBRepeatedInt32Copy();
  uint64_t v90 = (uint64_t)self->_flags;
  if ((v90 & 0x4000000000000) != 0)
  {
    *(unsigned char *)(v5 + 742) = self->_supportAutocompletePublisherResults;
    *(void *)(v5 + 756) |= 0x4000000000000uLL;
    uint64_t v90 = (uint64_t)self->_flags;
  }
  if ((v90 & 0x2000000000000) != 0)
  {
    *(unsigned char *)(v5 + 741) = self->_supportAutocompleteGuideResults;
    *(void *)(v5 + 756) |= 0x2000000000000uLL;
  }
  id v91 = -[GEOPDViewportInfo copyWithZone:](self->_previousSearchViewport, "copyWithZone:", a3, (void)v124);
  v92 = *(void **)(v5 + 480);
  *(void *)(v5 + 480) = v91;

  if (*((unsigned char *)&self->_flags + 2))
  {
    *(_DWORD *)(v5 + 660) = self->_photoAlbumCount;
    *(void *)(v5 + 756) |= 0x10000uLL;
  }
  id v93 = [(GEOPDResultRefinementQuery *)self->_resultRefinementQuery copyWithZone:a3];
  v94 = *(void **)(v5 + 512);
  *(void *)(v5 + 512) = v93;

  uint64_t v95 = (uint64_t)self->_flags;
  if ((v95 & 0x100000) != 0)
  {
    *(_DWORD *)(v5 + 676) = self->_relatedPlaceItemCount;
    *(void *)(v5 + 756) |= 0x100000uLL;
    uint64_t v95 = (uint64_t)self->_flags;
  }
  if ((v95 & 0x4000000) != 0)
  {
    *(_DWORD *)(v5 + 700) = self->_searchRequestType;
    *(void *)(v5 + 756) |= 0x4000000uLL;
  }
  uint64_t v96 = [(NSString *)self->_currentLocaleCurrencySymbol copyWithZone:a3];
  v97 = *(void **)(v5 + 368);
  *(void *)(v5 + 368) = v96;

  PBRepeatedInt32Copy();
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 620) = self->_autocompleteOriginationType;
    *(void *)(v5 + 756) |= 0x40uLL;
  }
  id v98 = [(GEOLatLng *)self->_autocompleteOriginationPreviousLatlng copyWithZone:a3];
  v99 = *(void **)(v5 + 320);
  *(void *)(v5 + 320) = v98;

  if ((*((unsigned char *)&self->_flags + 3) & 8) != 0)
  {
    *(_DWORD *)(v5 + 704) = self->_searchOriginationType;
    *(void *)(v5 + 756) |= 0x8000000uLL;
  }
  id v100 = [(GEOLatLng *)self->_searchOriginationPreviousLatlng copyWithZone:a3];
  v101 = *(void **)(v5 + 536);
  *(void *)(v5 + 536) = v100;

  id v102 = [(GEOAddStopRouteInfo *)self->_addStopRouteInfo copyWithZone:a3];
  v103 = *(void **)(v5 + 280);
  *(void *)(v5 + 280) = v102;

  v104 = &self->_flags;
  uint64_t v105 = (uint64_t)self->_flags;
  if ((v105 & 0x400000000) != 0)
  {
    *(unsigned char *)(v5 + 726) = self->_autocompleteOriginationEditingServerWaypoints;
    *(void *)(v5 + 756) |= 0x400000000uLL;
    uint64_t v105 = *(void *)v104;
    if ((*(void *)v104 & 0x1000000000000) == 0)
    {
LABEL_120:
      if ((v105 & 0x10000000000000) == 0) {
        goto LABEL_122;
      }
      goto LABEL_121;
    }
  }
  else if ((v105 & 0x1000000000000) == 0)
  {
    goto LABEL_120;
  }
  *(unsigned char *)(v5 + 740) = self->_searchOriginationEditingServerWaypoints;
  *(void *)(v5 + 756) |= 0x1000000000000uLL;
  if ((*(void *)&self->_flags & 0x10000000000000) != 0)
  {
LABEL_121:
    *(unsigned char *)(v5 + 744) = self->_supportClientRankingCompositeFeatures;
    *(void *)(v5 + 756) |= 0x10000000000000uLL;
  }
LABEL_122:
  id v106 = [(GEOPrivacyMetadata *)self->_privacyMetadata copyWithZone:a3];
  v107 = *(void **)(v5 + 488);
  *(void *)(v5 + 488) = v106;

  v108 = &self->_flags;
  uint64_t v109 = (uint64_t)self->_flags;
  if ((v109 & 0x2000000) == 0)
  {
    if ((v109 & 0x200000000000000) == 0) {
      goto LABEL_124;
    }
LABEL_173:
    *(unsigned char *)(v5 + 749) = self->_supportStructuredRapAffordance;
    *(void *)(v5 + 756) |= 0x200000000000000uLL;
    if ((*(void *)&self->_flags & 0x20000000000) == 0) {
      goto LABEL_126;
    }
    goto LABEL_125;
  }
  *(_DWORD *)(v5 + 696) = self->_routeStopCount;
  *(void *)(v5 + 756) |= 0x2000000uLL;
  uint64_t v109 = *(void *)v108;
  if ((*(void *)v108 & 0x200000000000000) != 0) {
    goto LABEL_173;
  }
LABEL_124:
  if ((v109 & 0x20000000000) != 0)
  {
LABEL_125:
    *(unsigned char *)(v5 + 733) = self->_isRoutePlanningEditStopFillRequest;
    *(void *)(v5 + 756) |= 0x20000000000uLL;
  }
LABEL_126:
  PBRepeatedUInt64Copy();
  uint64_t v110 = (uint64_t)self->_flags;
  if ((v110 & 0x100000000000) != 0)
  {
    *(unsigned char *)(v5 + 736) = self->_isWithinHikingBoundary;
    *(void *)(v5 + 756) |= 0x100000000000uLL;
    uint64_t v110 = (uint64_t)self->_flags;
  }
  if ((v110 & 0x200000000000) != 0)
  {
    *(unsigned char *)(v5 + 737) = self->_isWithinHikingBufferRegion;
    *(void *)(v5 + 756) |= 0x200000000000uLL;
  }
  id v111 = [(GEOSearchImplicitFilterInfo *)self->_searchImplicitFilterInfo copyWithZone:a3];
  v112 = *(void **)(v5 + 528);
  *(void *)(v5 + 528) = v111;

  uint64_t v113 = (uint64_t)self->_flags;
  if ((v113 & 0x1000) != 0)
  {
    *(_DWORD *)(v5 + 644) = self->_devicePlatform;
    *(void *)(v5 + 756) |= 0x1000uLL;
    uint64_t v113 = (uint64_t)self->_flags;
  }
  if ((v113 & 0x1000000000) != 0)
  {
    *(unsigned char *)(v5 + 728) = self->_containsSensitiveData;
    *(void *)(v5 + 756) |= 0x1000000000uLL;
  }
  uint64_t v114 = [(NSString *)self->_spotlightSearchPunchinEncodedString copyWithZone:a3];
  v115 = *(void **)(v5 + 552);
  *(void *)(v5 + 552) = v114;

  if ((*((unsigned char *)&self->_flags + 5) & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 739) = self->_optimizeSearchRequestComponents;
    *(void *)(v5 + 756) |= 0x800000000000uLL;
  }
  id v116 = [(GEOPDAutocompleteSessionData *)self->_recentAutocompleteSessionData copyWithZone:a3];
  v117 = *(void **)(v5 + 504);
  *(void *)(v5 + 504) = v116;

  if (*((unsigned char *)&self->_flags + 4))
  {
    *(unsigned char *)(v5 + 724) = self->_analyticsOptOut;
    *(void *)(v5 + 756) |= 0x100000000uLL;
  }
  id v118 = [(GEOPDSSessionUserActionMetadata *)self->_userActionMetadata copyWithZone:a3];
  v119 = *(void **)(v5 + 584);
  *(void *)(v5 + 584) = v118;

  if ((*((unsigned char *)&self->_flags + 7) & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 753) = self->_wantsRouteCreationTip;
    *(void *)(v5 + 756) |= 0x2000000000000000uLL;
  }
  uint64_t v120 = [(NSString *)self->_hardwareIdentifier copyWithZone:a3];
  v121 = *(void **)(v5 + 432);
  *(void *)(v5 + 432) = v120;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  id v122 = (id)v5;
LABEL_141:

  return (id)v5;
}

- (void)addPhotoSizes:(id)a3
{
  id v4 = a3;
  -[GEOMapServiceTraits _readPhotoSizes]((uint64_t)self);
  -[GEOMapServiceTraits _addNoFlagsPhotoSizes:]((uint64_t)self, v4);

  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOMapServiceTraits *)((char *)self + 756);
  self->_reader = (PBDataReader *)((unint64_t)self->_reader | 0x20000000);
  os_unfair_lock_unlock(p_readerLock);
  self->_reader = (PBDataReader *)((unint64_t)self->_reader | 0x200000000000);
}

- (void)_readPhotoSizes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 767) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhotoSizes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void)_addNoFlagsPhotoSizes:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 472);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 472);
      *(void *)(a1 + 472) = v5;

      id v4 = *(void **)(a1 + 472);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addDeviceDisplayLanguage:(id)a3
{
  id v4 = a3;
  -[GEOMapServiceTraits _readDeviceDisplayLanguages]((uint64_t)self);
  -[GEOMapServiceTraits _addNoFlagsDeviceDisplayLanguage:]((uint64_t)self, v4);

  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOMapServiceTraits *)((char *)self + 756);
  self->_reader = (PBDataReader *)((unint64_t)self->_reader | 0x200000);
  os_unfair_lock_unlock(p_readerLock);
  self->_reader = (PBDataReader *)((unint64_t)self->_reader | 0x200000000000);
}

- (void)_readDeviceDisplayLanguages
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 766) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceDisplayLanguages_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void)_addNoFlagsDeviceDisplayLanguage:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 392);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 392);
      *(void *)(a1 + 392) = v5;

      id v4 = *(void **)(a1 + 392);
    }
    [v4 addObject:v7];
    id v3 = v7;
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
      id v8 = (int *)&readAll__recursiveTag_1899;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_1900;
    }
    GEOMapServiceTraitsReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOMapServiceTraitsCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOMapServiceTraits)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOMapServiceTraits;
  v2 = [(GEOMapServiceTraits *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (void)addReviewUserPhotoSizes:(id)a3
{
  id v4 = a3;
  -[GEOMapServiceTraits _readReviewUserPhotoSizes]((uint64_t)self);
  -[GEOMapServiceTraits _addNoFlagsReviewUserPhotoSizes:]((uint64_t)self, v4);

  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOMapServiceTraits *)((char *)self + 756);
  self->_reader = (PBDataReader *)((unint64_t)self->_reader | 0x800000000);
  os_unfair_lock_unlock(p_readerLock);
  self->_reader = (PBDataReader *)((unint64_t)self->_reader | 0x200000000000);
}

- (void)_readReviewUserPhotoSizes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 768) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readReviewUserPhotoSizes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void)_addNoFlagsReviewUserPhotoSizes:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 520);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 520);
      *(void *)(a1 + 520) = v5;

      id v4 = *(void **)(a1 + 520);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapServiceTraitsReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)hasDeviceLocation
{
  return self->_deviceLocation != 0;
}

- (BOOL)hasDeviceSpokenLocale
{
  return self->_deviceSpokenLocale != 0;
}

- (void)_readDeviceSpokenLocale
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 766) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceSpokenLocale_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasDisplayRegion
{
  return self->_displayRegion != 0;
}

- (NSString)displayRegion
{
  -[GEOMapServiceTraits _readDisplayRegion]((uint64_t)self);
  displayRegiouint64_t n = self->_displayRegion;

  return displayRegion;
}

- (void)_readDisplayRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 767) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayRegion_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)deviceDisplayLanguages
{
  -[GEOMapServiceTraits _readDeviceDisplayLanguages]((uint64_t)self);
  deviceDisplayLanguages = self->_deviceDisplayLanguages;

  return deviceDisplayLanguages;
}

- (unint64_t)deviceDisplayLanguagesCount
{
  -[GEOMapServiceTraits _readDeviceDisplayLanguages]((uint64_t)self);
  deviceDisplayLanguages = self->_deviceDisplayLanguages;

  return [(NSMutableArray *)deviceDisplayLanguages count];
}

- (BOOL)hasDeviceKeyboardLocale
{
  return self->_deviceKeyboardLocale != 0;
}

- (void)_readDeviceKeyboardLocale
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 766) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceKeyboardLocale_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)navigating
{
  return self->_navigating;
}

- (GEOLocation)deviceLocation
{
  -[GEOMapServiceTraits _readDeviceLocation]((uint64_t)self);
  deviceLocatiouint64_t n = self->_deviceLocation;

  return deviceLocation;
}

- (void)_readDeviceLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 766) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceLocation_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (int)knownClientResolvedTypes
{
  return self->_knownClientResolvedTypes.list;
}

- (unint64_t)knownClientResolvedTypesCount
{
  return self->_knownClientResolvedTypes.count;
}

- (void)_readKnownClientResolvedTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 764) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readKnownClientResolvedTypes_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasTimeSinceMapEnteredForeground
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 6) & 1;
}

- (BOOL)hasCurrentLocaleCurrencySymbol
{
  return self->_currentLocaleCurrencySymbol != 0;
}

- (void)_readCurrentLocaleCurrencySymbol
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 766) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCurrentLocaleCurrencySymbol_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (int)requestPurpose
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x800000) != 0) {
    return self->_requestPurpose;
  }
  else {
    return 0;
  }
}

- (unsigned)httpRequestPriority
{
  return self->_httpRequestPriority;
}

- (BOOL)hasIsTourist
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (BOOL)hasHttpRequestPriority
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOMapServiceTraits;
  [(GEOMapServiceTraits *)&v3 dealloc];
}

- (NSMutableArray)historicalLocations
{
  -[GEOMapServiceTraits _readHistoricalLocations]((uint64_t)self);
  historicalLocations = self->_historicalLocations;

  return historicalLocations;
}

- (void)_readHistoricalLocations
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 767) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHistoricalLocations_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSString)deviceSpokenLocale
{
  -[GEOMapServiceTraits _readDeviceSpokenLocale]((uint64_t)self);
  deviceSpokenLocale = self->_deviceSpokenLocale;

  return deviceSpokenLocale;
}

- (unsigned)timeSinceMapEnteredForeground
{
  return self->_timeSinceMapEnteredForeground;
}

- (NSString)deviceKeyboardLocale
{
  -[GEOMapServiceTraits _readDeviceKeyboardLocale]((uint64_t)self);
  deviceKeyboardLocale = self->_deviceKeyboardLocale;

  return deviceKeyboardLocale;
}

- (NSString)currentLocaleCurrencySymbol
{
  -[GEOMapServiceTraits _readCurrentLocaleCurrencySymbol]((uint64_t)self);
  currentLocaleCurrencySymbol = self->_currentLocaleCurrencySymbol;

  return currentLocaleCurrencySymbol;
}

- (int)requestPriority
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x400000) != 0) {
    return self->_requestPriority;
  }
  else {
    return 0;
  }
}

- (unsigned)photosCount
{
  return self->_photosCount;
}

- (unsigned)reviewUserPhotosCount
{
  return self->_reviewUserPhotosCount;
}

- (BOOL)wantsRouteCreationTip
{
  return self->_wantsRouteCreationTip;
}

- (unsigned)relatedPlaceItemCount
{
  return self->_relatedPlaceItemCount;
}

- (unsigned)ratingsCount
{
  return self->_ratingsCount;
}

- (unsigned)photoAlbumCount
{
  return self->_photoAlbumCount;
}

- (int)requestMode
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x200000) != 0) {
    return self->_requestMode;
  }
  else {
    return 0;
  }
}

- (NSMutableArray)photoSizes
{
  -[GEOMapServiceTraits _readPhotoSizes]((uint64_t)self);
  photoSizes = self->_photoSizes;

  return photoSizes;
}

- (BOOL)hasTransitScheduleFilter
{
  return self->_transitScheduleFilter != 0;
}

- (GEOTraitsTransitScheduleFilter)transitScheduleFilter
{
  -[GEOMapServiceTraits _readTransitScheduleFilter]((uint64_t)self);
  transitScheduleFilter = self->_transitScheduleFilter;

  return transitScheduleFilter;
}

- (void)_readTransitScheduleFilter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 769) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitScheduleFilter_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void)setDisplayRegion:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x200001000000uLL;
  objc_storeStrong((id *)&self->_displayRegion, a3);
}

- (NSMutableArray)reviewUserPhotoSizes
{
  -[GEOMapServiceTraits _readReviewUserPhotoSizes]((uint64_t)self);
  reviewUserPhotoSizes = self->_reviewUserPhotoSizes;

  return reviewUserPhotoSizes;
}

- (void)setPhotosCount:(unsigned int)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x20000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_photosCount = a3;
}

- (void)setPhotoAlbumCount:(unsigned int)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x10000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_photoAlbumCount = a3;
}

- (void)setAppIdentifier:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x200000000800uLL;
  objc_storeStrong((id *)&self->_appIdentifier, a3);
}

- (void)setTransitScheduleFilter:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x210000000000uLL;
  objc_storeStrong((id *)&self->_transitScheduleFilter, a3);
}

- (void)setReviewUserPhotosCount:(unsigned int)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x1000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_reviewUserPhotosCount = a3;
}

- (void)setRelatedPlaceItemCount:(unsigned int)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x100000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_relatedPlaceItemCount = a3;
}

- (void)setRatingsCount:(unsigned int)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x80000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_ratingsCount = a3;
}

- (void)setDeviceDisplayLanguages:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 0x200000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;
  deviceDisplayLanguages = self->_deviceDisplayLanguages;
  self->_deviceDisplayLanguages = v4;
}

- (void)setAppMinorVersion:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x200000002000uLL;
  objc_storeStrong((id *)&self->_appMinorVersion, a3);
}

- (void)setAppMajorVersion:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x200000001000uLL;
  objc_storeStrong((id *)&self->_appMajorVersion, a3);
}

- (BOOL)hasReviewUserPhotosCount
{
  return *((unsigned char *)&self->_flags + 3) & 1;
}

- (BOOL)hasRelatedPlaceItemCount
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 4) & 1;
}

- (BOOL)hasRatingsCount
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 3) & 1;
}

- (BOOL)hasPhotosCount
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 1) & 1;
}

- (BOOL)hasPhotoAlbumCount
{
  return *((unsigned char *)&self->_flags + 2) & 1;
}

- (void)addSupportedAutocompleteListType:(int)a3
{
  -[GEOMapServiceTraits _readSupportedAutocompleteListTypes]((uint64_t)self);
  if (self) {
    PBRepeatedInt32Add();
  }
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_uint64_t flags = &self->_flags;
  *((void *)p_flags + 1) |= 8uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)p_flags + 1) |= 0x200000000000uLL;
}

- (void)_readSupportedAutocompleteListTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 764) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedAutocompleteListTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void)setSupportsBrandFallback:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x800000000000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_supportsBrandFallbacuint64_t k = a3;
}

- (BOOL)hasDevicePlatform
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (NSString)appIdentifier
{
  -[GEOMapServiceTraits _readAppIdentifier]((uint64_t)self);
  appIdentifier = self->_appIdentifier;

  return appIdentifier;
}

- (void)_readAppIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 765) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAppIdentifier_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSString)appMinorVersion
{
  -[GEOMapServiceTraits _readAppMinorVersion]((uint64_t)self);
  appMinorVersiouint64_t n = self->_appMinorVersion;

  return appMinorVersion;
}

- (void)_readAppMinorVersion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 765) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAppMinorVersion_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSString)appMajorVersion
{
  -[GEOMapServiceTraits _readAppMajorVersion]((uint64_t)self);
  appMajorVersiouint64_t n = self->_appMajorVersion;

  return appMajorVersion;
}

- (void)_readAppMajorVersion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 765) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAppMajorVersion_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)isAPICall
{
  return self->_isAPICall;
}

- (BOOL)hasSource
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 5) & 1;
}

- (BOOL)hasSequenceNumber
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 4) & 1;
}

- (BOOL)hasRouteStopCount
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 1) & 1;
}

- (BOOL)hasHardwareIdentifier
{
  return self->_hardwareIdentifier != 0;
}

- (void)_readHardwareIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 767) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHardwareIdentifier_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasAppMinorVersion
{
  return self->_appMinorVersion != 0;
}

- (BOOL)hasAppMajorVersion
{
  return self->_appMajorVersion != 0;
}

- (BOOL)hasAppIdentifier
{
  return self->_appIdentifier != 0;
}

- (BOOL)analyticsOptOut
{
  return self->_analyticsOptOut;
}

- (double)sessionRelativeTimestamp
{
  return self->_sessionRelativeTimestamp;
}

- (GEOSessionID)sessionId
{
  p_sessionId = &self->_sessionId;
  unint64_t high = self->_sessionId._high;
  unint64_t low = p_sessionId->_low;
  result._unint64_t low = low;
  result._unint64_t high = high;
  return result;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (BOOL)hasSessionRelativeTimestamp
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (BOOL)hasSessionId
{
  return *(_DWORD *)&self->_flags & 1;
}

- (NSString)hardwareIdentifier
{
  -[GEOMapServiceTraits _readHardwareIdentifier]((uint64_t)self);
  hardwareIdentifier = self->_hardwareIdentifier;

  return hardwareIdentifier;
}

- (void)setAnalyticsAppIdentifier:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x200000000400uLL;
  objc_storeStrong((id *)&self->_analyticsAppIdentifier, a3);
}

- (unint64_t)supportedChildActionsCount
{
  return self->_supportedChildActions.count;
}

- (BOOL)hasSupportChildItems
{
  return (*((unsigned __int8 *)&self->_flags + 6) >> 3) & 1;
}

- (void)_readSupportedChildActions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 764) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedChildActions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void)setWantsRouteCreationTip:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x2000000000000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_wantsRouteCreationTip = a3;
}

- (void)setDevicePlatform:(int)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x1000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_devicePlatforuint64_t m = a3;
}

- (void)setDeviceKeyboardLocale:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x200000400000uLL;
  objc_storeStrong((id *)&self->_deviceKeyboardLocale, a3);
}

- (void)setHttpRequestPriority:(unsigned int)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x2000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_httpRequestPriority = a3;
}

- (void)setSessionRelativeTimestamp:(double)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x20uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_sessionRelativeTimestamp = a3;
}

- (void)setSessionId:(GEOSessionID)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 1uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_sessionId = a3;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x10000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_sequenceNumber = a3;
}

- (void)setWalkingOptions:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x300000000000uLL;
  objc_storeStrong((id *)&self->_walkingOptions, a3);
}

- (void)setTimeSinceMapViewportChanged:(unsigned int)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x80000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_timeSinceMapViewportChanged = a3;
}

- (void)setTimeSinceMapEnteredForeground:(unsigned int)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x40000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_timeSinceMapEnteredForeground = a3;
}

- (void)setSupportDymSuggestion:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x100000000000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_supportDymSuggestiouint64_t n = a3;
}

- (void)setMode:(int)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x4000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_mode = a3;
}

- (void)setMapZoomLevel:(double)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x10uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_mapZoomLevel = a3;
}

- (NSString)analyticsAppIdentifier
{
  -[GEOMapServiceTraits _readAnalyticsAppIdentifier]((uint64_t)self);
  analyticsAppIdentifier = self->_analyticsAppIdentifier;

  return analyticsAppIdentifier;
}

- (void)_readAnalyticsAppIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 765) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnalyticsAppIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void)setTransitOptions:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x208000000000uLL;
  objc_storeStrong((id *)&self->_transitOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_venueIdentifier, 0);
  objc_storeStrong((id *)&self->_userActionMetadata, 0);
  objc_storeStrong((id *)&self->_transitTripStopTimeFilter, 0);
  objc_storeStrong((id *)&self->_transitScheduleFilter, 0);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_spotlightSearchPunchinEncodedString, 0);
  objc_storeStrong((id *)&self->_searchOriginationPreviousLatlng, 0);
  objc_storeStrong((id *)&self->_searchImplicitFilterInfo, 0);
  objc_storeStrong((id *)&self->_reviewUserPhotoSizes, 0);
  objc_storeStrong((id *)&self->_resultRefinementQuery, 0);
  objc_storeStrong((id *)&self->_recentAutocompleteSessionData, 0);
  objc_storeStrong((id *)&self->_providerID, 0);
  objc_storeStrong((id *)&self->_privacyMetadata, 0);
  objc_storeStrong((id *)&self->_previousSearchViewport, 0);
  objc_storeStrong((id *)&self->_photoSizes, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_historicalLocations, 0);
  objc_storeStrong((id *)&self->_hardwareIdentifier, 0);
  objc_storeStrong((id *)&self->_evChargingPorts, 0);
  objc_storeStrong((id *)&self->_displayRegion, 0);
  objc_storeStrong((id *)&self->_deviceSpokenLocale, 0);
  objc_storeStrong((id *)&self->_deviceKeyboardLocale, 0);
  objc_storeStrong((id *)&self->_deviceDisplayLanguages, 0);
  objc_storeStrong((id *)&self->_deviceLocation, 0);
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_currentLocaleCurrencySymbol, 0);
  objc_storeStrong((id *)&self->_carHeadunitModel, 0);
  objc_storeStrong((id *)&self->_carHeadunitManufacturer, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_autocompleteOriginationPreviousLatlng, 0);
  objc_storeStrong((id *)&self->_appMinorVersion, 0);
  objc_storeStrong((id *)&self->_appMajorVersion, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_analyticsAppIdentifier, 0);
  objc_storeStrong((id *)&self->_addStopRouteInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)setMapRegion:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x200010000000uLL;
  objc_storeStrong((id *)&self->_mapRegion, a3);
}

- (void)setDeviceSpokenLocale:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x200000800000uLL;
  objc_storeStrong((id *)&self->_deviceSpokenLocale, a3);
}

- (void)setDeviceLocation:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x200000100000uLL;
  objc_storeStrong((id *)&self->_deviceLocation, a3);
}

- (void)setCyclingOptions:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x200000080000uLL;
  objc_storeStrong((id *)&self->_cyclingOptions, a3);
}

- (void)setCurrentLocaleCurrencySymbol:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x200000040000uLL;
  objc_storeStrong((id *)&self->_currentLocaleCurrencySymbol, a3);
}

- (void)setAutomobileOptions:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x200000008000uLL;
  objc_storeStrong((id *)&self->_automobileOptions, a3);
}

- (int)searchOriginationType
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x8000000) != 0) {
    return self->_searchOriginationType;
  }
  else {
    return 0;
  }
}

- (void)addTransportType:(int)a3
{
  -[GEOMapServiceTraits _readTransportTypes]((uint64_t)self);
  if (self) {
    PBRepeatedInt32Add();
  }
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_uint64_t flags = &self->_flags;
  *((void *)p_flags + 1) |= 0x100uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)p_flags + 1) |= 0x200000000000uLL;
}

- (void)_readTransportTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 765) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransportTypes_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void)setIsAPICall:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x8000000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_isAPICall = a3;
}

- (void)setAnalyticsOptOut:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x100000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_analyticsOptOut = a3;
}

- (void)addKnownClientResolvedType:(int)a3
{
  -[GEOMapServiceTraits _readKnownClientResolvedTypes]((uint64_t)self);
  if (self) {
    PBRepeatedInt32Add();
  }
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_uint64_t flags = &self->_flags;
  *((void *)p_flags + 1) |= 1uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)p_flags + 1) |= 0x200000000000uLL;
}

- (void)clearPreferredBrands
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 4uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;

  PBRepeatedUInt64Clear();
}

- (void)clearEvChargingPorts
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 0x2000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;
  evChargingPorts = self->_evChargingPorts;

  [(NSMutableArray *)evChargingPorts removeAllObjects];
}

- (void)setHistoricalLocations:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 0x8000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;
  historicalLocations = self->_historicalLocations;
  self->_historicalLocations = v4;
}

- (void)setHardwareIdentifier:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x200004000000uLL;
  objc_storeStrong((id *)&self->_hardwareIdentifier, a3);
}

- (void)clearDeviceDisplayLanguages
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 0x200000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;
  deviceDisplayLanguages = self->_deviceDisplayLanguages;

  [(NSMutableArray *)deviceDisplayLanguages removeAllObjects];
}

- (void)writeTo:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOMapServiceTraitsIsDirty((uint64_t)self) & 1) == 0)
  {
    v53 = self->_reader;
    objc_sync_enter(v53);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v54 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v54];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v53);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOMapServiceTraits *)self readAll:0];
    uint64_t flags = (uint64_t)self->_flags;
    if (flags)
    {
      uint64_t v75 = 0;
      PBDataWriterPlaceMark();
      PBDataWriterWriteUint64Field();
      PBDataWriterWriteUint64Field();
      PBDataWriterRecallMark();
      uint64_t flags = (uint64_t)self->_flags;
    }
    if ((flags & 0x10000000) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_appIdentifier) {
      PBDataWriterWriteStringField();
    }
    if (self->_appMajorVersion) {
      PBDataWriterWriteStringField();
    }
    if (self->_appMinorVersion) {
      PBDataWriterWriteStringField();
    }
    if (self->_deviceLocation) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_transportTypes.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v7;
      }
      while (v7 < self->_transportTypes.count);
    }
    if (self->_mapRegion) {
      PBDataWriterWriteSubmessage();
    }
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v8 = self->_deviceDisplayLanguages;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v71 objects:v80 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v72 != v10) {
            objc_enumerationMutation(v8);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v71 objects:v80 count:16];
      }
      while (v9);
    }

    if (self->_deviceKeyboardLocale) {
      PBDataWriterWriteStringField();
    }
    if (self->_deviceSpokenLocale) {
      PBDataWriterWriteStringField();
    }
    uint64_t v12 = (uint64_t)self->_flags;
    if ((v12 & 0x8000000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      uint64_t v12 = (uint64_t)self->_flags;
    }
    if ((v12 & 0x20000000) != 0) {
      PBDataWriterWriteInt32Field();
    }
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v13 = self->_photoSizes;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v67 objects:v79 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v68;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v68 != v15) {
            objc_enumerationMutation(v13);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v67 objects:v79 count:16];
      }
      while (v14);
    }

    if ((*((unsigned char *)&self->_flags + 2) & 2) != 0) {
      PBDataWriterWriteUint32Field();
    }
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v17 = self->_reviewUserPhotoSizes;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v63 objects:v78 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v64;
      do
      {
        for (uint64_t k = 0; k != v18; ++k)
        {
          if (*(void *)v64 != v19) {
            objc_enumerationMutation(v17);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v63 objects:v78 count:16];
      }
      while (v18);
    }

    uint64_t v21 = (uint64_t)self->_flags;
    if ((v21 & 0x1000000) != 0)
    {
      PBDataWriterWriteUint32Field();
      uint64_t v21 = (uint64_t)self->_flags;
    }
    if ((v21 & 0x40000000) != 0)
    {
      PBDataWriterWriteUint32Field();
      uint64_t v21 = (uint64_t)self->_flags;
    }
    if ((v21 & 0x80000000) != 0)
    {
      PBDataWriterWriteUint32Field();
      uint64_t v21 = (uint64_t)self->_flags;
    }
    if ((v21 & 0x200) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_carHeadunitManufacturer) {
      PBDataWriterWriteStringField();
    }
    if (self->_carHeadunitModel) {
      PBDataWriterWriteStringField();
    }
    uint64_t v22 = (uint64_t)self->_flags;
    if ((v22 & 4) != 0)
    {
      PBDataWriterWriteDoubleField();
      uint64_t v22 = (uint64_t)self->_flags;
    }
    if ((v22 & 2) != 0) {
      PBDataWriterWriteDoubleField();
    }
    if (self->_transitScheduleFilter) {
      PBDataWriterWriteSubmessage();
    }
    uint64_t v23 = (uint64_t)self->_flags;
    if ((v23 & 0x10) != 0)
    {
      PBDataWriterWriteDoubleField();
      uint64_t v23 = (uint64_t)self->_flags;
    }
    if ((v23 & 0x4000) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_displayRegion) {
      PBDataWriterWriteStringField();
    }
    if (self->_providerID) {
      PBDataWriterWriteStringField();
    }
    uint64_t v24 = (uint64_t)self->_flags;
    if ((v24 & 0x800) != 0)
    {
      PBDataWriterWriteInt32Field();
      uint64_t v24 = (uint64_t)self->_flags;
    }
    if ((v24 & 0x400) != 0)
    {
      PBDataWriterWriteInt32Field();
      uint64_t v24 = (uint64_t)self->_flags;
    }
    if ((v24 & 0x100) != 0)
    {
      PBDataWriterWriteInt32Field();
      uint64_t v24 = (uint64_t)self->_flags;
    }
    if ((v24 & 0x400000000000) != 0) {
      PBDataWriterWriteBOOLField();
    }
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v25 = self->_historicalLocations;
    uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v59 objects:v77 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v60;
      do
      {
        for (uint64_t m = 0; m != v26; ++m)
        {
          if (*(void *)v60 != v27) {
            objc_enumerationMutation(v25);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v59 objects:v77 count:16];
      }
      while (v26);
    }

    if (self->_automobileOptions) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_transitOptions) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_walkingOptions) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_engineTypes.count)
    {
      unint64_t v29 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v29;
      }
      while (v29 < self->_engineTypes.count);
    }
    uint64_t v30 = (uint64_t)self->_flags;
    if ((v30 & 0x200000) != 0)
    {
      PBDataWriterWriteInt32Field();
      uint64_t v30 = (uint64_t)self->_flags;
    }
    if ((v30 & 0x80000000000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      uint64_t v30 = (uint64_t)self->_flags;
    }
    if ((v30 & 0x100000000000000) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_knownClientResolvedTypes.count)
    {
      unint64_t v31 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v31;
      }
      while (v31 < self->_knownClientResolvedTypes.count);
    }
    if ((*((unsigned char *)&self->_flags + 7) & 0x10) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_venueIdentifier) {
      PBDataWriterWriteSubmessage();
    }
    uint64_t v32 = (uint64_t)self->_flags;
    if ((v32 & 0x4000000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      uint64_t v32 = (uint64_t)self->_flags;
    }
    if ((v32 & 0x400000) != 0)
    {
      PBDataWriterWriteInt32Field();
      uint64_t v32 = (uint64_t)self->_flags;
    }
    if ((v32 & 0x2000) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_analyticsAppIdentifier) {
      PBDataWriterWriteStringField();
    }
    uint64_t v33 = (uint64_t)self->_flags;
    if ((v33 & 0x20) != 0)
    {
      PBDataWriterWriteDoubleField();
      uint64_t v33 = (uint64_t)self->_flags;
    }
    if ((v33 & 0x40000000000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      uint64_t v33 = (uint64_t)self->_flags;
    }
    if ((v33 & 0x400000000000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      uint64_t v33 = (uint64_t)self->_flags;
    }
    if ((v33 & 0x2000000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      uint64_t v33 = (uint64_t)self->_flags;
    }
    if ((v33 & 0x200000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      uint64_t v33 = (uint64_t)self->_flags;
    }
    if ((v33 & 0x800000000000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      uint64_t v33 = (uint64_t)self->_flags;
    }
    if ((v33 & 0x800000) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_supportedAutocompleteListTypes.count)
    {
      unint64_t v34 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v34;
      }
      while (v34 < self->_supportedAutocompleteListTypes.count);
    }
    if ((*((unsigned char *)&self->_flags + 5) & 4) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_transitTripStopTimeFilter) {
      PBDataWriterWriteSubmessage();
    }
    if ((*((unsigned char *)&self->_flags + 6) & 0x20) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_supportedChildActions.count)
    {
      unint64_t v35 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v35;
      }
      while (v35 < self->_supportedChildActions.count);
    }
    uint64_t v36 = (uint64_t)self->_flags;
    if ((v36 & 0x8000000000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      uint64_t v36 = (uint64_t)self->_flags;
    }
    if ((v36 & 0x10000000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      uint64_t v36 = (uint64_t)self->_flags;
    }
    if ((v36 & 0x800000000) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_supportedAutocompleteResultCellTypes.count)
    {
      unint64_t v37 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v37;
      }
      while (v37 < self->_supportedAutocompleteResultCellTypes.count);
    }
    if ((*((unsigned char *)&self->_flags + 1) & 0x80) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_cyclingOptions) {
      PBDataWriterWriteSubmessage();
    }
    if ((*((unsigned char *)&self->_flags + 2) & 8) != 0) {
      PBDataWriterWriteUint32Field();
    }
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v38 = self->_evChargingPorts;
    uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v55 objects:v76 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v56;
      do
      {
        for (uint64_t n = 0; n != v39; ++n)
        {
          if (*(void *)v56 != v40) {
            objc_enumerationMutation(v38);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v55 objects:v76 count:16];
      }
      while (v39);
    }

    if ((*((unsigned char *)&self->_flags + 5) & 8) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_supportedSearchTierTypes.count)
    {
      unint64_t v42 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v42;
      }
      while (v42 < self->_supportedSearchTierTypes.count);
    }
    uint64_t v43 = (uint64_t)self->_flags;
    if ((v43 & 0x80) != 0)
    {
      PBDataWriterWriteUint32Field();
      uint64_t v43 = (uint64_t)self->_flags;
    }
    if ((v43 & 0x40000) != 0)
    {
      PBDataWriterWriteUint32Field();
      uint64_t v43 = (uint64_t)self->_flags;
    }
    if ((v43 & 8) != 0) {
      PBDataWriterWriteDoubleField();
    }
    if (self->_knownRefinementTypes.count)
    {
      unint64_t v44 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v44;
      }
      while (v44 < self->_knownRefinementTypes.count);
    }
    uint64_t v45 = (uint64_t)self->_flags;
    if ((v45 & 0x4000000000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      uint64_t v45 = (uint64_t)self->_flags;
    }
    if ((v45 & 0x2000000000000) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_previousSearchViewport) {
      PBDataWriterWriteSubmessage();
    }
    if (*((unsigned char *)&self->_flags + 2)) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_resultRefinementQuery) {
      PBDataWriterWriteSubmessage();
    }
    uint64_t v46 = (uint64_t)self->_flags;
    if ((v46 & 0x100000) != 0)
    {
      PBDataWriterWriteUint32Field();
      uint64_t v46 = (uint64_t)self->_flags;
    }
    if ((v46 & 0x4000000) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_currentLocaleCurrencySymbol) {
      PBDataWriterWriteStringField();
    }
    if (self->_supportedPlaceSummaryFormatTypes.count)
    {
      unint64_t v47 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v47;
      }
      while (v47 < self->_supportedPlaceSummaryFormatTypes.count);
    }
    if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_autocompleteOriginationPreviousLatlng) {
      PBDataWriterWriteSubmessage();
    }
    if ((*((unsigned char *)&self->_flags + 3) & 8) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_searchOriginationPreviousLatlng) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_addStopRouteInfo) {
      PBDataWriterWriteSubmessage();
    }
    uint64_t v48 = (uint64_t)self->_flags;
    if ((v48 & 0x400000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      uint64_t v48 = (uint64_t)self->_flags;
    }
    if ((v48 & 0x1000000000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      uint64_t v48 = (uint64_t)self->_flags;
    }
    if ((v48 & 0x10000000000000) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_privacyMetadata) {
      PBDataWriterWriteSubmessage();
    }
    uint64_t v49 = (uint64_t)self->_flags;
    if ((v49 & 0x2000000) != 0)
    {
      PBDataWriterWriteUint32Field();
      uint64_t v49 = (uint64_t)self->_flags;
    }
    if ((v49 & 0x200000000000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      uint64_t v49 = (uint64_t)self->_flags;
    }
    if ((v49 & 0x20000000000) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_preferredBrands.count)
    {
      unint64_t v50 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v50;
      }
      while (v50 < self->_preferredBrands.count);
    }
    uint64_t v51 = (uint64_t)self->_flags;
    if ((v51 & 0x100000000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      uint64_t v51 = (uint64_t)self->_flags;
    }
    if ((v51 & 0x200000000000) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_searchImplicitFilterInfo) {
      PBDataWriterWriteSubmessage();
    }
    uint64_t v52 = (uint64_t)self->_flags;
    if ((v52 & 0x1000) != 0)
    {
      PBDataWriterWriteInt32Field();
      uint64_t v52 = (uint64_t)self->_flags;
    }
    if ((v52 & 0x1000000000) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_spotlightSearchPunchinEncodedString) {
      PBDataWriterWriteStringField();
    }
    if ((*((unsigned char *)&self->_flags + 5) & 0x80) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_recentAutocompleteSessionData) {
      PBDataWriterWriteSubmessage();
    }
    if (*((unsigned char *)&self->_flags + 4)) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_userActionMetadata) {
      PBDataWriterWriteSubmessage();
    }
    if ((*((unsigned char *)&self->_flags + 7) & 0x20) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_hardwareIdentifier) {
      PBDataWriterWriteStringField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v55);
  }
}

- (BOOL)useBackgroundUrl
{
  return [(GEOMapServiceTraits *)self requestPriority] == 1;
}

- (void)useOnlineToOfflineFailoverRequestModeIfAllowed
{
  unint64_t v7 = +[GEOOfflineService sharedNoCreate];
  BOOL v3 = [(GEOMapServiceTraits *)self hasRequestMode];
  id v4 = v7;
  if (!v3)
  {
    if (v7)
    {
      char v5 = [v7 isUsingOffline];
      id v4 = v7;
      if ((v5 & 1) == 0)
      {
        int v6 = [+[GEOOfflineService stateManagerClass]() isOfflineAvailable];
        id v4 = v7;
        if (v6)
        {
          [(GEOMapServiceTraits *)self setRequestMode:1];
          id v4 = v7;
        }
      }
    }
  }
}

- (void)setHasSessionId:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3;
  *((void *)&self->_flags + 1) = v3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x10000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFEFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (unint64_t)transportTypesCount
{
  return self->_transportTypes.count;
}

- (int)transportTypes
{
  return self->_transportTypes.list;
}

- (void)clearTransportTypes
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 0x100uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;

  PBRepeatedInt32Clear();
}

- (int)transportTypeAtIndex:(unint64_t)a3
{
  -[GEOMapServiceTraits _readTransportTypes]((uint64_t)self);
  p_transportTypes = &self->_transportTypes;
  unint64_t count = self->_transportTypes.count;
  if (count <= a3)
  {
    unint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    uint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_transportTypes->list[a3];
}

- (void)setTransportTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 0x100uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;

  MEMORY[0x1F4147390](&self->_transportTypes, a3, a4);
}

- (id)transportTypesAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E7BE8[a3];
  }

  return v3;
}

- (int)StringAsTransportTypes:(id)a3
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

- (void)_readMapRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 767) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapRegion_tags_7);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasMapRegion
{
  return self->_mapRegion != 0;
}

- (GEOMapRegion)mapRegion
{
  -[GEOMapServiceTraits _readMapRegion]((uint64_t)self);
  mapRegiouint64_t n = self->_mapRegion;

  return mapRegion;
}

- (id)deviceDisplayLanguageAtIndex:(unint64_t)a3
{
  -[GEOMapServiceTraits _readDeviceDisplayLanguages]((uint64_t)self);
  deviceDisplayLanguages = self->_deviceDisplayLanguages;

  return (id)[(NSMutableArray *)deviceDisplayLanguages objectAtIndex:a3];
}

+ (Class)deviceDisplayLanguageType
{
  return (Class)objc_opt_class();
}

- (void)setHasIsAPICall:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x8000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFF7FFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasIsAPICall
{
  return *((unsigned __int8 *)&self->_flags + 4) >> 7;
}

- (int)source
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x20000000) != 0) {
    return self->_source;
  }
  else {
    return 0;
  }
}

- (void)setSource:(int)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x20000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x20000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFDFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (id)sourceAsString:(int)a3
{
  if (a3 >= 0x18)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E7960[a3];
  }

  return v3;
}

- (int)StringAsSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_SOURCE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"URL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"USER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"REFINEMENT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SPELLING"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"HINT_CONTACTS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"STARK_USER"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"HINT_COMPLETION"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"STARK_HINT_COMPLETION"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"HINT_HISTORY"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"STARK_HINT_HISTORY"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_SEARCH"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"STARK_AUTOCOMPLETE_SEARCH"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_NAV_FROM"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_NAV_TO"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"NAV_FROM"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"NAV_TO"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"BOOKMARK_REFRESH"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"ROUTING"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"PRELOADER"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"USER_NO_TYPING"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"ADD_TO_FAVORITES"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"ADD_TO_COLLECTION"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"RAP_HINT_COMPLETION"])
  {
    int v4 = 23;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setPhotoSizes:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 0x20000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;
  photoSizes = self->_photoSizes;
  self->_photoSizes = v4;
}

- (void)clearPhotoSizes
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 0x20000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;
  photoSizes = self->_photoSizes;

  [(NSMutableArray *)photoSizes removeAllObjects];
}

- (unint64_t)photoSizesCount
{
  -[GEOMapServiceTraits _readPhotoSizes]((uint64_t)self);
  photoSizes = self->_photoSizes;

  return [(NSMutableArray *)photoSizes count];
}

- (id)photoSizesAtIndex:(unint64_t)a3
{
  -[GEOMapServiceTraits _readPhotoSizes]((uint64_t)self);
  photoSizes = self->_photoSizes;

  return (id)[(NSMutableArray *)photoSizes objectAtIndex:a3];
}

+ (Class)photoSizesType
{
  return (Class)objc_opt_class();
}

- (void)setHasPhotosCount:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x20000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFDFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (void)setReviewUserPhotoSizes:(id)a3
{
  uint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 0x800000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;
  reviewUserPhotoSizes = self->_reviewUserPhotoSizes;
  self->_reviewUserPhotoSizes = v4;
}

- (void)clearReviewUserPhotoSizes
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 0x800000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;
  reviewUserPhotoSizes = self->_reviewUserPhotoSizes;

  [(NSMutableArray *)reviewUserPhotoSizes removeAllObjects];
}

- (unint64_t)reviewUserPhotoSizesCount
{
  -[GEOMapServiceTraits _readReviewUserPhotoSizes]((uint64_t)self);
  reviewUserPhotoSizes = self->_reviewUserPhotoSizes;

  return [(NSMutableArray *)reviewUserPhotoSizes count];
}

- (id)reviewUserPhotoSizesAtIndex:(unint64_t)a3
{
  -[GEOMapServiceTraits _readReviewUserPhotoSizes]((uint64_t)self);
  reviewUserPhotoSizes = self->_reviewUserPhotoSizes;

  return (id)[(NSMutableArray *)reviewUserPhotoSizes objectAtIndex:a3];
}

+ (Class)reviewUserPhotoSizesType
{
  return (Class)objc_opt_class();
}

- (void)setHasReviewUserPhotosCount:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x1000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFEFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (void)setHasTimeSinceMapEnteredForeground:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x40000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFBFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (unsigned)timeSinceMapViewportChanged
{
  return self->_timeSinceMapViewportChanged;
}

- (void)setHasTimeSinceMapViewportChanged:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x80000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFF7FFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasTimeSinceMapViewportChanged
{
  return *((unsigned __int8 *)&self->_flags + 3) >> 7;
}

- (int)carHeadunitInteractionModel
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x200) != 0) {
    return self->_carHeadunitInteractionModel;
  }
  else {
    return 1;
  }
}

- (void)setCarHeadunitInteractionModel:(int)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x200uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_carHeadunitInteractionModel = a3;
}

- (void)setHasCarHeadunitInteractionModel:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 512;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasCarHeadunitInteractionModel
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (id)carHeadunitInteractionModelAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E7A20[a3 - 1];
  }

  return v3;
}

- (int)StringAsCarHeadunitInteractionModel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CAR_HIFI"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CAR_LOFI"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CAR_PHYSICAL"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (void)_readCarHeadunitManufacturer
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 766) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCarHeadunitManufacturer_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasCarHeadunitManufacturer
{
  return self->_carHeadunitManufacturer != 0;
}

- (NSString)carHeadunitManufacturer
{
  -[GEOMapServiceTraits _readCarHeadunitManufacturer]((uint64_t)self);
  carHeadunitManufacturer = self->_carHeadunitManufacturer;

  return carHeadunitManufacturer;
}

- (void)setCarHeadunitManufacturer:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x200000010000uLL;
  objc_storeStrong((id *)&self->_carHeadunitManufacturer, a3);
}

- (void)_readCarHeadunitModel
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 766) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCarHeadunitModel_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasCarHeadunitModel
{
  return self->_carHeadunitModel != 0;
}

- (NSString)carHeadunitModel
{
  -[GEOMapServiceTraits _readCarHeadunitModel]((uint64_t)self);
  carHeadunitModel = self->_carHeadunitModel;

  return carHeadunitModel;
}

- (void)setCarHeadunitModel:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x200000020000uLL;
  objc_storeStrong((id *)&self->_carHeadunitModel, a3);
}

- (double)carHeadunitPixelWidth
{
  return self->_carHeadunitPixelWidth;
}

- (void)setCarHeadunitPixelWidth:(double)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 4uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_carHeadunitPixelWidth = a3;
}

- (void)setHasCarHeadunitPixelWidth:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 4;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasCarHeadunitPixelWidth
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (double)carHeadunitPixelHeight
{
  return self->_carHeadunitPixelHeight;
}

- (void)setCarHeadunitPixelHeight:(double)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 2uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_carHeadunitPixelHeight = a3;
}

- (void)setHasCarHeadunitPixelHeight:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 2;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasCarHeadunitPixelHeight
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (double)mapZoomLevel
{
  return self->_mapZoomLevel;
}

- (void)setHasMapZoomLevel:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 16;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasMapZoomLevel
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (int)mode
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x4000) != 0) {
    return self->_mode;
  }
  else {
    return 0;
  }
}

- (void)setHasMode:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x4000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasMode
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (id)modeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E7A38[a3];
  }

  return v3;
}

- (int)StringAsMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STANDARD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SATELLITE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HYBRID"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readProviderID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 768) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProviderID_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasProviderID
{
  return self->_providerID != 0;
}

- (NSString)providerID
{
  -[GEOMapServiceTraits _readProviderID]((uint64_t)self);
  providerID = self->_providerID;

  return providerID;
}

- (void)setProviderID:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x200100000000uLL;
  objc_storeStrong((id *)&self->_providerID, a3);
}

- (int)deviceInterfaceOrientation
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x800) != 0) {
    return self->_deviceInterfaceOrientation;
  }
  else {
    return 0;
  }
}

- (void)setDeviceInterfaceOrientation:(int)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x800uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_deviceInterfaceOrientatiouint64_t n = a3;
}

- (void)setHasDeviceInterfaceOrientation:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 2048;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasDeviceInterfaceOrientation
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (id)deviceInterfaceOrientationAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E7A60[a3];
  }

  return v3;
}

- (int)StringAsDeviceInterfaceOrientation:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DEVICE_ORIENTATION_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DEVICE_ORIENTATION_PORTRAIT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DEVICE_ORIENTATION_PORTRAIT_UPSIDE_DOWN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DEVICE_ORIENTATION_LANDSCAPE_LEFT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"DEVICE_ORIENTATION_LANDSCAPE_RIGHT"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)deviceBatteryState
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x400) != 0) {
    return self->_deviceBatteryState;
  }
  else {
    return 0;
  }
}

- (void)setDeviceBatteryState:(int)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x400uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_deviceBatteryState = a3;
}

- (void)setHasDeviceBatteryState:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 1024;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasDeviceBatteryState
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (id)deviceBatteryStateAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E7A88[a3];
  }

  return v3;
}

- (int)StringAsDeviceBatteryState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DEVICE_BATTERY_STATE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DEVICE_BATTERY_STATE_UNPLUGGED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DEVICE_BATTERY_STATE_CHARGING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DEVICE_BATTERY_STATE_FULL"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)carHeadunitConnectionType
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x100) != 0) {
    return self->_carHeadunitConnectionType;
  }
  else {
    return 0;
  }
}

- (void)setCarHeadunitConnectionType:(int)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x100uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_carHeadunitConnectionType = a3;
}

- (void)setHasCarHeadunitConnectionType:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 256;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasCarHeadunitConnectionType
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (id)carHeadunitConnectionTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E7AA8[a3];
  }

  return v3;
}

- (int)StringAsCarHeadunitConnectionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CONNECTION_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CONNECTION_CABLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CONNECTION_WIRELESS"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setNavigating:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x400000000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_navigating = a3;
}

- (void)setHasNavigating:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x400000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFBFFFFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasNavigating
{
  return (*((unsigned __int8 *)&self->_flags + 5) >> 6) & 1;
}

- (void)clearHistoricalLocations
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 0x8000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;
  historicalLocations = self->_historicalLocations;

  [(NSMutableArray *)historicalLocations removeAllObjects];
}

- (void)addHistoricalLocations:(id)a3
{
  id v4 = a3;
  -[GEOMapServiceTraits _readHistoricalLocations]((uint64_t)self);
  -[GEOMapServiceTraits _addNoFlagsHistoricalLocations:]((uint64_t)self, v4);

  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOMapServiceTraits *)((char *)self + 756);
  self->_reader = (PBDataReader *)((unint64_t)self->_reader | 0x8000000);
  os_unfair_lock_unlock(p_readerLock);
  self->_reader = (PBDataReader *)((unint64_t)self->_reader | 0x200000000000);
}

- (void)_addNoFlagsHistoricalLocations:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 440);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      int v6 = *(void **)(a1 + 440);
      *(void *)(a1 + 440) = v5;

      id v4 = *(void **)(a1 + 440);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)historicalLocationsCount
{
  -[GEOMapServiceTraits _readHistoricalLocations]((uint64_t)self);
  historicalLocations = self->_historicalLocations;

  return [(NSMutableArray *)historicalLocations count];
}

- (id)historicalLocationsAtIndex:(unint64_t)a3
{
  -[GEOMapServiceTraits _readHistoricalLocations]((uint64_t)self);
  historicalLocations = self->_historicalLocations;

  return (id)[(NSMutableArray *)historicalLocations objectAtIndex:a3];
}

+ (Class)historicalLocationsType
{
  return (Class)objc_opt_class();
}

- (void)_readAutomobileOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 765) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAutomobileOptions_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasAutomobileOptions
{
  return self->_automobileOptions != 0;
}

- (GEOAutomobileOptions)automobileOptions
{
  -[GEOMapServiceTraits _readAutomobileOptions]((uint64_t)self);
  automobileOptions = self->_automobileOptions;

  return automobileOptions;
}

- (void)_readTransitOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 768) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitOptions_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasTransitOptions
{
  return self->_transitOptions != 0;
}

- (GEOTransitOptions)transitOptions
{
  -[GEOMapServiceTraits _readTransitOptions]((uint64_t)self);
  transitOptions = self->_transitOptions;

  return transitOptions;
}

- (void)_readWalkingOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 769) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWalkingOptions_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasWalkingOptions
{
  return self->_walkingOptions != 0;
}

- (GEOWalkingOptions)walkingOptions
{
  -[GEOMapServiceTraits _readWalkingOptions]((uint64_t)self);
  walkingOptions = self->_walkingOptions;

  return walkingOptions;
}

- (void)_readEngineTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 763) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEngineTypes_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (unint64_t)engineTypesCount
{
  return self->_engineTypes.count;
}

- (int)engineTypes
{
  return self->_engineTypes.list;
}

- (void)clearEngineTypes
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000000000000;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;

  PBRepeatedInt32Clear();
}

- (void)addEngineType:(int)a3
{
  -[GEOMapServiceTraits _readEngineTypes]((uint64_t)self);
  if (self) {
    PBRepeatedInt32Add();
  }
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_uint64_t flags = &self->_flags;
  *(void *)p_flags |= 0x8000000000000000;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)p_flags + 1) |= 0x200000000000uLL;
}

- (int)engineTypeAtIndex:(unint64_t)a3
{
  -[GEOMapServiceTraits _readEngineTypes]((uint64_t)self);
  p_engineTypes = &self->_engineTypes;
  unint64_t count = self->_engineTypes.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    uint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_engineTypes->list[a3];
}

- (void)setEngineTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000000000000;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;

  MEMORY[0x1F4147390](&self->_engineTypes, a3, a4);
}

- (id)engineTypesAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E7AC0[a3];
  }

  return v3;
}

- (int)StringAsEngineTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CAR_ENGINE_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CAR_ENGINE_TYPE_GASOLINE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CAR_ENGINE_TYPE_DIESEL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CAR_ENGINE_TYPE_ELECTRIC"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CAR_ENGINE_TYPE_CNG"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setRequestMode:(int)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x200000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_requestMode = a3;
}

- (void)setHasRequestMode:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x200000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFDFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasRequestMode
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 5) & 1;
}

- (id)requestModeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E7AE8[a3];
  }

  return v3;
}

- (int)StringAsRequestMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DEFAULT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ONLINE_OFFLINE_FAILOVER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ONLINE_FAST_FAIL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ONLINE_ONLY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"OFFLINE_ONLY"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)supportDirectionIntentSearch
{
  return self->_supportDirectionIntentSearch;
}

- (void)setSupportDirectionIntentSearch:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x80000000000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_supportDirectionIntentSearch = a3;
}

- (void)setHasSupportDirectionIntentSearch:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x80000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFF7FFFFFFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasSupportDirectionIntentSearch
{
  return *((unsigned __int8 *)&self->_flags + 6) >> 7;
}

- (BOOL)supportDymSuggestion
{
  return self->_supportDymSuggestion;
}

- (void)setHasSupportDymSuggestion:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x100000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFEFFFFFFFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasSupportDymSuggestion
{
  return *((unsigned char *)&self->_flags + 7) & 1;
}

- (void)clearKnownClientResolvedTypes
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 1uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;

  PBRepeatedInt32Clear();
}

- (int)knownClientResolvedTypeAtIndex:(unint64_t)a3
{
  -[GEOMapServiceTraits _readKnownClientResolvedTypes]((uint64_t)self);
  p_knownClientResolvedTypes = &self->_knownClientResolvedTypes;
  unint64_t count = self->_knownClientResolvedTypes.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    uint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_knownClientResolvedTypes->list[a3];
}

- (void)setKnownClientResolvedTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 1uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;

  MEMORY[0x1F4147390](&self->_knownClientResolvedTypes, a3, a4);
}

- (id)knownClientResolvedTypesAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E7B10[a3];
  }

  return v3;
}

- (int)StringAsKnownClientResolvedTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RESOLVED_ITEM_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RESOLVED_ITEM_TYPE_HOME"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RESOLVED_ITEM_TYPE_WORK"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RESOLVED_ITEM_TYPE_PARKED_CAR"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RESOLVED_ITEM_TYPE_CURRENT_LOCATION"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RESOLVED_ITEM_TYPE_SERVER"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RESOLVED_ITEM_TYPE_SCHOOL"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)wantsBrandIcon
{
  return self->_wantsBrandIcon;
}

- (void)setWantsBrandIcon:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x1000000000000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_wantsBrandIcouint64_t n = a3;
}

- (void)setHasWantsBrandIcon:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x1000000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xEFFFFFFFFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasWantsBrandIcon
{
  return (*((unsigned __int8 *)&self->_flags + 7) >> 4) & 1;
}

- (void)_readVenueIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 769) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVenueIdentifier_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasVenueIdentifier
{
  return self->_venueIdentifier != 0;
}

- (GEOPDVenueIdentifier)venueIdentifier
{
  -[GEOMapServiceTraits _readVenueIdentifier]((uint64_t)self);
  venueIdentifier = self->_venueIdentifier;

  return venueIdentifier;
}

- (void)setVenueIdentifier:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x280000000000uLL;
  objc_storeStrong((id *)&self->_venueIdentifier, a3);
}

- (BOOL)deviceInVehicle
{
  return self->_deviceInVehicle;
}

- (void)setDeviceInVehicle:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x4000000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_deviceInVehicle = a3;
}

- (void)setHasDeviceInVehicle:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x4000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFBFFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasDeviceInVehicle
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 6) & 1;
}

- (void)setRequestPriority:(int)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x400000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_requestPriority = a3;
}

- (void)setHasRequestPriority:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x400000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFBFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasRequestPriority
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 6) & 1;
}

- (id)requestPriorityAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E7B48[a3];
  }

  return v3;
}

- (int)StringAsRequestPriority:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DEFAULT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BACKGROUND"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"USER_INITIATED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setHasHttpRequestPriority:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x2000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasAnalyticsAppIdentifier
{
  return self->_analyticsAppIdentifier != 0;
}

- (void)setHasSessionRelativeTimestamp:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 32;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)supportDirectionIntentAutocomplete
{
  return self->_supportDirectionIntentAutocomplete;
}

- (void)setSupportDirectionIntentAutocomplete:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x40000000000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_supportDirectionIntentAutocomplete = a3;
}

- (void)setHasSupportDirectionIntentAutocomplete:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x40000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFBFFFFFFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasSupportDirectionIntentAutocomplete
{
  return (*((unsigned __int8 *)&self->_flags + 6) >> 6) & 1;
}

- (BOOL)supportUnresolvedDirectionIntent
{
  return self->_supportUnresolvedDirectionIntent;
}

- (void)setSupportUnresolvedDirectionIntent:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x400000000000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_supportUnresolvedDirectionIntent = a3;
}

- (void)setHasSupportUnresolvedDirectionIntent:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x400000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFBFFFFFFFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasSupportUnresolvedDirectionIntent
{
  return (*((unsigned __int8 *)&self->_flags + 7) >> 2) & 1;
}

- (BOOL)deviceDarkMode
{
  return self->_deviceDarkMode;
}

- (void)setDeviceDarkMode:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x2000000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_deviceDarkMode = a3;
}

- (void)setHasDeviceDarkMode:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x2000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFDFFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasDeviceDarkMode
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 5) & 1;
}

- (BOOL)appDarkMode
{
  return self->_appDarkMode;
}

- (void)setAppDarkMode:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x200000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_appDarkMode = a3;
}

- (void)setHasAppDarkMode:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x200000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFDFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasAppDarkMode
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 1) & 1;
}

- (BOOL)supportsBrandFallback
{
  return self->_supportsBrandFallback;
}

- (void)setHasSupportsBrandFallback:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x800000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xF7FFFFFFFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasSupportsBrandFallback
{
  return (*((unsigned __int8 *)&self->_flags + 7) >> 3) & 1;
}

- (void)setRequestPurpose:(int)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x800000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_requestPurpose = a3;
}

- (void)setHasRequestPurpose:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x800000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFF7FFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasRequestPurpose
{
  return *((unsigned __int8 *)&self->_flags + 2) >> 7;
}

- (id)requestPurposeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      uint64_t v4 = @"ROUTE_WAYPOINT_RESOLUTION";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v4 = @"UNKNOWN";
  }
  return v4;
}

- (int)StringAsRequestPurpose:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"ROUTE_WAYPOINT_RESOLUTION"];
  }

  return v4;
}

- (unint64_t)supportedAutocompleteListTypesCount
{
  return self->_supportedAutocompleteListTypes.count;
}

- (int)supportedAutocompleteListTypes
{
  return self->_supportedAutocompleteListTypes.list;
}

- (void)clearSupportedAutocompleteListTypes
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 8uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;

  PBRepeatedInt32Clear();
}

- (int)supportedAutocompleteListTypeAtIndex:(unint64_t)a3
{
  -[GEOMapServiceTraits _readSupportedAutocompleteListTypes]((uint64_t)self);
  p_supportedAutocompleteListTypes = &self->_supportedAutocompleteListTypes;
  unint64_t count = self->_supportedAutocompleteListTypes.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    uint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_supportedAutocompleteListTypes->list[a3];
}

- (void)setSupportedAutocompleteListTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 8uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;

  MEMORY[0x1F4147390](&self->_supportedAutocompleteListTypes, a3, a4);
}

- (id)supportedAutocompleteListTypesAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E7B60[a3];
  }

  return v3;
}

- (int)StringAsSupportedAutocompleteListTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"INTERLEAVED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SECTION_ONLY_FOR_QUERY"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)isSettlement
{
  return self->_isSettlement;
}

- (void)setIsSettlement:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x40000000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_isSettlement = a3;
}

- (void)setHasIsSettlement:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x40000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFBFFFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasIsSettlement
{
  return (*((unsigned __int8 *)&self->_flags + 5) >> 2) & 1;
}

- (void)_readTransitTripStopTimeFilter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 769) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitTripStopTimeFilter_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasTransitTripStopTimeFilter
{
  return self->_transitTripStopTimeFilter != 0;
}

- (GEOTraitsTransitScheduleFilter)transitTripStopTimeFilter
{
  -[GEOMapServiceTraits _readTransitTripStopTimeFilter]((uint64_t)self);
  transitTripStopTimeFilter = self->_transitTripStopTimeFilter;

  return transitTripStopTimeFilter;
}

- (void)setTransitTripStopTimeFilter:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x220000000000uLL;
  objc_storeStrong((id *)&self->_transitTripStopTimeFilter, a3);
}

- (BOOL)supportClientRankingFeatureMetadata
{
  return self->_supportClientRankingFeatureMetadata;
}

- (void)setSupportClientRankingFeatureMetadata:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x20000000000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_supportClientRankingFeatureMetadata = a3;
}

- (void)setHasSupportClientRankingFeatureMetadata:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x20000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFDFFFFFFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasSupportClientRankingFeatureMetadata
{
  return (*((unsigned __int8 *)&self->_flags + 6) >> 5) & 1;
}

- (int)supportedChildActions
{
  return self->_supportedChildActions.list;
}

- (void)clearSupportedChildActions
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 0x20uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;

  PBRepeatedInt32Clear();
}

- (void)addSupportedChildAction:(int)a3
{
  -[GEOMapServiceTraits _readSupportedChildActions]((uint64_t)self);
  if (self) {
    PBRepeatedInt32Add();
  }
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_uint64_t flags = &self->_flags;
  *((void *)p_flags + 1) |= 0x20uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)p_flags + 1) |= 0x200000000000uLL;
}

- (int)supportedChildActionAtIndex:(unint64_t)a3
{
  -[GEOMapServiceTraits _readSupportedChildActions]((uint64_t)self);
  p_supportedChildActions = &self->_supportedChildActions;
  unint64_t count = self->_supportedChildActions.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    uint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_supportedChildActions->list[a3];
}

- (void)setSupportedChildActions:(int *)a3 count:(unint64_t)a4
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 0x20uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;

  MEMORY[0x1F4147390](&self->_supportedChildActions, a3, a4);
}

- (id)supportedChildActionsAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E7B78[a3];
  }

  return v3;
}

- (int)StringAsSupportedChildActions:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FLYOVER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SEARCH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LOOK_AROUND"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CALL"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"WEBSITE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"GUIDES"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"DOWNLOAD_OFFLINE_MAP"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)supportChildItems
{
  return self->_supportChildItems;
}

- (void)setSupportChildItems:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x8000000000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_supportChildItems = a3;
}

- (void)setHasSupportChildItems:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x8000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFF7FFFFFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)isRefund
{
  return self->_isRefund;
}

- (void)setIsRefund:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x10000000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_isRefund = a3;
}

- (void)setHasIsRefund:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x10000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFEFFFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasIsRefund
{
  return *((unsigned char *)&self->_flags + 5) & 1;
}

- (BOOL)autocompleteRequestSupportsSectionHeader
{
  return self->_autocompleteRequestSupportsSectionHeader;
}

- (void)setAutocompleteRequestSupportsSectionHeader:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x800000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_autocompleteRequestSupportsSectionHeader = a3;
}

- (void)setHasAutocompleteRequestSupportsSectionHeader:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x800000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFF7FFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasAutocompleteRequestSupportsSectionHeader
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 3) & 1;
}

- (void)_readSupportedAutocompleteResultCellTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 764) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedAutocompleteResultCellTypes_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (unint64_t)supportedAutocompleteResultCellTypesCount
{
  return self->_supportedAutocompleteResultCellTypes.count;
}

- (int)supportedAutocompleteResultCellTypes
{
  return self->_supportedAutocompleteResultCellTypes.list;
}

- (void)clearSupportedAutocompleteResultCellTypes
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 0x10uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;

  PBRepeatedInt32Clear();
}

- (void)addSupportedAutocompleteResultCellType:(int)a3
{
  -[GEOMapServiceTraits _readSupportedAutocompleteResultCellTypes]((uint64_t)self);
  if (self) {
    PBRepeatedInt32Add();
  }
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_uint64_t flags = &self->_flags;
  *((void *)p_flags + 1) |= 0x10uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)p_flags + 1) |= 0x200000000000uLL;
}

- (int)supportedAutocompleteResultCellTypeAtIndex:(unint64_t)a3
{
  -[GEOMapServiceTraits _readSupportedAutocompleteResultCellTypes]((uint64_t)self);
  p_supportedAutocompleteResultCellTypes = &self->_supportedAutocompleteResultCellTypes;
  unint64_t count = self->_supportedAutocompleteResultCellTypes.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    uint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_supportedAutocompleteResultCellTypes->list[a3];
}

- (void)setSupportedAutocompleteResultCellTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 0x10uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;

  MEMORY[0x1F4147390](&self->_supportedAutocompleteResultCellTypes, a3, a4);
}

- (id)supportedAutocompleteResultCellTypesAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E7BC0[a3];
  }

  return v3;
}

- (int)StringAsSupportedAutocompleteResultCellTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DEFAULT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PROMINENT_QUERY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PROMINENT_RESULT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TWO_LINE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PROMINENT_RESULT_TWO_LINE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)navigationTransportType
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x8000) != 0) {
    return self->_navigationTransportType;
  }
  else {
    return 0;
  }
}

- (void)setNavigationTransportType:(int)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x8000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_navigationTransportType = a3;
}

- (void)setHasNavigationTransportType:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x8000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFF7FFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasNavigationTransportType
{
  return *((unsigned __int8 *)&self->_flags + 1) >> 7;
}

- (id)navigationTransportTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E7BE8[a3];
  }

  return v3;
}

- (int)StringAsNavigationTransportType:(id)a3
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

- (void)_readCyclingOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 766) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCyclingOptions_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasCyclingOptions
{
  return self->_cyclingOptions != 0;
}

- (GEOCyclingOptions)cyclingOptions
{
  -[GEOMapServiceTraits _readCyclingOptions]((uint64_t)self);
  cyclingOptions = self->_cyclingOptions;

  return cyclingOptions;
}

- (void)setHasRatingsCount:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x80000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFF7FFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (void)_readEvChargingPorts
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 767) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEvChargingPorts_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)evChargingPorts
{
  -[GEOMapServiceTraits _readEvChargingPorts]((uint64_t)self);
  evChargingPorts = self->_evChargingPorts;

  return evChargingPorts;
}

- (void)setEvChargingPorts:(id)a3
{
  uint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 0x2000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;
  evChargingPorts = self->_evChargingPorts;
  self->_evChargingPorts = v4;
}

- (void)addEvChargingPort:(id)a3
{
  id v4 = a3;
  -[GEOMapServiceTraits _readEvChargingPorts]((uint64_t)self);
  -[GEOMapServiceTraits _addNoFlagsEvChargingPort:]((uint64_t)self, v4);

  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOMapServiceTraits *)((char *)self + 756);
  self->_reader = (PBDataReader *)((unint64_t)self->_reader | 0x2000000);
  os_unfair_lock_unlock(p_readerLock);
  self->_reader = (PBDataReader *)((unint64_t)self->_reader | 0x200000000000);
}

- (void)_addNoFlagsEvChargingPort:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 424);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      int v6 = *(void **)(a1 + 424);
      *(void *)(a1 + 424) = v5;

      id v4 = *(void **)(a1 + 424);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)evChargingPortsCount
{
  -[GEOMapServiceTraits _readEvChargingPorts]((uint64_t)self);
  evChargingPorts = self->_evChargingPorts;

  return [(NSMutableArray *)evChargingPorts count];
}

- (id)evChargingPortAtIndex:(unint64_t)a3
{
  -[GEOMapServiceTraits _readEvChargingPorts]((uint64_t)self);
  evChargingPorts = self->_evChargingPorts;

  return (id)[(NSMutableArray *)evChargingPorts objectAtIndex:a3];
}

+ (Class)evChargingPortType
{
  return (Class)objc_opt_class();
}

- (BOOL)isWidgetRequest
{
  return self->_isWidgetRequest;
}

- (void)setIsWidgetRequest:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x80000000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_isWidgetRequest = a3;
}

- (void)setHasIsWidgetRequest:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x80000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFF7FFFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasIsWidgetRequest
{
  return (*((unsigned __int8 *)&self->_flags + 5) >> 3) & 1;
}

- (void)_readSupportedSearchTierTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 764) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedSearchTierTypes_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (unint64_t)supportedSearchTierTypesCount
{
  return self->_supportedSearchTierTypes.count;
}

- (int)supportedSearchTierTypes
{
  return self->_supportedSearchTierTypes.list;
}

- (void)clearSupportedSearchTierTypes
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 0x80uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;

  PBRepeatedInt32Clear();
}

- (void)addSupportedSearchTierType:(int)a3
{
  -[GEOMapServiceTraits _readSupportedSearchTierTypes]((uint64_t)self);
  if (self) {
    PBRepeatedInt32Add();
  }
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_uint64_t flags = &self->_flags;
  *((void *)p_flags + 1) |= 0x80uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)p_flags + 1) |= 0x200000000000uLL;
}

- (int)supportedSearchTierTypeAtIndex:(unint64_t)a3
{
  -[GEOMapServiceTraits _readSupportedSearchTierTypes]((uint64_t)self);
  p_supportedSearchTierTypes = &self->_supportedSearchTierTypes;
  unint64_t count = self->_supportedSearchTierTypes.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    uint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_supportedSearchTierTypes->list[a3];
}

- (void)setSupportedSearchTierTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 0x80uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;

  MEMORY[0x1F4147390](&self->_supportedSearchTierTypes, a3, a4);
}

- (id)supportedSearchTierTypesAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E7C20[a3];
  }

  return v3;
}

- (int)StringAsSupportedSearchTierTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PRIMARY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AUXILIARY"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)auxiliaryTierNumResults
{
  return self->_auxiliaryTierNumResults;
}

- (void)setAuxiliaryTierNumResults:(unsigned int)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x80uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_auxiliaryTierNumResults = a3;
}

- (void)setHasAuxiliaryTierNumResults:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 128;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasAuxiliaryTierNumResults
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (unsigned)placeSummaryRevision
{
  return self->_placeSummaryRevision;
}

- (void)setPlaceSummaryRevision:(unsigned int)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x40000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_placeSummaryRevisiouint64_t n = a3;
}

- (void)setHasPlaceSummaryRevision:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x40000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFBFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasPlaceSummaryRevision
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 2) & 1;
}

- (double)isTourist
{
  return self->_isTourist;
}

- (void)setIsTourist:(double)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 8uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_isTourist = a3;
}

- (void)setHasIsTourist:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 8;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (void)_readKnownRefinementTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 764) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readKnownRefinementTypes_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (unint64_t)knownRefinementTypesCount
{
  return self->_knownRefinementTypes.count;
}

- (int)knownRefinementTypes
{
  return self->_knownRefinementTypes.list;
}

- (void)clearKnownRefinementTypes
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 2uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;

  PBRepeatedInt32Clear();
}

- (void)addKnownRefinementType:(int)a3
{
  -[GEOMapServiceTraits _readKnownRefinementTypes]((uint64_t)self);
  if (self) {
    PBRepeatedInt32Add();
  }
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_uint64_t flags = &self->_flags;
  *((void *)p_flags + 1) |= 2uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)p_flags + 1) |= 0x200000000000uLL;
}

- (int)knownRefinementTypeAtIndex:(unint64_t)a3
{
  -[GEOMapServiceTraits _readKnownRefinementTypes]((uint64_t)self);
  p_knownRefinementTypes = &self->_knownRefinementTypes;
  unint64_t count = self->_knownRefinementTypes.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    uint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_knownRefinementTypes->list[a3];
}

- (void)setKnownRefinementTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 2uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;

  MEMORY[0x1F4147390](&self->_knownRefinementTypes, a3, a4);
}

- (id)knownRefinementTypesAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E7C38[a3];
  }

  return v3;
}

- (int)StringAsKnownRefinementTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TOGGLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RANGE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MULTI_SELECT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SORT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"OPEN_OPTIONS"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)supportAutocompletePublisherResults
{
  return self->_supportAutocompletePublisherResults;
}

- (void)setSupportAutocompletePublisherResults:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x4000000000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_supportAutocompletePublisherResults = a3;
}

- (void)setHasSupportAutocompletePublisherResults:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x4000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFBFFFFFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasSupportAutocompletePublisherResults
{
  return (*((unsigned __int8 *)&self->_flags + 6) >> 2) & 1;
}

- (BOOL)supportAutocompleteGuideResults
{
  return self->_supportAutocompleteGuideResults;
}

- (void)setSupportAutocompleteGuideResults:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x2000000000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_supportAutocompleteGuideResults = a3;
}

- (void)setHasSupportAutocompleteGuideResults:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x2000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFDFFFFFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasSupportAutocompleteGuideResults
{
  return (*((unsigned __int8 *)&self->_flags + 6) >> 1) & 1;
}

- (void)_readPreviousSearchViewport
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 767) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPreviousSearchViewport_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasPreviousSearchViewport
{
  return self->_previousSearchViewport != 0;
}

- (GEOPDViewportInfo)previousSearchViewport
{
  -[GEOMapServiceTraits _readPreviousSearchViewport]((uint64_t)self);
  previousSearchViewport = self->_previousSearchViewport;

  return previousSearchViewport;
}

- (void)setPreviousSearchViewport:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x200040000000uLL;
  objc_storeStrong((id *)&self->_previousSearchViewport, a3);
}

- (void)setHasPhotoAlbumCount:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x10000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFEFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (void)_readResultRefinementQuery
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 768) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResultRefinementQuery_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasResultRefinementQuery
{
  return self->_resultRefinementQuery != 0;
}

- (GEOPDResultRefinementQuery)resultRefinementQuery
{
  -[GEOMapServiceTraits _readResultRefinementQuery]((uint64_t)self);
  resultRefinementQuery = self->_resultRefinementQuery;

  return resultRefinementQuery;
}

- (void)setResultRefinementQuery:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x200400000000uLL;
  objc_storeStrong((id *)&self->_resultRefinementQuery, a3);
}

- (void)setHasRelatedPlaceItemCount:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x100000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFEFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (int)searchRequestType
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x4000000) != 0) {
    return self->_searchRequestType;
  }
  else {
    return 0;
  }
}

- (void)setSearchRequestType:(int)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x4000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_searchRequestType = a3;
}

- (void)setHasSearchRequestType:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x4000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFBFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasSearchRequestType
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 2) & 1;
}

- (id)searchRequestTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E7C68[a3];
  }

  return v3;
}

- (int)StringAsSearchRequestType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DEFAULT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"REDO"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AUTO_REDO"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BEACHES"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readSupportedPlaceSummaryFormatTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 764) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedPlaceSummaryFormatTypes_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (unint64_t)supportedPlaceSummaryFormatTypesCount
{
  return self->_supportedPlaceSummaryFormatTypes.count;
}

- (int)supportedPlaceSummaryFormatTypes
{
  return self->_supportedPlaceSummaryFormatTypes.list;
}

- (void)clearSupportedPlaceSummaryFormatTypes
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 0x40uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;

  PBRepeatedInt32Clear();
}

- (void)addSupportedPlaceSummaryFormatType:(int)a3
{
  -[GEOMapServiceTraits _readSupportedPlaceSummaryFormatTypes]((uint64_t)self);
  if (self) {
    PBRepeatedInt32Add();
  }
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_uint64_t flags = &self->_flags;
  *((void *)p_flags + 1) |= 0x40uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)p_flags + 1) |= 0x200000000000uLL;
}

- (int)supportedPlaceSummaryFormatTypeAtIndex:(unint64_t)a3
{
  -[GEOMapServiceTraits _readSupportedPlaceSummaryFormatTypes]((uint64_t)self);
  p_supportedPlaceSummaryFormatTypes = &self->_supportedPlaceSummaryFormatTypes;
  unint64_t count = self->_supportedPlaceSummaryFormatTypes.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    uint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_supportedPlaceSummaryFormatTypes->list[a3];
}

- (void)setSupportedPlaceSummaryFormatTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 0x40uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;

  MEMORY[0x1F4147390](&self->_supportedPlaceSummaryFormatTypes, a3, a4);
}

- (id)supportedPlaceSummaryFormatTypesAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E7C88[a3];
  }

  return v3;
}

- (int)StringAsSupportedPlaceSummaryFormatTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BOLD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ITALICS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"STRIKETHROUGH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TAPPABLE_ENTITY"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)autocompleteOriginationType
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40) != 0) {
    return self->_autocompleteOriginationType;
  }
  else {
    return 0;
  }
}

- (void)setAutocompleteOriginationType:(int)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x40uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_autocompleteOriginationType = a3;
}

- (void)setHasAutocompleteOriginationType:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 64;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasAutocompleteOriginationType
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (id)autocompleteOriginationTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E7CB0[a3];
  }

  return v3;
}

- (int)StringAsAutocompleteOriginationType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DEFAULT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ROUTE_PLANNING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SEARCH_ALONG_ROUTE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ADD_FAVORITES"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readAutocompleteOriginationPreviousLatlng
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 765) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAutocompleteOriginationPreviousLatlng_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasAutocompleteOriginationPreviousLatlng
{
  return self->_autocompleteOriginationPreviousLatlng != 0;
}

- (GEOLatLng)autocompleteOriginationPreviousLatlng
{
  -[GEOMapServiceTraits _readAutocompleteOriginationPreviousLatlng]((uint64_t)self);
  autocompleteOriginationPreviousLatlng = self->_autocompleteOriginationPreviousLatlng;

  return autocompleteOriginationPreviousLatlng;
}

- (void)setAutocompleteOriginationPreviousLatlng:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x200000004000uLL;
  objc_storeStrong((id *)&self->_autocompleteOriginationPreviousLatlng, a3);
}

- (void)setSearchOriginationType:(int)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x8000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_searchOriginationType = a3;
}

- (void)setHasSearchOriginationType:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x8000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFF7FFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasSearchOriginationType
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 3) & 1;
}

- (id)searchOriginationTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E7CD0[a3];
  }

  return v3;
}

- (int)StringAsSearchOriginationType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DEFAULT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ROUTE_PLANNING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SEARCH_ALONG_ROUTE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"IMPLICIT"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readSearchOriginationPreviousLatlng
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 768) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchOriginationPreviousLatlng_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasSearchOriginationPreviousLatlng
{
  return self->_searchOriginationPreviousLatlng != 0;
}

- (GEOLatLng)searchOriginationPreviousLatlng
{
  -[GEOMapServiceTraits _readSearchOriginationPreviousLatlng]((uint64_t)self);
  searchOriginationPreviousLatlng = self->_searchOriginationPreviousLatlng;

  return searchOriginationPreviousLatlng;
}

- (void)setSearchOriginationPreviousLatlng:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x202000000000uLL;
  objc_storeStrong((id *)&self->_searchOriginationPreviousLatlng, a3);
}

- (void)_readAddStopRouteInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 765) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddStopRouteInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasAddStopRouteInfo
{
  return self->_addStopRouteInfo != 0;
}

- (GEOAddStopRouteInfo)addStopRouteInfo
{
  -[GEOMapServiceTraits _readAddStopRouteInfo]((uint64_t)self);
  addStopRouteInfo = self->_addStopRouteInfo;

  return addStopRouteInfo;
}

- (void)setAddStopRouteInfo:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x200000000200uLL;
  objc_storeStrong((id *)&self->_addStopRouteInfo, a3);
}

- (BOOL)autocompleteOriginationEditingServerWaypoints
{
  return self->_autocompleteOriginationEditingServerWaypoints;
}

- (void)setAutocompleteOriginationEditingServerWaypoints:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x400000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_autocompleteOriginationEditingServerWaypoints = a3;
}

- (void)setHasAutocompleteOriginationEditingServerWaypoints:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x400000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFBFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasAutocompleteOriginationEditingServerWaypoints
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 2) & 1;
}

- (BOOL)searchOriginationEditingServerWaypoints
{
  return self->_searchOriginationEditingServerWaypoints;
}

- (void)setSearchOriginationEditingServerWaypoints:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x1000000000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_searchOriginationEditingServerWaypoints = a3;
}

- (void)setHasSearchOriginationEditingServerWaypoints:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x1000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFEFFFFFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasSearchOriginationEditingServerWaypoints
{
  return *((unsigned char *)&self->_flags + 6) & 1;
}

- (BOOL)supportClientRankingCompositeFeatures
{
  return self->_supportClientRankingCompositeFeatures;
}

- (void)setSupportClientRankingCompositeFeatures:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x10000000000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_supportClientRankingCompositeFeatures = a3;
}

- (void)setHasSupportClientRankingCompositeFeatures:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x10000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFEFFFFFFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasSupportClientRankingCompositeFeatures
{
  return (*((unsigned __int8 *)&self->_flags + 6) >> 4) & 1;
}

- (void)_readPrivacyMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 767) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPrivacyMetadata_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasPrivacyMetadata
{
  return self->_privacyMetadata != 0;
}

- (GEOPrivacyMetadata)privacyMetadata
{
  -[GEOMapServiceTraits _readPrivacyMetadata]((uint64_t)self);
  privacyMetadata = self->_privacyMetadata;

  return privacyMetadata;
}

- (void)setPrivacyMetadata:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x200080000000uLL;
  objc_storeStrong((id *)&self->_privacyMetadata, a3);
}

- (unsigned)routeStopCount
{
  return self->_routeStopCount;
}

- (void)setRouteStopCount:(unsigned int)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x2000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_routeStopCount = a3;
}

- (void)setHasRouteStopCount:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x2000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFDFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)supportStructuredRapAffordance
{
  return self->_supportStructuredRapAffordance;
}

- (void)setSupportStructuredRapAffordance:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x200000000000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_supportStructuredRapAffordance = a3;
}

- (void)setHasSupportStructuredRapAffordance:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x200000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFDFFFFFFFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasSupportStructuredRapAffordance
{
  return (*((unsigned __int8 *)&self->_flags + 7) >> 1) & 1;
}

- (BOOL)isRoutePlanningEditStopFillRequest
{
  return self->_isRoutePlanningEditStopFillRequest;
}

- (void)setIsRoutePlanningEditStopFillRequest:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x20000000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_isRoutePlanningEditStopFillRequest = a3;
}

- (void)setHasIsRoutePlanningEditStopFillRequest:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x20000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFDFFFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasIsRoutePlanningEditStopFillRequest
{
  return (*((unsigned __int8 *)&self->_flags + 5) >> 1) & 1;
}

- (void)_readPreferredBrands
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 764) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPreferredBrands_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (unint64_t)preferredBrandsCount
{
  return self->_preferredBrands.count;
}

- (unint64_t)preferredBrands
{
  return self->_preferredBrands.list;
}

- (void)addPreferredBrand:(unint64_t)a3
{
  -[GEOMapServiceTraits _readPreferredBrands]((uint64_t)self);
  if (self) {
    PBRepeatedUInt64Add();
  }
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_uint64_t flags = &self->_flags;
  *((void *)p_flags + 1) |= 4uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)p_flags + 1) |= 0x200000000000uLL;
}

- (unint64_t)preferredBrandAtIndex:(unint64_t)a3
{
  -[GEOMapServiceTraits _readPreferredBrands]((uint64_t)self);
  p_preferredBrands = &self->_preferredBrands;
  unint64_t count = self->_preferredBrands.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    uint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_preferredBrands->list[a3];
}

- (void)setPreferredBrands:(unint64_t *)a3 count:(unint64_t)a4
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((void *)&self->_flags + 1) |= 4uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((void *)&self->_flags + 1) |= 0x200000000000uLL;

  MEMORY[0x1F4147438](&self->_preferredBrands, a3, a4);
}

- (BOOL)isWithinHikingBoundary
{
  return self->_isWithinHikingBoundary;
}

- (void)setIsWithinHikingBoundary:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x100000000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_isWithinHikingBoundary = a3;
}

- (void)setHasIsWithinHikingBoundary:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x100000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFEFFFFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasIsWithinHikingBoundary
{
  return (*((unsigned __int8 *)&self->_flags + 5) >> 4) & 1;
}

- (BOOL)isWithinHikingBufferRegion
{
  return self->_isWithinHikingBufferRegion;
}

- (void)setIsWithinHikingBufferRegion:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x200000000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_isWithinHikingBufferRegiouint64_t n = a3;
}

- (void)setHasIsWithinHikingBufferRegion:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x200000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFDFFFFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasIsWithinHikingBufferRegion
{
  return (*((unsigned __int8 *)&self->_flags + 5) >> 5) & 1;
}

- (void)_readSearchImplicitFilterInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 768) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchImplicitFilterInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasSearchImplicitFilterInfo
{
  return self->_searchImplicitFilterInfo != 0;
}

- (GEOSearchImplicitFilterInfo)searchImplicitFilterInfo
{
  -[GEOMapServiceTraits _readSearchImplicitFilterInfo]((uint64_t)self);
  searchImplicitFilterInfo = self->_searchImplicitFilterInfo;

  return searchImplicitFilterInfo;
}

- (void)setSearchImplicitFilterInfo:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x201000000000uLL;
  objc_storeStrong((id *)&self->_searchImplicitFilterInfo, a3);
}

- (int)devicePlatform
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x1000) != 0) {
    return self->_devicePlatform;
  }
  else {
    return 0;
  }
}

- (void)setHasDevicePlatform:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 4096;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (id)devicePlatformAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E7CF0[a3];
  }

  return v3;
}

- (int)StringAsDevicePlatform:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"IOS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MACOS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TVOS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"WATCHOS"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)containsSensitiveData
{
  return self->_containsSensitiveData;
}

- (void)setContainsSensitiveData:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x1000000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_containsSensitiveData = a3;
}

- (void)setHasContainsSensitiveData:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x1000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFEFFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasContainsSensitiveData
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 4) & 1;
}

- (void)_readSpotlightSearchPunchinEncodedString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 768) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpotlightSearchPunchinEncodedString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasSpotlightSearchPunchinEncodedString
{
  return self->_spotlightSearchPunchinEncodedString != 0;
}

- (NSString)spotlightSearchPunchinEncodedString
{
  -[GEOMapServiceTraits _readSpotlightSearchPunchinEncodedString]((uint64_t)self);
  spotlightSearchPunchinEncodedString = self->_spotlightSearchPunchinEncodedString;

  return spotlightSearchPunchinEncodedString;
}

- (void)setSpotlightSearchPunchinEncodedString:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x204000000000uLL;
  objc_storeStrong((id *)&self->_spotlightSearchPunchinEncodedString, a3);
}

- (BOOL)optimizeSearchRequestComponents
{
  return self->_optimizeSearchRequestComponents;
}

- (void)setOptimizeSearchRequestComponents:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x800000000000uLL;
  *((void *)&self->_flags + 1) = v3;
  self->_optimizeSearchRequestComponents = a3;
}

- (void)setHasOptimizeSearchRequestComponents:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x800000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFF7FFFFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasOptimizeSearchRequestComponents
{
  return *((unsigned __int8 *)&self->_flags + 5) >> 7;
}

- (void)_readRecentAutocompleteSessionData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 768) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRecentAutocompleteSessionData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasRecentAutocompleteSessionData
{
  return self->_recentAutocompleteSessionData != 0;
}

- (GEOPDAutocompleteSessionData)recentAutocompleteSessionData
{
  -[GEOMapServiceTraits _readRecentAutocompleteSessionData]((uint64_t)self);
  recentAutocompleteSessionData = self->_recentAutocompleteSessionData;

  return recentAutocompleteSessionData;
}

- (void)setRecentAutocompleteSessionData:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x200200000000uLL;
  objc_storeStrong((id *)&self->_recentAutocompleteSessionData, a3);
}

- (void)setHasAnalyticsOptOut:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x100000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFEFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasAnalyticsOptOut
{
  return *((unsigned char *)&self->_flags + 4) & 1;
}

- (void)_readUserActionMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 769) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserActionMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasUserActionMetadata
{
  return self->_userActionMetadata != 0;
}

- (GEOPDSSessionUserActionMetadata)userActionMetadata
{
  -[GEOMapServiceTraits _readUserActionMetadata]((uint64_t)self);
  userActionMetadata = self->_userActionMetadata;

  return userActionMetadata;
}

- (void)setUserActionMetadata:(id)a3
{
  *((void *)&self->_flags + 1) |= 0x240000000000uLL;
  objc_storeStrong((id *)&self->_userActionMetadata, a3);
}

- (void)setHasWantsRouteCreationTip:(BOOL)a3
{
  uint64_t v3 = *((void *)&self->_flags + 1);
  uint64_t v4 = 0x2000000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xDFFFFFFFFFFFFFFFLL | v4;
  *((void *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasWantsRouteCreationTip
{
  return (*((unsigned __int8 *)&self->_flags + 7) >> 5) & 1;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOMapServiceTraits;
  uint64_t v4 = [(GEOMapServiceTraits *)&v8 description];
  id v5 = [(GEOMapServiceTraits *)self dictionaryRepresentation];
  int v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapServiceTraits _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v386 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v362 = 0;
    goto LABEL_655;
  }
  [(id)a1 readAll:1];
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = &OBJC_IVAR___GEOMapItemStorage__readerMarkLength;
  uint64_t v6 = *(void *)(a1 + 756);
  if (v6)
  {
    id v7 = _GEOSessionIDDictionaryRepresentation((void *)(a1 + 264));
    if (a2) {
      objc_super v8 = @"sessionId";
    }
    else {
      objc_super v8 = @"session_id";
    }
    id v9 = v7;

    [v4 setObject:v9 forKey:v8];
    uint64_t v6 = *(void *)(a1 + 756);
  }
  unint64_t v10 = 0x1E4F28000uLL;
  if ((v6 & 0x10000000) != 0)
  {
    v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 708)];
    if (a2) {
      uint64_t v12 = @"sequenceNumber";
    }
    else {
      uint64_t v12 = @"sequence_number";
    }
    [v4 setObject:v11 forKey:v12];
  }
  v13 = [(id)a1 appIdentifier];
  if (v13)
  {
    if (a2) {
      uint64_t v14 = @"appIdentifier";
    }
    else {
      uint64_t v14 = @"app_identifier";
    }
    [v4 setObject:v13 forKey:v14];
  }

  uint64_t v15 = [(id)a1 appMajorVersion];
  if (v15)
  {
    if (a2) {
      id v16 = @"appMajorVersion";
    }
    else {
      id v16 = @"app_major_version";
    }
    [v4 setObject:v15 forKey:v16];
  }

  v17 = [(id)a1 appMinorVersion];
  if (v17)
  {
    if (a2) {
      uint64_t v18 = @"appMinorVersion";
    }
    else {
      uint64_t v18 = @"app_minor_version";
    }
    [v4 setObject:v17 forKey:v18];
  }

  uint64_t v19 = [(id)a1 deviceLocation];
  v20 = v19;
  if (v19)
  {
    if (a2) {
      [v19 jsonRepresentation];
    }
    else {
    id v21 = [v19 dictionaryRepresentation];
    }

    [v4 setObject:v21 forKey:@"deviceLocation"];
  }

  if (*(void *)(a1 + 248))
  {
    uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    uint64_t v23 = (void *)(a1 + 240);
    if (*(void *)(a1 + 248))
    {
      unint64_t v24 = 0;
      do
      {
        uint64_t v25 = *(int *)(*v23 + 4 * v24);
        if (v25 >= 7)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v25);
          uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v26 = off_1E53E7BE8[v25];
        }
        [v22 addObject:v26];

        ++v24;
        uint64_t v23 = (void *)(a1 + 240);
      }
      while (v24 < *(void *)(a1 + 248));
    }
    [v4 setObject:v22 forKey:@"transportType"];

    id v5 = &OBJC_IVAR___GEOMapItemStorage__readerMarkLength;
    unint64_t v10 = 0x1E4F28000uLL;
  }
  uint64_t v27 = [(id)a1 mapRegion];
  v28 = v27;
  if (v27)
  {
    if (a2) {
      [v27 jsonRepresentation];
    }
    else {
    id v29 = [v27 dictionaryRepresentation];
    }

    [v4 setObject:v29 forKey:@"mapRegion"];
  }

  if (*(void *)(a1 + 392))
  {
    uint64_t v30 = [(id)a1 deviceDisplayLanguages];
    if (a2) {
      unint64_t v31 = @"deviceDisplayLanguage";
    }
    else {
      unint64_t v31 = @"device_display_language";
    }
    [v4 setObject:v30 forKey:v31];
  }
  uint64_t v32 = [(id)a1 deviceKeyboardLocale];
  if (v32)
  {
    if (a2) {
      uint64_t v33 = @"deviceKeyboardLocale";
    }
    else {
      uint64_t v33 = @"device_keyboard_locale";
    }
    [v4 setObject:v32 forKey:v33];
  }

  unint64_t v34 = [(id)a1 deviceSpokenLocale];
  if (v34)
  {
    if (a2) {
      unint64_t v35 = @"deviceSpokenLocale";
    }
    else {
      unint64_t v35 = @"device_spoken_locale";
    }
    [v4 setObject:v34 forKey:v35];
  }

  uint64_t v36 = *(void *)(a1 + 756);
  if ((v36 & 0x8000000000) != 0)
  {
    unint64_t v37 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 731)];
    [v4 setObject:v37 forKey:@"isAPICall"];

    uint64_t v36 = *(void *)(a1 + 756);
  }
  if ((v36 & 0x20000000) != 0)
  {
    uint64_t v38 = *(int *)(a1 + 712);
    if (v38 >= 0x18)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 712));
      uint64_t v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v39 = off_1E53E7960[v38];
    }
    [v4 setObject:v39 forKey:@"source"];
  }
  if ([*(id *)(a1 + 472) count])
  {
    uint64_t v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 472), "count"));
    long long v378 = 0u;
    long long v379 = 0u;
    long long v380 = 0u;
    long long v381 = 0u;
    id v41 = *(id *)(a1 + 472);
    uint64_t v42 = [v41 countByEnumeratingWithState:&v378 objects:v385 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v379;
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v379 != v44) {
            objc_enumerationMutation(v41);
          }
          uint64_t v46 = *(void **)(*((void *)&v378 + 1) + 8 * i);
          if (a2) {
            [v46 jsonRepresentation];
          }
          else {
          id v47 = [v46 dictionaryRepresentation];
          }

          [v40 addObject:v47];
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v378 objects:v385 count:16];
      }
      while (v43);
    }

    [v4 setObject:v40 forKey:@"photoSizes"];
    id v5 = &OBJC_IVAR___GEOMapItemStorage__readerMarkLength;
    unint64_t v10 = 0x1E4F28000uLL;
  }
  if ((*(unsigned char *)(a1 + 758) & 2) != 0)
  {
    uint64_t v48 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 664)];
    [v4 setObject:v48 forKey:@"photosCount"];
  }
  if ([*(id *)(a1 + 520) count])
  {
    uint64_t v49 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 520), "count"));
    long long v374 = 0u;
    long long v375 = 0u;
    long long v376 = 0u;
    long long v377 = 0u;
    id v50 = *(id *)(a1 + 520);
    uint64_t v51 = [v50 countByEnumeratingWithState:&v374 objects:v384 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v375;
      do
      {
        for (uint64_t j = 0; j != v52; ++j)
        {
          if (*(void *)v375 != v53) {
            objc_enumerationMutation(v50);
          }
          long long v55 = *(void **)(*((void *)&v374 + 1) + 8 * j);
          if (a2) {
            [v55 jsonRepresentation];
          }
          else {
          id v56 = [v55 dictionaryRepresentation];
          }

          [v49 addObject:v56];
        }
        uint64_t v52 = [v50 countByEnumeratingWithState:&v374 objects:v384 count:16];
      }
      while (v52);
    }

    [v4 setObject:v49 forKey:@"reviewUserPhotoSizes"];
    id v5 = &OBJC_IVAR___GEOMapItemStorage__readerMarkLength;
    unint64_t v10 = 0x1E4F28000uLL;
  }
  uint64_t v57 = *(void *)(a1 + 756);
  if ((v57 & 0x1000000) != 0)
  {
    long long v58 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 692)];
    [v4 setObject:v58 forKey:@"reviewUserPhotosCount"];

    uint64_t v57 = *(void *)(a1 + 756);
    if ((v57 & 0x40000000) == 0)
    {
LABEL_95:
      if ((v57 & 0x80000000) == 0) {
        goto LABEL_96;
      }
      goto LABEL_103;
    }
  }
  else if ((v57 & 0x40000000) == 0)
  {
    goto LABEL_95;
  }
  long long v59 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 716)];
  if (a2) {
    long long v60 = @"timeSinceMapEnteredForeground";
  }
  else {
    long long v60 = @"time_since_map_entered_foreground";
  }
  [v4 setObject:v59 forKey:v60];

  uint64_t v57 = *(void *)(a1 + 756);
  if ((v57 & 0x80000000) == 0)
  {
LABEL_96:
    if ((v57 & 0x200) == 0) {
      goto LABEL_114;
    }
    goto LABEL_107;
  }
LABEL_103:
  long long v61 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 720)];
  if (a2) {
    long long v62 = @"timeSinceMapViewportChanged";
  }
  else {
    long long v62 = @"time_since_map_viewport_changed";
  }
  [v4 setObject:v61 forKey:v62];

  if ((*(void *)(a1 + 756) & 0x200) != 0)
  {
LABEL_107:
    unsigned int v63 = *(_DWORD *)(a1 + 632) - 1;
    if (v63 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 632));
      long long v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v64 = off_1E53E7A20[v63];
    }
    if (a2) {
      long long v65 = @"carHeadunitInteractionModel";
    }
    else {
      long long v65 = @"car_headunit_interaction_model";
    }
    [v4 setObject:v64 forKey:v65];
  }
LABEL_114:
  long long v66 = [(id)a1 carHeadunitManufacturer];
  if (v66)
  {
    if (a2) {
      long long v67 = @"carHeadunitManufacturer";
    }
    else {
      long long v67 = @"car_headunit_manufacturer";
    }
    [v4 setObject:v66 forKey:v67];
  }

  long long v68 = [(id)a1 carHeadunitModel];
  if (v68)
  {
    if (a2) {
      long long v69 = @"carHeadunitModel";
    }
    else {
      long long v69 = @"car_headunit_model";
    }
    [v4 setObject:v68 forKey:v69];
  }

  uint64_t v70 = *(void *)(a1 + 756);
  if ((v70 & 4) != 0)
  {
    long long v71 = [NSNumber numberWithDouble:*(double *)(a1 + 360)];
    if (a2) {
      long long v72 = @"carHeadunitPixelWidth";
    }
    else {
      long long v72 = @"car_headunit_pixel_width";
    }
    [v4 setObject:v71 forKey:v72];

    uint64_t v70 = *(void *)(a1 + 756);
  }
  if ((v70 & 2) != 0)
  {
    long long v73 = [NSNumber numberWithDouble:*(double *)(a1 + 352)];
    if (a2) {
      long long v74 = @"carHeadunitPixelHeight";
    }
    else {
      long long v74 = @"car_headunit_pixel_height";
    }
    [v4 setObject:v73 forKey:v74];
  }
  uint64_t v75 = [(id)a1 transitScheduleFilter];
  uint64_t v76 = v75;
  if (v75)
  {
    if (a2)
    {
      id v77 = [v75 jsonRepresentation];
      v78 = @"transitScheduleFilter";
    }
    else
    {
      id v77 = [v75 dictionaryRepresentation];
      v78 = @"transit_schedule_filter";
    }
    id v79 = v77;

    [v4 setObject:v79 forKey:v78];
  }

  uint64_t v80 = *(void *)(a1 + 756);
  if ((v80 & 0x10) != 0)
  {
    uint64_t v81 = [NSNumber numberWithDouble:*(double *)(a1 + 464)];
    if (a2) {
      v82 = @"mapZoomLevel";
    }
    else {
      v82 = @"map_zoom_level";
    }
    [v4 setObject:v81 forKey:v82];

    uint64_t v80 = *(void *)(a1 + 756);
  }
  if ((v80 & 0x4000) != 0)
  {
    uint64_t v83 = *(int *)(a1 + 652);
    if (v83 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 652));
      uint64_t v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v84 = off_1E53E7A38[v83];
    }
    [v4 setObject:v84 forKey:@"mode"];
  }
  uint64_t v85 = [(id)a1 displayRegion];
  if (v85) {
    [v4 setObject:v85 forKey:@"displayRegion"];
  }

  v86 = [(id)a1 providerID];
  if (v86) {
    [v4 setObject:v86 forKey:@"providerID"];
  }

  uint64_t v87 = *(void *)(a1 + 756);
  if ((v87 & 0x800) != 0)
  {
    uint64_t v101 = *(int *)(a1 + 640);
    if (v101 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 640));
      id v102 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v102 = off_1E53E7A60[v101];
    }
    if (a2) {
      v162 = @"deviceInterfaceOrientation";
    }
    else {
      v162 = @"device_interface_orientation";
    }
    [v4 setObject:v102 forKey:v162];

    uint64_t v87 = *(void *)(a1 + 756);
    if ((v87 & 0x400) == 0)
    {
LABEL_155:
      if ((v87 & 0x100) == 0) {
        goto LABEL_156;
      }
      goto LABEL_309;
    }
  }
  else if ((v87 & 0x400) == 0)
  {
    goto LABEL_155;
  }
  uint64_t v163 = *(int *)(a1 + 636);
  if (v163 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 636));
    v164 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v164 = off_1E53E7A88[v163];
  }
  if (a2) {
    v169 = @"deviceBatteryState";
  }
  else {
    v169 = @"device_battery_state";
  }
  [v4 setObject:v164 forKey:v169];

  uint64_t v87 = *(void *)(a1 + 756);
  if ((v87 & 0x100) == 0)
  {
LABEL_156:
    if ((v87 & 0x400000000000) == 0) {
      goto LABEL_158;
    }
    goto LABEL_157;
  }
LABEL_309:
  uint64_t v170 = *(int *)(a1 + 628);
  if (v170 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 628));
    v171 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v171 = off_1E53E7AA8[v170];
  }
  if (a2) {
    v172 = @"carHeadunitConnectionType";
  }
  else {
    v172 = @"car_headunit_connection_type";
  }
  [v4 setObject:v171 forKey:v172];

  if ((*(void *)(a1 + 756) & 0x400000000000) != 0)
  {
LABEL_157:
    v88 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 738)];
    [v4 setObject:v88 forKey:@"navigating"];
  }
LABEL_158:
  if ([*(id *)(a1 + 440) count])
  {
    uint64_t v89 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 440), "count"));
    long long v370 = 0u;
    long long v371 = 0u;
    long long v372 = 0u;
    long long v373 = 0u;
    id v90 = *(id *)(a1 + 440);
    uint64_t v91 = [v90 countByEnumeratingWithState:&v370 objects:v383 count:16];
    if (v91)
    {
      uint64_t v92 = v91;
      uint64_t v93 = *(void *)v371;
      do
      {
        for (uint64_t k = 0; k != v92; ++k)
        {
          if (*(void *)v371 != v93) {
            objc_enumerationMutation(v90);
          }
          uint64_t v95 = *(void **)(*((void *)&v370 + 1) + 8 * k);
          if (a2) {
            [v95 jsonRepresentation];
          }
          else {
          id v96 = [v95 dictionaryRepresentation];
          }

          [v89 addObject:v96];
        }
        uint64_t v92 = [v90 countByEnumeratingWithState:&v370 objects:v383 count:16];
      }
      while (v92);
    }

    [v4 setObject:v89 forKey:@"historicalLocations"];
    id v5 = &OBJC_IVAR___GEOMapItemStorage__readerMarkLength;
    unint64_t v10 = 0x1E4F28000;
  }
  v97 = [(id)a1 automobileOptions];
  id v98 = v97;
  if (v97)
  {
    if (a2)
    {
      v99 = [v97 jsonRepresentation];
      id v100 = @"automobileOptions";
    }
    else
    {
      v99 = [v97 dictionaryRepresentation];
      id v100 = @"automobile_options";
    }
    id v103 = v99;

    [v4 setObject:v103 forKey:v100];
  }

  v104 = [(id)a1 transitOptions];
  uint64_t v105 = v104;
  if (v104)
  {
    if (a2)
    {
      id v106 = [v104 jsonRepresentation];
      v107 = @"transitOptions";
    }
    else
    {
      id v106 = [v104 dictionaryRepresentation];
      v107 = @"transit_options";
    }
    id v108 = v106;

    [v4 setObject:v108 forKey:v107];
  }

  uint64_t v109 = [(id)a1 walkingOptions];
  uint64_t v110 = v109;
  if (v109)
  {
    if (a2)
    {
      id v111 = [v109 jsonRepresentation];
      v112 = @"walkingOptions";
    }
    else
    {
      id v111 = [v109 dictionaryRepresentation];
      v112 = @"walking_options";
    }
    id v113 = v111;

    [v4 setObject:v113 forKey:v112];
  }

  if (*(void *)(a1 + 32))
  {
    uint64_t v114 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v115 = (void *)(a1 + 24);
    if (*(void *)(a1 + 32))
    {
      unint64_t v116 = 0;
      do
      {
        uint64_t v117 = *(int *)(*v115 + 4 * v116);
        if (v117 >= 5)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v117);
          id v118 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v118 = off_1E53E7AC0[v117];
        }
        [v114 addObject:v118];

        ++v116;
        v115 = (void *)(a1 + 24);
      }
      while (v116 < *(void *)(a1 + 32));
    }
    if (a2) {
      v119 = @"engineType";
    }
    else {
      v119 = @"engine_type";
    }
    [v4 setObject:v114 forKey:v119];

    id v5 = &OBJC_IVAR___GEOMapItemStorage__readerMarkLength;
    unint64_t v10 = 0x1E4F28000uLL;
  }
  uint64_t v120 = *(void *)(a1 + v5[25]);
  if ((v120 & 0x200000) != 0)
  {
    uint64_t v135 = *(int *)(a1 + 680);
    if (v135 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 680));
      long long v136 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v136 = off_1E53E7AE8[v135];
    }
    if (a2) {
      v165 = @"requestMode";
    }
    else {
      v165 = @"request_mode";
    }
    [v4 setObject:v136 forKey:v165];

    uint64_t v120 = *(void *)(a1 + v5[25]);
    if ((v120 & 0x80000000000000) == 0)
    {
LABEL_200:
      if ((v120 & 0x100000000000000) == 0) {
        goto LABEL_205;
      }
      goto LABEL_201;
    }
  }
  else if ((v120 & 0x80000000000000) == 0)
  {
    goto LABEL_200;
  }
  v166 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 747)];
  if (a2) {
    v167 = @"supportDirectionIntentSearch";
  }
  else {
    v167 = @"support_direction_intent_search";
  }
  [v4 setObject:v166 forKey:v167];

  if ((*(void *)(a1 + 756) & 0x100000000000000) != 0)
  {
LABEL_201:
    v121 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 748)];
    if (a2) {
      id v122 = @"supportDymSuggestion";
    }
    else {
      id v122 = @"support_dym_suggestion";
    }
    [v4 setObject:v121 forKey:v122];
  }
LABEL_205:
  if (*(void *)(a1 + 56))
  {
    v123 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    long long v124 = (void *)(a1 + 48);
    if (*(void *)(a1 + 56))
    {
      unint64_t v125 = 0;
      do
      {
        uint64_t v126 = *(int *)(*v124 + 4 * v125);
        if (v126 >= 7)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v126);
          long long v127 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          long long v127 = off_1E53E7B10[v126];
        }
        [v123 addObject:v127];

        ++v125;
        long long v124 = (void *)(a1 + 48);
      }
      while (v125 < *(void *)(a1 + 56));
    }
    if (a2) {
      long long v128 = @"knownClientResolvedType";
    }
    else {
      long long v128 = @"known_client_resolved_type";
    }
    [v4 setObject:v123 forKey:v128];

    id v5 = &OBJC_IVAR___GEOMapItemStorage__readerMarkLength;
    unint64_t v10 = 0x1E4F28000uLL;
  }
  if ((*(unsigned char *)(a1 + v5[25] + 7) & 0x10) != 0)
  {
    long long v129 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 752)];
    if (a2) {
      long long v130 = @"wantsBrandIcon";
    }
    else {
      long long v130 = @"wants_brand_icon";
    }
    [v4 setObject:v129 forKey:v130];
  }
  long long v131 = [(id)a1 venueIdentifier];
  long long v132 = v131;
  if (v131)
  {
    if (a2)
    {
      long long v133 = [v131 jsonRepresentation];
      long long v134 = @"venueIdentifier";
    }
    else
    {
      long long v133 = [v131 dictionaryRepresentation];
      long long v134 = @"venue_identifier";
    }
    id v137 = v133;

    [v4 setObject:v137 forKey:v134];
  }

  uint64_t v138 = *(void *)(a1 + v5[25]);
  if ((v138 & 0x4000000000) != 0)
  {
    v144 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 730)];
    if (a2) {
      v145 = @"deviceInVehicle";
    }
    else {
      v145 = @"device_in_vehicle";
    }
    [v4 setObject:v144 forKey:v145];

    uint64_t v138 = *(void *)(a1 + 756);
    if ((v138 & 0x400000) == 0)
    {
LABEL_230:
      if ((v138 & 0x2000) == 0) {
        goto LABEL_235;
      }
      goto LABEL_231;
    }
  }
  else if ((v138 & 0x400000) == 0)
  {
    goto LABEL_230;
  }
  uint64_t v146 = *(int *)(a1 + 684);
  if (v146 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 684));
    v147 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v147 = off_1E53E7B48[v146];
  }
  if (a2) {
    v168 = @"requestPriority";
  }
  else {
    v168 = @"request_priority";
  }
  [v4 setObject:v147 forKey:v168];

  if ((*(void *)(a1 + v5[25]) & 0x2000) != 0)
  {
LABEL_231:
    long long v139 = [*(id *)(v10 + 3792) numberWithUnsignedInt:*(unsigned int *)(a1 + 648)];
    if (a2) {
      long long v140 = @"httpRequestPriority";
    }
    else {
      long long v140 = @"http_request_priority";
    }
    [v4 setObject:v139 forKey:v140];
  }
LABEL_235:
  long long v141 = [(id)a1 analyticsAppIdentifier];
  if (v141)
  {
    if (a2) {
      long long v142 = @"analyticsAppIdentifier";
    }
    else {
      long long v142 = @"analytics_app_identifier";
    }
    [v4 setObject:v141 forKey:v142];
  }

  uint64_t v143 = *(void *)(a1 + v5[25]);
  if ((v143 & 0x20) != 0)
  {
    v148 = [*(id *)(v10 + 3792) numberWithDouble:*(double *)(a1 + 544)];
    if (a2) {
      uint64_t v149 = @"sessionRelativeTimestamp";
    }
    else {
      uint64_t v149 = @"session_relative_timestamp";
    }
    [v4 setObject:v148 forKey:v149];

    uint64_t v143 = *(void *)(a1 + 756);
    if ((v143 & 0x40000000000000) == 0)
    {
LABEL_242:
      if ((v143 & 0x400000000000000) == 0) {
        goto LABEL_243;
      }
      goto LABEL_262;
    }
  }
  else if ((v143 & 0x40000000000000) == 0)
  {
    goto LABEL_242;
  }
  v150 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 746)];
  if (a2) {
    v151 = @"supportDirectionIntentAutocomplete";
  }
  else {
    v151 = @"support_direction_intent_autocomplete";
  }
  [v4 setObject:v150 forKey:v151];

  uint64_t v143 = *(void *)(a1 + 756);
  if ((v143 & 0x400000000000000) == 0)
  {
LABEL_243:
    if ((v143 & 0x2000000000) == 0) {
      goto LABEL_244;
    }
    goto LABEL_266;
  }
LABEL_262:
  v152 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 750)];
  if (a2) {
    v153 = @"supportUnresolvedDirectionIntent";
  }
  else {
    v153 = @"support_unresolved_direction_intent";
  }
  [v4 setObject:v152 forKey:v153];

  uint64_t v143 = *(void *)(a1 + 756);
  if ((v143 & 0x2000000000) == 0)
  {
LABEL_244:
    if ((v143 & 0x200000000) == 0) {
      goto LABEL_245;
    }
    goto LABEL_270;
  }
LABEL_266:
  v154 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 729)];
  if (a2) {
    v155 = @"deviceDarkMode";
  }
  else {
    v155 = @"device_dark_mode";
  }
  [v4 setObject:v154 forKey:v155];

  uint64_t v143 = *(void *)(a1 + 756);
  if ((v143 & 0x200000000) == 0)
  {
LABEL_245:
    if ((v143 & 0x800000000000000) == 0) {
      goto LABEL_246;
    }
    goto LABEL_274;
  }
LABEL_270:
  v156 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 725)];
  if (a2) {
    v157 = @"appDarkMode";
  }
  else {
    v157 = @"app_dark_mode";
  }
  [v4 setObject:v156 forKey:v157];

  uint64_t v143 = *(void *)(a1 + 756);
  if ((v143 & 0x800000000000000) == 0)
  {
LABEL_246:
    if ((v143 & 0x800000) == 0) {
      goto LABEL_323;
    }
    goto LABEL_278;
  }
LABEL_274:
  v158 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 751)];
  if (a2) {
    v159 = @"supportsBrandFallback";
  }
  else {
    v159 = @"supports_brand_fallback";
  }
  [v4 setObject:v158 forKey:v159];

  if ((*(void *)(a1 + 756) & 0x800000) != 0)
  {
LABEL_278:
    int v160 = *(_DWORD *)(a1 + 688);
    if (v160)
    {
      if (v160 == 1)
      {
        v161 = @"ROUTE_WAYPOINT_RESOLUTION";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 688));
        v161 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v161 = @"UNKNOWN";
    }
    if (a2) {
      v173 = @"requestPurpose";
    }
    else {
      v173 = @"request_purpose";
    }
    [v4 setObject:v161 forKey:v173];
  }
LABEL_323:
  if (*(void *)(a1 + 128))
  {
    v174 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v175 = (void *)(a1 + 120);
    if (*(void *)(a1 + 128))
    {
      unint64_t v176 = 0;
      do
      {
        uint64_t v177 = *(int *)(*v175 + 4 * v176);
        if (v177 >= 3)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v177);
          v178 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v178 = off_1E53E7B60[v177];
        }
        [v174 addObject:v178];

        ++v176;
        v175 = (void *)(a1 + 120);
      }
      while (v176 < *(void *)(a1 + 128));
    }
    if (a2) {
      v179 = @"supportedAutocompleteListType";
    }
    else {
      v179 = @"supported_autocomplete_list_type";
    }
    [v4 setObject:v174 forKey:v179];

    id v5 = &OBJC_IVAR___GEOMapItemStorage__readerMarkLength;
    unint64_t v10 = 0x1E4F28000uLL;
  }
  if ((*(unsigned char *)(a1 + v5[25] + 5) & 4) != 0)
  {
    v180 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 734)];
    if (a2) {
      v181 = @"isSettlement";
    }
    else {
      v181 = @"is_settlement";
    }
    [v4 setObject:v180 forKey:v181];
  }
  v182 = [(id)a1 transitTripStopTimeFilter];
  v183 = v182;
  if (v182)
  {
    if (a2)
    {
      v184 = [v182 jsonRepresentation];
      v185 = @"transitTripStopTimeFilter";
    }
    else
    {
      v184 = [v182 dictionaryRepresentation];
      v185 = @"transit_trip_stop_time_filter";
    }
    id v186 = v184;

    [v4 setObject:v186 forKey:v185];
  }

  if ((*(unsigned char *)(a1 + v5[25] + 6) & 0x20) != 0)
  {
    v187 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 745)];
    if (a2) {
      v188 = @"supportClientRankingFeatureMetadata";
    }
    else {
      v188 = @"support_client_ranking_feature_metadata";
    }
    [v4 setObject:v187 forKey:v188];
  }
  if (*(void *)(a1 + 176))
  {
    v189 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v190 = (void *)(a1 + 168);
    if (*(void *)(a1 + 176))
    {
      unint64_t v191 = 0;
      do
      {
        uint64_t v192 = *(int *)(*v190 + 4 * v191);
        if (v192 >= 9)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v192);
          v193 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v193 = off_1E53E7B78[v192];
        }
        [v189 addObject:v193];

        ++v191;
        v190 = (void *)(a1 + 168);
      }
      while (v191 < *(void *)(a1 + 176));
    }
    if (a2) {
      v194 = @"supportedChildAction";
    }
    else {
      v194 = @"supported_child_action";
    }
    [v4 setObject:v189 forKey:v194];

    id v5 = &OBJC_IVAR___GEOMapItemStorage__readerMarkLength;
    unint64_t v10 = 0x1E4F28000uLL;
  }
  uint64_t v195 = *(void *)(a1 + v5[25]);
  if ((v195 & 0x8000000000000) != 0)
  {
    v206 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 743)];
    if (a2) {
      v207 = @"supportChildItems";
    }
    else {
      v207 = @"support_child_items";
    }
    [v4 setObject:v206 forKey:v207];

    uint64_t v195 = *(void *)(a1 + 756);
    if ((v195 & 0x10000000000) == 0)
    {
LABEL_362:
      if ((v195 & 0x800000000) == 0) {
        goto LABEL_367;
      }
      goto LABEL_363;
    }
  }
  else if ((v195 & 0x10000000000) == 0)
  {
    goto LABEL_362;
  }
  v208 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 732)];
  if (a2) {
    v209 = @"isRefund";
  }
  else {
    v209 = @"is_refund";
  }
  [v4 setObject:v208 forKey:v209];

  if ((*(void *)(a1 + 756) & 0x800000000) != 0)
  {
LABEL_363:
    v196 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 727)];
    if (a2) {
      v197 = @"autocompleteRequestSupportsSectionHeader";
    }
    else {
      v197 = @"autocomplete_request_supports_section_header";
    }
    [v4 setObject:v196 forKey:v197];
  }
LABEL_367:
  if (*(void *)(a1 + 152))
  {
    v198 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v199 = (void *)(a1 + 144);
    if (*(void *)(a1 + 152))
    {
      unint64_t v200 = 0;
      do
      {
        uint64_t v201 = *(int *)(*v199 + 4 * v200);
        if (v201 >= 5)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v201);
          v202 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v202 = off_1E53E7BC0[v201];
        }
        [v198 addObject:v202];

        ++v200;
        v199 = (void *)(a1 + 144);
      }
      while (v200 < *(void *)(a1 + 152));
    }
    if (a2) {
      v203 = @"supportedAutocompleteResultCellType";
    }
    else {
      v203 = @"supported_autocomplete_result_cell_type";
    }
    [v4 setObject:v198 forKey:v203];

    id v5 = &OBJC_IVAR___GEOMapItemStorage__readerMarkLength;
    unint64_t v10 = 0x1E4F28000uLL;
  }
  if ((*(unsigned char *)(a1 + v5[25] + 1) & 0x80) != 0)
  {
    uint64_t v204 = *(int *)(a1 + 656);
    if (v204 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 656));
      v205 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v205 = off_1E53E7BE8[v204];
    }
    if (a2) {
      v210 = @"navigationTransportType";
    }
    else {
      v210 = @"navigation_transport_type";
    }
    [v4 setObject:v205 forKey:v210];
  }
  v211 = [(id)a1 cyclingOptions];
  v212 = v211;
  if (v211)
  {
    if (a2)
    {
      v213 = [v211 jsonRepresentation];
      v214 = @"cyclingOptions";
    }
    else
    {
      v213 = [v211 dictionaryRepresentation];
      v214 = @"cycling_options";
    }
    id v215 = v213;

    [v4 setObject:v215 forKey:v214];
  }

  if ((*(unsigned char *)(a1 + v5[25] + 2) & 8) != 0)
  {
    v216 = [*(id *)(v10 + 3792) numberWithUnsignedInt:*(unsigned int *)(a1 + 672)];
    if (a2) {
      v217 = @"ratingsCount";
    }
    else {
      v217 = @"ratings_count";
    }
    [v4 setObject:v216 forKey:v217];
  }
  if ([*(id *)(a1 + 424) count])
  {
    v218 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 424), "count"));
    long long v366 = 0u;
    long long v367 = 0u;
    long long v368 = 0u;
    long long v369 = 0u;
    id v219 = *(id *)(a1 + 424);
    uint64_t v220 = [v219 countByEnumeratingWithState:&v366 objects:v382 count:16];
    if (v220)
    {
      uint64_t v221 = v220;
      uint64_t v222 = *(void *)v367;
      do
      {
        for (uint64_t m = 0; m != v221; ++m)
        {
          if (*(void *)v367 != v222) {
            objc_enumerationMutation(v219);
          }
          v224 = *(void **)(*((void *)&v366 + 1) + 8 * m);
          if (a2) {
            [v224 jsonRepresentation];
          }
          else {
          id v225 = [v224 dictionaryRepresentation];
          }

          [v218 addObject:v225];
        }
        uint64_t v221 = [v219 countByEnumeratingWithState:&v366 objects:v382 count:16];
      }
      while (v221);
    }

    if (a2) {
      v226 = @"evChargingPort";
    }
    else {
      v226 = @"ev_charging_port";
    }
    [v4 setObject:v218 forKey:v226];

    id v5 = &OBJC_IVAR___GEOMapItemStorage__readerMarkLength;
    unint64_t v10 = 0x1E4F28000uLL;
  }
  if ((*(unsigned char *)(a1 + v5[25] + 5) & 8) != 0)
  {
    v227 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 735)];
    if (a2) {
      v228 = @"isWidgetRequest";
    }
    else {
      v228 = @"is_widget_request";
    }
    [v4 setObject:v227 forKey:v228];
  }
  if (*(void *)(a1 + 224))
  {
    v229 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v230 = (void *)(a1 + 216);
    if (*(void *)(a1 + 224))
    {
      unint64_t v231 = 0;
      do
      {
        uint64_t v232 = *(int *)(*v230 + 4 * v231);
        if (v232 >= 3)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v232);
          v233 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v233 = off_1E53E7C20[v232];
        }
        [v229 addObject:v233];

        ++v231;
        v230 = (void *)(a1 + 216);
      }
      while (v231 < *(void *)(a1 + 224));
    }
    if (a2) {
      v234 = @"supportedSearchTierType";
    }
    else {
      v234 = @"supported_search_tier_type";
    }
    [v4 setObject:v229 forKey:v234];

    id v5 = &OBJC_IVAR___GEOMapItemStorage__readerMarkLength;
    unint64_t v10 = 0x1E4F28000uLL;
  }
  uint64_t v235 = *(void *)(a1 + v5[25]);
  if ((v235 & 0x80) != 0)
  {
    v253 = [*(id *)(v10 + 3792) numberWithUnsignedInt:*(unsigned int *)(a1 + 624)];
    if (a2) {
      v254 = @"auxiliaryTierNumResults";
    }
    else {
      v254 = @"auxiliary_tier_num_results";
    }
    [v4 setObject:v253 forKey:v254];

    uint64_t v235 = *(void *)(a1 + 756);
    if ((v235 & 0x40000) == 0)
    {
LABEL_438:
      if ((v235 & 8) == 0) {
        goto LABEL_443;
      }
      goto LABEL_439;
    }
  }
  else if ((v235 & 0x40000) == 0)
  {
    goto LABEL_438;
  }
  v255 = [*(id *)(v10 + 3792) numberWithUnsignedInt:*(unsigned int *)(a1 + 668)];
  if (a2) {
    v256 = @"placeSummaryRevision";
  }
  else {
    v256 = @"place_summary_revision";
  }
  [v4 setObject:v255 forKey:v256];

  if ((*(void *)(a1 + 756) & 8) != 0)
  {
LABEL_439:
    v236 = [*(id *)(v10 + 3792) numberWithDouble:*(double *)(a1 + 448)];
    if (a2) {
      v237 = @"isTourist";
    }
    else {
      v237 = @"is_tourist";
    }
    [v4 setObject:v236 forKey:v237];
  }
LABEL_443:
  if (*(void *)(a1 + 80))
  {
    v238 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v239 = (void *)(a1 + 72);
    if (*(void *)(a1 + 80))
    {
      unint64_t v240 = 0;
      do
      {
        uint64_t v241 = *(int *)(*v239 + 4 * v240);
        if (v241 >= 6)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v241);
          v242 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v242 = off_1E53E7C38[v241];
        }
        [v238 addObject:v242];

        ++v240;
        v239 = (void *)(a1 + 72);
      }
      while (v240 < *(void *)(a1 + 80));
    }
    if (a2) {
      v243 = @"knownRefinementType";
    }
    else {
      v243 = @"known_refinement_type";
    }
    [v4 setObject:v238 forKey:v243];

    id v5 = &OBJC_IVAR___GEOMapItemStorage__readerMarkLength;
    unint64_t v10 = 0x1E4F28000uLL;
  }
  uint64_t v244 = *(void *)(a1 + v5[25]);
  if ((v244 & 0x4000000000000) != 0)
  {
    v245 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 742)];
    if (a2) {
      v246 = @"supportAutocompletePublisherResults";
    }
    else {
      v246 = @"support_autocomplete_publisher_results";
    }
    [v4 setObject:v245 forKey:v246];

    uint64_t v244 = *(void *)(a1 + 756);
  }
  if ((v244 & 0x2000000000000) != 0)
  {
    v247 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 741)];
    if (a2) {
      v248 = @"supportAutocompleteGuideResults";
    }
    else {
      v248 = @"support_autocomplete_guide_results";
    }
    [v4 setObject:v247 forKey:v248];
  }
  v249 = [(id)a1 previousSearchViewport];
  v250 = v249;
  if (v249)
  {
    if (a2)
    {
      v251 = [v249 jsonRepresentation];
      v252 = @"previousSearchViewport";
    }
    else
    {
      v251 = [v249 dictionaryRepresentation];
      v252 = @"previous_search_viewport";
    }
    id v257 = v251;

    [v4 setObject:v257 forKey:v252];
  }

  if (*(unsigned char *)(a1 + v5[25] + 2))
  {
    v258 = [*(id *)(v10 + 3792) numberWithUnsignedInt:*(unsigned int *)(a1 + 660)];
    if (a2) {
      v259 = @"photoAlbumCount";
    }
    else {
      v259 = @"photo_album_count";
    }
    [v4 setObject:v258 forKey:v259];
  }
  v260 = [(id)a1 resultRefinementQuery];
  v261 = v260;
  if (v260)
  {
    if (a2)
    {
      v262 = [v260 jsonRepresentation];
      v263 = @"resultRefinementQuery";
    }
    else
    {
      v262 = [v260 dictionaryRepresentation];
      v263 = @"result_refinement_query";
    }
    id v264 = v262;

    [v4 setObject:v264 forKey:v263];
  }

  uint64_t v265 = *(void *)(a1 + v5[25]);
  if ((v265 & 0x100000) != 0)
  {
    v266 = [*(id *)(v10 + 3792) numberWithUnsignedInt:*(unsigned int *)(a1 + 676)];
    if (a2) {
      v267 = @"relatedPlaceItemCount";
    }
    else {
      v267 = @"related_place_item_count";
    }
    [v4 setObject:v266 forKey:v267];

    uint64_t v265 = *(void *)(a1 + 756);
  }
  if ((v265 & 0x4000000) != 0)
  {
    uint64_t v268 = *(int *)(a1 + 700);
    if (v268 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 700));
      v269 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v269 = off_1E53E7C68[v268];
    }
    [v4 setObject:v269 forKey:@"searchRequestType"];
  }
  v270 = [(id)a1 currentLocaleCurrencySymbol];
  if (v270)
  {
    if (a2) {
      v271 = @"currentLocaleCurrencySymbol";
    }
    else {
      v271 = @"current_locale_currency_symbol";
    }
    [v4 setObject:v270 forKey:v271];
  }

  if (*(void *)(a1 + 200))
  {
    v272 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v273 = (void *)(a1 + 192);
    if (*(void *)(a1 + 200))
    {
      unint64_t v274 = 0;
      do
      {
        uint64_t v275 = *(int *)(*v273 + 4 * v274);
        if (v275 >= 5)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v275);
          v276 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v276 = off_1E53E7C88[v275];
        }
        [v272 addObject:v276];

        ++v274;
        v273 = (void *)(a1 + 192);
      }
      while (v274 < *(void *)(a1 + 200));
    }
    if (a2) {
      v277 = @"supportedPlaceSummaryFormatType";
    }
    else {
      v277 = @"supported_place_summary_format_type";
    }
    [v4 setObject:v272 forKey:v277];

    id v5 = &OBJC_IVAR___GEOMapItemStorage__readerMarkLength;
    unint64_t v10 = 0x1E4F28000uLL;
  }
  if ((*(unsigned char *)(a1 + v5[25]) & 0x40) != 0)
  {
    uint64_t v278 = *(int *)(a1 + 620);
    if (v278 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 620));
      v279 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v279 = off_1E53E7CB0[v278];
    }
    if (a2) {
      v280 = @"autocompleteOriginationType";
    }
    else {
      v280 = @"autocomplete_origination_type";
    }
    [v4 setObject:v279 forKey:v280];
  }
  v281 = [(id)a1 autocompleteOriginationPreviousLatlng];
  v282 = v281;
  if (v281)
  {
    if (a2)
    {
      v283 = [v281 jsonRepresentation];
      v284 = @"autocompleteOriginationPreviousLatlng";
    }
    else
    {
      v283 = [v281 dictionaryRepresentation];
      v284 = @"autocomplete_origination_previous_latlng";
    }
    id v285 = v283;

    [v4 setObject:v285 forKey:v284];
  }

  if ((*(unsigned char *)(a1 + v5[25] + 3) & 8) != 0)
  {
    uint64_t v286 = *(int *)(a1 + 704);
    if (v286 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 704));
      v287 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v287 = off_1E53E7CD0[v286];
    }
    if (a2) {
      v288 = @"searchOriginationType";
    }
    else {
      v288 = @"search_origination_type";
    }
    [v4 setObject:v287 forKey:v288];
  }
  v289 = [(id)a1 searchOriginationPreviousLatlng];
  v290 = v289;
  if (v289)
  {
    if (a2)
    {
      v291 = [v289 jsonRepresentation];
      v292 = @"searchOriginationPreviousLatlng";
    }
    else
    {
      v291 = [v289 dictionaryRepresentation];
      v292 = @"search_origination_previous_latlng";
    }
    id v293 = v291;

    [v4 setObject:v293 forKey:v292];
  }

  v294 = [(id)a1 addStopRouteInfo];
  v295 = v294;
  if (v294)
  {
    if (a2)
    {
      v296 = [v294 jsonRepresentation];
      v297 = @"addStopRouteInfo";
    }
    else
    {
      v296 = [v294 dictionaryRepresentation];
      v297 = @"add_stop_route_info";
    }
    id v298 = v296;

    [v4 setObject:v298 forKey:v297];
  }

  uint64_t v299 = *(void *)(a1 + v5[25]);
  if ((v299 & 0x400000000) != 0)
  {
    v306 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 726)];
    if (a2) {
      v307 = @"autocompleteOriginationEditingServerWaypoints";
    }
    else {
      v307 = @"autocomplete_origination_editing_server_waypoints";
    }
    [v4 setObject:v306 forKey:v307];

    uint64_t v299 = *(void *)(a1 + 756);
    if ((v299 & 0x1000000000000) == 0)
    {
LABEL_547:
      if ((v299 & 0x10000000000000) == 0) {
        goto LABEL_552;
      }
      goto LABEL_548;
    }
  }
  else if ((v299 & 0x1000000000000) == 0)
  {
    goto LABEL_547;
  }
  v308 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 740)];
  if (a2) {
    v309 = @"searchOriginationEditingServerWaypoints";
  }
  else {
    v309 = @"search_origination_editing_server_waypoints";
  }
  [v4 setObject:v308 forKey:v309];

  if ((*(void *)(a1 + 756) & 0x10000000000000) != 0)
  {
LABEL_548:
    v300 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 744)];
    if (a2) {
      v301 = @"supportClientRankingCompositeFeatures";
    }
    else {
      v301 = @"support_client_ranking_composite_features";
    }
    [v4 setObject:v300 forKey:v301];
  }
LABEL_552:
  v302 = [(id)a1 privacyMetadata];
  v303 = v302;
  if (v302)
  {
    if (a2)
    {
      v304 = [v302 jsonRepresentation];
      v305 = @"privacyMetadata";
    }
    else
    {
      v304 = [v302 dictionaryRepresentation];
      v305 = @"privacy_metadata";
    }
    id v310 = v304;

    [v4 setObject:v310 forKey:v305];
  }

  uint64_t v311 = *(void *)(a1 + v5[25]);
  if ((v311 & 0x2000000) == 0)
  {
    if ((v311 & 0x200000000000000) == 0) {
      goto LABEL_568;
    }
LABEL_595:
    v327 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 749)];
    if (a2) {
      v328 = @"supportStructuredRapAffordance";
    }
    else {
      v328 = @"support_structured_rap_affordance";
    }
    [v4 setObject:v327 forKey:v328];

    if ((*(void *)(a1 + 756) & 0x20000000000) == 0) {
      goto LABEL_573;
    }
    goto LABEL_569;
  }
  v325 = [*(id *)(v10 + 3792) numberWithUnsignedInt:*(unsigned int *)(a1 + 696)];
  if (a2) {
    v326 = @"routeStopCount";
  }
  else {
    v326 = @"route_stop_count";
  }
  [v4 setObject:v325 forKey:v326];

  uint64_t v311 = *(void *)(a1 + 756);
  if ((v311 & 0x200000000000000) != 0) {
    goto LABEL_595;
  }
LABEL_568:
  if ((v311 & 0x20000000000) != 0)
  {
LABEL_569:
    v312 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 733)];
    if (a2) {
      v313 = @"isRoutePlanningEditStopFillRequest";
    }
    else {
      v313 = @"is_route_planning_edit_stop_fill_request";
    }
    [v4 setObject:v312 forKey:v313];
  }
LABEL_573:
  if (*(void *)(a1 + 104))
  {
    v314 = PBRepeatedUInt64NSArray();
    if (a2) {
      v315 = @"preferredBrand";
    }
    else {
      v315 = @"preferred_brand";
    }
    [v4 setObject:v314 forKey:v315];
  }
  uint64_t v316 = *(void *)(a1 + v5[25]);
  if ((v316 & 0x100000000000) != 0)
  {
    v317 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 736)];
    if (a2) {
      v318 = @"isWithinHikingBoundary";
    }
    else {
      v318 = @"is_within_hiking_boundary";
    }
    [v4 setObject:v317 forKey:v318];

    uint64_t v316 = *(void *)(a1 + 756);
  }
  if ((v316 & 0x200000000000) != 0)
  {
    v319 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 737)];
    if (a2) {
      v320 = @"isWithinHikingBufferRegion";
    }
    else {
      v320 = @"is_within_hiking_buffer_region";
    }
    [v4 setObject:v319 forKey:v320];
  }
  v321 = [(id)a1 searchImplicitFilterInfo];
  v322 = v321;
  if (v321)
  {
    if (a2)
    {
      v323 = [v321 jsonRepresentation];
      v324 = @"searchImplicitFilterInfo";
    }
    else
    {
      v323 = [v321 dictionaryRepresentation];
      v324 = @"search_implicit_filter_info";
    }
    id v329 = v323;

    [v4 setObject:v329 forKey:v324];
  }

  uint64_t v330 = *(void *)(a1 + v5[25]);
  if ((v330 & 0x1000) != 0)
  {
    uint64_t v331 = *(int *)(a1 + 644);
    if (v331 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 644));
      v332 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v332 = off_1E53E7CF0[v331];
    }
    if (a2) {
      v333 = @"devicePlatform";
    }
    else {
      v333 = @"device_platform";
    }
    [v4 setObject:v332 forKey:v333];

    uint64_t v330 = *(void *)(a1 + v5[25]);
  }
  if ((v330 & 0x1000000000) != 0)
  {
    v334 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 728)];
    if (a2) {
      v335 = @"containsSensitiveData";
    }
    else {
      v335 = @"contains_sensitive_data";
    }
    [v4 setObject:v334 forKey:v335];
  }
  v336 = [(id)a1 spotlightSearchPunchinEncodedString];
  if (v336)
  {
    if (a2) {
      v337 = @"spotlightSearchPunchinEncodedString";
    }
    else {
      v337 = @"spotlight_search_punchin_encoded_string";
    }
    [v4 setObject:v336 forKey:v337];
  }

  if ((*(unsigned char *)(a1 + v5[25] + 5) & 0x80) != 0)
  {
    v338 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 739)];
    if (a2) {
      v339 = @"optimizeSearchRequestComponents";
    }
    else {
      v339 = @"optimize_search_request_components";
    }
    [v4 setObject:v338 forKey:v339];
  }
  v340 = [(id)a1 recentAutocompleteSessionData];
  v341 = v340;
  if (v340)
  {
    if (a2)
    {
      v342 = [v340 jsonRepresentation];
      v343 = @"recentAutocompleteSessionData";
    }
    else
    {
      v342 = [v340 dictionaryRepresentation];
      v343 = @"recent_autocomplete_session_data";
    }
    id v344 = v342;

    [v4 setObject:v344 forKey:v343];
  }

  if (*(unsigned char *)(a1 + v5[25] + 4))
  {
    v345 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 724)];
    if (a2) {
      v346 = @"analyticsOptOut";
    }
    else {
      v346 = @"analytics_opt_out";
    }
    [v4 setObject:v345 forKey:v346];
  }
  v347 = [(id)a1 userActionMetadata];
  v348 = v347;
  if (v347)
  {
    if (a2)
    {
      v349 = [v347 jsonRepresentation];
      v350 = @"userActionMetadata";
    }
    else
    {
      v349 = [v347 dictionaryRepresentation];
      v350 = @"user_action_metadata";
    }
    id v351 = v349;

    [v4 setObject:v351 forKey:v350];
  }

  if ((*(unsigned char *)(a1 + v5[25] + 7) & 0x20) != 0)
  {
    v352 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 753)];
    if (a2) {
      v353 = @"wantsRouteCreationTip";
    }
    else {
      v353 = @"wants_route_creation_tip";
    }
    [v4 setObject:v352 forKey:v353];
  }
  v354 = [(id)a1 hardwareIdentifier];
  if (v354)
  {
    if (a2) {
      v355 = @"hardwareIdentifier";
    }
    else {
      v355 = @"hardware_identifier";
    }
    [v4 setObject:v354 forKey:v355];
  }

  v356 = *(void **)(a1 + 16);
  if (v356)
  {
    v357 = [v356 dictionaryRepresentation];
    v358 = v357;
    if (a2)
    {
      v359 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v357, "count"));
      v364[0] = MEMORY[0x1E4F143A8];
      v364[1] = 3221225472;
      v364[2] = __49__GEOMapServiceTraits__dictionaryRepresentation___block_invoke;
      v364[3] = &unk_1E53D8860;
      id v360 = v359;
      id v365 = v360;
      [v358 enumerateKeysAndObjectsUsingBlock:v364];
      id v361 = v360;

      v358 = v361;
    }
    [v4 setObject:v358 forKey:@"Unknown Fields"];
  }
  id v362 = v4;

LABEL_655:

  return v362;
}

- (id)jsonRepresentation
{
  return -[GEOMapServiceTraits _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEOMapServiceTraits__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOMapServiceTraits)initWithDictionary:(id)a3
{
  return (GEOMapServiceTraits *)-[GEOMapServiceTraits _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v511 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_1047;
  }
  id v6 = (id)[a1 init];

  if (!v6)
  {
    a1 = 0;
    goto LABEL_1047;
  }
  if (a3) {
    id v7 = @"sessionId";
  }
  else {
    id v7 = @"session_id";
  }
  objc_super v8 = [v5 objectForKeyedSubscript:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v495 = 0;
    uint64_t v494 = 0;
    _GEOSessionIDFromDictionaryRepresentation(v8, &v494);
    objc_msgSend(v6, "setSessionId:", v494, v495);
  }

  if (a3) {
    id v9 = @"sequenceNumber";
  }
  else {
    id v9 = @"sequence_number";
  }
  id v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSequenceNumber:", objc_msgSend(v10, "unsignedIntValue"));
  }

  if (a3) {
    v11 = @"appIdentifier";
  }
  else {
    v11 = @"app_identifier";
  }
  uint64_t v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = (void *)[v12 copy];
    [v6 setAppIdentifier:v13];
  }
  if (a3) {
    uint64_t v14 = @"appMajorVersion";
  }
  else {
    uint64_t v14 = @"app_major_version";
  }
  uint64_t v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = (void *)[v15 copy];
    [v6 setAppMajorVersion:v16];
  }
  if (a3) {
    v17 = @"appMinorVersion";
  }
  else {
    v17 = @"app_minor_version";
  }
  uint64_t v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v19 = (void *)[v18 copy];
    [v6 setAppMinorVersion:v19];
  }
  v20 = [v5 objectForKeyedSubscript:@"deviceLocation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = [GEOLocation alloc];
    if (a3) {
      uint64_t v22 = [(GEOLocation *)v21 initWithJSON:v20];
    }
    else {
      uint64_t v22 = [(GEOLocation *)v21 initWithDictionary:v20];
    }
    uint64_t v23 = (void *)v22;
    [v6 setDeviceLocation:v22];
  }
  unint64_t v24 = [v5 objectForKeyedSubscript:@"transportType"];
  objc_opt_class();
  id v432 = v5;
  int v433 = a3;
  if (objc_opt_isKindOfClass())
  {
    long long v492 = 0u;
    long long v493 = 0u;
    long long v490 = 0u;
    long long v491 = 0u;
    v424 = v24;
    id v25 = v24;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v490 objects:v510 count:16];
    if (!v26) {
      goto LABEL_62;
    }
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v491;
    while (1)
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v491 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void **)(*((void *)&v490 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v31 = v30;
          if ([v31 isEqualToString:@"AUTOMOBILE"])
          {
            uint64_t v32 = 0;
          }
          else if ([v31 isEqualToString:@"TRANSIT"])
          {
            uint64_t v32 = 1;
          }
          else if ([v31 isEqualToString:@"WALKING"])
          {
            uint64_t v32 = 2;
          }
          else if ([v31 isEqualToString:@"BICYCLE"])
          {
            uint64_t v32 = 3;
          }
          else if ([v31 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
          {
            uint64_t v32 = 4;
          }
          else if ([v31 isEqualToString:@"FERRY"])
          {
            uint64_t v32 = 5;
          }
          else if ([v31 isEqualToString:@"RIDESHARE"])
          {
            uint64_t v32 = 6;
          }
          else
          {
            uint64_t v32 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v32 = [v30 intValue];
        }
        [v6 addTransportType:v32];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v490 objects:v510 count:16];
      if (!v27)
      {
LABEL_62:

        unint64_t v24 = v424;
        id v5 = v432;
        break;
      }
    }
  }

  uint64_t v33 = [v5 objectForKeyedSubscript:@"mapRegion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v34 = [GEOMapRegion alloc];
    if (a3) {
      uint64_t v35 = [(GEOMapRegion *)v34 initWithJSON:v33];
    }
    else {
      uint64_t v35 = [(GEOMapRegion *)v34 initWithDictionary:v33];
    }
    uint64_t v36 = (void *)v35;
    [v6 setMapRegion:v35];
  }
  if (a3) {
    unint64_t v37 = @"deviceDisplayLanguage";
  }
  else {
    unint64_t v37 = @"device_display_language";
  }
  uint64_t v38 = [v5 objectForKeyedSubscript:v37];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v488 = 0u;
    long long v489 = 0u;
    long long v486 = 0u;
    long long v487 = 0u;
    id v39 = v38;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v486 objects:v509 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v487;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v487 != v42) {
            objc_enumerationMutation(v39);
          }
          uint64_t v44 = *(void **)(*((void *)&v486 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v45 = (void *)[v44 copy];
            [v6 addDeviceDisplayLanguage:v45];
          }
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v486 objects:v509 count:16];
      }
      while (v41);
    }

    a3 = v433;
  }

  if (a3) {
    uint64_t v46 = @"deviceKeyboardLocale";
  }
  else {
    uint64_t v46 = @"device_keyboard_locale";
  }
  id v47 = [v5 objectForKeyedSubscript:v46];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v48 = (void *)[v47 copy];
    [v6 setDeviceKeyboardLocale:v48];
  }
  if (a3) {
    uint64_t v49 = @"deviceSpokenLocale";
  }
  else {
    uint64_t v49 = @"device_spoken_locale";
  }
  id v50 = [v5 objectForKeyedSubscript:v49];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v51 = (void *)[v50 copy];
    [v6 setDeviceSpokenLocale:v51];
  }
  uint64_t v52 = [v5 objectForKeyedSubscript:@"isAPICall"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIsAPICall:", objc_msgSend(v52, "BOOLValue"));
  }

  uint64_t v53 = [v5 objectForKeyedSubscript:@"source"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v54 = v53;
    if ([v54 isEqualToString:@"UNKNOWN_SOURCE"])
    {
      uint64_t v55 = 0;
    }
    else if ([v54 isEqualToString:@"URL"])
    {
      uint64_t v55 = 1;
    }
    else if ([v54 isEqualToString:@"USER"])
    {
      uint64_t v55 = 2;
    }
    else if ([v54 isEqualToString:@"REFINEMENT"])
    {
      uint64_t v55 = 3;
    }
    else if ([v54 isEqualToString:@"SPELLING"])
    {
      uint64_t v55 = 4;
    }
    else if ([v54 isEqualToString:@"HINT_CONTACTS"])
    {
      uint64_t v55 = 5;
    }
    else if ([v54 isEqualToString:@"STARK_USER"])
    {
      uint64_t v55 = 6;
    }
    else if ([v54 isEqualToString:@"HINT_COMPLETION"])
    {
      uint64_t v55 = 7;
    }
    else if ([v54 isEqualToString:@"STARK_HINT_COMPLETION"])
    {
      uint64_t v55 = 8;
    }
    else if ([v54 isEqualToString:@"HINT_HISTORY"])
    {
      uint64_t v55 = 9;
    }
    else if ([v54 isEqualToString:@"STARK_HINT_HISTORY"])
    {
      uint64_t v55 = 10;
    }
    else if ([v54 isEqualToString:@"AUTOCOMPLETE_SEARCH"])
    {
      uint64_t v55 = 11;
    }
    else
    {
      if ([v54 isEqualToString:@"STARK_AUTOCOMPLETE_SEARCH"])
      {
        uint64_t v55 = 12;
      }
      else if ([v54 isEqualToString:@"AUTOCOMPLETE_NAV_FROM"])
      {
        uint64_t v55 = 13;
      }
      else if ([v54 isEqualToString:@"AUTOCOMPLETE_NAV_TO"])
      {
        uint64_t v55 = 14;
      }
      else if ([v54 isEqualToString:@"NAV_FROM"])
      {
        uint64_t v55 = 15;
      }
      else if ([v54 isEqualToString:@"NAV_TO"])
      {
        uint64_t v55 = 16;
      }
      else if ([v54 isEqualToString:@"BOOKMARK_REFRESH"])
      {
        uint64_t v55 = 17;
      }
      else if ([v54 isEqualToString:@"ROUTING"])
      {
        uint64_t v55 = 18;
      }
      else if ([v54 isEqualToString:@"PRELOADER"])
      {
        uint64_t v55 = 19;
      }
      else if ([v54 isEqualToString:@"USER_NO_TYPING"])
      {
        uint64_t v55 = 20;
      }
      else if ([v54 isEqualToString:@"ADD_TO_FAVORITES"])
      {
        uint64_t v55 = 21;
      }
      else if ([v54 isEqualToString:@"ADD_TO_COLLECTION"])
      {
        uint64_t v55 = 22;
      }
      else if ([v54 isEqualToString:@"RAP_HINT_COMPLETION"])
      {
        uint64_t v55 = 23;
      }
      else
      {
        uint64_t v55 = 0;
      }
      id v5 = v432;
      a3 = v433;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_149;
    }
    uint64_t v55 = [v53 intValue];
  }
  [v6 setSource:v55];
LABEL_149:

  id v56 = [v5 objectForKeyedSubscript:@"photoSizes"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v484 = 0u;
    long long v485 = 0u;
    long long v482 = 0u;
    long long v483 = 0u;
    id v57 = v56;
    uint64_t v58 = [v57 countByEnumeratingWithState:&v482 objects:v508 count:16];
    if (v58)
    {
      uint64_t v59 = v58;
      uint64_t v60 = *(void *)v483;
      do
      {
        for (uint64_t k = 0; k != v59; ++k)
        {
          if (*(void *)v483 != v60) {
            objc_enumerationMutation(v57);
          }
          uint64_t v62 = *(void *)(*((void *)&v482 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unsigned int v63 = [GEOTraitsPhotoSize alloc];
            if (v433) {
              uint64_t v64 = [(GEOTraitsPhotoSize *)v63 initWithJSON:v62];
            }
            else {
              uint64_t v64 = [(GEOTraitsPhotoSize *)v63 initWithDictionary:v62];
            }
            long long v65 = (void *)v64;
            [v6 addPhotoSizes:v64];
          }
        }
        uint64_t v59 = [v57 countByEnumeratingWithState:&v482 objects:v508 count:16];
      }
      while (v59);
    }

    id v5 = v432;
    a3 = v433;
  }

  long long v66 = [v5 objectForKeyedSubscript:@"photosCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setPhotosCount:", objc_msgSend(v66, "unsignedIntValue"));
  }

  long long v67 = [v5 objectForKeyedSubscript:@"reviewUserPhotoSizes"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v480 = 0u;
    long long v481 = 0u;
    long long v478 = 0u;
    long long v479 = 0u;
    id v68 = v67;
    uint64_t v69 = [v68 countByEnumeratingWithState:&v478 objects:v507 count:16];
    if (v69)
    {
      uint64_t v70 = v69;
      uint64_t v71 = *(void *)v479;
      do
      {
        for (uint64_t m = 0; m != v70; ++m)
        {
          if (*(void *)v479 != v71) {
            objc_enumerationMutation(v68);
          }
          uint64_t v73 = *(void *)(*((void *)&v478 + 1) + 8 * m);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v74 = [GEOTraitsPhotoSize alloc];
            if (v433) {
              uint64_t v75 = [(GEOTraitsPhotoSize *)v74 initWithJSON:v73];
            }
            else {
              uint64_t v75 = [(GEOTraitsPhotoSize *)v74 initWithDictionary:v73];
            }
            uint64_t v76 = (void *)v75;
            [v6 addReviewUserPhotoSizes:v75];
          }
        }
        uint64_t v70 = [v68 countByEnumeratingWithState:&v478 objects:v507 count:16];
      }
      while (v70);
    }

    id v5 = v432;
    a3 = v433;
  }

  id v77 = [v5 objectForKeyedSubscript:@"reviewUserPhotosCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setReviewUserPhotosCount:", objc_msgSend(v77, "unsignedIntValue"));
  }

  if (a3) {
    v78 = @"timeSinceMapEnteredForeground";
  }
  else {
    v78 = @"time_since_map_entered_foreground";
  }
  id v79 = [v5 objectForKeyedSubscript:v78];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setTimeSinceMapEnteredForeground:", objc_msgSend(v79, "unsignedIntValue"));
  }

  if (a3) {
    uint64_t v80 = @"timeSinceMapViewportChanged";
  }
  else {
    uint64_t v80 = @"time_since_map_viewport_changed";
  }
  uint64_t v81 = [v5 objectForKeyedSubscript:v80];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setTimeSinceMapViewportChanged:", objc_msgSend(v81, "unsignedIntValue"));
  }

  if (a3) {
    v82 = @"carHeadunitInteractionModel";
  }
  else {
    v82 = @"car_headunit_interaction_model";
  }
  uint64_t v83 = [v5 objectForKeyedSubscript:v82];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v84 = v83;
    if ([v84 isEqualToString:@"CAR_HIFI"])
    {
      uint64_t v85 = 1;
    }
    else if ([v84 isEqualToString:@"CAR_LOFI"])
    {
      uint64_t v85 = 2;
    }
    else if ([v84 isEqualToString:@"CAR_PHYSICAL"])
    {
      uint64_t v85 = 3;
    }
    else
    {
      uint64_t v85 = 1;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_206;
    }
    uint64_t v85 = [v83 intValue];
  }
  [v6 setCarHeadunitInteractionModel:v85];
LABEL_206:

  if (a3) {
    v86 = @"carHeadunitManufacturer";
  }
  else {
    v86 = @"car_headunit_manufacturer";
  }
  uint64_t v87 = [v5 objectForKeyedSubscript:v86];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v88 = (void *)[v87 copy];
    [v6 setCarHeadunitManufacturer:v88];
  }
  if (a3) {
    uint64_t v89 = @"carHeadunitModel";
  }
  else {
    uint64_t v89 = @"car_headunit_model";
  }
  id v90 = [v5 objectForKeyedSubscript:v89];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v91 = (void *)[v90 copy];
    [v6 setCarHeadunitModel:v91];
  }
  if (a3) {
    uint64_t v92 = @"carHeadunitPixelWidth";
  }
  else {
    uint64_t v92 = @"car_headunit_pixel_width";
  }
  uint64_t v93 = [v5 objectForKeyedSubscript:v92];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v93 doubleValue];
    objc_msgSend(v6, "setCarHeadunitPixelWidth:");
  }

  if (a3) {
    v94 = @"carHeadunitPixelHeight";
  }
  else {
    v94 = @"car_headunit_pixel_height";
  }
  uint64_t v95 = [v5 objectForKeyedSubscript:v94];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v95 doubleValue];
    objc_msgSend(v6, "setCarHeadunitPixelHeight:");
  }

  if (a3) {
    id v96 = @"transitScheduleFilter";
  }
  else {
    id v96 = @"transit_schedule_filter";
  }
  v97 = [v5 objectForKeyedSubscript:v96];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v98 = [GEOTraitsTransitScheduleFilter alloc];
    if (a3) {
      uint64_t v99 = [(GEOTraitsTransitScheduleFilter *)v98 initWithJSON:v97];
    }
    else {
      uint64_t v99 = [(GEOTraitsTransitScheduleFilter *)v98 initWithDictionary:v97];
    }
    id v100 = (void *)v99;
    [v6 setTransitScheduleFilter:v99];
  }
  if (a3) {
    uint64_t v101 = @"mapZoomLevel";
  }
  else {
    uint64_t v101 = @"map_zoom_level";
  }
  id v102 = [v5 objectForKeyedSubscript:v101];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v102 doubleValue];
    objc_msgSend(v6, "setMapZoomLevel:");
  }

  id v103 = [v5 objectForKeyedSubscript:@"mode"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v104 = v103;
    if ([v104 isEqualToString:@"NONE"])
    {
      uint64_t v105 = 0;
    }
    else if ([v104 isEqualToString:@"STANDARD"])
    {
      uint64_t v105 = 1;
    }
    else if ([v104 isEqualToString:@"SATELLITE"])
    {
      uint64_t v105 = 2;
    }
    else if ([v104 isEqualToString:@"HYBRID"])
    {
      uint64_t v105 = 3;
    }
    else if ([v104 isEqualToString:@"TRANSIT"])
    {
      uint64_t v105 = 4;
    }
    else
    {
      uint64_t v105 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_255;
    }
    uint64_t v105 = [v103 intValue];
  }
  [v6 setMode:v105];
LABEL_255:

  id v106 = [v5 objectForKeyedSubscript:@"displayRegion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v107 = (void *)[v106 copy];
    [v6 setDisplayRegion:v107];
  }
  id v108 = [v5 objectForKeyedSubscript:@"providerID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v109 = (void *)[v108 copy];
    [v6 setProviderID:v109];
  }
  if (a3) {
    uint64_t v110 = @"deviceInterfaceOrientation";
  }
  else {
    uint64_t v110 = @"device_interface_orientation";
  }
  id v111 = [v5 objectForKeyedSubscript:v110];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v112 = v111;
    if ([v112 isEqualToString:@"DEVICE_ORIENTATION_UNKNOWN"])
    {
      uint64_t v113 = 0;
    }
    else if ([v112 isEqualToString:@"DEVICE_ORIENTATION_PORTRAIT"])
    {
      uint64_t v113 = 1;
    }
    else if ([v112 isEqualToString:@"DEVICE_ORIENTATION_PORTRAIT_UPSIDE_DOWN"])
    {
      uint64_t v113 = 2;
    }
    else if ([v112 isEqualToString:@"DEVICE_ORIENTATION_LANDSCAPE_LEFT"])
    {
      uint64_t v113 = 3;
    }
    else if ([v112 isEqualToString:@"DEVICE_ORIENTATION_LANDSCAPE_RIGHT"])
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
      goto LABEL_278;
    }
    uint64_t v113 = [v111 intValue];
  }
  [v6 setDeviceInterfaceOrientation:v113];
LABEL_278:

  if (a3) {
    uint64_t v114 = @"deviceBatteryState";
  }
  else {
    uint64_t v114 = @"device_battery_state";
  }
  v115 = [v5 objectForKeyedSubscript:v114];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v116 = v115;
    if ([v116 isEqualToString:@"DEVICE_BATTERY_STATE_UNKNOWN"])
    {
      uint64_t v117 = 0;
    }
    else if ([v116 isEqualToString:@"DEVICE_BATTERY_STATE_UNPLUGGED"])
    {
      uint64_t v117 = 1;
    }
    else if ([v116 isEqualToString:@"DEVICE_BATTERY_STATE_CHARGING"])
    {
      uint64_t v117 = 2;
    }
    else if ([v116 isEqualToString:@"DEVICE_BATTERY_STATE_FULL"])
    {
      uint64_t v117 = 3;
    }
    else
    {
      uint64_t v117 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_295;
    }
    uint64_t v117 = [v115 intValue];
  }
  [v6 setDeviceBatteryState:v117];
LABEL_295:

  if (a3) {
    id v118 = @"carHeadunitConnectionType";
  }
  else {
    id v118 = @"car_headunit_connection_type";
  }
  v119 = [v5 objectForKeyedSubscript:v118];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v120 = v119;
    if ([v120 isEqualToString:@"CONNECTION_UNKNOWN"])
    {
      uint64_t v121 = 0;
    }
    else if ([v120 isEqualToString:@"CONNECTION_CABLE"])
    {
      uint64_t v121 = 1;
    }
    else if ([v120 isEqualToString:@"CONNECTION_WIRELESS"])
    {
      uint64_t v121 = 2;
    }
    else
    {
      uint64_t v121 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_310;
    }
    uint64_t v121 = [v119 intValue];
  }
  [v6 setCarHeadunitConnectionType:v121];
LABEL_310:

  id v122 = [v5 objectForKeyedSubscript:@"navigating"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setNavigating:", objc_msgSend(v122, "BOOLValue"));
  }

  v123 = [v5 objectForKeyedSubscript:@"historicalLocations"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v476 = 0u;
    long long v477 = 0u;
    long long v474 = 0u;
    long long v475 = 0u;
    id v124 = v123;
    uint64_t v125 = [v124 countByEnumeratingWithState:&v474 objects:v506 count:16];
    if (v125)
    {
      uint64_t v126 = v125;
      uint64_t v127 = *(void *)v475;
      do
      {
        for (uint64_t n = 0; n != v126; ++n)
        {
          if (*(void *)v475 != v127) {
            objc_enumerationMutation(v124);
          }
          uint64_t v129 = *(void *)(*((void *)&v474 + 1) + 8 * n);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v130 = [GEOLocation alloc];
            if (v433) {
              uint64_t v131 = [(GEOLocation *)v130 initWithJSON:v129];
            }
            else {
              uint64_t v131 = [(GEOLocation *)v130 initWithDictionary:v129];
            }
            long long v132 = (void *)v131;
            [v6 addHistoricalLocations:v131];
          }
        }
        uint64_t v126 = [v124 countByEnumeratingWithState:&v474 objects:v506 count:16];
      }
      while (v126);
    }

    id v5 = v432;
    a3 = v433;
  }

  if (a3) {
    long long v133 = @"automobileOptions";
  }
  else {
    long long v133 = @"automobile_options";
  }
  long long v134 = [v5 objectForKeyedSubscript:v133];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v135 = [GEOAutomobileOptions alloc];
    if (a3) {
      uint64_t v136 = [(GEOAutomobileOptions *)v135 initWithJSON:v134];
    }
    else {
      uint64_t v136 = [(GEOAutomobileOptions *)v135 initWithDictionary:v134];
    }
    id v137 = (void *)v136;
    [v6 setAutomobileOptions:v136];
  }
  if (a3) {
    uint64_t v138 = @"transitOptions";
  }
  else {
    uint64_t v138 = @"transit_options";
  }
  long long v139 = [v5 objectForKeyedSubscript:v138];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v140 = [GEOTransitOptions alloc];
    if (a3) {
      uint64_t v141 = [(GEOTransitOptions *)v140 initWithJSON:v139];
    }
    else {
      uint64_t v141 = [(GEOTransitOptions *)v140 initWithDictionary:v139];
    }
    long long v142 = (void *)v141;
    [v6 setTransitOptions:v141];
  }
  if (a3) {
    uint64_t v143 = @"walkingOptions";
  }
  else {
    uint64_t v143 = @"walking_options";
  }
  v144 = [v5 objectForKeyedSubscript:v143];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v145 = [GEOWalkingOptions alloc];
    if (a3) {
      uint64_t v146 = [(GEOWalkingOptions *)v145 initWithJSON:v144];
    }
    else {
      uint64_t v146 = [(GEOWalkingOptions *)v145 initWithDictionary:v144];
    }
    v147 = (void *)v146;
    [v6 setWalkingOptions:v146];
  }
  if (a3) {
    v148 = @"engineType";
  }
  else {
    v148 = @"engine_type";
  }
  uint64_t v149 = [v5 objectForKeyedSubscript:v148];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v472 = 0u;
    long long v473 = 0u;
    long long v470 = 0u;
    long long v471 = 0u;
    v425 = v149;
    id v150 = v149;
    uint64_t v151 = [v150 countByEnumeratingWithState:&v470 objects:v505 count:16];
    if (!v151) {
      goto LABEL_377;
    }
    uint64_t v152 = v151;
    uint64_t v153 = *(void *)v471;
    while (1)
    {
      for (iuint64_t i = 0; ii != v152; ++ii)
      {
        if (*(void *)v471 != v153) {
          objc_enumerationMutation(v150);
        }
        v155 = *(void **)(*((void *)&v470 + 1) + 8 * ii);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v156 = v155;
          if ([v156 isEqualToString:@"CAR_ENGINE_TYPE_UNKNOWN"])
          {
            uint64_t v157 = 0;
          }
          else if ([v156 isEqualToString:@"CAR_ENGINE_TYPE_GASOLINE"])
          {
            uint64_t v157 = 1;
          }
          else if ([v156 isEqualToString:@"CAR_ENGINE_TYPE_DIESEL"])
          {
            uint64_t v157 = 2;
          }
          else if ([v156 isEqualToString:@"CAR_ENGINE_TYPE_ELECTRIC"])
          {
            uint64_t v157 = 3;
          }
          else if ([v156 isEqualToString:@"CAR_ENGINE_TYPE_CNG"])
          {
            uint64_t v157 = 4;
          }
          else
          {
            uint64_t v157 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v157 = [v155 intValue];
        }
        [v6 addEngineType:v157];
      }
      uint64_t v152 = [v150 countByEnumeratingWithState:&v470 objects:v505 count:16];
      if (!v152)
      {
LABEL_377:

        uint64_t v149 = v425;
        id v5 = v432;
        a3 = v433;
        break;
      }
    }
  }

  if (a3) {
    v158 = @"requestMode";
  }
  else {
    v158 = @"request_mode";
  }
  v159 = [v5 objectForKeyedSubscript:v158];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v160 = v159;
    if ([v160 isEqualToString:@"DEFAULT"])
    {
      uint64_t v161 = 0;
    }
    else if ([v160 isEqualToString:@"ONLINE_OFFLINE_FAILOVER"])
    {
      uint64_t v161 = 1;
    }
    else if ([v160 isEqualToString:@"ONLINE_FAST_FAIL"])
    {
      uint64_t v161 = 2;
    }
    else if ([v160 isEqualToString:@"ONLINE_ONLY"])
    {
      uint64_t v161 = 3;
    }
    else if ([v160 isEqualToString:@"OFFLINE_ONLY"])
    {
      uint64_t v161 = 4;
    }
    else
    {
      uint64_t v161 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_397;
    }
    uint64_t v161 = [v159 intValue];
  }
  [v6 setRequestMode:v161];
LABEL_397:

  if (a3) {
    v162 = @"supportDirectionIntentSearch";
  }
  else {
    v162 = @"support_direction_intent_search";
  }
  uint64_t v163 = [v5 objectForKeyedSubscript:v162];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportDirectionIntentSearch:", objc_msgSend(v163, "BOOLValue"));
  }

  if (a3) {
    v164 = @"supportDymSuggestion";
  }
  else {
    v164 = @"support_dym_suggestion";
  }
  v165 = [v5 objectForKeyedSubscript:v164];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportDymSuggestion:", objc_msgSend(v165, "BOOLValue"));
  }

  if (a3) {
    v166 = @"knownClientResolvedType";
  }
  else {
    v166 = @"known_client_resolved_type";
  }
  v167 = [v5 objectForKeyedSubscript:v166];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v468 = 0u;
    long long v469 = 0u;
    long long v466 = 0u;
    long long v467 = 0u;
    v426 = v167;
    id v168 = v167;
    uint64_t v169 = [v168 countByEnumeratingWithState:&v466 objects:v504 count:16];
    if (!v169) {
      goto LABEL_438;
    }
    uint64_t v170 = v169;
    uint64_t v171 = *(void *)v467;
    while (1)
    {
      for (juint64_t j = 0; jj != v170; ++jj)
      {
        if (*(void *)v467 != v171) {
          objc_enumerationMutation(v168);
        }
        v173 = *(void **)(*((void *)&v466 + 1) + 8 * jj);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v174 = v173;
          if ([v174 isEqualToString:@"RESOLVED_ITEM_TYPE_UNKNOWN"])
          {
            uint64_t v175 = 0;
          }
          else if ([v174 isEqualToString:@"RESOLVED_ITEM_TYPE_HOME"])
          {
            uint64_t v175 = 1;
          }
          else if ([v174 isEqualToString:@"RESOLVED_ITEM_TYPE_WORK"])
          {
            uint64_t v175 = 2;
          }
          else if ([v174 isEqualToString:@"RESOLVED_ITEM_TYPE_PARKED_CAR"])
          {
            uint64_t v175 = 3;
          }
          else if ([v174 isEqualToString:@"RESOLVED_ITEM_TYPE_CURRENT_LOCATION"])
          {
            uint64_t v175 = 4;
          }
          else if ([v174 isEqualToString:@"RESOLVED_ITEM_TYPE_SERVER"])
          {
            uint64_t v175 = 5;
          }
          else if ([v174 isEqualToString:@"RESOLVED_ITEM_TYPE_SCHOOL"])
          {
            uint64_t v175 = 6;
          }
          else
          {
            uint64_t v175 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v175 = [v173 intValue];
        }
        [v6 addKnownClientResolvedType:v175];
      }
      uint64_t v170 = [v168 countByEnumeratingWithState:&v466 objects:v504 count:16];
      if (!v170)
      {
LABEL_438:

        v167 = v426;
        id v5 = v432;
        a3 = v433;
        break;
      }
    }
  }

  if (a3) {
    unint64_t v176 = @"wantsBrandIcon";
  }
  else {
    unint64_t v176 = @"wants_brand_icon";
  }
  uint64_t v177 = [v5 objectForKeyedSubscript:v176];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setWantsBrandIcon:", objc_msgSend(v177, "BOOLValue"));
  }

  if (a3) {
    v178 = @"venueIdentifier";
  }
  else {
    v178 = @"venue_identifier";
  }
  v179 = [v5 objectForKeyedSubscript:v178];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v180 = [GEOPDVenueIdentifier alloc];
    if (v180) {
      v181 = (void *)-[GEOPDVenueIdentifier _initWithDictionary:isJSON:]((uint64_t)v180, v179, a3);
    }
    else {
      v181 = 0;
    }
    [v6 setVenueIdentifier:v181];
  }
  if (a3) {
    v182 = @"deviceInVehicle";
  }
  else {
    v182 = @"device_in_vehicle";
  }
  v183 = [v5 objectForKeyedSubscript:v182];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setDeviceInVehicle:", objc_msgSend(v183, "BOOLValue"));
  }

  if (a3) {
    v184 = @"requestPriority";
  }
  else {
    v184 = @"request_priority";
  }
  v185 = [v5 objectForKeyedSubscript:v184];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v186 = v185;
    if ([v186 isEqualToString:@"DEFAULT"])
    {
      uint64_t v187 = 0;
    }
    else if ([v186 isEqualToString:@"BACKGROUND"])
    {
      uint64_t v187 = 1;
    }
    else if ([v186 isEqualToString:@"USER_INITIATED"])
    {
      uint64_t v187 = 2;
    }
    else
    {
      uint64_t v187 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_471;
    }
    uint64_t v187 = [v185 intValue];
  }
  [v6 setRequestPriority:v187];
LABEL_471:

  if (a3) {
    v188 = @"httpRequestPriority";
  }
  else {
    v188 = @"http_request_priority";
  }
  v189 = [v5 objectForKeyedSubscript:v188];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setHttpRequestPriority:", objc_msgSend(v189, "unsignedIntValue"));
  }

  if (a3) {
    v190 = @"analyticsAppIdentifier";
  }
  else {
    v190 = @"analytics_app_identifier";
  }
  unint64_t v191 = [v5 objectForKeyedSubscript:v190];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v192 = (void *)[v191 copy];
    [v6 setAnalyticsAppIdentifier:v192];
  }
  if (a3) {
    v193 = @"sessionRelativeTimestamp";
  }
  else {
    v193 = @"session_relative_timestamp";
  }
  v194 = [v5 objectForKeyedSubscript:v193];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v194 doubleValue];
    objc_msgSend(v6, "setSessionRelativeTimestamp:");
  }

  if (a3) {
    uint64_t v195 = @"supportDirectionIntentAutocomplete";
  }
  else {
    uint64_t v195 = @"support_direction_intent_autocomplete";
  }
  v196 = [v5 objectForKeyedSubscript:v195];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportDirectionIntentAutocomplete:", objc_msgSend(v196, "BOOLValue"));
  }

  if (a3) {
    v197 = @"supportUnresolvedDirectionIntent";
  }
  else {
    v197 = @"support_unresolved_direction_intent";
  }
  v198 = [v5 objectForKeyedSubscript:v197];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportUnresolvedDirectionIntent:", objc_msgSend(v198, "BOOLValue"));
  }

  if (a3) {
    v199 = @"deviceDarkMode";
  }
  else {
    v199 = @"device_dark_mode";
  }
  unint64_t v200 = [v5 objectForKeyedSubscript:v199];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setDeviceDarkMode:", objc_msgSend(v200, "BOOLValue"));
  }

  if (a3) {
    uint64_t v201 = @"appDarkMode";
  }
  else {
    uint64_t v201 = @"app_dark_mode";
  }
  v202 = [v5 objectForKeyedSubscript:v201];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setAppDarkMode:", objc_msgSend(v202, "BOOLValue"));
  }

  if (a3) {
    v203 = @"supportsBrandFallback";
  }
  else {
    v203 = @"supports_brand_fallback";
  }
  uint64_t v204 = [v5 objectForKeyedSubscript:v203];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsBrandFallback:", objc_msgSend(v204, "BOOLValue"));
  }

  if (a3) {
    v205 = @"requestPurpose";
  }
  else {
    v205 = @"request_purpose";
  }
  v206 = [v5 objectForKeyedSubscript:v205];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v207 = v206;
    if ([v207 isEqualToString:@"UNKNOWN"]) {
      uint64_t v208 = 0;
    }
    else {
      uint64_t v208 = [v207 isEqualToString:@"ROUTE_WAYPOINT_RESOLUTION"];
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_522;
    }
    uint64_t v208 = [v206 intValue];
  }
  [v6 setRequestPurpose:v208];
LABEL_522:

  if (a3) {
    v209 = @"supportedAutocompleteListType";
  }
  else {
    v209 = @"supported_autocomplete_list_type";
  }
  v210 = [v5 objectForKeyedSubscript:v209];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v464 = 0u;
    long long v465 = 0u;
    long long v462 = 0u;
    long long v463 = 0u;
    v427 = v210;
    id v211 = v210;
    uint64_t v212 = [v211 countByEnumeratingWithState:&v462 objects:v503 count:16];
    if (!v212) {
      goto LABEL_545;
    }
    uint64_t v213 = v212;
    uint64_t v214 = *(void *)v463;
    while (1)
    {
      for (kuint64_t k = 0; kk != v213; ++kk)
      {
        if (*(void *)v463 != v214) {
          objc_enumerationMutation(v211);
        }
        v216 = *(void **)(*((void *)&v462 + 1) + 8 * kk);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v217 = v216;
          if ([v217 isEqualToString:@"UNKNOWN"])
          {
            uint64_t v218 = 0;
          }
          else if ([v217 isEqualToString:@"INTERLEAVED"])
          {
            uint64_t v218 = 1;
          }
          else if ([v217 isEqualToString:@"SECTION_ONLY_FOR_QUERY"])
          {
            uint64_t v218 = 2;
          }
          else
          {
            uint64_t v218 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v218 = [v216 intValue];
        }
        [v6 addSupportedAutocompleteListType:v218];
      }
      uint64_t v213 = [v211 countByEnumeratingWithState:&v462 objects:v503 count:16];
      if (!v213)
      {
LABEL_545:

        v210 = v427;
        id v5 = v432;
        a3 = v433;
        break;
      }
    }
  }

  if (a3) {
    id v219 = @"isSettlement";
  }
  else {
    id v219 = @"is_settlement";
  }
  uint64_t v220 = [v5 objectForKeyedSubscript:v219];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIsSettlement:", objc_msgSend(v220, "BOOLValue"));
  }

  if (a3) {
    uint64_t v221 = @"transitTripStopTimeFilter";
  }
  else {
    uint64_t v221 = @"transit_trip_stop_time_filter";
  }
  uint64_t v222 = [v5 objectForKeyedSubscript:v221];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v223 = [GEOTraitsTransitScheduleFilter alloc];
    if (a3) {
      uint64_t v224 = [(GEOTraitsTransitScheduleFilter *)v223 initWithJSON:v222];
    }
    else {
      uint64_t v224 = [(GEOTraitsTransitScheduleFilter *)v223 initWithDictionary:v222];
    }
    id v225 = (void *)v224;
    [v6 setTransitTripStopTimeFilter:v224];
  }
  if (a3) {
    v226 = @"supportClientRankingFeatureMetadata";
  }
  else {
    v226 = @"support_client_ranking_feature_metadata";
  }
  v227 = [v5 objectForKeyedSubscript:v226];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportClientRankingFeatureMetadata:", objc_msgSend(v227, "BOOLValue"));
  }

  if (a3) {
    v228 = @"supportedChildAction";
  }
  else {
    v228 = @"supported_child_action";
  }
  v229 = [v5 objectForKeyedSubscript:v228];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v460 = 0u;
    long long v461 = 0u;
    long long v458 = 0u;
    long long v459 = 0u;
    v428 = v229;
    id v230 = v229;
    uint64_t v231 = [v230 countByEnumeratingWithState:&v458 objects:v502 count:16];
    if (!v231) {
      goto LABEL_599;
    }
    uint64_t v232 = v231;
    uint64_t v233 = *(void *)v459;
    while (1)
    {
      for (muint64_t m = 0; mm != v232; ++mm)
      {
        if (*(void *)v459 != v233) {
          objc_enumerationMutation(v230);
        }
        uint64_t v235 = *(void **)(*((void *)&v458 + 1) + 8 * mm);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v236 = v235;
          if ([v236 isEqualToString:@"UNKNOWN"])
          {
            uint64_t v237 = 0;
          }
          else if ([v236 isEqualToString:@"DIRECTIONS"])
          {
            uint64_t v237 = 1;
          }
          else if ([v236 isEqualToString:@"FLYOVER"])
          {
            uint64_t v237 = 2;
          }
          else if ([v236 isEqualToString:@"SEARCH"])
          {
            uint64_t v237 = 3;
          }
          else if ([v236 isEqualToString:@"LOOK_AROUND"])
          {
            uint64_t v237 = 4;
          }
          else if ([v236 isEqualToString:@"CALL"])
          {
            uint64_t v237 = 5;
          }
          else if ([v236 isEqualToString:@"WEBSITE"])
          {
            uint64_t v237 = 6;
          }
          else if ([v236 isEqualToString:@"GUIDES"])
          {
            uint64_t v237 = 7;
          }
          else if ([v236 isEqualToString:@"DOWNLOAD_OFFLINE_MAP"])
          {
            uint64_t v237 = 8;
          }
          else
          {
            uint64_t v237 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v237 = [v235 intValue];
        }
        [v6 addSupportedChildAction:v237];
      }
      uint64_t v232 = [v230 countByEnumeratingWithState:&v458 objects:v502 count:16];
      if (!v232)
      {
LABEL_599:

        v229 = v428;
        id v5 = v432;
        a3 = v433;
        break;
      }
    }
  }

  if (a3) {
    v238 = @"supportChildItems";
  }
  else {
    v238 = @"support_child_items";
  }
  v239 = [v5 objectForKeyedSubscript:v238];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportChildItems:", objc_msgSend(v239, "BOOLValue"));
  }

  if (a3) {
    unint64_t v240 = @"isRefund";
  }
  else {
    unint64_t v240 = @"is_refund";
  }
  uint64_t v241 = [v5 objectForKeyedSubscript:v240];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIsRefund:", objc_msgSend(v241, "BOOLValue"));
  }

  if (a3) {
    v242 = @"autocompleteRequestSupportsSectionHeader";
  }
  else {
    v242 = @"autocomplete_request_supports_section_header";
  }
  v243 = [v5 objectForKeyedSubscript:v242];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setAutocompleteRequestSupportsSectionHeader:", objc_msgSend(v243, "BOOLValue"));
  }

  if (a3) {
    uint64_t v244 = @"supportedAutocompleteResultCellType";
  }
  else {
    uint64_t v244 = @"supported_autocomplete_result_cell_type";
  }
  v245 = [v5 objectForKeyedSubscript:v244];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v456 = 0u;
    long long v457 = 0u;
    long long v454 = 0u;
    long long v455 = 0u;
    v429 = v245;
    id v246 = v245;
    uint64_t v247 = [v246 countByEnumeratingWithState:&v454 objects:v501 count:16];
    if (!v247) {
      goto LABEL_642;
    }
    uint64_t v248 = v247;
    uint64_t v249 = *(void *)v455;
    while (1)
    {
      for (nuint64_t n = 0; nn != v248; ++nn)
      {
        if (*(void *)v455 != v249) {
          objc_enumerationMutation(v246);
        }
        v251 = *(void **)(*((void *)&v454 + 1) + 8 * nn);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v252 = v251;
          if ([v252 isEqualToString:@"DEFAULT"])
          {
            uint64_t v253 = 0;
          }
          else if ([v252 isEqualToString:@"PROMINENT_QUERY"])
          {
            uint64_t v253 = 1;
          }
          else if ([v252 isEqualToString:@"PROMINENT_RESULT"])
          {
            uint64_t v253 = 2;
          }
          else if ([v252 isEqualToString:@"TWO_LINE"])
          {
            uint64_t v253 = 3;
          }
          else if ([v252 isEqualToString:@"PROMINENT_RESULT_TWO_LINE"])
          {
            uint64_t v253 = 4;
          }
          else
          {
            uint64_t v253 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v253 = [v251 intValue];
        }
        [v6 addSupportedAutocompleteResultCellType:v253];
      }
      uint64_t v248 = [v246 countByEnumeratingWithState:&v454 objects:v501 count:16];
      if (!v248)
      {
LABEL_642:

        v245 = v429;
        id v5 = v432;
        a3 = v433;
        break;
      }
    }
  }

  if (a3) {
    v254 = @"navigationTransportType";
  }
  else {
    v254 = @"navigation_transport_type";
  }
  v255 = [v5 objectForKeyedSubscript:v254];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v256 = v255;
    if ([v256 isEqualToString:@"AUTOMOBILE"])
    {
      uint64_t v257 = 0;
    }
    else if ([v256 isEqualToString:@"TRANSIT"])
    {
      uint64_t v257 = 1;
    }
    else if ([v256 isEqualToString:@"WALKING"])
    {
      uint64_t v257 = 2;
    }
    else if ([v256 isEqualToString:@"BICYCLE"])
    {
      uint64_t v257 = 3;
    }
    else if ([v256 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
    {
      uint64_t v257 = 4;
    }
    else if ([v256 isEqualToString:@"FERRY"])
    {
      uint64_t v257 = 5;
    }
    else if ([v256 isEqualToString:@"RIDESHARE"])
    {
      uint64_t v257 = 6;
    }
    else
    {
      uint64_t v257 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_666;
    }
    uint64_t v257 = [v255 intValue];
  }
  [v6 setNavigationTransportType:v257];
LABEL_666:

  if (a3) {
    v258 = @"cyclingOptions";
  }
  else {
    v258 = @"cycling_options";
  }
  v259 = [v5 objectForKeyedSubscript:v258];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v260 = [GEOCyclingOptions alloc];
    if (a3) {
      uint64_t v261 = [(GEOCyclingOptions *)v260 initWithJSON:v259];
    }
    else {
      uint64_t v261 = [(GEOCyclingOptions *)v260 initWithDictionary:v259];
    }
    v262 = (void *)v261;
    [v6 setCyclingOptions:v261];
  }
  if (a3) {
    v263 = @"ratingsCount";
  }
  else {
    v263 = @"ratings_count";
  }
  id v264 = [v5 objectForKeyedSubscript:v263];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setRatingsCount:", objc_msgSend(v264, "unsignedIntValue"));
  }

  if (a3) {
    uint64_t v265 = @"evChargingPort";
  }
  else {
    uint64_t v265 = @"ev_charging_port";
  }
  v266 = [v5 objectForKeyedSubscript:v265];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v452 = 0u;
    long long v453 = 0u;
    long long v450 = 0u;
    long long v451 = 0u;
    id v267 = v266;
    uint64_t v268 = [v267 countByEnumeratingWithState:&v450 objects:v500 count:16];
    if (v268)
    {
      uint64_t v269 = v268;
      uint64_t v270 = *(void *)v451;
      do
      {
        for (uint64_t i1 = 0; i1 != v269; ++i1)
        {
          if (*(void *)v451 != v270) {
            objc_enumerationMutation(v267);
          }
          uint64_t v272 = *(void *)(*((void *)&v450 + 1) + 8 * i1);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v273 = [GEOPDEvChargingPort alloc];
            if (v433) {
              uint64_t v274 = [(GEOPDEvChargingPort *)v273 initWithJSON:v272];
            }
            else {
              uint64_t v274 = [(GEOPDEvChargingPort *)v273 initWithDictionary:v272];
            }
            uint64_t v275 = (void *)v274;
            [v6 addEvChargingPort:v274];
          }
        }
        uint64_t v269 = [v267 countByEnumeratingWithState:&v450 objects:v500 count:16];
      }
      while (v269);
    }

    id v5 = v432;
    a3 = v433;
  }

  if (a3) {
    v276 = @"isWidgetRequest";
  }
  else {
    v276 = @"is_widget_request";
  }
  v277 = [v5 objectForKeyedSubscript:v276];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIsWidgetRequest:", objc_msgSend(v277, "BOOLValue"));
  }

  if (a3) {
    uint64_t v278 = @"supportedSearchTierType";
  }
  else {
    uint64_t v278 = @"supported_search_tier_type";
  }
  v279 = [v5 objectForKeyedSubscript:v278];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v448 = 0u;
    long long v449 = 0u;
    long long v446 = 0u;
    long long v447 = 0u;
    v430 = v279;
    id v280 = v279;
    uint64_t v281 = [v280 countByEnumeratingWithState:&v446 objects:v499 count:16];
    if (!v281) {
      goto LABEL_724;
    }
    uint64_t v282 = v281;
    uint64_t v283 = *(void *)v447;
    while (1)
    {
      for (uint64_t i2 = 0; i2 != v282; ++i2)
      {
        if (*(void *)v447 != v283) {
          objc_enumerationMutation(v280);
        }
        id v285 = *(void **)(*((void *)&v446 + 1) + 8 * i2);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v286 = v285;
          if ([v286 isEqualToString:@"UNKNOWN"])
          {
            uint64_t v287 = 0;
          }
          else if ([v286 isEqualToString:@"PRIMARY"])
          {
            uint64_t v287 = 1;
          }
          else if ([v286 isEqualToString:@"AUXILIARY"])
          {
            uint64_t v287 = 2;
          }
          else
          {
            uint64_t v287 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v287 = [v285 intValue];
        }
        [v6 addSupportedSearchTierType:v287];
      }
      uint64_t v282 = [v280 countByEnumeratingWithState:&v446 objects:v499 count:16];
      if (!v282)
      {
LABEL_724:

        v279 = v430;
        id v5 = v432;
        a3 = v433;
        break;
      }
    }
  }

  if (a3) {
    v288 = @"auxiliaryTierNumResults";
  }
  else {
    v288 = @"auxiliary_tier_num_results";
  }
  v289 = [v5 objectForKeyedSubscript:v288];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setAuxiliaryTierNumResults:", objc_msgSend(v289, "unsignedIntValue"));
  }

  if (a3) {
    v290 = @"placeSummaryRevision";
  }
  else {
    v290 = @"place_summary_revision";
  }
  v291 = [v5 objectForKeyedSubscript:v290];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setPlaceSummaryRevision:", objc_msgSend(v291, "unsignedIntValue"));
  }

  if (a3) {
    v292 = @"isTourist";
  }
  else {
    v292 = @"is_tourist";
  }
  id v293 = [v5 objectForKeyedSubscript:v292];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v293 doubleValue];
    objc_msgSend(v6, "setIsTourist:");
  }

  if (a3) {
    v294 = @"knownRefinementType";
  }
  else {
    v294 = @"known_refinement_type";
  }
  v295 = [v5 objectForKeyedSubscript:v294];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v444 = 0u;
    long long v445 = 0u;
    long long v442 = 0u;
    long long v443 = 0u;
    id v296 = v295;
    uint64_t v297 = [v296 countByEnumeratingWithState:&v442 objects:v498 count:16];
    if (!v297) {
      goto LABEL_769;
    }
    uint64_t v298 = v297;
    uint64_t v299 = *(void *)v443;
    while (1)
    {
      for (uint64_t i3 = 0; i3 != v298; ++i3)
      {
        if (*(void *)v443 != v299) {
          objc_enumerationMutation(v296);
        }
        v301 = *(void **)(*((void *)&v442 + 1) + 8 * i3);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v302 = v301;
          if ([v302 isEqualToString:@"UNKNOWN"])
          {
            uint64_t v303 = 0;
          }
          else if ([v302 isEqualToString:@"TOGGLE"])
          {
            uint64_t v303 = 1;
          }
          else if ([v302 isEqualToString:@"RANGE"])
          {
            uint64_t v303 = 2;
          }
          else if ([v302 isEqualToString:@"MULTI_SELECT"])
          {
            uint64_t v303 = 3;
          }
          else if ([v302 isEqualToString:@"SORT"])
          {
            uint64_t v303 = 4;
          }
          else if ([v302 isEqualToString:@"OPEN_OPTIONS"])
          {
            uint64_t v303 = 5;
          }
          else
          {
            uint64_t v303 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v303 = [v301 intValue];
        }
        [v6 addKnownRefinementType:v303];
      }
      uint64_t v298 = [v296 countByEnumeratingWithState:&v442 objects:v498 count:16];
      if (!v298)
      {
LABEL_769:

        id v5 = v432;
        a3 = v433;
        break;
      }
    }
  }

  if (a3) {
    v304 = @"supportAutocompletePublisherResults";
  }
  else {
    v304 = @"support_autocomplete_publisher_results";
  }
  v305 = [v5 objectForKeyedSubscript:v304];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportAutocompletePublisherResults:", objc_msgSend(v305, "BOOLValue"));
  }

  if (a3) {
    v306 = @"supportAutocompleteGuideResults";
  }
  else {
    v306 = @"support_autocomplete_guide_results";
  }
  v307 = [v5 objectForKeyedSubscript:v306];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportAutocompleteGuideResults:", objc_msgSend(v307, "BOOLValue"));
  }

  if (a3) {
    v308 = @"previousSearchViewport";
  }
  else {
    v308 = @"previous_search_viewport";
  }
  v309 = [v5 objectForKeyedSubscript:v308];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v310 = [GEOPDViewportInfo alloc];
    if (a3) {
      uint64_t v311 = [(GEOPDViewportInfo *)v310 initWithJSON:v309];
    }
    else {
      uint64_t v311 = [(GEOPDViewportInfo *)v310 initWithDictionary:v309];
    }
    v312 = (void *)v311;
    [v6 setPreviousSearchViewport:v311];
  }
  if (a3) {
    v313 = @"photoAlbumCount";
  }
  else {
    v313 = @"photo_album_count";
  }
  v314 = [v5 objectForKeyedSubscript:v313];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setPhotoAlbumCount:", objc_msgSend(v314, "unsignedIntValue"));
  }

  if (a3) {
    v315 = @"resultRefinementQuery";
  }
  else {
    v315 = @"result_refinement_query";
  }
  uint64_t v316 = [v5 objectForKeyedSubscript:v315];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v317 = [GEOPDResultRefinementQuery alloc];
    if (a3) {
      uint64_t v318 = [(GEOPDResultRefinementQuery *)v317 initWithJSON:v316];
    }
    else {
      uint64_t v318 = [(GEOPDResultRefinementQuery *)v317 initWithDictionary:v316];
    }
    v319 = (void *)v318;
    [v6 setResultRefinementQuery:v318];
  }
  if (a3) {
    v320 = @"relatedPlaceItemCount";
  }
  else {
    v320 = @"related_place_item_count";
  }
  v321 = [v5 objectForKeyedSubscript:v320];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setRelatedPlaceItemCount:", objc_msgSend(v321, "unsignedIntValue"));
  }

  v322 = [v5 objectForKeyedSubscript:@"searchRequestType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v323 = v322;
    if ([v323 isEqualToString:@"DEFAULT"])
    {
      uint64_t v324 = 0;
    }
    else if ([v323 isEqualToString:@"REDO"])
    {
      uint64_t v324 = 1;
    }
    else if ([v323 isEqualToString:@"AUTO_REDO"])
    {
      uint64_t v324 = 2;
    }
    else if ([v323 isEqualToString:@"BEACHES"])
    {
      uint64_t v324 = 3;
    }
    else
    {
      uint64_t v324 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_820;
    }
    uint64_t v324 = [v322 intValue];
  }
  [v6 setSearchRequestType:v324];
LABEL_820:

  if (a3) {
    v325 = @"currentLocaleCurrencySymbol";
  }
  else {
    v325 = @"current_locale_currency_symbol";
  }
  v326 = [v5 objectForKeyedSubscript:v325];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v327 = (void *)[v326 copy];
    [v6 setCurrentLocaleCurrencySymbol:v327];
  }
  if (a3) {
    v328 = @"supportedPlaceSummaryFormatType";
  }
  else {
    v328 = @"supported_place_summary_format_type";
  }
  id v329 = [v5 objectForKeyedSubscript:v328];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v440 = 0u;
    long long v441 = 0u;
    long long v438 = 0u;
    long long v439 = 0u;
    v431 = v329;
    id v330 = v329;
    uint64_t v331 = [v330 countByEnumeratingWithState:&v438 objects:v497 count:16];
    if (!v331) {
      goto LABEL_852;
    }
    uint64_t v332 = v331;
    uint64_t v333 = *(void *)v439;
    while (1)
    {
      for (uint64_t i4 = 0; i4 != v332; ++i4)
      {
        if (*(void *)v439 != v333) {
          objc_enumerationMutation(v330);
        }
        v335 = *(void **)(*((void *)&v438 + 1) + 8 * i4);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v336 = v335;
          if ([v336 isEqualToString:@"UNKNOWN"])
          {
            uint64_t v337 = 0;
          }
          else if ([v336 isEqualToString:@"BOLD"])
          {
            uint64_t v337 = 1;
          }
          else if ([v336 isEqualToString:@"ITALICS"])
          {
            uint64_t v337 = 2;
          }
          else if ([v336 isEqualToString:@"STRIKETHROUGH"])
          {
            uint64_t v337 = 3;
          }
          else if ([v336 isEqualToString:@"TAPPABLE_ENTITY"])
          {
            uint64_t v337 = 4;
          }
          else
          {
            uint64_t v337 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v337 = [v335 intValue];
        }
        [v6 addSupportedPlaceSummaryFormatType:v337];
      }
      uint64_t v332 = [v330 countByEnumeratingWithState:&v438 objects:v497 count:16];
      if (!v332)
      {
LABEL_852:

        id v329 = v431;
        id v5 = v432;
        a3 = v433;
        break;
      }
    }
  }

  if (a3) {
    v338 = @"autocompleteOriginationType";
  }
  else {
    v338 = @"autocomplete_origination_type";
  }
  v339 = [v5 objectForKeyedSubscript:v338];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v340 = v339;
    if ([v340 isEqualToString:@"DEFAULT"])
    {
      uint64_t v341 = 0;
    }
    else if ([v340 isEqualToString:@"ROUTE_PLANNING"])
    {
      uint64_t v341 = 1;
    }
    else if ([v340 isEqualToString:@"SEARCH_ALONG_ROUTE"])
    {
      uint64_t v341 = 2;
    }
    else if ([v340 isEqualToString:@"ADD_FAVORITES"])
    {
      uint64_t v341 = 3;
    }
    else
    {
      uint64_t v341 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_870;
    }
    uint64_t v341 = [v339 intValue];
  }
  [v6 setAutocompleteOriginationType:v341];
LABEL_870:

  if (a3) {
    v342 = @"autocompleteOriginationPreviousLatlng";
  }
  else {
    v342 = @"autocomplete_origination_previous_latlng";
  }
  v343 = [v5 objectForKeyedSubscript:v342];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v344 = [GEOLatLng alloc];
    if (a3) {
      uint64_t v345 = [(GEOLatLng *)v344 initWithJSON:v343];
    }
    else {
      uint64_t v345 = [(GEOLatLng *)v344 initWithDictionary:v343];
    }
    v346 = (void *)v345;
    [v6 setAutocompleteOriginationPreviousLatlng:v345];
  }
  if (a3) {
    v347 = @"searchOriginationType";
  }
  else {
    v347 = @"search_origination_type";
  }
  v348 = [v5 objectForKeyedSubscript:v347];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v349 = v348;
    if ([v349 isEqualToString:@"DEFAULT"])
    {
      uint64_t v350 = 0;
    }
    else if ([v349 isEqualToString:@"ROUTE_PLANNING"])
    {
      uint64_t v350 = 1;
    }
    else if ([v349 isEqualToString:@"SEARCH_ALONG_ROUTE"])
    {
      uint64_t v350 = 2;
    }
    else if ([v349 isEqualToString:@"IMPLICIT"])
    {
      uint64_t v350 = 3;
    }
    else
    {
      uint64_t v350 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_895;
    }
    uint64_t v350 = [v348 intValue];
  }
  [v6 setSearchOriginationType:v350];
LABEL_895:

  if (a3) {
    id v351 = @"searchOriginationPreviousLatlng";
  }
  else {
    id v351 = @"search_origination_previous_latlng";
  }
  v352 = [v5 objectForKeyedSubscript:v351];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v353 = [GEOLatLng alloc];
    if (a3) {
      uint64_t v354 = [(GEOLatLng *)v353 initWithJSON:v352];
    }
    else {
      uint64_t v354 = [(GEOLatLng *)v353 initWithDictionary:v352];
    }
    v355 = (void *)v354;
    [v6 setSearchOriginationPreviousLatlng:v354];
  }
  if (a3) {
    v356 = @"addStopRouteInfo";
  }
  else {
    v356 = @"add_stop_route_info";
  }
  v357 = [v5 objectForKeyedSubscript:v356];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v358 = [GEOAddStopRouteInfo alloc];
    if (a3) {
      uint64_t v359 = [(GEOAddStopRouteInfo *)v358 initWithJSON:v357];
    }
    else {
      uint64_t v359 = [(GEOAddStopRouteInfo *)v358 initWithDictionary:v357];
    }
    id v360 = (void *)v359;
    [v6 setAddStopRouteInfo:v359];
  }
  if (a3) {
    id v361 = @"autocompleteOriginationEditingServerWaypoints";
  }
  else {
    id v361 = @"autocomplete_origination_editing_server_waypoints";
  }
  id v362 = [v5 objectForKeyedSubscript:v361];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setAutocompleteOriginationEditingServerWaypoints:", objc_msgSend(v362, "BOOLValue"));
  }

  if (a3) {
    v363 = @"searchOriginationEditingServerWaypoints";
  }
  else {
    v363 = @"search_origination_editing_server_waypoints";
  }
  v364 = [v5 objectForKeyedSubscript:v363];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSearchOriginationEditingServerWaypoints:", objc_msgSend(v364, "BOOLValue"));
  }

  if (a3) {
    id v365 = @"supportClientRankingCompositeFeatures";
  }
  else {
    id v365 = @"support_client_ranking_composite_features";
  }
  long long v366 = [v5 objectForKeyedSubscript:v365];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportClientRankingCompositeFeatures:", objc_msgSend(v366, "BOOLValue"));
  }

  if (a3) {
    long long v367 = @"privacyMetadata";
  }
  else {
    long long v367 = @"privacy_metadata";
  }
  long long v368 = [v5 objectForKeyedSubscript:v367];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v369 = [GEOPrivacyMetadata alloc];
    if (a3) {
      uint64_t v370 = [(GEOPrivacyMetadata *)v369 initWithJSON:v368];
    }
    else {
      uint64_t v370 = [(GEOPrivacyMetadata *)v369 initWithDictionary:v368];
    }
    long long v371 = (void *)v370;
    [v6 setPrivacyMetadata:v370];
  }
  if (a3) {
    long long v372 = @"routeStopCount";
  }
  else {
    long long v372 = @"route_stop_count";
  }
  long long v373 = [v5 objectForKeyedSubscript:v372];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setRouteStopCount:", objc_msgSend(v373, "unsignedIntValue"));
  }

  if (a3) {
    long long v374 = @"supportStructuredRapAffordance";
  }
  else {
    long long v374 = @"support_structured_rap_affordance";
  }
  long long v375 = [v5 objectForKeyedSubscript:v374];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportStructuredRapAffordance:", objc_msgSend(v375, "BOOLValue"));
  }

  if (a3) {
    long long v376 = @"isRoutePlanningEditStopFillRequest";
  }
  else {
    long long v376 = @"is_route_planning_edit_stop_fill_request";
  }
  long long v377 = [v5 objectForKeyedSubscript:v376];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIsRoutePlanningEditStopFillRequest:", objc_msgSend(v377, "BOOLValue"));
  }

  if (a3) {
    long long v378 = @"preferredBrand";
  }
  else {
    long long v378 = @"preferred_brand";
  }
  long long v379 = [v5 objectForKeyedSubscript:v378];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v436 = 0u;
    long long v437 = 0u;
    long long v434 = 0u;
    long long v435 = 0u;
    id v380 = v379;
    uint64_t v381 = [v380 countByEnumeratingWithState:&v434 objects:v496 count:16];
    if (v381)
    {
      uint64_t v382 = v381;
      uint64_t v383 = *(void *)v435;
      do
      {
        for (uint64_t i5 = 0; i5 != v382; ++i5)
        {
          if (*(void *)v435 != v383) {
            objc_enumerationMutation(v380);
          }
          v385 = *(void **)(*((void *)&v434 + 1) + 8 * i5);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v6, "addPreferredBrand:", objc_msgSend(v385, "unsignedLongLongValue"));
          }
        }
        uint64_t v382 = [v380 countByEnumeratingWithState:&v434 objects:v496 count:16];
      }
      while (v382);
    }

    a3 = v433;
  }

  if (a3) {
    uint64_t v386 = @"isWithinHikingBoundary";
  }
  else {
    uint64_t v386 = @"is_within_hiking_boundary";
  }
  v387 = [v5 objectForKeyedSubscript:v386];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIsWithinHikingBoundary:", objc_msgSend(v387, "BOOLValue"));
  }

  if (a3) {
    v388 = @"isWithinHikingBufferRegion";
  }
  else {
    v388 = @"is_within_hiking_buffer_region";
  }
  v389 = [v5 objectForKeyedSubscript:v388];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIsWithinHikingBufferRegion:", objc_msgSend(v389, "BOOLValue"));
  }

  if (a3) {
    v390 = @"searchImplicitFilterInfo";
  }
  else {
    v390 = @"search_implicit_filter_info";
  }
  v391 = [v5 objectForKeyedSubscript:v390];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v392 = [GEOSearchImplicitFilterInfo alloc];
    if (a3) {
      uint64_t v393 = [(GEOSearchImplicitFilterInfo *)v392 initWithJSON:v391];
    }
    else {
      uint64_t v393 = [(GEOSearchImplicitFilterInfo *)v392 initWithDictionary:v391];
    }
    v394 = (void *)v393;
    [v6 setSearchImplicitFilterInfo:v393];
  }
  if (a3) {
    v395 = @"devicePlatform";
  }
  else {
    v395 = @"device_platform";
  }
  v396 = [v5 objectForKeyedSubscript:v395];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v397 = v396;
    if ([v397 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v398 = 0;
    }
    else if ([v397 isEqualToString:@"IOS"])
    {
      uint64_t v398 = 1;
    }
    else if ([v397 isEqualToString:@"MACOS"])
    {
      uint64_t v398 = 2;
    }
    else if ([v397 isEqualToString:@"TVOS"])
    {
      uint64_t v398 = 3;
    }
    else if ([v397 isEqualToString:@"WATCHOS"])
    {
      uint64_t v398 = 4;
    }
    else
    {
      uint64_t v398 = 0;
    }

    goto LABEL_999;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v398 = [v396 intValue];
LABEL_999:
    [v6 setDevicePlatform:v398];
  }

  if (a3) {
    v399 = @"containsSensitiveData";
  }
  else {
    v399 = @"contains_sensitive_data";
  }
  v400 = [v5 objectForKeyedSubscript:v399];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setContainsSensitiveData:", objc_msgSend(v400, "BOOLValue"));
  }

  if (a3) {
    v401 = @"spotlightSearchPunchinEncodedString";
  }
  else {
    v401 = @"spotlight_search_punchin_encoded_string";
  }
  v402 = [v5 objectForKeyedSubscript:v401];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v403 = (void *)[v402 copy];
    [v6 setSpotlightSearchPunchinEncodedString:v403];
  }
  if (a3) {
    v404 = @"optimizeSearchRequestComponents";
  }
  else {
    v404 = @"optimize_search_request_components";
  }
  v405 = [v5 objectForKeyedSubscript:v404];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setOptimizeSearchRequestComponents:", objc_msgSend(v405, "BOOLValue"));
  }

  if (a3) {
    v406 = @"recentAutocompleteSessionData";
  }
  else {
    v406 = @"recent_autocomplete_session_data";
  }
  v407 = [v5 objectForKeyedSubscript:v406];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v408 = [GEOPDAutocompleteSessionData alloc];
    if (a3) {
      uint64_t v409 = [(GEOPDAutocompleteSessionData *)v408 initWithJSON:v407];
    }
    else {
      uint64_t v409 = [(GEOPDAutocompleteSessionData *)v408 initWithDictionary:v407];
    }
    v410 = (void *)v409;
    [v6 setRecentAutocompleteSessionData:v409];
  }
  if (a3) {
    v411 = @"analyticsOptOut";
  }
  else {
    v411 = @"analytics_opt_out";
  }
  v412 = [v5 objectForKeyedSubscript:v411];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setAnalyticsOptOut:", objc_msgSend(v412, "BOOLValue"));
  }

  if (a3) {
    v413 = @"userActionMetadata";
  }
  else {
    v413 = @"user_action_metadata";
  }
  v414 = [v5 objectForKeyedSubscript:v413];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v415 = [GEOPDSSessionUserActionMetadata alloc];
    if (a3) {
      uint64_t v416 = [(GEOPDSSessionUserActionMetadata *)v415 initWithJSON:v414];
    }
    else {
      uint64_t v416 = [(GEOPDSSessionUserActionMetadata *)v415 initWithDictionary:v414];
    }
    v417 = (void *)v416;
    [v6 setUserActionMetadata:v416];
  }
  if (a3) {
    v418 = @"wantsRouteCreationTip";
  }
  else {
    v418 = @"wants_route_creation_tip";
  }
  v419 = [v5 objectForKeyedSubscript:v418];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setWantsRouteCreationTip:", objc_msgSend(v419, "BOOLValue"));
  }

  if (a3) {
    v420 = @"hardwareIdentifier";
  }
  else {
    v420 = @"hardware_identifier";
  }
  v421 = [v5 objectForKeyedSubscript:v420];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v422 = (void *)[v421 copy];
    [v6 setHardwareIdentifier:v422];
  }
  a1 = v6;

LABEL_1047:
  return a1;
}

- (GEOMapServiceTraits)initWithJSON:(id)a3
{
  return (GEOMapServiceTraits *)-[GEOMapServiceTraits _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapServiceTraitsIsValid((char *)a3);
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  -[GEOMapServiceTraits _readAutocompleteOriginationPreviousLatlng]((uint64_t)self);
  if ([(GEOLatLng *)self->_autocompleteOriginationPreviousLatlng hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOMapServiceTraits _readDeviceLocation]((uint64_t)self);
  if ([(GEOLocation *)self->_deviceLocation hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOMapServiceTraits _readHistoricalLocations]((uint64_t)self);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_historicalLocations;
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

  -[GEOMapServiceTraits _readMapRegion]((uint64_t)self);
  if ([(GEOMapRegion *)self->_mapRegion hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOMapServiceTraits _readPreviousSearchViewport]((uint64_t)self);
  if ([(GEOPDViewportInfo *)self->_previousSearchViewport hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOMapServiceTraits _readResultRefinementQuery]((uint64_t)self);
  if ([(GEOPDResultRefinementQuery *)self->_resultRefinementQuery hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOMapServiceTraits _readSearchOriginationPreviousLatlng]((uint64_t)self);
  return [(GEOLatLng *)self->_searchOriginationPreviousLatlng hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  v88 = (char *)a3;
  [(GEOMapServiceTraits *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v88 + 1, self->_reader);
  *((_DWORD *)v88 + 152) = self->_readerMarkPos;
  *((_DWORD *)v88 + 153) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  uint64_t flags = (uint64_t)self->_flags;
  if (flags)
  {
    *(GEOSessionID *)(v88 + 264) = self->_sessionId;
    *(void *)(v88 + 756) |= 1uLL;
    uint64_t flags = (uint64_t)self->_flags;
  }
  if ((flags & 0x10000000) != 0)
  {
    *((_DWORD *)v88 + 177) = self->_sequenceNumber;
    *(void *)(v88 + 756) |= 0x10000000uLL;
  }
  if (self->_appIdentifier) {
    objc_msgSend(v88, "setAppIdentifier:");
  }
  if (self->_appMajorVersion) {
    objc_msgSend(v88, "setAppMajorVersion:");
  }
  if (self->_appMinorVersion) {
    objc_msgSend(v88, "setAppMinorVersion:");
  }
  if (self->_deviceLocation) {
    objc_msgSend(v88, "setDeviceLocation:");
  }
  if ([(GEOMapServiceTraits *)self transportTypesCount])
  {
    [v88 clearTransportTypes];
    unint64_t v5 = [(GEOMapServiceTraits *)self transportTypesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v88, "addTransportType:", -[GEOMapServiceTraits transportTypeAtIndex:](self, "transportTypeAtIndex:", i));
    }
  }
  if (self->_mapRegion) {
    objc_msgSend(v88, "setMapRegion:");
  }
  if ([(GEOMapServiceTraits *)self deviceDisplayLanguagesCount])
  {
    [v88 clearDeviceDisplayLanguages];
    unint64_t v8 = [(GEOMapServiceTraits *)self deviceDisplayLanguagesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        long long v11 = [(GEOMapServiceTraits *)self deviceDisplayLanguageAtIndex:j];
        [v88 addDeviceDisplayLanguage:v11];
      }
    }
  }
  if (self->_deviceKeyboardLocale) {
    objc_msgSend(v88, "setDeviceKeyboardLocale:");
  }
  long long v12 = v88;
  if (self->_deviceSpokenLocale)
  {
    objc_msgSend(v88, "setDeviceSpokenLocale:");
    long long v12 = v88;
  }
  uint64_t v13 = (uint64_t)self->_flags;
  if ((v13 & 0x8000000000) != 0)
  {
    v12[731] = self->_isAPICall;
    *(void *)(v12 + 756) |= 0x8000000000uLL;
    uint64_t v13 = (uint64_t)self->_flags;
  }
  if ((v13 & 0x20000000) != 0)
  {
    *((_DWORD *)v12 + 178) = self->_source;
    *(void *)(v12 + 756) |= 0x20000000uLL;
  }
  if ([(GEOMapServiceTraits *)self photoSizesCount])
  {
    [v88 clearPhotoSizes];
    unint64_t v14 = [(GEOMapServiceTraits *)self photoSizesCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
      {
        v17 = [(GEOMapServiceTraits *)self photoSizesAtIndex:k];
        [v88 addPhotoSizes:v17];
      }
    }
  }
  if ((*((unsigned char *)&self->_flags + 2) & 2) != 0)
  {
    *((_DWORD *)v88 + 166) = self->_photosCount;
    *(void *)(v88 + 756) |= 0x20000uLL;
  }
  if ([(GEOMapServiceTraits *)self reviewUserPhotoSizesCount])
  {
    [v88 clearReviewUserPhotoSizes];
    unint64_t v18 = [(GEOMapServiceTraits *)self reviewUserPhotoSizesCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t m = 0; m != v19; ++m)
      {
        id v21 = [(GEOMapServiceTraits *)self reviewUserPhotoSizesAtIndex:m];
        [v88 addReviewUserPhotoSizes:v21];
      }
    }
  }
  p_uint64_t flags = &self->_flags;
  uint64_t v23 = (uint64_t)self->_flags;
  unint64_t v24 = v88;
  if ((v23 & 0x1000000) != 0)
  {
    *((_DWORD *)v88 + 173) = self->_reviewUserPhotosCount;
    *(void *)(v88 + 756) |= 0x1000000uLL;
    uint64_t v23 = *(void *)p_flags;
    if ((*(void *)p_flags & 0x40000000) == 0)
    {
LABEL_43:
      if ((v23 & 0x80000000) == 0) {
        goto LABEL_44;
      }
      goto LABEL_228;
    }
  }
  else if ((v23 & 0x40000000) == 0)
  {
    goto LABEL_43;
  }
  *((_DWORD *)v88 + 179) = self->_timeSinceMapEnteredForeground;
  *(void *)(v88 + 756) |= 0x40000000uLL;
  uint64_t v23 = (uint64_t)self->_flags;
  if ((v23 & 0x80000000) == 0)
  {
LABEL_44:
    if ((v23 & 0x200) == 0) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
LABEL_228:
  *((_DWORD *)v88 + 180) = self->_timeSinceMapViewportChanged;
  *(void *)(v88 + 756) |= 0x80000000uLL;
  if ((*(void *)&self->_flags & 0x200) != 0)
  {
LABEL_45:
    *((_DWORD *)v88 + 158) = self->_carHeadunitInteractionModel;
    *(void *)(v88 + 756) |= 0x200uLL;
  }
LABEL_46:
  if (self->_carHeadunitManufacturer)
  {
    objc_msgSend(v88, "setCarHeadunitManufacturer:");
    unint64_t v24 = v88;
  }
  if (self->_carHeadunitModel)
  {
    objc_msgSend(v88, "setCarHeadunitModel:");
    unint64_t v24 = v88;
  }
  uint64_t v25 = (uint64_t)self->_flags;
  if ((v25 & 4) != 0)
  {
    *((void *)v24 + 45) = *(void *)&self->_carHeadunitPixelWidth;
    *(void *)(v24 + 756) |= 4uLL;
    uint64_t v25 = (uint64_t)self->_flags;
  }
  if ((v25 & 2) != 0)
  {
    *((void *)v24 + 44) = *(void *)&self->_carHeadunitPixelHeight;
    *(void *)(v24 + 756) |= 2uLL;
  }
  if (self->_transitScheduleFilter)
  {
    objc_msgSend(v88, "setTransitScheduleFilter:");
    unint64_t v24 = v88;
  }
  uint64_t v26 = (uint64_t)self->_flags;
  if ((v26 & 0x10) != 0)
  {
    *((void *)v24 + 58) = *(void *)&self->_mapZoomLevel;
    *(void *)(v24 + 756) |= 0x10uLL;
    uint64_t v26 = (uint64_t)self->_flags;
  }
  if ((v26 & 0x4000) != 0)
  {
    *((_DWORD *)v24 + 163) = self->_mode;
    *(void *)(v24 + 756) |= 0x4000uLL;
  }
  if (self->_displayRegion)
  {
    objc_msgSend(v88, "setDisplayRegion:");
    unint64_t v24 = v88;
  }
  if (self->_providerID)
  {
    objc_msgSend(v88, "setProviderID:");
    unint64_t v24 = v88;
  }
  uint64_t v27 = &self->_flags;
  uint64_t v28 = (uint64_t)self->_flags;
  if ((v28 & 0x800) != 0)
  {
    *((_DWORD *)v24 + 160) = self->_deviceInterfaceOrientation;
    *(void *)(v24 + 756) |= 0x800uLL;
    uint64_t v28 = *(void *)v27;
    if ((*(void *)v27 & 0x400) == 0)
    {
LABEL_66:
      if ((v28 & 0x100) == 0) {
        goto LABEL_67;
      }
LABEL_232:
      *((_DWORD *)v24 + 157) = self->_carHeadunitConnectionType;
      *(void *)(v24 + 756) |= 0x100uLL;
      if ((*(void *)&self->_flags & 0x400000000000) == 0) {
        goto LABEL_69;
      }
      goto LABEL_68;
    }
  }
  else if ((v28 & 0x400) == 0)
  {
    goto LABEL_66;
  }
  *((_DWORD *)v24 + 159) = self->_deviceBatteryState;
  *(void *)(v24 + 756) |= 0x400uLL;
  uint64_t v28 = (uint64_t)self->_flags;
  if ((v28 & 0x100) != 0) {
    goto LABEL_232;
  }
LABEL_67:
  if ((v28 & 0x400000000000) != 0)
  {
LABEL_68:
    v24[738] = self->_navigating;
    *(void *)(v24 + 756) |= 0x400000000000uLL;
  }
LABEL_69:
  if ([(GEOMapServiceTraits *)self historicalLocationsCount])
  {
    [v88 clearHistoricalLocations];
    unint64_t v29 = [(GEOMapServiceTraits *)self historicalLocationsCount];
    if (v29)
    {
      unint64_t v30 = v29;
      for (uint64_t n = 0; n != v30; ++n)
      {
        uint64_t v32 = [(GEOMapServiceTraits *)self historicalLocationsAtIndex:n];
        [v88 addHistoricalLocations:v32];
      }
    }
  }
  if (self->_automobileOptions) {
    objc_msgSend(v88, "setAutomobileOptions:");
  }
  if (self->_transitOptions) {
    objc_msgSend(v88, "setTransitOptions:");
  }
  if (self->_walkingOptions) {
    objc_msgSend(v88, "setWalkingOptions:");
  }
  if ([(GEOMapServiceTraits *)self engineTypesCount])
  {
    [v88 clearEngineTypes];
    unint64_t v33 = [(GEOMapServiceTraits *)self engineTypesCount];
    if (v33)
    {
      unint64_t v34 = v33;
      for (iuint64_t i = 0; ii != v34; ++ii)
        objc_msgSend(v88, "addEngineType:", -[GEOMapServiceTraits engineTypeAtIndex:](self, "engineTypeAtIndex:", ii));
    }
  }
  uint64_t v36 = &self->_flags;
  uint64_t v37 = (uint64_t)self->_flags;
  if ((v37 & 0x200000) == 0)
  {
    if ((v37 & 0x80000000000000) == 0) {
      goto LABEL_85;
    }
LABEL_235:
    v88[747] = self->_supportDirectionIntentSearch;
    *(void *)(v88 + 756) |= 0x80000000000000uLL;
    if ((*(void *)&self->_flags & 0x100000000000000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_86;
  }
  *((_DWORD *)v88 + 170) = self->_requestMode;
  *(void *)(v88 + 756) |= 0x200000uLL;
  uint64_t v37 = *(void *)v36;
  if ((*(void *)v36 & 0x80000000000000) != 0) {
    goto LABEL_235;
  }
LABEL_85:
  if ((v37 & 0x100000000000000) != 0)
  {
LABEL_86:
    v88[748] = self->_supportDymSuggestion;
    *(void *)(v88 + 756) |= 0x100000000000000uLL;
  }
LABEL_87:
  if ([(GEOMapServiceTraits *)self knownClientResolvedTypesCount])
  {
    [v88 clearKnownClientResolvedTypes];
    unint64_t v38 = [(GEOMapServiceTraits *)self knownClientResolvedTypesCount];
    if (v38)
    {
      unint64_t v39 = v38;
      for (juint64_t j = 0; jj != v39; ++jj)
        objc_msgSend(v88, "addKnownClientResolvedType:", -[GEOMapServiceTraits knownClientResolvedTypeAtIndex:](self, "knownClientResolvedTypeAtIndex:", jj));
    }
  }
  uint64_t v41 = v88;
  if ((*((unsigned char *)&self->_flags + 7) & 0x10) != 0)
  {
    v88[752] = self->_wantsBrandIcon;
    *(void *)(v88 + 756) |= 0x1000000000000000uLL;
  }
  if (self->_venueIdentifier)
  {
    objc_msgSend(v88, "setVenueIdentifier:");
    uint64_t v41 = v88;
  }
  uint64_t v42 = &self->_flags;
  uint64_t v43 = (uint64_t)self->_flags;
  if ((v43 & 0x4000000000) != 0)
  {
    v41[730] = self->_deviceInVehicle;
    *(void *)(v41 + 756) |= 0x4000000000uLL;
    uint64_t v43 = *(void *)v42;
    if ((*(void *)v42 & 0x400000) == 0)
    {
LABEL_97:
      if ((v43 & 0x2000) == 0) {
        goto LABEL_99;
      }
      goto LABEL_98;
    }
  }
  else if ((v43 & 0x400000) == 0)
  {
    goto LABEL_97;
  }
  *((_DWORD *)v41 + 171) = self->_requestPriority;
  *(void *)(v41 + 756) |= 0x400000uLL;
  if ((*(void *)&self->_flags & 0x2000) != 0)
  {
LABEL_98:
    *((_DWORD *)v41 + 162) = self->_httpRequestPriority;
    *(void *)(v41 + 756) |= 0x2000uLL;
  }
LABEL_99:
  if (self->_analyticsAppIdentifier)
  {
    objc_msgSend(v88, "setAnalyticsAppIdentifier:");
    uint64_t v41 = v88;
  }
  uint64_t v44 = &self->_flags;
  uint64_t v45 = (uint64_t)self->_flags;
  if ((v45 & 0x20) != 0)
  {
    *((void *)v41 + 68) = *(void *)&self->_sessionRelativeTimestamp;
    *(void *)(v41 + 756) |= 0x20uLL;
    uint64_t v45 = *(void *)v44;
    if ((*(void *)v44 & 0x40000000000000) == 0)
    {
LABEL_103:
      if ((v45 & 0x400000000000000) == 0) {
        goto LABEL_104;
      }
      goto LABEL_242;
    }
  }
  else if ((v45 & 0x40000000000000) == 0)
  {
    goto LABEL_103;
  }
  v41[746] = self->_supportDirectionIntentAutocomplete;
  *(void *)(v41 + 756) |= 0x40000000000000uLL;
  uint64_t v45 = (uint64_t)self->_flags;
  if ((v45 & 0x400000000000000) == 0)
  {
LABEL_104:
    if ((v45 & 0x2000000000) == 0) {
      goto LABEL_105;
    }
    goto LABEL_243;
  }
LABEL_242:
  v41[750] = self->_supportUnresolvedDirectionIntent;
  *(void *)(v41 + 756) |= 0x400000000000000uLL;
  uint64_t v45 = (uint64_t)self->_flags;
  if ((v45 & 0x2000000000) == 0)
  {
LABEL_105:
    if ((v45 & 0x200000000) == 0) {
      goto LABEL_106;
    }
    goto LABEL_244;
  }
LABEL_243:
  v41[729] = self->_deviceDarkMode;
  *(void *)(v41 + 756) |= 0x2000000000uLL;
  uint64_t v45 = (uint64_t)self->_flags;
  if ((v45 & 0x200000000) == 0)
  {
LABEL_106:
    if ((v45 & 0x800000000000000) == 0) {
      goto LABEL_107;
    }
LABEL_245:
    v41[751] = self->_supportsBrandFallback;
    *(void *)(v41 + 756) |= 0x800000000000000uLL;
    if ((*(void *)&self->_flags & 0x800000) == 0) {
      goto LABEL_109;
    }
    goto LABEL_108;
  }
LABEL_244:
  v41[725] = self->_appDarkMode;
  *(void *)(v41 + 756) |= 0x200000000uLL;
  uint64_t v45 = (uint64_t)self->_flags;
  if ((v45 & 0x800000000000000) != 0) {
    goto LABEL_245;
  }
LABEL_107:
  if ((v45 & 0x800000) != 0)
  {
LABEL_108:
    *((_DWORD *)v41 + 172) = self->_requestPurpose;
    *(void *)(v41 + 756) |= 0x800000uLL;
  }
LABEL_109:
  if ([(GEOMapServiceTraits *)self supportedAutocompleteListTypesCount])
  {
    [v88 clearSupportedAutocompleteListTypes];
    unint64_t v46 = [(GEOMapServiceTraits *)self supportedAutocompleteListTypesCount];
    if (v46)
    {
      unint64_t v47 = v46;
      for (kuint64_t k = 0; kk != v47; ++kk)
        objc_msgSend(v88, "addSupportedAutocompleteListType:", -[GEOMapServiceTraits supportedAutocompleteListTypeAtIndex:](self, "supportedAutocompleteListTypeAtIndex:", kk));
    }
  }
  uint64_t v49 = v88;
  if ((*((unsigned char *)&self->_flags + 5) & 4) != 0)
  {
    v88[734] = self->_isSettlement;
    *(void *)(v88 + 756) |= 0x40000000000uLL;
  }
  if (self->_transitTripStopTimeFilter)
  {
    objc_msgSend(v88, "setTransitTripStopTimeFilter:");
    uint64_t v49 = v88;
  }
  if ((*((unsigned char *)&self->_flags + 6) & 0x20) != 0)
  {
    v49[745] = self->_supportClientRankingFeatureMetadata;
    *(void *)(v49 + 756) |= 0x20000000000000uLL;
  }
  if ([(GEOMapServiceTraits *)self supportedChildActionsCount])
  {
    [v88 clearSupportedChildActions];
    unint64_t v50 = [(GEOMapServiceTraits *)self supportedChildActionsCount];
    if (v50)
    {
      unint64_t v51 = v50;
      for (muint64_t m = 0; mm != v51; ++mm)
        objc_msgSend(v88, "addSupportedChildAction:", -[GEOMapServiceTraits supportedChildActionAtIndex:](self, "supportedChildActionAtIndex:", mm));
    }
  }
  uint64_t v53 = &self->_flags;
  uint64_t v54 = (uint64_t)self->_flags;
  if ((v54 & 0x8000000000000) == 0)
  {
    if ((v54 & 0x10000000000) == 0) {
      goto LABEL_125;
    }
LABEL_248:
    v88[732] = self->_isRefund;
    *(void *)(v88 + 756) |= 0x10000000000uLL;
    if ((*(void *)&self->_flags & 0x800000000) == 0) {
      goto LABEL_127;
    }
    goto LABEL_126;
  }
  v88[743] = self->_supportChildItems;
  *(void *)(v88 + 756) |= 0x8000000000000uLL;
  uint64_t v54 = *(void *)v53;
  if ((*(void *)v53 & 0x10000000000) != 0) {
    goto LABEL_248;
  }
LABEL_125:
  if ((v54 & 0x800000000) != 0)
  {
LABEL_126:
    v88[727] = self->_autocompleteRequestSupportsSectionHeader;
    *(void *)(v88 + 756) |= 0x800000000uLL;
  }
LABEL_127:
  if ([(GEOMapServiceTraits *)self supportedAutocompleteResultCellTypesCount])
  {
    [v88 clearSupportedAutocompleteResultCellTypes];
    unint64_t v55 = [(GEOMapServiceTraits *)self supportedAutocompleteResultCellTypesCount];
    if (v55)
    {
      unint64_t v56 = v55;
      for (nuint64_t n = 0; nn != v56; ++nn)
        objc_msgSend(v88, "addSupportedAutocompleteResultCellType:", -[GEOMapServiceTraits supportedAutocompleteResultCellTypeAtIndex:](self, "supportedAutocompleteResultCellTypeAtIndex:", nn));
    }
  }
  uint64_t v58 = v88;
  if ((*((unsigned char *)&self->_flags + 1) & 0x80) != 0)
  {
    *((_DWORD *)v88 + 164) = self->_navigationTransportType;
    *(void *)(v88 + 756) |= 0x8000uLL;
  }
  if (self->_cyclingOptions)
  {
    objc_msgSend(v88, "setCyclingOptions:");
    uint64_t v58 = v88;
  }
  if ((*((unsigned char *)&self->_flags + 2) & 8) != 0)
  {
    *((_DWORD *)v58 + 168) = self->_ratingsCount;
    *(void *)(v58 + 756) |= 0x80000uLL;
  }
  if ([(GEOMapServiceTraits *)self evChargingPortsCount])
  {
    [v88 clearEvChargingPorts];
    unint64_t v59 = [(GEOMapServiceTraits *)self evChargingPortsCount];
    if (v59)
    {
      unint64_t v60 = v59;
      for (uint64_t i1 = 0; i1 != v60; ++i1)
      {
        uint64_t v62 = [(GEOMapServiceTraits *)self evChargingPortAtIndex:i1];
        [v88 addEvChargingPort:v62];
      }
    }
  }
  if ((*((unsigned char *)&self->_flags + 5) & 8) != 0)
  {
    v88[735] = self->_isWidgetRequest;
    *(void *)(v88 + 756) |= 0x80000000000uLL;
  }
  if ([(GEOMapServiceTraits *)self supportedSearchTierTypesCount])
  {
    [v88 clearSupportedSearchTierTypes];
    unint64_t v63 = [(GEOMapServiceTraits *)self supportedSearchTierTypesCount];
    if (v63)
    {
      unint64_t v64 = v63;
      for (uint64_t i2 = 0; i2 != v64; ++i2)
        objc_msgSend(v88, "addSupportedSearchTierType:", -[GEOMapServiceTraits supportedSearchTierTypeAtIndex:](self, "supportedSearchTierTypeAtIndex:", i2));
    }
  }
  long long v66 = &self->_flags;
  uint64_t v67 = (uint64_t)self->_flags;
  if ((v67 & 0x80) == 0)
  {
    if ((v67 & 0x40000) == 0) {
      goto LABEL_149;
    }
LABEL_251:
    *((_DWORD *)v88 + 167) = self->_placeSummaryRevision;
    *(void *)(v88 + 756) |= 0x40000uLL;
    if ((*(void *)&self->_flags & 8) == 0) {
      goto LABEL_151;
    }
    goto LABEL_150;
  }
  *((_DWORD *)v88 + 156) = self->_auxiliaryTierNumResults;
  *(void *)(v88 + 756) |= 0x80uLL;
  uint64_t v67 = *(void *)v66;
  if ((*(void *)v66 & 0x40000) != 0) {
    goto LABEL_251;
  }
LABEL_149:
  if ((v67 & 8) != 0)
  {
LABEL_150:
    *((void *)v88 + 56) = *(void *)&self->_isTourist;
    *(void *)(v88 + 756) |= 8uLL;
  }
LABEL_151:
  if ([(GEOMapServiceTraits *)self knownRefinementTypesCount])
  {
    [v88 clearKnownRefinementTypes];
    unint64_t v68 = [(GEOMapServiceTraits *)self knownRefinementTypesCount];
    if (v68)
    {
      unint64_t v69 = v68;
      for (uint64_t i3 = 0; i3 != v69; ++i3)
        objc_msgSend(v88, "addKnownRefinementType:", -[GEOMapServiceTraits knownRefinementTypeAtIndex:](self, "knownRefinementTypeAtIndex:", i3));
    }
  }
  uint64_t v71 = (uint64_t)self->_flags;
  long long v72 = v88;
  if ((v71 & 0x4000000000000) != 0)
  {
    v88[742] = self->_supportAutocompletePublisherResults;
    *(void *)(v88 + 756) |= 0x4000000000000uLL;
    uint64_t v71 = (uint64_t)self->_flags;
  }
  if ((v71 & 0x2000000000000) != 0)
  {
    v88[741] = self->_supportAutocompleteGuideResults;
    *(void *)(v88 + 756) |= 0x2000000000000uLL;
  }
  if (self->_previousSearchViewport)
  {
    objc_msgSend(v88, "setPreviousSearchViewport:");
    long long v72 = v88;
  }
  if (*((unsigned char *)&self->_flags + 2))
  {
    *((_DWORD *)v72 + 165) = self->_photoAlbumCount;
    *(void *)(v72 + 756) |= 0x10000uLL;
  }
  if (self->_resultRefinementQuery)
  {
    objc_msgSend(v88, "setResultRefinementQuery:");
    long long v72 = v88;
  }
  uint64_t v73 = (uint64_t)self->_flags;
  if ((v73 & 0x100000) != 0)
  {
    *((_DWORD *)v72 + 169) = self->_relatedPlaceItemCount;
    *(void *)(v72 + 756) |= 0x100000uLL;
    uint64_t v73 = (uint64_t)self->_flags;
  }
  if ((v73 & 0x4000000) != 0)
  {
    *((_DWORD *)v72 + 175) = self->_searchRequestType;
    *(void *)(v72 + 756) |= 0x4000000uLL;
  }
  if (self->_currentLocaleCurrencySymbol) {
    objc_msgSend(v88, "setCurrentLocaleCurrencySymbol:");
  }
  if ([(GEOMapServiceTraits *)self supportedPlaceSummaryFormatTypesCount])
  {
    [v88 clearSupportedPlaceSummaryFormatTypes];
    unint64_t v74 = [(GEOMapServiceTraits *)self supportedPlaceSummaryFormatTypesCount];
    if (v74)
    {
      unint64_t v75 = v74;
      for (uint64_t i4 = 0; i4 != v75; ++i4)
        objc_msgSend(v88, "addSupportedPlaceSummaryFormatType:", -[GEOMapServiceTraits supportedPlaceSummaryFormatTypeAtIndex:](self, "supportedPlaceSummaryFormatTypeAtIndex:", i4));
    }
  }
  id v77 = v88;
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    *((_DWORD *)v88 + 155) = self->_autocompleteOriginationType;
    *(void *)(v88 + 756) |= 0x40uLL;
  }
  if (self->_autocompleteOriginationPreviousLatlng)
  {
    objc_msgSend(v88, "setAutocompleteOriginationPreviousLatlng:");
    id v77 = v88;
  }
  if ((*((unsigned char *)&self->_flags + 3) & 8) != 0)
  {
    *((_DWORD *)v77 + 176) = self->_searchOriginationType;
    *(void *)(v77 + 756) |= 0x8000000uLL;
  }
  if (self->_searchOriginationPreviousLatlng)
  {
    objc_msgSend(v88, "setSearchOriginationPreviousLatlng:");
    id v77 = v88;
  }
  if (self->_addStopRouteInfo)
  {
    objc_msgSend(v88, "setAddStopRouteInfo:");
    id v77 = v88;
  }
  v78 = &self->_flags;
  uint64_t v79 = (uint64_t)self->_flags;
  if ((v79 & 0x400000000) != 0)
  {
    v77[726] = self->_autocompleteOriginationEditingServerWaypoints;
    *(void *)(v77 + 756) |= 0x400000000uLL;
    uint64_t v79 = *(void *)v78;
    if ((*(void *)v78 & 0x1000000000000) == 0)
    {
LABEL_187:
      if ((v79 & 0x10000000000000) == 0) {
        goto LABEL_189;
      }
      goto LABEL_188;
    }
  }
  else if ((v79 & 0x1000000000000) == 0)
  {
    goto LABEL_187;
  }
  v77[740] = self->_searchOriginationEditingServerWaypoints;
  *(void *)(v77 + 756) |= 0x1000000000000uLL;
  if ((*(void *)&self->_flags & 0x10000000000000) != 0)
  {
LABEL_188:
    v77[744] = self->_supportClientRankingCompositeFeatures;
    *(void *)(v77 + 756) |= 0x10000000000000uLL;
  }
LABEL_189:
  if (self->_privacyMetadata)
  {
    objc_msgSend(v88, "setPrivacyMetadata:");
    id v77 = v88;
  }
  uint64_t v80 = &self->_flags;
  uint64_t v81 = (uint64_t)self->_flags;
  if ((v81 & 0x2000000) == 0)
  {
    if ((v81 & 0x200000000000000) == 0) {
      goto LABEL_193;
    }
LABEL_257:
    v77[749] = self->_supportStructuredRapAffordance;
    *(void *)(v77 + 756) |= 0x200000000000000uLL;
    if ((*(void *)&self->_flags & 0x20000000000) == 0) {
      goto LABEL_195;
    }
    goto LABEL_194;
  }
  *((_DWORD *)v77 + 174) = self->_routeStopCount;
  *(void *)(v77 + 756) |= 0x2000000uLL;
  uint64_t v81 = *(void *)v80;
  if ((*(void *)v80 & 0x200000000000000) != 0) {
    goto LABEL_257;
  }
LABEL_193:
  if ((v81 & 0x20000000000) != 0)
  {
LABEL_194:
    v77[733] = self->_isRoutePlanningEditStopFillRequest;
    *(void *)(v77 + 756) |= 0x20000000000uLL;
  }
LABEL_195:
  if ([(GEOMapServiceTraits *)self preferredBrandsCount])
  {
    [v88 clearPreferredBrands];
    unint64_t v82 = [(GEOMapServiceTraits *)self preferredBrandsCount];
    if (v82)
    {
      unint64_t v83 = v82;
      for (uint64_t i5 = 0; i5 != v83; ++i5)
        objc_msgSend(v88, "addPreferredBrand:", -[GEOMapServiceTraits preferredBrandAtIndex:](self, "preferredBrandAtIndex:", i5));
    }
  }
  uint64_t v85 = (uint64_t)self->_flags;
  v86 = v88;
  if ((v85 & 0x100000000000) != 0)
  {
    v88[736] = self->_isWithinHikingBoundary;
    *(void *)(v88 + 756) |= 0x100000000000uLL;
    uint64_t v85 = (uint64_t)self->_flags;
  }
  if ((v85 & 0x200000000000) != 0)
  {
    v88[737] = self->_isWithinHikingBufferRegion;
    *(void *)(v88 + 756) |= 0x200000000000uLL;
  }
  if (self->_searchImplicitFilterInfo)
  {
    objc_msgSend(v88, "setSearchImplicitFilterInfo:");
    v86 = v88;
  }
  uint64_t v87 = (uint64_t)self->_flags;
  if ((v87 & 0x1000) != 0)
  {
    *((_DWORD *)v86 + 161) = self->_devicePlatform;
    *(void *)(v86 + 756) |= 0x1000uLL;
    uint64_t v87 = (uint64_t)self->_flags;
  }
  if ((v87 & 0x1000000000) != 0)
  {
    v86[728] = self->_containsSensitiveData;
    *(void *)(v86 + 756) |= 0x1000000000uLL;
  }
  if (self->_spotlightSearchPunchinEncodedString)
  {
    objc_msgSend(v88, "setSpotlightSearchPunchinEncodedString:");
    v86 = v88;
  }
  if ((*((unsigned char *)&self->_flags + 5) & 0x80) != 0)
  {
    v86[739] = self->_optimizeSearchRequestComponents;
    *(void *)(v86 + 756) |= 0x800000000000uLL;
  }
  if (self->_recentAutocompleteSessionData)
  {
    objc_msgSend(v88, "setRecentAutocompleteSessionData:");
    v86 = v88;
  }
  if (*((unsigned char *)&self->_flags + 4))
  {
    v86[724] = self->_analyticsOptOut;
    *(void *)(v86 + 756) |= 0x100000000uLL;
  }
  if (self->_userActionMetadata)
  {
    objc_msgSend(v88, "setUserActionMetadata:");
    v86 = v88;
  }
  if ((*((unsigned char *)&self->_flags + 7) & 0x20) != 0)
  {
    v86[753] = self->_wantsRouteCreationTip;
    *(void *)(v86 + 756) |= 0x2000000000000000uLL;
  }
  if (self->_hardwareIdentifier)
  {
    objc_msgSend(v88, "setHardwareIdentifier:");
    v86 = v88;
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_500;
  }
  [(GEOMapServiceTraits *)self readAll:1];
  [v4 readAll:1];
  uint64_t flags = (uint64_t)self->_flags;
  uint64_t v6 = *(void *)(v4 + 756);
  if (flags)
  {
    if ((v6 & 1) == 0) {
      goto LABEL_500;
    }
    if (self->_sessionId._high != *((void *)v4 + 33) || self->_sessionId._low != *((void *)v4 + 34)) {
      goto LABEL_500;
    }
  }
  else if (v6)
  {
    goto LABEL_500;
  }
  if ((flags & 0x10000000) != 0)
  {
    if ((v6 & 0x10000000) == 0 || self->_sequenceNumber != *((_DWORD *)v4 + 177)) {
      goto LABEL_500;
    }
  }
  else if ((v6 & 0x10000000) != 0)
  {
    goto LABEL_500;
  }
  appIdentifier = self->_appIdentifier;
  if ((unint64_t)appIdentifier | *((void *)v4 + 37)
    && !-[NSString isEqual:](appIdentifier, "isEqual:"))
  {
    goto LABEL_500;
  }
  appMajorVersiouint64_t n = self->_appMajorVersion;
  if ((unint64_t)appMajorVersion | *((void *)v4 + 38))
  {
    if (!-[NSString isEqual:](appMajorVersion, "isEqual:")) {
      goto LABEL_500;
    }
  }
  appMinorVersiouint64_t n = self->_appMinorVersion;
  if ((unint64_t)appMinorVersion | *((void *)v4 + 39))
  {
    if (!-[NSString isEqual:](appMinorVersion, "isEqual:")) {
      goto LABEL_500;
    }
  }
  deviceLocatiouint64_t n = self->_deviceLocation;
  if ((unint64_t)deviceLocation | *((void *)v4 + 48))
  {
    if (!-[GEOLocation isEqual:](deviceLocation, "isEqual:")) {
      goto LABEL_500;
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_500;
  }
  mapRegiouint64_t n = self->_mapRegion;
  if ((unint64_t)mapRegion | *((void *)v4 + 57))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:")) {
      goto LABEL_500;
    }
  }
  deviceDisplayLanguages = self->_deviceDisplayLanguages;
  if ((unint64_t)deviceDisplayLanguages | *((void *)v4 + 49))
  {
    if (!-[NSMutableArray isEqual:](deviceDisplayLanguages, "isEqual:")) {
      goto LABEL_500;
    }
  }
  deviceKeyboardLocale = self->_deviceKeyboardLocale;
  if ((unint64_t)deviceKeyboardLocale | *((void *)v4 + 50))
  {
    if (!-[NSString isEqual:](deviceKeyboardLocale, "isEqual:")) {
      goto LABEL_500;
    }
  }
  deviceSpokenLocale = self->_deviceSpokenLocale;
  if ((unint64_t)deviceSpokenLocale | *((void *)v4 + 51))
  {
    if (!-[NSString isEqual:](deviceSpokenLocale, "isEqual:")) {
      goto LABEL_500;
    }
  }
  uint64_t v16 = (uint64_t)self->_flags;
  uint64_t v17 = *(void *)(v4 + 756);
  if ((v16 & 0x8000000000) != 0)
  {
    if ((v17 & 0x8000000000) == 0) {
      goto LABEL_500;
    }
    if (self->_isAPICall)
    {
      if (!v4[731]) {
        goto LABEL_500;
      }
    }
    else if (v4[731])
    {
      goto LABEL_500;
    }
  }
  else if ((v17 & 0x8000000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v16 & 0x20000000) != 0)
  {
    if ((v17 & 0x20000000) == 0 || self->_source != *((_DWORD *)v4 + 178)) {
      goto LABEL_500;
    }
  }
  else if ((v17 & 0x20000000) != 0)
  {
    goto LABEL_500;
  }
  photoSizes = self->_photoSizes;
  if ((unint64_t)photoSizes | *((void *)v4 + 59))
  {
    if (!-[NSMutableArray isEqual:](photoSizes, "isEqual:")) {
      goto LABEL_500;
    }
    uint64_t v16 = (uint64_t)self->_flags;
    uint64_t v17 = *(void *)(v4 + 756);
  }
  if ((v16 & 0x20000) != 0)
  {
    if ((v17 & 0x20000) == 0 || self->_photosCount != *((_DWORD *)v4 + 166)) {
      goto LABEL_500;
    }
  }
  else if ((v17 & 0x20000) != 0)
  {
    goto LABEL_500;
  }
  reviewUserPhotoSizes = self->_reviewUserPhotoSizes;
  if ((unint64_t)reviewUserPhotoSizes | *((void *)v4 + 65))
  {
    if (!-[NSMutableArray isEqual:](reviewUserPhotoSizes, "isEqual:")) {
      goto LABEL_500;
    }
    uint64_t v16 = (uint64_t)self->_flags;
    uint64_t v17 = *(void *)(v4 + 756);
  }
  if ((v16 & 0x1000000) != 0)
  {
    if ((v17 & 0x1000000) == 0 || self->_reviewUserPhotosCount != *((_DWORD *)v4 + 173)) {
      goto LABEL_500;
    }
  }
  else if ((v17 & 0x1000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v16 & 0x40000000) != 0)
  {
    if ((v17 & 0x40000000) == 0 || self->_timeSinceMapEnteredForeground != *((_DWORD *)v4 + 179)) {
      goto LABEL_500;
    }
  }
  else if ((v17 & 0x40000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v16 & 0x80000000) != 0)
  {
    if ((v17 & 0x80000000) == 0 || self->_timeSinceMapViewportChanged != *((_DWORD *)v4 + 180)) {
      goto LABEL_500;
    }
  }
  else if ((v17 & 0x80000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v16 & 0x200) != 0)
  {
    if ((v17 & 0x200) == 0 || self->_carHeadunitInteractionModel != *((_DWORD *)v4 + 158)) {
      goto LABEL_500;
    }
  }
  else if ((v17 & 0x200) != 0)
  {
    goto LABEL_500;
  }
  carHeadunitManufacturer = self->_carHeadunitManufacturer;
  if ((unint64_t)carHeadunitManufacturer | *((void *)v4 + 42)
    && !-[NSString isEqual:](carHeadunitManufacturer, "isEqual:"))
  {
    goto LABEL_500;
  }
  carHeadunitModel = self->_carHeadunitModel;
  if ((unint64_t)carHeadunitModel | *((void *)v4 + 43))
  {
    if (!-[NSString isEqual:](carHeadunitModel, "isEqual:")) {
      goto LABEL_500;
    }
  }
  uint64_t v22 = (uint64_t)self->_flags;
  uint64_t v23 = *(void *)(v4 + 756);
  if ((v22 & 4) != 0)
  {
    if ((v23 & 4) == 0 || self->_carHeadunitPixelWidth != *((double *)v4 + 45)) {
      goto LABEL_500;
    }
  }
  else if ((v23 & 4) != 0)
  {
    goto LABEL_500;
  }
  if ((v22 & 2) != 0)
  {
    if ((v23 & 2) == 0 || self->_carHeadunitPixelHeight != *((double *)v4 + 44)) {
      goto LABEL_500;
    }
  }
  else if ((v23 & 2) != 0)
  {
    goto LABEL_500;
  }
  transitScheduleFilter = self->_transitScheduleFilter;
  if ((unint64_t)transitScheduleFilter | *((void *)v4 + 71))
  {
    if (!-[GEOTraitsTransitScheduleFilter isEqual:](transitScheduleFilter, "isEqual:")) {
      goto LABEL_500;
    }
    uint64_t v22 = (uint64_t)self->_flags;
    uint64_t v23 = *(void *)(v4 + 756);
  }
  if ((v22 & 0x10) != 0)
  {
    if ((v23 & 0x10) == 0 || self->_mapZoomLevel != *((double *)v4 + 58)) {
      goto LABEL_500;
    }
  }
  else if ((v23 & 0x10) != 0)
  {
    goto LABEL_500;
  }
  if ((v22 & 0x4000) != 0)
  {
    if ((v23 & 0x4000) == 0 || self->_mode != *((_DWORD *)v4 + 163)) {
      goto LABEL_500;
    }
  }
  else if ((v23 & 0x4000) != 0)
  {
    goto LABEL_500;
  }
  displayRegiouint64_t n = self->_displayRegion;
  if ((unint64_t)displayRegion | *((void *)v4 + 52)
    && !-[NSString isEqual:](displayRegion, "isEqual:"))
  {
    goto LABEL_500;
  }
  providerID = self->_providerID;
  if ((unint64_t)providerID | *((void *)v4 + 62))
  {
    if (!-[NSString isEqual:](providerID, "isEqual:")) {
      goto LABEL_500;
    }
  }
  uint64_t v27 = (uint64_t)self->_flags;
  uint64_t v28 = *(void *)(v4 + 756);
  if ((v27 & 0x800) != 0)
  {
    if ((v28 & 0x800) == 0 || self->_deviceInterfaceOrientation != *((_DWORD *)v4 + 160)) {
      goto LABEL_500;
    }
  }
  else if ((v28 & 0x800) != 0)
  {
    goto LABEL_500;
  }
  if ((v27 & 0x400) != 0)
  {
    if ((v28 & 0x400) == 0 || self->_deviceBatteryState != *((_DWORD *)v4 + 159)) {
      goto LABEL_500;
    }
  }
  else if ((v28 & 0x400) != 0)
  {
    goto LABEL_500;
  }
  if ((v27 & 0x100) != 0)
  {
    if ((v28 & 0x100) == 0 || self->_carHeadunitConnectionType != *((_DWORD *)v4 + 157)) {
      goto LABEL_500;
    }
  }
  else if ((v28 & 0x100) != 0)
  {
    goto LABEL_500;
  }
  if ((v27 & 0x400000000000) != 0)
  {
    if ((v28 & 0x400000000000) == 0) {
      goto LABEL_500;
    }
    if (self->_navigating)
    {
      if (!v4[738]) {
        goto LABEL_500;
      }
    }
    else if (v4[738])
    {
      goto LABEL_500;
    }
  }
  else if ((v28 & 0x400000000000) != 0)
  {
    goto LABEL_500;
  }
  historicalLocations = self->_historicalLocations;
  if ((unint64_t)historicalLocations | *((void *)v4 + 55)
    && !-[NSMutableArray isEqual:](historicalLocations, "isEqual:"))
  {
    goto LABEL_500;
  }
  automobileOptions = self->_automobileOptions;
  if ((unint64_t)automobileOptions | *((void *)v4 + 41))
  {
    if (!-[GEOAutomobileOptions isEqual:](automobileOptions, "isEqual:")) {
      goto LABEL_500;
    }
  }
  transitOptions = self->_transitOptions;
  if ((unint64_t)transitOptions | *((void *)v4 + 70))
  {
    if (!-[GEOTransitOptions isEqual:](transitOptions, "isEqual:")) {
      goto LABEL_500;
    }
  }
  walkingOptions = self->_walkingOptions;
  if ((unint64_t)walkingOptions | *((void *)v4 + 75))
  {
    if (!-[GEOWalkingOptions isEqual:](walkingOptions, "isEqual:")) {
      goto LABEL_500;
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_500;
  }
  uint64_t v33 = (uint64_t)self->_flags;
  uint64_t v34 = *(void *)(v4 + 756);
  if ((v33 & 0x200000) != 0)
  {
    if ((v34 & 0x200000) == 0 || self->_requestMode != *((_DWORD *)v4 + 170)) {
      goto LABEL_500;
    }
  }
  else if ((v34 & 0x200000) != 0)
  {
    goto LABEL_500;
  }
  if ((v33 & 0x80000000000000) != 0)
  {
    if ((v34 & 0x80000000000000) == 0) {
      goto LABEL_500;
    }
    if (self->_supportDirectionIntentSearch)
    {
      if (!v4[747]) {
        goto LABEL_500;
      }
    }
    else if (v4[747])
    {
      goto LABEL_500;
    }
  }
  else if ((v34 & 0x80000000000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v33 & 0x100000000000000) != 0)
  {
    if ((v34 & 0x100000000000000) == 0) {
      goto LABEL_500;
    }
    if (self->_supportDymSuggestion)
    {
      if (!v4[748]) {
        goto LABEL_500;
      }
    }
    else if (v4[748])
    {
      goto LABEL_500;
    }
  }
  else if ((v34 & 0x100000000000000) != 0)
  {
    goto LABEL_500;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_500;
  }
  uint64_t v35 = (uint64_t)self->_flags;
  uint64_t v36 = *(void *)(v4 + 756);
  if ((v35 & 0x1000000000000000) != 0)
  {
    if ((v36 & 0x1000000000000000) == 0) {
      goto LABEL_500;
    }
    if (self->_wantsBrandIcon)
    {
      if (!v4[752]) {
        goto LABEL_500;
      }
    }
    else if (v4[752])
    {
      goto LABEL_500;
    }
  }
  else if ((v36 & 0x1000000000000000) != 0)
  {
    goto LABEL_500;
  }
  venueIdentifier = self->_venueIdentifier;
  if ((unint64_t)venueIdentifier | *((void *)v4 + 74))
  {
    if (!-[GEOPDVenueIdentifier isEqual:](venueIdentifier, "isEqual:")) {
      goto LABEL_500;
    }
    uint64_t v35 = (uint64_t)self->_flags;
    uint64_t v36 = *(void *)(v4 + 756);
  }
  if ((v35 & 0x4000000000) != 0)
  {
    if ((v36 & 0x4000000000) == 0) {
      goto LABEL_500;
    }
    if (self->_deviceInVehicle)
    {
      if (!v4[730]) {
        goto LABEL_500;
      }
    }
    else if (v4[730])
    {
      goto LABEL_500;
    }
  }
  else if ((v36 & 0x4000000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v35 & 0x400000) != 0)
  {
    if ((v36 & 0x400000) == 0 || self->_requestPriority != *((_DWORD *)v4 + 171)) {
      goto LABEL_500;
    }
  }
  else if ((v36 & 0x400000) != 0)
  {
    goto LABEL_500;
  }
  if ((v35 & 0x2000) != 0)
  {
    if ((v36 & 0x2000) == 0 || self->_httpRequestPriority != *((_DWORD *)v4 + 162)) {
      goto LABEL_500;
    }
  }
  else if ((v36 & 0x2000) != 0)
  {
    goto LABEL_500;
  }
  analyticsAppIdentifier = self->_analyticsAppIdentifier;
  if ((unint64_t)analyticsAppIdentifier | *((void *)v4 + 36))
  {
    if (!-[NSString isEqual:](analyticsAppIdentifier, "isEqual:")) {
      goto LABEL_500;
    }
    uint64_t v35 = (uint64_t)self->_flags;
    uint64_t v36 = *(void *)(v4 + 756);
  }
  if ((v35 & 0x20) != 0)
  {
    if ((v36 & 0x20) == 0 || self->_sessionRelativeTimestamp != *((double *)v4 + 68)) {
      goto LABEL_500;
    }
  }
  else if ((v36 & 0x20) != 0)
  {
    goto LABEL_500;
  }
  if ((v35 & 0x40000000000000) != 0)
  {
    if ((v36 & 0x40000000000000) == 0) {
      goto LABEL_500;
    }
    if (self->_supportDirectionIntentAutocomplete)
    {
      if (!v4[746]) {
        goto LABEL_500;
      }
    }
    else if (v4[746])
    {
      goto LABEL_500;
    }
  }
  else if ((v36 & 0x40000000000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v35 & 0x400000000000000) != 0)
  {
    if ((v36 & 0x400000000000000) == 0) {
      goto LABEL_500;
    }
    if (self->_supportUnresolvedDirectionIntent)
    {
      if (!v4[750]) {
        goto LABEL_500;
      }
    }
    else if (v4[750])
    {
      goto LABEL_500;
    }
  }
  else if ((v36 & 0x400000000000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v35 & 0x2000000000) != 0)
  {
    if ((v36 & 0x2000000000) == 0) {
      goto LABEL_500;
    }
    if (self->_deviceDarkMode)
    {
      if (!v4[729]) {
        goto LABEL_500;
      }
    }
    else if (v4[729])
    {
      goto LABEL_500;
    }
  }
  else if ((v36 & 0x2000000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v35 & 0x200000000) != 0)
  {
    if ((v36 & 0x200000000) == 0) {
      goto LABEL_500;
    }
    if (self->_appDarkMode)
    {
      if (!v4[725]) {
        goto LABEL_500;
      }
    }
    else if (v4[725])
    {
      goto LABEL_500;
    }
  }
  else if ((v36 & 0x200000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v35 & 0x800000000000000) != 0)
  {
    if ((v36 & 0x800000000000000) == 0) {
      goto LABEL_500;
    }
    if (self->_supportsBrandFallback)
    {
      if (!v4[751]) {
        goto LABEL_500;
      }
    }
    else if (v4[751])
    {
      goto LABEL_500;
    }
  }
  else if ((v36 & 0x800000000000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v35 & 0x800000) != 0)
  {
    if ((v36 & 0x800000) == 0 || self->_requestPurpose != *((_DWORD *)v4 + 172)) {
      goto LABEL_500;
    }
  }
  else if ((v36 & 0x800000) != 0)
  {
    goto LABEL_500;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_500:
    char v69 = 0;
    goto LABEL_501;
  }
  uint64_t v39 = (uint64_t)self->_flags;
  uint64_t v40 = *(void *)(v4 + 756);
  if ((v39 & 0x40000000000) != 0)
  {
    if ((v40 & 0x40000000000) == 0) {
      goto LABEL_500;
    }
    if (self->_isSettlement)
    {
      if (!v4[734]) {
        goto LABEL_500;
      }
    }
    else if (v4[734])
    {
      goto LABEL_500;
    }
  }
  else if ((v40 & 0x40000000000) != 0)
  {
    goto LABEL_500;
  }
  transitTripStopTimeFilter = self->_transitTripStopTimeFilter;
  if ((unint64_t)transitTripStopTimeFilter | *((void *)v4 + 72))
  {
    if (!-[GEOTraitsTransitScheduleFilter isEqual:](transitTripStopTimeFilter, "isEqual:")) {
      goto LABEL_500;
    }
    uint64_t v39 = (uint64_t)self->_flags;
    uint64_t v40 = *(void *)(v4 + 756);
  }
  if ((v39 & 0x20000000000000) != 0)
  {
    if ((v40 & 0x20000000000000) == 0) {
      goto LABEL_500;
    }
    if (self->_supportClientRankingFeatureMetadata)
    {
      if (!v4[745]) {
        goto LABEL_500;
      }
    }
    else if (v4[745])
    {
      goto LABEL_500;
    }
  }
  else if ((v40 & 0x20000000000000) != 0)
  {
    goto LABEL_500;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_500;
  }
  uint64_t v42 = (uint64_t)self->_flags;
  uint64_t v43 = *(void *)(v4 + 756);
  if ((v42 & 0x8000000000000) != 0)
  {
    if ((v43 & 0x8000000000000) == 0) {
      goto LABEL_500;
    }
    if (self->_supportChildItems)
    {
      if (!v4[743]) {
        goto LABEL_500;
      }
    }
    else if (v4[743])
    {
      goto LABEL_500;
    }
  }
  else if ((v43 & 0x8000000000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v42 & 0x10000000000) != 0)
  {
    if ((v43 & 0x10000000000) == 0) {
      goto LABEL_500;
    }
    if (self->_isRefund)
    {
      if (!v4[732]) {
        goto LABEL_500;
      }
    }
    else if (v4[732])
    {
      goto LABEL_500;
    }
  }
  else if ((v43 & 0x10000000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v42 & 0x800000000) != 0)
  {
    if ((v43 & 0x800000000) == 0) {
      goto LABEL_500;
    }
    if (self->_autocompleteRequestSupportsSectionHeader)
    {
      if (!v4[727]) {
        goto LABEL_500;
      }
    }
    else if (v4[727])
    {
      goto LABEL_500;
    }
  }
  else if ((v43 & 0x800000000) != 0)
  {
    goto LABEL_500;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_500;
  }
  uint64_t v44 = (uint64_t)self->_flags;
  uint64_t v45 = *(void *)(v4 + 756);
  if ((v44 & 0x8000) != 0)
  {
    if ((v45 & 0x8000) == 0 || self->_navigationTransportType != *((_DWORD *)v4 + 164)) {
      goto LABEL_500;
    }
  }
  else if ((v45 & 0x8000) != 0)
  {
    goto LABEL_500;
  }
  cyclingOptions = self->_cyclingOptions;
  if ((unint64_t)cyclingOptions | *((void *)v4 + 47))
  {
    if (!-[GEOCyclingOptions isEqual:](cyclingOptions, "isEqual:")) {
      goto LABEL_500;
    }
    uint64_t v44 = (uint64_t)self->_flags;
    uint64_t v45 = *(void *)(v4 + 756);
  }
  if ((v44 & 0x80000) != 0)
  {
    if ((v45 & 0x80000) == 0 || self->_ratingsCount != *((_DWORD *)v4 + 168)) {
      goto LABEL_500;
    }
  }
  else if ((v45 & 0x80000) != 0)
  {
    goto LABEL_500;
  }
  evChargingPorts = self->_evChargingPorts;
  if ((unint64_t)evChargingPorts | *((void *)v4 + 53))
  {
    if (!-[NSMutableArray isEqual:](evChargingPorts, "isEqual:")) {
      goto LABEL_500;
    }
    uint64_t v44 = (uint64_t)self->_flags;
    uint64_t v45 = *(void *)(v4 + 756);
  }
  if ((v44 & 0x80000000000) != 0)
  {
    if ((v45 & 0x80000000000) == 0) {
      goto LABEL_500;
    }
    if (self->_isWidgetRequest)
    {
      if (!v4[735]) {
        goto LABEL_500;
      }
    }
    else if (v4[735])
    {
      goto LABEL_500;
    }
  }
  else if ((v45 & 0x80000000000) != 0)
  {
    goto LABEL_500;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_500;
  }
  uint64_t v48 = (uint64_t)self->_flags;
  uint64_t v49 = *(void *)(v4 + 756);
  if ((v48 & 0x80) != 0)
  {
    if ((v49 & 0x80) == 0 || self->_auxiliaryTierNumResults != *((_DWORD *)v4 + 156)) {
      goto LABEL_500;
    }
  }
  else if ((v49 & 0x80) != 0)
  {
    goto LABEL_500;
  }
  if ((v48 & 0x40000) != 0)
  {
    if ((v49 & 0x40000) == 0 || self->_placeSummaryRevision != *((_DWORD *)v4 + 167)) {
      goto LABEL_500;
    }
  }
  else if ((v49 & 0x40000) != 0)
  {
    goto LABEL_500;
  }
  if ((v48 & 8) != 0)
  {
    if ((v49 & 8) == 0 || self->_isTourist != *((double *)v4 + 56)) {
      goto LABEL_500;
    }
  }
  else if ((v49 & 8) != 0)
  {
    goto LABEL_500;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_500;
  }
  uint64_t v50 = (uint64_t)self->_flags;
  uint64_t v51 = *(void *)(v4 + 756);
  if ((v50 & 0x4000000000000) != 0)
  {
    if ((v51 & 0x4000000000000) == 0) {
      goto LABEL_500;
    }
    if (self->_supportAutocompletePublisherResults)
    {
      if (!v4[742]) {
        goto LABEL_500;
      }
    }
    else if (v4[742])
    {
      goto LABEL_500;
    }
  }
  else if ((v51 & 0x4000000000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v50 & 0x2000000000000) != 0)
  {
    if ((v51 & 0x2000000000000) == 0) {
      goto LABEL_500;
    }
    if (self->_supportAutocompleteGuideResults)
    {
      if (!v4[741]) {
        goto LABEL_500;
      }
    }
    else if (v4[741])
    {
      goto LABEL_500;
    }
  }
  else if ((v51 & 0x2000000000000) != 0)
  {
    goto LABEL_500;
  }
  previousSearchViewport = self->_previousSearchViewport;
  if ((unint64_t)previousSearchViewport | *((void *)v4 + 60))
  {
    if (!-[GEOPDViewportInfo isEqual:](previousSearchViewport, "isEqual:")) {
      goto LABEL_500;
    }
    uint64_t v50 = (uint64_t)self->_flags;
    uint64_t v51 = *(void *)(v4 + 756);
  }
  if ((v50 & 0x10000) != 0)
  {
    if ((v51 & 0x10000) == 0 || self->_photoAlbumCount != *((_DWORD *)v4 + 165)) {
      goto LABEL_500;
    }
  }
  else if ((v51 & 0x10000) != 0)
  {
    goto LABEL_500;
  }
  resultRefinementQuery = self->_resultRefinementQuery;
  if ((unint64_t)resultRefinementQuery | *((void *)v4 + 64))
  {
    if (!-[GEOPDResultRefinementQuery isEqual:](resultRefinementQuery, "isEqual:")) {
      goto LABEL_500;
    }
    uint64_t v50 = (uint64_t)self->_flags;
    uint64_t v51 = *(void *)(v4 + 756);
  }
  if ((v50 & 0x100000) != 0)
  {
    if ((v51 & 0x100000) == 0 || self->_relatedPlaceItemCount != *((_DWORD *)v4 + 169)) {
      goto LABEL_500;
    }
  }
  else if ((v51 & 0x100000) != 0)
  {
    goto LABEL_500;
  }
  if ((v50 & 0x4000000) != 0)
  {
    if ((v51 & 0x4000000) == 0 || self->_searchRequestType != *((_DWORD *)v4 + 175)) {
      goto LABEL_500;
    }
  }
  else if ((v51 & 0x4000000) != 0)
  {
    goto LABEL_500;
  }
  currentLocaleCurrencySymbol = self->_currentLocaleCurrencySymbol;
  if ((unint64_t)currentLocaleCurrencySymbol | *((void *)v4 + 46)
    && !-[NSString isEqual:](currentLocaleCurrencySymbol, "isEqual:")
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_500;
  }
  uint64_t v55 = (uint64_t)self->_flags;
  uint64_t v56 = *(void *)(v4 + 756);
  if ((v55 & 0x40) != 0)
  {
    if ((v56 & 0x40) == 0 || self->_autocompleteOriginationType != *((_DWORD *)v4 + 155)) {
      goto LABEL_500;
    }
  }
  else if ((v56 & 0x40) != 0)
  {
    goto LABEL_500;
  }
  autocompleteOriginationPreviousLatlng = self->_autocompleteOriginationPreviousLatlng;
  if ((unint64_t)autocompleteOriginationPreviousLatlng | *((void *)v4 + 40))
  {
    if (!-[GEOLatLng isEqual:](autocompleteOriginationPreviousLatlng, "isEqual:")) {
      goto LABEL_500;
    }
    uint64_t v55 = (uint64_t)self->_flags;
    uint64_t v56 = *(void *)(v4 + 756);
  }
  if ((v55 & 0x8000000) != 0)
  {
    if ((v56 & 0x8000000) == 0 || self->_searchOriginationType != *((_DWORD *)v4 + 176)) {
      goto LABEL_500;
    }
  }
  else if ((v56 & 0x8000000) != 0)
  {
    goto LABEL_500;
  }
  searchOriginationPreviousLatlng = self->_searchOriginationPreviousLatlng;
  if ((unint64_t)searchOriginationPreviousLatlng | *((void *)v4 + 67)
    && !-[GEOLatLng isEqual:](searchOriginationPreviousLatlng, "isEqual:"))
  {
    goto LABEL_500;
  }
  addStopRouteInfo = self->_addStopRouteInfo;
  if ((unint64_t)addStopRouteInfo | *((void *)v4 + 35))
  {
    if (!-[GEOAddStopRouteInfo isEqual:](addStopRouteInfo, "isEqual:")) {
      goto LABEL_500;
    }
  }
  uint64_t v60 = (uint64_t)self->_flags;
  uint64_t v61 = *(void *)(v4 + 756);
  if ((v60 & 0x400000000) != 0)
  {
    if ((v61 & 0x400000000) == 0) {
      goto LABEL_500;
    }
    if (self->_autocompleteOriginationEditingServerWaypoints)
    {
      if (!v4[726]) {
        goto LABEL_500;
      }
    }
    else if (v4[726])
    {
      goto LABEL_500;
    }
  }
  else if ((v61 & 0x400000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v60 & 0x1000000000000) != 0)
  {
    if ((v61 & 0x1000000000000) == 0) {
      goto LABEL_500;
    }
    if (self->_searchOriginationEditingServerWaypoints)
    {
      if (!v4[740]) {
        goto LABEL_500;
      }
    }
    else if (v4[740])
    {
      goto LABEL_500;
    }
  }
  else if ((v61 & 0x1000000000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v60 & 0x10000000000000) != 0)
  {
    if ((v61 & 0x10000000000000) == 0) {
      goto LABEL_500;
    }
    if (self->_supportClientRankingCompositeFeatures)
    {
      if (!v4[744]) {
        goto LABEL_500;
      }
    }
    else if (v4[744])
    {
      goto LABEL_500;
    }
  }
  else if ((v61 & 0x10000000000000) != 0)
  {
    goto LABEL_500;
  }
  privacyMetadata = self->_privacyMetadata;
  if ((unint64_t)privacyMetadata | *((void *)v4 + 61))
  {
    if (!-[GEOPrivacyMetadata isEqual:](privacyMetadata, "isEqual:")) {
      goto LABEL_500;
    }
    uint64_t v60 = (uint64_t)self->_flags;
    uint64_t v61 = *(void *)(v4 + 756);
  }
  if ((v60 & 0x2000000) != 0)
  {
    if ((v61 & 0x2000000) == 0 || self->_routeStopCount != *((_DWORD *)v4 + 174)) {
      goto LABEL_500;
    }
  }
  else if ((v61 & 0x2000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v60 & 0x200000000000000) != 0)
  {
    if ((v61 & 0x200000000000000) == 0) {
      goto LABEL_500;
    }
    if (self->_supportStructuredRapAffordance)
    {
      if (!v4[749]) {
        goto LABEL_500;
      }
    }
    else if (v4[749])
    {
      goto LABEL_500;
    }
  }
  else if ((v61 & 0x200000000000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v60 & 0x20000000000) != 0)
  {
    if ((v61 & 0x20000000000) == 0) {
      goto LABEL_500;
    }
    if (self->_isRoutePlanningEditStopFillRequest)
    {
      if (!v4[733]) {
        goto LABEL_500;
      }
    }
    else if (v4[733])
    {
      goto LABEL_500;
    }
  }
  else if ((v61 & 0x20000000000) != 0)
  {
    goto LABEL_500;
  }
  if (!PBRepeatedUInt64IsEqual()) {
    goto LABEL_500;
  }
  uint64_t v63 = (uint64_t)self->_flags;
  uint64_t v64 = *(void *)(v4 + 756);
  if ((v63 & 0x100000000000) != 0)
  {
    if ((v64 & 0x100000000000) == 0) {
      goto LABEL_500;
    }
    if (self->_isWithinHikingBoundary)
    {
      if (!v4[736]) {
        goto LABEL_500;
      }
    }
    else if (v4[736])
    {
      goto LABEL_500;
    }
  }
  else if ((v64 & 0x100000000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v63 & 0x200000000000) != 0)
  {
    if ((v64 & 0x200000000000) == 0) {
      goto LABEL_500;
    }
    if (self->_isWithinHikingBufferRegion)
    {
      if (!v4[737]) {
        goto LABEL_500;
      }
    }
    else if (v4[737])
    {
      goto LABEL_500;
    }
  }
  else if ((v64 & 0x200000000000) != 0)
  {
    goto LABEL_500;
  }
  searchImplicitFilterInfo = self->_searchImplicitFilterInfo;
  if ((unint64_t)searchImplicitFilterInfo | *((void *)v4 + 66))
  {
    if (!-[GEOSearchImplicitFilterInfo isEqual:](searchImplicitFilterInfo, "isEqual:")) {
      goto LABEL_500;
    }
    uint64_t v63 = (uint64_t)self->_flags;
    uint64_t v64 = *(void *)(v4 + 756);
  }
  if ((v63 & 0x1000) != 0)
  {
    if ((v64 & 0x1000) == 0 || self->_devicePlatform != *((_DWORD *)v4 + 161)) {
      goto LABEL_500;
    }
  }
  else if ((v64 & 0x1000) != 0)
  {
    goto LABEL_500;
  }
  if ((v63 & 0x1000000000) != 0)
  {
    if ((v64 & 0x1000000000) == 0) {
      goto LABEL_500;
    }
    if (self->_containsSensitiveData)
    {
      if (!v4[728]) {
        goto LABEL_500;
      }
    }
    else if (v4[728])
    {
      goto LABEL_500;
    }
  }
  else if ((v64 & 0x1000000000) != 0)
  {
    goto LABEL_500;
  }
  spotlightSearchPunchinEncodedString = self->_spotlightSearchPunchinEncodedString;
  if ((unint64_t)spotlightSearchPunchinEncodedString | *((void *)v4 + 69))
  {
    if (!-[NSString isEqual:](spotlightSearchPunchinEncodedString, "isEqual:")) {
      goto LABEL_500;
    }
    uint64_t v63 = (uint64_t)self->_flags;
    uint64_t v64 = *(void *)(v4 + 756);
  }
  if ((v63 & 0x800000000000) != 0)
  {
    if ((v64 & 0x800000000000) == 0) {
      goto LABEL_500;
    }
    if (self->_optimizeSearchRequestComponents)
    {
      if (!v4[739]) {
        goto LABEL_500;
      }
    }
    else if (v4[739])
    {
      goto LABEL_500;
    }
  }
  else if ((v64 & 0x800000000000) != 0)
  {
    goto LABEL_500;
  }
  recentAutocompleteSessionData = self->_recentAutocompleteSessionData;
  if ((unint64_t)recentAutocompleteSessionData | *((void *)v4 + 63))
  {
    if (!-[GEOPDAutocompleteSessionData isEqual:](recentAutocompleteSessionData, "isEqual:")) {
      goto LABEL_500;
    }
    uint64_t v63 = (uint64_t)self->_flags;
    uint64_t v64 = *(void *)(v4 + 756);
  }
  if ((v63 & 0x100000000) != 0)
  {
    if ((v64 & 0x100000000) == 0) {
      goto LABEL_500;
    }
    if (self->_analyticsOptOut)
    {
      if (!v4[724]) {
        goto LABEL_500;
      }
    }
    else if (v4[724])
    {
      goto LABEL_500;
    }
  }
  else if ((v64 & 0x100000000) != 0)
  {
    goto LABEL_500;
  }
  userActionMetadata = self->_userActionMetadata;
  if ((unint64_t)userActionMetadata | *((void *)v4 + 73))
  {
    if (!-[GEOPDSSessionUserActionMetadata isEqual:](userActionMetadata, "isEqual:")) {
      goto LABEL_500;
    }
    uint64_t v63 = (uint64_t)self->_flags;
    uint64_t v64 = *(void *)(v4 + 756);
  }
  if ((v63 & 0x2000000000000000) != 0)
  {
    if ((v64 & 0x2000000000000000) != 0)
    {
      if (self->_wantsRouteCreationTip)
      {
        if (v4[753]) {
          goto LABEL_503;
        }
      }
      else if (!v4[753])
      {
        goto LABEL_503;
      }
    }
    goto LABEL_500;
  }
  if ((v64 & 0x2000000000000000) != 0) {
    goto LABEL_500;
  }
LABEL_503:
  hardwareIdentifier = self->_hardwareIdentifier;
  if ((unint64_t)hardwareIdentifier | *((void *)v4 + 54)) {
    char v69 = -[NSString isEqual:](hardwareIdentifier, "isEqual:");
  }
  else {
    char v69 = 1;
  }
LABEL_501:

  return v69;
}

- (unint64_t)hash
{
  [(GEOMapServiceTraits *)self readAll:1];
  uint64_t flags = (uint64_t)self->_flags;
  if (flags)
  {
    uint64_t v157 = PBHashBytes();
    uint64_t flags = (uint64_t)self->_flags;
  }
  else
  {
    uint64_t v157 = 0;
  }
  if ((flags & 0x10000000) != 0) {
    uint64_t v156 = 2654435761 * self->_sequenceNumber;
  }
  else {
    uint64_t v156 = 0;
  }
  NSUInteger v155 = [(NSString *)self->_appIdentifier hash];
  NSUInteger v154 = [(NSString *)self->_appMajorVersion hash];
  NSUInteger v153 = [(NSString *)self->_appMinorVersion hash];
  unint64_t v152 = [(GEOLocation *)self->_deviceLocation hash];
  uint64_t v151 = PBRepeatedInt32Hash();
  unint64_t v150 = [(GEOMapRegion *)self->_mapRegion hash];
  uint64_t v149 = [(NSMutableArray *)self->_deviceDisplayLanguages hash];
  NSUInteger v148 = [(NSString *)self->_deviceKeyboardLocale hash];
  NSUInteger v147 = [(NSString *)self->_deviceSpokenLocale hash];
  uint64_t v4 = (uint64_t)self->_flags;
  if ((v4 & 0x8000000000) != 0)
  {
    uint64_t v146 = 2654435761 * self->_isAPICall;
    if ((v4 & 0x20000000) != 0) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v146 = 0;
    if ((v4 & 0x20000000) != 0)
    {
LABEL_9:
      uint64_t v145 = 2654435761 * self->_source;
      goto LABEL_12;
    }
  }
  uint64_t v145 = 0;
LABEL_12:
  uint64_t v144 = [(NSMutableArray *)self->_photoSizes hash];
  p_uint64_t flags = &self->_flags;
  if ((*((unsigned char *)&self->_flags + 2) & 2) != 0) {
    uint64_t v143 = 2654435761 * self->_photosCount;
  }
  else {
    uint64_t v143 = 0;
  }
  uint64_t v142 = [(NSMutableArray *)self->_reviewUserPhotoSizes hash];
  uint64_t v6 = *(void *)p_flags;
  if ((*(void *)p_flags & 0x1000000) != 0)
  {
    uint64_t v141 = 2654435761 * self->_reviewUserPhotosCount;
    if ((v6 & 0x40000000) != 0)
    {
LABEL_17:
      uint64_t v140 = 2654435761 * self->_timeSinceMapEnteredForeground;
      if ((v6 & 0x80000000) != 0) {
        goto LABEL_18;
      }
LABEL_22:
      uint64_t v139 = 0;
      if ((v6 & 0x200) != 0) {
        goto LABEL_19;
      }
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v141 = 0;
    if ((v6 & 0x40000000) != 0) {
      goto LABEL_17;
    }
  }
  uint64_t v140 = 0;
  if ((v6 & 0x80000000) == 0) {
    goto LABEL_22;
  }
LABEL_18:
  uint64_t v139 = 2654435761 * self->_timeSinceMapViewportChanged;
  if ((v6 & 0x200) != 0)
  {
LABEL_19:
    uint64_t v138 = 2654435761 * self->_carHeadunitInteractionModel;
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v138 = 0;
LABEL_24:
  NSUInteger v137 = [(NSString *)self->_carHeadunitManufacturer hash];
  NSUInteger v136 = [(NSString *)self->_carHeadunitModel hash];
  uint64_t v7 = (uint64_t)self->_flags;
  if ((v7 & 4) != 0)
  {
    double carHeadunitPixelWidth = self->_carHeadunitPixelWidth;
    double v10 = -carHeadunitPixelWidth;
    if (carHeadunitPixelWidth >= 0.0) {
      double v10 = self->_carHeadunitPixelWidth;
    }
    long double v11 = floor(v10 + 0.5);
    double v12 = (v10 - v11) * 1.84467441e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0) {
        v8 += (unint64_t)v12;
      }
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  unint64_t v135 = v8;
  if ((v7 & 2) != 0)
  {
    double carHeadunitPixelHeight = self->_carHeadunitPixelHeight;
    double v15 = -carHeadunitPixelHeight;
    if (carHeadunitPixelHeight >= 0.0) {
      double v15 = self->_carHeadunitPixelHeight;
    }
    long double v16 = floor(v15 + 0.5);
    double v17 = (v15 - v16) * 1.84467441e19;
    unint64_t v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0) {
        v13 += (unint64_t)v17;
      }
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    unint64_t v13 = 0;
  }
  unint64_t v134 = v13;
  unint64_t v133 = [(GEOTraitsTransitScheduleFilter *)self->_transitScheduleFilter hash];
  uint64_t v18 = (uint64_t)self->_flags;
  if ((v18 & 0x10) != 0)
  {
    double mapZoomLevel = self->_mapZoomLevel;
    double v21 = -mapZoomLevel;
    if (mapZoomLevel >= 0.0) {
      double v21 = self->_mapZoomLevel;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  unint64_t v132 = v19;
  if ((v18 & 0x4000) != 0) {
    uint64_t v131 = 2654435761 * self->_mode;
  }
  else {
    uint64_t v131 = 0;
  }
  NSUInteger v130 = [(NSString *)self->_displayRegion hash];
  NSUInteger v129 = [(NSString *)self->_providerID hash];
  uint64_t v24 = (uint64_t)self->_flags;
  if ((v24 & 0x800) != 0)
  {
    uint64_t v128 = 2654435761 * self->_deviceInterfaceOrientation;
    if ((v24 & 0x400) != 0)
    {
LABEL_53:
      uint64_t v127 = 2654435761 * self->_deviceBatteryState;
      if ((v24 & 0x100) != 0) {
        goto LABEL_54;
      }
LABEL_58:
      uint64_t v126 = 0;
      if ((v24 & 0x400000000000) != 0) {
        goto LABEL_55;
      }
      goto LABEL_59;
    }
  }
  else
  {
    uint64_t v128 = 0;
    if ((v24 & 0x400) != 0) {
      goto LABEL_53;
    }
  }
  uint64_t v127 = 0;
  if ((v24 & 0x100) == 0) {
    goto LABEL_58;
  }
LABEL_54:
  uint64_t v126 = 2654435761 * self->_carHeadunitConnectionType;
  if ((v24 & 0x400000000000) != 0)
  {
LABEL_55:
    uint64_t v125 = 2654435761 * self->_navigating;
    goto LABEL_60;
  }
LABEL_59:
  uint64_t v125 = 0;
LABEL_60:
  uint64_t v124 = [(NSMutableArray *)self->_historicalLocations hash];
  unint64_t v123 = [(GEOAutomobileOptions *)self->_automobileOptions hash];
  unint64_t v122 = [(GEOTransitOptions *)self->_transitOptions hash];
  unint64_t v121 = [(GEOWalkingOptions *)self->_walkingOptions hash];
  uint64_t v120 = PBRepeatedInt32Hash();
  uint64_t v25 = (uint64_t)self->_flags;
  if ((v25 & 0x200000) == 0)
  {
    uint64_t v119 = 0;
    if ((v25 & 0x80000000000000) != 0) {
      goto LABEL_62;
    }
LABEL_65:
    uint64_t v118 = 0;
    if ((v25 & 0x100000000000000) != 0) {
      goto LABEL_63;
    }
    goto LABEL_66;
  }
  uint64_t v119 = 2654435761 * self->_requestMode;
  if ((v25 & 0x80000000000000) == 0) {
    goto LABEL_65;
  }
LABEL_62:
  uint64_t v118 = 2654435761 * self->_supportDirectionIntentSearch;
  if ((v25 & 0x100000000000000) != 0)
  {
LABEL_63:
    uint64_t v117 = 2654435761 * self->_supportDymSuggestion;
    goto LABEL_67;
  }
LABEL_66:
  uint64_t v117 = 0;
LABEL_67:
  uint64_t v116 = PBRepeatedInt32Hash();
  uint64_t v26 = &self->_flags;
  if ((*((unsigned char *)&self->_flags + 7) & 0x10) != 0) {
    uint64_t v115 = 2654435761 * self->_wantsBrandIcon;
  }
  else {
    uint64_t v115 = 0;
  }
  unint64_t v114 = [(GEOPDVenueIdentifier *)self->_venueIdentifier hash];
  uint64_t v27 = *(void *)v26;
  if ((*(void *)v26 & 0x4000000000) == 0)
  {
    uint64_t v113 = 0;
    if ((v27 & 0x400000) != 0) {
      goto LABEL_72;
    }
LABEL_75:
    uint64_t v112 = 0;
    if ((v27 & 0x2000) != 0) {
      goto LABEL_73;
    }
    goto LABEL_76;
  }
  uint64_t v113 = 2654435761 * self->_deviceInVehicle;
  if ((v27 & 0x400000) == 0) {
    goto LABEL_75;
  }
LABEL_72:
  uint64_t v112 = 2654435761 * self->_requestPriority;
  if ((v27 & 0x2000) != 0)
  {
LABEL_73:
    uint64_t v111 = 2654435761 * self->_httpRequestPriority;
    goto LABEL_77;
  }
LABEL_76:
  uint64_t v111 = 0;
LABEL_77:
  NSUInteger v110 = [(NSString *)self->_analyticsAppIdentifier hash];
  uint64_t v28 = (uint64_t)self->_flags;
  if ((v28 & 0x20) != 0)
  {
    double sessionRelativeTimestamp = self->_sessionRelativeTimestamp;
    double v31 = -sessionRelativeTimestamp;
    if (sessionRelativeTimestamp >= 0.0) {
      double v31 = self->_sessionRelativeTimestamp;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if ((v28 & 0x40000000000000) != 0)
  {
    uint64_t v108 = 2654435761 * self->_supportDirectionIntentAutocomplete;
    if ((v28 & 0x400000000000000) != 0)
    {
LABEL_87:
      uint64_t v107 = 2654435761 * self->_supportUnresolvedDirectionIntent;
      if ((v28 & 0x2000000000) != 0) {
        goto LABEL_88;
      }
      goto LABEL_93;
    }
  }
  else
  {
    uint64_t v108 = 0;
    if ((v28 & 0x400000000000000) != 0) {
      goto LABEL_87;
    }
  }
  uint64_t v107 = 0;
  if ((v28 & 0x2000000000) != 0)
  {
LABEL_88:
    uint64_t v106 = 2654435761 * self->_deviceDarkMode;
    if ((v28 & 0x200000000) != 0) {
      goto LABEL_89;
    }
LABEL_94:
    uint64_t v105 = 0;
    if ((v28 & 0x800000000000000) != 0) {
      goto LABEL_90;
    }
    goto LABEL_95;
  }
LABEL_93:
  uint64_t v106 = 0;
  if ((v28 & 0x200000000) == 0) {
    goto LABEL_94;
  }
LABEL_89:
  uint64_t v105 = 2654435761 * self->_appDarkMode;
  if ((v28 & 0x800000000000000) != 0)
  {
LABEL_90:
    uint64_t v104 = 2654435761 * self->_supportsBrandFallback;
    goto LABEL_96;
  }
LABEL_95:
  uint64_t v104 = 0;
LABEL_96:
  unint64_t v109 = v29;
  if ((v28 & 0x800000) != 0) {
    uint64_t v103 = 2654435761 * self->_requestPurpose;
  }
  else {
    uint64_t v103 = 0;
  }
  uint64_t v102 = PBRepeatedInt32Hash();
  if ((*((unsigned char *)&self->_flags + 5) & 4) != 0) {
    uint64_t v101 = 2654435761 * self->_isSettlement;
  }
  else {
    uint64_t v101 = 0;
  }
  unint64_t v100 = [(GEOTraitsTransitScheduleFilter *)self->_transitTripStopTimeFilter hash];
  if ((*((unsigned char *)&self->_flags + 6) & 0x20) != 0) {
    uint64_t v99 = 2654435761 * self->_supportClientRankingFeatureMetadata;
  }
  else {
    uint64_t v99 = 0;
  }
  uint64_t v98 = PBRepeatedInt32Hash();
  uint64_t v34 = (uint64_t)self->_flags;
  if ((v34 & 0x8000000000000) == 0)
  {
    uint64_t v97 = 0;
    if ((v34 & 0x10000000000) != 0) {
      goto LABEL_107;
    }
LABEL_110:
    uint64_t v96 = 0;
    if ((v34 & 0x800000000) != 0) {
      goto LABEL_108;
    }
    goto LABEL_111;
  }
  uint64_t v97 = 2654435761 * self->_supportChildItems;
  if ((v34 & 0x10000000000) == 0) {
    goto LABEL_110;
  }
LABEL_107:
  uint64_t v96 = 2654435761 * self->_isRefund;
  if ((v34 & 0x800000000) != 0)
  {
LABEL_108:
    uint64_t v95 = 2654435761 * self->_autocompleteRequestSupportsSectionHeader;
    goto LABEL_112;
  }
LABEL_111:
  uint64_t v95 = 0;
LABEL_112:
  uint64_t v94 = PBRepeatedInt32Hash();
  if ((*((unsigned char *)&self->_flags + 1) & 0x80) != 0) {
    uint64_t v93 = 2654435761 * self->_navigationTransportType;
  }
  else {
    uint64_t v93 = 0;
  }
  unint64_t v92 = [(GEOCyclingOptions *)self->_cyclingOptions hash];
  if ((*((unsigned char *)&self->_flags + 2) & 8) != 0) {
    uint64_t v91 = 2654435761 * self->_ratingsCount;
  }
  else {
    uint64_t v91 = 0;
  }
  uint64_t v90 = [(NSMutableArray *)self->_evChargingPorts hash];
  uint64_t v35 = &self->_flags;
  if ((*((unsigned char *)&self->_flags + 5) & 8) != 0) {
    uint64_t v89 = 2654435761 * self->_isWidgetRequest;
  }
  else {
    uint64_t v89 = 0;
  }
  uint64_t v88 = PBRepeatedInt32Hash();
  uint64_t v36 = *(void *)v35;
  if ((*(void *)v35 & 0x80) == 0)
  {
    uint64_t v87 = 0;
    if ((v36 & 0x40000) != 0) {
      goto LABEL_123;
    }
LABEL_129:
    uint64_t v86 = 0;
    if ((v36 & 8) != 0) {
      goto LABEL_124;
    }
LABEL_130:
    unint64_t v41 = 0;
    goto LABEL_133;
  }
  uint64_t v87 = 2654435761 * self->_auxiliaryTierNumResults;
  if ((v36 & 0x40000) == 0) {
    goto LABEL_129;
  }
LABEL_123:
  uint64_t v86 = 2654435761 * self->_placeSummaryRevision;
  if ((v36 & 8) == 0) {
    goto LABEL_130;
  }
LABEL_124:
  double isTourist = self->_isTourist;
  double v38 = -isTourist;
  if (isTourist >= 0.0) {
    double v38 = self->_isTourist;
  }
  long double v39 = floor(v38 + 0.5);
  double v40 = (v38 - v39) * 1.84467441e19;
  unint64_t v41 = 2654435761u * (unint64_t)fmod(v39, 1.84467441e19);
  if (v40 >= 0.0)
  {
    if (v40 > 0.0) {
      v41 += (unint64_t)v40;
    }
  }
  else
  {
    v41 -= (unint64_t)fabs(v40);
  }
LABEL_133:
  unint64_t v85 = v41;
  uint64_t v84 = PBRepeatedInt32Hash();
  uint64_t v42 = (uint64_t)self->_flags;
  if ((v42 & 0x4000000000000) != 0)
  {
    uint64_t v83 = 2654435761 * self->_supportAutocompletePublisherResults;
    if ((v42 & 0x2000000000000) != 0) {
      goto LABEL_135;
    }
  }
  else
  {
    uint64_t v83 = 0;
    if ((v42 & 0x2000000000000) != 0)
    {
LABEL_135:
      uint64_t v82 = 2654435761 * self->_supportAutocompleteGuideResults;
      goto LABEL_138;
    }
  }
  uint64_t v82 = 0;
LABEL_138:
  unint64_t v81 = [(GEOPDViewportInfo *)self->_previousSearchViewport hash];
  uint64_t v43 = &self->_flags;
  if (*((unsigned char *)&self->_flags + 2)) {
    uint64_t v80 = 2654435761 * self->_photoAlbumCount;
  }
  else {
    uint64_t v80 = 0;
  }
  unint64_t v79 = [(GEOPDResultRefinementQuery *)self->_resultRefinementQuery hash];
  uint64_t v44 = *(void *)v43;
  if ((*(void *)v43 & 0x100000) != 0)
  {
    uint64_t v78 = 2654435761 * self->_relatedPlaceItemCount;
    if ((v44 & 0x4000000) != 0) {
      goto LABEL_143;
    }
  }
  else
  {
    uint64_t v78 = 0;
    if ((v44 & 0x4000000) != 0)
    {
LABEL_143:
      uint64_t v77 = 2654435761 * self->_searchRequestType;
      goto LABEL_146;
    }
  }
  uint64_t v77 = 0;
LABEL_146:
  NSUInteger v76 = [(NSString *)self->_currentLocaleCurrencySymbol hash];
  uint64_t v75 = PBRepeatedInt32Hash();
  if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
    uint64_t v74 = 2654435761 * self->_autocompleteOriginationType;
  }
  else {
    uint64_t v74 = 0;
  }
  unint64_t v73 = [(GEOLatLng *)self->_autocompleteOriginationPreviousLatlng hash];
  uint64_t v45 = &self->_flags;
  if ((*((unsigned char *)&self->_flags + 3) & 8) != 0) {
    uint64_t v72 = 2654435761 * self->_searchOriginationType;
  }
  else {
    uint64_t v72 = 0;
  }
  unint64_t v71 = [(GEOLatLng *)self->_searchOriginationPreviousLatlng hash];
  unint64_t v70 = [(GEOAddStopRouteInfo *)self->_addStopRouteInfo hash];
  uint64_t v46 = *(void *)v45;
  if ((*(void *)v45 & 0x400000000) == 0)
  {
    uint64_t v69 = 0;
    if ((v46 & 0x1000000000000) != 0) {
      goto LABEL_154;
    }
LABEL_157:
    uint64_t v68 = 0;
    if ((v46 & 0x10000000000000) != 0) {
      goto LABEL_155;
    }
    goto LABEL_158;
  }
  uint64_t v69 = 2654435761 * self->_autocompleteOriginationEditingServerWaypoints;
  if ((v46 & 0x1000000000000) == 0) {
    goto LABEL_157;
  }
LABEL_154:
  uint64_t v68 = 2654435761 * self->_searchOriginationEditingServerWaypoints;
  if ((v46 & 0x10000000000000) != 0)
  {
LABEL_155:
    uint64_t v67 = 2654435761 * self->_supportClientRankingCompositeFeatures;
    goto LABEL_159;
  }
LABEL_158:
  uint64_t v67 = 0;
LABEL_159:
  unint64_t v66 = [(GEOPrivacyMetadata *)self->_privacyMetadata hash];
  uint64_t v47 = (uint64_t)self->_flags;
  if ((v47 & 0x2000000) == 0)
  {
    uint64_t v65 = 0;
    if ((v47 & 0x200000000000000) != 0) {
      goto LABEL_161;
    }
LABEL_164:
    uint64_t v64 = 0;
    if ((v47 & 0x20000000000) != 0) {
      goto LABEL_162;
    }
    goto LABEL_165;
  }
  uint64_t v65 = 2654435761 * self->_routeStopCount;
  if ((v47 & 0x200000000000000) == 0) {
    goto LABEL_164;
  }
LABEL_161:
  uint64_t v64 = 2654435761 * self->_supportStructuredRapAffordance;
  if ((v47 & 0x20000000000) != 0)
  {
LABEL_162:
    uint64_t v63 = 2654435761 * self->_isRoutePlanningEditStopFillRequest;
    goto LABEL_166;
  }
LABEL_165:
  uint64_t v63 = 0;
LABEL_166:
  uint64_t v62 = PBRepeatedUInt64Hash();
  uint64_t v48 = (uint64_t)self->_flags;
  if ((v48 & 0x100000000000) != 0)
  {
    uint64_t v61 = 2654435761 * self->_isWithinHikingBoundary;
    if ((v48 & 0x200000000000) != 0) {
      goto LABEL_168;
    }
  }
  else
  {
    uint64_t v61 = 0;
    if ((v48 & 0x200000000000) != 0)
    {
LABEL_168:
      uint64_t v60 = 2654435761 * self->_isWithinHikingBufferRegion;
      goto LABEL_171;
    }
  }
  uint64_t v60 = 0;
LABEL_171:
  unint64_t v49 = [(GEOSearchImplicitFilterInfo *)self->_searchImplicitFilterInfo hash];
  uint64_t v50 = (uint64_t)self->_flags;
  if ((v50 & 0x1000) != 0)
  {
    uint64_t v51 = 2654435761 * self->_devicePlatform;
    if ((v50 & 0x1000000000) != 0) {
      goto LABEL_173;
    }
  }
  else
  {
    uint64_t v51 = 0;
    if ((v50 & 0x1000000000) != 0)
    {
LABEL_173:
      uint64_t v52 = 2654435761 * self->_containsSensitiveData;
      goto LABEL_176;
    }
  }
  uint64_t v52 = 0;
LABEL_176:
  NSUInteger v53 = [(NSString *)self->_spotlightSearchPunchinEncodedString hash];
  if ((*((unsigned char *)&self->_flags + 5) & 0x80) != 0) {
    uint64_t v54 = 2654435761 * self->_optimizeSearchRequestComponents;
  }
  else {
    uint64_t v54 = 0;
  }
  unint64_t v55 = [(GEOPDAutocompleteSessionData *)self->_recentAutocompleteSessionData hash];
  if (*((unsigned char *)&self->_flags + 4)) {
    uint64_t v56 = 2654435761 * self->_analyticsOptOut;
  }
  else {
    uint64_t v56 = 0;
  }
  unint64_t v57 = [(GEOPDSSessionUserActionMetadata *)self->_userActionMetadata hash];
  if ((*((unsigned char *)&self->_flags + 7) & 0x20) != 0) {
    uint64_t v58 = 2654435761 * self->_wantsRouteCreationTip;
  }
  else {
    uint64_t v58 = 0;
  }
  return v156 ^ v157 ^ v155 ^ v154 ^ v153 ^ v152 ^ v151 ^ v150 ^ v149 ^ v148 ^ v147 ^ v146 ^ v145 ^ v144 ^ v143 ^ v142 ^ v141 ^ v140 ^ v139 ^ v138 ^ v137 ^ v136 ^ v135 ^ v134 ^ v133 ^ v132 ^ v131 ^ v130 ^ v129 ^ v128 ^ v127 ^ v126 ^ v125 ^ v124 ^ v123 ^ v122 ^ v121 ^ v120 ^ v119 ^ v118 ^ v117 ^ v116 ^ v115 ^ v114 ^ v113 ^ v112 ^ v111 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v49 ^ v51 ^ v52 ^ v53 ^ v54 ^ v55 ^ v56 ^ v57 ^ v58 ^ [(NSString *)self->_hardwareIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (char *)a3;
  [v4 readAll:0];
  uint64_t v5 = *(void *)(v4 + 756);
  if (v5)
  {
    self->_sessionId = *(GEOSessionID *)(v4 + 264);
    *(void *)&self->_flags |= 1uLL;
    uint64_t v5 = *(void *)(v4 + 756);
  }
  if ((v5 & 0x10000000) != 0)
  {
    self->_sequenceNumber = *((_DWORD *)v4 + 177);
    *(void *)&self->_flags |= 0x10000000uLL;
  }
  if (*((void *)v4 + 37)) {
    -[GEOMapServiceTraits setAppIdentifier:](self, "setAppIdentifier:");
  }
  if (*((void *)v4 + 38)) {
    -[GEOMapServiceTraits setAppMajorVersion:](self, "setAppMajorVersion:");
  }
  if (*((void *)v4 + 39)) {
    -[GEOMapServiceTraits setAppMinorVersion:](self, "setAppMinorVersion:");
  }
  deviceLocatiouint64_t n = self->_deviceLocation;
  uint64_t v7 = *((void *)v4 + 48);
  if (deviceLocation)
  {
    if (v7) {
      -[GEOLocation mergeFrom:](deviceLocation, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOMapServiceTraits setDeviceLocation:](self, "setDeviceLocation:");
  }
  uint64_t v8 = [v4 transportTypesCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t i = 0; i != v9; ++i)
      -[GEOMapServiceTraits addTransportType:](self, "addTransportType:", [v4 transportTypeAtIndex:i]);
  }
  mapRegiouint64_t n = self->_mapRegion;
  uint64_t v12 = *((void *)v4 + 57);
  if (mapRegion)
  {
    if (v12) {
      -[GEOMapRegion mergeFrom:](mapRegion, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[GEOMapServiceTraits setMapRegion:](self, "setMapRegion:");
  }
  long long v140 = 0u;
  long long v141 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  id v13 = *((id *)v4 + 49);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v138 objects:v146 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v139;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v139 != v16) {
          objc_enumerationMutation(v13);
        }
        [(GEOMapServiceTraits *)self addDeviceDisplayLanguage:*(void *)(*((void *)&v138 + 1) + 8 * j)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v138 objects:v146 count:16];
    }
    while (v15);
  }

  if (*((void *)v4 + 50)) {
    -[GEOMapServiceTraits setDeviceKeyboardLocale:](self, "setDeviceKeyboardLocale:");
  }
  if (*((void *)v4 + 51)) {
    -[GEOMapServiceTraits setDeviceSpokenLocale:](self, "setDeviceSpokenLocale:");
  }
  uint64_t v18 = *(void *)(v4 + 756);
  if ((v18 & 0x8000000000) != 0)
  {
    self->_isAPICall = v4[731];
    *(void *)&self->_flags |= 0x8000000000uLL;
    uint64_t v18 = *(void *)(v4 + 756);
  }
  if ((v18 & 0x20000000) != 0)
  {
    self->_source = *((_DWORD *)v4 + 178);
    *(void *)&self->_flags |= 0x20000000uLL;
  }
  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  id v19 = *((id *)v4 + 59);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v134 objects:v145 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v135;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v135 != v22) {
          objc_enumerationMutation(v19);
        }
        [(GEOMapServiceTraits *)self addPhotoSizes:*(void *)(*((void *)&v134 + 1) + 8 * k)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v134 objects:v145 count:16];
    }
    while (v21);
  }

  if ((v4[758] & 2) != 0)
  {
    self->_photosCount = *((_DWORD *)v4 + 166);
    *(void *)&self->_flags |= 0x20000uLL;
  }
  long long v132 = 0u;
  long long v133 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  id v24 = *((id *)v4 + 65);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v130 objects:v144 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v131;
    do
    {
      for (uint64_t m = 0; m != v26; ++m)
      {
        if (*(void *)v131 != v27) {
          objc_enumerationMutation(v24);
        }
        [(GEOMapServiceTraits *)self addReviewUserPhotoSizes:*(void *)(*((void *)&v130 + 1) + 8 * m)];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v130 objects:v144 count:16];
    }
    while (v26);
  }

  unint64_t v29 = (uint64_t *)(v4 + 756);
  uint64_t v30 = *(void *)(v4 + 756);
  if ((v30 & 0x1000000) != 0)
  {
    self->_reviewUserPhotosCount = *((_DWORD *)v4 + 173);
    *(void *)&self->_flags |= 0x1000000uLL;
    uint64_t v30 = *v29;
    if ((*v29 & 0x40000000) == 0)
    {
LABEL_57:
      if ((v30 & 0x80000000) == 0) {
        goto LABEL_58;
      }
      goto LABEL_73;
    }
  }
  else if ((v30 & 0x40000000) == 0)
  {
    goto LABEL_57;
  }
  self->_timeSinceMapEnteredForeground = *((_DWORD *)v4 + 179);
  *(void *)&self->_flags |= 0x40000000uLL;
  uint64_t v30 = *(void *)(v4 + 756);
  if ((v30 & 0x80000000) == 0)
  {
LABEL_58:
    if ((v30 & 0x200) == 0) {
      goto LABEL_60;
    }
    goto LABEL_59;
  }
LABEL_73:
  self->_timeSinceMapViewportChanged = *((_DWORD *)v4 + 180);
  *(void *)&self->_flags |= 0x80000000uLL;
  if ((*(void *)(v4 + 756) & 0x200) != 0)
  {
LABEL_59:
    self->_carHeadunitInteractionModel = *((_DWORD *)v4 + 158);
    *(void *)&self->_flags |= 0x200uLL;
  }
LABEL_60:
  if (*((void *)v4 + 42)) {
    -[GEOMapServiceTraits setCarHeadunitManufacturer:](self, "setCarHeadunitManufacturer:");
  }
  if (*((void *)v4 + 43)) {
    -[GEOMapServiceTraits setCarHeadunitModel:](self, "setCarHeadunitModel:");
  }
  uint64_t v31 = *(void *)(v4 + 756);
  if ((v31 & 4) != 0)
  {
    self->_double carHeadunitPixelWidth = *((double *)v4 + 45);
    *(void *)&self->_flags |= 4uLL;
    uint64_t v31 = *(void *)(v4 + 756);
  }
  if ((v31 & 2) != 0)
  {
    self->_double carHeadunitPixelHeight = *((double *)v4 + 44);
    *(void *)&self->_flags |= 2uLL;
  }
  transitScheduleFilter = self->_transitScheduleFilter;
  uint64_t v33 = *((void *)v4 + 71);
  if (transitScheduleFilter)
  {
    if (v33) {
      -[GEOTraitsTransitScheduleFilter mergeFrom:](transitScheduleFilter, "mergeFrom:");
    }
  }
  else if (v33)
  {
    -[GEOMapServiceTraits setTransitScheduleFilter:](self, "setTransitScheduleFilter:");
  }
  uint64_t v34 = *(void *)(v4 + 756);
  if ((v34 & 0x10) != 0)
  {
    self->_double mapZoomLevel = *((double *)v4 + 58);
    *(void *)&self->_flags |= 0x10uLL;
    uint64_t v34 = *(void *)(v4 + 756);
  }
  if ((v34 & 0x4000) != 0)
  {
    self->_mode = *((_DWORD *)v4 + 163);
    *(void *)&self->_flags |= 0x4000uLL;
  }
  if (*((void *)v4 + 52)) {
    -[GEOMapServiceTraits setDisplayRegion:](self, "setDisplayRegion:");
  }
  if (*((void *)v4 + 62)) {
    -[GEOMapServiceTraits setProviderID:](self, "setProviderID:");
  }
  uint64_t v35 = (uint64_t *)(v4 + 756);
  uint64_t v36 = *(void *)(v4 + 756);
  if ((v36 & 0x800) != 0)
  {
    self->_deviceInterfaceOrientatiouint64_t n = *((_DWORD *)v4 + 160);
    *(void *)&self->_flags |= 0x800uLL;
    uint64_t v36 = *v35;
    if ((*v35 & 0x400) == 0)
    {
LABEL_87:
      if ((v36 & 0x100) == 0) {
        goto LABEL_88;
      }
      goto LABEL_102;
    }
  }
  else if ((v36 & 0x400) == 0)
  {
    goto LABEL_87;
  }
  self->_deviceBatteryState = *((_DWORD *)v4 + 159);
  *(void *)&self->_flags |= 0x400uLL;
  uint64_t v36 = *(void *)(v4 + 756);
  if ((v36 & 0x100) == 0)
  {
LABEL_88:
    if ((v36 & 0x400000000000) == 0) {
      goto LABEL_90;
    }
    goto LABEL_89;
  }
LABEL_102:
  self->_carHeadunitConnectionType = *((_DWORD *)v4 + 157);
  *(void *)&self->_flags |= 0x100uLL;
  if ((*(void *)(v4 + 756) & 0x400000000000) != 0)
  {
LABEL_89:
    self->_navigating = v4[738];
    *(void *)&self->_flags |= 0x400000000000uLL;
  }
LABEL_90:
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  id v37 = *((id *)v4 + 55);
  uint64_t v38 = [v37 countByEnumeratingWithState:&v126 objects:v143 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v127;
    do
    {
      for (uint64_t n = 0; n != v39; ++n)
      {
        if (*(void *)v127 != v40) {
          objc_enumerationMutation(v37);
        }
        [(GEOMapServiceTraits *)self addHistoricalLocations:*(void *)(*((void *)&v126 + 1) + 8 * n)];
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v126 objects:v143 count:16];
    }
    while (v39);
  }

  automobileOptions = self->_automobileOptions;
  uint64_t v43 = *((void *)v4 + 41);
  if (automobileOptions)
  {
    if (v43) {
      -[GEOAutomobileOptions mergeFrom:](automobileOptions, "mergeFrom:");
    }
  }
  else if (v43)
  {
    -[GEOMapServiceTraits setAutomobileOptions:](self, "setAutomobileOptions:");
  }
  transitOptions = self->_transitOptions;
  uint64_t v45 = *((void *)v4 + 70);
  if (transitOptions)
  {
    if (v45) {
      -[GEOTransitOptions mergeFrom:](transitOptions, "mergeFrom:");
    }
  }
  else if (v45)
  {
    -[GEOMapServiceTraits setTransitOptions:](self, "setTransitOptions:");
  }
  walkingOptions = self->_walkingOptions;
  uint64_t v47 = *((void *)v4 + 75);
  if (walkingOptions)
  {
    if (v47) {
      -[GEOWalkingOptions mergeFrom:](walkingOptions, "mergeFrom:");
    }
  }
  else if (v47)
  {
    -[GEOMapServiceTraits setWalkingOptions:](self, "setWalkingOptions:");
  }
  uint64_t v48 = [v4 engineTypesCount];
  if (v48)
  {
    uint64_t v49 = v48;
    for (iuint64_t i = 0; ii != v49; ++ii)
      -[GEOMapServiceTraits addEngineType:](self, "addEngineType:", [v4 engineTypeAtIndex:ii]);
  }
  uint64_t v51 = (uint64_t *)(v4 + 756);
  uint64_t v52 = *(void *)(v4 + 756);
  if ((v52 & 0x200000) != 0)
  {
    self->_requestMode = *((_DWORD *)v4 + 170);
    *(void *)&self->_flags |= 0x200000uLL;
    uint64_t v52 = *v51;
    if ((*v51 & 0x80000000000000) == 0)
    {
LABEL_121:
      if ((v52 & 0x100000000000000) == 0) {
        goto LABEL_123;
      }
      goto LABEL_122;
    }
  }
  else if ((v52 & 0x80000000000000) == 0)
  {
    goto LABEL_121;
  }
  self->_supportDirectionIntentSearch = v4[747];
  *(void *)&self->_flags |= 0x80000000000000uLL;
  if ((*(void *)(v4 + 756) & 0x100000000000000) != 0)
  {
LABEL_122:
    self->_supportDymSuggestiouint64_t n = v4[748];
    *(void *)&self->_flags |= 0x100000000000000uLL;
  }
LABEL_123:
  uint64_t v53 = [v4 knownClientResolvedTypesCount];
  if (v53)
  {
    uint64_t v54 = v53;
    for (juint64_t j = 0; jj != v54; ++jj)
      -[GEOMapServiceTraits addKnownClientResolvedType:](self, "addKnownClientResolvedType:", [v4 knownClientResolvedTypeAtIndex:jj]);
  }
  if ((v4[763] & 0x10) != 0)
  {
    self->_wantsBrandIcouint64_t n = v4[752];
    *(void *)&self->_flags |= 0x1000000000000000uLL;
  }
  venueIdentifier = self->_venueIdentifier;
  unint64_t v57 = (void *)*((void *)v4 + 74);
  if (venueIdentifier)
  {
    if (v57) {
      -[GEOPDVenueIdentifier mergeFrom:]((uint64_t)venueIdentifier, v57);
    }
  }
  else if (v57)
  {
    [(GEOMapServiceTraits *)self setVenueIdentifier:*((void *)v4 + 74)];
  }
  uint64_t v58 = (uint64_t *)(v4 + 756);
  uint64_t v59 = *(void *)(v4 + 756);
  if ((v59 & 0x4000000000) != 0)
  {
    self->_deviceInVehicle = v4[730];
    *(void *)&self->_flags |= 0x4000000000uLL;
    uint64_t v59 = *v58;
    if ((*v58 & 0x400000) == 0)
    {
LABEL_138:
      if ((v59 & 0x2000) == 0) {
        goto LABEL_140;
      }
      goto LABEL_139;
    }
  }
  else if ((v59 & 0x400000) == 0)
  {
    goto LABEL_138;
  }
  self->_requestPriority = *((_DWORD *)v4 + 171);
  *(void *)&self->_flags |= 0x400000uLL;
  if ((*(void *)(v4 + 756) & 0x2000) != 0)
  {
LABEL_139:
    self->_httpRequestPriority = *((_DWORD *)v4 + 162);
    *(void *)&self->_flags |= 0x2000uLL;
  }
LABEL_140:
  if (*((void *)v4 + 36)) {
    -[GEOMapServiceTraits setAnalyticsAppIdentifier:](self, "setAnalyticsAppIdentifier:");
  }
  uint64_t v60 = (uint64_t *)(v4 + 756);
  uint64_t v61 = *(void *)(v4 + 756);
  if ((v61 & 0x20) != 0)
  {
    self->_double sessionRelativeTimestamp = *((double *)v4 + 68);
    *(void *)&self->_flags |= 0x20uLL;
    uint64_t v61 = *v60;
    if ((*v60 & 0x40000000000000) == 0)
    {
LABEL_144:
      if ((v61 & 0x400000000000000) == 0) {
        goto LABEL_145;
      }
      goto LABEL_163;
    }
  }
  else if ((v61 & 0x40000000000000) == 0)
  {
    goto LABEL_144;
  }
  self->_supportDirectionIntentAutocomplete = v4[746];
  *(void *)&self->_flags |= 0x40000000000000uLL;
  uint64_t v61 = *(void *)(v4 + 756);
  if ((v61 & 0x400000000000000) == 0)
  {
LABEL_145:
    if ((v61 & 0x2000000000) == 0) {
      goto LABEL_146;
    }
    goto LABEL_164;
  }
LABEL_163:
  self->_supportUnresolvedDirectionIntent = v4[750];
  *(void *)&self->_flags |= 0x400000000000000uLL;
  uint64_t v61 = *(void *)(v4 + 756);
  if ((v61 & 0x2000000000) == 0)
  {
LABEL_146:
    if ((v61 & 0x200000000) == 0) {
      goto LABEL_147;
    }
    goto LABEL_165;
  }
LABEL_164:
  self->_deviceDarkMode = v4[729];
  *(void *)&self->_flags |= 0x2000000000uLL;
  uint64_t v61 = *(void *)(v4 + 756);
  if ((v61 & 0x200000000) == 0)
  {
LABEL_147:
    if ((v61 & 0x800000000000000) == 0) {
      goto LABEL_148;
    }
    goto LABEL_166;
  }
LABEL_165:
  self->_appDarkMode = v4[725];
  *(void *)&self->_flags |= 0x200000000uLL;
  uint64_t v61 = *(void *)(v4 + 756);
  if ((v61 & 0x800000000000000) == 0)
  {
LABEL_148:
    if ((v61 & 0x800000) == 0) {
      goto LABEL_150;
    }
    goto LABEL_149;
  }
LABEL_166:
  self->_supportsBrandFallbacuint64_t k = v4[751];
  *(void *)&self->_flags |= 0x800000000000000uLL;
  if ((*(void *)(v4 + 756) & 0x800000) != 0)
  {
LABEL_149:
    self->_requestPurpose = *((_DWORD *)v4 + 172);
    *(void *)&self->_flags |= 0x800000uLL;
  }
LABEL_150:
  uint64_t v62 = [v4 supportedAutocompleteListTypesCount];
  if (v62)
  {
    uint64_t v63 = v62;
    for (kuint64_t k = 0; kk != v63; ++kk)
      -[GEOMapServiceTraits addSupportedAutocompleteListType:](self, "addSupportedAutocompleteListType:", [v4 supportedAutocompleteListTypeAtIndex:kk]);
  }
  if ((v4[761] & 4) != 0)
  {
    self->_isSettlement = v4[734];
    *(void *)&self->_flags |= 0x40000000000uLL;
  }
  transitTripStopTimeFilter = self->_transitTripStopTimeFilter;
  uint64_t v66 = *((void *)v4 + 72);
  if (transitTripStopTimeFilter)
  {
    if (v66) {
      -[GEOTraitsTransitScheduleFilter mergeFrom:](transitTripStopTimeFilter, "mergeFrom:");
    }
  }
  else if (v66)
  {
    -[GEOMapServiceTraits setTransitTripStopTimeFilter:](self, "setTransitTripStopTimeFilter:");
  }
  if ((v4[762] & 0x20) != 0)
  {
    self->_supportClientRankingFeatureMetadata = v4[745];
    *(void *)&self->_flags |= 0x20000000000000uLL;
  }
  uint64_t v67 = [v4 supportedChildActionsCount];
  if (v67)
  {
    uint64_t v68 = v67;
    for (muint64_t m = 0; mm != v68; ++mm)
      -[GEOMapServiceTraits addSupportedChildAction:](self, "addSupportedChildAction:", [v4 supportedChildActionAtIndex:mm]);
  }
  unint64_t v70 = (uint64_t *)(v4 + 756);
  uint64_t v71 = *(void *)(v4 + 756);
  if ((v71 & 0x8000000000000) != 0)
  {
    self->_supportChildItems = v4[743];
    *(void *)&self->_flags |= 0x8000000000000uLL;
    uint64_t v71 = *v70;
    if ((*v70 & 0x10000000000) == 0)
    {
LABEL_177:
      if ((v71 & 0x800000000) == 0) {
        goto LABEL_179;
      }
      goto LABEL_178;
    }
  }
  else if ((v71 & 0x10000000000) == 0)
  {
    goto LABEL_177;
  }
  self->_isRefund = v4[732];
  *(void *)&self->_flags |= 0x10000000000uLL;
  if ((*(void *)(v4 + 756) & 0x800000000) != 0)
  {
LABEL_178:
    self->_autocompleteRequestSupportsSectionHeader = v4[727];
    *(void *)&self->_flags |= 0x800000000uLL;
  }
LABEL_179:
  uint64_t v72 = [v4 supportedAutocompleteResultCellTypesCount];
  if (v72)
  {
    uint64_t v73 = v72;
    for (nuint64_t n = 0; nn != v73; ++nn)
      -[GEOMapServiceTraits addSupportedAutocompleteResultCellType:](self, "addSupportedAutocompleteResultCellType:", [v4 supportedAutocompleteResultCellTypeAtIndex:nn]);
  }
  if (v4[757] < 0)
  {
    self->_navigationTransportType = *((_DWORD *)v4 + 164);
    *(void *)&self->_flags |= 0x8000uLL;
  }
  cyclingOptions = self->_cyclingOptions;
  uint64_t v76 = *((void *)v4 + 47);
  if (cyclingOptions)
  {
    if (v76) {
      -[GEOCyclingOptions mergeFrom:](cyclingOptions, "mergeFrom:");
    }
  }
  else if (v76)
  {
    -[GEOMapServiceTraits setCyclingOptions:](self, "setCyclingOptions:");
  }
  if ((v4[758] & 8) != 0)
  {
    self->_ratingsCount = *((_DWORD *)v4 + 168);
    *(void *)&self->_flags |= 0x80000uLL;
  }
  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id v77 = *((id *)v4 + 53);
  uint64_t v78 = [v77 countByEnumeratingWithState:&v122 objects:v142 count:16];
  if (v78)
  {
    uint64_t v79 = v78;
    uint64_t v80 = *(void *)v123;
    do
    {
      for (uint64_t i1 = 0; i1 != v79; ++i1)
      {
        if (*(void *)v123 != v80) {
          objc_enumerationMutation(v77);
        }
        -[GEOMapServiceTraits addEvChargingPort:](self, "addEvChargingPort:", *(void *)(*((void *)&v122 + 1) + 8 * i1), (void)v122);
      }
      uint64_t v79 = [v77 countByEnumeratingWithState:&v122 objects:v142 count:16];
    }
    while (v79);
  }

  if ((v4[761] & 8) != 0)
  {
    self->_isWidgetRequest = v4[735];
    *(void *)&self->_flags |= 0x80000000000uLL;
  }
  uint64_t v82 = objc_msgSend(v4, "supportedSearchTierTypesCount", (void)v122);
  if (v82)
  {
    uint64_t v83 = v82;
    for (uint64_t i2 = 0; i2 != v83; ++i2)
      -[GEOMapServiceTraits addSupportedSearchTierType:](self, "addSupportedSearchTierType:", [v4 supportedSearchTierTypeAtIndex:i2]);
  }
  unint64_t v85 = (uint64_t *)(v4 + 756);
  uint64_t v86 = *(void *)(v4 + 756);
  if ((v86 & 0x80) != 0)
  {
    self->_auxiliaryTierNumResults = *((_DWORD *)v4 + 156);
    *(void *)&self->_flags |= 0x80uLL;
    uint64_t v86 = *v85;
    if ((*v85 & 0x40000) == 0)
    {
LABEL_208:
      if ((v86 & 8) == 0) {
        goto LABEL_210;
      }
      goto LABEL_209;
    }
  }
  else if ((v86 & 0x40000) == 0)
  {
    goto LABEL_208;
  }
  self->_placeSummaryRevisiouint64_t n = *((_DWORD *)v4 + 167);
  *(void *)&self->_flags |= 0x40000uLL;
  if ((*(void *)(v4 + 756) & 8) != 0)
  {
LABEL_209:
    self->_double isTourist = *((double *)v4 + 56);
    *(void *)&self->_flags |= 8uLL;
  }
LABEL_210:
  uint64_t v87 = [v4 knownRefinementTypesCount];
  if (v87)
  {
    uint64_t v88 = v87;
    for (uint64_t i3 = 0; i3 != v88; ++i3)
      -[GEOMapServiceTraits addKnownRefinementType:](self, "addKnownRefinementType:", [v4 knownRefinementTypeAtIndex:i3]);
  }
  uint64_t v90 = *(void *)(v4 + 756);
  if ((v90 & 0x4000000000000) != 0)
  {
    self->_supportAutocompletePublisherResults = v4[742];
    *(void *)&self->_flags |= 0x4000000000000uLL;
    uint64_t v90 = *(void *)(v4 + 756);
  }
  if ((v90 & 0x2000000000000) != 0)
  {
    self->_supportAutocompleteGuideResults = v4[741];
    *(void *)&self->_flags |= 0x2000000000000uLL;
  }
  previousSearchViewport = self->_previousSearchViewport;
  uint64_t v92 = *((void *)v4 + 60);
  if (previousSearchViewport)
  {
    if (v92) {
      -[GEOPDViewportInfo mergeFrom:](previousSearchViewport, "mergeFrom:");
    }
  }
  else if (v92)
  {
    -[GEOMapServiceTraits setPreviousSearchViewport:](self, "setPreviousSearchViewport:");
  }
  if (v4[758])
  {
    self->_photoAlbumCount = *((_DWORD *)v4 + 165);
    *(void *)&self->_flags |= 0x10000uLL;
  }
  resultRefinementQuery = self->_resultRefinementQuery;
  uint64_t v94 = *((void *)v4 + 64);
  if (resultRefinementQuery)
  {
    if (v94) {
      -[GEOPDResultRefinementQuery mergeFrom:](resultRefinementQuery, "mergeFrom:");
    }
  }
  else if (v94)
  {
    -[GEOMapServiceTraits setResultRefinementQuery:](self, "setResultRefinementQuery:");
  }
  uint64_t v95 = *(void *)(v4 + 756);
  if ((v95 & 0x100000) != 0)
  {
    self->_relatedPlaceItemCount = *((_DWORD *)v4 + 169);
    *(void *)&self->_flags |= 0x100000uLL;
    uint64_t v95 = *(void *)(v4 + 756);
  }
  if ((v95 & 0x4000000) != 0)
  {
    self->_searchRequestType = *((_DWORD *)v4 + 175);
    *(void *)&self->_flags |= 0x4000000uLL;
  }
  if (*((void *)v4 + 46)) {
    -[GEOMapServiceTraits setCurrentLocaleCurrencySymbol:](self, "setCurrentLocaleCurrencySymbol:");
  }
  uint64_t v96 = [v4 supportedPlaceSummaryFormatTypesCount];
  if (v96)
  {
    uint64_t v97 = v96;
    for (uint64_t i4 = 0; i4 != v97; ++i4)
      -[GEOMapServiceTraits addSupportedPlaceSummaryFormatType:](self, "addSupportedPlaceSummaryFormatType:", [v4 supportedPlaceSummaryFormatTypeAtIndex:i4]);
  }
  if ((v4[756] & 0x40) != 0)
  {
    self->_autocompleteOriginationType = *((_DWORD *)v4 + 155);
    *(void *)&self->_flags |= 0x40uLL;
  }
  autocompleteOriginationPreviousLatlng = self->_autocompleteOriginationPreviousLatlng;
  uint64_t v100 = *((void *)v4 + 40);
  if (autocompleteOriginationPreviousLatlng)
  {
    if (v100) {
      -[GEOLatLng mergeFrom:](autocompleteOriginationPreviousLatlng, "mergeFrom:");
    }
  }
  else if (v100)
  {
    -[GEOMapServiceTraits setAutocompleteOriginationPreviousLatlng:](self, "setAutocompleteOriginationPreviousLatlng:");
  }
  if ((v4[759] & 8) != 0)
  {
    self->_searchOriginationType = *((_DWORD *)v4 + 176);
    *(void *)&self->_flags |= 0x8000000uLL;
  }
  searchOriginationPreviousLatlng = self->_searchOriginationPreviousLatlng;
  uint64_t v102 = *((void *)v4 + 67);
  if (searchOriginationPreviousLatlng)
  {
    if (v102) {
      -[GEOLatLng mergeFrom:](searchOriginationPreviousLatlng, "mergeFrom:");
    }
  }
  else if (v102)
  {
    -[GEOMapServiceTraits setSearchOriginationPreviousLatlng:](self, "setSearchOriginationPreviousLatlng:");
  }
  addStopRouteInfo = self->_addStopRouteInfo;
  uint64_t v104 = *((void *)v4 + 35);
  if (addStopRouteInfo)
  {
    if (v104) {
      -[GEOAddStopRouteInfo mergeFrom:](addStopRouteInfo, "mergeFrom:");
    }
  }
  else if (v104)
  {
    [(GEOMapServiceTraits *)self setAddStopRouteInfo:"setAddStopRouteInfo:"];
  }
  uint64_t v105 = (uint64_t *)(v4 + 756);
  uint64_t v106 = *(void *)(v4 + 756);
  if ((v106 & 0x400000000) != 0)
  {
    self->_autocompleteOriginationEditingServerWaypoints = v4[726];
    *(void *)&self->_flags |= 0x400000000uLL;
    uint64_t v106 = *v105;
    if ((*v105 & 0x1000000000000) == 0)
    {
LABEL_262:
      if ((v106 & 0x10000000000000) == 0) {
        goto LABEL_264;
      }
      goto LABEL_263;
    }
  }
  else if ((v106 & 0x1000000000000) == 0)
  {
    goto LABEL_262;
  }
  self->_searchOriginationEditingServerWaypoints = v4[740];
  *(void *)&self->_flags |= 0x1000000000000uLL;
  if ((*(void *)(v4 + 756) & 0x10000000000000) != 0)
  {
LABEL_263:
    self->_supportClientRankingCompositeFeatures = v4[744];
    *(void *)&self->_flags |= 0x10000000000000uLL;
  }
LABEL_264:
  privacyMetadata = self->_privacyMetadata;
  uint64_t v108 = *((void *)v4 + 61);
  if (privacyMetadata)
  {
    if (v108) {
      -[GEOPrivacyMetadata mergeFrom:](privacyMetadata, "mergeFrom:");
    }
  }
  else if (v108)
  {
    -[GEOMapServiceTraits setPrivacyMetadata:](self, "setPrivacyMetadata:");
  }
  unint64_t v109 = (uint64_t *)(v4 + 756);
  uint64_t v110 = *(void *)(v4 + 756);
  if ((v110 & 0x2000000) != 0)
  {
    self->_routeStopCount = *((_DWORD *)v4 + 174);
    *(void *)&self->_flags |= 0x2000000uLL;
    uint64_t v110 = *v109;
    if ((*v109 & 0x200000000000000) == 0)
    {
LABEL_274:
      if ((v110 & 0x20000000000) == 0) {
        goto LABEL_276;
      }
      goto LABEL_275;
    }
  }
  else if ((v110 & 0x200000000000000) == 0)
  {
    goto LABEL_274;
  }
  self->_supportStructuredRapAffordance = v4[749];
  *(void *)&self->_flags |= 0x200000000000000uLL;
  if ((*(void *)(v4 + 756) & 0x20000000000) != 0)
  {
LABEL_275:
    self->_isRoutePlanningEditStopFillRequest = v4[733];
    *(void *)&self->_flags |= 0x20000000000uLL;
  }
LABEL_276:
  uint64_t v111 = [v4 preferredBrandsCount];
  if (v111)
  {
    uint64_t v112 = v111;
    for (uint64_t i5 = 0; i5 != v112; ++i5)
      -[GEOMapServiceTraits addPreferredBrand:](self, "addPreferredBrand:", [v4 preferredBrandAtIndex:i5]);
  }
  uint64_t v114 = *(void *)(v4 + 756);
  if ((v114 & 0x100000000000) != 0)
  {
    self->_isWithinHikingBoundary = v4[736];
    *(void *)&self->_flags |= 0x100000000000uLL;
    uint64_t v114 = *(void *)(v4 + 756);
  }
  if ((v114 & 0x200000000000) != 0)
  {
    self->_isWithinHikingBufferRegiouint64_t n = v4[737];
    *(void *)&self->_flags |= 0x200000000000uLL;
  }
  searchImplicitFilterInfo = self->_searchImplicitFilterInfo;
  uint64_t v116 = *((void *)v4 + 66);
  if (searchImplicitFilterInfo)
  {
    if (v116) {
      -[GEOSearchImplicitFilterInfo mergeFrom:](searchImplicitFilterInfo, "mergeFrom:");
    }
  }
  else if (v116)
  {
    -[GEOMapServiceTraits setSearchImplicitFilterInfo:](self, "setSearchImplicitFilterInfo:");
  }
  uint64_t v117 = *(void *)(v4 + 756);
  if ((v117 & 0x1000) != 0)
  {
    self->_devicePlatforuint64_t m = *((_DWORD *)v4 + 161);
    *(void *)&self->_flags |= 0x1000uLL;
    uint64_t v117 = *(void *)(v4 + 756);
  }
  if ((v117 & 0x1000000000) != 0)
  {
    self->_containsSensitiveData = v4[728];
    *(void *)&self->_flags |= 0x1000000000uLL;
  }
  if (*((void *)v4 + 69)) {
    -[GEOMapServiceTraits setSpotlightSearchPunchinEncodedString:](self, "setSpotlightSearchPunchinEncodedString:");
  }
  if (v4[761] < 0)
  {
    self->_optimizeSearchRequestComponents = v4[739];
    *(void *)&self->_flags |= 0x800000000000uLL;
  }
  recentAutocompleteSessionData = self->_recentAutocompleteSessionData;
  uint64_t v119 = *((void *)v4 + 63);
  if (recentAutocompleteSessionData)
  {
    if (v119) {
      -[GEOPDAutocompleteSessionData mergeFrom:](recentAutocompleteSessionData, "mergeFrom:");
    }
  }
  else if (v119)
  {
    -[GEOMapServiceTraits setRecentAutocompleteSessionData:](self, "setRecentAutocompleteSessionData:");
  }
  if (v4[760])
  {
    self->_analyticsOptOut = v4[724];
    *(void *)&self->_flags |= 0x100000000uLL;
  }
  userActionMetadata = self->_userActionMetadata;
  uint64_t v121 = *((void *)v4 + 73);
  if (userActionMetadata)
  {
    if (v121) {
      -[GEOPDSSessionUserActionMetadata mergeFrom:](userActionMetadata, "mergeFrom:");
    }
  }
  else if (v121)
  {
    -[GEOMapServiceTraits setUserActionMetadata:](self, "setUserActionMetadata:");
  }
  if ((v4[763] & 0x20) != 0)
  {
    self->_wantsRouteCreationTip = v4[753];
    *(void *)&self->_flags |= 0x2000000000000000uLL;
  }
  if (*((void *)v4 + 54)) {
    -[GEOMapServiceTraits setHardwareIdentifier:](self, "setHardwareIdentifier:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((unsigned char *)&self->_flags + 7) & 0x40) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOMapServiceTraitsReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_1904);
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
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t v6 = *((void *)&self->_flags + 1) | 0x200000000000;
  *(void *)&self->_flags |= 0x4000000000000000uLL;
  *((void *)&self->_flags + 1) = v6;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOMapServiceTraits *)self readAll:0];
    [(GEOLocation *)self->_deviceLocation clearUnknownFields:1];
    [(GEOMapRegion *)self->_mapRegion clearUnknownFields:1];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v8 = self->_photoSizes;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v40 objects:v47 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v41;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v41 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v40 + 1) + 8 * v12++) clearUnknownFields:1];
        }
        while (v10 != v12);
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v40 objects:v47 count:16];
      }
      while (v10);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v13 = self->_reviewUserPhotoSizes;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v37;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v37 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v36 + 1) + 8 * v17++) clearUnknownFields:1];
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v36 objects:v46 count:16];
      }
      while (v15);
    }

    [(GEOTraitsTransitScheduleFilter *)self->_transitScheduleFilter clearUnknownFields:1];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v18 = self->_historicalLocations;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v32 objects:v45 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v33;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v32 + 1) + 8 * v22++) clearUnknownFields:1];
        }
        while (v20 != v22);
        uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v32 objects:v45 count:16];
      }
      while (v20);
    }

    [(GEOAutomobileOptions *)self->_automobileOptions clearUnknownFields:1];
    [(GEOTransitOptions *)self->_transitOptions clearUnknownFields:1];
    [(GEOWalkingOptions *)self->_walkingOptions clearUnknownFields:1];
    -[GEOPDVenueIdentifier clearUnknownFields:]((uint64_t)self->_venueIdentifier, 1);
    [(GEOTraitsTransitScheduleFilter *)self->_transitTripStopTimeFilter clearUnknownFields:1];
    [(GEOCyclingOptions *)self->_cyclingOptions clearUnknownFields:1];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    double v23 = self->_evChargingPorts;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v28 objects:v44 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v29;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v29 != v26) {
            objc_enumerationMutation(v23);
          }
          objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * v27++), "clearUnknownFields:", 1, (void)v28);
        }
        while (v25 != v27);
        uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v28 objects:v44 count:16];
      }
      while (v25);
    }

    [(GEOPDViewportInfo *)self->_previousSearchViewport clearUnknownFields:1];
    [(GEOPDResultRefinementQuery *)self->_resultRefinementQuery clearUnknownFields:1];
    [(GEOLatLng *)self->_autocompleteOriginationPreviousLatlng clearUnknownFields:1];
    [(GEOLatLng *)self->_searchOriginationPreviousLatlng clearUnknownFields:1];
    [(GEOAddStopRouteInfo *)self->_addStopRouteInfo clearUnknownFields:1];
    [(GEOPrivacyMetadata *)self->_privacyMetadata clearUnknownFields:1];
    [(GEOSearchImplicitFilterInfo *)self->_searchImplicitFilterInfo clearUnknownFields:1];
    [(GEOPDAutocompleteSessionData *)self->_recentAutocompleteSessionData clearUnknownFields:1];
    [(GEOPDSSessionUserActionMetadata *)self->_userActionMetadata clearUnknownFields:1];
  }
}

- (id)copyByIncrementingSessionCounters
{
  v2 = (void *)[(GEOMapServiceTraits *)self copy];
  objc_msgSend(v2, "_internal_incrementSessionCounters");
  return v2;
}

- (void)_internal_incrementSessionCounters
{
  BOOL v3 = +[GEOUserSession sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80__GEOMapServiceTraits_AnalyticsSessionExtra___internal_incrementSessionCounters__block_invoke;
  v4[3] = &unk_1E53DC588;
  v4[4] = self;
  [v3 shortSessionValues:v4];
}

void __80__GEOMapServiceTraits_AnalyticsSessionExtra___internal_incrementSessionCounters__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, double a8, double a9, double a10)
{
  objc_msgSend(*(id *)(a1 + 32), "setSessionId:", a2, a3);
  [*(id *)(a1 + 32) setSessionRelativeTimestamp:a10];
  [*(id *)(a1 + 32) setSequenceNumber:a4];
  if (a7)
  {
    uint64_t v16 = objc_alloc_init(GEOPrivacyMetadata);
    [*(id *)(a1 + 32) setPrivacyMetadata:v16];

    uint64_t v17 = [*(id *)(a1 + 32) privacyMetadata];
    [v17 setIsUnderageAccount:a5];

    id v18 = [*(id *)(a1 + 32) privacyMetadata];
    [v18 setIsManagedAccount:a6];
  }
}

- (void)clearSessionId
{
  if ([(GEOMapServiceTraits *)self hasSessionId])
  {
    -[GEOMapServiceTraits setSessionId:](self, "setSessionId:", 0, 0);
    [(GEOMapServiceTraits *)self setHasSessionId:0];
  }
}

- (void)clearLocations
{
  [(GEOMapServiceTraits *)self setDeviceLocation:0];
  [(GEOMapServiceTraits *)self setHistoricalLocations:0];
  [(GEOMapServiceTraits *)self clearKnownClientResolvedTypes];

  [(GEOMapServiceTraits *)self addKnownClientResolvedType:0];
}

@end