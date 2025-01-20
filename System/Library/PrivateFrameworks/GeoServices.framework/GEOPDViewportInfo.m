@interface GEOPDViewportInfo
+ (BOOL)isValid:(id)a3;
+ (id)viewportInfoForTraits:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasMapRegion;
- (BOOL)hasMapType;
- (BOOL)hasTimeSinceMapViewportChanged;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapRegion)mapRegion;
- (GEOPDViewportInfo)initWithDictionary:(id)a3;
- (GEOPDViewportInfo)initWithJSON:(id)a3;
- (GEOPDViewportInfo)initWithTraits:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)mapTypeAsString:(int)a3;
- (int)StringAsMapType:(id)a3;
- (int)mapType;
- (unint64_t)hash;
- (unsigned)timeSinceMapViewportChanged;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMapType:(BOOL)a3;
- (void)setHasTimeSinceMapViewportChanged:(BOOL)a3;
- (void)setMapRegion:(id)a3;
- (void)setMapType:(int)a3;
- (void)setTimeSinceMapViewportChanged:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDViewportInfo

- (BOOL)hasMapRegion
{
  return self->_mapRegion != 0;
}

- (GEOMapRegion)mapRegion
{
  return self->_mapRegion;
}

- (void)setMapRegion:(id)a3
{
}

- (unsigned)timeSinceMapViewportChanged
{
  return self->_timeSinceMapViewportChanged;
}

- (void)setTimeSinceMapViewportChanged:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_timeSinceMapViewportChanged = a3;
}

- (void)setHasTimeSinceMapViewportChanged:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTimeSinceMapViewportChanged
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int)mapType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_mapType;
  }
  else {
    return 0;
  }
}

- (void)setMapType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_mapType = a3;
}

- (void)setHasMapType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasMapType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)mapTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53DD240[a3];
  }

  return v3;
}

- (int)StringAsMapType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MAP_TYPE_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_STANDARD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_SATELLITE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_HYBRID"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_TRANSIT"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDViewportInfo;
  int v4 = [(GEOPDViewportInfo *)&v8 description];
  v5 = [(GEOPDViewportInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDViewportInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 mapRegion];
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 jsonRepresentation];
        objc_super v8 = @"mapRegion";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"map_region";
      }
      [v4 setObject:v7 forKey:v8];
    }
    char v9 = *(unsigned char *)(a1 + 32);
    if ((v9 & 2) != 0)
    {
      v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 28)];
      if (a2) {
        v11 = @"timeSinceMapViewportChanged";
      }
      else {
        v11 = @"time_since_map_viewport_changed";
      }
      [v4 setObject:v10 forKey:v11];

      char v9 = *(unsigned char *)(a1 + 32);
    }
    if (v9)
    {
      uint64_t v12 = *(int *)(a1 + 24);
      if (v12 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = off_1E53DD240[v12];
      }
      if (a2) {
        v14 = @"mapType";
      }
      else {
        v14 = @"map_type";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = *(void **)(a1 + 8);
    if (v15)
    {
      v16 = [v15 dictionaryRepresentation];
      v17 = v16;
      if (a2)
      {
        v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __47__GEOPDViewportInfo__dictionaryRepresentation___block_invoke;
        v22[3] = &unk_1E53D8860;
        id v19 = v18;
        id v23 = v19;
        [v17 enumerateKeysAndObjectsUsingBlock:v22];
        id v20 = v19;

        v17 = v20;
      }
      [v4 setObject:v17 forKey:@"Unknown Fields"];
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
  return -[GEOPDViewportInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOPDViewportInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
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

- (GEOPDViewportInfo)initWithDictionary:(id)a3
{
  return (GEOPDViewportInfo *)-[GEOPDViewportInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"mapRegion";
      }
      else {
        v6 = @"map_region";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOMapRegion alloc];
        if (a3) {
          uint64_t v9 = [(GEOMapRegion *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOMapRegion *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setMapRegion:v9];
      }
      if (a3) {
        v11 = @"timeSinceMapViewportChanged";
      }
      else {
        v11 = @"time_since_map_viewport_changed";
      }
      uint64_t v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTimeSinceMapViewportChanged:", objc_msgSend(v12, "unsignedIntValue"));
      }

      if (a3) {
        v13 = @"mapType";
      }
      else {
        v13 = @"map_type";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v14;
        if ([v15 isEqualToString:@"MAP_TYPE_NONE"])
        {
          uint64_t v16 = 0;
        }
        else if ([v15 isEqualToString:@"MAP_TYPE_STANDARD"])
        {
          uint64_t v16 = 1;
        }
        else if ([v15 isEqualToString:@"MAP_TYPE_SATELLITE"])
        {
          uint64_t v16 = 2;
        }
        else if ([v15 isEqualToString:@"MAP_TYPE_HYBRID"])
        {
          uint64_t v16 = 3;
        }
        else if ([v15 isEqualToString:@"MAP_TYPE_TRANSIT"])
        {
          uint64_t v16 = 4;
        }
        else
        {
          uint64_t v16 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_35:

          goto LABEL_36;
        }
        uint64_t v16 = [v14 intValue];
      }
      [a1 setMapType:v16];
      goto LABEL_35;
    }
  }
LABEL_36:

  return a1;
}

- (GEOPDViewportInfo)initWithJSON:(id)a3
{
  return (GEOPDViewportInfo *)-[GEOPDViewportInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDViewportInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDViewportInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_mapRegion)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOMapRegion *)self->_mapRegion hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOPDViewportInfo *)self readAll:0];
  if (self->_mapRegion) {
    objc_msgSend(v5, "setMapRegion:");
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v5 + 7) = self->_timeSinceMapViewportChanged;
    *((unsigned char *)v5 + 32) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)v5 + 6) = self->_mapType;
    *((unsigned char *)v5 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOMapRegion *)self->_mapRegion copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_timeSinceMapViewportChanged;
    *(unsigned char *)(v5 + 32) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 24) = self->_mapType;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEOPDViewportInfo *)self readAll:1];
  [v4 readAll:1];
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((void *)v4 + 2))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_timeSinceMapViewportChanged != *((_DWORD *)v4 + 7)) {
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_mapType != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  [(GEOPDViewportInfo *)self readAll:1];
  unint64_t v3 = [(GEOMapRegion *)self->_mapRegion hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_timeSinceMapViewportChanged;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_mapType;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v7 = a3;
  [v7 readAll:0];
  mapRegion = self->_mapRegion;
  uint64_t v5 = *((void *)v7 + 2);
  if (mapRegion)
  {
    if (v5) {
      -[GEOMapRegion mergeFrom:](mapRegion, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOPDViewportInfo setMapRegion:](self, "setMapRegion:");
  }
  char v6 = *((unsigned char *)v7 + 32);
  if ((v6 & 2) != 0)
  {
    self->_timeSinceMapViewportChanged = *((_DWORD *)v7 + 7);
    *(unsigned char *)&self->_flags |= 2u;
    char v6 = *((unsigned char *)v7 + 32);
  }
  if (v6)
  {
    self->_mapType = *((_DWORD *)v7 + 6);
    *(unsigned char *)&self->_flags |= 1u;
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
    [(GEOPDViewportInfo *)self readAll:0];
    mapRegion = self->_mapRegion;
    [(GEOMapRegion *)mapRegion clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapRegion, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (GEOPDViewportInfo)initWithTraits:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOPDViewportInfo;
  uint64_t v5 = [(GEOPDViewportInfo *)&v10 init];
  if (v5)
  {
    if ([v4 hasMode])
    {
      uint64_t v6 = [v4 mode];
      if (v6 <= 4) {
        [(GEOPDViewportInfo *)v5 setMapType:v6];
      }
    }
    if ([v4 hasMapRegion])
    {
      id v7 = [v4 mapRegion];
      [(GEOPDViewportInfo *)v5 setMapRegion:v7];
    }
    if ([v4 hasTimeSinceMapViewportChanged]) {
      -[GEOPDViewportInfo setTimeSinceMapViewportChanged:](v5, "setTimeSinceMapViewportChanged:", [v4 timeSinceMapViewportChanged]);
    }
    objc_super v8 = v5;
  }

  return v5;
}

+ (id)viewportInfoForTraits:(id)a3
{
  id v3 = a3;
  if ([v3 hasMapRegion]) {
    id v4 = [[GEOPDViewportInfo alloc] initWithTraits:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

@end