@interface GEOLogMsgEventPOIPredictionData
+ (BOOL)isValid:(id)a3;
- (BOOL)hasConfidence;
- (BOOL)hasMuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventPOIPredictionData)initWithDictionary:(id)a3;
- (GEOLogMsgEventPOIPredictionData)initWithJSON:(id)a3;
- (double)confidence;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)muid;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setMuid:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventPOIPredictionData

- (unint64_t)muid
{
  return self->_muid;
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
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasMuid
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasConfidence
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventPOIPredictionData;
  v4 = [(GEOLogMsgEventPOIPredictionData *)&v8 description];
  v5 = [(GEOLogMsgEventPOIPredictionData *)self dictionaryRepresentation];
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
    if ((v3 & 2) != 0)
    {
      v4 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
      [v2 setObject:v4 forKey:@"muid"];

      char v3 = *(unsigned char *)(a1 + 24);
    }
    if (v3)
    {
      v5 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
      [v2 setObject:v5 forKey:@"confidence"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEOLogMsgEventPOIPredictionData)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventPOIPredictionData *)-[GEOLogMsgEventPOIPredictionData _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"muid"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMuid:", objc_msgSend(v4, "unsignedLongLongValue"));
      }

      v5 = [v3 objectForKeyedSubscript:@"confidence"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v5 doubleValue];
        objc_msgSend(a1, "setConfidence:");
      }
    }
  }

  return a1;
}

- (GEOLogMsgEventPOIPredictionData)initWithJSON:(id)a3
{
  return (GEOLogMsgEventPOIPredictionData *)-[GEOLogMsgEventPOIPredictionData _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventPOIPredictionDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventPOIPredictionDataReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
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
  v5 = a3;
  [(GEOLogMsgEventPOIPredictionData *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[2] = self->_muid;
    *((unsigned char *)v5 + 24) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v5[1] = *(void *)&self->_confidence;
    *((unsigned char *)v5 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((void *)result + 2) = self->_muid;
    *((unsigned char *)result + 24) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((void *)result + 1) = *(void *)&self->_confidence;
    *((unsigned char *)result + 24) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOLogMsgEventPOIPredictionData *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_muid != *((void *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_confidence != *((double *)v4 + 1)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventPOIPredictionData *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    unint64_t v3 = 2654435761u * self->_muid;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    return v8 ^ v3;
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double confidence = self->_confidence;
  double v5 = -confidence;
  if (confidence >= 0.0) {
    double v5 = self->_confidence;
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
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 2) != 0)
  {
    self->_muid = *((void *)v5 + 2);
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 24);
  }
  if (v4)
  {
    self->_double confidence = *((double *)v5 + 1);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end