@interface RfMeasInfo
- (BOOL)hasAccessory;
- (BOOL)hasMag;
- (BOOL)hasPhase;
- (BOOL)hasPortPositionSf;
- (BOOL)hasScenario;
- (BOOL)hasTunerStateCounter;
- (BOOL)hasTxPwrDb2;
- (BOOL)hasTxSkuIdx;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)mag;
- (int)phase;
- (int)txPwrDb2;
- (unint64_t)hash;
- (unsigned)accessory;
- (unsigned)portPositionSf;
- (unsigned)scenario;
- (unsigned)tunerStateCounter;
- (unsigned)txSkuIdx;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccessory:(unsigned int)a3;
- (void)setHasAccessory:(BOOL)a3;
- (void)setHasMag:(BOOL)a3;
- (void)setHasPhase:(BOOL)a3;
- (void)setHasPortPositionSf:(BOOL)a3;
- (void)setHasScenario:(BOOL)a3;
- (void)setHasTunerStateCounter:(BOOL)a3;
- (void)setHasTxPwrDb2:(BOOL)a3;
- (void)setHasTxSkuIdx:(BOOL)a3;
- (void)setMag:(int)a3;
- (void)setPhase:(int)a3;
- (void)setPortPositionSf:(unsigned int)a3;
- (void)setScenario:(unsigned int)a3;
- (void)setTunerStateCounter:(unsigned int)a3;
- (void)setTxPwrDb2:(int)a3;
- (void)setTxSkuIdx:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation RfMeasInfo

- (void)setMag:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_mag = a3;
}

- (void)setHasMag:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMag
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPhase:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_phase = a3;
}

- (void)setHasPhase:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPhase
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAccessory:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_accessory = a3;
}

- (void)setHasAccessory:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAccessory
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTxPwrDb2:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_txPwrDb2 = a3;
}

- (void)setHasTxPwrDb2:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTxPwrDb2
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setTxSkuIdx:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_txSkuIdx = a3;
}

- (void)setHasTxSkuIdx:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasTxSkuIdx
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setScenario:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_scenario = a3;
}

- (void)setHasScenario:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasScenario
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setPortPositionSf:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_portPositionSf = a3;
}

- (void)setHasPortPositionSf:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPortPositionSf
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTunerStateCounter:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_tunerStateCounter = a3;
}

- (void)setHasTunerStateCounter:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTunerStateCounter
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)RfMeasInfo;
  char v3 = [(RfMeasInfo *)&v7 description];
  v4 = [(RfMeasInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v7 = +[NSNumber numberWithInt:self->_mag];
    [v3 setObject:v7 forKey:@"mag"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v8 = +[NSNumber numberWithInt:self->_phase];
  [v3 setObject:v8 forKey:@"phase"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  v9 = +[NSNumber numberWithUnsignedInt:self->_accessory];
  [v3 setObject:v9 forKey:@"accessory"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  v10 = +[NSNumber numberWithInt:self->_txPwrDb2];
  [v3 setObject:v10 forKey:@"tx_pwr_db2"];

  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  v11 = +[NSNumber numberWithUnsignedInt:self->_txSkuIdx];
  [v3 setObject:v11 forKey:@"tx_sku_idx"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  v12 = +[NSNumber numberWithUnsignedInt:self->_scenario];
  [v3 setObject:v12 forKey:@"scenario"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  v13 = +[NSNumber numberWithUnsignedInt:self->_portPositionSf];
  [v3 setObject:v13 forKey:@"port_position_sf"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_9:
    v5 = +[NSNumber numberWithUnsignedInt:self->_tunerStateCounter];
    [v3 setObject:v5 forKey:@"tuner_state_counter"];
  }
LABEL_10:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100009F58((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteSint32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteSint32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteSint32Field();
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_9:
  }
    PBDataWriterWriteUint32Field();
LABEL_10:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_mag;
    *((unsigned char *)v4 + 40) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_phase;
  *((unsigned char *)v4 + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  v4[2] = self->_accessory;
  *((unsigned char *)v4 + 40) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[8] = self->_txPwrDb2;
  *((unsigned char *)v4 + 40) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  v4[9] = self->_txSkuIdx;
  *((unsigned char *)v4 + 40) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  v4[6] = self->_scenario;
  *((unsigned char *)v4 + 40) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  v4[5] = self->_portPositionSf;
  *((unsigned char *)v4 + 40) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_9:
    v4[7] = self->_tunerStateCounter;
    *((unsigned char *)v4 + 40) |= 0x20u;
  }
LABEL_10:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_mag;
    *((unsigned char *)result + 40) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_phase;
  *((unsigned char *)result + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 2) = self->_accessory;
  *((unsigned char *)result + 40) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 8) = self->_txPwrDb2;
  *((unsigned char *)result + 40) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 9) = self->_txSkuIdx;
  *((unsigned char *)result + 40) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 6) = self->_scenario;
  *((unsigned char *)result + 40) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      return result;
    }
    goto LABEL_9;
  }
LABEL_17:
  *((_DWORD *)result + 5) = self->_portPositionSf;
  *((unsigned char *)result + 40) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    return result;
  }
LABEL_9:
  *((_DWORD *)result + 7) = self->_tunerStateCounter;
  *((unsigned char *)result + 40) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_mag != *((_DWORD *)v4 + 3)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_phase != *((_DWORD *)v4 + 4)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_41;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_accessory != *((_DWORD *)v4 + 2)) {
      goto LABEL_41;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x40) == 0 || self->_txPwrDb2 != *((_DWORD *)v4 + 8)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 0x40) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x80) == 0 || self->_txSkuIdx != *((_DWORD *)v4 + 9)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 0x80) != 0)
  {
LABEL_41:
    BOOL v5 = 0;
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x10) == 0 || self->_scenario != *((_DWORD *)v4 + 6)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 0x10) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_portPositionSf != *((_DWORD *)v4 + 5)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
    goto LABEL_41;
  }
  BOOL v5 = (*((unsigned char *)v4 + 40) & 0x20) == 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x20) == 0 || self->_tunerStateCounter != *((_DWORD *)v4 + 7)) {
      goto LABEL_41;
    }
    BOOL v5 = 1;
  }
LABEL_42:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_mag;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_phase;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_accessory;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_txPwrDb2;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_txSkuIdx;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_scenario;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_portPositionSf;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_tunerStateCounter;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_mag = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_phase = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_accessory = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_txPwrDb2 = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 0x40u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_txSkuIdx = *((_DWORD *)v4 + 9);
  *(unsigned char *)&self->_has |= 0x80u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_scenario = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  self->_portPositionSf = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 40) & 0x20) != 0)
  {
LABEL_9:
    self->_tunerStateCounter = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_10:
}

- (int)mag
{
  return self->_mag;
}

- (int)phase
{
  return self->_phase;
}

- (unsigned)accessory
{
  return self->_accessory;
}

- (int)txPwrDb2
{
  return self->_txPwrDb2;
}

- (unsigned)txSkuIdx
{
  return self->_txSkuIdx;
}

- (unsigned)scenario
{
  return self->_scenario;
}

- (unsigned)portPositionSf
{
  return self->_portPositionSf;
}

- (unsigned)tunerStateCounter
{
  return self->_tunerStateCounter;
}

@end