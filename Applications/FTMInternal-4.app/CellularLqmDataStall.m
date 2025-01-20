@interface CellularLqmDataStall
- (BOOL)dataStallOccured;
- (BOOL)dnsFailureOccured;
- (BOOL)hasDataStallOccured;
- (BOOL)hasDnsFailureOccured;
- (BOOL)hasIsDcActive;
- (BOOL)hasLqmState;
- (BOOL)hasMediaPreWarningHint;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasRrcState;
- (BOOL)hasServCellState;
- (BOOL)hasSubsId;
- (BOOL)hasSysMode;
- (BOOL)hasTimestamp;
- (BOOL)isDcActive;
- (BOOL)isEqual:(id)a3;
- (BOOL)mediaPreWarningHint;
- (BOOL)readFrom:(id)a3;
- (NSData)plmn;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)lqmState;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)rrcState;
- (unsigned)servCellState;
- (unsigned)subsId;
- (unsigned)sysMode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDataStallOccured:(BOOL)a3;
- (void)setDnsFailureOccured:(BOOL)a3;
- (void)setHasDataStallOccured:(BOOL)a3;
- (void)setHasDnsFailureOccured:(BOOL)a3;
- (void)setHasIsDcActive:(BOOL)a3;
- (void)setHasLqmState:(BOOL)a3;
- (void)setHasMediaPreWarningHint:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasRrcState:(BOOL)a3;
- (void)setHasServCellState:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasSysMode:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsDcActive:(BOOL)a3;
- (void)setLqmState:(unsigned int)a3;
- (void)setMediaPreWarningHint:(BOOL)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setRrcState:(unsigned int)a3;
- (void)setServCellState:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setSysMode:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularLqmDataStall

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

- (void)setDataStallOccured:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_dataStallOccured = a3;
}

- (void)setHasDataStallOccured:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasDataStallOccured
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setDnsFailureOccured:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_dnsFailureOccured = a3;
}

- (void)setHasDnsFailureOccured:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasDnsFailureOccured
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setMediaPreWarningHint:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_mediaPreWarningHint = a3;
}

- (void)setHasMediaPreWarningHint:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasMediaPreWarningHint
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setSysMode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_sysMode = a3;
}

- (void)setHasSysMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSysMode
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setLqmState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_lqmState = a3;
}

- (void)setHasLqmState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasLqmState
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setServCellState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_servCellState = a3;
}

- (void)setHasServCellState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasServCellState
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRrcState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_rrcState = a3;
}

- (void)setHasRrcState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRrcState
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setIsDcActive:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isDcActive = a3;
}

- (void)setHasIsDcActive:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIsDcActive
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPsPref
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularLqmDataStall;
  __int16 v3 = [(CellularLqmDataStall *)&v7 description];
  v4 = [(CellularLqmDataStall *)self dictionaryRepresentation];
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
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  v12 = +[NSNumber numberWithBool:self->_dataStallOccured];
  [v3 setObject:v12 forKey:@"data_stall_occured"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  v13 = +[NSNumber numberWithBool:self->_dnsFailureOccured];
  [v3 setObject:v13 forKey:@"dns_failure_occured"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  v14 = +[NSNumber numberWithBool:self->_mediaPreWarningHint];
  [v3 setObject:v14 forKey:@"media_pre_warning_hint"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  v15 = +[NSNumber numberWithUnsignedInt:self->_sysMode];
  [v3 setObject:v15 forKey:@"sys_mode"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  v16 = +[NSNumber numberWithUnsignedInt:self->_lqmState];
  [v3 setObject:v16 forKey:@"lqm_state"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  v17 = +[NSNumber numberWithUnsignedInt:self->_servCellState];
  [v3 setObject:v17 forKey:@"serv_cell_state"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  v18 = +[NSNumber numberWithUnsignedInt:self->_rrcState];
  [v3 setObject:v18 forKey:@"rrc_state"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_29:
  v19 = +[NSNumber numberWithBool:self->_isDcActive];
  [v3 setObject:v19 forKey:@"is_dc_active"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_11:
    v5 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
    [v3 setObject:v5 forKey:@"num_subs"];
  }
LABEL_12:
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 8) != 0)
  {
    v8 = +[NSNumber numberWithUnsignedInt:self->_psPref];
    [v3 setObject:v8 forKey:@"ps_pref"];

    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 0x40) != 0)
  {
    v9 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v9 forKey:@"subs_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001414A4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_29:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 4) != 0) {
LABEL_11:
  }
    PBDataWriterWriteUint32Field();
LABEL_12:
  if (self->_plmn) {
    PBDataWriterWriteDataField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v5 = (__int16)self->_has;
  }
  if ((v5 & 0x40) != 0) {
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
    *((_WORD *)v4 + 28) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v4 + 52) = self->_dataStallOccured;
  *((_WORD *)v4 + 28) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((unsigned char *)v4 + 53) = self->_dnsFailureOccured;
  *((_WORD *)v4 + 28) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((unsigned char *)v4 + 55) = self->_mediaPreWarningHint;
  *((_WORD *)v4 + 28) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 12) = self->_sysMode;
  *((_WORD *)v4 + 28) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 4) = self->_lqmState;
  *((_WORD *)v4 + 28) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v4 + 10) = self->_servCellState;
  *((_WORD *)v4 + 28) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v4 + 9) = self->_rrcState;
  *((_WORD *)v4 + 28) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_29:
  *((unsigned char *)v4 + 54) = self->_isDcActive;
  *((_WORD *)v4 + 28) |= 0x400u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_11:
    *((_DWORD *)v4 + 5) = self->_numSubs;
    *((_WORD *)v4 + 28) |= 4u;
  }
LABEL_12:
  if (self->_plmn)
  {
    __int16 v7 = v4;
    [v4 setPlmn:];
    v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_psPref;
    *((_WORD *)v4 + 28) |= 8u;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x40) != 0)
  {
    *((_DWORD *)v4 + 11) = self->_subsId;
    *((_WORD *)v4 + 28) |= 0x40u;
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
    *((_WORD *)v5 + 28) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v5 + 52) = self->_dataStallOccured;
  *((_WORD *)v5 + 28) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((unsigned char *)v5 + 53) = self->_dnsFailureOccured;
  *((_WORD *)v5 + 28) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((unsigned char *)v5 + 55) = self->_mediaPreWarningHint;
  *((_WORD *)v5 + 28) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v5 + 12) = self->_sysMode;
  *((_WORD *)v5 + 28) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v5 + 4) = self->_lqmState;
  *((_WORD *)v5 + 28) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v5 + 10) = self->_servCellState;
  *((_WORD *)v5 + 28) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v5 + 9) = self->_rrcState;
  *((_WORD *)v5 + 28) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_25:
  *((unsigned char *)v5 + 54) = self->_isDcActive;
  *((_WORD *)v5 + 28) |= 0x400u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_11:
    *((_DWORD *)v5 + 5) = self->_numSubs;
    *((_WORD *)v5 + 28) |= 4u;
  }
LABEL_12:
  id v8 = [(NSData *)self->_plmn copyWithZone:a3];
  v9 = (void *)v6[3];
  v6[3] = v8;

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 8) != 0)
  {
    *((_DWORD *)v6 + 8) = self->_psPref;
    *((_WORD *)v6 + 28) |= 8u;
    __int16 v10 = (__int16)self->_has;
  }
  if ((v10 & 0x40) != 0)
  {
    *((_DWORD *)v6 + 11) = self->_subsId;
    *((_WORD *)v6 + 28) |= 0x40u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_77;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 28);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_77;
    }
  }
  else if (v6)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 28) & 0x100) == 0) {
      goto LABEL_77;
    }
    if (self->_dataStallOccured)
    {
      if (!*((unsigned char *)v4 + 52)) {
        goto LABEL_77;
      }
    }
    else if (*((unsigned char *)v4 + 52))
    {
      goto LABEL_77;
    }
  }
  else if ((*((_WORD *)v4 + 28) & 0x100) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 28) & 0x200) == 0) {
      goto LABEL_77;
    }
    if (self->_dnsFailureOccured)
    {
      if (!*((unsigned char *)v4 + 53)) {
        goto LABEL_77;
      }
    }
    else if (*((unsigned char *)v4 + 53))
    {
      goto LABEL_77;
    }
  }
  else if ((*((_WORD *)v4 + 28) & 0x200) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 28) & 0x800) == 0) {
      goto LABEL_77;
    }
    if (self->_mediaPreWarningHint)
    {
      if (!*((unsigned char *)v4 + 55)) {
        goto LABEL_77;
      }
    }
    else if (*((unsigned char *)v4 + 55))
    {
      goto LABEL_77;
    }
  }
  else if ((*((_WORD *)v4 + 28) & 0x800) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_sysMode != *((_DWORD *)v4 + 12)) {
      goto LABEL_77;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_lqmState != *((_DWORD *)v4 + 4)) {
      goto LABEL_77;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_servCellState != *((_DWORD *)v4 + 10)) {
      goto LABEL_77;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_rrcState != *((_DWORD *)v4 + 9)) {
      goto LABEL_77;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 28) & 0x400) == 0) {
      goto LABEL_77;
    }
    if (self->_isDcActive)
    {
      if (!*((unsigned char *)v4 + 54)) {
        goto LABEL_77;
      }
    }
    else if (*((unsigned char *)v4 + 54))
    {
      goto LABEL_77;
    }
  }
  else if ((*((_WORD *)v4 + 28) & 0x400) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_numSubs != *((_DWORD *)v4 + 5)) {
      goto LABEL_77;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_77;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 3))
  {
    if (-[NSData isEqual:](plmn, "isEqual:"))
    {
      __int16 has = (__int16)self->_has;
      goto LABEL_67;
    }
LABEL_77:
    BOOL v9 = 0;
    goto LABEL_78;
  }
LABEL_67:
  __int16 v8 = *((_WORD *)v4 + 28);
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_psPref != *((_DWORD *)v4 + 8)) {
      goto LABEL_77;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_subsId != *((_DWORD *)v4 + 11)) {
      goto LABEL_77;
    }
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = (v8 & 0x40) == 0;
  }
LABEL_78:

  return v9;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v18 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_3:
      uint64_t v17 = 2654435761 * self->_dataStallOccured;
      if ((*(_WORD *)&self->_has & 0x200) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    unint64_t v18 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v17 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_4:
    uint64_t v16 = 2654435761 * self->_dnsFailureOccured;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v16 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_5:
    uint64_t v4 = 2654435761 * self->_mediaPreWarningHint;
    if ((has & 0x80) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v4 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_6:
    uint64_t v5 = 2654435761 * self->_sysMode;
    if ((has & 2) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v5 = 0;
  if ((has & 2) != 0)
  {
LABEL_7:
    uint64_t v6 = 2654435761 * self->_lqmState;
    if ((has & 0x20) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v6 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_8:
    uint64_t v7 = 2654435761 * self->_servCellState;
    if ((has & 0x10) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v7 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_9:
    uint64_t v8 = 2654435761 * self->_rrcState;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_10;
    }
LABEL_20:
    uint64_t v9 = 0;
    if ((has & 4) != 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_19:
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v9 = 2654435761 * self->_isDcActive;
  if ((has & 4) != 0)
  {
LABEL_11:
    uint64_t v10 = 2654435761 * self->_numSubs;
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v10 = 0;
LABEL_22:
  unint64_t v11 = (unint64_t)[(NSData *)self->_plmn hash];
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 8) != 0)
  {
    uint64_t v13 = 2654435761 * self->_psPref;
    if ((v12 & 0x40) != 0) {
      goto LABEL_24;
    }
LABEL_26:
    uint64_t v14 = 0;
    return v17 ^ v18 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v11;
  }
  uint64_t v13 = 0;
  if ((v12 & 0x40) == 0) {
    goto LABEL_26;
  }
LABEL_24:
  uint64_t v14 = 2654435761 * self->_subsId;
  return v17 ^ v18 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 28);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 28);
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((*((_WORD *)v4 + 28) & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_dataStallOccured = *((unsigned char *)v4 + 52);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x200) == 0)
  {
LABEL_4:
    if ((v5 & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_dnsFailureOccured = *((unsigned char *)v4 + 53);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x800) == 0)
  {
LABEL_5:
    if ((v5 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_mediaPreWarningHint = *((unsigned char *)v4 + 55);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_sysMode = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 28);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_lqmState = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_servCellState = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x10) == 0)
  {
LABEL_9:
    if ((v5 & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_rrcState = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x400) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_29:
  self->_isDcActive = *((unsigned char *)v4 + 54);
  *(_WORD *)&self->_has |= 0x400u;
  if ((*((_WORD *)v4 + 28) & 4) != 0)
  {
LABEL_11:
    self->_numSubs = *((_DWORD *)v4 + 5);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_12:
  if (*((void *)v4 + 3))
  {
    id v7 = v4;
    -[CellularLqmDataStall setPlmn:](self, "setPlmn:");
    id v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 28);
  if ((v6 & 8) != 0)
  {
    self->_psPref = *((_DWORD *)v4 + 8);
    *(_WORD *)&self->_has |= 8u;
    __int16 v6 = *((_WORD *)v4 + 28);
  }
  if ((v6 & 0x40) != 0)
  {
    self->_subsId = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 0x40u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)dataStallOccured
{
  return self->_dataStallOccured;
}

- (BOOL)dnsFailureOccured
{
  return self->_dnsFailureOccured;
}

- (BOOL)mediaPreWarningHint
{
  return self->_mediaPreWarningHint;
}

- (unsigned)sysMode
{
  return self->_sysMode;
}

- (unsigned)lqmState
{
  return self->_lqmState;
}

- (unsigned)servCellState
{
  return self->_servCellState;
}

- (unsigned)rrcState
{
  return self->_rrcState;
}

- (BOOL)isDcActive
{
  return self->_isDcActive;
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

- (unsigned)psPref
{
  return self->_psPref;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
}

@end