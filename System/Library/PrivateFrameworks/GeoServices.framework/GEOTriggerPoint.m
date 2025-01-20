@interface GEOTriggerPoint
+ (BOOL)isValid:(id)a3;
- (BOOL)allowsShifting;
- (BOOL)countBeforeReferenceOffset;
- (BOOL)hasAllowsShifting;
- (BOOL)hasCountBeforeReferenceOffset;
- (BOOL)hasReferenceOffsetCm;
- (BOOL)hasTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTriggerPoint)initWithDictionary:(id)a3;
- (GEOTriggerPoint)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)referenceOffsetCm;
- (unsigned)time;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllowsShifting:(BOOL)a3;
- (void)setCountBeforeReferenceOffset:(BOOL)a3;
- (void)setHasAllowsShifting:(BOOL)a3;
- (void)setHasCountBeforeReferenceOffset:(BOOL)a3;
- (void)setHasReferenceOffsetCm:(BOOL)a3;
- (void)setHasTime:(BOOL)a3;
- (void)setReferenceOffsetCm:(unsigned int)a3;
- (void)setTime:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTriggerPoint

- (unsigned)time
{
  return self->_time;
}

- (void)setTime:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_time = a3;
}

- (void)setHasTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTime
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)referenceOffsetCm
{
  return self->_referenceOffsetCm;
}

- (void)setReferenceOffsetCm:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_referenceOffsetCm = a3;
}

- (void)setHasReferenceOffsetCm:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasReferenceOffsetCm
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)countBeforeReferenceOffset
{
  return self->_countBeforeReferenceOffset;
}

- (void)setCountBeforeReferenceOffset:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_countBeforeReferenceOffset = a3;
}

- (void)setHasCountBeforeReferenceOffset:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasCountBeforeReferenceOffset
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (BOOL)allowsShifting
{
  return (*(unsigned char *)&self->_flags & 4) != 0 && self->_allowsShifting;
}

- (void)setAllowsShifting:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_allowsShifting = a3;
}

- (void)setHasAllowsShifting:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasAllowsShifting
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTriggerPoint;
  v4 = [(GEOTriggerPoint *)&v8 description];
  v5 = [(GEOTriggerPoint *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTriggerPoint _dictionaryRepresentation:]((uint64_t)self, 0);
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
  char v5 = *(unsigned char *)(a1 + 28);
  if ((v5 & 2) != 0)
  {
    v15 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 20)];
    [v4 setObject:v15 forKey:@"time"];

    char v5 = *(unsigned char *)(a1 + 28);
    if ((v5 & 1) == 0)
    {
LABEL_4:
      if ((v5 & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)(a1 + 28) & 1) == 0)
  {
    goto LABEL_4;
  }
  v16 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
  if (a2) {
    v17 = @"referenceOffsetCm";
  }
  else {
    v17 = @"reference_offset_cm";
  }
  [v4 setObject:v16 forKey:v17];

  char v5 = *(unsigned char *)(a1 + 28);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }
LABEL_22:
  v18 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 25)];
  if (a2) {
    v19 = @"countBeforeReferenceOffset";
  }
  else {
    v19 = @"count_before_reference_offset";
  }
  [v4 setObject:v18 forKey:v19];

  if ((*(unsigned char *)(a1 + 28) & 4) != 0)
  {
LABEL_6:
    v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 24)];
    if (a2) {
      v7 = @"allowsShifting";
    }
    else {
      v7 = @"allows_shifting";
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
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __45__GEOTriggerPoint__dictionaryRepresentation___block_invoke;
      v20[3] = &unk_1E53D8860;
      id v12 = v11;
      id v21 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:v20];
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
  return -[GEOTriggerPoint _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOTriggerPoint__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTriggerPoint)initWithDictionary:(id)a3
{
  return (GEOTriggerPoint *)-[GEOTriggerPoint _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"time"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTime:", objc_msgSend(v6, "unsignedIntValue"));
      }

      if (a3) {
        v7 = @"referenceOffsetCm";
      }
      else {
        v7 = @"reference_offset_cm";
      }
      objc_super v8 = [v5 objectForKeyedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setReferenceOffsetCm:", objc_msgSend(v8, "unsignedIntValue"));
      }

      if (a3) {
        v9 = @"countBeforeReferenceOffset";
      }
      else {
        v9 = @"count_before_reference_offset";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setCountBeforeReferenceOffset:", objc_msgSend(v10, "BOOLValue"));
      }

      if (a3) {
        v11 = @"allowsShifting";
      }
      else {
        v11 = @"allows_shifting";
      }
      id v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAllowsShifting:", objc_msgSend(v12, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOTriggerPoint)initWithJSON:(id)a3
{
  return (GEOTriggerPoint *)-[GEOTriggerPoint _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTriggerPointIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTriggerPointReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
LABEL_5:
  }
    PBDataWriterWriteBOOLField();
LABEL_6:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOTriggerPoint *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[5] = self->_time;
    *((unsigned char *)v5 + 28) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  v5[4] = self->_referenceOffsetCm;
  *((unsigned char *)v5 + 28) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  *((unsigned char *)v5 + 25) = self->_countBeforeReferenceOffset;
  *((unsigned char *)v5 + 28) |= 8u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_5:
    *((unsigned char *)v5 + 24) = self->_allowsShifting;
    *((unsigned char *)v5 + 28) |= 4u;
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
    *(_DWORD *)(v4 + 20) = self->_time;
    *(unsigned char *)(v4 + 28) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(unsigned char *)(v4 + 25) = self->_countBeforeReferenceOffset;
      *(unsigned char *)(v4 + 28) |= 8u;
      if ((*(unsigned char *)&self->_flags & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 16) = self->_referenceOffsetCm;
  *(unsigned char *)(v4 + 28) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 8) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((flags & 4) != 0)
  {
LABEL_5:
    *(unsigned char *)(v4 + 24) = self->_allowsShifting;
    *(unsigned char *)(v4 + 28) |= 4u;
  }
LABEL_6:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  [(GEOTriggerPoint *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_time != *((_DWORD *)v4 + 5)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_22;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_referenceOffsetCm != *((_DWORD *)v4 + 4)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 8) == 0) {
      goto LABEL_22;
    }
    if (self->_countBeforeReferenceOffset)
    {
      if (!*((unsigned char *)v4 + 25)) {
        goto LABEL_22;
      }
    }
    else if (*((unsigned char *)v4 + 25))
    {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 8) != 0)
  {
    goto LABEL_22;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) != 0)
    {
      if (self->_allowsShifting)
      {
        if (!*((unsigned char *)v4 + 24)) {
          goto LABEL_22;
        }
      }
      else if (*((unsigned char *)v4 + 24))
      {
        goto LABEL_22;
      }
      BOOL v5 = 1;
      goto LABEL_23;
    }
LABEL_22:
    BOOL v5 = 0;
  }
LABEL_23:

  return v5;
}

- (unint64_t)hash
{
  [(GEOTriggerPoint *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_time;
    if (*(unsigned char *)&self->_flags)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_referenceOffsetCm;
      if ((*(unsigned char *)&self->_flags & 8) != 0) {
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
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_countBeforeReferenceOffset;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_allowsShifting;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 28);
  if ((v4 & 2) != 0)
  {
    self->_time = *((_DWORD *)v5 + 5);
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 28);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v5 + 28) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_referenceOffsetCm = *((_DWORD *)v5 + 4);
  *(unsigned char *)&self->_flags |= 1u;
  char v4 = *((unsigned char *)v5 + 28);
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_countBeforeReferenceOffset = *((unsigned char *)v5 + 25);
  *(unsigned char *)&self->_flags |= 8u;
  if ((*((unsigned char *)v5 + 28) & 4) != 0)
  {
LABEL_5:
    self->_allowsShifting = *((unsigned char *)v5 + 24);
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
    [(GEOTriggerPoint *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end