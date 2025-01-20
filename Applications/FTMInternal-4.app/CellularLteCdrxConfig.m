@interface CellularLteCdrxConfig
- (BOOL)hasCellStatus;
- (BOOL)hasDrxInactivityMs;
- (BOOL)hasDrxRetxTimerMs;
- (BOOL)hasDrxShortCycleNum;
- (BOOL)hasLongDrxCycleMs;
- (BOOL)hasOnDurationMs;
- (BOOL)hasShortDrxCycleMs;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)cellStatus;
- (unsigned)drxInactivityMs;
- (unsigned)drxRetxTimerMs;
- (unsigned)drxShortCycleNum;
- (unsigned)longDrxCycleMs;
- (unsigned)onDurationMs;
- (unsigned)shortDrxCycleMs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCellStatus:(unsigned int)a3;
- (void)setDrxInactivityMs:(unsigned int)a3;
- (void)setDrxRetxTimerMs:(unsigned int)a3;
- (void)setDrxShortCycleNum:(unsigned int)a3;
- (void)setHasCellStatus:(BOOL)a3;
- (void)setHasDrxInactivityMs:(BOOL)a3;
- (void)setHasDrxRetxTimerMs:(BOOL)a3;
- (void)setHasDrxShortCycleNum:(BOOL)a3;
- (void)setHasLongDrxCycleMs:(BOOL)a3;
- (void)setHasOnDurationMs:(BOOL)a3;
- (void)setHasShortDrxCycleMs:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLongDrxCycleMs:(unsigned int)a3;
- (void)setOnDurationMs:(unsigned int)a3;
- (void)setShortDrxCycleMs:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularLteCdrxConfig

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCellStatus:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_cellStatus = a3;
}

- (void)setHasCellStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCellStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setOnDurationMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_onDurationMs = a3;
}

- (void)setHasOnDurationMs:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasOnDurationMs
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setDrxInactivityMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_drxInactivityMs = a3;
}

- (void)setHasDrxInactivityMs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDrxInactivityMs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDrxRetxTimerMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_drxRetxTimerMs = a3;
}

- (void)setHasDrxRetxTimerMs:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDrxRetxTimerMs
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setLongDrxCycleMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_longDrxCycleMs = a3;
}

- (void)setHasLongDrxCycleMs:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasLongDrxCycleMs
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setShortDrxCycleMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_shortDrxCycleMs = a3;
}

- (void)setHasShortDrxCycleMs:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasShortDrxCycleMs
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setDrxShortCycleNum:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_drxShortCycleNum = a3;
}

- (void)setHasDrxShortCycleNum:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDrxShortCycleNum
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularLteCdrxConfig;
  char v3 = [(CellularLteCdrxConfig *)&v7 description];
  v4 = [(CellularLteCdrxConfig *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v7 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v8 = +[NSNumber numberWithUnsignedInt:self->_cellStatus];
  [v3 setObject:v8 forKey:@"cell_status"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  v9 = +[NSNumber numberWithUnsignedInt:self->_onDurationMs];
  [v3 setObject:v9 forKey:@"on_duration_ms"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  v10 = +[NSNumber numberWithUnsignedInt:self->_drxInactivityMs];
  [v3 setObject:v10 forKey:@"drx_inactivity_ms"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  v11 = +[NSNumber numberWithUnsignedInt:self->_drxRetxTimerMs];
  [v3 setObject:v11 forKey:@"drx_retx_timer_ms"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  v12 = +[NSNumber numberWithUnsignedInt:self->_longDrxCycleMs];
  [v3 setObject:v12 forKey:@"long_drx_cycle_ms"];

  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  v13 = +[NSNumber numberWithUnsignedInt:self->_shortDrxCycleMs];
  [v3 setObject:v13 forKey:@"short_drx_cycle_ms"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_9:
    v5 = +[NSNumber numberWithUnsignedInt:self->_drxShortCycleNum];
    [v3 setObject:v5 forKey:@"drx_short_cycle_num"];
  }
LABEL_10:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000A3BA4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_9:
  }
    PBDataWriterWriteUint32Field();
LABEL_10:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 44) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 4) = self->_cellStatus;
  *((unsigned char *)v4 + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)v4 + 9) = self->_onDurationMs;
  *((unsigned char *)v4 + 44) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v4 + 5) = self->_drxInactivityMs;
  *((unsigned char *)v4 + 44) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v4 + 6) = self->_drxRetxTimerMs;
  *((unsigned char *)v4 + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v4 + 8) = self->_longDrxCycleMs;
  *((unsigned char *)v4 + 44) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  *((_DWORD *)v4 + 10) = self->_shortDrxCycleMs;
  *((unsigned char *)v4 + 44) |= 0x80u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_9:
    *((_DWORD *)v4 + 7) = self->_drxShortCycleNum;
    *((unsigned char *)v4 + 44) |= 0x10u;
  }
LABEL_10:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 44) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_cellStatus;
  *((unsigned char *)result + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 9) = self->_onDurationMs;
  *((unsigned char *)result + 44) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 5) = self->_drxInactivityMs;
  *((unsigned char *)result + 44) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 6) = self->_drxRetxTimerMs;
  *((unsigned char *)result + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 8) = self->_longDrxCycleMs;
  *((unsigned char *)result + 44) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      return result;
    }
    goto LABEL_9;
  }
LABEL_17:
  *((_DWORD *)result + 10) = self->_shortDrxCycleMs;
  *((unsigned char *)result + 44) |= 0x80u;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    return result;
  }
LABEL_9:
  *((_DWORD *)result + 7) = self->_drxShortCycleNum;
  *((unsigned char *)result + 44) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_40;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_cellStatus != *((_DWORD *)v4 + 4)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x40) == 0 || self->_onDurationMs != *((_DWORD *)v4 + 9)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x40) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_drxInactivityMs != *((_DWORD *)v4 + 5)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) == 0 || self->_drxRetxTimerMs != *((_DWORD *)v4 + 6)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x20) == 0 || self->_longDrxCycleMs != *((_DWORD *)v4 + 8)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x20) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x80) == 0 || self->_shortDrxCycleMs != *((_DWORD *)v4 + 10)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x80) != 0)
  {
LABEL_40:
    BOOL v5 = 0;
    goto LABEL_41;
  }
  BOOL v5 = (*((unsigned char *)v4 + 44) & 0x10) == 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x10) == 0 || self->_drxShortCycleNum != *((_DWORD *)v4 + 7)) {
      goto LABEL_40;
    }
    BOOL v5 = 1;
  }
LABEL_41:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_cellStatus;
      if ((*(unsigned char *)&self->_has & 0x40) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_onDurationMs;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_drxInactivityMs;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_drxRetxTimerMs;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_longDrxCycleMs;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x80) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_shortDrxCycleMs;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_drxShortCycleNum;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 44);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 44);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_cellStatus = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_onDurationMs = *((_DWORD *)v4 + 9);
  *(unsigned char *)&self->_has |= 0x40u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_drxInactivityMs = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_drxRetxTimerMs = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_longDrxCycleMs = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 0x80) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  self->_shortDrxCycleMs = *((_DWORD *)v4 + 10);
  *(unsigned char *)&self->_has |= 0x80u;
  if ((*((unsigned char *)v4 + 44) & 0x10) != 0)
  {
LABEL_9:
    self->_drxShortCycleNum = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_10:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)cellStatus
{
  return self->_cellStatus;
}

- (unsigned)onDurationMs
{
  return self->_onDurationMs;
}

- (unsigned)drxInactivityMs
{
  return self->_drxInactivityMs;
}

- (unsigned)drxRetxTimerMs
{
  return self->_drxRetxTimerMs;
}

- (unsigned)longDrxCycleMs
{
  return self->_longDrxCycleMs;
}

- (unsigned)shortDrxCycleMs
{
  return self->_shortDrxCycleMs;
}

- (unsigned)drxShortCycleNum
{
  return self->_drxShortCycleNum;
}

@end