@interface GEOPDClientMetadata
+ (BOOL)isValid:(id)a3;
+ (Class)businessChatPreflightIdentifierType;
+ (Class)deviceHistoricalLocationType;
- (BOOL)enablePreflightVenues;
- (BOOL)hasAbBranchInfo;
- (BOOL)hasAbClientMetadata;
- (BOOL)hasAdditionalEnabledMarkets;
- (BOOL)hasClientRevision;
- (BOOL)hasDayOfWeek;
- (BOOL)hasDebugApiKey;
- (BOOL)hasDeviceCountryCode;
- (BOOL)hasDeviceDisplayLanguage;
- (BOOL)hasDeviceExtendedLocation;
- (BOOL)hasDeviceKeyboardLanguage;
- (BOOL)hasDeviceSku;
- (BOOL)hasDeviceSpokenLanguage;
- (BOOL)hasDisplayRegion;
- (BOOL)hasEnablePreflightVenues;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHourOfDay;
- (BOOL)hasLocalizationCapabilities;
- (BOOL)hasMapsSuggestionsTouristInfo;
- (BOOL)hasPreferredDisplayCurrencySymbol;
- (BOOL)hasPreferredDistanceUnit;
- (BOOL)hasRequiredVersion;
- (BOOL)hasResultListAttributionSupport;
- (BOOL)hasSiriUserConsentsForAnalysis;
- (BOOL)hasSupportEnrichment;
- (BOOL)hasTimeSinceMapEnteredForeground;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)siriUserConsentsForAnalysis;
- (BOOL)supportEnrichment;
- (GEOABBranchInfo)abBranchInfo;
- (GEOABSecondPartyPlaceRequestClientMetaData)abClientMetadata;
- (GEOAdditionalEnabledMarkets)additionalEnabledMarkets;
- (GEOLocalizationCapabilities)localizationCapabilities;
- (GEOLocation)deviceExtendedLocation;
- (GEOPDClientMetadata)init;
- (GEOPDClientMetadata)initWithData:(id)a3;
- (GEOPDClientMetadata)initWithDictionary:(id)a3;
- (GEOPDClientMetadata)initWithJSON:(id)a3;
- (GEOPDClientMetadata)initWithTraits:(id)a3;
- (GEOPDMapsSuggestionsTouristInfo)mapsSuggestionsTouristInfo;
- (NSMutableArray)businessChatPreflightIdentifiers;
- (NSMutableArray)deviceHistoricalLocations;
- (NSString)debugApiKey;
- (NSString)deviceCountryCode;
- (NSString)deviceDisplayLanguage;
- (NSString)deviceKeyboardLanguage;
- (NSString)deviceSku;
- (NSString)deviceSpokenLanguage;
- (NSString)displayRegion;
- (NSString)preferredDisplayCurrencySymbol;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)businessChatPreflightIdentifierAtIndex:(unint64_t)a3;
- (id)clientRevisionAsString:(int)a3;
- (id)clientRevisionsAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)deviceHistoricalLocationAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)knownClientResolvedTypeDeprecatedsAsString:(int)a3;
- (id)knownClientResolvedTypesAsString:(int)a3;
- (id)preferredDistanceUnitAsString:(int)a3;
- (id)requiredVersionAsString:(int)a3;
- (id)resultListAttributionSupportAsString:(int)a3;
- (id)supportedElevationModelsAsString:(int)a3;
- (id)supportedMapsResultTypesAsString:(int)a3;
- (int)StringAsClientRevision:(id)a3;
- (int)StringAsClientRevisions:(id)a3;
- (int)StringAsKnownClientResolvedTypeDeprecateds:(id)a3;
- (int)StringAsKnownClientResolvedTypes:(id)a3;
- (int)StringAsPreferredDistanceUnit:(id)a3;
- (int)StringAsRequiredVersion:(id)a3;
- (int)StringAsResultListAttributionSupport:(id)a3;
- (int)StringAsSupportedElevationModels:(id)a3;
- (int)StringAsSupportedMapsResultTypes:(id)a3;
- (int)clientRevision;
- (int)clientRevisions;
- (int)clientRevisionsAtIndex:(unint64_t)a3;
- (int)knownClientResolvedTypeAtIndex:(unint64_t)a3;
- (int)knownClientResolvedTypeDeprecatedAtIndex:(unint64_t)a3;
- (int)knownClientResolvedTypeDeprecateds;
- (int)knownClientResolvedTypes;
- (int)preferredDistanceUnit;
- (int)requiredVersion;
- (int)resultListAttributionSupport;
- (int)supportedElevationModelAtIndex:(unint64_t)a3;
- (int)supportedElevationModels;
- (int)supportedMapsResultTypeAtIndex:(unint64_t)a3;
- (int)supportedMapsResultTypes;
- (unint64_t)businessChatPreflightIdentifiersCount;
- (unint64_t)clientRevisionsCount;
- (unint64_t)deviceHistoricalLocationsCount;
- (unint64_t)hash;
- (unint64_t)knownClientResolvedTypeDeprecatedsCount;
- (unint64_t)knownClientResolvedTypesCount;
- (unint64_t)supportedElevationModelsCount;
- (unint64_t)supportedMapsResultTypesCount;
- (unsigned)dayOfWeek;
- (unsigned)hourOfDay;
- (unsigned)timeSinceMapEnteredForeground;
- (void)_addNoFlagsBusinessChatPreflightIdentifier:(uint64_t)a1;
- (void)_addNoFlagsDeviceHistoricalLocation:(uint64_t)a1;
- (void)_readAbBranchInfo;
- (void)_readAbClientMetadata;
- (void)_readAdditionalEnabledMarkets;
- (void)_readBusinessChatPreflightIdentifiers;
- (void)_readClientRevisions;
- (void)_readDebugApiKey;
- (void)_readDeviceCountryCode;
- (void)_readDeviceDisplayLanguage;
- (void)_readDeviceExtendedLocation;
- (void)_readDeviceHistoricalLocations;
- (void)_readDeviceKeyboardLanguage;
- (void)_readDeviceSku;
- (void)_readDeviceSpokenLanguage;
- (void)_readDisplayRegion;
- (void)_readKnownClientResolvedTypeDeprecateds;
- (void)_readKnownClientResolvedTypes;
- (void)_readLocalizationCapabilities;
- (void)_readMapsSuggestionsTouristInfo;
- (void)_readPreferredDisplayCurrencySymbol;
- (void)_readSupportedElevationModels;
- (void)_readSupportedMapsResultTypes;
- (void)addBusinessChatPreflightIdentifier:(id)a3;
- (void)addClientRevisions:(int)a3;
- (void)addDeviceHistoricalLocation:(id)a3;
- (void)addKnownClientResolvedType:(int)a3;
- (void)addKnownClientResolvedTypeDeprecated:(int)a3;
- (void)addSupportedElevationModel:(int)a3;
- (void)addSupportedMapsResultType:(int)a3;
- (void)clearBusinessChatPreflightIdentifiers;
- (void)clearClientRevisions;
- (void)clearDeviceHistoricalLocations;
- (void)clearKnownClientResolvedTypeDeprecateds;
- (void)clearKnownClientResolvedTypes;
- (void)clearLocations;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearSupportedElevationModels;
- (void)clearSupportedMapsResultTypes;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAbBranchInfo:(id)a3;
- (void)setAbClientMetadata:(id)a3;
- (void)setAdditionalEnabledMarkets:(id)a3;
- (void)setBusinessChatPreflightIdentifiers:(id)a3;
- (void)setClientRevision:(int)a3;
- (void)setClientRevisions:(int *)a3 count:(unint64_t)a4;
- (void)setDayOfWeek:(unsigned int)a3;
- (void)setDebugApiKey:(id)a3;
- (void)setDeviceCountryCode:(id)a3;
- (void)setDeviceDisplayLanguage:(id)a3;
- (void)setDeviceExtendedLocation:(id)a3;
- (void)setDeviceHistoricalLocations:(id)a3;
- (void)setDeviceKeyboardLanguage:(id)a3;
- (void)setDeviceSku:(id)a3;
- (void)setDeviceSpokenLanguage:(id)a3;
- (void)setDisplayRegion:(id)a3;
- (void)setEnablePreflightVenues:(BOOL)a3;
- (void)setHasClientRevision:(BOOL)a3;
- (void)setHasDayOfWeek:(BOOL)a3;
- (void)setHasEnablePreflightVenues:(BOOL)a3;
- (void)setHasHourOfDay:(BOOL)a3;
- (void)setHasPreferredDistanceUnit:(BOOL)a3;
- (void)setHasRequiredVersion:(BOOL)a3;
- (void)setHasResultListAttributionSupport:(BOOL)a3;
- (void)setHasSiriUserConsentsForAnalysis:(BOOL)a3;
- (void)setHasSupportEnrichment:(BOOL)a3;
- (void)setHasTimeSinceMapEnteredForeground:(BOOL)a3;
- (void)setHourOfDay:(unsigned int)a3;
- (void)setKnownClientResolvedTypeDeprecateds:(int *)a3 count:(unint64_t)a4;
- (void)setKnownClientResolvedTypes:(int *)a3 count:(unint64_t)a4;
- (void)setLocalizationCapabilities:(id)a3;
- (void)setMapsSuggestionsTouristInfo:(id)a3;
- (void)setPreferredDisplayCurrencySymbol:(id)a3;
- (void)setPreferredDistanceUnit:(int)a3;
- (void)setRequiredVersion:(int)a3;
- (void)setResultListAttributionSupport:(int)a3;
- (void)setSiriUserConsentsForAnalysis:(BOOL)a3;
- (void)setSupportEnrichment:(BOOL)a3;
- (void)setSupportedElevationModels:(int *)a3 count:(unint64_t)a4;
- (void)setSupportedMapsResultTypes:(int *)a3 count:(unint64_t)a4;
- (void)setTimeSinceMapEnteredForeground:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDClientMetadata

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDClientMetadata;
  [(GEOPDClientMetadata *)&v3 dealloc];
}

- (GEOPDClientMetadata)initWithTraits:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)GEOPDClientMetadata;
  v5 = [(GEOPDClientMetadata *)&v64 init];
  if (v5)
  {
    v6 = +[GEOAdditionalEnabledMarkets additionalEnabledMarkets];
    [(GEOPDClientMetadata *)v5 setAdditionalEnabledMarkets:v6];

    v7 = +[GEOCountryConfiguration sharedConfiguration];
    v8 = [v7 countryCode];
    [(GEOPDClientMetadata *)v5 setDeviceCountryCode:v8];

    v9 = +[GEOPlatform sharedPlatform];
    v10 = [v9 deviceCountrySKUForServiceRequests];
    [(GEOPDClientMetadata *)v5 setDeviceSku:v10];

    v11 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    v12 = [MEMORY[0x1E4F1C9C8] date];
    v13 = [v11 components:60 fromDate:v12];

    uint64_t v14 = [v11 dateFromComponents:v13];
    v53 = v13;
    uint64_t v15 = [v13 hour];
    v54 = v11;
    v52 = (void *)v14;
    LODWORD(v13) = [v11 ordinalityOfUnit:512 inUnit:4096 forDate:v14];
    [(GEOPDClientMetadata *)v5 setHourOfDay:v15];
    [(GEOPDClientMetadata *)v5 setDayOfWeek:(v13 - 1)];
    if ([v4 deviceDisplayLanguagesCount])
    {
      v16 = [v4 deviceDisplayLanguages];
      v17 = [v16 firstObject];
      [(GEOPDClientMetadata *)v5 setDeviceDisplayLanguage:v17];
    }
    if ([v4 hasDeviceKeyboardLocale])
    {
      v18 = [v4 deviceKeyboardLocale];
      [(GEOPDClientMetadata *)v5 setDeviceKeyboardLanguage:v18];
    }
    if ([v4 hasDisplayRegion])
    {
      v19 = [v4 displayRegion];
      [(GEOPDClientMetadata *)v5 setDisplayRegion:v19];
    }
    v20 = [v4 deviceLocation];

    if (v20)
    {
      v21 = [v4 deviceLocation];
      [(GEOPDClientMetadata *)v5 setDeviceExtendedLocation:v21];
    }
    if ([v4 hasDeviceSpokenLocale])
    {
      v22 = [v4 deviceSpokenLocale];
      [(GEOPDClientMetadata *)v5 setDeviceSpokenLanguage:v22];
    }
    if ([v4 hasTimeSinceMapEnteredForeground]) {
      -[GEOPDClientMetadata setTimeSinceMapEnteredForeground:](v5, "setTimeSinceMapEnteredForeground:", [v4 timeSinceMapEnteredForeground]);
    }
    [(GEOPDClientMetadata *)v5 setResultListAttributionSupport:1];
    [(GEOPDClientMetadata *)v5 setRequiredVersion:3];
    v23 = _getValue(GeoServicesConfig_PlaceDataDebugAPI, (uint64_t)off_1E9113A68, 1, 0, 0, 0);
    if ([v23 length]) {
      [(GEOPDClientMetadata *)v5 setDebugApiKey:v23];
    }
    if (GEOConfigGetBOOL(MapsFeaturesConfig_DrivingMultiWaypointRoutesEnabled, (uint64_t)off_1E9111D68)
      && [v4 navigating])
    {
      [(GEOPDClientMetadata *)v5 addKnownClientResolvedType:1];
      [(GEOPDClientMetadata *)v5 addKnownClientResolvedType:2];
      [(GEOPDClientMetadata *)v5 addKnownClientResolvedType:6];
    }
    else
    {
      -[GEOPDClientMetadata setKnownClientResolvedTypes:count:](v5, "setKnownClientResolvedTypes:count:", [v4 knownClientResolvedTypes], objc_msgSend(v4, "knownClientResolvedTypesCount"));
    }
    v51 = v23;
    v55 = v4;
    [(GEOPDClientMetadata *)v5 setEnablePreflightVenues:GEOConfigGetBOOL(GeoServicesConfig_VenuesPreflightEnabled, (uint64_t)off_1E91147E8)];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v24 = _getValue(GeoServicesConfig_BusinessChatPreflightIdentifiers, (uint64_t)off_1E9113AD8, 1, 0, 0, 0);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v65 objects:v73 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      v27 = 0;
      uint64_t v28 = *(void *)v66;
      v29 = MEMORY[0x1E4F14500];
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v66 != v28) {
            objc_enumerationMutation(v24);
          }
          uint64_t v31 = *(void *)(*((void *)&v65 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (!v27)
            {
              v27 = [MEMORY[0x1E4F1CA48] array];
            }
            [v27 addObject:v31];
          }
          else if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v32 = objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v72 = v32;
            id v33 = v32;
            _os_log_impl(&dword_188D96000, v29, OS_LOG_TYPE_ERROR, "Invalid business chat preflight identifier type: %{public}@", buf, 0xCu);
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v65 objects:v73 count:16];
      }
      while (v26);
    }
    else
    {
      v27 = 0;
    }

    uint64_t v34 = [v27 countByEnumeratingWithState:&v60 objects:v70 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v61 != v36) {
            objc_enumerationMutation(v27);
          }
          [(GEOPDClientMetadata *)v5 addBusinessChatPreflightIdentifier:*(void *)(*((void *)&v60 + 1) + 8 * j)];
        }
        uint64_t v35 = [v27 countByEnumeratingWithState:&v60 objects:v70 count:16];
      }
      while (v35);
    }

    v38 = objc_alloc_init(GEOLocalizationCapabilities);
    [(GEOLocalizationCapabilities *)v38 setSupportsLocalizedTrafficControlIcons:1];
    v39 = _getValue(GeoServicesConfig_LocalizationCapabilitiesSupportedPhoneticTypes, (uint64_t)off_1E9114A18, 1, 0, 0, 0);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v56 objects:v69 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v57;
      do
      {
        for (uint64_t k = 0; k != v41; ++k)
        {
          if (*(void *)v57 != v42) {
            objc_enumerationMutation(v39);
          }
          -[GEOLocalizationCapabilities addSupportedPhoneticType:](v38, "addSupportedPhoneticType:", [*(id *)(*((void *)&v56 + 1) + 8 * k) unsignedIntegerValue]);
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v56 objects:v69 count:16];
      }
      while (v41);
    }
    [(GEOPDClientMetadata *)v5 setLocalizationCapabilities:v38];
    [(GEOPDClientMetadata *)v5 addClientRevisions:10];
    [(GEOPDClientMetadata *)v5 addClientRevisions:11];
    [(GEOPDClientMetadata *)v5 addClientRevisions:30];
    [(GEOPDClientMetadata *)v5 addClientRevisions:29];
    [(GEOPDClientMetadata *)v5 addClientRevisions:31];
    [(GEOPDClientMetadata *)v5 addClientRevisions:33];
    [(GEOPDClientMetadata *)v5 addClientRevisions:39];
    [(GEOPDClientMetadata *)v5 addClientRevisions:40];
    if (GEOConfigGetBOOL(MapsFeaturesConfig_HikingWatchEnabled, (uint64_t)off_1E9111E28)) {
      [(GEOPDClientMetadata *)v5 addClientRevisions:32];
    }
    [(GEOPDClientMetadata *)v5 addClientRevisions:34];
    id v4 = v55;
    if (GEOConfigGetBOOL(MapsFeaturesConfig_FlexibleActionLinksEnabled, (uint64_t)off_1E9111EE8)) {
      [(GEOPDClientMetadata *)v5 addClientRevisions:37];
    }
    if (GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1E9111EB8)) {
      [(GEOPDClientMetadata *)v5 addClientRevisions:35];
    }
    if (GEOConfigGetBOOL(MapsFeaturesConfig_HikingiOSEnabled, (uint64_t)off_1E9111E38)) {
      [(GEOPDClientMetadata *)v5 addClientRevisions:38];
    }
    v44 = [MEMORY[0x1E4F1CA20] currentLocale];
    v45 = [v44 objectForKey:*MEMORY[0x1E4F1C490]];
    int v46 = [v45 BOOLValue];

    if (v46) {
      uint64_t v47 = 1;
    }
    else {
      uint64_t v47 = 2;
    }
    [(GEOPDClientMetadata *)v5 setPreferredDistanceUnit:v47];
    if ([v55 hasCurrentLocaleCurrencySymbol])
    {
      v48 = [v55 currentLocaleCurrencySymbol];
      [(GEOPDClientMetadata *)v5 setPreferredDisplayCurrencySymbol:v48];
    }
    if (GEOConfigGetBOOL(MapsFeaturesConfig_MyPlacesFeatures, (uint64_t)off_1E9111EC8)) {
      [(GEOPDClientMetadata *)v5 addClientRevisions:36];
    }
    if (GEOConfigGetBOOL(GeoServicesConfig_ShouldRequestWGS84Elevations, (uint64_t)off_1E9114F78)) {
      [(GEOPDClientMetadata *)v5 addSupportedElevationModel:1];
    }
    [(GEOPDClientMetadata *)v5 addSupportedElevationModel:0];
    v49 = v5;
  }
  return v5;
}

- (void)addClientRevisions:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000uLL;
}

- (void)_readClientRevisions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 317) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientRevisions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (void)setResultListAttributionSupport:(int)a3
{
  *(void *)&self->_flags |= 0x100000020uLL;
  self->_resultListAttributionSupport = a3;
}

- (void)setRequiredVersion:(int)a3
{
  *(void *)&self->_flags |= 0x100000010uLL;
  self->_requiredVersion = a3;
}

- (void)setEnablePreflightVenues:(BOOL)a3
{
  *(void *)&self->_flags |= 0x100000080uLL;
  self->_enablePreflightVenues = a3;
}

- (void)setAdditionalEnabledMarkets:(id)a3
{
  *(void *)&self->_flags |= 0x100040000uLL;
  objc_storeStrong((id *)&self->_additionalEnabledMarkets, a3);
}

- (void)setPreferredDistanceUnit:(int)a3
{
  *(void *)&self->_flags |= 0x100000008uLL;
  self->_preferredDistanceUnit = a3;
}

- (void)setLocalizationCapabilities:(id)a3
{
  *(void *)&self->_flags |= 0x120000000uLL;
  objc_storeStrong((id *)&self->_localizationCapabilities, a3);
}

- (void)setKnownClientResolvedTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000uLL;

  MEMORY[0x1F4147390](&self->_knownClientResolvedTypes, a3, a4);
}

- (void)setHourOfDay:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x100000004uLL;
  self->_hourOfDay = a3;
}

- (void)setDeviceSku:(id)a3
{
  *(void *)&self->_flags |= 0x104000000uLL;
  objc_storeStrong((id *)&self->_deviceSku, a3);
}

- (void)setDeviceCountryCode:(id)a3
{
  *(void *)&self->_flags |= 0x100200000uLL;
  objc_storeStrong((id *)&self->_deviceCountryCode, a3);
}

- (void)setDayOfWeek:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x100000002uLL;
  self->_dayOfWeeuint64_t k = a3;
}

- (void)addSupportedElevationModel:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000uLL;
}

- (void)_readSupportedElevationModels
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 317) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedElevationModels_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (void)setDisplayRegion:(id)a3
{
  *(void *)&self->_flags |= 0x110000000uLL;
  objc_storeStrong((id *)&self->_displayRegion, a3);
}

- (void)setDeviceDisplayLanguage:(id)a3
{
  *(void *)&self->_flags |= 0x100400000uLL;
  objc_storeStrong((id *)&self->_deviceDisplayLanguage, a3);
}

- (void)setSupportEnrichment:(BOOL)a3
{
  *(void *)&self->_flags |= 0x100000200uLL;
  self->_supportEnrichment = a3;
}

- (void)addSupportedMapsResultType:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000uLL;
}

- (void)_readSupportedMapsResultTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 317) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedMapsResultTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (void)setAbClientMetadata:(id)a3
{
  *(void *)&self->_flags |= 0x100020000uLL;
  objc_storeStrong((id *)&self->_abClientMetadata, a3);
}

- (void)setBusinessChatPreflightIdentifiers:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000uLL;
  businessChatPreflightIdentifiers = self->_businessChatPreflightIdentifiers;
  self->_businessChatPreflightIdentifiers = v4;
}

- (int)resultListAttributionSupport
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $F32854447752F5D8BD00F9C7283039A2 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x20) != 0) {
    return self->_resultListAttributionSupport;
  }
  else {
    return 0;
  }
}

- (int)requiredVersion
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $F32854447752F5D8BD00F9C7283039A2 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x10) != 0) {
    return self->_requiredVersion;
  }
  else {
    return 1;
  }
}

- (BOOL)enablePreflightVenues
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $F32854447752F5D8BD00F9C7283039A2 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(unsigned char *)&flags & 0x80) != 0 && self->_enablePreflightVenues;
}

- (NSMutableArray)businessChatPreflightIdentifiers
{
  -[GEOPDClientMetadata _readBusinessChatPreflightIdentifiers]((uint64_t)self);
  businessChatPreflightIdentifiers = self->_businessChatPreflightIdentifiers;

  return businessChatPreflightIdentifiers;
}

- (void)_readBusinessChatPreflightIdentifiers
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 318) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBusinessChatPreflightIdentifiers_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (GEOAdditionalEnabledMarkets)additionalEnabledMarkets
{
  -[GEOPDClientMetadata _readAdditionalEnabledMarkets]((uint64_t)self);
  additionalEnabledMarkets = self->_additionalEnabledMarkets;

  return additionalEnabledMarkets;
}

- (void)_readAdditionalEnabledMarkets
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 318) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAdditionalEnabledMarkets_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (void)setTimeSinceMapEnteredForeground:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x100000040uLL;
  self->_timeSinceMapEnteredForeground = a3;
}

- (void)setPreferredDisplayCurrencySymbol:(id)a3
{
  *(void *)&self->_flags |= 0x180000000uLL;
  objc_storeStrong((id *)&self->_preferredDisplayCurrencySymbol, a3);
}

- (void)setDeviceSpokenLanguage:(id)a3
{
  *(void *)&self->_flags |= 0x108000000uLL;
  objc_storeStrong((id *)&self->_deviceSpokenLanguage, a3);
}

- (void)setDeviceKeyboardLanguage:(id)a3
{
  *(void *)&self->_flags |= 0x102000000uLL;
  objc_storeStrong((id *)&self->_deviceKeyboardLanguage, a3);
}

- (void)setDeviceExtendedLocation:(id)a3
{
  *(void *)&self->_flags |= 0x100800000uLL;
  objc_storeStrong((id *)&self->_deviceExtendedLocation, a3);
}

- (GEOPDClientMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDClientMetadata;
  v2 = [(GEOPDClientMetadata *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOLocation)deviceExtendedLocation
{
  -[GEOPDClientMetadata _readDeviceExtendedLocation]((uint64_t)self);
  deviceExtendedLocation = self->_deviceExtendedLocation;

  return deviceExtendedLocation;
}

- (void)_readDeviceExtendedLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 318) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceExtendedLocation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (void)_readDeviceHistoricalLocations
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 319) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceHistoricalLocations_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasDeviceExtendedLocation
{
  return self->_deviceExtendedLocation != 0;
}

- (NSMutableArray)deviceHistoricalLocations
{
  -[GEOPDClientMetadata _readDeviceHistoricalLocations]((uint64_t)self);
  deviceHistoricalLocations = self->_deviceHistoricalLocations;

  return deviceHistoricalLocations;
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 4) & 1) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDClientMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_38;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDClientMetadata *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_deviceCountryCode copyWithZone:a3];
  v10 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v9;

  uint64_t v11 = [(NSString *)self->_deviceDisplayLanguage copyWithZone:a3];
  v12 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v11;

  uint64_t v13 = [(NSString *)self->_deviceKeyboardLanguage copyWithZone:a3];
  uint64_t v14 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v13;

  uint64_t v15 = [(NSString *)self->_deviceSpokenLanguage copyWithZone:a3];
  v16 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = v15;

  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 308) = self->_timeSinceMapEnteredForeground;
    *(void *)(v5 + 316) |= 0x40uLL;
  }
  id v17 = [(GEOAdditionalEnabledMarkets *)self->_additionalEnabledMarkets copyWithZone:a3];
  v18 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v17;

  $F32854447752F5D8BD00F9C7283039A2 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) == 0)
  {
    if ((*(unsigned char *)&flags & 4) == 0) {
      goto LABEL_9;
    }
LABEL_40:
    *(_DWORD *)(v5 + 292) = self->_hourOfDay;
    *(void *)(v5 + 316) |= 4uLL;
    if ((*(void *)&self->_flags & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  *(_DWORD *)(v5 + 304) = self->_resultListAttributionSupport;
  *(void *)(v5 + 316) |= 0x20uLL;
  $F32854447752F5D8BD00F9C7283039A2 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) != 0) {
    goto LABEL_40;
  }
LABEL_9:
  if ((*(unsigned char *)&flags & 2) != 0)
  {
LABEL_10:
    *(_DWORD *)(v5 + 288) = self->_dayOfWeek;
    *(void *)(v5 + 316) |= 2uLL;
  }
LABEL_11:
  id v20 = [(GEOLocation *)self->_deviceExtendedLocation copyWithZone:a3];
  v21 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v20;

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v22 = self->_deviceHistoricalLocations;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v55 objects:v60 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v56 != v24) {
          objc_enumerationMutation(v22);
        }
        uint64_t v26 = (void *)[*(id *)(*((void *)&v55 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addDeviceHistoricalLocation:v26];
      }
      uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v55 objects:v60 count:16];
    }
    while (v23);
  }

  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 300) = self->_requiredVersion;
    *(void *)(v5 + 316) |= 0x10uLL;
  }
  uint64_t v27 = [(NSString *)self->_debugApiKey copyWithZone:a3];
  uint64_t v28 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v27;

  PBRepeatedInt32Copy();
  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 312) = self->_enablePreflightVenues;
    *(void *)(v5 + 316) |= 0x80uLL;
  }
  PBRepeatedInt32Copy();
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v29 = self->_businessChatPreflightIdentifiers;
  uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v52 != v31) {
          objc_enumerationMutation(v29);
        }
        id v33 = objc_msgSend(*(id *)(*((void *)&v51 + 1) + 8 * j), "copyWithZone:", a3, (void)v51);
        [(id)v5 addBusinessChatPreflightIdentifier:v33];
      }
      uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v51 objects:v59 count:16];
    }
    while (v30);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 284) = self->_clientRevision;
    *(void *)(v5 + 316) |= 1uLL;
  }
  id v34 = -[GEOLocalizationCapabilities copyWithZone:](self->_localizationCapabilities, "copyWithZone:", a3, (void)v51);
  uint64_t v35 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = v34;

  uint64_t v36 = [(NSString *)self->_deviceSku copyWithZone:a3];
  v37 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v36;

  if (*((unsigned char *)&self->_flags + 1))
  {
    *(unsigned char *)(v5 + 313) = self->_siriUserConsentsForAnalysis;
    *(void *)(v5 + 316) |= 0x100uLL;
  }
  PBRepeatedInt32Copy();
  id v38 = [(GEOPDMapsSuggestionsTouristInfo *)self->_mapsSuggestionsTouristInfo copyWithZone:a3];
  v39 = *(void **)(v5 + 256);
  *(void *)(v5 + 256) = v38;

  PBRepeatedInt32Copy();
  uint64_t v40 = [(NSString *)self->_preferredDisplayCurrencySymbol copyWithZone:a3];
  uint64_t v41 = *(void **)(v5 + 264);
  *(void *)(v5 + 264) = v40;

  uint64_t v42 = [(NSString *)self->_displayRegion copyWithZone:a3];
  v43 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v42;

  $F32854447752F5D8BD00F9C7283039A2 v44 = self->_flags;
  if ((*(_WORD *)&v44 & 0x200) != 0)
  {
    *(unsigned char *)(v5 + 314) = self->_supportEnrichment;
    *(void *)(v5 + 316) |= 0x200uLL;
    $F32854447752F5D8BD00F9C7283039A2 v44 = self->_flags;
  }
  if ((*(unsigned char *)&v44 & 8) != 0)
  {
    *(_DWORD *)(v5 + 296) = self->_preferredDistanceUnit;
    *(void *)(v5 + 316) |= 8uLL;
  }
  PBRepeatedInt32Copy();
  id v45 = [(GEOABSecondPartyPlaceRequestClientMetaData *)self->_abClientMetadata copyWithZone:a3];
  int v46 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v45;

  id v47 = [(GEOABBranchInfo *)self->_abBranchInfo copyWithZone:a3];
  v48 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v47;

  v49 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v49;
LABEL_38:

  return (id)v5;
}

- (void)writeTo:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDClientMetadataIsDirty((uint64_t)self) & 1) == 0)
  {
    v21 = self->_reader;
    objc_sync_enter(v21);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v22 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v22];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v21);
    goto LABEL_85;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDClientMetadata *)self readAll:0];
  if (self->_deviceCountryCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceDisplayLanguage) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceKeyboardLanguage) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceSpokenLanguage) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_additionalEnabledMarkets) {
    PBDataWriterWriteSubmessage();
  }
  $F32854447752F5D8BD00F9C7283039A2 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) == 0)
  {
    if ((*(unsigned char *)&flags & 4) == 0) {
      goto LABEL_17;
    }
LABEL_82:
    PBDataWriterWriteUint32Field();
    if ((*(void *)&self->_flags & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  PBDataWriterWriteInt32Field();
  $F32854447752F5D8BD00F9C7283039A2 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) != 0) {
    goto LABEL_82;
  }
LABEL_17:
  if ((*(unsigned char *)&flags & 2) != 0) {
LABEL_18:
  }
    PBDataWriterWriteUint32Field();
LABEL_19:
  if (self->_deviceExtendedLocation) {
    PBDataWriterWriteSubmessage();
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v7 = self->_deviceHistoricalLocations;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
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
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v8);
  }

  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_debugApiKey) {
    PBDataWriterWriteStringField();
  }
  if (self->_knownClientResolvedTypeDeprecateds.count)
  {
    unint64_t v11 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v11;
    }
    while (v11 < self->_knownClientResolvedTypeDeprecateds.count);
  }
  if ((*(unsigned char *)&self->_flags & 0x80) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_knownClientResolvedTypes.count)
  {
    unint64_t v12 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v12;
    }
    while (v12 < self->_knownClientResolvedTypes.count);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v13 = self->_businessChatPreflightIdentifiers;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v14);
  }

  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_localizationCapabilities) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_deviceSku) {
    PBDataWriterWriteStringField();
  }
  if (*((unsigned char *)&self->_flags + 1)) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_supportedMapsResultTypes.count)
  {
    unint64_t v17 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v17;
    }
    while (v17 < self->_supportedMapsResultTypes.count);
  }
  if (self->_mapsSuggestionsTouristInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_clientRevisions.count)
  {
    PBDataWriterPlaceMark();
    if (self->_clientRevisions.count)
    {
      unint64_t v18 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v18;
      }
      while (v18 < self->_clientRevisions.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_preferredDisplayCurrencySymbol) {
    PBDataWriterWriteStringField();
  }
  if (self->_displayRegion) {
    PBDataWriterWriteStringField();
  }
  $F32854447752F5D8BD00F9C7283039A2 v19 = self->_flags;
  if ((*(_WORD *)&v19 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    $F32854447752F5D8BD00F9C7283039A2 v19 = self->_flags;
  }
  if ((*(unsigned char *)&v19 & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_supportedElevationModels.count)
  {
    unint64_t v20 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v20;
    }
    while (v20 < self->_supportedElevationModels.count);
  }
  if (self->_abClientMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_abBranchInfo) {
    PBDataWriterWriteSubmessage();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
LABEL_85:
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_542;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_543;
    }
    GEOPDClientMetadataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDClientMetadataCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredDisplayCurrencySymbol, 0);
  objc_storeStrong((id *)&self->_mapsSuggestionsTouristInfo, 0);
  objc_storeStrong((id *)&self->_localizationCapabilities, 0);
  objc_storeStrong((id *)&self->_displayRegion, 0);
  objc_storeStrong((id *)&self->_deviceSpokenLanguage, 0);
  objc_storeStrong((id *)&self->_deviceSku, 0);
  objc_storeStrong((id *)&self->_deviceKeyboardLanguage, 0);
  objc_storeStrong((id *)&self->_deviceHistoricalLocations, 0);
  objc_storeStrong((id *)&self->_deviceExtendedLocation, 0);
  objc_storeStrong((id *)&self->_deviceDisplayLanguage, 0);
  objc_storeStrong((id *)&self->_deviceCountryCode, 0);
  objc_storeStrong((id *)&self->_debugApiKey, 0);
  objc_storeStrong((id *)&self->_businessChatPreflightIdentifiers, 0);
  objc_storeStrong((id *)&self->_additionalEnabledMarkets, 0);
  objc_storeStrong((id *)&self->_abClientMetadata, 0);
  objc_storeStrong((id *)&self->_abBranchInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDClientMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDClientMetadata;
  BOOL v3 = [(GEOPDClientMetadata *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readDeviceCountryCode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 318) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceCountryCode_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasDeviceCountryCode
{
  return self->_deviceCountryCode != 0;
}

- (NSString)deviceCountryCode
{
  -[GEOPDClientMetadata _readDeviceCountryCode]((uint64_t)self);
  deviceCountryCode = self->_deviceCountryCode;

  return deviceCountryCode;
}

- (void)_readDeviceDisplayLanguage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 318) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceDisplayLanguage_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasDeviceDisplayLanguage
{
  return self->_deviceDisplayLanguage != 0;
}

- (NSString)deviceDisplayLanguage
{
  -[GEOPDClientMetadata _readDeviceDisplayLanguage]((uint64_t)self);
  deviceDisplayLanguage = self->_deviceDisplayLanguage;

  return deviceDisplayLanguage;
}

- (void)_readDeviceKeyboardLanguage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 319) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceKeyboardLanguage_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasDeviceKeyboardLanguage
{
  return self->_deviceKeyboardLanguage != 0;
}

- (NSString)deviceKeyboardLanguage
{
  -[GEOPDClientMetadata _readDeviceKeyboardLanguage]((uint64_t)self);
  deviceKeyboardLanguage = self->_deviceKeyboardLanguage;

  return deviceKeyboardLanguage;
}

- (void)_readDeviceSpokenLanguage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 319) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceSpokenLanguage_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasDeviceSpokenLanguage
{
  return self->_deviceSpokenLanguage != 0;
}

- (NSString)deviceSpokenLanguage
{
  -[GEOPDClientMetadata _readDeviceSpokenLanguage]((uint64_t)self);
  deviceSpokenLanguage = self->_deviceSpokenLanguage;

  return deviceSpokenLanguage;
}

- (unsigned)timeSinceMapEnteredForeground
{
  return self->_timeSinceMapEnteredForeground;
}

- (void)setHasTimeSinceMapEnteredForeground:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100000040;
  }
  self->_$F32854447752F5D8BD00F9C7283039A2 flags = ($F32854447752F5D8BD00F9C7283039A2)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasTimeSinceMapEnteredForeground
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (BOOL)hasAdditionalEnabledMarkets
{
  return self->_additionalEnabledMarkets != 0;
}

- (void)setHasResultListAttributionSupport:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100000020;
  }
  self->_$F32854447752F5D8BD00F9C7283039A2 flags = ($F32854447752F5D8BD00F9C7283039A2)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasResultListAttributionSupport
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (id)resultListAttributionSupportAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = @"MULTIPLE_ATTRIBUTIONS";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v4 = @"SINGLE_ATTRIBUTION";
  }
  return v4;
}

- (int)StringAsResultListAttributionSupport:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SINGLE_ATTRIBUTION"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"MULTIPLE_ATTRIBUTIONS"];
  }

  return v4;
}

- (unsigned)hourOfDay
{
  return self->_hourOfDay;
}

- (void)setHasHourOfDay:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100000004;
  }
  self->_$F32854447752F5D8BD00F9C7283039A2 flags = ($F32854447752F5D8BD00F9C7283039A2)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasHourOfDay
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unsigned)dayOfWeek
{
  return self->_dayOfWeek;
}

- (void)setHasDayOfWeek:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100000002;
  }
  self->_$F32854447752F5D8BD00F9C7283039A2 flags = ($F32854447752F5D8BD00F9C7283039A2)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasDayOfWeek
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)setDeviceHistoricalLocations:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000uLL;
  deviceHistoricalLocations = self->_deviceHistoricalLocations;
  self->_deviceHistoricalLocations = v4;
}

- (void)clearDeviceHistoricalLocations
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000uLL;
  deviceHistoricalLocations = self->_deviceHistoricalLocations;

  [(NSMutableArray *)deviceHistoricalLocations removeAllObjects];
}

- (void)addDeviceHistoricalLocation:(id)a3
{
  id v4 = a3;
  -[GEOPDClientMetadata _readDeviceHistoricalLocations]((uint64_t)self);
  -[GEOPDClientMetadata _addNoFlagsDeviceHistoricalLocation:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000uLL;
}

- (void)_addNoFlagsDeviceHistoricalLocation:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 208);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 208);
      *(void *)(a1 + 208) = v5;

      id v4 = *(void **)(a1 + 208);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)deviceHistoricalLocationsCount
{
  -[GEOPDClientMetadata _readDeviceHistoricalLocations]((uint64_t)self);
  deviceHistoricalLocations = self->_deviceHistoricalLocations;

  return [(NSMutableArray *)deviceHistoricalLocations count];
}

- (id)deviceHistoricalLocationAtIndex:(unint64_t)a3
{
  -[GEOPDClientMetadata _readDeviceHistoricalLocations]((uint64_t)self);
  deviceHistoricalLocations = self->_deviceHistoricalLocations;

  return (id)[(NSMutableArray *)deviceHistoricalLocations objectAtIndex:a3];
}

+ (Class)deviceHistoricalLocationType
{
  return (Class)objc_opt_class();
}

- (void)setHasRequiredVersion:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100000010;
  }
  self->_$F32854447752F5D8BD00F9C7283039A2 flags = ($F32854447752F5D8BD00F9C7283039A2)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasRequiredVersion
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)requiredVersionAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E6728[a3 - 1];
  }

  return v3;
}

- (int)StringAsRequiredVersion:(id)a3
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

- (void)_readDebugApiKey
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 318) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDebugApiKey_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasDebugApiKey
{
  return self->_debugApiKey != 0;
}

- (NSString)debugApiKey
{
  -[GEOPDClientMetadata _readDebugApiKey]((uint64_t)self);
  debugApiKey = self->_debugApiKey;

  return debugApiKey;
}

- (void)setDebugApiKey:(id)a3
{
  *(void *)&self->_flags |= 0x100100000uLL;
  objc_storeStrong((id *)&self->_debugApiKey, a3);
}

- (void)_readKnownClientResolvedTypeDeprecateds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 317) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readKnownClientResolvedTypeDeprecateds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (unint64_t)knownClientResolvedTypeDeprecatedsCount
{
  return self->_knownClientResolvedTypeDeprecateds.count;
}

- (int)knownClientResolvedTypeDeprecateds
{
  return self->_knownClientResolvedTypeDeprecateds.list;
}

- (void)clearKnownClientResolvedTypeDeprecateds
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000uLL;

  PBRepeatedInt32Clear();
}

- (void)addKnownClientResolvedTypeDeprecated:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000uLL;
}

- (int)knownClientResolvedTypeDeprecatedAtIndex:(unint64_t)a3
{
  -[GEOPDClientMetadata _readKnownClientResolvedTypeDeprecateds]((uint64_t)self);
  p_knownClientResolvedTypeDeprecateds = &self->_knownClientResolvedTypeDeprecateds;
  unint64_t count = self->_knownClientResolvedTypeDeprecateds.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_knownClientResolvedTypeDeprecateds->list[a3];
}

- (void)setKnownClientResolvedTypeDeprecateds:(int *)a3 count:(unint64_t)a4
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000uLL;

  MEMORY[0x1F4147390](&self->_knownClientResolvedTypeDeprecateds, a3, a4);
}

- (id)knownClientResolvedTypeDeprecatedsAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E6740[a3];
  }

  return v3;
}

- (int)StringAsKnownClientResolvedTypeDeprecateds:(id)a3
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

- (void)setHasEnablePreflightVenues:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100000080;
  }
  self->_$F32854447752F5D8BD00F9C7283039A2 flags = ($F32854447752F5D8BD00F9C7283039A2)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasEnablePreflightVenues
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (void)_readKnownClientResolvedTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 317) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readKnownClientResolvedTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (unint64_t)knownClientResolvedTypesCount
{
  return self->_knownClientResolvedTypes.count;
}

- (int)knownClientResolvedTypes
{
  return self->_knownClientResolvedTypes.list;
}

- (void)clearKnownClientResolvedTypes
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000uLL;

  PBRepeatedInt32Clear();
}

- (void)addKnownClientResolvedType:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000uLL;
}

- (int)knownClientResolvedTypeAtIndex:(unint64_t)a3
{
  -[GEOPDClientMetadata _readKnownClientResolvedTypes]((uint64_t)self);
  p_knownClientResolvedTypes = &self->_knownClientResolvedTypes;
  unint64_t count = self->_knownClientResolvedTypes.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_knownClientResolvedTypes->list[a3];
}

- (id)knownClientResolvedTypesAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E6740[a3];
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

- (void)clearBusinessChatPreflightIdentifiers
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000uLL;
  businessChatPreflightIdentifiers = self->_businessChatPreflightIdentifiers;

  [(NSMutableArray *)businessChatPreflightIdentifiers removeAllObjects];
}

- (void)addBusinessChatPreflightIdentifier:(id)a3
{
  id v4 = a3;
  -[GEOPDClientMetadata _readBusinessChatPreflightIdentifiers]((uint64_t)self);
  -[GEOPDClientMetadata _addNoFlagsBusinessChatPreflightIdentifier:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x100000000uLL;
}

- (void)_addNoFlagsBusinessChatPreflightIdentifier:(uint64_t)a1
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

- (unint64_t)businessChatPreflightIdentifiersCount
{
  -[GEOPDClientMetadata _readBusinessChatPreflightIdentifiers]((uint64_t)self);
  businessChatPreflightIdentifiers = self->_businessChatPreflightIdentifiers;

  return [(NSMutableArray *)businessChatPreflightIdentifiers count];
}

- (id)businessChatPreflightIdentifierAtIndex:(unint64_t)a3
{
  -[GEOPDClientMetadata _readBusinessChatPreflightIdentifiers]((uint64_t)self);
  businessChatPreflightIdentifiers = self->_businessChatPreflightIdentifiers;

  return (id)[(NSMutableArray *)businessChatPreflightIdentifiers objectAtIndex:a3];
}

+ (Class)businessChatPreflightIdentifierType
{
  return (Class)objc_opt_class();
}

- (int)clientRevision
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $F32854447752F5D8BD00F9C7283039A2 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (*(unsigned char *)&flags) {
    return self->_clientRevision;
  }
  else {
    return 0;
  }
}

- (void)setClientRevision:(int)a3
{
  *(void *)&self->_flags |= 0x100000001uLL;
  self->_clientRevision = a3;
}

- (void)setHasClientRevision:(BOOL)a3
{
  self->_$F32854447752F5D8BD00F9C7283039A2 flags = ($F32854447752F5D8BD00F9C7283039A2)(*(void *)&self->_flags & 0xFFFFFFFEFFFFFFFELL | a3 | 0x100000000);
}

- (BOOL)hasClientRevision
{
  return *(_DWORD *)&self->_flags & 1;
}

- (id)clientRevisionAsString:(int)a3
{
  if a3 < 0x29 && ((0x1FFE0100DFFuLL >> a3))
  {
    id v3 = off_1E53E6778[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (int)StringAsClientRevision:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CLIENT_REVISION_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_PERMANENTLY_CLOSED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_BASEMAP_ID"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_APPCLIPS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_APPLE_RATINGS_PHOTOS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_ENHANCED_PLACEMENTS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_ADDRESS_CLUSTER"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_COARSE_LOCATION"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_SIRI_TRAFFIC_INCIDENTS"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_AZUL_RELEASE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_SMART_CARD_DYNAMIC_LAYOUT"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_SKY_RELEASE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_UNIFIED_ACTION_ROW"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_SYDNEY_RELEASE"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_YELP_PHOTO_COMMINGLE"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_HIKING_DATA"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_REALTIME_EV_CHARGING"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_OFFLINE_DATA"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_INTERLEAVED_GUIDES_IN_SEARCH_RESULTS"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_SAVE_BUTTON"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_FLEXIBLE_ACTION_LINK"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_HIKE_ROUTE"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_SINGLE_GUIDE_FOR_GUIDES_HOME"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_MULTIPLE_SEARCH_HOME_SECTIONS_OF_SAME_TYPE"])
  {
    int v4 = 40;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readLocalizationCapabilities
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 319) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizationCapabilities_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasLocalizationCapabilities
{
  return self->_localizationCapabilities != 0;
}

- (GEOLocalizationCapabilities)localizationCapabilities
{
  -[GEOPDClientMetadata _readLocalizationCapabilities]((uint64_t)self);
  localizationCapabilities = self->_localizationCapabilities;

  return localizationCapabilities;
}

- (void)_readDeviceSku
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 319) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceSku_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasDeviceSku
{
  return self->_deviceSku != 0;
}

- (NSString)deviceSku
{
  -[GEOPDClientMetadata _readDeviceSku]((uint64_t)self);
  deviceSku = self->_deviceSku;

  return deviceSku;
}

- (BOOL)siriUserConsentsForAnalysis
{
  return self->_siriUserConsentsForAnalysis;
}

- (void)setSiriUserConsentsForAnalysis:(BOOL)a3
{
  *(void *)&self->_flags |= 0x100000100uLL;
  self->_siriUserConsentsForAnalysis = a3;
}

- (void)setHasSiriUserConsentsForAnalysis:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100000100;
  }
  self->_$F32854447752F5D8BD00F9C7283039A2 flags = ($F32854447752F5D8BD00F9C7283039A2)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasSiriUserConsentsForAnalysis
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (unint64_t)supportedMapsResultTypesCount
{
  return self->_supportedMapsResultTypes.count;
}

- (int)supportedMapsResultTypes
{
  return self->_supportedMapsResultTypes.list;
}

- (void)clearSupportedMapsResultTypes
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000uLL;

  PBRepeatedInt32Clear();
}

- (int)supportedMapsResultTypeAtIndex:(unint64_t)a3
{
  -[GEOPDClientMetadata _readSupportedMapsResultTypes]((uint64_t)self);
  p_supportedMapsResultTypes = &self->_supportedMapsResultTypes;
  unint64_t count = self->_supportedMapsResultTypes.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_supportedMapsResultTypes->list[a3];
}

- (void)setSupportedMapsResultTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000uLL;

  MEMORY[0x1F4147390](&self->_supportedMapsResultTypes, a3, a4);
}

- (id)supportedMapsResultTypesAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E68D8[a3];
  }

  return v3;
}

- (int)StringAsSupportedMapsResultTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MAPS_RESULT_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MAPS_RESULT_TYPE_PLACE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MAPS_RESULT_TYPE_COLLECTION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MAPS_RESULT_TYPE_PUBLISHER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MAPS_RESULT_TYPE_PLACE_QUESTIONNAIRE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MAPS_RESULT_TYPE_BATCH_REVERSE_GEOCODE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readMapsSuggestionsTouristInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 319) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsSuggestionsTouristInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasMapsSuggestionsTouristInfo
{
  return self->_mapsSuggestionsTouristInfo != 0;
}

- (GEOPDMapsSuggestionsTouristInfo)mapsSuggestionsTouristInfo
{
  -[GEOPDClientMetadata _readMapsSuggestionsTouristInfo]((uint64_t)self);
  mapsSuggestionsTouristInfo = self->_mapsSuggestionsTouristInfo;

  return mapsSuggestionsTouristInfo;
}

- (void)setMapsSuggestionsTouristInfo:(id)a3
{
  *(void *)&self->_flags |= 0x140000000uLL;
  objc_storeStrong((id *)&self->_mapsSuggestionsTouristInfo, a3);
}

- (unint64_t)clientRevisionsCount
{
  return self->_clientRevisions.count;
}

- (int)clientRevisions
{
  return self->_clientRevisions.list;
}

- (void)clearClientRevisions
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000uLL;

  PBRepeatedInt32Clear();
}

- (int)clientRevisionsAtIndex:(unint64_t)a3
{
  -[GEOPDClientMetadata _readClientRevisions]((uint64_t)self);
  p_clientRevisions = &self->_clientRevisions;
  unint64_t count = self->_clientRevisions.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_clientRevisions->list[a3];
}

- (void)setClientRevisions:(int *)a3 count:(unint64_t)a4
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000uLL;

  MEMORY[0x1F4147390](&self->_clientRevisions, a3, a4);
}

- (id)clientRevisionsAsString:(int)a3
{
  if a3 < 0x29 && ((0x1FFE0100DFFuLL >> a3))
  {
    id v3 = off_1E53E6778[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (int)StringAsClientRevisions:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CLIENT_REVISION_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_PERMANENTLY_CLOSED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_BASEMAP_ID"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_APPCLIPS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_APPLE_RATINGS_PHOTOS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_ENHANCED_PLACEMENTS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_ADDRESS_CLUSTER"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_COARSE_LOCATION"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_SIRI_TRAFFIC_INCIDENTS"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_AZUL_RELEASE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_SMART_CARD_DYNAMIC_LAYOUT"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_SKY_RELEASE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_UNIFIED_ACTION_ROW"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_SYDNEY_RELEASE"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_YELP_PHOTO_COMMINGLE"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_HIKING_DATA"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_REALTIME_EV_CHARGING"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_OFFLINE_DATA"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_INTERLEAVED_GUIDES_IN_SEARCH_RESULTS"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_SAVE_BUTTON"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_FLEXIBLE_ACTION_LINK"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_HIKE_ROUTE"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_SINGLE_GUIDE_FOR_GUIDES_HOME"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_MULTIPLE_SEARCH_HOME_SECTIONS_OF_SAME_TYPE"])
  {
    int v4 = 40;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readPreferredDisplayCurrencySymbol
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 319) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPreferredDisplayCurrencySymbol_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasPreferredDisplayCurrencySymbol
{
  return self->_preferredDisplayCurrencySymbol != 0;
}

- (NSString)preferredDisplayCurrencySymbol
{
  -[GEOPDClientMetadata _readPreferredDisplayCurrencySymbol]((uint64_t)self);
  preferredDisplayCurrencySymbol = self->_preferredDisplayCurrencySymbol;

  return preferredDisplayCurrencySymbol;
}

- (void)_readDisplayRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 319) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayRegion_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasDisplayRegion
{
  return self->_displayRegion != 0;
}

- (NSString)displayRegion
{
  -[GEOPDClientMetadata _readDisplayRegion]((uint64_t)self);
  displayRegion = self->_displayRegion;

  return displayRegion;
}

- (BOOL)supportEnrichment
{
  return self->_supportEnrichment;
}

- (void)setHasSupportEnrichment:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100000200;
  }
  self->_$F32854447752F5D8BD00F9C7283039A2 flags = ($F32854447752F5D8BD00F9C7283039A2)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasSupportEnrichment
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (int)preferredDistanceUnit
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $F32854447752F5D8BD00F9C7283039A2 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 8) != 0) {
    return self->_preferredDistanceUnit;
  }
  else {
    return 0;
  }
}

- (void)setHasPreferredDistanceUnit:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100000008;
  }
  self->_$F32854447752F5D8BD00F9C7283039A2 flags = ($F32854447752F5D8BD00F9C7283039A2)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasPreferredDistanceUnit
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)preferredDistanceUnitAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E68C0[a3];
  }

  return v3;
}

- (int)StringAsPreferredDistanceUnit:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PREFERRED_DISTANCE_UNIT_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PREFERRED_DISTANCE_UNIT_METRIC"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PREFERRED_DISTANCE_UNIT_IMPERIAL"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
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
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000uLL;

  PBRepeatedInt32Clear();
}

- (int)supportedElevationModelAtIndex:(unint64_t)a3
{
  -[GEOPDClientMetadata _readSupportedElevationModels]((uint64_t)self);
  p_supportedElevationModels = &self->_supportedElevationModels;
  unint64_t count = self->_supportedElevationModels.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_supportedElevationModels->list[a3];
}

- (void)setSupportedElevationModels:(int *)a3 count:(unint64_t)a4
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x100000000uLL;

  MEMORY[0x1F4147390](&self->_supportedElevationModels, a3, a4);
}

- (id)supportedElevationModelsAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"ELEVATION_MODEL_WGS84";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"ELEVATION_MODEL_EGM96";
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDClientMetadata;
  int v4 = [(GEOPDClientMetadata *)&v8 description];
  id v5 = [(GEOPDClientMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDClientMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v125 = 0;
    goto LABEL_221;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [(id)a1 deviceCountryCode];
  if (v5)
  {
    if (a2) {
      objc_super v6 = @"deviceCountryCode";
    }
    else {
      objc_super v6 = @"device_country_code";
    }
    [v4 setObject:v5 forKey:v6];
  }

  id v7 = [(id)a1 deviceDisplayLanguage];
  if (v7)
  {
    if (a2) {
      objc_super v8 = @"deviceDisplayLanguage";
    }
    else {
      objc_super v8 = @"device_display_language";
    }
    [v4 setObject:v7 forKey:v8];
  }

  uint64_t v9 = [(id)a1 deviceKeyboardLanguage];
  if (v9)
  {
    if (a2) {
      v10 = @"deviceKeyboardLanguage";
    }
    else {
      v10 = @"device_keyboard_language";
    }
    [v4 setObject:v9 forKey:v10];
  }

  unint64_t v11 = [(id)a1 deviceSpokenLanguage];
  if (v11)
  {
    if (a2) {
      unint64_t v12 = @"deviceSpokenLanguage";
    }
    else {
      unint64_t v12 = @"device_spoken_language";
    }
    [v4 setObject:v11 forKey:v12];
  }

  uint64_t v13 = &OBJC_IVAR___GEOPDRelatedCollectionSection__collectionIds;
  if ((*(unsigned char *)(a1 + 316) & 0x40) != 0)
  {
    uint64_t v14 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 308)];
    if (a2) {
      uint64_t v15 = @"timeSinceMapEnteredForeground";
    }
    else {
      uint64_t v15 = @"time_since_map_entered_foreground";
    }
    [v4 setObject:v14 forKey:v15];
  }
  v16 = [(id)a1 additionalEnabledMarkets];
  unint64_t v17 = v16;
  if (v16)
  {
    if (a2)
    {
      unint64_t v18 = [v16 jsonRepresentation];
      $F32854447752F5D8BD00F9C7283039A2 v19 = @"additionalEnabledMarkets";
    }
    else
    {
      unint64_t v18 = [v16 dictionaryRepresentation];
      $F32854447752F5D8BD00F9C7283039A2 v19 = @"additional_enabled_markets";
    }
    id v20 = v18;

    [v4 setObject:v20 forKey:v19];
  }

  uint64_t v21 = *(void *)(a1 + 316);
  if ((v21 & 0x20) == 0)
  {
    if ((v21 & 4) == 0) {
      goto LABEL_34;
    }
LABEL_117:
    objc_super v64 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 292)];
    if (a2) {
      long long v65 = @"hourOfDay";
    }
    else {
      long long v65 = @"hour_of_day";
    }
    [v4 setObject:v64 forKey:v65];

    if ((*(void *)(a1 + 316) & 2) == 0) {
      goto LABEL_39;
    }
    goto LABEL_35;
  }
  int v28 = *(_DWORD *)(a1 + 304);
  if (v28)
  {
    if (v28 == 1)
    {
      long long v29 = @"MULTIPLE_ATTRIBUTIONS";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 304));
      long long v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    long long v29 = @"SINGLE_ATTRIBUTION";
  }
  if (a2) {
    long long v63 = @"resultListAttributionSupport";
  }
  else {
    long long v63 = @"result_list_attribution_support";
  }
  [v4 setObject:v29 forKey:v63];

  uint64_t v21 = *(void *)(a1 + 316);
  if ((v21 & 4) != 0) {
    goto LABEL_117;
  }
LABEL_34:
  if ((v21 & 2) != 0)
  {
LABEL_35:
    v22 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 288)];
    if (a2) {
      long long v23 = @"dayOfWeek";
    }
    else {
      long long v23 = @"day_of_week";
    }
    [v4 setObject:v22 forKey:v23];
  }
LABEL_39:
  long long v24 = [(id)a1 deviceExtendedLocation];
  long long v25 = v24;
  if (v24)
  {
    if (a2)
    {
      long long v26 = [v24 jsonRepresentation];
      long long v27 = @"deviceExtendedLocation";
    }
    else
    {
      long long v26 = [v24 dictionaryRepresentation];
      long long v27 = @"device_extended_location";
    }
    id v30 = v26;

    [v4 setObject:v30 forKey:v27];
  }

  v127 = v4;
  if ([*(id *)(a1 + 208) count])
  {
    uint64_t v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 208), "count"));
    long long v130 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    id v32 = *(id *)(a1 + 208);
    uint64_t v33 = [v32 countByEnumeratingWithState:&v130 objects:v134 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v131;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v131 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = *(void **)(*((void *)&v130 + 1) + 8 * i);
          if (a2) {
            [v37 jsonRepresentation];
          }
          else {
          id v38 = [v37 dictionaryRepresentation];
          }

          [v31 addObject:v38];
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v130 objects:v134 count:16];
      }
      while (v34);
    }

    if (a2) {
      v39 = @"deviceHistoricalLocation";
    }
    else {
      v39 = @"device_historical_location";
    }
    int v4 = v127;
    [v127 setObject:v31 forKey:v39];
  }
  if ((*(unsigned char *)(a1 + 316) & 0x10) != 0)
  {
    unsigned int v40 = *(_DWORD *)(a1 + 300) - 1;
    if (v40 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 300));
      uint64_t v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v41 = off_1E53E6728[v40];
    }
    if (a2) {
      uint64_t v42 = @"requiredVersion";
    }
    else {
      uint64_t v42 = @"required_version";
    }
    [v4 setObject:v41 forKey:v42];
  }
  v43 = [(id)a1 debugApiKey];
  if (v43)
  {
    if (a2) {
      $F32854447752F5D8BD00F9C7283039A2 v44 = @"debugApiKey";
    }
    else {
      $F32854447752F5D8BD00F9C7283039A2 v44 = @"debug_api_key";
    }
    [v4 setObject:v43 forKey:v44];
  }

  if (*(void *)(a1 + 56))
  {
    id v45 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    int v46 = (void *)(a1 + 48);
    if (*(void *)(a1 + 56))
    {
      unint64_t v47 = 0;
      do
      {
        uint64_t v48 = *(int *)(*v46 + 4 * v47);
        if (v48 >= 7)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v48);
          v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v49 = off_1E53E6740[v48];
        }
        [v45 addObject:v49];

        ++v47;
        int v46 = (void *)(a1 + 48);
      }
      while (v47 < *(void *)(a1 + 56));
    }
    if (a2) {
      v50 = @"knownClientResolvedTypeDeprecated";
    }
    else {
      v50 = @"known_client_resolved_type_deprecated";
    }
    [v4 setObject:v45 forKey:v50];

    uint64_t v13 = &OBJC_IVAR___GEOPDRelatedCollectionSection__collectionIds;
  }
  if ((*(unsigned char *)(a1 + 316) & 0x80) != 0)
  {
    long long v51 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 312)];
    if (a2) {
      long long v52 = @"enablePreflightVenues";
    }
    else {
      long long v52 = @"enable_preflight_venues";
    }
    [v4 setObject:v51 forKey:v52];
  }
  if (*(void *)(a1 + 80))
  {
    long long v53 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    long long v54 = (void *)(a1 + 72);
    if (*(void *)(a1 + 80))
    {
      unint64_t v55 = 0;
      do
      {
        uint64_t v56 = *(int *)(*v54 + 4 * v55);
        if (v56 >= 7)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v56);
          long long v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          long long v57 = off_1E53E6740[v56];
        }
        [v53 addObject:v57];

        ++v55;
        long long v54 = (void *)(a1 + 72);
      }
      while (v55 < *(void *)(a1 + 80));
    }
    if (a2) {
      long long v58 = @"knownClientResolvedType";
    }
    else {
      long long v58 = @"known_client_resolved_type";
    }
    [v4 setObject:v53 forKey:v58];

    uint64_t v13 = &OBJC_IVAR___GEOPDRelatedCollectionSection__collectionIds;
  }
  if (*(void *)(a1 + 168))
  {
    long long v59 = [(id)a1 businessChatPreflightIdentifiers];
    if (a2) {
      long long v60 = @"businessChatPreflightIdentifier";
    }
    else {
      long long v60 = @"business_chat_preflight_identifier";
    }
    [v4 setObject:v59 forKey:v60];
  }
  if (*(unsigned char *)(a1 + 316))
  {
    unsigned int v61 = *(_DWORD *)(a1 + 284);
    if (v61 < 0x29 && ((0x1FFE0100DFFuLL >> v61) & 1) != 0)
    {
      long long v62 = off_1E53E6778[v61];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 284));
      long long v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (a2) {
      long long v66 = @"clientRevision";
    }
    else {
      long long v66 = @"client_revision";
    }
    [v4 setObject:v62 forKey:v66];
  }
  long long v67 = [(id)a1 localizationCapabilities];
  long long v68 = v67;
  if (v67)
  {
    if (a2)
    {
      v69 = [v67 jsonRepresentation];
      v70 = @"localizationCapabilities";
    }
    else
    {
      v69 = [v67 dictionaryRepresentation];
      v70 = @"localization_capabilities";
    }
    id v71 = v69;

    [v4 setObject:v71 forKey:v70];
  }

  v72 = [(id)a1 deviceSku];
  if (v72)
  {
    if (a2) {
      v73 = @"deviceSku";
    }
    else {
      v73 = @"device_sku";
    }
    [v4 setObject:v72 forKey:v73];
  }

  if (*(unsigned char *)(a1 + 317))
  {
    uint64_t v74 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 313)];
    if (a2) {
      v75 = @"siriUserConsentsForAnalysis";
    }
    else {
      v75 = @"siri_user_consents_for_analysis";
    }
    [v4 setObject:v74 forKey:v75];
  }
  if (*(void *)(a1 + 128))
  {
    v76 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v77 = (void *)(a1 + 120);
    if (*(void *)(a1 + 128))
    {
      unint64_t v78 = 0;
      do
      {
        uint64_t v79 = *(int *)(*v77 + 4 * v78);
        if (v79 >= 6)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v79);
          v80 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v80 = off_1E53E68D8[v79];
        }
        [v76 addObject:v80];

        ++v78;
        v77 = (void *)(a1 + 120);
      }
      while (v78 < *(void *)(a1 + 128));
    }
    if (a2) {
      v81 = @"supportedMapsResultType";
    }
    else {
      v81 = @"supported_maps_result_type";
    }
    [v4 setObject:v76 forKey:v81];

    uint64_t v13 = &OBJC_IVAR___GEOPDRelatedCollectionSection__collectionIds;
  }
  v82 = [(id)a1 mapsSuggestionsTouristInfo];
  v83 = v82;
  if (v82)
  {
    if (a2)
    {
      v84 = [v82 jsonRepresentation];
      v85 = @"mapsSuggestionsTouristInfo";
    }
    else
    {
      v84 = [v82 dictionaryRepresentation];
      v85 = @"maps_suggestions_tourist_info";
    }
    id v86 = v84;

    [v4 setObject:v86 forKey:v85];
  }

  if (*(void *)(a1 + 32))
  {
    v87 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v88 = (void *)(a1 + 24);
    if (*(void *)(a1 + 32))
    {
      unint64_t v89 = 0;
      do
      {
        uint64_t v90 = *(unsigned int *)(*v88 + 4 * v89);
        if v90 < 0x29 && ((0x1FFE0100DFFuLL >> v90))
        {
          v91 = off_1E53E6778[(int)v90];
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v90);
          v91 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v87 addObject:v91];

        ++v89;
        v88 = (void *)(a1 + 24);
      }
      while (v89 < *(void *)(a1 + 32));
    }
    if (a2) {
      v92 = @"clientRevisions";
    }
    else {
      v92 = @"client_revisions";
    }
    int v4 = v127;
    [v127 setObject:v87 forKey:v92];

    uint64_t v13 = &OBJC_IVAR___GEOPDRelatedCollectionSection__collectionIds;
  }
  v93 = [(id)a1 preferredDisplayCurrencySymbol];
  if (v93)
  {
    if (a2) {
      v94 = @"preferredDisplayCurrencySymbol";
    }
    else {
      v94 = @"preferred_display_currency_symbol";
    }
    [v4 setObject:v93 forKey:v94];
  }

  v95 = [(id)a1 displayRegion];
  if (v95)
  {
    if (a2) {
      v96 = @"displayRegion";
    }
    else {
      v96 = @"display_region";
    }
    [v4 setObject:v95 forKey:v96];
  }

  uint64_t v97 = *(void *)(a1 + v13[324]);
  if ((v97 & 0x200) != 0)
  {
    v98 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 314)];
    if (a2) {
      v99 = @"supportEnrichment";
    }
    else {
      v99 = @"support_enrichment";
    }
    [v4 setObject:v98 forKey:v99];

    uint64_t v97 = *(void *)(a1 + v13[324]);
  }
  if ((v97 & 8) != 0)
  {
    uint64_t v100 = *(int *)(a1 + 296);
    if (v100 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 296));
      v101 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v101 = off_1E53E68C0[v100];
    }
    if (a2) {
      v102 = @"preferredDistanceUnit";
    }
    else {
      v102 = @"preferred_distance_unit";
    }
    [v4 setObject:v101 forKey:v102];
  }
  if (*(void *)(a1 + 104))
  {
    v103 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v104 = (void *)(a1 + 96);
    if (*(void *)(a1 + 104))
    {
      unint64_t v105 = 0;
      do
      {
        uint64_t v106 = *(unsigned int *)(*v104 + 4 * v105);
        if (v106)
        {
          if (v106 == 1)
          {
            v107 = @"ELEVATION_MODEL_WGS84";
          }
          else
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v106);
            v107 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v107 = @"ELEVATION_MODEL_EGM96";
        }
        [v103 addObject:v107];

        ++v105;
        v104 = (void *)(a1 + 96);
      }
      while (v105 < *(void *)(a1 + 104));
    }
    if (a2) {
      v108 = @"supportedElevationModel";
    }
    else {
      v108 = @"supported_elevation_model";
    }
    int v4 = v127;
    [v127 setObject:v103 forKey:v108];
  }
  v109 = [(id)a1 abClientMetadata];
  v110 = v109;
  if (v109)
  {
    if (a2)
    {
      v111 = [v109 jsonRepresentation];
      v112 = @"abClientMetadata";
    }
    else
    {
      v111 = [v109 dictionaryRepresentation];
      v112 = @"ab_client_metadata";
    }
    id v113 = v111;

    [v4 setObject:v113 forKey:v112];
  }

  v114 = [(id)a1 abBranchInfo];
  v115 = v114;
  if (v114)
  {
    if (a2)
    {
      v116 = [v114 jsonRepresentation];
      v117 = @"abBranchInfo";
    }
    else
    {
      v116 = [v114 dictionaryRepresentation];
      v117 = @"ab_branch_info";
    }
    id v118 = v116;

    [v4 setObject:v118 forKey:v117];
  }

  v119 = *(void **)(a1 + 16);
  if (v119)
  {
    v120 = [v119 dictionaryRepresentation];
    v121 = v120;
    if (a2)
    {
      v122 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v120, "count"));
      v128[0] = MEMORY[0x1E4F143A8];
      v128[1] = 3221225472;
      v128[2] = __49__GEOPDClientMetadata__dictionaryRepresentation___block_invoke;
      v128[3] = &unk_1E53D8860;
      id v123 = v122;
      id v129 = v123;
      [v121 enumerateKeysAndObjectsUsingBlock:v128];
      id v124 = v123;

      v121 = v124;
    }
    [v4 setObject:v121 forKey:@"Unknown Fields"];
  }
  id v125 = v4;

LABEL_221:

  return v125;
}

- (id)jsonRepresentation
{
  return -[GEOPDClientMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEOPDClientMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDClientMetadata)initWithDictionary:(id)a3
{
  return (GEOPDClientMetadata *)-[GEOPDClientMetadata _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v204 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_439;
  }
  id v6 = (id)[a1 init];

  if (!v6)
  {
    a1 = 0;
    goto LABEL_439;
  }
  if (a3) {
    id v7 = @"deviceCountryCode";
  }
  else {
    id v7 = @"device_country_code";
  }
  objc_super v8 = [v5 objectForKeyedSubscript:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = (void *)[v8 copy];
    [v6 setDeviceCountryCode:v9];
  }
  if (a3) {
    id v10 = @"deviceDisplayLanguage";
  }
  else {
    id v10 = @"device_display_language";
  }
  unint64_t v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v12 = (void *)[v11 copy];
    [v6 setDeviceDisplayLanguage:v12];
  }
  if (a3) {
    uint64_t v13 = @"deviceKeyboardLanguage";
  }
  else {
    uint64_t v13 = @"device_keyboard_language";
  }
  uint64_t v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v15 = (void *)[v14 copy];
    [v6 setDeviceKeyboardLanguage:v15];
  }
  if (a3) {
    v16 = @"deviceSpokenLanguage";
  }
  else {
    v16 = @"device_spoken_language";
  }
  unint64_t v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v18 = (void *)[v17 copy];
    [v6 setDeviceSpokenLanguage:v18];
  }
  if (a3) {
    $F32854447752F5D8BD00F9C7283039A2 v19 = @"timeSinceMapEnteredForeground";
  }
  else {
    $F32854447752F5D8BD00F9C7283039A2 v19 = @"time_since_map_entered_foreground";
  }
  id v20 = [v5 objectForKeyedSubscript:v19];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setTimeSinceMapEnteredForeground:", objc_msgSend(v20, "unsignedIntValue"));
  }

  if (a3) {
    uint64_t v21 = @"additionalEnabledMarkets";
  }
  else {
    uint64_t v21 = @"additional_enabled_markets";
  }
  v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v23 = [GEOAdditionalEnabledMarkets alloc];
    if (a3) {
      uint64_t v24 = [(GEOAdditionalEnabledMarkets *)v23 initWithJSON:v22];
    }
    else {
      uint64_t v24 = [(GEOAdditionalEnabledMarkets *)v23 initWithDictionary:v22];
    }
    long long v25 = (void *)v24;
    [v6 setAdditionalEnabledMarkets:v24];
  }
  if (a3) {
    long long v26 = @"resultListAttributionSupport";
  }
  else {
    long long v26 = @"result_list_attribution_support";
  }
  long long v27 = [v5 objectForKeyedSubscript:v26];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v28 = v27;
    if ([v28 isEqualToString:@"SINGLE_ATTRIBUTION"]) {
      uint64_t v29 = 0;
    }
    else {
      uint64_t v29 = [v28 isEqualToString:@"MULTIPLE_ATTRIBUTIONS"];
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_48;
    }
    uint64_t v29 = [v27 intValue];
  }
  [v6 setResultListAttributionSupport:v29];
LABEL_48:

  if (a3) {
    id v30 = @"hourOfDay";
  }
  else {
    id v30 = @"hour_of_day";
  }
  uint64_t v31 = [v5 objectForKeyedSubscript:v30];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setHourOfDay:", objc_msgSend(v31, "unsignedIntValue"));
  }

  if (a3) {
    id v32 = @"dayOfWeek";
  }
  else {
    id v32 = @"day_of_week";
  }
  uint64_t v33 = [v5 objectForKeyedSubscript:v32];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setDayOfWeek:", objc_msgSend(v33, "unsignedIntValue"));
  }

  if (a3) {
    uint64_t v34 = @"deviceExtendedLocation";
  }
  else {
    uint64_t v34 = @"device_extended_location";
  }
  uint64_t v35 = [v5 objectForKeyedSubscript:v34];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v36 = [GEOLocation alloc];
    if (a3) {
      uint64_t v37 = [(GEOLocation *)v36 initWithJSON:v35];
    }
    else {
      uint64_t v37 = [(GEOLocation *)v36 initWithDictionary:v35];
    }
    id v38 = (void *)v37;
    [v6 setDeviceExtendedLocation:v37];
  }
  if (a3) {
    v39 = @"deviceHistoricalLocation";
  }
  else {
    v39 = @"device_historical_location";
  }
  unsigned int v40 = [v5 objectForKeyedSubscript:v39];
  objc_opt_class();
  id v167 = v5;
  int v168 = a3;
  if (objc_opt_isKindOfClass())
  {
    long long v195 = 0u;
    long long v196 = 0u;
    long long v193 = 0u;
    long long v194 = 0u;
    id v41 = v40;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v193 objects:v203 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v194;
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v194 != v44) {
            objc_enumerationMutation(v41);
          }
          uint64_t v46 = *(void *)(*((void *)&v193 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unint64_t v47 = [GEOLocation alloc];
            if (a3) {
              uint64_t v48 = [(GEOLocation *)v47 initWithJSON:v46];
            }
            else {
              uint64_t v48 = [(GEOLocation *)v47 initWithDictionary:v46];
            }
            v49 = (void *)v48;
            [v6 addDeviceHistoricalLocation:v48];
          }
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v193 objects:v203 count:16];
      }
      while (v43);
    }

    id v5 = v167;
  }

  if (a3) {
    v50 = @"requiredVersion";
  }
  else {
    v50 = @"required_version";
  }
  long long v51 = [v5 objectForKeyedSubscript:v50];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v52 = v51;
    if ([v52 isEqualToString:@"VERSION_1"])
    {
      uint64_t v53 = 1;
    }
    else if ([v52 isEqualToString:@"VERSION_2"])
    {
      uint64_t v53 = 2;
    }
    else if ([v52 isEqualToString:@"VERSION_3"])
    {
      uint64_t v53 = 3;
    }
    else
    {
      uint64_t v53 = 1;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_98;
    }
    uint64_t v53 = [v51 intValue];
  }
  [v6 setRequiredVersion:v53];
LABEL_98:

  if (a3) {
    long long v54 = @"debugApiKey";
  }
  else {
    long long v54 = @"debug_api_key";
  }
  unint64_t v55 = [v5 objectForKeyedSubscript:v54];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v56 = (void *)[v55 copy];
    [v6 setDebugApiKey:v56];
  }
  if (a3) {
    long long v57 = @"knownClientResolvedTypeDeprecated";
  }
  else {
    long long v57 = @"known_client_resolved_type_deprecated";
  }
  long long v58 = [v5 objectForKeyedSubscript:v57];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v191 = 0u;
    long long v192 = 0u;
    long long v189 = 0u;
    long long v190 = 0u;
    v162 = v58;
    id v59 = v58;
    uint64_t v60 = [v59 countByEnumeratingWithState:&v189 objects:v202 count:16];
    if (!v60) {
      goto LABEL_134;
    }
    uint64_t v61 = v60;
    uint64_t v62 = *(void *)v190;
    while (1)
    {
      for (uint64_t j = 0; j != v61; ++j)
      {
        if (*(void *)v190 != v62) {
          objc_enumerationMutation(v59);
        }
        objc_super v64 = *(void **)(*((void *)&v189 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v65 = v64;
          if ([v65 isEqualToString:@"RESOLVED_ITEM_TYPE_UNKNOWN"])
          {
            uint64_t v66 = 0;
          }
          else if ([v65 isEqualToString:@"RESOLVED_ITEM_TYPE_HOME"])
          {
            uint64_t v66 = 1;
          }
          else if ([v65 isEqualToString:@"RESOLVED_ITEM_TYPE_WORK"])
          {
            uint64_t v66 = 2;
          }
          else if ([v65 isEqualToString:@"RESOLVED_ITEM_TYPE_PARKED_CAR"])
          {
            uint64_t v66 = 3;
          }
          else if ([v65 isEqualToString:@"RESOLVED_ITEM_TYPE_CURRENT_LOCATION"])
          {
            uint64_t v66 = 4;
          }
          else if ([v65 isEqualToString:@"RESOLVED_ITEM_TYPE_SERVER"])
          {
            uint64_t v66 = 5;
          }
          else if ([v65 isEqualToString:@"RESOLVED_ITEM_TYPE_SCHOOL"])
          {
            uint64_t v66 = 6;
          }
          else
          {
            uint64_t v66 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v66 = [v64 intValue];
        }
        [v6 addKnownClientResolvedTypeDeprecated:v66];
      }
      uint64_t v61 = [v59 countByEnumeratingWithState:&v189 objects:v202 count:16];
      if (!v61)
      {
LABEL_134:

        long long v58 = v162;
        id v5 = v167;
        a3 = v168;
        break;
      }
    }
  }

  if (a3) {
    long long v67 = @"enablePreflightVenues";
  }
  else {
    long long v67 = @"enable_preflight_venues";
  }
  long long v68 = [v5 objectForKeyedSubscript:v67];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setEnablePreflightVenues:", objc_msgSend(v68, "BOOLValue"));
  }

  if (a3) {
    v69 = @"knownClientResolvedType";
  }
  else {
    v69 = @"known_client_resolved_type";
  }
  v70 = [v5 objectForKeyedSubscript:v69];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v187 = 0u;
    long long v188 = 0u;
    long long v185 = 0u;
    long long v186 = 0u;
    v163 = v70;
    id v71 = v70;
    uint64_t v72 = [v71 countByEnumeratingWithState:&v185 objects:v201 count:16];
    if (!v72) {
      goto LABEL_171;
    }
    uint64_t v73 = v72;
    uint64_t v74 = *(void *)v186;
    while (1)
    {
      for (uint64_t k = 0; k != v73; ++k)
      {
        if (*(void *)v186 != v74) {
          objc_enumerationMutation(v71);
        }
        v76 = *(void **)(*((void *)&v185 + 1) + 8 * k);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v77 = v76;
          if ([v77 isEqualToString:@"RESOLVED_ITEM_TYPE_UNKNOWN"])
          {
            uint64_t v78 = 0;
          }
          else if ([v77 isEqualToString:@"RESOLVED_ITEM_TYPE_HOME"])
          {
            uint64_t v78 = 1;
          }
          else if ([v77 isEqualToString:@"RESOLVED_ITEM_TYPE_WORK"])
          {
            uint64_t v78 = 2;
          }
          else if ([v77 isEqualToString:@"RESOLVED_ITEM_TYPE_PARKED_CAR"])
          {
            uint64_t v78 = 3;
          }
          else if ([v77 isEqualToString:@"RESOLVED_ITEM_TYPE_CURRENT_LOCATION"])
          {
            uint64_t v78 = 4;
          }
          else if ([v77 isEqualToString:@"RESOLVED_ITEM_TYPE_SERVER"])
          {
            uint64_t v78 = 5;
          }
          else if ([v77 isEqualToString:@"RESOLVED_ITEM_TYPE_SCHOOL"])
          {
            uint64_t v78 = 6;
          }
          else
          {
            uint64_t v78 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v78 = [v76 intValue];
        }
        [v6 addKnownClientResolvedType:v78];
      }
      uint64_t v73 = [v71 countByEnumeratingWithState:&v185 objects:v201 count:16];
      if (!v73)
      {
LABEL_171:

        v70 = v163;
        id v5 = v167;
        a3 = v168;
        break;
      }
    }
  }

  if (a3) {
    uint64_t v79 = @"businessChatPreflightIdentifier";
  }
  else {
    uint64_t v79 = @"business_chat_preflight_identifier";
  }
  v80 = [v5 objectForKeyedSubscript:v79];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v183 = 0u;
    long long v184 = 0u;
    long long v181 = 0u;
    long long v182 = 0u;
    id v81 = v80;
    uint64_t v82 = [v81 countByEnumeratingWithState:&v181 objects:v200 count:16];
    if (v82)
    {
      uint64_t v83 = v82;
      uint64_t v84 = *(void *)v182;
      do
      {
        for (uint64_t m = 0; m != v83; ++m)
        {
          if (*(void *)v182 != v84) {
            objc_enumerationMutation(v81);
          }
          id v86 = *(void **)(*((void *)&v181 + 1) + 8 * m);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v87 = (void *)[v86 copy];
            [v6 addBusinessChatPreflightIdentifier:v87];
          }
        }
        uint64_t v83 = [v81 countByEnumeratingWithState:&v181 objects:v200 count:16];
      }
      while (v83);
    }

    id v5 = v167;
    a3 = v168;
  }

  if (a3) {
    v88 = @"clientRevision";
  }
  else {
    v88 = @"client_revision";
  }
  unint64_t v89 = [v5 objectForKeyedSubscript:v88];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v90 = v89;
    if ([v90 isEqualToString:@"CLIENT_REVISION_UNKNOWN"])
    {
      uint64_t v91 = 0;
    }
    else if ([v90 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_PERMANENTLY_CLOSED"])
    {
      uint64_t v91 = 1;
    }
    else if ([v90 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_BASEMAP_ID"])
    {
      uint64_t v91 = 2;
    }
    else if ([v90 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_APPCLIPS"])
    {
      uint64_t v91 = 3;
    }
    else if ([v90 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_APPLE_RATINGS_PHOTOS"])
    {
      uint64_t v91 = 4;
    }
    else if ([v90 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_ENHANCED_PLACEMENTS"])
    {
      uint64_t v91 = 5;
    }
    else if ([v90 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_ADDRESS_CLUSTER"])
    {
      uint64_t v91 = 6;
    }
    else if ([v90 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_COARSE_LOCATION"])
    {
      uint64_t v91 = 7;
    }
    else if ([v90 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_SIRI_TRAFFIC_INCIDENTS"])
    {
      uint64_t v91 = 8;
    }
    else if ([v90 isEqualToString:@"CLIENT_REVISION_AZUL_RELEASE"])
    {
      uint64_t v91 = 10;
    }
    else if ([v90 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_SMART_CARD_DYNAMIC_LAYOUT"])
    {
      uint64_t v91 = 11;
    }
    else if ([v90 isEqualToString:@"CLIENT_REVISION_SKY_RELEASE"])
    {
      uint64_t v91 = 20;
    }
    else
    {
      if ([v90 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_UNIFIED_ACTION_ROW"])
      {
        uint64_t v91 = 29;
      }
      else if ([v90 isEqualToString:@"CLIENT_REVISION_SYDNEY_RELEASE"])
      {
        uint64_t v91 = 30;
      }
      else if ([v90 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_YELP_PHOTO_COMMINGLE"])
      {
        uint64_t v91 = 31;
      }
      else if ([v90 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_HIKING_DATA"])
      {
        uint64_t v91 = 32;
      }
      else if ([v90 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_REALTIME_EV_CHARGING"])
      {
        uint64_t v91 = 33;
      }
      else if ([v90 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_OFFLINE_DATA"])
      {
        uint64_t v91 = 34;
      }
      else if ([v90 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_INTERLEAVED_GUIDES_IN_SEARCH_RESULTS"])
      {
        uint64_t v91 = 35;
      }
      else if ([v90 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_SAVE_BUTTON"])
      {
        uint64_t v91 = 36;
      }
      else if ([v90 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_FLEXIBLE_ACTION_LINK"])
      {
        uint64_t v91 = 37;
      }
      else if ([v90 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_HIKE_ROUTE"])
      {
        uint64_t v91 = 38;
      }
      else if ([v90 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_SINGLE_GUIDE_FOR_GUIDES_HOME"])
      {
        uint64_t v91 = 39;
      }
      else if ([v90 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_MULTIPLE_SEARCH_HOME_SECTIONS_OF_SAME_TYPE"])
      {
        uint64_t v91 = 40;
      }
      else
      {
        uint64_t v91 = 0;
      }
      id v5 = v167;
      a3 = v168;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_244;
    }
    uint64_t v91 = [v89 intValue];
  }
  [v6 setClientRevision:v91];
LABEL_244:

  if (a3) {
    v92 = @"localizationCapabilities";
  }
  else {
    v92 = @"localization_capabilities";
  }
  v93 = [v5 objectForKeyedSubscript:v92];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v94 = [GEOLocalizationCapabilities alloc];
    if (a3) {
      uint64_t v95 = [(GEOLocalizationCapabilities *)v94 initWithJSON:v93];
    }
    else {
      uint64_t v95 = [(GEOLocalizationCapabilities *)v94 initWithDictionary:v93];
    }
    v96 = (void *)v95;
    [v6 setLocalizationCapabilities:v95];
  }
  if (a3) {
    uint64_t v97 = @"deviceSku";
  }
  else {
    uint64_t v97 = @"device_sku";
  }
  v98 = [v5 objectForKeyedSubscript:v97];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v99 = (void *)[v98 copy];
    [v6 setDeviceSku:v99];
  }
  if (a3) {
    uint64_t v100 = @"siriUserConsentsForAnalysis";
  }
  else {
    uint64_t v100 = @"siri_user_consents_for_analysis";
  }
  v101 = [v5 objectForKeyedSubscript:v100];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSiriUserConsentsForAnalysis:", objc_msgSend(v101, "BOOLValue"));
  }

  if (a3) {
    v102 = @"supportedMapsResultType";
  }
  else {
    v102 = @"supported_maps_result_type";
  }
  v103 = [v5 objectForKeyedSubscript:v102];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v179 = 0u;
    long long v180 = 0u;
    long long v177 = 0u;
    long long v178 = 0u;
    v164 = v103;
    id v104 = v103;
    uint64_t v105 = [v104 countByEnumeratingWithState:&v177 objects:v199 count:16];
    if (!v105) {
      goto LABEL_291;
    }
    uint64_t v106 = v105;
    uint64_t v107 = *(void *)v178;
    while (1)
    {
      for (uint64_t n = 0; n != v106; ++n)
      {
        if (*(void *)v178 != v107) {
          objc_enumerationMutation(v104);
        }
        v109 = *(void **)(*((void *)&v177 + 1) + 8 * n);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v110 = v109;
          if ([v110 isEqualToString:@"MAPS_RESULT_TYPE_UNKNOWN"])
          {
            uint64_t v111 = 0;
          }
          else if ([v110 isEqualToString:@"MAPS_RESULT_TYPE_PLACE"])
          {
            uint64_t v111 = 1;
          }
          else if ([v110 isEqualToString:@"MAPS_RESULT_TYPE_COLLECTION"])
          {
            uint64_t v111 = 2;
          }
          else if ([v110 isEqualToString:@"MAPS_RESULT_TYPE_PUBLISHER"])
          {
            uint64_t v111 = 3;
          }
          else if ([v110 isEqualToString:@"MAPS_RESULT_TYPE_PLACE_QUESTIONNAIRE"])
          {
            uint64_t v111 = 4;
          }
          else if ([v110 isEqualToString:@"MAPS_RESULT_TYPE_BATCH_REVERSE_GEOCODE"])
          {
            uint64_t v111 = 5;
          }
          else
          {
            uint64_t v111 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v111 = [v109 intValue];
        }
        [v6 addSupportedMapsResultType:v111];
      }
      uint64_t v106 = [v104 countByEnumeratingWithState:&v177 objects:v199 count:16];
      if (!v106)
      {
LABEL_291:

        v103 = v164;
        id v5 = v167;
        a3 = v168;
        break;
      }
    }
  }

  if (a3) {
    v112 = @"mapsSuggestionsTouristInfo";
  }
  else {
    v112 = @"maps_suggestions_tourist_info";
  }
  id v113 = [v5 objectForKeyedSubscript:v112];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v114 = [GEOPDMapsSuggestionsTouristInfo alloc];
    if (v114)
    {
      id v115 = v113;
      v114 = [(GEOPDMapsSuggestionsTouristInfo *)v114 init];
      if (v114)
      {
        if (a3) {
          v116 = @"isTourist";
        }
        else {
          v116 = @"is_tourist";
        }
        v117 = [v115 objectForKeyedSubscript:v116];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v117 doubleValue];
          *(unsigned char *)&v114->_flags |= 1u;
          v114->_isTourist = v118;
        }
      }
    }
    [v6 setMapsSuggestionsTouristInfo:v114];
  }
  if (a3) {
    v119 = @"clientRevisions";
  }
  else {
    v119 = @"client_revisions";
  }
  v120 = [v5 objectForKeyedSubscript:v119];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v175 = 0u;
    long long v176 = 0u;
    long long v173 = 0u;
    long long v174 = 0u;
    v165 = v120;
    id v121 = v120;
    uint64_t v122 = [v121 countByEnumeratingWithState:&v173 objects:v198 count:16];
    if (!v122) {
      goto LABEL_371;
    }
    uint64_t v123 = v122;
    uint64_t v124 = *(void *)v174;
    while (1)
    {
      for (iuint64_t i = 0; ii != v123; ++ii)
      {
        if (*(void *)v174 != v124) {
          objc_enumerationMutation(v121);
        }
        v126 = *(void **)(*((void *)&v173 + 1) + 8 * ii);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v127 = v126;
          if ([v127 isEqualToString:@"CLIENT_REVISION_UNKNOWN"])
          {
            uint64_t v128 = 0;
          }
          else if ([v127 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_PERMANENTLY_CLOSED"])
          {
            uint64_t v128 = 1;
          }
          else if ([v127 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_BASEMAP_ID"])
          {
            uint64_t v128 = 2;
          }
          else if ([v127 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_APPCLIPS"])
          {
            uint64_t v128 = 3;
          }
          else if ([v127 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_APPLE_RATINGS_PHOTOS"])
          {
            uint64_t v128 = 4;
          }
          else if ([v127 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_ENHANCED_PLACEMENTS"])
          {
            uint64_t v128 = 5;
          }
          else if ([v127 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_ADDRESS_CLUSTER"])
          {
            uint64_t v128 = 6;
          }
          else if ([v127 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_COARSE_LOCATION"])
          {
            uint64_t v128 = 7;
          }
          else if ([v127 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_SIRI_TRAFFIC_INCIDENTS"])
          {
            uint64_t v128 = 8;
          }
          else if ([v127 isEqualToString:@"CLIENT_REVISION_AZUL_RELEASE"])
          {
            uint64_t v128 = 10;
          }
          else if ([v127 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_SMART_CARD_DYNAMIC_LAYOUT"])
          {
            uint64_t v128 = 11;
          }
          else if ([v127 isEqualToString:@"CLIENT_REVISION_SKY_RELEASE"])
          {
            uint64_t v128 = 20;
          }
          else if ([v127 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_UNIFIED_ACTION_ROW"])
          {
            uint64_t v128 = 29;
          }
          else if ([v127 isEqualToString:@"CLIENT_REVISION_SYDNEY_RELEASE"])
          {
            uint64_t v128 = 30;
          }
          else if ([v127 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_YELP_PHOTO_COMMINGLE"])
          {
            uint64_t v128 = 31;
          }
          else if ([v127 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_HIKING_DATA"])
          {
            uint64_t v128 = 32;
          }
          else if ([v127 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_REALTIME_EV_CHARGING"])
          {
            uint64_t v128 = 33;
          }
          else if ([v127 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_OFFLINE_DATA"])
          {
            uint64_t v128 = 34;
          }
          else if ([v127 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_INTERLEAVED_GUIDES_IN_SEARCH_RESULTS"])
          {
            uint64_t v128 = 35;
          }
          else if ([v127 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_SAVE_BUTTON"])
          {
            uint64_t v128 = 36;
          }
          else if ([v127 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_FLEXIBLE_ACTION_LINK"])
          {
            uint64_t v128 = 37;
          }
          else if ([v127 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_HIKE_ROUTE"])
          {
            uint64_t v128 = 38;
          }
          else if ([v127 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_SINGLE_GUIDE_FOR_GUIDES_HOME"])
          {
            uint64_t v128 = 39;
          }
          else if ([v127 isEqualToString:@"CLIENT_REVISION_CAN_HANDLE_MULTIPLE_SEARCH_HOME_SECTIONS_OF_SAME_TYPE"])
          {
            uint64_t v128 = 40;
          }
          else
          {
            uint64_t v128 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v128 = [v126 intValue];
        }
        [v6 addClientRevisions:v128];
      }
      uint64_t v123 = [v121 countByEnumeratingWithState:&v173 objects:v198 count:16];
      if (!v123)
      {
LABEL_371:

        v120 = v165;
        id v5 = v167;
        a3 = v168;
        break;
      }
    }
  }

  if (a3) {
    id v129 = @"preferredDisplayCurrencySymbol";
  }
  else {
    id v129 = @"preferred_display_currency_symbol";
  }
  long long v130 = [v5 objectForKeyedSubscript:v129];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v131 = (void *)[v130 copy];
    [v6 setPreferredDisplayCurrencySymbol:v131];
  }
  if (a3) {
    long long v132 = @"displayRegion";
  }
  else {
    long long v132 = @"display_region";
  }
  long long v133 = [v5 objectForKeyedSubscript:v132];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v134 = (void *)[v133 copy];
    [v6 setDisplayRegion:v134];
  }
  if (a3) {
    uint64_t v135 = @"supportEnrichment";
  }
  else {
    uint64_t v135 = @"support_enrichment";
  }
  v136 = [v5 objectForKeyedSubscript:v135];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportEnrichment:", objc_msgSend(v136, "BOOLValue"));
  }

  if (a3) {
    v137 = @"preferredDistanceUnit";
  }
  else {
    v137 = @"preferred_distance_unit";
  }
  v138 = [v5 objectForKeyedSubscript:v137];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v139 = v138;
    if ([v139 isEqualToString:@"PREFERRED_DISTANCE_UNIT_UNKNOWN"])
    {
      uint64_t v140 = 0;
    }
    else if ([v139 isEqualToString:@"PREFERRED_DISTANCE_UNIT_METRIC"])
    {
      uint64_t v140 = 1;
    }
    else if ([v139 isEqualToString:@"PREFERRED_DISTANCE_UNIT_IMPERIAL"])
    {
      uint64_t v140 = 2;
    }
    else
    {
      uint64_t v140 = 0;
    }

    goto LABEL_401;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v140 = [v138 intValue];
LABEL_401:
    [v6 setPreferredDistanceUnit:v140];
  }

  if (a3) {
    v141 = @"supportedElevationModel";
  }
  else {
    v141 = @"supported_elevation_model";
  }
  v142 = [v5 objectForKeyedSubscript:v141];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v171 = 0u;
    long long v172 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    v166 = v142;
    id v143 = v142;
    uint64_t v144 = [v143 countByEnumeratingWithState:&v169 objects:v197 count:16];
    if (!v144) {
      goto LABEL_421;
    }
    uint64_t v145 = v144;
    uint64_t v146 = *(void *)v170;
    while (1)
    {
      for (juint64_t j = 0; jj != v145; ++jj)
      {
        if (*(void *)v170 != v146) {
          objc_enumerationMutation(v143);
        }
        v148 = *(void **)(*((void *)&v169 + 1) + 8 * jj);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v149 = v148;
          if ([v149 isEqualToString:@"ELEVATION_MODEL_EGM96"]) {
            uint64_t v150 = 0;
          }
          else {
            uint64_t v150 = [v149 isEqualToString:@"ELEVATION_MODEL_WGS84"];
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v150 = [v148 intValue];
        }
        [v6 addSupportedElevationModel:v150];
      }
      uint64_t v145 = [v143 countByEnumeratingWithState:&v169 objects:v197 count:16];
      if (!v145)
      {
LABEL_421:

        v142 = v166;
        id v5 = v167;
        a3 = v168;
        break;
      }
    }
  }

  if (a3) {
    v151 = @"abClientMetadata";
  }
  else {
    v151 = @"ab_client_metadata";
  }
  v152 = [v5 objectForKeyedSubscript:v151];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v153 = [GEOABSecondPartyPlaceRequestClientMetaData alloc];
    if (a3) {
      uint64_t v154 = [(GEOABSecondPartyPlaceRequestClientMetaData *)v153 initWithJSON:v152];
    }
    else {
      uint64_t v154 = [(GEOABSecondPartyPlaceRequestClientMetaData *)v153 initWithDictionary:v152];
    }
    v155 = (void *)v154;
    [v6 setAbClientMetadata:v154];
  }
  if (a3) {
    v156 = @"abBranchInfo";
  }
  else {
    v156 = @"ab_branch_info";
  }
  v157 = [v5 objectForKeyedSubscript:v156];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v158 = [GEOABBranchInfo alloc];
    if (a3) {
      uint64_t v159 = [(GEOABBranchInfo *)v158 initWithJSON:v157];
    }
    else {
      uint64_t v159 = [(GEOABBranchInfo *)v158 initWithDictionary:v157];
    }
    v160 = (void *)v159;
    [v6 setAbBranchInfo:v159];
  }
  a1 = v6;

LABEL_439:
  return a1;
}

- (GEOPDClientMetadata)initWithJSON:(id)a3
{
  return (GEOPDClientMetadata *)-[GEOPDClientMetadata _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDClientMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDClientMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOPDClientMetadata _readDeviceExtendedLocation]((uint64_t)self);
  if ([(GEOLocation *)self->_deviceExtendedLocation hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOPDClientMetadata _readDeviceHistoricalLocations]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = self->_deviceHistoricalLocations;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v12))
        {
          BOOL v5 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v5 = 0;
LABEL_13:

  return v5;
}

- (void)copyTo:(id)a3
{
  uint64_t v33 = (char *)a3;
  [(GEOPDClientMetadata *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v33 + 1, self->_reader);
  *((_DWORD *)v33 + 68) = self->_readerMarkPos;
  *((_DWORD *)v33 + 69) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_deviceCountryCode) {
    objc_msgSend(v33, "setDeviceCountryCode:");
  }
  if (self->_deviceDisplayLanguage) {
    objc_msgSend(v33, "setDeviceDisplayLanguage:");
  }
  int v4 = v33;
  if (self->_deviceKeyboardLanguage)
  {
    objc_msgSend(v33, "setDeviceKeyboardLanguage:");
    int v4 = v33;
  }
  if (self->_deviceSpokenLanguage)
  {
    objc_msgSend(v33, "setDeviceSpokenLanguage:");
    int v4 = v33;
  }
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    *((_DWORD *)v4 + 77) = self->_timeSinceMapEnteredForeground;
    *(void *)(v4 + 316) |= 0x40uLL;
  }
  if (self->_additionalEnabledMarkets)
  {
    objc_msgSend(v33, "setAdditionalEnabledMarkets:");
    int v4 = v33;
  }
  $F32854447752F5D8BD00F9C7283039A2 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    *((_DWORD *)v4 + 76) = self->_resultListAttributionSupport;
    *(void *)(v4 + 316) |= 0x20uLL;
    $F32854447752F5D8BD00F9C7283039A2 flags = self->_flags;
    if ((*(unsigned char *)&flags & 4) == 0)
    {
LABEL_15:
      if ((*(unsigned char *)&flags & 2) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&flags & 4) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v4 + 73) = self->_hourOfDay;
  *(void *)(v4 + 316) |= 4uLL;
  if ((*(void *)&self->_flags & 2) != 0)
  {
LABEL_16:
    *((_DWORD *)v4 + 72) = self->_dayOfWeek;
    *(void *)(v4 + 316) |= 2uLL;
  }
LABEL_17:
  if (self->_deviceExtendedLocation) {
    objc_msgSend(v33, "setDeviceExtendedLocation:");
  }
  if ([(GEOPDClientMetadata *)self deviceHistoricalLocationsCount])
  {
    [v33 clearDeviceHistoricalLocations];
    unint64_t v6 = [(GEOPDClientMetadata *)self deviceHistoricalLocationsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(GEOPDClientMetadata *)self deviceHistoricalLocationAtIndex:i];
        [v33 addDeviceHistoricalLocation:v9];
      }
    }
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *((_DWORD *)v33 + 75) = self->_requiredVersion;
    *(void *)(v33 + 316) |= 0x10uLL;
  }
  if (self->_debugApiKey) {
    objc_msgSend(v33, "setDebugApiKey:");
  }
  if ([(GEOPDClientMetadata *)self knownClientResolvedTypeDeprecatedsCount])
  {
    [v33 clearKnownClientResolvedTypeDeprecateds];
    unint64_t v10 = [(GEOPDClientMetadata *)self knownClientResolvedTypeDeprecatedsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
        objc_msgSend(v33, "addKnownClientResolvedTypeDeprecated:", -[GEOPDClientMetadata knownClientResolvedTypeDeprecatedAtIndex:](self, "knownClientResolvedTypeDeprecatedAtIndex:", j));
    }
  }
  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    v33[312] = self->_enablePreflightVenues;
    *(void *)(v33 + 316) |= 0x80uLL;
  }
  if ([(GEOPDClientMetadata *)self knownClientResolvedTypesCount])
  {
    [v33 clearKnownClientResolvedTypes];
    unint64_t v13 = [(GEOPDClientMetadata *)self knownClientResolvedTypesCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
        objc_msgSend(v33, "addKnownClientResolvedType:", -[GEOPDClientMetadata knownClientResolvedTypeAtIndex:](self, "knownClientResolvedTypeAtIndex:", k));
    }
  }
  if ([(GEOPDClientMetadata *)self businessChatPreflightIdentifiersCount])
  {
    [v33 clearBusinessChatPreflightIdentifiers];
    unint64_t v16 = [(GEOPDClientMetadata *)self businessChatPreflightIdentifiersCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        $F32854447752F5D8BD00F9C7283039A2 v19 = [(GEOPDClientMetadata *)self businessChatPreflightIdentifierAtIndex:m];
        [v33 addBusinessChatPreflightIdentifier:v19];
      }
    }
  }
  id v20 = v33;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v33 + 71) = self->_clientRevision;
    *(void *)(v33 + 316) |= 1uLL;
  }
  if (self->_localizationCapabilities)
  {
    objc_msgSend(v33, "setLocalizationCapabilities:");
    id v20 = v33;
  }
  if (self->_deviceSku)
  {
    objc_msgSend(v33, "setDeviceSku:");
    id v20 = v33;
  }
  if (*((unsigned char *)&self->_flags + 1))
  {
    v20[313] = self->_siriUserConsentsForAnalysis;
    *(void *)(v20 + 316) |= 0x100uLL;
  }
  if ([(GEOPDClientMetadata *)self supportedMapsResultTypesCount])
  {
    [v33 clearSupportedMapsResultTypes];
    unint64_t v21 = [(GEOPDClientMetadata *)self supportedMapsResultTypesCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (uint64_t n = 0; n != v22; ++n)
        objc_msgSend(v33, "addSupportedMapsResultType:", -[GEOPDClientMetadata supportedMapsResultTypeAtIndex:](self, "supportedMapsResultTypeAtIndex:", n));
    }
  }
  if (self->_mapsSuggestionsTouristInfo) {
    objc_msgSend(v33, "setMapsSuggestionsTouristInfo:");
  }
  if ([(GEOPDClientMetadata *)self clientRevisionsCount])
  {
    [v33 clearClientRevisions];
    unint64_t v24 = [(GEOPDClientMetadata *)self clientRevisionsCount];
    if (v24)
    {
      unint64_t v25 = v24;
      for (iuint64_t i = 0; ii != v25; ++ii)
        objc_msgSend(v33, "addClientRevisions:", -[GEOPDClientMetadata clientRevisionsAtIndex:](self, "clientRevisionsAtIndex:", ii));
    }
  }
  if (self->_preferredDisplayCurrencySymbol) {
    objc_msgSend(v33, "setPreferredDisplayCurrencySymbol:");
  }
  long long v27 = v33;
  if (self->_displayRegion)
  {
    objc_msgSend(v33, "setDisplayRegion:");
    long long v27 = v33;
  }
  $F32854447752F5D8BD00F9C7283039A2 v28 = self->_flags;
  if ((*(_WORD *)&v28 & 0x200) != 0)
  {
    v27[314] = self->_supportEnrichment;
    *(void *)(v27 + 316) |= 0x200uLL;
    $F32854447752F5D8BD00F9C7283039A2 v28 = self->_flags;
  }
  if ((*(unsigned char *)&v28 & 8) != 0)
  {
    *((_DWORD *)v27 + 74) = self->_preferredDistanceUnit;
    *(void *)(v27 + 316) |= 8uLL;
  }
  if ([(GEOPDClientMetadata *)self supportedElevationModelsCount])
  {
    [v33 clearSupportedElevationModels];
    unint64_t v29 = [(GEOPDClientMetadata *)self supportedElevationModelsCount];
    if (v29)
    {
      unint64_t v30 = v29;
      for (juint64_t j = 0; jj != v30; ++jj)
        objc_msgSend(v33, "addSupportedElevationModel:", -[GEOPDClientMetadata supportedElevationModelAtIndex:](self, "supportedElevationModelAtIndex:", jj));
    }
  }
  if (self->_abClientMetadata) {
    objc_msgSend(v33, "setAbClientMetadata:");
  }
  id v32 = v33;
  if (self->_abBranchInfo)
  {
    objc_msgSend(v33, "setAbBranchInfo:");
    id v32 = v33;
  }
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_99;
  }
  [(GEOPDClientMetadata *)self readAll:1];
  [v4 readAll:1];
  deviceCountryCode = self->_deviceCountryCode;
  if ((unint64_t)deviceCountryCode | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](deviceCountryCode, "isEqual:")) {
      goto LABEL_99;
    }
  }
  deviceDisplayLanguage = self->_deviceDisplayLanguage;
  if ((unint64_t)deviceDisplayLanguage | *((void *)v4 + 24))
  {
    if (!-[NSString isEqual:](deviceDisplayLanguage, "isEqual:")) {
      goto LABEL_99;
    }
  }
  deviceKeyboardLanguage = self->_deviceKeyboardLanguage;
  if ((unint64_t)deviceKeyboardLanguage | *((void *)v4 + 27))
  {
    if (!-[NSString isEqual:](deviceKeyboardLanguage, "isEqual:")) {
      goto LABEL_99;
    }
  }
  deviceSpokenLanguage = self->_deviceSpokenLanguage;
  if ((unint64_t)deviceSpokenLanguage | *((void *)v4 + 29))
  {
    if (!-[NSString isEqual:](deviceSpokenLanguage, "isEqual:")) {
      goto LABEL_99;
    }
  }
  $F32854447752F5D8BD00F9C7283039A2 flags = self->_flags;
  uint64_t v10 = *(void *)(v4 + 316);
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_timeSinceMapEnteredForeground != *((_DWORD *)v4 + 77)) {
      goto LABEL_99;
    }
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_99;
  }
  additionalEnabledMarkets = self->_additionalEnabledMarkets;
  if ((unint64_t)additionalEnabledMarkets | *((void *)v4 + 20))
  {
    if (!-[GEOAdditionalEnabledMarkets isEqual:](additionalEnabledMarkets, "isEqual:")) {
      goto LABEL_99;
    }
    $F32854447752F5D8BD00F9C7283039A2 flags = self->_flags;
    uint64_t v10 = *(void *)(v4 + 316);
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_resultListAttributionSupport != *((_DWORD *)v4 + 76)) {
      goto LABEL_99;
    }
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_99;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_hourOfDay != *((_DWORD *)v4 + 73)) {
      goto LABEL_99;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_99;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_dayOfWeek != *((_DWORD *)v4 + 72)) {
      goto LABEL_99;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_99;
  }
  deviceExtendedLocatiouint64_t n = self->_deviceExtendedLocation;
  if ((unint64_t)deviceExtendedLocation | *((void *)v4 + 25)
    && !-[GEOLocation isEqual:](deviceExtendedLocation, "isEqual:"))
  {
    goto LABEL_99;
  }
  deviceHistoricalLocations = self->_deviceHistoricalLocations;
  if ((unint64_t)deviceHistoricalLocations | *((void *)v4 + 26))
  {
    if (!-[NSMutableArray isEqual:](deviceHistoricalLocations, "isEqual:")) {
      goto LABEL_99;
    }
  }
  uint64_t v14 = *(void *)(v4 + 316);
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((v14 & 0x10) == 0 || self->_requiredVersion != *((_DWORD *)v4 + 75)) {
      goto LABEL_99;
    }
  }
  else if ((v14 & 0x10) != 0)
  {
    goto LABEL_99;
  }
  debugApiKey = self->_debugApiKey;
  if ((unint64_t)debugApiKey | *((void *)v4 + 22)
    && !-[NSString isEqual:](debugApiKey, "isEqual:")
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_99;
  }
  uint64_t v16 = *(void *)(v4 + 316);
  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    if ((v16 & 0x80) == 0) {
      goto LABEL_99;
    }
    if (self->_enablePreflightVenues)
    {
      if (!v4[312]) {
        goto LABEL_99;
      }
    }
    else if (v4[312])
    {
      goto LABEL_99;
    }
  }
  else if ((v16 & 0x80) != 0)
  {
    goto LABEL_99;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_99;
  }
  businessChatPreflightIdentifiers = self->_businessChatPreflightIdentifiers;
  if ((unint64_t)businessChatPreflightIdentifiers | *((void *)v4 + 21))
  {
    if (!-[NSMutableArray isEqual:](businessChatPreflightIdentifiers, "isEqual:")) {
      goto LABEL_99;
    }
  }
  uint64_t v18 = *(void *)(v4 + 316);
  if (*(unsigned char *)&self->_flags)
  {
    if ((v18 & 1) == 0 || self->_clientRevision != *((_DWORD *)v4 + 71)) {
      goto LABEL_99;
    }
  }
  else if (v18)
  {
    goto LABEL_99;
  }
  localizationCapabilities = self->_localizationCapabilities;
  if ((unint64_t)localizationCapabilities | *((void *)v4 + 31)
    && !-[GEOLocalizationCapabilities isEqual:](localizationCapabilities, "isEqual:"))
  {
    goto LABEL_99;
  }
  deviceSku = self->_deviceSku;
  if ((unint64_t)deviceSku | *((void *)v4 + 28))
  {
    if (!-[NSString isEqual:](deviceSku, "isEqual:")) {
      goto LABEL_99;
    }
  }
  uint64_t v21 = *(void *)(v4 + 316);
  if (*((unsigned char *)&self->_flags + 1))
  {
    if ((v21 & 0x100) == 0) {
      goto LABEL_99;
    }
    if (self->_siriUserConsentsForAnalysis)
    {
      if (!v4[313]) {
        goto LABEL_99;
      }
    }
    else if (v4[313])
    {
      goto LABEL_99;
    }
  }
  else if ((v21 & 0x100) != 0)
  {
    goto LABEL_99;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_99;
  }
  mapsSuggestionsTouristInfo = self->_mapsSuggestionsTouristInfo;
  if ((unint64_t)mapsSuggestionsTouristInfo | *((void *)v4 + 32))
  {
    if (!-[GEOPDMapsSuggestionsTouristInfo isEqual:](mapsSuggestionsTouristInfo, "isEqual:")) {
      goto LABEL_99;
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_99;
  }
  preferredDisplayCurrencySymbol = self->_preferredDisplayCurrencySymbol;
  if ((unint64_t)preferredDisplayCurrencySymbol | *((void *)v4 + 33))
  {
    if (!-[NSString isEqual:](preferredDisplayCurrencySymbol, "isEqual:")) {
      goto LABEL_99;
    }
  }
  displayRegiouint64_t n = self->_displayRegion;
  if ((unint64_t)displayRegion | *((void *)v4 + 30))
  {
    if (!-[NSString isEqual:](displayRegion, "isEqual:")) {
      goto LABEL_99;
    }
  }
  $F32854447752F5D8BD00F9C7283039A2 v25 = self->_flags;
  uint64_t v26 = *(void *)(v4 + 316);
  if ((*(_WORD *)&v25 & 0x200) != 0)
  {
    if ((v26 & 0x200) != 0)
    {
      if (self->_supportEnrichment)
      {
        if (!v4[314]) {
          goto LABEL_99;
        }
        goto LABEL_89;
      }
      if (!v4[314]) {
        goto LABEL_89;
      }
    }
LABEL_99:
    char v29 = 0;
    goto LABEL_100;
  }
  if ((v26 & 0x200) != 0) {
    goto LABEL_99;
  }
LABEL_89:
  if ((*(unsigned char *)&v25 & 8) != 0)
  {
    if ((v26 & 8) == 0 || self->_preferredDistanceUnit != *((_DWORD *)v4 + 74)) {
      goto LABEL_99;
    }
  }
  else if ((v26 & 8) != 0)
  {
    goto LABEL_99;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_99;
  }
  abClientMetadata = self->_abClientMetadata;
  if ((unint64_t)abClientMetadata | *((void *)v4 + 19))
  {
    if (!-[GEOABSecondPartyPlaceRequestClientMetaData isEqual:](abClientMetadata, "isEqual:")) {
      goto LABEL_99;
    }
  }
  abBranchInfo = self->_abBranchInfo;
  if ((unint64_t)abBranchInfo | *((void *)v4 + 18)) {
    char v29 = -[GEOABBranchInfo isEqual:](abBranchInfo, "isEqual:");
  }
  else {
    char v29 = 1;
  }
LABEL_100:

  return v29;
}

- (unint64_t)hash
{
  [(GEOPDClientMetadata *)self readAll:1];
  NSUInteger v36 = [(NSString *)self->_deviceCountryCode hash];
  NSUInteger v35 = [(NSString *)self->_deviceDisplayLanguage hash];
  NSUInteger v34 = [(NSString *)self->_deviceKeyboardLanguage hash];
  NSUInteger v33 = [(NSString *)self->_deviceSpokenLanguage hash];
  if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
    uint64_t v32 = 2654435761 * self->_timeSinceMapEnteredForeground;
  }
  else {
    uint64_t v32 = 0;
  }
  unint64_t v31 = [(GEOAdditionalEnabledMarkets *)self->_additionalEnabledMarkets hash];
  $F32854447752F5D8BD00F9C7283039A2 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) == 0)
  {
    uint64_t v30 = 0;
    if ((*(unsigned char *)&flags & 4) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v29 = 0;
    if ((*(unsigned char *)&flags & 2) != 0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v30 = 2654435761 * self->_resultListAttributionSupport;
  if ((*(unsigned char *)&flags & 4) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v29 = 2654435761 * self->_hourOfDay;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
LABEL_7:
    uint64_t v28 = 2654435761 * self->_dayOfWeek;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v28 = 0;
LABEL_11:
  unint64_t v27 = [(GEOLocation *)self->_deviceExtendedLocation hash];
  uint64_t v26 = [(NSMutableArray *)self->_deviceHistoricalLocations hash];
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    uint64_t v25 = 2654435761 * self->_requiredVersion;
  }
  else {
    uint64_t v25 = 0;
  }
  NSUInteger v24 = [(NSString *)self->_debugApiKey hash];
  uint64_t v23 = PBRepeatedInt32Hash();
  if ((*(unsigned char *)&self->_flags & 0x80) != 0) {
    uint64_t v22 = 2654435761 * self->_enablePreflightVenues;
  }
  else {
    uint64_t v22 = 0;
  }
  uint64_t v21 = PBRepeatedInt32Hash();
  uint64_t v20 = [(NSMutableArray *)self->_businessChatPreflightIdentifiers hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v19 = 2654435761 * self->_clientRevision;
  }
  else {
    uint64_t v19 = 0;
  }
  unint64_t v18 = [(GEOLocalizationCapabilities *)self->_localizationCapabilities hash];
  NSUInteger v4 = [(NSString *)self->_deviceSku hash];
  if (*((unsigned char *)&self->_flags + 1)) {
    uint64_t v5 = 2654435761 * self->_siriUserConsentsForAnalysis;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = PBRepeatedInt32Hash();
  unint64_t v7 = [(GEOPDMapsSuggestionsTouristInfo *)self->_mapsSuggestionsTouristInfo hash];
  uint64_t v8 = PBRepeatedInt32Hash();
  NSUInteger v9 = [(NSString *)self->_preferredDisplayCurrencySymbol hash];
  NSUInteger v10 = [(NSString *)self->_displayRegion hash];
  $F32854447752F5D8BD00F9C7283039A2 v11 = self->_flags;
  if ((*(_WORD *)&v11 & 0x200) != 0)
  {
    uint64_t v12 = 2654435761 * self->_supportEnrichment;
    if ((*(unsigned char *)&v11 & 8) != 0) {
      goto LABEL_25;
    }
LABEL_27:
    uint64_t v13 = 0;
    goto LABEL_28;
  }
  uint64_t v12 = 0;
  if ((*(unsigned char *)&v11 & 8) == 0) {
    goto LABEL_27;
  }
LABEL_25:
  uint64_t v13 = 2654435761 * self->_preferredDistanceUnit;
LABEL_28:
  NSUInteger v14 = v35 ^ v36 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12;
  uint64_t v15 = v13 ^ PBRepeatedInt32Hash();
  unint64_t v16 = v15 ^ [(GEOABSecondPartyPlaceRequestClientMetaData *)self->_abClientMetadata hash];
  return v14 ^ v16 ^ [(GEOABBranchInfo *)self->_abBranchInfo hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = (char *)a3;
  [v4 readAll:0];
  if (*((void *)v4 + 23)) {
    -[GEOPDClientMetadata setDeviceCountryCode:](self, "setDeviceCountryCode:");
  }
  if (*((void *)v4 + 24)) {
    -[GEOPDClientMetadata setDeviceDisplayLanguage:](self, "setDeviceDisplayLanguage:");
  }
  if (*((void *)v4 + 27)) {
    -[GEOPDClientMetadata setDeviceKeyboardLanguage:](self, "setDeviceKeyboardLanguage:");
  }
  if (*((void *)v4 + 29)) {
    -[GEOPDClientMetadata setDeviceSpokenLanguage:](self, "setDeviceSpokenLanguage:");
  }
  if ((v4[316] & 0x40) != 0)
  {
    self->_timeSinceMapEnteredForeground = *((_DWORD *)v4 + 77);
    *(void *)&self->_flags |= 0x40uLL;
  }
  additionalEnabledMarkets = self->_additionalEnabledMarkets;
  uint64_t v6 = *((void *)v4 + 20);
  if (additionalEnabledMarkets)
  {
    if (v6) {
      -[GEOAdditionalEnabledMarkets mergeFrom:](additionalEnabledMarkets, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOPDClientMetadata setAdditionalEnabledMarkets:](self, "setAdditionalEnabledMarkets:");
  }
  uint64_t v7 = *(void *)(v4 + 316);
  if ((v7 & 0x20) != 0)
  {
    self->_resultListAttributionSupport = *((_DWORD *)v4 + 76);
    *(void *)&self->_flags |= 0x20uLL;
    uint64_t v7 = *(void *)(v4 + 316);
    if ((v7 & 4) == 0)
    {
LABEL_18:
      if ((v7 & 2) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((v7 & 4) == 0)
  {
    goto LABEL_18;
  }
  self->_hourOfDay = *((_DWORD *)v4 + 73);
  *(void *)&self->_flags |= 4uLL;
  if ((*(void *)(v4 + 316) & 2) != 0)
  {
LABEL_19:
    self->_dayOfWeeuint64_t k = *((_DWORD *)v4 + 72);
    *(void *)&self->_flags |= 2uLL;
  }
LABEL_20:
  deviceExtendedLocatiouint64_t n = self->_deviceExtendedLocation;
  uint64_t v9 = *((void *)v4 + 25);
  if (deviceExtendedLocation)
  {
    if (v9) {
      -[GEOLocation mergeFrom:](deviceExtendedLocation, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEOPDClientMetadata setDeviceExtendedLocation:](self, "setDeviceExtendedLocation:");
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v10 = *((id *)v4 + 26);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v50 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEOPDClientMetadata *)self addDeviceHistoricalLocation:*(void *)(*((void *)&v49 + 1) + 8 * i)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v12);
  }

  if ((v4[316] & 0x10) != 0)
  {
    self->_requiredVersiouint64_t n = *((_DWORD *)v4 + 75);
    *(void *)&self->_flags |= 0x10uLL;
  }
  if (*((void *)v4 + 22)) {
    -[GEOPDClientMetadata setDebugApiKey:](self, "setDebugApiKey:");
  }
  uint64_t v15 = [v4 knownClientResolvedTypeDeprecatedsCount];
  if (v15)
  {
    uint64_t v16 = v15;
    for (uint64_t j = 0; j != v16; ++j)
      -[GEOPDClientMetadata addKnownClientResolvedTypeDeprecated:](self, "addKnownClientResolvedTypeDeprecated:", [v4 knownClientResolvedTypeDeprecatedAtIndex:j]);
  }
  if (v4[316] < 0)
  {
    self->_enablePreflightVenues = v4[312];
    *(void *)&self->_flags |= 0x80uLL;
  }
  uint64_t v18 = [v4 knownClientResolvedTypesCount];
  if (v18)
  {
    uint64_t v19 = v18;
    for (uint64_t k = 0; k != v19; ++k)
      -[GEOPDClientMetadata addKnownClientResolvedType:](self, "addKnownClientResolvedType:", [v4 knownClientResolvedTypeAtIndex:k]);
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v21 = *((id *)v4 + 21);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v46;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v46 != v24) {
          objc_enumerationMutation(v21);
        }
        -[GEOPDClientMetadata addBusinessChatPreflightIdentifier:](self, "addBusinessChatPreflightIdentifier:", *(void *)(*((void *)&v45 + 1) + 8 * m), (void)v45);
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v23);
  }

  if (v4[316])
  {
    self->_clientRevisiouint64_t n = *((_DWORD *)v4 + 71);
    *(void *)&self->_flags |= 1uLL;
  }
  localizationCapabilities = self->_localizationCapabilities;
  uint64_t v27 = *((void *)v4 + 31);
  if (localizationCapabilities)
  {
    if (v27) {
      -[GEOLocalizationCapabilities mergeFrom:](localizationCapabilities, "mergeFrom:");
    }
  }
  else if (v27)
  {
    -[GEOPDClientMetadata setLocalizationCapabilities:](self, "setLocalizationCapabilities:");
  }
  if (*((void *)v4 + 28)) {
    -[GEOPDClientMetadata setDeviceSku:](self, "setDeviceSku:");
  }
  if (v4[317])
  {
    self->_siriUserConsentsForAnalysis = v4[313];
    *(void *)&self->_flags |= 0x100uLL;
  }
  uint64_t v28 = objc_msgSend(v4, "supportedMapsResultTypesCount", (void)v45);
  if (v28)
  {
    uint64_t v29 = v28;
    for (uint64_t n = 0; n != v29; ++n)
      -[GEOPDClientMetadata addSupportedMapsResultType:](self, "addSupportedMapsResultType:", [v4 supportedMapsResultTypeAtIndex:n]);
  }
  mapsSuggestionsTouristInfo = self->_mapsSuggestionsTouristInfo;
  uint64_t v32 = (void *)*((void *)v4 + 32);
  if (mapsSuggestionsTouristInfo)
  {
    if (v32)
    {
      NSUInteger v33 = v32;
      if ((_BYTE)v33[3])
      {
        mapsSuggestionsTouristInfo->_isTourist = v33[2];
        *(unsigned char *)&mapsSuggestionsTouristInfo->_flags |= 1u;
      }
    }
  }
  else if (v32)
  {
    -[GEOPDClientMetadata setMapsSuggestionsTouristInfo:](self, "setMapsSuggestionsTouristInfo:");
  }
  uint64_t v34 = [v4 clientRevisionsCount];
  if (v34)
  {
    uint64_t v35 = v34;
    for (iuint64_t i = 0; ii != v35; ++ii)
      -[GEOPDClientMetadata addClientRevisions:](self, "addClientRevisions:", [v4 clientRevisionsAtIndex:ii]);
  }
  if (*((void *)v4 + 33)) {
    -[GEOPDClientMetadata setPreferredDisplayCurrencySymbol:](self, "setPreferredDisplayCurrencySymbol:");
  }
  if (*((void *)v4 + 30)) {
    -[GEOPDClientMetadata setDisplayRegion:](self, "setDisplayRegion:");
  }
  uint64_t v37 = *(void *)(v4 + 316);
  if ((v37 & 0x200) != 0)
  {
    self->_supportEnrichment = v4[314];
    *(void *)&self->_flags |= 0x200uLL;
    uint64_t v37 = *(void *)(v4 + 316);
  }
  if ((v37 & 8) != 0)
  {
    self->_preferredDistanceUnit = *((_DWORD *)v4 + 74);
    *(void *)&self->_flags |= 8uLL;
  }
  uint64_t v38 = [v4 supportedElevationModelsCount];
  if (v38)
  {
    uint64_t v39 = v38;
    for (juint64_t j = 0; jj != v39; ++jj)
      -[GEOPDClientMetadata addSupportedElevationModel:](self, "addSupportedElevationModel:", [v4 supportedElevationModelAtIndex:jj]);
  }
  abClientMetadata = self->_abClientMetadata;
  uint64_t v42 = *((void *)v4 + 19);
  if (abClientMetadata)
  {
    if (v42) {
      -[GEOABSecondPartyPlaceRequestClientMetaData mergeFrom:](abClientMetadata, "mergeFrom:");
    }
  }
  else if (v42)
  {
    -[GEOPDClientMetadata setAbClientMetadata:](self, "setAbClientMetadata:");
  }
  abBranchInfo = self->_abBranchInfo;
  uint64_t v44 = *((void *)v4 + 18);
  if (abBranchInfo)
  {
    if (v44) {
      -[GEOABBranchInfo mergeFrom:](abBranchInfo, "mergeFrom:");
    }
  }
  else if (v44)
  {
    -[GEOPDClientMetadata setAbBranchInfo:](self, "setAbBranchInfo:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((unsigned char *)&self->_flags + 1) & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOPDClientMetadataReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_547);
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
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000400uLL;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDClientMetadata *)self readAll:0];
    [(GEOAdditionalEnabledMarkets *)self->_additionalEnabledMarkets clearUnknownFields:1];
    [(GEOLocation *)self->_deviceExtendedLocation clearUnknownFields:1];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = self->_deviceHistoricalLocations;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v14);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [(GEOLocalizationCapabilities *)self->_localizationCapabilities clearUnknownFields:1];
    mapsSuggestionsTouristInfo = self->_mapsSuggestionsTouristInfo;
    if (mapsSuggestionsTouristInfo)
    {
      uint64_t v13 = mapsSuggestionsTouristInfo->_unknownFields;
      mapsSuggestionsTouristInfo->_unknownFields = 0;
    }
    -[GEOABSecondPartyPlaceRequestClientMetaData clearUnknownFields:](self->_abClientMetadata, "clearUnknownFields:", 1, (void)v14);
    [(GEOABBranchInfo *)self->_abBranchInfo clearUnknownFields:1];
  }
}

- (void)_readAbClientMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 318) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAbClientMetadata_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasAbClientMetadata
{
  return self->_abClientMetadata != 0;
}

- (GEOABSecondPartyPlaceRequestClientMetaData)abClientMetadata
{
  -[GEOPDClientMetadata _readAbClientMetadata]((uint64_t)self);
  abClientMetadata = self->_abClientMetadata;

  return abClientMetadata;
}

- (void)_readAbBranchInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 318) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(void *)(a1 + 8), _readAbBranchInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasAbBranchInfo
{
  return self->_abBranchInfo != 0;
}

- (GEOABBranchInfo)abBranchInfo
{
  -[GEOPDClientMetadata _readAbBranchInfo]((uint64_t)self);
  abBranchInfo = self->_abBranchInfo;

  return abBranchInfo;
}

- (void)setAbBranchInfo:(id)a3
{
  *(void *)&self->_flags |= 0x100010000uLL;
  objc_storeStrong((id *)&self->_abBranchInfo, a3);
}

- (void)clearLocations
{
  [(GEOPDClientMetadata *)self setDeviceHistoricalLocations:0];
  [(GEOPDClientMetadata *)self setDeviceExtendedLocation:0];
  [(GEOPDClientMetadata *)self clearKnownClientResolvedTypes];

  [(GEOPDClientMetadata *)self addKnownClientResolvedType:0];
}

@end