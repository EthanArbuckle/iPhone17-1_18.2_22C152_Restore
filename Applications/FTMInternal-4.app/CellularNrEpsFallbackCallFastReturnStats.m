@interface CellularNrEpsFallbackCallFastReturnStats
- (BOOL)hasFastReturnResult;
- (BOOL)hasFastReturnState;
- (BOOL)hasFirstCampedSys;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasReturnDelay;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)plmn;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)firstCampedSysAsString:(int)a3;
- (int)StringAsFirstCampedSys:(id)a3;
- (int)firstCampedSys;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)fastReturnResult;
- (unsigned)fastReturnState;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)returnDelay;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFastReturnResult:(unsigned int)a3;
- (void)setFastReturnState:(unsigned int)a3;
- (void)setFirstCampedSys:(int)a3;
- (void)setHasFastReturnResult:(BOOL)a3;
- (void)setHasFastReturnState:(BOOL)a3;
- (void)setHasFirstCampedSys:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasReturnDelay:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setReturnDelay:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularNrEpsFallbackCallFastReturnStats

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

- (void)setFastReturnState:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_fastReturnState = a3;
}

- (void)setHasFastReturnState:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFastReturnState
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setFastReturnResult:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_fastReturnResult = a3;
}

- (void)setHasFastReturnResult:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFastReturnResult
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setReturnDelay:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_returnDelay = a3;
}

- (void)setHasReturnDelay:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasReturnDelay
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (int)firstCampedSys
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_firstCampedSys;
  }
  else {
    return 0;
  }
}

- (void)setFirstCampedSys:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_firstCampedSys = a3;
}

- (void)setHasFirstCampedSys:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFirstCampedSys
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)firstCampedSysAsString:(int)a3
{
  if a3 < 0x10 && ((0x9FFFu >> a3))
  {
    char v3 = *(&off_100288440 + a3);
  }
  else
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }

  return v3;
}

- (int)StringAsFirstCampedSys:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SYS_MODE_NO_SRV"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_LTE_V2"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_CDMA"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_GSM"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_HDR"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_WCDMA"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_EHRPD"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_GW"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_WLAN"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_LTE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_GWL"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_UMTS"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_NR5G"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_CDMA_HDR"])
  {
    int v4 = 15;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNumSubs
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPsPref
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasSubsId
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularNrEpsFallbackCallFastReturnStats;
  char v3 = [(CellularNrEpsFallbackCallFastReturnStats *)&v7 description];
  int v4 = [(CellularNrEpsFallbackCallFastReturnStats *)self dictionaryRepresentation];
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
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v10 = +[NSNumber numberWithUnsignedInt:self->_fastReturnState];
  [v3 setObject:v10 forKey:@"fast_return_state"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  v11 = +[NSNumber numberWithUnsignedInt:self->_fastReturnResult];
  [v3 setObject:v11 forKey:@"fast_return_result"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  v12 = +[NSNumber numberWithUnsignedInt:self->_returnDelay];
  [v3 setObject:v12 forKey:@"return_delay"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_20:
  uint64_t firstCampedSys = self->_firstCampedSys;
  if firstCampedSys < 0x10 && ((0x9FFFu >> firstCampedSys))
  {
    v14 = *(&off_100288440 + firstCampedSys);
  }
  else
  {
    v14 = +[NSString stringWithFormat:@"(unknown: %i)", self->_firstCampedSys];
  }
  [v3 setObject:v14 forKey:@"first_camped_sys"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_25:
  v15 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
  [v3 setObject:v15 forKey:@"num_subs"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    v5 = +[NSNumber numberWithUnsignedInt:self->_psPref];
    [v3 setObject:v5 forKey:@"ps_pref"];
  }
LABEL_9:
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v7 forKey:@"subs_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10011EF20((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_8:
  }
    PBDataWriterWriteUint32Field();
LABEL_9:
  if (self->_plmn) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
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
    *((unsigned char *)v4 + 52) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 5) = self->_fastReturnState;
  *((unsigned char *)v4 + 52) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v4 + 4) = self->_fastReturnResult;
  *((unsigned char *)v4 + 52) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 11) = self->_returnDelay;
  *((unsigned char *)v4 + 52) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 6) = self->_firstCampedSys;
  *((unsigned char *)v4 + 52) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_21:
  *((_DWORD *)v4 + 7) = self->_numSubs;
  *((unsigned char *)v4 + 52) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 10) = self->_psPref;
    *((unsigned char *)v4 + 52) |= 0x20u;
  }
LABEL_9:
  if (self->_plmn)
  {
    v6 = v4;
    [v4 setPlmn];
    int v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_subsId;
    *((unsigned char *)v4 + 52) |= 0x80u;
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
    *((unsigned char *)v5 + 52) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 5) = self->_fastReturnState;
  *((unsigned char *)v5 + 52) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)v5 + 4) = self->_fastReturnResult;
  *((unsigned char *)v5 + 52) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)v5 + 11) = self->_returnDelay;
  *((unsigned char *)v5 + 52) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v5 + 6) = self->_firstCampedSys;
  *((unsigned char *)v5 + 52) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  *((_DWORD *)v5 + 7) = self->_numSubs;
  *((unsigned char *)v5 + 52) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    *((_DWORD *)v5 + 10) = self->_psPref;
    *((unsigned char *)v5 + 52) |= 0x20u;
  }
LABEL_9:
  id v8 = [(NSData *)self->_plmn copyWithZone:a3];
  v9 = (void *)v6[4];
  v6[4] = v8;

  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    *((_DWORD *)v6 + 12) = self->_subsId;
    *((unsigned char *)v6 + 52) |= 0x80u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_45;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((v4[52] & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_45;
    }
  }
  else if (v4[52])
  {
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[52] & 4) == 0 || self->_fastReturnState != *((_DWORD *)v4 + 5)) {
      goto LABEL_45;
    }
  }
  else if ((v4[52] & 4) != 0)
  {
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[52] & 2) == 0 || self->_fastReturnResult != *((_DWORD *)v4 + 4)) {
      goto LABEL_45;
    }
  }
  else if ((v4[52] & 2) != 0)
  {
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((v4[52] & 0x40) == 0 || self->_returnDelay != *((_DWORD *)v4 + 11)) {
      goto LABEL_45;
    }
  }
  else if ((v4[52] & 0x40) != 0)
  {
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((v4[52] & 8) == 0 || self->_firstCampedSys != *((_DWORD *)v4 + 6)) {
      goto LABEL_45;
    }
  }
  else if ((v4[52] & 8) != 0)
  {
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((v4[52] & 0x10) == 0 || self->_numSubs != *((_DWORD *)v4 + 7)) {
      goto LABEL_45;
    }
  }
  else if ((v4[52] & 0x10) != 0)
  {
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((v4[52] & 0x20) == 0 || self->_psPref != *((_DWORD *)v4 + 10)) {
      goto LABEL_45;
    }
  }
  else if ((v4[52] & 0x20) != 0)
  {
    goto LABEL_45;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](plmn, "isEqual:"))
    {
LABEL_45:
      BOOL v8 = 0;
      goto LABEL_46;
    }
    char has = (char)self->_has;
  }
  int v7 = v4[52];
  if (has < 0)
  {
    if ((v7 & 0x80000000) == 0 || self->_subsId != *((_DWORD *)v4 + 12)) {
      goto LABEL_45;
    }
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = v7 >= 0;
  }
LABEL_46:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_fastReturnState;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_fastReturnResult;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_returnDelay;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_firstCampedSys;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v8 = 2654435761 * self->_numSubs;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_psPref;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v9 = 0;
LABEL_16:
  unint64_t v10 = (unint64_t)[(NSData *)self->_plmn hash];
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    uint64_t v11 = 2654435761 * self->_subsId;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (char *)a3;
  char v5 = v4[52];
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = v4[52];
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((v4[52] & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_fastReturnState = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = v4[52];
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_fastReturnResult = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = v4[52];
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_returnDelay = *((_DWORD *)v4 + 11);
  *(unsigned char *)&self->_has |= 0x40u;
  char v5 = v4[52];
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_uint64_t firstCampedSys = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = v4[52];
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_21:
  self->_numSubs = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((v4[52] & 0x20) != 0)
  {
LABEL_8:
    self->_psPref = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_9:
  if (*((void *)v4 + 4))
  {
    uint64_t v6 = v4;
    -[CellularNrEpsFallbackCallFastReturnStats setPlmn:](self, "setPlmn:");
    uint64_t v4 = v6;
  }
  if (v4[52] < 0)
  {
    self->_subsId = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 0x80u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)fastReturnState
{
  return self->_fastReturnState;
}

- (unsigned)fastReturnResult
{
  return self->_fastReturnResult;
}

- (unsigned)returnDelay
{
  return self->_returnDelay;
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