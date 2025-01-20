@interface CellularSysOprtMode
- (BOOL)hasDurationMs;
- (BOOL)hasMode;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasSimHplmn;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)plmn;
- (NSData)simHplmn;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)modeAsString:(int)a3;
- (int)StringAsMode:(id)a3;
- (int)mode;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)durationMs;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDurationMs:(unsigned int)a3;
- (void)setHasDurationMs:(BOOL)a3;
- (void)setHasMode:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setMode:(int)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setSimHplmn:(id)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularSysOprtMode

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

- (int)mode
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_mode;
  }
  else {
    return -1;
  }
}

- (void)setMode:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_mode = a3;
}

- (void)setHasMode:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMode
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)modeAsString:(int)a3
{
  if ((a3 + 1) >= 0xD)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_1002872F0 + a3 + 1);
  }

  return v3;
}

- (int)StringAsMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SYS_OPRT_MODE_NONE"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"SYS_OPRT_MODE_PWROFF"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SYS_OPRT_MODE_FTM"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SYS_OPRT_MODE_OFFLINE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SYS_OPRT_MODE_OFFLINE_AMPS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SYS_OPRT_MODE_OFFLINE_CDMA"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SYS_OPRT_MODE_ONLINE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SYS_OPRT_MODE_LPM"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SYS_OPRT_MODE_RESET"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SYS_OPRT_MODE_NET_TEST_GW"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SYS_OPRT_MODE_OFFLINE_IF_NOT_FTM"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SYS_OPRT_MODE_PSEUDO_ONLINE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SYS_OPRT_MODE_RESET_MODEM"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (void)setDurationMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_durationMs = a3;
}

- (void)setHasDurationMs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDurationMs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasSimHplmn
{
  return self->_simHplmn != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSubsId
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumSubs
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
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

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularSysOprtMode;
  char v3 = [(CellularSysOprtMode *)&v7 description];
  int v4 = [(CellularSysOprtMode *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v11 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v11 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  int v12 = self->_mode + 1;
  if (v12 >= 0xD)
  {
    v13 = +[NSString stringWithFormat:@"(unknown: %i)", self->_mode];
  }
  else
  {
    v13 = *(&off_1002872F0 + v12);
  }
  [v3 setObject:v13 forKey:@"mode"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = +[NSNumber numberWithUnsignedInt:self->_durationMs];
    [v3 setObject:v5 forKey:@"duration_ms"];
  }
LABEL_5:
  simHplmn = self->_simHplmn;
  if (simHplmn) {
    [v3 setObject:simHplmn forKey:@"sim_hplmn"];
  }
  char v7 = (char)self->_has;
  if ((v7 & 0x20) != 0)
  {
    v14 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v14 forKey:@"subs_id"];

    char v7 = (char)self->_has;
    if ((v7 & 8) == 0)
    {
LABEL_9:
      if ((v7 & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  v15 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
  [v3 setObject:v15 forKey:@"num_subs"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    v8 = +[NSNumber numberWithUnsignedInt:self->_psPref];
    [v3 setObject:v8 forKey:@"ps_pref"];
  }
LABEL_11:
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000516C0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v7 = v4;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v7;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v7;
  }
LABEL_5:
  if (self->_simHplmn)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v7;
    char v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    PBDataWriterWriteUint32Field();
    id v4 = v7;
  }
LABEL_11:
  if (self->_plmn)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 60) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 5) = self->_mode;
  *((unsigned char *)v4 + 60) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)v4 + 4) = self->_durationMs;
    *((unsigned char *)v4 + 60) |= 2u;
  }
LABEL_5:
  id v7 = v4;
  if (self->_simHplmn)
  {
    [v4 setSimHplmn];
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_subsId;
    *((unsigned char *)v4 + 60) |= 0x20u;
    char v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 6) = self->_numSubs;
  *((unsigned char *)v4 + 60) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 10) = self->_psPref;
    *((unsigned char *)v4 + 60) |= 0x10u;
  }
LABEL_11:
  if (self->_plmn)
  {
    [v7 setPlmn:];
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    v5[1] = self->_timestamp;
    *((unsigned char *)v5 + 60) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 5) = self->_mode;
  *((unsigned char *)v5 + 60) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 4) = self->_durationMs;
    *((unsigned char *)v5 + 60) |= 2u;
  }
LABEL_5:
  id v8 = [(NSData *)self->_simHplmn copyWithZone:a3];
  v9 = (void *)v6[6];
  v6[6] = v8;

  char v10 = (char)self->_has;
  if ((v10 & 0x20) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_7;
    }
LABEL_14:
    *((_DWORD *)v6 + 6) = self->_numSubs;
    *((unsigned char *)v6 + 60) |= 8u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  *((_DWORD *)v6 + 14) = self->_subsId;
  *((unsigned char *)v6 + 60) |= 0x20u;
  char v10 = (char)self->_has;
  if ((v10 & 8) != 0) {
    goto LABEL_14;
  }
LABEL_7:
  if ((v10 & 0x10) != 0)
  {
LABEL_8:
    *((_DWORD *)v6 + 10) = self->_psPref;
    *((unsigned char *)v6 + 60) |= 0x10u;
  }
LABEL_9:
  id v11 = [(NSData *)self->_plmn copyWithZone:a3];
  int v12 = (void *)v6[4];
  v6[4] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_37;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0 || self->_mode != *((_DWORD *)v4 + 5)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_durationMs != *((_DWORD *)v4 + 4)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_37;
  }
  simHplmn = self->_simHplmn;
  if ((unint64_t)simHplmn | *((void *)v4 + 6))
  {
    if (!-[NSData isEqual:](simHplmn, "isEqual:"))
    {
LABEL_37:
      unsigned __int8 v8 = 0;
      goto LABEL_38;
    }
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x20) == 0 || self->_subsId != *((_DWORD *)v4 + 14)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 0x20) != 0)
  {
    goto LABEL_37;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 8) == 0 || self->_numSubs != *((_DWORD *)v4 + 6)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
    goto LABEL_37;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x10) == 0 || self->_psPref != *((_DWORD *)v4 + 10)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_37;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 4)) {
    unsigned __int8 v8 = -[NSData isEqual:](plmn, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_38:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  unint64_t v3 = 2654435761u * self->_timestamp;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_mode;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_durationMs;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v5 = 0;
LABEL_8:
  unint64_t v6 = (unint64_t)[(NSData *)self->_simHplmn hash];
  if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v6 ^ (unint64_t)[(NSData *)self->_plmn hash];
  }
  uint64_t v7 = 2654435761 * self->_subsId;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v8 = 2654435761 * self->_numSubs;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v9 = 2654435761 * self->_psPref;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v6 ^ (unint64_t)[(NSData *)self->_plmn hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 60);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 60);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_mode = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
LABEL_4:
    self->_durationMs = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
  id v7 = v4;
  if (*((void *)v4 + 6))
  {
    -[CellularSysOprtMode setSimHplmn:](self, "setSimHplmn:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 60);
  if ((v6 & 0x20) != 0)
  {
    self->_subsId = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 0x20u;
    char v6 = *((unsigned char *)v4 + 60);
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_numSubs = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 60) & 0x10) != 0)
  {
LABEL_10:
    self->_psPref = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_11:
  if (*((void *)v4 + 4))
  {
    -[CellularSysOprtMode setPlmn:](self, "setPlmn:");
    id v4 = v7;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)durationMs
{
  return self->_durationMs;
}

- (NSData)simHplmn
{
  return self->_simHplmn;
}

- (void)setSimHplmn:(id)a3
{
}

- (unsigned)subsId
{
  return self->_subsId;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simHplmn, 0);

  objc_storeStrong((id *)&self->_plmn, 0);
}

@end