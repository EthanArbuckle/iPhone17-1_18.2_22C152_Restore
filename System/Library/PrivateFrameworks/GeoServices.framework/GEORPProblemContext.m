@interface GEORPProblemContext
+ (BOOL)isValid:(id)a3;
+ (Class)autocompleteSuggestionListType;
+ (Class)auxiliaryControlType;
+ (Class)directionsRequestType;
+ (Class)directionsResponseType;
+ (Class)directionsWaypointPlaceInfoType;
+ (Class)visibleTileSetType;
- (BOOL)hasCreationDate;
- (BOOL)hasCurrentAbAssignmentResponse;
- (BOOL)hasCurrentEnvironmentManifestUrls;
- (BOOL)hasDeviceGmtOffset;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLastSearchString;
- (BOOL)hasLastUserTypedSearchString;
- (BOOL)hasMapLocation;
- (BOOL)hasMerchantLookupContext;
- (BOOL)hasNavigationSettings;
- (BOOL)hasOriginalPlace;
- (BOOL)hasOriginatingAuxiliaryControlIndex;
- (BOOL)hasPersonalizedMaps;
- (BOOL)hasPinType;
- (BOOL)hasPlace;
- (BOOL)hasPlaceInfo;
- (BOOL)hasServicesState;
- (BOOL)hasSessionId;
- (BOOL)hasTileStateLog;
- (BOOL)hasTransitLineTileInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOABAssignmentResponse)currentAbAssignmentResponse;
- (GEOPDPlace)place;
- (GEOPlace)originalPlace;
- (GEORPCurrentEnvironmentManifestURLs)currentEnvironmentManifestUrls;
- (GEORPMapLocation)mapLocation;
- (GEORPMerchantLookupContext)merchantLookupContext;
- (GEORPNavigationSettings)navigationSettings;
- (GEORPPersonalizedMaps)personalizedMaps;
- (GEORPPlaceInfo)placeInfo;
- (GEORPProblemContext)init;
- (GEORPProblemContext)initWithData:(id)a3;
- (GEORPProblemContext)initWithDictionary:(id)a3;
- (GEORPProblemContext)initWithJSON:(id)a3;
- (GEORPTransitLineTileInfo)transitLineTileInfo;
- (GEOServicesState)servicesState;
- (GEOSessionID)sessionId;
- (NSMutableArray)autocompleteSuggestionLists;
- (NSMutableArray)auxiliaryControls;
- (NSMutableArray)directionsRequests;
- (NSMutableArray)directionsResponses;
- (NSMutableArray)directionsWaypointPlaceInfos;
- (NSMutableArray)visibleTileSets;
- (NSString)lastSearchString;
- (NSString)lastUserTypedSearchString;
- (NSString)tileStateLog;
- (double)creationDate;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)autocompleteSuggestionListAtIndex:(unint64_t)a3;
- (id)auxiliaryControlAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)directionsRequestAtIndex:(unint64_t)a3;
- (id)directionsResponseAtIndex:(unint64_t)a3;
- (id)directionsWaypointPlaceInfoAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)pinTypeAsString:(int)a3;
- (id)visibleTileSetAtIndex:(unint64_t)a3;
- (int)StringAsPinType:(id)a3;
- (int)deviceGmtOffset;
- (int)pinType;
- (unint64_t)autocompleteSuggestionListsCount;
- (unint64_t)auxiliaryControlsCount;
- (unint64_t)directionsRequestsCount;
- (unint64_t)directionsResponsesCount;
- (unint64_t)directionsWaypointPlaceInfosCount;
- (unint64_t)hash;
- (unint64_t)originatingAuxiliaryControlIndex;
- (unint64_t)visibleTileSetsCount;
- (void)_addNoFlagsAutocompleteSuggestionList:(uint64_t)a1;
- (void)_addNoFlagsAuxiliaryControl:(uint64_t)a1;
- (void)_addNoFlagsDirectionsRequest:(uint64_t)a1;
- (void)_addNoFlagsDirectionsResponse:(uint64_t)a1;
- (void)_addNoFlagsDirectionsWaypointPlaceInfo:(uint64_t)a1;
- (void)_addNoFlagsVisibleTileSet:(uint64_t)a1;
- (void)_readAutocompleteSuggestionLists;
- (void)_readAuxiliaryControls;
- (void)_readCurrentAbAssignmentResponse;
- (void)_readCurrentEnvironmentManifestUrls;
- (void)_readDirectionsRequests;
- (void)_readDirectionsResponses;
- (void)_readDirectionsWaypointPlaceInfos;
- (void)_readLastSearchString;
- (void)_readLastUserTypedSearchString;
- (void)_readMapLocation;
- (void)_readMerchantLookupContext;
- (void)_readNavigationSettings;
- (void)_readOriginalPlace;
- (void)_readPersonalizedMaps;
- (void)_readPlace;
- (void)_readPlaceInfo;
- (void)_readServicesState;
- (void)_readTileStateLog;
- (void)_readTransitLineTileInfo;
- (void)_readVisibleTileSets;
- (void)addAutocompleteSuggestionList:(id)a3;
- (void)addAuxiliaryControl:(id)a3;
- (void)addDirectionsRequest:(id)a3;
- (void)addDirectionsResponse:(id)a3;
- (void)addDirectionsWaypointPlaceInfo:(id)a3;
- (void)addVisibleTileSet:(id)a3;
- (void)clearAutocompleteSuggestionLists;
- (void)clearAuxiliaryControls;
- (void)clearDirectionsRequests;
- (void)clearDirectionsResponses;
- (void)clearDirectionsWaypointPlaceInfos;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearVisibleTileSets;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAutocompleteSuggestionLists:(id)a3;
- (void)setAuxiliaryControls:(id)a3;
- (void)setCreationDate:(double)a3;
- (void)setCurrentAbAssignmentResponse:(id)a3;
- (void)setCurrentEnvironmentManifestUrls:(id)a3;
- (void)setDeviceGmtOffset:(int)a3;
- (void)setDirectionsRequests:(id)a3;
- (void)setDirectionsResponses:(id)a3;
- (void)setDirectionsWaypointPlaceInfos:(id)a3;
- (void)setHasCreationDate:(BOOL)a3;
- (void)setHasDeviceGmtOffset:(BOOL)a3;
- (void)setHasOriginatingAuxiliaryControlIndex:(BOOL)a3;
- (void)setHasPinType:(BOOL)a3;
- (void)setHasSessionId:(BOOL)a3;
- (void)setLastSearchString:(id)a3;
- (void)setLastUserTypedSearchString:(id)a3;
- (void)setMapLocation:(id)a3;
- (void)setMerchantLookupContext:(id)a3;
- (void)setNavigationSettings:(id)a3;
- (void)setOriginalPlace:(id)a3;
- (void)setOriginatingAuxiliaryControlIndex:(unint64_t)a3;
- (void)setPersonalizedMaps:(id)a3;
- (void)setPinType:(int)a3;
- (void)setPlace:(id)a3;
- (void)setPlaceInfo:(id)a3;
- (void)setServicesState:(id)a3;
- (void)setSessionId:(GEOSessionID)a3;
- (void)setTileStateLog:(id)a3;
- (void)setTransitLineTileInfo:(id)a3;
- (void)setVisibleTileSets:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPProblemContext

- (GEORPProblemContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPProblemContext;
  v2 = [(GEORPProblemContext *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPProblemContext)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPProblemContext;
  v3 = [(GEORPProblemContext *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
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

- (void)setSessionId:(GEOSessionID)a3
{
  *(_DWORD *)&self->_flags |= 0x2000001u;
  self->_sessionId = a3;
}

- (void)setHasSessionId:(BOOL)a3
{
  self->_flags = ($C1B93A348CBC2642A5F7A481C310B991)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x2000000);
}

- (BOOL)hasSessionId
{
  return *(_DWORD *)&self->_flags & 1;
}

- (int)pinType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $C1B93A348CBC2642A5F7A481C310B991 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x10) != 0) {
    return self->_pinType;
  }
  else {
    return -1;
  }
}

- (void)setPinType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000010u;
  self->_pinType = a3;
}

- (void)setHasPinType:(BOOL)a3
{
  if (a3) {
    int v3 = 33554448;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$C1B93A348CBC2642A5F7A481C310B991 flags = ($C1B93A348CBC2642A5F7A481C310B991)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasPinType
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)pinTypeAsString:(int)a3
{
  if ((a3 + 1) >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53E6DD8[a3 + 1];
  }

  return v3;
}

- (int)StringAsPinType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PIN_TYPE_UNKNOWN"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"SEARCH_RESULT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"POI_ICON"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DROPPED_PIN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CONTACT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CURRENT_LOCATION"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"BOOKMARK"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"EXTERNAL"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"PIN_TYPE_SEARCH_AUTOCOMPLETE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"BRAND_ICON"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SHARED_LOCATION"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (void)_readOriginalPlace
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 230) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalPlace_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasOriginalPlace
{
  return self->_originalPlace != 0;
}

- (GEOPlace)originalPlace
{
  -[GEORPProblemContext _readOriginalPlace]((uint64_t)self);
  originalPlace = self->_originalPlace;

  return originalPlace;
}

- (void)setOriginalPlace:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2020000u;
  objc_storeStrong((id *)&self->_originalPlace, a3);
}

- (void)_readMapLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 229) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapLocation_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasMapLocation
{
  return self->_mapLocation != 0;
}

- (GEORPMapLocation)mapLocation
{
  -[GEORPProblemContext _readMapLocation]((uint64_t)self);
  mapLocation = self->_mapLocation;

  return mapLocation;
}

- (void)setMapLocation:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2004000u;
  objc_storeStrong((id *)&self->_mapLocation, a3);
}

- (void)_readVisibleTileSets
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 231) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVisibleTileSets_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (NSMutableArray)visibleTileSets
{
  -[GEORPProblemContext _readVisibleTileSets]((uint64_t)self);
  visibleTileSets = self->_visibleTileSets;

  return visibleTileSets;
}

- (void)setVisibleTileSets:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
  visibleTileSets = self->_visibleTileSets;
  self->_visibleTileSets = v4;
}

- (void)clearVisibleTileSets
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
  visibleTileSets = self->_visibleTileSets;

  [(NSMutableArray *)visibleTileSets removeAllObjects];
}

- (void)addVisibleTileSet:(id)a3
{
  id v4 = a3;
  -[GEORPProblemContext _readVisibleTileSets]((uint64_t)self);
  -[GEORPProblemContext _addNoFlagsVisibleTileSet:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
}

- (void)_addNoFlagsVisibleTileSet:(uint64_t)a1
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

- (unint64_t)visibleTileSetsCount
{
  -[GEORPProblemContext _readVisibleTileSets]((uint64_t)self);
  visibleTileSets = self->_visibleTileSets;

  return [(NSMutableArray *)visibleTileSets count];
}

- (id)visibleTileSetAtIndex:(unint64_t)a3
{
  -[GEORPProblemContext _readVisibleTileSets]((uint64_t)self);
  visibleTileSets = self->_visibleTileSets;

  return (id)[(NSMutableArray *)visibleTileSets objectAtIndex:a3];
}

+ (Class)visibleTileSetType
{
  return (Class)objc_opt_class();
}

- (void)_readTileStateLog
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 230) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTileStateLog_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasTileStateLog
{
  return self->_tileStateLog != 0;
}

- (NSString)tileStateLog
{
  -[GEORPProblemContext _readTileStateLog]((uint64_t)self);
  tileStateLog = self->_tileStateLog;

  return tileStateLog;
}

- (void)setTileStateLog:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2400000u;
  objc_storeStrong((id *)&self->_tileStateLog, a3);
}

- (void)_readPlace
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 230) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlace_tags_4);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasPlace
{
  return self->_place != 0;
}

- (GEOPDPlace)place
{
  -[GEORPProblemContext _readPlace]((uint64_t)self);
  place = self->_place;

  return place;
}

- (void)setPlace:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2100000u;
  objc_storeStrong((id *)&self->_place, a3);
}

- (void)_readDirectionsRequests
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 229) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsRequests_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (NSMutableArray)directionsRequests
{
  -[GEORPProblemContext _readDirectionsRequests]((uint64_t)self);
  directionsRequests = self->_directionsRequests;

  return directionsRequests;
}

- (void)setDirectionsRequests:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
  directionsRequests = self->_directionsRequests;
  self->_directionsRequests = v4;
}

- (void)clearDirectionsRequests
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
  directionsRequests = self->_directionsRequests;

  [(NSMutableArray *)directionsRequests removeAllObjects];
}

- (void)addDirectionsRequest:(id)a3
{
  id v4 = a3;
  -[GEORPProblemContext _readDirectionsRequests]((uint64_t)self);
  -[GEORPProblemContext _addNoFlagsDirectionsRequest:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
}

- (void)_addNoFlagsDirectionsRequest:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 72);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v5;

      id v4 = *(void **)(a1 + 72);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)directionsRequestsCount
{
  -[GEORPProblemContext _readDirectionsRequests]((uint64_t)self);
  directionsRequests = self->_directionsRequests;

  return [(NSMutableArray *)directionsRequests count];
}

- (id)directionsRequestAtIndex:(unint64_t)a3
{
  -[GEORPProblemContext _readDirectionsRequests]((uint64_t)self);
  directionsRequests = self->_directionsRequests;

  return (id)[(NSMutableArray *)directionsRequests objectAtIndex:a3];
}

+ (Class)directionsRequestType
{
  return (Class)objc_opt_class();
}

- (void)_readDirectionsResponses
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 229) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsResponses_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (NSMutableArray)directionsResponses
{
  -[GEORPProblemContext _readDirectionsResponses]((uint64_t)self);
  directionsResponses = self->_directionsResponses;

  return directionsResponses;
}

- (void)setDirectionsResponses:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
  directionsResponses = self->_directionsResponses;
  self->_directionsResponses = v4;
}

- (void)clearDirectionsResponses
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
  directionsResponses = self->_directionsResponses;

  [(NSMutableArray *)directionsResponses removeAllObjects];
}

- (void)addDirectionsResponse:(id)a3
{
  id v4 = a3;
  -[GEORPProblemContext _readDirectionsResponses]((uint64_t)self);
  -[GEORPProblemContext _addNoFlagsDirectionsResponse:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
}

- (void)_addNoFlagsDirectionsResponse:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 80);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v5;

      id v4 = *(void **)(a1 + 80);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)directionsResponsesCount
{
  -[GEORPProblemContext _readDirectionsResponses]((uint64_t)self);
  directionsResponses = self->_directionsResponses;

  return [(NSMutableArray *)directionsResponses count];
}

- (id)directionsResponseAtIndex:(unint64_t)a3
{
  -[GEORPProblemContext _readDirectionsResponses]((uint64_t)self);
  directionsResponses = self->_directionsResponses;

  return (id)[(NSMutableArray *)directionsResponses objectAtIndex:a3];
}

+ (Class)directionsResponseType
{
  return (Class)objc_opt_class();
}

- (void)_readLastSearchString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 229) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLastSearchString_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasLastSearchString
{
  return self->_lastSearchString != 0;
}

- (NSString)lastSearchString
{
  -[GEORPProblemContext _readLastSearchString]((uint64_t)self);
  lastSearchString = self->_lastSearchString;

  return lastSearchString;
}

- (void)setLastSearchString:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2001000u;
  objc_storeStrong((id *)&self->_lastSearchString, a3);
}

- (double)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x2000002u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  if (a3) {
    int v3 = 33554434;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$C1B93A348CBC2642A5F7A481C310B991 flags = ($C1B93A348CBC2642A5F7A481C310B991)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasCreationDate
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readAuxiliaryControls
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 228) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAuxiliaryControls_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (NSMutableArray)auxiliaryControls
{
  -[GEORPProblemContext _readAuxiliaryControls]((uint64_t)self);
  auxiliaryControls = self->_auxiliaryControls;

  return auxiliaryControls;
}

- (void)setAuxiliaryControls:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
  auxiliaryControls = self->_auxiliaryControls;
  self->_auxiliaryControls = v4;
}

- (void)clearAuxiliaryControls
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
  auxiliaryControls = self->_auxiliaryControls;

  [(NSMutableArray *)auxiliaryControls removeAllObjects];
}

- (void)addAuxiliaryControl:(id)a3
{
  id v4 = a3;
  -[GEORPProblemContext _readAuxiliaryControls]((uint64_t)self);
  -[GEORPProblemContext _addNoFlagsAuxiliaryControl:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
}

- (void)_addNoFlagsAuxiliaryControl:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)auxiliaryControlsCount
{
  -[GEORPProblemContext _readAuxiliaryControls]((uint64_t)self);
  auxiliaryControls = self->_auxiliaryControls;

  return [(NSMutableArray *)auxiliaryControls count];
}

- (id)auxiliaryControlAtIndex:(unint64_t)a3
{
  -[GEORPProblemContext _readAuxiliaryControls]((uint64_t)self);
  auxiliaryControls = self->_auxiliaryControls;

  return (id)[(NSMutableArray *)auxiliaryControls objectAtIndex:a3];
}

+ (Class)auxiliaryControlType
{
  return (Class)objc_opt_class();
}

- (unint64_t)originatingAuxiliaryControlIndex
{
  return self->_originatingAuxiliaryControlIndex;
}

- (void)setOriginatingAuxiliaryControlIndex:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x2000004u;
  self->_originatingAuxiliaryControlIndex = a3;
}

- (void)setHasOriginatingAuxiliaryControlIndex:(BOOL)a3
{
  if (a3) {
    int v3 = 33554436;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$C1B93A348CBC2642A5F7A481C310B991 flags = ($C1B93A348CBC2642A5F7A481C310B991)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasOriginatingAuxiliaryControlIndex
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readTransitLineTileInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 230) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitLineTileInfo_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasTransitLineTileInfo
{
  return self->_transitLineTileInfo != 0;
}

- (GEORPTransitLineTileInfo)transitLineTileInfo
{
  -[GEORPProblemContext _readTransitLineTileInfo]((uint64_t)self);
  transitLineTileInfo = self->_transitLineTileInfo;

  return transitLineTileInfo;
}

- (void)setTransitLineTileInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2800000u;
  objc_storeStrong((id *)&self->_transitLineTileInfo, a3);
}

- (void)_readPlaceInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 230) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceInfo_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasPlaceInfo
{
  return self->_placeInfo != 0;
}

- (GEORPPlaceInfo)placeInfo
{
  -[GEORPProblemContext _readPlaceInfo]((uint64_t)self);
  placeInfo = self->_placeInfo;

  return placeInfo;
}

- (void)setPlaceInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2080000u;
  objc_storeStrong((id *)&self->_placeInfo, a3);
}

- (void)_readLastUserTypedSearchString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 229) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLastUserTypedSearchString_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasLastUserTypedSearchString
{
  return self->_lastUserTypedSearchString != 0;
}

- (NSString)lastUserTypedSearchString
{
  -[GEORPProblemContext _readLastUserTypedSearchString]((uint64_t)self);
  lastUserTypedSearchString = self->_lastUserTypedSearchString;

  return lastUserTypedSearchString;
}

- (void)setLastUserTypedSearchString:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2002000u;
  objc_storeStrong((id *)&self->_lastUserTypedSearchString, a3);
}

- (int)deviceGmtOffset
{
  return self->_deviceGmtOffset;
}

- (void)setDeviceGmtOffset:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000008u;
  self->_deviceGmtOffset = a3;
}

- (void)setHasDeviceGmtOffset:(BOOL)a3
{
  if (a3) {
    int v3 = 33554440;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$C1B93A348CBC2642A5F7A481C310B991 flags = ($C1B93A348CBC2642A5F7A481C310B991)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDeviceGmtOffset
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (void)_readCurrentAbAssignmentResponse
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 228) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCurrentAbAssignmentResponse_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasCurrentAbAssignmentResponse
{
  return self->_currentAbAssignmentResponse != 0;
}

- (GEOABAssignmentResponse)currentAbAssignmentResponse
{
  -[GEORPProblemContext _readCurrentAbAssignmentResponse]((uint64_t)self);
  currentAbAssignmentResponse = self->_currentAbAssignmentResponse;

  return currentAbAssignmentResponse;
}

- (void)setCurrentAbAssignmentResponse:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2000080u;
  objc_storeStrong((id *)&self->_currentAbAssignmentResponse, a3);
}

- (void)_readAutocompleteSuggestionLists
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 228) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAutocompleteSuggestionLists_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (NSMutableArray)autocompleteSuggestionLists
{
  -[GEORPProblemContext _readAutocompleteSuggestionLists]((uint64_t)self);
  autocompleteSuggestionLists = self->_autocompleteSuggestionLists;

  return autocompleteSuggestionLists;
}

- (void)setAutocompleteSuggestionLists:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
  autocompleteSuggestionLists = self->_autocompleteSuggestionLists;
  self->_autocompleteSuggestionLists = v4;
}

- (void)clearAutocompleteSuggestionLists
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
  autocompleteSuggestionLists = self->_autocompleteSuggestionLists;

  [(NSMutableArray *)autocompleteSuggestionLists removeAllObjects];
}

- (void)addAutocompleteSuggestionList:(id)a3
{
  id v4 = a3;
  -[GEORPProblemContext _readAutocompleteSuggestionLists]((uint64_t)self);
  -[GEORPProblemContext _addNoFlagsAutocompleteSuggestionList:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
}

- (void)_addNoFlagsAutocompleteSuggestionList:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)autocompleteSuggestionListsCount
{
  -[GEORPProblemContext _readAutocompleteSuggestionLists]((uint64_t)self);
  autocompleteSuggestionLists = self->_autocompleteSuggestionLists;

  return [(NSMutableArray *)autocompleteSuggestionLists count];
}

- (id)autocompleteSuggestionListAtIndex:(unint64_t)a3
{
  -[GEORPProblemContext _readAutocompleteSuggestionLists]((uint64_t)self);
  autocompleteSuggestionLists = self->_autocompleteSuggestionLists;

  return (id)[(NSMutableArray *)autocompleteSuggestionLists objectAtIndex:a3];
}

+ (Class)autocompleteSuggestionListType
{
  return (Class)objc_opt_class();
}

- (void)_readCurrentEnvironmentManifestUrls
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 229) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCurrentEnvironmentManifestUrls_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasCurrentEnvironmentManifestUrls
{
  return self->_currentEnvironmentManifestUrls != 0;
}

- (GEORPCurrentEnvironmentManifestURLs)currentEnvironmentManifestUrls
{
  -[GEORPProblemContext _readCurrentEnvironmentManifestUrls]((uint64_t)self);
  currentEnvironmentManifestUrls = self->_currentEnvironmentManifestUrls;

  return currentEnvironmentManifestUrls;
}

- (void)setCurrentEnvironmentManifestUrls:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2000100u;
  objc_storeStrong((id *)&self->_currentEnvironmentManifestUrls, a3);
}

- (void)_readDirectionsWaypointPlaceInfos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 229) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsWaypointPlaceInfos_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (NSMutableArray)directionsWaypointPlaceInfos
{
  -[GEORPProblemContext _readDirectionsWaypointPlaceInfos]((uint64_t)self);
  directionsWaypointPlaceInfos = self->_directionsWaypointPlaceInfos;

  return directionsWaypointPlaceInfos;
}

- (void)setDirectionsWaypointPlaceInfos:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
  directionsWaypointPlaceInfos = self->_directionsWaypointPlaceInfos;
  self->_directionsWaypointPlaceInfos = v4;
}

- (void)clearDirectionsWaypointPlaceInfos
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
  directionsWaypointPlaceInfos = self->_directionsWaypointPlaceInfos;

  [(NSMutableArray *)directionsWaypointPlaceInfos removeAllObjects];
}

- (void)addDirectionsWaypointPlaceInfo:(id)a3
{
  id v4 = a3;
  -[GEORPProblemContext _readDirectionsWaypointPlaceInfos]((uint64_t)self);
  -[GEORPProblemContext _addNoFlagsDirectionsWaypointPlaceInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
}

- (void)_addNoFlagsDirectionsWaypointPlaceInfo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 88);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v5;

      id v4 = *(void **)(a1 + 88);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)directionsWaypointPlaceInfosCount
{
  -[GEORPProblemContext _readDirectionsWaypointPlaceInfos]((uint64_t)self);
  directionsWaypointPlaceInfos = self->_directionsWaypointPlaceInfos;

  return [(NSMutableArray *)directionsWaypointPlaceInfos count];
}

- (id)directionsWaypointPlaceInfoAtIndex:(unint64_t)a3
{
  -[GEORPProblemContext _readDirectionsWaypointPlaceInfos]((uint64_t)self);
  directionsWaypointPlaceInfos = self->_directionsWaypointPlaceInfos;

  return (id)[(NSMutableArray *)directionsWaypointPlaceInfos objectAtIndex:a3];
}

+ (Class)directionsWaypointPlaceInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readServicesState
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 230) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readServicesState_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasServicesState
{
  return self->_servicesState != 0;
}

- (GEOServicesState)servicesState
{
  -[GEORPProblemContext _readServicesState]((uint64_t)self);
  servicesState = self->_servicesState;

  return servicesState;
}

- (void)setServicesState:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2200000u;
  objc_storeStrong((id *)&self->_servicesState, a3);
}

- (void)_readPersonalizedMaps
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 230) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPersonalizedMaps_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasPersonalizedMaps
{
  return self->_personalizedMaps != 0;
}

- (GEORPPersonalizedMaps)personalizedMaps
{
  -[GEORPProblemContext _readPersonalizedMaps]((uint64_t)self);
  personalizedMaps = self->_personalizedMaps;

  return personalizedMaps;
}

- (void)setPersonalizedMaps:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2040000u;
  objc_storeStrong((id *)&self->_personalizedMaps, a3);
}

- (void)_readNavigationSettings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 230) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNavigationSettings_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasNavigationSettings
{
  return self->_navigationSettings != 0;
}

- (GEORPNavigationSettings)navigationSettings
{
  -[GEORPProblemContext _readNavigationSettings]((uint64_t)self);
  navigationSettings = self->_navigationSettings;

  return navigationSettings;
}

- (void)setNavigationSettings:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2010000u;
  objc_storeStrong((id *)&self->_navigationSettings, a3);
}

- (void)_readMerchantLookupContext
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 229) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantLookupContext_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasMerchantLookupContext
{
  return self->_merchantLookupContext != 0;
}

- (GEORPMerchantLookupContext)merchantLookupContext
{
  -[GEORPProblemContext _readMerchantLookupContext]((uint64_t)self);
  merchantLookupContext = self->_merchantLookupContext;

  return merchantLookupContext;
}

- (void)setMerchantLookupContext:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2008000u;
  objc_storeStrong((id *)&self->_merchantLookupContext, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPProblemContext;
  id v4 = [(GEORPProblemContext *)&v8 description];
  id v5 = [(GEORPProblemContext *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPProblemContext _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    int v5 = *(_DWORD *)(a1 + 228);
    if (v5)
    {
      objc_super v6 = _GEOSessionIDDictionaryRepresentation((void *)(a1 + 16));
      if (a2) {
        id v7 = @"sessionId";
      }
      else {
        id v7 = @"session_id";
      }
      id v8 = v6;

      [v4 setObject:v8 forKey:v7];
      int v5 = *(_DWORD *)(a1 + 228);
    }
    if ((v5 & 0x10) != 0)
    {
      unsigned int v9 = *(_DWORD *)(a1 + 224) + 1;
      if (v9 >= 0xB)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 224));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E53E6DD8[v9];
      }
      if (a2) {
        v11 = @"pinType";
      }
      else {
        v11 = @"pin_type";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = [(id)a1 originalPlace];
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 jsonRepresentation];
        v15 = @"originalPlace";
      }
      else
      {
        v14 = [v12 dictionaryRepresentation];
        v15 = @"original_place";
      }
      id v16 = v14;

      [v4 setObject:v16 forKey:v15];
    }

    v17 = [(id)a1 mapLocation];
    v18 = v17;
    if (v17)
    {
      if (a2)
      {
        v19 = [v17 jsonRepresentation];
        v20 = @"mapLocation";
      }
      else
      {
        v19 = [v17 dictionaryRepresentation];
        v20 = @"map_location";
      }
      id v21 = v19;

      [v4 setObject:v21 forKey:v20];
    }

    if ([*(id *)(a1 + 200) count])
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 200), "count"));
      long long v153 = 0u;
      long long v154 = 0u;
      long long v155 = 0u;
      long long v156 = 0u;
      id v23 = *(id *)(a1 + 200);
      uint64_t v24 = [v23 countByEnumeratingWithState:&v153 objects:v162 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v154;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v154 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = *(void **)(*((void *)&v153 + 1) + 8 * i);
            if (a2) {
              [v28 jsonRepresentation];
            }
            else {
            id v29 = [v28 dictionaryRepresentation];
            }

            [v22 addObject:v29];
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v153 objects:v162 count:16];
        }
        while (v25);
      }

      if (a2) {
        v30 = @"visibleTileSet";
      }
      else {
        v30 = @"visible_tile_set";
      }
      [v4 setObject:v22 forKey:v30];
    }
    v31 = [(id)a1 tileStateLog];
    if (v31)
    {
      if (a2) {
        v32 = @"tileStateLog";
      }
      else {
        v32 = @"tile_state_log";
      }
      [v4 setObject:v31 forKey:v32];
    }

    v33 = [(id)a1 place];
    v34 = v33;
    if (v33)
    {
      if (a2) {
        [v33 jsonRepresentation];
      }
      else {
      id v35 = [v33 dictionaryRepresentation];
      }

      [v4 setObject:v35 forKey:@"place"];
    }

    if ([*(id *)(a1 + 72) count])
    {
      v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
      long long v149 = 0u;
      long long v150 = 0u;
      long long v151 = 0u;
      long long v152 = 0u;
      id v37 = *(id *)(a1 + 72);
      uint64_t v38 = [v37 countByEnumeratingWithState:&v149 objects:v161 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v150;
        do
        {
          for (uint64_t j = 0; j != v39; ++j)
          {
            if (*(void *)v150 != v40) {
              objc_enumerationMutation(v37);
            }
            v42 = *(void **)(*((void *)&v149 + 1) + 8 * j);
            if (a2) {
              [v42 jsonRepresentation];
            }
            else {
            id v43 = [v42 dictionaryRepresentation];
            }

            [v36 addObject:v43];
          }
          uint64_t v39 = [v37 countByEnumeratingWithState:&v149 objects:v161 count:16];
        }
        while (v39);
      }

      if (a2) {
        v44 = @"directionsRequest";
      }
      else {
        v44 = @"directions_request";
      }
      [v4 setObject:v36 forKey:v44];
    }
    if ([*(id *)(a1 + 80) count])
    {
      v45 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 80), "count"));
      long long v145 = 0u;
      long long v146 = 0u;
      long long v147 = 0u;
      long long v148 = 0u;
      id v46 = *(id *)(a1 + 80);
      uint64_t v47 = [v46 countByEnumeratingWithState:&v145 objects:v160 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)v146;
        do
        {
          for (uint64_t k = 0; k != v48; ++k)
          {
            if (*(void *)v146 != v49) {
              objc_enumerationMutation(v46);
            }
            v51 = *(void **)(*((void *)&v145 + 1) + 8 * k);
            if (a2) {
              [v51 jsonRepresentation];
            }
            else {
            id v52 = [v51 dictionaryRepresentation];
            }

            [v45 addObject:v52];
          }
          uint64_t v48 = [v46 countByEnumeratingWithState:&v145 objects:v160 count:16];
        }
        while (v48);
      }

      if (a2) {
        v53 = @"directionsResponse";
      }
      else {
        v53 = @"directions_response";
      }
      [v4 setObject:v45 forKey:v53];
    }
    v54 = [(id)a1 lastSearchString];
    if (v54)
    {
      if (a2) {
        v55 = @"lastSearchString";
      }
      else {
        v55 = @"last_search_string";
      }
      [v4 setObject:v54 forKey:v55];
    }

    if ((*(unsigned char *)(a1 + 228) & 2) != 0)
    {
      v56 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
      if (a2) {
        v57 = @"creationDate";
      }
      else {
        v57 = @"creation_date";
      }
      [v4 setObject:v56 forKey:v57];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v58 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v141 = 0u;
      long long v142 = 0u;
      long long v143 = 0u;
      long long v144 = 0u;
      id v59 = *(id *)(a1 + 40);
      uint64_t v60 = [v59 countByEnumeratingWithState:&v141 objects:v159 count:16];
      if (v60)
      {
        uint64_t v61 = v60;
        uint64_t v62 = *(void *)v142;
        do
        {
          for (uint64_t m = 0; m != v61; ++m)
          {
            if (*(void *)v142 != v62) {
              objc_enumerationMutation(v59);
            }
            v64 = *(void **)(*((void *)&v141 + 1) + 8 * m);
            if (a2) {
              [v64 jsonRepresentation];
            }
            else {
            id v65 = [v64 dictionaryRepresentation];
            }

            [v58 addObject:v65];
          }
          uint64_t v61 = [v59 countByEnumeratingWithState:&v141 objects:v159 count:16];
        }
        while (v61);
      }

      if (a2) {
        v66 = @"auxiliaryControl";
      }
      else {
        v66 = @"auxiliary_control";
      }
      [v4 setObject:v58 forKey:v66];
    }
    if ((*(unsigned char *)(a1 + 228) & 4) != 0)
    {
      v67 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 144)];
      if (a2) {
        v68 = @"originatingAuxiliaryControlIndex";
      }
      else {
        v68 = @"originating_auxiliary_control_index";
      }
      [v4 setObject:v67 forKey:v68];
    }
    v69 = [(id)a1 transitLineTileInfo];
    v70 = v69;
    if (v69)
    {
      if (a2)
      {
        v71 = [v69 jsonRepresentation];
        v72 = @"transitLineTileInfo";
      }
      else
      {
        v71 = [v69 dictionaryRepresentation];
        v72 = @"transit_line_tile_info";
      }
      id v73 = v71;

      [v4 setObject:v73 forKey:v72];
    }

    v74 = [(id)a1 placeInfo];
    v75 = v74;
    if (v74)
    {
      if (a2)
      {
        v76 = [v74 jsonRepresentation];
        v77 = @"placeInfo";
      }
      else
      {
        v76 = [v74 dictionaryRepresentation];
        v77 = @"place_info";
      }
      id v78 = v76;

      [v4 setObject:v78 forKey:v77];
    }

    v79 = [(id)a1 lastUserTypedSearchString];
    if (v79)
    {
      if (a2) {
        v80 = @"lastUserTypedSearchString";
      }
      else {
        v80 = @"last_user_typed_search_string";
      }
      [v4 setObject:v79 forKey:v80];
    }

    if ((*(unsigned char *)(a1 + 228) & 8) != 0)
    {
      v81 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 220)];
      if (a2) {
        v82 = @"deviceGmtOffset";
      }
      else {
        v82 = @"device_gmt_offset";
      }
      [v4 setObject:v81 forKey:v82];
    }
    v83 = [(id)a1 currentAbAssignmentResponse];
    v84 = v83;
    if (v83)
    {
      if (a2)
      {
        v85 = [v83 jsonRepresentation];
        v86 = @"currentAbAssignmentResponse";
      }
      else
      {
        v85 = [v83 dictionaryRepresentation];
        v86 = @"current_ab_assignment_response";
      }
      id v87 = v85;

      [v4 setObject:v87 forKey:v86];
    }

    if ([*(id *)(a1 + 32) count])
    {
      v88 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v137 = 0u;
      long long v138 = 0u;
      long long v139 = 0u;
      long long v140 = 0u;
      id v89 = *(id *)(a1 + 32);
      uint64_t v90 = [v89 countByEnumeratingWithState:&v137 objects:v158 count:16];
      if (v90)
      {
        uint64_t v91 = v90;
        uint64_t v92 = *(void *)v138;
        do
        {
          for (uint64_t n = 0; n != v91; ++n)
          {
            if (*(void *)v138 != v92) {
              objc_enumerationMutation(v89);
            }
            v94 = *(void **)(*((void *)&v137 + 1) + 8 * n);
            if (a2) {
              [v94 jsonRepresentation];
            }
            else {
            id v95 = [v94 dictionaryRepresentation];
            }

            [v88 addObject:v95];
          }
          uint64_t v91 = [v89 countByEnumeratingWithState:&v137 objects:v158 count:16];
        }
        while (v91);
      }

      if (a2) {
        v96 = @"autocompleteSuggestionList";
      }
      else {
        v96 = @"autocomplete_suggestion_list";
      }
      [v4 setObject:v88 forKey:v96];
    }
    v97 = [(id)a1 currentEnvironmentManifestUrls];
    v98 = v97;
    if (v97)
    {
      if (a2)
      {
        v99 = [v97 jsonRepresentation];
        v100 = @"currentEnvironmentManifestUrls";
      }
      else
      {
        v99 = [v97 dictionaryRepresentation];
        v100 = @"current_environment_manifest_urls";
      }
      id v101 = v99;

      [v4 setObject:v101 forKey:v100];
    }

    if ([*(id *)(a1 + 88) count])
    {
      v102 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
      long long v133 = 0u;
      long long v134 = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      id v103 = *(id *)(a1 + 88);
      uint64_t v104 = [v103 countByEnumeratingWithState:&v133 objects:v157 count:16];
      if (v104)
      {
        uint64_t v105 = v104;
        uint64_t v106 = *(void *)v134;
        do
        {
          for (iuint64_t i = 0; ii != v105; ++ii)
          {
            if (*(void *)v134 != v106) {
              objc_enumerationMutation(v103);
            }
            v108 = *(void **)(*((void *)&v133 + 1) + 8 * ii);
            if (a2) {
              [v108 jsonRepresentation];
            }
            else {
            id v109 = [v108 dictionaryRepresentation];
            }

            [v102 addObject:v109];
          }
          uint64_t v105 = [v103 countByEnumeratingWithState:&v133 objects:v157 count:16];
        }
        while (v105);
      }

      if (a2) {
        v110 = @"directionsWaypointPlaceInfo";
      }
      else {
        v110 = @"directions_waypoint_place_info";
      }
      [v4 setObject:v102 forKey:v110];
    }
    v111 = [(id)a1 servicesState];
    v112 = v111;
    if (v111)
    {
      if (a2)
      {
        v113 = [v111 jsonRepresentation];
        v114 = @"servicesState";
      }
      else
      {
        v113 = [v111 dictionaryRepresentation];
        v114 = @"services_state";
      }
      id v115 = v113;

      [v4 setObject:v115 forKey:v114];
    }

    v116 = [(id)a1 personalizedMaps];
    v117 = v116;
    if (v116)
    {
      if (a2)
      {
        v118 = [v116 jsonRepresentation];
        v119 = @"personalizedMaps";
      }
      else
      {
        v118 = [v116 dictionaryRepresentation];
        v119 = @"personalized_maps";
      }
      id v120 = v118;

      [v4 setObject:v120 forKey:v119];
    }

    v121 = [(id)a1 navigationSettings];
    v122 = v121;
    if (v121)
    {
      if (a2)
      {
        v123 = [v121 jsonRepresentation];
        v124 = @"navigationSettings";
      }
      else
      {
        v123 = [v121 dictionaryRepresentation];
        v124 = @"navigation_settings";
      }
      id v125 = v123;

      [v4 setObject:v125 forKey:v124];
    }

    v126 = [(id)a1 merchantLookupContext];
    v127 = v126;
    if (v126)
    {
      if (a2)
      {
        v128 = [v126 jsonRepresentation];
        v129 = @"merchantLookupContext";
      }
      else
      {
        v128 = [v126 dictionaryRepresentation];
        v129 = @"merchant_lookup_context";
      }
      id v130 = v128;

      [v4 setObject:v130 forKey:v129];
    }

    id v131 = v4;
  }
  else
  {
    id v131 = 0;
  }

  return v131;
}

- (id)jsonRepresentation
{
  return -[GEORPProblemContext _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPProblemContext)initWithDictionary:(id)a3
{
  return (GEORPProblemContext *)-[GEORPProblemContext _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v181 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_257;
  }
  a1 = (id)[a1 init];

  if (!a1) {
    goto LABEL_257;
  }
  if (a3) {
    objc_super v6 = @"sessionId";
  }
  else {
    objc_super v6 = @"session_id";
  }
  id v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v173 = 0;
    uint64_t v174 = 0;
    _GEOSessionIDFromDictionaryRepresentation(v7, &v173);
    objc_msgSend(a1, "setSessionId:", v173, v174);
  }

  if (a3) {
    id v8 = @"pinType";
  }
  else {
    id v8 = @"pin_type";
  }
  unsigned int v9 = [v5 objectForKeyedSubscript:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    if ([v10 isEqualToString:@"PIN_TYPE_UNKNOWN"])
    {
      uint64_t v11 = 0xFFFFFFFFLL;
    }
    else if ([v10 isEqualToString:@"SEARCH_RESULT"])
    {
      uint64_t v11 = 0;
    }
    else if ([v10 isEqualToString:@"POI_ICON"])
    {
      uint64_t v11 = 1;
    }
    else if ([v10 isEqualToString:@"DROPPED_PIN"])
    {
      uint64_t v11 = 2;
    }
    else if ([v10 isEqualToString:@"CONTACT"])
    {
      uint64_t v11 = 3;
    }
    else if ([v10 isEqualToString:@"CURRENT_LOCATION"])
    {
      uint64_t v11 = 4;
    }
    else if ([v10 isEqualToString:@"BOOKMARK"])
    {
      uint64_t v11 = 5;
    }
    else if ([v10 isEqualToString:@"EXTERNAL"])
    {
      uint64_t v11 = 6;
    }
    else if ([v10 isEqualToString:@"PIN_TYPE_SEARCH_AUTOCOMPLETE"])
    {
      uint64_t v11 = 7;
    }
    else if ([v10 isEqualToString:@"BRAND_ICON"])
    {
      uint64_t v11 = 8;
    }
    else if ([v10 isEqualToString:@"SHARED_LOCATION"])
    {
      uint64_t v11 = 9;
    }
    else
    {
      uint64_t v11 = 0xFFFFFFFFLL;
    }

    goto LABEL_38;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v9 intValue];
LABEL_38:
    [a1 setPinType:v11];
  }

  if (a3) {
    v12 = @"originalPlace";
  }
  else {
    v12 = @"original_place";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [GEOPlace alloc];
    if (a3) {
      uint64_t v15 = [(GEOPlace *)v14 initWithJSON:v13];
    }
    else {
      uint64_t v15 = [(GEOPlace *)v14 initWithDictionary:v13];
    }
    id v16 = (void *)v15;
    [a1 setOriginalPlace:v15];
  }
  if (a3) {
    v17 = @"mapLocation";
  }
  else {
    v17 = @"map_location";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = [GEORPMapLocation alloc];
    if (a3) {
      uint64_t v20 = [(GEORPMapLocation *)v19 initWithJSON:v18];
    }
    else {
      uint64_t v20 = [(GEORPMapLocation *)v19 initWithDictionary:v18];
    }
    id v21 = (void *)v20;
    [a1 setMapLocation:v20];
  }
  if (a3) {
    v22 = @"visibleTileSet";
  }
  else {
    v22 = @"visible_tile_set";
  }
  id v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  id v148 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v171 = 0u;
    long long v172 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    id v24 = v23;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v169 objects:v180 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v170;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v170 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void *)(*((void *)&v169 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v30 = [GEORPVisibleTileSet alloc];
            if (a3) {
              uint64_t v31 = [(GEORPVisibleTileSet *)v30 initWithJSON:v29];
            }
            else {
              uint64_t v31 = [(GEORPVisibleTileSet *)v30 initWithDictionary:v29];
            }
            v32 = (void *)v31;
            [a1 addVisibleTileSet:v31];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v169 objects:v180 count:16];
      }
      while (v26);
    }

    id v5 = v148;
  }

  if (a3) {
    v33 = @"tileStateLog";
  }
  else {
    v33 = @"tile_state_log";
  }
  v34 = [v5 objectForKeyedSubscript:v33];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v35 = (void *)[v34 copy];
    [a1 setTileStateLog:v35];
  }
  v36 = [v5 objectForKeyedSubscript:@"place"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v37 = [GEOPDPlace alloc];
    if (a3) {
      uint64_t v38 = [(GEOPDPlace *)v37 initWithJSON:v36];
    }
    else {
      uint64_t v38 = [(GEOPDPlace *)v37 initWithDictionary:v36];
    }
    uint64_t v39 = (void *)v38;
    [a1 setPlace:v38];
  }
  if (a3) {
    uint64_t v40 = @"directionsRequest";
  }
  else {
    uint64_t v40 = @"directions_request";
  }
  v41 = [v5 objectForKeyedSubscript:v40];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v167 = 0u;
    long long v168 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    id v42 = v41;
    uint64_t v43 = [v42 countByEnumeratingWithState:&v165 objects:v179 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v166;
      do
      {
        for (uint64_t j = 0; j != v44; ++j)
        {
          if (*(void *)v166 != v45) {
            objc_enumerationMutation(v42);
          }
          uint64_t v47 = *(void *)(*((void *)&v165 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v48 = [GEODirectionsRequest alloc];
            if (a3) {
              uint64_t v49 = [(GEODirectionsRequest *)v48 initWithJSON:v47];
            }
            else {
              uint64_t v49 = [(GEODirectionsRequest *)v48 initWithDictionary:v47];
            }
            v50 = (void *)v49;
            [a1 addDirectionsRequest:v49];
          }
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v165 objects:v179 count:16];
      }
      while (v44);
    }

    id v5 = v148;
  }

  if (a3) {
    v51 = @"directionsResponse";
  }
  else {
    v51 = @"directions_response";
  }
  id v52 = [v5 objectForKeyedSubscript:v51];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v163 = 0u;
    long long v164 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    id v53 = v52;
    uint64_t v54 = [v53 countByEnumeratingWithState:&v161 objects:v178 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)v162;
      do
      {
        for (uint64_t k = 0; k != v55; ++k)
        {
          if (*(void *)v162 != v56) {
            objc_enumerationMutation(v53);
          }
          uint64_t v58 = *(void *)(*((void *)&v161 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v59 = [GEODirectionsResponse alloc];
            if (a3) {
              uint64_t v60 = [(GEODirectionsResponse *)v59 initWithJSON:v58];
            }
            else {
              uint64_t v60 = [(GEODirectionsResponse *)v59 initWithDictionary:v58];
            }
            uint64_t v61 = (void *)v60;
            [a1 addDirectionsResponse:v60];
          }
        }
        uint64_t v55 = [v53 countByEnumeratingWithState:&v161 objects:v178 count:16];
      }
      while (v55);
    }

    id v5 = v148;
  }

  if (a3) {
    uint64_t v62 = @"lastSearchString";
  }
  else {
    uint64_t v62 = @"last_search_string";
  }
  v63 = [v5 objectForKeyedSubscript:v62];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v64 = (void *)[v63 copy];
    [a1 setLastSearchString:v64];
  }
  if (a3) {
    id v65 = @"creationDate";
  }
  else {
    id v65 = @"creation_date";
  }
  v66 = [v5 objectForKeyedSubscript:v65];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v66 doubleValue];
    objc_msgSend(a1, "setCreationDate:");
  }

  if (a3) {
    v67 = @"auxiliaryControl";
  }
  else {
    v67 = @"auxiliary_control";
  }
  v68 = [v5 objectForKeyedSubscript:v67];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v159 = 0u;
    long long v160 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    id v69 = v68;
    uint64_t v70 = [v69 countByEnumeratingWithState:&v157 objects:v177 count:16];
    if (v70)
    {
      uint64_t v71 = v70;
      uint64_t v72 = *(void *)v158;
      do
      {
        for (uint64_t m = 0; m != v71; ++m)
        {
          if (*(void *)v158 != v72) {
            objc_enumerationMutation(v69);
          }
          uint64_t v74 = *(void *)(*((void *)&v157 + 1) + 8 * m);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v75 = [GEORPAuxiliaryControl alloc];
            if (a3) {
              uint64_t v76 = [(GEORPAuxiliaryControl *)v75 initWithJSON:v74];
            }
            else {
              uint64_t v76 = [(GEORPAuxiliaryControl *)v75 initWithDictionary:v74];
            }
            v77 = (void *)v76;
            [a1 addAuxiliaryControl:v76];
          }
        }
        uint64_t v71 = [v69 countByEnumeratingWithState:&v157 objects:v177 count:16];
      }
      while (v71);
    }

    id v5 = v148;
  }

  if (a3) {
    id v78 = @"originatingAuxiliaryControlIndex";
  }
  else {
    id v78 = @"originating_auxiliary_control_index";
  }
  v79 = [v5 objectForKeyedSubscript:v78];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setOriginatingAuxiliaryControlIndex:", objc_msgSend(v79, "unsignedLongLongValue"));
  }

  if (a3) {
    v80 = @"transitLineTileInfo";
  }
  else {
    v80 = @"transit_line_tile_info";
  }
  v81 = [v5 objectForKeyedSubscript:v80];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v82 = [GEORPTransitLineTileInfo alloc];
    if (a3) {
      uint64_t v83 = [(GEORPTransitLineTileInfo *)v82 initWithJSON:v81];
    }
    else {
      uint64_t v83 = [(GEORPTransitLineTileInfo *)v82 initWithDictionary:v81];
    }
    v84 = (void *)v83;
    [a1 setTransitLineTileInfo:v83];
  }
  if (a3) {
    v85 = @"placeInfo";
  }
  else {
    v85 = @"place_info";
  }
  v86 = [v5 objectForKeyedSubscript:v85];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v87 = [GEORPPlaceInfo alloc];
    if (a3) {
      uint64_t v88 = [(GEORPPlaceInfo *)v87 initWithJSON:v86];
    }
    else {
      uint64_t v88 = [(GEORPPlaceInfo *)v87 initWithDictionary:v86];
    }
    id v89 = (void *)v88;
    [a1 setPlaceInfo:v88];
  }
  if (a3) {
    uint64_t v90 = @"lastUserTypedSearchString";
  }
  else {
    uint64_t v90 = @"last_user_typed_search_string";
  }
  uint64_t v91 = [v5 objectForKeyedSubscript:v90];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v92 = (void *)[v91 copy];
    [a1 setLastUserTypedSearchString:v92];
  }
  if (a3) {
    v93 = @"deviceGmtOffset";
  }
  else {
    v93 = @"device_gmt_offset";
  }
  v94 = [v5 objectForKeyedSubscript:v93];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDeviceGmtOffset:", objc_msgSend(v94, "intValue"));
  }

  if (a3) {
    id v95 = @"currentAbAssignmentResponse";
  }
  else {
    id v95 = @"current_ab_assignment_response";
  }
  v96 = [v5 objectForKeyedSubscript:v95];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v97 = [GEOABAssignmentResponse alloc];
    if (a3) {
      uint64_t v98 = [(GEOABAssignmentResponse *)v97 initWithJSON:v96];
    }
    else {
      uint64_t v98 = [(GEOABAssignmentResponse *)v97 initWithDictionary:v96];
    }
    v99 = (void *)v98;
    [a1 setCurrentAbAssignmentResponse:v98];
  }
  if (a3) {
    v100 = @"autocompleteSuggestionList";
  }
  else {
    v100 = @"autocomplete_suggestion_list";
  }
  id v101 = [v5 objectForKeyedSubscript:v100];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v155 = 0u;
    long long v156 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    id v102 = v101;
    uint64_t v103 = [v102 countByEnumeratingWithState:&v153 objects:v176 count:16];
    if (v103)
    {
      uint64_t v104 = v103;
      uint64_t v105 = *(void *)v154;
      do
      {
        for (uint64_t n = 0; n != v104; ++n)
        {
          if (*(void *)v154 != v105) {
            objc_enumerationMutation(v102);
          }
          uint64_t v107 = *(void *)(*((void *)&v153 + 1) + 8 * n);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v108 = [GEORPSuggestionList alloc];
            if (a3) {
              uint64_t v109 = [(GEORPSuggestionList *)v108 initWithJSON:v107];
            }
            else {
              uint64_t v109 = [(GEORPSuggestionList *)v108 initWithDictionary:v107];
            }
            v110 = (void *)v109;
            [a1 addAutocompleteSuggestionList:v109];
          }
        }
        uint64_t v104 = [v102 countByEnumeratingWithState:&v153 objects:v176 count:16];
      }
      while (v104);
    }

    id v5 = v148;
  }

  if (a3) {
    v111 = @"currentEnvironmentManifestUrls";
  }
  else {
    v111 = @"current_environment_manifest_urls";
  }
  v112 = [v5 objectForKeyedSubscript:v111];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v113 = [GEORPCurrentEnvironmentManifestURLs alloc];
    if (a3) {
      uint64_t v114 = [(GEORPCurrentEnvironmentManifestURLs *)v113 initWithJSON:v112];
    }
    else {
      uint64_t v114 = [(GEORPCurrentEnvironmentManifestURLs *)v113 initWithDictionary:v112];
    }
    id v115 = (void *)v114;
    [a1 setCurrentEnvironmentManifestUrls:v114];
  }
  if (a3) {
    v116 = @"directionsWaypointPlaceInfo";
  }
  else {
    v116 = @"directions_waypoint_place_info";
  }
  v117 = [v5 objectForKeyedSubscript:v116];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v151 = 0u;
    long long v152 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    id v118 = v117;
    uint64_t v119 = [v118 countByEnumeratingWithState:&v149 objects:v175 count:16];
    if (v119)
    {
      uint64_t v120 = v119;
      uint64_t v121 = *(void *)v150;
      do
      {
        for (iuint64_t i = 0; ii != v120; ++ii)
        {
          if (*(void *)v150 != v121) {
            objc_enumerationMutation(v118);
          }
          uint64_t v123 = *(void *)(*((void *)&v149 + 1) + 8 * ii);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v124 = [GEORPPlaceInfo alloc];
            if (a3) {
              uint64_t v125 = [(GEORPPlaceInfo *)v124 initWithJSON:v123];
            }
            else {
              uint64_t v125 = [(GEORPPlaceInfo *)v124 initWithDictionary:v123];
            }
            v126 = (void *)v125;
            [a1 addDirectionsWaypointPlaceInfo:v125];
          }
        }
        uint64_t v120 = [v118 countByEnumeratingWithState:&v149 objects:v175 count:16];
      }
      while (v120);
    }

    id v5 = v148;
  }

  if (a3) {
    v127 = @"servicesState";
  }
  else {
    v127 = @"services_state";
  }
  v128 = [v5 objectForKeyedSubscript:v127];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v129 = [GEOServicesState alloc];
    if (a3) {
      uint64_t v130 = [(GEOServicesState *)v129 initWithJSON:v128];
    }
    else {
      uint64_t v130 = [(GEOServicesState *)v129 initWithDictionary:v128];
    }
    id v131 = (void *)v130;
    [a1 setServicesState:v130];
  }
  if (a3) {
    v132 = @"personalizedMaps";
  }
  else {
    v132 = @"personalized_maps";
  }
  long long v133 = [v5 objectForKeyedSubscript:v132];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v134 = [GEORPPersonalizedMaps alloc];
    if (a3) {
      uint64_t v135 = [(GEORPPersonalizedMaps *)v134 initWithJSON:v133];
    }
    else {
      uint64_t v135 = [(GEORPPersonalizedMaps *)v134 initWithDictionary:v133];
    }
    long long v136 = (void *)v135;
    [a1 setPersonalizedMaps:v135];
  }
  if (a3) {
    long long v137 = @"navigationSettings";
  }
  else {
    long long v137 = @"navigation_settings";
  }
  long long v138 = [v5 objectForKeyedSubscript:v137];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v139 = [GEORPNavigationSettings alloc];
    if (a3) {
      uint64_t v140 = [(GEORPNavigationSettings *)v139 initWithJSON:v138];
    }
    else {
      uint64_t v140 = [(GEORPNavigationSettings *)v139 initWithDictionary:v138];
    }
    long long v141 = (void *)v140;
    [a1 setNavigationSettings:v140];
  }
  if (a3) {
    long long v142 = @"merchantLookupContext";
  }
  else {
    long long v142 = @"merchant_lookup_context";
  }
  long long v143 = [v5 objectForKeyedSubscript:v142];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v144 = [GEORPMerchantLookupContext alloc];
    if (a3) {
      uint64_t v145 = [(GEORPMerchantLookupContext *)v144 initWithJSON:v143];
    }
    else {
      uint64_t v145 = [(GEORPMerchantLookupContext *)v144 initWithDictionary:v143];
    }
    long long v146 = (void *)v145;
    [a1 setMerchantLookupContext:v145];
  }
  a1 = a1;

LABEL_257:
  return a1;
}

- (GEORPProblemContext)initWithJSON:(id)a3
{
  return (GEORPProblemContext *)-[GEORPProblemContext _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_2411;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_2412;
    }
    GEORPProblemContextReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPProblemContextCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPProblemContextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPProblemContextReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPProblemContextIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v31 = self->_reader;
    objc_sync_enter(v31);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v32 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v32];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v31);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPProblemContext *)self readAll:0];
    $C1B93A348CBC2642A5F7A481C310B991 flags = self->_flags;
    if (*(unsigned char *)&flags)
    {
      uint64_t v57 = 0;
      PBDataWriterPlaceMark();
      PBDataWriterWriteUint64Field();
      PBDataWriterWriteUint64Field();
      PBDataWriterRecallMark();
      $C1B93A348CBC2642A5F7A481C310B991 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 0x10) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_originalPlace) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapLocation) {
      PBDataWriterWriteSubmessage();
    }
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v7 = self->_visibleTileSets;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v53 objects:v63 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v54 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v53 objects:v63 count:16];
      }
      while (v8);
    }

    if (self->_tileStateLog) {
      PBDataWriterWriteStringField();
    }
    if (self->_place) {
      PBDataWriterWriteSubmessage();
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v11 = self->_directionsRequests;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v49 objects:v62 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v50 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v49 objects:v62 count:16];
      }
      while (v12);
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v15 = self->_directionsResponses;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v45 objects:v61 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v46;
      do
      {
        for (uint64_t k = 0; k != v16; ++k)
        {
          if (*(void *)v46 != v17) {
            objc_enumerationMutation(v15);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v45 objects:v61 count:16];
      }
      while (v16);
    }

    if (self->_lastSearchString) {
      PBDataWriterWriteStringField();
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteDoubleField();
    }
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v19 = self->_auxiliaryControls;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v41 objects:v60 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v42;
      do
      {
        for (uint64_t m = 0; m != v20; ++m)
        {
          if (*(void *)v42 != v21) {
            objc_enumerationMutation(v19);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v41 objects:v60 count:16];
      }
      while (v20);
    }

    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_transitLineTileInfo) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_placeInfo) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_lastUserTypedSearchString) {
      PBDataWriterWriteStringField();
    }
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      PBDataWriterWriteSint32Field();
    }
    if (self->_currentAbAssignmentResponse) {
      PBDataWriterWriteSubmessage();
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v23 = self->_autocompleteSuggestionLists;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v37 objects:v59 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v38;
      do
      {
        for (uint64_t n = 0; n != v24; ++n)
        {
          if (*(void *)v38 != v25) {
            objc_enumerationMutation(v23);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v37 objects:v59 count:16];
      }
      while (v24);
    }

    if (self->_currentEnvironmentManifestUrls) {
      PBDataWriterWriteSubmessage();
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v27 = self->_directionsWaypointPlaceInfos;
    uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v33 objects:v58 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v34;
      do
      {
        for (iuint64_t i = 0; ii != v28; ++ii)
        {
          if (*(void *)v34 != v29) {
            objc_enumerationMutation(v27);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v33 objects:v58 count:16];
      }
      while (v28);
    }

    if (self->_servicesState) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_personalizedMaps) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_navigationSettings) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_merchantLookupContext) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  -[GEORPProblemContext _readAutocompleteSuggestionLists]((uint64_t)self);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = self->_autocompleteSuggestionLists;
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
        goto LABEL_38;
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

  -[GEORPProblemContext _readDirectionsRequests]((uint64_t)self);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = self->_directionsRequests;
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
        goto LABEL_38;
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

  -[GEORPProblemContext _readDirectionsResponses]((uint64_t)self);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = self->_directionsResponses;
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
        goto LABEL_38;
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

  -[GEORPProblemContext _readDirectionsWaypointPlaceInfos]((uint64_t)self);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = self->_directionsWaypointPlaceInfos;
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
LABEL_38:

    return 1;
  }
LABEL_33:

  -[GEORPProblemContext _readMapLocation]((uint64_t)self);
  if (![(GEORPMapLocation *)self->_mapLocation hasGreenTeaWithValue:v3])
  {
    -[GEORPProblemContext _readMerchantLookupContext]((uint64_t)self);
    if (![(GEORPMerchantLookupContext *)self->_merchantLookupContext hasGreenTeaWithValue:v3])
    {
      -[GEORPProblemContext _readOriginalPlace]((uint64_t)self);
      if (![(GEOPlace *)self->_originalPlace hasGreenTeaWithValue:v3])
      {
        -[GEORPProblemContext _readPlace]((uint64_t)self);
        if (![(GEOPDPlace *)self->_place hasGreenTeaWithValue:v3])
        {
          -[GEORPProblemContext _readPlaceInfo]((uint64_t)self);
          return [(GEORPPlaceInfo *)self->_placeInfo hasGreenTeaWithValue:v3];
        }
      }
    }
  }
  return 1;
}

- (void)copyTo:(id)a3
{
  long long v31 = (id *)a3;
  [(GEORPProblemContext *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v31 + 1, self->_reader);
  *((_DWORD *)v31 + 52) = self->_readerMarkPos;
  *((_DWORD *)v31 + 53) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  $C1B93A348CBC2642A5F7A481C310B991 flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
    *((_OWORD *)v31 + 1) = self->_sessionId;
    *((_DWORD *)v31 + 57) |= 1u;
    $C1B93A348CBC2642A5F7A481C310B991 flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    *((_DWORD *)v31 + 56) = self->_pinType;
    *((_DWORD *)v31 + 57) |= 0x10u;
  }
  if (self->_originalPlace) {
    objc_msgSend(v31, "setOriginalPlace:");
  }
  if (self->_mapLocation) {
    objc_msgSend(v31, "setMapLocation:");
  }
  if ([(GEORPProblemContext *)self visibleTileSetsCount])
  {
    [v31 clearVisibleTileSets];
    unint64_t v5 = [(GEORPProblemContext *)self visibleTileSetsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEORPProblemContext *)self visibleTileSetAtIndex:i];
        [v31 addVisibleTileSet:v8];
      }
    }
  }
  if (self->_tileStateLog) {
    objc_msgSend(v31, "setTileStateLog:");
  }
  if (self->_place) {
    objc_msgSend(v31, "setPlace:");
  }
  if ([(GEORPProblemContext *)self directionsRequestsCount])
  {
    [v31 clearDirectionsRequests];
    unint64_t v9 = [(GEORPProblemContext *)self directionsRequestsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(GEORPProblemContext *)self directionsRequestAtIndex:j];
        [v31 addDirectionsRequest:v12];
      }
    }
  }
  if ([(GEORPProblemContext *)self directionsResponsesCount])
  {
    [v31 clearDirectionsResponses];
    unint64_t v13 = [(GEORPProblemContext *)self directionsResponsesCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(GEORPProblemContext *)self directionsResponseAtIndex:k];
        [v31 addDirectionsResponse:v16];
      }
    }
  }
  if (self->_lastSearchString) {
    objc_msgSend(v31, "setLastSearchString:");
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    v31[6] = *(id *)&self->_creationDate;
    *((_DWORD *)v31 + 57) |= 2u;
  }
  if ([(GEORPProblemContext *)self auxiliaryControlsCount])
  {
    [v31 clearAuxiliaryControls];
    unint64_t v17 = [(GEORPProblemContext *)self auxiliaryControlsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        uint64_t v20 = [(GEORPProblemContext *)self auxiliaryControlAtIndex:m];
        [v31 addAuxiliaryControl:v20];
      }
    }
  }
  uint64_t v21 = v31;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    v31[18] = self->_originatingAuxiliaryControlIndex;
    *((_DWORD *)v31 + 57) |= 4u;
  }
  if (self->_transitLineTileInfo)
  {
    objc_msgSend(v31, "setTransitLineTileInfo:");
    uint64_t v21 = v31;
  }
  if (self->_placeInfo)
  {
    objc_msgSend(v31, "setPlaceInfo:");
    uint64_t v21 = v31;
  }
  if (self->_lastUserTypedSearchString)
  {
    objc_msgSend(v31, "setLastUserTypedSearchString:");
    uint64_t v21 = v31;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v21 + 55) = self->_deviceGmtOffset;
    *((_DWORD *)v21 + 57) |= 8u;
  }
  if (self->_currentAbAssignmentResponse) {
    objc_msgSend(v31, "setCurrentAbAssignmentResponse:");
  }
  if ([(GEORPProblemContext *)self autocompleteSuggestionListsCount])
  {
    [v31 clearAutocompleteSuggestionLists];
    unint64_t v22 = [(GEORPProblemContext *)self autocompleteSuggestionListsCount];
    if (v22)
    {
      unint64_t v23 = v22;
      for (uint64_t n = 0; n != v23; ++n)
      {
        long long v25 = [(GEORPProblemContext *)self autocompleteSuggestionListAtIndex:n];
        [v31 addAutocompleteSuggestionList:v25];
      }
    }
  }
  if (self->_currentEnvironmentManifestUrls) {
    objc_msgSend(v31, "setCurrentEnvironmentManifestUrls:");
  }
  if ([(GEORPProblemContext *)self directionsWaypointPlaceInfosCount])
  {
    [v31 clearDirectionsWaypointPlaceInfos];
    unint64_t v26 = [(GEORPProblemContext *)self directionsWaypointPlaceInfosCount];
    if (v26)
    {
      unint64_t v27 = v26;
      for (iuint64_t i = 0; ii != v27; ++ii)
      {
        long long v29 = [(GEORPProblemContext *)self directionsWaypointPlaceInfoAtIndex:ii];
        [v31 addDirectionsWaypointPlaceInfo:v29];
      }
    }
  }
  if (self->_servicesState) {
    objc_msgSend(v31, "setServicesState:");
  }
  long long v30 = v31;
  if (self->_personalizedMaps)
  {
    objc_msgSend(v31, "setPersonalizedMaps:");
    long long v30 = v31;
  }
  if (self->_navigationSettings)
  {
    objc_msgSend(v31, "setNavigationSettings:");
    long long v30 = v31;
  }
  if (self->_merchantLookupContext)
  {
    objc_msgSend(v31, "setMerchantLookupContext:");
    long long v30 = v31;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 3) & 2) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPProblemContextReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_58;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPProblemContext *)self readAll:0];
  $C1B93A348CBC2642A5F7A481C310B991 flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
    *(GEOSessionID *)(v5 + 16) = self->_sessionId;
    *(_DWORD *)(v5 + 228) |= 1u;
    $C1B93A348CBC2642A5F7A481C310B991 flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 224) = self->_pinType;
    *(_DWORD *)(v5 + 228) |= 0x10u;
  }
  id v10 = [(GEOPlace *)self->_originalPlace copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v10;

  id v12 = [(GEORPMapLocation *)self->_mapLocation copyWithZone:a3];
  unint64_t v13 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v12;

  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  unint64_t v14 = self->_visibleTileSets;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v88 objects:v97 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v89;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v89 != v16) {
          objc_enumerationMutation(v14);
        }
        unint64_t v18 = (void *)[*(id *)(*((void *)&v88 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addVisibleTileSet:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v88 objects:v97 count:16];
    }
    while (v15);
  }

  uint64_t v19 = [(NSString *)self->_tileStateLog copyWithZone:a3];
  uint64_t v20 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v19;

  id v21 = [(GEOPDPlace *)self->_place copyWithZone:a3];
  unint64_t v22 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v21;

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  unint64_t v23 = self->_directionsRequests;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v84 objects:v96 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v85;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v85 != v25) {
          objc_enumerationMutation(v23);
        }
        unint64_t v27 = (void *)[*(id *)(*((void *)&v84 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addDirectionsRequest:v27];
      }
      uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v84 objects:v96 count:16];
    }
    while (v24);
  }

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v28 = self->_directionsResponses;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v80 objects:v95 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v81;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v81 != v30) {
          objc_enumerationMutation(v28);
        }
        long long v32 = (void *)[*(id *)(*((void *)&v80 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addDirectionsResponse:v32];
      }
      uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v80 objects:v95 count:16];
    }
    while (v29);
  }

  uint64_t v33 = [(NSString *)self->_lastSearchString copyWithZone:a3];
  long long v34 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v33;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(double *)(v5 + 48) = self->_creationDate;
    *(_DWORD *)(v5 + 228) |= 2u;
  }
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v35 = self->_auxiliaryControls;
  uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v76 objects:v94 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v77;
    do
    {
      for (uint64_t m = 0; m != v36; ++m)
      {
        if (*(void *)v77 != v37) {
          objc_enumerationMutation(v35);
        }
        long long v39 = (void *)[*(id *)(*((void *)&v76 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addAuxiliaryControl:v39];
      }
      uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v76 objects:v94 count:16];
    }
    while (v36);
  }

  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(void *)(v5 + 144) = self->_originatingAuxiliaryControlIndex;
    *(_DWORD *)(v5 + 228) |= 4u;
  }
  id v40 = [(GEORPTransitLineTileInfo *)self->_transitLineTileInfo copyWithZone:a3];
  long long v41 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v40;

  id v42 = [(GEORPPlaceInfo *)self->_placeInfo copyWithZone:a3];
  uint64_t v43 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v42;

  uint64_t v44 = [(NSString *)self->_lastUserTypedSearchString copyWithZone:a3];
  long long v45 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v44;

  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 220) = self->_deviceGmtOffset;
    *(_DWORD *)(v5 + 228) |= 8u;
  }
  id v46 = [(GEOABAssignmentResponse *)self->_currentAbAssignmentResponse copyWithZone:a3];
  long long v47 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v46;

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v48 = self->_autocompleteSuggestionLists;
  uint64_t v49 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v72 objects:v93 count:16];
  if (v49)
  {
    uint64_t v50 = *(void *)v73;
    do
    {
      for (uint64_t n = 0; n != v49; ++n)
      {
        if (*(void *)v73 != v50) {
          objc_enumerationMutation(v48);
        }
        long long v52 = (void *)[*(id *)(*((void *)&v72 + 1) + 8 * n) copyWithZone:a3];
        [(id)v5 addAutocompleteSuggestionList:v52];
      }
      uint64_t v49 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v72 objects:v93 count:16];
    }
    while (v49);
  }

  id v53 = [(GEORPCurrentEnvironmentManifestURLs *)self->_currentEnvironmentManifestUrls copyWithZone:a3];
  long long v54 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v53;

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v55 = self->_directionsWaypointPlaceInfos;
  uint64_t v56 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v68 objects:v92 count:16];
  if (v56)
  {
    uint64_t v57 = *(void *)v69;
    do
    {
      for (iuint64_t i = 0; ii != v56; ++ii)
      {
        if (*(void *)v69 != v57) {
          objc_enumerationMutation(v55);
        }
        id v59 = objc_msgSend(*(id *)(*((void *)&v68 + 1) + 8 * ii), "copyWithZone:", a3, (void)v68);
        [(id)v5 addDirectionsWaypointPlaceInfo:v59];
      }
      uint64_t v56 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v68 objects:v92 count:16];
    }
    while (v56);
  }

  id v60 = [(GEOServicesState *)self->_servicesState copyWithZone:a3];
  uint64_t v61 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v60;

  id v62 = [(GEORPPersonalizedMaps *)self->_personalizedMaps copyWithZone:a3];
  v63 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v62;

  id v64 = [(GEORPNavigationSettings *)self->_navigationSettings copyWithZone:a3];
  id v65 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v64;

  id v66 = [(GEORPMerchantLookupContext *)self->_merchantLookupContext copyWithZone:a3];
  id v8 = *(id *)(v5 + 120);
  *(void *)(v5 + 120) = v66;
LABEL_58:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_72;
  }
  [(GEORPProblemContext *)self readAll:1];
  [v4 readAll:1];
  $C1B93A348CBC2642A5F7A481C310B991 flags = self->_flags;
  int v6 = *((_DWORD *)v4 + 57);
  if (*(unsigned char *)&flags)
  {
    if ((v6 & 1) == 0) {
      goto LABEL_72;
    }
    if (self->_sessionId._high != *((void *)v4 + 2) || self->_sessionId._low != *((void *)v4 + 3)) {
      goto LABEL_72;
    }
  }
  else if (v6)
  {
    goto LABEL_72;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_pinType != *((_DWORD *)v4 + 56)) {
      goto LABEL_72;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_72;
  }
  originalPlace = self->_originalPlace;
  if ((unint64_t)originalPlace | *((void *)v4 + 17) && !-[GEOPlace isEqual:](originalPlace, "isEqual:")) {
    goto LABEL_72;
  }
  mapLocatiouint64_t n = self->_mapLocation;
  if ((unint64_t)mapLocation | *((void *)v4 + 14))
  {
    if (!-[GEORPMapLocation isEqual:](mapLocation, "isEqual:")) {
      goto LABEL_72;
    }
  }
  visibleTileSets = self->_visibleTileSets;
  if ((unint64_t)visibleTileSets | *((void *)v4 + 25))
  {
    if (!-[NSMutableArray isEqual:](visibleTileSets, "isEqual:")) {
      goto LABEL_72;
    }
  }
  tileStateLog = self->_tileStateLog;
  if ((unint64_t)tileStateLog | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](tileStateLog, "isEqual:")) {
      goto LABEL_72;
    }
  }
  place = self->_place;
  if ((unint64_t)place | *((void *)v4 + 21))
  {
    if (!-[GEOPDPlace isEqual:](place, "isEqual:")) {
      goto LABEL_72;
    }
  }
  directionsRequests = self->_directionsRequests;
  if ((unint64_t)directionsRequests | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](directionsRequests, "isEqual:")) {
      goto LABEL_72;
    }
  }
  directionsResponses = self->_directionsResponses;
  if ((unint64_t)directionsResponses | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](directionsResponses, "isEqual:")) {
      goto LABEL_72;
    }
  }
  lastSearchString = self->_lastSearchString;
  if ((unint64_t)lastSearchString | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](lastSearchString, "isEqual:")) {
      goto LABEL_72;
    }
  }
  $C1B93A348CBC2642A5F7A481C310B991 v16 = self->_flags;
  int v17 = *((_DWORD *)v4 + 57);
  if ((*(unsigned char *)&v16 & 2) != 0)
  {
    if ((v17 & 2) == 0 || self->_creationDate != *((double *)v4 + 6)) {
      goto LABEL_72;
    }
  }
  else if ((v17 & 2) != 0)
  {
    goto LABEL_72;
  }
  auxiliaryControls = self->_auxiliaryControls;
  if ((unint64_t)auxiliaryControls | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](auxiliaryControls, "isEqual:"))
    {
LABEL_72:
      char v31 = 0;
      goto LABEL_73;
    }
    $C1B93A348CBC2642A5F7A481C310B991 v16 = self->_flags;
    int v17 = *((_DWORD *)v4 + 57);
  }
  if ((*(unsigned char *)&v16 & 4) != 0)
  {
    if ((v17 & 4) == 0 || self->_originatingAuxiliaryControlIndex != *((void *)v4 + 18)) {
      goto LABEL_72;
    }
  }
  else if ((v17 & 4) != 0)
  {
    goto LABEL_72;
  }
  transitLineTileInfo = self->_transitLineTileInfo;
  if ((unint64_t)transitLineTileInfo | *((void *)v4 + 24)
    && !-[GEORPTransitLineTileInfo isEqual:](transitLineTileInfo, "isEqual:"))
  {
    goto LABEL_72;
  }
  placeInfo = self->_placeInfo;
  if ((unint64_t)placeInfo | *((void *)v4 + 20))
  {
    if (!-[GEORPPlaceInfo isEqual:](placeInfo, "isEqual:")) {
      goto LABEL_72;
    }
  }
  lastUserTypedSearchString = self->_lastUserTypedSearchString;
  if ((unint64_t)lastUserTypedSearchString | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](lastUserTypedSearchString, "isEqual:")) {
      goto LABEL_72;
    }
  }
  int v22 = *((_DWORD *)v4 + 57);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((v22 & 8) == 0 || self->_deviceGmtOffset != *((_DWORD *)v4 + 55)) {
      goto LABEL_72;
    }
  }
  else if ((v22 & 8) != 0)
  {
    goto LABEL_72;
  }
  currentAbAssignmentResponse = self->_currentAbAssignmentResponse;
  if ((unint64_t)currentAbAssignmentResponse | *((void *)v4 + 7)
    && !-[GEOABAssignmentResponse isEqual:](currentAbAssignmentResponse, "isEqual:"))
  {
    goto LABEL_72;
  }
  autocompleteSuggestionLists = self->_autocompleteSuggestionLists;
  if ((unint64_t)autocompleteSuggestionLists | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](autocompleteSuggestionLists, "isEqual:")) {
      goto LABEL_72;
    }
  }
  currentEnvironmentManifestUrls = self->_currentEnvironmentManifestUrls;
  if ((unint64_t)currentEnvironmentManifestUrls | *((void *)v4 + 8))
  {
    if (!-[GEORPCurrentEnvironmentManifestURLs isEqual:](currentEnvironmentManifestUrls, "isEqual:")) {
      goto LABEL_72;
    }
  }
  directionsWaypointPlaceInfos = self->_directionsWaypointPlaceInfos;
  if ((unint64_t)directionsWaypointPlaceInfos | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](directionsWaypointPlaceInfos, "isEqual:")) {
      goto LABEL_72;
    }
  }
  servicesState = self->_servicesState;
  if ((unint64_t)servicesState | *((void *)v4 + 22))
  {
    if (!-[GEOServicesState isEqual:](servicesState, "isEqual:")) {
      goto LABEL_72;
    }
  }
  personalizedMaps = self->_personalizedMaps;
  if ((unint64_t)personalizedMaps | *((void *)v4 + 19))
  {
    if (!-[GEORPPersonalizedMaps isEqual:](personalizedMaps, "isEqual:")) {
      goto LABEL_72;
    }
  }
  navigationSettings = self->_navigationSettings;
  if ((unint64_t)navigationSettings | *((void *)v4 + 16))
  {
    if (!-[GEORPNavigationSettings isEqual:](navigationSettings, "isEqual:")) {
      goto LABEL_72;
    }
  }
  merchantLookupContext = self->_merchantLookupContext;
  if ((unint64_t)merchantLookupContext | *((void *)v4 + 15)) {
    char v31 = -[GEORPMerchantLookupContext isEqual:](merchantLookupContext, "isEqual:");
  }
  else {
    char v31 = 1;
  }
LABEL_73:

  return v31;
}

- (unint64_t)hash
{
  [(GEORPProblemContext *)self readAll:1];
  $C1B93A348CBC2642A5F7A481C310B991 flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
    uint64_t v37 = PBHashBytes();
    $C1B93A348CBC2642A5F7A481C310B991 flags = self->_flags;
  }
  else
  {
    uint64_t v37 = 0;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0) {
    uint64_t v36 = 2654435761 * self->_pinType;
  }
  else {
    uint64_t v36 = 0;
  }
  unint64_t v35 = [(GEOPlace *)self->_originalPlace hash];
  unint64_t v34 = [(GEORPMapLocation *)self->_mapLocation hash];
  uint64_t v33 = [(NSMutableArray *)self->_visibleTileSets hash];
  NSUInteger v32 = [(NSString *)self->_tileStateLog hash];
  unint64_t v31 = [(GEOPDPlace *)self->_place hash];
  uint64_t v30 = [(NSMutableArray *)self->_directionsRequests hash];
  uint64_t v29 = [(NSMutableArray *)self->_directionsResponses hash];
  NSUInteger v4 = [(NSString *)self->_lastSearchString hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    double creationDate = self->_creationDate;
    double v7 = -creationDate;
    if (creationDate >= 0.0) {
      double v7 = self->_creationDate;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    double v10 = fmod(v8, 1.84467441e19);
    unint64_t v11 = 2654435761u * (unint64_t)v10;
    unint64_t v12 = v11 + (unint64_t)v9;
    if (v9 <= 0.0) {
      unint64_t v12 = 2654435761u * (unint64_t)v10;
    }
    unint64_t v13 = v11 - (unint64_t)fabs(v9);
    if (v9 < 0.0) {
      unint64_t v5 = v13;
    }
    else {
      unint64_t v5 = v12;
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  uint64_t v14 = [(NSMutableArray *)self->_auxiliaryControls hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    unint64_t v15 = 2654435761u * self->_originatingAuxiliaryControlIndex;
  }
  else {
    unint64_t v15 = 0;
  }
  unint64_t v16 = [(GEORPTransitLineTileInfo *)self->_transitLineTileInfo hash];
  unint64_t v17 = [(GEORPPlaceInfo *)self->_placeInfo hash];
  NSUInteger v18 = [(NSString *)self->_lastUserTypedSearchString hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    uint64_t v19 = 2654435761 * self->_deviceGmtOffset;
  }
  else {
    uint64_t v19 = 0;
  }
  unint64_t v20 = v36 ^ v37 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v4 ^ v5 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  unint64_t v21 = [(GEOABAssignmentResponse *)self->_currentAbAssignmentResponse hash];
  uint64_t v22 = v21 ^ [(NSMutableArray *)self->_autocompleteSuggestionLists hash];
  unint64_t v23 = v22 ^ [(GEORPCurrentEnvironmentManifestURLs *)self->_currentEnvironmentManifestUrls hash];
  uint64_t v24 = v23 ^ [(NSMutableArray *)self->_directionsWaypointPlaceInfos hash];
  unint64_t v25 = v24 ^ [(GEOServicesState *)self->_servicesState hash];
  unint64_t v26 = v20 ^ v25 ^ [(GEORPPersonalizedMaps *)self->_personalizedMaps hash];
  unint64_t v27 = [(GEORPNavigationSettings *)self->_navigationSettings hash];
  return v26 ^ v27 ^ [(GEORPMerchantLookupContext *)self->_merchantLookupContext hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  int v5 = *((_DWORD *)v4 + 57);
  if (v5)
  {
    self->_sessionId = (GEOSessionID)*((_OWORD *)v4 + 1);
    *(_DWORD *)&self->_flags |= 1u;
    int v5 = *((_DWORD *)v4 + 57);
  }
  if ((v5 & 0x10) != 0)
  {
    self->_pinType = *((_DWORD *)v4 + 56);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
  originalPlace = self->_originalPlace;
  uint64_t v7 = *((void *)v4 + 17);
  if (originalPlace)
  {
    if (v7) {
      -[GEOPlace mergeFrom:](originalPlace, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEORPProblemContext setOriginalPlace:](self, "setOriginalPlace:");
  }
  mapLocatiouint64_t n = self->_mapLocation;
  uint64_t v9 = *((void *)v4 + 14);
  if (mapLocation)
  {
    if (v9) {
      -[GEORPMapLocation mergeFrom:](mapLocation, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEORPProblemContext setMapLocation:](self, "setMapLocation:");
  }
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v10 = *((id *)v4 + 25);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v78 objects:v87 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v79 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEORPProblemContext *)self addVisibleTileSet:*(void *)(*((void *)&v78 + 1) + 8 * i)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v78 objects:v87 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 23)) {
    -[GEORPProblemContext setTileStateLog:](self, "setTileStateLog:");
  }
  place = self->_place;
  uint64_t v16 = *((void *)v4 + 21);
  if (place)
  {
    if (v16) {
      -[GEOPDPlace mergeFrom:](place, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[GEORPProblemContext setPlace:](self, "setPlace:");
  }
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v17 = *((id *)v4 + 9);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v74 objects:v86 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v75;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v75 != v20) {
          objc_enumerationMutation(v17);
        }
        [(GEORPProblemContext *)self addDirectionsRequest:*(void *)(*((void *)&v74 + 1) + 8 * j)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v74 objects:v86 count:16];
    }
    while (v19);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v22 = *((id *)v4 + 10);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v70 objects:v85 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v71;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v71 != v25) {
          objc_enumerationMutation(v22);
        }
        [(GEORPProblemContext *)self addDirectionsResponse:*(void *)(*((void *)&v70 + 1) + 8 * k)];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v70 objects:v85 count:16];
    }
    while (v24);
  }

  if (*((void *)v4 + 12)) {
    -[GEORPProblemContext setLastSearchString:](self, "setLastSearchString:");
  }
  if ((*((unsigned char *)v4 + 228) & 2) != 0)
  {
    self->_double creationDate = *((double *)v4 + 6);
    *(_DWORD *)&self->_flags |= 2u;
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v27 = *((id *)v4 + 5);
  uint64_t v28 = [v27 countByEnumeratingWithState:&v66 objects:v84 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v67;
    do
    {
      for (uint64_t m = 0; m != v29; ++m)
      {
        if (*(void *)v67 != v30) {
          objc_enumerationMutation(v27);
        }
        [(GEORPProblemContext *)self addAuxiliaryControl:*(void *)(*((void *)&v66 + 1) + 8 * m)];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v66 objects:v84 count:16];
    }
    while (v29);
  }

  if ((*((unsigned char *)v4 + 228) & 4) != 0)
  {
    self->_originatingAuxiliaryControlIndex = *((void *)v4 + 18);
    *(_DWORD *)&self->_flags |= 4u;
  }
  transitLineTileInfo = self->_transitLineTileInfo;
  uint64_t v33 = *((void *)v4 + 24);
  if (transitLineTileInfo)
  {
    if (v33) {
      -[GEORPTransitLineTileInfo mergeFrom:](transitLineTileInfo, "mergeFrom:");
    }
  }
  else if (v33)
  {
    -[GEORPProblemContext setTransitLineTileInfo:](self, "setTransitLineTileInfo:");
  }
  placeInfo = self->_placeInfo;
  uint64_t v35 = *((void *)v4 + 20);
  if (placeInfo)
  {
    if (v35) {
      -[GEORPPlaceInfo mergeFrom:](placeInfo, "mergeFrom:");
    }
  }
  else if (v35)
  {
    -[GEORPProblemContext setPlaceInfo:](self, "setPlaceInfo:");
  }
  if (*((void *)v4 + 13)) {
    -[GEORPProblemContext setLastUserTypedSearchString:](self, "setLastUserTypedSearchString:");
  }
  if ((*((unsigned char *)v4 + 228) & 8) != 0)
  {
    self->_deviceGmtOffset = *((_DWORD *)v4 + 55);
    *(_DWORD *)&self->_flags |= 8u;
  }
  currentAbAssignmentResponse = self->_currentAbAssignmentResponse;
  uint64_t v37 = *((void *)v4 + 7);
  if (currentAbAssignmentResponse)
  {
    if (v37) {
      -[GEOABAssignmentResponse mergeFrom:](currentAbAssignmentResponse, "mergeFrom:");
    }
  }
  else if (v37)
  {
    -[GEORPProblemContext setCurrentAbAssignmentResponse:](self, "setCurrentAbAssignmentResponse:");
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v38 = *((id *)v4 + 4);
  uint64_t v39 = [v38 countByEnumeratingWithState:&v62 objects:v83 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v63;
    do
    {
      for (uint64_t n = 0; n != v40; ++n)
      {
        if (*(void *)v63 != v41) {
          objc_enumerationMutation(v38);
        }
        [(GEORPProblemContext *)self addAutocompleteSuggestionList:*(void *)(*((void *)&v62 + 1) + 8 * n)];
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v62 objects:v83 count:16];
    }
    while (v40);
  }

  currentEnvironmentManifestUrls = self->_currentEnvironmentManifestUrls;
  uint64_t v44 = *((void *)v4 + 8);
  if (currentEnvironmentManifestUrls)
  {
    if (v44) {
      -[GEORPCurrentEnvironmentManifestURLs mergeFrom:](currentEnvironmentManifestUrls, "mergeFrom:");
    }
  }
  else if (v44)
  {
    -[GEORPProblemContext setCurrentEnvironmentManifestUrls:](self, "setCurrentEnvironmentManifestUrls:");
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v45 = *((id *)v4 + 11);
  uint64_t v46 = [v45 countByEnumeratingWithState:&v58 objects:v82 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v59;
    do
    {
      for (iuint64_t i = 0; ii != v47; ++ii)
      {
        if (*(void *)v59 != v48) {
          objc_enumerationMutation(v45);
        }
        -[GEORPProblemContext addDirectionsWaypointPlaceInfo:](self, "addDirectionsWaypointPlaceInfo:", *(void *)(*((void *)&v58 + 1) + 8 * ii), (void)v58);
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v58 objects:v82 count:16];
    }
    while (v47);
  }

  servicesState = self->_servicesState;
  uint64_t v51 = *((void *)v4 + 22);
  if (servicesState)
  {
    if (v51) {
      -[GEOServicesState mergeFrom:](servicesState, "mergeFrom:");
    }
  }
  else if (v51)
  {
    -[GEORPProblemContext setServicesState:](self, "setServicesState:");
  }
  personalizedMaps = self->_personalizedMaps;
  uint64_t v53 = *((void *)v4 + 19);
  if (personalizedMaps)
  {
    if (v53) {
      -[GEORPPersonalizedMaps mergeFrom:](personalizedMaps, "mergeFrom:");
    }
  }
  else if (v53)
  {
    -[GEORPProblemContext setPersonalizedMaps:](self, "setPersonalizedMaps:");
  }
  navigationSettings = self->_navigationSettings;
  uint64_t v55 = *((void *)v4 + 16);
  if (navigationSettings)
  {
    if (v55) {
      -[GEORPNavigationSettings mergeFrom:](navigationSettings, "mergeFrom:");
    }
  }
  else if (v55)
  {
    -[GEORPProblemContext setNavigationSettings:](self, "setNavigationSettings:");
  }
  merchantLookupContext = self->_merchantLookupContext;
  uint64_t v57 = *((void *)v4 + 15);
  if (merchantLookupContext)
  {
    if (v57) {
      -[GEORPMerchantLookupContext mergeFrom:](merchantLookupContext, "mergeFrom:");
    }
  }
  else if (v57)
  {
    -[GEORPProblemContext setMerchantLookupContext:](self, "setMerchantLookupContext:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleTileSets, 0);
  objc_storeStrong((id *)&self->_transitLineTileInfo, 0);
  objc_storeStrong((id *)&self->_tileStateLog, 0);
  objc_storeStrong((id *)&self->_servicesState, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_placeInfo, 0);
  objc_storeStrong((id *)&self->_personalizedMaps, 0);
  objc_storeStrong((id *)&self->_originalPlace, 0);
  objc_storeStrong((id *)&self->_navigationSettings, 0);
  objc_storeStrong((id *)&self->_merchantLookupContext, 0);
  objc_storeStrong((id *)&self->_mapLocation, 0);
  objc_storeStrong((id *)&self->_lastUserTypedSearchString, 0);
  objc_storeStrong((id *)&self->_lastSearchString, 0);
  objc_storeStrong((id *)&self->_directionsWaypointPlaceInfos, 0);
  objc_storeStrong((id *)&self->_directionsResponses, 0);
  objc_storeStrong((id *)&self->_directionsRequests, 0);
  objc_storeStrong((id *)&self->_currentEnvironmentManifestUrls, 0);
  objc_storeStrong((id *)&self->_currentAbAssignmentResponse, 0);
  objc_storeStrong((id *)&self->_auxiliaryControls, 0);
  objc_storeStrong((id *)&self->_autocompleteSuggestionLists, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end