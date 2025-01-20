@interface GEOPDShardedId
+ (BOOL)isValid:(id)a3;
- (BOOL)hasBasemapId;
- (BOOL)hasCenter;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIsExternalVisibleId;
- (BOOL)hasMapsResultType;
- (BOOL)hasMuid;
- (BOOL)hasResultProviderId;
- (BOOL)hasSourceId;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExternalVisibleId;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)center;
- (GEOPDShardedId)initWithDictionary:(id)a3;
- (GEOPDShardedId)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)mapsResultTypeAsString:(int)a3;
- (int)StringAsMapsResultType:(id)a3;
- (int)mapsResultType;
- (int)resultProviderId;
- (unint64_t)basemapId;
- (unint64_t)hash;
- (unint64_t)muid;
- (unsigned)sourceId;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBasemapId:(unint64_t)a3;
- (void)setCenter:(id)a3;
- (void)setHasBasemapId:(BOOL)a3;
- (void)setHasIsExternalVisibleId:(BOOL)a3;
- (void)setHasMapsResultType:(BOOL)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setHasResultProviderId:(BOOL)a3;
- (void)setHasSourceId:(BOOL)a3;
- (void)setIsExternalVisibleId:(BOOL)a3;
- (void)setMapsResultType:(int)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setResultProviderId:(int)a3;
- (void)setSourceId:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDShardedId

- (BOOL)hasMuid
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(void *)(v5 + 32) = self->_muid;
    *(unsigned char *)(v5 + 56) |= 2u;
  }
  id v7 = [(GEOLatLng *)self->_center copyWithZone:a3];
  v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v6 + 44) = self->_resultProviderId;
    *(unsigned char *)(v6 + 56) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_5:
      if ((flags & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_5;
  }
  *(void *)(v6 + 16) = self->_basemapId;
  *(unsigned char *)(v6 + 56) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_6:
    if ((flags & 4) == 0) {
      goto LABEL_7;
    }
LABEL_13:
    *(_DWORD *)(v6 + 40) = self->_mapsResultType;
    *(unsigned char *)(v6 + 56) |= 4u;
    if ((*(unsigned char *)&self->_flags & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_12:
  *(_DWORD *)(v6 + 48) = self->_sourceId;
  *(unsigned char *)(v6 + 56) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_13;
  }
LABEL_7:
  if ((flags & 0x20) != 0)
  {
LABEL_8:
    *(unsigned char *)(v6 + 52) = self->_isExternalVisibleId;
    *(unsigned char *)(v6 + 56) |= 0x20u;
  }
LABEL_9:
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (void)setResultProviderId:(int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_resultProviderId = a3;
}

- (void)setCenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_center, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (GEOLatLng)center
{
  return self->_center;
}

- (BOOL)hasCenter
{
  return self->_center != 0;
}

- (BOOL)hasResultProviderId
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (int)resultProviderId
{
  return self->_resultProviderId;
}

- (BOOL)hasBasemapId
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_center) {
    PBDataWriterWriteSubmessage();
  }
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_7:
      if ((flags & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_8:
    if ((flags & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_9:
    if ((flags & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
LABEL_10:
  }
    PBDataWriterWriteBOOLField();
LABEL_11:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (unint64_t)hash
{
  [(GEOPDShardedId *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    unint64_t v3 = 2654435761u * self->_muid;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOLatLng *)self->_center hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    uint64_t v5 = 2654435761 * self->_resultProviderId;
    if (*(unsigned char *)&self->_flags)
    {
LABEL_6:
      unint64_t v6 = 2654435761u * self->_basemapId;
      if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
        goto LABEL_7;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_6;
    }
  }
  unint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_sourceId;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_8;
    }
LABEL_13:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
      goto LABEL_9;
    }
LABEL_14:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_12:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_mapsResultType;
  if ((*(unsigned char *)&self->_flags & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_isExternalVisibleId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)setMuid:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (void)setHasResultProviderId:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (unint64_t)basemapId
{
  return self->_basemapId;
}

- (void)setBasemapId:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_basemapId = a3;
}

- (void)setHasBasemapId:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (unsigned)sourceId
{
  return self->_sourceId;
}

- (void)setSourceId:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_sourceId = a3;
}

- (void)setHasSourceId:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasSourceId
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (int)mapsResultType
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_mapsResultType;
  }
  else {
    return 1;
  }
}

- (void)setMapsResultType:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_mapsResultType = a3;
}

- (void)setHasMapsResultType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasMapsResultType
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)mapsResultTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E68D8[a3];
  }

  return v3;
}

- (int)StringAsMapsResultType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MAPS_RESULT_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MAPS_RESULT_TYPE_PLACE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MAPS_RESULT_TYPE_COLLECTION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MAPS_RESULT_TYPE_PUBLISHER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MAPS_RESULT_TYPE_PLACE_QUESTIONNAIRE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MAPS_RESULT_TYPE_BATCH_REVERSE_GEOCODE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)isExternalVisibleId
{
  return self->_isExternalVisibleId;
}

- (void)setIsExternalVisibleId:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_isExternalVisibleId = a3;
}

- (void)setHasIsExternalVisibleId:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasIsExternalVisibleId
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDShardedId;
  int v4 = [(GEOPDShardedId *)&v8 description];
  uint64_t v5 = [(GEOPDShardedId *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDShardedId _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_22;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)(a1 + 56) & 2) != 0)
  {
    uint64_t v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
    [v4 setObject:v5 forKey:@"muid"];
  }
  unint64_t v6 = [(id)a1 center];
  uint64_t v7 = v6;
  if (v6)
  {
    if (a2) {
      [v6 jsonRepresentation];
    }
    else {
    objc_super v8 = [v6 dictionaryRepresentation];
    }
    [v4 setObject:v8 forKey:@"center"];
  }
  char v9 = *(unsigned char *)(a1 + 56);
  if ((v9 & 8) != 0)
  {
    v19 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
    if (a2) {
      v20 = @"resultProviderId";
    }
    else {
      v20 = @"result_provider_id";
    }
    [v4 setObject:v19 forKey:v20];

    char v9 = *(unsigned char *)(a1 + 56);
    if ((v9 & 1) == 0)
    {
LABEL_11:
      if ((v9 & 0x10) == 0) {
        goto LABEL_12;
      }
      goto LABEL_33;
    }
  }
  else if ((*(unsigned char *)(a1 + 56) & 1) == 0)
  {
    goto LABEL_11;
  }
  v21 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
  if (a2) {
    v22 = @"basemapId";
  }
  else {
    v22 = @"basemap_id";
  }
  [v4 setObject:v21 forKey:v22];

  char v9 = *(unsigned char *)(a1 + 56);
  if ((v9 & 0x10) == 0)
  {
LABEL_12:
    if ((v9 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_33:
  v23 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  if (a2) {
    v24 = @"sourceId";
  }
  else {
    v24 = @"source_id";
  }
  [v4 setObject:v23 forKey:v24];

  char v9 = *(unsigned char *)(a1 + 56);
  if ((v9 & 4) == 0)
  {
LABEL_13:
    if ((v9 & 0x20) == 0) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
LABEL_37:
  uint64_t v25 = *(int *)(a1 + 40);
  if (v25 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 40));
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = off_1E53E68D8[v25];
  }
  if (a2) {
    v27 = @"mapsResultType";
  }
  else {
    v27 = @"maps_result_type";
  }
  [v4 setObject:v26 forKey:v27];

  if ((*(unsigned char *)(a1 + 56) & 0x20) != 0)
  {
LABEL_14:
    v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 52)];
    if (a2) {
      v11 = @"isExternalVisibleId";
    }
    else {
      v11 = @"is_external_visible_id";
    }
    [v4 setObject:v10 forKey:v11];
  }
LABEL_18:
  v12 = *(void **)(a1 + 8);
  if (v12)
  {
    v13 = [v12 dictionaryRepresentation];
    v14 = v13;
    if (a2)
    {
      v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __44__GEOPDShardedId__dictionaryRepresentation___block_invoke;
      v28[3] = &unk_1E53D8860;
      id v16 = v15;
      id v29 = v16;
      [v14 enumerateKeysAndObjectsUsingBlock:v28];
      id v17 = v16;

      v14 = v17;
    }
    [v4 setObject:v14 forKey:@"Unknown Fields"];
  }
LABEL_22:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDShardedId _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOPDShardedId__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    char v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPDShardedId)initWithDictionary:(id)a3
{
  return (GEOPDShardedId *)-[GEOPDShardedId _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_52;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_52;
  }
  unint64_t v6 = [v5 objectForKeyedSubscript:@"muid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setMuid:", objc_msgSend(v6, "unsignedLongLongValue"));
  }

  uint64_t v7 = [v5 objectForKeyedSubscript:@"center"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = [GEOLatLng alloc];
    if (a3) {
      uint64_t v9 = [(GEOLatLng *)v8 initWithJSON:v7];
    }
    else {
      uint64_t v9 = [(GEOLatLng *)v8 initWithDictionary:v7];
    }
    id v10 = (void *)v9;
    [a1 setCenter:v9];
  }
  if (a3) {
    v11 = @"resultProviderId";
  }
  else {
    v11 = @"result_provider_id";
  }
  v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setResultProviderId:", objc_msgSend(v12, "intValue"));
  }

  if (a3) {
    v13 = @"basemapId";
  }
  else {
    v13 = @"basemap_id";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setBasemapId:", objc_msgSend(v14, "unsignedLongLongValue"));
  }

  if (a3) {
    v15 = @"sourceId";
  }
  else {
    v15 = @"source_id";
  }
  id v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setSourceId:", objc_msgSend(v16, "unsignedIntValue"));
  }

  if (a3) {
    id v17 = @"mapsResultType";
  }
  else {
    id v17 = @"maps_result_type";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v18;
    if ([v19 isEqualToString:@"MAPS_RESULT_TYPE_UNKNOWN"])
    {
      uint64_t v20 = 0;
    }
    else if ([v19 isEqualToString:@"MAPS_RESULT_TYPE_PLACE"])
    {
      uint64_t v20 = 1;
    }
    else if ([v19 isEqualToString:@"MAPS_RESULT_TYPE_COLLECTION"])
    {
      uint64_t v20 = 2;
    }
    else if ([v19 isEqualToString:@"MAPS_RESULT_TYPE_PUBLISHER"])
    {
      uint64_t v20 = 3;
    }
    else if ([v19 isEqualToString:@"MAPS_RESULT_TYPE_PLACE_QUESTIONNAIRE"])
    {
      uint64_t v20 = 4;
    }
    else if ([v19 isEqualToString:@"MAPS_RESULT_TYPE_BATCH_REVERSE_GEOCODE"])
    {
      uint64_t v20 = 5;
    }
    else
    {
      uint64_t v20 = 0;
    }

    goto LABEL_45;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v20 = [v18 intValue];
LABEL_45:
    [a1 setMapsResultType:v20];
  }

  if (a3) {
    v21 = @"isExternalVisibleId";
  }
  else {
    v21 = @"is_external_visible_id";
  }
  v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsExternalVisibleId:", objc_msgSend(v22, "BOOLValue"));
  }

LABEL_52:
  return a1;
}

- (GEOPDShardedId)initWithJSON:(id)a3
{
  return (GEOPDShardedId *)-[GEOPDShardedId _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDShardedIdIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDShardedIdReadAllFrom((uint64_t)self, a3);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOLatLng *)self->_center hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  unint64_t v6 = a3;
  [(GEOPDShardedId *)self readAll:0];
  int v4 = v6;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    v6[4] = self->_muid;
    *((unsigned char *)v6 + 56) |= 2u;
  }
  if (self->_center)
  {
    objc_msgSend(v6, "setCenter:");
    int v4 = v6;
  }
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    v4[11] = self->_resultProviderId;
    *((unsigned char *)v4 + 56) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_7:
      if ((flags & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_7;
  }
  *((void *)v4 + 2) = self->_basemapId;
  *((unsigned char *)v4 + 56) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_8:
    if ((flags & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[12] = self->_sourceId;
  *((unsigned char *)v4 + 56) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_9:
    if ((flags & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_17:
  v4[10] = self->_mapsResultType;
  *((unsigned char *)v4 + 56) |= 4u;
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
LABEL_10:
    *((unsigned char *)v4 + 52) = self->_isExternalVisibleId;
    *((unsigned char *)v4 + 56) |= 0x20u;
  }
LABEL_11:
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  [(GEOPDShardedId *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 56);
  if ((flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_muid != *((void *)v4 + 4)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_32;
  }
  center = self->_center;
  if ((unint64_t)center | *((void *)v4 + 3))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:")) {
      goto LABEL_32;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 56);
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_resultProviderId != *((_DWORD *)v4 + 11)) {
      goto LABEL_32;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_32;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_basemapId != *((void *)v4 + 2)) {
      goto LABEL_32;
    }
  }
  else if (v6)
  {
    goto LABEL_32;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_sourceId != *((_DWORD *)v4 + 12)) {
      goto LABEL_32;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_32;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_mapsResultType != *((_DWORD *)v4 + 10)) {
      goto LABEL_32;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_32;
  }
  BOOL v8 = (v6 & 0x20) == 0;
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) != 0)
    {
      if (self->_isExternalVisibleId)
      {
        if (!*((unsigned char *)v4 + 52)) {
          goto LABEL_32;
        }
      }
      else if (*((unsigned char *)v4 + 52))
      {
        goto LABEL_32;
      }
      BOOL v8 = 1;
      goto LABEL_33;
    }
LABEL_32:
    BOOL v8 = 0;
  }
LABEL_33:

  return v8;
}

- (void)mergeFrom:(id)a3
{
  BOOL v8 = (unint64_t *)a3;
  [v8 readAll:0];
  id v4 = v8;
  if ((v8[7] & 2) != 0)
  {
    self->_muid = v8[4];
    *(unsigned char *)&self->_flags |= 2u;
  }
  center = self->_center;
  unint64_t v6 = v8[3];
  if (center)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOLatLng mergeFrom:](center, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPDShardedId setCenter:](self, "setCenter:");
  }
  id v4 = v8;
LABEL_9:
  char v7 = *((unsigned char *)v4 + 56);
  if ((v7 & 8) != 0)
  {
    self->_resultProviderId = *((_DWORD *)v4 + 11);
    *(unsigned char *)&self->_flags |= 8u;
    char v7 = *((unsigned char *)v4 + 56);
    if ((v7 & 1) == 0)
    {
LABEL_11:
      if ((v7 & 0x10) == 0) {
        goto LABEL_12;
      }
      goto LABEL_20;
    }
  }
  else if ((v4[7] & 1) == 0)
  {
    goto LABEL_11;
  }
  self->_basemapId = v4[2];
  *(unsigned char *)&self->_flags |= 1u;
  char v7 = *((unsigned char *)v4 + 56);
  if ((v7 & 0x10) == 0)
  {
LABEL_12:
    if ((v7 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_sourceId = *((_DWORD *)v4 + 12);
  *(unsigned char *)&self->_flags |= 0x10u;
  char v7 = *((unsigned char *)v4 + 56);
  if ((v7 & 4) == 0)
  {
LABEL_13:
    if ((v7 & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_21:
  self->_mapsResultType = *((_DWORD *)v4 + 10);
  *(unsigned char *)&self->_flags |= 4u;
  if ((v4[7] & 0x20) != 0)
  {
LABEL_14:
    self->_isExternalVisibleId = *((unsigned char *)v4 + 52);
    *(unsigned char *)&self->_flags |= 0x20u;
  }
LABEL_15:
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
    [(GEOPDShardedId *)self readAll:0];
    center = self->_center;
    [(GEOLatLng *)center clearUnknownFields:1];
  }
}

@end