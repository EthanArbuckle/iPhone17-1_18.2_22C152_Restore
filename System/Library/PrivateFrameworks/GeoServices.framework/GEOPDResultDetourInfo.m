@interface GEOPDResultDetourInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDetourDistance;
- (BOOL)hasDetourTime;
- (BOOL)hasDistanceToPlace;
- (BOOL)hasTimeToPlace;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDResultDetourInfo)initWithDictionary:(id)a3;
- (GEOPDResultDetourInfo)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)detourDistance;
- (int)detourTime;
- (unint64_t)hash;
- (unsigned)distanceToPlace;
- (unsigned)timeToPlace;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDetourDistance:(int)a3;
- (void)setDetourTime:(int)a3;
- (void)setDistanceToPlace:(unsigned int)a3;
- (void)setHasDetourDistance:(BOOL)a3;
- (void)setHasDetourTime:(BOOL)a3;
- (void)setHasDistanceToPlace:(BOOL)a3;
- (void)setHasTimeToPlace:(BOOL)a3;
- (void)setTimeToPlace:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDResultDetourInfo

- (int)detourTime
{
  return self->_detourTime;
}

- (void)setDetourTime:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_detourTime = a3;
}

- (void)setHasDetourTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDetourTime
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)timeToPlace
{
  return self->_timeToPlace;
}

- (void)setTimeToPlace:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_timeToPlace = a3;
}

- (void)setHasTimeToPlace:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasTimeToPlace
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (int)detourDistance
{
  return self->_detourDistance;
}

- (void)setDetourDistance:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_detourDistance = a3;
}

- (void)setHasDetourDistance:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDetourDistance
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)distanceToPlace
{
  return self->_distanceToPlace;
}

- (void)setDistanceToPlace:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_distanceToPlace = a3;
}

- (void)setHasDistanceToPlace:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasDistanceToPlace
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDResultDetourInfo;
  v4 = [(GEOPDResultDetourInfo *)&v8 description];
  v5 = [(GEOPDResultDetourInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultDetourInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_14;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 32);
  if ((v5 & 2) != 0)
  {
    v15 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 20)];
    if (a2) {
      v16 = @"detourTime";
    }
    else {
      v16 = @"detour_time";
    }
    [v4 setObject:v15 forKey:v16];

    char v5 = *(unsigned char *)(a1 + 32);
    if ((v5 & 8) == 0)
    {
LABEL_4:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)(a1 + 32) & 8) == 0)
  {
    goto LABEL_4;
  }
  v17 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 28)];
  if (a2) {
    v18 = @"timeToPlace";
  }
  else {
    v18 = @"time_to_place";
  }
  [v4 setObject:v17 forKey:v18];

  char v5 = *(unsigned char *)(a1 + 32);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }
LABEL_25:
  v19 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 16)];
  if (a2) {
    v20 = @"detourDistance";
  }
  else {
    v20 = @"detour_distance";
  }
  [v4 setObject:v19 forKey:v20];

  if ((*(unsigned char *)(a1 + 32) & 4) != 0)
  {
LABEL_6:
    v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
    if (a2) {
      v7 = @"distanceToPlace";
    }
    else {
      v7 = @"distance_to_place";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_10:
  objc_super v8 = *(void **)(a1 + 8);
  if (v8)
  {
    v9 = [v8 dictionaryRepresentation];
    v10 = v9;
    if (a2)
    {
      v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __51__GEOPDResultDetourInfo__dictionaryRepresentation___block_invoke;
      v21[3] = &unk_1E53D8860;
      id v12 = v11;
      id v22 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:v21];
      id v13 = v12;

      v10 = v13;
    }
    [v4 setObject:v10 forKey:@"Unknown Fields"];
  }
LABEL_14:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDResultDetourInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEOPDResultDetourInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDResultDetourInfo)initWithDictionary:(id)a3
{
  return (GEOPDResultDetourInfo *)-[GEOPDResultDetourInfo _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"detourTime";
      }
      else {
        v6 = @"detour_time";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDetourTime:", objc_msgSend(v7, "intValue"));
      }

      if (a3) {
        objc_super v8 = @"timeToPlace";
      }
      else {
        objc_super v8 = @"time_to_place";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTimeToPlace:", objc_msgSend(v9, "unsignedIntValue"));
      }

      if (a3) {
        id v10 = @"detourDistance";
      }
      else {
        id v10 = @"detour_distance";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDetourDistance:", objc_msgSend(v11, "intValue"));
      }

      if (a3) {
        id v12 = @"distanceToPlace";
      }
      else {
        id v12 = @"distance_to_place";
      }
      id v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDistanceToPlace:", objc_msgSend(v13, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOPDResultDetourInfo)initWithJSON:(id)a3
{
  return (GEOPDResultDetourInfo *)-[GEOPDResultDetourInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDResultDetourInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDResultDetourInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOPDResultDetourInfo *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[5] = self->_detourTime;
    *((unsigned char *)v5 + 32) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v5[7] = self->_timeToPlace;
  *((unsigned char *)v5 + 32) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v5[4] = self->_detourDistance;
  *((unsigned char *)v5 + 32) |= 1u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_5:
    v5[6] = self->_distanceToPlace;
    *((unsigned char *)v5 + 32) |= 4u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 20) = self->_detourTime;
    *(unsigned char *)(v4 + 32) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(_DWORD *)(v4 + 16) = self->_detourDistance;
      *(unsigned char *)(v4 + 32) |= 1u;
      if ((*(unsigned char *)&self->_flags & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 28) = self->_timeToPlace;
  *(unsigned char *)(v4 + 32) |= 8u;
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_9;
  }
LABEL_4:
  if ((flags & 4) != 0)
  {
LABEL_5:
    *(_DWORD *)(v4 + 24) = self->_distanceToPlace;
    *(unsigned char *)(v4 + 32) |= 4u;
  }
LABEL_6:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  [(GEOPDResultDetourInfo *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_detourTime != *((_DWORD *)v4 + 5)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0 || self->_timeToPlace != *((_DWORD *)v4 + 7)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_detourDistance != *((_DWORD *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_distanceToPlace != *((_DWORD *)v4 + 6)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  [(GEOPDResultDetourInfo *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_detourTime;
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_timeToPlace;
      if (*(unsigned char *)&self->_flags) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_flags & 4) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_detourDistance;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_distanceToPlace;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 2) != 0)
  {
    self->_detourTime = *((_DWORD *)v5 + 5);
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 32);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v5 + 32) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_timeToPlace = *((_DWORD *)v5 + 7);
  *(unsigned char *)&self->_flags |= 8u;
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 1) == 0)
  {
LABEL_4:
    if ((v4 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_detourDistance = *((_DWORD *)v5 + 4);
  *(unsigned char *)&self->_flags |= 1u;
  if ((*((unsigned char *)v5 + 32) & 4) != 0)
  {
LABEL_5:
    self->_distanceToPlace = *((_DWORD *)v5 + 6);
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_6:
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
    [(GEOPDResultDetourInfo *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end