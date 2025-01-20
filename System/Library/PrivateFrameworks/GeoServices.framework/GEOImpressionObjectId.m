@interface GEOImpressionObjectId
+ (BOOL)isValid:(id)a3;
- (BOOL)hasHigh;
- (BOOL)hasLow;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOImpressionObjectId)initWithDictionary:(id)a3;
- (GEOImpressionObjectId)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)high;
- (unint64_t)low;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasHigh:(BOOL)a3;
- (void)setHasLow:(BOOL)a3;
- (void)setHigh:(unint64_t)a3;
- (void)setLow:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOImpressionObjectId

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOImpressionObjectId;
  v4 = [(GEOImpressionObjectId *)&v8 description];
  v5 = [(GEOImpressionObjectId *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    char v3 = *(unsigned char *)(a1 + 24);
    if (v3)
    {
      v4 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 8)];
      [v2 setObject:v4 forKey:@"high"];

      char v3 = *(unsigned char *)(a1 + 24);
    }
    if ((v3 & 2) != 0)
    {
      v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
      [v2 setObject:v5 forKey:@"low"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"high"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHigh:", objc_msgSend(v4, "unsignedLongLongValue"));
      }

      v5 = [v3 objectForKeyedSubscript:@"low"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLow:", objc_msgSend(v5, "unsignedLongLongValue"));
      }
    }
  }

  return a1;
}

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

- (GEOImpressionObjectId)initWithDictionary:(id)a3
{
  return (GEOImpressionObjectId *)-[GEOImpressionObjectId _initWithDictionary:isJSON:](self, a3);
}

- (GEOImpressionObjectId)initWithJSON:(id)a3
{
  return (GEOImpressionObjectId *)-[GEOImpressionObjectId _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOImpressionObjectIdIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOImpressionObjectIdReadAllFrom((uint64_t)self, a3);
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
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  v5 = a3;
  [(GEOImpressionObjectId *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[1] = self->_high;
    *((unsigned char *)v5 + 24) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v5[2] = self->_low;
    *((unsigned char *)v5 + 24) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if (flags)
  {
    *((void *)result + 1) = self->_high;
    *((unsigned char *)result + 24) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((void *)result + 2) = self->_low;
    *((unsigned char *)result + 24) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOImpressionObjectId *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_high != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_low != *((void *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEOImpressionObjectId *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    unint64_t v3 = 2654435761u * self->_high;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v4 = 0;
    return v4 ^ v3;
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v4 = 2654435761u * self->_low;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v5 = (unint64_t *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 24);
  if (v4)
  {
    self->_high = v5[1];
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 24);
  }
  if ((v4 & 2) != 0)
  {
    self->_low = v5[2];
    *(unsigned char *)&self->_flags |= 2u;
  }
}

@end