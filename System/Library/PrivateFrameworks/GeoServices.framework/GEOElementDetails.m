@interface GEOElementDetails
+ (BOOL)isValid:(id)a3;
- (BOOL)hasBusinessId;
- (BOOL)hasElementIndex;
- (BOOL)hasElementType;
- (BOOL)hasIsEnrichedResult;
- (BOOL)hasLocalSearchProviderId;
- (BOOL)isEnrichedResult;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOElementDetails)initWithDictionary:(id)a3;
- (GEOElementDetails)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)elementTypeAsString:(int)a3;
- (id)jsonRepresentation;
- (int)StringAsElementType:(id)a3;
- (int)elementType;
- (unint64_t)businessId;
- (unint64_t)hash;
- (unsigned)elementIndex;
- (unsigned)localSearchProviderId;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBusinessId:(unint64_t)a3;
- (void)setElementIndex:(unsigned int)a3;
- (void)setElementType:(int)a3;
- (void)setHasBusinessId:(BOOL)a3;
- (void)setHasElementIndex:(BOOL)a3;
- (void)setHasElementType:(BOOL)a3;
- (void)setHasIsEnrichedResult:(BOOL)a3;
- (void)setHasLocalSearchProviderId:(BOOL)a3;
- (void)setIsEnrichedResult:(BOOL)a3;
- (void)setLocalSearchProviderId:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOElementDetails

- (int)StringAsElementType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ElementType_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ElementType_MAPS_SEARCH_RESULT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_TITLE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_BUTTONS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_INLINE_MAP"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_PHOTOS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_INFOS"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_TRANSIT_DEPARTURE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_TRANSIT_ATTRIBUTION"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_ENCYCLOPEDIC"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_HOURS"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_BUSINESS_INFOS"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_REVIEWS"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_ACTIONS_ROW"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_RESERVATIONS"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_OFFICIAL_APPS"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_VENUE_BROWSE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_VENUE_INFO"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_INFO_PARENT"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_ANNOTATED_LIST"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_ANNOTATED_PICTURE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_MESSAGE"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_MESSAGE_HOURS"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_ACTION_FOOTER"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_ATTRIBUTION"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_WEB_CONTENT"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_RELATED_PLACE_LIST"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_SERVICE_HOURS"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_QUICK_LINKS"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_COLLECTIONS"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_PLACE_BROWSE_CATEGORIES"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_MINI_PLACE_BROWSE_CATEGORIES"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_CURATED_COLLECTIONS"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_PLACE_QUESTIONNAIRE"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_APPLE_RATINGS"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_PLACE_RIBBON"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_REVIEW_AND_RATING"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_ABOUT"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_TEMPLATE_PLACE"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_TRANSIT_LABELS"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_PLACECARD_ENRICHMENT"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_UNIFIED_ACTION_ROW"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_QUESTIONNAIRE_SUGGESTION"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_EV_CHARGER"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_HIKING_ASSOCIATION"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_NOTE"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"ElementType_MODULE_TYPE_HIKING_SUGGESTION"])
  {
    int v4 = 46;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)elementType
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_elementType;
  }
  else {
    return 0;
  }
}

- (void)setElementType:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_elementType = a3;
}

- (void)setHasElementType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasElementType
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)elementTypeAsString:(int)a3
{
  if (a3 >= 0x2F)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F76C0[a3];
  }

  return v3;
}

- (unint64_t)businessId
{
  return self->_businessId;
}

- (void)setBusinessId:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_businessId = a3;
}

- (void)setHasBusinessId:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasBusinessId
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)localSearchProviderId
{
  return self->_localSearchProviderId;
}

- (void)setLocalSearchProviderId:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_localSearchProviderId = a3;
}

- (void)setHasLocalSearchProviderId:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasLocalSearchProviderId
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (unsigned)elementIndex
{
  return self->_elementIndex;
}

- (void)setElementIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_elementIndex = a3;
}

- (void)setHasElementIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasElementIndex
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)isEnrichedResult
{
  return self->_isEnrichedResult;
}

- (void)setIsEnrichedResult:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_isEnrichedResult = a3;
}

- (void)setHasIsEnrichedResult:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasIsEnrichedResult
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOElementDetails;
  int v4 = [(GEOElementDetails *)&v8 description];
  v5 = [(GEOElementDetails *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOElementDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_31;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 32);
  if ((v5 & 4) != 0)
  {
    uint64_t v6 = *(int *)(a1 + 20);
    if (v6 >= 0x2F)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 20));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E53F76C0[v6];
    }
    if (a2) {
      objc_super v8 = @"elementType";
    }
    else {
      objc_super v8 = @"element_type";
    }
    [v4 setObject:v7 forKey:v8];

    char v5 = *(unsigned char *)(a1 + 32);
  }
  if (v5)
  {
    v9 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 8)];
    if (a2) {
      v10 = @"businessId";
    }
    else {
      v10 = @"business_id";
    }
    [v4 setObject:v9 forKey:v10];

    char v5 = *(unsigned char *)(a1 + 32);
    if ((v5 & 8) == 0)
    {
LABEL_12:
      if ((v5 & 2) == 0) {
        goto LABEL_13;
      }
LABEL_23:
      v13 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
      if (a2) {
        v14 = @"elementIndex";
      }
      else {
        v14 = @"element_index";
      }
      [v4 setObject:v13 forKey:v14];

      if ((*(unsigned char *)(a1 + 32) & 0x10) == 0) {
        goto LABEL_31;
      }
      goto LABEL_27;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_12;
  }
  v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
  if (a2) {
    v12 = @"localSearchProviderId";
  }
  else {
    v12 = @"local_search_provider_id";
  }
  [v4 setObject:v11 forKey:v12];

  char v5 = *(unsigned char *)(a1 + 32);
  if ((v5 & 2) != 0) {
    goto LABEL_23;
  }
LABEL_13:
  if ((v5 & 0x10) != 0)
  {
LABEL_27:
    v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 28)];
    if (a2) {
      v16 = @"isEnrichedResult";
    }
    else {
      v16 = @"is_enriched_result";
    }
    [v4 setObject:v15 forKey:v16];
  }
LABEL_31:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOElementDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOElementDetails)initWithDictionary:(id)a3
{
  return (GEOElementDetails *)-[GEOElementDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_127;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_127;
  }
  if (a3) {
    uint64_t v6 = @"elementType";
  }
  else {
    uint64_t v6 = @"element_type";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"ElementType_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"ElementType_MAPS_SEARCH_RESULT"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_TITLE"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_BUTTONS"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_INLINE_MAP"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_PHOTOS"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_INFOS"])
    {
      uint64_t v9 = 6;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_TRANSIT_DEPARTURE"])
    {
      uint64_t v9 = 7;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_TRANSIT_ATTRIBUTION"])
    {
      uint64_t v9 = 8;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_ENCYCLOPEDIC"])
    {
      uint64_t v9 = 9;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_HOURS"])
    {
      uint64_t v9 = 10;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_BUSINESS_INFOS"])
    {
      uint64_t v9 = 11;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_REVIEWS"])
    {
      uint64_t v9 = 12;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_ACTIONS_ROW"])
    {
      uint64_t v9 = 13;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_RESERVATIONS"])
    {
      uint64_t v9 = 14;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_OFFICIAL_APPS"])
    {
      uint64_t v9 = 15;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_VENUE_BROWSE"])
    {
      uint64_t v9 = 16;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_VENUE_INFO"])
    {
      uint64_t v9 = 17;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_INFO_PARENT"])
    {
      uint64_t v9 = 18;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_ANNOTATED_LIST"])
    {
      uint64_t v9 = 19;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_ANNOTATED_PICTURE"])
    {
      uint64_t v9 = 20;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_MESSAGE"])
    {
      uint64_t v9 = 21;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_MESSAGE_HOURS"])
    {
      uint64_t v9 = 22;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_ACTION_FOOTER"])
    {
      uint64_t v9 = 23;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_ATTRIBUTION"])
    {
      uint64_t v9 = 24;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_WEB_CONTENT"])
    {
      uint64_t v9 = 25;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_RELATED_PLACE_LIST"])
    {
      uint64_t v9 = 26;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_SERVICE_HOURS"])
    {
      uint64_t v9 = 27;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_QUICK_LINKS"])
    {
      uint64_t v9 = 28;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_COLLECTIONS"])
    {
      uint64_t v9 = 29;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_PLACE_BROWSE_CATEGORIES"])
    {
      uint64_t v9 = 30;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_MINI_PLACE_BROWSE_CATEGORIES"])
    {
      uint64_t v9 = 31;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_CURATED_COLLECTIONS"])
    {
      uint64_t v9 = 32;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_PLACE_QUESTIONNAIRE"])
    {
      uint64_t v9 = 33;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_APPLE_RATINGS"])
    {
      uint64_t v9 = 34;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_PLACE_RIBBON"])
    {
      uint64_t v9 = 35;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_REVIEW_AND_RATING"])
    {
      uint64_t v9 = 36;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_ABOUT"])
    {
      uint64_t v9 = 37;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_TEMPLATE_PLACE"])
    {
      uint64_t v9 = 38;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_TRANSIT_LABELS"])
    {
      uint64_t v9 = 39;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_PLACECARD_ENRICHMENT"])
    {
      uint64_t v9 = 40;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_UNIFIED_ACTION_ROW"])
    {
      uint64_t v9 = 41;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_QUESTIONNAIRE_SUGGESTION"])
    {
      uint64_t v9 = 42;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_EV_CHARGER"])
    {
      uint64_t v9 = 43;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_HIKING_ASSOCIATION"])
    {
      uint64_t v9 = 44;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_NOTE"])
    {
      uint64_t v9 = 45;
    }
    else if ([v8 isEqualToString:@"ElementType_MODULE_TYPE_HIKING_SUGGESTION"])
    {
      uint64_t v9 = 46;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_105;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_105:
    [a1 setElementType:v9];
  }

  if (a3) {
    v10 = @"businessId";
  }
  else {
    v10 = @"business_id";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setBusinessId:", objc_msgSend(v11, "unsignedLongLongValue"));
  }

  if (a3) {
    v12 = @"localSearchProviderId";
  }
  else {
    v12 = @"local_search_provider_id";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setLocalSearchProviderId:", objc_msgSend(v13, "unsignedIntValue"));
  }

  if (a3) {
    v14 = @"elementIndex";
  }
  else {
    v14 = @"element_index";
  }
  v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setElementIndex:", objc_msgSend(v15, "unsignedIntValue"));
  }

  if (a3) {
    v16 = @"isEnrichedResult";
  }
  else {
    v16 = @"is_enriched_result";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsEnrichedResult:", objc_msgSend(v17, "BOOLValue"));
  }

LABEL_127:
  return a1;
}

- (GEOElementDetails)initWithJSON:(id)a3
{
  return (GEOElementDetails *)-[GEOElementDetails _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOElementDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOElementDetailsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteBOOLField();
LABEL_7:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOElementDetails *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[5] = self->_elementType;
    *((unsigned char *)v5 + 32) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v5 + 1) = self->_businessId;
  *((unsigned char *)v5 + 32) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v5[6] = self->_localSearchProviderId;
  *((unsigned char *)v5 + 32) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v5[4] = self->_elementIndex;
  *((unsigned char *)v5 + 32) |= 2u;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
LABEL_6:
    *((unsigned char *)v5 + 28) = self->_isEnrichedResult;
    *((unsigned char *)v5 + 32) |= 0x10u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)result + 5) = self->_elementType;
    *((unsigned char *)result + 32) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = self->_businessId;
  *((unsigned char *)result + 32) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 6) = self->_localSearchProviderId;
  *((unsigned char *)result + 32) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 4) = self->_elementIndex;
  *((unsigned char *)result + 32) |= 2u;
  if ((*(unsigned char *)&self->_flags & 0x10) == 0) {
    return result;
  }
LABEL_6:
  *((unsigned char *)result + 28) = self->_isEnrichedResult;
  *((unsigned char *)result + 32) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  [(GEOElementDetails *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_elementType != *((_DWORD *)v4 + 5)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_businessId != *((void *)v4 + 1)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0 || self->_localSearchProviderId != *((_DWORD *)v4 + 6)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_elementIndex != *((_DWORD *)v4 + 4)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_24;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 0x10) == 0;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x10) == 0)
    {
LABEL_24:
      BOOL v5 = 0;
      goto LABEL_25;
    }
    if (self->_isEnrichedResult)
    {
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)v4 + 28))
    {
      goto LABEL_24;
    }
    BOOL v5 = 1;
  }
LABEL_25:

  return v5;
}

- (unint64_t)hash
{
  [(GEOElementDetails *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_elementType;
    if (*(unsigned char *)&self->_flags)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_businessId;
      if ((*(unsigned char *)&self->_flags & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
  }
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_localSearchProviderId;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
LABEL_9:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_elementIndex;
  if ((*(unsigned char *)&self->_flags & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_isEnrichedResult;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 4) != 0)
  {
    self->_elementType = *((_DWORD *)v5 + 5);
    *(unsigned char *)&self->_flags |= 4u;
    char v4 = *((unsigned char *)v5 + 32);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v5 + 32) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_businessId = *((void *)v5 + 1);
  *(unsigned char *)&self->_flags |= 1u;
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_localSearchProviderId = *((_DWORD *)v5 + 6);
  *(unsigned char *)&self->_flags |= 8u;
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 2) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_elementIndex = *((_DWORD *)v5 + 4);
  *(unsigned char *)&self->_flags |= 2u;
  if ((*((unsigned char *)v5 + 32) & 0x10) != 0)
  {
LABEL_6:
    self->_isEnrichedResult = *((unsigned char *)v5 + 28);
    *(unsigned char *)&self->_flags |= 0x10u;
  }
LABEL_7:
}

@end