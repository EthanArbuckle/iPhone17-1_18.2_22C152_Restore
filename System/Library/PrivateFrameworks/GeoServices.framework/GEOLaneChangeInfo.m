@interface GEOLaneChangeInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasEndOffsetCm;
- (BOOL)hasNumValidLanes;
- (BOOL)hasStartOffsetCm;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLaneChangeInfo)initWithDictionary:(id)a3;
- (GEOLaneChangeInfo)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)endOffsetCm;
- (unsigned)numValidLanes;
- (unsigned)startOffsetCm;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEndOffsetCm:(unsigned int)a3;
- (void)setHasEndOffsetCm:(BOOL)a3;
- (void)setHasNumValidLanes:(BOOL)a3;
- (void)setHasStartOffsetCm:(BOOL)a3;
- (void)setNumValidLanes:(unsigned int)a3;
- (void)setStartOffsetCm:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLaneChangeInfo

- (unsigned)startOffsetCm
{
  return self->_startOffsetCm;
}

- (void)setStartOffsetCm:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_startOffsetCm = a3;
}

- (void)setHasStartOffsetCm:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasStartOffsetCm
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unsigned)endOffsetCm
{
  return self->_endOffsetCm;
}

- (void)setEndOffsetCm:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_endOffsetCm = a3;
}

- (void)setHasEndOffsetCm:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasEndOffsetCm
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)numValidLanes
{
  return self->_numValidLanes;
}

- (void)setNumValidLanes:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_numValidLanes = a3;
}

- (void)setHasNumValidLanes:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasNumValidLanes
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLaneChangeInfo;
  v4 = [(GEOLaneChangeInfo *)&v8 description];
  v5 = [(GEOLaneChangeInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLaneChangeInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_13;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 28);
  if ((v5 & 4) != 0)
  {
    v15 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
    if (a2) {
      v16 = @"startOffsetCm";
    }
    else {
      v16 = @"start_offset_cm";
    }
    [v4 setObject:v15 forKey:v16];

    char v5 = *(unsigned char *)(a1 + 28);
    if ((v5 & 1) == 0)
    {
LABEL_4:
      if ((v5 & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)(a1 + 28) & 1) == 0)
  {
    goto LABEL_4;
  }
  v17 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
  if (a2) {
    v18 = @"endOffsetCm";
  }
  else {
    v18 = @"end_offset_cm";
  }
  [v4 setObject:v17 forKey:v18];

  if ((*(unsigned char *)(a1 + 28) & 2) != 0)
  {
LABEL_5:
    v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 20)];
    if (a2) {
      v7 = @"numValidLanes";
    }
    else {
      v7 = @"num_valid_lanes";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_9:
  objc_super v8 = *(void **)(a1 + 8);
  if (v8)
  {
    v9 = [v8 dictionaryRepresentation];
    v10 = v9;
    if (a2)
    {
      v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __47__GEOLaneChangeInfo__dictionaryRepresentation___block_invoke;
      v19[3] = &unk_1E53D8860;
      id v12 = v11;
      id v20 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:v19];
      id v13 = v12;

      v10 = v13;
    }
    [v4 setObject:v10 forKey:@"Unknown Fields"];
  }
LABEL_13:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLaneChangeInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOLaneChangeInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOLaneChangeInfo)initWithDictionary:(id)a3
{
  return (GEOLaneChangeInfo *)-[GEOLaneChangeInfo _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"startOffsetCm";
      }
      else {
        v6 = @"start_offset_cm";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setStartOffsetCm:", objc_msgSend(v7, "unsignedIntValue"));
      }

      if (a3) {
        objc_super v8 = @"endOffsetCm";
      }
      else {
        objc_super v8 = @"end_offset_cm";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setEndOffsetCm:", objc_msgSend(v9, "unsignedIntValue"));
      }

      if (a3) {
        id v10 = @"numValidLanes";
      }
      else {
        id v10 = @"num_valid_lanes";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setNumValidLanes:", objc_msgSend(v11, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOLaneChangeInfo)initWithJSON:(id)a3
{
  return (GEOLaneChangeInfo *)-[GEOLaneChangeInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLaneChangeInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLaneChangeInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint32Field();
LABEL_5:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLaneChangeInfo *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[6] = self->_startOffsetCm;
    *((unsigned char *)v5 + 28) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  v5[4] = self->_endOffsetCm;
  *((unsigned char *)v5 + 28) |= 1u;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_4:
    v5[5] = self->_numValidLanes;
    *((unsigned char *)v5 + 28) |= 2u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v4 + 16) = self->_endOffsetCm;
    *(unsigned char *)(v4 + 28) |= 1u;
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v4 + 24) = self->_startOffsetCm;
  *(unsigned char *)(v4 + 28) |= 4u;
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_7;
  }
LABEL_3:
  if ((flags & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v4 + 20) = self->_numValidLanes;
    *(unsigned char *)(v4 + 28) |= 2u;
  }
LABEL_5:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOLaneChangeInfo *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_startOffsetCm != *((_DWORD *)v4 + 6)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_endOffsetCm != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_numValidLanes != *((_DWORD *)v4 + 5)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  [(GEOLaneChangeInfo *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v3 = 2654435761 * self->_startOffsetCm;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_endOffsetCm;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_numValidLanes;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (unsigned int *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 28);
  if ((v4 & 4) != 0)
  {
    self->_startOffsetCm = v5[6];
    *(unsigned char *)&self->_flags |= 4u;
    char v4 = *((unsigned char *)v5 + 28);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v5[7] & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_endOffsetCm = v5[4];
  *(unsigned char *)&self->_flags |= 1u;
  if ((v5[7] & 2) != 0)
  {
LABEL_4:
    self->_numValidLanes = v5[5];
    *(unsigned char *)&self->_flags |= 2u;
  }
LABEL_5:
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
    [(GEOLaneChangeInfo *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end