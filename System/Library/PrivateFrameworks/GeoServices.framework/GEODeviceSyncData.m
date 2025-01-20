@interface GEODeviceSyncData
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCreateTime;
- (BOOL)hasSessionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEODeviceSyncData)initWithDictionary:(id)a3;
- (GEODeviceSyncData)initWithJSON:(id)a3;
- (GEOSessionID)sessionId;
- (double)createTime;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCreateTime:(double)a3;
- (void)setHasCreateTime:(BOOL)a3;
- (void)setHasSessionId:(BOOL)a3;
- (void)setSessionId:(GEOSessionID)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEODeviceSyncData

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if (flags)
  {
    *(GEOSessionID *)((char *)result + 8) = self->_sessionId;
    *((unsigned char *)result + 32) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((void *)result + 3) = *(void *)&self->_createTime;
    *((unsigned char *)result + 32) |= 2u;
  }
  return result;
}

- (void)setCreateTime:(double)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_createTime = a3;
}

- (GEOSessionID)sessionId
{
  p_sessionId = &self->_sessionId;
  unint64_t high = self->_sessionId._high;
  unint64_t low = p_sessionId->_low;
  result._unint64_t low = low;
  result._unint64_t high = high;
  return result;
}

- (void)setSessionId:(GEOSessionID)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_sessionId = a3;
}

- (void)setHasSessionId:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasSessionId
{
  return *(unsigned char *)&self->_flags & 1;
}

- (double)createTime
{
  return self->_createTime;
}

- (void)setHasCreateTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasCreateTime
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEODeviceSyncData;
  v4 = [(GEODeviceSyncData *)&v8 description];
  v5 = [(GEODeviceSyncData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEODeviceSyncData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 32);
    if (v5)
    {
      v6 = _GEOSessionIDDictionaryRepresentation((void *)(a1 + 8));
      if (a2) {
        v7 = @"sessionId";
      }
      else {
        v7 = @"session_id";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 32);
    }
    if ((v5 & 2) != 0)
    {
      objc_super v8 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
      if (a2) {
        v9 = @"createTime";
      }
      else {
        v9 = @"create_time";
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

- (id)jsonRepresentation
{
  return -[GEODeviceSyncData _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEODeviceSyncData)initWithDictionary:(id)a3
{
  return (GEODeviceSyncData *)-[GEODeviceSyncData _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"sessionId";
      }
      else {
        v6 = @"session_id";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = 0;
        uint64_t v12 = 0;
        _GEOSessionIDFromDictionaryRepresentation(v7, &v11);
        objc_msgSend(a1, "setSessionId:", v11, v12);
      }

      if (a3) {
        objc_super v8 = @"createTime";
      }
      else {
        objc_super v8 = @"create_time";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v9 doubleValue];
        objc_msgSend(a1, "setCreateTime:");
      }
    }
  }

  return a1;
}

- (GEODeviceSyncData)initWithJSON:(id)a3
{
  return (GEODeviceSyncData *)-[GEODeviceSyncData _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEODeviceSyncDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEODeviceSyncDataReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterPlaceMark();
    PBDataWriterWriteUint64Field();
    PBDataWriterWriteUint64Field();
    PBDataWriterRecallMark();
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (char *)a3;
  [(GEODeviceSyncData *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    *(GEOSessionID *)(v5 + 8) = self->_sessionId;
    v5[32] |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((void *)v5 + 3) = *(void *)&self->_createTime;
    v5[32] |= 2u;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  [(GEODeviceSyncData *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0) {
      goto LABEL_15;
    }
    if (self->_sessionId._high != *((void *)v4 + 1) || self->_sessionId._low != *((void *)v4 + 2)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_15:
    BOOL v6 = 0;
    goto LABEL_16;
  }
  BOOL v6 = (*((unsigned char *)v4 + 32) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_createTime != *((double *)v4 + 3)) {
      goto LABEL_15;
    }
    BOOL v6 = 1;
  }
LABEL_16:

  return v6;
}

- (unint64_t)hash
{
  [(GEODeviceSyncData *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = PBHashBytes();
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    return v8 ^ v3;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double createTime = self->_createTime;
  double v5 = -createTime;
  if (createTime >= 0.0) {
    double v5 = self->_createTime;
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
  double v5 = (char *)a3;
  [v5 readAll:0];
  char v4 = v5[32];
  if (v4)
  {
    self->_sessionId = *(GEOSessionID *)(v5 + 8);
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = v5[32];
  }
  if ((v4 & 2) != 0)
  {
    self->_double createTime = *((double *)v5 + 3);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

@end