@interface GEOStopStepEVInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasChargingTime;
- (BOOL)hasGainedBatteryCharge;
- (BOOL)hasGainedBatteryPercentage;
- (BOOL)hasGainedTravelRange;
- (BOOL)hasMuid;
- (BOOL)hasRemainingBatteryPercentage;
- (BOOL)hasZilchPathIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOStopStepEVInfo)initWithDictionary:(id)a3;
- (GEOStopStepEVInfo)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (double)gainedBatteryPercentage;
- (double)remainingBatteryPercentage;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)muid;
- (unsigned)chargingTime;
- (unsigned)gainedBatteryCharge;
- (unsigned)gainedTravelRange;
- (unsigned)zilchPathIndex;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChargingTime:(unsigned int)a3;
- (void)setGainedBatteryCharge:(unsigned int)a3;
- (void)setGainedBatteryPercentage:(double)a3;
- (void)setGainedTravelRange:(unsigned int)a3;
- (void)setHasChargingTime:(BOOL)a3;
- (void)setHasGainedBatteryCharge:(BOOL)a3;
- (void)setHasGainedBatteryPercentage:(BOOL)a3;
- (void)setHasGainedTravelRange:(BOOL)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setHasRemainingBatteryPercentage:(BOOL)a3;
- (void)setHasZilchPathIndex:(BOOL)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setRemainingBatteryPercentage:(double)a3;
- (void)setZilchPathIndex:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOStopStepEVInfo

- (unsigned)chargingTime
{
  return self->_chargingTime;
}

- (void)setChargingTime:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_chargingTime = a3;
}

- (void)setHasChargingTime:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasChargingTime
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (double)gainedBatteryPercentage
{
  return self->_gainedBatteryPercentage;
}

- (void)setGainedBatteryPercentage:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_gainedBatteryPercentage = a3;
}

- (void)setHasGainedBatteryPercentage:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasGainedBatteryPercentage
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)gainedTravelRange
{
  return self->_gainedTravelRange;
}

- (void)setGainedTravelRange:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_gainedTravelRange = a3;
}

- (void)setHasGainedTravelRange:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasGainedTravelRange
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

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

- (unsigned)gainedBatteryCharge
{
  return self->_gainedBatteryCharge;
}

- (void)setGainedBatteryCharge:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_gainedBatteryCharge = a3;
}

- (void)setHasGainedBatteryCharge:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasGainedBatteryCharge
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (unsigned)zilchPathIndex
{
  return self->_zilchPathIndex;
}

- (void)setZilchPathIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x40u;
  self->_zilchPathIndex = a3;
}

- (void)setHasZilchPathIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xBF | v3;
}

- (BOOL)hasZilchPathIndex
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (double)remainingBatteryPercentage
{
  return self->_remainingBatteryPercentage;
}

- (void)setRemainingBatteryPercentage:(double)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_remainingBatteryPercentage = a3;
}

- (void)setHasRemainingBatteryPercentage:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasRemainingBatteryPercentage
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOStopStepEVInfo;
  v4 = [(GEOStopStepEVInfo *)&v8 description];
  v5 = [(GEOStopStepEVInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOStopStepEVInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_17;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 56);
  if ((v5 & 8) != 0)
  {
    v15 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
    if (a2) {
      v16 = @"chargingTime";
    }
    else {
      v16 = @"charging_time";
    }
    [v4 setObject:v15 forKey:v16];

    char v5 = *(unsigned char *)(a1 + 56);
    if ((v5 & 1) == 0)
    {
LABEL_4:
      if ((v5 & 0x20) == 0) {
        goto LABEL_5;
      }
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)(a1 + 56) & 1) == 0)
  {
    goto LABEL_4;
  }
  v17 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
  if (a2) {
    v18 = @"gainedBatteryPercentage";
  }
  else {
    v18 = @"gained_battery_percentage";
  }
  [v4 setObject:v17 forKey:v18];

  char v5 = *(unsigned char *)(a1 + 56);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_32;
  }
LABEL_28:
  v19 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  if (a2) {
    v20 = @"gainedTravelRange";
  }
  else {
    v20 = @"gained_travel_range";
  }
  [v4 setObject:v19 forKey:v20];

  char v5 = *(unsigned char *)(a1 + 56);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_33;
  }
LABEL_32:
  v21 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
  [v4 setObject:v21 forKey:@"muid"];

  char v5 = *(unsigned char *)(a1 + 56);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_37;
  }
LABEL_33:
  v22 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 44)];
  if (a2) {
    v23 = @"gainedBatteryCharge";
  }
  else {
    v23 = @"gained_battery_charge";
  }
  [v4 setObject:v22 forKey:v23];

  char v5 = *(unsigned char *)(a1 + 56);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_9;
  }
LABEL_37:
  v24 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 52)];
  if (a2) {
    v25 = @"zilchPathIndex";
  }
  else {
    v25 = @"zilch_path_index";
  }
  [v4 setObject:v24 forKey:v25];

  if ((*(unsigned char *)(a1 + 56) & 4) != 0)
  {
LABEL_9:
    v6 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
    if (a2) {
      v7 = @"remainingBatteryPercentage";
    }
    else {
      v7 = @"remaining_battery_percentage";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_13:
  objc_super v8 = *(void **)(a1 + 8);
  if (v8)
  {
    v9 = [v8 dictionaryRepresentation];
    v10 = v9;
    if (a2)
    {
      v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __47__GEOStopStepEVInfo__dictionaryRepresentation___block_invoke;
      v26[3] = &unk_1E53D8860;
      id v12 = v11;
      id v27 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:v26];
      id v13 = v12;

      v10 = v13;
    }
    [v4 setObject:v10 forKey:@"Unknown Fields"];
  }
LABEL_17:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOStopStepEVInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOStopStepEVInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOStopStepEVInfo)initWithDictionary:(id)a3
{
  return (GEOStopStepEVInfo *)-[GEOStopStepEVInfo _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"chargingTime";
      }
      else {
        v6 = @"charging_time";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setChargingTime:", objc_msgSend(v7, "unsignedIntValue"));
      }

      if (a3) {
        objc_super v8 = @"gainedBatteryPercentage";
      }
      else {
        objc_super v8 = @"gained_battery_percentage";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v9 doubleValue];
        objc_msgSend(a1, "setGainedBatteryPercentage:");
      }

      if (a3) {
        id v10 = @"gainedTravelRange";
      }
      else {
        id v10 = @"gained_travel_range";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setGainedTravelRange:", objc_msgSend(v11, "unsignedIntValue"));
      }

      id v12 = [v5 objectForKeyedSubscript:@"muid"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMuid:", objc_msgSend(v12, "unsignedLongLongValue"));
      }

      if (a3) {
        id v13 = @"gainedBatteryCharge";
      }
      else {
        id v13 = @"gained_battery_charge";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setGainedBatteryCharge:", objc_msgSend(v14, "unsignedIntValue"));
      }

      if (a3) {
        v15 = @"zilchPathIndex";
      }
      else {
        v15 = @"zilch_path_index";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setZilchPathIndex:", objc_msgSend(v16, "unsignedIntValue"));
      }

      if (a3) {
        v17 = @"remainingBatteryPercentage";
      }
      else {
        v17 = @"remaining_battery_percentage";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v18 doubleValue];
        objc_msgSend(a1, "setRemainingBatteryPercentage:");
      }
    }
  }

  return a1;
}

- (GEOStopStepEVInfo)initWithJSON:(id)a3
{
  return (GEOStopStepEVInfo *)-[GEOStopStepEVInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOStopStepEVInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOStopStepEVInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_6:
    if ((flags & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_7:
    if ((flags & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
LABEL_8:
  }
    PBDataWriterWriteDoubleField();
LABEL_9:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOStopStepEVInfo *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    v5[10] = self->_chargingTime;
    *((unsigned char *)v5 + 56) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v5 + 2) = *(void *)&self->_gainedBatteryPercentage;
  *((unsigned char *)v5 + 56) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v5[12] = self->_gainedTravelRange;
  *((unsigned char *)v5 + 56) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)v5 + 3) = self->_muid;
  *((unsigned char *)v5 + 56) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_6:
    if ((flags & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v5[11] = self->_gainedBatteryCharge;
  *((unsigned char *)v5 + 56) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_7:
    if ((flags & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v5[13] = self->_zilchPathIndex;
  *((unsigned char *)v5 + 56) |= 0x40u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_8:
    *((void *)v5 + 4) = *(void *)&self->_remainingBatteryPercentage;
    *((unsigned char *)v5 + 56) |= 4u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v4 + 40) = self->_chargingTime;
    *(unsigned char *)(v4 + 56) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v4 + 16) = self->_gainedBatteryPercentage;
  *(unsigned char *)(v4 + 56) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *(_DWORD *)(v4 + 48) = self->_gainedTravelRange;
  *(unsigned char *)(v4 + 56) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *(void *)(v4 + 24) = self->_muid;
  *(unsigned char *)(v4 + 56) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_6:
    if ((flags & 0x40) == 0) {
      goto LABEL_7;
    }
LABEL_15:
    *(_DWORD *)(v4 + 52) = self->_zilchPathIndex;
    *(unsigned char *)(v4 + 56) |= 0x40u;
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_14:
  *(_DWORD *)(v4 + 44) = self->_gainedBatteryCharge;
  *(unsigned char *)(v4 + 56) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 0x40) != 0) {
    goto LABEL_15;
  }
LABEL_7:
  if ((flags & 4) != 0)
  {
LABEL_8:
    *(double *)(v4 + 32) = self->_remainingBatteryPercentage;
    *(unsigned char *)(v4 + 56) |= 4u;
  }
LABEL_9:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  [(GEOStopStepEVInfo *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 8) == 0 || self->_chargingTime != *((_DWORD *)v4 + 10)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 8) != 0)
  {
LABEL_36:
    BOOL v5 = 0;
    goto LABEL_37;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_gainedBatteryPercentage != *((double *)v4 + 2)) {
      goto LABEL_36;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x20) == 0 || self->_gainedTravelRange != *((_DWORD *)v4 + 12)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x20) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_muid != *((void *)v4 + 3)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x10) == 0 || self->_gainedBatteryCharge != *((_DWORD *)v4 + 11)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x10) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x40) == 0 || self->_zilchPathIndex != *((_DWORD *)v4 + 13)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x40) != 0)
  {
    goto LABEL_36;
  }
  BOOL v5 = (*((unsigned char *)v4 + 56) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_remainingBatteryPercentage != *((double *)v4 + 4)) {
      goto LABEL_36;
    }
    BOOL v5 = 1;
  }
LABEL_37:

  return v5;
}

- (unint64_t)hash
{
  [(GEOStopStepEVInfo *)self readAll:1];
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    uint64_t v4 = 2654435761 * self->_chargingTime;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double gainedBatteryPercentage = self->_gainedBatteryPercentage;
  double v6 = -gainedBatteryPercentage;
  if (gainedBatteryPercentage >= 0.0) {
    double v6 = self->_gainedBatteryPercentage;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((flags & 0x20) != 0)
  {
    uint64_t v10 = 2654435761 * self->_gainedTravelRange;
    if ((flags & 2) != 0)
    {
LABEL_13:
      unint64_t v11 = 2654435761u * self->_muid;
      if ((flags & 0x10) != 0) {
        goto LABEL_14;
      }
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((flags & 2) != 0) {
      goto LABEL_13;
    }
  }
  unint64_t v11 = 0;
  if ((flags & 0x10) != 0)
  {
LABEL_14:
    uint64_t v12 = 2654435761 * self->_gainedBatteryCharge;
    if ((flags & 0x40) != 0) {
      goto LABEL_15;
    }
LABEL_23:
    uint64_t v13 = 0;
    if ((flags & 4) != 0) {
      goto LABEL_16;
    }
LABEL_24:
    unint64_t v18 = 0;
    return v9 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13 ^ v18;
  }
LABEL_22:
  uint64_t v12 = 0;
  if ((flags & 0x40) == 0) {
    goto LABEL_23;
  }
LABEL_15:
  uint64_t v13 = 2654435761 * self->_zilchPathIndex;
  if ((flags & 4) == 0) {
    goto LABEL_24;
  }
LABEL_16:
  double remainingBatteryPercentage = self->_remainingBatteryPercentage;
  double v15 = -remainingBatteryPercentage;
  if (remainingBatteryPercentage >= 0.0) {
    double v15 = self->_remainingBatteryPercentage;
  }
  long double v16 = floor(v15 + 0.5);
  double v17 = (v15 - v16) * 1.84467441e19;
  unint64_t v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0) {
      v18 += (unint64_t)v17;
    }
  }
  else
  {
    v18 -= (unint64_t)fabs(v17);
  }
  return v9 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 56);
  if ((v4 & 8) != 0)
  {
    self->_chargingTime = *((_DWORD *)v5 + 10);
    *(unsigned char *)&self->_flags |= 8u;
    char v4 = *((unsigned char *)v5 + 56);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v5 + 56) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_double gainedBatteryPercentage = *((double *)v5 + 2);
  *(unsigned char *)&self->_flags |= 1u;
  char v4 = *((unsigned char *)v5 + 56);
  if ((v4 & 0x20) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_gainedTravelRange = *((_DWORD *)v5 + 12);
  *(unsigned char *)&self->_flags |= 0x20u;
  char v4 = *((unsigned char *)v5 + 56);
  if ((v4 & 2) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_muid = *((void *)v5 + 3);
  *(unsigned char *)&self->_flags |= 2u;
  char v4 = *((unsigned char *)v5 + 56);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_gainedBatteryCharge = *((_DWORD *)v5 + 11);
  *(unsigned char *)&self->_flags |= 0x10u;
  char v4 = *((unsigned char *)v5 + 56);
  if ((v4 & 0x40) == 0)
  {
LABEL_7:
    if ((v4 & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  self->_zilchPathIndex = *((_DWORD *)v5 + 13);
  *(unsigned char *)&self->_flags |= 0x40u;
  if ((*((unsigned char *)v5 + 56) & 4) != 0)
  {
LABEL_8:
    self->_double remainingBatteryPercentage = *((double *)v5 + 4);
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_9:
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
    [(GEOStopStepEVInfo *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end