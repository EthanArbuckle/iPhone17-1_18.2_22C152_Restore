@interface GEOEVChargeInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasChargingTime;
- (BOOL)hasGainedBatteryCharge;
- (BOOL)hasGainedBatteryPercentage;
- (BOOL)hasGainedTravelRange;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOEVChargeInfo)initWithDictionary:(id)a3;
- (GEOEVChargeInfo)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (double)gainedBatteryPercentage;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)chargingTime;
- (unsigned)gainedBatteryCharge;
- (unsigned)gainedTravelRange;
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
- (void)writeTo:(id)a3;
@end

@implementation GEOEVChargeInfo

- (unsigned)chargingTime
{
  return self->_chargingTime;
}

- (void)setChargingTime:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_chargingTime = a3;
}

- (void)setHasChargingTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasChargingTime
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
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
  *(unsigned char *)&self->_flags |= 8u;
  self->_gainedTravelRange = a3;
}

- (void)setHasGainedTravelRange:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasGainedTravelRange
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (unsigned)gainedBatteryCharge
{
  return self->_gainedBatteryCharge;
}

- (void)setGainedBatteryCharge:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_gainedBatteryCharge = a3;
}

- (void)setHasGainedBatteryCharge:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasGainedBatteryCharge
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOEVChargeInfo;
  v4 = [(GEOEVChargeInfo *)&v8 description];
  v5 = [(GEOEVChargeInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOEVChargeInfo _dictionaryRepresentation:]((uint64_t)self, 0);
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
  char v5 = *(unsigned char *)(a1 + 36);
  if ((v5 & 2) != 0)
  {
    v15 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
    if (a2) {
      v16 = @"chargingTime";
    }
    else {
      v16 = @"charging_time";
    }
    [v4 setObject:v15 forKey:v16];

    char v5 = *(unsigned char *)(a1 + 36);
    if ((v5 & 1) == 0)
    {
LABEL_4:
      if ((v5 & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)(a1 + 36) & 1) == 0)
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

  char v5 = *(unsigned char *)(a1 + 36);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }
LABEL_25:
  v19 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 32)];
  if (a2) {
    v20 = @"gainedTravelRange";
  }
  else {
    v20 = @"gained_travel_range";
  }
  [v4 setObject:v19 forKey:v20];

  if ((*(unsigned char *)(a1 + 36) & 4) != 0)
  {
LABEL_6:
    v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 28)];
    if (a2) {
      v7 = @"gainedBatteryCharge";
    }
    else {
      v7 = @"gained_battery_charge";
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
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __45__GEOEVChargeInfo__dictionaryRepresentation___block_invoke;
      v21[3] = &unk_1E53D8860;
      id v12 = v11;
      id v22 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:v21];
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
  return -[GEOEVChargeInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOEVChargeInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOEVChargeInfo)initWithDictionary:(id)a3
{
  return (GEOEVChargeInfo *)-[GEOEVChargeInfo _initWithDictionary:isJSON:](self, a3, 0);
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

      if (a3) {
        id v12 = @"gainedBatteryCharge";
      }
      else {
        id v12 = @"gained_battery_charge";
      }
      id v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setGainedBatteryCharge:", objc_msgSend(v13, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOEVChargeInfo)initWithJSON:(id)a3
{
  return (GEOEVChargeInfo *)-[GEOEVChargeInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOEVChargeInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOEVChargeInfoReadAllFrom((uint64_t)self, a3);
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
  PBDataWriterWriteDoubleField();
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
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOEVChargeInfo *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[6] = self->_chargingTime;
    *((unsigned char *)v5 + 36) |= 2u;
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
  *((void *)v5 + 2) = *(void *)&self->_gainedBatteryPercentage;
  *((unsigned char *)v5 + 36) |= 1u;
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
  v5[8] = self->_gainedTravelRange;
  *((unsigned char *)v5 + 36) |= 8u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_5:
    v5[7] = self->_gainedBatteryCharge;
    *((unsigned char *)v5 + 36) |= 4u;
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
    *(_DWORD *)(v4 + 24) = self->_chargingTime;
    *(unsigned char *)(v4 + 36) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(_DWORD *)(v4 + 32) = self->_gainedTravelRange;
      *(unsigned char *)(v4 + 36) |= 8u;
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
  *(double *)(v4 + 16) = self->_gainedBatteryPercentage;
  *(unsigned char *)(v4 + 36) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 8) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((flags & 4) != 0)
  {
LABEL_5:
    *(_DWORD *)(v4 + 28) = self->_gainedBatteryCharge;
    *(unsigned char *)(v4 + 36) |= 4u;
  }
LABEL_6:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  [(GEOEVChargeInfo *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_chargingTime != *((_DWORD *)v4 + 6)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_gainedBatteryPercentage != *((double *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0 || self->_gainedTravelRange != *((_DWORD *)v4 + 8)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 36) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_gainedBatteryCharge != *((_DWORD *)v4 + 7)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  [(GEOEVChargeInfo *)self readAll:1];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
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
  if ((flags & 8) != 0)
  {
    uint64_t v10 = 2654435761 * self->_gainedTravelRange;
    if ((flags & 4) != 0) {
      goto LABEL_13;
    }
LABEL_15:
    uint64_t v11 = 0;
    return v9 ^ v4 ^ v10 ^ v11;
  }
  uint64_t v10 = 0;
  if ((flags & 4) == 0) {
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v11 = 2654435761 * self->_gainedBatteryCharge;
  return v9 ^ v4 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 36);
  if ((v4 & 2) != 0)
  {
    self->_chargingTime = *((_DWORD *)v5 + 6);
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 36);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v5 + 36) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_double gainedBatteryPercentage = *((double *)v5 + 2);
  *(unsigned char *)&self->_flags |= 1u;
  char v4 = *((unsigned char *)v5 + 36);
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_gainedTravelRange = *((_DWORD *)v5 + 8);
  *(unsigned char *)&self->_flags |= 8u;
  if ((*((unsigned char *)v5 + 36) & 4) != 0)
  {
LABEL_5:
    self->_gainedBatteryCharge = *((_DWORD *)v5 + 7);
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
    [(GEOEVChargeInfo *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end