@interface GEOLogMsgEventId
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDeanonymizeId;
- (BOOL)hasHigh;
- (BOOL)hasLow;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventId)initWithDictionary:(id)a3;
- (GEOLogMsgEventId)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)high;
- (unint64_t)low;
- (unsigned)deanonymizeId;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeanonymizeId:(unsigned int)a3;
- (void)setHasDeanonymizeId:(BOOL)a3;
- (void)setHasHigh:(BOOL)a3;
- (void)setHasLow:(BOOL)a3;
- (void)setHigh:(unint64_t)a3;
- (void)setLow:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventId

- (unint64_t)high
{
  return self->_high;
}

- (void)setHigh:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_high = a3;
}

- (void)setHasHigh:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasHigh
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unint64_t)low
{
  return self->_low;
}

- (void)setLow:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_low = a3;
}

- (void)setHasLow:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLow
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)deanonymizeId
{
  return self->_deanonymizeId;
}

- (void)setDeanonymizeId:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_deanonymizeId = a3;
}

- (void)setHasDeanonymizeId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasDeanonymizeId
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventId;
  v4 = [(GEOLogMsgEventId *)&v8 description];
  v5 = [(GEOLogMsgEventId *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventId _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_12;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 28);
  if ((v5 & 1) == 0)
  {
    if ((*(unsigned char *)(a1 + 28) & 2) == 0) {
      goto LABEL_4;
    }
LABEL_7:
    v7 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
    [v4 setObject:v7 forKey:@"low"];

    if ((*(unsigned char *)(a1 + 28) & 4) == 0) {
      goto LABEL_12;
    }
LABEL_8:
    objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
    if (a2) {
      v9 = @"deanonymizeId";
    }
    else {
      v9 = @"deanonymize_id";
    }
    [v4 setObject:v8 forKey:v9];

    goto LABEL_12;
  }
  v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 8)];
  [v4 setObject:v6 forKey:@"high"];

  char v5 = *(unsigned char *)(a1 + 28);
  if ((v5 & 2) != 0) {
    goto LABEL_7;
  }
LABEL_4:
  if ((v5 & 4) != 0) {
    goto LABEL_8;
  }
LABEL_12:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventId _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventId)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventId *)-[GEOLogMsgEventId _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"high"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHigh:", objc_msgSend(v6, "unsignedLongLongValue"));
      }

      v7 = [v5 objectForKeyedSubscript:@"low"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLow:", objc_msgSend(v7, "unsignedLongLongValue"));
      }

      if (a3) {
        objc_super v8 = @"deanonymizeId";
      }
      else {
        objc_super v8 = @"deanonymize_id";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDeanonymizeId:", objc_msgSend(v9, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOLogMsgEventId)initWithJSON:(id)a3
{
  return (GEOLogMsgEventId *)-[GEOLogMsgEventId _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventIdIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventIdReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if (flags)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLogMsgEventId *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[1] = self->_high;
    *((unsigned char *)v5 + 28) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  v5[2] = self->_low;
  *((unsigned char *)v5 + 28) |= 2u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 6) = self->_deanonymizeId;
    *((unsigned char *)v5 + 28) |= 4u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if (flags)
  {
    *((void *)result + 1) = self->_high;
    *((unsigned char *)result + 28) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 2) = self->_low;
  *((unsigned char *)result + 28) |= 2u;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 6) = self->_deanonymizeId;
  *((unsigned char *)result + 28) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOLogMsgEventId *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_high != *((void *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_low != *((void *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_deanonymizeId != *((_DWORD *)v4 + 6)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventId *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  unint64_t v3 = 2654435761u * self->_high;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v4 = 2654435761u * self->_low;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_deanonymizeId;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 28);
  if (v4)
  {
    self->_high = *((void *)v5 + 1);
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 28);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v5 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_low = *((void *)v5 + 2);
  *(unsigned char *)&self->_flags |= 2u;
  if ((*((unsigned char *)v5 + 28) & 4) != 0)
  {
LABEL_4:
    self->_deanonymizeId = *((_DWORD *)v5 + 6);
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_5:
}

@end