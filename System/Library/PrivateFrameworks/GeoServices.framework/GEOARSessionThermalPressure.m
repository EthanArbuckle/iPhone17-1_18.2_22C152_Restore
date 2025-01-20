@interface GEOARSessionThermalPressure
+ (BOOL)isValid:(id)a3;
- (BOOL)hasChargingState;
- (BOOL)hasCollectionTrigger;
- (BOOL)hasThermalPressure;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOARSessionThermalPressure)initWithDictionary:(id)a3;
- (GEOARSessionThermalPressure)initWithJSON:(id)a3;
- (double)timestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)chargingStateAsString:(int)a3;
- (id)collectionTriggerAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsChargingState:(id)a3;
- (int)StringAsCollectionTrigger:(id)a3;
- (int)chargingState;
- (int)collectionTrigger;
- (unint64_t)hash;
- (unsigned)thermalPressure;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChargingState:(int)a3;
- (void)setCollectionTrigger:(int)a3;
- (void)setHasChargingState:(BOOL)a3;
- (void)setHasCollectionTrigger:(BOOL)a3;
- (void)setHasThermalPressure:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setThermalPressure:(unsigned int)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOARSessionThermalPressure

- (unsigned)thermalPressure
{
  return self->_thermalPressure;
}

- (void)setThermalPressure:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_thermalPressure = a3;
}

- (void)setHasThermalPressure:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasThermalPressure
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_flags & 1;
}

- (int)chargingState
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_chargingState;
  }
  else {
    return 0;
  }
}

- (void)setChargingState:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_chargingState = a3;
}

- (void)setHasChargingState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasChargingState
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)chargingStateAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F7CA0[a3];
  }

  return v3;
}

- (int)StringAsChargingState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CHARGING_STATE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CHARGING_STATE_NOT_CHARGING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CHARGING_STATE_WIRED_CHARGING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CHARGING_STATE_WIRELESS_CHARGING"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)collectionTrigger
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_collectionTrigger;
  }
  else {
    return 1;
  }
}

- (void)setCollectionTrigger:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_collectionTrigger = a3;
}

- (void)setHasCollectionTrigger:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasCollectionTrigger
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)collectionTriggerAsString:(int)a3
{
  if ((a3 - 1) >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F7478[a3 - 1];
  }

  return v3;
}

- (int)StringAsCollectionTrigger:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AR_SESSION_COLLECTION_COLLECTION_TRIGGER_UNKNOWN"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AR_SESSION_COLLECTION_COLLECTION_TRIGGER_START_AR"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AR_SESSION_COLLECTION_COLLECTION_TRIGGER_END_AR"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AR_SESSION_COLLECTION_COLLECTION_TRIGGER_THERMAL_PRESSURE_DELTA"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"AR_SESSION_COLLECTION_COLLECTION_TRIGGER_CHARGE_STATE_CHANGE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOARSessionThermalPressure;
  int v4 = [(GEOARSessionThermalPressure *)&v8 description];
  v5 = [(GEOARSessionThermalPressure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOARSessionThermalPressure _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_26;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 28);
  if ((v5 & 8) != 0)
  {
    v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
    if (a2) {
      v7 = @"thermalPressure";
    }
    else {
      v7 = @"thermal_pressure";
    }
    [v4 setObject:v6 forKey:v7];

    char v5 = *(unsigned char *)(a1 + 28);
    if ((v5 & 1) == 0)
    {
LABEL_4:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
LABEL_12:
      uint64_t v9 = *(int *)(a1 + 16);
      if (v9 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E53F7CA0[v9];
      }
      if (a2) {
        v11 = @"chargingState";
      }
      else {
        v11 = @"charging_state";
      }
      [v4 setObject:v10 forKey:v11];

      if ((*(unsigned char *)(a1 + 28) & 4) == 0) {
        goto LABEL_26;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)(a1 + 28) & 1) == 0)
  {
    goto LABEL_4;
  }
  objc_super v8 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
  [v4 setObject:v8 forKey:@"timestamp"];

  char v5 = *(unsigned char *)(a1 + 28);
  if ((v5 & 2) != 0) {
    goto LABEL_12;
  }
LABEL_5:
  if ((v5 & 4) != 0)
  {
LABEL_19:
    unsigned int v12 = *(_DWORD *)(a1 + 20) - 1;
    if (v12 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 20));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E53F7478[v12];
    }
    if (a2) {
      v14 = @"collectionTrigger";
    }
    else {
      v14 = @"collection_trigger";
    }
    [v4 setObject:v13 forKey:v14];
  }
LABEL_26:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOARSessionThermalPressure _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOARSessionThermalPressure)initWithDictionary:(id)a3
{
  return (GEOARSessionThermalPressure *)-[GEOARSessionThermalPressure _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"thermalPressure";
      }
      else {
        v6 = @"thermal_pressure";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setThermalPressure:", objc_msgSend(v7, "unsignedIntValue"));
      }

      objc_super v8 = [v5 objectForKeyedSubscript:@"timestamp"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v8 doubleValue];
        objc_msgSend(a1, "setTimestamp:");
      }

      if (a3) {
        uint64_t v9 = @"chargingState";
      }
      else {
        uint64_t v9 = @"charging_state";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;
        if ([v11 isEqualToString:@"CHARGING_STATE_UNKNOWN"])
        {
          uint64_t v12 = 0;
        }
        else if ([v11 isEqualToString:@"CHARGING_STATE_NOT_CHARGING"])
        {
          uint64_t v12 = 1;
        }
        else if ([v11 isEqualToString:@"CHARGING_STATE_WIRED_CHARGING"])
        {
          uint64_t v12 = 2;
        }
        else if ([v11 isEqualToString:@"CHARGING_STATE_WIRELESS_CHARGING"])
        {
          uint64_t v12 = 3;
        }
        else
        {
          uint64_t v12 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_27;
        }
        uint64_t v12 = [v10 intValue];
      }
      [a1 setChargingState:v12];
LABEL_27:

      if (a3) {
        v13 = @"collectionTrigger";
      }
      else {
        v13 = @"collection_trigger";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v14;
        if ([v15 isEqualToString:@"AR_SESSION_COLLECTION_COLLECTION_TRIGGER_UNKNOWN"])
        {
          uint64_t v16 = 1;
        }
        else if ([v15 isEqualToString:@"AR_SESSION_COLLECTION_COLLECTION_TRIGGER_START_AR"])
        {
          uint64_t v16 = 2;
        }
        else if ([v15 isEqualToString:@"AR_SESSION_COLLECTION_COLLECTION_TRIGGER_END_AR"])
        {
          uint64_t v16 = 3;
        }
        else if ([v15 isEqualToString:@"AR_SESSION_COLLECTION_COLLECTION_TRIGGER_THERMAL_PRESSURE_DELTA"])
        {
          uint64_t v16 = 4;
        }
        else if ([v15 isEqualToString:@"AR_SESSION_COLLECTION_COLLECTION_TRIGGER_CHARGE_STATE_CHANGE"])
        {
          uint64_t v16 = 5;
        }
        else
        {
          uint64_t v16 = 1;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_46:

          goto LABEL_47;
        }
        uint64_t v16 = [v14 intValue];
      }
      [a1 setCollectionTrigger:v16];
      goto LABEL_46;
    }
  }
LABEL_47:

  return a1;
}

- (GEOARSessionThermalPressure)initWithJSON:(id)a3
{
  return (GEOARSessionThermalPressure *)-[GEOARSessionThermalPressure _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOARSessionThermalPressureIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOARSessionThermalPressureReadAllFrom((uint64_t)self, a3);
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
      if ((flags & 2) == 0) {
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
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOARSessionThermalPressure *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    v5[6] = self->_thermalPressure;
    *((unsigned char *)v5 + 28) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v5 + 1) = *(void *)&self->_timestamp;
  *((unsigned char *)v5 + 28) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v5[4] = self->_chargingState;
  *((unsigned char *)v5 + 28) |= 2u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_5:
    v5[5] = self->_collectionTrigger;
    *((unsigned char *)v5 + 28) |= 4u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_DWORD *)result + 6) = self->_thermalPressure;
    *((unsigned char *)result + 28) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = *(void *)&self->_timestamp;
  *((unsigned char *)result + 28) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 4) = self->_chargingState;
  *((unsigned char *)result + 28) |= 2u;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 5) = self->_collectionTrigger;
  *((unsigned char *)result + 28) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  [(GEOARSessionThermalPressure *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 8) == 0 || self->_thermalPressure != *((_DWORD *)v4 + 6)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 8) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_timestamp != *((double *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_chargingState != *((_DWORD *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_collectionTrigger != *((_DWORD *)v4 + 5)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  [(GEOARSessionThermalPressure *)self readAll:1];
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    uint64_t v4 = 2654435761 * self->_thermalPressure;
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
  double timestamp = self->_timestamp;
  double v6 = -timestamp;
  if (timestamp >= 0.0) {
    double v6 = self->_timestamp;
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
  if ((flags & 2) != 0)
  {
    uint64_t v10 = 2654435761 * self->_chargingState;
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
  uint64_t v11 = 2654435761 * self->_collectionTrigger;
  return v9 ^ v4 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 28);
  if ((v4 & 8) != 0)
  {
    self->_thermalPressure = *((_DWORD *)v5 + 6);
    *(unsigned char *)&self->_flags |= 8u;
    char v4 = *((unsigned char *)v5 + 28);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v5 + 28) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_double timestamp = *((double *)v5 + 1);
  *(unsigned char *)&self->_flags |= 1u;
  char v4 = *((unsigned char *)v5 + 28);
  if ((v4 & 2) == 0)
  {
LABEL_4:
    if ((v4 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_chargingState = *((_DWORD *)v5 + 4);
  *(unsigned char *)&self->_flags |= 2u;
  if ((*((unsigned char *)v5 + 28) & 4) != 0)
  {
LABEL_5:
    self->_collectionTrigger = *((_DWORD *)v5 + 5);
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_6:
}

@end