@interface GEOTimeGap
+ (BOOL)isValid:(id)a3;
- (BOOL)hasIfChained;
- (BOOL)hasSeconds;
- (BOOL)hasSubsequentEventId;
- (BOOL)ifChained;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTimeGap)initWithDictionary:(id)a3;
- (GEOTimeGap)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)seconds;
- (unsigned)subsequentEventId;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIfChained:(BOOL)a3;
- (void)setHasSeconds:(BOOL)a3;
- (void)setHasSubsequentEventId:(BOOL)a3;
- (void)setIfChained:(BOOL)a3;
- (void)setSeconds:(unsigned int)a3;
- (void)setSubsequentEventId:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTimeGap

- (unsigned)subsequentEventId
{
  return self->_subsequentEventId;
}

- (void)setSubsequentEventId:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_subsequentEventId = a3;
}

- (void)setHasSubsequentEventId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSubsequentEventId
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)seconds
{
  return self->_seconds;
}

- (void)setSeconds:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_seconds = a3;
}

- (void)setHasSeconds:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasSeconds
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)ifChained
{
  return self->_ifChained;
}

- (void)setIfChained:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_ifChained = a3;
}

- (void)setHasIfChained:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIfChained
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTimeGap;
  v4 = [(GEOTimeGap *)&v8 description];
  v5 = [(GEOTimeGap *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTimeGap _dictionaryRepresentation:]((uint64_t)self, 0);
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
  if ((v5 & 2) == 0)
  {
    if ((*(unsigned char *)(a1 + 28) & 1) == 0) {
      goto LABEL_4;
    }
LABEL_20:
    v17 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
    [v4 setObject:v17 forKey:@"seconds"];

    if ((*(unsigned char *)(a1 + 28) & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_5;
  }
  v15 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 20)];
  if (a2) {
    v16 = @"subsequentEventId";
  }
  else {
    v16 = @"subsequent_event_id";
  }
  [v4 setObject:v15 forKey:v16];

  char v5 = *(unsigned char *)(a1 + 28);
  if (v5) {
    goto LABEL_20;
  }
LABEL_4:
  if ((v5 & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 24)];
  if (a2) {
    v7 = @"ifChained";
  }
  else {
    v7 = @"if_chained";
  }
  [v4 setObject:v6 forKey:v7];

LABEL_9:
  objc_super v8 = *(void **)(a1 + 8);
  if (v8)
  {
    v9 = [v8 dictionaryRepresentation];
    v10 = v9;
    if (a2)
    {
      v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __40__GEOTimeGap__dictionaryRepresentation___block_invoke;
      v18[3] = &unk_1E53D8860;
      id v12 = v11;
      id v19 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:v18];
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
  return -[GEOTimeGap _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __40__GEOTimeGap__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTimeGap)initWithDictionary:(id)a3
{
  return (GEOTimeGap *)-[GEOTimeGap _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"subsequentEventId";
      }
      else {
        v6 = @"subsequent_event_id";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSubsequentEventId:", objc_msgSend(v7, "unsignedIntValue"));
      }

      objc_super v8 = [v5 objectForKeyedSubscript:@"seconds"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSeconds:", objc_msgSend(v8, "unsignedIntValue"));
      }

      if (a3) {
        v9 = @"ifChained";
      }
      else {
        v9 = @"if_chained";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIfChained:", objc_msgSend(v10, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOTimeGap)initWithJSON:(id)a3
{
  return (GEOTimeGap *)-[GEOTimeGap _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTimeGapIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTimeGapReadAllFrom((uint64_t)self, a3);
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
      if ((flags & 4) == 0) {
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
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteBOOLField();
LABEL_5:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOTimeGap *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[5] = self->_subsequentEventId;
    *((unsigned char *)v5 + 28) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  v5[4] = self->_seconds;
  *((unsigned char *)v5 + 28) |= 1u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_4:
    *((unsigned char *)v5 + 24) = self->_ifChained;
    *((unsigned char *)v5 + 28) |= 4u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v4 + 16) = self->_seconds;
    *(unsigned char *)(v4 + 28) |= 1u;
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v4 + 20) = self->_subsequentEventId;
  *(unsigned char *)(v4 + 28) |= 2u;
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_7;
  }
LABEL_3:
  if ((flags & 4) != 0)
  {
LABEL_4:
    *(unsigned char *)(v4 + 24) = self->_ifChained;
    *(unsigned char *)(v4 + 28) |= 4u;
  }
LABEL_5:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEOTimeGap *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_subsequentEventId != *((_DWORD *)v4 + 5)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_14;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_seconds != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_14;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0)
    {
LABEL_14:
      BOOL v5 = 0;
      goto LABEL_15;
    }
    if (self->_ifChained)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_14;
    }
    BOOL v5 = 1;
  }
LABEL_15:

  return v5;
}

- (unint64_t)hash
{
  [(GEOTimeGap *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v3 = 2654435761 * self->_subsequentEventId;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_seconds;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_ifChained;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 28);
  if ((v4 & 2) != 0)
  {
    self->_subsequentEventId = *((_DWORD *)v5 + 5);
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 28);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v5 + 28) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_seconds = *((_DWORD *)v5 + 4);
  *(unsigned char *)&self->_flags |= 1u;
  if ((*((unsigned char *)v5 + 28) & 4) != 0)
  {
LABEL_4:
    self->_ifChained = *((unsigned char *)v5 + 24);
    *(unsigned char *)&self->_flags |= 4u;
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
    [(GEOTimeGap *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end