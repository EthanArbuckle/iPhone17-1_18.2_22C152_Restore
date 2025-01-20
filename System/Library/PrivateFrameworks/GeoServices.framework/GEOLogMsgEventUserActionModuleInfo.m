@interface GEOLogMsgEventUserActionModuleInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasModuleMetadata;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventUserActionModuleInfo)initWithDictionary:(id)a3;
- (GEOLogMsgEventUserActionModuleInfo)initWithJSON:(id)a3;
- (NSString)moduleMetadata;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setModuleMetadata:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventUserActionModuleInfo

- (int)type
{
  if (*(unsigned char *)&self->_flags) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)typeAsString:(int)a3
{
  if a3 < 0x2F && ((0x7FFFFFFFDFFFuLL >> a3))
  {
    v3 = off_1E53F8A08[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MODULE_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_TITLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_BUTTONS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_INLINE_MAP"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_PHOTOS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_INFOS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_TRANSIT_DEPARTURE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_TRANSIT_ATTRIBUTION"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_ENCYCLOPEDIC"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_HOURS"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_BUSINESS_INFOS"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_REVIEWS"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_ACTIONS_ROW"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_RESERVATIONS"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_OFFICIAL_APPS"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_VENUE_BROWSE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_VENUE_INFO"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_INFO_PARENT"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_ANNOTATED_LIST"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_ANNOTATED_PICTURE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_MESSAGE"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_MESSAGE_HOURS"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_ACTION_FOOTER"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_ATTRIBUTION"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_WEB_CONTENT"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_RELATED_PLACE_LIST"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_SERVICE_HOURS"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_QUICK_LINKS"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_COLLECTIONS"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_PLACE_BROWSE_CATEGORIES"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_MINI_PLACE_BROWSE_CATEGORIES"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_CURATED_COLLECTIONS"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_PLACE_QUESTIONNAIRE"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_APPLE_RATINGS"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_PLACE_RIBBON"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_REVIEW_AND_RATING"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_ABOUT"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_TEMPLATE_PLACE"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_TRANSIT_LABELS"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_PLACECARD_ENRICHMENT"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_UNIFIED_ACTION_ROW"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_QUESTIONNAIRE_SUGGESTION"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_EV_CHARGER"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_HIKING_ASSOCIATION"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_NOTE"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"MODULE_TYPE_HIKE_SUGGESTION"])
  {
    int v4 = 46;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasModuleMetadata
{
  return self->_moduleMetadata != 0;
}

- (NSString)moduleMetadata
{
  return self->_moduleMetadata;
}

- (void)setModuleMetadata:(id)a3
{
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventUserActionModuleInfo;
  int v4 = [(GEOLogMsgEventUserActionModuleInfo *)&v8 description];
  v5 = [(GEOLogMsgEventUserActionModuleInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventUserActionModuleInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 20))
    {
      unsigned int v5 = *(_DWORD *)(a1 + 16);
      if (v5 < 0x2F && ((0x7FFFFFFFDFFFuLL >> v5) & 1) != 0)
      {
        v6 = off_1E53F8A08[v5];
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 16));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      [v4 setObject:v6 forKey:@"type"];
    }
    v7 = [(id)a1 moduleMetadata];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"moduleMetadata";
      }
      else {
        objc_super v8 = @"module_metadata";
      }
      [v4 setObject:v7 forKey:v8];
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
  return -[GEOLogMsgEventUserActionModuleInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventUserActionModuleInfo)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventUserActionModuleInfo *)-[GEOLogMsgEventUserActionModuleInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_107;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_107;
  }
  v6 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"MODULE_TYPE_UNKNOWN"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_TITLE"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_BUTTONS"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_INLINE_MAP"])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_PHOTOS"])
    {
      uint64_t v8 = 4;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_INFOS"])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_TRANSIT_DEPARTURE"])
    {
      uint64_t v8 = 6;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_TRANSIT_ATTRIBUTION"])
    {
      uint64_t v8 = 7;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_ENCYCLOPEDIC"])
    {
      uint64_t v8 = 8;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_HOURS"])
    {
      uint64_t v8 = 9;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_BUSINESS_INFOS"])
    {
      uint64_t v8 = 10;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_REVIEWS"])
    {
      uint64_t v8 = 11;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_ACTIONS_ROW"])
    {
      uint64_t v8 = 12;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_RESERVATIONS"])
    {
      uint64_t v8 = 14;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_OFFICIAL_APPS"])
    {
      uint64_t v8 = 15;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_VENUE_BROWSE"])
    {
      uint64_t v8 = 16;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_VENUE_INFO"])
    {
      uint64_t v8 = 17;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_INFO_PARENT"])
    {
      uint64_t v8 = 18;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_ANNOTATED_LIST"])
    {
      uint64_t v8 = 19;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_ANNOTATED_PICTURE"])
    {
      uint64_t v8 = 20;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_MESSAGE"])
    {
      uint64_t v8 = 21;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_MESSAGE_HOURS"])
    {
      uint64_t v8 = 22;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_ACTION_FOOTER"])
    {
      uint64_t v8 = 23;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_ATTRIBUTION"])
    {
      uint64_t v8 = 24;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_WEB_CONTENT"])
    {
      uint64_t v8 = 25;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_RELATED_PLACE_LIST"])
    {
      uint64_t v8 = 26;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_SERVICE_HOURS"])
    {
      uint64_t v8 = 27;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_QUICK_LINKS"])
    {
      uint64_t v8 = 28;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_COLLECTIONS"])
    {
      uint64_t v8 = 29;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_PLACE_BROWSE_CATEGORIES"])
    {
      uint64_t v8 = 30;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_MINI_PLACE_BROWSE_CATEGORIES"])
    {
      uint64_t v8 = 31;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_CURATED_COLLECTIONS"])
    {
      uint64_t v8 = 32;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_PLACE_QUESTIONNAIRE"])
    {
      uint64_t v8 = 33;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_APPLE_RATINGS"])
    {
      uint64_t v8 = 34;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_PLACE_RIBBON"])
    {
      uint64_t v8 = 35;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_REVIEW_AND_RATING"])
    {
      uint64_t v8 = 36;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_ABOUT"])
    {
      uint64_t v8 = 37;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_TEMPLATE_PLACE"])
    {
      uint64_t v8 = 38;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_TRANSIT_LABELS"])
    {
      uint64_t v8 = 39;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_PLACECARD_ENRICHMENT"])
    {
      uint64_t v8 = 40;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_UNIFIED_ACTION_ROW"])
    {
      uint64_t v8 = 41;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_QUESTIONNAIRE_SUGGESTION"])
    {
      uint64_t v8 = 42;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_EV_CHARGER"])
    {
      uint64_t v8 = 43;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_HIKING_ASSOCIATION"])
    {
      uint64_t v8 = 44;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_NOTE"])
    {
      uint64_t v8 = 45;
    }
    else if ([v7 isEqualToString:@"MODULE_TYPE_HIKE_SUGGESTION"])
    {
      uint64_t v8 = 46;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_100;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_100:
    [a1 setType:v8];
  }

  if (a3) {
    v9 = @"moduleMetadata";
  }
  else {
    v9 = @"module_metadata";
  }
  v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = (void *)[v10 copy];
    [a1 setModuleMetadata:v11];
  }
LABEL_107:

  return a1;
}

- (GEOLogMsgEventUserActionModuleInfo)initWithJSON:(id)a3
{
  return (GEOLogMsgEventUserActionModuleInfo *)-[GEOLogMsgEventUserActionModuleInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventUserActionModuleInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventUserActionModuleInfoReadAllFrom((uint64_t)self, a3);
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
  if (self->_moduleMetadata)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLogMsgEventUserActionModuleInfo *)self readAll:0];
  id v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 4) = self->_type;
    *((unsigned char *)v5 + 20) |= 1u;
  }
  if (self->_moduleMetadata)
  {
    objc_msgSend(v5, "setModuleMetadata:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 16) = self->_type;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_moduleMetadata copyWithZone:a3];
  uint64_t v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  [(GEOLogMsgEventUserActionModuleInfo *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_type != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  moduleMetadata = self->_moduleMetadata;
  if ((unint64_t)moduleMetadata | *((void *)v4 + 1)) {
    char v6 = -[NSString isEqual:](moduleMetadata, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventUserActionModuleInfo *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(NSString *)self->_moduleMetadata hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (int *)a3;
  [v5 readAll:0];
  id v4 = v5;
  if (v5[5])
  {
    self->_type = v5[4];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v5 + 1))
  {
    -[GEOLogMsgEventUserActionModuleInfo setModuleMetadata:](self, "setModuleMetadata:");
    id v4 = v5;
  }
}

- (void).cxx_destruct
{
}

@end