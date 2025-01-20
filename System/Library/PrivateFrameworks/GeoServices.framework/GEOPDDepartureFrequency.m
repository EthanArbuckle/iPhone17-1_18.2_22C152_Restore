@interface GEOPDDepartureFrequency
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDisplayDepartureFrequency;
- (BOOL)hasEarliestDepartureTime;
- (BOOL)hasIsEstimated;
- (BOOL)hasLatestDepartureTime;
- (BOOL)hasMaxDepartureFrequency;
- (BOOL)hasMinDepartureFrequency;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEstimated;
- (BOOL)isValidAtDate:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDDepartureFrequency)initWithDictionary:(id)a3;
- (GEOPDDepartureFrequency)initWithJSON:(id)a3;
- (NSDate)firstTimeInFrequency;
- (NSDate)lastTimeInFrequency;
- (NSString)description;
- (PBUnknownFields)unknownFields;
- (double)frequencyForSorting;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int64_t)displayFrequency;
- (int64_t)frequencyType;
- (int64_t)maxFrequency;
- (int64_t)minFrequency;
- (unint64_t)hash;
- (unsigned)displayDepartureFrequency;
- (unsigned)earliestDepartureTime;
- (unsigned)latestDepartureTime;
- (unsigned)maxDepartureFrequency;
- (unsigned)minDepartureFrequency;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDisplayDepartureFrequency:(unsigned int)a3;
- (void)setEarliestDepartureTime:(unsigned int)a3;
- (void)setHasDisplayDepartureFrequency:(BOOL)a3;
- (void)setHasEarliestDepartureTime:(BOOL)a3;
- (void)setHasIsEstimated:(BOOL)a3;
- (void)setHasLatestDepartureTime:(BOOL)a3;
- (void)setHasMaxDepartureFrequency:(BOOL)a3;
- (void)setHasMinDepartureFrequency:(BOOL)a3;
- (void)setIsEstimated:(BOOL)a3;
- (void)setLatestDepartureTime:(unsigned int)a3;
- (void)setMaxDepartureFrequency:(unsigned int)a3;
- (void)setMinDepartureFrequency:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDDepartureFrequency

- (unsigned)minDepartureFrequency
{
  return self->_minDepartureFrequency;
}

- (void)setMinDepartureFrequency:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_minDepartureFrequency = a3;
}

- (void)setHasMinDepartureFrequency:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasMinDepartureFrequency
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (unsigned)maxDepartureFrequency
{
  return self->_maxDepartureFrequency;
}

- (void)setMaxDepartureFrequency:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_maxDepartureFrequency = a3;
}

- (void)setHasMaxDepartureFrequency:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasMaxDepartureFrequency
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (unsigned)earliestDepartureTime
{
  return self->_earliestDepartureTime;
}

- (void)setEarliestDepartureTime:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_earliestDepartureTime = a3;
}

- (void)setHasEarliestDepartureTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasEarliestDepartureTime
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)latestDepartureTime
{
  return self->_latestDepartureTime;
}

- (void)setLatestDepartureTime:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_latestDepartureTime = a3;
}

- (void)setHasLatestDepartureTime:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasLatestDepartureTime
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)isEstimated
{
  return self->_isEstimated;
}

- (void)setIsEstimated:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_isEstimated = a3;
}

- (void)setHasIsEstimated:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasIsEstimated
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (unsigned)displayDepartureFrequency
{
  return self->_displayDepartureFrequency;
}

- (void)setDisplayDepartureFrequency:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_displayDepartureFrequency = a3;
}

- (void)setHasDisplayDepartureFrequency:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDisplayDepartureFrequency
{
  return *(unsigned char *)&self->_flags & 1;
}

- (NSString)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDDepartureFrequency;
  v4 = [(GEOPDDepartureFrequency *)&v8 description];
  v5 = [(GEOPDDepartureFrequency *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDDepartureFrequency _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_16;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 40);
  if ((v5 & 0x10) != 0)
  {
    v15 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 32)];
    if (a2) {
      v16 = @"minDepartureFrequency";
    }
    else {
      v16 = @"min_departure_frequency";
    }
    [v4 setObject:v15 forKey:v16];

    char v5 = *(unsigned char *)(a1 + 40);
    if ((v5 & 8) == 0)
    {
LABEL_4:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)(a1 + 40) & 8) == 0)
  {
    goto LABEL_4;
  }
  v17 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 28)];
  if (a2) {
    v18 = @"maxDepartureFrequency";
  }
  else {
    v18 = @"max_departure_frequency";
  }
  [v4 setObject:v17 forKey:v18];

  char v5 = *(unsigned char *)(a1 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_31;
  }
LABEL_27:
  v19 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 20)];
  if (a2) {
    v20 = @"earliestDepartureTime";
  }
  else {
    v20 = @"earliest_departure_time";
  }
  [v4 setObject:v19 forKey:v20];

  char v5 = *(unsigned char *)(a1 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_31:
  v21 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
  if (a2) {
    v22 = @"latestDepartureTime";
  }
  else {
    v22 = @"latest_departure_time";
  }
  [v4 setObject:v21 forKey:v22];

  char v5 = *(unsigned char *)(a1 + 40);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_8;
  }
LABEL_35:
  v23 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 36)];
  if (a2) {
    v24 = @"isEstimated";
  }
  else {
    v24 = @"is_estimated";
  }
  [v4 setObject:v23 forKey:v24];

  if (*(unsigned char *)(a1 + 40))
  {
LABEL_8:
    v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
    if (a2) {
      v7 = @"displayDepartureFrequency";
    }
    else {
      v7 = @"display_departure_frequency";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_12:
  objc_super v8 = *(void **)(a1 + 8);
  if (v8)
  {
    v9 = [v8 dictionaryRepresentation];
    v10 = v9;
    if (a2)
    {
      v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __53__GEOPDDepartureFrequency__dictionaryRepresentation___block_invoke;
      v25[3] = &unk_1E53D8860;
      id v12 = v11;
      id v26 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:v25];
      id v13 = v12;

      v10 = v13;
    }
    [v4 setObject:v10 forKey:@"Unknown Fields"];
  }
LABEL_16:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDDepartureFrequency _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEOPDDepartureFrequency__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDDepartureFrequency)initWithDictionary:(id)a3
{
  return (GEOPDDepartureFrequency *)-[GEOPDDepartureFrequency _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"minDepartureFrequency";
      }
      else {
        v6 = @"min_departure_frequency";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMinDepartureFrequency:", objc_msgSend(v7, "unsignedIntValue"));
      }

      if (a3) {
        objc_super v8 = @"maxDepartureFrequency";
      }
      else {
        objc_super v8 = @"max_departure_frequency";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMaxDepartureFrequency:", objc_msgSend(v9, "unsignedIntValue"));
      }

      if (a3) {
        id v10 = @"earliestDepartureTime";
      }
      else {
        id v10 = @"earliest_departure_time";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setEarliestDepartureTime:", objc_msgSend(v11, "unsignedIntValue"));
      }

      if (a3) {
        id v12 = @"latestDepartureTime";
      }
      else {
        id v12 = @"latest_departure_time";
      }
      id v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLatestDepartureTime:", objc_msgSend(v13, "unsignedIntValue"));
      }

      if (a3) {
        v14 = @"isEstimated";
      }
      else {
        v14 = @"is_estimated";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsEstimated:", objc_msgSend(v15, "BOOLValue"));
      }

      if (a3) {
        v16 = @"displayDepartureFrequency";
      }
      else {
        v16 = @"display_departure_frequency";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDisplayDepartureFrequency:", objc_msgSend(v17, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOPDDepartureFrequency)initWithJSON:(id)a3
{
  return (GEOPDDepartureFrequency *)-[GEOPDDepartureFrequency _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDDepartureFrequencyIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDDepartureFrequencyReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  if (*(unsigned char *)&self->_flags) {
LABEL_7:
  }
    PBDataWriterWriteUint32Field();
LABEL_8:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOPDDepartureFrequency *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    v5[8] = self->_minDepartureFrequency;
    *((unsigned char *)v5 + 40) |= 0x10u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v5[7] = self->_maxDepartureFrequency;
  *((unsigned char *)v5 + 40) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v5[5] = self->_earliestDepartureTime;
  *((unsigned char *)v5 + 40) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v5[6] = self->_latestDepartureTime;
  *((unsigned char *)v5 + 40) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  *((unsigned char *)v5 + 36) = self->_isEstimated;
  *((unsigned char *)v5 + 40) |= 0x20u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_7:
    v5[4] = self->_displayDepartureFrequency;
    *((unsigned char *)v5 + 40) |= 1u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *(_DWORD *)(v4 + 32) = self->_minDepartureFrequency;
    *(unsigned char *)(v4 + 40) |= 0x10u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 28) = self->_maxDepartureFrequency;
  *(unsigned char *)(v4 + 40) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *(_DWORD *)(v4 + 20) = self->_earliestDepartureTime;
  *(unsigned char *)(v4 + 40) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    *(unsigned char *)(v4 + 36) = self->_isEstimated;
    *(unsigned char *)(v4 + 40) |= 0x20u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_12:
  *(_DWORD *)(v4 + 24) = self->_latestDepartureTime;
  *(unsigned char *)(v4 + 40) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) != 0) {
    goto LABEL_13;
  }
LABEL_6:
  if (flags)
  {
LABEL_7:
    *(_DWORD *)(v4 + 16) = self->_displayDepartureFrequency;
    *(unsigned char *)(v4 + 40) |= 1u;
  }
LABEL_8:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  [(GEOPDDepartureFrequency *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x10) == 0 || self->_minDepartureFrequency != *((_DWORD *)v4 + 8)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 0x10) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_maxDepartureFrequency != *((_DWORD *)v4 + 7)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_earliestDepartureTime != *((_DWORD *)v4 + 5)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_latestDepartureTime != *((_DWORD *)v4 + 6)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x20) != 0)
    {
      if (self->_isEstimated)
      {
        if (!*((unsigned char *)v4 + 36)) {
          goto LABEL_34;
        }
        goto LABEL_30;
      }
      if (!*((unsigned char *)v4 + 36)) {
        goto LABEL_30;
      }
    }
LABEL_34:
    BOOL v5 = 0;
    goto LABEL_35;
  }
  if ((*((unsigned char *)v4 + 40) & 0x20) != 0) {
    goto LABEL_34;
  }
LABEL_30:
  BOOL v5 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_displayDepartureFrequency != *((_DWORD *)v4 + 4)) {
      goto LABEL_34;
    }
    BOOL v5 = 1;
  }
LABEL_35:

  return v5;
}

- (unint64_t)hash
{
  [(GEOPDDepartureFrequency *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    uint64_t v3 = 2654435761 * self->_minDepartureFrequency;
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_maxDepartureFrequency;
      if ((*(unsigned char *)&self->_flags & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
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
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_earliestDepartureTime;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_latestDepartureTime;
    if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v7 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_11:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 0x20) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_isEstimated;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v8 = 2654435761 * self->_displayDepartureFrequency;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 40);
  if ((v4 & 0x10) != 0)
  {
    self->_minDepartureFrequency = *((_DWORD *)v5 + 8);
    *(unsigned char *)&self->_flags |= 0x10u;
    char v4 = *((unsigned char *)v5 + 40);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v5 + 40) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_maxDepartureFrequency = *((_DWORD *)v5 + 7);
  *(unsigned char *)&self->_flags |= 8u;
  char v4 = *((unsigned char *)v5 + 40);
  if ((v4 & 2) == 0)
  {
LABEL_4:
    if ((v4 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_earliestDepartureTime = *((_DWORD *)v5 + 5);
  *(unsigned char *)&self->_flags |= 2u;
  char v4 = *((unsigned char *)v5 + 40);
  if ((v4 & 4) == 0)
  {
LABEL_5:
    if ((v4 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_latestDepartureTime = *((_DWORD *)v5 + 6);
  *(unsigned char *)&self->_flags |= 4u;
  char v4 = *((unsigned char *)v5 + 40);
  if ((v4 & 0x20) == 0)
  {
LABEL_6:
    if ((v4 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_isEstimated = *((unsigned char *)v5 + 36);
  *(unsigned char *)&self->_flags |= 0x20u;
  if (*((unsigned char *)v5 + 40))
  {
LABEL_7:
    self->_displayDepartureFrequency = *((_DWORD *)v5 + 4);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_8:
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
    [(GEOPDDepartureFrequency *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

- (NSDate)firstTimeInFrequency
{
  if ([(GEOPDDepartureFrequency *)self hasEarliestDepartureTime]) {
    objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)-[GEOPDDepartureFrequency earliestDepartureTime](self, "earliestDepartureTime"));
  }
  else {
  BOOL v3 = [MEMORY[0x1E4F1C9C8] distantPast];
  }

  return (NSDate *)v3;
}

- (NSDate)lastTimeInFrequency
{
  if ([(GEOPDDepartureFrequency *)self hasLatestDepartureTime]) {
    objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)-[GEOPDDepartureFrequency latestDepartureTime](self, "latestDepartureTime"));
  }
  else {
  BOOL v3 = [MEMORY[0x1E4F1C9C8] distantFuture];
  }

  return (NSDate *)v3;
}

- (int64_t)displayFrequency
{
  if ([(GEOPDDepartureFrequency *)self hasDisplayDepartureFrequency])
  {
    if ((uint64_t)llroundf((float)[(GEOPDDepartureFrequency *)self displayDepartureFrequency]/ 60.0) < 1)return 1; {
    else
    }
      return llroundf((float)[(GEOPDDepartureFrequency *)self displayDepartureFrequency] / 60.0);
  }
  else
  {
    return [(GEOPDDepartureFrequency *)self minFrequency];
  }
}

- (int64_t)minFrequency
{
  return llroundf((float)[(GEOPDDepartureFrequency *)self minDepartureFrequency] / 60.0);
}

- (int64_t)maxFrequency
{
  return llroundf((float)[(GEOPDDepartureFrequency *)self maxDepartureFrequency] / 60.0);
}

- (int64_t)frequencyType
{
  if ([(GEOPDDepartureFrequency *)self hasDisplayDepartureFrequency]) {
    return 2;
  }
  if (![(GEOPDDepartureFrequency *)self hasMinDepartureFrequency]
    || ![(GEOPDDepartureFrequency *)self hasMaxDepartureFrequency])
  {
    return 0;
  }
  int64_t v4 = [(GEOPDDepartureFrequency *)self minFrequency];
  if (v4 == [(GEOPDDepartureFrequency *)self maxFrequency]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)isValidAtDate:(id)a3
{
  id v4 = a3;
  if ([(GEOPDDepartureFrequency *)self frequencyType])
  {
    id v5 = [(GEOPDDepartureFrequency *)self firstTimeInFrequency];
    [v4 timeIntervalSinceDate:v5];
    if (v6 >= 0.0)
    {
      uint64_t v8 = [(GEOPDDepartureFrequency *)self lastTimeInFrequency];
      [v4 timeIntervalSinceDate:v8];
      BOOL v7 = v9 <= 0.0;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (double)frequencyForSorting
{
  int64_t v3 = [(GEOPDDepartureFrequency *)self frequencyType];
  if (v3 == 2) {
    return (double)[(GEOPDDepartureFrequency *)self displayFrequency];
  }
  double result = 0.0;
  if (v3 == 1)
  {
    int64_t v5 = [(GEOPDDepartureFrequency *)self minFrequency];
    return (double)([(GEOPDDepartureFrequency *)self maxFrequency] + v5) * 0.5;
  }
  return result;
}

@end