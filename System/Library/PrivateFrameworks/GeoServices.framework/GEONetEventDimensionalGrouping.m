@interface GEONetEventDimensionalGrouping
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAppId;
- (BOOL)hasCountryCode;
- (BOOL)hasDataSetId;
- (BOOL)hasDay;
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)hasEventCount;
- (BOOL)hasHttpResponseCode;
- (BOOL)hasIsBackground;
- (BOOL)hasLatencyStats;
- (BOOL)hasManifestEnv;
- (BOOL)hasMonth;
- (BOOL)hasNetworkService;
- (BOOL)hasPlaceType;
- (BOOL)hasRequestingAppId;
- (BOOL)hasReusedConnection;
- (BOOL)hasRxBytesStats;
- (BOOL)hasSvcIp;
- (BOOL)hasTileSetId;
- (BOOL)hasTileSetStyle;
- (BOOL)hasTxBytesStats;
- (BOOL)hasUsedCellular;
- (BOOL)hasYear;
- (BOOL)isBackground;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)reusedConnection;
- (BOOL)usedCellular;
- (GEONetEventAggregateStats)latencyStats;
- (GEONetEventAggregateStats)rxBytesStats;
- (GEONetEventAggregateStats)txBytesStats;
- (GEONetEventDimensionalGrouping)init;
- (GEONetEventDimensionalGrouping)initWithData:(id)a3;
- (GEONetEventDimensionalGrouping)initWithDictionary:(id)a3;
- (GEONetEventDimensionalGrouping)initWithJSON:(id)a3;
- (NSString)appId;
- (NSString)countryCode;
- (NSString)errorDomain;
- (NSString)manifestEnv;
- (NSString)requestingAppId;
- (NSString)svcIp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)networkServiceAsString:(int)a3;
- (id)placeTypeAsString:(int)a3;
- (id)tileSetStyleAsString:(int)a3;
- (int)StringAsNetworkService:(id)a3;
- (int)StringAsPlaceType:(id)a3;
- (int)StringAsTileSetStyle:(id)a3;
- (int)networkService;
- (int)placeType;
- (int)tileSetStyle;
- (int64_t)errorCode;
- (unint64_t)eventCount;
- (unint64_t)hash;
- (unsigned)dataSetId;
- (unsigned)day;
- (unsigned)httpResponseCode;
- (unsigned)month;
- (unsigned)tileSetId;
- (unsigned)year;
- (void)_readAppId;
- (void)_readCountryCode;
- (void)_readErrorDomain;
- (void)_readLatencyStats;
- (void)_readManifestEnv;
- (void)_readRequestingAppId;
- (void)_readRxBytesStats;
- (void)_readSvcIp;
- (void)_readTxBytesStats;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAppId:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setDataSetId:(unsigned int)a3;
- (void)setDay:(unsigned int)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setErrorDomain:(id)a3;
- (void)setEventCount:(unint64_t)a3;
- (void)setHasDataSetId:(BOOL)a3;
- (void)setHasDay:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasEventCount:(BOOL)a3;
- (void)setHasHttpResponseCode:(BOOL)a3;
- (void)setHasIsBackground:(BOOL)a3;
- (void)setHasMonth:(BOOL)a3;
- (void)setHasNetworkService:(BOOL)a3;
- (void)setHasPlaceType:(BOOL)a3;
- (void)setHasReusedConnection:(BOOL)a3;
- (void)setHasTileSetId:(BOOL)a3;
- (void)setHasTileSetStyle:(BOOL)a3;
- (void)setHasUsedCellular:(BOOL)a3;
- (void)setHasYear:(BOOL)a3;
- (void)setHttpResponseCode:(unsigned int)a3;
- (void)setIsBackground:(BOOL)a3;
- (void)setLatencyStats:(id)a3;
- (void)setManifestEnv:(id)a3;
- (void)setMonth:(unsigned int)a3;
- (void)setNetworkService:(int)a3;
- (void)setPlaceType:(int)a3;
- (void)setRequestingAppId:(id)a3;
- (void)setReusedConnection:(BOOL)a3;
- (void)setRxBytesStats:(id)a3;
- (void)setSvcIp:(id)a3;
- (void)setTileSetId:(unsigned int)a3;
- (void)setTileSetStyle:(int)a3;
- (void)setTxBytesStats:(id)a3;
- (void)setUsedCellular:(BOOL)a3;
- (void)setYear:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEONetEventDimensionalGrouping

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_543;
  }
  a1 = (id)[a1 init];

  if (!a1) {
    goto LABEL_543;
  }
  v6 = [v5 objectForKeyedSubscript:@"year"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setYear:", objc_msgSend(v6, "unsignedIntValue"));
  }

  v7 = [v5 objectForKeyedSubscript:@"month"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setMonth:", objc_msgSend(v7, "unsignedIntValue"));
  }

  v8 = [v5 objectForKeyedSubscript:@"day"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDay:", objc_msgSend(v8, "unsignedIntValue"));
  }

  if (a3) {
    v9 = @"usedCellular";
  }
  else {
    v9 = @"used_cellular";
  }
  v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setUsedCellular:", objc_msgSend(v10, "BOOLValue"));
  }

  if (a3) {
    v11 = @"appId";
  }
  else {
    v11 = @"app_id";
  }
  v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = (void *)[v12 copy];
    [a1 setAppId:v13];
  }
  if (a3) {
    v14 = @"requestingAppId";
  }
  else {
    v14 = @"requesting_app_id";
  }
  v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = (void *)[v15 copy];
    [a1 setRequestingAppId:v16];
  }
  if (a3) {
    v17 = @"countryCode";
  }
  else {
    v17 = @"country_code";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = (void *)[v18 copy];
    [a1 setCountryCode:v19];
  }
  if (a3) {
    v20 = @"networkService";
  }
  else {
    v20 = @"network_service";
  }
  v21 = [v5 objectForKeyedSubscript:v20];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v22 = v21;
    if ([v22 isEqualToString:@"NETWORK_SERVICE_UNKNOWN"])
    {
      uint64_t v23 = 0;
    }
    else if ([v22 isEqualToString:@"REVERSE_GEOCODER"])
    {
      uint64_t v23 = 1;
    }
    else if ([v22 isEqualToString:@"FORWARD_GEOCODER"])
    {
      uint64_t v23 = 2;
    }
    else if ([v22 isEqualToString:@"SEARCH"])
    {
      uint64_t v23 = 3;
    }
    else if ([v22 isEqualToString:@"DIRECTIONS"])
    {
      uint64_t v23 = 4;
    }
    else if ([v22 isEqualToString:@"TILE"])
    {
      uint64_t v23 = 5;
    }
    else if ([v22 isEqualToString:@"TRAFFIC_ETA"])
    {
      uint64_t v23 = 6;
    }
    else if ([v22 isEqualToString:@"SIMPLE_ETA"])
    {
      uint64_t v23 = 7;
    }
    else if ([v22 isEqualToString:@"SUGGESTIONS"])
    {
      uint64_t v23 = 8;
    }
    else if ([v22 isEqualToString:@"BATCH_REVGEO"])
    {
      uint64_t v23 = 9;
    }
    else if ([v22 isEqualToString:@"MAP_MATCH"])
    {
      uint64_t v23 = 10;
    }
    else if ([v22 isEqualToString:@"ADDRESS_CORRECTION_INIT"])
    {
      uint64_t v23 = 11;
    }
    else if ([v22 isEqualToString:@"ADDRESS_CORRECTION_UPDATE"])
    {
      uint64_t v23 = 12;
    }
    else if ([v22 isEqualToString:@"PLACE_DATA"])
    {
      uint64_t v23 = 13;
    }
    else if ([v22 isEqualToString:@"RESOURCE_LOADER"])
    {
      uint64_t v23 = 14;
    }
    else if ([v22 isEqualToString:@"LOG_MESSAGE_USAGE"])
    {
      uint64_t v23 = 16;
    }
    else if ([v22 isEqualToString:@"LOCATION_SHIFT"])
    {
      uint64_t v23 = 17;
    }
    else if ([v22 isEqualToString:@"AB_ASSIGN"])
    {
      uint64_t v23 = 18;
    }
    else if ([v22 isEqualToString:@"MANIFEST"])
    {
      uint64_t v23 = 19;
    }
    else if ([v22 isEqualToString:@"REALTIME_TRAFFIC_PROBE"])
    {
      uint64_t v23 = 20;
    }
    else if ([v22 isEqualToString:@"BATCH_TRAFFIC_PROBE"])
    {
      uint64_t v23 = 21;
    }
    else if ([v22 isEqualToString:@"SYNC"])
    {
      uint64_t v23 = 22;
    }
    else if ([v22 isEqualToString:@"WIFI_QUALITY"])
    {
      uint64_t v23 = 23;
    }
    else if ([v22 isEqualToString:@"NETWORK_DEFAULTS"])
    {
      uint64_t v23 = 24;
    }
    else if ([v22 isEqualToString:@"MUNIN_RESOURCE"])
    {
      uint64_t v23 = 25;
    }
    else if ([v22 isEqualToString:@"JUNCTION_VIEW"])
    {
      uint64_t v23 = 26;
    }
    else if ([v22 isEqualToString:@"WIFI_TILE"])
    {
      uint64_t v23 = 27;
    }
    else if ([v22 isEqualToString:@"INCIDENT"])
    {
      uint64_t v23 = 28;
    }
    else
    {
      uint64_t v23 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_94;
    }
    uint64_t v23 = [v21 intValue];
  }
  [a1 setNetworkService:v23];
LABEL_94:

  if (a3) {
    v24 = @"placeType";
  }
  else {
    v24 = @"place_type";
  }
  v25 = [v5 objectForKeyedSubscript:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v26 = v25;
    if ([v26 isEqualToString:@"REQUEST_TYPE_UNKNOWN"])
    {
      uint64_t v27 = 0;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_SEARCH"])
    {
      uint64_t v27 = 1;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_GEOCODING"])
    {
      uint64_t v27 = 2;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_CANONICAL_LOCATION_SEARCH"])
    {
      uint64_t v27 = 3;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_REVERSE_GEOCODING"])
    {
      uint64_t v27 = 4;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_PLACE_LOOKUP"])
    {
      uint64_t v27 = 5;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_MERCHANT_LOOKUP"])
    {
      uint64_t v27 = 6;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_PLACE_REFINEMENT"])
    {
      uint64_t v27 = 7;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_SIRI_SEARCH"])
    {
      uint64_t v27 = 8;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_LOCATION_DIRECTED_SEARCH"])
    {
      uint64_t v27 = 9;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_AUTOCOMPLETE"])
    {
      uint64_t v27 = 10;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_BROWSE_CATEGORY_SUGGESTION"])
    {
      uint64_t v27 = 11;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_CATEGORY_SEARCH"])
    {
      uint64_t v27 = 12;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_POPULAR_NEARBY_SEARCH"])
    {
      uint64_t v27 = 13;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_ZERO_KEYWORD_CATEGORY_SUGGESTION"])
    {
      uint64_t v27 = 14;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_SEARCH_FIELD_PLACEHOLDER"])
    {
      uint64_t v27 = 15;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_BATCH_POPULAR_NEARBY_SEARCH"])
    {
      uint64_t v27 = 16;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_VENDOR_SPECIFIC_PLACE_REFINEMENT"])
    {
      uint64_t v27 = 17;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_NEARBY_SEARCH"])
    {
      uint64_t v27 = 18;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_ADDRESS_OBJECT_GEOCODING"])
    {
      uint64_t v27 = 19;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_ZERO_KEYWORD_WITH_SEARCH_RESULTS_SUGGESTION"])
    {
      uint64_t v27 = 20;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_EXTERNAL_TRANSIT_LOOKUP"])
    {
      uint64_t v27 = 21;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_FEATURE_ID_GEOCODING"])
    {
      uint64_t v27 = 22;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_MAPS_IDENTIFIER_PLACE_LOOKUP"])
    {
      uint64_t v27 = 23;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_DATASET_STATUS_CHECK"])
    {
      uint64_t v27 = 24;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_OFFLINE_AREA_LOOKUP"])
    {
      uint64_t v27 = 25;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_BATCH_REVERSE_GEOCODING"])
    {
      uint64_t v27 = 26;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_OFFLINE_SUGGESTED_REGIONS"])
    {
      uint64_t v27 = 27;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_OFFLINE_POLYGON_QUAD_NODES"])
    {
      uint64_t v27 = 28;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_OFFLINE_PROACTIVE_REGIONS"])
    {
      uint64_t v27 = 29;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_BRAND_LOOKUP"])
    {
      uint64_t v27 = 30;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_OFFLINE_UPDATE_MANIFEST"])
    {
      uint64_t v27 = 31;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_WIFI_FINGERPRINT_LOOKUP"])
    {
      uint64_t v27 = 32;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_INITIAL_OFFLINE_SUGGESTION"])
    {
      uint64_t v27 = 33;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_IP_GEO_LOOKUP"])
    {
      uint64_t v27 = 34;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_GROUND_VIEW_LABEL"])
    {
      uint64_t v27 = 35;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_BATCH_SPATIAL_LOOKUP"])
    {
      uint64_t v27 = 36;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_TRANSIT_VEHICLE_POSITION"])
    {
      uint64_t v27 = 37;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_PLACE_COLLECTION_LOOKUP"])
    {
      uint64_t v27 = 38;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_TRANSIT_SCHEDULE_LOOKUP"])
    {
      uint64_t v27 = 39;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_BATCH_CATEGORY_LOOKUP"])
    {
      uint64_t v27 = 40;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_BATCH_MERCHANT_LOOKUP_BRAND"])
    {
      uint64_t v27 = 41;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_CHILD_PLACE_LOOKUP_BY_CATEGORY"])
    {
      uint64_t v27 = 42;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_COLLECTION_SUGGESTION"])
    {
      uint64_t v27 = 43;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_MAPS_SEARCH_HOME"])
    {
      uint64_t v27 = 44;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_PLACE_QUESTIONNAIRE_LOOKUP"])
    {
      uint64_t v27 = 45;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_PUBLISHER_VIEW"])
    {
      uint64_t v27 = 46;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_ALL_COLLECTIONS_VIEW"])
    {
      uint64_t v27 = 47;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_AIRPORT_ENTITY_PLACE_LOOKUP"])
    {
      uint64_t v27 = 48;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_TERRITORY_LOOKUP"])
    {
      uint64_t v27 = 49;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_TRANSIT_NEARBY_SCHEDULE_LOOKUP"])
    {
      uint64_t v27 = 50;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_MAPS_HOME"])
    {
      uint64_t v27 = 51;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_ALL_GUIDES_LOCATIONS"])
    {
      uint64_t v27 = 52;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_GUIDES_HOME"])
    {
      uint64_t v27 = 53;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_EXTENDED_GEO_LOOKUP"])
    {
      uint64_t v27 = 54;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_QUERY_UNDERSTANDING"])
    {
      uint64_t v27 = 55;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_POI_AT_ADDRESS_LOOKUP"])
    {
      uint64_t v27 = 56;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_TRANSIT_NEARBY_PAYMENT_METHOD_LOOKUP"])
    {
      uint64_t v27 = 57;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_PLACECARD_ENRICHMENT"])
    {
      uint64_t v27 = 58;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_OFFLINE_REGION_NAME"])
    {
      uint64_t v27 = 59;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_SEARCH_CAPABILITIES"])
    {
      uint64_t v27 = 60;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_REFRESH_ID_LOOKUP"])
    {
      uint64_t v27 = 61;
    }
    else if ([v26 isEqualToString:@"REQUEST_TYPE_ADDRESS_RECOMMENDATION"])
    {
      uint64_t v27 = 62;
    }
    else
    {
      uint64_t v27 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_229;
    }
    uint64_t v27 = [v25 intValue];
  }
  [a1 setPlaceType:v27];
LABEL_229:

  if (a3) {
    v28 = @"tileSetId";
  }
  else {
    v28 = @"tile_set_id";
  }
  v29 = [v5 objectForKeyedSubscript:v28];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTileSetId:", objc_msgSend(v29, "unsignedIntValue"));
  }

  if (a3) {
    v30 = @"dataSetId";
  }
  else {
    v30 = @"data_set_id";
  }
  v31 = [v5 objectForKeyedSubscript:v30];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDataSetId:", objc_msgSend(v31, "unsignedIntValue"));
  }

  if (a3) {
    v32 = @"tileSetStyle";
  }
  else {
    v32 = @"tile_set_style";
  }
  v33 = [v5 objectForKeyedSubscript:v32];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v34 = v33;
    if ([v34 isEqualToString:@"RASTER_STANDARD"])
    {
      uint64_t v35 = 0;
    }
    else if ([v34 isEqualToString:@"VECTOR_STANDARD"])
    {
      uint64_t v35 = 1;
    }
    else if ([v34 isEqualToString:@"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER"])
    {
      uint64_t v35 = 2;
    }
    else if ([v34 isEqualToString:@"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER"])
    {
      uint64_t v35 = 3;
    }
    else if ([v34 isEqualToString:@"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER"])
    {
      uint64_t v35 = 4;
    }
    else if ([v34 isEqualToString:@"RASTER_STANDARD_BACKGROUND"])
    {
      uint64_t v35 = 5;
    }
    else if ([v34 isEqualToString:@"RASTER_HYBRID"])
    {
      uint64_t v35 = 6;
    }
    else if ([v34 isEqualToString:@"RASTER_SATELLITE"])
    {
      uint64_t v35 = 7;
    }
    else if ([v34 isEqualToString:@"RASTER_TERRAIN"])
    {
      uint64_t v35 = 8;
    }
    else if ([v34 isEqualToString:@"VECTOR_BUILDINGS"])
    {
      uint64_t v35 = 11;
    }
    else if ([v34 isEqualToString:@"VECTOR_TRAFFIC"])
    {
      uint64_t v35 = 12;
    }
    else if ([v34 isEqualToString:@"VECTOR_POI"])
    {
      uint64_t v35 = 13;
    }
    else if ([v34 isEqualToString:@"SPUTNIK_METADATA"])
    {
      uint64_t v35 = 14;
    }
    else if ([v34 isEqualToString:@"SPUTNIK_C3M"])
    {
      uint64_t v35 = 15;
    }
    else if ([v34 isEqualToString:@"SPUTNIK_DSM"])
    {
      uint64_t v35 = 16;
    }
    else if ([v34 isEqualToString:@"SPUTNIK_DSM_GLOBAL"])
    {
      uint64_t v35 = 17;
    }
    else if ([v34 isEqualToString:@"VECTOR_REALISTIC"])
    {
      uint64_t v35 = 18;
    }
    else if ([v34 isEqualToString:@"VECTOR_LEGACY_REALISTIC"])
    {
      uint64_t v35 = 19;
    }
    else if ([v34 isEqualToString:@"VECTOR_ROADS"])
    {
      uint64_t v35 = 20;
    }
    else if ([v34 isEqualToString:@"RASTER_VEGETATION"])
    {
      uint64_t v35 = 21;
    }
    else if ([v34 isEqualToString:@"VECTOR_TRAFFIC_SKELETON"])
    {
      uint64_t v35 = 22;
    }
    else if ([v34 isEqualToString:@"RASTER_COASTLINE_MASK"])
    {
      uint64_t v35 = 23;
    }
    else if ([v34 isEqualToString:@"RASTER_HILLSHADE"])
    {
      uint64_t v35 = 24;
    }
    else if ([v34 isEqualToString:@"VECTOR_TRAFFIC_WITH_GREEN"])
    {
      uint64_t v35 = 25;
    }
    else if ([v34 isEqualToString:@"VECTOR_TRAFFIC_STATIC"])
    {
      uint64_t v35 = 26;
    }
    else if ([v34 isEqualToString:@"RASTER_COASTLINE_DROP_MASK"])
    {
      uint64_t v35 = 27;
    }
    else if ([v34 isEqualToString:@"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL"])
    {
      uint64_t v35 = 28;
    }
    else if ([v34 isEqualToString:@"VECTOR_SPEED_PROFILES"])
    {
      uint64_t v35 = 29;
    }
    else if ([v34 isEqualToString:@"VECTOR_VENUES"])
    {
      uint64_t v35 = 30;
    }
    else if ([v34 isEqualToString:@"RASTER_DOWN_SAMPLED"])
    {
      uint64_t v35 = 31;
    }
    else if ([v34 isEqualToString:@"RASTER_COLOR_BALANCED"])
    {
      uint64_t v35 = 32;
    }
    else if ([v34 isEqualToString:@"RASTER_SATELLITE_NIGHT"])
    {
      uint64_t v35 = 33;
    }
    else if ([v34 isEqualToString:@"SPUTNIK_VECTOR_BORDER"])
    {
      uint64_t v35 = 34;
    }
    else if ([v34 isEqualToString:@"RASTER_SATELLITE_DIGITIZE"])
    {
      uint64_t v35 = 35;
    }
    else if ([v34 isEqualToString:@"RASTER_HILLSHADE_PARKS"])
    {
      uint64_t v35 = 36;
    }
    else if ([v34 isEqualToString:@"VECTOR_TRANSIT"])
    {
      uint64_t v35 = 37;
    }
    else if ([v34 isEqualToString:@"RASTER_STANDARD_BASE"])
    {
      uint64_t v35 = 38;
    }
    else if ([v34 isEqualToString:@"RASTER_STANDARD_LABELS"])
    {
      uint64_t v35 = 39;
    }
    else if ([v34 isEqualToString:@"RASTER_HYBRID_ROADS"])
    {
      uint64_t v35 = 40;
    }
    else if ([v34 isEqualToString:@"RASTER_HYBRID_LABELS"])
    {
      uint64_t v35 = 41;
    }
    else if ([v34 isEqualToString:@"FLYOVER_C3M_MESH"])
    {
      uint64_t v35 = 42;
    }
    else if ([v34 isEqualToString:@"FLYOVER_C3M_JPEG_TEXTURE"])
    {
      uint64_t v35 = 43;
    }
    else if ([v34 isEqualToString:@"FLYOVER_C3M_ASTC_TEXTURE"])
    {
      uint64_t v35 = 44;
    }
    else if ([v34 isEqualToString:@"RASTER_SATELLITE_ASTC"])
    {
      uint64_t v35 = 45;
    }
    else if ([v34 isEqualToString:@"RASTER_HYBRID_ROADS_AND_LABELS"])
    {
      uint64_t v35 = 46;
    }
    else if ([v34 isEqualToString:@"VECTOR_TRANSIT_SELECTION"])
    {
      uint64_t v35 = 47;
    }
    else if ([v34 isEqualToString:@"VECTOR_COVERAGE"])
    {
      uint64_t v35 = 48;
    }
    else if ([v34 isEqualToString:@"FLYOVER_METADATA"])
    {
      uint64_t v35 = 52;
    }
    else if ([v34 isEqualToString:@"VECTOR_ROAD_NETWORK"])
    {
      uint64_t v35 = 53;
    }
    else if ([v34 isEqualToString:@"VECTOR_LAND_COVER"])
    {
      uint64_t v35 = 54;
    }
    else if ([v34 isEqualToString:@"VECTOR_DEBUG"])
    {
      uint64_t v35 = 55;
    }
    else if ([v34 isEqualToString:@"VECTOR_STREET_POI"])
    {
      uint64_t v35 = 56;
    }
    else if ([v34 isEqualToString:@"MUNIN_METADATA"])
    {
      uint64_t v35 = 57;
    }
    else if ([v34 isEqualToString:@"VECTOR_SPR_MERCATOR"])
    {
      uint64_t v35 = 58;
    }
    else if ([v34 isEqualToString:@"VECTOR_SPR_MODELS"])
    {
      uint64_t v35 = 59;
    }
    else if ([v34 isEqualToString:@"VECTOR_SPR_MATERIALS"])
    {
      uint64_t v35 = 60;
    }
    else if ([v34 isEqualToString:@"VECTOR_SPR_METADATA"])
    {
      uint64_t v35 = 61;
    }
    else if ([v34 isEqualToString:@"VECTOR_TRACKS"])
    {
      uint64_t v35 = 62;
    }
    else if ([v34 isEqualToString:@"VECTOR_RESERVED_2"])
    {
      uint64_t v35 = 63;
    }
    else if ([v34 isEqualToString:@"VECTOR_STREET_LANDMARKS"])
    {
      uint64_t v35 = 64;
    }
    else if ([v34 isEqualToString:@"COARSE_LOCATION_POLYGONS"])
    {
      uint64_t v35 = 65;
    }
    else if ([v34 isEqualToString:@"VECTOR_SPR_ROADS"])
    {
      uint64_t v35 = 66;
    }
    else if ([v34 isEqualToString:@"VECTOR_SPR_STANDARD"])
    {
      uint64_t v35 = 67;
    }
    else if ([v34 isEqualToString:@"VECTOR_POI_V2"])
    {
      uint64_t v35 = 68;
    }
    else if ([v34 isEqualToString:@"VECTOR_POLYGON_SELECTION"])
    {
      uint64_t v35 = 69;
    }
    else if ([v34 isEqualToString:@"VL_METADATA"])
    {
      uint64_t v35 = 70;
    }
    else if ([v34 isEqualToString:@"VL_DATA"])
    {
      uint64_t v35 = 71;
    }
    else if ([v34 isEqualToString:@"PROACTIVE_APP_CLIP"])
    {
      uint64_t v35 = 72;
    }
    else if ([v34 isEqualToString:@"VECTOR_BUILDINGS_V2"])
    {
      uint64_t v35 = 73;
    }
    else if ([v34 isEqualToString:@"POI_BUSYNESS"])
    {
      uint64_t v35 = 74;
    }
    else if ([v34 isEqualToString:@"POI_DP_BUSYNESS"])
    {
      uint64_t v35 = 75;
    }
    else if ([v34 isEqualToString:@"SMART_INTERFACE_SELECTION"])
    {
      uint64_t v35 = 76;
    }
    else if ([v34 isEqualToString:@"VECTOR_ASSETS"])
    {
      uint64_t v35 = 77;
    }
    else if ([v34 isEqualToString:@"SPR_ASSET_METADATA"])
    {
      uint64_t v35 = 78;
    }
    else if ([v34 isEqualToString:@"VECTOR_SPR_POLAR"])
    {
      uint64_t v35 = 79;
    }
    else if ([v34 isEqualToString:@"SMART_DATA_MODE"])
    {
      uint64_t v35 = 80;
    }
    else if ([v34 isEqualToString:@"CELLULAR_PERFORMANCE_SCORE"])
    {
      uint64_t v35 = 81;
    }
    else if ([v34 isEqualToString:@"VECTOR_SPR_MODELS_OCCLUSION"])
    {
      uint64_t v35 = 82;
    }
    else if ([v34 isEqualToString:@"VECTOR_TOPOGRAPHIC"])
    {
      uint64_t v35 = 83;
    }
    else if ([v34 isEqualToString:@"VECTOR_POI_V2_UPDATE"])
    {
      uint64_t v35 = 84;
    }
    else if ([v34 isEqualToString:@"VECTOR_LIVE_DATA_UPDATES"])
    {
      uint64_t v35 = 85;
    }
    else if ([v34 isEqualToString:@"VECTOR_TRAFFIC_V2"])
    {
      uint64_t v35 = 86;
    }
    else if ([v34 isEqualToString:@"VECTOR_ROAD_SELECTION"])
    {
      uint64_t v35 = 87;
    }
    else if ([v34 isEqualToString:@"VECTOR_REGION_METADATA"])
    {
      uint64_t v35 = 88;
    }
    else if ([v34 isEqualToString:@"RAY_TRACING"])
    {
      uint64_t v35 = 89;
    }
    else if ([v34 isEqualToString:@"VECTOR_CONTOURS"])
    {
      uint64_t v35 = 90;
    }
    else if ([v34 isEqualToString:@"RASTER_SATELLITE_POLAR"])
    {
      uint64_t v35 = 91;
    }
    else if ([v34 isEqualToString:@"VMAP4_ELEVATION"])
    {
      uint64_t v35 = 92;
    }
    else if ([v34 isEqualToString:@"VMAP4_ELEVATION_POLAR"])
    {
      uint64_t v35 = 93;
    }
    else if ([v34 isEqualToString:@"CELLULAR_COVERAGE_PLMN"])
    {
      uint64_t v35 = 94;
    }
    else if ([v34 isEqualToString:@"RASTER_SATELLITE_POLAR_NIGHT"])
    {
      uint64_t v35 = 95;
    }
    else if ([v34 isEqualToString:@"UNUSED_96"])
    {
      uint64_t v35 = 96;
    }
    else if ([v34 isEqualToString:@"UNUSED_97"])
    {
      uint64_t v35 = 97;
    }
    else if ([v34 isEqualToString:@"UNUSED_98"])
    {
      uint64_t v35 = 98;
    }
    else if ([v34 isEqualToString:@"UNUSED_99"])
    {
      uint64_t v35 = 99;
    }
    else if ([v34 isEqualToString:@"UNUSED_100"])
    {
      uint64_t v35 = 100;
    }
    else if ([v34 isEqualToString:@"UNUSED_101"])
    {
      uint64_t v35 = 101;
    }
    else if ([v34 isEqualToString:@"UNUSED_102"])
    {
      uint64_t v35 = 102;
    }
    else if ([v34 isEqualToString:@"UNUSED_103"])
    {
      uint64_t v35 = 103;
    }
    else if ([v34 isEqualToString:@"UNUSED_104"])
    {
      uint64_t v35 = 104;
    }
    else if ([v34 isEqualToString:@"UNUSED_105"])
    {
      uint64_t v35 = 105;
    }
    else if ([v34 isEqualToString:@"UNUSED_106"])
    {
      uint64_t v35 = 106;
    }
    else if ([v34 isEqualToString:@"UNUSED_107"])
    {
      uint64_t v35 = 107;
    }
    else if ([v34 isEqualToString:@"UNUSED_108"])
    {
      uint64_t v35 = 108;
    }
    else if ([v34 isEqualToString:@"UNUSED_109"])
    {
      uint64_t v35 = 109;
    }
    else if ([v34 isEqualToString:@"UNUSED_110"])
    {
      uint64_t v35 = 110;
    }
    else if ([v34 isEqualToString:@"UNUSED_111"])
    {
      uint64_t v35 = 111;
    }
    else if ([v34 isEqualToString:@"UNUSED_112"])
    {
      uint64_t v35 = 112;
    }
    else if ([v34 isEqualToString:@"UNUSED_113"])
    {
      uint64_t v35 = 113;
    }
    else if ([v34 isEqualToString:@"UNUSED_114"])
    {
      uint64_t v35 = 114;
    }
    else if ([v34 isEqualToString:@"UNUSED_115"])
    {
      uint64_t v35 = 115;
    }
    else if ([v34 isEqualToString:@"UNUSED_116"])
    {
      uint64_t v35 = 116;
    }
    else if ([v34 isEqualToString:@"UNUSED_117"])
    {
      uint64_t v35 = 117;
    }
    else if ([v34 isEqualToString:@"UNUSED_118"])
    {
      uint64_t v35 = 118;
    }
    else if ([v34 isEqualToString:@"UNUSED_119"])
    {
      uint64_t v35 = 119;
    }
    else
    {
      uint64_t v35 = 0;
    }

    goto LABEL_477;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v35 = [v33 intValue];
LABEL_477:
    [a1 setTileSetStyle:v35];
  }

  if (a3) {
    v36 = @"svcIp";
  }
  else {
    v36 = @"svc_ip";
  }
  v37 = [v5 objectForKeyedSubscript:v36];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v38 = (void *)[v37 copy];
    [a1 setSvcIp:v38];
  }
  if (a3) {
    v39 = @"errorDomain";
  }
  else {
    v39 = @"error_domain";
  }
  v40 = [v5 objectForKeyedSubscript:v39];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v41 = (void *)[v40 copy];
    [a1 setErrorDomain:v41];
  }
  if (a3) {
    v42 = @"errorCode";
  }
  else {
    v42 = @"error_code";
  }
  v43 = [v5 objectForKeyedSubscript:v42];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setErrorCode:", objc_msgSend(v43, "longLongValue"));
  }

  if (a3) {
    v44 = @"manifestEnv";
  }
  else {
    v44 = @"manifest_env";
  }
  v45 = [v5 objectForKeyedSubscript:v44];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v46 = (void *)[v45 copy];
    [a1 setManifestEnv:v46];
  }
  if (a3) {
    v47 = @"httpResponseCode";
  }
  else {
    v47 = @"http_response_code";
  }
  v48 = [v5 objectForKeyedSubscript:v47];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setHttpResponseCode:", objc_msgSend(v48, "unsignedIntValue"));
  }

  if (a3) {
    v49 = @"reusedConnection";
  }
  else {
    v49 = @"reused_connection";
  }
  v50 = [v5 objectForKeyedSubscript:v49];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setReusedConnection:", objc_msgSend(v50, "BOOLValue"));
  }

  if (a3) {
    v51 = @"isBackground";
  }
  else {
    v51 = @"is_background";
  }
  v52 = [v5 objectForKeyedSubscript:v51];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsBackground:", objc_msgSend(v52, "BOOLValue"));
  }

  if (a3) {
    v53 = @"latencyStats";
  }
  else {
    v53 = @"latency_stats";
  }
  v54 = [v5 objectForKeyedSubscript:v53];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v55 = [GEONetEventAggregateStats alloc];
    if (a3) {
      uint64_t v56 = [(GEONetEventAggregateStats *)v55 initWithJSON:v54];
    }
    else {
      uint64_t v56 = [(GEONetEventAggregateStats *)v55 initWithDictionary:v54];
    }
    v57 = (void *)v56;
    [a1 setLatencyStats:v56];
  }
  if (a3) {
    v58 = @"txBytesStats";
  }
  else {
    v58 = @"tx_bytes_stats";
  }
  v59 = [v5 objectForKeyedSubscript:v58];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v60 = [GEONetEventAggregateStats alloc];
    if (a3) {
      uint64_t v61 = [(GEONetEventAggregateStats *)v60 initWithJSON:v59];
    }
    else {
      uint64_t v61 = [(GEONetEventAggregateStats *)v60 initWithDictionary:v59];
    }
    v62 = (void *)v61;
    [a1 setTxBytesStats:v61];
  }
  if (a3) {
    v63 = @"rxBytesStats";
  }
  else {
    v63 = @"rx_bytes_stats";
  }
  v64 = [v5 objectForKeyedSubscript:v63];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v65 = [GEONetEventAggregateStats alloc];
    if (a3) {
      uint64_t v66 = [(GEONetEventAggregateStats *)v65 initWithJSON:v64];
    }
    else {
      uint64_t v66 = [(GEONetEventAggregateStats *)v65 initWithDictionary:v64];
    }
    v67 = (void *)v66;
    [a1 setRxBytesStats:v66];
  }
  if (a3) {
    v68 = @"eventCount";
  }
  else {
    v68 = @"event_count";
  }
  v69 = [v5 objectForKeyedSubscript:v68];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setEventCount:", objc_msgSend(v69, "unsignedLongLongValue"));
  }

  a1 = a1;
LABEL_543:

  return a1;
}

- (int)StringAsTileSetStyle:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RASTER_STANDARD"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VECTOR_STANDARD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RASTER_STANDARD_BACKGROUND"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RASTER_HYBRID"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"RASTER_SATELLITE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"RASTER_TERRAIN"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"VECTOR_BUILDINGS"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"VECTOR_POI"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SPUTNIK_METADATA"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"SPUTNIK_C3M"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SPUTNIK_DSM"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"SPUTNIK_DSM_GLOBAL"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"VECTOR_REALISTIC"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"VECTOR_LEGACY_REALISTIC"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"VECTOR_ROADS"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"RASTER_VEGETATION"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC_SKELETON"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"RASTER_COASTLINE_MASK"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"RASTER_HILLSHADE"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC_WITH_GREEN"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC_STATIC"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"RASTER_COASTLINE_DROP_MASK"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPEED_PROFILES"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"VECTOR_VENUES"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"RASTER_DOWN_SAMPLED"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"RASTER_COLOR_BALANCED"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"RASTER_SATELLITE_NIGHT"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"SPUTNIK_VECTOR_BORDER"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"RASTER_SATELLITE_DIGITIZE"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"RASTER_HILLSHADE_PARKS"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRANSIT"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"RASTER_STANDARD_BASE"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"RASTER_STANDARD_LABELS"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"RASTER_HYBRID_ROADS"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"RASTER_HYBRID_LABELS"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"FLYOVER_C3M_MESH"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"FLYOVER_C3M_JPEG_TEXTURE"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"FLYOVER_C3M_ASTC_TEXTURE"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"RASTER_SATELLITE_ASTC"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"RASTER_HYBRID_ROADS_AND_LABELS"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRANSIT_SELECTION"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"VECTOR_COVERAGE"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"FLYOVER_METADATA"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"VECTOR_ROAD_NETWORK"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"VECTOR_LAND_COVER"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"VECTOR_DEBUG"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"VECTOR_STREET_POI"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"MUNIN_METADATA"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPR_MERCATOR"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPR_MODELS"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPR_MATERIALS"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPR_METADATA"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRACKS"])
  {
    int v4 = 62;
  }
  else if ([v3 isEqualToString:@"VECTOR_RESERVED_2"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"VECTOR_STREET_LANDMARKS"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"COARSE_LOCATION_POLYGONS"])
  {
    int v4 = 65;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPR_ROADS"])
  {
    int v4 = 66;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPR_STANDARD"])
  {
    int v4 = 67;
  }
  else if ([v3 isEqualToString:@"VECTOR_POI_V2"])
  {
    int v4 = 68;
  }
  else if ([v3 isEqualToString:@"VECTOR_POLYGON_SELECTION"])
  {
    int v4 = 69;
  }
  else if ([v3 isEqualToString:@"VL_METADATA"])
  {
    int v4 = 70;
  }
  else if ([v3 isEqualToString:@"VL_DATA"])
  {
    int v4 = 71;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_APP_CLIP"])
  {
    int v4 = 72;
  }
  else if ([v3 isEqualToString:@"VECTOR_BUILDINGS_V2"])
  {
    int v4 = 73;
  }
  else if ([v3 isEqualToString:@"POI_BUSYNESS"])
  {
    int v4 = 74;
  }
  else if ([v3 isEqualToString:@"POI_DP_BUSYNESS"])
  {
    int v4 = 75;
  }
  else if ([v3 isEqualToString:@"SMART_INTERFACE_SELECTION"])
  {
    int v4 = 76;
  }
  else if ([v3 isEqualToString:@"VECTOR_ASSETS"])
  {
    int v4 = 77;
  }
  else if ([v3 isEqualToString:@"SPR_ASSET_METADATA"])
  {
    int v4 = 78;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPR_POLAR"])
  {
    int v4 = 79;
  }
  else if ([v3 isEqualToString:@"SMART_DATA_MODE"])
  {
    int v4 = 80;
  }
  else if ([v3 isEqualToString:@"CELLULAR_PERFORMANCE_SCORE"])
  {
    int v4 = 81;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPR_MODELS_OCCLUSION"])
  {
    int v4 = 82;
  }
  else if ([v3 isEqualToString:@"VECTOR_TOPOGRAPHIC"])
  {
    int v4 = 83;
  }
  else if ([v3 isEqualToString:@"VECTOR_POI_V2_UPDATE"])
  {
    int v4 = 84;
  }
  else if ([v3 isEqualToString:@"VECTOR_LIVE_DATA_UPDATES"])
  {
    int v4 = 85;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC_V2"])
  {
    int v4 = 86;
  }
  else if ([v3 isEqualToString:@"VECTOR_ROAD_SELECTION"])
  {
    int v4 = 87;
  }
  else if ([v3 isEqualToString:@"VECTOR_REGION_METADATA"])
  {
    int v4 = 88;
  }
  else if ([v3 isEqualToString:@"RAY_TRACING"])
  {
    int v4 = 89;
  }
  else if ([v3 isEqualToString:@"VECTOR_CONTOURS"])
  {
    int v4 = 90;
  }
  else if ([v3 isEqualToString:@"RASTER_SATELLITE_POLAR"])
  {
    int v4 = 91;
  }
  else if ([v3 isEqualToString:@"VMAP4_ELEVATION"])
  {
    int v4 = 92;
  }
  else if ([v3 isEqualToString:@"VMAP4_ELEVATION_POLAR"])
  {
    int v4 = 93;
  }
  else if ([v3 isEqualToString:@"CELLULAR_COVERAGE_PLMN"])
  {
    int v4 = 94;
  }
  else if ([v3 isEqualToString:@"RASTER_SATELLITE_POLAR_NIGHT"])
  {
    int v4 = 95;
  }
  else if ([v3 isEqualToString:@"UNUSED_96"])
  {
    int v4 = 96;
  }
  else if ([v3 isEqualToString:@"UNUSED_97"])
  {
    int v4 = 97;
  }
  else if ([v3 isEqualToString:@"UNUSED_98"])
  {
    int v4 = 98;
  }
  else if ([v3 isEqualToString:@"UNUSED_99"])
  {
    int v4 = 99;
  }
  else if ([v3 isEqualToString:@"UNUSED_100"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"UNUSED_101"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"UNUSED_102"])
  {
    int v4 = 102;
  }
  else if ([v3 isEqualToString:@"UNUSED_103"])
  {
    int v4 = 103;
  }
  else if ([v3 isEqualToString:@"UNUSED_104"])
  {
    int v4 = 104;
  }
  else if ([v3 isEqualToString:@"UNUSED_105"])
  {
    int v4 = 105;
  }
  else if ([v3 isEqualToString:@"UNUSED_106"])
  {
    int v4 = 106;
  }
  else if ([v3 isEqualToString:@"UNUSED_107"])
  {
    int v4 = 107;
  }
  else if ([v3 isEqualToString:@"UNUSED_108"])
  {
    int v4 = 108;
  }
  else if ([v3 isEqualToString:@"UNUSED_109"])
  {
    int v4 = 109;
  }
  else if ([v3 isEqualToString:@"UNUSED_110"])
  {
    int v4 = 110;
  }
  else if ([v3 isEqualToString:@"UNUSED_111"])
  {
    int v4 = 111;
  }
  else if ([v3 isEqualToString:@"UNUSED_112"])
  {
    int v4 = 112;
  }
  else if ([v3 isEqualToString:@"UNUSED_113"])
  {
    int v4 = 113;
  }
  else if ([v3 isEqualToString:@"UNUSED_114"])
  {
    int v4 = 114;
  }
  else if ([v3 isEqualToString:@"UNUSED_115"])
  {
    int v4 = 115;
  }
  else if ([v3 isEqualToString:@"UNUSED_116"])
  {
    int v4 = 116;
  }
  else if ([v3 isEqualToString:@"UNUSED_117"])
  {
    int v4 = 117;
  }
  else if ([v3 isEqualToString:@"UNUSED_118"])
  {
    int v4 = 118;
  }
  else if ([v3 isEqualToString:@"UNUSED_119"])
  {
    int v4 = 119;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)mergeFrom:(id)a3
{
  id v14 = a3;
  [v14 readAll:0];
  id v4 = v14;
  int v5 = *((_DWORD *)v14 + 39);
  if ((v5 & 0x400) != 0)
  {
    self->_year = *((_DWORD *)v14 + 37);
    *(_DWORD *)&self->_flags |= 0x400u;
    int v5 = *((_DWORD *)v14 + 39);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_35;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_month = *((_DWORD *)v14 + 32);
  *(_DWORD *)&self->_flags |= 0x20u;
  int v5 = *((_DWORD *)v14 + 39);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_35:
  self->_day = *((_DWORD *)v14 + 30);
  *(_DWORD *)&self->_flags |= 8u;
  if ((*((_DWORD *)v14 + 39) & 0x2000) != 0)
  {
LABEL_5:
    self->_usedCellular = *((unsigned char *)v14 + 154);
    *(_DWORD *)&self->_flags |= 0x2000u;
  }
LABEL_6:
  if (*((void *)v14 + 2))
  {
    -[GEONetEventDimensionalGrouping setAppId:](self, "setAppId:");
    id v4 = v14;
  }
  if (*((void *)v4 + 9))
  {
    -[GEONetEventDimensionalGrouping setRequestingAppId:](self, "setRequestingAppId:");
    id v4 = v14;
  }
  if (*((void *)v4 + 3))
  {
    -[GEONetEventDimensionalGrouping setCountryCode:](self, "setCountryCode:");
    id v4 = v14;
  }
  int v6 = *((_DWORD *)v4 + 39);
  if ((v6 & 0x40) != 0)
  {
    self->_networkService = *((_DWORD *)v4 + 33);
    *(_DWORD *)&self->_flags |= 0x40u;
    int v6 = *((_DWORD *)v4 + 39);
    if ((v6 & 0x80) == 0)
    {
LABEL_14:
      if ((v6 & 0x100) == 0) {
        goto LABEL_15;
      }
      goto LABEL_39;
    }
  }
  else if ((v6 & 0x80) == 0)
  {
    goto LABEL_14;
  }
  self->_placeType = *((_DWORD *)v4 + 34);
  *(_DWORD *)&self->_flags |= 0x80u;
  int v6 = *((_DWORD *)v4 + 39);
  if ((v6 & 0x100) == 0)
  {
LABEL_15:
    if ((v6 & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_tileSetId = *((_DWORD *)v4 + 35);
  *(_DWORD *)&self->_flags |= 0x100u;
  int v6 = *((_DWORD *)v4 + 39);
  if ((v6 & 4) == 0)
  {
LABEL_16:
    if ((v6 & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_40:
  self->_dataSetId = *((_DWORD *)v4 + 29);
  *(_DWORD *)&self->_flags |= 4u;
  if ((*((_DWORD *)v4 + 39) & 0x200) != 0)
  {
LABEL_17:
    self->_tileSetStyle = *((_DWORD *)v4 + 36);
    *(_DWORD *)&self->_flags |= 0x200u;
  }
LABEL_18:
  if (*((void *)v4 + 11))
  {
    -[GEONetEventDimensionalGrouping setSvcIp:](self, "setSvcIp:");
    id v4 = v14;
  }
  if (*((void *)v4 + 5))
  {
    -[GEONetEventDimensionalGrouping setErrorDomain:](self, "setErrorDomain:");
    id v4 = v14;
  }
  if (*((unsigned char *)v4 + 156))
  {
    self->_errorCode = *((void *)v4 + 4);
    *(_DWORD *)&self->_flags |= 1u;
  }
  if (*((void *)v4 + 8))
  {
    -[GEONetEventDimensionalGrouping setManifestEnv:](self, "setManifestEnv:");
    id v4 = v14;
  }
  int v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 0x10) != 0)
  {
    self->_httpResponseCode = *((_DWORD *)v4 + 31);
    *(_DWORD *)&self->_flags |= 0x10u;
    int v7 = *((_DWORD *)v4 + 39);
    if ((v7 & 0x1000) == 0)
    {
LABEL_28:
      if ((v7 & 0x800) == 0) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
  }
  else if ((v7 & 0x1000) == 0)
  {
    goto LABEL_28;
  }
  self->_reusedConnection = *((unsigned char *)v4 + 153);
  *(_DWORD *)&self->_flags |= 0x1000u;
  if ((*((_DWORD *)v4 + 39) & 0x800) != 0)
  {
LABEL_29:
    self->_isBackground = *((unsigned char *)v4 + 152);
    *(_DWORD *)&self->_flags |= 0x800u;
  }
LABEL_30:
  latencyStats = self->_latencyStats;
  uint64_t v9 = *((void *)v4 + 7);
  if (latencyStats)
  {
    if (!v9) {
      goto LABEL_48;
    }
    -[GEONetEventAggregateStats mergeFrom:](latencyStats, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_48;
    }
    -[GEONetEventDimensionalGrouping setLatencyStats:](self, "setLatencyStats:");
  }
  id v4 = v14;
LABEL_48:
  txBytesStats = self->_txBytesStats;
  uint64_t v11 = *((void *)v4 + 12);
  if (txBytesStats)
  {
    if (!v11) {
      goto LABEL_54;
    }
    -[GEONetEventAggregateStats mergeFrom:](txBytesStats, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_54;
    }
    -[GEONetEventDimensionalGrouping setTxBytesStats:](self, "setTxBytesStats:");
  }
  id v4 = v14;
LABEL_54:
  rxBytesStats = self->_rxBytesStats;
  uint64_t v13 = *((void *)v4 + 10);
  if (rxBytesStats)
  {
    if (!v13) {
      goto LABEL_60;
    }
    -[GEONetEventAggregateStats mergeFrom:](rxBytesStats, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_60;
    }
    -[GEONetEventDimensionalGrouping setRxBytesStats:](self, "setRxBytesStats:");
  }
  id v4 = v14;
LABEL_60:
  if ((*((unsigned char *)v4 + 156) & 2) != 0)
  {
    self->_eventCount = *((void *)v4 + 6);
    *(_DWORD *)&self->_flags |= 2u;
  }
}

- (unint64_t)hash
{
  [(GEONetEventDimensionalGrouping *)self readAll:1];
  $4318C9330A95675F510920386E4F36BC flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    uint64_t v29 = 2654435761 * self->_year;
    if ((*(unsigned char *)&flags & 0x20) != 0)
    {
LABEL_3:
      uint64_t v28 = 2654435761 * self->_month;
      if ((*(unsigned char *)&flags & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v27 = 0;
      if ((*(_WORD *)&flags & 0x2000) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v29 = 0;
    if ((*(unsigned char *)&flags & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v28 = 0;
  if ((*(unsigned char *)&flags & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v27 = 2654435761 * self->_day;
  if ((*(_WORD *)&flags & 0x2000) != 0)
  {
LABEL_5:
    uint64_t v26 = 2654435761 * self->_usedCellular;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v26 = 0;
LABEL_10:
  NSUInteger v25 = [(NSString *)self->_appId hash];
  NSUInteger v24 = [(NSString *)self->_requestingAppId hash];
  NSUInteger v23 = [(NSString *)self->_countryCode hash];
  $4318C9330A95675F510920386E4F36BC v4 = self->_flags;
  if ((*(unsigned char *)&v4 & 0x40) != 0)
  {
    uint64_t v22 = 2654435761 * self->_networkService;
    if ((*(unsigned char *)&v4 & 0x80) != 0)
    {
LABEL_12:
      uint64_t v21 = 2654435761 * self->_placeType;
      if ((*(_WORD *)&v4 & 0x100) != 0) {
        goto LABEL_13;
      }
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v22 = 0;
    if ((*(unsigned char *)&v4 & 0x80) != 0) {
      goto LABEL_12;
    }
  }
  uint64_t v21 = 0;
  if ((*(_WORD *)&v4 & 0x100) != 0)
  {
LABEL_13:
    uint64_t v20 = 2654435761 * self->_tileSetId;
    if ((*(unsigned char *)&v4 & 4) != 0) {
      goto LABEL_14;
    }
LABEL_19:
    uint64_t v19 = 0;
    if ((*(_WORD *)&v4 & 0x200) != 0) {
      goto LABEL_15;
    }
    goto LABEL_20;
  }
LABEL_18:
  uint64_t v20 = 0;
  if ((*(unsigned char *)&v4 & 4) == 0) {
    goto LABEL_19;
  }
LABEL_14:
  uint64_t v19 = 2654435761 * self->_dataSetId;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
LABEL_15:
    uint64_t v18 = 2654435761 * self->_tileSetStyle;
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v18 = 0;
LABEL_21:
  NSUInteger v17 = [(NSString *)self->_svcIp hash];
  NSUInteger v16 = [(NSString *)self->_errorDomain hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v15 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v15 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_manifestEnv hash];
  $4318C9330A95675F510920386E4F36BC v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 0x10) == 0)
  {
    uint64_t v7 = 0;
    if ((*(_WORD *)&v6 & 0x1000) != 0) {
      goto LABEL_26;
    }
LABEL_29:
    uint64_t v8 = 0;
    if ((*(_WORD *)&v6 & 0x800) != 0) {
      goto LABEL_27;
    }
    goto LABEL_30;
  }
  uint64_t v7 = 2654435761 * self->_httpResponseCode;
  if ((*(_WORD *)&v6 & 0x1000) == 0) {
    goto LABEL_29;
  }
LABEL_26:
  uint64_t v8 = 2654435761 * self->_reusedConnection;
  if ((*(_WORD *)&v6 & 0x800) != 0)
  {
LABEL_27:
    uint64_t v9 = 2654435761 * self->_isBackground;
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v9 = 0;
LABEL_31:
  unint64_t v10 = [(GEONetEventAggregateStats *)self->_latencyStats hash];
  unint64_t v11 = [(GEONetEventAggregateStats *)self->_txBytesStats hash];
  unint64_t v12 = [(GEONetEventAggregateStats *)self->_rxBytesStats hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    unint64_t v13 = 2654435761u * self->_eventCount;
  }
  else {
    unint64_t v13 = 0;
  }
  return v28 ^ v29 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEONetEventDimensionalGrouping *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 26) = self->_readerMarkPos;
  *((_DWORD *)v8 + 27) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  $4318C9330A95675F510920386E4F36BC v4 = v8;
  $4318C9330A95675F510920386E4F36BC flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    *((_DWORD *)v8 + 37) = self->_year;
    *((_DWORD *)v8 + 39) |= 0x400u;
    $4318C9330A95675F510920386E4F36BC flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x20) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_43;
    }
  }
  else if ((*(unsigned char *)&flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v8 + 32) = self->_month;
  *((_DWORD *)v8 + 39) |= 0x20u;
  $4318C9330A95675F510920386E4F36BC flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&flags & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_43:
  *((_DWORD *)v8 + 30) = self->_day;
  *((_DWORD *)v8 + 39) |= 8u;
  if ((*(_DWORD *)&self->_flags & 0x2000) != 0)
  {
LABEL_5:
    *((unsigned char *)v8 + 154) = self->_usedCellular;
    *((_DWORD *)v8 + 39) |= 0x2000u;
  }
LABEL_6:
  if (self->_appId)
  {
    objc_msgSend(v8, "setAppId:");
    $4318C9330A95675F510920386E4F36BC v4 = v8;
  }
  if (self->_requestingAppId)
  {
    objc_msgSend(v8, "setRequestingAppId:");
    $4318C9330A95675F510920386E4F36BC v4 = v8;
  }
  if (self->_countryCode)
  {
    objc_msgSend(v8, "setCountryCode:");
    $4318C9330A95675F510920386E4F36BC v4 = v8;
  }
  $4318C9330A95675F510920386E4F36BC v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 0x40) != 0)
  {
    *((_DWORD *)v4 + 33) = self->_networkService;
    *((_DWORD *)v4 + 39) |= 0x40u;
    $4318C9330A95675F510920386E4F36BC v6 = self->_flags;
    if ((*(unsigned char *)&v6 & 0x80) == 0)
    {
LABEL_14:
      if ((*(_WORD *)&v6 & 0x100) == 0) {
        goto LABEL_15;
      }
      goto LABEL_47;
    }
  }
  else if ((*(unsigned char *)&v6 & 0x80) == 0)
  {
    goto LABEL_14;
  }
  *((_DWORD *)v4 + 34) = self->_placeType;
  *((_DWORD *)v4 + 39) |= 0x80u;
  $4318C9330A95675F510920386E4F36BC v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&v6 & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 35) = self->_tileSetId;
  *((_DWORD *)v4 + 39) |= 0x100u;
  $4318C9330A95675F510920386E4F36BC v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 4) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v6 & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_48:
  *((_DWORD *)v4 + 29) = self->_dataSetId;
  *((_DWORD *)v4 + 39) |= 4u;
  if ((*(_DWORD *)&self->_flags & 0x200) != 0)
  {
LABEL_17:
    *((_DWORD *)v4 + 36) = self->_tileSetStyle;
    *((_DWORD *)v4 + 39) |= 0x200u;
  }
LABEL_18:
  if (self->_svcIp)
  {
    objc_msgSend(v8, "setSvcIp:");
    $4318C9330A95675F510920386E4F36BC v4 = v8;
  }
  if (self->_errorDomain)
  {
    objc_msgSend(v8, "setErrorDomain:");
    $4318C9330A95675F510920386E4F36BC v4 = v8;
  }
  if (*(unsigned char *)&self->_flags)
  {
    v4[4] = self->_errorCode;
    *((_DWORD *)v4 + 39) |= 1u;
  }
  if (self->_manifestEnv)
  {
    objc_msgSend(v8, "setManifestEnv:");
    $4318C9330A95675F510920386E4F36BC v4 = v8;
  }
  $4318C9330A95675F510920386E4F36BC v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 0x10) != 0)
  {
    *((_DWORD *)v4 + 31) = self->_httpResponseCode;
    *((_DWORD *)v4 + 39) |= 0x10u;
    $4318C9330A95675F510920386E4F36BC v7 = self->_flags;
    if ((*(_WORD *)&v7 & 0x1000) == 0)
    {
LABEL_28:
      if ((*(_WORD *)&v7 & 0x800) == 0) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
  }
  else if ((*(_WORD *)&v7 & 0x1000) == 0)
  {
    goto LABEL_28;
  }
  *((unsigned char *)v4 + 153) = self->_reusedConnection;
  *((_DWORD *)v4 + 39) |= 0x1000u;
  if ((*(_DWORD *)&self->_flags & 0x800) != 0)
  {
LABEL_29:
    *((unsigned char *)v4 + 152) = self->_isBackground;
    *((_DWORD *)v4 + 39) |= 0x800u;
  }
LABEL_30:
  if (self->_latencyStats)
  {
    objc_msgSend(v8, "setLatencyStats:");
    $4318C9330A95675F510920386E4F36BC v4 = v8;
  }
  if (self->_txBytesStats)
  {
    objc_msgSend(v8, "setTxBytesStats:");
    $4318C9330A95675F510920386E4F36BC v4 = v8;
  }
  if (self->_rxBytesStats)
  {
    objc_msgSend(v8, "setRxBytesStats:");
    $4318C9330A95675F510920386E4F36BC v4 = v8;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    v4[6] = self->_eventCount;
    *((_DWORD *)v4 + 39) |= 2u;
  }
}

- (GEONetEventDimensionalGrouping)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEONetEventDimensionalGrouping;
  v2 = [(GEONetEventDimensionalGrouping *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    $4318C9330A95675F510920386E4F36BC v4 = v2;
  }

  return v3;
}

- (GEONetEventDimensionalGrouping)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEONetEventDimensionalGrouping;
  id v3 = [(GEONetEventDimensionalGrouping *)&v7 initWithData:a3];
  $4318C9330A95675F510920386E4F36BC v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    NSUInteger v5 = v3;
  }

  return v4;
}

- (unsigned)year
{
  return self->_year;
}

- (void)setYear:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x800400u;
  self->_year = a3;
}

- (void)setHasYear:(BOOL)a3
{
  if (a3) {
    int v3 = 8389632;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$4318C9330A95675F510920386E4F36BC flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasYear
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (unsigned)month
{
  return self->_month;
}

- (void)setMonth:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x800020u;
  self->_month = a3;
}

- (void)setHasMonth:(BOOL)a3
{
  if (a3) {
    int v3 = 8388640;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$4318C9330A95675F510920386E4F36BC flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasMonth
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (unsigned)day
{
  return self->_day;
}

- (void)setDay:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x800008u;
  self->_day = a3;
}

- (void)setHasDay:(BOOL)a3
{
  if (a3) {
    int v3 = 8388616;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$4318C9330A95675F510920386E4F36BC flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDay
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (BOOL)usedCellular
{
  return self->_usedCellular;
}

- (void)setUsedCellular:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x802000u;
  self->_usedCellular = a3;
}

- (void)setHasUsedCellular:(BOOL)a3
{
  if (a3) {
    int v3 = 8396800;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$4318C9330A95675F510920386E4F36BC flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v3);
}

- (BOOL)hasUsedCellular
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (void)_readAppId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 157) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONetEventDimensionalGroupingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAppId_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasAppId
{
  return self->_appId != 0;
}

- (NSString)appId
{
  -[GEONetEventDimensionalGrouping _readAppId]((uint64_t)self);
  appId = self->_appId;

  return appId;
}

- (void)setAppId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x804000u;
  objc_storeStrong((id *)&self->_appId, a3);
}

- (void)_readRequestingAppId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 158) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONetEventDimensionalGroupingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRequestingAppId_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasRequestingAppId
{
  return self->_requestingAppId != 0;
}

- (NSString)requestingAppId
{
  -[GEONetEventDimensionalGrouping _readRequestingAppId]((uint64_t)self);
  requestingAppId = self->_requestingAppId;

  return requestingAppId;
}

- (void)setRequestingAppId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x880000u;
  objc_storeStrong((id *)&self->_requestingAppId, a3);
}

- (void)_readCountryCode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 157) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONetEventDimensionalGroupingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCountryCode_tags_7);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (NSString)countryCode
{
  -[GEONetEventDimensionalGrouping _readCountryCode]((uint64_t)self);
  countryCode = self->_countryCode;

  return countryCode;
}

- (void)setCountryCode:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x808000u;
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (int)networkService
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $4318C9330A95675F510920386E4F36BC flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x40) != 0) {
    return self->_networkService;
  }
  else {
    return 0;
  }
}

- (void)setNetworkService:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x800040u;
  self->_networkService = a3;
}

- (void)setHasNetworkService:(BOOL)a3
{
  if (a3) {
    int v3 = 8388672;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$4318C9330A95675F510920386E4F36BC flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasNetworkService
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (id)networkServiceAsString:(int)a3
{
  if a3 < 0x1D && ((0x1FFF7FFFu >> a3))
  {
    int v3 = off_1E53F8628[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (int)StringAsNetworkService:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NETWORK_SERVICE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"REVERSE_GEOCODER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FORWARD_GEOCODER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SEARCH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"TILE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_ETA"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SIMPLE_ETA"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SUGGESTIONS"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"BATCH_REVGEO"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"MAP_MATCH"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ADDRESS_CORRECTION_INIT"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"ADDRESS_CORRECTION_UPDATE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"PLACE_DATA"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"RESOURCE_LOADER"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"LOG_MESSAGE_USAGE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"LOCATION_SHIFT"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"AB_ASSIGN"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"MANIFEST"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"REALTIME_TRAFFIC_PROBE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"BATCH_TRAFFIC_PROBE"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"SYNC"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"WIFI_QUALITY"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"NETWORK_DEFAULTS"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"MUNIN_RESOURCE"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"JUNCTION_VIEW"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"WIFI_TILE"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"INCIDENT"])
  {
    int v4 = 28;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)placeType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $4318C9330A95675F510920386E4F36BC flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x80) != 0) {
    return self->_placeType;
  }
  else {
    return 0;
  }
}

- (void)setPlaceType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x800080u;
  self->_placeType = a3;
}

- (void)setHasPlaceType:(BOOL)a3
{
  if (a3) {
    int v3 = 8388736;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$4318C9330A95675F510920386E4F36BC flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFF7FFF7F | v3);
}

- (BOOL)hasPlaceType
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (id)placeTypeAsString:(int)a3
{
  if (a3 >= 0x3F)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53F8710[a3];
  }

  return v3;
}

- (int)StringAsPlaceType:(id)a3
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

- (unsigned)tileSetId
{
  return self->_tileSetId;
}

- (void)setTileSetId:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x800100u;
  self->_tileSetId = a3;
}

- (void)setHasTileSetId:(BOOL)a3
{
  if (a3) {
    int v3 = 8388864;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$4318C9330A95675F510920386E4F36BC flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasTileSetId
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (unsigned)dataSetId
{
  return self->_dataSetId;
}

- (void)setDataSetId:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x800004u;
  self->_dataSetId = a3;
}

- (void)setHasDataSetId:(BOOL)a3
{
  if (a3) {
    int v3 = 8388612;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$4318C9330A95675F510920386E4F36BC flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasDataSetId
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (int)tileSetStyle
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $4318C9330A95675F510920386E4F36BC flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x200) != 0) {
    return self->_tileSetStyle;
  }
  else {
    return 0;
  }
}

- (void)setTileSetStyle:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x800200u;
  self->_tileSetStyle = a3;
}

- (void)setHasTileSetStyle:(BOOL)a3
{
  if (a3) {
    int v3 = 8389120;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$4318C9330A95675F510920386E4F36BC flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasTileSetStyle
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (id)tileSetStyleAsString:(int)a3
{
  int v4 = @"RASTER_STANDARD";
  switch(a3)
  {
    case 0:
      goto LABEL_27;
    case 1:
      int v4 = @"VECTOR_STANDARD";
      break;
    case 2:
      int v4 = @"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER";
      break;
    case 3:
      int v4 = @"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER";
      break;
    case 4:
      int v4 = @"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER";
      break;
    case 5:
      int v4 = @"RASTER_STANDARD_BACKGROUND";
      break;
    case 6:
      int v4 = @"RASTER_HYBRID";
      break;
    case 7:
      int v4 = @"RASTER_SATELLITE";
      break;
    case 8:
      int v4 = @"RASTER_TERRAIN";
      break;
    case 11:
      int v4 = @"VECTOR_BUILDINGS";
      break;
    case 12:
      int v4 = @"VECTOR_TRAFFIC";
      break;
    case 13:
      int v4 = @"VECTOR_POI";
      break;
    case 14:
      int v4 = @"SPUTNIK_METADATA";
      break;
    case 15:
      int v4 = @"SPUTNIK_C3M";
      break;
    case 16:
      int v4 = @"SPUTNIK_DSM";
      break;
    case 17:
      int v4 = @"SPUTNIK_DSM_GLOBAL";
      break;
    case 18:
      int v4 = @"VECTOR_REALISTIC";
      break;
    case 19:
      int v4 = @"VECTOR_LEGACY_REALISTIC";
      break;
    case 20:
      int v4 = @"VECTOR_ROADS";
      break;
    case 21:
      int v4 = @"RASTER_VEGETATION";
      break;
    case 22:
      int v4 = @"VECTOR_TRAFFIC_SKELETON";
      break;
    case 23:
      int v4 = @"RASTER_COASTLINE_MASK";
      break;
    case 24:
      int v4 = @"RASTER_HILLSHADE";
      break;
    case 25:
      int v4 = @"VECTOR_TRAFFIC_WITH_GREEN";
      break;
    case 26:
      int v4 = @"VECTOR_TRAFFIC_STATIC";
      break;
    case 27:
      int v4 = @"RASTER_COASTLINE_DROP_MASK";
      break;
    case 28:
      int v4 = @"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL";
      break;
    case 29:
      int v4 = @"VECTOR_SPEED_PROFILES";
      break;
    case 30:
      int v4 = @"VECTOR_VENUES";
      break;
    case 31:
      int v4 = @"RASTER_DOWN_SAMPLED";
      break;
    case 32:
      int v4 = @"RASTER_COLOR_BALANCED";
      break;
    case 33:
      int v4 = @"RASTER_SATELLITE_NIGHT";
      break;
    case 34:
      int v4 = @"SPUTNIK_VECTOR_BORDER";
      break;
    case 35:
      int v4 = @"RASTER_SATELLITE_DIGITIZE";
      break;
    case 36:
      int v4 = @"RASTER_HILLSHADE_PARKS";
      break;
    case 37:
      int v4 = @"VECTOR_TRANSIT";
      break;
    case 38:
      int v4 = @"RASTER_STANDARD_BASE";
      break;
    case 39:
      int v4 = @"RASTER_STANDARD_LABELS";
      break;
    case 40:
      int v4 = @"RASTER_HYBRID_ROADS";
      break;
    case 41:
      int v4 = @"RASTER_HYBRID_LABELS";
      break;
    case 42:
      int v4 = @"FLYOVER_C3M_MESH";
      break;
    case 43:
      int v4 = @"FLYOVER_C3M_JPEG_TEXTURE";
      break;
    case 44:
      int v4 = @"FLYOVER_C3M_ASTC_TEXTURE";
      break;
    case 45:
      int v4 = @"RASTER_SATELLITE_ASTC";
      break;
    case 46:
      int v4 = @"RASTER_HYBRID_ROADS_AND_LABELS";
      break;
    case 47:
      int v4 = @"VECTOR_TRANSIT_SELECTION";
      break;
    case 48:
      int v4 = @"VECTOR_COVERAGE";
      break;
    case 52:
      int v4 = @"FLYOVER_METADATA";
      break;
    case 53:
      int v4 = @"VECTOR_ROAD_NETWORK";
      break;
    case 54:
      int v4 = @"VECTOR_LAND_COVER";
      break;
    case 55:
      int v4 = @"VECTOR_DEBUG";
      break;
    case 56:
      int v4 = @"VECTOR_STREET_POI";
      break;
    case 57:
      int v4 = @"MUNIN_METADATA";
      break;
    case 58:
      int v4 = @"VECTOR_SPR_MERCATOR";
      break;
    case 59:
      int v4 = @"VECTOR_SPR_MODELS";
      break;
    case 60:
      int v4 = @"VECTOR_SPR_MATERIALS";
      break;
    case 61:
      int v4 = @"VECTOR_SPR_METADATA";
      break;
    case 62:
      int v4 = @"VECTOR_TRACKS";
      break;
    case 63:
      int v4 = @"VECTOR_RESERVED_2";
      break;
    case 64:
      int v4 = @"VECTOR_STREET_LANDMARKS";
      break;
    case 65:
      int v4 = @"COARSE_LOCATION_POLYGONS";
      break;
    case 66:
      int v4 = @"VECTOR_SPR_ROADS";
      break;
    case 67:
      int v4 = @"VECTOR_SPR_STANDARD";
      break;
    case 68:
      int v4 = @"VECTOR_POI_V2";
      break;
    case 69:
      int v4 = @"VECTOR_POLYGON_SELECTION";
      break;
    case 70:
      int v4 = @"VL_METADATA";
      break;
    case 71:
      int v4 = @"VL_DATA";
      break;
    case 72:
      int v4 = @"PROACTIVE_APP_CLIP";
      break;
    case 73:
      int v4 = @"VECTOR_BUILDINGS_V2";
      break;
    case 74:
      int v4 = @"POI_BUSYNESS";
      break;
    case 75:
      int v4 = @"POI_DP_BUSYNESS";
      break;
    case 76:
      int v4 = @"SMART_INTERFACE_SELECTION";
      break;
    case 77:
      int v4 = @"VECTOR_ASSETS";
      break;
    case 78:
      int v4 = @"SPR_ASSET_METADATA";
      break;
    case 79:
      int v4 = @"VECTOR_SPR_POLAR";
      break;
    case 80:
      int v4 = @"SMART_DATA_MODE";
      break;
    case 81:
      int v4 = @"CELLULAR_PERFORMANCE_SCORE";
      break;
    case 82:
      int v4 = @"VECTOR_SPR_MODELS_OCCLUSION";
      break;
    case 83:
      int v4 = @"VECTOR_TOPOGRAPHIC";
      break;
    case 84:
      int v4 = @"VECTOR_POI_V2_UPDATE";
      break;
    case 85:
      int v4 = @"VECTOR_LIVE_DATA_UPDATES";
      break;
    case 86:
      int v4 = @"VECTOR_TRAFFIC_V2";
      break;
    case 87:
      int v4 = @"VECTOR_ROAD_SELECTION";
      break;
    case 88:
      int v4 = @"VECTOR_REGION_METADATA";
      break;
    case 89:
      int v4 = @"RAY_TRACING";
      break;
    case 90:
      int v4 = @"VECTOR_CONTOURS";
      break;
    case 91:
      int v4 = @"RASTER_SATELLITE_POLAR";
      break;
    case 92:
      int v4 = @"VMAP4_ELEVATION";
      break;
    case 93:
      int v4 = @"VMAP4_ELEVATION_POLAR";
      break;
    case 94:
      int v4 = @"CELLULAR_COVERAGE_PLMN";
      break;
    case 95:
      int v4 = @"RASTER_SATELLITE_POLAR_NIGHT";
      break;
    case 96:
      int v4 = @"UNUSED_96";
      break;
    case 97:
      int v4 = @"UNUSED_97";
      break;
    case 98:
      int v4 = @"UNUSED_98";
      break;
    case 99:
      int v4 = @"UNUSED_99";
      break;
    case 100:
      int v4 = @"UNUSED_100";
      break;
    case 101:
      int v4 = @"UNUSED_101";
      break;
    case 102:
      int v4 = @"UNUSED_102";
      break;
    case 103:
      int v4 = @"UNUSED_103";
      break;
    case 104:
      int v4 = @"UNUSED_104";
      break;
    case 105:
      int v4 = @"UNUSED_105";
      break;
    case 106:
      int v4 = @"UNUSED_106";
      break;
    case 107:
      int v4 = @"UNUSED_107";
      break;
    case 108:
      int v4 = @"UNUSED_108";
      break;
    case 109:
      int v4 = @"UNUSED_109";
      break;
    case 110:
      int v4 = @"UNUSED_110";
      break;
    case 111:
      int v4 = @"UNUSED_111";
      break;
    case 112:
      int v4 = @"UNUSED_112";
      break;
    case 113:
      int v4 = @"UNUSED_113";
      break;
    case 114:
      int v4 = @"UNUSED_114";
      break;
    case 115:
      int v4 = @"UNUSED_115";
      break;
    case 116:
      int v4 = @"UNUSED_116";
      break;
    case 117:
      int v4 = @"UNUSED_117";
      break;
    case 118:
      int v4 = @"UNUSED_118";
      break;
    case 119:
      int v4 = @"UNUSED_119";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_27:
      break;
  }
  return v4;
}

- (void)_readSvcIp
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 158) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONetEventDimensionalGroupingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSvcIp_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasSvcIp
{
  return self->_svcIp != 0;
}

- (NSString)svcIp
{
  -[GEONetEventDimensionalGrouping _readSvcIp]((uint64_t)self);
  svcIp = self->_svcIp;

  return svcIp;
}

- (void)setSvcIp:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xA00000u;
  objc_storeStrong((id *)&self->_svcIp, a3);
}

- (void)_readErrorDomain
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 158) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONetEventDimensionalGroupingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readErrorDomain_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (NSString)errorDomain
{
  -[GEONetEventDimensionalGrouping _readErrorDomain]((uint64_t)self);
  errorDomain = self->_errorDomain;

  return errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x810000u;
  objc_storeStrong((id *)&self->_errorDomain, a3);
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x800001u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  self->_$4318C9330A95675F510920386E4F36BC flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x800000);
}

- (BOOL)hasErrorCode
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readManifestEnv
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 158) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONetEventDimensionalGroupingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readManifestEnv_tags_10201);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasManifestEnv
{
  return self->_manifestEnv != 0;
}

- (NSString)manifestEnv
{
  -[GEONetEventDimensionalGrouping _readManifestEnv]((uint64_t)self);
  manifestEnv = self->_manifestEnv;

  return manifestEnv;
}

- (void)setManifestEnv:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x840000u;
  objc_storeStrong((id *)&self->_manifestEnv, a3);
}

- (unsigned)httpResponseCode
{
  return self->_httpResponseCode;
}

- (void)setHttpResponseCode:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x800010u;
  self->_httpResponseCode = a3;
}

- (void)setHasHttpResponseCode:(BOOL)a3
{
  if (a3) {
    int v3 = 8388624;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$4318C9330A95675F510920386E4F36BC flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasHttpResponseCode
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (BOOL)reusedConnection
{
  return self->_reusedConnection;
}

- (void)setReusedConnection:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x801000u;
  self->_reusedConnection = a3;
}

- (void)setHasReusedConnection:(BOOL)a3
{
  if (a3) {
    int v3 = 8392704;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$4318C9330A95675F510920386E4F36BC flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v3);
}

- (BOOL)hasReusedConnection
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (BOOL)isBackground
{
  return self->_isBackground;
}

- (void)setIsBackground:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x800800u;
  self->_isBackground = a3;
}

- (void)setHasIsBackground:(BOOL)a3
{
  if (a3) {
    int v3 = 8390656;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$4318C9330A95675F510920386E4F36BC flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasIsBackground
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (void)_readLatencyStats
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 158) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONetEventDimensionalGroupingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLatencyStats_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasLatencyStats
{
  return self->_latencyStats != 0;
}

- (GEONetEventAggregateStats)latencyStats
{
  -[GEONetEventDimensionalGrouping _readLatencyStats]((uint64_t)self);
  latencyStats = self->_latencyStats;

  return latencyStats;
}

- (void)setLatencyStats:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x820000u;
  objc_storeStrong((id *)&self->_latencyStats, a3);
}

- (void)_readTxBytesStats
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 158) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONetEventDimensionalGroupingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTxBytesStats_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasTxBytesStats
{
  return self->_txBytesStats != 0;
}

- (GEONetEventAggregateStats)txBytesStats
{
  -[GEONetEventDimensionalGrouping _readTxBytesStats]((uint64_t)self);
  txBytesStats = self->_txBytesStats;

  return txBytesStats;
}

- (void)setTxBytesStats:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xC00000u;
  objc_storeStrong((id *)&self->_txBytesStats, a3);
}

- (void)_readRxBytesStats
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 158) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONetEventDimensionalGroupingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRxBytesStats_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasRxBytesStats
{
  return self->_rxBytesStats != 0;
}

- (GEONetEventAggregateStats)rxBytesStats
{
  -[GEONetEventDimensionalGrouping _readRxBytesStats]((uint64_t)self);
  rxBytesStats = self->_rxBytesStats;

  return rxBytesStats;
}

- (void)setRxBytesStats:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x900000u;
  objc_storeStrong((id *)&self->_rxBytesStats, a3);
}

- (unint64_t)eventCount
{
  return self->_eventCount;
}

- (void)setEventCount:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x800002u;
  self->_eventCount = a3;
}

- (void)setHasEventCount:(BOOL)a3
{
  if (a3) {
    int v3 = 8388610;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$4318C9330A95675F510920386E4F36BC flags = ($4318C9330A95675F510920386E4F36BC)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasEventCount
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEONetEventDimensionalGrouping;
  int v4 = [(GEONetEventDimensionalGrouping *)&v8 description];
  NSUInteger v5 = [(GEONetEventDimensionalGrouping *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONetEventDimensionalGrouping _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v62 = 0;
    goto LABEL_235;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  int v5 = *(_DWORD *)(a1 + 156);
  if ((v5 & 0x400) != 0)
  {
    objc_super v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 148)];
    [v4 setObject:v6 forKey:@"year"];

    int v5 = *(_DWORD *)(a1 + 156);
  }
  if ((v5 & 0x20) == 0)
  {
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
LABEL_33:
    NSUInteger v17 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 120)];
    [v4 setObject:v17 forKey:@"day"];

    if ((*(_DWORD *)(a1 + 156) & 0x2000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  NSUInteger v16 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 128)];
  [v4 setObject:v16 forKey:@"month"];

  int v5 = *(_DWORD *)(a1 + 156);
  if ((v5 & 8) != 0) {
    goto LABEL_33;
  }
LABEL_6:
  if ((v5 & 0x2000) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  objc_super v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 154)];
  if (a2) {
    objc_super v8 = @"usedCellular";
  }
  else {
    objc_super v8 = @"used_cellular";
  }
  [v4 setObject:v7 forKey:v8];

LABEL_11:
  uint64_t v9 = [(id)a1 appId];
  if (v9)
  {
    if (a2) {
      unint64_t v10 = @"appId";
    }
    else {
      unint64_t v10 = @"app_id";
    }
    [v4 setObject:v9 forKey:v10];
  }

  unint64_t v11 = [(id)a1 requestingAppId];
  if (v11)
  {
    if (a2) {
      unint64_t v12 = @"requestingAppId";
    }
    else {
      unint64_t v12 = @"requesting_app_id";
    }
    [v4 setObject:v11 forKey:v12];
  }

  unint64_t v13 = [(id)a1 countryCode];
  if (v13)
  {
    if (a2) {
      id v14 = @"countryCode";
    }
    else {
      id v14 = @"country_code";
    }
    [v4 setObject:v13 forKey:v14];
  }

  int v15 = *(_DWORD *)(a1 + 156);
  if ((v15 & 0x40) != 0)
  {
    uint64_t v18 = *(int *)(a1 + 132);
    if v18 < 0x1D && ((0x1FFF7FFFu >> v18))
    {
      uint64_t v19 = off_1E53F8628[v18];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 132));
      uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (a2) {
      uint64_t v20 = @"networkService";
    }
    else {
      uint64_t v20 = @"network_service";
    }
    [v4 setObject:v19 forKey:v20];

    int v15 = *(_DWORD *)(a1 + 156);
    if ((v15 & 0x80) == 0)
    {
LABEL_28:
      if ((v15 & 0x100) == 0) {
        goto LABEL_29;
      }
      goto LABEL_50;
    }
  }
  else if ((v15 & 0x80) == 0)
  {
    goto LABEL_28;
  }
  uint64_t v21 = *(int *)(a1 + 136);
  if (v21 >= 0x3F)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 136));
    uint64_t v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v22 = off_1E53F8710[v21];
  }
  if (a2) {
    NSUInteger v23 = @"placeType";
  }
  else {
    NSUInteger v23 = @"place_type";
  }
  [v4 setObject:v22 forKey:v23];

  int v15 = *(_DWORD *)(a1 + 156);
  if ((v15 & 0x100) == 0)
  {
LABEL_29:
    if ((v15 & 4) == 0) {
      goto LABEL_30;
    }
LABEL_54:
    uint64_t v26 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 116)];
    if (a2) {
      uint64_t v27 = @"dataSetId";
    }
    else {
      uint64_t v27 = @"data_set_id";
    }
    [v4 setObject:v26 forKey:v27];

    if ((*(_DWORD *)(a1 + 156) & 0x200) == 0) {
      goto LABEL_178;
    }
    goto LABEL_58;
  }
LABEL_50:
  NSUInteger v24 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 140)];
  if (a2) {
    NSUInteger v25 = @"tileSetId";
  }
  else {
    NSUInteger v25 = @"tile_set_id";
  }
  [v4 setObject:v24 forKey:v25];

  int v15 = *(_DWORD *)(a1 + 156);
  if ((v15 & 4) != 0) {
    goto LABEL_54;
  }
LABEL_30:
  if ((v15 & 0x200) == 0) {
    goto LABEL_178;
  }
LABEL_58:
  uint64_t v28 = @"RASTER_STANDARD";
  switch(*(_DWORD *)(a1 + 144))
  {
    case 0:
      break;
    case 1:
      uint64_t v28 = @"VECTOR_STANDARD";
      break;
    case 2:
      uint64_t v28 = @"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER";
      break;
    case 3:
      uint64_t v28 = @"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER";
      break;
    case 4:
      uint64_t v28 = @"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER";
      break;
    case 5:
      uint64_t v28 = @"RASTER_STANDARD_BACKGROUND";
      break;
    case 6:
      uint64_t v28 = @"RASTER_HYBRID";
      break;
    case 7:
      uint64_t v28 = @"RASTER_SATELLITE";
      break;
    case 8:
      uint64_t v28 = @"RASTER_TERRAIN";
      break;
    case 0xB:
      uint64_t v28 = @"VECTOR_BUILDINGS";
      break;
    case 0xC:
      uint64_t v28 = @"VECTOR_TRAFFIC";
      break;
    case 0xD:
      uint64_t v28 = @"VECTOR_POI";
      break;
    case 0xE:
      uint64_t v28 = @"SPUTNIK_METADATA";
      break;
    case 0xF:
      uint64_t v28 = @"SPUTNIK_C3M";
      break;
    case 0x10:
      uint64_t v28 = @"SPUTNIK_DSM";
      break;
    case 0x11:
      uint64_t v28 = @"SPUTNIK_DSM_GLOBAL";
      break;
    case 0x12:
      uint64_t v28 = @"VECTOR_REALISTIC";
      break;
    case 0x13:
      uint64_t v28 = @"VECTOR_LEGACY_REALISTIC";
      break;
    case 0x14:
      uint64_t v28 = @"VECTOR_ROADS";
      break;
    case 0x15:
      uint64_t v28 = @"RASTER_VEGETATION";
      break;
    case 0x16:
      uint64_t v28 = @"VECTOR_TRAFFIC_SKELETON";
      break;
    case 0x17:
      uint64_t v28 = @"RASTER_COASTLINE_MASK";
      break;
    case 0x18:
      uint64_t v28 = @"RASTER_HILLSHADE";
      break;
    case 0x19:
      uint64_t v28 = @"VECTOR_TRAFFIC_WITH_GREEN";
      break;
    case 0x1A:
      uint64_t v28 = @"VECTOR_TRAFFIC_STATIC";
      break;
    case 0x1B:
      uint64_t v28 = @"RASTER_COASTLINE_DROP_MASK";
      break;
    case 0x1C:
      uint64_t v28 = @"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL";
      break;
    case 0x1D:
      uint64_t v28 = @"VECTOR_SPEED_PROFILES";
      break;
    case 0x1E:
      uint64_t v28 = @"VECTOR_VENUES";
      break;
    case 0x1F:
      uint64_t v28 = @"RASTER_DOWN_SAMPLED";
      break;
    case 0x20:
      uint64_t v28 = @"RASTER_COLOR_BALANCED";
      break;
    case 0x21:
      uint64_t v28 = @"RASTER_SATELLITE_NIGHT";
      break;
    case 0x22:
      uint64_t v28 = @"SPUTNIK_VECTOR_BORDER";
      break;
    case 0x23:
      uint64_t v28 = @"RASTER_SATELLITE_DIGITIZE";
      break;
    case 0x24:
      uint64_t v28 = @"RASTER_HILLSHADE_PARKS";
      break;
    case 0x25:
      uint64_t v28 = @"VECTOR_TRANSIT";
      break;
    case 0x26:
      uint64_t v28 = @"RASTER_STANDARD_BASE";
      break;
    case 0x27:
      uint64_t v28 = @"RASTER_STANDARD_LABELS";
      break;
    case 0x28:
      uint64_t v28 = @"RASTER_HYBRID_ROADS";
      break;
    case 0x29:
      uint64_t v28 = @"RASTER_HYBRID_LABELS";
      break;
    case 0x2A:
      uint64_t v28 = @"FLYOVER_C3M_MESH";
      break;
    case 0x2B:
      uint64_t v28 = @"FLYOVER_C3M_JPEG_TEXTURE";
      break;
    case 0x2C:
      uint64_t v28 = @"FLYOVER_C3M_ASTC_TEXTURE";
      break;
    case 0x2D:
      uint64_t v28 = @"RASTER_SATELLITE_ASTC";
      break;
    case 0x2E:
      uint64_t v28 = @"RASTER_HYBRID_ROADS_AND_LABELS";
      break;
    case 0x2F:
      uint64_t v28 = @"VECTOR_TRANSIT_SELECTION";
      break;
    case 0x30:
      uint64_t v28 = @"VECTOR_COVERAGE";
      break;
    case 0x34:
      uint64_t v28 = @"FLYOVER_METADATA";
      break;
    case 0x35:
      uint64_t v28 = @"VECTOR_ROAD_NETWORK";
      break;
    case 0x36:
      uint64_t v28 = @"VECTOR_LAND_COVER";
      break;
    case 0x37:
      uint64_t v28 = @"VECTOR_DEBUG";
      break;
    case 0x38:
      uint64_t v28 = @"VECTOR_STREET_POI";
      break;
    case 0x39:
      uint64_t v28 = @"MUNIN_METADATA";
      break;
    case 0x3A:
      uint64_t v28 = @"VECTOR_SPR_MERCATOR";
      break;
    case 0x3B:
      uint64_t v28 = @"VECTOR_SPR_MODELS";
      break;
    case 0x3C:
      uint64_t v28 = @"VECTOR_SPR_MATERIALS";
      break;
    case 0x3D:
      uint64_t v28 = @"VECTOR_SPR_METADATA";
      break;
    case 0x3E:
      uint64_t v28 = @"VECTOR_TRACKS";
      break;
    case 0x3F:
      uint64_t v28 = @"VECTOR_RESERVED_2";
      break;
    case 0x40:
      uint64_t v28 = @"VECTOR_STREET_LANDMARKS";
      break;
    case 0x41:
      uint64_t v28 = @"COARSE_LOCATION_POLYGONS";
      break;
    case 0x42:
      uint64_t v28 = @"VECTOR_SPR_ROADS";
      break;
    case 0x43:
      uint64_t v28 = @"VECTOR_SPR_STANDARD";
      break;
    case 0x44:
      uint64_t v28 = @"VECTOR_POI_V2";
      break;
    case 0x45:
      uint64_t v28 = @"VECTOR_POLYGON_SELECTION";
      break;
    case 0x46:
      uint64_t v28 = @"VL_METADATA";
      break;
    case 0x47:
      uint64_t v28 = @"VL_DATA";
      break;
    case 0x48:
      uint64_t v28 = @"PROACTIVE_APP_CLIP";
      break;
    case 0x49:
      uint64_t v28 = @"VECTOR_BUILDINGS_V2";
      break;
    case 0x4A:
      uint64_t v28 = @"POI_BUSYNESS";
      break;
    case 0x4B:
      uint64_t v28 = @"POI_DP_BUSYNESS";
      break;
    case 0x4C:
      uint64_t v28 = @"SMART_INTERFACE_SELECTION";
      break;
    case 0x4D:
      uint64_t v28 = @"VECTOR_ASSETS";
      break;
    case 0x4E:
      uint64_t v28 = @"SPR_ASSET_METADATA";
      break;
    case 0x4F:
      uint64_t v28 = @"VECTOR_SPR_POLAR";
      break;
    case 0x50:
      uint64_t v28 = @"SMART_DATA_MODE";
      break;
    case 0x51:
      uint64_t v28 = @"CELLULAR_PERFORMANCE_SCORE";
      break;
    case 0x52:
      uint64_t v28 = @"VECTOR_SPR_MODELS_OCCLUSION";
      break;
    case 0x53:
      uint64_t v28 = @"VECTOR_TOPOGRAPHIC";
      break;
    case 0x54:
      uint64_t v28 = @"VECTOR_POI_V2_UPDATE";
      break;
    case 0x55:
      uint64_t v28 = @"VECTOR_LIVE_DATA_UPDATES";
      break;
    case 0x56:
      uint64_t v28 = @"VECTOR_TRAFFIC_V2";
      break;
    case 0x57:
      uint64_t v28 = @"VECTOR_ROAD_SELECTION";
      break;
    case 0x58:
      uint64_t v28 = @"VECTOR_REGION_METADATA";
      break;
    case 0x59:
      uint64_t v28 = @"RAY_TRACING";
      break;
    case 0x5A:
      uint64_t v28 = @"VECTOR_CONTOURS";
      break;
    case 0x5B:
      uint64_t v28 = @"RASTER_SATELLITE_POLAR";
      break;
    case 0x5C:
      uint64_t v28 = @"VMAP4_ELEVATION";
      break;
    case 0x5D:
      uint64_t v28 = @"VMAP4_ELEVATION_POLAR";
      break;
    case 0x5E:
      uint64_t v28 = @"CELLULAR_COVERAGE_PLMN";
      break;
    case 0x5F:
      uint64_t v28 = @"RASTER_SATELLITE_POLAR_NIGHT";
      break;
    case 0x60:
      uint64_t v28 = @"UNUSED_96";
      break;
    case 0x61:
      uint64_t v28 = @"UNUSED_97";
      break;
    case 0x62:
      uint64_t v28 = @"UNUSED_98";
      break;
    case 0x63:
      uint64_t v28 = @"UNUSED_99";
      break;
    case 0x64:
      uint64_t v28 = @"UNUSED_100";
      break;
    case 0x65:
      uint64_t v28 = @"UNUSED_101";
      break;
    case 0x66:
      uint64_t v28 = @"UNUSED_102";
      break;
    case 0x67:
      uint64_t v28 = @"UNUSED_103";
      break;
    case 0x68:
      uint64_t v28 = @"UNUSED_104";
      break;
    case 0x69:
      uint64_t v28 = @"UNUSED_105";
      break;
    case 0x6A:
      uint64_t v28 = @"UNUSED_106";
      break;
    case 0x6B:
      uint64_t v28 = @"UNUSED_107";
      break;
    case 0x6C:
      uint64_t v28 = @"UNUSED_108";
      break;
    case 0x6D:
      uint64_t v28 = @"UNUSED_109";
      break;
    case 0x6E:
      uint64_t v28 = @"UNUSED_110";
      break;
    case 0x6F:
      uint64_t v28 = @"UNUSED_111";
      break;
    case 0x70:
      uint64_t v28 = @"UNUSED_112";
      break;
    case 0x71:
      uint64_t v28 = @"UNUSED_113";
      break;
    case 0x72:
      uint64_t v28 = @"UNUSED_114";
      break;
    case 0x73:
      uint64_t v28 = @"UNUSED_115";
      break;
    case 0x74:
      uint64_t v28 = @"UNUSED_116";
      break;
    case 0x75:
      uint64_t v28 = @"UNUSED_117";
      break;
    case 0x76:
      uint64_t v28 = @"UNUSED_118";
      break;
    case 0x77:
      uint64_t v28 = @"UNUSED_119";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 144));
      uint64_t v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  if (a2) {
    uint64_t v29 = @"tileSetStyle";
  }
  else {
    uint64_t v29 = @"tile_set_style";
  }
  [v4 setObject:v28 forKey:v29];

LABEL_178:
  v30 = [(id)a1 svcIp];
  if (v30)
  {
    if (a2) {
      v31 = @"svcIp";
    }
    else {
      v31 = @"svc_ip";
    }
    [v4 setObject:v30 forKey:v31];
  }

  v32 = [(id)a1 errorDomain];
  if (v32)
  {
    if (a2) {
      v33 = @"errorDomain";
    }
    else {
      v33 = @"error_domain";
    }
    [v4 setObject:v32 forKey:v33];
  }

  if (*(unsigned char *)(a1 + 156))
  {
    id v34 = [NSNumber numberWithLongLong:*(void *)(a1 + 32)];
    if (a2) {
      uint64_t v35 = @"errorCode";
    }
    else {
      uint64_t v35 = @"error_code";
    }
    [v4 setObject:v34 forKey:v35];
  }
  v36 = [(id)a1 manifestEnv];
  if (v36)
  {
    if (a2) {
      v37 = @"manifestEnv";
    }
    else {
      v37 = @"manifest_env";
    }
    [v4 setObject:v36 forKey:v37];
  }

  int v38 = *(_DWORD *)(a1 + 156);
  if ((v38 & 0x10) == 0)
  {
    if ((v38 & 0x1000) == 0) {
      goto LABEL_200;
    }
LABEL_212:
    v47 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 153)];
    if (a2) {
      v48 = @"reusedConnection";
    }
    else {
      v48 = @"reused_connection";
    }
    [v4 setObject:v47 forKey:v48];

    if ((*(_DWORD *)(a1 + 156) & 0x800) == 0) {
      goto LABEL_205;
    }
    goto LABEL_201;
  }
  v45 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 124)];
  if (a2) {
    v46 = @"httpResponseCode";
  }
  else {
    v46 = @"http_response_code";
  }
  [v4 setObject:v45 forKey:v46];

  int v38 = *(_DWORD *)(a1 + 156);
  if ((v38 & 0x1000) != 0) {
    goto LABEL_212;
  }
LABEL_200:
  if ((v38 & 0x800) != 0)
  {
LABEL_201:
    v39 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 152)];
    if (a2) {
      v40 = @"isBackground";
    }
    else {
      v40 = @"is_background";
    }
    [v4 setObject:v39 forKey:v40];
  }
LABEL_205:
  v41 = [(id)a1 latencyStats];
  v42 = v41;
  if (v41)
  {
    if (a2)
    {
      v43 = [v41 jsonRepresentation];
      v44 = @"latencyStats";
    }
    else
    {
      v43 = [v41 dictionaryRepresentation];
      v44 = @"latency_stats";
    }
    id v49 = v43;

    [v4 setObject:v49 forKey:v44];
  }

  v50 = [(id)a1 txBytesStats];
  v51 = v50;
  if (v50)
  {
    if (a2)
    {
      v52 = [v50 jsonRepresentation];
      v53 = @"txBytesStats";
    }
    else
    {
      v52 = [v50 dictionaryRepresentation];
      v53 = @"tx_bytes_stats";
    }
    id v54 = v52;

    [v4 setObject:v54 forKey:v53];
  }

  v55 = [(id)a1 rxBytesStats];
  uint64_t v56 = v55;
  if (v55)
  {
    if (a2)
    {
      v57 = [v55 jsonRepresentation];
      v58 = @"rxBytesStats";
    }
    else
    {
      v57 = [v55 dictionaryRepresentation];
      v58 = @"rx_bytes_stats";
    }
    id v59 = v57;

    [v4 setObject:v59 forKey:v58];
  }

  if ((*(unsigned char *)(a1 + 156) & 2) != 0)
  {
    v60 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
    if (a2) {
      uint64_t v61 = @"eventCount";
    }
    else {
      uint64_t v61 = @"event_count";
    }
    [v4 setObject:v60 forKey:v61];
  }
  id v62 = v4;

LABEL_235:

  return v62;
}

- (id)jsonRepresentation
{
  return -[GEONetEventDimensionalGrouping _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEONetEventDimensionalGrouping)initWithDictionary:(id)a3
{
  return (GEONetEventDimensionalGrouping *)-[GEONetEventDimensionalGrouping _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEONetEventDimensionalGrouping)initWithJSON:(id)a3
{
  return (GEONetEventDimensionalGrouping *)-[GEONetEventDimensionalGrouping _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_10302;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_10303;
    }
    GEONetEventDimensionalGroupingReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEONetEventAggregateStats *)self->_latencyStats readAll:1];
    [(GEONetEventAggregateStats *)self->_txBytesStats readAll:1];
    [(GEONetEventAggregateStats *)self->_rxBytesStats readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEONetEventDimensionalGroupingIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONetEventDimensionalGroupingReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_DWORD *)&self->_flags & 0xFFC000) == 0)
    {
      objc_super v8 = self->_reader;
      objc_sync_enter(v8);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      uint64_t v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v10 writeData:v9];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v8);
      goto LABEL_53;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEONetEventDimensionalGrouping *)self readAll:0];
  $4318C9330A95675F510920386E4F36BC flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    PBDataWriterWriteUint32Field();
    $4318C9330A95675F510920386E4F36BC flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x20) == 0)
    {
LABEL_5:
      if ((*(unsigned char *)&flags & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_42;
    }
  }
  else if ((*(unsigned char *)&flags & 0x20) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  $4318C9330A95675F510920386E4F36BC flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&flags & 0x2000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_flags & 0x2000) != 0) {
LABEL_7:
  }
    PBDataWriterWriteBOOLField();
LABEL_8:
  if (self->_appId) {
    PBDataWriterWriteStringField();
  }
  if (self->_requestingAppId) {
    PBDataWriterWriteStringField();
  }
  if (self->_countryCode) {
    PBDataWriterWriteStringField();
  }
  $4318C9330A95675F510920386E4F36BC v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    $4318C9330A95675F510920386E4F36BC v6 = self->_flags;
    if ((*(unsigned char *)&v6 & 0x80) == 0)
    {
LABEL_16:
      if ((*(_WORD *)&v6 & 0x100) == 0) {
        goto LABEL_17;
      }
      goto LABEL_46;
    }
  }
  else if ((*(unsigned char *)&v6 & 0x80) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteInt32Field();
  $4318C9330A95675F510920386E4F36BC v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&v6 & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  $4318C9330A95675F510920386E4F36BC v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 4) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v6 & 0x200) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_flags & 0x200) != 0) {
LABEL_19:
  }
    PBDataWriterWriteInt32Field();
LABEL_20:
  if (self->_svcIp) {
    PBDataWriterWriteStringField();
  }
  if (self->_errorDomain) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_manifestEnv) {
    PBDataWriterWriteStringField();
  }
  $4318C9330A95675F510920386E4F36BC v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 0x10) == 0)
  {
    if ((*(_WORD *)&v7 & 0x1000) == 0) {
      goto LABEL_30;
    }
LABEL_50:
    PBDataWriterWriteBOOLField();
    if ((*(_DWORD *)&self->_flags & 0x800) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  PBDataWriterWriteUint32Field();
  $4318C9330A95675F510920386E4F36BC v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x1000) != 0) {
    goto LABEL_50;
  }
LABEL_30:
  if ((*(_WORD *)&v7 & 0x800) != 0) {
LABEL_31:
  }
    PBDataWriterWriteBOOLField();
LABEL_32:
  if (self->_latencyStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_txBytesStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_rxBytesStats) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
LABEL_53:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    $4318C9330A95675F510920386E4F36BC v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 0x80) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEONetEventDimensionalGroupingReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEONetEventDimensionalGrouping *)self readAll:0];
  $4318C9330A95675F510920386E4F36BC flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    *(_DWORD *)(v5 + 148) = self->_year;
    *(_DWORD *)(v5 + 156) |= 0x400u;
    $4318C9330A95675F510920386E4F36BC flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x20) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&flags & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&flags & 0x20) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 128) = self->_month;
  *(_DWORD *)(v5 + 156) |= 0x20u;
  $4318C9330A95675F510920386E4F36BC flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&flags & 0x2000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_27:
  *(_DWORD *)(v5 + 120) = self->_day;
  *(_DWORD *)(v5 + 156) |= 8u;
  if ((*(_DWORD *)&self->_flags & 0x2000) != 0)
  {
LABEL_9:
    *(unsigned char *)(v5 + 154) = self->_usedCellular;
    *(_DWORD *)(v5 + 156) |= 0x2000u;
  }
LABEL_10:
  uint64_t v10 = [(NSString *)self->_appId copyWithZone:a3];
  unint64_t v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  uint64_t v12 = [(NSString *)self->_requestingAppId copyWithZone:a3];
  unint64_t v13 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v12;

  uint64_t v14 = [(NSString *)self->_countryCode copyWithZone:a3];
  int v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  $4318C9330A95675F510920386E4F36BC v16 = self->_flags;
  if ((*(unsigned char *)&v16 & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_networkService;
    *(_DWORD *)(v5 + 156) |= 0x40u;
    $4318C9330A95675F510920386E4F36BC v16 = self->_flags;
    if ((*(unsigned char *)&v16 & 0x80) == 0)
    {
LABEL_12:
      if ((*(_WORD *)&v16 & 0x100) == 0) {
        goto LABEL_13;
      }
      goto LABEL_31;
    }
  }
  else if ((*(unsigned char *)&v16 & 0x80) == 0)
  {
    goto LABEL_12;
  }
  *(_DWORD *)(v5 + 136) = self->_placeType;
  *(_DWORD *)(v5 + 156) |= 0x80u;
  $4318C9330A95675F510920386E4F36BC v16 = self->_flags;
  if ((*(_WORD *)&v16 & 0x100) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&v16 & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  *(_DWORD *)(v5 + 140) = self->_tileSetId;
  *(_DWORD *)(v5 + 156) |= 0x100u;
  $4318C9330A95675F510920386E4F36BC v16 = self->_flags;
  if ((*(unsigned char *)&v16 & 4) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v16 & 0x200) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_32:
  *(_DWORD *)(v5 + 116) = self->_dataSetId;
  *(_DWORD *)(v5 + 156) |= 4u;
  if ((*(_DWORD *)&self->_flags & 0x200) != 0)
  {
LABEL_15:
    *(_DWORD *)(v5 + 144) = self->_tileSetStyle;
    *(_DWORD *)(v5 + 156) |= 0x200u;
  }
LABEL_16:
  uint64_t v17 = [(NSString *)self->_svcIp copyWithZone:a3];
  uint64_t v18 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v17;

  uint64_t v19 = [(NSString *)self->_errorDomain copyWithZone:a3];
  uint64_t v20 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v19;

  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 32) = self->_errorCode;
    *(_DWORD *)(v5 + 156) |= 1u;
  }
  uint64_t v21 = [(NSString *)self->_manifestEnv copyWithZone:a3];
  uint64_t v22 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v21;

  $4318C9330A95675F510920386E4F36BC v23 = self->_flags;
  if ((*(unsigned char *)&v23 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 124) = self->_httpResponseCode;
    *(_DWORD *)(v5 + 156) |= 0x10u;
    $4318C9330A95675F510920386E4F36BC v23 = self->_flags;
    if ((*(_WORD *)&v23 & 0x1000) == 0)
    {
LABEL_20:
      if ((*(_WORD *)&v23 & 0x800) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&v23 & 0x1000) == 0)
  {
    goto LABEL_20;
  }
  *(unsigned char *)(v5 + 153) = self->_reusedConnection;
  *(_DWORD *)(v5 + 156) |= 0x1000u;
  if ((*(_DWORD *)&self->_flags & 0x800) != 0)
  {
LABEL_21:
    *(unsigned char *)(v5 + 152) = self->_isBackground;
    *(_DWORD *)(v5 + 156) |= 0x800u;
  }
LABEL_22:
  id v24 = [(GEONetEventAggregateStats *)self->_latencyStats copyWithZone:a3];
  NSUInteger v25 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v24;

  id v26 = [(GEONetEventAggregateStats *)self->_txBytesStats copyWithZone:a3];
  uint64_t v27 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v26;

  id v28 = [(GEONetEventAggregateStats *)self->_rxBytesStats copyWithZone:a3];
  uint64_t v29 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v28;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(void *)(v5 + 48) = self->_eventCount;
    *(_DWORD *)(v5 + 156) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_100;
  }
  [(GEONetEventDimensionalGrouping *)self readAll:1];
  [v4 readAll:1];
  $4318C9330A95675F510920386E4F36BC flags = self->_flags;
  int v6 = *((_DWORD *)v4 + 39);
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_year != *((_DWORD *)v4 + 37)) {
      goto LABEL_100;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_100;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_month != *((_DWORD *)v4 + 32)) {
      goto LABEL_100;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_100;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_day != *((_DWORD *)v4 + 30)) {
      goto LABEL_100;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&flags & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0) {
      goto LABEL_100;
    }
    if (self->_usedCellular)
    {
      if (!*((unsigned char *)v4 + 154)) {
        goto LABEL_100;
      }
    }
    else if (*((unsigned char *)v4 + 154))
    {
      goto LABEL_100;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_100;
  }
  appId = self->_appId;
  if ((unint64_t)appId | *((void *)v4 + 2) && !-[NSString isEqual:](appId, "isEqual:")) {
    goto LABEL_100;
  }
  requestingAppId = self->_requestingAppId;
  if ((unint64_t)requestingAppId | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](requestingAppId, "isEqual:")) {
      goto LABEL_100;
    }
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:")) {
      goto LABEL_100;
    }
  }
  $4318C9330A95675F510920386E4F36BC v10 = self->_flags;
  int v11 = *((_DWORD *)v4 + 39);
  if ((*(unsigned char *)&v10 & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_networkService != *((_DWORD *)v4 + 33)) {
      goto LABEL_100;
    }
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_100;
  }
  if ((*(unsigned char *)&v10 & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_placeType != *((_DWORD *)v4 + 34)) {
      goto LABEL_100;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&v10 & 0x100) != 0)
  {
    if ((v11 & 0x100) == 0 || self->_tileSetId != *((_DWORD *)v4 + 35)) {
      goto LABEL_100;
    }
  }
  else if ((v11 & 0x100) != 0)
  {
    goto LABEL_100;
  }
  if ((*(unsigned char *)&v10 & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_dataSetId != *((_DWORD *)v4 + 29)) {
      goto LABEL_100;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&v10 & 0x200) != 0)
  {
    if ((v11 & 0x200) == 0 || self->_tileSetStyle != *((_DWORD *)v4 + 36)) {
      goto LABEL_100;
    }
  }
  else if ((v11 & 0x200) != 0)
  {
    goto LABEL_100;
  }
  svcIp = self->_svcIp;
  if ((unint64_t)svcIp | *((void *)v4 + 11) && !-[NSString isEqual:](svcIp, "isEqual:")) {
    goto LABEL_100;
  }
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](errorDomain, "isEqual:")) {
      goto LABEL_100;
    }
  }
  $4318C9330A95675F510920386E4F36BC v14 = self->_flags;
  int v15 = *((_DWORD *)v4 + 39);
  if (*(unsigned char *)&v14)
  {
    if ((v15 & 1) == 0 || self->_errorCode != *((void *)v4 + 4)) {
      goto LABEL_100;
    }
  }
  else if (v15)
  {
    goto LABEL_100;
  }
  manifestEnv = self->_manifestEnv;
  if ((unint64_t)manifestEnv | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](manifestEnv, "isEqual:")) {
      goto LABEL_100;
    }
    $4318C9330A95675F510920386E4F36BC v14 = self->_flags;
    int v15 = *((_DWORD *)v4 + 39);
  }
  if ((*(unsigned char *)&v14 & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0 || self->_httpResponseCode != *((_DWORD *)v4 + 31)) {
      goto LABEL_100;
    }
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&v14 & 0x1000) != 0)
  {
    if ((v15 & 0x1000) == 0) {
      goto LABEL_100;
    }
    if (self->_reusedConnection)
    {
      if (!*((unsigned char *)v4 + 153)) {
        goto LABEL_100;
      }
    }
    else if (*((unsigned char *)v4 + 153))
    {
      goto LABEL_100;
    }
  }
  else if ((v15 & 0x1000) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&v14 & 0x800) != 0)
  {
    if ((v15 & 0x800) != 0)
    {
      if (self->_isBackground)
      {
        if (!*((unsigned char *)v4 + 152)) {
          goto LABEL_100;
        }
        goto LABEL_89;
      }
      if (!*((unsigned char *)v4 + 152)) {
        goto LABEL_89;
      }
    }
LABEL_100:
    BOOL v20 = 0;
    goto LABEL_101;
  }
  if ((v15 & 0x800) != 0) {
    goto LABEL_100;
  }
LABEL_89:
  latencyStats = self->_latencyStats;
  if ((unint64_t)latencyStats | *((void *)v4 + 7)
    && !-[GEONetEventAggregateStats isEqual:](latencyStats, "isEqual:"))
  {
    goto LABEL_100;
  }
  txBytesStats = self->_txBytesStats;
  if ((unint64_t)txBytesStats | *((void *)v4 + 12))
  {
    if (!-[GEONetEventAggregateStats isEqual:](txBytesStats, "isEqual:")) {
      goto LABEL_100;
    }
  }
  rxBytesStats = self->_rxBytesStats;
  if ((unint64_t)rxBytesStats | *((void *)v4 + 10))
  {
    if (!-[GEONetEventAggregateStats isEqual:](rxBytesStats, "isEqual:")) {
      goto LABEL_100;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((_DWORD *)v4 + 39) & 2) == 0 || self->_eventCount != *((void *)v4 + 6)) {
      goto LABEL_100;
    }
    BOOL v20 = 1;
  }
  else
  {
    BOOL v20 = (*((_DWORD *)v4 + 39) & 2) == 0;
  }
LABEL_101:

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txBytesStats, 0);
  objc_storeStrong((id *)&self->_svcIp, 0);
  objc_storeStrong((id *)&self->_rxBytesStats, 0);
  objc_storeStrong((id *)&self->_requestingAppId, 0);
  objc_storeStrong((id *)&self->_manifestEnv, 0);
  objc_storeStrong((id *)&self->_latencyStats, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_appId, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end