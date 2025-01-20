@interface ATXAnchorModelPBLaunchHistoryMetadata
- (BOOL)hasLaunchesInLast12Hours;
- (BOOL)hasLaunchesInLast14Days;
- (BOOL)hasLaunchesInLast24Hours;
- (BOOL)hasLaunchesInLast28Days;
- (BOOL)hasLaunchesInLast2Hours;
- (BOOL)hasLaunchesInLast48Hours;
- (BOOL)hasLaunchesInLast7Days;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)launchesInLast12Hours;
- (unsigned)launchesInLast14Days;
- (unsigned)launchesInLast24Hours;
- (unsigned)launchesInLast28Days;
- (unsigned)launchesInLast2Hours;
- (unsigned)launchesInLast48Hours;
- (unsigned)launchesInLast7Days;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLaunchesInLast12Hours:(BOOL)a3;
- (void)setHasLaunchesInLast14Days:(BOOL)a3;
- (void)setHasLaunchesInLast24Hours:(BOOL)a3;
- (void)setHasLaunchesInLast28Days:(BOOL)a3;
- (void)setHasLaunchesInLast2Hours:(BOOL)a3;
- (void)setHasLaunchesInLast48Hours:(BOOL)a3;
- (void)setHasLaunchesInLast7Days:(BOOL)a3;
- (void)setLaunchesInLast12Hours:(unsigned int)a3;
- (void)setLaunchesInLast14Days:(unsigned int)a3;
- (void)setLaunchesInLast24Hours:(unsigned int)a3;
- (void)setLaunchesInLast28Days:(unsigned int)a3;
- (void)setLaunchesInLast2Hours:(unsigned int)a3;
- (void)setLaunchesInLast48Hours:(unsigned int)a3;
- (void)setLaunchesInLast7Days:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXAnchorModelPBLaunchHistoryMetadata

- (void)setLaunchesInLast2Hours:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_launchesInLast2Hours = a3;
}

- (void)setHasLaunchesInLast2Hours:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLaunchesInLast2Hours
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setLaunchesInLast7Days:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_launchesInLast7Days = a3;
}

- (void)setHasLaunchesInLast7Days:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasLaunchesInLast7Days
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setLaunchesInLast14Days:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_launchesInLast14Days = a3;
}

- (void)setHasLaunchesInLast14Days:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLaunchesInLast14Days
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLaunchesInLast28Days:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_launchesInLast28Days = a3;
}

- (void)setHasLaunchesInLast28Days:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLaunchesInLast28Days
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setLaunchesInLast12Hours:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_launchesInLast12Hours = a3;
}

- (void)setHasLaunchesInLast12Hours:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLaunchesInLast12Hours
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLaunchesInLast24Hours:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_launchesInLast24Hours = a3;
}

- (void)setHasLaunchesInLast24Hours:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLaunchesInLast24Hours
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLaunchesInLast48Hours:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_launchesInLast48Hours = a3;
}

- (void)setHasLaunchesInLast48Hours:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasLaunchesInLast48Hours
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXAnchorModelPBLaunchHistoryMetadata;
  v4 = [(ATXAnchorModelPBLaunchHistoryMetadata *)&v8 description];
  v5 = [(ATXAnchorModelPBLaunchHistoryMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_launchesInLast2Hours];
    [v3 setObject:v7 forKey:@"launchesInLast2Hours"];

    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithUnsignedInt:self->_launchesInLast7Days];
  [v3 setObject:v8 forKey:@"launchesInLast7Days"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v9 = [NSNumber numberWithUnsignedInt:self->_launchesInLast14Days];
  [v3 setObject:v9 forKey:@"launchesInLast14Days"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v10 = [NSNumber numberWithUnsignedInt:self->_launchesInLast28Days];
  [v3 setObject:v10 forKey:@"launchesInLast28Days"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v11 = [NSNumber numberWithUnsignedInt:self->_launchesInLast12Hours];
  [v3 setObject:v11 forKey:@"launchesInLast12Hours"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v12 = [NSNumber numberWithUnsignedInt:self->_launchesInLast24Hours];
  [v3 setObject:v12 forKey:@"launchesInLast24Hours"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    v5 = [NSNumber numberWithUnsignedInt:self->_launchesInLast48Hours];
    [v3 setObject:v5 forKey:@"launchesInLast48Hours"];
  }
LABEL_9:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXAnchorModelPBLaunchHistoryMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_8:
  }
    PBDataWriterWriteUint32Field();
LABEL_9:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[6] = self->_launchesInLast2Hours;
    *((unsigned char *)v4 + 36) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  v4[8] = self->_launchesInLast7Days;
  *((unsigned char *)v4 + 36) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v4[3] = self->_launchesInLast14Days;
  *((unsigned char *)v4 + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v4[5] = self->_launchesInLast28Days;
  *((unsigned char *)v4 + 36) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[2] = self->_launchesInLast12Hours;
  *((unsigned char *)v4 + 36) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v4[4] = self->_launchesInLast24Hours;
  *((unsigned char *)v4 + 36) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    v4[7] = self->_launchesInLast48Hours;
    *((unsigned char *)v4 + 36) |= 0x20u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)result + 6) = self->_launchesInLast2Hours;
    *((unsigned char *)result + 36) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 8) = self->_launchesInLast7Days;
  *((unsigned char *)result + 36) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 3) = self->_launchesInLast14Days;
  *((unsigned char *)result + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 5) = self->_launchesInLast28Days;
  *((unsigned char *)result + 36) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 2) = self->_launchesInLast12Hours;
  *((unsigned char *)result + 36) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)result + 4) = self->_launchesInLast24Hours;
  *((unsigned char *)result + 36) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    return result;
  }
LABEL_8:
  *((_DWORD *)result + 7) = self->_launchesInLast48Hours;
  *((unsigned char *)result + 36) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x10) == 0 || self->_launchesInLast2Hours != *((_DWORD *)v4 + 6)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x10) != 0)
  {
LABEL_36:
    BOOL v5 = 0;
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x40) == 0 || self->_launchesInLast7Days != *((_DWORD *)v4 + 8)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x40) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_launchesInLast14Days != *((_DWORD *)v4 + 3)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0 || self->_launchesInLast28Days != *((_DWORD *)v4 + 5)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
    goto LABEL_36;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_launchesInLast12Hours != *((_DWORD *)v4 + 2)) {
      goto LABEL_36;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_launchesInLast24Hours != *((_DWORD *)v4 + 4)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_36;
  }
  BOOL v5 = (*((unsigned char *)v4 + 36) & 0x20) == 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x20) == 0 || self->_launchesInLast48Hours != *((_DWORD *)v4 + 7)) {
      goto LABEL_36;
    }
    BOOL v5 = 1;
  }
LABEL_37:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v2 = 2654435761 * self->_launchesInLast2Hours;
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_launchesInLast7Days;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_launchesInLast14Days;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_launchesInLast28Days;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_launchesInLast12Hours;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_launchesInLast24Hours;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_launchesInLast48Hours;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 0x10) != 0)
  {
    self->_launchesInLast2Hours = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_launchesInLast7Days = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 0x40u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_launchesInLast14Days = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_launchesInLast28Days = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_launchesInLast12Hours = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  self->_launchesInLast24Hours = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 36) & 0x20) != 0)
  {
LABEL_8:
    self->_launchesInLast48Hours = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_9:
}

- (unsigned)launchesInLast2Hours
{
  return self->_launchesInLast2Hours;
}

- (unsigned)launchesInLast7Days
{
  return self->_launchesInLast7Days;
}

- (unsigned)launchesInLast14Days
{
  return self->_launchesInLast14Days;
}

- (unsigned)launchesInLast28Days
{
  return self->_launchesInLast28Days;
}

- (unsigned)launchesInLast12Hours
{
  return self->_launchesInLast12Hours;
}

- (unsigned)launchesInLast24Hours
{
  return self->_launchesInLast24Hours;
}

- (unsigned)launchesInLast48Hours
{
  return self->_launchesInLast48Hours;
}

@end