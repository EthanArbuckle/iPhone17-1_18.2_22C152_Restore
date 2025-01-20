@interface CellularNrRrcResume
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasResumeRequestReason;
- (BOOL)hasResumeSuccess;
- (BOOL)hasResumeSuccessDuration;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)resumeSuccess;
- (NSData)plmn;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)resumeRequestReason;
- (unsigned)resumeSuccessDuration;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasResumeRequestReason:(BOOL)a3;
- (void)setHasResumeSuccess:(BOOL)a3;
- (void)setHasResumeSuccessDuration:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setResumeRequestReason:(unsigned int)a3;
- (void)setResumeSuccess:(BOOL)a3;
- (void)setResumeSuccessDuration:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularNrRrcResume

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

- (void)setResumeSuccessDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_resumeSuccessDuration = a3;
}

- (void)setHasResumeSuccessDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasResumeSuccessDuration
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setResumeRequestReason:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_resumeRequestReason = a3;
}

- (void)setHasResumeRequestReason:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasResumeRequestReason
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setResumeSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_resumeSuccess = a3;
}

- (void)setHasResumeSuccess:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasResumeSuccess
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
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
  *(unsigned char *)&self->_has |= 2u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumSubs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPsPref
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularNrRrcResume;
  char v3 = [(CellularNrRrcResume *)&v7 description];
  v4 = [(CellularNrRrcResume *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v8 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v8 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v9 = +[NSNumber numberWithUnsignedInt:self->_resumeSuccessDuration];
  [v3 setObject:v9 forKey:@"resume_success_duration"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  v10 = +[NSNumber numberWithUnsignedInt:self->_resumeRequestReason];
  [v3 setObject:v10 forKey:@"resume_request_reason"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  v11 = +[NSNumber numberWithBool:self->_resumeSuccess];
  [v3 setObject:v11 forKey:@"resume_success"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v12 = +[NSNumber numberWithUnsignedInt:self->_subsId];
  [v3 setObject:v12 forKey:@"subs_id"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_19:
  v13 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
  [v3 setObject:v13 forKey:@"num_subs"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
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

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100145144((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_7:
  }
    PBDataWriterWriteUint32Field();
LABEL_8:
  if (self->_plmn) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 52) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 10) = self->_resumeSuccessDuration;
  *((unsigned char *)v4 + 52) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v4 + 9) = self->_resumeRequestReason;
  *((unsigned char *)v4 + 52) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((unsigned char *)v4 + 48) = self->_resumeSuccess;
  *((unsigned char *)v4 + 52) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_19:
  *((_DWORD *)v4 + 4) = self->_numSubs;
  *((unsigned char *)v4 + 52) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 8) = self->_psPref;
    *((unsigned char *)v4 + 52) |= 4u;
  }
LABEL_8:
  if (self->_plmn)
  {
    v6 = v4;
    [v4 setPlmn:];
    v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 11) = self->_subsId;
    *((unsigned char *)v4 + 52) |= 0x20u;
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
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 10) = self->_resumeSuccessDuration;
  *((unsigned char *)v5 + 52) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)v5 + 9) = self->_resumeRequestReason;
  *((unsigned char *)v5 + 52) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((unsigned char *)v5 + 48) = self->_resumeSuccess;
  *((unsigned char *)v5 + 52) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  *((_DWORD *)v5 + 4) = self->_numSubs;
  *((unsigned char *)v5 + 52) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_7:
    *((_DWORD *)v5 + 8) = self->_psPref;
    *((unsigned char *)v5 + 52) |= 4u;
  }
LABEL_8:
  id v8 = [(NSData *)self->_plmn copyWithZone:a3];
  v9 = (void *)v6[3];
  v6[3] = v8;

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)v6 + 11) = self->_subsId;
    *((unsigned char *)v6 + 52) |= 0x20u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_42;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 0x10) == 0 || self->_resumeSuccessDuration != *((_DWORD *)v4 + 10)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 0x10) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 8) == 0 || self->_resumeRequestReason != *((_DWORD *)v4 + 9)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 8) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 0x40) == 0) {
      goto LABEL_42;
    }
    if (self->_resumeSuccess)
    {
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_42;
      }
    }
    else if (*((unsigned char *)v4 + 48))
    {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 0x40) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_numSubs != *((_DWORD *)v4 + 4)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0 || self->_psPref != *((_DWORD *)v4 + 8)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    goto LABEL_42;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 3))
  {
    if (-[NSData isEqual:](plmn, "isEqual:"))
    {
      char has = (char)self->_has;
      goto LABEL_38;
    }
LABEL_42:
    BOOL v7 = 0;
    goto LABEL_43;
  }
LABEL_38:
  BOOL v7 = (*((unsigned char *)v4 + 52) & 0x20) == 0;
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 0x20) == 0 || self->_subsId != *((_DWORD *)v4 + 11)) {
      goto LABEL_42;
    }
    BOOL v7 = 1;
  }
LABEL_43:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_resumeSuccessDuration;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_resumeRequestReason;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_resumeSuccess;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_numSubs;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_psPref;
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v8 = 0;
LABEL_14:
  unint64_t v9 = (unint64_t)[(NSData *)self->_plmn hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
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
  char v5 = *((unsigned char *)v4 + 52);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 52);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_resumeSuccessDuration = *((_DWORD *)v4 + 10);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_resumeRequestReason = *((_DWORD *)v4 + 9);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_resumeSuccess = *((unsigned char *)v4 + 48);
  *(unsigned char *)&self->_has |= 0x40u;
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_19:
  self->_numSubs = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
LABEL_7:
    self->_psPref = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_8:
  if (*((void *)v4 + 3))
  {
    id v6 = v4;
    -[CellularNrRrcResume setPlmn:](self, "setPlmn:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 52) & 0x20) != 0)
  {
    self->_subsId = *((_DWORD *)v4 + 11);
    *(unsigned char *)&self->_has |= 0x20u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)resumeSuccessDuration
{
  return self->_resumeSuccessDuration;
}

- (unsigned)resumeRequestReason
{
  return self->_resumeRequestReason;
}

- (BOOL)resumeSuccess
{
  return self->_resumeSuccess;
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
}

@end