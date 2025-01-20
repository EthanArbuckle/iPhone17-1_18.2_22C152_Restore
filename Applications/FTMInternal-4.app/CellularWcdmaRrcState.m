@interface CellularWcdmaRrcState
- (BOOL)hasNewRrcState;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPrevStateDurMs;
- (BOOL)hasPsPref;
- (BOOL)hasRrcState;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)plmn;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)newRrcStateAsString:(int)a3;
- (id)rrcStateAsString:(int)a3;
- (int)StringAsNewRrcState:(id)a3;
- (int)StringAsRrcState:(id)a3;
- (int)newRrcState;
- (int)rrcState;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)numSubs;
- (unsigned)prevStateDurMs;
- (unsigned)psPref;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNewRrcState:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPrevStateDurMs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasRrcState:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setNewRrcState:(int)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPlmn:(id)a3;
- (void)setPrevStateDurMs:(unsigned int)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setRrcState:(int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularWcdmaRrcState

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

- (int)rrcState
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_rrcState;
  }
  else {
    return 0;
  }
}

- (void)setRrcState:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_rrcState = a3;
}

- (void)setHasRrcState:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRrcState
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)rrcStateAsString:(int)a3
{
  if (a3 >= 6)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_100288528[a3];
  }

  return v3;
}

- (int)StringAsRrcState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"WCDMA_RRC_STATE_DISCONNECTED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"WCDMA_RRC_STATE_CONNECTING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WCDMA_RRC_STATE_CELL_FACH"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WCDMA_RRC_STATE_CELL_DCH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"WCDMA_RRC_STATE_CELL_PCH"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"WCDMA_RRC_STATE_URA_PCH"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)newRrcState
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_newRrcState;
  }
  else {
    return 0;
  }
}

- (void)setNewRrcState:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_newRrcState = a3;
}

- (void)setHasNewRrcState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNewRrcState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)newRrcStateAsString:(int)a3
{
  if (a3 < 6) {
    return off_100288528[a3];
  }
  +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNewRrcState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"WCDMA_RRC_STATE_DISCONNECTED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"WCDMA_RRC_STATE_CONNECTING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WCDMA_RRC_STATE_CELL_FACH"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WCDMA_RRC_STATE_CELL_DCH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"WCDMA_RRC_STATE_CELL_PCH"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"WCDMA_RRC_STATE_URA_PCH"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setPrevStateDurMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_prevStateDurMs = a3;
}

- (void)setHasPrevStateDurMs:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPrevStateDurMs
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumSubs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPsPref
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSubsId
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularWcdmaRrcState;
  char v3 = [(CellularWcdmaRrcState *)&v7 description];
  int v4 = [(CellularWcdmaRrcState *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v9 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v9 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  uint64_t rrcState = self->_rrcState;
  if (rrcState >= 6)
  {
    v11 = +[NSString stringWithFormat:@"(unknown: %i)", self->_rrcState];
  }
  else
  {
    v11 = off_100288528[rrcState];
  }
  [v3 setObject:v11 forKey:@"rrc_state"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_20:
  uint64_t newRrcState = self->_newRrcState;
  if (newRrcState >= 6)
  {
    v13 = +[NSString stringWithFormat:@"(unknown: %i)", self->_newRrcState];
  }
  else
  {
    v13 = off_100288528[newRrcState];
  }
  [v3 setObject:v13 forKey:@"new_rrc_state"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  v14 = +[NSNumber numberWithUnsignedInt:self->_prevStateDurMs];
  [v3 setObject:v14 forKey:@"prev_state_dur_ms"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_25:
  v15 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
  [v3 setObject:v15 forKey:@"num_subs"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    v5 = +[NSNumber numberWithUnsignedInt:self->_psPref];
    [v3 setObject:v5 forKey:@"ps_pref"];
  }
LABEL_8:
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v7 forKey:@"subs_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10012D310((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_7:
  }
    PBDataWriterWriteUint32Field();
LABEL_8:
  if (self->_plmn) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 10) = self->_rrcState;
  *((unsigned char *)v4 + 48) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v4 + 4) = self->_newRrcState;
  *((unsigned char *)v4 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v4 + 8) = self->_prevStateDurMs;
  *((unsigned char *)v4 + 48) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_19:
  *((_DWORD *)v4 + 5) = self->_numSubs;
  *((unsigned char *)v4 + 48) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 9) = self->_psPref;
    *((unsigned char *)v4 + 48) |= 0x10u;
  }
LABEL_8:
  if (self->_plmn)
  {
    v6 = v4;
    [v4 setPlmn:];
    int v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    *((_DWORD *)v4 + 11) = self->_subsId;
    *((unsigned char *)v4 + 48) |= 0x40u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    v5[1] = self->_timestamp;
    *((unsigned char *)v5 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 10) = self->_rrcState;
  *((unsigned char *)v5 + 48) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)v5 + 4) = self->_newRrcState;
  *((unsigned char *)v5 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)v5 + 8) = self->_prevStateDurMs;
  *((unsigned char *)v5 + 48) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  *((_DWORD *)v5 + 5) = self->_numSubs;
  *((unsigned char *)v5 + 48) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    *((_DWORD *)v5 + 9) = self->_psPref;
    *((unsigned char *)v5 + 48) |= 0x10u;
  }
LABEL_8:
  id v8 = [(NSData *)self->_plmn copyWithZone:a3];
  v9 = (void *)v6[3];
  v6[3] = v8;

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    *((_DWORD *)v6 + 11) = self->_subsId;
    *((unsigned char *)v6 + 48) |= 0x40u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_39;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_39;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 0x20) == 0 || self->_rrcState != *((_DWORD *)v4 + 10)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 0x20) != 0)
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_newRrcState != *((_DWORD *)v4 + 4)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_prevStateDurMs != *((_DWORD *)v4 + 8)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_numSubs != *((_DWORD *)v4 + 5)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 0x10) == 0 || self->_psPref != *((_DWORD *)v4 + 9)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 0x10) != 0)
  {
    goto LABEL_39;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](plmn, "isEqual:"))
    {
LABEL_39:
      BOOL v7 = 0;
      goto LABEL_40;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 48) & 0x40) == 0;
  if ((has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 0x40) == 0 || self->_subsId != *((_DWORD *)v4 + 11)) {
      goto LABEL_39;
    }
    BOOL v7 = 1;
  }
LABEL_40:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_rrcState;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_newRrcState;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_prevStateDurMs;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_numSubs;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_psPref;
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v8 = 0;
LABEL_14:
  unint64_t v9 = (unint64_t)[(NSData *)self->_plmn hash];
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    uint64_t v10 = 2654435761 * self->_subsId;
  }
  else {
    uint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 48);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 48);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t rrcState = *((_DWORD *)v4 + 10);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_uint64_t newRrcState = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_prevStateDurMs = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_19:
  self->_numSubs = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 48) & 0x10) != 0)
  {
LABEL_7:
    self->_psPref = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_8:
  if (*((void *)v4 + 3))
  {
    id v6 = v4;
    -[CellularWcdmaRrcState setPlmn:](self, "setPlmn:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 48) & 0x40) != 0)
  {
    self->_subsId = *((_DWORD *)v4 + 11);
    *(unsigned char *)&self->_has |= 0x40u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)prevStateDurMs
{
  return self->_prevStateDurMs;
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (unsigned)psPref
{
  return self->_psPref;
}

- (NSData)plmn
{
  return self->_plmn;
}

- (void)setPlmn:(id)a3
{
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
}

@end