@interface GEOAPSharedStateData
+ (id)sharedData;
- (BOOL)_hasActualFallbackData;
- (BOOL)_hasActualUserHomeCountry;
- (BOOL)_hasActualUserHomeMetro;
- (BOOL)_isHandoff;
- (BOOL)_isHandoffFromDeviceType:(id)a3;
- (BOOL)_isPunchInAppIdInList:(id)a3;
- (BOOL)hasMapLaunchData;
- (BOOL)hasMapRestoreData;
- (BOOL)hasMapsServerData;
- (BOOL)hasPlaceCardStateData;
- (BOOL)hasPlaceCard_PlaceActionDetails;
- (BOOL)hasPlaceCard_PlaceActionDetails_TransitPlaceCard;
- (BOOL)hasPlaceCard_PlaceActionDetails_TransitPlaceCard_TransitDepartureSequence;
- (BOOL)hasShowcase;
- (BOOL)hasSuggestionsData;
- (BOOL)is3rdPartyPunchIn;
- (BOOL)isFindMyPunchIn;
- (BOOL)isIPadHandoff;
- (BOOL)isIPhoneHandoff;
- (BOOL)isMacHandoff;
- (BOOL)isOther2ndPartyPunchIn;
- (BOOL)isSMSPunchIn;
- (BOOL)isSafariPunchIn;
- (BOOL)isSiriPunchIn;
- (BOOL)isSpotlightPunchIn;
- (BOOL)isWatchHandoff;
- (BOOL)mapsInOfflineMode;
- (BOOL)shouldCountAsEnrichmentResult;
- (GEOAPSharedStateData)init;
- (id)_filteredHomeCountry:(id)a3;
- (id)_metroForLatLng:(id)a3 inCountry:(id)a4 filterWithAllowList:(BOOL)a5;
- (id)bestCurrentMetro;
- (id)stateImpressionObject;
- (id)stateMapSettings;
- (id)stateMapSettingsShort;
- (id)stateMapUIShown;
- (id)stateMapsFeatures;
- (id)stateMapsUserSettings;
- (id)stateRoutingSettings;
- (id)stateSearchResults;
- (id)stateTapEvents;
- (int)_geoTransportModeForAPTransportMode:(int)a3;
- (int)_geoVoiceGuidanceLevelFromAPVoiceGuidanceLevel:(int)a3;
- (int)activeNavModeAsGEOTransportType;
- (int)layoutInfoAsGEOLayoutInfo;
- (int)layoutStyleAsGEOLayoutStyle;
- (int)locationPrecisionTypeAsGEOSettingsLocationType;
- (int)moduleButtonLinkTypeAsGEOActionButtonLinkType:(int)a3;
- (int)moduleButtonTypeAsGEOModuleButtonType:(int64_t)a3;
- (int)navVoiceVolumeAsGEONavVoiceVolume;
- (int)transportModeAsGEOTransportMode;
- (void)_handleTaskTimer;
- (void)_performSyncStateUpdateWithIsolator:(id)a3 updateBlock:(id)a4;
- (void)_performUserProfileStateOperation:(id)a3;
- (void)_populateWithGEOTransitDepartureSequenceUsage:(id)a3;
- (void)_populateWithGEOTransitPlaceCard:(id)a3;
- (void)_resetTaskTimer;
- (void)_stopTaskTimer;
- (void)addPlaceCardModulesForRevealAction:(id)a3;
- (void)bestUserHomeLocation:(id)a3;
- (void)clearPlaceCardStateData;
- (void)clearSuggestionsData;
- (void)performMapFeaturesStateOperation:(id)a3;
- (void)performMapSettingsStateOperation:(id)a3;
- (void)performMapUIShownStateOperation:(id)a3;
- (void)performMapUserSettingsStateOperation:(id)a3;
- (void)performMapViewStateUpdate:(id)a3;
- (void)performPlaceCardStateUpdate:(id)a3;
- (void)performRoutingSettingsStateOperation:(id)a3;
- (void)periodicSettingsHandler;
- (void)populateActionButtonDetails:(id)a3;
- (void)populateImpressionObjectId:(id)a3;
- (void)populatePhotoSubmissionDetailsWithEntryPoint:(int)a3 numberOfPhotos:(unsigned int)a4 numberOfARPSuggestedPhotos:(unsigned int)a5 originTarget:(id)a6;
- (void)populatePlaceIdsWithSpecifierBlock:(id)a3;
- (void)populateRatingPhotoSubmissionDetailsWithEntryPoint:(int)a3 originTarget:(id)a4;
- (void)populateRatingSubmissionDetailsWithEntryPoint:(int)a3 originTarget:(id)a4 specifierBlock:(id)a5;
- (void)populateSearchResultsForQuery:(id)a3 searchResultSpecifierBlock:(id)a4;
- (void)populateTapEventForPinType:(int)a3 tapEventSpecifierBlock:(id)a4;
- (void)populateTapEventForResultIndex:(unsigned int)a3 resultType:(int)a4 businessId:(unint64_t)a5 localSearchProviderId:(unsigned int)a6 isEnrichedItem:(BOOL)a7;
- (void)populateWithChildPlace:(id)a3 timestamp:(double)a4 resultIndex:(int)a5;
- (void)populateWithPlace:(id)a3 timestamp:(double)a4 resultIndex:(int)a5;
- (void)populateWithPlaceActionDetails:(id)a3;
- (void)setCarPlayInfo:(id)a3;
- (void)setCurrentMetro:(id)a3;
- (void)setHasMapSettingsAvoidBusyRoads:(BOOL)a3;
- (void)setHasMapSettingsAvoidHighways:(BOOL)a3;
- (void)setHasMapSettingsAvoidHills:(BOOL)a3;
- (void)setHasMapSettingsAvoidStairs:(BOOL)a3;
- (void)setHasMapSettingsAvoidTolls:(BOOL)a3;
- (void)setHasMapSettingsDirectionsWakeDevice:(BOOL)a3;
- (void)setHasMapSettingsEBike:(BOOL)a3;
- (void)setHasMapSettingsFindMyCarEnabled:(BOOL)a3;
- (void)setHasMapSettingsHeadingEnabled:(BOOL)a3;
- (void)setHasMapSettingsLabelEnabled:(BOOL)a3;
- (void)setHasMapSettingsLocationPrecisionType:(BOOL)a3;
- (void)setHasMapSettingsNavVolume:(BOOL)a3;
- (void)setHasMapSettingsPauseSpokenAudioEnabled:(BOOL)a3;
- (void)setHasMapSettingsSpeedLimitEnabled:(BOOL)a3;
- (void)setHasMapSettingsTrafficEnabled:(BOOL)a3;
- (void)setHasMapSettingsTransportMode:(BOOL)a3;
- (void)setHasMapSettingsWalkingAvoidBusyRoads:(BOOL)a3;
- (void)setHasMapSettingsWalkingAvoidHills:(BOOL)a3;
- (void)setHasMapSettingsWalkingAvoidStairs:(BOOL)a3;
- (void)setHasMapUiShownActiveNavMode:(BOOL)a3;
- (void)setHasMapUiShownAqiShown:(BOOL)a3;
- (void)setHasMapUiShownWeatherShown:(BOOL)a3;
- (void)setMapFeatureElectronicVehicleCount:(int)a3;
- (void)setMapFeatureFavoritesCount:(int)a3;
- (void)setMapFeatureLibraryFavoritesGuideSavedPlacesCount:(int)a3;
- (void)setMapFeatureLibraryGuidesSavedPlacesCount:(int)a3;
- (void)setMapFeatureLibraryPlacesWithNoteCount:(int)a3;
- (void)setMapFeatureLibrarySavedPlacesCount:(int)a3;
- (void)setMapFeatureLicensePlateCount:(int)a3;
- (void)setMapFeaturePersonalCollectionsCount:(int)a3;
- (void)setMapFeatureSavedCollectionsCount:(int)a3;
- (void)setMapFeatureSubmittedPhotosCount:(int)a3;
- (void)setMapFeatureSubmittedRatingsCount:(int)a3;
- (void)setMapSettingsAvoidBusyRoads:(BOOL)a3;
- (void)setMapSettingsAvoidHighways:(BOOL)a3;
- (void)setMapSettingsAvoidHills:(BOOL)a3;
- (void)setMapSettingsAvoidStairs:(BOOL)a3;
- (void)setMapSettingsAvoidTolls:(BOOL)a3;
- (void)setMapSettingsDirectionsWakeDevice:(BOOL)a3;
- (void)setMapSettingsEBike:(BOOL)a3;
- (void)setMapSettingsFindMyCarEnabled:(BOOL)a3;
- (void)setMapSettingsHeadingEnabled:(BOOL)a3;
- (void)setMapSettingsLabelEnabled:(BOOL)a3;
- (void)setMapSettingsLocationPrecisionType:(int)a3;
- (void)setMapSettingsNavVolume:(int)a3;
- (void)setMapSettingsPauseSpokenAudioEnabled:(BOOL)a3;
- (void)setMapSettingsSpeedLimitEnabled:(BOOL)a3;
- (void)setMapSettingsTrafficEnabled:(BOOL)a3;
- (void)setMapSettingsTransportMode:(int)a3;
- (void)setMapSettingsWalkingAvoidBusyRoads:(BOOL)a3;
- (void)setMapSettingsWalkingAvoidHills:(BOOL)a3;
- (void)setMapSettingsWalkingAvoidStairs:(BOOL)a3;
- (void)setMapUiShownActiveNavMode:(int)a3;
- (void)setMapUiShownAqiShown:(BOOL)a3;
- (void)setMapUiShownWeatherShown:(BOOL)a3;
- (void)setMapViewViewMode:(int)a3;
- (void)setMeCardHomeCountry:(id)a3 andHomeLocation:(id)a4;
- (void)setNavVoiceGuidanceLevel:(int)a3 forTransportMode:(int)a4;
- (void)setUserProfileAvailableActions:(id)a3;
- (void)setUserProfileUserIsLoggedIntoICloud:(BOOL)a3;
@end

@implementation GEOAPSharedStateData

- (void)_resetTaskTimer
{
  unsigned int UInteger = GEOConfigGetUInteger();
  dispatch_time_t v4 = dispatch_time(0, 1000000000 * UInteger);
  periodicSettingsTimer = self->_periodicSettingsTimer;
  dispatch_source_set_timer(periodicSettingsTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (id)bestCurrentMetro
{
  if (_GEOConfigHasValue())
  {
    GEOConfigGetString();
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = @"UNKNOWN";
  }
  return v2;
}

+ (id)sharedData
{
  if (qword_26B2018A0 != -1) {
    dispatch_once(&qword_26B2018A0, &__block_literal_global_18);
  }
  v2 = (void *)_MergedGlobals_1;
  return v2;
}

- (void)performPlaceCardStateUpdate:(id)a3
{
}

- (void)performMapViewStateUpdate:(id)a3
{
}

- (id)stateMapSettingsShort
{
  id v3 = objc_alloc_init(MEMORY[0x263F41A18]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__GEOAPSharedStateData_stateMapSettingsShort__block_invoke;
  v8[3] = &unk_26534A178;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v8];
  v5 = v9;
  id v6 = v4;

  return v6;
}

- (void)setNavVoiceGuidanceLevel:(int)a3 forTransportMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  int v6 = [(GEOAPSharedStateData *)self _geoVoiceGuidanceLevelFromAPVoiceGuidanceLevel:*(void *)&a3];
  int v7 = [(GEOAPSharedStateData *)self _geoTransportModeForAPTransportMode:v4];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__GEOAPSharedStateData_setNavVoiceGuidanceLevel_forTransportMode___block_invoke;
  v8[3] = &unk_26534A1C8;
  int v9 = v7;
  int v10 = v6;
  v8[4] = self;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v8];
}

- (int)_geoTransportModeForAPTransportMode:(int)a3
{
  if ((a3 - 1) >= 5) {
    return 0;
  }
  else {
    return a3;
  }
}

- (int)_geoVoiceGuidanceLevelFromAPVoiceGuidanceLevel:(int)a3
{
  if ((a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

- (int)layoutStyleAsGEOLayoutStyle
{
  int result = [(GEOAnalyticsPipelineStateData *)self hasMapUiLayoutStyle];
  if (result)
  {
    int result = [(GEOAnalyticsPipelineStateData *)self mapUiLayoutStyle];
    if ((result - 1) >= 5) {
      return 0;
    }
  }
  return result;
}

- (int)layoutInfoAsGEOLayoutInfo
{
  int result = [(GEOAnalyticsPipelineStateData *)self hasMapUiLayoutInfo];
  if (result)
  {
    int result = [(GEOAnalyticsPipelineStateData *)self mapUiLayoutInfo];
    if ((result - 1) >= 3) {
      return 0;
    }
  }
  return result;
}

- (BOOL)hasSuggestionsData
{
  if ([(GEOAnalyticsPipelineStateData *)self hasSuggestionsSearchString]
    || [(GEOAnalyticsPipelineStateData *)self hasSuggestionsSelectedIndex]
    || [(GEOAnalyticsPipelineStateData *)self hasSuggestionsSearchFieldType]
    || [(GEOAnalyticsPipelineStateData *)self hasSuggestionsAcSequenceNumber])
  {
    return 1;
  }
  v5 = [(GEOAnalyticsPipelineStateData *)self suggestionsDisplayedResults];
  BOOL v3 = [v5 count] != 0;

  return v3;
}

- (BOOL)hasMapsServerData
{
  if ([(GEOAnalyticsPipelineStateData *)self hasMapsServerMetadata]
    || [(GEOAnalyticsPipelineStateData *)self hasMapsServerMetadataSuggestionEntryTappedOn])
  {
    return 1;
  }
  uint64_t v4 = [(GEOAnalyticsPipelineStateData *)self mapsServerMetadataSuggestionEntryDisplayeds];
  BOOL v3 = [v4 count] != 0;

  return v3;
}

- (int)activeNavModeAsGEOTransportType
{
  if ([(GEOAnalyticsPipelineStateData *)self hasMapUiShownActiveNavMode]
    && (int v3 = [(GEOAnalyticsPipelineStateData *)self mapUiShownActiveNavMode] - 1,
        v3 <= 4))
  {
    return dword_24FEFA8A0[v3];
  }
  else
  {
    return 4;
  }
}

uint64_t __57__GEOAPSharedStateData_performMapSettingsStateOperation___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    int v3 = *(void **)(a1 + 32);
    return [v3 _resetTaskTimer];
  }
  return result;
}

uint64_t __66__GEOAPSharedStateData_setNavVoiceGuidanceLevel_forTransportMode___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  switch(v1)
  {
    case 5:
      objc_msgSendSuper2(&v3, sel_setMapSettingsCyclingVoiceSettings_, *(unsigned int *)(a1 + 44), *(void *)(a1 + 32), GEOAPSharedStateData, v4.receiver, v4.super_class, v5.receiver, v5.super_class);
      break;
    case 2:
      objc_msgSendSuper2(&v4, sel_setMapSettingsWalkingVoiceSettings_, *(unsigned int *)(a1 + 44), v3.receiver, v3.super_class, *(void *)(a1 + 32), GEOAPSharedStateData, v5.receiver, v5.super_class);
      break;
    case 1:
      objc_msgSendSuper2(&v5, sel_setMapSettingsDrivingVoiceSettings_, *(unsigned int *)(a1 + 44), v3.receiver, v3.super_class, v4.receiver, v4.super_class, *(void *)(a1 + 32), GEOAPSharedStateData);
      break;
  }
  return 1;
}

uint64_t __45__GEOAPSharedStateData_stateMapSettingsShort__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapSettingsNavVolume]) {
    objc_msgSend(*(id *)(a1 + 40), "setNavVoiceVolume:", objc_msgSend(*(id *)(a1 + 32), "navVoiceVolumeAsGEONavVoiceVolume"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsTransportMode]) {
    objc_msgSend(*(id *)(a1 + 40), "setPreferredTransportMode:", objc_msgSend(*(id *)(a1 + 32), "transportModeAsGEOTransportMode"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsHeadingEnabled]) {
    objc_msgSend(*(id *)(a1 + 40), "setHeadingEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsHeadingEnabled"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsLabelEnabled]) {
    objc_msgSend(*(id *)(a1 + 40), "setLabelEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsLabelEnabled"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsPauseSpokenAudioEnabled]) {
    objc_msgSend(*(id *)(a1 + 40), "setPauseSpokenAudioEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsPauseSpokenAudioEnabled"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsSpeedLimitEnabled]) {
    objc_msgSend(*(id *)(a1 + 40), "setSpeedLimitEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsSpeedLimitEnabled"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsTrafficEnabled]) {
    objc_msgSend(*(id *)(a1 + 40), "setTrafficEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsTrafficEnabled"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsLocationPrecisionType]) {
    objc_msgSend(*(id *)(a1 + 40), "setLocationType:", objc_msgSend(*(id *)(a1 + 32), "locationPrecisionTypeAsGEOSettingsLocationType"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsDrivingVoiceSettings]) {
    objc_msgSend(*(id *)(a1 + 40), "setDrivingVoiceSettings:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsDrivingVoiceSettings"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsWalkingVoiceSettings]) {
    objc_msgSend(*(id *)(a1 + 40), "setWalkingVoiceSettings:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsWalkingVoiceSettings"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsCyclingVoiceSettings]) {
    objc_msgSend(*(id *)(a1 + 40), "setCyclingVoiceSettings:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsCyclingVoiceSettings"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsIsHandsFreeProfileEnabled]) {
    objc_msgSend(*(id *)(a1 + 40), "setHFPEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsIsHandsFreeProfileEnabled"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsDirectionsWakeDevice]) {
    objc_msgSend(*(id *)(a1 + 40), "setDirectionsWakeDevice:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsDirectionsWakeDevice"));
  }
  return 0;
}

- (int)locationPrecisionTypeAsGEOSettingsLocationType
{
  int result = [(GEOAnalyticsPipelineStateData *)self hasMapSettingsLocationPrecisionType];
  if (result)
  {
    int result = [(GEOAnalyticsPipelineStateData *)self mapSettingsLocationPrecisionType];
    if ((result - 1) >= 3) {
      return 0;
    }
  }
  return result;
}

uint64_t __60__GEOAPSharedStateData_setMapSettingsWalkingAvoidBusyRoads___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapSettingsWalkingAvoidBusyRoads])
  {
    int v2 = [*(id *)(a1 + 32) mapSettingsWalkingAvoidBusyRoads];
    int v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2) {
      return 0;
    }
  }
  else
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsWalkingAvoidBusyRoads_, v3 != 0);
  return 1;
}

uint64_t __57__GEOAPSharedStateData_setMapSettingsWalkingAvoidStairs___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapSettingsWalkingAvoidStairs])
  {
    int v2 = [*(id *)(a1 + 32) mapSettingsWalkingAvoidStairs];
    int v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2) {
      return 0;
    }
  }
  else
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsWalkingAvoidStairs_, v3 != 0);
  return 1;
}

uint64_t __56__GEOAPSharedStateData_setMapSettingsWalkingAvoidHills___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapSettingsWalkingAvoidHills])
  {
    int v2 = [*(id *)(a1 + 32) mapSettingsWalkingAvoidHills];
    int v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2) {
      return 0;
    }
  }
  else
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsWalkingAvoidHills_, v3 != 0);
  return 1;
}

uint64_t __53__GEOAPSharedStateData_setMapSettingsAvoidBusyRoads___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapSettingsAvoidBusyRoads])
  {
    int v2 = [*(id *)(a1 + 32) mapSettingsAvoidBusyRoads];
    int v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2) {
      return 0;
    }
  }
  else
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsAvoidBusyRoads_, v3 != 0);
  return 1;
}

uint64_t __52__GEOAPSharedStateData_setMapSettingsAvoidHighways___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapSettingsAvoidHighways])
  {
    int v2 = [*(id *)(a1 + 32) mapSettingsAvoidHighways];
    int v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2) {
      return 0;
    }
  }
  else
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsAvoidHighways_, v3 != 0);
  return 1;
}

uint64_t __49__GEOAPSharedStateData_setMapSettingsAvoidTolls___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapSettingsAvoidTolls])
  {
    int v2 = [*(id *)(a1 + 32) mapSettingsAvoidTolls];
    int v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2) {
      return 0;
    }
  }
  else
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsAvoidTolls_, v3 != 0);
  return 1;
}

uint64_t __49__GEOAPSharedStateData_setMapSettingsAvoidHills___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapSettingsAvoidHills])
  {
    int v2 = [*(id *)(a1 + 32) mapSettingsAvoidHills];
    int v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2) {
      return 0;
    }
  }
  else
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsAvoidHills_, v3 != 0);
  return 1;
}

uint64_t __44__GEOAPSharedStateData_setMapSettingsEBike___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapSettingsEBike])
  {
    int v2 = [*(id *)(a1 + 32) mapSettingsEBike];
    int v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2) {
      return 0;
    }
  }
  else
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsEBike_, v3 != 0);
  return 1;
}

- (int)transportModeAsGEOTransportMode
{
  int result = [(GEOAnalyticsPipelineStateData *)self hasMapSettingsTransportMode];
  if (result)
  {
    uint64_t v4 = [(GEOAnalyticsPipelineStateData *)self mapSettingsTransportMode];
    return [(GEOAPSharedStateData *)self _geoTransportModeForAPTransportMode:v4];
  }
  return result;
}

uint64_t __62__GEOAPSharedStateData_setMapSettingsPauseSpokenAudioEnabled___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapSettingsPauseSpokenAudioEnabled])
  {
    int v2 = [*(id *)(a1 + 32) mapSettingsPauseSpokenAudioEnabled];
    int v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2) {
      return 0;
    }
  }
  else
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsPauseSpokenAudioEnabled_, v3 != 0);
  return 1;
}

uint64_t __60__GEOAPSharedStateData_setMapSettingsLocationPrecisionType___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapSettingsLocationPrecisionType])
  {
    int v2 = [*(id *)(a1 + 32) mapSettingsLocationPrecisionType];
    uint64_t v3 = *(unsigned int *)(a1 + 40);
    if (v2 == v3) {
      return 0;
    }
  }
  else
  {
    uint64_t v3 = *(unsigned int *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsLocationPrecisionType_, v3);
  return 1;
}

uint64_t __56__GEOAPSharedStateData_setMapSettingsSpeedLimitEnabled___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapSettingsSpeedLimitEnabled])
  {
    int v2 = [*(id *)(a1 + 32) mapSettingsSpeedLimitEnabled];
    int v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2) {
      return 0;
    }
  }
  else
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsSpeedLimitEnabled_, v3 != 0);
  return 1;
}

uint64_t __55__GEOAPSharedStateData_setMapSettingsFindMyCarEnabled___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapSettingsFindMyCarEnabled])
  {
    int v2 = [*(id *)(a1 + 32) mapSettingsFindMyCarEnabled];
    int v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2) {
      return 0;
    }
  }
  else
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsFindMyCarEnabled_, v3 != 0);
  return 1;
}

uint64_t __53__GEOAPSharedStateData_setMapSettingsTrafficEnabled___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapSettingsTrafficEnabled])
  {
    int v2 = [*(id *)(a1 + 32) mapSettingsTrafficEnabled];
    int v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2) {
      return 0;
    }
  }
  else
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsTrafficEnabled_, v3 != 0);
  return 1;
}

uint64_t __53__GEOAPSharedStateData_setMapSettingsHeadingEnabled___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapSettingsHeadingEnabled])
  {
    int v2 = [*(id *)(a1 + 32) mapSettingsHeadingEnabled];
    int v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2) {
      return 0;
    }
  }
  else
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsHeadingEnabled_, v3 != 0);
  return 1;
}

uint64_t __52__GEOAPSharedStateData_setMapSettingsTransportMode___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapSettingsTransportMode])
  {
    int v2 = [*(id *)(a1 + 32) mapSettingsTransportMode];
    uint64_t v3 = *(unsigned int *)(a1 + 40);
    if (v2 == v3) {
      return 0;
    }
  }
  else
  {
    uint64_t v3 = *(unsigned int *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsTransportMode_, v3);
  return 1;
}

uint64_t __51__GEOAPSharedStateData_setMapSettingsLabelEnabled___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapSettingsLabelEnabled])
  {
    int v2 = [*(id *)(a1 + 32) mapSettingsLabelEnabled];
    int v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2) {
      return 0;
    }
  }
  else
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsLabelEnabled_, v3 != 0);
  return 1;
}

- (void)setMapSettingsTrafficEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__GEOAPSharedStateData_setMapSettingsTrafficEnabled___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

- (void)setMapSettingsFindMyCarEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__GEOAPSharedStateData_setMapSettingsFindMyCarEnabled___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

- (void)setMapSettingsPauseSpokenAudioEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __62__GEOAPSharedStateData_setMapSettingsPauseSpokenAudioEnabled___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

- (void)setMapSettingsLocationPrecisionType:(int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__GEOAPSharedStateData_setMapSettingsLocationPrecisionType___block_invoke;
  v3[3] = &unk_26534A1A0;
  v3[4] = self;
  int v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

- (void)setMapSettingsHeadingEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__GEOAPSharedStateData_setMapSettingsHeadingEnabled___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

- (void)setMapSettingsTransportMode:(int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__GEOAPSharedStateData_setMapSettingsTransportMode___block_invoke;
  v3[3] = &unk_26534A1A0;
  v3[4] = self;
  int v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

- (void)setMapSettingsSpeedLimitEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __56__GEOAPSharedStateData_setMapSettingsSpeedLimitEnabled___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

- (void)setMapSettingsLabelEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__GEOAPSharedStateData_setMapSettingsLabelEnabled___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

- (void)setMapUiShownWeatherShown:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__GEOAPSharedStateData_setMapUiShownWeatherShown___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapUIShownStateOperation:v3];
}

- (void)setMapUiShownAqiShown:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__GEOAPSharedStateData_setMapUiShownAqiShown___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapUIShownStateOperation:v3];
}

- (void)setMapFeatureLicensePlateCount:(int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__GEOAPSharedStateData_setMapFeatureLicensePlateCount___block_invoke;
  v3[3] = &unk_26534A1A0;
  int v4 = a3;
  v3[4] = self;
  [(GEOAPSharedStateData *)self performMapFeaturesStateOperation:v3];
}

- (void)setMapFeatureSavedCollectionsCount:(int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__GEOAPSharedStateData_setMapFeatureSavedCollectionsCount___block_invoke;
  v3[3] = &unk_26534A1A0;
  int v4 = a3;
  v3[4] = self;
  [(GEOAPSharedStateData *)self performMapFeaturesStateOperation:v3];
}

- (void)setMapFeatureLibraryGuidesSavedPlacesCount:(int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __67__GEOAPSharedStateData_setMapFeatureLibraryGuidesSavedPlacesCount___block_invoke;
  v3[3] = &unk_26534A1A0;
  int v4 = a3;
  v3[4] = self;
  [(GEOAPSharedStateData *)self performMapFeaturesStateOperation:v3];
}

- (void)setMapFeatureElectronicVehicleCount:(int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__GEOAPSharedStateData_setMapFeatureElectronicVehicleCount___block_invoke;
  v3[3] = &unk_26534A1A0;
  int v4 = a3;
  v3[4] = self;
  [(GEOAPSharedStateData *)self performMapFeaturesStateOperation:v3];
}

- (void)setMapFeatureLibraryPlacesWithNoteCount:(int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __64__GEOAPSharedStateData_setMapFeatureLibraryPlacesWithNoteCount___block_invoke;
  v3[3] = &unk_26534A1A0;
  int v4 = a3;
  v3[4] = self;
  [(GEOAPSharedStateData *)self performMapFeaturesStateOperation:v3];
}

- (void)setMapFeatureLibrarySavedPlacesCount:(int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __61__GEOAPSharedStateData_setMapFeatureLibrarySavedPlacesCount___block_invoke;
  v3[3] = &unk_26534A1A0;
  int v4 = a3;
  v3[4] = self;
  [(GEOAPSharedStateData *)self performMapFeaturesStateOperation:v3];
}

- (void)setMapSettingsAvoidHills:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__GEOAPSharedStateData_setMapSettingsAvoidHills___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

- (void)setMapSettingsAvoidHighways:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__GEOAPSharedStateData_setMapSettingsAvoidHighways___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

- (void)setMapSettingsWalkingAvoidStairs:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__GEOAPSharedStateData_setMapSettingsWalkingAvoidStairs___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

- (void)setMapSettingsAvoidBusyRoads:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__GEOAPSharedStateData_setMapSettingsAvoidBusyRoads___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

- (void)setMapSettingsAvoidTolls:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__GEOAPSharedStateData_setMapSettingsAvoidTolls___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

- (void)setMapSettingsEBike:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__GEOAPSharedStateData_setMapSettingsEBike___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

- (void)setMapSettingsWalkingAvoidHills:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __56__GEOAPSharedStateData_setMapSettingsWalkingAvoidHills___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

- (void)setMapSettingsWalkingAvoidBusyRoads:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__GEOAPSharedStateData_setMapSettingsWalkingAvoidBusyRoads___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

- (void)setMapFeatureLibraryFavoritesGuideSavedPlacesCount:(int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __75__GEOAPSharedStateData_setMapFeatureLibraryFavoritesGuideSavedPlacesCount___block_invoke;
  v3[3] = &unk_26534A1A0;
  int v4 = a3;
  v3[4] = self;
  [(GEOAPSharedStateData *)self performMapFeaturesStateOperation:v3];
}

- (void)setMapFeaturePersonalCollectionsCount:(int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __62__GEOAPSharedStateData_setMapFeaturePersonalCollectionsCount___block_invoke;
  v3[3] = &unk_26534A1A0;
  int v4 = a3;
  v3[4] = self;
  [(GEOAPSharedStateData *)self performMapFeaturesStateOperation:v3];
}

- (void)setMapFeatureFavoritesCount:(int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__GEOAPSharedStateData_setMapFeatureFavoritesCount___block_invoke;
  v3[3] = &unk_26534A1A0;
  int v4 = a3;
  v3[4] = self;
  [(GEOAPSharedStateData *)self performMapFeaturesStateOperation:v3];
}

- (void)performMapUIShownStateOperation:(id)a3
{
  id v4 = a3;
  mapUIShownIso = self->_mapUIShownIso;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__GEOAPSharedStateData_performMapUIShownStateOperation___block_invoke;
  v7[3] = &unk_265345530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(GEOAPSharedStateData *)self _performSyncStateUpdateWithIsolator:mapUIShownIso updateBlock:v7];
}

- (void)performMapFeaturesStateOperation:(id)a3
{
  id v4 = a3;
  mapFeaturesIso = self->_mapFeaturesIso;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__GEOAPSharedStateData_performMapFeaturesStateOperation___block_invoke;
  v7[3] = &unk_265345530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(GEOAPSharedStateData *)self _performSyncStateUpdateWithIsolator:mapFeaturesIso updateBlock:v7];
}

- (void)performMapSettingsStateOperation:(id)a3
{
  id v4 = a3;
  mapSettingsIso = self->_mapSettingsIso;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__GEOAPSharedStateData_performMapSettingsStateOperation___block_invoke;
  v7[3] = &unk_265345530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(GEOAPSharedStateData *)self _performSyncStateUpdateWithIsolator:mapSettingsIso updateBlock:v7];
}

- (void)_performSyncStateUpdateWithIsolator:(id)a3 updateBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  geo_assert_not_isolated();
  geo_isolate_sync();
}

uint64_t __34__GEOAPSharedStateData_sharedData__block_invoke()
{
  _MergedGlobals_1 = objc_alloc_init(GEOAPSharedStateData);
  return MEMORY[0x270F9A758]();
}

- (GEOAPSharedStateData)init
{
  v46.receiver = self;
  v46.super_class = (Class)GEOAPSharedStateData;
  id v2 = [(GEOAnalyticsPipelineStateData *)&v46 init];
  if (v2)
  {
    int v3 = [MEMORY[0x263F086E0] mainBundle];
    id v4 = [v3 bundleIdentifier];
    *((unsigned char *)v2 + 744) = [v4 isEqualToString:*MEMORY[0x263F416F0]];

    uint64_t v5 = geo_reentrant_isolater_create_with_format();
    id v6 = (void *)*((void *)v2 + 94);
    *((void *)v2 + 94) = v5;

    uint64_t v7 = geo_isolater_create();
    id v8 = (void *)*((void *)v2 + 95);
    *((void *)v2 + 95) = v7;

    uint64_t v9 = geo_isolater_create();
    int v10 = (void *)*((void *)v2 + 96);
    *((void *)v2 + 96) = v9;

    uint64_t v11 = geo_isolater_create();
    v12 = (void *)*((void *)v2 + 97);
    *((void *)v2 + 97) = v11;

    uint64_t v13 = geo_isolater_create();
    v14 = (void *)*((void *)v2 + 98);
    *((void *)v2 + 98) = v13;

    uint64_t v15 = geo_isolater_create();
    v16 = (void *)*((void *)v2 + 99);
    *((void *)v2 + 99) = v15;

    uint64_t v17 = geo_isolater_create();
    v18 = (void *)*((void *)v2 + 100);
    *((void *)v2 + 100) = v17;

    uint64_t v19 = geo_isolater_create();
    v20 = (void *)*((void *)v2 + 101);
    *((void *)v2 + 101) = v19;

    uint64_t v21 = geo_isolater_create();
    v22 = (void *)*((void *)v2 + 102);
    *((void *)v2 + 102) = v21;

    uint64_t v23 = geo_isolater_create();
    v24 = (void *)*((void *)v2 + 103);
    *((void *)v2 + 103) = v23;

    uint64_t v25 = geo_isolater_create();
    v26 = (void *)*((void *)v2 + 104);
    *((void *)v2 + 104) = v25;

    uint64_t v27 = geo_isolater_create();
    v28 = (void *)*((void *)v2 + 105);
    *((void *)v2 + 105) = v27;

    uint64_t v29 = geo_isolater_create();
    v30 = (void *)*((void *)v2 + 106);
    *((void *)v2 + 106) = v29;

    uint64_t v31 = geo_isolater_create();
    v32 = (void *)*((void *)v2 + 107);
    *((void *)v2 + 107) = v31;

    uint64_t v33 = geo_isolater_create();
    v34 = (void *)*((void *)v2 + 108);
    *((void *)v2 + 108) = v33;

    uint64_t v35 = geo_isolater_create();
    v36 = (void *)*((void *)v2 + 109);
    *((void *)v2 + 109) = v35;

    uint64_t global_queue = geo_get_global_queue();
    v38 = (void *)*((void *)v2 + 110);
    *((void *)v2 + 110) = global_queue;

    dispatch_source_t v39 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *((dispatch_queue_t *)v2 + 110));
    v40 = (void *)*((void *)v2 + 111);
    *((void *)v2 + 111) = v39;

    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 111), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    objc_initWeak(&location, v2);
    v41 = *((void *)v2 + 111);
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __28__GEOAPSharedStateData_init__block_invoke;
    v43[3] = &unk_26534A128;
    objc_copyWeak(&v44, &location);
    dispatch_source_set_event_handler(v41, v43);
    dispatch_activate(*((dispatch_object_t *)v2 + 111));
    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }
  return (GEOAPSharedStateData *)v2;
}

- (void)bestUserHomeLocation:(id)a3
{
  id v6 = (void (**)(id, __CFString *, __CFString *))a3;
  if ([(GEOAPSharedStateData *)self _hasActualUserHomeCountry]
    && [(GEOAPSharedStateData *)self _hasActualUserHomeMetro]
    || _GEOConfigHasValue() && (_GEOConfigHasValue() & 1) != 0
    || _GEOConfigHasValue() && _GEOConfigHasValue())
  {
    GEOConfigGetString();
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    GEOConfigGetString();
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = @"UNKNOWN";
    uint64_t v5 = @"UNKNOWN";
  }
  v6[2](v6, v4, v5);
}

- (BOOL)_hasActualUserHomeCountry
{
  if (_GEOConfigHasValue())
  {
    id v2 = GEOConfigGetString();
    int v3 = [&unk_270162D88 containsObject:v2] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

uint64_t __57__GEOAPSharedStateData_performMapFeaturesStateOperation___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    int v3 = *(void **)(a1 + 32);
    return [v3 _resetTaskTimer];
  }
  return result;
}

uint64_t __52__GEOAPSharedStateData_setMapFeatureFavoritesCount___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v3, sel_setMapFeatureFavoritesCount_, v1);
  return 1;
}

uint64_t __62__GEOAPSharedStateData_setMapFeaturePersonalCollectionsCount___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v3, sel_setMapFeaturePersonalCollectionsCount_, v1);
  return 1;
}

uint64_t __75__GEOAPSharedStateData_setMapFeatureLibraryFavoritesGuideSavedPlacesCount___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v3, sel_setMapFeatureLibraryFavoritesGuideSavedPlacesCount_, v1);
  return 1;
}

uint64_t __67__GEOAPSharedStateData_setMapFeatureLibraryGuidesSavedPlacesCount___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v3, sel_setMapFeatureLibraryGuidesSavedPlacesCount_, v1);
  return 1;
}

uint64_t __64__GEOAPSharedStateData_setMapFeatureLibraryPlacesWithNoteCount___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v3, sel_setMapFeatureLibraryPlacesWithNoteCount_, v1);
  return 1;
}

uint64_t __61__GEOAPSharedStateData_setMapFeatureLibrarySavedPlacesCount___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v3, sel_setMapFeatureLibrarySavedPlacesCount_, v1);
  return 1;
}

uint64_t __60__GEOAPSharedStateData_setMapFeatureElectronicVehicleCount___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v3, sel_setMapFeatureElectronicVehicleCount_, v1);
  return 1;
}

uint64_t __59__GEOAPSharedStateData_setMapFeatureSavedCollectionsCount___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v3, sel_setMapFeatureSavedCollectionsCount_, v1);
  return 1;
}

uint64_t __55__GEOAPSharedStateData_setMapFeatureLicensePlateCount___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v3, sel_setMapFeatureLicensePlateCount_, v1);
  return 1;
}

- (BOOL)hasPlaceCard_PlaceActionDetails_TransitPlaceCard_TransitDepartureSequence
{
  if ([(GEOAnalyticsPipelineStateData *)self hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection]|| [(GEOAnalyticsPipelineStateData *)self hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId])
  {
    return 1;
  }
  return [(GEOAnalyticsPipelineStateData *)self hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign];
}

- (BOOL)hasPlaceCard_PlaceActionDetails
{
  if (-[GEOAnalyticsPipelineStateData hasPlaceCardPlaceActionDetailsActionUrl](self, "hasPlaceCardPlaceActionDetailsActionUrl")|| -[GEOAnalyticsPipelineStateData hasPlaceCardPlaceActionDetailsAnimationId](self, "hasPlaceCardPlaceActionDetailsAnimationId")|| -[GEOAnalyticsPipelineStateData hasPlaceCardPlaceActionDetailsBusinessId](self, "hasPlaceCardPlaceActionDetailsBusinessId")|| -[GEOAnalyticsPipelineStateData hasPlaceCardPlaceActionDetailsDestinationApp](self, "hasPlaceCardPlaceActionDetailsDestinationApp")|| -[GEOAnalyticsPipelineStateData hasPlaceCardPlaceActionDetailsPhotoId](self, "hasPlaceCardPlaceActionDetailsPhotoId")|| -[GEOAnalyticsPipelineStateData hasPlaceCardPlaceActionDetailsPlaceId](self, "hasPlaceCardPlaceActionDetailsPlaceId")|| -[GEOAnalyticsPipelineStateData hasPlaceCardPlaceActionDetailsRichProviderId](self,
         "hasPlaceCardPlaceActionDetailsRichProviderId")
    || [(GEOAnalyticsPipelineStateData *)self hasPlaceCardPlaceActionDetailsSearchResponseRelativeTimestamp]|| [(GEOAnalyticsPipelineStateData *)self hasPlaceCardPlaceActionDetailsTargetId]|| [(GEOAnalyticsPipelineStateData *)self hasPlaceCardPlaceActionDetailsLocalSearchProviderId]|| [(GEOAnalyticsPipelineStateData *)self hasPlaceCardPlaceActionDetailsResultIndex]|| [(GEOAnalyticsPipelineStateData *)self hasPlaceCardPlaceActionDetailsShowcaseId])
  {
    return 1;
  }
  return [(GEOAPSharedStateData *)self hasPlaceCard_PlaceActionDetails_TransitPlaceCard];
}

- (BOOL)hasPlaceCardStateData
{
  if ([(GEOAnalyticsPipelineStateData *)self placeCardPossibleActionsCount]
    || [(GEOAnalyticsPipelineStateData *)self placeCardUnactionableUiElementsCount]|| [(GEOAnalyticsPipelineStateData *)self hasPlaceCardPlaceCardType]|| [(GEOAnalyticsPipelineStateData *)self hasPlaceCardPlaceCardCategory]|| [(GEOAnalyticsPipelineStateData *)self hasPlaceCardTransitAdvisoryBanner])
  {
    return 1;
  }
  return [(GEOAPSharedStateData *)self hasPlaceCard_PlaceActionDetails];
}

- (BOOL)hasPlaceCard_PlaceActionDetails_TransitPlaceCard
{
  if ([(GEOAnalyticsPipelineStateData *)self hasPlaceCardPlaceActionDetailsTransitPlaceCardIncidentType]|| [(GEOAnalyticsPipelineStateData *)self hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitSystemName]|| [(GEOAnalyticsPipelineStateData *)self hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitCategory])
  {
    return 1;
  }
  return [(GEOAPSharedStateData *)self hasPlaceCard_PlaceActionDetails_TransitPlaceCard_TransitDepartureSequence];
}

uint64_t __56__GEOAPSharedStateData_performMapUIShownStateOperation___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    objc_super v3 = *(void **)(a1 + 32);
    return [v3 _resetTaskTimer];
  }
  return result;
}

uint64_t __50__GEOAPSharedStateData_setMapUiShownWeatherShown___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapUiShownWeatherShown])
  {
    int v2 = [*(id *)(a1 + 32) mapUiShownWeatherShown];
    int v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2) {
      return 0;
    }
  }
  else
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapUiShownWeatherShown_, v3 != 0);
  return 1;
}

uint64_t __46__GEOAPSharedStateData_setMapUiShownAqiShown___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapUiShownAqiShown])
  {
    int v2 = [*(id *)(a1 + 32) mapUiShownAqiShown];
    int v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2) {
      return 0;
    }
  }
  else
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapUiShownAqiShown_, v3 != 0);
  return 1;
}

- (BOOL)hasMapLaunchData
{
  if ([(GEOAnalyticsPipelineStateData *)self hasMapLaunchSourceAppId]
    || [(GEOAnalyticsPipelineStateData *)self hasMapLaunchLaunchUri]
    || [(GEOAnalyticsPipelineStateData *)self hasMapLaunchReferringWebsite]
    || [(GEOAnalyticsPipelineStateData *)self hasMapLaunchIsHandoff])
  {
    return 1;
  }
  return [(GEOAnalyticsPipelineStateData *)self hasMapLaunchSourceHandoffDevice];
}

- (BOOL)is3rdPartyPunchIn
{
  BOOL v3 = [(GEOAnalyticsPipelineStateData *)self hasMapLaunchSourceAppId];
  if (v3)
  {
    if ([(GEOAPSharedStateData *)self isSiriPunchIn]
      || [(GEOAPSharedStateData *)self isSafariPunchIn]
      || [(GEOAPSharedStateData *)self isSpotlightPunchIn]
      || [(GEOAPSharedStateData *)self isSMSPunchIn]
      || [(GEOAPSharedStateData *)self isFindMyPunchIn])
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      LOBYTE(v3) = ![(GEOAPSharedStateData *)self isOther2ndPartyPunchIn];
    }
  }
  return v3;
}

- (BOOL)isFindMyPunchIn
{
  BOOL v3 = GEOConfigGetArray();
  LOBYTE(self) = [(GEOAPSharedStateData *)self _isPunchInAppIdInList:v3];

  return (char)self;
}

- (BOOL)isSMSPunchIn
{
  BOOL v3 = GEOConfigGetArray();
  LOBYTE(self) = [(GEOAPSharedStateData *)self _isPunchInAppIdInList:v3];

  return (char)self;
}

- (BOOL)isSafariPunchIn
{
  BOOL v3 = GEOConfigGetArray();
  LOBYTE(self) = [(GEOAPSharedStateData *)self _isPunchInAppIdInList:v3];

  return (char)self;
}

- (BOOL)_isPunchInAppIdInList:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(GEOAnalyticsPipelineStateData *)self hasMapLaunchSourceAppId])
  {
    objc_super v5 = [(GEOAnalyticsPipelineStateData *)self mapLaunchSourceAppId];
    id v6 = [v5 lowercaseString];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "lowercaseString", (void)v14);
          char v12 = [v11 isEqualToString:v6];

          if (v12)
          {
            LOBYTE(v8) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)hasMapRestoreData
{
  if ([(GEOAnalyticsPipelineStateData *)self hasRestoreUiTarget]
    || [(GEOAnalyticsPipelineStateData *)self hasRestoreLayoutInfo])
  {
    return 1;
  }
  return [(GEOAnalyticsPipelineStateData *)self hasRestoreLayoutStyle];
}

- (BOOL)isSpotlightPunchIn
{
  BOOL v3 = GEOConfigGetArray();
  LOBYTE(self) = [(GEOAPSharedStateData *)self _isPunchInAppIdInList:v3];

  return (char)self;
}

- (BOOL)isSiriPunchIn
{
  BOOL v3 = GEOConfigGetArray();
  LOBYTE(self) = [(GEOAPSharedStateData *)self _isPunchInAppIdInList:v3];

  return (char)self;
}

- (BOOL)isOther2ndPartyPunchIn
{
  if (![(GEOAnalyticsPipelineStateData *)self hasMapLaunchSourceAppId]
    || [(GEOAPSharedStateData *)self isSiriPunchIn]
    || [(GEOAPSharedStateData *)self isSafariPunchIn]
    || [(GEOAPSharedStateData *)self isSpotlightPunchIn]
    || [(GEOAPSharedStateData *)self isSMSPunchIn]
    || [(GEOAPSharedStateData *)self isFindMyPunchIn])
  {
    return 0;
  }
  id v4 = [(GEOAnalyticsPipelineStateData *)self mapLaunchSourceAppId];
  objc_super v5 = [v4 lowercaseString];

  LOBYTE(v4) = [v5 hasPrefix:@"com.apple"];
  return (char)v4;
}

void __28__GEOAPSharedStateData_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleTaskTimer];
}

- (void)_stopTaskTimer
{
}

- (void)_handleTaskTimer
{
  [(GEOAPSharedStateData *)self periodicSettingsHandler];
  [(GEOAPSharedStateData *)self _stopTaskTimer];
}

- (BOOL)mapsInOfflineMode
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v2 = [MEMORY[0x263F41B60] shared];
  BOOL v3 = v2;
  if (!v2)
  {
LABEL_6:
    BOOL v6 = 0;
    goto LABEL_7;
  }
  unsigned __int8 v4 = [v2 state];
  int v5 = v4;
  if (v4 >= 3u)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      v8[0] = 67109120;
      v8[1] = v5;
      _os_log_fault_impl(&dword_24FE56000, &_os_log_internal, OS_LOG_TYPE_FAULT, "no metro lat/lng provided", (uint8_t *)v8, 8u);
    }
    goto LABEL_6;
  }
  BOOL v6 = (v4 & 7) == 2;
LABEL_7:

  return v6;
}

- (void)setCarPlayInfo:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_24FE56000, v5, OS_LOG_TYPE_DEBUG, "setting carplay info : %@", buf, 0xCu);
  }

  v10.receiver = self;
  v10.super_class = (Class)GEOAPSharedStateData;
  [(GEOAnalyticsPipelineStateData *)&v10 setCarPlayInfo:v4];
  if (self->_isMapsApp)
  {
    BOOL v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_24FE56000, v6, OS_LOG_TYPE_DEBUG, "Maps.app set carplay info : %@", buf, 0xCu);
    }

    id v7 = +[GEOAPStateFactory sharedFactory];
    uint64_t v8 = [v7 stateForType:5];

    uint64_t v9 = +[GEOAPServiceManager sharedManager];
    [v9 updateSharedStateType:404 state:v8];
  }
}

- (void)clearPlaceCardStateData
{
}

uint64_t __47__GEOAPSharedStateData_clearPlaceCardStateData__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPlaceCardState:0];
  [*(id *)(a1 + 32) clearPlaceCardPossibleActions];
  [*(id *)(a1 + 32) clearPlaceCardUnactionableUiElements];
  [*(id *)(a1 + 32) setHasPlaceCardPlaceCardType:0];
  [*(id *)(a1 + 32) setPlaceCardPlaceCardCategory:0];
  [*(id *)(a1 + 32) setHasPlaceCardPlaceActionDetailsAnimationId:0];
  [*(id *)(a1 + 32) setHasPlaceCardPlaceActionDetailsBusinessId:0];
  [*(id *)(a1 + 32) setPlaceCardPlaceActionDetailsDestinationApp:0];
  [*(id *)(a1 + 32) setPlaceCardPlaceActionDetailsPhotoId:0];
  [*(id *)(a1 + 32) setHasPlaceCardPlaceActionDetailsPlaceId:0];
  [*(id *)(a1 + 32) setPlaceCardPlaceActionDetailsRichProviderId:0];
  [*(id *)(a1 + 32) setHasPlaceCardPlaceActionDetailsSearchResponseRelativeTimestamp:0];
  [*(id *)(a1 + 32) setHasPlaceCardPlaceActionDetailsTargetId:0];
  [*(id *)(a1 + 32) setHasPlaceCardPlaceActionDetailsLocalSearchProviderId:0];
  [*(id *)(a1 + 32) setHasPlaceCardPlaceActionDetailsResultIndex:0];
  [*(id *)(a1 + 32) setPlaceCardPlaceActionDetailsTransitPlaceCardIncidentType:0];
  [*(id *)(a1 + 32) setPlaceCardPlaceActionDetailsTransitPlaceCardTransitSystemName:0];
  [*(id *)(a1 + 32) setHasPlaceCardPlaceActionDetailsTransitPlaceCardTransitCategory:0];
  [*(id *)(a1 + 32) setPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection:0];
  [*(id *)(a1 + 32) setHasPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId:0];
  [*(id *)(a1 + 32) setPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign:0];
  [*(id *)(a1 + 32) setPlaceCardIsPersonPlacecard:0];
  [*(id *)(a1 + 32) setPlaceCardIsPersonAddressAvailable:0];
  int v2 = *(void **)(a1 + 32);
  return [v2 setPlaceCardIsPersonLocationShared:0];
}

- (void)populateWithPlaceActionDetails:(id)a3
{
  id v14 = a3;
  geo_assert_reentrant_isolated();
  if ([v14 hasPhotoId])
  {
    id v4 = [v14 photoId];
    [(GEOAnalyticsPipelineStateData *)self setPlaceCardPlaceActionDetailsPhotoId:v4];
  }
  if ([v14 hasPlaceID]) {
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsPlaceId:](self, "setPlaceCardPlaceActionDetailsPlaceId:", [v14 placeID]);
  }
  if ([v14 hasTargetID]) {
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsTargetId:](self, "setPlaceCardPlaceActionDetailsTargetId:", [v14 targetID]);
  }
  if ([v14 hasActionUrl])
  {
    int v5 = [v14 actionUrl];
    BOOL v6 = (void *)[v5 copy];
    [(GEOAnalyticsPipelineStateData *)self setPlaceCardPlaceActionDetailsActionUrl:v6];
  }
  if ([v14 hasBusinessID]) {
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsBusinessId:](self, "setPlaceCardPlaceActionDetailsBusinessId:", [v14 businessID]);
  }
  if ([v14 hasAnimationID]) {
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsAnimationId:](self, "setPlaceCardPlaceActionDetailsAnimationId:", [v14 animationID]);
  }
  if ([v14 hasResultIndex]) {
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsResultIndex:](self, "setPlaceCardPlaceActionDetailsResultIndex:", [v14 resultIndex]);
  }
  if ([v14 hasDestinationApp])
  {
    id v7 = [v14 destinationApp];
    uint64_t v8 = (void *)[v7 copy];
    [(GEOAnalyticsPipelineStateData *)self setPlaceCardPlaceActionDetailsDestinationApp:v8];
  }
  if ([v14 hasRichProviderId])
  {
    uint64_t v9 = [v14 richProviderId];
    objc_super v10 = (void *)[v9 copy];
    [(GEOAnalyticsPipelineStateData *)self setPlaceCardPlaceActionDetailsRichProviderId:v10];
  }
  if ([v14 hasSearchResponseRelativeTimestamp])
  {
    [v14 searchResponseRelativeTimestamp];
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsSearchResponseRelativeTimestamp:](self, "setPlaceCardPlaceActionDetailsSearchResponseRelativeTimestamp:");
  }
  if ([v14 hasLocalSearchProviderID]) {
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsLocalSearchProviderId:](self, "setPlaceCardPlaceActionDetailsLocalSearchProviderId:", [v14 localSearchProviderID]);
  }
  if ([v14 hasTransitPlaceCard])
  {
    uint64_t v11 = [v14 transitPlaceCard];
    [(GEOAPSharedStateData *)self _populateWithGEOTransitPlaceCard:v11];
  }
  if ([v14 hasShowcaseId])
  {
    id v12 = [v14 showcaseId];
    uint64_t v13 = (void *)[v12 copy];
    [(GEOAnalyticsPipelineStateData *)self setPlaceCardPlaceActionDetailsShowcaseId:v13];
  }
}

- (void)_populateWithGEOTransitPlaceCard:(id)a3
{
  id v9 = a3;
  geo_assert_reentrant_isolated();
  if ([v9 hasIncidentType])
  {
    id v4 = [v9 incidentType];
    int v5 = (void *)[v4 copy];
    [(GEOAnalyticsPipelineStateData *)self setPlaceCardPlaceActionDetailsTransitPlaceCardIncidentType:v5];
  }
  if ([v9 hasTransitCategory]) {
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsTransitPlaceCardTransitCategory:](self, "setPlaceCardPlaceActionDetailsTransitPlaceCardTransitCategory:", [v9 transitCategory]);
  }
  if ([v9 hasTransitSystemName])
  {
    BOOL v6 = [v9 transitSystemName];
    id v7 = (void *)[v6 copy];
    [(GEOAnalyticsPipelineStateData *)self setPlaceCardPlaceActionDetailsTransitPlaceCardTransitSystemName:v7];
  }
  if ([v9 hasTransitDepartureSequenceUsage])
  {
    uint64_t v8 = [v9 transitDepartureSequenceUsage];
    [(GEOAPSharedStateData *)self _populateWithGEOTransitDepartureSequenceUsage:v8];
  }
}

- (void)_populateWithGEOTransitDepartureSequenceUsage:(id)a3
{
  id v8 = a3;
  geo_assert_reentrant_isolated();
  if ([v8 hasLineId]) {
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId:](self, "setPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId:", [v8 lineId]);
  }
  if ([v8 hasHeadsign])
  {
    id v4 = [v8 headsign];
    int v5 = (void *)[v4 copy];
    [(GEOAnalyticsPipelineStateData *)self setPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign:v5];
  }
  if ([v8 hasDirection])
  {
    BOOL v6 = [v8 direction];
    id v7 = (void *)[v6 copy];
    [(GEOAnalyticsPipelineStateData *)self setPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection:v7];
  }
}

- (void)populateWithPlace:(id)a3 timestamp:(double)a4 resultIndex:(int)a5
{
  id v6 = a3;
  id v5 = v6;
  geo_reentrant_isolate_sync();
}

void __64__GEOAPSharedStateData_populateWithPlace_timestamp_resultIndex___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    [*(id *)(a1 + 40) setPlaceCardState:0];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v2 = 0;
  }
  id v3 = [MEMORY[0x263F41B70] actionDetailsWithMapItem:v2 timestamp:*(unsigned int *)(a1 + 56) resultIndex:*(double *)(a1 + 48)];
  [*(id *)(a1 + 40) populateWithPlaceActionDetails:v3];
}

- (void)populateWithChildPlace:(id)a3 timestamp:(double)a4 resultIndex:(int)a5
{
  id v6 = a3;
  id v5 = v6;
  geo_reentrant_isolate_sync();
}

void __69__GEOAPSharedStateData_populateWithChildPlace_timestamp_resultIndex___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    [*(id *)(a1 + 40) setPlaceCardState:0];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v2 = 0;
  }
  id v3 = [MEMORY[0x263F41B70] actionDetailsWithChildPlace:v2 timestamp:*(unsigned int *)(a1 + 56) resultIndex:*(double *)(a1 + 48)];
  [*(id *)(a1 + 40) populateWithPlaceActionDetails:v3];
}

- (void)addPlaceCardModulesForRevealAction:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_reentrant_isolate_sync();
}

void __59__GEOAPSharedStateData_addPlaceCardModulesForRevealAction___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) placeCardRevealedPlaceCardModules];
  [v2 removeAllObjects];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        id v9 = objc_msgSend(*(id *)(a1 + 32), "placeCardRevealedPlaceCardModules", (void)v11);
        objc_super v10 = (void *)[v8 copy];
        [v9 addObject:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)clearSuggestionsData
{
  [(GEOAnalyticsPipelineStateData *)self setSuggestionsSearchString:0];
  [(GEOAnalyticsPipelineStateData *)self setHasSuggestionsSelectedIndex:0];
  [(GEOAnalyticsPipelineStateData *)self setHasSuggestionsSearchFieldType:0];
  [(GEOAnalyticsPipelineStateData *)self setHasSuggestionsAcSequenceNumber:0];
  [(GEOAnalyticsPipelineStateData *)self clearSuggestionsDisplayedResults];
}

- (int)moduleButtonLinkTypeAsGEOActionButtonLinkType:(int)a3
{
  if ((a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

- (int)moduleButtonTypeAsGEOModuleButtonType:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      int result = 1;
      break;
    case 2:
      int result = 2;
      break;
    case 3:
      int result = 3;
      break;
    case 4:
      int result = 4;
      break;
    case 5:
      int result = 5;
      break;
    case 6:
      int result = 6;
      break;
    case 7:
      int result = 7;
      break;
    case 8:
      int result = 8;
      break;
    case 9:
      int result = 9;
      break;
    case 10:
      int result = 10;
      break;
    default:
      switch(a3)
      {
        case '2':
          int result = 50;
          break;
        case '3':
          int result = 51;
          break;
        case '4':
          int result = 52;
          break;
        case '5':
          int result = 53;
          break;
        case '6':
          int result = 54;
          break;
        case '7':
          int result = 55;
          break;
        case '8':
          int result = 56;
          break;
        default:
          int result = 0;
          break;
      }
      break;
  }
  return result;
}

- (int)navVoiceVolumeAsGEONavVoiceVolume
{
  int result = [(GEOAnalyticsPipelineStateData *)self hasMapSettingsNavVolume];
  if (result)
  {
    int result = [(GEOAnalyticsPipelineStateData *)self mapSettingsNavVolume];
    if ((result - 1) >= 4) {
      return 0;
    }
  }
  return result;
}

- (void)_performUserProfileStateOperation:(id)a3
{
  id v4 = a3;
  userProfileIso = self->_userProfileIso;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__GEOAPSharedStateData__performUserProfileStateOperation___block_invoke;
  v7[3] = &unk_265345530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(GEOAPSharedStateData *)self _performSyncStateUpdateWithIsolator:userProfileIso updateBlock:v7];
}

uint64_t __58__GEOAPSharedStateData__performUserProfileStateOperation___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 _resetTaskTimer];
  }
  return result;
}

- (void)setUserProfileUserIsLoggedIntoICloud:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __61__GEOAPSharedStateData_setUserProfileUserIsLoggedIntoICloud___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self _performUserProfileStateOperation:v3];
}

uint64_t __61__GEOAPSharedStateData_setUserProfileUserIsLoggedIntoICloud___block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) hasAccount])
  {
    id v2 = objc_alloc_init(MEMORY[0x263F41998]);
    [*(id *)(a1 + 32) setAccount:v2];
    goto LABEL_6;
  }
  id v2 = [*(id *)(a1 + 32) account];
  if (([v2 hasSignedIntoIcloud] & 1) == 0)
  {
LABEL_6:

    goto LABEL_7;
  }
  id v3 = [*(id *)(a1 + 32) account];
  int v4 = [v3 signedIntoIcloud];
  int v5 = *(unsigned __int8 *)(a1 + 40);

  if (v5 == v4) {
    return 0;
  }
LABEL_7:
  uint64_t v7 = *(unsigned __int8 *)(a1 + 40);
  id v8 = [*(id *)(a1 + 32) account];
  [v8 setSignedIntoIcloud:v7];

  return 1;
}

- (void)setUserProfileAvailableActions:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__GEOAPSharedStateData_setUserProfileAvailableActions___block_invoke;
  v6[3] = &unk_26534A178;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(GEOAPSharedStateData *)self _performUserProfileStateOperation:v6];
}

uint64_t __55__GEOAPSharedStateData_setUserProfileAvailableActions___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) hasAccount] & 1) == 0)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F41998]);
    [*(id *)(a1 + 32) setAccount:v2];
  }
  id v3 = [*(id *)(a1 + 32) account];
  [v3 clearPossibleActions];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        objc_super v10 = objc_msgSend(*(id *)(a1 + 32), "account", (void)v12);
        objc_msgSend(v10, "addPossibleAction:", objc_msgSend(v9, "intValue"));

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return 1;
}

- (void)setHasMapUiShownAqiShown:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__GEOAPSharedStateData_setHasMapUiShownAqiShown___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapUIShownStateOperation:v3];
}

BOOL __49__GEOAPSharedStateData_setHasMapUiShownAqiShown___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasMapUiShownAqiShown];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapUiShownAqiShown_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setHasMapUiShownWeatherShown:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__GEOAPSharedStateData_setHasMapUiShownWeatherShown___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapUIShownStateOperation:v3];
}

BOOL __53__GEOAPSharedStateData_setHasMapUiShownWeatherShown___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasMapUiShownWeatherShown];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapUiShownWeatherShown_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setMapUiShownActiveNavMode:(int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__GEOAPSharedStateData_setMapUiShownActiveNavMode___block_invoke;
  v3[3] = &unk_26534A1A0;
  v3[4] = self;
  int v4 = a3;
  [(GEOAPSharedStateData *)self performMapUIShownStateOperation:v3];
}

uint64_t __51__GEOAPSharedStateData_setMapUiShownActiveNavMode___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapUiShownActiveNavMode])
  {
    int v2 = [*(id *)(a1 + 32) mapUiShownActiveNavMode];
    uint64_t v3 = *(unsigned int *)(a1 + 40);
    if (v2 == v3) {
      return 0;
    }
  }
  else
  {
    uint64_t v3 = *(unsigned int *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapUiShownActiveNavMode_, v3);
  return 1;
}

- (void)setHasMapUiShownActiveNavMode:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __54__GEOAPSharedStateData_setHasMapUiShownActiveNavMode___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapUIShownStateOperation:v3];
}

BOOL __54__GEOAPSharedStateData_setHasMapUiShownActiveNavMode___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasMapUiShownActiveNavMode];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapUiShownActiveNavMode_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setMapSettingsNavVolume:(int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__GEOAPSharedStateData_setMapSettingsNavVolume___block_invoke;
  v3[3] = &unk_26534A1A0;
  v3[4] = self;
  int v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

uint64_t __48__GEOAPSharedStateData_setMapSettingsNavVolume___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapSettingsNavVolume])
  {
    int v2 = [*(id *)(a1 + 32) mapSettingsNavVolume];
    uint64_t v3 = *(unsigned int *)(a1 + 40);
    if (v2 == v3) {
      return 0;
    }
  }
  else
  {
    uint64_t v3 = *(unsigned int *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsNavVolume_, v3);
  return 1;
}

- (void)setHasMapSettingsNavVolume:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__GEOAPSharedStateData_setHasMapSettingsNavVolume___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

BOOL __51__GEOAPSharedStateData_setHasMapSettingsNavVolume___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasMapSettingsNavVolume];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsNavVolume_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setHasMapSettingsTransportMode:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__GEOAPSharedStateData_setHasMapSettingsTransportMode___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

BOOL __55__GEOAPSharedStateData_setHasMapSettingsTransportMode___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasMapSettingsTransportMode];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsTransportMode_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setHasMapSettingsAvoidHighways:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__GEOAPSharedStateData_setHasMapSettingsAvoidHighways___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

BOOL __55__GEOAPSharedStateData_setHasMapSettingsAvoidHighways___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasMapSettingsAvoidHighways];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsAvoidHighways_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setHasMapSettingsAvoidTolls:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__GEOAPSharedStateData_setHasMapSettingsAvoidTolls___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

BOOL __52__GEOAPSharedStateData_setHasMapSettingsAvoidTolls___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasMapSettingsAvoidTolls];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsAvoidTolls_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setHasMapSettingsFindMyCarEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__GEOAPSharedStateData_setHasMapSettingsFindMyCarEnabled___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

BOOL __58__GEOAPSharedStateData_setHasMapSettingsFindMyCarEnabled___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasMapSettingsFindMyCarEnabled];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsFindMyCarEnabled_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setHasMapSettingsHeadingEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __56__GEOAPSharedStateData_setHasMapSettingsHeadingEnabled___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

BOOL __56__GEOAPSharedStateData_setHasMapSettingsHeadingEnabled___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasMapSettingsHeadingEnabled];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsHeadingEnabled_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setHasMapSettingsLabelEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __54__GEOAPSharedStateData_setHasMapSettingsLabelEnabled___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

BOOL __54__GEOAPSharedStateData_setHasMapSettingsLabelEnabled___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasMapSettingsLabelEnabled];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsLabelEnabled_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setHasMapSettingsPauseSpokenAudioEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __65__GEOAPSharedStateData_setHasMapSettingsPauseSpokenAudioEnabled___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

BOOL __65__GEOAPSharedStateData_setHasMapSettingsPauseSpokenAudioEnabled___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasMapSettingsPauseSpokenAudioEnabled];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsPauseSpokenAudioEnabled_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setHasMapSettingsSpeedLimitEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__GEOAPSharedStateData_setHasMapSettingsSpeedLimitEnabled___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

BOOL __59__GEOAPSharedStateData_setHasMapSettingsSpeedLimitEnabled___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasMapSettingsSpeedLimitEnabled];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsSpeedLimitEnabled_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setHasMapSettingsTrafficEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __56__GEOAPSharedStateData_setHasMapSettingsTrafficEnabled___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

BOOL __56__GEOAPSharedStateData_setHasMapSettingsTrafficEnabled___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasMapSettingsTrafficEnabled];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsTrafficEnabled_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setHasMapSettingsAvoidHills:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__GEOAPSharedStateData_setHasMapSettingsAvoidHills___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

BOOL __52__GEOAPSharedStateData_setHasMapSettingsAvoidHills___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasMapSettingsAvoidHills];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsAvoidHills_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setMapSettingsAvoidStairs:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__GEOAPSharedStateData_setMapSettingsAvoidStairs___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

uint64_t __50__GEOAPSharedStateData_setMapSettingsAvoidStairs___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapSettingsAvoidStairs])
  {
    int v2 = [*(id *)(a1 + 32) mapSettingsAvoidStairs];
    int v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2) {
      return 0;
    }
  }
  else
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsAvoidStairs_, v3 != 0);
  return 1;
}

- (void)setHasMapSettingsAvoidStairs:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__GEOAPSharedStateData_setHasMapSettingsAvoidStairs___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

BOOL __53__GEOAPSharedStateData_setHasMapSettingsAvoidStairs___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasMapSettingsAvoidStairs];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsAvoidStairs_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setHasMapSettingsAvoidBusyRoads:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __56__GEOAPSharedStateData_setHasMapSettingsAvoidBusyRoads___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

BOOL __56__GEOAPSharedStateData_setHasMapSettingsAvoidBusyRoads___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasMapSettingsAvoidBusyRoads];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsAvoidBusyRoads_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setHasMapSettingsLocationPrecisionType:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __63__GEOAPSharedStateData_setHasMapSettingsLocationPrecisionType___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

BOOL __63__GEOAPSharedStateData_setHasMapSettingsLocationPrecisionType___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasMapSettingsLocationPrecisionType];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsLocationPrecisionType_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setHasMapSettingsEBike:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__GEOAPSharedStateData_setHasMapSettingsEBike___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

BOOL __47__GEOAPSharedStateData_setHasMapSettingsEBike___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasMapSettingsEBike];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsEBike_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setHasMapSettingsWalkingAvoidHills:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__GEOAPSharedStateData_setHasMapSettingsWalkingAvoidHills___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

BOOL __59__GEOAPSharedStateData_setHasMapSettingsWalkingAvoidHills___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasMapSettingsWalkingAvoidHills];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsWalkingAvoidHills_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setHasMapSettingsWalkingAvoidStairs:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__GEOAPSharedStateData_setHasMapSettingsWalkingAvoidStairs___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

BOOL __60__GEOAPSharedStateData_setHasMapSettingsWalkingAvoidStairs___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasMapSettingsWalkingAvoidStairs];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsWalkingAvoidStairs_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setHasMapSettingsWalkingAvoidBusyRoads:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __63__GEOAPSharedStateData_setHasMapSettingsWalkingAvoidBusyRoads___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

BOOL __63__GEOAPSharedStateData_setHasMapSettingsWalkingAvoidBusyRoads___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasMapSettingsWalkingAvoidBusyRoads];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsWalkingAvoidBusyRoads_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setMapSettingsDirectionsWakeDevice:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__GEOAPSharedStateData_setMapSettingsDirectionsWakeDevice___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

uint64_t __59__GEOAPSharedStateData_setMapSettingsDirectionsWakeDevice___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapSettingsDirectionsWakeDevice])
  {
    int v2 = [*(id *)(a1 + 32) mapSettingsDirectionsWakeDevice];
    int v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2) {
      return 0;
    }
  }
  else
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsDirectionsWakeDevice_, v3 != 0);
  return 1;
}

- (void)setHasMapSettingsDirectionsWakeDevice:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __62__GEOAPSharedStateData_setHasMapSettingsDirectionsWakeDevice___block_invoke;
  v3[3] = &unk_26534A150;
  v3[4] = self;
  BOOL v4 = a3;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v3];
}

BOOL __62__GEOAPSharedStateData_setHasMapSettingsDirectionsWakeDevice___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasMapSettingsDirectionsWakeDevice];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsDirectionsWakeDevice_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setMapFeatureSubmittedRatingsCount:(int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__GEOAPSharedStateData_setMapFeatureSubmittedRatingsCount___block_invoke;
  v3[3] = &unk_26534A1A0;
  int v4 = a3;
  v3[4] = self;
  [(GEOAPSharedStateData *)self performMapFeaturesStateOperation:v3];
}

uint64_t __59__GEOAPSharedStateData_setMapFeatureSubmittedRatingsCount___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v3, sel_setMapFeatureSubmittedRatingsCount_, v1);
  return 1;
}

- (void)setMapFeatureSubmittedPhotosCount:(int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__GEOAPSharedStateData_setMapFeatureSubmittedPhotosCount___block_invoke;
  v3[3] = &unk_26534A1A0;
  int v4 = a3;
  v3[4] = self;
  [(GEOAPSharedStateData *)self performMapFeaturesStateOperation:v3];
}

uint64_t __58__GEOAPSharedStateData_setMapFeatureSubmittedPhotosCount___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v3, sel_setMapFeatureSubmittedPhotosCount_, v1);
  return 1;
}

- (void)performMapUserSettingsStateOperation:(id)a3
{
  id v4 = a3;
  mapUserSettingsIso = self->_mapUserSettingsIso;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__GEOAPSharedStateData_performMapUserSettingsStateOperation___block_invoke;
  v7[3] = &unk_265345530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(GEOAPSharedStateData *)self _performSyncStateUpdateWithIsolator:mapUserSettingsIso updateBlock:v7];
}

uint64_t __61__GEOAPSharedStateData_performMapUserSettingsStateOperation___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    objc_super v3 = *(void **)(a1 + 32);
    return [v3 _resetTaskTimer];
  }
  return result;
}

- (void)performRoutingSettingsStateOperation:(id)a3
{
  id v4 = a3;
  routingSettingsIso = self->_routingSettingsIso;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__GEOAPSharedStateData_performRoutingSettingsStateOperation___block_invoke;
  v7[3] = &unk_265345530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(GEOAPSharedStateData *)self _performSyncStateUpdateWithIsolator:routingSettingsIso updateBlock:v7];
}

uint64_t __61__GEOAPSharedStateData_performRoutingSettingsStateOperation___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    objc_super v3 = *(void **)(a1 + 32);
    return [v3 _resetTaskTimer];
  }
  return result;
}

- (void)periodicSettingsHandler
{
  id v3 = objc_alloc_init(MEMORY[0x263F418B8]);
  id v4 = [(GEOAPSharedStateData *)self stateMapSettings];
  [v3 setMapSettings:v4];

  objc_super v5 = [(GEOAPSharedStateData *)self stateMapUIShown];
  [v3 setMapUiShown:v5];

  id v6 = [(GEOAPSharedStateData *)self stateMapsFeatures];
  [v3 setMapsFeatures:v6];

  uint64_t v7 = [(GEOAPSharedStateData *)self stateMapsUserSettings];
  [v3 setMapsUserSettings:v7];

  id v8 = [(GEOAPSharedStateData *)self stateRoutingSettings];
  [v3 setRoutingSettings:v8];

  id v9 = +[GEOAPStateFactory sharedFactory];
  objc_super v10 = [v9 stateForType:37];
  long long v11 = [v10 deviceSettings];
  [v3 setDeviceSettings:v11];

  long long v12 = [v3 data];

  id v14 = (id)[objc_alloc(MEMORY[0x263F418B8]) initWithData:v12];
  long long v13 = +[GEOAPServiceManager sharedManager];
  [v13 reportDailySettings:v14];
}

- (void)populateSearchResultsForQuery:(id)a3 searchResultSpecifierBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F41AB8]);
    id v8 = (void *)[v5 copy];
    [v7 setSearchQuery:v8];

    uint64_t v17 = 0;
    uint64_t v18 = 0;
    id v9 = (unsigned int (*)(void *, char *, unsigned int *, uint64_t *, uint64_t *))v6[2];
    unsigned int v16 = 0;
    LOBYTE(v10) = 0;
    if (v9(v6, (char *)&v18 + 4, &v16, &v17, &v18))
    {
      int v10 = 0;
      do
      {
        id v11 = objc_alloc_init(MEMORY[0x263F41BF8]);
        [v11 setResultIndex:HIDWORD(v18)];
        [v11 setBusinessId:v17];
        [v11 setLocalSearchProviderId:v18];
        unsigned int v12 = v16 - 2;
        if (v16 == 1) {
          int v13 = 1;
        }
        else {
          int v13 = v10;
        }
        if (v12 >= 2) {
          uint64_t v14 = v16 == 1;
        }
        else {
          uint64_t v14 = v16;
        }
        if (v12 >= 2) {
          int v10 = v13;
        }
        [v11 setResultType:v14];
        [v7 addSearchResults:v11];

        uint64_t v17 = 0;
        uint64_t v18 = 0;
        unsigned int v16 = 0;
      }
      while ((((uint64_t (*)(void *, char *, unsigned int *, uint64_t *, uint64_t *))v6[2])(v6, (char *)&v18 + 4, &v16, &v17, &v18) & 1) != 0);
    }
    [v7 setIncludesEnrichedResult:v10 & 1];
    id v15 = v7;
    geo_isolate_sync();
  }
}

uint64_t __81__GEOAPSharedStateData_populateSearchResultsForQuery_searchResultSpecifierBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSearchResultsState:*(void *)(a1 + 40)];
}

- (void)populateImpressionObjectId:(id)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  [a3 getUUIDBytes:&v10];
  id v3 = objc_alloc_init(MEMORY[0x263F419F8]);
  id v4 = objc_alloc_init(MEMORY[0x263F417B0]);
  [v3 setImpressionObjectId:v4];

  uint64_t v5 = v10;
  id v6 = [v3 impressionObjectId];
  [v6 setHigh:v5];

  uint64_t v7 = v11;
  id v8 = [v3 impressionObjectId];
  [v8 setLow:v7];

  id v9 = v3;
  geo_isolate_sync();
}

uint64_t __51__GEOAPSharedStateData_populateImpressionObjectId___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setImpressionObjectState:*(void *)(a1 + 40)];
}

- (void)populateTapEventForPinType:(int)a3 tapEventSpecifierBlock:(id)a4
{
  uint64_t v5 = a4;
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F41AD0]);
    unsigned int v15 = 0;
    unsigned int v14 = 0;
    uint64_t v13 = 0;
    unsigned int v12 = 0;
    uint64_t v7 = (unsigned int (*)(void *, unsigned int *, unsigned int *, uint64_t *, unsigned int *, unsigned __int8 *))v5[2];
    unsigned __int8 v11 = 0;
    if (v7(v5, &v15, &v12, &v13, &v14, &v11))
    {
      do
      {
        id v8 = objc_alloc_init(MEMORY[0x263F41BF8]);
        [v8 setResultIndex:v15];
        [v8 setBusinessId:v13];
        [v8 setLocalSearchProviderId:v14];
        [v8 setIsEnrichedItem:v11];
        if (v12 - 1 >= 3) {
          uint64_t v9 = 0;
        }
        else {
          uint64_t v9 = v12;
        }
        [v8 setResultType:v9];
        [v6 addSearchResults:v8];

        unsigned int v15 = 0;
        unsigned int v14 = 0;
        uint64_t v13 = 0;
        unsigned int v12 = 0;
        unsigned __int8 v11 = 0;
      }
      while ((((uint64_t (*)(void *, unsigned int *, unsigned int *, uint64_t *, unsigned int *, unsigned __int8 *))v5[2])(v5, &v15, &v12, &v13, &v14, &v11) & 1) != 0);
    }
    if ((a3 - 1) <= 3) {
      objc_msgSend(v6, "setPinType:");
    }
    id v10 = v6;
    geo_isolate_sync();
  }
}

uint64_t __74__GEOAPSharedStateData_populateTapEventForPinType_tapEventSpecifierBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTapEventState:*(void *)(a1 + 40)];
}

- (void)populateTapEventForResultIndex:(unsigned int)a3 resultType:(int)a4 businessId:(unint64_t)a5 localSearchProviderId:(unsigned int)a6 isEnrichedItem:(BOOL)a7
{
}

void __114__GEOAPSharedStateData_populateTapEventForResultIndex_resultType_businessId_localSearchProviderId_isEnrichedItem___block_invoke(uint64_t a1)
{
  id v6 = objc_alloc_init(MEMORY[0x263F41AD0]);
  id v2 = objc_alloc_init(MEMORY[0x263F41BF8]);
  [v2 setResultIndex:*(unsigned int *)(a1 + 48)];
  [v2 setBusinessId:*(void *)(a1 + 40)];
  [v2 setLocalSearchProviderId:*(unsigned int *)(a1 + 52)];
  [v2 setIsEnrichedItem:*(unsigned __int8 *)(a1 + 60)];
  unsigned int v3 = *(_DWORD *)(a1 + 56);
  if (v3 - 1 >= 3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = v3;
  }
  [v2 setResultType:v4];
  uint64_t v5 = [MEMORY[0x263EFF980] arrayWithObject:v2];
  [v6 setSearchResults:v5];

  [*(id *)(a1 + 32) setTapEventState:v6];
}

- (void)populateActionButtonDetails:(id)a3
{
  unsigned int v3 = (uint64_t (**)(id, id *, id *, int *, unsigned __int8 *))a3;
  id v4 = objc_alloc_init(MEMORY[0x263F419A0]);
  while (1)
  {
    int v17 = 0;
    unsigned __int8 v16 = 0;
    id v14 = 0;
    id v15 = 0;
    int v5 = v3[2](v3, &v15, &v14, &v17, &v16);
    id v6 = v15;
    id v7 = v14;
    id v8 = v7;
    if (!v5) {
      break;
    }
    id v9 = objc_alloc_init(MEMORY[0x263F41710]);
    id v10 = (void *)[v6 copy];
    [v9 setCategory:v10];

    unsigned __int8 v11 = (void *)[v8 copy];
    [v9 setProviderId:v11];

    if (v17 == 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = 2 * (v17 == 2);
    }
    [v9 setLinkType:v12];
    [v9 setDropDown:v16];
    [v4 addActionButtonDetails:v9];
  }
  id v13 = v4;
  geo_isolate_sync();
}

uint64_t __52__GEOAPSharedStateData_populateActionButtonDetails___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setActionButtonDetailsState:*(void *)(a1 + 40)];
}

- (void)populatePhotoSubmissionDetailsWithEntryPoint:(int)a3 numberOfPhotos:(unsigned int)a4 numberOfARPSuggestedPhotos:(unsigned int)a5 originTarget:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  id v9 = (objc_class *)MEMORY[0x263F41980];
  id v10 = a6;
  id v11 = objc_alloc_init(v9);
  [v11 setOriginTarget:v10];

  switch(a3)
  {
    case 2:
      [v11 setIsPlacecardInlineSubmission:1];
      break;
    case 1:
      [v11 setIsFromMapsSuggesions:1];
      break;
    case 0:
      [v11 setIsFromRecommendationCard:1];
      break;
  }
  [v11 setNumberOfPhotos:v7];
  [v11 setNumberOfAprSuggestedPhotos:v6];
  id v12 = v11;
  geo_isolate_sync();
}

uint64_t __124__GEOAPSharedStateData_populatePhotoSubmissionDetailsWithEntryPoint_numberOfPhotos_numberOfARPSuggestedPhotos_originTarget___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPhotoSubmissionDetailsState:*(void *)(a1 + 40)];
}

- (void)populateRatingSubmissionDetailsWithEntryPoint:(int)a3 originTarget:(id)a4 specifierBlock:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x263F41990]);
  [v9 setOriginTarget:v7];
  switch(a3)
  {
    case 2:
      [v9 setIsPlacecardInlineSubmission:1];
      break;
    case 1:
      [v9 setIsFromMapsSuggesions:1];
      break;
    case 0:
      [v9 setIsFromRecommendationCard:1];
      break;
  }
  id v10 = (uint64_t (*)(void *, id *, unsigned __int8 *))v8[2];
  unsigned __int8 v16 = 0;
  id v15 = 0;
  int v11 = v10(v8, &v15, &v16);
  id v12 = v15;
  if (v11)
  {
    do
    {
      id v13 = objc_alloc_init(MEMORY[0x263F41708]);
      [v13 setRating:v16];
      [v13 setDisplayedText:v12];
      [v9 addRatings:v13];

      unsigned __int8 v16 = 0;
      id v15 = 0;
      LOBYTE(v13) = ((uint64_t (*)(void *, id *, unsigned __int8 *))v8[2])(v8, &v15, &v16);
      id v12 = v15;
    }
    while ((v13 & 1) != 0);
  }

  id v14 = v9;
  geo_isolate_sync();
}

uint64_t __98__GEOAPSharedStateData_populateRatingSubmissionDetailsWithEntryPoint_originTarget_specifierBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRatingSubmissionDetailsState:*(void *)(a1 + 40)];
}

- (void)populateRatingPhotoSubmissionDetailsWithEntryPoint:(int)a3 originTarget:(id)a4
{
  int v5 = (objc_class *)MEMORY[0x263F41988];
  id v6 = a4;
  id v7 = objc_alloc_init(v5);
  [v7 setOriginTarget:v6];

  switch(a3)
  {
    case 2:
      [v7 setIsPlacecardInlineSubmission:1];
      break;
    case 1:
      [v7 setIsFromMapsSuggesions:1];
      break;
    case 0:
      [v7 setIsFromRecommendationCard:1];
      break;
  }
  id v8 = v7;
  geo_isolate_sync();
}

uint64_t __88__GEOAPSharedStateData_populateRatingPhotoSubmissionDetailsWithEntryPoint_originTarget___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRatingPhotoSubmissionDetailsState:*(void *)(a1 + 40)];
}

- (id)stateMapSettings
{
  id v3 = objc_alloc_init(MEMORY[0x263F41A18]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _DWORD v8[2] = __40__GEOAPSharedStateData_stateMapSettings__block_invoke;
  v8[3] = &unk_26534A178;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  [(GEOAPSharedStateData *)self performMapSettingsStateOperation:v8];
  int v5 = v9;
  id v6 = v4;

  return v6;
}

uint64_t __40__GEOAPSharedStateData_stateMapSettings__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapSettingsNavVolume]) {
    objc_msgSend(*(id *)(a1 + 40), "setNavVoiceVolume:", objc_msgSend(*(id *)(a1 + 32), "navVoiceVolumeAsGEONavVoiceVolume"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsTransportMode]) {
    objc_msgSend(*(id *)(a1 + 40), "setPreferredTransportMode:", objc_msgSend(*(id *)(a1 + 32), "transportModeAsGEOTransportMode"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsAvoidHighways]) {
    objc_msgSend(*(id *)(a1 + 40), "setAvoidHighways:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsAvoidHighways"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsAvoidTolls]) {
    objc_msgSend(*(id *)(a1 + 40), "setAvoidTolls:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsAvoidTolls"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsFindMyCarEnabled]) {
    objc_msgSend(*(id *)(a1 + 40), "setFindMyCarEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsFindMyCarEnabled"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsHeadingEnabled]) {
    objc_msgSend(*(id *)(a1 + 40), "setHeadingEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsHeadingEnabled"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsLabelEnabled]) {
    objc_msgSend(*(id *)(a1 + 40), "setLabelEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsLabelEnabled"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsPauseSpokenAudioEnabled]) {
    objc_msgSend(*(id *)(a1 + 40), "setPauseSpokenAudioEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsPauseSpokenAudioEnabled"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsSpeedLimitEnabled]) {
    objc_msgSend(*(id *)(a1 + 40), "setSpeedLimitEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsSpeedLimitEnabled"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsTrafficEnabled]) {
    objc_msgSend(*(id *)(a1 + 40), "setTrafficEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsTrafficEnabled"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsAvoidHills]) {
    objc_msgSend(*(id *)(a1 + 40), "setBikingAvoidHills:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsAvoidHills"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsAvoidStairs]) {
    objc_msgSend(*(id *)(a1 + 40), "setBikingAvoidStairs:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsAvoidStairs"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsAvoidBusyRoads]) {
    objc_msgSend(*(id *)(a1 + 40), "setBikingAvoidBusyRoads:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsAvoidBusyRoads"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsEBike]) {
    objc_msgSend(*(id *)(a1 + 40), "setEBike:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsEBike"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsLocationPrecisionType]) {
    objc_msgSend(*(id *)(a1 + 40), "setLocationType:", objc_msgSend(*(id *)(a1 + 32), "locationPrecisionTypeAsGEOSettingsLocationType"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsDrivingVoiceSettings]) {
    objc_msgSend(*(id *)(a1 + 40), "setDrivingVoiceSettings:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsDrivingVoiceSettings"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsWalkingVoiceSettings]) {
    objc_msgSend(*(id *)(a1 + 40), "setWalkingVoiceSettings:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsWalkingVoiceSettings"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsCyclingVoiceSettings]) {
    objc_msgSend(*(id *)(a1 + 40), "setCyclingVoiceSettings:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsCyclingVoiceSettings"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsIsHandsFreeProfileEnabled]) {
    objc_msgSend(*(id *)(a1 + 40), "setHFPEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsIsHandsFreeProfileEnabled"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsWalkingAvoidHills]) {
    objc_msgSend(*(id *)(a1 + 40), "setWalkingAvoidHills:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsWalkingAvoidHills"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsWalkingAvoidStairs]) {
    objc_msgSend(*(id *)(a1 + 40), "setWalkingAvoidStairs:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsWalkingAvoidStairs"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsWalkingAvoidBusyRoads]) {
    objc_msgSend(*(id *)(a1 + 40), "setWalkingAvoidBusyRoads:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsWalkingAvoidBusyRoads"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsDirectionsWakeDevice]) {
    objc_msgSend(*(id *)(a1 + 40), "setDirectionsWakeDevice:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsDirectionsWakeDevice"));
  }
  return 0;
}

- (id)stateMapUIShown
{
  id v3 = objc_alloc_init(MEMORY[0x263F41A28]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _DWORD v8[2] = __39__GEOAPSharedStateData_stateMapUIShown__block_invoke;
  v8[3] = &unk_26534A178;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  [(GEOAPSharedStateData *)self performMapUIShownStateOperation:v8];
  int v5 = v9;
  id v6 = v4;

  return v6;
}

uint64_t __39__GEOAPSharedStateData_stateMapUIShown__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapUiShownAqiShown]) {
    objc_msgSend(*(id *)(a1 + 40), "setIsAirQualityShown:", objc_msgSend(*(id *)(a1 + 32), "mapUiShownAqiShown"));
  }
  if ([*(id *)(a1 + 32) hasMapUiShownWeatherShown]) {
    objc_msgSend(*(id *)(a1 + 40), "setIsWeatherShown:", objc_msgSend(*(id *)(a1 + 32), "mapUiShownWeatherShown"));
  }
  if ([*(id *)(a1 + 32) hasVenueExperienceShown]) {
    objc_msgSend(*(id *)(a1 + 40), "setIsVenueExperienceShown:", objc_msgSend(*(id *)(a1 + 32), "venueExperienceShown"));
  }
  if ([*(id *)(a1 + 32) hasMapUiShownActiveNavMode]) {
    objc_msgSend(*(id *)(a1 + 40), "setActiveNavMode:", objc_msgSend(*(id *)(a1 + 32), "activeNavModeAsGEOTransportType"));
  }
  if ([*(id *)(a1 + 32) hasLookAroundEntryIconShown]) {
    objc_msgSend(*(id *)(a1 + 40), "setIsLookAroundEntryIconShown:", objc_msgSend(*(id *)(a1 + 32), "lookAroundEntryIconShown"));
  }
  return 0;
}

- (id)stateMapsFeatures
{
  id v3 = objc_alloc_init(MEMORY[0x263F41A40]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _DWORD v8[2] = __41__GEOAPSharedStateData_stateMapsFeatures__block_invoke;
  v8[3] = &unk_26534A178;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  [(GEOAPSharedStateData *)self performMapFeaturesStateOperation:v8];
  int v5 = v9;
  id v6 = v4;

  return v6;
}

uint64_t __41__GEOAPSharedStateData_stateMapsFeatures__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapFeaturePersonalCollectionsCount]) {
    objc_msgSend(*(id *)(a1 + 40), "setPersonalCollectionsCount:", objc_msgSend(*(id *)(a1 + 32), "mapFeaturePersonalCollectionsCount"));
  }
  if ([*(id *)(a1 + 32) hasMapFeatureSavedCollectionsCount]) {
    objc_msgSend(*(id *)(a1 + 40), "setSavedCollectionsCount:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureSavedCollectionsCount"));
  }
  if ([*(id *)(a1 + 32) hasMapFeatureSubmittedRatingsCount]) {
    objc_msgSend(*(id *)(a1 + 40), "setSubmittedRatingsCount:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureSubmittedRatingsCount"));
  }
  if ([*(id *)(a1 + 32) hasMapFeatureSubmittedPhotosCount]) {
    objc_msgSend(*(id *)(a1 + 40), "setSubmittedPhotosCount:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureSubmittedPhotosCount"));
  }
  if ([*(id *)(a1 + 32) hasMapFeatureIsHomeFavoriteSet]) {
    objc_msgSend(*(id *)(a1 + 40), "setHomeFavoriteSet:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureIsHomeFavoriteSet"));
  }
  if ([*(id *)(a1 + 32) hasMapFeatureIsWorkFavoriteSet]) {
    objc_msgSend(*(id *)(a1 + 40), "setWorkFavoriteSet:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureIsWorkFavoriteSet"));
  }
  if ([*(id *)(a1 + 32) hasMapFeatureIsSchoolFavoriteSet]) {
    objc_msgSend(*(id *)(a1 + 40), "setSchoolFavoriteSet:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureIsSchoolFavoriteSet"));
  }
  if ([*(id *)(a1 + 32) hasMapFeatureIsTransitFavoriteSet]) {
    objc_msgSend(*(id *)(a1 + 40), "setTransitFavoriteSet:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureIsTransitFavoriteSet"));
  }
  if ([*(id *)(a1 + 32) hasMapFeatureFavoritesCount]) {
    objc_msgSend(*(id *)(a1 + 40), "setFavoritesCount:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureFavoritesCount"));
  }
  if ([*(id *)(a1 + 32) hasMapFeatureLibrarySavedPlacesCount]) {
    objc_msgSend(*(id *)(a1 + 40), "setLibrarySavedPlacesCount:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureLibrarySavedPlacesCount"));
  }
  if ([*(id *)(a1 + 32) hasMapFeatureLibraryPlacesWithNoteCount]) {
    objc_msgSend(*(id *)(a1 + 40), "setLibraryPlacesWithNoteCount:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureLibraryPlacesWithNoteCount"));
  }
  if ([*(id *)(a1 + 32) hasMapFeatureLibraryGuidesSavedPlacesCount]) {
    objc_msgSend(*(id *)(a1 + 40), "setLibraryGuidesSavedPlacesCount:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureLibraryGuidesSavedPlacesCount"));
  }
  if ([*(id *)(a1 + 32) hasMapFeatureLibraryFavoritesGuideSavedPlacesCount]) {
    objc_msgSend(*(id *)(a1 + 40), "setLibraryFavoritesGuideSavedPlacesCount:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureLibraryFavoritesGuideSavedPlacesCount"));
  }
  return 0;
}

- (id)stateMapsUserSettings
{
  id v3 = objc_alloc_init(MEMORY[0x263F41A58]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _DWORD v8[2] = __45__GEOAPSharedStateData_stateMapsUserSettings__block_invoke;
  v8[3] = &unk_26534A178;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  [(GEOAPSharedStateData *)self performMapUserSettingsStateOperation:v8];
  int v5 = v9;
  id v6 = v4;

  return v6;
}

uint64_t __45__GEOAPSharedStateData_stateMapsUserSettings__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasSuggestionsSiriEnabled]) {
    objc_msgSend(*(id *)(a1 + 40), "setSiriSuggestionsEnabled:", objc_msgSend(*(id *)(a1 + 32), "suggestionsSiriEnabled"));
  }
  if ([*(id *)(a1 + 32) hasMapSettingsNotificationsEnabled]) {
    objc_msgSend(*(id *)(a1 + 40), "setNotificationsEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsNotificationsEnabled"));
  }
  [*(id *)(a1 + 40) setIsOptedInToVlCrowdsourcing:GEOConfigGetBOOL()];
  return 0;
}

- (id)stateRoutingSettings
{
  id v3 = objc_alloc_init(MEMORY[0x263F41AA8]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _DWORD v8[2] = __44__GEOAPSharedStateData_stateRoutingSettings__block_invoke;
  v8[3] = &unk_26534A178;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  [(GEOAPSharedStateData *)self performRoutingSettingsStateOperation:v8];
  int v5 = v9;
  id v6 = v4;

  return v6;
}

uint64_t __44__GEOAPSharedStateData_stateRoutingSettings__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F41BE8]);
  if ([*(id *)(a1 + 32) hasMapFeatureElectronicVehicleCount]) {
    objc_msgSend(v2, "setElectronicVehicleCount:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureElectronicVehicleCount"));
  }
  if ([*(id *)(a1 + 32) hasMapFeatureLicensePlateCount]) {
    objc_msgSend(v2, "setLicensePlateCount:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureLicensePlateCount"));
  }
  if ([v2 electronicVehicleCount] || objc_msgSend(v2, "licensePlateCount")) {
    [*(id *)(a1 + 40) setVirtualGarageSettings:v2];
  }

  return 0;
}

- (id)stateSearchResults
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__2;
  id v8 = __Block_byref_object_dispose__2;
  id v9 = 0;
  geo_isolate_sync();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __42__GEOAPSharedStateData_stateSearchResults__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) searchResultsState];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)stateImpressionObject
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__2;
  id v8 = __Block_byref_object_dispose__2;
  id v9 = 0;
  geo_isolate_sync();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __45__GEOAPSharedStateData_stateImpressionObject__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) impressionObjectState];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)stateTapEvents
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__2;
  id v8 = __Block_byref_object_dispose__2;
  id v9 = 0;
  geo_isolate_sync();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __38__GEOAPSharedStateData_stateTapEvents__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) tapEventState];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)_hasActualUserHomeMetro
{
  if (_GEOConfigHasValue())
  {
    uint64_t v2 = GEOConfigGetString();
    int v3 = [&unk_270162D88 containsObject:v2] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)_hasActualFallbackData
{
  if (_GEOConfigHasValue() && _GEOConfigHasValue())
  {
    uint64_t v2 = GEOConfigGetString();
    if ([&unk_270162D88 containsObject:v2])
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      uint64_t v4 = GEOConfigGetString();
      int v3 = [&unk_270162D88 containsObject:v4] ^ 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)_metroForLatLng:(id)a3 inCountry:(id)a4 filterWithAllowList:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = +[GEOMetroRegionAssetProvider sharedProvider];
  id v10 = v9;
  if (v7)
  {
    int v11 = [v9 urlForInstalledCountryCode:v8];

    if (v11)
    {
      id v12 = objc_alloc_init(GEOMetroRegionLookup);
      id v13 = [(GEOMetroRegionLookup *)v12 lookupRegionWithLocation:v7 countryCodeHint:v8];
      if (!v13)
      {
        v22 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          int v24 = 138477827;
          uint64_t v25 = v7;
          _os_log_impl(&dword_24FE56000, v22, OS_LOG_TYPE_DEBUG, "no metro region region at %{private}@", (uint8_t *)&v24, 0xCu);
        }

        uint64_t v21 = @"OTHER";
        goto LABEL_31;
      }
      if (!v5) {
        goto LABEL_14;
      }
      id v14 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        int v24 = 138477827;
        uint64_t v25 = v13;
        _os_log_impl(&dword_24FE56000, v14, OS_LOG_TYPE_DEBUG, "will apply allow list filtering to %{private}@", (uint8_t *)&v24, 0xCu);
      }

      id v15 = [v10 homeMetroAcceptListForCountryCode:v8];
      unsigned __int8 v16 = v15;
      if (v15)
      {
        int v17 = [v15 containsObject:v13];
        uint64_t v18 = GEOFindOrCreateLog();
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
        if (v17)
        {
          if (v19)
          {
            int v24 = 138477827;
            uint64_t v25 = v13;
            _os_log_impl(&dword_24FE56000, v18, OS_LOG_TYPE_DEBUG, "metros %{private}@ is allowed", (uint8_t *)&v24, 0xCu);
          }

          v20 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            int v24 = 138477827;
            uint64_t v25 = v13;
            _os_log_impl(&dword_24FE56000, v20, OS_LOG_TYPE_DEBUG, "using metro %{private}@", (uint8_t *)&v24, 0xCu);
          }

LABEL_14:
          uint64_t v21 = v13;
LABEL_31:

          goto LABEL_32;
        }
        if (v19)
        {
          int v24 = 138477827;
          uint64_t v25 = v13;
          _os_log_impl(&dword_24FE56000, v18, OS_LOG_TYPE_DEBUG, "metros %{private}@ is not allowed", (uint8_t *)&v24, 0xCu);
        }
        uint64_t v21 = @"OTHER";
      }
      else
      {
        uint64_t v18 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          int v24 = 138477827;
          uint64_t v25 = v8;
          _os_log_impl(&dword_24FE56000, v18, OS_LOG_TYPE_DEBUG, "no metro allow list for %{private}@", (uint8_t *)&v24, 0xCu);
        }
        uint64_t v21 = @"MISSING_ALLOW_LIST";
      }

      goto LABEL_31;
    }
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v24 = 138477827;
      uint64_t v25 = v8;
      _os_log_impl(&dword_24FE56000, v13, OS_LOG_TYPE_DEBUG, "metro regions for %{private}@ are unavailable", (uint8_t *)&v24, 0xCu);
    }
    uint64_t v21 = @"MISSING_REGIONS";
  }
  else
  {
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_24FE56000, v13, OS_LOG_TYPE_DEBUG, "no metro lat/lng provided", (uint8_t *)&v24, 2u);
    }
    uint64_t v21 = @"MISSING_LOCATION";
  }
LABEL_32:

  return v21;
}

- (id)_filteredHomeCountry:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = +[GEOMetroRegionAssetProvider sharedProvider];
  BOOL v5 = [v4 homeCountryCodeAcceptList];

  if (v5)
  {
    char v6 = [v5 containsObject:v3];
    id v7 = GEOFindOrCreateLog();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    if (v6)
    {
      if (v8)
      {
        int v12 = 138477827;
        id v13 = v3;
        _os_log_impl(&dword_24FE56000, v7, OS_LOG_TYPE_DEBUG, "MeCountry is %{private}@", (uint8_t *)&v12, 0xCu);
      }

      id v9 = (__CFString *)v3;
    }
    else
    {
      if (v8)
      {
        int v12 = 138477827;
        id v13 = v3;
        _os_log_impl(&dword_24FE56000, v7, OS_LOG_TYPE_DEBUG, "%{private}@ is not on the allow list", (uint8_t *)&v12, 0xCu);
      }

      id v9 = @"OTHER";
    }
  }
  else
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_24FE56000, v10, OS_LOG_TYPE_DEBUG, "no home countryCode list is available", (uint8_t *)&v12, 2u);
    }

    id v9 = @"MISSING_ALLOW_LIST";
  }

  return v9;
}

- (void)setCurrentMetro:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3;
  BOOL v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138477827;
    id v15 = v4;
    _os_log_impl(&dword_24FE56000, v5, OS_LOG_TYPE_DEBUG, "updating current metro at %{private}@", (uint8_t *)&v14, 0xCu);
  }

  char v6 = [MEMORY[0x263F41770] sharedConfiguration];
  id v7 = [v6 countryCode];

  BOOL v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138477827;
    id v15 = v7;
    _os_log_impl(&dword_24FE56000, v8, OS_LOG_TYPE_DEBUG, "using countryCode %{private}@", (uint8_t *)&v14, 0xCu);
  }

  id v9 = [(GEOAPSharedStateData *)self _metroForLatLng:v4 inCountry:v7 filterWithAllowList:0];
  id v10 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138477827;
    id v15 = v9;
    _os_log_impl(&dword_24FE56000, v10, OS_LOG_TYPE_DEBUG, "current metro is %{private}@", (uint8_t *)&v14, 0xCu);
  }

  if (v9) {
    GEOConfigSetString();
  }
  else {
    _GEOConfigRemoveValue();
  }
  if ((GEOConfigGetBOOL() & 1) == 0 && [(GEOAPSharedStateData *)self _hasActualFallbackData])
  {
    int v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_24FE56000, v11, OS_LOG_TYPE_DEBUG, "fallback metro is already set", (uint8_t *)&v14, 2u);
    }
    goto LABEL_22;
  }
  int v11 = [(GEOAPSharedStateData *)self _metroForLatLng:v4 inCountry:v7 filterWithAllowList:1];
  if (!v11)
  {
    _GEOConfigRemoveValue();
    if (v7) {
      goto LABEL_16;
    }
LABEL_18:
    _GEOConfigRemoveValue();
    goto LABEL_19;
  }
  GEOConfigSetString();
  if (!v7) {
    goto LABEL_18;
  }
LABEL_16:
  uint64_t v12 = [(GEOAPSharedStateData *)self _filteredHomeCountry:v7];

  GEOConfigSetString();
  id v7 = v12;
LABEL_19:
  GEOConfigSetBOOL();
  id v13 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138478083;
    id v15 = v11;
    __int16 v16 = 2113;
    int v17 = v7;
    _os_log_impl(&dword_24FE56000, v13, OS_LOG_TYPE_DEBUG, "setting fallback metro to %{private}@, country to %{private}@", (uint8_t *)&v14, 0x16u);
  }

LABEL_22:
}

- (void)setMeCardHomeCountry:(id)a3 andHomeLocation:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138478083;
    id v15 = v6;
    __int16 v16 = 2113;
    id v17 = v7;
    _os_log_impl(&dword_24FE56000, v8, OS_LOG_TYPE_DEBUG, "setting meCard country with %{private}@, %{private}@", (uint8_t *)&v14, 0x16u);
  }

  if (v6)
  {
    id v9 = [(GEOAPSharedStateData *)self _filteredHomeCountry:v6];
  }
  else
  {
    id v10 = [MEMORY[0x263F41770] sharedConfiguration];
    id v6 = [v10 countryCode];

    int v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138477827;
      id v15 = v6;
      _os_log_impl(&dword_24FE56000, v11, OS_LOG_TYPE_DEBUG, "no countryCode provided; using countryCode %{private}@",
        (uint8_t *)&v14,
        0xCu);
    }

    id v9 = @"UNKNOWN";
  }
  uint64_t v12 = [(GEOAPSharedStateData *)self _metroForLatLng:v7 inCountry:v6 filterWithAllowList:1];
  id v13 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138477827;
    id v15 = v12;
    _os_log_impl(&dword_24FE56000, v13, OS_LOG_TYPE_DEBUG, "MeMetro is %{private}@", (uint8_t *)&v14, 0xCu);
  }

  GEOConfigSetString();
  GEOConfigSetString();
}

- (BOOL)_isHandoff
{
  if (![(GEOAnalyticsPipelineStateData *)self hasMapLaunchIsHandoff]
    || ![(GEOAnalyticsPipelineStateData *)self hasMapLaunchSourceHandoffDevice])
  {
    return 0;
  }
  return [(GEOAnalyticsPipelineStateData *)self mapLaunchIsHandoff];
}

- (BOOL)_isHandoffFromDeviceType:(id)a3
{
  id v4 = a3;
  if ([(GEOAPSharedStateData *)self _isHandoff])
  {
    BOOL v5 = [(GEOAnalyticsPipelineStateData *)self mapLaunchSourceHandoffDevice];
    char v6 = [v5 hasPrefix:v4];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isIPadHandoff
{
  return [(GEOAPSharedStateData *)self _isHandoffFromDeviceType:@"iPad"];
}

- (BOOL)isIPhoneHandoff
{
  return [(GEOAPSharedStateData *)self _isHandoffFromDeviceType:@"iPhone"];
}

- (BOOL)isWatchHandoff
{
  return [(GEOAPSharedStateData *)self _isHandoffFromDeviceType:@"Watch"];
}

- (BOOL)isMacHandoff
{
  BOOL v3 = [(GEOAPSharedStateData *)self _isHandoff];
  if (v3)
  {
    if ([(GEOAPSharedStateData *)self isIPadHandoff]
      || [(GEOAPSharedStateData *)self isIPadHandoff])
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      LOBYTE(v3) = ![(GEOAPSharedStateData *)self isWatchHandoff];
    }
  }
  return v3;
}

- (void)setMapViewViewMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = [(GEOAnalyticsPipelineStateData *)self mapViewViewMode];
  v9.receiver = self;
  v9.super_class = (Class)GEOAPSharedStateData;
  [(GEOAnalyticsPipelineStateData *)&v9 setMapViewViewMode:v3];
  if (v5 != v3)
  {
    int v6 = v3 - 1;
    if (v3 - 1) <= 7 && ((0x8Fu >> v6))
    {
      uint64_t v7 = dword_24FEFA8B4[v6];
      BOOL v8 = +[GEOAPServiceManager sharedManager];
      [v8 reportDailyUsageCountType:v7 usageString:0 usageBool:0 appId:0 completion:0];
    }
  }
}

- (BOOL)hasShowcase
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  geo_reentrant_isolate_sync();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __35__GEOAPSharedStateData_hasShowcase__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  char v2 = objc_msgSend(*(id *)(a1 + 32), "placeCardState", 0);
  uint64_t v3 = [v2 modules];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) type] == 40)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (BOOL)shouldCountAsEnrichmentResult
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__GEOAPSharedStateData_shouldCountAsEnrichmentResult__block_invoke;
  v6[3] = &unk_26534A218;
  v6[4] = &v7;
  [(GEOAPSharedStateData *)self bestUserHomeLocation:v6];
  uint64_t v3 = [(GEOAnalyticsPipelineStateData *)self searchResultsState];
  if ([v3 includesEnrichedResult]) {
    BOOL v4 = *((unsigned char *)v8 + 24) != 0;
  }
  else {
    BOOL v4 = 0;
  }

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __53__GEOAPSharedStateData_shouldCountAsEnrichmentResult__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  GEOConfigGetArray();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  char v4 = [v5 containsObject:v3];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
}

- (void)populatePlaceIdsWithSpecifierBlock:(id)a3
{
  id v3 = (uint64_t (**)(id, char *, uint64_t *, uint64_t *, uint64_t *))a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F41A48]);
    uint64_t v9 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    if (v3[2](v3, (char *)&v9 + 4, &v7, &v8, &v9))
    {
      do
      {
        id v5 = objc_alloc_init(MEMORY[0x263F41B80]);
        [v5 setResultIndex:HIDWORD(v9)];
        [v5 setBusinessId:v8];
        [v5 setBasemapId:v7];
        [v5 setLocalSearchProviderId:v9];
        [v4 addPlaceIdDetails:v5];

        uint64_t v9 = 0;
        uint64_t v7 = 0;
        uint64_t v8 = 0;
      }
      while ((v3[2](v3, (char *)&v9 + 4, &v7, &v8, &v9) & 1) != 0);
    }
    id v6 = v4;
    geo_isolate_sync();
  }
}

uint64_t __59__GEOAPSharedStateData_populatePlaceIdsWithSpecifierBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMapsPlaceIdsState:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_periodicSettingsTimer, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_placeMapsIdIso, 0);
  objc_storeStrong((id *)&self->_ratingPhotoSubmissionStateIso, 0);
  objc_storeStrong((id *)&self->_ratingSubmissionStateIso, 0);
  objc_storeStrong((id *)&self->_photoSubmissionStateIso, 0);
  objc_storeStrong((id *)&self->_actionButtonDetailsStateIso, 0);
  objc_storeStrong((id *)&self->_tapEventStateIso, 0);
  objc_storeStrong((id *)&self->_impressionObjectStateIso, 0);
  objc_storeStrong((id *)&self->_searchResultsStateIso, 0);
  objc_storeStrong((id *)&self->_routingSettingsIso, 0);
  objc_storeStrong((id *)&self->_mapUserSettingsIso, 0);
  objc_storeStrong((id *)&self->_mapFeaturesIso, 0);
  objc_storeStrong((id *)&self->_userProfileIso, 0);
  objc_storeStrong((id *)&self->_mapUIShownIso, 0);
  objc_storeStrong((id *)&self->_mapSettingsIso, 0);
  objc_storeStrong((id *)&self->_mapViewIso, 0);
  objc_storeStrong((id *)&self->_placeIso, 0);
}

@end