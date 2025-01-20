@interface GEOLogMsgStatePlaceRequest
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasPlaceDataRequest;
- (BOOL)hasPlaceRequestType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStatePlaceRequest)initWithDictionary:(id)a3;
- (GEOLogMsgStatePlaceRequest)initWithJSON:(id)a3;
- (GEOPDPlaceRequest)placeDataRequest;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)placeRequestTypeAsString:(int)a3;
- (int)StringAsPlaceRequestType:(id)a3;
- (int)placeRequestType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPlaceRequestType:(BOOL)a3;
- (void)setPlaceDataRequest:(id)a3;
- (void)setPlaceRequestType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStatePlaceRequest

- (void).cxx_destruct
{
}

- (void)setPlaceRequestType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_placeRequestType = a3;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_placeDataRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (int)placeRequestType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_placeRequestType;
  }
  else {
    return 0;
  }
}

- (void)setHasPlaceRequestType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
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
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53F8710[a3];
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

- (BOOL)hasPlaceDataRequest
{
  return self->_placeDataRequest != 0;
}

- (GEOPDPlaceRequest)placeDataRequest
{
  return self->_placeDataRequest;
}

- (void)setPlaceDataRequest:(id)a3
{
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStatePlaceRequest;
  int v4 = [(GEOLogMsgStatePlaceRequest *)&v8 description];
  id v5 = [(GEOLogMsgStatePlaceRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStatePlaceRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 20))
    {
      uint64_t v5 = *(int *)(a1 + 16);
      if (v5 >= 0x3F)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53F8710[v5];
      }
      if (a2) {
        v7 = @"placeRequestType";
      }
      else {
        v7 = @"place_request_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = [(id)a1 placeDataRequest];
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 jsonRepresentation];
        v11 = @"placeDataRequest";
      }
      else
      {
        v10 = [v8 dictionaryRepresentation];
        v11 = @"place_data_request";
      }
      [v4 setObject:v10 forKey:v11];
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
  return -[GEOLogMsgStatePlaceRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStatePlaceRequest)initWithDictionary:(id)a3
{
  return (GEOLogMsgStatePlaceRequest *)-[GEOLogMsgStatePlaceRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_147;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_147;
  }
  if (a3) {
    v6 = @"placeRequestType";
  }
  else {
    v6 = @"place_request_type";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"REQUEST_TYPE_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_SEARCH"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_GEOCODING"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_CANONICAL_LOCATION_SEARCH"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_REVERSE_GEOCODING"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_PLACE_LOOKUP"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_MERCHANT_LOOKUP"])
    {
      uint64_t v9 = 6;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_PLACE_REFINEMENT"])
    {
      uint64_t v9 = 7;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_SIRI_SEARCH"])
    {
      uint64_t v9 = 8;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_LOCATION_DIRECTED_SEARCH"])
    {
      uint64_t v9 = 9;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_AUTOCOMPLETE"])
    {
      uint64_t v9 = 10;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_BROWSE_CATEGORY_SUGGESTION"])
    {
      uint64_t v9 = 11;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_CATEGORY_SEARCH"])
    {
      uint64_t v9 = 12;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_POPULAR_NEARBY_SEARCH"])
    {
      uint64_t v9 = 13;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_ZERO_KEYWORD_CATEGORY_SUGGESTION"])
    {
      uint64_t v9 = 14;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_SEARCH_FIELD_PLACEHOLDER"])
    {
      uint64_t v9 = 15;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_BATCH_POPULAR_NEARBY_SEARCH"])
    {
      uint64_t v9 = 16;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_VENDOR_SPECIFIC_PLACE_REFINEMENT"])
    {
      uint64_t v9 = 17;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_NEARBY_SEARCH"])
    {
      uint64_t v9 = 18;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_ADDRESS_OBJECT_GEOCODING"])
    {
      uint64_t v9 = 19;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_ZERO_KEYWORD_WITH_SEARCH_RESULTS_SUGGESTION"])
    {
      uint64_t v9 = 20;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_EXTERNAL_TRANSIT_LOOKUP"])
    {
      uint64_t v9 = 21;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_FEATURE_ID_GEOCODING"])
    {
      uint64_t v9 = 22;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_MAPS_IDENTIFIER_PLACE_LOOKUP"])
    {
      uint64_t v9 = 23;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_DATASET_STATUS_CHECK"])
    {
      uint64_t v9 = 24;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_OFFLINE_AREA_LOOKUP"])
    {
      uint64_t v9 = 25;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_BATCH_REVERSE_GEOCODING"])
    {
      uint64_t v9 = 26;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_OFFLINE_SUGGESTED_REGIONS"])
    {
      uint64_t v9 = 27;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_OFFLINE_POLYGON_QUAD_NODES"])
    {
      uint64_t v9 = 28;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_OFFLINE_PROACTIVE_REGIONS"])
    {
      uint64_t v9 = 29;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_BRAND_LOOKUP"])
    {
      uint64_t v9 = 30;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_OFFLINE_UPDATE_MANIFEST"])
    {
      uint64_t v9 = 31;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_WIFI_FINGERPRINT_LOOKUP"])
    {
      uint64_t v9 = 32;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_INITIAL_OFFLINE_SUGGESTION"])
    {
      uint64_t v9 = 33;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_IP_GEO_LOOKUP"])
    {
      uint64_t v9 = 34;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_GROUND_VIEW_LABEL"])
    {
      uint64_t v9 = 35;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_BATCH_SPATIAL_LOOKUP"])
    {
      uint64_t v9 = 36;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_TRANSIT_VEHICLE_POSITION"])
    {
      uint64_t v9 = 37;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_PLACE_COLLECTION_LOOKUP"])
    {
      uint64_t v9 = 38;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_TRANSIT_SCHEDULE_LOOKUP"])
    {
      uint64_t v9 = 39;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_BATCH_CATEGORY_LOOKUP"])
    {
      uint64_t v9 = 40;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_BATCH_MERCHANT_LOOKUP_BRAND"])
    {
      uint64_t v9 = 41;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_CHILD_PLACE_LOOKUP_BY_CATEGORY"])
    {
      uint64_t v9 = 42;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_COLLECTION_SUGGESTION"])
    {
      uint64_t v9 = 43;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_MAPS_SEARCH_HOME"])
    {
      uint64_t v9 = 44;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_PLACE_QUESTIONNAIRE_LOOKUP"])
    {
      uint64_t v9 = 45;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_PUBLISHER_VIEW"])
    {
      uint64_t v9 = 46;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_ALL_COLLECTIONS_VIEW"])
    {
      uint64_t v9 = 47;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_AIRPORT_ENTITY_PLACE_LOOKUP"])
    {
      uint64_t v9 = 48;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_TERRITORY_LOOKUP"])
    {
      uint64_t v9 = 49;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_TRANSIT_NEARBY_SCHEDULE_LOOKUP"])
    {
      uint64_t v9 = 50;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_MAPS_HOME"])
    {
      uint64_t v9 = 51;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_ALL_GUIDES_LOCATIONS"])
    {
      uint64_t v9 = 52;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_GUIDES_HOME"])
    {
      uint64_t v9 = 53;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_EXTENDED_GEO_LOOKUP"])
    {
      uint64_t v9 = 54;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_QUERY_UNDERSTANDING"])
    {
      uint64_t v9 = 55;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_POI_AT_ADDRESS_LOOKUP"])
    {
      uint64_t v9 = 56;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_TRANSIT_NEARBY_PAYMENT_METHOD_LOOKUP"])
    {
      uint64_t v9 = 57;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_PLACECARD_ENRICHMENT"])
    {
      uint64_t v9 = 58;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_OFFLINE_REGION_NAME"])
    {
      uint64_t v9 = 59;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_SEARCH_CAPABILITIES"])
    {
      uint64_t v9 = 60;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_REFRESH_ID_LOOKUP"])
    {
      uint64_t v9 = 61;
    }
    else if ([v8 isEqualToString:@"REQUEST_TYPE_ADDRESS_RECOMMENDATION"])
    {
      uint64_t v9 = 62;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_137;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_137:
    [a1 setPlaceRequestType:v9];
  }

  if (a3) {
    v10 = @"placeDataRequest";
  }
  else {
    v10 = @"place_data_request";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [GEOPDPlaceRequest alloc];
    if (a3) {
      uint64_t v13 = [(GEOPDPlaceRequest *)v12 initWithJSON:v11];
    }
    else {
      uint64_t v13 = [(GEOPDPlaceRequest *)v12 initWithDictionary:v11];
    }
    v14 = (void *)v13;
    [a1 setPlaceDataRequest:v13];
  }
LABEL_147:

  return a1;
}

- (GEOLogMsgStatePlaceRequest)initWithJSON:(id)a3
{
  return (GEOLogMsgStatePlaceRequest *)-[GEOLogMsgStatePlaceRequest _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStatePlaceRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStatePlaceRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOPDPlaceRequest *)self->_placeDataRequest hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLogMsgStatePlaceRequest *)self readAll:0];
  int v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 4) = self->_placeRequestType;
    *((unsigned char *)v5 + 20) |= 1u;
  }
  if (self->_placeDataRequest)
  {
    objc_msgSend(v5, "setPlaceDataRequest:");
    int v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 16) = self->_placeRequestType;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  id v7 = [(GEOPDPlaceRequest *)self->_placeDataRequest copyWithZone:a3];
  id v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  [(GEOLogMsgStatePlaceRequest *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_placeRequestType != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  placeDataRequest = self->_placeDataRequest;
  if ((unint64_t)placeDataRequest | *((void *)v4 + 1)) {
    char v6 = -[GEOPDPlaceRequest isEqual:](placeDataRequest, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  [(GEOLogMsgStatePlaceRequest *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_placeRequestType;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(GEOPDPlaceRequest *)self->_placeDataRequest hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v7 = (int *)a3;
  [v7 readAll:0];
  id v4 = v7;
  if (v7[5])
  {
    self->_placeRequestType = v7[4];
    *(unsigned char *)&self->_flags |= 1u;
  }
  placeDataRequest = self->_placeDataRequest;
  uint64_t v6 = *((void *)v7 + 1);
  if (placeDataRequest)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPDPlaceRequest mergeFrom:](placeDataRequest, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOLogMsgStatePlaceRequest setPlaceDataRequest:](self, "setPlaceDataRequest:");
  }
  id v4 = v7;
LABEL_9:
}

@end