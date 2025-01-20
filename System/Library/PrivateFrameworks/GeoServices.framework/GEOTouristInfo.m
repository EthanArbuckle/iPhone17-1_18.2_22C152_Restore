@interface GEOTouristInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasFetchTimestamp;
- (BOOL)hasIsTourist;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTourist;
- (BOOL)readFrom:(id)a3;
- (GEOTouristInfo)initWithDictionary:(id)a3;
- (GEOTouristInfo)initWithJSON:(id)a3;
- (double)fetchTimestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFetchTimestamp:(double)a3;
- (void)setHasFetchTimestamp:(BOOL)a3;
- (void)setHasIsTourist:(BOOL)a3;
- (void)setIsTourist:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTouristInfo

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTouristInfo;
  v4 = [(GEOTouristInfo *)&v8 description];
  v5 = [(GEOTouristInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 20);
    if ((v5 & 2) != 0)
    {
      v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 16)];
      if (a2) {
        v7 = @"isTourist";
      }
      else {
        v7 = @"is_tourist";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 20);
    }
    if (v5)
    {
      objc_super v8 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
      if (a2) {
        v9 = @"fetchTimestamp";
      }
      else {
        v9 = @"fetch_timestamp";
      }
      [v4 setObject:v8 forKey:v9];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isTourist
{
  return self->_isTourist;
}

- (void)setIsTourist:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_isTourist = a3;
}

- (void)setHasIsTourist:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsTourist
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (double)fetchTimestamp
{
  return self->_fetchTimestamp;
}

- (void)setFetchTimestamp:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_fetchTimestamp = a3;
}

- (void)setHasFetchTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasFetchTimestamp
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)dictionaryRepresentation
{
  return -[GEOTouristInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOTouristInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOTouristInfo)initWithDictionary:(id)a3
{
  return (GEOTouristInfo *)-[GEOTouristInfo _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"isTourist";
      }
      else {
        v6 = @"is_tourist";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsTourist:", objc_msgSend(v7, "BOOLValue"));
      }

      if (a3) {
        objc_super v8 = @"fetchTimestamp";
      }
      else {
        objc_super v8 = @"fetch_timestamp";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v9 doubleValue];
        objc_msgSend(a1, "setFetchTimestamp:");
      }
    }
  }

  return a1;
}

- (GEOTouristInfo)initWithJSON:(id)a3
{
  return (GEOTouristInfo *)-[GEOTouristInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTouristInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTouristInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOTouristInfo *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[16] = self->_isTourist;
    v5[20] |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((void *)v5 + 1) = *(void *)&self->_fetchTimestamp;
    v5[20] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((unsigned char *)result + 16) = self->_isTourist;
    *((unsigned char *)result + 20) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((void *)result + 1) = *(void *)&self->_fetchTimestamp;
    *((unsigned char *)result + 20) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEOTouristInfo *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) != 0)
    {
      if (self->_isTourist)
      {
        if (!*((unsigned char *)v4 + 16)) {
          goto LABEL_14;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_10;
      }
    }
LABEL_14:
    BOOL v5 = 0;
    goto LABEL_15;
  }
  if ((*((unsigned char *)v4 + 20) & 2) != 0) {
    goto LABEL_14;
  }
LABEL_10:
  BOOL v5 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_fetchTimestamp != *((double *)v4 + 1)) {
      goto LABEL_14;
    }
    BOOL v5 = 1;
  }
LABEL_15:

  return v5;
}

- (unint64_t)hash
{
  [(GEOTouristInfo *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_isTourist;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    return v8 ^ v3;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double fetchTimestamp = self->_fetchTimestamp;
  double v5 = -fetchTimestamp;
  if (fetchTimestamp >= 0.0) {
    double v5 = self->_fetchTimestamp;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
  return v8 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 20);
  if ((v4 & 2) != 0)
  {
    self->_isTourist = *((unsigned char *)v5 + 16);
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 20);
  }
  if (v4)
  {
    self->_double fetchTimestamp = *((double *)v5 + 1);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end