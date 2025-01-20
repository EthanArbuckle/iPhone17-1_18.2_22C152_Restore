@interface CellularWcdmaRachAttempt
- (BOOL)hasAccbState;
- (BOOL)hasAichStatus;
- (BOOL)hasAntenna;
- (BOOL)hasMsgLengthMs;
- (BOOL)hasNumPreambles;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)hasTxPwrDbm;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)plmn;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)txPwrDbm;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)accbState;
- (unsigned)aichStatus;
- (unsigned)antenna;
- (unsigned)msgLengthMs;
- (unsigned)numPreambles;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccbState:(unsigned int)a3;
- (void)setAichStatus:(unsigned int)a3;
- (void)setAntenna:(unsigned int)a3;
- (void)setHasAccbState:(BOOL)a3;
- (void)setHasAichStatus:(BOOL)a3;
- (void)setHasAntenna:(BOOL)a3;
- (void)setHasMsgLengthMs:(BOOL)a3;
- (void)setHasNumPreambles:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTxPwrDbm:(BOOL)a3;
- (void)setMsgLengthMs:(unsigned int)a3;
- (void)setNumPreambles:(unsigned int)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTxPwrDbm:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularWcdmaRachAttempt

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setMsgLengthMs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_msgLengthMs = a3;
}

- (void)setHasMsgLengthMs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMsgLengthMs
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setNumPreambles:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_numPreambles = a3;
}

- (void)setHasNumPreambles:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNumPreambles
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setAichStatus:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_aichStatus = a3;
}

- (void)setHasAichStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAichStatus
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setTxPwrDbm:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_txPwrDbm = a3;
}

- (void)setHasTxPwrDbm:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTxPwrDbm
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setAntenna:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_antenna = a3;
}

- (void)setHasAntenna:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAntenna
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setAccbState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_accbState = a3;
}

- (void)setHasAccbState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAccbState
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSubsId
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPsPref
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularWcdmaRachAttempt;
  __int16 v3 = [(CellularWcdmaRachAttempt *)&v7 description];
  v4 = [(CellularWcdmaRachAttempt *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v11 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v11 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v12 = +[NSNumber numberWithUnsignedInt:self->_msgLengthMs];
  [v3 setObject:v12 forKey:@"msg_length_ms"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  v13 = +[NSNumber numberWithUnsignedInt:self->_numPreambles];
  [v3 setObject:v13 forKey:@"num_preambles"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  v14 = +[NSNumber numberWithUnsignedInt:self->_aichStatus];
  [v3 setObject:v14 forKey:@"aich_status"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  v15 = +[NSNumber numberWithInt:self->_txPwrDbm];
  [v3 setObject:v15 forKey:@"tx_pwr_dbm"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  v16 = +[NSNumber numberWithUnsignedInt:self->_antenna];
  [v3 setObject:v16 forKey:@"antenna"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_25:
  v17 = +[NSNumber numberWithUnsignedInt:self->_accbState];
  [v3 setObject:v17 forKey:@"accb_state"];

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_9:
    v5 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
    [v3 setObject:v5 forKey:@"num_subs"];
  }
LABEL_10:
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x100) != 0)
  {
    v8 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v8 forKey:@"subs_id"];

    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 0x80) != 0)
  {
    v9 = +[NSNumber numberWithUnsignedInt:self->_psPref];
    [v3 setObject:v9 forKey:@"ps_pref"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000D3330((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteSint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
LABEL_9:
  }
    PBDataWriterWriteUint32Field();
LABEL_10:
  if (self->_plmn) {
    PBDataWriterWriteDataField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v5 = (__int16)self->_has;
  }
  if ((v5 & 0x80) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 30) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 7) = self->_msgLengthMs;
  *((_WORD *)v4 + 30) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 8) = self->_numPreambles;
  *((_WORD *)v4 + 30) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 5) = self->_aichStatus;
  *((_WORD *)v4 + 30) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 14) = self->_txPwrDbm;
  *((_WORD *)v4 + 30) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 6) = self->_antenna;
  *((_WORD *)v4 + 30) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_25:
  *((_DWORD *)v4 + 4) = self->_accbState;
  *((_WORD *)v4 + 30) |= 2u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_9:
    *((_DWORD *)v4 + 9) = self->_numSubs;
    *((_WORD *)v4 + 30) |= 0x40u;
  }
LABEL_10:
  if (self->_plmn)
  {
    __int16 v7 = v4;
    [v4 setPlmn:];
    v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x100) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_subsId;
    *((_WORD *)v4 + 30) |= 0x100u;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x80) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_psPref;
    *((_WORD *)v4 + 30) |= 0x80u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  __int16 v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 v6 = v5;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v5[1] = self->_timestamp;
    *((_WORD *)v5 + 30) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 7) = self->_msgLengthMs;
  *((_WORD *)v5 + 30) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v5 + 8) = self->_numPreambles;
  *((_WORD *)v5 + 30) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v5 + 5) = self->_aichStatus;
  *((_WORD *)v5 + 30) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v5 + 14) = self->_txPwrDbm;
  *((_WORD *)v5 + 30) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v5 + 6) = self->_antenna;
  *((_WORD *)v5 + 30) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_21:
  *((_DWORD *)v5 + 4) = self->_accbState;
  *((_WORD *)v5 + 30) |= 2u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_9:
    *((_DWORD *)v5 + 9) = self->_numSubs;
    *((_WORD *)v5 + 30) |= 0x40u;
  }
LABEL_10:
  id v8 = [(NSData *)self->_plmn copyWithZone:a3];
  v9 = (void *)v6[5];
  v6[5] = v8;

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x100) != 0)
  {
    *((_DWORD *)v6 + 13) = self->_subsId;
    *((_WORD *)v6 + 30) |= 0x100u;
    __int16 v10 = (__int16)self->_has;
  }
  if ((v10 & 0x80) != 0)
  {
    *((_DWORD *)v6 + 12) = self->_psPref;
    *((_WORD *)v6 + 30) |= 0x80u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_55;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 30);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_55;
    }
  }
  else if (v6)
  {
    goto LABEL_55;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_msgLengthMs != *((_DWORD *)v4 + 7)) {
      goto LABEL_55;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_55;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_numPreambles != *((_DWORD *)v4 + 8)) {
      goto LABEL_55;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_55;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_aichStatus != *((_DWORD *)v4 + 5)) {
      goto LABEL_55;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_55;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x200) == 0 || self->_txPwrDbm != *((_DWORD *)v4 + 14)) {
      goto LABEL_55;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x200) != 0)
  {
    goto LABEL_55;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_antenna != *((_DWORD *)v4 + 6)) {
      goto LABEL_55;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_55;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_accbState != *((_DWORD *)v4 + 4)) {
      goto LABEL_55;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_55;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_numSubs != *((_DWORD *)v4 + 9)) {
      goto LABEL_55;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_55;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](plmn, "isEqual:"))
    {
LABEL_55:
      BOOL v9 = 0;
      goto LABEL_56;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v8 = *((_WORD *)v4 + 30);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x100) == 0 || self->_subsId != *((_DWORD *)v4 + 13)) {
      goto LABEL_55;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x100) != 0)
  {
    goto LABEL_55;
  }
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_psPref != *((_DWORD *)v4 + 12)) {
      goto LABEL_55;
    }
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = (v8 & 0x80) == 0;
  }
LABEL_56:

  return v9;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v16 = 2654435761u * self->_timestamp;
    if ((has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_msgLengthMs;
      if ((has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v16 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_numPreambles;
    if ((has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((has & 4) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_aichStatus;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_txPwrDbm;
    if ((has & 8) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v7 = 0;
  if ((has & 8) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_antenna;
    if ((has & 2) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v9 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_15:
  uint64_t v8 = 0;
  if ((has & 2) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v9 = 2654435761 * self->_accbState;
  if ((has & 0x40) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_numSubs;
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v10 = 0;
LABEL_18:
  unint64_t v11 = (unint64_t)[(NSData *)self->_plmn hash];
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x100) != 0)
  {
    uint64_t v13 = 2654435761 * self->_subsId;
    if ((v12 & 0x80) != 0) {
      goto LABEL_20;
    }
LABEL_22:
    uint64_t v14 = 0;
    return v4 ^ v16 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v11;
  }
  uint64_t v13 = 0;
  if ((v12 & 0x80) == 0) {
    goto LABEL_22;
  }
LABEL_20:
  uint64_t v14 = 2654435761 * self->_psPref;
  return v4 ^ v16 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 30);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 30);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_msgLengthMs = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_numPreambles = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_aichStatus = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x200) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_txPwrDbm = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_antenna = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 2) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_25:
  self->_accbState = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)v4 + 30) & 0x40) != 0)
  {
LABEL_9:
    self->_numSubs = *((_DWORD *)v4 + 9);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_10:
  if (*((void *)v4 + 5))
  {
    id v7 = v4;
    -[CellularWcdmaRachAttempt setPlmn:](self, "setPlmn:");
    id v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 30);
  if ((v6 & 0x100) != 0)
  {
    self->_subsId = *((_DWORD *)v4 + 13);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v6 = *((_WORD *)v4 + 30);
  }
  if ((v6 & 0x80) != 0)
  {
    self->_psPref = *((_DWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 0x80u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)msgLengthMs
{
  return self->_msgLengthMs;
}

- (unsigned)numPreambles
{
  return self->_numPreambles;
}

- (unsigned)aichStatus
{
  return self->_aichStatus;
}

- (int)txPwrDbm
{
  return self->_txPwrDbm;
}

- (unsigned)antenna
{
  return self->_antenna;
}

- (unsigned)accbState
{
  return self->_accbState;
}

- (unsigned)numSubs
{
  return self->_numSubs;
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

- (unsigned)psPref
{
  return self->_psPref;
}

- (void).cxx_destruct
{
}

@end