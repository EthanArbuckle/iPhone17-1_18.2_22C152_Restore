@interface GEOABExperimentAssignment
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDebugExperimentBranch;
- (BOOL)hasOfflineAbJson;
- (BOOL)hasPlaceRequestType;
- (BOOL)hasQuerySubstring;
- (BOOL)hasServiceType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOABDebugPanelExperimentBranch)debugExperimentBranch;
- (GEOABExperimentAssignment)init;
- (GEOABExperimentAssignment)initWithData:(id)a3;
- (GEOABExperimentAssignment)initWithDictionary:(id)a3;
- (GEOABExperimentAssignment)initWithJSON:(id)a3;
- (NSString)offlineAbJson;
- (NSString)querySubstring;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)placeRequestTypeAsString:(int)a3;
- (id)serviceTypeAsString:(int)a3;
- (int)StringAsPlaceRequestType:(id)a3;
- (int)StringAsServiceType:(id)a3;
- (int)placeRequestType;
- (int)serviceType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDebugExperimentBranch;
- (void)_readOfflineAbJson;
- (void)_readQuerySubstring;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDebugExperimentBranch:(id)a3;
- (void)setHasPlaceRequestType:(BOOL)a3;
- (void)setHasServiceType:(BOOL)a3;
- (void)setOfflineAbJson:(id)a3;
- (void)setPlaceRequestType:(int)a3;
- (void)setQuerySubstring:(id)a3;
- (void)setServiceType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOABExperimentAssignment

- (GEOABExperimentAssignment)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOABExperimentAssignment;
  v2 = [(GEOABExperimentAssignment *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOABExperimentAssignment)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOABExperimentAssignment;
  v3 = [(GEOABExperimentAssignment *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)serviceType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_serviceType;
  }
  else {
    return 0;
  }
}

- (void)setServiceType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  self->_serviceType = a3;
}

- (void)setHasServiceType:(BOOL)a3
{
  if (a3) {
    char v3 = 66;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasServiceType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)serviceTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53EC138[a3];
  }

  return v3;
}

- (int)StringAsServiceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SERVICE_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SERVICE_TYPE_DISPATCHER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SERVICE_TYPE_ROUTING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SERVICE_TYPE_TILES"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)placeRequestType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_placeRequestType;
  }
  else {
    return 0;
  }
}

- (void)setPlaceRequestType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_placeRequestType = a3;
}

- (void)setHasPlaceRequestType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasPlaceRequestType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)placeRequestTypeAsString:(int)a3
{
  if (a3 >= 0x3F)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53EC158[a3];
  }

  return v3;
}

- (int)StringAsPlaceRequestType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"REQUEST_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_SEARCH"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_GEOCODING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_CANONICAL_LOCATION_SEARCH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_REVERSE_GEOCODING"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_PLACE_LOOKUP"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_MERCHANT_LOOKUP"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_PLACE_REFINEMENT"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_SIRI_SEARCH"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_LOCATION_DIRECTED_SEARCH"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_AUTOCOMPLETE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_BROWSE_CATEGORY_SUGGESTION"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_CATEGORY_SEARCH"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_POPULAR_NEARBY_SEARCH"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_ZERO_KEYWORD_CATEGORY_SUGGESTION"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_SEARCH_FIELD_PLACEHOLDER"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_BATCH_POPULAR_NEARBY_SEARCH"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_VENDOR_SPECIFIC_PLACE_REFINEMENT"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_NEARBY_SEARCH"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_ADDRESS_OBJECT_GEOCODING"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_ZERO_KEYWORD_WITH_SEARCH_RESULTS_SUGGESTION"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_EXTERNAL_TRANSIT_LOOKUP"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_FEATURE_ID_GEOCODING"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_MAPS_IDENTIFIER_PLACE_LOOKUP"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_DATASET_STATUS_CHECK"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_OFFLINE_AREA_LOOKUP"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_BATCH_REVERSE_GEOCODING"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_OFFLINE_SUGGESTED_REGIONS"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_OFFLINE_POLYGON_QUAD_NODES"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_OFFLINE_PROACTIVE_REGIONS"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_BRAND_LOOKUP"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_OFFLINE_UPDATE_MANIFEST"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_WIFI_FINGERPRINT_LOOKUP"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_INITIAL_OFFLINE_SUGGESTION"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_IP_GEO_LOOKUP"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_GROUND_VIEW_LABEL"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_BATCH_SPATIAL_LOOKUP"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_TRANSIT_VEHICLE_POSITION"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_PLACE_COLLECTION_LOOKUP"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_TRANSIT_SCHEDULE_LOOKUP"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_BATCH_CATEGORY_LOOKUP"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_BATCH_MERCHANT_LOOKUP_BRAND"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_CHILD_PLACE_LOOKUP_BY_CATEGORY"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_COLLECTION_SUGGESTION"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_MAPS_SEARCH_HOME"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_PLACE_QUESTIONNAIRE_LOOKUP"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_PUBLISHER_VIEW"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_ALL_COLLECTIONS_VIEW"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_AIRPORT_ENTITY_PLACE_LOOKUP"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_TERRITORY_LOOKUP"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_TRANSIT_NEARBY_SCHEDULE_LOOKUP"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_MAPS_HOME"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_ALL_GUIDES_LOCATIONS"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_GUIDES_HOME"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_EXTENDED_GEO_LOOKUP"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_QUERY_UNDERSTANDING"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_POI_AT_ADDRESS_LOOKUP"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_TRANSIT_NEARBY_PAYMENT_METHOD_LOOKUP"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_PLACECARD_ENRICHMENT"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_OFFLINE_REGION_NAME"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_SEARCH_CAPABILITIES"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_REFRESH_ID_LOOKUP"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_ADDRESS_RECOMMENDATION"])
  {
    int v4 = 62;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readQuerySubstring
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOABExperimentAssignmentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQuerySubstring_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasQuerySubstring
{
  return self->_querySubstring != 0;
}

- (NSString)querySubstring
{
  -[GEOABExperimentAssignment _readQuerySubstring]((uint64_t)self);
  querySubstring = self->_querySubstring;

  return querySubstring;
}

- (void)setQuerySubstring:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_querySubstring, a3);
}

- (void)_readDebugExperimentBranch
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOABExperimentAssignmentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDebugExperimentBranch_tags_594);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasDebugExperimentBranch
{
  return self->_debugExperimentBranch != 0;
}

- (GEOABDebugPanelExperimentBranch)debugExperimentBranch
{
  -[GEOABExperimentAssignment _readDebugExperimentBranch]((uint64_t)self);
  debugExperimentBranch = self->_debugExperimentBranch;

  return debugExperimentBranch;
}

- (void)setDebugExperimentBranch:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_debugExperimentBranch, a3);
}

- (void)_readOfflineAbJson
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOABExperimentAssignmentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOfflineAbJson_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasOfflineAbJson
{
  return self->_offlineAbJson != 0;
}

- (NSString)offlineAbJson
{
  -[GEOABExperimentAssignment _readOfflineAbJson]((uint64_t)self);
  offlineAbJson = self->_offlineAbJson;

  return offlineAbJson;
}

- (void)setOfflineAbJson:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_offlineAbJson, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOABExperimentAssignment;
  int v4 = [(GEOABExperimentAssignment *)&v8 description];
  v5 = [(GEOABExperimentAssignment *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOABExperimentAssignment _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 68);
    if ((v5 & 2) != 0)
    {
      uint64_t v6 = *(int *)(a1 + 64);
      if (v6 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 64));
        objc_super v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v7 = off_1E53EC138[v6];
      }
      if (a2) {
        objc_super v8 = @"serviceType";
      }
      else {
        objc_super v8 = @"service_type";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 68);
    }
    if (v5)
    {
      uint64_t v9 = *(int *)(a1 + 60);
      if (v9 >= 0x3F)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E53EC158[v9];
      }
      if (a2) {
        v11 = @"placeRequestType";
      }
      else {
        v11 = @"place_request_type";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = [(id)a1 querySubstring];
    if (v12)
    {
      if (a2) {
        v13 = @"querySubstring";
      }
      else {
        v13 = @"query_substring";
      }
      [v4 setObject:v12 forKey:v13];
    }

    v14 = [(id)a1 debugExperimentBranch];
    v15 = v14;
    if (v14)
    {
      if (a2)
      {
        v16 = [v14 jsonRepresentation];
        v17 = @"debugExperimentBranch";
      }
      else
      {
        v16 = [v14 dictionaryRepresentation];
        v17 = @"debug_experiment_branch";
      }
      [v4 setObject:v16 forKey:v17];
    }
    v18 = [(id)a1 offlineAbJson];
    if (v18)
    {
      if (a2) {
        v19 = @"offlineAbJson";
      }
      else {
        v19 = @"offline_ab_json";
      }
      [v4 setObject:v18 forKey:v19];
    }

    v20 = *(void **)(a1 + 16);
    if (v20)
    {
      v21 = [v20 dictionaryRepresentation];
      v22 = v21;
      if (a2)
      {
        v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __55__GEOABExperimentAssignment__dictionaryRepresentation___block_invoke;
        v27[3] = &unk_1E53D8860;
        id v24 = v23;
        id v28 = v24;
        [v22 enumerateKeysAndObjectsUsingBlock:v27];
        id v25 = v24;

        v22 = v25;
      }
      [v4 setObject:v22 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOABExperimentAssignment _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEOABExperimentAssignment__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
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

- (GEOABExperimentAssignment)initWithDictionary:(id)a3
{
  return (GEOABExperimentAssignment *)-[GEOABExperimentAssignment _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_174;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_174;
  }
  if (a3) {
    uint64_t v6 = @"serviceType";
  }
  else {
    uint64_t v6 = @"service_type";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"SERVICE_TYPE_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"SERVICE_TYPE_DISPATCHER"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"SERVICE_TYPE_ROUTING"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"SERVICE_TYPE_TILES"])
    {
      uint64_t v9 = 3;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_20;
    }
    uint64_t v9 = [v7 intValue];
  }
  [a1 setServiceType:v9];
LABEL_20:

  if (a3) {
    id v10 = @"placeRequestType";
  }
  else {
    id v10 = @"place_request_type";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    if ([v12 isEqualToString:@"REQUEST_TYPE_UNKNOWN"])
    {
      uint64_t v13 = 0;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_SEARCH"])
    {
      uint64_t v13 = 1;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_GEOCODING"])
    {
      uint64_t v13 = 2;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_CANONICAL_LOCATION_SEARCH"])
    {
      uint64_t v13 = 3;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_REVERSE_GEOCODING"])
    {
      uint64_t v13 = 4;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_PLACE_LOOKUP"])
    {
      uint64_t v13 = 5;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_MERCHANT_LOOKUP"])
    {
      uint64_t v13 = 6;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_PLACE_REFINEMENT"])
    {
      uint64_t v13 = 7;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_SIRI_SEARCH"])
    {
      uint64_t v13 = 8;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_LOCATION_DIRECTED_SEARCH"])
    {
      uint64_t v13 = 9;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_AUTOCOMPLETE"])
    {
      uint64_t v13 = 10;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_BROWSE_CATEGORY_SUGGESTION"])
    {
      uint64_t v13 = 11;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_CATEGORY_SEARCH"])
    {
      uint64_t v13 = 12;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_POPULAR_NEARBY_SEARCH"])
    {
      uint64_t v13 = 13;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_ZERO_KEYWORD_CATEGORY_SUGGESTION"])
    {
      uint64_t v13 = 14;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_SEARCH_FIELD_PLACEHOLDER"])
    {
      uint64_t v13 = 15;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_BATCH_POPULAR_NEARBY_SEARCH"])
    {
      uint64_t v13 = 16;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_VENDOR_SPECIFIC_PLACE_REFINEMENT"])
    {
      uint64_t v13 = 17;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_NEARBY_SEARCH"])
    {
      uint64_t v13 = 18;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_ADDRESS_OBJECT_GEOCODING"])
    {
      uint64_t v13 = 19;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_ZERO_KEYWORD_WITH_SEARCH_RESULTS_SUGGESTION"])
    {
      uint64_t v13 = 20;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_EXTERNAL_TRANSIT_LOOKUP"])
    {
      uint64_t v13 = 21;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_FEATURE_ID_GEOCODING"])
    {
      uint64_t v13 = 22;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_MAPS_IDENTIFIER_PLACE_LOOKUP"])
    {
      uint64_t v13 = 23;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_DATASET_STATUS_CHECK"])
    {
      uint64_t v13 = 24;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_OFFLINE_AREA_LOOKUP"])
    {
      uint64_t v13 = 25;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_BATCH_REVERSE_GEOCODING"])
    {
      uint64_t v13 = 26;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_OFFLINE_SUGGESTED_REGIONS"])
    {
      uint64_t v13 = 27;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_OFFLINE_POLYGON_QUAD_NODES"])
    {
      uint64_t v13 = 28;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_OFFLINE_PROACTIVE_REGIONS"])
    {
      uint64_t v13 = 29;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_BRAND_LOOKUP"])
    {
      uint64_t v13 = 30;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_OFFLINE_UPDATE_MANIFEST"])
    {
      uint64_t v13 = 31;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_WIFI_FINGERPRINT_LOOKUP"])
    {
      uint64_t v13 = 32;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_INITIAL_OFFLINE_SUGGESTION"])
    {
      uint64_t v13 = 33;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_IP_GEO_LOOKUP"])
    {
      uint64_t v13 = 34;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_GROUND_VIEW_LABEL"])
    {
      uint64_t v13 = 35;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_BATCH_SPATIAL_LOOKUP"])
    {
      uint64_t v13 = 36;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_TRANSIT_VEHICLE_POSITION"])
    {
      uint64_t v13 = 37;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_PLACE_COLLECTION_LOOKUP"])
    {
      uint64_t v13 = 38;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_TRANSIT_SCHEDULE_LOOKUP"])
    {
      uint64_t v13 = 39;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_BATCH_CATEGORY_LOOKUP"])
    {
      uint64_t v13 = 40;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_BATCH_MERCHANT_LOOKUP_BRAND"])
    {
      uint64_t v13 = 41;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_CHILD_PLACE_LOOKUP_BY_CATEGORY"])
    {
      uint64_t v13 = 42;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_COLLECTION_SUGGESTION"])
    {
      uint64_t v13 = 43;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_MAPS_SEARCH_HOME"])
    {
      uint64_t v13 = 44;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_PLACE_QUESTIONNAIRE_LOOKUP"])
    {
      uint64_t v13 = 45;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_PUBLISHER_VIEW"])
    {
      uint64_t v13 = 46;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_ALL_COLLECTIONS_VIEW"])
    {
      uint64_t v13 = 47;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_AIRPORT_ENTITY_PLACE_LOOKUP"])
    {
      uint64_t v13 = 48;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_TERRITORY_LOOKUP"])
    {
      uint64_t v13 = 49;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_TRANSIT_NEARBY_SCHEDULE_LOOKUP"])
    {
      uint64_t v13 = 50;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_MAPS_HOME"])
    {
      uint64_t v13 = 51;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_ALL_GUIDES_LOCATIONS"])
    {
      uint64_t v13 = 52;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_GUIDES_HOME"])
    {
      uint64_t v13 = 53;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_EXTENDED_GEO_LOOKUP"])
    {
      uint64_t v13 = 54;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_QUERY_UNDERSTANDING"])
    {
      uint64_t v13 = 55;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_POI_AT_ADDRESS_LOOKUP"])
    {
      uint64_t v13 = 56;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_TRANSIT_NEARBY_PAYMENT_METHOD_LOOKUP"])
    {
      uint64_t v13 = 57;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_PLACECARD_ENRICHMENT"])
    {
      uint64_t v13 = 58;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_OFFLINE_REGION_NAME"])
    {
      uint64_t v13 = 59;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_SEARCH_CAPABILITIES"])
    {
      uint64_t v13 = 60;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_REFRESH_ID_LOOKUP"])
    {
      uint64_t v13 = 61;
    }
    else if ([v12 isEqualToString:@"REQUEST_TYPE_ADDRESS_RECOMMENDATION"])
    {
      uint64_t v13 = 62;
    }
    else
    {
      uint64_t v13 = 0;
    }

    goto LABEL_154;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v11 intValue];
LABEL_154:
    [a1 setPlaceRequestType:v13];
  }

  if (a3) {
    v14 = @"querySubstring";
  }
  else {
    v14 = @"query_substring";
  }
  v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = (void *)[v15 copy];
    [a1 setQuerySubstring:v16];
  }
  if (a3) {
    v17 = @"debugExperimentBranch";
  }
  else {
    v17 = @"debug_experiment_branch";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = [GEOABDebugPanelExperimentBranch alloc];
    if (a3) {
      uint64_t v20 = [(GEOABDebugPanelExperimentBranch *)v19 initWithJSON:v18];
    }
    else {
      uint64_t v20 = [(GEOABDebugPanelExperimentBranch *)v19 initWithDictionary:v18];
    }
    v21 = (void *)v20;
    [a1 setDebugExperimentBranch:v20];
  }
  if (a3) {
    v22 = @"offlineAbJson";
  }
  else {
    v22 = @"offline_ab_json";
  }
  v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v24 = (void *)[v23 copy];
    [a1 setOfflineAbJson:v24];
  }
LABEL_174:

  return a1;
}

- (GEOABExperimentAssignment)initWithJSON:(id)a3
{
  return (GEOABExperimentAssignment *)-[GEOABExperimentAssignment _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_619;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_620;
    }
    GEOABExperimentAssignmentReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOABDebugPanelExperimentBranch *)self->_debugExperimentBranch readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOABExperimentAssignmentIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOABExperimentAssignmentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOABExperimentAssignmentIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOABExperimentAssignment *)self readAll:0];
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      char flags = (char)self->_flags;
    }
    id v6 = v9;
    if (flags)
    {
      PBDataWriterWriteInt32Field();
      id v6 = v9;
    }
    if (self->_querySubstring)
    {
      PBDataWriterWriteStringField();
      id v6 = v9;
    }
    if (self->_debugExperimentBranch)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    if (self->_offlineAbJson)
    {
      PBDataWriterWriteStringField();
      id v6 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v6];
  }
}

- (void)copyTo:(id)a3
{
  id v6 = (id *)a3;
  [(GEOABExperimentAssignment *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 12) = self->_readerMarkPos;
  *((_DWORD *)v6 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 16) = self->_serviceType;
    *((unsigned char *)v6 + 68) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)v6 + 15) = self->_placeRequestType;
    *((unsigned char *)v6 + 68) |= 1u;
  }
  if (self->_querySubstring)
  {
    objc_msgSend(v6, "setQuerySubstring:");
    int v4 = v6;
  }
  if (self->_debugExperimentBranch)
  {
    objc_msgSend(v6, "setDebugExperimentBranch:");
    int v4 = v6;
  }
  if (self->_offlineAbJson)
  {
    objc_msgSend(v6, "setOfflineAbJson:");
    int v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOABExperimentAssignmentReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOABExperimentAssignment *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_serviceType;
    *(unsigned char *)(v5 + 68) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 60) = self->_placeRequestType;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_querySubstring copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  id v12 = [(GEOABDebugPanelExperimentBranch *)self->_debugExperimentBranch copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  uint64_t v14 = [(NSString *)self->_offlineAbJson copyWithZone:a3];
  v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  v16 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v16;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  [(GEOABExperimentAssignment *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_serviceType != *((_DWORD *)v4 + 16)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
LABEL_18:
    char v8 = 0;
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_placeRequestType != *((_DWORD *)v4 + 15)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_18;
  }
  querySubstring = self->_querySubstring;
  if ((unint64_t)querySubstring | *((void *)v4 + 5)
    && !-[NSString isEqual:](querySubstring, "isEqual:"))
  {
    goto LABEL_18;
  }
  debugExperimentBranch = self->_debugExperimentBranch;
  if ((unint64_t)debugExperimentBranch | *((void *)v4 + 3))
  {
    if (!-[GEOABDebugPanelExperimentBranch isEqual:](debugExperimentBranch, "isEqual:")) {
      goto LABEL_18;
    }
  }
  offlineAbJson = self->_offlineAbJson;
  if ((unint64_t)offlineAbJson | *((void *)v4 + 4)) {
    char v8 = -[NSString isEqual:](offlineAbJson, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  [(GEOABExperimentAssignment *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_serviceType;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_placeRequestType;
LABEL_6:
  uint64_t v5 = v4 ^ v3;
  NSUInteger v6 = [(NSString *)self->_querySubstring hash];
  unint64_t v7 = v5 ^ [(GEOABDebugPanelExperimentBranch *)self->_debugExperimentBranch hash] ^ v6;
  return v7 ^ [(NSString *)self->_offlineAbJson hash];
}

- (void)mergeFrom:(id)a3
{
  char v8 = (int *)a3;
  [v8 readAll:0];
  uint64_t v4 = v8;
  char v5 = *((unsigned char *)v8 + 68);
  if ((v5 & 2) != 0)
  {
    self->_serviceType = v8[16];
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v8 + 68);
  }
  if (v5)
  {
    self->_placeRequestType = v8[15];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v8 + 5))
  {
    -[GEOABExperimentAssignment setQuerySubstring:](self, "setQuerySubstring:");
    uint64_t v4 = v8;
  }
  debugExperimentBranch = self->_debugExperimentBranch;
  uint64_t v7 = *((void *)v4 + 3);
  if (debugExperimentBranch)
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[GEOABDebugPanelExperimentBranch mergeFrom:](debugExperimentBranch, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[GEOABExperimentAssignment setDebugExperimentBranch:](self, "setDebugExperimentBranch:");
  }
  uint64_t v4 = v8;
LABEL_13:
  if (*((void *)v4 + 4))
  {
    -[GEOABExperimentAssignment setOfflineAbJson:](self, "setOfflineAbJson:");
    uint64_t v4 = v8;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      char v5 = reader;
      objc_sync_enter(v5);
      GEOABExperimentAssignmentReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_624);
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
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x44u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOABExperimentAssignment *)self readAll:0];
    debugExperimentBranch = self->_debugExperimentBranch;
    [(GEOABDebugPanelExperimentBranch *)debugExperimentBranch clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_querySubstring, 0);
  objc_storeStrong((id *)&self->_offlineAbJson, 0);
  objc_storeStrong((id *)&self->_debugExperimentBranch, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end