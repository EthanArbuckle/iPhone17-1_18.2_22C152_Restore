@interface BLTPBAddBulletinRequest
- (BLTPBBulletin)bulletin;
- (BOOL)hasBulletin;
- (BOOL)hasDate;
- (BOOL)hasShouldPlayLightsAndSirens;
- (BOOL)hasTrafficRestricted;
- (BOOL)hasUpdateType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldPlayLightsAndSirens;
- (BOOL)trafficRestricted;
- (double)date;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)updateType;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBulletin:(id)a3;
- (void)setDate:(double)a3;
- (void)setHasDate:(BOOL)a3;
- (void)setHasShouldPlayLightsAndSirens:(BOOL)a3;
- (void)setHasTrafficRestricted:(BOOL)a3;
- (void)setHasUpdateType:(BOOL)a3;
- (void)setShouldPlayLightsAndSirens:(BOOL)a3;
- (void)setTrafficRestricted:(BOOL)a3;
- (void)setUpdateType:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBAddBulletinRequest

- (BOOL)hasBulletin
{
  return self->_bulletin != 0;
}

- (void)setShouldPlayLightsAndSirens:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_shouldPlayLightsAndSirens = a3;
}

- (void)setHasShouldPlayLightsAndSirens:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasShouldPlayLightsAndSirens
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_date = a3;
}

- (void)setHasDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUpdateType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_updateType = a3;
}

- (void)setHasUpdateType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUpdateType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTrafficRestricted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_trafficRestricted = a3;
}

- (void)setHasTrafficRestricted:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTrafficRestricted
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBAddBulletinRequest;
  v4 = [(BLTPBAddBulletinRequest *)&v8 description];
  v5 = [(BLTPBAddBulletinRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  bulletin = self->_bulletin;
  if (bulletin)
  {
    v5 = [(BLTPBBulletin *)bulletin dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"bulletin"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_shouldPlayLightsAndSirens];
    [v3 setObject:v9 forKey:@"shouldPlayLightsAndSirens"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  v10 = [NSNumber numberWithDouble:self->_date];
  [v3 setObject:v10 forKey:@"date"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  v11 = [NSNumber numberWithUnsignedInt:self->_updateType];
  [v3 setObject:v11 forKey:@"updateType"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    v7 = [NSNumber numberWithBool:self->_trafficRestricted];
    [v3 setObject:v7 forKey:@"trafficRestricted"];
  }
LABEL_8:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBAddBulletinRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_bulletin)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_8:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_bulletin)
  {
    id v6 = v4;
    objc_msgSend(v4, "setBulletin:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)v4 + 28) = self->_shouldPlayLightsAndSirens;
    *((unsigned char *)v4 + 32) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 1) = *(void *)&self->_date;
  *((unsigned char *)v4 + 32) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)v4 + 6) = self->_updateType;
  *((unsigned char *)v4 + 32) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    *((unsigned char *)v4 + 29) = self->_trafficRestricted;
    *((unsigned char *)v4 + 32) |= 8u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(BLTPBBulletin *)self->_bulletin copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v5 + 28) = self->_shouldPlayLightsAndSirens;
    *(unsigned char *)(v5 + 32) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(_DWORD *)(v5 + 24) = self->_updateType;
      *(unsigned char *)(v5 + 32) |= 2u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return (id)v5;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 8) = self->_date;
  *(unsigned char *)(v5 + 32) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(unsigned char *)(v5 + 29) = self->_trafficRestricted;
    *(unsigned char *)(v5 + 32) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  bulletin = self->_bulletin;
  if ((unint64_t)bulletin | *((void *)v4 + 2))
  {
    if (!-[BLTPBBulletin isEqual:](bulletin, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0) {
      goto LABEL_24;
    }
    if (self->_shouldPlayLightsAndSirens)
    {
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)v4 + 28))
    {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_date != *((double *)v4 + 1)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_updateType != *((_DWORD *)v4 + 6)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_24;
  }
  BOOL v6 = (*((unsigned char *)v4 + 32) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) != 0)
    {
      if (self->_trafficRestricted)
      {
        if (!*((unsigned char *)v4 + 29)) {
          goto LABEL_24;
        }
      }
      else if (*((unsigned char *)v4 + 29))
      {
        goto LABEL_24;
      }
      BOOL v6 = 1;
      goto LABEL_25;
    }
LABEL_24:
    BOOL v6 = 0;
  }
LABEL_25:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(BLTPBBulletin *)self->_bulletin hash];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v5 = 2654435761 * self->_shouldPlayLightsAndSirens;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v10 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double date = self->_date;
  double v7 = -date;
  if (date >= 0.0) {
    double v7 = self->_date;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_11:
  if ((has & 2) != 0)
  {
    uint64_t v11 = 2654435761 * self->_updateType;
    if ((has & 8) != 0) {
      goto LABEL_13;
    }
LABEL_15:
    uint64_t v12 = 0;
    return v5 ^ v3 ^ v10 ^ v11 ^ v12;
  }
  uint64_t v11 = 0;
  if ((has & 8) == 0) {
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v12 = 2654435761 * self->_trafficRestricted;
  return v5 ^ v3 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  bulletin = self->_bulletin;
  uint64_t v6 = *((void *)v4 + 2);
  if (bulletin)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    -[BLTPBBulletin mergeFrom:](bulletin, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    -[BLTPBAddBulletinRequest setBulletin:](self, "setBulletin:");
  }
  id v4 = v8;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 32);
  if ((v7 & 4) != 0)
  {
    self->_shouldPlayLightsAndSirens = *((unsigned char *)v4 + 28);
    *(unsigned char *)&self->_has |= 4u;
    char v7 = *((unsigned char *)v4 + 32);
    if ((v7 & 1) == 0)
    {
LABEL_9:
      if ((v7 & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 1) == 0)
  {
    goto LABEL_9;
  }
  self->_double date = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v7 = *((unsigned char *)v4 + 32);
  if ((v7 & 2) == 0)
  {
LABEL_10:
    if ((v7 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  self->_updateType = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
LABEL_11:
    self->_trafficRestricted = *((unsigned char *)v4 + 29);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_12:
  MEMORY[0x270F9A758]();
}

- (BLTPBBulletin)bulletin
{
  return self->_bulletin;
}

- (void)setBulletin:(id)a3
{
}

- (BOOL)shouldPlayLightsAndSirens
{
  return self->_shouldPlayLightsAndSirens;
}

- (double)date
{
  return self->_date;
}

- (unsigned)updateType
{
  return self->_updateType;
}

- (BOOL)trafficRestricted
{
  return self->_trafficRestricted;
}

- (void).cxx_destruct
{
}

@end