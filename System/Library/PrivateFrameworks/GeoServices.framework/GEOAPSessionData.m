@interface GEOAPSessionData
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCreateTime;
- (BOOL)hasCreateTimeInUse;
- (BOOL)hasHasRotated;
- (BOOL)hasMapsUserStartDate;
- (BOOL)hasOpaqueAppId;
- (BOOL)hasOriginHardwareClass;
- (BOOL)hasRotated;
- (BOOL)hasSessionEpoch;
- (BOOL)hasSessionHasRotated;
- (BOOL)hasSessionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)sessionHasRotated;
- (GEOAPSessionData)initWithDictionary:(id)a3;
- (GEOAPSessionData)initWithJSON:(id)a3;
- (GEOSessionID)sessionId;
- (NSString)originHardwareClass;
- (double)createTime;
- (double)createTimeInUse;
- (double)mapsUserStartDate;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)sessionEpoch;
- (unsigned)opaqueAppId;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCreateTime:(double)a3;
- (void)setCreateTimeInUse:(double)a3;
- (void)setHasCreateTime:(BOOL)a3;
- (void)setHasCreateTimeInUse:(BOOL)a3;
- (void)setHasHasRotated:(BOOL)a3;
- (void)setHasMapsUserStartDate:(BOOL)a3;
- (void)setHasOpaqueAppId:(BOOL)a3;
- (void)setHasRotated:(BOOL)a3;
- (void)setHasSessionEpoch:(BOOL)a3;
- (void)setHasSessionHasRotated:(BOOL)a3;
- (void)setHasSessionId:(BOOL)a3;
- (void)setMapsUserStartDate:(double)a3;
- (void)setOpaqueAppId:(unsigned int)a3;
- (void)setOriginHardwareClass:(id)a3;
- (void)setSessionEpoch:(unint64_t)a3;
- (void)setSessionHasRotated:(BOOL)a3;
- (void)setSessionId:(GEOSessionID)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOAPSessionData

- (BOOL)readFrom:(id)a3
{
  return GEOAPSessionDataReadAllFrom((uint64_t)self, a3);
}

- (unint64_t)sessionEpoch
{
  return self->_sessionEpoch;
}

- (double)createTime
{
  return self->_createTime;
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

- (void)setCreateTime:(double)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_createTime = a3;
}

- (BOOL)sessionHasRotated
{
  return self->_sessionHasRotated;
}

- (double)mapsUserStartDate
{
  return self->_mapsUserStartDate;
}

- (void).cxx_destruct
{
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
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_originHardwareClass) {
    PBDataWriterWriteStringField();
  }
  char v6 = (char)self->_flags;
  if ((v6 & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 0x80) == 0) {
      goto LABEL_11;
    }
LABEL_20:
    PBDataWriterWriteBOOLField();
    if ((*(unsigned char *)&self->_flags & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  PBDataWriterWriteDoubleField();
  char v6 = (char)self->_flags;
  if (v6 < 0) {
    goto LABEL_20;
  }
LABEL_11:
  if ((v6 & 0x40) != 0) {
LABEL_12:
  }
    PBDataWriterWriteBOOLField();
LABEL_13:
}

- (void)setHasSessionId:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasSessionId
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)setHasCreateTime:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasCreateTime
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)setSessionEpoch:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_sessionEpoch = a3;
}

- (void)setHasSessionEpoch:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasSessionEpoch
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (void)setMapsUserStartDate:(double)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_mapsUserStartDate = a3;
}

- (void)setHasMapsUserStartDate:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasMapsUserStartDate
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (unsigned)opaqueAppId
{
  return self->_opaqueAppId;
}

- (void)setOpaqueAppId:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_opaqueAppId = a3;
}

- (void)setHasOpaqueAppId:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasOpaqueAppId
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (BOOL)hasOriginHardwareClass
{
  return self->_originHardwareClass != 0;
}

- (NSString)originHardwareClass
{
  return self->_originHardwareClass;
}

- (void)setOriginHardwareClass:(id)a3
{
}

- (double)createTimeInUse
{
  return self->_createTimeInUse;
}

- (void)setCreateTimeInUse:(double)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_createTimeInUse = a3;
}

- (void)setHasCreateTimeInUse:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasCreateTimeInUse
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)setSessionHasRotated:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x80u;
  self->_sessionHasRotated = a3;
}

- (void)setHasSessionHasRotated:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = v3 & 0x80 | *(unsigned char *)&self->_flags & 0x7F;
}

- (BOOL)hasSessionHasRotated
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (BOOL)hasRotated
{
  return self->_hasRotated;
}

- (void)setHasRotated:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x40u;
  self->_hasRotated = a3;
}

- (void)setHasHasRotated:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xBF | v3;
}

- (BOOL)hasHasRotated
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOAPSessionData;
  id v4 = [(GEOAPSessionData *)&v8 description];
  v5 = [(GEOAPSessionData *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAPSessionData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_49;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 72);
  if (v5)
  {
    v11 = _GEOSessionIDDictionaryRepresentation((void *)(a1 + 8));
    if (a2) {
      v12 = @"sessionId";
    }
    else {
      v12 = @"session_id";
    }
    [v4 setObject:v11 forKey:v12];

    char v5 = *(unsigned char *)(a1 + 72);
    if ((v5 & 4) == 0)
    {
LABEL_4:
      if ((v5 & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)(a1 + 72) & 4) == 0)
  {
    goto LABEL_4;
  }
  v13 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  if (a2) {
    v14 = @"createTime";
  }
  else {
    v14 = @"create_time";
  }
  [v4 setObject:v13 forKey:v14];

  char v5 = *(unsigned char *)(a1 + 72);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_32;
  }
LABEL_28:
  v15 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
  if (a2) {
    v16 = @"sessionEpoch";
  }
  else {
    v16 = @"session_epoch";
  }
  [v4 setObject:v15 forKey:v16];

  char v5 = *(unsigned char *)(a1 + 72);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
LABEL_32:
  v17 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  if (a2) {
    v18 = @"mapsUserStartDate";
  }
  else {
    v18 = @"maps_user_start_date";
  }
  [v4 setObject:v17 forKey:v18];

  if ((*(unsigned char *)(a1 + 72) & 0x20) != 0)
  {
LABEL_7:
    char v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 64)];
    if (a2) {
      v7 = @"opaqueAppId";
    }
    else {
      v7 = @"opaque_app_id";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_11:
  objc_super v8 = [(id)a1 originHardwareClass];
  if (v8)
  {
    if (a2) {
      v9 = @"originHardwareClass";
    }
    else {
      v9 = @"origin_hardware_class";
    }
    [v4 setObject:v8 forKey:v9];
  }

  char v10 = *(unsigned char *)(a1 + 72);
  if ((v10 & 2) == 0)
  {
    if ((*(unsigned char *)(a1 + 72) & 0x80) == 0) {
      goto LABEL_18;
    }
LABEL_41:
    v21 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 69)];
    if (a2) {
      v22 = @"sessionHasRotated";
    }
    else {
      v22 = @"session_has_rotated";
    }
    [v4 setObject:v21 forKey:v22];

    if ((*(unsigned char *)(a1 + 72) & 0x40) == 0) {
      goto LABEL_49;
    }
    goto LABEL_45;
  }
  v19 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
  if (a2) {
    v20 = @"createTimeInUse";
  }
  else {
    v20 = @"create_time_in_use";
  }
  [v4 setObject:v19 forKey:v20];

  char v10 = *(unsigned char *)(a1 + 72);
  if (v10 < 0) {
    goto LABEL_41;
  }
LABEL_18:
  if ((v10 & 0x40) != 0)
  {
LABEL_45:
    v23 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 68)];
    if (a2) {
      v24 = @"hasRotated";
    }
    else {
      v24 = @"has_rotated";
    }
    [v4 setObject:v23 forKey:v24];
  }
LABEL_49:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAPSessionData _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOAPSessionData)initWithDictionary:(id)a3
{
  return (GEOAPSessionData *)-[GEOAPSessionData _initWithDictionary:isJSON:](self, a3, 0);
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
        char v6 = @"sessionId";
      }
      else {
        char v6 = @"session_id";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v26 = 0;
        uint64_t v27 = 0;
        _GEOSessionIDFromDictionaryRepresentation(v7, &v26);
        objc_msgSend(a1, "setSessionId:", v26, v27);
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

      if (a3) {
        char v10 = @"sessionEpoch";
      }
      else {
        char v10 = @"session_epoch";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSessionEpoch:", objc_msgSend(v11, "unsignedLongLongValue"));
      }

      if (a3) {
        v12 = @"mapsUserStartDate";
      }
      else {
        v12 = @"maps_user_start_date";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v13 doubleValue];
        objc_msgSend(a1, "setMapsUserStartDate:");
      }

      if (a3) {
        v14 = @"opaqueAppId";
      }
      else {
        v14 = @"opaque_app_id";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setOpaqueAppId:", objc_msgSend(v15, "unsignedIntValue"));
      }

      if (a3) {
        v16 = @"originHardwareClass";
      }
      else {
        v16 = @"origin_hardware_class";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = (void *)[v17 copy];
        [a1 setOriginHardwareClass:v18];
      }
      if (a3) {
        v19 = @"createTimeInUse";
      }
      else {
        v19 = @"create_time_in_use";
      }
      v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v20 doubleValue];
        objc_msgSend(a1, "setCreateTimeInUse:");
      }

      if (a3) {
        v21 = @"sessionHasRotated";
      }
      else {
        v21 = @"session_has_rotated";
      }
      v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSessionHasRotated:", objc_msgSend(v22, "BOOLValue"));
      }

      if (a3) {
        v23 = @"hasRotated";
      }
      else {
        v23 = @"has_rotated";
      }
      v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHasRotated:", objc_msgSend(v24, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOAPSessionData)initWithJSON:(id)a3
{
  return (GEOAPSessionData *)-[GEOAPSessionData _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAPSessionDataIsValid((char *)a3);
}

- (void)copyTo:(id)a3
{
  v7 = (char *)a3;
  [(GEOAPSessionData *)self readAll:0];
  id v4 = v7;
  char flags = (char)self->_flags;
  if (flags)
  {
    *(GEOSessionID *)(v7 + 8) = self->_sessionId;
    v7[72] |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v7 + 4) = *(void *)&self->_createTime;
  v7[72] |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)v7 + 7) = self->_sessionEpoch;
  v7[72] |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_19:
  *((void *)v7 + 5) = *(void *)&self->_mapsUserStartDate;
  v7[72] |= 8u;
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
LABEL_6:
    *((_DWORD *)v7 + 16) = self->_opaqueAppId;
    v7[72] |= 0x20u;
  }
LABEL_7:
  if (self->_originHardwareClass)
  {
    objc_msgSend(v7, "setOriginHardwareClass:");
    id v4 = v7;
  }
  char v6 = (char)self->_flags;
  if ((v6 & 2) != 0)
  {
    v4[3] = *(void *)&self->_createTimeInUse;
    *((unsigned char *)v4 + 72) |= 2u;
    char v6 = (char)self->_flags;
    if ((v6 & 0x80) == 0)
    {
LABEL_11:
      if ((v6 & 0x40) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x80) == 0)
  {
    goto LABEL_11;
  }
  *((unsigned char *)v4 + 69) = self->_sessionHasRotated;
  *((unsigned char *)v4 + 72) |= 0x80u;
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
LABEL_12:
    *((unsigned char *)v4 + 68) = self->_hasRotated;
    *((unsigned char *)v4 + 72) |= 0x40u;
  }
LABEL_13:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char flags = (char)self->_flags;
  if (flags)
  {
    *(GEOSessionID *)(v5 + 8) = self->_sessionId;
    *(unsigned char *)(v5 + 72) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 32) = self->_createTime;
  *(unsigned char *)(v5 + 72) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *(void *)(v5 + 56) = self->_sessionEpoch;
  *(unsigned char *)(v5 + 72) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_15:
  *(double *)(v5 + 40) = self->_mapsUserStartDate;
  *(unsigned char *)(v5 + 72) |= 8u;
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 64) = self->_opaqueAppId;
    *(unsigned char *)(v5 + 72) |= 0x20u;
  }
LABEL_7:
  uint64_t v8 = [(NSString *)self->_originHardwareClass copyWithZone:a3];
  v9 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v8;

  char v10 = (char)self->_flags;
  if ((v10 & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 0x80) == 0) {
      goto LABEL_9;
    }
LABEL_18:
    *(unsigned char *)(v6 + 69) = self->_sessionHasRotated;
    *(unsigned char *)(v6 + 72) |= 0x80u;
    if ((*(unsigned char *)&self->_flags & 0x40) == 0) {
      return (id)v6;
    }
    goto LABEL_10;
  }
  *(double *)(v6 + 24) = self->_createTimeInUse;
  *(unsigned char *)(v6 + 72) |= 2u;
  char v10 = (char)self->_flags;
  if (v10 < 0) {
    goto LABEL_18;
  }
LABEL_9:
  if ((v10 & 0x40) != 0)
  {
LABEL_10:
    *(unsigned char *)(v6 + 68) = self->_hasRotated;
    *(unsigned char *)(v6 + 72) |= 0x40u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  [(GEOAPSessionData *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 72);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0) {
      goto LABEL_47;
    }
    if (self->_sessionId._high != *((void *)v4 + 1) || self->_sessionId._low != *((void *)v4 + 2)) {
      goto LABEL_47;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 4) == 0 || self->_createTime != *((double *)v4 + 4)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 4) != 0)
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 0x10) == 0 || self->_sessionEpoch != *((void *)v4 + 7)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 8) == 0 || self->_mapsUserStartDate != *((double *)v4 + 5)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 8) != 0)
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 0x20) == 0 || self->_opaqueAppId != *((_DWORD *)v4 + 16)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 0x20) != 0)
  {
    goto LABEL_47;
  }
  originHardwareClass = self->_originHardwareClass;
  if ((unint64_t)originHardwareClass | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](originHardwareClass, "isEqual:")) {
      goto LABEL_47;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 72);
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_createTimeInUse != *((double *)v4 + 3)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_47;
  }
  if (flags < 0)
  {
    if ((v6 & 0x80) == 0) {
      goto LABEL_47;
    }
    if (self->_sessionHasRotated)
    {
      if (!*((unsigned char *)v4 + 69)) {
        goto LABEL_47;
      }
    }
    else if (*((unsigned char *)v4 + 69))
    {
      goto LABEL_47;
    }
  }
  else if (v6 < 0)
  {
    goto LABEL_47;
  }
  BOOL v9 = (v6 & 0x40) == 0;
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) != 0)
    {
      if (self->_hasRotated)
      {
        if (!*((unsigned char *)v4 + 68)) {
          goto LABEL_47;
        }
LABEL_55:
        BOOL v9 = 1;
        goto LABEL_48;
      }
      if (!*((unsigned char *)v4 + 68)) {
        goto LABEL_55;
      }
    }
LABEL_47:
    BOOL v9 = 0;
  }
LABEL_48:

  return v9;
}

- (unint64_t)hash
{
  [(GEOAPSessionData *)self readAll:1];
  char flags = (char)self->_flags;
  if (flags)
  {
    uint64_t v4 = PBHashBytes();
    char flags = (char)self->_flags;
  }
  else
  {
    uint64_t v4 = 0;
  }
  if ((flags & 4) != 0)
  {
    double createTime = self->_createTime;
    double v7 = -createTime;
    if (createTime >= 0.0) {
      double v7 = self->_createTime;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((flags & 0x10) != 0)
  {
    unint64_t v10 = 2654435761u * self->_sessionEpoch;
    if ((flags & 8) != 0) {
      goto LABEL_14;
    }
LABEL_19:
    unint64_t v15 = 0;
    goto LABEL_22;
  }
  unint64_t v10 = 0;
  if ((flags & 8) == 0) {
    goto LABEL_19;
  }
LABEL_14:
  double mapsUserStartDate = self->_mapsUserStartDate;
  double v12 = -mapsUserStartDate;
  if (mapsUserStartDate >= 0.0) {
    double v12 = self->_mapsUserStartDate;
  }
  long double v13 = floor(v12 + 0.5);
  double v14 = (v12 - v13) * 1.84467441e19;
  unint64_t v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0) {
      v15 += (unint64_t)v14;
    }
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
LABEL_22:
  if ((flags & 0x20) != 0) {
    uint64_t v16 = 2654435761 * self->_opaqueAppId;
  }
  else {
    uint64_t v16 = 0;
  }
  NSUInteger v17 = [(NSString *)self->_originHardwareClass hash];
  char v18 = (char)self->_flags;
  if ((v18 & 2) != 0)
  {
    double createTimeInUse = self->_createTimeInUse;
    double v21 = -createTimeInUse;
    if (createTimeInUse >= 0.0) {
      double v21 = self->_createTimeInUse;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if (v18 < 0)
  {
    uint64_t v24 = 2654435761 * self->_sessionHasRotated;
    if ((v18 & 0x40) == 0) {
      goto LABEL_35;
    }
LABEL_37:
    uint64_t v25 = 2654435761 * self->_hasRotated;
    return v5 ^ v4 ^ v10 ^ v15 ^ v16 ^ v19 ^ v24 ^ v25 ^ v17;
  }
  uint64_t v24 = 0;
  if ((v18 & 0x40) != 0) {
    goto LABEL_37;
  }
LABEL_35:
  uint64_t v25 = 0;
  return v5 ^ v4 ^ v10 ^ v15 ^ v16 ^ v19 ^ v24 ^ v25 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  double v7 = (char *)a3;
  [v7 readAll:0];
  uint64_t v4 = (double *)v7;
  char v5 = v7[72];
  if (v5)
  {
    self->_sessionId = *(GEOSessionID *)(v7 + 8);
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = v7[72];
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((v7[72] & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_double createTime = *((double *)v7 + 4);
  *(unsigned char *)&self->_flags |= 4u;
  char v5 = v7[72];
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_sessionEpoch = *((void *)v7 + 7);
  *(unsigned char *)&self->_flags |= 0x10u;
  char v5 = v7[72];
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_19:
  self->_double mapsUserStartDate = *((double *)v7 + 5);
  *(unsigned char *)&self->_flags |= 8u;
  if ((v7[72] & 0x20) != 0)
  {
LABEL_6:
    self->_opaqueAppId = *((_DWORD *)v7 + 16);
    *(unsigned char *)&self->_flags |= 0x20u;
  }
LABEL_7:
  if (*((void *)v7 + 6))
  {
    -[GEOAPSessionData setOriginHardwareClass:](self, "setOriginHardwareClass:");
    uint64_t v4 = (double *)v7;
  }
  char v6 = *((unsigned char *)v4 + 72);
  if ((v6 & 2) != 0)
  {
    self->_double createTimeInUse = v4[3];
    *(unsigned char *)&self->_flags |= 2u;
    char v6 = *((unsigned char *)v4 + 72);
    if ((v6 & 0x80) == 0)
    {
LABEL_11:
      if ((v6 & 0x40) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if (((_BYTE)v4[9] & 0x80) == 0)
  {
    goto LABEL_11;
  }
  self->_sessionHasRotated = *((unsigned char *)v4 + 69);
  *(unsigned char *)&self->_flags |= 0x80u;
  if (((_BYTE)v4[9] & 0x40) != 0)
  {
LABEL_12:
    self->_hasRotated = *((unsigned char *)v4 + 68);
    *(unsigned char *)&self->_flags |= 0x40u;
  }
LABEL_13:
}

@end