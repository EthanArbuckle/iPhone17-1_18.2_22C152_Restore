@interface GEOGeoServiceTag
+ (BOOL)isValid:(id)a3;
+ (id)defaultTag;
- (BOOL)hasServiceType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOGeoServiceTag)initWithDictionary:(id)a3;
- (GEOGeoServiceTag)initWithJSON:(id)a3;
- (NSString)tag;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)serviceTypeAsString:(int)a3;
- (int)StringAsServiceType:(id)a3;
- (int)serviceType;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasServiceType:(BOOL)a3;
- (void)setServiceType:(int)a3;
- (void)setTag:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOGeoServiceTag

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

+ (id)defaultTag
{
  v2 = objc_alloc_init(GEOGeoServiceTag);
  [(GEOGeoServiceTag *)v2 setServiceType:18];
  v3 = [MEMORY[0x1E4F29128] UUID];
  v4 = [v3 UUIDString];
  [(GEOGeoServiceTag *)v2 setTag:v4];

  return v2;
}

- (void)setTag:(id)a3
{
}

- (void)setServiceType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_serviceType = a3;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt32Field();
  }
  PBDataWriterWriteStringField();
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (int)serviceType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_serviceType;
  }
  else {
    return 0;
  }
}

- (void)setHasServiceType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasServiceType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)serviceTypeAsString:(int)a3
{
  if (a3 >= 0x1D)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53EB6E8[a3];
  }

  return v3;
}

- (int)StringAsServiceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SERVICE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"REV_GEO"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FWD_GEO"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SEARCH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ROUTING"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LOCATION_SERVICE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"COLLECTION"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CELL_WIFI_HARVEST"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"TRACE_HARVEST"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_TILES"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"RASTER"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"AUTO_COMPLETE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"DASHBOARD_TEST"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"VECTOR"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"ADDR_PTS_HARVEST"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"DISPATCHER"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"PLACE_LOOKUP"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"PARSEC"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"GEO_SERVICES_FRAMEWORK"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"SIRI"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"MERCHANT_LOOKUP"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"GEO_SEARCH"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_ETA"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"COMMUNITY"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"LOCUS"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"AUTONAVI_FRONTDOOR"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"COMMUNITY_NON_PII"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"DISPATCHER_ENRICHMENT"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"MAPS_APP_WEB_SERVICE"])
  {
    int v4 = 28;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (NSString)tag
{
  return self->_tag;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOGeoServiceTag;
  int v4 = [(GEOGeoServiceTag *)&v8 description];
  v5 = [(GEOGeoServiceTag *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOGeoServiceTag _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 28))
    {
      uint64_t v5 = *(int *)(a1 + 24);
      if (v5 >= 0x1D)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53EB6E8[v5];
      }
      [v4 setObject:v6 forKey:@"serviceType"];
    }
    v7 = [(id)a1 tag];
    if (v7) {
      [v4 setObject:v7 forKey:@"tag"];
    }

    objc_super v8 = *(void **)(a1 + 8);
    if (v8)
    {
      v9 = [v8 dictionaryRepresentation];
      v10 = v9;
      if (a2)
      {
        v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __46__GEOGeoServiceTag__dictionaryRepresentation___block_invoke;
        v15[3] = &unk_1E53D8860;
        id v12 = v11;
        id v16 = v12;
        [v10 enumerateKeysAndObjectsUsingBlock:v15];
        id v13 = v12;

        v10 = v13;
      }
      [v4 setObject:v10 forKey:@"Unknown Fields"];
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
  return -[GEOGeoServiceTag _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOGeoServiceTag__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
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

- (GEOGeoServiceTag)initWithDictionary:(id)a3
{
  return (GEOGeoServiceTag *)-[GEOGeoServiceTag _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_70;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_70;
  }
  int v4 = [v3 objectForKeyedSubscript:@"serviceType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 isEqualToString:@"SERVICE_UNKNOWN"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"REV_GEO"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"FWD_GEO"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"SEARCH"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"ROUTING"])
    {
      uint64_t v6 = 4;
    }
    else if ([v5 isEqualToString:@"LOCATION_SERVICE"])
    {
      uint64_t v6 = 5;
    }
    else if ([v5 isEqualToString:@"COLLECTION"])
    {
      uint64_t v6 = 6;
    }
    else if ([v5 isEqualToString:@"CELL_WIFI_HARVEST"])
    {
      uint64_t v6 = 7;
    }
    else if ([v5 isEqualToString:@"TRACE_HARVEST"])
    {
      uint64_t v6 = 8;
    }
    else if ([v5 isEqualToString:@"TRAFFIC_TILES"])
    {
      uint64_t v6 = 9;
    }
    else if ([v5 isEqualToString:@"RASTER"])
    {
      uint64_t v6 = 10;
    }
    else if ([v5 isEqualToString:@"AUTO_COMPLETE"])
    {
      uint64_t v6 = 11;
    }
    else if ([v5 isEqualToString:@"DASHBOARD_TEST"])
    {
      uint64_t v6 = 12;
    }
    else if ([v5 isEqualToString:@"VECTOR"])
    {
      uint64_t v6 = 13;
    }
    else if ([v5 isEqualToString:@"ADDR_PTS_HARVEST"])
    {
      uint64_t v6 = 14;
    }
    else if ([v5 isEqualToString:@"DISPATCHER"])
    {
      uint64_t v6 = 15;
    }
    else if ([v5 isEqualToString:@"PLACE_LOOKUP"])
    {
      uint64_t v6 = 16;
    }
    else if ([v5 isEqualToString:@"PARSEC"])
    {
      uint64_t v6 = 17;
    }
    else if ([v5 isEqualToString:@"GEO_SERVICES_FRAMEWORK"])
    {
      uint64_t v6 = 18;
    }
    else if ([v5 isEqualToString:@"SIRI"])
    {
      uint64_t v6 = 19;
    }
    else if ([v5 isEqualToString:@"MERCHANT_LOOKUP"])
    {
      uint64_t v6 = 20;
    }
    else if ([v5 isEqualToString:@"GEO_SEARCH"])
    {
      uint64_t v6 = 21;
    }
    else if ([v5 isEqualToString:@"TRAFFIC_ETA"])
    {
      uint64_t v6 = 22;
    }
    else if ([v5 isEqualToString:@"COMMUNITY"])
    {
      uint64_t v6 = 23;
    }
    else if ([v5 isEqualToString:@"LOCUS"])
    {
      uint64_t v6 = 24;
    }
    else if ([v5 isEqualToString:@"AUTONAVI_FRONTDOOR"])
    {
      uint64_t v6 = 25;
    }
    else if ([v5 isEqualToString:@"COMMUNITY_NON_PII"])
    {
      uint64_t v6 = 26;
    }
    else if ([v5 isEqualToString:@"DISPATCHER_ENRICHMENT"])
    {
      uint64_t v6 = 27;
    }
    else if ([v5 isEqualToString:@"MAPS_APP_WEB_SERVICE"])
    {
      uint64_t v6 = 28;
    }
    else
    {
      uint64_t v6 = 0;
    }

    goto LABEL_66;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v4 intValue];
LABEL_66:
    [a1 setServiceType:v6];
  }

  v7 = [v3 objectForKeyedSubscript:@"tag"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = (void *)[v7 copy];
    [a1 setTag:v8];
  }
LABEL_70:

  return a1;
}

- (GEOGeoServiceTag)initWithJSON:(id)a3
{
  return (GEOGeoServiceTag *)-[GEOGeoServiceTag _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOGeoServiceTagIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOGeoServiceTagReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  [(GEOGeoServiceTag *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v4[6] = self->_serviceType;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  [v4 setTag:self->_tag];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 24) = self->_serviceType;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_tag copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  [(GEOGeoServiceTag *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_serviceType != *((_DWORD *)v4 + 6)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  tag = self->_tag;
  if ((unint64_t)tag | *((void *)v4 + 2)) {
    char v6 = -[NSString isEqual:](tag, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  [(GEOGeoServiceTag *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_serviceType;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(NSString *)self->_tag hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (int *)a3;
  [v5 readAll:0];
  id v4 = v5;
  if (v5[7])
  {
    self->_serviceType = v5[6];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v5 + 2))
  {
    -[GEOGeoServiceTag setTag:](self, "setTag:");
    id v4 = v5;
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOGeoServiceTag *)self readAll:0];
  }
}

@end