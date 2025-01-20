@interface AppTelemetryQBSInvestigation
- (BOOL)hasClientTruthDirFaultCount;
- (BOOL)hasServerTruthDirCount;
- (BOOL)hasServerTruthDirFaultCount;
- (BOOL)hasServerTruthTotalItemsCount;
- (BOOL)hasTimeSinceLogin;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)clientTruthDirFaultCount;
- (unint64_t)hash;
- (unint64_t)serverTruthDirCount;
- (unint64_t)serverTruthDirFaultCount;
- (unint64_t)serverTruthTotalItemsCount;
- (unint64_t)timeSinceLogin;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientTruthDirFaultCount:(unint64_t)a3;
- (void)setHasClientTruthDirFaultCount:(BOOL)a3;
- (void)setHasServerTruthDirCount:(BOOL)a3;
- (void)setHasServerTruthDirFaultCount:(BOOL)a3;
- (void)setHasServerTruthTotalItemsCount:(BOOL)a3;
- (void)setHasTimeSinceLogin:(BOOL)a3;
- (void)setServerTruthDirCount:(unint64_t)a3;
- (void)setServerTruthDirFaultCount:(unint64_t)a3;
- (void)setServerTruthTotalItemsCount:(unint64_t)a3;
- (void)setTimeSinceLogin:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AppTelemetryQBSInvestigation

- (void)setServerTruthDirCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_serverTruthDirCount = a3;
}

- (void)setHasServerTruthDirCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasServerTruthDirCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setServerTruthDirFaultCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_serverTruthDirFaultCount = a3;
}

- (void)setHasServerTruthDirFaultCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasServerTruthDirFaultCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setClientTruthDirFaultCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_clientTruthDirFaultCount = a3;
}

- (void)setHasClientTruthDirFaultCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClientTruthDirFaultCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTimeSinceLogin:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_timeSinceLogin = a3;
}

- (void)setHasTimeSinceLogin:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTimeSinceLogin
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setServerTruthTotalItemsCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_serverTruthTotalItemsCount = a3;
}

- (void)setHasServerTruthTotalItemsCount:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasServerTruthTotalItemsCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AppTelemetryQBSInvestigation;
  v4 = [(AppTelemetryQBSInvestigation *)&v8 description];
  v5 = [(AppTelemetryQBSInvestigation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_serverTruthDirCount];
    [v3 setObject:v7 forKey:@"serverTruthDirCount"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithUnsignedLongLong:self->_serverTruthDirFaultCount];
  [v3 setObject:v8 forKey:@"serverTruthDirFaultCount"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v9 = [NSNumber numberWithUnsignedLongLong:self->_clientTruthDirFaultCount];
  [v3 setObject:v9 forKey:@"clientTruthDirFaultCount"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v10 = [NSNumber numberWithUnsignedLongLong:self->_timeSinceLogin];
  [v3 setObject:v10 forKey:@"timeSinceLogin"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_6:
    v5 = [NSNumber numberWithUnsignedLongLong:self->_serverTruthTotalItemsCount];
    [v3 setObject:v5 forKey:@"serverTruthTotalItemsCount"];
  }
LABEL_7:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AppTelemetryQBSInvestigationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint64Field();
LABEL_7:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_serverTruthDirCount;
    *((unsigned char *)v4 + 48) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_serverTruthDirFaultCount;
  *((unsigned char *)v4 + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v4[1] = self->_clientTruthDirFaultCount;
  *((unsigned char *)v4 + 48) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v4[5] = self->_timeSinceLogin;
  *((unsigned char *)v4 + 48) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_6:
    v4[4] = self->_serverTruthTotalItemsCount;
    *((unsigned char *)v4 + 48) |= 8u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = self->_serverTruthDirCount;
    *((unsigned char *)result + 48) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 3) = self->_serverTruthDirFaultCount;
  *((unsigned char *)result + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((void *)result + 1) = self->_clientTruthDirFaultCount;
  *((unsigned char *)result + 48) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((void *)result + 5) = self->_timeSinceLogin;
  *((unsigned char *)result + 48) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_6:
  *((void *)result + 4) = self->_serverTruthTotalItemsCount;
  *((unsigned char *)result + 48) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_serverTruthDirCount != *((void *)v4 + 2)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
LABEL_26:
    BOOL v5 = 0;
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_serverTruthDirFaultCount != *((void *)v4 + 3)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_26;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_clientTruthDirFaultCount != *((void *)v4 + 1)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 0x10) == 0 || self->_timeSinceLogin != *((void *)v4 + 5)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 0x10) != 0)
  {
    goto LABEL_26;
  }
  BOOL v5 = (*((unsigned char *)v4 + 48) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_serverTruthTotalItemsCount != *((void *)v4 + 4)) {
      goto LABEL_26;
    }
    BOOL v5 = 1;
  }
LABEL_27:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v2 = 2654435761u * self->_serverTruthDirCount;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      unint64_t v3 = 2654435761u * self->_serverTruthDirFaultCount;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v3 = 0;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    unint64_t v4 = 2654435761u * self->_clientTruthDirFaultCount;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    unint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    unint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  unint64_t v5 = 2654435761u * self->_timeSinceLogin;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  unint64_t v6 = 2654435761u * self->_serverTruthTotalItemsCount;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 2) != 0)
  {
    self->_serverTruthDirCount = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 48);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_serverTruthDirFaultCount = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_clientTruthDirFaultCount = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_timeSinceLogin = *((void *)v4 + 5);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
LABEL_6:
    self->_serverTruthTotalItemsCount = *((void *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_7:
}

- (unint64_t)serverTruthDirCount
{
  return self->_serverTruthDirCount;
}

- (unint64_t)serverTruthDirFaultCount
{
  return self->_serverTruthDirFaultCount;
}

- (unint64_t)clientTruthDirFaultCount
{
  return self->_clientTruthDirFaultCount;
}

- (unint64_t)timeSinceLogin
{
  return self->_timeSinceLogin;
}

- (unint64_t)serverTruthTotalItemsCount
{
  return self->_serverTruthTotalItemsCount;
}

@end