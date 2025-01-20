@interface GEOResources
+ (BOOL)isValid:(id)a3;
+ (Class)announcementsSupportedLanguagesType;
+ (Class)attributionType;
+ (Class)dataSetType;
+ (Class)dataSetURLOverrideType;
+ (Class)displayStringsType;
+ (Class)fontChecksumType;
+ (Class)fontType;
+ (Class)iconChecksumType;
+ (Class)iconType;
+ (Class)locationShiftEnabledRegionType;
+ (Class)muninBucketType;
+ (Class)muninVersionType;
+ (Class)offlineMetadataType;
+ (Class)regionalResourceType;
+ (Class)resourceType;
+ (Class)styleSheetChecksumType;
+ (Class)styleSheetType;
+ (Class)textureChecksumType;
+ (Class)textureType;
+ (Class)tileGroupType;
+ (Class)tileSetType;
+ (Class)urlInfoSetType;
+ (Class)xmlChecksumType;
+ (Class)xmlType;
- (BOOL)hasAbExperimentURL;
- (BOOL)hasAddressCorrectionInitURL;
- (BOOL)hasAddressCorrectionUpdateURL;
- (BOOL)hasAnnouncementsURL;
- (BOOL)hasAuthProxyURL;
- (BOOL)hasAuthToken;
- (BOOL)hasBackgroundDispatcherURL;
- (BOOL)hasBackgroundRevGeoURL;
- (BOOL)hasBatchReverseGeocoderURL;
- (BOOL)hasBatchTrafficProbeURL;
- (BOOL)hasBluePOIDispatcherURL;
- (BOOL)hasBusinessPortalBaseURL;
- (BOOL)hasDirectionsURL;
- (BOOL)hasDispatcherURL;
- (BOOL)hasEtaURL;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLocationShiftVersion;
- (BOOL)hasLogMessageUsageURL;
- (BOOL)hasLogMessageUsageV3URL;
- (BOOL)hasMuninBaseURL;
- (BOOL)hasPolyLocationShiftURL;
- (BOOL)hasProactiveRoutingURL;
- (BOOL)hasProblemCategoriesURL;
- (BOOL)hasProblemOptInURL;
- (BOOL)hasProblemStatusURL;
- (BOOL)hasProblemSubmissionURL;
- (BOOL)hasRealtimeTrafficProbeURL;
- (BOOL)hasReleaseInfo;
- (BOOL)hasResourcesURL;
- (BOOL)hasReverseGeocoderVersionsURL;
- (BOOL)hasSearchAttributionManifestURL;
- (BOOL)hasSimpleETAURL;
- (BOOL)hasSpatialLookupURL;
- (BOOL)hasVersionManifest;
- (BOOL)hasWifiConnectionQualityProbeURL;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)readFrom:(id)a3;
- (GEOResources)init;
- (GEOResources)initWithData:(id)a3;
- (GEOResources)initWithDictionary:(id)a3;
- (GEOResources)initWithJSON:(id)a3;
- (GEOVersionManifest)versionManifest;
- (NSMutableArray)announcementsSupportedLanguages;
- (NSMutableArray)attributions;
- (NSMutableArray)dataSetURLOverrides;
- (NSMutableArray)dataSets;
- (NSMutableArray)displayStrings;
- (NSMutableArray)fontChecksums;
- (NSMutableArray)fonts;
- (NSMutableArray)iconChecksums;
- (NSMutableArray)icons;
- (NSMutableArray)locationShiftEnabledRegions;
- (NSMutableArray)muninBuckets;
- (NSMutableArray)muninVersions;
- (NSMutableArray)offlineMetadatas;
- (NSMutableArray)regionalResources;
- (NSMutableArray)resources;
- (NSMutableArray)styleSheetChecksums;
- (NSMutableArray)styleSheets;
- (NSMutableArray)textureChecksums;
- (NSMutableArray)textures;
- (NSMutableArray)tileGroups;
- (NSMutableArray)tileSets;
- (NSMutableArray)urlInfoSets;
- (NSMutableArray)xmlChecksums;
- (NSMutableArray)xmls;
- (NSString)abExperimentURL;
- (NSString)addressCorrectionInitURL;
- (NSString)addressCorrectionUpdateURL;
- (NSString)announcementsURL;
- (NSString)authProxyURL;
- (NSString)authToken;
- (NSString)backgroundDispatcherURL;
- (NSString)backgroundRevGeoURL;
- (NSString)batchReverseGeocoderURL;
- (NSString)batchTrafficProbeURL;
- (NSString)bluePOIDispatcherURL;
- (NSString)businessPortalBaseURL;
- (NSString)directionsURL;
- (NSString)dispatcherURL;
- (NSString)etaURL;
- (NSString)logMessageUsageURL;
- (NSString)logMessageUsageV3URL;
- (NSString)muninBaseURL;
- (NSString)polyLocationShiftURL;
- (NSString)proactiveRoutingURL;
- (NSString)problemCategoriesURL;
- (NSString)problemOptInURL;
- (NSString)problemStatusURL;
- (NSString)problemSubmissionURL;
- (NSString)realtimeTrafficProbeURL;
- (NSString)releaseInfo;
- (NSString)resourcesURL;
- (NSString)reverseGeocoderVersionsURL;
- (NSString)searchAttributionManifestURL;
- (NSString)simpleETAURL;
- (NSString)spatialLookupURL;
- (NSString)wifiConnectionQualityProbeURL;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:isJSON:;
- (id)announcementsSupportedLanguagesAtIndex:(unint64_t)a3;
- (id)attributionAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataSetAtIndex:(unint64_t)a3;
- (id)dataSetURLOverrideAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayStringsAtIndex:(unint64_t)a3;
- (id)fontAtIndex:(unint64_t)a3;
- (id)fontChecksumAtIndex:(unint64_t)a3;
- (id)iconAtIndex:(unint64_t)a3;
- (id)iconChecksumAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)locationShiftEnabledRegionAtIndex:(unint64_t)a3;
- (id)muninBucketAtIndex:(unint64_t)a3;
- (id)muninVersionAtIndex:(unint64_t)a3;
- (id)offlineMetadataAtIndex:(unint64_t)a3;
- (id)preferedURLSetFor:(id)a3;
- (id)preferredDataSetForClientDatasetMetadata:(id)a3;
- (id)preferredDataSetForMapsABClient;
- (id)regionalResourceAtIndex:(unint64_t)a3;
- (id)resourceAtIndex:(unint64_t)a3;
- (id)styleSheetAtIndex:(unint64_t)a3;
- (id)styleSheetChecksumAtIndex:(unint64_t)a3;
- (id)textureAtIndex:(unint64_t)a3;
- (id)textureChecksumAtIndex:(unint64_t)a3;
- (id)tileGroupAtIndex:(unint64_t)a3;
- (id)tileSetAtIndex:(unint64_t)a3;
- (id)urlInfoSetAtIndex:(unint64_t)a3;
- (id)xmlAtIndex:(unint64_t)a3;
- (id)xmlChecksumAtIndex:(unint64_t)a3;
- (unint64_t)announcementsSupportedLanguagesCount;
- (unint64_t)attributionsCount;
- (unint64_t)dataSetURLOverridesCount;
- (unint64_t)dataSetsCount;
- (unint64_t)displayStringsCount;
- (unint64_t)fontChecksumsCount;
- (unint64_t)fontsCount;
- (unint64_t)hash;
- (unint64_t)iconChecksumsCount;
- (unint64_t)iconsCount;
- (unint64_t)locationShiftEnabledRegionsCount;
- (unint64_t)muninBucketsCount;
- (unint64_t)muninVersionsCount;
- (unint64_t)offlineMetadatasCount;
- (unint64_t)regionalResourcesCount;
- (unint64_t)resourcesCount;
- (unint64_t)styleSheetChecksumsCount;
- (unint64_t)styleSheetsCount;
- (unint64_t)textureChecksumsCount;
- (unint64_t)texturesCount;
- (unint64_t)tileGroupsCount;
- (unint64_t)tileSetsCount;
- (unint64_t)urlInfoSetsCount;
- (unint64_t)xmlChecksumsCount;
- (unint64_t)xmlsCount;
- (unsigned)locationShiftVersion;
- (void)_addNoFlagsAnnouncementsSupportedLanguages:(uint64_t)a1;
- (void)_addNoFlagsAttribution:(uint64_t)a1;
- (void)_addNoFlagsDataSet:(uint64_t)a1;
- (void)_addNoFlagsDataSetURLOverride:(uint64_t)a1;
- (void)_addNoFlagsDisplayStrings:(uint64_t)a1;
- (void)_addNoFlagsFont:(uint64_t)a1;
- (void)_addNoFlagsFontChecksum:(uint64_t)a1;
- (void)_addNoFlagsIcon:(uint64_t)a1;
- (void)_addNoFlagsIconChecksum:(uint64_t)a1;
- (void)_addNoFlagsLocationShiftEnabledRegion:(uint64_t)a1;
- (void)_addNoFlagsMuninBucket:(uint64_t)a1;
- (void)_addNoFlagsMuninVersion:(uint64_t)a1;
- (void)_addNoFlagsOfflineMetadata:(uint64_t)a1;
- (void)_addNoFlagsRegionalResource:(uint64_t)a1;
- (void)_addNoFlagsResource:(uint64_t)a1;
- (void)_addNoFlagsStyleSheet:(uint64_t)a1;
- (void)_addNoFlagsStyleSheetChecksum:(uint64_t)a1;
- (void)_addNoFlagsTexture:(uint64_t)a1;
- (void)_addNoFlagsTextureChecksum:(uint64_t)a1;
- (void)_addNoFlagsTileGroup:(uint64_t)a1;
- (void)_addNoFlagsTileSet:(uint64_t)a1;
- (void)_addNoFlagsUrlInfoSet:(uint64_t)a1;
- (void)_addNoFlagsXml:(uint64_t)a1;
- (void)_addNoFlagsXmlChecksum:(uint64_t)a1;
- (void)_readAbExperimentURL;
- (void)_readAddressCorrectionInitURL;
- (void)_readAddressCorrectionUpdateURL;
- (void)_readAnnouncementsSupportedLanguages;
- (void)_readAnnouncementsURL;
- (void)_readAttributions;
- (void)_readAuthProxyURL;
- (void)_readAuthToken;
- (void)_readBackgroundDispatcherURL;
- (void)_readBackgroundRevGeoURL;
- (void)_readBatchReverseGeocoderURL;
- (void)_readBatchTrafficProbeURL;
- (void)_readBluePOIDispatcherURL;
- (void)_readBusinessPortalBaseURL;
- (void)_readDataSetURLOverrides;
- (void)_readDataSets;
- (void)_readDirectionsURL;
- (void)_readDispatcherURL;
- (void)_readDisplayStrings;
- (void)_readEtaURL;
- (void)_readFontChecksums;
- (void)_readFonts;
- (void)_readIconChecksums;
- (void)_readIcons;
- (void)_readLocationShiftEnabledRegions;
- (void)_readLogMessageUsageURL;
- (void)_readLogMessageUsageV3URL;
- (void)_readMuninBaseURL;
- (void)_readMuninBuckets;
- (void)_readMuninVersions;
- (void)_readOfflineMetadatas;
- (void)_readPolyLocationShiftURL;
- (void)_readProactiveRoutingURL;
- (void)_readProblemCategoriesURL;
- (void)_readProblemOptInURL;
- (void)_readProblemStatusURL;
- (void)_readProblemSubmissionURL;
- (void)_readRealtimeTrafficProbeURL;
- (void)_readRegionalResources;
- (void)_readReleaseInfo;
- (void)_readResources;
- (void)_readResourcesURL;
- (void)_readReverseGeocoderVersionsURL;
- (void)_readSearchAttributionManifestURL;
- (void)_readSimpleETAURL;
- (void)_readSpatialLookupURL;
- (void)_readStyleSheetChecksums;
- (void)_readStyleSheets;
- (void)_readTextureChecksums;
- (void)_readTextures;
- (void)_readTileGroups;
- (void)_readTileSets;
- (void)_readUrlInfoSets;
- (void)_readVersionManifest;
- (void)_readWifiConnectionQualityProbeURL;
- (void)_readXmlChecksums;
- (void)_readXmls;
- (void)addAnnouncementsSupportedLanguages:(id)a3;
- (void)addAttribution:(id)a3;
- (void)addDataSet:(id)a3;
- (void)addDataSetURLOverride:(id)a3;
- (void)addDisplayStrings:(id)a3;
- (void)addFont:(id)a3;
- (void)addFontChecksum:(id)a3;
- (void)addIcon:(id)a3;
- (void)addIconChecksum:(id)a3;
- (void)addLocationShiftEnabledRegion:(id)a3;
- (void)addMuninBucket:(id)a3;
- (void)addMuninVersion:(id)a3;
- (void)addOfflineMetadata:(id)a3;
- (void)addRegionalResource:(id)a3;
- (void)addResource:(id)a3;
- (void)addStyleSheet:(id)a3;
- (void)addStyleSheetChecksum:(id)a3;
- (void)addTexture:(id)a3;
- (void)addTextureChecksum:(id)a3;
- (void)addTileGroup:(id)a3;
- (void)addTileSet:(id)a3;
- (void)addUrlInfoSet:(id)a3;
- (void)addXml:(id)a3;
- (void)addXmlChecksum:(id)a3;
- (void)clearAnnouncementsSupportedLanguages;
- (void)clearAttributions;
- (void)clearDataSetURLOverrides;
- (void)clearDataSets;
- (void)clearDisplayStrings;
- (void)clearFontChecksums;
- (void)clearFonts;
- (void)clearIconChecksums;
- (void)clearIcons;
- (void)clearLocationShiftEnabledRegions;
- (void)clearMuninBuckets;
- (void)clearMuninVersions;
- (void)clearOfflineMetadatas;
- (void)clearRegionalResources;
- (void)clearResources;
- (void)clearStyleSheetChecksums;
- (void)clearStyleSheets;
- (void)clearTextureChecksums;
- (void)clearTextures;
- (void)clearTileGroups;
- (void)clearTileSets;
- (void)clearUnknownFields:(BOOL)a3;
- (void)clearUrlInfoSets;
- (void)clearXmlChecksums;
- (void)clearXmls;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAbExperimentURL:(id)a3;
- (void)setAddressCorrectionInitURL:(id)a3;
- (void)setAddressCorrectionUpdateURL:(id)a3;
- (void)setAnnouncementsSupportedLanguages:(id)a3;
- (void)setAnnouncementsURL:(id)a3;
- (void)setAttributions:(id)a3;
- (void)setAuthProxyURL:(id)a3;
- (void)setAuthToken:(id)a3;
- (void)setBackgroundDispatcherURL:(id)a3;
- (void)setBackgroundRevGeoURL:(id)a3;
- (void)setBatchReverseGeocoderURL:(id)a3;
- (void)setBatchTrafficProbeURL:(id)a3;
- (void)setBluePOIDispatcherURL:(id)a3;
- (void)setBusinessPortalBaseURL:(id)a3;
- (void)setDataSetURLOverrides:(id)a3;
- (void)setDataSets:(id)a3;
- (void)setDirectionsURL:(id)a3;
- (void)setDispatcherURL:(id)a3;
- (void)setDisplayStrings:(id)a3;
- (void)setEtaURL:(id)a3;
- (void)setFontChecksums:(id)a3;
- (void)setFonts:(id)a3;
- (void)setHasLocationShiftVersion:(BOOL)a3;
- (void)setIconChecksums:(id)a3;
- (void)setIcons:(id)a3;
- (void)setLocationShiftEnabledRegions:(id)a3;
- (void)setLocationShiftVersion:(unsigned int)a3;
- (void)setLogMessageUsageURL:(id)a3;
- (void)setLogMessageUsageV3URL:(id)a3;
- (void)setMuninBaseURL:(id)a3;
- (void)setMuninBuckets:(id)a3;
- (void)setMuninVersions:(id)a3;
- (void)setOfflineMetadatas:(id)a3;
- (void)setPolyLocationShiftURL:(id)a3;
- (void)setProactiveRoutingURL:(id)a3;
- (void)setProblemCategoriesURL:(id)a3;
- (void)setProblemOptInURL:(id)a3;
- (void)setProblemStatusURL:(id)a3;
- (void)setProblemSubmissionURL:(id)a3;
- (void)setRealtimeTrafficProbeURL:(id)a3;
- (void)setRegionalResources:(id)a3;
- (void)setReleaseInfo:(id)a3;
- (void)setResources:(id)a3;
- (void)setResourcesURL:(id)a3;
- (void)setReverseGeocoderVersionsURL:(id)a3;
- (void)setSearchAttributionManifestURL:(id)a3;
- (void)setSimpleETAURL:(id)a3;
- (void)setSpatialLookupURL:(id)a3;
- (void)setStyleSheetChecksums:(id)a3;
- (void)setStyleSheets:(id)a3;
- (void)setTextureChecksums:(id)a3;
- (void)setTextures:(id)a3;
- (void)setTileGroups:(id)a3;
- (void)setTileSets:(id)a3;
- (void)setUrlInfoSets:(id)a3;
- (void)setVersionManifest:(id)a3;
- (void)setWifiConnectionQualityProbeURL:(id)a3;
- (void)setXmlChecksums:(id)a3;
- (void)setXmls:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOResources

- (id)preferredDataSetForMapsABClient
{
  v3 = +[GEOExperimentConfiguration sharedConfiguration];
  v4 = [v3 _mapsAbClientMetadata];
  v5 = [v4 clientDatasetMetadata];

  v6 = [(GEOResources *)self preferredDataSetForClientDatasetMetadata:v5];

  return v6;
}

- (id)preferredDataSetForClientDatasetMetadata:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_GEOConfigHasValue(GeoServicesConfig_DataSetID, (uint64_t)off_1E9113BC8))
  {
    int UInteger = GEOConfigGetUInteger(GeoServicesConfig_DataSetID, (uint64_t)off_1E9113BC8);
  }
  else
  {
    if (![v4 hasDatasetId]) {
      goto LABEL_15;
    }
    int UInteger = [v4 datasetId];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(GEOResources *)self dataSets];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
LABEL_7:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
      if ([v11 identifier] == UInteger) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          goto LABEL_7;
        }
        goto LABEL_13;
      }
    }
    id v12 = v11;

    if (v12) {
      goto LABEL_16;
    }
  }
  else
  {
LABEL_13:
  }
LABEL_15:
  v13 = [(GEOResources *)self dataSets];
  id v12 = [v13 firstObject];

LABEL_16:

  return v12;
}

- (NSMutableArray)dataSets
{
  -[GEOResources _readDataSets]((uint64_t)self);
  dataSets = self->_dataSets;

  return dataSets;
}

- (void)_readDataSets
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 498) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDataSets_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (unint64_t)tileGroupsCount
{
  -[GEOResources _readTileGroups]((uint64_t)self);
  tileGroups = self->_tileGroups;

  return [(NSMutableArray *)tileGroups count];
}

- (void)_readTileGroups
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 502) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTileGroups_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (id)tileGroupAtIndex:(unint64_t)a3
{
  -[GEOResources _readTileGroups]((uint64_t)self);
  tileGroups = self->_tileGroups;

  return (id)[(NSMutableArray *)tileGroups objectAtIndex:a3];
}

- (id)preferedURLSetFor:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = [(GEOResources *)self urlInfoSets];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v5)
  {

    id v8 = 0;
    uint64_t v7 = 0;
    goto LABEL_21;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  id v8 = 0;
  uint64_t v9 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v22 != v9) {
        objc_enumerationMutation(v4);
      }
      v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      if (![v11 hasDataSet])
      {
        v14 = v8;
        long long v15 = v7;
        id v8 = v11;
LABEL_12:
        id v16 = v11;

        uint64_t v7 = v15;
        continue;
      }
      int v12 = [v11 hasDataSet];
      if (v20)
      {
        if (v12)
        {
          int v13 = [v11 dataSet];
          v14 = v7;
          long long v15 = v11;
          if (v13 == [v20 identifier]) {
            goto LABEL_12;
          }
        }
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v6);

  if (!v8)
  {
LABEL_21:
    long long v17 = 0;
    goto LABEL_23;
  }
  if (v7)
  {
    long long v17 = (void *)[v8 copy];
    [v17 mergeFrom:v7];
    if ([v7 alternateResourcesURLsCount])
    {
      long long v18 = [v7 alternateResourcesURLs];
      [v17 setAlternateResourcesURLs:v18];
    }
    [v17 setDataSet:0];
    [v17 setHasDataSet:0];
  }
  else
  {
    id v8 = v8;
    long long v17 = v8;
  }
LABEL_23:

  return v17;
}

- (NSMutableArray)urlInfoSets
{
  -[GEOResources _readUrlInfoSets]((uint64_t)self);
  urlInfoSets = self->_urlInfoSets;

  return urlInfoSets;
}

- (void)_readUrlInfoSets
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 502) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUrlInfoSets_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xmls, 0);
  objc_storeStrong((id *)&self->_xmlChecksums, 0);
  objc_storeStrong((id *)&self->_wifiConnectionQualityProbeURL, 0);
  objc_storeStrong((id *)&self->_versionManifest, 0);
  objc_storeStrong((id *)&self->_urlInfoSets, 0);
  objc_storeStrong((id *)&self->_tileSets, 0);
  objc_storeStrong((id *)&self->_tileGroups, 0);
  objc_storeStrong((id *)&self->_textures, 0);
  objc_storeStrong((id *)&self->_textureChecksums, 0);
  objc_storeStrong((id *)&self->_styleSheets, 0);
  objc_storeStrong((id *)&self->_styleSheetChecksums, 0);
  objc_storeStrong((id *)&self->_spatialLookupURL, 0);
  objc_storeStrong((id *)&self->_simpleETAURL, 0);
  objc_storeStrong((id *)&self->_searchAttributionManifestURL, 0);
  objc_storeStrong((id *)&self->_reverseGeocoderVersionsURL, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_resourcesURL, 0);
  objc_storeStrong((id *)&self->_releaseInfo, 0);
  objc_storeStrong((id *)&self->_regionalResources, 0);
  objc_storeStrong((id *)&self->_realtimeTrafficProbeURL, 0);
  objc_storeStrong((id *)&self->_problemSubmissionURL, 0);
  objc_storeStrong((id *)&self->_problemStatusURL, 0);
  objc_storeStrong((id *)&self->_problemOptInURL, 0);
  objc_storeStrong((id *)&self->_problemCategoriesURL, 0);
  objc_storeStrong((id *)&self->_proactiveRoutingURL, 0);
  objc_storeStrong((id *)&self->_polyLocationShiftURL, 0);
  objc_storeStrong((id *)&self->_offlineMetadatas, 0);
  objc_storeStrong((id *)&self->_muninVersions, 0);
  objc_storeStrong((id *)&self->_muninBuckets, 0);
  objc_storeStrong((id *)&self->_muninBaseURL, 0);
  objc_storeStrong((id *)&self->_logMessageUsageV3URL, 0);
  objc_storeStrong((id *)&self->_logMessageUsageURL, 0);
  objc_storeStrong((id *)&self->_locationShiftEnabledRegions, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_iconChecksums, 0);
  objc_storeStrong((id *)&self->_fonts, 0);
  objc_storeStrong((id *)&self->_fontChecksums, 0);
  objc_storeStrong((id *)&self->_etaURL, 0);
  objc_storeStrong((id *)&self->_displayStrings, 0);
  objc_storeStrong((id *)&self->_dispatcherURL, 0);
  objc_storeStrong((id *)&self->_directionsURL, 0);
  objc_storeStrong((id *)&self->_dataSets, 0);
  objc_storeStrong((id *)&self->_dataSetURLOverrides, 0);
  objc_storeStrong((id *)&self->_businessPortalBaseURL, 0);
  objc_storeStrong((id *)&self->_bluePOIDispatcherURL, 0);
  objc_storeStrong((id *)&self->_batchTrafficProbeURL, 0);
  objc_storeStrong((id *)&self->_batchReverseGeocoderURL, 0);
  objc_storeStrong((id *)&self->_backgroundRevGeoURL, 0);
  objc_storeStrong((id *)&self->_backgroundDispatcherURL, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_authProxyURL, 0);
  objc_storeStrong((id *)&self->_attributions, 0);
  objc_storeStrong((id *)&self->_announcementsURL, 0);
  objc_storeStrong((id *)&self->_announcementsSupportedLanguages, 0);
  objc_storeStrong((id *)&self->_addressCorrectionUpdateURL, 0);
  objc_storeStrong((id *)&self->_addressCorrectionInitURL, 0);
  objc_storeStrong((id *)&self->_abExperimentURL, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v317 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 7) & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOResourcesReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_176;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOResources *)self readAll:0];
  long long v292 = 0u;
  long long v291 = 0u;
  long long v290 = 0u;
  long long v289 = 0u;
  uint64_t v9 = self->_tileGroups;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v289 objects:v316 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v290;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v290 != v11) {
          objc_enumerationMutation(v9);
        }
        int v13 = (void *)[*(id *)(*((void *)&v289 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addTileGroup:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v289 objects:v316 count:16];
    }
    while (v10);
  }

  long long v288 = 0u;
  long long v287 = 0u;
  long long v286 = 0u;
  long long v285 = 0u;
  v14 = self->_tileSets;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v285 objects:v315 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v286;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v286 != v16) {
          objc_enumerationMutation(v14);
        }
        long long v18 = (void *)[*(id *)(*((void *)&v285 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addTileSet:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v285 objects:v315 count:16];
    }
    while (v15);
  }

  long long v284 = 0u;
  long long v283 = 0u;
  long long v282 = 0u;
  long long v281 = 0u;
  v19 = self->_styleSheets;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v281 objects:v314 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v282;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v282 != v21) {
          objc_enumerationMutation(v19);
        }
        long long v23 = (void *)[*(id *)(*((void *)&v281 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addStyleSheet:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v281 objects:v314 count:16];
    }
    while (v20);
  }

  long long v280 = 0u;
  long long v279 = 0u;
  long long v278 = 0u;
  long long v277 = 0u;
  long long v24 = self->_textures;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v277 objects:v313 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v278;
    do
    {
      for (uint64_t m = 0; m != v25; ++m)
      {
        if (*(void *)v278 != v26) {
          objc_enumerationMutation(v24);
        }
        v28 = (void *)[*(id *)(*((void *)&v277 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addTexture:v28];
      }
      uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v277 objects:v313 count:16];
    }
    while (v25);
  }

  long long v276 = 0u;
  long long v275 = 0u;
  long long v274 = 0u;
  long long v273 = 0u;
  v29 = self->_fonts;
  uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v273 objects:v312 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v274;
    do
    {
      for (uint64_t n = 0; n != v30; ++n)
      {
        if (*(void *)v274 != v31) {
          objc_enumerationMutation(v29);
        }
        v33 = (void *)[*(id *)(*((void *)&v273 + 1) + 8 * n) copyWithZone:a3];
        [(id)v5 addFont:v33];
      }
      uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v273 objects:v312 count:16];
    }
    while (v30);
  }

  long long v272 = 0u;
  long long v271 = 0u;
  long long v270 = 0u;
  long long v269 = 0u;
  v34 = self->_icons;
  uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v269 objects:v311 count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v270;
    do
    {
      for (iuint64_t i = 0; ii != v35; ++ii)
      {
        if (*(void *)v270 != v36) {
          objc_enumerationMutation(v34);
        }
        v38 = (void *)[*(id *)(*((void *)&v269 + 1) + 8 * ii) copyWithZone:a3];
        [(id)v5 addIcon:v38];
      }
      uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v269 objects:v311 count:16];
    }
    while (v35);
  }

  long long v268 = 0u;
  long long v267 = 0u;
  long long v266 = 0u;
  long long v265 = 0u;
  v39 = self->_regionalResources;
  uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v265 objects:v310 count:16];
  if (v40)
  {
    uint64_t v41 = *(void *)v266;
    do
    {
      for (juint64_t j = 0; jj != v40; ++jj)
      {
        if (*(void *)v266 != v41) {
          objc_enumerationMutation(v39);
        }
        v43 = (void *)[*(id *)(*((void *)&v265 + 1) + 8 * jj) copyWithZone:a3];
        [(id)v5 addRegionalResource:v43];
      }
      uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v265 objects:v310 count:16];
    }
    while (v40);
  }

  long long v264 = 0u;
  long long v263 = 0u;
  long long v262 = 0u;
  long long v261 = 0u;
  v44 = self->_xmls;
  uint64_t v45 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v261 objects:v309 count:16];
  if (v45)
  {
    uint64_t v46 = *(void *)v262;
    do
    {
      for (kuint64_t k = 0; kk != v45; ++kk)
      {
        if (*(void *)v262 != v46) {
          objc_enumerationMutation(v44);
        }
        v48 = (void *)[*(id *)(*((void *)&v261 + 1) + 8 * kk) copyWithZone:a3];
        [(id)v5 addXml:v48];
      }
      uint64_t v45 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v261 objects:v309 count:16];
    }
    while (v45);
  }

  long long v259 = 0u;
  long long v260 = 0u;
  long long v257 = 0u;
  long long v258 = 0u;
  v49 = self->_attributions;
  uint64_t v50 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v257 objects:v308 count:16];
  if (v50)
  {
    uint64_t v51 = *(void *)v258;
    do
    {
      for (muint64_t m = 0; mm != v50; ++mm)
      {
        if (*(void *)v258 != v51) {
          objc_enumerationMutation(v49);
        }
        v53 = (void *)[*(id *)(*((void *)&v257 + 1) + 8 * mm) copyWithZone:a3];
        [(id)v5 addAttribution:v53];
      }
      uint64_t v50 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v257 objects:v308 count:16];
    }
    while (v50);
  }

  uint64_t v54 = [(NSString *)self->_authToken copyWithZone:a3];
  v55 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v54;

  uint64_t v56 = [(NSString *)self->_resourcesURL copyWithZone:a3];
  v57 = *(void **)(v5 + 344);
  *(void *)(v5 + 344) = v56;

  uint64_t v58 = [(NSString *)self->_searchAttributionManifestURL copyWithZone:a3];
  v59 = *(void **)(v5 + 368);
  *(void *)(v5 + 368) = v58;

  uint64_t v60 = [(NSString *)self->_directionsURL copyWithZone:a3];
  v61 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v60;

  uint64_t v62 = [(NSString *)self->_etaURL copyWithZone:a3];
  v63 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v62;

  uint64_t v64 = [(NSString *)self->_releaseInfo copyWithZone:a3];
  v65 = *(void **)(v5 + 336);
  *(void *)(v5 + 336) = v64;

  uint64_t v66 = [(NSString *)self->_batchReverseGeocoderURL copyWithZone:a3];
  v67 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v66;

  uint64_t v68 = [(NSString *)self->_simpleETAURL copyWithZone:a3];
  v69 = *(void **)(v5 + 376);
  *(void *)(v5 + 376) = v68;

  long long v255 = 0u;
  long long v256 = 0u;
  long long v253 = 0u;
  long long v254 = 0u;
  v70 = self->_styleSheetChecksums;
  uint64_t v71 = [(NSMutableArray *)v70 countByEnumeratingWithState:&v253 objects:v307 count:16];
  if (v71)
  {
    uint64_t v72 = *(void *)v254;
    do
    {
      for (nuint64_t n = 0; nn != v71; ++nn)
      {
        if (*(void *)v254 != v72) {
          objc_enumerationMutation(v70);
        }
        v74 = (void *)[*(id *)(*((void *)&v253 + 1) + 8 * nn) copyWithZone:a3];
        [(id)v5 addStyleSheetChecksum:v74];
      }
      uint64_t v71 = [(NSMutableArray *)v70 countByEnumeratingWithState:&v253 objects:v307 count:16];
    }
    while (v71);
  }

  long long v251 = 0u;
  long long v252 = 0u;
  long long v249 = 0u;
  long long v250 = 0u;
  v75 = self->_textureChecksums;
  uint64_t v76 = [(NSMutableArray *)v75 countByEnumeratingWithState:&v249 objects:v306 count:16];
  if (v76)
  {
    uint64_t v77 = *(void *)v250;
    do
    {
      for (uint64_t i1 = 0; i1 != v76; ++i1)
      {
        if (*(void *)v250 != v77) {
          objc_enumerationMutation(v75);
        }
        v79 = (void *)[*(id *)(*((void *)&v249 + 1) + 8 * i1) copyWithZone:a3];
        [(id)v5 addTextureChecksum:v79];
      }
      uint64_t v76 = [(NSMutableArray *)v75 countByEnumeratingWithState:&v249 objects:v306 count:16];
    }
    while (v76);
  }

  long long v247 = 0u;
  long long v248 = 0u;
  long long v245 = 0u;
  long long v246 = 0u;
  v80 = self->_fontChecksums;
  uint64_t v81 = [(NSMutableArray *)v80 countByEnumeratingWithState:&v245 objects:v305 count:16];
  if (v81)
  {
    uint64_t v82 = *(void *)v246;
    do
    {
      for (uint64_t i2 = 0; i2 != v81; ++i2)
      {
        if (*(void *)v246 != v82) {
          objc_enumerationMutation(v80);
        }
        v84 = (void *)[*(id *)(*((void *)&v245 + 1) + 8 * i2) copyWithZone:a3];
        [(id)v5 addFontChecksum:v84];
      }
      uint64_t v81 = [(NSMutableArray *)v80 countByEnumeratingWithState:&v245 objects:v305 count:16];
    }
    while (v81);
  }

  long long v243 = 0u;
  long long v244 = 0u;
  long long v241 = 0u;
  long long v242 = 0u;
  v85 = self->_iconChecksums;
  uint64_t v86 = [(NSMutableArray *)v85 countByEnumeratingWithState:&v241 objects:v304 count:16];
  if (v86)
  {
    uint64_t v87 = *(void *)v242;
    do
    {
      for (uint64_t i3 = 0; i3 != v86; ++i3)
      {
        if (*(void *)v242 != v87) {
          objc_enumerationMutation(v85);
        }
        v89 = (void *)[*(id *)(*((void *)&v241 + 1) + 8 * i3) copyWithZone:a3];
        [(id)v5 addIconChecksum:v89];
      }
      uint64_t v86 = [(NSMutableArray *)v85 countByEnumeratingWithState:&v241 objects:v304 count:16];
    }
    while (v86);
  }

  long long v239 = 0u;
  long long v240 = 0u;
  long long v237 = 0u;
  long long v238 = 0u;
  v90 = self->_xmlChecksums;
  uint64_t v91 = [(NSMutableArray *)v90 countByEnumeratingWithState:&v237 objects:v303 count:16];
  if (v91)
  {
    uint64_t v92 = *(void *)v238;
    do
    {
      for (uint64_t i4 = 0; i4 != v91; ++i4)
      {
        if (*(void *)v238 != v92) {
          objc_enumerationMutation(v90);
        }
        v94 = (void *)[*(id *)(*((void *)&v237 + 1) + 8 * i4) copyWithZone:a3];
        [(id)v5 addXmlChecksum:v94];
      }
      uint64_t v91 = [(NSMutableArray *)v90 countByEnumeratingWithState:&v237 objects:v303 count:16];
    }
    while (v91);
  }

  uint64_t v95 = [(NSString *)self->_addressCorrectionInitURL copyWithZone:a3];
  v96 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v95;

  uint64_t v97 = [(NSString *)self->_addressCorrectionUpdateURL copyWithZone:a3];
  v98 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v97;

  uint64_t v99 = [(NSString *)self->_polyLocationShiftURL copyWithZone:a3];
  v100 = *(void **)(v5 + 272);
  *(void *)(v5 + 272) = v99;

  uint64_t v101 = [(NSString *)self->_problemSubmissionURL copyWithZone:a3];
  v102 = *(void **)(v5 + 312);
  *(void *)(v5 + 312) = v101;

  uint64_t v103 = [(NSString *)self->_problemStatusURL copyWithZone:a3];
  v104 = *(void **)(v5 + 304);
  *(void *)(v5 + 304) = v103;

  uint64_t v105 = [(NSString *)self->_reverseGeocoderVersionsURL copyWithZone:a3];
  v106 = *(void **)(v5 + 360);
  *(void *)(v5 + 360) = v105;

  uint64_t v107 = [(NSString *)self->_problemCategoriesURL copyWithZone:a3];
  v108 = *(void **)(v5 + 288);
  *(void *)(v5 + 288) = v107;

  uint64_t v109 = [(NSString *)self->_announcementsURL copyWithZone:a3];
  v110 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v109;

  long long v235 = 0u;
  long long v236 = 0u;
  long long v233 = 0u;
  long long v234 = 0u;
  v111 = self->_announcementsSupportedLanguages;
  uint64_t v112 = [(NSMutableArray *)v111 countByEnumeratingWithState:&v233 objects:v302 count:16];
  if (v112)
  {
    uint64_t v113 = *(void *)v234;
    do
    {
      for (uint64_t i5 = 0; i5 != v112; ++i5)
      {
        if (*(void *)v234 != v113) {
          objc_enumerationMutation(v111);
        }
        v115 = (void *)[*(id *)(*((void *)&v233 + 1) + 8 * i5) copyWithZone:a3];
        [(id)v5 addAnnouncementsSupportedLanguages:v115];
      }
      uint64_t v112 = [(NSMutableArray *)v111 countByEnumeratingWithState:&v233 objects:v302 count:16];
    }
    while (v112);
  }

  uint64_t v116 = [(NSString *)self->_dispatcherURL copyWithZone:a3];
  v117 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v116;

  uint64_t v118 = [(NSString *)self->_problemOptInURL copyWithZone:a3];
  v119 = *(void **)(v5 + 296);
  *(void *)(v5 + 296) = v118;

  id v120 = [(GEOVersionManifest *)self->_versionManifest copyWithZone:a3];
  v121 = *(void **)(v5 + 448);
  *(void *)(v5 + 448) = v120;

  uint64_t v122 = [(NSString *)self->_abExperimentURL copyWithZone:a3];
  v123 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v122;

  uint64_t v124 = [(NSString *)self->_businessPortalBaseURL copyWithZone:a3];
  v125 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v124;

  uint64_t v126 = [(NSString *)self->_logMessageUsageURL copyWithZone:a3];
  v127 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v126;

  long long v231 = 0u;
  long long v232 = 0u;
  long long v229 = 0u;
  long long v230 = 0u;
  v128 = self->_locationShiftEnabledRegions;
  uint64_t v129 = [(NSMutableArray *)v128 countByEnumeratingWithState:&v229 objects:v301 count:16];
  if (v129)
  {
    uint64_t v130 = *(void *)v230;
    do
    {
      for (uint64_t i6 = 0; i6 != v129; ++i6)
      {
        if (*(void *)v230 != v130) {
          objc_enumerationMutation(v128);
        }
        v132 = (void *)[*(id *)(*((void *)&v229 + 1) + 8 * i6) copyWithZone:a3];
        [(id)v5 addLocationShiftEnabledRegion:v132];
      }
      uint64_t v129 = [(NSMutableArray *)v128 countByEnumeratingWithState:&v229 objects:v301 count:16];
    }
    while (v129);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 492) = self->_locationShiftVersion;
    *(void *)(v5 + 496) |= 1uLL;
  }
  long long v227 = 0u;
  long long v228 = 0u;
  long long v225 = 0u;
  long long v226 = 0u;
  v133 = self->_resources;
  uint64_t v134 = [(NSMutableArray *)v133 countByEnumeratingWithState:&v225 objects:v300 count:16];
  if (v134)
  {
    uint64_t v135 = *(void *)v226;
    do
    {
      for (uint64_t i7 = 0; i7 != v134; ++i7)
      {
        if (*(void *)v226 != v135) {
          objc_enumerationMutation(v133);
        }
        v137 = (void *)[*(id *)(*((void *)&v225 + 1) + 8 * i7) copyWithZone:a3];
        [(id)v5 addResource:v137];
      }
      uint64_t v134 = [(NSMutableArray *)v133 countByEnumeratingWithState:&v225 objects:v300 count:16];
    }
    while (v134);
  }

  uint64_t v138 = [(NSString *)self->_spatialLookupURL copyWithZone:a3];
  v139 = *(void **)(v5 + 384);
  *(void *)(v5 + 384) = v138;

  long long v223 = 0u;
  long long v224 = 0u;
  long long v221 = 0u;
  long long v222 = 0u;
  v140 = self->_dataSets;
  uint64_t v141 = [(NSMutableArray *)v140 countByEnumeratingWithState:&v221 objects:v299 count:16];
  if (v141)
  {
    uint64_t v142 = *(void *)v222;
    do
    {
      for (uint64_t i8 = 0; i8 != v141; ++i8)
      {
        if (*(void *)v222 != v142) {
          objc_enumerationMutation(v140);
        }
        v144 = (void *)[*(id *)(*((void *)&v221 + 1) + 8 * i8) copyWithZone:a3];
        [(id)v5 addDataSet:v144];
      }
      uint64_t v141 = [(NSMutableArray *)v140 countByEnumeratingWithState:&v221 objects:v299 count:16];
    }
    while (v141);
  }

  long long v219 = 0u;
  long long v220 = 0u;
  long long v217 = 0u;
  long long v218 = 0u;
  v145 = self->_dataSetURLOverrides;
  uint64_t v146 = [(NSMutableArray *)v145 countByEnumeratingWithState:&v217 objects:v298 count:16];
  if (v146)
  {
    uint64_t v147 = *(void *)v218;
    do
    {
      for (uint64_t i9 = 0; i9 != v146; ++i9)
      {
        if (*(void *)v218 != v147) {
          objc_enumerationMutation(v145);
        }
        v149 = (void *)[*(id *)(*((void *)&v217 + 1) + 8 * i9) copyWithZone:a3];
        [(id)v5 addDataSetURLOverride:v149];
      }
      uint64_t v146 = [(NSMutableArray *)v145 countByEnumeratingWithState:&v217 objects:v298 count:16];
    }
    while (v146);
  }

  uint64_t v150 = [(NSString *)self->_realtimeTrafficProbeURL copyWithZone:a3];
  v151 = *(void **)(v5 + 320);
  *(void *)(v5 + 320) = v150;

  uint64_t v152 = [(NSString *)self->_batchTrafficProbeURL copyWithZone:a3];
  v153 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v152;

  uint64_t v154 = [(NSString *)self->_proactiveRoutingURL copyWithZone:a3];
  v155 = *(void **)(v5 + 280);
  *(void *)(v5 + 280) = v154;

  uint64_t v156 = [(NSString *)self->_logMessageUsageV3URL copyWithZone:a3];
  v157 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = v156;

  uint64_t v158 = [(NSString *)self->_backgroundDispatcherURL copyWithZone:a3];
  v159 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v158;

  uint64_t v160 = [(NSString *)self->_bluePOIDispatcherURL copyWithZone:a3];
  v161 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v160;

  uint64_t v162 = [(NSString *)self->_backgroundRevGeoURL copyWithZone:a3];
  v163 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v162;

  uint64_t v164 = [(NSString *)self->_wifiConnectionQualityProbeURL copyWithZone:a3];
  v165 = *(void **)(v5 + 456);
  *(void *)(v5 + 456) = v164;

  uint64_t v166 = [(NSString *)self->_muninBaseURL copyWithZone:a3];
  v167 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v166;

  long long v215 = 0u;
  long long v216 = 0u;
  long long v213 = 0u;
  long long v214 = 0u;
  v168 = self->_muninVersions;
  uint64_t v169 = [(NSMutableArray *)v168 countByEnumeratingWithState:&v213 objects:v297 count:16];
  if (v169)
  {
    uint64_t v170 = *(void *)v214;
    do
    {
      for (uint64_t i10 = 0; i10 != v169; ++i10)
      {
        if (*(void *)v214 != v170) {
          objc_enumerationMutation(v168);
        }
        v172 = (void *)[*(id *)(*((void *)&v213 + 1) + 8 * i10) copyWithZone:a3];
        [(id)v5 addMuninVersion:v172];
      }
      uint64_t v169 = [(NSMutableArray *)v168 countByEnumeratingWithState:&v213 objects:v297 count:16];
    }
    while (v169);
  }

  uint64_t v173 = [(NSString *)self->_authProxyURL copyWithZone:a3];
  v174 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v173;

  long long v211 = 0u;
  long long v212 = 0u;
  long long v209 = 0u;
  long long v210 = 0u;
  v175 = self->_urlInfoSets;
  uint64_t v176 = [(NSMutableArray *)v175 countByEnumeratingWithState:&v209 objects:v296 count:16];
  if (v176)
  {
    uint64_t v177 = *(void *)v210;
    do
    {
      for (uint64_t i11 = 0; i11 != v176; ++i11)
      {
        if (*(void *)v210 != v177) {
          objc_enumerationMutation(v175);
        }
        v179 = (void *)[*(id *)(*((void *)&v209 + 1) + 8 * i11) copyWithZone:a3];
        [(id)v5 addUrlInfoSet:v179];
      }
      uint64_t v176 = [(NSMutableArray *)v175 countByEnumeratingWithState:&v209 objects:v296 count:16];
    }
    while (v176);
  }

  long long v207 = 0u;
  long long v208 = 0u;
  long long v205 = 0u;
  long long v206 = 0u;
  v180 = self->_muninBuckets;
  uint64_t v181 = [(NSMutableArray *)v180 countByEnumeratingWithState:&v205 objects:v295 count:16];
  if (v181)
  {
    uint64_t v182 = *(void *)v206;
    do
    {
      for (uint64_t i12 = 0; i12 != v181; ++i12)
      {
        if (*(void *)v206 != v182) {
          objc_enumerationMutation(v180);
        }
        v184 = (void *)[*(id *)(*((void *)&v205 + 1) + 8 * i12) copyWithZone:a3];
        [(id)v5 addMuninBucket:v184];
      }
      uint64_t v181 = [(NSMutableArray *)v180 countByEnumeratingWithState:&v205 objects:v295 count:16];
    }
    while (v181);
  }

  long long v203 = 0u;
  long long v204 = 0u;
  long long v201 = 0u;
  long long v202 = 0u;
  v185 = self->_displayStrings;
  uint64_t v186 = [(NSMutableArray *)v185 countByEnumeratingWithState:&v201 objects:v294 count:16];
  if (v186)
  {
    uint64_t v187 = *(void *)v202;
    do
    {
      for (uint64_t i13 = 0; i13 != v186; ++i13)
      {
        if (*(void *)v202 != v187) {
          objc_enumerationMutation(v185);
        }
        v189 = (void *)[*(id *)(*((void *)&v201 + 1) + 8 * i13) copyWithZone:a3];
        [(id)v5 addDisplayStrings:v189];
      }
      uint64_t v186 = [(NSMutableArray *)v185 countByEnumeratingWithState:&v201 objects:v294 count:16];
    }
    while (v186);
  }

  long long v199 = 0u;
  long long v200 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  v190 = self->_offlineMetadatas;
  uint64_t v191 = [(NSMutableArray *)v190 countByEnumeratingWithState:&v197 objects:v293 count:16];
  if (v191)
  {
    uint64_t v192 = *(void *)v198;
    do
    {
      for (uint64_t i14 = 0; i14 != v191; ++i14)
      {
        if (*(void *)v198 != v192) {
          objc_enumerationMutation(v190);
        }
        v194 = objc_msgSend(*(id *)(*((void *)&v197 + 1) + 8 * i14), "copyWithZone:", a3, (void)v197);
        [(id)v5 addOfflineMetadata:v194];
      }
      uint64_t v191 = [(NSMutableArray *)v190 countByEnumeratingWithState:&v197 objects:v293 count:16];
    }
    while (v191);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  id v195 = (id)v5;
LABEL_176:

  return (id)v5;
}

- (GEOResources)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOResources;
  v2 = [(GEOResources *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (void)writeTo:(id)a3
{
  uint64_t v224 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOResourcesIsDirty((uint64_t)self) & 1) == 0)
  {
    v102 = self->_reader;
    objc_sync_enter(v102);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v103 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v103];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v102);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOResources *)self readAll:0];
    long long v199 = 0u;
    long long v198 = 0u;
    long long v197 = 0u;
    long long v196 = 0u;
    objc_super v6 = self->_tileGroups;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v196 objects:v223 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v197;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v197 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v196 objects:v223 count:16];
      }
      while (v7);
    }

    long long v195 = 0u;
    long long v194 = 0u;
    long long v193 = 0u;
    long long v192 = 0u;
    uint64_t v10 = self->_tileSets;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v192 objects:v222 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v193;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v193 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v192 objects:v222 count:16];
      }
      while (v11);
    }

    long long v191 = 0u;
    long long v190 = 0u;
    long long v189 = 0u;
    long long v188 = 0u;
    v14 = self->_styleSheets;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v188 objects:v221 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v189;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v189 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteStringField();
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v188 objects:v221 count:16];
      }
      while (v15);
    }

    long long v187 = 0u;
    long long v186 = 0u;
    long long v185 = 0u;
    long long v184 = 0u;
    long long v18 = self->_textures;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v184 objects:v220 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v185;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v185 != v20) {
            objc_enumerationMutation(v18);
          }
          PBDataWriterWriteStringField();
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v184 objects:v220 count:16];
      }
      while (v19);
    }

    long long v183 = 0u;
    long long v182 = 0u;
    long long v181 = 0u;
    long long v180 = 0u;
    long long v22 = self->_fonts;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v180 objects:v219 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v181;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v181 != v24) {
            objc_enumerationMutation(v22);
          }
          PBDataWriterWriteStringField();
          ++v25;
        }
        while (v23 != v25);
        uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v180 objects:v219 count:16];
      }
      while (v23);
    }

    long long v179 = 0u;
    long long v178 = 0u;
    long long v177 = 0u;
    long long v176 = 0u;
    uint64_t v26 = self->_icons;
    uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v176 objects:v218 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v177;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v177 != v28) {
            objc_enumerationMutation(v26);
          }
          PBDataWriterWriteStringField();
          ++v29;
        }
        while (v27 != v29);
        uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v176 objects:v218 count:16];
      }
      while (v27);
    }

    long long v175 = 0u;
    long long v174 = 0u;
    long long v173 = 0u;
    long long v172 = 0u;
    uint64_t v30 = self->_regionalResources;
    uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v172 objects:v217 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v173;
      do
      {
        uint64_t v33 = 0;
        do
        {
          if (*(void *)v173 != v32) {
            objc_enumerationMutation(v30);
          }
          PBDataWriterWriteSubmessage();
          ++v33;
        }
        while (v31 != v33);
        uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v172 objects:v217 count:16];
      }
      while (v31);
    }

    long long v171 = 0u;
    long long v170 = 0u;
    long long v169 = 0u;
    long long v168 = 0u;
    v34 = self->_xmls;
    uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v168 objects:v216 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v169;
      do
      {
        uint64_t v37 = 0;
        do
        {
          if (*(void *)v169 != v36) {
            objc_enumerationMutation(v34);
          }
          PBDataWriterWriteStringField();
          ++v37;
        }
        while (v35 != v37);
        uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v168 objects:v216 count:16];
      }
      while (v35);
    }

    long long v166 = 0u;
    long long v167 = 0u;
    long long v164 = 0u;
    long long v165 = 0u;
    v38 = self->_attributions;
    uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v164 objects:v215 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v165;
      do
      {
        uint64_t v41 = 0;
        do
        {
          if (*(void *)v165 != v40) {
            objc_enumerationMutation(v38);
          }
          PBDataWriterWriteSubmessage();
          ++v41;
        }
        while (v39 != v41);
        uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v164 objects:v215 count:16];
      }
      while (v39);
    }

    if (self->_authToken) {
      PBDataWriterWriteStringField();
    }
    if (self->_resourcesURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_searchAttributionManifestURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_directionsURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_etaURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_releaseInfo) {
      PBDataWriterWriteStringField();
    }
    if (self->_batchReverseGeocoderURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_simpleETAURL) {
      PBDataWriterWriteStringField();
    }
    long long v162 = 0u;
    long long v163 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    v42 = self->_styleSheetChecksums;
    uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v160 objects:v214 count:16];
    if (v43)
    {
      uint64_t v44 = *(void *)v161;
      do
      {
        uint64_t v45 = 0;
        do
        {
          if (*(void *)v161 != v44) {
            objc_enumerationMutation(v42);
          }
          PBDataWriterWriteStringField();
          ++v45;
        }
        while (v43 != v45);
        uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v160 objects:v214 count:16];
      }
      while (v43);
    }

    long long v158 = 0u;
    long long v159 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    uint64_t v46 = self->_textureChecksums;
    uint64_t v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v156 objects:v213 count:16];
    if (v47)
    {
      uint64_t v48 = *(void *)v157;
      do
      {
        uint64_t v49 = 0;
        do
        {
          if (*(void *)v157 != v48) {
            objc_enumerationMutation(v46);
          }
          PBDataWriterWriteStringField();
          ++v49;
        }
        while (v47 != v49);
        uint64_t v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v156 objects:v213 count:16];
      }
      while (v47);
    }

    long long v154 = 0u;
    long long v155 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    uint64_t v50 = self->_fontChecksums;
    uint64_t v51 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v152 objects:v212 count:16];
    if (v51)
    {
      uint64_t v52 = *(void *)v153;
      do
      {
        uint64_t v53 = 0;
        do
        {
          if (*(void *)v153 != v52) {
            objc_enumerationMutation(v50);
          }
          PBDataWriterWriteStringField();
          ++v53;
        }
        while (v51 != v53);
        uint64_t v51 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v152 objects:v212 count:16];
      }
      while (v51);
    }

    long long v150 = 0u;
    long long v151 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    uint64_t v54 = self->_iconChecksums;
    uint64_t v55 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v148 objects:v211 count:16];
    if (v55)
    {
      uint64_t v56 = *(void *)v149;
      do
      {
        uint64_t v57 = 0;
        do
        {
          if (*(void *)v149 != v56) {
            objc_enumerationMutation(v54);
          }
          PBDataWriterWriteStringField();
          ++v57;
        }
        while (v55 != v57);
        uint64_t v55 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v148 objects:v211 count:16];
      }
      while (v55);
    }

    long long v146 = 0u;
    long long v147 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    uint64_t v58 = self->_xmlChecksums;
    uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v144 objects:v210 count:16];
    if (v59)
    {
      uint64_t v60 = *(void *)v145;
      do
      {
        uint64_t v61 = 0;
        do
        {
          if (*(void *)v145 != v60) {
            objc_enumerationMutation(v58);
          }
          PBDataWriterWriteStringField();
          ++v61;
        }
        while (v59 != v61);
        uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v144 objects:v210 count:16];
      }
      while (v59);
    }

    if (self->_addressCorrectionInitURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_addressCorrectionUpdateURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_polyLocationShiftURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_problemSubmissionURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_problemStatusURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_reverseGeocoderVersionsURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_problemCategoriesURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_announcementsURL) {
      PBDataWriterWriteStringField();
    }
    long long v142 = 0u;
    long long v143 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    uint64_t v62 = self->_announcementsSupportedLanguages;
    uint64_t v63 = [(NSMutableArray *)v62 countByEnumeratingWithState:&v140 objects:v209 count:16];
    if (v63)
    {
      uint64_t v64 = *(void *)v141;
      do
      {
        uint64_t v65 = 0;
        do
        {
          if (*(void *)v141 != v64) {
            objc_enumerationMutation(v62);
          }
          PBDataWriterWriteStringField();
          ++v65;
        }
        while (v63 != v65);
        uint64_t v63 = [(NSMutableArray *)v62 countByEnumeratingWithState:&v140 objects:v209 count:16];
      }
      while (v63);
    }

    if (self->_dispatcherURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_problemOptInURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_versionManifest) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_abExperimentURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_businessPortalBaseURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_logMessageUsageURL) {
      PBDataWriterWriteStringField();
    }
    long long v138 = 0u;
    long long v139 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    uint64_t v66 = self->_locationShiftEnabledRegions;
    uint64_t v67 = [(NSMutableArray *)v66 countByEnumeratingWithState:&v136 objects:v208 count:16];
    if (v67)
    {
      uint64_t v68 = *(void *)v137;
      do
      {
        uint64_t v69 = 0;
        do
        {
          if (*(void *)v137 != v68) {
            objc_enumerationMutation(v66);
          }
          PBDataWriterWriteSubmessage();
          ++v69;
        }
        while (v67 != v69);
        uint64_t v67 = [(NSMutableArray *)v66 countByEnumeratingWithState:&v136 objects:v208 count:16];
      }
      while (v67);
    }

    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    long long v134 = 0u;
    long long v135 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    v70 = self->_resources;
    uint64_t v71 = [(NSMutableArray *)v70 countByEnumeratingWithState:&v132 objects:v207 count:16];
    if (v71)
    {
      uint64_t v72 = *(void *)v133;
      do
      {
        uint64_t v73 = 0;
        do
        {
          if (*(void *)v133 != v72) {
            objc_enumerationMutation(v70);
          }
          PBDataWriterWriteSubmessage();
          ++v73;
        }
        while (v71 != v73);
        uint64_t v71 = [(NSMutableArray *)v70 countByEnumeratingWithState:&v132 objects:v207 count:16];
      }
      while (v71);
    }

    if (self->_spatialLookupURL) {
      PBDataWriterWriteStringField();
    }
    long long v130 = 0u;
    long long v131 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    v74 = self->_dataSets;
    uint64_t v75 = [(NSMutableArray *)v74 countByEnumeratingWithState:&v128 objects:v206 count:16];
    if (v75)
    {
      uint64_t v76 = *(void *)v129;
      do
      {
        uint64_t v77 = 0;
        do
        {
          if (*(void *)v129 != v76) {
            objc_enumerationMutation(v74);
          }
          PBDataWriterWriteSubmessage();
          ++v77;
        }
        while (v75 != v77);
        uint64_t v75 = [(NSMutableArray *)v74 countByEnumeratingWithState:&v128 objects:v206 count:16];
      }
      while (v75);
    }

    long long v126 = 0u;
    long long v127 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    v78 = self->_dataSetURLOverrides;
    uint64_t v79 = [(NSMutableArray *)v78 countByEnumeratingWithState:&v124 objects:v205 count:16];
    if (v79)
    {
      uint64_t v80 = *(void *)v125;
      do
      {
        uint64_t v81 = 0;
        do
        {
          if (*(void *)v125 != v80) {
            objc_enumerationMutation(v78);
          }
          PBDataWriterWriteSubmessage();
          ++v81;
        }
        while (v79 != v81);
        uint64_t v79 = [(NSMutableArray *)v78 countByEnumeratingWithState:&v124 objects:v205 count:16];
      }
      while (v79);
    }

    if (self->_realtimeTrafficProbeURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_batchTrafficProbeURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_proactiveRoutingURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_logMessageUsageV3URL) {
      PBDataWriterWriteStringField();
    }
    if (self->_backgroundDispatcherURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_bluePOIDispatcherURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_backgroundRevGeoURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_wifiConnectionQualityProbeURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_muninBaseURL) {
      PBDataWriterWriteStringField();
    }
    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    uint64_t v82 = self->_muninVersions;
    uint64_t v83 = [(NSMutableArray *)v82 countByEnumeratingWithState:&v120 objects:v204 count:16];
    if (v83)
    {
      uint64_t v84 = *(void *)v121;
      do
      {
        uint64_t v85 = 0;
        do
        {
          if (*(void *)v121 != v84) {
            objc_enumerationMutation(v82);
          }
          PBDataWriterWriteSubmessage();
          ++v85;
        }
        while (v83 != v85);
        uint64_t v83 = [(NSMutableArray *)v82 countByEnumeratingWithState:&v120 objects:v204 count:16];
      }
      while (v83);
    }

    if (self->_authProxyURL) {
      PBDataWriterWriteStringField();
    }
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    uint64_t v86 = self->_urlInfoSets;
    uint64_t v87 = [(NSMutableArray *)v86 countByEnumeratingWithState:&v116 objects:v203 count:16];
    if (v87)
    {
      uint64_t v88 = *(void *)v117;
      do
      {
        uint64_t v89 = 0;
        do
        {
          if (*(void *)v117 != v88) {
            objc_enumerationMutation(v86);
          }
          PBDataWriterWriteSubmessage();
          ++v89;
        }
        while (v87 != v89);
        uint64_t v87 = [(NSMutableArray *)v86 countByEnumeratingWithState:&v116 objects:v203 count:16];
      }
      while (v87);
    }

    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    v90 = self->_muninBuckets;
    uint64_t v91 = [(NSMutableArray *)v90 countByEnumeratingWithState:&v112 objects:v202 count:16];
    if (v91)
    {
      uint64_t v92 = *(void *)v113;
      do
      {
        uint64_t v93 = 0;
        do
        {
          if (*(void *)v113 != v92) {
            objc_enumerationMutation(v90);
          }
          PBDataWriterWriteSubmessage();
          ++v93;
        }
        while (v91 != v93);
        uint64_t v91 = [(NSMutableArray *)v90 countByEnumeratingWithState:&v112 objects:v202 count:16];
      }
      while (v91);
    }

    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    v94 = self->_displayStrings;
    uint64_t v95 = [(NSMutableArray *)v94 countByEnumeratingWithState:&v108 objects:v201 count:16];
    if (v95)
    {
      uint64_t v96 = *(void *)v109;
      do
      {
        uint64_t v97 = 0;
        do
        {
          if (*(void *)v109 != v96) {
            objc_enumerationMutation(v94);
          }
          PBDataWriterWriteSubmessage();
          ++v97;
        }
        while (v95 != v97);
        uint64_t v95 = [(NSMutableArray *)v94 countByEnumeratingWithState:&v108 objects:v201 count:16];
      }
      while (v95);
    }

    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    v98 = self->_offlineMetadatas;
    uint64_t v99 = [(NSMutableArray *)v98 countByEnumeratingWithState:&v104 objects:v200 count:16];
    if (v99)
    {
      uint64_t v100 = *(void *)v105;
      do
      {
        uint64_t v101 = 0;
        do
        {
          if (*(void *)v105 != v100) {
            objc_enumerationMutation(v98);
          }
          PBDataWriterWriteSubmessage();
          ++v101;
        }
        while (v99 != v101);
        uint64_t v99 = [(NSMutableArray *)v98 countByEnumeratingWithState:&v104 objects:v200 count:16];
      }
      while (v99);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v104);
  }
}

- (GEOResources)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOResources;
  id v3 = [(GEOResources *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (NSMutableArray)tileGroups
{
  -[GEOResources _readTileGroups]((uint64_t)self);
  tileGroups = self->_tileGroups;

  return tileGroups;
}

- (void)setTileGroups:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  tileGroups = self->_tileGroups;
  self->_tileGroups = v4;
}

- (void)clearTileGroups
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  tileGroups = self->_tileGroups;

  [(NSMutableArray *)tileGroups removeAllObjects];
}

- (void)addTileGroup:(id)a3
{
  id v4 = a3;
  -[GEOResources _readTileGroups]((uint64_t)self);
  -[GEOResources _addNoFlagsTileGroup:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsTileGroup:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 424);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 424);
      *(void *)(a1 + 424) = v5;

      id v4 = *(void **)(a1 + 424);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

+ (Class)tileGroupType
{
  return (Class)objc_opt_class();
}

- (void)_readTileSets
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 502) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTileSets_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)tileSets
{
  -[GEOResources _readTileSets]((uint64_t)self);
  tileSets = self->_tileSets;

  return tileSets;
}

- (void)setTileSets:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  tileSets = self->_tileSets;
  self->_tileSets = v4;
}

- (void)clearTileSets
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  tileSets = self->_tileSets;

  [(NSMutableArray *)tileSets removeAllObjects];
}

- (void)addTileSet:(id)a3
{
  id v4 = a3;
  -[GEOResources _readTileSets]((uint64_t)self);
  -[GEOResources _addNoFlagsTileSet:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsTileSet:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 432);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 432);
      *(void *)(a1 + 432) = v5;

      id v4 = *(void **)(a1 + 432);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)tileSetsCount
{
  -[GEOResources _readTileSets]((uint64_t)self);
  tileSets = self->_tileSets;

  return [(NSMutableArray *)tileSets count];
}

- (id)tileSetAtIndex:(unint64_t)a3
{
  -[GEOResources _readTileSets]((uint64_t)self);
  tileSets = self->_tileSets;

  return (id)[(NSMutableArray *)tileSets objectAtIndex:a3];
}

+ (Class)tileSetType
{
  return (Class)objc_opt_class();
}

- (void)_readStyleSheets
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 502) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleSheets_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)styleSheets
{
  -[GEOResources _readStyleSheets]((uint64_t)self);
  styleSheets = self->_styleSheets;

  return styleSheets;
}

- (void)setStyleSheets:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  styleSheets = self->_styleSheets;
  self->_styleSheets = v4;
}

- (void)clearStyleSheets
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  styleSheets = self->_styleSheets;

  [(NSMutableArray *)styleSheets removeAllObjects];
}

- (void)addStyleSheet:(id)a3
{
  id v4 = a3;
  -[GEOResources _readStyleSheets]((uint64_t)self);
  -[GEOResources _addNoFlagsStyleSheet:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsStyleSheet:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 400);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 400);
      *(void *)(a1 + 400) = v5;

      id v4 = *(void **)(a1 + 400);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)styleSheetsCount
{
  -[GEOResources _readStyleSheets]((uint64_t)self);
  styleSheets = self->_styleSheets;

  return [(NSMutableArray *)styleSheets count];
}

- (id)styleSheetAtIndex:(unint64_t)a3
{
  -[GEOResources _readStyleSheets]((uint64_t)self);
  styleSheets = self->_styleSheets;

  return (id)[(NSMutableArray *)styleSheets objectAtIndex:a3];
}

+ (Class)styleSheetType
{
  return (Class)objc_opt_class();
}

- (void)_readTextures
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 502) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTextures_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)textures
{
  -[GEOResources _readTextures]((uint64_t)self);
  textures = self->_textures;

  return textures;
}

- (void)setTextures:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  textures = self->_textures;
  self->_textures = v4;
}

- (void)clearTextures
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  textures = self->_textures;

  [(NSMutableArray *)textures removeAllObjects];
}

- (void)addTexture:(id)a3
{
  id v4 = a3;
  -[GEOResources _readTextures]((uint64_t)self);
  -[GEOResources _addNoFlagsTexture:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsTexture:(uint64_t)a1
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

- (unint64_t)texturesCount
{
  -[GEOResources _readTextures]((uint64_t)self);
  textures = self->_textures;

  return [(NSMutableArray *)textures count];
}

- (id)textureAtIndex:(unint64_t)a3
{
  -[GEOResources _readTextures]((uint64_t)self);
  textures = self->_textures;

  return (id)[(NSMutableArray *)textures objectAtIndex:a3];
}

+ (Class)textureType
{
  return (Class)objc_opt_class();
}

- (void)_readFonts
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 498) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFonts_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)fonts
{
  -[GEOResources _readFonts]((uint64_t)self);
  fonts = self->_fonts;

  return fonts;
}

- (void)setFonts:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  fonts = self->_fonts;
  self->_fonts = v4;
}

- (void)clearFonts
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  fonts = self->_fonts;

  [(NSMutableArray *)fonts removeAllObjects];
}

- (void)addFont:(id)a3
{
  id v4 = a3;
  -[GEOResources _readFonts]((uint64_t)self);
  -[GEOResources _addNoFlagsFont:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsFont:(uint64_t)a1
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

- (unint64_t)fontsCount
{
  -[GEOResources _readFonts]((uint64_t)self);
  fonts = self->_fonts;

  return [(NSMutableArray *)fonts count];
}

- (id)fontAtIndex:(unint64_t)a3
{
  -[GEOResources _readFonts]((uint64_t)self);
  fonts = self->_fonts;

  return (id)[(NSMutableArray *)fonts objectAtIndex:a3];
}

+ (Class)fontType
{
  return (Class)objc_opt_class();
}

- (void)_readIcons
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 499) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIcons_tags_719);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)icons
{
  -[GEOResources _readIcons]((uint64_t)self);
  icons = self->_icons;

  return icons;
}

- (void)setIcons:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  icons = self->_icons;
  self->_icons = v4;
}

- (void)clearIcons
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  icons = self->_icons;

  [(NSMutableArray *)icons removeAllObjects];
}

- (void)addIcon:(id)a3
{
  id v4 = a3;
  -[GEOResources _readIcons]((uint64_t)self);
  -[GEOResources _addNoFlagsIcon:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsIcon:(uint64_t)a1
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

- (unint64_t)iconsCount
{
  -[GEOResources _readIcons]((uint64_t)self);
  icons = self->_icons;

  return [(NSMutableArray *)icons count];
}

- (id)iconAtIndex:(unint64_t)a3
{
  -[GEOResources _readIcons]((uint64_t)self);
  icons = self->_icons;

  return (id)[(NSMutableArray *)icons objectAtIndex:a3];
}

+ (Class)iconType
{
  return (Class)objc_opt_class();
}

- (void)_readRegionalResources
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 501) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRegionalResources_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)regionalResources
{
  -[GEOResources _readRegionalResources]((uint64_t)self);
  regionalResources = self->_regionalResources;

  return regionalResources;
}

- (void)setRegionalResources:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  regionalResources = self->_regionalResources;
  self->_regionalResources = v4;
}

- (void)clearRegionalResources
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  regionalResources = self->_regionalResources;

  [(NSMutableArray *)regionalResources removeAllObjects];
}

- (void)addRegionalResource:(id)a3
{
  id v4 = a3;
  -[GEOResources _readRegionalResources]((uint64_t)self);
  -[GEOResources _addNoFlagsRegionalResource:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsRegionalResource:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 328);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 328);
      *(void *)(a1 + 328) = v5;

      id v4 = *(void **)(a1 + 328);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)regionalResourcesCount
{
  -[GEOResources _readRegionalResources]((uint64_t)self);
  regionalResources = self->_regionalResources;

  return [(NSMutableArray *)regionalResources count];
}

- (id)regionalResourceAtIndex:(unint64_t)a3
{
  -[GEOResources _readRegionalResources]((uint64_t)self);
  regionalResources = self->_regionalResources;

  return (id)[(NSMutableArray *)regionalResources objectAtIndex:a3];
}

+ (Class)regionalResourceType
{
  return (Class)objc_opt_class();
}

- (void)_readXmls
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 503) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readXmls_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)xmls
{
  -[GEOResources _readXmls]((uint64_t)self);
  xmls = self->_xmls;

  return xmls;
}

- (void)setXmls:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  xmls = self->_xmls;
  self->_xmls = v4;
}

- (void)clearXmls
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  xmls = self->_xmls;

  [(NSMutableArray *)xmls removeAllObjects];
}

- (void)addXml:(id)a3
{
  id v4 = a3;
  -[GEOResources _readXmls]((uint64_t)self);
  -[GEOResources _addNoFlagsXml:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsXml:(uint64_t)a1
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

- (unint64_t)xmlsCount
{
  -[GEOResources _readXmls]((uint64_t)self);
  xmls = self->_xmls;

  return [(NSMutableArray *)xmls count];
}

- (id)xmlAtIndex:(unint64_t)a3
{
  -[GEOResources _readXmls]((uint64_t)self);
  xmls = self->_xmls;

  return (id)[(NSMutableArray *)xmls objectAtIndex:a3];
}

+ (Class)xmlType
{
  return (Class)objc_opt_class();
}

- (void)_readAttributions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 496) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttributions_tags_721);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)attributions
{
  -[GEOResources _readAttributions]((uint64_t)self);
  attributions = self->_attributions;

  return attributions;
}

- (void)setAttributions:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  attributions = self->_attributions;
  self->_attributions = v4;
}

- (void)clearAttributions
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  attributions = self->_attributions;

  [(NSMutableArray *)attributions removeAllObjects];
}

- (void)addAttribution:(id)a3
{
  id v4 = a3;
  -[GEOResources _readAttributions]((uint64_t)self);
  -[GEOResources _addNoFlagsAttribution:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsAttribution:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)attributionsCount
{
  -[GEOResources _readAttributions]((uint64_t)self);
  attributions = self->_attributions;

  return [(NSMutableArray *)attributions count];
}

- (id)attributionAtIndex:(unint64_t)a3
{
  -[GEOResources _readAttributions]((uint64_t)self);
  attributions = self->_attributions;

  return (id)[(NSMutableArray *)attributions objectAtIndex:a3];
}

+ (Class)attributionType
{
  return (Class)objc_opt_class();
}

- (void)_readAuthToken
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 497) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAuthToken_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasAuthToken
{
  return self->_authToken != 0;
}

- (NSString)authToken
{
  -[GEOResources _readAuthToken]((uint64_t)self);
  authTokeuint64_t n = self->_authToken;

  return authToken;
}

- (void)setAuthToken:(id)a3
{
  *(void *)&self->_flags |= 0x800000000000200uLL;
  objc_storeStrong((id *)&self->_authToken, a3);
}

- (void)_readResourcesURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 501) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResourcesURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasResourcesURL
{
  return self->_resourcesURL != 0;
}

- (NSString)resourcesURL
{
  -[GEOResources _readResourcesURL]((uint64_t)self);
  resourcesURL = self->_resourcesURL;

  return resourcesURL;
}

- (void)setResourcesURL:(id)a3
{
  *(void *)&self->_flags |= 0x800040000000000uLL;
  objc_storeStrong((id *)&self->_resourcesURL, a3);
}

- (void)_readSearchAttributionManifestURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 501) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchAttributionManifestURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasSearchAttributionManifestURL
{
  return self->_searchAttributionManifestURL != 0;
}

- (NSString)searchAttributionManifestURL
{
  -[GEOResources _readSearchAttributionManifestURL]((uint64_t)self);
  searchAttributionManifestURL = self->_searchAttributionManifestURL;

  return searchAttributionManifestURL;
}

- (void)setSearchAttributionManifestURL:(id)a3
{
  *(void *)&self->_flags |= 0x800200000000000uLL;
  objc_storeStrong((id *)&self->_searchAttributionManifestURL, a3);
}

- (void)_readDirectionsURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 498) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsURL_tags_722);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasDirectionsURL
{
  return self->_directionsURL != 0;
}

- (NSString)directionsURL
{
  -[GEOResources _readDirectionsURL]((uint64_t)self);
  directionsURL = self->_directionsURL;

  return directionsURL;
}

- (void)setDirectionsURL:(id)a3
{
  *(void *)&self->_flags |= 0x800000000040000uLL;
  objc_storeStrong((id *)&self->_directionsURL, a3);
}

- (void)_readEtaURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 498) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEtaURL_tags_723);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasEtaURL
{
  return self->_etaURL != 0;
}

- (NSString)etaURL
{
  -[GEOResources _readEtaURL]((uint64_t)self);
  etaURL = self->_etaURL;

  return etaURL;
}

- (void)setEtaURL:(id)a3
{
  *(void *)&self->_flags |= 0x800000000200000uLL;
  objc_storeStrong((id *)&self->_etaURL, a3);
}

- (void)_readReleaseInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 501) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readReleaseInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasReleaseInfo
{
  return self->_releaseInfo != 0;
}

- (NSString)releaseInfo
{
  -[GEOResources _readReleaseInfo]((uint64_t)self);
  releaseInfo = self->_releaseInfo;

  return releaseInfo;
}

- (void)setReleaseInfo:(id)a3
{
  *(void *)&self->_flags |= 0x800020000000000uLL;
  objc_storeStrong((id *)&self->_releaseInfo, a3);
}

- (void)_readBatchReverseGeocoderURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 497) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBatchReverseGeocoderURL_tags_724);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasBatchReverseGeocoderURL
{
  return self->_batchReverseGeocoderURL != 0;
}

- (NSString)batchReverseGeocoderURL
{
  -[GEOResources _readBatchReverseGeocoderURL]((uint64_t)self);
  batchReverseGeocoderURL = self->_batchReverseGeocoderURL;

  return batchReverseGeocoderURL;
}

- (void)setBatchReverseGeocoderURL:(id)a3
{
  *(void *)&self->_flags |= 0x800000000001000uLL;
  objc_storeStrong((id *)&self->_batchReverseGeocoderURL, a3);
}

- (void)_readSimpleETAURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 501) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSimpleETAURL_tags_725);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasSimpleETAURL
{
  return self->_simpleETAURL != 0;
}

- (NSString)simpleETAURL
{
  -[GEOResources _readSimpleETAURL]((uint64_t)self);
  simpleETAURL = self->_simpleETAURL;

  return simpleETAURL;
}

- (void)setSimpleETAURL:(id)a3
{
  *(void *)&self->_flags |= 0x800400000000000uLL;
  objc_storeStrong((id *)&self->_simpleETAURL, a3);
}

- (void)_readStyleSheetChecksums
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 502) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleSheetChecksums_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)styleSheetChecksums
{
  -[GEOResources _readStyleSheetChecksums]((uint64_t)self);
  styleSheetChecksums = self->_styleSheetChecksums;

  return styleSheetChecksums;
}

- (void)setStyleSheetChecksums:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  styleSheetChecksums = self->_styleSheetChecksums;
  self->_styleSheetChecksums = v4;
}

- (void)clearStyleSheetChecksums
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  styleSheetChecksums = self->_styleSheetChecksums;

  [(NSMutableArray *)styleSheetChecksums removeAllObjects];
}

- (void)addStyleSheetChecksum:(id)a3
{
  id v4 = a3;
  -[GEOResources _readStyleSheetChecksums]((uint64_t)self);
  -[GEOResources _addNoFlagsStyleSheetChecksum:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsStyleSheetChecksum:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 392);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 392);
      *(void *)(a1 + 392) = v5;

      id v4 = *(void **)(a1 + 392);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)styleSheetChecksumsCount
{
  -[GEOResources _readStyleSheetChecksums]((uint64_t)self);
  styleSheetChecksums = self->_styleSheetChecksums;

  return [(NSMutableArray *)styleSheetChecksums count];
}

- (id)styleSheetChecksumAtIndex:(unint64_t)a3
{
  -[GEOResources _readStyleSheetChecksums]((uint64_t)self);
  styleSheetChecksums = self->_styleSheetChecksums;

  return (id)[(NSMutableArray *)styleSheetChecksums objectAtIndex:a3];
}

+ (Class)styleSheetChecksumType
{
  return (Class)objc_opt_class();
}

- (void)_readTextureChecksums
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 502) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTextureChecksums_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)textureChecksums
{
  -[GEOResources _readTextureChecksums]((uint64_t)self);
  textureChecksums = self->_textureChecksums;

  return textureChecksums;
}

- (void)setTextureChecksums:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  textureChecksums = self->_textureChecksums;
  self->_textureChecksums = v4;
}

- (void)clearTextureChecksums
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  textureChecksums = self->_textureChecksums;

  [(NSMutableArray *)textureChecksums removeAllObjects];
}

- (void)addTextureChecksum:(id)a3
{
  id v4 = a3;
  -[GEOResources _readTextureChecksums]((uint64_t)self);
  -[GEOResources _addNoFlagsTextureChecksum:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsTextureChecksum:(uint64_t)a1
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

- (unint64_t)textureChecksumsCount
{
  -[GEOResources _readTextureChecksums]((uint64_t)self);
  textureChecksums = self->_textureChecksums;

  return [(NSMutableArray *)textureChecksums count];
}

- (id)textureChecksumAtIndex:(unint64_t)a3
{
  -[GEOResources _readTextureChecksums]((uint64_t)self);
  textureChecksums = self->_textureChecksums;

  return (id)[(NSMutableArray *)textureChecksums objectAtIndex:a3];
}

+ (Class)textureChecksumType
{
  return (Class)objc_opt_class();
}

- (void)_readFontChecksums
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 498) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFontChecksums_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)fontChecksums
{
  -[GEOResources _readFontChecksums]((uint64_t)self);
  fontChecksums = self->_fontChecksums;

  return fontChecksums;
}

- (void)setFontChecksums:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  fontChecksums = self->_fontChecksums;
  self->_fontChecksums = v4;
}

- (void)clearFontChecksums
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  fontChecksums = self->_fontChecksums;

  [(NSMutableArray *)fontChecksums removeAllObjects];
}

- (void)addFontChecksum:(id)a3
{
  id v4 = a3;
  -[GEOResources _readFontChecksums]((uint64_t)self);
  -[GEOResources _addNoFlagsFontChecksum:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsFontChecksum:(uint64_t)a1
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

- (unint64_t)fontChecksumsCount
{
  -[GEOResources _readFontChecksums]((uint64_t)self);
  fontChecksums = self->_fontChecksums;

  return [(NSMutableArray *)fontChecksums count];
}

- (id)fontChecksumAtIndex:(unint64_t)a3
{
  -[GEOResources _readFontChecksums]((uint64_t)self);
  fontChecksums = self->_fontChecksums;

  return (id)[(NSMutableArray *)fontChecksums objectAtIndex:a3];
}

+ (Class)fontChecksumType
{
  return (Class)objc_opt_class();
}

- (void)_readIconChecksums
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 499) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIconChecksums_tags_726);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)iconChecksums
{
  -[GEOResources _readIconChecksums]((uint64_t)self);
  iconChecksums = self->_iconChecksums;

  return iconChecksums;
}

- (void)setIconChecksums:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  iconChecksums = self->_iconChecksums;
  self->_iconChecksums = v4;
}

- (void)clearIconChecksums
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  iconChecksums = self->_iconChecksums;

  [(NSMutableArray *)iconChecksums removeAllObjects];
}

- (void)addIconChecksum:(id)a3
{
  id v4 = a3;
  -[GEOResources _readIconChecksums]((uint64_t)self);
  -[GEOResources _addNoFlagsIconChecksum:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsIconChecksum:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 200);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 200);
      *(void *)(a1 + 200) = v5;

      id v4 = *(void **)(a1 + 200);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)iconChecksumsCount
{
  -[GEOResources _readIconChecksums]((uint64_t)self);
  iconChecksums = self->_iconChecksums;

  return [(NSMutableArray *)iconChecksums count];
}

- (id)iconChecksumAtIndex:(unint64_t)a3
{
  -[GEOResources _readIconChecksums]((uint64_t)self);
  iconChecksums = self->_iconChecksums;

  return (id)[(NSMutableArray *)iconChecksums objectAtIndex:a3];
}

+ (Class)iconChecksumType
{
  return (Class)objc_opt_class();
}

- (void)_readXmlChecksums
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 503) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readXmlChecksums_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)xmlChecksums
{
  -[GEOResources _readXmlChecksums]((uint64_t)self);
  xmlChecksums = self->_xmlChecksums;

  return xmlChecksums;
}

- (void)setXmlChecksums:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  xmlChecksums = self->_xmlChecksums;
  self->_xmlChecksums = v4;
}

- (void)clearXmlChecksums
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  xmlChecksums = self->_xmlChecksums;

  [(NSMutableArray *)xmlChecksums removeAllObjects];
}

- (void)addXmlChecksum:(id)a3
{
  id v4 = a3;
  -[GEOResources _readXmlChecksums]((uint64_t)self);
  -[GEOResources _addNoFlagsXmlChecksum:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsXmlChecksum:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 464);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 464);
      *(void *)(a1 + 464) = v5;

      id v4 = *(void **)(a1 + 464);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)xmlChecksumsCount
{
  -[GEOResources _readXmlChecksums]((uint64_t)self);
  xmlChecksums = self->_xmlChecksums;

  return [(NSMutableArray *)xmlChecksums count];
}

- (id)xmlChecksumAtIndex:(unint64_t)a3
{
  -[GEOResources _readXmlChecksums]((uint64_t)self);
  xmlChecksums = self->_xmlChecksums;

  return (id)[(NSMutableArray *)xmlChecksums objectAtIndex:a3];
}

+ (Class)xmlChecksumType
{
  return (Class)objc_opt_class();
}

- (void)_readAddressCorrectionInitURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 496) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressCorrectionInitURL_tags_727);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasAddressCorrectionInitURL
{
  return self->_addressCorrectionInitURL != 0;
}

- (NSString)addressCorrectionInitURL
{
  -[GEOResources _readAddressCorrectionInitURL]((uint64_t)self);
  addressCorrectionInitURL = self->_addressCorrectionInitURL;

  return addressCorrectionInitURL;
}

- (void)setAddressCorrectionInitURL:(id)a3
{
  *(void *)&self->_flags |= 0x800000000000008uLL;
  objc_storeStrong((id *)&self->_addressCorrectionInitURL, a3);
}

- (void)_readAddressCorrectionUpdateURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 496) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressCorrectionUpdateURL_tags_728);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasAddressCorrectionUpdateURL
{
  return self->_addressCorrectionUpdateURL != 0;
}

- (NSString)addressCorrectionUpdateURL
{
  -[GEOResources _readAddressCorrectionUpdateURL]((uint64_t)self);
  addressCorrectionUpdateURL = self->_addressCorrectionUpdateURL;

  return addressCorrectionUpdateURL;
}

- (void)setAddressCorrectionUpdateURL:(id)a3
{
  *(void *)&self->_flags |= 0x800000000000010uLL;
  objc_storeStrong((id *)&self->_addressCorrectionUpdateURL, a3);
}

- (void)_readPolyLocationShiftURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 500) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPolyLocationShiftURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasPolyLocationShiftURL
{
  return self->_polyLocationShiftURL != 0;
}

- (NSString)polyLocationShiftURL
{
  -[GEOResources _readPolyLocationShiftURL]((uint64_t)self);
  polyLocationShiftURL = self->_polyLocationShiftURL;

  return polyLocationShiftURL;
}

- (void)setPolyLocationShiftURL:(id)a3
{
  *(void *)&self->_flags |= 0x800000200000000uLL;
  objc_storeStrong((id *)&self->_polyLocationShiftURL, a3);
}

- (void)_readProblemSubmissionURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 500) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblemSubmissionURL_tags_729);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasProblemSubmissionURL
{
  return self->_problemSubmissionURL != 0;
}

- (NSString)problemSubmissionURL
{
  -[GEOResources _readProblemSubmissionURL]((uint64_t)self);
  problemSubmissionURL = self->_problemSubmissionURL;

  return problemSubmissionURL;
}

- (void)setProblemSubmissionURL:(id)a3
{
  *(void *)&self->_flags |= 0x800004000000000uLL;
  objc_storeStrong((id *)&self->_problemSubmissionURL, a3);
}

- (void)_readProblemStatusURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 500) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblemStatusURL_tags_730);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasProblemStatusURL
{
  return self->_problemStatusURL != 0;
}

- (NSString)problemStatusURL
{
  -[GEOResources _readProblemStatusURL]((uint64_t)self);
  problemStatusURL = self->_problemStatusURL;

  return problemStatusURL;
}

- (void)setProblemStatusURL:(id)a3
{
  *(void *)&self->_flags |= 0x800002000000000uLL;
  objc_storeStrong((id *)&self->_problemStatusURL, a3);
}

- (void)_readReverseGeocoderVersionsURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 501) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readReverseGeocoderVersionsURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasReverseGeocoderVersionsURL
{
  return self->_reverseGeocoderVersionsURL != 0;
}

- (NSString)reverseGeocoderVersionsURL
{
  -[GEOResources _readReverseGeocoderVersionsURL]((uint64_t)self);
  reverseGeocoderVersionsURL = self->_reverseGeocoderVersionsURL;

  return reverseGeocoderVersionsURL;
}

- (void)setReverseGeocoderVersionsURL:(id)a3
{
  *(void *)&self->_flags |= 0x800100000000000uLL;
  objc_storeStrong((id *)&self->_reverseGeocoderVersionsURL, a3);
}

- (void)_readProblemCategoriesURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 500) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblemCategoriesURL_tags_731);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasProblemCategoriesURL
{
  return self->_problemCategoriesURL != 0;
}

- (NSString)problemCategoriesURL
{
  -[GEOResources _readProblemCategoriesURL]((uint64_t)self);
  problemCategoriesURL = self->_problemCategoriesURL;

  return problemCategoriesURL;
}

- (void)setProblemCategoriesURL:(id)a3
{
  *(void *)&self->_flags |= 0x800000800000000uLL;
  objc_storeStrong((id *)&self->_problemCategoriesURL, a3);
}

- (void)_readAnnouncementsURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 496) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnnouncementsURL_tags_732);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasAnnouncementsURL
{
  return self->_announcementsURL != 0;
}

- (NSString)announcementsURL
{
  -[GEOResources _readAnnouncementsURL]((uint64_t)self);
  announcementsURL = self->_announcementsURL;

  return announcementsURL;
}

- (void)setAnnouncementsURL:(id)a3
{
  *(void *)&self->_flags |= 0x800000000000040uLL;
  objc_storeStrong((id *)&self->_announcementsURL, a3);
}

- (void)_readAnnouncementsSupportedLanguages
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 496) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnnouncementsSupportedLanguages_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)announcementsSupportedLanguages
{
  -[GEOResources _readAnnouncementsSupportedLanguages]((uint64_t)self);
  announcementsSupportedLanguages = self->_announcementsSupportedLanguages;

  return announcementsSupportedLanguages;
}

- (void)setAnnouncementsSupportedLanguages:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  announcementsSupportedLanguages = self->_announcementsSupportedLanguages;
  self->_announcementsSupportedLanguages = v4;
}

- (void)clearAnnouncementsSupportedLanguages
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  announcementsSupportedLanguages = self->_announcementsSupportedLanguages;

  [(NSMutableArray *)announcementsSupportedLanguages removeAllObjects];
}

- (void)addAnnouncementsSupportedLanguages:(id)a3
{
  id v4 = a3;
  -[GEOResources _readAnnouncementsSupportedLanguages]((uint64_t)self);
  -[GEOResources _addNoFlagsAnnouncementsSupportedLanguages:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsAnnouncementsSupportedLanguages:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)announcementsSupportedLanguagesCount
{
  -[GEOResources _readAnnouncementsSupportedLanguages]((uint64_t)self);
  announcementsSupportedLanguages = self->_announcementsSupportedLanguages;

  return [(NSMutableArray *)announcementsSupportedLanguages count];
}

- (id)announcementsSupportedLanguagesAtIndex:(unint64_t)a3
{
  -[GEOResources _readAnnouncementsSupportedLanguages]((uint64_t)self);
  announcementsSupportedLanguages = self->_announcementsSupportedLanguages;

  return (id)[(NSMutableArray *)announcementsSupportedLanguages objectAtIndex:a3];
}

+ (Class)announcementsSupportedLanguagesType
{
  return (Class)objc_opt_class();
}

- (void)_readDispatcherURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 498) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDispatcherURL_tags_733);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasDispatcherURL
{
  return self->_dispatcherURL != 0;
}

- (NSString)dispatcherURL
{
  -[GEOResources _readDispatcherURL]((uint64_t)self);
  dispatcherURL = self->_dispatcherURL;

  return dispatcherURL;
}

- (void)setDispatcherURL:(id)a3
{
  *(void *)&self->_flags |= 0x800000000080000uLL;
  objc_storeStrong((id *)&self->_dispatcherURL, a3);
}

- (void)_readProblemOptInURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 500) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblemOptInURL_tags_734);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasProblemOptInURL
{
  return self->_problemOptInURL != 0;
}

- (NSString)problemOptInURL
{
  -[GEOResources _readProblemOptInURL]((uint64_t)self);
  problemOptInURL = self->_problemOptInURL;

  return problemOptInURL;
}

- (void)setProblemOptInURL:(id)a3
{
  *(void *)&self->_flags |= 0x800001000000000uLL;
  objc_storeStrong((id *)&self->_problemOptInURL, a3);
}

- (void)_readVersionManifest
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 502) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVersionManifest_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasVersionManifest
{
  return self->_versionManifest != 0;
}

- (GEOVersionManifest)versionManifest
{
  -[GEOResources _readVersionManifest]((uint64_t)self);
  versionManifest = self->_versionManifest;

  return versionManifest;
}

- (void)setVersionManifest:(id)a3
{
  *(void *)&self->_flags |= 0x880000000000000uLL;
  objc_storeStrong((id *)&self->_versionManifest, a3);
}

- (void)_readAbExperimentURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 496) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAbExperimentURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasAbExperimentURL
{
  return self->_abExperimentURL != 0;
}

- (NSString)abExperimentURL
{
  -[GEOResources _readAbExperimentURL]((uint64_t)self);
  abExperimentURL = self->_abExperimentURL;

  return abExperimentURL;
}

- (void)setAbExperimentURL:(id)a3
{
  *(void *)&self->_flags |= 0x800000000000004uLL;
  objc_storeStrong((id *)&self->_abExperimentURL, a3);
}

- (void)_readBusinessPortalBaseURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 497) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBusinessPortalBaseURL_tags_735);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasBusinessPortalBaseURL
{
  return self->_businessPortalBaseURL != 0;
}

- (NSString)businessPortalBaseURL
{
  -[GEOResources _readBusinessPortalBaseURL]((uint64_t)self);
  businessPortalBaseURL = self->_businessPortalBaseURL;

  return businessPortalBaseURL;
}

- (void)setBusinessPortalBaseURL:(id)a3
{
  *(void *)&self->_flags |= 0x800000000008000uLL;
  objc_storeStrong((id *)&self->_businessPortalBaseURL, a3);
}

- (void)_readLogMessageUsageURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 499) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLogMessageUsageURL_tags_736);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasLogMessageUsageURL
{
  return self->_logMessageUsageURL != 0;
}

- (NSString)logMessageUsageURL
{
  -[GEOResources _readLogMessageUsageURL]((uint64_t)self);
  logMessageUsageURL = self->_logMessageUsageURL;

  return logMessageUsageURL;
}

- (void)setLogMessageUsageURL:(id)a3
{
  *(void *)&self->_flags |= 0x800000008000000uLL;
  objc_storeStrong((id *)&self->_logMessageUsageURL, a3);
}

- (void)_readLocationShiftEnabledRegions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 499) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocationShiftEnabledRegions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)locationShiftEnabledRegions
{
  -[GEOResources _readLocationShiftEnabledRegions]((uint64_t)self);
  locationShiftEnabledRegions = self->_locationShiftEnabledRegions;

  return locationShiftEnabledRegions;
}

- (void)setLocationShiftEnabledRegions:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  locationShiftEnabledRegions = self->_locationShiftEnabledRegions;
  self->_locationShiftEnabledRegions = v4;
}

- (void)clearLocationShiftEnabledRegions
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  locationShiftEnabledRegions = self->_locationShiftEnabledRegions;

  [(NSMutableArray *)locationShiftEnabledRegions removeAllObjects];
}

- (void)addLocationShiftEnabledRegion:(id)a3
{
  id v4 = a3;
  -[GEOResources _readLocationShiftEnabledRegions]((uint64_t)self);
  -[GEOResources _addNoFlagsLocationShiftEnabledRegion:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsLocationShiftEnabledRegion:(uint64_t)a1
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

- (unint64_t)locationShiftEnabledRegionsCount
{
  -[GEOResources _readLocationShiftEnabledRegions]((uint64_t)self);
  locationShiftEnabledRegions = self->_locationShiftEnabledRegions;

  return [(NSMutableArray *)locationShiftEnabledRegions count];
}

- (id)locationShiftEnabledRegionAtIndex:(unint64_t)a3
{
  -[GEOResources _readLocationShiftEnabledRegions]((uint64_t)self);
  locationShiftEnabledRegions = self->_locationShiftEnabledRegions;

  return (id)[(NSMutableArray *)locationShiftEnabledRegions objectAtIndex:a3];
}

+ (Class)locationShiftEnabledRegionType
{
  return (Class)objc_opt_class();
}

- (unsigned)locationShiftVersion
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $253DEAA7EC5C39FADD5BEFB730D1BE85 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (*(unsigned char *)&flags) {
    return self->_locationShiftVersion;
  }
  else {
    return 1;
  }
}

- (void)setLocationShiftVersion:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x800000000000001uLL;
  self->_locationShiftVersiouint64_t n = a3;
}

- (void)setHasLocationShiftVersion:(BOOL)a3
{
  self->_$253DEAA7EC5C39FADD5BEFB730D1BE85 flags = ($253DEAA7EC5C39FADD5BEFB730D1BE85)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x800000000000000);
}

- (BOOL)hasLocationShiftVersion
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readResources
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 501) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResources_tags_738);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)resources
{
  -[GEOResources _readResources]((uint64_t)self);
  resources = self->_resources;

  return resources;
}

- (void)setResources:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  resources = self->_resources;
  self->_resources = v4;
}

- (void)clearResources
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  resources = self->_resources;

  [(NSMutableArray *)resources removeAllObjects];
}

- (void)addResource:(id)a3
{
  id v4 = a3;
  -[GEOResources _readResources]((uint64_t)self);
  -[GEOResources _addNoFlagsResource:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsResource:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 352);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 352);
      *(void *)(a1 + 352) = v5;

      id v4 = *(void **)(a1 + 352);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)resourcesCount
{
  -[GEOResources _readResources]((uint64_t)self);
  resources = self->_resources;

  return [(NSMutableArray *)resources count];
}

- (id)resourceAtIndex:(unint64_t)a3
{
  -[GEOResources _readResources]((uint64_t)self);
  resources = self->_resources;

  return (id)[(NSMutableArray *)resources objectAtIndex:a3];
}

+ (Class)resourceType
{
  return (Class)objc_opt_class();
}

- (void)_readSpatialLookupURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 501) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpatialLookupURL_tags_739);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasSpatialLookupURL
{
  return self->_spatialLookupURL != 0;
}

- (NSString)spatialLookupURL
{
  -[GEOResources _readSpatialLookupURL]((uint64_t)self);
  spatialLookupURL = self->_spatialLookupURL;

  return spatialLookupURL;
}

- (void)setSpatialLookupURL:(id)a3
{
  *(void *)&self->_flags |= 0x800800000000000uLL;
  objc_storeStrong((id *)&self->_spatialLookupURL, a3);
}

- (void)setDataSets:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  dataSets = self->_dataSets;
  self->_dataSets = v4;
}

- (void)clearDataSets
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  dataSets = self->_dataSets;

  [(NSMutableArray *)dataSets removeAllObjects];
}

- (void)addDataSet:(id)a3
{
  id v4 = a3;
  -[GEOResources _readDataSets]((uint64_t)self);
  -[GEOResources _addNoFlagsDataSet:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsDataSet:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 144);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 144);
      *(void *)(a1 + 144) = v5;

      id v4 = *(void **)(a1 + 144);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)dataSetsCount
{
  -[GEOResources _readDataSets]((uint64_t)self);
  dataSets = self->_dataSets;

  return [(NSMutableArray *)dataSets count];
}

- (id)dataSetAtIndex:(unint64_t)a3
{
  -[GEOResources _readDataSets]((uint64_t)self);
  dataSets = self->_dataSets;

  return (id)[(NSMutableArray *)dataSets objectAtIndex:a3];
}

+ (Class)dataSetType
{
  return (Class)objc_opt_class();
}

- (void)_readDataSetURLOverrides
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 498) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDataSetURLOverrides_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)dataSetURLOverrides
{
  -[GEOResources _readDataSetURLOverrides]((uint64_t)self);
  dataSetURLOverrides = self->_dataSetURLOverrides;

  return dataSetURLOverrides;
}

- (void)setDataSetURLOverrides:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  dataSetURLOverrides = self->_dataSetURLOverrides;
  self->_dataSetURLOverrides = v4;
}

- (void)clearDataSetURLOverrides
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  dataSetURLOverrides = self->_dataSetURLOverrides;

  [(NSMutableArray *)dataSetURLOverrides removeAllObjects];
}

- (void)addDataSetURLOverride:(id)a3
{
  id v4 = a3;
  -[GEOResources _readDataSetURLOverrides]((uint64_t)self);
  -[GEOResources _addNoFlagsDataSetURLOverride:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsDataSetURLOverride:(uint64_t)a1
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

- (unint64_t)dataSetURLOverridesCount
{
  -[GEOResources _readDataSetURLOverrides]((uint64_t)self);
  dataSetURLOverrides = self->_dataSetURLOverrides;

  return [(NSMutableArray *)dataSetURLOverrides count];
}

- (id)dataSetURLOverrideAtIndex:(unint64_t)a3
{
  -[GEOResources _readDataSetURLOverrides]((uint64_t)self);
  dataSetURLOverrides = self->_dataSetURLOverrides;

  return (id)[(NSMutableArray *)dataSetURLOverrides objectAtIndex:a3];
}

+ (Class)dataSetURLOverrideType
{
  return (Class)objc_opt_class();
}

- (void)_readRealtimeTrafficProbeURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 500) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRealtimeTrafficProbeURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasRealtimeTrafficProbeURL
{
  return self->_realtimeTrafficProbeURL != 0;
}

- (NSString)realtimeTrafficProbeURL
{
  -[GEOResources _readRealtimeTrafficProbeURL]((uint64_t)self);
  realtimeTrafficProbeURL = self->_realtimeTrafficProbeURL;

  return realtimeTrafficProbeURL;
}

- (void)setRealtimeTrafficProbeURL:(id)a3
{
  *(void *)&self->_flags |= 0x800008000000000uLL;
  objc_storeStrong((id *)&self->_realtimeTrafficProbeURL, a3);
}

- (void)_readBatchTrafficProbeURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 497) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBatchTrafficProbeURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasBatchTrafficProbeURL
{
  return self->_batchTrafficProbeURL != 0;
}

- (NSString)batchTrafficProbeURL
{
  -[GEOResources _readBatchTrafficProbeURL]((uint64_t)self);
  batchTrafficProbeURL = self->_batchTrafficProbeURL;

  return batchTrafficProbeURL;
}

- (void)setBatchTrafficProbeURL:(id)a3
{
  *(void *)&self->_flags |= 0x800000000002000uLL;
  objc_storeStrong((id *)&self->_batchTrafficProbeURL, a3);
}

- (void)_readProactiveRoutingURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 500) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProactiveRoutingURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasProactiveRoutingURL
{
  return self->_proactiveRoutingURL != 0;
}

- (NSString)proactiveRoutingURL
{
  -[GEOResources _readProactiveRoutingURL]((uint64_t)self);
  proactiveRoutingURL = self->_proactiveRoutingURL;

  return proactiveRoutingURL;
}

- (void)setProactiveRoutingURL:(id)a3
{
  *(void *)&self->_flags |= 0x800000400000000uLL;
  objc_storeStrong((id *)&self->_proactiveRoutingURL, a3);
}

- (void)_readLogMessageUsageV3URL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 499) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLogMessageUsageV3URL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasLogMessageUsageV3URL
{
  return self->_logMessageUsageV3URL != 0;
}

- (NSString)logMessageUsageV3URL
{
  -[GEOResources _readLogMessageUsageV3URL]((uint64_t)self);
  logMessageUsageV3URL = self->_logMessageUsageV3URL;

  return logMessageUsageV3URL;
}

- (void)setLogMessageUsageV3URL:(id)a3
{
  *(void *)&self->_flags |= 0x800000010000000uLL;
  objc_storeStrong((id *)&self->_logMessageUsageV3URL, a3);
}

- (void)_readBackgroundDispatcherURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 497) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBackgroundDispatcherURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasBackgroundDispatcherURL
{
  return self->_backgroundDispatcherURL != 0;
}

- (NSString)backgroundDispatcherURL
{
  -[GEOResources _readBackgroundDispatcherURL]((uint64_t)self);
  backgroundDispatcherURL = self->_backgroundDispatcherURL;

  return backgroundDispatcherURL;
}

- (void)setBackgroundDispatcherURL:(id)a3
{
  *(void *)&self->_flags |= 0x800000000000400uLL;
  objc_storeStrong((id *)&self->_backgroundDispatcherURL, a3);
}

- (void)_readBluePOIDispatcherURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 497) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBluePOIDispatcherURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasBluePOIDispatcherURL
{
  return self->_bluePOIDispatcherURL != 0;
}

- (NSString)bluePOIDispatcherURL
{
  -[GEOResources _readBluePOIDispatcherURL]((uint64_t)self);
  bluePOIDispatcherURL = self->_bluePOIDispatcherURL;

  return bluePOIDispatcherURL;
}

- (void)setBluePOIDispatcherURL:(id)a3
{
  *(void *)&self->_flags |= 0x800000000004000uLL;
  objc_storeStrong((id *)&self->_bluePOIDispatcherURL, a3);
}

- (void)_readBackgroundRevGeoURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 497) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBackgroundRevGeoURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasBackgroundRevGeoURL
{
  return self->_backgroundRevGeoURL != 0;
}

- (NSString)backgroundRevGeoURL
{
  -[GEOResources _readBackgroundRevGeoURL]((uint64_t)self);
  backgroundRevGeoURL = self->_backgroundRevGeoURL;

  return backgroundRevGeoURL;
}

- (void)setBackgroundRevGeoURL:(id)a3
{
  *(void *)&self->_flags |= 0x800000000000800uLL;
  objc_storeStrong((id *)&self->_backgroundRevGeoURL, a3);
}

- (void)_readWifiConnectionQualityProbeURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 503) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWifiConnectionQualityProbeURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasWifiConnectionQualityProbeURL
{
  return self->_wifiConnectionQualityProbeURL != 0;
}

- (NSString)wifiConnectionQualityProbeURL
{
  -[GEOResources _readWifiConnectionQualityProbeURL]((uint64_t)self);
  wifiConnectionQualityProbeURL = self->_wifiConnectionQualityProbeURL;

  return wifiConnectionQualityProbeURL;
}

- (void)setWifiConnectionQualityProbeURL:(id)a3
{
  *(void *)&self->_flags |= 0x900000000000000uLL;
  objc_storeStrong((id *)&self->_wifiConnectionQualityProbeURL, a3);
}

- (void)_readMuninBaseURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 499) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMuninBaseURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasMuninBaseURL
{
  return self->_muninBaseURL != 0;
}

- (NSString)muninBaseURL
{
  -[GEOResources _readMuninBaseURL]((uint64_t)self);
  muninBaseURL = self->_muninBaseURL;

  return muninBaseURL;
}

- (void)setMuninBaseURL:(id)a3
{
  *(void *)&self->_flags |= 0x800000020000000uLL;
  objc_storeStrong((id *)&self->_muninBaseURL, a3);
}

- (void)_readMuninVersions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 499) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMuninVersions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)muninVersions
{
  -[GEOResources _readMuninVersions]((uint64_t)self);
  muninVersions = self->_muninVersions;

  return muninVersions;
}

- (void)setMuninVersions:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  muninVersions = self->_muninVersions;
  self->_muninVersions = v4;
}

- (void)clearMuninVersions
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  muninVersions = self->_muninVersions;

  [(NSMutableArray *)muninVersions removeAllObjects];
}

- (void)addMuninVersion:(id)a3
{
  id v4 = a3;
  -[GEOResources _readMuninVersions]((uint64_t)self);
  -[GEOResources _addNoFlagsMuninVersion:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsMuninVersion:(uint64_t)a1
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

- (unint64_t)muninVersionsCount
{
  -[GEOResources _readMuninVersions]((uint64_t)self);
  muninVersions = self->_muninVersions;

  return [(NSMutableArray *)muninVersions count];
}

- (id)muninVersionAtIndex:(unint64_t)a3
{
  -[GEOResources _readMuninVersions]((uint64_t)self);
  muninVersions = self->_muninVersions;

  return (id)[(NSMutableArray *)muninVersions objectAtIndex:a3];
}

+ (Class)muninVersionType
{
  return (Class)objc_opt_class();
}

- (void)_readAuthProxyURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 497) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAuthProxyURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasAuthProxyURL
{
  return self->_authProxyURL != 0;
}

- (NSString)authProxyURL
{
  -[GEOResources _readAuthProxyURL]((uint64_t)self);
  authProxyURL = self->_authProxyURL;

  return authProxyURL;
}

- (void)setAuthProxyURL:(id)a3
{
  *(void *)&self->_flags |= 0x800000000000100uLL;
  objc_storeStrong((id *)&self->_authProxyURL, a3);
}

- (void)setUrlInfoSets:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  urlInfoSets = self->_urlInfoSets;
  self->_urlInfoSets = v4;
}

- (void)clearUrlInfoSets
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  urlInfoSets = self->_urlInfoSets;

  [(NSMutableArray *)urlInfoSets removeAllObjects];
}

- (void)addUrlInfoSet:(id)a3
{
  id v4 = a3;
  -[GEOResources _readUrlInfoSets]((uint64_t)self);
  -[GEOResources _addNoFlagsUrlInfoSet:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsUrlInfoSet:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 440);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 440);
      *(void *)(a1 + 440) = v5;

      id v4 = *(void **)(a1 + 440);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)urlInfoSetsCount
{
  -[GEOResources _readUrlInfoSets]((uint64_t)self);
  urlInfoSets = self->_urlInfoSets;

  return [(NSMutableArray *)urlInfoSets count];
}

- (id)urlInfoSetAtIndex:(unint64_t)a3
{
  -[GEOResources _readUrlInfoSets]((uint64_t)self);
  urlInfoSets = self->_urlInfoSets;

  return (id)[(NSMutableArray *)urlInfoSets objectAtIndex:a3];
}

+ (Class)urlInfoSetType
{
  return (Class)objc_opt_class();
}

- (void)_readMuninBuckets
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 499) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMuninBuckets_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)muninBuckets
{
  -[GEOResources _readMuninBuckets]((uint64_t)self);
  muninBuckets = self->_muninBuckets;

  return muninBuckets;
}

- (void)setMuninBuckets:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  muninBuckets = self->_muninBuckets;
  self->_muninBuckets = v4;
}

- (void)clearMuninBuckets
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  muninBuckets = self->_muninBuckets;

  [(NSMutableArray *)muninBuckets removeAllObjects];
}

- (void)addMuninBucket:(id)a3
{
  id v4 = a3;
  -[GEOResources _readMuninBuckets]((uint64_t)self);
  -[GEOResources _addNoFlagsMuninBucket:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsMuninBucket:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 248);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 248);
      *(void *)(a1 + 248) = v5;

      id v4 = *(void **)(a1 + 248);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)muninBucketsCount
{
  -[GEOResources _readMuninBuckets]((uint64_t)self);
  muninBuckets = self->_muninBuckets;

  return [(NSMutableArray *)muninBuckets count];
}

- (id)muninBucketAtIndex:(unint64_t)a3
{
  -[GEOResources _readMuninBuckets]((uint64_t)self);
  muninBuckets = self->_muninBuckets;

  return (id)[(NSMutableArray *)muninBuckets objectAtIndex:a3];
}

+ (Class)muninBucketType
{
  return (Class)objc_opt_class();
}

- (void)_readDisplayStrings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 498) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayStrings_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)displayStrings
{
  -[GEOResources _readDisplayStrings]((uint64_t)self);
  displayStrings = self->_displayStrings;

  return displayStrings;
}

- (void)setDisplayStrings:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  displayStrings = self->_displayStrings;
  self->_displayStrings = v4;
}

- (void)clearDisplayStrings
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  displayStrings = self->_displayStrings;

  [(NSMutableArray *)displayStrings removeAllObjects];
}

- (void)addDisplayStrings:(id)a3
{
  id v4 = a3;
  -[GEOResources _readDisplayStrings]((uint64_t)self);
  -[GEOResources _addNoFlagsDisplayStrings:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsDisplayStrings:(uint64_t)a1
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

- (unint64_t)displayStringsCount
{
  -[GEOResources _readDisplayStrings]((uint64_t)self);
  displayStrings = self->_displayStrings;

  return [(NSMutableArray *)displayStrings count];
}

- (id)displayStringsAtIndex:(unint64_t)a3
{
  -[GEOResources _readDisplayStrings]((uint64_t)self);
  displayStrings = self->_displayStrings;

  return (id)[(NSMutableArray *)displayStrings objectAtIndex:a3];
}

+ (Class)displayStringsType
{
  return (Class)objc_opt_class();
}

- (void)_readOfflineMetadatas
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(unsigned char *)(a1 + 500) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOfflineMetadatas_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)offlineMetadatas
{
  -[GEOResources _readOfflineMetadatas]((uint64_t)self);
  offlineMetadatas = self->_offlineMetadatas;

  return offlineMetadatas;
}

- (void)setOfflineMetadatas:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  offlineMetadatas = self->_offlineMetadatas;
  self->_offlineMetadatas = v4;
}

- (void)clearOfflineMetadatas
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
  offlineMetadatas = self->_offlineMetadatas;

  [(NSMutableArray *)offlineMetadatas removeAllObjects];
}

- (void)addOfflineMetadata:(id)a3
{
  id v4 = a3;
  -[GEOResources _readOfflineMetadatas]((uint64_t)self);
  -[GEOResources _addNoFlagsOfflineMetadata:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsOfflineMetadata:(uint64_t)a1
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

- (unint64_t)offlineMetadatasCount
{
  -[GEOResources _readOfflineMetadatas]((uint64_t)self);
  offlineMetadatas = self->_offlineMetadatas;

  return [(NSMutableArray *)offlineMetadatas count];
}

- (id)offlineMetadataAtIndex:(unint64_t)a3
{
  -[GEOResources _readOfflineMetadatas]((uint64_t)self);
  offlineMetadatas = self->_offlineMetadatas;

  return (id)[(NSMutableArray *)offlineMetadatas objectAtIndex:a3];
}

+ (Class)offlineMetadataType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOResources;
  id v4 = [(GEOResources *)&v8 description];
  id v5 = [(GEOResources *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOResources _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v231 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 424) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 424), "count"));
      long long v214 = 0u;
      long long v215 = 0u;
      long long v216 = 0u;
      long long v217 = 0u;
      id v6 = *(id *)(a1 + 424);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v214 objects:v230 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v215;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v215 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void **)(*((void *)&v214 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            id v12 = [v11 dictionaryRepresentation];
            }

            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v214 objects:v230 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"tileGroup"];
    }
    if ([*(id *)(a1 + 432) count])
    {
      uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 432), "count"));
      long long v210 = 0u;
      long long v211 = 0u;
      long long v212 = 0u;
      long long v213 = 0u;
      id v14 = *(id *)(a1 + 432);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v210 objects:v229 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v211;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v211 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void **)(*((void *)&v210 + 1) + 8 * j);
            if (a2) {
              [v19 jsonRepresentation];
            }
            else {
            id v20 = [v19 dictionaryRepresentation];
            }

            [v13 addObject:v20];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v210 objects:v229 count:16];
        }
        while (v16);
      }

      [v4 setObject:v13 forKey:@"tileSet"];
    }
    if (*(void *)(a1 + 400))
    {
      uint64_t v21 = [(id)a1 styleSheets];
      [v4 setObject:v21 forKey:@"styleSheet"];
    }
    if (*(void *)(a1 + 416))
    {
      long long v22 = [(id)a1 textures];
      [v4 setObject:v22 forKey:@"texture"];
    }
    if (*(void *)(a1 + 192))
    {
      uint64_t v23 = [(id)a1 fonts];
      [v4 setObject:v23 forKey:@"font"];
    }
    if (*(void *)(a1 + 208))
    {
      uint64_t v24 = [(id)a1 icons];
      [v4 setObject:v24 forKey:@"icon"];
    }
    if ([*(id *)(a1 + 328) count])
    {
      uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 328), "count"));
      long long v206 = 0u;
      long long v207 = 0u;
      long long v208 = 0u;
      long long v209 = 0u;
      id v26 = *(id *)(a1 + 328);
      uint64_t v27 = [v26 countByEnumeratingWithState:&v206 objects:v228 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v207;
        do
        {
          for (uint64_t k = 0; k != v28; ++k)
          {
            if (*(void *)v207 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void **)(*((void *)&v206 + 1) + 8 * k);
            if (a2) {
              [v31 jsonRepresentation];
            }
            else {
            id v32 = [v31 dictionaryRepresentation];
            }

            [v25 addObject:v32];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v206 objects:v228 count:16];
        }
        while (v28);
      }

      [v4 setObject:v25 forKey:@"regionalResource"];
    }
    if (*(void *)(a1 + 472))
    {
      uint64_t v33 = [(id)a1 xmls];
      [v4 setObject:v33 forKey:@"xml"];
    }
    if ([*(id *)(a1 + 64) count])
    {
      v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
      long long v202 = 0u;
      long long v203 = 0u;
      long long v204 = 0u;
      long long v205 = 0u;
      id v35 = *(id *)(a1 + 64);
      uint64_t v36 = [v35 countByEnumeratingWithState:&v202 objects:v227 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v203;
        do
        {
          for (uint64_t m = 0; m != v37; ++m)
          {
            if (*(void *)v203 != v38) {
              objc_enumerationMutation(v35);
            }
            uint64_t v40 = *(void **)(*((void *)&v202 + 1) + 8 * m);
            if (a2) {
              [v40 jsonRepresentation];
            }
            else {
            id v41 = [v40 dictionaryRepresentation];
            }

            [v34 addObject:v41];
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v202 objects:v227 count:16];
        }
        while (v37);
      }

      [v4 setObject:v34 forKey:@"attribution"];
    }
    v42 = [(id)a1 authToken];
    if (v42) {
      [v4 setObject:v42 forKey:@"authToken"];
    }

    uint64_t v43 = [(id)a1 resourcesURL];
    if (v43) {
      [v4 setObject:v43 forKey:@"resourcesURL"];
    }

    uint64_t v44 = [(id)a1 searchAttributionManifestURL];
    if (v44) {
      [v4 setObject:v44 forKey:@"searchAttributionManifestURL"];
    }

    uint64_t v45 = [(id)a1 directionsURL];
    if (v45) {
      [v4 setObject:v45 forKey:@"directionsURL"];
    }

    uint64_t v46 = [(id)a1 etaURL];
    if (v46) {
      [v4 setObject:v46 forKey:@"etaURL"];
    }

    uint64_t v47 = [(id)a1 releaseInfo];
    if (v47) {
      [v4 setObject:v47 forKey:@"releaseInfo"];
    }

    uint64_t v48 = [(id)a1 batchReverseGeocoderURL];
    if (v48) {
      [v4 setObject:v48 forKey:@"batchReverseGeocoderURL"];
    }

    uint64_t v49 = [(id)a1 simpleETAURL];
    if (v49) {
      [v4 setObject:v49 forKey:@"simpleETAURL"];
    }

    if (*(void *)(a1 + 392))
    {
      uint64_t v50 = [(id)a1 styleSheetChecksums];
      [v4 setObject:v50 forKey:@"styleSheetChecksum"];
    }
    if (*(void *)(a1 + 408))
    {
      uint64_t v51 = [(id)a1 textureChecksums];
      [v4 setObject:v51 forKey:@"textureChecksum"];
    }
    if (*(void *)(a1 + 184))
    {
      uint64_t v52 = [(id)a1 fontChecksums];
      [v4 setObject:v52 forKey:@"fontChecksum"];
    }
    if (*(void *)(a1 + 200))
    {
      uint64_t v53 = [(id)a1 iconChecksums];
      [v4 setObject:v53 forKey:@"iconChecksum"];
    }
    if (*(void *)(a1 + 464))
    {
      uint64_t v54 = [(id)a1 xmlChecksums];
      [v4 setObject:v54 forKey:@"xmlChecksum"];
    }
    uint64_t v55 = [(id)a1 addressCorrectionInitURL];
    if (v55) {
      [v4 setObject:v55 forKey:@"addressCorrectionInitURL"];
    }

    uint64_t v56 = [(id)a1 addressCorrectionUpdateURL];
    if (v56) {
      [v4 setObject:v56 forKey:@"addressCorrectionUpdateURL"];
    }

    uint64_t v57 = [(id)a1 polyLocationShiftURL];
    if (v57) {
      [v4 setObject:v57 forKey:@"polyLocationShiftURL"];
    }

    uint64_t v58 = [(id)a1 problemSubmissionURL];
    if (v58) {
      [v4 setObject:v58 forKey:@"problemSubmissionURL"];
    }

    uint64_t v59 = [(id)a1 problemStatusURL];
    if (v59) {
      [v4 setObject:v59 forKey:@"problemStatusURL"];
    }

    uint64_t v60 = [(id)a1 reverseGeocoderVersionsURL];
    if (v60) {
      [v4 setObject:v60 forKey:@"reverseGeocoderVersionsURL"];
    }

    uint64_t v61 = [(id)a1 problemCategoriesURL];
    if (v61) {
      [v4 setObject:v61 forKey:@"problemCategoriesURL"];
    }

    uint64_t v62 = [(id)a1 announcementsURL];
    if (v62) {
      [v4 setObject:v62 forKey:@"announcementsURL"];
    }

    if (*(void *)(a1 + 48))
    {
      uint64_t v63 = [(id)a1 announcementsSupportedLanguages];
      [v4 setObject:v63 forKey:@"announcementsSupportedLanguages"];
    }
    uint64_t v64 = [(id)a1 dispatcherURL];
    if (v64) {
      [v4 setObject:v64 forKey:@"dispatcherURL"];
    }

    uint64_t v65 = [(id)a1 problemOptInURL];
    if (v65) {
      [v4 setObject:v65 forKey:@"problemOptInURL"];
    }

    uint64_t v66 = [(id)a1 versionManifest];
    uint64_t v67 = v66;
    if (v66)
    {
      if (a2) {
        [v66 jsonRepresentation];
      }
      else {
      id v68 = [v66 dictionaryRepresentation];
      }

      [v4 setObject:v68 forKey:@"versionManifest"];
    }

    uint64_t v69 = [(id)a1 abExperimentURL];
    if (v69) {
      [v4 setObject:v69 forKey:@"abExperimentURL"];
    }

    v70 = [(id)a1 businessPortalBaseURL];
    if (v70) {
      [v4 setObject:v70 forKey:@"businessPortalBaseURL"];
    }

    uint64_t v71 = [(id)a1 logMessageUsageURL];
    if (v71) {
      [v4 setObject:v71 forKey:@"logMessageUsageURL"];
    }

    if ([*(id *)(a1 + 216) count])
    {
      uint64_t v72 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 216), "count"));
      long long v198 = 0u;
      long long v199 = 0u;
      long long v200 = 0u;
      long long v201 = 0u;
      id v73 = *(id *)(a1 + 216);
      uint64_t v74 = [v73 countByEnumeratingWithState:&v198 objects:v226 count:16];
      if (v74)
      {
        uint64_t v75 = v74;
        uint64_t v76 = *(void *)v199;
        do
        {
          for (uint64_t n = 0; n != v75; ++n)
          {
            if (*(void *)v199 != v76) {
              objc_enumerationMutation(v73);
            }
            v78 = *(void **)(*((void *)&v198 + 1) + 8 * n);
            if (a2) {
              [v78 jsonRepresentation];
            }
            else {
            id v79 = [v78 dictionaryRepresentation];
            }

            [v72 addObject:v79];
          }
          uint64_t v75 = [v73 countByEnumeratingWithState:&v198 objects:v226 count:16];
        }
        while (v75);
      }

      [v4 setObject:v72 forKey:@"locationShiftEnabledRegion"];
    }
    if (*(unsigned char *)(a1 + 496))
    {
      uint64_t v80 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 492)];
      [v4 setObject:v80 forKey:@"locationShiftVersion"];
    }
    if ([*(id *)(a1 + 352) count])
    {
      uint64_t v81 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 352), "count"));
      long long v194 = 0u;
      long long v195 = 0u;
      long long v196 = 0u;
      long long v197 = 0u;
      id v82 = *(id *)(a1 + 352);
      uint64_t v83 = [v82 countByEnumeratingWithState:&v194 objects:v225 count:16];
      if (v83)
      {
        uint64_t v84 = v83;
        uint64_t v85 = *(void *)v195;
        do
        {
          for (iuint64_t i = 0; ii != v84; ++ii)
          {
            if (*(void *)v195 != v85) {
              objc_enumerationMutation(v82);
            }
            uint64_t v87 = *(void **)(*((void *)&v194 + 1) + 8 * ii);
            if (a2) {
              [v87 jsonRepresentation];
            }
            else {
            id v88 = [v87 dictionaryRepresentation];
            }

            [v81 addObject:v88];
          }
          uint64_t v84 = [v82 countByEnumeratingWithState:&v194 objects:v225 count:16];
        }
        while (v84);
      }

      [v4 setObject:v81 forKey:@"resource"];
    }
    uint64_t v89 = [(id)a1 spatialLookupURL];
    if (v89) {
      [v4 setObject:v89 forKey:@"spatialLookupURL"];
    }

    if ([*(id *)(a1 + 144) count])
    {
      v90 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 144), "count"));
      long long v190 = 0u;
      long long v191 = 0u;
      long long v192 = 0u;
      long long v193 = 0u;
      id v91 = *(id *)(a1 + 144);
      uint64_t v92 = [v91 countByEnumeratingWithState:&v190 objects:v224 count:16];
      if (v92)
      {
        uint64_t v93 = v92;
        uint64_t v94 = *(void *)v191;
        do
        {
          for (juint64_t j = 0; jj != v93; ++jj)
          {
            if (*(void *)v191 != v94) {
              objc_enumerationMutation(v91);
            }
            uint64_t v96 = *(void **)(*((void *)&v190 + 1) + 8 * jj);
            if (a2) {
              [v96 jsonRepresentation];
            }
            else {
            id v97 = [v96 dictionaryRepresentation];
            }

            [v90 addObject:v97];
          }
          uint64_t v93 = [v91 countByEnumeratingWithState:&v190 objects:v224 count:16];
        }
        while (v93);
      }

      [v4 setObject:v90 forKey:@"dataSet"];
    }
    if ([*(id *)(a1 + 136) count])
    {
      v98 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 136), "count"));
      long long v186 = 0u;
      long long v187 = 0u;
      long long v188 = 0u;
      long long v189 = 0u;
      id v99 = *(id *)(a1 + 136);
      uint64_t v100 = [v99 countByEnumeratingWithState:&v186 objects:v223 count:16];
      if (v100)
      {
        uint64_t v101 = v100;
        uint64_t v102 = *(void *)v187;
        do
        {
          for (kuint64_t k = 0; kk != v101; ++kk)
          {
            if (*(void *)v187 != v102) {
              objc_enumerationMutation(v99);
            }
            long long v104 = *(void **)(*((void *)&v186 + 1) + 8 * kk);
            if (a2) {
              [v104 jsonRepresentation];
            }
            else {
            id v105 = [v104 dictionaryRepresentation];
            }

            [v98 addObject:v105];
          }
          uint64_t v101 = [v99 countByEnumeratingWithState:&v186 objects:v223 count:16];
        }
        while (v101);
      }

      [v4 setObject:v98 forKey:@"dataSetURLOverride"];
    }
    long long v106 = [(id)a1 realtimeTrafficProbeURL];
    if (v106) {
      [v4 setObject:v106 forKey:@"realtimeTrafficProbeURL"];
    }

    long long v107 = [(id)a1 batchTrafficProbeURL];
    if (v107) {
      [v4 setObject:v107 forKey:@"batchTrafficProbeURL"];
    }

    long long v108 = [(id)a1 proactiveRoutingURL];
    if (v108) {
      [v4 setObject:v108 forKey:@"proactiveRoutingURL"];
    }

    long long v109 = [(id)a1 logMessageUsageV3URL];
    if (v109) {
      [v4 setObject:v109 forKey:@"logMessageUsageV3URL"];
    }

    long long v110 = [(id)a1 backgroundDispatcherURL];
    if (v110) {
      [v4 setObject:v110 forKey:@"backgroundDispatcherURL"];
    }

    long long v111 = [(id)a1 bluePOIDispatcherURL];
    if (v111) {
      [v4 setObject:v111 forKey:@"bluePOIDispatcherURL"];
    }

    long long v112 = [(id)a1 backgroundRevGeoURL];
    if (v112) {
      [v4 setObject:v112 forKey:@"backgroundRevGeoURL"];
    }

    long long v113 = [(id)a1 wifiConnectionQualityProbeURL];
    if (v113) {
      [v4 setObject:v113 forKey:@"wifiConnectionQualityProbeURL"];
    }

    long long v114 = [(id)a1 muninBaseURL];
    if (v114) {
      [v4 setObject:v114 forKey:@"muninBaseURL"];
    }

    if ([*(id *)(a1 + 256) count])
    {
      long long v115 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 256), "count"));
      long long v182 = 0u;
      long long v183 = 0u;
      long long v184 = 0u;
      long long v185 = 0u;
      id v116 = *(id *)(a1 + 256);
      uint64_t v117 = [v116 countByEnumeratingWithState:&v182 objects:v222 count:16];
      if (v117)
      {
        uint64_t v118 = v117;
        uint64_t v119 = *(void *)v183;
        do
        {
          for (muint64_t m = 0; mm != v118; ++mm)
          {
            if (*(void *)v183 != v119) {
              objc_enumerationMutation(v116);
            }
            long long v121 = *(void **)(*((void *)&v182 + 1) + 8 * mm);
            if (a2) {
              [v121 jsonRepresentation];
            }
            else {
            id v122 = [v121 dictionaryRepresentation];
            }

            [v115 addObject:v122];
          }
          uint64_t v118 = [v116 countByEnumeratingWithState:&v182 objects:v222 count:16];
        }
        while (v118);
      }

      [v4 setObject:v115 forKey:@"muninVersion"];
    }
    long long v123 = [(id)a1 authProxyURL];
    if (v123) {
      [v4 setObject:v123 forKey:@"authProxyURL"];
    }

    if ([*(id *)(a1 + 440) count])
    {
      long long v124 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 440), "count"));
      long long v178 = 0u;
      long long v179 = 0u;
      long long v180 = 0u;
      long long v181 = 0u;
      id v125 = *(id *)(a1 + 440);
      uint64_t v126 = [v125 countByEnumeratingWithState:&v178 objects:v221 count:16];
      if (v126)
      {
        uint64_t v127 = v126;
        uint64_t v128 = *(void *)v179;
        do
        {
          for (nuint64_t n = 0; nn != v127; ++nn)
          {
            if (*(void *)v179 != v128) {
              objc_enumerationMutation(v125);
            }
            long long v130 = *(void **)(*((void *)&v178 + 1) + 8 * nn);
            if (a2) {
              [v130 jsonRepresentation];
            }
            else {
            id v131 = [v130 dictionaryRepresentation];
            }

            [v124 addObject:v131];
          }
          uint64_t v127 = [v125 countByEnumeratingWithState:&v178 objects:v221 count:16];
        }
        while (v127);
      }

      [v4 setObject:v124 forKey:@"urlInfoSet"];
    }
    if ([*(id *)(a1 + 248) count])
    {
      long long v132 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 248), "count"));
      long long v174 = 0u;
      long long v175 = 0u;
      long long v176 = 0u;
      long long v177 = 0u;
      id v133 = *(id *)(a1 + 248);
      uint64_t v134 = [v133 countByEnumeratingWithState:&v174 objects:v220 count:16];
      if (v134)
      {
        uint64_t v135 = v134;
        uint64_t v136 = *(void *)v175;
        do
        {
          for (uint64_t i1 = 0; i1 != v135; ++i1)
          {
            if (*(void *)v175 != v136) {
              objc_enumerationMutation(v133);
            }
            long long v138 = *(void **)(*((void *)&v174 + 1) + 8 * i1);
            if (a2) {
              [v138 jsonRepresentation];
            }
            else {
            id v139 = [v138 dictionaryRepresentation];
            }

            [v132 addObject:v139];
          }
          uint64_t v135 = [v133 countByEnumeratingWithState:&v174 objects:v220 count:16];
        }
        while (v135);
      }

      [v4 setObject:v132 forKey:@"muninBucket"];
    }
    if ([*(id *)(a1 + 168) count])
    {
      long long v140 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 168), "count"));
      long long v170 = 0u;
      long long v171 = 0u;
      long long v172 = 0u;
      long long v173 = 0u;
      id v141 = *(id *)(a1 + 168);
      uint64_t v142 = [v141 countByEnumeratingWithState:&v170 objects:v219 count:16];
      if (v142)
      {
        uint64_t v143 = v142;
        uint64_t v144 = *(void *)v171;
        do
        {
          for (uint64_t i2 = 0; i2 != v143; ++i2)
          {
            if (*(void *)v171 != v144) {
              objc_enumerationMutation(v141);
            }
            long long v146 = *(void **)(*((void *)&v170 + 1) + 8 * i2);
            if (a2) {
              [v146 jsonRepresentation];
            }
            else {
            id v147 = [v146 dictionaryRepresentation];
            }

            [v140 addObject:v147];
          }
          uint64_t v143 = [v141 countByEnumeratingWithState:&v170 objects:v219 count:16];
        }
        while (v143);
      }

      [v4 setObject:v140 forKey:@"displayStrings"];
    }
    if ([*(id *)(a1 + 264) count])
    {
      long long v148 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 264), "count"));
      long long v166 = 0u;
      long long v167 = 0u;
      long long v168 = 0u;
      long long v169 = 0u;
      id v149 = *(id *)(a1 + 264);
      uint64_t v150 = [v149 countByEnumeratingWithState:&v166 objects:v218 count:16];
      if (v150)
      {
        uint64_t v151 = v150;
        uint64_t v152 = *(void *)v167;
        do
        {
          for (uint64_t i3 = 0; i3 != v151; ++i3)
          {
            if (*(void *)v167 != v152) {
              objc_enumerationMutation(v149);
            }
            long long v154 = *(void **)(*((void *)&v166 + 1) + 8 * i3);
            if (a2) {
              [v154 jsonRepresentation];
            }
            else {
            id v155 = [v154 dictionaryRepresentation];
            }

            [v148 addObject:v155];
          }
          uint64_t v151 = [v149 countByEnumeratingWithState:&v166 objects:v218 count:16];
        }
        while (v151);
      }

      [v4 setObject:v148 forKey:@"offlineMetadata"];
    }
    long long v156 = *(void **)(a1 + 16);
    if (v156)
    {
      long long v157 = [v156 dictionaryRepresentation];
      long long v158 = v157;
      if (a2)
      {
        long long v159 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v157, "count"));
        v164[0] = MEMORY[0x1E4F143A8];
        v164[1] = 3221225472;
        v164[2] = __42__GEOResources__dictionaryRepresentation___block_invoke;
        v164[3] = &unk_1E53D8860;
        id v160 = v159;
        id v165 = v160;
        [v158 enumerateKeysAndObjectsUsingBlock:v164];
        id v161 = v160;

        long long v158 = v161;
      }
      [v4 setObject:v158 forKey:@"Unknown Fields"];
    }
    id v162 = v4;
  }
  else
  {
    id v162 = 0;
  }

  return v162;
}

- (id)jsonRepresentation
{
  return -[GEOResources _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __42__GEOResources__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
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

- (GEOResources)initWithDictionary:(id)a3
{
  return (GEOResources *)-[GEOResources _initWithDictionary:isJSON:]();
}

- (id)_initWithDictionary:isJSON:
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  char v357 = v1;
  id v2 = (id)v0;
  uint64_t v500 = *MEMORY[0x1E4F143B8];
  id v344 = v3;
  if (v2)
  {
    id v2 = (id)[v2 init];

    v356 = v2;
    if (v2)
    {
      id v4 = [v344 objectForKeyedSubscript:@"tileGroup"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v453 = 0u;
        long long v452 = 0u;
        long long v451 = 0u;
        long long v450 = 0u;
        id v5 = v4;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v450 objects:v495 count:16];
        if (v6)
        {
          uint64_t v7 = *(void *)v451;
          do
          {
            for (uint64_t i = 0; i != v6; ++i)
            {
              if (*(void *)v451 != v7) {
                objc_enumerationMutation(v5);
              }
              uint64_t v9 = *(void *)(*((void *)&v450 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v10 = [GEOTileGroup alloc];
                if (v357) {
                  uint64_t v11 = [(GEOTileGroup *)v10 initWithJSON:v9];
                }
                else {
                  uint64_t v11 = [(GEOTileGroup *)v10 initWithDictionary:v9];
                }
                id v12 = (void *)v11;
                [v356 addTileGroup:v11];
              }
            }
            uint64_t v6 = [v5 countByEnumeratingWithState:&v450 objects:v495 count:16];
          }
          while (v6);
        }
      }
      uint64_t v13 = [v344 objectForKeyedSubscript:@"tileSet"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v449 = 0u;
        long long v448 = 0u;
        long long v447 = 0u;
        long long v446 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v446 objects:v494 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v447;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v447 != v16) {
                objc_enumerationMutation(v14);
              }
              uint64_t v18 = *(void *)(*((void *)&v446 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v19 = [GEOTileSet alloc];
                if (v357) {
                  uint64_t v20 = [(GEOTileSet *)v19 initWithJSON:v18];
                }
                else {
                  uint64_t v20 = [(GEOTileSet *)v19 initWithDictionary:v18];
                }
                uint64_t v21 = (void *)v20;
                [v356 addTileSet:v20];
              }
            }
            uint64_t v15 = [v14 countByEnumeratingWithState:&v446 objects:v494 count:16];
          }
          while (v15);
        }
      }
      long long v22 = [v344 objectForKeyedSubscript:@"styleSheet"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v445 = 0u;
        long long v444 = 0u;
        long long v443 = 0u;
        long long v442 = 0u;
        id v23 = v22;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v442 objects:v493 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v443;
          do
          {
            for (uint64_t k = 0; k != v24; ++k)
            {
              if (*(void *)v443 != v25) {
                objc_enumerationMutation(v23);
              }
              uint64_t v27 = *(void **)(*((void *)&v442 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v28 = (void *)[v27 copy];
                [v356 addStyleSheet:v28];
              }
            }
            uint64_t v24 = [v23 countByEnumeratingWithState:&v442 objects:v493 count:16];
          }
          while (v24);
        }
      }
      uint64_t v29 = [v344 objectForKeyedSubscript:@"texture"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v441 = 0u;
        long long v440 = 0u;
        long long v439 = 0u;
        long long v438 = 0u;
        id v30 = v29;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v438 objects:v492 count:16];
        if (v31)
        {
          uint64_t v32 = *(void *)v439;
          do
          {
            for (uint64_t m = 0; m != v31; ++m)
            {
              if (*(void *)v439 != v32) {
                objc_enumerationMutation(v30);
              }
              v34 = *(void **)(*((void *)&v438 + 1) + 8 * m);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v35 = (void *)[v34 copy];
                [v356 addTexture:v35];
              }
            }
            uint64_t v31 = [v30 countByEnumeratingWithState:&v438 objects:v492 count:16];
          }
          while (v31);
        }
      }
      uint64_t v36 = [v344 objectForKeyedSubscript:@"font"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v437 = 0u;
        long long v436 = 0u;
        long long v435 = 0u;
        long long v434 = 0u;
        id v37 = v36;
        uint64_t v38 = [v37 countByEnumeratingWithState:&v434 objects:v491 count:16];
        if (v38)
        {
          uint64_t v39 = *(void *)v435;
          do
          {
            for (uint64_t n = 0; n != v38; ++n)
            {
              if (*(void *)v435 != v39) {
                objc_enumerationMutation(v37);
              }
              id v41 = *(void **)(*((void *)&v434 + 1) + 8 * n);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v42 = (void *)[v41 copy];
                [v356 addFont:v42];
              }
            }
            uint64_t v38 = [v37 countByEnumeratingWithState:&v434 objects:v491 count:16];
          }
          while (v38);
        }
      }
      uint64_t v43 = [v344 objectForKeyedSubscript:@"icon"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v433 = 0u;
        long long v432 = 0u;
        long long v431 = 0u;
        long long v430 = 0u;
        id v44 = v43;
        uint64_t v45 = [v44 countByEnumeratingWithState:&v430 objects:v490 count:16];
        if (v45)
        {
          uint64_t v46 = *(void *)v431;
          do
          {
            for (iuint64_t i = 0; ii != v45; ++ii)
            {
              if (*(void *)v431 != v46) {
                objc_enumerationMutation(v44);
              }
              uint64_t v48 = *(void **)(*((void *)&v430 + 1) + 8 * ii);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v49 = (void *)[v48 copy];
                [v356 addIcon:v49];
              }
            }
            uint64_t v45 = [v44 countByEnumeratingWithState:&v430 objects:v490 count:16];
          }
          while (v45);
        }
      }
      v343 = [v344 objectForKeyedSubscript:@"regionalResource"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v429 = 0u;
        long long v428 = 0u;
        long long v427 = 0u;
        long long v426 = 0u;
        obuint64_t j = v343;
        uint64_t v347 = [obj countByEnumeratingWithState:&v426 objects:v489 count:16];
        if (v347)
        {
          uint64_t v346 = *(void *)v427;
          do
          {
            uint64_t v50 = 0;
            do
            {
              if (*(void *)v427 != v346)
              {
                uint64_t v51 = v50;
                objc_enumerationMutation(obj);
                uint64_t v50 = v51;
              }
              uint64_t v352 = v50;
              uint64_t v52 = *(void **)(*((void *)&v426 + 1) + 8 * v50);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v53 = [GEORegionalResource alloc];
                if (v53)
                {
                  id v354 = v52;
                  uint64_t v54 = [(GEORegionalResource *)v53 init];
                  if (v54)
                  {
                    uint64_t v55 = [v354 objectForKeyedSubscript:@"x"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      int v56 = [v55 unsignedIntValue];
                      *(_WORD *)(v54 + 96) |= 0x100u;
                      *(_WORD *)(v54 + 96) |= 1u;
                      *(_DWORD *)(v54 + 84) = v56;
                    }

                    uint64_t v57 = [v354 objectForKeyedSubscript:@"y"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      int v58 = [v57 unsignedIntValue];
                      *(_WORD *)(v54 + 96) |= 0x100u;
                      *(_WORD *)(v54 + 96) |= 2u;
                      *(_DWORD *)(v54 + 88) = v58;
                    }

                    uint64_t v59 = [v354 objectForKeyedSubscript:@"z"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      int v60 = [v59 unsignedIntValue];
                      *(_WORD *)(v54 + 96) |= 0x100u;
                      *(_WORD *)(v54 + 96) |= 4u;
                      *(_DWORD *)(v54 + 92) = v60;
                    }

                    v348 = [v354 objectForKeyedSubscript:@"icon"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v471 = 0u;
                      long long v470 = 0u;
                      long long v469 = 0u;
                      long long v468 = 0u;
                      id v61 = v348;
                      uint64_t v62 = [v61 countByEnumeratingWithState:&v468 objects:v499 count:16];
                      if (v62)
                      {
                        uint64_t v63 = *(void *)v469;
                        do
                        {
                          for (juint64_t j = 0; jj != v62; ++jj)
                          {
                            if (*(void *)v469 != v63) {
                              objc_enumerationMutation(v61);
                            }
                            uint64_t v65 = *(void **)(*((void *)&v468 + 1) + 8 * jj);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              uint64_t v66 = (void *)[v65 copy];
                              -[GEORegionalResource addIcon:](v54, v66);
                            }
                          }
                          uint64_t v62 = [v61 countByEnumeratingWithState:&v468 objects:v499 count:16];
                        }
                        while (v62);
                      }
                    }
                    v349 = [v354 objectForKeyedSubscript:@"attribution"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v467 = 0u;
                      long long v466 = 0u;
                      long long v465 = 0u;
                      long long v464 = 0u;
                      id v67 = v349;
                      uint64_t v68 = [v67 countByEnumeratingWithState:&v464 objects:v498 count:16];
                      if (v68)
                      {
                        uint64_t v69 = *(void *)v465;
                        do
                        {
                          for (kuint64_t k = 0; kk != v68; ++kk)
                          {
                            if (*(void *)v465 != v69) {
                              objc_enumerationMutation(v67);
                            }
                            uint64_t v71 = *(void *)(*((void *)&v464 + 1) + 8 * kk);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              uint64_t v72 = [GEOAttribution alloc];
                              if (v357) {
                                id v73 = [(GEOAttribution *)v72 initWithJSON:v71];
                              }
                              else {
                                id v73 = [(GEOAttribution *)v72 initWithDictionary:v71];
                              }
                              uint64_t v74 = v73;
                              -[GEORegionalResource addAttribution:](v54, v73);
                            }
                          }
                          uint64_t v68 = [v67 countByEnumeratingWithState:&v464 objects:v498 count:16];
                        }
                        while (v68);
                      }
                    }
                    v350 = [v354 objectForKeyedSubscript:@"iconChecksum"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v463 = 0u;
                      long long v462 = 0u;
                      long long v461 = 0u;
                      long long v460 = 0u;
                      id v75 = v350;
                      uint64_t v76 = [v75 countByEnumeratingWithState:&v460 objects:v497 count:16];
                      if (v76)
                      {
                        uint64_t v77 = *(void *)v461;
                        do
                        {
                          for (muint64_t m = 0; mm != v76; ++mm)
                          {
                            if (*(void *)v461 != v77) {
                              objc_enumerationMutation(v75);
                            }
                            id v79 = *(void **)(*((void *)&v460 + 1) + 8 * mm);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              uint64_t v80 = (void *)[v79 copy];
                              -[GEORegionalResource addIconChecksum:](v54, v80);
                            }
                          }
                          uint64_t v76 = [v75 countByEnumeratingWithState:&v460 objects:v497 count:16];
                        }
                        while (v76);
                      }
                    }
                    v351 = [v354 objectForKeyedSubscript:@"tileRange"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v459 = 0u;
                      long long v458 = 0u;
                      long long v457 = 0u;
                      long long v456 = 0u;
                      id v81 = v351;
                      uint64_t v82 = [v81 countByEnumeratingWithState:&v456 objects:v496 count:16];
                      if (v82)
                      {
                        uint64_t v83 = *(void *)v457;
                        do
                        {
                          for (nuint64_t n = 0; nn != v82; ++nn)
                          {
                            if (*(void *)v457 != v83) {
                              objc_enumerationMutation(v81);
                            }
                            uint64_t v85 = *(void **)(*((void *)&v456 + 1) + 8 * nn);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              long long v454 = 0uLL;
                              uint64_t v455 = 0;
                              _GEOTileSetRegionFromDictionaryRepresentation(v85, &v454);
                              os_unfair_lock_lock((os_unfair_lock_t)(v54 + 80));
                              if ((*(_WORD *)(v54 + 96) & 0x10) == 0)
                              {
                                uint64_t v86 = *(void **)(v54 + 8);
                                if (v86)
                                {
                                  id v87 = v86;
                                  objc_sync_enter(v87);
                                  GEORegionalResourceReadSpecified(v54, *(void *)(v54 + 8), (int *)&_readTileRanges_tags);
                                  objc_sync_exit(v87);
                                }
                              }
                              os_unfair_lock_unlock((os_unfair_lock_t)(v54 + 80));
                              if (-[GEORegionalResource _reserveTileRanges:](v54, 1uLL))
                              {
                                uint64_t v88 = *(void *)(v54 + 24) + 24 * *(void *)(v54 + 32);
                                *(_OWORD *)uint64_t v88 = v454;
                                *(void *)(v88 + 16) = v455;
                                ++*(void *)(v54 + 32);
                              }
                              os_unfair_lock_lock_with_options();
                              *(_WORD *)(v54 + 96) |= 0x10u;
                              os_unfair_lock_unlock((os_unfair_lock_t)(v54 + 80));
                              *(_WORD *)(v54 + 96) |= 0x100u;
                            }
                          }
                          uint64_t v82 = [v81 countByEnumeratingWithState:&v456 objects:v496 count:16];
                        }
                        while (v82);
                      }
                    }
                  }
                }
                else
                {
                  uint64_t v54 = 0;
                }
                objc_msgSend(v356, "addRegionalResource:", v54, v343);
              }
              uint64_t v50 = v352 + 1;
            }
            while (v352 + 1 != v347);
            uint64_t v89 = [obj countByEnumeratingWithState:&v426 objects:v489 count:16];
            uint64_t v347 = v89;
          }
          while (v89);
        }
      }
      v90 = [v344 objectForKeyedSubscript:@"xml"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v425 = 0u;
        long long v424 = 0u;
        long long v423 = 0u;
        long long v422 = 0u;
        id v91 = v90;
        uint64_t v92 = [v91 countByEnumeratingWithState:&v422 objects:v488 count:16];
        if (v92)
        {
          uint64_t v93 = *(void *)v423;
          do
          {
            for (uint64_t i1 = 0; i1 != v92; ++i1)
            {
              if (*(void *)v423 != v93) {
                objc_enumerationMutation(v91);
              }
              uint64_t v95 = *(void **)(*((void *)&v422 + 1) + 8 * i1);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v96 = (void *)[v95 copy];
                [v356 addXml:v96];
              }
            }
            uint64_t v92 = [v91 countByEnumeratingWithState:&v422 objects:v488 count:16];
          }
          while (v92);
        }
      }
      id v97 = [v344 objectForKeyedSubscript:@"attribution"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v421 = 0u;
        long long v420 = 0u;
        long long v419 = 0u;
        long long v418 = 0u;
        id v98 = v97;
        uint64_t v99 = [v98 countByEnumeratingWithState:&v418 objects:v487 count:16];
        if (v99)
        {
          uint64_t v100 = *(void *)v419;
          do
          {
            for (uint64_t i2 = 0; i2 != v99; ++i2)
            {
              if (*(void *)v419 != v100) {
                objc_enumerationMutation(v98);
              }
              uint64_t v102 = *(void *)(*((void *)&v418 + 1) + 8 * i2);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v103 = [GEOAttribution alloc];
                if (v357) {
                  uint64_t v104 = [(GEOAttribution *)v103 initWithJSON:v102];
                }
                else {
                  uint64_t v104 = [(GEOAttribution *)v103 initWithDictionary:v102];
                }
                id v105 = (void *)v104;
                objc_msgSend(v356, "addAttribution:", v104, v343);
              }
            }
            uint64_t v99 = [v98 countByEnumeratingWithState:&v418 objects:v487 count:16];
          }
          while (v99);
        }
      }
      long long v106 = [v344 objectForKeyedSubscript:@"authToken"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v107 = (void *)[v106 copy];
        [v356 setAuthToken:v107];
      }
      long long v108 = [v344 objectForKeyedSubscript:@"resourcesURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v109 = (void *)[v108 copy];
        [v356 setResourcesURL:v109];
      }
      long long v110 = [v344 objectForKeyedSubscript:@"searchAttributionManifestURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v111 = (void *)[v110 copy];
        [v356 setSearchAttributionManifestURL:v111];
      }
      long long v112 = [v344 objectForKeyedSubscript:@"directionsURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v113 = (void *)[v112 copy];
        [v356 setDirectionsURL:v113];
      }
      long long v114 = [v344 objectForKeyedSubscript:@"etaURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v115 = (void *)[v114 copy];
        [v356 setEtaURL:v115];
      }
      id v116 = [v344 objectForKeyedSubscript:@"releaseInfo"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v117 = (void *)[v116 copy];
        [v356 setReleaseInfo:v117];
      }
      uint64_t v118 = [v344 objectForKeyedSubscript:@"batchReverseGeocoderURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v119 = (void *)[v118 copy];
        [v356 setBatchReverseGeocoderURL:v119];
      }
      long long v120 = [v344 objectForKeyedSubscript:@"simpleETAURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v121 = (void *)[v120 copy];
        [v356 setSimpleETAURL:v121];
      }
      id v122 = [v344 objectForKeyedSubscript:@"styleSheetChecksum"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v416 = 0u;
        long long v417 = 0u;
        long long v414 = 0u;
        long long v415 = 0u;
        id v123 = v122;
        uint64_t v124 = [v123 countByEnumeratingWithState:&v414 objects:v486 count:16];
        if (v124)
        {
          uint64_t v125 = *(void *)v415;
          do
          {
            for (uint64_t i3 = 0; i3 != v124; ++i3)
            {
              if (*(void *)v415 != v125) {
                objc_enumerationMutation(v123);
              }
              uint64_t v127 = *(void **)(*((void *)&v414 + 1) + 8 * i3);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v128 = (void *)[v127 copy];
                [v356 addStyleSheetChecksum:v128];
              }
            }
            uint64_t v124 = [v123 countByEnumeratingWithState:&v414 objects:v486 count:16];
          }
          while (v124);
        }
      }
      long long v129 = [v344 objectForKeyedSubscript:@"textureChecksum"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v412 = 0u;
        long long v413 = 0u;
        long long v410 = 0u;
        long long v411 = 0u;
        id v130 = v129;
        uint64_t v131 = [v130 countByEnumeratingWithState:&v410 objects:v485 count:16];
        if (v131)
        {
          uint64_t v132 = *(void *)v411;
          do
          {
            for (uint64_t i4 = 0; i4 != v131; ++i4)
            {
              if (*(void *)v411 != v132) {
                objc_enumerationMutation(v130);
              }
              uint64_t v134 = *(void **)(*((void *)&v410 + 1) + 8 * i4);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v135 = (void *)[v134 copy];
                [v356 addTextureChecksum:v135];
              }
            }
            uint64_t v131 = [v130 countByEnumeratingWithState:&v410 objects:v485 count:16];
          }
          while (v131);
        }
      }
      uint64_t v136 = [v344 objectForKeyedSubscript:@"fontChecksum"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v408 = 0u;
        long long v409 = 0u;
        long long v406 = 0u;
        long long v407 = 0u;
        id v137 = v136;
        uint64_t v138 = [v137 countByEnumeratingWithState:&v406 objects:v484 count:16];
        if (v138)
        {
          uint64_t v139 = *(void *)v407;
          do
          {
            for (uint64_t i5 = 0; i5 != v138; ++i5)
            {
              if (*(void *)v407 != v139) {
                objc_enumerationMutation(v137);
              }
              id v141 = *(void **)(*((void *)&v406 + 1) + 8 * i5);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v142 = (void *)[v141 copy];
                [v356 addFontChecksum:v142];
              }
            }
            uint64_t v138 = [v137 countByEnumeratingWithState:&v406 objects:v484 count:16];
          }
          while (v138);
        }
      }
      uint64_t v143 = [v344 objectForKeyedSubscript:@"iconChecksum"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v404 = 0u;
        long long v405 = 0u;
        long long v402 = 0u;
        long long v403 = 0u;
        id v144 = v143;
        uint64_t v145 = [v144 countByEnumeratingWithState:&v402 objects:v483 count:16];
        if (v145)
        {
          uint64_t v146 = *(void *)v403;
          do
          {
            for (uint64_t i6 = 0; i6 != v145; ++i6)
            {
              if (*(void *)v403 != v146) {
                objc_enumerationMutation(v144);
              }
              long long v148 = *(void **)(*((void *)&v402 + 1) + 8 * i6);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v149 = (void *)[v148 copy];
                [v356 addIconChecksum:v149];
              }
            }
            uint64_t v145 = [v144 countByEnumeratingWithState:&v402 objects:v483 count:16];
          }
          while (v145);
        }
      }
      uint64_t v150 = [v344 objectForKeyedSubscript:@"xmlChecksum"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v400 = 0u;
        long long v401 = 0u;
        long long v398 = 0u;
        long long v399 = 0u;
        id v151 = v150;
        uint64_t v152 = [v151 countByEnumeratingWithState:&v398 objects:v482 count:16];
        if (v152)
        {
          uint64_t v153 = *(void *)v399;
          do
          {
            for (uint64_t i7 = 0; i7 != v152; ++i7)
            {
              if (*(void *)v399 != v153) {
                objc_enumerationMutation(v151);
              }
              id v155 = *(void **)(*((void *)&v398 + 1) + 8 * i7);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v156 = (void *)[v155 copy];
                [v356 addXmlChecksum:v156];
              }
            }
            uint64_t v152 = [v151 countByEnumeratingWithState:&v398 objects:v482 count:16];
          }
          while (v152);
        }
      }
      long long v157 = [v344 objectForKeyedSubscript:@"addressCorrectionInitURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v158 = (void *)[v157 copy];
        [v356 setAddressCorrectionInitURL:v158];
      }
      long long v159 = [v344 objectForKeyedSubscript:@"addressCorrectionUpdateURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v160 = (void *)[v159 copy];
        [v356 setAddressCorrectionUpdateURL:v160];
      }
      id v161 = [v344 objectForKeyedSubscript:@"polyLocationShiftURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v162 = (void *)[v161 copy];
        [v356 setPolyLocationShiftURL:v162];
      }
      long long v163 = [v344 objectForKeyedSubscript:@"problemSubmissionURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v164 = (void *)[v163 copy];
        [v356 setProblemSubmissionURL:v164];
      }
      id v165 = [v344 objectForKeyedSubscript:@"problemStatusURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v166 = (void *)[v165 copy];
        [v356 setProblemStatusURL:v166];
      }
      long long v167 = [v344 objectForKeyedSubscript:@"reverseGeocoderVersionsURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v168 = (void *)[v167 copy];
        [v356 setReverseGeocoderVersionsURL:v168];
      }
      long long v169 = [v344 objectForKeyedSubscript:@"problemCategoriesURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v170 = (void *)[v169 copy];
        [v356 setProblemCategoriesURL:v170];
      }
      long long v171 = [v344 objectForKeyedSubscript:@"announcementsURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v172 = (void *)[v171 copy];
        [v356 setAnnouncementsURL:v172];
      }
      long long v173 = [v344 objectForKeyedSubscript:@"announcementsSupportedLanguages"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v396 = 0u;
        long long v397 = 0u;
        long long v394 = 0u;
        long long v395 = 0u;
        id v174 = v173;
        uint64_t v175 = [v174 countByEnumeratingWithState:&v394 objects:v481 count:16];
        if (v175)
        {
          uint64_t v176 = *(void *)v395;
          do
          {
            for (uint64_t i8 = 0; i8 != v175; ++i8)
            {
              if (*(void *)v395 != v176) {
                objc_enumerationMutation(v174);
              }
              long long v178 = *(void **)(*((void *)&v394 + 1) + 8 * i8);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v179 = (void *)[v178 copy];
                [v356 addAnnouncementsSupportedLanguages:v179];
              }
            }
            uint64_t v175 = [v174 countByEnumeratingWithState:&v394 objects:v481 count:16];
          }
          while (v175);
        }
      }
      long long v180 = [v344 objectForKeyedSubscript:@"dispatcherURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v181 = (void *)[v180 copy];
        [v356 setDispatcherURL:v181];
      }
      long long v182 = [v344 objectForKeyedSubscript:@"problemOptInURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v183 = (void *)[v182 copy];
        [v356 setProblemOptInURL:v183];
      }
      long long v184 = [v344 objectForKeyedSubscript:@"versionManifest"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v185 = [GEOVersionManifest alloc];
        if (v357) {
          uint64_t v186 = [(GEOVersionManifest *)v185 initWithJSON:v184];
        }
        else {
          uint64_t v186 = [(GEOVersionManifest *)v185 initWithDictionary:v184];
        }
        long long v187 = (void *)v186;
        objc_msgSend(v356, "setVersionManifest:", v186, v343);
      }
      long long v188 = [v344 objectForKeyedSubscript:@"abExperimentURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v189 = (void *)[v188 copy];
        [v356 setAbExperimentURL:v189];
      }
      long long v190 = [v344 objectForKeyedSubscript:@"businessPortalBaseURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v191 = (void *)[v190 copy];
        [v356 setBusinessPortalBaseURL:v191];
      }
      long long v192 = [v344 objectForKeyedSubscript:@"logMessageUsageURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v193 = (void *)[v192 copy];
        [v356 setLogMessageUsageURL:v193];
      }
      long long v194 = [v344 objectForKeyedSubscript:@"locationShiftEnabledRegion"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v392 = 0u;
        long long v393 = 0u;
        long long v390 = 0u;
        long long v391 = 0u;
        id v195 = v194;
        uint64_t v196 = [v195 countByEnumeratingWithState:&v390 objects:v480 count:16];
        if (v196)
        {
          uint64_t v197 = *(void *)v391;
          do
          {
            for (uint64_t i9 = 0; i9 != v196; ++i9)
            {
              if (*(void *)v391 != v197) {
                objc_enumerationMutation(v195);
              }
              uint64_t v199 = *(void *)(*((void *)&v390 + 1) + 8 * i9);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v200 = [GEOMapRegion alloc];
                if (v357) {
                  uint64_t v201 = [(GEOMapRegion *)v200 initWithJSON:v199];
                }
                else {
                  uint64_t v201 = [(GEOMapRegion *)v200 initWithDictionary:v199];
                }
                long long v202 = (void *)v201;
                objc_msgSend(v356, "addLocationShiftEnabledRegion:", v201, v343);
              }
            }
            uint64_t v196 = [v195 countByEnumeratingWithState:&v390 objects:v480 count:16];
          }
          while (v196);
        }
      }
      long long v203 = [v344 objectForKeyedSubscript:@"locationShiftVersion"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(v356, "setLocationShiftVersion:", objc_msgSend(v203, "unsignedIntValue"));
      }

      long long v204 = [v344 objectForKeyedSubscript:@"resource"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v388 = 0u;
        long long v389 = 0u;
        long long v386 = 0u;
        long long v387 = 0u;
        id v205 = v204;
        uint64_t v206 = [v205 countByEnumeratingWithState:&v386 objects:v479 count:16];
        if (v206)
        {
          uint64_t v207 = *(void *)v387;
          do
          {
            for (uint64_t i10 = 0; i10 != v206; ++i10)
            {
              if (*(void *)v387 != v207) {
                objc_enumerationMutation(v205);
              }
              uint64_t v209 = *(void *)(*((void *)&v386 + 1) + 8 * i10);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v210 = [GEOResource alloc];
                if (v357) {
                  uint64_t v211 = [(GEOResource *)v210 initWithJSON:v209];
                }
                else {
                  uint64_t v211 = [(GEOResource *)v210 initWithDictionary:v209];
                }
                long long v212 = (void *)v211;
                objc_msgSend(v356, "addResource:", v211, v343);
              }
            }
            uint64_t v206 = [v205 countByEnumeratingWithState:&v386 objects:v479 count:16];
          }
          while (v206);
        }
      }
      long long v213 = [v344 objectForKeyedSubscript:@"spatialLookupURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v214 = (void *)[v213 copy];
        [v356 setSpatialLookupURL:v214];
      }
      long long v215 = [v344 objectForKeyedSubscript:@"dataSet"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v384 = 0u;
        long long v385 = 0u;
        long long v382 = 0u;
        long long v383 = 0u;
        id v216 = v215;
        uint64_t v217 = [v216 countByEnumeratingWithState:&v382 objects:v478 count:16];
        if (v217)
        {
          uint64_t v218 = *(void *)v383;
          do
          {
            for (uint64_t i11 = 0; i11 != v217; ++i11)
            {
              if (*(void *)v383 != v218) {
                objc_enumerationMutation(v216);
              }
              uint64_t v220 = *(void *)(*((void *)&v382 + 1) + 8 * i11);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v221 = [GEODataSetDescription alloc];
                if (v357) {
                  uint64_t v222 = [(GEODataSetDescription *)v221 initWithJSON:v220];
                }
                else {
                  uint64_t v222 = [(GEODataSetDescription *)v221 initWithDictionary:v220];
                }
                long long v223 = (void *)v222;
                objc_msgSend(v356, "addDataSet:", v222, v343);
              }
            }
            uint64_t v217 = [v216 countByEnumeratingWithState:&v382 objects:v478 count:16];
          }
          while (v217);
        }
      }
      v353 = [v344 objectForKeyedSubscript:@"dataSetURLOverride"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v380 = 0u;
        long long v381 = 0u;
        long long v378 = 0u;
        long long v379 = 0u;
        id v224 = v353;
        uint64_t v225 = [v224 countByEnumeratingWithState:&v378 objects:v477 count:16];
        if (v225)
        {
          uint64_t v355 = *(void *)v379;
          do
          {
            for (uint64_t i12 = 0; i12 != v225; ++i12)
            {
              if (*(void *)v379 != v355) {
                objc_enumerationMutation(v224);
              }
              long long v227 = *(void **)(*((void *)&v378 + 1) + 8 * i12);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v228 = [GEODataSetURLOverride alloc];
                if (v228)
                {
                  id v229 = v227;
                  long long v228 = [(GEODataSetURLOverride *)v228 init];
                  if (v228)
                  {
                    long long v230 = [v229 objectForKeyedSubscript:@"dataSet"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      unsigned int v231 = [v230 unsignedIntValue];
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      *(_DWORD *)&v228->_flags |= 1u;
                      v228->_dataSet = v231;
                    }

                    long long v232 = [v229 objectForKeyedSubscript:@"directionsURL"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v233 = (void *)[v232 copy];
                      id v234 = v233;
                      *(_DWORD *)&v228->_flags |= 0x80u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_directionsURL, v233);
                    }
                    long long v235 = [v229 objectForKeyedSubscript:@"etaURL"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v236 = (void *)[v235 copy];
                      id v237 = v236;
                      *(_DWORD *)&v228->_flags |= 0x200u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_etaURL, v236);
                    }
                    long long v238 = [v229 objectForKeyedSubscript:@"batchReverseGeocoderURL"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v239 = (void *)[v238 copy];
                      id v240 = v239;
                      *(_DWORD *)&v228->_flags |= 0x20u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_batchReverseGeocoderURL, v239);
                    }
                    long long v241 = [v229 objectForKeyedSubscript:@"simpleETAURL"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v242 = (void *)[v241 copy];
                      id v243 = v242;
                      *(_DWORD *)&v228->_flags |= 0x8000u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_simpleETAURL, v242);
                    }
                    long long v244 = [v229 objectForKeyedSubscript:@"addressCorrectionInitURL"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v245 = (void *)[v244 copy];
                      id v246 = v245;
                      *(_DWORD *)&v228->_flags |= 4u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_addressCorrectionInitURL, v245);
                    }
                    long long v247 = [v229 objectForKeyedSubscript:@"addressCorrectionUpdateURL"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v248 = (void *)[v247 copy];
                      id v249 = v248;
                      *(_DWORD *)&v228->_flags |= 8u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_addressCorrectionUpdateURL, v248);
                    }
                    long long v250 = [v229 objectForKeyedSubscript:@"problemSubmissionURL"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v251 = (void *)[v250 copy];
                      id v252 = v251;
                      *(_DWORD *)&v228->_flags |= 0x4000u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_problemSubmissionURL, v251);
                    }
                    long long v253 = [v229 objectForKeyedSubscript:@"problemStatusURL"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v254 = (void *)[v253 copy];
                      id v255 = v254;
                      *(_DWORD *)&v228->_flags |= 0x2000u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_problemStatusURL, v254);
                    }
                    long long v256 = [v229 objectForKeyedSubscript:@"problemCategoriesURL"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v257 = (void *)[v256 copy];
                      id v258 = v257;
                      *(_DWORD *)&v228->_flags |= 0x800u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_problemCategoriesURL, v257);
                    }
                    long long v259 = [v229 objectForKeyedSubscript:@"announcementsURL"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v260 = (void *)[v259 copy];
                      id v261 = v260;
                      *(_DWORD *)&v228->_flags |= 0x10u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_announcementsURL, v260);
                    }
                    long long v262 = [v229 objectForKeyedSubscript:@"dispatcherURL"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v263 = (void *)[v262 copy];
                      id v264 = v263;
                      *(_DWORD *)&v228->_flags |= 0x100u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_dispatcherURL, v263);
                    }
                    long long v265 = [v229 objectForKeyedSubscript:@"problemOptInURL"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v266 = (void *)[v265 copy];
                      id v267 = v266;
                      *(_DWORD *)&v228->_flags |= 0x1000u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_problemOptInURL, v266);
                    }
                    long long v268 = [v229 objectForKeyedSubscript:@"businessPortalBaseURL"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v269 = (void *)[v268 copy];
                      id v270 = v269;
                      *(_DWORD *)&v228->_flags |= 0x40u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_businessPortalBaseURL, v269);
                    }
                    long long v271 = [v229 objectForKeyedSubscript:@"logMessageUsageURL"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v272 = (void *)[v271 copy];
                      id v273 = v272;
                      *(_DWORD *)&v228->_flags |= 0x400u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_logMessageUsageURL, v272);
                    }
                    long long v274 = [v229 objectForKeyedSubscript:@"spatialLookupURL"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v275 = (void *)[v274 copy];
                      id v276 = v275;
                      *(_DWORD *)&v228->_flags |= 0x10000u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_spatialLookupURL, v275);
                    }
                  }
                }
                objc_msgSend(v356, "addDataSetURLOverride:", v228, v343);
              }
            }
            uint64_t v225 = [v224 countByEnumeratingWithState:&v378 objects:v477 count:16];
          }
          while (v225);
        }
      }
      long long v277 = [v344 objectForKeyedSubscript:@"realtimeTrafficProbeURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v278 = (void *)[v277 copy];
        [v356 setRealtimeTrafficProbeURL:v278];
      }
      long long v279 = [v344 objectForKeyedSubscript:@"batchTrafficProbeURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v280 = (void *)[v279 copy];
        [v356 setBatchTrafficProbeURL:v280];
      }
      long long v281 = [v344 objectForKeyedSubscript:@"proactiveRoutingURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v282 = (void *)[v281 copy];
        [v356 setProactiveRoutingURL:v282];
      }
      long long v283 = [v344 objectForKeyedSubscript:@"logMessageUsageV3URL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v284 = (void *)[v283 copy];
        [v356 setLogMessageUsageV3URL:v284];
      }
      long long v285 = [v344 objectForKeyedSubscript:@"backgroundDispatcherURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v286 = (void *)[v285 copy];
        [v356 setBackgroundDispatcherURL:v286];
      }
      long long v287 = [v344 objectForKeyedSubscript:@"bluePOIDispatcherURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v288 = (void *)[v287 copy];
        [v356 setBluePOIDispatcherURL:v288];
      }
      long long v289 = [v344 objectForKeyedSubscript:@"backgroundRevGeoURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v290 = (void *)[v289 copy];
        [v356 setBackgroundRevGeoURL:v290];
      }
      long long v291 = [v344 objectForKeyedSubscript:@"wifiConnectionQualityProbeURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v292 = (void *)[v291 copy];
        [v356 setWifiConnectionQualityProbeURL:v292];
      }
      v293 = [v344 objectForKeyedSubscript:@"muninBaseURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v294 = (void *)[v293 copy];
        [v356 setMuninBaseURL:v294];
      }
      v295 = [v344 objectForKeyedSubscript:@"muninVersion"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v376 = 0u;
        long long v377 = 0u;
        long long v374 = 0u;
        long long v375 = 0u;
        id v296 = v295;
        uint64_t v297 = [v296 countByEnumeratingWithState:&v374 objects:v476 count:16];
        if (v297)
        {
          uint64_t v298 = *(void *)v375;
          do
          {
            for (uint64_t i13 = 0; i13 != v297; ++i13)
            {
              if (*(void *)v375 != v298) {
                objc_enumerationMutation(v296);
              }
              uint64_t v300 = *(void *)(*((void *)&v374 + 1) + 8 * i13);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v301 = [GEOMuninVersion alloc];
                if (v357) {
                  uint64_t v302 = [(GEOMuninVersion *)v301 initWithJSON:v300];
                }
                else {
                  uint64_t v302 = [(GEOMuninVersion *)v301 initWithDictionary:v300];
                }
                v303 = (void *)v302;
                objc_msgSend(v356, "addMuninVersion:", v302, v343);
              }
            }
            uint64_t v297 = [v296 countByEnumeratingWithState:&v374 objects:v476 count:16];
          }
          while (v297);
        }
      }
      v304 = [v344 objectForKeyedSubscript:@"authProxyURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v305 = (void *)[v304 copy];
        [v356 setAuthProxyURL:v305];
      }
      v306 = [v344 objectForKeyedSubscript:@"urlInfoSet"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v372 = 0u;
        long long v373 = 0u;
        long long v370 = 0u;
        long long v371 = 0u;
        id v307 = v306;
        uint64_t v308 = [v307 countByEnumeratingWithState:&v370 objects:v475 count:16];
        if (v308)
        {
          uint64_t v309 = *(void *)v371;
          do
          {
            for (uint64_t i14 = 0; i14 != v308; ++i14)
            {
              if (*(void *)v371 != v309) {
                objc_enumerationMutation(v307);
              }
              uint64_t v311 = *(void *)(*((void *)&v370 + 1) + 8 * i14);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v312 = [GEOURLInfoSet alloc];
                if (v357) {
                  uint64_t v313 = [(GEOURLInfoSet *)v312 initWithJSON:v311];
                }
                else {
                  uint64_t v313 = [(GEOURLInfoSet *)v312 initWithDictionary:v311];
                }
                v314 = (void *)v313;
                objc_msgSend(v356, "addUrlInfoSet:", v313, v343);
              }
            }
            uint64_t v308 = [v307 countByEnumeratingWithState:&v370 objects:v475 count:16];
          }
          while (v308);
        }
      }
      v315 = [v344 objectForKeyedSubscript:@"muninBucket"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v368 = 0u;
        long long v369 = 0u;
        long long v366 = 0u;
        long long v367 = 0u;
        id v316 = v315;
        uint64_t v317 = [v316 countByEnumeratingWithState:&v366 objects:v474 count:16];
        if (v317)
        {
          uint64_t v318 = *(void *)v367;
          do
          {
            for (uint64_t i15 = 0; i15 != v317; ++i15)
            {
              if (*(void *)v367 != v318) {
                objc_enumerationMutation(v316);
              }
              uint64_t v320 = *(void *)(*((void *)&v366 + 1) + 8 * i15);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v321 = [GEOMuninBucket alloc];
                if (v357) {
                  uint64_t v322 = [(GEOMuninBucket *)v321 initWithJSON:v320];
                }
                else {
                  uint64_t v322 = [(GEOMuninBucket *)v321 initWithDictionary:v320];
                }
                v323 = (void *)v322;
                objc_msgSend(v356, "addMuninBucket:", v322, v343);
              }
            }
            uint64_t v317 = [v316 countByEnumeratingWithState:&v366 objects:v474 count:16];
          }
          while (v317);
        }
      }
      v324 = [v344 objectForKeyedSubscript:@"displayStrings"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v364 = 0u;
        long long v365 = 0u;
        long long v362 = 0u;
        long long v363 = 0u;
        id v325 = v324;
        uint64_t v326 = [v325 countByEnumeratingWithState:&v362 objects:v473 count:16];
        if (v326)
        {
          uint64_t v327 = *(void *)v363;
          do
          {
            for (uint64_t i16 = 0; i16 != v326; ++i16)
            {
              if (*(void *)v363 != v327) {
                objc_enumerationMutation(v325);
              }
              uint64_t v329 = *(void *)(*((void *)&v362 + 1) + 8 * i16);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v330 = [GEODisplayString alloc];
                if (v357) {
                  uint64_t v331 = [(GEODisplayString *)v330 initWithJSON:v329];
                }
                else {
                  uint64_t v331 = [(GEODisplayString *)v330 initWithDictionary:v329];
                }
                v332 = (void *)v331;
                objc_msgSend(v356, "addDisplayStrings:", v331, v343);
              }
            }
            uint64_t v326 = [v325 countByEnumeratingWithState:&v362 objects:v473 count:16];
          }
          while (v326);
        }
      }
      v333 = [v344 objectForKeyedSubscript:@"offlineMetadata"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v360 = 0u;
        long long v361 = 0u;
        long long v358 = 0u;
        long long v359 = 0u;
        id v334 = v333;
        uint64_t v335 = [v334 countByEnumeratingWithState:&v358 objects:v472 count:16];
        if (v335)
        {
          uint64_t v336 = *(void *)v359;
          do
          {
            for (uint64_t i17 = 0; i17 != v335; ++i17)
            {
              if (*(void *)v359 != v336) {
                objc_enumerationMutation(v334);
              }
              uint64_t v338 = *(void *)(*((void *)&v358 + 1) + 8 * i17);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v339 = [GEOOfflineMetadata alloc];
                if (v357) {
                  uint64_t v340 = [(GEOOfflineMetadata *)v339 initWithJSON:v338];
                }
                else {
                  uint64_t v340 = [(GEOOfflineMetadata *)v339 initWithDictionary:v338];
                }
                v341 = (void *)v340;
                objc_msgSend(v356, "addOfflineMetadata:", v340, v343);
              }
            }
            uint64_t v335 = [v334 countByEnumeratingWithState:&v358 objects:v472 count:16];
          }
          while (v335);
        }
      }
      id v2 = v356;
    }
  }

  return v2;
}

- (GEOResources)initWithJSON:(id)a3
{
  return (GEOResources *)-[GEOResources _initWithDictionary:isJSON:]();
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_862;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_863;
    }
    GEOResourcesReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOResourcesCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOResourcesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOResourcesReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOResources _readLocationShiftEnabledRegions]((uint64_t)self);
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
  uint64_t v100 = (id *)a3;
  [(GEOResources *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v100 + 1, self->_reader);
  *((_DWORD *)v100 + 120) = self->_readerMarkPos;
  *((_DWORD *)v100 + 121) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOResources *)self tileGroupsCount])
  {
    [v100 clearTileGroups];
    unint64_t v4 = [(GEOResources *)self tileGroupsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOResources *)self tileGroupAtIndex:i];
        [v100 addTileGroup:v7];
      }
    }
  }
  if ([(GEOResources *)self tileSetsCount])
  {
    [v100 clearTileSets];
    unint64_t v8 = [(GEOResources *)self tileSetsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOResources *)self tileSetAtIndex:j];
        [v100 addTileSet:v11];
      }
    }
  }
  if ([(GEOResources *)self styleSheetsCount])
  {
    [v100 clearStyleSheets];
    unint64_t v12 = [(GEOResources *)self styleSheetsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        long long v15 = [(GEOResources *)self styleSheetAtIndex:k];
        [v100 addStyleSheet:v15];
      }
    }
  }
  if ([(GEOResources *)self texturesCount])
  {
    [v100 clearTextures];
    unint64_t v16 = [(GEOResources *)self texturesCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(GEOResources *)self textureAtIndex:m];
        [v100 addTexture:v19];
      }
    }
  }
  if ([(GEOResources *)self fontsCount])
  {
    [v100 clearFonts];
    unint64_t v20 = [(GEOResources *)self fontsCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (uint64_t n = 0; n != v21; ++n)
      {
        id v23 = [(GEOResources *)self fontAtIndex:n];
        [v100 addFont:v23];
      }
    }
  }
  if ([(GEOResources *)self iconsCount])
  {
    [v100 clearIcons];
    unint64_t v24 = [(GEOResources *)self iconsCount];
    if (v24)
    {
      unint64_t v25 = v24;
      for (iuint64_t i = 0; ii != v25; ++ii)
      {
        uint64_t v27 = [(GEOResources *)self iconAtIndex:ii];
        [v100 addIcon:v27];
      }
    }
  }
  if ([(GEOResources *)self regionalResourcesCount])
  {
    [v100 clearRegionalResources];
    unint64_t v28 = [(GEOResources *)self regionalResourcesCount];
    if (v28)
    {
      unint64_t v29 = v28;
      for (juint64_t j = 0; jj != v29; ++jj)
      {
        uint64_t v31 = [(GEOResources *)self regionalResourceAtIndex:jj];
        [v100 addRegionalResource:v31];
      }
    }
  }
  if ([(GEOResources *)self xmlsCount])
  {
    [v100 clearXmls];
    unint64_t v32 = [(GEOResources *)self xmlsCount];
    if (v32)
    {
      unint64_t v33 = v32;
      for (kuint64_t k = 0; kk != v33; ++kk)
      {
        id v35 = [(GEOResources *)self xmlAtIndex:kk];
        [v100 addXml:v35];
      }
    }
  }
  if ([(GEOResources *)self attributionsCount])
  {
    [v100 clearAttributions];
    unint64_t v36 = [(GEOResources *)self attributionsCount];
    if (v36)
    {
      unint64_t v37 = v36;
      for (muint64_t m = 0; mm != v37; ++mm)
      {
        uint64_t v39 = [(GEOResources *)self attributionAtIndex:mm];
        [v100 addAttribution:v39];
      }
    }
  }
  if (self->_authToken) {
    objc_msgSend(v100, "setAuthToken:");
  }
  if (self->_resourcesURL) {
    objc_msgSend(v100, "setResourcesURL:");
  }
  if (self->_searchAttributionManifestURL) {
    objc_msgSend(v100, "setSearchAttributionManifestURL:");
  }
  if (self->_directionsURL) {
    objc_msgSend(v100, "setDirectionsURL:");
  }
  if (self->_etaURL) {
    objc_msgSend(v100, "setEtaURL:");
  }
  if (self->_releaseInfo) {
    objc_msgSend(v100, "setReleaseInfo:");
  }
  if (self->_batchReverseGeocoderURL) {
    objc_msgSend(v100, "setBatchReverseGeocoderURL:");
  }
  if (self->_simpleETAURL) {
    objc_msgSend(v100, "setSimpleETAURL:");
  }
  if ([(GEOResources *)self styleSheetChecksumsCount])
  {
    [v100 clearStyleSheetChecksums];
    unint64_t v40 = [(GEOResources *)self styleSheetChecksumsCount];
    if (v40)
    {
      unint64_t v41 = v40;
      for (nuint64_t n = 0; nn != v41; ++nn)
      {
        uint64_t v43 = [(GEOResources *)self styleSheetChecksumAtIndex:nn];
        [v100 addStyleSheetChecksum:v43];
      }
    }
  }
  if ([(GEOResources *)self textureChecksumsCount])
  {
    [v100 clearTextureChecksums];
    unint64_t v44 = [(GEOResources *)self textureChecksumsCount];
    if (v44)
    {
      unint64_t v45 = v44;
      for (uint64_t i1 = 0; i1 != v45; ++i1)
      {
        uint64_t v47 = [(GEOResources *)self textureChecksumAtIndex:i1];
        [v100 addTextureChecksum:v47];
      }
    }
  }
  if ([(GEOResources *)self fontChecksumsCount])
  {
    [v100 clearFontChecksums];
    unint64_t v48 = [(GEOResources *)self fontChecksumsCount];
    if (v48)
    {
      unint64_t v49 = v48;
      for (uint64_t i2 = 0; i2 != v49; ++i2)
      {
        uint64_t v51 = [(GEOResources *)self fontChecksumAtIndex:i2];
        [v100 addFontChecksum:v51];
      }
    }
  }
  if ([(GEOResources *)self iconChecksumsCount])
  {
    [v100 clearIconChecksums];
    unint64_t v52 = [(GEOResources *)self iconChecksumsCount];
    if (v52)
    {
      unint64_t v53 = v52;
      for (uint64_t i3 = 0; i3 != v53; ++i3)
      {
        uint64_t v55 = [(GEOResources *)self iconChecksumAtIndex:i3];
        [v100 addIconChecksum:v55];
      }
    }
  }
  if ([(GEOResources *)self xmlChecksumsCount])
  {
    [v100 clearXmlChecksums];
    unint64_t v56 = [(GEOResources *)self xmlChecksumsCount];
    if (v56)
    {
      unint64_t v57 = v56;
      for (uint64_t i4 = 0; i4 != v57; ++i4)
      {
        uint64_t v59 = [(GEOResources *)self xmlChecksumAtIndex:i4];
        [v100 addXmlChecksum:v59];
      }
    }
  }
  if (self->_addressCorrectionInitURL) {
    objc_msgSend(v100, "setAddressCorrectionInitURL:");
  }
  if (self->_addressCorrectionUpdateURL) {
    objc_msgSend(v100, "setAddressCorrectionUpdateURL:");
  }
  if (self->_polyLocationShiftURL) {
    objc_msgSend(v100, "setPolyLocationShiftURL:");
  }
  if (self->_problemSubmissionURL) {
    objc_msgSend(v100, "setProblemSubmissionURL:");
  }
  if (self->_problemStatusURL) {
    objc_msgSend(v100, "setProblemStatusURL:");
  }
  if (self->_reverseGeocoderVersionsURL) {
    objc_msgSend(v100, "setReverseGeocoderVersionsURL:");
  }
  if (self->_problemCategoriesURL) {
    objc_msgSend(v100, "setProblemCategoriesURL:");
  }
  if (self->_announcementsURL) {
    objc_msgSend(v100, "setAnnouncementsURL:");
  }
  if ([(GEOResources *)self announcementsSupportedLanguagesCount])
  {
    [v100 clearAnnouncementsSupportedLanguages];
    unint64_t v60 = [(GEOResources *)self announcementsSupportedLanguagesCount];
    if (v60)
    {
      unint64_t v61 = v60;
      for (uint64_t i5 = 0; i5 != v61; ++i5)
      {
        uint64_t v63 = [(GEOResources *)self announcementsSupportedLanguagesAtIndex:i5];
        [v100 addAnnouncementsSupportedLanguages:v63];
      }
    }
  }
  if (self->_dispatcherURL) {
    objc_msgSend(v100, "setDispatcherURL:");
  }
  if (self->_problemOptInURL) {
    objc_msgSend(v100, "setProblemOptInURL:");
  }
  if (self->_versionManifest) {
    objc_msgSend(v100, "setVersionManifest:");
  }
  if (self->_abExperimentURL) {
    objc_msgSend(v100, "setAbExperimentURL:");
  }
  if (self->_businessPortalBaseURL) {
    objc_msgSend(v100, "setBusinessPortalBaseURL:");
  }
  if (self->_logMessageUsageURL) {
    objc_msgSend(v100, "setLogMessageUsageURL:");
  }
  if ([(GEOResources *)self locationShiftEnabledRegionsCount])
  {
    [v100 clearLocationShiftEnabledRegions];
    unint64_t v64 = [(GEOResources *)self locationShiftEnabledRegionsCount];
    if (v64)
    {
      unint64_t v65 = v64;
      for (uint64_t i6 = 0; i6 != v65; ++i6)
      {
        id v67 = [(GEOResources *)self locationShiftEnabledRegionAtIndex:i6];
        [v100 addLocationShiftEnabledRegion:v67];
      }
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v100 + 123) = self->_locationShiftVersion;
    v100[62] = (id)((unint64_t)v100[62] | 1);
  }
  if ([(GEOResources *)self resourcesCount])
  {
    [v100 clearResources];
    unint64_t v68 = [(GEOResources *)self resourcesCount];
    if (v68)
    {
      unint64_t v69 = v68;
      for (uint64_t i7 = 0; i7 != v69; ++i7)
      {
        uint64_t v71 = [(GEOResources *)self resourceAtIndex:i7];
        [v100 addResource:v71];
      }
    }
  }
  if (self->_spatialLookupURL) {
    objc_msgSend(v100, "setSpatialLookupURL:");
  }
  if ([(GEOResources *)self dataSetsCount])
  {
    [v100 clearDataSets];
    unint64_t v72 = [(GEOResources *)self dataSetsCount];
    if (v72)
    {
      unint64_t v73 = v72;
      for (uint64_t i8 = 0; i8 != v73; ++i8)
      {
        id v75 = [(GEOResources *)self dataSetAtIndex:i8];
        [v100 addDataSet:v75];
      }
    }
  }
  if ([(GEOResources *)self dataSetURLOverridesCount])
  {
    [v100 clearDataSetURLOverrides];
    unint64_t v76 = [(GEOResources *)self dataSetURLOverridesCount];
    if (v76)
    {
      unint64_t v77 = v76;
      for (uint64_t i9 = 0; i9 != v77; ++i9)
      {
        id v79 = [(GEOResources *)self dataSetURLOverrideAtIndex:i9];
        [v100 addDataSetURLOverride:v79];
      }
    }
  }
  if (self->_realtimeTrafficProbeURL) {
    objc_msgSend(v100, "setRealtimeTrafficProbeURL:");
  }
  if (self->_batchTrafficProbeURL) {
    objc_msgSend(v100, "setBatchTrafficProbeURL:");
  }
  if (self->_proactiveRoutingURL) {
    objc_msgSend(v100, "setProactiveRoutingURL:");
  }
  if (self->_logMessageUsageV3URL) {
    objc_msgSend(v100, "setLogMessageUsageV3URL:");
  }
  if (self->_backgroundDispatcherURL) {
    objc_msgSend(v100, "setBackgroundDispatcherURL:");
  }
  if (self->_bluePOIDispatcherURL) {
    objc_msgSend(v100, "setBluePOIDispatcherURL:");
  }
  if (self->_backgroundRevGeoURL) {
    objc_msgSend(v100, "setBackgroundRevGeoURL:");
  }
  if (self->_wifiConnectionQualityProbeURL) {
    objc_msgSend(v100, "setWifiConnectionQualityProbeURL:");
  }
  if (self->_muninBaseURL) {
    objc_msgSend(v100, "setMuninBaseURL:");
  }
  if ([(GEOResources *)self muninVersionsCount])
  {
    [v100 clearMuninVersions];
    unint64_t v80 = [(GEOResources *)self muninVersionsCount];
    if (v80)
    {
      unint64_t v81 = v80;
      for (uint64_t i10 = 0; i10 != v81; ++i10)
      {
        uint64_t v83 = [(GEOResources *)self muninVersionAtIndex:i10];
        [v100 addMuninVersion:v83];
      }
    }
  }
  if (self->_authProxyURL) {
    objc_msgSend(v100, "setAuthProxyURL:");
  }
  if ([(GEOResources *)self urlInfoSetsCount])
  {
    [v100 clearUrlInfoSets];
    unint64_t v84 = [(GEOResources *)self urlInfoSetsCount];
    if (v84)
    {
      unint64_t v85 = v84;
      for (uint64_t i11 = 0; i11 != v85; ++i11)
      {
        id v87 = [(GEOResources *)self urlInfoSetAtIndex:i11];
        [v100 addUrlInfoSet:v87];
      }
    }
  }
  if ([(GEOResources *)self muninBucketsCount])
  {
    [v100 clearMuninBuckets];
    unint64_t v88 = [(GEOResources *)self muninBucketsCount];
    if (v88)
    {
      unint64_t v89 = v88;
      for (uint64_t i12 = 0; i12 != v89; ++i12)
      {
        id v91 = [(GEOResources *)self muninBucketAtIndex:i12];
        [v100 addMuninBucket:v91];
      }
    }
  }
  if ([(GEOResources *)self displayStringsCount])
  {
    [v100 clearDisplayStrings];
    unint64_t v92 = [(GEOResources *)self displayStringsCount];
    if (v92)
    {
      unint64_t v93 = v92;
      for (uint64_t i13 = 0; i13 != v93; ++i13)
      {
        uint64_t v95 = [(GEOResources *)self displayStringsAtIndex:i13];
        [v100 addDisplayStrings:v95];
      }
    }
  }
  if ([(GEOResources *)self offlineMetadatasCount])
  {
    [v100 clearOfflineMetadatas];
    unint64_t v96 = [(GEOResources *)self offlineMetadatasCount];
    if (v96)
    {
      unint64_t v97 = v96;
      for (uint64_t i14 = 0; i14 != v97; ++i14)
      {
        uint64_t v99 = [(GEOResources *)self offlineMetadataAtIndex:i14];
        [v100 addOfflineMetadata:v99];
      }
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_121;
  }
  [(GEOResources *)self readAll:1];
  [v4 readAll:1];
  tileGroups = self->_tileGroups;
  if ((unint64_t)tileGroups | *((void *)v4 + 53))
  {
    if (!-[NSMutableArray isEqual:](tileGroups, "isEqual:")) {
      goto LABEL_121;
    }
  }
  tileSets = self->_tileSets;
  if ((unint64_t)tileSets | *((void *)v4 + 54))
  {
    if (!-[NSMutableArray isEqual:](tileSets, "isEqual:")) {
      goto LABEL_121;
    }
  }
  styleSheets = self->_styleSheets;
  if ((unint64_t)styleSheets | *((void *)v4 + 50))
  {
    if (!-[NSMutableArray isEqual:](styleSheets, "isEqual:")) {
      goto LABEL_121;
    }
  }
  textures = self->_textures;
  if ((unint64_t)textures | *((void *)v4 + 52))
  {
    if (!-[NSMutableArray isEqual:](textures, "isEqual:")) {
      goto LABEL_121;
    }
  }
  fonts = self->_fonts;
  if ((unint64_t)fonts | *((void *)v4 + 24))
  {
    if (!-[NSMutableArray isEqual:](fonts, "isEqual:")) {
      goto LABEL_121;
    }
  }
  icons = self->_icons;
  if ((unint64_t)icons | *((void *)v4 + 26))
  {
    if (!-[NSMutableArray isEqual:](icons, "isEqual:")) {
      goto LABEL_121;
    }
  }
  regionalResources = self->_regionalResources;
  if ((unint64_t)regionalResources | *((void *)v4 + 41))
  {
    if (!-[NSMutableArray isEqual:](regionalResources, "isEqual:")) {
      goto LABEL_121;
    }
  }
  xmls = self->_xmls;
  if ((unint64_t)xmls | *((void *)v4 + 59))
  {
    if (!-[NSMutableArray isEqual:](xmls, "isEqual:")) {
      goto LABEL_121;
    }
  }
  attributions = self->_attributions;
  if ((unint64_t)attributions | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](attributions, "isEqual:")) {
      goto LABEL_121;
    }
  }
  authTokeuint64_t n = self->_authToken;
  if ((unint64_t)authToken | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](authToken, "isEqual:")) {
      goto LABEL_121;
    }
  }
  resourcesURL = self->_resourcesURL;
  if ((unint64_t)resourcesURL | *((void *)v4 + 43))
  {
    if (!-[NSString isEqual:](resourcesURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  searchAttributionManifestURL = self->_searchAttributionManifestURL;
  if ((unint64_t)searchAttributionManifestURL | *((void *)v4 + 46))
  {
    if (!-[NSString isEqual:](searchAttributionManifestURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  directionsURL = self->_directionsURL;
  if ((unint64_t)directionsURL | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](directionsURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  etaURL = self->_etaURL;
  if ((unint64_t)etaURL | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](etaURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  releaseInfo = self->_releaseInfo;
  if ((unint64_t)releaseInfo | *((void *)v4 + 42))
  {
    if (!-[NSString isEqual:](releaseInfo, "isEqual:")) {
      goto LABEL_121;
    }
  }
  batchReverseGeocoderURL = self->_batchReverseGeocoderURL;
  if ((unint64_t)batchReverseGeocoderURL | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](batchReverseGeocoderURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  simpleETAURL = self->_simpleETAURL;
  if ((unint64_t)simpleETAURL | *((void *)v4 + 47))
  {
    if (!-[NSString isEqual:](simpleETAURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  styleSheetChecksums = self->_styleSheetChecksums;
  if ((unint64_t)styleSheetChecksums | *((void *)v4 + 49))
  {
    if (!-[NSMutableArray isEqual:](styleSheetChecksums, "isEqual:")) {
      goto LABEL_121;
    }
  }
  textureChecksums = self->_textureChecksums;
  if ((unint64_t)textureChecksums | *((void *)v4 + 51))
  {
    if (!-[NSMutableArray isEqual:](textureChecksums, "isEqual:")) {
      goto LABEL_121;
    }
  }
  fontChecksums = self->_fontChecksums;
  if ((unint64_t)fontChecksums | *((void *)v4 + 23))
  {
    if (!-[NSMutableArray isEqual:](fontChecksums, "isEqual:")) {
      goto LABEL_121;
    }
  }
  iconChecksums = self->_iconChecksums;
  if ((unint64_t)iconChecksums | *((void *)v4 + 25))
  {
    if (!-[NSMutableArray isEqual:](iconChecksums, "isEqual:")) {
      goto LABEL_121;
    }
  }
  xmlChecksums = self->_xmlChecksums;
  if ((unint64_t)xmlChecksums | *((void *)v4 + 58))
  {
    if (!-[NSMutableArray isEqual:](xmlChecksums, "isEqual:")) {
      goto LABEL_121;
    }
  }
  addressCorrectionInitURL = self->_addressCorrectionInitURL;
  if ((unint64_t)addressCorrectionInitURL | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](addressCorrectionInitURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  addressCorrectionUpdateURL = self->_addressCorrectionUpdateURL;
  if ((unint64_t)addressCorrectionUpdateURL | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](addressCorrectionUpdateURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  polyLocationShiftURL = self->_polyLocationShiftURL;
  if ((unint64_t)polyLocationShiftURL | *((void *)v4 + 34))
  {
    if (!-[NSString isEqual:](polyLocationShiftURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  problemSubmissionURL = self->_problemSubmissionURL;
  if ((unint64_t)problemSubmissionURL | *((void *)v4 + 39))
  {
    if (!-[NSString isEqual:](problemSubmissionURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  problemStatusURL = self->_problemStatusURL;
  if ((unint64_t)problemStatusURL | *((void *)v4 + 38))
  {
    if (!-[NSString isEqual:](problemStatusURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  reverseGeocoderVersionsURL = self->_reverseGeocoderVersionsURL;
  if ((unint64_t)reverseGeocoderVersionsURL | *((void *)v4 + 45))
  {
    if (!-[NSString isEqual:](reverseGeocoderVersionsURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  problemCategoriesURL = self->_problemCategoriesURL;
  if ((unint64_t)problemCategoriesURL | *((void *)v4 + 36))
  {
    if (!-[NSString isEqual:](problemCategoriesURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  announcementsURL = self->_announcementsURL;
  if ((unint64_t)announcementsURL | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](announcementsURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  announcementsSupportedLanguages = self->_announcementsSupportedLanguages;
  if ((unint64_t)announcementsSupportedLanguages | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](announcementsSupportedLanguages, "isEqual:")) {
      goto LABEL_121;
    }
  }
  dispatcherURL = self->_dispatcherURL;
  if ((unint64_t)dispatcherURL | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](dispatcherURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  problemOptInURL = self->_problemOptInURL;
  if ((unint64_t)problemOptInURL | *((void *)v4 + 37))
  {
    if (!-[NSString isEqual:](problemOptInURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  versionManifest = self->_versionManifest;
  if ((unint64_t)versionManifest | *((void *)v4 + 56))
  {
    if (!-[GEOVersionManifest isEqual:](versionManifest, "isEqual:")) {
      goto LABEL_121;
    }
  }
  abExperimentURL = self->_abExperimentURL;
  if ((unint64_t)abExperimentURL | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](abExperimentURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  businessPortalBaseURL = self->_businessPortalBaseURL;
  if ((unint64_t)businessPortalBaseURL | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](businessPortalBaseURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  logMessageUsageURL = self->_logMessageUsageURL;
  if ((unint64_t)logMessageUsageURL | *((void *)v4 + 28))
  {
    if (!-[NSString isEqual:](logMessageUsageURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  locationShiftEnabledRegions = self->_locationShiftEnabledRegions;
  if ((unint64_t)locationShiftEnabledRegions | *((void *)v4 + 27))
  {
    if (!-[NSMutableArray isEqual:](locationShiftEnabledRegions, "isEqual:")) {
      goto LABEL_121;
    }
  }
  uint64_t v43 = *((void *)v4 + 62);
  if (*(unsigned char *)&self->_flags)
  {
    if ((v43 & 1) == 0 || self->_locationShiftVersion != *((_DWORD *)v4 + 123)) {
      goto LABEL_121;
    }
  }
  else if (v43)
  {
LABEL_121:
    char v63 = 0;
    goto LABEL_122;
  }
  resources = self->_resources;
  if ((unint64_t)resources | *((void *)v4 + 44)
    && !-[NSMutableArray isEqual:](resources, "isEqual:"))
  {
    goto LABEL_121;
  }
  spatialLookupURL = self->_spatialLookupURL;
  if ((unint64_t)spatialLookupURL | *((void *)v4 + 48))
  {
    if (!-[NSString isEqual:](spatialLookupURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  dataSets = self->_dataSets;
  if ((unint64_t)dataSets | *((void *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](dataSets, "isEqual:")) {
      goto LABEL_121;
    }
  }
  dataSetURLOverrides = self->_dataSetURLOverrides;
  if ((unint64_t)dataSetURLOverrides | *((void *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](dataSetURLOverrides, "isEqual:")) {
      goto LABEL_121;
    }
  }
  realtimeTrafficProbeURL = self->_realtimeTrafficProbeURL;
  if ((unint64_t)realtimeTrafficProbeURL | *((void *)v4 + 40))
  {
    if (!-[NSString isEqual:](realtimeTrafficProbeURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  batchTrafficProbeURL = self->_batchTrafficProbeURL;
  if ((unint64_t)batchTrafficProbeURL | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](batchTrafficProbeURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  proactiveRoutingURL = self->_proactiveRoutingURL;
  if ((unint64_t)proactiveRoutingURL | *((void *)v4 + 35))
  {
    if (!-[NSString isEqual:](proactiveRoutingURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  logMessageUsageV3URL = self->_logMessageUsageV3URL;
  if ((unint64_t)logMessageUsageV3URL | *((void *)v4 + 29))
  {
    if (!-[NSString isEqual:](logMessageUsageV3URL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  backgroundDispatcherURL = self->_backgroundDispatcherURL;
  if ((unint64_t)backgroundDispatcherURL | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](backgroundDispatcherURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  bluePOIDispatcherURL = self->_bluePOIDispatcherURL;
  if ((unint64_t)bluePOIDispatcherURL | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](bluePOIDispatcherURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  backgroundRevGeoURL = self->_backgroundRevGeoURL;
  if ((unint64_t)backgroundRevGeoURL | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](backgroundRevGeoURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  wifiConnectionQualityProbeURL = self->_wifiConnectionQualityProbeURL;
  if ((unint64_t)wifiConnectionQualityProbeURL | *((void *)v4 + 57))
  {
    if (!-[NSString isEqual:](wifiConnectionQualityProbeURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  muninBaseURL = self->_muninBaseURL;
  if ((unint64_t)muninBaseURL | *((void *)v4 + 30))
  {
    if (!-[NSString isEqual:](muninBaseURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  muninVersions = self->_muninVersions;
  if ((unint64_t)muninVersions | *((void *)v4 + 32))
  {
    if (!-[NSMutableArray isEqual:](muninVersions, "isEqual:")) {
      goto LABEL_121;
    }
  }
  authProxyURL = self->_authProxyURL;
  if ((unint64_t)authProxyURL | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](authProxyURL, "isEqual:")) {
      goto LABEL_121;
    }
  }
  urlInfoSets = self->_urlInfoSets;
  if ((unint64_t)urlInfoSets | *((void *)v4 + 55))
  {
    if (!-[NSMutableArray isEqual:](urlInfoSets, "isEqual:")) {
      goto LABEL_121;
    }
  }
  muninBuckets = self->_muninBuckets;
  if ((unint64_t)muninBuckets | *((void *)v4 + 31))
  {
    if (!-[NSMutableArray isEqual:](muninBuckets, "isEqual:")) {
      goto LABEL_121;
    }
  }
  displayStrings = self->_displayStrings;
  if ((unint64_t)displayStrings | *((void *)v4 + 21))
  {
    if (!-[NSMutableArray isEqual:](displayStrings, "isEqual:")) {
      goto LABEL_121;
    }
  }
  offlineMetadatas = self->_offlineMetadatas;
  if ((unint64_t)offlineMetadatas | *((void *)v4 + 33)) {
    char v63 = -[NSMutableArray isEqual:](offlineMetadatas, "isEqual:");
  }
  else {
    char v63 = 1;
  }
LABEL_122:

  return v63;
}

- (unint64_t)hash
{
  [(GEOResources *)self readAll:1];
  uint64_t v61 = [(NSMutableArray *)self->_tileGroups hash];
  uint64_t v60 = [(NSMutableArray *)self->_tileSets hash];
  uint64_t v59 = [(NSMutableArray *)self->_styleSheets hash];
  uint64_t v58 = [(NSMutableArray *)self->_textures hash];
  uint64_t v57 = [(NSMutableArray *)self->_fonts hash];
  uint64_t v56 = [(NSMutableArray *)self->_icons hash];
  uint64_t v55 = [(NSMutableArray *)self->_regionalResources hash];
  uint64_t v54 = [(NSMutableArray *)self->_xmls hash];
  uint64_t v53 = [(NSMutableArray *)self->_attributions hash];
  NSUInteger v52 = [(NSString *)self->_authToken hash];
  NSUInteger v51 = [(NSString *)self->_resourcesURL hash];
  NSUInteger v50 = [(NSString *)self->_searchAttributionManifestURL hash];
  NSUInteger v49 = [(NSString *)self->_directionsURL hash];
  NSUInteger v48 = [(NSString *)self->_etaURL hash];
  NSUInteger v47 = [(NSString *)self->_releaseInfo hash];
  NSUInteger v46 = [(NSString *)self->_batchReverseGeocoderURL hash];
  NSUInteger v45 = [(NSString *)self->_simpleETAURL hash];
  uint64_t v44 = [(NSMutableArray *)self->_styleSheetChecksums hash];
  uint64_t v43 = [(NSMutableArray *)self->_textureChecksums hash];
  uint64_t v42 = [(NSMutableArray *)self->_fontChecksums hash];
  uint64_t v41 = [(NSMutableArray *)self->_iconChecksums hash];
  uint64_t v40 = [(NSMutableArray *)self->_xmlChecksums hash];
  NSUInteger v39 = [(NSString *)self->_addressCorrectionInitURL hash];
  NSUInteger v38 = [(NSString *)self->_addressCorrectionUpdateURL hash];
  NSUInteger v37 = [(NSString *)self->_polyLocationShiftURL hash];
  NSUInteger v36 = [(NSString *)self->_problemSubmissionURL hash];
  NSUInteger v35 = [(NSString *)self->_problemStatusURL hash];
  NSUInteger v34 = [(NSString *)self->_reverseGeocoderVersionsURL hash];
  NSUInteger v33 = [(NSString *)self->_problemCategoriesURL hash];
  NSUInteger v3 = [(NSString *)self->_announcementsURL hash];
  uint64_t v4 = [(NSMutableArray *)self->_announcementsSupportedLanguages hash];
  NSUInteger v5 = [(NSString *)self->_dispatcherURL hash];
  NSUInteger v6 = [(NSString *)self->_problemOptInURL hash];
  unint64_t v7 = [(GEOVersionManifest *)self->_versionManifest hash];
  NSUInteger v8 = [(NSString *)self->_abExperimentURL hash];
  NSUInteger v9 = [(NSString *)self->_businessPortalBaseURL hash];
  NSUInteger v10 = [(NSString *)self->_logMessageUsageURL hash];
  uint64_t v11 = [(NSMutableArray *)self->_locationShiftEnabledRegions hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v12 = 2654435761 * self->_locationShiftVersion;
  }
  else {
    uint64_t v12 = 0;
  }
  NSUInteger v13 = v60 ^ v61 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  uint64_t v14 = v11 ^ v12 ^ [(NSMutableArray *)self->_resources hash];
  NSUInteger v15 = v14 ^ [(NSString *)self->_spatialLookupURL hash];
  uint64_t v16 = v15 ^ [(NSMutableArray *)self->_dataSets hash];
  uint64_t v17 = v16 ^ [(NSMutableArray *)self->_dataSetURLOverrides hash];
  NSUInteger v18 = v17 ^ [(NSString *)self->_realtimeTrafficProbeURL hash];
  NSUInteger v19 = v18 ^ [(NSString *)self->_batchTrafficProbeURL hash];
  NSUInteger v20 = v13 ^ v19 ^ [(NSString *)self->_proactiveRoutingURL hash];
  NSUInteger v21 = [(NSString *)self->_logMessageUsageV3URL hash];
  NSUInteger v22 = v21 ^ [(NSString *)self->_backgroundDispatcherURL hash];
  NSUInteger v23 = v22 ^ [(NSString *)self->_bluePOIDispatcherURL hash];
  NSUInteger v24 = v23 ^ [(NSString *)self->_backgroundRevGeoURL hash];
  NSUInteger v25 = v24 ^ [(NSString *)self->_wifiConnectionQualityProbeURL hash];
  NSUInteger v26 = v25 ^ [(NSString *)self->_muninBaseURL hash];
  uint64_t v27 = v26 ^ [(NSMutableArray *)self->_muninVersions hash];
  NSUInteger v28 = v27 ^ [(NSString *)self->_authProxyURL hash];
  uint64_t v29 = v28 ^ [(NSMutableArray *)self->_urlInfoSets hash];
  uint64_t v30 = v20 ^ v29 ^ [(NSMutableArray *)self->_muninBuckets hash];
  uint64_t v31 = [(NSMutableArray *)self->_displayStrings hash];
  return v30 ^ v31 ^ [(NSMutableArray *)self->_offlineMetadatas hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v247 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v222 = 0u;
  long long v221 = 0u;
  long long v220 = 0u;
  long long v219 = 0u;
  id v5 = *((id *)v4 + 53);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v219 objects:v246 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v220;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v220 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOResources *)self addTileGroup:*(void *)(*((void *)&v219 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v219 objects:v246 count:16];
    }
    while (v7);
  }

  long long v218 = 0u;
  long long v217 = 0u;
  long long v216 = 0u;
  long long v215 = 0u;
  id v10 = *((id *)v4 + 54);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v215 objects:v245 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v216;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v216 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEOResources *)self addTileSet:*(void *)(*((void *)&v215 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v215 objects:v245 count:16];
    }
    while (v12);
  }

  long long v214 = 0u;
  long long v213 = 0u;
  long long v212 = 0u;
  long long v211 = 0u;
  id v15 = *((id *)v4 + 50);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v211 objects:v244 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v212;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v212 != v18) {
          objc_enumerationMutation(v15);
        }
        [(GEOResources *)self addStyleSheet:*(void *)(*((void *)&v211 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v211 objects:v244 count:16];
    }
    while (v17);
  }

  long long v210 = 0u;
  long long v209 = 0u;
  long long v208 = 0u;
  long long v207 = 0u;
  id v20 = *((id *)v4 + 52);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v207 objects:v243 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v208;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v208 != v23) {
          objc_enumerationMutation(v20);
        }
        [(GEOResources *)self addTexture:*(void *)(*((void *)&v207 + 1) + 8 * m)];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v207 objects:v243 count:16];
    }
    while (v22);
  }

  long long v206 = 0u;
  long long v205 = 0u;
  long long v204 = 0u;
  long long v203 = 0u;
  id v25 = *((id *)v4 + 24);
  uint64_t v26 = [v25 countByEnumeratingWithState:&v203 objects:v242 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v204;
    do
    {
      for (uint64_t n = 0; n != v27; ++n)
      {
        if (*(void *)v204 != v28) {
          objc_enumerationMutation(v25);
        }
        [(GEOResources *)self addFont:*(void *)(*((void *)&v203 + 1) + 8 * n)];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v203 objects:v242 count:16];
    }
    while (v27);
  }

  long long v202 = 0u;
  long long v201 = 0u;
  long long v200 = 0u;
  long long v199 = 0u;
  id v30 = *((id *)v4 + 26);
  uint64_t v31 = [v30 countByEnumeratingWithState:&v199 objects:v241 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v200;
    do
    {
      for (iuint64_t i = 0; ii != v32; ++ii)
      {
        if (*(void *)v200 != v33) {
          objc_enumerationMutation(v30);
        }
        [(GEOResources *)self addIcon:*(void *)(*((void *)&v199 + 1) + 8 * ii)];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v199 objects:v241 count:16];
    }
    while (v32);
  }

  long long v198 = 0u;
  long long v197 = 0u;
  long long v196 = 0u;
  long long v195 = 0u;
  id v35 = *((id *)v4 + 41);
  uint64_t v36 = [v35 countByEnumeratingWithState:&v195 objects:v240 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v196;
    do
    {
      for (juint64_t j = 0; jj != v37; ++jj)
      {
        if (*(void *)v196 != v38) {
          objc_enumerationMutation(v35);
        }
        [(GEOResources *)self addRegionalResource:*(void *)(*((void *)&v195 + 1) + 8 * jj)];
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v195 objects:v240 count:16];
    }
    while (v37);
  }

  long long v194 = 0u;
  long long v193 = 0u;
  long long v192 = 0u;
  long long v191 = 0u;
  id v40 = *((id *)v4 + 59);
  uint64_t v41 = [v40 countByEnumeratingWithState:&v191 objects:v239 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v192;
    do
    {
      for (kuint64_t k = 0; kk != v42; ++kk)
      {
        if (*(void *)v192 != v43) {
          objc_enumerationMutation(v40);
        }
        [(GEOResources *)self addXml:*(void *)(*((void *)&v191 + 1) + 8 * kk)];
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v191 objects:v239 count:16];
    }
    while (v42);
  }

  long long v189 = 0u;
  long long v190 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  id v45 = *((id *)v4 + 8);
  uint64_t v46 = [v45 countByEnumeratingWithState:&v187 objects:v238 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v188;
    do
    {
      for (muint64_t m = 0; mm != v47; ++mm)
      {
        if (*(void *)v188 != v48) {
          objc_enumerationMutation(v45);
        }
        [(GEOResources *)self addAttribution:*(void *)(*((void *)&v187 + 1) + 8 * mm)];
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v187 objects:v238 count:16];
    }
    while (v47);
  }

  if (*((void *)v4 + 10)) {
    -[GEOResources setAuthToken:](self, "setAuthToken:");
  }
  if (*((void *)v4 + 43)) {
    -[GEOResources setResourcesURL:](self, "setResourcesURL:");
  }
  if (*((void *)v4 + 46)) {
    -[GEOResources setSearchAttributionManifestURL:](self, "setSearchAttributionManifestURL:");
  }
  if (*((void *)v4 + 19)) {
    -[GEOResources setDirectionsURL:](self, "setDirectionsURL:");
  }
  if (*((void *)v4 + 22)) {
    -[GEOResources setEtaURL:](self, "setEtaURL:");
  }
  if (*((void *)v4 + 42)) {
    -[GEOResources setReleaseInfo:](self, "setReleaseInfo:");
  }
  if (*((void *)v4 + 13)) {
    -[GEOResources setBatchReverseGeocoderURL:](self, "setBatchReverseGeocoderURL:");
  }
  if (*((void *)v4 + 47)) {
    -[GEOResources setSimpleETAURL:](self, "setSimpleETAURL:");
  }
  long long v185 = 0u;
  long long v186 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  id v50 = *((id *)v4 + 49);
  uint64_t v51 = [v50 countByEnumeratingWithState:&v183 objects:v237 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v184;
    do
    {
      for (nuint64_t n = 0; nn != v52; ++nn)
      {
        if (*(void *)v184 != v53) {
          objc_enumerationMutation(v50);
        }
        [(GEOResources *)self addStyleSheetChecksum:*(void *)(*((void *)&v183 + 1) + 8 * nn)];
      }
      uint64_t v52 = [v50 countByEnumeratingWithState:&v183 objects:v237 count:16];
    }
    while (v52);
  }

  long long v181 = 0u;
  long long v182 = 0u;
  long long v179 = 0u;
  long long v180 = 0u;
  id v55 = *((id *)v4 + 51);
  uint64_t v56 = [v55 countByEnumeratingWithState:&v179 objects:v236 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v180;
    do
    {
      for (uint64_t i1 = 0; i1 != v57; ++i1)
      {
        if (*(void *)v180 != v58) {
          objc_enumerationMutation(v55);
        }
        [(GEOResources *)self addTextureChecksum:*(void *)(*((void *)&v179 + 1) + 8 * i1)];
      }
      uint64_t v57 = [v55 countByEnumeratingWithState:&v179 objects:v236 count:16];
    }
    while (v57);
  }

  long long v177 = 0u;
  long long v178 = 0u;
  long long v175 = 0u;
  long long v176 = 0u;
  id v60 = *((id *)v4 + 23);
  uint64_t v61 = [v60 countByEnumeratingWithState:&v175 objects:v235 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v176;
    do
    {
      for (uint64_t i2 = 0; i2 != v62; ++i2)
      {
        if (*(void *)v176 != v63) {
          objc_enumerationMutation(v60);
        }
        [(GEOResources *)self addFontChecksum:*(void *)(*((void *)&v175 + 1) + 8 * i2)];
      }
      uint64_t v62 = [v60 countByEnumeratingWithState:&v175 objects:v235 count:16];
    }
    while (v62);
  }

  long long v173 = 0u;
  long long v174 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  id v65 = *((id *)v4 + 25);
  uint64_t v66 = [v65 countByEnumeratingWithState:&v171 objects:v234 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v172;
    do
    {
      for (uint64_t i3 = 0; i3 != v67; ++i3)
      {
        if (*(void *)v172 != v68) {
          objc_enumerationMutation(v65);
        }
        [(GEOResources *)self addIconChecksum:*(void *)(*((void *)&v171 + 1) + 8 * i3)];
      }
      uint64_t v67 = [v65 countByEnumeratingWithState:&v171 objects:v234 count:16];
    }
    while (v67);
  }

  long long v169 = 0u;
  long long v170 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  id v70 = *((id *)v4 + 58);
  uint64_t v71 = [v70 countByEnumeratingWithState:&v167 objects:v233 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v168;
    do
    {
      for (uint64_t i4 = 0; i4 != v72; ++i4)
      {
        if (*(void *)v168 != v73) {
          objc_enumerationMutation(v70);
        }
        [(GEOResources *)self addXmlChecksum:*(void *)(*((void *)&v167 + 1) + 8 * i4)];
      }
      uint64_t v72 = [v70 countByEnumeratingWithState:&v167 objects:v233 count:16];
    }
    while (v72);
  }

  if (*((void *)v4 + 4)) {
    -[GEOResources setAddressCorrectionInitURL:](self, "setAddressCorrectionInitURL:");
  }
  if (*((void *)v4 + 5)) {
    -[GEOResources setAddressCorrectionUpdateURL:](self, "setAddressCorrectionUpdateURL:");
  }
  if (*((void *)v4 + 34)) {
    -[GEOResources setPolyLocationShiftURL:](self, "setPolyLocationShiftURL:");
  }
  if (*((void *)v4 + 39)) {
    -[GEOResources setProblemSubmissionURL:](self, "setProblemSubmissionURL:");
  }
  if (*((void *)v4 + 38)) {
    -[GEOResources setProblemStatusURL:](self, "setProblemStatusURL:");
  }
  if (*((void *)v4 + 45)) {
    -[GEOResources setReverseGeocoderVersionsURL:](self, "setReverseGeocoderVersionsURL:");
  }
  if (*((void *)v4 + 36)) {
    -[GEOResources setProblemCategoriesURL:](self, "setProblemCategoriesURL:");
  }
  if (*((void *)v4 + 7)) {
    -[GEOResources setAnnouncementsURL:](self, "setAnnouncementsURL:");
  }
  long long v165 = 0u;
  long long v166 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  id v75 = *((id *)v4 + 6);
  uint64_t v76 = [v75 countByEnumeratingWithState:&v163 objects:v232 count:16];
  if (v76)
  {
    uint64_t v77 = v76;
    uint64_t v78 = *(void *)v164;
    do
    {
      for (uint64_t i5 = 0; i5 != v77; ++i5)
      {
        if (*(void *)v164 != v78) {
          objc_enumerationMutation(v75);
        }
        [(GEOResources *)self addAnnouncementsSupportedLanguages:*(void *)(*((void *)&v163 + 1) + 8 * i5)];
      }
      uint64_t v77 = [v75 countByEnumeratingWithState:&v163 objects:v232 count:16];
    }
    while (v77);
  }

  if (*((void *)v4 + 20)) {
    -[GEOResources setDispatcherURL:](self, "setDispatcherURL:");
  }
  if (*((void *)v4 + 37)) {
    -[GEOResources setProblemOptInURL:](self, "setProblemOptInURL:");
  }
  versionManifest = self->_versionManifest;
  uint64_t v81 = *((void *)v4 + 56);
  if (versionManifest)
  {
    if (v81) {
      -[GEOVersionManifest mergeFrom:](versionManifest, "mergeFrom:");
    }
  }
  else if (v81)
  {
    -[GEOResources setVersionManifest:](self, "setVersionManifest:");
  }
  if (*((void *)v4 + 3)) {
    -[GEOResources setAbExperimentURL:](self, "setAbExperimentURL:");
  }
  if (*((void *)v4 + 16)) {
    -[GEOResources setBusinessPortalBaseURL:](self, "setBusinessPortalBaseURL:");
  }
  if (*((void *)v4 + 28)) {
    -[GEOResources setLogMessageUsageURL:](self, "setLogMessageUsageURL:");
  }
  long long v161 = 0u;
  long long v162 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  id v82 = *((id *)v4 + 27);
  uint64_t v83 = [v82 countByEnumeratingWithState:&v159 objects:v231 count:16];
  if (v83)
  {
    uint64_t v84 = v83;
    uint64_t v85 = *(void *)v160;
    do
    {
      for (uint64_t i6 = 0; i6 != v84; ++i6)
      {
        if (*(void *)v160 != v85) {
          objc_enumerationMutation(v82);
        }
        [(GEOResources *)self addLocationShiftEnabledRegion:*(void *)(*((void *)&v159 + 1) + 8 * i6)];
      }
      uint64_t v84 = [v82 countByEnumeratingWithState:&v159 objects:v231 count:16];
    }
    while (v84);
  }

  if (*((unsigned char *)v4 + 496))
  {
    self->_locationShiftVersiouint64_t n = *((_DWORD *)v4 + 123);
    *(void *)&self->_flags |= 1uLL;
  }
  long long v157 = 0u;
  long long v158 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  id v87 = *((id *)v4 + 44);
  uint64_t v88 = [v87 countByEnumeratingWithState:&v155 objects:v230 count:16];
  if (v88)
  {
    uint64_t v89 = v88;
    uint64_t v90 = *(void *)v156;
    do
    {
      for (uint64_t i7 = 0; i7 != v89; ++i7)
      {
        if (*(void *)v156 != v90) {
          objc_enumerationMutation(v87);
        }
        [(GEOResources *)self addResource:*(void *)(*((void *)&v155 + 1) + 8 * i7)];
      }
      uint64_t v89 = [v87 countByEnumeratingWithState:&v155 objects:v230 count:16];
    }
    while (v89);
  }

  if (*((void *)v4 + 48)) {
    -[GEOResources setSpatialLookupURL:](self, "setSpatialLookupURL:");
  }
  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  id v92 = *((id *)v4 + 18);
  uint64_t v93 = [v92 countByEnumeratingWithState:&v151 objects:v229 count:16];
  if (v93)
  {
    uint64_t v94 = v93;
    uint64_t v95 = *(void *)v152;
    do
    {
      for (uint64_t i8 = 0; i8 != v94; ++i8)
      {
        if (*(void *)v152 != v95) {
          objc_enumerationMutation(v92);
        }
        [(GEOResources *)self addDataSet:*(void *)(*((void *)&v151 + 1) + 8 * i8)];
      }
      uint64_t v94 = [v92 countByEnumeratingWithState:&v151 objects:v229 count:16];
    }
    while (v94);
  }

  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  id v97 = *((id *)v4 + 17);
  uint64_t v98 = [v97 countByEnumeratingWithState:&v147 objects:v228 count:16];
  if (v98)
  {
    uint64_t v99 = v98;
    uint64_t v100 = *(void *)v148;
    do
    {
      for (uint64_t i9 = 0; i9 != v99; ++i9)
      {
        if (*(void *)v148 != v100) {
          objc_enumerationMutation(v97);
        }
        [(GEOResources *)self addDataSetURLOverride:*(void *)(*((void *)&v147 + 1) + 8 * i9)];
      }
      uint64_t v99 = [v97 countByEnumeratingWithState:&v147 objects:v228 count:16];
    }
    while (v99);
  }

  if (*((void *)v4 + 40)) {
    -[GEOResources setRealtimeTrafficProbeURL:](self, "setRealtimeTrafficProbeURL:");
  }
  if (*((void *)v4 + 14)) {
    -[GEOResources setBatchTrafficProbeURL:](self, "setBatchTrafficProbeURL:");
  }
  if (*((void *)v4 + 35)) {
    [(GEOResources *)self setProactiveRoutingURL:"setProactiveRoutingURL:"];
  }
  if (*((void *)v4 + 29)) {
    -[GEOResources setLogMessageUsageV3URL:](self, "setLogMessageUsageV3URL:");
  }
  if (*((void *)v4 + 11)) {
    -[GEOResources setBackgroundDispatcherURL:](self, "setBackgroundDispatcherURL:");
  }
  if (*((void *)v4 + 15)) {
    -[GEOResources setBluePOIDispatcherURL:](self, "setBluePOIDispatcherURL:");
  }
  if (*((void *)v4 + 12)) {
    -[GEOResources setBackgroundRevGeoURL:](self, "setBackgroundRevGeoURL:");
  }
  if (*((void *)v4 + 57)) {
    -[GEOResources setWifiConnectionQualityProbeURL:](self, "setWifiConnectionQualityProbeURL:");
  }
  if (*((void *)v4 + 30)) {
    -[GEOResources setMuninBaseURL:](self, "setMuninBaseURL:");
  }
  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  id v102 = *((id *)v4 + 32);
  uint64_t v103 = [v102 countByEnumeratingWithState:&v143 objects:v227 count:16];
  if (v103)
  {
    uint64_t v104 = v103;
    uint64_t v105 = *(void *)v144;
    do
    {
      for (uint64_t i10 = 0; i10 != v104; ++i10)
      {
        if (*(void *)v144 != v105) {
          objc_enumerationMutation(v102);
        }
        [(GEOResources *)self addMuninVersion:*(void *)(*((void *)&v143 + 1) + 8 * i10)];
      }
      uint64_t v104 = [v102 countByEnumeratingWithState:&v143 objects:v227 count:16];
    }
    while (v104);
  }

  if (*((void *)v4 + 9)) {
    -[GEOResources setAuthProxyURL:](self, "setAuthProxyURL:");
  }
  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  id v107 = *((id *)v4 + 55);
  uint64_t v108 = [v107 countByEnumeratingWithState:&v139 objects:v226 count:16];
  if (v108)
  {
    uint64_t v109 = v108;
    uint64_t v110 = *(void *)v140;
    do
    {
      for (uint64_t i11 = 0; i11 != v109; ++i11)
      {
        if (*(void *)v140 != v110) {
          objc_enumerationMutation(v107);
        }
        [(GEOResources *)self addUrlInfoSet:*(void *)(*((void *)&v139 + 1) + 8 * i11)];
      }
      uint64_t v109 = [v107 countByEnumeratingWithState:&v139 objects:v226 count:16];
    }
    while (v109);
  }

  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  id v112 = *((id *)v4 + 31);
  uint64_t v113 = [v112 countByEnumeratingWithState:&v135 objects:v225 count:16];
  if (v113)
  {
    uint64_t v114 = v113;
    uint64_t v115 = *(void *)v136;
    do
    {
      for (uint64_t i12 = 0; i12 != v114; ++i12)
      {
        if (*(void *)v136 != v115) {
          objc_enumerationMutation(v112);
        }
        [(GEOResources *)self addMuninBucket:*(void *)(*((void *)&v135 + 1) + 8 * i12)];
      }
      uint64_t v114 = [v112 countByEnumeratingWithState:&v135 objects:v225 count:16];
    }
    while (v114);
  }

  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  id v117 = *((id *)v4 + 21);
  uint64_t v118 = [v117 countByEnumeratingWithState:&v131 objects:v224 count:16];
  if (v118)
  {
    uint64_t v119 = v118;
    uint64_t v120 = *(void *)v132;
    do
    {
      for (uint64_t i13 = 0; i13 != v119; ++i13)
      {
        if (*(void *)v132 != v120) {
          objc_enumerationMutation(v117);
        }
        [(GEOResources *)self addDisplayStrings:*(void *)(*((void *)&v131 + 1) + 8 * i13)];
      }
      uint64_t v119 = [v117 countByEnumeratingWithState:&v131 objects:v224 count:16];
    }
    while (v119);
  }

  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  id v122 = *((id *)v4 + 33);
  uint64_t v123 = [v122 countByEnumeratingWithState:&v127 objects:v223 count:16];
  if (v123)
  {
    uint64_t v124 = v123;
    uint64_t v125 = *(void *)v128;
    do
    {
      for (uint64_t i14 = 0; i14 != v124; ++i14)
      {
        if (*(void *)v128 != v125) {
          objc_enumerationMutation(v122);
        }
        -[GEOResources addOfflineMetadata:](self, "addOfflineMetadata:", *(void *)(*((void *)&v127 + 1) + 8 * i14), (void)v127);
      }
      uint64_t v124 = [v122 countByEnumeratingWithState:&v127 objects:v223 count:16];
    }
    while (v124);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOResourcesReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_867);
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
  uint64_t v151 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000000000002uLL;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOResources *)self readAll:0];
    long long v131 = 0u;
    long long v132 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    uint64_t v7 = self->_tileGroups;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v129 objects:v149 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v130;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v130 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v129 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v129 objects:v149 count:16];
      }
      while (v9);
    }

    long long v127 = 0u;
    long long v128 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    uint64_t v12 = self->_tileSets;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v125 objects:v148 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v126;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v126 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v125 + 1) + 8 * v16++) clearUnknownFields:1];
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v125 objects:v148 count:16];
      }
      while (v14);
    }

    long long v123 = 0u;
    long long v124 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    uint64_t v17 = self->_regionalResources;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v121 objects:v147 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v122;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v122 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v121 + 1) + 8 * v21);
          if (v22)
          {
            os_unfair_lock_lock_with_options();
            *(_WORD *)(v22 + 96) |= 8u;
            *(_WORD *)(v22 + 96) |= 0x100u;
            os_unfair_lock_unlock((os_unfair_lock_t)(v22 + 80));
            uint64_t v23 = *(void **)(v22 + 16);
            *(void *)(v22 + 16) = 0;

            -[GEORegionalResource readAll:](v22, 0);
            long long v135 = 0u;
            long long v136 = 0u;
            long long v133 = 0u;
            long long v134 = 0u;
            id v24 = *(id *)(v22 + 48);
            uint64_t v25 = [v24 countByEnumeratingWithState:&v133 objects:v150 count:16];
            if (v25)
            {
              uint64_t v26 = v25;
              uint64_t v27 = *(void *)v134;
              do
              {
                uint64_t v28 = 0;
                do
                {
                  if (*(void *)v134 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  [*(id *)(*((void *)&v133 + 1) + 8 * v28++) clearUnknownFields:1];
                }
                while (v26 != v28);
                uint64_t v26 = [v24 countByEnumeratingWithState:&v133 objects:v150 count:16];
              }
              while (v26);
            }
          }
          ++v21;
        }
        while (v21 != v19);
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v121 objects:v147 count:16];
      }
      while (v19);
    }

    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    uint64_t v29 = self->_attributions;
    uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v117 objects:v146 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v118;
      do
      {
        uint64_t v33 = 0;
        do
        {
          if (*(void *)v118 != v32) {
            objc_enumerationMutation(v29);
          }
          [*(id *)(*((void *)&v117 + 1) + 8 * v33++) clearUnknownFields:1];
        }
        while (v31 != v33);
        uint64_t v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v117 objects:v146 count:16];
      }
      while (v31);
    }

    [(GEOVersionManifest *)self->_versionManifest clearUnknownFields:1];
    long long v115 = 0u;
    long long v116 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    NSUInteger v34 = self->_locationShiftEnabledRegions;
    uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v113 objects:v145 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v114;
      do
      {
        uint64_t v38 = 0;
        do
        {
          if (*(void *)v114 != v37) {
            objc_enumerationMutation(v34);
          }
          [*(id *)(*((void *)&v113 + 1) + 8 * v38++) clearUnknownFields:1];
        }
        while (v36 != v38);
        uint64_t v36 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v113 objects:v145 count:16];
      }
      while (v36);
    }

    long long v111 = 0u;
    long long v112 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    NSUInteger v39 = self->_resources;
    uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v109 objects:v144 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v110;
      do
      {
        uint64_t v43 = 0;
        do
        {
          if (*(void *)v110 != v42) {
            objc_enumerationMutation(v39);
          }
          [*(id *)(*((void *)&v109 + 1) + 8 * v43++) clearUnknownFields:1];
        }
        while (v41 != v43);
        uint64_t v41 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v109 objects:v144 count:16];
      }
      while (v41);
    }

    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    uint64_t v44 = self->_dataSets;
    uint64_t v45 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v105 objects:v143 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v106;
      do
      {
        uint64_t v48 = 0;
        do
        {
          if (*(void *)v106 != v47) {
            objc_enumerationMutation(v44);
          }
          [*(id *)(*((void *)&v105 + 1) + 8 * v48++) clearUnknownFields:1];
        }
        while (v46 != v48);
        uint64_t v46 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v105 objects:v143 count:16];
      }
      while (v46);
    }

    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    NSUInteger v49 = self->_dataSetURLOverrides;
    uint64_t v50 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v101 objects:v142 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v102;
      do
      {
        uint64_t v53 = 0;
        do
        {
          if (*(void *)v102 != v52) {
            objc_enumerationMutation(v49);
          }
          uint64_t v54 = *(void *)(*((void *)&v101 + 1) + 8 * v53);
          if (v54)
          {
            os_unfair_lock_lock_with_options();
            *(_DWORD *)(v54 + 160) |= 2u;
            *(_DWORD *)(v54 + 160) |= 0x20000u;
            os_unfair_lock_unlock((os_unfair_lock_t)(v54 + 152));
            id v55 = *(void **)(v54 + 16);
            *(void *)(v54 + 16) = 0;

            -[GEODataSetURLOverride readAll:](v54, 0);
          }
          ++v53;
        }
        while (v51 != v53);
        uint64_t v51 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v101 objects:v142 count:16];
      }
      while (v51);
    }

    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    uint64_t v56 = self->_muninVersions;
    uint64_t v57 = [(NSMutableArray *)v56 countByEnumeratingWithState:&v97 objects:v141 count:16];
    if (v57)
    {
      uint64_t v58 = v57;
      uint64_t v59 = *(void *)v98;
      do
      {
        uint64_t v60 = 0;
        do
        {
          if (*(void *)v98 != v59) {
            objc_enumerationMutation(v56);
          }
          [*(id *)(*((void *)&v97 + 1) + 8 * v60++) clearUnknownFields:1];
        }
        while (v58 != v60);
        uint64_t v58 = [(NSMutableArray *)v56 countByEnumeratingWithState:&v97 objects:v141 count:16];
      }
      while (v58);
    }

    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    uint64_t v61 = self->_urlInfoSets;
    uint64_t v62 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v93 objects:v140 count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = *(void *)v94;
      do
      {
        uint64_t v65 = 0;
        do
        {
          if (*(void *)v94 != v64) {
            objc_enumerationMutation(v61);
          }
          [*(id *)(*((void *)&v93 + 1) + 8 * v65++) clearUnknownFields:1];
        }
        while (v63 != v65);
        uint64_t v63 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v93 objects:v140 count:16];
      }
      while (v63);
    }

    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    uint64_t v66 = self->_muninBuckets;
    uint64_t v67 = [(NSMutableArray *)v66 countByEnumeratingWithState:&v89 objects:v139 count:16];
    if (v67)
    {
      uint64_t v68 = v67;
      uint64_t v69 = *(void *)v90;
      do
      {
        uint64_t v70 = 0;
        do
        {
          if (*(void *)v90 != v69) {
            objc_enumerationMutation(v66);
          }
          [*(id *)(*((void *)&v89 + 1) + 8 * v70++) clearUnknownFields:1];
        }
        while (v68 != v70);
        uint64_t v68 = [(NSMutableArray *)v66 countByEnumeratingWithState:&v89 objects:v139 count:16];
      }
      while (v68);
    }

    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    uint64_t v71 = self->_displayStrings;
    uint64_t v72 = [(NSMutableArray *)v71 countByEnumeratingWithState:&v85 objects:v138 count:16];
    if (v72)
    {
      uint64_t v73 = v72;
      uint64_t v74 = *(void *)v86;
      do
      {
        uint64_t v75 = 0;
        do
        {
          if (*(void *)v86 != v74) {
            objc_enumerationMutation(v71);
          }
          [*(id *)(*((void *)&v85 + 1) + 8 * v75++) clearUnknownFields:1];
        }
        while (v73 != v75);
        uint64_t v73 = [(NSMutableArray *)v71 countByEnumeratingWithState:&v85 objects:v138 count:16];
      }
      while (v73);
    }

    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    uint64_t v76 = self->_offlineMetadatas;
    uint64_t v77 = [(NSMutableArray *)v76 countByEnumeratingWithState:&v81 objects:v137 count:16];
    if (v77)
    {
      uint64_t v78 = v77;
      uint64_t v79 = *(void *)v82;
      do
      {
        uint64_t v80 = 0;
        do
        {
          if (*(void *)v82 != v79) {
            objc_enumerationMutation(v76);
          }
          objc_msgSend(*(id *)(*((void *)&v81 + 1) + 8 * v80++), "clearUnknownFields:", 1, (void)v81);
        }
        while (v78 != v80);
        uint64_t v78 = [(NSMutableArray *)v76 countByEnumeratingWithState:&v81 objects:v137 count:16];
      }
      while (v78);
    }
  }
}

- (BOOL)isValid
{
  BOOL v3 = [(GEOResources *)self tileGroups];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  id v5 = [(GEOResources *)self tileSets];
  BOOL v6 = [v5 count] != 0;

  return v6;
}

@end