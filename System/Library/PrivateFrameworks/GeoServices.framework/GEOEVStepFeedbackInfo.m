@interface GEOEVStepFeedbackInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasRemainingBatteryCharge;
- (BOOL)hasRemainingBatteryPercentage;
- (BOOL)hasRemainingTravelRange;
- (BOOL)hasStateOfChargeDiff;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOEVStepFeedbackInfo)initWithDictionary:(id)a3;
- (GEOEVStepFeedbackInfo)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)remainingBatteryCharge;
- (unsigned)remainingBatteryPercentage;
- (unsigned)remainingTravelRange;
- (unsigned)stateOfChargeDiff;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRemainingBatteryCharge:(BOOL)a3;
- (void)setHasRemainingBatteryPercentage:(BOOL)a3;
- (void)setHasRemainingTravelRange:(BOOL)a3;
- (void)setHasStateOfChargeDiff:(BOOL)a3;
- (void)setRemainingBatteryCharge:(unsigned int)a3;
- (void)setRemainingBatteryPercentage:(unsigned int)a3;
- (void)setRemainingTravelRange:(unsigned int)a3;
- (void)setStateOfChargeDiff:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOEVStepFeedbackInfo

- (unsigned)remainingBatteryPercentage
{
  return self->_remainingBatteryPercentage;
}

- (void)setRemainingBatteryPercentage:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_remainingBatteryPercentage = a3;
}

- (void)setHasRemainingBatteryPercentage:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasRemainingBatteryPercentage
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)remainingTravelRange
{
  return self->_remainingTravelRange;
}

- (void)setRemainingTravelRange:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_remainingTravelRange = a3;
}

- (void)setHasRemainingTravelRange:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasRemainingTravelRange
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unsigned)remainingBatteryCharge
{
  return self->_remainingBatteryCharge;
}

- (void)setRemainingBatteryCharge:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_remainingBatteryCharge = a3;
}

- (void)setHasRemainingBatteryCharge:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasRemainingBatteryCharge
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)stateOfChargeDiff
{
  return self->_stateOfChargeDiff;
}

- (void)setStateOfChargeDiff:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_stateOfChargeDiff = a3;
}

- (void)setHasStateOfChargeDiff:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasStateOfChargeDiff
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOEVStepFeedbackInfo;
  v4 = [(GEOEVStepFeedbackInfo *)&v8 description];
  v5 = [(GEOEVStepFeedbackInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOEVStepFeedbackInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_23;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 24);
  if ((v5 & 2) != 0)
  {
    v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 12)];
    if (a2) {
      v7 = @"remainingBatteryPercentage";
    }
    else {
      v7 = @"remaining_battery_percentage";
    }
    [v4 setObject:v6 forKey:v7];

    char v5 = *(unsigned char *)(a1 + 24);
  }
  if ((v5 & 4) == 0)
  {
    if ((v5 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_15:
    v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 8)];
    if (a2) {
      v11 = @"remainingBatteryCharge";
    }
    else {
      v11 = @"remaining_battery_charge";
    }
    [v4 setObject:v10 forKey:v11];

    if ((*(unsigned char *)(a1 + 24) & 8) == 0) {
      goto LABEL_23;
    }
    goto LABEL_19;
  }
  objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
  if (a2) {
    v9 = @"remainingTravelRange";
  }
  else {
    v9 = @"remaining_travel_range";
  }
  [v4 setObject:v8 forKey:v9];

  char v5 = *(unsigned char *)(a1 + 24);
  if (v5) {
    goto LABEL_15;
  }
LABEL_9:
  if ((v5 & 8) != 0)
  {
LABEL_19:
    v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 20)];
    if (a2) {
      v13 = @"stateOfChargeDiff";
    }
    else {
      v13 = @"state_of_charge_diff";
    }
    [v4 setObject:v12 forKey:v13];
  }
LABEL_23:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOEVStepFeedbackInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOEVStepFeedbackInfo)initWithDictionary:(id)a3
{
  return (GEOEVStepFeedbackInfo *)-[GEOEVStepFeedbackInfo _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"remainingBatteryPercentage";
      }
      else {
        v6 = @"remaining_battery_percentage";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRemainingBatteryPercentage:", objc_msgSend(v7, "unsignedIntValue"));
      }

      if (a3) {
        objc_super v8 = @"remainingTravelRange";
      }
      else {
        objc_super v8 = @"remaining_travel_range";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRemainingTravelRange:", objc_msgSend(v9, "unsignedIntValue"));
      }

      if (a3) {
        v10 = @"remainingBatteryCharge";
      }
      else {
        v10 = @"remaining_battery_charge";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRemainingBatteryCharge:", objc_msgSend(v11, "unsignedIntValue"));
      }

      if (a3) {
        v12 = @"stateOfChargeDiff";
      }
      else {
        v12 = @"state_of_charge_diff";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setStateOfChargeDiff:", objc_msgSend(v13, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOEVStepFeedbackInfo)initWithJSON:(id)a3
{
  return (GEOEVStepFeedbackInfo *)-[GEOEVStepFeedbackInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOEVStepFeedbackInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOEVStepFeedbackInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOEVStepFeedbackInfo *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[3] = self->_remainingBatteryPercentage;
    *((unsigned char *)v5 + 24) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  v5[4] = self->_remainingTravelRange;
  *((unsigned char *)v5 + 24) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v5[2] = self->_remainingBatteryCharge;
  *((unsigned char *)v5 + 24) |= 1u;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
LABEL_5:
    v5[5] = self->_stateOfChargeDiff;
    *((unsigned char *)v5 + 24) |= 8u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_remainingBatteryPercentage;
    *((unsigned char *)result + 24) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_remainingTravelRange;
  *((unsigned char *)result + 24) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 2) = self->_remainingBatteryCharge;
  *((unsigned char *)result + 24) |= 1u;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 5) = self->_stateOfChargeDiff;
  *((unsigned char *)result + 24) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  [(GEOEVStepFeedbackInfo *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_remainingBatteryPercentage != *((_DWORD *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_remainingTravelRange != *((_DWORD *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_remainingBatteryCharge != *((_DWORD *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 8) == 0;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 8) == 0 || self->_stateOfChargeDiff != *((_DWORD *)v4 + 5)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  [(GEOEVStepFeedbackInfo *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_remainingBatteryPercentage;
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_remainingTravelRange;
      if (*(unsigned char *)&self->_flags) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_flags & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_remainingBatteryCharge;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_stateOfChargeDiff;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (unsigned int *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 2) != 0)
  {
    self->_remainingBatteryPercentage = v5[3];
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 24);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((v5[6] & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_remainingTravelRange = v5[4];
  *(unsigned char *)&self->_flags |= 4u;
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 1) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_remainingBatteryCharge = v5[2];
  *(unsigned char *)&self->_flags |= 1u;
  if ((v5[6] & 8) != 0)
  {
LABEL_5:
    self->_stateOfChargeDiff = v5[5];
    *(unsigned char *)&self->_flags |= 8u;
  }
LABEL_6:
}

@end