@interface RachConnInfo
- (BOOL)hasAvgInterRrcConnDuration;
- (BOOL)hasFailRachAttempts;
- (BOOL)hasTotalMoRrcConn;
- (BOOL)hasTotalMtRrcConn;
- (BOOL)hasTotalRachAttempts;
- (BOOL)hasTotalSigRrcConn;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)avgInterRrcConnDuration;
- (unsigned)failRachAttempts;
- (unsigned)totalMoRrcConn;
- (unsigned)totalMtRrcConn;
- (unsigned)totalRachAttempts;
- (unsigned)totalSigRrcConn;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAvgInterRrcConnDuration:(unsigned int)a3;
- (void)setFailRachAttempts:(unsigned int)a3;
- (void)setHasAvgInterRrcConnDuration:(BOOL)a3;
- (void)setHasFailRachAttempts:(BOOL)a3;
- (void)setHasTotalMoRrcConn:(BOOL)a3;
- (void)setHasTotalMtRrcConn:(BOOL)a3;
- (void)setHasTotalRachAttempts:(BOOL)a3;
- (void)setHasTotalSigRrcConn:(BOOL)a3;
- (void)setTotalMoRrcConn:(unsigned int)a3;
- (void)setTotalMtRrcConn:(unsigned int)a3;
- (void)setTotalRachAttempts:(unsigned int)a3;
- (void)setTotalSigRrcConn:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation RachConnInfo

- (void)setFailRachAttempts:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_failRachAttempts = a3;
}

- (void)setHasFailRachAttempts:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFailRachAttempts
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTotalRachAttempts:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_totalRachAttempts = a3;
}

- (void)setHasTotalRachAttempts:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTotalRachAttempts
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTotalMoRrcConn:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_totalMoRrcConn = a3;
}

- (void)setHasTotalMoRrcConn:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTotalMoRrcConn
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTotalMtRrcConn:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_totalMtRrcConn = a3;
}

- (void)setHasTotalMtRrcConn:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTotalMtRrcConn
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTotalSigRrcConn:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_totalSigRrcConn = a3;
}

- (void)setHasTotalSigRrcConn:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTotalSigRrcConn
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setAvgInterRrcConnDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_avgInterRrcConnDuration = a3;
}

- (void)setHasAvgInterRrcConnDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAvgInterRrcConnDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)RachConnInfo;
  char v3 = [(RachConnInfo *)&v7 description];
  v4 = [(RachConnInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_failRachAttempts];
    [v3 setObject:v7 forKey:@"fail_rach_attempts"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v8 = +[NSNumber numberWithUnsignedInt:self->_totalRachAttempts];
  [v3 setObject:v8 forKey:@"total_rach_attempts"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v9 = +[NSNumber numberWithUnsignedInt:self->_totalMoRrcConn];
  [v3 setObject:v9 forKey:@"total_mo_rrc_conn"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v10 = +[NSNumber numberWithUnsignedInt:self->_totalMtRrcConn];
  [v3 setObject:v10 forKey:@"total_mt_rrc_conn"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v11 = +[NSNumber numberWithUnsignedInt:self->_totalSigRrcConn];
  [v3 setObject:v11 forKey:@"total_sig_rrc_conn"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    v5 = +[NSNumber numberWithUnsignedInt:self->_avgInterRrcConnDuration];
    [v3 setObject:v5 forKey:@"avg_inter_rrc_conn_duration"];
  }
LABEL_8:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100008B7C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  if (*(unsigned char *)&self->_has) {
LABEL_7:
  }
    PBDataWriterWriteUint32Field();
LABEL_8:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_failRachAttempts;
    *((unsigned char *)v4 + 32) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = self->_totalRachAttempts;
  *((unsigned char *)v4 + 32) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v4[4] = self->_totalMoRrcConn;
  *((unsigned char *)v4 + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v4[5] = self->_totalMtRrcConn;
  *((unsigned char *)v4 + 32) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v4[7] = self->_totalSigRrcConn;
  *((unsigned char *)v4 + 32) |= 0x20u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    v4[2] = self->_avgInterRrcConnDuration;
    *((unsigned char *)v4 + 32) |= 1u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_failRachAttempts;
    *((unsigned char *)result + 32) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_totalRachAttempts;
  *((unsigned char *)result + 32) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 4) = self->_totalMoRrcConn;
  *((unsigned char *)result + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 5) = self->_totalMtRrcConn;
  *((unsigned char *)result + 32) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 7) = self->_totalSigRrcConn;
  *((unsigned char *)result + 32) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_7:
  *((_DWORD *)result + 2) = self->_avgInterRrcConnDuration;
  *((unsigned char *)result + 32) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_failRachAttempts != *((_DWORD *)v4 + 3)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_31:
    BOOL v5 = 0;
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x10) == 0 || self->_totalRachAttempts != *((_DWORD *)v4 + 6)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_totalMoRrcConn != *((_DWORD *)v4 + 4)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0 || self->_totalMtRrcConn != *((_DWORD *)v4 + 5)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x20) == 0 || self->_totalSigRrcConn != *((_DWORD *)v4 + 7)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x20) != 0)
  {
    goto LABEL_31;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_avgInterRrcConnDuration != *((_DWORD *)v4 + 2)) {
      goto LABEL_31;
    }
    BOOL v5 = 1;
  }
LABEL_32:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_failRachAttempts;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_totalRachAttempts;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_totalMoRrcConn;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_totalMtRrcConn;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_totalSigRrcConn;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_avgInterRrcConnDuration;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_failRachAttempts = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_totalRachAttempts = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_totalMoRrcConn = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_totalMtRrcConn = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_totalSigRrcConn = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_has |= 0x20u;
  if (*((unsigned char *)v4 + 32))
  {
LABEL_7:
    self->_avgInterRrcConnDuration = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_8:
}

- (unsigned)failRachAttempts
{
  return self->_failRachAttempts;
}

- (unsigned)totalRachAttempts
{
  return self->_totalRachAttempts;
}

- (unsigned)totalMoRrcConn
{
  return self->_totalMoRrcConn;
}

- (unsigned)totalMtRrcConn
{
  return self->_totalMtRrcConn;
}

- (unsigned)totalSigRrcConn
{
  return self->_totalSigRrcConn;
}

- (unsigned)avgInterRrcConnDuration
{
  return self->_avgInterRrcConnDuration;
}

@end