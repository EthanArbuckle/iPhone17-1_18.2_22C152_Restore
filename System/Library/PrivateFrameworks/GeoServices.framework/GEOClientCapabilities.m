@interface GEOClientCapabilities
+ (BOOL)isValid:(id)a3;
+ (Class)displayLanguagesType;
- (BOOL)clusteredTransitRoutesSupported;
- (BOOL)hasAbAssignInfo;
- (BOOL)hasAdvisoryClientCapabilities;
- (BOOL)hasAppMajorVersion;
- (BOOL)hasAppMinorVersion;
- (BOOL)hasArtworkCapabilities;
- (BOOL)hasClusteredTransitRoutesSupported;
- (BOOL)hasDeviceCountryCode;
- (BOOL)hasDeviceSku;
- (BOOL)hasDisplayRegion;
- (BOOL)hasFormattedStringClientCapabilities;
- (BOOL)hasHardwareClass;
- (BOOL)hasHardwareModel;
- (BOOL)hasIncludeCrossLanguagePhonetics;
- (BOOL)hasInternalInstall;
- (BOOL)hasInternalTool;
- (BOOL)hasIsAdvancedMap;
- (BOOL)hasIsGlobeProjection;
- (BOOL)hasLocalizationCapabilities;
- (BOOL)hasMaxFormatterSupported;
- (BOOL)hasMaxManeuverTypeSupported;
- (BOOL)hasMaxRouteIncidentSupported;
- (BOOL)hasMaxSupportedTransitFareVersion;
- (BOOL)hasMaxTrafficSpeedSupported;
- (BOOL)hasMaxZilchMessageVersionSupported;
- (BOOL)hasOsVersion;
- (BOOL)hasReplaceAccidentStringWithCrash;
- (BOOL)hasRequestTime;
- (BOOL)hasRouteOptionsSupported;
- (BOOL)hasSnapToClosestStopSupported;
- (BOOL)hasSupportEmissionsTagging;
- (BOOL)hasSupportsAdvancedMap;
- (BOOL)hasSupportsAreaEventsEnhancements;
- (BOOL)hasSupportsArrivalMapRegion;
- (BOOL)hasSupportsBannerQueuing;
- (BOOL)hasSupportsBannerQueuingDirections;
- (BOOL)hasSupportsCongestionZones;
- (BOOL)hasSupportsDefaultToNewRouteFlag;
- (BOOL)hasSupportsDisablingProgressBarFromBannerButtons;
- (BOOL)hasSupportsDodgeballCameraInput;
- (BOOL)hasSupportsElectricVehicleRoutes;
- (BOOL)hasSupportsEv2;
- (BOOL)hasSupportsGenericCombinationsInstructionsForAllModes;
- (BOOL)hasSupportsGuidanceEventImportanceInfo;
- (BOOL)hasSupportsGuidanceEventPrivacyFilters;
- (BOOL)hasSupportsGuidanceEvents;
- (BOOL)hasSupportsGuidanceEventsInlineShields;
- (BOOL)hasSupportsJunctionView;
- (BOOL)hasSupportsLicensePlateRestrictions;
- (BOOL)hasSupportsLongShieldStrings;
- (BOOL)hasSupportsNaturalGuidance;
- (BOOL)hasSupportsRoadComplexities;
- (BOOL)hasSupportsRouteCameraInputUpdates;
- (BOOL)hasSupportsRouteNameRanges;
- (BOOL)hasSupportsSilentRouteUpdates;
- (BOOL)hasSupportsSpeedTrapAnnouncements;
- (BOOL)hasSupportsTrafficCameras;
- (BOOL)hasSupportsUserIncidentReports;
- (BOOL)hasSupportsWalkingSuggestionsAfterParking;
- (BOOL)hasSupportsWaypointRoutes;
- (BOOL)hasTransitMarketSupport;
- (BOOL)hasUserCurrentTimezone;
- (BOOL)hasWalkingSupportedFeatures;
- (BOOL)hasWillSendEvDirectionsFeedback;
- (BOOL)includeCrossLanguagePhonetics;
- (BOOL)internalInstall;
- (BOOL)internalTool;
- (BOOL)isAdvancedMap;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGlobeProjection;
- (BOOL)readFrom:(id)a3;
- (BOOL)replaceAccidentStringWithCrash;
- (BOOL)routeOptionsSupported;
- (BOOL)snapToClosestStopSupported;
- (BOOL)supportEmissionsTagging;
- (BOOL)supportsAdvancedMap;
- (BOOL)supportsAreaEventsEnhancements;
- (BOOL)supportsArrivalMapRegion;
- (BOOL)supportsBannerQueuing;
- (BOOL)supportsBannerQueuingDirections;
- (BOOL)supportsCongestionZones;
- (BOOL)supportsDefaultToNewRouteFlag;
- (BOOL)supportsDisablingProgressBarFromBannerButtons;
- (BOOL)supportsDodgeballCameraInput;
- (BOOL)supportsElectricVehicleRoutes;
- (BOOL)supportsEv2;
- (BOOL)supportsGenericCombinationsInstructionsForAllModes;
- (BOOL)supportsGuidanceEventImportanceInfo;
- (BOOL)supportsGuidanceEventPrivacyFilters;
- (BOOL)supportsGuidanceEvents;
- (BOOL)supportsGuidanceEventsInlineShields;
- (BOOL)supportsJunctionView;
- (BOOL)supportsLicensePlateRestrictions;
- (BOOL)supportsLongShieldStrings;
- (BOOL)supportsNaturalGuidance;
- (BOOL)supportsRoadComplexities;
- (BOOL)supportsRouteCameraInputUpdates;
- (BOOL)supportsRouteNameRanges;
- (BOOL)supportsSilentRouteUpdates;
- (BOOL)supportsSpeedTrapAnnouncements;
- (BOOL)supportsTrafficCameras;
- (BOOL)supportsUserIncidentReports;
- (BOOL)supportsWalkingSuggestionsAfterParking;
- (BOOL)supportsWaypointRoutes;
- (BOOL)willSendEvDirectionsFeedback;
- (GEOAbAssignInfo)abAssignInfo;
- (GEOAdvisoryClientCapabilities)advisoryClientCapabilities;
- (GEOArtworkCapabilities)artworkCapabilities;
- (GEOClientCapabilities)init;
- (GEOClientCapabilities)initWithData:(id)a3;
- (GEOClientCapabilities)initWithDictionary:(id)a3;
- (GEOClientCapabilities)initWithJSON:(id)a3;
- (GEOFormattedStringClientCapabilities)formattedStringClientCapabilities;
- (GEOLocalTime)requestTime;
- (GEOLocalizationCapabilities)localizationCapabilities;
- (GEOWalkingSupportedFeatures)walkingSupportedFeatures;
- (NSMutableArray)displayLanguages;
- (NSString)appMajorVersion;
- (NSString)appMinorVersion;
- (NSString)deviceCountryCode;
- (NSString)deviceSku;
- (NSString)displayRegion;
- (NSString)hardwareClass;
- (NSString)hardwareModel;
- (NSString)osVersion;
- (NSString)userCurrentTimezone;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayLanguagesAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)maxManeuverTypeSupportedAsString:(int)a3;
- (id)maxSupportedTransitFareVersionAsString:(int)a3;
- (id)supportedElevationModelsAsString:(int)a3;
- (id)supportedTransitFeaturesAsString:(int)a3;
- (id)supportsMultipointRoutingsAsString:(int)a3;
- (id)transitMarketSupportAsString:(int)a3;
- (int)StringAsMaxManeuverTypeSupported:(id)a3;
- (int)StringAsMaxSupportedTransitFareVersion:(id)a3;
- (int)StringAsSupportedElevationModels:(id)a3;
- (int)StringAsSupportedTransitFeatures:(id)a3;
- (int)StringAsSupportsMultipointRoutings:(id)a3;
- (int)StringAsTransitMarketSupport:(id)a3;
- (int)maxFormatterSupported;
- (int)maxManeuverTypeSupported;
- (int)maxRouteIncidentSupported;
- (int)maxSupportedTransitFareVersion;
- (int)supportedElevationModelAtIndex:(unint64_t)a3;
- (int)supportedElevationModels;
- (int)supportedTransitFeatureAtIndex:(unint64_t)a3;
- (int)supportedTransitFeatures;
- (int)supportsMultipointRoutingAtIndex:(unint64_t)a3;
- (int)supportsMultipointRoutings;
- (int)transitMarketSupport;
- (unint64_t)displayLanguagesCount;
- (unint64_t)hash;
- (unint64_t)supportedElevationModelsCount;
- (unint64_t)supportedTransitFeaturesCount;
- (unint64_t)supportsMultipointRoutingsCount;
- (unsigned)maxTrafficSpeedSupported;
- (unsigned)maxZilchMessageVersionSupported;
- (void)_addNoFlagsDisplayLanguages:(uint64_t)a1;
- (void)_readAbAssignInfo;
- (void)_readAdvisoryClientCapabilities;
- (void)_readAppMajorVersion;
- (void)_readAppMinorVersion;
- (void)_readArtworkCapabilities;
- (void)_readDeviceCountryCode;
- (void)_readDeviceSku;
- (void)_readDisplayLanguages;
- (void)_readDisplayRegion;
- (void)_readFormattedStringClientCapabilities;
- (void)_readHardwareClass;
- (void)_readHardwareModel;
- (void)_readLocalizationCapabilities;
- (void)_readOsVersion;
- (void)_readRequestTime;
- (void)_readSupportedElevationModels;
- (void)_readSupportedTransitFeatures;
- (void)_readSupportsMultipointRoutings;
- (void)_readUserCurrentTimezone;
- (void)_readWalkingSupportedFeatures;
- (void)_updateWithAutomobileOptions:(id)a3;
- (void)addDisplayLanguages:(id)a3;
- (void)addSupportedElevationModel:(int)a3;
- (void)addSupportedTransitFeature:(int)a3;
- (void)addSupportsMultipointRouting:(int)a3;
- (void)clearDisplayLanguages;
- (void)clearSupportedElevationModels;
- (void)clearSupportedTransitFeatures;
- (void)clearSupportsMultipointRoutings;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAbAssignInfo:(id)a3;
- (void)setAdvisoryClientCapabilities:(id)a3;
- (void)setAppMajorVersion:(id)a3;
- (void)setAppMinorVersion:(id)a3;
- (void)setArtworkCapabilities:(id)a3;
- (void)setClusteredTransitRoutesSupported:(BOOL)a3;
- (void)setDeviceCountryCode:(id)a3;
- (void)setDeviceSku:(id)a3;
- (void)setDisplayLanguages:(id)a3;
- (void)setDisplayRegion:(id)a3;
- (void)setFormattedStringClientCapabilities:(id)a3;
- (void)setHardwareClass:(id)a3;
- (void)setHardwareModel:(id)a3;
- (void)setHasClusteredTransitRoutesSupported:(BOOL)a3;
- (void)setHasIncludeCrossLanguagePhonetics:(BOOL)a3;
- (void)setHasInternalInstall:(BOOL)a3;
- (void)setHasInternalTool:(BOOL)a3;
- (void)setHasIsAdvancedMap:(BOOL)a3;
- (void)setHasIsGlobeProjection:(BOOL)a3;
- (void)setHasMaxFormatterSupported:(BOOL)a3;
- (void)setHasMaxManeuverTypeSupported:(BOOL)a3;
- (void)setHasMaxRouteIncidentSupported:(BOOL)a3;
- (void)setHasMaxSupportedTransitFareVersion:(BOOL)a3;
- (void)setHasMaxTrafficSpeedSupported:(BOOL)a3;
- (void)setHasMaxZilchMessageVersionSupported:(BOOL)a3;
- (void)setHasReplaceAccidentStringWithCrash:(BOOL)a3;
- (void)setHasRouteOptionsSupported:(BOOL)a3;
- (void)setHasSnapToClosestStopSupported:(BOOL)a3;
- (void)setHasSupportEmissionsTagging:(BOOL)a3;
- (void)setHasSupportsAdvancedMap:(BOOL)a3;
- (void)setHasSupportsAreaEventsEnhancements:(BOOL)a3;
- (void)setHasSupportsArrivalMapRegion:(BOOL)a3;
- (void)setHasSupportsBannerQueuing:(BOOL)a3;
- (void)setHasSupportsBannerQueuingDirections:(BOOL)a3;
- (void)setHasSupportsCongestionZones:(BOOL)a3;
- (void)setHasSupportsDefaultToNewRouteFlag:(BOOL)a3;
- (void)setHasSupportsDisablingProgressBarFromBannerButtons:(BOOL)a3;
- (void)setHasSupportsDodgeballCameraInput:(BOOL)a3;
- (void)setHasSupportsElectricVehicleRoutes:(BOOL)a3;
- (void)setHasSupportsEv2:(BOOL)a3;
- (void)setHasSupportsGenericCombinationsInstructionsForAllModes:(BOOL)a3;
- (void)setHasSupportsGuidanceEventImportanceInfo:(BOOL)a3;
- (void)setHasSupportsGuidanceEventPrivacyFilters:(BOOL)a3;
- (void)setHasSupportsGuidanceEvents:(BOOL)a3;
- (void)setHasSupportsGuidanceEventsInlineShields:(BOOL)a3;
- (void)setHasSupportsJunctionView:(BOOL)a3;
- (void)setHasSupportsLicensePlateRestrictions:(BOOL)a3;
- (void)setHasSupportsLongShieldStrings:(BOOL)a3;
- (void)setHasSupportsNaturalGuidance:(BOOL)a3;
- (void)setHasSupportsRoadComplexities:(BOOL)a3;
- (void)setHasSupportsRouteCameraInputUpdates:(BOOL)a3;
- (void)setHasSupportsRouteNameRanges:(BOOL)a3;
- (void)setHasSupportsSilentRouteUpdates:(BOOL)a3;
- (void)setHasSupportsSpeedTrapAnnouncements:(BOOL)a3;
- (void)setHasSupportsTrafficCameras:(BOOL)a3;
- (void)setHasSupportsUserIncidentReports:(BOOL)a3;
- (void)setHasSupportsWalkingSuggestionsAfterParking:(BOOL)a3;
- (void)setHasSupportsWaypointRoutes:(BOOL)a3;
- (void)setHasTransitMarketSupport:(BOOL)a3;
- (void)setHasWillSendEvDirectionsFeedback:(BOOL)a3;
- (void)setIncludeCrossLanguagePhonetics:(BOOL)a3;
- (void)setInternalInstall:(BOOL)a3;
- (void)setInternalTool:(BOOL)a3;
- (void)setIsAdvancedMap:(BOOL)a3;
- (void)setIsGlobeProjection:(BOOL)a3;
- (void)setLocalizationCapabilities:(id)a3;
- (void)setMaxFormatterSupported:(int)a3;
- (void)setMaxManeuverTypeSupported:(int)a3;
- (void)setMaxRouteIncidentSupported:(int)a3;
- (void)setMaxSupportedTransitFareVersion:(int)a3;
- (void)setMaxTrafficSpeedSupported:(unsigned int)a3;
- (void)setMaxZilchMessageVersionSupported:(unsigned int)a3;
- (void)setOsVersion:(id)a3;
- (void)setReplaceAccidentStringWithCrash:(BOOL)a3;
- (void)setRequestTime:(id)a3;
- (void)setRouteOptionsSupported:(BOOL)a3;
- (void)setSnapToClosestStopSupported:(BOOL)a3;
- (void)setSupportEmissionsTagging:(BOOL)a3;
- (void)setSupportedElevationModels:(int *)a3 count:(unint64_t)a4;
- (void)setSupportedTransitFeatures:(int *)a3 count:(unint64_t)a4;
- (void)setSupportsAdvancedMap:(BOOL)a3;
- (void)setSupportsAreaEventsEnhancements:(BOOL)a3;
- (void)setSupportsArrivalMapRegion:(BOOL)a3;
- (void)setSupportsBannerQueuing:(BOOL)a3;
- (void)setSupportsBannerQueuingDirections:(BOOL)a3;
- (void)setSupportsCongestionZones:(BOOL)a3;
- (void)setSupportsDefaultToNewRouteFlag:(BOOL)a3;
- (void)setSupportsDisablingProgressBarFromBannerButtons:(BOOL)a3;
- (void)setSupportsDodgeballCameraInput:(BOOL)a3;
- (void)setSupportsElectricVehicleRoutes:(BOOL)a3;
- (void)setSupportsEv2:(BOOL)a3;
- (void)setSupportsGenericCombinationsInstructionsForAllModes:(BOOL)a3;
- (void)setSupportsGuidanceEventImportanceInfo:(BOOL)a3;
- (void)setSupportsGuidanceEventPrivacyFilters:(BOOL)a3;
- (void)setSupportsGuidanceEvents:(BOOL)a3;
- (void)setSupportsGuidanceEventsInlineShields:(BOOL)a3;
- (void)setSupportsJunctionView:(BOOL)a3;
- (void)setSupportsLicensePlateRestrictions:(BOOL)a3;
- (void)setSupportsLongShieldStrings:(BOOL)a3;
- (void)setSupportsMultipointRoutings:(int *)a3 count:(unint64_t)a4;
- (void)setSupportsNaturalGuidance:(BOOL)a3;
- (void)setSupportsRoadComplexities:(BOOL)a3;
- (void)setSupportsRouteCameraInputUpdates:(BOOL)a3;
- (void)setSupportsRouteNameRanges:(BOOL)a3;
- (void)setSupportsSilentRouteUpdates:(BOOL)a3;
- (void)setSupportsSpeedTrapAnnouncements:(BOOL)a3;
- (void)setSupportsTrafficCameras:(BOOL)a3;
- (void)setSupportsUserIncidentReports:(BOOL)a3;
- (void)setSupportsWalkingSuggestionsAfterParking:(BOOL)a3;
- (void)setSupportsWaypointRoutes:(BOOL)a3;
- (void)setTransitMarketSupport:(int)a3;
- (void)setUserCurrentTimezone:(id)a3;
- (void)setWalkingSupportedFeatures:(id)a3;
- (void)setWillSendEvDirectionsFeedback:(BOOL)a3;
- (void)updateWithDirectionsRequest:(id)a3;
- (void)updateWithETARequest:(id)a3;
- (void)updateWithETATrafficUpdateRequest:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOClientCapabilities

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkingSupportedFeatures, 0);
  objc_storeStrong((id *)&self->_userCurrentTimezone, 0);
  objc_storeStrong((id *)&self->_requestTime, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_localizationCapabilities, 0);
  objc_storeStrong((id *)&self->_hardwareClass, 0);
  objc_storeStrong((id *)&self->_hardwareModel, 0);
  objc_storeStrong((id *)&self->_formattedStringClientCapabilities, 0);
  objc_storeStrong((id *)&self->_displayRegion, 0);
  objc_storeStrong((id *)&self->_displayLanguages, 0);
  objc_storeStrong((id *)&self->_deviceSku, 0);
  objc_storeStrong((id *)&self->_deviceCountryCode, 0);
  objc_storeStrong((id *)&self->_artworkCapabilities, 0);
  objc_storeStrong((id *)&self->_appMinorVersion, 0);
  objc_storeStrong((id *)&self->_appMajorVersion, 0);
  objc_storeStrong((id *)&self->_advisoryClientCapabilities, 0);
  objc_storeStrong((id *)&self->_abAssignInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)updateWithETARequest:(id)a3
{
  id v4 = [a3 automobileOptions];
  [(GEOClientCapabilities *)self _updateWithAutomobileOptions:v4];
}

- (void)writeTo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if (!(*((unsigned char *)&self->_flags + 8) & 0x1F | ((unint64_t)*((unsigned __int16 *)&self->_flags + 3) << 48)))
    {
      v22 = self->_reader;
      objc_sync_enter(v22);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      v23 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v4 writeData:v23];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v22);
      goto LABEL_148;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOClientCapabilities *)self readAll:0];
  if (self->_appMajorVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_appMinorVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_hardwareModel) {
    PBDataWriterWriteStringField();
  }
  if (self->_hardwareClass) {
    PBDataWriterWriteStringField();
  }
  p_uint64_t flags = &self->_flags;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 0x200) == 0) {
      goto LABEL_13;
    }
LABEL_145:
    PBDataWriterWriteBOOLField();
    if ((*(void *)&self->_flags & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  PBDataWriterWriteInt32Field();
  uint64_t flags = *(void *)p_flags;
  if ((*(void *)p_flags & 0x200) != 0) {
    goto LABEL_145;
  }
LABEL_13:
  if ((flags & 0x400) != 0) {
LABEL_14:
  }
    PBDataWriterWriteBOOLField();
LABEL_15:
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v8 = self->_displayLanguages;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }

  if (self->_displayRegion) {
    PBDataWriterWriteStringField();
  }
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v12 = (uint64_t)self->_flags;
  }
  if ((v12 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v12 = (uint64_t)self->_flags;
  }
  if (v12) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_deviceCountryCode) {
    PBDataWriterWriteStringField();
  }
  uint64_t v13 = (uint64_t)self->_flags;
  if ((v13 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v13 = (uint64_t)self->_flags;
  }
  if ((v13 & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v13 = (uint64_t)self->_flags;
  }
  if ((v13 & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_formattedStringClientCapabilities) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_advisoryClientCapabilities) {
    PBDataWriterWriteSubmessage();
  }
  uint64_t v14 = (uint64_t)self->_flags;
  if ((v14 & 0x8000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v14 = (uint64_t)self->_flags;
  }
  if ((v14 & 0x100) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_userCurrentTimezone) {
    PBDataWriterWriteStringField();
  }
  uint64_t v15 = (uint64_t)self->_flags;
  if ((v15 & 0x800000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v15 = (uint64_t)self->_flags;
  }
  if ((v15 & 0x100000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v15 = (uint64_t)self->_flags;
  }
  if ((v15 & 0x80000000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_abAssignInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_requestTime) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(void *)&self->_flags & 0x20) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_supportedTransitFeatures.count)
  {
    unint64_t v16 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v16;
    }
    while (v16 < self->_supportedTransitFeatures.count);
  }
  uint64_t v17 = (uint64_t)self->_flags;
  if ((v17 & 0x80000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v17 = (uint64_t)self->_flags;
  }
  if ((v17 & 0x1000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v17 = (uint64_t)self->_flags;
  }
  if ((v17 & 0x200000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v17 = (uint64_t)self->_flags;
  }
  if ((v17 & 0x400000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v17 = (uint64_t)self->_flags;
  }
  if ((v17 & 0x400000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v17 = (uint64_t)self->_flags;
  }
  if ((v17 & 0x4000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v17 = (uint64_t)self->_flags;
  }
  if ((v17 & 0x40000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v17 = (uint64_t)self->_flags;
  }
  if ((v17 & 0x200000000000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_localizationCapabilities) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_deviceSku) {
    PBDataWriterWriteStringField();
  }
  if (self->_osVersion) {
    PBDataWriterWriteStringField();
  }
  uint64_t v18 = (uint64_t)self->_flags;
  if ((v18 & 0x400000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x2000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x20000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x80000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x20000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x10000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x40000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x20000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x800) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x1000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_supportsMultipointRoutings.count)
  {
    unint64_t v19 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v19;
    }
    while (v19 < self->_supportsMultipointRoutings.count);
  }
  if ((*(void *)&self->_flags & 0x800000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_walkingSupportedFeatures) {
    PBDataWriterWriteSubmessage();
  }
  uint64_t v20 = (uint64_t)self->_flags;
  if ((v20 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v20 = (uint64_t)self->_flags;
  }
  if ((v20 & 0x1000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v20 = (uint64_t)self->_flags;
  }
  if ((v20 & 0x200000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v20 = (uint64_t)self->_flags;
  }
  if ((v20 & 0x8000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v20 = (uint64_t)self->_flags;
  }
  if ((v20 & 0x8000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v20 = (uint64_t)self->_flags;
  }
  if ((v20 & 0x100000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v20 = (uint64_t)self->_flags;
  }
  if ((v20 & 0x10000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v20 = (uint64_t)self->_flags;
  }
  if ((v20 & 0x4000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v20 = (uint64_t)self->_flags;
  }
  if ((v20 & 0x2000000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_supportedElevationModels.count)
  {
    unint64_t v21 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v21;
    }
    while (v21 < self->_supportedElevationModels.count);
  }
  if ((*(void *)&self->_flags & 0x10000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_artworkCapabilities) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(void *)&self->_flags & 0x100000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v24);
LABEL_148:
}

- (GEOFormattedStringClientCapabilities)formattedStringClientCapabilities
{
  -[GEOClientCapabilities _readFormattedStringClientCapabilities]((uint64_t)self);
  formattedStringClientCapabilities = self->_formattedStringClientCapabilities;

  return formattedStringClientCapabilities;
}

- (void)_readFormattedStringClientCapabilities
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 240));
    if ((*(void *)(a1 + 312) & 0x1000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFormattedStringClientCapabilities_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 240));
  }
}

- (void)setHardwareModel:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x2000000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_hardwareModel, a3);
}

- (void)setTransitMarketSupport:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x40uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_transitMarketSupport = a3;
}

- (void)setSupportsLongShieldStrings:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x800000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsLongShieldStrings = a3;
}

- (void)setSupportsAdvancedMap:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x20000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsAdvancedMap = a3;
}

- (void)setSnapToClosestStopSupported:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x8000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_snapToClosestStopSupported = a3;
}

- (void)setRouteOptionsSupported:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x4000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_routeOptionsSupported = a3;
}

- (void)setMaxZilchMessageVersionSupported:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x20uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_maxZilchMessageVersionSupported = a3;
}

- (void)setMaxTrafficSpeedSupported:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 8uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_maxTrafficSpeedSupported = a3;
}

- (void)setMaxSupportedTransitFareVersion:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x10uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_maxSupportedTransitFareVersion = a3;
}

- (void)setMaxManeuverTypeSupported:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 2uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_maxManeuverTypeSupported = a3;
}

- (void)setMaxFormatterSupported:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 1uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_maxFormatterSupported = a3;
}

- (void)setIncludeCrossLanguagePhonetics:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x100uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_includeCrossLanguagePhonetics = a3;
}

- (void)setHardwareClass:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x4000000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_hardwareClass, a3);
}

- (void)setFormattedStringClientCapabilities:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x1000000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_formattedStringClientCapabilities, a3);
}

- (void)setClusteredTransitRoutesSupported:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x80uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_clusteredTransitRoutesSupported = a3;
}

- (void)setAppMinorVersion:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x40000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_appMinorVersion, a3);
}

- (void)setAppMajorVersion:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x20000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_appMajorVersion, a3);
}

- (void)_updateWithAutomobileOptions:(id)a3
{
  int v4 = GeoUserSessionConfig_EVDirectionsFeedbackToggle;
  v5 = off_1E9110858;
  id v6 = a3;
  int BOOL = GEOConfigGetBOOL(v4, (uint64_t)v5);
  id v8 = [v6 vehicleSpecifications];

  -[GEOClientCapabilities setWillSendEvDirectionsFeedback:](self, "setWillSendEvDirectionsFeedback:", [v8 hasEvInfo] & BOOL);
}

- (void)addSupportedTransitFeature:(int)a3
{
  -[GEOClientCapabilities _readSupportedTransitFeatures]((uint64_t)self);
  if (self) {
    PBRepeatedInt32Add();
  }
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_uint64_t flags = &self->_flags;
  *(void *)p_flags |= 0x2000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)p_flags + 8) |= 0x10u;
}

- (void)_readSupportedTransitFeatures
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 240));
    if ((*(void *)(a1 + 312) & 0x2000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedTransitFeatures_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 240));
  }
}

- (void)setWillSendEvDirectionsFeedback:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x400000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_willSendEvDirectionsFeedback = a3;
}

- (GEOWalkingSupportedFeatures)walkingSupportedFeatures
{
  -[GEOClientCapabilities _readWalkingSupportedFeatures]((uint64_t)self);
  walkingSupportedFeatures = self->_walkingSupportedFeatures;

  return walkingSupportedFeatures;
}

- (void)setWalkingSupportedFeatures:(id)a3
{
  *((unsigned char *)&self->_flags + 8) |= 0x18u;
  objc_storeStrong((id *)&self->_walkingSupportedFeatures, a3);
}

- (void)setUserCurrentTimezone:(id)a3
{
  *((unsigned char *)&self->_flags + 8) |= 0x14u;
  objc_storeStrong((id *)&self->_userCurrentTimezone, a3);
}

- (void)setSupportsWaypointRoutes:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x200000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsWaypointRoutes = a3;
}

- (void)setSupportsWalkingSuggestionsAfterParking:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x100000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsWalkingSuggestionsAfterParking = a3;
}

- (void)setSupportsUserIncidentReports:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x80000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsUserIncidentReports = a3;
}

- (void)setSupportsTrafficCameras:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x40000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsTrafficCameras = a3;
}

- (void)setSupportsSpeedTrapAnnouncements:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x20000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsSpeedTrapAnnouncements = a3;
}

- (void)setSupportsSilentRouteUpdates:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x10000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsSilentRouteUpdates = a3;
}

- (void)setSupportsRouteNameRanges:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x8000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsRouteNameRanges = a3;
}

- (void)setSupportsRouteCameraInputUpdates:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x4000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsRouteCameraInputUpdates = a3;
}

- (void)setSupportsRoadComplexities:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x2000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsRoadComplexities = a3;
}

- (void)setSupportsNaturalGuidance:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x1000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsNaturalGuidance = a3;
}

- (void)setSupportsLicensePlateRestrictions:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x400000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsLicensePlateRestrictions = a3;
}

- (void)setSupportsJunctionView:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x200000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsJunctionView = a3;
}

- (void)setSupportsGuidanceEventsInlineShields:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x80000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsGuidanceEventsInlineShields = a3;
}

- (void)setSupportsGuidanceEvents:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x100000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsGuidanceEvents = a3;
}

- (void)setSupportsGuidanceEventImportanceInfo:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x20000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsGuidanceEventImportanceInfo = a3;
}

- (void)setSupportsGenericCombinationsInstructionsForAllModes:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x10000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsGenericCombinationsInstructionsForAllModes = a3;
}

- (void)setSupportsEv2:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x8000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsEv2 = a3;
}

- (void)setSupportsElectricVehicleRoutes:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x4000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsElectricVehicleRoutes = a3;
}

- (void)setSupportsDisablingProgressBarFromBannerButtons:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x1000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsDisablingProgressBarFromBannerButtons = a3;
}

- (void)setSupportsCongestionZones:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x400000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsCongestionZones = a3;
}

- (void)setSupportsBannerQueuingDirections:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x100000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsBannerQueuingDirections = a3;
}

- (void)setSupportsBannerQueuing:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x200000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsBannerQueuing = a3;
}

- (void)setSupportsArrivalMapRegion:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x80000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsArrivalMapRegion = a3;
}

- (void)setSupportsAreaEventsEnhancements:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x40000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsAreaEventsEnhancements = a3;
}

- (void)setReplaceAccidentStringWithCrash:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x2000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_replaceAccidentStringWithCrash = a3;
}

- (void)setLocalizationCapabilities:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x8000000000000000;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_localizationCapabilities, a3);
}

- (void)setDisplayRegion:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x800000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_displayRegion, a3);
}

- (void)setDisplayLanguages:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x10u;
  displayLanguages = self->_displayLanguages;
  self->_displayLanguages = v4;
}

- (void)setDeviceSku:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x200000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_deviceSku, a3);
}

- (void)setDeviceCountryCode:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x100000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_deviceCountryCode, a3);
}

- (void)setAdvisoryClientCapabilities:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x10000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_advisoryClientCapabilities, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 8) & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOClientCapabilitiesReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_73;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOClientCapabilities *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_appMajorVersion copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v9;

  uint64_t v11 = [(NSString *)self->_appMinorVersion copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v11;

  uint64_t v13 = [(NSString *)self->_hardwareModel copyWithZone:a3];
  uint64_t v14 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v13;

  uint64_t v15 = [(NSString *)self->_hardwareClass copyWithZone:a3];
  unint64_t v16 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v15;

  p_uint64_t flags = &self->_flags;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 248) = self->_maxManeuverTypeSupported;
    *(void *)(v5 + 312) |= 2uLL;
    uint64_t flags = *(void *)p_flags;
    if ((*(void *)p_flags & 0x200) == 0)
    {
LABEL_7:
      if ((flags & 0x400) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((flags & 0x200) == 0)
  {
    goto LABEL_7;
  }
  *(unsigned char *)(v5 + 274) = self->_internalInstall;
  *(void *)(v5 + 312) |= 0x200uLL;
  if ((*(void *)&self->_flags & 0x400) != 0)
  {
LABEL_8:
    *(unsigned char *)(v5 + 275) = self->_internalTool;
    *(void *)(v5 + 312) |= 0x400uLL;
  }
LABEL_9:
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  unint64_t v19 = self->_displayLanguages;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v63 objects:v67 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v64;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v64 != v21) {
          objc_enumerationMutation(v19);
        }
        v23 = objc_msgSend(*(id *)(*((void *)&v63 + 1) + 8 * v22), "copyWithZone:", a3, (void)v63);
        [(id)v5 addDisplayLanguages:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v63 objects:v67 count:16];
    }
    while (v20);
  }

  uint64_t v24 = [(NSString *)self->_displayRegion copyWithZone:a3];
  long long v25 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v24;

  long long v26 = &self->_flags;
  uint64_t v27 = (uint64_t)self->_flags;
  if ((v27 & 8) != 0)
  {
    *(_DWORD *)(v5 + 256) = self->_maxTrafficSpeedSupported;
    *(void *)(v5 + 312) |= 8uLL;
    uint64_t v27 = *(void *)v26;
    if ((*(void *)v26 & 4) == 0)
    {
LABEL_18:
      if ((v27 & 1) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((v27 & 4) == 0)
  {
    goto LABEL_18;
  }
  *(_DWORD *)(v5 + 252) = self->_maxRouteIncidentSupported;
  *(void *)(v5 + 312) |= 4uLL;
  if (*(void *)&self->_flags)
  {
LABEL_19:
    *(_DWORD *)(v5 + 244) = self->_maxFormatterSupported;
    *(void *)(v5 + 312) |= 1uLL;
  }
LABEL_20:
  uint64_t v28 = -[NSString copyWithZone:](self->_deviceCountryCode, "copyWithZone:", a3, (void)v63);
  uint64_t v29 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v28;

  v30 = &self->_flags;
  uint64_t v31 = (uint64_t)self->_flags;
  if ((v31 & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 272) = self->_clusteredTransitRoutesSupported;
    *(void *)(v5 + 312) |= 0x80uLL;
    uint64_t v31 = *(void *)v30;
    if ((*(void *)v30 & 0x4000) == 0)
    {
LABEL_22:
      if ((v31 & 0x40) == 0) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
  }
  else if ((v31 & 0x4000) == 0)
  {
    goto LABEL_22;
  }
  *(unsigned char *)(v5 + 279) = self->_routeOptionsSupported;
  *(void *)(v5 + 312) |= 0x4000uLL;
  if ((*(void *)&self->_flags & 0x40) != 0)
  {
LABEL_23:
    *(_DWORD *)(v5 + 268) = self->_transitMarketSupport;
    *(void *)(v5 + 312) |= 0x40uLL;
  }
LABEL_24:
  id v32 = [(GEOFormattedStringClientCapabilities *)self->_formattedStringClientCapabilities copyWithZone:a3];
  v33 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v32;

  id v34 = [(GEOAdvisoryClientCapabilities *)self->_advisoryClientCapabilities copyWithZone:a3];
  v35 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v34;

  uint64_t v36 = (uint64_t)self->_flags;
  if ((v36 & 0x8000) != 0)
  {
    *(unsigned char *)(v5 + 280) = self->_snapToClosestStopSupported;
    *(void *)(v5 + 312) |= 0x8000uLL;
    uint64_t v36 = (uint64_t)self->_flags;
  }
  if ((v36 & 0x100) != 0)
  {
    *(unsigned char *)(v5 + 273) = self->_includeCrossLanguagePhonetics;
    *(void *)(v5 + 312) |= 0x100uLL;
  }
  uint64_t v37 = [(NSString *)self->_userCurrentTimezone copyWithZone:a3];
  v38 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v37;

  v39 = &self->_flags;
  uint64_t v40 = (uint64_t)self->_flags;
  if ((v40 & 0x800000000) != 0)
  {
    *(unsigned char *)(v5 + 300) = self->_supportsLongShieldStrings;
    *(void *)(v5 + 312) |= 0x800000000uLL;
    uint64_t v40 = *(void *)v39;
    if ((*(void *)v39 & 0x100000000) == 0)
    {
LABEL_30:
      if ((v40 & 0x80000000) == 0) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
  }
  else if ((v40 & 0x100000000) == 0)
  {
    goto LABEL_30;
  }
  *(unsigned char *)(v5 + 297) = self->_supportsGuidanceEvents;
  *(void *)(v5 + 312) |= 0x100000000uLL;
  if ((*(void *)&self->_flags & 0x80000000) != 0)
  {
LABEL_31:
    *(unsigned char *)(v5 + 296) = self->_supportsGuidanceEventsInlineShields;
    *(void *)(v5 + 312) |= 0x80000000uLL;
  }
LABEL_32:
  id v41 = [(GEOAbAssignInfo *)self->_abAssignInfo copyWithZone:a3];
  v42 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v41;

  id v43 = [(GEOLocalTime *)self->_requestTime copyWithZone:a3];
  v44 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v43;

  if ((*(void *)&self->_flags & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 264) = self->_maxZilchMessageVersionSupported;
    *(void *)(v5 + 312) |= 0x20uLL;
  }
  PBRepeatedInt32Copy();
  v45 = &self->_flags;
  uint64_t v46 = (uint64_t)self->_flags;
  if ((v46 & 0x80000) != 0)
  {
    *(unsigned char *)(v5 + 284) = self->_supportsArrivalMapRegion;
    *(void *)(v5 + 312) |= 0x80000uLL;
    uint64_t v46 = *(void *)v45;
    if ((*(void *)v45 & 0x1000000000) == 0)
    {
LABEL_36:
      if ((v46 & 0x200000000) == 0) {
        goto LABEL_37;
      }
      goto LABEL_88;
    }
  }
  else if ((v46 & 0x1000000000) == 0)
  {
    goto LABEL_36;
  }
  *(unsigned char *)(v5 + 301) = self->_supportsNaturalGuidance;
  *(void *)(v5 + 312) |= 0x1000000000uLL;
  uint64_t v46 = (uint64_t)self->_flags;
  if ((v46 & 0x200000000) == 0)
  {
LABEL_37:
    if ((v46 & 0x400000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_89;
  }
LABEL_88:
  *(unsigned char *)(v5 + 298) = self->_supportsJunctionView;
  *(void *)(v5 + 312) |= 0x200000000uLL;
  uint64_t v46 = (uint64_t)self->_flags;
  if ((v46 & 0x400000) == 0)
  {
LABEL_38:
    if ((v46 & 0x400000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_90;
  }
LABEL_89:
  *(unsigned char *)(v5 + 287) = self->_supportsCongestionZones;
  *(void *)(v5 + 312) |= 0x400000uLL;
  uint64_t v46 = (uint64_t)self->_flags;
  if ((v46 & 0x400000000) == 0)
  {
LABEL_39:
    if ((v46 & 0x4000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_91;
  }
LABEL_90:
  *(unsigned char *)(v5 + 299) = self->_supportsLicensePlateRestrictions;
  *(void *)(v5 + 312) |= 0x400000000uLL;
  uint64_t v46 = (uint64_t)self->_flags;
  if ((v46 & 0x4000000) == 0)
  {
LABEL_40:
    if ((v46 & 0x40000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_92;
  }
LABEL_91:
  *(unsigned char *)(v5 + 291) = self->_supportsElectricVehicleRoutes;
  *(void *)(v5 + 312) |= 0x4000000uLL;
  uint64_t v46 = (uint64_t)self->_flags;
  if ((v46 & 0x40000000000) == 0)
  {
LABEL_41:
    if ((v46 & 0x200000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
LABEL_92:
  *(unsigned char *)(v5 + 307) = self->_supportsTrafficCameras;
  *(void *)(v5 + 312) |= 0x40000000000uLL;
  if ((*(void *)&self->_flags & 0x200000000000) != 0)
  {
LABEL_42:
    *(unsigned char *)(v5 + 310) = self->_supportsWaypointRoutes;
    *(void *)(v5 + 312) |= 0x200000000000uLL;
  }
LABEL_43:
  id v47 = [(GEOLocalizationCapabilities *)self->_localizationCapabilities copyWithZone:a3];
  v48 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v47;

  uint64_t v49 = [(NSString *)self->_deviceSku copyWithZone:a3];
  v50 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v49;

  uint64_t v51 = [(NSString *)self->_osVersion copyWithZone:a3];
  v52 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v51;

  v53 = &self->_flags;
  uint64_t v54 = (uint64_t)self->_flags;
  if ((v54 & 0x400000000000) != 0)
  {
    *(unsigned char *)(v5 + 311) = self->_willSendEvDirectionsFeedback;
    *(void *)(v5 + 312) |= 0x400000000000uLL;
    uint64_t v54 = *(void *)v53;
    if ((*(void *)v53 & 0x2000000000) == 0)
    {
LABEL_45:
      if ((v54 & 0x20000000000) == 0) {
        goto LABEL_46;
      }
      goto LABEL_96;
    }
  }
  else if ((v54 & 0x2000000000) == 0)
  {
    goto LABEL_45;
  }
  *(unsigned char *)(v5 + 302) = self->_supportsRoadComplexities;
  *(void *)(v5 + 312) |= 0x2000000000uLL;
  uint64_t v54 = (uint64_t)self->_flags;
  if ((v54 & 0x20000000000) == 0)
  {
LABEL_46:
    if ((v54 & 0x80000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_97;
  }
LABEL_96:
  *(unsigned char *)(v5 + 306) = self->_supportsSpeedTrapAnnouncements;
  *(void *)(v5 + 312) |= 0x20000000000uLL;
  uint64_t v54 = (uint64_t)self->_flags;
  if ((v54 & 0x80000000000) == 0)
  {
LABEL_47:
    if ((v54 & 0x40000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_98;
  }
LABEL_97:
  *(unsigned char *)(v5 + 308) = self->_supportsUserIncidentReports;
  *(void *)(v5 + 312) |= 0x80000000000uLL;
  uint64_t v54 = (uint64_t)self->_flags;
  if ((v54 & 0x40000) == 0)
  {
LABEL_48:
    if ((v54 & 0x20000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_99;
  }
LABEL_98:
  *(unsigned char *)(v5 + 283) = self->_supportsAreaEventsEnhancements;
  *(void *)(v5 + 312) |= 0x40000uLL;
  uint64_t v54 = (uint64_t)self->_flags;
  if ((v54 & 0x20000) == 0)
  {
LABEL_49:
    if ((v54 & 0x10000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_100;
  }
LABEL_99:
  *(unsigned char *)(v5 + 282) = self->_supportsAdvancedMap;
  *(void *)(v5 + 312) |= 0x20000uLL;
  uint64_t v54 = (uint64_t)self->_flags;
  if ((v54 & 0x10000000000) == 0)
  {
LABEL_50:
    if ((v54 & 0x2000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_101;
  }
LABEL_100:
  *(unsigned char *)(v5 + 305) = self->_supportsSilentRouteUpdates;
  *(void *)(v5 + 312) |= 0x10000000000uLL;
  uint64_t v54 = (uint64_t)self->_flags;
  if ((v54 & 0x2000) == 0)
  {
LABEL_51:
    if ((v54 & 0x40000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_102;
  }
LABEL_101:
  *(unsigned char *)(v5 + 278) = self->_replaceAccidentStringWithCrash;
  *(void *)(v5 + 312) |= 0x2000uLL;
  uint64_t v54 = (uint64_t)self->_flags;
  if ((v54 & 0x40000000) == 0)
  {
LABEL_52:
    if ((v54 & 0x20000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_103;
  }
LABEL_102:
  *(unsigned char *)(v5 + 295) = self->_supportsGuidanceEventPrivacyFilters;
  *(void *)(v5 + 312) |= 0x40000000uLL;
  uint64_t v54 = (uint64_t)self->_flags;
  if ((v54 & 0x20000000) == 0)
  {
LABEL_53:
    if ((v54 & 0x800) == 0) {
      goto LABEL_54;
    }
    goto LABEL_104;
  }
LABEL_103:
  *(unsigned char *)(v5 + 294) = self->_supportsGuidanceEventImportanceInfo;
  *(void *)(v5 + 312) |= 0x20000000uLL;
  uint64_t v54 = (uint64_t)self->_flags;
  if ((v54 & 0x800) == 0)
  {
LABEL_54:
    if ((v54 & 0x1000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
LABEL_104:
  *(unsigned char *)(v5 + 276) = self->_isAdvancedMap;
  *(void *)(v5 + 312) |= 0x800uLL;
  if ((*(void *)&self->_flags & 0x1000) != 0)
  {
LABEL_55:
    *(unsigned char *)(v5 + 277) = self->_isGlobeProjection;
    *(void *)(v5 + 312) |= 0x1000uLL;
  }
LABEL_56:
  PBRepeatedInt32Copy();
  if ((*(void *)&self->_flags & 0x800000) != 0)
  {
    *(unsigned char *)(v5 + 288) = self->_supportsDefaultToNewRouteFlag;
    *(void *)(v5 + 312) |= 0x800000uLL;
  }
  id v55 = [(GEOWalkingSupportedFeatures *)self->_walkingSupportedFeatures copyWithZone:a3];
  v56 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v55;

  v57 = &self->_flags;
  uint64_t v58 = (uint64_t)self->_flags;
  if ((v58 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 260) = self->_maxSupportedTransitFareVersion;
    *(void *)(v5 + 312) |= 0x10uLL;
    uint64_t v58 = *(void *)v57;
    if ((*(void *)v57 & 0x1000000) == 0)
    {
LABEL_60:
      if ((v58 & 0x200000) == 0) {
        goto LABEL_61;
      }
      goto LABEL_108;
    }
  }
  else if ((v58 & 0x1000000) == 0)
  {
    goto LABEL_60;
  }
  *(unsigned char *)(v5 + 289) = self->_supportsDisablingProgressBarFromBannerButtons;
  *(void *)(v5 + 312) |= 0x1000000uLL;
  uint64_t v58 = (uint64_t)self->_flags;
  if ((v58 & 0x200000) == 0)
  {
LABEL_61:
    if ((v58 & 0x8000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_109;
  }
LABEL_108:
  *(unsigned char *)(v5 + 286) = self->_supportsBannerQueuing;
  *(void *)(v5 + 312) |= 0x200000uLL;
  uint64_t v58 = (uint64_t)self->_flags;
  if ((v58 & 0x8000000) == 0)
  {
LABEL_62:
    if ((v58 & 0x8000000000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_110;
  }
LABEL_109:
  *(unsigned char *)(v5 + 292) = self->_supportsEv2;
  *(void *)(v5 + 312) |= 0x8000000uLL;
  uint64_t v58 = (uint64_t)self->_flags;
  if ((v58 & 0x8000000000) == 0)
  {
LABEL_63:
    if ((v58 & 0x100000000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_111;
  }
LABEL_110:
  *(unsigned char *)(v5 + 304) = self->_supportsRouteNameRanges;
  *(void *)(v5 + 312) |= 0x8000000000uLL;
  uint64_t v58 = (uint64_t)self->_flags;
  if ((v58 & 0x100000000000) == 0)
  {
LABEL_64:
    if ((v58 & 0x10000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_112;
  }
LABEL_111:
  *(unsigned char *)(v5 + 309) = self->_supportsWalkingSuggestionsAfterParking;
  *(void *)(v5 + 312) |= 0x100000000000uLL;
  uint64_t v58 = (uint64_t)self->_flags;
  if ((v58 & 0x10000000) == 0)
  {
LABEL_65:
    if ((v58 & 0x4000000000) == 0) {
      goto LABEL_66;
    }
LABEL_113:
    *(unsigned char *)(v5 + 303) = self->_supportsRouteCameraInputUpdates;
    *(void *)(v5 + 312) |= 0x4000000000uLL;
    if ((*(void *)&self->_flags & 0x2000000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_67;
  }
LABEL_112:
  *(unsigned char *)(v5 + 293) = self->_supportsGenericCombinationsInstructionsForAllModes;
  *(void *)(v5 + 312) |= 0x10000000uLL;
  uint64_t v58 = (uint64_t)self->_flags;
  if ((v58 & 0x4000000000) != 0) {
    goto LABEL_113;
  }
LABEL_66:
  if ((v58 & 0x2000000) != 0)
  {
LABEL_67:
    *(unsigned char *)(v5 + 290) = self->_supportsDodgeballCameraInput;
    *(void *)(v5 + 312) |= 0x2000000uLL;
  }
LABEL_68:
  PBRepeatedInt32Copy();
  if ((*(void *)&self->_flags & 0x10000) != 0)
  {
    *(unsigned char *)(v5 + 281) = self->_supportEmissionsTagging;
    *(void *)(v5 + 312) |= 0x10000uLL;
  }
  id v59 = [(GEOArtworkCapabilities *)self->_artworkCapabilities copyWithZone:a3];
  v60 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v59;

  if ((*(void *)&self->_flags & 0x100000) != 0)
  {
    *(unsigned char *)(v5 + 285) = self->_supportsBannerQueuingDirections;
    *(void *)(v5 + 312) |= 0x100000uLL;
  }
  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  id v61 = (id)v5;
LABEL_73:

  return (id)v5;
}

- (GEOClientCapabilities)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOClientCapabilities;
  v2 = [(GEOClientCapabilities *)&v6 init];
  char v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    int v4 = v2;
  }

  return v3;
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_907_1;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_908_1;
    }
    GEOClientCapabilitiesReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOClientCapabilitiesCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (void)addSupportsMultipointRouting:(int)a3
{
  -[GEOClientCapabilities _readSupportsMultipointRoutings]((uint64_t)self);
  if (self) {
    PBRepeatedInt32Add();
  }
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_uint64_t flags = &self->_flags;
  *(void *)p_flags |= 0x4000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)p_flags + 8) |= 0x10u;
}

- (void)addSupportedElevationModel:(int)a3
{
  -[GEOClientCapabilities _readSupportedElevationModels]((uint64_t)self);
  if (self) {
    PBRepeatedInt32Add();
  }
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_uint64_t flags = &self->_flags;
  *(void *)p_flags |= 0x1000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)p_flags + 8) |= 0x10u;
}

- (void)_readWalkingSupportedFeatures
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 240));
    if ((*(unsigned char *)(a1 + 320) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWalkingSupportedFeatures_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 240));
  }
}

- (void)_readSupportsMultipointRoutings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 240));
    if ((*(void *)(a1 + 312) & 0x4000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportsMultipointRoutings_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 240));
  }
}

- (void)_readSupportedElevationModels
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 240));
    if ((*(void *)(a1 + 312) & 0x1000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedElevationModels_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 240));
  }
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOClientCapabilities;
  [(GEOClientCapabilities *)&v3 dealloc];
}

- (void)updateWithETATrafficUpdateRequest:(id)a3
{
  id v5 = [a3 routeAttributes];
  int v4 = [v5 automobileOptions];
  [(GEOClientCapabilities *)self _updateWithAutomobileOptions:v4];
}

- (void)updateWithDirectionsRequest:(id)a3
{
  id v5 = [a3 routeAttributes];
  int v4 = [v5 automobileOptions];
  [(GEOClientCapabilities *)self _updateWithAutomobileOptions:v4];
}

- (GEOClientCapabilities)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOClientCapabilities;
  objc_super v3 = [(GEOClientCapabilities *)&v7 initWithData:a3];
  int v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readAppMajorVersion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 240));
    if ((*(void *)(a1 + 312) & 0x20000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAppMajorVersion_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 240));
  }
}

- (BOOL)hasAppMajorVersion
{
  return self->_appMajorVersion != 0;
}

- (NSString)appMajorVersion
{
  -[GEOClientCapabilities _readAppMajorVersion]((uint64_t)self);
  appMajorVersion = self->_appMajorVersion;

  return appMajorVersion;
}

- (void)_readAppMinorVersion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 240));
    if ((*(void *)(a1 + 312) & 0x40000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAppMinorVersion_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 240));
  }
}

- (BOOL)hasAppMinorVersion
{
  return self->_appMinorVersion != 0;
}

- (NSString)appMinorVersion
{
  -[GEOClientCapabilities _readAppMinorVersion]((uint64_t)self);
  appMinorVersion = self->_appMinorVersion;

  return appMinorVersion;
}

- (void)_readHardwareModel
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 240));
    if ((*(void *)(a1 + 312) & 0x2000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHardwareModel_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 240));
  }
}

- (BOOL)hasHardwareModel
{
  return self->_hardwareModel != 0;
}

- (NSString)hardwareModel
{
  -[GEOClientCapabilities _readHardwareModel]((uint64_t)self);
  hardwareModel = self->_hardwareModel;

  return hardwareModel;
}

- (void)_readHardwareClass
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 240));
    if ((*(void *)(a1 + 312) & 0x4000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHardwareClass_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 240));
  }
}

- (BOOL)hasHardwareClass
{
  return self->_hardwareClass != 0;
}

- (NSString)hardwareClass
{
  -[GEOClientCapabilities _readHardwareClass]((uint64_t)self);
  hardwareClass = self->_hardwareClass;

  return hardwareClass;
}

- (int)maxManeuverTypeSupported
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_maxManeuverTypeSupported;
  }
  else {
    return 63;
  }
}

- (void)setHasMaxManeuverTypeSupported:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 2;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasMaxManeuverTypeSupported
{
  return (*(void *)&self->_flags >> 1) & 1;
}

- (id)maxManeuverTypeSupportedAsString:(int)a3
{
  uint64_t v4 = @"NO_TURN";
  switch(a3)
  {
    case 0:
      goto LABEL_24;
    case 1:
      uint64_t v4 = @"LEFT_TURN";
      break;
    case 2:
      uint64_t v4 = @"RIGHT_TURN";
      break;
    case 3:
      uint64_t v4 = @"STRAIGHT_AHEAD";
      break;
    case 4:
      uint64_t v4 = @"U_TURN";
      break;
    case 5:
      uint64_t v4 = @"FOLLOW_ROAD";
      break;
    case 6:
      uint64_t v4 = @"ENTER_ROUNDABOUT";
      break;
    case 7:
      uint64_t v4 = @"EXIT_ROUNDABOUT";
      break;
    case 11:
      uint64_t v4 = @"OFF_RAMP";
      break;
    case 12:
      uint64_t v4 = @"ON_RAMP";
      break;
    case 16:
      uint64_t v4 = @"ARRIVE_END_OF_NAVIGATION";
      break;
    case 17:
      uint64_t v4 = @"START_ROUTE";
      break;
    case 18:
      uint64_t v4 = @"ARRIVE_AT_DESTINATION";
      break;
    case 20:
      uint64_t v4 = @"KEEP_LEFT";
      break;
    case 21:
      uint64_t v4 = @"KEEP_RIGHT";
      break;
    case 22:
      uint64_t v4 = @"ENTER_FERRY";
      break;
    case 23:
      uint64_t v4 = @"EXIT_FERRY";
      break;
    case 24:
      uint64_t v4 = @"CHANGE_FERRY";
      break;
    case 25:
      uint64_t v4 = @"START_ROUTE_WITH_U_TURN";
      break;
    case 26:
      uint64_t v4 = @"U_TURN_AT_ROUNDABOUT";
      break;
    case 27:
      uint64_t v4 = @"LEFT_TURN_AT_END";
      break;
    case 28:
      uint64_t v4 = @"RIGHT_TURN_AT_END";
      break;
    case 29:
      uint64_t v4 = @"HIGHWAY_OFF_RAMP_LEFT";
      break;
    case 30:
      uint64_t v4 = @"HIGHWAY_OFF_RAMP_RIGHT";
      break;
    case 33:
      uint64_t v4 = @"ARRIVE_AT_DESTINATION_LEFT";
      break;
    case 34:
      uint64_t v4 = @"ARRIVE_AT_DESTINATION_RIGHT";
      break;
    case 35:
      uint64_t v4 = @"U_TURN_WHEN_POSSIBLE";
      break;
    case 39:
      uint64_t v4 = @"ARRIVE_END_OF_DIRECTIONS";
      break;
    case 41:
      uint64_t v4 = @"ROUNDABOUT_EXIT_1";
      break;
    case 42:
      uint64_t v4 = @"ROUNDABOUT_EXIT_2";
      break;
    case 43:
      uint64_t v4 = @"ROUNDABOUT_EXIT_3";
      break;
    case 44:
      uint64_t v4 = @"ROUNDABOUT_EXIT_4";
      break;
    case 45:
      uint64_t v4 = @"ROUNDABOUT_EXIT_5";
      break;
    case 46:
      uint64_t v4 = @"ROUNDABOUT_EXIT_6";
      break;
    case 47:
      uint64_t v4 = @"ROUNDABOUT_EXIT_7";
      break;
    case 48:
      uint64_t v4 = @"ROUNDABOUT_EXIT_8";
      break;
    case 49:
      uint64_t v4 = @"ROUNDABOUT_EXIT_9";
      break;
    case 50:
      uint64_t v4 = @"ROUNDABOUT_EXIT_10";
      break;
    case 51:
      uint64_t v4 = @"ROUNDABOUT_EXIT_11";
      break;
    case 52:
      uint64_t v4 = @"ROUNDABOUT_EXIT_12";
      break;
    case 53:
      uint64_t v4 = @"ROUNDABOUT_EXIT_13";
      break;
    case 54:
      uint64_t v4 = @"ROUNDABOUT_EXIT_14";
      break;
    case 55:
      uint64_t v4 = @"ROUNDABOUT_EXIT_15";
      break;
    case 56:
      uint64_t v4 = @"ROUNDABOUT_EXIT_16";
      break;
    case 57:
      uint64_t v4 = @"ROUNDABOUT_EXIT_17";
      break;
    case 58:
      uint64_t v4 = @"ROUNDABOUT_EXIT_18";
      break;
    case 59:
      uint64_t v4 = @"ROUNDABOUT_EXIT_19";
      break;
    case 60:
      uint64_t v4 = @"SHARP_LEFT_TURN";
      break;
    case 61:
      uint64_t v4 = @"SHARP_RIGHT_TURN";
      break;
    case 62:
      uint64_t v4 = @"SLIGHT_LEFT_TURN";
      break;
    case 63:
      uint64_t v4 = @"SLIGHT_RIGHT_TURN";
      break;
    case 64:
      uint64_t v4 = @"CHANGE_HIGHWAY";
      break;
    case 65:
      uint64_t v4 = @"CHANGE_HIGHWAY_LEFT";
      break;
    case 66:
      uint64_t v4 = @"CHANGE_HIGHWAY_RIGHT";
      break;
    case 80:
      uint64_t v4 = @"TOLL_STATION";
      break;
    case 81:
      uint64_t v4 = @"ENTER_TUNNEL";
      break;
    case 82:
      uint64_t v4 = @"WAYPOINT_STOP";
      break;
    case 83:
      uint64_t v4 = @"WAYPOINT_STOP_LEFT";
      break;
    case 84:
      uint64_t v4 = @"WAYPOINT_STOP_RIGHT";
      break;
    case 85:
      uint64_t v4 = @"RESUME_ROUTE";
      break;
    case 86:
      uint64_t v4 = @"RESUME_ROUTE_WITH_U_TURN";
      break;
    case 87:
      uint64_t v4 = @"CUSTOM";
      break;
    case 88:
      uint64_t v4 = @"TURN_AROUND";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_24:
      break;
  }
  return v4;
}

- (int)StringAsMaxManeuverTypeSupported:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NO_TURN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LEFT_TURN"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RIGHT_TURN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"STRAIGHT_AHEAD"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"U_TURN"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FOLLOW_ROAD"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ENTER_ROUNDABOUT"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"EXIT_ROUNDABOUT"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"OFF_RAMP"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"ON_RAMP"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"ARRIVE_END_OF_NAVIGATION"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"START_ROUTE"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"ARRIVE_AT_DESTINATION"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"KEEP_LEFT"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"KEEP_RIGHT"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"ENTER_FERRY"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"EXIT_FERRY"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"CHANGE_FERRY"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"START_ROUTE_WITH_U_TURN"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"U_TURN_AT_ROUNDABOUT"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"LEFT_TURN_AT_END"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"RIGHT_TURN_AT_END"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"HIGHWAY_OFF_RAMP_LEFT"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"HIGHWAY_OFF_RAMP_RIGHT"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"ARRIVE_AT_DESTINATION_LEFT"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"ARRIVE_AT_DESTINATION_RIGHT"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"U_TURN_WHEN_POSSIBLE"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"ARRIVE_END_OF_DIRECTIONS"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_1"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_2"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_3"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_4"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_5"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_6"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_7"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_8"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_9"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_10"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_11"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_12"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_13"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_14"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_15"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_16"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_17"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_18"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_19"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"SHARP_LEFT_TURN"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"SHARP_RIGHT_TURN"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"SLIGHT_LEFT_TURN"])
  {
    int v4 = 62;
  }
  else if ([v3 isEqualToString:@"SLIGHT_RIGHT_TURN"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"CHANGE_HIGHWAY"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"CHANGE_HIGHWAY_LEFT"])
  {
    int v4 = 65;
  }
  else if ([v3 isEqualToString:@"CHANGE_HIGHWAY_RIGHT"])
  {
    int v4 = 66;
  }
  else if ([v3 isEqualToString:@"TOLL_STATION"])
  {
    int v4 = 80;
  }
  else if ([v3 isEqualToString:@"ENTER_TUNNEL"])
  {
    int v4 = 81;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_STOP"])
  {
    int v4 = 82;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_STOP_LEFT"])
  {
    int v4 = 83;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_STOP_RIGHT"])
  {
    int v4 = 84;
  }
  else if ([v3 isEqualToString:@"RESUME_ROUTE"])
  {
    int v4 = 85;
  }
  else if ([v3 isEqualToString:@"RESUME_ROUTE_WITH_U_TURN"])
  {
    int v4 = 86;
  }
  else if ([v3 isEqualToString:@"CUSTOM"])
  {
    int v4 = 87;
  }
  else if ([v3 isEqualToString:@"TURN_AROUND"])
  {
    int v4 = 88;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)internalInstall
{
  return self->_internalInstall;
}

- (void)setInternalInstall:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x200uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_internalInstall = a3;
}

- (void)setHasInternalInstall:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 512;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasInternalInstall
{
  return (*(void *)&self->_flags >> 9) & 1;
}

- (BOOL)internalTool
{
  return self->_internalTool;
}

- (void)setInternalTool:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x400uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_internalTool = a3;
}

- (void)setHasInternalTool:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 1024;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasInternalTool
{
  return (*(void *)&self->_flags >> 10) & 1;
}

- (void)_readDisplayLanguages
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 240));
    if ((*(void *)(a1 + 312) & 0x400000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayLanguages_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 240));
  }
}

- (NSMutableArray)displayLanguages
{
  -[GEOClientCapabilities _readDisplayLanguages]((uint64_t)self);
  displayLanguages = self->_displayLanguages;

  return displayLanguages;
}

- (void)clearDisplayLanguages
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x10u;
  displayLanguages = self->_displayLanguages;

  [(NSMutableArray *)displayLanguages removeAllObjects];
}

- (void)addDisplayLanguages:(id)a3
{
  id v4 = a3;
  -[GEOClientCapabilities _readDisplayLanguages]((uint64_t)self);
  -[GEOClientCapabilities _addNoFlagsDisplayLanguages:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOClientCapabilities *)((char *)self + 312);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x400000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x10u;
}

- (void)_addNoFlagsDisplayLanguages:(uint64_t)a1
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

- (unint64_t)displayLanguagesCount
{
  -[GEOClientCapabilities _readDisplayLanguages]((uint64_t)self);
  displayLanguages = self->_displayLanguages;

  return [(NSMutableArray *)displayLanguages count];
}

- (id)displayLanguagesAtIndex:(unint64_t)a3
{
  -[GEOClientCapabilities _readDisplayLanguages]((uint64_t)self);
  displayLanguages = self->_displayLanguages;

  return (id)[(NSMutableArray *)displayLanguages objectAtIndex:a3];
}

+ (Class)displayLanguagesType
{
  return (Class)objc_opt_class();
}

- (void)_readDisplayRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 240));
    if ((*(void *)(a1 + 312) & 0x800000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayRegion_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 240));
  }
}

- (BOOL)hasDisplayRegion
{
  return self->_displayRegion != 0;
}

- (NSString)displayRegion
{
  -[GEOClientCapabilities _readDisplayRegion]((uint64_t)self);
  displayRegion = self->_displayRegion;

  return displayRegion;
}

- (unsigned)maxTrafficSpeedSupported
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0) {
    return self->_maxTrafficSpeedSupported;
  }
  else {
    return 3;
  }
}

- (void)setHasMaxTrafficSpeedSupported:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 8;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasMaxTrafficSpeedSupported
{
  return (*(void *)&self->_flags >> 3) & 1;
}

- (int)maxRouteIncidentSupported
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_maxRouteIncidentSupported;
  }
  else {
    return 6;
  }
}

- (void)setMaxRouteIncidentSupported:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 4uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_maxRouteIncidentSupported = a3;
}

- (void)setHasMaxRouteIncidentSupported:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 4;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasMaxRouteIncidentSupported
{
  return (*(void *)&self->_flags >> 2) & 1;
}

- (int)maxFormatterSupported
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_maxFormatterSupported;
  }
  else {
    return 7;
  }
}

- (void)setHasMaxFormatterSupported:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3;
  *((unsigned char *)&self->_flags + 8) = v3;
}

- (BOOL)hasMaxFormatterSupported
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readDeviceCountryCode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 240));
    if ((*(void *)(a1 + 312) & 0x100000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceCountryCode_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 240));
  }
}

- (BOOL)hasDeviceCountryCode
{
  return self->_deviceCountryCode != 0;
}

- (NSString)deviceCountryCode
{
  -[GEOClientCapabilities _readDeviceCountryCode]((uint64_t)self);
  deviceCountryCode = self->_deviceCountryCode;

  return deviceCountryCode;
}

- (BOOL)clusteredTransitRoutesSupported
{
  return self->_clusteredTransitRoutesSupported;
}

- (void)setHasClusteredTransitRoutesSupported:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 128;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasClusteredTransitRoutesSupported
{
  return (*(void *)&self->_flags >> 7) & 1;
}

- (BOOL)routeOptionsSupported
{
  return self->_routeOptionsSupported;
}

- (void)setHasRouteOptionsSupported:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x4000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasRouteOptionsSupported
{
  return (*(void *)&self->_flags >> 14) & 1;
}

- (int)transitMarketSupport
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40) != 0) {
    return self->_transitMarketSupport;
  }
  else {
    return 1;
  }
}

- (void)setHasTransitMarketSupport:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 64;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasTransitMarketSupport
{
  return (*(void *)&self->_flags >> 6) & 1;
}

- (id)transitMarketSupportAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E6F10[a3 - 1];
  }

  return v3;
}

- (int)StringAsTransitMarketSupport:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"VERSION_1"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"VERSION_2"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VERSION_3"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)hasFormattedStringClientCapabilities
{
  return self->_formattedStringClientCapabilities != 0;
}

- (void)_readAdvisoryClientCapabilities
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 240));
    if ((*(void *)(a1 + 312) & 0x10000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAdvisoryClientCapabilities_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 240));
  }
}

- (BOOL)hasAdvisoryClientCapabilities
{
  return self->_advisoryClientCapabilities != 0;
}

- (GEOAdvisoryClientCapabilities)advisoryClientCapabilities
{
  -[GEOClientCapabilities _readAdvisoryClientCapabilities]((uint64_t)self);
  advisoryClientCapabilities = self->_advisoryClientCapabilities;

  return advisoryClientCapabilities;
}

- (BOOL)snapToClosestStopSupported
{
  return self->_snapToClosestStopSupported;
}

- (void)setHasSnapToClosestStopSupported:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x8000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFF7FFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSnapToClosestStopSupported
{
  return (*(void *)&self->_flags >> 15) & 1;
}

- (BOOL)includeCrossLanguagePhonetics
{
  return self->_includeCrossLanguagePhonetics;
}

- (void)setHasIncludeCrossLanguagePhonetics:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 256;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasIncludeCrossLanguagePhonetics
{
  return (*(void *)&self->_flags >> 8) & 1;
}

- (void)_readUserCurrentTimezone
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 240));
    if ((*(unsigned char *)(a1 + 320) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserCurrentTimezone_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 240));
  }
}

- (BOOL)hasUserCurrentTimezone
{
  return self->_userCurrentTimezone != 0;
}

- (NSString)userCurrentTimezone
{
  -[GEOClientCapabilities _readUserCurrentTimezone]((uint64_t)self);
  userCurrentTimezone = self->_userCurrentTimezone;

  return userCurrentTimezone;
}

- (BOOL)supportsLongShieldStrings
{
  return self->_supportsLongShieldStrings;
}

- (void)setHasSupportsLongShieldStrings:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x800000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFF7FFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsLongShieldStrings
{
  return (*(void *)&self->_flags >> 35) & 1;
}

- (BOOL)supportsGuidanceEvents
{
  return self->_supportsGuidanceEvents;
}

- (void)setHasSupportsGuidanceEvents:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x100000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFEFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsGuidanceEvents
{
  return HIDWORD(*(void *)&self->_flags) & 1;
}

- (BOOL)supportsGuidanceEventsInlineShields
{
  return self->_supportsGuidanceEventsInlineShields;
}

- (void)setHasSupportsGuidanceEventsInlineShields:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x80000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFF7FFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsGuidanceEventsInlineShields
{
  return (*(void *)&self->_flags >> 31) & 1;
}

- (void)_readAbAssignInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 240));
    if ((*(void *)(a1 + 312) & 0x8000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAbAssignInfo_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 240));
  }
}

- (BOOL)hasAbAssignInfo
{
  return self->_abAssignInfo != 0;
}

- (GEOAbAssignInfo)abAssignInfo
{
  -[GEOClientCapabilities _readAbAssignInfo]((uint64_t)self);
  abAssignInfo = self->_abAssignInfo;

  return abAssignInfo;
}

- (void)setAbAssignInfo:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x8000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_abAssignInfo, a3);
}

- (void)_readRequestTime
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 240));
    if ((*(unsigned char *)(a1 + 320) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRequestTime_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 240));
  }
}

- (BOOL)hasRequestTime
{
  return self->_requestTime != 0;
}

- (GEOLocalTime)requestTime
{
  -[GEOClientCapabilities _readRequestTime]((uint64_t)self);
  requestTime = self->_requestTime;

  return requestTime;
}

- (void)setRequestTime:(id)a3
{
  *((unsigned char *)&self->_flags + 8) |= 0x12u;
  objc_storeStrong((id *)&self->_requestTime, a3);
}

- (unsigned)maxZilchMessageVersionSupported
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x20) != 0) {
    return self->_maxZilchMessageVersionSupported;
  }
  else {
    return 3;
  }
}

- (void)setHasMaxZilchMessageVersionSupported:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 32;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasMaxZilchMessageVersionSupported
{
  return (*(void *)&self->_flags >> 5) & 1;
}

- (unint64_t)supportedTransitFeaturesCount
{
  return self->_supportedTransitFeatures.count;
}

- (int)supportedTransitFeatures
{
  return self->_supportedTransitFeatures.list;
}

- (void)clearSupportedTransitFeatures
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x10u;

  PBRepeatedInt32Clear();
}

- (int)supportedTransitFeatureAtIndex:(unint64_t)a3
{
  -[GEOClientCapabilities _readSupportedTransitFeatures]((uint64_t)self);
  p_supportedTransitFeatures = &self->_supportedTransitFeatures;
  unint64_t count = self->_supportedTransitFeatures.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    uint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_supportedTransitFeatures->list[a3];
}

- (void)setSupportedTransitFeatures:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x10u;

  MEMORY[0x1F4147390](&self->_supportedTransitFeatures, a3, a4);
}

- (id)supportedTransitFeaturesAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E6F28[a3];
  }

  return v3;
}

- (int)StringAsSupportedTransitFeatures:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TEXT_IN_PLANNING_ARTWORK"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GOTO_STOP_IN_TRANSFERS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LIST_INSTRUCTION_TIME_TEXT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ENHANCED_GUIDANCE_2021"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PAYMENT_METHOD_SUGGESTIONS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"TICKETING_URLS"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)supportsArrivalMapRegion
{
  return self->_supportsArrivalMapRegion;
}

- (void)setHasSupportsArrivalMapRegion:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x80000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFF7FFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsArrivalMapRegion
{
  return (*(void *)&self->_flags >> 19) & 1;
}

- (BOOL)supportsNaturalGuidance
{
  return self->_supportsNaturalGuidance;
}

- (void)setHasSupportsNaturalGuidance:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x1000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFEFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsNaturalGuidance
{
  return (*(void *)&self->_flags >> 36) & 1;
}

- (BOOL)supportsJunctionView
{
  return self->_supportsJunctionView;
}

- (void)setHasSupportsJunctionView:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x200000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFDFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsJunctionView
{
  return (*(void *)&self->_flags >> 33) & 1;
}

- (BOOL)supportsCongestionZones
{
  return self->_supportsCongestionZones;
}

- (void)setHasSupportsCongestionZones:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x400000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFBFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsCongestionZones
{
  return (*(void *)&self->_flags >> 22) & 1;
}

- (BOOL)supportsLicensePlateRestrictions
{
  return self->_supportsLicensePlateRestrictions;
}

- (void)setHasSupportsLicensePlateRestrictions:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x400000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFBFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsLicensePlateRestrictions
{
  return (*(void *)&self->_flags >> 34) & 1;
}

- (BOOL)supportsElectricVehicleRoutes
{
  return self->_supportsElectricVehicleRoutes;
}

- (void)setHasSupportsElectricVehicleRoutes:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x4000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFBFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsElectricVehicleRoutes
{
  return (*(void *)&self->_flags >> 26) & 1;
}

- (BOOL)supportsTrafficCameras
{
  return self->_supportsTrafficCameras;
}

- (void)setHasSupportsTrafficCameras:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x40000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFBFFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsTrafficCameras
{
  return (*(void *)&self->_flags >> 42) & 1;
}

- (BOOL)supportsWaypointRoutes
{
  return self->_supportsWaypointRoutes;
}

- (void)setHasSupportsWaypointRoutes:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x200000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFDFFFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsWaypointRoutes
{
  return (*(void *)&self->_flags >> 45) & 1;
}

- (void)_readLocalizationCapabilities
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 240));
    if ((*(void *)(a1 + 312) & 0x8000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizationCapabilities_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 240));
  }
}

- (BOOL)hasLocalizationCapabilities
{
  return self->_localizationCapabilities != 0;
}

- (GEOLocalizationCapabilities)localizationCapabilities
{
  -[GEOClientCapabilities _readLocalizationCapabilities]((uint64_t)self);
  localizationCapabilities = self->_localizationCapabilities;

  return localizationCapabilities;
}

- (void)_readDeviceSku
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 240));
    if ((*(void *)(a1 + 312) & 0x200000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceSku_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 240));
  }
}

- (BOOL)hasDeviceSku
{
  return self->_deviceSku != 0;
}

- (NSString)deviceSku
{
  -[GEOClientCapabilities _readDeviceSku]((uint64_t)self);
  deviceSku = self->_deviceSku;

  return deviceSku;
}

- (void)_readOsVersion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 240));
    if ((*(unsigned char *)(a1 + 320) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOsVersion_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 240));
  }
}

- (BOOL)hasOsVersion
{
  return self->_osVersion != 0;
}

- (NSString)osVersion
{
  -[GEOClientCapabilities _readOsVersion]((uint64_t)self);
  osVersion = self->_osVersion;

  return osVersion;
}

- (void)setOsVersion:(id)a3
{
  *((unsigned char *)&self->_flags + 8) |= 0x11u;
  objc_storeStrong((id *)&self->_osVersion, a3);
}

- (BOOL)willSendEvDirectionsFeedback
{
  return self->_willSendEvDirectionsFeedback;
}

- (void)setHasWillSendEvDirectionsFeedback:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x400000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFBFFFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasWillSendEvDirectionsFeedback
{
  return (*(void *)&self->_flags >> 46) & 1;
}

- (BOOL)supportsRoadComplexities
{
  return self->_supportsRoadComplexities;
}

- (void)setHasSupportsRoadComplexities:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x2000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFDFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsRoadComplexities
{
  return (*(void *)&self->_flags >> 37) & 1;
}

- (BOOL)supportsSpeedTrapAnnouncements
{
  return self->_supportsSpeedTrapAnnouncements;
}

- (void)setHasSupportsSpeedTrapAnnouncements:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x20000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFDFFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsSpeedTrapAnnouncements
{
  return (*(void *)&self->_flags >> 41) & 1;
}

- (BOOL)supportsUserIncidentReports
{
  return self->_supportsUserIncidentReports;
}

- (void)setHasSupportsUserIncidentReports:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x80000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFF7FFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsUserIncidentReports
{
  return (*(void *)&self->_flags >> 43) & 1;
}

- (BOOL)supportsAreaEventsEnhancements
{
  return self->_supportsAreaEventsEnhancements;
}

- (void)setHasSupportsAreaEventsEnhancements:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x40000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFBFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsAreaEventsEnhancements
{
  return (*(void *)&self->_flags >> 18) & 1;
}

- (BOOL)supportsAdvancedMap
{
  return self->_supportsAdvancedMap;
}

- (void)setHasSupportsAdvancedMap:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x20000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFDFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsAdvancedMap
{
  return (*(void *)&self->_flags >> 17) & 1;
}

- (BOOL)supportsSilentRouteUpdates
{
  return self->_supportsSilentRouteUpdates;
}

- (void)setHasSupportsSilentRouteUpdates:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x10000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFEFFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsSilentRouteUpdates
{
  return (*(void *)&self->_flags >> 40) & 1;
}

- (BOOL)replaceAccidentStringWithCrash
{
  return self->_replaceAccidentStringWithCrash;
}

- (void)setHasReplaceAccidentStringWithCrash:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x2000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasReplaceAccidentStringWithCrash
{
  return (*(void *)&self->_flags >> 13) & 1;
}

- (BOOL)supportsGuidanceEventPrivacyFilters
{
  return self->_supportsGuidanceEventPrivacyFilters;
}

- (void)setSupportsGuidanceEventPrivacyFilters:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x40000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsGuidanceEventPrivacyFilters = a3;
}

- (void)setHasSupportsGuidanceEventPrivacyFilters:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x40000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFBFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsGuidanceEventPrivacyFilters
{
  return (*(void *)&self->_flags >> 30) & 1;
}

- (BOOL)supportsGuidanceEventImportanceInfo
{
  return self->_supportsGuidanceEventImportanceInfo;
}

- (void)setHasSupportsGuidanceEventImportanceInfo:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x20000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFDFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsGuidanceEventImportanceInfo
{
  return (*(void *)&self->_flags >> 29) & 1;
}

- (BOOL)isAdvancedMap
{
  return self->_isAdvancedMap;
}

- (void)setIsAdvancedMap:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x800uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_isAdvancedMap = a3;
}

- (void)setHasIsAdvancedMap:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 2048;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasIsAdvancedMap
{
  return (*(void *)&self->_flags >> 11) & 1;
}

- (BOOL)isGlobeProjection
{
  return self->_isGlobeProjection;
}

- (void)setIsGlobeProjection:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x1000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_isGlobeProjection = a3;
}

- (void)setHasIsGlobeProjection:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 4096;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasIsGlobeProjection
{
  return (*(void *)&self->_flags >> 12) & 1;
}

- (unint64_t)supportsMultipointRoutingsCount
{
  return self->_supportsMultipointRoutings.count;
}

- (int)supportsMultipointRoutings
{
  return self->_supportsMultipointRoutings.list;
}

- (void)clearSupportsMultipointRoutings
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x10u;

  PBRepeatedInt32Clear();
}

- (int)supportsMultipointRoutingAtIndex:(unint64_t)a3
{
  -[GEOClientCapabilities _readSupportsMultipointRoutings]((uint64_t)self);
  p_supportsMultipointRoutings = &self->_supportsMultipointRoutings;
  unint64_t count = self->_supportsMultipointRoutings.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    uint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_supportsMultipointRoutings->list[a3];
}

- (void)setSupportsMultipointRoutings:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x10u;

  MEMORY[0x1F4147390](&self->_supportsMultipointRoutings, a3, a4);
}

- (id)supportsMultipointRoutingsAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E7098[a3];
  }

  return v3;
}

- (int)StringAsSupportsMultipointRoutings:(id)a3
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

- (BOOL)supportsDefaultToNewRouteFlag
{
  return self->_supportsDefaultToNewRouteFlag;
}

- (void)setSupportsDefaultToNewRouteFlag:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x800000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsDefaultToNewRouteFlag = a3;
}

- (void)setHasSupportsDefaultToNewRouteFlag:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x800000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFF7FFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsDefaultToNewRouteFlag
{
  return (*(void *)&self->_flags >> 23) & 1;
}

- (BOOL)hasWalkingSupportedFeatures
{
  return self->_walkingSupportedFeatures != 0;
}

- (int)maxSupportedTransitFareVersion
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x10) != 0) {
    return self->_maxSupportedTransitFareVersion;
  }
  else {
    return 1;
  }
}

- (void)setHasMaxSupportedTransitFareVersion:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 16;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasMaxSupportedTransitFareVersion
{
  return (*(void *)&self->_flags >> 4) & 1;
}

- (id)maxSupportedTransitFareVersionAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E6F60[a3];
  }

  return v3;
}

- (int)StringAsMaxSupportedTransitFareVersion:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TRANSIT_FARE_SUPPORT_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSIT_FARE_SUPPORT_VERSION_1"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TRANSIT_FARE_SUPPORT_VERSION_2"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)supportsDisablingProgressBarFromBannerButtons
{
  return self->_supportsDisablingProgressBarFromBannerButtons;
}

- (void)setHasSupportsDisablingProgressBarFromBannerButtons:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x1000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFEFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsDisablingProgressBarFromBannerButtons
{
  return (*(void *)&self->_flags >> 24) & 1;
}

- (BOOL)supportsBannerQueuing
{
  return self->_supportsBannerQueuing;
}

- (void)setHasSupportsBannerQueuing:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x200000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFDFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsBannerQueuing
{
  return (*(void *)&self->_flags >> 21) & 1;
}

- (BOOL)supportsEv2
{
  return self->_supportsEv2;
}

- (void)setHasSupportsEv2:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x8000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFF7FFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsEv2
{
  return (*(void *)&self->_flags >> 27) & 1;
}

- (BOOL)supportsRouteNameRanges
{
  return self->_supportsRouteNameRanges;
}

- (void)setHasSupportsRouteNameRanges:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x8000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFF7FFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsRouteNameRanges
{
  return (*(void *)&self->_flags >> 39) & 1;
}

- (BOOL)supportsWalkingSuggestionsAfterParking
{
  return self->_supportsWalkingSuggestionsAfterParking;
}

- (void)setHasSupportsWalkingSuggestionsAfterParking:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x100000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFEFFFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsWalkingSuggestionsAfterParking
{
  return (*(void *)&self->_flags >> 44) & 1;
}

- (BOOL)supportsGenericCombinationsInstructionsForAllModes
{
  return self->_supportsGenericCombinationsInstructionsForAllModes;
}

- (void)setHasSupportsGenericCombinationsInstructionsForAllModes:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x10000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFEFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsGenericCombinationsInstructionsForAllModes
{
  return (*(void *)&self->_flags >> 28) & 1;
}

- (BOOL)supportsRouteCameraInputUpdates
{
  return self->_supportsRouteCameraInputUpdates;
}

- (void)setHasSupportsRouteCameraInputUpdates:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x4000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFBFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsRouteCameraInputUpdates
{
  return (*(void *)&self->_flags >> 38) & 1;
}

- (BOOL)supportsDodgeballCameraInput
{
  return self->_supportsDodgeballCameraInput;
}

- (void)setSupportsDodgeballCameraInput:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x2000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportsDodgeballCameraInput = a3;
}

- (void)setHasSupportsDodgeballCameraInput:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x2000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFDFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsDodgeballCameraInput
{
  return (*(void *)&self->_flags >> 25) & 1;
}

- (unint64_t)supportedElevationModelsCount
{
  return self->_supportedElevationModels.count;
}

- (int)supportedElevationModels
{
  return self->_supportedElevationModels.list;
}

- (void)clearSupportedElevationModels
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x10u;

  PBRepeatedInt32Clear();
}

- (int)supportedElevationModelAtIndex:(unint64_t)a3
{
  -[GEOClientCapabilities _readSupportedElevationModels]((uint64_t)self);
  p_supportedElevationModels = &self->_supportedElevationModels;
  unint64_t count = self->_supportedElevationModels.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    uint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_supportedElevationModels->list[a3];
}

- (void)setSupportedElevationModels:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x10u;

  MEMORY[0x1F4147390](&self->_supportedElevationModels, a3, a4);
}

- (id)supportedElevationModelsAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      uint64_t v4 = @"ELEVATION_MODEL_WGS84";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v4 = @"ELEVATION_MODEL_EGM96";
  }
  return v4;
}

- (int)StringAsSupportedElevationModels:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ELEVATION_MODEL_EGM96"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"ELEVATION_MODEL_WGS84"];
  }

  return v4;
}

- (BOOL)supportEmissionsTagging
{
  return self->_supportEmissionsTagging;
}

- (void)setSupportEmissionsTagging:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x10000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_supportEmissionsTagging = a3;
}

- (void)setHasSupportEmissionsTagging:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x10000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFEFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportEmissionsTagging
{
  return (*(void *)&self->_flags >> 16) & 1;
}

- (void)_readArtworkCapabilities
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 240));
    if ((*(void *)(a1 + 312) & 0x80000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArtworkCapabilities_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 240));
  }
}

- (BOOL)hasArtworkCapabilities
{
  return self->_artworkCapabilities != 0;
}

- (GEOArtworkCapabilities)artworkCapabilities
{
  -[GEOClientCapabilities _readArtworkCapabilities]((uint64_t)self);
  artworkCapabilities = self->_artworkCapabilities;

  return artworkCapabilities;
}

- (void)setArtworkCapabilities:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x80000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_artworkCapabilities, a3);
}

- (BOOL)supportsBannerQueuingDirections
{
  return self->_supportsBannerQueuingDirections;
}

- (void)setHasSupportsBannerQueuingDirections:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x100000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFEFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x10;
}

- (BOOL)hasSupportsBannerQueuingDirections
{
  return (*(void *)&self->_flags >> 20) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOClientCapabilities;
  uint64_t v4 = [(GEOClientCapabilities *)&v8 description];
  id v5 = [(GEOClientCapabilities *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOClientCapabilities _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v155 = 0;
    goto LABEL_356;
  }
  [(id)a1 readAll:1];
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [(id)a1 appMajorVersion];
  if (v5) {
    [v4 setObject:v5 forKey:@"appMajorVersion"];
  }

  objc_super v6 = [(id)a1 appMinorVersion];
  if (v6) {
    [v4 setObject:v6 forKey:@"appMinorVersion"];
  }

  id v7 = [(id)a1 hardwareModel];
  if (v7) {
    [v4 setObject:v7 forKey:@"hardwareModel"];
  }

  objc_super v8 = [(id)a1 hardwareClass];
  if (v8)
  {
    if (a2) {
      uint64_t v9 = @"hardwareClass";
    }
    else {
      uint64_t v9 = @"hardware_class";
    }
    [v4 setObject:v8 forKey:v9];
  }

  uint64_t v10 = *(void *)(a1 + 312);
  if ((v10 & 2) != 0)
  {
    uint64_t v11 = @"NO_TURN";
    switch(*(_DWORD *)(a1 + 248))
    {
      case 0:
        break;
      case 1:
        uint64_t v11 = @"LEFT_TURN";
        break;
      case 2:
        uint64_t v11 = @"RIGHT_TURN";
        break;
      case 3:
        uint64_t v11 = @"STRAIGHT_AHEAD";
        break;
      case 4:
        uint64_t v11 = @"U_TURN";
        break;
      case 5:
        uint64_t v11 = @"FOLLOW_ROAD";
        break;
      case 6:
        uint64_t v11 = @"ENTER_ROUNDABOUT";
        break;
      case 7:
        uint64_t v11 = @"EXIT_ROUNDABOUT";
        break;
      case 0xB:
        uint64_t v11 = @"OFF_RAMP";
        break;
      case 0xC:
        uint64_t v11 = @"ON_RAMP";
        break;
      case 0x10:
        uint64_t v11 = @"ARRIVE_END_OF_NAVIGATION";
        break;
      case 0x11:
        uint64_t v11 = @"START_ROUTE";
        break;
      case 0x12:
        uint64_t v11 = @"ARRIVE_AT_DESTINATION";
        break;
      case 0x14:
        uint64_t v11 = @"KEEP_LEFT";
        break;
      case 0x15:
        uint64_t v11 = @"KEEP_RIGHT";
        break;
      case 0x16:
        uint64_t v11 = @"ENTER_FERRY";
        break;
      case 0x17:
        uint64_t v11 = @"EXIT_FERRY";
        break;
      case 0x18:
        uint64_t v11 = @"CHANGE_FERRY";
        break;
      case 0x19:
        uint64_t v11 = @"START_ROUTE_WITH_U_TURN";
        break;
      case 0x1A:
        uint64_t v11 = @"U_TURN_AT_ROUNDABOUT";
        break;
      case 0x1B:
        uint64_t v11 = @"LEFT_TURN_AT_END";
        break;
      case 0x1C:
        uint64_t v11 = @"RIGHT_TURN_AT_END";
        break;
      case 0x1D:
        uint64_t v11 = @"HIGHWAY_OFF_RAMP_LEFT";
        break;
      case 0x1E:
        uint64_t v11 = @"HIGHWAY_OFF_RAMP_RIGHT";
        break;
      case 0x21:
        uint64_t v11 = @"ARRIVE_AT_DESTINATION_LEFT";
        break;
      case 0x22:
        uint64_t v11 = @"ARRIVE_AT_DESTINATION_RIGHT";
        break;
      case 0x23:
        uint64_t v11 = @"U_TURN_WHEN_POSSIBLE";
        break;
      case 0x27:
        uint64_t v11 = @"ARRIVE_END_OF_DIRECTIONS";
        break;
      case 0x29:
        uint64_t v11 = @"ROUNDABOUT_EXIT_1";
        break;
      case 0x2A:
        uint64_t v11 = @"ROUNDABOUT_EXIT_2";
        break;
      case 0x2B:
        uint64_t v11 = @"ROUNDABOUT_EXIT_3";
        break;
      case 0x2C:
        uint64_t v11 = @"ROUNDABOUT_EXIT_4";
        break;
      case 0x2D:
        uint64_t v11 = @"ROUNDABOUT_EXIT_5";
        break;
      case 0x2E:
        uint64_t v11 = @"ROUNDABOUT_EXIT_6";
        break;
      case 0x2F:
        uint64_t v11 = @"ROUNDABOUT_EXIT_7";
        break;
      case 0x30:
        uint64_t v11 = @"ROUNDABOUT_EXIT_8";
        break;
      case 0x31:
        uint64_t v11 = @"ROUNDABOUT_EXIT_9";
        break;
      case 0x32:
        uint64_t v11 = @"ROUNDABOUT_EXIT_10";
        break;
      case 0x33:
        uint64_t v11 = @"ROUNDABOUT_EXIT_11";
        break;
      case 0x34:
        uint64_t v11 = @"ROUNDABOUT_EXIT_12";
        break;
      case 0x35:
        uint64_t v11 = @"ROUNDABOUT_EXIT_13";
        break;
      case 0x36:
        uint64_t v11 = @"ROUNDABOUT_EXIT_14";
        break;
      case 0x37:
        uint64_t v11 = @"ROUNDABOUT_EXIT_15";
        break;
      case 0x38:
        uint64_t v11 = @"ROUNDABOUT_EXIT_16";
        break;
      case 0x39:
        uint64_t v11 = @"ROUNDABOUT_EXIT_17";
        break;
      case 0x3A:
        uint64_t v11 = @"ROUNDABOUT_EXIT_18";
        break;
      case 0x3B:
        uint64_t v11 = @"ROUNDABOUT_EXIT_19";
        break;
      case 0x3C:
        uint64_t v11 = @"SHARP_LEFT_TURN";
        break;
      case 0x3D:
        uint64_t v11 = @"SHARP_RIGHT_TURN";
        break;
      case 0x3E:
        uint64_t v11 = @"SLIGHT_LEFT_TURN";
        break;
      case 0x3F:
        uint64_t v11 = @"SLIGHT_RIGHT_TURN";
        break;
      case 0x40:
        uint64_t v11 = @"CHANGE_HIGHWAY";
        break;
      case 0x41:
        uint64_t v11 = @"CHANGE_HIGHWAY_LEFT";
        break;
      case 0x42:
        uint64_t v11 = @"CHANGE_HIGHWAY_RIGHT";
        break;
      case 0x50:
        uint64_t v11 = @"TOLL_STATION";
        break;
      case 0x51:
        uint64_t v11 = @"ENTER_TUNNEL";
        break;
      case 0x52:
        uint64_t v11 = @"WAYPOINT_STOP";
        break;
      case 0x53:
        uint64_t v11 = @"WAYPOINT_STOP_LEFT";
        break;
      case 0x54:
        uint64_t v11 = @"WAYPOINT_STOP_RIGHT";
        break;
      case 0x55:
        uint64_t v11 = @"RESUME_ROUTE";
        break;
      case 0x56:
        uint64_t v11 = @"RESUME_ROUTE_WITH_U_TURN";
        break;
      case 0x57:
        uint64_t v11 = @"CUSTOM";
        break;
      case 0x58:
        uint64_t v11 = @"TURN_AROUND";
        break;
      default:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 248));
        uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    [v4 setObject:v11 forKey:@"maxManeuverTypeSupported"];

    uint64_t v10 = *(void *)(a1 + 312);
  }
  if ((v10 & 0x200) != 0)
  {
    uint64_t v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 274)];
    [v4 setObject:v12 forKey:@"internalInstall"];

    uint64_t v10 = *(void *)(a1 + 312);
  }
  if ((v10 & 0x400) != 0)
  {
    uint64_t v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 275)];
    [v4 setObject:v13 forKey:@"internalTool"];
  }
  if (*(void *)(a1 + 152))
  {
    uint64_t v14 = [(id)a1 displayLanguages];
    [v4 setObject:v14 forKey:@"displayLanguages"];
  }
  uint64_t v15 = [(id)a1 displayRegion];
  if (v15) {
    [v4 setObject:v15 forKey:@"displayRegion"];
  }

  uint64_t v16 = *(void *)(a1 + 312);
  if ((v16 & 8) != 0)
  {
    uint64_t v20 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 256)];
    [v4 setObject:v20 forKey:@"maxTrafficSpeedSupported"];

    uint64_t v16 = *(void *)(a1 + 312);
    if ((v16 & 4) == 0)
    {
LABEL_89:
      if ((v16 & 1) == 0) {
        goto LABEL_91;
      }
      goto LABEL_90;
    }
  }
  else if ((v16 & 4) == 0)
  {
    goto LABEL_89;
  }
  uint64_t v21 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 252)];
  [v4 setObject:v21 forKey:@"maxRouteIncidentSupported"];

  if (*(void *)(a1 + 312))
  {
LABEL_90:
    uint64_t v17 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 244)];
    [v4 setObject:v17 forKey:@"maxFormatterSupported"];
  }
LABEL_91:
  uint64_t v18 = [(id)a1 deviceCountryCode];
  if (v18) {
    [v4 setObject:v18 forKey:@"deviceCountryCode"];
  }

  uint64_t v19 = *(void *)(a1 + 312);
  if ((v19 & 0x80) != 0)
  {
    uint64_t v22 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 272)];
    [v4 setObject:v22 forKey:@"clusteredTransitRoutesSupported"];

    uint64_t v19 = *(void *)(a1 + 312);
    if ((v19 & 0x4000) == 0)
    {
LABEL_95:
      if ((v19 & 0x40) == 0) {
        goto LABEL_106;
      }
      goto LABEL_102;
    }
  }
  else if ((v19 & 0x4000) == 0)
  {
    goto LABEL_95;
  }
  v23 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 279)];
  [v4 setObject:v23 forKey:@"routeOptionsSupported"];

  if ((*(void *)(a1 + 312) & 0x40) == 0) {
    goto LABEL_106;
  }
LABEL_102:
  unsigned int v24 = *(_DWORD *)(a1 + 268) - 1;
  if (v24 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 268));
    long long v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v25 = off_1E53E6F10[v24];
  }
  [v4 setObject:v25 forKey:@"transitMarketSupport"];

LABEL_106:
  long long v26 = [(id)a1 formattedStringClientCapabilities];
  uint64_t v27 = v26;
  if (v26)
  {
    if (a2) {
      [v26 jsonRepresentation];
    }
    else {
    id v28 = [v26 dictionaryRepresentation];
    }

    [v4 setObject:v28 forKey:@"formattedStringClientCapabilities"];
  }

  uint64_t v29 = [(id)a1 advisoryClientCapabilities];
  v30 = v29;
  if (v29)
  {
    if (a2)
    {
      uint64_t v31 = [v29 jsonRepresentation];
      id v32 = @"advisoryClientCapabilities";
    }
    else
    {
      uint64_t v31 = [v29 dictionaryRepresentation];
      id v32 = @"advisory_client_capabilities";
    }
    id v33 = v31;

    [v4 setObject:v33 forKey:v32];
  }

  uint64_t v34 = *(void *)(a1 + 312);
  if ((v34 & 0x8000) != 0)
  {
    v35 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 280)];
    [v4 setObject:v35 forKey:@"snapToClosestStopSupported"];

    uint64_t v34 = *(void *)(a1 + 312);
  }
  if ((v34 & 0x100) != 0)
  {
    uint64_t v36 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 273)];
    if (a2) {
      uint64_t v37 = @"includeCrossLanguagePhonetics";
    }
    else {
      uint64_t v37 = @"include_cross_language_phonetics";
    }
    [v4 setObject:v36 forKey:v37];
  }
  v38 = [(id)a1 userCurrentTimezone];
  if (v38)
  {
    if (a2) {
      v39 = @"userCurrentTimezone";
    }
    else {
      v39 = @"user_current_timezone";
    }
    [v4 setObject:v38 forKey:v39];
  }

  uint64_t v40 = *(void *)(a1 + 312);
  if ((v40 & 0x800000000) != 0)
  {
    id v47 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 300)];
    if (a2) {
      v48 = @"supportsLongShieldStrings";
    }
    else {
      v48 = @"supports_long_shield_strings";
    }
    [v4 setObject:v47 forKey:v48];

    uint64_t v40 = *(void *)(a1 + 312);
    if ((v40 & 0x100000000) == 0)
    {
LABEL_130:
      if ((v40 & 0x80000000) == 0) {
        goto LABEL_135;
      }
      goto LABEL_131;
    }
  }
  else if ((v40 & 0x100000000) == 0)
  {
    goto LABEL_130;
  }
  uint64_t v49 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 297)];
  if (a2) {
    v50 = @"supportsGuidanceEvents";
  }
  else {
    v50 = @"supports_guidance_events";
  }
  [v4 setObject:v49 forKey:v50];

  if ((*(void *)(a1 + 312) & 0x80000000) != 0)
  {
LABEL_131:
    id v41 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 296)];
    if (a2) {
      v42 = @"supportsGuidanceEventsInlineShields";
    }
    else {
      v42 = @"supports_guidance_events_inline_shields";
    }
    [v4 setObject:v41 forKey:v42];
  }
LABEL_135:
  id v43 = [(id)a1 abAssignInfo];
  v44 = v43;
  if (v43)
  {
    if (a2)
    {
      v45 = [v43 jsonRepresentation];
      uint64_t v46 = @"abAssignInfo";
    }
    else
    {
      v45 = [v43 dictionaryRepresentation];
      uint64_t v46 = @"ab_assign_info";
    }
    id v51 = v45;

    [v4 setObject:v51 forKey:v46];
  }

  v52 = [(id)a1 requestTime];
  v53 = v52;
  if (v52)
  {
    if (a2)
    {
      uint64_t v54 = [v52 jsonRepresentation];
      id v55 = @"requestTime";
    }
    else
    {
      uint64_t v54 = [v52 dictionaryRepresentation];
      id v55 = @"request_time";
    }
    id v56 = v54;

    [v4 setObject:v56 forKey:v55];
  }

  if ((*(void *)(a1 + 312) & 0x20) != 0)
  {
    v57 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 264)];
    if (a2) {
      uint64_t v58 = @"maxZilchMessageVersionSupported";
    }
    else {
      uint64_t v58 = @"max_zilch_message_version_supported";
    }
    [v4 setObject:v57 forKey:v58];
  }
  if (*(void *)(a1 + 56))
  {
    id v59 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v60 = (void *)(a1 + 48);
    if (*(void *)(a1 + 56))
    {
      unint64_t v61 = 0;
      do
      {
        uint64_t v62 = *(int *)(*v60 + 4 * v61);
        if (v62 >= 7)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v62);
          long long v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          long long v63 = off_1E53E6F28[v62];
        }
        [v59 addObject:v63];

        ++v61;
        v60 = (void *)(a1 + 48);
      }
      while (v61 < *(void *)(a1 + 56));
    }
    if (a2) {
      long long v64 = @"supportedTransitFeature";
    }
    else {
      long long v64 = @"supported_transit_feature";
    }
    [v4 setObject:v59 forKey:v64];
  }
  uint64_t v65 = *(void *)(a1 + 312);
  if ((v65 & 0x80000) != 0)
  {
    v72 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 284)];
    if (a2) {
      v73 = @"supportsArrivalMapRegion";
    }
    else {
      v73 = @"supports_arrival_map_region";
    }
    [v4 setObject:v72 forKey:v73];

    uint64_t v65 = *(void *)(a1 + 312);
    if ((v65 & 0x1000000000) == 0)
    {
LABEL_172:
      if ((v65 & 0x200000000) == 0) {
        goto LABEL_173;
      }
      goto LABEL_193;
    }
  }
  else if ((v65 & 0x1000000000) == 0)
  {
    goto LABEL_172;
  }
  v74 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 301)];
  if (a2) {
    v75 = @"supportsNaturalGuidance";
  }
  else {
    v75 = @"supports_natural_guidance";
  }
  [v4 setObject:v74 forKey:v75];

  uint64_t v65 = *(void *)(a1 + 312);
  if ((v65 & 0x200000000) == 0)
  {
LABEL_173:
    if ((v65 & 0x400000) == 0) {
      goto LABEL_174;
    }
    goto LABEL_197;
  }
LABEL_193:
  v76 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 298)];
  if (a2) {
    v77 = @"supportsJunctionView";
  }
  else {
    v77 = @"supports_junction_view";
  }
  [v4 setObject:v76 forKey:v77];

  uint64_t v65 = *(void *)(a1 + 312);
  if ((v65 & 0x400000) == 0)
  {
LABEL_174:
    if ((v65 & 0x400000000) == 0) {
      goto LABEL_175;
    }
    goto LABEL_201;
  }
LABEL_197:
  v78 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 287)];
  if (a2) {
    v79 = @"supportsCongestionZones";
  }
  else {
    v79 = @"supports_congestion_zones";
  }
  [v4 setObject:v78 forKey:v79];

  uint64_t v65 = *(void *)(a1 + 312);
  if ((v65 & 0x400000000) == 0)
  {
LABEL_175:
    if ((v65 & 0x4000000) == 0) {
      goto LABEL_176;
    }
    goto LABEL_205;
  }
LABEL_201:
  v80 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 299)];
  if (a2) {
    v81 = @"supportsLicensePlateRestrictions";
  }
  else {
    v81 = @"supports_license_plate_restrictions";
  }
  [v4 setObject:v80 forKey:v81];

  uint64_t v65 = *(void *)(a1 + 312);
  if ((v65 & 0x4000000) == 0)
  {
LABEL_176:
    if ((v65 & 0x40000000000) == 0) {
      goto LABEL_177;
    }
    goto LABEL_209;
  }
LABEL_205:
  v82 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 291)];
  if (a2) {
    v83 = @"supportsElectricVehicleRoutes";
  }
  else {
    v83 = @"supports_electric_vehicle_routes";
  }
  [v4 setObject:v82 forKey:v83];

  uint64_t v65 = *(void *)(a1 + 312);
  if ((v65 & 0x40000000000) == 0)
  {
LABEL_177:
    if ((v65 & 0x200000000000) == 0) {
      goto LABEL_182;
    }
    goto LABEL_178;
  }
LABEL_209:
  v84 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 307)];
  if (a2) {
    v85 = @"supportsTrafficCameras";
  }
  else {
    v85 = @"supports_traffic_cameras";
  }
  [v4 setObject:v84 forKey:v85];

  if ((*(void *)(a1 + 312) & 0x200000000000) != 0)
  {
LABEL_178:
    long long v66 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 310)];
    if (a2) {
      v67 = @"supportsWaypointRoutes";
    }
    else {
      v67 = @"supports_waypoint_routes";
    }
    [v4 setObject:v66 forKey:v67];
  }
LABEL_182:
  uint64_t v68 = [(id)a1 localizationCapabilities];
  v69 = v68;
  if (v68)
  {
    if (a2)
    {
      v70 = [v68 jsonRepresentation];
      v71 = @"localizationCapabilities";
    }
    else
    {
      v70 = [v68 dictionaryRepresentation];
      v71 = @"localization_capabilities";
    }
    id v86 = v70;

    [v4 setObject:v86 forKey:v71];
  }

  v87 = [(id)a1 deviceSku];
  if (v87)
  {
    if (a2) {
      v88 = @"deviceSku";
    }
    else {
      v88 = @"device_sku";
    }
    [v4 setObject:v87 forKey:v88];
  }

  v89 = [(id)a1 osVersion];
  if (v89)
  {
    if (a2) {
      v90 = @"osVersion";
    }
    else {
      v90 = @"os_version";
    }
    [v4 setObject:v89 forKey:v90];
  }

  uint64_t v91 = *(void *)(a1 + 312);
  if ((v91 & 0x400000000000) != 0)
  {
    v106 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 311)];
    if (a2) {
      v107 = @"willSendEvDirectionsFeedback";
    }
    else {
      v107 = @"will_send_ev_directions_feedback";
    }
    [v4 setObject:v106 forKey:v107];

    uint64_t v91 = *(void *)(a1 + 312);
    if ((v91 & 0x2000000000) == 0)
    {
LABEL_228:
      if ((v91 & 0x20000000000) == 0) {
        goto LABEL_229;
      }
      goto LABEL_269;
    }
  }
  else if ((v91 & 0x2000000000) == 0)
  {
    goto LABEL_228;
  }
  v108 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 302)];
  if (a2) {
    v109 = @"supportsRoadComplexities";
  }
  else {
    v109 = @"supports_road_complexities";
  }
  [v4 setObject:v108 forKey:v109];

  uint64_t v91 = *(void *)(a1 + 312);
  if ((v91 & 0x20000000000) == 0)
  {
LABEL_229:
    if ((v91 & 0x80000000000) == 0) {
      goto LABEL_230;
    }
    goto LABEL_273;
  }
LABEL_269:
  v110 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 306)];
  if (a2) {
    v111 = @"supportsSpeedTrapAnnouncements";
  }
  else {
    v111 = @"supports_speed_trap_announcements";
  }
  [v4 setObject:v110 forKey:v111];

  uint64_t v91 = *(void *)(a1 + 312);
  if ((v91 & 0x80000000000) == 0)
  {
LABEL_230:
    if ((v91 & 0x40000) == 0) {
      goto LABEL_231;
    }
    goto LABEL_277;
  }
LABEL_273:
  v112 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 308)];
  if (a2) {
    v113 = @"supportsUserIncidentReports";
  }
  else {
    v113 = @"supports_user_incident_reports";
  }
  [v4 setObject:v112 forKey:v113];

  uint64_t v91 = *(void *)(a1 + 312);
  if ((v91 & 0x40000) == 0)
  {
LABEL_231:
    if ((v91 & 0x20000) == 0) {
      goto LABEL_232;
    }
    goto LABEL_281;
  }
LABEL_277:
  v114 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 283)];
  if (a2) {
    v115 = @"supportsAreaEventsEnhancements";
  }
  else {
    v115 = @"supports_area_events_enhancements";
  }
  [v4 setObject:v114 forKey:v115];

  uint64_t v91 = *(void *)(a1 + 312);
  if ((v91 & 0x20000) == 0)
  {
LABEL_232:
    if ((v91 & 0x10000000000) == 0) {
      goto LABEL_233;
    }
    goto LABEL_285;
  }
LABEL_281:
  v116 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 282)];
  if (a2) {
    v117 = @"supportsAdvancedMap";
  }
  else {
    v117 = @"supports_advanced_map";
  }
  [v4 setObject:v116 forKey:v117];

  uint64_t v91 = *(void *)(a1 + 312);
  if ((v91 & 0x10000000000) == 0)
  {
LABEL_233:
    if ((v91 & 0x2000) == 0) {
      goto LABEL_234;
    }
    goto LABEL_289;
  }
LABEL_285:
  v118 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 305)];
  if (a2) {
    v119 = @"supportsSilentRouteUpdates";
  }
  else {
    v119 = @"supports_silent_route_updates";
  }
  [v4 setObject:v118 forKey:v119];

  uint64_t v91 = *(void *)(a1 + 312);
  if ((v91 & 0x2000) == 0)
  {
LABEL_234:
    if ((v91 & 0x40000000) == 0) {
      goto LABEL_235;
    }
    goto LABEL_293;
  }
LABEL_289:
  v120 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 278)];
  if (a2) {
    v121 = @"replaceAccidentStringWithCrash";
  }
  else {
    v121 = @"replace_accident_string_with_crash";
  }
  [v4 setObject:v120 forKey:v121];

  uint64_t v91 = *(void *)(a1 + 312);
  if ((v91 & 0x40000000) == 0)
  {
LABEL_235:
    if ((v91 & 0x20000000) == 0) {
      goto LABEL_236;
    }
    goto LABEL_297;
  }
LABEL_293:
  v122 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 295)];
  if (a2) {
    v123 = @"supportsGuidanceEventPrivacyFilters";
  }
  else {
    v123 = @"supports_guidance_event_privacy_filters";
  }
  [v4 setObject:v122 forKey:v123];

  uint64_t v91 = *(void *)(a1 + 312);
  if ((v91 & 0x20000000) == 0)
  {
LABEL_236:
    if ((v91 & 0x800) == 0) {
      goto LABEL_237;
    }
    goto LABEL_301;
  }
LABEL_297:
  v124 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 294)];
  if (a2) {
    v125 = @"supportsGuidanceEventImportanceInfo";
  }
  else {
    v125 = @"supports_guidance_event_importance_info";
  }
  [v4 setObject:v124 forKey:v125];

  uint64_t v91 = *(void *)(a1 + 312);
  if ((v91 & 0x800) == 0)
  {
LABEL_237:
    if ((v91 & 0x1000) == 0) {
      goto LABEL_242;
    }
    goto LABEL_238;
  }
LABEL_301:
  v126 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 276)];
  if (a2) {
    v127 = @"isAdvancedMap";
  }
  else {
    v127 = @"is_advanced_map";
  }
  [v4 setObject:v126 forKey:v127];

  if ((*(void *)(a1 + 312) & 0x1000) != 0)
  {
LABEL_238:
    v92 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 277)];
    if (a2) {
      v93 = @"isGlobeProjection";
    }
    else {
      v93 = @"is_globe_projection";
    }
    [v4 setObject:v92 forKey:v93];
  }
LABEL_242:
  if (*(void *)(a1 + 80))
  {
    v94 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v95 = (void *)(a1 + 72);
    if (*(void *)(a1 + 80))
    {
      unint64_t v96 = 0;
      do
      {
        uint64_t v97 = *(int *)(*v95 + 4 * v96);
        if (v97 >= 7)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v97);
          v98 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v98 = off_1E53E7098[v97];
        }
        [v94 addObject:v98];

        ++v96;
        v95 = (void *)(a1 + 72);
      }
      while (v96 < *(void *)(a1 + 80));
    }
    if (a2) {
      v99 = @"supportsMultipointRouting";
    }
    else {
      v99 = @"supports_multipoint_routing";
    }
    [v4 setObject:v94 forKey:v99];
  }
  if ((*(void *)(a1 + 312) & 0x800000) != 0)
  {
    v100 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 288)];
    if (a2) {
      v101 = @"supportsDefaultToNewRouteFlag";
    }
    else {
      v101 = @"supports_default_to_new_route_flag";
    }
    [v4 setObject:v100 forKey:v101];
  }
  v102 = [(id)a1 walkingSupportedFeatures];
  v103 = v102;
  if (v102)
  {
    if (a2)
    {
      v104 = [v102 jsonRepresentation];
      v105 = @"walkingSupportedFeatures";
    }
    else
    {
      v104 = [v102 dictionaryRepresentation];
      v105 = @"walking_supported_features";
    }
    id v128 = v104;

    [v4 setObject:v128 forKey:v105];
  }

  uint64_t v129 = *(void *)(a1 + 312);
  if ((v129 & 0x10) != 0)
  {
    uint64_t v144 = *(int *)(a1 + 260);
    if (v144 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 260));
      v145 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v145 = off_1E53E6F60[v144];
    }
    if (a2) {
      v157 = @"maxSupportedTransitFareVersion";
    }
    else {
      v157 = @"max_supported_transit_fare_version";
    }
    [v4 setObject:v145 forKey:v157];

    uint64_t v129 = *(void *)(a1 + 312);
    if ((v129 & 0x1000000) == 0)
    {
LABEL_310:
      if ((v129 & 0x200000) == 0) {
        goto LABEL_311;
      }
      goto LABEL_368;
    }
  }
  else if ((v129 & 0x1000000) == 0)
  {
    goto LABEL_310;
  }
  v158 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 289)];
  if (a2) {
    v159 = @"supportsDisablingProgressBarFromBannerButtons";
  }
  else {
    v159 = @"supports_disabling_progress_bar_from_banner_buttons";
  }
  [v4 setObject:v158 forKey:v159];

  uint64_t v129 = *(void *)(a1 + 312);
  if ((v129 & 0x200000) == 0)
  {
LABEL_311:
    if ((v129 & 0x8000000) == 0) {
      goto LABEL_312;
    }
    goto LABEL_372;
  }
LABEL_368:
  v160 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 286)];
  if (a2) {
    v161 = @"supportsBannerQueuing";
  }
  else {
    v161 = @"supports_banner_queuing";
  }
  [v4 setObject:v160 forKey:v161];

  uint64_t v129 = *(void *)(a1 + 312);
  if ((v129 & 0x8000000) == 0)
  {
LABEL_312:
    if ((v129 & 0x8000000000) == 0) {
      goto LABEL_313;
    }
    goto LABEL_376;
  }
LABEL_372:
  v162 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 292)];
  if (a2) {
    v163 = @"supportsEv2";
  }
  else {
    v163 = @"supports_ev_2";
  }
  [v4 setObject:v162 forKey:v163];

  uint64_t v129 = *(void *)(a1 + 312);
  if ((v129 & 0x8000000000) == 0)
  {
LABEL_313:
    if ((v129 & 0x100000000000) == 0) {
      goto LABEL_314;
    }
    goto LABEL_380;
  }
LABEL_376:
  v164 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 304)];
  if (a2) {
    v165 = @"supportsRouteNameRanges";
  }
  else {
    v165 = @"supports_route_name_ranges";
  }
  [v4 setObject:v164 forKey:v165];

  uint64_t v129 = *(void *)(a1 + 312);
  if ((v129 & 0x100000000000) == 0)
  {
LABEL_314:
    if ((v129 & 0x10000000) == 0) {
      goto LABEL_315;
    }
    goto LABEL_384;
  }
LABEL_380:
  v166 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 309)];
  if (a2) {
    v167 = @"supportsWalkingSuggestionsAfterParking";
  }
  else {
    v167 = @"supports_walking_suggestions_after_parking";
  }
  [v4 setObject:v166 forKey:v167];

  uint64_t v129 = *(void *)(a1 + 312);
  if ((v129 & 0x10000000) == 0)
  {
LABEL_315:
    if ((v129 & 0x4000000000) == 0) {
      goto LABEL_316;
    }
LABEL_388:
    v170 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 303)];
    if (a2) {
      v171 = @"supportsRouteCameraInputUpdates";
    }
    else {
      v171 = @"supports_route_camera_input_updates";
    }
    [v4 setObject:v170 forKey:v171];

    if ((*(void *)(a1 + 312) & 0x2000000) == 0) {
      goto LABEL_321;
    }
    goto LABEL_317;
  }
LABEL_384:
  v168 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 293)];
  if (a2) {
    v169 = @"supportsGenericCombinationsInstructionsForAllModes";
  }
  else {
    v169 = @"supports_generic_combinations_instructions_for_all_modes";
  }
  [v4 setObject:v168 forKey:v169];

  uint64_t v129 = *(void *)(a1 + 312);
  if ((v129 & 0x4000000000) != 0) {
    goto LABEL_388;
  }
LABEL_316:
  if ((v129 & 0x2000000) != 0)
  {
LABEL_317:
    v130 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 290)];
    if (a2) {
      v131 = @"supportsDodgeballCameraInput";
    }
    else {
      v131 = @"supports_dodgeball_camera_input";
    }
    [v4 setObject:v130 forKey:v131];
  }
LABEL_321:
  if (*(void *)(a1 + 32))
  {
    v132 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v133 = (void *)(a1 + 24);
    if (*(void *)(a1 + 32))
    {
      unint64_t v134 = 0;
      do
      {
        uint64_t v135 = *(unsigned int *)(*v133 + 4 * v134);
        if (v135)
        {
          if (v135 == 1)
          {
            v136 = @"ELEVATION_MODEL_WGS84";
          }
          else
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v135);
            v136 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v136 = @"ELEVATION_MODEL_EGM96";
        }
        [v132 addObject:v136];

        ++v134;
        v133 = (void *)(a1 + 24);
      }
      while (v134 < *(void *)(a1 + 32));
    }
    if (a2) {
      v137 = @"supportedElevationModel";
    }
    else {
      v137 = @"supported_elevation_model";
    }
    [v4 setObject:v132 forKey:v137];
  }
  if ((*(void *)(a1 + 312) & 0x10000) != 0)
  {
    v138 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 281)];
    if (a2) {
      v139 = @"supportEmissionsTagging";
    }
    else {
      v139 = @"support_emissions_tagging";
    }
    [v4 setObject:v138 forKey:v139];
  }
  v140 = [(id)a1 artworkCapabilities];
  v141 = v140;
  if (v140)
  {
    if (a2)
    {
      v142 = [v140 jsonRepresentation];
      v143 = @"artworkCapabilities";
    }
    else
    {
      v142 = [v140 dictionaryRepresentation];
      v143 = @"artwork_capabilities";
    }
    id v146 = v142;

    [v4 setObject:v146 forKey:v143];
  }

  if ((*(void *)(a1 + 312) & 0x100000) != 0)
  {
    v147 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 285)];
    if (a2) {
      v148 = @"supportsBannerQueuingDirections";
    }
    else {
      v148 = @"supports_banner_queuing_directions";
    }
    [v4 setObject:v147 forKey:v148];
  }
  v149 = *(void **)(a1 + 16);
  if (v149)
  {
    v150 = [v149 dictionaryRepresentation];
    v151 = v150;
    if (a2)
    {
      v152 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v150, "count"));
      v172[0] = MEMORY[0x1E4F143A8];
      v172[1] = 3221225472;
      v172[2] = __51__GEOClientCapabilities__dictionaryRepresentation___block_invoke;
      v172[3] = &unk_1E53D8860;
      id v153 = v152;
      id v173 = v153;
      [v151 enumerateKeysAndObjectsUsingBlock:v172];
      id v154 = v153;

      v151 = v154;
    }
    [v4 setObject:v151 forKey:@"Unknown Fields"];
  }
  id v155 = v4;

LABEL_356:

  return v155;
}

- (id)jsonRepresentation
{
  return -[GEOClientCapabilities _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEOClientCapabilities__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOClientCapabilities)initWithDictionary:(id)a3
{
  return (GEOClientCapabilities *)-[GEOClientCapabilities _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v217 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_538;
  }
  id v6 = (id)[a1 init];

  if (!v6)
  {
    a1 = 0;
    goto LABEL_538;
  }
  id v7 = [v5 objectForKeyedSubscript:@"appMajorVersion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = (void *)[v7 copy];
    [v6 setAppMajorVersion:v8];
  }
  uint64_t v9 = [v5 objectForKeyedSubscript:@"appMinorVersion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = (void *)[v9 copy];
    [v6 setAppMinorVersion:v10];
  }
  uint64_t v11 = [v5 objectForKeyedSubscript:@"hardwareModel"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = (void *)[v11 copy];
    [v6 setHardwareModel:v12];
  }
  if (a3) {
    uint64_t v13 = @"hardwareClass";
  }
  else {
    uint64_t v13 = @"hardware_class";
  }
  uint64_t v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v15 = (void *)[v14 copy];
    [v6 setHardwareClass:v15];
  }
  uint64_t v16 = [v5 objectForKeyedSubscript:@"maxManeuverTypeSupported"];
  objc_opt_class();
  id v196 = v5;
  int v195 = a3;
  if (objc_opt_isKindOfClass())
  {
    id v17 = v16;
    if ([v17 isEqualToString:@"NO_TURN"])
    {
      uint64_t v18 = 0;
    }
    else if ([v17 isEqualToString:@"LEFT_TURN"])
    {
      uint64_t v18 = 1;
    }
    else if ([v17 isEqualToString:@"RIGHT_TURN"])
    {
      uint64_t v18 = 2;
    }
    else if ([v17 isEqualToString:@"STRAIGHT_AHEAD"])
    {
      uint64_t v18 = 3;
    }
    else if ([v17 isEqualToString:@"U_TURN"])
    {
      uint64_t v18 = 4;
    }
    else if ([v17 isEqualToString:@"FOLLOW_ROAD"])
    {
      uint64_t v18 = 5;
    }
    else if ([v17 isEqualToString:@"ENTER_ROUNDABOUT"])
    {
      uint64_t v18 = 6;
    }
    else if ([v17 isEqualToString:@"EXIT_ROUNDABOUT"])
    {
      uint64_t v18 = 7;
    }
    else if ([v17 isEqualToString:@"OFF_RAMP"])
    {
      uint64_t v18 = 11;
    }
    else if ([v17 isEqualToString:@"ON_RAMP"])
    {
      uint64_t v18 = 12;
    }
    else if ([v17 isEqualToString:@"ARRIVE_END_OF_NAVIGATION"])
    {
      uint64_t v18 = 16;
    }
    else if ([v17 isEqualToString:@"START_ROUTE"])
    {
      uint64_t v18 = 17;
    }
    else if ([v17 isEqualToString:@"ARRIVE_AT_DESTINATION"])
    {
      uint64_t v18 = 18;
    }
    else if ([v17 isEqualToString:@"KEEP_LEFT"])
    {
      uint64_t v18 = 20;
    }
    else if ([v17 isEqualToString:@"KEEP_RIGHT"])
    {
      uint64_t v18 = 21;
    }
    else if ([v17 isEqualToString:@"ENTER_FERRY"])
    {
      uint64_t v18 = 22;
    }
    else if ([v17 isEqualToString:@"EXIT_FERRY"])
    {
      uint64_t v18 = 23;
    }
    else if ([v17 isEqualToString:@"CHANGE_FERRY"])
    {
      uint64_t v18 = 24;
    }
    else if ([v17 isEqualToString:@"START_ROUTE_WITH_U_TURN"])
    {
      uint64_t v18 = 25;
    }
    else if ([v17 isEqualToString:@"U_TURN_AT_ROUNDABOUT"])
    {
      uint64_t v18 = 26;
    }
    else if ([v17 isEqualToString:@"LEFT_TURN_AT_END"])
    {
      uint64_t v18 = 27;
    }
    else if ([v17 isEqualToString:@"RIGHT_TURN_AT_END"])
    {
      uint64_t v18 = 28;
    }
    else if ([v17 isEqualToString:@"HIGHWAY_OFF_RAMP_LEFT"])
    {
      uint64_t v18 = 29;
    }
    else if ([v17 isEqualToString:@"HIGHWAY_OFF_RAMP_RIGHT"])
    {
      uint64_t v18 = 30;
    }
    else if ([v17 isEqualToString:@"ARRIVE_AT_DESTINATION_LEFT"])
    {
      uint64_t v18 = 33;
    }
    else if ([v17 isEqualToString:@"ARRIVE_AT_DESTINATION_RIGHT"])
    {
      uint64_t v18 = 34;
    }
    else if ([v17 isEqualToString:@"U_TURN_WHEN_POSSIBLE"])
    {
      uint64_t v18 = 35;
    }
    else if ([v17 isEqualToString:@"ARRIVE_END_OF_DIRECTIONS"])
    {
      uint64_t v18 = 39;
    }
    else if ([v17 isEqualToString:@"ROUNDABOUT_EXIT_1"])
    {
      uint64_t v18 = 41;
    }
    else if ([v17 isEqualToString:@"ROUNDABOUT_EXIT_2"])
    {
      uint64_t v18 = 42;
    }
    else if ([v17 isEqualToString:@"ROUNDABOUT_EXIT_3"])
    {
      uint64_t v18 = 43;
    }
    else if ([v17 isEqualToString:@"ROUNDABOUT_EXIT_4"])
    {
      uint64_t v18 = 44;
    }
    else if ([v17 isEqualToString:@"ROUNDABOUT_EXIT_5"])
    {
      uint64_t v18 = 45;
    }
    else if ([v17 isEqualToString:@"ROUNDABOUT_EXIT_6"])
    {
      uint64_t v18 = 46;
    }
    else if ([v17 isEqualToString:@"ROUNDABOUT_EXIT_7"])
    {
      uint64_t v18 = 47;
    }
    else if ([v17 isEqualToString:@"ROUNDABOUT_EXIT_8"])
    {
      uint64_t v18 = 48;
    }
    else if ([v17 isEqualToString:@"ROUNDABOUT_EXIT_9"])
    {
      uint64_t v18 = 49;
    }
    else if ([v17 isEqualToString:@"ROUNDABOUT_EXIT_10"])
    {
      uint64_t v18 = 50;
    }
    else if ([v17 isEqualToString:@"ROUNDABOUT_EXIT_11"])
    {
      uint64_t v18 = 51;
    }
    else if ([v17 isEqualToString:@"ROUNDABOUT_EXIT_12"])
    {
      uint64_t v18 = 52;
    }
    else if ([v17 isEqualToString:@"ROUNDABOUT_EXIT_13"])
    {
      uint64_t v18 = 53;
    }
    else if ([v17 isEqualToString:@"ROUNDABOUT_EXIT_14"])
    {
      uint64_t v18 = 54;
    }
    else if ([v17 isEqualToString:@"ROUNDABOUT_EXIT_15"])
    {
      uint64_t v18 = 55;
    }
    else if ([v17 isEqualToString:@"ROUNDABOUT_EXIT_16"])
    {
      uint64_t v18 = 56;
    }
    else if ([v17 isEqualToString:@"ROUNDABOUT_EXIT_17"])
    {
      uint64_t v18 = 57;
    }
    else if ([v17 isEqualToString:@"ROUNDABOUT_EXIT_18"])
    {
      uint64_t v18 = 58;
    }
    else if ([v17 isEqualToString:@"ROUNDABOUT_EXIT_19"])
    {
      uint64_t v18 = 59;
    }
    else if ([v17 isEqualToString:@"SHARP_LEFT_TURN"])
    {
      uint64_t v18 = 60;
    }
    else if ([v17 isEqualToString:@"SHARP_RIGHT_TURN"])
    {
      uint64_t v18 = 61;
    }
    else if ([v17 isEqualToString:@"SLIGHT_LEFT_TURN"])
    {
      uint64_t v18 = 62;
    }
    else if ([v17 isEqualToString:@"SLIGHT_RIGHT_TURN"])
    {
      uint64_t v18 = 63;
    }
    else if ([v17 isEqualToString:@"CHANGE_HIGHWAY"])
    {
      uint64_t v18 = 64;
    }
    else if ([v17 isEqualToString:@"CHANGE_HIGHWAY_LEFT"])
    {
      uint64_t v18 = 65;
    }
    else if ([v17 isEqualToString:@"CHANGE_HIGHWAY_RIGHT"])
    {
      uint64_t v18 = 66;
    }
    else if ([v17 isEqualToString:@"TOLL_STATION"])
    {
      uint64_t v18 = 80;
    }
    else if ([v17 isEqualToString:@"ENTER_TUNNEL"])
    {
      uint64_t v18 = 81;
    }
    else if ([v17 isEqualToString:@"WAYPOINT_STOP"])
    {
      uint64_t v18 = 82;
    }
    else if ([v17 isEqualToString:@"WAYPOINT_STOP_LEFT"])
    {
      uint64_t v18 = 83;
    }
    else if ([v17 isEqualToString:@"WAYPOINT_STOP_RIGHT"])
    {
      uint64_t v18 = 84;
    }
    else if ([v17 isEqualToString:@"RESUME_ROUTE"])
    {
      uint64_t v18 = 85;
    }
    else if ([v17 isEqualToString:@"RESUME_ROUTE_WITH_U_TURN"])
    {
      uint64_t v18 = 86;
    }
    else if ([v17 isEqualToString:@"CUSTOM"])
    {
      uint64_t v18 = 87;
    }
    else if ([v17 isEqualToString:@"TURN_AROUND"])
    {
      uint64_t v18 = 88;
    }
    else
    {
      uint64_t v18 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_147;
    }
    uint64_t v18 = [v16 intValue];
  }
  [v6 setMaxManeuverTypeSupported:v18];
LABEL_147:

  uint64_t v19 = [v5 objectForKeyedSubscript:@"internalInstall"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setInternalInstall:", objc_msgSend(v19, "BOOLValue"));
  }

  uint64_t v20 = [v5 objectForKeyedSubscript:@"internalTool"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setInternalTool:", objc_msgSend(v20, "BOOLValue"));
  }

  uint64_t v21 = [v5 objectForKeyedSubscript:@"displayLanguages"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v211 = 0u;
    long long v212 = 0u;
    long long v209 = 0u;
    long long v210 = 0u;
    id v22 = v21;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v209 objects:v216 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v210;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v210 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void **)(*((void *)&v209 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v28 = (void *)[v27 copy];
            [v6 addDisplayLanguages:v28];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v209 objects:v216 count:16];
      }
      while (v24);
    }
  }
  uint64_t v29 = [v5 objectForKeyedSubscript:@"displayRegion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v30 = (void *)[v29 copy];
    [v6 setDisplayRegion:v30];
  }
  uint64_t v31 = [v5 objectForKeyedSubscript:@"maxTrafficSpeedSupported"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setMaxTrafficSpeedSupported:", objc_msgSend(v31, "unsignedIntValue"));
  }

  id v32 = [v5 objectForKeyedSubscript:@"maxRouteIncidentSupported"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setMaxRouteIncidentSupported:", objc_msgSend(v32, "intValue"));
  }

  id v33 = [v5 objectForKeyedSubscript:@"maxFormatterSupported"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setMaxFormatterSupported:", objc_msgSend(v33, "intValue"));
  }

  uint64_t v34 = [v5 objectForKeyedSubscript:@"deviceCountryCode"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v35 = (void *)[v34 copy];
    [v6 setDeviceCountryCode:v35];
  }
  uint64_t v36 = [v5 objectForKeyedSubscript:@"clusteredTransitRoutesSupported"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setClusteredTransitRoutesSupported:", objc_msgSend(v36, "BOOLValue"));
  }

  uint64_t v37 = [v5 objectForKeyedSubscript:@"routeOptionsSupported"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setRouteOptionsSupported:", objc_msgSend(v37, "BOOLValue"));
  }

  v38 = [v5 objectForKeyedSubscript:@"transitMarketSupport"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v39 = v38;
    if ([v39 isEqualToString:@"VERSION_1"])
    {
      uint64_t v40 = 1;
    }
    else if ([v39 isEqualToString:@"VERSION_2"])
    {
      uint64_t v40 = 2;
    }
    else if ([v39 isEqualToString:@"VERSION_3"])
    {
      uint64_t v40 = 3;
    }
    else
    {
      uint64_t v40 = 1;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_188;
    }
    uint64_t v40 = [v38 intValue];
  }
  [v6 setTransitMarketSupport:v40];
LABEL_188:

  id v41 = [v5 objectForKeyedSubscript:@"formattedStringClientCapabilities"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v42 = [GEOFormattedStringClientCapabilities alloc];
    if (a3) {
      uint64_t v43 = [(GEOFormattedStringClientCapabilities *)v42 initWithJSON:v41];
    }
    else {
      uint64_t v43 = [(GEOFormattedStringClientCapabilities *)v42 initWithDictionary:v41];
    }
    v44 = (void *)v43;
    [v6 setFormattedStringClientCapabilities:v43];
  }
  if (a3) {
    v45 = @"advisoryClientCapabilities";
  }
  else {
    v45 = @"advisory_client_capabilities";
  }
  uint64_t v46 = [v5 objectForKeyedSubscript:v45];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v47 = [GEOAdvisoryClientCapabilities alloc];
    if (a3) {
      uint64_t v48 = [(GEOAdvisoryClientCapabilities *)v47 initWithJSON:v46];
    }
    else {
      uint64_t v48 = [(GEOAdvisoryClientCapabilities *)v47 initWithDictionary:v46];
    }
    uint64_t v49 = (void *)v48;
    [v6 setAdvisoryClientCapabilities:v48];
  }
  v50 = [v5 objectForKeyedSubscript:@"snapToClosestStopSupported"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSnapToClosestStopSupported:", objc_msgSend(v50, "BOOLValue"));
  }

  if (a3) {
    id v51 = @"includeCrossLanguagePhonetics";
  }
  else {
    id v51 = @"include_cross_language_phonetics";
  }
  v52 = [v5 objectForKeyedSubscript:v51];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIncludeCrossLanguagePhonetics:", objc_msgSend(v52, "BOOLValue"));
  }

  if (a3) {
    v53 = @"userCurrentTimezone";
  }
  else {
    v53 = @"user_current_timezone";
  }
  uint64_t v54 = [v5 objectForKeyedSubscript:v53];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v55 = (void *)[v54 copy];
    [v6 setUserCurrentTimezone:v55];
  }
  if (a3) {
    id v56 = @"supportsLongShieldStrings";
  }
  else {
    id v56 = @"supports_long_shield_strings";
  }
  v57 = [v5 objectForKeyedSubscript:v56];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsLongShieldStrings:", objc_msgSend(v57, "BOOLValue"));
  }

  if (a3) {
    uint64_t v58 = @"supportsGuidanceEvents";
  }
  else {
    uint64_t v58 = @"supports_guidance_events";
  }
  id v59 = [v5 objectForKeyedSubscript:v58];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsGuidanceEvents:", objc_msgSend(v59, "BOOLValue"));
  }

  if (a3) {
    v60 = @"supportsGuidanceEventsInlineShields";
  }
  else {
    v60 = @"supports_guidance_events_inline_shields";
  }
  unint64_t v61 = [v5 objectForKeyedSubscript:v60];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsGuidanceEventsInlineShields:", objc_msgSend(v61, "BOOLValue"));
  }

  if (a3) {
    uint64_t v62 = @"abAssignInfo";
  }
  else {
    uint64_t v62 = @"ab_assign_info";
  }
  long long v63 = [v5 objectForKeyedSubscript:v62];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v64 = [GEOAbAssignInfo alloc];
    if (a3) {
      uint64_t v65 = [(GEOAbAssignInfo *)v64 initWithJSON:v63];
    }
    else {
      uint64_t v65 = [(GEOAbAssignInfo *)v64 initWithDictionary:v63];
    }
    long long v66 = (void *)v65;
    [v6 setAbAssignInfo:v65];
  }
  if (a3) {
    v67 = @"requestTime";
  }
  else {
    v67 = @"request_time";
  }
  uint64_t v68 = [v5 objectForKeyedSubscript:v67];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v69 = [GEOLocalTime alloc];
    if (a3) {
      uint64_t v70 = [(GEOLocalTime *)v69 initWithJSON:v68];
    }
    else {
      uint64_t v70 = [(GEOLocalTime *)v69 initWithDictionary:v68];
    }
    v71 = (void *)v70;
    [v6 setRequestTime:v70];
  }
  if (a3) {
    v72 = @"maxZilchMessageVersionSupported";
  }
  else {
    v72 = @"max_zilch_message_version_supported";
  }
  v73 = [v5 objectForKeyedSubscript:v72];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setMaxZilchMessageVersionSupported:", objc_msgSend(v73, "unsignedIntValue"));
  }

  if (a3) {
    v74 = @"supportedTransitFeature";
  }
  else {
    v74 = @"supported_transit_feature";
  }
  v75 = [v5 objectForKeyedSubscript:v74];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v207 = 0u;
    long long v208 = 0u;
    long long v205 = 0u;
    long long v206 = 0u;
    v192 = v75;
    id v76 = v75;
    uint64_t v77 = [v76 countByEnumeratingWithState:&v205 objects:v215 count:16];
    if (!v77) {
      goto LABEL_280;
    }
    uint64_t v78 = v77;
    uint64_t v79 = *(void *)v206;
    while (1)
    {
      for (uint64_t j = 0; j != v78; ++j)
      {
        if (*(void *)v206 != v79) {
          objc_enumerationMutation(v76);
        }
        v81 = *(void **)(*((void *)&v205 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v82 = v81;
          if ([v82 isEqualToString:@"UNKNOWN"])
          {
            uint64_t v83 = 0;
          }
          else if ([v82 isEqualToString:@"TEXT_IN_PLANNING_ARTWORK"])
          {
            uint64_t v83 = 1;
          }
          else if ([v82 isEqualToString:@"GOTO_STOP_IN_TRANSFERS"])
          {
            uint64_t v83 = 2;
          }
          else if ([v82 isEqualToString:@"LIST_INSTRUCTION_TIME_TEXT"])
          {
            uint64_t v83 = 3;
          }
          else if ([v82 isEqualToString:@"ENHANCED_GUIDANCE_2021"])
          {
            uint64_t v83 = 4;
          }
          else if ([v82 isEqualToString:@"PAYMENT_METHOD_SUGGESTIONS"])
          {
            uint64_t v83 = 5;
          }
          else if ([v82 isEqualToString:@"TICKETING_URLS"])
          {
            uint64_t v83 = 6;
          }
          else
          {
            uint64_t v83 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v83 = [v81 intValue];
        }
        [v6 addSupportedTransitFeature:v83];
      }
      uint64_t v78 = [v76 countByEnumeratingWithState:&v205 objects:v215 count:16];
      if (!v78)
      {
LABEL_280:

        id v5 = v196;
        a3 = v195;
        v75 = v192;
        break;
      }
    }
  }

  if (a3) {
    v84 = @"supportsArrivalMapRegion";
  }
  else {
    v84 = @"supports_arrival_map_region";
  }
  v85 = [v5 objectForKeyedSubscript:v84];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsArrivalMapRegion:", objc_msgSend(v85, "BOOLValue"));
  }

  if (a3) {
    id v86 = @"supportsNaturalGuidance";
  }
  else {
    id v86 = @"supports_natural_guidance";
  }
  v87 = [v5 objectForKeyedSubscript:v86];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsNaturalGuidance:", objc_msgSend(v87, "BOOLValue"));
  }

  if (a3) {
    v88 = @"supportsJunctionView";
  }
  else {
    v88 = @"supports_junction_view";
  }
  v89 = [v5 objectForKeyedSubscript:v88];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsJunctionView:", objc_msgSend(v89, "BOOLValue"));
  }

  if (a3) {
    v90 = @"supportsCongestionZones";
  }
  else {
    v90 = @"supports_congestion_zones";
  }
  uint64_t v91 = [v5 objectForKeyedSubscript:v90];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsCongestionZones:", objc_msgSend(v91, "BOOLValue"));
  }

  if (a3) {
    v92 = @"supportsLicensePlateRestrictions";
  }
  else {
    v92 = @"supports_license_plate_restrictions";
  }
  v93 = [v5 objectForKeyedSubscript:v92];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsLicensePlateRestrictions:", objc_msgSend(v93, "BOOLValue"));
  }

  if (a3) {
    v94 = @"supportsElectricVehicleRoutes";
  }
  else {
    v94 = @"supports_electric_vehicle_routes";
  }
  v95 = [v5 objectForKeyedSubscript:v94];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsElectricVehicleRoutes:", objc_msgSend(v95, "BOOLValue"));
  }

  if (a3) {
    unint64_t v96 = @"supportsTrafficCameras";
  }
  else {
    unint64_t v96 = @"supports_traffic_cameras";
  }
  uint64_t v97 = [v5 objectForKeyedSubscript:v96];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsTrafficCameras:", objc_msgSend(v97, "BOOLValue"));
  }

  if (a3) {
    v98 = @"supportsWaypointRoutes";
  }
  else {
    v98 = @"supports_waypoint_routes";
  }
  v99 = [v5 objectForKeyedSubscript:v98];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsWaypointRoutes:", objc_msgSend(v99, "BOOLValue"));
  }

  if (a3) {
    v100 = @"localizationCapabilities";
  }
  else {
    v100 = @"localization_capabilities";
  }
  v101 = [v5 objectForKeyedSubscript:v100];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v102 = [GEOLocalizationCapabilities alloc];
    if (a3) {
      uint64_t v103 = [(GEOLocalizationCapabilities *)v102 initWithJSON:v101];
    }
    else {
      uint64_t v103 = [(GEOLocalizationCapabilities *)v102 initWithDictionary:v101];
    }
    v104 = (void *)v103;
    [v6 setLocalizationCapabilities:v103];
  }
  if (a3) {
    v105 = @"deviceSku";
  }
  else {
    v105 = @"device_sku";
  }
  v106 = [v5 objectForKeyedSubscript:v105];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v107 = (void *)[v106 copy];
    [v6 setDeviceSku:v107];
  }
  if (a3) {
    v108 = @"osVersion";
  }
  else {
    v108 = @"os_version";
  }
  v109 = [v5 objectForKeyedSubscript:v108];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v110 = (void *)[v109 copy];
    [v6 setOsVersion:v110];
  }
  if (a3) {
    v111 = @"willSendEvDirectionsFeedback";
  }
  else {
    v111 = @"will_send_ev_directions_feedback";
  }
  v112 = [v5 objectForKeyedSubscript:v111];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setWillSendEvDirectionsFeedback:", objc_msgSend(v112, "BOOLValue"));
  }

  if (a3) {
    v113 = @"supportsRoadComplexities";
  }
  else {
    v113 = @"supports_road_complexities";
  }
  v114 = [v5 objectForKeyedSubscript:v113];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsRoadComplexities:", objc_msgSend(v114, "BOOLValue"));
  }

  if (a3) {
    v115 = @"supportsSpeedTrapAnnouncements";
  }
  else {
    v115 = @"supports_speed_trap_announcements";
  }
  v116 = [v5 objectForKeyedSubscript:v115];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsSpeedTrapAnnouncements:", objc_msgSend(v116, "BOOLValue"));
  }

  if (a3) {
    v117 = @"supportsUserIncidentReports";
  }
  else {
    v117 = @"supports_user_incident_reports";
  }
  v118 = [v5 objectForKeyedSubscript:v117];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsUserIncidentReports:", objc_msgSend(v118, "BOOLValue"));
  }

  if (a3) {
    v119 = @"supportsAreaEventsEnhancements";
  }
  else {
    v119 = @"supports_area_events_enhancements";
  }
  v120 = [v5 objectForKeyedSubscript:v119];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsAreaEventsEnhancements:", objc_msgSend(v120, "BOOLValue"));
  }

  if (a3) {
    v121 = @"supportsAdvancedMap";
  }
  else {
    v121 = @"supports_advanced_map";
  }
  v122 = [v5 objectForKeyedSubscript:v121];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsAdvancedMap:", objc_msgSend(v122, "BOOLValue"));
  }

  if (a3) {
    v123 = @"supportsSilentRouteUpdates";
  }
  else {
    v123 = @"supports_silent_route_updates";
  }
  v124 = [v5 objectForKeyedSubscript:v123];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsSilentRouteUpdates:", objc_msgSend(v124, "BOOLValue"));
  }

  if (a3) {
    v125 = @"replaceAccidentStringWithCrash";
  }
  else {
    v125 = @"replace_accident_string_with_crash";
  }
  v126 = [v5 objectForKeyedSubscript:v125];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setReplaceAccidentStringWithCrash:", objc_msgSend(v126, "BOOLValue"));
  }

  if (a3) {
    v127 = @"supportsGuidanceEventPrivacyFilters";
  }
  else {
    v127 = @"supports_guidance_event_privacy_filters";
  }
  id v128 = [v5 objectForKeyedSubscript:v127];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsGuidanceEventPrivacyFilters:", objc_msgSend(v128, "BOOLValue"));
  }

  if (a3) {
    uint64_t v129 = @"supportsGuidanceEventImportanceInfo";
  }
  else {
    uint64_t v129 = @"supports_guidance_event_importance_info";
  }
  v130 = [v5 objectForKeyedSubscript:v129];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsGuidanceEventImportanceInfo:", objc_msgSend(v130, "BOOLValue"));
  }

  if (a3) {
    v131 = @"isAdvancedMap";
  }
  else {
    v131 = @"is_advanced_map";
  }
  v132 = [v5 objectForKeyedSubscript:v131];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIsAdvancedMap:", objc_msgSend(v132, "BOOLValue"));
  }

  if (a3) {
    v133 = @"isGlobeProjection";
  }
  else {
    v133 = @"is_globe_projection";
  }
  unint64_t v134 = [v5 objectForKeyedSubscript:v133];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIsGlobeProjection:", objc_msgSend(v134, "BOOLValue"));
  }

  if (a3) {
    uint64_t v135 = @"supportsMultipointRouting";
  }
  else {
    uint64_t v135 = @"supports_multipoint_routing";
  }
  v136 = [v5 objectForKeyedSubscript:v135];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v203 = 0u;
    long long v204 = 0u;
    long long v201 = 0u;
    long long v202 = 0u;
    v193 = v136;
    id v137 = v136;
    uint64_t v138 = [v137 countByEnumeratingWithState:&v201 objects:v214 count:16];
    if (!v138) {
      goto LABEL_430;
    }
    uint64_t v139 = v138;
    uint64_t v140 = *(void *)v202;
    while (1)
    {
      for (uint64_t k = 0; k != v139; ++k)
      {
        if (*(void *)v202 != v140) {
          objc_enumerationMutation(v137);
        }
        v142 = *(void **)(*((void *)&v201 + 1) + 8 * k);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v143 = v142;
          if ([v143 isEqualToString:@"AUTOMOBILE"])
          {
            uint64_t v144 = 0;
          }
          else if ([v143 isEqualToString:@"TRANSIT"])
          {
            uint64_t v144 = 1;
          }
          else if ([v143 isEqualToString:@"WALKING"])
          {
            uint64_t v144 = 2;
          }
          else if ([v143 isEqualToString:@"BICYCLE"])
          {
            uint64_t v144 = 3;
          }
          else if ([v143 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
          {
            uint64_t v144 = 4;
          }
          else if ([v143 isEqualToString:@"FERRY"])
          {
            uint64_t v144 = 5;
          }
          else if ([v143 isEqualToString:@"RIDESHARE"])
          {
            uint64_t v144 = 6;
          }
          else
          {
            uint64_t v144 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v144 = [v142 intValue];
        }
        [v6 addSupportsMultipointRouting:v144];
      }
      uint64_t v139 = [v137 countByEnumeratingWithState:&v201 objects:v214 count:16];
      if (!v139)
      {
LABEL_430:

        id v5 = v196;
        a3 = v195;
        v136 = v193;
        break;
      }
    }
  }

  if (a3) {
    v145 = @"supportsDefaultToNewRouteFlag";
  }
  else {
    v145 = @"supports_default_to_new_route_flag";
  }
  id v146 = [v5 objectForKeyedSubscript:v145];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsDefaultToNewRouteFlag:", objc_msgSend(v146, "BOOLValue"));
  }

  if (a3) {
    v147 = @"walkingSupportedFeatures";
  }
  else {
    v147 = @"walking_supported_features";
  }
  v148 = [v5 objectForKeyedSubscript:v147];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v149 = [GEOWalkingSupportedFeatures alloc];
    if (a3) {
      uint64_t v150 = [(GEOWalkingSupportedFeatures *)v149 initWithJSON:v148];
    }
    else {
      uint64_t v150 = [(GEOWalkingSupportedFeatures *)v149 initWithDictionary:v148];
    }
    v151 = (void *)v150;
    [v6 setWalkingSupportedFeatures:v150];
  }
  if (a3) {
    v152 = @"maxSupportedTransitFareVersion";
  }
  else {
    v152 = @"max_supported_transit_fare_version";
  }
  id v153 = [v5 objectForKeyedSubscript:v152];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v154 = v153;
    if ([v154 isEqualToString:@"TRANSIT_FARE_SUPPORT_UNKNOWN"])
    {
      uint64_t v155 = 0;
    }
    else if ([v154 isEqualToString:@"TRANSIT_FARE_SUPPORT_VERSION_1"])
    {
      uint64_t v155 = 1;
    }
    else if ([v154 isEqualToString:@"TRANSIT_FARE_SUPPORT_VERSION_2"])
    {
      uint64_t v155 = 2;
    }
    else
    {
      uint64_t v155 = 0;
    }

    goto LABEL_458;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v155 = [v153 intValue];
LABEL_458:
    [v6 setMaxSupportedTransitFareVersion:v155];
  }

  if (a3) {
    v156 = @"supportsDisablingProgressBarFromBannerButtons";
  }
  else {
    v156 = @"supports_disabling_progress_bar_from_banner_buttons";
  }
  v157 = [v5 objectForKeyedSubscript:v156];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsDisablingProgressBarFromBannerButtons:", objc_msgSend(v157, "BOOLValue"));
  }

  if (a3) {
    v158 = @"supportsBannerQueuing";
  }
  else {
    v158 = @"supports_banner_queuing";
  }
  v159 = [v5 objectForKeyedSubscript:v158];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsBannerQueuing:", objc_msgSend(v159, "BOOLValue"));
  }

  if (a3) {
    v160 = @"supportsEv2";
  }
  else {
    v160 = @"supports_ev_2";
  }
  v161 = [v5 objectForKeyedSubscript:v160];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsEv2:", objc_msgSend(v161, "BOOLValue"));
  }

  if (a3) {
    v162 = @"supportsRouteNameRanges";
  }
  else {
    v162 = @"supports_route_name_ranges";
  }
  v163 = [v5 objectForKeyedSubscript:v162];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsRouteNameRanges:", objc_msgSend(v163, "BOOLValue"));
  }

  if (a3) {
    v164 = @"supportsWalkingSuggestionsAfterParking";
  }
  else {
    v164 = @"supports_walking_suggestions_after_parking";
  }
  v165 = [v5 objectForKeyedSubscript:v164];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsWalkingSuggestionsAfterParking:", objc_msgSend(v165, "BOOLValue"));
  }

  if (a3) {
    v166 = @"supportsGenericCombinationsInstructionsForAllModes";
  }
  else {
    v166 = @"supports_generic_combinations_instructions_for_all_modes";
  }
  v167 = [v5 objectForKeyedSubscript:v166];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsGenericCombinationsInstructionsForAllModes:", objc_msgSend(v167, "BOOLValue"));
  }

  if (a3) {
    v168 = @"supportsRouteCameraInputUpdates";
  }
  else {
    v168 = @"supports_route_camera_input_updates";
  }
  v169 = [v5 objectForKeyedSubscript:v168];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsRouteCameraInputUpdates:", objc_msgSend(v169, "BOOLValue"));
  }

  if (a3) {
    v170 = @"supportsDodgeballCameraInput";
  }
  else {
    v170 = @"supports_dodgeball_camera_input";
  }
  v171 = [v5 objectForKeyedSubscript:v170];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsDodgeballCameraInput:", objc_msgSend(v171, "BOOLValue"));
  }

  if (a3) {
    v172 = @"supportedElevationModel";
  }
  else {
    v172 = @"supported_elevation_model";
  }
  id v173 = [v5 objectForKeyedSubscript:v172];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v199 = 0u;
    long long v200 = 0u;
    long long v197 = 0u;
    long long v198 = 0u;
    v194 = v173;
    id v174 = v173;
    uint64_t v175 = [v174 countByEnumeratingWithState:&v197 objects:v213 count:16];
    if (!v175) {
      goto LABEL_518;
    }
    uint64_t v176 = v175;
    uint64_t v177 = *(void *)v198;
    while (1)
    {
      for (uint64_t m = 0; m != v176; ++m)
      {
        if (*(void *)v198 != v177) {
          objc_enumerationMutation(v174);
        }
        v179 = *(void **)(*((void *)&v197 + 1) + 8 * m);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v180 = v179;
          if ([v180 isEqualToString:@"ELEVATION_MODEL_EGM96"]) {
            uint64_t v181 = 0;
          }
          else {
            uint64_t v181 = [v180 isEqualToString:@"ELEVATION_MODEL_WGS84"];
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v181 = [v179 intValue];
        }
        [v6 addSupportedElevationModel:v181];
      }
      uint64_t v176 = [v174 countByEnumeratingWithState:&v197 objects:v213 count:16];
      if (!v176)
      {
LABEL_518:

        id v5 = v196;
        a3 = v195;
        id v173 = v194;
        break;
      }
    }
  }

  if (a3) {
    v182 = @"supportEmissionsTagging";
  }
  else {
    v182 = @"support_emissions_tagging";
  }
  v183 = [v5 objectForKeyedSubscript:v182];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportEmissionsTagging:", objc_msgSend(v183, "BOOLValue"));
  }

  if (a3) {
    v184 = @"artworkCapabilities";
  }
  else {
    v184 = @"artwork_capabilities";
  }
  v185 = [v5 objectForKeyedSubscript:v184];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v186 = [GEOArtworkCapabilities alloc];
    if (a3) {
      uint64_t v187 = [(GEOArtworkCapabilities *)v186 initWithJSON:v185];
    }
    else {
      uint64_t v187 = [(GEOArtworkCapabilities *)v186 initWithDictionary:v185];
    }
    v188 = (void *)v187;
    [v6 setArtworkCapabilities:v187];
  }
  if (a3) {
    v189 = @"supportsBannerQueuingDirections";
  }
  else {
    v189 = @"supports_banner_queuing_directions";
  }
  v190 = [v5 objectForKeyedSubscript:v189];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportsBannerQueuingDirections:", objc_msgSend(v190, "BOOLValue"));
  }

  a1 = v6;
LABEL_538:

  return a1;
}

- (GEOClientCapabilities)initWithJSON:(id)a3
{
  return (GEOClientCapabilities *)-[GEOClientCapabilities _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOClientCapabilitiesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOClientCapabilitiesReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  uint64_t v37 = (id *)a3;
  [(GEOClientCapabilities *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v37 + 1, self->_reader);
  *((_DWORD *)v37 + 58) = self->_readerMarkPos;
  *((_DWORD *)v37 + 59) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_appMajorVersion) {
    objc_msgSend(v37, "setAppMajorVersion:");
  }
  if (self->_appMinorVersion) {
    objc_msgSend(v37, "setAppMinorVersion:");
  }
  uint64_t v4 = v37;
  if (self->_hardwareModel)
  {
    objc_msgSend(v37, "setHardwareModel:");
    uint64_t v4 = v37;
  }
  if (self->_hardwareClass)
  {
    objc_msgSend(v37, "setHardwareClass:");
    uint64_t v4 = v37;
  }
  p_uint64_t flags = &self->_flags;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 0x200) == 0) {
      goto LABEL_11;
    }
LABEL_113:
    *((unsigned char *)v4 + 274) = self->_internalInstall;
    v4[39] = (id)((unint64_t)v4[39] | 0x200);
    if ((*(void *)&self->_flags & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  *((_DWORD *)v4 + 62) = self->_maxManeuverTypeSupported;
  v4[39] = (id)((unint64_t)v4[39] | 2);
  uint64_t flags = *(void *)p_flags;
  if ((*(void *)p_flags & 0x200) != 0) {
    goto LABEL_113;
  }
LABEL_11:
  if ((flags & 0x400) != 0)
  {
LABEL_12:
    *((unsigned char *)v4 + 275) = self->_internalTool;
    v4[39] = (id)((unint64_t)v4[39] | 0x400);
  }
LABEL_13:
  if ([(GEOClientCapabilities *)self displayLanguagesCount])
  {
    [v37 clearDisplayLanguages];
    unint64_t v7 = [(GEOClientCapabilities *)self displayLanguagesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        id v10 = [(GEOClientCapabilities *)self displayLanguagesAtIndex:i];
        [v37 addDisplayLanguages:v10];
      }
    }
  }
  if (self->_displayRegion) {
    objc_msgSend(v37, "setDisplayRegion:");
  }
  uint64_t v11 = &self->_flags;
  uint64_t v12 = (uint64_t)self->_flags;
  uint64_t v13 = v37;
  if ((v12 & 8) != 0)
  {
    *((_DWORD *)v37 + 64) = self->_maxTrafficSpeedSupported;
    v37[39] = (id)((unint64_t)v37[39] | 8);
    uint64_t v12 = *(void *)v11;
    if ((*(void *)v11 & 4) == 0)
    {
LABEL_21:
      if ((v12 & 1) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((v12 & 4) == 0)
  {
    goto LABEL_21;
  }
  *((_DWORD *)v37 + 63) = self->_maxRouteIncidentSupported;
  v37[39] = (id)((unint64_t)v37[39] | 4);
  if (*(void *)&self->_flags)
  {
LABEL_22:
    *((_DWORD *)v37 + 61) = self->_maxFormatterSupported;
    v37[39] = (id)((unint64_t)v37[39] | 1);
  }
LABEL_23:
  if (self->_deviceCountryCode)
  {
    objc_msgSend(v37, "setDeviceCountryCode:");
    uint64_t v13 = v37;
  }
  uint64_t v14 = &self->_flags;
  uint64_t v15 = (uint64_t)self->_flags;
  if ((v15 & 0x80) != 0)
  {
    *((unsigned char *)v13 + 272) = self->_clusteredTransitRoutesSupported;
    v13[39] = (id)((unint64_t)v13[39] | 0x80);
    uint64_t v15 = *(void *)v14;
    if ((*(void *)v14 & 0x4000) == 0)
    {
LABEL_27:
      if ((v15 & 0x40) == 0) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
  }
  else if ((v15 & 0x4000) == 0)
  {
    goto LABEL_27;
  }
  *((unsigned char *)v13 + 279) = self->_routeOptionsSupported;
  v13[39] = (id)((unint64_t)v13[39] | 0x4000);
  if ((*(void *)&self->_flags & 0x40) != 0)
  {
LABEL_28:
    *((_DWORD *)v13 + 67) = self->_transitMarketSupport;
    v13[39] = (id)((unint64_t)v13[39] | 0x40);
  }
LABEL_29:
  if (self->_formattedStringClientCapabilities)
  {
    objc_msgSend(v37, "setFormattedStringClientCapabilities:");
    uint64_t v13 = v37;
  }
  if (self->_advisoryClientCapabilities)
  {
    objc_msgSend(v37, "setAdvisoryClientCapabilities:");
    uint64_t v13 = v37;
  }
  uint64_t v16 = (uint64_t)self->_flags;
  if ((v16 & 0x8000) != 0)
  {
    *((unsigned char *)v13 + 280) = self->_snapToClosestStopSupported;
    v13[39] = (id)((unint64_t)v13[39] | 0x8000);
    uint64_t v16 = (uint64_t)self->_flags;
  }
  if ((v16 & 0x100) != 0)
  {
    *((unsigned char *)v13 + 273) = self->_includeCrossLanguagePhonetics;
    v13[39] = (id)((unint64_t)v13[39] | 0x100);
  }
  if (self->_userCurrentTimezone)
  {
    objc_msgSend(v37, "setUserCurrentTimezone:");
    uint64_t v13 = v37;
  }
  id v17 = &self->_flags;
  uint64_t v18 = (uint64_t)self->_flags;
  if ((v18 & 0x800000000) != 0)
  {
    *((unsigned char *)v13 + 300) = self->_supportsLongShieldStrings;
    v13[39] = (id)((unint64_t)v13[39] | 0x800000000);
    uint64_t v18 = *(void *)v17;
    if ((*(void *)v17 & 0x100000000) == 0)
    {
LABEL_41:
      if ((v18 & 0x80000000) == 0) {
        goto LABEL_43;
      }
      goto LABEL_42;
    }
  }
  else if ((v18 & 0x100000000) == 0)
  {
    goto LABEL_41;
  }
  *((unsigned char *)v13 + 297) = self->_supportsGuidanceEvents;
  v13[39] = (id)((unint64_t)v13[39] | 0x100000000);
  if ((*(void *)&self->_flags & 0x80000000) != 0)
  {
LABEL_42:
    *((unsigned char *)v13 + 296) = self->_supportsGuidanceEventsInlineShields;
    v13[39] = (id)((unint64_t)v13[39] | 0x80000000);
  }
LABEL_43:
  if (self->_abAssignInfo)
  {
    objc_msgSend(v37, "setAbAssignInfo:");
    uint64_t v13 = v37;
  }
  if (self->_requestTime)
  {
    objc_msgSend(v37, "setRequestTime:");
    uint64_t v13 = v37;
  }
  if ((*(void *)&self->_flags & 0x20) != 0)
  {
    *((_DWORD *)v13 + 66) = self->_maxZilchMessageVersionSupported;
    v13[39] = (id)((unint64_t)v13[39] | 0x20);
  }
  if ([(GEOClientCapabilities *)self supportedTransitFeaturesCount])
  {
    [v37 clearSupportedTransitFeatures];
    unint64_t v19 = [(GEOClientCapabilities *)self supportedTransitFeaturesCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (uint64_t j = 0; j != v20; ++j)
        objc_msgSend(v37, "addSupportedTransitFeature:", -[GEOClientCapabilities supportedTransitFeatureAtIndex:](self, "supportedTransitFeatureAtIndex:", j));
    }
  }
  id v22 = &self->_flags;
  uint64_t v23 = (uint64_t)self->_flags;
  uint64_t v24 = v37;
  if ((v23 & 0x80000) != 0)
  {
    *((unsigned char *)v37 + 284) = self->_supportsArrivalMapRegion;
    v37[39] = (id)((unint64_t)v37[39] | 0x80000);
    uint64_t v23 = *(void *)v22;
    if ((*(void *)v22 & 0x1000000000) == 0)
    {
LABEL_55:
      if ((v23 & 0x200000000) == 0) {
        goto LABEL_56;
      }
      goto LABEL_126;
    }
  }
  else if ((v23 & 0x1000000000) == 0)
  {
    goto LABEL_55;
  }
  *((unsigned char *)v37 + 301) = self->_supportsNaturalGuidance;
  v37[39] = (id)((unint64_t)v37[39] | 0x1000000000);
  uint64_t v23 = (uint64_t)self->_flags;
  if ((v23 & 0x200000000) == 0)
  {
LABEL_56:
    if ((v23 & 0x400000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_127;
  }
LABEL_126:
  *((unsigned char *)v37 + 298) = self->_supportsJunctionView;
  v37[39] = (id)((unint64_t)v37[39] | 0x200000000);
  uint64_t v23 = (uint64_t)self->_flags;
  if ((v23 & 0x400000) == 0)
  {
LABEL_57:
    if ((v23 & 0x400000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_128;
  }
LABEL_127:
  *((unsigned char *)v37 + 287) = self->_supportsCongestionZones;
  v37[39] = (id)((unint64_t)v37[39] | 0x400000);
  uint64_t v23 = (uint64_t)self->_flags;
  if ((v23 & 0x400000000) == 0)
  {
LABEL_58:
    if ((v23 & 0x4000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_129;
  }
LABEL_128:
  *((unsigned char *)v37 + 299) = self->_supportsLicensePlateRestrictions;
  v37[39] = (id)((unint64_t)v37[39] | 0x400000000);
  uint64_t v23 = (uint64_t)self->_flags;
  if ((v23 & 0x4000000) == 0)
  {
LABEL_59:
    if ((v23 & 0x40000000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_130;
  }
LABEL_129:
  *((unsigned char *)v37 + 291) = self->_supportsElectricVehicleRoutes;
  v37[39] = (id)((unint64_t)v37[39] | 0x4000000);
  uint64_t v23 = (uint64_t)self->_flags;
  if ((v23 & 0x40000000000) == 0)
  {
LABEL_60:
    if ((v23 & 0x200000000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_61;
  }
LABEL_130:
  *((unsigned char *)v37 + 307) = self->_supportsTrafficCameras;
  v37[39] = (id)((unint64_t)v37[39] | 0x40000000000);
  if ((*(void *)&self->_flags & 0x200000000000) != 0)
  {
LABEL_61:
    *((unsigned char *)v37 + 310) = self->_supportsWaypointRoutes;
    v37[39] = (id)((unint64_t)v37[39] | 0x200000000000);
  }
LABEL_62:
  if (self->_localizationCapabilities)
  {
    objc_msgSend(v37, "setLocalizationCapabilities:");
    uint64_t v24 = v37;
  }
  if (self->_deviceSku)
  {
    objc_msgSend(v37, "setDeviceSku:");
    uint64_t v24 = v37;
  }
  if (self->_osVersion)
  {
    objc_msgSend(v37, "setOsVersion:");
    uint64_t v24 = v37;
  }
  uint64_t v25 = &self->_flags;
  uint64_t v26 = (uint64_t)self->_flags;
  if ((v26 & 0x400000000000) != 0)
  {
    *((unsigned char *)v24 + 311) = self->_willSendEvDirectionsFeedback;
    v24[39] = (id)((unint64_t)v24[39] | 0x400000000000);
    uint64_t v26 = *(void *)v25;
    if ((*(void *)v25 & 0x2000000000) == 0)
    {
LABEL_70:
      if ((v26 & 0x20000000000) == 0) {
        goto LABEL_71;
      }
      goto LABEL_134;
    }
  }
  else if ((v26 & 0x2000000000) == 0)
  {
    goto LABEL_70;
  }
  *((unsigned char *)v24 + 302) = self->_supportsRoadComplexities;
  v24[39] = (id)((unint64_t)v24[39] | 0x2000000000);
  uint64_t v26 = (uint64_t)self->_flags;
  if ((v26 & 0x20000000000) == 0)
  {
LABEL_71:
    if ((v26 & 0x80000000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_135;
  }
LABEL_134:
  *((unsigned char *)v24 + 306) = self->_supportsSpeedTrapAnnouncements;
  v24[39] = (id)((unint64_t)v24[39] | 0x20000000000);
  uint64_t v26 = (uint64_t)self->_flags;
  if ((v26 & 0x80000000000) == 0)
  {
LABEL_72:
    if ((v26 & 0x40000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_136;
  }
LABEL_135:
  *((unsigned char *)v24 + 308) = self->_supportsUserIncidentReports;
  v24[39] = (id)((unint64_t)v24[39] | 0x80000000000);
  uint64_t v26 = (uint64_t)self->_flags;
  if ((v26 & 0x40000) == 0)
  {
LABEL_73:
    if ((v26 & 0x20000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_137;
  }
LABEL_136:
  *((unsigned char *)v24 + 283) = self->_supportsAreaEventsEnhancements;
  v24[39] = (id)((unint64_t)v24[39] | 0x40000);
  uint64_t v26 = (uint64_t)self->_flags;
  if ((v26 & 0x20000) == 0)
  {
LABEL_74:
    if ((v26 & 0x10000000000) == 0) {
      goto LABEL_75;
    }
    goto LABEL_138;
  }
LABEL_137:
  *((unsigned char *)v24 + 282) = self->_supportsAdvancedMap;
  v24[39] = (id)((unint64_t)v24[39] | 0x20000);
  uint64_t v26 = (uint64_t)self->_flags;
  if ((v26 & 0x10000000000) == 0)
  {
LABEL_75:
    if ((v26 & 0x2000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_139;
  }
LABEL_138:
  *((unsigned char *)v24 + 305) = self->_supportsSilentRouteUpdates;
  v24[39] = (id)((unint64_t)v24[39] | 0x10000000000);
  uint64_t v26 = (uint64_t)self->_flags;
  if ((v26 & 0x2000) == 0)
  {
LABEL_76:
    if ((v26 & 0x40000000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_140;
  }
LABEL_139:
  *((unsigned char *)v24 + 278) = self->_replaceAccidentStringWithCrash;
  v24[39] = (id)((unint64_t)v24[39] | 0x2000);
  uint64_t v26 = (uint64_t)self->_flags;
  if ((v26 & 0x40000000) == 0)
  {
LABEL_77:
    if ((v26 & 0x20000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_141;
  }
LABEL_140:
  *((unsigned char *)v24 + 295) = self->_supportsGuidanceEventPrivacyFilters;
  v24[39] = (id)((unint64_t)v24[39] | 0x40000000);
  uint64_t v26 = (uint64_t)self->_flags;
  if ((v26 & 0x20000000) == 0)
  {
LABEL_78:
    if ((v26 & 0x800) == 0) {
      goto LABEL_79;
    }
LABEL_142:
    *((unsigned char *)v24 + 276) = self->_isAdvancedMap;
    v24[39] = (id)((unint64_t)v24[39] | 0x800);
    if ((*(void *)&self->_flags & 0x1000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_80;
  }
LABEL_141:
  *((unsigned char *)v24 + 294) = self->_supportsGuidanceEventImportanceInfo;
  v24[39] = (id)((unint64_t)v24[39] | 0x20000000);
  uint64_t v26 = (uint64_t)self->_flags;
  if ((v26 & 0x800) != 0) {
    goto LABEL_142;
  }
LABEL_79:
  if ((v26 & 0x1000) != 0)
  {
LABEL_80:
    *((unsigned char *)v24 + 277) = self->_isGlobeProjection;
    v24[39] = (id)((unint64_t)v24[39] | 0x1000);
  }
LABEL_81:
  if ([(GEOClientCapabilities *)self supportsMultipointRoutingsCount])
  {
    [v37 clearSupportsMultipointRoutings];
    unint64_t v27 = [(GEOClientCapabilities *)self supportsMultipointRoutingsCount];
    if (v27)
    {
      unint64_t v28 = v27;
      for (uint64_t k = 0; k != v28; ++k)
        objc_msgSend(v37, "addSupportsMultipointRouting:", -[GEOClientCapabilities supportsMultipointRoutingAtIndex:](self, "supportsMultipointRoutingAtIndex:", k));
    }
  }
  v30 = v37;
  if ((*(void *)&self->_flags & 0x800000) != 0)
  {
    *((unsigned char *)v37 + 288) = self->_supportsDefaultToNewRouteFlag;
    v37[39] = (id)((unint64_t)v37[39] | 0x800000);
  }
  if (self->_walkingSupportedFeatures)
  {
    objc_msgSend(v37, "setWalkingSupportedFeatures:");
    v30 = v37;
  }
  uint64_t v31 = &self->_flags;
  uint64_t v32 = (uint64_t)self->_flags;
  if ((v32 & 0x10) != 0)
  {
    *((_DWORD *)v30 + 65) = self->_maxSupportedTransitFareVersion;
    v30[39] = (id)((unint64_t)v30[39] | 0x10);
    uint64_t v32 = *(void *)v31;
    if ((*(void *)v31 & 0x1000000) == 0)
    {
LABEL_91:
      if ((v32 & 0x200000) == 0) {
        goto LABEL_92;
      }
      goto LABEL_146;
    }
  }
  else if ((v32 & 0x1000000) == 0)
  {
    goto LABEL_91;
  }
  *((unsigned char *)v30 + 289) = self->_supportsDisablingProgressBarFromBannerButtons;
  v30[39] = (id)((unint64_t)v30[39] | 0x1000000);
  uint64_t v32 = (uint64_t)self->_flags;
  if ((v32 & 0x200000) == 0)
  {
LABEL_92:
    if ((v32 & 0x8000000) == 0) {
      goto LABEL_93;
    }
    goto LABEL_147;
  }
LABEL_146:
  *((unsigned char *)v30 + 286) = self->_supportsBannerQueuing;
  v30[39] = (id)((unint64_t)v30[39] | 0x200000);
  uint64_t v32 = (uint64_t)self->_flags;
  if ((v32 & 0x8000000) == 0)
  {
LABEL_93:
    if ((v32 & 0x8000000000) == 0) {
      goto LABEL_94;
    }
    goto LABEL_148;
  }
LABEL_147:
  *((unsigned char *)v30 + 292) = self->_supportsEv2;
  v30[39] = (id)((unint64_t)v30[39] | 0x8000000);
  uint64_t v32 = (uint64_t)self->_flags;
  if ((v32 & 0x8000000000) == 0)
  {
LABEL_94:
    if ((v32 & 0x100000000000) == 0) {
      goto LABEL_95;
    }
    goto LABEL_149;
  }
LABEL_148:
  *((unsigned char *)v30 + 304) = self->_supportsRouteNameRanges;
  v30[39] = (id)((unint64_t)v30[39] | 0x8000000000);
  uint64_t v32 = (uint64_t)self->_flags;
  if ((v32 & 0x100000000000) == 0)
  {
LABEL_95:
    if ((v32 & 0x10000000) == 0) {
      goto LABEL_96;
    }
    goto LABEL_150;
  }
LABEL_149:
  *((unsigned char *)v30 + 309) = self->_supportsWalkingSuggestionsAfterParking;
  v30[39] = (id)((unint64_t)v30[39] | 0x100000000000);
  uint64_t v32 = (uint64_t)self->_flags;
  if ((v32 & 0x10000000) == 0)
  {
LABEL_96:
    if ((v32 & 0x4000000000) == 0) {
      goto LABEL_97;
    }
LABEL_151:
    *((unsigned char *)v30 + 303) = self->_supportsRouteCameraInputUpdates;
    v30[39] = (id)((unint64_t)v30[39] | 0x4000000000);
    if ((*(void *)&self->_flags & 0x2000000) == 0) {
      goto LABEL_99;
    }
    goto LABEL_98;
  }
LABEL_150:
  *((unsigned char *)v30 + 293) = self->_supportsGenericCombinationsInstructionsForAllModes;
  v30[39] = (id)((unint64_t)v30[39] | 0x10000000);
  uint64_t v32 = (uint64_t)self->_flags;
  if ((v32 & 0x4000000000) != 0) {
    goto LABEL_151;
  }
LABEL_97:
  if ((v32 & 0x2000000) != 0)
  {
LABEL_98:
    *((unsigned char *)v30 + 290) = self->_supportsDodgeballCameraInput;
    v30[39] = (id)((unint64_t)v30[39] | 0x2000000);
  }
LABEL_99:
  if ([(GEOClientCapabilities *)self supportedElevationModelsCount])
  {
    [v37 clearSupportedElevationModels];
    unint64_t v33 = [(GEOClientCapabilities *)self supportedElevationModelsCount];
    if (v33)
    {
      unint64_t v34 = v33;
      for (uint64_t m = 0; m != v34; ++m)
        objc_msgSend(v37, "addSupportedElevationModel:", -[GEOClientCapabilities supportedElevationModelAtIndex:](self, "supportedElevationModelAtIndex:", m));
    }
  }
  uint64_t v36 = v37;
  if ((*(void *)&self->_flags & 0x10000) != 0)
  {
    *((unsigned char *)v37 + 281) = self->_supportEmissionsTagging;
    v37[39] = (id)((unint64_t)v37[39] | 0x10000);
  }
  if (self->_artworkCapabilities)
  {
    objc_msgSend(v37, "setArtworkCapabilities:");
    uint64_t v36 = v37;
  }
  if ((*(void *)&self->_flags & 0x100000) != 0)
  {
    *((unsigned char *)v36 + 285) = self->_supportsBannerQueuingDirections;
    v36[39] = (id)((unint64_t)v36[39] | 0x100000);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_395;
  }
  [(GEOClientCapabilities *)self readAll:1];
  [v4 readAll:1];
  appMajorVersion = self->_appMajorVersion;
  if ((unint64_t)appMajorVersion | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](appMajorVersion, "isEqual:")) {
      goto LABEL_395;
    }
  }
  appMinorVersion = self->_appMinorVersion;
  if ((unint64_t)appMinorVersion | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](appMinorVersion, "isEqual:")) {
      goto LABEL_395;
    }
  }
  hardwareModel = self->_hardwareModel;
  if ((unint64_t)hardwareModel | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](hardwareModel, "isEqual:")) {
      goto LABEL_395;
    }
  }
  hardwareClass = self->_hardwareClass;
  if ((unint64_t)hardwareClass | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](hardwareClass, "isEqual:")) {
      goto LABEL_395;
    }
  }
  uint64_t flags = (uint64_t)self->_flags;
  uint64_t v10 = *((void *)v4 + 39);
  if ((flags & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_maxManeuverTypeSupported != *((_DWORD *)v4 + 62)) {
      goto LABEL_395;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x200) != 0)
  {
    if ((v10 & 0x200) == 0) {
      goto LABEL_395;
    }
    if (self->_internalInstall)
    {
      if (!*((unsigned char *)v4 + 274)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 274))
    {
      goto LABEL_395;
    }
  }
  else if ((v10 & 0x200) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x400) != 0)
  {
    if ((v10 & 0x400) == 0) {
      goto LABEL_395;
    }
    if (self->_internalTool)
    {
      if (!*((unsigned char *)v4 + 275)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 275))
    {
      goto LABEL_395;
    }
  }
  else if ((v10 & 0x400) != 0)
  {
    goto LABEL_395;
  }
  displayLanguages = self->_displayLanguages;
  if ((unint64_t)displayLanguages | *((void *)v4 + 19)
    && !-[NSMutableArray isEqual:](displayLanguages, "isEqual:"))
  {
    goto LABEL_395;
  }
  displayRegion = self->_displayRegion;
  if ((unint64_t)displayRegion | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](displayRegion, "isEqual:")) {
      goto LABEL_395;
    }
  }
  uint64_t v13 = (uint64_t)self->_flags;
  uint64_t v14 = *((void *)v4 + 39);
  if ((v13 & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_maxTrafficSpeedSupported != *((_DWORD *)v4 + 64)) {
      goto LABEL_395;
    }
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_maxRouteIncidentSupported != *((_DWORD *)v4 + 63)) {
      goto LABEL_395;
    }
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_395;
  }
  if (v13)
  {
    if ((v14 & 1) == 0 || self->_maxFormatterSupported != *((_DWORD *)v4 + 61)) {
      goto LABEL_395;
    }
  }
  else if (v14)
  {
    goto LABEL_395;
  }
  deviceCountryCode = self->_deviceCountryCode;
  if ((unint64_t)deviceCountryCode | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](deviceCountryCode, "isEqual:")) {
      goto LABEL_395;
    }
    uint64_t v13 = (uint64_t)self->_flags;
    uint64_t v14 = *((void *)v4 + 39);
  }
  if ((v13 & 0x80) != 0)
  {
    if ((v14 & 0x80) == 0) {
      goto LABEL_395;
    }
    if (self->_clusteredTransitRoutesSupported)
    {
      if (!*((unsigned char *)v4 + 272)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 272))
    {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x80) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x4000) != 0)
  {
    if ((v14 & 0x4000) == 0) {
      goto LABEL_395;
    }
    if (self->_routeOptionsSupported)
    {
      if (!*((unsigned char *)v4 + 279)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 279))
    {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x4000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x40) != 0)
  {
    if ((v14 & 0x40) == 0 || self->_transitMarketSupport != *((_DWORD *)v4 + 67)) {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x40) != 0)
  {
    goto LABEL_395;
  }
  formattedStringClientCapabilities = self->_formattedStringClientCapabilities;
  if ((unint64_t)formattedStringClientCapabilities | *((void *)v4 + 21)
    && !-[GEOFormattedStringClientCapabilities isEqual:](formattedStringClientCapabilities, "isEqual:"))
  {
    goto LABEL_395;
  }
  advisoryClientCapabilities = self->_advisoryClientCapabilities;
  if ((unint64_t)advisoryClientCapabilities | *((void *)v4 + 13))
  {
    if (!-[GEOAdvisoryClientCapabilities isEqual:](advisoryClientCapabilities, "isEqual:")) {
      goto LABEL_395;
    }
  }
  uint64_t v18 = (uint64_t)self->_flags;
  uint64_t v19 = *((void *)v4 + 39);
  if ((v18 & 0x8000) != 0)
  {
    if ((v19 & 0x8000) == 0) {
      goto LABEL_395;
    }
    if (self->_snapToClosestStopSupported)
    {
      if (!*((unsigned char *)v4 + 280)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 280))
    {
      goto LABEL_395;
    }
  }
  else if ((v19 & 0x8000) != 0)
  {
    goto LABEL_395;
  }
  if ((v18 & 0x100) != 0)
  {
    if ((v19 & 0x100) == 0) {
      goto LABEL_395;
    }
    if (self->_includeCrossLanguagePhonetics)
    {
      if (!*((unsigned char *)v4 + 273)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 273))
    {
      goto LABEL_395;
    }
  }
  else if ((v19 & 0x100) != 0)
  {
    goto LABEL_395;
  }
  userCurrentTimezone = self->_userCurrentTimezone;
  if ((unint64_t)userCurrentTimezone | *((void *)v4 + 27))
  {
    if (!-[NSString isEqual:](userCurrentTimezone, "isEqual:")) {
      goto LABEL_395;
    }
    uint64_t v18 = (uint64_t)self->_flags;
    uint64_t v19 = *((void *)v4 + 39);
  }
  if ((v18 & 0x800000000) != 0)
  {
    if ((v19 & 0x800000000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsLongShieldStrings)
    {
      if (!*((unsigned char *)v4 + 300)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 300))
    {
      goto LABEL_395;
    }
  }
  else if ((v19 & 0x800000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v18 & 0x100000000) != 0)
  {
    if ((v19 & 0x100000000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsGuidanceEvents)
    {
      if (!*((unsigned char *)v4 + 297)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 297))
    {
      goto LABEL_395;
    }
  }
  else if ((v19 & 0x100000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v18 & 0x80000000) != 0)
  {
    if ((v19 & 0x80000000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsGuidanceEventsInlineShields)
    {
      if (!*((unsigned char *)v4 + 296)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 296))
    {
      goto LABEL_395;
    }
  }
  else if ((v19 & 0x80000000) != 0)
  {
    goto LABEL_395;
  }
  abAssignInfo = self->_abAssignInfo;
  if ((unint64_t)abAssignInfo | *((void *)v4 + 12) && !-[GEOAbAssignInfo isEqual:](abAssignInfo, "isEqual:")) {
    goto LABEL_395;
  }
  requestTime = self->_requestTime;
  if ((unint64_t)requestTime | *((void *)v4 + 26))
  {
    if (!-[GEOLocalTime isEqual:](requestTime, "isEqual:")) {
      goto LABEL_395;
    }
  }
  uint64_t v23 = *((void *)v4 + 39);
  if ((*(void *)&self->_flags & 0x20) != 0)
  {
    if ((v23 & 0x20) == 0 || self->_maxZilchMessageVersionSupported != *((_DWORD *)v4 + 66)) {
      goto LABEL_395;
    }
  }
  else if ((v23 & 0x20) != 0)
  {
    goto LABEL_395;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_395:
    BOOL v37 = 0;
    goto LABEL_396;
  }
  uint64_t v24 = (uint64_t)self->_flags;
  uint64_t v25 = *((void *)v4 + 39);
  if ((v24 & 0x80000) != 0)
  {
    if ((v25 & 0x80000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsArrivalMapRegion)
    {
      if (!*((unsigned char *)v4 + 284)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 284))
    {
      goto LABEL_395;
    }
  }
  else if ((v25 & 0x80000) != 0)
  {
    goto LABEL_395;
  }
  if ((v24 & 0x1000000000) != 0)
  {
    if ((v25 & 0x1000000000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsNaturalGuidance)
    {
      if (!*((unsigned char *)v4 + 301)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 301))
    {
      goto LABEL_395;
    }
  }
  else if ((v25 & 0x1000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v24 & 0x200000000) != 0)
  {
    if ((v25 & 0x200000000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsJunctionView)
    {
      if (!*((unsigned char *)v4 + 298)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 298))
    {
      goto LABEL_395;
    }
  }
  else if ((v25 & 0x200000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v24 & 0x400000) != 0)
  {
    if ((v25 & 0x400000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsCongestionZones)
    {
      if (!*((unsigned char *)v4 + 287)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 287))
    {
      goto LABEL_395;
    }
  }
  else if ((v25 & 0x400000) != 0)
  {
    goto LABEL_395;
  }
  if ((v24 & 0x400000000) != 0)
  {
    if ((v25 & 0x400000000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsLicensePlateRestrictions)
    {
      if (!*((unsigned char *)v4 + 299)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 299))
    {
      goto LABEL_395;
    }
  }
  else if ((v25 & 0x400000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v24 & 0x4000000) != 0)
  {
    if ((v25 & 0x4000000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsElectricVehicleRoutes)
    {
      if (!*((unsigned char *)v4 + 291)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 291))
    {
      goto LABEL_395;
    }
  }
  else if ((v25 & 0x4000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v24 & 0x40000000000) != 0)
  {
    if ((v25 & 0x40000000000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsTrafficCameras)
    {
      if (!*((unsigned char *)v4 + 307)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 307))
    {
      goto LABEL_395;
    }
  }
  else if ((v25 & 0x40000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v24 & 0x200000000000) != 0)
  {
    if ((v25 & 0x200000000000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsWaypointRoutes)
    {
      if (!*((unsigned char *)v4 + 310)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 310))
    {
      goto LABEL_395;
    }
  }
  else if ((v25 & 0x200000000000) != 0)
  {
    goto LABEL_395;
  }
  localizationCapabilities = self->_localizationCapabilities;
  if ((unint64_t)localizationCapabilities | *((void *)v4 + 24)
    && !-[GEOLocalizationCapabilities isEqual:](localizationCapabilities, "isEqual:"))
  {
    goto LABEL_395;
  }
  deviceSku = self->_deviceSku;
  if ((unint64_t)deviceSku | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](deviceSku, "isEqual:")) {
      goto LABEL_395;
    }
  }
  osVersion = self->_osVersion;
  if ((unint64_t)osVersion | *((void *)v4 + 25))
  {
    if (!-[NSString isEqual:](osVersion, "isEqual:")) {
      goto LABEL_395;
    }
  }
  uint64_t v29 = (uint64_t)self->_flags;
  uint64_t v30 = *((void *)v4 + 39);
  if ((v29 & 0x400000000000) != 0)
  {
    if ((v30 & 0x400000000000) == 0) {
      goto LABEL_395;
    }
    if (self->_willSendEvDirectionsFeedback)
    {
      if (!*((unsigned char *)v4 + 311)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 311))
    {
      goto LABEL_395;
    }
  }
  else if ((v30 & 0x400000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v29 & 0x2000000000) != 0)
  {
    if ((v30 & 0x2000000000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsRoadComplexities)
    {
      if (!*((unsigned char *)v4 + 302)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 302))
    {
      goto LABEL_395;
    }
  }
  else if ((v30 & 0x2000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v29 & 0x20000000000) != 0)
  {
    if ((v30 & 0x20000000000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsSpeedTrapAnnouncements)
    {
      if (!*((unsigned char *)v4 + 306)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 306))
    {
      goto LABEL_395;
    }
  }
  else if ((v30 & 0x20000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v29 & 0x80000000000) != 0)
  {
    if ((v30 & 0x80000000000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsUserIncidentReports)
    {
      if (!*((unsigned char *)v4 + 308)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 308))
    {
      goto LABEL_395;
    }
  }
  else if ((v30 & 0x80000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v29 & 0x40000) != 0)
  {
    if ((v30 & 0x40000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsAreaEventsEnhancements)
    {
      if (!*((unsigned char *)v4 + 283)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 283))
    {
      goto LABEL_395;
    }
  }
  else if ((v30 & 0x40000) != 0)
  {
    goto LABEL_395;
  }
  if ((v29 & 0x20000) != 0)
  {
    if ((v30 & 0x20000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsAdvancedMap)
    {
      if (!*((unsigned char *)v4 + 282)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 282))
    {
      goto LABEL_395;
    }
  }
  else if ((v30 & 0x20000) != 0)
  {
    goto LABEL_395;
  }
  if ((v29 & 0x10000000000) != 0)
  {
    if ((v30 & 0x10000000000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsSilentRouteUpdates)
    {
      if (!*((unsigned char *)v4 + 305)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 305))
    {
      goto LABEL_395;
    }
  }
  else if ((v30 & 0x10000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v29 & 0x2000) != 0)
  {
    if ((v30 & 0x2000) == 0) {
      goto LABEL_395;
    }
    if (self->_replaceAccidentStringWithCrash)
    {
      if (!*((unsigned char *)v4 + 278)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 278))
    {
      goto LABEL_395;
    }
  }
  else if ((v30 & 0x2000) != 0)
  {
    goto LABEL_395;
  }
  if ((v29 & 0x40000000) != 0)
  {
    if ((v30 & 0x40000000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsGuidanceEventPrivacyFilters)
    {
      if (!*((unsigned char *)v4 + 295)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 295))
    {
      goto LABEL_395;
    }
  }
  else if ((v30 & 0x40000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v29 & 0x20000000) != 0)
  {
    if ((v30 & 0x20000000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsGuidanceEventImportanceInfo)
    {
      if (!*((unsigned char *)v4 + 294)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 294))
    {
      goto LABEL_395;
    }
  }
  else if ((v30 & 0x20000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v29 & 0x800) != 0)
  {
    if ((v30 & 0x800) == 0) {
      goto LABEL_395;
    }
    if (self->_isAdvancedMap)
    {
      if (!*((unsigned char *)v4 + 276)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 276))
    {
      goto LABEL_395;
    }
  }
  else if ((v30 & 0x800) != 0)
  {
    goto LABEL_395;
  }
  if ((v29 & 0x1000) != 0)
  {
    if ((v30 & 0x1000) == 0) {
      goto LABEL_395;
    }
    if (self->_isGlobeProjection)
    {
      if (!*((unsigned char *)v4 + 277)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 277))
    {
      goto LABEL_395;
    }
  }
  else if ((v30 & 0x1000) != 0)
  {
    goto LABEL_395;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_395;
  }
  uint64_t v31 = (uint64_t)self->_flags;
  uint64_t v32 = *((void *)v4 + 39);
  if ((v31 & 0x800000) != 0)
  {
    if ((v32 & 0x800000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsDefaultToNewRouteFlag)
    {
      if (!*((unsigned char *)v4 + 288)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 288))
    {
      goto LABEL_395;
    }
  }
  else if ((v32 & 0x800000) != 0)
  {
    goto LABEL_395;
  }
  walkingSupportedFeatures = self->_walkingSupportedFeatures;
  if ((unint64_t)walkingSupportedFeatures | *((void *)v4 + 28))
  {
    if (!-[GEOWalkingSupportedFeatures isEqual:](walkingSupportedFeatures, "isEqual:")) {
      goto LABEL_395;
    }
    uint64_t v31 = (uint64_t)self->_flags;
    uint64_t v32 = *((void *)v4 + 39);
  }
  if ((v31 & 0x10) != 0)
  {
    if ((v32 & 0x10) == 0 || self->_maxSupportedTransitFareVersion != *((_DWORD *)v4 + 65)) {
      goto LABEL_395;
    }
  }
  else if ((v32 & 0x10) != 0)
  {
    goto LABEL_395;
  }
  if ((v31 & 0x1000000) != 0)
  {
    if ((v32 & 0x1000000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsDisablingProgressBarFromBannerButtons)
    {
      if (!*((unsigned char *)v4 + 289)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 289))
    {
      goto LABEL_395;
    }
  }
  else if ((v32 & 0x1000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v31 & 0x200000) != 0)
  {
    if ((v32 & 0x200000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsBannerQueuing)
    {
      if (!*((unsigned char *)v4 + 286)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 286))
    {
      goto LABEL_395;
    }
  }
  else if ((v32 & 0x200000) != 0)
  {
    goto LABEL_395;
  }
  if ((v31 & 0x8000000) != 0)
  {
    if ((v32 & 0x8000000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsEv2)
    {
      if (!*((unsigned char *)v4 + 292)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 292))
    {
      goto LABEL_395;
    }
  }
  else if ((v32 & 0x8000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v31 & 0x8000000000) != 0)
  {
    if ((v32 & 0x8000000000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsRouteNameRanges)
    {
      if (!*((unsigned char *)v4 + 304)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 304))
    {
      goto LABEL_395;
    }
  }
  else if ((v32 & 0x8000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v31 & 0x100000000000) != 0)
  {
    if ((v32 & 0x100000000000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsWalkingSuggestionsAfterParking)
    {
      if (!*((unsigned char *)v4 + 309)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 309))
    {
      goto LABEL_395;
    }
  }
  else if ((v32 & 0x100000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v31 & 0x10000000) != 0)
  {
    if ((v32 & 0x10000000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsGenericCombinationsInstructionsForAllModes)
    {
      if (!*((unsigned char *)v4 + 293)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 293))
    {
      goto LABEL_395;
    }
  }
  else if ((v32 & 0x10000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v31 & 0x4000000000) != 0)
  {
    if ((v32 & 0x4000000000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsRouteCameraInputUpdates)
    {
      if (!*((unsigned char *)v4 + 303)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 303))
    {
      goto LABEL_395;
    }
  }
  else if ((v32 & 0x4000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v31 & 0x2000000) != 0)
  {
    if ((v32 & 0x2000000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportsDodgeballCameraInput)
    {
      if (!*((unsigned char *)v4 + 290)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 290))
    {
      goto LABEL_395;
    }
  }
  else if ((v32 & 0x2000000) != 0)
  {
    goto LABEL_395;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_395;
  }
  uint64_t v34 = (uint64_t)self->_flags;
  uint64_t v35 = *((void *)v4 + 39);
  if ((v34 & 0x10000) != 0)
  {
    if ((v35 & 0x10000) == 0) {
      goto LABEL_395;
    }
    if (self->_supportEmissionsTagging)
    {
      if (!*((unsigned char *)v4 + 281)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 281))
    {
      goto LABEL_395;
    }
  }
  else if ((v35 & 0x10000) != 0)
  {
    goto LABEL_395;
  }
  artworkCapabilities = self->_artworkCapabilities;
  if ((unint64_t)artworkCapabilities | *((void *)v4 + 16))
  {
    if (!-[GEOArtworkCapabilities isEqual:](artworkCapabilities, "isEqual:")) {
      goto LABEL_395;
    }
    uint64_t v34 = (uint64_t)self->_flags;
    uint64_t v35 = *((void *)v4 + 39);
  }
  if ((v34 & 0x100000) != 0)
  {
    if ((v35 & 0x100000) != 0)
    {
      if (self->_supportsBannerQueuingDirections)
      {
        if (!*((unsigned char *)v4 + 285)) {
          goto LABEL_395;
        }
      }
      else if (*((unsigned char *)v4 + 285))
      {
        goto LABEL_395;
      }
      BOOL v37 = 1;
      goto LABEL_396;
    }
    goto LABEL_395;
  }
  BOOL v37 = (v35 & 0x100000) == 0;
LABEL_396:

  return v37;
}

- (unint64_t)hash
{
  [(GEOClientCapabilities *)self readAll:1];
  NSUInteger v78 = [(NSString *)self->_appMajorVersion hash];
  NSUInteger v77 = [(NSString *)self->_appMinorVersion hash];
  NSUInteger v76 = [(NSString *)self->_hardwareModel hash];
  NSUInteger v75 = [(NSString *)self->_hardwareClass hash];
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 2) == 0)
  {
    uint64_t v74 = 0;
    if ((flags & 0x200) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v73 = 0;
    if ((flags & 0x400) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v74 = 2654435761 * self->_maxManeuverTypeSupported;
  if ((flags & 0x200) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v73 = 2654435761 * self->_internalInstall;
  if ((flags & 0x400) != 0)
  {
LABEL_4:
    uint64_t v72 = 2654435761 * self->_internalTool;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v72 = 0;
LABEL_8:
  uint64_t v71 = [(NSMutableArray *)self->_displayLanguages hash];
  NSUInteger v70 = [(NSString *)self->_displayRegion hash];
  uint64_t v4 = (uint64_t)self->_flags;
  if ((v4 & 8) == 0)
  {
    uint64_t v69 = 0;
    if ((v4 & 4) != 0) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v68 = 0;
    if (v4) {
      goto LABEL_11;
    }
    goto LABEL_14;
  }
  uint64_t v69 = 2654435761 * self->_maxTrafficSpeedSupported;
  if ((v4 & 4) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v68 = 2654435761 * self->_maxRouteIncidentSupported;
  if (v4)
  {
LABEL_11:
    uint64_t v67 = 2654435761 * self->_maxFormatterSupported;
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v67 = 0;
LABEL_15:
  NSUInteger v66 = [(NSString *)self->_deviceCountryCode hash];
  uint64_t v5 = (uint64_t)self->_flags;
  if ((v5 & 0x80) == 0)
  {
    uint64_t v65 = 0;
    if ((v5 & 0x4000) != 0) {
      goto LABEL_17;
    }
LABEL_20:
    uint64_t v64 = 0;
    if ((v5 & 0x40) != 0) {
      goto LABEL_18;
    }
    goto LABEL_21;
  }
  uint64_t v65 = 2654435761 * self->_clusteredTransitRoutesSupported;
  if ((v5 & 0x4000) == 0) {
    goto LABEL_20;
  }
LABEL_17:
  uint64_t v64 = 2654435761 * self->_routeOptionsSupported;
  if ((v5 & 0x40) != 0)
  {
LABEL_18:
    uint64_t v63 = 2654435761 * self->_transitMarketSupport;
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v63 = 0;
LABEL_22:
  unint64_t v62 = [(GEOFormattedStringClientCapabilities *)self->_formattedStringClientCapabilities hash];
  unint64_t v61 = [(GEOAdvisoryClientCapabilities *)self->_advisoryClientCapabilities hash];
  uint64_t v6 = (uint64_t)self->_flags;
  if ((v6 & 0x8000) != 0)
  {
    uint64_t v60 = 2654435761 * self->_snapToClosestStopSupported;
    if ((v6 & 0x100) != 0) {
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v60 = 0;
    if ((v6 & 0x100) != 0)
    {
LABEL_24:
      uint64_t v59 = 2654435761 * self->_includeCrossLanguagePhonetics;
      goto LABEL_27;
    }
  }
  uint64_t v59 = 0;
LABEL_27:
  NSUInteger v58 = [(NSString *)self->_userCurrentTimezone hash];
  uint64_t v7 = (uint64_t)self->_flags;
  if ((v7 & 0x800000000) == 0)
  {
    uint64_t v57 = 0;
    if ((v7 & 0x100000000) != 0) {
      goto LABEL_29;
    }
LABEL_32:
    uint64_t v56 = 0;
    if ((v7 & 0x80000000) != 0) {
      goto LABEL_30;
    }
    goto LABEL_33;
  }
  uint64_t v57 = 2654435761 * self->_supportsLongShieldStrings;
  if ((v7 & 0x100000000) == 0) {
    goto LABEL_32;
  }
LABEL_29:
  uint64_t v56 = 2654435761 * self->_supportsGuidanceEvents;
  if ((v7 & 0x80000000) != 0)
  {
LABEL_30:
    uint64_t v55 = 2654435761 * self->_supportsGuidanceEventsInlineShields;
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v55 = 0;
LABEL_34:
  unint64_t v54 = [(GEOAbAssignInfo *)self->_abAssignInfo hash];
  unint64_t v53 = [(GEOLocalTime *)self->_requestTime hash];
  if ((*(void *)&self->_flags & 0x20) != 0) {
    uint64_t v52 = 2654435761 * self->_maxZilchMessageVersionSupported;
  }
  else {
    uint64_t v52 = 0;
  }
  uint64_t v51 = PBRepeatedInt32Hash();
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x80000) != 0)
  {
    uint64_t v50 = 2654435761 * self->_supportsArrivalMapRegion;
    if ((v8 & 0x1000000000) != 0)
    {
LABEL_39:
      uint64_t v49 = 2654435761 * self->_supportsNaturalGuidance;
      if ((v8 & 0x200000000) != 0) {
        goto LABEL_40;
      }
      goto LABEL_48;
    }
  }
  else
  {
    uint64_t v50 = 0;
    if ((v8 & 0x1000000000) != 0) {
      goto LABEL_39;
    }
  }
  uint64_t v49 = 0;
  if ((v8 & 0x200000000) != 0)
  {
LABEL_40:
    uint64_t v48 = 2654435761 * self->_supportsJunctionView;
    if ((v8 & 0x400000) != 0) {
      goto LABEL_41;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v48 = 0;
  if ((v8 & 0x400000) != 0)
  {
LABEL_41:
    uint64_t v47 = 2654435761 * self->_supportsCongestionZones;
    if ((v8 & 0x400000000) != 0) {
      goto LABEL_42;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v47 = 0;
  if ((v8 & 0x400000000) != 0)
  {
LABEL_42:
    uint64_t v46 = 2654435761 * self->_supportsLicensePlateRestrictions;
    if ((v8 & 0x4000000) != 0) {
      goto LABEL_43;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v46 = 0;
  if ((v8 & 0x4000000) != 0)
  {
LABEL_43:
    uint64_t v45 = 2654435761 * self->_supportsElectricVehicleRoutes;
    if ((v8 & 0x40000000000) != 0) {
      goto LABEL_44;
    }
LABEL_52:
    uint64_t v44 = 0;
    if ((v8 & 0x200000000000) != 0) {
      goto LABEL_45;
    }
    goto LABEL_53;
  }
LABEL_51:
  uint64_t v45 = 0;
  if ((v8 & 0x40000000000) == 0) {
    goto LABEL_52;
  }
LABEL_44:
  uint64_t v44 = 2654435761 * self->_supportsTrafficCameras;
  if ((v8 & 0x200000000000) != 0)
  {
LABEL_45:
    uint64_t v43 = 2654435761 * self->_supportsWaypointRoutes;
    goto LABEL_54;
  }
LABEL_53:
  uint64_t v43 = 0;
LABEL_54:
  unint64_t v42 = [(GEOLocalizationCapabilities *)self->_localizationCapabilities hash];
  NSUInteger v41 = [(NSString *)self->_deviceSku hash];
  NSUInteger v40 = [(NSString *)self->_osVersion hash];
  uint64_t v9 = (uint64_t)self->_flags;
  if ((v9 & 0x400000000000) != 0)
  {
    uint64_t v39 = 2654435761 * self->_willSendEvDirectionsFeedback;
    if ((v9 & 0x2000000000) != 0)
    {
LABEL_56:
      uint64_t v38 = 2654435761 * self->_supportsRoadComplexities;
      if ((v9 & 0x20000000000) != 0) {
        goto LABEL_57;
      }
      goto LABEL_69;
    }
  }
  else
  {
    uint64_t v39 = 0;
    if ((v9 & 0x2000000000) != 0) {
      goto LABEL_56;
    }
  }
  uint64_t v38 = 0;
  if ((v9 & 0x20000000000) != 0)
  {
LABEL_57:
    uint64_t v37 = 2654435761 * self->_supportsSpeedTrapAnnouncements;
    if ((v9 & 0x80000000000) != 0) {
      goto LABEL_58;
    }
    goto LABEL_70;
  }
LABEL_69:
  uint64_t v37 = 0;
  if ((v9 & 0x80000000000) != 0)
  {
LABEL_58:
    uint64_t v36 = 2654435761 * self->_supportsUserIncidentReports;
    if ((v9 & 0x40000) != 0) {
      goto LABEL_59;
    }
    goto LABEL_71;
  }
LABEL_70:
  uint64_t v36 = 0;
  if ((v9 & 0x40000) != 0)
  {
LABEL_59:
    uint64_t v35 = 2654435761 * self->_supportsAreaEventsEnhancements;
    if ((v9 & 0x20000) != 0) {
      goto LABEL_60;
    }
    goto LABEL_72;
  }
LABEL_71:
  uint64_t v35 = 0;
  if ((v9 & 0x20000) != 0)
  {
LABEL_60:
    uint64_t v34 = 2654435761 * self->_supportsAdvancedMap;
    if ((v9 & 0x10000000000) != 0) {
      goto LABEL_61;
    }
    goto LABEL_73;
  }
LABEL_72:
  uint64_t v34 = 0;
  if ((v9 & 0x10000000000) != 0)
  {
LABEL_61:
    uint64_t v33 = 2654435761 * self->_supportsSilentRouteUpdates;
    if ((v9 & 0x2000) != 0) {
      goto LABEL_62;
    }
    goto LABEL_74;
  }
LABEL_73:
  uint64_t v33 = 0;
  if ((v9 & 0x2000) != 0)
  {
LABEL_62:
    uint64_t v32 = 2654435761 * self->_replaceAccidentStringWithCrash;
    if ((v9 & 0x40000000) != 0) {
      goto LABEL_63;
    }
    goto LABEL_75;
  }
LABEL_74:
  uint64_t v32 = 0;
  if ((v9 & 0x40000000) != 0)
  {
LABEL_63:
    uint64_t v31 = 2654435761 * self->_supportsGuidanceEventPrivacyFilters;
    if ((v9 & 0x20000000) != 0) {
      goto LABEL_64;
    }
    goto LABEL_76;
  }
LABEL_75:
  uint64_t v31 = 0;
  if ((v9 & 0x20000000) != 0)
  {
LABEL_64:
    uint64_t v30 = 2654435761 * self->_supportsGuidanceEventImportanceInfo;
    if ((v9 & 0x800) != 0) {
      goto LABEL_65;
    }
LABEL_77:
    uint64_t v29 = 0;
    if ((v9 & 0x1000) != 0) {
      goto LABEL_66;
    }
    goto LABEL_78;
  }
LABEL_76:
  uint64_t v30 = 0;
  if ((v9 & 0x800) == 0) {
    goto LABEL_77;
  }
LABEL_65:
  uint64_t v29 = 2654435761 * self->_isAdvancedMap;
  if ((v9 & 0x1000) != 0)
  {
LABEL_66:
    uint64_t v28 = 2654435761 * self->_isGlobeProjection;
    goto LABEL_79;
  }
LABEL_78:
  uint64_t v28 = 0;
LABEL_79:
  uint64_t v27 = PBRepeatedInt32Hash();
  if ((*(void *)&self->_flags & 0x800000) != 0) {
    uint64_t v26 = 2654435761 * self->_supportsDefaultToNewRouteFlag;
  }
  else {
    uint64_t v26 = 0;
  }
  unint64_t v25 = [(GEOWalkingSupportedFeatures *)self->_walkingSupportedFeatures hash];
  uint64_t v10 = (uint64_t)self->_flags;
  if ((v10 & 0x10) != 0)
  {
    uint64_t v24 = 2654435761 * self->_maxSupportedTransitFareVersion;
    if ((v10 & 0x1000000) != 0)
    {
LABEL_84:
      uint64_t v23 = 2654435761 * self->_supportsDisablingProgressBarFromBannerButtons;
      if ((v10 & 0x200000) != 0) {
        goto LABEL_85;
      }
      goto LABEL_94;
    }
  }
  else
  {
    uint64_t v24 = 0;
    if ((v10 & 0x1000000) != 0) {
      goto LABEL_84;
    }
  }
  uint64_t v23 = 0;
  if ((v10 & 0x200000) != 0)
  {
LABEL_85:
    uint64_t v22 = 2654435761 * self->_supportsBannerQueuing;
    if ((v10 & 0x8000000) != 0) {
      goto LABEL_86;
    }
    goto LABEL_95;
  }
LABEL_94:
  uint64_t v22 = 0;
  if ((v10 & 0x8000000) != 0)
  {
LABEL_86:
    uint64_t v21 = 2654435761 * self->_supportsEv2;
    if ((v10 & 0x8000000000) != 0) {
      goto LABEL_87;
    }
    goto LABEL_96;
  }
LABEL_95:
  uint64_t v21 = 0;
  if ((v10 & 0x8000000000) != 0)
  {
LABEL_87:
    uint64_t v11 = 2654435761 * self->_supportsRouteNameRanges;
    if ((v10 & 0x100000000000) != 0) {
      goto LABEL_88;
    }
    goto LABEL_97;
  }
LABEL_96:
  uint64_t v11 = 0;
  if ((v10 & 0x100000000000) != 0)
  {
LABEL_88:
    uint64_t v12 = 2654435761 * self->_supportsWalkingSuggestionsAfterParking;
    if ((v10 & 0x10000000) != 0) {
      goto LABEL_89;
    }
    goto LABEL_98;
  }
LABEL_97:
  uint64_t v12 = 0;
  if ((v10 & 0x10000000) != 0)
  {
LABEL_89:
    uint64_t v13 = 2654435761 * self->_supportsGenericCombinationsInstructionsForAllModes;
    if ((v10 & 0x4000000000) != 0) {
      goto LABEL_90;
    }
LABEL_99:
    uint64_t v14 = 0;
    if ((v10 & 0x2000000) != 0) {
      goto LABEL_91;
    }
    goto LABEL_100;
  }
LABEL_98:
  uint64_t v13 = 0;
  if ((v10 & 0x4000000000) == 0) {
    goto LABEL_99;
  }
LABEL_90:
  uint64_t v14 = 2654435761 * self->_supportsRouteCameraInputUpdates;
  if ((v10 & 0x2000000) != 0)
  {
LABEL_91:
    uint64_t v15 = 2654435761 * self->_supportsDodgeballCameraInput;
    goto LABEL_101;
  }
LABEL_100:
  uint64_t v15 = 0;
LABEL_101:
  uint64_t v16 = PBRepeatedInt32Hash();
  if ((*(void *)&self->_flags & 0x10000) != 0) {
    uint64_t v17 = 2654435761 * self->_supportEmissionsTagging;
  }
  else {
    uint64_t v17 = 0;
  }
  unint64_t v18 = [(GEOArtworkCapabilities *)self->_artworkCapabilities hash];
  if ((*(void *)&self->_flags & 0x100000) != 0) {
    uint64_t v19 = 2654435761 * self->_supportsBannerQueuingDirections;
  }
  else {
    uint64_t v19 = 0;
  }
  return v77 ^ v78 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (char *)a3;
  [v4 readAll:0];
  if (*((void *)v4 + 14)) {
    -[GEOClientCapabilities setAppMajorVersion:](self, "setAppMajorVersion:");
  }
  if (*((void *)v4 + 15)) {
    -[GEOClientCapabilities setAppMinorVersion:](self, "setAppMinorVersion:");
  }
  if (*((void *)v4 + 22)) {
    -[GEOClientCapabilities setHardwareModel:](self, "setHardwareModel:");
  }
  if (*((void *)v4 + 23)) {
    -[GEOClientCapabilities setHardwareClass:](self, "setHardwareClass:");
  }
  uint64_t v5 = (uint64_t *)(v4 + 312);
  uint64_t v6 = *((void *)v4 + 39);
  if ((v6 & 2) != 0)
  {
    self->_maxManeuverTypeSupported = *((_DWORD *)v4 + 62);
    *(void *)&self->_flags |= 2uLL;
    uint64_t v6 = *v5;
    if ((*v5 & 0x200) == 0)
    {
LABEL_11:
      if ((v6 & 0x400) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((v6 & 0x200) == 0)
  {
    goto LABEL_11;
  }
  self->_internalInstall = v4[274];
  *(void *)&self->_flags |= 0x200uLL;
  if ((*((void *)v4 + 39) & 0x400) != 0)
  {
LABEL_12:
    self->_internalTool = v4[275];
    *(void *)&self->_flags |= 0x400uLL;
  }
LABEL_13:
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v7 = *((id *)v4 + 19);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(v7);
        }
        -[GEOClientCapabilities addDisplayLanguages:](self, "addDisplayLanguages:", *(void *)(*((void *)&v48 + 1) + 8 * i), (void)v48);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v9);
  }

  if (*((void *)v4 + 20)) {
    -[GEOClientCapabilities setDisplayRegion:](self, "setDisplayRegion:");
  }
  uint64_t v12 = (uint64_t *)(v4 + 312);
  uint64_t v13 = *((void *)v4 + 39);
  if ((v13 & 8) != 0)
  {
    self->_maxTrafficSpeedSupported = *((_DWORD *)v4 + 64);
    *(void *)&self->_flags |= 8uLL;
    uint64_t v13 = *v12;
    if ((*v12 & 4) == 0)
    {
LABEL_24:
      if ((v13 & 1) == 0) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
  }
  else if ((v13 & 4) == 0)
  {
    goto LABEL_24;
  }
  self->_maxRouteIncidentSupported = *((_DWORD *)v4 + 63);
  *(void *)&self->_flags |= 4uLL;
  if (*((void *)v4 + 39))
  {
LABEL_25:
    self->_maxFormatterSupported = *((_DWORD *)v4 + 61);
    *(void *)&self->_flags |= 1uLL;
  }
LABEL_26:
  if (*((void *)v4 + 17)) {
    -[GEOClientCapabilities setDeviceCountryCode:](self, "setDeviceCountryCode:");
  }
  uint64_t v14 = (uint64_t *)(v4 + 312);
  uint64_t v15 = *((void *)v4 + 39);
  if ((v15 & 0x80) != 0)
  {
    self->_clusteredTransitRoutesSupported = v4[272];
    *(void *)&self->_flags |= 0x80uLL;
    uint64_t v15 = *v14;
    if ((*v14 & 0x4000) == 0)
    {
LABEL_30:
      if ((v15 & 0x40) == 0) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
  }
  else if ((v15 & 0x4000) == 0)
  {
    goto LABEL_30;
  }
  self->_routeOptionsSupported = v4[279];
  *(void *)&self->_flags |= 0x4000uLL;
  if ((*((void *)v4 + 39) & 0x40) != 0)
  {
LABEL_31:
    self->_transitMarketSupport = *((_DWORD *)v4 + 67);
    *(void *)&self->_flags |= 0x40uLL;
  }
LABEL_32:
  formattedStringClientCapabilities = self->_formattedStringClientCapabilities;
  uint64_t v17 = *((void *)v4 + 21);
  if (formattedStringClientCapabilities)
  {
    if (v17) {
      -[GEOFormattedStringClientCapabilities mergeFrom:](formattedStringClientCapabilities, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[GEOClientCapabilities setFormattedStringClientCapabilities:](self, "setFormattedStringClientCapabilities:");
  }
  advisoryClientCapabilities = self->_advisoryClientCapabilities;
  uint64_t v19 = *((void *)v4 + 13);
  if (advisoryClientCapabilities)
  {
    if (v19) {
      -[GEOAdvisoryClientCapabilities mergeFrom:](advisoryClientCapabilities, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[GEOClientCapabilities setAdvisoryClientCapabilities:](self, "setAdvisoryClientCapabilities:");
  }
  uint64_t v20 = *((void *)v4 + 39);
  if ((v20 & 0x8000) != 0)
  {
    self->_snapToClosestStopSupported = v4[280];
    *(void *)&self->_flags |= 0x8000uLL;
    uint64_t v20 = *((void *)v4 + 39);
  }
  if ((v20 & 0x100) != 0)
  {
    self->_includeCrossLanguagePhonetics = v4[273];
    *(void *)&self->_flags |= 0x100uLL;
  }
  if (*((void *)v4 + 27)) {
    -[GEOClientCapabilities setUserCurrentTimezone:](self, "setUserCurrentTimezone:");
  }
  uint64_t v21 = (uint64_t *)(v4 + 312);
  uint64_t v22 = *((void *)v4 + 39);
  if ((v22 & 0x800000000) != 0)
  {
    self->_supportsLongShieldStrings = v4[300];
    *(void *)&self->_flags |= 0x800000000uLL;
    uint64_t v22 = *v21;
    if ((*v21 & 0x100000000) == 0)
    {
LABEL_59:
      if ((v22 & 0x80000000) == 0) {
        goto LABEL_61;
      }
      goto LABEL_60;
    }
  }
  else if ((v22 & 0x100000000) == 0)
  {
    goto LABEL_59;
  }
  self->_supportsGuidanceEvents = v4[297];
  *(void *)&self->_flags |= 0x100000000uLL;
  if ((*((void *)v4 + 39) & 0x80000000) != 0)
  {
LABEL_60:
    self->_supportsGuidanceEventsInlineShields = v4[296];
    *(void *)&self->_flags |= 0x80000000uLL;
  }
LABEL_61:
  abAssignInfo = self->_abAssignInfo;
  uint64_t v24 = *((void *)v4 + 12);
  if (abAssignInfo)
  {
    if (v24) {
      -[GEOAbAssignInfo mergeFrom:](abAssignInfo, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[GEOClientCapabilities setAbAssignInfo:](self, "setAbAssignInfo:");
  }
  requestTime = self->_requestTime;
  uint64_t v26 = *((void *)v4 + 26);
  if (requestTime)
  {
    if (v26) {
      -[GEOLocalTime mergeFrom:](requestTime, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[GEOClientCapabilities setRequestTime:](self, "setRequestTime:");
  }
  if ((*((void *)v4 + 39) & 0x20) != 0)
  {
    self->_maxZilchMessageVersionSupported = *((_DWORD *)v4 + 66);
    *(void *)&self->_flags |= 0x20uLL;
  }
  uint64_t v27 = objc_msgSend(v4, "supportedTransitFeaturesCount", (void)v48);
  if (v27)
  {
    uint64_t v28 = v27;
    for (uint64_t j = 0; j != v28; ++j)
      -[GEOClientCapabilities addSupportedTransitFeature:](self, "addSupportedTransitFeature:", [v4 supportedTransitFeatureAtIndex:j]);
  }
  uint64_t v30 = (uint64_t *)(v4 + 312);
  uint64_t v31 = *((void *)v4 + 39);
  if ((v31 & 0x80000) != 0)
  {
    self->_supportsArrivalMapRegion = v4[284];
    *(void *)&self->_flags |= 0x80000uLL;
    uint64_t v31 = *v30;
    if ((*v30 & 0x1000000000) == 0)
    {
LABEL_81:
      if ((v31 & 0x200000000) == 0) {
        goto LABEL_82;
      }
      goto LABEL_93;
    }
  }
  else if ((v31 & 0x1000000000) == 0)
  {
    goto LABEL_81;
  }
  self->_supportsNaturalGuidance = v4[301];
  *(void *)&self->_flags |= 0x1000000000uLL;
  uint64_t v31 = *((void *)v4 + 39);
  if ((v31 & 0x200000000) == 0)
  {
LABEL_82:
    if ((v31 & 0x400000) == 0) {
      goto LABEL_83;
    }
    goto LABEL_94;
  }
LABEL_93:
  self->_supportsJunctionView = v4[298];
  *(void *)&self->_flags |= 0x200000000uLL;
  uint64_t v31 = *((void *)v4 + 39);
  if ((v31 & 0x400000) == 0)
  {
LABEL_83:
    if ((v31 & 0x400000000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_95;
  }
LABEL_94:
  self->_supportsCongestionZones = v4[287];
  *(void *)&self->_flags |= 0x400000uLL;
  uint64_t v31 = *((void *)v4 + 39);
  if ((v31 & 0x400000000) == 0)
  {
LABEL_84:
    if ((v31 & 0x4000000) == 0) {
      goto LABEL_85;
    }
    goto LABEL_96;
  }
LABEL_95:
  self->_supportsLicensePlateRestrictions = v4[299];
  *(void *)&self->_flags |= 0x400000000uLL;
  uint64_t v31 = *((void *)v4 + 39);
  if ((v31 & 0x4000000) == 0)
  {
LABEL_85:
    if ((v31 & 0x40000000000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_97;
  }
LABEL_96:
  self->_supportsElectricVehicleRoutes = v4[291];
  *(void *)&self->_flags |= 0x4000000uLL;
  uint64_t v31 = *((void *)v4 + 39);
  if ((v31 & 0x40000000000) == 0)
  {
LABEL_86:
    if ((v31 & 0x200000000000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_87;
  }
LABEL_97:
  self->_supportsTrafficCameras = v4[307];
  *(void *)&self->_flags |= 0x40000000000uLL;
  if ((*((void *)v4 + 39) & 0x200000000000) != 0)
  {
LABEL_87:
    self->_supportsWaypointRoutes = v4[310];
    *(void *)&self->_flags |= 0x200000000000uLL;
  }
LABEL_88:
  localizationCapabilities = self->_localizationCapabilities;
  uint64_t v33 = *((void *)v4 + 24);
  if (localizationCapabilities)
  {
    if (v33) {
      -[GEOLocalizationCapabilities mergeFrom:](localizationCapabilities, "mergeFrom:");
    }
  }
  else if (v33)
  {
    -[GEOClientCapabilities setLocalizationCapabilities:](self, "setLocalizationCapabilities:");
  }
  if (*((void *)v4 + 18)) {
    -[GEOClientCapabilities setDeviceSku:](self, "setDeviceSku:");
  }
  if (*((void *)v4 + 25)) {
    -[GEOClientCapabilities setOsVersion:](self, "setOsVersion:");
  }
  uint64_t v34 = (uint64_t *)(v4 + 312);
  uint64_t v35 = *((void *)v4 + 39);
  if ((v35 & 0x400000000000) != 0)
  {
    self->_willSendEvDirectionsFeedbacuint64_t k = v4[311];
    *(void *)&self->_flags |= 0x400000000000uLL;
    uint64_t v35 = *v34;
    if ((*v34 & 0x2000000000) == 0)
    {
LABEL_107:
      if ((v35 & 0x20000000000) == 0) {
        goto LABEL_108;
      }
      goto LABEL_128;
    }
  }
  else if ((v35 & 0x2000000000) == 0)
  {
    goto LABEL_107;
  }
  self->_supportsRoadComplexities = v4[302];
  *(void *)&self->_flags |= 0x2000000000uLL;
  uint64_t v35 = *((void *)v4 + 39);
  if ((v35 & 0x20000000000) == 0)
  {
LABEL_108:
    if ((v35 & 0x80000000000) == 0) {
      goto LABEL_109;
    }
    goto LABEL_129;
  }
LABEL_128:
  self->_supportsSpeedTrapAnnouncements = v4[306];
  *(void *)&self->_flags |= 0x20000000000uLL;
  uint64_t v35 = *((void *)v4 + 39);
  if ((v35 & 0x80000000000) == 0)
  {
LABEL_109:
    if ((v35 & 0x40000) == 0) {
      goto LABEL_110;
    }
    goto LABEL_130;
  }
LABEL_129:
  self->_supportsUserIncidentReports = v4[308];
  *(void *)&self->_flags |= 0x80000000000uLL;
  uint64_t v35 = *((void *)v4 + 39);
  if ((v35 & 0x40000) == 0)
  {
LABEL_110:
    if ((v35 & 0x20000) == 0) {
      goto LABEL_111;
    }
    goto LABEL_131;
  }
LABEL_130:
  self->_supportsAreaEventsEnhancements = v4[283];
  *(void *)&self->_flags |= 0x40000uLL;
  uint64_t v35 = *((void *)v4 + 39);
  if ((v35 & 0x20000) == 0)
  {
LABEL_111:
    if ((v35 & 0x10000000000) == 0) {
      goto LABEL_112;
    }
    goto LABEL_132;
  }
LABEL_131:
  self->_supportsAdvancedMap = v4[282];
  *(void *)&self->_flags |= 0x20000uLL;
  uint64_t v35 = *((void *)v4 + 39);
  if ((v35 & 0x10000000000) == 0)
  {
LABEL_112:
    if ((v35 & 0x2000) == 0) {
      goto LABEL_113;
    }
    goto LABEL_133;
  }
LABEL_132:
  self->_supportsSilentRouteUpdates = v4[305];
  *(void *)&self->_flags |= 0x10000000000uLL;
  uint64_t v35 = *((void *)v4 + 39);
  if ((v35 & 0x2000) == 0)
  {
LABEL_113:
    if ((v35 & 0x40000000) == 0) {
      goto LABEL_114;
    }
    goto LABEL_134;
  }
LABEL_133:
  self->_replaceAccidentStringWithCrash = v4[278];
  *(void *)&self->_flags |= 0x2000uLL;
  uint64_t v35 = *((void *)v4 + 39);
  if ((v35 & 0x40000000) == 0)
  {
LABEL_114:
    if ((v35 & 0x20000000) == 0) {
      goto LABEL_115;
    }
    goto LABEL_135;
  }
LABEL_134:
  self->_supportsGuidanceEventPrivacyFilters = v4[295];
  *(void *)&self->_flags |= 0x40000000uLL;
  uint64_t v35 = *((void *)v4 + 39);
  if ((v35 & 0x20000000) == 0)
  {
LABEL_115:
    if ((v35 & 0x800) == 0) {
      goto LABEL_116;
    }
    goto LABEL_136;
  }
LABEL_135:
  self->_supportsGuidanceEventImportanceInfo = v4[294];
  *(void *)&self->_flags |= 0x20000000uLL;
  uint64_t v35 = *((void *)v4 + 39);
  if ((v35 & 0x800) == 0)
  {
LABEL_116:
    if ((v35 & 0x1000) == 0) {
      goto LABEL_118;
    }
    goto LABEL_117;
  }
LABEL_136:
  self->_isAdvancedMap = v4[276];
  *(void *)&self->_flags |= 0x800uLL;
  if ((*((void *)v4 + 39) & 0x1000) != 0)
  {
LABEL_117:
    self->_isGlobeProjection = v4[277];
    *(void *)&self->_flags |= 0x1000uLL;
  }
LABEL_118:
  uint64_t v36 = [v4 supportsMultipointRoutingsCount];
  if (v36)
  {
    uint64_t v37 = v36;
    for (uint64_t k = 0; k != v37; ++k)
      -[GEOClientCapabilities addSupportsMultipointRouting:](self, "addSupportsMultipointRouting:", [v4 supportsMultipointRoutingAtIndex:k]);
  }
  if ((*((void *)v4 + 39) & 0x800000) != 0)
  {
    self->_supportsDefaultToNewRouteFlag = v4[288];
    *(void *)&self->_flags |= 0x800000uLL;
  }
  walkingSupportedFeatures = self->_walkingSupportedFeatures;
  uint64_t v40 = *((void *)v4 + 28);
  if (walkingSupportedFeatures)
  {
    if (v40) {
      -[GEOWalkingSupportedFeatures mergeFrom:](walkingSupportedFeatures, "mergeFrom:");
    }
  }
  else if (v40)
  {
    -[GEOClientCapabilities setWalkingSupportedFeatures:](self, "setWalkingSupportedFeatures:");
  }
  NSUInteger v41 = (uint64_t *)(v4 + 312);
  uint64_t v42 = *((void *)v4 + 39);
  if ((v42 & 0x10) != 0)
  {
    self->_maxSupportedTransitFareVersion = *((_DWORD *)v4 + 65);
    *(void *)&self->_flags |= 0x10uLL;
    uint64_t v42 = *v41;
    if ((*v41 & 0x1000000) == 0)
    {
LABEL_142:
      if ((v42 & 0x200000) == 0) {
        goto LABEL_143;
      }
      goto LABEL_160;
    }
  }
  else if ((v42 & 0x1000000) == 0)
  {
    goto LABEL_142;
  }
  self->_supportsDisablingProgressBarFromBannerButtons = v4[289];
  *(void *)&self->_flags |= 0x1000000uLL;
  uint64_t v42 = *((void *)v4 + 39);
  if ((v42 & 0x200000) == 0)
  {
LABEL_143:
    if ((v42 & 0x8000000) == 0) {
      goto LABEL_144;
    }
    goto LABEL_161;
  }
LABEL_160:
  self->_supportsBannerQueuing = v4[286];
  *(void *)&self->_flags |= 0x200000uLL;
  uint64_t v42 = *((void *)v4 + 39);
  if ((v42 & 0x8000000) == 0)
  {
LABEL_144:
    if ((v42 & 0x8000000000) == 0) {
      goto LABEL_145;
    }
    goto LABEL_162;
  }
LABEL_161:
  self->_supportsEv2 = v4[292];
  *(void *)&self->_flags |= 0x8000000uLL;
  uint64_t v42 = *((void *)v4 + 39);
  if ((v42 & 0x8000000000) == 0)
  {
LABEL_145:
    if ((v42 & 0x100000000000) == 0) {
      goto LABEL_146;
    }
    goto LABEL_163;
  }
LABEL_162:
  self->_supportsRouteNameRanges = v4[304];
  *(void *)&self->_flags |= 0x8000000000uLL;
  uint64_t v42 = *((void *)v4 + 39);
  if ((v42 & 0x100000000000) == 0)
  {
LABEL_146:
    if ((v42 & 0x10000000) == 0) {
      goto LABEL_147;
    }
    goto LABEL_164;
  }
LABEL_163:
  self->_supportsWalkingSuggestionsAfterParking = v4[309];
  *(void *)&self->_flags |= 0x100000000000uLL;
  uint64_t v42 = *((void *)v4 + 39);
  if ((v42 & 0x10000000) == 0)
  {
LABEL_147:
    if ((v42 & 0x4000000000) == 0) {
      goto LABEL_148;
    }
    goto LABEL_165;
  }
LABEL_164:
  self->_supportsGenericCombinationsInstructionsForAllModes = v4[293];
  *(void *)&self->_flags |= 0x10000000uLL;
  uint64_t v42 = *((void *)v4 + 39);
  if ((v42 & 0x4000000000) == 0)
  {
LABEL_148:
    if ((v42 & 0x2000000) == 0) {
      goto LABEL_150;
    }
    goto LABEL_149;
  }
LABEL_165:
  self->_supportsRouteCameraInputUpdates = v4[303];
  *(void *)&self->_flags |= 0x4000000000uLL;
  if ((*((void *)v4 + 39) & 0x2000000) != 0)
  {
LABEL_149:
    self->_supportsDodgeballCameraInput = v4[290];
    *(void *)&self->_flags |= 0x2000000uLL;
  }
LABEL_150:
  uint64_t v43 = [v4 supportedElevationModelsCount];
  if (v43)
  {
    uint64_t v44 = v43;
    for (uint64_t m = 0; m != v44; ++m)
      -[GEOClientCapabilities addSupportedElevationModel:](self, "addSupportedElevationModel:", [v4 supportedElevationModelAtIndex:m]);
  }
  if ((*((void *)v4 + 39) & 0x10000) != 0)
  {
    self->_supportEmissionsTagging = v4[281];
    *(void *)&self->_flags |= 0x10000uLL;
  }
  artworkCapabilities = self->_artworkCapabilities;
  uint64_t v47 = *((void *)v4 + 16);
  if (artworkCapabilities)
  {
    if (v47) {
      -[GEOArtworkCapabilities mergeFrom:](artworkCapabilities, "mergeFrom:");
    }
  }
  else if (v47)
  {
    -[GEOClientCapabilities setArtworkCapabilities:](self, "setArtworkCapabilities:");
  }
  if ((*((void *)v4 + 39) & 0x100000) != 0)
  {
    self->_supportsBannerQueuingDirections = v4[285];
    *(void *)&self->_flags |= 0x100000uLL;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(void *)&self->_flags & 0x800000000000) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOClientCapabilitiesReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_912_0);
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
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char v6 = *((unsigned char *)&self->_flags + 8) | 0x10;
  *(void *)&self->_flags |= 0x800000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v6;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOClientCapabilities *)self readAll:0];
    [(GEOFormattedStringClientCapabilities *)self->_formattedStringClientCapabilities clearUnknownFields:1];
    [(GEOAdvisoryClientCapabilities *)self->_advisoryClientCapabilities clearUnknownFields:1];
    [(GEOAbAssignInfo *)self->_abAssignInfo clearUnknownFields:1];
    [(GEOLocalTime *)self->_requestTime clearUnknownFields:1];
    [(GEOLocalizationCapabilities *)self->_localizationCapabilities clearUnknownFields:1];
    [(GEOWalkingSupportedFeatures *)self->_walkingSupportedFeatures clearUnknownFields:1];
    artworkCapabilities = self->_artworkCapabilities;
    [(GEOArtworkCapabilities *)artworkCapabilities clearUnknownFields:1];
  }
}

@end