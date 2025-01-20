@interface GEORPFeedbackCommonContext
+ (BOOL)isValid:(id)a3;
+ (Class)auxiliaryControlType;
+ (Class)visibleTileSetType;
- (BOOL)hasClientCreatedAt;
- (BOOL)hasCombinedUserPath;
- (BOOL)hasCurrentAbAssignmentResponse;
- (BOOL)hasCurrentEnvironmentManifestUrls;
- (BOOL)hasDeviceGmtOffset;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIsSprMap;
- (BOOL)hasMapLocation;
- (BOOL)hasNavigationSettings;
- (BOOL)hasOriginatingAuxiliaryControlIndex;
- (BOOL)hasPinType;
- (BOOL)hasSearchCommon;
- (BOOL)hasSourceInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSprMap;
- (BOOL)readFrom:(id)a3;
- (GEOABAssignmentResponse)currentAbAssignmentResponse;
- (GEORPCurrentEnvironmentManifestURLs)currentEnvironmentManifestUrls;
- (GEORPFeedbackCommonContext)init;
- (GEORPFeedbackCommonContext)initWithData:(id)a3;
- (GEORPFeedbackCommonContext)initWithDictionary:(id)a3;
- (GEORPFeedbackCommonContext)initWithJSON:(id)a3;
- (GEORPMapLocation)mapLocation;
- (GEORPNavigationSettings)navigationSettings;
- (GEORPSearchCommonContext)searchCommon;
- (GEORPSourceInfo)sourceInfo;
- (GEORPUserPath)combinedUserPath;
- (NSMutableArray)auxiliaryControls;
- (NSMutableArray)visibleTileSets;
- (PBUnknownFields)unknownFields;
- (double)clientCreatedAt;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)auxiliaryControlAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)pinTypeAsString:(int)a3;
- (id)userPathsAsString:(int)a3;
- (id)visibleTileSetAtIndex:(unint64_t)a3;
- (int)StringAsPinType:(id)a3;
- (int)StringAsUserPaths:(id)a3;
- (int)deviceGmtOffset;
- (int)pinType;
- (int)userPathAtIndex:(unint64_t)a3;
- (int)userPaths;
- (unint64_t)auxiliaryControlsCount;
- (unint64_t)hash;
- (unint64_t)originatingAuxiliaryControlIndex;
- (unint64_t)userPathsCount;
- (unint64_t)visibleTileSetsCount;
- (void)_addNoFlagsAuxiliaryControl:(uint64_t)a1;
- (void)_addNoFlagsVisibleTileSet:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAuxiliaryControls;
- (void)_readCombinedUserPath;
- (void)_readCurrentAbAssignmentResponse;
- (void)_readCurrentEnvironmentManifestUrls;
- (void)_readMapLocation;
- (void)_readNavigationSettings;
- (void)_readSearchCommon;
- (void)_readSourceInfo;
- (void)_readUserPaths;
- (void)_readVisibleTileSets;
- (void)_recordCurrentEnvironment:(id)a3;
- (void)_recordManifestURLs:(id)a3;
- (void)addAuxiliaryControl:(id)a3;
- (void)addUserPath:(int)a3;
- (void)addVisibleTileSet:(id)a3;
- (void)clearAuxiliaryControls;
- (void)clearUnknownFields:(BOOL)a3;
- (void)clearUserPaths;
- (void)clearVisibleTileSets;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)recordEnvironmentAndManifestURLs;
- (void)setAuxiliaryControls:(id)a3;
- (void)setClientCreatedAt:(double)a3;
- (void)setCombinedUserPath:(id)a3;
- (void)setCurrentAbAssignmentResponse:(id)a3;
- (void)setCurrentEnvironmentManifestUrls:(id)a3;
- (void)setDeviceGmtOffset:(int)a3;
- (void)setHasClientCreatedAt:(BOOL)a3;
- (void)setHasDeviceGmtOffset:(BOOL)a3;
- (void)setHasIsSprMap:(BOOL)a3;
- (void)setHasOriginatingAuxiliaryControlIndex:(BOOL)a3;
- (void)setHasPinType:(BOOL)a3;
- (void)setIsSprMap:(BOOL)a3;
- (void)setMapLocation:(id)a3;
- (void)setNavigationSettings:(id)a3;
- (void)setOriginatingAuxiliaryControlIndex:(unint64_t)a3;
- (void)setPinType:(int)a3;
- (void)setSearchCommon:(id)a3;
- (void)setSourceInfo:(id)a3;
- (void)setUserPaths:(int *)a3 count:(unint64_t)a4;
- (void)setVisibleTileSets:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackCommonContext

- (GEORPFeedbackCommonContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackCommonContext;
  v2 = [(GEORPFeedbackCommonContext *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackCommonContext)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackCommonContext;
  v3 = [(GEORPFeedbackCommonContext *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEORPFeedbackCommonContext;
  [(GEORPFeedbackCommonContext *)&v3 dealloc];
}

- (int)pinType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $B40C2BF14A359B44A88B8C46D0584055 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 8) != 0) {
    return self->_pinType;
  }
  else {
    return -1;
  }
}

- (void)setPinType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10008u;
  self->_pinType = a3;
}

- (void)setHasPinType:(BOOL)a3
{
  if (a3) {
    int v3 = 65544;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$B40C2BF14A359B44A88B8C46D0584055 flags = ($B40C2BF14A359B44A88B8C46D0584055)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasPinType
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
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
    int v3 = off_1E53DB920[a3 + 1];
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

- (void)_readMapLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 161) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackCommonContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapLocation_tags_980);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMapLocation
{
  return self->_mapLocation != 0;
}

- (GEORPMapLocation)mapLocation
{
  -[GEORPFeedbackCommonContext _readMapLocation]((uint64_t)self);
  mapLocation = self->_mapLocation;

  return mapLocation;
}

- (void)setMapLocation:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10800u;
  objc_storeStrong((id *)&self->_mapLocation, a3);
}

- (void)_readVisibleTileSets
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 161) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackCommonContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVisibleTileSets_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (NSMutableArray)visibleTileSets
{
  -[GEORPFeedbackCommonContext _readVisibleTileSets]((uint64_t)self);
  visibleTileSets = self->_visibleTileSets;

  return visibleTileSets;
}

- (void)setVisibleTileSets:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  visibleTileSets = self->_visibleTileSets;
  self->_visibleTileSets = v4;
}

- (void)clearVisibleTileSets
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  visibleTileSets = self->_visibleTileSets;

  [(NSMutableArray *)visibleTileSets removeAllObjects];
}

- (void)addVisibleTileSet:(id)a3
{
  id v4 = a3;
  -[GEORPFeedbackCommonContext _readVisibleTileSets]((uint64_t)self);
  -[GEORPFeedbackCommonContext _addNoFlagsVisibleTileSet:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_addNoFlagsVisibleTileSet:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 128);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = v5;

      id v4 = *(void **)(a1 + 128);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)visibleTileSetsCount
{
  -[GEORPFeedbackCommonContext _readVisibleTileSets]((uint64_t)self);
  visibleTileSets = self->_visibleTileSets;

  return [(NSMutableArray *)visibleTileSets count];
}

- (id)visibleTileSetAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackCommonContext _readVisibleTileSets]((uint64_t)self);
  visibleTileSets = self->_visibleTileSets;

  return (id)[(NSMutableArray *)visibleTileSets objectAtIndex:a3];
}

+ (Class)visibleTileSetType
{
  return (Class)objc_opt_class();
}

- (void)_readUserPaths
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 160) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackCommonContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserPaths_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (unint64_t)userPathsCount
{
  return self->_userPaths.count;
}

- (int)userPaths
{
  return self->_userPaths.list;
}

- (void)clearUserPaths
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;

  PBRepeatedInt32Clear();
}

- (void)addUserPath:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (int)userPathAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackCommonContext _readUserPaths]((uint64_t)self);
  p_userPaths = &self->_userPaths;
  unint64_t count = self->_userPaths.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_userPaths->list[a3];
}

- (void)setUserPaths:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;

  MEMORY[0x1F4147390](&self->_userPaths, a3, a4);
}

- (id)userPathsAsString:(int)a3
{
  if a3 < 0x3D && ((0x1FFFFF03FFFFFFFFuLL >> a3))
  {
    id v3 = off_1E53DB978[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (int)StringAsUserPaths:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"USER_PATH_ITEM_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PLACE_PROBLEM"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MAP_PROBLEM"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ADDRESS_EDIT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ADDRESS_EDIT_LABEL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LOCATION_PICKER_CORRECT_COORDINATE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"LOCATION_PICKER_CHOOSE_FEATURE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"LOCATION_PICKER_CHOOSE_COORDINATE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"LOCATION_PICKER_CHOOSE_REGION"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"LOCATION_CLOSED"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"COMMENTS_AND_PHOTO"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SEARCH_RESULTS"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SATELLITE_IMAGE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"TRAFFIC"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_STEPS"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"GUIDANCE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"ROUTE_PLANNING"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_ROUTE_PICKER"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"TRANSIT_MAP_PROBLEM"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"TRANSIT_DIRECTIONS_PROBLEM"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"TRANSIT_STATION_PROBLEM"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"TRANSIT_TRANSFER_PICKER"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"TRANSIT_LINE_PICKER"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"TRANSIT_LINE_DISPLAY_PROBLEM"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"TRANSIT_STATION_PICKER"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"TRANSIT_LINE_SERVICE_CHANGE"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"TRANSIT_LINE_SCHEDULES"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"TRANSIT_BAD_ROUTE_SUGGESTIONS"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"TRANSIT_ACCESS_POINT"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"TRANSIT_SUBCATEGORY_PICKER"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"LOCATION_PICKER_CHOOSE_CORRECTABLE_LOCATION"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"LOCATION_ADD"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"IM_LOST"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"SEARCH_AUTOCOMPLETE"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"TRANSIT_LINE_NAME_INCORRECT"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"TRANSIT_LINE_SHAPE_INCORRECT"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"BAD_DIRECTIONS_INCORRECT_INSTRUCTIONS"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"BAD_DIRECTIONS_ROUTE_WRONG"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"BAD_DIRECTIONS_INCORRECT_ETA"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"BAD_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"TRANSIT_ACCESS_POINT_PICKER"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"PERSONALIZED_MAP_CORRECTION"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"WHICH_PERSONALIZED_MAP_ADDRESS"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"PERSONALIZED_MAP_PLACE_PROBLEM"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"ADD_A_PLACE_TYPE_SELECTION"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"LOCATION_PICKER_CHOOSE_COORDINATE_WITH_NAME"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"PLACE_CATEGORY_SELECTION"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"TAKE_PHOTO"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"BRAND_PROBLEM"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"BRAND_CORRECTIONS"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"ADDRESS_INFO"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"ADDRESS_SEARCH"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTION_PROBLEM"])
  {
    int v4 = 60;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (double)clientCreatedAt
{
  return self->_clientCreatedAt;
}

- (void)setClientCreatedAt:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x10001u;
  self->_clientCreatedAt = a3;
}

- (void)setHasClientCreatedAt:(BOOL)a3
{
  self->_$B40C2BF14A359B44A88B8C46D0584055 flags = ($B40C2BF14A359B44A88B8C46D0584055)(*(_DWORD *)&self->_flags & 0xFFFEFFFE | a3 | 0x10000);
}

- (BOOL)hasClientCreatedAt
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readAuxiliaryControls
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 160) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackCommonContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAuxiliaryControls_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (NSMutableArray)auxiliaryControls
{
  -[GEORPFeedbackCommonContext _readAuxiliaryControls]((uint64_t)self);
  auxiliaryControls = self->_auxiliaryControls;

  return auxiliaryControls;
}

- (void)setAuxiliaryControls:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  auxiliaryControls = self->_auxiliaryControls;
  self->_auxiliaryControls = v4;
}

- (void)clearAuxiliaryControls
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  auxiliaryControls = self->_auxiliaryControls;

  [(NSMutableArray *)auxiliaryControls removeAllObjects];
}

- (void)addAuxiliaryControl:(id)a3
{
  id v4 = a3;
  -[GEORPFeedbackCommonContext _readAuxiliaryControls]((uint64_t)self);
  -[GEORPFeedbackCommonContext _addNoFlagsAuxiliaryControl:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_addNoFlagsAuxiliaryControl:(uint64_t)a1
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

- (unint64_t)auxiliaryControlsCount
{
  -[GEORPFeedbackCommonContext _readAuxiliaryControls]((uint64_t)self);
  auxiliaryControls = self->_auxiliaryControls;

  return [(NSMutableArray *)auxiliaryControls count];
}

- (id)auxiliaryControlAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackCommonContext _readAuxiliaryControls]((uint64_t)self);
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
  *(_DWORD *)&self->_flags |= 0x10002u;
  self->_originatingAuxiliaryControlIndex = a3;
}

- (void)setHasOriginatingAuxiliaryControlIndex:(BOOL)a3
{
  if (a3) {
    int v3 = 65538;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$B40C2BF14A359B44A88B8C46D0584055 flags = ($B40C2BF14A359B44A88B8C46D0584055)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasOriginatingAuxiliaryControlIndex
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int)deviceGmtOffset
{
  return self->_deviceGmtOffset;
}

- (void)setDeviceGmtOffset:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10004u;
  self->_deviceGmtOffset = a3;
}

- (void)setHasDeviceGmtOffset:(BOOL)a3
{
  if (a3) {
    int v3 = 65540;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$B40C2BF14A359B44A88B8C46D0584055 flags = ($B40C2BF14A359B44A88B8C46D0584055)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasDeviceGmtOffset
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readCurrentEnvironmentManifestUrls
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 161) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackCommonContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCurrentEnvironmentManifestUrls_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasCurrentEnvironmentManifestUrls
{
  return self->_currentEnvironmentManifestUrls != 0;
}

- (GEORPCurrentEnvironmentManifestURLs)currentEnvironmentManifestUrls
{
  -[GEORPFeedbackCommonContext _readCurrentEnvironmentManifestUrls]((uint64_t)self);
  currentEnvironmentManifestUrls = self->_currentEnvironmentManifestUrls;

  return currentEnvironmentManifestUrls;
}

- (void)setCurrentEnvironmentManifestUrls:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10400u;
  objc_storeStrong((id *)&self->_currentEnvironmentManifestUrls, a3);
}

- (void)_readNavigationSettings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 161) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackCommonContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNavigationSettings_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasNavigationSettings
{
  return self->_navigationSettings != 0;
}

- (GEORPNavigationSettings)navigationSettings
{
  -[GEORPFeedbackCommonContext _readNavigationSettings]((uint64_t)self);
  navigationSettings = self->_navigationSettings;

  return navigationSettings;
}

- (void)setNavigationSettings:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x11000u;
  objc_storeStrong((id *)&self->_navigationSettings, a3);
}

- (void)_readSourceInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 161) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackCommonContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSourceInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasSourceInfo
{
  return self->_sourceInfo != 0;
}

- (GEORPSourceInfo)sourceInfo
{
  -[GEORPFeedbackCommonContext _readSourceInfo]((uint64_t)self);
  sourceInfo = self->_sourceInfo;

  return sourceInfo;
}

- (void)setSourceInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x14000u;
  objc_storeStrong((id *)&self->_sourceInfo, a3);
}

- (void)_readSearchCommon
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 161) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackCommonContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchCommon_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasSearchCommon
{
  return self->_searchCommon != 0;
}

- (GEORPSearchCommonContext)searchCommon
{
  -[GEORPFeedbackCommonContext _readSearchCommon]((uint64_t)self);
  searchCommon = self->_searchCommon;

  return searchCommon;
}

- (void)setSearchCommon:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x12000u;
  objc_storeStrong((id *)&self->_searchCommon, a3);
}

- (void)_readCurrentAbAssignmentResponse
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 161) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackCommonContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCurrentAbAssignmentResponse_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasCurrentAbAssignmentResponse
{
  return self->_currentAbAssignmentResponse != 0;
}

- (GEOABAssignmentResponse)currentAbAssignmentResponse
{
  -[GEORPFeedbackCommonContext _readCurrentAbAssignmentResponse]((uint64_t)self);
  currentAbAssignmentResponse = self->_currentAbAssignmentResponse;

  return currentAbAssignmentResponse;
}

- (void)setCurrentAbAssignmentResponse:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10200u;
  objc_storeStrong((id *)&self->_currentAbAssignmentResponse, a3);
}

- (BOOL)isSprMap
{
  return self->_isSprMap;
}

- (void)setIsSprMap:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10010u;
  self->_isSprMap = a3;
}

- (void)setHasIsSprMap:(BOOL)a3
{
  if (a3) {
    int v3 = 65552;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$B40C2BF14A359B44A88B8C46D0584055 flags = ($B40C2BF14A359B44A88B8C46D0584055)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasIsSprMap
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (void)_readCombinedUserPath
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 161) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackCommonContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCombinedUserPath_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasCombinedUserPath
{
  return self->_combinedUserPath != 0;
}

- (GEORPUserPath)combinedUserPath
{
  -[GEORPFeedbackCommonContext _readCombinedUserPath]((uint64_t)self);
  combinedUserPath = self->_combinedUserPath;

  return combinedUserPath;
}

- (void)setCombinedUserPath:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10100u;
  objc_storeStrong((id *)&self->_combinedUserPath, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackCommonContext;
  id v4 = [(GEORPFeedbackCommonContext *)&v8 description];
  id v5 = [(GEORPFeedbackCommonContext *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackCommonContext _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 160) & 8) != 0)
    {
      unsigned int v5 = *(_DWORD *)(a1 + 152) + 1;
      if (v5 >= 0xB)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 152));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53DB920[v5];
      }
      if (a2) {
        id v7 = @"pinType";
      }
      else {
        id v7 = @"pin_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = [(id)a1 mapLocation];
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 jsonRepresentation];
        v11 = @"mapLocation";
      }
      else
      {
        v10 = [v8 dictionaryRepresentation];
        v11 = @"map_location";
      }
      [v4 setObject:v10 forKey:v11];
    }
    if ([*(id *)(a1 + 128) count])
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 128), "count"));
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      id v13 = *(id *)(a1 + 128);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v82 objects:v87 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v83;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v83 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v82 + 1) + 8 * i);
            if (a2) {
              [v18 jsonRepresentation];
            }
            else {
            v19 = [v18 dictionaryRepresentation];
            }
            [v12 addObject:v19];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v82 objects:v87 count:16];
        }
        while (v15);
      }

      if (a2) {
        v20 = @"visibleTileSet";
      }
      else {
        v20 = @"visible_tile_set";
      }
      [v4 setObject:v12 forKey:v20];
    }
    if (*(void *)(a1 + 32))
    {
      v21 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v22 = (void *)(a1 + 24);
      if (*(void *)(a1 + 32))
      {
        unint64_t v23 = 0;
        do
        {
          uint64_t v24 = *(unsigned int *)(*v22 + 4 * v23);
          if v24 < 0x3D && ((0x1FFFFF03FFFFFFFFuLL >> v24))
          {
            v25 = off_1E53DB978[(int)v24];
          }
          else
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v24);
            v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          [v21 addObject:v25];

          ++v23;
          v22 = (void *)(a1 + 24);
        }
        while (v23 < *(void *)(a1 + 32));
      }
      if (a2) {
        v26 = @"userPath";
      }
      else {
        v26 = @"user_path";
      }
      [v4 setObject:v21 forKey:v26];
    }
    if (*(unsigned char *)(a1 + 160))
    {
      v27 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
      if (a2) {
        v28 = @"clientCreatedAt";
      }
      else {
        v28 = @"client_created_at";
      }
      [v4 setObject:v27 forKey:v28];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id v30 = *(id *)(a1 + 48);
      uint64_t v31 = [v30 countByEnumeratingWithState:&v78 objects:v86 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v79;
        do
        {
          for (uint64_t j = 0; j != v32; ++j)
          {
            if (*(void *)v79 != v33) {
              objc_enumerationMutation(v30);
            }
            v35 = *(void **)(*((void *)&v78 + 1) + 8 * j);
            if (a2) {
              [v35 jsonRepresentation];
            }
            else {
            v36 = [v35 dictionaryRepresentation];
            }
            [v29 addObject:v36];
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v78 objects:v86 count:16];
        }
        while (v32);
      }

      if (a2) {
        v37 = @"auxiliaryControl";
      }
      else {
        v37 = @"auxiliary_control";
      }
      [v4 setObject:v29 forKey:v37];
    }
    int v38 = *(_DWORD *)(a1 + 160);
    if ((v38 & 2) != 0)
    {
      v39 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 104)];
      if (a2) {
        v40 = @"originatingAuxiliaryControlIndex";
      }
      else {
        v40 = @"originating_auxiliary_control_index";
      }
      [v4 setObject:v39 forKey:v40];

      int v38 = *(_DWORD *)(a1 + 160);
    }
    if ((v38 & 4) != 0)
    {
      v41 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 148)];
      if (a2) {
        v42 = @"deviceGmtOffset";
      }
      else {
        v42 = @"device_gmt_offset";
      }
      [v4 setObject:v41 forKey:v42];
    }
    v43 = [(id)a1 currentEnvironmentManifestUrls];
    v44 = v43;
    if (v43)
    {
      if (a2)
      {
        v45 = [v43 jsonRepresentation];
        v46 = @"currentEnvironmentManifestUrls";
      }
      else
      {
        v45 = [v43 dictionaryRepresentation];
        v46 = @"current_environment_manifest_urls";
      }
      [v4 setObject:v45 forKey:v46];
    }
    v47 = [(id)a1 navigationSettings];
    v48 = v47;
    if (v47)
    {
      if (a2)
      {
        v49 = [v47 jsonRepresentation];
        v50 = @"navigationSettings";
      }
      else
      {
        v49 = [v47 dictionaryRepresentation];
        v50 = @"navigation_settings";
      }
      [v4 setObject:v49 forKey:v50];
    }
    v51 = [(id)a1 sourceInfo];
    v52 = v51;
    if (v51)
    {
      if (a2)
      {
        v53 = [v51 jsonRepresentation];
        v54 = @"sourceInfo";
      }
      else
      {
        v53 = [v51 dictionaryRepresentation];
        v54 = @"source_info";
      }
      [v4 setObject:v53 forKey:v54];
    }
    v55 = [(id)a1 searchCommon];
    v56 = v55;
    if (v55)
    {
      if (a2)
      {
        v57 = [v55 jsonRepresentation];
        v58 = @"searchCommon";
      }
      else
      {
        v57 = [v55 dictionaryRepresentation];
        v58 = @"search_common";
      }
      [v4 setObject:v57 forKey:v58];
    }
    v59 = [(id)a1 currentAbAssignmentResponse];
    v60 = v59;
    if (v59)
    {
      if (a2)
      {
        v61 = [v59 jsonRepresentation];
        v62 = @"currentAbAssignmentResponse";
      }
      else
      {
        v61 = [v59 dictionaryRepresentation];
        v62 = @"current_ab_assignment_response";
      }
      [v4 setObject:v61 forKey:v62];
    }
    if ((*(unsigned char *)(a1 + 160) & 0x10) != 0)
    {
      v63 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 156)];
      if (a2) {
        v64 = @"isSprMap";
      }
      else {
        v64 = @"is_spr_map";
      }
      [v4 setObject:v63 forKey:v64];
    }
    v65 = [(id)a1 combinedUserPath];
    v66 = v65;
    if (v65)
    {
      if (a2)
      {
        v67 = [v65 jsonRepresentation];
        v68 = @"combinedUserPath";
      }
      else
      {
        v67 = [v65 dictionaryRepresentation];
        v68 = @"combined_user_path";
      }
      [v4 setObject:v67 forKey:v68];
    }
    v69 = *(void **)(a1 + 16);
    if (v69)
    {
      v70 = [v69 dictionaryRepresentation];
      v71 = v70;
      if (a2)
      {
        v72 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v70, "count"));
        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = __56__GEORPFeedbackCommonContext__dictionaryRepresentation___block_invoke;
        v76[3] = &unk_1E53D8860;
        id v73 = v72;
        id v77 = v73;
        [v71 enumerateKeysAndObjectsUsingBlock:v76];
        id v74 = v73;

        v71 = v74;
      }
      [v4 setObject:v71 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackCommonContext _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEORPFeedbackCommonContext__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORPFeedbackCommonContext)initWithDictionary:(id)a3
{
  return (GEORPFeedbackCommonContext *)-[GEORPFeedbackCommonContext _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1)
  {
    objc_super v6 = 0;
    goto LABEL_273;
  }
  objc_super v6 = (void *)[a1 init];
  if (v6)
  {
    if (a3) {
      id v7 = @"pinType";
    }
    else {
      id v7 = @"pin_type";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      if ([v9 isEqualToString:@"PIN_TYPE_UNKNOWN"])
      {
        uint64_t v10 = 0xFFFFFFFFLL;
      }
      else if ([v9 isEqualToString:@"SEARCH_RESULT"])
      {
        uint64_t v10 = 0;
      }
      else if ([v9 isEqualToString:@"POI_ICON"])
      {
        uint64_t v10 = 1;
      }
      else if ([v9 isEqualToString:@"DROPPED_PIN"])
      {
        uint64_t v10 = 2;
      }
      else if ([v9 isEqualToString:@"CONTACT"])
      {
        uint64_t v10 = 3;
      }
      else if ([v9 isEqualToString:@"CURRENT_LOCATION"])
      {
        uint64_t v10 = 4;
      }
      else if ([v9 isEqualToString:@"BOOKMARK"])
      {
        uint64_t v10 = 5;
      }
      else if ([v9 isEqualToString:@"EXTERNAL"])
      {
        uint64_t v10 = 6;
      }
      else if ([v9 isEqualToString:@"PIN_TYPE_SEARCH_AUTOCOMPLETE"])
      {
        uint64_t v10 = 7;
      }
      else if ([v9 isEqualToString:@"BRAND_ICON"])
      {
        uint64_t v10 = 8;
      }
      else if ([v9 isEqualToString:@"SHARED_LOCATION"])
      {
        uint64_t v10 = 9;
      }
      else
      {
        uint64_t v10 = 0xFFFFFFFFLL;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_34:

        if (a3) {
          v11 = @"mapLocation";
        }
        else {
          v11 = @"map_location";
        }
        v12 = [v5 objectForKeyedSubscript:v11];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = [GEORPMapLocation alloc];
          if (a3) {
            uint64_t v14 = [(GEORPMapLocation *)v13 initWithJSON:v12];
          }
          else {
            uint64_t v14 = [(GEORPMapLocation *)v13 initWithDictionary:v12];
          }
          uint64_t v15 = (void *)v14;
          [v6 setMapLocation:v14];
        }
        if (a3) {
          uint64_t v16 = @"visibleTileSet";
        }
        else {
          uint64_t v16 = @"visible_tile_set";
        }
        v17 = [v5 objectForKeyedSubscript:v16];
        objc_opt_class();
        id v89 = v5;
        if (objc_opt_isKindOfClass())
        {
          long long v100 = 0u;
          long long v101 = 0u;
          long long v98 = 0u;
          long long v99 = 0u;
          v87 = v17;
          id v18 = v17;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v98 objects:v104 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v99;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v99 != v21) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v23 = *(void *)(*((void *)&v98 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v24 = [GEORPVisibleTileSet alloc];
                  if (a3) {
                    uint64_t v25 = [(GEORPVisibleTileSet *)v24 initWithJSON:v23];
                  }
                  else {
                    uint64_t v25 = [(GEORPVisibleTileSet *)v24 initWithDictionary:v23];
                  }
                  v26 = (void *)v25;
                  objc_msgSend(v6, "addVisibleTileSet:", v25, v87);
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v98 objects:v104 count:16];
            }
            while (v20);
          }

          v17 = v87;
          id v5 = v89;
        }

        if (a3) {
          v27 = @"userPath";
        }
        else {
          v27 = @"user_path";
        }
        v28 = objc_msgSend(v5, "objectForKeyedSubscript:", v27, v87);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v96 = 0u;
          long long v97 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          uint64_t v88 = v28;
          id v29 = v28;
          uint64_t v30 = [v29 countByEnumeratingWithState:&v94 objects:v103 count:16];
          if (!v30) {
            goto LABEL_186;
          }
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v95;
          while (1)
          {
            for (uint64_t j = 0; j != v31; ++j)
            {
              if (*(void *)v95 != v32) {
                objc_enumerationMutation(v29);
              }
              v34 = *(void **)(*((void *)&v94 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v35 = v34;
                if ([v35 isEqualToString:@"USER_PATH_ITEM_UNKNOWN"])
                {
                  uint64_t v36 = 0;
                }
                else if ([v35 isEqualToString:@"PLACE_PROBLEM"])
                {
                  uint64_t v36 = 1;
                }
                else if ([v35 isEqualToString:@"MAP_PROBLEM"])
                {
                  uint64_t v36 = 2;
                }
                else if ([v35 isEqualToString:@"ADDRESS_EDIT"])
                {
                  uint64_t v36 = 3;
                }
                else if ([v35 isEqualToString:@"ADDRESS_EDIT_LABEL"])
                {
                  uint64_t v36 = 4;
                }
                else if ([v35 isEqualToString:@"LOCATION_PICKER_CORRECT_COORDINATE"])
                {
                  uint64_t v36 = 5;
                }
                else if ([v35 isEqualToString:@"LOCATION_PICKER_CHOOSE_FEATURE"])
                {
                  uint64_t v36 = 6;
                }
                else if ([v35 isEqualToString:@"LOCATION_PICKER_CHOOSE_COORDINATE"])
                {
                  uint64_t v36 = 7;
                }
                else if ([v35 isEqualToString:@"LOCATION_PICKER_CHOOSE_REGION"])
                {
                  uint64_t v36 = 8;
                }
                else if ([v35 isEqualToString:@"LOCATION_CLOSED"])
                {
                  uint64_t v36 = 9;
                }
                else if ([v35 isEqualToString:@"COMMENTS_AND_PHOTO"])
                {
                  uint64_t v36 = 10;
                }
                else if ([v35 isEqualToString:@"SEARCH_RESULTS"])
                {
                  uint64_t v36 = 11;
                }
                else if ([v35 isEqualToString:@"SATELLITE_IMAGE"])
                {
                  uint64_t v36 = 12;
                }
                else if ([v35 isEqualToString:@"TRAFFIC"])
                {
                  uint64_t v36 = 13;
                }
                else if ([v35 isEqualToString:@"DIRECTIONS"])
                {
                  uint64_t v36 = 14;
                }
                else if ([v35 isEqualToString:@"DIRECTIONS_STEPS"])
                {
                  uint64_t v36 = 15;
                }
                else if ([v35 isEqualToString:@"GUIDANCE"])
                {
                  uint64_t v36 = 16;
                }
                else if ([v35 isEqualToString:@"ROUTE_PLANNING"])
                {
                  uint64_t v36 = 17;
                }
                else if ([v35 isEqualToString:@"DIRECTIONS_ROUTE_PICKER"])
                {
                  uint64_t v36 = 18;
                }
                else if ([v35 isEqualToString:@"TRANSIT_MAP_PROBLEM"])
                {
                  uint64_t v36 = 19;
                }
                else if ([v35 isEqualToString:@"TRANSIT_DIRECTIONS_PROBLEM"])
                {
                  uint64_t v36 = 20;
                }
                else if ([v35 isEqualToString:@"TRANSIT_STATION_PROBLEM"])
                {
                  uint64_t v36 = 21;
                }
                else if ([v35 isEqualToString:@"TRANSIT_TRANSFER_PICKER"])
                {
                  uint64_t v36 = 22;
                }
                else if ([v35 isEqualToString:@"TRANSIT_LINE_PICKER"])
                {
                  uint64_t v36 = 23;
                }
                else if ([v35 isEqualToString:@"TRANSIT_LINE_DISPLAY_PROBLEM"])
                {
                  uint64_t v36 = 24;
                }
                else if ([v35 isEqualToString:@"TRANSIT_STATION_PICKER"])
                {
                  uint64_t v36 = 25;
                }
                else if ([v35 isEqualToString:@"TRANSIT_LINE_SERVICE_CHANGE"])
                {
                  uint64_t v36 = 26;
                }
                else if ([v35 isEqualToString:@"TRANSIT_LINE_SCHEDULES"])
                {
                  uint64_t v36 = 27;
                }
                else if ([v35 isEqualToString:@"TRANSIT_BAD_ROUTE_SUGGESTIONS"])
                {
                  uint64_t v36 = 28;
                }
                else if ([v35 isEqualToString:@"TRANSIT_ACCESS_POINT"])
                {
                  uint64_t v36 = 29;
                }
                else if ([v35 isEqualToString:@"TRANSIT_SUBCATEGORY_PICKER"])
                {
                  uint64_t v36 = 30;
                }
                else if ([v35 isEqualToString:@"LOCATION_PICKER_CHOOSE_CORRECTABLE_LOCATION"])
                {
                  uint64_t v36 = 31;
                }
                else if ([v35 isEqualToString:@"LOCATION_ADD"])
                {
                  uint64_t v36 = 32;
                }
                else if ([v35 isEqualToString:@"IM_LOST"])
                {
                  uint64_t v36 = 33;
                }
                else if ([v35 isEqualToString:@"SEARCH_AUTOCOMPLETE"])
                {
                  uint64_t v36 = 40;
                }
                else if ([v35 isEqualToString:@"TRANSIT_LINE_NAME_INCORRECT"])
                {
                  uint64_t v36 = 41;
                }
                else if ([v35 isEqualToString:@"TRANSIT_LINE_SHAPE_INCORRECT"])
                {
                  uint64_t v36 = 42;
                }
                else if ([v35 isEqualToString:@"BAD_DIRECTIONS_INCORRECT_INSTRUCTIONS"])
                {
                  uint64_t v36 = 43;
                }
                else if ([v35 isEqualToString:@"BAD_DIRECTIONS_ROUTE_WRONG"])
                {
                  uint64_t v36 = 44;
                }
                else if ([v35 isEqualToString:@"BAD_DIRECTIONS_INCORRECT_ETA"])
                {
                  uint64_t v36 = 45;
                }
                else if ([v35 isEqualToString:@"BAD_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT"])
                {
                  uint64_t v36 = 46;
                }
                else if ([v35 isEqualToString:@"TRANSIT_ACCESS_POINT_PICKER"])
                {
                  uint64_t v36 = 47;
                }
                else if ([v35 isEqualToString:@"PERSONALIZED_MAP_CORRECTION"])
                {
                  uint64_t v36 = 48;
                }
                else if ([v35 isEqualToString:@"WHICH_PERSONALIZED_MAP_ADDRESS"])
                {
                  uint64_t v36 = 49;
                }
                else if ([v35 isEqualToString:@"PERSONALIZED_MAP_PLACE_PROBLEM"])
                {
                  uint64_t v36 = 50;
                }
                else if ([v35 isEqualToString:@"ADD_A_PLACE_TYPE_SELECTION"])
                {
                  uint64_t v36 = 51;
                }
                else if ([v35 isEqualToString:@"LOCATION_PICKER_CHOOSE_COORDINATE_WITH_NAME"])
                {
                  uint64_t v36 = 52;
                }
                else if ([v35 isEqualToString:@"PLACE_CATEGORY_SELECTION"])
                {
                  uint64_t v36 = 53;
                }
                else if ([v35 isEqualToString:@"TAKE_PHOTO"])
                {
                  uint64_t v36 = 54;
                }
                else if ([v35 isEqualToString:@"ROUTING_TRAY"])
                {
                  uint64_t v36 = 55;
                }
                else if ([v35 isEqualToString:@"BRAND_PROBLEM"])
                {
                  uint64_t v36 = 56;
                }
                else if ([v35 isEqualToString:@"BRAND_CORRECTIONS"])
                {
                  uint64_t v36 = 57;
                }
                else if ([v35 isEqualToString:@"ADDRESS_INFO"])
                {
                  uint64_t v36 = 58;
                }
                else if ([v35 isEqualToString:@"ADDRESS_SEARCH"])
                {
                  uint64_t v36 = 59;
                }
                else if ([v35 isEqualToString:@"CURATED_COLLECTION_PROBLEM"])
                {
                  uint64_t v36 = 60;
                }
                else
                {
                  uint64_t v36 = 0;
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
                uint64_t v36 = [v34 intValue];
              }
              objc_msgSend(v6, "addUserPath:", v36, v88);
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v94 objects:v103 count:16];
            if (!v31)
            {
LABEL_186:

              v28 = v88;
              id v5 = v89;
              break;
            }
          }
        }

        if (a3) {
          v37 = @"clientCreatedAt";
        }
        else {
          v37 = @"client_created_at";
        }
        int v38 = objc_msgSend(v5, "objectForKeyedSubscript:", v37, v88);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v38 doubleValue];
          objc_msgSend(v6, "setClientCreatedAt:");
        }

        if (a3) {
          v39 = @"auxiliaryControl";
        }
        else {
          v39 = @"auxiliary_control";
        }
        v40 = [v5 objectForKeyedSubscript:v39];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          id v41 = v40;
          uint64_t v42 = [v41 countByEnumeratingWithState:&v90 objects:v102 count:16];
          if (v42)
          {
            uint64_t v43 = v42;
            uint64_t v44 = *(void *)v91;
            do
            {
              for (uint64_t k = 0; k != v43; ++k)
              {
                if (*(void *)v91 != v44) {
                  objc_enumerationMutation(v41);
                }
                uint64_t v46 = *(void *)(*((void *)&v90 + 1) + 8 * k);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v47 = [GEORPAuxiliaryControl alloc];
                  if (a3) {
                    uint64_t v48 = [(GEORPAuxiliaryControl *)v47 initWithJSON:v46];
                  }
                  else {
                    uint64_t v48 = [(GEORPAuxiliaryControl *)v47 initWithDictionary:v46];
                  }
                  v49 = (void *)v48;
                  [v6 addAuxiliaryControl:v48];
                }
              }
              uint64_t v43 = [v41 countByEnumeratingWithState:&v90 objects:v102 count:16];
            }
            while (v43);
          }

          id v5 = v89;
        }

        if (a3) {
          v50 = @"originatingAuxiliaryControlIndex";
        }
        else {
          v50 = @"originating_auxiliary_control_index";
        }
        v51 = [v5 objectForKeyedSubscript:v50];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v6, "setOriginatingAuxiliaryControlIndex:", objc_msgSend(v51, "unsignedLongLongValue"));
        }

        if (a3) {
          v52 = @"deviceGmtOffset";
        }
        else {
          v52 = @"device_gmt_offset";
        }
        v53 = [v5 objectForKeyedSubscript:v52];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v6, "setDeviceGmtOffset:", objc_msgSend(v53, "intValue"));
        }

        if (a3) {
          v54 = @"currentEnvironmentManifestUrls";
        }
        else {
          v54 = @"current_environment_manifest_urls";
        }
        v55 = [v5 objectForKeyedSubscript:v54];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v56 = [GEORPCurrentEnvironmentManifestURLs alloc];
          if (a3) {
            uint64_t v57 = [(GEORPCurrentEnvironmentManifestURLs *)v56 initWithJSON:v55];
          }
          else {
            uint64_t v57 = [(GEORPCurrentEnvironmentManifestURLs *)v56 initWithDictionary:v55];
          }
          v58 = (void *)v57;
          [v6 setCurrentEnvironmentManifestUrls:v57];
        }
        if (a3) {
          v59 = @"navigationSettings";
        }
        else {
          v59 = @"navigation_settings";
        }
        v60 = [v5 objectForKeyedSubscript:v59];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v61 = [GEORPNavigationSettings alloc];
          if (a3) {
            uint64_t v62 = [(GEORPNavigationSettings *)v61 initWithJSON:v60];
          }
          else {
            uint64_t v62 = [(GEORPNavigationSettings *)v61 initWithDictionary:v60];
          }
          v63 = (void *)v62;
          [v6 setNavigationSettings:v62];
        }
        if (a3) {
          v64 = @"sourceInfo";
        }
        else {
          v64 = @"source_info";
        }
        v65 = [v5 objectForKeyedSubscript:v64];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v66 = [GEORPSourceInfo alloc];
          if (a3) {
            uint64_t v67 = [(GEORPSourceInfo *)v66 initWithJSON:v65];
          }
          else {
            uint64_t v67 = [(GEORPSourceInfo *)v66 initWithDictionary:v65];
          }
          v68 = (void *)v67;
          [v6 setSourceInfo:v67];
        }
        if (a3) {
          v69 = @"searchCommon";
        }
        else {
          v69 = @"search_common";
        }
        v70 = [v5 objectForKeyedSubscript:v69];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v71 = [GEORPSearchCommonContext alloc];
          if (a3) {
            uint64_t v72 = [(GEORPSearchCommonContext *)v71 initWithJSON:v70];
          }
          else {
            uint64_t v72 = [(GEORPSearchCommonContext *)v71 initWithDictionary:v70];
          }
          id v73 = (void *)v72;
          [v6 setSearchCommon:v72];
        }
        if (a3) {
          id v74 = @"currentAbAssignmentResponse";
        }
        else {
          id v74 = @"current_ab_assignment_response";
        }
        v75 = [v5 objectForKeyedSubscript:v74];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v76 = [GEOABAssignmentResponse alloc];
          if (a3) {
            uint64_t v77 = [(GEOABAssignmentResponse *)v76 initWithJSON:v75];
          }
          else {
            uint64_t v77 = [(GEOABAssignmentResponse *)v76 initWithDictionary:v75];
          }
          long long v78 = (void *)v77;
          [v6 setCurrentAbAssignmentResponse:v77];
        }
        if (a3) {
          long long v79 = @"isSprMap";
        }
        else {
          long long v79 = @"is_spr_map";
        }
        long long v80 = [v5 objectForKeyedSubscript:v79];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v6, "setIsSprMap:", objc_msgSend(v80, "BOOLValue"));
        }

        if (a3) {
          long long v81 = @"combinedUserPath";
        }
        else {
          long long v81 = @"combined_user_path";
        }
        long long v82 = [v5 objectForKeyedSubscript:v81];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v83 = [GEORPUserPath alloc];
          if (a3) {
            uint64_t v84 = [(GEORPUserPath *)v83 initWithJSON:v82];
          }
          else {
            uint64_t v84 = [(GEORPUserPath *)v83 initWithDictionary:v82];
          }
          long long v85 = (void *)v84;
          [v6 setCombinedUserPath:v84];
        }
        goto LABEL_273;
      }
      uint64_t v10 = [v8 intValue];
    }
    [v6 setPinType:v10];
    goto LABEL_34;
  }
LABEL_273:

  return v6;
}

- (GEORPFeedbackCommonContext)initWithJSON:(id)a3
{
  return (GEORPFeedbackCommonContext *)-[GEORPFeedbackCommonContext _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1073;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1074;
    }
    GEORPFeedbackCommonContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPFeedbackCommonContextCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackCommonContextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackCommonContextReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPFeedbackCommonContextIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v16 = self->_reader;
    objc_sync_enter(v16);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v17 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v17];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v16);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPFeedbackCommonContext *)self readAll:0];
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_mapLocation) {
      PBDataWriterWriteSubmessage();
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    objc_super v6 = self->_visibleTileSets;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v7);
    }

    if (self->_userPaths.count)
    {
      unint64_t v10 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v10;
      }
      while (v10 < self->_userPaths.count);
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteDoubleField();
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v11 = self->_auxiliaryControls;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v12);
    }

    $B40C2BF14A359B44A88B8C46D0584055 flags = self->_flags;
    if ((*(unsigned char *)&flags & 2) != 0)
    {
      PBDataWriterWriteUint64Field();
      $B40C2BF14A359B44A88B8C46D0584055 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 4) != 0) {
      PBDataWriterWriteSint32Field();
    }
    if (self->_currentEnvironmentManifestUrls) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_navigationSettings) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_sourceInfo) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_searchCommon) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_currentAbAssignmentResponse) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_combinedUserPath) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v18);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPFeedbackCommonContext _readMapLocation]((uint64_t)self);
  mapLocation = self->_mapLocation;

  return [(GEORPMapLocation *)mapLocation hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  v17 = (id *)a3;
  [(GEORPFeedbackCommonContext *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v17 + 1, self->_reader);
  *((_DWORD *)v17 + 34) = self->_readerMarkPos;
  *((_DWORD *)v17 + 35) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v17 + 38) = self->_pinType;
    *((_DWORD *)v17 + 40) |= 8u;
  }
  if (self->_mapLocation) {
    objc_msgSend(v17, "setMapLocation:");
  }
  if ([(GEORPFeedbackCommonContext *)self visibleTileSetsCount])
  {
    [v17 clearVisibleTileSets];
    unint64_t v4 = [(GEORPFeedbackCommonContext *)self visibleTileSetsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPFeedbackCommonContext *)self visibleTileSetAtIndex:i];
        [v17 addVisibleTileSet:v7];
      }
    }
  }
  if ([(GEORPFeedbackCommonContext *)self userPathsCount])
  {
    [v17 clearUserPaths];
    unint64_t v8 = [(GEORPFeedbackCommonContext *)self userPathsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        objc_msgSend(v17, "addUserPath:", -[GEORPFeedbackCommonContext userPathAtIndex:](self, "userPathAtIndex:", j));
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    v17[7] = *(id *)&self->_clientCreatedAt;
    *((_DWORD *)v17 + 40) |= 1u;
  }
  if ([(GEORPFeedbackCommonContext *)self auxiliaryControlsCount])
  {
    [v17 clearAuxiliaryControls];
    unint64_t v11 = [(GEORPFeedbackCommonContext *)self auxiliaryControlsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
      {
        uint64_t v14 = [(GEORPFeedbackCommonContext *)self auxiliaryControlAtIndex:k];
        [v17 addAuxiliaryControl:v14];
      }
    }
  }
  $B40C2BF14A359B44A88B8C46D0584055 flags = self->_flags;
  uint64_t v16 = v17;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    v17[13] = self->_originatingAuxiliaryControlIndex;
    *((_DWORD *)v17 + 40) |= 2u;
    $B40C2BF14A359B44A88B8C46D0584055 flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    *((_DWORD *)v17 + 37) = self->_deviceGmtOffset;
    *((_DWORD *)v17 + 40) |= 4u;
  }
  if (self->_currentEnvironmentManifestUrls)
  {
    objc_msgSend(v17, "setCurrentEnvironmentManifestUrls:");
    uint64_t v16 = v17;
  }
  if (self->_navigationSettings)
  {
    objc_msgSend(v17, "setNavigationSettings:");
    uint64_t v16 = v17;
  }
  if (self->_sourceInfo)
  {
    objc_msgSend(v17, "setSourceInfo:");
    uint64_t v16 = v17;
  }
  if (self->_searchCommon)
  {
    objc_msgSend(v17, "setSearchCommon:");
    uint64_t v16 = v17;
  }
  if (self->_currentAbAssignmentResponse)
  {
    objc_msgSend(v17, "setCurrentAbAssignmentResponse:");
    uint64_t v16 = v17;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *((unsigned char *)v16 + 156) = self->_isSprMap;
    *((_DWORD *)v16 + 40) |= 0x10u;
  }
  if (self->_combinedUserPath)
  {
    objc_msgSend(v17, "setCombinedUserPath:");
    uint64_t v16 = v17;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 1) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPFeedbackCommonContextReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_30;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPFeedbackCommonContext *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 152) = self->_pinType;
    *(_DWORD *)(v5 + 160) |= 8u;
  }
  id v9 = [(GEORPMapLocation *)self->_mapLocation copyWithZone:a3];
  unint64_t v10 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v9;

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  unint64_t v11 = self->_visibleTileSets;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = (void *)[*(id *)(*((void *)&v40 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addVisibleTileSet:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v12);
  }

  PBRepeatedInt32Copy();
  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v5 + 56) = self->_clientCreatedAt;
    *(_DWORD *)(v5 + 160) |= 1u;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v16 = self->_auxiliaryControls;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(v16);
        }
        long long v20 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * j), "copyWithZone:", a3, (void)v36);
        [(id)v5 addAuxiliaryControl:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v17);
  }

  $B40C2BF14A359B44A88B8C46D0584055 flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    *(void *)(v5 + 104) = self->_originatingAuxiliaryControlIndex;
    *(_DWORD *)(v5 + 160) |= 2u;
    $B40C2BF14A359B44A88B8C46D0584055 flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 148) = self->_deviceGmtOffset;
    *(_DWORD *)(v5 + 160) |= 4u;
  }
  id v22 = -[GEORPCurrentEnvironmentManifestURLs copyWithZone:](self->_currentEnvironmentManifestUrls, "copyWithZone:", a3, (void)v36);
  long long v23 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v22;

  id v24 = [(GEORPNavigationSettings *)self->_navigationSettings copyWithZone:a3];
  long long v25 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v24;

  id v26 = [(GEORPSourceInfo *)self->_sourceInfo copyWithZone:a3];
  v27 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v26;

  id v28 = [(GEORPSearchCommonContext *)self->_searchCommon copyWithZone:a3];
  id v29 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v28;

  id v30 = [(GEOABAssignmentResponse *)self->_currentAbAssignmentResponse copyWithZone:a3];
  uint64_t v31 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v30;

  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 156) = self->_isSprMap;
    *(_DWORD *)(v5 + 160) |= 0x10u;
  }
  id v32 = [(GEORPUserPath *)self->_combinedUserPath copyWithZone:a3];
  uint64_t v33 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v32;

  v34 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v34;
LABEL_30:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_44;
  }
  [(GEORPFeedbackCommonContext *)self readAll:1];
  [v4 readAll:1];
  int v5 = *((_DWORD *)v4 + 40);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((v5 & 8) == 0 || self->_pinType != *((_DWORD *)v4 + 38)) {
      goto LABEL_44;
    }
  }
  else if ((v5 & 8) != 0)
  {
    goto LABEL_44;
  }
  mapLocation = self->_mapLocation;
  if ((unint64_t)mapLocation | *((void *)v4 + 11) && !-[GEORPMapLocation isEqual:](mapLocation, "isEqual:")) {
    goto LABEL_44;
  }
  visibleTileSets = self->_visibleTileSets;
  if ((unint64_t)visibleTileSets | *((void *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](visibleTileSets, "isEqual:")) {
      goto LABEL_44;
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_44;
  }
  $B40C2BF14A359B44A88B8C46D0584055 flags = self->_flags;
  int v9 = *((_DWORD *)v4 + 40);
  if (*(unsigned char *)&flags)
  {
    if ((v9 & 1) == 0 || self->_clientCreatedAt != *((double *)v4 + 7)) {
      goto LABEL_44;
    }
  }
  else if (v9)
  {
    goto LABEL_44;
  }
  auxiliaryControls = self->_auxiliaryControls;
  if ((unint64_t)auxiliaryControls | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](auxiliaryControls, "isEqual:")) {
      goto LABEL_44;
    }
    $B40C2BF14A359B44A88B8C46D0584055 flags = self->_flags;
    int v9 = *((_DWORD *)v4 + 40);
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_originatingAuxiliaryControlIndex != *((void *)v4 + 13)) {
      goto LABEL_44;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_deviceGmtOffset != *((_DWORD *)v4 + 37)) {
      goto LABEL_44;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_44;
  }
  currentEnvironmentManifestUrls = self->_currentEnvironmentManifestUrls;
  if ((unint64_t)currentEnvironmentManifestUrls | *((void *)v4 + 10)
    && !-[GEORPCurrentEnvironmentManifestURLs isEqual:](currentEnvironmentManifestUrls, "isEqual:"))
  {
    goto LABEL_44;
  }
  navigationSettings = self->_navigationSettings;
  if ((unint64_t)navigationSettings | *((void *)v4 + 12))
  {
    if (!-[GEORPNavigationSettings isEqual:](navigationSettings, "isEqual:")) {
      goto LABEL_44;
    }
  }
  sourceInfo = self->_sourceInfo;
  if ((unint64_t)sourceInfo | *((void *)v4 + 15))
  {
    if (!-[GEORPSourceInfo isEqual:](sourceInfo, "isEqual:")) {
      goto LABEL_44;
    }
  }
  searchCommon = self->_searchCommon;
  if ((unint64_t)searchCommon | *((void *)v4 + 14))
  {
    if (!-[GEORPSearchCommonContext isEqual:](searchCommon, "isEqual:")) {
      goto LABEL_44;
    }
  }
  currentAbAssignmentResponse = self->_currentAbAssignmentResponse;
  if ((unint64_t)currentAbAssignmentResponse | *((void *)v4 + 9))
  {
    if (!-[GEOABAssignmentResponse isEqual:](currentAbAssignmentResponse, "isEqual:")) {
      goto LABEL_44;
    }
  }
  int v16 = *((_DWORD *)v4 + 40);
  if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    if ((v16 & 0x10) == 0) {
      goto LABEL_50;
    }
LABEL_44:
    char v17 = 0;
    goto LABEL_45;
  }
  if ((v16 & 0x10) == 0) {
    goto LABEL_44;
  }
  if (!self->_isSprMap)
  {
    if (!*((unsigned char *)v4 + 156)) {
      goto LABEL_50;
    }
    goto LABEL_44;
  }
  if (!*((unsigned char *)v4 + 156)) {
    goto LABEL_44;
  }
LABEL_50:
  combinedUserPath = self->_combinedUserPath;
  if ((unint64_t)combinedUserPath | *((void *)v4 + 8)) {
    char v17 = -[GEORPUserPath isEqual:](combinedUserPath, "isEqual:");
  }
  else {
    char v17 = 1;
  }
LABEL_45:

  return v17;
}

- (unint64_t)hash
{
  [(GEORPFeedbackCommonContext *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    uint64_t v24 = 2654435761 * self->_pinType;
  }
  else {
    uint64_t v24 = 0;
  }
  unint64_t v23 = [(GEORPMapLocation *)self->_mapLocation hash];
  uint64_t v22 = [(NSMutableArray *)self->_visibleTileSets hash];
  uint64_t v21 = PBRepeatedInt32Hash();
  if (*(unsigned char *)&self->_flags)
  {
    double clientCreatedAt = self->_clientCreatedAt;
    double v5 = -clientCreatedAt;
    if (clientCreatedAt >= 0.0) {
      double v5 = self->_clientCreatedAt;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  unint64_t v20 = v3;
  uint64_t v18 = [(NSMutableArray *)self->_auxiliaryControls hash];
  $B40C2BF14A359B44A88B8C46D0584055 flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    unint64_t v9 = 2654435761u * self->_originatingAuxiliaryControlIndex;
    if ((*(unsigned char *)&flags & 4) != 0) {
      goto LABEL_14;
    }
  }
  else
  {
    unint64_t v9 = 0;
    if ((*(unsigned char *)&flags & 4) != 0)
    {
LABEL_14:
      uint64_t v10 = 2654435761 * self->_deviceGmtOffset;
      goto LABEL_17;
    }
  }
  uint64_t v10 = 0;
LABEL_17:
  unint64_t v11 = [(GEORPCurrentEnvironmentManifestURLs *)self->_currentEnvironmentManifestUrls hash];
  unint64_t v12 = [(GEORPNavigationSettings *)self->_navigationSettings hash];
  unint64_t v13 = [(GEORPSourceInfo *)self->_sourceInfo hash];
  unint64_t v14 = [(GEORPSearchCommonContext *)self->_searchCommon hash];
  unint64_t v15 = [(GEOABAssignmentResponse *)self->_currentAbAssignmentResponse hash];
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    uint64_t v16 = 2654435761 * self->_isSprMap;
  }
  else {
    uint64_t v16 = 0;
  }
  return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v19 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ [(GEORPUserPath *)self->_combinedUserPath hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if ((*((unsigned char *)v4 + 160) & 8) != 0)
  {
    self->_pinType = *((_DWORD *)v4 + 38);
    *(_DWORD *)&self->_flags |= 8u;
  }
  mapLocation = self->_mapLocation;
  uint64_t v6 = *((void *)v4 + 11);
  if (mapLocation)
  {
    if (v6) {
      -[GEORPMapLocation mergeFrom:](mapLocation, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEORPFeedbackCommonContext setMapLocation:](self, "setMapLocation:");
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v7 = *((id *)v4 + 16);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(v7);
        }
        [(GEORPFeedbackCommonContext *)self addVisibleTileSet:*(void *)(*((void *)&v37 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v9);
  }

  uint64_t v12 = [v4 userPathsCount];
  if (v12)
  {
    uint64_t v13 = v12;
    for (uint64_t j = 0; j != v13; ++j)
      -[GEORPFeedbackCommonContext addUserPath:](self, "addUserPath:", [v4 userPathAtIndex:j]);
  }
  if (*((unsigned char *)v4 + 160))
  {
    self->_double clientCreatedAt = *((double *)v4 + 7);
    *(_DWORD *)&self->_flags |= 1u;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v15 = *((id *)v4 + 6);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v15);
        }
        -[GEORPFeedbackCommonContext addAuxiliaryControl:](self, "addAuxiliaryControl:", *(void *)(*((void *)&v33 + 1) + 8 * k), (void)v33);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v17);
  }

  int v20 = *((_DWORD *)v4 + 40);
  if ((v20 & 2) != 0)
  {
    self->_originatingAuxiliaryControlIndex = *((void *)v4 + 13);
    *(_DWORD *)&self->_flags |= 2u;
    int v20 = *((_DWORD *)v4 + 40);
  }
  if ((v20 & 4) != 0)
  {
    self->_deviceGmtOffset = *((_DWORD *)v4 + 37);
    *(_DWORD *)&self->_flags |= 4u;
  }
  currentEnvironmentManifestUrls = self->_currentEnvironmentManifestUrls;
  uint64_t v22 = *((void *)v4 + 10);
  if (currentEnvironmentManifestUrls)
  {
    if (v22) {
      -[GEORPCurrentEnvironmentManifestURLs mergeFrom:](currentEnvironmentManifestUrls, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[GEORPFeedbackCommonContext setCurrentEnvironmentManifestUrls:](self, "setCurrentEnvironmentManifestUrls:");
  }
  navigationSettings = self->_navigationSettings;
  uint64_t v24 = *((void *)v4 + 12);
  if (navigationSettings)
  {
    if (v24) {
      -[GEORPNavigationSettings mergeFrom:](navigationSettings, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[GEORPFeedbackCommonContext setNavigationSettings:](self, "setNavigationSettings:");
  }
  sourceInfo = self->_sourceInfo;
  uint64_t v26 = *((void *)v4 + 15);
  if (sourceInfo)
  {
    if (v26) {
      -[GEORPSourceInfo mergeFrom:](sourceInfo, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[GEORPFeedbackCommonContext setSourceInfo:](self, "setSourceInfo:");
  }
  searchCommon = self->_searchCommon;
  uint64_t v28 = *((void *)v4 + 14);
  if (searchCommon)
  {
    if (v28) {
      -[GEORPSearchCommonContext mergeFrom:](searchCommon, "mergeFrom:");
    }
  }
  else if (v28)
  {
    -[GEORPFeedbackCommonContext setSearchCommon:](self, "setSearchCommon:");
  }
  currentAbAssignmentResponse = self->_currentAbAssignmentResponse;
  uint64_t v30 = *((void *)v4 + 9);
  if (currentAbAssignmentResponse)
  {
    if (v30) {
      -[GEOABAssignmentResponse mergeFrom:](currentAbAssignmentResponse, "mergeFrom:");
    }
  }
  else if (v30)
  {
    -[GEORPFeedbackCommonContext setCurrentAbAssignmentResponse:](self, "setCurrentAbAssignmentResponse:");
  }
  if ((*((unsigned char *)v4 + 160) & 0x10) != 0)
  {
    self->_isSprMap = *((unsigned char *)v4 + 156);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
  combinedUserPath = self->_combinedUserPath;
  uint64_t v32 = *((void *)v4 + 8);
  if (combinedUserPath)
  {
    if (v32) {
      -[GEORPUserPath mergeFrom:](combinedUserPath, "mergeFrom:");
    }
  }
  else if (v32)
  {
    -[GEORPFeedbackCommonContext setCombinedUserPath:](self, "setCombinedUserPath:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      double v5 = reader;
      objc_sync_enter(v5);
      GEORPFeedbackCommonContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1078);
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
  *(_DWORD *)&self->_flags |= 0x10020u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPFeedbackCommonContext *)self readAll:0];
    [(GEORPSourceInfo *)self->_sourceInfo clearUnknownFields:1];
    [(GEORPSearchCommonContext *)self->_searchCommon clearUnknownFields:1];
    [(GEOABAssignmentResponse *)self->_currentAbAssignmentResponse clearUnknownFields:1];
    combinedUserPath = self->_combinedUserPath;
    [(GEORPUserPath *)combinedUserPath clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleTileSets, 0);
  objc_storeStrong((id *)&self->_sourceInfo, 0);
  objc_storeStrong((id *)&self->_searchCommon, 0);
  objc_storeStrong((id *)&self->_navigationSettings, 0);
  objc_storeStrong((id *)&self->_mapLocation, 0);
  objc_storeStrong((id *)&self->_currentEnvironmentManifestUrls, 0);
  objc_storeStrong((id *)&self->_currentAbAssignmentResponse, 0);
  objc_storeStrong((id *)&self->_combinedUserPath, 0);
  objc_storeStrong((id *)&self->_auxiliaryControls, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)recordEnvironmentAndManifestURLs
{
  BOOL v3 = objc_alloc_init(GEORPCurrentEnvironmentManifestURLs);
  [(GEORPFeedbackCommonContext *)self setCurrentEnvironmentManifestUrls:v3];

  id v4 = [(GEORPFeedbackCommonContext *)self currentEnvironmentManifestUrls];
  [(GEORPFeedbackCommonContext *)self _recordCurrentEnvironment:v4];

  id v5 = [(GEORPFeedbackCommonContext *)self currentEnvironmentManifestUrls];
  [(GEORPFeedbackCommonContext *)self _recordManifestURLs:v5];
}

- (void)_recordCurrentEnvironment:(id)a3
{
  id v3 = a3;
  id v4 = +[GEOResourceManifestConfiguration defaultConfiguration];
  id v11 = [v4 environment];

  id v5 = +[GEOResourceManifestManager modernManager];
  uint64_t v6 = [v5 activeTileGroup];
  id v7 = [v6 releaseInfo];

  if (!v7)
  {
    uint64_t v8 = NSString;
    uint64_t v9 = +[GEOResourceManifestManager modernManager];
    uint64_t v10 = [v9 activeTileGroup];
    id v7 = objc_msgSend(v8, "stringWithFormat:", @"%i", objc_msgSend(v10, "identifier"));
  }
  [v3 setEnvironmentDisplayName:v11];
  [v3 setEnvironmentReleaseName:v7];
}

- (void)_recordManifestURLs:(id)a3
{
  id v8 = a3;
  for (unint64_t i = 0; i != 66; ++i)
  {
    if (i - 23 < 0x2B || i <= 0x15 && ((1 << i) & 0x3DDE27) != 0)
    {
      id v4 = objc_alloc_init(GEORPManifestURL);
      id v5 = v4;
      if (i > 0x41) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = off_1E53F64C0[i];
      }
      [(GEORPManifestURL *)v4 setUrlName:v6];
      id v7 = _GEOGetURLWithSource(i, 0, 1, 0);
      [(GEORPManifestURL *)v5 setUrlValue:v7];

      [v8 addUrl:v5];
    }
  }
}

@end