@interface GEOActiveTileGroup
+ (BOOL)isValid:(id)a3;
+ (Class)activeResourceType;
+ (Class)announcementsSupportedLanguagesType;
+ (Class)attributionType;
+ (Class)displayStringsType;
+ (Class)explicitResourceType;
+ (Class)fontChecksumType;
+ (Class)fontType;
+ (Class)iconChecksumType;
+ (Class)iconType;
+ (Class)locationShiftEnabledRegionType;
+ (Class)muninBucketType;
+ (Class)regionalResourceCanonicalNameToFileNameType;
+ (Class)regionalResourceRegionType;
+ (Class)regionalResourceTileType;
+ (Class)regionalResourceType;
+ (Class)resourceCanonicalNameToFileNameType;
+ (Class)resourceType;
+ (Class)staleResourceType;
+ (Class)styleSheetChecksumType;
+ (Class)styleSheetType;
+ (Class)textureChecksumType;
+ (Class)textureType;
+ (Class)tileSetType;
+ (Class)xmlChecksumType;
+ (Class)xmlType;
- (BOOL)hasAbExperimentURLLegacy;
- (BOOL)hasAddressCorrectionInitURLLegacy;
- (BOOL)hasAddressCorrectionUpdateURLLegacy;
- (BOOL)hasAnnouncementsURLLegacy;
- (BOOL)hasBackgroundDispatcherURLLegacy;
- (BOOL)hasBackgroundRevGeoURLLegacy;
- (BOOL)hasBatchReverseGeocoderURLLegacy;
- (BOOL)hasBatchTrafficProbeURLLegacy;
- (BOOL)hasBluePOIURLLegacy;
- (BOOL)hasBusinessPortalBaseURLLegacy;
- (BOOL)hasDataSet;
- (BOOL)hasDataVersionForFlyoverRegion:(unsigned int)a3;
- (BOOL)hasDirectionsURLLegacy;
- (BOOL)hasDispatcherURLLegacy;
- (BOOL)hasEnvironment;
- (BOOL)hasEtaURLLegacy;
- (BOOL)hasFlyoverRegionVersions;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLocationShiftVersion;
- (BOOL)hasLogMessageUsageURLLegacy;
- (BOOL)hasLogMessageUsageV3URLLegacy;
- (BOOL)hasModelVersion;
- (BOOL)hasMuninBaseURL;
- (BOOL)hasOfflineMetadata;
- (BOOL)hasPolyLocationShiftURLLegacy;
- (BOOL)hasProactiveRoutingURLLegacy;
- (BOOL)hasProblemCategoriesURLLegacy;
- (BOOL)hasProblemOptInURLLegacy;
- (BOOL)hasProblemStatusURLLegacy;
- (BOOL)hasProblemSubmissionURLLegacy;
- (BOOL)hasRealtimeTrafficProbeURLLegacy;
- (BOOL)hasRegionalResourcesURLLegacy;
- (BOOL)hasReleaseInfo;
- (BOOL)hasReserved;
- (BOOL)hasResourcesURLLegacy;
- (BOOL)hasReverseGeocoderVersionsURLLegacy;
- (BOOL)hasSearchAttributionManifestURLLegacy;
- (BOOL)hasSimpleETAURLLegacy;
- (BOOL)hasSpatialLookupURLLegacy;
- (BOOL)hasUniqueIdentifier;
- (BOOL)hasUrlInfoSet;
- (BOOL)hasVersionManifest;
- (BOOL)hasWifiConnectionQualityProbeURLLegacy;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMuninEnabled;
- (BOOL)isRegionalResource:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsTileStyle:(int)a3 size:(int)a4 scale:(int)a5;
- (GEOActiveTileGroup)init;
- (GEOActiveTileGroup)initWithData:(id)a3;
- (GEOActiveTileGroup)initWithDictionary:(id)a3;
- (GEOActiveTileGroup)initWithJSON:(id)a3;
- (GEODataSetDescription)dataSet;
- (GEOOfflineMetadata)offlineMetadata;
- (GEOTileKeyList)regionalResourceKeysForTileKey:(uint64_t)a3 scale:(unsigned __int8)a4 scenarios:(void *)a5;
- (GEOTileSetRegion)hybridUnavailableRegionAtIndex:(SEL)a3;
- (GEOTileSetRegion)hybridUnavailableRegions;
- (GEOURLInfoSet)urlInfoSet;
- (GEOVersionManifest)versionManifest;
- (NSData)flyoverRegionVersions;
- (NSData)reserved;
- (NSMutableArray)activeResources;
- (NSMutableArray)announcementsSupportedLanguages;
- (NSMutableArray)attributions;
- (NSMutableArray)displayStrings;
- (NSMutableArray)explicitResources;
- (NSMutableArray)fontChecksums;
- (NSMutableArray)fonts;
- (NSMutableArray)iconChecksums;
- (NSMutableArray)icons;
- (NSMutableArray)locationShiftEnabledRegions;
- (NSMutableArray)muninBuckets;
- (NSMutableArray)regionalResourceRegions;
- (NSMutableArray)regionalResourceTiles;
- (NSMutableArray)regionalResources;
- (NSMutableArray)resources;
- (NSMutableArray)staleResources;
- (NSMutableArray)styleSheetChecksums;
- (NSMutableArray)styleSheets;
- (NSMutableArray)textureChecksums;
- (NSMutableArray)textures;
- (NSMutableArray)tileSets;
- (NSMutableArray)xmlChecksums;
- (NSMutableArray)xmls;
- (NSMutableDictionary)regionalResourceCanonicalNameToFileName;
- (NSMutableDictionary)resourceCanonicalNameToFileName;
- (NSString)abExperimentURLLegacy;
- (NSString)addressCorrectionInitURLLegacy;
- (NSString)addressCorrectionUpdateURLLegacy;
- (NSString)announcementsURLLegacy;
- (NSString)backgroundDispatcherURLLegacy;
- (NSString)backgroundRevGeoURLLegacy;
- (NSString)batchReverseGeocoderURLLegacy;
- (NSString)batchTrafficProbeURLLegacy;
- (NSString)bluePOIURLLegacy;
- (NSString)businessPortalBaseURLLegacy;
- (NSString)directionsURLLegacy;
- (NSString)dispatcherURLLegacy;
- (NSString)environment;
- (NSString)etaURLLegacy;
- (NSString)logMessageUsageURLLegacy;
- (NSString)logMessageUsageV3URLLegacy;
- (NSString)muninBaseURL;
- (NSString)polyLocationShiftURLLegacy;
- (NSString)proactiveRoutingURLLegacy;
- (NSString)problemCategoriesURLLegacy;
- (NSString)problemOptInURLLegacy;
- (NSString)problemStatusURLLegacy;
- (NSString)problemSubmissionURLLegacy;
- (NSString)realtimeTrafficProbeURLLegacy;
- (NSString)regionalResourcesURLLegacy;
- (NSString)releaseInfo;
- (NSString)resourcesURLLegacy;
- (NSString)reverseGeocoderVersionsURLLegacy;
- (NSString)searchAttributionManifestURLLegacy;
- (NSString)simpleETAURLLegacy;
- (NSString)spatialLookupURLLegacy;
- (NSString)uniqueIdentifier;
- (NSString)wifiConnectionQualityProbeURLLegacy;
- (PBUnknownFields)unknownFields;
- (double)timeToLiveForTileKey:(void *)a1;
- (id)_decodedFlyoverRegionVersions;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:isJSON:;
- (id)activeResourceAtIndex:(unint64_t)a3;
- (id)activeScalesAsString:(int)a3;
- (id)activeScenariosAsString:(int)a3;
- (id)activeTileSetForKey:(uint64_t)a3;
- (id)activeTileSetForStyle:(int)a3;
- (id)activeTileSetForStyle:(int)a3 size:(int)a4 scale:(int)a5;
- (id)activeTileSetForTileType:(int)a3 scale:(int)a4;
- (id)announcementsSupportedLanguagesAtIndex:(unint64_t)a3;
- (id)attributionAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayStringsAtIndex:(unint64_t)a3;
- (id)explicitResourceAtIndex:(unint64_t)a3;
- (id)fontAtIndex:(unint64_t)a3;
- (id)fontChecksumAtIndex:(unint64_t)a3;
- (id)hashForPurpose:(unint64_t)a3;
- (id)iconAtIndex:(unint64_t)a3;
- (id)iconChecksumAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)languageForTileKey:(uint64_t)a3 overrideLocale:(void *)a4;
- (id)languageForTileKey:(void *)a1;
- (id)localizationURLStringForTileKey:(void *)a1;
- (id)locationShiftEnabledRegionAtIndex:(unint64_t)a3;
- (id)mapAttributionForCoordinate:(id)a3 isGlobal:(BOOL *)a4;
- (id)mapAttributionURLForCoordinate:(id)a3;
- (id)muninBucketAtIndex:(unint64_t)a3;
- (id)muninBucketURLForId:(unsigned __int16)a3 lod:(unsigned __int8)a4;
- (id)regionalResourceAtIndex:(unint64_t)a3;
- (id)regionalResourceCanonicalNameToFileNameForKey:(id)a3;
- (id)regionalResourceRegionAtIndex:(unint64_t)a3;
- (id)regionalResourceTileAtIndex:(unint64_t)a3;
- (id)regionalResourcesForMapRect:(id)a3;
- (id)regionalResourcesForMapRegions:(id)a3 resourceFilter:(id)a4 attributionFilter:(id)a5;
- (id)resourceAtIndex:(unint64_t)a3;
- (id)resourceCanonicalNameToFileNameForKey:(id)a3;
- (id)staleResourceAtIndex:(unint64_t)a3;
- (id)styleSheetAtIndex:(unint64_t)a3;
- (id)styleSheetChecksumAtIndex:(unint64_t)a3;
- (id)textureAtIndex:(unint64_t)a3;
- (id)textureChecksumAtIndex:(unint64_t)a3;
- (id)tileSetAtIndex:(unint64_t)a3;
- (id)xmlAtIndex:(unint64_t)a3;
- (id)xmlChecksumAtIndex:(unint64_t)a3;
- (int)StringAsActiveScales:(id)a3;
- (int)StringAsActiveScenarios:(id)a3;
- (int)activeScaleAtIndex:(unint64_t)a3;
- (int)activeScales;
- (int)activeScenarioAtIndex:(unint64_t)a3;
- (int)activeScenarios;
- (uint64_t)_reserveHybridUnavailableRegions:(uint64_t)a1;
- (uint64_t)hasRegionalResourcesForTileKey:(uint64_t)a3;
- (uint64_t)isAvailableForTileKey:(uint64_t)a3;
- (uint64_t)isHybridModeAvailableForTileKey:(uint64_t)a3;
- (uint64_t)largestRegionalResourceZoomLevelContainingTileKey:(uint64_t)a3;
- (uint64_t)requestStyleForTileKey:(void *)a1;
- (uint64_t)useProxyAuthForTileKey:(uint64_t)a3;
- (uint64_t)versionForTileKey:(void *)a1;
- (unint64_t)activeResourcesCount;
- (unint64_t)activeScalesCount;
- (unint64_t)activeScenariosCount;
- (unint64_t)announcementsSupportedLanguagesCount;
- (unint64_t)attributionsCount;
- (unint64_t)displayStringsCount;
- (unint64_t)explicitResourcesCount;
- (unint64_t)fontChecksumsCount;
- (unint64_t)fontsCount;
- (unint64_t)hash;
- (unint64_t)hybridUnavailableRegionsCount;
- (unint64_t)iconChecksumsCount;
- (unint64_t)iconsCount;
- (unint64_t)locationShiftEnabledRegionsCount;
- (unint64_t)muninBucketsCount;
- (unint64_t)regionalResourceCanonicalNameToFileNameCount;
- (unint64_t)regionalResourceRegionsCount;
- (unint64_t)regionalResourceTilesCount;
- (unint64_t)regionalResourcesCount;
- (unint64_t)resourceCanonicalNameToFileNameCount;
- (unint64_t)resourcesCount;
- (unint64_t)staleResourcesCount;
- (unint64_t)styleSheetChecksumsCount;
- (unint64_t)styleSheetsCount;
- (unint64_t)textureChecksumsCount;
- (unint64_t)texturesCount;
- (unint64_t)tileSetsCount;
- (unint64_t)xmlChecksumsCount;
- (unint64_t)xmlsCount;
- (unsigned)dataVersionForFlyoverRegion:(unsigned int)a3;
- (unsigned)identifier;
- (unsigned)locationShiftVersion;
- (unsigned)modelVersion;
- (unsigned)versionForFlyoverRegion:(unsigned int)a3;
- (void)_addNoFlagsActiveResource:(uint64_t)a1;
- (void)_addNoFlagsAnnouncementsSupportedLanguages:(uint64_t)a1;
- (void)_addNoFlagsAttribution:(uint64_t)a1;
- (void)_addNoFlagsDisplayStrings:(uint64_t)a1;
- (void)_addNoFlagsExplicitResource:(uint64_t)a1;
- (void)_addNoFlagsFont:(uint64_t)a1;
- (void)_addNoFlagsFontChecksum:(uint64_t)a1;
- (void)_addNoFlagsIcon:(uint64_t)a1;
- (void)_addNoFlagsIconChecksum:(uint64_t)a1;
- (void)_addNoFlagsLocationShiftEnabledRegion:(uint64_t)a1;
- (void)_addNoFlagsMuninBucket:(uint64_t)a1;
- (void)_addNoFlagsRegionalResource:(uint64_t)a1;
- (void)_addNoFlagsRegionalResourceRegion:(uint64_t)a1;
- (void)_addNoFlagsRegionalResourceTile:(uint64_t)a1;
- (void)_addNoFlagsResource:(uint64_t)a1;
- (void)_addNoFlagsStaleResource:(uint64_t)a1;
- (void)_addNoFlagsStyleSheet:(uint64_t)a1;
- (void)_addNoFlagsStyleSheetChecksum:(uint64_t)a1;
- (void)_addNoFlagsTexture:(uint64_t)a1;
- (void)_addNoFlagsTextureChecksum:(uint64_t)a1;
- (void)_addNoFlagsTileSet:(uint64_t)a1;
- (void)_addNoFlagsXml:(uint64_t)a1;
- (void)_addNoFlagsXmlChecksum:(uint64_t)a1;
- (void)_readAbExperimentURLLegacy;
- (void)_readActiveResources;
- (void)_readActiveScales;
- (void)_readActiveScenarios;
- (void)_readAddressCorrectionInitURLLegacy;
- (void)_readAddressCorrectionUpdateURLLegacy;
- (void)_readAnnouncementsSupportedLanguages;
- (void)_readAnnouncementsURLLegacy;
- (void)_readAttributions;
- (void)_readBackgroundDispatcherURLLegacy;
- (void)_readBackgroundRevGeoURLLegacy;
- (void)_readBatchReverseGeocoderURLLegacy;
- (void)_readBatchTrafficProbeURLLegacy;
- (void)_readBluePOIURLLegacy;
- (void)_readBusinessPortalBaseURLLegacy;
- (void)_readDataSet;
- (void)_readDirectionsURLLegacy;
- (void)_readDispatcherURLLegacy;
- (void)_readDisplayStrings;
- (void)_readEnvironment;
- (void)_readEtaURLLegacy;
- (void)_readExplicitResources;
- (void)_readFlyoverRegionVersions;
- (void)_readFontChecksums;
- (void)_readFonts;
- (void)_readHybridUnavailableRegions;
- (void)_readIconChecksums;
- (void)_readIcons;
- (void)_readLocationShiftEnabledRegions;
- (void)_readLogMessageUsageURLLegacy;
- (void)_readLogMessageUsageV3URLLegacy;
- (void)_readMuninBaseURL;
- (void)_readMuninBuckets;
- (void)_readOfflineMetadata;
- (void)_readPolyLocationShiftURLLegacy;
- (void)_readProactiveRoutingURLLegacy;
- (void)_readProblemCategoriesURLLegacy;
- (void)_readProblemOptInURLLegacy;
- (void)_readProblemStatusURLLegacy;
- (void)_readProblemSubmissionURLLegacy;
- (void)_readRealtimeTrafficProbeURLLegacy;
- (void)_readRegionalResourceCanonicalNameToFileName;
- (void)_readRegionalResourceRegions;
- (void)_readRegionalResourceTiles;
- (void)_readRegionalResources;
- (void)_readRegionalResourcesURLLegacy;
- (void)_readReleaseInfo;
- (void)_readReserved;
- (void)_readResourceCanonicalNameToFileName;
- (void)_readResources;
- (void)_readResourcesURLLegacy;
- (void)_readReverseGeocoderVersionsURLLegacy;
- (void)_readSearchAttributionManifestURLLegacy;
- (void)_readSimpleETAURLLegacy;
- (void)_readSpatialLookupURLLegacy;
- (void)_readStaleResources;
- (void)_readStyleSheetChecksums;
- (void)_readStyleSheets;
- (void)_readTextureChecksums;
- (void)_readTextures;
- (void)_readTileSets;
- (void)_readUniqueIdentifier;
- (void)_readUrlInfoSet;
- (void)_readVersionManifest;
- (void)_readWifiConnectionQualityProbeURLLegacy;
- (void)_readXmlChecksums;
- (void)_readXmls;
- (void)_resetBestLanguages;
- (void)_setDecodedFlyoverRegionVersions:(id)a3;
- (void)_setNoFlagsRegionalResourceCanonicalNameToFileNameValue:(void *)a3 forKey:;
- (void)_setNoFlagsResourceCanonicalNameToFileNameValue:(void *)a3 forKey:;
- (void)addActiveResource:(id)a3;
- (void)addActiveScale:(int)a3;
- (void)addActiveScenario:(int)a3;
- (void)addAnnouncementsSupportedLanguages:(id)a3;
- (void)addAttribution:(id)a3;
- (void)addDisplayStrings:(id)a3;
- (void)addExplicitResource:(id)a3;
- (void)addFont:(id)a3;
- (void)addFontChecksum:(id)a3;
- (void)addHybridUnavailableRegion:(GEOTileSetRegion *)a3;
- (void)addIcon:(id)a3;
- (void)addIconChecksum:(id)a3;
- (void)addLocationShiftEnabledRegion:(id)a3;
- (void)addMuninBucket:(id)a3;
- (void)addRegionalResource:(id)a3;
- (void)addRegionalResourceRegion:(id)a3;
- (void)addRegionalResourceTile:(id)a3;
- (void)addResource:(id)a3;
- (void)addStaleResource:(id)a3;
- (void)addStyleSheet:(id)a3;
- (void)addStyleSheetChecksum:(id)a3;
- (void)addTexture:(id)a3;
- (void)addTextureChecksum:(id)a3;
- (void)addTileSet:(id)a3;
- (void)addXml:(id)a3;
- (void)addXmlChecksum:(id)a3;
- (void)clearActiveResources;
- (void)clearActiveScales;
- (void)clearActiveScenarios;
- (void)clearAnnouncementsSupportedLanguages;
- (void)clearAttributions;
- (void)clearDisplayStrings;
- (void)clearExplicitResources;
- (void)clearFontChecksums;
- (void)clearFonts;
- (void)clearHybridUnavailableRegions;
- (void)clearIconChecksums;
- (void)clearIcons;
- (void)clearLocationShiftEnabledRegions;
- (void)clearModernFormatFields;
- (void)clearMuninBuckets;
- (void)clearRegionalResourceCanonicalNameToFileName;
- (void)clearRegionalResourceRegions;
- (void)clearRegionalResourceTiles;
- (void)clearRegionalResources;
- (void)clearResourceCanonicalNameToFileName;
- (void)clearResources;
- (void)clearStaleResources;
- (void)clearStyleSheetChecksums;
- (void)clearStyleSheets;
- (void)clearTextureChecksums;
- (void)clearTextures;
- (void)clearTileSets;
- (void)clearUnknownFields:(BOOL)a3;
- (void)clearXmlChecksums;
- (void)clearXmls;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)enumerateFlyoverRegions:(id)a3;
- (void)enumerateRegionalResourceCanonicalNameToFileNameUsingBlock:(id)a3;
- (void)enumerateResourceCanonicalNameToFileNameUsingBlock:(id)a3;
- (void)iterateActiveTileSets:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)populateLegacyFormat;
- (void)populateRegionalResources:(void *)a1;
- (void)readAll:(BOOL)a3;
- (void)setAbExperimentURLLegacy:(id)a3;
- (void)setActiveResources:(id)a3;
- (void)setActiveScales:(int *)a3 count:(unint64_t)a4;
- (void)setActiveScenarios:(int *)a3 count:(unint64_t)a4;
- (void)setAddressCorrectionInitURLLegacy:(id)a3;
- (void)setAddressCorrectionUpdateURLLegacy:(id)a3;
- (void)setAnnouncementsSupportedLanguages:(id)a3;
- (void)setAnnouncementsURLLegacy:(id)a3;
- (void)setAttributions:(id)a3;
- (void)setBackgroundDispatcherURLLegacy:(id)a3;
- (void)setBackgroundRevGeoURLLegacy:(id)a3;
- (void)setBatchReverseGeocoderURLLegacy:(id)a3;
- (void)setBatchTrafficProbeURLLegacy:(id)a3;
- (void)setBluePOIURLLegacy:(id)a3;
- (void)setBusinessPortalBaseURLLegacy:(id)a3;
- (void)setDataSet:(id)a3;
- (void)setDirectionsURLLegacy:(id)a3;
- (void)setDispatcherURLLegacy:(id)a3;
- (void)setDisplayStrings:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setEtaURLLegacy:(id)a3;
- (void)setExplicitResources:(id)a3;
- (void)setFlyoverRegionVersions:(id)a3;
- (void)setFontChecksums:(id)a3;
- (void)setFonts:(id)a3;
- (void)setHasLocationShiftVersion:(BOOL)a3;
- (void)setHasModelVersion:(BOOL)a3;
- (void)setHybridUnavailableRegions:(GEOTileSetRegion *)a3 count:(unint64_t)a4;
- (void)setIconChecksums:(id)a3;
- (void)setIcons:(id)a3;
- (void)setIdentifier:(unsigned int)a3;
- (void)setLocationShiftEnabledRegions:(id)a3;
- (void)setLocationShiftVersion:(unsigned int)a3;
- (void)setLogMessageUsageURLLegacy:(id)a3;
- (void)setLogMessageUsageV3URLLegacy:(id)a3;
- (void)setModelVersion:(unsigned int)a3;
- (void)setMuninBaseURL:(id)a3;
- (void)setMuninBuckets:(id)a3;
- (void)setOfflineMetadata:(id)a3;
- (void)setPolyLocationShiftURLLegacy:(id)a3;
- (void)setProactiveRoutingURLLegacy:(id)a3;
- (void)setProblemCategoriesURLLegacy:(id)a3;
- (void)setProblemOptInURLLegacy:(id)a3;
- (void)setProblemStatusURLLegacy:(id)a3;
- (void)setProblemSubmissionURLLegacy:(id)a3;
- (void)setRealtimeTrafficProbeURLLegacy:(id)a3;
- (void)setRegionalResourceCanonicalNameToFileName:(id)a3;
- (void)setRegionalResourceCanonicalNameToFileNameValue:(id)a3 forKey:(id)a4;
- (void)setRegionalResourceRegions:(id)a3;
- (void)setRegionalResourceTiles:(id)a3;
- (void)setRegionalResources:(id)a3;
- (void)setRegionalResourcesURLLegacy:(id)a3;
- (void)setReleaseInfo:(id)a3;
- (void)setReserved:(id)a3;
- (void)setResourceCanonicalNameToFileName:(id)a3;
- (void)setResourceCanonicalNameToFileNameValue:(id)a3 forKey:(id)a4;
- (void)setResources:(id)a3;
- (void)setResourcesURLLegacy:(id)a3;
- (void)setReverseGeocoderVersionsURLLegacy:(id)a3;
- (void)setSearchAttributionManifestURLLegacy:(id)a3;
- (void)setSimpleETAURLLegacy:(id)a3;
- (void)setSpatialLookupURLLegacy:(id)a3;
- (void)setStaleResources:(id)a3;
- (void)setStyleSheetChecksums:(id)a3;
- (void)setStyleSheets:(id)a3;
- (void)setTextureChecksums:(id)a3;
- (void)setTextures:(id)a3;
- (void)setTileSets:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setUrlInfoSet:(id)a3;
- (void)setVersionManifest:(id)a3;
- (void)setWifiConnectionQualityProbeURLLegacy:(id)a3;
- (void)setXmlChecksums:(id)a3;
- (void)setXmls:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOActiveTileGroup

uint64_t __74__GEOActiveTileGroup_GEOResourceManifestManagerAdditions__hashForPurpose___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)isMuninEnabled
{
  unint64_t v3 = [(GEOActiveTileGroup *)self muninBucketsCount];
  v4 = [(GEOActiveTileGroup *)self activeTileSetForStyle:57];

  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5;
}

- (unint64_t)muninBucketsCount
{
  -[GEOActiveTileGroup _readMuninBuckets]((uint64_t)self);
  muninBuckets = self->_muninBuckets;

  return [(NSMutableArray *)muninBuckets count];
}

- (void)_readMuninBuckets
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x800000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMuninBuckets_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (id)activeTileSetForStyle:(int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(GEOActiveTileGroup *)self tileSets];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 style] == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)activeTileSetForStyle:(int)a3 size:(int)a4 scale:(int)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v8 = [(GEOActiveTileGroup *)self tileSets];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v13 style] == a3
          && [v13 size] == a4
          && [v13 scale] == a5)
        {
          id v14 = v13;
          goto LABEL_13;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_13:

  return v14;
}

- (id)activeTileSetForTileType:(int)a3 scale:(int)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [(GEOActiveTileGroup *)self tileSets];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v12 style] == a3)
        {
          if ([v12 scale] == a4)
          {
            id v14 = v12;

            uint64_t v9 = v14;
            goto LABEL_15;
          }
          if (![v12 scale])
          {
            id v13 = v12;

            uint64_t v9 = v13;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
LABEL_15:

  return v9;
}

- (NSMutableArray)tileSets
{
  -[GEOActiveTileGroup _readTileSets]((uint64_t)self);
  tileSets = self->_tileSets;

  return tileSets;
}

- (void)_readTileSets
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x8000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTileSets_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

id __74__GEOActiveTileGroup_GEOResourceManifestManagerAdditions__hashForPurpose___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 filename];
  v4 = [v3 pathExtension];
  uint64_t v5 = (void *)[v4 length];
  if (v5)
  {
    if ([*(id *)(a1 + 32) containsObject:v4]) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  id v6 = v5;

  return v6;
}

- (BOOL)isRegionalResource:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 resourceType] != 5 && objc_msgSend(v4, "resourceType") != 6)
  {
LABEL_12:
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v5 = [(GEOActiveTileGroup *)self regionalResources];
    uint64_t v13 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v20;
LABEL_14:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v5);
        }
        long long v16 = [*(id *)(*((void *)&v19 + 1) + 8 * v15) resources];
        char v17 = [v16 containsObject:v4];

        if (v17) {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v13) {
            goto LABEL_14;
          }
          goto LABEL_24;
        }
      }
LABEL_22:
      LOBYTE(v13) = 1;
    }
    goto LABEL_24;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = [(GEOActiveTileGroup *)self attributions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (!v6)
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v24;
LABEL_5:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v24 != v8) {
      objc_enumerationMutation(v5);
    }
    uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
    uint64_t v11 = [v10 resources];
    int v12 = [v11 containsObject:v4];

    if (v12) {
      break;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v7) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  if ([v10 regionsCount]) {
    goto LABEL_22;
  }
  LOBYTE(v13) = [v4 regionsCount] != 0;
LABEL_24:

  return v13;
}

- (NSMutableArray)regionalResources
{
  -[GEOActiveTileGroup _readRegionalResources]((uint64_t)self);
  regionalResources = self->_regionalResources;

  return regionalResources;
}

- (id)regionalResourceAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readRegionalResources]((uint64_t)self);
  regionalResources = self->_regionalResources;

  return (id)[(NSMutableArray *)regionalResources objectAtIndex:a3];
}

- (unint64_t)regionalResourcesCount
{
  -[GEOActiveTileGroup _readRegionalResources]((uint64_t)self);
  regionalResources = self->_regionalResources;

  return [(NSMutableArray *)regionalResources count];
}

- (void)_readRegionalResources
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x1000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRegionalResources_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (id)hashForPurpose:(unint64_t)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v5 = 0;
  }
  else
  {
    id v4 = objc_getAssociatedObject(self, 0);
    if (v4)
    {
      id v5 = v4;
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1ED73EDD0];
      uint64_t v7 = [(GEOActiveTileGroup *)self activeResources];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __74__GEOActiveTileGroup_GEOResourceManifestManagerAdditions__hashForPurpose___block_invoke;
      v26[3] = &unk_1E53E2CE8;
      id v8 = v6;
      id v27 = v8;
      uint64_t v9 = objc_msgSend(v7, "_geo_compactMap:", v26);
      uint64_t v10 = (void *)[v9 mutableCopy];

      [v10 sortUsingComparator:&__block_literal_global_382];
      memset(&c, 0, sizeof(c));
      if (CC_MD5_Init(&c) != 1) {
        goto LABEL_16;
      }
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v11);
            }
            objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "dataUsingEncoding:", 4, (void)v21);
            id v16 = objc_claimAutoreleasedReturnValue();
            int v17 = CC_MD5_Update(&c, (const void *)[v16 bytes], objc_msgSend(v16, "length"));

            if (v17 != 1)
            {

              goto LABEL_16;
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      if (CC_MD5_Final(md, &c) == 1)
      {
        long long v18 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:md length:16 freeWhenDone:0];
        long long v19 = objc_msgSend(v18, "_geo_hexString");
        objc_setAssociatedObject(self, 0, v19, (void *)1);
        id v5 = v19;
      }
      else
      {
LABEL_16:
        id v5 = 0;
      }
    }
  }

  return v5;
}

- (NSMutableArray)activeResources
{
  -[GEOActiveTileGroup _readActiveResources]((uint64_t)self);
  activeResources = self->_activeResources;

  return activeResources;
}

- (void)_readActiveResources
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readActiveResources_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void)_setNoFlagsRegionalResourceCanonicalNameToFileNameValue:(void *)a3 forKey:
{
  id v9 = a2;
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = *(void **)(a1 + 400);
    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v8 = *(void **)(a1 + 400);
      *(void *)(a1 + 400) = v7;

      uint64_t v6 = *(void **)(a1 + 400);
    }
    [v6 setObject:v9 forKey:v5];
  }
}

- (void)_addNoFlagsTileSet:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 552);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 552);
      *(void *)(a1 + 552) = v5;

      id v4 = *(void **)(a1 + 552);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_setNoFlagsResourceCanonicalNameToFileNameValue:(void *)a3 forKey:
{
  id v9 = a2;
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = *(void **)(a1 + 456);
    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v8 = *(void **)(a1 + 456);
      *(void *)(a1 + 456) = v7;

      uint64_t v6 = *(void **)(a1 + 456);
    }
    [v6 setObject:v9 forKey:v5];
  }
}

- (void)_addNoFlagsRegionalResource:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 432);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 432);
      *(void *)(a1 + 432) = v5;

      id v4 = *(void **)(a1 + 432);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_addNoFlagsActiveResource:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 104);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = v5;

      id v4 = *(void **)(a1 + 104);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_addNoFlagsAnnouncementsSupportedLanguages:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 128);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = v5;

      id v4 = *(void **)(a1 + 128);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_addNoFlagsMuninBucket:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 328);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 328);
      *(void *)(a1 + 328) = v5;

      id v4 = *(void **)(a1 + 328);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_addNoFlagsAttribution:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 144);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 144);
      *(void *)(a1 + 144) = v5;

      id v4 = *(void **)(a1 + 144);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_addNoFlagsExplicitResource:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 248);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 248);
      *(void *)(a1 + 248) = v5;

      id v4 = *(void **)(a1 + 248);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_addNoFlagsDisplayStrings:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 224);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 224);
      *(void *)(a1 + 224) = v5;

      id v4 = *(void **)(a1 + 224);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOActiveTileGroupReadAllFrom((uint64_t)self, a3, 0);
}

- (GEOURLInfoSet)urlInfoSet
{
  -[GEOActiveTileGroup _readUrlInfoSet]((uint64_t)self);
  urlInfoSet = self->_urlInfoSet;

  return urlInfoSet;
}

- (void)_readUrlInfoSet
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 640) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUrlInfoSet_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (id)activeTileSetForKey:(uint64_t)a3
{
  if (a3)
  {
    int v5 = *(unsigned char *)a3 & 0x7F;
    if (v5 == 16)
    {
      unsigned int v12 = *(_DWORD *)(a3 + 9);
      uint64_t v7 = ((*(void *)(a3 + 1) >> 61) | (8 * v12)) & 0x3FFF;
      uint64_t v8 = (v12 >> 11) & 0xF;
      uint64_t v9 = (v12 >> 15) & 0xF;
    }
    else
    {
      if (v5 != 2)
      {
        unsigned int v13 = 0;
        if (GEOTileKeyStyle(a3, &v13))
        {
          uint64_t v10 = [a1 activeTileSetForStyle:v13];
        }
        else
        {
          uint64_t v10 = 0;
        }
LABEL_13:
        return v10;
      }
      unsigned __int16 v6 = *(unsigned __int8 *)(a3 + 15);
      uint64_t v7 = *(unsigned __int16 *)(a3 + 13) >> 2;
      uint64_t v8 = v6 & 0xF;
      uint64_t v9 = v6 >> 4;
    }
    uint64_t v10 = [a1 activeTileSetForStyle:v7 size:v8 scale:v9];
    goto LABEL_13;
  }
  uint64_t v10 = 0;
  return v10;
}

- (id)languageForTileKey:(void *)a1
{
  v1 = objc_msgSend(a1, "activeTileSetForKey:");
  v2 = [v1 bestLanguageWithOverrideLocale:0];

  return v2;
}

- (GEOActiveTileGroup)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOActiveTileGroup;
  uint64_t v3 = [(GEOActiveTileGroup *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    int v5 = v3;
  }

  return v4;
}

- (NSMutableDictionary)resourceCanonicalNameToFileName
{
  -[GEOActiveTileGroup _readResourceCanonicalNameToFileName]((uint64_t)self);
  resourceCanonicalNameToFileName = self->_resourceCanonicalNameToFileName;

  return resourceCanonicalNameToFileName;
}

- (void)_readResourceCanonicalNameToFileName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x8000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResourceCanonicalNameToFileName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableDictionary)regionalResourceCanonicalNameToFileName
{
  -[GEOActiveTileGroup _readRegionalResourceCanonicalNameToFileName]((uint64_t)self);
  regionalResourceCanonicalNameToFileName = self->_regionalResourceCanonicalNameToFileName;

  return regionalResourceCanonicalNameToFileName;
}

- (void)_readRegionalResourceCanonicalNameToFileName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x100000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRegionalResourceCanonicalNameToFileName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void)dealloc
{
  [(GEOActiveTileGroup *)self clearHybridUnavailableRegions];
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOActiveTileGroup;
  [(GEOActiveTileGroup *)&v3 dealloc];
}

- (void)clearHybridUnavailableRegions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  self->_hybridUnavailableRegionsSpace = 0;
  self->_hybridUnavailableRegionsCount = 0;
  free(self->_hybridUnavailableRegions);
  self->_hybridUnavailableRegions = 0;
}

- (NSMutableArray)attributions
{
  -[GEOActiveTileGroup _readAttributions]((uint64_t)self);
  attributions = self->_attributions;

  return attributions;
}

- (id)attributionAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readAttributions]((uint64_t)self);
  attributions = self->_attributions;

  return (id)[(NSMutableArray *)attributions objectAtIndex:a3];
}

- (unint64_t)attributionsCount
{
  -[GEOActiveTileGroup _readAttributions]((uint64_t)self);
  attributions = self->_attributions;

  return [(NSMutableArray *)attributions count];
}

- (void)_readAttributions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttributions_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_25;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_25;
    }
    GEOActiveTileGroupReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOActiveTileGroupCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (unint64_t)activeScenariosCount
{
  return self->_activeScenarios.count;
}

- (void)_readActiveScenarios
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readActiveScenarios_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (unint64_t)activeScalesCount
{
  return self->_activeScales.count;
}

- (void)_readActiveScales
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readActiveScales_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSString)uniqueIdentifier
{
  -[GEOActiveTileGroup _readUniqueIdentifier]((uint64_t)self);
  uniqueIdentifier = self->_uniqueIdentifier;

  return uniqueIdentifier;
}

- (unint64_t)staleResourcesCount
{
  -[GEOActiveTileGroup _readStaleResources]((uint64_t)self);
  staleResources = self->_staleResources;

  return [(NSMutableArray *)staleResources count];
}

- (unsigned)modelVersion
{
  return self->_modelVersion;
}

- (GEODataSetDescription)dataSet
{
  -[GEOActiveTileGroup _readDataSet]((uint64_t)self);
  dataSet = self->_dataSet;

  return dataSet;
}

- (int)activeScenarioAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readActiveScenarios]((uint64_t)self);
  p_activeScenarios = &self->_activeScenarios;
  unint64_t count = self->_activeScenarios.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    uint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_activeScenarios->list[a3];
}

- (int)activeScaleAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readActiveScales]((uint64_t)self);
  p_activeScales = &self->_activeScales;
  unint64_t count = self->_activeScales.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    uint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_activeScales->list[a3];
}

- (void)_readUniqueIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 640) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUniqueIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void)_readStaleResources
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x400000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStaleResources_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void)_readDataSet
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x80000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDataSet_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)explicitResources
{
  -[GEOActiveTileGroup _readExplicitResources]((uint64_t)self);
  explicitResources = self->_explicitResources;

  return explicitResources;
}

- (void)_readExplicitResources
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x2000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExplicitResources_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (GEOVersionManifest)versionManifest
{
  -[GEOActiveTileGroup _readVersionManifest]((uint64_t)self);
  versionManifest = self->_versionManifest;

  return versionManifest;
}

- (void)_readVersionManifest
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 640) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVersionManifest_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xmls, 0);
  objc_storeStrong((id *)&self->_xmlChecksums, 0);
  objc_storeStrong((id *)&self->_wifiConnectionQualityProbeURLLegacy, 0);
  objc_storeStrong((id *)&self->_versionManifest, 0);
  objc_storeStrong((id *)&self->_urlInfoSet, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_tileSets, 0);
  objc_storeStrong((id *)&self->_textures, 0);
  objc_storeStrong((id *)&self->_textureChecksums, 0);
  objc_storeStrong((id *)&self->_styleSheets, 0);
  objc_storeStrong((id *)&self->_styleSheetChecksums, 0);
  objc_storeStrong((id *)&self->_staleResources, 0);
  objc_storeStrong((id *)&self->_spatialLookupURLLegacy, 0);
  objc_storeStrong((id *)&self->_simpleETAURLLegacy, 0);
  objc_storeStrong((id *)&self->_searchAttributionManifestURLLegacy, 0);
  objc_storeStrong((id *)&self->_reverseGeocoderVersionsURLLegacy, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_resourcesURLLegacy, 0);
  objc_storeStrong((id *)&self->_resourceCanonicalNameToFileName, 0);
  objc_storeStrong((id *)&self->_reserved, 0);
  objc_storeStrong((id *)&self->_releaseInfo, 0);
  objc_storeStrong((id *)&self->_regionalResources, 0);
  objc_storeStrong((id *)&self->_regionalResourcesURLLegacy, 0);
  objc_storeStrong((id *)&self->_regionalResourceTiles, 0);
  objc_storeStrong((id *)&self->_regionalResourceRegions, 0);
  objc_storeStrong((id *)&self->_regionalResourceCanonicalNameToFileName, 0);
  objc_storeStrong((id *)&self->_realtimeTrafficProbeURLLegacy, 0);
  objc_storeStrong((id *)&self->_problemSubmissionURLLegacy, 0);
  objc_storeStrong((id *)&self->_problemStatusURLLegacy, 0);
  objc_storeStrong((id *)&self->_problemOptInURLLegacy, 0);
  objc_storeStrong((id *)&self->_problemCategoriesURLLegacy, 0);
  objc_storeStrong((id *)&self->_proactiveRoutingURLLegacy, 0);
  objc_storeStrong((id *)&self->_polyLocationShiftURLLegacy, 0);
  objc_storeStrong((id *)&self->_offlineMetadata, 0);
  objc_storeStrong((id *)&self->_muninBuckets, 0);
  objc_storeStrong((id *)&self->_muninBaseURL, 0);
  objc_storeStrong((id *)&self->_logMessageUsageV3URLLegacy, 0);
  objc_storeStrong((id *)&self->_logMessageUsageURLLegacy, 0);
  objc_storeStrong((id *)&self->_locationShiftEnabledRegions, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_iconChecksums, 0);
  objc_storeStrong((id *)&self->_fonts, 0);
  objc_storeStrong((id *)&self->_fontChecksums, 0);
  objc_storeStrong((id *)&self->_flyoverRegionVersions, 0);
  objc_storeStrong((id *)&self->_explicitResources, 0);
  objc_storeStrong((id *)&self->_etaURLLegacy, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_displayStrings, 0);
  objc_storeStrong((id *)&self->_dispatcherURLLegacy, 0);
  objc_storeStrong((id *)&self->_directionsURLLegacy, 0);
  objc_storeStrong((id *)&self->_dataSet, 0);
  objc_storeStrong((id *)&self->_businessPortalBaseURLLegacy, 0);
  objc_storeStrong((id *)&self->_bluePOIURLLegacy, 0);
  objc_storeStrong((id *)&self->_batchTrafficProbeURLLegacy, 0);
  objc_storeStrong((id *)&self->_batchReverseGeocoderURLLegacy, 0);
  objc_storeStrong((id *)&self->_backgroundRevGeoURLLegacy, 0);
  objc_storeStrong((id *)&self->_backgroundDispatcherURLLegacy, 0);
  objc_storeStrong((id *)&self->_attributions, 0);
  objc_storeStrong((id *)&self->_announcementsURLLegacy, 0);
  objc_storeStrong((id *)&self->_announcementsSupportedLanguages, 0);
  objc_storeStrong((id *)&self->_addressCorrectionUpdateURLLegacy, 0);
  objc_storeStrong((id *)&self->_addressCorrectionInitURLLegacy, 0);
  objc_storeStrong((id *)&self->_activeResources, 0);
  objc_storeStrong((id *)&self->_abExperimentURLLegacy, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOActiveTileGroup)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOActiveTileGroup;
  v2 = [(GEOActiveTileGroup *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (void)setIdentifier:(unsigned int)a3
{
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  self->_identifier = a3;
}

- (void)setTileSets:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000000000000;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  tileSets = self->_tileSets;
  self->_tileSets = v4;
}

- (void)clearTileSets
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000000000000;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  tileSets = self->_tileSets;

  [(NSMutableArray *)tileSets removeAllObjects];
}

- (void)addTileSet:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readTileSets]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsTileSet:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x8000000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (unint64_t)tileSetsCount
{
  -[GEOActiveTileGroup _readTileSets]((uint64_t)self);
  tileSets = self->_tileSets;

  return [(NSMutableArray *)tileSets count];
}

- (id)tileSetAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readTileSets]((uint64_t)self);
  tileSets = self->_tileSets;

  return (id)[(NSMutableArray *)tileSets objectAtIndex:a3];
}

+ (Class)tileSetType
{
  return (Class)objc_opt_class();
}

- (void)_readResources
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x20000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResources_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)resources
{
  -[GEOActiveTileGroup _readResources]((uint64_t)self);
  resources = self->_resources;

  return resources;
}

- (void)setResources:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  resources = self->_resources;
  self->_resources = v4;
}

- (void)clearResources
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  resources = self->_resources;

  [(NSMutableArray *)resources removeAllObjects];
}

- (void)addResource:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readResources]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsResource:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x20000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsResource:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 472);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 472);
      *(void *)(a1 + 472) = v5;

      id v4 = *(void **)(a1 + 472);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)resourcesCount
{
  -[GEOActiveTileGroup _readResources]((uint64_t)self);
  resources = self->_resources;

  return [(NSMutableArray *)resources count];
}

- (id)resourceAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readResources]((uint64_t)self);
  resources = self->_resources;

  return (id)[(NSMutableArray *)resources objectAtIndex:a3];
}

+ (Class)resourceType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
}

- (void)setUniqueIdentifier:(id)a3
{
  *((unsigned char *)&self->_flags + 8) |= 0x41u;
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (void)setAttributions:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  attributions = self->_attributions;
  self->_attributions = v4;
}

- (void)clearAttributions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  attributions = self->_attributions;

  [(NSMutableArray *)attributions removeAllObjects];
}

- (void)addAttribution:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readAttributions]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsAttribution:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x1000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

+ (Class)attributionType
{
  return (Class)objc_opt_class();
}

- (void)_readRegionalResourceTiles
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x400000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRegionalResourceTiles_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)regionalResourceTiles
{
  -[GEOActiveTileGroup _readRegionalResourceTiles]((uint64_t)self);
  regionalResourceTiles = self->_regionalResourceTiles;

  return regionalResourceTiles;
}

- (void)setRegionalResourceTiles:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  regionalResourceTiles = self->_regionalResourceTiles;
  self->_regionalResourceTiles = v4;
}

- (void)clearRegionalResourceTiles
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  regionalResourceTiles = self->_regionalResourceTiles;

  [(NSMutableArray *)regionalResourceTiles removeAllObjects];
}

- (void)addRegionalResourceTile:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readRegionalResourceTiles]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsRegionalResourceTile:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x400000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsRegionalResourceTile:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 416);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 416);
      *(void *)(a1 + 416) = v5;

      id v4 = *(void **)(a1 + 416);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)regionalResourceTilesCount
{
  -[GEOActiveTileGroup _readRegionalResourceTiles]((uint64_t)self);
  regionalResourceTiles = self->_regionalResourceTiles;

  return [(NSMutableArray *)regionalResourceTiles count];
}

- (id)regionalResourceTileAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readRegionalResourceTiles]((uint64_t)self);
  regionalResourceTiles = self->_regionalResourceTiles;

  return (id)[(NSMutableArray *)regionalResourceTiles objectAtIndex:a3];
}

+ (Class)regionalResourceTileType
{
  return (Class)objc_opt_class();
}

- (void)_readRegionalResourceRegions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x200000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRegionalResourceRegions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)regionalResourceRegions
{
  -[GEOActiveTileGroup _readRegionalResourceRegions]((uint64_t)self);
  regionalResourceRegions = self->_regionalResourceRegions;

  return regionalResourceRegions;
}

- (void)setRegionalResourceRegions:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  regionalResourceRegions = self->_regionalResourceRegions;
  self->_regionalResourceRegions = v4;
}

- (void)clearRegionalResourceRegions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  regionalResourceRegions = self->_regionalResourceRegions;

  [(NSMutableArray *)regionalResourceRegions removeAllObjects];
}

- (void)addRegionalResourceRegion:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readRegionalResourceRegions]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsRegionalResourceRegion:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x200000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsRegionalResourceRegion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 408);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 408);
      *(void *)(a1 + 408) = v5;

      id v4 = *(void **)(a1 + 408);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)regionalResourceRegionsCount
{
  -[GEOActiveTileGroup _readRegionalResourceRegions]((uint64_t)self);
  regionalResourceRegions = self->_regionalResourceRegions;

  return [(NSMutableArray *)regionalResourceRegions count];
}

- (id)regionalResourceRegionAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readRegionalResourceRegions]((uint64_t)self);
  regionalResourceRegions = self->_regionalResourceRegions;

  return (id)[(NSMutableArray *)regionalResourceRegions objectAtIndex:a3];
}

+ (Class)regionalResourceRegionType
{
  return (Class)objc_opt_class();
}

- (void)_readRegionalResourcesURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x800000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRegionalResourcesURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasRegionalResourcesURLLegacy
{
  return self->_regionalResourcesURLLegacy != 0;
}

- (NSString)regionalResourcesURLLegacy
{
  -[GEOActiveTileGroup _readRegionalResourcesURLLegacy]((uint64_t)self);
  regionalResourcesURLLegacy = self->_regionalResourcesURLLegacy;

  return regionalResourcesURLLegacy;
}

- (void)setRegionalResourcesURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x800000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_regionalResourcesURLLegacy, a3);
}

- (void)_readSearchAttributionManifestURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x80000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchAttributionManifestURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasSearchAttributionManifestURLLegacy
{
  return self->_searchAttributionManifestURLLegacy != 0;
}

- (NSString)searchAttributionManifestURLLegacy
{
  -[GEOActiveTileGroup _readSearchAttributionManifestURLLegacy]((uint64_t)self);
  searchAttributionManifestURLLegacy = self->_searchAttributionManifestURLLegacy;

  return searchAttributionManifestURLLegacy;
}

- (void)setSearchAttributionManifestURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x80000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_searchAttributionManifestURLLegacy, a3);
}

- (void)_readDirectionsURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x100000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasDirectionsURLLegacy
{
  return self->_directionsURLLegacy != 0;
}

- (NSString)directionsURLLegacy
{
  -[GEOActiveTileGroup _readDirectionsURLLegacy]((uint64_t)self);
  directionsURLLegacy = self->_directionsURLLegacy;

  return directionsURLLegacy;
}

- (void)setDirectionsURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x100000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_directionsURLLegacy, a3);
}

- (void)_readEtaURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x1000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEtaURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasEtaURLLegacy
{
  return self->_etaURLLegacy != 0;
}

- (NSString)etaURLLegacy
{
  -[GEOActiveTileGroup _readEtaURLLegacy]((uint64_t)self);
  etaURLLegacy = self->_etaURLLegacy;

  return etaURLLegacy;
}

- (void)setEtaURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x1000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_etaURLLegacy, a3);
}

- (void)_readBatchReverseGeocoderURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x8000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBatchReverseGeocoderURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasBatchReverseGeocoderURLLegacy
{
  return self->_batchReverseGeocoderURLLegacy != 0;
}

- (NSString)batchReverseGeocoderURLLegacy
{
  -[GEOActiveTileGroup _readBatchReverseGeocoderURLLegacy]((uint64_t)self);
  batchReverseGeocoderURLLegacy = self->_batchReverseGeocoderURLLegacy;

  return batchReverseGeocoderURLLegacy;
}

- (void)setBatchReverseGeocoderURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x8000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_batchReverseGeocoderURLLegacy, a3);
}

- (void)_readReleaseInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x2000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readReleaseInfo_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasReleaseInfo
{
  return self->_releaseInfo != 0;
}

- (NSString)releaseInfo
{
  -[GEOActiveTileGroup _readReleaseInfo]((uint64_t)self);
  releaseInfo = self->_releaseInfo;

  return releaseInfo;
}

- (void)setReleaseInfo:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x2000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_releaseInfo, a3);
}

- (void)_readResourcesURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x10000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResourcesURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasResourcesURLLegacy
{
  return self->_resourcesURLLegacy != 0;
}

- (NSString)resourcesURLLegacy
{
  -[GEOActiveTileGroup _readResourcesURLLegacy]((uint64_t)self);
  resourcesURLLegacy = self->_resourcesURLLegacy;

  return resourcesURLLegacy;
}

- (void)setResourcesURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x10000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_resourcesURLLegacy, a3);
}

- (void)_readSimpleETAURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x100000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSimpleETAURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasSimpleETAURLLegacy
{
  return self->_simpleETAURLLegacy != 0;
}

- (NSString)simpleETAURLLegacy
{
  -[GEOActiveTileGroup _readSimpleETAURLLegacy]((uint64_t)self);
  simpleETAURLLegacy = self->_simpleETAURLLegacy;

  return simpleETAURLLegacy;
}

- (void)setSimpleETAURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x100000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_simpleETAURLLegacy, a3);
}

- (void)_readAddressCorrectionInitURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressCorrectionInitURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasAddressCorrectionInitURLLegacy
{
  return self->_addressCorrectionInitURLLegacy != 0;
}

- (NSString)addressCorrectionInitURLLegacy
{
  -[GEOActiveTileGroup _readAddressCorrectionInitURLLegacy]((uint64_t)self);
  addressCorrectionInitURLLegacy = self->_addressCorrectionInitURLLegacy;

  return addressCorrectionInitURLLegacy;
}

- (void)setAddressCorrectionInitURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x100uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_addressCorrectionInitURLLegacy, a3);
}

- (void)_readAddressCorrectionUpdateURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressCorrectionUpdateURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasAddressCorrectionUpdateURLLegacy
{
  return self->_addressCorrectionUpdateURLLegacy != 0;
}

- (NSString)addressCorrectionUpdateURLLegacy
{
  -[GEOActiveTileGroup _readAddressCorrectionUpdateURLLegacy]((uint64_t)self);
  addressCorrectionUpdateURLLegacy = self->_addressCorrectionUpdateURLLegacy;

  return addressCorrectionUpdateURLLegacy;
}

- (void)setAddressCorrectionUpdateURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x200uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_addressCorrectionUpdateURLLegacy, a3);
}

- (void)_readPolyLocationShiftURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x2000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPolyLocationShiftURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasPolyLocationShiftURLLegacy
{
  return self->_polyLocationShiftURLLegacy != 0;
}

- (NSString)polyLocationShiftURLLegacy
{
  -[GEOActiveTileGroup _readPolyLocationShiftURLLegacy]((uint64_t)self);
  polyLocationShiftURLLegacy = self->_polyLocationShiftURLLegacy;

  return polyLocationShiftURLLegacy;
}

- (void)setPolyLocationShiftURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x2000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_polyLocationShiftURLLegacy, a3);
}

- (void)_readProblemSubmissionURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x40000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblemSubmissionURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasProblemSubmissionURLLegacy
{
  return self->_problemSubmissionURLLegacy != 0;
}

- (NSString)problemSubmissionURLLegacy
{
  -[GEOActiveTileGroup _readProblemSubmissionURLLegacy]((uint64_t)self);
  problemSubmissionURLLegacy = self->_problemSubmissionURLLegacy;

  return problemSubmissionURLLegacy;
}

- (void)setProblemSubmissionURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x40000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_problemSubmissionURLLegacy, a3);
}

- (void)_readProblemStatusURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x20000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblemStatusURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasProblemStatusURLLegacy
{
  return self->_problemStatusURLLegacy != 0;
}

- (NSString)problemStatusURLLegacy
{
  -[GEOActiveTileGroup _readProblemStatusURLLegacy]((uint64_t)self);
  problemStatusURLLegacy = self->_problemStatusURLLegacy;

  return problemStatusURLLegacy;
}

- (void)setProblemStatusURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x20000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_problemStatusURLLegacy, a3);
}

- (void)_readReverseGeocoderVersionsURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x40000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readReverseGeocoderVersionsURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasReverseGeocoderVersionsURLLegacy
{
  return self->_reverseGeocoderVersionsURLLegacy != 0;
}

- (NSString)reverseGeocoderVersionsURLLegacy
{
  -[GEOActiveTileGroup _readReverseGeocoderVersionsURLLegacy]((uint64_t)self);
  reverseGeocoderVersionsURLLegacy = self->_reverseGeocoderVersionsURLLegacy;

  return reverseGeocoderVersionsURLLegacy;
}

- (void)setReverseGeocoderVersionsURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x40000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_reverseGeocoderVersionsURLLegacy, a3);
}

- (void)_readProblemCategoriesURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x8000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblemCategoriesURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasProblemCategoriesURLLegacy
{
  return self->_problemCategoriesURLLegacy != 0;
}

- (NSString)problemCategoriesURLLegacy
{
  -[GEOActiveTileGroup _readProblemCategoriesURLLegacy]((uint64_t)self);
  problemCategoriesURLLegacy = self->_problemCategoriesURLLegacy;

  return problemCategoriesURLLegacy;
}

- (void)setProblemCategoriesURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x8000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_problemCategoriesURLLegacy, a3);
}

- (void)_readAnnouncementsURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnnouncementsURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasAnnouncementsURLLegacy
{
  return self->_announcementsURLLegacy != 0;
}

- (NSString)announcementsURLLegacy
{
  -[GEOActiveTileGroup _readAnnouncementsURLLegacy]((uint64_t)self);
  announcementsURLLegacy = self->_announcementsURLLegacy;

  return announcementsURLLegacy;
}

- (void)setAnnouncementsURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x800uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_announcementsURLLegacy, a3);
}

- (void)_readAnnouncementsSupportedLanguages
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnnouncementsSupportedLanguages_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)announcementsSupportedLanguages
{
  -[GEOActiveTileGroup _readAnnouncementsSupportedLanguages]((uint64_t)self);
  announcementsSupportedLanguages = self->_announcementsSupportedLanguages;

  return announcementsSupportedLanguages;
}

- (void)setAnnouncementsSupportedLanguages:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  announcementsSupportedLanguages = self->_announcementsSupportedLanguages;
  self->_announcementsSupportedLanguages = v4;
}

- (void)clearAnnouncementsSupportedLanguages
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  announcementsSupportedLanguages = self->_announcementsSupportedLanguages;

  [(NSMutableArray *)announcementsSupportedLanguages removeAllObjects];
}

- (void)addAnnouncementsSupportedLanguages:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readAnnouncementsSupportedLanguages]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsAnnouncementsSupportedLanguages:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x400);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (unint64_t)announcementsSupportedLanguagesCount
{
  -[GEOActiveTileGroup _readAnnouncementsSupportedLanguages]((uint64_t)self);
  announcementsSupportedLanguages = self->_announcementsSupportedLanguages;

  return [(NSMutableArray *)announcementsSupportedLanguages count];
}

- (id)announcementsSupportedLanguagesAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readAnnouncementsSupportedLanguages]((uint64_t)self);
  announcementsSupportedLanguages = self->_announcementsSupportedLanguages;

  return (id)[(NSMutableArray *)announcementsSupportedLanguages objectAtIndex:a3];
}

+ (Class)announcementsSupportedLanguagesType
{
  return (Class)objc_opt_class();
}

- (void)_readDispatcherURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x200000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDispatcherURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasDispatcherURLLegacy
{
  return self->_dispatcherURLLegacy != 0;
}

- (NSString)dispatcherURLLegacy
{
  -[GEOActiveTileGroup _readDispatcherURLLegacy]((uint64_t)self);
  dispatcherURLLegacy = self->_dispatcherURLLegacy;

  return dispatcherURLLegacy;
}

- (void)setDispatcherURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x200000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_dispatcherURLLegacy, a3);
}

- (void)_readProblemOptInURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x10000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblemOptInURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasProblemOptInURLLegacy
{
  return self->_problemOptInURLLegacy != 0;
}

- (NSString)problemOptInURLLegacy
{
  -[GEOActiveTileGroup _readProblemOptInURLLegacy]((uint64_t)self);
  problemOptInURLLegacy = self->_problemOptInURLLegacy;

  return problemOptInURLLegacy;
}

- (void)setProblemOptInURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x10000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_problemOptInURLLegacy, a3);
}

- (BOOL)hasVersionManifest
{
  return self->_versionManifest != 0;
}

- (void)setVersionManifest:(id)a3
{
  *((unsigned char *)&self->_flags + 8) |= 0x44u;
  objc_storeStrong((id *)&self->_versionManifest, a3);
}

- (void)_readStyleSheets
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x1000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleSheets_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)styleSheets
{
  -[GEOActiveTileGroup _readStyleSheets]((uint64_t)self);
  styleSheets = self->_styleSheets;

  return styleSheets;
}

- (void)setStyleSheets:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  styleSheets = self->_styleSheets;
  self->_styleSheets = v4;
}

- (void)clearStyleSheets
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  styleSheets = self->_styleSheets;

  [(NSMutableArray *)styleSheets removeAllObjects];
}

- (void)addStyleSheet:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readStyleSheets]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsStyleSheet:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x1000000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsStyleSheet:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 528);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 528);
      *(void *)(a1 + 528) = v5;

      id v4 = *(void **)(a1 + 528);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)styleSheetsCount
{
  -[GEOActiveTileGroup _readStyleSheets]((uint64_t)self);
  styleSheets = self->_styleSheets;

  return [(NSMutableArray *)styleSheets count];
}

- (id)styleSheetAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readStyleSheets]((uint64_t)self);
  styleSheets = self->_styleSheets;

  return (id)[(NSMutableArray *)styleSheets objectAtIndex:a3];
}

+ (Class)styleSheetType
{
  return (Class)objc_opt_class();
}

- (void)_readStyleSheetChecksums
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x800000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleSheetChecksums_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)styleSheetChecksums
{
  -[GEOActiveTileGroup _readStyleSheetChecksums]((uint64_t)self);
  styleSheetChecksums = self->_styleSheetChecksums;

  return styleSheetChecksums;
}

- (void)setStyleSheetChecksums:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  styleSheetChecksums = self->_styleSheetChecksums;
  self->_styleSheetChecksums = v4;
}

- (void)clearStyleSheetChecksums
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  styleSheetChecksums = self->_styleSheetChecksums;

  [(NSMutableArray *)styleSheetChecksums removeAllObjects];
}

- (void)addStyleSheetChecksum:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readStyleSheetChecksums]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsStyleSheetChecksum:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x800000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsStyleSheetChecksum:(uint64_t)a1
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

- (unint64_t)styleSheetChecksumsCount
{
  -[GEOActiveTileGroup _readStyleSheetChecksums]((uint64_t)self);
  styleSheetChecksums = self->_styleSheetChecksums;

  return [(NSMutableArray *)styleSheetChecksums count];
}

- (id)styleSheetChecksumAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readStyleSheetChecksums]((uint64_t)self);
  styleSheetChecksums = self->_styleSheetChecksums;

  return (id)[(NSMutableArray *)styleSheetChecksums objectAtIndex:a3];
}

+ (Class)styleSheetChecksumType
{
  return (Class)objc_opt_class();
}

- (void)_readTextures
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x4000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTextures_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)textures
{
  -[GEOActiveTileGroup _readTextures]((uint64_t)self);
  textures = self->_textures;

  return textures;
}

- (void)setTextures:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  textures = self->_textures;
  self->_textures = v4;
}

- (void)clearTextures
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  textures = self->_textures;

  [(NSMutableArray *)textures removeAllObjects];
}

- (void)addTexture:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readTextures]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsTexture:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x4000000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsTexture:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 544);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 544);
      *(void *)(a1 + 544) = v5;

      id v4 = *(void **)(a1 + 544);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)texturesCount
{
  -[GEOActiveTileGroup _readTextures]((uint64_t)self);
  textures = self->_textures;

  return [(NSMutableArray *)textures count];
}

- (id)textureAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readTextures]((uint64_t)self);
  textures = self->_textures;

  return (id)[(NSMutableArray *)textures objectAtIndex:a3];
}

+ (Class)textureType
{
  return (Class)objc_opt_class();
}

- (void)_readTextureChecksums
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x2000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTextureChecksums_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)textureChecksums
{
  -[GEOActiveTileGroup _readTextureChecksums]((uint64_t)self);
  textureChecksums = self->_textureChecksums;

  return textureChecksums;
}

- (void)setTextureChecksums:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  textureChecksums = self->_textureChecksums;
  self->_textureChecksums = v4;
}

- (void)clearTextureChecksums
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  textureChecksums = self->_textureChecksums;

  [(NSMutableArray *)textureChecksums removeAllObjects];
}

- (void)addTextureChecksum:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readTextureChecksums]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsTextureChecksum:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x2000000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsTextureChecksum:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 536);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 536);
      *(void *)(a1 + 536) = v5;

      id v4 = *(void **)(a1 + 536);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)textureChecksumsCount
{
  -[GEOActiveTileGroup _readTextureChecksums]((uint64_t)self);
  textureChecksums = self->_textureChecksums;

  return [(NSMutableArray *)textureChecksums count];
}

- (id)textureChecksumAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readTextureChecksums]((uint64_t)self);
  textureChecksums = self->_textureChecksums;

  return (id)[(NSMutableArray *)textureChecksums objectAtIndex:a3];
}

+ (Class)textureChecksumType
{
  return (Class)objc_opt_class();
}

- (void)_readFonts
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x10000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFonts_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)fonts
{
  -[GEOActiveTileGroup _readFonts]((uint64_t)self);
  fonts = self->_fonts;

  return fonts;
}

- (void)setFonts:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  fonts = self->_fonts;
  self->_fonts = v4;
}

- (void)clearFonts
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  fonts = self->_fonts;

  [(NSMutableArray *)fonts removeAllObjects];
}

- (void)addFont:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readFonts]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsFont:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x10000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsFont:(uint64_t)a1
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

- (unint64_t)fontsCount
{
  -[GEOActiveTileGroup _readFonts]((uint64_t)self);
  fonts = self->_fonts;

  return [(NSMutableArray *)fonts count];
}

- (id)fontAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readFonts]((uint64_t)self);
  fonts = self->_fonts;

  return (id)[(NSMutableArray *)fonts objectAtIndex:a3];
}

+ (Class)fontType
{
  return (Class)objc_opt_class();
}

- (void)_readFontChecksums
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x8000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFontChecksums_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)fontChecksums
{
  -[GEOActiveTileGroup _readFontChecksums]((uint64_t)self);
  fontChecksums = self->_fontChecksums;

  return fontChecksums;
}

- (void)setFontChecksums:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  fontChecksums = self->_fontChecksums;
  self->_fontChecksums = v4;
}

- (void)clearFontChecksums
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  fontChecksums = self->_fontChecksums;

  [(NSMutableArray *)fontChecksums removeAllObjects];
}

- (void)addFontChecksum:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readFontChecksums]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsFontChecksum:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x8000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsFontChecksum:(uint64_t)a1
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

- (unint64_t)fontChecksumsCount
{
  -[GEOActiveTileGroup _readFontChecksums]((uint64_t)self);
  fontChecksums = self->_fontChecksums;

  return [(NSMutableArray *)fontChecksums count];
}

- (id)fontChecksumAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readFontChecksums]((uint64_t)self);
  fontChecksums = self->_fontChecksums;

  return (id)[(NSMutableArray *)fontChecksums objectAtIndex:a3];
}

+ (Class)fontChecksumType
{
  return (Class)objc_opt_class();
}

- (void)_readIcons
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x40000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIcons_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)icons
{
  -[GEOActiveTileGroup _readIcons]((uint64_t)self);
  icons = self->_icons;

  return icons;
}

- (void)setIcons:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  icons = self->_icons;
  self->_icons = v4;
}

- (void)clearIcons
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  icons = self->_icons;

  [(NSMutableArray *)icons removeAllObjects];
}

- (void)addIcon:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readIcons]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsIcon:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x40000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsIcon:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 288);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 288);
      *(void *)(a1 + 288) = v5;

      id v4 = *(void **)(a1 + 288);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)iconsCount
{
  -[GEOActiveTileGroup _readIcons]((uint64_t)self);
  icons = self->_icons;

  return [(NSMutableArray *)icons count];
}

- (id)iconAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readIcons]((uint64_t)self);
  icons = self->_icons;

  return (id)[(NSMutableArray *)icons objectAtIndex:a3];
}

+ (Class)iconType
{
  return (Class)objc_opt_class();
}

- (void)_readIconChecksums
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x20000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIconChecksums_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)iconChecksums
{
  -[GEOActiveTileGroup _readIconChecksums]((uint64_t)self);
  iconChecksums = self->_iconChecksums;

  return iconChecksums;
}

- (void)setIconChecksums:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  iconChecksums = self->_iconChecksums;
  self->_iconChecksums = v4;
}

- (void)clearIconChecksums
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  iconChecksums = self->_iconChecksums;

  [(NSMutableArray *)iconChecksums removeAllObjects];
}

- (void)addIconChecksum:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readIconChecksums]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsIconChecksum:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x20000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsIconChecksum:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 280);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 280);
      *(void *)(a1 + 280) = v5;

      id v4 = *(void **)(a1 + 280);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)iconChecksumsCount
{
  -[GEOActiveTileGroup _readIconChecksums]((uint64_t)self);
  iconChecksums = self->_iconChecksums;

  return [(NSMutableArray *)iconChecksums count];
}

- (id)iconChecksumAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readIconChecksums]((uint64_t)self);
  iconChecksums = self->_iconChecksums;

  return (id)[(NSMutableArray *)iconChecksums objectAtIndex:a3];
}

+ (Class)iconChecksumType
{
  return (Class)objc_opt_class();
}

- (void)_readXmls
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 640) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readXmls_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)xmls
{
  -[GEOActiveTileGroup _readXmls]((uint64_t)self);
  xmls = self->_xmls;

  return xmls;
}

- (void)setXmls:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((unsigned char *)&self->_flags + 8) |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  xmls = self->_xmls;
  self->_xmls = v4;
}

- (void)clearXmls
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((unsigned char *)&self->_flags + 8) |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  xmls = self->_xmls;

  [(NSMutableArray *)xmls removeAllObjects];
}

- (void)addXml:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readXmls]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsXml:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  LOBYTE(self->_reader) |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsXml:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 600);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 600);
      *(void *)(a1 + 600) = v5;

      id v4 = *(void **)(a1 + 600);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)xmlsCount
{
  -[GEOActiveTileGroup _readXmls]((uint64_t)self);
  xmls = self->_xmls;

  return [(NSMutableArray *)xmls count];
}

- (id)xmlAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readXmls]((uint64_t)self);
  xmls = self->_xmls;

  return (id)[(NSMutableArray *)xmls objectAtIndex:a3];
}

+ (Class)xmlType
{
  return (Class)objc_opt_class();
}

- (void)_readXmlChecksums
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 640) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readXmlChecksums_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)xmlChecksums
{
  -[GEOActiveTileGroup _readXmlChecksums]((uint64_t)self);
  xmlChecksums = self->_xmlChecksums;

  return xmlChecksums;
}

- (void)setXmlChecksums:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((unsigned char *)&self->_flags + 8) |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  xmlChecksums = self->_xmlChecksums;
  self->_xmlChecksums = v4;
}

- (void)clearXmlChecksums
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((unsigned char *)&self->_flags + 8) |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  xmlChecksums = self->_xmlChecksums;

  [(NSMutableArray *)xmlChecksums removeAllObjects];
}

- (void)addXmlChecksum:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readXmlChecksums]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsXmlChecksum:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  LOBYTE(self->_reader) |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsXmlChecksum:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 592);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 592);
      *(void *)(a1 + 592) = v5;

      id v4 = *(void **)(a1 + 592);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)xmlChecksumsCount
{
  -[GEOActiveTileGroup _readXmlChecksums]((uint64_t)self);
  xmlChecksums = self->_xmlChecksums;

  return [(NSMutableArray *)xmlChecksums count];
}

- (id)xmlChecksumAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readXmlChecksums]((uint64_t)self);
  xmlChecksums = self->_xmlChecksums;

  return (id)[(NSMutableArray *)xmlChecksums objectAtIndex:a3];
}

+ (Class)xmlChecksumType
{
  return (Class)objc_opt_class();
}

- (void)_readAbExperimentURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAbExperimentURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasAbExperimentURLLegacy
{
  return self->_abExperimentURLLegacy != 0;
}

- (NSString)abExperimentURLLegacy
{
  -[GEOActiveTileGroup _readAbExperimentURLLegacy]((uint64_t)self);
  abExperimentURLLegacy = self->_abExperimentURLLegacy;

  return abExperimentURLLegacy;
}

- (void)setAbExperimentURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x40uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_abExperimentURLLegacy, a3);
}

- (void)_readBusinessPortalBaseURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x40000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBusinessPortalBaseURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasBusinessPortalBaseURLLegacy
{
  return self->_businessPortalBaseURLLegacy != 0;
}

- (NSString)businessPortalBaseURLLegacy
{
  -[GEOActiveTileGroup _readBusinessPortalBaseURLLegacy]((uint64_t)self);
  businessPortalBaseURLLegacy = self->_businessPortalBaseURLLegacy;

  return businessPortalBaseURLLegacy;
}

- (void)setBusinessPortalBaseURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x40000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_businessPortalBaseURLLegacy, a3);
}

- (void)_readLogMessageUsageURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x100000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLogMessageUsageURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasLogMessageUsageURLLegacy
{
  return self->_logMessageUsageURLLegacy != 0;
}

- (NSString)logMessageUsageURLLegacy
{
  -[GEOActiveTileGroup _readLogMessageUsageURLLegacy]((uint64_t)self);
  logMessageUsageURLLegacy = self->_logMessageUsageURLLegacy;

  return logMessageUsageURLLegacy;
}

- (void)setLogMessageUsageURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x100000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_logMessageUsageURLLegacy, a3);
}

- (void)_readLocationShiftEnabledRegions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x80000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocationShiftEnabledRegions_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)locationShiftEnabledRegions
{
  -[GEOActiveTileGroup _readLocationShiftEnabledRegions]((uint64_t)self);
  locationShiftEnabledRegions = self->_locationShiftEnabledRegions;

  return locationShiftEnabledRegions;
}

- (void)setLocationShiftEnabledRegions:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  locationShiftEnabledRegions = self->_locationShiftEnabledRegions;
  self->_locationShiftEnabledRegions = v4;
}

- (void)clearLocationShiftEnabledRegions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  locationShiftEnabledRegions = self->_locationShiftEnabledRegions;

  [(NSMutableArray *)locationShiftEnabledRegions removeAllObjects];
}

- (void)addLocationShiftEnabledRegion:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readLocationShiftEnabledRegions]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsLocationShiftEnabledRegion:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x80000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsLocationShiftEnabledRegion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 296);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 296);
      *(void *)(a1 + 296) = v5;

      id v4 = *(void **)(a1 + 296);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)locationShiftEnabledRegionsCount
{
  -[GEOActiveTileGroup _readLocationShiftEnabledRegions]((uint64_t)self);
  locationShiftEnabledRegions = self->_locationShiftEnabledRegions;

  return [(NSMutableArray *)locationShiftEnabledRegions count];
}

- (id)locationShiftEnabledRegionAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readLocationShiftEnabledRegions]((uint64_t)self);
  locationShiftEnabledRegions = self->_locationShiftEnabledRegions;

  return (id)[(NSMutableArray *)locationShiftEnabledRegions objectAtIndex:a3];
}

+ (Class)locationShiftEnabledRegionType
{
  return (Class)objc_opt_class();
}

- (unsigned)locationShiftVersion
{
  return self->_locationShiftVersion;
}

- (void)setLocationShiftVersion:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 1uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_locationShiftVersion = a3;
}

- (void)setHasLocationShiftVersion:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3;
  *((unsigned char *)&self->_flags + 8) = v3;
}

- (BOOL)hasLocationShiftVersion
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readHybridUnavailableRegions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHybridUnavailableRegions_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (unint64_t)hybridUnavailableRegionsCount
{
  return self->_hybridUnavailableRegionsCount;
}

- (GEOTileSetRegion)hybridUnavailableRegions
{
  return self->_hybridUnavailableRegions;
}

- (uint64_t)_reserveHybridUnavailableRegions:(uint64_t)a1
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    unint64_t v4 = *(void *)(a1 + 80);
    unint64_t v5 = v4 + a2;
    if (v4 + a2 <= v4) {
      return 0;
    }
    unint64_t v6 = *(void *)(a1 + 88);
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
    if (24 * v9 < v9) {
      return 0;
    }
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 72), 24 * v9, 0x62D9EB57uLL);
    if (result)
    {
      *(void *)(a1 + 88) = v9;
      *(void *)(a1 + 72) = result;
      bzero((void *)(result + 24 * *(void *)(a1 + 80)), 24 * (v9 - *(void *)(a1 + 80)));
      return 1;
    }
  }
  return result;
}

- (void)addHybridUnavailableRegion:(GEOTileSetRegion *)a3
{
  -[GEOActiveTileGroup _readHybridUnavailableRegions]((uint64_t)self);
  GEOTileSetRegion v7 = *a3;
  if (self && -[GEOActiveTileGroup _reserveHybridUnavailableRegions:]((uint64_t)self, 1uLL)) {
    self->_hybridUnavailableRegions[self->_hybridUnavailableRegionsCount++] = v7;
  }
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *(void *)p_flags |= 0x20uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)p_flags + 8) |= 0x40u;
}

- (GEOTileSetRegion)hybridUnavailableRegionAtIndex:(SEL)a3
{
  -[GEOActiveTileGroup _readHybridUnavailableRegions]((uint64_t)self);
  unint64_t hybridUnavailableRegionsCount = self->_hybridUnavailableRegionsCount;
  if (hybridUnavailableRegionsCount <= a4)
  {
    unint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C4A8];
    id v11 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a4, hybridUnavailableRegionsCount);
    unsigned int v12 = [v9 exceptionWithName:v10 reason:v11 userInfo:0];
    [v12 raise];
  }
  unsigned int v13 = &self->_hybridUnavailableRegions[a4];
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v13->var0;
  *(void *)&retstr->var4 = *(void *)&v13->var4;
  return result;
}

- (void)setHybridUnavailableRegions:(GEOTileSetRegion *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  [(GEOActiveTileGroup *)self clearHybridUnavailableRegions];
  if (-[GEOActiveTileGroup _reserveHybridUnavailableRegions:]((uint64_t)self, a4))
  {
    memcpy(self->_hybridUnavailableRegions, a3, 24 * a4);
    self->_unint64_t hybridUnavailableRegionsCount = a4;
  }
}

- (void)_readReserved
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x4000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readReserved_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasReserved
{
  return self->_reserved != 0;
}

- (NSData)reserved
{
  -[GEOActiveTileGroup _readReserved]((uint64_t)self);
  reserved = self->_reserved;

  return reserved;
}

- (void)setReserved:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x4000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_reserved, a3);
}

- (void)_readSpatialLookupURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x200000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpatialLookupURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasSpatialLookupURLLegacy
{
  return self->_spatialLookupURLLegacy != 0;
}

- (NSString)spatialLookupURLLegacy
{
  -[GEOActiveTileGroup _readSpatialLookupURLLegacy]((uint64_t)self);
  spatialLookupURLLegacy = self->_spatialLookupURLLegacy;

  return spatialLookupURLLegacy;
}

- (void)setSpatialLookupURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x200000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_spatialLookupURLLegacy, a3);
}

- (void)setActiveResources:(id)a3
{
  unint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  activeResources = self->_activeResources;
  self->_activeResources = v4;
}

- (void)clearActiveResources
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  activeResources = self->_activeResources;

  [(NSMutableArray *)activeResources removeAllObjects];
}

- (void)addActiveResource:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readActiveResources]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsActiveResource:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x80);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (unint64_t)activeResourcesCount
{
  -[GEOActiveTileGroup _readActiveResources]((uint64_t)self);
  activeResources = self->_activeResources;

  return [(NSMutableArray *)activeResources count];
}

- (id)activeResourceAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readActiveResources]((uint64_t)self);
  activeResources = self->_activeResources;

  return (id)[(NSMutableArray *)activeResources objectAtIndex:a3];
}

+ (Class)activeResourceType
{
  return (Class)objc_opt_class();
}

- (void)setRegionalResources:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  regionalResources = self->_regionalResources;
  self->_regionalResources = v4;
}

- (void)clearRegionalResources
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  regionalResources = self->_regionalResources;

  [(NSMutableArray *)regionalResources removeAllObjects];
}

- (void)addRegionalResource:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readRegionalResources]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsRegionalResource:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x1000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

+ (Class)regionalResourceType
{
  return (Class)objc_opt_class();
}

- (void)setModelVersion:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 2uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_modelVersion = a3;
}

- (void)setHasModelVersion:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 2;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x40;
}

- (BOOL)hasModelVersion
{
  return (*(void *)&self->_flags >> 1) & 1;
}

- (int)activeScales
{
  return self->_activeScales.list;
}

- (void)clearActiveScales
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 8uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;

  PBRepeatedInt32Clear();
}

- (void)addActiveScale:(int)a3
{
  -[GEOActiveTileGroup _readActiveScales]((uint64_t)self);
  if (self) {
    PBRepeatedInt32Add();
  }
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *(void *)p_flags |= 8uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)p_flags + 8) |= 0x40u;
}

- (void)setActiveScales:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 8uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;

  MEMORY[0x1F4147390](&self->_activeScales, a3, a4);
}

- (id)activeScalesAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53DFDC8[a3];
  }

  return v3;
}

- (int)StringAsActiveScales:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RESOURCE_FILTER_SCALE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RESOURCE_FILTER_SCALE_1X"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RESOURCE_FILTER_SCALE_2X"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RESOURCE_FILTER_SCALE_3X"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)activeScenarios
{
  return self->_activeScenarios.list;
}

- (void)clearActiveScenarios
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;

  PBRepeatedInt32Clear();
}

- (void)addActiveScenario:(int)a3
{
  -[GEOActiveTileGroup _readActiveScenarios]((uint64_t)self);
  if (self) {
    PBRepeatedInt32Add();
  }
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *(void *)p_flags |= 0x10uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)p_flags + 8) |= 0x40u;
}

- (void)setActiveScenarios:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;

  MEMORY[0x1F4147390](&self->_activeScenarios, a3, a4);
}

- (id)activeScenariosAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53DFDE8[a3];
  }

  return v3;
}

- (int)StringAsActiveScenarios:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RESOURCE_FILTER_SCENARIO_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RESOURCE_FILTER_SCENARIO_CARPLAY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RESOURCE_FILTER_SCENARIO_NAVIGATION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RESOURCE_FILTER_SCENARIO_HIGHVISIBILITY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RESOURCE_FILTER_SCENARIO_EXPLICIT"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (NSMutableArray)staleResources
{
  -[GEOActiveTileGroup _readStaleResources]((uint64_t)self);
  staleResources = self->_staleResources;

  return staleResources;
}

- (void)setStaleResources:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  staleResources = self->_staleResources;
  self->_staleResources = v4;
}

- (void)clearStaleResources
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  staleResources = self->_staleResources;

  [(NSMutableArray *)staleResources removeAllObjects];
}

- (void)addStaleResource:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readStaleResources]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsStaleResource:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x400000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsStaleResource:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 512);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 512);
      *(void *)(a1 + 512) = v5;

      id v4 = *(void **)(a1 + 512);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)staleResourceAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readStaleResources]((uint64_t)self);
  staleResources = self->_staleResources;

  return (id)[(NSMutableArray *)staleResources objectAtIndex:a3];
}

+ (Class)staleResourceType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDataSet
{
  return self->_dataSet != 0;
}

- (void)setDataSet:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x80000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_dataSet, a3);
}

- (void)_readRealtimeTrafficProbeURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x80000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRealtimeTrafficProbeURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasRealtimeTrafficProbeURLLegacy
{
  return self->_realtimeTrafficProbeURLLegacy != 0;
}

- (NSString)realtimeTrafficProbeURLLegacy
{
  -[GEOActiveTileGroup _readRealtimeTrafficProbeURLLegacy]((uint64_t)self);
  realtimeTrafficProbeURLLegacy = self->_realtimeTrafficProbeURLLegacy;

  return realtimeTrafficProbeURLLegacy;
}

- (void)setRealtimeTrafficProbeURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x80000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_realtimeTrafficProbeURLLegacy, a3);
}

- (void)_readBatchTrafficProbeURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x10000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBatchTrafficProbeURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasBatchTrafficProbeURLLegacy
{
  return self->_batchTrafficProbeURLLegacy != 0;
}

- (NSString)batchTrafficProbeURLLegacy
{
  -[GEOActiveTileGroup _readBatchTrafficProbeURLLegacy]((uint64_t)self);
  batchTrafficProbeURLLegacy = self->_batchTrafficProbeURLLegacy;

  return batchTrafficProbeURLLegacy;
}

- (void)setBatchTrafficProbeURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x10000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_batchTrafficProbeURLLegacy, a3);
}

- (void)_readLogMessageUsageV3URLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x200000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLogMessageUsageV3URLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasLogMessageUsageV3URLLegacy
{
  return self->_logMessageUsageV3URLLegacy != 0;
}

- (NSString)logMessageUsageV3URLLegacy
{
  -[GEOActiveTileGroup _readLogMessageUsageV3URLLegacy]((uint64_t)self);
  logMessageUsageV3URLLegacy = self->_logMessageUsageV3URLLegacy;

  return logMessageUsageV3URLLegacy;
}

- (void)setLogMessageUsageV3URLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x200000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_logMessageUsageV3URLLegacy, a3);
}

- (void)_readProactiveRoutingURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x4000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProactiveRoutingURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasProactiveRoutingURLLegacy
{
  return self->_proactiveRoutingURLLegacy != 0;
}

- (NSString)proactiveRoutingURLLegacy
{
  -[GEOActiveTileGroup _readProactiveRoutingURLLegacy]((uint64_t)self);
  proactiveRoutingURLLegacy = self->_proactiveRoutingURLLegacy;

  return proactiveRoutingURLLegacy;
}

- (void)setProactiveRoutingURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x4000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_proactiveRoutingURLLegacy, a3);
}

- (void)_readBackgroundDispatcherURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x2000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBackgroundDispatcherURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasBackgroundDispatcherURLLegacy
{
  return self->_backgroundDispatcherURLLegacy != 0;
}

- (NSString)backgroundDispatcherURLLegacy
{
  -[GEOActiveTileGroup _readBackgroundDispatcherURLLegacy]((uint64_t)self);
  backgroundDispatcherURLLegacy = self->_backgroundDispatcherURLLegacy;

  return backgroundDispatcherURLLegacy;
}

- (void)setBackgroundDispatcherURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x2000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_backgroundDispatcherURLLegacy, a3);
}

- (void)_readBluePOIURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x20000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBluePOIURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasBluePOIURLLegacy
{
  return self->_bluePOIURLLegacy != 0;
}

- (NSString)bluePOIURLLegacy
{
  -[GEOActiveTileGroup _readBluePOIURLLegacy]((uint64_t)self);
  bluePOIURLLegacy = self->_bluePOIURLLegacy;

  return bluePOIURLLegacy;
}

- (void)setBluePOIURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x20000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_bluePOIURLLegacy, a3);
}

- (void)_readBackgroundRevGeoURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x4000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBackgroundRevGeoURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasBackgroundRevGeoURLLegacy
{
  return self->_backgroundRevGeoURLLegacy != 0;
}

- (NSString)backgroundRevGeoURLLegacy
{
  -[GEOActiveTileGroup _readBackgroundRevGeoURLLegacy]((uint64_t)self);
  backgroundRevGeoURLLegacy = self->_backgroundRevGeoURLLegacy;

  return backgroundRevGeoURLLegacy;
}

- (void)setBackgroundRevGeoURLLegacy:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x4000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_backgroundRevGeoURLLegacy, a3);
}

- (void)_readWifiConnectionQualityProbeURLLegacy
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(unsigned char *)(a1 + 640) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWifiConnectionQualityProbeURLLegacy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasWifiConnectionQualityProbeURLLegacy
{
  return self->_wifiConnectionQualityProbeURLLegacy != 0;
}

- (NSString)wifiConnectionQualityProbeURLLegacy
{
  -[GEOActiveTileGroup _readWifiConnectionQualityProbeURLLegacy]((uint64_t)self);
  wifiConnectionQualityProbeURLLegacy = self->_wifiConnectionQualityProbeURLLegacy;

  return wifiConnectionQualityProbeURLLegacy;
}

- (void)setWifiConnectionQualityProbeURLLegacy:(id)a3
{
  *((unsigned char *)&self->_flags + 8) |= 0x48u;
  objc_storeStrong((id *)&self->_wifiConnectionQualityProbeURLLegacy, a3);
}

- (void)_readMuninBaseURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x400000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMuninBaseURL_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasMuninBaseURL
{
  return self->_muninBaseURL != 0;
}

- (NSString)muninBaseURL
{
  -[GEOActiveTileGroup _readMuninBaseURL]((uint64_t)self);
  muninBaseURL = self->_muninBaseURL;

  return muninBaseURL;
}

- (void)setMuninBaseURL:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x400000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_muninBaseURL, a3);
}

- (void)_readFlyoverRegionVersions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x4000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFlyoverRegionVersions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasFlyoverRegionVersions
{
  return self->_flyoverRegionVersions != 0;
}

- (NSData)flyoverRegionVersions
{
  -[GEOActiveTileGroup _readFlyoverRegionVersions]((uint64_t)self);
  flyoverRegionVersions = self->_flyoverRegionVersions;

  return flyoverRegionVersions;
}

- (void)setFlyoverRegionVersions:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x4000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_flyoverRegionVersions, a3);
}

- (BOOL)hasUrlInfoSet
{
  return self->_urlInfoSet != 0;
}

- (void)setUrlInfoSet:(id)a3
{
  *((unsigned char *)&self->_flags + 8) |= 0x42u;
  objc_storeStrong((id *)&self->_urlInfoSet, a3);
}

- (NSMutableArray)muninBuckets
{
  -[GEOActiveTileGroup _readMuninBuckets]((uint64_t)self);
  muninBuckets = self->_muninBuckets;

  return muninBuckets;
}

- (void)setMuninBuckets:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  muninBuckets = self->_muninBuckets;
  self->_muninBuckets = v4;
}

- (void)clearMuninBuckets
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  muninBuckets = self->_muninBuckets;

  [(NSMutableArray *)muninBuckets removeAllObjects];
}

- (void)addMuninBucket:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readMuninBuckets]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsMuninBucket:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x800000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (id)muninBucketAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readMuninBuckets]((uint64_t)self);
  muninBuckets = self->_muninBuckets;

  return (id)[(NSMutableArray *)muninBuckets objectAtIndex:a3];
}

+ (Class)muninBucketType
{
  return (Class)objc_opt_class();
}

- (void)_readEnvironment
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x800000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEnvironment_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasEnvironment
{
  return self->_environment != 0;
}

- (NSString)environment
{
  -[GEOActiveTileGroup _readEnvironment]((uint64_t)self);
  environment = self->_environment;

  return environment;
}

- (void)setEnvironment:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x800000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_environment, a3);
}

- (void)_readDisplayStrings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x400000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayStrings_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)displayStrings
{
  -[GEOActiveTileGroup _readDisplayStrings]((uint64_t)self);
  displayStrings = self->_displayStrings;

  return displayStrings;
}

- (void)setDisplayStrings:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  displayStrings = self->_displayStrings;
  self->_displayStrings = v4;
}

- (void)clearDisplayStrings
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  displayStrings = self->_displayStrings;

  [(NSMutableArray *)displayStrings removeAllObjects];
}

- (void)addDisplayStrings:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readDisplayStrings]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsDisplayStrings:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x400000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (unint64_t)displayStringsCount
{
  -[GEOActiveTileGroup _readDisplayStrings]((uint64_t)self);
  displayStrings = self->_displayStrings;

  return [(NSMutableArray *)displayStrings count];
}

- (id)displayStringsAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readDisplayStrings]((uint64_t)self);
  displayStrings = self->_displayStrings;

  return (id)[(NSMutableArray *)displayStrings objectAtIndex:a3];
}

+ (Class)displayStringsType
{
  return (Class)objc_opt_class();
}

- (void)setExplicitResources:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  explicitResources = self->_explicitResources;
  self->_explicitResources = v4;
}

- (void)clearExplicitResources
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  explicitResources = self->_explicitResources;

  [(NSMutableArray *)explicitResources removeAllObjects];
}

- (void)addExplicitResource:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readExplicitResources]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsExplicitResource:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x2000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (unint64_t)explicitResourcesCount
{
  -[GEOActiveTileGroup _readExplicitResources]((uint64_t)self);
  explicitResources = self->_explicitResources;

  return [(NSMutableArray *)explicitResources count];
}

- (id)explicitResourceAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readExplicitResources]((uint64_t)self);
  explicitResources = self->_explicitResources;

  return (id)[(NSMutableArray *)explicitResources objectAtIndex:a3];
}

+ (Class)explicitResourceType
{
  return (Class)objc_opt_class();
}

- (void)_readOfflineMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(void *)(a1 + 632) & 0x1000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOfflineMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasOfflineMetadata
{
  return self->_offlineMetadata != 0;
}

- (GEOOfflineMetadata)offlineMetadata
{
  -[GEOActiveTileGroup _readOfflineMetadata]((uint64_t)self);
  offlineMetadata = self->_offlineMetadata;

  return offlineMetadata;
}

- (void)setOfflineMetadata:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 0x1000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_offlineMetadata, a3);
}

- (void)setResourceCanonicalNameToFileName:(id)a3
{
  id v4 = (NSMutableDictionary *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  resourceCanonicalNameToFileName = self->_resourceCanonicalNameToFileName;
  self->_resourceCanonicalNameToFileName = v4;
}

- (void)clearResourceCanonicalNameToFileName
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  resourceCanonicalNameToFileName = self->_resourceCanonicalNameToFileName;

  [(NSMutableDictionary *)resourceCanonicalNameToFileName removeAllObjects];
}

- (void)setResourceCanonicalNameToFileNameValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[GEOActiveTileGroup _readResourceCanonicalNameToFileName]((uint64_t)self);
  -[GEOActiveTileGroup _setNoFlagsResourceCanonicalNameToFileNameValue:forKey:]((uint64_t)self, v7, v6);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x8000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (id)resourceCanonicalNameToFileNameForKey:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readResourceCanonicalNameToFileName]((uint64_t)self);
  id v5 = [(NSMutableDictionary *)self->_resourceCanonicalNameToFileName objectForKey:v4];

  return v5;
}

- (void)enumerateResourceCanonicalNameToFileNameUsingBlock:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readResourceCanonicalNameToFileName]((uint64_t)self);
  [(NSMutableDictionary *)self->_resourceCanonicalNameToFileName enumerateKeysAndObjectsUsingBlock:v4];
}

- (unint64_t)resourceCanonicalNameToFileNameCount
{
  -[GEOActiveTileGroup _readResourceCanonicalNameToFileName]((uint64_t)self);
  resourceCanonicalNameToFileName = self->_resourceCanonicalNameToFileName;

  return [(NSMutableDictionary *)resourceCanonicalNameToFileName count];
}

+ (Class)resourceCanonicalNameToFileNameType
{
  return (Class)objc_opt_class();
}

- (void)setRegionalResourceCanonicalNameToFileName:(id)a3
{
  id v4 = (NSMutableDictionary *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  regionalResourceCanonicalNameToFileName = self->_regionalResourceCanonicalNameToFileName;
  self->_regionalResourceCanonicalNameToFileName = v4;
}

- (void)clearRegionalResourceCanonicalNameToFileName
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x40u;
  regionalResourceCanonicalNameToFileName = self->_regionalResourceCanonicalNameToFileName;

  [(NSMutableDictionary *)regionalResourceCanonicalNameToFileName removeAllObjects];
}

- (void)setRegionalResourceCanonicalNameToFileNameValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[GEOActiveTileGroup _readRegionalResourceCanonicalNameToFileName]((uint64_t)self);
  -[GEOActiveTileGroup _setNoFlagsRegionalResourceCanonicalNameToFileNameValue:forKey:]((uint64_t)self, v7, v6);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x100000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (id)regionalResourceCanonicalNameToFileNameForKey:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readRegionalResourceCanonicalNameToFileName]((uint64_t)self);
  id v5 = [(NSMutableDictionary *)self->_regionalResourceCanonicalNameToFileName objectForKey:v4];

  return v5;
}

- (void)enumerateRegionalResourceCanonicalNameToFileNameUsingBlock:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileGroup _readRegionalResourceCanonicalNameToFileName]((uint64_t)self);
  [(NSMutableDictionary *)self->_regionalResourceCanonicalNameToFileName enumerateKeysAndObjectsUsingBlock:v4];
}

- (unint64_t)regionalResourceCanonicalNameToFileNameCount
{
  -[GEOActiveTileGroup _readRegionalResourceCanonicalNameToFileName]((uint64_t)self);
  regionalResourceCanonicalNameToFileName = self->_regionalResourceCanonicalNameToFileName;

  return [(NSMutableDictionary *)regionalResourceCanonicalNameToFileName count];
}

+ (Class)regionalResourceCanonicalNameToFileNameType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOActiveTileGroup;
  id v4 = [(GEOActiveTileGroup *)&v8 description];
  id v5 = [(GEOActiveTileGroup *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOActiveTileGroup _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v277 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 620)];
    [v4 setObject:v5 forKey:@"identifier"];

    if ([*(id *)(a1 + 552) count])
    {
      id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 552), "count"));
      long long v262 = 0u;
      long long v263 = 0u;
      long long v264 = 0u;
      long long v265 = 0u;
      id v7 = *(id *)(a1 + 552);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v262 objects:v276 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v263;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v263 != v10) {
              objc_enumerationMutation(v7);
            }
            unsigned int v12 = *(void **)(*((void *)&v262 + 1) + 8 * i);
            if (a2) {
              [v12 jsonRepresentation];
            }
            else {
            id v13 = [v12 dictionaryRepresentation];
            }

            [v6 addObject:v13];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v262 objects:v276 count:16];
        }
        while (v9);
      }

      [v4 setObject:v6 forKey:@"tileSet"];
    }
    if (*(void *)(a1 + 472))
    {
      uint64_t v14 = [(id)a1 resources];
      [v4 setObject:v14 forKey:@"resource"];
    }
    uint64_t v15 = [(id)a1 uniqueIdentifier];
    if (v15) {
      [v4 setObject:v15 forKey:@"uniqueIdentifier"];
    }

    if ([*(id *)(a1 + 144) count])
    {
      id v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 144), "count"));
      long long v258 = 0u;
      long long v259 = 0u;
      long long v260 = 0u;
      long long v261 = 0u;
      id v17 = *(id *)(a1 + 144);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v258 objects:v275 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v259;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v259 != v20) {
              objc_enumerationMutation(v17);
            }
            long long v22 = *(void **)(*((void *)&v258 + 1) + 8 * j);
            if (a2) {
              [v22 jsonRepresentation];
            }
            else {
            id v23 = [v22 dictionaryRepresentation];
            }

            [v16 addObject:v23];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v258 objects:v275 count:16];
        }
        while (v19);
      }

      [v4 setObject:v16 forKey:@"attribution"];
    }
    if ([*(id *)(a1 + 416) count])
    {
      long long v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 416), "count"));
      long long v254 = 0u;
      long long v255 = 0u;
      long long v256 = 0u;
      long long v257 = 0u;
      id v25 = *(id *)(a1 + 416);
      uint64_t v26 = [v25 countByEnumeratingWithState:&v254 objects:v274 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v255;
        do
        {
          for (uint64_t k = 0; k != v27; ++k)
          {
            if (*(void *)v255 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void **)(*((void *)&v254 + 1) + 8 * k);
            if (a2) {
              [v30 jsonRepresentation];
            }
            else {
            id v31 = [v30 dictionaryRepresentation];
            }

            [v24 addObject:v31];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v254 objects:v274 count:16];
        }
        while (v27);
      }

      [v4 setObject:v24 forKey:@"regionalResourceTile"];
    }
    if ([*(id *)(a1 + 408) count])
    {
      v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 408), "count"));
      long long v250 = 0u;
      long long v251 = 0u;
      long long v252 = 0u;
      long long v253 = 0u;
      id v33 = *(id *)(a1 + 408);
      uint64_t v34 = [v33 countByEnumeratingWithState:&v250 objects:v273 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v251;
        do
        {
          for (uint64_t m = 0; m != v35; ++m)
          {
            if (*(void *)v251 != v36) {
              objc_enumerationMutation(v33);
            }
            v38 = *(void **)(*((void *)&v250 + 1) + 8 * m);
            if (a2) {
              [v38 jsonRepresentation];
            }
            else {
            id v39 = [v38 dictionaryRepresentation];
            }

            [v32 addObject:v39];
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v250 objects:v273 count:16];
        }
        while (v35);
      }

      [v4 setObject:v32 forKey:@"regionalResourceRegion"];
    }
    v40 = [(id)a1 regionalResourcesURLLegacy];
    if (v40)
    {
      if (a2) {
        v41 = @"regionalResourcesURLLegacy";
      }
      else {
        v41 = @"regionalResourcesURL_legacy";
      }
      [v4 setObject:v40 forKey:v41];
    }

    v42 = [(id)a1 searchAttributionManifestURLLegacy];
    if (v42)
    {
      if (a2) {
        v43 = @"searchAttributionManifestURLLegacy";
      }
      else {
        v43 = @"searchAttributionManifestURL_legacy";
      }
      [v4 setObject:v42 forKey:v43];
    }

    v44 = [(id)a1 directionsURLLegacy];
    if (v44)
    {
      if (a2) {
        v45 = @"directionsURLLegacy";
      }
      else {
        v45 = @"directionsURL_legacy";
      }
      [v4 setObject:v44 forKey:v45];
    }

    v46 = [(id)a1 etaURLLegacy];
    if (v46)
    {
      if (a2) {
        v47 = @"etaURLLegacy";
      }
      else {
        v47 = @"etaURL_legacy";
      }
      [v4 setObject:v46 forKey:v47];
    }

    v48 = [(id)a1 batchReverseGeocoderURLLegacy];
    if (v48)
    {
      if (a2) {
        v49 = @"batchReverseGeocoderURLLegacy";
      }
      else {
        v49 = @"batchReverseGeocoderURL_legacy";
      }
      [v4 setObject:v48 forKey:v49];
    }

    v50 = [(id)a1 releaseInfo];
    if (v50) {
      [v4 setObject:v50 forKey:@"releaseInfo"];
    }

    v51 = [(id)a1 resourcesURLLegacy];
    if (v51)
    {
      if (a2) {
        v52 = @"resourcesURLLegacy";
      }
      else {
        v52 = @"resourcesURL_legacy";
      }
      [v4 setObject:v51 forKey:v52];
    }

    v53 = [(id)a1 simpleETAURLLegacy];
    if (v53)
    {
      if (a2) {
        v54 = @"simpleETAURLLegacy";
      }
      else {
        v54 = @"simpleETAURL_legacy";
      }
      [v4 setObject:v53 forKey:v54];
    }

    v55 = [(id)a1 addressCorrectionInitURLLegacy];
    if (v55)
    {
      if (a2) {
        v56 = @"addressCorrectionInitURLLegacy";
      }
      else {
        v56 = @"addressCorrectionInitURL_legacy";
      }
      [v4 setObject:v55 forKey:v56];
    }

    v57 = [(id)a1 addressCorrectionUpdateURLLegacy];
    if (v57)
    {
      if (a2) {
        v58 = @"addressCorrectionUpdateURLLegacy";
      }
      else {
        v58 = @"addressCorrectionUpdateURL_legacy";
      }
      [v4 setObject:v57 forKey:v58];
    }

    v59 = [(id)a1 polyLocationShiftURLLegacy];
    if (v59)
    {
      if (a2) {
        v60 = @"polyLocationShiftURLLegacy";
      }
      else {
        v60 = @"polyLocationShiftURL_legacy";
      }
      [v4 setObject:v59 forKey:v60];
    }

    v61 = [(id)a1 problemSubmissionURLLegacy];
    if (v61)
    {
      if (a2) {
        v62 = @"problemSubmissionURLLegacy";
      }
      else {
        v62 = @"problemSubmissionURL_legacy";
      }
      [v4 setObject:v61 forKey:v62];
    }

    v63 = [(id)a1 problemStatusURLLegacy];
    if (v63)
    {
      if (a2) {
        v64 = @"problemStatusURLLegacy";
      }
      else {
        v64 = @"problemStatusURL_legacy";
      }
      [v4 setObject:v63 forKey:v64];
    }

    v65 = [(id)a1 reverseGeocoderVersionsURLLegacy];
    if (v65)
    {
      if (a2) {
        v66 = @"reverseGeocoderVersionsURLLegacy";
      }
      else {
        v66 = @"reverseGeocoderVersionsURL_legacy";
      }
      [v4 setObject:v65 forKey:v66];
    }

    v67 = [(id)a1 problemCategoriesURLLegacy];
    if (v67)
    {
      if (a2) {
        v68 = @"problemCategoriesURLLegacy";
      }
      else {
        v68 = @"problemCategoriesURL_legacy";
      }
      [v4 setObject:v67 forKey:v68];
    }

    v69 = [(id)a1 announcementsURLLegacy];
    if (v69)
    {
      if (a2) {
        v70 = @"announcementsURLLegacy";
      }
      else {
        v70 = @"announcementsURL_legacy";
      }
      [v4 setObject:v69 forKey:v70];
    }

    if (*(void *)(a1 + 128))
    {
      v71 = [(id)a1 announcementsSupportedLanguages];
      [v4 setObject:v71 forKey:@"announcementsSupportedLanguages"];
    }
    v72 = [(id)a1 dispatcherURLLegacy];
    if (v72)
    {
      if (a2) {
        v73 = @"dispatcherURLLegacy";
      }
      else {
        v73 = @"dispatcherURL_legacy";
      }
      [v4 setObject:v72 forKey:v73];
    }

    v74 = [(id)a1 problemOptInURLLegacy];
    if (v74)
    {
      if (a2) {
        v75 = @"problemOptInURLLegacy";
      }
      else {
        v75 = @"problemOptInURL_legacy";
      }
      [v4 setObject:v74 forKey:v75];
    }

    v76 = [(id)a1 versionManifest];
    v77 = v76;
    if (v76)
    {
      if (a2) {
        [v76 jsonRepresentation];
      }
      else {
      id v78 = [v76 dictionaryRepresentation];
      }

      [v4 setObject:v78 forKey:@"versionManifest"];
    }

    if (*(void *)(a1 + 528))
    {
      v79 = [(id)a1 styleSheets];
      [v4 setObject:v79 forKey:@"styleSheet"];
    }
    if (*(void *)(a1 + 520))
    {
      v80 = [(id)a1 styleSheetChecksums];
      [v4 setObject:v80 forKey:@"styleSheetChecksum"];
    }
    if (*(void *)(a1 + 544))
    {
      v81 = [(id)a1 textures];
      [v4 setObject:v81 forKey:@"texture"];
    }
    if (*(void *)(a1 + 536))
    {
      v82 = [(id)a1 textureChecksums];
      [v4 setObject:v82 forKey:@"textureChecksum"];
    }
    if (*(void *)(a1 + 272))
    {
      v83 = [(id)a1 fonts];
      [v4 setObject:v83 forKey:@"font"];
    }
    if (*(void *)(a1 + 264))
    {
      v84 = [(id)a1 fontChecksums];
      [v4 setObject:v84 forKey:@"fontChecksum"];
    }
    if (*(void *)(a1 + 288))
    {
      v85 = [(id)a1 icons];
      [v4 setObject:v85 forKey:@"icon"];
    }
    if (*(void *)(a1 + 280))
    {
      v86 = [(id)a1 iconChecksums];
      [v4 setObject:v86 forKey:@"iconChecksum"];
    }
    if (*(void *)(a1 + 600))
    {
      v87 = [(id)a1 xmls];
      [v4 setObject:v87 forKey:@"xml"];
    }
    if (*(void *)(a1 + 592))
    {
      v88 = [(id)a1 xmlChecksums];
      [v4 setObject:v88 forKey:@"xmlChecksum"];
    }
    v89 = [(id)a1 abExperimentURLLegacy];
    if (v89)
    {
      if (a2) {
        v90 = @"abExperimentURLLegacy";
      }
      else {
        v90 = @"abExperimentURL_legacy";
      }
      [v4 setObject:v89 forKey:v90];
    }

    v91 = [(id)a1 businessPortalBaseURLLegacy];
    if (v91)
    {
      if (a2) {
        v92 = @"businessPortalBaseURLLegacy";
      }
      else {
        v92 = @"businessPortalBaseURL_legacy";
      }
      [v4 setObject:v91 forKey:v92];
    }

    v93 = [(id)a1 logMessageUsageURLLegacy];
    if (v93)
    {
      if (a2) {
        v94 = @"logMessageUsageURLLegacy";
      }
      else {
        v94 = @"logMessageUsageURL_legacy";
      }
      [v4 setObject:v93 forKey:v94];
    }

    if ([*(id *)(a1 + 296) count])
    {
      v95 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 296), "count"));
      long long v246 = 0u;
      long long v247 = 0u;
      long long v248 = 0u;
      long long v249 = 0u;
      id v96 = *(id *)(a1 + 296);
      uint64_t v97 = [v96 countByEnumeratingWithState:&v246 objects:v272 count:16];
      if (v97)
      {
        uint64_t v98 = v97;
        uint64_t v99 = *(void *)v247;
        do
        {
          for (uint64_t n = 0; n != v98; ++n)
          {
            if (*(void *)v247 != v99) {
              objc_enumerationMutation(v96);
            }
            v101 = *(void **)(*((void *)&v246 + 1) + 8 * n);
            if (a2) {
              [v101 jsonRepresentation];
            }
            else {
            id v102 = [v101 dictionaryRepresentation];
            }

            [v95 addObject:v102];
          }
          uint64_t v98 = [v96 countByEnumeratingWithState:&v246 objects:v272 count:16];
        }
        while (v98);
      }

      [v4 setObject:v95 forKey:@"locationShiftEnabledRegion"];
    }
    if (*(void *)(a1 + 632))
    {
      v103 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 624)];
      [v4 setObject:v103 forKey:@"locationShiftVersion"];
    }
    if (*(void *)(a1 + 80))
    {
      v104 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 80)];
      if (*(void *)(a1 + 80))
      {
        uint64_t v105 = 0;
        unint64_t v106 = 0;
        do
        {
          _GEOTileSetRegionDictionaryRepresentation((unsigned int *)(*(void *)(a1 + 72) + v105));
          id v107 = (id)objc_claimAutoreleasedReturnValue();

          [v104 addObject:v107];
          ++v106;
          v105 += 24;
        }
        while (v106 < *(void *)(a1 + 80));
      }
      [v4 setObject:v104 forKey:@"hybridUnavailableRegion"];
    }
    v108 = [(id)a1 reserved];
    v109 = v108;
    if (v108)
    {
      if (a2)
      {
        v110 = [v108 base64EncodedStringWithOptions:0];
        [v4 setObject:v110 forKey:@"reserved"];
      }
      else
      {
        [v4 setObject:v108 forKey:@"reserved"];
      }
    }

    v111 = [(id)a1 spatialLookupURLLegacy];
    if (v111)
    {
      if (a2) {
        v112 = @"spatialLookupURLLegacy";
      }
      else {
        v112 = @"spatialLookupURL_legacy";
      }
      [v4 setObject:v111 forKey:v112];
    }

    if ([*(id *)(a1 + 104) count])
    {
      v113 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 104), "count"));
      long long v242 = 0u;
      long long v243 = 0u;
      long long v244 = 0u;
      long long v245 = 0u;
      id v114 = *(id *)(a1 + 104);
      uint64_t v115 = [v114 countByEnumeratingWithState:&v242 objects:v271 count:16];
      if (v115)
      {
        uint64_t v116 = v115;
        uint64_t v117 = *(void *)v243;
        do
        {
          for (iuint64_t i = 0; ii != v116; ++ii)
          {
            if (*(void *)v243 != v117) {
              objc_enumerationMutation(v114);
            }
            v119 = *(void **)(*((void *)&v242 + 1) + 8 * ii);
            if (a2) {
              [v119 jsonRepresentation];
            }
            else {
            id v120 = [v119 dictionaryRepresentation];
            }

            [v113 addObject:v120];
          }
          uint64_t v116 = [v114 countByEnumeratingWithState:&v242 objects:v271 count:16];
        }
        while (v116);
      }

      [v4 setObject:v113 forKey:@"activeResource"];
    }
    if ([*(id *)(a1 + 432) count])
    {
      v121 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 432), "count"));
      long long v238 = 0u;
      long long v239 = 0u;
      long long v240 = 0u;
      long long v241 = 0u;
      id v122 = *(id *)(a1 + 432);
      uint64_t v123 = [v122 countByEnumeratingWithState:&v238 objects:v270 count:16];
      if (v123)
      {
        uint64_t v124 = v123;
        uint64_t v125 = *(void *)v239;
        do
        {
          for (juint64_t j = 0; jj != v124; ++jj)
          {
            if (*(void *)v239 != v125) {
              objc_enumerationMutation(v122);
            }
            v127 = *(void **)(*((void *)&v238 + 1) + 8 * jj);
            if (a2) {
              [v127 jsonRepresentation];
            }
            else {
            id v128 = [v127 dictionaryRepresentation];
            }

            [v121 addObject:v128];
          }
          uint64_t v124 = [v122 countByEnumeratingWithState:&v238 objects:v270 count:16];
        }
        while (v124);
      }

      [v4 setObject:v121 forKey:@"regionalResource"];
    }
    if ((*(void *)(a1 + 632) & 2) != 0)
    {
      v129 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 628)];
      [v4 setObject:v129 forKey:@"modelVersion"];
    }
    if (*(void *)(a1 + 32))
    {
      v130 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v131 = (void *)(a1 + 24);
      if (*(void *)(a1 + 32))
      {
        unint64_t v132 = 0;
        do
        {
          uint64_t v133 = *(int *)(*v131 + 4 * v132);
          if (v133 >= 4)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v133);
            v134 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v134 = off_1E53DFDC8[v133];
          }
          [v130 addObject:v134];

          ++v132;
          v131 = (void *)(a1 + 24);
        }
        while (v132 < *(void *)(a1 + 32));
      }
      [v4 setObject:v130 forKey:@"activeScale"];
    }
    if (*(void *)(a1 + 56))
    {
      v135 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v136 = (void *)(a1 + 48);
      if (*(void *)(a1 + 56))
      {
        unint64_t v137 = 0;
        do
        {
          uint64_t v138 = *(int *)(*v136 + 4 * v137);
          if (v138 >= 5)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v138);
            v139 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v139 = off_1E53DFDE8[v138];
          }
          [v135 addObject:v139];

          ++v137;
          v136 = (void *)(a1 + 48);
        }
        while (v137 < *(void *)(a1 + 56));
      }
      [v4 setObject:v135 forKey:@"activeScenario"];
    }
    if ([*(id *)(a1 + 512) count])
    {
      v140 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 512), "count"));
      long long v234 = 0u;
      long long v235 = 0u;
      long long v236 = 0u;
      long long v237 = 0u;
      id v141 = *(id *)(a1 + 512);
      uint64_t v142 = [v141 countByEnumeratingWithState:&v234 objects:v269 count:16];
      if (v142)
      {
        uint64_t v143 = v142;
        uint64_t v144 = *(void *)v235;
        do
        {
          for (kuint64_t k = 0; kk != v143; ++kk)
          {
            if (*(void *)v235 != v144) {
              objc_enumerationMutation(v141);
            }
            v146 = *(void **)(*((void *)&v234 + 1) + 8 * kk);
            if (a2) {
              [v146 jsonRepresentation];
            }
            else {
            id v147 = [v146 dictionaryRepresentation];
            }

            [v140 addObject:v147];
          }
          uint64_t v143 = [v141 countByEnumeratingWithState:&v234 objects:v269 count:16];
        }
        while (v143);
      }

      [v4 setObject:v140 forKey:@"staleResource"];
    }
    v148 = [(id)a1 dataSet];
    v149 = v148;
    if (v148)
    {
      if (a2) {
        [v148 jsonRepresentation];
      }
      else {
      id v150 = [v148 dictionaryRepresentation];
      }

      [v4 setObject:v150 forKey:@"dataSet"];
    }

    v151 = [(id)a1 realtimeTrafficProbeURLLegacy];
    if (v151)
    {
      if (a2) {
        v152 = @"realtimeTrafficProbeURLLegacy";
      }
      else {
        v152 = @"realtimeTrafficProbeURL_legacy";
      }
      [v4 setObject:v151 forKey:v152];
    }

    v153 = [(id)a1 batchTrafficProbeURLLegacy];
    if (v153)
    {
      if (a2) {
        v154 = @"batchTrafficProbeURLLegacy";
      }
      else {
        v154 = @"batchTrafficProbeURL_legacy";
      }
      [v4 setObject:v153 forKey:v154];
    }

    v155 = [(id)a1 logMessageUsageV3URLLegacy];
    if (v155)
    {
      if (a2) {
        v156 = @"logMessageUsageV3URLLegacy";
      }
      else {
        v156 = @"logMessageUsageV3URL_legacy";
      }
      [v4 setObject:v155 forKey:v156];
    }

    v157 = [(id)a1 proactiveRoutingURLLegacy];
    if (v157)
    {
      if (a2) {
        v158 = @"proactiveRoutingURLLegacy";
      }
      else {
        v158 = @"proactiveRoutingURL_legacy";
      }
      [v4 setObject:v157 forKey:v158];
    }

    v159 = [(id)a1 backgroundDispatcherURLLegacy];
    if (v159)
    {
      if (a2) {
        v160 = @"backgroundDispatcherURLLegacy";
      }
      else {
        v160 = @"backgroundDispatcherURL_legacy";
      }
      [v4 setObject:v159 forKey:v160];
    }

    v161 = [(id)a1 bluePOIURLLegacy];
    if (v161)
    {
      if (a2) {
        v162 = @"bluePOIURLLegacy";
      }
      else {
        v162 = @"bluePOIURL_legacy";
      }
      [v4 setObject:v161 forKey:v162];
    }

    v163 = [(id)a1 backgroundRevGeoURLLegacy];
    if (v163)
    {
      if (a2) {
        v164 = @"backgroundRevGeoURLLegacy";
      }
      else {
        v164 = @"backgroundRevGeoURL_legacy";
      }
      [v4 setObject:v163 forKey:v164];
    }

    v165 = [(id)a1 wifiConnectionQualityProbeURLLegacy];
    if (v165)
    {
      if (a2) {
        v166 = @"wifiConnectionQualityProbeURLLegacy";
      }
      else {
        v166 = @"wifiConnectionQualityProbeURL_legacy";
      }
      [v4 setObject:v165 forKey:v166];
    }

    v167 = [(id)a1 muninBaseURL];
    if (v167) {
      [v4 setObject:v167 forKey:@"muninBaseURL"];
    }

    v168 = [(id)a1 flyoverRegionVersions];
    v169 = v168;
    if (v168)
    {
      if (a2)
      {
        v170 = [v168 base64EncodedStringWithOptions:0];
        [v4 setObject:v170 forKey:@"flyoverRegionVersions"];
      }
      else
      {
        [v4 setObject:v168 forKey:@"flyoverRegionVersions"];
      }
    }

    v171 = [(id)a1 urlInfoSet];
    v172 = v171;
    if (v171)
    {
      if (a2) {
        [v171 jsonRepresentation];
      }
      else {
      id v173 = [v171 dictionaryRepresentation];
      }

      [v4 setObject:v173 forKey:@"urlInfoSet"];
    }

    if ([*(id *)(a1 + 328) count])
    {
      v174 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 328), "count"));
      long long v230 = 0u;
      long long v231 = 0u;
      long long v232 = 0u;
      long long v233 = 0u;
      id v175 = *(id *)(a1 + 328);
      uint64_t v176 = [v175 countByEnumeratingWithState:&v230 objects:v268 count:16];
      if (v176)
      {
        uint64_t v177 = v176;
        uint64_t v178 = *(void *)v231;
        do
        {
          for (muint64_t m = 0; mm != v177; ++mm)
          {
            if (*(void *)v231 != v178) {
              objc_enumerationMutation(v175);
            }
            v180 = *(void **)(*((void *)&v230 + 1) + 8 * mm);
            if (a2) {
              [v180 jsonRepresentation];
            }
            else {
            id v181 = [v180 dictionaryRepresentation];
            }

            [v174 addObject:v181];
          }
          uint64_t v177 = [v175 countByEnumeratingWithState:&v230 objects:v268 count:16];
        }
        while (v177);
      }

      [v4 setObject:v174 forKey:@"muninBucket"];
    }
    v182 = [(id)a1 environment];
    if (v182) {
      [v4 setObject:v182 forKey:@"environment"];
    }

    if ([*(id *)(a1 + 224) count])
    {
      v183 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 224), "count"));
      long long v226 = 0u;
      long long v227 = 0u;
      long long v228 = 0u;
      long long v229 = 0u;
      id v184 = *(id *)(a1 + 224);
      uint64_t v185 = [v184 countByEnumeratingWithState:&v226 objects:v267 count:16];
      if (v185)
      {
        uint64_t v186 = v185;
        uint64_t v187 = *(void *)v227;
        do
        {
          for (nuint64_t n = 0; nn != v186; ++nn)
          {
            if (*(void *)v227 != v187) {
              objc_enumerationMutation(v184);
            }
            v189 = *(void **)(*((void *)&v226 + 1) + 8 * nn);
            if (a2) {
              [v189 jsonRepresentation];
            }
            else {
            id v190 = [v189 dictionaryRepresentation];
            }

            [v183 addObject:v190];
          }
          uint64_t v186 = [v184 countByEnumeratingWithState:&v226 objects:v267 count:16];
        }
        while (v186);
      }

      [v4 setObject:v183 forKey:@"displayStrings"];
    }
    if ([*(id *)(a1 + 248) count])
    {
      v191 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 248), "count"));
      long long v222 = 0u;
      long long v223 = 0u;
      long long v224 = 0u;
      long long v225 = 0u;
      id v192 = *(id *)(a1 + 248);
      uint64_t v193 = [v192 countByEnumeratingWithState:&v222 objects:v266 count:16];
      if (v193)
      {
        uint64_t v194 = v193;
        uint64_t v195 = *(void *)v223;
        do
        {
          for (uint64_t i1 = 0; i1 != v194; ++i1)
          {
            if (*(void *)v223 != v195) {
              objc_enumerationMutation(v192);
            }
            v197 = *(void **)(*((void *)&v222 + 1) + 8 * i1);
            if (a2) {
              [v197 jsonRepresentation];
            }
            else {
            id v198 = [v197 dictionaryRepresentation];
            }

            [v191 addObject:v198];
          }
          uint64_t v194 = [v192 countByEnumeratingWithState:&v222 objects:v266 count:16];
        }
        while (v194);
      }

      [v4 setObject:v191 forKey:@"explicitResource"];
    }
    v199 = [(id)a1 offlineMetadata];
    v200 = v199;
    if (v199)
    {
      if (a2) {
        [v199 jsonRepresentation];
      }
      else {
      id v201 = [v199 dictionaryRepresentation];
      }

      [v4 setObject:v201 forKey:@"offlineMetadata"];
    }

    if ([*(id *)(a1 + 456) count])
    {
      v202 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 456), "count"));
      v203 = *(void **)(a1 + 456);
      v220[0] = MEMORY[0x1E4F143A8];
      v220[1] = 3221225472;
      v220[2] = __48__GEOActiveTileGroup__dictionaryRepresentation___block_invoke;
      v220[3] = &unk_1E53DFD80;
      id v204 = v202;
      id v221 = v204;
      [v203 enumerateKeysAndObjectsUsingBlock:v220];
      [v4 setObject:v204 forKey:@"resourceCanonicalNameToFileName"];
    }
    if ([*(id *)(a1 + 400) count])
    {
      v205 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 400), "count"));
      v206 = *(void **)(a1 + 400);
      v218[0] = MEMORY[0x1E4F143A8];
      v218[1] = 3221225472;
      v218[2] = __48__GEOActiveTileGroup__dictionaryRepresentation___block_invoke_2;
      v218[3] = &unk_1E53DFD80;
      id v207 = v205;
      id v219 = v207;
      [v206 enumerateKeysAndObjectsUsingBlock:v218];
      [v4 setObject:v207 forKey:@"regionalResourceCanonicalNameToFileName"];
    }
    v208 = *(void **)(a1 + 16);
    if (v208)
    {
      v209 = [v208 dictionaryRepresentation];
      v210 = v209;
      if (a2)
      {
        v211 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v209, "count"));
        v216[0] = MEMORY[0x1E4F143A8];
        v216[1] = 3221225472;
        v216[2] = __48__GEOActiveTileGroup__dictionaryRepresentation___block_invoke_3;
        v216[3] = &unk_1E53D8860;
        id v212 = v211;
        id v217 = v212;
        [v210 enumerateKeysAndObjectsUsingBlock:v216];
        id v213 = v212;

        v210 = v213;
      }
      [v4 setObject:v210 forKey:@"Unknown Fields"];
    }
    id v214 = v4;
  }
  else
  {
    id v214 = 0;
  }

  return v214;
}

- (id)jsonRepresentation
{
  return -[GEOActiveTileGroup _dictionaryRepresentation:]((uint64_t)self, 1);
}

uint64_t __48__GEOActiveTileGroup__dictionaryRepresentation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

uint64_t __48__GEOActiveTileGroup__dictionaryRepresentation___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

void __48__GEOActiveTileGroup__dictionaryRepresentation___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOActiveTileGroup)initWithDictionary:(id)a3
{
  return (GEOActiveTileGroup *)-[GEOActiveTileGroup _initWithDictionary:isJSON:]();
}

- (id)_initWithDictionary:isJSON:
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  int v378 = v1;
  v2 = (id *)v0;
  uint64_t v523 = *MEMORY[0x1E4F143B8];
  id v4 = v3;
  if (!v2) {
    goto LABEL_551;
  }
  id v5 = [v2 init];

  if (!v5)
  {
    v2 = 0;
    goto LABEL_551;
  }
  id v6 = [v4 objectForKeyedSubscript:@"identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIdentifier:", objc_msgSend(v6, "unsignedIntValue"));
  }

  id v7 = [v4 objectForKeyedSubscript:@"tileSet"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v494 = 0u;
    long long v493 = 0u;
    long long v492 = 0u;
    long long v491 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v491 objects:v522 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v492;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v492 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v491 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v14 = [GEOActiveTileSet alloc];
            if (v378) {
              uint64_t v15 = [(GEOActiveTileSet *)v14 initWithJSON:v13];
            }
            else {
              uint64_t v15 = [(GEOActiveTileSet *)v14 initWithDictionary:v13];
            }
            id v16 = (void *)v15;
            [v5 addTileSet:v15];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v491 objects:v522 count:16];
      }
      while (v10);
    }
  }
  id v17 = [v4 objectForKeyedSubscript:@"resource"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v490 = 0u;
    long long v489 = 0u;
    long long v488 = 0u;
    long long v487 = 0u;
    id v18 = v17;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v487 objects:v521 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v488;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v488 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = *(void **)(*((void *)&v487 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v24 = (void *)[v23 copy];
            [v5 addResource:v24];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v487 objects:v521 count:16];
      }
      while (v20);
    }
  }
  id v25 = [v4 objectForKeyedSubscript:@"uniqueIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v26 = (void *)[v25 copy];
    [v5 setUniqueIdentifier:v26];
  }
  uint64_t v27 = [v4 objectForKeyedSubscript:@"attribution"];
  objc_opt_class();
  id v377 = v4;
  if (objc_opt_isKindOfClass())
  {
    long long v486 = 0u;
    long long v485 = 0u;
    long long v484 = 0u;
    long long v483 = 0u;
    id v28 = v27;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v483 objects:v520 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v484;
      do
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v484 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void *)(*((void *)&v483 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v34 = [GEOAttribution alloc];
            if (v378) {
              uint64_t v35 = [(GEOAttribution *)v34 initWithJSON:v33];
            }
            else {
              uint64_t v35 = [(GEOAttribution *)v34 initWithDictionary:v33];
            }
            uint64_t v36 = (void *)v35;
            [v5 addAttribution:v35];
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v483 objects:v520 count:16];
      }
      while (v30);
    }

    id v4 = v377;
  }

  v37 = [v4 objectForKeyedSubscript:@"regionalResourceTile"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v482 = 0u;
    long long v481 = 0u;
    long long v480 = 0u;
    long long v479 = 0u;
    id v38 = v37;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v479 objects:v519 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v480;
      do
      {
        for (uint64_t m = 0; m != v40; ++m)
        {
          if (*(void *)v480 != v41) {
            objc_enumerationMutation(v38);
          }
          uint64_t v43 = *(void *)(*((void *)&v479 + 1) + 8 * m);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v44 = [GEORegionalResourceTile alloc];
            if (v378) {
              uint64_t v45 = [(GEORegionalResourceTile *)v44 initWithJSON:v43];
            }
            else {
              uint64_t v45 = [(GEORegionalResourceTile *)v44 initWithDictionary:v43];
            }
            v46 = (void *)v45;
            [v5 addRegionalResourceTile:v45];
          }
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v479 objects:v519 count:16];
      }
      while (v40);
    }

    id v4 = v377;
  }

  v47 = [v4 objectForKeyedSubscript:@"regionalResourceRegion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v478 = 0u;
    long long v477 = 0u;
    long long v476 = 0u;
    long long v475 = 0u;
    id v48 = v47;
    uint64_t v49 = [v48 countByEnumeratingWithState:&v475 objects:v518 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v476;
      do
      {
        for (uint64_t n = 0; n != v50; ++n)
        {
          if (*(void *)v476 != v51) {
            objc_enumerationMutation(v48);
          }
          uint64_t v53 = *(void *)(*((void *)&v475 + 1) + 8 * n);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v54 = [GEORegionalResourceRegion alloc];
            if (v378) {
              uint64_t v55 = [(GEORegionalResourceRegion *)v54 initWithJSON:v53];
            }
            else {
              uint64_t v55 = [(GEORegionalResourceRegion *)v54 initWithDictionary:v53];
            }
            v56 = (void *)v55;
            [v5 addRegionalResourceRegion:v55];
          }
        }
        uint64_t v50 = [v48 countByEnumeratingWithState:&v475 objects:v518 count:16];
      }
      while (v50);
    }

    id v4 = v377;
  }

  if (v378) {
    v57 = @"regionalResourcesURLLegacy";
  }
  else {
    v57 = @"regionalResourcesURL_legacy";
  }
  v58 = [v4 objectForKeyedSubscript:v57];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v59 = (void *)[v58 copy];
    [v5 setRegionalResourcesURLLegacy:v59];
  }
  if (v378) {
    v60 = @"searchAttributionManifestURLLegacy";
  }
  else {
    v60 = @"searchAttributionManifestURL_legacy";
  }
  v61 = [v4 objectForKeyedSubscript:v60];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v62 = (void *)[v61 copy];
    [v5 setSearchAttributionManifestURLLegacy:v62];
  }
  if (v378) {
    v63 = @"directionsURLLegacy";
  }
  else {
    v63 = @"directionsURL_legacy";
  }
  v64 = [v4 objectForKeyedSubscript:v63];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v65 = (void *)[v64 copy];
    [v5 setDirectionsURLLegacy:v65];
  }
  if (v378) {
    v66 = @"etaURLLegacy";
  }
  else {
    v66 = @"etaURL_legacy";
  }
  v67 = [v4 objectForKeyedSubscript:v66];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v68 = (void *)[v67 copy];
    [v5 setEtaURLLegacy:v68];
  }
  if (v378) {
    v69 = @"batchReverseGeocoderURLLegacy";
  }
  else {
    v69 = @"batchReverseGeocoderURL_legacy";
  }
  v70 = [v4 objectForKeyedSubscript:v69];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v71 = (void *)[v70 copy];
    [v5 setBatchReverseGeocoderURLLegacy:v71];
  }
  v72 = [v4 objectForKeyedSubscript:@"releaseInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v73 = (void *)[v72 copy];
    [v5 setReleaseInfo:v73];
  }
  if (v378) {
    v74 = @"resourcesURLLegacy";
  }
  else {
    v74 = @"resourcesURL_legacy";
  }
  v75 = [v4 objectForKeyedSubscript:v74];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v76 = (void *)[v75 copy];
    [v5 setResourcesURLLegacy:v76];
  }
  if (v378) {
    v77 = @"simpleETAURLLegacy";
  }
  else {
    v77 = @"simpleETAURL_legacy";
  }
  id v78 = [v4 objectForKeyedSubscript:v77];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v79 = (void *)[v78 copy];
    [v5 setSimpleETAURLLegacy:v79];
  }
  if (v378) {
    v80 = @"addressCorrectionInitURLLegacy";
  }
  else {
    v80 = @"addressCorrectionInitURL_legacy";
  }
  v81 = [v4 objectForKeyedSubscript:v80];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v82 = (void *)[v81 copy];
    [v5 setAddressCorrectionInitURLLegacy:v82];
  }
  if (v378) {
    v83 = @"addressCorrectionUpdateURLLegacy";
  }
  else {
    v83 = @"addressCorrectionUpdateURL_legacy";
  }
  v84 = [v4 objectForKeyedSubscript:v83];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v85 = (void *)[v84 copy];
    [v5 setAddressCorrectionUpdateURLLegacy:v85];
  }
  if (v378) {
    v86 = @"polyLocationShiftURLLegacy";
  }
  else {
    v86 = @"polyLocationShiftURL_legacy";
  }
  v87 = [v4 objectForKeyedSubscript:v86];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v88 = (void *)[v87 copy];
    [v5 setPolyLocationShiftURLLegacy:v88];
  }
  if (v378) {
    v89 = @"problemSubmissionURLLegacy";
  }
  else {
    v89 = @"problemSubmissionURL_legacy";
  }
  v90 = [v4 objectForKeyedSubscript:v89];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v91 = (void *)[v90 copy];
    [v5 setProblemSubmissionURLLegacy:v91];
  }
  if (v378) {
    v92 = @"problemStatusURLLegacy";
  }
  else {
    v92 = @"problemStatusURL_legacy";
  }
  v93 = [v4 objectForKeyedSubscript:v92];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v94 = (void *)[v93 copy];
    [v5 setProblemStatusURLLegacy:v94];
  }
  if (v378) {
    v95 = @"reverseGeocoderVersionsURLLegacy";
  }
  else {
    v95 = @"reverseGeocoderVersionsURL_legacy";
  }
  id v96 = [v4 objectForKeyedSubscript:v95];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v97 = (void *)[v96 copy];
    [v5 setReverseGeocoderVersionsURLLegacy:v97];
  }
  if (v378) {
    uint64_t v98 = @"problemCategoriesURLLegacy";
  }
  else {
    uint64_t v98 = @"problemCategoriesURL_legacy";
  }
  uint64_t v99 = [v4 objectForKeyedSubscript:v98];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v100 = (void *)[v99 copy];
    [v5 setProblemCategoriesURLLegacy:v100];
  }
  if (v378) {
    v101 = @"announcementsURLLegacy";
  }
  else {
    v101 = @"announcementsURL_legacy";
  }
  id v102 = [v4 objectForKeyedSubscript:v101];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v103 = (void *)[v102 copy];
    [v5 setAnnouncementsURLLegacy:v103];
  }
  v104 = [v4 objectForKeyedSubscript:@"announcementsSupportedLanguages"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v474 = 0u;
    long long v473 = 0u;
    long long v472 = 0u;
    long long v471 = 0u;
    id v105 = v104;
    uint64_t v106 = [v105 countByEnumeratingWithState:&v471 objects:v517 count:16];
    if (v106)
    {
      uint64_t v107 = v106;
      uint64_t v108 = *(void *)v472;
      do
      {
        for (iuint64_t i = 0; ii != v107; ++ii)
        {
          if (*(void *)v472 != v108) {
            objc_enumerationMutation(v105);
          }
          v110 = *(void **)(*((void *)&v471 + 1) + 8 * ii);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v111 = (void *)[v110 copy];
            [v5 addAnnouncementsSupportedLanguages:v111];
          }
        }
        uint64_t v107 = [v105 countByEnumeratingWithState:&v471 objects:v517 count:16];
      }
      while (v107);
    }
  }
  if (v378) {
    v112 = @"dispatcherURLLegacy";
  }
  else {
    v112 = @"dispatcherURL_legacy";
  }
  v113 = [v4 objectForKeyedSubscript:v112];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v114 = (void *)[v113 copy];
    [v5 setDispatcherURLLegacy:v114];
  }
  if (v378) {
    uint64_t v115 = @"problemOptInURLLegacy";
  }
  else {
    uint64_t v115 = @"problemOptInURL_legacy";
  }
  uint64_t v116 = [v4 objectForKeyedSubscript:v115];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v117 = (void *)[v116 copy];
    [v5 setProblemOptInURLLegacy:v117];
  }
  v118 = [v4 objectForKeyedSubscript:@"versionManifest"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v119 = [GEOVersionManifest alloc];
    if (v378) {
      uint64_t v120 = [(GEOVersionManifest *)v119 initWithJSON:v118];
    }
    else {
      uint64_t v120 = [(GEOVersionManifest *)v119 initWithDictionary:v118];
    }
    v121 = (void *)v120;
    [v5 setVersionManifest:v120];
  }
  id v122 = [v4 objectForKeyedSubscript:@"styleSheet"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v470 = 0u;
    long long v469 = 0u;
    long long v468 = 0u;
    long long v467 = 0u;
    id v123 = v122;
    uint64_t v124 = [v123 countByEnumeratingWithState:&v467 objects:v516 count:16];
    if (v124)
    {
      uint64_t v125 = v124;
      uint64_t v126 = *(void *)v468;
      do
      {
        for (juint64_t j = 0; jj != v125; ++jj)
        {
          if (*(void *)v468 != v126) {
            objc_enumerationMutation(v123);
          }
          id v128 = *(void **)(*((void *)&v467 + 1) + 8 * jj);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v129 = (void *)[v128 copy];
            [v5 addStyleSheet:v129];
          }
        }
        uint64_t v125 = [v123 countByEnumeratingWithState:&v467 objects:v516 count:16];
      }
      while (v125);
    }
  }
  v130 = [v4 objectForKeyedSubscript:@"styleSheetChecksum"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v466 = 0u;
    long long v465 = 0u;
    long long v464 = 0u;
    long long v463 = 0u;
    id v131 = v130;
    uint64_t v132 = [v131 countByEnumeratingWithState:&v463 objects:v515 count:16];
    if (v132)
    {
      uint64_t v133 = v132;
      uint64_t v134 = *(void *)v464;
      do
      {
        for (kuint64_t k = 0; kk != v133; ++kk)
        {
          if (*(void *)v464 != v134) {
            objc_enumerationMutation(v131);
          }
          v136 = *(void **)(*((void *)&v463 + 1) + 8 * kk);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unint64_t v137 = (void *)[v136 copy];
            [v5 addStyleSheetChecksum:v137];
          }
        }
        uint64_t v133 = [v131 countByEnumeratingWithState:&v463 objects:v515 count:16];
      }
      while (v133);
    }
  }
  uint64_t v138 = [v4 objectForKeyedSubscript:@"texture"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v462 = 0u;
    long long v461 = 0u;
    long long v460 = 0u;
    long long v459 = 0u;
    id v139 = v138;
    uint64_t v140 = [v139 countByEnumeratingWithState:&v459 objects:v514 count:16];
    if (v140)
    {
      uint64_t v141 = v140;
      uint64_t v142 = *(void *)v460;
      do
      {
        for (muint64_t m = 0; mm != v141; ++mm)
        {
          if (*(void *)v460 != v142) {
            objc_enumerationMutation(v139);
          }
          uint64_t v144 = *(void **)(*((void *)&v459 + 1) + 8 * mm);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v145 = (void *)[v144 copy];
            [v5 addTexture:v145];
          }
        }
        uint64_t v141 = [v139 countByEnumeratingWithState:&v459 objects:v514 count:16];
      }
      while (v141);
    }
  }
  v146 = [v4 objectForKeyedSubscript:@"textureChecksum"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v458 = 0u;
    long long v457 = 0u;
    long long v456 = 0u;
    long long v455 = 0u;
    id v147 = v146;
    uint64_t v148 = [v147 countByEnumeratingWithState:&v455 objects:v513 count:16];
    if (v148)
    {
      uint64_t v149 = v148;
      uint64_t v150 = *(void *)v456;
      do
      {
        for (nuint64_t n = 0; nn != v149; ++nn)
        {
          if (*(void *)v456 != v150) {
            objc_enumerationMutation(v147);
          }
          v152 = *(void **)(*((void *)&v455 + 1) + 8 * nn);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v153 = (void *)[v152 copy];
            [v5 addTextureChecksum:v153];
          }
        }
        uint64_t v149 = [v147 countByEnumeratingWithState:&v455 objects:v513 count:16];
      }
      while (v149);
    }
  }
  v154 = [v4 objectForKeyedSubscript:@"font"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v454 = 0u;
    long long v453 = 0u;
    long long v452 = 0u;
    long long v451 = 0u;
    id v155 = v154;
    uint64_t v156 = [v155 countByEnumeratingWithState:&v451 objects:v512 count:16];
    if (v156)
    {
      uint64_t v157 = v156;
      uint64_t v158 = *(void *)v452;
      do
      {
        for (uint64_t i1 = 0; i1 != v157; ++i1)
        {
          if (*(void *)v452 != v158) {
            objc_enumerationMutation(v155);
          }
          v160 = *(void **)(*((void *)&v451 + 1) + 8 * i1);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v161 = (void *)[v160 copy];
            [v5 addFont:v161];
          }
        }
        uint64_t v157 = [v155 countByEnumeratingWithState:&v451 objects:v512 count:16];
      }
      while (v157);
    }
  }
  v162 = [v4 objectForKeyedSubscript:@"fontChecksum"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v450 = 0u;
    long long v449 = 0u;
    long long v448 = 0u;
    long long v447 = 0u;
    id v163 = v162;
    uint64_t v164 = [v163 countByEnumeratingWithState:&v447 objects:v511 count:16];
    if (v164)
    {
      uint64_t v165 = v164;
      uint64_t v166 = *(void *)v448;
      do
      {
        for (uint64_t i2 = 0; i2 != v165; ++i2)
        {
          if (*(void *)v448 != v166) {
            objc_enumerationMutation(v163);
          }
          v168 = *(void **)(*((void *)&v447 + 1) + 8 * i2);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v169 = (void *)[v168 copy];
            [v5 addFontChecksum:v169];
          }
        }
        uint64_t v165 = [v163 countByEnumeratingWithState:&v447 objects:v511 count:16];
      }
      while (v165);
    }
  }
  v170 = [v4 objectForKeyedSubscript:@"icon"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v446 = 0u;
    long long v445 = 0u;
    long long v444 = 0u;
    long long v443 = 0u;
    id v171 = v170;
    uint64_t v172 = [v171 countByEnumeratingWithState:&v443 objects:v510 count:16];
    if (v172)
    {
      uint64_t v173 = v172;
      uint64_t v174 = *(void *)v444;
      do
      {
        for (uint64_t i3 = 0; i3 != v173; ++i3)
        {
          if (*(void *)v444 != v174) {
            objc_enumerationMutation(v171);
          }
          uint64_t v176 = *(void **)(*((void *)&v443 + 1) + 8 * i3);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v177 = (void *)[v176 copy];
            [v5 addIcon:v177];
          }
        }
        uint64_t v173 = [v171 countByEnumeratingWithState:&v443 objects:v510 count:16];
      }
      while (v173);
    }
  }
  uint64_t v178 = [v4 objectForKeyedSubscript:@"iconChecksum"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v441 = 0u;
    long long v442 = 0u;
    long long v439 = 0u;
    long long v440 = 0u;
    id v179 = v178;
    uint64_t v180 = [v179 countByEnumeratingWithState:&v439 objects:v509 count:16];
    if (v180)
    {
      uint64_t v181 = v180;
      uint64_t v182 = *(void *)v440;
      do
      {
        for (uint64_t i4 = 0; i4 != v181; ++i4)
        {
          if (*(void *)v440 != v182) {
            objc_enumerationMutation(v179);
          }
          id v184 = *(void **)(*((void *)&v439 + 1) + 8 * i4);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v185 = (void *)[v184 copy];
            [v5 addIconChecksum:v185];
          }
        }
        uint64_t v181 = [v179 countByEnumeratingWithState:&v439 objects:v509 count:16];
      }
      while (v181);
    }
  }
  uint64_t v186 = [v4 objectForKeyedSubscript:@"xml"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v437 = 0u;
    long long v438 = 0u;
    long long v435 = 0u;
    long long v436 = 0u;
    id v187 = v186;
    uint64_t v188 = [v187 countByEnumeratingWithState:&v435 objects:v508 count:16];
    if (v188)
    {
      uint64_t v189 = v188;
      uint64_t v190 = *(void *)v436;
      do
      {
        for (uint64_t i5 = 0; i5 != v189; ++i5)
        {
          if (*(void *)v436 != v190) {
            objc_enumerationMutation(v187);
          }
          id v192 = *(void **)(*((void *)&v435 + 1) + 8 * i5);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v193 = (void *)[v192 copy];
            [v5 addXml:v193];
          }
        }
        uint64_t v189 = [v187 countByEnumeratingWithState:&v435 objects:v508 count:16];
      }
      while (v189);
    }
  }
  uint64_t v194 = [v4 objectForKeyedSubscript:@"xmlChecksum"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v433 = 0u;
    long long v434 = 0u;
    long long v431 = 0u;
    long long v432 = 0u;
    id v195 = v194;
    uint64_t v196 = [v195 countByEnumeratingWithState:&v431 objects:v507 count:16];
    if (v196)
    {
      uint64_t v197 = v196;
      uint64_t v198 = *(void *)v432;
      do
      {
        for (uint64_t i6 = 0; i6 != v197; ++i6)
        {
          if (*(void *)v432 != v198) {
            objc_enumerationMutation(v195);
          }
          v200 = *(void **)(*((void *)&v431 + 1) + 8 * i6);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v201 = (void *)[v200 copy];
            [v5 addXmlChecksum:v201];
          }
        }
        uint64_t v197 = [v195 countByEnumeratingWithState:&v431 objects:v507 count:16];
      }
      while (v197);
    }
  }
  if (v378) {
    v202 = @"abExperimentURLLegacy";
  }
  else {
    v202 = @"abExperimentURL_legacy";
  }
  v203 = [v4 objectForKeyedSubscript:v202];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v204 = (void *)[v203 copy];
    [v5 setAbExperimentURLLegacy:v204];
  }
  if (v378) {
    v205 = @"businessPortalBaseURLLegacy";
  }
  else {
    v205 = @"businessPortalBaseURL_legacy";
  }
  v206 = [v4 objectForKeyedSubscript:v205];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v207 = (void *)[v206 copy];
    [v5 setBusinessPortalBaseURLLegacy:v207];
  }
  if (v378) {
    v208 = @"logMessageUsageURLLegacy";
  }
  else {
    v208 = @"logMessageUsageURL_legacy";
  }
  v209 = [v4 objectForKeyedSubscript:v208];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v210 = (void *)[v209 copy];
    [v5 setLogMessageUsageURLLegacy:v210];
  }
  v211 = [v4 objectForKeyedSubscript:@"locationShiftEnabledRegion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v429 = 0u;
    long long v430 = 0u;
    long long v427 = 0u;
    long long v428 = 0u;
    id v212 = v211;
    uint64_t v213 = [v212 countByEnumeratingWithState:&v427 objects:v506 count:16];
    if (v213)
    {
      uint64_t v214 = v213;
      uint64_t v215 = *(void *)v428;
      do
      {
        for (uint64_t i7 = 0; i7 != v214; ++i7)
        {
          if (*(void *)v428 != v215) {
            objc_enumerationMutation(v212);
          }
          uint64_t v217 = *(void *)(*((void *)&v427 + 1) + 8 * i7);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v218 = [GEOMapRegion alloc];
            if (v378) {
              uint64_t v219 = [(GEOMapRegion *)v218 initWithJSON:v217];
            }
            else {
              uint64_t v219 = [(GEOMapRegion *)v218 initWithDictionary:v217];
            }
            v220 = (void *)v219;
            [v5 addLocationShiftEnabledRegion:v219];
          }
        }
        uint64_t v214 = [v212 countByEnumeratingWithState:&v427 objects:v506 count:16];
      }
      while (v214);
    }

    id v4 = v377;
  }

  id v221 = [v4 objectForKeyedSubscript:@"locationShiftVersion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setLocationShiftVersion:", objc_msgSend(v221, "unsignedIntValue"));
  }

  long long v222 = [v4 objectForKeyedSubscript:@"hybridUnavailableRegion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v425 = 0u;
    long long v426 = 0u;
    long long v423 = 0u;
    long long v424 = 0u;
    id v223 = v222;
    uint64_t v224 = [v223 countByEnumeratingWithState:&v423 objects:v505 count:16];
    if (v224)
    {
      uint64_t v225 = v224;
      uint64_t v226 = *(void *)v424;
      do
      {
        for (uint64_t i8 = 0; i8 != v225; ++i8)
        {
          if (*(void *)v424 != v226) {
            objc_enumerationMutation(v223);
          }
          long long v228 = *(void **)(*((void *)&v423 + 1) + 8 * i8);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v421 = 0uLL;
            uint64_t v422 = 0;
            _GEOTileSetRegionFromDictionaryRepresentation(v228, &v421);
            long long v419 = v421;
            uint64_t v420 = v422;
            [v5 addHybridUnavailableRegion:&v419];
          }
        }
        uint64_t v225 = [v223 countByEnumeratingWithState:&v423 objects:v505 count:16];
      }
      while (v225);
    }
  }
  long long v229 = [v4 objectForKeyedSubscript:@"reserved"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v230 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v229 options:0];
    [v5 setReserved:v230];
  }
  if (v378) {
    long long v231 = @"spatialLookupURLLegacy";
  }
  else {
    long long v231 = @"spatialLookupURL_legacy";
  }
  long long v232 = [v4 objectForKeyedSubscript:v231];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v233 = (void *)[v232 copy];
    [v5 setSpatialLookupURLLegacy:v233];
  }
  long long v234 = [v4 objectForKeyedSubscript:@"activeResource"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v417 = 0u;
    long long v418 = 0u;
    long long v415 = 0u;
    long long v416 = 0u;
    id v235 = v234;
    uint64_t v236 = [v235 countByEnumeratingWithState:&v415 objects:v504 count:16];
    if (v236)
    {
      uint64_t v237 = v236;
      uint64_t v238 = *(void *)v416;
      do
      {
        for (uint64_t i9 = 0; i9 != v237; ++i9)
        {
          if (*(void *)v416 != v238) {
            objc_enumerationMutation(v235);
          }
          uint64_t v240 = *(void *)(*((void *)&v415 + 1) + 8 * i9);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v241 = [GEOResource alloc];
            if (v378) {
              uint64_t v242 = [(GEOResource *)v241 initWithJSON:v240];
            }
            else {
              uint64_t v242 = [(GEOResource *)v241 initWithDictionary:v240];
            }
            long long v243 = (void *)v242;
            [v5 addActiveResource:v242];
          }
        }
        uint64_t v237 = [v235 countByEnumeratingWithState:&v415 objects:v504 count:16];
      }
      while (v237);
    }

    id v4 = v377;
  }

  long long v244 = [v4 objectForKeyedSubscript:@"regionalResource"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v413 = 0u;
    long long v414 = 0u;
    long long v411 = 0u;
    long long v412 = 0u;
    id v245 = v244;
    uint64_t v246 = [v245 countByEnumeratingWithState:&v411 objects:v503 count:16];
    if (v246)
    {
      uint64_t v247 = v246;
      uint64_t v248 = *(void *)v412;
      do
      {
        for (uint64_t i10 = 0; i10 != v247; ++i10)
        {
          if (*(void *)v412 != v248) {
            objc_enumerationMutation(v245);
          }
          uint64_t v250 = *(void *)(*((void *)&v411 + 1) + 8 * i10);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v251 = [GEORegionalResourceSet alloc];
            if (v378) {
              uint64_t v252 = [(GEORegionalResourceSet *)v251 initWithJSON:v250];
            }
            else {
              uint64_t v252 = [(GEORegionalResourceSet *)v251 initWithDictionary:v250];
            }
            long long v253 = (void *)v252;
            [v5 addRegionalResource:v252];
          }
        }
        uint64_t v247 = [v245 countByEnumeratingWithState:&v411 objects:v503 count:16];
      }
      while (v247);
    }

    id v4 = v377;
  }

  long long v254 = [v4 objectForKeyedSubscript:@"modelVersion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setModelVersion:", objc_msgSend(v254, "unsignedIntValue"));
  }

  long long v255 = [v4 objectForKeyedSubscript:@"activeScale"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v409 = 0u;
    long long v410 = 0u;
    long long v407 = 0u;
    long long v408 = 0u;
    id v256 = v255;
    uint64_t v257 = [v256 countByEnumeratingWithState:&v407 objects:v502 count:16];
    if (!v257) {
      goto LABEL_389;
    }
    uint64_t v258 = v257;
    uint64_t v259 = *(void *)v408;
    while (1)
    {
      for (uint64_t i11 = 0; i11 != v258; ++i11)
      {
        if (*(void *)v408 != v259) {
          objc_enumerationMutation(v256);
        }
        long long v261 = *(void **)(*((void *)&v407 + 1) + 8 * i11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v262 = v261;
          if ([v262 isEqualToString:@"RESOURCE_FILTER_SCALE_UNKNOWN"])
          {
            uint64_t v263 = 0;
          }
          else if ([v262 isEqualToString:@"RESOURCE_FILTER_SCALE_1X"])
          {
            uint64_t v263 = 1;
          }
          else if ([v262 isEqualToString:@"RESOURCE_FILTER_SCALE_2X"])
          {
            uint64_t v263 = 2;
          }
          else if ([v262 isEqualToString:@"RESOURCE_FILTER_SCALE_3X"])
          {
            uint64_t v263 = 3;
          }
          else
          {
            uint64_t v263 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v263 = [v261 intValue];
        }
        [v5 addActiveScale:v263];
      }
      uint64_t v258 = [v256 countByEnumeratingWithState:&v407 objects:v502 count:16];
      if (!v258)
      {
LABEL_389:

        id v4 = v377;
        break;
      }
    }
  }

  long long v264 = [v4 objectForKeyedSubscript:@"activeScenario"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_415;
  }
  long long v405 = 0u;
  long long v406 = 0u;
  long long v403 = 0u;
  long long v404 = 0u;
  v376 = v264;
  id v265 = v264;
  uint64_t v266 = [v265 countByEnumeratingWithState:&v403 objects:v501 count:16];
  if (!v266) {
    goto LABEL_414;
  }
  uint64_t v267 = v266;
  uint64_t v268 = *(void *)v404;
  do
  {
    for (uint64_t i12 = 0; i12 != v267; ++i12)
    {
      if (*(void *)v404 != v268) {
        objc_enumerationMutation(v265);
      }
      v270 = *(void **)(*((void *)&v403 + 1) + 8 * i12);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v271 = v270;
        if ([v271 isEqualToString:@"RESOURCE_FILTER_SCENARIO_UNKNOWN"])
        {
          uint64_t v272 = 0;
        }
        else if ([v271 isEqualToString:@"RESOURCE_FILTER_SCENARIO_CARPLAY"])
        {
          uint64_t v272 = 1;
        }
        else if ([v271 isEqualToString:@"RESOURCE_FILTER_SCENARIO_NAVIGATION"])
        {
          uint64_t v272 = 2;
        }
        else if ([v271 isEqualToString:@"RESOURCE_FILTER_SCENARIO_HIGHVISIBILITY"])
        {
          uint64_t v272 = 3;
        }
        else if ([v271 isEqualToString:@"RESOURCE_FILTER_SCENARIO_EXPLICIT"])
        {
          uint64_t v272 = 4;
        }
        else
        {
          uint64_t v272 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          continue;
        }
        uint64_t v272 = [v270 intValue];
      }
      [v5 addActiveScenario:v272];
    }
    uint64_t v267 = [v265 countByEnumeratingWithState:&v403 objects:v501 count:16];
  }
  while (v267);
LABEL_414:

  long long v264 = v376;
  id v4 = v377;
LABEL_415:

  v273 = [v4 objectForKeyedSubscript:@"staleResource"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v401 = 0u;
    long long v402 = 0u;
    long long v399 = 0u;
    long long v400 = 0u;
    id v274 = v273;
    uint64_t v275 = [v274 countByEnumeratingWithState:&v399 objects:v500 count:16];
    if (v275)
    {
      uint64_t v276 = v275;
      uint64_t v277 = *(void *)v400;
      do
      {
        for (uint64_t i13 = 0; i13 != v276; ++i13)
        {
          if (*(void *)v400 != v277) {
            objc_enumerationMutation(v274);
          }
          uint64_t v279 = *(void *)(*((void *)&v399 + 1) + 8 * i13);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v280 = [GEOStaleResource alloc];
            if (v378) {
              uint64_t v281 = [(GEOStaleResource *)v280 initWithJSON:v279];
            }
            else {
              uint64_t v281 = [(GEOStaleResource *)v280 initWithDictionary:v279];
            }
            v282 = (void *)v281;
            [v5 addStaleResource:v281];
          }
        }
        uint64_t v276 = [v274 countByEnumeratingWithState:&v399 objects:v500 count:16];
      }
      while (v276);
    }

    id v4 = v377;
  }

  v283 = [v4 objectForKeyedSubscript:@"dataSet"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v284 = [GEODataSetDescription alloc];
    if (v378) {
      uint64_t v285 = [(GEODataSetDescription *)v284 initWithJSON:v283];
    }
    else {
      uint64_t v285 = [(GEODataSetDescription *)v284 initWithDictionary:v283];
    }
    v286 = (void *)v285;
    [v5 setDataSet:v285];
  }
  if (v378) {
    v287 = @"realtimeTrafficProbeURLLegacy";
  }
  else {
    v287 = @"realtimeTrafficProbeURL_legacy";
  }
  v288 = [v4 objectForKeyedSubscript:v287];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v289 = (void *)[v288 copy];
    [v5 setRealtimeTrafficProbeURLLegacy:v289];
  }
  if (v378) {
    v290 = @"batchTrafficProbeURLLegacy";
  }
  else {
    v290 = @"batchTrafficProbeURL_legacy";
  }
  v291 = [v4 objectForKeyedSubscript:v290];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v292 = (void *)[v291 copy];
    [v5 setBatchTrafficProbeURLLegacy:v292];
  }
  if (v378) {
    v293 = @"logMessageUsageV3URLLegacy";
  }
  else {
    v293 = @"logMessageUsageV3URL_legacy";
  }
  v294 = [v4 objectForKeyedSubscript:v293];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v295 = (void *)[v294 copy];
    [v5 setLogMessageUsageV3URLLegacy:v295];
  }
  if (v378) {
    v296 = @"proactiveRoutingURLLegacy";
  }
  else {
    v296 = @"proactiveRoutingURL_legacy";
  }
  v297 = [v4 objectForKeyedSubscript:v296];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v298 = (void *)[v297 copy];
    [v5 setProactiveRoutingURLLegacy:v298];
  }
  if (v378) {
    v299 = @"backgroundDispatcherURLLegacy";
  }
  else {
    v299 = @"backgroundDispatcherURL_legacy";
  }
  v300 = [v4 objectForKeyedSubscript:v299];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v301 = (void *)[v300 copy];
    [v5 setBackgroundDispatcherURLLegacy:v301];
  }
  if (v378) {
    v302 = @"bluePOIURLLegacy";
  }
  else {
    v302 = @"bluePOIURL_legacy";
  }
  v303 = [v4 objectForKeyedSubscript:v302];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v304 = (void *)[v303 copy];
    [v5 setBluePOIURLLegacy:v304];
  }
  if (v378) {
    v305 = @"backgroundRevGeoURLLegacy";
  }
  else {
    v305 = @"backgroundRevGeoURL_legacy";
  }
  v306 = [v4 objectForKeyedSubscript:v305];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v307 = (void *)[v306 copy];
    [v5 setBackgroundRevGeoURLLegacy:v307];
  }
  if (v378) {
    v308 = @"wifiConnectionQualityProbeURLLegacy";
  }
  else {
    v308 = @"wifiConnectionQualityProbeURL_legacy";
  }
  v309 = [v4 objectForKeyedSubscript:v308];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v310 = (void *)[v309 copy];
    [v5 setWifiConnectionQualityProbeURLLegacy:v310];
  }
  v311 = [v4 objectForKeyedSubscript:@"muninBaseURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v312 = (void *)[v311 copy];
    [v5 setMuninBaseURL:v312];
  }
  v313 = [v4 objectForKeyedSubscript:@"flyoverRegionVersions"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v314 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v313 options:0];
    [v5 setFlyoverRegionVersions:v314];
  }
  v315 = [v4 objectForKeyedSubscript:@"urlInfoSet"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v316 = [GEOURLInfoSet alloc];
    if (v378) {
      uint64_t v317 = [(GEOURLInfoSet *)v316 initWithJSON:v315];
    }
    else {
      uint64_t v317 = [(GEOURLInfoSet *)v316 initWithDictionary:v315];
    }
    v318 = (void *)v317;
    [v5 setUrlInfoSet:v317];
  }
  v319 = [v4 objectForKeyedSubscript:@"muninBucket"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v397 = 0u;
    long long v398 = 0u;
    long long v395 = 0u;
    long long v396 = 0u;
    id v320 = v319;
    uint64_t v321 = [v320 countByEnumeratingWithState:&v395 objects:v499 count:16];
    if (v321)
    {
      uint64_t v322 = v321;
      uint64_t v323 = *(void *)v396;
      do
      {
        for (uint64_t i14 = 0; i14 != v322; ++i14)
        {
          if (*(void *)v396 != v323) {
            objc_enumerationMutation(v320);
          }
          uint64_t v325 = *(void *)(*((void *)&v395 + 1) + 8 * i14);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v326 = [GEOMuninBucket alloc];
            if (v378) {
              uint64_t v327 = [(GEOMuninBucket *)v326 initWithJSON:v325];
            }
            else {
              uint64_t v327 = [(GEOMuninBucket *)v326 initWithDictionary:v325];
            }
            v328 = (void *)v327;
            [v5 addMuninBucket:v327];
          }
        }
        uint64_t v322 = [v320 countByEnumeratingWithState:&v395 objects:v499 count:16];
      }
      while (v322);
    }

    id v4 = v377;
  }

  v329 = [v4 objectForKeyedSubscript:@"environment"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v330 = (void *)[v329 copy];
    [v5 setEnvironment:v330];
  }
  v331 = [v4 objectForKeyedSubscript:@"displayStrings"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v393 = 0u;
    long long v394 = 0u;
    long long v391 = 0u;
    long long v392 = 0u;
    id v332 = v331;
    uint64_t v333 = [v332 countByEnumeratingWithState:&v391 objects:v498 count:16];
    if (v333)
    {
      uint64_t v334 = v333;
      uint64_t v335 = *(void *)v392;
      do
      {
        for (uint64_t i15 = 0; i15 != v334; ++i15)
        {
          if (*(void *)v392 != v335) {
            objc_enumerationMutation(v332);
          }
          uint64_t v337 = *(void *)(*((void *)&v391 + 1) + 8 * i15);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v338 = [GEODisplayString alloc];
            if (v378) {
              uint64_t v339 = [(GEODisplayString *)v338 initWithJSON:v337];
            }
            else {
              uint64_t v339 = [(GEODisplayString *)v338 initWithDictionary:v337];
            }
            v340 = (void *)v339;
            [v5 addDisplayStrings:v339];
          }
        }
        uint64_t v334 = [v332 countByEnumeratingWithState:&v391 objects:v498 count:16];
      }
      while (v334);
    }
  }
  v341 = [v4 objectForKeyedSubscript:@"explicitResource"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v389 = 0u;
    long long v390 = 0u;
    long long v387 = 0u;
    long long v388 = 0u;
    id v342 = v341;
    uint64_t v343 = [v342 countByEnumeratingWithState:&v387 objects:v497 count:16];
    if (v343)
    {
      uint64_t v344 = v343;
      uint64_t v345 = *(void *)v388;
      do
      {
        for (uint64_t i16 = 0; i16 != v344; ++i16)
        {
          if (*(void *)v388 != v345) {
            objc_enumerationMutation(v342);
          }
          uint64_t v347 = *(void *)(*((void *)&v387 + 1) + 8 * i16);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v348 = [GEOResource alloc];
            if (v378) {
              uint64_t v349 = [(GEOResource *)v348 initWithJSON:v347];
            }
            else {
              uint64_t v349 = [(GEOResource *)v348 initWithDictionary:v347];
            }
            v350 = (void *)v349;
            [v5 addExplicitResource:v349];
          }
        }
        uint64_t v344 = [v342 countByEnumeratingWithState:&v387 objects:v497 count:16];
      }
      while (v344);
    }
  }
  v351 = [v4 objectForKeyedSubscript:@"offlineMetadata"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v352 = [GEOOfflineMetadata alloc];
    if (v378) {
      uint64_t v353 = [(GEOOfflineMetadata *)v352 initWithJSON:v351];
    }
    else {
      uint64_t v353 = [(GEOOfflineMetadata *)v352 initWithDictionary:v351];
    }
    v354 = (void *)v353;
    [v5 setOfflineMetadata:v353];
  }
  v355 = [v4 objectForKeyedSubscript:@"resourceCanonicalNameToFileName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v356 = [MEMORY[0x1E4F1CA60] dictionary];
    id v357 = v5[57];
    v5[57] = (id)v356;

    long long v385 = 0u;
    long long v386 = 0u;
    long long v383 = 0u;
    long long v384 = 0u;
    id v358 = v355;
    uint64_t v359 = [v358 countByEnumeratingWithState:&v383 objects:v496 count:16];
    if (v359)
    {
      uint64_t v360 = v359;
      uint64_t v361 = *(void *)v384;
      do
      {
        for (uint64_t i17 = 0; i17 != v360; ++i17)
        {
          if (*(void *)v384 != v361) {
            objc_enumerationMutation(v358);
          }
          uint64_t v363 = *(void *)(*((void *)&v383 + 1) + 8 * i17);
          v364 = [v358 objectForKeyedSubscript:v363];
          [v5[57] setObject:v364 forKey:v363];
        }
        uint64_t v360 = [v358 countByEnumeratingWithState:&v383 objects:v496 count:16];
      }
      while (v360);
    }

    id v4 = v377;
  }

  v365 = [v4 objectForKeyedSubscript:@"regionalResourceCanonicalNameToFileName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v366 = [MEMORY[0x1E4F1CA60] dictionary];
    id v367 = v5[50];
    v5[50] = (id)v366;

    long long v381 = 0u;
    long long v382 = 0u;
    long long v379 = 0u;
    long long v380 = 0u;
    id v368 = v365;
    uint64_t v369 = [v368 countByEnumeratingWithState:&v379 objects:v495 count:16];
    if (v369)
    {
      uint64_t v370 = v369;
      uint64_t v371 = *(void *)v380;
      do
      {
        for (uint64_t i18 = 0; i18 != v370; ++i18)
        {
          if (*(void *)v380 != v371) {
            objc_enumerationMutation(v368);
          }
          uint64_t v373 = *(void *)(*((void *)&v379 + 1) + 8 * i18);
          v374 = [v368 objectForKeyedSubscript:v373];
          [v5[50] setObject:v374 forKey:v373];
        }
        uint64_t v370 = [v368 countByEnumeratingWithState:&v379 objects:v495 count:16];
      }
      while (v370);
    }
  }
  v2 = v5;

LABEL_551:
  return v2;
}

- (GEOActiveTileGroup)initWithJSON:(id)a3
{
  return (GEOActiveTileGroup *)-[GEOActiveTileGroup _initWithDictionary:isJSON:]();
}

+ (BOOL)isValid:(id)a3
{
  return GEOActiveTileGroupIsValid((char *)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v231 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOActiveTileGroupIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v106 = self->_reader;
    objc_sync_enter(v106);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v107 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v107];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v106);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOActiveTileGroup *)self readAll:0];
    PBDataWriterWriteUint32Field();
    long long v207 = 0u;
    long long v206 = 0u;
    long long v205 = 0u;
    long long v204 = 0u;
    id v6 = self->_tileSets;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v204 objects:v230 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v205;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v205 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v204 objects:v230 count:16];
      }
      while (v7);
    }

    long long v203 = 0u;
    long long v202 = 0u;
    long long v201 = 0u;
    long long v200 = 0u;
    uint64_t v10 = self->_resources;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v200 objects:v229 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v201;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v201 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v200 objects:v229 count:16];
      }
      while (v11);
    }

    if (self->_uniqueIdentifier) {
      PBDataWriterWriteStringField();
    }
    long long v199 = 0u;
    long long v198 = 0u;
    long long v197 = 0u;
    long long v196 = 0u;
    uint64_t v14 = self->_attributions;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v196 objects:v228 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v197;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v197 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v196 objects:v228 count:16];
      }
      while (v15);
    }

    long long v195 = 0u;
    long long v194 = 0u;
    long long v193 = 0u;
    long long v192 = 0u;
    id v18 = self->_regionalResourceTiles;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v192 objects:v227 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v193;
      do
      {
        for (uint64_t m = 0; m != v19; ++m)
        {
          if (*(void *)v193 != v20) {
            objc_enumerationMutation(v18);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v192 objects:v227 count:16];
      }
      while (v19);
    }

    long long v191 = 0u;
    long long v190 = 0u;
    long long v189 = 0u;
    long long v188 = 0u;
    long long v22 = self->_regionalResourceRegions;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v188 objects:v226 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v189;
      do
      {
        for (uint64_t n = 0; n != v23; ++n)
        {
          if (*(void *)v189 != v24) {
            objc_enumerationMutation(v22);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v188 objects:v226 count:16];
      }
      while (v23);
    }

    if (self->_regionalResourcesURLLegacy) {
      PBDataWriterWriteStringField();
    }
    if (self->_searchAttributionManifestURLLegacy) {
      PBDataWriterWriteStringField();
    }
    if (self->_directionsURLLegacy) {
      PBDataWriterWriteStringField();
    }
    if (self->_etaURLLegacy) {
      PBDataWriterWriteStringField();
    }
    if (self->_batchReverseGeocoderURLLegacy) {
      PBDataWriterWriteStringField();
    }
    if (self->_releaseInfo) {
      PBDataWriterWriteStringField();
    }
    if (self->_resourcesURLLegacy) {
      PBDataWriterWriteStringField();
    }
    if (self->_simpleETAURLLegacy) {
      PBDataWriterWriteStringField();
    }
    if (self->_addressCorrectionInitURLLegacy) {
      PBDataWriterWriteStringField();
    }
    if (self->_addressCorrectionUpdateURLLegacy) {
      PBDataWriterWriteStringField();
    }
    if (self->_polyLocationShiftURLLegacy) {
      PBDataWriterWriteStringField();
    }
    if (self->_problemSubmissionURLLegacy) {
      PBDataWriterWriteStringField();
    }
    if (self->_problemStatusURLLegacy) {
      PBDataWriterWriteStringField();
    }
    if (self->_reverseGeocoderVersionsURLLegacy) {
      PBDataWriterWriteStringField();
    }
    if (self->_problemCategoriesURLLegacy) {
      PBDataWriterWriteStringField();
    }
    if (self->_announcementsURLLegacy) {
      PBDataWriterWriteStringField();
    }
    long long v187 = 0u;
    long long v186 = 0u;
    long long v185 = 0u;
    long long v184 = 0u;
    uint64_t v26 = self->_announcementsSupportedLanguages;
    uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v184 objects:v225 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v185;
      do
      {
        for (iuint64_t i = 0; ii != v27; ++ii)
        {
          if (*(void *)v185 != v28) {
            objc_enumerationMutation(v26);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v184 objects:v225 count:16];
      }
      while (v27);
    }

    if (self->_dispatcherURLLegacy) {
      PBDataWriterWriteStringField();
    }
    if (self->_problemOptInURLLegacy) {
      PBDataWriterWriteStringField();
    }
    if (self->_versionManifest) {
      PBDataWriterWriteSubmessage();
    }
    long long v183 = 0u;
    long long v182 = 0u;
    long long v181 = 0u;
    long long v180 = 0u;
    uint64_t v30 = self->_styleSheets;
    uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v180 objects:v224 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v181;
      do
      {
        for (juint64_t j = 0; jj != v31; ++jj)
        {
          if (*(void *)v181 != v32) {
            objc_enumerationMutation(v30);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v180 objects:v224 count:16];
      }
      while (v31);
    }

    long long v179 = 0u;
    long long v178 = 0u;
    long long v177 = 0u;
    long long v176 = 0u;
    uint64_t v34 = self->_styleSheetChecksums;
    uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v176 objects:v223 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v177;
      do
      {
        for (kuint64_t k = 0; kk != v35; ++kk)
        {
          if (*(void *)v177 != v36) {
            objc_enumerationMutation(v34);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v176 objects:v223 count:16];
      }
      while (v35);
    }

    long long v175 = 0u;
    long long v173 = 0u;
    long long v174 = 0u;
    long long v172 = 0u;
    id v38 = self->_textures;
    uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v172 objects:v222 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v173;
      do
      {
        for (muint64_t m = 0; mm != v39; ++mm)
        {
          if (*(void *)v173 != v40) {
            objc_enumerationMutation(v38);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v172 objects:v222 count:16];
      }
      while (v39);
    }

    long long v170 = 0u;
    long long v171 = 0u;
    long long v168 = 0u;
    long long v169 = 0u;
    v42 = self->_textureChecksums;
    uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v168 objects:v221 count:16];
    if (v43)
    {
      uint64_t v44 = *(void *)v169;
      do
      {
        for (nuint64_t n = 0; nn != v43; ++nn)
        {
          if (*(void *)v169 != v44) {
            objc_enumerationMutation(v42);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v168 objects:v221 count:16];
      }
      while (v43);
    }

    long long v166 = 0u;
    long long v167 = 0u;
    long long v164 = 0u;
    long long v165 = 0u;
    v46 = self->_fonts;
    uint64_t v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v164 objects:v220 count:16];
    if (v47)
    {
      uint64_t v48 = *(void *)v165;
      do
      {
        for (uint64_t i1 = 0; i1 != v47; ++i1)
        {
          if (*(void *)v165 != v48) {
            objc_enumerationMutation(v46);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v164 objects:v220 count:16];
      }
      while (v47);
    }

    long long v162 = 0u;
    long long v163 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    uint64_t v50 = self->_fontChecksums;
    uint64_t v51 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v160 objects:v219 count:16];
    if (v51)
    {
      uint64_t v52 = *(void *)v161;
      do
      {
        for (uint64_t i2 = 0; i2 != v51; ++i2)
        {
          if (*(void *)v161 != v52) {
            objc_enumerationMutation(v50);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v51 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v160 objects:v219 count:16];
      }
      while (v51);
    }

    long long v158 = 0u;
    long long v159 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    v54 = self->_icons;
    uint64_t v55 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v156 objects:v218 count:16];
    if (v55)
    {
      uint64_t v56 = *(void *)v157;
      do
      {
        for (uint64_t i3 = 0; i3 != v55; ++i3)
        {
          if (*(void *)v157 != v56) {
            objc_enumerationMutation(v54);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v55 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v156 objects:v218 count:16];
      }
      while (v55);
    }

    long long v154 = 0u;
    long long v155 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    v58 = self->_iconChecksums;
    uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v152 objects:v217 count:16];
    if (v59)
    {
      uint64_t v60 = *(void *)v153;
      do
      {
        for (uint64_t i4 = 0; i4 != v59; ++i4)
        {
          if (*(void *)v153 != v60) {
            objc_enumerationMutation(v58);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v152 objects:v217 count:16];
      }
      while (v59);
    }

    long long v150 = 0u;
    long long v151 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    v62 = self->_xmls;
    uint64_t v63 = [(NSMutableArray *)v62 countByEnumeratingWithState:&v148 objects:v216 count:16];
    if (v63)
    {
      uint64_t v64 = *(void *)v149;
      do
      {
        for (uint64_t i5 = 0; i5 != v63; ++i5)
        {
          if (*(void *)v149 != v64) {
            objc_enumerationMutation(v62);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v63 = [(NSMutableArray *)v62 countByEnumeratingWithState:&v148 objects:v216 count:16];
      }
      while (v63);
    }

    long long v146 = 0u;
    long long v147 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    v66 = self->_xmlChecksums;
    uint64_t v67 = [(NSMutableArray *)v66 countByEnumeratingWithState:&v144 objects:v215 count:16];
    if (v67)
    {
      uint64_t v68 = *(void *)v145;
      do
      {
        for (uint64_t i6 = 0; i6 != v67; ++i6)
        {
          if (*(void *)v145 != v68) {
            objc_enumerationMutation(v66);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v67 = [(NSMutableArray *)v66 countByEnumeratingWithState:&v144 objects:v215 count:16];
      }
      while (v67);
    }

    if (self->_abExperimentURLLegacy) {
      PBDataWriterWriteStringField();
    }
    if (self->_businessPortalBaseURLLegacy) {
      PBDataWriterWriteStringField();
    }
    if (self->_logMessageUsageURLLegacy) {
      PBDataWriterWriteStringField();
    }
    long long v142 = 0u;
    long long v143 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    v70 = self->_locationShiftEnabledRegions;
    uint64_t v71 = [(NSMutableArray *)v70 countByEnumeratingWithState:&v140 objects:v214 count:16];
    if (v71)
    {
      uint64_t v72 = *(void *)v141;
      do
      {
        for (uint64_t i7 = 0; i7 != v71; ++i7)
        {
          if (*(void *)v141 != v72) {
            objc_enumerationMutation(v70);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v71 = [(NSMutableArray *)v70 countByEnumeratingWithState:&v140 objects:v214 count:16];
      }
      while (v71);
    }

    if (*(void *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_hybridUnavailableRegionsCount)
    {
      uint64_t v74 = 0;
      unint64_t v75 = 0;
      do
      {
        uint64_t v139 = 0;
        PBDataWriterPlaceMark();
        GEOTileSetRegionWriteTo();
        PBDataWriterRecallMark();
        ++v75;
        v74 += 24;
      }
      while (v75 < self->_hybridUnavailableRegionsCount);
    }
    if (self->_reserved) {
      PBDataWriterWriteDataField();
    }
    if (self->_spatialLookupURLLegacy) {
      PBDataWriterWriteStringField();
    }
    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    v76 = self->_activeResources;
    uint64_t v77 = [(NSMutableArray *)v76 countByEnumeratingWithState:&v135 objects:v213 count:16];
    if (v77)
    {
      uint64_t v78 = *(void *)v136;
      do
      {
        for (uint64_t i8 = 0; i8 != v77; ++i8)
        {
          if (*(void *)v136 != v78) {
            objc_enumerationMutation(v76);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v77 = [(NSMutableArray *)v76 countByEnumeratingWithState:&v135 objects:v213 count:16];
      }
      while (v77);
    }

    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    v80 = self->_regionalResources;
    uint64_t v81 = [(NSMutableArray *)v80 countByEnumeratingWithState:&v131 objects:v212 count:16];
    if (v81)
    {
      uint64_t v82 = *(void *)v132;
      do
      {
        for (uint64_t i9 = 0; i9 != v81; ++i9)
        {
          if (*(void *)v132 != v82) {
            objc_enumerationMutation(v80);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v81 = [(NSMutableArray *)v80 countByEnumeratingWithState:&v131 objects:v212 count:16];
      }
      while (v81);
    }

    if ((*(void *)&self->_flags & 2) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_activeScales.count)
    {
      unint64_t v84 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v84;
      }
      while (v84 < self->_activeScales.count);
    }
    if (self->_activeScenarios.count)
    {
      unint64_t v85 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v85;
      }
      while (v85 < self->_activeScenarios.count);
    }
    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    v86 = self->_staleResources;
    uint64_t v87 = [(NSMutableArray *)v86 countByEnumeratingWithState:&v127 objects:v211 count:16];
    if (v87)
    {
      uint64_t v88 = *(void *)v128;
      do
      {
        for (uint64_t i10 = 0; i10 != v87; ++i10)
        {
          if (*(void *)v128 != v88) {
            objc_enumerationMutation(v86);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v87 = [(NSMutableArray *)v86 countByEnumeratingWithState:&v127 objects:v211 count:16];
      }
      while (v87);
    }

    if (self->_dataSet) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_realtimeTrafficProbeURLLegacy) {
      PBDataWriterWriteStringField();
    }
    if (self->_batchTrafficProbeURLLegacy) {
      PBDataWriterWriteStringField();
    }
    if (self->_logMessageUsageV3URLLegacy) {
      PBDataWriterWriteStringField();
    }
    if (self->_proactiveRoutingURLLegacy) {
      PBDataWriterWriteStringField();
    }
    if (self->_backgroundDispatcherURLLegacy) {
      PBDataWriterWriteStringField();
    }
    if (self->_bluePOIURLLegacy) {
      PBDataWriterWriteStringField();
    }
    if (self->_backgroundRevGeoURLLegacy) {
      PBDataWriterWriteStringField();
    }
    if (self->_wifiConnectionQualityProbeURLLegacy) {
      PBDataWriterWriteStringField();
    }
    if (self->_muninBaseURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_flyoverRegionVersions) {
      PBDataWriterWriteDataField();
    }
    if (self->_urlInfoSet) {
      PBDataWriterWriteSubmessage();
    }
    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    v90 = self->_muninBuckets;
    uint64_t v91 = [(NSMutableArray *)v90 countByEnumeratingWithState:&v123 objects:v210 count:16];
    if (v91)
    {
      uint64_t v92 = *(void *)v124;
      do
      {
        for (uint64_t i11 = 0; i11 != v91; ++i11)
        {
          if (*(void *)v124 != v92) {
            objc_enumerationMutation(v90);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v91 = [(NSMutableArray *)v90 countByEnumeratingWithState:&v123 objects:v210 count:16];
      }
      while (v91);
    }

    if (self->_environment) {
      PBDataWriterWriteStringField();
    }
    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    v94 = self->_displayStrings;
    uint64_t v95 = [(NSMutableArray *)v94 countByEnumeratingWithState:&v119 objects:v209 count:16];
    if (v95)
    {
      uint64_t v96 = *(void *)v120;
      do
      {
        for (uint64_t i12 = 0; i12 != v95; ++i12)
        {
          if (*(void *)v120 != v96) {
            objc_enumerationMutation(v94);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v95 = [(NSMutableArray *)v94 countByEnumeratingWithState:&v119 objects:v209 count:16];
      }
      while (v95);
    }

    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    uint64_t v98 = self->_explicitResources;
    uint64_t v99 = [(NSMutableArray *)v98 countByEnumeratingWithState:&v115 objects:v208 count:16];
    if (v99)
    {
      uint64_t v100 = *(void *)v116;
      do
      {
        for (uint64_t i13 = 0; i13 != v99; ++i13)
        {
          if (*(void *)v116 != v100) {
            objc_enumerationMutation(v98);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v99 = [(NSMutableArray *)v98 countByEnumeratingWithState:&v115 objects:v208 count:16];
      }
      while (v99);
    }

    if (self->_offlineMetadata) {
      PBDataWriterWriteSubmessage();
    }
    resourceCanonicalNameToFileName = self->_resourceCanonicalNameToFileName;
    v113[0] = MEMORY[0x1E4F143A8];
    v113[1] = 3221225472;
    v113[2] = __30__GEOActiveTileGroup_writeTo___block_invoke;
    v113[3] = &unk_1E53DFD80;
    id v103 = v4;
    id v114 = v103;
    [(NSMutableDictionary *)resourceCanonicalNameToFileName enumerateKeysAndObjectsUsingBlock:v113];

    regionalResourceCanonicalNameToFileName = self->_regionalResourceCanonicalNameToFileName;
    uint64_t v108 = MEMORY[0x1E4F143A8];
    uint64_t v109 = 3221225472;
    v110 = __30__GEOActiveTileGroup_writeTo___block_invoke_2;
    v111 = &unk_1E53DFD80;
    id v105 = v103;
    id v112 = v105;
    [(NSMutableDictionary *)regionalResourceCanonicalNameToFileName enumerateKeysAndObjectsUsingBlock:&v108];

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v105, v108, v109, v110, v111);
  }
}

uint64_t __30__GEOActiveTileGroup_writeTo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  PBDataWriterPlaceMark();
  PBDataWriterWriteStringField();

  PBDataWriterWriteStringField();
  return PBDataWriterRecallMark();
}

uint64_t __30__GEOActiveTileGroup_writeTo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  PBDataWriterPlaceMark();
  PBDataWriterWriteStringField();

  PBDataWriterWriteStringField();
  return PBDataWriterRecallMark();
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOActiveTileGroup _readLocationShiftEnabledRegions]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_locationShiftEnabledRegions;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v12))
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  id v4 = (id *)a3;
  [(GEOActiveTileGroup *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 152) = self->_readerMarkPos;
  *((_DWORD *)v4 + 153) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_DWORD *)v4 + 155) = self->_identifier;
  if ([(GEOActiveTileGroup *)self tileSetsCount])
  {
    [v4 clearTileSets];
    unint64_t v5 = [(GEOActiveTileGroup *)self tileSetsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOActiveTileGroup *)self tileSetAtIndex:i];
        [v4 addTileSet:v8];
      }
    }
  }
  if ([(GEOActiveTileGroup *)self resourcesCount])
  {
    [v4 clearResources];
    unint64_t v9 = [(GEOActiveTileGroup *)self resourcesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        long long v12 = [(GEOActiveTileGroup *)self resourceAtIndex:j];
        [v4 addResource:v12];
      }
    }
  }
  if (self->_uniqueIdentifier) {
    objc_msgSend(v4, "setUniqueIdentifier:");
  }
  if ([(GEOActiveTileGroup *)self attributionsCount])
  {
    [v4 clearAttributions];
    unint64_t v13 = [(GEOActiveTileGroup *)self attributionsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(GEOActiveTileGroup *)self attributionAtIndex:k];
        [v4 addAttribution:v16];
      }
    }
  }
  if ([(GEOActiveTileGroup *)self regionalResourceTilesCount])
  {
    [v4 clearRegionalResourceTiles];
    unint64_t v17 = [(GEOActiveTileGroup *)self regionalResourceTilesCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        uint64_t v20 = [(GEOActiveTileGroup *)self regionalResourceTileAtIndex:m];
        [v4 addRegionalResourceTile:v20];
      }
    }
  }
  if ([(GEOActiveTileGroup *)self regionalResourceRegionsCount])
  {
    [v4 clearRegionalResourceRegions];
    unint64_t v21 = [(GEOActiveTileGroup *)self regionalResourceRegionsCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (uint64_t n = 0; n != v22; ++n)
      {
        uint64_t v24 = [(GEOActiveTileGroup *)self regionalResourceRegionAtIndex:n];
        [v4 addRegionalResourceRegion:v24];
      }
    }
  }
  if (self->_regionalResourcesURLLegacy) {
    objc_msgSend(v4, "setRegionalResourcesURLLegacy:");
  }
  if (self->_searchAttributionManifestURLLegacy) {
    objc_msgSend(v4, "setSearchAttributionManifestURLLegacy:");
  }
  if (self->_directionsURLLegacy) {
    objc_msgSend(v4, "setDirectionsURLLegacy:");
  }
  if (self->_etaURLLegacy) {
    objc_msgSend(v4, "setEtaURLLegacy:");
  }
  if (self->_batchReverseGeocoderURLLegacy) {
    objc_msgSend(v4, "setBatchReverseGeocoderURLLegacy:");
  }
  if (self->_releaseInfo) {
    objc_msgSend(v4, "setReleaseInfo:");
  }
  if (self->_resourcesURLLegacy) {
    objc_msgSend(v4, "setResourcesURLLegacy:");
  }
  if (self->_simpleETAURLLegacy) {
    objc_msgSend(v4, "setSimpleETAURLLegacy:");
  }
  if (self->_addressCorrectionInitURLLegacy) {
    objc_msgSend(v4, "setAddressCorrectionInitURLLegacy:");
  }
  if (self->_addressCorrectionUpdateURLLegacy) {
    objc_msgSend(v4, "setAddressCorrectionUpdateURLLegacy:");
  }
  if (self->_polyLocationShiftURLLegacy) {
    objc_msgSend(v4, "setPolyLocationShiftURLLegacy:");
  }
  if (self->_problemSubmissionURLLegacy) {
    objc_msgSend(v4, "setProblemSubmissionURLLegacy:");
  }
  if (self->_problemStatusURLLegacy) {
    objc_msgSend(v4, "setProblemStatusURLLegacy:");
  }
  if (self->_reverseGeocoderVersionsURLLegacy) {
    objc_msgSend(v4, "setReverseGeocoderVersionsURLLegacy:");
  }
  if (self->_problemCategoriesURLLegacy) {
    objc_msgSend(v4, "setProblemCategoriesURLLegacy:");
  }
  if (self->_announcementsURLLegacy) {
    objc_msgSend(v4, "setAnnouncementsURLLegacy:");
  }
  if ([(GEOActiveTileGroup *)self announcementsSupportedLanguagesCount])
  {
    [v4 clearAnnouncementsSupportedLanguages];
    unint64_t v25 = [(GEOActiveTileGroup *)self announcementsSupportedLanguagesCount];
    if (v25)
    {
      unint64_t v26 = v25;
      for (iuint64_t i = 0; ii != v26; ++ii)
      {
        uint64_t v28 = [(GEOActiveTileGroup *)self announcementsSupportedLanguagesAtIndex:ii];
        [v4 addAnnouncementsSupportedLanguages:v28];
      }
    }
  }
  if (self->_dispatcherURLLegacy) {
    objc_msgSend(v4, "setDispatcherURLLegacy:");
  }
  if (self->_problemOptInURLLegacy) {
    objc_msgSend(v4, "setProblemOptInURLLegacy:");
  }
  if (self->_versionManifest) {
    objc_msgSend(v4, "setVersionManifest:");
  }
  if ([(GEOActiveTileGroup *)self styleSheetsCount])
  {
    [v4 clearStyleSheets];
    unint64_t v29 = [(GEOActiveTileGroup *)self styleSheetsCount];
    if (v29)
    {
      unint64_t v30 = v29;
      for (juint64_t j = 0; jj != v30; ++jj)
      {
        uint64_t v32 = [(GEOActiveTileGroup *)self styleSheetAtIndex:jj];
        [v4 addStyleSheet:v32];
      }
    }
  }
  if ([(GEOActiveTileGroup *)self styleSheetChecksumsCount])
  {
    [v4 clearStyleSheetChecksums];
    unint64_t v33 = [(GEOActiveTileGroup *)self styleSheetChecksumsCount];
    if (v33)
    {
      unint64_t v34 = v33;
      for (kuint64_t k = 0; kk != v34; ++kk)
      {
        uint64_t v36 = [(GEOActiveTileGroup *)self styleSheetChecksumAtIndex:kk];
        [v4 addStyleSheetChecksum:v36];
      }
    }
  }
  if ([(GEOActiveTileGroup *)self texturesCount])
  {
    [v4 clearTextures];
    unint64_t v37 = [(GEOActiveTileGroup *)self texturesCount];
    if (v37)
    {
      unint64_t v38 = v37;
      for (muint64_t m = 0; mm != v38; ++mm)
      {
        uint64_t v40 = [(GEOActiveTileGroup *)self textureAtIndex:mm];
        [v4 addTexture:v40];
      }
    }
  }
  if ([(GEOActiveTileGroup *)self textureChecksumsCount])
  {
    [v4 clearTextureChecksums];
    unint64_t v41 = [(GEOActiveTileGroup *)self textureChecksumsCount];
    if (v41)
    {
      unint64_t v42 = v41;
      for (nuint64_t n = 0; nn != v42; ++nn)
      {
        uint64_t v44 = [(GEOActiveTileGroup *)self textureChecksumAtIndex:nn];
        [v4 addTextureChecksum:v44];
      }
    }
  }
  if ([(GEOActiveTileGroup *)self fontsCount])
  {
    [v4 clearFonts];
    unint64_t v45 = [(GEOActiveTileGroup *)self fontsCount];
    if (v45)
    {
      unint64_t v46 = v45;
      for (uint64_t i1 = 0; i1 != v46; ++i1)
      {
        uint64_t v48 = [(GEOActiveTileGroup *)self fontAtIndex:i1];
        [v4 addFont:v48];
      }
    }
  }
  if ([(GEOActiveTileGroup *)self fontChecksumsCount])
  {
    [v4 clearFontChecksums];
    unint64_t v49 = [(GEOActiveTileGroup *)self fontChecksumsCount];
    if (v49)
    {
      unint64_t v50 = v49;
      for (uint64_t i2 = 0; i2 != v50; ++i2)
      {
        uint64_t v52 = [(GEOActiveTileGroup *)self fontChecksumAtIndex:i2];
        [v4 addFontChecksum:v52];
      }
    }
  }
  if ([(GEOActiveTileGroup *)self iconsCount])
  {
    [v4 clearIcons];
    unint64_t v53 = [(GEOActiveTileGroup *)self iconsCount];
    if (v53)
    {
      unint64_t v54 = v53;
      for (uint64_t i3 = 0; i3 != v54; ++i3)
      {
        uint64_t v56 = [(GEOActiveTileGroup *)self iconAtIndex:i3];
        [v4 addIcon:v56];
      }
    }
  }
  if ([(GEOActiveTileGroup *)self iconChecksumsCount])
  {
    [v4 clearIconChecksums];
    unint64_t v57 = [(GEOActiveTileGroup *)self iconChecksumsCount];
    if (v57)
    {
      unint64_t v58 = v57;
      for (uint64_t i4 = 0; i4 != v58; ++i4)
      {
        uint64_t v60 = [(GEOActiveTileGroup *)self iconChecksumAtIndex:i4];
        [v4 addIconChecksum:v60];
      }
    }
  }
  if ([(GEOActiveTileGroup *)self xmlsCount])
  {
    [v4 clearXmls];
    unint64_t v61 = [(GEOActiveTileGroup *)self xmlsCount];
    if (v61)
    {
      unint64_t v62 = v61;
      for (uint64_t i5 = 0; i5 != v62; ++i5)
      {
        uint64_t v64 = [(GEOActiveTileGroup *)self xmlAtIndex:i5];
        [v4 addXml:v64];
      }
    }
  }
  if ([(GEOActiveTileGroup *)self xmlChecksumsCount])
  {
    [v4 clearXmlChecksums];
    unint64_t v65 = [(GEOActiveTileGroup *)self xmlChecksumsCount];
    if (v65)
    {
      unint64_t v66 = v65;
      for (uint64_t i6 = 0; i6 != v66; ++i6)
      {
        uint64_t v68 = [(GEOActiveTileGroup *)self xmlChecksumAtIndex:i6];
        [v4 addXmlChecksum:v68];
      }
    }
  }
  if (self->_abExperimentURLLegacy) {
    objc_msgSend(v4, "setAbExperimentURLLegacy:");
  }
  if (self->_businessPortalBaseURLLegacy) {
    objc_msgSend(v4, "setBusinessPortalBaseURLLegacy:");
  }
  if (self->_logMessageUsageURLLegacy) {
    objc_msgSend(v4, "setLogMessageUsageURLLegacy:");
  }
  if ([(GEOActiveTileGroup *)self locationShiftEnabledRegionsCount])
  {
    [v4 clearLocationShiftEnabledRegions];
    unint64_t v69 = [(GEOActiveTileGroup *)self locationShiftEnabledRegionsCount];
    if (v69)
    {
      unint64_t v70 = v69;
      for (uint64_t i7 = 0; i7 != v70; ++i7)
      {
        uint64_t v72 = [(GEOActiveTileGroup *)self locationShiftEnabledRegionAtIndex:i7];
        [v4 addLocationShiftEnabledRegion:v72];
      }
    }
  }
  if (*(void *)&self->_flags)
  {
    *((_DWORD *)v4 + 156) = self->_locationShiftVersion;
    v4[79] = (id)((unint64_t)v4[79] | 1);
  }
  if ([(GEOActiveTileGroup *)self hybridUnavailableRegionsCount])
  {
    [v4 clearHybridUnavailableRegions];
    unint64_t v73 = [(GEOActiveTileGroup *)self hybridUnavailableRegionsCount];
    if (v73)
    {
      unint64_t v74 = v73;
      for (uint64_t i8 = 0; i8 != v74; ++i8)
      {
        [(GEOActiveTileGroup *)self hybridUnavailableRegionAtIndex:i8];
        [v4 addHybridUnavailableRegion:v116];
      }
    }
  }
  if (self->_reserved) {
    objc_msgSend(v4, "setReserved:");
  }
  if (self->_spatialLookupURLLegacy) {
    objc_msgSend(v4, "setSpatialLookupURLLegacy:");
  }
  if ([(GEOActiveTileGroup *)self activeResourcesCount])
  {
    [v4 clearActiveResources];
    unint64_t v76 = [(GEOActiveTileGroup *)self activeResourcesCount];
    if (v76)
    {
      unint64_t v77 = v76;
      for (uint64_t i9 = 0; i9 != v77; ++i9)
      {
        v79 = [(GEOActiveTileGroup *)self activeResourceAtIndex:i9];
        [v4 addActiveResource:v79];
      }
    }
  }
  if ([(GEOActiveTileGroup *)self regionalResourcesCount])
  {
    [v4 clearRegionalResources];
    unint64_t v80 = [(GEOActiveTileGroup *)self regionalResourcesCount];
    if (v80)
    {
      unint64_t v81 = v80;
      for (uint64_t i10 = 0; i10 != v81; ++i10)
      {
        v83 = [(GEOActiveTileGroup *)self regionalResourceAtIndex:i10];
        [v4 addRegionalResource:v83];
      }
    }
  }
  if ((*(void *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v4 + 157) = self->_modelVersion;
    v4[79] = (id)((unint64_t)v4[79] | 2);
  }
  if ([(GEOActiveTileGroup *)self activeScalesCount])
  {
    [v4 clearActiveScales];
    unint64_t v84 = [(GEOActiveTileGroup *)self activeScalesCount];
    if (v84)
    {
      unint64_t v85 = v84;
      for (uint64_t i11 = 0; i11 != v85; ++i11)
        objc_msgSend(v4, "addActiveScale:", -[GEOActiveTileGroup activeScaleAtIndex:](self, "activeScaleAtIndex:", i11));
    }
  }
  if ([(GEOActiveTileGroup *)self activeScenariosCount])
  {
    [v4 clearActiveScenarios];
    unint64_t v87 = [(GEOActiveTileGroup *)self activeScenariosCount];
    if (v87)
    {
      unint64_t v88 = v87;
      for (uint64_t i12 = 0; i12 != v88; ++i12)
        objc_msgSend(v4, "addActiveScenario:", -[GEOActiveTileGroup activeScenarioAtIndex:](self, "activeScenarioAtIndex:", i12));
    }
  }
  if ([(GEOActiveTileGroup *)self staleResourcesCount])
  {
    [v4 clearStaleResources];
    unint64_t v90 = [(GEOActiveTileGroup *)self staleResourcesCount];
    if (v90)
    {
      unint64_t v91 = v90;
      for (uint64_t i13 = 0; i13 != v91; ++i13)
      {
        v93 = [(GEOActiveTileGroup *)self staleResourceAtIndex:i13];
        [v4 addStaleResource:v93];
      }
    }
  }
  if (self->_dataSet) {
    objc_msgSend(v4, "setDataSet:");
  }
  if (self->_realtimeTrafficProbeURLLegacy) {
    objc_msgSend(v4, "setRealtimeTrafficProbeURLLegacy:");
  }
  if (self->_batchTrafficProbeURLLegacy) {
    objc_msgSend(v4, "setBatchTrafficProbeURLLegacy:");
  }
  if (self->_logMessageUsageV3URLLegacy) {
    objc_msgSend(v4, "setLogMessageUsageV3URLLegacy:");
  }
  if (self->_proactiveRoutingURLLegacy) {
    objc_msgSend(v4, "setProactiveRoutingURLLegacy:");
  }
  if (self->_backgroundDispatcherURLLegacy) {
    objc_msgSend(v4, "setBackgroundDispatcherURLLegacy:");
  }
  if (self->_bluePOIURLLegacy) {
    objc_msgSend(v4, "setBluePOIURLLegacy:");
  }
  if (self->_backgroundRevGeoURLLegacy) {
    objc_msgSend(v4, "setBackgroundRevGeoURLLegacy:");
  }
  if (self->_wifiConnectionQualityProbeURLLegacy) {
    objc_msgSend(v4, "setWifiConnectionQualityProbeURLLegacy:");
  }
  if (self->_muninBaseURL) {
    objc_msgSend(v4, "setMuninBaseURL:");
  }
  if (self->_flyoverRegionVersions) {
    objc_msgSend(v4, "setFlyoverRegionVersions:");
  }
  if (self->_urlInfoSet) {
    objc_msgSend(v4, "setUrlInfoSet:");
  }
  if ([(GEOActiveTileGroup *)self muninBucketsCount])
  {
    [v4 clearMuninBuckets];
    unint64_t v94 = [(GEOActiveTileGroup *)self muninBucketsCount];
    if (v94)
    {
      unint64_t v95 = v94;
      for (uint64_t i14 = 0; i14 != v95; ++i14)
      {
        uint64_t v97 = [(GEOActiveTileGroup *)self muninBucketAtIndex:i14];
        [v4 addMuninBucket:v97];
      }
    }
  }
  if (self->_environment) {
    objc_msgSend(v4, "setEnvironment:");
  }
  if ([(GEOActiveTileGroup *)self displayStringsCount])
  {
    [v4 clearDisplayStrings];
    unint64_t v98 = [(GEOActiveTileGroup *)self displayStringsCount];
    if (v98)
    {
      unint64_t v99 = v98;
      for (uint64_t i15 = 0; i15 != v99; ++i15)
      {
        v101 = [(GEOActiveTileGroup *)self displayStringsAtIndex:i15];
        [v4 addDisplayStrings:v101];
      }
    }
  }
  if ([(GEOActiveTileGroup *)self explicitResourcesCount])
  {
    [v4 clearExplicitResources];
    unint64_t v102 = [(GEOActiveTileGroup *)self explicitResourcesCount];
    if (v102)
    {
      unint64_t v103 = v102;
      for (uint64_t i16 = 0; i16 != v103; ++i16)
      {
        id v105 = [(GEOActiveTileGroup *)self explicitResourceAtIndex:i16];
        [v4 addExplicitResource:v105];
      }
    }
  }
  if (self->_offlineMetadata) {
    objc_msgSend(v4, "setOfflineMetadata:");
  }
  if ([(GEOActiveTileGroup *)self resourceCanonicalNameToFileNameCount])
  {
    [v4 clearResourceCanonicalNameToFileName];
    if (!v4[57])
    {
      id v106 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v107 = v4[57];
      v4[57] = v106;
    }
    resourceCanonicalNameToFileName = self->_resourceCanonicalNameToFileName;
    v114[0] = MEMORY[0x1E4F143A8];
    v114[1] = 3221225472;
    v114[2] = __29__GEOActiveTileGroup_copyTo___block_invoke;
    v114[3] = &unk_1E53DFD80;
    long long v115 = v4;
    [(NSMutableDictionary *)resourceCanonicalNameToFileName enumerateKeysAndObjectsUsingBlock:v114];
  }
  if ([(GEOActiveTileGroup *)self regionalResourceCanonicalNameToFileNameCount])
  {
    [v4 clearRegionalResourceCanonicalNameToFileName];
    if (!v4[50])
    {
      id v109 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v110 = v4[50];
      v4[50] = v109;
    }
    regionalResourceCanonicalNameToFileName = self->_regionalResourceCanonicalNameToFileName;
    v112[0] = MEMORY[0x1E4F143A8];
    v112[1] = 3221225472;
    v112[2] = __29__GEOActiveTileGroup_copyTo___block_invoke_2;
    v112[3] = &unk_1E53DFD80;
    v113 = v4;
    [(NSMutableDictionary *)regionalResourceCanonicalNameToFileName enumerateKeysAndObjectsUsingBlock:v112];
  }
}

void __29__GEOActiveTileGroup_copyTo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 copy];
  [*(id *)(*(void *)(a1 + 32) + 456) setObject:v6 forKey:v5];
}

void __29__GEOActiveTileGroup_copyTo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 copy];
  [*(id *)(*(void *)(a1 + 32) + 400) setObject:v6 forKey:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v332 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 8) & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOActiveTileGroupReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_177;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOActiveTileGroup *)self readAll:0];
  *(_DWORD *)(v5 + 620) = self->_identifier;
  long long v308 = 0u;
  long long v307 = 0u;
  long long v306 = 0u;
  long long v305 = 0u;
  unint64_t v9 = self->_tileSets;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v305 objects:v331 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v306;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v306 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v305 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addTileSet:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v305 objects:v331 count:16];
    }
    while (v10);
  }

  long long v304 = 0u;
  long long v303 = 0u;
  long long v302 = 0u;
  long long v301 = 0u;
  unint64_t v14 = self->_resources;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v301 objects:v330 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v302;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v302 != v16) {
          objc_enumerationMutation(v14);
        }
        unint64_t v18 = (void *)[*(id *)(*((void *)&v301 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addResource:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v301 objects:v330 count:16];
    }
    while (v15);
  }

  uint64_t v19 = [(NSString *)self->_uniqueIdentifier copyWithZone:a3];
  uint64_t v20 = *(void **)(v5 + 560);
  *(void *)(v5 + 560) = v19;

  long long v300 = 0u;
  long long v299 = 0u;
  long long v298 = 0u;
  long long v297 = 0u;
  unint64_t v21 = self->_attributions;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v297 objects:v329 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v298;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v298 != v23) {
          objc_enumerationMutation(v21);
        }
        unint64_t v25 = (void *)[*(id *)(*((void *)&v297 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addAttribution:v25];
      }
      uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v297 objects:v329 count:16];
    }
    while (v22);
  }

  long long v296 = 0u;
  long long v295 = 0u;
  long long v294 = 0u;
  long long v293 = 0u;
  unint64_t v26 = self->_regionalResourceTiles;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v293 objects:v328 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v294;
    do
    {
      for (uint64_t m = 0; m != v27; ++m)
      {
        if (*(void *)v294 != v28) {
          objc_enumerationMutation(v26);
        }
        unint64_t v30 = (void *)[*(id *)(*((void *)&v293 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addRegionalResourceTile:v30];
      }
      uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v293 objects:v328 count:16];
    }
    while (v27);
  }

  long long v292 = 0u;
  long long v291 = 0u;
  long long v290 = 0u;
  long long v289 = 0u;
  uint64_t v31 = self->_regionalResourceRegions;
  uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v289 objects:v327 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v290;
    do
    {
      for (uint64_t n = 0; n != v32; ++n)
      {
        if (*(void *)v290 != v33) {
          objc_enumerationMutation(v31);
        }
        uint64_t v35 = (void *)[*(id *)(*((void *)&v289 + 1) + 8 * n) copyWithZone:a3];
        [(id)v5 addRegionalResourceRegion:v35];
      }
      uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v289 objects:v327 count:16];
    }
    while (v32);
  }

  uint64_t v36 = [(NSString *)self->_regionalResourcesURLLegacy copyWithZone:a3];
  unint64_t v37 = *(void **)(v5 + 424);
  *(void *)(v5 + 424) = v36;

  uint64_t v38 = [(NSString *)self->_searchAttributionManifestURLLegacy copyWithZone:a3];
  uint64_t v39 = *(void **)(v5 + 488);
  *(void *)(v5 + 488) = v38;

  uint64_t v40 = [(NSString *)self->_directionsURLLegacy copyWithZone:a3];
  unint64_t v41 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v40;

  uint64_t v42 = [(NSString *)self->_etaURLLegacy copyWithZone:a3];
  uint64_t v43 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v42;

  uint64_t v44 = [(NSString *)self->_batchReverseGeocoderURLLegacy copyWithZone:a3];
  unint64_t v45 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v44;

  uint64_t v46 = [(NSString *)self->_releaseInfo copyWithZone:a3];
  uint64_t v47 = *(void **)(v5 + 440);
  *(void *)(v5 + 440) = v46;

  uint64_t v48 = [(NSString *)self->_resourcesURLLegacy copyWithZone:a3];
  unint64_t v49 = *(void **)(v5 + 464);
  *(void *)(v5 + 464) = v48;

  uint64_t v50 = [(NSString *)self->_simpleETAURLLegacy copyWithZone:a3];
  uint64_t v51 = *(void **)(v5 + 496);
  *(void *)(v5 + 496) = v50;

  uint64_t v52 = [(NSString *)self->_addressCorrectionInitURLLegacy copyWithZone:a3];
  unint64_t v53 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v52;

  uint64_t v54 = [(NSString *)self->_addressCorrectionUpdateURLLegacy copyWithZone:a3];
  uint64_t v55 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v54;

  uint64_t v56 = [(NSString *)self->_polyLocationShiftURLLegacy copyWithZone:a3];
  unint64_t v57 = *(void **)(v5 + 344);
  *(void *)(v5 + 344) = v56;

  uint64_t v58 = [(NSString *)self->_problemSubmissionURLLegacy copyWithZone:a3];
  uint64_t v59 = *(void **)(v5 + 384);
  *(void *)(v5 + 384) = v58;

  uint64_t v60 = [(NSString *)self->_problemStatusURLLegacy copyWithZone:a3];
  unint64_t v61 = *(void **)(v5 + 376);
  *(void *)(v5 + 376) = v60;

  uint64_t v62 = [(NSString *)self->_reverseGeocoderVersionsURLLegacy copyWithZone:a3];
  uint64_t v63 = *(void **)(v5 + 480);
  *(void *)(v5 + 480) = v62;

  uint64_t v64 = [(NSString *)self->_problemCategoriesURLLegacy copyWithZone:a3];
  unint64_t v65 = *(void **)(v5 + 360);
  *(void *)(v5 + 360) = v64;

  uint64_t v66 = [(NSString *)self->_announcementsURLLegacy copyWithZone:a3];
  uint64_t v67 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v66;

  long long v288 = 0u;
  long long v287 = 0u;
  long long v286 = 0u;
  long long v285 = 0u;
  uint64_t v68 = self->_announcementsSupportedLanguages;
  uint64_t v69 = [(NSMutableArray *)v68 countByEnumeratingWithState:&v285 objects:v326 count:16];
  if (v69)
  {
    uint64_t v70 = *(void *)v286;
    do
    {
      for (iuint64_t i = 0; ii != v69; ++ii)
      {
        if (*(void *)v286 != v70) {
          objc_enumerationMutation(v68);
        }
        uint64_t v72 = (void *)[*(id *)(*((void *)&v285 + 1) + 8 * ii) copyWithZone:a3];
        [(id)v5 addAnnouncementsSupportedLanguages:v72];
      }
      uint64_t v69 = [(NSMutableArray *)v68 countByEnumeratingWithState:&v285 objects:v326 count:16];
    }
    while (v69);
  }

  uint64_t v73 = [(NSString *)self->_dispatcherURLLegacy copyWithZone:a3];
  unint64_t v74 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v73;

  uint64_t v75 = [(NSString *)self->_problemOptInURLLegacy copyWithZone:a3];
  unint64_t v76 = *(void **)(v5 + 368);
  *(void *)(v5 + 368) = v75;

  id v77 = [(GEOVersionManifest *)self->_versionManifest copyWithZone:a3];
  uint64_t v78 = *(void **)(v5 + 576);
  *(void *)(v5 + 576) = v77;

  long long v284 = 0u;
  long long v283 = 0u;
  long long v282 = 0u;
  long long v281 = 0u;
  v79 = self->_styleSheets;
  uint64_t v80 = [(NSMutableArray *)v79 countByEnumeratingWithState:&v281 objects:v325 count:16];
  if (v80)
  {
    uint64_t v81 = *(void *)v282;
    do
    {
      for (juint64_t j = 0; jj != v80; ++jj)
      {
        if (*(void *)v282 != v81) {
          objc_enumerationMutation(v79);
        }
        v83 = (void *)[*(id *)(*((void *)&v281 + 1) + 8 * jj) copyWithZone:a3];
        [(id)v5 addStyleSheet:v83];
      }
      uint64_t v80 = [(NSMutableArray *)v79 countByEnumeratingWithState:&v281 objects:v325 count:16];
    }
    while (v80);
  }

  long long v280 = 0u;
  long long v279 = 0u;
  long long v278 = 0u;
  long long v277 = 0u;
  unint64_t v84 = self->_styleSheetChecksums;
  uint64_t v85 = [(NSMutableArray *)v84 countByEnumeratingWithState:&v277 objects:v324 count:16];
  if (v85)
  {
    uint64_t v86 = *(void *)v278;
    do
    {
      for (kuint64_t k = 0; kk != v85; ++kk)
      {
        if (*(void *)v278 != v86) {
          objc_enumerationMutation(v84);
        }
        unint64_t v88 = (void *)[*(id *)(*((void *)&v277 + 1) + 8 * kk) copyWithZone:a3];
        [(id)v5 addStyleSheetChecksum:v88];
      }
      uint64_t v85 = [(NSMutableArray *)v84 countByEnumeratingWithState:&v277 objects:v324 count:16];
    }
    while (v85);
  }

  long long v276 = 0u;
  long long v274 = 0u;
  long long v275 = 0u;
  long long v273 = 0u;
  v89 = self->_textures;
  uint64_t v90 = [(NSMutableArray *)v89 countByEnumeratingWithState:&v273 objects:v323 count:16];
  if (v90)
  {
    uint64_t v91 = *(void *)v274;
    do
    {
      for (muint64_t m = 0; mm != v90; ++mm)
      {
        if (*(void *)v274 != v91) {
          objc_enumerationMutation(v89);
        }
        v93 = (void *)[*(id *)(*((void *)&v273 + 1) + 8 * mm) copyWithZone:a3];
        [(id)v5 addTexture:v93];
      }
      uint64_t v90 = [(NSMutableArray *)v89 countByEnumeratingWithState:&v273 objects:v323 count:16];
    }
    while (v90);
  }

  long long v271 = 0u;
  long long v272 = 0u;
  long long v269 = 0u;
  long long v270 = 0u;
  unint64_t v94 = self->_textureChecksums;
  uint64_t v95 = [(NSMutableArray *)v94 countByEnumeratingWithState:&v269 objects:v322 count:16];
  if (v95)
  {
    uint64_t v96 = *(void *)v270;
    do
    {
      for (nuint64_t n = 0; nn != v95; ++nn)
      {
        if (*(void *)v270 != v96) {
          objc_enumerationMutation(v94);
        }
        unint64_t v98 = (void *)[*(id *)(*((void *)&v269 + 1) + 8 * nn) copyWithZone:a3];
        [(id)v5 addTextureChecksum:v98];
      }
      uint64_t v95 = [(NSMutableArray *)v94 countByEnumeratingWithState:&v269 objects:v322 count:16];
    }
    while (v95);
  }

  long long v267 = 0u;
  long long v268 = 0u;
  long long v265 = 0u;
  long long v266 = 0u;
  unint64_t v99 = self->_fonts;
  uint64_t v100 = [(NSMutableArray *)v99 countByEnumeratingWithState:&v265 objects:v321 count:16];
  if (v100)
  {
    uint64_t v101 = *(void *)v266;
    do
    {
      for (uint64_t i1 = 0; i1 != v100; ++i1)
      {
        if (*(void *)v266 != v101) {
          objc_enumerationMutation(v99);
        }
        unint64_t v103 = (void *)[*(id *)(*((void *)&v265 + 1) + 8 * i1) copyWithZone:a3];
        [(id)v5 addFont:v103];
      }
      uint64_t v100 = [(NSMutableArray *)v99 countByEnumeratingWithState:&v265 objects:v321 count:16];
    }
    while (v100);
  }

  long long v263 = 0u;
  long long v264 = 0u;
  long long v261 = 0u;
  long long v262 = 0u;
  v104 = self->_fontChecksums;
  uint64_t v105 = [(NSMutableArray *)v104 countByEnumeratingWithState:&v261 objects:v320 count:16];
  if (v105)
  {
    uint64_t v106 = *(void *)v262;
    do
    {
      for (uint64_t i2 = 0; i2 != v105; ++i2)
      {
        if (*(void *)v262 != v106) {
          objc_enumerationMutation(v104);
        }
        uint64_t v108 = (void *)[*(id *)(*((void *)&v261 + 1) + 8 * i2) copyWithZone:a3];
        [(id)v5 addFontChecksum:v108];
      }
      uint64_t v105 = [(NSMutableArray *)v104 countByEnumeratingWithState:&v261 objects:v320 count:16];
    }
    while (v105);
  }

  long long v259 = 0u;
  long long v260 = 0u;
  long long v257 = 0u;
  long long v258 = 0u;
  id v109 = self->_icons;
  uint64_t v110 = [(NSMutableArray *)v109 countByEnumeratingWithState:&v257 objects:v319 count:16];
  if (v110)
  {
    uint64_t v111 = *(void *)v258;
    do
    {
      for (uint64_t i3 = 0; i3 != v110; ++i3)
      {
        if (*(void *)v258 != v111) {
          objc_enumerationMutation(v109);
        }
        v113 = (void *)[*(id *)(*((void *)&v257 + 1) + 8 * i3) copyWithZone:a3];
        [(id)v5 addIcon:v113];
      }
      uint64_t v110 = [(NSMutableArray *)v109 countByEnumeratingWithState:&v257 objects:v319 count:16];
    }
    while (v110);
  }

  long long v255 = 0u;
  long long v256 = 0u;
  long long v253 = 0u;
  long long v254 = 0u;
  id v114 = self->_iconChecksums;
  uint64_t v115 = [(NSMutableArray *)v114 countByEnumeratingWithState:&v253 objects:v318 count:16];
  if (v115)
  {
    uint64_t v116 = *(void *)v254;
    do
    {
      for (uint64_t i4 = 0; i4 != v115; ++i4)
      {
        if (*(void *)v254 != v116) {
          objc_enumerationMutation(v114);
        }
        long long v118 = (void *)[*(id *)(*((void *)&v253 + 1) + 8 * i4) copyWithZone:a3];
        [(id)v5 addIconChecksum:v118];
      }
      uint64_t v115 = [(NSMutableArray *)v114 countByEnumeratingWithState:&v253 objects:v318 count:16];
    }
    while (v115);
  }

  long long v251 = 0u;
  long long v252 = 0u;
  long long v249 = 0u;
  long long v250 = 0u;
  long long v119 = self->_xmls;
  uint64_t v120 = [(NSMutableArray *)v119 countByEnumeratingWithState:&v249 objects:v317 count:16];
  if (v120)
  {
    uint64_t v121 = *(void *)v250;
    do
    {
      for (uint64_t i5 = 0; i5 != v120; ++i5)
      {
        if (*(void *)v250 != v121) {
          objc_enumerationMutation(v119);
        }
        long long v123 = (void *)[*(id *)(*((void *)&v249 + 1) + 8 * i5) copyWithZone:a3];
        [(id)v5 addXml:v123];
      }
      uint64_t v120 = [(NSMutableArray *)v119 countByEnumeratingWithState:&v249 objects:v317 count:16];
    }
    while (v120);
  }

  long long v247 = 0u;
  long long v248 = 0u;
  long long v245 = 0u;
  long long v246 = 0u;
  long long v124 = self->_xmlChecksums;
  uint64_t v125 = [(NSMutableArray *)v124 countByEnumeratingWithState:&v245 objects:v316 count:16];
  if (v125)
  {
    uint64_t v126 = *(void *)v246;
    do
    {
      for (uint64_t i6 = 0; i6 != v125; ++i6)
      {
        if (*(void *)v246 != v126) {
          objc_enumerationMutation(v124);
        }
        long long v128 = (void *)[*(id *)(*((void *)&v245 + 1) + 8 * i6) copyWithZone:a3];
        [(id)v5 addXmlChecksum:v128];
      }
      uint64_t v125 = [(NSMutableArray *)v124 countByEnumeratingWithState:&v245 objects:v316 count:16];
    }
    while (v125);
  }

  uint64_t v129 = [(NSString *)self->_abExperimentURLLegacy copyWithZone:a3];
  long long v130 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v129;

  uint64_t v131 = [(NSString *)self->_businessPortalBaseURLLegacy copyWithZone:a3];
  long long v132 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v131;

  uint64_t v133 = [(NSString *)self->_logMessageUsageURLLegacy copyWithZone:a3];
  long long v134 = *(void **)(v5 + 304);
  *(void *)(v5 + 304) = v133;

  long long v243 = 0u;
  long long v244 = 0u;
  long long v241 = 0u;
  long long v242 = 0u;
  long long v135 = self->_locationShiftEnabledRegions;
  uint64_t v136 = [(NSMutableArray *)v135 countByEnumeratingWithState:&v241 objects:v315 count:16];
  if (v136)
  {
    uint64_t v137 = *(void *)v242;
    do
    {
      for (uint64_t i7 = 0; i7 != v136; ++i7)
      {
        if (*(void *)v242 != v137) {
          objc_enumerationMutation(v135);
        }
        uint64_t v139 = (void *)[*(id *)(*((void *)&v241 + 1) + 8 * i7) copyWithZone:a3];
        [(id)v5 addLocationShiftEnabledRegion:v139];
      }
      uint64_t v136 = [(NSMutableArray *)v135 countByEnumeratingWithState:&v241 objects:v315 count:16];
    }
    while (v136);
  }

  if (*(void *)&self->_flags)
  {
    *(_DWORD *)(v5 + 624) = self->_locationShiftVersion;
    *(void *)(v5 + 632) |= 1uLL;
  }
  unint64_t hybridUnavailableRegionsCount = self->_hybridUnavailableRegionsCount;
  if (hybridUnavailableRegionsCount)
  {
    -[GEOActiveTileGroup _reserveHybridUnavailableRegions:](v5, hybridUnavailableRegionsCount);
    memcpy(*(void **)(v5 + 72), self->_hybridUnavailableRegions, 24 * self->_hybridUnavailableRegionsCount);
    *(void *)(v5 + 80) = self->_hybridUnavailableRegionsCount;
  }
  uint64_t v141 = [(NSData *)self->_reserved copyWithZone:a3];
  long long v142 = *(void **)(v5 + 448);
  *(void *)(v5 + 448) = v141;

  uint64_t v143 = [(NSString *)self->_spatialLookupURLLegacy copyWithZone:a3];
  long long v144 = *(void **)(v5 + 504);
  *(void *)(v5 + 504) = v143;

  long long v239 = 0u;
  long long v240 = 0u;
  long long v237 = 0u;
  long long v238 = 0u;
  long long v145 = self->_activeResources;
  uint64_t v146 = [(NSMutableArray *)v145 countByEnumeratingWithState:&v237 objects:v314 count:16];
  if (v146)
  {
    uint64_t v147 = *(void *)v238;
    do
    {
      for (uint64_t i8 = 0; i8 != v146; ++i8)
      {
        if (*(void *)v238 != v147) {
          objc_enumerationMutation(v145);
        }
        long long v149 = (void *)[*(id *)(*((void *)&v237 + 1) + 8 * i8) copyWithZone:a3];
        [(id)v5 addActiveResource:v149];
      }
      uint64_t v146 = [(NSMutableArray *)v145 countByEnumeratingWithState:&v237 objects:v314 count:16];
    }
    while (v146);
  }

  long long v235 = 0u;
  long long v236 = 0u;
  long long v233 = 0u;
  long long v234 = 0u;
  long long v150 = self->_regionalResources;
  uint64_t v151 = [(NSMutableArray *)v150 countByEnumeratingWithState:&v233 objects:v313 count:16];
  if (v151)
  {
    uint64_t v152 = *(void *)v234;
    do
    {
      for (uint64_t i9 = 0; i9 != v151; ++i9)
      {
        if (*(void *)v234 != v152) {
          objc_enumerationMutation(v150);
        }
        long long v154 = (void *)[*(id *)(*((void *)&v233 + 1) + 8 * i9) copyWithZone:a3];
        [(id)v5 addRegionalResource:v154];
      }
      uint64_t v151 = [(NSMutableArray *)v150 countByEnumeratingWithState:&v233 objects:v313 count:16];
    }
    while (v151);
  }

  if ((*(void *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 628) = self->_modelVersion;
    *(void *)(v5 + 632) |= 2uLL;
  }
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  long long v231 = 0u;
  long long v232 = 0u;
  long long v229 = 0u;
  long long v230 = 0u;
  long long v155 = self->_staleResources;
  uint64_t v156 = [(NSMutableArray *)v155 countByEnumeratingWithState:&v229 objects:v312 count:16];
  if (v156)
  {
    uint64_t v157 = *(void *)v230;
    do
    {
      for (uint64_t i10 = 0; i10 != v156; ++i10)
      {
        if (*(void *)v230 != v157) {
          objc_enumerationMutation(v155);
        }
        long long v159 = (void *)[*(id *)(*((void *)&v229 + 1) + 8 * i10) copyWithZone:a3];
        [(id)v5 addStaleResource:v159];
      }
      uint64_t v156 = [(NSMutableArray *)v155 countByEnumeratingWithState:&v229 objects:v312 count:16];
    }
    while (v156);
  }

  id v160 = [(GEODataSetDescription *)self->_dataSet copyWithZone:a3];
  long long v161 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v160;

  uint64_t v162 = [(NSString *)self->_realtimeTrafficProbeURLLegacy copyWithZone:a3];
  long long v163 = *(void **)(v5 + 392);
  *(void *)(v5 + 392) = v162;

  uint64_t v164 = [(NSString *)self->_batchTrafficProbeURLLegacy copyWithZone:a3];
  long long v165 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v164;

  uint64_t v166 = [(NSString *)self->_logMessageUsageV3URLLegacy copyWithZone:a3];
  long long v167 = *(void **)(v5 + 312);
  *(void *)(v5 + 312) = v166;

  uint64_t v168 = [(NSString *)self->_proactiveRoutingURLLegacy copyWithZone:a3];
  long long v169 = *(void **)(v5 + 352);
  *(void *)(v5 + 352) = v168;

  uint64_t v170 = [(NSString *)self->_backgroundDispatcherURLLegacy copyWithZone:a3];
  long long v171 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v170;

  uint64_t v172 = [(NSString *)self->_bluePOIURLLegacy copyWithZone:a3];
  long long v173 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v172;

  uint64_t v174 = [(NSString *)self->_backgroundRevGeoURLLegacy copyWithZone:a3];
  long long v175 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v174;

  uint64_t v176 = [(NSString *)self->_wifiConnectionQualityProbeURLLegacy copyWithZone:a3];
  long long v177 = *(void **)(v5 + 584);
  *(void *)(v5 + 584) = v176;

  uint64_t v178 = [(NSString *)self->_muninBaseURL copyWithZone:a3];
  long long v179 = *(void **)(v5 + 320);
  *(void *)(v5 + 320) = v178;

  uint64_t v180 = [(NSData *)self->_flyoverRegionVersions copyWithZone:a3];
  long long v181 = *(void **)(v5 + 256);
  *(void *)(v5 + 256) = v180;

  id v182 = [(GEOURLInfoSet *)self->_urlInfoSet copyWithZone:a3];
  long long v183 = *(void **)(v5 + 568);
  *(void *)(v5 + 568) = v182;

  long long v227 = 0u;
  long long v228 = 0u;
  long long v225 = 0u;
  long long v226 = 0u;
  long long v184 = self->_muninBuckets;
  uint64_t v185 = [(NSMutableArray *)v184 countByEnumeratingWithState:&v225 objects:v311 count:16];
  if (v185)
  {
    uint64_t v186 = *(void *)v226;
    do
    {
      for (uint64_t i11 = 0; i11 != v185; ++i11)
      {
        if (*(void *)v226 != v186) {
          objc_enumerationMutation(v184);
        }
        long long v188 = (void *)[*(id *)(*((void *)&v225 + 1) + 8 * i11) copyWithZone:a3];
        [(id)v5 addMuninBucket:v188];
      }
      uint64_t v185 = [(NSMutableArray *)v184 countByEnumeratingWithState:&v225 objects:v311 count:16];
    }
    while (v185);
  }

  uint64_t v189 = [(NSString *)self->_environment copyWithZone:a3];
  long long v190 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = v189;

  long long v223 = 0u;
  long long v224 = 0u;
  long long v221 = 0u;
  long long v222 = 0u;
  long long v191 = self->_displayStrings;
  uint64_t v192 = [(NSMutableArray *)v191 countByEnumeratingWithState:&v221 objects:v310 count:16];
  if (v192)
  {
    uint64_t v193 = *(void *)v222;
    do
    {
      for (uint64_t i12 = 0; i12 != v192; ++i12)
      {
        if (*(void *)v222 != v193) {
          objc_enumerationMutation(v191);
        }
        long long v195 = (void *)[*(id *)(*((void *)&v221 + 1) + 8 * i12) copyWithZone:a3];
        [(id)v5 addDisplayStrings:v195];
      }
      uint64_t v192 = [(NSMutableArray *)v191 countByEnumeratingWithState:&v221 objects:v310 count:16];
    }
    while (v192);
  }

  long long v219 = 0u;
  long long v220 = 0u;
  long long v217 = 0u;
  long long v218 = 0u;
  long long v196 = self->_explicitResources;
  uint64_t v197 = [(NSMutableArray *)v196 countByEnumeratingWithState:&v217 objects:v309 count:16];
  if (v197)
  {
    uint64_t v198 = *(void *)v218;
    do
    {
      for (uint64_t i13 = 0; i13 != v197; ++i13)
      {
        if (*(void *)v218 != v198) {
          objc_enumerationMutation(v196);
        }
        long long v200 = (void *)[*(id *)(*((void *)&v217 + 1) + 8 * i13) copyWithZone:a3];
        [(id)v5 addExplicitResource:v200];
      }
      uint64_t v197 = [(NSMutableArray *)v196 countByEnumeratingWithState:&v217 objects:v309 count:16];
    }
    while (v197);
  }

  id v201 = [(GEOOfflineMetadata *)self->_offlineMetadata copyWithZone:a3];
  long long v202 = *(void **)(v5 + 336);
  *(void *)(v5 + 336) = v201;

  if ([(NSMutableDictionary *)self->_resourceCanonicalNameToFileName count])
  {
    [(id)v5 clearResourceCanonicalNameToFileName];
    id v203 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v204 = *(void **)(v5 + 456);
    *(void *)(v5 + 456) = v203;

    resourceCanonicalNameToFileName = self->_resourceCanonicalNameToFileName;
    v214[0] = MEMORY[0x1E4F143A8];
    v214[1] = 3221225472;
    v214[2] = __35__GEOActiveTileGroup_copyWithZone___block_invoke;
    v214[3] = &unk_1E53DFDA8;
    v216 = a3;
    id v215 = (id)v5;
    [(NSMutableDictionary *)resourceCanonicalNameToFileName enumerateKeysAndObjectsUsingBlock:v214];
  }
  if ([(NSMutableDictionary *)self->_regionalResourceCanonicalNameToFileName count])
  {
    [(id)v5 clearRegionalResourceCanonicalNameToFileName];
    id v206 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v207 = *(void **)(v5 + 400);
    *(void *)(v5 + 400) = v206;

    regionalResourceCanonicalNameToFileName = self->_regionalResourceCanonicalNameToFileName;
    v211[0] = MEMORY[0x1E4F143A8];
    v211[1] = 3221225472;
    v211[2] = __35__GEOActiveTileGroup_copyWithZone___block_invoke_2;
    v211[3] = &unk_1E53DFDA8;
    uint64_t v213 = a3;
    id v212 = (id)v5;
    [(NSMutableDictionary *)regionalResourceCanonicalNameToFileName enumerateKeysAndObjectsUsingBlock:v211];
  }
  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  id v209 = (id)v5;
LABEL_177:

  return (id)v5;
}

void __35__GEOActiveTileGroup_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = (id)[a3 copyWithZone:v5];
  [*(id *)(*(void *)(a1 + 32) + 456) setObject:v7 forKey:v6];
}

void __35__GEOActiveTileGroup_copyWithZone___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = (id)[a3 copyWithZone:v5];
  [*(id *)(*(void *)(a1 + 32) + 400) setObject:v7 forKey:v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (const void **)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_90;
  }
  [(GEOActiveTileGroup *)self readAll:1];
  [v4 readAll:1];
  if (self->_identifier != *((_DWORD *)v4 + 155)) {
    goto LABEL_90;
  }
  tileSets = self->_tileSets;
  if ((unint64_t)tileSets | (unint64_t)v4[69])
  {
    if (!-[NSMutableArray isEqual:](tileSets, "isEqual:")) {
      goto LABEL_90;
    }
  }
  resources = self->_resources;
  if ((unint64_t)resources | (unint64_t)v4[59])
  {
    if (!-[NSMutableArray isEqual:](resources, "isEqual:")) {
      goto LABEL_90;
    }
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if ((unint64_t)uniqueIdentifier | (unint64_t)v4[70])
  {
    if (!-[NSString isEqual:](uniqueIdentifier, "isEqual:")) {
      goto LABEL_90;
    }
  }
  attributions = self->_attributions;
  if ((unint64_t)attributions | (unint64_t)v4[18])
  {
    if (!-[NSMutableArray isEqual:](attributions, "isEqual:")) {
      goto LABEL_90;
    }
  }
  regionalResourceTiles = self->_regionalResourceTiles;
  if ((unint64_t)regionalResourceTiles | (unint64_t)v4[52])
  {
    if (!-[NSMutableArray isEqual:](regionalResourceTiles, "isEqual:")) {
      goto LABEL_90;
    }
  }
  regionalResourceRegions = self->_regionalResourceRegions;
  if ((unint64_t)regionalResourceRegions | (unint64_t)v4[51])
  {
    if (!-[NSMutableArray isEqual:](regionalResourceRegions, "isEqual:")) {
      goto LABEL_90;
    }
  }
  regionalResourcesURLLegacy = self->_regionalResourcesURLLegacy;
  if ((unint64_t)regionalResourcesURLLegacy | (unint64_t)v4[53])
  {
    if (!-[NSString isEqual:](regionalResourcesURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  searchAttributionManifestURLLegacy = self->_searchAttributionManifestURLLegacy;
  if ((unint64_t)searchAttributionManifestURLLegacy | (unint64_t)v4[61])
  {
    if (!-[NSString isEqual:](searchAttributionManifestURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  directionsURLLegacy = self->_directionsURLLegacy;
  if ((unint64_t)directionsURLLegacy | (unint64_t)v4[26])
  {
    if (!-[NSString isEqual:](directionsURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  etaURLLegacy = self->_etaURLLegacy;
  if ((unint64_t)etaURLLegacy | (unint64_t)v4[30])
  {
    if (!-[NSString isEqual:](etaURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  batchReverseGeocoderURLLegacy = self->_batchReverseGeocoderURLLegacy;
  if ((unint64_t)batchReverseGeocoderURLLegacy | (unint64_t)v4[21])
  {
    if (!-[NSString isEqual:](batchReverseGeocoderURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  releaseInfo = self->_releaseInfo;
  if ((unint64_t)releaseInfo | (unint64_t)v4[55])
  {
    if (!-[NSString isEqual:](releaseInfo, "isEqual:")) {
      goto LABEL_90;
    }
  }
  resourcesURLLegacy = self->_resourcesURLLegacy;
  if ((unint64_t)resourcesURLLegacy | (unint64_t)v4[58])
  {
    if (!-[NSString isEqual:](resourcesURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  simpleETAURLLegacy = self->_simpleETAURLLegacy;
  if ((unint64_t)simpleETAURLLegacy | (unint64_t)v4[62])
  {
    if (!-[NSString isEqual:](simpleETAURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  addressCorrectionInitURLLegacy = self->_addressCorrectionInitURLLegacy;
  if ((unint64_t)addressCorrectionInitURLLegacy | (unint64_t)v4[14])
  {
    if (!-[NSString isEqual:](addressCorrectionInitURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  addressCorrectionUpdateURLLegacy = self->_addressCorrectionUpdateURLLegacy;
  if ((unint64_t)addressCorrectionUpdateURLLegacy | (unint64_t)v4[15])
  {
    if (!-[NSString isEqual:](addressCorrectionUpdateURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  polyLocationShiftURLLegacy = self->_polyLocationShiftURLLegacy;
  if ((unint64_t)polyLocationShiftURLLegacy | (unint64_t)v4[43])
  {
    if (!-[NSString isEqual:](polyLocationShiftURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  problemSubmissionURLLegacy = self->_problemSubmissionURLLegacy;
  if ((unint64_t)problemSubmissionURLLegacy | (unint64_t)v4[48])
  {
    if (!-[NSString isEqual:](problemSubmissionURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  problemStatusURLLegacy = self->_problemStatusURLLegacy;
  if ((unint64_t)problemStatusURLLegacy | (unint64_t)v4[47])
  {
    if (!-[NSString isEqual:](problemStatusURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  reverseGeocoderVersionsURLLegacy = self->_reverseGeocoderVersionsURLLegacy;
  if ((unint64_t)reverseGeocoderVersionsURLLegacy | (unint64_t)v4[60])
  {
    if (!-[NSString isEqual:](reverseGeocoderVersionsURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  problemCategoriesURLLegacy = self->_problemCategoriesURLLegacy;
  if ((unint64_t)problemCategoriesURLLegacy | (unint64_t)v4[45])
  {
    if (!-[NSString isEqual:](problemCategoriesURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  announcementsURLLegacy = self->_announcementsURLLegacy;
  if ((unint64_t)announcementsURLLegacy | (unint64_t)v4[17])
  {
    if (!-[NSString isEqual:](announcementsURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  announcementsSupportedLanguages = self->_announcementsSupportedLanguages;
  if ((unint64_t)announcementsSupportedLanguages | (unint64_t)v4[16])
  {
    if (!-[NSMutableArray isEqual:](announcementsSupportedLanguages, "isEqual:")) {
      goto LABEL_90;
    }
  }
  dispatcherURLLegacy = self->_dispatcherURLLegacy;
  if ((unint64_t)dispatcherURLLegacy | (unint64_t)v4[27])
  {
    if (!-[NSString isEqual:](dispatcherURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  problemOptInURLLegacy = self->_problemOptInURLLegacy;
  if ((unint64_t)problemOptInURLLegacy | (unint64_t)v4[46])
  {
    if (!-[NSString isEqual:](problemOptInURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  versionManifest = self->_versionManifest;
  if ((unint64_t)versionManifest | (unint64_t)v4[72])
  {
    if (!-[GEOVersionManifest isEqual:](versionManifest, "isEqual:")) {
      goto LABEL_90;
    }
  }
  styleSheets = self->_styleSheets;
  if ((unint64_t)styleSheets | (unint64_t)v4[66])
  {
    if (!-[NSMutableArray isEqual:](styleSheets, "isEqual:")) {
      goto LABEL_90;
    }
  }
  styleSheetChecksums = self->_styleSheetChecksums;
  if ((unint64_t)styleSheetChecksums | (unint64_t)v4[65])
  {
    if (!-[NSMutableArray isEqual:](styleSheetChecksums, "isEqual:")) {
      goto LABEL_90;
    }
  }
  textures = self->_textures;
  if ((unint64_t)textures | (unint64_t)v4[68])
  {
    if (!-[NSMutableArray isEqual:](textures, "isEqual:")) {
      goto LABEL_90;
    }
  }
  textureChecksums = self->_textureChecksums;
  if ((unint64_t)textureChecksums | (unint64_t)v4[67])
  {
    if (!-[NSMutableArray isEqual:](textureChecksums, "isEqual:")) {
      goto LABEL_90;
    }
  }
  fonts = self->_fonts;
  if ((unint64_t)fonts | (unint64_t)v4[34])
  {
    if (!-[NSMutableArray isEqual:](fonts, "isEqual:")) {
      goto LABEL_90;
    }
  }
  fontChecksums = self->_fontChecksums;
  if ((unint64_t)fontChecksums | (unint64_t)v4[33])
  {
    if (!-[NSMutableArray isEqual:](fontChecksums, "isEqual:")) {
      goto LABEL_90;
    }
  }
  icons = self->_icons;
  if ((unint64_t)icons | (unint64_t)v4[36])
  {
    if (!-[NSMutableArray isEqual:](icons, "isEqual:")) {
      goto LABEL_90;
    }
  }
  iconChecksums = self->_iconChecksums;
  if ((unint64_t)iconChecksums | (unint64_t)v4[35])
  {
    if (!-[NSMutableArray isEqual:](iconChecksums, "isEqual:")) {
      goto LABEL_90;
    }
  }
  xmls = self->_xmls;
  if ((unint64_t)xmls | (unint64_t)v4[75])
  {
    if (!-[NSMutableArray isEqual:](xmls, "isEqual:")) {
      goto LABEL_90;
    }
  }
  xmlChecksums = self->_xmlChecksums;
  if ((unint64_t)xmlChecksums | (unint64_t)v4[74])
  {
    if (!-[NSMutableArray isEqual:](xmlChecksums, "isEqual:")) {
      goto LABEL_90;
    }
  }
  abExperimentURLLegacy = self->_abExperimentURLLegacy;
  if ((unint64_t)abExperimentURLLegacy | (unint64_t)v4[12])
  {
    if (!-[NSString isEqual:](abExperimentURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  businessPortalBaseURLLegacy = self->_businessPortalBaseURLLegacy;
  if ((unint64_t)businessPortalBaseURLLegacy | (unint64_t)v4[24])
  {
    if (!-[NSString isEqual:](businessPortalBaseURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  logMessageUsageURLLegacy = self->_logMessageUsageURLLegacy;
  if ((unint64_t)logMessageUsageURLLegacy | (unint64_t)v4[38])
  {
    if (!-[NSString isEqual:](logMessageUsageURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  locationShiftEnabledRegions = self->_locationShiftEnabledRegions;
  if ((unint64_t)locationShiftEnabledRegions | (unint64_t)v4[37])
  {
    if (!-[NSMutableArray isEqual:](locationShiftEnabledRegions, "isEqual:")) {
      goto LABEL_90;
    }
  }
  unint64_t v45 = v4[79];
  if (*(void *)&self->_flags)
  {
    if ((v45 & 1) == 0 || self->_locationShiftVersion != *((_DWORD *)v4 + 156)) {
      goto LABEL_90;
    }
  }
  else if (v45)
  {
    goto LABEL_90;
  }
  unint64_t hybridUnavailableRegionsCount = self->_hybridUnavailableRegionsCount;
  if ((const void *)hybridUnavailableRegionsCount != v4[10]) {
    goto LABEL_90;
  }
  if (memcmp(self->_hybridUnavailableRegions, v4[9], 24 * hybridUnavailableRegionsCount)) {
    goto LABEL_90;
  }
  reserved = self->_reserved;
  if ((unint64_t)reserved | (unint64_t)v4[56])
  {
    if (!-[NSData isEqual:](reserved, "isEqual:")) {
      goto LABEL_90;
    }
  }
  spatialLookupURLLegacy = self->_spatialLookupURLLegacy;
  if ((unint64_t)spatialLookupURLLegacy | (unint64_t)v4[63])
  {
    if (!-[NSString isEqual:](spatialLookupURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  activeResources = self->_activeResources;
  if ((unint64_t)activeResources | (unint64_t)v4[13])
  {
    if (!-[NSMutableArray isEqual:](activeResources, "isEqual:")) {
      goto LABEL_90;
    }
  }
  regionalResources = self->_regionalResources;
  if ((unint64_t)regionalResources | (unint64_t)v4[54])
  {
    if (!-[NSMutableArray isEqual:](regionalResources, "isEqual:")) {
      goto LABEL_90;
    }
  }
  unint64_t v53 = v4[79];
  if ((*(void *)&self->_flags & 2) != 0)
  {
    if ((v53 & 2) == 0 || self->_modelVersion != *((_DWORD *)v4 + 157)) {
      goto LABEL_90;
    }
  }
  else if ((v53 & 2) != 0)
  {
LABEL_90:
    char v47 = 0;
    goto LABEL_91;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_90;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_90;
  }
  staleResources = self->_staleResources;
  if ((unint64_t)staleResources | (unint64_t)v4[64])
  {
    if (!-[NSMutableArray isEqual:](staleResources, "isEqual:")) {
      goto LABEL_90;
    }
  }
  dataSet = self->_dataSet;
  if ((unint64_t)dataSet | (unint64_t)v4[25])
  {
    if (!-[GEODataSetDescription isEqual:](dataSet, "isEqual:")) {
      goto LABEL_90;
    }
  }
  realtimeTrafficProbeURLLegacy = self->_realtimeTrafficProbeURLLegacy;
  if ((unint64_t)realtimeTrafficProbeURLLegacy | (unint64_t)v4[49])
  {
    if (!-[NSString isEqual:](realtimeTrafficProbeURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  batchTrafficProbeURLLegacy = self->_batchTrafficProbeURLLegacy;
  if ((unint64_t)batchTrafficProbeURLLegacy | (unint64_t)v4[22])
  {
    if (!-[NSString isEqual:](batchTrafficProbeURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  logMessageUsageV3URLLegacy = self->_logMessageUsageV3URLLegacy;
  if ((unint64_t)logMessageUsageV3URLLegacy | (unint64_t)v4[39])
  {
    if (!-[NSString isEqual:](logMessageUsageV3URLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  proactiveRoutingURLLegacy = self->_proactiveRoutingURLLegacy;
  if ((unint64_t)proactiveRoutingURLLegacy | (unint64_t)v4[44])
  {
    if (!-[NSString isEqual:](proactiveRoutingURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  backgroundDispatcherURLLegacy = self->_backgroundDispatcherURLLegacy;
  if ((unint64_t)backgroundDispatcherURLLegacy | (unint64_t)v4[19])
  {
    if (!-[NSString isEqual:](backgroundDispatcherURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  bluePOIURLLegacy = self->_bluePOIURLLegacy;
  if ((unint64_t)bluePOIURLLegacy | (unint64_t)v4[23])
  {
    if (!-[NSString isEqual:](bluePOIURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  backgroundRevGeoURLLegacy = self->_backgroundRevGeoURLLegacy;
  if ((unint64_t)backgroundRevGeoURLLegacy | (unint64_t)v4[20])
  {
    if (!-[NSString isEqual:](backgroundRevGeoURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  wifiConnectionQualityProbeURLLegacy = self->_wifiConnectionQualityProbeURLLegacy;
  if ((unint64_t)wifiConnectionQualityProbeURLLegacy | (unint64_t)v4[73])
  {
    if (!-[NSString isEqual:](wifiConnectionQualityProbeURLLegacy, "isEqual:")) {
      goto LABEL_90;
    }
  }
  muninBaseURL = self->_muninBaseURL;
  if ((unint64_t)muninBaseURL | (unint64_t)v4[40])
  {
    if (!-[NSString isEqual:](muninBaseURL, "isEqual:")) {
      goto LABEL_90;
    }
  }
  flyoverRegionVersions = self->_flyoverRegionVersions;
  if ((unint64_t)flyoverRegionVersions | (unint64_t)v4[32])
  {
    if (!-[NSData isEqual:](flyoverRegionVersions, "isEqual:")) {
      goto LABEL_90;
    }
  }
  urlInfoSet = self->_urlInfoSet;
  if ((unint64_t)urlInfoSet | (unint64_t)v4[71])
  {
    if (!-[GEOURLInfoSet isEqual:](urlInfoSet, "isEqual:")) {
      goto LABEL_90;
    }
  }
  muninBuckets = self->_muninBuckets;
  if ((unint64_t)muninBuckets | (unint64_t)v4[41])
  {
    if (!-[NSMutableArray isEqual:](muninBuckets, "isEqual:")) {
      goto LABEL_90;
    }
  }
  environment = self->_environment;
  if ((unint64_t)environment | (unint64_t)v4[29])
  {
    if (!-[NSString isEqual:](environment, "isEqual:")) {
      goto LABEL_90;
    }
  }
  displayStrings = self->_displayStrings;
  if ((unint64_t)displayStrings | (unint64_t)v4[28])
  {
    if (!-[NSMutableArray isEqual:](displayStrings, "isEqual:")) {
      goto LABEL_90;
    }
  }
  explicitResources = self->_explicitResources;
  if ((unint64_t)explicitResources | (unint64_t)v4[31])
  {
    if (!-[NSMutableArray isEqual:](explicitResources, "isEqual:")) {
      goto LABEL_90;
    }
  }
  offlineMetadata = self->_offlineMetadata;
  if ((unint64_t)offlineMetadata | (unint64_t)v4[42])
  {
    if (!-[GEOOfflineMetadata isEqual:](offlineMetadata, "isEqual:")) {
      goto LABEL_90;
    }
  }
  resourceCanonicalNameToFileName = self->_resourceCanonicalNameToFileName;
  if ((unint64_t)resourceCanonicalNameToFileName | (unint64_t)v4[57])
  {
    if (!-[NSMutableDictionary isEqual:](resourceCanonicalNameToFileName, "isEqual:")) {
      goto LABEL_90;
    }
  }
  regionalResourceCanonicalNameToFileName = self->_regionalResourceCanonicalNameToFileName;
  if ((unint64_t)regionalResourceCanonicalNameToFileName | (unint64_t)v4[50]) {
    char v47 = -[NSMutableDictionary isEqual:](regionalResourceCanonicalNameToFileName, "isEqual:");
  }
  else {
    char v47 = 1;
  }
LABEL_91:

  return v47;
}

- (unint64_t)hash
{
  [(GEOActiveTileGroup *)self readAll:1];
  unsigned int identifier = self->_identifier;
  uint64_t v72 = [(NSMutableArray *)self->_tileSets hash];
  uint64_t v71 = [(NSMutableArray *)self->_resources hash];
  NSUInteger v70 = [(NSString *)self->_uniqueIdentifier hash];
  uint64_t v69 = [(NSMutableArray *)self->_attributions hash];
  uint64_t v68 = [(NSMutableArray *)self->_regionalResourceTiles hash];
  uint64_t v67 = [(NSMutableArray *)self->_regionalResourceRegions hash];
  NSUInteger v66 = [(NSString *)self->_regionalResourcesURLLegacy hash];
  NSUInteger v65 = [(NSString *)self->_searchAttributionManifestURLLegacy hash];
  NSUInteger v64 = [(NSString *)self->_directionsURLLegacy hash];
  NSUInteger v63 = [(NSString *)self->_etaURLLegacy hash];
  NSUInteger v62 = [(NSString *)self->_batchReverseGeocoderURLLegacy hash];
  NSUInteger v61 = [(NSString *)self->_releaseInfo hash];
  NSUInteger v60 = [(NSString *)self->_resourcesURLLegacy hash];
  NSUInteger v59 = [(NSString *)self->_simpleETAURLLegacy hash];
  NSUInteger v58 = [(NSString *)self->_addressCorrectionInitURLLegacy hash];
  NSUInteger v57 = [(NSString *)self->_addressCorrectionUpdateURLLegacy hash];
  NSUInteger v56 = [(NSString *)self->_polyLocationShiftURLLegacy hash];
  NSUInteger v55 = [(NSString *)self->_problemSubmissionURLLegacy hash];
  NSUInteger v54 = [(NSString *)self->_problemStatusURLLegacy hash];
  NSUInteger v53 = [(NSString *)self->_reverseGeocoderVersionsURLLegacy hash];
  NSUInteger v52 = [(NSString *)self->_problemCategoriesURLLegacy hash];
  NSUInteger v51 = [(NSString *)self->_announcementsURLLegacy hash];
  uint64_t v50 = [(NSMutableArray *)self->_announcementsSupportedLanguages hash];
  NSUInteger v49 = [(NSString *)self->_dispatcherURLLegacy hash];
  NSUInteger v48 = [(NSString *)self->_problemOptInURLLegacy hash];
  unint64_t v47 = [(GEOVersionManifest *)self->_versionManifest hash];
  uint64_t v46 = [(NSMutableArray *)self->_styleSheets hash];
  uint64_t v45 = [(NSMutableArray *)self->_styleSheetChecksums hash];
  uint64_t v44 = [(NSMutableArray *)self->_textures hash];
  uint64_t v43 = [(NSMutableArray *)self->_textureChecksums hash];
  uint64_t v42 = [(NSMutableArray *)self->_fonts hash];
  uint64_t v41 = [(NSMutableArray *)self->_fontChecksums hash];
  uint64_t v40 = [(NSMutableArray *)self->_icons hash];
  uint64_t v39 = [(NSMutableArray *)self->_iconChecksums hash];
  uint64_t v38 = [(NSMutableArray *)self->_xmls hash];
  uint64_t v37 = [(NSMutableArray *)self->_xmlChecksums hash];
  NSUInteger v36 = [(NSString *)self->_abExperimentURLLegacy hash];
  NSUInteger v35 = [(NSString *)self->_businessPortalBaseURLLegacy hash];
  NSUInteger v3 = [(NSString *)self->_logMessageUsageURLLegacy hash];
  uint64_t v4 = [(NSMutableArray *)self->_locationShiftEnabledRegions hash];
  if (*(void *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_locationShiftVersion;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = PBHashBytes();
  uint64_t v7 = [(NSData *)self->_reserved hash];
  NSUInteger v8 = [(NSString *)self->_spatialLookupURLLegacy hash];
  uint64_t v9 = [(NSMutableArray *)self->_activeResources hash];
  uint64_t v10 = [(NSMutableArray *)self->_regionalResources hash];
  if ((*(void *)&self->_flags & 2) != 0) {
    uint64_t v11 = 2654435761 * self->_modelVersion;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = v72 ^ v71 ^ v70 ^ v69 ^ (2654435761 * identifier) ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  uint64_t v13 = PBRepeatedInt32Hash();
  uint64_t v14 = v13 ^ PBRepeatedInt32Hash();
  uint64_t v15 = v14 ^ [(NSMutableArray *)self->_staleResources hash];
  unint64_t v16 = v15 ^ [(GEODataSetDescription *)self->_dataSet hash];
  NSUInteger v17 = v16 ^ [(NSString *)self->_realtimeTrafficProbeURLLegacy hash];
  NSUInteger v18 = v17 ^ [(NSString *)self->_batchTrafficProbeURLLegacy hash];
  NSUInteger v19 = v18 ^ [(NSString *)self->_logMessageUsageV3URLLegacy hash];
  NSUInteger v20 = v19 ^ [(NSString *)self->_proactiveRoutingURLLegacy hash];
  NSUInteger v21 = v20 ^ [(NSString *)self->_backgroundDispatcherURLLegacy hash];
  NSUInteger v22 = v21 ^ [(NSString *)self->_bluePOIURLLegacy hash];
  NSUInteger v23 = v22 ^ [(NSString *)self->_backgroundRevGeoURLLegacy hash];
  NSUInteger v24 = v12 ^ v23 ^ [(NSString *)self->_wifiConnectionQualityProbeURLLegacy hash];
  NSUInteger v25 = [(NSString *)self->_muninBaseURL hash];
  uint64_t v26 = v25 ^ [(NSData *)self->_flyoverRegionVersions hash];
  unint64_t v27 = v26 ^ [(GEOURLInfoSet *)self->_urlInfoSet hash];
  uint64_t v28 = v27 ^ [(NSMutableArray *)self->_muninBuckets hash];
  NSUInteger v29 = v28 ^ [(NSString *)self->_environment hash];
  uint64_t v30 = v29 ^ [(NSMutableArray *)self->_displayStrings hash];
  uint64_t v31 = v30 ^ [(NSMutableArray *)self->_explicitResources hash];
  unint64_t v32 = v31 ^ [(GEOOfflineMetadata *)self->_offlineMetadata hash];
  uint64_t v33 = v32 ^ [(NSMutableDictionary *)self->_resourceCanonicalNameToFileName hash];
  return v24 ^ v33 ^ [(NSMutableDictionary *)self->_regionalResourceCanonicalNameToFileName hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v259 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  self->_unsigned int identifier = *((_DWORD *)v4 + 155);
  long long v232 = 0u;
  long long v233 = 0u;
  long long v234 = 0u;
  long long v235 = 0u;
  id v5 = *((id *)v4 + 69);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v232 objects:v258 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v233;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v233 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOActiveTileGroup *)self addTileSet:*(void *)(*((void *)&v232 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v232 objects:v258 count:16];
    }
    while (v7);
  }

  long long v231 = 0u;
  long long v230 = 0u;
  long long v229 = 0u;
  long long v228 = 0u;
  id v10 = *((id *)v4 + 59);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v228 objects:v257 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v229;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v229 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEOActiveTileGroup *)self addResource:*(void *)(*((void *)&v228 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v228 objects:v257 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 70)) {
    -[GEOActiveTileGroup setUniqueIdentifier:](self, "setUniqueIdentifier:");
  }
  long long v227 = 0u;
  long long v226 = 0u;
  long long v225 = 0u;
  long long v224 = 0u;
  id v15 = *((id *)v4 + 18);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v224 objects:v256 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v225;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v225 != v18) {
          objc_enumerationMutation(v15);
        }
        [(GEOActiveTileGroup *)self addAttribution:*(void *)(*((void *)&v224 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v224 objects:v256 count:16];
    }
    while (v17);
  }

  long long v223 = 0u;
  long long v222 = 0u;
  long long v221 = 0u;
  long long v220 = 0u;
  id v20 = *((id *)v4 + 52);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v220 objects:v255 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v221;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v221 != v23) {
          objc_enumerationMutation(v20);
        }
        [(GEOActiveTileGroup *)self addRegionalResourceTile:*(void *)(*((void *)&v220 + 1) + 8 * m)];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v220 objects:v255 count:16];
    }
    while (v22);
  }

  long long v219 = 0u;
  long long v218 = 0u;
  long long v217 = 0u;
  long long v216 = 0u;
  id v25 = *((id *)v4 + 51);
  uint64_t v26 = [v25 countByEnumeratingWithState:&v216 objects:v254 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v217;
    do
    {
      for (uint64_t n = 0; n != v27; ++n)
      {
        if (*(void *)v217 != v28) {
          objc_enumerationMutation(v25);
        }
        [(GEOActiveTileGroup *)self addRegionalResourceRegion:*(void *)(*((void *)&v216 + 1) + 8 * n)];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v216 objects:v254 count:16];
    }
    while (v27);
  }

  if (*((void *)v4 + 53)) {
    -[GEOActiveTileGroup setRegionalResourcesURLLegacy:](self, "setRegionalResourcesURLLegacy:");
  }
  if (*((void *)v4 + 61)) {
    -[GEOActiveTileGroup setSearchAttributionManifestURLLegacy:](self, "setSearchAttributionManifestURLLegacy:");
  }
  if (*((void *)v4 + 26)) {
    -[GEOActiveTileGroup setDirectionsURLLegacy:](self, "setDirectionsURLLegacy:");
  }
  if (*((void *)v4 + 30)) {
    -[GEOActiveTileGroup setEtaURLLegacy:](self, "setEtaURLLegacy:");
  }
  if (*((void *)v4 + 21)) {
    -[GEOActiveTileGroup setBatchReverseGeocoderURLLegacy:](self, "setBatchReverseGeocoderURLLegacy:");
  }
  if (*((void *)v4 + 55)) {
    -[GEOActiveTileGroup setReleaseInfo:](self, "setReleaseInfo:");
  }
  if (*((void *)v4 + 58)) {
    -[GEOActiveTileGroup setResourcesURLLegacy:](self, "setResourcesURLLegacy:");
  }
  if (*((void *)v4 + 62)) {
    -[GEOActiveTileGroup setSimpleETAURLLegacy:](self, "setSimpleETAURLLegacy:");
  }
  if (*((void *)v4 + 14)) {
    -[GEOActiveTileGroup setAddressCorrectionInitURLLegacy:](self, "setAddressCorrectionInitURLLegacy:");
  }
  if (*((void *)v4 + 15)) {
    -[GEOActiveTileGroup setAddressCorrectionUpdateURLLegacy:](self, "setAddressCorrectionUpdateURLLegacy:");
  }
  if (*((void *)v4 + 43)) {
    -[GEOActiveTileGroup setPolyLocationShiftURLLegacy:](self, "setPolyLocationShiftURLLegacy:");
  }
  if (*((void *)v4 + 48)) {
    -[GEOActiveTileGroup setProblemSubmissionURLLegacy:](self, "setProblemSubmissionURLLegacy:");
  }
  if (*((void *)v4 + 47)) {
    -[GEOActiveTileGroup setProblemStatusURLLegacy:](self, "setProblemStatusURLLegacy:");
  }
  if (*((void *)v4 + 60)) {
    -[GEOActiveTileGroup setReverseGeocoderVersionsURLLegacy:](self, "setReverseGeocoderVersionsURLLegacy:");
  }
  if (*((void *)v4 + 45)) {
    -[GEOActiveTileGroup setProblemCategoriesURLLegacy:](self, "setProblemCategoriesURLLegacy:");
  }
  if (*((void *)v4 + 17)) {
    -[GEOActiveTileGroup setAnnouncementsURLLegacy:](self, "setAnnouncementsURLLegacy:");
  }
  long long v215 = 0u;
  long long v214 = 0u;
  long long v213 = 0u;
  long long v212 = 0u;
  id v30 = *((id *)v4 + 16);
  uint64_t v31 = [v30 countByEnumeratingWithState:&v212 objects:v253 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v213;
    do
    {
      for (iuint64_t i = 0; ii != v32; ++ii)
      {
        if (*(void *)v213 != v33) {
          objc_enumerationMutation(v30);
        }
        [(GEOActiveTileGroup *)self addAnnouncementsSupportedLanguages:*(void *)(*((void *)&v212 + 1) + 8 * ii)];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v212 objects:v253 count:16];
    }
    while (v32);
  }

  if (*((void *)v4 + 27)) {
    -[GEOActiveTileGroup setDispatcherURLLegacy:](self, "setDispatcherURLLegacy:");
  }
  if (*((void *)v4 + 46)) {
    -[GEOActiveTileGroup setProblemOptInURLLegacy:](self, "setProblemOptInURLLegacy:");
  }
  versionManifest = self->_versionManifest;
  uint64_t v36 = *((void *)v4 + 72);
  if (versionManifest)
  {
    if (v36) {
      -[GEOVersionManifest mergeFrom:](versionManifest, "mergeFrom:");
    }
  }
  else if (v36)
  {
    -[GEOActiveTileGroup setVersionManifest:](self, "setVersionManifest:");
  }
  long long v211 = 0u;
  long long v210 = 0u;
  long long v209 = 0u;
  long long v208 = 0u;
  id v37 = *((id *)v4 + 66);
  uint64_t v38 = [v37 countByEnumeratingWithState:&v208 objects:v252 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v209;
    do
    {
      for (juint64_t j = 0; jj != v39; ++jj)
      {
        if (*(void *)v209 != v40) {
          objc_enumerationMutation(v37);
        }
        [(GEOActiveTileGroup *)self addStyleSheet:*(void *)(*((void *)&v208 + 1) + 8 * jj)];
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v208 objects:v252 count:16];
    }
    while (v39);
  }

  long long v207 = 0u;
  long long v205 = 0u;
  long long v206 = 0u;
  long long v204 = 0u;
  id v42 = *((id *)v4 + 65);
  uint64_t v43 = [v42 countByEnumeratingWithState:&v204 objects:v251 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v205;
    do
    {
      for (kuint64_t k = 0; kk != v44; ++kk)
      {
        if (*(void *)v205 != v45) {
          objc_enumerationMutation(v42);
        }
        [(GEOActiveTileGroup *)self addStyleSheetChecksum:*(void *)(*((void *)&v204 + 1) + 8 * kk)];
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v204 objects:v251 count:16];
    }
    while (v44);
  }

  long long v202 = 0u;
  long long v203 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  id v47 = *((id *)v4 + 68);
  uint64_t v48 = [v47 countByEnumeratingWithState:&v200 objects:v250 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v201;
    do
    {
      for (muint64_t m = 0; mm != v49; ++mm)
      {
        if (*(void *)v201 != v50) {
          objc_enumerationMutation(v47);
        }
        [(GEOActiveTileGroup *)self addTexture:*(void *)(*((void *)&v200 + 1) + 8 * mm)];
      }
      uint64_t v49 = [v47 countByEnumeratingWithState:&v200 objects:v250 count:16];
    }
    while (v49);
  }

  long long v198 = 0u;
  long long v199 = 0u;
  long long v196 = 0u;
  long long v197 = 0u;
  id v52 = *((id *)v4 + 67);
  uint64_t v53 = [v52 countByEnumeratingWithState:&v196 objects:v249 count:16];
  if (v53)
  {
    uint64_t v54 = v53;
    uint64_t v55 = *(void *)v197;
    do
    {
      for (nuint64_t n = 0; nn != v54; ++nn)
      {
        if (*(void *)v197 != v55) {
          objc_enumerationMutation(v52);
        }
        [(GEOActiveTileGroup *)self addTextureChecksum:*(void *)(*((void *)&v196 + 1) + 8 * nn)];
      }
      uint64_t v54 = [v52 countByEnumeratingWithState:&v196 objects:v249 count:16];
    }
    while (v54);
  }

  long long v194 = 0u;
  long long v195 = 0u;
  long long v192 = 0u;
  long long v193 = 0u;
  id v57 = *((id *)v4 + 34);
  uint64_t v58 = [v57 countByEnumeratingWithState:&v192 objects:v248 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v193;
    do
    {
      for (uint64_t i1 = 0; i1 != v59; ++i1)
      {
        if (*(void *)v193 != v60) {
          objc_enumerationMutation(v57);
        }
        [(GEOActiveTileGroup *)self addFont:*(void *)(*((void *)&v192 + 1) + 8 * i1)];
      }
      uint64_t v59 = [v57 countByEnumeratingWithState:&v192 objects:v248 count:16];
    }
    while (v59);
  }

  long long v190 = 0u;
  long long v191 = 0u;
  long long v188 = 0u;
  long long v189 = 0u;
  id v62 = *((id *)v4 + 33);
  uint64_t v63 = [v62 countByEnumeratingWithState:&v188 objects:v247 count:16];
  if (v63)
  {
    uint64_t v64 = v63;
    uint64_t v65 = *(void *)v189;
    do
    {
      for (uint64_t i2 = 0; i2 != v64; ++i2)
      {
        if (*(void *)v189 != v65) {
          objc_enumerationMutation(v62);
        }
        [(GEOActiveTileGroup *)self addFontChecksum:*(void *)(*((void *)&v188 + 1) + 8 * i2)];
      }
      uint64_t v64 = [v62 countByEnumeratingWithState:&v188 objects:v247 count:16];
    }
    while (v64);
  }

  long long v186 = 0u;
  long long v187 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  id v67 = *((id *)v4 + 36);
  uint64_t v68 = [v67 countByEnumeratingWithState:&v184 objects:v246 count:16];
  if (v68)
  {
    uint64_t v69 = v68;
    uint64_t v70 = *(void *)v185;
    do
    {
      for (uint64_t i3 = 0; i3 != v69; ++i3)
      {
        if (*(void *)v185 != v70) {
          objc_enumerationMutation(v67);
        }
        [(GEOActiveTileGroup *)self addIcon:*(void *)(*((void *)&v184 + 1) + 8 * i3)];
      }
      uint64_t v69 = [v67 countByEnumeratingWithState:&v184 objects:v246 count:16];
    }
    while (v69);
  }

  long long v182 = 0u;
  long long v183 = 0u;
  long long v180 = 0u;
  long long v181 = 0u;
  id v72 = *((id *)v4 + 35);
  uint64_t v73 = [v72 countByEnumeratingWithState:&v180 objects:v245 count:16];
  if (v73)
  {
    uint64_t v74 = v73;
    uint64_t v75 = *(void *)v181;
    do
    {
      for (uint64_t i4 = 0; i4 != v74; ++i4)
      {
        if (*(void *)v181 != v75) {
          objc_enumerationMutation(v72);
        }
        [(GEOActiveTileGroup *)self addIconChecksum:*(void *)(*((void *)&v180 + 1) + 8 * i4)];
      }
      uint64_t v74 = [v72 countByEnumeratingWithState:&v180 objects:v245 count:16];
    }
    while (v74);
  }

  long long v178 = 0u;
  long long v179 = 0u;
  long long v176 = 0u;
  long long v177 = 0u;
  id v77 = *((id *)v4 + 75);
  uint64_t v78 = [v77 countByEnumeratingWithState:&v176 objects:v244 count:16];
  if (v78)
  {
    uint64_t v79 = v78;
    uint64_t v80 = *(void *)v177;
    do
    {
      for (uint64_t i5 = 0; i5 != v79; ++i5)
      {
        if (*(void *)v177 != v80) {
          objc_enumerationMutation(v77);
        }
        [(GEOActiveTileGroup *)self addXml:*(void *)(*((void *)&v176 + 1) + 8 * i5)];
      }
      uint64_t v79 = [v77 countByEnumeratingWithState:&v176 objects:v244 count:16];
    }
    while (v79);
  }

  long long v174 = 0u;
  long long v175 = 0u;
  long long v172 = 0u;
  long long v173 = 0u;
  id v82 = *((id *)v4 + 74);
  uint64_t v83 = [v82 countByEnumeratingWithState:&v172 objects:v243 count:16];
  if (v83)
  {
    uint64_t v84 = v83;
    uint64_t v85 = *(void *)v173;
    do
    {
      for (uint64_t i6 = 0; i6 != v84; ++i6)
      {
        if (*(void *)v173 != v85) {
          objc_enumerationMutation(v82);
        }
        [(GEOActiveTileGroup *)self addXmlChecksum:*(void *)(*((void *)&v172 + 1) + 8 * i6)];
      }
      uint64_t v84 = [v82 countByEnumeratingWithState:&v172 objects:v243 count:16];
    }
    while (v84);
  }

  if (*((void *)v4 + 12)) {
    -[GEOActiveTileGroup setAbExperimentURLLegacy:](self, "setAbExperimentURLLegacy:");
  }
  if (*((void *)v4 + 24)) {
    -[GEOActiveTileGroup setBusinessPortalBaseURLLegacy:](self, "setBusinessPortalBaseURLLegacy:");
  }
  if (*((void *)v4 + 38)) {
    -[GEOActiveTileGroup setLogMessageUsageURLLegacy:](self, "setLogMessageUsageURLLegacy:");
  }
  long long v170 = 0u;
  long long v171 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  id v87 = *((id *)v4 + 37);
  uint64_t v88 = [v87 countByEnumeratingWithState:&v168 objects:v242 count:16];
  if (v88)
  {
    uint64_t v89 = v88;
    uint64_t v90 = *(void *)v169;
    do
    {
      for (uint64_t i7 = 0; i7 != v89; ++i7)
      {
        if (*(void *)v169 != v90) {
          objc_enumerationMutation(v87);
        }
        [(GEOActiveTileGroup *)self addLocationShiftEnabledRegion:*(void *)(*((void *)&v168 + 1) + 8 * i7)];
      }
      uint64_t v89 = [v87 countByEnumeratingWithState:&v168 objects:v242 count:16];
    }
    while (v89);
  }

  if (*((void *)v4 + 79))
  {
    self->_locationShiftVersiouint64_t n = *((_DWORD *)v4 + 156);
    *(void *)&self->_flags |= 1uLL;
  }
  uint64_t v92 = [v4 hybridUnavailableRegionsCount];
  if (v92)
  {
    uint64_t v93 = v92;
    for (uint64_t i8 = 0; i8 != v93; ++i8)
    {
      [v4 hybridUnavailableRegionAtIndex:i8];
      [(GEOActiveTileGroup *)self addHybridUnavailableRegion:v167];
    }
  }
  if (*((void *)v4 + 56)) {
    -[GEOActiveTileGroup setReserved:](self, "setReserved:");
  }
  if (*((void *)v4 + 63)) {
    -[GEOActiveTileGroup setSpatialLookupURLLegacy:](self, "setSpatialLookupURLLegacy:");
  }
  long long v165 = 0u;
  long long v166 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  id v95 = *((id *)v4 + 13);
  uint64_t v96 = [v95 countByEnumeratingWithState:&v163 objects:v241 count:16];
  if (v96)
  {
    uint64_t v97 = v96;
    uint64_t v98 = *(void *)v164;
    do
    {
      for (uint64_t i9 = 0; i9 != v97; ++i9)
      {
        if (*(void *)v164 != v98) {
          objc_enumerationMutation(v95);
        }
        [(GEOActiveTileGroup *)self addActiveResource:*(void *)(*((void *)&v163 + 1) + 8 * i9)];
      }
      uint64_t v97 = [v95 countByEnumeratingWithState:&v163 objects:v241 count:16];
    }
    while (v97);
  }

  long long v161 = 0u;
  long long v162 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  id v100 = *((id *)v4 + 54);
  uint64_t v101 = [v100 countByEnumeratingWithState:&v159 objects:v240 count:16];
  if (v101)
  {
    uint64_t v102 = v101;
    uint64_t v103 = *(void *)v160;
    do
    {
      for (uint64_t i10 = 0; i10 != v102; ++i10)
      {
        if (*(void *)v160 != v103) {
          objc_enumerationMutation(v100);
        }
        [(GEOActiveTileGroup *)self addRegionalResource:*(void *)(*((void *)&v159 + 1) + 8 * i10)];
      }
      uint64_t v102 = [v100 countByEnumeratingWithState:&v159 objects:v240 count:16];
    }
    while (v102);
  }

  if ((*((void *)v4 + 79) & 2) != 0)
  {
    self->_modelVersiouint64_t n = *((_DWORD *)v4 + 157);
    *(void *)&self->_flags |= 2uLL;
  }
  uint64_t v105 = [v4 activeScalesCount];
  if (v105)
  {
    uint64_t v106 = v105;
    for (uint64_t i11 = 0; i11 != v106; ++i11)
      -[GEOActiveTileGroup addActiveScale:](self, "addActiveScale:", [v4 activeScaleAtIndex:i11]);
  }
  uint64_t v108 = [v4 activeScenariosCount];
  if (v108)
  {
    uint64_t v109 = v108;
    for (uint64_t i12 = 0; i12 != v109; ++i12)
      -[GEOActiveTileGroup addActiveScenario:](self, "addActiveScenario:", [v4 activeScenarioAtIndex:i12]);
  }
  long long v157 = 0u;
  long long v158 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  id v111 = *((id *)v4 + 64);
  uint64_t v112 = [v111 countByEnumeratingWithState:&v155 objects:v239 count:16];
  if (v112)
  {
    uint64_t v113 = v112;
    uint64_t v114 = *(void *)v156;
    do
    {
      for (uint64_t i13 = 0; i13 != v113; ++i13)
      {
        if (*(void *)v156 != v114) {
          objc_enumerationMutation(v111);
        }
        [(GEOActiveTileGroup *)self addStaleResource:*(void *)(*((void *)&v155 + 1) + 8 * i13)];
      }
      uint64_t v113 = [v111 countByEnumeratingWithState:&v155 objects:v239 count:16];
    }
    while (v113);
  }

  dataSet = self->_dataSet;
  uint64_t v117 = *((void *)v4 + 25);
  if (dataSet)
  {
    if (v117) {
      -[GEODataSetDescription mergeFrom:](dataSet, "mergeFrom:");
    }
  }
  else if (v117)
  {
    -[GEOActiveTileGroup setDataSet:](self, "setDataSet:");
  }
  if (*((void *)v4 + 49)) {
    -[GEOActiveTileGroup setRealtimeTrafficProbeURLLegacy:](self, "setRealtimeTrafficProbeURLLegacy:");
  }
  if (*((void *)v4 + 22)) {
    -[GEOActiveTileGroup setBatchTrafficProbeURLLegacy:](self, "setBatchTrafficProbeURLLegacy:");
  }
  if (*((void *)v4 + 39)) {
    -[GEOActiveTileGroup setLogMessageUsageV3URLLegacy:](self, "setLogMessageUsageV3URLLegacy:");
  }
  if (*((void *)v4 + 44)) {
    [(GEOActiveTileGroup *)self setProactiveRoutingURLLegacy:"setProactiveRoutingURLLegacy:"];
  }
  if (*((void *)v4 + 19)) {
    -[GEOActiveTileGroup setBackgroundDispatcherURLLegacy:](self, "setBackgroundDispatcherURLLegacy:");
  }
  if (*((void *)v4 + 23)) {
    -[GEOActiveTileGroup setBluePOIURLLegacy:](self, "setBluePOIURLLegacy:");
  }
  if (*((void *)v4 + 20)) {
    -[GEOActiveTileGroup setBackgroundRevGeoURLLegacy:](self, "setBackgroundRevGeoURLLegacy:");
  }
  if (*((void *)v4 + 73)) {
    -[GEOActiveTileGroup setWifiConnectionQualityProbeURLLegacy:](self, "setWifiConnectionQualityProbeURLLegacy:");
  }
  if (*((void *)v4 + 40)) {
    -[GEOActiveTileGroup setMuninBaseURL:](self, "setMuninBaseURL:");
  }
  if (*((void *)v4 + 32)) {
    -[GEOActiveTileGroup setFlyoverRegionVersions:](self, "setFlyoverRegionVersions:");
  }
  urlInfoSet = self->_urlInfoSet;
  uint64_t v119 = *((void *)v4 + 71);
  if (urlInfoSet)
  {
    if (v119) {
      -[GEOURLInfoSet mergeFrom:](urlInfoSet, "mergeFrom:");
    }
  }
  else if (v119)
  {
    -[GEOActiveTileGroup setUrlInfoSet:](self, "setUrlInfoSet:");
  }
  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  id v120 = *((id *)v4 + 41);
  uint64_t v121 = [v120 countByEnumeratingWithState:&v151 objects:v238 count:16];
  if (v121)
  {
    uint64_t v122 = v121;
    uint64_t v123 = *(void *)v152;
    do
    {
      for (uint64_t i14 = 0; i14 != v122; ++i14)
      {
        if (*(void *)v152 != v123) {
          objc_enumerationMutation(v120);
        }
        [(GEOActiveTileGroup *)self addMuninBucket:*(void *)(*((void *)&v151 + 1) + 8 * i14)];
      }
      uint64_t v122 = [v120 countByEnumeratingWithState:&v151 objects:v238 count:16];
    }
    while (v122);
  }

  if (*((void *)v4 + 29)) {
    -[GEOActiveTileGroup setEnvironment:](self, "setEnvironment:");
  }
  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  id v125 = *((id *)v4 + 28);
  uint64_t v126 = [v125 countByEnumeratingWithState:&v147 objects:v237 count:16];
  if (v126)
  {
    uint64_t v127 = v126;
    uint64_t v128 = *(void *)v148;
    do
    {
      for (uint64_t i15 = 0; i15 != v127; ++i15)
      {
        if (*(void *)v148 != v128) {
          objc_enumerationMutation(v125);
        }
        [(GEOActiveTileGroup *)self addDisplayStrings:*(void *)(*((void *)&v147 + 1) + 8 * i15)];
      }
      uint64_t v127 = [v125 countByEnumeratingWithState:&v147 objects:v237 count:16];
    }
    while (v127);
  }

  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  id v130 = *((id *)v4 + 31);
  uint64_t v131 = [v130 countByEnumeratingWithState:&v143 objects:v236 count:16];
  if (v131)
  {
    uint64_t v132 = v131;
    uint64_t v133 = *(void *)v144;
    do
    {
      for (uint64_t i16 = 0; i16 != v132; ++i16)
      {
        if (*(void *)v144 != v133) {
          objc_enumerationMutation(v130);
        }
        -[GEOActiveTileGroup addExplicitResource:](self, "addExplicitResource:", *(void *)(*((void *)&v143 + 1) + 8 * i16), (void)v143);
      }
      uint64_t v132 = [v130 countByEnumeratingWithState:&v143 objects:v236 count:16];
    }
    while (v132);
  }

  offlineMetadata = self->_offlineMetadata;
  uint64_t v136 = *((void *)v4 + 42);
  if (offlineMetadata)
  {
    if (v136) {
      -[GEOOfflineMetadata mergeFrom:](offlineMetadata, "mergeFrom:");
    }
  }
  else if (v136)
  {
    -[GEOActiveTileGroup setOfflineMetadata:](self, "setOfflineMetadata:");
  }
  if (*((void *)v4 + 57))
  {
    resourceCanonicalNameToFileName = self->_resourceCanonicalNameToFileName;
    if (resourceCanonicalNameToFileName)
    {
      -[NSMutableDictionary addEntriesFromDictionary:](resourceCanonicalNameToFileName, "addEntriesFromDictionary:");
    }
    else
    {
      long long v138 = (NSMutableDictionary *)[*((id *)v4 + 57) copy];
      uint64_t v139 = self->_resourceCanonicalNameToFileName;
      self->_resourceCanonicalNameToFileName = v138;
    }
  }
  if (*((void *)v4 + 50))
  {
    regionalResourceCanonicalNameToFileName = self->_regionalResourceCanonicalNameToFileName;
    if (regionalResourceCanonicalNameToFileName)
    {
      -[NSMutableDictionary addEntriesFromDictionary:](regionalResourceCanonicalNameToFileName, "addEntriesFromDictionary:");
    }
    else
    {
      uint64_t v141 = (NSMutableDictionary *)[*((id *)v4 + 50) copy];
      long long v142 = self->_regionalResourceCanonicalNameToFileName;
      self->_regionalResourceCanonicalNameToFileName = v141;
    }
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(void *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOActiveTileGroupReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_5);
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
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char v6 = *((unsigned char *)&self->_flags + 8) | 0x40;
  *(void *)&self->_flags |= 4uLL;
  *((unsigned char *)&self->_flags + 8) = v6;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOActiveTileGroup *)self readAll:0];
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    uint64_t v8 = self->_tileSets;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v103 objects:v117 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v104;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v104 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v103 + 1) + 8 * v12++) clearUnknownFields:1];
        }
        while (v10 != v12);
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v103 objects:v117 count:16];
      }
      while (v10);
    }

    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    uint64_t v13 = self->_attributions;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v99 objects:v116 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v100;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v100 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v99 + 1) + 8 * v17++) clearUnknownFields:1];
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v99 objects:v116 count:16];
      }
      while (v15);
    }

    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    uint64_t v18 = self->_regionalResourceTiles;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v95 objects:v115 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v96;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v96 != v21) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v95 + 1) + 8 * v22++) clearUnknownFields:1];
        }
        while (v20 != v22);
        uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v95 objects:v115 count:16];
      }
      while (v20);
    }

    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    uint64_t v23 = self->_regionalResourceRegions;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v91 objects:v114 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v92;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v92 != v26) {
            objc_enumerationMutation(v23);
          }
          [*(id *)(*((void *)&v91 + 1) + 8 * v27++) clearUnknownFields:1];
        }
        while (v25 != v27);
        uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v91 objects:v114 count:16];
      }
      while (v25);
    }

    [(GEOVersionManifest *)self->_versionManifest clearUnknownFields:1];
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    uint64_t v28 = self->_locationShiftEnabledRegions;
    uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v87 objects:v113 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v88;
      do
      {
        uint64_t v32 = 0;
        do
        {
          if (*(void *)v88 != v31) {
            objc_enumerationMutation(v28);
          }
          [*(id *)(*((void *)&v87 + 1) + 8 * v32++) clearUnknownFields:1];
        }
        while (v30 != v32);
        uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v87 objects:v113 count:16];
      }
      while (v30);
    }

    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    uint64_t v33 = self->_activeResources;
    uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v83 objects:v112 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v84;
      do
      {
        uint64_t v37 = 0;
        do
        {
          if (*(void *)v84 != v36) {
            objc_enumerationMutation(v33);
          }
          [*(id *)(*((void *)&v83 + 1) + 8 * v37++) clearUnknownFields:1];
        }
        while (v35 != v37);
        uint64_t v35 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v83 objects:v112 count:16];
      }
      while (v35);
    }

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    uint64_t v38 = self->_regionalResources;
    uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v79 objects:v111 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v80;
      do
      {
        uint64_t v42 = 0;
        do
        {
          if (*(void *)v80 != v41) {
            objc_enumerationMutation(v38);
          }
          [*(id *)(*((void *)&v79 + 1) + 8 * v42++) clearUnknownFields:1];
        }
        while (v40 != v42);
        uint64_t v40 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v79 objects:v111 count:16];
      }
      while (v40);
    }

    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    uint64_t v43 = self->_staleResources;
    uint64_t v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v75 objects:v110 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v76;
      do
      {
        uint64_t v47 = 0;
        do
        {
          if (*(void *)v76 != v46) {
            objc_enumerationMutation(v43);
          }
          [*(id *)(*((void *)&v75 + 1) + 8 * v47++) clearUnknownFields:1];
        }
        while (v45 != v47);
        uint64_t v45 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v75 objects:v110 count:16];
      }
      while (v45);
    }

    [(GEODataSetDescription *)self->_dataSet clearUnknownFields:1];
    [(GEOURLInfoSet *)self->_urlInfoSet clearUnknownFields:1];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    uint64_t v48 = self->_muninBuckets;
    uint64_t v49 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v71 objects:v109 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v72;
      do
      {
        uint64_t v52 = 0;
        do
        {
          if (*(void *)v72 != v51) {
            objc_enumerationMutation(v48);
          }
          [*(id *)(*((void *)&v71 + 1) + 8 * v52++) clearUnknownFields:1];
        }
        while (v50 != v52);
        uint64_t v50 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v71 objects:v109 count:16];
      }
      while (v50);
    }

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    uint64_t v53 = self->_displayStrings;
    uint64_t v54 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v67 objects:v108 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)v68;
      do
      {
        uint64_t v57 = 0;
        do
        {
          if (*(void *)v68 != v56) {
            objc_enumerationMutation(v53);
          }
          [*(id *)(*((void *)&v67 + 1) + 8 * v57++) clearUnknownFields:1];
        }
        while (v55 != v57);
        uint64_t v55 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v67 objects:v108 count:16];
      }
      while (v55);
    }

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    uint64_t v58 = self->_explicitResources;
    uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v63 objects:v107 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v64;
      do
      {
        uint64_t v62 = 0;
        do
        {
          if (*(void *)v64 != v61) {
            objc_enumerationMutation(v58);
          }
          objc_msgSend(*(id *)(*((void *)&v63 + 1) + 8 * v62++), "clearUnknownFields:", 1, (void)v63);
        }
        while (v60 != v62);
        uint64_t v60 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v63 objects:v107 count:16];
      }
      while (v60);
    }

    [(GEOOfflineMetadata *)self->_offlineMetadata clearUnknownFields:1];
  }
}

- (id)_decodedFlyoverRegionVersions
{
  if ([(GEOActiveTileGroup *)self hasFlyoverRegionVersions])
  {
    objc_getAssociatedObject(self, &_DecodedFlyoverRegionVersions);
    BOOL v3 = (_GEOFlyoverRegionVersionMap *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      id v4 = [_GEOFlyoverRegionVersionMap alloc];
      id v5 = [(GEOActiveTileGroup *)self flyoverRegionVersions];
      BOOL v3 = [(_GEOFlyoverRegionVersionMap *)v4 initWithData:v5];

      objc_setAssociatedObject(self, &_DecodedFlyoverRegionVersions, v3, (void *)0x301);
    }
    char v6 = v3;
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unsigned)versionForFlyoverRegion:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(GEOActiveTileGroup *)self _decodedFlyoverRegionVersions];
  uint64_t v5 = [v4 regionForID:v3];
  if (v5) {
    unsigned int v6 = *(_DWORD *)(v5 + 8);
  }
  else {
    unsigned int v6 = 0;
  }

  return v6;
}

- (BOOL)hasDataVersionForFlyoverRegion:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(GEOActiveTileGroup *)self _decodedFlyoverRegionVersions];
  uint64_t v5 = [v4 regionForID:v3];
  if (v5) {
    BOOL v6 = *(unsigned char *)(v5 + 12) & 1;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (unsigned)dataVersionForFlyoverRegion:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(GEOActiveTileGroup *)self _decodedFlyoverRegionVersions];
  uint64_t v5 = (unsigned int *)[v4 regionForID:v3];
  if (v5) {
    unsigned int v6 = *v5;
  }
  else {
    unsigned int v6 = 0;
  }

  return v6;
}

- (void)enumerateFlyoverRegions:(id)a3
{
  id v5 = a3;
  id v4 = [(GEOActiveTileGroup *)self _decodedFlyoverRegionVersions];
  [v4 enumerateFlyoverRegions:v5];
}

- (void)_setDecodedFlyoverRegionVersions:(id)a3
{
  id v5 = a3;
  id v4 = [[_GEOFlyoverRegionVersionMap alloc] initWithFlyoverRegions:v5];
  objc_setAssociatedObject(self, &_DecodedFlyoverRegionVersions, v4, (void *)0x301);
}

- (id)localizationURLStringForTileKey:(void *)a1
{
  int v1 = objc_msgSend(a1, "activeTileSetForKey:");
  v2 = [v1 localizationURL];

  return v2;
}

- (uint64_t)versionForTileKey:(void *)a1
{
  int v1 = objc_msgSend(a1, "activeTileSetForKey:");
  uint64_t v2 = [v1 version];

  return v2;
}

- (uint64_t)requestStyleForTileKey:(void *)a1
{
  int v1 = objc_msgSend(a1, "activeTileSetForKey:");
  uint64_t v2 = [v1 requestStyle];

  return v2;
}

- (double)timeToLiveForTileKey:(void *)a1
{
  int v1 = objc_msgSend(a1, "activeTileSetForKey:");
  uint64_t v2 = v1;
  if (v1 && [v1 hasTimeToLiveSeconds])
  {
    double v3 = (double)[v2 timeToLiveSeconds];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [v4 timeIntervalSince1970];
    double v3 = v5;
  }
  return v3;
}

- (uint64_t)isAvailableForTileKey:(uint64_t)a3
{
  id v4 = objc_msgSend(a1, "activeTileSetForKey:");
  uint64_t v5 = [v4 isAvailableForTileKey:a3];

  return v5;
}

- (uint64_t)isHybridModeAvailableForTileKey:(uint64_t)a3
{
  if (!a3) {
    return 0;
  }
  GEOTileKeyAssertIsStandard(a3);
  if (qword_1EB29FB68 != -1) {
    dispatch_once(&qword_1EB29FB68, &__block_literal_global_358);
  }
  if (!byte_1EB29FAD2)
  {
LABEL_9:
    uint64_t v7 = [a1 hybridUnavailableRegionsCount];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = (unsigned int *)[a1 hybridUnavailableRegions];
      uint64_t v10 = v8 - 1;
      do
      {
        uint64_t v11 = v10;
        BOOL v5 = GEOTileSetRegionContainsTileKey(v9, a3);
        if (v5) {
          break;
        }
        uint64_t v10 = v11 - 1;
        v9 += 6;
      }
      while (v11);
      return !v5;
    }
    return 1;
  }
  if (qword_1EB29FB60 != 2)
  {
    if (qword_1EB29FB60 == 1)
    {
      BOOL v5 = GEOTileSetRegionContainsTileKey((unsigned int *)&xmmword_1EB29FB70, a3);
      return !v5;
    }
    goto LABEL_9;
  }
  if ((*(_DWORD *)(a3 + 6) & 0x3Fu) < dword_1EB29FB84) {
    return 1;
  }

  return GEOTileSetRegionContainsTileKey((unsigned int *)&xmmword_1EB29FB70, a3);
}

double __91__GEOActiveTileGroup_GEOResourceManifestManagerAdditions__isHybridModeAvailableForTileKey___block_invoke()
{
  BOOL HasValue = _GEOConfigHasValue(GeoServicesConfig_HybridUnavailableSimulationType, (uint64_t)off_1E9114128);
  byte_1EB29FAD2 = HasValue;
  if (HasValue)
  {
    qword_1EB29FB60 = GEOConfigGetInteger(GeoServicesConfig_HybridUnavailableSimulationType, (uint64_t)off_1E9114128);
    if (byte_1EB29FAD2)
    {
      unk_1EB29FB80 = 0x600000017;
      *(void *)&double result = 0x1900000036;
      xmmword_1EB29FB70 = xmmword_18A6371E0;
    }
  }
  return result;
}

- (id)languageForTileKey:(uint64_t)a3 overrideLocale:(void *)a4
{
  id v6 = a4;
  uint64_t v7 = [a1 activeTileSetForKey:a3];
  uint64_t v8 = [v7 bestLanguageWithOverrideLocale:v6];

  return v8;
}

- (uint64_t)useProxyAuthForTileKey:(uint64_t)a3
{
  uint64_t result = GEOAuthProxyEnabledForActiveTileGroup(a1);
  if (result)
  {
    id v6 = [a1 activeTileSetForKey:a3];
    uint64_t v7 = [v6 useAuthProxy];

    return v7;
  }
  return result;
}

- (BOOL)supportsTileStyle:(int)a3 size:(int)a4 scale:(int)a5
{
  BOOL v5 = [(GEOActiveTileGroup *)self activeTileSetForStyle:*(void *)&a3 size:*(void *)&a4 scale:*(void *)&a5];
  BOOL v6 = v5 != 0;

  return v6;
}

- (void)_resetBestLanguages
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = [(GEOActiveTileGroup *)self tileSets];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) _resetBestLanguage];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (uint64_t)hasRegionalResourcesForTileKey:(uint64_t)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v5 = [a1 regionalResources];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v10 regionsCount])
        {
          uint64_t v11 = 0;
          while (1)
          {
            uint64_t v24 = 0;
            uint64_t v25 = 0;
            uint64_t v26 = 0;
            if (v10) {
              [v10 regionAtIndex:v11];
            }
            if (GEOTileSetRegionContainsTileKey((unsigned int *)&v24, a3)) {
              break;
            }
            if (++v11 >= (unint64_t)[v10 regionsCount]) {
              goto LABEL_12;
            }
          }
LABEL_28:
          uint64_t v18 = 1;
          goto LABEL_29;
        }
LABEL_12:
        ;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = objc_msgSend(a1, "attributions", 0);
  uint64_t v12 = [v5 countByEnumeratingWithState:&v20 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    while (2)
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v5);
        }
        uint64_t v16 = *(void **)(*((void *)&v20 + 1) + 8 * j);
        if ([v16 regionsCount])
        {
          uint64_t v17 = 0;
          do
          {
            uint64_t v24 = 0;
            uint64_t v25 = 0;
            uint64_t v26 = 0;
            if (v16) {
              [v16 regionAtIndex:v17];
            }
            if (GEOTileSetRegionContainsTileKey((unsigned int *)&v24, a3)) {
              goto LABEL_28;
            }
          }
          while (++v17 < (unint64_t)[v16 regionsCount]);
        }
      }
      uint64_t v13 = [v5 countByEnumeratingWithState:&v20 objects:v31 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  uint64_t v18 = 0;
LABEL_29:

  return v18;
}

- (GEOTileKeyList)regionalResourceKeysForTileKey:(uint64_t)a3 scale:(unsigned __int8)a4 scenarios:(void *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  long long v9 = objc_alloc_init(GEOTileKeyList);
  if ([a1 regionalResourcesCount])
  {
    unint64_t v10 = 0;
    unint64_t v11 = (unint64_t)a4 << 54;
    unsigned long long v23 = xmmword_18A6371F0;
    do
    {
      uint64_t v12 = objc_msgSend(a1, "regionalResourceAtIndex:", v10, v23);
      if ([v12 regionsCount])
      {
        uint64_t v13 = 0;
        while (1)
        {
          uint64_t v25 = 0;
          uint64_t v26 = 0;
          uint64_t v27 = 0;
          if (v12) {
            [v12 regionAtIndex:v13];
          }
          if (GEOTileSetRegionContainsTileKey((unsigned int *)&v25, a3)) {
            break;
          }
          if (++v13 >= (unint64_t)[v12 regionsCount]) {
            goto LABEL_11;
          }
        }
        uint64_t v29 = 0;
        uint64_t v30 = 0;
        unsigned __int8 active = GEORegionalResourceTileKeyActiveScenariosBitSet(v8);
        unsigned long long v28 = v23;
        *(void *)((char *)&v28 + 1) = (v23 >> 8) & 0xC000000000000000 | v11 | v10 | ((unint64_t)active << 32) | 0x800000000000;
        *((void *)&v15 + 1) = (*((void *)&v23 + 1) >> 8) | ((unint64_t)((unsigned __int16)(HIDWORD(v23) >> 8) | (HIBYTE(v23) << 16)) << 32);
        *(void *)&long long v15 = (v23 >> 8) & 0xC000000000000000 | v11;
        uint64_t v29 = v28;
        uint64_t v30 = v15 >> 56;
        [(GEOTileKeyList *)v9 addKey:&v29];
      }
LABEL_11:

      ++v10;
    }
    while (v10 < [a1 regionalResourcesCount]);
  }
  if ([a1 attributionsCount])
  {
    unint64_t v16 = 0;
    unint64_t v17 = (unint64_t)a4 << 54;
    unsigned long long v24 = xmmword_18A6371F0;
    do
    {
      uint64_t v18 = objc_msgSend(a1, "attributionAtIndex:", v16, v24);
      if ([v18 regionsCount])
      {
        uint64_t v19 = 0;
        while (1)
        {
          uint64_t v25 = 0;
          uint64_t v26 = 0;
          uint64_t v27 = 0;
          if (v18) {
            [v18 regionAtIndex:v19];
          }
          if (GEOTileSetRegionContainsTileKey((unsigned int *)&v25, a3)) {
            break;
          }
          if (++v19 >= (unint64_t)[v18 regionsCount]) {
            goto LABEL_22;
          }
        }
        uint64_t v29 = 0;
        uint64_t v30 = 0;
        unsigned __int8 v20 = GEORegionalResourceTileKeyActiveScenariosBitSet(v8);
        unsigned long long v28 = v24;
        *(void *)((char *)&v28 + 1) = (v24 >> 8) & 0xC000000000000000 | v17 | v16 | ((unint64_t)v20 << 32) | 0x810000000000;
        *((void *)&v21 + 1) = (*((void *)&v24 + 1) >> 8) | ((unint64_t)((unsigned __int16)(HIDWORD(v24) >> 8) | (HIBYTE(v24) << 16)) << 32);
        *(void *)&long long v21 = (v24 >> 8) & 0xC000000000000000 | v17;
        uint64_t v29 = v28;
        uint64_t v30 = v21 >> 56;
        [(GEOTileKeyList *)v9 addKey:&v29];
      }
LABEL_22:

      ++v16;
    }
    while (v16 < [a1 attributionsCount]);
  }

  return v9;
}

- (id)regionalResourcesForMapRegions:(id)a3 resourceFilter:(id)a4 attributionFilter:(id)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v9 = (unsigned int (**)(id, void))a4;
  unint64_t v10 = (unsigned int (**)(id, void))a5;
  unint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  id v56 = v8;
  uint64_t v51 = self;
  if (v9 && [(GEOActiveTileGroup *)self regionalResourcesCount])
  {
    uint64_t v12 = 0;
    do
    {
      uint64_t v49 = v12;
      uint64_t v13 = [(GEOActiveTileGroup *)self regionalResourceAtIndex:v12];
      if ([v13 regionsCount])
      {
        uint64_t v14 = 0;
        uint64_t v54 = v13;
        do
        {
          uint64_t v65 = 0;
          uint64_t v66 = 0;
          uint64_t v67 = 0;
          if (v13) {
            [v13 regionAtIndex:v14];
          }
          uint64_t v52 = v14;
          if ([v8 count])
          {
            unint64_t v15 = 0;
            do
            {
              unint64_t v16 = [v8 objectAtIndexedSubscript:v15];
              double v17 = GEOMapRectForMapRegion(v16);
              double v19 = v18;
              double v21 = v20;
              double v23 = v22;

              if (GEOTileSetRegionIntersectsMapRect((unsigned int *)&v65, v17, v19, v21, v23))
              {
                long long v63 = 0u;
                long long v64 = 0u;
                long long v61 = 0u;
                long long v62 = 0u;
                unsigned long long v24 = [v13 resources];
                uint64_t v25 = [v24 countByEnumeratingWithState:&v61 objects:v69 count:16];
                if (v25)
                {
                  uint64_t v26 = v25;
                  uint64_t v27 = *(void *)v62;
                  do
                  {
                    for (uint64_t i = 0; i != v26; ++i)
                    {
                      if (*(void *)v62 != v27) {
                        objc_enumerationMutation(v24);
                      }
                      uint64_t v29 = *(void *)(*((void *)&v61 + 1) + 8 * i);
                      if (v9[2](v9, v29)) {
                        [v11 addObject:v29];
                      }
                    }
                    uint64_t v26 = [v24 countByEnumeratingWithState:&v61 objects:v69 count:16];
                  }
                  while (v26);
                }

                uint64_t v13 = v54;
                id v8 = v56;
              }
              ++v15;
            }
            while (v15 < [v8 count]);
          }
          uint64_t v14 = v52 + 1;
        }
        while (v52 + 1 < (unint64_t)[v13 regionsCount]);
      }

      self = v51;
      uint64_t v12 = v49 + 1;
    }
    while (v49 + 1 < [(GEOActiveTileGroup *)v51 regionalResourcesCount]);
  }
  if (v10 && [(GEOActiveTileGroup *)self attributionsCount])
  {
    uint64_t v30 = 0;
    do
    {
      uint64_t v50 = v30;
      uint64_t v31 = [(GEOActiveTileGroup *)self attributionAtIndex:v30];
      if ([v31 regionsCount])
      {
        uint64_t v32 = 0;
        uint64_t v55 = v31;
        do
        {
          uint64_t v65 = 0;
          uint64_t v66 = 0;
          uint64_t v67 = 0;
          if (v31) {
            [v31 regionAtIndex:v32];
          }
          uint64_t v53 = v32;
          if ([v8 count])
          {
            unint64_t v33 = 0;
            do
            {
              uint64_t v34 = [v8 objectAtIndexedSubscript:v33];
              double v35 = GEOMapRectForMapRegion(v34);
              double v37 = v36;
              double v39 = v38;
              double v41 = v40;

              if (GEOTileSetRegionIntersectsMapRect((unsigned int *)&v65, v35, v37, v39, v41))
              {
                long long v59 = 0u;
                long long v60 = 0u;
                long long v57 = 0u;
                long long v58 = 0u;
                uint64_t v42 = [v31 resources];
                uint64_t v43 = [v42 countByEnumeratingWithState:&v57 objects:v68 count:16];
                if (v43)
                {
                  uint64_t v44 = v43;
                  uint64_t v45 = *(void *)v58;
                  do
                  {
                    for (uint64_t j = 0; j != v44; ++j)
                    {
                      if (*(void *)v58 != v45) {
                        objc_enumerationMutation(v42);
                      }
                      uint64_t v47 = *(void *)(*((void *)&v57 + 1) + 8 * j);
                      if (v10[2](v10, v47)) {
                        [v11 addObject:v47];
                      }
                    }
                    uint64_t v44 = [v42 countByEnumeratingWithState:&v57 objects:v68 count:16];
                  }
                  while (v44);
                }

                uint64_t v31 = v55;
                id v8 = v56;
              }
              ++v33;
            }
            while (v33 < [v8 count]);
          }
          uint64_t v32 = v53 + 1;
        }
        while (v53 + 1 < (unint64_t)[v31 regionsCount]);
      }

      self = v51;
      uint64_t v30 = v50 + 1;
    }
    while (v50 + 1 < [(GEOActiveTileGroup *)v51 attributionsCount]);
  }

  return v11;
}

- (uint64_t)largestRegionalResourceZoomLevelContainingTileKey:(uint64_t)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v5 = [a1 regionalResources];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v5);
        }
        unint64_t v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if ([v11 regionsCount])
        {
          unint64_t v12 = 0;
          do
          {
            uint64_t v29 = 0;
            uint64_t v30 = 0;
            uint64_t v31 = 0;
            if (v11) {
              [v11 regionAtIndex:v12];
            }
            BOOL v13 = GEOTileSetRegionContainsTileKey((unsigned int *)&v29, a3);
            if (v8 <= HIDWORD(v31)) {
              unsigned int v14 = HIDWORD(v31);
            }
            else {
              unsigned int v14 = v8;
            }
            if (v13) {
              uint64_t v8 = v14;
            }
            else {
              uint64_t v8 = v8;
            }
            ++v12;
          }
          while (v12 < [v11 regionsCount]);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v15 = objc_msgSend(a1, "attributions", 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        double v20 = *(void **)(*((void *)&v25 + 1) + 8 * j);
        if ([v20 regionsCount])
        {
          unint64_t v21 = 0;
          do
          {
            uint64_t v29 = 0;
            uint64_t v30 = 0;
            uint64_t v31 = 0;
            if (v20) {
              [v20 regionAtIndex:v21];
            }
            BOOL v22 = GEOTileSetRegionContainsTileKey((unsigned int *)&v29, a3);
            if (v8 <= HIDWORD(v31)) {
              unsigned int v23 = HIDWORD(v31);
            }
            else {
              unsigned int v23 = v8;
            }
            if (v22) {
              uint64_t v8 = v23;
            }
            else {
              uint64_t v8 = v8;
            }
            ++v21;
          }
          while (v21 < [v20 regionsCount]);
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v36 count:16];
    }
    while (v17);
  }

  return v8;
}

- (id)regionalResourcesForMapRect:(id)a3
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v5 = a3.var0.var1;
  double v6 = a3.var0.var0;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v9 = [(GEOActiveTileGroup *)self regionalResources];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v9);
        }
        unsigned int v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if ([v14 regionsCount])
        {
          uint64_t v15 = 0;
          while (1)
          {
            uint64_t v30 = 0;
            uint64_t v31 = 0;
            uint64_t v32 = 0;
            if (v14) {
              [v14 regionAtIndex:v15];
            }
            if (GEOTileSetRegionIntersectsMapRect((unsigned int *)&v30, v6, v5, var0, var1)) {
              break;
            }
            if (++v15 >= (unint64_t)[v14 regionsCount]) {
              goto LABEL_14;
            }
          }
          uint64_t v16 = [v14 resources];
          [v8 addObjectsFromArray:v16];
        }
LABEL_14:
        ;
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v11);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v17 = [(GEOActiveTileGroup *)self attributions];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v37 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v17);
        }
        BOOL v22 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        if ([v22 regionsCount])
        {
          uint64_t v23 = 0;
          while (1)
          {
            uint64_t v30 = 0;
            uint64_t v31 = 0;
            uint64_t v32 = 0;
            if (v22) {
              [v22 regionAtIndex:v23];
            }
            if (GEOTileSetRegionIntersectsMapRect((unsigned int *)&v30, v6, v5, var0, var1)) {
              break;
            }
            if (++v23 >= (unint64_t)[v22 regionsCount]) {
              goto LABEL_29;
            }
          }
          unsigned long long v24 = [v22 resources];
          [v8 addObjectsFromArray:v24];
        }
LABEL_29:
        ;
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v37 count:16];
    }
    while (v19);
  }

  return v8;
}

- (id)mapAttributionForCoordinate:(id)a3 isGlobal:(BOOL *)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v7 = +[GEOResourceManifestManager modernManager];
  uint64_t v8 = [v7 activeTileGroup];
  uint64_t v9 = [v8 attributions];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    double v12 = GEOTilePointForCoordinate(var0, var1, 20.0);
    double v14 = v13;
    long double v15 = GEOMapPointsPerMeterAtLatitude(var0);
    id v16 = 0;
    double v17 = v12 - v15;
    double v18 = v14 - v15;
    double v19 = v15 + v15;
    uint64_t v20 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v9);
        }
        BOOL v22 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ([v22 regionsCount])
        {
          if ([v22 regionsCount])
          {
            uint64_t v23 = 0;
            while (1)
            {
              memset(v27, 0, sizeof(v27));
              if (v22) {
                [v22 regionAtIndex:v23];
              }
              if (GEOTileSetRegionIntersectsMapRect((unsigned int *)v27, v17, v18, v19, v19)) {
                break;
              }
              if (++v23 >= (unint64_t)[v22 regionsCount]) {
                goto LABEL_15;
              }
            }
            if (a4) {
              *a4 = 0;
            }
            id v25 = v22;

            goto LABEL_25;
          }
        }
        else
        {
          id v24 = v22;

          id v16 = v24;
        }
LABEL_15:
        ;
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v16 = 0;
  }

  if (a4) {
    *a4 = 1;
  }
  id v16 = v16;
  id v25 = v16;
LABEL_25:

  return v25;
}

- (id)mapAttributionURLForCoordinate:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  char v14 = 0;
  double v5 = -[GEOActiveTileGroup mapAttributionForCoordinate:isGlobal:](self, "mapAttributionForCoordinate:isGlobal:", &v14);
  double v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v8 = [v5 url];
    uint64_t v9 = [v7 URLWithString:v8];

    if (v9) {
      goto LABEL_11;
    }
    uint64_t v10 = GEOGetResourceManifestLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      if (v14) {
        uint64_t v11 = "Global";
      }
      else {
        uint64_t v11 = "Regional";
      }
      double v12 = [v6 url];
      *(_DWORD *)buf = 136315907;
      double v16 = *(double *)&v11;
      __int16 v17 = 2049;
      double v18 = var0;
      __int16 v19 = 2049;
      double v20 = var1;
      __int16 v21 = 2112;
      BOOL v22 = v12;
      _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_FAULT, "%s (%{private}f,%{private}f) attribution URL is invalid \"%@\"", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v10 = GEOGetResourceManifestLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218240;
      double v16 = var0;
      __int16 v17 = 2048;
      double v18 = var1;
      _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_FAULT, "Attribution for (%f,%f) is nil", buf, 0x16u);
    }
  }

  uint64_t v9 = 0;
LABEL_11:

  return v9;
}

- (void)iterateActiveTileSets:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x2810000000;
    long long v34 = "";
    int v35 = 0;
    uint64_t v27 = 0;
    long long v28 = &v27;
    uint64_t v29 = 0x2020000000;
    int v30 = 0;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    double v5 = [(GEOActiveTileGroup *)self tileSets];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v36 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v24;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * v8);
          if ([v9 style] == 14
            || [v9 style] == 15
            || [v9 style] == 16
            || [v9 style] == 42
            || [v9 style] == 52
            || [v9 style] == 43
            || [v9 style] == 44)
          {
            int v10 = [v9 style];
            v18[0] = MEMORY[0x1E4F143A8];
            if (v10 == 14) {
              int v11 = 4;
            }
            else {
              int v11 = 3;
            }
            v18[1] = 3221225472;
            v18[2] = __81__GEOActiveTileGroup_GEOResourceManifestManagerAdditions__iterateActiveTileSets___block_invoke;
            v18[3] = &unk_1E53E2CC0;
            double v20 = &v31;
            __int16 v21 = &v27;
            v18[4] = v9;
            id v19 = v4;
            int v22 = v11;
            [(GEOActiveTileGroup *)self enumerateFlyoverRegions:v18];
          }
          else
          {
            uint64_t v12 = GEOTileProviderForStyle([v9 style]);
            __int16 v17 = [v9 style];
            char v16 = [v9 scale];
            char v13 = [v9 size];
            *((_DWORD *)v32 + 8) = ((v17 & 0x3FFF | ((v13 & 0xF) << 14) & 0xFFC3FFFF | ((v16 & 0xF) << 18)) << 8) | 1;
            uint64_t v14 = [v9 version];
            *((_DWORD *)v28 + 6) = v14;
            (*((void (**)(id, void *, void, void, uint64_t, uint64_t))v4 + 2))(v4, v9, 0, *((unsigned int *)v32 + 8), v14, v12);
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v15 = [v5 countByEnumeratingWithState:&v23 objects:v36 count:16];
        uint64_t v6 = v15;
      }
      while (v15);
    }

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
  }
}

uint64_t __81__GEOActiveTileGroup_GEOResourceManifestManagerAdditions__iterateActiveTileSets___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = ([*(id *)(a1 + 32) style] << 8) | (v4 << 16) | 2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(_DWORD *)(a2 + 8);
  double v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v5();
}

- (id)muninBucketURLForId:(unsigned __int16)a3 lod:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  int v5 = a3;
  if ([(GEOActiveTileGroup *)self muninBucketsCount])
  {
    unsigned int v7 = 0;
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    do
    {
      int v10 = [(GEOActiveTileGroup *)self muninBucketAtIndex:v8];
      if ([v10 hasLodLevel]
        && [v10 hasBucketID]
        && [v10 bucketID] == v5
        && [v10 hasBucketURL])
      {
        if ([v10 lodLevel] == v4)
        {
          uint64_t v13 = [v10 bucketURL];

          goto LABEL_24;
        }
        if ([v10 lodLevel] < v4 && objc_msgSend(v10, "lodLevel") >= v7)
        {
          unsigned int v7 = [v10 lodLevel];
          uint64_t v11 = [v10 bucketURL];

          uint64_t v9 = (__CFString *)v11;
        }
      }

      ++v8;
    }
    while (v8 < [(GEOActiveTileGroup *)self muninBucketsCount]);
    if (v9) {
      goto LABEL_25;
    }
  }
  if ([(GEOActiveTileGroup *)self muninBucketsCount])
  {
    uint64_t v12 = 0;
    while (1)
    {
      uint64_t v9 = [(GEOActiveTileGroup *)self muninBucketAtIndex:v12];
      if (([(__CFString *)v9 hasLodLevel] & 1) == 0
        && [(__CFString *)v9 hasBucketID]
        && [(__CFString *)v9 bucketID] == v5
        && [(__CFString *)v9 hasBucketURL])
      {
        break;
      }

      if (++v12 >= [(GEOActiveTileGroup *)self muninBucketsCount])
      {
        uint64_t v9 = &stru_1ED51F370;
        goto LABEL_25;
      }
    }
    uint64_t v13 = [(__CFString *)v9 bucketURL];
LABEL_24:

    uint64_t v9 = (__CFString *)v13;
  }
  else
  {
    uint64_t v9 = &stru_1ED51F370;
  }
LABEL_25:

  return v9;
}

- (void)populateRegionalResources:(void *)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    unsigned int v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v16 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ([v10 regionsCount])
          {
            id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            if ([v10 regionsCount])
            {
              unint64_t v12 = 0;
              do
              {
                memset(v17, 0, sizeof(v17));
                if (v10) {
                  [v10 regionAtIndex:v12];
                }
                uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v17 length:24];
                [v11 addObject:v13];

                ++v12;
              }
              while (v12 < [v10 regionsCount]);
            }
            uint64_t v14 = [v4 objectForKey:v11];
            if (!v14)
            {
              uint64_t v14 = objc_alloc_init(GEORegionalResourceSet);
              -[GEORegionalResourceSet setRegions:count:](v14, "setRegions:count:", [v10 regions], objc_msgSend(v10, "regionsCount"));
              [v4 setObject:v14 forKey:v11];
              [a1 addRegionalResource:v14];
            }
            uint64_t v15 = (void *)[v10 copy];
            [v15 clearRegions];
            [(GEORegionalResourceSet *)v14 addResource:v15];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }

    id v3 = v16;
  }
}

- (void)populateLegacyFormat
{
  id v3 = [(GEOActiveTileGroup *)self urlInfoSet];
  unsigned int v4 = [v3 resourcesURL];
  int v5 = [v4 hasUrl];

  if (v5)
  {
    uint64_t v6 = [(GEOActiveTileGroup *)self urlInfoSet];
    uint64_t v7 = [v6 resourcesURL];
    uint64_t v8 = [v7 url];
    [(GEOActiveTileGroup *)self setRegionalResourcesURLLegacy:v8];
  }
  uint64_t v9 = [(GEOActiveTileGroup *)self urlInfoSet];
  int v10 = [v9 searchAttributionManifestURL];
  int v11 = [v10 hasUrl];

  if (v11)
  {
    unint64_t v12 = [(GEOActiveTileGroup *)self urlInfoSet];
    uint64_t v13 = [v12 searchAttributionManifestURL];
    uint64_t v14 = [v13 url];
    [(GEOActiveTileGroup *)self setSearchAttributionManifestURLLegacy:v14];
  }
  uint64_t v15 = [(GEOActiveTileGroup *)self urlInfoSet];
  id v16 = [v15 directionsURL];
  int v17 = [v16 hasUrl];

  if (v17)
  {
    long long v18 = [(GEOActiveTileGroup *)self urlInfoSet];
    long long v19 = [v18 directionsURL];
    long long v20 = [v19 url];
    [(GEOActiveTileGroup *)self setDirectionsURLLegacy:v20];
  }
  long long v21 = [(GEOActiveTileGroup *)self urlInfoSet];
  int v22 = [v21 etaURL];
  int v23 = [v22 hasUrl];

  if (v23)
  {
    long long v24 = [(GEOActiveTileGroup *)self urlInfoSet];
    long long v25 = [v24 etaURL];
    long long v26 = [v25 url];
    [(GEOActiveTileGroup *)self setEtaURLLegacy:v26];
  }
  uint64_t v27 = [(GEOActiveTileGroup *)self urlInfoSet];
  long long v28 = [v27 batchReverseGeocoderURL];
  int v29 = [v28 hasUrl];

  if (v29)
  {
    int v30 = [(GEOActiveTileGroup *)self urlInfoSet];
    uint64_t v31 = [v30 batchReverseGeocoderURL];
    uint64_t v32 = [v31 url];
    [(GEOActiveTileGroup *)self setBatchReverseGeocoderURLLegacy:v32];
  }
  uint64_t v33 = [(GEOActiveTileGroup *)self urlInfoSet];
  long long v34 = [v33 resourcesURL];
  int v35 = [v34 hasUrl];

  if (v35)
  {
    long long v36 = [(GEOActiveTileGroup *)self urlInfoSet];
    uint64_t v37 = [v36 resourcesURL];
    uint64_t v38 = [v37 url];
    [(GEOActiveTileGroup *)self setResourcesURLLegacy:v38];
  }
  uint64_t v39 = [(GEOActiveTileGroup *)self urlInfoSet];
  double v40 = [v39 simpleETAURL];
  int v41 = [v40 hasUrl];

  if (v41)
  {
    uint64_t v42 = [(GEOActiveTileGroup *)self urlInfoSet];
    uint64_t v43 = [v42 simpleETAURL];
    uint64_t v44 = [v43 url];
    [(GEOActiveTileGroup *)self setSimpleETAURLLegacy:v44];
  }
  uint64_t v45 = [(GEOActiveTileGroup *)self urlInfoSet];
  uint64_t v46 = [v45 addressCorrectionInitURL];
  int v47 = [v46 hasUrl];

  if (v47)
  {
    uint64_t v48 = [(GEOActiveTileGroup *)self urlInfoSet];
    uint64_t v49 = [v48 addressCorrectionInitURL];
    uint64_t v50 = [v49 url];
    [(GEOActiveTileGroup *)self setAddressCorrectionInitURLLegacy:v50];
  }
  uint64_t v51 = [(GEOActiveTileGroup *)self urlInfoSet];
  uint64_t v52 = [v51 addressCorrectionUpdateURL];
  int v53 = [v52 hasUrl];

  if (v53)
  {
    uint64_t v54 = [(GEOActiveTileGroup *)self urlInfoSet];
    uint64_t v55 = [v54 addressCorrectionUpdateURL];
    id v56 = [v55 url];
    [(GEOActiveTileGroup *)self setAddressCorrectionUpdateURLLegacy:v56];
  }
  long long v57 = [(GEOActiveTileGroup *)self urlInfoSet];
  long long v58 = [v57 polyLocationShiftURL];
  int v59 = [v58 hasUrl];

  if (v59)
  {
    long long v60 = [(GEOActiveTileGroup *)self urlInfoSet];
    long long v61 = [v60 polyLocationShiftURL];
    long long v62 = [v61 url];
    [(GEOActiveTileGroup *)self setPolyLocationShiftURLLegacy:v62];
  }
  long long v63 = [(GEOActiveTileGroup *)self urlInfoSet];
  long long v64 = [v63 problemSubmissionURL];
  int v65 = [v64 hasUrl];

  if (v65)
  {
    uint64_t v66 = [(GEOActiveTileGroup *)self urlInfoSet];
    uint64_t v67 = [v66 problemSubmissionURL];
    long long v68 = [v67 url];
    [(GEOActiveTileGroup *)self setProblemSubmissionURLLegacy:v68];
  }
  long long v69 = [(GEOActiveTileGroup *)self urlInfoSet];
  uint64_t v70 = [v69 problemStatusURL];
  int v71 = [v70 hasUrl];

  if (v71)
  {
    long long v72 = [(GEOActiveTileGroup *)self urlInfoSet];
    long long v73 = [v72 problemStatusURL];
    long long v74 = [v73 url];
    [(GEOActiveTileGroup *)self setProblemStatusURLLegacy:v74];
  }
  long long v75 = [(GEOActiveTileGroup *)self urlInfoSet];
  long long v76 = [v75 reverseGeocoderVersionsURL];
  int v77 = [v76 hasUrl];

  if (v77)
  {
    long long v78 = [(GEOActiveTileGroup *)self urlInfoSet];
    long long v79 = [v78 reverseGeocoderVersionsURL];
    long long v80 = [v79 url];
    [(GEOActiveTileGroup *)self setReverseGeocoderVersionsURLLegacy:v80];
  }
  long long v81 = [(GEOActiveTileGroup *)self urlInfoSet];
  long long v82 = [v81 problemCategoriesURL];
  int v83 = [v82 hasUrl];

  if (v83)
  {
    long long v84 = [(GEOActiveTileGroup *)self urlInfoSet];
    long long v85 = [v84 problemCategoriesURL];
    long long v86 = [v85 url];
    [(GEOActiveTileGroup *)self setProblemCategoriesURLLegacy:v86];
  }
  long long v87 = [(GEOActiveTileGroup *)self urlInfoSet];
  long long v88 = [v87 announcementsURL];
  int v89 = [v88 hasUrl];

  if (v89)
  {
    long long v90 = [(GEOActiveTileGroup *)self urlInfoSet];
    long long v91 = [v90 announcementsURL];
    long long v92 = [v91 url];
    [(GEOActiveTileGroup *)self setAnnouncementsURLLegacy:v92];
  }
  long long v93 = [(GEOActiveTileGroup *)self urlInfoSet];
  long long v94 = [v93 dispatcherURL];
  int v95 = [v94 hasUrl];

  if (v95)
  {
    long long v96 = [(GEOActiveTileGroup *)self urlInfoSet];
    long long v97 = [v96 dispatcherURL];
    long long v98 = [v97 url];
    [(GEOActiveTileGroup *)self setDispatcherURLLegacy:v98];
  }
  long long v99 = [(GEOActiveTileGroup *)self urlInfoSet];
  long long v100 = [v99 problemOptInURL];
  int v101 = [v100 hasUrl];

  if (v101)
  {
    long long v102 = [(GEOActiveTileGroup *)self urlInfoSet];
    long long v103 = [v102 problemOptInURL];
    long long v104 = [v103 url];
    [(GEOActiveTileGroup *)self setProblemOptInURLLegacy:v104];
  }
  long long v105 = [(GEOActiveTileGroup *)self urlInfoSet];
  long long v106 = [v105 abExperimentURL];
  int v107 = [v106 hasUrl];

  if (v107)
  {
    uint64_t v108 = [(GEOActiveTileGroup *)self urlInfoSet];
    uint64_t v109 = [v108 abExperimentURL];
    uint64_t v110 = [v109 url];
    [(GEOActiveTileGroup *)self setAbExperimentURLLegacy:v110];
  }
  id v111 = [(GEOActiveTileGroup *)self urlInfoSet];
  uint64_t v112 = [v111 businessPortalBaseURL];
  int v113 = [v112 hasUrl];

  if (v113)
  {
    uint64_t v114 = [(GEOActiveTileGroup *)self urlInfoSet];
    uint64_t v115 = [v114 businessPortalBaseURL];
    uint64_t v116 = [v115 url];
    [(GEOActiveTileGroup *)self setBusinessPortalBaseURLLegacy:v116];
  }
  uint64_t v117 = [(GEOActiveTileGroup *)self urlInfoSet];
  uint64_t v118 = [v117 logMessageUsageURL];
  int v119 = [v118 hasUrl];

  if (v119)
  {
    id v120 = [(GEOActiveTileGroup *)self urlInfoSet];
    uint64_t v121 = [v120 logMessageUsageURL];
    uint64_t v122 = [v121 url];
    [(GEOActiveTileGroup *)self setLogMessageUsageURLLegacy:v122];
  }
  uint64_t v123 = [(GEOActiveTileGroup *)self urlInfoSet];
  long long v124 = [v123 spatialLookupURL];
  int v125 = [v124 hasUrl];

  if (v125)
  {
    uint64_t v126 = [(GEOActiveTileGroup *)self urlInfoSet];
    uint64_t v127 = [v126 spatialLookupURL];
    uint64_t v128 = [v127 url];
    [(GEOActiveTileGroup *)self setSpatialLookupURLLegacy:v128];
  }
  uint64_t v129 = [(GEOActiveTileGroup *)self urlInfoSet];
  id v130 = [v129 realtimeTrafficProbeURL];
  int v131 = [v130 hasUrl];

  if (v131)
  {
    uint64_t v132 = [(GEOActiveTileGroup *)self urlInfoSet];
    uint64_t v133 = [v132 realtimeTrafficProbeURL];
    long long v134 = [v133 url];
    [(GEOActiveTileGroup *)self setRealtimeTrafficProbeURLLegacy:v134];
  }
  long long v135 = [(GEOActiveTileGroup *)self urlInfoSet];
  uint64_t v136 = [v135 batchTrafficProbeURL];
  int v137 = [v136 hasUrl];

  if (v137)
  {
    long long v138 = [(GEOActiveTileGroup *)self urlInfoSet];
    uint64_t v139 = [v138 batchTrafficProbeURL];
    long long v140 = [v139 url];
    [(GEOActiveTileGroup *)self setBatchTrafficProbeURLLegacy:v140];
  }
  uint64_t v141 = [(GEOActiveTileGroup *)self urlInfoSet];
  long long v142 = [v141 logMessageUsageV3URL];
  int v143 = [v142 hasUrl];

  if (v143)
  {
    long long v144 = [(GEOActiveTileGroup *)self urlInfoSet];
    long long v145 = [v144 logMessageUsageV3URL];
    long long v146 = [v145 url];
    [(GEOActiveTileGroup *)self setLogMessageUsageV3URLLegacy:v146];
  }
  long long v147 = [(GEOActiveTileGroup *)self urlInfoSet];
  long long v148 = [v147 proactiveRoutingURL];
  int v149 = [v148 hasUrl];

  if (v149)
  {
    long long v150 = [(GEOActiveTileGroup *)self urlInfoSet];
    long long v151 = [v150 proactiveRoutingURL];
    long long v152 = [v151 url];
    [(GEOActiveTileGroup *)self setProactiveRoutingURLLegacy:v152];
  }
  long long v153 = [(GEOActiveTileGroup *)self urlInfoSet];
  long long v154 = [v153 backgroundDispatcherURL];
  int v155 = [v154 hasUrl];

  if (v155)
  {
    long long v156 = [(GEOActiveTileGroup *)self urlInfoSet];
    long long v157 = [v156 backgroundDispatcherURL];
    long long v158 = [v157 url];
    [(GEOActiveTileGroup *)self setBackgroundDispatcherURLLegacy:v158];
  }
  long long v159 = [(GEOActiveTileGroup *)self urlInfoSet];
  long long v160 = [v159 bluePOIDispatcherURL];
  int v161 = [v160 hasUrl];

  if (v161)
  {
    long long v162 = [(GEOActiveTileGroup *)self urlInfoSet];
    long long v163 = [v162 bluePOIDispatcherURL];
    long long v164 = [v163 url];
    [(GEOActiveTileGroup *)self setBluePOIURLLegacy:v164];
  }
  long long v165 = [(GEOActiveTileGroup *)self urlInfoSet];
  long long v166 = [v165 backgroundRevGeoURL];
  int v167 = [v166 hasUrl];

  if (v167)
  {
    long long v168 = [(GEOActiveTileGroup *)self urlInfoSet];
    long long v169 = [v168 backgroundRevGeoURL];
    long long v170 = [v169 url];
    [(GEOActiveTileGroup *)self setBackgroundRevGeoURLLegacy:v170];
  }
  long long v171 = [(GEOActiveTileGroup *)self urlInfoSet];
  long long v172 = [v171 wifiConnectionQualityProbeURL];
  int v173 = [v172 hasUrl];

  if (v173)
  {
    id v176 = [(GEOActiveTileGroup *)self urlInfoSet];
    long long v174 = [v176 wifiConnectionQualityProbeURL];
    long long v175 = [v174 url];
    [(GEOActiveTileGroup *)self setWifiConnectionQualityProbeURLLegacy:v175];
  }
}

- (void)clearModernFormatFields
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unsigned int v4 = [(GEOActiveTileGroup *)self attributions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 regionsCount]) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  int v10 = [(GEOActiveTileGroup *)self attributions];
  [v10 removeObjectsInArray:v3];

  [(GEOActiveTileGroup *)self clearActiveResources];
  [(GEOActiveTileGroup *)self clearStaleResources];
  [(GEOActiveTileGroup *)self clearRegionalResources];
}

@end